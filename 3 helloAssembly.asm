.data

	myMessage: .asciiz 	"Hello World \n"    #Declare string in RAM

.text

	li $v0, 4		#print
	la $a0, myMessage	#Characters, strings, and Integers load address from RAM into 
				#argument register $a0.
	
	syscall
	
