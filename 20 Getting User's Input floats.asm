.data

	message:	.asciiz	"Enter the value of Pi: "
	
	zeroAsFloat:	.float	0.0 

.text

	#lwc1 $f4, zeroAsFloat, not required, f registers default to 0
	
	# Display message:
	
	la $a0, message
	li $v0, 4
	syscall
	
	# Read in user input, 6 is code for float, returns to $f0:
	
	li $v0, 6
	syscall
	
	# Display float, 2 is code for float.
	# Add single precision, $f12 is float argument.
	
	add.s $f12, $f0, $f4
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall
