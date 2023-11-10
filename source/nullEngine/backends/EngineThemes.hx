package nullEngine.backends;

import flixel.util.FlxColor;

using StringTools;
/**
 * The File to set the Engine Color Theme.
 */
class EngineThemes
{
    static public var colorTheme = "0xFFFFFFFF";
    static public function setColor(?color:String)
    {
        switch (color)
        {
            case ("RED"):
                colorTheme = "0xFFFF0000";
            case ("ORANGE"):
                colorTheme = "0xFFFFA500";
            case ("YELLOW"):
                colorTheme = "0xFFFFFF00";
            case ("LIME"):
                colorTheme = "0xFF32CD32";
            case ("GREEN"):
                colorTheme = "0xFF008000";
            case ("TURQUOISE"):
                colorTheme = "0xFF40E0D0";
            case ("CYAN"):
                colorTheme = "0xFF00FFFF";
            case ("BLUE"):
                colorTheme = "0xFF0000FF";
            case ("PURPLE"):
                colorTheme = "0xFF800080";
            case ("PINK"):
                colorTheme = "0xFFFFC0CB";
            case("WHITE"):
                colorTheme = "0xFFFFFFFF";
            case("BLACK"):
                colorTheme = "0xFF000000";

            //Engine Themes

            case ("ENGINE_RED"):
                colorTheme = "0xFFDD4F4F";
            case ("ENGINE_ORANGE"):
                colorTheme = "0xFFFF8222";
            case ("ENGINE_YELLOW"):
                colorTheme = "0xFFFFEE53";
            case ("ENGINE_LIME"):
                colorTheme = "0xFF00FF00";
            case ("ENGINE_GREEN"):
                colorTheme = "0xFF1B4B1B";
            case ("ENGINE_TURQUOISE"):
                colorTheme = "0xFF59C6BB";
            case ("ENGINE_CYAN"):
                colorTheme = "0xFF00EEFF";
            case ("ENGINE_BLUE"):
                colorTheme = "0xFF5900FF";
            case ("ENGINE_PURPLE"):
                colorTheme = "0xff3c1f83";
            case ("ENGINE_PINK"):
                colorTheme = "0xFFFF00D9";
        }
    }    
}