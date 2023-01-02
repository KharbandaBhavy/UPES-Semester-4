# Code by Bhavy Kharbanda
# Sap Id: 500082531
# Implement a guessing game where computer chooses a number and the user gets five chances to guess that number. If he can guess within the given limit he will win otherwise loose. 

print("\n Welcome to the game:")
print("You will get five chances to guess the number")
print("If your guess is correct within these chances, You Win!")
print("Otherwise you loose")
# Computer's number
secret = 14
count = 0
limit = 5
while count<limit:
    guess = int(input("\nGuess the number: "))
    count +=1
    if guess==secret:
        print("\nYou won!")
        break
else:
    print("\nYou lose !")
    

