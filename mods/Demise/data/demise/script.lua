function precacheCharacters()
    addCharacterToList('xenoholding','dad')
    addCharacterToList('mario_ultra2','boyfriend')

    addCharacterToList('mrSYS','dad')
    addCharacterToList('nikku-3d','boyfriend')
    addCharacterToList('tailsdoll2','gf')

    addCharacterToList('glitchy-red-mad','dad')
    addCharacterToList('blue-sport','boyfriend')
    addCharacterToList('gengar','gf')

    addCharacterToList('sayori','dad')
    addCharacterToList('sadsayo','dad')
    addCharacterToList('sayopoem','dad')
    addCharacterToList('anti_piracy','dad')

    addCharacterToList('agoti','boyfriend')
    addCharacterToList('aldryx','boyfriend')
    addCharacterToList('niku','boyfriend')
    addCharacterToList('sol','boyfriend')

    addCharacterToList('agoti-gf','gf')
    addCharacterToList('niku-dad','dad')

    addCharacterToList('Green_Imposter','boyfriend')
    addCharacterToList('Maroon','gf')
    addCharacterToList('Monotone_Green_Parasite','boyfriend')
    addCharacterToList('Maroon_Parasite','gf')

    addCharacterToList('luigi-ihy-new2','dad')
    addCharacterToList('mario-prequel','boyfriend')

    addCharacterToList('libitina','dad')
    addCharacterToList('sansNightmare','boyfriend')
    addCharacterToList('nightmare-bendy','gf')
end 

function onCreate()
    precacheCharacters()
    startVideo('demise_cutscene')
end

function onCreatePost()
    setProperty('inCutscene', false);
end


