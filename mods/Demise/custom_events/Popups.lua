
function onCreate()
	precacheImage('popups/Binary')
    precacheImage('popups/Error')
    precacheImage('popups/Unauthorized')
    precacheImage('popups/Unknown')
    precacheImage('popups/Unspecified')
end


function onEvent(name, value1, value2)
	if name == "Popups" then

		local nameFile = 'Unknown';
		local x = 600
		local y = 600

		if value1 == '1' then
			nameFile = 'Binary'
			x = 500
			y = 0
		end

		if value1 == '2' then
			nameFile = 'Error'
			x = 0
			y = 400
		end

		if value1 == '3' then
			nameFile = 'Unauthorized'
			x = 600
			y = 200
		end

		if value1 == '4' then
			nameFile = 'Unspecified'
			x = -300
			y = -150
		end

		makeAnimatedLuaSprite(nameFile, 'popups/'..nameFile, 0,0)
		scaleObject(nameFile,1.5,1.5)
		screenCenter(nameFile)
		setProperty(nameFile..'.antialiasing', true)
		addAnimationByPrefix(nameFile, 'idle', 'PopupAnim', 48, false)
		objectPlayAnimation(nameFile,'idle',false)
		addLuaSprite(nameFile,false)

		playSound('select',2)
		runTimer('wait'..nameFile, 3);

		setProperty(nameFile..'.x',x)
		setProperty(nameFile..'.y',y)

	end
end

function onTimerCompleted(tag, loops, loopsleft)

	if tag == ('waitUnknown') then
		doTweenAlpha('byebyeUnknown', 'Unknown' , 0, 0.3, 'linear');
	end

	if tag == ('waitError') then
		doTweenAlpha('byebyeError', 'Error' , 0, 0.3, 'linear');
	end

	if tag == ('waitBinary') then
		doTweenAlpha('byebyeBinary', 'Binary' , 0, 0.3, 'linear');
	end

	if tag == ('waitUnauthorized') then
		doTweenAlpha('byebyeUnauthorized', 'Unauthorized' , 0, 0.3, 'linear');
	end

	if tag == ('waitUnspecified') then
		doTweenAlpha('byebyeUnspecified', 'Unspecified' , 0, 0.3, 'linear');
	end

end

function onTweenCompleted(tag)
	if tag == ('byebyeUnknown') then
		removeLuaSprite('Unknown', true);
	end

	if tag == ('byebyeError') then
		removeLuaSprite('Error', true);
	end

	if tag == ('byebyeBinary') then
		removeLuaSprite('Binary', true);
	end

	if tag == ('byebyeUnauthorized') then
		removeLuaSprite('Unauthorized', true);
	end

	if tag == ('byebyeUnspecified') then
		removeLuaSprite('Unspecified', true);
	end
end