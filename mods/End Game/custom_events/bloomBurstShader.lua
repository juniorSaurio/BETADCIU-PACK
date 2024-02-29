function onCreatePost()
    callShader('createShader',{'ca', 'ChromAbEffect'})
    callShader('runShader',{{'camGame','camHUD'},'ca'})
    shaderVar('ca', 'strength', 0)

    callShader('createShader',{'bloom2', 'BloomEffect'})
    callShader('runShader',{{'camGame','camHUD'},'bloom2'})

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

function bloomBurst(strength)
    shaderVar('bloom2', 'effect', 0.25)
    shaderVar('bloom2', 'strength', strength)
    shaderVar('ca', 'strength', 0.008)
    shaderTween('bloom2', 'effect', 0, stepCrochet*0.001*16, 'cubeOut')
    shaderTween('bloom2', 'strength', 0, stepCrochet*0.001*16, 'cubeOut')
    shaderTween('ca', 'strength', 0, stepCrochet*0.001*16, 'cubeOut')
end


function onEvent(event,v1,v2)
    
    local strength = 3;

    if event == 'bloomBurstShader' then

        if v1 ~= nil then
            strength = v1
        end

        bloomBurst(strength);
    end
end
