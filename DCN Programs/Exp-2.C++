// Code by Bhavy Kharbanda
// Objective: Study & implementation of the concept of Cyclic Redundancy check.

#include <stdio.h>
#include <string.h>
void main()
{
    printf("\nCode by Bhavy Kharbanda");
    printf("\nSap Id: 500082531");
    int i, j, div_len, data_len;
    char data[50], div[20], temp[20], quot[50], rem[20], key[20];
    // For getting the dividend or the message to be checked and the divisor.
    printf("\n\nEnter Data to be sent/checked: ");
    gets(data);
    printf("Enter the Divisor: ");
    gets(div);
    div_len = strlen(div);
    data_len = strlen(data);
    strcpy(key, div);
    for (i = 0; i < div_len - 1; i++)
        data[data_len + i] = '0';
    for (i = 0; i < div_len; i++)
        temp[i] = data[i];
    // To divide and apply XOR operations.
    for (i = 0; i < data_len; i++)
    {
        quot[i] = temp[0];
        if (quot[i] == '0')
            for (j = 0; j < div_len; j++)
                div[j] = '0';
        else
            for (j = 0; j < div_len; j++)
                div[j] = key[j];
        for (j = div_len - 1; j > 0; j--)
        {
            if (temp[j] == div[j])
                rem[j - 1] = '0';
            else
                rem[j - 1] = '1';
        }
        rem[div_len - 1] = data[i + div_len];
        strcpy(temp, rem);
    }
    strcpy(rem, temp);
    printf("\nQuotient founded is: ");
    for (i = 0; i < data_len; i++)
        printf("%c", quot[i]);
    printf("\nRemainder found is: ");
    for (i = 0; i < div_len - 1; i++)
        printf("%c", rem[i]);
    printf("\nFinal data to be sent is: ");
    // Combining the Dividend and the remainder to get the Final Data.
    for (i = 0; i < data_len; i++)
        printf("%c", data[i]);
    for (i = 0; i < div_len - 1; i++)
        printf("%c", rem[i]);
    printf("\n\n");
}
