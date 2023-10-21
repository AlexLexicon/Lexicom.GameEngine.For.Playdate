cls_FleetSceneShip = "FleetSceneShip"
class(cls_FleetSceneShip).extends()

function FleetSceneShip:init(container)
    self.dis = container:get(i_Display)
    self.gfx = container:get(i_Graphics)

    self.fleetService = container:get(i_FleetService)
end

function FleetSceneShip:show()
    local screenWidth = self.dis.getWidth()
    local screenHeight = self.dis.getHeight()

    local ships = self.fleetService:getShips()

end