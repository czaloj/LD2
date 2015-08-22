package  
{
	import game.State;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{

		[Embed(source = "images/hotbarbg.png")]
		public var hbBG_Image:Class;
		public var hbBG:FlxSprite;

		public var state:State = null;
		
		public var jello:int = 1337;
		public var jelloText:JelloText;
		
		public var st:SkillTree;
		
		override public function create():void {
			super.create();

			//temporary blue background
			var tempWhite:FlxSprite = new FlxSprite(0, 0);
			tempWhite.makeGraphic(800, 600, 0xff66ccff);
			add(tempWhite);
			
			//hot bar stuff
			hbBG = new FlxSprite(0, 450, hbBG_Image);
			add(hbBG);
			//jello text on hot bar
			jelloText = new JelloText(this, 86, 555, 500, "");
			add(jelloText);
			// Create the game state here
			state = new State();
			
			//add the skill tree window
			st = new SkillTree(this);
			add(st);
		}
		
		override public function update():void {
			super.update();
		}
		
		public function next():void {
			//go back to menu
			FlxG.switchState(new MenuState());
		}
	}
}