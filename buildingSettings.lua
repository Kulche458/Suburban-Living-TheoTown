
local decorations_draft = Draft.getDraft('$kulche_suburbs_decorations')
local backyard_draft = Draft.getDraft('$kulche_suburbs_backyards_poor')

local array1 = {0, 4}
local array2 = {3, 7}
local array3 = {1, 5}
local array4 = {2, 6}

local removalActions = {
    {
        backyard = {{0, 2}, {1, 2}},
        frames = {0, 3},
    },
    {
        backyard = {{-1, 0}, {-1, 1}},
        frames = {1, 0},
    },
    {
        backyard = {{0, -1}, {1, -1}},
        frames = {1, 2},
    },
    {
        backyard = {{2, 0}, {2, 1}},
        frames = {2, 3},
    },
}

local function alignToRoads(x, y)
    if Tile.isRoad(x, y - 1) and Tile.isRoad(x + 1, y - 1) then
        Tile.setBuildingFrame(x, y, 0)
    elseif Tile.isRoad(x + 2, y) and Tile.isRoad(x + 2, y + 1) then
        Tile.setBuildingFrame(x, y, 1)
    elseif Tile.isRoad(x + 1, y + 2) and Tile.isRoad(x, y + 2) then
        Tile.setBuildingFrame(x, y, 2)
    elseif Tile.isRoad(x - 1, y) and Tile.isRoad(x - 1, y + 1) then
        Tile.setBuildingFrame(x, y, 3)
    end
end

local function placeBackyards(x, y)
    if Tile.getBuildingFrame(x, y) == 0 then
        if (Tile.getBuildingDraft(x, y + 2) == decorations_draft and Tile.getBuildingDraft(x + 1, y + 2) == decorations_draft) then
            Builder.remove(x, y + 2)
            Builder.remove(x + 1, y + 2)
            Builder.buildBuilding(backyard_draft, x, y + 2, array1[math.random(1, #array1)])
            Builder.buildBuilding(backyard_draft, x + 1, y + 2, array2[math.random(1, #array2)])
            Tile.setBuildingAnimationFrame(x, y, 2, 4)
        end
    elseif Tile.getBuildingFrame(x, y) == 1 then
        if (Tile.getBuildingDraft(x - 1, y) == decorations_draft and Tile.getBuildingDraft(x - 1, y + 1) == decorations_draft) then
            Builder.remove(x - 1, y)
            Builder.remove(x - 1, y + 1)
            Builder.buildBuilding(backyard_draft, x - 1, y, array3[math.random(1, #array3)])
            Builder.buildBuilding(backyard_draft, x - 1, y + 1, array1[math.random(1, #array1)])
            Tile.setBuildingAnimationFrame(x, y, 2, 2)
        end
    elseif Tile.getBuildingFrame(x, y) == 2 then
        if (Tile.getBuildingDraft(x, y - 1) == decorations_draft and Tile.getBuildingDraft(x + 1, y - 1) == decorations_draft) then
            Builder.remove(x, y - 1)
            Builder.remove(x + 1, y - 1)
            Builder.buildBuilding(backyard_draft, x, y - 1, array3[math.random(1, #array3)])
            Builder.buildBuilding(backyard_draft, x + 1, y - 1, array4[math.random(1, #array4)])
            Tile.setBuildingAnimationFrame(x, y, 2, 9)
        end
    elseif Tile.getBuildingFrame(x, y) == 3 then
        if (Tile.getBuildingDraft(x + 2, y) == decorations_draft and Tile.getBuildingDraft(x + 2, y + 1) == decorations_draft) then
            Builder.remove(x + 2, y)
            Builder.remove(x + 2, y + 1)
            Builder.buildBuilding(backyard_draft, x + 2, y, array4[math.random(1, #array4)])
            Builder.buildBuilding(backyard_draft, x + 2, y + 1, array2[math.random(1, #array2)])
            Tile.setBuildingAnimationFrame(x, y, 2, 11)
        end
    end
end

local function removeBackyards(x, y)
    for i = 1, #removalActions do
        local action = removalActions[i]
        local backyard = action.backyard
        local frames = action.frames
        local matches = true
        for j = 1, #backyard do
            local xy = backyard[j]
            matches = matches
                and Tile.getBuildingDraft(x + xy[1], y + xy[2]) == backyard_draft
                and Tile.getBuildingFrame(x + xy[1], y + xy[2]) % 4 == frames[j]
        end
        if matches then
            for j = 1, #backyard do
                local xy = backyard[j]
                Builder.remove(x + xy[1], y + xy[2])
            end
            break
        end
    end
end

function script:event(x, y, level, event)
    if event == Script.EVENT_FINISHED then
		alignToRoads(x, y)
        placeBackyards(x, y)
    end

    if event == Script.EVENT_REMOVE then
        removeBackyards(x, y)
    end
end
