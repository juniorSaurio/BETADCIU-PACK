local xx = 300;
local yy = 500;

local xx2 = 1000;
local yy2 = 600;

local xx3 = 550;
local yy3 = 200;

local ofs = 60;
local ofs2 = 60;
local ofs3 = 60;

local dadzoom = 0.75;
local bfzoom = 1;
local gfzoom = 0.55;
local shake = false;


local xPiracyPos = 0;
local yPiracyPos = 0;

function onCreate()

end

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    ------------ PARTE 1 -----------------------------------------------------------------------------------------------

    if curStep == 400 then
        shake = true;
        xx2 = 270;
        yy2 = 500;
        xx = 270;
        yy = 500;
        ofs2 = 0;
        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 460 then
        dadzoom = 0.9;
        bfzoom = 0.9; 
    end

    if curStep == 528 then
        dadzoom = 0.7;
        bfzoom = 0.7;
    end

    if curStep == 558 then
        xx2 = 600;
        xx = 600;
        triggerEvent('Camera Follow Pos',600,500)
    end

    if curStep == 590 then
       xx3 = 600;
       yy3 = 550;
       gfzoom = 0.7;
    end

    if curStep == 655 then
      xx = 300;
      yy = 500;

      xx2 = 800;
      yy2 = 650;

      ofs = 60;
      ofs2 = 60;

      dadzoom = 0.75;
      bfzoom = 1;
    end

    if curStep == 719 then
      xx = 500;
      dadzoom = 0.5;
      bfzoom = 0.55;
    end

    if curStep == 784 then
        xx = 0;
        xx2 = 100;
        yy = 450;
        yy2 = 350
        dadzoom = 0.75;
        bfzoom = 1.6;
    end

    if curStep == 912 then
        xx = 0;
        xx2 = 300;
        yy = -300;
        yy2 = 400
        dadzoom = 0.45;
        bfzoom = 0.7;
    end

    if curStep == 1040 then
      xx = 550;
      yy = 400;

      xx2 = 800;
      yy2 = 500;

      ofs = 60;
      ofs2 = 60;

      dadzoom = 0.75;
      bfzoom = 1;
    end

    if curStep >= 992 and curStep <= 1015 then
        bfzoom = 0.9;
        triggerEvent('Screen Shake','0.05, 0.02','0.1, 0.0075');
    end

    if curStep == 1016 then
        bfzoom = 0.7;
    end

    if curStep >= 1034 and curStep <= 1044 then
        triggerEvent('Screen Shake','0.05, 0.02','0.1, 0.0075');
    end

    if curStep == 1104 then
        xx2 = 350;
        yy2 = 500;
        xx = 350;
        yy = 500;
        ofs2 = 0;
        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 1167 then
      xx = 550;
      yy = 500;

      xx2 = 800;
      yy2 = 600;

      ofs = 60;
      ofs2 = 60;

      dadzoom = 0.65;
      bfzoom = 0.8;
    end

    if curStep == 1232 then
      xx = 800;
      yy = 550;

      xx2 = 500;
      yy2 = 500;

      dadzoom = 0.75;
      bfzoom = 0.85; 
    end

    if curStep == 1328 then
        xx2 = 250;
        yy2 = 300;
        xx = 250;
        yy = 300;
        xx3 = 250;
        yy3 = 300;
        dadzoom = 0.8;
        bfzoom = 0.8;
        gfzoom = 0.8;
        ofs = 80;
        ofs2 = 80;
        ofs3 = 80;
    end

    if curStep == 1388 then
        ofs2 = 0
        yy3 = 100;
        yy2 = 100;
        yy = 100;
        dadzoom = 0.9;
        bfzoom = 0.9;
        gfzoom = 0.9;
    end

    if (curStep >= 400 and curStep <= 528) or (curStep >= 784 and curStep <= 1040) or (curStep >= 2912 and curStep <= 3424) then
       if curStep%4 == 0 then
         triggerEvent('Add Camera Zoom','0.05','0')
       end
    end

    if (curStep >= 528 and curStep <= 752) or (curStep >= 1040 and curStep <= 1280) or (curStep >= 1344 and curStep <= 1856) or
        (curStep >= 2128 and curStep <= 2368) or (curStep >= 2768 and curStep <= 2896) then
       if curStep%8 == 0 then
         triggerEvent('Add Camera Zoom','0.02','0')
       end
    end

    if curStep == 1472 then
        xx2 = 600;
        yy2 = 500;
        xx = 600;
        yy = 500;
        xx3 = 600;
        yy3 = 500;
        dadzoom = 0.6;
        bfzoom = 0.6;
        gfzoom = 0.6;
    end

    if curStep == 1664 then
        dadzoom = 0.9;
        bfzoom = 0.9;
        gfzoom = 0.9;
    end

    if curStep == 1696 then
        xx2 = 700;
        yy2 = 800;
        xx = 700;
        yy = 800;
        xx3 = 700;
        yy3 = 800;
        dadzoom = 0.75;
        bfzoom = 0.75;
        gfzoom = 0.75;
    end

    if curStep == 1728 then
        xx2 = 550;
        yy2 = 550;
        xx = 500;
        yy = 550;
        xx3 = 500;
        yy3 = 550;
        dadzoom = 0.7;
        bfzoom = 0.7;
        gfzoom = 0.7;
        ofs = 40;
        ofs2 = 40;
        ofs3 = 40;
    end

    ------------ PARTE 2 -----------------------------------------------------------------------------------------------
    if curStep == 1872 then

    end

    triggerEvent('Screen Shake','0, 0','0.1, 0.0025');
end

function follow()

    if gfSection == true then
        setProperty('defaultCamZoom',gfzoom)
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
            setProperty('defaultCamZoom',dadzoom)
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
            setProperty('defaultCamZoom',bfzoom)
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
        triggerEvent('Screen Shake','0.05, 0.02','0.1, 0.0075');
    end

    if curStep >= 784 and curStep <= 912 then
        piracySonicFollowMovements(direction)
    end
end

function piracySonicFollowMovements(direction)
    if direction == 0 then --LEFT
        setProperty('boyfriend.x',xPiracyPos - 70 )
        setProperty('boyfriend.y',yPiracyPos + 20)

    elseif direction == 1 then -- DOWN

        setProperty('boyfriend.x',xPiracyPos)
        setProperty('boyfriend.y',yPiracyPos + 10)

    elseif direction == 2 then --UP

        setProperty('boyfriend.x',xPiracyPos)
        setProperty('boyfriend.y',yPiracyPos - 10)

    elseif direction == 3 then --RIGHT

        setProperty('boyfriend.x',xPiracyPos + 70)
        setProperty('boyfriend.y',yPiracyPos)

    end
end