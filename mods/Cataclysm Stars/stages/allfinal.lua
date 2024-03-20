local nameStage1 = 'principal'
local nameStage2 = 'god_gorefield'
local nameStage3 = 'god_gorefield_lassagna'
local nameStage4 = 'god_sansfield'
local nameStage5 = 'cryfield_p1'
local nameStage6 = 'godfield_final_1'

function onCreate()

    makeLuaSprite('BG_GOD','backgrounds/act1/BG_GOD',-1250,-940)
    scaleObject('BG_GOD',0.75,0.75)
    addLuaSprite('BG_GOD',false)

    makeLuaSprite('ANGEL_BG','backgrounds/act1/ANGEL_BG',-748,-1939)
    addLuaSprite('ANGEL_BG',false)

    makeAnimatedLuaSprite('ALO1','backgrounds/act1/ALO',-1250,-500)
    addAnimationByPrefix('ALO1','aro','aro',24,true)
    setProperty('ALO1.flipX',true)
    scaleObject('ALO1',0.7,0.7)
    addLuaSprite('ALO1',false)

    makeAnimatedLuaSprite('ALO2','backgrounds/act1/ALO',1150,-500)
    addAnimationByPrefix('ALO2','aro','aro',24,true)
    scaleObject('ALO2',0.7,0.7)
    addLuaSprite('ALO2',false)

    makeLuaSprite('vignette','backgrounds/black_vignette',0,0)
    setObjectCamera('vignette','camHUD')
    screenCenter('vignette','xy')
    setProperty('vignette.alpha',0.5)
    addLuaSprite('vignette',false)

    makeAnimatedLuaSprite('BONES_GOD','backgrounds/act2/BONES_GOD',-420,-990)
    addAnimationByPrefix('BONES_GOD','bones','bones',24,true)
    setProperty('BONES_GOD.alpha',0.001)
    addLuaSprite('BONES_GOD',false)

    makeAnimatedLuaSprite('viento','backgrounds/act4/viento',-700,-1400)
    addAnimationByPrefix('viento','idle','vientitoo',24,true)
    setProperty('viento.alpha',0.001)
    scaleObject('viento',3,3)
    addLuaSprite('viento',false)

    makeAnimatedLuaSprite('RAYO_DIVISOR','backgrounds/act4/RAYO_DIVISOR',-1350,-140)
    addAnimationByPrefix('RAYO_DIVISOR','idle','rayo divisorio',24,true)
    setProperty('RAYO_DIVISOR.alpha',0.001)
    scaleObject('RAYO_DIVISOR',2.5,2.5)
    addLuaSprite('RAYO_DIVISOR',true)

    makeAnimatedLuaSprite('NERMALL_CRUCIFICCION','characters/NERMALL_CRUCIFICCION',34,-350)
    addAnimationByPrefix('NERMALL_CRUCIFICCION','anim','NERMALL CRUCIFICCION0',24,false)
    setProperty('NERMALL_CRUCIFICCION.alpha',0.001)
    addLuaSprite('NERMALL_CRUCIFICCION',true)

    makeAnimatedLuaSprite('NERMALL_END','characters/NERMALL_END',34,-350)
    addAnimationByPrefix('NERMALL_END','anim','NERMALL END0',24,false)
    setProperty('NERMALL_END.alpha',0.001)
    addLuaSprite('NERMALL_END',true)

    preloadImages(nameStage2)
    preloadImages(nameStage3)
    preloadImages(nameStage4)
    preloadImages(nameStage5)
end

function preloadImages(stage)
    if stage == nameStage2 then
        precacheImage('backgrounds/act2/BG_GOD_GOREFIELD')
        precacheImage('backgrounds/act2/tv_GOD')
    end

    if stage == nameStage3 then
        precacheImage('backgrounds/act2/BG_LASAGNA_GOD')
    end

    if stage == nameStage4 then
        precacheImage('backgrounds/act2/marco_UNDERTALE_GOD')
    end

    if stage == nameStage5 then
        precacheImage('backgrounds/act3/BG_C')
    end
