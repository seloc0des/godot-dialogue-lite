# Dialogue (Lite)

Free branching dialogue for **Godot 4.5+**. Write conversations as data — speaker
lines, player choices, and event hooks — and show them with a drop-in dialogue
box. No code required to display a conversation.

Part of the **SELODEV** no-code system line. This is the free core, with its own
authoring dock and a Setup tab. **Dialogue (Pro)** adds conditions, flags &
variables, direct quest/inventory hooks, portraits, typewriter text,
localization, save-aware state, and conditions and actions in the dock.

## 5-minute setup

1. Copy `addons/dialogue_lite/` into your project.
2. **Project → Project Settings → Plugins →** enable **Dialogue (Lite)**. This
   registers the `DialoguesLite` autoload and adds the **Dialogue · Setup** and
   **Dialogue** docks.
3. In the **Dialogue** dock: **New Dialogue** → add nodes (speaker, line, optional
   event, next) → add choices → **Save**. Or skip this and use the demo's
   `healer_intro`.
4. Select your NPC → in **Dialogue · Setup** click **Talk to this NPC**, pick the
   conversation, click **Apply**. It adds a talk area, a trigger and the dialogue
   box for you.
5. Press Play and walk into the NPC. If the status line says nothing is marked
   as the player, select your player and click
   **Make the selected node the player** first.

The box shows lines, renders choice buttons, and advances on `ui_accept`
(Enter / Space). From code (optional), it's two calls:

```gdscript
func _ready() -> void:
    DialoguesLite.register(my_dialogue)   # a DialogueLite resource
    DialoguesLite.start("healer_intro")
```

## Authoring a conversation (data, not code)

A `DialogueLite` is an `entry` node id + a list of `DialogueNodeLite`:

- **speaker / text** — who's talking and what they say.
- **choices** — player options; each jumps to another node id. Empty = the box
  waits for the player to advance to `next`.
- **next** — the node to continue to (empty ends the conversation).
- **event** — an optional plain string fired when the node shows, e.g.
  `give_quest:gather_herbs`. Your game listens and decides what it means. In
  Lite that takes a line of code. Pro runs actions from the dock:

```gdscript
DialoguesLite.event_fired.connect(func(e):
    if e == "give_quest:gather_herbs":
        QuestsLite.start_quest("gather_herbs"))
```

See `demo/demo_dialogue.gd` for a full branching example.

## What's in the box

| | |
|---|---|
| `DialogueLite`, `DialogueNodeLite`, `DialogueChoiceLite` | data resources |
| `DialoguesLite` (autoload) | register / start / advance / choose + signals |
| `dialogue_box_lite.tscn` | drop-in UI |
| `DialogueTriggerLite` | starts a conversation on touch or on load (the Setup tab drops it in) |
| `demo/` | runnable sample conversation |
| `tools/verify.tscn` | headless self-test of the engine |

## Verify

```bash
godot --headless --path . res://tools/verify.tscn   # prints a transcript + PASS
```

## Upgrade

Outgrown Lite? **Dialogue (Pro)** on itch. MIT-licensed; use it in commercial games.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
