cls_ServiceDescriptor = "ServiceDescriptor"
class(cls_ServiceDescriptor).extends()

local lastIndexId = 0

function ServiceDescriptor:init(
    --[[number]] lifetime,
    --[[string list]] keys, 
    --[[string (class name) | table (instance) | function (factory)]] implementation)

    ServiceLifetimes.ThrowIfNotValid(lifetime)

    ArgumentError.ThrowIfNil(keys)
    ArgumentError.ThrowIfNotTable(keys)
    ArgumentError.ThrowIfEmpty(keys)

    local keysString = ""
    for keyIndex, keyString in pairs(keys) do
        ServiceDescriptor.ThrowIfNotKey(keyString)
        if keysString ~= "" then
            keysString = ", "..tostring(keysString)
        end
        keysString = keysString..tostring(keyString)
    end

    ServiceDescriptor.ThrowIfNotImplementation(implementation)

    if isInstance and lifetime ~= ServiceLifetimes.singleton then
        error("An instance implementation may only be provided if the lifetime is a singleton.")
    end

    self.lifetime = lifetime
    self.keys = keys
    self.implementation = implementation

    lastIndexId = lastIndexId + 1

    self._keysString = keysString
    self._indexId = lastIndexId
end

function ServiceDescriptor.ThrowIfNotKey(key)
    ArgumentError.ThrowIfNil(key)
    ArgumentError.ThrowIfNotString(key)
    ArgumentError.ThrowIfEmpty(key)
end

function ServiceDescriptor.ThrowIfNotImplementation(implementation)
    ArgumentError.ThrowIfNil(implementation)
    local isClassName = Types.isString(implementation)
    local isInstance = Types.isTable(implementation)
    local isFactory = Types.isFunction(implementation)
    if isClassName == false and isInstance == false and isFactory == false then
        error("The argument was not a string, or a table or a function.")
    end
end