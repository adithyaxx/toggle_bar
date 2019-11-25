import 'package:test/test.dart';
import '../lib/toggle_bar.dart';

void main() {
  test('Initialise toggle bar', () async {
    final labels = ['a', 'b', 'c', 'd', 'e'];
    final toggleBar = ToggleBar(labels: labels);
    if (toggleBar.labels == labels) return true;
    return false;
  });
}
