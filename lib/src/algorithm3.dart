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

/// ISO 9797 X9.19 MAC Algorithm.
///
/// [key] Must be 16 bytes.
Uint8List x919(
  List<int> key,
  List<int> data,
) {
  final mac = algorithm3(key, data, PaddingMode.method1);
  final macHex = hex.encode(mac).toUpperCase();

  final x919 = macHex.substring(0, 8).codeUnits;
  return Uint8List.fromList(x919);
}
