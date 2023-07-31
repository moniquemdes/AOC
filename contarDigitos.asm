# Contador de ocorrências de um dígito k em um número n 
.data
    pularLinha: .ascii "\n"
.text
.globl main

main:
    while:
    #pegar inteiro
    li $v0, 5
    syscall
    move $a0, $v0

    beq $a0, $zero, end

    li $v0, 5      
    syscall
    move $a1, $v0

    jal contarDig

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, pularLinha
    syscall

    j while

end:
    li $v0, 10
    syscall

contarDig:
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $s0, 12($sp)

    li $v0, 0
    li $t0, 10
    div $a0, $t0 
    mflo $a0    # $a0 = quociente
    mfhi $s0    # $s0 = resto
    beq $a0, $zero, verificar 
    jal contarDig
    
    verificar:
    bne $s0, $a1, fimConta 
    addi $v0, $v0, 1
   
    fimConta:
    lw $s0, 12($sp)
    lw $a1, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16
    jr $ra
