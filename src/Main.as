package 
{
	import org.flixel.*;
	import flash.events.Event;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author Cristian and Trevor
	 */
	[SWF(width = "800", height = "600", backgroundColor = "0xffffff")]
	public class Main extends FlxGame
	{
		
		
		public function Main():void 
		{
			//start up the menu
			super(800, 600, CreditState);
		}
		
		override protected function create(FlashEvent:Event):void
        {
            super.create(FlashEvent);
			//turn off annoying flixel stuff lol
            stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
            stage.removeEventListener(Event.ACTIVATE, onFocus);
			//turn the mouse on
			Mouse.show();
        }
	}
	
}