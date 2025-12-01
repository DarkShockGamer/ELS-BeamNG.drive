-- ELS Controller for BeamNG.drive
-- Handles ELS lights, sirens, and airhorn functionality

local M = {}
M.name = "elsController"

-- ELS State
local elsEnabled = false
local currentLightStage = 0  -- 0=Off, 1=Rear, 2=Front+Rear, 3=Full
local currentSirenIndex = 0  -- 0=Off, 1=Wail, 2=Yelp, 3=Priority, 4=Hi-Lo, 5=Phaser
local airhornActive = false

-- Siren names for cycling
local sirenTones = {
  "off",
  "els_siren_wail",
  "els_siren_yelp",
  "els_siren_priority",
  "els_siren_hilo",
  "els_siren_phaser"
}

-- Sound object references
local currentSirenSound = nil
local airhornSound = nil

-- Logging helper
local function log(msg)
  print("[ELS] " .. tostring(msg))
end

-- Update electrics based on current stage
local function updateElectrics()
  local electrics = electrics or {}
  
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

-- Stop current siren
local function stopSiren()
  if currentSirenSound then
    obj:stopSound(currentSirenSound)
    currentSirenSound = nil
  end
end

-- Play siren by index
local function playSiren(index)
  stopSiren()
  if index > 0 and index <= #sirenTones then
    local soundName = sirenTones[index]
    if soundName ~= "off" then
      currentSirenSound = obj:playSound(soundName, 1, 1, true)
      log("Siren: " .. soundName)
    end
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

-- Cycle through siren tones
local function cycleSirenTone()
  if not elsEnabled then
    log("ELS System is OFF - enable it first")
    return
  end
  
  currentSirenIndex = (currentSirenIndex % #sirenTones) + 1
  if currentSirenIndex == 1 then
    currentSirenIndex = 0  -- Skip "off" in cycle, go to 0 (off)
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

-- Activate airhorn
local function activateAirhorn()
  if not airhornActive then
    airhornActive = true
    airhornSound = obj:playSound("els_airhorn", 1, 1, false)
    log("Airhorn: ON")
  end
end

-- Deactivate airhorn
local function deactivateAirhorn()
  if airhornActive then
    airhornActive = false
    if airhornSound then
      obj:stopSound(airhornSound)
      airhornSound = nil
    end
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
end

-- Reset on vehicle reset
function M.onReset()
  M.init()
  updateElectrics()
end

return M
