package game 
{
	public class AIController 
	{
		public function AIController() 
		{
			
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
	}
}