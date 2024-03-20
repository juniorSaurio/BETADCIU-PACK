
local beatStyle = 0
local songPos = 0
local idleNatsuki = true
local idleFleetway= true
local idleKoopa= true
local stupidTweenY = 0;
local stopStupid = false;
local activateStupidTweenKoopa = false;
local throwShell = false;
local stopMario = false;
local marioRuning = false;
local gfPissed = false;
local byeExtraCam2 = false;

function preloadCharacters(part)

    if part == 1 then

        addCharacterToList('sadsayo','boyfriend')
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

        precacheImage('characters/Fleetway_Super_Sonic')
        callScript('extra_scripts/extraCharacter','createCharacter',{'fleetway','fleetway',2000,-400})
        setProperty('fleetway.alpha',0.001)

        addCharacterToList('adventuresonic','dad')
        addCharacterToList('bf-legacy','boyfriend')
    end

    if part == 2 then
        addCharacterToList('Tailas','boyfriend')
        addCharacterToList('p2exe','dad')

        addCharacterToList('elizabeth','boyfriend')
        addCharacterToList('elizabeth-pov','boyfriend')
        addCharacterToList('elizabeth-maniacota-pov','boyfriend')
        addCharacterToList('luigi-toolate','dad')
        addCharacterToList('mxV2','gf')

        addCharacterToList('gold','dad')
        addCharacterToList('rogergold','gf')
        addCharacterToList('taki-monofrenzy','boyfriend')

        addCharacterToList('piracyhead','dad')
        addCharacterToList('djmario','gf')

        precacheImage('characters/SS_Koopa_Assets')
        callScript('extra_scripts/extraCharacter','createCharacter',{'jhondick','sskoopa',300,600})
        setObjectCamera('jhondick','camHUD')
        setProperty('jhondick.alpha',0.001)

        addCharacterToList('tord-in-bot-scaled','gf')
        addCharacterToList('badmario','dad')
        addCharacterToList('gfreddy2','boyfriend')

        addCharacterToList('sunshineExe','dad')
        addCharacterToList('asmodeusZenith','boyfriend')

        addCharacterToList('giffany_broken','dad')
        addCharacterToList('cutephantom','boyfriend')

        addCharacterToList('1stpink','dad')
        addCharacterToList('yellowghost','boyfriend')

        addCharacterToList('shitno','dad')
        addCharacterToList('rosa','boyfriend')
        addCharacterToList('luigi_fountain3d','gf')

        addCharacterToList('marioexedpov','dad')
        addCharacterToList('M1KU_FS','boyfriend')
    end
end

function onCreate()
    setProperty('introSoundsSuffix','-silence')
    setProperty('cameraSpeed', 5)

    addLuaScript('extra_scripts/createShader')
    callScript('extra_scripts/createShader','createShader',{'pixelShader','MosaicEffect'})
    callScript('extra_scripts/createShader','runShader',{'game',{'pixelShader'}})

    setProperty('camGame.alpha',0.001)
    setProperty('camHUD.alpha',0.001)
    precacheSound('virtualintro')

    addLuaScript('extra_scripts/extraIcon')
    addLuaScript('extra_scripts/extraCharacter')
    addLuaScript('custom_events/Set Cam Zoom')

    preloadCharacters(1)
    setProperty('gf.alpha',0.001)

    precacheSound('smw_shell_kick')
    precacheSound('smw_stomp')
    precacheSound('smw_stomp2')
    precacheSound('line6')
    precacheSound('Psyshock')
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

