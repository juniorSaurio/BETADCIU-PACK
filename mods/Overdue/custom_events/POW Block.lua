local enableChaos = false;
local onlyOneExecuted = true;

function onEvent(n,v1,v2)
    if n == "POW Block" then
        doTweenY('POW1', 'POW', 200, crochet/2000, 'cubeOut')
        playSound('POW1', 2)
        angle = angleAmount
    end
end

function onCreate()

    gravity = 1
    dodgeWindow = 0.1

    makeLuaSprite('POW', 'SS_POWblock', 150, 800)
    if not middlescroll then
        screenCenter('POW', 'x')
    end
    setObjectCamera('POW', 'hud')
    addLuaSprite('POW', true)

end

angle = 0
angleAmount = 40

canJump = true
jumping = false
falling = false
gravity = 1

dodged = false
POWdrain = 0
POWdamage = 0

function onUpdatePost()
        if angle > 0 then
            angle = angle - (1 * (240 / getPropertyFromClass('backend.ClientPrefs','data.framerate')))
        end

        setProperty('POW.angle', getRandomFloat(-angle, angle))

        if enableChaos and onlyOneExecuted then
            
            setProperty('car.angle',40)
            setProperty('car.y',getProperty('car.y') - 850)
            setProperty('car.x',getProperty('car.x') + 600)
            doTweenY('carUp','car',getProperty('car.y') - 200,0.4,'cubeOut')

            setProperty('Road.angle',10)
            setProperty('Road.y',getProperty('Road.y') - 50)
            doTweenY('RoadUp','Road',getProperty('Road.y') - 200,0.4,'cubeOut')

            setProperty('boyfriend.angle',-10)
            setProperty('boyfriend.y',getProperty('boyfriend.y') - 50)
            doTweenY('boyfriendUp','boyfriend',getProperty('boyfriend.y') - 200,0.4,'cubeOut')

            setProperty('gf.angle',-10)
            setProperty('gf.y',getProperty('gf.y') - 50)
            doTweenY('gfUp','gf',getProperty('gf.y') - 200,0.4,'cubeOut')

            doTweenAlpha('disableBg1','BackTrees',0,0.4,'linear')
            doTweenAlpha('disableBg2','Front Trees',0,0.4,'linear')
            doTweenAlpha('disableBg3','Foreground Trees',0,0.4,'linear')

            onlyOneExecuted = false;

            triggerEvent('Change Character','dad','sunshineExe')
            setProperty('dad.alpha',0)
            doTweenAlpha('enableSunshine','dad',1,1,'linear')

            setProperty('iconP1.visible',false)
            setProperty('iconP2.visible',false)
            setProperty('healthBar.visible',false)
            setProperty('Health.visible',false)
        end
end

function onTweenCompleted(tag)
    if tag == 'POW1' then
        doTweenY('POW2', 'POW', 300, crochet/2000, 'cubeInOut')

        objectPlayAnimation('mx', 'singLEFT', true);
        setProperty('mx.offset.x', 115);
        setProperty('mx.offset.y', 454);


        doTweenY('jumpMx', 'mx', getProperty('mx.y')-500, 0.8, 'cubeInOut')

    elseif tag == 'POW2' then
        doTweenY('POW3', 'POW', 100, crochet/2000, 'cubeInOut')
        playSound('POW1', 1)
        angle = angleAmount
    elseif tag == 'POW3' then
        doTweenY('POW4', 'POW', 800, crochet/2000, 'cubeIn')
    elseif tag == 'POW4' then

        enableChaos = true;
        playSound('POW3', 1)
    end

    if tag == 'carUp' then
        doTweenY('carFall','car',500,1,'cubeInOut')
        doTweenY('RoadFall','Road',500,1,'cubeInOut')
        doTweenY('BFFall','boyfriend',2500,1,'cubeInOut')
        doTweenY('GFFall','gf',2500,1,'cubeInOut')

        cancelTween('jumpMx')
        doTweenY('fallMx', 'mx', 1500, 1, 'cubeInOut')
    end

end