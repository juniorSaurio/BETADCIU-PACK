local enableSingBilly = false;
local enableSingYuriCrazy = false;
local tweenX = 0;
local disableShake = false;
local enableRunGF = false;

function preloadImages()
    precacheImage('backgrounds/act1/All_Stars_Intro')
    precacheImage('anims/warning')
end

function preloadCharacters(act)
    if act == 1 then
        addCharacterToList('mouse-smile','dad')
        addCharacterToList('satan','gf')
        addCharacterToList('mouse-inferno','dad')
        addCharacterToList('oswald-happy','boyfriend')
        addCharacterToList('inferno-oswald','boyfriend')
    
        addCharacterToList('zardy','gf')
        addCharacterToList('starecrown','dad')
        addCharacterToList('cablecrow','boyfriend')
    
        addCharacterToList('ski-tord','gf')
        addCharacterToList('tord-in-bot','dad')
        addCharacterToList('Leatherfact','boyfriend')
        addCharacterToList('nikku_ddto','boyfriend')
    
        addCharacterToList('yuri-closet','dad')
        addCharacterToList('cyclops_speed_full','gf')
        addCharacterToList('gold','boyfriend')
    
        addCharacterToList('grey','dad')
        addCharacterToList('pretender','boyfriend')
    end

    if act == 2 then
        addCharacterToList('djmario','dad')
        addCharacterToList('piracy-sonic','boyfriend')

        addCharacterToList('nesglitch','dad')
        addCharacterToList('missingno_perspective','boyfriend')

        addCharacterToList('SANSsex','dad')
        addCharacterToList('picodx2','boyfriend')

        addCharacterToList('wigglesTerror','dad')
        addCharacterToList('ponyta-perspective','boyfriend')

        addCharacterToList('doxxiearch2','dad')
        addCharacterToList('doxxiearch','dad')
        addCharacterToList('bbleax','boyfriend')

        addCharacterToList('BOOTLEG_ANNOYED','dad')
        addCharacterToList('LFGF','boyfriend')
        addCharacterToList('canon','gf')
        addCharacterToList('DEAD HOPE SPONG','boyfriend')
        addCharacterToList('plankton','boyfriend')

        precacheImage('characters/starved_spuidward')
        callScript('extra_scripts/extraCharacter','createCharacter',{'teuthida','starvedsquid',1800,200})
        setProperty('teuthida.alpha',0.001)

        addCharacterToList('Miki','dad')
        addCharacterToList('ruvenstain','boyfriend')
        addCharacterToList('lylace','gf')

        precacheImage('characters/Billy')
        callScript('extra_scripts/extraCharacter','createCharacter',{'billy','Billy',-600,200})
        setProperty('billy.alpha',0.001)

        makeAnimatedLuaSprite('staticGlitch1','backgrounds/unbeatable/static',-1270,-30)
        scaleObject('staticGlitch1',1.5,1.5)
        addLuaSprite('staticGlitch1',false)
        setProperty('staticGlitch1.alpha',0.001)

        makeAnimatedLuaSprite('staticGlitch2','backgrounds/unbeatable/static',-710,0)
        scaleObject('staticGlitch2',1.5,1.5)
        addLuaSprite('staticGlitch2',false)
        setProperty('staticGlitch2.alpha',0.001)

        makeAnimatedLuaSprite('nesStatic','backgrounds/unbeatable/estatica_uwu',0,0)
        addAnimationByPrefix('nesStatic','anim','Estatica papu',24,true)
        setObjectCamera('nesStatic','hud')
        setProperty('nesStatic.alpha',0.001)
        addLuaSprite('nesStatic',true)

        addCharacterToList('mrSYS','dad')
        addCharacterToList('fsayori3d','boyfriend')
        addCharacterToList('hunter','gf')

        precacheImage('characters/YouCannotBeatUS_Bowser_Asset')
        callScript('extra_scripts/extraCharacter','createCharacter',{'bowser','koopa',0,900})
        setProperty('bowser.alpha',0.001)

        addCharacterToList('final_cuphead','dad')
        addCharacterToList('BHGlitchedAlt','boyfriend')
        addCharacterToList('final_sans','gf')

        addCharacterToList('luigi-ihy-new2','dad')
        addCharacterToList('radi3','boyfriend')
        addCharacterToList('gbv2evil','gf')

        precacheImage('characters/christopher_pratt')
        callScript('extra_scripts/extraCharacter','createCharacter',{'cpratt','chris-pratt',-50,-100})
        setProperty('cpratt.alpha',0.001)

    end

    if act == 3 then
        addCharacterToList('DD','gf')
        addCharacterToList('mom-perspective','boyfriend')
        addCharacterToList('gx','dad')

        addCharacterToList('Alexis','boyfriend')
        addCharacterToList('betanew','dad')

        addCharacterToList('lune','boyfriend')
        addCharacterToList('qt-kb','dad')

        addCharacterToList('tess','boyfriend')
        addCharacterToList('tioda','dad')
        addCharacterToList('mami','gf')

        precacheImage('characters/maid rosie')
        callScript('extra_scripts/extraCharacter','createCharacter',{'rosie','maid_rosie',400,-250})
        setProperty('rosie.alpha',0.001)

        addCharacterToList('unknown','dad')
        addCharacterToList('nyancat','gf')

        addCharacterToList('Neonight_heli','dad')
        addCharacterToList('denki-reb','boyfriend')

        addCharacterToList('infinite-masked','dad')
        addCharacterToList('sonic','boyfriend')

        addCharacterToList('fleetway','dad')
        addCharacterToList('sonic-phantasm','boyfriend')

        addCharacterToList('bigmonika','dad')
        addCharacterToList('sadsayo','boyfriend')
        addCharacterToList('natsuki-home','gf')

        precacheImage('characters/Doki_Crazy_Yuri_Assets')
        callScript('extra_scripts/extraCharacter','createCharacter',{'yuri_crazy','yuri-crazy',150,200})
        setProperty('yuri_crazy.alpha',0.001)

        addCharacterToList('Ghostcello','boyfriend')
        addCharacterToList('B3Annie','gf')
    end

    if act == 4 then
        addCharacterToList('sonicexepov','dad')
        addCharacterToList('fleetway-anims1','gf')

        addCharacterToList('scrimbo','dad')
        addCharacterToList('gf-run','boyfriend')

        addCharacterToList('DX','dad')
        addCharacterToList('DX3','dad')
        addCharacterToList('tailsdoll','boyfriend')
        addCharacterToList('tailsdoll3','boyfriend')

        addCharacterToList('finncawm_reveal','boyfriend')
        addCharacterToList('gumball','dad')
        addCharacterToList('jake','gf')

        addCharacterToList('carton_bendy','boyfriend')
        addCharacterToList('scott','dad')
        addCharacterToList('mxV2','gf')
        
        precacheImage('characters/SCP939')
        callScript('extra_scripts/extraCharacter','createCharacter',{'scp939','939',-2500,-400})
        setProperty('scp939.alpha',0.001)

        precacheImage('characters/demon_sky_assets')
        callScript('extra_scripts/extraCharacter','createCharacter',{'demon_sky','demon-sky',-2500,-400})
        setProperty('demon_sky.alpha',0.001)

        precacheImage('characters/demon_sky_assets')
        callScript('extra_scripts/extraCharacter','createCharacter',{'nonsense','Nonsense_God',2500,-400})
        setProperty('nonsense.alpha',0.001)

        precacheImage('characters/Act_4_secondperspective')
        callScript('extra_scripts/extraCharacter','createCharacter',{'bfUltraFinal','bf_ultrafinale2',-100,1500})
        setProperty('bfUltraFinal.alpha',0.001)
    end
end