function onUpdate(elapsed)
    if getProperty('dad.animation.curAnim.name') == 'fadeOut' and getProperty('dad.animation.curAnim.finished') then
        setProperty('dad.alpha',0.001)
    end

    if getProperty('gf.animation.curAnim.name') == 'fadeOut' and getProperty('gf.animation.curAnim.finished') then
        setProperty('gf.alpha',0.001)
    end

    if getProperty('dad.curCharacter') == 'badmario' then
        
        if throwShell then
            if getProperty('shell.velocity.x') >= 0  then
                if getProperty('shell.x') >= getProperty('jhondick.x') + 50 then
                    setProperty('shell.velocity.x',-100)
                    setProperty('shell.velocity.y',-500)
                    setProperty('shell.acceleration.y',1200)
                    playSound('smw_stomp')
    
                    setProperty('jhondick.velocity.x',400)
                    setProperty('jhondick.velocity.y',-500)
                    setProperty('jhondick.acceleration.y',1200)
    
                    playAnim('jhondick','noIdle',true)
                    activateStupidTweenKoopa = false;
                end
            else
    
                if luaSpriteExists('shell') then
                    setProperty('shell.angle',getProperty('shell.angle')+(elapsed*1000))
                end
    
                if luaSpriteExists('jhondick') then
                    setProperty('jhondick.angle',getProperty('jhondick.angle')+(elapsed*1000))
                end
            end
    
            if getProperty('dad.animation.curAnim.name') == 'jump3' and getProperty('dad.velocity.y') > 0 
                and getProperty('dad.y') < 300 and getProperty('dad.x') > 250 and not stopMario then
                    playAnim('gf','pissed',true)
                    setProperty('gf.specialAnim',true)
                    setProperty('dad.velocity.y',-500)
                    setProperty('dad.velocity.x',2000)
                    setProperty('vocals.volume', 0)
                    playSound('smw_stomp2')
                    gfPissed = true;
            end
        end
    
        if marioRuning then
            if getProperty('dad.animation.curAnim.name') == 'run' and getProperty('dad.x') >= 1100 then
                playAnim('dad','jump3',true)
                setProperty('dad.specialAnim',true)
                setProperty('dad.velocity.y',-1200)
                setProperty('dad.acceleration.y',2700)
                playSound('smw_jump')
            end
        end

    end

    if getProperty('gf.animation.curAnim.name') == 'pissed' and (getProperty('gf.animation.curAnim.curFrame') >= 8 and getProperty('gf.animation.curAnim.curFrame') <= 13) and gfPissed then
        setProperty('gf.animation.curAnim.curFrame',5)
    end

    if byeExtraCam2  then
        setProperty('camFNAF.angle',getProperty('camFNAF.angle')+(elapsed*1000))
    end
end

function onUpdatePost()

    songPos = getSongPosition()
    local cal = getSongPosition()/bpm

    if curStep >= 223 and curStep <= 254 then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.4)
    else 
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.6)
    end

    if activateStupidTweenKoopa then
        doTweenX('stupidTweenKoopax','jhondick',getProperty('jhondick.x') + (3 * math.cos(cal/7)),0.001)
        doTweenY('stupidTweenKoopay','jhondick',getProperty('jhondick.y') + (1 * math.cos(cal/14)),0.001)
    end

    if songPos > 107000 and songPos < 134000 then
        
        setProperty('boyfriend.y', getProperty('boyfriend.y') + stupidTweenY)
        setProperty('dad.y', getProperty('dad.y') + stupidTweenY)

        setProperty('camFollow.x',400 + (200 * math.cos(cal/7)))
        setProperty('camFollow.y',450 + (100 * math.cos(cal/14)))

        if luaSpriteExists('fireBG') and luaSpriteExists('floorExe') then

            setProperty('fireBG.y', getProperty('fireBG.y') + stupidTweenY)
            setProperty('floorExe.y', getProperty('floorExe.y') + stupidTweenY)

        end
    end
end

