-- ELS Controller for BeamNG.drive
-- Handles ELS lights, sirens, and airhorn functionality

local M = {}
M.name = "elsController"

-- ELS State
local elsEnabled = false
local currentLightStage = 0  -- 0=Off, 1=Rear, 2=Front+Rear, 3=Full
local currentSirenIndex = 0  -- 0=Off, 1=Wail, 2=Yelp, 3=Priority, 4=Hi-Lo, 5=Phaser
local airhornActive = false

-- Prioritized sound definition IDs per tone (tries each until one plays)
-- Covers common LSPDFR WAV filenames with OGG fallbacks
local sirenTones = {
  { -- Wail
    ids = {
      "wail_WAIL_wav",
      "wail_Siren_Wail_wav",
      "wail_wail_wav",
      "wail_lspdfr_wav",
      "wail_ogg",
      "lspdfr_wail"
    },
    name = "Wail"
  },
  { -- Yelp
    ids = {
      "yelp_YELP_wav",
      "yelp_Siren_Yelp_wav",
      "yelp_yelp_wav",
      "yelp_lspdfr_wav",
      "yelp_ogg",
      "lspdfr_yelp"
    },
    name = "Yelp"
  },
  { -- Priority
    ids = {
      "priority_PRIORITY_wav",
      "priority_Priority_wav",
      "priority_priority_wav",
      "priority_lspdfr_wav",
      "priority_ogg",
      "lspdfr_priority"
    },
    name = "Priority"
  },
  { -- Hi-Lo
    ids = {
      "hilo_HILO_wav",
      "hilo_HI_LO_wav",
      "hilo_Hilo_wav",
      "hilo_hilo_wav",
      "hilo_lspdfr_wav",
      "hilo_ogg",
      "lspdfr_hilo"
    },
    name = "Hi-Lo"
  },
  { -- Phaser
    ids = {
      "phaser_PHASER_wav",
      "phaser_Phaser_wav",
      "phaser_phaser_wav",
      "phaser_lspdfr_wav",
      "phaser_ogg",
      "lspdfr_phaser"
    },
    name = "Phaser"
  }
}

-- Prioritized airhorn sound definition IDs
local airhornIds = {
  "airhorn_AIRHORN_wav",
  "airhorn_Airhorn_wav",
  "airhorn_airhorn_wav",
  "airhorn_lspdfr_wav",
  "airhorn_ogg",
  "lspdfr_airhorn"
}

-- Sound object references
local currentSirenSound = nil
local currentSirenToneIds = nil  -- Track which tone's IDs are currently playing
local airhornSound = nil
local airhornPlayedId = nil  -- Track which airhorn ID was played

-- Logging helper
local function log(msg)
  print("[ELS] " .. tostring(msg))
end

-- Update electrics based on current stage
local function updateElectrics()
  -- Stage 0: Off
  if currentLightStage == 0 or not elsEnabled then
    electrics.values.els_rear = 0
    electrics.values.els_front = 0
    electrics.values.els_lightbar = 0
  -- Stage 1: Rear flashers only
  elseif currentLightStage == 1 then
    electrics.values.els_rear = 1
    electrics.values.els_front = 0
    electrics.values.els_lightbar = 0
  -- Stage 2: Front + rear flashers
  elseif currentLightStage == 2 then
    electrics.values.els_rear = 1
    electrics.values.els_front = 1
    electrics.values.els_lightbar = 0
  -- Stage 3: Full lightbar and flashers
  elseif currentLightStage == 3 then
    electrics.values.els_rear = 1
    electrics.values.els_front = 1
    electrics.values.els_lightbar = 1
  end
  
  log("Light stage: " .. currentLightStage)
end

-- Stop current siren (resilient: stops all variants for the current tone)
local function stopSiren()
  if currentSirenSound then
    pcall(function() obj:stopSound(currentSirenSound) end)
    currentSirenSound = nil
  end
  -- Resilient stop: try to stop all variant IDs for the current tone
  if currentSirenToneIds then
    for _, soundId in ipairs(currentSirenToneIds) do
      pcall(function() obj:stopSound(soundId) end)
    end
    currentSirenToneIds = nil
  end
