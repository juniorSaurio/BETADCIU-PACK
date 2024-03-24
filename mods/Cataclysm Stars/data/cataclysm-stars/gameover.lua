local curGameOver = ''
local gameOverState = 0
local bfGameOver = 'GOD_DEATH'
local music = 'gameover_godfield_loop'
local deathSound = 'gameOverSFXgod'
local substate = 'substates.GameOverSubstate'
local restartSound = 'gameover_godfield_end'

function onCreatePost()
    detectGameOver(true)
end

function detectGameOver(onStart)

    if bfGameOver ~= '' then
            setPropertyFromClass(substate,'characterName',bfGameOver)
    end

    if deathSound ~= '' then
            setPropertyFromClass(substate,'deathSoundName',deathSound)
    end
    
    if restartSound ~= '' then
            setPropertyFromClass(substate,'endSoundName',restartSound)
    end

    if music ~= '' then
            setPropertyFromClass(substate,'loopSoundName',music)
    end
end

