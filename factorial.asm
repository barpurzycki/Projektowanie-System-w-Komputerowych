.global main

.data

n: .word 5

.text
main:
    lw $a0, n        #a0 := n
    jal factorial        #v0 := factorial(n)
    move $a0, $v0        #a0 := v0
    li $v0, 1        #v0 := 1
    syscall            #print a0
    li $v0, 10        #v0 := 10
    syscall            #terminate

factorial:
    li $t0, 0        #t0 := 0
    beq $a0, $zero, test_0    #if(n==0) return 1

test_0:
    li $v0, 1        #v0 := 1
    jr $ra

rek:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $ra, 0($sp)

    addi $a0, $a0, -1
    jal factorial        #factorial(n-1)

    lw $a0, 0($sp)
    mul $v0, $a0, $v0    #n * factorial(n-1)

    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
