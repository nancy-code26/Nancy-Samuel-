import 'dart:math';

// Factorial Function:
int fact(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result = result * i;
  }
  return result;
}

// Sum Function:
int sum(int n) {
  int result = 0;
  for (int i = 1; i <= n; i++) {
    result = result + i;
  }
  return result;
}

// Power Function:
int power(int base, int exponent) {
  return pow(base, exponent).toInt();
}

void main() {
  int x = 2;
  int y = 3;
  int z = 5;

  // First equation:
  double re1 = (fact(x) * power(x, y) + sum(z)) / (power(z, y) * fact(y));
  // Second equation:
  double re2 = (power(x, y) * power(x, z)) / (sum(x) * sum(y) + fact(z) * fact(y));

  print("Result 1 = $re1");
  print("Result 2 = $re2");
}
