.syntax unified
.global main

.type main, %function
main:
  @ store r0 as zero
  mov r0, 0
  @ turn of action
  @ if r1 is positive, my pokemon turn
  @ if r1 is negative, enemy turn
  mov r1, 1
  @ Initial HP/strength my pokemon
  mov r2, #40
  mov r3, #10
  @ Initial HP/strength of enemy
  mov r4, #40
  mov r5, #10
  @ action mode of my pokemon
  @ if r6 is positive attacks fireball/frenzy/magic_poison
  @ if r6 is negative use strength_from_weariness/eye_of_Zardok 
  mov r6, -1
  @ action mode of my enemy
  @ if r7 is positive attacks fireball/frenzy/magic_poison
  @ if r7 is negative use strength_from_weariness/eye_of_Zardok 
  mov r7, 1
  @ a simple infinite loop
  @ set the turn
  movs r1, 1
end_loop:
  nop
  movs r1, r1
  bpl my_pokemon
  bmi my_enemy
  b end_loop
.size main, .-main

my_pokemon:
  movs r6, r6
  bpl my_pokemon_attack
  bmi my_pokemon_action

my_pokemon_attack:
  @ fireball
  @ sub r4, 20

  @ frenzy
  add r5, 10
  sub r4, 30

  @ magic poison
  @ sub r4, r3
  @ sub r4, r3

  mov r6, -1
  mov r1, -1
  b my_pokemon_wins

my_pokemon_action:
  @ strength_from_weariness
  mov r8, r2
  sub r8, r2, r3
  @ sdiv r9, r8, 20

  @eye_of_Zordak


  mov r6, 1
  mov r1, -1
  b my_enemy_wins

my_pokemon_wins:
  nop
  movs r0, r0
  movs r4, r4
  bmi my_pokemon_wins
  beq my_pokemon_wins

  b end_loop

my_enemy:
  movs r7, r7
  bpl my_enemy_attack
  bmi my_enemy_action

my_enemy_attack:
  @ fireball
  sub r2, 20

  @ frenzy
  @ add r3, 10
  @ sub r2, 30

  @ magic poison
  sub r2, r5
  sub r2, r5

  mov r7, -1
  mov r1, 1
  b my_enemy_wins

my_enemy_action:
  mov r7, 1
  mov r1, 1
  b my_pokemon_wins

my_enemy_wins:
  nop
  movs r0, r0
  movs r2, r2
  bmi my_enemy_wins
  beq my_enemy_wins

  b end_loop