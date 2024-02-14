local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
        runTimer('start',0)
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'start' then
        startVideo('ihy_cutscene')
        setProperty('inCutscene', false);
        runTimer('playVideo',17)
    end

    if tag == 'playVideo' then
        runTimer('startText', 0);
        allowCountdown = true;
        startCountdown();
    end

    if tag == 'startText' then
        makeLuaSprite('black', 'black', 0, 0);
        setObjectCamera('black', 'hud');
        addLuaSprite('black', true);
        makeLuaSprite('BF_Start', 'effects/BF_Start', 500, 350);
        scaleObject('BF_Start',4,4)
        setObjectCamera('BF_Start', 'hud');
        addLuaSprite('BF_Start', true);
        runTimer('fadein', 1, 1);
        runTimer('fadeout', 1.8, 1);
    elseif tag == 'appear' then
        doTweenAlpha('textfade', 'BF_Start', 0, 0.5, 'linear');
    elseif tag == 'fadeout' then
        doTweenAlpha('textfade', 'BF_Start', 0, 0.5, 'linear');
        doTweenAlpha('blackfade', 'black', 0, 0.5, 'linear');
    end
end