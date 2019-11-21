import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case', (){
    expect(stackCalc("5 6 +"), 11);
    expect(stackCalc("3 DUP +"), 6);
    expect(stackCalc("6 5 5 7 * - /"), 5);
    expect(stackCalc("x y +"), "Invalid Instructions");
    expect(stackCalc("5 +"), 5);
    expect(stackCalc("5 6 +"), 0);
  });
}
