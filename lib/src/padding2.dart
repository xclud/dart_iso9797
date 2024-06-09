part of '../iso9797.dart';

/// Returns padded data according to ISO/IEC 9797-1, padding method 2 scheme.
Uint8List pad2(Uint8List data, int n) {
  final Uint8List padBlock = Uint8List(n);
  padBlock[0] = 0x80;
  final padSize = n - (data.length % n);
  final padded = Uint8List.fromList(data + padBlock.sublist(0, padSize));
  return padded;
}

/// Returns unpadded data according to ISO/IEC 9797-1, padding method 2 scheme.
Uint8List unpad2(Uint8List data) {
  var i = data.length - 1;
  while (data[i] == 0x00) {
    i -= 1;
  }
  if (data[i] == 0x80) {
    return data.sublist(0, i);
  }
  return data;
}
