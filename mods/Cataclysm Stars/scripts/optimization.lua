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

function optimizeStage(nameStage)

    if nameStage == 'principal' then

        --removeFromMemory('backgrounds/act1/BG_GOD');
        removeFromMemory('backgrounds/act1/ANGEL_BG');
        removeFromMemory('backgrounds/act1/ALO');
        
    elseif nameStage == 'god_gorefield' then
        removeFromMemory('backgrounds/act2/BG_GOD_GOREFIELD');
        removeFromMemory('backgrounds/act2/tv_GOD'); 

    elseif nameStage == 'god_gorefield_lassagna' then
        removeFromMemory('backgrounds/act2/BG_LASAGNA_GOD');

    elseif nameStage == 'god_sansfield' then
        removeFromMemory('backgrounds/act2/marco_UNDERTALE_GOD');
        removeFromMemory('backgrounds/act2/BONES_GOD');

    elseif nameStage == 'cryfield_p1' then
        removeFromMemory('backgrounds/act3/BG_C')

    elseif nameStage == 'godfield_final' then
        removeFromMemory('backgrounds/act4/viento')
        removeFromMemory('backgrounds/act4/viento')
        removeFromMemory('characters/NERMALL_CRUCIFICCION')

    else
        return;  
    end
end