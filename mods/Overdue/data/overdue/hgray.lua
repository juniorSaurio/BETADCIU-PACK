idle = {'0', '0'}
leftoffsets = {'0', '-28'}
downoffsets = {'10', '-89'}
upoffsets = {'-6', '24'}
rightoffsets = {'273', '9'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'hgray'
doIdle = true
inAnimation = true

function onCreate()

	precacheImage('characters/HGrey')

	makeAnimatedLuaSprite(name_of_character, 'characters/HGrey', 1300, 440);
	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','left',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','down',24, false)
	addAnimationByPrefix(name_of_character,'singUP','up',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','right',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 0.9,0.9);
	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)



end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 1844 and curStep < 1904 then
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
	if curStep == 1654 then
		inAnimation = false
	end
end