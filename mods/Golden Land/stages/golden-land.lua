sprite = 'BgAct2ScrollBG'
size = 2048
startX = -300
startY = -500
duration = 5

function preloadImages()
	precacheImage('white')
	precacheImage('black')
	precacheImage('backgrounds/BG-Tord')
	precacheImage('jumpscare/Wiggles')
	precacheImage('effects/PoemTransition')
	precacheImage('effects/static-overlay')
	precacheImage('effects/Explosion')
	precacheImage('backgrounds/BG-Clubroom')
	precacheImage('backgrounds/BG-Mickey')
	precacheImage('backgrounds/BG-Amusia')
	precacheImage('backgrounds/BG-School-glitch')
	precacheImage('backgrounds/BG-School-glitch-wall')
	precacheImage('vigenette-glitch')
	precacheImage('effects/attackv6')
	precacheImage('backgrounds/spaceBGflash')
	precacheImage('backgrounds/holoBop')
	precacheImage('backgrounds/spacestage')
	precacheImage('backgrounds/BG-Tricky')
	precacheImage('backgrounds/Maze')
	precacheImage('backgrounds/BG-Aldryx')
	precacheImage('backgrounds/BG-Sarvente')
	precacheImage('effects/act2_static')
	precacheImage('backgrounds/act2_pipes_waryosh')
	precacheImage('backgrounds/act2_scroll1')
	precacheImage('backgrounds/act2_abyss_gradient')
end


