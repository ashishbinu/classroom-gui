# Classroom GUI

A GUI in flutter for navigating through google classroom study materials.

## Table of contents

- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Acknowledgements](#acknowledgements)
- [Contributions](#contributions)

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

2. Initiliaze the Project.

   ```bash
   flutter create .
   ```

3. Build for various platforms :

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

## Acknowledgements

This project uses json api provided by [better-classroom](https://github.com/AJAYK-01/better-classroom).
<br/>
Thanks [@AJAK-01](https://github.com/AJAYK-01/) for his contribution ❤️.

## Contributions

Contribute to this project by reporting any [**bugs**](https://github.com/ashishbinu/classroom-gui/issues/new) or giving suggestions to improve existing [**feature**](https://github.com/ashishbinu/classroom-gui/issues/new) or provide new [**ideas**](https://github.com/ashishbinu/classroom-gui/issues/new) you want to see in the app.
