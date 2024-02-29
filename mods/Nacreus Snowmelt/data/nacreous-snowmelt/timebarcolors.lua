function onBeatHit()

     if curBeat %1 == 0 then

        setProperty('timeBar.color', getColorFromHex('00E2FF'))
     end

     if curBeat %2 == 0 then

        setProperty('timeBar.color', getColorFromHex('F8A041'))

     end

     if curBeat %3 == 0 then

        setProperty('timeBar.color', getColorFromHex('FF0000'))

     end

end
