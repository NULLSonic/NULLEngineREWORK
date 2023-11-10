package nullEngine.menus.options;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.text.FlxText;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUITabMenu;
import flixel.util.FlxColor;
import flixel.FlxG;
import nullEngine.backends.EngineThemes;
import flixel.FlxSprite;

class HUDEditorState extends MusicBeatState
{
    var bg:FlxSprite;
    var scoreTxt:FlxText;

    var uiBox:FlxUITabMenu;

    var hpColor1Txt:FlxInputText;
    var hpColor2Txt:FlxInputText;
    var scoreTxtAnimationTxt:FlxInputText;

    override function create()
    {
        FlxG.mouse.visible = true;

        EngineThemes.setColor(FlxG.save.data.engineTheme);

        bg = new FlxSprite().loadGraphic(Paths.image("menus/nullEngine/menuDesat"));

        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.color = FlxColor.fromString(EngineThemes.colorTheme);

        add(bg);

        addScoreTxt();

        var tabs = [
            {name: "Options",  label: "Options"},
            {name: "ScoreTxt",  label: "Score Text"},
        ];

        uiBox = new FlxUITabMenu(null, tabs, null);
        uiBox.resize(FlxG.width * 0.2, FlxG.height * 0.95);

        add(uiBox);

        addOptionsUI();
        addScoreTxtUI();

        super.create();
    }

    function addScoreTxt()
    {
        scoreTxt = new FlxText(FlxG.save.data.scoreTxtX, FlxG.save.data.scoreTxtY, FlxG.width, "", FlxG.save.data.scoreTxtSize);
    
        EngineThemes.setColor(FlxG.save.data.scoreTxtColor);
        scoreTxt.setFormat(Paths.font(FlxG.save.data.scoreTxtFont), FlxG.save.data.scoreTxtSize, FlxColor.fromString(EngineThemes.colorTheme), FlxG.save.data.scoreTxtAlign);
            
        EngineThemes.setColor(FlxG.save.data.scoreTxtBorderColor);
        scoreTxt.setBorderStyle(FlxG.save.data.scoreTxtBorderStyle, FlxColor.fromString(EngineThemes.colorTheme), FlxG.save.data.scoreTxtBorderSize, FlxG.save.data.scoreTxtBorderQuality);
    
        add(scoreTxt);
    }

    function addOptionsUI()
    {
        var hudShown = new FlxUICheckBox(5, 25, null, null, "Show Hud?", 75);
        hudShown.checked = FlxG.save.data.hudShown;
        hudShown.callback = function()
        {
            if (hudShown.checked)
                FlxG.save.data.hudShown = true;
            else
                FlxG.save.data.hudShown = false;
        }

        var hpBarShown = new FlxUICheckBox(5, 50, null, null, "Show HP Bar?", 75);
        hpBarShown.checked = FlxG.save.data.hpBarShown;
        hpBarShown.callback = function()
        {
            if (hpBarShown.checked)
                FlxG.save.data.hpBarShown = true;
            else
                FlxG.save.data.hpBarShown = false;
        }

        var colorHpBar = new FlxUICheckBox(105, 50, null, null, "Colored Hp Bar?", 75);
        colorHpBar.checked = FlxG.save.data.coloredHPBar;
        colorHpBar.callback = function()
        {
            if (colorHpBar.checked)
                FlxG.save.data.coloredHPBar = true;
            else
                FlxG.save.data.coloredHPBar = false;
        }

        var hpColor1 = new FlxUIInputText(5, 75, 70, FlxG.save.data.p1Color, 8);
        hpColor1Txt = hpColor1;

        var hpColor2 = new FlxUIInputText(105, 75, 70, FlxG.save.data.p2Color, 8);
        hpColor2Txt = hpColor2;

        var colorSave = new FlxButton(5, 100, "Save Colors", updateHPColors);
        var colorReset = new FlxButton(105, 100, "Reset Colors", resetHPColors);

        var comboShown = new FlxUICheckBox(5, 125, null, null, "Show Combo?", 75);
        comboShown.checked = FlxG.save.data.comboShown;
        comboShown.callback = function()
        {
            if (comboShown.checked)
                FlxG.save.data.comboShown = true;
            else
                FlxG.save.data.comboShown = false;
        }

        var comboTxtShown = new FlxUICheckBox(105, 125, null, null, "Show Combo Sprite?", 75);
        comboTxtShown.checked = FlxG.save.data.comboTxtShown;
        comboTxtShown.callback = function()
        {
            if (comboTxtShown.checked)
                FlxG.save.data.comboTxtShown = true;
            else
                FlxG.save.data.comboTxtShown = false;
        }

        var ratingsShown = new FlxUICheckBox(5, 150, null, null, "Show Ratings?", 75);
        ratingsShown.checked = FlxG.save.data.ratingsShown;
        ratingsShown.callback = function()
        {
            if (ratingsShown.checked)
                FlxG.save.data.ratingsShown = true;
            else
                FlxG.save.data.ratingsShown = false;
        }

        var tabGroupOptions = new FlxUI(null, uiBox);
		tabGroupOptions.name = "Options";

		tabGroupOptions.add(hudShown);
        tabGroupOptions.add(hpBarShown);
        tabGroupOptions.add(colorHpBar);
        tabGroupOptions.add(hpColor1);
        tabGroupOptions.add(hpColor2);
        tabGroupOptions.add(colorSave);
        tabGroupOptions.add(colorReset);
        tabGroupOptions.add(comboShown);
        tabGroupOptions.add(comboTxtShown);
        tabGroupOptions.add(ratingsShown);

        uiBox.addGroup(tabGroupOptions);
    }

