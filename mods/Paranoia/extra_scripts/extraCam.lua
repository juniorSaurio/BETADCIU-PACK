local camerasCreated = {}
function createExtraCam(tag)
    if tag == nil then
        tag = 'extraCam'
    end
    for i, cams in pairs(camerasCreated) do
        if cams == tag then
            return
        end
    end
    table.insert(camerasCreated,tag)
    runHaxeCode(
        [[
            var cam = new FlxCamera();
            cam.bgColor = 0x00000000;
            setVar(']]..tag..[[',cam);
            FlxG.cameras.add(cam,false);
            FlxG.cameras.remove(game.camHUD,false);
            FlxG.cameras.add(game.camHUD,false);
            FlxG.cameras.remove(game.camOther,false);
            FlxG.cameras.add(game.camOther,false);
            return;
        ]]
    )
end
function removeExtraCam(tag)
    local camDestroyed = runHaxeCode(
        [[
            if(getVar(']]..tag..[[') != null){
                FlxG.cameras.remove(getVar(']]..tag..[['),false);
                return true;
            }
            return false;
        ]]
    )
    if camDestroyed then
        for i, cams in pairs(camerasCreated) do
            if cams == tag then
                table.remove(camerasCreated,i)
                break
            end
        end
    end
end
function onDestroy()
    local cams = '['
    for i, cameras in pairs(camerasCreated) do
        cams = cams.."'"..cameras.."'"
        if i < #camerasCreated then
            cams = cams..','
        else
            cams = cams..']'
        end
    end
    runHaxeCode(
        [[
            for(cams in []]..cams..[[]){
                if(getVar(cams)!= null){
                    FlxG.cameras.remove(getVar(cams),false);
                }
            }
            return;
        ]]
    )
end
function insertObjectOnCam(object,cam)
    if cam == nil then
        cam = 'extraCam'
    end
    runHaxeCode(
        [[
            var cam = getVar(']]..cam..[[');
            if(cam == null){
                for(lua in game.luaArray){
                    if(lua.scriptName == "mods/Mario Madness V2 - Lua Port/extra_scripts/extraCam.lua"){
                        lua.call('createExtraCam',["]]..cam..[["]);
                        cam = getVar("]]..cam..[[");
                        break;
                    }
                }
            }
            if(cam != null){
                if(game.getLuaObject("]]..object..[[") != null){
                    game.getLuaObject("]]..object..[[").cameras = [cam];
                }
                else if(game.members["]]..object..[["] != null){
                    game.]]..object..[[.cameras = [cam];
                }
                ]]..(version >= '0.7' and [[else if(game.uiGroup.members["]]..object..[["] != null){
                    game.uiGroup.]]..object..[[.cameras = [cam];
                }]] or '')..[[

            }
            return;
        ]]
    )
end