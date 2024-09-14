

function AdjustVehicleSound:isInsideCamera(camera)
    return camera.isInside or (camera.name and (string.find(camera.name, "interior") or string.find(camera.name, "inside")))
end
