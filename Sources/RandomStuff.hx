package;

import kha.math.FastVector2;
import kha.math.Random;
import entities.Box;

class RandomStuff {
	public static function box():Box {
		var r = Random.Default;
		var e = new Box();
		e.position = new FastVector2(r.GetUpTo(Game.currentWindowWidth), r.GetUpTo(Game.currentWindowHeight));
		e.momentum = new FastVector2(r.GetUpTo(4) - 2, r.GetUpTo(4) - 2);
		// e.momentum = new FastVector2(0, 0);
		return e;
	}
}
