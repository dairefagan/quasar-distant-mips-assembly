.data

	newLine:	.asciiz "\n"
	
.text

	main:
	
		addi $s0, $zero, 10
		
		jal increaseMyRegister
		
		# Print a new line:
		
		la $a0, newLine
		li $v0, 4
		syscall
		
		jal printTheValue
	
	# This line is going to signal end of program.
	
	li $v0, 10
	syscall
	
	increaseMyRegister:
	
		# Need to allocate enough space in stack, to store the old value for $s0 & $ra
		
		addi $sp, $sp, -8 # 'Stack Pointer', allocates 4 bytes in the stack for subtracton (+4 for addition).
		sw $s0, 0($sp) # 'Save the value in $s0, to the first location in the stack)
		sw $ra, 4($sp) # Store the address for the nested procedure to return to.
		
		# We store the $ra before the second function call, because the call to printTheValue changes the
		# read address to a increaseMyRegister, and if we do not restore the original $ra, increaseMyRegister
		# will try to jr to itself, rather than to main.
		
		
		addi $s0, $s0, 30
		
		# Nested procedure to print: 
		
		jal printTheValue
		
		lw $s0, 0($sp) # Restore the value
		lw $ra, 4($sp) # Restore old address after function call
		addi $sp, $sp, 4 # Restore the stack
		
		jr $ra
		
	printTheValue:

		move $a0, $s0
		li $v0, 1
		syscall
		
		jr $ra
