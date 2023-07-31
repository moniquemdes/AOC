.data
	pularLina: .ascii "\n"
.text
.globl main

main:
    while:
    li $v0, 5  #ler um inteiro da entrada
    syscall
    move $a0, $v0 

    beq $a0, $zero, end  #se zero encerra o programa

    jal somarDigitos

    move $a0, $v0  #para imprimir na tela um inteiro
    li $v0, 1  
    syscall

    li $v0, 4 
    la $a0, pularLina
    syscall

    j while 

end:
    li $v0, 10 
    syscall

somarDigitos:
    addi $sp, $sp, -12  #move o ponteiro de pilha 12 bytes para baixo
    sw $ra, 0($sp)  # salva o endereço de retorno na pilha
    sw $a0, 4($sp)  
    sw $s0, 8($sp)  

    li $v0, 0  #variável que irá armazenar a soma dos dígitos
    li $t0, 10  #carrega o valor 10
    div $a0, $t0  #divide o valor a ser somado por 10
    mfhi $s0  #resto da divisão por 1
    mflo $a0  #quociente da divisão por 10

    beq $a0, $zero, endSoma  #se zero encerra a soma

    jal somarDigitos 
    
    endSoma:
    add $v0, $v0, $s0  #adiciona o resto da divisão por 10 s
    
    lw $s0, 8($sp)  #restaura o resto da divisão por 10
    lw $a0, 4($sp)  #valor a ser somado
    lw $ra, 0($sp) 
    addi $sp, $sp, 12
    jr $ra