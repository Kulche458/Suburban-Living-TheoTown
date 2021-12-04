
local road

function script:init()
    settings = Util.optStorage(TheoTown.getStorage(), self:getDraft():getId()..':settings')
    settings.placeFences = settings.placeFences or 3
    settings.alignToRoad = settings.alignToRoad or 2
    settings.showSuburbanRoad = settings.showSuburbanRoad or 2
    road = Draft.getDraft('$kulche_suburbanroad00')
end

function script:settings()
    return {
        {
            name = 'Place fences',
            value = settings.placeFences,
            values = {1, 2, 3},
            valueNames = {'Yes', 'No', 'Random'},
            onChange = function(newState) settings.placeFences = newState end
        },
        {
            name = 'Align to roads',
            value = settings.alignToRoad,
            values = {1, 2},
            valueNames = {'Yes', 'No'},
            onChange = function(newState) settings.alignToRoad = newState end
        },
        {
            name = 'Show suburban road',
            value = settings.showSuburbanRoad,
            values = {1, 2},
            valueNames = {'Yes', 'No'},
            onChange = function(newState) settings.showSuburbanRoad = newState end
        }
    }
end

function script:enterCity()
    if settings.showSuburbanRoad == 1 then
        road:setVisible(true)
    elseif settings.showSuburbanRoad == 2 then
        road:setVisible(false)
    end
end
