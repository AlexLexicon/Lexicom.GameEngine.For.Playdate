cls_ServiceCollection = "ServiceCollection"
class(cls_ServiceCollection).extends()

function ServiceCollection:init()
    self.keyToDescriptors = {}
end

function ServiceCollection:register(implementation)
    ServiceDescriptor.ThrowIfNotImplementation(implementation)

    return ServiceCollectionRegistration(self, implementation)
end

function ServiceCollection:registerDescriptor(descriptor)
    ArgumentError.ThrowIfNil(descriptor)
    ArgumentError.ThrowIfNotClass(descriptor, cls_ServiceDescriptor)

    local keys = descriptor.keys

    for keyIndex, key in pairs(keys) do
        local descriptorsForKey = self.keyToDescriptors[key]

        if descriptorsForKey == nil then
            descriptorsForKey = {}
        end

        table.insert(descriptorsForKey, descriptor)

        self.keyToDescriptors[key] = descriptorsForKey
    end
end

function ServiceCollection:buildContainer()
    return RootServiceContainer(self.keyToDescriptors)
end
