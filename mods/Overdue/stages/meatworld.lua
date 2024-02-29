sprite = 'BgAct2ScrollBG'
size = 4480
startX = -2000
startY = -50
duration = 5

function preloadImages()
	precacheImage('effects/vignetteend')
	precacheImage('effects/ycbu_lightning')
	precacheImage('effects/waho')

	precacheImage('backgrounds/TooLateBG/street/BackTrees')
    precacheImage('backgrounds/TooLateBG/street/Front Trees')
	precacheImage('backgrounds/TooLateBG/street/Road')
	precacheImage('backgrounds/TooLateBG/street/car')
	precacheImage('backgrounds/TooLateBG/street/Foreground Trees')

	precacheImage('anims/MX_Transformation_Assets')
	precacheImage('anims/SECRETEXPLOSION')

	precacheImage('backgrounds/act1/act1_stat')
	precacheImage('backgrounds/act1/BG-act1')
	precacheImage('anims/Act_2_Intro')

	precacheImage('anims/act2_static')
	precacheImage('backgrounds/act2/act2_scroll1')
	precacheImage('backgrounds/act2/act2_pipes_waryosh')
	precacheImage('backgrounds/act2/act2_abyss_gradient')

	precacheImage('anims/uhoh')
	precacheImage('backgrounds/BG-uzi')
	precacheImage('effects/blueframe')

	precacheImage('backgrounds/BG-Monika')
	
	precacheImage('backgrounds/BG-Mansion')

	precacheImage('BgImpostor','backgrounds/BG-hImpostor')

	precacheImage('backgrounds/Sink/BG-Sink')
	precacheImage('backgrounds/Sink/BG-Sink-Floor-2')

	precacheImage('backgrounds/Stardust/stardustBg')
	precacheImage('backgrounds/Stardust/stardustFloor')

	precacheImage('backgrounds/black/fgPlatform')
	precacheImage('backgrounds/black/BG-Black')
	precacheImage('anims/blacklegs')
end

