# ??? Orakel – Die drei ??? Folgen-Orakel für Kumiki

Ein schlankes Lua-Widget (Schema 2) für den **Kumiki Deskbuddy**, das dir auf Knopfdruck deinen heutigen *spezialgelagerten Sonderfall* aus den regulären Folgen **1 bis 240** von *Die drei ???* auswählt – inklusive Erscheinungsjahr und kurzem Klappentext.

## Features

* **240 reguläre Folgen:** Alle Episoden von *001 – und der Super-Papagei* bis *240 – und die schwarze Rose* als schlanke Einzel-JSONs.
* **Ära-Auswahl direkt am Display:** Wechsle per Touchbutton zwischen `Alle (1-240)`, `Klassiker (1-50)`, `Folge 51-150` und `Folge 151-240`.
* **Automatische Lesbarkeit:** Der `Auto`-Modus wählt automatisch die passende Schriftgröße und kürzt lange Klappentexte sauber am Wortende (`...`), damit jeder Fall auf eine Seite passt.
* **System-Theme & Stimmung:** Unterstützt das helle und dunkle Kumiki-Displaydesign (`"theme": "system"`) und setzt Kumikis Gesicht beim Ziehen einer neuen Folge kurz auf `neugierig` (ab Firmware 0.15.0).

## Installation

1. Lade die aktuelle Widget-ZIP aus den [Releases](../../releases) herunter.
2. Öffne die lokale Weboberfläche deines Kumiki im Browser und lade die ZIP im Bereich **Widgets** hoch.
3. **Wichtig – Netzwerkzugriff freigeben:**
   * Gehe auf der Kumiki-Weboberfläche zu **Widgets → Einstellungen → ??? Orakel**.
   * Erlaube dort den HTTPS-Zugriff auf **`raw.githubusercontent.com`** (ohne diese Freigabe können keine Folgen geladen werden).
4. Aktiviere das Widget – fertig!

## Bedienung & Einstellungen

* **Button 1 (`Neue Folge`):** Zieht eine zufällige Folge aus der aktuell gewählten Ära.
* **Button 2 (`Ära`):** Schaltet direkt am Display durch die vier Epochen.
* **Einstellungen (Weboberfläche):**
  * `Schriftgröße`: `Auto` (Standard), `Klein`, `Mittel` oder `Groß`
  * `GitHub Repo`: Standardmäßig `R3adyPlay3r0ne/DDForakel` (kann bei eigenen Forks angepasst werden)

## Datenquelle

Die Episoden-Metadaten (Titel, Erscheinungsjahr und Klappentexte) basieren auf dem Community-Projekt [dreimetadaten.de](https://dreimetadaten.de/) und wurden für das Kumiki-Display aufbereitet.
