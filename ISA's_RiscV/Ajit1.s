.data
#Conversion of hexadecimal to decimal and result will be store in x8
firststring: .string "0x10"


.text
main:
la x5, firststring       #loadin the adress of firststring to the x5 register 
li x6 48                #This register i have used for converting the character to integer by substracting it and also for the condtion checking
                         #I also used this register to check the condition for ending the string
li x8 0                 #x8 , i have used to store the result        
addi  x5 x5 2            #string is start with "0x", so i have increament in pointer of the string by 2

loop:                                    
lb x7 0(x5)              #load the byte of string(where x5 is pointing) to x7 for comparing and adding into the result
blt x7 x6 final          #branch less that intruction is used to check ending of string
slli x8 x8 4             #left shift 4 times for multiply with 16
sub x7 x7 x6             # sub operation is used to convert character to integer
add x8 x8 x7             #adding into the result register (x8)
addi x5 x5 1             #increament in pointer which point to the string by 1
j loop                   # back to the loop


final:                 
addi a0 x0 10
ecall



