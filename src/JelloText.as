package  
{
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class JelloText extends FlxText 
	{
		public var gameStateRef:GameState;
		public function JelloText(gameStateRefIn:GameState, X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true) 
		{
			super(X, Y, Width, Text, EmbeddedFont);
			gameStateRef = gameStateRefIn;
			size = 22;
			color = 0xff000000;
		}
		
		override public function update():void {
			text = "" + gameStateRef.jello;
		}
		
	}

}