// Stack Calculator
// A stack machine processes instructions by pushing and popping values to an
// internal stack. A simple example of this is a calculator.
//
//  The argument passed to stackCalc(instructions) will always be a string containing a series of instructions.
//  The instruction set of the calculator will be this:
//
//  +: Pop the last 2 values from the stack, add them, and push the result onto the stack.
//  -: Pop the last 2 values from the stack, subtract the lower one from the
//     topmost one, and push the result.
//  *: Pop the last 2 values, multiply, and push the result.
//  /: Pop the last 2 values, divide the topmost one by the lower one, and push the result.
//  DUP: Duplicate (not double) the top value on the stack.
//  POP: Pop the last value from the stack and discard it.
//  PSH: Performed whenever a number appears as an instruction. Push the number to the stack.
//  Any other instruction (for example, a letter) should result in the value
//  "Invalid instruction: [instruction]"

import 'package:test/test.dart';

/// Examples
//  stackCalc("") ➞ 0
//  stackCalc("5 6 +") ➞ 11
//  stackCalc("3 DUP +") ➞ 6
//  stackCalc("6 5 5 7 * - /") ➞ 5
//  stackCalc("x y +") ➞ Invalid instruction: x




dynamic stackCalc(String args){
try {

  List newList = args.split(" ");
  List <int> stack = [];

  for (dynamic item in newList) {
    if (item == "") {
      return 0;
    }

    if ((item == "+" || item == "-" || item == "*" ||
        item == "/") && stack.length >= 2) {
      int temp = performOperation(
          stack[stack.length - 1], stack[stack.length - 2], item);
      stack.removeLast();
      stack.removeLast();
      stack.add(temp);
    }
    else if((item == "+" || item == "-" || item == "*" ||
        item == "/") && stack.length < 2){
      continue;
    }

  else if (item == "DUP") {
      stack.add(stack[0]);
    }
    else if (item == "") {
      return 0;
    }
    else {
      item = int.parse(item);
      stack.add(item);
    }
  }

 return stack.last;


}
on FormatException{
  return "Invalid Instructions";
}
}

int performOperation(int first, int second, String operator){
  if(operator == "+"){
    return first + second;
  }
  else if(operator == "-"){
    return first - second;
  }
  else if(operator == "/"){
    return first~/second;
  }
  else if(operator == "*"){
    return first * second;
  }
}

main() {

  print(stackCalc("5 6 +"));
  print(stackCalc("3 DUP +"));
  print(stackCalc("6 5 5 7 * - /"));
  print(stackCalc("x y +"));
  print(stackCalc("5 +"));
  print(stackCalc(""));
}
