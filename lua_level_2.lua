
local buildings1x1_tt
local buildings2x2_tt

local building_1x1_00_tt
local building_1x1_01_tt
local building_1x1_02_tt

local building_2x2_00_tt
local building_2x2_01_tt
local building_2x2_02_tt

math.randomseed(os.time())

function script:init()
    buildings1x1_tt = Array{
        Draft.getDraft('$kulche_suburbs_1x1_00_tt'),
        Draft.getDraft('$kulche_suburbs_1x1_01_tt'),
        Draft.getDraft('$kulche_suburbs_1x1_02_tt')
    }
    buildings2x2_tt = Array{
        Draft.getDraft('$kulche_suburbs_2x2_00_tt'),
        Draft.getDraft('$kulche_suburbs_2x2_01_tt'),
        Draft.getDraft('$kulche_suburbs_2x2_02_tt')
    }
    building_1x1_00_tt = Draft.getDraft('$kulche_suburbs_1x1_00_tt')
    building_1x1_01_tt = Draft.getDraft('$kulche_suburbs_1x1_01_tt')
    building_1x1_02_tt = Draft.getDraft('$kulche_suburbs_1x1_02_tt')
    
    building_2x2_00_tt = Draft.getDraft('$kulche_suburbs_2x2_00_tt')
    building_2x2_01_tt = Draft.getDraft('$kulche_suburbs_2x2_01_tt')
    building_2x2_02_tt = Draft.getDraft('$kulche_suburbs_2x2_02_tt')
end

local function colors_tt(x, y)
    -- choose random wall color from 7 provided
    for i = 5, 49 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end
    for i = 1, 4 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end
    for i = 81, 84 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    local walls_color = math.random(1, 11)
    for i=1,11 do
        if i = walls_color then
            walls_animation == i * 4 + 1
        end
    end
    
    local roof_color = math.random(1, 6)
    for j=1,6 do
        if j = roof_color then
            roof_animation == j * 4 + 45
        end
    end

    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation)
    Tile.resumeBuildingAnimation(x, y, walls_animation, 0) -- play animation with index n
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation+1)
    Tile.resumeBuildingAnimation(x, y, walls_animation+1, 0)-- play animation with index n + 1
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation+2)
    Tile.resumeBuildingAnimation(x, y, walls_animation+2, 0)-- play animation with index n + 2
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation+3)
    Tile.resumeBuildingAnimation(x, y, walls_animation+3, 0)-- play animation with index n + 3

    -- eg. if walls_color = 2, play animations with index 5, 6, 7, 8 (gray)
    
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation)
    Tile.resumeBuildingAnimation(x, y, roof_animation, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation+1)
    Tile.resumeBuildingAnimation(x, y, roof_animation+1, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation+2)
    Tile.resumeBuildingAnimation(x, y, roof_animation+2, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation+3)
    Tile.resumeBuildingAnimation(x, y, roof_animation+3, 0)

    -- hedges

    if settings.placeHedges == 1 then
        Tile.setBuildingAnimationFrame(x, y, 2, 1)
        Tile.resumeBuildingAnimation(x, y, 1, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 2)
        Tile.resumeBuildingAnimation(x, y, 2, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 3)
        Tile.resumeBuildingAnimation(x, y, 3, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 4)
        Tile.resumeBuildingAnimation(x, y, 4, 0)
        
        Tile.setBuildingAnimationFrame(x, y, 2, 57)
        Tile.resumeBuildingAnimation(x, y, 57, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 58)
        Tile.resumeBuildingAnimation(x, y, 58, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 59)
        Tile.resumeBuildingAnimation(x, y, 59, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 60)
        Tile.resumeBuildingAnimation(x, y, 60, 0)
    elseif settings.placeHedges == 2 then
        Tile.setBuildingAnimationFrame(x, y, 1, 1)
        Tile.resumeBuildingAnimation(x, y, 1, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 2)
        Tile.resumeBuildingAnimation(x, y, 2, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 3)
        Tile.resumeBuildingAnimation(x, y, 3, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 4)
        Tile.resumeBuildingAnimation(x, y, 4, 0)
        
        Tile.setBuildingAnimationFrame(x, y, 1, 57)
        Tile.resumeBuildingAnimation(x, y, 57, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 58)
        Tile.resumeBuildingAnimation(x, y, 58, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 59)
        Tile.resumeBuildingAnimation(x, y, 59, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 60)
        Tile.resumeBuildingAnimation(x, y, 60, 0)
    elseif settings.placeHedges == 3 then
        if math.random(1, 2) == 1 then
            Tile.setBuildingAnimationFrame(x, y, 2, 1)
            Tile.resumeBuildingAnimation(x, y, 1, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 2)
            Tile.resumeBuildingAnimation(x, y, 2, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 3)
            Tile.resumeBuildingAnimation(x, y, 3, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 4)
            Tile.resumeBuildingAnimation(x, y, 4, 0)
            
            Tile.setBuildingAnimationFrame(x, y, 2, 57)
            Tile.resumeBuildingAnimation(x, y, 57, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 58)
            Tile.resumeBuildingAnimation(x, y, 58, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 59)
            Tile.resumeBuildingAnimation(x, y, 59, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 60)
            Tile.resumeBuildingAnimation(x, y, 60, 0)
        else
            Tile.setBuildingAnimationFrame(x, y, 1, 1)
            Tile.resumeBuildingAnimation(x, y, 1, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 2)
            Tile.resumeBuildingAnimation(x, y, 2, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 3)
            Tile.resumeBuildingAnimation(x, y, 3, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 4)
            Tile.resumeBuildingAnimation(x, y, 4, 0)
            
            Tile.setBuildingAnimationFrame(x, y, 1, 57)
            Tile.resumeBuildingAnimation(x, y, 57, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 58)
            Tile.resumeBuildingAnimation(x, y, 58, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 59)
            Tile.resumeBuildingAnimation(x, y, 59, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 60)
            Tile.resumeBuildingAnimation(x, y, 60, 0)
        end
    end

    -- align to road
    
    if settings.alignToRoad == 1 then

        if buildings1x1_tt:contains(Tile.getBuildingDraft(x, y)) then

            if Tile.isRoad(x, y - 1) then
                Tile.setBuildingFrame(x, y, 0)
            elseif Tile.isRoad(x + 1, y) then
                Tile.setBuildingFrame(x, y, 1)
            elseif Tile.isRoad(x, y + 1) then
                Tile.setBuildingFrame(x, y, 2)
            elseif Tile.isRoad(x - 1, y) then
                Tile.setBuildingFrame(x, y, 3)
            end
        
        elseif buildings2x2_tt:contains(Tile.getBuildingDraft(x, y)) then

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

--[[function script:daily(x, y, level)
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
end]]--

function script:event(x, y, level, event)
    if event == Script.EVENT_PLACED then
		colors_tt(x, y)
    end
end
