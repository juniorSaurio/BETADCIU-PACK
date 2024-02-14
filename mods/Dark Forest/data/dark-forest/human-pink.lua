idle = {'0', '0'}
leftoffsets = {'103', '-77'}
downoffsets = {'82', '-77'}
upoffsets = {'-207', '97'}
rightoffsets = {'-13', '-19'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'human_pink'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/Pretender remaster')

	makeAnimatedLuaSprite(name_of_character, 'characters/Pretender remaster', 2000, 500);
	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 2.5,2.5);

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
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
	if curStep == 218 then
		addLuaSprite('BgPink',true)
        addLuaSprite(name_of_character,true)
        doTweenX(name_of_character..'moveRight',name_of_character,1000,0.4,'CircInOut')
        doTweenX('BgPinkmoveRight','BgPink',-900,0.4,'CircInOut')
    end

    if curStep == 286 then
    	doTweenX(name_of_character..'moveLeft',name_of_character,2000,0.4,'CircInOut')
    	doTweenX('BgPinkmoveLeft','BgPink',1600,0.4,'CircInOut')
    end

    if curStep == 300 then
    	cancelTween(name_of_character..'moveLeft')
    	cancelTween('BgPinkmoveLeft')
    	removeLuaSprite(name_of_character,true)
    	removeLuaSprite('BgPink',true)
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