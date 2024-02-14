local whoismx = '';
local isON = true;

function onCreate()
    if getProperty('dad.curCharacter') == 'mx_demise' then
        whoismx = 'dad';
    else
        whoismx = 'boyfriend';
    end
end

-- fuck you
function onCreatePost()
    setObjectOrder('dad',getObjectOrder('gfGroup') + 2)

    makeAnimatedLuaSprite('mxlegs','characters/MX_Demise_Assets', 0, 0);
    addAnimationByPrefix('mxlegs', 'exist', 'MX Running Legs', 35, true);
	setProperty('mxlegs.x', getProperty(whoismx .. '.x'));
    setProperty('mxlegs.y', getProperty(whoismx .. '.y'));
	setProperty('mxlegs.offset.x', -3);
    setProperty('mxlegs.offset.y', -461);

	makeAnimatedLuaSprite('mxrightarm', 'characters/MX_Demise_Assets', 0, 0);
    addAnimationByPrefix('mxrightarm', 'exist2', 'MX Running Right Arm', 35, true);
    addLuaSprite('mxrightarm', false);
    addLuaSprite('mxlegs', false);
    setObjectOrder('mxlegs',getObjectOrder('gfGroup') + 1)

	setProperty('mxrightarm.x', getProperty(whoismx .. '.x'));
    setProperty('mxrightarm.y', getProperty(whoismx .. '.y'));
	setProperty('mxrightarm.offset.x', 57);
    setProperty('mxrightarm.offset.y', -321);
	
	setProperty(whoismx .. '.origin.x', 833);
	setProperty(whoismx .. '.origin.y', 1003);

end

function onUpdate(elapsed)

    if curStep == 432 then
        doTweenAlpha('fadeMx','dad',0,0.8,'linear')
        doTweenAlpha('fadeMxArms','mxrightarm',0,0.8,'linear')
        doTweenAlpha('fadeMxLegs','mxlegs',0,0.8,'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'fadeMx' then
        removeLuaSprite('mxrightarm',true)
        removeLuaSprite('mxlegs',true)
        fuckoff = false
    end
end

function onUpdatePost()
    if getProperty('dad.alpha') == 0 or isON == false then
        setProperty('mxrightarm.alpha', 0)
        setProperty('mxlegs.visible', false)
    else
        setProperty('mxrightarm.alpha', 1)
        setProperty('mxlegs.visible',     true)
    end

    if isON == true then

    setProperty('mxlegs.x', getProperty(whoismx .. '.x'));
    setProperty('mxlegs.y', getProperty(whoismx .. '.y'));

    setProperty('mxrightarm.x', getProperty(whoismx .. '.x'));
    setProperty('mxrightarm.y', getProperty(whoismx .. '.y'));

	if getProperty(whoismx .. '.animation.curAnim.name') ~= 'idle' then
		setProperty('mxrightarm.visible', false);
        if getProperty('mxlegs.animation.frameIndex') == 0 then
            setProperty(whoismx .. '.angle', 0);
            setProperty(whoismx .. '.x', defaultOpponentX - 930);
            setProperty(whoismx .. '.y', defaultOpponentY - 870);
        end
        if getProperty('mxlegs.animation.frameIndex') == 2 then
            setProperty(whoismx .. '.angle', -2.7);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 13.4);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 72.75);
        end
        if getProperty('mxlegs.animation.frameIndex') == 4 then
            setProperty(whoismx .. '.angle', -3.7);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 18.05);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 94.8);
        end
        if getProperty('mxlegs.animation.frameIndex') == 6 then
            setProperty(whoismx .. '.angle', -2.2);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 10.8);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 26.5);
        end
        if getProperty('mxlegs.animation.frameIndex') == 8 then
            setProperty(whoismx .. '.angle', 0);
            setProperty(whoismx .. '.x', defaultOpponentX - 930);
            setProperty(whoismx .. '.y', defaultOpponentY - 870);
        end
        if getProperty('mxlegs.animation.frameIndex') == 10 then
            setProperty(whoismx .. '.angle', -2.7);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 13.4);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 72.75);
        end
        if getProperty('mxlegs.animation.frameIndex') == 12 then
            setProperty(whoismx .. '.angle', -3.7);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 18.05);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 94.8);
        end
        if getProperty('mxlegs.animation.frameIndex') == 14 then
            setProperty(whoismx .. '.angle', -2.2);
            setProperty(whoismx .. '.x', defaultOpponentX - 930 - 10.8);
            setProperty(whoismx .. '.y', defaultOpponentY - 870 - 26.5);
        end
	else
        setProperty(whoismx .. '.animation.frameIndex', getProperty('mxlegs.animation.frameIndex') + 32)
		setProperty('mxrightarm.visible', true);
        setProperty(whoismx .. '.angle', 0);
        setProperty(whoismx .. '.x', defaultOpponentX - 930);
        setProperty(whoismx .. '.y', defaultOpponentY - 870);
	end

    end
end