cls_ScopedServiceContainer = "ScopedServiceContainer"
class(cls_ScopedServiceContainer).extends(ServiceContainer)

function ScopedServiceContainer:init(rootServiceContainer, descriptorsLists)
    ScopedServiceContainer.super.init(self, descriptorsLists)

    self.rootServiceContainer = rootServiceContainer
end

function ScopedServiceContainer:createScopedContainer()
    return self.rootServiceContainer:createScopedContainer()
end

function ScopedServiceContainer:_getSingleton(descriptor)
    return self.rootServiceContainer:_getSingleton(descriptor)
 end