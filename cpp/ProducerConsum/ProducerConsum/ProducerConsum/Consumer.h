#pragma once
#include "Buffer.h"
#include "Producer.h"

//Header class of the Consumer. Defines the private & public methods 


class Consumer
{
public:
	Consumer(Buffer<int> *buffer);
	~Consumer();
private:
	void consume(int number);
};

