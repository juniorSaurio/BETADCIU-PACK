idle = {'0', '0'}
leftoffsets = {'693', '-14'}
downoffsets = {'682', '-25'}
upoffsets = {'516', '-20'}
rightoffsets = {'393', '-3'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'human_black'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/Black_Defeat')

	makeAnimatedLuaSprite(name_of_character, 'characters/Black_Defeat', -800, 250);
	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, true);
	addAnimationByPrefix(name_of_character,'singLEFT','left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 2,2);

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 224 and curStep <= 288 then
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
	if curStep == 217 then
		addLuaSprite('BgBlack',true)
        addLuaSprite(name_of_character,true)
        doTweenX(name_of_character..'moveLeft',name_of_character,200,0.4,'CircInOut')
        doTweenX('BgBlackmoveLeft','BgBlack',-900,0.4,'CircInOut')
    end

    if curStep == 286 then
    	doTweenX(name_of_character..'moveRight',name_of_character,-800,0.4,'CircInOut')
    	doTweenX('BgBlackmoveRight','BgBlack',-3400,0.4,'CircInOut')
    end

    if curStep == 300 then
    	cancelTween(name_of_character..'moveRight')
    	cancelTween('BgBlackmoveRight')
    	removeLuaSprite(name_of_character,true)
    	removeLuaSprite('BgBlack',true)
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