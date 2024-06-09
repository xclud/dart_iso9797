import 'package:iso9797/iso9797.dart';
import 'package:test/test.dart';

void main() {
  final key = [
    0x46,
    0xB0,
    0xAA,
    0x84,
    0xC9,
    0xAB,
    0x2C,
    0xC8,
    0x7F,
    0xBD,
    0x7C,
    0x73,
    0x6E,
    0x51,
    0x5C,
    0x06,
  ];

  final data4 = [0x12, 0x12, 0x34, 0xff];
  final data8 = [0x12, 0x12, 0x34, 0xff, 0x12, 0x12, 0x34, 0xff];

  test('Algorithm 1', () {
    //expect(calculate(), 42);
  });

  test('Algorithm 3', () {
    final mac4 = algorithm3(key, data4, PaddingMode.method1);
    final mac8 = algorithm3(key, data8, PaddingMode.method1);

    //
    expect(mac4[0], 193);
    expect(mac8[0], 181);
  });
}
