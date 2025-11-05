.globl main
.data

n:	.word 5

.text
main:
	lw $a0, n	#a0 := n
	jal factorial	#v0 := factorial(n)
	move $a0, $v0	#a0 := v0
	li $v0, 1	#v0 := 1
	syscall		#print a0
	li $v0, 10	#v0 := 10
	syscall		#terminate
	
factorial:	addi $sp, $sp, -4	#sp := sp - 4
		sw $s0, 0($sp)		#włóż s0 na stos
		li $s0, 1		#temp := 1
		li $t0, 1		#i := 1
		addi $t1, $s0, 1	#ti := n+1
test_i:		slt $t2, $t0, $t1	#if i < n+1 then t2 := 1 else t2 := 0
		beq $t2, $zero, end_f	#if ~(i < n+1) then go to end_f
		mul $s2, $s2, $t0	#temp := temp * 1 
		addi $t0, $t0, 1	#i := i + 1
		j test_i		#go to test_i
end_f:		move $v0, $s0		#v0 := temp
		lw $s0, 0($sp)		#przywróć s0 ze stosu
		addi $sp, $sp, 4	#zwolnij miejsce na stosie
		jr $ra			#wyjście z procedury

	
