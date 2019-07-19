.data

	message:	.asciiz "Hi everybody.\nMy name is Dáire.\n"


.text
	
	main:
		jal displayMessage # 'Jump and Link', jump to function, link location to $ra (read address).
	
		# Print number 5 to the screen:
		
		addi $s0, $zero, 5
		add $a0, $zero, $s0
		
		li $v0, 1
		syscall
	
		# Tell the system that the program is complete:
	
		li $v0, 10
		syscall
	
	# Function:
	
	displayMessage:
		
		la $a0, message
		li $v0, 4
		syscall
		
		jr $ra # 'Jump Register', go back to read address, where the function was called from.
