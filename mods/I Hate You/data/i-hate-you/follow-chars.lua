local xx = 300;
local yy = 320;

local xx2 = 900;
local yy2 = 550;

local xx3 = 800;
local yy3 = 550;

local ofs = 0;
local ofs2 = 0;
local ofs3 = 0;

local dadzoom = 0.7;
local bfzoom = 0.7;
local gfzoom = 0.7;
local shake = false;

local cameraZoom = 0.03
local enableZoom = true
local enableZoomBeat = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep == 176 then
        setProperty('cameraSpeed', 0.4)
        bfzoom = 1.5
        xx2 = 1300;
        yy2 = 700;

    end

    if curStep == 192 then
        enableZoomBeat = true;
        bfzoom = 0.7;
        xx2 = 900;
        yy2 = 450;
        setProperty('cameraSpeed', 1)
    end

    if curStep == 217 then
        xx2 = 400;
        yy2 = -100;
        bfzoom = 1.2
    end

    if curStep == 218 or curStep == 219 then
        xx2 = 400;
        yy2 = -100;
    end

    if curStep == 235 then
        bfzoom = 0.9;
        xx2 = 1000;
        yy2 = 700;
    end

    if curStep == 242 then
        bfzoom = 0.6;
        yy2 = 400;
    end

    if curStep == 248 then
         bfzoom = 0.4;
        setProperty('cameraSpeed', 0.6)
        yy2 = -4200
    end

    if curStep == 256 then
        bfzoom = 0.6;
        dadzoom = 0.6;
        gfzoom = 0.6;
        xx2 = 900;
        setProperty('cameraSpeed', 1)
        yy = -4200
    end

    if curStep == 313 then
        dadzoom = 1.2;
    end

    if curStep == 320 then
        dadzoom = 0.6;
    end

    if curStep == 332 then
       dadzoom = 1.5;
       triggerEvent('Screen Shake','0.2, 0.05','0, 0');
       doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
       fadeOtherElements(0, 0.1)
    end

    if curStep == 335 then
       dadzoom = 0.6;
       doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.1, 'linear')
       fadeOtherElements(1, 0.1)
    end

    if curStep == 348 then
       dadzoom = 1.5;
       triggerEvent('Screen Shake','0.2, 0.05','0, 0');
       doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
       fadeOtherElements(0, 0.1)
    end

    if curStep == 351 then
       dadzoom = 0.6;
       doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.1, 'linear')
       fadeOtherElements(1, 0.1)
    end

    if curStep == 383 then
        triggerEvent('Screen Shake','1.3, 0.05','0, 0');
        dadzoom = 1.2
        xx = 500;
        doTweenAlpha('cameasdadddsds', 'camHUD', 0, 0.1, 'linear')
        fadeOtherElements(0, 0.1)
    end

    if curStep == 400 then
        doTweenAlpha('cameasdadddsds', 'camHUD', 1, 0.1, 'linear')
        fadeOtherElements(1, 0.1)
        dadzoom = 0.6
        xx = 400;
        yy = 300;

        xx2 = 700;
        yy2 = 300;

        xx3 = 700;
        yy3 = 300;

        setProperty('cameraSpeed', 0.4)
    end

    if curStep == 410 then
        setProperty('cameraSpeed', 1)
    end

    if curStep == 656 then
        dadzoom = 0.5
        bfzoom = 0.8
    end


    if curStep == 720 then
        dadzoom = 1.2
        bfzoom = 0.7

        xx = 1000;
        yy = 300;

        xx2 = 700;
        yy2 = 300;
    end

    if curStep == 783 then
       dadzoom = 0.5
        bfzoom = 0.5

        xx = 650;
        xx2 = 650;
    end

    if curStep == 848 then
        dadzoom = 0.6
        bfzoom = 0.6

        xx = 400;
        yy = 300;

        xx2 = 700;
        yy2 = 300;
    end

    if curStep == 1007 then
        enableZoomBeat = false
    end

    if curStep == 1040 then
        enableZoomBeat = true
    end

    if curStep == 1071 then
        enableZoomBeat = false
    end

    if curStep == 1103 then
       enableZoomBeat = true
       dadzoom = 1.2
       bfzoom = 1

       xx = 300;
        yy = 380;

        xx2 = 1000;
        yy2 = 280;
    end

    if curStep == 1216 then

       xx = 300;
        yy = 380;

        xx2 = 300;
        yy2 = 380;
    end

    if curStep == 1232 then
        cameraZoom = 0.04;
        dadzoom = 0.6
        bfzoom = 0.6

        xx = 400;
        yy = 300;

        xx2 = 700;
        yy2 = 300;
    end

    if curStep == 1360 then
        xx2 = 1000
        xx = 200
        cameraZoom = 0.025;
    end

    if curStep == 1440 then
        xx2 = 1000
        xx = 1000
        bfzoom = 0.9
        dadzoom = 0.9
        yy2 = 450;
        yy = 450;

        triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
    end

    if curStep == 1456 then
        xx2 = -200
        xx = -200
        triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
    end

    if curStep == 1468 then
        xx2 = 1000
        xx = 1000
        triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
    end

    if curStep == 1478 then
        bfzoom = 0.6
        dadzoom = 0.6
    end

    if curStep == 1490 then
        xx2 = 200
        xx = 200
        yy2 = 300;
        yy = 300;
        triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
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
        triggerEvent('Screen Shake','0.03, 0.1','0.1, 0.0015');
    end
end

function fadeOtherElements(fade, duration)
    doTweenAlpha('fade1', 'lava', fade, duration, 'linear')
    doTweenAlpha('fade2', 'healthBar', fade, duration, 'linear')
    doTweenAlpha('fade3', 'health', fade, duration, 'linear')
    doTweenAlpha('fade4', 'iconP1', fade, duration, 'linear')
    doTweenAlpha('fade5', 'iconP2', fade, duration, 'linear')
end
