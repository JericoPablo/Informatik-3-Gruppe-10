#include "Producer.h"
#include "Consumer.h"
#include "Buffer.cpp"
#include <iostream>
#include <thread>
#include <chrono>
#include <random>
// cpp File from Producer

Producer::Producer(Buffer<int>& buffer) : buffer_(buffer) // Default constructor for the Producerclass. Input parameter is an Integer buffer
{
}

Producer::~Producer() // Default deconstructor
{
}


void Producer::run() { // calls produce() and gives the number to the add method. Then it locks the console for an output.
					   // then the thread sleeps for 50 milliseconds and unlocks the console
	while (true) {
		int num = produce();
		buffer_.add(num);
		buffer_.cout_mu.lock();
		std::cout << "Produced: " << num << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(50));
		buffer_.cout_mu.unlock();

	}
}  // produce method that generates a random integer number

int Producer::produce(){
	std::random_device rd;
	int num = rd() % 1000;
	return std::abs(num);
}

int main() // Main method that generates a Buffer, Producer, Consumer
{
	Buffer<int> b = Buffer<int>(10);
	Producer p(b);
	Consumer c(b);

	std::thread producer_thread_1(&Producer::run, p);
	std::thread consumer_thread_1(&Consumer::run, c);
	std::thread producer_thread_2(&Producer::run, p);
	std::thread producer_thread_3(&Producer::run, p);

	producer_thread_1.join();
	producer_thread_2.join();
	producer_thread_3.join();
	consumer_thread_1.join();


	return 0;
}