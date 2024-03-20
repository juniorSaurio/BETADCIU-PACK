function onEvent(n,v1,v2)
    if n == "Lyrics HUD" then
        if v1 ~= '' and v2 ~= '' then
            
            y = 200
            yOff = 20

            makeLuaText('lyricText', '', 1500, 0, y - yOff +80)
            screenCenter('lyricText', 'x')
            setTextFont('lyricText', 'Mario-Party-Hudson-Font.ttf')
            setTextSize('lyricText', 115)
            setTextColor('lyricText', v2)
            setProperty('lyricText'..'.alpha', 0)
            setObjectCamera('lyricText', 'other')

            setTextString('lyricText', v1)

            addLuaText('lyricText')

            doTweenY('lyricTextY', 'lyricText', getProperty('lyricText.y') + 20, 0.3, 'sineOut')
            doTweenAlpha('lyricTextAlpha', 'lyricText', 1, 0.2, 'sineOut')

        elseif v1 == '' and v2 == '' then
            doTweenAlpha('lyricTextBye', 'lyricText', 0, 0.2, 'sineOut')
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'lyricTextBye' then
        removeLuaText('lyricText', true)
    end
end