
.data
	
	message1: .asciiz "It was true"
	
	message2: .asciiz "It was false"
	
	number1: .float 10.4
	
	number2: .float 10.4
	
	
.text

	main:
	
		lwc1 $f0, number1
	
		lwc1 $f2, number2
	
		# Compare single precision numbers:
	
		c.eq.s $f0, $f2
		
		# c.le.s, c.le.d, less than or eual to.
	
		# 'Branch if coprocessor 1 true'.
		# Can also use bc1f
	
		bc1t Equal
	
		# If not equal the following code runs:
	
		li $v0, 4
		la $a0, message2
		syscall
	
		li $v0, 10
		syscall
	
	Equal:
	
		la $a0, message1
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall