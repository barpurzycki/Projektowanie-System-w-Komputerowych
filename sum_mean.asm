.globl main

.data

A:	.word 	1, 2, 3, 4, 5, 6, 7, 8, 9
N:	.word 9

.text
main:
	la $a0, A
	li $a1, N
	jal mean
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
sum:
	li $t0, 0		#t0 := 0
	sll $t1, $a1, 2		#t1 := 4*p
	add $t1, $a0, $t1	#t1 := &A[p]
	move $t2, $a1		#t2 := i=p
	addi $t3, $a2, 1	#t3 := k+1 
sum_t_i:slt $t4, $t2, $t3	#if i<k+1 then t4 := 1 else t4 := 0
	beq $t4, $zero, sum_e	#if ~(i<k+1) then go to
	lw $t5, 0($t1)		#t5 := A[i]
	add $t0, $t0, $t5	#t0 := t0 + A[i]
	addi $t1, $t1, 4	#t1 := &A[i+1]
	addi $t2, $t2, 1	#t2 := i+1
	j sum_t_i		#go to sum_t_i
sum_e:	jr $ra			#exit sum

mean:	addi $sp, $sp, -8
	sw $a1, 4($sp)
	sw $ra, 0($sp)
	li $a0, 0
	addi $a2, $a1, -1
	li $a1, 0
	jal sum
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	addi $sp, $sp, 8
	div $v0, $v0, $a1
	jr $ra
