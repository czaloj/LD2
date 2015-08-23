package game.slime 
{
	import game.AIController;
	import game.Skill;
	import game.State;
	
	public class AISlime extends AIController 
	{
		
		public function AISlime() 
		{
			super();
			
		}
		
		override public function chooseMovement(state:State):Number 
		{
			// Always move left
			return -1.0;
		}
	}

}