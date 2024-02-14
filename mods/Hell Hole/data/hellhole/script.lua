function onCreate()
	precacheCharacters()
	precacheImagesStage()

	makeLuaSprite('black', 'black', 0, 0);
    setObjectCamera('black', 'hud');
    addLuaSprite('black', true);
    setProperty('black.alpha',0)

    createWarningKB()
end

function onUpdate(elapsed)

	------------ PARTE 1 -----------------------------------------------------------------------------------------------
	if curStep == 360 then
		createIntroLibitina()
	end

	if curStep == 460 then
		createExplosionTransition()
	end

	if curStep == 462 then
    	createTordStage()
    	removeLibitinaStage()
    	triggerEvent('Change Character','dad','tord-in-bot')
    	runHaxeCode([[game.iconP1.changeIcon('tabi')]]);
    	setHealthBarColors('d9124a', 'ffbc81');
	end

	if curStep == 526 then
		removeTordStage()
	end

	if curStep == 530 then
		triggerEvent('Change Character','dad','gold')
		triggerEvent('Change Character','boyfriend','canon')
		setProperty('boyfriend.visible',true)
		setProperty('iconP1.visible',false)
    	setProperty('iconP2.visible',false)
    	setProperty('healthBar.visible',false)
	end

	if curStep == 555 then
		doTweenY('tweenYCanon','boyfriend',130 , 0.8 , 'CircInOut')
	end

	if curStep == 590 then
		triggerEvent('Change Character','gf','googleSonic')
		setProperty('boyfriend.x',getProperty('boyfriend.x') + 50)
		setProperty('dad.x',getProperty('dad.x') - 50)
	end

	if curStep == 655 then
		triggerEvent('Change Character','gf','shaggyrev-fd-g')
		triggerEvent('Change Character','dad','mattrev-fd-g')
		triggerEvent('Change Character','boyfriend','ateloron')
		createStadiumGodStage()
		setProperty('iconP1.visible',true)
    	setProperty('iconP2.visible',true)
    	setProperty('healthBar.visible',true)
	end

	if curStep == 703 then
		createJumpscarePiper()
	end

	if curStep == 719 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		setProperty('gf.visible',false)
		removeStadiumGodStage()
		createDespairStage()
		triggerEvent('Change Character','dad','nightmare-bendy')
    	triggerEvent('Change Character','boyfriend','black2')
	end

	if curStep == 784 then
		removeDespairStage()
		triggerEvent('Change Character','boyfriend','gumball')
		triggerEvent('Change Character','dad','piracy-sonic')
		setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1)
		setProperty('boyfriend.angle',20)
		createPiracyFloor()
	end

	if curStep >= 784 and curStep <= 912 then
	 	if getProperty('dad.animation.curAnim.name') == 'idle' then
        	setProperty('boyfriend.x',xPos)
        	setProperty('boyfriend.y',yPos)
    	end
	end

	if curStep == 912 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		removePiracyFloor()
		triggerEvent('Change Character','boyfriend','wiggles')
		triggerEvent('Change Character','dad','4tr')
		setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') + 1)
	end

	if curStep == 1034 then
		createWiglituffJumspcare()
	end

	if curStep == 1040 then
		createWoodyExeStage()
		triggerEvent('Change Character','boyfriend','kirby')
		triggerEvent('Change Character','dad','woody_exe')
	end

	if curStep == 1044 then
		removeWiglituffJumpscare()
	end

	if curStep == 1104 then
		removeWoodyExeStage()
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
    	setProperty('boyfriend.visible',false)
		triggerEvent('Change Character','dad','may')
		triggerEvent('Change Character','boyfriend','sweet')
		createIngrainStage()
	end

	if curStep == 1167 then
		setProperty('boyfriend.visible',true)
		removeIngrainStage()
		createIlusionForestStage()
		triggerEvent('Change Character','dad','p3')
        triggerEvent('Change Character','boyfriend','bfxdrip')
	end

	if curStep == 1229 then
		doTweenAlpha('bfXFade', 'boyfriend', 0, 0.18, 'linear');
		doTweenAlpha('p135Fade', 'dad', 0, 0.18, 'linear');
		fadeIlusionForestStage()
	end

	if curStep == 1232 then
		removeIlusionForestStage()
		createBigMonikaStage()
		triggerEvent('Change Character','boyfriend','bigmonika-dress')
		triggerEvent('Change Character','dad','nikku_ddto')
		setObjectOrder('boyfriendGroup', getObjectOrder('bigmonikaTable') - 1)
		setObjectOrder('dadGroup', getObjectOrder('bigmonikaTable') + 1)
	end

	if curStep == 1312 then
		doTweenAlpha('blackFade1','black',1,0.2,'linear')
	end

	if curStep == 1330 then
    	removeBigMonikaStage()
    	triggerEvent('Change Character','gf','sunshineExe')
    	triggerEvent('Change Character','boyfriend','infernom-pov')
    	setProperty('dad.alpha',0)

    	setProperty('iconP1.visible',false)
    	setProperty('iconP2.visible',false)
    	setProperty('healthBar.visible',false)
	end

	if curStep == 1341 then
		doTweenAlpha('blackFade2','black',0,0.6,'linear')
	end

	if curStep == 1374 then
		doTweenY('infernoMarioYEnter','boyfriend',350,0.2,'CircInOut')
	end

	if curStep == 1388 then
		triggerEvent('Change Character','dad','1stpink')
		doTweenAlpha('1stpinkFade','dad',1,1.5,'linear')
		doTweenY('1stpinkYEnter','dad',getProperty('dad.y') -400,1.5,'CircInOut')
		setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') + 1)
	end

	if curStep == 1416 then
		doTweenY('infernoMarioYEnter','boyfriend',900,0.8,'CircInOut')
	end

	if curStep == 1428 then
    	triggerEvent('Change Character','boyfriend','pac-man')
    	setProperty('boyfriend.alpha',0)
    	doTweenAlpha('pacmanFadeIn','boyfriend',0.6,1.5,'linear')
    end

	if curStep == 1456 then
		doTweenAlpha('blackFade2','black',1,0.2,'linear')
	end

	if curStep == 1472 then
		setProperty('black.alpha',0)
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		setProperty('gf.visible',false)
		triggerEvent('Change Character','dad','kb')
    	triggerEvent('Change Character','boyfriend','miku')
    	setProperty('boyfriend.alpha',1)
    	createKBStage()

    	setProperty("warn.alpha", 1)
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1488 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1504 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1520 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1524 then
		objectPlayAnimation('warn', 'two', false)
	end

	if curStep == 1528 then
		setProperty('attack.alpha',1)
		objectPlayAnimation('attack', 'fire', false)
	end

	if curStep == 1536 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1552 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1568 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1584 then
		objectPlayAnimation('warn', 'one', false)
	end

	if curStep == 1588 then
		objectPlayAnimation('warn', 'two', false)
	end

	if curStep == 1592 then
		objectPlayAnimation('attack', 'fire', false)
	end

	if curStep == 1598 then
		removeLuaSprite('attack',true)
		removeLuaSprite('warn',true)
	end

	if curStep == 1648 then
		setProperty('gf.visible',true)
		triggerEvent('Change Character','gf','gilbert')
		doTweenY("gilbertUpY", 'gf', -550, 0.5, "circOut")
		setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 3)
	end

	if curStep == 1664 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
		setProperty('gf.visible',false)
		removeKBStage()
		createStreetStage()
		triggerEvent('Change Character','dad','robot')
    	triggerEvent('Change Character','boyfriend','alien-norun')
	end

	if curStep == 1696 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
		removeStreetStage()
		createShitnoStage()
		triggerEvent('Change Character','dad','shitno')
    	triggerEvent('Change Character','boyfriend','grey-cold')
	end

	if curStep == 1728 then
		setProperty('gf.alpha',0)
		triggerEvent('Change Character','gf','Asfront')
		doTweenAlpha('floorFade','shitnoFloor',0,1,'linear')
		doTweenAlpha('shitnoFadeOut','dad',0,1,'linear')
		doTweenAlpha('monikaExeFadeIn','gf',1,1.7,'linear')
		doTweenAlpha('greyFadeOut','boyfriend',0,1,'linear')
		createAsStage()
	end

	if curStep == 1864 then
		doTweenAlpha('blackFade3','black',1,0.5,'linear')
	end

	------------ PARTE 2 -----------------------------------------------------------------------------------------------

	if curStep == 1872 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.6)
		removeAsStage()
		setProperty('black.alpha',0)
		setProperty('iconP1.visible',false)
    	setProperty('iconP2.visible',false)
    	setProperty('healthBar.visible',false)

    	setProperty('boyfriend.alpha',1)
    	setProperty('dad.alpha',1)
    	setProperty('gf.alpha',1)

    	setProperty('boyfriend.visible',true)
    	setProperty('dad.visible',true)
    	setProperty('gf.visible',false)
	end
