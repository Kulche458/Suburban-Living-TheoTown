
local buildings1x1
local buildings2x2

local building_1x1_00
local building_1x1_00_UPG
local building_1x1_01
local building_1x1_01_UPG
local building_1x1_02
local building_1x1_02_UPG

local building_2x2_00
local building_2x2_00_UPG
local building_2x2_01
local building_2x2_01_UPG
local building_2x2_02
local building_2x2_02_UPG

local color_count_wall = 14
local color_count_roof = 6

local color_mode_common
local color_mode_colorful
local color_mode_toned

local wall_color
local roof_color

math.randomseed(os.time())

function script:init()
    buildings1x1 = Array{
        Draft.getDraft('$kulche_suburbs_1x1_00'),
        Draft.getDraft('$kulche_suburbs_1x1_01'),
        Draft.getDraft('$kulche_suburbs_1x1_02'),
        Draft.getDraft('$kulche_suburbs_1x1_00_UPG'),
        Draft.getDraft('$kulche_suburbs_1x1_01_UPG'),
        Draft.getDraft('$kulche_suburbs_1x1_02_UPG')
    }
    buildings2x2 = Array{
        Draft.getDraft('$kulche_suburbs_2x2_00'),
        Draft.getDraft('$kulche_suburbs_2x2_01'),
        Draft.getDraft('$kulche_suburbs_2x2_02'),
        Draft.getDraft('$kulche_suburbs_2x2_00_UPG'),
        Draft.getDraft('$kulche_suburbs_2x2_01_UPG'),
        Draft.getDraft('$kulche_suburbs_2x2_02_UPG')
    }
    building_1x1_00 = Draft.getDraft('$kulche_suburbs_1x1_00')
    building_1x1_00_UPG = Draft.getDraft('$kulche_suburbs_1x1_00_UPG')
    building_1x1_01 = Draft.getDraft('$kulche_suburbs_1x1_01')
    building_1x1_01_UPG = Draft.getDraft('$kulche_suburbs_1x1_01_UPG')
    building_1x1_02 = Draft.getDraft('$kulche_suburbs_1x1_02')
    building_1x1_02_UPG = Draft.getDraft('$kulche_suburbs_1x1_02_UPG')
    
    building_2x2_00 = Draft.getDraft('$kulche_suburbs_2x2_00')
    building_2x2_00_UPG = Draft.getDraft('$kulche_suburbs_2x2_00_UPG')
    building_2x2_01 = Draft.getDraft('$kulche_suburbs_2x2_01')
    building_2x2_01_UPG = Draft.getDraft('$kulche_suburbs_2x2_01_UPG')
    building_2x2_02 = Draft.getDraft('$kulche_suburbs_2x2_02')
    building_2x2_02_UPG = Draft.getDraft('$kulche_suburbs_2x2_02_UPG')
end

local function colors(x, y)

