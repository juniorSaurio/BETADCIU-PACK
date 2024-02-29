idle = {'-120', '20'}
leftoffsets = {'-100', '24'}
downoffsets = {'-111', '-23'}
upoffsets = {'-96', '71'}
rightoffsets = {'-10', '30'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'alien'
doIdle = true
inAnimation = true

function onCreate()

	precacheImage('characters/Alien_assets')

	makeAnimatedLuaSprite(name_of_character, 'characters/Alien_assets', 1800, 670);
	addAnimationByIndices(name_of_character, 'idle', 'alienwalkcycle','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', 60);
	addAnimationByPrefix(name_of_character,'singLEFT','alienwalkcycleLEFT',24, false)
	addAnimationByPrefix(name_of_character,'singDOWN','alienwalkcycleDOWN',24, false)
	addAnimationByPrefix(name_of_character,'singUP','alienwalkcycleUP',24, false)
	addAnimationByPrefix(name_of_character,'singRIGHT','alienwalkcycleRIGHT',24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1,1);
	addLuaSprite(name_of_character,true)
	setProperty(name_of_character..'.visible',false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 2560 then
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
	if curStep == 2528 then
		inAnimation = false
	end
end