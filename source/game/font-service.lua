cls_FontService = "FontService"
class(cls_FontService).extends()

function FontService:init(container)
    self.gfx = container:get(i_Graphics)
    self.font = self.gfx.font.new("font/font-Cuberick-Bold")
end

function FontService:getFont()
    return self.font
end