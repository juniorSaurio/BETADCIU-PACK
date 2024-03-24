function onEvent(n,v1,v2)
    if n == "Song Name" then
        if v1 ~= '' and v2 ~= '' then
            texts = {'song', 'composer','extras'}

            y = 250
            local extraY = 0;
            
            if v1 == 'CATACLYSM-STARS (ACT 4)' then
                extraY = 50
            end

            yOff = 20
            for i = 1, #texts do
                
                if texts[i] == 'extras' then
                    makeLuaText(texts[i], '', 1000, 0, y - yOff + (i)*50 + extraY)
                else
                    makeLuaText(texts[i], '', 1000, 0, y - yOff + (i-1)*80)
                end
                screenCenter(texts[i], 'x')
                setTextFont(texts[i], 'Pixel Emulator.otf')
                setTextSize(texts[i], 55 - (i-1)*10)
                setTextColor(texts[i], '000000')
                setTextBorder(texts[i], 3, 'f02828')
                setProperty(texts[i]..'.alpha', 0)
                setObjectCamera(texts[i], 'other')
            end

            makeLuaSprite('barBG', '', 0, y + 70 - yOff)
            makeGraphic('barBG', 800, 10, 'f02828')
            screenCenter('barBG', 'x')
            setObjectCamera('barBG', 'other')
            setProperty('barBG.alpha', 0)
        
            makeLuaSprite('bar', '', 0, y + 73 - yOff)
            makeGraphic('bar', 790, 4, '000000')
            screenCenter('bar', 'x')
            setObjectCamera('bar', 'other')
            setProperty('bar.alpha', 0)

            makeLuaSprite('barBG2', '', 0, y + 137 - yOff + extraY)
            makeGraphic('barBG2', 800, 10, 'f02828')
            screenCenter('barBG2', 'x')
            setObjectCamera('barBG2', 'other')
            setProperty('barBG2.alpha', 0)
        
            makeLuaSprite('bar2', '', 0, y + 140 - yOff + extraY)
            makeGraphic('bar2', 790, 4, '000000')
            screenCenter('bar2', 'x')
            setObjectCamera('bar2', 'other')
            setProperty('bar2.alpha', 0)

            setTextString('song', v1)
            setTextString('composer', v2)
            setTextString('extras', 'COVER BY JuniorSaurio')

            addLuaText('song')
            addLuaText('composer')
            addLuaText('extras')
            addLuaSprite('barBG', true)
            addLuaSprite('bar', true)
            addLuaSprite('barBG2', true)
            addLuaSprite('bar2', true)

            everything = {'song', 'composer','extras','barBG', 'bar','barBG2', 'bar2'}
            for i = 1, #everything do
                doTweenY(everything[i]..'y', everything[i], getProperty(everything[i]..'.y') + 20, 0.5, 'sineOut')
                doTweenAlpha(everything[i]..'a', everything[i], 1, 0.5, 'sineOut')
            end
            elseif v1 == '' and v2 == '' then
            for i = 1, #everything do
                doTweenAlpha(everything[i]..'Bye', everything[i], 0, 0.5, 'sineOut')
            end
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'songBye' then
        removeLuaText('song', true)
        removeLuaText('composer', true)
        removeLuaText('extras', true)
        removeLuaSprite('barBG', true)
        removeLuaSprite('bar', true)
        removeLuaSprite('barBG2', true)
        removeLuaSprite('bar2', true)
    end
end