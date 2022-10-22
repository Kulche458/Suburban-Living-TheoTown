
local append = Array()

for i = 1, 2 do -- sizes
    for j = 0, 3 do -- rotations

        append:add('{"id": "$kulche_'..i..'x'..i..'_fence_0_front_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "fence_0_'..i..'x'..i..'_front.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
        append:add('{"id": "$kulche_'..i..'x'..i..'_fence_0_back_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "fence_0_'..i..'x'..i..'_back.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')

        for k = 0, 2 do -- variants

            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_walls_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_walls.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_roof_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_roof.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_details_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_details.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_winter_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_winter.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_walls_'..j..'_UPG", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_walls_UPG.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_roof_'..j..'_UPG", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_roof_UPG.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_details_'..j..'_UPG", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_details_UPG.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_winter_'..j..'_UPG", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_winter_UPG.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')

            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_tt_walls_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_tt_walls.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_tt_roof_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "empty.png"}, {"bmp": "'..i..'x'..i..'_'..k..'_tt_roof.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_tt_details_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_tt_details.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')
            append:add('{"id": "$kulche_'..i..'x'..i..'_0'..k..'_tt_winter_'..j..'", "type": "animation", "speed": 0, "frames": [{"bmp": "'..i..'x'..i..'_'..k..'_tt_winter.png", "x": '..(32*i*j)..', "w": '..(32*i)..'}]}')

        end
    end
end

local json = [[
    []]..append:join(',\n')..[[]
]]

Draft.append(json)