.data

.text

	addi $t0, $zero, 2000
	addi $t1, $zero, 10
	
	mult $t0, $t1 #takes 2 32b registers with a 64b result, versus mul's 2 16b registers
	
	mflo $s0 	# Move from lo, can use mfhi
	
	# Display:
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall
