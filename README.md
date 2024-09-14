Adjust Vehicle Sound
Adjust Vehicle Sound ist ein Mod für Farming Simulator, der es dir ermöglicht, die Lautstärke von Fahrzeuggeräuschen individuell anzupassen. Passe die Innen- und Außengeräusche deiner Fahrzeuge an, um ein optimales Spielerlebnis zu erreichen.

Features
Anpassbare Fahrzeuglautstärke: Reguliere die Lautstärke von Fahrzeuggeräuschen separat für Innen- und Außenansicht.
Konsolenbefehl zur Steuerung: Einfacher Konsolenbefehl, um die Einstellungen neu zu laden.
Speicherung der Einstellungen: Alle Anpassungen werden in einer XML-Datei gespeichert, die beim Start des Spiels geladen wird.
Leichte Installation und Konfiguration: Einfache Installation durch Kopieren in den Mods-Ordner.
Installation
Download: Lade den Mod von der Releases-Seite herunter.
Installation:
Entpacke den Mod-Ordner, falls notwendig.
Verschiebe den entpackten Ordner in deinen Mods-Ordner von Farming Simulator:
makefile
Code kopieren
C:\Users\[Dein Benutzername]\Documents\My Games\FarmingSimulator2022\mods
Aktivierung:
Starte das Spiel und aktiviere den Mod im Mod-Menü.
Verwendung
Lautstärkeeinstellungen neu laden
Um die Lautstärkeeinstellungen während des Spiels neu zu laden, öffne die Konsole (Standardtaste: ^) und gib folgenden Befehl ein:

plaintext
Code kopieren
reloadAdjustVehicleSoundSettings
Anpassung der Einstellungen
Die Einstellungen werden in der Datei AdjustVehicleSoundSettings.xml gespeichert:
makefile
Code kopieren
C:\Users\[Dein Benutzername]\Documents\My Games\FarmingSimulator2022\modSettings\AdjustVehicleSoundSettings.xml
Du kannst die Werte für insideVolume und outsideVolume direkt in der XML-Datei anpassen.
Konfiguration
Die AdjustVehicleSoundSettings.xml Datei sieht standardmäßig so aus:

xml
Code kopieren
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<settings>
    <insideVolume>0.3</insideVolume>
    <outsideVolume>1.0</outsideVolume>
</settings>
Passe die Werte nach deinen Wünschen an und speichere die Datei. Nutze den Konsolenbefehl reloadAdjustVehicleSoundSettings, um die Änderungen ohne Neustart des Spiels zu übernehmen.

Unterstützung und Feedback
Falls du Probleme hast oder Feedback geben möchtest, öffne bitte ein Issue oder erstelle einen Pull-Request auf GitHub.

Lizenz
Dieser Mod ist unter der MIT-Lizenz veröffentlicht. Siehe die LICENSE Datei für weitere Informationen.
