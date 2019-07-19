
.data

	myArray: .space 12 # For integer arrays, we need 4 bytes each

.text

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
	
	# Move vales from RAM array to CPU register:
	
	lw $t6, myArray($zero)
	
	# Display value in $t6:
	
	move $a0, $t6
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
