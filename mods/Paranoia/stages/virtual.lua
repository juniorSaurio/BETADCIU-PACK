local nameStage1 = 'virtual'
local nameStage2 = 'GBland'
local nameStage3 = 'feverPico'
local nameStage4 = 'madness'
local nameStage5 = 'dad7'
local nameStage6 = 'starman'

local trhowAnimation1 = false;
local trhowAnimation2 = false;
local finalizeAnimation2 = false;

function preloadImages(nameStage)
    if nameStage == nameStage2 then
        precacheImage('backgrounds/GBland/Phase1')
        precacheImage('backgrounds/GBland/Phase2')
    end

    if nameStage == nameStage3 then
        precacheImage('backgrounds/feverPico/perspectiveR')
        precacheImage('backgrounds/feverPico/perspectiveRCar')
    end

    if nameStage == nameStage4 then
        precacheImage('backgrounds/madness/bg')
        precacheImage('backgrounds/madness/HP GREMLIN')
    end

    if nameStage == nameStage5 then
        precacheImage('backgrounds/dad7/gdtitle')
        precacheImage('backgrounds/dad7/hamster')
        precacheImage('backgrounds/dad7/start')
    end

    if nameStage == nameStage6 then
        precacheImage('backgrounds/starman/SS_1')
        precacheImage('backgrounds/starman/SS_farplatforms')
        precacheImage('backgrounds/starman/SS_floor')
        precacheImage('backgrounds/starman/SS_midplatforms')
        precacheImage('backgrounds/starman/SS_POWblock')
        precacheImage('backgrounds/starman/Starman_BG_Fire_Assets')
    end
end

