idle = {'0', '0'}
leftoffsets = {'-9', '0'}
downoffsets = {'20', '40'}
upoffsets = {'-26', '60'}
rightoffsets = {'0', '-3'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'ben_drowned'
doIdle = true
inAnimation = true

function onCreate()

	precacheImage('characters/water_ben')

	makeAnimatedLuaSprite(name_of_character, 'characters/water_ben', 800, 500);
	addAnimationByPrefix(name_of_character, 'idle', 'float idle', 24, false);
	addAnimationByPrefix(name_of_character,'singLEFT','left pose',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','Down pose',24, false)
	addAnimationByPrefix(name_of_character,'singUP','up pose',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','Right pose',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1,1);
	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)



end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 2032 and curStep < 2160 then
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
	if curStep == 1904 then
		inAnimation = false
	end
end