#include <stdlib.h>
#include <iostream>
#include <ctime>
#include <string>
#include "Producer.h"
#include "Buffer.h"
#include "Consumer.h"
using namespace std;

//cpp File from Producer


Producer::Producer(Buffer<int> *b,int value) // Constructor for the Producerclass. Input parameter is an Pointer to an IntegerBuffer and the quantity of the producers
{
	for (int i = 0; i < value; i++)
	{
		b->push(Producer::produce());
	}
}


Producer::~Producer()  // Default Deconstructor
{
}

int Producer::produce()  // Produce method that generates a random Integer number 
{

	//srand(time(0));
	int n = 0;
	n = rand();

	return n;
	
}

int main(int argc, char *argv[]){ // Main method generates a Buffer, Producer and Consumer

	Buffer<int> iBuffer(10);
	Producer prod(&iBuffer, 5);

	Consumer con(&iBuffer);

	cin.get();
	return 1;
	


}