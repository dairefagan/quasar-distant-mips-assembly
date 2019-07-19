
.data

	myArray: .space 12 # For integer arrays, we need 4 bytes each

	newLine: .asciiz "\n"

.text

	main:

		# These values go into the registers in the CPU:

		addi $s0, $zero, 4
		addi $s1, $zero, 10
		addi $s2, $zero, 12
	
		# $t0 will be our index.
	
		addi $t0, $zero, 0
	
		# Move values from CPU registers to RAM array
	
		sw $s0, myArray($t0)
			addi $t0, $t0, 4
		sw $s1, myArray($t0)
			addi $t0, $t0, 4
		sw $s2, myArray($t0)
	
		# Clear $t0 to 0 for index:
	
		addi $t0, $zero, 0
	
	while:
		# If the value in $t0 = 12, break out of while loop
	
		beq $t0, 12, exit
	
		lw $t6, myArray($t0)
		
		addi $t0, $t0, 4
		
		# Display current number:
		
		move $a0, $t6
		li $v0, 1
		syscall
		
		# Prints a new line:
		
		la $a0, newLine
		li $v0, 4
		syscall
	
		j while
	
	exit:
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
