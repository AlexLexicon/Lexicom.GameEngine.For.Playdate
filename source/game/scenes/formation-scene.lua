cls_FormationScene = "FormationScene"
class(cls_FormationScene).extends()

function FormationScene:init(container)
    self.dis = container:get(i_Display)
    self.gfx = container:get(i_Graphics)

    self.sprite = nil
end

function FormationScene:show()
    local screenWidth = self.dis.getWidth()
    local screenHeight = self.dis.getHeight()

    local columns = 3
    local rows = 3

    local gridHeight = (screenHeight / 5) * 4
    local gridWidth = (gridHeight / rows) * columns

    local image = self.gfx.image.new(gridWidth, gridHeight, self.gfx.kColorWhite)

    self.gfx.pushContext(image)
    self.gfx.setColor(self.gfx.kColorBlack)
    self.gfx.setLineWidth(2)
    for i = 0, rows do
        local y = i * (gridHeight / rows)
        self.gfx.drawLine(0, y, gridWidth, y)
    end
    for i = 0, columns do
        local x = i * (gridWidth / columns)
        self.gfx.drawLine(x, 0, x, gridHeight)
    end
    self.gfx.popContext()

    self.sprite = self.gfx.sprite.new(image)
    self.sprite:moveTo(screenWidth / 2, screenHeight / 2)
    self.sprite:add()
end