local mirrorCur = 0
function onBeatHit()

    if luaSpriteExists('sadnatsuki') then
        if curBeat % 2 == 0 and idleNatsuki and getProperty('sadnatsuki.alpha') > 0.01 then
            playAnim('sadnatsuki','idle',false);
        end
    end

    if luaSpriteExists('fleetway') then
        if curBeat % 2 == 0 and idleFleetway and getProperty('fleetway.alpha') > 0.01 then
            playAnim('fleetway','idle',false);
        end
    end

    if luaSpriteExists('jhondick') then
        if curBeat % 2 == 0 and idleKoopa and getProperty('jhondick.alpha') > 0.01 then
            playAnim('jhondick','idle',false);
        end
    end

    idleNatsuki = true;
    idleFleetway = true;

    if curBeat == 112 or curBeat == 116 or curBeat == 120 or curBeat == 132 or curBeat == 136 or curBeat == 140 
        or curBeat == 344 or curBeat == 348 or curBeat == 352 or curBeat == 356 or curBeat == 358 
        or curBeat == 360 or curBeat == 362 or curBeat == 364 or curBeat == 366 or (curBeat >= 368 and curBeat <= 372) then
        setShaderFloat('glitchShader','intensity',0.03)
        callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})
    end

    if curBeat == 292 or curBeat == 296 or curBeat == 300 or curBeat == 304 or curBeat == 308 or curBeat == 312 or curBeat == 316 or curBeat == 320 then
        setShaderFloat('glitchShader','intensity',0.04)
        callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})
        if curBeat % 8 == 0 then
            setShaderFloat('mirrorShader','x',-1)
        else
            setShaderFloat('mirrorShader','x',0)
        end
    end

    if curBeat == 324 then
        setShaderFloat('mirrorShader','x',0)
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

    if curBeat == 253 then
        setProperty("defaultCamZoom", "0.6")
        doTweenZoom('gameZoom','camGame',1,4.5,'sineOut')
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

    if timeBarType ~= 'Disabled' then
        setProperty('timeTxt.visible',visible)
        setProperty('timeBar.visible',visible)
        setProperty('timeBarBG.visible',visible)
    end

    setProperty('healthBar.visible',visible)
    setProperty('iconP1.visible',visible)
    setProperty('iconP2.visible',visible)
end

function goodNoteHit(id,data,type,sus)

    if curStep >= 96 and curStep <= 127 then
        playAnim('sadnatsuki',getProperty('singAnimations['..data..']'),false)
        setProperty('sadnatsuki.holdTimer',0)
        idleNatsuki = false;
    end

    if type == 'Fleetway Note' then
        playAnim('fleetway',getProperty('singAnimations['..data..']'),false)
        setProperty('fleetway.holdTimer',0)
        idleFleetway = false;
    end

end

function opponentNoteHit(id,data,type,sus)
    if type == 'Koopa Note' then
        playAnim('jhondick',getProperty('singAnimations['..data..']'),false)
        setProperty('jhondick.holdTimer',0)
        idleKoopa = false;
    end
end

