extends Control

const DEMO := preload("res://demo/demo_dialogue.gd")


func _ready() -> void:
	_dialogues_lite().register(DEMO.healer_intro())
	_dialogues_lite().event_fired.connect(func(e: String) -> void: print("[demo] event fired: ", e))


func _on_talk_pressed() -> void:
	if not _dialogues_lite().is_active():
		_dialogues_lite().start("healer_intro")


# DialoguesLite is looked up when used instead of named. A script that names an
# autoload won't compile until the plugin that adds it is switched on, so a fresh
# install printed parse errors.
const DIALOGUES_LITE := preload("res://addons/dialogue_lite/dialogue_manager_lite.gd")


static func _dialogues_lite() -> DIALOGUES_LITE:
	return (Engine.get_main_loop() as SceneTree).root.get_node(^"DialoguesLite") as DIALOGUES_LITE
