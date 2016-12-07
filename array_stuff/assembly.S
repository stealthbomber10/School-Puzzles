#include <avr/io.h>

; AVR assembly comments start with a semicolon 
// (or a double slash, like C)
; Lines without labels should be indented once.

.global divide
divide:
  ldi r18, 0
  ldi r19, 0
  while_loop:
    sub r24, r22
    cp r24, r19
    brlt loop_exit
    inc r18
    jmp while_loop
  loop_exit:
    mov r24, r18
    ret

.global sumArray
sumArray:
  mov  r19, r24
  movw r30, r24
  ldi  r24, 0
  ldi  r25, 0
  sum_loop:
    mov  r18, r30
    sub  r18, r19
    cp   r18, r22
    brsh sum_loop_exit
    ld   r18, Z+
    add  r24, r18
    adc  r25, r1
    jmp sum_loop
  sum_loop_exit:
    ret

.global avgArray
avgArray:
  call sumArray
  mov r18, r24
  mov r19, r25
  ldi r24, 0
  ldi r25, 0
  ldi r23, 0
  divide_loop:
    cp r18, r22
    cpc r19, r23
    brlt divide_exit
    sub r18, r22
    sbc r19, r23
    inc r24
    adc r25, r23
    jmp divide_loop
  divide_exit:
    ret

.global dot
dot:
  mov r18, r22
  mov r19, r23
  movw r26, r18
  mov r30, r24
  mov r31, r25
  ldi r18, 0
  ldi r19, 0
  jmp exit_if
  compute:
    ld r25, Z+
    ld r22, X+
    mul r22, r25 //multiplies vector elements
    movw r22, r0
    add r18, r22
    adc r19, r23  //adds to total
  exit_if:
    mov r25, r30
    sub r25, r24
    cp r25, r20
    brlt compute
    movw r24, r18
    ret
