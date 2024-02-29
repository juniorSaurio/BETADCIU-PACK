function preloadCharacters()
    addCharacterToList('bfASsad', 'gf')
    addCharacterToList('pico', 'bf')

    addCharacterToList('sunshineExe','dad')
    addCharacterToList('stanley','boyfriend')
    

    addCharacterToList('secretmario','dad')
    addCharacterToList('sonic-tsh','boyfriend')
    addCharacterToList('tails-m', 'gf')

    addCharacterToList('mario_ultra1','dad')
    addCharacterToList('gfplayable','boyfriend')

    addCharacterToList('omega','dad')
    addCharacterToList('cold-gold','boyfriend')
    addCharacterToList('missingno_perspective','gf')

    addCharacterToList('uzizombie','dad')
    addCharacterToList('lectro_playable','boyfriend')

    addCharacterToList('pixelka','dad')
    addCharacterToList('fsayori3d','boyfriend')
    addCharacterToList('spooky','gf')

    addCharacterToList('spookyrc','dad')
    addCharacterToList('kirby','boyfriend')

    addCharacterToList('red-hijinks','dad')
    addCharacterToList('hgray-hijinks','gf')
    addCharacterToList('Red','boyfriend')

    addCharacterToList('may','dad')
    addCharacterToList('sink','gf')
    addCharacterToList('luigireal','boyfriend')

    addCharacterToList('Furnace','dad')
    addCharacterToList('fleetway','gf')
    addCharacterToList('bf-running-sonic','boyfriend')

    addCharacterToList('black-run','dad')
    addCharacterToList('1bendyrun','gf')
    addCharacterToList('melody','boyfriend')

end

function onCreate()
    preloadCharacters()
end

