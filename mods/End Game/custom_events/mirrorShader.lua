local isMovementXYcamGame = false;
local tweenXYcamGame = 0;
local velocitycamGame = 0.2;

local isMovementXYcamHUD = false;
local tweenXYcamHUD = 0;
local velocitycamHUD = 0.2;

local typeDetaultCamGame = 'x';
local typeDetaultCamHUD = 'x';

function onCreatePost()

    callShader('createShader',{'mirror', 'MirrorRepeatEffect'})
    callShader('runShader',{'camGame','mirror'})
    shaderVar('mirror', 'zoom', 1)
    shaderVar('mirror', 'angle', 0)

    callShader('createShader',{'mirrorHUD','MirrorRepeatEffect'})
	callShader('runShader',{'camHUD','mirrorHUD'})
	shaderVar('mirrorHUD','enableClone',true,'bool')
    shaderVar('mirrorHUD', 'zoom', 1)
    shaderVar('mirrorHUD', 'angle', 0)
end

function callShader(func,vars)
    callScript('scripts/shader',func,vars)
end

function shaderVar(shader,var,value,type)
    callShader('setShaderVar',{shader,var,value,type})
end

function shaderTween(shader,var,value,time,easing)
    callShader('tweenShaderValue',{shader,var,value,time,easing})
end

function onEvent(event,v1,v2)
    if event == 'mirrorShader' then

        local type = 'zoom'
        local value = 1
        local layer = 'camGame'
        local time = 2
        local easing = 'cubeIn'

        if v1 ~= '' then
            local comma1v1 = 0
            local comma2v1 = 0
            comma1v1,comma2v1 = string.find(v1,',',0,true)
            if comma1v1 ~= nil then
                local comma3v1 = 0
                local comma4v1 = 0
                comma3v1,comma4v1 = string.find(v1,',',comma2v1 + 1)
                if comma3v1 ~= nil then
                    value = string.sub(v1,comma2v1 + 1,comma3v1 - 1)
                    layer = string.sub(v1,comma4v1 + 1)
                else
                    value = string.sub(v1,comma2v1 + 1)
                end
                type = string.sub(v1,0,comma1v1 - 1)
            else
                type = v1
            end
        end
        if v2 ~= '' then
            local comma1v2 = 0
            local comma2v2 = 0
            comma1v2,comma2v2 = string.find(v2,',',0,true)
            if comma1v2 ~= nil then
                time = tonumber(string.sub(v2,0,comma1v2 - 1))
                easing = string.sub(v2,comma2v2 + 1)
            else
                time = tonumber(v2)
            end
        end

        if layer == 'camGame' then

            if type == 'x' or type == 'y' then
                if easing == 'on' then
                    isMovementXYcamGame = true;
                    typeDetaultCamGame = type;
                    velocitycamGame = value;
                else
                    isMovementXYcamGame = false;
                    tweenXYcamGame = 0
                    shaderTween('mirror', type, 0, stepCrochet*0.001*2, 'expoIn')    
                end
            else
                shaderTween('mirror', type, value, stepCrochet*0.001*4*time, easing)   
            end
        elseif layer == 'camHUD' then
            if type == 'x' or type == 'y' then
                if easing == 'on' then
                    isMovementXYcamHUD = true;
                    typeDetaultCamHUD = type;
                    velocitycamHUD = value;
                else
                    isMovementXYcamHUD = false
                    tweenXYcamHUD = 0
                    shaderTween('mirrorHUD', type, 0, stepCrochet*0.001*2, 'expoIn')
                end
            else
                shaderTween('mirrorHUD', type, value, stepCrochet*0.001*4*time, easing)
            end
        end
    end
end

function onStepHit()

    if isMovementXYcamGame then
        shaderTween('mirror', typeDetaultCamGame, tweenXYcamGame, stepCrochet*0.001*2, 'expoIn')    
        tweenXYcamGame = tweenXYcamGame + velocitycamGame;
    end

    if isMovementXYcamHUD then
        shaderTween('mirror', typeDetaultCamHUD, tweenXYcamHUD, stepCrochet*0.001*2, 'expoIn')    
        tweenXYcamHUD = tweenXYcamHUD + velocitycamHUD;
    end
end