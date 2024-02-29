
local text = ''
local resetColor = ''

function onCreate()
    makeLuaText('ycbuText','',screenWidth+500,-250,screenHeight/2 - 50)
    setTextSize('ycbuText',150)
    setTextFont('ycbuText','mariones.ttf')
    setProperty('ycbuText.scale.y',1.5)
    setTextBorder('ycbuText',0,'000000')
    setProperty('ycbuText.autoSize',false)
    
    runHaxeCode(
        [[
            game.modchartTexts.get('ycbuText').cameras = [game.camGame];
            game.modchartTexts.get('ycbuText').scrollFactor.set(0,0);
            game.insert(game.members.indexOf(game.dadGroup)-2,game.modchartTexts.get('ycbuText'));
            return;
        ]]
    )
end

function onEvent(name,v1,v2)
    if name == 'ycbu text' then

        if text == '' then
            setObjectOrder('ycbuText',math.min(getObjectOrder('dadGroup'),getObjectOrder('boyfriendGroup'),getObjectOrder('gfGroup'))-1)
        end
        if v1 ~= '' then
            text = string.upper(string.gsub(v1,';','\n'))
        else
            text = ''
        end
    
        setTextString('ycbuText',text)
        
        
        local foundedLines = false
        local dialogue = v1
        resetColor = 'FFFFFF'

        repeat
            foundedLines = false
            if string.find(dialogue,'\n',0,true) then
                foundedLines = true
                local _,comma = string.find(dialogue,';',0,true)
                dialogue = string.sub(dialogue,0,comma)
            end
        until foundedLines == false

        detectYCBUOffset()
        setProperty('ycbuText.color',getColorFromHex('F77E63'))
        runTimer('resetYcbuColor',0.1)
    end
end

function onTimerCompleted(tag)
    if tag == 'resetYcbuColor' then
        if resetColor == nil then
            resetColor = '000000'
        end

        setProperty('ycbuText.color',getColorFromHex(resetColor))
    end
end
function detectYCBUOffset()
    setProperty('ycbuText.fieldHeight',250*getProperty('ycbuText.textField.numLines'))
end