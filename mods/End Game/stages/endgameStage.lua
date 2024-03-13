local nameStage1 = 'allstarsAct1';
local nameStage2 = 'hellhole';
local nameStage3 = 'mazeZardy'
local nameStage4 = 'tordBot'
local nameStage5 = 'closetYuri'
local nameStage6 = 'impostorRoom'
local nameStage7 = 'piracy'
local nameStage8 = 'nes'
local nameStage9 = 'sansSex'
local nameStage10 = 'pokemonBattle'
local nameStage11 = 'doxxieRoom'
local nameStage12 = 'bootlegRoom'
local nameStage13 = 'style'
local nameStage14 = 'unbeatable'
local nameStage15 = 'nightmare'
local nameStage16 = 'stream'
local nameStage17 = 'act3'
local nameStage18 = 'mansion'
local nameStage19 = 'cavern'
local nameStage20 = 'restaurant'
local nameStage21 = 'space'
local nameStage22 = 'building'
local nameStage23 = 'jungle'
local nameStage24 = 'phantasm'
local nameStage25 = 'clubroom'
local nameStage26 = 'winter'
local nameStage27 = 'act4'
local nameStage28 = 'smoke'
local nameStage29 = 'bundle'
local nameStage30 = 'pibby'
local nameStage31 = 'final'

local trhowAnimation1 = false
local trhowAnimation2 = false
local trhowAnimation3 = false
local trhowAnimation4 = false
local trhowAnimation5 = false
local trhowAnimation6 = false

local enableShaderWiggles = false;
local enableShaderScroll = false;
local disableChat = false;

local names = {
    'YairLK7',
    'Cesar_Rosa',
    'TheRealGoodSav0n_',
    'Gfsoft',
    'd3nki_',
    'Jamkel',
    'litebulb4rent',
    'Micku170',
    'PlainMiki',
    'TDMtrevie',
    'selinisnephaha4209',
    'BillyVanFNF',
    'CutePhantom',
    'arin_102',
    'rinocenatiempo1277',
    'enchanted891',
    'TheBfdiGoober',
    'JamesIsagi',
    'elvertederodedr8786',
    'fireguyj4mes',
    'PinkNinjanerd',
    'memelord696',
    'ludmilaberrios214',
    'yulisusanti9113',
    'heyitskarl996',
    'legacywyn'
}

local dialogues = {
    'This is soo amazing',
    'THIS IS SO AWSOME',
    'I love this cover 😊',
    'GO GB!',
    'What the hell, this is actually good',
    'DAMNNN that is some AMAZING COVER BRO',
    'Amazing cover',
    'Amazing banger u did',
    'I love this so much!!',
    'Tbh I loved the becatiu',
    'OMG!!!',
    'NAAAA IMPRESIONANTE 10/10',
    'PEAAAAKK!!',
    'THIS IS MATERPIECE',
    'Omg korb i love this',
    'Yo soy luigi mamá mía soy luigi.exe soy amigo de Mario madness',
    'me encantaaaaaaaaa',
    'the best part!',
    'Epic cover as always Junior!',
    'Good cover dude keep it up',
    'yoooooooooooooo very awsome cover bro i loved',
    'Esta Súper Bro',
    'this cover ate!!! Keep up the good work‼️‼️‼️🗣️',
    'damn, very cool cover bro',
    ':fuego:',
    'This has to be one of your best works yet!',
    'se ve tan bien',
    'MY GOD THIS LOOKS SOO AWSOME AND BANGER COVER',
    '10/10 man well done'

}

local dialogueCount = 0
local minDialogePos = 0

local personsAppears = {}

function preloadImages(nameStage)
    if nameStage == nameStage1 then
        precacheImage('backgrounds/act1/act1_sky')
        precacheImage('backgrounds/act1/act1_stat')
        precacheImage('backgrounds/act1/act1_skyline')
        precacheImage('backgrounds/act1/act1_gradient')
        precacheImage('backgrounds/act1/act1_bgbuildings')
        precacheImage('backgrounds/act1/act1_floor')
        precacheImage('backgrounds/act1/act1')
    end

    if nameStage == nameStage2 then
        precacheImage('backgrounds/hellhole/SKY')
        precacheImage('backgrounds/hellhole/Back')
        precacheImage('backgrounds/hellhole/infernogroundp1')
        precacheImage('backgrounds/hellhole/infernogroundp2')
    end

    if nameStage == nameStage4 then
        precacheImage('backgrounds/tord/TordBG')
        precacheImage('backgrounds/tord/TordBGski')
    end
    
    if nameStage == nameStage5 then
        precacheImage('backgrounds/closet/ClosetBG')
    end

    if nameStage == nameStage6 then
        precacheImage('backgrounds/impostor/graybg')
    end

    if nameStage == nameStage7 then
        precacheImage('backgrounds/piracy/piracy_bg2')
    end

    if nameStage == nameStage8 then
        precacheImage('backgrounds/toploader/BGnes')
        precacheImage('backgrounds/toploader/border')
        precacheImage('backgrounds/toploader/scanlines3')
    end

    if nameStage == nameStage9 then
        precacheImage('backgrounds/sans/sexstage')
    end

    if nameStage == nameStage10 then
        precacheImage('backgrounds/amusia/BG-Amusia')
        precacheImage('backgrounds/amusia/FG-Amusia')
        precacheImage('backgrounds/amusia/static-overlay')
    end

    if nameStage == nameStage11 then
        precacheImage('backgrounds/panzu/bg2')
    end

    if nameStage == nameStage12 then
        precacheImage('backgrounds/mcm/facelessBG')
        precacheImage('backgrounds/mcm/massacreBG')
        precacheImage('backgrounds/mcm/pillarServed')
        precacheImage('backgrounds/mcm/roomBootleg')
    end

    if nameStage == nameStage13 then
        precacheImage('backgrounds/style/ruv')
    end

    if nameStage == nameStage14 then
        precacheImage('backgrounds/unbeatable/bars')
        precacheImage('backgrounds/unbeatable/nesglitch')
        precacheImage('backgrounds/unbeatable/static')
        precacheImage('backgrounds/unbeatable/estatica_uwu')
    end

    if nameStage == nameStage15 then
        precacheImage('backgrounds/nightmare/nightmare1')
        precacheImage('backgrounds/nightmare/nightmare2')
    end

    if nameStage == nameStage16 then
        precacheImage('backgrounds/stream/direct bg grey')
        precacheImage('backgrounds/stream/direct bg back')
    end

    if nameStage == nameStage17 then
        precacheImage('backgrounds/act3/act3Spotlight')
        precacheImage('backgrounds/act3/act3')
    end

    if nameStage == nameStage18 then
        precacheImage('backgrounds/mansion/BG')
    end

    if nameStage == nameStage19 then
        precacheImage('backgrounds/cavern/BackWall')
        precacheImage('backgrounds/cavern/Ground')
        precacheImage('backgrounds/cavern/BGSKULL')
    end

    if nameStage == nameStage20 then
        precacheImage('backgrounds/restaurant/BG')
        precacheImage('backgrounds/restaurant/bubble_tea')
    end

    if nameStage == nameStage21 then
        precacheImage('backgrounds/space/BG')
    end

    if nameStage == nameStage22 then
        precacheImage('backgrounds/building/City')
        precacheImage('backgrounds/building/h-neo3')
    end

    if nameStage == nameStage23 then
        precacheImage('backgrounds/jungle/infinitespeed')
        precacheImage('backgrounds/jungle/mystic_jungle_BG')
        precacheImage('backgrounds/jungle/infinitelight')
    end

    if nameStage == nameStage24 then
        precacheImage('backgrounds/phantasm/sonicBG')
    end

    if nameStage == nameStage25 then
        precacheImage('backgrounds/clubroom/BG')
        precacheImage('backgrounds/clubroom/vignetteend')
    end

    if nameStage == nameStage26 then
        precacheImage('backgrounds/winter/BG')
    end

    if nameStage == nameStage27 then
        precacheImage('backgrounds/act4/BF-behind')
        precacheImage('backgrounds/act4/act2_abyss_gradient')
        precacheImage('characters/scrimbolaugh')
    end

    if nameStage == nameStage28 then
        precacheImage('backgrounds/smoke/stare')
        precacheImage('characters/legs')
        precacheImage('characters/scrimbo-run-reanimated')
    end

    if nameStage == nameStage29 then
        precacheImage('backgrounds/bundle/grassBG')
        precacheImage('backgrounds/bundle/grassBG2')
        precacheImage('backgrounds/bundle/dxcomicP1')
        precacheImage('backgrounds/bundle/dxcomicP2')
        precacheImage('backgrounds/bundle/dxcomicP3')
        precacheImage('backgrounds/bundle/TailsDollBGFlipped')
    end

    if nameStage == nameStage30 then
        precacheImage('backgrounds/pibby/realBackground')
        precacheImage('backgrounds/pibby/RoomBG')
        precacheImage('backgrounds/pibby/VoidBG')
    end

    if nameStage == nameStage31 then
        precacheImage('backgrounds/final/Act_4_FINALE_Lightingmcqueen')
        precacheImage('backgrounds/final/Act_4_FINALE_Gameover')
        precacheImage('backgrounds/final/Act_4_FINALE_DEATH')
        precacheImage('backgrounds/final/bf pipe final')
        precacheImage('backgrounds/final/bf pipe final')
    end
