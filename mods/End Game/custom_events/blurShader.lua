function onCreatePost()

    callShader('createShader',{'blur', 'BlurEffect',true})
    callShader('runShader',{{'camGame','camHUD'},'blur'})
    shaderVar('blur', 'strength', 0)
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

    local type = 'set';
    local strength = 3;

    if event == 'blurShader' then
        
        if v1 ~= nil then
            type = v1
        end

        if v2 ~= nil then
            strength = v2
        end 

        if type == 'tween' then
            shaderTween('blur', 'strength', strength, stepCrochet*0.001*4, 'cubeOut')
        elseif type == 'set' then
            shaderVar('blur','strength',strength)
        end
    end
end