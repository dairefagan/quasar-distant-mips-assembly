.data

.text

	main:
		
		# $a0, $a1, $a2, and $a3 are used for passing values to functons:
		
		addi $a1, $zero, 50 
		addi $a2, $zero, 100
		
		jal addNumbers
		
		addi $a0, $v1, 0
		
		# Print:
		
		li $v0, 1
		syscall
	
		# End program:
	
		li $v0, 10
		syscall
	
	addNumbers:
	
		# $v1 is for returning values to main:
		
		add $v1, $a1, $a2 
	
		jr $ra
