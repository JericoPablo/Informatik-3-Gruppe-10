#pragma once
#include <mutex>
#include <condition_variable>

// Header class from the buffer. Defines the private & public methods and variables

template<class T> class Buffer
{
public:
	// Constructor for the buffer. Input is the capacaty
	Buffer(int capacaty) : _capacaty(capacaty)
	{
		b = new T[capacaty];
		reader = 0;
		writer = 0;
		load = 0;
	}
	~Buffer() { delete[] b; }

	void add(T elem);
	T remove();

	bool pop(T *pointer);
	bool push(T element); 
	bool isFull();
	bool isEmpty();
	std::mutex cout_mu;

private:
	const int _capacaty;
	T *b;
	int reader;
	int writer;
	int load;
	std::mutex mu;
	std::condition_variable cond;
};
