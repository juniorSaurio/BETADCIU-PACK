idle = {'0', '0'}
leftoffsets = {'26', '-22'}
downoffsets = {'22', '-21'}
upoffsets = {'7', '24'}
rightoffsets = {'0', '0'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'yuri'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/Doki_Yuri_Assets')

	makeAnimatedLuaSprite(name_of_character, 'characters/Doki_Yuri_Assets', 740, -250);
	addAnimationByPrefix(name_of_character, 'idle', 'Yuri Idle0', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','Yuri Sing Note Left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Yuri Sing Note Down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Yuri Sing Note Up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Yuri Sing Note Right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 1,1);

	addLuaSprite(name_of_character,false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 315 and curStep <= 416 then
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

function onUpdate(elapsed)
    if curStep == 432 then
    	removeLuaSprite(name_of_character,true)
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