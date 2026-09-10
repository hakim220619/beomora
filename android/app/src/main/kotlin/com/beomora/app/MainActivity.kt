package com.beomora.app

import android.app.ActivityManager
import android.content.Context
import android.os.StatFs
import com.google.mlkit.common.model.DownloadConditions
import com.google.mlkit.common.model.RemoteModelManager
import com.google.mlkit.vision.digitalink.recognition.DigitalInkRecognitionModel
import com.google.mlkit.vision.digitalink.recognition.DigitalInkRecognitionModelIdentifier
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger

        // Kanal kecil "beomora/device": RAM total dan ruang kosong di
        // penyimpanan internal app, untuk cek sebelum mengunduh model
        // tulisan tangan (lihat lib/services/device_info_service.dart).
        MethodChannel(messenger, "beomora/device").setMethodCallHandler { call, result ->
            when (call.method) {
                "getResources" -> {
                    val am = getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
                    val mem = ActivityManager.MemoryInfo()
                    am.getMemoryInfo(mem)
                    val stat = StatFs(filesDir.path)
                    result.success(
                        mapOf(
                            "totalRamBytes" to mem.totalMem,
                            "availableRamBytes" to mem.availMem,
                            "freeStorageBytes" to stat.availableBytes,
                        )
                    )
                }
                else -> result.notImplemented()
            }
        }

        // Kanal "beomora/ink": cek/unduh/hapus model ML Kit Digital Ink.
        // Plugin google_mlkit_digital_ink_recognition 0.15.0 di Android
        // punya manageModel kosong (tidak pernah membalas) dan nama kanal
        // yang tidak cocok dengan sisi Dart, jadi pengelolaan model
        // dilakukan di sini dengan format pesan yang sama seperti plugin
        // (method "vision#manageInkModels", arg task/model/wifi).
        MethodChannel(messenger, "beomora/ink").setMethodCallHandler { call, result ->
            if (call.method != "vision#manageInkModels") {
                result.notImplemented()
                return@setMethodCallHandler
            }
            val tag = call.argument<String>("model")
            val identifier = try {
                if (tag == null) null else DigitalInkRecognitionModelIdentifier.fromLanguageTag(tag)
            } catch (e: Exception) {
                null
            }
            if (identifier == null) {
                result.error("model", "Tidak ada model tulisan tangan untuk bahasa '$tag'", null)
                return@setMethodCallHandler
            }
            val model = DigitalInkRecognitionModel.builder(identifier).build()
            val manager = RemoteModelManager.getInstance()
            val fail = { e: Exception -> result.error("error", e.toString(), null) }
            when (call.argument<String>("task")) {
                "check" -> manager.isModelDownloaded(model)
                    .addOnSuccessListener { result.success(it) }
                    .addOnFailureListener(fail)
                "download" -> {
                    val wifi = call.argument<Boolean>("wifi") ?: false
                    val conditions = DownloadConditions.Builder()
                        .apply { if (wifi) requireWifi() }
                        .build()
                    manager.download(model, conditions)
                        .addOnSuccessListener { result.success("success") }
                        .addOnFailureListener(fail)
                }
                "delete" -> manager.deleteDownloadedModel(model)
                    .addOnSuccessListener { result.success("success") }
                    .addOnFailureListener(fail)
                else -> result.notImplemented()
            }
        }
    }
}
