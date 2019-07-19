.data

	message:	.asciiz	"Hi, how are you"

.text

	main:
	
		addi $s0, $zero, 10
		# addi $s1, $zero 14
	
		# bgt $s0, $s1, displayHi # 'Branch if >" Can also use blt
	
		bgtz $s0, displayHi
	
		li $v0, 10
		syscall
	
	displayHi:
		
		la $a0, message
		li $v0, 4
		syscall