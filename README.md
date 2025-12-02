# ELS-BeamNG.drive

ELS (Emergency Lighting System) Police Mod for BeamNG.drive - Adds functional emergency lighting controls and siren functionality to police vehicle configurations.

## Features

- **Multi-stage lighting** (K key to toggle ELS, J key to cycle stages):
  - Stage 0: All lights off
  - Stage 1: Rear flashers only
  - Stage 2: Front + rear flashers
  - Stage 3: Full lightbar + all flashers

- **Multiple siren tones** (L key to cycle):
  - Wail, Yelp, Priority, Hi-Lo, Phaser

- **Air horn** (H key - hold to activate)

- **Supported Vehicles**:
  - Ibishu Sunburst (police configurations)
  - Gavril Grand Marshal / Fullsize (police configurations)
  - Bruckell Bastion (police configurations)
  - Gavril D-Series / Pickup (police configurations)

## Installation

### Step 1: Locate Your BeamNG User Folder

1. Open BeamNG.drive
2. Go to **Options → System → Open User Folder**
3. Navigate to the `mods` folder inside the User Folder

> ⚠️ **Important**: Do NOT install mods in the Steam installation directory (e.g., `Steam/steamapps/common/BeamNG.drive/`). Always use the User Folder.

> ⚠️ **OneDrive Users**: If your Documents folder is synced with OneDrive, your User Folder path may look like `C:\Users\YourName\OneDrive\Documents\BeamNG.drive\`. Make sure you're installing to the correct location.

### Step 2: Install the Mod

**Option A: Zip file with `els_police_mod/` folder at root**
```
els_police_mod.zip
└── els_police_mod/
    ├── info.json
    ├── lua/
    ├── vehicles/
    └── ...
```
Simply place the entire zip file in your `mods` folder. BeamNG will read it directly.

**Option B: Zip file with files at root (no subfolder)**
```
els_police_mod.zip
├── info.json
├── lua/
├── vehicles/
└── ...
```
This layout also works - place the zip in your `mods` folder.

> ⚠️ **Warning**: Avoid double-nesting! Do NOT create a structure like:
> ```
> els_police_mod.zip
> └── els_police_mod/
>     └── els_police_mod/   ← WRONG!
>         ├── info.json
>         └── ...
> ```

### Step 3: Clear Cache (Important!)

After installing or updating the mod:

1. Open the **BeamNG.drive Launcher**
2. Click **Support Tools**
3. Click **Clear Cache**
4. Launch the game

## How to Use

This mod **patches existing police vehicle configurations** - you won't see separate "ELS" vehicles in the vehicle selector.

1. Spawn a stock police configuration of a supported vehicle:
   - Sunburst Police
   - Grand Marshal Police (vehicle folder: `fullsize`)
   - Bastion Police
   - D-Series Police (vehicle folder: `pickup`)

2. Use the keybinds:
   - **K** - Toggle ELS system on/off
   - **J** - Cycle light stages (0→1→2→3→0)
   - **L** - Cycle siren tones (Off→Wail→Yelp→Priority→Hi-Lo→Phaser→Off)
   - **H** - Air horn (hold to activate)

## Adding Custom Siren Sounds (Optional)

This mod does **not** include audio files. To add your own siren sounds:

1. Create a folder at: `els_police_mod/art/sound/`
2. Add your audio files (WAV or OGG format)
3. The mod supports common LSPDFR filename variants:
   - `WAIL.wav`, `wail.wav`, `Siren_Wail.wav`, `wail.ogg`
   - `YELP.wav`, `yelp.wav`, `Siren_Yelp.wav`, `yelp.ogg`
   - `PRIORITY.wav`, `priority.wav`, `Priority.wav`, `priority.ogg`
   - `HILO.wav`, `hilo.wav`, `HI_LO.wav`, `Hilo.wav`, `hilo.ogg`
   - `PHASER.wav`, `phaser.wav`, `Phaser.wav`, `phaser.ogg`
   - `AIRHORN.wav`, `airhorn.wav`, `Airhorn.wav`, `airhorn.ogg`

## Troubleshooting

### "no file controller/elsController.lua" error
- Make sure you have the latest version of the mod
- Clear the game cache (Launcher → Support Tools → Clear Cache)
- Verify the mod is installed in the correct User Folder location

### "nodesMissing" errors when spawning vehicles
- Update to the latest version of this mod
- Clear the game cache
- The mod should patch existing vehicles, not create new ones

### ELS controls not working
- Press K to enable the ELS system first
- Check that keybinds aren't conflicting with other mods (Options → Controls)

### No siren sounds playing
- Audio files are not included - you must add your own (see "Adding Custom Siren Sounds" above)
- The mod will log "no audio file found" in the console if files are missing

### Vehicle selector shows duplicate/ghost ELS entries
- You may have an old version of the mod installed
- Remove all ELS mod files and reinstall the latest version
- Clear the game cache

## Technical Details

This mod works by using BeamNG's `$+controllers` patch system to inject the ELS controller into existing vehicle definitions. This approach:
- Avoids creating duplicate vehicle entries in the vehicle selector
- Prevents nodesMissing errors from incomplete vehicle definitions
- Maintains compatibility with game updates
- **Note**: The controller is appended via `$+controllers` merge - no separate "ELS" vehicle entries will appear in the vehicle selector

> ⚠️ **Important**: After installing or updating this mod, always **Clear Cache** via the BeamNG Launcher (Support Tools → Clear Cache) to ensure the changes take effect properly.

## License

MIT License - See LICENSE file for details

## Credits

- **Author**: DarkShockGamer
- Built for BeamNG.drive