    function addScoreTxtUI()
    {
        var scoreTxtShown = new FlxUICheckBox(5, 25, null, null, "Show Score Text?", 75);
        scoreTxtShown.checked = FlxG.save.data.scoreTxtShown;
        scoreTxtShown.callback = function()
        {
            if (scoreTxtShown.checked)
                FlxG.save.data.scoreTxtShown = true;
            else
                FlxG.save.data.scoreTxtShown = false;
        }

        var scoreTxtAnimation = new FlxUIInputText(105, 25, 70, FlxG.save.data.scoreTxtAnimation, 8);
        scoreTxtAnimationTxt = scoreTxtAnimation;

        var scoreTxtPlayAnim = new FlxButton(5, 50, "Play Animation", playScoreTxtAnim);

        var tabGroupScoreTxt = new FlxUI(null, uiBox);
		tabGroupScoreTxt.name = "ScoreTxt";

        tabGroupScoreTxt.add(scoreTxtShown);
        tabGroupScoreTxt.add(scoreTxtAnimation);
        tabGroupScoreTxt.add(scoreTxtPlayAnim);

        uiBox.addGroup(tabGroupScoreTxt);
    }

    var uiBoxHidden = false;
    override function update(elapsed:Float)
    {
        updateScoreTxt();

        if (FlxG.keys.justReleased.F1) {
            if (uiBoxHidden) {
                uiBoxHidden = false;
                FlxTween.tween(uiBox, { x: 0}, 1, {
                    ease: FlxEase.elasticOut,
                    type: ONESHOT
                });
            } else {
                uiBoxHidden = true;
                FlxTween.tween(uiBox, { x: 0 - uiBox.width - 10}, 1, {
                    ease: FlxEase.elasticIn,
                    type: ONESHOT
                });
            }
        }

        if (hpColor1Txt.hasFocus || hpColor2Txt.hasFocus || scoreTxtAnimationTxt.hasFocus)
        {}
        else {
            if (FlxG.keys.pressed.SHIFT) {
                if (controls.BACK)
                    FlxG.switchState(new MainMenuState(transIn));
            } else {
                if (controls.BACK)
                    FlxG.switchState(new MasterOptionsState(transIn));
            }
        }

        super.update(elapsed);                
    }

    function updateHPColors():Void
    {
        FlxG.save.data.p1Color = hpColor1Txt.text;
        FlxG.save.data.p2Color = hpColor2Txt.text;

        trace("P1 Color: " + FlxG.save.data.p1Color);
        trace("P2 Color: " + FlxG.save.data.p2Color);
    }

    function resetHPColors():Void
    {
        FlxG.save.data.p1Color = "0xFF66FF33";
        FlxG.save.data.p2Color = "0xFFFF0000";

        hpColor1Txt.text = FlxG.save.data.p1Color;
        hpColor2Txt.text = FlxG.save.data.p2Color;

        trace("Reset Health Bar Color!");
        trace("P1 Color: " + FlxG.save.data.p1Color);
        trace("P2 Color: " + FlxG.save.data.p2Color);
    }

    var txt:String = "";
    function updateScoreTxt()
    {
        if (!FlxG.save.data.scoreTxtShown)
            scoreTxt.visible = false;
        else
            scoreTxt.visible = true;

        txt = ""; //Always clears the txt so no weird stuf happens.     
        txt += FlxG.save.data.scoreTextStart + "0" + FlxG.save.data.scoreTextEnd;
    
        scoreTxt.text = txt;
    }

    function playScoreTxtAnim():Void
    {
        if (scoreTxtAnimationTxt.text == "STRETCH_X" || FlxG.save.data.scoreTxtAnimation == "STRETCH_X") {
            scoreTxt.scale.x = 1.1;
            FlxTween.tween(scoreTxt.scale, { x: 1 }, 0.25, {
                ease: FlxEase.linear,
                type: ONESHOT
            });
        }
    }
}