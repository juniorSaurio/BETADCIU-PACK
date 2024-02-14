local xx = 1200;
local yy = -100;

local xx2 = 1200;
local yy2 = -100;

local xx2 = 1200;
local yy2 = -100;

local ofs = 60;
local ofs2 = 60;
local ofs3 = 60;

local dadzoom = 0.5;
local bfzoom = 0.5;
local gfzoom = 0.5;
local shake = true;

local cameraZoom = 0.02
local enableZoom = true


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
    setTextString('botplayTxt','')
    setProperty('scoreTxt.visible',false)
end

function onUpdate(elapsed)
    follow()


    triggerEvent('Screen Shake','0, 0','0.1, 0.0025');

    if curStep >= 256 then
        if curStep %8 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'')
        end
    end

    if curStep == 223 then
        xx = 1800;
        yy = 200;
        dadzoom = 0.9;
    end

    if curStep == 255 then
        xx = 1200;
        yy = -100;
        dadzoom = 0.5;
    end

    if curStep == 512 then
        xx = 1400;
        yy = 100;
        xx2 = 1400;
        yy2 = 100;
        dadzoom = 0.45;
        bfzoom = 0.45;
    end

    if curStep == 784 then
        dadzoom = 0.55;
        bfzoom = 0.55;
    end

    if curStep == 1024 then
        dadzoom = 0.45;
        bfzoom = 0.45;
    end

    if curStep == 1280 then
        xx2 = 2100;
        yy2 = 0;
        bfzoom = 0.7;
        dadzoom = 0.7
        ofs = 0
        ofs2 = 0
        setProperty('cameraSpeed', 30) 
    end

    if curStep == 1344 then
        xx = 1000;
        yy = 100;
    end

    if curStep == 1408 then
        xx2 = 2100;
        yy2 = 0;
    end

    if curStep == 1424 then
        xx = 1000;
        yy = 100;
    end

    if curStep == 1440 then
        xx2 = 2100;
        yy2 = 0;
    end

    if curStep == 1456 then
        xx = 1000;
        yy = 100;
    end

    if curStep == 1472 then
        xx = 1400;
        yy = 100;
        xx2 = 1400;
        yy2 = 100;
        dadzoom = 0.45;
        bfzoom = 0.45;
        ofs = 30
        ofs2 = 30
    end

    if curStep == 1536 then
        setProperty('cameraSpeed', 1) 
        xx = 1200;
        yy = 200;
        xx2 = 1200;
        yy2 = 200;
        dadzoom = 0.6;
        bfzoom = 0.6;
    end

    if curStep == 1779 then
        yy = 100;
        yy2 = 100;
    end

    if curStep == 2045 then
        xx = 1400;
        xx2 = 1400;
        yy = 100;
        yy2 = 100;
        dadzoom = 0.7;
        bfzoom = 0.7;
    end

    if curStep == 2592 then
        dadzoom = 0.55;
        bfzoom = 0.55;
    end

    if curStep == 2704 then
        cameraZoom = 0.022
    end

    if curStep >= 2704 and curStep <= 2719 then
        if curStep %2 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'')
        end
    end

    if curStep == 2720 then
        cameraZoom = 0.02
    end

    if curStep == 2847 then
        enableZoom = false
    end

    if curStep == 2928 then
        enableZoom = true
    end

    if curStep == 2936 then
        xx = 1200;
        xx2 = 1200;
    end

    if curStep == 3712 then
        xx = 1300;
        xx2 = 1300;
        yy = 50;
        yy2 = 50;
        dadzoom = 0.5;
        bfzoom = 0.5;
    end

    if curStep == 4368 then
        cameraZoom = 0.022
    end

    if curStep >= 4368 and curStep <= 4383 then
        if curStep %2 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'')
        end
    end

    if curStep == 4384 then
        cameraZoom = 0.02
    end
end

function follow()

    if gfSection == true then
        if enableZoom then
            setProperty('defaultCamZoom',gfzoom)
        end

        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
    elseif mustHitSection == false then
            if enableZoom then
                setProperty('defaultCamZoom',dadzoom)
            end

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'still' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
    else
            if enableZoom then
                setProperty('defaultCamZoom',bfzoom)
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0075');
    end
end