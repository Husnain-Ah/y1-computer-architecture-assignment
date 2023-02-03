.data

enterMsg0: .asciiz " \n "
enterMsg1: .asciiz "Please enter the last four digits of your student id \n"
enterMsg2: .asciiz "Press enter between each digit \n"
enterMsg3: .asciiz "Enter next digit \n"
enterMsg4: .asciiz "The total sum (addition) of the digits is: "
enterMsg5: .asciiz "The total sum (multiplication) of the digits is: "
	
.text

#variable things

addi $a1, $zero, 3


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

## calling the subroutine with jump and loops
jal msg3
jal msg3
jal msg3


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
    jr $ra
    

    

    