end

function onBeatHit()
	if getProperty('libitinaIntro.animation.curAnim.name') == 'anim' and getProperty('libitinaIntro.animation.curAnim.finished') then
        removeLuaSprite('libitinaIntro',true)
        removeLuaSprite('windowBG1',true)
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        removeInfernoStage()
        createLibitinaStage()

        triggerEvent('Change Character','dad','ghost-intro')
        triggerEvent('Change Character','boyfriend','pink')
        setProperty('boyfriend.visible',false)
    end

    if getProperty('explosionTransition.animation.curAnim.name') == 'anim' and getProperty('explosionTransition.animation.curAnim.finished') then
    	removeLuaSprite('explosionTransition',true)
    end

    if getProperty('jumpscarePiper.animation.curAnim.name') == 'anim' and getProperty('jumpscarePiper.animation.curAnim.finished') then
    	removeLuaSprite('jumpscarePiper',true)
    end
end

function onTweenCompleted(tag)
	if tag == 'bfXFade' then
		doTweenAlpha('monikaFade', 'boyfriend', 1, 0.18, 'linear');
	end

	if tag == 'p135Fade' then
		doTweenAlpha('nikuFade', 'dad', 1, 0.18, 'linear');
	end
end

function precacheImagesStage()
	precacheImage('backgrounds/libitina/bigwindow')
	precacheImage('backgrounds/libitina/Hando')
	precacheImage('backgrounds/tord/TordBG')
	precacheImage('backgrounds/stadium-god/final-background')
	precacheImage('backgrounds/stadium-god/final-glow')
	precacheImage('backgrounds/stadium-god/final-arena')
	precacheImage('jumpscare/PiperJumpscare')
	precacheImage('backgrounds/despair/bg')
	precacheImage('backgrounds/antipiracy/piracy_bg2')
	precacheImage('jumpscare/Wiggles')
	precacheImage('backgrounds/woody-exe/Bg')
	precacheImage('backgrounds/ingrain/bg')
	precacheImage('backgrounds/ilusion-forest/bg')
	precacheImage('backgrounds/bigmonika/BG')
	precacheImage('backgrounds/bigmonika/FG')
	precacheImage('backgrounds/kb/streetBack')
	precacheImage('longbob')
	precacheImage('black')
	precacheImage('qt/attack_alert_NEW')
	precacheImage('qt/attackv6')
	precacheImage('effects/Phase3Static')
	precacheImage('characters/dxComic')
	precacheImage('characters/picoComic')
	precacheImage('backgrounds/street/streetBG')
	precacheImage('backgrounds/shitno/floor')
	precacheImage('backgrounds/asmodeus/textbox')
	precacheImage('backgrounds/asmodeus/HomeStatic')
