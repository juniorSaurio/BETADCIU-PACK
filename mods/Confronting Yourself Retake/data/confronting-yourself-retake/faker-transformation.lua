

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'faker_transformation'

function onCreate()
    precacheImage('characters/Faker_Transformation')
	makeAnimatedLuaSprite(name_of_character, 'characters/Faker_Transformation', 500, 100);
    addAnimationByPrefix(name_of_character, 'singUP', 'TransformationUP', 24, false)
    addAnimationByPrefix(name_of_character, 'singLEFT', 'TransformationLEFT', 24, false)
    addAnimationByPrefix(name_of_character, 'singDOWN', 'TransformationDOWN', 24, false)
    addAnimationByPrefix(name_of_character, 'singRIGTH', 'TransformationRIGHT', 24, false)

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 1,1);
    setObjectCamera(name_of_character, 'hud');
end

function onUpdate(elapsed)

    if curStep == 2560 then
    	addLuaSprite(name_of_character,true)
        playAnim(name_of_character,'singLEFT',false)
        doTweenAlpha(name_of_character .. 'FadeIn',name_of_character,0.7,0.3,'linear')
    end

    if curStep == 2568 then
        playAnim(name_of_character,'singUP',false)
    end

    if curStep == 2576 then
        playAnim(name_of_character,'singDOWN',false)
    end

    if curStep == 2584 then
        playAnim(name_of_character,'singRIGTH',false)
    end

    if curStep == 2592 then
        removeLuaSprite(name_of_character)
    end
end