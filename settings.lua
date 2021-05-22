
local settings

function script:init()
    settings = Util.optStorage(TheoTown.getStorage(), self:getDraft():getId()..':settings')
    settings.placeHedges = settings.placeHedges or 3
end

function script:settings()
    return {
        {
            name = 'Place hedges',
            value = settings.placeHedges,
            values = {1, 2, 3},
            valueNames = {'Yes', 'No', 'Random'},
            onChange = function(newState) settings.placeHedges = newState end
        }
    }
end


