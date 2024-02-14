

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'bh_transformation'

function onCreate()
    precacheImage('characters/itsmorbintime')
	makeAnimatedLuaSprite(name_of_character, 'characters/itsmorbintime', -400, -100);
    addAnimationByPrefix(name_of_character, 'anim', 'itsmorbintime part', 24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1.3,1.3);
    setObjectCamera(name_of_character, 'hud');
end

function onUpdate(elapsed)

    if curStep == 2558 then
    	addLuaSprite(name_of_character,true)
        setProperty(name_of_character..'.alpha',0)
    end

    if curStep == 2560 then
        setProperty(name_of_character..'.alpha',1)
    end

    if curStep == 2592 then
        removeLuaSprite(name_of_character)
    end
end