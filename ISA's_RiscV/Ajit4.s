.data
#valarray: .zero 256

firststring: .string "Enter the size of the vector:"
secondstring: .string "Enter the vector elements, one integer per line:"
thirdstring : .string "The non-zero vector is:"
fourthstring: .string "The non-zero indices are:"


vector: .word 1000
vector1: .word 1000
.text
main:
li x4 1              # this register is used to decrease the register value by one of some register
li a0 4              # this register is used to increase the value of other register by word size
la a1, firststring   # load the adress of first string
ecall

li a0 5       
ecall

addi x2 a0 0    

li a0 4
la a1, secondstring  #loading the adress for second string
ecall


la x3 , vector    #taking a  array to store non-zero element
la x5 ,vector1    #taking a  array to store the index of non-zero element
li x6 0           #index
sub x6 x6 x4      
loop:
beq x2 x0 final
li a0 5
ecall
sub x2 x2 x4
addi x6 x6 1
beq a0 x0 loop
sw a0 0(x3)
sw x6 0(x5)
addi x3 x3 4
addi x5 x5 4
addi x7 x7 1
j loop


final: 
li a0 4
la a1, thirdstring
ecall
li x6 0
la x5 ,vector
loop1:
beq x6 x7 final1
lw a1 0(x5)
li a0 1
addi x6 x6 1
addi x5 x5 4
j loop1




final1:
addi a0 x0 10
ecall

li a0 4
la a1, fourthstring
ecall
li x6 0
la x5 ,vector1
loop2:
beq x6 x7 final2
lw a1 0(x5)
li a0 1
addi x6 x6 1
addi x5 x5 4
j loop2

final2:
addi a0 x0 10
ecall