end

function createStage(stage)
    if stage == nameStage2 then
        makeLuaSprite('BG_GOD_GOREFIELD','backgrounds/act2/BG_GOD_GOREFIELD',-250,-700)
        addLuaSprite('BG_GOD_GOREFIELD',false)

        makeLuaSprite('tv_GOD','backgrounds/act2/tv_GOD',-250,-300)
        addLuaSprite('tv_GOD',true)
    end

    if stage == nameStage3 then
        makeLuaSprite('BG_LASAGNA_GOD','backgrounds/act2/BG_LASAGNA_GOD',-800,-700)
        addLuaSprite('BG_LASAGNA_GOD',false)
    end

    if stage == nameStage4 then
        setProperty('BONES_GOD.alpha',1)

        makeLuaSprite('marco_UNDERTALE_GOD','backgrounds/act2/marco_UNDERTALE_GOD',-420,-60)
        addLuaSprite('marco_UNDERTALE_GOD',true)
    end

    if stage == nameStage5 then
        
        makeLuaSprite('BG_C','backgrounds/act3/BG_C',-950,-500)
        addLuaSprite('BG_C',false)
    end

    if stage == nameStage6 then

        setProperty('viento.alpha',1)
        setProperty('RAYO_DIVISOR.alpha',1)
        setProperty('vignette.alpha',0.5)

        makeLuaSprite('redbg', '', 0, 0)
        setScrollFactor('redbg', 0, 0)
        makeGraphic('redbg', 3840, 2160, 'FF0000')
        addLuaSprite('redbg', false)
        setProperty('redbg.alpha', 0.001)
        screenCenter('redbg', 'xy')
    end

end

function removeStage(stage,destroy)
    if stage == nameStage1 then
        removeLuaSprite('BG_GOD',destroy)
        removeLuaSprite('ANGEL_BG',destroy)
        removeLuaSprite('ALO1',destroy)
        removeLuaSprite('ALO2',destroy)
    end

    if stage == nameStage2 then
        removeLuaSprite('BG_GOD_GOREFIELD',destroy)
        removeLuaSprite('tv_GOD',destroy)
    end

    if stage == nameStage3 then
        removeLuaSprite('BG_LASAGNA_GOD',destroy)
    end

    if stage == nameStage4 then
        removeLuaSprite('BONES_GOD',destroy)
        removeLuaSprite('marco_UNDERTALE_GOD',destroy)
    end

    if stage == nameStage5 then
        removeLuaSprite('BG_C',destroy)
    end

    if stage == nameStage6 then
        removeLuaSprite('RAYO_DIVISOR',destroy)
        removeLuaSprite('viento',destroy)
        removeLuaSprite('NERMALL_CRUCIFICCION',destroy)
    end

    callScript('scripts/optimization','optimizeStage',{stage})
end


function onDestroy()
    runHaxeCode(
        [[
            FlxG.camera.bgColor = 0xFF000000;
            return;
        ]]
    )
end

function onUpdate(el)

end

function onBeatHit()

end

function onEvent(name,v1,v2)
    if name == 'Triggers All Stars' then

        if v1 == '2' then

            if v2 == '0' then
                removeStage(nameStage1)
                createStage(nameStage2)
            end

            if v2 == '3' then
                removeStage(nameStage2,true)
                createStage(nameStage3)
            end

            if v2 == '4' then
                removeStage(nameStage3,true)
                createStage(nameStage4)
            end
        end

        if v1 == '3' then
            if v2 == '0' then
                removeStage(nameStage4,true)
                createStage(nameStage5)
                setProperty('vignette.alpha',0.75)
            end
        end

        if v1 == '4' then
            if v2 == '0' then
                removeStage(nameStage5,true)
                createStage(nameStage6)
            end
            
            if v2 == '7' then
                removeStage(nameStage6,true)
            end
        end
    end
end