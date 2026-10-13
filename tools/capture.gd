extends Control

# Marketing capture: renders the demo windowed (needs a real GPU/display, NOT
# --headless), drives a full conversation on a timeline, and saves frames for a
# GIF plus two hero screenshots. Output lands in res://.capture/.

const DEMO := preload("res://demo/demo_dialogue.gd")
const OUT := "res://.capture/"

var _frame: int = 0
var _capturing: bool = false


func _ready() -> void:
	DisplayServer.window_set_size(Vector2i(900, 600))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT))
	DialoguesLite.register(DEMO.healer_intro())
	_run()


func _run() -> void:
	_capturing = true
	_capture_loop()

	await _wait(0.5)
	DialoguesLite.start("healer_intro")     # n1 + choices
	await _wait(1.6)
	await _shot("choices")                   # hero shot: line + choice buttons
	DialoguesLite.choose(0)                  # -> n2 (fires event)
	await _wait(1.6)
	await _shot("line")                      # hero shot: single speaker line
	DialoguesLite.advance()                  # -> n3
	await _wait(1.6)
	DialoguesLite.advance()                  # -> finish (box hides)
	await _wait(0.7)

	_capturing = false
	await _wait(0.2)
	get_tree().quit()


func _capture_loop() -> void:
	while _capturing:
		await RenderingServer.frame_post_draw
		_save(OUT + "gif_%03d.png" % _frame)
		_frame += 1
		await _wait(0.08)


func _shot(shot_name: String) -> void:
	await RenderingServer.frame_post_draw
	_save(OUT + "shot_%s.png" % shot_name)


func _wait(s: float) -> void:
	await get_tree().create_timer(s).timeout


func _save(path: String) -> void:
	var img := get_viewport().get_texture().get_image()
	img.save_png(ProjectSettings.globalize_path(path))
