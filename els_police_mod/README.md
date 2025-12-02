# ELS Police Mod (BeamNG.drive)

## Features
- **ELS sound system:**
  - 5 siren tones (Wail, Yelp, Priority, Hi-Lo, Phaser) - cycle with L
  - Air horn - hold H
  - Toggle ELS system - K
- **ELS lights integration:**
  - Stage 0: Off
  - Stage 1: Rear flashers
  - Stage 2: Front + rear flashers
  - Stage 3: Full lightbar and flashers
  - Cycle stages - J
- **Supported vehicles** (patches existing police configs):
  - Ibishu Sunburst (sunburst)
  - Gavril Grand Marshal (fullsize)
  - Bruckell Bastion (bastion)
  - Gavril D-Series (pickup)

## Installation

### Step 1: Locate Your BeamNG User Folder

1. Open BeamNG.drive
2. Go to **Options → System → Open User Folder**
3. Navigate to the `mods` folder inside the User Folder

> ⚠️ **Important**: Do NOT install mods in the Steam installation directory. Always use the User Folder.

> ⚠️ **OneDrive Users**: If your Documents folder syncs to OneDrive, your User Folder path may be in your OneDrive directory.

### Step 2: Install the Mod

Place the `els_police_mod` folder (or the zip containing it) into your `mods` folder.

**Valid zip layouts:**
```
els_police_mod.zip
└── els_police_mod/
    ├── info.json
    └── ...
```
or:
```
els_police_mod.zip
├── info.json
└── ...
```

> ⚠️ **Warning**: Avoid double-nesting (e.g., `els_police_mod/els_police_mod/`)!

### Step 3: Clear Cache (Important!)

After installing or updating:
1. Open **BeamNG.drive Launcher**
2. Click **Support Tools**
3. Click **Clear Cache**
4. Launch the game

## How to Use

This mod **patches existing police vehicle configurations** - you won't see separate "ELS" vehicles.

1. Spawn a stock police configuration:
   - Sunburst Police
   - Grand Marshal Police
   - Bastion Police
   - D-Series Police

2. Use keybinds:
   - **K** - Toggle ELS system on/off
   - **J** - Cycle light stages
   - **L** - Cycle siren tones
   - **H** - Air horn (hold)

## Adding Custom Siren Sounds

This mod does **not** include audio files. Add your own to `art/sound/`:

### Supported filename patterns (case-insensitive)

| Tone     | Supported filenames                                                |
|----------|--------------------------------------------------------------------|
| Airhorn  | `AIRHORN.wav`, `Airhorn.wav`, `airhorn.wav`, `lspdfr_airhorn.wav`, `airhorn.ogg`, `lspdfr_airhorn.ogg` |
| Wail     | `WAIL.wav`, `Siren_Wail.wav`, `wail.wav`, `lspdfr_wail.wav`, `wail.ogg`, `lspdfr_wail.ogg` |
| Yelp     | `YELP.wav`, `Siren_Yelp.wav`, `yelp.wav`, `lspdfr_yelp.wav`, `yelp.ogg`, `lspdfr_yelp.ogg` |
| Priority | `PRIORITY.wav`, `Priority.wav`, `priority.wav`, `lspdfr_priority.wav`, `priority.ogg`, `lspdfr_priority.ogg` |
| Hi-Lo    | `HILO.wav`, `HI_LO.wav`, `Hilo.wav`, `hilo.wav`, `lspdfr_hilo.wav`, `hilo.ogg`, `lspdfr_hilo.ogg` |
| Phaser   | `PHASER.wav`, `Phaser.wav`, `phaser.wav`, `lspdfr_phaser.wav`, `phaser.ogg`, `lspdfr_phaser.ogg` |

### Using LSPDFR Siren Packs
1. Download an LSPDFR siren pack (legally obtained)
2. Copy the WAV files directly into `els_police_mod/art/sound/`
3. The mod will automatically detect files based on filename patterns

If files don't match patterns above, rename them or convert to OGG using `lspdfr_*.ogg` naming.

## Default Keybinds
- **K**: Toggle ELS System
- **L**: Cycle Siren Tone
- **H**: ELS Air Horn
- **J**: Cycle ELS Light Stage

## Troubleshooting

### "no file controller/elsController.lua" error
- Update to the latest version
- Clear the game cache (Launcher → Support Tools → Clear Cache)

### "nodesMissing" errors when spawning
- Update to the latest version (older versions had incompatible vehicle definitions)
- Clear the game cache

### Ghost/duplicate ELS vehicles in selector
- Remove old mod version and reinstall
- Clear the game cache

### Sirens don't play
- Audio files are not included - add your own (see above)
- Check console for "[ELS]" logs indicating which files are detected

### Controls not working
- Press K to enable ELS first
- Check for keybind conflicts in Options → Controls

## Audio Licensing
- **This mod does not include any copyrighted audio files.**
- You must provide your own audio files.
- Use only legally obtained audio (purchased, royalty-free, Creative Commons, or self-recorded).

## Technical Notes

This mod uses BeamNG's `$+controllers` patch system to inject the ELS controller into existing vehicle definitions, avoiding duplicate vehicle entries and nodesMissing errors.
