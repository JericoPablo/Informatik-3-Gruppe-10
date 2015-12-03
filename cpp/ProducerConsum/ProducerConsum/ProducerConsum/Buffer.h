#pragma once

//Header class from the buffer. Defines the private & public methods. 


template<class T> class Buffer
{
public:
	Buffer(int capacaty) : capacaty(capacaty) // Constructor for the buffer. Input is the capacity
	{
		b = new T[capacaty];
		reader = 0;
		writer = 0;
		load = 0;
	}
	~Buffer() { delete[] b; }

	bool pop(T *pointer);
	void push(T element);
	bool isFull();
	bool isEmpty();

private:
	const int capacaty;
	T *b;
	int reader;
	int writer;
	int load;
};