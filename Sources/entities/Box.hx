package entities;

import kha.Color;
import kha.graphics2.Graphics;

class Box extends Entity {
	public function new() {}
	public override function render(g: Graphics) {
		g.color = Color.Cyan;
		g.fillRect(this.position.x, this.position.y, 10, 10);
	}
	public override function update(deltaTime:Float) {
		super.update(deltaTime);
	}
}
