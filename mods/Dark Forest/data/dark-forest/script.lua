local floatingDad = false
local floatingBF = false

function precacheSounds()
    precacheSound('introCup')
    precacheSound('GoldScream')
    precacheSound('nmbendy_land')
    precacheSound('NMBendyJumpscare')
end

function precacheCharacters()
    addCharacterToList('devil', 'dad')
    addCharacterToList('black2', 'dad')
    addCharacterToList('pretender', 'boyfriend')
    addCharacterToList('fleetway', 'dad')
    addCharacterToList('sonic-phantasm', 'boyfriend')
    addCharacterToList('gold', 'dad')
    addCharacterToList('ponmi', 'boyfriend')
    addCharacterToList('hxfriend', 'boyfriend')
    addCharacterToList('MurdererPink', 'dad')
    addCharacterToList('MurdererYellow', 'boyfriend')
    addCharacterToList('bunzobunny', 'gf')
    addCharacterToList('whitbonkers', 'dad')
    addCharacterToList('oswald-suicide','dad')
    addCharacterToList('reroy1', 'boyfriend')
    addCharacterToList('luigi-toolate','dad')
    addCharacterToList('CCM', 'boyfriend')
    addCharacterToList('void','dad')
    addCharacterToList('lectro_playable', 'boyfriend')
    addCharacterToList('giffany_normal','dad')
    addCharacterToList('monika', 'boyfriend')
end

function onCreate()
    precacheCharacters()
    precacheSounds()

    setProperty('gf.visible',false)
    setProperty('boyfriend.visible',false)
end


function onUpdate(elapsed)

    floatingCharacterDad()
    floatingCharacterBF()

    if curStep == 8 then
        setProperty('gf.visible',true)
        characterPlayAnim('gf','intro', true)
    end

    if curStep == 12 then
        setProperty('boyfriend.visible',true)
        characterPlayAnim('boyfriend','intro', true)
    end

    if curStep == 30 then
        triggerEvent('Change Character','dad','devil')
    end

    if curStep == 148 then
        setProperty('gf.visible',false)
        addLuaSprite('NMBendyJump',true)
        objectPlayAnimation('NMBendyJump','anim1',true)
    end

    if curStep == 159 then
        triggerEvent('Change Character','dad','black2')
        triggerEvent('Change Character','boyfriend','pretender')
        removeLuaSprite('BgDevil')

        addLuaSprite('defeatFLoor1',false)
    end

    if curStep == 226 then
        runHaxeCode([[game.iconP1.changeIcon('hpink-pretender'); game.iconP2.changeIcon('human-black');]]);
    end

    if curStep == 286 then
        removeLuaSprite('defeatFLoor1',true)
        triggerEvent('Change Character','dad','fleetway')
        triggerEvent('Change Character','boyfriend','sonic-phantasm')
        setProperty('dad.alpha',0.5)

        addLuaSprite('BgSonic',false)
    end

    if curStep == 352 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        setProperty('dad.alpha',1)
        setProperty('boyfriend.alpha',0.5)
        setObjectOrder('dad',getObjectOrder('boyfriendGroup') + 1)
        removeLuaSprite('BgSonic',true)
        addLuaSprite('BgFleet',false)
    end

    if curStep == 416 then

        removeLuaSprite('BgFleet',true)
        setObjectOrder('dad',getObjectOrder('boyfriendGroup') - 1)
        triggerEvent('Change Character','dad','gold')
        triggerEvent('Change Character','boyfriend','ponmi')
        addLuaSprite('BgCircus',false)
        setProperty('boyfriend.alpha',1)

        floatingDad = true
    end

    if curStep == 535 then
        triggerEvent('Change Character','gf','bunzobunny')
        setProperty('gf.visible',true)
        doTweenY('DownBunzo','gf',getProperty('gf.y') + 1200, 0.6,'CircInOut')
    end

    if curStep == 600 then
        doTweenAlpha('disableGold','dad',0,0.3,'linear')
        doTweenAlpha('disablePonmi','boyfriend',0,0.3,'linear')
        doTweenAlpha('disableBunzo','gf',0,0.3,'linear')
        doTweenAlpha('disableBgCircus','BgCircus',0,0.3,'linear')
        doTweenAlpha('disableiconP2','iconP2',0,0.3,'linear')
    end

    if curStep == 608 then 
        floatingDad = false
        triggerEvent('Change Character','boyfriend','hxfriend')
        doTweenAlpha('enableGfHx','boyfriend',1,0.3,'linear')
        removeLuaSprite('BgCircus',true)

    end

    if curStep == 734 then
        doTweenX('moveGfHx','boyfriend',getProperty('boyfriend.x') + 500 , 0.5 , 'CircInOut')
    end

    if curStep == 792 then
        doTweenAlpha('enableBlack', 'black', 1, 0.5, 'linear');
    end

    if curStep == 900 then
        triggerEvent('Change Character','boyfriend','MurdererYellow')
        triggerEvent('Change Character','dad','MurdererPink')
        setProperty('dad.alpha',1)
        addLuaSprite('BgManiacal',false)

    end

    if curStep == 924 then
        doTweenAlpha('disableBlack', 'black', 0, 0.3, 'linear');
    end

    if curStep == 1055 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        removeLuaSprite('BgManiacal',true)
        setProperty('boyfriend.visible',false)
        addLuaSprite('BgWhitty',false)
        triggerEvent('Change Character','dad','whitbonkers')
        setProperty('iconP1.visible',false)
    end

    if curStep == 1068 then
        addLuaSprite('effectWhitty',false)
    end

    if curStep == 1071 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        removeLuaSprite('effectWhitty',true)
        removeLuaSprite('BgWhitty',true)
        triggerEvent('Change Character','dad','oswald-suicide')
        addLuaSprite('BgOswald',false)
    end

    if curStep == 1119 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
        setProperty('iconP1.visible',true)
        setProperty('iconP2.alpha',0)
        removeLuaSprite('BgOswald',false)
        addLuaSprite('BgReroy',false)
        triggerEvent('Change Character','boyfriend','reroy1')
        setProperty('dad.alpha',0)
    end

    if curStep == 1183 then
        doTweenAlpha('disableBgReroy','BgReroy',0,0.5,'linear')
    end

    if curStep == 1200 then

        addLuaSprite('ToothBottom',true)
        addLuaSprite('ToothTop',true)

        removeLuaSprite('BgReroy',false)
        addLuaSprite('BGTL1',false)
        addLuaSprite('BGTL2',true)
        triggerEvent('Change Character','dad','luigi-toolate')
        doTweenAlpha('enableLuigiTL','dad',1,0.3,'linear')
        doTweenAlpha('enableIconP2','iconP2',1,0.3,'linear')

        doTweenAlpha('enableBGTL1','BGTL1',1,0.3,'linear')
        doTweenAlpha('enableBGTL2','BGTL2',1,0.3,'linear')
    end

    if curStep == 1256 then
        doTweenY('enableTT','ToothTop',0,0.6,'cubeout')
        doTweenY('enableTB','ToothBottom',250,0.6,'cubeout')
    end

    if curStep == 1264 then
        doTweenY('disableTT','ToothTop',-3000,2,'cubeout')
        doTweenY('disableTB','ToothBottom',1600,2,'cubeout')
        setProperty('dad.visible',false)
        removeLuaSprite('BGTL1',true)
        removeLuaSprite('BGTL2',true)
        triggerEvent('Change Character','boyfriend','CCM')
        floatingBF = true;

        addLuaSprite('crazyspace', false);
        addLuaSprite('aura', false);
    end

    if curStep == 1326 then
        floatingBF = false
    end

    if curStep == 1328 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.4)

        removeLuaSprite('crazyspace',true)
        removeLuaSprite('aura',true)

        setProperty('dad.visible',true)

        addLuaSprite('BGSpaceVoid',false)
        addLuaSprite('BGPublicVoid',false)
        addLuaSprite('FGSpaceVoid',false)

        triggerEvent('Change Character','boyfriend','lectro_playable')
        triggerEvent('Change Character','dad','void')
    end

    if curStep == 1392 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.4)

        removeLuaSprite('BGSpaceVoid',true)
        removeLuaSprite('BGPublicVoid',true)
        removeLuaSprite('FGSpaceVoid',true)

        addLuaSprite('bgDoki',false)
        addLuaSprite('Lighting',true)

        triggerEvent('Change Character','boyfriend','monika')
        triggerEvent('Change Character','dad','giffany_normal')
    end
