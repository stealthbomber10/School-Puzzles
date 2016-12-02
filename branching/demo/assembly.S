#include <avr/io.h>

.global greaterThan
greaterThan:
  cp r24, r22
  brge greater
  ldi r24, 0
  ret
greater:
  ldi r24, 1
  ret

.global slowMultiply
slowMultiply:
  ldi r18, 0
  ldi r19, 0
  ldi r20, 1
  while_loop:
    cp r19, r24
    brge loop_exit
    add r18, r22
    add r19, r20
    jmp while_loop
  loop_exit:
    mov r24, r18
    ret

.global slowExponent
slowExponent:
  ldi r18, 1
  ldi r19, 0
  ldi r23, 1
  while_loop1:
    cp r19, r22
    brge loop1_exit
    ldi r20, 0
    ldi r21, 0
    while_loop2:
      cp r21, r24
      brge loop2_exit
      add r20, r18
      add r21, r23
      jmp while_loop2
    loop2_exit:
      mov r18, r20
      add r19, r23
      jmp while_loop1
  loop1_exit:
    mov r24, r18
    ret
