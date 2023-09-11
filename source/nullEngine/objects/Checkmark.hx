package nullEngine.objects;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class Checkmark extends FlxSprite
{
    var autoUpdate:Bool = false;
    var tex:FlxAtlasFrames;
    public function new(x:Float, y:Float, ?checked:Bool = false, ?autoUpdateColor:Bool)
    {
        super(x, y);

        autoUpdate = autoUpdateColor;

        tex = Paths.getSparrowAtlas('menus/nullEngine/options/checkmarks/' + FlxG.save.data.engineTheme);
        frames = tex;

        animation.addByPrefix('unchecked', 'unchecked', 24, true);
        animation.addByPrefix('checked', 'checked', 24, true);

        if (checked)
            animation.play('checked');
        else
            animation.play('unchecked');
    }

    override function update(elapsed:Float)
    {
        if (autoUpdate)
            tex = Paths.getSparrowAtlas('menus/nullEngine/options/checkmarks/' + FlxG.save.data.engineTheme);

        super.update(elapsed);
    }
}