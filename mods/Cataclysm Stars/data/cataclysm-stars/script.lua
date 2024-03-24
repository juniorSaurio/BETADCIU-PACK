local isAct1 = true;
local isAct2pt2 = false;
local singsTrioTogether = false;
local singsTrioPlayerTogether = false;
local enableFloatingDad = false;
local pos = 1;
local enableAllIcons = true;

function precacheCharacters() 

    addCharacterToList('godfield_phase2','dad')

    addCharacterToList('god_gorefield','dad')
    addCharacterToList('god_gore_jhon','boyfriend')

    addCharacterToList('god_cat_lassagna','gf')
    addCharacterToList('god_cat_lassagna_flip','gf')

    precacheImage('characters/GOD_LASAGNA')
    callScript('extra_scripts/extraCharacter','createCharacter',{'jhon-lassagna','god_jhon_lassagna',700,0})
    setProperty('jhon-lassagna.alpha',0.001)

    precacheImage('characters/GOD_SANSFIELD_ASSETS')
    callScript('extra_scripts/extraCharacter','createCharacter',{'sansfield','god_sansfield',0,-600})
    setProperty('sansfield.alpha',0.001)

    precacheImage('characters/GOD_BF_SANS')
    callScript('extra_scripts/extraCharacter','createCharacter',{'bf_sans','god_bf_sans',0,180})
    setProperty('bf_sans.alpha',0.001)

    callScript('extra_scripts/extraCharacter','createCharacter',{'jhon-lassagna_flip','god_jhon_lassagna_flip',200,1500})
    setProperty('jhon-lassagna_flip.alpha',0.001)

    addCharacterToList('cryfield','dad')
    addCharacterToList('cryfield_monster','dad')
    addCharacterToList('nermal_cry','boyfriend')
    addCharacterToList('nermal_cry_small','boyfriend')
    addCharacterToList('jon_sombra','gf')

    addCharacterToList('nermall_fall','boyfriend')
    addCharacterToList('super_godfield','dad')

    addCharacterToList('cruz_nermal_final','boyfriend')
    addCharacterToList('ultra_godfield','dad')
end


function onCreate()

    addLuaScript('extra_scripts/camFade')
    addLuaScript('extra_scripts/extraIcon')
    addLuaScript('extra_scripts/extraCharacter')
    addLuaScript('custom_events/Set Cam Zoom')

    setProperty('skipCountdown',true)

    precacheCharacters()

end

function onCreatePost()
    setProperty('boyfriend.x',0)
    setProperty('boyfriend.y',200)

    setProperty('dad.x',220)
    setProperty('dad.y',-400)

    setCamPos(400,-200,'dad')
    setCamPos(400,100,'boyfriend')

    setZoom(0.5,'dad')
    setZoom(0.65,'boyfriend')

    makeAnimatedLuaSprite('godfieldPhase1Icon','icons/1_FORM_GODFIELD-anim',0,0)
    addAnimationByPrefix('godfieldPhase1Icon','idle','idle',24,true)
    setObjectCamera('godfieldPhase1Icon','hud')
    addLuaSprite('godfieldPhase1Icon',true)

    makeAnimatedLuaSprite('nermalldPhase1Icon','icons/NERMAL_GODFIELD-anim',0,0)
    addAnimationByPrefix('nermalldPhase1Icon','idle','idle',24,true)
    addAnimationByPrefix('nermalldPhase1Icon','losing','losing',24,true)
    setObjectCamera('nermalldPhase1Icon','hud')
    addLuaSprite('nermalldPhase1Icon',true)

    playAnim('nermalldPhase1Icon','idle',true)

    makeAnimatedLuaSprite('godfieldPhase2Icon','icons/GODFIELD_TRUE_FORM-anim',0,0)
    addAnimationByPrefix('godfieldPhase2Icon','idle','idle',24,true)
    setObjectCamera('godfieldPhase2Icon','hud')
    addLuaSprite('godfieldPhase2Icon',true)
    setProperty('godfieldPhase2Icon.alpha',0.001)

    setObjectOrder('scoreTxt',getObjectOrder('godfieldPhase2Icon') + 2)

