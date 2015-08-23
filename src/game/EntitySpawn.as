package game 
{
	import game.slime.AISlime;
	public class EntitySpawn 
	{
		private static const spawns:Object = new Object();
		
		public var ai:AIController = new AIController();
		public var skills:Array = new Array();

		private static function make(ai:AIController, ...skills):EntitySpawn
		{
			var spawn:EntitySpawn = new EntitySpawn();
			spawn.ai = ai;
			spawn.skills = skills;
			return spawn;
		}
		
		public static function spawn(type:String, team:int):Entity
		{
			return spawns[type].spawn(team);
		}
		
		{ // Static spawn creation
			spawns.fighter = make(new AISlime(), new Skill());
		}
		
		public function spawn(team:int):Entity
		{
			var s:Array = new Array();
			for each (var skill:Skill in skills) s.push(skill.clone());
			return new Entity(team, ai.clone(), s);
		}
	}

}