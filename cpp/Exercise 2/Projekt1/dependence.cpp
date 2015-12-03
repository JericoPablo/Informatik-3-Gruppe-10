#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include <thread>
using namespace std;

//Program that reads in two txt files with emailadresses and sort the '.edu' adresses out

//Global variable of an adresses vector
vector<string> adresses;



// Method that reads in the first textfile and push the adresses it to the vector. 

void readText1(){

	


	std::ifstream file("C:\\Users\\Thomas Rasp\\Desktop\\aufgbe2_mails\\mails1.txt");
	std::string str;
	while (std::getline(file, str))
	{
		adresses.push_back(str);
		
	}
	//for (int i = 0; i < adresses.size(); i++)
	//{
	//	std::cout << "first: " << adresses[i] << endl;
	//}
}

// Method that reads in the second textfile and push the adresses it to the vector. 
void readText2(){


	std::ifstream file("C:\\Users\\Thomas Rasp\\Desktop\\aufgbe2_mails\\mails2.txt");
	std::string str;
	while (std::getline(file, str))
	{
		adresses.push_back(str);

	}
	//for (int i = 0; i < adresses.size(); i++)
	//{
	//	std::cout << "second: " << adresses[i] << endl;
	//}


}


//Gives back a list of all emails and the the quantity of the adresses that ends with '.edu'
void vectorOut(){

	int edusize = 0;
	string edu = ".edu";
	string temp = "";


	for (int i = 0; i < adresses.size(); i++)
	{
		std::cout << i+1 <<". " << adresses[i] << endl;
		temp = adresses[i];

		if (temp.find(edu) != string::npos) {
			edusize++;
		}
	}
	cout << "quantity of adresses that ends with '.edu': " << edusize << endl;

}


// main method of the programm. packs the methods in threads
int main(){


	thread t1(readText1);
	t1.join();

	thread t2(readText2);
	t2.join();

	thread t3(vectorOut);
	t3.join();

	cin.get();
	return 1;
}