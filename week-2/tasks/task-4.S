.syntax unified
.global main

cope:
  .ascii "COPE"

.type main, %function
main:
  @ load "COPE" into r1
  ldr r1, cope

  @ fill in the rest of the instructions here!
  add r1, 5
  mov r2, r1
  add r1, 9
  mov r3, r1

loop:
  nop
  b loop
.size main, .-main