
#Ex. 1. Fazer um código assembly que escreva na memória primária um vetor 
#contendo a sequência dos quadrados perfeitos de 1 até n, sendo n uma 
#variável na memória.
#Deverá também escrever uma saída no terminal contendo:
#1 - 1
#2 - 4
#3 - 9
#…
#n - n2


.data
	array: .word 0 0 0 0 0
	n: .word 5
	ifem:  .asciiz " - "
	breakline: .asciiz "\n"

.text

move $t0,$zero 	# Contador loop
move $t3,$zero 	# Percorre Vetor
move $t8,$zero	# Resultado de cada multi
lw $t1, n	# n


inicio_loop:

	bge $t0, $t1 fim_loop	# Condição
 	addi $t0, $t0, 1 # Adiciona 1 no contador
	mul $t8, $t0, $t0
	sw $t8, array($t3)
	addi $t3, $t3, 4
	
    
	li $v0, 1 #(PRINT INTEGER)
	move $a0, $t0 
	syscall # Chamada de sistema
	
	li $v0, 4 #(PRINT STRING)
	la $a0, ifem 
	syscall # Chamada de sistema
	
	li $v0, 1 #(PRINT INTEGER)
	move $a0, $t8 
	syscall # Chamada de sistema
	
	li $v0, 4 #(PRINT STRING)
	la $a0, breakline 
	syscall # Chamada de sistema
	b inicio_loop
fim_loop:
