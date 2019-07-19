.data

	message:	.asciiz "The while loop has completed."
	space:		.asciiz ", "

# int i = 0

# while (i <= 10)

# {
#	i++;	
# }

.text

	main:
		addi $t0, $zero, 0 # i
		
	while:
		bgt $t0, 10, exit # while (i < 10)
		jal printNumber
		addi $t0, $t0, 1 # i++
		
		j while # Jump back to beginning of while.

	exit:
	
		# Display end of loop:
	
		li $v0, 4
		la $a0, message
		syscall
	
		li $v0, 10
		syscall
	
	printNumber:

		# Display i:
		
		add $a0, $t0, $zero 
		li $v0, 1
		syscall
		
		# Display commma and space after i:
		
		li $v0, 4
		la $a0, space
		syscall
		
		# Jump back to register address where subroutine was called:
		
		jr $ra