function onCreate()

	preloadImages()

	makeLuaSprite('black', 'black', 0, 0);
	setObjectCamera('black', 'other');
	addLuaSprite('black', true);
	setProperty('black.alpha',0)

   makeLuaSprite('health', 'healthBarNEW', 285, 633)
   scaleObject('health',1.02,1.08)
   addLuaSprite('health',true)
   setObjectCamera('health', 'hud')

   makeLuaSprite('BgMonika','backgrounds/BG-Clubroom',-1100,-1300)
   scaleObject('BgMonika',2.2,2.2)
   addLuaSprite('BgMonika',false)

    makeAnimatedLuaSprite('poemTransition', 'effects/PoemTransition', 0, 0)
    setProperty('poemTransition.antialiasing', true)
    addAnimationByPrefix('poemTransition', 'anim1', 'poemtransition', 24, false)
    screenCenter('poemTransition')
    setObjectCamera('poemTransition', 'other')

    makeLuaSprite('BgMickey','backgrounds/BG-Mickey',-800,-700)
    scaleObject('BgMickey',1.3,1.3)

    makeAnimatedLuaSprite('explosionTransition', 'effects/Explosion', 0, 0)
    setProperty('explosionTransition.antialiasing', true)
    scaleObject('explosionTransition',8,8)
    addAnimationByPrefix('explosionTransition', 'anim', 'Explosion', 24, false)
    screenCenter('explosionTransition')
    setObjectCamera('explosionTransition','other')

   	makeLuaSprite('wigglesJumpscare', 'jumpscare/Wiggles', 0, 0);
	screenCenter('wigglesJumpscare')
    setObjectCamera('wigglesJumpscare','hud')

    makeAnimatedLuaSprite('static-overlay', 'effects/static-overlay', -30, -30);
    addAnimationByPrefix('static-overlay', 'idle', 'static-overlay', 24, true);
    setLuaSpriteScrollFactor('static-overlay', 0.9, 0.9);
    objectPlayAnimation('static-overlay', 'idle', true);
    scaleObject('static-overlay', 2.5,2.5);
    setObjectCamera('static-overlay','hud')
    setProperty('static-overlay.alpha',0.6)

    makeLuaSprite('BgTord','backgrounds/BG-Tord',-700,-900)

    makeLuaSprite('BgSchool1','backgrounds/BG-School-glitch',-500,-600)
    scaleObject('BgSchool1',1.5,1.5)
    makeLuaSprite('BgSchool2','backgrounds/BG-School-glitch-wall',-500,-500)
    scaleObject('BgSchool2',1.5,1.5)
    makeLuaSprite('vigenetteGlitch','effects/vigenette-glitch',0,0)
    screenCenter('vigenetteGlitch')
    setObjectCamera('vigenetteGlitch','hud')

    makeAnimatedLuaSprite('attack', 'effects/attackv6', -2060, 410);
	setObjectCamera('attack', 'hud');
	addAnimationByPrefix('attack', 'fire', 'kb_attack_animation_fire', 24, false)
	setLuaSpriteScrollFactor('attack', 0, 0);

	makeLuaSprite('BGSpaceVoid','backgrounds/spaceBGflash',-450,-200)
  	setScrollFactor('BGSpaceVoid', 0.1, 0.1);
  	scaleObject('BGSpaceVoid',1.4,1.5)
  	addLuaSprite('BGSpaceVoid',false)
  	setProperty('BGSpaceVoid.visible',false)

  	makeAnimatedLuaSprite('FGSpaceVoid','backgrounds/spacestage',-300,-500)
  	scaleObject('FGSpaceVoid',1.2,1)
  	addAnimationByPrefix('FGSpaceVoid','idle','Stage Bop',42,true)
  	objectPlayAnimation('FGSpaceVoid','idle',true)
  	addLuaSprite('FGSpaceVoid',false)
  	setProperty('FGSpaceVoid.visible',false)

  	makeAnimatedLuaSprite('BGPublicVoid','backgrounds/holoBop',-370,-300)
  	scaleObject('BGPublicVoid',1.2,1.1)
  	addAnimationByPrefix('BGPublicVoid','idle','Holo Boppers',42,true)
  	objectPlayAnimation('BGPublicVoid','idle',true)
  	setScrollFactor('BGPublicVoid', 0.2, 0.2)
  	addLuaSprite('BGPublicVoid',false)
  	setProperty('BGPublicVoid.visible',false)

  	makeLuaSprite('BgTricky','backgrounds/BG-Tricky',-2000,-1050)
  	scaleObject('BgTricky',1.5,1.5)

  	makeAnimatedLuaSprite('BgMaze','backgrounds/Maze',-600,-600)
  	addAnimationByPrefix('BgMaze','idle','Stage',24,true)
  	objectPlayAnimation('BgMaze','idle',true)
  	addLuaSprite('BgMaze',false)
  	setProperty('BgMaze.visible',false)

  	makeLuaSprite('BgAldryx','backgrounds/BG-Aldryx',-800,-950)
  	scaleObject('BgAldryx',1.1,1.1)

  	makeLuaSprite('BgSarvente','backgrounds/BG-Sarvente',-500,-1050)
  	scaleObject('BgSarvente',1.1,1.1)

    makeLuaSprite('BgAmusia','backgrounds/BG-Amusia',-100,-370)
    scaleObject('BgAmusia',1.5,1.5)

    makeAnimatedLuaSprite('BgAct2Static','effects/act2_static',-500,-500)
  	addAnimationByPrefix('BgAct2Static','idle','act2stat',24,true)
  	objectPlayAnimation('BgAct2Static','idle',true)
  	scaleObject('BgAct2Static',2,2)

	makeLuaSprite('BgAct2FG','backgrounds/act2_abyss_gradient',-300,-500)

  	makeLuaSprite(sprite .. '1', 'backgrounds/act2_scroll1', startX, startY)
	makeLuaSprite(sprite .. '2', 'backgrounds/act2_scroll1', startX + size, startY)

	makeLuaSprite('PipeL','backgrounds/act2_pipes_waryosh',100,400)
	makeLuaSprite('PipeW','backgrounds/act2_pipes_waryosh',-400,500)
	makeLuaSprite('PipeY','backgrounds/act2_pipes_waryosh',600,500)
end

function onUpdate(elapsed)
	if curStep == 1248 then
		addLuaSprite(sprite .. '1', false)
		addLuaSprite(sprite .. '2', false)
		scrollA()
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