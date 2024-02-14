local whoispico = '';

local fuckoff = true;

function onCreate()
    if getProperty('gf.curCharacter') == 'pico_run' then
        whoispico = 'gf';
    else
        whoispico = 'dad';
    end
end

function onCreatePost()

    setProperty('gf.x', 4000)

    makeAnimatedLuaSprite('picolegs','characters/Too_Late_Pico_FINALSEQUENCE_assets', 0, 0);
    addAnimationByPrefix('picolegs', 'exist', 'Legs', 32, true);
    setProperty('picolegs.x', getProperty('gf.x'));
    setProperty('picolegs.y', getProperty('gf.y'));
    setProperty('picolegs.offset.x', 35);
    setProperty('picolegs.offset.y', -275);
    setProperty('picolegs.flipX',true)

    makeAnimatedLuaSprite('picoarm', 'characters/Too_Late_Pico_FINALSEQUENCE_assets', 0, 0);
    addAnimationByPrefix('picoarm', 'singLEFT', 'TopLeftBack', 24, false);
    addAnimationByPrefix('picoarm', 'singUP', 'TopUpBack', 24, false);
    addAnimationByPrefix('picoarm', 'singRIGHT', 'TopRightBack', 24, false);
    
    addLuaSprite('picoarm', false);
    addLuaSprite('picolegs', false);

    setProperty('picoarm.x', getProperty('gf.x'));
    setProperty('picoarm.y', getProperty('gf.y'));
    setProperty('picoarm.flipX',true)

end

function goodNoteHit()
    if getProperty('gf.animation.curAnim.name') ~= 'singDOWN' then
        objectPlayAnimation('picoarm', getProperty('gf.animation.curAnim.name'), true)
    end
end

function onUpdate(elapsed)

    if curStep == 360 then
        doTweenX('picoEnter','gf',400,1,'cubeout')
        runHaxeCode([[game.iconP1.changeIcon('bf-pico')]]);
    end
    
    if curStep == 432 then
        doTweenAlpha('fadePico','gf',0,0.8,'linear')
        doTweenAlpha('fadePicoArms','picoarm',0,0.8,'linear')
        doTweenAlpha('fadePicoLegs','picolegs',0,0.8,'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'fadePico' then
        removeLuaSprite('picoarm',true)
        removeLuaSprite('picolegs',true)
        fuckoff = false
    end
end

function onUpdatePost()
    if fuckoff then
        if getProperty('gf.animation.curAnim.name') ~= 'idle' and getProperty('gf.animation.curAnim.name') ~= 'dialog1' then
            if getProperty('gf.animation.curAnim.name') ~= 'singDOWN' then
                setProperty('picoarm.visible', true);
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    objectPlayAnimation('picoarm','singUP',false)
                    setProperty('picoarm.offset.x', -40);
                    setProperty('picoarm.offset.y', -180);
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    objectPlayAnimation('picoarm','singRIGHT',false)
                    setProperty('picoarm.offset.x', -120);
                    setProperty('picoarm.offset.y', -200);
                end
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    objectPlayAnimation('picoarm','singLEFT',false)
                    setProperty('picoarm.offset.x', -40);
                    setProperty('picoarm.offset.y', -190);
                end
            else
                setProperty('picoarm.visible', false);
            end

            if getProperty('picolegs.animation.frameIndex') == 0 then
                setProperty('gf.y', defaultGirlfriendY + 200);
                setProperty('gf.angle', -0.4)
                setProperty('picoarm.y', getProperty('gf.y'));
                setProperty('picoarm.angle', -0.4)
            end
            if getProperty('picolegs.animation.frameIndex') == 2 then
                setProperty('gf.y', defaultGirlfriendY + 200 + -3.75);
                setProperty('gf.angle', 0.8)
                setProperty('picoarm.y', getProperty('gf.y') + -3.75);
                setProperty('picoarm.angle', 0.8)
            end
            if getProperty('picolegs.animation.frameIndex') == 4 then
                setProperty('gf.y', defaultGirlfriendY + 200 + 2.4);
                setProperty('gf.angle', 1.8)
                setProperty('picoarm.y', getProperty('gf.y') + 2.4);
                setProperty('picoarm.angle', 1.8)
            end
            if getProperty('picolegs.animation.frameIndex') == 6 then
                setProperty('gf.y', defaultGirlfriendY + 200 + 6);
                setProperty('gf.angle', 0.3)
                setProperty('picoarm.y', getProperty('gf.y') + 6);
                setProperty('picoarm.angle', 0.3)
            end
            if getProperty('picolegs.animation.frameIndex') == 8 then
                setProperty('gf.y', defaultGirlfriendY + 200 + 1.1);
                setProperty('gf.angle', -0.7)
                setProperty('picoarm.y', getProperty('gf.y') + 1.1);
                setProperty('picoarm.angle', -0.7)
            end
            if getProperty('picolegs.animation.frameIndex') == 10 then
                setProperty('gf.y', defaultGirlfriendY + 200 + -6.4);
                setProperty('gf.angle', 1.2)
                setProperty('picoarm.y', getProperty('gf.y') + -6.4);
                setProperty('picoarm.angle', 1.2)
            end
            if getProperty('picolegs.animation.frameIndex') == 12 then
                setProperty('gf.y', defaultGirlfriendY + 200 + -4.4);
                setProperty('gf.angle', 2.2)
                setProperty('picoarm.y', getProperty('gf.y') + -4.4);
                setProperty('picoarm.angle', 2.2)
            end
            if getProperty('picolegs.animation.frameIndex') == 14 then
                setProperty('gf.y', defaultGirlfriendY + 200 + 2.15);
                setProperty('gf.angle', 1.5)
                setProperty('picoarm.y', getProperty('gf.y') + 2.15);
                setProperty('picoarm.angle', 1.5)
            end
        else
            if getProperty('gf.animation.curAnim.name') ~= 'dialog1' then
                setProperty('gf.animation.frameIndex', getProperty('picolegs.animation.frameIndex') + 89)
            end
            setProperty('picoarm.visible', false);
            setProperty('gf.angle', 0);
            setProperty('gf.y', defaultGirlfriendY + 200);
            
        end
        setProperty('picolegs.x', getProperty('gf.x'));
        setProperty('picolegs.y', getProperty('gf.y'));
        setProperty('picoarm.x', getProperty('gf.x'));
        setProperty('picoarm.y', getProperty('gf.y'));
    end
end