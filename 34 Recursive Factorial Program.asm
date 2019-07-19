
.data

	# .asciiz displays a line after the text

	promptMessage: .asciiz "Enter a number to find its factorial: "
	
	# .ascii does NOT display a line after the text
	
	resultMessage: .ascii "\nThe factorial of the number is "
	
	theNumber: .word 0
	
	theAnswer: .word 0

.text

	# Declaring main as global means it can be refereneced from other files:

	.globl main
	
	main:
	
		# Read in the number from the user:
		
		la $a0, promptMessage
		li $v0, 4
		syscall
		
		# Code 5 to read in an integer:
		
		li $v0, 5
		syscall
		
		# Store the number input to theNumber in RAM
		
		sw $v0, theNumber
		
		# Call the findFactorial function:
		
		lw $a0, theNumber # Load the user input number from RAM as argument.
		jal findFactorial # Call		
		sw $v0, theAnswer # Store the output from the function to RAM
			
		# Display the result:
		
		la $a0, resultMessage
		li $v0, 4
		syscall
		
		lw $a0, theAnswer
		li $v0, 1
		syscall
		
		# End of program:
		
		li $v0, 10
		syscall
		
#--------------------------------------------------------------
# findFactorial function:

	.globl findFactorial
	
	findFactorial:
	
		# Make space in the stack for two values:
	
		subu $sp, $sp, 8
			
			# Store tbe current read address:
		
		sw $ra, ($sp)
		
			# Store $s0 so it is preserved by the subroutine:
			
		sw $s0, 4($sp)
		
		# Base Case (terminates factorial):
		
			# Return 1:
		
		li $v0, 1
		
			# If theNumber is 0, jump:
		
		beq $a0, 0, factorialDone
		
		# Non-base cases, findFactorial(theNumber - 1):
		
		move $s0, $a0
		sub $a0, $a0, 1
		jal findFactorial
		
		# 'This is where the magic happens:
		
		mul $v0, $s0, $v0
		
	factorialDone:
	
		# Restore read address, $s0, and the stack.
		# Jumps back to the where findFactorial was first called in main.
	
		lw $ra, ($sp)
		lw $s0, 4($sp)
		addu $sp, $sp, 8
		
		jr $ra
		
