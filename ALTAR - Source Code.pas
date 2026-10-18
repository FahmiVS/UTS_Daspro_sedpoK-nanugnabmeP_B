program TarotArcana;

uses crt;

const
  GarisSama  = '========================================';
  GarisStrip = '----------------------------------------';
  JudulOpen  = 'T A R O T   A R C A N A';

var
  nama, gelar, s, c, tj, nmKartu, baik, buruk, rar, tx: string;
  oA, oB, oC, oD, koleksi, pakai: string;
  makna: array[1..24] of string;
  opsi: array[1..4] of string;
  koin, xp, sisaG, sisaT: longint;
  totalRamalan, totalGacha, totalLegendary: longint;
  pilih, sub, jumlah, i, n, j, step, v, kode, psn, tegak, idx: longint;
  jenis, cara, kunci, k, m, d1, d2, d3, benar, roll: longint;
  bonus, biaya, xpHadiah, legend, hasil, c1, c2, c3: longint;
  sp: char; wr: byte;
  valid, batal, selesai, baru, tampil: boolean;

begin
  randomize;

  idx := 1;
  for i := 1 to 12 do
  begin
    case i of
      1:
        begin
          nmKartu := 'The Fool';
          baik := 'Awal baru penuh peluang, berani melangkah membawa untung';
          buruk := 'Gegabah tanpa perhitungan, langkah sembrono berujung rugi';
        end;
      2:
        begin
          nmKartu := 'The Magician';
          baik := 'Kemampuan Anda bersinar, ide kreatif jadi kenyataan';
          buruk := 'Bakat terbuang percuma, rencana licik berbalik menjerat';
        end;
      3:
        begin
          nmKartu := 'The High Priestess';
          baik := 'Intuisi tajam, jawaban datang dari dalam hati';
          buruk := 'Firasat diabaikan, rahasia tersembunyi membuat bingung';
        end;
      4:
        begin
          nmKartu := 'The Empress';
          baik := 'Kelimpahan dan kasih sayang mengalir untuk Anda';
          buruk := 'Terlalu bergantung pada orang lain, kreativitas macet';
        end;
      5:
        begin
          nmKartu := 'The Emperor';
          baik := 'Kepemimpinan kuat membawa stabilitas dan kemajuan';
          buruk := 'Sikap kaku dan keras kepala memicu konflik besar';
        end;
      6:
        begin
          nmKartu := 'The Hierophant';
          baik := 'Bimbingan guru dan tradisi menuntun ke jalan yang benar';
          buruk := 'Terjebak aturan usang, bimbingan justru menyesatkan';
        end;
      7:
        begin
          nmKartu := 'The Lovers';
          baik := 'Cinta tulus dan pilihan tepat menyatukan hati';
          buruk := 'Salah memilih dan hubungan retak karena ketidakjujuran';
        end;
      8:
        begin
          nmKartu := 'The Chariot';
          baik := 'Tekad baja membawa Anda menuju kemenangan';
          buruk := 'Kehilangan arah, ambisi buta berujung kegagalan';
        end;
      9:
        begin
          nmKartu := 'Strength';
          baik := 'Keberanian dan ketenangan menaklukkan semua rintangan';
          buruk := 'Keraguan diri melemahkan semangat dan mengundang masalah';
        end;
      10:
        begin
          nmKartu := 'The Hermit';
          baik := 'Menyepi sejenak membawa pencerahan dan jati diri';
          buruk := 'Kesepian berlebihan, menjauh dari orang-orang terdekat';
        end;
      11:
        begin
          nmKartu := 'Wheel of Fortune';
          baik := 'Roda keberuntungan berputar naik, rezeki datang';
          buruk := 'Nasib berbalik mendadak, siap hadapi perubahan pahit';
        end;
      12:
        begin
          nmKartu := 'Justice';
          baik := 'Kejujuran dibalas adil, keputusan penting seimbang';
          buruk := 'Ketidakadilan menimpa, keputusan berat sebelah merugikan';
        end;
      else
        begin
          nmKartu := 'Unknown';
          baik := 'Makna kartu tidak tersedia';
          buruk := 'Makna kartu tidak tersedia';
        end;
    end;
    makna[idx] := baik;
    inc(idx);
    makna[idx] := buruk;
    inc(idx);
  end;

  cursoroff;
  clrscr;

  for n := 16 to 65 do
  begin
    textcolor(9 + n mod 6);
    gotoxy(n, 4); write(chr(205));
    gotoxy(n, 20); write(chr(205));
    delay(8);
  end;
  for n := 5 to 19 do
  begin
    textcolor(9 + n mod 6);
    gotoxy(15, n); write(chr(186));
    gotoxy(66, n); write(chr(186));
    delay(25);
  end;
  textcolor(LightMagenta);
  gotoxy(15, 4); write(chr(201)); gotoxy(66, 4); write(chr(187));
  gotoxy(15, 20); write(chr(200)); gotoxy(66, 20); write(chr(188));

  for n := 1 to length(JudulOpen) do
  begin
    textcolor(9 + n mod 6);
    gotoxy(28 + n, 6); write(copy(JudulOpen, n, 1));
    delay(45);
  end;
  textcolor(Yellow); gotoxy(29, 6); write(JudulOpen);
  textcolor(LightCyan); gotoxy(28, 8); write('- Ramalan & Gacha Kartu -');
  textcolor(White); gotoxy(19, 14); write('['); gotoxy(60, 14); write(']');

  for step := 1 to 40 do
  begin
    j := (step - 1) mod 10 + 1;

    case step mod 4 of
      0: sp := '|';
      1: sp := '/';
      2: sp := '-';
      3: sp := '\';
    end;

    textcolor(Yellow);
    gotoxy(33, 11); write(sp);
    gotoxy(47, 11); write(sp);

    textcolor(9 + step mod 6);
    gotoxy(36, 11); write(copy('LOADING...', 1, j), '':10 - j);

    case (step - 1) div 10 of
      0: textcolor(LightRed);
      1: textcolor(Yellow);
      2: textcolor(LightGreen);
      3: textcolor(LightCyan);
    end;

    gotoxy(19 + step, 14); write(chr(219));
    textcolor(White);
    gotoxy(62, 14); write(step * 100 div 40 : 3, '%');

    if (step - 1) mod 14 = 0 then
    begin
      case (step - 1) div 14 of
        0: tj := 'Mengocok dek kartu Arcana...';
        1: tj := 'Memanggil 12 kartu takdir...';
        2: tj := 'Menyiapkan mesin gacha...';
      end;
      gotoxy(16, 16); write('':50);
      textcolor(LightCyan);
      gotoxy(16 + (50 - length(tj)) div 2, 16); write(tj);
    end;

    for n := 1 to 3 do
    begin
      case random(4) of
        0: gotoxy(1 + random(78), 1 + random(3));
        1: gotoxy(1 + random(78), 22 + random(3));
        2: gotoxy(1 + random(12), 4 + random(17));
        3: gotoxy(68 + random(11), 4 + random(17));
      end;
      textcolor(8 + random(8));
      write(chr(42 + random(3)));
    end;

    delay(100);
  end;

  gotoxy(16, 11); write('':50);
  gotoxy(16, 16); write('':50);

  for n := 1 to 8 do
  begin
    if odd(n) then
      textcolor(LightGreen)
    else
      textcolor(White);
    gotoxy(32, 11); write('* LOAD COMPLETE! *');
    delay(150);
  end;
  delay(500);
  textcolor(LightGray);
  clrscr;
  cursoron;

  // Data awal. XP, koin, jatah, dan koleksi baru diisi saat nama dimasukkan (menu 4)
  baru := true; selesai := false; tampil := false; pilih := 4; nama := ''; gelar := ''; xp := 0; koin := 0; sisaG := 0; sisaT := 0; totalRamalan := 0; totalGacha := 0; totalLegendary := 0; koleksi := ''; pakai := '';

  textcolor(LightMagenta); writeln(GarisSama);
  textcolor(Yellow); writeln('        TAROT ARCANA - RAMALAN & GACHA');
  textcolor(LightMagenta); writeln(GarisSama);

  repeat
    if tampil then
    begin
      tampil := false;
      pilih := 3; // loncat ke profil akhir
    end
    else if not baru then
    begin
      writeln;
      textcolor(LightMagenta); writeln(GarisSama);
      textcolor(Yellow); writeln('            MENU UTAMA - TAROT');
      textcolor(LightMagenta); writeln(GarisSama);
      textcolor(LightGray); write(' Pemain  : '); textcolor(White); writeln(nama);
      textcolor(LightGray); write(' XP      : '); textcolor(LightCyan); writeln(xp);
      textcolor(LightGray); write(' Koin    : '); textcolor(Yellow); writeln(koin);
      textcolor(DarkGray); writeln(GarisStrip);
      textcolor(LightCyan); writeln(' 1. Mode Eksplorasi (ramalan bebas)');
      textcolor(LightMagenta); writeln(' 2. Mode Tantangan (Gacha & Tebak Tarot)');
      textcolor(White); writeln(' 3. Profil Pemain');
      textcolor(Yellow); writeln(' 4. Ganti Nama (mulai sesi baru)');
      textcolor(Red); writeln(' 0. Keluar');
      textcolor(DarkGray); writeln(GarisStrip);
      textcolor(LightRed);
      writeln(' SECRET MISSION: Kumpulkan XP sebanyak-banyaknya dan buktikan gelar');
      writeln(' apa yang pantas kamu dapatkan. Anjay, jangan sampai jadi NPC di dunia Tarot!');
      textcolor(LightMagenta); writeln(GarisSama);

      repeat
        textcolor(Yellow); write('Masukkan nomor menu (0 sampai 4): ');
        textcolor(White); readln(s); val(s, v, kode);
        if (kode = 0) and (v >= 0) and (v <= 4) then
          break;
        textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 4.');
      until false;

      pilih := v;
    end;

    case pilih of

      1, 2:  // 1 = Mode Eksplorasi, 2 = Mode Tantangan
        begin
          if (pilih = 2) and selesai then
          begin
            textcolor(LightRed);
            writeln('Challenge Mode sudah selesai dan tidak dapat diulang. Lihat Profil Pemain.');
          end
          else
            repeat
              writeln; textcolor(LightMagenta);
              if pilih = 1 then
              begin
                writeln('=== MODE EKSPLORASI (bebas, tanpa XP/koin/jatah) ===');
                textcolor(LightCyan); writeln(' 1. Ramalan Satu Kartu'); writeln(' 2. Ramalan Tiga Kartu');
              end
              else
              begin
                writeln('=== MODE TANTANGAN ===');
                textcolor(LightCyan);
                writeln(' 1. Gacha Tarot (sisa jatah: ', sisaG, ' dari 6)');
                writeln(' 2. Tebak Tarot (sisa jatah: ', sisaT, ' dari 4)');
              end;
              textcolor(Red); writeln(' 0. Kembali ke menu utama');
              repeat
                textcolor(Yellow); write('Pilih menu (0 sampai 2): '); textcolor(White); readln(s); val(s, v, kode);
                if (kode = 0) and (v >= 0) and (v <= 2) then break;
                textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 2.');
              until false;
              sub := v;
              if sub = 0 then break;

              // jenis: 1 = ramalan Eksplorasi, 2 = Gacha, 3 = Tebak Tarot
              jenis := 1; jumlah := 1; cara := 2; kunci := 1;
              if pilih = 1 then
              begin
                if sub = 2 then jumlah := 3;
                textcolor(LightGray); writeln('Metode: 1 = Pilih kartu sendiri, 2 = Cabut kartu acak');
                repeat
                  textcolor(Yellow); write('Pilih metode (1 sampai 2, 0 = batal): '); textcolor(White); readln(s); val(s, v, kode);
                  if (kode = 0) and (v >= 0) and (v <= 2) then break;
                  textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 2.');
                until false;
                cara := v;
                if cara = 0 then continue;
              end
              else if sub = 1 then
              begin
                if sisaG = 0 then begin textcolor(LightRed); writeln('Jatah Gacha telah habis!'); continue; end;
                jenis := 2;
                textcolor(LightMagenta); writeln('=== GACHA TAROT ===');
                textcolor(LightGray); write('Peluang : '); textcolor(White); write('Common 60%');
                textcolor(LightGray); write(' | '); textcolor(LightCyan); write('Rare 30%');
                textcolor(LightGray); write(' | '); textcolor(Yellow); writeln('Legendary 10%');
                textcolor(Brown); writeln('Hadiah koin: Common +3 | Rare +8 | Legendary +25');
                writeln('XP tegak: Common 5 | Rare 12 | Legendary 20');
                writeln('XP terbalik: Common 2 | Rare 5 | Legendary 13');
                textcolor(Yellow); writeln('Koin Anda: ', koin);
                textcolor(LightCyan); writeln('1 = Gacha Satu Kartu (15 koin)'); writeln('2 = Gacha Tiga Kartu (40 koin)');
                repeat
                  textcolor(Yellow); write('Pilih jenis gacha (1 sampai 2, 0 = batal): '); textcolor(White); readln(s); val(s, v, kode);
                  if (kode = 0) and (v >= 0) and (v <= 2) then break;
                  textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 2.');
                until false;
                if v = 0 then continue;
                if v = 1 then jumlah := 1 else jumlah := 3;
                if jumlah = 1 then biaya := 15 else biaya := 40;
                if koin < biaya then  // ditolak, data pemain tidak berubah
                begin
                  textcolor(LightRed); writeln('Koin tidak cukup! Butuh ', biaya, ' koin, koin Anda ', koin);
                  continue;
                end;
                dec(koin, biaya); dec(sisaG);
              end
              else
              begin
                if sisaT = 0 then begin textcolor(LightRed); writeln('Jatah Tebak Tarot telah habis!'); continue; end;
                jenis := 3; jumlah := 6; dec(sisaT);
                textcolor(LightCyan); writeln('=== TEBAK TAROT - Kesempatan ke-', 4 - sisaT, ' dari 4 ===');
              end;

              if (jenis > 1) or (cara = 2) then
              begin
                textcolor(LightMagenta); write('Mengocok dek');
                for j := 1 to 6 do begin textcolor(8 + j); write('.'); delay(150); end;
                writeln;
              end;
              c1 := 0; c2 := 0; c3 := 0; tegak := 0; legend := 0; hasil := 0; benar := 0; batal := false;

              for i := 1 to jumlah do
              begin
                // 1. Menentukan kartu (n) dan posisi (psn)
                if jenis = 3 then
                begin
                  repeat idx := 1 + random(24); until copy(pakai, idx, 1) = '0';  // 24 makna unik: 12 kartu x 2 posisi
                  pakai := copy(pakai, 1, idx - 1) + '1' + copy(pakai, idx + 1, 24 - idx);
                  kunci := 1 + random(4);
                  n := (idx + 1) div 2;
                  if odd(idx) then psn := 1 else psn := 2;
                end
                else if jenis = 2 then
                begin
                  repeat
                    roll := random(100);
                    if roll < 60 then n := 1 + random(6)
                    else if roll < 90 then n := 7 + random(4)
                    else n := 11 + random(2);
                  until (n <> c1) and (n <> c2) and (n <> c3);
                  psn := 1 + random(2);
                  if odd(psn) then idx := 2 * n - 1 else idx := 2 * n;
                end
                else if cara = 1 then
                begin
                  repeat
                    repeat
                      textcolor(Yellow); write('Nomor kartu ke-', i, ' (1 sampai 12, 0 = batal): ');
                      textcolor(White); readln(s); val(s, v, kode);
                      if (kode = 0) and (v >= 0) and (v <= 12) then break;
                      textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 12.');
                    until false;
                    n := v;
                    if (n > 0) and ((n = c1) or (n = c2) or (n = c3)) then
                    begin textcolor(LightRed); writeln('Kartu sudah dipilih, pilih kartu lain!'); end;
                  until (n = 0) or ((n <> c1) and (n <> c2) and (n <> c3));
                  if n = 0 then begin batal := true; break; end;
                  repeat
                    textcolor(Yellow); write('Posisi (1 = tegak, 2 = terbalik, 0 = batal): '); textcolor(White); readln(s); val(s, v, kode);
                    if (kode = 0) and (v >= 0) and (v <= 2) then break;
                    textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 0 sampai 2.');
                  until false;
                  psn := v;
                  if psn = 0 then begin batal := true; break; end;
                  if odd(psn) then idx := 2 * n - 1 else idx := 2 * n;
                end
                else
                begin
                  repeat n := 1 + random(12); until (n <> c1) and (n <> c2) and (n <> c3);
                  psn := 1 + random(2);
                  if odd(psn) then idx := 2 * n - 1 else idx := 2 * n;
                end;
                if i = 1 then c1 := n else if i = 2 then c2 := n else c3 := n;
                if psn = 1 then inc(tegak);

                // 2. Mengambil data kartu. Di Tebak Tarot, kita pakai 24 makna sebenarnya
                // yaitu 12 kartu dikali 2 posisi (tegak / terbalik).
                d1 := 0; d2 := 0; d3 := 0;
                case n of
                  1: begin nmKartu := 'The Fool'; baik := 'Awal baru penuh peluang, berani melangkah membawa untung'; buruk := 'Gegabah tanpa perhitungan, langkah sembrono berujung rugi'; end;
                  2: begin nmKartu := 'The Magician'; baik := 'Kemampuan Anda bersinar, ide kreatif jadi kenyataan'; buruk := 'Bakat terbuang percuma, rencana licik berbalik menjerat'; end;
                  3: begin nmKartu := 'The High Priestess'; baik := 'Intuisi tajam, jawaban datang dari dalam hati'; buruk := 'Firasat diabaikan, rahasia tersembunyi membuat bingung'; end;
                  4: begin nmKartu := 'The Empress'; baik := 'Kelimpahan dan kasih sayang mengalir untuk Anda'; buruk := 'Terlalu bergantung pada orang lain, kreativitas macet'; end;
                  5: begin nmKartu := 'The Emperor'; baik := 'Kepemimpinan kuat membawa stabilitas dan kemajuan'; buruk := 'Sikap kaku dan keras kepala memicu konflik besar'; end;
                  6: begin nmKartu := 'The Hierophant'; baik := 'Bimbingan guru dan tradisi menuntun ke jalan yang benar'; buruk := 'Terjebak aturan usang, bimbingan justru menyesatkan'; end;
                  7: begin nmKartu := 'The Lovers'; baik := 'Cinta tulus dan pilihan tepat menyatukan hati'; buruk := 'Salah memilih dan hubungan retak karena ketidakjujuran'; end;
                  8: begin nmKartu := 'The Chariot'; baik := 'Tekad baja membawa Anda menuju kemenangan'; buruk := 'Kehilangan arah, ambisi buta berujung kegagalan'; end;
                  9: begin nmKartu := 'Strength'; baik := 'Keberanian dan ketenangan menaklukkan semua rintangan'; buruk := 'Keraguan diri melemahkan semangat dan mengundang masalah'; end;
                  10: begin nmKartu := 'The Hermit'; baik := 'Menyepi sejenak membawa pencerahan dan jati diri'; buruk := 'Kesepian berlebihan, menjauh dari orang-orang terdekat'; end;
                  11: begin nmKartu := 'Wheel of Fortune'; baik := 'Roda keberuntungan berputar naik, rezeki datang'; buruk := 'Nasib berbalik mendadak, siap hadapi perubahan pahit'; end;
                  12: begin nmKartu := 'Justice'; baik := 'Kejujuran dibalas adil, keputusan penting seimbang'; buruk := 'Ketidakadilan menimpa, keputusan berat sebelah merugikan'; end;
                  else begin nmKartu := 'Unknown'; baik := 'Makna kartu tidak tersedia'; buruk := 'Makna kartu tidak tersedia'; end;
                end;
                tx := makna[idx];
                if jenis = 3 then
                begin
                  for k := 1 to 4 do opsi[k] := '';
                  opsi[kunci] := tx;
                  for k := 1 to 4 do
                  begin
                    if k = kunci then continue;
                    repeat
                      m := 1 + random(24);
                    until (m <> idx) and (m <> d1) and (m <> d2) and (m <> d3) and
                          (makna[m] <> tx);
                    if d1 = 0 then d1 := m else if d2 = 0 then d2 := m else d3 := m;
                    opsi[k] := makna[m];
                  end;
                  oA := opsi[1]; oB := opsi[2]; oC := opsi[3]; oD := opsi[4];
                end;
                if (n - 1) mod 12 < 6 then begin rar := 'Common'; wr := White; end
                else if (n - 1) mod 12 < 10 then begin rar := 'Rare'; wr := LightCyan; end
                else begin rar := 'Legendary'; wr := Yellow; end;

                // 3. Menampilkan kartu
                textcolor(DarkGray); writeln(GarisStrip);
                textcolor(Cyan);
                if jenis = 3 then writeln('SOAL ', i, ' DARI 6')
                else if jumlah = 1 then writeln('KARTU ANDA')
                else
                  case i of
                    1: writeln('MASA LALU');
                    2: writeln('MASA SEKARANG');
                    3: writeln('MASA DEPAN');
                  end;
                textcolor(LightGray); write('Kartu   : ');
                textcolor(wr); writeln(nmKartu, ' (No. ', n, ') [', rar, ']');
                textcolor(LightGray); write('Posisi  : ');
                if psn = 1 then begin textcolor(LightGreen); writeln('Tegak'); end
                else begin textcolor(LightRed); writeln('Terbalik'); end;
                if jenis < 3 then  // Eksplorasi dan Gacha menampilkan makna kartu
                begin
                  textcolor(LightGray);
                  if psn = 1 then begin write('Terbaik : '); textcolor(LightGreen); end
                  else begin write('Terburuk: '); textcolor(LightRed); end;
                  writeln(tx);
                end;

                if jenis = 3 then  // pertanyaan Tebak Tarot
                begin
                  textcolor(Yellow); writeln('Apa makna kartu ini pada posisi tersebut?');
                  textcolor(White);
                  writeln('A. ', oA); writeln('B. ', oB); writeln('C. ', oC); writeln('D. ', oD);
                  repeat
                    textcolor(Yellow); write('Jawaban (A sampai D): '); textcolor(White); readln(s);
                    v := 0;
                    if length(s) = 1 then v := pos(s, 'ABCDabcd');
                    if v > 4 then v := v - 4;
                    if v > 0 then break;
                    textcolor(LightRed); writeln('Input tidak valid! Masukkan huruf A sampai D.');
                  until false;
                  if v = kunci then
                  begin inc(benar); inc(xp, 15); textcolor(LightGreen); writeln('BENAR! +15 XP'); end
                  else
                  begin textcolor(LightRed); writeln('SALAH! +0 XP. Jawaban benar: ', chr(64 + kunci), '. ', tx); end;
                end
                else if jenis = 2 then  // hanya Gacha memberi hadiah dan mengisi koleksi
                begin
                  if rar = 'Legendary' then
                  begin
                    inc(legend); inc(totalLegendary);
                    textcolor(Yellow); writeln('*** * * *  L E G E N D A R Y  * * * ***');
                  end;
                  if rar = 'Common' then bonus := 3 else if rar = 'Rare' then bonus := 8 else bonus := 25;
                  if psn = 1 then
                  begin
                    if rar = 'Common' then xpHadiah := 5 else if rar = 'Rare' then xpHadiah := 12 else xpHadiah := 20;
                  end
                  else
                  begin
                    if rar = 'Common' then xpHadiah := 2 else if rar = 'Rare' then xpHadiah := 5 else xpHadiah := 13;
                  end;
                  inc(koin, bonus); inc(hasil, bonus); inc(xp, xpHadiah);
                  if copy(koleksi, n, 1) = '0' then
                  begin
                    koleksi := copy(koleksi, 1, n - 1) + '1' + copy(koleksi, n + 1, 24 - n);
                    textcolor(LightGreen); writeln('Kartu baru masuk koleksi!');
                  end;
                  textcolor(Brown); writeln('Hadiah  : +', bonus, ' koin, +', xpHadiah, ' XP');
                end;
              end;

              if batal then
              begin textcolor(LightGreen); writeln('Dibatalkan, kembali ke menu Eksplorasi.'); continue; end;

              if jumlah = 3 then
              begin
                textcolor(DarkGray); writeln(GarisStrip);
                textcolor(LightGray); write('Kartu tegak: '); textcolor(Yellow); writeln(tegak, ' dari 3');
                textcolor(LightGray); write('Kesimpulan : ');
                case tegak of
                  0: begin textcolor(Red); writeln('Masa sulit, namun ini awal dari pembelajaran'); end;
                  1: begin textcolor(LightRed); writeln('Berhati-hatilah, banyak tantangan di depan'); end;
                  2: begin textcolor(Yellow); writeln('Perjalanan cukup baik dengan sedikit tantangan'); end;
                  3: begin textcolor(LightGreen); writeln('Masa depan Anda sangat cerah!'); end;
                end;
              end;

              if jenis = 2 then
              begin
                inc(totalRamalan); inc(totalGacha);  // satu Gacha dihitung satu kali
                textcolor(LightMagenta); writeln(GarisSama);
                textcolor(Yellow); writeln('Gacha selesai!');
                textcolor(LightGray); writeln('Legendary didapat: ', legend, ' | Total hadiah koin: ', hasil);
                writeln('Sisa koin: ', koin, ' | Sisa jatah Gacha: ', sisaG, ' dari 6');
                if sisaG = 0 then begin textcolor(LightRed); writeln('Jatah Gacha telah habis!'); end;
              end;
              if jenis = 3 then
              begin
                textcolor(LightMagenta); writeln(GarisSama);
                textcolor(Yellow); writeln('Kesempatan Tebak Tarot selesai!');
                textcolor(LightGray); writeln('Benar: ', benar, ' dari 6 | XP didapat: ', benar * 15);
                writeln('Sisa jatah Tebak Tarot: ', sisaT, ' dari 4');
                if sisaT = 0 then begin textcolor(LightRed); writeln('Jatah Tebak Tarot telah habis!'); end;
              end;

              // Challenge selesai jika Tebak habis dan Gacha habis atau tidak terbayar lagi
              if (jenis > 1) and (sisaT = 0) and ((sisaG = 0) or (koin < 15)) then
              begin
                selesai := true;
                if sisaG > 0 then begin textcolor(LightRed); writeln('Koin tidak cukup untuk Gacha apa pun lagi.'); end;
                if xp >= 420 then gelar := 'Sang Gacor Multiverse'
                else if xp >= 300 then gelar := 'CEO Keberuntungan'
                else if xp >= 200 then gelar := 'Dukun Magang Berlisensi'
                else if xp >= 100 then gelar := 'Anak Tarot Masa Percobaan'
                else gelar := 'NPC yang Salah Masuk Portal';
                textcolor(Yellow); writeln('*** CHALLENGE MODE SELESAI! ***');
                tampil := true;
                break;
              end;
            until false;
        end;

      3:
        begin
          writeln;
          textcolor(White); writeln('=== PROFIL PEMAIN (Challenge Mode) ===');
          textcolor(LightGray); write('Nama             : '); textcolor(White); writeln(nama);
          textcolor(LightGray); write('Total XP         : '); textcolor(LightCyan); writeln(xp);
          textcolor(LightGray); write('Total koin       : '); textcolor(Yellow); writeln(koin);
          textcolor(LightGray); write('Total ramalan    : '); textcolor(White); writeln(totalRamalan, ' | Total gacha: ', totalGacha);
          textcolor(LightGray); write('Legendary        : '); textcolor(Yellow); writeln(totalLegendary, ' kartu');
          textcolor(LightGray); write('Sisa jatah       : '); textcolor(White); writeln('Gacha ', sisaG, ' dari 6 | Tebak ', sisaT, ' dari 4');
          textcolor(LightGray); writeln('Koleksi kartu (hijau = dimiliki, abu-abu = belum):');
          v := 0;
          for i := 1 to 24 do
          begin
            if copy(koleksi, i, 1) = '1' then begin textcolor(LightGreen); inc(v); end
            else textcolor(DarkGray);
            write(i : 3);
          end;
          writeln; textcolor(LightGray); write('Kartu dimiliki   : '); textcolor(LightGreen); writeln(v, ' / 24');
          textcolor(LightGray); write('Gelar akhir      : ');
          if selesai then begin textcolor(Yellow); writeln(gelar); end
          else begin textcolor(DarkGray); writeln('(ditentukan setelah semua jatah habis)'); end;
        end;

      4:
        begin
          v := 1;
          if not baru then
          begin
            textcolor(LightRed);
            writeln('PERINGATAN: ganti nama = mulai sesi pemain baru!');
            writeln('XP, koin, statistik, jatah, dan koleksi akan direset.');
            repeat
              textcolor(Yellow); write('Lanjutkan? (1 = Ya, 2 = Tidak): '); textcolor(White); readln(s); val(s, v, kode);
              if (kode = 0) and (v >= 1) and (v <= 2) then break;
              textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 1 sampai 2.');
            until false;
          end;
          if v = 2 then begin textcolor(LightGreen); writeln('Dibatalkan, data pemain tidak berubah.'); end
          else
          begin
            repeat
              textcolor(Yellow); write('Masukkan nama ');
              if not baru then write('baru ');
              write('(huruf dan spasi, 2-20 karakter): ');
              textcolor(White); readln(s);
              valid := (length(s) >= 2) and (length(s) <= 20);
              if valid then
                for i := 1 to length(s) do
                begin
                  c := copy(s, i, 1);
                  if ((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z')) then continue;
                  if (c = ' ') and (i > 1) and (i < length(s)) and (copy(s, i - 1, 1) <> ' ') then continue;
                  valid := false; break;
                end;
              if valid and (not baru) and (s = nama) then
              begin textcolor(LightRed); writeln('Nama baru harus berbeda dari nama saat ini!'); continue; end;
              if valid then break;
              textcolor(LightRed); writeln('Nama tidak valid! Hanya huruf dan spasi tunggal, 2-20 karakter.');
            until false;
            nama := s;

            // Sesi pemain baru: semua data direset hanya setelah konfirmasi
            koin := 100; xp := 0; sisaG := 6; sisaT := 4; selesai := false; gelar := '';
            totalRamalan := 0; totalGacha := 0; totalLegendary := 0; koleksi := '';
            for i := 1 to 24 do koleksi := koleksi + '0';
            pakai := koleksi;

            textcolor(LightGreen);
            if baru then
            begin
              baru := false;
              writeln;
              write('Selamat datang, '); textcolor(Yellow); write(nama); textcolor(LightGreen); writeln('!');
              textcolor(LightGray); write('Hadiah awal : '); textcolor(Yellow); writeln('100 koin');
              textcolor(LightGray); write('Jatah       : '); textcolor(LightCyan); writeln('6 Gacha dan 4 Tebak Tarot');
            end
            else writeln('Sesi baru dimulai untuk ', nama, '. Semua data direset.');
          end;
        end;

      0:
        begin
          repeat
            textcolor(Yellow); write('Yakin ingin keluar? (1 = Ya, 2 = Tidak): '); textcolor(White); readln(s); val(s, v, kode);
            if (kode = 0) and (v >= 1) and (v <= 2) then break;
            textcolor(LightRed); writeln('Input tidak valid! Masukkan angka 1 sampai 2.');
          until false;
          if v = 1 then
          begin
            textcolor(LightMagenta); writeln(GarisSama);
            textcolor(Yellow); writeln('           RINGKASAN PERMAINAN');
            textcolor(LightMagenta); writeln(GarisSama);
            textcolor(LightGray); write('Pemain  : '); textcolor(White); writeln(nama, ' | XP: ', xp, ' | Koin: ', koin);
            textcolor(LightGray); write('Ramalan : '); textcolor(White); writeln(totalRamalan, ' | Gacha: ', totalGacha);
            textcolor(LightGray); write('Gelar   : '); textcolor(Yellow);
            if selesai then writeln(gelar) else writeln('belum ditentukan (Challenge belum selesai)');
            textcolor(LightMagenta); writeln(GarisSama);
            textcolor(Yellow); writeln('Terima kasih sudah bermain, ', nama, '! Sampai jumpa!');
          end
          else begin pilih := -1; textcolor(LightGreen); writeln('Kembali ke menu utama.'); end;
        end;
    end;
  until pilih = 0;

  textcolor(LightGray);
end.
