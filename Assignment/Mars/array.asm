# MIPS code for computer architecture assignment - By Husnain Ahmed

.data

enterMsg0: .asciiz " \n "
enterMsg1: .asciiz "Please enter the last four digits of your student id \n"
enterMsg2: .asciiz "Press enter between each digit \n"
enterMsg3: .asciiz "Enter next digit \n"
enterMsg4: .asciiz "The total sum (addition) of the digits is: "
enterMsg5: .asciiz "The total sum (multiplication) of the digits is: "
	
    NumArray:  .space 16
.text
    #initialise 4 places in the array
    addi $s2,$zero, 0
    addi $s3,$zero, 0
    addi $s4,$zero, 0
    addi $s5,$zero, 0

    # reset $t0 to '0'
    addi $t0, $t0, 0
     

# output msg1
addi $v0, $zero, 4
la $a0, enterMsg1
syscall

## output msg2 
addi $v0, $zero, 4
la $a0, enterMsg2
syscall

# read an integer from keyboard input and store the input in $s0 for the total
addi $v0, $zero, 5
syscall
add $s0, $zero, $v0
add $s1, $zero, $v0

    addi $t0, $zero, 5
    sb $s2, NumArray($t0)
    

## calling the subroutine with jump and loops
addi $a1, $zero, 3
    
JalLoop:   
    jal msg3 
    subi $a1, $a1, 1
    
bnez $a1, JalLoop

# print array of inputted numbers
lb $t3, NumArray($zero)

li $v0, 1
addi $a0, $t3, 0
syscall

lb $t3, NumArray($s3)

li $v0, 2
addi $a0, $t3, 0
syscall

lb $t3, NumArray($s4)

li $v0, 2
addi $a0, $t3, 0
syscall

lb $t3, NumArray($s5)

li $v0, 3
addi $a0, $t3, 0
syscall

#gap
addi $v0, $zero, 4
la $a0, enterMsg0
syscall

## added total
addi $v0, $zero, 4
la $a0, enterMsg4
syscall

add $a0, $s0, $zero
addi $v0, $zero, 1
syscall

addi $v0, $zero, 4
la $a0, enterMsg0
syscall

#multiplied total
addi $v0, $zero, 4
la $a0, enterMsg5
syscall

add $a0, $s1, $zero
addi $v0, $zero, 1
syscall

addi $v0, $zero, 10
syscall

## subroutine
msg3:
    addi $v0, $zero, 4
    la $a0, enterMsg3
    syscall
    addi $v0, $zero, 5
    syscall
    add $s0, $s0, $v0
    mul $s1, $s1, $v0
    sb $s3, NumArray($t0)
        addi $t0, $t0, 5
    sb $s4, NumArray($t0)
        addi $t0, $t0, 5
    sb $s5, NumArray($t0)
        addi $t0, $t0, 5
    jr $ra
    
   

    

    

