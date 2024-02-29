function onCreate()
    addHaxeLibrary('Assets','openfl.utils');
end

function removeFromMemory(path,removeImageInstantly)
    if(path ~= nil) then
        if removeImageInstantly == nil then
            removeImageInstantly = true
        end
        runHaxeCode(
            [[
                var foundPath = Paths.getPath("images/]]..path..[[.png");
                if(Assets.cache.hasBitmapData(foundPath)){
                    Assets.cache.removeBitmapData(foundPath);
                }
                if(!FlxG.bitmap._cache.exists(foundPath)){
                    foundPath = Paths.modsImages("]]..path..[[");
                }
                if(!FlxG.bitmap._cache.exists(foundPath)){
                    foundPath = '';
                }

                if(foundPath == ''){
                    return;
                }
        
                var modGraphic = FlxG.bitmap._cache.get(foundPath);
                if(modGraphic != null){
                    FlxG.bitmap.removeByKey(foundPath);
                    if(Paths.currentTrackedAssets.exists(foundPath)){
                        Paths.currentTrackedAssets.remove(foundPath);
                    }
                    if(Paths.localTrackedAssets.contains(foundPath)){
                        Paths.localTrackedAssets.remove(Paths.localTrackedAssets.indexOf(foundPath));
                    }
                    modGraphic.persist = false;
                    modGraphic.destroyOnNoUse = true;
                    if(]]..tostring(removeImageInstantly)..[[){
                        modGraphic.destroy();
                    }
                }
            ]]
        )
    end
end

function removeCharacterFromMemory(character,removeImageInstantly)
    local foundedImage = runHaxeCode(
        [[
            var imageFile = '';
            var charName = "]]..character..[[";
            var char = null;

            if(game.boyfriendMap.exists(charName)){
                char = game.boyfriendMap.get(charName);
                game.boyfriendGroup.remove(char,true);
                game.boyfriendMap.remove(charName);
            }
            if(game.dadMap.exists(charName)){
                char = game.dadMap.get(charName);
                game.dadGroup.remove(char,true);
                game.dadMap.remove(charName);
            }
            if(game.gfMap.exists(charName)){
                char = game.gfMap.get(charName);
                game.gfGroup.members.remove(char,true);
                game.gfGroup.remove(char,true);
                game.gfMap.remove(charName);
            }
            
            if(char != null){
                imageFile = char.imageFile;
                char.kill();
                char.destroy();
            }

            if(imageFile != null && imageFile != ''){
                return imageFile;
            }
            return false;
        ]]
    )

    if foundedImage ~= false then
        removeFromMemory(foundedImage,removeImageInstantly ~= false)
    end
end

function onCreatePost()
    removeCharacterFromMemory('bf-dead')
    removeFromMemory('logo');
    runHaxeCode(
        [[
            if(!game.isPixelStage){
                Assets.cache.clear('assets/shared/images/pixelUI');
            }
            return;
        ]]
    )
end

function optimizeStage(subPath,stage)

        local stages = {};

        if stage == 'allstarsAct1' then

            stages = {'act1','act1_bgbuildings','act1_floor','act1_sky','act1_skyline','act1_stat','Act_2_Intro','act1_gradient'}

        elseif stage == 'hellhole' then

            stages = {'SKY','Back','infernogroundp1','infernogroundp2'}

        elseif stage == 'mazeZardy' then

            stages = {'maze'}

        elseif stage == 'tordBot' then

            stages = {'TordBG','skiBG'}

        elseif stage == 'closetYuri' then

            stages = {'closetBG'}

        elseif stage == 'impostorRoom' then
            
            stages = {'graybg'}

        elseif stage == 'piracy' then
            
            stages = {'piracy_bg2'}
        
        elseif stage == 'nes' then
            
            stages = {'nesBG','border','scanlines3'}

        elseif stage == 'sansSex' then
            
            stages = {'sexstage'}

        elseif stage == 'pokemonBattle' then
            
            stages = {'BG-Amusia','FG-Amusia', 'static-overlay'}

        elseif stage == 'doxxieRoom' then
            
            stages = {'bg2'}

        elseif stage == 'bootlegRoom' then

            stages = {'facelessBG','massacreBG','pillarServed','roomBootleg'}

        elseif stage == 'style' then
            
            stages = {'ruv'}

        elseif stage == 'unbeatable' then
            
            stages = {'bars','nesglitch','static','epiphany'}

        elseif stage == 'nightmare' then
            
            stages = {'nightmare2','nightmare1'}

            removeFromMemory('backgrounds/unbeatable/estatica_uwu');

        elseif stage == 'stream' then
            
            stages = {'direct bg back','direct bg grey'}

        elseif stage == 'act3' then

            stages = {'act3Spotlight','act3'}

        elseif stage == 'mansion' then
            
            stages = {'BG'}

        elseif stage == 'cavern' then
            
            stages = {'BackWall','Ground','BGSKULL'}

        else
            return;
        end

        for i,image in pairs(stages) do
            removeFromMemory('backgrounds/' .. subPath .. '/' .. image);
        end
end