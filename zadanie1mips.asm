.data
f:	.word 0
g:	.word 0
h:	.word 0
i:	.word 5
j:	.word 3
A:	.word 1, 2, 3, 4
B:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

.text
lw $s0, f # s0 := f
lw $s1, g # s1 := g
lw $s2, h # s2 := h
lw $s3, i # s3 := i
lw $s4, j # s4 := j

la $s6, A # s6 := A
la $s7, B # s7 := B

sub $t0, $s3, $s4
sll $t0, $t0, 2
add $t0, $s6, $t0
lw $t1, 0($t0)
sw $t1, 32($s7)

syscall
