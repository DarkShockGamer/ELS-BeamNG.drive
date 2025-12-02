# ELS Police Mod (BeamNG.drive)

Features
- ELS sound system:
  - 5 siren tones (Wail, Yelp, Priority, Hi-Lo, Phaser) - cycle with L
  - Air horn replaces normal horn - hold H
  - Toggle ELS system - K
- ELS lights integration:
  - Stage 0: Off
  - Stage 1: Rear flashers
  - Stage 2: Front + rear flashers
  - Stage 3: Full lightbar and flashers
  - Cycle stages - J
- Vehicle configs included:
  - Ibishu Sunburst Police (ELS)
  - Gavril Grand Marshal Police (ELS)
  - Bruckell Bastion Police (ELS)
  - Gavril D-Series Police (ELS)

Install (BeamNG local mods)
1. Copy the `els_police_mod` folder into `Documents/BeamNG.drive/mods/`.
2. Add audio files into `els_police_mod/art/sound/` (see below for details).
3. Start BeamNG -> Mod Manager -> enable "ELS Police Mod".
4. Controls -> Vehicle: bind keys (defaults are set).

Drop-in LSPDFR WAV support
This mod supports **drag-and-drop** of WAV files from LSPDFR siren packs directly into `els_police_mod/art/sound/` — no conversion to OGG or renaming required in most cases.

### Supported filename patterns (case-insensitive)
The mod automatically detects and uses audio files matching these common LSPDFR naming patterns:

| Tone     | Supported filenames                                                |
|----------|--------------------------------------------------------------------|
| Airhorn  | `AIRHORN.wav`, `Airhorn.wav`, `airhorn.wav`, `lspdfr_airhorn.wav`, `airhorn.ogg`, `lspdfr_airhorn.ogg` |
| Wail     | `WAIL.wav`, `Siren_Wail.wav`, `wail.wav`, `lspdfr_wail.wav`, `wail.ogg`, `lspdfr_wail.ogg` |
| Yelp     | `YELP.wav`, `Siren_Yelp.wav`, `yelp.wav`, `lspdfr_yelp.wav`, `yelp.ogg`, `lspdfr_yelp.ogg` |
| Priority | `PRIORITY.wav`, `Priority.wav`, `priority.wav`, `lspdfr_priority.wav`, `priority.ogg`, `lspdfr_priority.ogg` |
| Hi-Lo    | `HILO.wav`, `HI_LO.wav`, `Hilo.wav`, `hilo.wav`, `lspdfr_hilo.wav`, `hilo.ogg`, `lspdfr_hilo.ogg` |
| Phaser   | `PHASER.wav`, `Phaser.wav`, `phaser.wav`, `lspdfr_phaser.wav`, `phaser.ogg`, `lspdfr_phaser.ogg` |

### How to use LSPDFR siren packs
1. Download an LSPDFR siren pack (legally obtained).
2. Locate the WAV files in the siren pack (usually in a `sounds` or similar folder).
3. Copy/drag the WAV files directly into `els_police_mod/art/sound/`.
4. The mod will automatically detect and use the files based on their filenames.

If your siren pack uses different filenames, you can either:
- Rename the files to match one of the supported patterns above
- Convert to OGG and use the `lspdfr_*.ogg` naming convention

Required audio files (fallback naming)
If you prefer to use OGG files or your pack doesn't match the patterns above, place the following `.ogg` files in `els_police_mod/art/sound/`:
- `lspdfr_airhorn.ogg`
- `lspdfr_wail.ogg`
- `lspdfr_yelp.ogg`
- `lspdfr_priority.ogg`
- `lspdfr_hilo.ogg`
- `lspdfr_phaser.ogg`

How to obtain and convert siren sounds
1. **Obtain LSPDFR siren sounds legally:**
   - Visit the official LSPDFR website or community forums (https://www.lcpdfr.com/lspdfr/index/) for siren packs.
   - Use royalty-free or Creative Commons licensed siren sounds from audio libraries.
   - Record your own siren sounds if you have access to emergency vehicles.
   - Ensure you have the right to use any audio files before downloading.

2. **Convert audio to OGG format (optional):**
   - Use free tools like [Audacity](https://www.audacityteam.org/) or [FFmpeg](https://ffmpeg.org/).
   - In Audacity: Open your WAV/MP3 file -> File -> Export -> Export as OGG.
   - Using FFmpeg (command line):
     ```
     ffmpeg -i input.wav -c:a libvorbis -q:a 5 output.ogg
     ffmpeg -i input.mp3 -c:a libvorbis -q:a 5 output.ogg
     ```
   - Recommended quality: `-q:a 5` (good balance of size and quality).

3. **Rename files to match expected names** (if needed) and place them in the `art/sound/` folder.

Default keybinds
- K: Toggle ELS System
- L: Cycle Siren Tone
- H: ELS Air Horn
- J: Cycle ELS Light Stage

Audio licensing
- **This mod does not include any copyrighted audio files.**
- You must provide your own audio files to use the siren functionality.
- Use only audio that you have the legal right to use (purchased, royalty-free, Creative Commons, or self-recorded).
- Do not distribute copyrighted siren packs with this mod.

Troubleshooting
- If sirens don't play: verify your audio files match one of the supported filename patterns listed above, or check `art/sound/els_sounds.sbeam` for the full list of recognized filenames.
- If lights don't toggle: ensure the vehicle variant is the stock police config. If you use custom configs, update the JBEAM prop/electrics names accordingly.
- Use the console to see "[ELS]" logs which will indicate which sound file is being used.

Repository usage
- Commit the entire `els_police_mod` directory to `main`.
- If you want a zip release, compress `els_police_mod` and upload it to Releases.