function onEvent(n,v1,v2)
    if n == 'Triggers Paranoia' then
        if v1 == '0.75' then
            cancelTween('gameZoom')
            setProperty('camGame.alpha',0.001)
            triggerEvent('Camera Follow Pos', '','')
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

                setProperty('gf.alpha',1)
                doTweenY('upYuri','gf',-370,0.3,'cubeIn')
                doTweenAlpha('fadeMrV','dad',0.001,1,'linear')
                doTweenAlpha('fadeFatal','boyfriend',0.001,1,'linear')

                setCamPos(750,200,'boyfriend')
                setCamPos(750,200,'dad')

                setZoom(0.9,'boyfriend')
                setZoom(0.7,'dad')

                runTimer('appearDokis',0.3)
                
                runHaxeCode([[game.iconP2.changeIcon('yuri-crazy')]]);
            end

            if v2 == '2' then
                characterPlayAnim('gf','ded',false)
                setProperty('gf.specialAnim',true)

                doTweenAlpha('fadeOutBg','bg',0.01,0.3,'linear')
                doTweenAlpha('fadedOutFrontPipes','frontPipes',0.01,0.3,'linear')
                doTweenAlpha('fadedOutPlatform','platform',0.01,0.3,'linear')

                runTimer('fallObjects',0.55)
                callScript('extra_scripts/createShader','createShader',{'mirrorShader','MirrorEffect'})
                callScript('extra_scripts/createShader','createShader',{'glitchShader','GlitchEffect'})
                callScript('extra_scripts/createShader','createShader',{'pixelShader','MosaicEffect'})
                callScript('extra_scripts/createShader','createShader',{'tvShader','TvEffect'})
                callScript('extra_scripts/createShader','runShader',{'game',{'mirrorShader','glitchShader','pixelShader','tvShader'}})
                callScript('extra_scripts/createShader','runShader',{'hud',{'glitchShader','tvShader'}})
            
                setShaderFloat('mirrorShader','zoom',1)
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

                runHaxeCode([[game.iconP2.changeIcon('auditor')]]);

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

                triggerEvent('Change Character','dad','grand')
                triggerEvent('Change Character','boyfriend','sunky')

                setProperty('dad.x',-100)
                setProperty('dad.y',300)

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
                setCamPos(200,400,'dad')
                setCamPos(200,500,'gf')

                setZoom(0.5,'boyfriend')
                setZoom(0.4,'dad')
                setZoom(0.8,'gf')
            end

            if v2 == '2' then
                setProperty('gf.alpha',1)
                characterPlayAnim('gf','intro',false)
                setProperty('gf.specialAnim',true)
                addExtraIcon('gfIcon','NMBendy',false)
            end

            if v2 == '3' then
                callScript('scripts/cameraMoviment','doCamTween',{'dadX','dadY+300',1,'cubeOut'})
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

            if v2 == '5' then
                doTweenX('enterFleetway','fleetway',900,0.3,'linear')
                setProperty('fleetway.alpha',1)

                addExtraIcon('fleetwayIcon','fleetway',true)  
            end

            if v2 == '6' then
                setProperty('fleetway.alpha',0.001)
                setProperty('fleetwayAnim1.alpha',1)
                playAnim('fleetwayAnim1','step it up',false)
            end

            if v2 == '7' then
                playAnim('fleetwayAnim1','laser',false)
            end

            if v2 == '8' then
                setProperty('fleetwayAnim1.alpha',0.001)
                setProperty('fleetwayAnim2.alpha',1)
                playAnim('fleetwayAnim2','laser',false)
            end
        end

        if v1 == '7' then
            if v2 == '1' then
                cameraFlash('game','FF0000',1)

                callScript('extra_scripts/extraCharacter','removeCharacter',{'fleetway',true})
                removeFromMemory('mariohorror-melt',true)
                removeFromMemory('sunky',true)
                removeExtraIcon('fleetwayIcon',true)
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','dad','adventuresonic')
                triggerEvent('Change Character','boyfriend','bf-legacy')

                setObjectOrder('dad',getObjectOrder('bgAdventure2') + 1)
                setObjectOrder('boyfriend',getObjectOrder('bgAdventure2') + 1)

                setProperty('gf.alpha', 0.001)
                setProperty('dad.x',-100)
                setProperty('dad.y',250)

                setProperty('boyfriend.x',700)
                setProperty('boyfriend.y',400)

                setCamPos(500,400,'boyfriend')
                setCamPos(500,400,'dad')
                setCamPos(500,400,'gf')

                setZoom(0.6,'boyfriend')
                setZoom(0.6,'dad')
                setZoom(0.6,'gf')
            end

            if v2 == '2' then
                characterPlayAnim('dad','idle-alt-evil',true)
                setProperty('dad.specialAnim',true)
            end

            if v2 == '3' then
                makeVideoSprite('myCutscene', '1', 0, 0, 'camGame', false)
                setProperty('myCutscene_video.alpha', 1)
            end
        end

        if v1 == '8' then
            if v2 == '1' then

                preloadCharacters(2);

                removeFromMemory('adventuresonic',true)
                removeFromMemory('bf-legacy',true)

                triggerEvent('Change Character','dad','p2exe')
                triggerEvent('Change Character','boyfriend','Tailas')

                setProperty('dad.x',-100)
                setProperty('dad.y',250)

                setProperty('boyfriend.x',700)
                setProperty('boyfriend.y',400)

                setZoom(0.45,'boyfriend')
                setZoom(0.45,'dad')
                setZoom(0.45,'gf')

                setCamPos(500,400,'boyfriend')
                setCamPos(500,400,'dad')
                setCamPos(500,400,'gf')

                setOffs(0,'gf')
                setOffs(0,'boyfriend')
                setOffs(0,'dad')
            end

            if v2 == '2' then
                stupidTweenY = 30;
            end

            if v2 == '3' then
                stupidTweenY = 0;
            end
        end

        if v1 == '9' then
            if v2 == '1' then
                removeFromMemory('p2exe',true)
                removeFromMemory('Tailas',true)
                removeFromMemory('nightmare-bendy',true)

                triggerEvent('Change Character','dad','luigi-toolate')
                triggerEvent('Change Character','gf','mxV2')
                triggerEvent('Change Character','boyfriend','elizabeth')

                setProperty('gf.alpha',1)

                setProperty('dad.x',-1100)
                setProperty('dad.y',1250)

                setProperty('boyfriend.x',0)
                setProperty('boyfriend.y',1000)

                setProperty('gf.x',850)
                setProperty('gf.y',1100)

                setCamPos(500,400,'boyfriend')
                setCamPos(500,400,'dad')
                setCamPos(500,400,'gf')

                setZoom(0.45,'boyfriend')
                setZoom(0.45,'dad')
                setZoom(0.45,'gf')
                
                stopStupid = true;

                doTweenY('moveUpLuigiTL','dad',150,0.5,'linear')
                doTweenY('moveUpMx','gf',0,0.3,'linear')
                doTweenY('moveUpElizabeth','boyfriend',300,0.3,'linear')
                doTweenY('moveUpPortFloor','portFloor',500,0.3,'linear')
            end

            if v2 == '2' then
                characterPlayAnim('boyfriend','micflipchallengue',false)
                setProperty('boyfriend.specialAnim',true)
                doTweenZoom('showMostFunny','camGame',1,3,'linear')
            end

            if v2 == '3' then
                removeFromMemory('elizabeth',true)

                triggerEvent('Change Character','boyfriend','elizabeth-pov')

                setProperty('dad.alpha',0.001)
                setProperty('gf.alpha',0.001)
                setProperty('portLights.alpha',0.001)

                setProperty('boyfriend.x',100)
                setProperty('boyfriend.y',200)

                setZoom(0.45,'boyfriend')
                setZoom(0.45,'dad')
                setZoom(0.45,'gf')

                stopStupid = true;
                setShaderFloat('glitchShader','intensity',0.03)
                callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})
            end

            if v2 == '4' then
                removeFromMemory('elizabeth-pov',true)

                triggerEvent('Change Character','boyfriend','elizabeth-maniacota-pov')

                setProperty('boyfriend.x',100)
                setProperty('boyfriend.y',200)
            end
        end

        if v1 == '10' then
            if v2 == '1' then

                removeFromMemory('luigi-toolate',true)
                removeFromMemory('mxV2',true)

                triggerEvent('Change Character','dad','gold')
                triggerEvent('Change Character','gf','rogergold')

                callScript('extra_scripts/extraCam','insertObjectOnCam',{'dad','extraCam'})
                callScript('extra_scripts/extraCam','insertObjectOnCam',{'gf','extraCam'})

                setProperty('dad.alpha',1)
                setProperty('gf.alpha',1)

                
                setProperty('dad.x',100)
                setProperty('dad.y',300)

                setProperty('gf.x',900)
                setProperty('gf.y',100)


                characterPlayAnim('gf','fadeIn',false)
                setProperty('gf.specialAnim',true)

                characterPlayAnim('dad','fadeIn',false)
                setProperty('dad.specialAnim',true)

                setCamPos(900,600,'boyfriend')
                setCamPos(900,600,'dad')
                setCamPos(900,600,'gf')

                setZoom(0.3,'boyfriend')
                setZoom(0.3,'dad')
                setZoom(0.3,'gf')

                setOffs(50,'dad')
                setOffs(50,'gf')
                setOffs(50,'boyfriend')
            end

            if v2 == '2' then
                
                characterPlayAnim('gf','fadeOut',false)
                setProperty('gf.specialAnim',true)

                characterPlayAnim('dad','fadeOut',false)
                setProperty('dad.specialAnim',true)
            end

            if v2 == '3' then
                setShaderFloat('glitchShader','intensity',0.3)
                callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,0.5,'circOut'})

                removeFromMemory('elizabeth-maniacota-pov',true)
                triggerEvent('Change Character','boyfriend','taki-monofrenzy')

                setProperty('boyfriend.x',250)
                setProperty('boyfriend.y',400)

                setCamPos(900,600,'boyfriend')
                setCamPos(900,600,'dad')
                setCamPos(900,600,'gf')
                setZoom(0.4,'boyfriend')

            end

            if v2 == '5' then

                removeFromMemory('gold',true)
                removeFromMemory('rogergold',true)

                triggerEvent('Change Character','gf','djmario')
                triggerEvent('Change Character','dad','piracyhead')

                setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)

                setProperty('dad.alpha',1)
                setProperty('gf.alpha',1)

                setProperty('dad.x',-200)
                setProperty('dad.y',-600)

                setProperty('gf.x',800)
                setProperty('gf.y',1200)

                doTweenY('moveBottomPiracy','dad',0,0.3,'linear')
                doTweenY('moveUpDjHallybo','gf',400,0.3,'linear')
                
                setZoom(0.5,'boyfriend')
                setZoom(0.5,'dad')
                setZoom(0.5,'gf')

                setCamPos(700,600,'boyfriend')
                setCamPos(700,600,'dad')
                setCamPos(700,600,'gf')
            end

            if v2 == '6' then
                setProperty('jhondick.alpha',1)
                doTweenY('moveUpKoopa','jhondick',-200,0.3,'linear')

                doTweenX('leavePiracy','dad',-1500,0.8,'linear')
                doTweenX('leaveDJHallybo','gf',1500,0.7,'linear')
            end

            if v2 == '7' then
                removeFromMemory('djmario',true)

                triggerEvent('Change Character','gf','tord-in-bot-scaled')
                setProperty('gf.x',-800)
                setProperty('gf.y',400)

                activateStupidTweenKoopa = false;
                doTweenX('moveKoopaRight','jhondick',900,0.5,'linear')
                doTweenX('moveTakiRight','boyfriend',1600,0.8,'linear')
                doTweenX('moveTordRight','gf',-300,0.8,'linear')

                                
                setZoom(0.4,'boyfriend')
                setZoom(0.4,'dad')
                setZoom(0.4,'gf')
            end

            if v2 == '8' then
                defineShell()
                throwShell = true;
                playSound('smw_shell_kick')
            end

            if v2 == '9' then

                removeFromMemory('piracyhead',true)

                triggerEvent('Change Character','dad','badmario')
                setProperty('dad.x',-400)
                setProperty('dad.y',450)

                setObjectCamera('dad','camHUD')

                setProperty('dad.velocity.x',1000)
                playAnim('dad','jump3',true)
                setProperty('dad.specialAnim',true)
                setProperty('dad.velocity.y',-1200)
                setProperty('dad.acceleration.y',2700)
                playSound('line6')

                removeFromMemory('taki-monofrenzy',true)

                triggerEvent('Change Character','boyfriend','gfreddy2')
                callScript('extra_scripts/extraCam','insertObjectOnCam',{'boyfriend','camFNAF'})

                setProperty('boyfriend.x',-400)
                setProperty('boyfriend.y',-250)
            end

            if v2 == '10' then
                setProperty('dad.velocity.y',0)
                setProperty('dad.velocity.x',0)
                setProperty('dad.acceleration.y',0)
                setProperty('vocals.volume', 1)
                stopMario = true;
                setProperty('dad.flipX',true)
                callScript('extra_scripts/extraCharacter','removeCharacter',{'jhondick',true})

                setOffs(0,'dad')
                setOffs(0,'gf')
                setOffs(0,'boyfriend')

                setCamPos(700,850,'boyfriend')
                setCamPos(700,850,'dad')
                setCamPos(700,850,'gf')
            end

            if v2 == '11' then
                setProperty('dad.velocity.x',1000)
                playAnim('dad','run',true)
                setProperty('dad.flipX',false)
                setProperty('dad.specialAnim',true)
                throwShell = false;
                marioRuning = true;
            end

            if v2 == '12' then
                marioRuning = false;
                gfPissed = false;

                removeFromMemory('badmario',true)
                triggerEvent('Change Character','dad','sunshineExe')

                setObjectCamera('dad','camHUD')
                setProperty('dad.x',500)
                setProperty('dad.y',700)
                setProperty('dad.velocity.x',0)
                setProperty('dad.velocity.y',0)
                setProperty('dad.acceleration.y',0)

                doTweenY('UpZalgo','dad',100,0.2,'linear')
                runTimer('byeExtraCam',0.1)
            end

            if v2 == '13' then
                setShaderFloat('glitchShaderCAMGAME','intensity',1)
                callScript('extra_scripts/createShader','doShaderTween',{'glitchShaderCAMGAME','intensity',0,0.8,'circOut'})
                removeFromMemory('tord-in-bot-scaled',true)
                triggerEvent('Change Character','gf','asmodeusZenith')

                setProperty('gf.x',-100)
                setProperty('gf.y',400)
            end
        end

        if v1 == '11' then
            if v2 == '1' then
                removeFromMemory('sunshineExe',true)
                removeFromMemory('gfreddy2',true)
                triggerEvent('Change Character','boyfriend','cutephantom')
                triggerEvent('Change Character','dad','giffany_broken')
    
                setObjectCamera('boyfriend','camHUD')
                setProperty('dad.alpha',1)
                setProperty('gf.alpha',0.001)
    
                setProperty('dad.x',600)
                setProperty('dad.y',800)
    
                setProperty('boyfriend.x',900)
                setProperty('boyfriend.y',1200)
                

                setOffs(0,'boyfriend')
                setOffs(0,'dad')
                setOffs(0,'gf')

                setZoom(1,'boyfriend')
                setZoom(1,'dad')
                setZoom(1,'gf')
            end

            if v2 == '2' then
                doTweenY('moveUpCutePhantom','boyfriend',200,0.5,'linear')
            end
        end

        if v1 == '12' then
            if v2 == '1' then
                removeFromMemory('giffany_broken',true)

                triggerEvent('Change Character','dad','1stpink')

                setProperty('dad.x',100)
                setProperty('dad.y',450)
    
                doTweenY('moveBottomCutePanthom','boyfriend',1200,0.5,'linear')
            end

            if v2 == '2' then
                removeFromMemory('cutephantom',true)

                triggerEvent('Change Character','boyfriend','yellowghost')
                setObjectCamera('boyfriend','camHUD')

                setProperty('boyfriend.x',300)
                setProperty('boyfriend.y',1200)

                doTweenY('moveUpYellowGhost','boyfriend',300,0.5,'linear')
            end
        end

        if v1 == '13' then
            if v2 == '1' then
                cameraFlash('camGame','FF0000',0.3)
                playSound('Psyshock')

                removeFromMemory('asmodeusZenith',true)
                removeFromMemory('1stpink',true)
                removeFromMemory('yellowghost',true)

                triggerEvent('Change Character','dad','shitno')
                triggerEvent('Change Character','gf','luigi_fountain3d')
                triggerEvent('Change Character','boyfriend','rosa')
                setProperty('gf.alpha',1)

                setProperty('dad.x',100)
                setProperty('dad.y',650)

                setProperty('gf.x',500)
                setProperty('gf.y',-1500)

                setProperty('boyfriend.x',950)
                setProperty('boyfriend.y',1500)
    
                setOffs(50,'boyfriend')
                setOffs(50,'dad')
                setOffs(50,'gf')

                setZoom(0.7,'boyfriend')
                setZoom(0.7,'dad')
                setZoom(0.7,'gf')
            end

            if v2 == '2' then
                doTweenY('moveUpRosa','boyfriend',600,0.5,'linear')
            end

            if v2 == '3' then
                doTweenY('moveBottomAbandonedLuigi','gf',400,0.5,'linear')
                setZoom(0.7,'boyfriend')
                setZoom(1,'dad')
                setZoom(1,'gf')

                addExtraIcon('gfIcon','wdwluigi3D',false)
            end

            if v2 == '4' then
                callScript('extra_scripts/createShader','doShaderTween',{'mirrorShader','zoom',0.5,0.2,'circOut'})
            end
        end

        if v1 == '14' then
            if v2 == '1' then
                setShaderFloat('glitchShader','intensity',0.03)
                callScript('extra_scripts/createShader','doShaderTween',{'glitchShader','intensity',0,stepCrochet*0.0035,'circOut'})
                callScript('extra_scripts/createShader','doShaderTween',{'mirrorShader','zoom',1,0.3,'circOut'})

                removeExtraIcon('gfIcon',true)
                removeFromMemory('shitno',true)
                removeFromMemory('rosa',true)

                triggerEvent('Change Character','dad','marioexedpov')
                triggerEvent('Change Character','boyfriend','M1KU_FS')

                
                setProperty('dad.x',450)
                setProperty('dad.y',300)

                setProperty('boyfriend.x',1050)
                setProperty('boyfriend.y',750)

                setProperty('gf.alpha',0.001)

                setZoom(0.8,'boyfriend')
                setZoom(0.8,'dad')
                setZoom(0.8,'gf')

                setCamPos(900,850,'boyfriend')
                setCamPos(900,850,'dad')
                setCamPos(900,850,'gf')
            end
        end
    end
