import 'package:convert/convert.dart';
import 'package:iso9797/iso9797.dart';
import 'package:test/test.dart';

void main() {
  final key = hex.decode('2DD5A5210035597D7A40582210CF67CD');
  final data = hex.decode('11');

  test('Algorithm 1', () {
    //expect(calculate(), 42);
  });

  test('Algorithm 3', () {
    final mac = algorithm3(key, data, PaddingMode.method1);
    final macHex = hex.encode(mac).toUpperCase();

    expect(macHex, '6B09A169A01089DA');
  });
}
