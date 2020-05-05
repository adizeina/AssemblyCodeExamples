# func1.s
.data
before: .asciiz "Before function\n"
resAdd: .asciiz "A + B is: "
resSub: .asciiz "A - B is: "
newline: .asciiz "\n"

.text
main:
	li $t0, 5	# hard coded value for A
	li $t1, 3	# hard coded value for B

	li $v0, 4 	# system call code for print_string
	la $a0, before 	# address of string to print
	syscall 	# print the string

	li $v0, 4 	# system call code for print_string
	la $a0, resAdd 	# address of string to print
	syscall 	# print the string
	
	

	# TODO: setup the arguments for function call doAdd
	addi $a0, $t0, 0     #Z
	addi $a1, $t1, 0     #Z
	
	jal doAdd 	# Make a function call to doAdd()
	#TODO: what exactly does jal do? Lookup the reference sheet. 
	#ANSWER: The jal instruction (jump and link), performs an unconditional jump to the address provided, and saves the
	#address of the next instruction in the $ra (return address) register, thus linking the subprogram to the origin of the call

	# TODO: print the return value of doAdd
	li $v0,1
	addi $a0, $v1, 0 
	syscall
	
	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	

	li $v0, 4 	# system call code for print_string
	la $a0, resSub 	# address of string to print
	syscall 	# print the string

	# TODO: setup the arguments for function call doSub
	sub $a0, $t0, 0     #Z
	sub $a1, $t1, 0     #Z
									
	jal doSub 	# Make a function call to doSub()
	
	# TODO: print the return value of doSub
	li $v0,1
	addi $a0, $v1, 0 
	syscall

	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	
	
	
									
	# End of main, make a syscall to "exit"
	li $v0, 10 	# system call code for exit
	syscall 	# terminate program	
	
# start of function doAdd()
doAdd:
	add $v1, $a0, $a1
	jr $ra
	# TODO: what need to be done here?
	

# start of function doSub()
doSub:
 	sub $v1, $a0, $a1
 	jr $ra
	# TODO: what need to be done here?
 	 