end

function precacheCharacters()
	addCharacterToList('ghost-intro', 'dad')
	addCharacterToList('pink', 'boyfriend')
	addCharacterToList('tord-in-bot', 'dad')
	addCharacterToList('gold', 'dad')
	addCharacterToList('canon', 'boyfriend')
	addCharacterToList('googleSonic','gf')
	addCharacterToList('ateloron','boyfriend')
	addCharacterToList('mattrev-fd-g','dad')
	addCharacterToList('shaggyrev-fd-g','gf')
	addCharacterToList('nightmare-bendy','dad')
	addCharacterToList('black2','boyfriend')
	addCharacterToList('piracy-sonic','dad')
	addCharacterToList('gumball','boyfriend')
	addCharacterToList('4tr','dad')
	addCharacterToList('wiggles','boyfriend')
	addCharacterToList('woody_exe','dad')
	addCharacterToList('kirby','boyfriend')
	addCharacterToList('may','dad')
	addCharacterToList('sweet','boyfriend')
	addCharacterToList('p3','dad')
	addCharacterToList('bfxdrip','boyfriend')
	addCharacterToList('nikku_ddto','dad')
	addCharacterToList('bigmonika-dress','boyfriend')
	addCharacterToList('sunshineExe','gf')
	addCharacterToList('infernom-pov','boyfriend')
	addCharacterToList('1stpink','dad')
	addCharacterToList('kb','dad')
	addCharacterToList('miku','boyfriend')
	addCharacterToList('pac-man','boyfriend')
	addCharacterToList('gilbert','gf')
	addCharacterToList('robot','dad')
	addCharacterToList('alien-norun','boyfriend')
	addCharacterToList('grey-cold','boyfriend')
	addCharacterToList('shitno','dad')
	addCharacterToList('Asfront','gf')
