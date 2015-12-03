#pragma once
#include "Buffer.h"
#include "Buffer.cpp"

//Header class of the producer. Defines the private & public methods 


class Producer
{
public:
	Producer(Buffer<int> *buffer,int value);
	~Producer();
private:
	int produce();
};

