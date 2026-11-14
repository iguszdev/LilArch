# 🍭 LilArch

**lekki. szybki. słodki.** 🐧

**LilArch to gotowy do pobrania system operacyjny (Linux) w pliku ISO.** Jest oparty na Arch Linuksie, działa szybko nawet na starych komputerach i ma ładny, kolorowy pulpit i3. Nagrywasz ISO na pendrive, uruchamiasz komputer z pendrive'a i możesz system od razu wypróbować albo zainstalować na dysku jednym poleceniem: `LilInstall`.

![Arch Linux](https://img.shields.io/badge/based%20on-Arch%20Linux-1793d1?logo=arch-linux&logoColor=white)
![i3wm](https://img.shields.io/badge/desktop-i3wm-ff6ec7)
![BIOS + UEFI](https://img.shields.io/badge/boot-BIOS%20%2B%20UEFI-3fb4ff)
![Offline install](https://img.shields.io/badge/install-offline-0bbfe0)

> LilArch jest projektem hobbystycznym i nie jest oficjalną dystrybucją Arch Linux.

## ❓ Co to jest?

LilArch to **dystrybucja Linuksa**, czyli kompletny system operacyjny, taki jak Windows, tylko darmowy i otwarty. Plik `.iso` w tym repozytorium to obraz, z którego możesz:

- **uruchomić system bez instalacji** (tryb live, nic nie zmienia się na dysku),
- **zainstalować go na komputerze** (uwaga: instalator kasuje wybrany dysk).

Dla kogo: dla osób, które chcą lekki system na starszy komputer, lubią klawiaturowe pulpity (i3) albo chcą zacząć przygodę z Archem bez ręcznej instalacji.

## ✨ Co dostajesz

- 🪶 **Lekki system**: minimalna baza, zram zamiast swapu na dysku, `noatime`, szybki start.
- 🍬 **Ładny pulpit i3**: kafelkowe okna, kolorowe obramowania, pasek z zegarem, RAM, CPU i Wi-Fi, tapeta LilArch, czcionka JetBrains Mono.
- 🧰 **Instalator `LilInstall`**: tekstowy, po polsku, **BIOS i UEFI**.
- 📦 **Instalacja offline**: nie potrzebujesz internetu, żeby zainstalować system z i3.
- 🖥️ **Wybór środowiska**: i3 (domyślnie), sam terminal, XFCE, Openbox lub Sway (te trzy ostatnie wymagają internetu).
- 📶 **Wi-Fi**: komenda `lilwifi`.

## 💾 Pobieranie

Pobierz najnowszy plik `lilarch-*.iso` z zakładki **[Releases](../../releases)**.

## 🔥 Jak uruchomić

### 1. Nagraj ISO na pendrive

- **Windows:** [Rufus](https://rufus.ie) lub [balenaEtcher](https://etcher.balena.io), tryb **DD** jeśli Rufus zapyta.
- **Linux:** `sudo dd if=lilarch-*.iso of=/dev/sdX bs=4M status=progress oflag=sync` (zamień `/dev/sdX` na pendrive, uważaj na wybór urządzenia).
- **Maszyna wirtualna:** wskaż ISO jako płytę w VirtualBox, VMware lub QEMU.

### 2. Uruchom komputer z pendrive'a

Wejdź w menu startowe (zwykle `F12`, `F11`, `Esc` lub `F2`) i wybierz pendrive. System uruchomi się w trybie live i zaloguje automatycznie.

### 3. Wypróbuj albo zainstaluj

```bash
startx        # uruchamia pulpit i3 (tryb live)
LilInstall    # instaluje system na dysku
```

Instalator zapyta o dysk, nazwę komputera, użytkownika, strefę czasową, klawiaturę, hasło i środowisko:

| # | Środowisko | Internet |
|---|------------|----------|
| 1 | i3 z rice LilArch | nie |
| 2 | tylko terminal | nie |
| 3 | XFCE | tak |
| 4 | Openbox | tak |
| 5 | Sway (Wayland) | tak |

Po komunikacie „Gotowe!" wyjmij pendrive i wpisz `reboot`.

## 🎨 Skróty w i3

| Skrót | Akcja |
|-------|-------|
| `Super + Enter` | terminal |
| `Super + D` | menu aplikacji |
| `Super + Q` | zamknij okno |
| `Super + H/J/K/L` | przełączanie fokusu |
| `Super + F` | pełny ekran |
| `Super + 1…5` | pulpity |
| `Super + Shift + R` | przeładuj i3 |
| `Super + Shift + E` | wyloguj |
| `Super + Shift + B` | restart |
| `Super + Shift + P` | wyłącz komputer |

## 🛠️ Zbuduj ISO samodzielnie (opcjonalnie)

Potrzebujesz Arch Linuksa, `sudo` i internetu:

```bash
bash lilarch.sh 2>&1 | tee ~/lilarch.log
```

Gotowe ISO pojawi się w `~/lilarch-build/out/`. Jeśli obok skryptu położysz `LILARCH.png`, zostanie użyte jako tapeta.

## 🐞 Problemy

Coś nie działa lub system wpada w `grub rescue`? Otwórz issue i podaj treść błędu, tryb uruchamiania (BIOS lub UEFI) oraz czy to maszyna wirtualna czy prawdziwy sprzęt.

---

<p align="center">Zrobione z 🍭 i odrobiną 🐧</p>

<sub>Słowa kluczowe / keywords: LilArch, lekka dystrybucja Linuksa, lightweight Linux distro, minimal Arch Linux, Arch-based distro, ISO download, live USB, i3wm, tiling window manager, offline Arch installer, LilInstall, polska dystrybucja Linuksa, lekki Linux na stary komputer, Linux for old PC, BIOS UEFI installer.</sub>
