# 🍭 LilArch

**lekki. szybki. słodki.** 🐧

LilArch to maleńka dystrybucja oparta na Arch Linuksie, zbudowana na [archiso](https://wiki.archlinux.org/title/Archiso). Wgrywasz ISO, wpisujesz `LilInstall` i po kilku minutach masz szybki, kolorowy pulpit i3, który zjada tylko tyle zasobów, ile naprawdę potrzebuje.

![Arch Linux](https://img.shields.io/badge/based%20on-Arch%20Linux-1793d1?logo=arch-linux&logoColor=white)
![i3wm](https://img.shields.io/badge/desktop-i3wm-ff6ec7)
![BIOS + UEFI](https://img.shields.io/badge/boot-BIOS%20%2B%20UEFI-3fb4ff)
![Offline install](https://img.shields.io/badge/install-offline-0bbfe0)

> LilArch jest projektem hobbystycznym i nie jest oficjalną dystrybucją Arch Linux.

## 🇬🇧 In English

**LilArch** is a lightweight, minimal, Arch Linux based distro with a pretty pre-configured **i3 window manager** desktop, built with **archiso**. It ships a simple text installer (`LilInstall`) that supports **BIOS and UEFI**, installs **offline**, and offers i3, XFCE, Openbox, Sway or a terminal-only setup. Low RAM usage thanks to zram, `noatime` and a minimal package set. Build the whole ISO with a single script: `bash lilarch.sh`.

---

## ✨ Najważniejsze cechy

- 🪶 **Lekki**: minimalna baza, zram zamiast swapu na dysku, `noatime`, cotygodniowy TRIM i szybki start GRUB-a.
- 🍬 **Ładny od pierwszego uruchomienia**: kafelkowe i3 z odstępami, kolorowe obramowania, pasek i3status z emoji, tapeta `LILARCH.png`, JetBrains Mono, fastfetch na starcie.
- 📦 **Instalacja offline**: system i środowisko i3 są w repozytorium na ISO, więc nie potrzebujesz internetu.
- 🧰 **Prosty instalator `LilInstall`**: tekstowy, po polsku, obsługuje **BIOS i UEFI**.
- 🖥️ **Wybór środowiska**: i3 (domyślnie), sam terminal, XFCE, Openbox lub Sway.
- 📶 **Wi-Fi bez bólu głowy**: `iwd` plus komenda `lilwifi`.
- 🛠️ **Budowanie jednym skryptem**: cały ISO powstaje z jednego pliku `lilarch.sh`.

---

## 🚀 Szybki start

### 1. Zbuduj ISO

Potrzebujesz systemu **Arch Linux** (lub pochodnego z `pacman`), dostępu do `sudo` i internetu na czas budowania.

```bash
git clone https://github.com/<twoj-login>/lilarch.git
cd lilarch

# (opcjonalnie) wrzuć swoją tapetę obok skryptu
# cp ~/Pobrane/LILARCH.png .

bash lilarch.sh 2>&1 | tee ~/lilarch.log
```

Skrypt sam doinstaluje `archiso` i `imagemagick`, pobierze pakiety do repozytorium offline i zbuduje obraz. Gotowe ISO znajdziesz w:

```
~/lilarch-build/out/
```

Jeśli nie ma pliku `LILARCH.png`, skrypt wygeneruje zastępczą tapetę z różowo-niebieskim gradientem.

### 2. Przetestuj w maszynie wirtualnej

```bash
qemu-img create -f qcow2 test.img 8G
qemu-system-x86_64 -m 2G -enable-kvm \
  -cdrom ~/lilarch-build/out/lilarch-*.iso -hda test.img -boot d
```

Po instalacji uruchom system **bez** `-cdrom`:

```bash
qemu-system-x86_64 -m 2G -enable-kvm -hda test.img
```

### 3. Zainstaluj na dysk

1. Uruchom komputer z pendrive'a lub ISO.
2. Zalogujesz się automatycznie na roota.
3. Wpisz:

```bash
LilInstall
```

Instalator zapyta o:

- dysk docelowy (**uwaga: zawartość dysku zostanie usunięta**),
- nazwę komputera,
- nazwę użytkownika,
- strefę czasową,
- układ klawiatury,
- hasło (to samo dla użytkownika i roota),
- środowisko graficzne.

| # | Środowisko | Internet |
|---|------------|----------|
| 1 | i3 z rice LilArch | nie |
| 2 | tylko terminal | nie |
| 3 | XFCE | tak |
| 4 | Openbox | tak |
| 5 | Sway (Wayland) | tak |

Po komunikacie „Gotowe!" wyjmij nośnik i wpisz `reboot`.

---

## 🎨 Pulpit i3

Po zalogowaniu wpisz `startx`.

| Skrót | Akcja |
|-------|-------|
| `Super + Enter` | terminal (xterm) |
| `Super + D` | menu aplikacji (dmenu) |
| `Super + Q` | zamknij okno |
| `Super + H/J/K/L` | przełączanie fokusu |
| `Super + Shift + H/J/K/L` | przesuwanie okien |
| `Super + B` / `Super + V` | podział poziomy / pionowy |
| `Super + F` | pełny ekran |
| `Super + Shift + Spacja` | tryb pływający |
| `Super + R` | zmiana rozmiaru okna |
| `Super + 1…5` | pulpity |
| `Super + Shift + 1…5` | przenieś okno na pulpit |
| `Super + Shift + R` | przeładuj i3 |
| `Super + Shift + E` | wyloguj |
| `Super + Shift + B` | restart |
| `Super + Shift + P` | wyłącz komputer |

---

## 📶 Wi-Fi

```bash
lilwifi
```

Skrypt przeskanuje sieci, pokaże listę i zapyta o SSID. Możesz też użyć `iwctl` bezpośrednio.

---

## 📁 Struktura

```
lilarch/
├── lilarch.sh      # skrypt budujący ISO (zawiera LilInstall, rice i konfigurację)
├── LILARCH.png     # (opcjonalnie) tapeta
└── README.md
```

W zbudowanym systemie:

| Ścieżka | Zawartość |
|---------|-----------|
| `/usr/local/bin/LilInstall` | instalator |
| `/usr/local/bin/lilwifi` | pomocnik Wi-Fi |
| `/usr/share/lilarch/rice/` | konfiguracja i3, i3status, picom, xterm |
| `/opt/lilrepo/` | repozytorium offline z pakietami |

---

## 🛠️ Dostosowanie

- **Pakiety**: edytuj zmienne `CORE` i `I3` na początku `lilarch.sh`.
- **Kolory i wygląd**: sekcja „RICE i3" w skrypcie (`.Xresources`, `i3/config`, `i3status/config`, `picom.conf`).
- **Tapeta**: wrzuć `LILARCH.png` obok skryptu przed budowaniem.
- **Nazwa i branding**: `profiledef.sh` oraz teksty motd w skrypcie.

---

## 🐞 Problemy

- **Budowanie się nie udaje**: sprawdź log `~/lilarch.log` i upewnij się, że masz wolne miejsce na dysku oraz dostęp do internetu.
- **Instalator przerywa z błędem o jądrze lub GRUB-ie**: to celowe zabezpieczenie, dzięki któremu nie dostaniesz systemu, który się nie uruchomi. Zgłoś issue z komunikatem błędu.
- **Po instalacji pojawia się `grub rescue`**: zgłoś issue i dołącz treść błędu po `error:`, tryb uruchamiania (BIOS lub UEFI) oraz informację, czy to VM czy prawdziwy sprzęt.

---

## 🤝 Współpraca

Pull requesty i pomysły są mile widziane. Masz propozycję nowego motywu, środowiska lub poprawki instalatora? Otwórz issue.

## 📜 Licencja

Dodaj tutaj wybraną licencję (np. MIT) i plik `LICENSE`.

---

<p align="center">Zrobione z 🍭 i odrobiną 🐧</p>

<sub>Słowa kluczowe / keywords: LilArch, lekka dystrybucja Linuksa, lightweight Linux distro, minimal Arch Linux, Arch-based distro, archiso, custom Arch ISO, i3wm rice, i3 window manager, tiling window manager, offline Arch installer, LilInstall, polska dystrybucja Linuksa, lekki Linux na stary komputer, Linux for old PC, BIOS UEFI installer.</sub>
