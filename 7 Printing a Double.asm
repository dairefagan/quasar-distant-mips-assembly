.data

	myDouble:	.double 7.202
	zeroDouble:	.double 0.0

.text

	ldc1 $f2, myDouble			#Loads a pair of registers ($f2 and $f3), as a double is 64b
	ldc1 $f0, zeroDouble			#$f0 and $f1
	
	li $v0, 3 				#Print double, code 3
	add.d $f12, $f2, $f0		        #Adds doubles and loads to argument $f12
	
	syscall
