function onCreate()
  for i = 0, getProperty('opponentStrums.length')-1 do

    if not getPropertyFromGroup('notes', i, 'mustPress') then
      setPropertyFromGroup('notes', i, 'texture', 'Static_Note');
    end
  end

  for i = 0, getProperty('playerStrums.length')-1 do

    if getPropertyFromGroup('notes', i, 'mustPress') and getPropertyFromGroup('notes', i, 'noteType') == ('' or 'Hey!' or 'No Animation' or 'GF Sing') then
      setPropertyFromGroup('notes', i, 'noteSplashTexture', 'BloodSplash');
    end
  end
end