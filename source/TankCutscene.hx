package;

import flixel.FlxSprite;
#if (flixel >= "5.3.0")
	import flixel.sound.FlxSound;
#else
	import flixel.system.FlxSound;
#end

class TankCutscene extends FlxSprite
{
	public var startSyncAudio:FlxSound;

	public function new(x:Float, y:Float)
	{
		super(x, y);
	}

	var startedPlayingSound:Bool = false;

	override function update(elapsed:Float)
	{
		if (animation.curAnim.curFrame >= 1 && !startedPlayingSound)
		{
			startSyncAudio.play();
			startedPlayingSound = true;
		}

		super.update(elapsed);
	}
}
