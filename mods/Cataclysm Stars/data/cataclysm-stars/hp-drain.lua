local hpLoss = 0.01
local minHP = 0.4
local unFair = true
local activated = true

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if activated == true then
        if getProperty('health') > minHP then
            if unFair == true then
                setProperty('health',getProperty('health')-hpLoss)
            end
            if unFair == false then
                if isSustainNote == false then
                    setProperty('health',getProperty('health')-hpLoss)
                end
            end
        end
    end
end
