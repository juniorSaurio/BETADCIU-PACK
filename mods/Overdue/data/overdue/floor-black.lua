sprite = 'Floor-Black'
size = 5700
startX = -900
startY = 700
duration = 1

function onCreate()

    makeLuaSprite(sprite .. '2', 'backgrounds/black/fgPlatform', startX + size, startY)
        addLuaSprite(sprite .. '2', false)
    makeLuaSprite(sprite .. '1', 'backgrounds/black/fgPlatform', startX, startY)
        addLuaSprite(sprite .. '1', false)

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

    if curStep == 2432 then  --2432
        setProperty(sprite .. '1.visible',true)
        setProperty(sprite .. '2.visible',true)

        setObjectOrder(sprite .. '1', getObjectOrder('BgBlack') + 1)
        setObjectOrder(sprite .. '2', getObjectOrder('BgBlack') + 2)
        scrollA()
    end
end