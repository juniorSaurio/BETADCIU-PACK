sprite = 'BG-Prey'
size = 4608
startX = -1400
startY = -1300
duration = 5

function onCreate()
    makeLuaSprite(sprite .. '1', 'backgrounds/Stardust/stardustBg', startX, startY)
        addLuaSprite(sprite .. '1', false)
    makeLuaSprite(sprite .. '2', 'backgrounds/Stardust/stardustBg', startX + size, startY)
        addLuaSprite(sprite .. '2', false)

    setProperty(sprite .. '1.visible',false)
    setProperty(sprite .. '2.visible',false)
end

function scrollA()
    doTweenX(sprite .. '1move',sprite .. '1', startX - size, duration)
    doTweenX(sprite .. '2move',sprite .. '2', startX, duration)
end


function onTweenCompleted(tag)

    if tag == (sprite .. '2move') then
        scrollB()
    end

    if tag == (sprite .. '2move2') then
        scrollA()
    end
    
end

function scrollB()
    doTweenX(sprite .. '1move2',sprite .. '1', startX, 0.001)
    doTweenX(sprite .. '2move2',sprite .. '2', startX + size, 0.001)
end


function onUpdate(elapsed)

    if curStep == 2176 then
        setProperty(sprite .. '1.visible',true)
        setProperty(sprite .. '2.visible',true)
        scrollA()
    end

    if curStep == 2431 then

        cancelTween(sprite .. '1move')
		cancelTween(sprite .. '2move')
		cancelTween(sprite .. '1move2')
		cancelTween(sprite .. '2move2')

        removeLuaSprite('BG-Prey1', true)
        removeLuaSprite('BG-Prey2', true)
    end
end