// Name: Jonathan Cole
// Course: CSC 2110.01
// Date: Fri Oct 22, 2021
// Assignment Number: t7
// Description: Computes the exponent m^n and outputs the time required to compute it

#include <iostream>
#include <iomanip>
#include <ctime>
using namespace std;

extern "C" int Power(int m, int n);

int main()
{
    int l, m, n;
  timespec start, finish;
  double elapsed;

  cout << "Power calculate, m^n" << endl
  << "Please enter m, 'q' to quit." << endl
  << endl
  << "n> ";
  cin >> m;

  cout <<"Please enter n, 'q' to quit." << endl
  << "n> ";
  cin >> n;


  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
  l = Power(m, n);
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &finish);
  elapsed = (finish.tv_sec - start.tv_sec)
          + (finish.tv_nsec - start.tv_nsec) * 1e-9;

  cout << "Power(" << m << "^" << n << ") = "
  << l << " computed in "
  << elapsed << " seconds " << endl
  << "n> ";

  return 0;
}
