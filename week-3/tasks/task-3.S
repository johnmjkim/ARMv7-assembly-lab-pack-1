.syntax unified
.global main

.type main, %function
main:
  b task_3
  @ Your code goes here
  mov r0, #100
@ a simple infinite loop
end_loop:
  nop
  add r0, r0, #50
  b end_loop
.size main, .-main

@ a place for your to complete task 3. uncomment line 6 when you're ready to start working on it!
task_3:
  @ set the negative flag
  movs r0, -1

  @ set the zero flag
  adds r0, 1

  @ set the carry flag
  movs r0, 0x7fffffff

  @ set the overflow flag
  adds r0, 1

  b end_loop