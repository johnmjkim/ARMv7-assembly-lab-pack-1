.syntax unified
.global main

cope:
  .ascii "COPE"

.type main, %function
main:
  @ load "COPE" into r1
  ldr r1, cope

  @ fill in the rest of the instructions here!
  @ COPE -> 0b 0100 0101 0101 0000 0100 1111 0100 0011
  @ HOPE -> 0b 0100 0101 0101 0000 0100 1111 0100 1000
  @ HOPS -> 0b 0101 0011 0101 0000 0100 1111 0100 1000
  @ make "cope" -> "hope"
  add r2, r1, 5 @ adds 5
  @ make "hope" -> "hops"
  mov r3, 14 @ set 14
  lsl r3, 24 @ shift left with 24 bits
  add r3, r2, r3 @ add number

loop:
  nop
  b loop
.size main, .-main