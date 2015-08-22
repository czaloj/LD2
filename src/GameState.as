package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{
		
		override public function create():void {
			super.create();
		}
		
		override public function update():void {
			super.update();
		}
		
		public function next():void {
			FlxG.switchState(new MenuState());
		}
	}
}