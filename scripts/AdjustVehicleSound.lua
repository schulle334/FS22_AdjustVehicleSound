AdjustVehicleSound = {}
g_adjustVehicleSound = AdjustVehicleSound
AdjustVehicleSound.insideVolume = 1.0
AdjustVehicleSound.outsideVolume = 0.5
AdjustVehicleSound.exitVolume = 1.0  
AdjustVehicleSound.lastVolume = nil


function AdjustVehicleSound:isInsideCamera(camera)
    return camera.isInside or (camera.name and (string.find(camera.name, "interior") or string.find(camera.name, "inside")))
end

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


function AdjustVehicleSound:loadSettings()
    local settingsPath = getUserProfileAppPath() .. "modSettings/AdjustVehicleSoundSettings.xml"

    if not fileExists(settingsPath) then
        self:saveSettings()
        print("AdjustVehicleSoundSettings.xml wurde erstellt mit Standardwerten im modSettings-Verzeichnis.")
    else
        local xmlFile = loadXMLFile("SettingsXML", settingsPath)
        if xmlFile then
            self.insideVolume = Utils.getNoNil(getXMLFloat(xmlFile, "settings.insideVolume"), 1.0)
            self.outsideVolume = Utils.getNoNil(getXMLFloat(xmlFile, "settings.outsideVolume"), 0.5)
            self.exitVolume = Utils.getNoNil(getXMLFloat(xmlFile, "settings.exitVolume"), 1.0)  -- Laden von exitVolume
            delete(xmlFile)
            print("Einstellungen aus AdjustVehicleSoundSettings.xml geladen: Innenlautstärke = " .. self.insideVolume .. ", Außenlautstärke = " .. self.outsideVolume .. ", Exitlautstärke = " .. self.exitVolume)
        else
            print("Fehler beim Laden der AdjustVehicleSoundSettings.xml.")
        end
    end
end

function AdjustVehicleSound:saveSettings()
    local settingsPath = getUserProfileAppPath() .. "modSettings/AdjustVehicleSoundSettings.xml"
    local xmlFile = createXMLFile("SettingsXML", settingsPath, "settings")

    if xmlFile then
        setXMLFloat(xmlFile, "settings.insideVolume", self.insideVolume)
        setXMLFloat(xmlFile, "settings.outsideVolume", self.outsideVolume)
        setXMLFloat(xmlFile, "settings.exitVolume", self.exitVolume)  
        saveXMLFile(xmlFile)
        delete(xmlFile)
        print("Einstellungen in AdjustVehicleSoundSettings.xml gespeichert.")
    else
        print("Fehler beim Speichern der Einstellungen in AdjustVehicleSoundSettings.xml.")
    end
end


function AdjustVehicleSound:reloadSettings()
    print("Lade die Lautstärke-Einstellungen neu...")
    self:loadSettings()
    print("Lautstärke-Einstellungen erfolgreich neu geladen.")
end


function AdjustVehicleSound:update(dt)
    local vehicle = g_currentMission.controlledVehicle
    if vehicle and vehicle.spec_enterable and vehicle.spec_enterable.cameras then
        local activeCamera = vehicle.spec_enterable.cameras[vehicle.spec_enterable.camIndex]
        local volumeToSet = self:isInsideCamera(activeCamera) and self.insideVolume or self.outsideVolume
        self:applyGlobalVehicleVolume(volumeToSet)
    else

        self:applyGlobalVehicleVolume(self.exitVolume)
    end
end


function AdjustVehicleSound:loadMap(name)
    print("AdjustVehicleSound Mod geladen")
    self:loadSettings()

    addConsoleCommand("reloadAdjustVehicleSoundSettings", "Lädt die Lautstärke-Einstellungen neu", "reloadSettings", self)
end

addModEventListener(AdjustVehicleSound)
