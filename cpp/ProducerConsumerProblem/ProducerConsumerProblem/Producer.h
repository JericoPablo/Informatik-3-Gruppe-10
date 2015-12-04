#pragma once
#include "Buffer.h"

//Header class of the producer. Defines the private & public methods and variables

class Producer
{
public:
	Producer(Buffer<int>& buffer);
	~Producer();

	void run();
	int produce();

private:
	Buffer<int>& buffer_;
};


