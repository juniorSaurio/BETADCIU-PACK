local pt1 = true;
local pt2 = true;

function preloadImages()
	
	if pt1 then
	precacheImage('backgrounds/EXE/castle')
	precacheImage('backgrounds/EXE/ground')
	precacheImage('backgrounds/EXE/blocks')
	precacheImage('backgrounds/EXE/decor')

	precacheImage('anims/SATAN_LAUGH_SCREEN')
	precacheImage('backgrounds/BG-satan')

	precacheImage('backgrounds/BG-turmoil')

	precacheImage('anims/Fountain_Luigi_2D_Laugh')
	precacheImage('backgrounds/abandoned/BG-Abandoned')
	precacheImage('backgrounds/abandoned/BG-Wall')
	precacheImage('backgrounds/abandoned/fog')
	precacheImage('anims/Flood_Assets')

	precacheImage('backgrounds/BG-accelerant')

	precacheImage('characters/Cassy_Bike')
	precacheImage('backgrounds/baddies/daLights')
	precacheImage('backgrounds/baddies/newBG')
	precacheImage('backgrounds/baddies/parents')
	precacheImage('backgrounds/baddies/myWayOrTheHighway')
	precacheImage('backgrounds/baddies/policeCars')
	precacheImage('backgrounds/baddies/daPopos')

	precacheImage('backgrounds/TransitionTop')
	precacheImage('backgrounds/TransitionBottom')
	precacheImage('backgrounds/BG-Hyper')
	precacheImage('backgrounds/SonicGoogleBG')

	precacheImage('backgrounds/fleetway/BG-Fleetway')
	precacheImage('backgrounds/fleetway/Wall')
	precacheImage('backgrounds/fleetway/Emerald Beam Charged')
	precacheImage('backgrounds/fleetway/Emeralds')
	end

	if pt2 then
	precacheImage('backgrounds/halloween_bg')
	precacheImage('anims/anims/Souls')
	precacheImage('backgrounds/slideBlack')
	precacheImage('anims/ycbu_lightning')
	precacheImage('backgrounds/BG-Attack-Sans')

	precacheImage('backgrounds/bars')

	precacheImage('backgrounds/race/TailsDollRaceBGEnter')
	precacheImage('backgrounds/race/TailsDollRaceBG')

	precacheImage('backgrounds/BG-Monika')
	precacheImage('anims/eyes')

	precacheImage('backgrounds/BG-Mami')
	end
end



