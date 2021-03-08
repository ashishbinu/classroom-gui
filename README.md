# Classroom GUI

A GUI in flutter for navigating through google classroom study materials.

## Requirements

1. Install Flutter version >=2.0.0

2. Enable web support

```bash
flutter config --enable-web
```

2. Enable desktop support for windows, macos and linux. Replace <desktop> with the platform you want to support (`windows`,`macos`,`linux`).

```bash
flutter config --enable-<desktop>-desktop
```

## Getting Started

1. Download the source code

```bash
    git clone https://github.com/ashishbinu/classroom-gui.git
    cd classroom-gui
```

2. Build for Android , Web and Desktop where <desktop> is (`windows`,`macos`,`linux`)

```bash
flutter build apk --split-per-abi
```

```bash
flutter build web
```

```bash
flutter build <desktop>
```
