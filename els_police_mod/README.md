# ELS Police Mod (BeamNG.drive)

Features
- ELS sound system:
  - 5 siren tones (Wail, Yelp, Priority, Hi-Lo, Phaser) — cycle with L
  - Air horn replaces normal horn — hold H
  - Toggle ELS system — K
- ELS lights integration:
  - Stage 0: Off
  - Stage 1: Rear flashers
  - Stage 2: Front + rear flashers
  - Stage 3: Full lightbar and flashers
  - Cycle stages — J
- Vehicle configs included:
  - Ibishu Sunburst Police (ELS)
  - Gavril Grand Marshal Police (ELS)
  - Bruckell Bastion Police (ELS)
  - Gavril D-Series Police (ELS)

Install (BeamNG local mods)
1. Copy the `els_police_mod` folder into `Documents/BeamNG.drive/mods/`.
2. Add audio files into `els_police_mod/art/sound`:
   - `els_airhorn.ogg`
   - `els_siren_wail.ogg`
   - `els_siren_yelp.ogg`
   - `els_siren_priority.ogg`
   - `els_siren_hilo.ogg`
   - `els_siren_phaser.ogg`
3. Start BeamNG → Mod Manager → enable “ELS Police Mod”.
4. Controls → Vehicle: bind keys (defaults are set).

Default keybinds
- K: Toggle ELS System
- L: Cycle Siren Tone
- H: ELS Air Horn
- J: Cycle ELS Light Stage

Audio licensing
- Provide your own or use free-to-use audio. Do not include copyrighted siren packs.

Troubleshooting
- If sirens don’t play: verify your .ogg files match names in `art/sound/els_sounds.sbeam`.
- If lights don’t toggle: ensure the vehicle variant is the stock police config. If you use custom configs, update the JBEAM prop/electrics names accordingly.
- Use the console to see “[ELS]” logs.

Repository usage
- Commit the entire `els_police_mod` directory to `main`.
- If you want a zip release, compress `els_police_mod` and upload it to Releases.