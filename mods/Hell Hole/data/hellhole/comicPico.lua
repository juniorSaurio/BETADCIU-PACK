local beatLength=0
local stepLength=0

local charName='picomic'
local charDirectory='characters/picoComic'
local charScale=1
local offsetScalesWithSize=true
local correspondingNoteType='ExtraCharNote1'
local singLength=4

local charPos={1650, 0}
local prefixes={
		[1]='pico comic left', --[[left]]
		[2]='pico comic down', --[[down]]
		[3]='pico comic up', --[[up]]
		[4]='pico comic right', --[[right]]
		[5]='pico comic idle', --[[idle]]
	}
local charOffsets={
		[1]={0, 90}, --[[left]]
		[2]={0, 90}, --[[down]]
		[3]={0, 90}, --[[up]]
		[4]={0, 90}, --[[right]]
		[5]={0, 90}, --[[idle]]
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

	advAnim(charName, 'idle' , true, charOffsets[5])
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	scaleObject(charName, 1.3, 1.3)
end

function goodNoteHit(id,dir,note,sus)
	if curStep >= 1616 and curStep <= 1632 then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end 
end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onUpdate(elapsed)
	if curStep == 1616 then
		addLuaSprite(charName,false)
		doTweenX("picomictweeb", charName, 720, 0.5, "circOut")
	end
	if curStep == 1632 then
		doTweenX("picomictweenLeave", charName, 1450, 0.5, "circInOut")
	end
end

function onTweenCompleted(tag)
	if tag == 'picomictweenLeave' then
		removeLuaSprite(charName,true)
	end
end