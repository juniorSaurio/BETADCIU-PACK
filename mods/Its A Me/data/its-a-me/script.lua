local pt1 = true;
local pt2 = true;

function precacheCharacters()

    if pt1 then
    addCharacterToList('satan-chad','dad')
    addCharacterToList('julian-excited','boyfriend')

    addCharacterToList('black2','dad')
    addCharacterToList('turmoil1','boyfriend')

    addCharacterToList('luigi_fountain','dad')
    addCharacterToList('kuromi','boyfriend')

    addCharacterToList('donald','dad')
    addCharacterToList('GF-Phase-3-Stand','boyfriend')
    addCharacterToList('taeyaitps','gf')

    addCharacterToList('Starbucks_Fly','dad')
    addCharacterToList('Casanova-BikeBad2','boyfriend')

    addCharacterToList('googleSonic','dad')
    addCharacterToList('Hyper','boyfriend')

    addCharacterToList('fleetway','dad')
    addCharacterToList('fleetway-anims1','dad')
    addCharacterToList('lunatic','boyfriend')
    end

    if pt2 then
    addCharacterToList('omega-flowey','dad')
    addCharacterToList('cara','boyfriend')
    addCharacterToList('flowey','gf')

    addCharacterToList('finncawn2','boyfriend')
    addCharacterToList('UT-Sans','dad')

    addCharacterToList('secretmario','dad')
    addCharacterToList('mrSYSwb','boyfriend')
    addCharacterToList('hunter','gf')

    addCharacterToList('tailsdoll2','dad')
    addCharacterToList('wariov2','boyfriend')

    addCharacterToList('bigmonika-dress','gf')
    addCharacterToList('torrent','boyfriend')

    addCharacterToList('nitro','gf')
    addCharacterToList('maelstrom','dad')
    addCharacterToList('gold','boyfriend')

    addCharacterToList('holy-mami','dad')
    addCharacterToList('acvoid','boyfriend')
    end
end 

function onCreate()
    precacheCharacters()
end


