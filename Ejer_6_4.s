
# Ejercicio 6.4 del manual de prácticas
#
#	cuenta = 0;
#	for (i=0; i<N; i++)
#	  if (V[i] es multiplo de 3) y (V[i]>5){
#	       cuenta = cuenta + 1;
#	  }
#	}
		.data
vector:	.word 6, 7, 5, 3, 5, 12, 5, 2, 0, 1
N:		.word 10
		.align 2
res:	.space 4
		.text
		
main:	la $t2, vector
		add $t3, $zero, $t3
		li $t0, 1			# $t0=i=1
		lw $t1, N			# $t1=N
		li $t5, 5
		li $t6, 3

para:	bgt $t0, $t1, finpa # para i=1 hasta N (no exactamente el algoritmo de arriba)
		lw $t4, 0($t2)
		ble $t4, $t5, si	# si <=5 no cumple
		div $t4, $t6		# si >5, vemos si es multiplo de 3 (dividiendo por 3)
		mfhi $t7			# $t7 = resto división
		bne $t7, $zero, si	# si resto<>0 no cumple
		addi $t3, $t3, 1	# cumple, así que cuenta uno más
si:		addi $t0, $t0, 1	# i+1
		addi $t2, $t2, 4	# avanza en el vector
		j para


finpa:	sw $t3, res			# almacena la cuenta en res
		jr $31
		
		.end
	