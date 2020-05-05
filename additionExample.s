.data 
promptA: .asciiz "Enter an int A: "
promptB: .asciiz "Enter an int B: "
promptC: .asciiz "Enter an int C: "
resultAdd: .asciiz "A + B + C = " 

.text

	# Prompt the user to enter digit A
	li $v0, 4
	la $a0, promptA
	syscall 
	#get user input B
	li $v0, 5
	syscall
	#Store values int B in $t0
	move $t0, $v0
	
	# Prompt the user to enter digit B
	li $v0, 4
	la $a0, promptB
	syscall 
	#get user input B 
	li $v0, 5
	syscall
	#Store values int B in $t1
	move $t1, $v0
	
	# Prompt the user to enter digit C
	li $v0, 4
	la $a0, promptC
	syscall 
	#get user input C 
	li $v0, 5
	syscall
	#Store values int C in $t3
	move $t3, $v0
	
	# Make two additions in two different registers because we cant add 3 inputs integers
	add $t2, $t1, $t0
	add $t4, $t3, $t2
	
	# to print in the format "A + B + C = "
	li $v0, 4
	la $a0, resultAdd
	syscall
	
	# to print answer from the 4th register 
	li $v0, 1
	move $a0, $t4	
	syscall 
	
	