function onUpdate(elapsed)


    if curStep == 2 then
    end

    if pt1 then

    if curStep == 270 then  --ANIMATE TRANSITION SATAN
        addAnimationByPrefix('satanTransition', 'anim1', 'SATAN LAUGH SCREEN', 24, false)
        setProperty('satanTransition.visible',true)
    end

    if curStep == 285 then -- SATAN VS JULIAN
        setProperty('BgSatan.visible',true)
        setProperty('gf.visible',false)
        removeLuaSprite('castle',true)
        removeLuaSprite('ground',true)
        removeLuaSprite('blocks',true)
        removeLuaSprite('decor',true)

        cameraFlash('camHUD', '000000', 0.2)
        triggerEvent('Change Character','boyfriend','julian-excited')
        triggerEvent('Change Character','dad','satan-chad')
    end

    if curStep == 290 then
        removeLuaSprite('satanTransition',true)
    end

    if  curStep == 406 then --ALPHA 1 TRANSITION BLACK
        addAnimationByPrefix('blackTransition', 'kill', 'black kill', 24, false)
        setProperty('blackTransition.visible',true)
    end

    if curStep == 415 then
        removeLuaSprite('blackTransition',true)
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','boyfriend','turmoil1')
        triggerEvent('Change Character','dad','black2')

        setProperty('BgTurmoil.visible',true)
        removeLuaSprite('BgSatan',true)
    end

    if curStep == 528 then --ANIMATE JUMPSCARE LUIGI CLASSIFIED
        addAnimationByPrefix('fountainLuigiAnim', 'laugh', 'laugh', 24, false)
        setProperty('fountainLuigiAnim.visible',true)
        setProperty('fountainLuigiAnim.y',50)
    end

    if curStep == 543 then -- KUROMI VS LUIGI CLASSIFIED

        removeLuaSprite('fountainLuigiAnim',true)
        removeLuaSprite('BgTurmoil',true)

        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','boyfriend','kuromi')
        triggerEvent('Change Character','dad','luigi_fountain')

        setProperty('BgAbandoned.visible',true)
        setProperty('BgWallAbandoned.visible',true)
        setProperty('vigenetteFog.visible',true)
        setProperty('waterFloor.visible',true)

        doTweenY('waterFloorUp','waterFloor',0,30,'cubeOut')
    end

    if curStep >= 543 and curStep <= 672 then
        if mustHitSection == false then
            setProperty('BgWallAbandoned.alpha',0)
        else
            setProperty('BgWallAbandoned.alpha',1)
        end 
    end

    if curStep == 672 then -- TAEYAI & GF LULLABY VS DONALD
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        triggerEvent('Change Character','boyfriend','GF-Phase-3-Stand')
        triggerEvent('Change Character','gf','taeyaitps')
        triggerEvent('Change Character','dad','donald')
        setProperty('CassanovaBike.alpha',1)

        setObjectOrder('gf',getObjectOrder('dadGroup') + 1)
        setProperty('gf.x',-1050)

        cancelTween('waterFloorUp')
        doTweenY('waterFloorDown','waterFloor',900,1,'cubeOut')

        removeLuaSprite('BgAbandoned',true)
        removeLuaSprite('BgWallAbandoned',true)
        removeLuaSprite('vigenetteFog',true)

        setProperty('BgAccelerant.visible',true)
    end

    if curStep == 794 then -- TO BOTTOM TAEYAI & GF
        doTweenX('enterCassanova','CassanovaBike',175,0.2,'cubeOut')
        doTweenY('GFBottom','boyfriend',1200,0.3,'cubeOut')
        doTweenY('TaeyaiBottom','gf',1200,0.3,'cubeOut')
    end

    if curStep == 799 then -- DEFEAT DONALD
        addAnimationByPrefix('CassanovaBike', 'shoot', 'leftSHOOT', 24, false)
        playAnim('CassanovaBike','shoot',false)
        playSound('gunshot',0.8)
    end

    if curStep == 804 then -- JUMP CASSANOVA
        doTweenAlpha('disableAccelerantBg','BgAccelerant',0,0.3,'linear')
        doTweenAlpha('disableDonald','dad',0,0.3,'linear')

        addAnimationByPrefix('CassanovaBike', 'jump', 'newJump', 48, false)
        playAnim('CassanovaBike','jump',false)
        setProperty('CassanovaBike.x',-11)
        setProperty('CassanovaBike.y',-330 )
    end

    if curStep == 814 then --SET SCENE CASSANOVA

        removeLuaSprite('CassanovaBike',true)
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        setProperty('dad.alpha',1)
        setProperty('gf.visible',false)


        triggerEvent('Change Character','boyfriend','Casanova-BikeBad2')
        triggerEvent('Change Character','dad','Starbucks_Fly')

        setProperty('boyfriend.x',95)
        setProperty('boyfriend.y',196)

        setProperty('BgBaddies.visible',true)
        setProperty('hihgway.visible',true)
        setProperty('lightsBaddies.visible',true)
        setProperty('carParents.visible',true)
        setProperty('transitionCoronationTop.visible',true)
        setProperty('policeCars.visible',true)
        setProperty('helicopters.visible',true)

    end

    if curStep == 1085 then --SCENE GOOGLE SONIC
        removeLuaSprite('BgBaddies',true)
        removeLuaSprite('hihgway',true)
        removeLuaSprite('lightsBaddies',true)
        removeLuaSprite('carParents',true)
        removeLuaSprite('policeCars',true)
        removeLuaSprite('helicopters',true)

        triggerEvent('Change Character','boyfriend','Hyper')
        triggerEvent('Change Character','dad','googleSonic')

        setProperty('boyfriend.x',1000)
        setProperty('dad.y',4200)
        setProperty('boyfriend.y',4000)
        setObjectOrder('boyfriend',getObjectOrder('BgHyper') + 1)
    end

    if curStep == 1150 then --ENTRANCE HIPER
        doTweenX('appearHyper','boyfriend',0,0.3,'cubeOut')
        doTweenX('appearBGHyper','BgHyper',-100,0.3,'cubeOut')
    end

    if curStep == 1212 then -- SET FLEETWAY SCENE
        setProperty('BgFleetway.visible',true)
        setProperty('chargeEmerald.visible',true)
        setProperty('emerals.visible',true)
        setProperty('FgFleetway.visible',true)
    end

    if curStep == 1220 then -- FLEETWAY VS LUNATIC
        triggerEvent('Change Character','boyfriend','lunatic')
        triggerEvent('Change Character','dad','fleetway')

        setProperty('dad.y',-600)
        setProperty('boyfriend.y',-700)
    end

    if curStep == 1312 then --LAUGH FLEETWAY
        triggerEvent('Change Character','dad','fleetway-anims1')
        characterPlayAnim('dad','lmao',true)
    end

    if curStep == 1327 then -- END LAUGH FLEETWAY
        triggerEvent('Change Character','dad','fleetway')
    end 

    end

    if curStep == 1344 then -- DISABLE FLEETWAY SCENE
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        setProperty('camGame.visible',false)

        removeLuaSprite('transitionCoronationTop',true)
        removeLuaSprite('transitionCoronationBottom',true)

        removeLuaSprite('BgHyper',true)
        removeLuaSprite('BgGoogle',true)

        removeLuaSprite('BgFleetway',true)
        removeLuaSprite('chargeEmerald',true)
        removeLuaSprite('emerals',true)
        removeLuaSprite('FgFleetway',true)
    end

    if pt2 then

        if curStep == 1376 then -- FLOWEYS VS CHARA
        triggerEvent('Change Character','boyfriend','cara')
        triggerEvent('Change Character','gf','flowey')
        triggerEvent('Change Character','dad','omega-flowey')

        setObjectOrder('gf',getObjectOrder('lightning') + 1)
        setProperty('gf.y',100)
        setProperty('gf.x',-850)

        setProperty('slideBlack.visible',true)
        addAnimationByPrefix('lightning', 'idle', 'lightning', 24, true)
        setProperty('lightning.visible',true)

        addAnimationByPrefix('BgHalloween', 'idle', 'halloweem bg lightning strike', 24, true)
        setProperty('BgHalloween.visible',true)
    end

    if curStep == 1424 then -- REVEAL FLOWEY SCENE
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        setProperty('camGame.visible',true)
    end

    if curStep == 1552 then -- APPEARS SOULS
        addAnimationByPrefix('souls', 'idle', 'SoulsCircle', 60, true)
        setProperty('souls.visible',true)
        setProperty('souls.alpha',0)
        doTweenAlpha('revealSouls','souls',1,1,'linear')
    end

    if curStep == 1680 then -- FINN PIBBY VS SANS
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

        removeLuaSprite('slideBlack',true)
        setProperty('lightning.visible',false)
        removeLuaSprite('BgHalloween',true)
        removeLuaSprite('souls',true)

        setProperty('gf.visible',false)

        triggerEvent('Change Character','boyfriend','finncawn2')
        triggerEvent('Change Character','dad','UT-Sans')

        setProperty('BgAttackSans.visible',true)
        setObjectOrder('dad',getObjectOrder('boyfriendGroup') + 3)
        setObjectOrder('BgAttackSans',getObjectOrder('boyfriendGroup') + 1)
    end

    if curStep == 1935 then -- UNBEATABLES VS DICTATOR
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        removeLuaSprite('BgAttackSans',true)

        setProperty('bgBar.visible',true)
        setProperty('bgBar.angle', 35)
        startTween('bgBarSTupidTweenX', 'bgBar', {x = -1500}, 7, {type = "PINGPONG"})
        startTween('bgBarSTupidTweenY', 'bgBar', {y = -600}, 8, {type = "PINGPONG"})
        startTween('bgBarSTupidTweenAngle', 'bgBar', {angle = -35}, 9, {type = "PINGPONG"})

        triggerEvent('Change Character','boyfriend','mrSYSwb')
        triggerEvent('Change Character','dad','secretmario')
        triggerEvent('Change Character','gf','hunter')

        setProperty('gf.visible',true)
        setProperty('gf.y',1000)
        setProperty('ycbu_bowser.visible',true)


        setObjectOrder('dad',getObjectOrder('boyfriendGroup') + 3)
        setProperty('slideSecret.visible',true)
        setObjectOrder('slideSecret',getObjectOrder('boyfriendGroup') + 1)

        setProperty('lightning.visible',true)

        setObjectOrder('lightning',getObjectOrder('boyfriendGroup') + 2)
    end

    if curStep == 1950 then -- APPEAR DUCK HUNT
        doTweenY('appearHunter','gf',200,0.5,'cubeOut')
        runHaxeCode([[game.iconP1.changeIcon('duo')]]);
    end

    if curStep == 1962 then -- APPEAR BOWSER
        doTweenY('appearBowser','ycbu_bowser',100,0.5,'cubeOut')
        runHaxeCode([[game.iconP1.changeIcon('trio')]]);
    end

    if curStep == 1984 then -- DISABLE BG UNBEATABLE AND APPEAR RACE BG
        doTweenAlpha('element1','bgBar',0,1.3,'linear')
        doTweenAlpha('element2','boyfriend',0,1.3,'linear')
        doTweenAlpha('element3','gf',0,1.3,'linear')
        doTweenAlpha('element4','ycbu_bowser',0,1.3,'linear')

        addAnimationByPrefix('BgRaceEnter', 'idle', 'enter', 24, false)
        setProperty('BgRaceEnter.visible',true)
        setProperty('BgRaceEnter.alpha',0)

        doTweenAlpha('element5','BgRaceEnter',1,1.3,'linear')

    end

    if curStep == 2000 then -- WARIO VS TAILS DOLL
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

        setProperty('gf.visible',false)
        setProperty('boyfriend.alpha',1)
        setProperty('gf.alpha',0)

        cancelTween('bgBarSTupidTweenX')
        cancelTween('bgBarSTupidTweenAngle')
        cancelTween('bgBarSTupidTweenY')

        removeLuaSprite('bgBar',true);
        removeLuaSprite('slideSecret',true)
        removeLuaSprite('lightning',true)
        removeLuaSprite('BgRaceEnter',true)

        triggerEvent('Change Character','boyfriend','wariov2')
        triggerEvent('Change Character','dad','tailsdoll2')

        addAnimationByPrefix('BgRace', 'idle', 'idle', 24, true)
        setProperty('BgRace.visible',true)

        setProperty('dad.y',-800)
        setProperty('boyfriend.y',-800)

        doTweenY('appearTailsDoll','dad',400,0.5,'cubeOut')
        doTweenY('appearWarioHead','boyfriend',400,0.5,'cubeOut')
    end

    if curStep == 2063 then -- DISABLE RACE SCENE
        doTweenAlpha('element1','BgRace',0,1.3,'linear')
        doTweenAlpha('element2','boyfriend',0,1.3,'linear')
        doTweenAlpha('element3','dad',0,1.3,'linear')

        triggerEvent('Change Character','gf','bigmonika-dress')
        setProperty('gf.visible',true)
    end

    if curStep == 2070 then -- MONIKA LAUGH
        setProperty('gf.alpha',0.3)
    end

    if curStep == 2080 then -- MONIKA VS TORRENT
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        removeLuaSprite('BgRace',true);
        setProperty('gf.alpha',1)

        triggerEvent('Change Character','boyfriend','torrent')
        setProperty('boyfriend.alpha',1)

        setProperty('health.visible',false)
        setProperty('healthBar.visible',false)
        setProperty('iconP1.visible',false)
        setProperty('iconP2.visible',false)

        setProperty('BgMonika.visible',true)
    end

    if curStep == 2128 then --FADE BG MONIKA
        doTweenAlpha('FadeBgMonika','BgMonika',0,0.7,'linear')
    end

    if curStep == 2140 then -- BOTTOM MONIKA
        doTweenY('downMonika','gf',1200,0.3,'cubeOut')
    end

    if curStep == 2144 then --ADD MAELSTROM AND NITRO
        triggerEvent('Change Character','dad','maelstrom')
        setProperty('dad.alpha',1)
        setProperty('dad.x',-600)
        setProperty('dad.y',-1500)

        triggerEvent('Change Character','gf','nitro')
        setProperty('gf.x',-2000)
        setObjectOrder('gf',getObjectOrder('dadGroup') + 1)

        doTweenY('moveMaelstromY','dad',100,0.3,'cubeOut')
        doTweenX('moveNitro','gf',-800,0.3,'cubeOut')
    end

    if curStep == 2192 then --MOVE MAELSTROM AND APPEAR CYCLOPS
        doTweenX('moveMaelstromX','dad',200,0.3,'cubeOut')
        doTweenAlpha('revealCyclops','cyclops',1,0.5,'linear')
    end

    if curStep == 2200 then --LEAVE NITRO AND TORRENT
        doTweenX('backNitro','gf',-2000,0.2,'cubeOut')
        doTweenX('backTorrent','boyfriend',1500,0.2,'cubeOut')
    end

    if curStep == 2202 then
        setProperty('gf.visible',false)
        triggerEvent('Change Character','boyfriend','gold')
        setProperty('boyfriend.x',-1100)
        doTweenX('moveGold','boyfriend',-800,0.3,'cubeOut')
    end

    if curStep == 2271 then -- MAMI VS VOID
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        setProperty('BgMami.visible',true)
        triggerEvent('Change Character','boyfriend','acvoid')
        triggerEvent('Change Character','dad','holy-mami')

        removeLuaSprite('ycbu_bowser',true)
        removeLuaSprite('cyclops',true)
        removeLuaSprite('eyes',true)
    end

    end
end

function onTweenCompleted(tag)

    if tag == 'waterFloorDown' then
        removeLuaSprite('waterFloor',true)
    end
end