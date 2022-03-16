#include<iostream>
using namespace std;

struct book
    {
        string title; 
        string author;
        int price;
    };


main() {
    book web_book = {"HTML and CSS", "Hong", 28000};
    book java_book = {"Java language", "Lee"};

    cout << web_book.title << web_book.author << endl;
    cout << java_book.title << java_book.author << java_book.price << endl;

    return 0;
    
}