Types = {}

function Types.isTable(argument)
    return type(argument) == "table"
end

function Types.isFunction(argument)
    return type(argument) == "function"
end

function Types.isString(argument)
    return type(argument) == "string"
end

function Types.isNumber(argument)
    return type(argument) == "number"
end

