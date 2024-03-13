function onCreatePost()
    callShader('createShader',{'ca', 'ChromAbEffect',true})
    callShader('runShader',{{'camGame'},'ca'})
    shaderVar('ca', 'strength', 0)
end

function callShader(func,vars)
    callScript('scripts/shader',func,vars)
end

function shaderVar(shader,var,value,type)
    callShader('setShaderVar',{shader,var,value,type})
end


function onEvent(event,v1,v2)
    
    local strength = 0.005;

    if event == 'chromAbShader' then

        if v1 ~= nil then
            strength = v1
        end

        shaderVar('ca', 'strength', strength)
    end
end