--[[
    color reference sheet:
        1 - white [220,220,210]
        2 - gray [127,127,122]
        3 - mint [165,220,175]
        4 - yellow [230,215,130]
        5 - beige [200,185,150]
        6 - lightblue [150,190,205]
        7 - blue [100,110,160]
        8 - olive [175,190,135]
        9 - cyan [135,150,165]
        10 - copper [205,135,105]
        11 - lavender [180,140,150]
        12 - creamy [245,230,205]
        13 - mandrake [175,175,215]
        14 - sandy [255,250,230]
--]]

    -- color groups
    color_mode_common = {1, 2, 5, 12, 14} --mostly achromatic
    color_mode_colorful = {3, 4, 6, 7, 8, 9, 10, 11, 13} --fully chromatic
    color_mode_toned = {1, 2, 3, 5, 6, 8, 10, 12, 13, 14} --mixed

    local chance = math.random(0, 100)
    if settings.colorDistribution == 2 then
        if chance < 15 then
            wall_color = color_mode_colorful[math.random(1, #color_mode_colorful)]
        elseif chance > 85 then
            wall_color = color_mode_toned[math.random(1, #color_mode_toned)]
        else
            wall_color = color_mode_common[math.random(1, #color_mode_common)]
        end
    elseif settings.colorDistribution == 3 then
        if chance < 15 then
            wall_color = color_mode_common[math.random(1, #color_mode_common)]
        elseif chance > 85 then
            wall_color = color_mode_toned[math.random(1, #color_mode_toned)]
        else
            wall_color = color_mode_colorful[math.random(1, #color_mode_colorful)]
        end
    elseif settings.colorDistribution == 4 then
        if chance < 15 then
            wall_color = color_mode_common[math.random(1, #color_mode_common)]
        elseif chance > 85 then
            wall_color = color_mode_colorful[math.random(1, #color_mode_colorful)]
        else
            wall_color = color_mode_toned[math.random(1, #color_mode_toned)]
        end
    else
        -- choose a random wall color from [x] colors
        wall_color = math.random(1, color_count_wall)
    end

    -- choose a random roof color from [x] colors
    roof_color = math.random(1, color_count_roof)

    -- all wall animations: pause and set to transparent
    for i = 5, 4 + color_count_wall * 4 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    -- wall animations of chosen color: pause and set to opaque
    for i = 1 + wall_color * 4, 4 + wall_color * 4 do
        Tile.setBuildingAnimationFrame(x, y, 2, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    -- all roof animations: pause and set to transparent
    for i = 5 + color_count_wall * 4, (4 + color_count_wall * 4) + color_count_roof * 4 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    -- wall roof of chosen color: pause and set to opaque
    for i = (1 + color_count_wall * 4) + roof_color * 4, (4 + color_count_wall * 4) + roof_color * 4 do
        Tile.setBuildingAnimationFrame(x, y, 2, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    -- hedges

    if settings.placeHedges == 1 then
        for i = 1, 4 do
            Tile.setBuildingAnimationFrame(x, y, 2, i)
            Tile.resumeBuildingAnimation(x, y, i, 0)
        end
        
        for i = 93, 96 do
            Tile.setBuildingAnimationFrame(x, y, 2, i)
            Tile.resumeBuildingAnimation(x, y, i, 0)
        end
    elseif settings.placeHedges == 2 then
        for i = 1 ,4 do
            Tile.setBuildingAnimationFrame(x, y, 1, i)
            Tile.resumeBuildingAnimation(x, y, i, 0)
        end
        
        for i = 93, 96 do
            Tile.setBuildingAnimationFrame(x, y, 1, i)
            Tile.resumeBuildingAnimation(x, y, i, 0)
        end
    elseif settings.placeHedges == 3 then
        if math.random(1, 2) == 1 then
            for i = 1, 4 do
                Tile.setBuildingAnimationFrame(x, y, 2, i)
                Tile.resumeBuildingAnimation(x, y, i, 0)
            end
            
            for i = 93, 96 do
                Tile.setBuildingAnimationFrame(x, y, 2, i)
                Tile.resumeBuildingAnimation(x, y, i, 0)
            end
        else
            for i = 1, 4 do
                Tile.setBuildingAnimationFrame(x, y, 1, i)
                Tile.resumeBuildingAnimation(x, y, i, 0)
            end
            
            for i = 93, 96 do
                Tile.setBuildingAnimationFrame(x, y, 1, i)
                Tile.resumeBuildingAnimation(x, y, i, 0)
            end
        end
    end

    -- align to road
    
    if settings.alignToRoad == 1 then

        if buildings1x1:contains(Tile.getBuildingDraft(x, y)) then

            if Tile.isRoad(x, y - 1) then
                Tile.setBuildingFrame(x, y, 0)
            elseif Tile.isRoad(x + 1, y) then
                Tile.setBuildingFrame(x, y, 1)
            elseif Tile.isRoad(x, y + 1) then
                Tile.setBuildingFrame(x, y, 2)
            elseif Tile.isRoad(x - 1, y) then
                Tile.setBuildingFrame(x, y, 3)
            end
        
        elseif buildings2x2:contains(Tile.getBuildingDraft(x, y)) then

            if Tile.isRoad(x, y - 1) and Tile.isRoad(x + 1, y - 1) then
                Tile.setBuildingFrame(x, y, 0)
            elseif Tile.isRoad(x + 2, y) and Tile.isRoad(x + 2, y + 1) then
                Tile.setBuildingFrame(x, y, 1)
            elseif Tile.isRoad(x + 1, y + 2) and Tile.isRoad(x, y + 2) then
                Tile.setBuildingFrame(x, y, 2)
            elseif Tile.isRoad(x - 1, y) and Tile.isRoad(x - 1, y - 1) then
                Tile.setBuildingFrame(x, y, 3)
            end
        end

    end

end

    -- upgrades
    -- conditions: building older than 6 months, in park influence
    -- if conditions met: 0.5% chance every day to upgrade to it's upgraded counterpart (if in max park infl)

function script:daily(x, y, level)
    if not Tile.isBuildingUntouchable(x, y) then
        if Tile.getBuildingDaysBuilt(x, y) > 90 then
            if math.random() < Tile.getInfluence(Tile.INFLUENCE_PARK, x, y) * 0.005 then
                
                if Tile.getBuildingDraft(x, y) == building_2x2_00 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_2x2_00_UPG, x, y)
                end
                
                if Tile.getBuildingDraft(x, y) == building_2x2_01 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_2x2_01_UPG, x, y)
                end
                
                if Tile.getBuildingDraft(x, y) == building_2x2_02 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_2x2_02_UPG, x, y)
                end

            end
        end

        if Tile.getBuildingDaysBuilt(x, y) > 180 then
            if math.random() < Tile.getInfluence(Tile.INFLUENCE_PARK, x, y) * 0.005 then

                if Tile.getBuildingDraft(x, y) == building_1x1_00 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_1x1_00_UPG, x, y)
                end
                
                if Tile.getBuildingDraft(x, y) == building_1x1_01 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_1x1_01_UPG, x, y)
                end
                
                if Tile.getBuildingDraft(x, y) == building_1x1_02 then
                    Builder.remove(x, y)
                    Builder.buildBuilding(building_1x1_02_UPG, x, y)
                end

            end
        end
    end
end

function script:event(x, y, level, event)
    if event == Script.EVENT_PLACED then
		colors(x, y)
    end
end
