local xx = -100; --750
local yy = 1150; --750
local xx2 = 400; --1500
local yy2 = 1350; --750
local ofs = 30;
local ofs2 = 50;
local followchars = true;
local dadzoom = 0.65;
local bfzoom = 0.8;
local shaking = true

local beating = false;

function deleteMarronStage()
    removeLuaSprite('wall',true)
    removeLuaSprite('bubb',true)
    removeLuaSprite('floor',true)
end

function createPiracyBG()
    makeLuaSprite('piracyBg', 'backgrounds/piracy/bg', -1400, 550)
end

function addPiracyBG()
    addLuaSprite('piracyBg',false)
end

function removePiracyBG()
    removeLuaSprite('piracyBg')
end

function createAiHoshinoStage()
    makeLuaSprite('aiBG','backgrounds/ai/hoshino-stage',-900,750)
end

function addAiHoshinoStage()
    addLuaSprite('aiBG',false)
end

function removeAiHoshinoStage()
    removeLuaSprite('aiBG')
end

function createTooLateStage()
    makeLuaSprite('tooLateFloor', 'backgrounds/pcport/toolatefloor', -1400, 700)
    scaleObject('tooLateFloor',1.5,1.5)

    makeLuaSprite('shaderTooLate', 'backgrounds/pcport/fmShade', 0, 0)
    setObjectCamera('shaderTooLate', 'hud');

    makeAnimatedLuaSprite('luigi_stand', 'backgrounds/pcport/luigi_stand', -1400, 300)
    addAnimationByPrefix('luigi_stand', 'idle', 'luigibg0', 24, true)
    scaleObject('luigi_stand',1.5,1.5)
end

function addTooLateStage()
    addLuaSprite('tooLateFloor',false)
    addLuaSprite('luigi_stand',false)
    objectPlayAnimation('luigi_stand','idle',false);
end

function removeTooLateStage()
    removeLuaSprite('tooLateFloor')
    removeLuaSprite('shaderTooLate')
    removeLuaSprite('luigi_stand')
end

function createFalloutStage()
    makeLuaSprite('falloutBg', 'backgrounds/fallout/bg', -1400, -200)
    scaleObject('falloutBg',1.5,1.5)
end

function addFalloutStage()
    addLuaSprite('falloutBg',false)
end

function removeFalloutStage()
    removeLuaSprite('falloutBg')
end

function createNotepadStage()
    makeLuaSprite('notepadBg1', 'backgrounds/home/notepad', -1000, 1000)
    scaleObject('notepadBg1',1.2,1.2)
    makeLuaSprite('notepadBg2', 'backgrounds/home/notepad', 1200, 1000)
    scaleObject('notepadBg2',1.2,1.2)
    setProperty('notepadBg2.flipX',true)

    makeAnimatedLuaSprite('homeStatic', 'backgrounds/home/HomeStatic', -900, 900)
    scaleObject('homeStatic',1.2,1.2)
    setProperty('homeStatic.antialiasing', true)
    addAnimationByPrefix('homeStatic', 'anim1', 'HomeStatic0', 24, true)
end

function addNotepadStage()
    addLuaSprite('homeStatic',false)
    addLuaSprite('notepadBg1',false)
    addLuaSprite('notepadBg2',false)
end

function fadeNotepadStage()
    doTweenAlpha('fadeBFDoodle', 'boyfriend', 0, 0.5, 'linear');
    doTweenAlpha('fadeDadSayo', 'dad', 0, 0.5, 'linear');

    doTweenAlpha('fadeiconP1', 'iconP1', 0, 0.5, 'linear');
    doTweenAlpha('fadeiconP2', 'iconP2', 0, 0.5, 'linear');
    doTweenAlpha('fadeHealthBar', 'healthBar', 0, 0.5, 'linear');

    doTweenAlpha('fadeHomeStatic', 'homeStatic', 0, 0.5, 'linear');
    doTweenAlpha('fadeNotepad1', 'notepadBg1', 0, 0.5, 'linear');
    doTweenAlpha('fadeNotepad2', 'notepadBg2', 0, 0.5, 'linear');
end

function removeNotepadStage()
    removeLuaSprite('notepadBg1')
    removeLuaSprite('notepadBg2')
    removeLuaSprite('homeStatic')
end

function createClubroomStage()
    makeLuaSprite('clubroomBg', 'backgrounds/ddto/DDLCbg', -1000, 500)
    scaleObject('clubroomBg',1.5,1.5)
end

function addClubroomStage()
    addLuaSprite('clubroomBg',false)
end

function removeClubroomStage()
    removeLuaSprite('clubroomBg',false)
end

function createLofieStage()
    makeLuaSprite('lofieBg', 'backgrounds/lofie/bg', -1500, -50)
    scaleObject('lofieBg',1.1,1.1)
end

function addLofieStage()
    addLuaSprite('lofieBg',false)
end

function removeLofieStage()
    removeLuaSprite('lofieBg')
end

