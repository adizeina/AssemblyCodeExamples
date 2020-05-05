.data 
prompt: .asciiz "Enter an integer:  "
resultEven: .asciiz "THIS IS EVEN"
resultOdd: .asciiz "THIS IS ODD"
value1: .word 1

.text
main: 
	# Prompt the user to enter digit
	li $v0, 4
	la $a0, prompt
	syscall 
	#get user input
	li $v0, 5
	syscall
	#Store values int in $t0
	move $t0, $v0
	#load the registers with the value 0 or 1
	lw $t2, value1
	
	andi $t1 , $t0 , 0x0001    # will return 0 or 1 
	beq $t1, $t2, ELSE   
	  
	li $v0, 4
	la $a0, resultEven
	syscall
	j DONE 	

ELSE:   li $v0, 4
	la $a0, resultOdd
	syscall
	j DONE
	
DONE:
	


