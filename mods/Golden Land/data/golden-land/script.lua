function precacheCharacters()
    addCharacterToList('oswald-suicide','gf')
    addCharacterToList('suicide','dad')

    addCharacterToList('infinite-unmasked','boyfriend')
    addCharacterToList('tord-in-bot','dad')
    addCharacterToList('tankman-perspective','boyfriend')

    addCharacterToList('piracyhead','dad')
    addCharacterToList('lord-x-fp','boyfriend')
    addCharacterToList('true-fatal','gf')

    addCharacterToList('gumball','dad')
    addCharacterToList('darwin-noremote','boyfriend')

    addCharacterToList('kb','dad')
    addCharacterToList('void','boyfriend')

    addCharacterToList('gengar','gf')
    addCharacterToList('wigglesTerror','dad')
    addCharacterToList('xeno-pov','boyfriend')

    addCharacterToList('hank','dad')
    addCharacterToList('tricky','boyfriend')

    addCharacterToList('cablecrow','dad')
    addCharacterToList('Zardy','boyfriend')

    addCharacterToList('agoti','dad')
    addCharacterToList('aldryx','boyfriend')

    addCharacterToList('sarvente-demon','dad')
    addCharacterToList('ruv_remaster','boyfriend')

    addCharacterToList('omega','dad')
    addCharacterToList('peachtheG','gf')
    addCharacterToList('djmario','boyfriend')
end 

function onCreate()
    precacheCharacters()
end

function onCreatePost()
        setTextString('botplayTxt','')
    setObjectOrder('healthBar',getObjectOrder('health')-1)
end

