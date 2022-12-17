return;

import funkin.menus.FreeplayState;
function updatePost(elapsed) {
    if (Std.isOfType(FlxG.state, FreeplayState)) { // is in freeplay
        // for (i in FlxG.state.iconArray.members) i.x = 0;
        // for (i in FlxG.state.grpSongs.members) i.x = 10;

        for (i in FlxG.state.grpSongs.members) {
            // i.setGraphicSize(FlxG.width / 2, FlxG.height / 5);
            i.screenCenter();
        }
    }
}

import flixel.FlxG;
import funkin.system.Conductor;
import funkin.ui.Alphabet;

static var wavyAlphabet = true;
var time:Float = 0;

function update(elapsed) {
    if (!wavyAlphabet) return;
    
    time += elapsed;
    var curState = FlxG.state;
    while(curState != null) {
        curState.forEach(function(spr) {
            if (Std.isOfType(spr, Alphabet)) {
                var i = 0;
                spr.forEach(function(letter) {
                    letter.y = spr.y + (Math.sin((time + (i / 4)) * Math.PI) * 10);
                    i++;
                });
            }
        }, true);
        curState = curState.subState;
    }
}