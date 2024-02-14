idle = {'0', '0'}
leftoffsets = {'-537', '187'}
downoffsets = {'45', '-78'}
upoffsets = {'-366', '250'}
rightoffsets = {'-140', '-2'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'bendy_run'
doIdle = true
inAnimation = false

function onCreate()

	precacheImage('characters/Bendy_run_Remastered')

	makeAnimatedLuaSprite(name_of_character, 'characters/Bendy_run_Remastered', 3500, 200);
	addAnimationByPrefix(name_of_character, 'idle', 'Bendy Run instance', 24, true);
	addAnimationByPrefix(name_of_character,'singLEFT','Leftr instance',24, true)
	addAnimationByPrefix(name_of_character,'singDOWN','Dowwn instance',24, true)
	addAnimationByPrefix(name_of_character,'singUP','Upp instance',24, true)
	addAnimationByPrefix(name_of_character,'singRIGHT','Right instance',24, true)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 2.5,2.5);

	addLuaSprite(name_of_character,true)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
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
	if doIdle and not inAnimation then
		if curBeat % 2 == 0 then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idle[1]);
		setProperty(name_of_character .. '.offset.y', idle[2]);
		end
	end
	doIdle = true
end