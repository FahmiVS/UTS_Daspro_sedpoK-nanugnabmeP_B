# 🔮 ALTAR : Aesthetic Pascal Tarot Card

**ALTAR** adalah program permainan berbasis teks yang dibuat menggunakan bahasa pemrograman **Pascal**. Program ini menggabungkan simulasi ramalan kartu Tarot dengan mekanisme gacha, sistem perkembangan pemain, serta tampilan terminal yang penuh warna.

Proyek ini dibuat untuk menerapkan konsep dasar pemrograman, seperti variabel, percabangan, perulangan, prosedur input-output, validasi masukan, dan penggunaan angka acak dalam sebuah permainan interaktif.

## ✨ Fitur Utama

-  **Ramalan Satu Kartu** — Pilih satu kartu untuk mendapatkan interpretasi ramalan.
-  **Ramalan Tiga Kartu** — Jelajahi makna masa lalu, masa sekarang, dan masa depan.
-  **Sistem Gacha** — Dapatkan kartu secara acak dengan tiga tingkat kelangkaan.
-  **Sistem Rarity** — Kartu dibagi menjadi Common, Rare, dan Legendary.
-  **Pity System** — Legendary dijamin setelah 10 tarikan tanpa mendapatkan Legendary.
-  **Sistem Koin** — Dapatkan dan gunakan koin untuk melakukan gacha.
-  **Sistem XP dan Rank** — Tingkatkan pengalaman dan pangkat pemain.
-  **Profil Pemain** — Lihat statistik permainan, total ramalan, gacha, dan kartu Legendary.
-  **Tampilan Terminal Berwarna** — Dilengkapi animasi loading, efek visual, dan antarmuka berbasis teks.
-  **Validasi Input** — Memeriksa masukan pengguna untuk mengurangi kesalahan saat bermain.

## 🃏 Daftar Kartu Tarot

ALTAR memiliki 12 kartu yang terbagi ke dalam tiga tingkat kelangkaan.

| No. | Nama Kartu | Rarity |
|:---:|---|---|
| 1 | The Fool | Common |
| 2 | The Magician | Common |
| 3 | The High Priestess | Common |
| 4 | The Empress | Common |
| 5 | The Emperor | Common |
| 6 | The Hierophant | Common |
| 7 | The Lovers | Rare |
| 8 | The Chariot | Rare |
| 9 | Strength | Rare |
| 10 | The Hermit | Rare |
| 11 | Wheel of Fortune | Legendary |
| 12 | Justice | Legendary |

Setiap kartu memiliki interpretasi berbeda berdasarkan posisinya, yaitu **Tegak (Upright)** atau **Terbalik (Reversed)**.

## Sistem Gacha

Pemain dapat memilih gacha satu kartu atau tiga kartu menggunakan koin.

| Rarity | Peluang | Hadiah per Kartu |
|---|:---:|---:|
| Common | 60% | +3 koin |
| Rare | 30% | +8 koin |
| Legendary | 10% | +25 koin |

**Biaya gacha:**
- 1 kartu: 10 koin.
- 3 kartu: 30 koin.

Setiap kartu yang diperoleh melalui gacha juga memberikan **+5 XP**. Jika pemain tidak memperoleh Legendary selama 10 tarikan, sistem pity menjamin Legendary pada tarikan berikutnya.

*Catatan: Peluang di atas merupakan peluang dasar setiap tarikan. Mekanisme pity memengaruhi peluang ketika jaminan Legendary aktif.*

## Sistem Level dan Rank

Kumpulkan XP untuk meningkatkan pangkat dan mencapai posisi tertinggi!

| Rank | Persyaratan XP |
|---|---:|
| Pemula | 0–49 XP |
| Peramal Muda | 50–149 XP |
| Peramal Handal | 150–299 XP |
| Master Tarot | 300–499 XP |
| Grandmaster Arcana | 500 XP atau lebih |

Pemain memulai permainan dengan **100 koin**, 0 XP, dan tiga kesempatan bantuan koin. Jika saldo koin kurang dari 10, sistem dapat memberikan bantuan sebesar 20 koin selama kesempatan bantuan masih tersedia.

Ramalan biasa juga memberikan hadiah koin dan XP pada maksimal 10 sesi ramalan berhadiah.

## Teknologi yang Digunakan

- **Bahasa Pemrograman:** Pascal
- **Unit:** `crt`
- **Pengacakan:** `randomize` dan `random`
- **Antarmuka:** Command-Line Interface (CLI) / terminal
- **Konsep Pemrograman:** Variabel, konstanta, tipe data, percabangan `if` dan `case`, perulangan `for`, `repeat-until`, validasi input, serta operasi aritmetika.


## Cara Bermain

1. Jalankan program Tarot Arcana.
2. Masukkan nama pemain dengan panjang 2–20 karakter, menggunakan huruf dan spasi tunggal.
3. Pilih menu yang tersedia:
   - `1` — Ramalan Satu Kartu.
   - `2` — Ramalan Tiga Kartu.
   - `3` — Gacha Kartu.
   - `4` — Profil Pemain.
   - `5` — Ganti Nama.
   - `0` — Keluar.
4. Pilih mode ramalan atau jenis gacha yang tersedia.
5. Baca interpretasi kartu dan kumpulkan hadiah.
6. Tingkatkan XP hingga mencapai **Grandmaster Arcana**.


## Tujuan Proyek

Proyek ini bertujuan untuk mengimplementasikan materi dasar pemrograman Pascal ke dalam sebuah aplikasi permainan sederhana yang interaktif.

Melalui proyek ini, konsep pemrograman dapat dipelajari melalui implementasi sistem menu, pengolahan data pemain, pengacakan kartu, validasi masukan, perhitungan hadiah, dan perkembangan XP.

## Catatan

- Program berjalan melalui terminal, bukan antarmuka grafis.
- Statistik dan progres pemain disimpan selama program berjalan; kode saat ini belum menyediakan penyimpanan permanen ke file atau database.
- Ramalan Tarot dalam program ini merupakan bagian dari hiburan dan simulasi permainan, bukan prediksi masa depan yang pasti.

## 👥 Kontributor

**Nama:** 
- Muhammad Abdullah Fahmi - 261401073
- Arif Rahady Syafiq Siregar - 261401110
- Muhammad Haikal Faiz Tanjung - 261401123

**Kelompok:** sedpoK nanugnabmeP  

**Mata Kuliah:** Dasar Pemrograman
