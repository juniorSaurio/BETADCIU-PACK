
local beatStyle = 0
local songPos = 0
local idleNatsuki = true

function preloadCharacters(part)

    if part == 1 then
        addCharacterToList('sadsayo','boyfriend')
        addCharacterToList('mrv2','dad')
        precacheImage('characters/Doki_NatSad_Assets')
        callScript('extra_scripts/extraCharacter','createCharacter',{'sadnatsuki','natsuki-sad',100,50})
        setProperty('sadnatsuki.alpha',0.001)

        addCharacterToList('oswald-happy','boyfriend')
        addCharacterToList('gbv2','dad')
        addCharacterToList('mouse-smile','gf')

        addCharacterToList('oswald','boyfriend')
        addCharacterToList('gbv2evil','dad')
        addCharacterToList('mouse-happy','gf')

        addCharacterToList('picomic','boyfriend')
        addCharacterToList('robo-fever-perspective','dad')

        addCharacterToList('tricky','boyfriend')
        addCharacterToList('auditor-gold','gf')

        addCharacterToList('sunky','boyfriend')
        addCharacterToList('grand','dad')

        addCharacterToList('nightmare-bendy','gf')
        addCharacterToList('marioSS','dad')
        addCharacterToList('mariohorror-melt','dad')
    end
end


function onCreate()
    setProperty('introSoundsSuffix','-silence')
    setProperty('cameraSpeed', 5)

    addLuaScript('extra_scripts/createShader')
    callScript('extra_scripts/createShader','createShader',{'mirrorShader','MirrorEffect'})
    callScript('extra_scripts/createShader','createShader',{'glitchShader','GlitchEffect'})
    callScript('extra_scripts/createShader','createShader',{'pixelShader','MosaicEffect'})
    callScript('extra_scripts/createShader','createShader',{'tvShader','TvEffect'})
    callScript('extra_scripts/createShader','runShader',{'game',{'mirrorShader','glitchShader','pixelShader','tvShader'}})
    callScript('extra_scripts/createShader','runShader',{'hud',{'glitchShader','tvShader'}})

    setShaderFloat('mirrorShader','zoom',1)
    setProperty('camGame.alpha',0.001)
    setProperty('camHUD.alpha',0.001)
    precacheSound('virtualintro')

    addLuaScript('extra_scripts/extraIcon')
    addLuaScript('extra_scripts/extraCharacter')
    addLuaScript('custom_events/Set Cam Zoom')

    preloadCharacters(1)
    setProperty('gf.visible',false)
end

function onCreatePost()

    setZoom(0.7,'dad')
    setZoom(0.5,'boyfriend')
    setProperty('gf.y',500)
    setProperty('gf.x',200)
    setObjectOrder('gf',getObjectOrder('bg') + 1)
    setZoom(0.9,'gf')
    setCamPos(750,200,'gf')
end


function onCountdownTick(tick)
    if tick == 0 then
        doTweenAlpha('gameAlpha','camGame',1,stepCrochet*0.004,'circIn')
        playSound('virtualintro')
        setShaderFloat('pixelShader','strength',500)
        callScript('extra_scripts/createShader','doShaderTween',{'pixelShader','strength',0,stepCrochet*0.008,'circOut'})

    end
end

function onSongStart()
    cancelTween('gameAlpha')
    setProperty('camGame.alpha',1)
    callScript('extra_scripts/createShader','removeShaderCamera',{'pixelShader','game'})
end

function onUpdate()

end

function onUpdatePost()
    if curStep >= 223 and curStep <= 254 then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.4)
    else 

        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.6)

    end

    songPos = getSongPosition()
    if songPos > 107000 and songPos < 134000 then
        local cal = getSongPosition()/bpm
        setProperty('camFollow.x',750 + (200 * math.cos(cal/7)))
        setProperty('camFollow.y',450 + (100 * math.cos(cal/14)))
    end
end

