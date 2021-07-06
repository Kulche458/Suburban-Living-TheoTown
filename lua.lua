
local buildings1x1
local buildings2x2

math.randomseed(os.time())

function script:init()
    buildings1x1 = Array{
        Draft.getDraft('$kulche_suburbs_1x1_00'),
        Draft.getDraft('$kulche_suburbs_1x1_01'),
        Draft.getDraft('$kulche_suburbs_1x1_02')
    }
    buildings2x2 = Array{
        Draft.getDraft('$kulche_suburbs_2x2_00'),
        Draft.getDraft('$kulche_suburbs_2x2_01'),
        Draft.getDraft('$kulche_suburbs_2x2_02')
    }
end

local function colors(x, y)
    -- choose random wall color from 7 provided
    local walls_animation_count = 28
    local roof_animation_count = 16
    local hedge_animation_count = 4
    for i = 1, walls_animation_count+roof_animation_count do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end
    for i = 47, hedge_animation_count do
        Tile.setBuildingAnimationFrame(x, y, 1, i)
        Tile.pauseBuildingAnimation(x, y, i)
    end

    local walls_color = math.random(1, walls_animation_count/4)
    if walls_color == 1 then
        walls_animation = 1 -- set first animation index to 1
    elseif walls_color == 2 then
        walls_animation = 5 -- set first animation index to 5
    elseif walls_color == 3 then
        walls_animation = 9 -- set first animation index to 9
    elseif walls_color == 4 then
        walls_animation = 13 -- set first animation index to 13
    elseif walls_color == 5 then
        walls_animation = 17 -- set first animation index to 17
    elseif walls_color == 6 then
        walls_animation = 21 -- set first animation index to 21
    elseif walls_color == 7 then
        walls_animation = 25 -- set first animation index to 25
    end
    
    local roof_color = math.random(1, roof_animation_count/4)
    if roof_color == 1 then
        roof_animation = 29
    elseif roof_color == 2 then
        roof_animation = 33
    elseif roof_color == 3 then
        roof_animation = 37
    elseif roof_color == 4 then
        roof_animation = 41
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
        Tile.setBuildingAnimationFrame(x, y, 2, 49)
        Tile.resumeBuildingAnimation(x, y, 49, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 50)
        Tile.resumeBuildingAnimation(x, y, 50, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 51)
        Tile.resumeBuildingAnimation(x, y, 51, 0)
        Tile.setBuildingAnimationFrame(x, y, 2, 52)
        Tile.resumeBuildingAnimation(x, y, 52, 0)
    elseif settings.placeHedges == 2 then
        Tile.setBuildingAnimationFrame(x, y, 1, 49)
        Tile.resumeBuildingAnimation(x, y, 49, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 50)
        Tile.resumeBuildingAnimation(x, y, 50, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 51)
        Tile.resumeBuildingAnimation(x, y, 51, 0)
        Tile.setBuildingAnimationFrame(x, y, 1, 52)
        Tile.resumeBuildingAnimation(x, y, 52, 0)
    elseif settings.placeHedges == 3 then
        if math.random(1, 2) == 1 then
            Tile.setBuildingAnimationFrame(x, y, 2, 49)
            Tile.resumeBuildingAnimation(x, y, 49, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 50)
            Tile.resumeBuildingAnimation(x, y, 50, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 51)
            Tile.resumeBuildingAnimation(x, y, 51, 0)
            Tile.setBuildingAnimationFrame(x, y, 2, 52)
            Tile.resumeBuildingAnimation(x, y, 52, 0)
        else
            Tile.setBuildingAnimationFrame(x, y, 1, 49)
            Tile.resumeBuildingAnimation(x, y, 49, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 50)
            Tile.resumeBuildingAnimation(x, y, 50, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 51)
            Tile.resumeBuildingAnimation(x, y, 51, 0)
            Tile.setBuildingAnimationFrame(x, y, 1, 52)
            Tile.resumeBuildingAnimation(x, y, 52, 0)
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

function script:event(x, y, level, event)
    if event == Script.EVENT_PLACED then
		colors(x, y)
    end
end
