part of '../iso9797.dart';

/// ISO 9797 MAC Algorithm 3.
///
/// [key] Must be 16 bytes.
Uint8List algorithm3(
  List<int> key,
  List<int> data,
  PaddingMode padding,
) {
  if (key.length != 16) {
    throw Exception('Key must be 16 bytes.');
  }

  if (data.length % 8 != 0) {
    final copyOfData = data.toList();
    while (copyOfData.length % 8 != 0) {
      copyOfData.add(0);
    }

    data = copyOfData;
  }

  final ka = key.sublist(0, 8);
  final kb = key.sublist(8, 16);

  var mac = _encrypt(ka, data);
  mac = mac.sublist(mac.length - 8);
  mac = _decrypt(kb, mac);
  mac = _encrypt(ka, mac);

  return mac;
}

/// ISO 9797 MAC Algorithm 3.
///
/// [key] Must be 16 bytes.
Uint8List algorithm3Mac(List<int> key, List<int> message) {
  if (message.length % 8 != 0) {
    final copyOfData = message.toList();
    while (copyOfData.length % 8 != 0) {
      copyOfData.add(0);
    }

    message = Uint8List.fromList(copyOfData);
  }

  final mac = algorithm3(key, message, PaddingMode.method1);

  final macU = mac.take(4).map((e) => e.toRadixString(16)).join().toUpperCase();

  final result = macU.codeUnits.take(8);
  return Uint8List.fromList(result.toList());
}
