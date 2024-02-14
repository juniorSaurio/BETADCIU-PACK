local beatLength=0
local stepLength=0

local charName='DXcomic'
local charDirectory='characters/dxComic'
local charScale=1
local offsetScalesWithSize=true
local correspondingNoteType='ExtraCharNote1'
local singLength=4

local charPos={-875, 150}
local prefixes={
		[1]='dxcomicleft', --[[left]]
		[2]='dxcomicdown', --[[down]]
		[3]='dxcomicup', --[[up]]
		[4]='dxcomicright', --[[right]]
		[5]='dxcomicidle', --[[idle]]
		[6]='dxcomicP1', --[[1]]
		[7]='dxcomicP2', --[[2]]
		[8]='dxcomicP3', --[[3]]
	}
local charOffsets={
		[1]={0, 90}, --[[left]]
		[2]={0, 90}, --[[down]]
		[3]={0, 90}, --[[up]]
		[4]={1, 90}, --[[right]]
		[5]={1, 90}, --[[idle]]
		[6]={0, 0}, --[[1]]
		[7]={0, 0}, --[[2]]
		[8]={0, 0}, --[[3]]
	}

function mathStuffs()
	beatLength=(1/bpm)*60
	stepLength=beatLength*0.25
end

function advAnim(obj,anim,forced,offsetTable)
	playAnim(obj, anim, forced)
	if offsetScalesWithSize then
		setProperty(obj..'.offset.x', offsetTable[1]*charScale)
		setProperty(obj..'.offset.y', offsetTable[2]*charScale)
	else
		setProperty(obj..'.offset.x', offsetTable[1])
		setProperty(obj..'.offset.y', offsetTable[2])		
	end
end

local singAnims={'singLEFT','singDOWN','singUP','singRIGHT'}

function onCreatePost()
	mathStuffs()
	makeAnimatedLuaSprite(charName, charDirectory, charPos[1], charPos[2])

		addAnimationByPrefix(charName, 'singLEFT', prefixes[1], 24, false)
		addAnimationByPrefix(charName, 'singDOWN', prefixes[2], 24, false)
		addAnimationByPrefix(charName, 'singUP', prefixes[3], 24, false)
		addAnimationByPrefix(charName, 'singRIGHT', prefixes[4], 24, false)
		addAnimationByPrefix(charName, 'idle', prefixes[5], 24, false)
		addAnimationByPrefix(charName, '1', prefixes[6], 24, false)
		addAnimationByPrefix(charName, '2', prefixes[7], 24, false)
		addAnimationByPrefix(charName, '3', prefixes[8], 24, false)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setObjectOrder(charName, 1)
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	scaleObject(charName, 1.3, 1.3)
	setProperty(charName..'.visible', false)
end

function opponentNoteHit(id,dir,note,sus)
	advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
	runTimer(charName..'-holdTimer', stepLength*singLength, 1)
end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onBeatHit()
	if curBeat%2==0 and getProperty(charName..'.animation.curAnim.name')=='idle' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onUpdate(elapsed)

	if curStep == 736 then
		setProperty('DXcomic.visible', true)
        doTweenX("DXcomictweenEnter", 'DXcomic', -50, 0.5, "circOut")
        setProperty('iconP2.alpha',1)
        runHaxeCode([[game.iconP2.changeIcon('dx4')]]);
        setHealthBarColors('08012E', 'C80053');
	end

	if curStep == 799 then
		doTweenX("DXcomicTweenExit", 'DXcomic', -1650, 0.7, "circInOut")
	end
end

function onTweenCompleted(tag)

    if tag == 'DXcomicTweenExit' then
        removeLuaSprite('DXcomic',true)
    end

end