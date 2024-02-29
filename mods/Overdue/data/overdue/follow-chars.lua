local xx = -200;
local yy = 500;

local xx2 = 700;
local yy2 = 500;

local xx3 = 500;
local yy3 = 500;

local ofs = 25;
local ofs2 = 25;
local ofs3 = 25;

local dadzoom = 0.5;
local bfzoom = 0.5;
local gfzoom = 0.5;
local shakeDad = false;
local shakeBF = false;

local cameraZoom = 0.01
local enableZoom = true
local enableZoomBeat = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep >= 268 and curStep <= 280 then
        triggerEvent('Camera Follow Pos',xx,yy)
    end

    if curStep >= 281 and curStep <= 302  then
        setProperty('defaultCamZoom',0.35)
        triggerEvent('Camera Follow Pos',xx,300)
    end

    if curStep == 303 then
        shakeDad = true;
        dadzoom = 0.4;
        bfzoom = 0.8;

        xx = 200;
        yy = 250;

        xx2 = 1100;
        yy2 = 700;
    end
    

    if curStep == 432 then
        xx = 200
        yy = 400

        xx2 = 600
        yy2 = 400

        shakeBF = true;

        dadzoom = 0.5;
        bfzoom = 0.5;
    end

    if curStep == 560 then
        shakeBF = false
        shakeDad = false

        enableZoomBeat = true
    end
    
    if curStep == 805 then
        xx = 0
        yy = 400

        xx2 = 0
        yy2 = 400


        dadzoom = 0.9;
        bfzoom = 0.9;
    end

    if curStep == 816 then
        enableZoomBeat = false
        xx = 150
        yy = 100

        xx2 = 400
        yy2 = 200


        dadzoom = 0.4;
        bfzoom = 0.5;
    end

    if curStep == 1054 then
        setProperty('cameraSpeed', 2)
        bfzoom = 2;
        xx2 = 1200
        yy2 = 400
    end

    if curStep == 1056 then
        setProperty('cameraSpeed', 0.3)
        dadzoom = 0.2;
        bfzoom = 0.2;
    end

    if curStep == 1070 then
        setProperty('cameraSpeed', 40)
        dadzoom = 0.5;
        bfzoom = 0.5;
        xx = -300
        yy = 675

        xx2 = -300
        yy2 = 675

        setProperty('defaultCamZoom',dadzoom)
        triggerEvent('Camera Follow Pos',xx,yy)
    end

    if curStep == 1072 then
        setProperty('cameraSpeed', 1)
        enableZoomBeat = true;
    end

    if curStep == 1264 then
        setProperty('cameraSpeed', 2.5)
        dadzoom = 0.7;
        bfzoom = 0.7;

        xx = 200;
        yy = 500;

        xx2 = 700;
        yy2 = 500;

        setProperty('defaultCamZoom',dadzoom)
        triggerEvent('Camera Follow Pos',xx,yy)
    end

    if curStep == 1392 then
        xx = 400;
        yy = 625;

        xx2 = 400;
        yy2 = 625;

        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 1520 then
        setProperty('cameraSpeed', 1)

        xx = 400;
        yy = 700;

        xx2 = 400;
        yy2 = 700;
    end

    if curStep == 1654 then
        
        xx = -100;
        yy = 500;

        xx2 = -100;
        yy2 = 500;

        dadzoom = 1.2;
        bfzoom = 1.2;

        ofs = 0
        ofs2 = 0
        setProperty('cameraSpeed', 5)
    end

    if curStep == 1656 then

        setProperty('cameraSpeed', 0.03)

        xx = 1500;
        xx2 = 1500;
    end

    if curStep == 1904 then

        setProperty('cameraSpeed', 5)
        xx = -300;
        yy = 500;

        xx2 = -300;
        yy2 = 500;

        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 1905 or curStep == 1906 then
        setProperty('cameraSpeed', 0.03)

        xx = 1500;
        xx2 = 1500;
    end

    if curStep == 2176 then
        xx = 800;
        yy = 500;

        xx2 = 1000;
        yy2 = 500;

        dadzoom = 0.5;
        bfzoom = 0.6;

        ofs = 0
        ofs2 = 0
        setProperty('cameraSpeed', 5)
    end

    if curStep == 2416 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        setProperty('cameraSpeed', 40)

        dadzoom = 0.8;
        bfzoom = 0.8;

        xx = 700;
        yy = 500;

        xx2 = 700;
        yy2 = 500;
    end

    if curStep == 2422 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        dadzoom = 1;
        bfzoom = 1;

        yy = 650;
        yy2 = 650;
    end
   
    if curStep == 2428 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        dadzoom = 1.2;
        bfzoom = 1.2;
        yy = 800;
        yy2 = 800;
    end

    if curStep == 2432 then
        xx = 800;
        yy = 500;

        xx2 = 800;
        yy2 = 500;

        dadzoom = 0.5;
        bfzoom = 0.5;

        ofs = 0
        ofs2 = 0

        setProperty('cameraSpeed', 1)
    end

    if curStep == 2672 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        setProperty('cameraSpeed', 40)

        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 2678 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        dadzoom = 1;
        bfzoom = 1;

        yy = 650;
        yy2 = 650;
    end
   
    if curStep == 2684 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
        dadzoom = 1.2;
        bfzoom = 1.2;
        yy = 800;
        yy2 = 800;
    end

    if curStep == 2688 then
        xx = 800;
        yy = 500;

        xx2 = 800;
        yy2 = 500;

        dadzoom = 0.8;
        bfzoom = 0.8;

        ofs = 0
        ofs2 = 0

        setProperty('cameraSpeed', 1)
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
    if shakeDad then
        triggerEvent('Screen Shake','0.03, 0.07','0.1, 0.01');
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if shakeBF then
        triggerEvent('Screen Shake','0.03, 0.07','0.1, 0.01');
    end
end