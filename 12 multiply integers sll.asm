.data

.text

	addi $s0, $zero, 4
	
	sll $t0, $s0, 2 # think of the number as the index of 2, so here we are multiplyig by 4
	
	add $a0, $zero, $t0
	
	li $v0, 1
	
	syscall