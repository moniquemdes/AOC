
	.text
	.globl main
main:
	li $v0, 5 #pra pegar numero do usuario
	syscall
	
	li $s0, 1
	move $s1, $v0 #add o valor em s1 para fazer as op
	
	li $s3, 1
	subi $s2, $v0, 1
while:
	mul $v0, $v0, $s2 #multiplica o valor dado pelo $s1
	subi $s2, $s2, 1 #subtrai 1 do valor dado (valor-1
	bnez $s2, while # se s1 nao for 0 entao repete
	
	# PRINTAR #
	move $a0, $v0 #move para $a0 o valor de $v0
	li $v0, 1
	syscall
end: 
	li $v0, 10
	syscall
