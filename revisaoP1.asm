	.text
	.globl main
main:
	li $v0, 5         # leitura de entrada
	syscall
	
	move $a0, $v0     # armazena o valor lido em $t0
	
	jal sum           # chama a função sum com o valor lido
	
	move $a0, $v0     # move o valor de retorno para $a0
	li $v0, 1         # syscall para imprimir inteiro
	syscall
	
	li $v0, 10        # syscall para sair do programa
	syscall

sum:
	addi $sp, $sp, -8  # ajusta o ponteiro de pilha
	sw $ra, 0($sp)     # salva o endereço de retorno
	sw $a0, 4($sp)     # salva o valor de entrada
	
	beqz $a0, sumEnd   # verifica se x == 0
	
	addi $a0, $a0, -1

	jal sum            # chama a função sum recursivamente
	add $v0, $a0, $v0 
sumEnd:
	lw $ra, 0($sp)     # recupera o endereço de retorno
	lw $a0, 4($sp)     # recupera o valor de entrada
	addi $sp, $sp, 8   # ajusta o ponteiro de pilha
	jr $ra             # retorna para o chamador
