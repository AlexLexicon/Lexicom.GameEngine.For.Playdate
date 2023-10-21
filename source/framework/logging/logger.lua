cls_Logger = "Logger"
class(cls_Logger).extends()

function Logger:init()
    self.logLevels = LogLevels()
    self:setMinimumLogLevel(self.logLevels.information)
end

function Logger:setMinimumLogLevel(logLevel)
    LogLevels.ThrowIfNotValid(logLevel)

    self.minimumLogLevel = logLevel
end

function Logger:logDebug(message)
    self:log(self.logLevels.debug, message)
end

function Logger:logInformation(message)
    self:log(self.logLevels.information, message)
end

function Logger:logWarning(message)
    self:log(self.logLevels.warning, message)
end

function Logger:logError(message)
    self:log(self.logLevels.error, message)
end

function Logger:logCritical(message)
    self:log(self.logLevels.critical, message)
end

function Logger:log(loglevel, message)
    LogLevels.ThrowIfNotValid(loglevel)

    if self.minimumLogLevel >= loglevel then
        if types.isTable(message) then
            printTable(message)
        else
            print(tostring(message))
        end
    end
end