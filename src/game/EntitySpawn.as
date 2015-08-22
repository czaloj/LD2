package game 
{
	public class EntitySpawn 
	{
		public var ai:AIController = new AIController();
		public var skills:Array = new Array();
		
		public function spawn(team:int):Entity
		{
			var s:Array = new Array();
			for each (var skill:Skill in skills) s.push(skill.clone());
			return new Entity(team, ai.clone(), s);
		}
	}

}