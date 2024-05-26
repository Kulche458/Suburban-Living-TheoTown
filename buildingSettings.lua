
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

function script:event(x, y, level, event)
    if event == Script.EVENT_FINISHED then
		alignToRoads(x, y)
    end
end
