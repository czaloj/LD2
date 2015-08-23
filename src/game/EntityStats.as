package game 
{
	public class EntityStats 
	{
		public static const AUGMENTOR:EntityStats = new EntityStats(15, 2, 1.0, 0.0, 0.0);
		public static const BARRIER:EntityStats = new EntityStats(400, 0, 1.0, 0.0, 0.0);
		public static const BOMBER:EntityStats = new EntityStats(40, 80, 1.0, 0.0, 150.0);
		public static const CLEAVER:EntityStats = new EntityStats(100, 18, 100.0, 0.0, 50.0);
		public static const DESTRUCTOR:EntityStats = new EntityStats(100, 30, 125.0, 0.0, 0.0);
		public static const FIGHTER:EntityStats = new EntityStats(200, 45, 100.0, 0.0, 0.0);
		public static const FREEZER:EntityStats = new EntityStats(100, 30, 130.0, 0.0, 150.0);
		public static const HEALER:EntityStats = new EntityStats(100, 30, 175, 0.0, 0.0);
		public static const SHOOTER:EntityStats = new EntityStats(100, 15, 1.0, 0.0, 50.0);
		
		public function EntityStats(h:int, a:int, m:Number, c:Number, s:Number)
		{
			health = h;
			attack = a;
			moveSpeed = m;
			criticalChance = c;
			attackSpeed = s;
		}
		
		public var health:int = 1;
		public var attack:int = 1;
		public var moveSpeed:Number = 1.0;
		public var criticalChance:Number = 0; // (0 - 1)
		public var attackSpeed:Number = 50; // (0 - 1)
	}

}