function onCreate()

    preloadImages()
    preloadCharacters(1)

    precacheSound('amongKill')
    precacheSound('spinCartoon')
    precacheSound('spook')

    addLuaScript('extra_scripts/camFade')
    addLuaScript('extra_scripts/extraIcon')
    addLuaScript('extra_scripts/extraCharacter')
    addLuaScript('custom_events/Set Cam Zoom')

    makeAnimatedLuaSprite('starsIntro','backgrounds/act1/All_Stars_Intro')
    setObjectCamera('starsIntro','other')
    addLuaSprite('starsIntro',true)
    setProperty('starsIntro.alpha',0.001)
    setProperty('skipCountdown',true)
end

function onCreatePost()
    setZoom(0.65,'gf')
    setZoom(0.65,'bf')
    setZoom(0.4,'dad')
    addExtraIcon('gfIcon','gf',true)
    setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)

    setCamPos('bfX+100','bfY-30','gf')
    setProperty('camGame.alpha',0.001)
    setProperty('camHUD.alpha',0.001)

    addAnimationByPrefix('starsIntro','anim','intro anim',20,false)
    addLuaSprite('starsIntro',true)
end

function removeFromMemory(image,isCharacter)
    if not isCharacter then
        callScript('scripts/optimization','removeFromMemory',{image})
    else
        callScript('scripts/optimization','removeCharacterFromMemory',{image})
    end
end

function onUpdate()
    if curStep >= 431 and curStep <= 443 then
        triggerEvent('Play Animation', 'singUP', 'dad')
    end

    if (curStep >= 624 and curStep <= 751)  or (curStep >= 1680 and curStep <= 2191) or (curStep >= 2384 and curStep <= 2448 ) then
        if curStep %4 == 0 then
            triggerEvent('Add Camera Zoom',0.02,'0')
        end
    end

    if (curStep >=3024 and curStep <= 3265) then
        setCamPos(-600 + tweenX,100,'dad')
        setCamPos(-600 + tweenX,100,'boyfriend')
        setCamPos(-600 + tweenX,100,'gf')
        tweenX = tweenX + 1;
    end

    if getProperty('boyfriend.curCharacter') == 'piracy-sonic' then
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            setProperty('dad.x',315)
            setProperty('dad.y',300)
            setProperty('dad.angle',30)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            setProperty('dad.x',435)
            setProperty('dad.y',295)
            setProperty('dad.angle',0)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            setProperty('dad.x',370)
            setProperty('dad.y',280)
            setProperty('dad.angle',30)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            setProperty('dad.x',375)
            setProperty('dad.y',320)
            setProperty('dad.angle',30)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            setProperty('dad.x',360)
            setProperty('dad.y',295)
            setProperty('dad.angle',30)
        end
    end 

    if getProperty('dad.curCharacter') == 'unknown' then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        doTweenY('dadmove', 'dad', -100 - 600*math.sin((currentBeat+12*12)*math.pi), 2);
    end

	if enableRunGF then
        setProperty('legs.x', getProperty('boyfriend.x') -490)
	end
end

function onBeatHit()

    if curStep >= 1936 and curStep <= 2095 then
        if curBeat % 2 == 0 then
            playAnim('billy','idle',false)
        end
    end

    if curStep >= 2024 and curStep <= 2464 then
        if curBeat % 2 == 0 then
            playAnim('cpratt','idle',false)
        end
    end

    if curStep >=3024 and curStep <= 3265 then
        if curBeat % 2 == 0 then
            playAnim('rosie','idle',false)
        end
    end

    if curStep >= 4912 and curStep <= 5104 then
        if curBeat % 2 == 0 then
            playAnim('scp939','idle',false)
            playAnim('demon_sky','idle',false)
            playAnim('nonsense','idle',false)
        end
    end

end

