.data

	myCharacter: .byte 'm'	#Declare character

.text

	li $v0, 4		#Print character, code 4
	
	la $a0, myCharacter 	#Load *ADDRESS* of character from RAM into argument register $a0
	
	#lw $a0, myCharacter Why does this not work?
	
	syscall
