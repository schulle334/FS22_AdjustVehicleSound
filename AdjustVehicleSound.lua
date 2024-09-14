AdjustVehicleSound = {}
g_adjustVehicleSound = AdjustVehicleSound 
AdjustVehicleSound.insideVolume = 1.0
AdjustVehicleSound.outsideVolume = 0.5
AdjustVehicleSound.lastVolume = nil


local modDirectory = g_currentModDirectory or ""
source(Utils.getFilename("scripts/cameraCheck.lua", modDirectory))
source(Utils.getFilename("scripts/soundControl.lua", modDirectory))

function AdjustVehicleSound:loadMap(name)
    print("AdjustVehicleSound Mod geladen")
    self:loadSettings()
    -- Registriere Konsolenbefehl zum Neuladen der Einstellungen
    addConsoleCommand("reloadAdjustVehicleSoundSettings", "Lädt die Lautstärke-Einstellungen neu", "reloadSettings", self)
end

function AdjustVehicleSound:loadSettings()
    local settingsPath = getUserProfileAppPath() .. "modSettings/AdjustVehicleSoundSettings.xml"
    
    if not fileExists(settingsPath) then
        -- Erstelle AdjustVehicleSoundSettings.xml mit Standardwerten
        self:saveSettings()
        print("AdjustVehicleSoundSettings.xml wurde erstellt mit Standardwerten im modSettings-Verzeichnis.")
    else
        local xmlFile = loadXMLFile("SettingsXML", settingsPath)
        if xmlFile then
            self.insideVolume = Utils.getNoNil(getXMLFloat(xmlFile, "settings.insideVolume"), 0.3)
            self.outsideVolume = Utils.getNoNil(getXMLFloat(xmlFile, "settings.outsideVolume"), 1.0)
            delete(xmlFile)
            print("Einstellungen aus AdjustVehicleSoundSettings.xml geladen: Innenlautstärke = " .. self.insideVolume .. ", Außenlautstärke = " .. self.outsideVolume)
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

addModEventListener(AdjustVehicleSound)
