local Particle = 0;

function precacheCharacters()
    addCharacterToList('peachtheG','dad')
    addCharacterToList('gbv2','gf')
    addCharacterToList('gbv2evil','gf')
    addCharacterToList('bfxcat','boyfriend')
    addCharacterToList('finn-sword','dad')
    addCharacterToList('finn-slash','dad')
    addCharacterToList('pibby','boyfriend')
    addCharacterToList('Limulady3','dad')
    addCharacterToList('lofigirl','boyfriend')
    addCharacterToList('missingno_perspective','dad')
    addCharacterToList('amelia','boyfriend')
    addCharacterToList('beelze-evil','dad')
    addCharacterToList('altdawn-cover','boyfriend')
    addCharacterToList('p5','dad')
    addCharacterToList('mario','boyfriend')
    addCharacterToList('sweet','boyfriend')
    addCharacterToList('girl','dad')
    addCharacterToList('boy','gf')
    addCharacterToList('denki','boyfriend')
    addCharacterToList('ruvenstain','dad')
    addCharacterToList('rayna-player','gf')
    addCharacterToList('matt-TKO','dad')
    addCharacterToList('matt-TKO-powerup','dad')
    addCharacterToList('skarlet-boxing','boyfriend')
    addCharacterToList('fakerzalgotails','dad')
    addCharacterToList('monika-pixelnew','boyfriend')
    addCharacterToList('pixelka','gf')
    addCharacterToList('sunshineExe','dad')
    addCharacterToList('Asfront','boyfriend')
    addCharacterToList('nightmare-cuphead','dad')
    addCharacterToList('acvoid','boyfriend')
end 

function onCreate()
    precacheCharacters()

end

