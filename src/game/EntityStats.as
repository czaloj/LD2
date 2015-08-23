package game 
{
	public class EntityStats 
	{
		public static const AUGMENTOR:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const BARRIER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const BOMBER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const CLEAVER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const DESTRUCTOR:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const FIGHTER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const FREEZER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const HEALER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		public static const SHOOTER:EntityStats = new EntityStats(100, 30, 1.0, 0.0);
		
		public function EntityStats(h:int, a:int, m:Number, c:Number)
		{
			health = h;
			attack = a;
			moveSpeed = m;
			criticalChance = c;
		}
		
		public var health:int = 1;
		public var attack:int = 1;
		public var moveSpeed:Number = 1.0;
		public var criticalChance:Number = 0; // (0 - 1)
	}

}