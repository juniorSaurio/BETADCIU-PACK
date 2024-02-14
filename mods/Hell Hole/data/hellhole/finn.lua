idleoffsets = {'0', '0'}
leftoffsets = {'-50', '-99'}
downoffsets = {'-94', '-307'}
upoffsets = {'-142', '139'}
rightoffsets = {'-364', '3'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'finn_reveal'
doIdle = true

function onCreate()
	precacheImage('characters/finn_reveal')
	precacheImage('backgrounds/finn/BackGlitch')
	makeAnimatedLuaSprite(name_of_character, 'characters/finn_reveal', -1200, 100);
	addAnimationByPrefix(name_of_character, 'idle', 'full-idle0', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','Left-full0',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Down0',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Up0',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Right0',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1,1);

	makeLuaSprite('glitchFinnBG','backgrounds/finn/BackGlitch', -800, -100);
	scaleObject('glitchFinnBG', 1.2,1.2);
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 1631 and curStep <= 1660 then
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

    if curStep == 1632 then
    	addLuaSprite('glitchFinnBG',true)
    	addLuaSprite(name_of_character,true)

        doTweenX(name_of_character.."EnterX", name_of_character, -600, 0.5, "circOut")
        doTweenX("glitchFinnBGEnterX", 'glitchFinnBG', -450, 0.5, "circOut")
    end

    if curStep == 1647 then
    	doTweenX(name_of_character.."LeaveX", name_of_character, -1500, 0.2, "circOut")
    	doTweenX("glitchFinnBGLeaveX", 'glitchFinnBG', -1500, 0.2, "circOut")
    end
end

function onTweenCompleted(tag)

	if tag == name_of_character..'LeaveX' then
		removeLuaSprite(name_of_character,true)
	end

	if tag == 'glitchFinnBGLeaveX' then
		removeLuaSprite('glitchFinnBG',true)
	end
end