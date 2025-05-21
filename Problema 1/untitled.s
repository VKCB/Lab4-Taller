        .section .data
array:  .word 0, 1, 2, 3, 4, 6, 7, 5, 9, 10   @ Arreglo de 10 valores
y:      .word 8                              @ Valor de y definido      

        .section .text
        .global _start

_start:
        LDR R1, =array   @ Dirección base del arreglo
        LDR R2, =y       @ Dirección de la constante y
        LDR R3, [R2]     @ Cargar el valor de y en R3
        MOV R4, #10     

loop:
        CMP R4, #0      
        BEQ end          

        LDR R5, [R1]     @ Cargar array[i] en R5
        CMP R5, R3       @ Comparar array[i] con y
        BGE multiply     @ Si array[i] >= y, saltar a multiplicación

        ADD R5, R5, R3   @ Si array[i] < y, sumar y
        B store          @ Guardar resultado en array[i]

multiply:
        MUL R5, R5, R3   @ Si array[i] >= y, multiplicarlo por y

store:
        STR R5, [R1]     @ Guardar nuevo valor en array[i]
        ADD R1, R1, #4   @ Avanzar al siguiente elemento
        SUB R4, R4, #1   
        B loop           

end:
        B end   