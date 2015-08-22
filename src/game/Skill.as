package game 
{
	public class Skill 
	{
		// Owner of the skill
		public var entity:Entity = null;
		
		// Returns a priority number for activation (highest wins)
		// Zero if it can't or shouldn't activate.
		public function canActivate(state:State):int
		{
			return 0;
		}
		
		// Once a skill has been chosen for execution, it will be 
		// executed until it determines it is not to be executed
		public function execute(state:State, frame:int):Boolean
		{
			return false;
		}
	}
}