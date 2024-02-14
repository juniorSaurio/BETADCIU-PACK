local xx = 1300;
local yy = 0;

local xx2 = 500;
local yy2 = 350;

local xx3 = 300;
local yy3 = 300;

local ofs = 60;
local ofs2 = 120;
local ofs3 = 0;

local dadzoom = 0.4;
local bfzoom = 0.6;
local gfzoom = 0.4;
local shake = false;

local cameraZoom = 0.025
local enableZoom = true
local enableZoomBeat = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep == 432 then
        xx = 0;
        xx2 = 0;
        yy = 400;
        yy2 = 400;
        dadzoom = 0.8;
        bfzoom = 0.8;
    end

    if curStep == 448 then
        xx = 450;
        xx2 = 450;
        yy = 500;
        yy2 = 500;
        dadzoom = 0.6;
        bfzoom = 0.6;
        enableZoomBeat = true
    end

    if curStep == 576 then
        xx = 450;
        xx2 = 450;
        yy = 550;
        yy2 = 500;
        dadzoom = 0.8;
        bfzoom = 0.8;
        ofs = 40;
        ofs2 = 40;
    end

    if curStep == 752 then
        xx = 900;
        xx2 = 900;
        yy = 600;
        yy2 = 600;
        dadzoom = 1.3;
        bfzoom = 1.3;
    end

    if curStep == 767 then
        xx = 450;
        xx2 = 450;
        yy = 550;
        yy2 = 500;
        dadzoom = 0.8;
        bfzoom = 0.8;
        ofs = 40;
        ofs2 = 40;
    end

    if curStep == 959 then
        bfzoom = 0.5;
        yy2 = 200;
    end

    if curStep == 1008 then
        dadzoom = 0.3;
        bfzoom = 0.3;
        xx2 = 900;
        yy2 = 0;

        enableZoomBeat = false
    end

    if curStep == 1024 then
        enableZoomBeat = true
        dadzoom = 0.5;
        bfzoom = 0.5;
        xx2 = 300;
        yy2 = 200;
    end

    if curStep == 1056 then
        xx = 450;
        xx2 = 450;
        yy = 250;
        yy2 = 250;
        dadzoom = 0.8;
        bfzoom = 0.8;
        ofs = 40;
        ofs2 = 40;
    end

    if curStep == 1088 then
        xx = 450;
        xx2 = 450;
        yy = 300;
        yy2 = 300;
        dadzoom = 0.5;
        bfzoom = 0.5;
        ofs = 40;
        ofs2 = 40;
    end

    if curStep == 1152 then
        dadzoom = 0.5;
        bfzoom = 0.5;
        xx = 300;
        xx2 = 300;
        yy = 300;
        yy2 = 300;
    end

    if curStep == 1180 then
        dadzoom = 0.1;
        bfzoom = 0.1;
        yy = -200;
        yy2 = -200;
    end
end

function onBeatHit()

    if curBeat >= 64 and curBeat <= 76 then
        triggerEvent('Add Camera Zoom','','')
    end

    if curBeat >= 80 and curBeat <= 91 then
        triggerEvent('Add Camera Zoom','','')
    end

    if curBeat % 4 == 0 then
        if curBeat >= 96 and curBeat <= 111 then
            triggerEvent('Add Camera Zoom','0.04','0.06')
            triggerEvent('Screen Shake','0.27, 0.003','0.27, 0.0015')
        end
    end

    if curBeat >= 132 and curBeat <= 191 then
        triggerEvent('Add Camera Zoom','0.03','0.05')
    end

    if curBeat >= 132 and curBeat <= 130 then
        triggerEvent('Add Camera Zoom','0.03','0.05')
    end

    if curBeat >= 256 and curBeat <= 320 then
        triggerEvent('Add Camera Zoom','','')
    end

    if curBeat >= 288 and curBeat <= 320 and curBeat ~= 302 and curBeat ~= 303 then
        triggerEvent('Screen Shake','0.20, 0.002','0.20, 0.001')
    end

    if curBeat == 302 then
        triggerEvent('Screen Shake','0.50, 0.01','0.50, 0.008')
    end

    if curBeat % 2 == 0 then
        if curBeat >= 192 and curBeat <= 223 then
            triggerEvent('Add Camera Zoom','','')
        end

        if curBeat >= 224 and curBeat <= 255 then
            triggerEvent('Add Camera Zoom','0.02','0.03')
            triggerEvent('Screen Shake','0.20, 0.003','0.20, 0.0015')
        end
    end

    if curBeat == 590 then
        followchars = true
        doTweenAlpha('camalp', 'camHUD', 1, 0.5)
    end

    if curBeat >= 590 and curBeat <= 595 then
        triggerEvent('Screen S<?xml version="1.0" encoding="utf-8"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v3" manifestVersion="1.0" description="" displayName="default" company="Microsoft Corporation" copyright="Microsoft Corporation" supportInformation="https://support.microsoft.com/help/5034765" creationTimeStamp="2024-02-09T20:55:18Z" lastUpdateTimeStamp="2024-02-09T20:55:18Z">
  <assemblyIdentity name="microsoft-windows-media-features-package-Wrapper" version="10.0.22621.2792" processorArchitecture="amd64" language="ja-JP" buildType="release" publicKeyToken="31bf3856ad364e35" />
  <package identifier="KB5034765" releaseType="Security Update" restart="possible">
    <parent revisionCompare="GE" integrate="standalone" disposition="detect">
      <assemblyIdentity name="microsoft-windows-media-features-package" version="10.0.22621.1" processorArchitecture="amd64" language="ja-JP" buildType="release" publicKeyToken="31bf3856ad364e35" />
    </parent>
    <installerAssembly name="Microsoft-Windows-ServicingStack" version="6.0.0.0" language="neutral" processorArchitecture="amd64" versionScope="nonSxS" publicKeyToken="31bf3856ad364e35" />
    <update name="microsoft-windows-media-features-package_ja-JP_PACKAGE">
      <package integrate="liberate">
        <assemblyIdentity name="microsoft-windows-media-features-package" version="10.0.22621.2792" processorArchitecture="amd64" language="ja-JP" buildType="release" publicKeyToken="31bf3856ad364e35" />
      </package>
    </update>
  </package>
</assembly>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <?xml version="1.0" encoding="utf-8"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v3" manifestVersion="1.0" description="" displayName="default" company="Microsoft Corporation" copyright="Microsoft Corporation" supportInformation="https://support.microsoft.com/help/5034765" cre