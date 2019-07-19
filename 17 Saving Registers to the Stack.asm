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
		
		# Print:
		
		move $a0, $s0
		li $v0, 1
		syscall
	
	# This line is going to signal end of program.
	
	li $v0, 10
	syscall
	
	increaseMyRegister:
	
		# Need to allocate enough space in stack, to store the old value for $s0
		
		addi $sp, $sp, -4 # 'Stack Pointer', allocates 4 bytes in the stack for subtracton (+4 for addition).
		sw $s0, 0($sp) # 'Save the value in $s0, to the first location in the stack)
		
		addi $s0, $s0, 30
		
		# Print new value, in function
		
		move $a0, $s0
		li $v0, 1
		syscall
		
		lw $s0, 0($sp) # Restore the value 
		addi $sp, $sp, 4 # Restore the stack
		
		jr $ra