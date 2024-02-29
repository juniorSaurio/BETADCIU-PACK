idle = {'0', '0'}
leftoffsets = {'80', '10'}
downoffsets = {'0', '0'}
upoffsets = {'67', '72'}
rightoffsets = {'0', '0'}
laugh = {'-20','-6'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'sonic_exe'
doIdle = true
inAnimation = true

function onCreate()

	precacheImage('characters/exe')

	makeAnimatedLuaSprite(name_of_character, 'characters/exe', -1500, -100);
	addAnimationByPrefix(name_of_character, 'idle', 'exe Idle', 24, true);
	addAnimationByPrefix(name_of_character,'singLEFT','exe Left',24, true)
	addAnimationByPrefix(name_of_character,'singDOWN','exe Down',24, true)
	addAnimationByPrefix(name_of_character,'singUP','exe Up',24, true)
	addAnimationByPrefix(name_of_character,'singRIGHT','exe Right',24, true)
	addAnimationByPrefix(name_of_character,'laugh','exe Laugh',48, true)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 0.9,0.9);
	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 2580 and curStep <= 2691 then
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

function onUpdate(elapsed)
	if curStep == 2302 then
		inAnimation = false
	end

	if curStep == 2692 then
		inAnimation = true;
		objectPlayAnimation(name_of_character,'laugh',false)
		setProperty(name_of_character .. '.offset.x', laugh[1]);
		setProperty(name_of_character .. '.offset.y', laugh[2]);
	end

	if (curStep > 2692 and curStep <= 2712) and curStep %2 == 0 then
		objectPlayAnimation(name_of_character,'laugh',false)
	end

	if curStep == 2714 then
		
		inAnimation = false
	end
end