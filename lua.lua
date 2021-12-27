
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
    if walls_color == 1 then
        walls_animation = 5 -- set first animation index to 5
    elseif walls_color == 2 then
        walls_animation = 9 -- set first animation index to 9
    elseif walls_color == 3 then
        walls_animation = 13 -- set first animation index to 13
    elseif walls_color == 4 then
        walls_animation = 17 -- set first animation index to 17
    elseif walls_color == 5 then
        walls_animation = 21 -- set first animation index to 21
    elseif walls_color == 6 then
        walls_animation = 25 -- set first animation index to 25
    elseif walls_color == 7 then
        walls_animation = 29 -- set first animation index to 29
    elseif walls_color == 8 then
        walls_animation = 33 -- set first animation index to 33
    elseif walls_color == 9 then
        walls_animation = 37 -- set first animation index to 37
    elseif walls_color == 10 then
        walls_animation = 41 -- set first animation index to 41
    elseif walls_color == 11 then
        walls_animation = 45 -- set first animation index to 45
    end

        --i should optimise this
    
    local roof_color = math.random(1, 6)
    if roof_color == 1 then
        roof_animation = 49
    elseif roof_color == 2 then
        roof_animation = 53
    elseif roof_color == 3 then
        roof_animation = 57
    elseif roof_color == 4 then
        roof_animation = 61
    elseif roof_color == 5 then
        roof_animation = 65
    elseif roof_color == 6 then
        roof_animation = 69
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
        
        Tile.setBuildingAnimationFrame(x, y, 2, 81)
        Tile.resumeBuildingAnimation(x, y, 81, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 82)
        Tile.resumeBuildingAnimation(x, y, 82, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 83)
        Tile.resumeBuildingAnimation(x, y, 83, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 84)
        Tile.resumeBuildingAnimation(x, y, 84, 0)
    elseif settings.placeHedges == 2 then
        Tile.setBuildingAnimationFrame(x, y, 1, 1)
        Tile.resumeBuildingAnimation(x, y, 1, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 2)
        Tile.resumeBuildingAnimation(x, y, 2, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 3)
        Tile.resumeBuildingAnimation(x, y, 3, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 4)
        Tile.resumeBuildingAnimation(x, y, 4, 0)
        
        Tile.setBuildingAnimationFrame(x, y, 1, 81)
        Tile.resumeBuildingAnimation(x, y, 81, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 82)
        Tile.resumeBuildingAnimation(x, y, 82, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 83)
        Tile.resumeBuildingAnimation(x, y, 83, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 84)
        Tile.resumeBuildingAnimation(x, y, 84, 0)
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
            
            Tile.setBuildingAnimationFrame(x, y, 2, 81)
            Tile.resumeBuildingAnimation(x, y, 81, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 82)
            Tile.resumeBuildingAnimation(x, y, 82, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 83)
            Tile.resumeBuildingAnimation(x, y, 83, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 84)
            Tile.resumeBuildingAnimation(x, y, 84, 0)
        else
            Tile.setBuildingAnimationFrame(x, y, 1, 1)
            Tile.resumeBuildingAnimation(x, y, 1, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 2)
            Tile.resumeBuildingAnimation(x, y, 2, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 3)
            Tile.resumeBuildingAnimation(x, y, 3, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 4)
            Tile.resumeBuildingAnimation(x, y, 4, 0)
            
            Tile.setBuildingAnimationFrame(x, y, 1, 81)
            Tile.resumeBuildingAnimation(x, y, 81, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 82)
            Tile.resumeBuildingAnimation(x, y, 82, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 83)
            Tile.resumeBuildingAnimation(x, y, 83, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 84)
            Tile.resumeBuildingAnimation(x, y, 84, 0)
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

function script:event(x, y, level, event)
    if event == Script.EVENT_PLACED then
		colors(x, y)
    end
end
