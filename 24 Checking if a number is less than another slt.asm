.data

	message1:	.asciiz	"The first number is not less than the second number"
	message2:	.asciiz	"The first number is less than the second number"	

.text

	main:
		addi $t0, $zero, 400
		addi $t1, $zero, 200
		
		slt $s0, $t0, $t1 # If $t0 is less than $t1, $s0 is set to 1, 0 if not
		
		beq $s0, $zero, printMessage1 # If above is false, ($s0 = 0)
		
		bne $s0, $zero, printMessage2 # If above is true, ($s0 = 1)
		
	printMessage1:
	
		la $a0, message1 
		li $v0, 4
		syscall

	printMessage2:
	
		la $a0, message2
		li $v0, 4
		syscall
					
	li $v0, 10
	syscall
