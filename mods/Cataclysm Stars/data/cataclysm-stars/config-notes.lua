local enableFunNotes = true;

local godNote = 0
local godReset = 0

local pathNotesGod = 'notes/note_god'
local boxSizeNoteSpamX1 = -900
local boxSizeNoteSpamX2 = 900
local boxSizeNoteSpamY1 = -1000
local boxSizeNoteSpamY2 = -200

local scale = 3;

function onCreatePost()
	for i = 0, 3 do
		setPropertyFromGroup('strumLineNotes', i, 'visible', false)
		noteTweenAlpha(i+0, i, 0, 0.01)
	end
end

function onCountdownStarted()
	runHaxeCode([[
		for (note in game.unspawnNotes) 
		{
			if (note.mustPress) {
				note.cameras = [game.camOther];
				note.scrollFactor.set(1, 1);
			}
		};
	]])
end

function opponentNoteHit(index, dir, noteType, isSustain)
	if enableFunNotes then
		if not isSustain then
			makeLuaSprite('godNote'..godNote, pathNotesGod ..''.. dir, getRandomInt(boxSizeNoteSpamX1, boxSizeNoteSpamX2), getRandomInt(boxSizeNoteSpamY1, boxSizeNoteSpamY2))
			addLuaSprite('godNote'..godNote, false);
			setObjectOrder('godNote'..godNote, getObjectOrder('dadGroup')+1)
			setProperty('godNote'..godNote..'.angle', getRandomInt(-360, 360))
			scaleObject('godNote'..godNote, scale + (getRandomInt(0, 100)/50), scale + (getRandomInt(0, 100)/50))
			doTweenAngle('noteAss'..godNote, 'godNote'..godNote, getRandomInt(-360, 360), 1, 'circOut')
			doTweenX('noteGrass'..godNote, 'godNote'..godNote..'.scale', 1 + (getRandomInt(0, 50)/100), 1, 'circOut')
			doTweenY('noteBrass'..godNote, 'godNote'..godNote..'.scale', 1 + (getRandomInt(0, 50)/100), 1, 'circOut')
			doTweenAlpha('notePass'..godNote, 'godNote'..godNote, 0, 1)
			godNote = godNote + 1
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'notePass'..godReset then
		removeLuaSprite('godNote'..godReset)
		godReset = godReset + 1
	end
end

function onEvent(name,v1,v2)
    if name == 'Triggers All Stars' then

        if v1 == '3' then
           if v2 == '1' then
				enableFunNotes = false;
				for i = 0, 3 do
					setPropertyFromGroup('strumLineNotes', i, 'visible', true)
					noteTweenAlpha(i+0, i, 1, 0.01)
				end
		   end
        end

		if v1 == '4' then
			if v2 == '1' then
				 enableFunNotes = true;
				 for i = 0, 3 do
					 setPropertyFromGroup('strumLineNotes', i, 'visible', false)
					 noteTweenAlpha(i+0, i, 0, 0.01)

					 runHaxeCode([[
						for (note in game.unspawnNotes) 
						{
							if (note.mustPress) {
								note.cameras = [game.camOther];
								note.scrollFactor.set(1, 1);
							}
						};
					]])
				 end

				boxSizeNoteSpamY1 = -800
				boxSizeNoteSpamY2 = 0
			end
			
			if v2  == '7' then
				boxSizeNoteSpamY1 = -600
				boxSizeNoteSpamY2 = -100

				boxSizeNoteSpamX1 = -600
				boxSizeNoteSpamX2 = 600

				scale = 2;
			end
		 end
	end
end