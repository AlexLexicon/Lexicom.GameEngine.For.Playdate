cls_RootServiceContainer = "RootServiceContainer"
class(cls_RootServiceContainer).extends(ServiceContainer)

function RootServiceContainer:init(descriptorsLists)
    RootServiceContainer.super.init(self, descriptorsLists)

    self.managedSingletonInstances = {}
end

function RootServiceContainer:createScopedContainer()
    return ScopedServiceContainer(self, self.descriptorsLists)
end

function RootServiceContainer:_getSingleton(descriptor)
    return self:_initalizeSinglular(self.managedSingletonInstances, descriptor)
end