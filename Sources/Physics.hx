package;

class Physics {
	public static var gravity(default, null):Float = 3.2;

	public static function applyGravity(e: Entity, deltaTime:Float) {
		// trace(deltaTime);
		// trace(e);
		// trace(gravity);
		e.momentum.y += gravity * deltaTime;
	}
}