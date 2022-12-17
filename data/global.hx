// main week hud, botplay toggle, notesplashes on newgrounds builds

import funkin.game.PlayState;

var botplay:Bool = true;
var vanillaHud:Bool = true;

function postUpdate(elapsed) {
    if (PlayState.instance != null) { // is in game
        if (botplay) {
            PlayState.instance.notes.forEach(function(n) {
                if (n.strumTime <= Conductor.songPosition)
                    PlayState.instance.goodNoteHit(n);
            });

            /*
            PlayState.instance.playerStrums.forEach(function(p) {
                p.animation.finishCallback = function(a) {
                    if (a == 'confirm')
                        p.playAnim('static');
                }
            });
            */
        }

        for (i in [PlayState.instance.accuracyTxt, PlayState.instance.missesTxt])
            i.visible = (vanillaHud) ? false : true;
    }
}

function onPlayerHit(event:NoteHitEvent) {
    trace('test');

    var notesplash = new FlxSprite();
    notesplash.frames = Paths.getSparrowAtlas('noteSplashes');
    notesplash.cameras = [camHUD];

    notesplash.animation.addByPrefix('note1-0', 'note impact 1  blue', 24, false);
    notesplash.animation.addByPrefix('note2-0', 'note impact 1 green', 24, false);
    notesplash.animation.addByPrefix('note0-0', 'note impact 1 purple', 24, false);
    notesplash.animation.addByPrefix('note3-0', 'note impact 1 red', 24, false);
    notesplash.animation.addByPrefix('note1-1', 'note impact 2 blue', 24, false);
    notesplash.animation.addByPrefix('note2-1', 'note impact 2 green', 24, false);
    notesplash.animation.addByPrefix('note0-1', 'note impact 2 purple', 24, false);
    notesplash.animation.addByPrefix('note3-1', 'note impact 2 red', 24, false);

    notesplash.setPosition(event.note.x, event.note.y);
    notesplash.alpha = 0.6;
    notesplash.animation.play('note' + event.note.noteData + '-' + FlxG.random.int(0, 1), true);
    notesplash.animation.finishCallback = function(a) {
        notesplash.remove();
    }
    add(notesplash);

    notesplash.animation.curAnim.frameRate += FlxG.random.int(-2, 2);
    notesplash.updateHitbox();
    notesplash.offset.set(width * 0.3, height * 0.3);
}

/*
function onKeyShit(event:InputSystemEvent)
    if (botplay) event.cancel();
*/