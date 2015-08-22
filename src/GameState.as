package  
{
	import game.GameExecutionState;
	import game.State;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{
		public var state:State = null;
		
		//resource
		public var jello:int = 1337;
		
		public var st:SkillTree;
		public var hb:HotBar;
		
		override public function create():void {
			super.create();

			//temporary blue background
			var tempWhite:FlxSprite = new FlxSprite(0, 0);
			tempWhite.makeGraphic(800, 600, 0xff66ccff);
			add(tempWhite);
			
			//hot bar stuff
			hb = new HotBar(this);
			add(hb);
			hb.createJelloText();
			
			// Create the game state here
			state = new State();
			
			//add the skill tree window
			st = new SkillTree(this);
			add(st);
		}
		
		override public function update():void {
			super.update();
			
			switch (state.executionState)
			{
				case GameExecutionState.HEROES_WON:
					// TODO
					break;
				case GameExecutionState.SLIMES_WON:
					// TODO
					break;
				case GameExecutionState.PAUSED:
					break;
				case GameExecutionState.STILL_PLAYING:
					state.update();
					break;
				default:
					// Shouldn't happen
					break;
			}
		}
		
		public function next():void {
			//go back to menu
			FlxG.switchState(new MenuState());
		}
	}
}