#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include <thread>

using namespace std;
vector<string> adresses;


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

void vectorOut(){

	int edusize = 0;
	string edu = ".edu";
	string temp = "";


	for (int i = 0; i < adresses.size(); i++)
	{
		std::cout << "final: " << adresses[i] << endl;
		temp = adresses[i];

		if (temp.find(edu) != string::npos) {
			edusize++;
		}
	}
	cout << edusize << endl;

}

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