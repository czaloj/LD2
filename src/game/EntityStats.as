package game 
{
	public class EntityStats 
	{
		// Basic entity health
		public var health:int = 1000;
		
		// Mobility
		public var moveSpeed:Number = 1.0;
		
		// Defense
		public var armor:int = 0;
		
		// Offense
		public var attack:int = 30;
		public var criticalChance:Number = 0; // (0 - 1)
	}

}