.syntax unified
.global main

.type main, %function
main:
  nop
  movs r0, #2
  adds r0, #2
  movs r1, r0

  b main
.size main, .-main