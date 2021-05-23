
function script:init()
    settings = Util.optStorage(TheoTown.getStorage(), self:getDraft():getId()..':settings')
    settings.placeHedges = settings.placeHedges or 3
    settings.alignToRoad = settings.alignToRoad or 2
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
        }
    }
end