function createStage(nameStage)
    if nameStage == nameStage1 then
        makeLuaSprite('bg','backgrounds/virtual/Wall Bg',-1170,-770)
        setScrollFactor('bg',0.4,0.4)
        setObjectOrder('bg',1)
        
        makeLuaSprite('backPipes','backgrounds/virtual/Back Pipes',-1170,-770)
        setScrollFactor('backPipes',0.8,0.8)
        setObjectOrder('backPipes',2)
    
        makeLuaSprite('backPlatform','backgrounds/virtual/Back Platform',-1170,-740)
        setScrollFactor('backPlatform',0.8,0.8)
        setObjectOrder('backPlatform',3)
    
        makeLuaSprite('frontPipes','backgrounds/virtual/Front Pipes',-1170,-770)
        setObjectOrder('frontPipes',4)
    
        makeLuaSprite('platform','backgrounds/virtual/Main Platform',-1170,-770)
        setObjectOrder('platform',5)
    end

    if nameStage == nameStage2 then
        makeLuaSprite('gbLandPhase1','backgrounds/GBland/Phase1',-180,-500)
        setProperty('gbLandPhase1.alpha',0.001)
        scaleObject('gbLandPhase1',6,6)
        addLuaSprite('gbLandPhase1',false)

        makeLuaSprite('gbLandPhase2','backgrounds/GBland/Phase2',-180,-500)
        setProperty('gbLandPhase2.alpha',0.001)
        scaleObject('gbLandPhase2',6,6)
        addLuaSprite('gbLandPhase2',false)
    end

    if nameStage == nameStage3 then
        makeLuaSprite('sideFever','backgrounds/feverPico/perspectiveR',-20,-270)
        addLuaSprite('sideFever',true)

        makeLuaSprite('sideFeverCar','backgrounds/feverPico/perspectiveRCar',-20,-270)
        addLuaSprite('sideFeverCar',true)
    end

    if nameStage == nameStage4 then
        makeLuaSprite('bgTricky','backgrounds/madness/bg',2200,-600)
        addLuaSprite('bgTricky',true)
        setObjectOrder('lighting1', getObjectOrder('bgTricky') + 1)
        setObjectOrder('gremlin',getObjectOrder('lighting1') + 1)
    end
    
    if nameStage == nameStage5 then

        makeLuaSprite('bgGranDad',nil,-2000,-1500)
        makeGraphic('bgGranDad',screenWidth,screenHeight,'155FD9')
        scaleObject('bgGranDad',5,5)
        setScrollFactor('bgGranDad',0,0)
        setProperty('bgGranDad.alpha',0.001)
        addLuaSprite('bgGranDad',false)

        makeLuaSprite('title','backgrounds/dad7/gdtitle',750,0)
        scaleObject('title',0.8,0.8)
        addLuaSprite('title',true)

        makeLuaSprite('hamster','backgrounds/dad7/hamster',900,0)
        scaleObject('hamster',0.8,0.8)
        addLuaSprite('hamster',true)

        makeLuaSprite('pressStart','backgrounds/dad7/start',-600,1000)
        scaleObject('pressStart',4,4)
        setProperty('pressStart.antialiasing',false)
        addLuaSprite('pressStart',false)
    end

    if nameStage == nameStage6 then
        makeLuaSprite('bgCastle','backgrounds/starman/SS_1',-1550,-700)
        scaleObject('bgCastle',1.3,1.3)
        setScrollFactor('bgCastle',0.2,0.2)
            addLuaSprite('bgCastle',false)

        setProperty('fireLeft.alpha',1)
        setProperty('fireRight.alpha',1)

        setObjectOrder('fireLeft',getObjectOrder('bgCastle') + 1)
        setObjectOrder('fireRight',getObjectOrder('bgCastle') + 1)

        makeLuaSprite('farPlatform','backgrounds/starman/SS_farplatforms',-2100,-1200)
        setScrollFactor('farPlatform',0.6,0.6)
        scaleObject('farPlatform',1.5,1.5)
            addLuaSprite('farPlatform',false)

        makeLuaSprite('pow','backgrounds/starman/SS_POWblock',670,600)
        scaleObject('pow',1.1,1.1)
        setScrollFactor('pow',0.6,0.6)
            addLuaSprite('pow',false)
        
        makeLuaSprite('midPlatform','backgrounds/starman/SS_midplatforms',-1200,-800)
        setScrollFactor('midPlatform',0.7,0.7)
            addLuaSprite('midPlatform',false)
        
        makeLuaSprite('floorExe','backgrounds/starman/SS_floor',-1020,-700)
        scaleObject('floorExe',1.05,1.05)
            addLuaSprite('floorExe',true)
    end
 end

 function removeStage(stage,destroy)
    if stage == nameStage1 then
        removeLuaSprite('bg',destroy)
        removeLuaSprite('backPipes',destroy)
        removeLuaSprite('backPlatform',destroy)
        removeLuaSprite('frontPipes',destroy)
        removeLuaSprite('platform',destroy)
    end

    if stage == nameStage2 then
        removeLuaSprite('gbLandPhase1',destroy)
        removeLuaSprite('gbLandPhase2',destroy)
    end

    if stage == nameStage3 then
        removeLuaSprite('sideFever',destroy)
        removeLuaSprite('sideFeverCar',destroy)
    end

    if stage == nameStage4 then
        removeLuaSprite('bgTricky',destroy)
    end

    if stage == nameStage5 then
        removeLuaSprite('bgGranDad',destroy)
        removeLuaSprite('title',destroy)
        removeLuaSprite('hamster',destroy)
        removeLuaSprite('pressStart',destroy)
    end

    if stage == nameStage6 then
        removeLuaSprite('fireLeft',destroy)
        removeLuaSprite('fireRight',destroy)
        removeLuaSprite('bgCastle',destroy)
        removeLuaSprite('farPlatform',destroy)
        removeLuaSprite('pow',destroy)
        removeLuaSprite('midPlatform',destroy)
        removeLuaSprite('floorExe',destroy)
    end

    callScript('scripts/optimization','optimizeStage',{stage})
 end


 function onCreate()

    addLuaScript('extra_scripts/loadingStage')
    preloadImages(nameStage2)
    preloadImages(nameStage3)
    preloadImages(nameStage4)
    preloadImages(nameStage5)
    preloadImages(nameStage6)

    createStage(nameStage1)

    precacheImage('anims/warning')
    makeAnimatedLuaSprite('warningMouse','anims/warning',0,0)
    addAnimationByPrefix('warningMouse','anim','Advertencia',24,false)
    screenCenter('warningMouse','xy')
    setObjectCamera('warningMouse','other')
    setProperty('warningMouse.alpha',0.001)
        addLuaSprite('warningMouse',false)

    precacheImage('anims/ycbu_lightning')
	makeAnimatedLuaSprite('lighting1','anims/ycbu_lightning',2000,-700)
    addAnimationByPrefix('lighting1','idle','lightning',24,true)
	scaleObject('lighting1',2,2)
    setProperty('lighting1.alpha',0.001)
		addLuaSprite('lighting1',true)

    makeAnimatedLuaSprite('gremlin','backgrounds/madness/HP GREMLIN',1300,-850)
    addAnimationByPrefix('gremlin','idle','HP Gremlin ANIMATION',20,false)
    setProperty('gremlin.flipX',true)
    setProperty('gremlin.flipY',true)
    setProperty('gremlin.alpha',0.001)
        addLuaSprite('gremlin',true)

    makeAnimatedLuaSprite('fireLeft','backgrounds/starman/Starman_BG_Fire_Assets',-1500,-1000)
    addAnimationByPrefix('fireLeft','anim','fire anim effects',24,true)
    setScrollFactor('fireLeft',0.6,0.6)
    setProperty('fireLeft.alpha',0.001)
        addLuaSprite('fireLeft',false)
    
    makeAnimatedLuaSprite('fireRight','backgrounds/starman/Starman_BG_Fire_Assets',1100,-1000)
    addAnimationByPrefix('fireRight','anim','fire anim effects',24,true)
    setProperty('fireRight.flipX',true)
    setScrollFactor('fireRight',0.6,0.6)
    setProperty('fireRight.alpha',0.001)
        addLuaSprite('fireRight',false)

    setPropertyFromClass('states.PlayState','SONG.arrowSkin','noteSkins/Virtual_NOTE_assets')
    setPropertyFromClass('states.PlayState','SONG.splashSkin','noteSplashes/noteSplashes-Virtual')
