#include<iostream>
using namespace std;

struct Prop
{
    int savings;
    int loan;
};

int CalcProperty(int,int);

int main(void)
{
    int hong_prop;
    Prop hong = {100000, 4000};

    hong_prop = CalcProperty(hong.savings, hong.loan);
    cout << "Property : " << hong_prop;
    return 0;
}

int CalcProperty(int s, int l)
{
    return(s - l);
}