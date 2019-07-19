.data

	age: .word 34		#Declare Integer
.text

	li $v0, 1 		#Print an integer, code 1
	lw $a0, age		#Load *ACTUAL* word, *ACTUAL* integer data, from RAM,
				#into argument register $a0.
	
	syscall