end

function onCreatePost()

    setTextString('botplayTxt','')
	setProperty("showComboNum", false)
	setProperty("showRating", false)

    for strums = 0,7 do
        setPropertyFromGroup('strumLineNotes',strums,'scale.x',3.5)
        setPropertyFromGroup('strumLineNotes',strums,'scale.y',3.5)
        updateHitboxFromGroup('strumLineNotes',strums)
    end
    for notes = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',notes,'texture') == '' or getPropertyFromGroup('unspawnNotes',notes,'noteTexture') == nil then
            setPropertyFromGroup('unspawnNotes',notes,'scale.x',3.5)
            if getPropertyFromGroup('unspawnNotes',notes,'isSustainNote') then
                setPropertyFromGroup('unspawnNotes',notes,'offsetX',0)
            else
                setPropertyFromGroup('unspawnNotes',notes,'scale.y',3.5)
            end
        end
        updateHitboxFromGroup('unspawnNotes',notes)
    end
end

function onUpdate(elapsed)
    if getProperty('warningMouse.animation.curAnim.name') == 'anim' and getProperty('warningMouse.animation.curAnim.finished') and trhowAnimation1 then
        removeLuaSprite('warningMouse',true)
        removeFromMemory('anims/warning',false)
        trhowAnimation1 = false
    end
    
    if getProperty('gremlin.animation.curAnim.name') == 'idle' and getProperty('gremlin.animation.curAnim.curFrame') == 20  and trhowAnimation2 then
        doTweenX('moveGremlin','gremlin',500,2,'linear')
        doTweenX('moveTricky','boyfriend',1400,2.3,'linear')
        doTweenX('moveLighting1','lighting1',1200,2.3,'linear')
        doTweenX('moveBgTricky','bgTricky',1340,2.3,'linear')
    end

    if getProperty('gremlin.animation.curAnim.name') == 'idle' and getProperty('gremlin.animation.curAnim.curFrame') >= 28 and not finalizeAnimation2 and trhowAnimation2 then
        setProperty('gremlin.animation.curAnim.curFrame',24)
    end

    if getProperty('gremlin.animation.curAnim.name') == 'idle' and getProperty('gremlin.animation.curAnim.finished') and trhowAnimation2 then
        removeLuaSprite('gremlin',true)
        removeFromMemory('backgrounds/madness/HP GREMLIN',false)
        trhowAnimation2 = false
    end
