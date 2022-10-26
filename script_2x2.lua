
local decorations_draft = Draft.getDraft('$kulche_suburbs_decorations_00')
local backyard_draft = Draft.getDraft('$kulche_suburbs_decorations_01')

local function building_settings(x, y)

        -- align to nearby roads
    if Tile.isRoad(x, y - 1) and Tile.isRoad(x + 1, y - 1) then
        Tile.setBuildingFrame(x, y, 0)
    elseif Tile.isRoad(x + 2, y) and Tile.isRoad(x + 2, y + 1) then
        Tile.setBuildingFrame(x, y, 1)
    elseif Tile.isRoad(x + 1, y + 2) and Tile.isRoad(x, y + 2) then
        Tile.setBuildingFrame(x, y, 2)
    elseif Tile.isRoad(x - 1, y) and Tile.isRoad(x - 1, y + 1) then
        Tile.setBuildingFrame(x, y, 3)
    end

    if Tile.getBuildingFrame(x, y) == 0 then
        if (Tile.getBuildingDraft(x, y + 2) == decorations_draft and Tile.getBuildingDraft(x + 1, y + 2) == decorations_draft) then
            Builder.remove(x, y + 2)
            Builder.remove(x + 1, y + 2)
            Builder.buildBuilding(backyard_draft, x, y + 2, 0)
            Builder.buildBuilding(backyard_draft, x + 1, y + 2, 3)
        end
    elseif Tile.getBuildingFrame(x, y) == 1 then
        if (Tile.getBuildingDraft(x - 1, y) == decorations_draft and Tile.getBuildingDraft(x - 1, y + 1) == decorations_draft) then
            Builder.remove(x - 1, y)
            Builder.remove(x - 1, y + 1)
            Builder.buildBuilding(backyard_draft, x - 1, y, 1)
            Builder.buildBuilding(backyard_draft, x - 1, y + 1, 0)
        end
    elseif Tile.getBuildingFrame(x, y) == 2 then
        if (Tile.getBuildingDraft(x, y - 1) == decorations_draft and Tile.getBuildingDraft(x + 1, y - 1) == decorations_draft) then
            Builder.remove(x, y - 1)
            Builder.remove(x + 1, y - 1)
            Builder.buildBuilding(backyard_draft, x, y - 1, 1)
            Builder.buildBuilding(backyard_draft, x + 1, y - 1, 2)
        end
    elseif Tile.getBuildingFrame(x, y) == 3 then
        if (Tile.getBuildingDraft(x + 2, y) == decorations_draft and Tile.getBuildingDraft(x + 2, y + 1) == decorations_draft) then
            Builder.remove(x + 2, y)
            Builder.remove(x + 2, y + 1)
            Builder.buildBuilding(backyard_draft, x + 2, y, 2)
            Builder.buildBuilding(backyard_draft, x + 2, y + 1, 3)
        end
    end

end

function script:event(x, y, level, event)
    if event == Script.EVENT_FINISHED then
		building_settings(x, y)
    end
    if event == Script.EVENT_REMOVE then
        if ((Tile.getBuildingDraft(x, y + 2) == backyard_draft and Tile.getBuildingDraft(x + 1, y + 2) == backyard_draft) and (Tile.getBuildingFrame(x, y + 2) == 0 and Tile.getBuildingFrame(x + 1, y + 2) == 3)) then
            Builder.remove(x, y + 2)
            Builder.remove(x + 1, y + 2)
        elseif ((Tile.getBuildingDraft(x - 1, y) == backyard_draft and Tile.getBuildingDraft(x - 1, y + 1) == backyard_draft) and (Tile.getBuildingFrame(x - 1, y) == 1 and Tile.getBuildingFrame(x - 1, y + 1) == 0)) then
            Builder.remove(x - 1, y)
            Builder.remove(x - 1, y + 1)
        elseif ((Tile.getBuildingDraft(x, y - 1) == backyard_draft and Tile.getBuildingDraft(x + 1, y - 1) == backyard_draft) and (Tile.getBuildingFrame(x, y - 1) == 1 and Tile.getBuildingFrame(x + 1, y - 1) == 2)) then
            Builder.remove(x, y - 1)
            Builder.remove(x + 1, y - 1)
        elseif ((Tile.getBuildingDraft(x + 2, y) == backyard_draft and Tile.getBuildingDraft(x + 2, y + 1) == backyard_draft) and (Tile.getBuildingFrame(x + 2, y) == 2 and Tile.getBuildingFrame(x + 2, y + 1) == 3)) then
            Builder.remove(x + 2, y)
            Builder.remove(x + 2, y + 1)
        end
    end
end