local duration = 0;
local stopShake = true

function onCreate()
	precacheImage('jumpscare/Wigglytuff_jumpscare')
	precacheSound('WigglyTuffJumpscare')
end

function onEvent(name, value1, value2)
	if name == "amusiaScream" then   
		makeLuaSprite('image2', 'jumpscare/Wigglytuff_jumpscare', 0, 0)
		scaleObject('image2', 0.4, 0.4)
		screenCenter('image2','xy')
        addLuaSprite('image2', false);
        setObjectCamera('image2', 'hud');
		setObjectOrder('image2', 1)
		setProperty('camGame.visible',false)
		runTimer('terminated', value1);
		duration = value1;
	    stopShake = false
	    playSound('WigglyTuffJumpscare',0.8,'amusiaScare')
	end
end


function onStepHit()
	if stopShake == false then
		cameraShake('hud', 0.0115, 0.5)
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'terminated' then
		doTweenAlpha('adiosJumpscare', 'image2', 0, 0.1, 'linear');
		setProperty('camGame.visible',true)
		setProperty('camHUD.visible',true)
		stopShake = true
		stopSound('amusiaScare')
	end
end

function onTweenCompleted(tag)
	if tag == 'adiosJumpscare' then
		removeLuaSprite('image2', true);
		cameraShake('other', 0,0)
	end
end