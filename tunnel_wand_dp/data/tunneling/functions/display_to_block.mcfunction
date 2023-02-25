execute in minecraft:overworld run setblock ~ ~ ~ air destroy
execute if dimension minecraft:overworld run clone from tunneling:overworld ~ ~ ~ ~ ~ ~ to minecraft:overworld ~ ~ ~
execute if dimension minecraft:the_nether run clone from tunneling:the_nether ~ ~ ~ ~ ~ ~ to minecraft:the_nether ~ ~ ~
execute if dimension minecraft:the_end run clone from tunneling:the_end ~ ~ ~ ~ ~ ~ to minecraft:the_end ~ ~ ~
data modify block ~ ~ ~ Bees set value []
kill @s 