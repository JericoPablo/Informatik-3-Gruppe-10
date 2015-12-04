#include "Consumer.h"
#include "Buffer.cpp"
#include <iostream>
#include <thread>
#include <chrono>


// cpp File from Consumer

Consumer::Consumer(Buffer<int>& buffer) : buffer_(buffer) // Default Constructor for the Consumerclass. Input parameter is an Integer buffer
{
}

Consumer::~Consumer() // Deconstructor for Consumerclass
{
}

void Consumer::run() {  // Takes the number from the buffer remove function. Then it locks the console. Next step is printing out the number 
						// makes the thread sleeping for 50 milliseconds and unlocks the console
	while (true) {
		int num = buffer_.remove();
		buffer_.cout_mu.lock();
		std::cout << "Consumed: " << num << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(50));
		buffer_.cout_mu.unlock();
	}
}



