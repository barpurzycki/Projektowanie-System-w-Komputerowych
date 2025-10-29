.data

a:	.word 5
b:	.word 2
D: 	.word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

.text

	lw $s0, a		#s0 := a
	lw $s1, b 		#s1 := b

	la $t2, D 		#s2 := &D

	li $t0, 0 		#t0 := 0
cond_i:	slt $t2, $t0, $s0	#if ~(i<a) then
	beq $t2, $zero, end_i 	#go to koniec_i
	li $t1, 0		#t1 := 0
cond_j:	slt $t3, $t1, $s1 	#if ~(j<b) then
	beq $t3, $zero, end_j	#go to koniec_j
	add $t4, $t0, $t1 	#t4 := i+j
	sll $t5, $t1, 4		#t5 := 4*4*j
	add $t5, $s3, $t5	#t5 := &D+16*j = &D[4j]
	sw $t4, 0($t5)		#D[4j] := i+1
	addi $t1, $t1, 1	#j := j+1
	j cond_j		#go to cond_j
end_j:	addi $t0, $t0, 1	#i := i+1
	j cond_i		#go to cond_i
end_i:	li $v0, 10
	syscall			#terminate
