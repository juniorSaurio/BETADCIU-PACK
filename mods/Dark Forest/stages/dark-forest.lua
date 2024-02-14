
function preloadImages()
	precacheImage('white')
	precacheImage('black')
	precacheImage('effects/ready_wallop')
	precacheImage('effects/the_thing2.0')
	precacheImage('backgrounds/BG-Devil')
	precacheImage('healthBarNEW')
	precacheImage('jumpscare/NightmareJumpscares03')
	precacheImage('backgrounds/defeat')
	precacheImage('backgrounds/BG-Circus')
	precacheImage('backgrounds/BG-Fleet')
	precacheImage('backgrounds/BG-Sonic')
	precacheImage('backgrounds/BG-Black')
	precacheImage('backgrounds/BG-Pink')
	precacheImage('backgrounds/BG-Maniacal')
	precacheImage('backgrounds/BallisticBackground')
	precacheImage('effects/thefunnyeffect')
	precacheImage('backgrounds/BG-Oswald')
	precacheImage('backgrounds/BG-Reroy')
	precacheImage('backgrounds/BG-TL-1')
	precacheImage('backgrounds/BG-TL-2')
	precacheImage('effects/TL_Meat_FG_topteeth2')
	precacheImage('effects/TL_Meat_FG_bottomteeth')
	precacheImage('backgrounds/BG-Space')
	precacheImage('effects/aura')
	precacheImage('backgrounds/spaceBGflash')
	precacheImage('backgrounds/spacestage')
	precacheImage('backgrounds/holoBop')
	precacheImage('backgrounds/BG-Doki')
	precacheImage('effects/ycbu_lightning')
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

   makeAnimatedLuaSprite('CupTitle','effects/ready_wallop',-600,-30)
   addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
   objectPlayAnimation('CupTitle','Ready?',false)
   setObjectCamera('CupTitle','hud')

   makeAnimatedLuaSprite('start', 'effects/the_thing2.0', -100, 0)
   scaleObject('start',1.15,1.15)
   setObjectCamera('start', 'hud')
   addAnimationByPrefix('start','dance','BOO instance 1',18,false)
   objectPlayAnimation('start','dance',false)

   makeLuaSprite('BgDevil', 'backgrounds/BG-Devil', -1300, -1250)
   scaleObject('BgDevil',2.5,2.5)

   addLuaSprite('BgDevil',false)
   addLuaSprite('start', true);
   addLuaSprite('CupTitle',true)

	makeAnimatedLuaSprite('NMBendyJump', 'jumpscare/NightmareJumpscares03', 0, 0)
	setProperty('NMBendyJump.antialiasing', true)
	addAnimationByPrefix('NMBendyJump', 'anim1', 'Emmi instance', 24, false)
	screenCenter('NMBendyJump')
	setObjectCamera('NMBendyJump',  'hud')

   makeAnimatedLuaSprite('defeatFLoor1','backgrounds/defeat',-800,-100)
   addAnimationByPrefix('defeatFLoor1','idle','defeat',24,false)
   scaleObject('defeatFLoor1',1.5,1.5)
   objectPlayAnimation('defeatFLoor1','idle',true)

	makeLuaSprite('BgCircus', 'backgrounds/BG-Circus', -700, -300)
	scaleObject('BgCircus',1.1,1.1)

	makeLuaSprite('BgFleet', 'backgrounds/BG-Fleet', -400, -100)

	makeLuaSprite('BgSonic', 'backgrounds/BG-Sonic', -400, -100)

	makeLuaSprite('BgBlack', 'backgrounds/BG-Black', -3400, -350)

	makeLuaSprite('BgPink', 'backgrounds/BG-Pink', 1600, -350)

	makeLuaSprite('BgManiacal', 'backgrounds/BG-Maniacal', -600, -900)
	
	makeAnimatedLuaSprite('BgWhitty','backgrounds/BallisticBackground',100,-300)
   	addAnimationByPrefix('BgWhitty','idle','Background Whitty Moving',24,false)
   	objectPlayAnimation('BgWhitty','idle',true)

   	makeLuaSprite('effectWhitty', 'effects/thefunnyeffect', 0, 0)
   	--screenCenter('effectWhitty')
	setObjectCamera('effectWhitty',  'hud')

	makeLuaSprite('BgOswald', 'backgrounds/BG-Oswald', -600, -700)

	makeLuaSprite('BgReroy', 'backgrounds/BG-Reroy', -600, -1100)

	makeLuaSprite('BGTL1', 'backgrounds/BG-TL-1', -1800, -1650)
	setProperty('BGTL1.alpha',0)
	makeLuaSprite('BGTL2', 'backgrounds/BG-TL-2', -500, 250)
	setProperty('BGTL2.alpha',0)

	makeLuaSprite('ToothTop', 'effects/TL_Meat_FG_topteeth2', -250, -3000)
	setObjectCamera('ToothTop',  'hud')

	makeLuaSprite('ToothBottom', 'effects/TL_Meat_FG_bottomteeth', -250, 1600)
	setObjectCamera('ToothBottom',  'hud')

	makeLuaSprite('crazyspace', 'backgrounds/BG-Space', -3000, -1700);
	scaleObject('crazyspace', 5, 5);
	
	makeAnimatedLuaSprite('aura', 'effects/aura', 220, -550);
	scaleObject('aura', 2.5, 2.5);
	addAnimationByPrefix('aura', 'idle', 'aura', 12, true);

	makeLuaSprite('BGSpaceVoid','backgrounds/spaceBGflash',-450,-160)
  	setScrollFactor('BGSpaceVoid', 0.1, 0.1);
  	scaleObject('BGSpaceVoid',1.4,1.5)

  	makeAnimatedLuaSprite('FGSpaceVoid','backgrounds/spacestage',-300,-200)
  	scaleObject('FGSpaceVoid',1.2,1)
  	addAnimationByPrefix('FGSpaceVoid','idle','Stage Bop',42,true)
  	objectPlayAnimation('FGSpaceVoid','idle',true)

  	makeAnimatedLuaSprite('BGPublicVoid','backgrounds/holoBop',-370,-300)
  	scaleObject('BGPublicVoid',1.2,1.1)
  	addAnimationByPrefix('BGPublicVoid','idle','Holo Boppers',42,true)
  	objectPlayAnimation('BGPublicVoid','idle',true)
  	setScrollFactor('BGPublicVoid', 0.2, 0.2)

  	makeLuaSprite('bgDoki', 'backgrounds/BG-Doki', -525, -550)
  	scaleObject('bgDoki',1.4,1.4)
  	setProperty('bgDoki.flipX',true)

  	makeAnimatedLuaSprite('Lighting','effects/ycbu_lightning',550,-660)
  	addAnimationByPrefix('Lighting','idle','lightning',24,true)
  	objectPlayAnimation('Lighting','idle',true)
  	scaleObject('Lighting',2.2,1.8)
end

function onCreatePost()
	setTextString('botplayTxt','')
	playSound('introCup',0.8)
	setObjectOrder('healthBar',getObjectOrder('health')-1)
end