function onCreate()
	local x = -1750
	local y = -1000

	preloadImages()

	if pt1 then
		makeLuaSprite('castle', 'backgrounds/EXE/castle', x, y)
	setScrollFactor('castle', 0.9, 0.9)
	addLuaSprite('castle', false)

	makeLuaSprite('ground', 'backgrounds/EXE/ground', x, y)
	addLuaSprite('ground', false)

	makeLuaSprite('blocks', 'backgrounds/EXE/blocks', x, y)
	addLuaSprite('blocks', false)

	makeLuaSprite('decor', 'backgrounds/EXE/decor', x, y)
	addLuaSprite('decor', false)

	makeAnimatedLuaSprite('satanTransition', 'anims/SATAN_LAUGH_SCREEN', -300, -100)
    setProperty('satanTransition.antialiasing', true)
    setObjectCamera('satanTransition','camHUD')
    addLuaSprite('satanTransition',false)
    setProperty('satanTransition.visible',false)
    scaleObject('satanTransition',1.25,1.25)

    makeLuaSprite('BgSatan', 'backgrounds/BG-satan', -1800, -1000)
    scaleObject('BgSatan',1.7,1.7)
	addLuaSprite('BgSatan', false)
	setProperty('BgSatan.visible',false)

	makeAnimatedLuaSprite('blackTransition', 'anims/defeat_death', 100, 0)
    setProperty('blackTransition.antialiasing', true)
    setObjectCamera('blackTransition','camHUD')
    addLuaSprite('blackTransition',false)
    setProperty('blackTransition.visible',false)
    scaleObject('blackTransition',1.3,1.3)
    setProperty('blackTransition.alpha',0.5)

	makeAnimatedLuaSprite('fountainLuigiAnim', 'anims/Fountain_Luigi_2D_Laugh', 0,0)
	screenCenter('fountainLuigiAnim')
    setProperty('fountainLuigiAnim.antialiasing', false)
    setObjectCamera('fountainLuigiAnim','camHUD')
    addLuaSprite('fountainLuigiAnim',true)
    setProperty('fountainLuigiAnim.visible',false)

    makeLuaSprite('BgTurmoil', 'backgrounds/BG-turmoil', -2200, -900)
	addLuaSprite('BgTurmoil', false)
	setProperty('BgTurmoil.visible',false)

    makeLuaSprite('BgAbandoned', 'backgrounds/abandoned/BG-Abandoned', -2100, -1000)
	addLuaSprite('BgAbandoned', false)
	setProperty('BgAbandoned.visible',false)

    makeLuaSprite('BgWallAbandoned', 'backgrounds/abandoned/BG-Wall', -2100, -1000)
	addLuaSprite('BgWallAbandoned', false)
	setProperty('BgWallAbandoned.visible',false)

	makeLuaSprite('vigenetteFog', 'backgrounds/abandoned/fog',0,0)
	screenCenter('vigenetteFog')
	setObjectCamera('vigenetteFog','camHUD')
	addLuaSprite('vigenetteFog', false)
	setProperty('vigenetteFog.visible',false)

	makeLuaSprite('BgAccelerant', 'backgrounds/BG-accelerant', -1500, -600)
	addLuaSprite('BgAccelerant', false)
	setProperty('BgAccelerant.visible',false)

	makeAnimatedLuaSprite('waterFloor', 'anims/Flood_Assets', 0,700)
	setObjectCamera('waterFloor','camHUD')
    setProperty('waterFloor.antialiasing', false)
    addAnimationByPrefix('waterFloor', 'idle', 'water overlay', 48, true)
    addLuaSprite('waterFloor',true)
    setProperty('waterFloor.visible',false)

    makeAnimatedLuaSprite('CassanovaBike', 'characters/Cassy_Bike', 1100,0)
    setProperty('CassanovaBike.antialiasing', false)
    scaleObject('CassanovaBike',1.4,1.4)
    addLuaSprite('CassanovaBike',false)
    setProperty('CassanovaBike.alpha',0)

    makeLuaSprite('BgBaddies', 'backgrounds/baddies/newBG', -1000, -800)
	addLuaSprite('BgBaddies', false)
	setProperty('BgBaddies.visible',false)

	makeAnimatedLuaSprite('helicopters', 'backgrounds/baddies/daPopos', -1500,-400)
    setProperty('helicopters.antialiasing', false)
    addAnimationByPrefix('helicopters', 'idle', 'helicopters', 24, true)
    addLuaSprite('helicopters',false)
    setProperty('helicopters.visible',false)

	makeAnimatedLuaSprite('hihgway', 'backgrounds/baddies/myWayOrTheHighway', -1850,-790)
    setProperty('hihgway.antialiasing', false)
    addAnimationByPrefix('hihgway', 'idle', 'newGround', 24, true)
    addLuaSprite('hihgway',false)
    setProperty('hihgway.visible',false)

    makeAnimatedLuaSprite('policeCars', 'backgrounds/baddies/policeCars', -300,250)
    setProperty('policeCars.antialiasing', false)
    addAnimationByPrefix('policeCars', 'idle', 'policeChase', 24, true)
    addLuaSprite('policeCars',false)
    setProperty('policeCars.visible',false)

    makeAnimatedLuaSprite('lightsBaddies', 'backgrounds/baddies/daLights', -1500,-350)
    setProperty('lightsBaddies.antialiasing', false)
    addAnimationByPrefix('lightsBaddies', 'idle', 'lightsMove', 48, true)
    addLuaSprite('lightsBaddies',false)
    setProperty('lightsBaddies.visible',false)

    makeAnimatedLuaSprite('carParents', 'backgrounds/baddies/drivelol', -750,135)
    scaleObject('carParents',1.4,1.4)
    setProperty('carParents.antialiasing', false)
    addAnimationByPrefix('carParents', 'idle', 'car', 24, true)
    addLuaSprite('carParents',false)
    setProperty('carParents.visible',false)

    makeLuaSprite('BgHyper','backgrounds/BG-Hyper',1000,4000)
   	addLuaSprite('BgHyper',true)

   	makeLuaSprite('BgFleetway','backgrounds/fleetway/Wall',-2000,-3500)
   	addLuaSprite('BgFleetway',false)
   	setProperty('BgFleetway.visible',false)

   	makeAnimatedLuaSprite('chargeEmerald', 'backgrounds/fleetway/Emerald Beam Charged', -800,-1950)
    setProperty('chargeEmerald.antialiasing', false)
    addAnimationByPrefix('chargeEmerald', 'idle', 'Emerald Beam Charged instance 1', 24, true)
    addLuaSprite('chargeEmerald',false)
    setProperty('chargeEmerald.visible',false)

   	makeAnimatedLuaSprite('emerals', 'backgrounds/fleetway/Emeralds', -200,-700)
    setProperty('emerals.antialiasing', false)
    addAnimationByPrefix('emerals', 'idle', 'TheEmeralds instance 1', 24, true)
    addLuaSprite('emerals',false)
    setProperty('emerals.visible',false)

   	makeLuaSprite('FgFleetway','backgrounds/fleetway/BG-Fleetway',-2500,-1800)
   	addLuaSprite('FgFleetway',false)
   	setProperty('FgFleetway.visible',false)

    makeLuaSprite('transitionCoronationTop','backgrounds/TransitionTop',-1400,200)
   	addLuaSprite('transitionCoronationTop',true)
   	setProperty('transitionCoronationTop.visible',false)

   	makeLuaSprite('transitionCoronationBottom','backgrounds/TransitionBottom',-1400,2270)
   	addLuaSprite('transitionCoronationBottom',true)

    makeAnimatedLuaSprite('BgGoogle', 'backgrounds/SonicGoogleBG', -900,4000)
    setProperty('BgGoogle.antialiasing', false)
    scaleObject('BgGoogle',1.5,1.5)
    addAnimationByPrefix('BgGoogle', 'idle', 'Idle', 24, true)
    addLuaSprite('BgGoogle',false)

	end

	if pt2 then
	makeAnimatedLuaSprite('BgHalloween', 'backgrounds/halloween_bg', -1600,-800)
	scaleObject('BgHalloween',6,6)
    setProperty('BgHalloween.antialiasing', false)
    addLuaSprite('BgHalloween',false)
    setProperty('BgHalloween.visible',false)

	makeAnimatedLuaSprite('souls', 'anims/Souls', -1100,-450)
	scaleObject('souls',2,2)
    setProperty('souls.antialiasing', false)
    addLuaSprite('souls',true)
    setProperty('souls.visible',false)

	makeLuaSprite('slideBlack', 'backgrounds/slideBlack', -1400, -900)
	addLuaSprite('slideBlack', true)
	setProperty('slideBlack.angle',-10)
	setProperty('slideBlack.visible',false)

    makeAnimatedLuaSprite('lightning', 'anims/ycbu_lightning', -650,-250)
    scaleObject('lightning',2,2)
    setProperty('lightning.antialiasing', false)
    addLuaSprite('lightning',true)
    setProperty('lightning.angle',120)
    setProperty('lightning.visible',false)

    makeLuaSprite('BgAttackSans','backgrounds/BG-Attack-Sans',-950,-1150)
    addLuaSprite('BgAttackSans',false)
    setProperty('BgAttackSans.visible',false)

    makeLuaSprite('bgBar','backgrounds/bars',0,0)
    scaleObject('bgBar', 3, 3)
    screenCenter('bgBar')
    addLuaSprite('bgBar',false)
    setProperty('bgBar.visible',false)

    makeLuaSprite('slideSecret', 'backgrounds/slideSecret', -1400, -900)
	addLuaSprite('slideSecret', true)
	setProperty('slideSecret.angle',-10)
	setProperty('slideSecret.visible',false)

	makeAnimatedLuaSprite('BgRaceEnter', 'backgrounds/race/TailsDollRaceBGEnter', -1000,-500)
	scaleObject('BgRaceEnter',8,8)
    setProperty('BgRaceEnter.antialiasing', false)
    addLuaSprite('BgRaceEnter',false)
    setProperty('BgRaceEnter.visible',false)


	makeAnimatedLuaSprite('BgRace', 'backgrounds/race/TailsDollRaceBG', -1000,-500)
	scaleObject('BgRace',8,8)
    setProperty('BgRace.antialiasing', false)
    addLuaSprite('BgRace',false)
    setProperty('BgRace.visible',false)

    makeLuaSprite('BgMonika', 'backgrounds/BG-Monika', -1200, -300)
    scaleObject('BgMonika',1.5,1.5)
	addLuaSprite('BgMonika', false)
	setProperty('BgMonika.visible',false)

	makeAnimatedLuaSprite('eyes', 'anims/eyes', -1300,-600)
	scaleObject('eyes',2,2)
    setProperty('eyes.antialiasing', false)
    addAnimationByPrefix('eyes', 'open', 'eyes open', 24, false)
    addAnimationByPrefix('eyes', 'close', 'eyes close', 24, false)
    addLuaSprite('eyes',false)
    setProperty('eyes.visible',false)

    makeLuaSprite('BgMami', 'backgrounds/BG-Mami', -1800, -800)
    scaleObject('BgMami',1.5,1.5)
	addLuaSprite('BgMami', false)
	setProperty('BgMami.visible',false)
	end
end


function onCreatePost()
    setTextString('botplayTxt','')
    setProperty('showRating', false);
    setProperty('showComboNum', false);

    makeLuaSprite('health', 'healthBarNEW', 290, 633)
    scaleObject('health',1,1.08)
    addLuaSprite('health',true)
    setObjectCamera('health', 'hud')

    setObjectOrder('healthBar',getObjectOrder('health')-1)
    setObjectOrder('iconP1',getObjectOrder('health')+1)
    setObjectOrder('iconP2',getObjectOrder('health')+1)
end