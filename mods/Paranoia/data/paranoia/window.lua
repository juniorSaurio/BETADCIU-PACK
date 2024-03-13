local startWindowX = 0
local startWindowY = 0

local windowWidth = 0
local windowHeight = 0

local maxWidth = 0
local maxHeight = 0
function onCreate()

    --The game will just detect the full screen resolution when start it, restart or exit the song will not reload it.
    maxWidth = getPropertyFromClass('openfl.Lib','application.window.stage.fullScreenWidth')
    maxHeight = getPropertyFromClass('openfl.Lib','application.window.stage.fullScreenHeight')
    windowWidth = maxWidth/1.5
    windowHeight = maxHeight/1.5

    startWindowX = maxWidth - windowWidth
    startWindowY = maxHeight - windowHeight
    
    makeLuaSprite('windowPosition',nil,startWindowX,startWindowY)

    setWindowProperty('width',maxWidth/1.5)
    setWindowProperty('height',maxHeight/1.5)
    setWindowProperty('resizable',false)
end

function getWindowPosition(position)
    if position == 'x' then
        return getWindowProperty('x')*((maxWidth/windowWidth)*1.34)
    elseif position == 'y' then
        return getWindowProperty('y')*((maxHeight/windowHeight)*1.34)
    end
end

function setWindowProperty(property,value)
    setPropertyFromClass('openfl.Lib','application.window.'..property,value)
end

function getWindowProperty(property)
    return getPropertyFromClass('openfl.Lib','application.window.'..property)
end

function onDestroy()
    setWindowProperty('x',startWindowX/2)
    setWindowProperty('y',startWindowY/2)
    setWindowProperty('resizable',true)
    setWindowProperty('width',screenWidth)
    setWindowProperty('height',screenHeight)

end

function onUpdate(el)
    local songPos = getSongPosition()
    if songPos < 135770 then
        local windowPosX = math.floor(getProperty('windowPosition.x')/((maxWidth/windowWidth)*1.34))
        local windowPosY = math.floor(getProperty('windowPosition.y')/((maxHeight/windowHeight)*1.34))
        local windowScaleX = math.floor(maxWidth/ (1.5 - (1 - getProperty('windowPosition.scale.x'))))
        local windowScaleY = math.floor(maxHeight/ (1.5 - (1 - getProperty('windowPosition.scale.y'))))

        if getWindowProperty('width') ~= windowScaleX then
            windowWidth = windowScaleX
            setWindowProperty('width',windowScaleX)
        end

        if getWindowProperty('height')  ~= windowScaleY then
            windowHeight = windowScaleY
            setWindowProperty('height',windowHeight)
        end

        if windowPosX ~= nil and windowPosX ~= getWindowProperty('x') then
            setWindowProperty('x',windowPosX)
        end

        if windowPosY ~= nil and windowPosY ~= getWindowProperty('y') then
            setWindowProperty('y',windowPosY)
        end

        if songPos > 34790 and songPos < 39680 or songPos > 41420 and songPos < 46330 then
            local cal = (songPos-34790)/bpm
            setProperty('windowPosition.x',startWindowX + ((startWindowX-30) * math.cos(cal/10))*-1)
            setProperty('windowPosition.y',startWindowY + ((startWindowY-30) * math.cos(cal/5))*-1)

        elseif songPos >= 46750 and songPos < 97600 then
            setProperty('windowPosition.y',startWindowY + (60 * math.sin((songPos-46750)/bpm/13))*-1)
            if songPos >= 59600 then
                setProperty('windowPosition.x',startWindowX + (60 * math.sin((songPos-59600)/bpm/10))*-1)
            end
        end
    end
end
function onStepHit()
    if curStep/4 == 83.5 then
        doTweenX('windowPositionX','windowPosition',10,stepCrochet*0.002,'backIn')
        doTweenY('windowPositionY','windowPosition',10,stepCrochet*0.002,'backIn')
    end
end
function onBeatHit()
    if curBeat >= 80 and curBeat <= 83 then
        setProperty('windowPosition.x',startWindowX + getRandomInt(100,200))
        setProperty('windowPosition.y',startWindowY + getRandomInt(-200,200))
    elseif curBeat >= 96 and curBeat  < 100 and curBeat % 2 == 0 then
        setProperty('windowPosition.x',getProperty('windowPosition.x') + getRandomInt(-100,-50))
        setProperty('windowPosition.y',getProperty('windowPosition.y') + getRandomInt(50,100))
    end

    if curBeat == 112 or curBeat == 236 then
        doTweenX('windowPositionX','windowPosition',startWindowX,stepCrochet*0.004,'circOut')
        doTweenY('windowPositionY','windowPosition',startWindowY,stepCrochet*0.004,'circOut')

    elseif curBeat == 252 then
        doTweenX('windowPositionX','windowPosition',0,1.5,'cubeIn')
        doTweenY('windowPositionY','windowPosition',0,1.5,'cubeIn')
        doTweenX('windowScaleX','windowPosition.scale',0.5001,1.5,'cubeIn')-- not 0.5 because the game will turn on fullscreen automaticly.
        doTweenY('windowScaleY','windowPosition.scale',0.5001,1.5,'cubeIn')

        
    elseif curBeat == 324 then
        doTweenX('windowScaleX','windowPosition.scale',1,1,'cubeOut')
        doTweenY('windowScaleY','windowPosition.scale',1,1,'cubeOut')
        doTweenX('windowPositionX','windowPosition',startWindowX,1,'cubeOut')
        doTweenY('windowPositionY','windowPosition',startWindowY,1,'cubeOut')
    end
end