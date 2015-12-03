#include "Consumer.h"
#include <stdlib.h>
#include <iostream>
using namespace std;

//cpp File from Consumer


Consumer::Consumer(Buffer<int> *buffer) // Constructor for the Consumerclass. Input parameter is an Pointer to an IntegerBuffer.
										// As long as there are Numbers in the Buffer, the Consumer will take them and gives them to the consume method
{
	int a;
	while (buffer->pop(&a)){
		Consumer::consume(a);
	}
}


Consumer::~Consumer()  // Default Deconstructor
{
}

void Consumer::consume(int number){ // Consume method that gives the number out to the console
	cout << number << endl;
}