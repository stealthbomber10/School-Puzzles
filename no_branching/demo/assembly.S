#include <avr/io.h>

; AVR assembly comments start with a semicolon 
// (or a double slash, like C)
; Lines without labels should be indented once.

.global average
average:
  call byteToInt
  mov r18, r25
  call addBytes
  sbrc r25, 0
  clc
  lsr r24
  ret

.global addBytes
addBytes:
  call byteToInt
  mov r19, r25
  mov r18, r24
  mov r24, r22
  call byteToInt
  add r24, r18
  ret

.global byteToInt
byteToInt:
  ldi r25, 127
  cp r25, r24
  sbc r25, r25
  ret

.global intToAscii
intToAscii:
  ldi r18, 48
  or r24, r18
  ret

.global hasAOne
hasAOne:
  sbrc r24, 0
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 1
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 2
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 3
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 4
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 5
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 6
  ldi r24, 1
  sbrc r24, 0
  ret
  sbrc r24, 7
  ldi r24, 1
  ret
