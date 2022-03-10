.syntax unified
.global main

.type main, %function
main:
  @ b task_3

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
@ task_3:
@ ...