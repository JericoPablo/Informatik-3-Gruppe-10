#include "Buffer.h"
#include <iostream>

using namespace std;

//cpp File from Buffer


// copys the value of the reader to an adresspointer. Gives back a bool if Buffer is empty 
template<class T> bool Buffer<T>::pop(T *pointer)
{
	bool status;
	if (!Buffer<T>::isEmpty())
	{
		*pointer = b[reader];
		reader++;
		load--;
		if (reader >= capacaty) reader = reader - capacaty;
		status = true;
	}
	else {
		status = false;
	}
	return status;
}

// Adding a new element to the buffer.used by producer
template<class T> void Buffer<T>::push(T element)
{
	if (!Buffer<T>::isFull())
	{
		b[writer] = element;
		writer++;
		load++;
		if (writer >= capacaty) writer = writer - capacaty;
	}
}
// Check if the ringbuffer is empty 
template<class T> bool Buffer<T>::isEmpty()
{
	bool status = false;
	if (load == 0)
	{
		status = true;
	}
	return status;
}

// Check if the ringbuffer is full 
template<class T> bool Buffer<T>::isFull()
{
	bool status = false;
	if (load == capacaty)
	{
		status = true;
	}
	return status;
}