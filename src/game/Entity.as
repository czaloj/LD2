package game 
{
	public class Entity 
	{
		// Team for enemy
		public var team:int = Team.UNKNOWN;
		
		// A list of skills available to the Entity
		private var skills:Array = new Array();
		
		public function Entity(team:int) 
		{
			this.team = team;
		}
	}
}