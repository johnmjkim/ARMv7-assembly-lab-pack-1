.syntax unified
.global main

.type main, %function
main:
  @ begin with branch task 3
  b task_3
  @ My pokemon starts with HP 100
  mov r0, #100
@ a simple infinite loop
end_loop:
  nop
  @ My pokemon heals HP by 50 infinitely
  add r0, r0, #50
  b end_loop
.size main, .-main

@ a place for your to complete task 3. uncomment line 6 when you're ready to start working on it!
task_3:
  @ set the negative flag
  movs r0, -1

  @ set the zero flag
  movs r0, 0

  @ set the carry flag
  movs r0, -2
  adds r0, 3

  @ set the overflow flag
  movs r0, 0x7fffffff
  adds r0, 1

  b end_loop