cls_FleetService = "FleetService";
class(cls_FleetService).extends()

function FleetService:init(container)
    self.ships = {}

    local shipFactory = container:get(i_ShipFactory)

    self.ships[1] = shipFactory:create(ShipClasses.destroyer)
    self.ships[2] = shipFactory:create(ShipClasses.destroyer)
    self.ships[3] = shipFactory:create(ShipClasses.destroyer)
    self.ships[4] = shipFactory:create(ShipClasses.destroyer)
    self.ships[5] = shipFactory:create(ShipClasses.destroyer)
end

function FleetService:getShips()
    return self.ships
end