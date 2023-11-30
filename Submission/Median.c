#include <stdio.h>
#include <stdlib.h>

// I am using C to execute the psuedo code.

int n; // Global variable used to store the length of array

int sort(const void *a, const void *b)
{
    return *(int*)a - *(int*)b; // sorting algorithm
}
 // Writing the function given in psuedo code

int sortandFindMedian(int numbers[]) // Could have added the size of array as an additional parameter but would go against the psuedo code
{
    
    qsort(numbers,n, sizeof(int),sort); // using qsort function to sort the array
    
    if (n % 2 == 0)
    {
        return (numbers[n/2 -1] + numbers[n/2])/2; 
    }
    else
    {
        return numbers[n/2];
    }
}

void main()
{
    // int numbers[] = {10,5,21,15,2,9};
    int numbers[] = {20,19,12,50,5,32}; // user defined arrays
   
    
    n = sizeof(numbers) / sizeof(numbers[0]); // to find the length of the array

    int median = sortandFindMedian(numbers); // calling the median function

    printf("\n Hello! Welcome to the program to find the median of the numbers!!!");
    printf("\n \n The median of the numbers is: %d",median);
    
}

