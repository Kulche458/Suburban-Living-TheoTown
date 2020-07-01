local function building0(x, y, level)
    if Tile.hasRoad(x, y - 1) then
		Tile.setBuildingFrame(x, y, 0)
	elseif Tile.hasRoad(x + 1, y) then
		Tile.setBuildingFrame(x, y, 1)
	elseif Tile.hasRoad(x, y + 1) then
		Tile.setBuildingFrame(x, y, 2)
	elseif Tile.hasRoad(x - 1, y) then
		Tile.setBuildingFrame(x, y, 3)
    end
end


function script:event(x, y, level, event)
    if event == Script.EVENT_PLACED then
        building0(x, y, level)
    end
end