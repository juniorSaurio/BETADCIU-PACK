idleoffsets = {'0', '0'}
leftoffsets = {'-3', '-13'}
downoffsets = {'-4', '-60'}
upoffsets = {'10', '31'}
rightoffsets = {'24', '9'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'tabi'
doIdle = true

function onCreate()
	precacheImage('backgrounds/tabi/tabi_stage')
	precacheImage('characters/tabi')
	makeAnimatedLuaSprite(name_of_character, 'characters/tabi', 600, 800);
	addAnimationByPrefix(name_of_character, 'idle', 'Dad idle dance', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','Dad Sing Note LEFT',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Dad Sing Note DOWN',24, false)
	addAnimationByPrefix(name_of_character,'singUP','Dad Sing Note UP',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Dad Sing Note RIGHT',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 0.5,0.5);

	makeLuaSprite('tabiBG','backgrounds/tabi/tabi_stage',400,800);
	scaleObject('tabiBG',0.3,0.3)

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 495 and curStep <= 526 then
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

    if curStep == 494 then
    	addLuaSprite('tabiBG',true)
    	addLuaSprite(name_of_character,true)

        doTweenX("TabiEnterX", name_of_character, 350, 0.8, "circOut")
        doTweenY("TabiEnterY", name_of_character, 300, 0.8, "circOut")
        doTweenX("TabiBGEnterX", 'tabiBG', 100, 0.8, "circOut")
        doTweenY("TabiBGEnterY", 'tabiBG', 400, 0.8, "circOut")
    end

    if curStep == 526 then
    	doTweenX("TabiLeaveX", name_of_character, 600, 0.8, "circOut")
        doTweenY("TabiLeaveY", name_of_character, 800, 0.8, "circOut")
        doTweenX("TabibgLeaveX", 'tabiBG', 400, 0.8, "circOut")
        doTweenY("TabibgLeaveY", 'tabiBG', 800, 0.8, "circOut")
    end
end

function onTweenCompleted(tag)

	if tag == 'TabiLeaveX' then
		removeLuaSprite(name_of_character,true)
		removeLuaSprite('tabiBG',true)
	end
end