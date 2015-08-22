package  
{
	import game.State;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{
		public var state:State = null;
		
		override public function create():void {
			super.create();
			
			// Create the game state here
			state = new State();
		}
		
		override public function update():void {
			super.update();
		}
		
		public function next():void {
			FlxG.switchState(new MenuState());
		}
	}
}