function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BOTHSING' then
			-- setPropertyFromGroup('unspawnNotes', i, 'texture', 'AXENOTES'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.0475); --died
		end
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'BOTHSING' then
        characterPlayAnim('gf',getProperty('singAnimations['..direction..']'),false)
    end
   
end
function opponentNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'BOTHSING' then
        characterPlayAnim('gf',getProperty('singAnimations['..direction..']'),false)
    end
end

function onUpdate(elapsed)
    if getProperty('gf.animation.curAnim.name') == 'singLEFT' and getProperty('gf.animation.curAnim.finished') then
        characterPlayAnim('gf','idle',true)
    end
    if getProperty('gf.animation.curAnim.name') == 'singRIGHT' and getProperty('gf.animation.curAnim.finished') then
        characterPlayAnim('gf','idle',true)
    end
    if getProperty('gf.animation.curAnim.name') == 'singUP' and getProperty('gf.animation.curAnim.finished') then
        characterPlayAnim('gf','idle',true)
    end
    if getProperty('gf.animation.curAnim.name') == 'singDOWN' and getProperty('gf.animation.curAnim.finished') then
        characterPlayAnim('gf','idle',true)
    end
end