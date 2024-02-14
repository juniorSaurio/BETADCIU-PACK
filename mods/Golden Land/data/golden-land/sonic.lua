idle = {'0', '0'}
leftoffsets = {'141', '-46'}
downoffsets = {'152', '-75'}
upoffsets = {'-14', '-26'}
rightoffsets = {'60', '-5'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'sonic'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/VS_Infinite_Sonic_Assets')

	makeAnimatedLuaSprite(name_of_character, 'characters/VS_Infinite_Sonic_Assets', 1100, -200);
	addAnimationByPrefix(name_of_character, 'idle', 'Sonic_IdleDance', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','Sonic_SingLEFT instance',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Sonic_SingDOWN instance',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Sonic_SingUP instance',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Sonic_SingRIGHT instance',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1.2,1.2);

	addLuaSprite(name_of_character,false)
	setProperty(name_of_character..'.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 543 and curStep <= 576 then
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
    		setObjectOrder(name_of_character,getObjectOrder('BgMickey') + 1)
    		setProperty(name_of_character..'.visible',true)
    end

    if curStep == 575 then
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