.syntax unified
.global main
.type main, %function

main:
  .hword 0xffff
  mov r1, 3
  sub r1, 1
  .hword 0xffff
  b main
.size main, .-main