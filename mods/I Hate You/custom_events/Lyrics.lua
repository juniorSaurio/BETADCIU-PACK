function onCreate()
	makeLuaText('SubWhite', ' ', 0, 350, 630)
	setTextSize('SubWhite', 50)
	setObjectCamera('SubWhite', 'other');
	addLuaText('SubWhite', true)
	setTextAlignment('SubWhite', 'SubWhite.center')
	setTextColor('SubWhite', 'ffffff')
end

function onEvent(name, value1, value2)
	if name == 'Lyrics' then
		setTextString('SubWhite', value1)
		setTextColor('SubWhite', value2)
	end
end