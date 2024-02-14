

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'fleetway_anim1'

function onCreate()
    precacheImage('characters/fleetway1')
	makeAnimatedLuaSprite(name_of_character, 'characters/fleetway1', 0, 0);
    addAnimationByPrefix(name_of_character, 'anim', 'Fleetway StepItUp', 24, false)
	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 2.2,2.2);
    screenCenter(name_of_character)
    setObjectCamera(name_of_character,'hud')

end

function onUpdate(elapsed)

    if curStep == 3692 then
    	addLuaSprite(name_of_character,false)
    	setProperty(name_of_character..'.alpha',0.5)
        --playAnim(name_of_character,'anim1',false)
    end

    if curStep == 3712 then
        removeLuaSprite(name_of_character)
    end
end