function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BOTHSING' then
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.0475);
		end
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'BOTHSING' then
        characterPlayAnim('gf',getProperty('singAnimations['..direction..']'),false)
        setProperty('gf.holdTimer',0)
    end
   
end
function opponentNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'BOTHSING' then
        characterPlayAnim('gf',getProperty('singAnimations['..direction..']'),false)
        setProperty('gf.holdTimer',0)
    end
end