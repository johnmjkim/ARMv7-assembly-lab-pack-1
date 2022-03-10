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
  mov r2, #150
  mov r3, #40
  @ Initial HP/strength of enemy
  mov r4, #150
  mov r5, #40
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
  @ add r5, 10
  @ sub r4, 30

  @ magic poison
  mov r9, 2
  mul r8, r3, r9
  sub r4, r8

  mov r6, -1
  mov r1, -1
  b my_pokemon_wins

my_pokemon_action:
  @ strength_from_weariness
  @ sub r8, r2, r3 @ hp-strength
  @ mul r9, r8, r8 @ (hp-strength)^2
  @ mov r10, 400 @ 20^2
  @ sdiv r10, r9, r10 @(hp-strength)^2/20^2
  @ add r2, r10 @ hp = hp + ((hp-strength)/20)^2

  @eye_of_Zordak
  mul r8, r2, r3 @ hp * strength
  mov r9, 100
  sdiv r10, r8, r9 @ hp * strength / 100

  mul r8, r3, r3 @ strength^2
  mul r8, r8, r3 @ strength^3

  mov r9, 4096 @ 16^3
  sdiv r11, r8, r9 @ (strength)^3/(16)^3
  sub r2, r2, r11 @ hp = hp - (strength/16)^3
  mov r3, r10 @ strength = hp * strength / 100

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
  @ sub r2, 20

  @ frenzy
  @ add r3, 10
  @ sub r2, 30

  @ magic poison
  mov r9, 2
  mul r8, r5, r9
  sub r2, r8

  mov r7, -1
  mov r1, 1
  b my_enemy_wins

my_enemy_action:
  @ strength_from_weariness
  sub r8, r4, r5 @ hp-strength
  mul r9, r8, r8 @ (hp-strength)^2
  mov r10, 400 @ 20^2
  sdiv r10, r9, r10 @(hp-strength)^2/20^2
  add r4, r10 @ hp = hp + ((hp-strength)/20)^2

  @eye_of_Zordak
  @ mul r8, r4, r5 @ hp * strength
  @ mov r9, 100
  @ sdiv r10, r8, r9 @ hp * strength / 100

  @ mul r8, r5, r5 @ strength^2
  @ mul r8, r8, r5 @ strength^3

  @ mov r9, 4096 @ 16^3
  @ sdiv r11, r8, r9 @ (strength)^3/(16)^3
  @ sub r4, r4, r11 @ hp = hp - (strength/16)^3
  @ mov r5, r10 @ strength = hp * strength / 100

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