.data

	prompt:		.asciiz "Enter your age: "
	message:	.asciiz "\nYour age is: "

.text

	# Prompt the user to enter age:
	
	la $a0, prompt 
	li $v0, 4
	syscall
	
	# Get the user's age, 5 is code for integer input:
	
	li $v0, 5
	syscall
	
	# Store the age input in $t0
	
	move $t0, $v0
	
	# Display age message:
	
	la $a0, message
	li $v0, 4
	syscall
	
	# Display age value
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
