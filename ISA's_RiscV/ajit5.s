#x4 is used to store the result for octal to decimal
#x5 is used to store the result for binary to decimal
.data
#Conversion of binary to decimal and octal to decimal
firststring: .string "d13"                 # this string is in octal  
secondstring: .string "b10100"             # this string is in binary

.text
main:
la x2, firststring         #load the adress for firststring in x2 to preform the octal to decimal
li x3 48                   # This register is used to check the condition like is pointer pointed by firststring is pointing to NULL or not
                           # also x3 is used to convert integer from character
li x4 0                    #This register store the result of octal to decimal
addi  x2 x2 1              #increament in pointer of firststring because initially it point to the d
# this loop is used to calculation of result from octal to decimal
loop1:            
lb x6 0(x2)                #load word to x6 which is pointed by x2
blt x6 x3 loop2            #this condition will hit when x2 point to the NULL of string
slli x4 x4 3               #we have done left shift three time to multiply with 8 while conversion
sub x6 x6 x3               #substract x3(48) from x6 to convert the integer from the character character
add x4 x4 x6               #adding into the result in each iteration
addi x2 x2 1               #increament in pointer of firststring
j loop1
#this loop is used to store all the value into register for calculating the binary to decimal
loop2: 
la x2, secondstring       #load the adress for secondstring in x2 to preform the binary to decimal     
li x3 48                  #This register is used to check the condition like is pointer pointed by firststring is pointing to NULL or not
                          # also x3 is used to convert integer from character
li x5 0                   #This register store the result of binary to decimal
addi  x2 x2 1             #increament in pointer of secondstring because initially it point to the b     
j loop3                   #jumping loop3 to perform the binary to decimal conversion

# this loop is used to calculation of result from binary to decimal
loop3:                    
lb x7 0(x2)       #load word to x7 which is pointed by x2
blt x7 x3 final   #this condition will hit when content of x7 is NULL
slli x5 x5 1      #left shift the result by 1 to multiply with 2 in each iteration
sub x7 x7 x3      #substract 48 to convert character to integer
add x5 x5 x7      #adding into the result in each iteration
addi x2 x2 1      #increament the pointer by one
j loop3


final: 
addi a0 x0 10
ecall



