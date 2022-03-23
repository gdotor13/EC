# NO INCLUYAS main.s
# INCLUYE solo las rutinas bucle3 y bucle2
      
    .text
    .globl bucle3
bucle3:
      # inputs:
      #   $a0: matrix address (half)
      #   $a1: n-columns
      #   $a2: i
      #   $a3: j
      #   argv4: addres variable max in the stack (half)
      # outputs:
      #   None
      #
      # Put your code here
      # ...
	addi $sp, $sp, -4
	sw $fp, 0($sp)		#fp bloque de activación 
	addi $fp, $sp, 0 	#dirección vacía para max
	  
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)		#dirección matriz
	addi $sp, $sp, -4
	sw $a1, 0($sp)		#N
	addi $sp, $sp, -4
	sw $a2, 0($sp)		#i
	addi $sp, $sp, -4
	sw $a3, 0($sp)		#j
	
	addi $s2, $a3, 1	#k=j+1
	lh $s3, 4($fp)		#cargamos max
	li $s4, 0			#temp=0
		 
for_3:

	bge $s2, $a1, end_for_3
	
	mul $t1, $a2, $a1	#i*N
	add $t1, $t1, $s2	#(i*N+k)
	sll $t1, $t1, 1		#(i*N+k)*2 --> desplazamiento
	add $t1, $t1, $a0	#(i*N+k)(dezplazado)+dir matriz
 	lh $t2, 0($t1)		#A[i,k]	
	 
si:
	
	bge $s3, $t2, end_si #if(Max<A[i,k])
	
	addi $s4, $s3, 0	#temp=max
	addi $s3, $t2, 0	#max=A[i,k]
	sh $s4, 0($t1)  	#almacenamos temp en A[i,k] --> A[i,k]=temp

	 
end_si:
	
	addi $s2, $s2, 1	#k++
	j for_3
	
end_for_3:

	lw $a3, 0($sp)
	addi $sp, $sp, 4
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	  
    jr $ra

bucle2:
    .globl bucle2
        # inputs:
        #   $a0: matrix address (half)
        #   $a1: n-columns
        #   $a2: i
        #   $a3: max addres (half)
        # outputs:
        #   None
        #
        # Put your code here
        #
        # ...
		
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)		#dirección matriz
	addi $sp, $sp, -4
	sw $a1, 0($sp)		#N
	addi $sp, $sp, -4
	sw $a2, 0($sp)		#i
	addi $sp, $sp, -4
	sw $a3, 0($sp)		#max
	addi $sp, $sp, -4
	sw $s0, 0($sp)		
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	
	li $s5, 0			#j=0
	addi $s6, $a1, -1	#N-1
	
for_2:

	bge $s5, $s6, end_for_2
	
	mul $t1, $a2, $a1	#i*N
	add $t1, $t1, $s5	#(i*N+j)
	sll $t1, $t1, 1		#(i*N+j)*2 --> desplazamiento
	add $t1, $t1, $a0	#(i*N+j)(dezplazado)+dir matriz
 	lh $t2, 0($t1)		#A[i,j]
	addi $a3, $t2, 0	#max=A[i,j] 
	
	addi $sp, $sp, -4
	sw $a3, 0($sp)		#metemos en la pila el j
	move $a3, $s5		#para utilizarlo en el bucle3
	jal bucle3
	
	addi $sp, $sp, 8	#cargamos de la pila 2 valores (reservados dos lugares)
	
	mul $t1, $a2, $a1	#i*N
	add $t1, $t1, $s5	#(i*N+j)
	sll $t1, $t1, 1		#(i*N+j)*2 --> desplazamiento
	add $t1, $t1, $a0	#(i*N+j)(dezplazado)+dir matriz
	sh $s3, 0($t1)		#A[i,j]=max
	
	addi $s5, $s5, 1	#j++
	j for_2	
	 
end_for_2:

	lw $s1, 0($sp) 
	addi $sp, $sp, 4
	lw $s0, 0($sp) 
	addi $sp, $sp, 4
	lw $a3, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	  
    jr $ra	
    