end

function removeInfernoStage()
	removeLuaSprite('infernoSky',true)
	removeLuaSprite('infernoBg',true)
	removeLuaSprite('infernoGround1',true)
	removeLuaSprite('infernoGround2',true)
	removeLuaSprite('infernoSky',true)
end

function createLibitinaStage()
	makeLuaSprite('windowBG2','backgrounds/libitina/bigwindow',-200,220)
	scaleObject('windowBG2',1.2,1.2)
	addLuaSprite('windowBG2')
end

function createIntroLibitina()
	makeLuaSprite('windowBG1','backgrounds/libitina/bigwindow',300,400)
	scaleObject('windowBG1',0.7,0.7)
	addLuaSprite('windowBG1',false)
	setProperty('windowBG1.alpha',0)
	doTweenAlpha('windowBG1Fade', 'windowBG1', 1, 0.3, 'linear');

	makeAnimatedLuaSprite('libitinaIntro', 'backgrounds/libitina/Hando', 400, 400)
    setProperty('libitinaIntro.antialiasing', true)
    addAnimationByPrefix('libitinaIntro', 'anim', 'HandoAnim', 24, false)
    addLuaSprite('libitinaIntro',false)
end

function removeLibitinaStage()
	removeLuaSprite('windowBG2',true)
end

function createExplosionTransition()
	makeAnimatedLuaSprite('explosionTransition', 'backgrounds/tord/Explosion', 0, 0)
    setProperty('explosionTransition.antialiasing', true)
    scaleObject('explosionTransition',8,8)
    addAnimationByPrefix('explosionTransition', 'anim', 'Explosion', 24, false)
    screenCenter('explosionTransition')
    setObjectCamera('explosionTransition','hud')
    addLuaSprite('explosionTransition',true)
end

function createTordStage()
	makeLuaSprite('tordBG','backgrounds/tord/TordBG',-850,-370)
	scaleObject('tordBG',0.8,0.8)
	addLuaSprite('tordBG',false)
end

function removeTordStage()
	removeLuaSprite('tordBG',true)
end

function createStadiumGodStage()
	makeLuaSprite('final-background', 'backgrounds/stadium-god/final-background', -600, -100);
	setScrollFactor('final-background', 0.7, 0.7);
	
	makeLuaSprite('final-glow', 'backgrounds/stadium-god/final-glow', -600, -100);
	setScrollFactor('final-glow', 0.8, 0.8);
	scaleObject('final-glow', 0.8, 0.8);

	makeLuaSprite('final-arena', 'backgrounds/stadium-god/final-arena', -600, -300);
	setScrollFactor('final-arena', 1, 1);
	scaleObject('final-arena', 1, 1);

	addLuaSprite('final-background', false);
	addLuaSprite('final-glow', false);
	addLuaSprite('final-arena', false);
end

function removeStadiumGodStage()
	removeLuaSprite('final-background',true)
	removeLuaSprite('final-glow',true)
	removeLuaSprite('final-arena',true)
end

function createJumpscarePiper()
	makeAnimatedLuaSprite('jumpscarePiper', 'jumpscare/PiperJumpscare', 0, 0)
    setProperty('jumpscarePiper.antialiasing', true)
    addAnimationByPrefix('jumpscarePiper', 'anim', 'Fuck uuuu instance', 24, false)
    screenCenter('jumpscarePiper')
    setObjectCamera('jumpscarePiper','hud')
    addLuaSprite('jumpscarePiper',false)
end

function createDespairStage()
	makeLuaSprite('despairBG', 'backgrounds/despair/bg', -800, -400);
	scaleObject('despairBG',1.5,1.5)
	addLuaSprite('despairBG',false)
end

function removeDespairStage()
	removeLuaSprite('despairBG',true)
end

function createPiracyFloor()
	makeLuaSprite('piracyFloor', 'backgrounds/antipiracy/piracy_bg2', -800, 600);
	addLuaSprite('piracyFloor',false)
end

function removePiracyFloor()
	removeLuaSprite('piracyFloor')
end

function createWiglituffJumspcare()
	makeLuaSprite('wigglesJumpscare', 'jumpscare/Wiggles', 0, 0);
	screenCenter('wigglesJumpscare')
    setObjectCamera('wigglesJumpscare','hud')
    addLuaSprite('wigglesJumpscare',true)
end

function removeWiglituffJumpscare()
	removeLuaSprite('wigglesJumpscare',true)
end

