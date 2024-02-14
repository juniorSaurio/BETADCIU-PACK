local xx = 600;
local yy = 100;

local xx2 = 750;
local yy2 = 100;

local xx3 = 550;
local yy3 = 100;

local ofs = 0;
local ofs2 = 0;
local ofs3 = 0;

local dadzoom = 0.9;
local bfzoom = 0.9;
local gfzoom = 0.9;
local shake = false;

local cameraZoom = 0.03
local enableZoom = true
local enableZoomBeat = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep == 352 then
        dadzoom = 0.5;
        bfzoom = 0.5;
        gfzoom = 0.5; 
    end

    if curStep == 448 then
        dadzoom = 0.58;
        bfzoom = 0.58;
        gfzoom = 0.58;

        xx = 700;
        xx2 = 1000;

    end

    if curStep == 560 then

        xx = 800;
        xx2 = 800;
        xx3 = 800;


        dadzoom = 1.2        
        bfzoom = 1.2 
    end

    if curStep == 562 then
        triggerEvent('Screen Shake','1.2, 0.05','1.2, 0.01');
    end

    if curStep == 576 then
        enableZoomBeat = true

        dadzoom = 0.7;
        bfzoom = 0.7;
        gfzoom = 0.7; 
    end

    if curStep == 716 then

        dadzoom = 0.55;
        bfzoom = 0.55;
        gfzoom = 0.55; 
    end

    if curStep == 848 then

        xx = 600;
        xx2 = 750;

        dadzoom = 0.6;
        bfzoom = 0.6;
        gfzoom = 0.6;

        ofs = 100;
        ofs2 = 100;
        ofs3 = 100;
    end

    if curStep == 1110 then

        cameraZoom = 0.4
        dadzoom = 1.25;
        bfzoom = 0.7;

        xx = 1200;
        yy= 0

        xx2 = 900;

        ofs = 0;
        ofs2 = 0;
        ofs3 = 0;

        triggerEvent('Camera Follow Pos',xx-ofs,yy)
    end

    if curStep == 1163 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
    end

    if curStep == 1166 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
    end

    if curStep == 1179 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12,0');
    end

    if curStep == 1182 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
        cameraZoom = 0.03
    end

    if curStep == 1227 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
    end

    if curStep == 1230 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
    end

    if curStep == 1243 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12, 0');
    end 

    if curStep == 1246 then
        triggerEvent('Screen Shake','0.12, 0.06','0.12,0');
    end

    if curStep == 1248 then
        xx = 700;
        xx2 = 700;
        yy = 100;
        yy2 = 100;

        dadzoom = 0.7;
        bfzoom = 0.7;
        gfzoom = 0.7;

        ofs = 100;
        ofs2 = 100;
        ofs3 = 100;
    end
end

function follow()

    if enableZoomBeat then
        if curStep %4 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'0')
        end
    end

    if gfSection == true then
        if enableZoom then
            setProperty('defaultCamZoom',gfzoom)
        end

        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs3)
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
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
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end