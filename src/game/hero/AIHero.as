package game.hero 
{
	import game.AIController;
	import game.State;
	
	public class AIHero extends AIController 
	{
		
		public function AIHero() 
		{
			super();
		}
		
		override public function chooseMovement(state:State):Number
		{
			return 1.0;
		}
	}

}