function onUpdate(elapsed)

    if curStep == 192 then
        cameraFlash('other', '370802', 0.5)

    end

    if curStep == 310 then
        doTweenX('moveBendy','bendy_run',900,1,'cubeout')
        runHaxeCode([[game.iconP2.changeIcon('MX-bendy')]]);
    end

    if curStep == 432 then
        doTweenAlpha('fadeFloor','DemiseFloor',0,1,'linear')
        doTweenAlpha('fadeBendy','bendy_run',0,1,'linear')
    end

    if curStep == 440 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        addLuaSprite('bfGrab',false)
        setProperty('boyfriend.visible',false)
        removeLuaSprite('bendy_run',true)
    end

    if curStep == 448 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

        triggerEvent('Change Character','dad','xenoholding')
        setProperty('dad.alpha',1)
        setProperty('dad.x',450)
        triggerEvent('Change Character','boyfriend','mario_ultra2')
        setProperty('boyfriend.visible',true)
        setObjectOrder('dad',getObjectOrder('boyfriendGroup') + 1)

        removeLuaSprite('bfGrab',true)
        addLuaSprite('bfSaster',true)
        setProperty('static.visible',true)
    end

    if curStep == 576 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

        removeLuaSprite('static',true)
        removeLuaSprite('bfSaster',true)
        triggerEvent('Change Character','dad','mrSYS')
        triggerEvent('Change Character','boyfriend','nikku-3d')
        triggerEvent('Change Character','gf','tailsdoll2')

        setProperty('gf.alpha',1)
        setProperty('gf.y',1000)

        setProperty('dad.x',-100)

        setProperty('boyfriend.x',700)
        setProperty('boyfriend.y',500)

        setProperty('bgBar.visible',true)
        setProperty('bgBar.angle', 35)
        startTween('bgBarSTupidTweenX', 'bgBar', {x = -800}, 7, {type = "PINGPONG"})
        startTween('bgBarSTupidTweenY', 'bgBar', {y = -800}, 8, {type = "PINGPONG"})
        startTween('bgBarSTupidTweenAngle', 'bgBar', {angle = -35}, 9, {type = "PINGPONG"})
    end

    if curStep == 570 then
        addLuaSprite('glitchRedDialog',false)
    end

    if curStep == 630 then
        doTweenY('moveTailsDoll','gf',450,1,'CircInOut')
        doTweenY('moveMatzu','matzushi',200,1,'CircInOut')
    end

    if curStep == 678 then
        doTweenAlpha('appearDialogRedGlitch','glitchRedDialog',0.7,0.2,'linear')
    end

    if curStep == 703 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

        cancelTween('bgBarSTupidTweenX')
        cancelTween('bgBarSTupidTweenAngle')
        cancelTween('bgBarSTupidTweenY')

        removeLuaSprite('bgBar',true);
        removeLuaSprite('matzushi',true);
        removeLuaSprite('glitchRedDialog',true)

        setProperty('gf.visible',false)

        triggerEvent('Change Character','dad','glitchy-red-mad')
        triggerEvent('Change Character','boyfriend','blue-sport')
        triggerEvent('Change Character','gf','gengar')

        setProperty('BgGlitchRed.visible',true)

        setProperty('dad.x',400)
        setProperty('gf.x',900)
    end

    if curStep == 745 then
        addLuaSprite('enterGengar',true)
    end

    if curStep == 767 then
        runHaxeCode([[game.iconP2.changeIcon('glitchy-red-gengar')]]);
        cameraFlash('camHUD', '0xFFFFFFFF', 0.1)
        removeLuaSprite('enterGengar',true)
        setProperty('gf.visible',true)
        setObjectOrder('gf',getObjectOrder('dadGroup') - 1);
    end

    if curStep == 832 then
        cameraFlash('other', '0xFFFFFFFF', 0.2)

        removeLuaSprite('BgGlitchRed',true)
        setProperty('boyfriend.visible',false)
        setProperty('gf.visible',false)

        setProperty('camHUD.visible',false)
        setProperty('health.visible',false)

        triggerEvent('Change Character','dad','sayori')
        setProperty('dad.x',180)
        setProperty('dad.y',180)

        setProperty('BgDDLC.visible',true)
    end

    if curStep == 848 then
        cameraFlash('other', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','dad','sadsayo')
        setProperty('dad.x',400)

        removeLuaSprite('BgDDLC',true)
        setProperty('BgBrokenClub.visible',true)
    end

    if curStep == 864 then
        cameraFlash('other', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','dad','sayopoem')
        setProperty('dad.x',200)
        setProperty('dad.y',180)

        setProperty('BgPaper.visible',true)

        removeLuaSprite('BgBrokenClub',true)
    end

    if curStep == 888 then --ERROR SCREEN
        removeLuaSprite('BgPaper',true)
        addLuaSprite('piracyError', true);
    end

    if curStep == 896 then
        removeLuaSprite('piracyError',true)
        triggerEvent('Change Character','dad','anti_piracy')
        setProperty('dad.x',50)
        setProperty('dad.y',-200)

         setProperty('BgPiracy.visible',true)
    end

    if curStep == 959 then
        removeLuaSprite('BgPiracy',true)
        setProperty('dad.visible',false)
        setProperty('boyfriend.visible',true)

        cameraFlash('other', '0xFFFFFFFF', 0.1)
        triggerEvent('Change Character','boyfriend','agoti')
        setProperty('BgAgoti.visible',true)
        setProperty('camHUD.visible',false)
    end

    if curStep == 968 then
        cameraFlash('other', '0xFFFFFFFF', 0.1)
        triggerEvent('Change Character','boyfriend','aldryx')

        removeLuaSprite('BgAgoti',true)
        setProperty('BgAldryx.visible',true)
    end

    if curStep == 976 then
        cameraFlash('other', '0xFFFFFFFF', 0.1)
        triggerEvent('Change Character','boyfriend','niku')
        removeLuaSprite('BgAldryx',true)
        setProperty('BgNikusa.visible',true)
    end

    if curStep == 992 then
        cameraFlash('other', '0xFFFFFFFF', 0.1)
        triggerEvent('Change Character','boyfriend','sol')
        removeLuaSprite('BgNikusa',true)
        setProperty('BgSol.visible',true)
    end

    if curStep == 1008 then  --ALL ENTITIES
        cameraFlash('other', '0xFFFFFFFF', 0.2)

        setProperty('BgEntity.visible',true)
        removeLuaSprite('BgSol',true)

        setProperty('dad.visible',true)

        triggerEvent('Change Character','dad','niku-dad')
        setProperty('dad.x',2200)

        triggerEvent('Change Character','gf','agoti-gf')
        setProperty('gf.x',-1000)

        setProperty('aldryx.visible',true)
    end

    if curStep == 1024 then

        setProperty('dad.visible',false)
        removeLuaSprite('aldryx',true)

        cameraFlash('other', '0xFFFFFFFF', 0.2)
        removeLuaSprite('BgEntity',true)
        setProperty('BgImpostor.visible',true)

        triggerEvent('Change Character','boyfriend','Green_Imposter')
        setProperty('boyfriend.x',500)

        triggerEvent('Change Character','gf','Maroon')
        setProperty('gf.x',-400)
    end

    if curStep == 1040 then --PARASITE
        cameraFlash('other', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','boyfriend','Monotone_Green_Parasite')
        setProperty('boyfriend.x',400)

        triggerEvent('Change Character','gf','Maroon_Parasite')
        setProperty('gf.x',-400)
    end

    if curStep == 1056 then  --luigi lmao
        addLuaSprite('luigiOGN',true)
        doTweenAlpha('appearLuigi','luigiOGN',1,1,'linear')
        doTweenAlpha('fadeBGParasite','BgImpostor',0,1,'linear')
        doTweenAlpha('fadeMitori','boyfriend',0,1,'linear')
        doTweenAlpha('fadeMaroon','gf',0,1,'linear')
    end

    if curStep == 1088 then
        cameraFlash('other', '0xFFFFFFFF', 0.2)

        setProperty('boyfriend.alpha',1)
        setProperty('dad.visible',true)
        setProperty('dad.alpha',1)

        removeLuaSprite('luigiOGN',true)
        removeLuaSprite('BgImpostor',true)

        setProperty('camHUD.visible',true)
        setProperty('health.visible',true)

        triggerEvent('Change Character','boyfriend','mario-prequel')
        setProperty('boyfriend.x',800)
        triggerEvent('Change Character','dad','luigi-ihy-new2')
        setProperty('dad.x',-150)
        setProperty('BGihy.visible',true)
    end

    if curStep == 1152 then
        removeLuaSprite('BGihy',true)
        setProperty('BgWindow.visible',true)

        cameraFlash('other', '0xFFFFFFFF', 0.1)
        triggerEvent('Change Character','dad','libitina')
        setProperty('dad.x',100)
        setProperty('dad.y',-1500)

        setProperty('nigthmare-cuphead.visible',true)

        triggerEvent('Change Character','boyfriend','sansNightmare')
        setProperty('boyfriend.x',800)

        triggerEvent('Change Character','gf','nightmare-bendy')
        setProperty('gf.alpha',1)
        setProperty('gf.visible',true)
        setProperty('gf.x',0)

        setObjectOrder('iconP1',getObjectOrder('iconP2') + 1)
    end

    if curStep == 1202 then
        setProperty('NMBendyJump.visible',true)
        objectPlayAnimation('NMBendyJump','anim1',false)
    end

    if curStep == 1203 then
        setProperty('NMSansJump.visible',true)
        objectPlayAnimation('NMSansJump','anim1',false)
    end

    if curStep == 1204 then
        setProperty('NMCupheadJump.visible',true)
        objectPlayAnimation('NMCupheadJump','anim1',false)
    end

    if curStep == 1215 then
        cameraFlash('other', '370802', 1)

        setProperty('camHUD.visible',false)
        setProperty('camGame.visible',false)
    end
end


function setCamFilters()
    if shadersEnabled then

        initLuaShader('tvcrt')

        if not luaSpriteExists('shaderImage') then
            makeLuaSprite('shaderImage')
            makeGraphic('shaderImage', screenWidth, screenHeight)
            setSpriteShader('shaderImage', 'tvcrt')
        end
        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
            ]])
    end
end

function removeCamFilter(cam)
    if shadersEnabled then
        if luaSpriteExists('shaderImage') then
            removeLuaSprite('shaderImage')
        end
        runHaxeCode('game.'..cam..'.setFilters(null);') 
        if luaDebugMode then
            debugPrint('removeCamFilter : Shader successfully removed from the camera "'..cam..'"')
        end
    end
end