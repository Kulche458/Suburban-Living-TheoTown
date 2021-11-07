
local buildings1x1_tt
local buildings2x2_tt

local building_1x1_00_tt

local building_2x2_00_tt
local building_2x2_01_tt

math.randomseed(os.time())

function script:init()
    buildings1x1_tt = Array{
        Draft.getDraft('$kulche_suburbs_1x1_00_tt')
    }
    buildings2x2_tt = Array{
        Draft.getDraft('$kulche_suburbs_2x2_00_tt'),
        Draft.getDraft('$kulche_suburbs_2x2_01_tt')
    }
    building_1x1_00_tt = Draft.getDraft('$kulche_suburbs_1x1_00_tt')
    
    building_2x2_00_tt = Draft.getDraft('$kulche_suburbs_2x2_00_tt')
    building_2x2_01_tt = Draft.getDraft('$kulche_suburbs_2x2_01_tt')
end

local function colors_tt(x, y)
    -- choose random wall color from 7 provided
    local walls_animation_count = 28
    local roof_animation_count = 16
    for i = 1, walls_animation_count+roof_animation_count do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end
    for i = 53, 56 do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    local walls_color = math.random(1, walls_animation_count/4)
    if walls_color == 1 then
        walls_animation_tt = 1 -- set first animation index to 1
    elseif walls_color == 2 then
        walls_animation_tt = 5 -- set first animation index to 5
    elseif walls_color == 3 then
        walls_animation_tt = 9 -- set first animation index to 9
    elseif walls_color == 4 then
        walls_animation_tt = 13 -- set first animation index to 13
    elseif walls_color == 5 then
        walls_animation_tt = 17 -- set first animation index to 17
    elseif walls_color == 6 then
        walls_animation_tt = 21 -- set first animation index to 21
    elseif walls_color == 7 then
        walls_animation_tt = 25 -- set first animation index to 25
    end
    
    local roof_color = math.random(1, roof_animation_count/4)
    if roof_color == 1 then
        roof_animation_tt = 29
    elseif roof_color == 2 then
        roof_animation_tt = 33
    elseif roof_color == 3 then
        roof_animation_tt = 37
    elseif roof_color == 4 then
        roof_animation_tt = 41
    end

    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation_tt)
    Tile.resumeBuildingAnimation(x, y, walls_animation_tt, 0) -- play animation with index n
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation_tt+1)
    Tile.resumeBuildingAnimation(x, y, walls_animation_tt+1, 0)-- play animation with index n + 1
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation_tt+2)
    Tile.resumeBuildingAnimation(x, y, walls_animation_tt+2, 0)-- play animation with index n + 2
    Tile.setBuildingAnimationFrame(x, y, 2, walls_animation_tt+3)
    Tile.resumeBuildingAnimation(x, y, walls_animation_tt+3, 0)-- play animation with index n + 3

    -- eg. if walls_color = 2, play animations with index 5, 6, 7, 8 (gray)
    
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation_tt)
    Tile.resumeBuildingAnimation(x, y, roof_animation_tt, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation_tt+1)
    Tile.resumeBuildingAnimation(x, y, roof_animation_tt+1, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation_tt+2)
    Tile.resumeBuildingAnimation(x, y, roof_animation_tt+2, 0)
    Tile.setBuildingAnimationFrame(x, y, 2, roof_animation_tt+3)
    Tile.resumeBuildingAnimation(x, y, roof_animation_tt+3, 0)

    -- hedges

    if settings.placeHedges == 1 then
        Tile.setBuildingAnimationFrame(x, y, 2, 53)
        Tile.resumeBuildingAnimation(x, y, 53, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 54)
        Tile.resumeBuildingAnimation(x, y, 54, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 55)
        Tile.resumeBuildingAnimation(x, y, 55, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 56)
        Tile.resumeBuildingAnimation(x, y, 56, 0)
    elseif settings.placeHedges == 2 then
        Tile.setBuildingAnimationFrame(x, y, 1, 53)
        Tile.resumeBuildingAnimation(x, y, 53, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 54)
        Tile.resumeBuildingAnimation(x, y, 54, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 55)
        Tile.resumeBuildingAnimation(x, y, 55, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 56)
        Tile.resumeBuildingAnimation(x, y, 56, 0)
    elseif settings.placeHedges == 3 then
        if math.random(1, 2) == 1 then
            Tile.setBuildingAnimationFrame(x, y, 2, 53)
            Tile.resumeBuildingAnimation(x, y, 53, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 54)
            Tile.resumeBuildingAnimation(x, y, 54, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 55)
            Tile.resumeBuildingAnimation(x, y, 55, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 56)
            Tile.resumeBuildingAnimation(x, y, 56, 0)
        else
            Tile.setBuildingAnimationFrame(x, y, 1, 53)
            Tile.resumeBuildingAnimation(x, y, 53, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 54)
            Tile.resumeBuildingAnimation(x, y, 54, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 55)
            Tile.resumeBuildingAnimation(x, y, 55, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 56)
            Tile.resumeBuildingAnimation(x, y, 56, 0)
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