function createRetrospecterStage()
    makeLuaSprite('retroBg1', 'backgrounds/retrospecter/bg1', -1650, 20)
    scaleObject('retroBg1',0.9,0.9)
    makeLuaSprite('retroBg2', 'backgrounds/retrospecter/bg2', -1650, 20)
    scaleObject('retroBg2',0.9,0.9)

    makeLuaSprite('retroOverlay', 'backgrounds/retrospecter/wrath_overlay', 0, 0)
    screenCenter('retroOverlay')
    setObjectCamera('retroOverlay',  'hud')

    makeAnimatedLuaSprite('retroFlames', 'backgrounds/retrospecter/flames_colorchange', -800, 780)
    setProperty('retroFlames.antialiasing', true)
    addAnimationByPrefix('retroFlames', 'anim1', 'Symbol 1 Instanz 1', 24, true)
    scaleObject('retroFlames',1.2,1.2)
end

function addRetrospecterStage()
    addLuaSprite('retroOverlay',true)
    addLuaSprite('retroBg1',false)
    addLuaSprite('retroFlames',false)
    addLuaSprite('retroBg2',false)
end

function removeRetrospecterStage()
    removeLuaSprite('retroOverlay')
    removeLuaSprite('retroBg1')
    removeLuaSprite('retroFlames')
    removeLuaSprite('retroBg2')
end

function createDespairStage()
    makeLuaSprite('despairBg', 'backgrounds/despair/bg', -500, 600)
    scaleObject('despairBg',1.2,1.2)
end

function addDespairStage()
    addLuaSprite('despairBg',false)
end

function removeDespairStage()
    removeLuaSprite('despairBg')
end

function createIratusStage()

    makeLuaSprite('iratusFloor', 'backgrounds/iratus/ROCK_BG', -1200, 1300);
    scaleObject('iratusFloor',1.2,1.2)
    makeLuaSprite('iratusSky', 'backgrounds/iratus/INFERNO_SKY', -1200, 500);
    scaleObject('iratusSky',1.2,1.2)

    makeAnimatedLuaSprite('iratusSkulls', 'backgrounds/iratus/SKULLS', -1100, 1100)
    setProperty('iratusSkulls.antialiasing', true)
    addAnimationByPrefix('iratusSkulls', 'anim', 'SKULLS', 24, true)
    scaleObject('iratusSkulls',1.2,1.2)
end

function addIratusStage()
    addLuaSprite('iratusSky',false)
    addLuaSprite('iratusSkulls',false)
    playAnim('iratusSkulls','anim',true)
    addLuaSprite('iratusFloor',false)
    setObjectOrder('iratusFloor',getObjectOrder('iratusSkulls') + 2)
end

function removeIratusStage()
    removeLuaSprite('iratusSky')
    removeLuaSprite('iratusSkulls')
    removeLuaSprite('iratusFloor')
    removeLuaSprite('blackPretenderEnter')
end

function createDefeatStage()
    
    makeAnimatedLuaSprite('blackPretenderEnter', 'transitions/black_pretender', -250, 950)
    setProperty('blackPretenderEnter.antialiasing', true)
    addAnimationByPrefix('blackPretenderEnter', 'anim1', 'black', 24, false)

    makeAnimatedLuaSprite('defeatLight', 'backgrounds/defeat/defeat', -1100, 600)
    setProperty('defeatLight.antialiasing', true)
    addAnimationByPrefix('defeatLight', 'anim1', 'defeat', 24, true)

    makeLuaSprite('defeatThing', 'backgrounds/defeat/lol thing', -1100, 950);

    makeLuaSprite('defeatBG', 'backgrounds/defeat/deadBG', -1000, 1200);
    scaleObject('defeatBG',0.28,0.28)

    makeLuaSprite('deadFG', 'backgrounds/defeat/deadFG', -1100, 1500);
    scaleObject('deadFG',0.3,0.25)

    makeLuaSprite('defeatOverlay', 'backgrounds/defeat/iluminao omaga', 0, 0);
    screenCenter('defeatOverlay')
    setObjectCamera('defeatOverlay','other')
end

function addDefeatStage()
    addLuaSprite('defeatLight',false)
    playAnim('defeatLight', 'anim1', true)
    addLuaSprite('defeatThing',false)
    addLuaSprite('defeatBG',false)
    addLuaSprite('deadFG',true)
    addLuaSprite('defeatOverlay',false)
end

function removeDefeatStage()
    removeLuaSprite('defeatLight')
    removeLuaSprite('defeatThing')
    removeLuaSprite('defeatBG')
    removeLuaSprite('deadFG')
    removeLuaSprite('defeatOverlay')
end

function createMouseStage()
    makeLuaSprite('mouseBg', 'backgrounds/mouse/bg', -1200, 750);
end

function addMouseStage()
    addLuaSprite('mouseBg',false)
end

function removeMouseStage()
    removeLuaSprite('mouseBg')
end

function create90Stage()
    makeLuaSprite('90Bg', 'backgrounds/90s/bg', -800, 750);
end

function add90Stage()
    addLuaSprite('90Bg',false)
end

function remove90Stage()
    removeLuaSprite('90Bg')
end