end

function onCreate()

    addLuaScript('extra_scripts/loadingStage')
    
    preloadImages(nameStage1)
    preloadImages(nameStage2)
    preloadImages(nameStage4)

    makeLuaSprite('redbg', '', 0, 0)
    setScrollFactor('redbg', 0, 0)
    makeGraphic('redbg', 4440, 3000, 'FF0000')
    setProperty('redbg.alpha', 0.001)
    screenCenter('redbg', 'xy')
        addLuaSprite('redbg', false)

    precacheImage('backgrounds/zardy/maze')
    makeAnimatedLuaSprite('BgMaze','backgrounds/zardy/maze',-1350,-200)
    setProperty('BgMaze.alpha',0.001)
        addLuaSprite('BgMaze',false)

    precacheImage('anims/ycbu_lightning')
	makeAnimatedLuaSprite('lighting1','anims/ycbu_lightning',1800,-500)
    addAnimationByPrefix('lighting1','idle','lightning',24,true)
	scaleObject('lighting1',2,2)
    setProperty('lighting1.alpha',0.001)
		addLuaSprite('lighting1',false)

    precacheImage('anims/warning')
    makeAnimatedLuaSprite('warningMouse','anims/warning',0,0)
    addAnimationByPrefix('warningMouse','anim','Advertencia',24,false)
    screenCenter('warningMouse','xy')
    setObjectCamera('warningMouse','other')
    setProperty('warningMouse.alpha',0.001)
        addLuaSprite('warningMouse',false)

    precacheImage('backgrounds/tord/Explosion')
    makeAnimatedLuaSprite('explosion','backgrounds/tord/Explosion',-900,-400)
    addAnimationByPrefix('explosion','explosion','Explosion',24,false)
    scaleObject('explosion',7,7)
    setProperty('explosion.alpha',0.001)
       addLuaSprite('explosion',true)

    createStage(nameStage1)

end

