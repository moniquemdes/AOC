	.text
	.globl main
main:
	li $v0, 5 #pra pegar numero do usuario
	syscall
	
	li $s0, 1
	li $s2, 1 #para fazer subi
	move $s1, $v0 #add o valor em s1 para fazer as op
while:
	mul $s0, $s0, $s1 #multiplica o valor dado pelo $s1
	sub $s1, $s1, $s2 #subtrai 1 do valor dado (valor-1
	bnez $s1, while # se s1 nao for 0 entao repete
	
	# PRINTAR #
	move $a0, $s0 #move para $a0 o valor de $v0
	li $v0, 1
	syscall
end: 
	li $v0, 10
	syscall
