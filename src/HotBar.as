package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HotBar extends FlxSprite 
	{
		[Embed(source = "images/hotbarbg.png")]
		public var hbBG_Image:Class;
		
		public var jelloText:JelloText;
		public var gameStateRef:GameState;
		
		public function HotBar(gameStateRefIn:GameState) 
		{
			super(0, 450, hbBG_Image);
			gameStateRef = gameStateRefIn;
		}
		
		override public function update():void {
			super.update();
		}
		
		public function createJelloText():void {
			//jello text on hot bar
			jelloText = new JelloText(gameStateRef, 86, 555, 500, "");
			gameStateRef.add(jelloText);
		}
	}

}