function onUpdate(elapsed)

    if curStep == 165 then
        addLuaSprite('peachTalk1',true)
        setProperty('peachTalk1.alpha',0)
    end

    if curStep == 216 then
        doTweenAlpha('enableCoronationTalkPeach','peachTalk1',1,0.2,'linear')
    end

    if curStep == 218 then
        doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
        fadeOtherElements(0, 0.1)
    end

    if curStep == 238 then
        removeLuaSprite('peachTalk1',true)
        setProperty('boyfriend.visible',false)
        addLuaSprite('peachTalk2',true)
    end

    if curStep == 248 then
        doTweenAlpha('disableGradient','gradient',0,0.2,'linear')
    end

    if curStep == 252 then
         triggerEvent('Change Character','dad','peachtheG')
         triggerEvent('Change Character','gf','gbv2')
         triggerEvent('Change Character','boyfriend','bfxcat')
         setObjectOrder('gf',getObjectOrder('dadGroup') + 1)
         setProperty('dad.y',-4700)
         setProperty('gf.y',-4130)
         setProperty('boyfriend.y',-4250)

        setObjectOrder('bfb3',getObjectOrder('TreeHouse') + 1)
        setProperty('bfb3.visible',true)
    end

    if curStep == 255 then
       doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.3, 'linear')
       fadeOtherElements(1, 0.3)
    end 

    if curStep == 319 then
        triggerEvent('Change Character','gf','gbv2evil')
        setObjectOrder('gf',getObjectOrder('dadGroup') + 1)
        setProperty('gf.y',-4250)
    end

    if curStep == 383 then
        setObjectCamera('lava','other')
        setObjectCamera('healthBar','other')
        setObjectCamera('health','other')
        setObjectCamera('iconP1','other')
        setObjectCamera('iconP2','other')
    end

    if curStep == 402 then
        removeLuaSprite('peachTalk2',true)
        removeLuaSprite('gfIdle',true)
        removeLuaSprite('BGihy',true)
        setProperty('BgFinn.visible',true)
        triggerEvent('Change Character','dad','finn-sword')
        triggerEvent('Change Character','boyfriend','pibby')
        removeLuaSprite('bfb3',true)
    end

    if curStep == 410 then
        doTweenAlpha('enableGradient','gradient',1,2,'linear')
        doTweenY('upLava','lava',600,3,'cubeout')
        setProperty('gradient.y',-100);
    end

    if curStep == 478 then
        triggerEvent('Change Character','dad','finn-slash')
    end

    if curStep == 525 then
        doTweenY('upLava','lava',300,0.2,'cubeout')
    end

    if curStep == 528 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        doTweenY('downLava','lava',600,0.2,'cubeout')

        setProperty('gradient.y',80)

        removeLuaSprite('BgFinn',true)

        triggerEvent('Change Character','dad','Limulady3')
        triggerEvent('Change Character','boyfriend','lofigirl')
        setProperty('BgLimu.visible',true)
    end

    if curStep == 652 then
        doTweenY('upLava','lava',300,0.2,'cubeout')
    end

    if curStep == 656 then
       cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
       doTweenY('downLava','lava',600,0.2,'cubeout')

        triggerEvent('Change Character','dad','missingno_perspective')
        triggerEvent('Change Character','boyfriend','amelia')
        removeLuaSprite('BgLimu',true)
        setProperty('BgAmelia.visible',true)
    end

    if curStep == 684 then
        doTweenX('moveAmelia','boyfriend',800,0.4,'cubeout')
    end

    if curStep == 719 then
       cameraFlash('other', 'E8A2AD', 0.8)

        triggerEvent('Change Character','dad','beelze-evil')
        triggerEvent('Change Character','boyfriend','altdawn-cover')
        setProperty('BgBeelze.visible',true)
        setProperty('hellbell.visible',true)
        setProperty('pil.visible',true)

        removeLuaSprite('BgAmelia',true)
    end

    if curStep == 730 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 732 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 734 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 748 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 768 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 776 then
        objectPlayAnimation('hellbell','bong',false)
    end

    if curStep == 783 then
        removeLuaSprite('BgBeelze',true)
        removeLuaSprite('pil',true)
        removeLuaSprite('hellbell',true)

        triggerEvent('Change Character','dad','p5')
        triggerEvent('Change Character','boyfriend','mario')

        setProperty('BgMirror.visible',true)
    end

    if curStep == 844 then
        doTweenY('upLava','lava',300,0.2,'cubeout')
    end

    if curStep == 848 then
       cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
       doTweenY('downLava','lava',600,0.2,'cubeout')
       removeLuaSprite('BgMirror',true)

        triggerEvent('Change Character','dad','girl')
        triggerEvent('Change Character','boyfriend','sweet')
        triggerEvent('Change Character','gf','boy')

        setProperty('BgAfternoon.visible',true)
    end

    if curStep == 908 then
        doTweenY('upLava','lava',300,0.2,'cubeout')
    end

    if curStep == 912 then

    cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
    doTweenY('downLava','lava',600,0.2,'cubeout')

    removeLuaSprite('BgAfternoon',true)
    setProperty('BgStyle.visible',true)

    triggerEvent('Change Character','dad','ruvenstain')
    triggerEvent('Change Character','boyfriend','denki')
    triggerEvent('Change Character','gf','rayna-player')
    
    setObjectOrder('zynux',getObjectOrder('BgStyle') + 2)
    setProperty('zynux.visible',true)

    triggerEvent('Set Trail Params', 'dad', 'delay=0.075|alpha=0.6|tweenX=40|tweenY=-100|scaleX=0.85|scaleY=0.25|secs=0.50|color="FFFF00"');
    triggerEvent('Toggle Godly Trail', 'dad', 'on');
    triggerEvent('Set Trail Params', 'bf', 'delay=0.075|alpha=1|tweenX=40|tweenY=-300|scaleX=0.85|scaleY=0.55|secs=0.50|color="0711c5"');
    triggerEvent('Toggle Godly Trail', 'bf', 'on');
    triggerEvent('Set Trail Params', 'gf', 'delay=0.075|alpha=0.6|tweenX=40|tweenY=-100|scaleX=0.85|scaleY=0.55|secs=0.50|color="f688fb"');
    triggerEvent('Toggle Godly Trail', 'gf', 'on');
    triggerEvent('Set Trail Params', 'zynux', 'delay=0.075|alpha=0.5|tweenX=40|tweenY=-100|scaleX=0.85|scaleY=0.55|secs=0.50|color="86b0da"');
    triggerEvent('Toggle Godly Trail', 'zynux', 'on');
    end

    if curStep == 972 then
         doTweenY('upLava','lava',300,0.2,'cubeout')
    end

    if curStep == 976 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
       doTweenY('downLava','lava',600,0.2,'cubeout')
       setProperty('gf.visible',false)
       removeLuaSprite('BgStyle',true)
       removeLuaSprite('zynux',true)

        triggerEvent('Toggle Godly Trail', 'dad', 'off');
        triggerEvent('Toggle Godly Trail', 'bf', 'off');
        triggerEvent('Toggle Godly Trail', 'gf', 'off');
        triggerEvent('Toggle Godly Trail', 'zynux', 'off');

        setProperty('BgTKO.visible',true)
        triggerEvent('Change Character','dad','matt-TKO')
        triggerEvent('Change Character','boyfriend','skarlet-boxing');
    end

    if curStep == 1008 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        removeLuaSprite('BgTKO',true)
        setProperty('BgTKODark.visible',true)
        triggerEvent('Change Character','dad','matt-TKO-powerup')
        setProperty('aura.visible',true)
    end

    if curStep == 1103 then
        cameraFlash('other', '0xFFFFFFFF', 0.5)
        fadeOtherElements(0, 0.1)
        doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
        triggerEvent('Change Character','dad','fakerzalgotails')
        triggerEvent('Change Character','boyfriend','monika-pixelnew')
        setProperty('BgPixelClub.visible',true)
        setProperty('pixelVigenette.visible',true)
        removeLuaSprite('aura',true)

    end

    if curStep == 1231 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        setProperty('sunshine.visible',true)
        removeLuaSprite('BgPixelClub',true)
        removeLuaSprite('pixelVigenette',true)
        doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.2, 'linear')

        triggerEvent('Change Character','dad','sunshineExe')
        triggerEvent('Change Character','boyfriend','Asfront')
        triggerEvent('Change Character','gf','pixelka')

        setProperty('gf.visible',true)
        setProperty('gf.alpha',0.5)
        setProperty('lava.alpha',1)
        setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)
    end

    if curStep == 1295 then
        doTweenX('moveAsfront','boyfriend',100,0.2,'cubeout')
        doTweenX('movePxKa','gf',1050,0.2,'cubeout')
    end

    if curStep == 1341 then
        doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
        fadeOtherElements(0, 0.1)
    end

    if curStep == 1359 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        setProperty('gf.visible',false)
        doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.1, 'linear')
        fadeOtherElements(1, 0.1)

        triggerEvent('Change Character','dad','nightmare-cuphead')
        triggerEvent('Change Character','boyfriend','acvoid')

        setProperty('BgNMC.visible',true)
        removeLuaSprite('sunshine',true)
    end

    if curStep == 1469 then --KNOCKOUT
        setProperty('boyfriend.visible',false)
        addLuaSprite('voidDefeat',false)
        objectPlayAnimation('voidDefeat','stunned',true)

        addLuaSprite('knock',true)
    end

    if curStep == 1480 then
        objectPlayAnimation('voidDefeat','defeat',false)
        setProperty('voidDefeat.x',550)
        removeLuaSprite('knock',true)
    end

    if curStep == 1500 then --JUMPSCARE
        addLuaSprite('NMCupheadJump',true)
    end

    if curStep %2 == 0 then
        if getProperty('hellbell.animation.curAnim.name') == 'bong' and getProperty('hellbell.animation.curAnim.finished') then
            objectPlayAnimation('hellbell','idle',true)
        end
    end

    if curStep % 5 == 0 and curStep < 1231 then
            ParticleX = getRandomInt(-1000, 2000)
            makeAnimatedLuaSprite('particle'..Particle, 'effects/ember', ParticleX, 1400)
            addAnimationByPrefix('particle'..Particle, 'Ember', 'ember', 24, true)
            rngScroll = getRandomInt(5,10)/10;
            setScrollFactor('particle'..Particle, rngScroll, rngScroll)
            rngScale = getRandomInt(5,12)/10;
            scaleObject('particle'..Particle, rngScale, rngScale)
            setProperty('particle'..Particle..'.alpha', getRandomInt(60, 100)/100)
            setBlendMode('particle'..Particle, 'ADD')
            if getRandomInt(1,2) == 1 then addLuaSprite('particle'..Particle, true) else addLuaSprite('particle'..Particle) setObjectOrder('particle'..Particle, getObjectOrder('floor')-1) end
            TweenTime = getRandomInt(10,60)/10;
            doTweenY('particleY'..Particle, 'particle'..Particle, getProperty('particle'..Particle..'.y')-1700, TweenTime, 'linear')
            doTweenX('particleX'..Particle, 'particle'..Particle, ParticleX+getRandomInt(-600, 600), TweenTime, 'linear')
            SmallTime = getRandomInt(-30, 7)/10;
            doTweenX('particleYScale'..Particle, 'particle'..Particle..'.scale', 0.01, TweenTime-SmallTime, 'sineInOut')
            doTweenY('particleXScale'..Particle, 'particle'..Particle..'.scale', 0.01, TweenTime-SmallTime, 'sineInOut')
            Particle=Particle+1; if Particle >= 50 then Particle = 0 end
        end

    if curStep >= 1231 then
            ParticleX = getRandomInt(0, 1300)
            makeAnimatedLuaSprite('particle'..Particle, 'effects/ember', ParticleX, 770)
            addAnimationByPrefix('particle'..Particle, 'Ember', 'ember', 24, true)
            rngScale = getRandomInt(9,22)/10;
            scaleObject('particle'..Particle, rngScale, rngScale)
            setProperty('particle'..Particle..'.alpha', getRandomInt(50, 90)/100)
            setBlendMode('particle'..Particle, 'ADD')
            setObjectCamera('particle'..Particle, 'hud')
            addLuaSprite('particle'..Particle, true)
            TweenTime = getRandomInt(10,40)/10;
            doTweenY('particleY'..Particle, 'particle'..Particle, -100, TweenTime, 'linear')
            doTweenX('particleX'..Particle, 'particle'..Particle, ParticleX+getRandomInt(-200, 200), TweenTime, 'linear')
            SmallTime = getRandomInt(-20, 7)/10;
            doTweenX('particleYScale'..Particle, 'particle'..Particle..'.scale', 0.01, TweenTime-SmallTime, 'sineInOut')
            doTweenY('particleXScale'..Particle, 'particle'..Particle..'.scale', 0.01, TweenTime-SmallTime, 'sineInOut')
            Particle=Particle+1; if Particle >= 600 then Particle = 0 end
    end
