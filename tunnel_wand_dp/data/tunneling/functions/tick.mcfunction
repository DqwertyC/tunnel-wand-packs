# Revert blocks that have ended up in the same spot as a tunneled block
execute as @e[tag=tunnel_display] at @s unless block ~ ~ ~ minecraft:air run function tunneling:display_to_block

# Clone blocks to the appropriate parallel dimension
execute in tunneling:overworld run forceload remove all
execute in tunneling:the_nether run forceload remove all
execute in tunneling:the_end run forceload remove all

execute as @e[tag=tunnel_display] at @s if dimension minecraft:overworld in tunneling:overworld run forceload add ~ ~
execute as @e[tag=tunnel_display] at @s if dimension minecraft:the_nether in tunneling:the_nether run forceload add ~ ~
execute as @e[tag=tunnel_display] at @s if dimension minecraft:the_end in tunneling:the_end run forceload add ~ ~

execute as @a at @s if dimension minecraft:overworld in tunneling:overworld run forceload add ~-16 ~-16 ~16 ~16
execute as @a at @s if dimension minecraft:the_nether in tunneling:the_nether run forceload add ~-16 ~-16 ~16 ~16
execute as @a at @s if dimension minecraft:the_end in tunneling:the_end run forceload add ~-16 ~-16 ~16 ~16

execute as @a at @s if dimension minecraft:overworld run clone from minecraft:overworld ~-6 ~-6 ~-6 ~6 ~6 ~6 to tunneling:overworld ~-6 ~-6 ~-6 masked
execute as @a at @s if dimension minecraft:the_nether run clone from minecraft:the_nether ~-6 ~-6 ~-6 ~6 ~6 ~6 to tunneling:the_nether ~-6 ~-6 ~-6 masked
execute as @a at @s if dimension minecraft:the_end run clone from minecraft:the_end ~-6 ~-6 ~-6 ~6 ~6 ~6 to tunneling:the_end ~-6 ~-6 ~-6 masked

execute as @e[type=!player] at @s if dimension tunneling:overworld run kill @s
execute as @e[type=!player] at @s if dimension tunneling:the_nether run kill @s
execute as @e[type=!player] at @s if dimension tunneling:the_end run kill @s

# Convert the item to a block display entity
execute as @e[type=item,nbt={Item:{tag:{CreateTunnel:1b}}}] at @s run function tunneling:item_to_display
scoreboard players add @e[tag=tunnel_display] age 1
execute as @e[tag=tunnel_display,scores={age=95}] at @s run function tunneling:display_grow
execute as @e[tag=tunnel_display,scores={age=100}] at @s run function tunneling:display_to_block

# Remove any stray invisible debug sticks
clear @a minecraft:debug_stick{CustomModelData:42}