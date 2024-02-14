local xx = 400;
local yy = 400;

local xx2 = 1400;
local yy2 = 400;

local xx3 = 400;
local yy3 = 400;

local ofs = 100;
local ofs2 = 100;
local ofs3 = 100;

local dadzoom = 0.5;
local bfzoom = 0.5;
local gfzoom = 0.5;
local shake = false;

local cameraZoom = 0.01
local enableZoom = true
local enableZoomBeat = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep == 159 then
        xx = 550;
        yy = 450;

        xx2 = 550;
        yy2 = 450;       
    end

    if curStep == 286 then
        dadzoom = 0.7;
        bfzoom = 0.7;
        gfzoom = 0.7;

        ofs = 40;
        ofs2 = 40;
        ofs3 = 40;
    end

    if curStep == 415 then
        dadzoom = 0.5;
        bfzoom = 0.5;
        gfzoom = 0.5;

        ofs = 100;
        ofs2 = 100;
        ofs3 = 100;
    end

    if curStep == 544 then
        dadzoom = 0.8;
        bfzoom = 0.8;
        gfzoom = 0.8;

        xx = 750;
        yy = 500;

        xx2 = 750;
        yy2 = 500;  
    end

    if curStep == 607 then

        dadzoom = 0.5;
        bfzoom = 0.5;
        gfzoom = 0.5;

        xx = 550;
        yy = 450;

        xx2 = 550;
        yy2 = 450;   
    end

    if curStep == 900 then

        dadzoom = 0.85;
        bfzoom = 0.6;

        xx = 1000;
        yy = 300;

        xx2 = 770;
        yy2 = 450;

        ofs2 = 50;
    end

    if curStep == 1056 then

        dadzoom = 0.9;
        bfzoom = 0.9;

        xx = 1000;
        yy = 150;

        ofs = 100;
        ofs2 = 100;
        ofs3 = 100;
    end

    if curStep == 1119 then
        dadzoom = 0.9;
        bfzoom = 0.9;

        xx = 500;
        yy = 300;

        xx2 = 500;
        yy2 = 300;
    end

    if curStep == 1200 then

        enableZoomBeat=false

        dadzoom = 0.25;
        bfzoom = 0.25;

        xx = 1400;
        yy = 50;
        xx2 = 1400;
        yy2 = 50;

        ofs = 100;
        ofs2 = 100;
        ofs3 = 100;
    end

    if curStep == 1264 then
        dadzoom = 0.5;
        bfzoom = 0.5;

        xx = 800;
        yy = 150;
        xx2 = 800;
        yy2 = 150;
    end

    if curStep == 1326 then

        enableZoomBeat=true


        dadzoom = 0.75;
        bfzoom = 0.75;

        xx = 600;
        yy = 450;
        xx2 = 800;
        yy2 = 450;
    end

    if curStep == 1390 then
        xx = 700;
        yy = 250;
        xx2 = 700;
        yy2 = 250;
    end
end

function follow()

    if curStep == 32 then
        enableZoomBeat = true
    end 

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
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end