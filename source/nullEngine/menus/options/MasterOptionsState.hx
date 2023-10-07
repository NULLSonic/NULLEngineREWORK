package nullEngine.menus.options;

import nullEngine.backends.EngineThemes;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

class MasterOptionsState extends MusicBeatState
{
    var bg:FlxSprite;
    
    override function create()
    {
        EngineThemes.setColor("TURQUOISE");

        bg = new FlxSprite().loadGraphic(Paths.image("menus/nullEngine/menuDesat"));

        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.color = FlxColor.fromString(EngineThemes.colorTheme);

        add(bg);

        super.create();
    }
}