end

function reconfigureShaders()
    callScript('extra_scripts/createShader','removeShaderCamera',{0,{'game','hud'}})

    callScript('extra_scripts/createShader','createShader',{'mirrorShader','MirrorEffect'})
    callScript('extra_scripts/createShader','createShader',{'glitchShader','GlitchEffect'})
    callScript('extra_scripts/createShader','createShader',{'glitchShaderCAMGAME','GlitchEffect'})
    callScript('extra_scripts/createShader','runShader',{'game',{'mirrorShader','glitchShader','glitchShaderCAMGAME'}})
    callScript('extra_scripts/createShader','runShader',{'hud',{'glitchShader'}})

    setShaderFloat('mirrorShader','zoom',1)
end

function defineShell()
    setProperty('shell.velocity.x',2000)
    setProperty('shell.acceleration.y',500)
    updateHitbox('shell')
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
        reconfigureShaders()
    end

    if tag == 'byeExtraCam' then
        byeExtraCam2 = true;
        doTweenX("funCamX", "camFNAF", 1400, 2, "circout")
        doTweenY("funCamY", "camFNAF", 0, 4, "circout")
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

    if tag == 'moveUpPortFloor' then
        stopStupid = false;
    end

    if tag == 'moveUpKoopa' then
        activateStupidTweenKoopa = true;
    end

    if tag == 'moveKoopaRight' then
        activateStupidTweenKoopa = true;
        setProperty('jhondick.flipX',true)
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