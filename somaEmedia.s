	.data
	erro: .asciiz "ERRO \n"
	pulaLinha: .asciiz "\n"
	.text
	.globl main
main:
	li $s0, -1 #salva o valor com a condicao de parada
	li $s3, 1
	li $s4, 0
while:
	li $v0, 5
	syscall
	
	beq $v0, $s0, condicao #se igual v0 = -1
	
	add $v1, $v1, $v0 #operacao de soma
	add  $s1, $s1, $s3 #contador
	div $s2, $v1, $s1 #media
	
	bne $v0, $s0, while #se v0 nao for igual a -1 loop
	
imprima:
	# imprime string
	la $a0, erro 
	li $v0, 4 
	syscall
	
condicao:
	beq $s1, $s4, imprima #se s1 = 0 
	#imprime a soma
	move $a0, $v1
	li $v0,1
	syscall 
	
	# imprime string
	la $a0, pulaLinha 
	li $v0, 4 
	syscall
	
	move $a0, $s2
	li $v0, 1
	syscall
	
end: 
	li $v0, 10
	syscall