function onEvent(name,v1,v2)
    if name == 'Triggers BETADCIU' then
        if v1 == '0' then
            if v2 == '0' then
                setProperty('starsIntro.alpha',1)
                playAnim('starsIntro','anim',true)
            end 

            if v2 == '1' then
                cameraFlash('hud','FF0000',0.5)
                setProperty('camGame.alpha',1)
                setProperty('camHUD.alpha',1)
                removeLuaSprite('starsIntro',true)
                removeFromMemory('mario/allfinal/act1/All_Stars_Intro')
            end
        end
        if v1 == '2' then  -- SUFFERING
            if v2 == '1' then
                setProperty('cameraSpeed', 5)
                removeFromMemory('bfnew',true)
                removeFromMemory('gfplayable',true)
                removeFromMemory('mario_ultra1',true)
                removeExtraIcon('gfIcon',true)
        
                setProperty('gf.visible',false)
        
                triggerEvent('Change Character','dad','mouse-smile')
                setZoom(0.6,'dad')
        
                triggerEvent('Change Character','boyfriend','oswald-happy')
                setZoom(0.6,'boyfriend')
        
                setCamPos(250,700,'bf')
                setCamPos(-200,700,'dad')
        
                setObjectOrder('dad',getObjectOrder('infernoGround2') + 1 )
                setObjectOrder('boyfriend',getObjectOrder('infernoGround2') + 1 )
            end

            if v2 == '2' then
                removeFromMemory('mouse-smile',true)
                removeFromMemory('oswald-happy',true)
        
                triggerEvent('Change Character','dad','mouse-inferno')
                triggerEvent('Change Character','boyfriend','inferno-oswald')
        
                setProperty('gf.visible',true)
                triggerEvent('Change Character','gf','satan')
                setZoom(0.4,'gf')
                setCamPos(-200,270,'gf')
                setProperty('gf.x',-750)
        
                setCamPos(250,600,'bf')
                setCamPos(70,600,'dad')
        
                setObjectOrder('dad',getObjectOrder('infernoGround2') + 1 )
                setObjectOrder('boyfriend',getObjectOrder('infernoGround2') + 1 )
            end
        end

        if v1 == '3' then -- ZARDY LVL
            if v2 == '1' then
                removeFromMemory('mouse-inferno',true)
                removeFromMemory('inferno-oswald',true)
                removeFromMemory('satan',true)
        
                triggerEvent('Change Character','dad','starecrown')
                triggerEvent('Change Character','boyfriend','cablecrow')
                triggerEvent('Change Character','gf','zardy')
        
                doTweenColor('colorStareCrown','dad','000000', 0.001, 'linear')
        
                setZoom(1,'dad')
                setCamPos(-600,500,'dad')
                setZoom(0.6,'bf')
                setZoom(0.6,'gf')
        
                setProperty('boyfriend.visible',false)
                setProperty('gf.visible',false)
            end

            if v2 == '2' then
                addExtraIcon('gfIcon','cablecrow',true)
                setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)
                setObjectOrder('gf',getObjectOrder('boyfriendGroup') + 1)
        
                setCamPos(-10,600,'dad')
                setCamPos(0,600,'bf')
                setCamPos(50,600,'gf')
        
                setZoom(0.6,'dad')
        
                removeLuaSprite('redBG',true)
                
                setProperty('boyfriend.visible',true)
                setProperty('gf.visible',true)
                doTweenColor('colorStareCrown','dad','FFFFFF', 0.001, 'linear')
            end
        end

        if v1 == '4' then --TORD LVL
            if v2 == '1' then
                cameraFlash('camGame', '0xFFFFFFFF', 0.3)

                removeFromMemory('starecrown',true)
                removeFromMemory('cablecrow',true)
                removeFromMemory('zardy',true)
                removeExtraIcon('gfIcon',true)
        
                triggerEvent('Change Character','dad','tord-in-bot')
                triggerEvent('Change Character','boyfriend','Leatherfact')
                triggerEvent('Change Character','gf','ski-tord')
        
                setCamPos(100,500,'dad')
                setCamPos(100,500,'boyfriend')
                setCamPos(100,500,'gf')
        
                setZoom(0.9,'dad')
                setZoom(0.9,'gf')
                setZoom(0.9,'boyfriend')
        
                setProperty('gf.x',1500)
                setProperty('boyfriend.y',1500)
        
                setProperty('gf.visible',false)
                setProperty('boyfriend.visible',false)
                setProperty('iconP1.visible',false)

                setOffs(0,'gf')
                setOffs(0,'dad')
                setOffs(0,'boyfriend')
            end

            if v2 == '2' then
                setZoom(0.8,'dad')
                setZoom(0.8,'gf')
                setZoom(0.8,'boyfriend')
        
                setProperty('lighting1.alpha',1)
                setProperty('skiBG.alpha',1)
        
                setProperty('gf.visible',true)
                doTweenX('moveSkiBot','gf',250,0.3,'linear')
                doTweenX('moveLightning','lighting1',350,0.3,'linear')
                doTweenX('moveSkiBG','skiBG',-420,0.3,linear)
        
                setCamPos(500,500,'dad')
                setCamPos(500,500,'bf')
                setCamPos(500,500,'gf')
                
                addExtraIcon('gfIcon','ski-tord',false)
                setObjectOrder('gfIcon', getObjectOrder('iconP2') + 1)
                setObjectOrder('gf',getObjectOrder('lighting1') + 1)
            end

            if v2 == '3' then
                setProperty('boyfriend.visible',true)
                doTweenY('upLeather','boyfriend',500,0.3,'linear')
                setProperty('iconP1.visible',true)
            end

            if v2 == '4' then
                removeFromMemory('Leatherfact',true)
                triggerEvent('Change Character','boyfriend','nikku_ddto')
                setProperty('boyfriend.y',1500)
                doTweenY('upNikku','boyfriend',400,0.3,'linear')
            end
        end

        if v1 == '5' then -- YURI
            if v2 == '1' then
                removeFromMemory('nikku_ddto',true)
                removeFromMemory('tord-in-bot',true)
                removeFromMemory('ski-tord',true)
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','dad','yuri-closet')
                triggerEvent('Change Character','boyfriend','gold')
                triggerEvent('Change Character','gf','cyclops_speed_full')

                addExtraIcon('gfIcon','cyclops',true)
                setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)
                setObjectOrder('gf', getObjectOrder('dadGroup') + 1)
        
                setCamPos(200,450,'dad')
                setCamPos(200,450,'boyfriend')
                setCamPos(200,450,'gf')
        
                setZoom(0.9,'dad')
                setZoom(0.6,'gf')
                setZoom(0.6,'boyfriend')

                setProperty('gf.alpha',0.001)
                setProperty('boyfriend.alpha',0.001)
                setProperty('iconP1.alpha',0.001)   
                setProperty('gfIcon.alpha',0.001)

                setOffs(30,'gf')
                setOffs(30,'dad')
                setOffs(30,'boyfriend')

                setProperty('dad.x',0)
                setProperty('boyfriend.x',-450)
            end

            if v2 == '2' then
                doTweenAlpha('closetBGFade','closetBG',0,0.5,'linear')
            end

            if v2 == '3' then
                setProperty('boyfriend.alpha',1)
                setProperty('iconP1.alpha',1)

                characterPlayAnim('boyfriend','fadeIn',true)
                setProperty('boyfriend.specialAnim',true)
            end

            if v2 == '4' then
                setProperty('gf.alpha',1)
                characterPlayAnim('gf','turn',false)
                setProperty('gf.specialAnim',false)
            end

            if v2 == '5' then
                characterPlayAnim('dad','leaves',false)
                setProperty('dad.specialAnim',true)
            end
        end

        if v1 == '6' then -- IMPOSTOR
            if v2 == '1' then
                removeFromMemory('yuri-closet',true)
                removeFromMemory('gold',true)
                --callScript('scripts/global_functions','deleteGF')
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','dad','grey')
                triggerEvent('Change Character','boyfriend','pretender')

                setProperty('gf.alpha',0.001)

                setZoom(0.7,'dad')
                setZoom(0.7,'boyfriend')

                setCamPos(-300,450,'dad')
                setCamPos(-200,450,'boyfriend')
            end

            if v2 == '2' then
                setProperty('camHUD.visible',false)
                setProperty('camGame.visible',false)
                playSound('amongKill')
            end
        end

        if v1 == '7' then --PIRACY
            if v2 == '1' then
                preloadCharacters(2)
                removeFromMemory('grey',true)
                removeFromMemory('pretender',true)

                triggerEvent('Change Character','dad','djmario')
                triggerEvent('Change Character','boyfriend','piracy-sonic')

                setProperty('camHUD.visible',true)
                setProperty('camGame.visible',true)

                setCamPos(450,450,'dad')
                setCamPos(400,550,'boyfriend')
                
                setZoom(3,'dad')
                setZoom(0.7,'boyfriend')

                setProperty('dad.x',360)
                setProperty('dad.y',295)
                setProperty('dad.angle',30)

                setOffs(0,'dad')
                setOffs(50,'boyfriend')
            end
        end

        if v1 == '8' then --NES
            if v2 == '1' then

                cameraFlash('camGame', '0xFFFFFFFF', 0.3)
                removeFromMemory('djmario',true)
                removeFromMemory('piracy-sonic',true)

                triggerEvent('Change Character','dad','nesglitch')
                triggerEvent('Change Character','boyfriend','missingno_perspective')

                setProperty('dad.x',760)
                setProperty('dad.y',310)

                setCamPos(700,300,'dad')
                setCamPos(550,400,'boyfriend')

                setZoom(1.3,'dad')
                setZoom(0.8,'boyfriend')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
            end
        end

        if v1 == '9' then --SANS
            if v2 == '1' then
                removeFromMemory('djmario',true)
                removeFromMemory('piracy-sonic',true)

                triggerEvent('Change Character','dad','SANSsex')
                triggerEvent('Change Character','boyfriend','picodx2')

                setCamPos(900,-300,'dad')
                setCamPos(550,100,'boyfriend')

                setProperty('dad.x',700)
                setProperty('dad.y',-400)

                setProperty('boyfriend.x',-400)
                setProperty('boyfriend.y',-400)
                
                setZoom(1.4,'dad')
                setZoom(0.7,'boyfriend')
            end
        end

        if v1 == '10' then --WIGGLES
            if v2 == '1' then
                removeFromMemory('djmario',true)
                removeFromMemory('piracy-sonic',true)

                triggerEvent('Change Character','dad','wigglesTerror')
                triggerEvent('Change Character','boyfriend','ponyta-perspective')

                setProperty('dad.x',270)
                setProperty('dad.y',-185)

                setCamPos(380,300,'dad')
                setCamPos(200,400,'boyfriend')

                setZoom(1.3,'dad')
                setZoom(1.1,'boyfriend') 
            end
        end

        if v1 == '11' then --BBPANZU
            if v2 == '1' then
                removeFromMemory('wigglesTerror',true)
                removeFromMemory('ponyta-perspective',true)

                triggerEvent('Change Character','dad','doxxiearch')
                triggerEvent('Change Character','boyfriend','bbleax')

                setProperty('dad.x',720)
                setProperty('dad.y',90)

                setCamPos(250,400,'dad')
                setCamPos(0,500,'boyfriend')

                setZoom(0.7,'dad')
                setZoom(0.7,'boyfriend')

                setOffs(20,'dad')
                setOffs(20,'boyfriend')
            end

            if v2 == '2' then
                setCamPos(600,400,'dad')
                setCamPos(0,500,'boyfriend')

                setZoom(1,'dad')
                setZoom(0.8,'boyfriend')
            end

            if v2 == '3' then
                characterPlayAnim('dad','spin',false)
                setProperty('dad.specialAnim',true)
                playSound('spinCartoon',0.8)
            end

            if v2 == '4' then
                setProperty('dad.specialAnim',false)
                triggerEvent('Change Character','dad','doxxiearch2')

                setCamPos(700,400,'dad')
                setCamPos(0,500,'boyfriend')

                setZoom(1,'dad')
                setProperty('dad.x',720)
                setProperty('dad.y',90)
            end
        end

        if v1 == '12' then -- MCM
            if v2 == '1' then

                removeFromMemory('doxxiearch',true)
                removeFromMemory('doxxiearch2',true)
                removeFromMemory('bbleax',true)
                removeFromMemory('cyclops_speed_full',true)

                triggerEvent('Change Character','gf','canon')
                triggerEvent('Change Character','boyfriend','LFGF')
                triggerEvent('Change Character','dad','BOOTLEG_ANNOYED')

                setProperty('gf.alpha',1)
                setObjectOrder('gf',getObjectOrder('dadGroup') + 1)

                setObjectOrder('boyfriend',getObjectOrder('massacreBG') + 1)

                setProperty('dad.x',50)
                setProperty('dad.y',180)

                setProperty('gf.x',-850)
                setProperty('gf.y',-1500)

                setProperty('boyfriend.y',1500)

                setCamPos(300,480,'dad')
                setCamPos(300,480,'boyfriend')
                setCamPos(300,480,'gf')

                setZoom(0.48,'dad')
                setZoom(0.48,'boyfriend')
                setZoom(0.48,'gf')

            end

            if v2 == '2' then
                doTweenY('upLFGF','boyfriend',400,0.5,'linear')
                doTweenY('upLFGFStage','massacreBG',250,0.5,'linear')
            end

            if v2 == '3' then
                doTweenY('bottomLFGF','boyfriend',1500,0.5,'linear')
                doTweenY('bottomLFGFStage','massacreBG',1500,0.5,'linear')

                doTweenY('bottomLCanon','gf',-200,0.5,'linear')

                addExtraIcon('gfIcon','canonsquiddy',false)
                setObjectOrder('gfIcon',getObjectOrder('iconP2') + 1)
            end

            if v2 == '4' then
                removeFromMemory('LFGF',true)
                triggerEvent('Change Character','boyfriend','DEAD HOPE SPONG')
                setProperty('boyfriend.y',1200)
                setProperty('boyfriend.x',-600)
                setObjectOrder('boyfriend',getObjectOrder('facelessBG') + 1)

                doTweenY('upFacelessBob','boyfriend',300,0.5,'linear')
                doTweenY('upFacelessBobStage','facelessBG',200,0.5,'linear')
            end

            if v2 == '5' then
                setProperty('teuthida.alpha',1)
                setObjectOrder('teuthida',getObjectOrder('dadGroup') + 1)
                addExtraIcon('teuthidaIcon','starvedsquid',false)
                setProperty('teuthidaIcon.offset.y',getProperty('iconP2.offset.y'))
                setProperty('teuthidaIcon.offset.x',getProperty('iconP2.offset.x'))
                setObjectOrder('teuthidaIcon',getObjectOrder('iconP2') + 1)

                doTweenX('leftTeuthida','teuthida',300,0.5,'linear')

                doTweenY('bottomFacelessBob','boyfriend',1500,0.5,'linear')
                doTweenY('bottomFacelessBobStage','facelessBG',1500,0.5,'linear')
            end

            if v2 == '6' then
                removeFromMemory('DEAD HOPE SPONG',true)
                triggerEvent('Change Character','boyfriend','plankton')
                setProperty('boyfriend.y',1200)
                setProperty('boyfriend.x',70)
                setObjectOrder('boyfriend',getObjectOrder('pillarServed') + 1)
                setCamPos(300,600,'boyfriend')
                setZoom(0.7,'boyfriend')

                doTweenY('upServed','boyfriend',500,0.5,'linear')
                doTweenY('upPilar','pillarServed',500,0.5,'linear')
            end

            if v2 == '7' then
                doTweenZoom('camz','camGame',1.7,4,'sineInOut')
                setCamPos(250,700,'boyfriend')
                
                doTweenAlpha('disableElement1','gf',0,3,'linear')
                doTweenAlpha('disableElement2','dad',0,3,'linear')
                doTweenAlpha('disableElement3','teuthida',0,3,'linear')
                doTweenAlpha('disableElement4','roomBootleg',0,3,'linear')
            end

        end

        if v1 == '13' then -- STYLE
            if v2 == '1' then
                callScript('extra_scripts/extraCharacter','removeCharacter',{'teuthida',true})
                removeFromMemory('BOOTLEG_ANNOYED',true)
                removeFromMemory('canon',true)
                removeFromMemory('plankton',true)

                removeExtraIcon('gfIcon',true)
                removeExtraIcon('teuthidaIcon',true)

                triggerEvent('Change Character','gf','lylace')
                triggerEvent('Change Character','boyfriend','ruvenstain')
                triggerEvent('Change Character','dad','Miki')

                addExtraIcon('gfIcon','lylace',false)
                setObjectOrder('gfIcon',getObjectOrder('iconP2') + 1)
                addExtraIcon('billyIcon','billy',false)
                setProperty('billyIcon.offset.y',getProperty('iconP2.offset.y'))
                setProperty('billyIcon.offset.x',getProperty('iconP2.offset.x'))
                setObjectOrder('billyIcon',getObjectOrder('iconP2') + 1)
                
                setProperty('billy.alpha',1)
                setProperty('dad.alpha',1)
                setProperty('gf.alpha',1)

                setProperty('dad.x',-500)
                setProperty('dad.y',100)

                setProperty('gf.x',-300)
                setProperty('gf.y',200)

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
                setOffs(50,'gf')

                setCamPos(100,500,'dad')
                setCamPos(400,500,'boyfriend')
                setCamPos(0,500,'gf')

                setZoom(0.65,'dad')
                setZoom(0.65,'boyfriend')
                setZoom(0.65,'gf')
                enableSingBilly = true;
            end

            if v2 == '2' then
                
                setOffs(0,'dad')
                setOffs(0,'boyfriend')
                setOffs(0,'gf')

                doTweenZoom('camz2','camGame',0.3,0.5,'sineInOut')
                setZoom(0.3,'dad')
                setZoom(0.3,'boyfriend')
                setZoom(0.3,'gf')
                
                doTweenAlpha('fadeInBG', 'whitebg', 1, 0.05, 'linear')
                doTweenAlpha('fadeInBGPrincipal', 'BgStyle', 0, 0.05, 'linear')

                doTweenColor('colorBilly','billy','000000', 0.05, 'linear')
                doTweenColor('colorInBf', 'boyfriend', '000000', 0.05, 'linear')
                doTweenColor('colorInGf', 'gf', '000000', 0.05, 'linear')
                doTweenColor('colorInDad', 'dad', '000000', 0.05, 'linear')
            end
        end

        if v1 == '14' then -- UNBEATABLE
            if v2 == '1' then

                doTweenZoom('camz2','camGame',0.8,0.01,'sineInOut')
                
                doTweenColor('colorInBf', 'boyfriend', 'FFFFFF', 0.01, 'linear')
                doTweenColor('colorInGf', 'gf', 'FFFFFF', 0.01, 'linear')
                doTweenColor('colorInDad', 'dad', 'FFFFFF', 0.01, 'linear')

                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)

                addAnimationByPrefix('staticGlitch1','idle','static idle',24,true)
                setProperty('staticGlitch1.alpha',1)
                setObjectOrder('staticGlitch1',getObjectOrder('bgNesGlitch') + 1)

                addAnimationByPrefix('staticGlitch2','idle','static idle',24,true)
                setProperty('staticGlitch2.alpha',1)
                setObjectOrder('staticGlitch2',getObjectOrder('bgNesGlitch') + 1)

                callScript('extra_scripts/extraCharacter','removeCharacter',{'billy',true})
                removeFromMemory('lylace',true)
                removeFromMemory('ruvenstain',true)
                removeFromMemory('Miki',true)

                removeExtraIcon('gfIcon',true)
                removeExtraIcon('billyIcon',true)

                triggerEvent('Change Character','gf','hunter')
                triggerEvent('Change Character','boyfriend','fsayori3d')
                triggerEvent('Change Character','dad','mrSYS')
                setProperty('bowser.alpha',1)

                setObjectOrder('gf',getObjectOrder('staticGlitch1') + 1)
                
                setZoom(0.8,'dad')
                setZoom(0.8,'boyfriend')
                setZoom(0.8,'gf')

                setOffs(30,'dad')
                setOffs(30,'boyfriend')
                setOffs(30,'gf')

                setCamPos(0,500,'dad')
                setCamPos(0,500,'boyfriend')
                setCamPos(0,500,'gf')

                setProperty('dad.x',-500)
                setProperty('dad.y',200)

                setProperty('gf.x',-950)
                setProperty('gf.y',900)

                setProperty('boyfriend.x',-200)
                setProperty('boyfriend.y',200)

                setProperty('boyfriend.alpha',0.001)
            end

            if v2 == '2' then
                doTweenY('upHunter','gf',300,0.3,'linear')
                addExtraIcon('gfIcon','hunt',false)
                setObjectOrder('gfIcon',getObjectOrder('iconP2') + 1)
            end

            if v2 == '3' then
                doTweenY('upBowser','bowser',150,0.3,'linear')
                addExtraIcon('bowserIcon','bowser',false)
                setObjectOrder('bowserIcon',getObjectOrder('iconP2') + 1)
            end

            if v2 == '4' then
                setProperty('nesStatic.alpha',0.8)
                doTweenAlpha('staticAlpha','nesStatic',0,0.5,'linear')
                
                setProperty('boyfriend.alpha',1)
                setProperty('dad.alpha',0)
                setProperty('gf.alpha',0)
                setProperty('bowser.alpha',0)
                setProperty('bgBar.alpha',0)
                setProperty('bgNesGlitch.alpha',0)
                setProperty('staticGlitch1.alpha',0)
                setProperty('staticGlitch2.alpha',0)
                setProperty('BGEpiphany.alpha',1)
            end
        end
        
        if v1 == '15' then -- NIGHTMARE
            if v2 == '1' then
                callScript('extra_scripts/extraCharacter','removeCharacter',{'bowser',true})
                removeFromMemory('mrSYS',true)
                removeFromMemory('fsayori3d',true)
                removeFromMemory('hunter',true)

                removeExtraIcon('gfIcon',true)
                removeExtraIcon('bowserIcon',true)

                triggerEvent('Change Character','gf','final_sans')
                triggerEvent('Change Character','boyfriend','BHGlitchedAlt')
                triggerEvent('Change Character','dad','final_cuphead')

                setProperty('dad.alpha',1)
                setProperty('gf.alpha',1)

                setCamPos(500,350,'dad')
                setCamPos(500,350,'boyfriend')
                setCamPos(500,350,'gf')

                setZoom(0.35,'dad')
                setZoom(0.5,'boyfriend')
                setZoom(0.35,'gf')

                setProperty('dad.x',-600)
                setProperty('dad.y',230)

                setProperty('gf.x',1300)
                setProperty('gf.y',-70)

                setProperty('boyfriend.x',250)
                setProperty('boyfriend.y',200)

                setOffs(120,'dad')
                setOffs(80,'boyfriend')
                setOffs(120,'gf')
            end
        end

        if v1 == '16' then -- STREAM
            if v2 == '1' then
                removeFromMemory('final_sans',true)
                removeFromMemory('BHGlitchedAlt',true)
                removeFromMemory('final_cuphead',true)

                triggerEvent('Change Character','gf','gbv2evil')
                triggerEvent('Change Character','boyfriend','radi3')
                triggerEvent('Change Character','dad','luigi-ihy-new2')
                
                setZoom(0.6,'dad')
                setZoom(0.6,'boyfriend')
                setZoom(0.6,'gf')

                setCamPos(100,80,'dad')
                setCamPos(100,80,'boyfriend')
                setCamPos(100,80,'gf')

                setProperty('dad.x',-850)
                setProperty('dad.y',-600)

                setProperty('gf.x',-600)
                setProperty('gf.y',350)

                setProperty('boyfriend.x',250)
                setProperty('boyfriend.y',-500)

                setOffs(0,'dad')
                setOffs(0,'boyfriend')
                setOffs(0,'gf')

                setProperty('cpratt.alpha',1)
                setObjectOrder('cpratt',getObjectOrder('directBGFront') + 1)
            end

            if v2 == '2' then
                
                doTweenAngle('rotatecamHUD','camHUD',-30,2,'expoIn')
                doTweenY('bottomcamHUD','camHUD',800,2,'cubeIn')

                doTweenAlpha('fadecamGame','camGame',0,1,'linear')
                doTweenAlpha('fadecamHUD','camHUD',0,2,'linear')
            end
        end

        if v1 == '17' then -- GX
            if v2 == '1' then

                preloadCharacters(3)
                removeFromMemory('gbv2evil',true)
                removeFromMemory('radi3',true)
                removeFromMemory('luigi-ihy-new2',true)
                callScript('extra_scripts/extraCharacter','removeCharacter',{'cpratt',true})

                triggerEvent('Change Character','gf','DD')
                triggerEvent('Change Character','boyfriend','mom-perspective')
                triggerEvent('Change Character','dad','gx')

                setZoom(0.7,'dad')
                setZoom(0.5,'boyfriend')
                setZoom(0.5,'gf')

                setCamPos(200,100,'dad')
                setCamPos(200,200,'boyfriend')
                setCamPos(200,200,'gf')

                setProperty('dad.x',-450)
                setProperty('dad.y',-1600)
                setProperty('dad.alpha',0.001)

                setProperty('gf.x',-650)
                setProperty('gf.y',1400)

                setProperty('boyfriend.x',850)
                setProperty('boyfriend.y',1400)

                setOffs(0,'dad')
                setOffs(0,'boyfriend')
                setOffs(0,'gf')

                setObjectOrder('gf',getObjectOrder('dadGroup') + 1)
            end

            if v2 == '2' then
                doTweenY('bottomGX','dad',-700,3,'linear')
                doTweenZoom('camz2','camGame',1.2,10,'linear')
                doTweenAlpha('fadeGX','dad',1,8,'linear')
            end

            if v2 == '3' then
                doTweenAlpha('fadeGX','camHUD',1,0.5,'linear')
                doTweenZoom('camz3','camGame',0.5,10,'linear')
            end

            if v2 == '4' then
                doTweenY('bottomDad','gf',120,0.3,'linear')
                doTweenY('bottomMom','boyfriend',200,0.3,'linear')
            end

            if v2 == '5' then
                doTweenAlpha('fadeCamGame','camGame',0,0.5,'linear')
            end
        end

        if v1 == '18' then --BETA
            if v2 == '1' then
                doTweenAlpha('fadeCamGame','camGame',1,0.5,'linear')
                setProperty('gf.alpha',0.001)
                removeFromMemory('mom-perspective',true)
                removeFromMemory('gx',true)

                triggerEvent('Change Character','boyfriend','Alexis')
                triggerEvent('Change Character','dad','betanew')

                setZoom(0.7,'dad')
                setZoom(0.7,'boyfriend')

                setCamPos(-400,600,'dad')
                setCamPos(0,600,'boyfriend')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
            end
        end

        if v1 == '19' then -- QT
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                removeFromMemory('Alexis',true)
                removeFromMemory('betanew',true)

                triggerEvent('Change Character','boyfriend','lune')
                triggerEvent('Change Character','dad','qt-kb')
                setObjectOrder('dad',getObjectOrder('groundCavern') + 1)

                setZoom(0.7,'dad')
                setZoom(0.6,'boyfriend')

                setCamPos(-400,300,'dad')
                setCamPos(-100,100,'boyfriend')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
            end
        end

        if v1 == '20' then -- RESTAURANT
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)

                doTweenZoom('instantZoom','camGame',1,0.001,'linear')

                removeFromMemory('lune',true)
                removeFromMemory('qt-kb',true)
                removeFromMemory('gx',true)

                triggerEvent('Change Character','gf','mami')
                triggerEvent('Change Character','boyfriend','tess')
                triggerEvent('Change Character','dad','tioda')
                setProperty('rosie.alpha',1)
                setProperty('gf.alpha',1)
                setProperty('dad.alpha',1)
     
                setProperty('dad.x',-800)
                setProperty('dad.y',-200)

                setProperty('gf.x',-600)
                setProperty('gf.y',-250)

                setProperty('boyfriend.x',300)
                setProperty('boyfriend.y',0)

                setOffs(0,'dad')
                setOffs(0,'boyfriend')
                setOffs(0,'gf')

                setCamPos(-600,100,'dad')
                setCamPos(-600,100,'boyfriend')
                setCamPos(-600,100,'gf')

                setZoom(1,'dad')
                setZoom(1,'boyfriend')
                setZoom(1,'gf')

                doTweenAlpha('enableHUDTea','hudBubble',0.9,10,'linear')
                disableShake = true;
            end
        end

        if v1 == '21' then --SPACE
            if v2 == '1' then
                removeFromMemory('mami',true)
                removeFromMemory('tioda',true)
                callScript('extra_scripts/extraCharacter','removeCharacter',{'rosie',true})

                triggerEvent('Change Character','gf','nyancat')
                triggerEvent('Change Character','dad','unknown')

                setProperty('boyfriend.alpha',0)

                setProperty('dad.x',-100)
                setProperty('dad.y',-100)

                setProperty('gf.x',500)
                setProperty('gf.y',-1500)

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
                setOffs(50,'gf')

                setZoom(0.5,'boyfriend')
                setZoom(0.5,'dad')
                setZoom(0.5,'gf')

                setProperty('iconP1.alpha',0.001)
            end

            if v2 == '2' then
                addExtraIcon('gfIcon','nyan',false)
                setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)
                
                doTweenY('bottomNyan','gf',-350,0.3,'linear')
                setZoom(0.7,'dad')
                setZoom(0.7,'gf')
            end
        end

        if v1 == '22' then --CITY
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)

                removeExtraIcon('gfIcon',true)
                removeFromMemory('unknown',true)
                removeFromMemory('tess',true)

                triggerEvent('Change Character','boyfriend','denki-reb')
                triggerEvent('Change Character','dad','Neonight_heli')

                setProperty('gf.alpha',0)
                setProperty('boyfriend.alpha',1)

                setProperty('dad.x',650)
                setProperty('dad.y',-150)

                setProperty('boyfriend.x',1000)
                setProperty('boyfriend.y',150)

                setOffs(10,'dad')
                setOffs(10,'boyfriend')

                setZoom(0.5,'boyfriend')
                setZoom(0.5,'dad')
                setZoom(0.5,'gf')

                setCamPos(700,100,'dad')
                setCamPos(700,100,'boyfriend')
                setCamPos(700,100,'gf')

                setProperty('iconP1.alpha',1)
            end
        end

        if v1 == '23' then --JUNGLE
            if v2 == '1' then
                removeFromMemory('denki-reb',true)
                removeFromMemory('Neonight_heli',true)
    
                triggerEvent('Change Character','boyfriend','sonic')
                triggerEvent('Change Character','dad','infinite-masked')
    
                setProperty('dad.x',-500)
                setProperty('dad.y',-300)
    
                setProperty('boyfriend.x',600)
                setProperty('boyfriend.y',-100)

                
                setZoom(0.7,'boyfriend')
                setZoom(0.7,'dad')
                setZoom(0.7,'gf')
    
                setOffs(50,'dad')
                setOffs(50,'boyfriend')
    
                setCamPos(300,100,'dad')
                setCamPos(500,100,'boyfriend')    
            end

            if v2 == '2' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
                setProperty('mysticJungle.alpha',0.001)
                setProperty('infiniteLight.alpha',1)
                setProperty('infiniteSpeed.alpha',1)

                                
                setZoom(0.5,'boyfriend')
                setZoom(0.5,'dad')
                setZoom(0.5,'gf')
            end
        end

        if v1 == '24' then --PHANTASM
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
                removeFromMemory('infinite-masked',true)
                removeFromMemory('sonic',true)
    
                triggerEvent('Change Character','boyfriend','sonic-phantasm')
                triggerEvent('Change Character','dad','fleetway')

                setOffs(0,'dad')
                setOffs(0,'boyfriend')
                setOffs(0,'gf')

                setProperty('dad.alpha',0.4)
                setObjectCamera('dad','camHUD')

                setCamPos(400,200,'dad')
                setCamPos(400,200,'boyfriend')
                setCamPos(400,200,'gf')   

                setProperty('dad.x',900)
                setProperty('dad.y',200)
                doTweenX('moveCamDad','dad',100,20,'linear')
            end
        end

        if v1 == '25' then --DOKIS
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.2)
                removeFromMemory('sonic-phantasm',true)
                removeFromMemory('fleetway',true)
                removeFromMemory('nyancat',true)
    
                triggerEvent('Change Character','boyfriend','sadsayo')
                triggerEvent('Change Character','dad','bigmonika')
                triggerEvent('Change Character','gf','natsuki-home')
                setProperty('yuri_crazy.alpha',1)

                setProperty('dad.alpha',0.4)
                setProperty('gf.alpha',1)
                setObjectCamera('dad','camHUD')

                setCamPos(550,400,'dad')
                setCamPos(550,400,'boyfriend')
                setCamPos(550,400,'gf')

                setProperty('dad.x',100)
                setProperty('dad.y',0)
                doTweenX('moveCamDad','dad',900,20,'linear')
                doTweenZoom('camz6','camGame',1.2,20,'sineInOut')

                enableSingYuriCrazy = true;
            end

            if v2 == '2' then
                doTweenAlpha('chauCamGame','camGame',0,2,'linear')
            end

            if v2 == '3' then
                characterPlayAnim('dad','lastNOTE_end',false)
                setProperty('dad.specialAnim',true)
            end
        end

        if v1 == '26' then --GARCELO
            if v2 == '1' then

                enableSingYuriCrazy = false;
                removeFromMemory('sadsayo',true)
                removeFromMemory('natsuki-home',true)
                setProperty('dad.alpha',0.001)

                callScript('extra_scripts/extraCharacter','removeCharacter',{'yuri_crazy',true})

                triggerEvent('Change Character','gf','B3Annie')
                setProperty('gf.alpha',0.001)
                setProperty('iconP2.alpha',0.001)
                triggerEvent('Change Character','boyfriend','Ghostcello')

                setCamPos(600,100,'dad')
                setCamPos(600,100,'boyfriend')
                setCamPos(550,100,'gf')

                setProperty('boyfriend.x',100)
                setProperty('boyfriend.y',0)

                setProperty('gf.x',0)
                setProperty('gf.y',0)

                setZoom(1,'boyfriend')
                setZoom(1,'dad')
                setZoom(1,'gf')

                doTweenAlpha('enableCamGame','camGame',1,10,'linear')
            end

            if v2 == '2' then

                addExtraIcon('gfIcon','annie',true)
                setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)

                doTweenAlpha('enableAnnie','gf',1,10,'linear')
                doTweenAlpha('enableWinterBG','winterBG',1,10,'linear')
                setZoom(0.7,'boyfriend')
                setZoom(0.7,'dad')
                setZoom(0.7,'gf')

                setCamPos(500,300,'dad')
                setCamPos(500,300,'boyfriend')
                setCamPos(500,300,'gf')

                doTweenZoom('camz7','camGame',0.3,10,'sineInOut')
            end

            if v2 == '3' then
                doTweenAlpha('disableCamGame','camGame',0,1,'linear')
                doTweenAlpha('disableCamHUD','camHUD',0,1,'linear')
            end
        end

        if v1 == '27' then --  YOU CANT WIN
            if v2 == '1' then
                preloadCharacters(4)
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)

                removeFromMemory('bigmonika',true)
                removeFromMemory('B3Annie',true)
                setProperty('boyfriend.alpha',0.001)
                removeExtraIcon('gfIcon',true)

                triggerEvent('Change Character','dad','sonicexepov')
                triggerEvent('Change Character','gf','fleetway-anims1')

                doTweenColor('colorFleet','gf','FFAA30', 0.01, 'linear')
                doTweenColor('colorXeno', 'dad', 'FF0000', 0.01, 'linear')
                doTweenColor('colorBF', 'BFbehind', '31B0D1', 0.01, 'linear')

                setProperty('camGame.alpha',1) 
                setObjectOrder('gf',getObjectOrder('gradientFloor') + 1)

                setCamPos(300,-700,'dad')
                setCamPos(300,-700,'boyfriend')
                setCamPos(300,-700,'gf')

                setProperty('dad.x',-400)
                setProperty('dad.y',-1500)

                setProperty('gf.x',-1500)
                setProperty('gf.y',-600)

                setZoom(0.3,'boyfriend')
                setZoom(0.3,'dad')
                setZoom(0.3,'gf')

                characterPlayAnim('gf','Shut up',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '2' then
                doTweenX('moveFleetAnim','gf',1000,0.3,'linear')
                setProperty('gf.flipX',true)
                characterPlayAnim('gf','Step it up',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '3' then
                characterPlayAnim('gf','fatphobia',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '4' then
                doTweenX('moveFleetAnim','gf',-1500,0.4,'linear')
                setProperty('gf.flipX',false)
                characterPlayAnim('gf','Finished',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '5' then
                characterPlayAnim('gf','Step it up',false)
                setProperty('gf.specialAnim',true)
            end

            if v2 == '6' then
                characterPlayAnim('gf','Shut up',false)
                setProperty('gf.specialAnim',true)
            end
        end

        if v1 == '28' then -- SCRIMBO
            if v2 == '1' then

                doTweenZoom('instant','camGame',0.6,0.01,'linear')
                removeFromMemory('Ghostcello',true)
                removeFromMemory('sonicexepov',true)
                
                triggerEvent('Change Character','dad','scrimbo')
                triggerEvent('Change Character','boyfriend','gf-run')

                setProperty('gf.alpha',0.001)
                setProperty('legs.alpha',1)
                setProperty('boyfriend.alpha',1)
                setProperty('iconP2.alpha',1)
                setProperty('iconP1.alpha',1)
                setObjectOrder('boyfriend',getObjectOrder('clone4') + 1)

                setCamPos(-100,300,'dad')
                setCamPos(600,200,'boyfriend')
                setCamPos(0,300,'gf')

                setZoom(0.5,'boyfriend')
                setZoom(0.6,'dad')
                setZoom(0.6,'gf')

                setProperty('camGame.alpha',1)
                enableRunGF = true;
            end

            if v2 == '2' then
                playSound('spook',1)
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('clone1.alpha',1)
                setProperty('clone2.alpha',1)
                setProperty('clone3.alpha',1)
                setProperty('clone4.alpha',1)

                setProperty('dad.alpha',0)
            end

            if v2 == '3' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('clone1.alpha',0)
                setProperty('clone2.alpha',0)
                setProperty('clone3.alpha',0)
                setProperty('clone4.alpha',0)

                setProperty('dad.alpha',1)
                doTweenX('moveScrimbo','dad',2000,3,'linear')
                doTweenX('moveGFRerun','boyfriend',2000,3,'linear')

                setZoom(0.8,'boyfriend')
                setZoom(0.8,'dad')
                setZoom(0.8,'gf')

                setCamPos(500,400,'dad')
                setCamPos(500,400,'boyfriend')
                setCamPos(500,400,'gf')

                
            end
        end

        if v1 == '29' then -- GAMEBREAKER
            if v2 == '1' then
                removeFromMemory('scrimbo',true)
                removeFromMemory('gf-run',true)

                triggerEvent('Change Character','dad','DX')
                triggerEvent('Change Character','boyfriend','tailsdoll')

                setZoom(0.6,'dad')
                setCamPos(100,-200,'dad')
                setOffs(50,'dad')

                setProperty('dad.x',-300)
                setProperty('dad.y',-180)
                setProperty('boyfriend.x',600)
                setProperty('boyfriend.y',300)
            end

            if v2 == '2' then
                setProperty('camGame.alpha',0.001)
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('dxphase1.alpha',1)
            end

            if v2 == '3' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('dxphase1.alpha',0.001)
                setProperty('dxphase2.alpha',1)
            end
            
            if v2 == '4' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('dxphase2.alpha',0.001)
                setProperty('dxphase3.alpha',1)
            end

            if v2 == '5' then
                setProperty('camGame.alpha',1)
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('dxphase3.alpha',0.001)
                removeFromMemory('DX',true)

                triggerEvent('Change Character','dad','DX3')
                setProperty('gamebreakerBG1.alpha',0.001)
                setProperty('gamebreakerBG2.alpha',1)

                setProperty('dad.x',-300)
                setProperty('dad.y',-180)

                setOffs(50,'dad')
                setCamPos(100,-100,'dad')
                setZoom(0.45,'dad')
            end

            if v2 == '6' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('camGame.alpha',0.001)
                setProperty('BGFlipTailsDoll.alpha',1)
                triggerEvent('Change Character','boyfriend','tailsdoll3')
                setObjectCamera('boyfriend','hud')
                setProperty('boyfriend.x',500)
                setProperty('boyfriend.y',300)
            end

            if v2 == '7' then
                triggerEvent('Change Character','boyfriend','tailsdoll')
                setObjectCamera('boyfriend','camGame')

                setProperty('camGame.alpha',1)
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                setProperty('BGFlipTailsDoll.alpha',0.001)

                setProperty('boyfriend.x',600)
                setProperty('boyfriend.y',300)

                setOffs(50,'boyfriend')
            end
        end

        if v1 == '30' then --PIBBY
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)

                removeFromMemory('tailsdoll',true)
                removeFromMemory('DX3',true)
                removeFromMemory('tailsdoll3',true)
                removeFromMemory('fleetway-anims1',true)

                triggerEvent('Change Character','gf','jake')
                triggerEvent('Change Character','boyfriend','finncawm_reveal')
                triggerEvent('Change Character','dad','gumball')

                setProperty('gf.alpha',1)
                setObjectOrder('gf',getObjectOrder('roomBG') + 1)
                setObjectOrder('dad',getObjectOrder('voidBG') + 1)

                setProperty('boyfriend.x',-600)
                setProperty('boyfriend.y',-280)

                setProperty('dad.x',-600)
                setProperty('dad.y',1500)

                setProperty('gf.x',150)
                setProperty('gf.y',1500)

                setCamPos(100,315,'dad')
                setCamPos(100,315,'boyfriend')
                setCamPos(100,315,'gf')

                setZoom(0.8,'dad')
                setZoom(0.8,'boyfriend')
                setZoom(0.8,'gf')
            end

            if v2 == '2' then
                doTweenY('upPibbys1','dad',240,0.5,'linear')
                doTweenY('upPibbys1BG','voidBG',250,0.5,'linear')

                doTweenY('upPibbys2','gf',180,0.5,'linear')
                doTweenY('upPibbys2BG','roomBG',270,0.5,'linear')
            end
        end

        if v1 == '31' then --FINAL
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                removeFromMemory('finncawm_reveal',true)
                removeFromMemory('gumball-anims1',true)
                removeFromMemory('jake',true)

                triggerEvent('Change Character','dad','scott')
                triggerEvent('Change Character','gf','mxV2')
                triggerEvent('Change Character','boyfriend','carton_bendy')

                setProperty('scp939.alpha',1)
                setProperty('demon_sky.alpha',1)
                setProperty('nonsense.alpha',1)
                setProperty('bfUltraFinal.alpha',1)
                setProperty('act3front.alpha',1)

                setObjectOrder('act4line',getObjectOrder('slideBG') + 1)
                setObjectOrder('gf',getObjectOrder('act4line') + 2)
                setObjectOrder('nonsense',getObjectOrder('act4line') + 4)
                setObjectOrder('boyfriend',getObjectOrder('act4line') + 5)

                setObjectOrder('pipeBF',getObjectOrder('act4line') + 6)
                setObjectOrder('bfUltraFinal',getObjectOrder('act4line') + 7)

                setProperty('gf.y',0)
                setProperty('gf.x',1500)

                setZoom(0.55,'dad')
                setZoom(0.55,'boyfriend')
                setZoom(0.55,'gf')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
                setOffs(50,'gf')

                
                setCamPos(0,280,'dad')
                setCamPos(0,280,'boyfriend')
                setCamPos(0,280,'gf')
            end

            if v2 == '2' then
                doTweenX('enterMX','gf',550,0.3,'linear')
                doTweenX('enterSCP','scp939',-1200,0.3,'linear')

                addExtraIcon('gfIcon','2MX',true)
                setObjectOrder('gfIcon', getObjectOrder('iconP1') + 1)

                addExtraIcon('SCPIcon','939',false)
                setObjectOrder('SCPIcon', getObjectOrder('iconP2') + 1)
            end

            if v2 == '3' then
                doTweenX('enterNuSky','demon_sky',-300,0.3,'linear')
                doTweenX('enterNonsense','nonsense',500,0.3,'linear')

                addExtraIcon('NuSkyIcon','demon-sky',false)
                setObjectOrder('NuSkyIcon', getObjectOrder('iconP2') + 1)

                addExtraIcon('nonsenseIcon','nonsenseGod',true)
                setObjectOrder('nonsenseIcon', getObjectOrder('iconP1') + 1)
                setProperty('nonsenseIcon.offset.y',getProperty('iconP1.offset.y') + 80)
            end

            if v2 == '4' then
                doTweenY('enterBFFinal','bfUltraFinal',-10,0.3,'linear')
                doTweenY('enterPipe','pipeBF',500,0.3,'linear')
                doTweenZoom('finalZoom','camGame',1,5,'linear')
            end

            if v2 == '5' then
                cancelTween('finalZoom')
                setProperty('camGame.zoom',0.8)
                setProperty('camZooming',false)
                cameraFlash('game','FF0000',1)

                setProperty('boyfriend.visible',false)
                setProperty('dad.visible',false)
                setProperty('demon_sky.visible',false)
                setProperty('nonsense.visible',false)
                setProperty('bfUltraFinal.visible',false)
                setProperty('scp939.visible',false)
                setProperty('gf.visible',false)
                setProperty('act4line.visible',false)
                setProperty('pipeBF.visible',false)
                setProperty('slideBG.visible',false)
                setProperty('act3front.visible',false)

                setProperty('camHUD.visible',false)

                setProperty('act4end.alpha',1)
                playAnim('act4end','anim',true)
                setProperty('redbg.alpha', 1)
            end

            if v2 == '6' then
                doTweenAlpha('act4endalpha','act4end',0,3,'sineIn')
                doTweenX('act4endscalex','act4end.scale',0.6,3,'sineIn')
                doTweenY('act4endscaley','act4end.scale',0.6,3,'sineIn')
            end

            if v2 == '7' then
                doTweenAlpha('gameoveralpha','gameover',1,3,'sineOut')
            end

            if v2 == '8' then
                cameraFade('game','000000',3)
            end
        end
    end
end

function opponentNoteHit(id,data,type,sus)
    if type == 'Teuthida Note' then
        playAnim('teuthida',getProperty('singAnimations['..data..']'),false)
        setProperty('teuthida.holdTimer',0)
    end

    if type == 'Billy Note' or (type == 'BOTHSING' and enableSingBilly) then
        playAnim('billy',getProperty('singAnimations['..data..']'),false)
        setProperty('billy.holdTimer',0)
    end

    if type == 'Bowser Note' then
        playAnim('bowser',getProperty('singAnimations['..data..']'),false)
        setProperty('bowser.holdTimer',0)
    end

    if type == 'BOTHSING' and not disableShake then
        cameraShake('camGame', 0.01, 0.4)
    end

    if type == 'ChrisPratt Note' then
        playAnim('cpratt',getProperty('singAnimations['..data..']'),false)
        characterPlayAnim('dad',getProperty('singAnimations['..data..']'),false)
        characterPlayAnim('gf',getProperty('singAnimations['..data..']'),false)
        setProperty('cpratt.holdTimer',0)
    end

    if type == 'SCP939 Note' then
        playAnim('scp939',getProperty('singAnimations['..data..']'),false)
        setProperty('scp939.holdTimer',0)
    end

    if type == 'NuSky Note' then
        playAnim('demon_sky',getProperty('singAnimations['..data..']'),false)
        setProperty('demon_sky.holdTimer',0)
    end

    if curStep >= 5076 and curStep <= 5104 then
        playAnim('demon_sky',getProperty('singAnimations['..data..']'),false)
        setProperty('demon_sky.holdTimer',0)
        playAnim('scp939',getProperty('singAnimations['..data..']'),false)
        setProperty('scp939.holdTimer',0)
    end
end

function goodNoteHit(id,data,type,sus)
    if type == 'RosieMaid Note' then
        playAnim('rosie',getProperty('singAnimations['..data..']'),false)
        characterPlayAnim('boyfriend',getProperty('singAnimations['..data..']'),false)
        setProperty('bowser.holdTimer',0)
    end

    if enableSingYuriCrazy and type == 'BOTHSING' then
        playAnim('yuri_crazy',getProperty('singAnimations['..data..']'),false)
        setProperty('yuri_crazy.holdTimer',0)
    end

    if type == 'Nonsense Note' then
        playAnim('nonsense',getProperty('singAnimations['..data..']'),false)
        setProperty('nonsense.holdTimer',0)
    end

    if curStep >= 5076 and curStep <= 5104 then
        playAnim('nonsense',getProperty('singAnimations['..data..']'),false)
        setProperty('nonsense.holdTimer',0)
        playAnim('bfUltraFinal',getProperty('singAnimations['..data..']'),false)
        setProperty('bfUltraFinal.holdTimer',0)
        characterPlayAnim('gf',getProperty('singAnimations['..data..']'),false)
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

