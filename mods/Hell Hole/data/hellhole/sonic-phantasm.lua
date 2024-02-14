idleoffsets = {'0', '0'}
leftoffsets = {'8', '3'}
downoffsets = {'0', '0'}
upoffsets = {'-30', '-9'}
rightoffsets = {'-29', '-1'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'sonic-phantasm'
doIdle = true

function onCreate()
	precacheImage('characters/sonic fw')
	makeAnimatedLuaSprite(name_of_character, 'characters/sonic fw', 400, 800);
	addAnimationByPrefix(name_of_character, 'idle', 'Sonic idle', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','Sonic left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Sonic down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Sonic up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Sonic right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1,1);

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 623 and curStep <= 655 then
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
	-- triggered 4 times per section	
	if doIdle then
		if curBeat % 2 == 0 then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', danceleftoffsets[1]);
		setProperty(name_of_character .. '.offset.y', danceleftoffsets[2]);
		end
	end
	doIdle = true
end

function onUpdate(elapsed)

    if curStep == 620 then
    	addLuaSprite(name_of_character,true)
        doTweenY("SonicEnterY", name_of_character, 650, 0.8, "circOut")
    end

    if curStep == 655 then
        removeLuaSprite(name_of_character)
    end
end
