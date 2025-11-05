.globl main
.data

n:	.word 5

.text
main:
	lw $a0, n	#a0 := n
	jal fib		#v0 := fib(n)
	move $a0, $v0	#a0 := v0
	li $v0, 1	#v0 := 1
	syscall		#print a0
	li $v0, 10	#v0 := 10
	syscall		#terminate
	
fib:		
	li $t0, 1	#t0 := 1
	bne $a0, $zero, test_1
	li $v0, 0	#v0 := 0
	jr $ra
test_1: bne $a0, $t0, rek
	li $v0, 1	#v0 := 1
	jr $ra
rek:	addi $sp, $sp, -12
	sw $a0, 8($sp)
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	addi $a0, $a0, -1
	jal fib
	move $s0, $v0
	addi $a0, $a0, -2
	jal fib
	add $v0, $s0, $v0
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12
	jr $ra
