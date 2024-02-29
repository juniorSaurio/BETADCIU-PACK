local enableSingBilly = false;

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
    end

    if act == 4 then
        
    end
end

function onCreate()

    preloadImages()
    preloadCharacters(1)

    precacheSound('amongKill')
    precacheSound('spinCartoon')

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
        if v1 == '2' then 
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
        
                addAnimationByPrefix('lighting1','idle','lightning',24,true)
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

                --setObjectOrder('billy',getObjectOrder('whitebg') + 1)
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
                
                doTweenAngle('rotatecamGame','camGame',50,1,'expoIn')
                doTweenAngle('rotatecamHUD','camHUD',-30,2,'expoIn')

                doTweenY('bottomcamGame','camGame',800,1,'cubeIn')
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

        if v1 == '19' then
            if v2 == '1' then
                cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
                removeFromMemory('Alexis',true)
                removeFromMemory('betanew',true)

                triggerEvent('Change Character','boyfriend','lune')
                triggerEvent('Change Character','dad','qt-kb')

                setZoom(0.7,'dad')
                setZoom(0.5,'boyfriend')

                setCamPos(-300,300,'dad')
                setCamPos(0,300,'boyfriend')

                setOffs(50,'dad')
                setOffs(50,'boyfriend')
            end
        end
    end
end

function opponentNoteHit(id,data,type,sus)
    if type == 'Teuthida Note' then
        playAnim('teuthida',getProperty('singAnimations['..data..']'),true)
        setProperty('teuthida.holdTimer',0)
    end

    if type == 'Billy Note' or (type == 'BOTHSING' and enableSingBilly) then
        playAnim('billy',getProperty('singAnimations['..data..']'),true)
        setProperty('billy.holdTimer',0)
    end

    if type == 'Bowser Note' then
        playAnim('bowser',getProperty('singAnimations['..data..']'),true)
        setProperty('bowser.holdTimer',0)
    end

    if type == 'BOTHSING' then
        cameraShake('camGame', 0.01, 0.4)
    end

    if type == 'ChrisPratt Note' then
        playAnim('cpratt',getProperty('singAnimations['..data..']'),true)
        characterPlayAnim('dad',getProperty('singAnimations['..data..']'),true)
        characterPlayAnim('gf',getProperty('singAnimations['..data..']'),true)

        setProperty('cpratt.holdTimer',0)
    end 
end

function onSectionHit()
    if getSongPosition() > 323000 and getSongPosition() < 348000 then
        --setProperty('defaultCamZoom',getProperty('defaultCamZoom')+0.05)
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

