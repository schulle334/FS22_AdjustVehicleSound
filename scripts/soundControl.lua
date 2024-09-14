function AdjustVehicleSound:applyGlobalVehicleVolume(volume)
    if g_soundMixer then
        local volumeFloat = tonumber(volume)
        if volumeFloat and volumeFloat ~= self.lastVolume then
            g_soundMixer:setMasterVolume(volumeFloat)
            self.lastVolume = volumeFloat
            print("Fahrzeuglautstärke auf " .. volumeFloat .. " gesetzt.")
        end
    else
        print("SoundMixer ist nicht verfügbar.")
    end
end

function AdjustVehicleSound:update(dt)
    local vehicle = g_currentMission.controlledVehicle
    if vehicle and vehicle.spec_enterable and vehicle.spec_enterable.cameras then
        local activeCamera = vehicle.spec_enterable.cameras[vehicle.spec_enterable.camIndex]
        local volumeToSet = self:isInsideCamera(activeCamera) and self.insideVolume or self.outsideVolume
        self:applyGlobalVehicleVolume(volumeToSet)
    end
end
