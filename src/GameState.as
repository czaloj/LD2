package  
{
	import game.State;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{
		public var state:State = null;

		[Embed(source = "images/skilltreebg.png")]
		public var skillTreeBG_Image:Class;
		
		public var skillTreeWindow:FlxGroup;
		public var skillTreeBG:FlxSprite;
		
		public var skillTreeOpened:Boolean = false;
		
		override public function create():void {
			super.create();
			// Create the game state here
			state = new State();

			skillTreeWindow = new FlxGroup();
			
			skillTreeBG = new FlxSprite(100, 80, skillTreeBG_Image);
			skillTreeWindow.add(skillTreeBG);
			add(skillTreeWindow);
			//skillTreeWindow.visible = false;
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.justPressed("E")) {
				if (skillTreeOpened) {
					skillTreeBG.y = 80;
					skillTreeBG.velocity.y = 2300;
					//skillTreeWindow.visible = false;
					skillTreeOpened = false;
				} else {
					skillTreeBG.y = 600;
					skillTreeBG.velocity.y = -2300;
					//skillTreeWindow.visible = true;
					skillTreeOpened = true;
				}
			}
			if (skillTreeBG.y < 80) {
				skillTreeBG.velocity.y = 0;
				skillTreeBG.y = 80;
			}
		}
		
		public function next():void {
			FlxG.switchState(new MenuState());
		}
	}
}