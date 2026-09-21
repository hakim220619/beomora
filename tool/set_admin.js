#!/usr/bin/env node
// Tambah / cabut admin Beomora tanpa Firebase Console.
//
// Membuat (atau menghapus) dokumen `admins/<email>` di Firestore memakai
// sesi login Firebase CLI yang sudah ada (`firebase login`), sehingga tidak
// perlu service account key.
//
//   node tool/set_admin.js nama@gmail.com            # jadikan admin
//   node tool/set_admin.js nama@gmail.com --remove   # cabut admin
//   node tool/set_admin.js nama@gmail.com --project beomora-64d64
//
// Setelah itu publish rules (kalau belum):
//   firebase deploy --only firestore:rules
'use strict';

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

function usage(msg) {
  if (msg) console.error(`Error: ${msg}\n`);
  console.error('Pakai: node tool/set_admin.js <email> [--remove] [--project <id>]');
  process.exit(msg ? 1 : 0);
}

// ---------- argumen ----------
const args = process.argv.slice(2);
let email = null;
let remove = false;
let project = null;
for (let i = 0; i < args.length; i++) {
  const a = args[i];
  if (a === '--remove') remove = true;
  else if (a === '--project') project = args[++i];
  else if (a === '-h' || a === '--help') usage();
  else if (!email) email = a;
  else usage(`argumen tidak dikenal: ${a}`);
}
if (!email) usage('email belum diisi');
email = email.trim().toLowerCase();
if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) usage(`bukan alamat email valid: ${email}`);

// ---------- project id dari .firebaserc ----------
if (!project) {
  const rcPath = path.join(__dirname, '..', '.firebaserc');
  try {
    project = JSON.parse(fs.readFileSync(rcPath, 'utf8')).projects.default;
  } catch (_) {
    usage('tidak bisa membaca project default dari .firebaserc; pakai --project');
  }
}

// ---------- temukan instalasi firebase-tools ----------
function findFirebaseTools() {
  let bin;
  try {
    bin = execSync('which firebase', { encoding: 'utf8' }).trim();
  } catch (_) {
    throw new Error('perintah `firebase` tidak ditemukan; pasang Firebase CLI dulu');
  }
  let dir = path.dirname(fs.realpathSync(bin));
  // naik sampai menemukan package.json bernama firebase-tools
  for (let i = 0; i < 6; i++) {
    const pkg = path.join(dir, 'package.json');
    if (fs.existsSync(pkg)) {
      try {
        if (JSON.parse(fs.readFileSync(pkg, 'utf8')).name === 'firebase-tools') return dir;
      } catch (_) {}
    }
    dir = path.dirname(dir);
  }
  throw new Error('folder firebase-tools tidak ditemukan dari lokasi binary firebase');
}

async function main() {
  const root = findFirebaseTools();
  const { requireAuth } = require(path.join(root, 'lib', 'requireAuth'));
  const { Client } = require(path.join(root, 'lib', 'apiv2'));
  const auth = require(path.join(root, 'lib', 'auth'));

  // Tiru langkah persiapan perintah CLI: ambil akun default hasil
  // `firebase login` (per proyek kalau ada, kalau tidak global), isi ke
  // options, lalu requireAuth mengisi refresh token untuk apiv2.Client.
  const options = { project, projectId: project, projectRoot: path.join(__dirname, '..') };
  let account = null;
  if (typeof auth.getProjectDefaultAccount === 'function') {
    account = auth.getProjectDefaultAccount(options.projectRoot);
  }
  if (!account && typeof auth.getGlobalDefaultAccount === 'function') {
    account = auth.getGlobalDefaultAccount();
  }
  if (!account) {
    throw new Error(
      'tidak ada akun login Firebase CLI; jalankan `firebase login` dulu ' +
        `(fungsi auth tersedia: ${Object.keys(auth).sort().join(', ')})`,
    );
  }
  options.user = account.user;
  options.tokens = account.tokens;
  if (typeof auth.setActiveAccount === 'function') auth.setActiveAccount(options, account);
  console.log(`Akun CLI: ${account.user && account.user.email}`);
  await requireAuth(options);

  const client = new Client({
    urlPrefix: 'https://firestore.googleapis.com',
    apiVersion: 'v1',
    auth: true,
  });
  const docPath =
    `/projects/${project}/databases/(default)/documents/admins/${encodeURIComponent(email)}`;

  if (remove) {
    await client.request({ method: 'DELETE', path: docPath });
    console.log(`✔ admins/${email} dihapus dari project ${project}.`);
    return;
  }

  const res = await client.request({
    method: 'PATCH',
    path: docPath,
    body: {
      fields: {
        note: { stringValue: 'admin Beomora' },
        addedAt: { timestampValue: new Date().toISOString() },
      },
    },
  });
  console.log(`✔ admins/${email} dibuat di project ${project}.`);
  if (res && res.body && res.body.updateTime) console.log(`  updateTime: ${res.body.updateTime}`);
  console.log('\nLangkah berikutnya (kalau rules belum dipublish):');
  console.log('  firebase deploy --only firestore:rules');
  console.log('Lalu logout + login lagi di aplikasi agar menu admin muncul di Pengaturan.');
}

main().catch((e) => {
  const msg = (e && (e.message || String(e))) || 'gagal';
  console.error(`✖ ${msg}`);
  if (/Unable to authenticate|login/i.test(msg)) {
    console.error('  Coba jalankan `firebase login` dulu.');
  }
  process.exit(1);
});
