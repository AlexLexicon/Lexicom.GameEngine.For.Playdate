cls_MathService = "MathService"
class(cls_MathService).extends()

function MathService:init(container)

end

function MathService:clamp(value, min, max)

    if value < min then
        return min
    elseif value > max then
        return max
    end

    return value
end