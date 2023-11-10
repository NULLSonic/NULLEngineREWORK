package nullEngine.menus.options;

import flixel.group.FlxGroup.FlxTypedGroup;
import nullEngine.backends.EngineSaveData;
import nullEngine.backends.EngineThemes;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

class MasterOptionsState extends MusicBeatState
{
    var bg:FlxSprite;
    var overlay:FlxSprite;

    var grpMenu:FlxTypedGroup<Alphabet>;
    var optionsCategorys:Array<String> = [
        'Keybinds',
        'Preferences',
        'Visual',
        'Gameplay',
        'Extras'
    ];
    var curSelected = 0;
    
    override function create()
    {
        EngineThemes.setColor(FlxG.save.data.engineTheme);

        bg = new FlxSprite().loadGraphic(Paths.image("menus/nullEngine/menuDesat"));

        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.color = FlxColor.fromString(EngineThemes.colorTheme);

        add(bg);

        grpMenu = new FlxTypedGroup<Alphabet>();
		add(grpMenu);

        for (i in 0...optionsCategorys.length)
        {
            var option:Alphabet = new Alphabet(0, (70 * i) + 30, optionsCategorys[i], true, false);
            option.isMenuItem = true;
            option.targetY = i;
            grpMenu.add(option);
        }

        curSelected = 0;
		changeSelection();

        overlay = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/nullEngine/optionsOverlay"));
        overlay.setGraphicSize(Std.int(overlay.width * 1.01));
        overlay.updateHitbox();
        overlay.screenCenter();

        add(overlay);

        super.create();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        var upP = controls.UI_UP_P;
        var downP = controls.UI_DOWN_P;
        var accepted = controls.ACCEPT;
    
        if (upP)
        {
            changeSelection(-1);
        }
        if (downP)
        {
            changeSelection(1);
        }
    
        if (accepted)
        {
            if (curSelected == 2)
                FlxG.switchState(new HUDEditorState(transIn));
        }

        if (controls.BACK)
            FlxG.switchState(new MainMenuState(transIn));
            
    }

    function changeSelection(change:Int = 0):Void
        {
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
    
            curSelected += change;
    
            if (curSelected < 0)
                curSelected = optionsCategorys.length - 1;
            if (curSelected >= optionsCategorys.length)
                curSelected = 0;
    
            var bullShit:Int = 0;
    
            for (item in grpMenu.members)
            {
                item.targetY = bullShit - curSelected;
                bullShit++;
    
                item.alpha = 0.6;
                // item.setGraphicSize(Std.int(item.width * 0.8));
    
                if (item.targetY == 0)
                {
                    item.alpha = 1;
                    // item.setGraphicSize(Std.int(item.width));
                }
            }
        }
}