local mirrorCur = 0
function onBeatHit()

    if luaSpriteExists('sadnatsuki') and getProperty('sadnatsuki.alpha') > 0.01 then
        if curBeat % 2 == 0 and idleNatsuki then
            playAnim('sadnatsuki','idle',false);
        end
    end

    idleNatsuki = true;

    if curBeat == 112 or curBeat == 116 or curBeat == 120 then
        setShaderFloat('glitchShader','intensity',0.03)
        callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})
    end

    if curBeat == 128 then
        setShaderFloat('glitchShader','intensity',0.03)
        callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,0.5,'circOut'})
    end

    if beatStyle == 1 and curBeat % 4 == 0 or beatStyle == 2 then
        setShaderFloat('glitchShader','intensity',0.03)
        callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})

        local mirrorZooms = {0.5,0.335,0.5,1}
        local mirrorX = {0,0,-2,-1}
        local percentual = 4
        if beatStyle == 2 then
            mirrorX = {0,0,0,0,0,-5,-4,-3,-2,-1}
            mirrorZooms = {0.5,0.335,0.25,0.2,0.167,0.2,0.25,0.335,0.5,1}
            percentual = 10
        end
        setShaderFloat('mirrorShader','zoom',mirrorZooms[mirrorCur])
        setShaderFloat('mirrorShader','x',mirrorX[mirrorCur])
        mirrorCur = mirrorCur%percentual + 1
    end
    if curBeat >= 48 and curBeat <= 112 then
        triggerEvent('Add Camera Zoom','0.005','')
    end

    if curBeat >= 112 and curBeat <= 141 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom','0.015','')
        end
    end
    if curBeat == 142 then
        setProperty("defaultCamZoom", "0.9")
    end

    if curBeat >= 144 and curBeat <= 176 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom','0.015','')
        end
    end
    if curBeat >= 112 and curBeat <= 175 then
        if curBeat % 8 == 0 then
            triggerEvent('Screen Shake','0.35, 0.002','0.35, 0.002')
        end
    end

    if curBeat == 245 then
        setProperty("defaultCamZoom", "0.6")
        doTweenZoom('gameZoom','camGame',1,4.5,'sineOut')
        triggerEvent('Camera Follow Pos', '1300','60')
    end

    if curBeat >= 258 and curBeat <= 324 then
        triggerEvent('Add Camera Zoom','0.00625','')
    end

    if curBeat >= 372 and curBeat <= 434 then
        triggerEvent('Add Camera Zoom','0.005','')
    end

    if curBeat >= 436 and curBeat <= 500 then
        triggerEvent('Add Camera Zoom','0.005','')
    end
end

function setHudVisible(visible)
    if not hideHud then
        setProperty('scoreTxt.visible',visible)
    end

    if timeBarType ~= 'Disabled' then
        setProperty('timeTxt.visible',visible)
        setProperty('timeBar.visible',visible)
        setProperty('timeBarBG.visible',visible)
    end
end

function goodNoteHit(id,data,type,sus)
    if songPos >= 105000 and not getPropertyFromGroup('notes',id,'noAnimation') and getProperty('boyfriend.curCharacter') == 'vBF' then
        playAnim('boyfriend',getProperty('singAnimations['..data..']')..'-alt',true)
        setProperty('boyfriend.holdTimer',0)
    end

    if curStep >= 96 and curStep <= 127 then
        playAnim('sadnatsuki',getProperty('singAnimations['..data..']'),false)
        setProperty('sadnatsuki.holdTimer',0)
        idleNatsuki = false;
    end

end


