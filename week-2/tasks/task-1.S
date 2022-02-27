.syntax unified
.global main
<<<<<<< HEAD

.type main, %function
main:
  nop
  ldr r0, =hello

  b main
.size main, .-main

.data
hello:
.word 0x424242
=======
.type main, %function

main:
  mov r1, 0

loop:
  add r1, 1
  b loop
>>>>>>> 0c14d137d005587e9b7f4a2cd6d2c198d3c1b8e1
