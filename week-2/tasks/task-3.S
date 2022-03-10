.syntax unified
.global main
.type main, %function

main:
  @ instruction
  @ mov r1, 3
  @ sub r1, 1
  @ 4 32-bit instruction
  .hword 0xf04f
  .hword 0x0103
  .hword 0xf1a1
  .hword 0x0101
  @ 2 16-bit instruction
  @ .hword 0x2103 @ 0b0010000100000011
  @ .hword 0x3901 @ 0b0011100100000001
  
  b main
.size main, .-main