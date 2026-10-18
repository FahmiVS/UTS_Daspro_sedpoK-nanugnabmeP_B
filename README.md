# 🔮 Tarot Arcana — Ramalan & Gacha

Program berbasis **Free Pascal** yang menggabungkan simulasi ramalan kartu Tarot, sistem gacha, dan mini-game tebak makna kartu dalam antarmuka terminal berwarna.

Proyek ini dibuat sebagai latihan pemrograman Pascal dengan penggunaan percabangan, perulangan, array, validasi input, angka acak, serta pengelolaan statistik pemain.

> **Catatan:** Program ini dibuat untuk hiburan dan latihan pemrograman. Hasil ramalan bersifat fiktif, bukan prediksi masa depan yang nyata.

## ✨ Fitur

- **Intro animasi** — tampilan pembuka dengan efek loading, warna, dan dekorasi terminal.
- **Mode Eksplorasi** — membaca satu kartu atau tiga kartu (*masa lalu, masa sekarang, dan masa depan*).
- **Pilihan pengambilan kartu** — memilih kartu sendiri atau mengambil kartu secara acak.
- **Mode Tantangan** — sistem gacha dan mini-game tebak makna Tarot.
- **Sistem Gacha** — peluang kartu Common, Rare, dan Legendary dengan hadiah XP dan koin.
- **Koleksi kartu** — kumpulkan kartu dan lihat progres koleksi di profil pemain.
- **XP dan koin** — dapatkan XP dari tantangan dan koin dari gacha.
- **Profil pemain** — menampilkan statistik, koleksi, sisa jatah, dan gelar akhir.
- **Sistem gelar** — gelar ditentukan berdasarkan total XP setelah Challenge Mode selesai.
- **Validasi input** — memeriksa pilihan menu, nama pemain, metode, dan jawaban agar input tidak valid dapat ditangani.
- **Konfirmasi keluar** — tampilkan ringkasan permainan sebelum program ditutup.

## 🎮 Cara Bermain

### 1. Mulai sesi pemain

Pilih menu **4. Ganti Nama**, lalu masukkan nama pemain sepanjang 2–20 karakter. Nama hanya boleh berisi huruf dan spasi tunggal.

Pemain baru mendapatkan:
- **100 koin**
- **6 kesempatan Gacha**
- **4 kesempatan Tebak Tarot**

### 2. Menu utama

| Pilihan | Fungsi |
|---|---|
| `1` | Mode Eksplorasi: ramalan bebas |
| `2` | Mode Tantangan: Gacha dan Tebak Tarot |
| `3` | Melihat profil dan statistik pemain |
| `4` | Memulai sesi baru dengan nama pemain baru |
| `0` | Keluar dan melihat ringkasan permainan |

### 3. Mode Eksplorasi

- **Ramalan Satu Kartu** — menampilkan makna satu kartu.
- **Ramalan Tiga Kartu** — menampilkan kartu untuk masa lalu, masa sekarang, dan masa depan, lalu memberikan kesimpulan berdasarkan jumlah kartu tegak.
- Kartu bisa dipilih sendiri atau diambil secara acak.
- Mode ini tidak memberikan XP, koin, atau hadiah tantangan.

### 4. Mode Tantangan

**Gacha Tarot**
- Gacha satu kartu membutuhkan **15 koin**.
- Gacha tiga kartu membutuhkan **40 koin**.
- Peluang rarity: **Common 60%**, **Rare 30%**, dan **Legendary 10%**.
- Setiap rarity memberikan hadiah koin dan XP yang berbeda. Posisi kartu (tegak atau terbalik) juga memengaruhi XP.
- Kartu yang didapat dapat menambah koleksi pemain.

**Tebak Tarot**
- Jawab makna kartu berdasarkan empat pilihan jawaban.
- Setiap jawaban benar memberikan **15 XP**.
- Satu kesempatan terdiri dari enam pertanyaan.

Challenge Mode berakhir ketika jatah Tebak Tarot habis dan jatah Gacha habis atau koin tidak lagi cukup untuk melakukan gacha.

### 5. Gelar akhir

Gelar ditentukan berdasarkan total XP saat Challenge Mode selesai.

| Total XP | Gelar |
|---:|---|
| 420 ke atas | Sang Gacor Multiverse |
| 300–419 | CEO Keberuntungan |
| 200–299 | Dukun Magang Berlisensi |
| 100–199 | Anak Tarot Masa Percobaan |
| Di bawah 100 | NPC yang Salah Masuk Portal |

## 🃏 Kartu Tarot

Program menyediakan 12 kartu Tarot, masing-masing dengan makna posisi tegak dan terbalik:

1. The Fool
2. The Magician
3. The High Priestess
4. The Empress
5. The Emperor
6. The Hierophant
7. The Lovers
8. The Chariot
9. Strength
10. The Hermit
11. Wheel of Fortune
12. Justice

Setiap kartu memiliki interpretasi yang berbeda untuk posisi tegak dan terbalik, sehingga tersedia **24 variasi makna** untuk mode tebak Tarot.

## 🛠️ Teknologi

- **Bahasa:** Pascal
- **Compiler/runtime:** Free Pascal Compiler (FPC)
- **Antarmuka:** Terminal/console
- **Unit:** `crt` — digunakan untuk warna teks, posisi kursor, animasi, dan jeda.

## ▶️ Menjalankan Program

### Persyaratan

Pastikan Free Pascal Compiler sudah terpasang dan dapat dijalankan melalui terminal.

### Langkah-langkah

1. Clone repository ini atau unduh file sumber `ProjekUTS.pas`.
2. Buka terminal pada folder tempat file disimpan.
3. Compile program:

   ```bash
   fpc ProjekUTS.pas
   ```

4. Jalankan hasil kompilasi:

   **Windows**
   ```bash
   ProjekUTS.exe
   ```

   **Linux**
   ```bash
   ./ProjekUTS
   ```

> Program menggunakan unit `crt`. Tampilan warna, posisi kursor, dan karakter dekoratif dapat berbeda tergantung terminal dan sistem operasi yang digunakan.

## 📚 Konsep Pascal yang Digunakan

- Variabel dan konstanta
- Tipe data `string`, `char`, `boolean`, `longint`, dan `byte`
- Array untuk menyimpan makna serta pilihan jawaban
- Percabangan `if`, `case`
- Perulangan `for`, `repeat-until`, dan `while`-style flow melalui pengulangan
- Validasi input dengan `val`
- Bilangan acak menggunakan `randomize` dan `random`
- Manipulasi string menggunakan `copy`, `length`, dan `pos`
- Prosedur terminal dari unit `crt`, seperti `textcolor`, `gotoxy`, `clrscr`, dan `delay`
- Pengelolaan skor, koin, jatah, statistik, dan koleksi pemain

## 📁 Struktur Repository

```text
.
├── ProjekUTS.pas   # Source code utama program Tarot Arcana
└── README.md       # Dokumentasi repository
```

## ⚠️ Batasan

- Data pemain hanya disimpan selama program berjalan; belum menggunakan file atau database untuk penyimpanan permanen.
- Program menggunakan antarmuka terminal, bukan aplikasi grafis dengan tombol.
- Interpretasi kartu merupakan teks hiburan yang telah ditentukan di dalam kode, bukan ramalan yang dapat diverifikasi.

## 👤 Kontribusi

Saran, laporan bug, dan pengembangan fitur sangat dipersilakan melalui Issues atau Pull Requests.

---

**Tarot Arcana** — *Tarik kartu, kumpulkan XP, dan buktikan gelarmu!* ✨