end

function onBeatHit()

    singsTrioTogether = false;
    singsTrioPlayerTogether = false;
    
    if curBeat == 300 then
        enableFloatingDad = true;
        runTimer('tweenMoveDad',6.5)
        triggerEvent('Set Trail Params', 'dad', 'delay=0.075|alpha=0.6|tweenX=40|tweenY=-100|scaleX=0.85|scaleY=0.25|secs=0.50|color="FFFF00"');
        triggerEvent('Toggle Godly Trail', 'dad', 'on');
    end
end

function removeFromMemory(image,isCharacter)
    if not isCharacter then
        callScript('scripts/optimization','removeFromMemory',{image})
    else
        callScript('scripts/optimization','removeCharacterFromMemory',{image})
    end
end

function onUpdate(elapsed)
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.8)
    local cal = getSongPosition()/bpm
    

    if getProperty('dad.curCharacter') == 'godfield_phase1' or isAct1 then
        setProperty('iconP2.alpha',0)
        setProperty('godfieldPhase1Icon.x',getProperty('iconP2.x') +10)
		setProperty('godfieldPhase1Icon.y',getProperty('iconP2.y'))
		setProperty('godfieldPhase1Icon.scale.x',getProperty('iconP2.scale.x'))
		setProperty('godfieldPhase1Icon.scale.y',getProperty('iconP2.scale.y'))
    end

    if getProperty('boyfriend.curCharacter') == 'god_nermall' or getProperty('boyfriend.curCharacter') == 'nermall_fall' 
        or getProperty('boyfriend.curCharacter') == 'cruz_nermal_final' then

        setProperty('iconP1.alpha',0)
		setProperty('nermalldPhase1Icon.scale.x',getProperty('iconP1.scale.x'))
		setProperty('nermalldPhase1Icon.scale.y',getProperty('iconP1.scale.y'))

        if getProperty('boyfriend.curCharacter') == 'god_nermall' then
            setProperty('nermalldPhase1Icon.alpha',1)
            setProperty('nermalldPhase1Icon.x',getProperty('iconP1.x') + 20)
            setProperty('nermalldPhase1Icon.y',getProperty('iconP1.y'))
        end

        if getProperty('boyfriend.curCharacter') == 'nermall_fall' or getProperty('boyfriend.curCharacter') == 'cruz_nermal_final' then
            setProperty('nermalldPhase1Icon.alpha',0.5)
            setProperty('nermalldPhase1Icon.x',getProperty('iconP1.x') - 10 )
            setProperty('nermalldPhase1Icon.y',getProperty('iconP1.y') - 50)
        end

        if not enableAllIcons then
            setProperty('nermalldPhase1Icon.alpha',0.001)
        end

    end

    if getProperty('dad.curCharacter') == 'godfield_phase2' or getProperty('dad.curCharacter') == 'super_godfield'
        or getProperty('dad.curCharacter') == 'ultra_godfield' then

        if getProperty('dad.curCharacter') == 'godfield_phase2' then
            setProperty('godfieldPhase2Icon.alpha',1)
        end

        if getProperty('dad.curCharacter') == 'super_godfield' or getProperty('dad.curCharacter') == 'ultra_godfield' then
            setProperty('godfieldPhase2Icon.alpha',0.5)
        end

        setProperty('iconP2.alpha',0)
        setProperty('godfieldPhase2Icon.x',getProperty('iconP2.x')-40)
		setProperty('godfieldPhase2Icon.y',getProperty('iconP2.y')-60)
		setProperty('godfieldPhase2Icon.scale.x',getProperty('iconP2.scale.x'))
		setProperty('godfieldPhase2Icon.scale.y',getProperty('iconP2.scale.y'))

        if enableFloatingDad then
            doTweenX('stupidTweenDadX','dad',getProperty('dad.x') + (pos * 5 * math.cos(cal/7)),0.001)
            doTweenY('stupidTweenDadY','dad',getProperty('dad.y') + (-2 * math.cos(cal/14)),0.001)
        else
            cancelTween('stupidTweenDadX')
            cancelTween('stupidTweenDadY')
        end

        if not enableAllIcons then
            setProperty('godfieldPhase2Icon.alpha',0.001)
        end
    else 
        setProperty('godfieldPhase2Icon.alpha',0.001)
        cancelTween('stupidTweenDadX')
        cancelTween('stupidTweenDadY')
    end


    if isAct2pt2 then
        if singsTrioTogether then
            setZoom(0.5,'dad')
            setCamPos(200,-100,'dad')
        else
            setZoom(0.7,'dad')
            setCamPos(-200,-100,'dad')
        end

        if singsTrioPlayerTogether then
            setZoom(0.7,'boyfriend')
            setCamPos(200,200,'boyfriend')
        end
    end

    if getProperty('dad.curCharacter') == 'ultra_godfield' then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            setProperty('boyfriend.x',340)
            setProperty('boyfriend.y',195)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            setProperty('boyfriend.x',290)
            setProperty('boyfriend.y',200)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            setProperty('boyfriend.x',310)
            setProperty('boyfriend.y',160)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            setProperty('boyfriend.x',300)
            setProperty('boyfriend.y',180)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            setProperty('boyfriend.x',300)
            setProperty('boyfriend.y',210)
        end
    end 

