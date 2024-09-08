.data
	inputNumero: .asciiz "Ingresa la cantidad de numeros que deseas comparar "
	numero: .asciiz "Ingresa un numero: "
	inputNumero2: .asciiz "Este es el numero mayor "
	numeroMayor: .word 0
.text
#Trae el inputNumero y muestra el texto para ingresar los datos
 main:
	li $v0, 4
	la $a0, inputNumero
	syscall
#Captura el numero y lo mueve del v0 al t0 en el registro de memoria
	li $v0, 5
	syscall
	move $t0, $v0
#Numero con el que se comparara inicialmente el mayor o menor
	li $t2, -2147483648
#Inicio del bucle del mensaje
	li $t1, 0
#Condicional t1 = 0; t0 = x, finaliza con end_loop
 repeat_loop:
 	bge $t1, $t0, end_loop
 #Muestro el mensaje para que empiecen a anotar los numeros
 	li $v0, 4
 	la $a0, numero
 	syscall
#Muevo los numeros del v0 al t3
 	li $v0, 5
 	syscall
 	move $t3, $v0
#Comparo t2 >= t3
 	ble $t2, $t3, actualizar_max
 	j siguiente_iteracion
 #Sumo de 1 en 1 para que incremente el contador del ciclo
  actualizar_max:
  	move $t2, $t3
  	
  siguiente_iteracion:
 	addi $t1, $t1, 1
 	j repeat_loop
 	
  end_loop:
  	li $v0, 4
  	la $a0, inputNumero2
  	syscall
  	
  	li $v0, 1
  	move $a0, $t2
  	syscall
  	
  	li $v0, 10
  	syscall
