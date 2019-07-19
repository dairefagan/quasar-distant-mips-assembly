.data

# mul takes up to 3 registers, but only 2 16b input registers, result takes 32b
# mult takes 2 registers
# sli 

.text

addi $s0, $zero, 10
addi $s1, $zero, 4

mul $t0, $s0, $s1 # could have just mutliplied into $a0 here

add $a0, $zero, $t0

li $v0, 1

syscall
