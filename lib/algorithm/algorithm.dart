import 'dart:io';

void main() {
  print("Please input: ");
  String? input = stdin.readLineSync();

  try {
    List<int> arr = input!.split(' ').map(int.parse).toList();

    if (arr.length != 5) {
      print('Error: You must enter exactly 5 integers!');
      return;
    }

    Algorithm.minMaxSum(arr);

    // Bonus
    // + Count total of array
    Algorithm.totalArray(arr);
    // + Find min in array
    Algorithm.findMinValue(arr);
    // + Find max in array
    Algorithm.findMaxValue(arr);
    // + Find even elements in array
    Algorithm.findEvenElements(arr);
    // + Find odd elements in array
    Algorithm.findOddElements(arr);
  } catch(e) {
    print('Error: Please enter valid integers only.');
  }
}

class Algorithm {
  static void minMaxSum(List<int> arr) {
    // Sort the array in ascending order
    arr.sort();

    // minimum sum
    int minSum = arr.sublist(0, 4).reduce((a, b) => a + b);

    // maximum sum
    int maxSum = arr.sublist(1, 5).reduce((a, b) => a + b);

    // Out put
    print('$minSum $maxSum');
  }

  static void totalArray(List<int> arr) {
    int totalSum = arr.reduce((a, b) => a + b);

    print("Total of array: $totalSum");
  }

  static void findMinValue(List<int> arr) {
    int minValue = arr.first;

    print("Min value: $minValue");
  }

  static void findMaxValue(List<int> arr) {
    int minValue = arr.last;

    print("Max value: $minValue");
  }

  static void findEvenElements(List<int> arr) {
    List<int> evenElements = arr.where((element) => element % 2 == 0).toList();

    print('Even Elements: ${evenElements.join(', ')}');
  }

  static void findOddElements(List<int> arr) {
    List<int> oddElements = arr.where((element) => element % 2 != 0).toList();

    print('Odd Elements: ${oddElements.join(', ')}');
  }
}
