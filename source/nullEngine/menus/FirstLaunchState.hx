package nullEngine.menus;

import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;

class FirstLaunchState extends MusicBeatState
{
    var bg:FlxSprite;
    var logo:FlxSprite;
    var titleTxt:FlxText;
    var txt:FlxText;
    var nextState:String = "";
    var pressedKey:Bool = false;

    override function create()
    {

        bg = new FlxSprite().loadGraphic(Paths.image("menus/nullEngine/menuDesat"));

        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.color = 0xff3c1f83;

        add(bg);

        logo = new FlxSprite().loadGraphic(Paths.image("menus/nengine"));

        logo.setGraphicSize(Std.int(logo.width * 0.5));
        logo.updateHitbox();

        logo.x = FlxG.width - logo.width - 10;
        logo.y = 10;
        logo.angle = 7;

        add(logo);

        titleTxt = new FlxText(10, -20, FlxG.width, "First Launch", 64);

        titleTxt.angle = -7;
        titleTxt.antialiasing = true;

        titleTxt.setFormat(Paths.font("phantomMuff.ttf"), 64, FlxColor.WHITE, LEFT);
        titleTxt.setBorderStyle(OUTLINE, FlxColor.fromString("0xFF1d0d3a"), 8, 4);

        add(titleTxt);

        txt = new FlxText(0, 150, FlxG.width - 250, "", 32);

        txt.setFormat(Paths.font("phantomMuff.ttf"), 32, FlxColor.WHITE, CENTER);
        txt.setBorderStyle(OUTLINE, FlxColor.fromString("0xFF1d0d3a"), 4, 4);

        txt.screenCenter();
        txt.y -= 300;
        txt.antialiasing = true;

        #if web //Idk if this works, cus my browser won't start games made with HaxeFlixel...
            txt.text = "
            What is my engine doing on this website...";      
        #else
            txt.text = "
            Welcome to NULL Engine [REWORK]!!\n
            Seems like this is your first launch!\n
            If not, well one way this feature is bugged or you just deleted your save file. Anyway thank you for downloading and using NULL Engine!\n
            REMEMBER! This engine isn't aiming to be a modding engine, rather it aims to be fully customizable! Wan't a miss counter but no score counter? You can do that!\n
            Again, thank you for downloading and using the engine.\n- NULLSonic\n
            Press \"ENTER\" to exit this state!";
        #end

        add(txt);

        super.create();    
    }

    override function update(elapsed:Float)
    {
        if (!pressedKey)
        {
            if (FlxG.keys.justPressed.ENTER) {
                FlxG.camera.flash(FlxColor.WHITE, 1);
                FlxG.sound.play(Paths.sound("confirmMenu"));
                FlxG.save.data.firstLaunch = false;
                nextState = "Setup";
                pressedKey = true;
                var Timer:FlxTimer = new FlxTimer().start(1.5, changeState);
            }
        }
        super.update(elapsed);

    }

    function changeState(timer:FlxTimer):Void
        {
            LoadingState.loadAndSwitchState(new TitleState());
            //FlxG.save.data.firstLaunch = false;
        }
}