function createWoodyExeStage()
	makeLuaSprite('woodyExeBg','backgrounds/woody-exe/Bg',-300,-200)
	addLuaSprite('woodyExeBg',false)
end

function removeWoodyExeStage()
	removeLuaSprite('woodyExeBg',true)
end


function createIngrainStage()
	makeLuaSprite('ingrainBg','backgrounds/ingrain/bg',-700,-200)
	addLuaSprite('ingrainBg',false)
end

function removeIngrainStage()
	removeLuaSprite('ingrainBg',true)
end

function createIlusionForestStage()
	makeLuaSprite('forestBg','backgrounds/ilusion-forest/bg',-700,-200)
	addLuaSprite('forestBg',false)
end

function fadeIlusionForestStage()
	doTweenAlpha('ilusionBgFade','forestBg',0,0.18,'linear')
end

function removeIlusionForestStage()
	removeLuaSprite('forestBg',true)
end

function createBigMonikaStage()
	makeLuaSprite('bigmonikaBg','backgrounds/bigmonika/BG',-500,-200)
	scaleObject('bigmonikaBg',1.3,1.3)
	addLuaSprite('bigmonikaBg',false)
	setObjectOrder('bigmonikaBg',10)

	makeLuaSprite('bigmonikaTable','backgrounds/bigmonika/FG',-700,-100)
	scaleObject('bigmonikaTable',1.4,1.4)
	addLuaSprite('bigmonikaTable',false)
	setObjectOrder('bigmonikaTable',12)
end

function removeBigMonikaStage()
	removeLuaSprite('bigmonikaBg',true)
	removeLuaSprite('bigmonikaTable',true)
end

function createKBStage()
	makeLuaSprite('kbBg','backgrounds/kb/streetBack',-500,-200)
	addLuaSprite('kbBg',false)
end

function removeKBStage()
	removeLuaSprite('kbBg',true)
end

function createWarningKB()
	makeAnimatedLuaSprite('warn', 'qt/attack_alert_NEW', 0, 0)
	addAnimationByPrefix('warn', 'one', 'kb_attack_animation_alert-single0', 24, false)
	addAnimationByPrefix('warn', 'two', 'kb_attack_animation_alert-double0', 24, false)
	addAnimationByPrefix('warn', 'three', 'kb_attack_animation_alert-triple0', 24, false)
	addAnimationByPrefix('warn', 'four', 'kb_attack_animation_alert-quad0', 24, false)
	setObjectCamera('warn', 'other')
	screenCenter('warn')
	addLuaSprite('warn', false)
	setProperty("warn.alpha", 0)

	makeAnimatedLuaSprite('attack', 'qt/attackv6', -2060, 410)
	setObjectCamera('attack', 'other')
	addAnimationByPrefix('attack', 'fire', 'kb_attack_animation_fire', 24, false)
	addLuaSprite('attack', false)
	setProperty("attack.alpha", 0)
end

function createStreetStage()
	makeLuaSprite('alienBG','backgrounds/street/streetBG',-500,-300)
	scaleObject('alienBG',1.2,1.2)
	addLuaSprite('alienBG',false)
end

function removeStreetStage()
	removeLuaSprite('alienBG',true)
end

function createShitnoStage()
	makeLuaSprite('shitnoFloor','backgrounds/shitno/floor',0,800)
	addLuaSprite('shitnoFloor',false)
end

function removeShitnoStage()
	removeLuaSprite('shitnoFloor',true)
end

function createAsStage()
	makeAnimatedLuaSprite('homeStatic', 'backgrounds/asmodeus/HomeStatic', -488, -34)
	scaleObject('homeStatic', 1.1, 1.1)
	addAnimationByPrefix('homeStatic', 'anim', 'HomeStatic0', 24, true)
	playAnim('homeStatic', 'anim', true)
	addLuaSprite('homeStatic', false)
	setProperty('homeStatic.alpha',0)
	doTweenAlpha('homeStaticFadeIn','homeStatic',1,1.7,'linear')
	
	makeLuaSprite('textboxDoki', 'backgrounds/asmodeus/textbox', -188, 671)
	scaleObject('textboxDoki', 1.8, 1.8)
	setProperty('textboxDoki.alpha',0)
	addLuaSprite('textboxDoki', true)
	doTweenAlpha('textboxDokiFadeIn','textboxDoki',1,1.7,'linear')
end

function removeAsStage()
	removeLuaSprite('homeStatic',true)
	removeLuaSprite('textboxDoki',true)
end