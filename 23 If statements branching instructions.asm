.data

	message1:	.asciiz "The numbers are equal."
	
	message2:	.asciiz "The numbers are not equal"
	
	message3:	.asciiz "Nothing happened."
	
.text

	main:
		
		addi $t0, $zero, 5
		addi $t1, $zero, 20
	
		# 'Branch if equal':
		
		# beq $t0, $t1, numbersEqual
	
		bne $t0, $t1, numbersNotEqual
		
		# We can also just branch with 'b labelname' unconditionally
			
		li $v0, 10
		syscall
		
	#numbersEqual:
	
	#	la $a0, message1
	#	li $v0, 4
	#	syscall
	
	numbersNotEqual:
	
	la $a0, message2
	li $v0, 4
	syscall