function createStage(nameStage)

    if nameStage == nameStage1 then
        makeLuaSprite('act1sky','backgrounds/act1/act1_sky',-1600,-860)
        setScrollFactor('act1sky',0.4,0.4)
        addLuaSprite('act1sky',false)
    
        makeAnimatedLuaSprite('act1static','backgrounds/act1/act1_stat',-2300,-660)
        addAnimationByPrefix('act1static','anim','act1_static',24,true)
        setProperty('act1static.alpha',0.3)
        setScrollFactor('act1static',0.3,0.3)
        scaleObject('act1static',4,4)
        addLuaSprite('act1static',false)
    
        makeLuaSprite('act1skyline','backgrounds/act1/act1_skyline',-2000,-660)
        setScrollFactor('act1skyline',0.6,0.6)
        addLuaSprite('act1skyline',false)
    
        makeLuaSprite('act1gradiant','backgrounds/act1/act1_gradient',-2300,-850)
        addLuaSprite('act1gradiant',true)
    
        makeLuaSprite('act1buildings','backgrounds/act1/act1_bgbuildings',-2100,-660)
        setScrollFactor('act1buildings',0.8,0.8)
        addLuaSprite('act1buildings',false)
    
        makeLuaSprite('act1floor','backgrounds/act1/act1_floor',-2300,-660)
        addLuaSprite('act1floor',false)
    
        makeLuaSprite('act1front','backgrounds/act1/act1',0,0)
        setObjectCamera('act1front','hud')
        addLuaSprite('act1front',true)
    end

    if nameStage == nameStage2 then
        makeLuaSprite('infernoSky','backgrounds/hellhole/SKY',-1700,-600)
        setScrollFactor('infernoSky',0.7,0.7)
        scaleObject('infernoSky',2,2)
        addLuaSprite('infernoSky',false)
    
        makeLuaSprite('infernoBg','backgrounds/hellhole/Back',-1840,-550)
        setScrollFactor('infernoBg',0.75,0.75)
        scaleObject('infernoBg',2,2)
        addLuaSprite('infernoBg')
    
        makeLuaSprite('infernoGround1','backgrounds/hellhole/infernogroundp1',-2040,-750)
        scaleObject('infernoGround1',2,2)
        addLuaSprite('infernoGround1',false)

        makeLuaSprite('infernoGround2','backgrounds/hellhole/infernogroundp2',-2040,-750)
        scaleObject('infernoGround2',2,2)
        addLuaSprite('infernoGround2',true)
    end
    
    if nameStage == nameStage3 then
        
        setProperty('BgMaze.alpha',1)
        addAnimationByPrefix('BgMaze','idle','Stage',24,true)

        makeLuaSprite('redBG', '', 0, 0)
        setScrollFactor('redBG', 0, 0)
        makeGraphic('redBG', 3840, 2160, 'FA1414')
        addLuaSprite('redBG', false)
        screenCenter('redBG', 'xy')
    end

    if nameStage == nameStage4 then
        makeLuaSprite('tordBG','backgrounds/tord/TordBG',-1500,-700)
        addLuaSprite('tordBG',false)

        makeLuaSprite('skiBG','backgrounds/tord/TordBGski',1500,-700)
        setProperty('skiBG.alpha',0.001)
        addLuaSprite('skiBG',false)
        
        setObjectOrder('skiBG',getObjectOrder('tordBG') + 1)
        setObjectOrder('lighting1',getObjectOrder('tordBG') + 2)
    end

    if nameStage == nameStage5 then
        makeLuaSprite('closetBG','backgrounds/closet/ClosetBG',-550,0)
            addLuaSprite('closetBG',false)
    end

    if nameStage == nameStage6 then
        makeLuaSprite('grayBG','backgrounds/impostor/graybg',-1850,-100)
            addLuaSprite('grayBG',false)
    end

    if nameStage == nameStage7 then
        makeLuaSprite('piracyBG','backgrounds/piracy/piracy_bg2',-500,750)
            addLuaSprite('piracyBG',false)

        makeAnimatedLuaSprite('overlayAmusia','backgrounds/amusia/static-overlay',15,0)
        scaleObject('overlayAmusia',1.5,1.5)
        screenCenter('overlayAmusia','xy')
        addAnimationByPrefix('overlayAmusia','idle','static-overlay',24,true)
        setObjectCamera('overlayAmusia','hud')
        setProperty('overlayAmusia.alpha',0.001)
            addLuaSprite('overlayAmusia',false)

        makeLuaSprite('whitebg', '', 0, 0)
        setScrollFactor('whitebg', 0, 0)
        makeGraphic('whitebg', 4440, 3000, 'FFFFFF')
        setProperty('whitebg.alpha', 0.001)
        screenCenter('whitebg', 'xy')
            addLuaSprite('whitebg', false)

        makeAnimatedLuaSprite('jumpscareSans','backgrounds/nightmare/NightmareJumpscares02',150,-200)
        addAnimationByPrefix('jumpscareSans','jump','Wussup Bitch instance 1',24,false)
        scaleObject('jumpscareSans',0.6,0.6)
        setObjectCamera('jumpscareSans','hud')
        setProperty('jumpscareSans.alpha',0.001)
        setProperty('jumpscareSans.x',-400)
            addLuaSprite('jumpscareSans',false)
        
        makeAnimatedLuaSprite('jumpscareBendy','backgrounds/nightmare/NightmareJumpscares03',20,-300)
        addAnimationByPrefix('jumpscareBendy','jump','Emmi instance 1',24,false)
        scaleObject('jumpscareBendy',0.6,0.6)
        setObjectCamera('jumpscareBendy','hud')
        setProperty('jumpscareBendy.alpha',0.001)
        setProperty('jumpscareBendy.x',400)
            addLuaSprite('jumpscareBendy',false)
    
        makeAnimatedLuaSprite('jumpscareCuphead','backgrounds/nightmare/NightmareJumpscares01',-330,-150)
        addAnimationByPrefix('jumpscareCuphead','jump','CupScare instance 1',24,false)
        scaleObject('jumpscareCuphead',0.6,0.6)
        setObjectCamera('jumpscareCuphead','hud')
        setProperty('jumpscareCuphead.alpha',0.001)
            addLuaSprite('jumpscareCuphead',false)
    end

    if nameStage == nameStage8 then
        makeLuaSprite('scanLinesNES', 'backgrounds/toploader/scanlines3', 0, 0);
        screenCenter('scanLinesNES','xy')
        setObjectCamera('scanLinesNES', 'hud')
            addLuaSprite('scanLinesNES', false)

        makeLuaSprite('borderNES', 'backgrounds/toploader/border', 0, 0);
        scaleObject('borderNES', 7.32, 5.48);
        setObjectCamera('borderNES', 'hud')
            addLuaSprite('borderNES', false)
            
        makeLuaSprite('nesBG', 'backgrounds/toploader/nesBG', -300, -400);
                addLuaSprite('nesBG', false)    
    end

    if nameStage == nameStage9 then
        makeLuaSprite('sansStage','backgrounds/sans/sexstage',-900,-700)
            addLuaSprite('sansStage', false)
    end

    if nameStage == nameStage10 then
        makeLuaSprite('amusiaBG','backgrounds/amusia/BG-Amusia',-600,-100)
        scaleObject('amusiaBG',1.5,1.5)
        addLuaSprite('amusiaBG', false)

        makeLuaSprite('amusiaFG','backgrounds/amusia/FG-Amusia',-450,80)
        addLuaSprite('amusiaFG', false)

    end

    if nameStage == nameStage11 then
        makeLuaSprite('doxxieBG','backgrounds/panzu/bg2',-900,-200)
        addLuaSprite('doxxieBG', false)
    end

    if nameStage == nameStage12 then
        makeLuaSprite('roomBootleg','backgrounds/mcm/roomBootleg',-900,-200)
        addLuaSprite('roomBootleg', false)

        makeLuaSprite('massacreBG','backgrounds/mcm/massacreBG',-700,1500)
        setProperty('massacreBG.flipX',true)
            addLuaSprite('massacreBG', true)

        makeLuaSprite('facelessBG','backgrounds/mcm/facelessBG',-1100,1500)
            addLuaSprite('facelessBG', true)

        makeLuaSprite('pillarServed','backgrounds/mcm/pillarServed',-350,1500)
            addLuaSprite('pillarServed', true)
    end

    if nameStage == nameStage13 then
        makeLuaSprite('BgStyle','backgrounds/style/ruv',-1600,-3100)
        scaleObject('BgStyle',1.5,1.5)
        addLuaSprite('BgStyle', false)
    end

    if nameStage == nameStage14 then

        makeLuaSprite('BGEpiphany','backgrounds/unbeatable/epiphany',-900,0)
        scaleObject('BGEpiphany',2,2)
        setProperty('BGEpiphany.alpha',0.001)
        addLuaSprite('BGEpiphany', false)

        makeLuaSprite('bgBar','backgrounds/unbeatable/bars',0,0)
        scaleObject('bgBar', 3, 3)
        screenCenter('bgBar')
        addLuaSprite('bgBar', false)

        makeLuaSprite('bgNesGlitch','backgrounds/unbeatable/nesglitch',-1100,0)
        scaleObject('bgNesGlitch',1.5,1.5)
        addLuaSprite('bgNesGlitch', false)

    end

    if nameStage == nameStage15 then
        
        makeLuaSprite('BgNightmare2','backgrounds/nightmare/nightmare2',-2500,-1400)
        scaleObject('BgNightmare2',3,3)
        addLuaSprite('BgNightmare2', false)

        makeLuaSprite('BgNightmare1','backgrounds/nightmare/nightmare1',-2500,-1400)
        scaleObject('BgNightmare1',3,3)
        setProperty('BgNightmare1.alpha',0.001)
        addLuaSprite('BgNightmare1', false)
    end

    if nameStage == nameStage16 then

        makeLuaSprite('directBGBack','backgrounds/stream/direct bg back',-900,-500)
        addLuaSprite('directBGBack', false)

        makeLuaSprite('directBGFront','backgrounds/stream/direct bg grey',-900,-500)
        addLuaSprite('directBGFront', true)

    end

    if nameStage == nameStage17 then

        makeLuaSprite('act3smoke','backgrounds/act3/act3Spotlight',-1700,-600)
        setProperty('act3smoke.alpha',0.7)
            addLuaSprite('act3smoke',true)

        makeLuaSprite('act3front','backgrounds/act3/act3',0,0)
        setObjectCamera('act3front','hud')
        setProperty('act3front.alpha',0.8)
            addLuaSprite('act3front',false)

	    makeAnimatedLuaSprite("skull", "backgrounds/cavern/BGSKULL", -3400, -1300)
	    addAnimationByPrefix("skull", "idle", "WholeSkull", 24, true)
	    scaleObject("skull", 1.8, 1.8)
        setProperty('skull.alpha',0.001)
	        addLuaSprite("skull")

        makeAnimatedLuaSprite("h3", "backgrounds/building/h-neo3", -860, -720)
        addAnimationByPrefix("h3", "idle", "a", 24, true)
        scaleObject("h3", 2, 2)
        setProperty('h3.alpha',0.001)
            addLuaSprite("h3",false)

        makeAnimatedLuaSprite("infiniteSpeed", "backgrounds/jungle/infinitespeed", -1200, -850)
        addAnimationByPrefix("infiniteSpeed", "idle", "RedSpeed", 24, true)
        scaleObject('infiniteSpeed',3,3)
        setProperty('infiniteSpeed.alpha',0.001)
            addLuaSprite("infiniteSpeed",false)
    end

    if nameStage == nameStage18 then
        makeLuaSprite('mansionBG','backgrounds/mansion/BG',-1700,-600)
            addLuaSprite('mansionBG',false)
    end

    if nameStage == nameStage19 then
        makeLuaSprite("bgWall", "backgrounds/cavern/BackWall", -1650, -900)
	    scaleObject("bgWall", 1.2, 1.2)
	        addLuaSprite("bgWall")

        setObjectOrder('skull',getObjectOrder('bgWall') + 1)
        
        makeLuaSprite("groundCavern", "backgrounds/cavern/Ground", -1650, 200)
        scaleObject("groundCavern", 1.2, 1.2)
            addLuaSprite("groundCavern")

        setObjectOrder('groundCavern',getObjectOrder('skull') + 1)

        setProperty('skull.alpha',1)
    end

    if nameStage == nameStage20 then
        makeLuaSprite('restBG','backgrounds/restaurant/BG',-1300,-800)
            addLuaSprite('restBG',false)

        makeLuaSprite('hudBubble','backgrounds/restaurant/bubble_tea',0,0)
        setObjectCamera('hudBubble','hud')
        setProperty('hudBubble.alpha',0.001)
            addLuaSprite('hudBubble',false)
    end

    if nameStage == nameStage21 then
        makeLuaSprite('spaceBG','backgrounds/space/BG',-800,-700)
        scaleObject('spaceBG',1.5,1.5)
            addLuaSprite('spaceBG',false)
    end

    if nameStage == nameStage22 then
        makeLuaSprite('cityNeo','backgrounds/building/City',-1500,-800)
        scaleObject('cityNeo',1.2,1.2)
            addLuaSprite('cityNeo',false)

        setProperty('h3.alpha',1)
        setObjectOrder('h3',getObjectOrder('cityNeo') + 1)

    end

    if nameStage == nameStage23 then
        makeLuaSprite('mysticJungle','backgrounds/jungle/mystic_jungle_BG',-900,-900)
        scaleObject('mysticJungle',2.2,2.2)
            addLuaSprite('mysticJungle',false)

        makeLuaSprite('infiniteLight','backgrounds/jungle/infinitelight',0,0)
        setObjectCamera('infiniteLight','hud')
        screenCenter('infiniteLight','xy')
        setProperty('infiniteLight.alpha',0.001)
            addLuaSprite('infiniteLight',false)
    end

    if nameStage == nameStage24 then
        makeLuaSprite('sonicBG','backgrounds/phantasm/sonicBG',-550,-350)
            addLuaSprite('sonicBG',false)
    end

    if nameStage == nameStage25 then
        makeLuaSprite('clubRoom','backgrounds/clubroom/BG',-850,-300)
        scaleObject('clubRoom',1.5,1.5)
            addLuaSprite('clubRoom',false)

        makeLuaSprite('vigenetteBlood','backgrounds/clubroom/vignetteend',0,0)
        setObjectCamera('vigenetteBlood','hud')
        screenCenter('vigenetteBlood','xy')
            addLuaSprite('vigenetteBlood',false)
    end

    if nameStage == nameStage26 then
        makeLuaSprite('winterBG','backgrounds/winter/BG',-1700,-1850)
        scaleObject('winterBG',2,2)
        setProperty('winterBG.alpha',0.001)
            addLuaSprite('winterBG',false)
    end

    if nameStage == nameStage27 then

        makeLuaSprite('gradientFloor','backgrounds/act4/act2_abyss_gradient',-1000,-2200)
        scaleObject('gradientFloor',2,2)
            addLuaSprite('gradientFloor',true)

        makeLuaSprite('BFbehind','backgrounds/act4/BF-behind',-200,-200)
        scaleObject('BFbehind',1.5,1.5)
            addLuaSprite('BFbehind',true)

        makeAnimatedLuaSprite('scrimboLaugh', 'characters/scrimbolaugh', -650, -350);
        addAnimationByPrefix('scrimboLaugh', 'laugh', 'laughstart', 24, false);
        scaleObject('scrimboLaugh', 2, 2);
        setProperty('scrimboLaugh.alpha',0.001)
        setObjectCamera('scrimboLaugh','hud')
            addLuaSprite('scrimboLaugh',false);

        makeAnimatedLuaSprite('legs', 'characters/legs', 0, 200);
	    addAnimationByPrefix('legs', 'idle', 'run', 40, true);
	    scaleObject('legs', 2, 2);
        setProperty('legs.alpha',0.001)
	        addLuaSprite('legs',true);

        makeAnimatedLuaSprite('clone1', 'characters/scrimbo-run-reanimated', -400, -540);
	    addAnimationByPrefix('clone1', 'idle', 'idle', 24, true);
	    scaleObject('clone1', 0.6, 0.6);
	    setProperty('clone1.color', getColorFromHex('A36161'))
	    setProperty('clone1.alpha', 0.001);
            addLuaSprite('clone1',true);

	    makeAnimatedLuaSprite('clone2', 'characters/scrimbo-run-reanimated', -700, -100);
	    addAnimationByPrefix('clone2', 'idle', 'idle', 24, true);
	    scaleObject('clone2', 0.6, 0.6);
	    setProperty('clone2.color', getColorFromHex('A36161'))
	    setProperty('clone2.alpha', 0.001);
            addLuaSprite('clone2',true);

	    makeAnimatedLuaSprite('clone3', 'characters/scrimbo-run-reanimated', 800, -540);
	    addAnimationByPrefix('clone3', 'idle', 'idle', 24, true);
	    scaleObject('clone3', 0.6, 0.6);
	    setPropertyLuaSprite('clone3', 'flipX', true);
	    setProperty('clone3.color', getColorFromHex('A36161'))
	    setProperty('clone3.alpha', 0.001);
            addLuaSprite('clone3',true);

	    makeAnimatedLuaSprite('clone4', 'characters/scrimbo-run-reanimated', 1000, -100);
	    addAnimationByPrefix('clone4', 'idle', 'idle', 24, true);
	    scaleObject('clone4', 0.6, 0.6);
	    setPropertyLuaSprite('clone4', 'flipX', true);
	    setProperty('clone4.color', getColorFromHex('A36161'))
	    setProperty('clone4.alpha', 0.001);
            addLuaSprite('clone4',true);

        makeAnimatedLuaSprite('act4line','backgrounds/final/Act_4_FINALE_Lightingmcqueen',-990,-1150)
        scaleObject('act4line',3,3)
        addAnimationByPrefix('act4line','anim','line',24,true)
        setProperty('act4line.alpha',0.001)
            addLuaSprite('act4line',true)

        makeAnimatedLuaSprite('act4end','backgrounds/final/Act_4_FINALE_DEATH',100)
        addAnimationByPrefix('act4end','anim','Death',24,false)
        scaleObject('act4end',0.8,0.8)
        setScrollFactor('act4end',0,0)
        setProperty('act4end.alpha',0.001)
            addLuaSprite('act4end',true)

        makeLuaSprite('gameover','backgrounds/final/Act_4_FINALE_Gameover')
        setScrollFactor('gameover',0,0)
        setProperty('gameover.alpha',0.001)
        setProperty('gameover.antialiasing',false)
        screenCenter('gameover')
            addLuaSprite('gameover',true)
    end

    if nameStage == nameStage28 then
        makeLuaSprite('mirrors', 'backgrounds/smoke/stare', -1600, -1500);
            addLuaSprite('mirrors',false);
    end

    if nameStage == nameStage29 then
        makeLuaSprite('gamebreakerBG1', 'backgrounds/bundle/grassBG', -1600, -900);
            addLuaSprite('gamebreakerBG1',false);

        makeLuaSprite('gamebreakerBG2', 'backgrounds/bundle/grassBG2', -1600, -900);
        setProperty('gamebreakerBG2.alpha',0.001)
            addLuaSprite('gamebreakerBG2',false);

        makeLuaSprite('dxphase1', 'backgrounds/bundle/dxcomicP1', 0, 0);
        setObjectCamera('dxphase1','hud')
        screenCenter('dxphase1','xy')
        setProperty('dxphase1.alpha',0.001)
            addLuaSprite('dxphase1',false);

        makeLuaSprite('dxphase2', 'backgrounds/bundle/dxcomicP2', 0, 0);
        setObjectCamera('dxphase2','hud')
        screenCenter('dxphase2','xy')
        setProperty('dxphase2.alpha',0.001)
            addLuaSprite('dxphase2',false);

        makeLuaSprite('dxphase3', 'backgrounds/bundle/dxcomicP3', 0, 0);
        setObjectCamera('dxphase3','hud')
        screenCenter('dxphase3','xy')
        setProperty('dxphase3.alpha',0.001)
            addLuaSprite('dxphase3',false);

        makeLuaSprite('BGFlipTailsDoll', 'backgrounds/bundle/TailsDollBGFlipped', 0, 0);
        setObjectCamera('BGFlipTailsDoll','hud')
        screenCenter('BGFlipTailsDoll','xy')
        setProperty('BGFlipTailsDoll.alpha',0.001)
            addLuaSprite('BGFlipTailsDoll',false);
    end
    
    if nameStage == nameStage30 then
        makeLuaSprite('revealBG', 'backgrounds/pibby/realBackground', -900,-200);
            addLuaSprite('revealBG',false);

        makeLuaSprite('roomBG', 'backgrounds/pibby/RoomBG', 200,1500);
        scaleObject('roomBG',0.8,0.8)
        setProperty('roomBG.flipX',true)
            addLuaSprite('roomBG',true);

        makeLuaSprite('voidBG', 'backgrounds/pibby/VoidBG', -900,1500);
        scaleObject('voidBG',0.8,0.8)
            addLuaSprite('voidBG',true);
    end

    if nameStage == nameStage31 then
        setProperty('act4line.alpha',1)

        makeLuaSprite('slideBG', 'backgrounds/final/slide', -990,-1150);
        scaleObject('slideBG',3,3)
            addLuaSprite('slideBG',true);

        makeLuaSprite('pipeBF', 'backgrounds/final/bf pipe final', -200,2000);
        scaleObject('pipeBF',3,3)
            addLuaSprite('pipeBF',true);
    end
