part of '../iso9797.dart';

Uint8List _encrypt(List<int> key, List<int> data) {
  final des = DES(
    key: key,
    mode: DESMode.CBC,
    paddingType: DESPaddingType.None,
  );

  final x = des.encrypt(data);

  return Uint8List.fromList(x);
}

Uint8List _decrypt(List<int> key, List<int> data) {
  final des = DES(
    key: key,
    mode: DESMode.CBC,
    paddingType: DESPaddingType.None,
  );

  final x = des.decrypt(data);

  return Uint8List.fromList(x);
}