function onUpdate()

    if curStep == 268 then
        doTweenAlpha('disableBF','boyfriend',0,0.5,'linear')
        doTweenAlpha('disableGF','gf',0,0.5,'linear')
        doTweenAlpha('disableCar','car',0,0.5,'linear')
        doTweenAlpha('disableBg1','BackTrees',0,0.5,'linear')
        doTweenAlpha('disableBg2','Front Trees',0,0.5,'linear')
        doTweenAlpha('disableBg3','Foreground Trees',0,0.5,'linear')
        doTweenAlpha('disableRoadRoad','Road',0,0.5,'linear')
    end

    if curStep == 279 then
        doTweenAlpha('disableFakeMario','fake_mario',0,0.15,'linear')
    end

    if curStep == 281 then
        setProperty('MxTransform.visible',true)
        addAnimationByPrefix('MxTransform','transform','MX Transformation',24,false)
        doTweenAlpha('Ared','redShilouette',0.5,0.1,'linear')

        removeLuaSprite('fake_mario',true)
    end

    if curStep == 284 then
        doTweenAlpha('Ared','redShilouette',0.5,0.1,'linear')
    end

    if curStep == 287 then
        doTweenAlpha('Ared','redShilouette',0.5,0.1,'linear')
    end

    if curStep == 293 then
        setProperty('wahooo.visible',true)
    end

    if curStep == 303 then
        triggerEvent('Change Character','gf','bfASsad')
        triggerEvent('Change Character','bf','pico')

        removeLuaSprite('MxTransform',true)
        removeLuaSprite('wahooo',true)

        setProperty('mx.visible',true)

        doTweenAlpha('enableBF','boyfriend',1,0.5,'linear')
        doTweenAlpha('enableGF','gf',1,0.5,'linear')
        doTweenAlpha('enableCar','car',1,0.5,'linear')
        doTweenAlpha('enableBg1','BackTrees',1,0.5,'linear')
        doTweenAlpha('enableBg2','Front Trees',1,0.5,'linear')
        doTweenAlpha('enableBg3','Foreground Trees',1,0.5,'linear')
        doTweenAlpha('enableRoadRoad','Road',1,0.5,'linear')
    end

    if curStep == 425 then
        triggerEvent('Play Animation', 'singDOWNmiss', 'bf')
        triggerEvent('Play Animation', 'singDOWNmiss', 'gf')
    end

    if curStep == 495 then
        triggerEvent('Change Character','boyfriend','stanley')
        setProperty('boyfriend.x',1800)
        setProperty('BGPromo.visible',true)
        setProperty('lighting1.visible',true)

        doTweenX('enterStanley','boyfriend',1200,0.3,'cubeInOut')
        doTweenX('enterBGPromo','BGPromo',700,0.3,'cubeInOut')
        doTweenX('entereffect1','lighting1',550,0.3,'cubeInOut')

        removeLuaSprite('Road',true)
        removeLuaSprite('car',true)
    end

    if curStep == 539 then
        setProperty('camGame.visible',false)
        setProperty('FlashEyes.visible',true)
    end

    if curStep == 560 then
        setProperty('camGame.visible',true)
        setProperty('BgSecret.visible',true)

        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        
        removeLuaSprite('FlashEyes',true)
        removeLuaSprite('BGPromo',true)
        removeLuaSprite('lighting1',true)
        removeLuaSprite('mx',true)

        triggerEvent('Change Character','dad','secretmario')
        triggerEvent('Change Character','boyfriend','sonic-tsh')
        triggerEvent('Change Character','gf','tails-m')

        setProperty('iconP1.visible',true)
        setProperty('iconP2.visible',true)
        setProperty('healthBar.visible',true)
        setProperty('Health.visible',true)
    end

    if curStep == 805 then
        triggerEvent('Play Animation', 'boton', 'dad')
    end

    if curStep == 813 then
        addAnimationByPrefix('explosionSecret','explosion','1',24,false)
        setProperty('explosionSecret.visible',true)
    end

    if curStep == 816 then
        removeLuaSprite('BgSecret',true)
        setProperty('staticAct1.visible',true)
        setProperty('BgAct1.visible',true)
        setProperty('gf.visible',false)

        triggerEvent('Change Character','dad','mario_ultra1')
        triggerEvent('Change Character','boyfriend','gfplayable')
    end

    if curStep == 1054 then 
        removeLuaSprite('staticAct1', true)
        removeLuaSprite('BgAct1', true)
        
        setProperty('boyfriend.visible',false)
        setProperty('dad.visible',false)
    end

    if curStep == 1056 then
        addAnimationByPrefix('introAct2-1','gf','Anim1',24,false)
        setProperty('introAct2-1.visible',true)
        doTweenAlpha('disapearGF','introAct2-1',0,1,'linear')

        doTweenAlpha('AppearEyes','introAct2-2',1,1,'linear')
        doTweenY('upEyes','introAct2-2',100,1,'cubeInOut')
    end

    if curStep == 1060 then
        addAnimationByPrefix('introAct2-2','eyes','EyesBG',24,false)
        setProperty('introAct2-2.visible',true)
    end

    if curStep == 1072 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        removeLuaSprite('introAct2-2',true)

        setProperty('boyfriend.visible',true)
        setProperty('dad.visible',true)
        setProperty('gf.visible',true)

        triggerEvent('Change Character','dad','omega')
        triggerEvent('Change Character','boyfriend','cold-gold')
        triggerEvent('Change Character','gf','missingno_perspective')

        setProperty('BgAct2Static.visible',true)
        setProperty('BgAct2FG.visible',true)
        setObjectOrder('BgAct2FG',getObjectOrder('dadGroup') + 1)
        setObjectOrder('boyfriend',getObjectOrder('wario') + 2)
        setObjectOrder('gf',getObjectOrder('yoshi') + 2)

        setProperty('boyfriend.x',-1400)
        setProperty('boyfriend.y',2200)

        setProperty('gf.x',400)
        setProperty('gf.y',2000)
    end

    if curStep == 1134 then
        doTweenY('upCold','boyfriend',1100,0.3,'cubeInOut')
    end

    if curStep == 1164 then
        runHaxeCode([[game.iconP1.changeIcon('duo-gold');]]);
        doTweenY('upMissingno','gf',900,0.3,'cubeInOut')
    end

    if curStep == 1198 then

        setProperty('PipeL.visible',true)
        setProperty('PipeW.visible',true)
        setProperty('PipeY.visible',true)

        setProperty('wario.visible',true)
        setProperty('yoshi.visible',true)
        setProperty('luigi.visible',true)

        runHaxeCode([[game.iconP2.changeIcon('exe-trio');]]);
        doTweenY('enterPipeL','PipeL',0,0.3,'cubeInOut')
        doTweenY('enterLuigi','luigi',400,0.2,'cubeInOut')

        doTweenY('enterPipeW','PipeW',100,0.3,'cubeInOut')
        doTweenY('enterWario','wario',500,0.2,'cubeInOut')

        doTweenY('enterPipey','PipeY',100,0.3,'cubeInOut')
        doTweenY('enterYoshi','yoshi',550,0.2,'cubeInOut')
    end

    if curStep == 1256 then
        doTweenAlpha('disableCamGame','camGame',0,0.5,'linear')
    end

    if curStep == 1264 then
        removeLuaSprite('PipeY',true)
        removeLuaSprite('PipeW',true)
        removeLuaSprite('PipeL',true)

        removeLuaSprite('yoshi',true)
        removeLuaSprite('wario',true)
        removeLuaSprite('luigi',true)

        removeLuaSprite('BgAct2Static',true)
        removeLuaSprite('BgAct2FG',true)
        removeLuaSprite('wario',true)

        setProperty('gf.visible',false)

        addAnimationByPrefix('uzyTransition','idle','idle',18,false)
        setProperty('uzyTransition.visible',true)
    end

    if curStep == 1280 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        setProperty('camGame.alpha',1)
        removeLuaSprite('uzyTransition',true)

        triggerEvent('Change Character','dad','uzizombie')
        triggerEvent('Change Character','boyfriend','lectro_playable')

        setProperty('BgUzi.visible',true)
        setProperty('blueGradient.visible',true)
    end

    if curStep == 1392 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgUzi',true)
        removeLuaSprite('blueGradient',true)

        
        triggerEvent('Change Character','dad','pixelka')
        triggerEvent('Change Character','boyfriend','fsayori3d')
        triggerEvent('Change Character','gf','spooky')

        setProperty('gf.visible',true)
        setProperty('gf.y',1500)
        setProperty('boyfriend.y',1500)
        setProperty('BgMonika.visible',true)

        setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 3)
    end

    if curStep == 1454 then
        doTweenY('upSayori','boyfriend',450,0.3,'cubeInOut')
    end

    if curStep == 1472 then
        triggerEvent('Play Animation', 'talk', 'gf')
    end

    if curStep == 1498 then
        doTweenY('upSpooky','gf',300,0.3,'cubeInOut')
    end

    if curStep == 1520 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgMonika',true)
        setProperty('BgMansion.visible',true)
        setProperty('gf.visible',false)

        addAnimationByPrefix('line','idle','line',24,true)
        setProperty('line.visible',true)

        triggerEvent('Change Character','dad','spookyrc')
        triggerEvent('Change Character','boyfriend','kirby')
    end

    if curStep == 1654 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgMansion',true)
        removeLuaSprite('line',true)
        setProperty('gf.visible',true)

        setProperty('BgImpostor.visible',true)
        triggerEvent('Change Character','dad','red-hijinks')
        triggerEvent('Change Character','boyfriend','Red')
        triggerEvent('Change Character','gf','hgray-hijinks')
        setProperty('hgray.visible',true)
    end

    if curStep == 1904 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgImpostor',true)
        removeLuaSprite('hgray',true)

        setProperty('BgSink.visible',true)
        setProperty('FloorSink.visible',true)

        triggerEvent('Change Character','dad','may')
        triggerEvent('Change Character','boyfriend','luigireal')
        triggerEvent('Change Character','gf','sink')
        setProperty('ben_drowned.visible',true)

        setObjectOrder('gf',getObjectOrder('FloorSink')+1)
        setObjectOrder('ben_drowned',getObjectOrder('FloorSink')+1)
    end

    if curStep == 2148 then
        triggerEvent('Change Character','gf','fleetway')
        setProperty('gf.y',1500)
        doTweenY('upFleetway','gf',400,0.3,'cubeInOut')
    end

    if curStep == 2158 then
        triggerEvent('Play Animation', 'laugh', 'gf')
    end

    if curStep == 2168 then
        triggerEvent('Play Animation', 'laser', 'gf')
    end

    if curStep == 2174 then
        doTweenX('leftFleetway','gf',getProperty('gf.x')-700,0.3,'cubeInOut')
    end

    if curStep == 2176 then
        cameraFlash('camGame', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgSink',true)
        removeLuaSprite('FloorSink',true)
        removeLuaSprite('ben_drowned',true)

        triggerEvent('Change Character','boyfriend','bf-running-sonic')
        triggerEvent('Change Character','dad','Furnace')
        setProperty('dad.x',-1500)
    end

    if curStep == 2302 then
        doTweenX('rightFurnace','dad',200,0.3,'cubeInOut')
        setProperty('pixel_blue.visible',true)
        doTweenX('rightBlue','pixel_blue',750,5,'linear')
    end

    if curStep == 2432 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('pixel_blue',true)

        setProperty('BgBlack.visible',true)
        doTweenX('backStageBlack','BgBlack',-3000,40,'linear')

        setProperty('plataform.visible',true)
        addAnimationByPrefix('plataform','idle','skate relol',24,true)

        triggerEvent('Change Character','boyfriend','melody')
        triggerEvent('Change Character','dad','black-run')
        triggerEvent('Change Character','gf','1bendyrun')
        setProperty('gf.x',-2000)
        setProperty('legs.visible',true)
        setObjectOrder('legs',getObjectOrder('dadGroup') - 1)
        addAnimationByPrefix('legs','idle','legs',48,true)

        setProperty('iconP1.visible',false)
        setProperty('iconP2.visible',false)
        setProperty('healthBar.visible',false)
        setProperty('Health.visible',false)

    end

    if curStep == 2490 then -- BENDY
        doTweenX('enterBendy','gf',0,1,'linear')
    end

    if curStep == 2560 then --ALIEN
        doTweenX('enterAlien','alien',850,0.3,'linear')
        setProperty('alien.visible',true)
    end

    if curStep == 2568 then
        triggerEvent('Play Animation', 'idle', 'gf')
    end

    if curStep == 2574 then --SONIC
        doTweenX('enterSonic','sonic_exe',500,0.5,'linear')
        setProperty('sonic_exe.visible',true)
    end

    if curStep == 2608 then --PONMY
        

    end

    if curStep == 2720 then
        cameraFlash('camHUD', 'FA3232', 0.3)
        setProperty('camGame.visible',false)

    end


    if getProperty('explosionSecret.animation.curAnim.name') == 'explosion' and getProperty('explosionSecret.animation.curAnim.finished') then
        removeLuaSprite('explosionSecret',true)
        cameraFlash('camHUD', '0xFFFFFFFF', 0.1)
    end

    if getProperty('introAct2-1.animation.curAnim.name') == 'gf' and getProperty('introAct2-1.animation.curAnim.finished') then
        cancelTween('disapearGF')
        removeLuaSprite('introAct2-1',true)
    end
end

function onTweenCompleted(tag)

    if tag == 'Ared' then
        doTweenAlpha('Bred','redShilouette',0,0.1,'linear')
    end
end