	.text
	.globl main
	
	#Você pode assumir que 0 <= n <= 10
	#Calcula o enésimo número de Fibonacci
	#Considere que para n == 0 e n == 1 o resultado é 1
	# para n == 2 o resultado é 2.
	#Imprime na saída padrão uma linha com o resultado
main:
	li $v0, 5
	syscall
	
	li $s0, 0 #fib 1
	li $s1, 1 #fib 2
	
	li $s2, 0 #contador
	li $s3, 0
	li $s4, 1 #para somar

	beq $v0, $zero, imprima

while:
	add $s3, $s0, $s1 # soma = fib 1 + fib2
	move $s0, $s1 # fib1 = fib2
	move $s1, $s3 # fib2 = soma
	
	add $s2, $s2, $s4 # contador ++
	bne $s2, $v0, while # se o contador nao for igual ao nro dado
	
	# print inteiro
	move $a0, $s3
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
imprima:
	move $a0, $s1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
