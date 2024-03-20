
local timeStyle = ''

function onCreatePost()
    
    setTextFont('timeTxt','super-mario-bros-nes.ttf')
    if timeBarType ~= 'Song Name' then
        setTextSize('timeTxt',23)
    else
        setTextSize('timeTxt',17)
        setProperty('timeTxt.offset.y',-2)
    end

    setTextFont('scoreTxt','super-mario-bros-nes.ttf')
    setTextSize('scoreTxt',15)
    setProperty('scoreTxt.color',getColorFromHex('FF0000'))
    setProperty('timeTxt.color',getColorFromHex('FF0000'))
    if version >= '0.7' then
        setProperty('timeBar.leftBar.color',getColorFromHex('FF0000'))
    else
        setProperty('timeBar.color',getColorFromHex('FF0000'))
    end

    local healthImage = 'healthBarNEW'
    local barAntialiasing = true

    if version >= '0.7' then
        runHaxeCode(
            [[
                game.healthBar.bg.loadGraphic(Paths.image(']]..healthImage..[['));
                game.healthBar.bg.antialiasing = ]]..tostring(barAntialiasing)..[[;
                game.healthBar.bg.offset.set(45,5);
                return;
            ]]
        )
    else
        runHaxeCode(
            [[
                game.healthBarBG.loadGraphic(Paths.image("]]..healthImage..[["));
                game.healthBarBG.offset.set(50,6);
                game.remove(game.healthBarBG);
                game.insert(game.members.indexOf(game.healthBar)+1,game.healthBarBG);
                game.healthBarBG.antialiasing = ]]..tostring(barAntialiasing)..[[;
                return;
            ]]
        )
    end
end

function onUpdateScore()
    local rating = "RATING: "
    local percent = getProperty('ratingPercent')
    if  percent > 0 then
        if percent >= 1 then
            rating = 'RATING: SS+'
        elseif percent > 0.95 then
            rating = 'RATING: S+'
        elseif percent > 0.90 then
            rating = 'RATING: S'
        elseif percent > 0.85 then
            rating = 'RATING: A+'
        elseif percent > 0.80 then
            rating = 'RATING: A'
        elseif percent > 0.70 then
            rating = 'RATING: B'
        elseif percent > 0.60 then
            rating = 'RATING: C'
        elseif percent > 0.50 then
            rating = 'RATING: D'
        elseif percent > 0.30 then
            rating = 'RATING: E'
        else
            rating = 'RATING: F'
        end
        rating = rating.."("..(math.floor(getProperty('ratingPercent') * 10000)/100)..'%)'
    else
        rating = rating..'?'
    end

    setTextString('scoreTxt','SCORE: '..getProperty('songScore')..'    MISSES: '..getProperty('songMisses')..'    '..rating)

end