void main(List<String> arguments) {
  int targetPrime = 10000;
  int currentNum = 2;
  int currentDenominator = currentNum - 1;
  while (true) {
    if (currentDenominator == 1) {
      targetPrime = targetPrime - 1;
      if (targetPrime == 0) {
        print("Prime numbers is " + currentNum.toString());
        break;
      }

      currentNum = currentNum + 1;
      currentDenominator = currentNum - 1;
    }
    if (currentNum % currentDenominator != 0) {
      currentDenominator = currentDenominator - 1;
      continue;
      // not divisible, keep going
    }
    if (currentNum % currentDenominator == 0) {
      // divisible, this is definitely not prime
      currentNum = currentNum + 1;
      currentDenominator = currentNum - 1;
      continue;
    }
  }
}
