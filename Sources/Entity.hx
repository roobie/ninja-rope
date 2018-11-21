package;

import kha.math.FastVector2;
import kha.graphics2.Graphics;

class Entity {
	private static var idCounter:Int;

	// === components ===
	public var position:FastVector2;
	public var momentum:FastVector2;

	// public function new() {}

	public static function initDefaults(e: Entity) {
		e.position = new FastVector2(0, 0);
		e.momentum = new FastVector2(0, 0);
	}

	public function update(deltaTime:Float): Void {
		Physics.applyGravity(this, deltaTime);
		this.position = this.position.add(this.momentum);
	}
	public function render(g: Graphics): Void {}
}