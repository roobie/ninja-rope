package entities;

import motion.easing.Quad;
import kha.math.Random;
import kha.Color;
import kha.math.FastVector2;
import kha.graphics2.Graphics;
import box2D.dynamics.*;
import box2D.collision.shapes.*;
import motion.*;
import motion.actuators.*;

class Box extends Entity {
	public var body:B2Body;
	public var currentMomentumTween:Any = null;

	public function new() {
		// var bodyDef = new B2BodyDef();
		// bodyDef.position.set(250 / Game.world.b2scale, 200 / Game.world.b2scale);
		// bodyDef.type = DYNAMIC_BODY;
		// var circle = new B2CircleShape(10 / Game.world.b2scale);
		// var fixture = new B2FixtureDef();
		// fixture.shape = circle;
		// this.body = Game.world.b2.createBody(bodyDef);
		// this.body.createFixture(fixture);
	}

	public override function render(g:Graphics) {
		g.color = Color.Cyan;
		g.fillRect(this.position.x, this.position.y, 10, 10);
	}

	public override function update(deltaTime:Float) {
		super.update(deltaTime);
		if (currentMomentumTween == null) {
			// var path = new MotionPath().bezier(1, 2, 3, 4); // quadratic, 1 control point
			// .bezierN(200, 200, [50, 100], [50, 100]) // general, any number of control points
			// .bezierSpline([100, 100], [50, 50]) // spline, passing through the given points
			// .line(20, 20); // linear
			currentMomentumTween = Actuate.tween(this.momentum, 0.12, {
				y: -3
			})
			.ease(Quad.easeIn)
			.delay(1.5)
			.onComplete(function() {
					trace('complete');
					currentMomentumTween = null;
				});
		}
	}
}
