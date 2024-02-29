idle = {'0', '0'}
leftoffsets = {'115', '454'}
downoffsets = {'-15', '-352'}
upoffsets = {'91', '796'}
rightoffsets = {'-64', '-307'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'mx'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/MX_v2_NEW_Assets')

	makeAnimatedLuaSprite(name_of_character, 'characters/MX_v2_NEW_Assets', -825, -500);
	addAnimationByPrefix(name_of_character, 'idle', 'MXIdle', 24, true);
	addAnimationByPrefix(name_of_character,'singLEFT','MXLeft',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','MXDown',24, false)
	addAnimationByPrefix(name_of_character,'singUP','MXUp',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','MXRight',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1.1,1.1);
	addLuaSprite(name_of_character,false)
	objectPlayAnimation(name_of_character, 'idle');
	setProperty(name_of_character .. '.offset.x', idle[1]);
	setProperty(name_of_character .. '.offset.y', idle[2]);
	setProperty(name_of_character.. '.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 303 and curStep <= 376 then
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