.data
    inputNumero: .asciiz "Ingresa la cantidad de numeros que deseas comparar "
    numero: .asciiz "Ingresa un numero: "
    inputNumero2: .asciiz "Este es el numero menor "
.text
    # Trae el inputNumero y muestra el texto para ingresar los datos
    main:
        li $v0, 4
        la $a0, inputNumero
        syscall
        
        # Captura el número de entradas y lo mueve del v0 al t0 en el registro de memoria
        li $v0, 5
        syscall
        move $t0, $v0  # $t0: cantidad de números a ingresar

        # Inicializa el primer número con un valor alto para encontrar el menor
        li $t2, 2147483647  # $t2: número menor inicial (valor alto)

        # Inicializa el contador del ciclo
        li $t1, 0

        # Inicio del bucle del mensaje
    repeat_loop:
        bge $t1, $t0, end_loop  # Si $t1 >= $t0, salta al final del bucle

        # Muestra el mensaje para que el usuario ingrese un número
        li $v0, 4
        la $a0, numero
        syscall
        
        # Captura el número ingresado y lo mueve a $t3
        li $v0, 5
        syscall
        move $t3, $v0
        
        # Compara si $t2 > $t3 (encontrar el menor)
        bgt $t2, $t3, actualizar_min  # Si $t2 > $t3, salta a actualizar_min
        j siguiente_iteracion

    actualizar_min:
        move $t2, $t3  # Actualiza el menor número
        
    siguiente_iteracion:
        addi $t1, $t1, 1  # Incrementa el contador del ciclo
        j repeat_loop  # Salta al inicio del bucle

    end_loop:
        # Muestra el mensaje del menor número encontrado
        li $v0, 4
        la $a0, inputNumero2
        syscall
        
        # Muestra el número menor
        li $v0, 1
        move $a0, $t2
        syscall
        
        # Termina el programa
        li $v0, 10
        syscall
