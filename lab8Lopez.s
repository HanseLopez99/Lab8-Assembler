@despliega en pantalla la cadena apuntada por r1 
.text
.global main
main:
	@ Mostrar Bienvenida
	MOV R7, #4		@4=llamado a "write" swi
	MOV R0, #1		@1=stdout (monitor)
	MOV R2, #78		@longitud de la cadena: 11 caracteres
	LDR R1, =bienvenida	@apunta a la cadena
	SWI 0

	ldr r6,=array @inicio arreglo
	mov r8,#10
	
	again:
	@ Pedir el caracter
	MOV R7, #4		@4=llamado a "write" swi
	MOV R0, #1		@1=stdout (monitor)
	MOV R2, #32		@longitud de la cadena: 11 caracteres
	LDR R1, =ingreso	@apunta a la cadena
	SWI 0
		
	@ Lee el caracter
	MOV R7, #3		@3=llamado a "read" swi
	MOV R0, #0		@0=stdout (teclado)
	MOV R2, #2		@longitud de la cadena
	LDR R1,= array
	ADD R4,R4,#4
	ldr r1,[r1,R4]
	LDR R1, = array	@apunta a la variable donde se guarda
	SWI 0
	@paso al ste
	add r6,#4
	subs r8,#1
	cmp r8,#0
	bne again
	
	ldr r6,=array @inicio arreglo
	mov r8,#10
	
	again1:
	@ Muestra la cadena leida
	MOV R7, #4		@4=llamado a "write" swi
	MOV R0, #1		@1=stdout (monitor)
	MOV R2, #1		@longitud de la cadena: 11 caracteres
	LDR R1,= array
	ADD R4,R4,#4
	ldr R1,[R1,R4]
	LDR R1,= array
	SWI 0
	@paso al ste
	add r6,#4
	subs r8,#1
	cmp r8,#0
	bne again1
 
  MOV	R7, #1		@salida al Sistema Operativo
  SWI	0
.data

@Variables
string: .asciz "           "		@etiqueta donde se guarda el valor leido
array:   .word 0,0,0,0,0,0,0,0,0,0
formatoN:	.asciz "%d "

@Mensajes
bienvenida: 	.asciz "Laboratorio 8 \nManerjo de cadenas, arreglos y subrutinas\nAutor: Hansel Lopez \n \n"
ingreso: 	.asciz "Ingrese un numero entre 0 y 9: "
