import flixel.addons.display.FlxBackdrop;
import openfl.Lib;

var headBG;

var funyBop = false;

function onCreate(){
    headBG = new FlxBackdrop(Paths.image('stages/virtual/headbg'), 0x11, 0, 1);
    headBG.scale.set(1.5, 1.5);
    headBG.updateHitbox();
	addBehindGF(headBG);
    headBG.alpha = 0.001;

    return;
}

function onBeatHit(){
    if (curBeat % 4 == 0){
        IMINYOURHEAD();
    }
    return;
}

function onEvent(n,v1,v2){

    if ( n == 'Triggers Paranoia'){

        if (v1 == '4'){
            funyBop = true;
            IMINYOURHEAD();
        }
    }
    return;
}


var funnyTween1:FlxTween;
var funnyTween2:FlxTween;
function IMINYOURHEAD(){
    if (funyBop){
        headBG.velocity.y = 1000;
        headBG.alpha = 1;

        if(funnyTween1 != null)
            funnyTween1.cancel();

        funnyTween1 = FlxTween.tween(headBG.velocity, {y: 0}, 0.4, {
            ease: FlxEase.quadOut,
            onComplete: function(twn:FlxTween) {
                funnyTween1 = null;
            }
        });

        if(funnyTween2 != null)
            funnyTween2.cancel();
        funnyTween2 = FlxTween.tween(headBG, {alpha: 0.25}, 0.4, {
            ease: FlxEase.quadOut,
            onComplete: function(twn:FlxTween) {
                funnyTween2 = null;
            }
        });
    }
}