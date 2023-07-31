.text
    .globl main

main:
#lê inteiro
    li $v0, 5
    syscall

# Move o inteiro lido para $a0 e chama a função fib
    move $a0, $v0
    jal fib

# Move o resultado da função fib para $a0 e imprime
    move $a0, $v1    
    li $v0, 1 		
    syscall

end:
    li $v0, 10
    syscall
    
fib:
# Verifica se o valor de entrada é 0 ou 1e chama a func
    beq $a0, 0, fib1
    beq $a0, 1, fib1
    
    #salva
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $ra, 8($sp)

# Calcula o fibonacci do número anterior
    move $s0, $a0
    add $a0, $a0, -1
    jal fib
    move $s1, $v1
# Calcula o fibonacci do segundo número anterior e soma ao fibonacci do número anterior    
    add $s0, $s0, -2
    add $a0, $s0, 0
    jal fib
    add $v1, $v1, $s1
    
    #restaura
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    
    jr $ra
    
fib1:
#retorna 1
    li $v1, 1
    jr $ra
