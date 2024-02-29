-- Script by AquaStrikr (https://twitter.com/AquaStrikr_)
function onCreatePost()
	makeLuaSprite('Health', 'healthBarNEW',getProperty('healthBar.x') - 40,getProperty('healthBar.y') - 5)
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	setProperty('healthBar.visible', true)

  setObjectOrder('healthBar',getObjectOrder('Health')-1)
  setObjectOrder('iconP1',getObjectOrder('Health') + 1)
  setObjectOrder('iconP2',getObjectOrder('Health') + 1)
end


local scoreRating = {'S+', 'S', 'A', 'B', 'C', 'D', 'E', 'F'}
local scoreAccuracy = {100, 95, 90, 85, 80, 75, 70, 65}
local ratingFinal = '?'

local scoreBounce = false -- whether the score should bounce on note hits

function onCreate()

    makeLuaText('scoreBar', 'Score: 0    Misses: 0    Ratting: ?', 1270, 0, (downscroll and 120 or 682));
    setTextBorder("scoreBar", 2, '000000')
    setTextAlignment('scoreBar', 'CENTER')
    setTextSize('scoreBar', 15)
    setTextFont('scoreBar', "mario2.ttf")
    setProperty('scoreBar.color', getColorFromHex('FF0000'))
    if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('scoreBar') end
end

function onUpdate()
    setProperty('scoreTxt.visible', false);
    setProperty('scoreBar.visible',false)
    setProperty('timeBar.color', getColorFromHex('FF0000'))
    
    setTextFont('timeTxt', "mario2.ttf")
    setTextBorder('timeTxt', 2, '000000')
    setTextSize('timeTxt', 23);
    setProperty('timeTxt.color', getColorFromHex('FF0000'))

end

    function onRecalculateRating()
        reloadRating(round((getProperty('ratingPercent') * 100), 2))
        setTextString('scoreBar',
        'Score: '..score.. -- setup score
        '   Misses: '..misses.. -- misses (easy)
        '    Ratting: '..ratingFinal)
      end
      
      function reloadRating(percent)
        -- figures out your rating
        for i = 1,#scoreRating do
          if scoreAccuracy[i] <= percent then
            ratingFinal = scoreRating[i]
            break
          end
        end
      end

      function goodNoteHit(coolNote, noteData, noteType, isSustain)
        if getPropertyFromClass('ClientPrefs', 'scoreZoom') == true then
          -- Psych Score Tween !!
          setProperty('scoreBar.scale.x', 1.075)
          setProperty('scoreBar.scale.y', 1.075)
          doTweenX('scoreBarScaleX', getProperty('scoreBar.scale'), 1, 0.2)
          doTweenY('scoreBarScaleY', getProperty('scoreBar.scale'), 1, 0.2)
        end
      end
      
      function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
          local totalseconds = math.floor(milliseconds / 1000)
          local seconds = totalseconds % 60
          local minutes = math.floor(totalseconds / 60)
          minutes = minutes % 60
          return string.format("%02d:%02d", minutes, seconds)  
      end
      
      function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
        n = math.pow(10, n or 0)
        x = x * n
        if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
        return x / n
      end