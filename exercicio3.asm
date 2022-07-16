
#Ex. 3. Deverá escrever um código assembly que implemente o algoritmo selection sort.

.data
	vetor: .word 2 8 5 3 6 11 10
	qtd_elementos: .word 7
	separador: .asciiz " - "
	quebra_linha: .asciiz "\n"

.text

main:
	lw $t0, qtd_elementos #t0 = limite loop
	li $t1, 1 #$t1 = contador
	move $t2, $zero #$t2 = contador index vetor
	lw $t3, vetor($t2) #$t3 = menor elemento atual
	move $t4, $zero #$t4 = index menor elemento atual
	move $t5, $zero #$t5 = index a ser substituido
	move $t6, $zero #$t6 = auxiliar menor valor
	move $t7, $zero #$t7 = auxiliar substituição
	move $s0, $zero #$s0 = posição a ser substituida
	
	addi $t2, $t2, 4
		
	achar_menor_valor:
		beq $t1, $t0, substituir_valor
		lw $t6, vetor($t2)
		blt $t6, $t3, alterar_menor_valor
		
		continuar_achar_menor_valor:
			addi $t1, $t1, 1
			addi $t2, $t2, 4
			b achar_menor_valor
				
	alterar_menor_valor:
		move $t3, $t6
		move $t4, $t2
		b continuar_achar_menor_valor
		
	substituir_valor:
		lw $t7, vetor($t5)
		sw $t3, vetor($t5)
		sw $t7, vetor($t4)
		
		addi $s0, $s0, 1
		beq $s0, $t0, imprimir_array
		addi $t5, $t5, 4
		move $t1, $s0
		move $t2, $t5
		move $t4, $t5
		lw $t3, vetor($t2)
		addi $t2, $t2, 4
		addi $t1, $t1, 1
		b achar_menor_valor
		
	imprimir_array:
		move $t1, $zero
		move $t2, $zero
		
		loop_impressao:
			beq $t1, $t0, fim_loop_impressao
			
			li $v0, 1 
			move $a0, $t1
			syscall 
	
			li $v0, 4
			la $a0, separador
			syscall
	
			li $v0, 1
			lw $a0, vetor($t2) 
			syscall 
	
			li $v0, 4
			la $a0, quebra_linha 
			syscall 

			addi $t1, $t1, 1
			addi $t2, $t2, 4
			
			b loop_impressao
		
		fim_loop_impressao:
		