end

function onBeatHit()
    if luaSpriteExists('pressStart') then
        setProperty('pressStart.visible',not getProperty('pressStart.visible'))
    end
end

function onDestroy()
    setPropertyFromClass('states.PlayState','SONG.arrowSkin','')
    setPropertyFromClass('states.PlayState','SONG.splashSkin','')
    setPropertyFromClass('states.PlayState','SONG.disableNoteRGB',false)
end

function onEvent(name,v1,v2)
    if name == 'Triggers BETADCIU' then
        if v1 == '2' then
            if v2 == '0' then
                removeStage(nameStage1,true)
                createStage(nameStage2)
            end

            if v2 == '2' then
                setProperty('gbLandPhase1.alpha',0.01)
                setProperty('gbLandPhase2.alpha',1)
            end

            if v2 == '6' then
                setProperty('warningMouse.alpha',1)
                playAnim('warningMouse','anim',true)
                trhowAnimation1 = true;
            end
        end

        if v1 == '3' then
            if v2 == '0' then
                removeStage(nameStage2,true)
                createStage(nameStage3)
            end
        end

        if v1 == '4' then
            if v2 == '0' then
                doTweenX('exitBGFever1','sideFever',-1500,0.3,'cubeInOut')
                doTweenX('exitBGFever2','sideFeverCar',-1500,0.3,'cubeInOut')
                createStage(nameStage4)
            end

            if v2 == '2' then
                setProperty('gremlin.alpha',1)
                playAnim('gremlin','idle',false)
                trhowAnimation2 = true;
                
            end
        end

        if v1 == '5' then
            if v2 == '0' then
                createStage(nameStage5)
                doTweenY('moveUpTitle','title',-600,0.3,'linear')
                doTweenY('moveUpHamster','hamster',-450,0.3,'linear')
                doTweenAlpha('fadeInBgGrandad','bgGranDad',1,0.5,'linear')
            end

            if v2 == '2' then
                doTweenAlpha('fadeOutBgGrandad','bgGranDad',0,1.5,'linear')
            end
        end

        if v1 == '6' then
            if v2 == '0' then
                cameraFlash('camGame', '0xFFFFFFFF', 0.3)
                removeStage(nameStage5,true)
                createStage(nameStage6)
            end

            if v2 == '3' then
                setProperty('pow.alpha',0.001)
            end
        end
    end
end

function onTweenCompleted(tag)

    if tag == 'exitBGFever1' then
        removeStage(nameStage3,true)
    end

    if tag == 'moveGremlin' then
        finalizeAnimation2 = true;
    end

    if tag == 'moveUpTitle' then
        doTweenX('exitAuditor','gf',-2000,0.5,'linear')
        doTweenX('exitTricky','boyfriend',2500,0.5,'linear')
        doTweenX('exitLighting1','lighting1',2500,0.5,'linear')
        doTweenX('exitBgTricky','bgTricky',2500,0.5,'linear')
    end

    if tag == 'exitTricky' then
        setProperty('hamster.velocity.x',-1500)
        doTweenY('hamsterExit','hamster',300,0.7,'sineIn')
        doTweenAlpha('fadeOutTitle','title',0,0.7,'linear')
    end

    if tag == 'exitBgTricky' then
        removeStage(nameStage4,true)
        setProperty('lighting1.alpha',0.001)
    end

    if tag == 'hamsterExit' then
        setProperty('hamster.alpha',0.001)
    end
end