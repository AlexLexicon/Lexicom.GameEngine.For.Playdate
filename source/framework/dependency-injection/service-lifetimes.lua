ServiceLifetimes = {}
ServiceLifetimes.singleton = 0
ServiceLifetimes.transient = 1
ServiceLifetimes.scoped = 2

function ServiceLifetimes.isServiceLifetime(argument)
    return argument == ServiceLifetimes.singleton or argument == ServiceLifetimes.transient or ServiceLifetimes.scoped
end

function ServiceLifetimes.ThrowIfNotValid(argument)
    ArgumentError.ThrowIfNil(argument)
    ArgumentError.ThrowIfNotNumber(argument)
    if ServiceLifetimes.isServiceLifetime(argument) == false then
        error("The argument '"..tostring(argument).."' was not '"..tostring(ServiceLifetimes.singleton).."' nor '"..tostring(ServiceLifetimes.transient).."' nor '"..tostring(ServiceLifetimes.scoped).."'.")
    end
end