cls_ServiceContainer = "ServiceContainer"
class(cls_ServiceContainer).extends()

function ServiceContainer:init(keyToDescriptors)
    self.keyToDescriptors = keyToDescriptors
    self.keyToExistingWeakInstances = {}
    self.managedScopedInstances = {}
end

function ServiceContainer:createScopedContainer()
    error("The method method 'createScopedContainer' is not implemented by the extending '"..tostring(self.className).."'.")
end

function ServiceContainer:get(key)
    ServiceDescriptor.ThrowIfNotKey(key)

    local descriptorsForKey = self.keyToDescriptors[key]

    if descriptorsForKey == nil then
        error("No service registered for the key '"..tostring(key).."'.")
    end

    local lastDescriptor = descriptorsForKey[#descriptorsForKey]

    return self:_get(lastDescriptor)
end

function ServiceContainer:getAll(key)
    ServiceDescriptor.ThrowIfNotKey(key)

    local descriptorsForKey = self.keyToDescriptors[key]

    if descriptorsForKey == nil then
        error("No services registered for the key '"..tostring(key).."'.")
    end

    local allDescriptors = {}

    for index, descriptor in pairs(descriptorsForKey) do
        allDescriptors[index] = self:_get(descriptor)
    end
    
    return allDescriptors
end

function ServiceContainer:getAllExisting(key)
    ServiceDescriptor.ThrowIfNotKey(key)

    local weakInstances = self.keyToExistingWeakInstances[key]

    --we want this new list to not be weak
    local instances = {}

    if weakInstances ~= nil then
        for index, weakInstance in ipairs(weakInstances) do
            table.insert(instances, weakInstance)
        end
    end

    return instances
end

function ServiceContainer:_get(descriptor)
    if descriptor.lifetime == ServiceLifetimes.singleton then
        return self:_getSingleton(descriptor)
    elseif descriptor.lifetime == ServiceLifetimes.transient then
        return self:_activate(descriptor)
    elseif descriptor.lifetime == ServiceLifetimes.scoped then
        return self:_initalizeSinglular(self.managedScopedInstances, descriptor)
    else
        error("The service descriptor with the key(s) '"..tostring(descriptor._keysString).."' had a service lifetime of '"..tostring(descriptor.lifetime).."' which is not supported.")
    end
end

function ServiceContainer:_getSingleton(descriptor)
    error("The method method '_getSingleton' is not implemented by the extending '"..tostring(self.className).."'.")
end

function ServiceContainer:_initalizeSinglular(managedInstances, descriptor)
    local instance = managedInstances[descriptor._indexId]

    if instance == nil then
        instance = self:_activate(descriptor)
        managedInstances[descriptor._indexId] = instance
    end

    return instance
end

function ServiceContainer:_activate(descriptor)
    local instance = nil

    local keys = descriptor.keys
    local implementation = descriptor.implementation

    if Types.isString(implementation) then
        instance = _G[implementation](self)
    elseif Types.isTable(implementation) then
        instance = implementation
    elseif Types.isFunction(implementation) then
        instance = implementation(self)
    else
        error("The service descriptor with the key(s) '"..tostring(descriptor._keysString).."' had an implementation of which is not supported.")
    end

    if Types.isTable(instance) == false then
        error("The activated instance for the service descriptor with the key(s) '"..tostring(descriptor._keysString).."' was not a table.")
    end

    for keyIndex, key in pairs(keys) do
        local weakInstances = self.keyToExistingWeakInstances[key]

        if weakInstances == nil then
            weakInstances = {}
            setmetatable(weakInstances, {__mode = 'v'})
        end

        table.insert(weakInstances, instance)

        self.keyToExistingWeakInstances[key] = weakInstances
    end

    return instance
end