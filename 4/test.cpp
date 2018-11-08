#include <iostream>

void calculate(long unsigned int);
double factorial(long unsigned n);

int main (void)
{
  calculate(25e8);
  calculate(10e8);

  return 0;
}

void calculate(long unsigned int count)
{
  double res = 0.0;
  long unsigned int i;

  for (i = 1; i <= count; ++i) {
    res += factorial(i % 5);
  }

  std::cout << "Calculated: " << res << std::endl;
}

double factorial(long unsigned n)
{
  double x = 1.0;
  long unsigned int i;

  for (i = 2; i <= n; ++i) {
    x *= i;
  }

  return x;
}
