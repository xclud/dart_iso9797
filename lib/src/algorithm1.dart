part of '../iso9797.dart';

/// ISO 9797 MAC Algorithm 1.
///
/// [key] Must be 8 bytes.
Uint8List algorithm1(
  List<int> key,
  List<int> data,
  PaddingMode padding,
) {
  if (key.length != 8) {
    throw Exception('Key must be 8 bytes.');
  }

  if (data.length % 8 != 0) {
    final copyOfData = data.toList();
    while (copyOfData.length % 8 != 0) {
      copyOfData.add(0);
    }

    data = copyOfData;
  }

  final mac = _encrypt(key, data);

  return mac;
}
