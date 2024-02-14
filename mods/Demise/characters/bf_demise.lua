local whoisbf = '';
local isON = true;

function onCreate()
    if getProperty('boyfriend.curCharacter') == 'bf_demise' then
        whoisbf = 'boyfriend';
    else
        whoisbf = 'dad';
    end
end

function onCreatePost()
    makeAnimatedLuaSprite('bflegs','characters/Demise_BF_Assets', 0, 0);
    addAnimationByPrefix('bflegs', 'exist', 'Bottom', 40, true);
	setProperty('bflegs.x', getProperty(whoisbf .. '.x'));
    setProperty('bflegs.y', getProperty(whoisbf .. '.y'));
	setProperty('bflegs.offset.x', 33);
    setProperty('bflegs.offset.y', -230);

	makeAnimatedLuaSprite('bfrightarm', 'characters/Demise_BF_Assets', 0, 0);
    addAnimationByPrefix('bfrightarm', 'exist2', 'BF Right Arm', 40, true);
    addLuaSprite('bfrightarm', false);
    addLuaSprite('bflegs', false);

	setProperty('bfrightarm.x', getProperty(whoisbf .. '.x'));
    setProperty('bfrightarm.y', getProperty(whoisbf .. '.y'));
	setProperty('bfrightarm.offset.x', -13);
    setProperty('bfrightarm.offset.y', -155);
end

function onUpdate(elapsed)

    if curStep == 440 then
        removeLuaSprite('bflegs',true)
        removeLuaSprite('bfrightarm',true)
    end
end

function onUpdatePost()

    if getProperty('boyfriend.alpha') == 0 or isON == false then
        setProperty('bfrightarm.alpha', 0)
        setProperty('bflegs.visible', false)
    else
        setProperty('bfrightarm.alpha', 1)
        setProperty('bflegs.visible',     true)
    end

    if isON == true then

    setProperty('bflegs.x', getProperty(whoisbf .. '.x'));
    setProperty('bflegs.y', getProperty(whoisbf .. '.y'));

    setProperty('bfrightarm.x', getProperty(whoisbf .. '.x'));
    setProperty('bfrightarm.y', getProperty(whoisbf .. '.y'));

	if getProperty(whoisbf .. '.animation.curAnim.name') ~= 'idle' then
		setProperty('bfrightarm.visible', false);
        if getProperty('bflegs.animation.frameIndex') == 31 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270);
        end
        if getProperty('bflegs.animation.frameIndex') == 33 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (7.35 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 35 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (14.7 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 37 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (2.25 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 39 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (5.05 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 41 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (9.2 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 43 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (12.6 / 2));
        end
        if getProperty('bflegs.animation.frameIndex') == 45 then
            setProperty(whoisbf .. '.y', defaultBoyfriendY + 270 + (3.15 / 2));
        end
	else
        setProperty(whoisbf .. '.animation.frameIndex', getProperty('bflegs.animation.frameIndex') - 16)
		setProperty('bfrightarm.visible', true);
        setProperty(whoisbf .. '.angle', 0);
        setProperty(whoisbf .. '.y', defaultBoyfriendY + 230);
	end
    end

end