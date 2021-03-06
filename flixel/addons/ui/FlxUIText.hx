package flixel.addons.ui;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFormat;
import flixel.text.FlxText;

/**
 * Simple extension to the basic text field class. Basically, 
 * this lets me stick drop-shadows on things :)
 * @author Lars Doucet
 */

class FlxUIText extends FlxText implements IResizable implements IFlxUIWidget 
{
	public var id:String; 
	
	public var dropShadow(get, set):Bool;	
	private var _dropShadow:Bool = false;
	
	public function new(X:Float, Y:Float, Width:Int, Text:String = null, size:Int=8, EmbeddedFont:Bool = true)	
	{
		super(X, Y, Width, Text, size, EmbeddedFont);
	}
	
	public function resize(w:Float, h:Float):Void {
		width = w;
		height = h;
		calcFrame();
	}
		
	//For IResizable:
	public function get_width():Float {
		return width;
	}	
	public function get_height():Float {
		return height;
	}
	
	public function textWidth():Float {	return _textField.textWidth; }
	public function textHeight():Float { return _textField.textHeight; }
	
	public function get_dropShadow():Bool {
		return _dropShadow;
	}
	
	public function forceCalcFrame():Void {
		_regen = true;
		calcFrame();
	}
	
	public function set_dropShadow(b:Bool):Bool {
		_dropShadow = b;
		
		if (_dropShadow) 
		{
			//TODO: add these back in later:
			//addFilter(new GlowFilter(_shadow, 1, 2, 2, 2, 1, false, false));
			//addFilter(new DropShadowFilter(1, 45, _shadow, 1, 1, 1, 0.25));
		} 
		else
		{
			//removeAllFilters();
		}
		
		return _dropShadow;
	}	
		
	
	public function getTextField()
	{
		return _textField;
	}
	
}
