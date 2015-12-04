#pragma once
#include "Buffer.h"

// header File from Consumer. Headerclass of the Consumer. Defines the private & public methods and variables

class Consumer
{
public:
	Consumer(Buffer<int>& buffer);
	~Consumer();

	void run();

private:
	Buffer<int>& buffer_;
};

