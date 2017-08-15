apriori.exe : apriori.o
	g++ -std=c++11 -o apriori.exe apriori.o

apriori.o : apriori.cpp
	g++ -std=c++11 -c -o apriori.o apriori.cpp