end

function onEvent(name,v1,v2)
    if name == 'Triggers All Stars' then

        if v1 == '0' then
            cameraFlash('camHUD', '0xFFFFFFFF', 0.4)
        end

        if v1 == '1' then
            if v2 == '1' then
                makeVideoSprite('cutsceneIntro', 'intro', 0, 0, 'camOther', false)
                setProperty('cutsceneIntro_video.alpha', 1)
            end
        end

        if v1 == '2' then
            if v2  == '1' then

                removeFromMemory('godfield_phase1',true)
                triggerEvent('Change Character','dad','godfield_phase2')

                characterPlayAnim('dad','transformation',false)
                setProperty('dad.specialAnim',true)
                
                doTweenZoom('zoomCamGame','camGame',1,0.5,'linear')

                setProperty('dad.x',-270)
                setProperty('dad.y',-950)

                runTimer('waitToFadeHUD',1.5)  
            end

            if v2 == '2' then
                triggerEvent('Toggle Godly Trail', 'dad', 'off');

                removeFromMemory('god_nermall',true)
                triggerEvent('Change Character','dad','god_gorefield')
                triggerEvent('Change Character','boyfriend','god_gore_jhon')

                setObjectOrder('boyfriend',getObjectOrder('tv_GOD') + 1)

                setProperty('nermalldPhase1Icon.alpha',0.001)

                setProperty('dad.x',-150)
                setProperty('dad.y',-500)

                setProperty('boyfriend.x',-200)
                setProperty('boyfriend.y',-140)

                setProperty('iconP1.alpha',1)
                setProperty('iconP2.alpha',1)

                setZoom(0.9,'dad')
                setZoom(1,'boyfriend')
                
                setCamPos(600,-100,'dad')
                setCamPos(350,-100,'boyfriend')

                enableFloatingDad = false;  
            end

            if v2 == '3' then

                triggerEvent('Change Character','gf','god_cat_lassagna')
                setProperty('jhon-lassagna.alpha',1)

                addExtraIcon('GCIcon','LB_GOREFIELD_GOD',false)
                extraIcon('setIconProperty',{'GCIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'GCIcon'})

                addExtraIcon('JLIcon','LB_JON_GODFIELD',true)
                extraIcon('setIconProperty',{'JLIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'JLIcon'})

                setProperty('iconP1.alpha',0.001)
                setProperty('iconP2.alpha',0.001)

                setProperty('dad.alpha',0.001)
                setProperty('boyfriend.alpha',0.001)
                
                setZoom(0.7,'dad')
                setZoom(0.7,'boyfriend')
                
                setCamPos(600,-100,'dad')
                setCamPos(300,100,'gf')
                setCamPos(400,100,'boyfriend')

                setProperty('gf.x',-500)
                setProperty('gf.y',-200)
            end

            if v2 == '4' then

                addExtraIcon('BFSIcon','BF_sansfield_ingame',true)
                extraIcon('setIconProperty',{'BFSIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'BFSIcon'})
                

                addExtraIcon('SFIcon','sansfield_GOD',false)
                extraIcon('setIconProperty',{'SFIcon','followAlpha',false})
                extraIcon('setIconAsPrincipal',{'SFIcon'})
                setProperty('SFIcon.offset.x',getProperty('SFIcon.offset.x') + 10)
                setProperty('SFIcon.offset.y',getProperty('SFIcon.offset.y') + 20)

                setProperty('jhon-lassagna.alpha',0.001)
                setProperty('gf.alpha',0.001)

                setProperty('JLIcon.alpha',0.001)
                setProperty('GCIcon.alpha',0.001)

                setProperty('bf_sans.alpha',1)
                setProperty('sansfield.alpha',1)
                
                setZoom(0.6,'dad')
                setZoom(0.9,'bf')

                setCamPos(-200,-100,'dad')
                setCamPos(600,-100,'gf')
                setCamPos(200,-100,'sansfield')

                setCamPos(0,200,'boyfriend')
                setCamPos(200,200,'bf_sans')
                setCamPos(400,200,'jhon-lassagna')

            end

            if v2 == '5' then
                addExtraIcon('GFGIcon','godfield_gore',false)
                extraIcon('setIconProperty',{'GFGIcon','followAlpha',false})

                setProperty('dad.alpha',1)

                setProperty('dad.x',-2000)
                setProperty('dad.y',-750)

                doTweenX('moveGorefieldRight','dad',-1200,0.3,'linear')

                setZoom(0.7,'dad')
                setZoom(0.7,'bf')
                setZoom(0.7,'gf')
                isAct2pt2 = true;
            end

            if v2 == '6' then
                --removeFromMemory('god_cat_lassagna',true)
                triggerEvent('Change Character','gf','god_cat_lassagna_flip')

                setProperty('gf.alpha',1)
                setProperty('GCIcon.alpha',1)

                setProperty('gf.x',1500)
                setProperty('gf.y',-650)

                doTweenX('moveLBGorefieldRight','gf',600,0.3,'linear')
            end

            if v2 == '7' then
                setProperty('boyfriend.alpha',1)

                addExtraIcon('JGGIcon','godfield_jon',true)
                extraIcon('setIconProperty',{'JGGIcon','followAlpha',false})

                setProperty('JGGIcon.offset.x',getProperty('JGGIcon.offset.x') - 30)

                setProperty('boyfriend.x',-200)
                setProperty('boyfriend.y',500)

                doTweenY('moveUpJhonGoreGod','boyfriend',40,0.3,'linear')
            end

            if v2 == '8' then
                setProperty('jhon-lassagna_flip.alpha',1)
                setProperty('JLIcon.alpha',1)
                setProperty('JLIcon.offset.y',getProperty('BFSIcon.offset.y') + 65)

                doTweenY('moveUpJhonLassgnaGod','jhon-lassagna_flip',100,0.3,'linear')
            end

            if v2 == '9' then
                for i = 0, 7 do
                    setObjectCamera('strumLineNotes.members['..i..']','camHUD')
                    callMethod('strumLineNotes.members['..i..'].scrollFactor.set', {1, 1})
                end
                
                for i = 0, getProperty('unspawnNotes.length')-1 do
                    setObjectCamera('unspawnNotes['..i..']','camHUD')
                    callMethod('unspawnNotes['..i..'].scrollFactor.set', {1, 1})
                end

                doTweenAlpha('gameAlpha','camGame',0.001,0.4,'linear')
                setProperty('vignette.alpha',0.001)
                doTweenY('hudY','camHUD',1000,1.2,'circIn')
                doTweenAngle('hudAngle','camHUD',30,2,'circIn')
                doTweenAlpha('hudAlpha','camHUD',0,2,'circIn')
            end
        end

        if v1 == '3' then
            if v2 == '1' then
                isAct2pt2 = false;
                doTweenAlpha('gameAlpha','camGame',1,0.7,'linear')
                setProperty('vignette.alpha',1)

                callScript('extra_scripts/extraCharacter','removeCharacter',{'jhon-lassagna',true})
                callScript('extra_scripts/extraCharacter','removeCharacter',{'jhon-lassagna_flip',true})
                callScript('extra_scripts/extraCharacter','removeCharacter',{'bf_sans',true})
                callScript('extra_scripts/extraCharacter','removeCharacter',{'sansfield',true})

                removeExtraIcon('BFSIcon',true)
                removeExtraIcon('SFIcon',true)
                removeExtraIcon('GFGIcon',true)
                removeExtraIcon('GCIcon',true)
                removeExtraIcon('JGGIcon',true)
                removeExtraIcon('JLIcon',true)

                removeFromMemory('god_gorefield',true)
                removeFromMemory('god_gore_jhon',true)
                --removeFromMemory('godfield_phase2',false)
                --removeFromMemory('god_cat_lassagna',false)

                triggerEvent('Change Character','dad','cryfield')
                triggerEvent('Change Character','boyfriend','nermal_cry')

                setProperty('gf.alpha',0.001)
                setProperty('iconP1.alpha',1)
                setProperty('iconP2.alpha',1)

                setCamPos(60,300,'dad')
                setCamPos(600,100,'gf')
                setCamPos(300,300,'boyfriend')

                setProperty('dad.x',-600)
                setProperty('dad.y',0)

                setProperty('boyfriend.x',500)
                setProperty('boyfriend.y',0)
                
                setZoom(0.7,'dad')
                setZoom(0.7,'bf')
                setZoom(0.7,'gf')
                
            end

            if v2 == '2' then
                cancelTween('hudY')
                cancelTween('hudAngle')
                setProperty('camHUD.angle',0)
                setProperty('camHUD.y',0)
                doTweenAlpha('hudAlpha','camHUD',1,1,'linear')
            end

            if v2 == '3' then

                cameraFlash('camHUD', '0xFFFFFFFF', 0.4)

                removeFromMemory('cryfield',true)
                removeFromMemory('nermal_cry',true)

                triggerEvent('Change Character','dad','cryfield_monster')
                triggerEvent('Change Character','boyfriend','nermal_cry_small')
                triggerEvent('Change Character','gf','jon_sombra')

                setProperty('gf.alpha',0.8)
                setObjectCamera('gf','camHUD')

                setCamPos(60,300,'dad')
                setCamPos(700,550,'boyfriend')

                setProperty('dad.x',-600)
                setProperty('dad.y',0)

                setProperty('boyfriend.x',700)
                setProperty('boyfriend.y',450)

                setProperty('gf.x',100)
                setProperty('gf.y',0)
                
                setZoom(0.8,'dad')
                setZoom(1.8,'bf')
            end

            if v2 == '4' then
                doTweenY('moveJonSombraBottom','gf',800,0.6,'circIn')
            end

            if v2 == '5' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.4)
                setProperty('gf.x',0)
                setProperty('gf.y',0)

                doTweenX('moveRightJonSombra','gf',900,25,'linear')
            end

            if v2 == '6' then
                doTweenZoom('camZoomTween','camGame',5,0.4,'linear')
            end
        end

        if v1 == '4' then
            if v2 == '1' then
                makeVideoSprite('cutsceneCinematic', 'GODFIELD_CINEMATIC', 0, 0, 'camOther', false)
                setProperty('cutsceneCinematic_video.alpha', 1)
            end

            if v2 == '2' then
                setProperty('camGame.visible',true)
                setProperty('camHUD.visible',true)
                setProperty('healthBar.alpha',0.5)

                setProperty('gf.visible',false)

                removeFromMemory('nermal_cry_small',true)
                removeFromMemory('cryfield_monster',true)
                triggerEvent('Change Character','dad','super_godfield')
                triggerEvent('Change Character','boyfriend','nermall_fall')

                setProperty('dad.x',-300)
                setProperty('dad.y',330)

                setProperty('boyfriend.x',200)
                setProperty('boyfriend.y',-450)
            
                setCamPos(400,0,'dad')
                setCamPos(400,0,'boyfriend')
            
                setZoom(0.55,'dad')
                setZoom(0.55,'boyfriend')

                playAnim('nermalldPhase1Icon','losing',true)
                setProperty('nermalldPhase1Icon.alpha',0.5)
            end

            if v2 == '3' then
                doTweenZoom('camGameZoomFinal','camGame',1,3,'linear')
                doTweenY('moveSuperGodfieldBottom','dad',1500,3,'linear')
                doTweenY('moveNermallFalldBottom','boyfriend',-150,2,'linear')
                doTweenY('moveSeparatordBottom','RAYO_DIVISOR',1000,3,'linear')
                doTweenY('moveWindBottom','viento',-500,3,'linear')
                doTweenAlpha('fadeInVignette','vignette',1,3,'linear')
            end

            if v2 == '4' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
                setProperty('healthBar.alpha',0.001)
                setProperty('extraIconDad.alpha',0.001)
                enableAllIcons = false;
            end

            if v2 == '5' then
                doTweenZoom('camGameZoomScene','camGame',0.6,3,'linear')
            end

            if v2 == '6' then
                setProperty('NERMALL_CRUCIFICCION.alpha',1)
                playAnim('NERMALL_CRUCIFICCION','anim',true)
                setProperty('boyfriend.alpha',0.01)
            end

            if v2 == '7' then

                cameraFlash('camHUD', '0xFFFFFFFF', 0.2)

                setProperty('healthBar.alpha',1)
                setProperty('boyfriend.alpha',1)
                enableAllIcons = true;

                removeFromMemory('super_godfield',true)
                removeFromMemory('nermall_fall',true)

                triggerEvent('Change Character','dad','ultra_godfield')
                triggerEvent('Change Character','boyfriend','cruz_nermal_final')

                setProperty('dad.x',-300)
                setProperty('dad.y',-450)

                setProperty('boyfriend.x',300)
                setProperty('boyfriend.y',210)

                setZoom(0.85,'dad')
                setZoom(0.85,'boyfriend')
                setCamPos(390,100,'dad')
                setCamPos(390,100,'boyfriend')
            end

            if v2 == '8' then
                doTweenZoom('camZoomEnd','camGame',1.6,1,'linear')

                doTweenAlpha('finalFade','dad',0,2,'linear')
                doTweenAlpha('finalFadeInBG','redbg',1,2,'linear')
                doTweenColor('colorBF','boyfriend','000000',2,'linear')
                doTweenColor('colorEnd','NERMALL_END','000000',2,'linear')

                setCamPos(390,280,'dad')
                setCamPos(390,280,'boyfriend')

                doTweenAlpha('camHUDFade','camHUD',0,2,'linear')
                setObjectCamera('vignette','camOther')
            end

            if v2 == '9' then
                doTweenAlpha('finCam','camGame',0,2,'linear')
            end
        end

        if v1 == '5' then
            addExtraIconFinal(v2)
        end

        if v1 == '6' then
            if v2 == '1' then
                doTweenAlpha('showMemories1','memories1',1,3,'linear')
                setProperty('memories1.velocity.y',-100)
            end
        end
    end
end

function addExtraIconFinal(name)

    if luaSpriteExists('extraIconDad') then
        removeExtraIcon('extraIconDad',true)
    end

    addExtraIcon('extraIconDad',name,false)
    extraIcon('setIconProperty',{'extraIconDad','followAlpha',false})
    setProperty('extraIconDad.alpha',0.5)
    setProperty('extraIconDad.angle',-360)
    doTweenAngle('extraIconAngle','extraIconDad',0,0.25,'backOut')
    setObjectOrder('extraIconDad',getObjectOrder('godfieldPhase2Icon') + 1)

    if downscroll then
        setProperty('extraIconDad.offset.y',getProperty('extraIconDad.offset.y') - 100)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'waitToFadeHUD' then
        setProperty('godfieldPhase2Icon.alpha',1)
        isAct1 = false;
        removeLuaSprite('godfieldPhase1Icon',true)
        removeFromMemory('icons/1_FORM_GODFIELD-anim',false)
    end

    if tag == 'tweenMoveDad' then
        pos = pos * -1
        if enableFloatingDad then
            runTimer('tweenMoveDad', 6.5)
        end
    end

    if tag == 'final' then
        doTweenAlpha('fadeEndAnim','NERMALL_END',0,0.3,'linear')
        runTimer('gameover',2)
    end

    if tag == 'gameover'then
        doTweenAlpha('gameoveralpha','gameover',1,3,'sineOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'camZoomTween' then
        setProperty('camGame.visible',false)
        setProperty('camHUD.visible',false)
    end

    if tag == 'camGameZoomFinal' then
        setZoom(1,'boyfriend')
    end

    if tag == 'camGameZoomScene' then
        setZoom(0.6,'boyfriend')
    end

    if tag == 'showMemories1' then
        doTweenAlpha('fadeMemories1','memories1',0,2,'linear')
    end

    if tag == 'fadeMemories1' then
        doTweenAlpha('showMemories2','memories2',1,3,'linear')
        setProperty('memories2.velocity.y',-100)
    end

    if tag == 'showMemories2' then
        doTweenAlpha('fadeMemories2','memories2',0,2,'linear')
    end

    if tag == 'camZoomEnd' then
        setZoom(1.6,'dad')
        setZoom(1.6,'boyfriend')
    end

    if tag == 'colorEnd' then
        setProperty('NERMALL_END.alpha',1)
        addAnimationByPrefix('NERMALL_END','anim','NERMALL END0',12,false)
        playAnim('NERMALL_END','anim',true)
        setProperty('boyfriend.visible',false)
        runTimer('final',1)
    end
end

function opponentNoteHit(id,data,type,sus)
    if type == 'God Sansfield Note' then
        playAnim('sansfield',getProperty('singAnimations['..data..']'),true)
        setProperty('sansfield.holdTimer',0)
    end

    if type == 'Trio Opponent Note' then
        playAnim('sansfield',getProperty('singAnimations['..data..']'),true)
        setProperty('sansfield.holdTimer',0)

        characterPlayAnim('dad',getProperty('singAnimations['..data..']'),false)
        characterPlayAnim('gf',getProperty('singAnimations['..data..']'),false)
        singsTrioTogether = true;
    end
end

function goodNoteHit(id,data,type,sus)
    if type == 'God Jhon Lassagna Note' then
        if luaSpriteExists('jhon-lassagna') then
            playAnim('jhon-lassagna',getProperty('singAnimations['..data..']'),true)
            setProperty('jhon-lassagna.holdTimer',0)
        end

        if luaSpriteExists('jhon-lassagna_flip') and getProperty('jhon-lassagna_flip.alpha') > 0.01 then
            playAnim('jhon-lassagna_flip',getProperty('singAnimations['..data..']'),true)
            setProperty('jhon-lassagna_flip.holdTimer',0)
        end
        idleJhonLassagnaGod = false;
    end

    if type == 'God BF Note' then
        playAnim('bf_sans',getProperty('singAnimations['..data..']'),true)
        setProperty('bf_sans.holdTimer',0)
    end

    if type == 'Trio Player Note' then
        playAnim('bf_sans',getProperty('singAnimations['..data..']'),true)
        setProperty('bf_sans.holdTimer',0)

        playAnim('jhon-lassagna_flip',getProperty('singAnimations['..data..']'),true)
        setProperty('jhon-lassagna_flip.holdTimer',0)

        characterPlayAnim('boyfriend',getProperty('singAnimations['..data..']'),true)
        singsTrioPlayerTogether = true;
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

function doCamTween(x,y,time,easing)
    callScript('scripts/cameraMoviment','doCamTween',{x,y,time,easing})
end

function camFade(cam,color,time,fadeIn)
    callScript('extra_scripts/camFade','camFade',{cam,color,time,fadeIn})
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