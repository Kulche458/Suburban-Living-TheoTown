
function script:update()
    local x,y,scale = City.getView()
    Drawing.drawText(x, 30, 30)
    Drawing.drawText(y, 30, 45)
    local influence = Tile.getInfluence(Tile.INFLUENCE_PARK, x, y)
    Drawing.drawText(influence, 30, 60)
end