package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class MenuState extends FlxState 
	{
		
		override public function create():void {
			super.create();
			next();
		}
		
		override public function update():void {
			super.update();
		}
		
		public function next():void {
			FlxG.switchState(new GameState());
		}
	}
}