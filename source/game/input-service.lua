cls_InputService = "InputService"
class(cls_InputService).extends()

function InputService:init(container)
    self.pd = container:get(i_Playdate)
end

function InputService:isUpPressed()
    return self:_isPressed(self.pd.kButtonUp)
end

function InputService:isRightPressed()
    return self:_isPressed(self.pd.kButtonRight)
end

function InputService:isDownPressed()
    return self:_isPressed(self.pd.kButtonDown)
end

function InputService:isLeftPressed()
    return self:_isPressed(self.pd.kButtonLeft)
end

function InputService:isPrimaryPressed()
    return self:_isPressed(self.pd.kButtonA)
end

function InputService:isSecondaryPressed()
    return self:_isPressed(self.pd.kButtonB)
end

function InputService:isUpReleased()
    return self:_isReleased(self.pd.kButtonUp)
end

function InputService:isRightReleased()
    return self:_isReleased(self.pd.kButtonRight)
end

function InputService:isDownReleased()
    return self:_isReleased(self.pd.kButtonDown)
end

function InputService:isLeftReleased()
    return self:_isReleased(self.pd.kButtonLeft)
end

function InputService:isPrimaryReleased()
    return self:_isReleased(self.pd.kButtonA)
end

function InputService:isSecondaryReleased()
    return self:_isReleased(self.pd.kButtonB)
end

function InputService:isUpJustPressed()
    return self:_isJustPressed(self.pd.kButtonUp)
end

function InputService:isRightJustPressed()
    return self:_isJustPressed(self.pd.kButtonRight)
end

function InputService:isDownJustPressed()
    return self:_isJustPressed(self.pd.kButtonDown)
end

function InputService:isLeftJustPressed()
    return self:_isJustPressed(self.pd.kButtonLeft)
end

function InputService:isPrimaryJustPressed()
    return self:_isJustPressed(self.pd.kButtonA)
end

function InputService:isSecondaryJustPressed()
    return self:_isJustPressed(self.pd.kButtonB)
end

function InputService:isUpJustReleased()
    return self:_isJustReleased(self.pd.kButtonUp)
end

function InputService:isRightJustReleased()
    return self:_isJustReleased(self.pd.kButtonRight)
end

function InputService:isDownJustReleased()
    return self:_isJustReleased(self.pd.kButtonDown)
end

function InputService:isLeftJustReleased()
    return self:_isJustReleased(self.pd.kButtonLeft)
end

function InputService:isPrimaryJustReleased()
    return self:_isJustReleased(self.pd.kButtonA)
end

function InputService:isSecondaryJustReleased()
    return self:_isJustReleased(self.pd.kButtonB)
end

function InputService:_isPressed(button)
    return self.pd.buttonIsPressed(button)
end

function InputService:_isReleased(button)
    return self.pd.buttonIsReleased(button)
end

function InputService:_isJustPressed(button)
    return self.pd.buttonJustPressed(button)
end

function InputService:_isJustReleased(button)
    return self.pd.buttonJustReleased(button)
end