-- Event notes hooks
function onCreate()
	precacheImage('effects/Phase3Static')

	makeAnimatedLuaSprite('luigiStatic', 'effects/Phase3Static', 0, -1)
	addAnimationByIndices('luigiStatic', 'e', 'Phase3Static instance', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38')
	scaleObject('luigiStatic', 3.3, 3.3)
	setObjectCamera('luigiStatic', 'other')

end

function onEvent(name, value1, value2)
	if name == 'luigi static' then
		addLuaSprite('luigiStatic', false)
		setObjectOrder('luigiStatic',getObjectOrder('lava')+1)
		objectPlayAnimation('luigiStatic', 'e', true)
		runTimer('delay', 1.61)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		removeLuaSprite('luigiStatic', false)
	end
end