function createAmusiaStage()
    makeLuaSprite('amusiaBg1', 'backgrounds/amusia/bg1', -950, 920);
    scaleObject('amusiaBg1',1.2,1.2)
    makeLuaSprite('amusiaBg2', 'backgrounds/amusia/bg2', -950, 920);
    scaleObject('amusiaBg2',1.2,1.2)

    makeAnimatedLuaSprite('static-overlay', 'backgrounds/amusia/static-overlay', -30, -30);
    addAnimationByPrefix('static-overlay', 'idle', 'static-overlay', 24, true);
    setLuaSpriteScrollFactor('static-overlay', 0.9, 0.9);
    objectPlayAnimation('static-overlay', 'idle', true);
    scaleObject('static-overlay', 2.5,2.5);
    setObjectCamera('static-overlay','hud')

end

function addAmusiaStage()
    addLuaSprite('amusiaBg1',false)
    addLuaSprite('amusiaBg2',false)
    setProperty('amusiaBg2.visible',false)
end

function removeAmusiaStage()
    removeLuaSprite('amusiaBg1')
    removeLuaSprite('amusiaBg2')
    removeLuaSprite('static-overlay')
end

function createExeStage()
    makeLuaSprite('exeBg', 'backgrounds/exe/bg', -950, 700);

    makeAnimatedLuaSprite('redstatic', 'backgrounds/exe/redstatic', -900, 700);
    scaleObject('redstatic', 5, 5)
    setProperty('redstatic.antialiasing', true)
    addAnimationByPrefix('redstatic', 'anim1', 'TitleMenuSSBG instance 10', 24, true)
    playAnim('redstatic', 'anim1', true)
end

function addExeStage()
    addLuaSprite('redstatic',false)
    addLuaSprite('exeBg',false)
end

function removeExeStage()
    removeLuaSprite('redstatic')
    removeLuaSprite('exeBg')
end

function createRejectedStage()
    makeLuaSprite('rejectedFloor', 'backgrounds/rejected/Main', -1500, -500);

    makeAnimatedLuaSprite('rejectedVortex', 'backgrounds/rejected/Vortex', -1100, 100);
    scaleObject('rejectedVortex',2.5,2.5)
    setProperty('rejectedVortex.antialiasing', true)
    addAnimationByPrefix('rejectedVortex', 'anim1', 'vortex', 24, true)
    playAnim('rejectedVortex', 'anim1', true)
end

function addRejectedStage()
    addLuaSprite('rejectedVortex',false)
    addLuaSprite('rejectedFloor',false)
end

function removeRejectedStage()
    removeLuaSprite('rejectedBg')
    removeLuaSprite('rejectedVortex')
    removeLuaSprite('rejectedFloor')
end

function createVecindadStage()
    makeLuaSprite('vecindadBg', 'backgrounds/vecindadPOV/bg', -1500, 400);
end

function addVecindadStage()
    addLuaSprite('vecindadBg',false)
end

function removeVecindadStage()
    removeLuaSprite('vecindadBg')
end

function createSunshineStage()
    makeLuaSprite('sunshineBg', 'backgrounds/sunshine/bg', -1000, 700);
    scaleObject('sunshineBg',1.2,1.2)
end

function addSunshineStage()
    addLuaSprite('sunshineBg',false)
end

function removeSunshineStage()
    removeLuaSprite('sunshineBg')
end

function createMilkStage()
    makeLuaSprite('milkBg', 'backgrounds/milk/bg', -1350, 600);
end

function addMilkStage()
    addLuaSprite('milkBg',false)
end

function removeMilkStage()
    removeLuaSprite('milkBg')
end

function createPoemsTransition()
    makeAnimatedLuaSprite('poemTransition', 'transitions/PoemTransition', 0, 0)
    setProperty('poemTransition.antialiasing', true)
    addAnimationByPrefix('poemTransition', 'anim1', 'poemtransition', 24, false)
    screenCenter('poemTransition')
    setObjectCamera('poemTransition',  'hud')
end

function createSatanTransition()
    makeAnimatedLuaSprite('satanTransition', 'transitions/SATAN_LAUGH_SCREEN', -250, 0)
    setProperty('satanTransition.antialiasing', true)
    addAnimationByPrefix('satanTransition', 'anim1', 'SATAN LAUGH SCREEN', 24, false)
    screenCenter('satanTransition')
    setObjectCamera('satanTransition','hud')
end

function createNMBendyJumpscare()
    makeAnimatedLuaSprite('NMBendyJump', 'jumpscare/NightmareJumpscares03', 0, 0)
    setProperty('NMBendyJump.antialiasing', true)
    addAnimationByPrefix('NMBendyJump', 'anim1', 'Emmi instance', 24, false)
    screenCenter('NMBendyJump')
    setObjectCamera('NMBendyJump',  'other')
end

function createMonikaexeJumpscare()
     makeLuaSprite('monikaJump', 'jumpscare/scareMonika2', 0, 0)
     screenCenter('monikaJump')
     setObjectCamera('monikaJump',  'other')
