.data
	message:	.asciiz	"Hello, "
	
	userInput:	.space	20

.text

	main:
	
		# Get input from user, 8 is code for text:
		
		la $a0, userInput # Address for space in RAM
		li $a1, 20 # Specifies lenght of a0
		li $v0, 8
		syscall
		
		# Display hello:
		
		la $a0, message
		li $v0, 4
		syscall
		
		# Display the input name:
		
		la $a0, userInput
		li $v0, 4
		syscall
		
		# Tell the system this is the end of the main function:
	
		li $v0, 10
		syscall
