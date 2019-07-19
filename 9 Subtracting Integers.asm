.data

	number1: .word 20
	number2: .word 8

.text

	lw $s0, number1		#Loads value of symbol number1, 20
	lw $s1, number2		#Loads value of symbol number2, 8
	
	sub $t0, $s0, $s1
	
	li $v0, 1
	move $a0, $t0
	
	syscall
	
	
	
	