end

-- Play siren by index (1-5 for the 5 siren tones)
-- Tries each sound definition ID in priority order until one plays
local function playSiren(index)
  stopSiren()
  if index > 0 and index <= #sirenTones then
    local tone = sirenTones[index]
    currentSirenToneIds = tone.ids
    for _, soundId in ipairs(tone.ids) do
      local sound = obj:playSound(soundId, 1, 1, true)
      if sound then
        currentSirenSound = sound
        log("Siren: " .. tone.name .. " (using " .. soundId .. ")")
        return
      end
    end
    log("Siren: " .. tone.name .. " - no audio file found")
  end
end

-- Toggle ELS system
local function toggleElsSystem()
  elsEnabled = not elsEnabled
  log("ELS System: " .. (elsEnabled and "ON" or "OFF"))
  
  if not elsEnabled then
    currentLightStage = 0
    stopSiren()
    currentSirenIndex = 0
  end
  
  updateElectrics()
end

-- Cycle through siren tones (0=Off, 1=Wail, 2=Yelp, 3=Priority, 4=Hi-Lo, 5=Phaser)
local function cycleSirenTone()
  if not elsEnabled then
    log("ELS System is OFF - enable it first")
    return
  end
  
  -- Cycle: 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 0
  currentSirenIndex = (currentSirenIndex + 1) % (#sirenTones + 1)
  if currentSirenIndex == 0 then
    stopSiren()
    log("Siren: OFF")
  else
    playSiren(currentSirenIndex)
  end
end

-- Cycle through light stages
local function cycleElsStage()
  if not elsEnabled then
    log("ELS System is OFF - enable it first")
    return
  end
  
  currentLightStage = (currentLightStage + 1) % 4
  updateElectrics()
end

-- Activate airhorn (tries each sound definition ID in priority order)
local function activateAirhorn()
  if not airhornActive then
    airhornActive = true
    for _, soundId in ipairs(airhornIds) do
      local sound = obj:playSound(soundId, 1, 1, false)
      if sound then
        airhornSound = sound
        airhornPlayedId = soundId
        log("Airhorn: ON (using " .. soundId .. ")")
        return
      end
    end
    log("Airhorn: ON - no audio file found")
  end
end

-- Deactivate airhorn (resilient: stops all variants)
local function deactivateAirhorn()
  if airhornActive then
    airhornActive = false
    if airhornSound then
      pcall(function() obj:stopSound(airhornSound) end)
      airhornSound = nil
    end
    -- Resilient stop: try to stop all airhorn variant IDs
    for _, soundId in ipairs(airhornIds) do
      pcall(function() obj:stopSound(soundId) end)
    end
    airhornPlayedId = nil
    log("Airhorn: OFF")
  end
end

-- Input callbacks
function M.onToggleElsSystem(value)
  if value > 0.5 then
    toggleElsSystem()
  end
end

function M.onCycleSirenTone(value)
  if value > 0.5 then
    cycleSirenTone()
  end
end

function M.onAirhorn(value)
  if value > 0.5 then
    activateAirhorn()
  else
    deactivateAirhorn()
  end
end

function M.onCycleElsStage(value)
  if value > 0.5 then
    cycleElsStage()
  end
end

-- Get current ELS state (for UI or other controllers)
function M.getElsState()
  return {
    enabled = elsEnabled,
    lightStage = currentLightStage,
    sirenIndex = currentSirenIndex,
    airhornActive = airhornActive
  }
end

-- Initialize
function M.init()
  log("ELS Controller initialized")
  elsEnabled = false
  currentLightStage = 0
  currentSirenIndex = 0
  airhornActive = false
  currentSirenSound = nil
  currentSirenToneIds = nil
  airhornSound = nil
  airhornPlayedId = nil
end

-- Reset on vehicle reset
function M.onReset()
  M.init()
  updateElectrics()
end

return M
