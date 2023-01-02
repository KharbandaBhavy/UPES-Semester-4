// Code by Bhavy Kharbanda
// Objective: Study & implementation of the concept of Bit Stuffing and De-Stuffing.


#include <stdio.h>
#include <string.h>
void bitStuffing(int N1, int arr1[])
{
    int brr[30];
    int i = 0, j = 0, k;
    int count = 1;
    while (i < N1)
    {
        // If the current bit is a set bit
        if (arr1[i] == 1)
        {
            brr[j] = arr1[i];
            for (k = i + 1;
                 arr1[k] == 1 && k < N1 && count < 5;
                 k++)
            {
                j++;
                brr[j] = arr1[k];
                count++;
                // If 5 consecutive set bits are found insert a 0 bit
                if (count == 5)
                {
                    j++;
                    brr[j] = 0;
                }
                i = k;
            }
        }
        else
        {
            brr[j] = arr1[i];
        }
        i++;
        j++;
    }
    for (i = 0; i < j; i++)
        printf("%d", brr[i]);
}
void bitDestuffing(int N2, int arr2[])
{
    int brr[30];
    int i = 0, j = 0, k;
    int count = 1;
    while (i < N2)
    {
        // If the current bit is a set bit
        if (arr2[i] == 1)
        {
            // Insert into array brr[]
            brr[j] = arr2[i];
            // Loop to check for the next 5 bits
            for (k = i + 1;
                 arr2[k] == 1 && k < N2 && count < 5;
                 k++)
            {
                j++;
                brr[j] = arr2[k];
                count++;
                // If 5 consecutive set bits are found skip the next bit in arr[]
                if (count == 5)
                {
                    k++;
                }
                i = k;
            }
        }
        else
        {
            brr[j] = arr2[i];
        }
        i++;
        j++;
    }
    for (i = 0; i < j; i++)
        printf("%d", brr[i]);
}
int main()
{
    int N1, N2;
    int arr1[30], arr2[30];
    printf("\n Enter the size of array (less than 30): ");
    scanf("%d", &N1);
    printf("\n Enter the array for stuffing: ");
    for (int i = 0; i < N1; i++)
        scanf("%d", &arr1[i]);
    printf("\n After performing bit Stuffing in the given array: ");
    bitStuffing(N1, arr1);
    printf("\n Enter the size of array: ");
    scanf("%d", &N2);
    printf("\n Enter the array for stuffing: ");
    for (int i = 0; i < N2; i++)
        scanf("%d", &arr2[i]);
    printf("\n After performing bit De-Stuffing in the given array: ");
    bitDestuffing(N2, arr2);
    return 0;
}
