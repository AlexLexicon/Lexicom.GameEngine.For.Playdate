cls_ServiceCollectionRegistration = "ServiceCollectionRegistration"
class(cls_ServiceCollectionRegistration).extends()

function ServiceCollectionRegistration:init(serviceCollection, implementation)
    ArgumentError.ThrowIfNil(serviceCollection)
    ArgumentError.ThrowIfNotTable(serviceCollection)
    ArgumentError.ThrowIfNotClass(serviceCollection, cls_ServiceCollection)

    ServiceDescriptor.ThrowIfNotImplementation(implementation)

    self.serviceCollection = serviceCollection
    self.implementation = implementation
    self.keys = {}
end

function ServiceCollectionRegistration:to(key)
    ServiceDescriptor.ThrowIfNotKey(key)

    if self.keys[key] ~= nil then
        error("The key '"..tostring(key).."' has already been applied to this implementation")
    end

    self.keys[key] = key

    return self
end

function ServiceCollectionRegistration:as(lifetime)
    ServiceLifetimes.ThrowIfNotValid(lifetime)

    local descriptor = ServiceDescriptor(lifetime, self.keys, self.implementation)

    self.serviceCollection:registerDescriptor(descriptor)
end