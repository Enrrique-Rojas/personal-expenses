# Screenshots

A continuación se muestran capturas de pantalla de la aplicación en funcionamiento:

<div align="center">

<table>
  <tr>
    <td><a href="https://postimg.cc/WDm2qMbn"><img src="https://i.postimg.cc/s2q18ckt/Whats-App-Image-2026-02-22-at-23-32-05.jpg" width="250"/></a></td>
    <td><a href="https://postimg.cc/wt56RhTF"><img src="https://i.postimg.cc/zf63M7mm/Whats-App-Image-2026-02-22-at-23-32-34.jpg" width="250"/></a></td>
    <td><a href="https://postimg.cc/d7RqZ8t4"><img src="https://i.postimg.cc/XvmXhLMS/Whats-App-Image-2026-02-22-at-23-32-44.jpg" width="250"/></a></td>
  </tr>
  <tr>
    <td><a href="https://postimg.cc/yJhV3FYL"><img src="https://i.postimg.cc/Zq20gHkz/Whats-App-Image-2026-02-22-at-23-33-24.jpg" width="250"/></a></td>
    <td><a href="https://postimg.cc/XZKVBw72"><img src="https://i.postimg.cc/jjmC9cVr/Whats-App-Image-2026-02-22-at-23-33-37.jpg" width="250"/></a></td>
    <td><a href="https://postimg.cc/XZKVBw71"><img src="https://i.postimg.cc/FK81qptv/Whats-App-Image-2026-02-22-at-23-34-22.jpg" width="250"/></a></td>
  </tr>
  <tr>
    <td><a href="https://postimg.cc/94PWwGFN"><img src="https://i.postimg.cc/TPFhS08G/Whats-App-Image-2026-02-22-at-23-34-52.jpg" width="250"/></a></td>
    <td><a href="https://postimg.cc/jW6snzdF"><img src="https://i.postimg.cc/d0pDX6Mw/Whats-App-Image-2026-02-22-at-23-34-58.jpg" width="250"/></a></td>
    <td></td>
  </tr>
</table>

</div>
# personal_expenses

A project to manage personal expenses, in which you can create, edit, delete, and scan new expenses via QR code, offline and online with the option to synchronize.

## Flutter version

## Version: 3.35.6

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## open db local

1: open cmd (admin)
2: open emulator mobile
3: run command: `adb shell`
4: run command: `run-as com.example.personal_expenses`
5: run command: `cd app_flutter/ && ls`
6: run command: `cp {YOUR_DATABASE}.db /storage/self/primary/Download`

## How to run

`flutter pub cache clean` (optional)
`flutter pub cache repair` (optional)
`flutter pub get`
`flutter run`

In case of updating any route or entity file,
run `flutter pub run build_runner build --delete-conflicting-outputs`

In case flutter icons
run `flutter pub run flutter_launcher_icons`

## Change Package name

run `flutter pub run change_app_package_name:main com.example.example`
