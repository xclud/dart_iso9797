import 'package:iso9797/iso9797.dart' as iso9797;

void main(List<String> arguments) {
  print('MAC: ${iso9797.algorithm1([], [], iso9797.PaddingMode.method1)}');
}
