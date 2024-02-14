local ended = false

function onCreate()
    precacheImage('attacks/NMcupheadAttacks')

    Dodge = 0;
    BigShotSpeedX = 0;
    BigShotMove = false;
    bf_visibleCuphead = 0
    bf_characterFound = false
    BigShotYOffset = 0
    LifeDownCupTimer = 0
    CupheadHurtAnimation = false
    InstaKillPeaBigShot = false
    
    makeAnimatedLuaSprite('BigShotCuphead', 'attacks/NMcupheadAttacks',getProperty('dad.x') -200 ,getProperty('dad.y') + 220);
    addAnimationByPrefix('BigShotCuphead','Hadolen','DeathBlast instance 1',24,true);
    objectPlayAnimation('BigShotCuphead','Hadolen',true)
    scaleObject('BigShotCuphead',1.2,1.2)
    BigShotYOffset = 100


    setBlendMode('BigShotCuphead','add')
end

function onEvent(name,value1,value2)

    if name == "CupheadAttack" then
        BigShotY = getProperty('dad.y') + BigShotYOffset
        if value2 ~= '' then
            InstaKillPeaBigShot = true
        else
            InstaKillPeaBigShot = false
        end
    Dodge = 2

    runTimer('CupheadAttack',0.6)
    runTimer('AttackAnimation',0.3)
    playSound('CupPre_shoot')
    end
end

function onUpdate()

    if BigShotMove == true then
     setProperty('BigShotCuphead.x',getProperty('BigShotCuphead.x') + 25)
    end

    if getProperty('BigShotCuphead.animation.curAnim.finished') == true and getProperty('BigShotCuphead.animation.curAnim.name') == 'Burst' then
        removeLuaSprite('BigShotCuphead',false)
    end

    if getProperty('BigShotCuphead.x') > 250 and not ended then
        removeLuaSprite('BigShotCuphead',false)
        cameraFlash('other', 'E8A2AD', 0.6)
        ended = true
    end

end

function onTimerCompleted(tag)


    if tag == 'AttackAnimation' then
        characterPlayAnim('dad', 'shootballs', false);
        setProperty('dad.specialAnim', true);
    end


    if tag == 'CupheadAttack' then

     setProperty('BigShotCuphead.x',getProperty('dad.x') + 170 ,getProperty('dad.y') - 50)
     BigShotSpeedX = 0
     BigShotMove = true;
     removeLuaSprite('BigShotCuphead', false)
     addLuaSprite('BigShotCuphead',true)
     setProperty('BigShotCuphead.y',BigShotY)
     objectPlayAnimation('BigShotCuphead','Hadolen',true)
     playSound('CupShoot')
    end
end