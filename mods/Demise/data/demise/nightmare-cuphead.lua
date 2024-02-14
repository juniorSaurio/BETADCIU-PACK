idle = {'0', '0'}
leftoffsets = {'0', '-82'}
downoffsets = {'115', '-45'}
upoffsets = {'-47', '177'}
rightoffsets = {'304', '-16'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'nigthmare-cuphead'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/Nightmare_Cuphead')

	makeAnimatedLuaSprite(name_of_character, 'characters/Nightmare_Cuphead', -300, 350);
	addAnimationByPrefix(name_of_character, 'idle', 'Idle instance', 24, true);
	addAnimationByPrefix(name_of_character,'singLEFT','Left instance',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Down  instance',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Up instance',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Right instance',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 1.5,1.5);

	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 1152 and curStep <= 1215 then
		doIdle = false
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