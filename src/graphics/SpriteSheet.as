package graphics 
{
	public class SpriteSheet 
	{
		//projectiles
		[Embed(source = "../images/ShooterBullet.png")]
		public static var shooterBullet:Class;
		
		[Embed(source = "../images/FreezerBullet.png")]
		public static var freezerBullet:Class;
		
		[Embed(source = "../images/BomberBomb.png")]
		public static var bomberBomb:Class;
		
		[Embed(source = "../images/BombShatter.png")]
		public static var bombShatter:Class;
		
		/**
		 * SLIMES
		 */
		
		[Embed(source = "../images/kingslime.png")]
		public static var slimeKing:Class;
		
		[Embed(source = "../images/Shooter.png")]
		public static var slimeShooter:Class;

		[Embed(source = "../images/Cleaver.png")]
		public static var slimeCleaver:Class;

		[Embed(source = "../images/Bomber.png")]
		public static var slimeBomber:Class;
		
		[Embed(source = "../images/Barrier.png")]
		public static var slimeBarrier:Class;
		
		[Embed(source = "../images/Destructer.png")]
		public static var slimeDestructor:Class;
		
		[Embed(source = "../images/Healer.png")]
		public static var slimeHealer:Class;
		
		[Embed(source = "../images/Augmentor.png")]
		public static var slimeAugmentor:Class;
		
		[Embed(source = "../images/Freezer.png")]
		public static var slimeFreezer:Class;

		[Embed(source = "../images/Miner.png")]
		public static var slimeMiner:Class;
		
		[Embed(source = "../images/Fighter.png")]
		public static var slimeFighter:Class;
		
		/**
		 * HEROES
		 */
		
		[Embed(source = "../images/hero_warrior.png")]
		public static var heroMelee:Class;
		[Embed(source = "../images/hero_warrior_2.png")]
		public static var heroMelee2:Class;
		[Embed(source = "../images/hero_warrior_frozen.png")]
		public static var heroMelee_frozen:Class;
		
		[Embed(source = "../images/miner.png")]
		public static var heroRanger:Class;
		
		[Embed(source = "../images/miner.png")]
		public static var heroMage:Class;
	}
}