package nullEngine.backends;

import flixel.FlxG;

//################################################################\\
//# Pretty much ClientPrefs.hx in Psych Engine but like worse :P #\\
//################################################################\\

class EngineSave
{
    var save = FlxG.save.data;
    public function new(?setupOptions:Bool = false, ?setupEasterEggs:Bool = false)
    {
        if (setupOptions)
        {
            //########################\\
            //# Engine added Options #\\
            //########################\\

            save.engineTheme = "purple";
            save.botPlay = false;
            save.middleScroll = false;
            save.foeArrows = true;
            save.amongUsMode = false;

            //#####################\\
            //# Score HUD Options #\\
            //#####################\\

            save.hudShown = true;
            save.scoreTxt = true;

            save.scoreShown = true;
            save.missesShown = false;
            save.comboShown = false;
            save.highestComboShown = false;
            save.ghostTapsShown = false;

            //################\\
            //# Base Options #\\
            //################\\

            save.downScroll = false;
        }
    }
}