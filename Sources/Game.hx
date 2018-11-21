package;

import kha.Color;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.math.Random;

class Game {
	public static var currentWindowWidth(default, null):Int;
	public static var currentWindowHeight(default, null):Int;
	public static var lastFrameTime(default, null):Float = 0;
	public static var lastDelta(default, null):Float = 0;
	public static var world(default, null):World;

	public static function init():Void {
		var seed = 1293812;
		Random.init(seed);
		world = new World();

		var props = Config.combinedSettings;

		System.start({title: "Con Cat", width: props.windowWidth, height: props.windowHeight}, function(window) {
			windowResized(window.width, window.height);
			window.notifyOnResize(windowResized); // Just loading everything is ok for small projects

			Assets.loadEverything(function() {
				for (i in 0...1000) {
					world.entities.push(RandomStuff.box());
				}

				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function() {
					update();
				}, 0, 1 / 60);
				System.notifyOnFrames(function(frames) {
					render(frames);
				});
			});
		});
	}

	static function update():Void {
		var delta = Scheduler.time() - lastFrameTime;
		lastFrameTime = Scheduler.time();
		lastDelta = delta;

		for (e in world.entities) {
			e.update(delta);
			if (e.position.x < 0 || e.position.x > currentWindowWidth) {
				world.entities.remove(e);
				trace("Removed entity $e");
			} else if (e.position.y < 0 || e.position.y > currentWindowHeight) {
				world.entities.remove(e);
				trace("Removed entity $e");
			}
		}
	}

	static function render(frames:Array<Framebuffer>):Void {
		var g2 = frames[0].g2;

		// set default font
		g2.font = Assets.fonts.ProggyClean;

		g2.begin();
		g2.color = Color.Black;
		g2.clear();

		g2.color = Color.White;
		g2.drawString(Std.string(lastDelta), 10, 10);
		for (e in world.entities) {
			e.render(g2);
		}

		g2.end();
		// if (Random.Default.GetUpTo(10) < 1) {}
		world.entities.push(RandomStuff.box());
	}

	static function windowResized(width, height) {
		currentWindowWidth = width;
		currentWindowHeight = height;
	}
}
