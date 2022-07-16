
#Ex. 2. Dado um vetor na memória com n elementos, elabore 
#um código assembly que identifique o maior valor do vetor, 
#onde n deverá ser especificado na memória. Imprimir o 
#resultado usando chamadas de sistema.
#r=max( vetor[i] ), sendo 0 <= i <= n 

.data
	vetor: .word 1 6 16 8 2 5 13
	qtde_elementos: .word 7
	str_posicao: .asciiz "\nPosição Maior Elemento: "
	str_valor: .asciiz "Maior Elemento: "
	
.text

main:
	li $t0, 1 #t0 = contador	
	move $t1, $zero #t1 = index do vetor
	lw $t3, qtde_elementos #t3 = qtd de elementos
	lw $t4, vetor($t1) #t4 = maior elemento
	move $t5, $t0 # t5 = posicao maior elemento
	move $t6, $zero # t6 auxiliar elemento

	addi $t1, $t1, 4
	
	inicio_loop:
		beq $t0, $t3, imprimir_resultado
		lw $t6, vetor($t1)
		bgt $t6, $t4, alterar_elemento
		
		continuar_loop:	
			addi $t0, $t0, 1
			addi $t1, $t1, 4
			b inicio_loop	
		
	alterar_elemento:
		move $t4, $t6
		move $t5, $t0
		b continuar_loop
		
	imprimir_resultado:
		li $v0, 4
		la $a0, str_valor
		syscall
	
		li $v0, 1
		move $a0, $t4
		syscall
		
		li $v0, 4
		la $a0, str_posicao
		syscall
	
		li $v0, 1
		move $a0, $t5
		syscall
		