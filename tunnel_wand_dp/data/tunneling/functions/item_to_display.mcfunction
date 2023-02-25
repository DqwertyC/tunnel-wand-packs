execute align xyz run summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:bedrock"},Tags:["tunnel_display","newest"],interpolation_duration:5}
data modify entity @e[tag=newest,limit=1] block_state.Name set from entity @s Item.tag.BlockName
data modify entity @e[tag=newest,limit=1] block_state.Properties set from entity @s Item.tag.BlockStateTag
data modify entity @e[tag=newest,limit=1] transformation.scale set value [0.2f,0.2f,0.2f]
data modify entity @e[tag=newest,limit=1] transformation.translation set value [0.4f,0.4f,0.4f]
data modify entity @e[tag=newest,limit=1] interpolation_start set value -1
tag @e[tag=newest] remove newest
kill @e[type=experience_orb,nbt={Age:0s},distance=..2]
kill @e[type=item,nbt={Age:0s},distance=..2]