.data

	prompt:		.asciiz "Enter the value of e: " 
	
.text

	# Display prompt:
	
	la $a0, prompt
	li $v0, 4
	syscall
	
	# Get the double from the user, 7 is code for double input:
	# Stores in $f0 AND $f1, because doubles use TWO registers. 
	
	li $v0, 7
	syscall
	
	# Display the user's input, 3 is code to display double:
	# 'Add double precision'. $f12 is for double arguments.
	
	add.d $f12, $f0, $f2
	li $v0, 3
	syscall
	