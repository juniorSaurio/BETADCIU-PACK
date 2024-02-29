function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'TOGETHERSING' then
			-- setPropertyFromGroup('unspawnNotes', i, 'texture', 'AXENOTES'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.0475); --died
		end
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'TOGETHERSING' then
        if goodNoteHit and direction == 0 then
            triggerEvent('Play Animation', 'singLEFT', 'dad')
        end
        if goodNoteHit and direction == 1 then
            triggerEvent('Play Animation', 'singDOWN', 'dad')
        end
        if goodNoteHit and direction == 2 then
            triggerEvent('Play Animation', 'singUP', 'dad')
        end
        if goodNoteHit and direction == 3 then
            triggerEvent('Play Animation', 'singRIGHT', 'dad')
        end
    end
   
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
 if noteType == 'TOGETHERSING' then
        if opponentNoteHit and direction == 0 then
            triggerEvent('Play Animation', 'singLEFT', 'bf')
        end
        if opponentNoteHit and direction == 1 then
            triggerEvent('Play Animation', 'singDOWN', 'bf')
        end
        if opponentNoteHit and direction == 2 then
            triggerEvent('Play Animation', 'singUP', 'bf')
        end
        if opponentNoteHit and direction == 3 then
            triggerEvent('Play Animation', 'singRIGHT', 'bf')
        end
    end
end

--debugPrint('Script started!')
function onUpdate(elapsed)
    
end