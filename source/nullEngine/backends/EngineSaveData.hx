package nullEngine.backends;

import flixel.text.FlxText.FlxTextAlign;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.FlxG;

using StringTools;
/**
 * The Engine's Save Data File Config. See and add save data here!
 */

class EngineSaveData
{
    static public function setupSaveData()
    {
        var save = FlxG.save.data;

        save.engineTheme = "ENGINE_PURPLE";
        save.foeArrowsHidden = false;

        //Hud Customize
        save.hudShown = true;
        save.hpBarShown = true;
        save.coloredHPBar = false;
        save.p1Color = "0xFF66FF33";
        save.p2Color = "0xFFFF0000";
        save.comboShown = true;
        save.comboTxtShown = true;

        //Score Text Customize
        save.scoreTxtX = 0;
        save.scoreTxtY = 684;

        save.scoreTxtFont = "vcr.ttf";
        save.scoreTxtSize = 24;
        save.scoreTxtColor = "WHITE";
        save.scoreTxtAlign = FlxTextAlign.CENTER;

        save.scoreTxtBorderStyle = FlxTextBorderStyle.OUTLINE;
        save.scoreTxtBorderColor = "BLACK";
        save.scoreTxtBorderSize = 2;
        save.scoreTxtBorderQuality = 1;

        save.scoreTxtShown = true;
        save.scoreTxtAnimation = "NONE";

        save.scoreTxtStretchX = 1.1;
        save.scoreTxtStretchy = 1.1;

        save.score = true;
        save.scoreTextStart = "Score: ";
        save.scoreTextEnd = "";

        save.misses = false;
        save.missesTextStart = "Misses: ";
        save.missesTextEnd = "";

        save.combo = false;
        save.comboTextStart = "Combo: ";
        save.comboTextEnd = "";

        save.highestCombo = false;
        save.highestComboTextStart = "(";
        save.highestComboTextEnd = ")";

        save.ghostTaps = false;
        save.ghostTapsTextStart = "Ghost Taps: ";
        save.ghostTapsTextEnd = "";

        //Judgement Counter Customize
        save.ratingsShown = true;
        save.ratingsCounter = false;
        save.ratingsCounterPos = "LEFT";

        //Scroll Options
        save.downscroll = false;
        save.middlescroll = false;

        //Gameplay Options
        save.ghostTapping = true;
        save.autoPause = true;

        //Visual Options
        save.flashingLights = true;
        save.camMovement = true;
        save.camZoom = true;
        save.fpsCounter = true;
        save.flippedOverlay = false;

        //Easter Eggs
        save.unlockedSonic = false;

        FlxG.save.flush();
    }
}