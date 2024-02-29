function onCreatePost()
    callShader('createShader',{'greyscale', 'GreyscaleEffect'})
    callShader('runShader',{{'camGame'},'greyscale'})
    shaderVar('greyscale', 'strength', 0)

    callShader('createShader',{'scanline', 'ScanlineEffect'})
    callShader('runShader',{{'camGame'},'scanline'})
    shaderVar('scanline', 'strength', 0)
end

function callShader(func,vars)
    callScript('scripts/shader',func,vars)
end

function shaderVar(shader,var,value,type)
    callShader('setShaderVar',{shader,var,value,type})
end


function onEvent(event,v1,v2)

    
    local enable = 'on';
    local enableScanLines = 'off';

    if event == 'grayScaleShader' then
        
        if v1 ~= nil then
            enable = v1
        end

        if v2 ~= nil then
            enableScanLines = v2
        end

        if enable == 'on' then
            shaderVar('greyscale', 'strength', 1)
        else
            shaderVar('greyscale', 'strength', 0)
        end

        if enableScanLines == 'on' then
            shaderVar('scanline', 'strength', 10)
        else
            shaderVar('scanline', 'strength', 0)
        end
    end
end