# Quick Start: Dialogue (Lite)

Goal: a talking NPC with a choice, in about 5 minutes, with no code.

## 1. Install

- Copy `addons/dialogue_lite/` into your project.
- Enable **Dialogue (Lite)** in Project Settings → Plugins. That adds the
  `DialoguesLite` autoload and two docks: **Dialogue · Setup** and **Dialogue**.

## 2. Make an NPC talk (Dialogue · Setup)

1. Open your level and select the NPC in the Scene tree.
2. In **Dialogue · Setup**, click **Talk to this NPC**.
3. Pick a conversation. Yours from `res://dialogues/` come first, then the
   demo's `healer_intro` as an example.
4. Click **Apply**.

Apply gives the NPC a `TalkArea` (an Area2D or Area3D with a round shape) with a
`TalkTrigger` inside it (an NPC that already is an Area2D or Area3D gets the
trigger directly), and adds `dialogue_box_lite.tscn` on a `UILayer` if the
scene doesn't have a box yet. Press Play and walk your player into the NPC: the
conversation starts.

The trigger only reacts to the node in the `player` group. If nothing in the
scene is in it yet, the status line says so: select your player and click
**Make the selected node the player**. Your player also needs its own collision
shape to touch anything.

**Start when the scene loads** plays the conversation as soon as the scene
opens, with no NPC involved.

Re-pick and Apply to swap the conversation: it updates the same trigger. The
`TalkTrigger` is a plain `DialogueTriggerLite` node, so you can also drag another
`.tres` onto its **Dialogue** field in the Inspector.

## 3. Write a conversation (Dialogue)

In the **Dialogue** dock: **New Dialogue**, give it an id, then **Add node** for
each line (speaker, text, optional event, next) and add choices. **Save** writes
a `.tres` into `res://dialogues/`. Back in **Dialogue · Setup**, press
**Refresh** and pick it.

Conversations are plain data, so you can also build one in a script:

```gdscript
static func greeter() -> DialogueLite:
    var d := DialogueLite.new()
    d.id = "greeter"
    d.entry = "hello"

    var hello := DialogueNodeLite.new()
    hello.id = "hello"
    hello.speaker = "Guard"
    hello.text = "Halt. Friend or foe?"
    var friend := DialogueChoiceLite.new()
    friend.text = "Friend."
    friend.next = "welcome"
    hello.choices = [friend]      # a choice waits for the player

    var welcome := DialogueNodeLite.new()
    welcome.id = "welcome"
    welcome.speaker = "Guard"
    welcome.text = "Then pass, friend."
    # no `next` and no choices -> conversation ends

    d.nodes = [hello, welcome]
    return d
```

## 4. Start it from code (optional)

```gdscript
func _ready() -> void:
    DialoguesLite.register(greeter())

func _on_player_pressed_talk() -> void:
    DialoguesLite.start("greeter")
```

## 5. React to a conversation (optional)

Fire a per-node `event` string and listen for it. This is how dialogue drives the
rest of your game without coupling to it:

```gdscript
welcome.event = "open_gate"

DialoguesLite.event_fired.connect(func(e):
    if e == "open_gate":
        $Gate.open())
```

## Controls

The box advances on the `ui_accept` action (Enter / Space) and shows choice
buttons when a node has choices. Change the advance action on the box's
`advance_action` property.

## Next

- Branch by giving a node multiple choices with different `next` ids.
- Chain into quests: fire `give_quest:<id>` and call `QuestsLite.start_quest(...)`.
- Conditions, flags, portraits, typewriter text, save-aware state, and conditions
  and actions in the dock come with **Dialogue (Pro)**.
