package;

class Config {
	public static var defaultSettings(get, null): GlobalProperties;
	public static var userSettings(get, null): GlobalProperties;
	public static var combinedSettings(get, null): GlobalProperties;

	public static function get_defaultSettings() {
		return new GlobalProperties(
			1200, 720
		);
	}

	/**
	 * TODO: implement function to read user's settings
	 */
	public static function get_userSettings() {
		return get_defaultSettings();
	}

	public static function get_combinedSettings() {
		// TODO: merge defaultSettings and userSettings
		return get_defaultSettings();
	}
}