function onUpdate(elapsed)

    if curStep == 388 then
        addLuaSprite('poemTransition',true)
        doTweenAlpha('enableBlack','black',1,1,'linear')
    end

    if curStep == 430 then
        triggerEvent('Change Character','gf','oswald-suicide')
        triggerEvent('Change Character','dad','suicide')
        triggerEvent('Change Character','boyfriend','infinite-unmasked')

        removeLuaSprite('BgMonika',true)
        addLuaSprite('BgMickey',false)
    end

    if curStep == 446 then
         cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
         setProperty('black.alpha',0)
    end

    if curStep == 576 then
        addLuaSprite('explosionTransition',true)
        triggerEvent('Change Character','dad','tord-in-bot')
        triggerEvent('Change Character','boyfriend','tankman-perspective')
        setProperty('gf.visible',false)

        addLuaSprite('BgTord',false)
        removeLuaSprite('BgMickey',true)
    end

    if curStep == 635 then
        doTweenX('enterTankmanX','boyfriend',1000,0.5,'cubeout')
        doTweenY('enterTankmanY','boyfriend',130,0.5,'cubeout')
    end

    if curStep == 716 then
        removeLuaSprite('BgTord',false)

        triggerEvent('Change Character','gf','true-fatal')
        triggerEvent('Change Character','dad','piracyhead')
        triggerEvent('Change Character','boyfriend','lord-x-fp')

        setProperty('boyfriend.visible',false)
        setProperty('gf.visible',false)
        setProperty('gf.flipY',true)
        
        setObjectOrder('dad',getObjectOrder('boyfriendGroup') + 1 )
        setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 2 )
    end

    if curStep == 721 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
    end

    if curStep == 740 then
        setProperty('boyfriend.visible',true)
        characterPlayAnim('boyfriend','entrance', true)
        doTweenX('movePiracyHead','dad',getProperty('dad.x') - 100, 0.1,'cubeout')
    end

    if curStep == 780 then
        setProperty('gf.visible',true)
        doTweenY('moveDownFatalError','gf',getProperty('gf.y') + 250, 0.4 , 'cubeout')
    end

    if curStep == 848 then
        setProperty('gf.flipY',false)
        setProperty('gf.visible',false)

        setObjectOrder('dad',getObjectOrder('boyfriendGroup') - 1 )
        setObjectOrder('gf',getObjectOrder('boyfriendGroup') - 2 )

        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)

        triggerEvent('Change Character','dad','gumball')
        triggerEvent('Change Character','boyfriend','darwin-noremote')

        addLuaSprite('BgSchool1',false)
        addLuaSprite('BgSchool2',true)
        addLuaSprite('vigenetteGlitch',true)
    end

    if curStep == 909 then
        objectPlayAnimation('attack', 'fire', true)
        addLuaSprite('attack', false);
    end

    if curStep == 912 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
        removeLuaSprite('BgSchool1',false)
        removeLuaSprite('BgSchool2',true)
        removeLuaSprite('vigenetteGlitch',true)

        triggerEvent('Change Character','dad','kb')
        triggerEvent('Change Character','boyfriend','void')

        setProperty('BGSpaceVoid.visible',true)
        setProperty('BGPublicVoid.visible',true)
        setProperty('FGSpaceVoid.visible',true)


    end

    if curStep == 975 then

        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)

        removeLuaSprite('BGSpaceVoid',true)
        removeLuaSprite('BGPublicVoid',true)
        removeLuaSprite('FGSpaceVoid',true)

        triggerEvent('Change Character','dad','hank')
        triggerEvent('Change Character','boyfriend','tricky')

        addLuaSprite('BgTricky',false)
    end

    if curStep == 1007 then

        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
        triggerEvent('Change Character','dad','cablecrow')
        triggerEvent('Change Character','boyfriend','Zardy')

        removeLuaSprite('BgTricky',true)
        setProperty('BgMaze.visible',true)
    end

    if curStep == 1039 then

        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
        triggerEvent('Change Character','dad','agoti')
        triggerEvent('Change Character','boyfriend','aldryx')
        removeLuaSprite('BgMaze',false)
        addLuaSprite('BgAldryx',false)
    end

    if curStep == 1071 then

        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
        triggerEvent('Change Character','dad','sarvente-demon')
        triggerEvent('Change Character','boyfriend','ruv_remaster')

        removeLuaSprite('BgAldryx',true)
        addLuaSprite('BgSarvente',false)
    end

    if curStep == 1104 then
        addLuaSprite('wigglesJumpscare',true)
        triggerEvent('Screen Shake','1.3, 0.05','1.3, 0.015');
        setProperty('iconP1.visible',false)
        setProperty('iconP2.visible',false)
        setProperty('camGame.alpha',0)
    end

    if curStep == 1120 then
        removeLuaSprite('wigglesJumpscare',true)
        setProperty('iconP1.visible',true)
        setProperty('iconP2.visible',true)
        setProperty('camGame.alpha',1)

        setProperty('gf.visible',true)
        removeLuaSprite('BgSarvente',true)

        addLuaSprite('static-overlay',false)

        triggerEvent('Change Character','dad','wigglesTerror')
        triggerEvent('Change Character','gf','gengar')
        triggerEvent('Change Character','boyfriend','xeno-pov')

        addLuaSprite('BgAmusia',false)
    end

    if curStep == 1247 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.25)
        removeLuaSprite('static-overlay',true)
        removeLuaSprite('BgAmusia',true)
        triggerEvent('Change Character','dad','omega')
        triggerEvent('Change Character','gf','peachtheG')
        triggerEvent('Change Character','boyfriend','djmario')

        setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)

        addLuaSprite('BgAct2Static',false)
        addLuaSprite('BgAct2FG',false)
        setObjectOrder('BgAct2FG',getObjectOrder('dadGroup') + 1)
    end

    if curStep == 1308 then

        addLuaSprite('PipeL',true)
        addLuaSprite('PipeW',true)
        addLuaSprite('PipeY',true)

        addLuaSprite('luigi',true)
        addLuaSprite('wario',true)
        addLuaSprite('yoshi',true)

        doTweenX('enterPeachCoronation','gf',getProperty('gf.x') - 550,0.5,'cubeout')
        doTweenX('enterDjHX','boyfriend',getProperty('boyfriend.x') + 300 ,0.5,'cubeout')
        doTweenY('enterDjHY','boyfriend',getProperty('boyfriend.y') - 350 ,0.5,'cubeout')

    end

    if curStep == 1380 then
        doTweenX('leavePeachCoronation','gf',getProperty('gf.x') + 550,0.5,'cubeout')
        doTweenX('leaveDjHX','boyfriend',getProperty('boyfriend.x') - 300 ,0.5,'cubeout')
        doTweenY('leaveDjHY','boyfriend',getProperty('boyfriend.y') + 350 ,0.5,'cubeout')

        runHaxeCode([[game.iconP1.changeIcon('trio');]]);
        doTweenY('enterPipeL','PipeL',-600,0.2,'cubeout')
        doTweenY('enterLuigi','luigi',-200,0.2,'cubeout')
    end

    if curStep == 1392 then
        doTweenY('enterPipeW','PipeW',-500,0.2,'cubeout')
        doTweenY('enterWario','wario',-100,0.2,'cubeout')
    end

    if curStep == 1408 then
        doTweenY('enterPipey','PipeY',-500,0.2,'cubeout')
        doTweenY('enterYoshi','yoshi',-50,0.2,'cubeout')
    end

    if curStep == 1456 then
         doTweenY('leavePipeL','PipeL',400,0.3,'cubeout')
         doTweenY('leavePipeW','PipeW',500,0.3,'cubeout')
         doTweenY('leavePipey','PipeY',500,0.3,'cubeout')

        doTweenY('leaveLuigi','luigi',1000,0.3,'cubeout')
        doTweenY('leaveWario','wario',1000,0.3,'cubeout')
        doTweenY('leaveYoshi','yoshi',1000,0.3,'cubeout')
    end

    if curStep == 1503 then
        setProperty('camGame.alpha',0)
    end

    if getProperty('poemTransition.animation.curAnim.name') == 'anim1' and getProperty('poemTransition.animation.curAnim.finished') then
        removeLuaSprite('poemTransition')
    end

    if getProperty('explosionTransition.animation.curAnim.name') == 'anim' and getProperty('explosionTransition.animation.curAnim.finished') then
        removeLuaSprite('explosionTransition',true)
    end


end