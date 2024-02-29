idle = {'0', '0'}
leftoffsets = {'51', '-24'}
downoffsets = {'82', '-63'}
upoffsets = {'80', '136'}
rightoffsets = {'-55', '56'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'wario'
doIdle = true
inAnimation = true

function onCreate()

	precacheImage('characters/W4R_Assets_New')
	precacheImage('backgrounds/act2/act2_pipes_waryosh')

	makeLuaSprite('PipeW','backgrounds/act2/act2_pipes_waryosh',-1400,500)
	addLuaSprite('PipeW',true)
	setProperty('PipeW.visible',false)

	makeAnimatedLuaSprite(name_of_character, 'characters/W4R_Assets_New', -1050, 1000);
	addAnimationByPrefix(name_of_character, 'idle', 'w4r idle', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','w4r left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','w4r down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','w4r up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','w4r right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1,1);
	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 1200 and curStep <= 1264 then
		doIdle = false
		inAnimation = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], true);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		end
	end
end

function onBeatHit()
	if doIdle and not inAnimation then
		if curBeat % 2 == 0 then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idle[1]);
		setProperty(name_of_character .. '.offset.y', idle[2]);
		end
	end
	doIdle = true
end