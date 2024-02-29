local enableLoading = true
function startLoading(time)
    if not enableLoading then
        return
    end
    
    if time == nil then
        time = 0.07
    end
    runTimer('LoadedStage',time)
    runHaxeCode(
        [[
            game.generatedMusic = false;
            game.vocals.pause();
            FlxG.sound.music.pause();
            return;
        ]]
    )
end
function onStepHit()
    if enableLoading and (curStep == 910 or curStep == 2495) then
        addLoadingText()
    end
end
function addLoadingText()
    makeLuaText('loadingTxt','Loading characters, please wait...',screenWidth,0,0)
    setTextFont('loadingTxt','arial-rounded-mt-bold.ttf')
    setTextSize('loadingTxt',100)
    screenCenter('loadingTxt')
    setProperty('loadingTxt.alpha',0.5)
    setObjectCamera('loadingTxt','other')
    doTweenAlpha('loadingTxtAlpha','loadingTxt',0,0.5,'expoIn')
    addLuaText('loadingTxt',true)
end
function onTweenCompleted(tag)
    if tag == 'loadingTxtAlpha' then
        removeLuaText('loadingTxt',true)
    end
end
function onTimerCompleted(tag)
    if tag == 'LoadedStage' then
        runHaxeCode(
            [[
                FlxG.sound.music.play();
                game.vocals.play();
                game.generatedMusic = true;
                return;
            ]]
        )
    end
end