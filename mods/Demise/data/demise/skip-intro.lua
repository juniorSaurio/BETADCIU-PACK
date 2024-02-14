local allowCountdown = false

function onCreate()
    setProperty('skipCountdown', true)
end

function onStartCountdown()
    if not allowCountdown then
        runTimer('start',0.8)
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'start' then
        allowCountdown = true;
        startCountdown();
    end
end