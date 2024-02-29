--!!! DON'T PUT THESE NOTES ON THE RIGHT ARROW IN THE CHART EDITOR !!!

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'missile' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'BulletBillMario_NOTE_assets')
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'blockHit', true)
			if downscroll then
				setPropertyFromGroup('unspawnNotes', i, 'flipY', true)
				setPropertyFromGroup('unspawnNotes', i, 'offset.y', 700)
			end
		end
	end

	missileDamage = 0
end

local tagA = 0
local tagB = 0

missileDrain = 0
missileDamage = 0

function onUpdatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'missile' then
			setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') - 50)
			if getPropertyFromGroup('notes', i, 'y') >= defaultPlayerStrumY1-50 and getPropertyFromGroup('notes', i, 'y') <= defaultPlayerStrumY1+50 then
				playSound('SHbullethit', 1)
				makeAnimatedLuaSprite('explosion'..tagA, 'BulletBillMario_NOTE_assets', getPropertyFromGroup('notes', i, 'x') - 180, getPropertyFromGroup('notes', i, 'y') - 210)
				addAnimationByPrefix('explosion'..tagA, 'explosion', 'notesplash', 24, false)
				setObjectCamera('explosion'..tagA, 'hud')
				setObjectOrder('explosion'..tagA, getObjectOrder('strumLineNotes') + 52)
				scaleObject('explosion'..tagA, 0.7, 0.7)
				addLuaSprite('explosion'..tagA, true)
				tagA = tagA + 1
				removeFromGroup('notes', i, true)
			end
		end
	end

	for i = tagB, tagA do
		if getProperty('explosion'..i..'.animation.curAnim.finished') then
			removeLuaSprite('explosion'..i, true)
			tagB = tagB + 1
		end
	end
end