-- Script made by NotSoDevy. Your freely allowed to use it. Credit is optional but recommended.

-- getModSetting('theSaveName', 'modFolderNameOfYourMod')

-- setting_Countdown: Gets the mod setting from the mod's 'data/settings.json' file.
-- prefixString: Adds a prefix. Can be useful for checking different variations of the same song.
-- defaultSound: Checks if the character will use the common countdown sounds.
-- repeatSound: If enabled, the 3, 2, and 1 sounds will use the same sound (aka the 'main.ogg' file).

local setting_Countdown = getModSetting('uniqueCountSound', 'Unique Countdown Sounds Example')
local prefixString = ''
local defaultSound = false
local repeatSound = false

-- Check if the mod setting is enabled or disabled, then run the function.
function onCreate()
    if setting_Countdown then
        customCountdownSetup()
    else
        fnfCountdownSetup()
    end
end

-- Use the customCountdownSetup function to modify the prefix string or enable default countdown sounds.
function customCountdownSetup()
        if dadName == 'senpai' or dadName == 'senpai-angry' or dadName == 'spirit' then
        repeatSound = true
    elseif dadName == 'dad' then
        prefixString = ''
    elseif dadName == 'tankman' and songName == 'Ugh'then
        prefixString = '-ugh'
    elseif dadName == 'tankman' and songName == 'Guns'then
        prefixString = '-gun'
    else -- If the above doesn't meet the requirements, enable default sounds.
        defaultSound = true
    end
end

function fnfCountdownSetup()
-- Always enable defaultSound.
    defaultSound = true

-- This code checks if the stage is a pixel stage.
     if curStage == 'school' or curStage == 'schoolEvil' then
        prefixString = '-fnf_pixel'
    else
        prefixString = '-fnf'
    end
end

-- "Watch what happens when I cast a spell I don't remember"
function onCountdownTick(counter)
 if not defaultSound and not repeatSound then -- USE CUSTOM COUNTDOWN SOUNDS
    if counter == 0 then -- 3
    playSound('countdown_sounds/'..dadName..'/3'..prefixString)
    elseif counter == 1 then -- 2
    playSound('countdown_sounds/'..dadName..'/2'..prefixString)
    elseif counter == 2 then -- 1
    playSound('countdown_sounds/'..dadName..'/1'..prefixString)
    elseif counter == 3 then -- GO!
    playSound('countdown_sounds/'..dadName..'/go'..prefixString)
    end
elseif defaultSound and not repeatSound then -- OTHERWISE, USE THE COMMON COUNTDOWN SOUNDS
    if counter == 0 then -- 3
    playSound('countdown_sounds/common/3'..prefixString)
    elseif counter == 1 then -- 2
    playSound('countdown_sounds/common/2'..prefixString)
    elseif counter == 2 then -- 1
    playSound('countdown_sounds/common/1'..prefixString)
    elseif counter == 3 then -- GO!
    playSound('countdown_sounds/common/go'..prefixString)
    end
elseif repeatSound and not defaultSound then -- IF REPEATSOUND IS ENABLED USE THE MAIN.OGG FILE
    if counter == 0 or counter == 1 or counter == 2 then
    playSound('countdown_sounds/'..dadName..'/main'..prefixString)
    elseif counter == 3 then -- GO!
    playSound('countdown_sounds/'..dadName..'/go'..prefixString)
    end
 end
end