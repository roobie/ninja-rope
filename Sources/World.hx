package;

import box2D.dynamics.*;
import box2D.dynamics.contacts.*;
import box2D.common.math.*;

class TestContactListener extends B2ContactListener {
	override public function postSolve(contact:B2Contact, impulse:B2ContactImpulse):Void {
		trace(contact);
	}
}

class World {
	public var entities:Array<Entity> = [];

	public var b2scale(default, null): Float = 30;
	public var b2 = new B2World(new B2Vec2(0, 10.0), true);

	public function new() {
		b2.setContactListener(new TestContactListener());
	}
}