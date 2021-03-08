# Classroom GUI

A GUI in flutter for navigating through google classroom study materials.

## Requirements

1. Install [Flutter](https://flutter.dev/docs/get-started/install) version >=2.0.0

2. Optional requirements :

   - Enable web support

     ```bash
     flutter config --enable-web
     ```

   - Enable desktop support for windows, macos and linux. Replace `<platform>` with the platform you want to support (`windows`,`macos`,`linux`).

     ```bash
     flutter config --enable-<platform>-desktop
     ```

## Getting Started

1. Download the source code.

   ```bash
   git clone https://github.com/ashishbinu/classroom-gui.git
   cd classroom-gui
   ```

2. Build for various platforms :

   - **Android**

     ```bash
     flutter build apk --split-per-abi
     ```

   - **Web**

     ```bash
     flutter build web
     ```

   - **Desktop**

     Replace `<platform>` with the platform of choice (`windows`, `macos`, `linux`)

     ```bash
     flutter build <platform>
     ```
