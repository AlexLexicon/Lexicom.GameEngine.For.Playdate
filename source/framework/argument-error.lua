ArgumentError = {}

function ArgumentError.ThrowIfNil(argument)
    if argument == nil then
        error("The argument was nil.")
    end
end

function ArgumentError.ThrowIfEmpty(argument)
    if argument ~= nil then
        if argument == "" or Types.isTable(argument) and next(argument) == nil then
            error("The argument was empty.")
        end
    end
end

function ArgumentError.ThrowIfClass(argument, className)
    if argument.className == className then
        error("The argument was a '"..className.."'.")
    end
end

function ArgumentError.ThrowIfNotClass(argument, className)
    if argument.className ~= className then
        error("The argument was not a '"..className.."'.")
    end
end

function ArgumentError.ThrowIfTable(argument)
    if Types.isTable(argument) == true then
        error("The argument was a table.")
    end
end

function ArgumentError.ThrowIfNotTable(argument)
    if Types.isTable(argument) == false then
        error("The argument was not a table.")
    end
end

function ArgumentError.ThrowIfFunction(argument)
    if Types.isFunction(argument) == true then
        error("The argument was a function.")
    end
end

function ArgumentError.ThrowIfNotFunction(argument)
    if Types.isFunction(argument) == false then
        error("The argument was not a function.")
    end
end

function ArgumentError.ThrowIfString(argument)
    if Types.isString(argument) == true then
        error("The argument was a string.")
    end
end

function ArgumentError.ThrowIfNotString(argument)
    if Types.isString(argument) == false then
        error("The argument was not a string.")
    end
end

function ArgumentError.ThrowIfNumber(argument)
    if Types.isNumber(argument) == true then
        error("The argument was a number.")
    end
end

function ArgumentError.ThrowIfNotNumber(argument)
    if Types.isNumber(argument) == false then
        error("The argument was not a number.")
    end
end