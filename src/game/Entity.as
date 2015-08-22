package game 
{
	public class Entity 
	{
		// Team for enemy
		public var team:int = Team.UNKNOWN;
		
		// A list of skills available to the Entity
		private const skills:Array = new Array();

		// This entity's special AI
		private var ai:AIController = null;
		
		// The skill in use by this entity
		private var skillExecutionFrame:int = 0;
		private var activeSkill:Skill = null;
		
		// Simple stats
		public const stats:EntityStats = new EntityStats();
		
		public function Entity(team:int) 
		{
			this.team = team;
		}
		
		// The decision step
		public function decide():void
		{
			if ((ai != null) && (activeSkill == null))
			{
				activeSkill = ai.chooseSkill(skills);
			}
		}
		
		// The acting step
		public function act():void
		{
			if (activeSkill != null)
			{
				skillExecutionFrame++;
				if (!activeSkill.execute(skillExecutionFrame))
				{
					activeSkill = null;
				}
			}
		}
	}
}