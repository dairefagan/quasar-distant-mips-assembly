.data

	PI: .float 3.14

.text

	li $v0, 2	#Print float, code 2
	lwc1 $f12, PI 	#Load word to coprocessor1 for floats, and use $f12
	
	syscall
