function onCreate()
    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Trio Opponent Note' then
            setPropertyFromGroup('unspawnNotes',i,'visible',true)
            setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
        end
    end
end