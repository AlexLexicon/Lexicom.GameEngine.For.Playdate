LogLevels = {}
LogLevels.debug = 0
LogLevels.information = 1
LogLevels.warning = 2
LogLevels.error = 3
LogLevels.critical = 4

function LogLevels.isLogLevel(argument)
    return argument == LogLevels.singleton or argument == LogLevels.transient
end

function LogLevels.ThrowIfNotValid(argument)
    if LogLevels.isLogLevel(argument) == false then
        error("The argument '"..tostring(argument).."' was not '"..tostring(LogLevels.debug).."' nor '"..tostring(LogLevels.information).."' nor '"..tostring(LogLevels.warning).."' nor '"..tostring(LogLevels.error).."' nor '"..tostring(LogLevels.critical).."'.")
    end
end