end


function onStepHit()

    if curStep == 8 then
        playSound('nmbendy_land',1)
    end

    if curStep == 152 then
        playSound('NMBendyJumpscare',1)
    end

    if curStep == 1052 then
        doTweenZoom('zomss', 'camGame', 1, 0.5, 'cubeOut')
        doTweenAlpha('cameasdad', 'camHUD', 0.5, 0.10, 'linear')
    end
    if curStep == 1056 then
        doTweenAlpha('cameasdadss', 'camHUD', 1, 0.10, 'linear')
    end
    if curStep == 1068 then
        doTweenZoom('zom', 'camGame', 1.5, 0.5, 'cubeOut')
        doTweenAlpha('cameasdadssssss', 'camHUD', 0, 0.10, 'linear')
        triggerEvent('Screen Shake','0.4, 0.05','0.1, 0.0015');
    end
    if curStep == 1072 then
        doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.10, 'linear')
    end
end

function onBeatHit()

    if getProperty('CupTitle.animation.curAnim.name') == 'Ready?' and getProperty('CupTitle.animation.curAnim.finished') then
        removeLuaSprite('CupTitle')
        removeLuaSprite('start')
    end

    if getProperty('NMBendyJump.animation.curAnim.name') == 'anim1' and getProperty('NMBendyJump.animation.curAnim.finished') then
        removeLuaSprite('NMBendyJump')
        cameraFlash('camHUD', 'E6FF00', 0.3)
        setProperty('gf.visible',false)
    end
end 

function floatingCharacterDad()

    if floatingDad then
        songPos = getSongPosition()

        local currentBeat = (songPos/5000)*(curBpm/60)
         doTweenY('dadmove', 'dad', -50 - 300*math.sin((currentBeat+12*12)*math.pi), 2);
    else
        cancelTween('dadmove')
    end

end

function floatingCharacterBF()

    if floatingBF then
        songPos = getSongPosition()

        local currentBeat = (songPos/5000)*(curBpm/60)
        doTweenY('anothermove', 'aura', -540 - 550*math.sin((currentBeat+12*12)*math.pi), 2);
        doTweenY('bfmove', 'boyfriend', -300 - 650*math.sin((currentBeat+12*12)*math.pi), 2);
        doTweenAngle('rotat', 'crazyspace', 2000, 1, 'circInOut')
    else
        cancelTween('bfmove')
        cancelTween('rotat')
        cancelTween('anothermove')
    end

end


