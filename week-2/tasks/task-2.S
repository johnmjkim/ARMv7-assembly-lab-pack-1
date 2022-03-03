.syntax unified
.global main
.type main, %function

main:
  nop
  .hword 0xdead
  mov r1, 2 @4F F0 02 01
  .hword 0xbeef
  b main
.size main, .-main