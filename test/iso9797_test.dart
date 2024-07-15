import 'package:convert/convert.dart';
import 'package:iso9797/iso9797.dart';
import 'package:test/test.dart';

void main() {
  final key = hex.decode('AD338318E4F1DE153FD60B977E2F7965');
  final data = hex.decode(
      '0100203801000081000193000000009715475806260770313137393430323600221101303830303730383237300602332E302E35020330');

  test('Algorithm 1', () {
    //expect(calculate(), 42);
  });

  test('Algorithm 3', () {
    final mac = algorithm3(key, data, PaddingMode.method1);
    final macHex = hex.encode(mac).toUpperCase();

    final x919 = macHex.substring(0, 8).codeUnits;
    final x919Hex = hex.encode(x919);

    expect(macHex, '77A3E1B62711A2E5');
    expect(x919Hex, '3737413345314236');
  });
}