end

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function addCharacters()

    addCharacterToList('BF_Dead', 'boyfriend')

    --addCharacterToList('picool', 'boyfriend')

    --addCharacterToList('lofi-collab','boyfriend')
    --addCharacterToList('ai','dad')

    --addCharacterToList('LX','dad')
    --addCharacterToList('luigi', 'boyfriend')

    --addCharacterToList('beast','dad')
    --addCharacterToList('Black_Defeat', 'boyfriend')
    --addCharacterToList('hGrey', 'gf')

    --addCharacterToList('sayopoem','dad')
    --addCharacterToList('doodlebob', 'boyfriend')

    --addCharacterToList('lord-x-fp', 'gf')
    --addCharacterToList('cyclops_speed_full','dad')
    addCharacterToList('none', 'gf')

    --addCharacterToList('monker','dad')
    --addCharacterToList('monika','boyfriend')

    --addCharacterToList('radi','dad')
    --addCharacterToList('lofie','boyfriend')

    --addCharacterToList('zerktro','dad')
    --addCharacterToList('denki','boyfriend')

    --addCharacterToList('cuphead-pissed','boyfriend')
    --addCharacterToList('nightmare-bendy','gf')

    --addCharacterToList('satan-chad','dad')
    --addCharacterToList('p3','boyfriend')

    --addCharacterToList('black2','dad')
    --addCharacterToList('Angry_peppino','boyfriend')

    --addCharacterToList('gold','dad')
    --addCharacterToList('gf-ghost','gf')

    --addCharacterToList('mouse-smile','dad')
    --addCharacterToList('hPink','boyfriend')

    --addCharacterToList('mouse-inferno','dad')
    --addCharacterToList('1stpink','boyfriend')

    --addCharacterToList('wiggles','dad')
    --addCharacterToList('death-stare','dad')
    --addCharacterToList('wigglesTerror','dad')

    --addCharacterToList('ponyta-perspective','boyfriend')
    --addCharacterToList('ponyta','boyfriend')

    --addCharacterToList('sonicexe','dad')
    --addCharacterToList('ycr','dad')
    --addCharacterToList('ycr-mad','dad')
    addCharacterToList('xeno','dad')

    --addCharacterToList('voidcrazed','boyfriend')
    addCharacterToList('acvoid','boyfriend')

    addCharacterToList('matt-rejected','dad')
    addCharacterToList('spookidz','boyfriend')

    addCharacterToList('Chavo2','dad')
    addCharacterToList('mouse-angry','boyfriend')

    addCharacterToList('sayori-doll','dad')
    addCharacterToList('tailsdoll','boyfriend')

    addCharacterToList('sunk','dad')
    addCharacterToList('sunky','boyfriend')
end

function precacheImages()
    precacheImage('icons/maroonP')
    precacheImage('backgrounds/piracy/bg')
    precacheImage('backgrounds/ai/hoshino-stage')
    precacheImage('backgrounds/pcport/toolatefloor')
    precacheImage('backgrounds/pcport/fmShade')
    precacheImage('backgrounds/pcport/luigi_stand')
    precacheImage('backgrounds/fallout/bg')
    precacheImage('backgrounds/home/notepad')
    precacheImage('transitions/PoemTransition')
    precacheImage('jumpscare/NightmareJumpscares03')
    precacheImage('backgrounds/atrocity/bg')
    precacheImage('backgrounds/ddto/DDLCbg')
    precacheImage('jumpscare/scareMonika2')
    precacheImage('backgrounds/lofie/bg')
    precacheImage('backgrounds/retrospecter/bg1')
    precacheImage('backgrounds/retrospecter/bg2')
    precacheImage('backgrounds/retrospecter/flames_colorchange')
    precacheImage('backgrounds/retrospecter/wrath_overlay')
    precacheImage('backgrounds/despair/bg')
    precacheImage('transitions/SATAN_LAUGH_SCREEN')
    precacheImage('backgrounds/iratus/ROCK_BG')
    precacheImage('backgrounds/iratus/INFERNO_SKY')
    precacheImage('backgrounds/iratus/SKULLS')
    precacheImage('transitions/black_pretender')
    precacheImage('backgrounds/defeat/defeat')
    precacheImage('backgrounds/defeat/lol thing')
    precacheImage('backgrounds/defeat/deadBG')
    precacheImage('backgrounds/defeat/deadFG')
    precacheImage('backgrounds/defeat/iluminao omaga')
    precacheImage('backgrounds/mouse/bg')
    precacheImage('backgrounds/90s/bg')
    precacheImage('backgrounds/amusia/bg1')
    precacheImage('backgrounds/amusia/bg2')
    precacheImage('backgrounds/amusia/static-overlay')
    precacheImage('backgrounds/exe/redstatic')
    precacheImage('backgrounds/exe/bg')
    precacheImage('backgrounds/rejected/Main')
    precacheImage('backgrounds/rejected/Vortex')
    precacheImage('backgrounds/vecindadPOV/bg')
    precacheImage('backgrounds/sunshine/bg')
    precacheImage('backgrounds/milk/bg')

end

function precacheSounds()
    precacheSound('no_more')
    precacheSound('step it up')
    precacheSound('week_5')
    precacheSound('pinku_voiceline')
    precacheSound('iam_god')
    precacheSound('nmbendy_land')
    precacheSound('NMBendyJumpscare')
    precacheSound('monikaexeScream')
    precacheSound('Satanlaugh')
    precacheSound('black-death')
