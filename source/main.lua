--core (playdate)
import "CoreLibs/object"
--framework
import "framework/dependency-injection/service-collection"
import "framework/dependency-injection/service-collection-registration"
import "framework/dependency-injection/service-container"
import "framework/dependency-injection/service-container-root"
import "framework/dependency-injection/service-container-scoped"
import "framework/dependency-injection/service-descriptor"
import "framework/dependency-injection/service-lifetimes"
import "framework/logging/log-levels"
import "framework/logging/logger"
import "framework/argument-error"
import "framework/types"
--game/scenes
import "game/scenes/combat-fleets-scene"
import "game/scenes/fleet-scene-list"
import "game/scenes/fleet-scene-ship"
import "game/scenes/formation-scene"
--game
import "game/fleet-service"
import "game/font-service"
import "game/input-service"
import "game/math-service"
import "game/names-service"
import "game/ship-button-factory"
import "game/ship-button"
import "game/ship-classes"
import "game/ship-factory"
import "game/ship"

local services <const> = ServiceCollection()

i_Playdate = "iPlaydate"
i_Graphics = "iGraphics"
i_Display = "iDisplay"
services
    :register(playdate)
    :to(i_Playdate)
    :as(ServiceLifetimes.singleton)
services
    :register(function (container)
        local pd = container:get(i_Playdate)

        return pd.graphics
    end)
    :to(i_Graphics)
    :as(ServiceLifetimes.singleton)
services
    :register(function (container)
        local pd = container:get(i_Playdate)

        return pd.display
    end)
    :to(i_Display)
    :as(ServiceLifetimes.singleton)

i_CombatFleetsScene = "iCombatFleetsScene"
i_FleetSceneList = "iFleetSceneList"
i_FleetSceneShip = "iFleetSceneShip"
i_FormationScene = "iFormationScene"
services
    :register(cls_CombatFleetsScene)
    :to(i_CombatFleetsScene)
    :as(ServiceLifetimes.transient)
services
    :register(cls_FleetSceneList)
    :to(i_FleetSceneList)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_FleetSceneShip)
    :to(i_FleetSceneShip)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_FormationScene)
    :to(i_FormationScene)
    :as(ServiceLifetimes.singleton)

i_FleetService = "iFleetService"
i_FontService = "iFontService"
i_InputService = "iInputService"
i_MathService = "iMathService"
i_NamesService = "iNamesService"
i_ShipButtonFactory = "iShipButtonFactory"
i_ShipButton = "iShipButton"
i_ShipFactory = "iShipFactory"
i_Ship = "iShip"
services
    :register(cls_FleetService)
    :to(i_FleetService)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_FontService)
    :to(i_FontService)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_InputService)
    :to(i_InputService)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_MathService)
    :to(i_MathService)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_NamesService)
    :to(i_NamesService)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_ShipButtonFactory)
    :to(i_ShipButtonFactory)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_ShipButton)
    :to(i_ShipButton)
    :as(ServiceLifetimes.transient)
services
    :register(cls_ShipFactory)
    :to(i_ShipFactory)
    :as(ServiceLifetimes.singleton)
services
    :register(cls_Ship)
    :to(i_Ship)
    :as(ServiceLifetimes.transient)

local container <const> = services:buildContainer()

local fleetSceneList = container:get(i_FleetSceneList)

fleetSceneList:show()

local pd <const> = container:get(i_Playdate)
local gfx <const> = container:get(i_Graphics)

function pd.update()
    gfx.sprite.update()
    fleetSceneList:update()
    --pd.timer.updateTimers()
end
