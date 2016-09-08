#include <stdio.h>
#include <iostream>

using namespace std;
//function declaration
void display(int arr[], int size);
void shellSort(int arr[], int size);

int main(void) {
	//unsorted elements
	int arr[] = {14,18,19,37,23,40,29,30,11};

	//size of the array
	int n = sizeof(arr)/sizeof(arr[0]);

	//output unsorted elements
	display(arr, n);

	//sort the elements
	shellSort(arr, n);

	//display sorted elements
	display(arr, n);

	return 0;
}

void display(int arr[], int size) {
	int i;
	for(i = 0; i < size; i++) {
		printf("%d ", arr[i]);
	}
	printf("\n");
}

void shellSort(int arr[], int size) {
	int i, j, gap, temp;

	//we start with a bigger gap
	gap = size/2;

	while(gap > 0) {
		//now we will do the insertion sort of the gapped elements
		i = gap;

		while(i < size) {
			temp = arr[i];

			//shifting gap sorted element to correct location
 			for(j = i; (j >= gap) && (arr[j - gap] > temp); j -=gap)
			{
				cout<<"Replacing " <<arr[j]<<" With "<<arr[j - gap]<<endl;
				arr[j] = arr[j - gap];
			}
			arr[j] = temp;

			//increase i
			i++;
		}

		//reduce the gap by half
		gap = gap / 2;
	}
}
