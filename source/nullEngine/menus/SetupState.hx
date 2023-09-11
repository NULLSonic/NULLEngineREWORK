package nullEngine.menus;

import nullEngine.objects.Checkmark;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;

class SetupState extends MusicBeatState
{
    var bg:FlxSprite;
    var logo:FlxSprite;
    var titleTxt:FlxText;
    var checkmarkEx:Checkmark;
    override function create()
    {
        FlxG.mouse.visible = true;

        bg = new FlxSprite().loadGraphic(Paths.image("menus/nullEngine/menuDesat"));

        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.color = 0xff3c1f83;

        logo = new FlxSprite().loadGraphic(Paths.image("menus/nengine"));

        logo.setGraphicSize(Std.int(logo.width * 0.5));
        logo.updateHitbox();

        logo.x = FlxG.width - logo.width - 10;
        logo.y = 10;
        logo.angle = 7;

        titleTxt = new FlxText(10, -20, FlxG.width, "Setup", 64);

        titleTxt.angle = -7;
        titleTxt.antialiasing = true;

        titleTxt.setFormat(Paths.font("phantomMuff.ttf"), 64, FlxColor.WHITE, LEFT);
        titleTxt.setBorderStyle(OUTLINE, FlxColor.fromString("0xFF1d0d3a"), 8, 4);

        checkmarkEx = new Checkmark(75, 600, false, false);

        checkmarkEx.setGraphicSize(Std.int(checkmarkEx.width * 0.25));
        checkmarkEx.updateHitbox();

        add(bg);
        add(logo);
        add(titleTxt);
        add(checkmarkEx);

        super.create();    
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.G)
            FlxG.save.data.engineTheme = "green";

        super.update(elapsed);
    }
}