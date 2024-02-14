// shader stuff lmao
var shadName:String = 'test3';
game.initLuaShader(shadName);
game.initLuaShader('test5');
var test;
var test5;
//

function onCreatePost(){ 

    test = game.createRuntimeShader(shadName);
    test5 = game.createRuntimeShader('test5');

    game.camGame.filters = [new ShaderFilter(test), new ShaderFilter(test5)];
    game.camHUD.filters = [new ShaderFilter(test), new ShaderFilter(test5)];
    //game.camOther.filters = [new ShaderFilter(test), new ShaderFilter(test5)];
    return;
}

var lol:Float = 0;
function onUpdate(el){

    lol += el;
    test.setFloat('time', lol);

    return;
}