end

function onCreate()

    precacheImages()
    precacheSounds()
    addCharacters()

    --createPiracyBG()
    --createAiHoshinoStage()
    --createTooLateStage()
    --createFalloutStage()
    --createPoemsTransition()
    --createNotepadStage()
    --createClubroomStage()
    --createMonikaexeJumpscare()
    --createLofieStage()
    --createRetrospecterStage()
    --createNMBendyJumpscare()
    --createDespairStage()
    --createSatanTransition()
    --createIratusStage()
    --createDefeatStage()
    --createMouseStage()
    --create90Stage()
    --createAmusiaStage()
    createExeStage()
    createRejectedStage()
    createVecindadStage()
    createSunshineStage()
    createMilkStage()

    makeLuaSprite('red','redbg', 0, 0)
	makeLuaSprite('flash','Flash', 0, 0)
    makeLuaSprite('flashud','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)

    addLuaSprite('red')
	addLuaSprite('flash')
    addLuaSprite('flashud')
	addLuaSprite('flashwhite')
	
	setProperty('red.alpha', 0);
	setObjectCamera('red', 'other');
	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
    setProperty('flashud.alpha', 0);
    setObjectCamera('flashud', 'hud');

    makeLuaSprite('csdown','cutscene1', 0, -720)
    scaleObject('csdown',1,2)
    makeLuaSprite('csup','cutscene2', 0, 20)
    scaleObject('csup',1,2)

    addLuaSprite('csup')
    addLuaSprite('csdown')
    setProperty('csup.visible',false)
    setProperty('csdown.visible',false)
    setProperty('csup.alpha', 1);
    setObjectCamera('csup', 'hud');
    setProperty('csdown.alpha', 1);
    setObjectCamera('csdown', 'hud');

    makeAnimatedLuaSprite('iconOpponent', 'icons/maroonP', getProperty('iconP2.x'), getProperty('iconP2.y'))
    addAnimationByPrefix('iconOpponent', 'win', 'winning 1', 24, true)
    addAnimationByPrefix('iconOpponent', 'normal', 'normal 1', 24, true)
    addAnimationByPrefix('iconOpponent', 'lose', 'losing 1', 24, true)
    setObjectCamera('iconOpponent', 'hud')
    addLuaSprite('iconOpponent', true)

end

function onBeatHit()
	if curBeat % 2 == 0 then
	  if beating == true then
	  triggerEvent('Add Camera Zoom', 0.03, 0.03)
	  end
	end

    if getProperty('NMBendyJump.animation.curAnim.name') == 'anim1' and getProperty('NMBendyJump.animation.curAnim.finished') then
        removeLuaSprite('NMBendyJump')
        cameraFlash('camHUD', 'E6FF00', 0.5)

        removeRetrospecterStage();
        addDespairStage();
        triggerEvent('Change Character','bf','cuphead-pissed')
        triggerEvent('Change Character','dad','nightmare-bendy')
        setProperty('dad.visible',false)
        xx = 600
        xx2 = 900;
        dadzoom = 0.65;
        bfzoom = 0.8;
    end

    if getProperty('poemTransition.animation.curAnim.name') == 'anim1' and getProperty('poemTransition.animation.curAnim.finished') then
        removeLuaSprite('poemTransition')
    end

    if getProperty('satanTransition.animation.curAnim.name') == 'anim1' and getProperty('satanTransition.animation.curAnim.finished') then
        removeLuaSprite('satanTransition')
    end
end

function onTweenCompleted(tag)
    if tag == 'fadeHomeStatic' then
        removeNotepadStage()
    end
end

function onStepHit()

   if curStep == 128 or curStep == 9999 then
   beating = true
   end

    if curStep == 1920 then
        playSound('no_more',0.8)
    end

    if curStep == 2033 then
        playSound('step it up',0.85)
    end

    if curStep == 954 then
        playSound('week_5',1)
    end

    if curStep == 1145 then
        playSound('monikaexeScream',1)
    end

    if curStep == 1390 then
        playSound('nmbendy_land',1)
    end

    if curStep == 1400 then
        playSound('NMBendyJumpscare',1)
    end

    if curStep == 1515 then
        playSound('Satanlaugh',1)
    end

    if curStep == 1658 then
        playSound('black-death',0.8)
    end

    if curStep == 2138 then
        playSound('pinku_voiceline',0.95)
    end

    if curStep == 2287 then
        playSound('iam_god',0.8)
    end
end

function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdowndark', 'flash', 0, 1.5, 'linear');
end

function flashdarkHud()
    setProperty('flashud.alpha', 1);
    doTweenAlpha('flashuddowndark', 'flashud', 0, 0.3, 'linear');
end

function animatedIconP2(nameIcon)
        setProperty('iconP2.alpha', 0)
        setObjectOrder(nameIcon, getObjectOrder('iconP2'))
        
        setProperty(nameIcon..'.flipX', false)
        setProperty(nameIcon..'.visible', true)
        setProperty(nameIcon..'.x', getProperty('iconP2.x'))
        setProperty(nameIcon..'.angle', getProperty('iconP2.angle'))
        setProperty(nameIcon..'.y', getProperty('iconP2.y'))
        setProperty(nameIcon..'.scale.x', getProperty('iconP2.scale.x') - 0)
        setProperty(nameIcon..'.scale.y', getProperty('iconP2.scale.y') - 0)
        setProperty(nameIcon..'.antialiasing',true)
        
        if getProperty('health') > 0 and getProperty('health') <= 0.5 then
            objectPlayAnimation(nameIcon,'win');
        elseif getProperty('health') > 0.5 and getProperty('health') <= 1.3 then
            objectPlayAnimation(nameIcon,'normal');
        else
            objectPlayAnimation(nameIcon,'lose');
        end
end

function animatedIconP1(nameIcon)
        setProperty('iconP1.alpha', 0)
        setObjectOrder(nameIcon, getObjectOrder('iconP1'))
        
        setProperty(nameIcon..'.flipX', true)
        setProperty(nameIcon..'.visible', true)
        setProperty(nameIcon..'.x', getProperty('iconP1.x'))
        setProperty(nameIcon..'.angle', getProperty('iconP1.angle'))
        setProperty(nameIcon..'.y', getProperty('iconP1.y'))
        setProperty(nameIcon..'.scale.x', getProperty('iconP1.scale.x') - 0)
        setProperty(nameIcon..'.scale.y', getProperty('iconP1.scale.y') - 0)
        setProperty(nameIcon..'.antialiasing',true)
        
        if getProperty('health') > 0 and getProperty('health') <= 0.5 then
            objectPlayAnimation(nameIcon,'win');
        elseif getProperty('health') > 0.5 and getProperty('health') <= 1.3 then
            objectPlayAnimation(nameIcon,'normal');
        else
            objectPlayAnimation(nameIcon,'lose');
        end
end

function onUpdate(elapsed)
    if curStep < 126 then
        animatedIconP2('iconOpponent')
    end

    if curStep == 128 then
        setProperty('iconP2.alpha', 1)
        removeLuaSprite('iconOpponent',true)
        setProperty('dad.visible',false)
        xx = 50;
        yy = 1250;
        xx2 = 400;
        yy2 = 1500;
        bfzoom = 0.9;

         deleteMarronStage()
         --addPiracyBG()
         flash()

        --triggerEvent('Change Character','bf','picool')
        runHaxeCode([[game.iconP2.changeIcon('piracy-sonic')]]);
        setHealthBarColors('38304B', 'FD6922');
        setObjectOrder('anti_piracy_1',getObjectOrder('piracyBg')+1)
        setProperty('anti_piracy_1.x',-250)
    end

    if curStep == 255 then
        xx = 50;
        yy = 1250;
        xx2 = 50;
        yy2 = 1250;
        dadzoom = 0.9;
        bfzoom = 0.9;
        flash()
        --removePiracyBG()
        --addAiHoshinoStage()
        --triggerEvent('Change Character','bf','lofi-collab')
        --triggerEvent('Change Character','dad','ai')
         setProperty('boyfriend.visible',true)
    end

    if curStep == 310 then
        --doTweenY('tweenYBFLofie','boyfriend',getProperty('boyfriend.y') - 550 , 0.8 , 'CircInOut')
    end

    if curStep == 379 then
        shaking = false
        xx = -350;
        xx2 = -350;
    end

    if curStep == 485 then
        --removeAiHoshinoStage()
        --addTooLateStage()
        setProperty('boyfriend.alpha',0)
        setProperty('dad.alpha',0)
    end

    if curStep == 512 then
        shaking = true
        dadzoom = 0.5;
        bfzoom = 0.8;
        xx = -100;
        yy = 1100;
        xx2 = 700;
        yy2 = 1300;
        --addLuaSprite('shaderTooLate',false)
        --triggerEvent('Change Character','bf','luigi')
        --triggerEvent('Change Character','dad','LX')
        doTweenAlpha('showBFLuigiX','dad',1,0.5,'linear')
        doTweenAlpha('showBFLuigi','boyfriend',1,0.5,'linear')
    end

    if curStep == 640 then
        xx = -100;
        yy = 900;
        xx2 = 750;
        yy2 = 1200;
        --removeTooLateStage()
        --addFalloutStage()
        flash()
    end

    if curStep == 641 then
        --triggerEvent('Change Character','gf','hGrey')
        --triggerEvent('Change Character','bf','Black_Defeat')
        --triggerEvent('Change Character','dad','beast')
    end

    if curStep == 752 then
        --addLuaSprite('poemTransition',true)
    end

    if curStep == 759 then
        flashdark()
        --addNotepadStage()
        --removeFalloutStage()
    end

    if curStep == 768 then
        xx = 200;
        yy = 1450;
        xx2 = 200;
        yy2 = 1450;
        dadzoom = 0.65;
        bfzoom = 0.65;
        --triggerEvent('Change Character','gf','none')
        --triggerEvent('Change Character','bf','doodlebob')
        --triggerEvent('Change Character','dad','sayopoem')
    end

    if curStep == 820 then
        --doTweenX('tweenXBFDoodle','boyfriend',getProperty('boyfriend.x') - 1050 , 0.8 , 'CircInOut')
        --doTweenX('tweenXStageNotepad','notepadBg2',-150,0.8,'CircInOut')
    end

    if curStep == 880 then
        --fadeNotepadStage()
    end

    if curStep == 886 then
        xx = 50;
        xx2 = 50;
        yy = 1250;
        yy2 = 1250;
    end

    if curStep == 912 then
        setProperty('dad.alpha',1)
    end

    if curStep == 949 then
        xx = 2000;
        xx2 = 2000;
        dadzoom = 0.9;
        bfzoom = 0.9;
        yy = 1350;
        yy2 = 1350;
    end

    if curStep == 960 then
        setProperty('boyfriend.alpha',1)
    end 

    if curStep == 1022 then
        xx = 0;
        yy = 1350;
        xx2 = 300;
        yy2 = 1350;
        dadzoom = 0.8;
        bfzoom = 0.7;
        flash();
        --addClubroomStage();
    end

    if curStep == 1023 then
        setProperty('iconP1.alpha',1)
        setProperty('iconP2.alpha',1)
        setProperty('healthBar.alpha',1)
        --triggerEvent('Change Character','bf','monika')
        --triggerEvent('Change Character','dad','monker')
    end

    if curStep == 1145 then
        --addLuaSprite('monikaJump',true)
    end

    if curStep == 1150 then
        --addLofieStage();
    end

    if curStep == 1152 then
        dadzoom = 0.5;
        bfzoom = 0.5;
        yy = 1150;
        yy2 = 1150;
        --triggerEvent('Change Character','bf','lofie')
        --triggerEvent('Change Character','dad','radi')
        --removeClubroomStage()
        --removeLuaSprite('monikaJump',true)
    end

    if curStep == 1280 then
        yy = 1200;
        yy2 = 1350;
        xx2 = 400;
        dadzoom = 0.65;
        bfzoom = 0.8;
        flash();

        --triggerEvent('Change Character','bf','denki')
        --triggerEvent('Change Character','dad','zerktro')
        --removeLofieStage()
        --addRetrospecterStage()
    end

    if curStep == 1390 then
        --triggerEvent('Change Character','gf','nightmare-bendy')
    end

    if curStep == 1400 then
        --addLuaSprite('NMBendyJump',true)
    end

    if curStep == 1408 then

    end

    if curStep == 1515 then
        --addLuaSprite('satanTransition',false)
        --setObjectOrder('satanTransition',getObjectOrder('flashud') + 1)
    end

    if curStep == 1530 then
        yy = 1250;
        yy2 = 1250;
        xx2 = 200;
        xx = -100
        dadzoom = 0.6;
        bfzoom = 0.6;
        --triggerEvent("Change Character", "Dad", "satan-chad");
        --triggerEvent("Change Character", "BF", "p3");
        --triggerEvent("Change Character", "GF", "none")
        setProperty('dad.visible',true)
        flashdarkHud();
        --removeDespairStage()
        --addIratusStage()
    end

    if curStep == 1635 then
        --addLuaSprite('blackPretenderEnter',false)
        --setObjectOrder('blackPretenderEnter',getObjectOrder('iratusSkulls') + 1)
        --playAnim('blackPretenderEnter','anim1',true)
    end

    if curStep == 1663 then
        --addDefeatStage()
        --removeIratusStage()
        xx2 = 100;
        xx = 0
        dadzoom = 0.7;
        bfzoom = 0.7;
        flash();

        --triggerEvent("Change Character", "Dad", "black2");
        --triggerEvent("Change Character", "BF", "Angry_peppino");
    end

    if curStep == 1791 then
        removeDefeatStage();
        dadzoom = 0.8;
        bfzoom = 0.8;
        xx2 = -450;
        xx = -450
        yy = 1300;
        yy2 = 1300;
        setProperty('gf.visible',false)
        setProperty('boyfriend.visible',false)
        --triggerEvent("Change Character", "dad", "gold");

        setProperty('dad.x',-600)
        setProperty('iconP1.visible',false)
        setProperty('iconP2.visible',false)
        setProperty('healthBar.visible',false)
    end

    if curStep == 1919 then
        xx2 = 0;
        xx = 0
        yy = 1400;
        yy2 = 1400;
        --triggerEvent("Change Character", "gf", "gf-ghost");
        --doTweenX('tweenXGfGhost','gf',0 , 0.4 , 'CircInOut')
    end

    if curStep == 2034 then
        setProperty('csup.visible',true)
        setProperty('csdown.visible',true)
    end

    if curStep == 2047 then
        flash();
        setProperty('gf.visible',false)
        setProperty('boyfriend.visible',false)
        dadzoom = 0.7;
        bfzoom = 0.7;
        yy = 1350;
        yy2 = 1350;

        --triggerEvent("Change Character", "dad", "mouse-smile");
        --addMouseStage()
        setProperty('csup.visible',false)
        setProperty('csdown.visible',false)
    end

    if curStep == 2063 then
        dadzoom = 0.8;
        bfzoom = 0.8;
        flash();
        --triggerEvent("Change Character", "dad", "mouse-inferno");
    end

    if curStep == 2079 then
        dadzoom = 0.9;
        bfzoom = 0.9;
        yy = 1300;
        yy2 = 1300;
        setProperty('csup.visible',true)
        setProperty('csdown.visible',true)
    end

    if curStep == 2096 then
        dadzoom = 1;
        bfzoom = 1;
    end

    if curStep == 2112 then
        flash();
        setProperty('dad.visible',false)
        setProperty('boyfriend.visible',true)
        --triggerEvent("Change Character", "boyfriend", "hPink");
        dadzoom = 0.7;
        bfzoom = 0.7;
        xx2 = 600;
        xx = 600
        yy = 1400;
        yy2 = 1400;
        --removeMouseStage()
        setProperty('csup.visible',false)
        setProperty('csdown.visible',false)
        --add90Stage()
    end

    if curStep == 2128 then
        dadzoom = 0.9;
        bfzoom = 0.9;
        setProperty('csup.visible',true)
        setProperty('csdown.visible',true)
    end

    if curStep == 2144 then
        dadzoom = 1.1;
        bfzoom = 1.1;
    end

    if curStep == 2158 then
        dadzoom = 1.3;
        bfzoom = 1.3;
        --triggerEvent("Change Character", "boyfriend", "1stpink");
        --remove90Stage()
        flashdarkHud();
    end

    if curStep == 2174 then
        dadzoom = 0.9;
        bfzoom = 0.9;
        setProperty('csup.visible',false)
        setProperty('csdown.visible',false)


        setProperty('iconP1.visible',true)
        setProperty('iconP2.visible',true)
        setProperty('healthBar.visible',true)

        xx2 = -100;
        xx = -100
    end

    if curStep == 2176 then
        --triggerEvent("Change Character", "dad", "wiggles");
        --triggerEvent("Change Character", "boyfriend", "ponyta");
        flash();
        --addAmusiaStage();

    end

    if curStep == 2207 then
        --triggerEvent("Change Character", "dad", "death-stare");
        --triggerEvent("Change Character", "boyfriend", "ponyta-perspective");
        flash();
        --setProperty('amusiaBg2.visible',true)
        --addLuaSprite('static-overlay', true)
        --setProperty('static-overlay.alpha',0.65)
    end

    if curStep == 2223 then
        --triggerEvent("Change Character", "dad", "wigglesTerror");
    end

    if curStep == 2239 then

        xx2 = 250;
        xx = 250
        dadzoom = 0.65;
        bfzoom = 0.65;
        yy = 1300;
        yy2 = 1300;
        --removeAmusiaStage();
        addExeStage()
        flash()
        --triggerEvent("Change Character", "dad", "sonicexe");
        --triggerEvent("Change Character", "boyfriend", "voidcrazed")
    end

    if curStep == 2256 then
        flash()
        --triggerEvent("Change Character", "dad", "ycr");
    end

    if curStep == 2271 then
        flash()
        --triggerEvent("Change Character", "dad", "ycr-mad");
        triggerEvent("Change Character", "boyfriend", "acvoid")
    end

    if curStep == 2288 then
        flash()
        triggerEvent("Change Character", "dad", "xeno");
    end

    if curStep == 2304 then
        xx2 = 450;
        xx = 50
        yy = 1300;
        yy2 = 1300;
        flash()
        triggerEvent("Change Character", "dad", "matt-rejected");
        triggerEvent("Change Character", "boyfriend", "spookidz");
        removeExeStage();
        addRejectedStage()
    end

    if curStep == 2431 then

        xx2 = 200;
        xx = 200
        triggerEvent("Change Character", "dad", "Chavo2");
        triggerEvent("Change Character", "boyfriend", "mouse-angry");
        setProperty('boyfriend.visible',false)
        addVecindadStage()
        removeRejectedStage();
        flash()
    end

    if curStep == 2496 then
        flash()
        triggerEvent("Change Character", "dad", "sayori-doll");
        triggerEvent("Change Character", "boyfriend", "tailsdoll");
        removeVecindadStage();
        addSunshineStage()
    end

    if curStep == 2560 then
        setProperty('cameraSpeed', 30) 
        dadzoom = 1.3
        xx = -200
        setProperty('defaultCamZoom',dadzoom)
        triggerEvent('Camera Follow Pos',xx,yy)
    end

    if curStep == 2576 then
        bfzoom = 1.3
        xx2 = 700
        setProperty('defaultCamZoom',bfzoom)
        triggerEvent('Camera Follow Pos',xx2,yy2)
    end

    if curStep == 2592 then
        setProperty('cameraSpeed', 1) 
        flash();
        xx2 = 0;
        xx = 0
        yy = 1450;
        yy2 = 1450;
        dadzoom = 0.8
        bfzoom = 0.8
        removeSunshineStage();
        addMilkStage()

        triggerEvent("Change Character", "dad", "sunk");
        triggerEvent("Change Character", "boyfriend", "sunky");

        ofs2 = 80
        ofs = 80

    end

    if curStep < 2560 or curStep > 2595 then
        followChars();
    end
end

function opponentNoteHit()
    if shaking then
        triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.0075');
    end
end

function followChars()
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',dadzoom)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end

        else
            setProperty('defaultCamZoom',bfzoom)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

end