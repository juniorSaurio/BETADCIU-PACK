idle = {'0', '0'}
leftoffsets = {'100', '-33'}
downoffsets = {'120', '-113'}
upoffsets = {'-31', '95'}
rightoffsets = {'14', '-58'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'bfb3'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/b3boyfriend')

	makeAnimatedLuaSprite(name_of_character, 'characters/b3boyfriend', 900, -4300);
	addAnimationByPrefix(name_of_character, 'idle', '1anim', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','2anim',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','5anim',24, false)
	addAnimationByPrefix(name_of_character,'singUP','4anim',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','3anim',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1.1,1.1);

	addLuaSprite(name_of_character,false)
	setProperty(name_of_character..'.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 351 and curStep <= 384 then
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