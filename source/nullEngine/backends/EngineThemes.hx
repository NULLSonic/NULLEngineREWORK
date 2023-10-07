package nullEngine.backends;

import flixel.util.FlxColor;

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
        }
    }    
}