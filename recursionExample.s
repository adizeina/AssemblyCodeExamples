#for one-level function calls
.data 
result: .asciiz "The result is: "
prompt: .asciiz "Enter a number: "
numberGiven: .word 0
answer: .word 0

.text


	main:
	# Prompt the user to enter a digit     RIGHT 
	li $v0, 4
	la $a0, prompt
	syscall 
	 
	#get user input int value     RIGHT 
	li $v0, 5
	syscall
	
	
	sw $v0, numberGiven    #store it in $v0
	lw $a0, numberGiven    #load it in $a0
	jal mystery  
	
	sw $v0, answer
	
	# for printing out result  
	li $v0, 4 	# system call code for print_string
	la $a0, result 	# address of string to print
	syscall 	# print the string

	# Print the return value of mystery 
	li $v0,1
	lw $a0, answer 
	syscall
	
	# End of main, make a syscall to "exit"
	li $v0, 10 	# system call code for exit
	syscall 	# terminate program	


mystery:
	subu $sp, $sp , 8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	#Base 
	li $v0, 0    #return 0 
	beq $a0, 0, mysteryDone  #if n==0
	 
	move $s0, $a0 # actual current value of n is s0
	
	# 2*n -1 
	mul $s0, $s0, 2  # multiply value of by 2 and store into $t1
	sub $s0, $s0, 1
	
	# mystery(n-1)
	sub $a0, $a0, 1    # this is the n-1  
	jal mystery
	add $v0, $v0, $s0   #adds mstery(n-1) AND 2*n -1   
	
	mysteryDone: 
		lw $ra, ($sp)
		lw $s0, 4($sp)
		addu $sp, $sp, 8
		jr $ra
