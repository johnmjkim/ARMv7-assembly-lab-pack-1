.syntax unified
.global main

.type main, %function
main:
  @ begin with branch task 3
  @ b task_3
  @ Both enemy and my pokemon starts with 100 HP
  mov r0, #100
  mov r1, #100
@ a simple infinite loop
end_loop:
  nop
  @ My pokemon heals HP by 50 infinitely
  add r0, r0, #50
  @ My pokemon attacks enemy HP by 50 infinitely
  subs r1, #50
  @ begin with branch pokemon_wins
  b pokemon_wins
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

@ conditional branch for pokemon wins
pokemon_wins:
  @ r1 is less than zero
  @ infinite loop of pokemon_wins
  bmi pokemon_wins
  @ r1 is zero or larger
  bpl checkzero

checkzero:
  mov r2, 0
  @ r1 is zero by comparing r2 = 0 and r1 is equal or not 
  beq pokemon_wins
  @ r1 is larger than zero
  bne end_loop