end

function onTweenCompleted(tag)
    for p=0, Particle do
        if tag == 'particleY'..p then
            removeLuaSprite('particle'..p)
        end
    end
end

function onBeatHit()


    if getProperty('NMCupheadJump.animation.curAnim.name') == 'anim1' and getProperty('NMCupheadJump.animation.curAnim.finished') then
        removeLuaSprite('NMCupheadJump',true)
        doTweenAlpha('cameasdadddsds', 'camGame', 0, 0.01, 'linear')
        setProperty('lava.visible',false)
        setProperty('gradient.visible',false)
    end
    if curBeat >= 48 and curBeat <= 96 then
        triggerEvent('Add Camera Zoom','0.008','')
    end

    if curBeat >= 100 and curBeat <= 226 then
        triggerEvent('Add Camera Zoom','0.008','')
    end

    if curBeat >= 228 and curBeat <= 356 then
        triggerEvent('Add Camera Zoom','0.008','')
    end
end

function fadeOtherElements(fade, duration)
    doTweenAlpha('fade1', 'lava', fade, duration, 'linear')
    doTweenAlpha('fade2', 'healthBar', fade, duration, 'linear')
    doTweenAlpha('fade3', 'health', fade, duration, 'linear')
    doTweenAlpha('fade4', 'iconP1', fade, duration, 'linear')
    doTweenAlpha('fade5', 'iconP2', fade, duration, 'linear')
end
