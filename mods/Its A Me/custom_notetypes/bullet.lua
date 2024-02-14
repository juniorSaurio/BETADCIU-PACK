function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'BulletMario_NOTE_assets')
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'bullet' then
		playSound('gunshot')

		triggerEvent('Add Camera Zoom', '0.04', '0.02')

		triggerEvent('Play Animation', 'shoot', 'BF') 
		triggerEvent('Play Animation', 'shot', 'Dad') 
		
		cameraShake('camGame', 0.01, 0.2)
	end
end