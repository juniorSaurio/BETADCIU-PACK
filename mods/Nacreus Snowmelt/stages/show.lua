local frontY = 400;
local enableTween = false;

function onCreate()

	if not lowQuality then

		makeLuaSprite('sky', 'stage2/sky', -1250, -700);
		setScrollFactor('sky', 0.1, 0.1);
		scaleObject('sky', 1, 1);

		makeLuaSprite('farbuildings', 'stage2/farbuildings', -479, -189);
		setScrollFactor('farbuildings', 1, 1);
		scaleObject('farbuildings', 1, 1);

		makeLuaSprite('buildings', 'stage2/buildings', -420, -200);
		setScrollFactor('buildings', 1, 1);
		scaleObject('buildings', 1, 1);
	
		makeAnimatedLuaSprite('lights', 'stage2/lights', -700, -200)
		addAnimationByPrefix('lights', 'stage2/lights', 'bglights idle', 2, true);
		setScrollFactor('lights', 0.8, 0.8);

		makeLuaSprite('stage', 'stage2/stage', -479, -189);
		setScrollFactor('stage', 1, 1);
		scaleObject('stage', 1, 1);

		makeAnimatedLuaSprite('speaker_left', 'stage2/speaker_left', 130, 500)
		addAnimationByPrefix('speaker_left', 'stage2/speaker_left', 'speaker 200', 20, true);
		setScrollFactor('speaker_left', 1, 1);

		makeAnimatedLuaSprite('speaker_right', 'stage2/speaker_right', 2250, 450)
		addAnimationByPrefix('speaker_right', 'stage2/speaker_right', 'speaker 100', 20, true);
		setScrollFactor('speaker_right', 1, 1);

		makeAnimatedLuaSprite('speakerleft', 'stage2/speakerleft', 492, 680)
		addAnimationByPrefix('speakerleft', 'stage2/speakerleft', 'speaker00', 20, true);
		setScrollFactor('speakerleft', 1, 1);
		scaleObject('speakerleft', 0.7, 0.7);

		makeAnimatedLuaSprite('speakerright', 'stage2/speakerright', 2000, 700)
		addAnimationByPrefix('speakerright', 'stage2/speakerright', 'speakerr 100', 20, true);
		setScrollFactor('speakerright', 1, 1);
		scaleObject('speakerright', 0.7, 0.7);

		makeLuaSprite('frontcrowd', 'stage2/frontcrowd', -479, 600);
		makeLuaSprite('backcrowd', 'stage2/backcrowd', -479, 600);

		addLuaSprite('sky', false);
		addLuaSprite('farbuildings', false);
		addLuaSprite('buildings', false);
		addLuaSprite('lights', false);
		addLuaSprite('backcrowd', false);
		addLuaSprite('stage', false);
		addLuaSprite('speaker_left', false);
		addLuaSprite('speaker_right', false);
		addLuaSprite('speakerright', false);
		addLuaSprite('speakerleft', false);
		addLuaSprite('frontcrowd', true);

	else
		makeLuaSprite('optstage', 'optstage', -200, -100);
		setScrollFactor('optstage', 1, 1);
		scaleObject('optstage', 2.5, 2.5);
	
		makeLuaSprite('eff1', 'eff1', -154, -52);
		setScrollFactor('eff1', 1, 1);
		scaleObject('eff1', 0.1, 0.1);
	
		makeLuaSprite('eff2', 'eff2', -154, -52);
		setScrollFactor('eff2', 1, 1);
		scaleObject('eff2', 0.1, 0.1);
	
		makeLuaSprite('eff3', 'eff3', -154, -52);
		setScrollFactor('eff3', 1, 1);
		scaleObject('eff3', 0.1, 0.1);

		addLuaSprite('eff1', false);
		addLuaSprite('eff2', false);
		addLuaSprite('eff3', false);
		addLuaSprite('optstage', false);
	end

end

function onTweenCompleted(tag)

	if enableTween then
		if tag == 'moveUpFront' then
			doTweenY('moveBottomFront','frontcrowd',-200, 0.7,'cubeOut');
			doTweenY('moveBottomBack','backcrowd',-200, 0.7,'cubeOut');
		end
	
		if tag == 'moveBottomFront' then
			doTweenY('moveUpFront','frontcrowd',-240, 0.1,'cubeOut');
			doTweenY('moveUpBack','backcrowd',-240, 0.1,'cubeOut');
		end
	end
end

function onEvent(n,v1,v2)
	if n == 'publicTween' then

		if v1 == 'on' then
			enableTween = true;
			doTweenY('moveUpFront','frontcrowd',-240, 0.7,'cubeOut');
			doTweenY('moveUpBack','backcrowd',-240, 0.1,'cubeOut');
		end

		if v1 == 'off' then
			enableTween = false;
			cancelTween('moveUpFront')
			cancelTween('moveUpBack')
			cancelTween('moveBottomFront')
			cancelTween('moveBottomBack')

			doTweenY('moveBottomFrontOff','frontcrowd',600, 0.7,'cubeOut');
			doTweenY('moveBottomBackOff','backcrowd',600, 0.7,'cubeOut');
		end
	end

end