end

function removeStage(stage,destroy)
    if stage == nameStage1 then
        removeLuaSprite('act1sky',destroy)
        removeLuaSprite('act1static',destroy)
        removeLuaSprite('act1skyline',destroy)
        removeLuaSprite('act1gradiant',destroy)
        removeLuaSprite('act1buildings',destroy)
        removeLuaSprite('act1floor',destroy)
        removeLuaSprite('act1front',destroy)

        callScript('scripts/optimization','optimizeStage',{'act1',stage})
    end

    if stage == nameStage2 then
        removeLuaSprite('infernoSky',destroy)
        removeLuaSprite('infernoBg',destroy)
        removeLuaSprite('infernoGround1',destroy)
        removeLuaSprite('infernoGround2',destroy)

        callScript('scripts/optimization','optimizeStage',{'hellhole',stage})
    end

    if stage == nameStage3 then
        removeLuaSprite('redBG',destroy)
        removeLuaSprite('BgMaze',destroy)

        callScript('scripts/optimization','optimizeStage',{'zardy',stage})
    end

    if stage == nameStage4 then
        removeLuaSprite('tordBG',destroy)
        removeLuaSprite('skiBG',destroy)
        removeLuaSprite('lighting1',destroy)
        callScript('scripts/optimization','optimizeStage',{'tord',stage})
    end

    if stage == nameStage5 then
        removeLuaSprite('closetBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'closet',stage})
    end

    if stage == nameStage6 then
        removeLuaSprite('grayBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'impostor',stage})
    end

    if stage == nameStage7 then
        removeLuaSprite('piracyBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'piracy',stage})
    end

    if stage == nameStage8 then
        removeLuaSprite('nesBG',destroy)
        removeLuaSprite('borderNES',destroy)
        removeLuaSprite('scanLinesNES',destroy)
        callScript('scripts/optimization','optimizeStage',{'toploader',stage})
    end

    if stage == nameStage9 then
        removeLuaSprite('sansStage',destroy)
        callScript('scripts/optimization','optimizeStage',{'sans',stage})
    end

    if stage == nameStage10 then
        removeLuaSprite('amusiaBG',destroy)
        removeLuaSprite('amusiaFG',destroy)
        removeLuaSprite('overlayAmusia',destroy)
        callScript('scripts/optimization','optimizeStage',{'amusia',stage})
    end

    if stage == nameStage11 then
        removeLuaSprite('doxxieBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'panzu',stage})
    end

    if stage == nameStage12 then
        removeLuaSprite('facelessBG',destroy)
        removeLuaSprite('massacreBG',destroy)
        removeLuaSprite('pillarServed',destroy)
        removeLuaSprite('roomBootleg',destroy)

        callScript('scripts/optimization','optimizeStage',{'mcm',stage})
    end

    if stage == nameStage13 then
        removeLuaSprite('BgStyle',destroy)
        removeLuaSprite('whitebg',destroy)
        callScript('scripts/optimization','optimizeStage',{'style',stage})
    end

    if stage == nameStage14 then

        cancelTween('bgBarSTupidTweenAngle')
        cancelTween('bgBarSTupidTweenY')
        cancelTween('bgBarSTupidTweenX')

        removeLuaSprite('bgBar',destroy)
        removeLuaSprite('staticGlitch1',destroy)
        removeLuaSprite('staticGlitch2',destroy)
        removeLuaSprite('BGEpiphany',destroy)

        callScript('scripts/optimization','optimizeStage',{'unbeatable',stage})
    end

    if stage == nameStage15 then
        
        removeLuaSprite('nesStatic',destroy)
        removeLuaSprite('BgNightmare1',destroy)
        removeLuaSprite('BgNightmare2',destroy)
        callScript('scripts/optimization','optimizeStage',{'nightmare',stage})
    end

    if stage == nameStage16 then
        removeLuaSprite('directBGBack',destroy)
        removeLuaSprite('directBGFront',destroy)
        callScript('scripts/optimization','optimizeStage',{'stream',stage})
    end

    if stage == nameStage17 then
        removeLuaSprite('act3smoke',destroy)
        setProperty('act3front.alpha',0.001)
        callScript('scripts/optimization','optimizeStage',{'act3',stage})
    end

    if stage == nameStage18 then
        removeLuaSprite('mansionBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'mansion',stage})
    end

    if stage == nameStage19 then
        removeLuaSprite('bgWall',destroy)
        removeLuaSprite('groundCavern',destroy)
        removeLuaSprite('skull',destroy)
        callScript('scripts/optimization','optimizeStage',{'cavern',stage})
    end

    if stage == nameStage20 then
        removeLuaSprite('restBG',destroy)
        removeLuaSprite('hudBubble',destroy)
        callScript('scripts/optimization','optimizeStage',{'restaurant',stage})
    end

    if stage == nameStage21 then
        removeLuaSprite('spaceBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'space',stage})
    end

    if stage == nameStage22 then
        removeLuaSprite('h3',destroy)
        removeLuaSprite('cityNeo',destroy)
        callScript('scripts/optimization','optimizeStage',{'building',stage})
    end

    if stage == nameStage23 then
        removeLuaSprite('infiniteSpeed',destroy)
        removeLuaSprite('mysticJungle',destroy)
        removeLuaSprite('infiniteLight',destroy)
        callScript('scripts/optimization','optimizeStage',{'jungle',stage})
    end

    if stage == nameStage24 then
        removeLuaSprite('sonicBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'phantasm',stage})
    end

    if stage == nameStage25 then
        removeLuaSprite('clubRoom',destroy)
        removeLuaSprite('vigenetteBlood',destroy)
        callScript('scripts/optimization','optimizeStage',{'clubroom',stage})
    end

    if stage == nameStage26 then
        removeLuaSprite('winterBG',destroy)
        callScript('scripts/optimization','optimizeStage',{'winter',stage})
    end

    if stage == nameStage27 then
        removeLuaSprite('BFbehind',destroy)
        removeLuaSprite('gradientFloor',destroy)

        callScript('scripts/optimization','optimizeStage',{'act4',stage})
    end 

    if stage == nameStage28 then
        removeLuaSprite('legs',destroy)
        removeLuaSprite('clone1',destroy)
        removeLuaSprite('clone2',destroy)
        removeLuaSprite('clone3',destroy)
        removeLuaSprite('clone4',destroy)
        removeLuaSprite('mirrors',destroy)
        
        callScript('scripts/optimization','optimizeStage',{'smoke',stage})
    end

    if stage == nameStage29 then
        removeLuaSprite('gamebreakerBG1',destroy)
        removeLuaSprite('gamebreakerBG2',destroy)
        removeLuaSprite('dxphase1',destroy)
        removeLuaSprite('dxphase2',destroy)
        removeLuaSprite('dxphase3',destroy)
        removeLuaSprite('BGFlipTailsDoll',destroy)

        callScript('scripts/optimization','optimizeStage',{'bundle',stage})
    end

     if stage == nameStage30 then
        removeLuaSprite('revealBG',destroy)
        removeLuaSprite('roomBG',destroy)
        removeLuaSprite('voidBG',destroy)

        callScript('scripts/optimization','optimizeStage',{'pibby',stage})
     end
end

function onCreatePost()
    initLuaShader('pincushion')
    initLuaShader('scroll')
end

function onUpdate(elapsed)

    if enableShaderWiggles then
        setShaderFloat('amusiaBG','time',os.clock())
    end

    if enableShaderScroll then
        setShaderFloat('mirrors','iTime',os.clock())
    end

    if curStep == 751 then
        preloadImages(nameStage5)
    end

    if curStep == 812 then
        preloadImages(nameStage6)
    end

    if curStep == 910 then
        preloadImages(nameStage7)
        preloadImages(nameStage8)
        preloadImages(nameStage9)
    end

    if curStep == 1290 then
        preloadImages(nameStage10)
    end

    if curStep == 2300 then
        preloadImages(nameStage15)
    end

    if curStep == 2352 then
        preloadImages(nameStage16)
    end

    if curStep == 3008 then
        preloadImages(nameStage20)
    end

    if curStep == 3264 then
        preloadImages(nameStage21)
    end

    if curStep == 3552 then
        preloadImages(nameStage24)
    end

    if curStep == 3824 then
        preloadImages(nameStage25)
    end

    if curStep == 4128 then
        preloadImages(nameStage26)
    end

    if getProperty('warningMouse.animation.curAnim.name') == 'anim' and getProperty('warningMouse.animation.curAnim.finished') and trhowAnimation1 then
        removeLuaSprite('warningMouse',true)
        removeFromMemory('anims/warning',false)
        trhowAnimation1 = false
    end

    if getProperty('explosion.animation.curAnim.name') == 'explosion' and getProperty('explosion.animation.curAnim.finished') and trhowAnimation2 then
        removeLuaSprite('explosion',true)
        removeFromMemory('backgrounds/tord/Explosion',false)
        trhowAnimation2 = false
    end

    if getProperty('jumpscareCuphead.animation.curAnim.name') == 'jump' and getProperty('jumpscareCuphead.animation.curAnim.finished') and trhowAnimation3 then
        removeLuaSprite('jumpscareCuphead',true)
        removeFromMemory('backgrounds/nightmare/NightmareJumpscares01',false)
        trhowAnimation3 = false
    end

    if getProperty('jumpscareSans.animation.curAnim.name') == 'jump' and getProperty('jumpscareSans.animation.curAnim.finished') and trhowAnimation4 then
        removeLuaSprite('jumpscareSans',true)
        removeFromMemory('backgrounds/nightmare/NightmareJumpscares02',false)
        trhowAnimation4 = false
    end

    if getProperty('jumpscareBendy.animation.curAnim.name') == 'jump' and getProperty('jumpscareBendy.animation.curAnim.finished') and trhowAnimation5 then
        removeLuaSprite('jumpscareBendy',true)
        removeFromMemory('backgrounds/nightmare/NightmareJumpscares03',false)
        trhowAnimation5 = false
    end

    if getProperty('scrimboLaugh.animation.curAnim.name') == 'laugh' and getProperty('scrimboLaugh.animation.curAnim.finished') and trhowAnimation6 then
        removeLuaSprite('scrimboLaugh',true)
        removeFromMemory('characters/scrimbolaugh',false)
        trhowAnimation6 = false
    end
end

function onEvent(n,v1,v2)

    if n == 'Triggers BETADCIU' then

        if v1 == '1' then
            if v2 == '1' then
                setProperty('warningMouse.alpha',1)
                playAnim('warningMouse','anim',true)
                trhowAnimation1 = true;
            end
        end

        if v1 == '2' then
            if v2 == '0' then
                removeStage(nameStage1,true)
                createStage(nameStage2)
            end
        end

        if v1 == '3' then
            if v2 == '0' then
                removeStage(nameStage2,true)
                createStage(nameStage3)
            end
        end

        if v1 == '4' then
            if v2 == '0' then
                removeStage(nameStage3,true)
                createStage(nameStage4)
            end

            if v2 == '5' then
                setProperty('explosion.alpha',1)
                setObjectOrder('explosion',getObjectOrder('boyfriendGroup') + 2)
                playAnim('explosion','explosion',true)
                trhowAnimation2 = true;
            end
        end

        if v1 == '5' then
            if v2 == '0' then
                removeStage(nameStage4,true)
                createStage(nameStage5)
            end
        end

        if v1 == '6' then
            if v2 == '0' then
                removeStage(nameStage5,true)
                createStage(nameStage6)
            end
        end

        if v1 == '7' then
            if v2 == '0' then
                callScript('extra_scripts/loadingStage','startLoading')
                preloadImages(nameStage11)
                preloadImages(nameStage12)
                preloadImages(nameStage13)
                preloadImages(nameStage14)
                removeStage(nameStage6,true)
                createStage(nameStage7)
            end
        end

        if v1 == '8' then
            if v2 == '0' then
                removeStage(nameStage7,true)
                createStage(nameStage8)
            end
        end

        if v1 == '9' then
            if v2 == '0' then
                removeStage(nameStage8,true)
                createStage(nameStage9)
            end
        end

        if v1 == '10' then
            if v2 == '0' then
                removeStage(nameStage9,true)
                createStage(nameStage10)

                setSpriteShader('amusiaBG','pincushion')
                setShaderFloat('amusiaBG','distort',1.5)
                setShaderFloat('amusiaBG','prob',1.5)

                setProperty('overlayAmusia.alpha',0.4)

                enableShaderWiggles = true
            end
        end

        if v1 == '11' then
            if v2 == '0' then
                enableShaderWiggles = false
                removeStage(nameStage10,true)
                createStage(nameStage11)
            end
        end

        if v1 == '12' then
            if v2 == '0' then
                removeStage(nameStage11,true)
                createStage(nameStage12)
            end
        end

        if v1 == '13' then
            if v2 == '0' then
                removeStage(nameStage12,true)
                createStage(nameStage13)
            end
        end

        if v1 == '14' then
            if v2 == '0' then
                removeStage(nameStage13,true)
                createStage(nameStage14)
                
                setProperty('bgBar.angle', 35)
                startTween('bgBarSTupidTweenX', 'bgBar', {x = -1500}, 7, {type = "PINGPONG"})
                startTween('bgBarSTupidTweenY', 'bgBar', {y = -600}, 8, {type = "PINGPONG"})
                startTween('bgBarSTupidTweenAngle', 'bgBar', {angle = -35}, 9, {type = "PINGPONG"})
            end
        end

        if v1 == '15' then
            if v2 == '0' then
                setProperty('nesStatic.alpha',0.8)
                doTweenAlpha('staticAlpha','nesStatic',0,0.5,'linear')

                removeStage(nameStage14,true)
                createStage(nameStage15)
            end

            if v2 == '2' then
                setProperty('jumpscareCuphead.alpha',1)
                setProperty('jumpscareSans.alpha',1)
                setProperty('jumpscareBendy.alpha',1)

                playAnim('jumpscareCuphead','jump',false)
                playAnim('jumpscareSans','jump',false)
                playAnim('jumpscareBendy','jump',false)
                trhowAnimation3 = true;
                trhowAnimation4 = true;
                trhowAnimation5 = true;
            end
        end

        if v1 == '16' then
            if v2 == '0' then
                cameraFlash('camGame','FF0000',0.5)
                removeStage(nameStage15,true)
                createStage(nameStage16)
                createDialogue()
            end
        end

        if v1 == '17' then
            if v2 == '0' then
                callScript('extra_scripts/loadingStage','startLoading')
                preloadImages(nameStage17)
                preloadImages(nameStage18)
                preloadImages(nameStage19)
                preloadImages(nameStage22)
                preloadImages(nameStage23)
                
                removeStage(nameStage16,true)
                createStage(nameStage17)
                disableChat = true;
                createDialogue()

                doTweenAlpha('fadeOutcamGame','camGame',1,2,'linear')

                setProperty('camHUD.y',0)
                setProperty('camHUD.angle',0)
            end
        end

        if v1 == '18' then
            if v2 == '0' then
                removeStage(nameStage17,true)
                createStage(nameStage18)
            end
        end

        if v1 == '19' then
            if v2 == '0' then
                removeStage(nameStage18,true)
                createStage(nameStage19)
            end
        end

        if v1 == '20' then
            if v2 == '0' then
                removeStage(nameStage19,true)
                createStage(nameStage20)
            end
        end

        if v1 == '21' then
            if v2 == '0' then
                removeStage(nameStage20,true)
                createStage(nameStage21)
            end
        end

        if v1 == '22' then
            if v2 == '0' then
                removeStage(nameStage21,true)
                createStage(nameStage22)               
            end
        end

        if v1 == '23' then
            if v2 == '0' then
                removeStage(nameStage22,true)
                createStage(nameStage23)               
            end
        end

        if v1 == '24' then
            if v2 == '0' then
                removeStage(nameStage23,true)
                createStage(nameStage24)               
            end
        end

        if v1 == '25' then
            if v2 == '0' then
                removeStage(nameStage24,true)
                createStage(nameStage25)               
            end
        end

        if v1 == '26' then
            if v2 == '0' then
                removeStage(nameStage25,true)
                createStage(nameStage26)               
            end
        end

        if v1 == '27' then
            if v2 == '0' then
                callScript('extra_scripts/loadingStage','startLoading')
                preloadImages(nameStage27)
                preloadImages(nameStage28)
                preloadImages(nameStage29)
                preloadImages(nameStage30)
                preloadImages(nameStage31)

                removeStage(nameStage26,true)
                createStage(nameStage27)
            end

            if v2 == '7' then
                doTweenAlpha('disableCamGame','camGame',0,0.1,'linear')
                doTweenAlpha('enableCamHUD','camHUD',1,0.1,'linear')
                playAnim('scrimboLaugh','laugh',false)
                setProperty('scrimboLaugh.alpha',1)

                setProperty('iconP1.alpha',0.001)
                trhowAnimation6 = true;
            end
        end

        if v1 == '28' then
            if v2 == '0' then
                removeStage(nameStage27,true)
                createStage(nameStage28)

                setSpriteShader('mirrors', 'scroll')
                setShaderFloat('mirrors', 'xSpeed', 4);

                enableShaderScroll = true;
            end
        end

        if v1 == '29' then
            if v2 == '0' then
                removeStage(nameStage28,true)
                createStage(nameStage29)
            end
        end

        if v1 == '30' then
            if v2 == '0' then
                removeStage(nameStage29,true)
                createStage(nameStage30)
            end
        end

        if v1 == '31' then
            if v2 == '0' then
                removeStage(nameStage30,true)
                createStage(nameStage31)
            end
        end
    end
end

function createDialogue()

    if not disableChat then

        local personRandom = getRandomInt(1,#names)
        local foundedPerson =false
        
        local colors = {
            'FF0000',
            '0FF0FF',
            '00FFFF',
            '0000FF',
            'FF00FF',
            'F0FF0F',
            'FFFF00',
            'FF7000',
            'FF006E'
        }
        local colorRandom = getRandomInt(1,#colors)
        local chatDialogue = dialogues[getRandomInt(1,#dialogues)]
        repeat
            foundedPerson = false
            for i, persons in pairs(personsAppears) do
                if personRandom == persons then
                    personRandom = getRandomInt(1,#names)
                    foundedPerson = true
                    break
                end
            end
        until foundedPerson == false
    
    
        local person = 'dialoguePerson'..dialogueCount
        local chat = 'dialogueChat'..dialogueCount
        local personChat = names[personRandom]..": "
        local barWidth = 620
        
        local personDialogue = ''
        local newLines = 0
        local foundedNewLine = false
    
        makeLuaText(chat,personChat..chatDialogue,barWidth,520,550)
        setTextSize(chat,24)
        setTextFont(chat,'pixel.otf')
        setTextBorder(chat,1,'000000')
        setTextAlignment(chat,'left')
    
        local offset = 36 * getProperty(chat..'.textField.numLines')
        setProperty(chat..'.y',getProperty(chat..'.y')-offset)
    
        makeLuaText(person,personChat,barWidth,520,getProperty(chat..'.y'))
        setProperty(person..'.color',getColorFromHex(colors[colorRandom]))
        setScrollFactor(person,1,1)
        setTextAlignment(person,'left')
        setTextFont(person,'pixel.otf')
        setTextBorder(person,1,'000000')
        setTextSize(person,24)
    
        table.insert(personsAppears,personRandom)
    
        if dialogueCount > 0 then
            for d = minDialogePos,dialogueCount-1 do
                local di = 'dialoguePerson'..d
                local ch = 'dialogueChat'..d
                if luaTextExists(di) then
                    setProperty(di..'.y', getProperty(di..'.y') - offset)
                    setProperty(ch..'.y',getProperty(di..'.y'))
                    if getProperty(di..'.y') < 50 then
                        removeLuaText(di,true)
                        removeLuaText(ch,true)
                        minDialogePos = minDialogePos + 1
                        for i = 1,#personsAppears do
                            if i ~= nil then
                                table.remove(personsAppears,1)
                                break
                            end
                        end
                    end
                
                end
                if luaSpriteExists(ch) then
                    if getProperty(ch..'.y') < 50 then
                        removeLuaText(ch,true)
                        minDialogePos = minDialogePos + 1
                    end
                end
            end
        end
    
        runHaxeCode(
            [[
                var dialogue = game.modchartTexts.get("]]..chat..[[");
                var person = game.modchartTexts.get("]]..person..[[");
                dialogue.scrollFactor.set(1,1);
                game.insert(game.members.indexOf(game.getLuaObject('directBGFront'))+1,dialogue);
                dialogue.cameras = [game.camGame];
                
                person.scrollFactor.set(1,1);
                game.insert(game.members.indexOf(game.getLuaObject('directBGFront'))+2,person);
                person.cameras = [game.camGame];
                return; 
            ]]
        )
    
        dialogueCount = dialogueCount + 1
        runTimer('startAnotherDialogue',0.5)
    else
        for a = 1,20 do
        
            for d = minDialogePos,dialogueCount-1 do
                local di = 'dialoguePerson'..d
                local ch = 'dialogueChat'..d
    
                if luaTextExists(di) then
                    removeLuaText(di,true)
                    removeLuaText(ch,true)
                    minDialogePos = minDialogePos + 1
                    for i = 1,#personsAppears do
                        if i ~= nil then
                            table.remove(personsAppears,1)
                            break
                        end
                    end
                end
    
                if luaSpriteExists(ch) then
                    removeLuaText(ch,true)
                    minDialogePos = minDialogePos + 1
                end
            end
            dialogueCount = dialogueCount + 1
        end

        for i = 1,#personsAppears do
            table.remove(personsAppears,i)
            i = i +1;
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'startAnotherDialogue' then
        createDialogue()
    end
end