function onCreate()
	preloadImages()

	makeLuaSprite('redShilouette', '', 0, 0)
	setScrollFactor('redShilouette', 0, 0)
	makeGraphic('redShilouette', 4400, 2800, 'FF4141')
	addLuaSprite('redShilouette', false)
	setProperty('redShilouette.alpha', 0)
	screenCenter('redShilouette', 'xy')

	makeLuaSprite('BackTrees', 'backgrounds/TooLateBG/street/BackTrees', -1800, -800);
	scaleObject('BackTrees', 1.1, 1.1);
                addLuaSprite('BackTrees',false)

	makeLuaSprite('Front Trees', 'backgrounds/TooLateBG/street/Front Trees', -1800, -800);
	scaleObject('Front Trees', 1.1, 1.1);
                addLuaSprite('Front Trees',false)

	makeLuaSprite('Road', 'backgrounds/TooLateBG/street/Road', -1550, -750);
	scaleObject('Road', 1.1, 1.1);
                addLuaSprite('Road',false)

	makeLuaSprite('car', 'backgrounds/TooLateBG/street/car', -1800, -700);
	scaleObject('car', 1.1, 1.1);
                addLuaSprite('car',false)

	makeLuaSprite('Foreground Trees', 'backgrounds/TooLateBG/street/Foreground Trees', -1700, -800);
	scaleObject('Foreground Trees', 1.1, 1.1);
                addLuaSprite('Foreground Trees',false)

	makeAnimatedLuaSprite('MxTransform','anims/MX_Transformation_Assets',-559,-582)
	addLuaSprite('MxTransform',false)
	setProperty('MxTransform.visible',false)
	scaleObject('MxTransform',0.7,0.7)


	makeLuaSprite('BGPromo', 'backgrounds/BG-Promo', 1800, -100);
	setProperty('BGPromo.visible',false)
	scaleObject('BGPromo', 2,2)
                addLuaSprite('BGPromo',false)

	makeAnimatedLuaSprite('lighting1','effects/ycbu_lightning',1800,-500)
	setProperty('lighting1.visible',false)
	scaleObject('lighting1',2,2)
	addAnimationByPrefix('lighting1','idle','lightning',24,true)
				addLuaSprite('lighting1',false)


	makeLuaSprite('FlashEyes', 'effects/eyes', 0, 0);
	setProperty('FlashEyes.visible',false)
	setObjectCamera('FlashEyes','hud')
	screenCenter('FlashEyes')
                addLuaSprite('FlashEyes',false)

	makeLuaSprite('wahooo', 'effects/waho', 300, 0);
	setProperty('wahooo.visible',false)
	setObjectCamera('wahooo','other')
			addLuaSprite('wahooo',true)
				
	makeLuaSprite('BgSecret', 'backgrounds/BG-Secret', -1700, -800);
	setProperty('BgSecret.visible',false)
			addLuaSprite('BgSecret',false)

	makeAnimatedLuaSprite('explosionSecret','anims/SECRETEXPLOSION',-1720,-800)
	setProperty('explosionSecret.visible',false)
	scaleObject('explosionSecret',3,3)
			addLuaSprite('explosionSecret',true)

	makeAnimatedLuaSprite('staticAct1','backgrounds/act1/act1_stat',-1500,-800)
	addAnimationByPrefix('staticAct1','idle','act1_static',24,true)
	scaleObject('staticAct1',3,3)
	setProperty('staticAct1.visible',false)
			addLuaSprite('staticAct1',false)

	makeLuaSprite('BgAct1', 'backgrounds/act1/BG-act1', -1700, -800);
	setProperty('BgAct1.visible',false)
			addLuaSprite('BgAct1',false)

	makeAnimatedLuaSprite('introAct2-1','anims/Act_2_Intro',700,100)
	setProperty('introAct2-1.visible',false)
			addLuaSprite('introAct2-1',true)

	makeAnimatedLuaSprite('introAct2-2','anims/Act_2_Intro',50,300)
	setObjectCamera('introAct2-2','hud')
	setProperty('introAct2-2.visible',false)
	setProperty('introAct2-2.alpha',0)
			addLuaSprite('introAct2-2',true)

	makeAnimatedLuaSprite('BgAct2Static','anims/act2_static',-1500,-500)
	addAnimationByPrefix('BgAct2Static','idle','act2stat',24,true)
	objectPlayAnimation('BgAct2Static','idle',true)
	scaleObject('BgAct2Static',2,2)
	addLuaSprite('BgAct2Static',false)
	setProperty('BgAct2Static.visible',false)
	  
	makeLuaSprite('BgAct2FG','backgrounds/act2/act2_abyss_gradient',-1500,100)
	addLuaSprite('BgAct2FG',false)
	setProperty('BgAct2FG.visible',false)
	  
	makeLuaSprite(sprite .. '1', 'backgrounds/act2/act2_scroll1', startX, startY)
	makeLuaSprite(sprite .. '2', 'backgrounds/act2/act2_scroll1', startX + size, startY)
	addLuaSprite(sprite .. '1', false)
	addLuaSprite(sprite .. '2', false)
	setProperty(sprite .. '1.visible', false)
	setProperty(sprite .. '2.visible', false)

	makeAnimatedLuaSprite('uzyTransition','anims/uhoh',0,0)
	setObjectCamera('uzyTransition','hud')
	screenCenter('uzyTransition')
	setProperty('uzyTransition.visible',false)
			addLuaSprite('uzyTransition',true)

	makeLuaSprite('BgUzi','backgrounds/BG-uzi',-800,-300)
	addLuaSprite('BgUzi',false)
	setProperty('BgUzi.visible',false)

	makeLuaSprite('blueGradient','effects/blueframe',0,0)
	setObjectCamera('blueGradient','hud')
	screenCenter('blueGradient')
	addLuaSprite('blueGradient',false)
	setProperty('blueGradient.visible',false)

	makeLuaSprite('BgMonika','backgrounds/BG-Monika',-600,125)
	scaleObject('BgMonika',2,2)
	addLuaSprite('BgMonika',false)
	setProperty('BgMonika.visible',false)

	makeLuaSprite('BgMansion','backgrounds/BG-Mansion',-500,0)
	scaleObject('BgMansion',0.55,0.55)
	addLuaSprite('BgMansion',false)
	setProperty('BgMansion.visible',false)

	makeAnimatedLuaSprite('line','anims/line',-180,0)
	scaleObject('line',1,1.5)
	setProperty('line.visible',false)
			addLuaSprite('line',false)

	makeLuaSprite('BgImpostor','backgrounds/BG-hImpostor',-1700,-1600)
	scaleObject('BgImpostor',2.5,2.5)
	setProperty('BgImpostor.visible',false)
			addLuaSprite('BgImpostor',false)

	makeLuaSprite('BgSink','backgrounds/Sink/BG-Sink',-900,-600)
	scaleObject('BgSink',2,2)
	setProperty('BgSink.visible',false)
					addLuaSprite('BgSink',false)

	makeLuaSprite('FloorSink','backgrounds/Sink/BG-Sink-Floor-2',-600,-190)
	scaleObject('FloorSink',0.7,1.3)
	setProperty('FloorSink.visible',false)
					addLuaSprite('FloorSink',true)

	makeLuaSprite('BgBlack','backgrounds/black/BG-Black',-500,-1000)
	setProperty('BgBlack.visible',false)
			addLuaSprite('BgBlack',false)

	makeAnimatedLuaSprite('plataform','anims/skate',900,400)
	setProperty('plataform.visible',false)
			addLuaSprite('plataform',false)

	makeAnimatedLuaSprite('legs','anims/blacklegs',-280,800)
	scaleObject('legs',1.3,1.3)
	setProperty('legs.visible',false)
			addLuaSprite('legs',true)
end

function onCreatePost()
	setTextString('botplayTxt','')
	setProperty("showComboNum", false)
	setProperty("showRating", false)
end

function onUpdate(elapsed)
	if curStep == 1072 then
		setProperty(sprite .. '1.visible', true)
		setProperty(sprite .. '2.visible', true)
		scrollA()
	end

	if curStep == 1264 then
		cancelTween(sprite .. '1move')
		cancelTween(sprite .. '2move')
		cancelTween(sprite .. '1move2')
		cancelTween(sprite .. '2move2')

		removeLuaSprite(sprite .. '1',true)
		removeLuaSprite(sprite .. '2',true)
	end
end


function scrollA()
	doTweenX(sprite .. '1move',sprite .. '1', startX - size, duration)
	doTweenX(sprite .. '2move',sprite .. '2', startX, duration)
end

function onTweenCompleted(tag)
	if tag == (sprite .. '2move') then
		scrollB()
	end
	if tag == (sprite .. '2move2') then
		scrollA()
	end
end

function scrollB()
	doTweenX(sprite .. '1move2',sprite .. '1', startX, 0.001)
	doTweenX(sprite .. '2move2',sprite .. '2', startX + size, 0.001)
end