function onEvent(n,v1,v2)
    if n == 'Triggers Paranoia' then
        if v1 == '0.75' then
            cancelTween('gameZoom')
            triggerEvent('Camera Follow Pos', '','')
            setProperty('camGame.alpha',0.001)
            setProperty('camHUD.alpha',0.001)
            setHudVisible(false)
        end
        
        if v1 == '1' then
            setProperty('camGame.alpha',1)
            setProperty('camGame.scroll.x',-400)
            setProperty('camGame.scroll.y',-400)
            setProperty('camHUD.alpha',1)
        end
        
        if v1 == '2' then
            setHudVisible(true)
        end
        
        if v1 == '3' then
            if v2 == '0' then
                beatStyle = 0
                setShaderFloat('mirrorShader','zoom',1)
                setShaderFloat('mirrorShader','x',0)
            end
            
            if v2 == '1' then
                mirrorCur = 1
                beatStyle = 1

            end
            if v2 == '2' then
                mirrorCur = 1
                beatStyle = 2
            end
        end
    end

    if n == 'Triggers BETADCIU' then
        if v1 == '1' then
            if v2 == '1' then

                setProperty('gf.visible',true)
                doTweenY('upYuri','gf',-370,0.3,'cubeIn')
                doTweenAlpha('fadeMrV','dad',0.001,1,'linear')
                doTweenAlpha('fadeFatal','boyfriend',0.001,1,'linear')

                setCamPos(750,200,'boyfriend')
                setCamPos(750,200,'dad')

                setZoom(0.9,'boyfriend')
                setZoom(0.7,'dad')

                runTimer('appearDokis',0.3)

                addExtraIcon('gfIcon','yuri-crazy',false)
                extraIcon('setIconProperty',{'gfIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'gfIcon'})
            end

            if v2 == '2' then
                characterPlayAnim('gf','ded',false)
                setProperty('gf.specialAnim',true)

                doTweenAlpha('fadeOutBg','bg',0.01,0.3,'linear')
                doTweenAlpha('fadedOutFrontPipes','frontPipes',0.01,0.3,'linear')
                doTweenAlpha('fadedOutPlatform','platform',0.01,0.3,'linear')

                runTimer('fallObjects',0.55)
            end
        end

        if v1 == '2' then
            if v2 == '1' then

                cancelTween('moveBottomYuri')
                cancelTween('moveBottomSadSayo')
                cancelTween('moveBottomSadSadNatsuki')
                cancelTween('moveBottomBackPlatform')
                cancelTween('moveBottomBackPipes')
                cancelTween('fadeOutBg')
                cancelTween('fadedOutFrontPipes')
                cancelTween('fadedOutPlatform')

                setProperty('dad.alpha',1)
                setProperty('gf.alpha',1)

                callScript('extra_scripts/extraCharacter','removeCharacter',{'sadnatsuki',true})
                removeFromMemory('sadsayo',true)
                removeFromMemory('fatal-sonic',true)
                removeFromMemory('yuri-gore',true)
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','boyfriend','oswald-happy')
                triggerEvent('Change Character','dad','gbv2')
                triggerEvent('Change Character','gf','mouse-smile')

                setZoom(0.75,'boyfriend')
                setZoom(0.75,'dad')
                setZoom(0.75,'gf')

                setProperty('dad.x',200)
                setProperty('dad.y',120)

                setProperty('boyfriend.x',500)
                setProperty('boyfriend.y',-150)

                setProperty('gf.x',1000)
                setProperty('gf.y',-200)

                setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)

                setCamPos(800,100,'boyfriend')
                setCamPos(800,100,'dad')

                doTweenAlpha('fadeInGbLandPhase1','gbLandPhase1',1,0.4,'linear')

                setShaderFloat('tvShader','vignetteIntensity',0.025)
                setShaderFloat('tvShader','chromIntensity',0.004)
                setShaderFloat('tvShader','contrast',-0.15)
                setShaderFloat('tvShader','tvIntensity',0.001)
            end

            if v2 == '2' then
                cameraFlash('camGame', '0xFFFFFFFF', 0.2)

                removeFromMemory('oswald-happy',true)
                removeFromMemory('gbv2',true)
                removeFromMemory('mouse-smile',true)

                triggerEvent('Change Character','boyfriend','oswald')
                triggerEvent('Change Character','dad','gbv2evil')
                triggerEvent('Change Character','gf','mouse-happy')

                setProperty('dad.x',200)
                setProperty('dad.y',0)

                setProperty('boyfriend.x',500)
                setProperty('boyfriend.y',-120)

                setProperty('gf.x',1000)
                setProperty('gf.y',-120)

                setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)

                setCamPos(700,100,'boyfriend')
                setCamPos(700,100,'dad')

                callScript('extra_scripts/createShader','doShaderTween',{'tvShader','tvIntensity',0.03,0.1,'linear','deformationTv'})
                runTimer('endTweenDeformationTv',0.2)
            end

            if v2 == '3' then
                characterPlayAnim('boyfriend','intro',false)
                setProperty('boyfriend.specialAnim',true)

                setCamPos(1000,200,'boyfriend')
                setCamPos(1000,200,'dad')

                setZoom(1.1,'boyfriend')
                setZoom(1.1,'dad')
            end

            if v2 == '4' then
                characterPlayAnim('gf','risaSingle',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '5' then
                setCamPos(800,100,'boyfriend')
                setCamPos(800,100,'dad')

                setZoom(0.75,'boyfriend')
                setZoom(0.75,'dad')
            end
        end
        
        if v1 == '3' then
            if v2 == '1' then
                setShaderFloat('tvShader','vignetteIntensity',0)
                setShaderFloat('tvShader','chromIntensity',0)
                setShaderFloat('tvShader','contrast',0)
                setShaderFloat('tvShader','lineFrequency',0)
                setShaderFloat('tvShader','lineSize',0)
                setShaderFloat('tvShader','lineOffset',0)
                setShaderFloat('tvShader','lineSpace',0)
                setShaderFloat('tvShader','tvFrequency',0)
                setShaderFloat('tvShader','tvDistorcion',0)

                callScript('extra_scripts/createShader','doShaderTween',{'tvShader','tvIntensity',0.03,0.01,'linear','deformationTv'})
                runTimer('endTweenDeformationTv2',0.2)

                removeFromMemory('oswald-happy',true)
                removeFromMemory('gbv2',true)

                triggerEvent('Change Character','boyfriend','picomic')
                triggerEvent('Change Character','dad','robo-fever-perspective')

                setProperty('gf.alpha',0.001)
                setObjectOrder('dad',getObjectOrder('sideFever')+1)
                setObjectOrder('boyfriend',getObjectOrder('sideFeverCar')+1)

                setProperty('dad.x',400)
                setProperty('dad.y',-350)

                setProperty('boyfriend.x',2500)
                setProperty('boyfriend.y',-400)

                setCamPos(900,100,'boyfriend')
                setCamPos(700,100,'dad')

                setZoom(1,'boyfriend')
                setZoom(1,'dad')

                setOffs(0,'dad')
                setOffs(0,'boyfriend')
            end

            if v2 == '2' then
                doTweenX('enterPicomic','boyfriend',1050,0.4,'cubeInOut')
            end
        end

        if v1 == '4' then
            if v2 == '1' then
                doTweenX('exitRoboFever','dad',-1500,0.3,'cubeInOut')
                doTweenX('exitPicomic','boyfriend',2500,0.3,'cubeInOut')

                removeFromMemory('mouse-smile',true)
                triggerEvent('Change Character','gf','auditor-gold')
                setProperty('gf.alpha',1)

                addExtraIcon('gfIcon','auditor',false)
                extraIcon('setIconProperty',{'gfIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'gfIcon'})
                setProperty('iconP2.visible',false)

                runHaxeCode([[setHealthBarColors('00FF00', 'FF0000')]])

                setProperty('lighting1.alpha',1)

                setCamPos(1300,200,'boyfriend')
                setCamPos(800,200,'dad')

                setProperty('gf.x',500)
                setProperty('gf.y',-300)

                setZoom(0.5,'boyfriend')
                setZoom(0.7,'dad')
                setZoom(0.5,'gf')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
                setOffs(50,'gf')
            end
        end

        if v1 == '5' then
            if v2 == '1' then

                removeFromMemory('robo-fever-perspective',true)
                removeFromMemory('tricky',true)
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','dad','grand')
                triggerEvent('Change Character','boyfriend','sunky')

                setProperty('iconP2.visible',true)

                setProperty('dad.x',-100)
                setProperty('dad.y',350)

                setProperty('boyfriend.x',1100)
                setProperty('boyfriend.y',400)

                setProperty('dad.alpha',1)
                setProperty('boyfriend.alpha',1)
                setProperty('gf.alpha',0.001)

                setZoom(0.35,'boyfriend')
                setZoom(0.35,'dad')
                setZoom(0.35,'gf')

                setCamPos(1000,500,'boyfriend')
                setCamPos(700,500,'dad')
            end

            if v2 == '2' then
                doTweenZoom('zoomInSunky','camGame',1,3,'linear')
                setCamPos(1500,500,'boyfriend')
            end
        end

        if v1 == '6' then
            if v2 == '1' then
                
                removeFromMemory('grand',true)
                removeFromMemory('auditor-gold',true)

                triggerEvent('Change Character','dad','marioSS')
                triggerEvent('Change Character','gf','nightmare-bendy')

                setObjectOrder('dad', getObjectOrder('floorExe') + 1)
                setObjectOrder('boyfriend', getObjectOrder('floorExe') + 1)

                setScrollFactor('gf',0.6,0.6)

                setProperty('dad.x',-400)
                setProperty('dad.y',50)

                setProperty('gf.x',320)
                setProperty('gf.y',200)

                setProperty('boyfriend.x',1400)
                setProperty('boyfriend.y',400)
                
                setCamPos(1000,500,'boyfriend')
                setCamPos(400,400,'dad')
                setCamPos(700,500,'gf')

                setZoom(0.5,'boyfriend')
                setZoom(0.4,'dad')
                setZoom(0.8,'gf')
            end

            if v2 == '2' then
                setProperty('gf.alpha',1)
                characterPlayAnim('gf','intro',false)
                setProperty('gf.specialAnim',true)
                addExtraIcon('gfIcon','NMBendy',false)
                setProperty('gfIcon.offset.y',getProperty('iconP2.offset.y') + 80)
                setProperty('gfIcon.offset.x',getProperty('iconP2.offset.x') + 80)
            end

            if v2 == '3' then
                callScript('scripts/cameraMoviment','doCamTween',{'dadX','dadY+500',1,'cubeOut'})
                characterPlayAnim('dad','xd',true)
                setProperty('dad.specialAnim',true)
    
                doTweenZoom('gameZoom','camGame',0.8,2.5,'cubeInOut')
                doTweenY('dadY','dad',getProperty('dad.y')+1500,1,'linear')
            end

            if v2 == '4' then
                removeFromMemory('marioSS',true)

                triggerEvent('Change Character','dad','mariohorror-melt')
                setObjectOrder('dad', getObjectOrder('floorExe') + 1)

                setProperty('dad.x',getProperty('dad.x')-600)
                setProperty('dad.y',getProperty('dad.y')+300)
                doTweenX('marioJumpX','dad',getProperty('dad.x')+330,1,'linear')
                doTweenY('marioJumpY','dad',getProperty('dad.y')-400,0.5,'sineOut')
                characterPlayAnim('dad','jump',true)
                setProperty('dad.specialAnim',true)

                setCamPos(1000,400,'boyfriend')
                setCamPos(400,200,'dad')
                setCamPos(700,400,'gf')
            end
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'appearDokis' then
        triggerEvent('Change Character','boyfriend','sadsayo')
        doTweenAlpha('fadeInSadSayo','boyfriend',1,0.5,'linear')
        doTweenAlpha('fadeInSadNatsuki','sadnatsuki',1,0.5,'linear')
    end

    if tag == 'fallObjects' then
        doTweenY('moveBottomYuri','gf',900,0.3,'linear')
        doTweenY('moveBottomSadSayo','boyfriend',900,0.3,'linear')
        doTweenY('moveBottomSadSadNatsuki','sadnatsuki',600,0.3,'linear')
        doTweenY('moveBottomBackPlatform','backPlatform',0,0.3,'linear')
        doTweenY('moveBottomBackPipes','backPipes',0,0.3,'linear')
    end

    if tag == 'endTweenDeformationTv' then
        setShaderFloat('tvShader','tvIntensity',0.0015)
    end

    if tag == 'endTweenDeformationTv2' then
        setShaderFloat('tvShader','tvIntensity',0)
    end
end

function onTweenCompleted(tag)
    if tag == 'exitRoboFever' then
        setProperty('dad.alpha',0.01)
    end

    if tag == 'exitPicomic' then
        removeFromMemory('picomic',true)
        triggerEvent('Change Character','boyfriend','tricky')

        setProperty('boyfriend.x',2500)
        setProperty('boyfriend.y',-300)

        setObjectOrder('boyfriend', getObjectOrder('bgTricky') + 1)
    end
end

function extraIcon(func,vars)
    if not hideHud then
        callScript('extra_scripts/extraIcon',func,vars)
    end
end

function addExtraIcon(tag,image,isPlayerIcon)
    extraIcon('addExtraIcon',{tag,image,isPlayerIcon})
end

function removeExtraIcon(tag,removeFromMemory)
    callScript('extra_scripts/extraIcon','removeExtraIcon',{tag,removeFromMemory})
end

function removeFromMemory(image,isCharacter)
    if not isCharacter then
        callScript('scripts/optimization','removeFromMemory',{image})
    else
        callScript('scripts/optimization','removeCharacterFromMemory',{image})
    end
end

function setCamPos(x,y,target)
    callScript('scripts/cameraMoviment','setCamPos',{x,y,target})
end

function setOffs(ofs,target)
    callScript('scripts/cameraMoviment','setOffs',{ofs,target})
end

function setZoom(zoom,target)
    callScript('custom_events/Set Cam Zoom','setZoom',{zoom,target})
end

function onDestroy()
    setPropertyFromClass(playState,'SONG.arrowSkin','')
    setPropertyFromClass(playState,'SONG.splashSkin','')
    setPropertyFromClass('states.PlayState','SONG.disableNoteRGB',false)
end