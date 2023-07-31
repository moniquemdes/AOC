.data
x:  .word 0
y:  .word 0
a:  .word 0
b:  .word 0
msg: .asciiz "%d\n"

.text
.globl main

# função calc
calc:
    addi $sp, $sp, -4     # reserva espaço na pilha
    sw   $ra, 0($sp)      # salva o endereço de retorno

    lw   $t0, 0($a0)      # carrega o valor de x
    blez $t0, base_case   # se x <= 1, retorna x
    
    li   $t1, 0           # inicializa $t1 com 0
    
    andi $t2, $t0, 1      # verifica se x é par
    beqz $t2, even_case   # se x % 2 == 0, pula para even_case
    
    addi $t1, $t0, -1     # x - 1
    jal  calc             # chama calc(x - 1)
    add  $t3, $v0, $zero  # armazena o resultado em $t3
    
    addi $t1, $t0, 1      # x + 1
    jal  calc             # chama calc(x + 1)
    add  $t4, $v0, $zero  # armazena o resultado em $t4
    
    add  $v0, $t0, $t3    # x + calc(x - 1)
    add  $v0, $v0, $t4    # x + calc(x - 1) + calc(x + 1)
    j    calc_end         # retorna
    
even_case:
    srl  $t0, $t0, 1      # x / 2
    jal  calc             # chama calc(x / 2)
    add  $v0, $t0, $v0    # x + calc(x / 2)
    j    calc_end         # retorna
    
base_case:
    move $v0, $a0         # retorna x

calc_end:
    lw   $ra, 0($sp)      # restaura o endereço de retorno
    addi $sp, $sp, 4      # libera espaço da pilha
    jr   $ra              # retorna

# função main
main:
    li   $v0, 5           # lê o valor de x
    syscall
    move $t0, $v0         # armazena o valor de x em $t0
    
    li   $v0, 5           # lê o valor de y
    syscall
    move $t1, $v0         # armazena o valor de y em $t1
    
    move $a0, $t0         # passa x como argumento para calc
    jal  calc             # chama calc(x)
    sw   $v0, a           # armazena o resultado em a
    
    add  $a0, $t0, $v0    # x + calc(x)
    jal  calc             # chama calc(x + calc(x))
    sw   $v0, b           # armazena o resultado em b
    
    add  $a0, $a1, $a2      # a + b
