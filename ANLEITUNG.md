# Finance – Installation als eigene App

Einmalige Einrichtung, ca. 30–45 Minuten. Alles kostenlos.

## 1 · Daten aus dem Artifact sichern
Finance (Artifact) → Einstellungen → Daten & Backup → **Backup erstellen**. Die JSON-Datei aufbewahren.

## 2 · Supabase (Datenbank für den Sync)
1. supabase.com → kostenloses Konto erstellen → **New project**
   - Name: `finance` · Region: möglichst nahe (z. B. Zürich oder Frankfurt) · Datenbank-Passwort generieren und sicher ablegen
2. Links **SQL Editor** → Inhalt der Datei `supabase-setup.sql` einfügen → **Run**
3. **Project Settings → API**: *Project URL* und *Publishable key* (oder *anon public key*) kopieren
4. **Authentication → URL Configuration**: *Site URL* auf deine GitHub-Adresse aus Schritt 3 setzen (z. B. `https://NAME.github.io/finance/`)

## 3 · GitHub Pages (Hosting der App)
1. github.com → kostenloses Konto → **New repository** → Name `finance`, *Public* → Create
2. **uploading an existing file** → den gesamten Inhalt dieses Ordners hineinziehen (inkl. Ordner `icons` und `vendor`) → **Commit changes**
3. **Settings → Pages** → Source: *Deploy from a branch* → Branch `main`, Ordner `/ (root)` → Save
4. Nach 1–2 Minuten ist die App erreichbar unter `https://NAME.github.io/finance/`

Hinweis: Im Repository liegt nur der App-Code. Deine Finanzdaten liegen ausschliesslich in deiner Supabase-Datenbank und auf deinen Geräten.

## 4 · iPhone
1. Adresse in **Safari** öffnen → Teilen → **Zum Home-Bildschirm**
2. Finance öffnen → Einstellungen → **Sync & Sicherheit** → URL, Key, E-Mail, Passwort → **Konto erstellen**
3. Bestätigungslink in der E-Mail öffnen → zurück in die App → **Anmelden**
4. Einstellungen → Daten & Backup → **Backup importieren** (Datei aus Schritt 1)
5. Optional: **Mit Face ID sperren** einschalten

## 5 · MacBook
Adresse in Safari öffnen → Ablage → **Zum Dock hinzufügen** → mit demselben Konto anmelden. Die Daten erscheinen automatisch.

## Updates
Neue Version von Claude erhalten → im GitHub-Repository die geänderten Dateien hochladen (gleiche Namen, ersetzen) → beim nächsten Öffnen ist die App aktuell. Deine Daten bleiben unverändert.

## Gut zu wissen
- Offline erfasste Einträge werden automatisch übertragen, sobald wieder Internet da ist.
- Supabase pausiert Gratis-Projekte nach 7 Tagen ohne Nutzung. Die Daten bleiben erhalten; im Supabase-Dashboard mit «Restore» wieder aktivieren.
- Regelmässig ein Backup erstellen (Einstellungen → Daten & Backup).
