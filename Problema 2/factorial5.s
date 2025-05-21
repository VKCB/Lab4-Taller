x:    .word 5 @valor de entrada
fact: .word 0 @ lugar para guardar resultados

_start:
  LDR r0, =x  
  LDR r1, [r0]  @r1=x
  MOV r2, #1    @r2 = resultado
  
  
  CMP r1, #0
  BEQ store_result
  
loop:
 
  MUL r2, r2, r1
  SUB r1,r1, #1
  CMP r1, #0
  BGT loop
  
store_result: 
  LDR r3, =fact
  STR r2, [r3]    @guarda el factorial en memoria

exit:
  MOV r7, #1
  MOV r0, #0
  SVC #0
  