
local road

function script:init()
    settings = Util.optStorage(TheoTown.getStorage(), self:getDraft():getId()..':settings')
    settings.placeHedges = settings.placeHedges or 3
    settings.alignToRoad = settings.alignToRoad or 2
    settings.showSuburbanRoad = settings.showSuburbanRoad or 2
    settings.colorDistribution = settings.colorDistribution or 4
    road = Draft.getDraft('$kulche_suburbanroad00')
    road_rich = Draft.getDraft('$kulche_suburbanroad01')
end

function script:settings()
    return {
        {
            name = 'Place hedges',
            value = settings.placeHedges,
            values = {1, 2, 3},
            valueNames = {'Yes', 'No', 'Random'},
            onChange = function(newState) settings.placeHedges = newState end
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
        },
        {
            name = 'Building color distribution',
            value = settings.colorDistribution,
            values = {1, 2, 3, 4},
            valueNames = {'No bias', 'Common', 'Colorful', 'Toned'},
            onChange = function(newState) settings.colorDistribution = newState end
        }
    }
end

function script:enterCity()
    if settings.showSuburbanRoad == 1 then
        road:setVisible(true)
        road_rich:setVisible(true)
    elseif settings.showSuburbanRoad == 2 then
        road:setVisible(false)
        road_rich:setVisible(false)
    end
end
