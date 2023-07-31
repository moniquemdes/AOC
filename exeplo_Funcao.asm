	# FUNCAO
	.text
	.globl main
main:
	#int leaf_example (int g, int h, int i, int j)
	#int f
	# f = (g+h) - (i+j)
	#return f
	ori $a0, $zero, 1 #g
	ori $a1, $zero, 2 #h
	ori $a2, $zero, 3 #i
	ori $3, $zero, 4
	jal leaf_example  #pula um end e salva o end seguinte em um registrador
end: 
	li $v0, 10 #este endereço q ta em jal
	syscall
	
leaf_example: #escreve a funcao aqui
	addi $sp, $sp, -8 #pilha -> desalocando pilha de 8 bytes INCREMENTA NSO PODE MEXER NA PARTE DE CIMA
	
	sw $s0, 0 ($sp) #armazena $s0 nos ultimos 4 bytes da pilha
	sw $s1, 4($sp) #armazena $s1 nos 4 bytes depois do $s0
	
	add $s0, $a0, $a1 #se usar $t0 = $s0  e $t1 = $s1 nao precisa da parte de cima e nem de baixo
	add $s1, $a2, $a3
	sub $v0, $s0, $s1
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	
	addi $sp, $sp, 8 #nao precisa salvar na pilha  DECREMENTA
	jr $ra #saltando p o endereço de armazenaamneto em $ra chamada da funcao