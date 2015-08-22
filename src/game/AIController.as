package game 
{
	import flash.utils.*;
	public class AIController 
	{
		public var entity:Entity = null;
		
		public function AIController() 
		{
			
		}
		
		public function chooseMovement(state:State):Number // Value between (-1, 1)
		{
			return 0.0;
		}
		
		public function chooseSkill(state:State, skills:Array):Skill
		{
			const bestSkills:Array = new Array();
			var bestPriority:int = 0;
			
			for each (var skill:Skill in skills)
			{
				var p:int = skill.canActivate(state);
				if (p == 0) continue;
				
				if (p == bestPriority)
				{
					bestSkills.push(skill);
				}
				else if (p > bestPriority)
				{
					if (bestSkills.length > 0)
					{
						bestSkills[0] = skill;
						bestSkills.length = 1;
					}
					else
					{
						bestSkills.push(skill);
					}
				}
			}
			
			return (bestSkills.length == 0) ? null : bestSkills[(int)(Math.random() * bestSkills.length)];
		}
		
		public function clone():AIController
		{
			var c:Class = Class(getDefinitionByName(getQualifiedClassName(this)));
			return new c();
		}
	}
}