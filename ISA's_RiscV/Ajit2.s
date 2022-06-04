.data
firststring: .string "9836"

.text
main:
li x1 48                  # for checking condition and converting the character to string
la x2, firststring        # load adress of the string
li x3 10                  # for multiply with result to convert into decimal
li x4 0                   #it will store the result


loop:  
lb x5 0(x2)              #load byte to x5 which is pointed by x2(string pointer)      
blt x5 x1 final          #if it hit ending of string condition then out from the loop and goes to "Final" loop
mul x4 x4 x3             #multiplying with 10 to ersult in each iteration
sub x5 x5 x1             #converting the character to interger by substracting with 48
add x4 x4 x5             #adding the digit value in result in each iteration
addi x2 x2 1             #increament the string pointer by one
j loop
 

final:
addi a0 x0 10
ecall