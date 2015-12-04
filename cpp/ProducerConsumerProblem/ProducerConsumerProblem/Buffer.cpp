#include "Buffer.h"

using namespace std;

// cpp File from Buffer

// copys the value of the reader to an addresspointer. Gives back a boolvalue 
template<class T> bool Buffer<T>::pop(T *pointer)
{
	bool status = false;
	if (!Buffer<T>::isEmpty())
	{
		*pointer = b[reader];
		reader++;
		load--;
		if (reader >= _capacaty)
		{ reader = reader - _capacaty; }
		status = true;
	}
	return status;
}

// Adding an new element to the buffer. method is used by producer. Gives back a bool value 
template<class T> bool Buffer<T>::push(T element)
{
	bool status = false;
	if (!Buffer<T>::isFull())
	{
		b[writer] = element;
		writer++;
		load++;
		if (writer >= _capacaty){ writer = writer - _capacaty; }
		status = true;
	}
	return status;
}

// Check is the ringbuffer is empty
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
	if (load == _capacaty)
	{
		status = true;
	}
	return status;
}


// function to read out the number. first it creates a lockvariable and locks the thread and waits till the buffer is not empty anymore.
// then gets the value, unlocks the thread and notify the others.

template<class T> T Buffer<T>::remove() {
		unique_lock<mutex> locker(mu);
		T back;
		cond.wait(locker, [this](){return !isEmpty(); });
		pop(&back);
		locker.unlock();
		cond.notify_all();
		return back;
}
// function to add a number. first it creates a lockvariable and locks the thread and wait till the buffer is not full anymore. then it's adding
// the element, unlocks the thread and notifys all.

template<class T> void Buffer<T>::add(T elem) {
		unique_lock<mutex> locker(mu);
		cond.wait(locker, [this](){return !isFull(); });
		push(elem);
		locker.unlock();
		cond.notify_all();
}