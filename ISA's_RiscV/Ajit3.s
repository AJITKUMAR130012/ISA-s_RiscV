.data
firststring: .string "MADA"            # x4 is 1 if it is palindrom otherwise zero
                                
.text
main:
li x5 1               #it has 1 and it is used for decreasing the pointer which point from the last 
li x6 65             # for checking condition like is it pointing to NULL because all the character ascii will be greter that 65(lower is started from 97)
la x2, firststring   # adress of the string
                     # Here we have taken two pointer, we will make one pointer point from the back for comparision
la x3, firststring   # adress of the string

# this will take a pointer to the NULL ending of the string
loop1:       
lb x1 0(x3)        #load the byte to x1 which is pointed by x3
blt x1 x6 loop2    #This condition is checking the if it point NULL in string the control flow goes to loo2
addi x3 x3 1       #increament in x3 pointer
j loop1  
 # this loop make pointing to x3 to last word
loop2:
sub x3 x3 x5       #loop2 control flow comes when x3 is pointing to null so here we will reduce the pointer by one to point it the last element of string
j loop3

loop3:             #this loop is checking each word one by one

lb x7 0(x3)        #load the byte which is pointed by x3( it point the word from back)
lb x8 0(x2)        #load the byte which is pointed by x2( it point the word from front)
ble x3 x2 final1   #in case of even length palindrom it point to the same word and if case of even length palindrom it x3 pointer value become less
                   #than x2. so when this condition hit then control flow goes to the final1
bne x7 x8 final2   #it compare the word present in x7 and x8, when both are not equal then control flows goes to final2
addi x2 x2 1       #increament in pointer when it doesn't hit the above both condition to check the next word
sub x3 x3 x5       #Decreament in pointer when it doesn't hit the above both condition to check the next word
j loop3


final1:           # this block will execute when given string is palindrom
li x4 1           #x4=1 store the result when given string is palindrom
addi a0 x0 10     
ecall

final2:           # this block will execute when given string is not palindrom
li x4 0           #x4=0 store the result when given string is not palindrom
addi a0 x0 10
ecall