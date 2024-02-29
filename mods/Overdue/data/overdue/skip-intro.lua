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
        startVideo('overdue_cutscn')
        setProperty('inCutscene', false);
        runTimer('playVideo',34)
    end

    if tag == 'playVideo' then
        allowCountdown = true;
        startCountdown();
    end
end