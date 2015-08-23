package game 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
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

		// Physics and positional information
		public const center:Point = new Point();
		public const halfRect:Rectangle = new Rectangle();
		
		// Simple stats
		public const stats:EntityStats = new EntityStats(0, 0, 0, 0, 0);
		
		public function Entity(team:int, ai:AIController, skills:Array) 
		{
			this.team = team;
			this.ai = ai;
			ai.entity = this;
			for each (var skill:Skill in skills) {
				skill.entity = this;
				this.skills.push(skill);
			}
		}
		
		// The decision step
		public function decide(state:State):void
		{
			if ((ai != null) && (activeSkill == null))
			{
				activeSkill = ai.chooseSkill(state, skills);
			}
		}
		
		// The acting step
		public function act(state:State):void
		{
			if (activeSkill != null)
			{
				skillExecutionFrame++;
				if (!activeSkill.execute(state, skillExecutionFrame))
				{
					activeSkill = null;
				}
			}
			else
			{
				//center.x += ai.chooseMovement(state) * stats.moveSpeed;
			}
		}
	}
}