# Adjust Vehicle Sound

**Adjust Vehicle Sound** ist ein Mod für Farming Simulator, der es dir ermöglicht, die Lautstärke von Fahrzeuggeräuschen individuell anzupassen. Passe die Innen- und Außengeräusche deiner Fahrzeuge an, um ein optimales Spielerlebnis zu erreichen.
Optimal für Leute, die mit Lautsprechern spielen!
## Features

- **Anpassbare Fahrzeuglautstärke**: Reguliere die Lautstärke von Fahrzeuggeräuschen separat für Innen- und Außenansicht.
- **Konsolenbefehl zur Steuerung**: Einfacher Konsolenbefehl, um die Einstellungen neu zu laden.
- **Speicherung der Einstellungen**: Alle Anpassungen werden in einer XML-Datei gespeichert, die beim Start des Spiels geladen wird.

## Verwendung

### Lautstärkeeinstellungen neu laden

Um die Lautstärkeeinstellungen während des Spiels neu zu laden, öffne die Konsole (Standardtaste: `^`) und gib folgenden Befehl ein:

```reloadAdjustVehicleSoundSettings```

### Anpassung der Einstellungen

Die Einstellungen werden in der Datei **AdjustVehicleSoundSettings.xml** gespeichert:
```C:\Users\[Dein Benutzername]\Documents\My Games\FarmingSimulator2022\modSettings\AdjustVehicleSoundSettings.xml```
Du kannst die Werte für **insideVolume** und **outsideVolume** direkt in der XML-Datei anpassen.

### Konfiguration
Die **AdjustVehicleSoundSettings.xml** Datei sieht standardmäßig so aus:
```
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<settings>
    <insideVolume>0.3</insideVolume>
    <outsideVolume>1.0</outsideVolume>
</settings>
```
Passe die Werte nach deinen Wünschen an und speichere die Datei. Nutze den Konsolenbefehl **reloadAdjustVehicleSoundSettings**, um die Änderungen ohne Neustart des Spiels zu übernehmen.

## Bekannte Fehler

- Wenn man das Fahrzeug in der Außenansicht verlässt, bleibt der Sound leise auf der letzten Einstellung. Das Checken für das Aussteigen ist noch nicht implementiert.



## Feedback
Falls du Probleme hast oder Feedback geben möchtest, öffne bitte ein **Issue** oder erstelle einen **Pull-Request** auf GitHub.
