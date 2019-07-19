.data

	number1: .float 3.14
	
	number2: .float 2.71
	
	number3: .double 3.14
	
	number4: .double 2.71

.text

	main:
	
	# For floats we must use lwc1 instead of lw
	# 'Load word coprocessor 1'
	# We also use the f registers instead of s registers
	
	lwc1 $f2, number1
	lwc1 $f4, number2
	
	# For adding floats, 'add single precision' (32b):
	
	add.s $f12, $f2, $f4
	
	# Prints whatever value is in $f12:
	
	li $v0, 3
	syscall
	
	# For doubles we must use ldc1 instead of lw 
	# 'Load word coprocessor 1'
	
	ldc1 $f6, number3
	ldc1 $f8, number4
	
	
	
	# For adding doubles, 'add double precision' (64b):
	
	add.d $f10, $f6, $f8
	

	
	li $v0, 10
	syscall
