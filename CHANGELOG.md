# Changelog: Dialogue (Lite)

## 1.2.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Dialogue · Setup and Dialogue tabs were blank on Godot 4.5.** Their tabs beside the
  Inspector had no title, so "open the Dialogue · Setup tab" pointed at nothing. They are named when
  the pack switches on now. Godot 4.7 was not affected.

## 1.2.2 (2026-09-28)

Answer choices from the keyboard.

- **Answer choices with the keyboard or a gamepad.** The first choice has focus, the arrows move,
  and Enter or Space picks.
- **No "invalid UID" warning on the first Play after saving a conversation.** Godot hadn't
  registered the new file yet, which put a yellow Debugger badge on screen.

## 1.2.1 (2026-09-27)

Installs without errors, and its tab works the moment you switch it on.

- **Its tab works the moment you switch it on.** Right after installing, Talk to this NPC left out
  the talk trigger until you restarted Godot.
- **No red errors when you install it.** Installing it filled the Output panel with "Failed to
  load script" errors before you'd even switched it on. Some of its scripts named a part of the
  pack that only exists once the pack is on.
- **The Dialogue tab scrolls.** It was taller than most screens, so Save and the status line under
  it were out of reach. The Setup tab fits a default-width dock too: headings and long buttons wrap,
  and a long conversation name no longer stretches it.

## 1.2.0 (2026-09-26)

Make an NPC talk without writing anything.

- **New Dialogue · Setup tab.** Select an NPC, pick **Talk to this NPC** and a conversation, press
  **Apply**: the NPC gets a talk area, a `DialogueTriggerLite` and the dialogue box. **Start when
  the scene loads** plays one as soon as the scene opens. Your conversations from
  `res://dialogues/` are listed first, then the demo's `healer_intro` as an example.
- **The talk trigger tells you when nothing will touch it**, next to a **Make the selected node the
  player** button.
- **`DialoguesLite.start_dialogue(resource)`** registers a conversation and starts it, so a `.tres`
  kept anywhere plays.
- **Adding a choice to a conversation you loaded from disk works.** It failed with "Array is in
  read-only state" when the node had no choices yet.
- **New nodes in the Dialogue tab take the first free id**, so ids no longer repeat after you delete
  one.
- **Edits you make in the Inspector survive the Dialogue tab's Save**, and after Save the editor's
  own save no longer writes an old copy back over the tab's later edits.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Switching the plugin off only removes the autoload if the plugin added it**, and closing
  the editor no longer removes it at all. A project that declares it itself, like the starter
  kits, keeps it.
- **"Apply node fields" no longer undoes what you changed in the Inspector.** The Dialogue tab
  wrote every field of its node form back on Apply, so a speaker, line, event or next node you'd
  changed on that node in the Inspector went back to what the form showed. Apply now writes only
  the fields you changed in the tab.
- **The Dialogue tab shows Inspector changes straight away.** Change a node or a choice in the
  Inspector (or undo one) and the tab's node form and its lists show it. Anything you've typed in
  the form and not applied yet stays. If you change the same field in both places, the later edit
  wins.

## 1.1.2 — 2026-08-10

Safer download.

- **The download can't damage a project you're already working on.** It now unzips into one folder named after the pack, instead of putting files loose at the top. Before this, unzipping it straight into an existing game overwrote that game's name, its start-up scene and the list of add-ons you had switched on. It can't reach any of that now.
- **Added START-HERE.txt and INSTALLING.txt** at the top of the folder — what's in the download, the two-minute install, and what to do if something goes wrong. Plain text, opens anywhere.
- **Fixed: the docs pointed at a self-test file that wasn't there.** They said `tools/verify.tscn`; in the download it's `tools/dialogue_lite/verify.tscn`. The paths now match what's actually in the box.

## 1.1.1

- Fix: the dialogue box now consumes its advance input, so a walk-up NPC can't re-open the conversation on the same key press.

## 1.1.0

- Added a no-code **editor dock**: author dialogues / nodes / choices / events in a panel, save to `.tres`.

## 1.0.0

- Initial release.
- `DialogueLite` / `DialogueNodeLite` / `DialogueChoiceLite` data resources.
- `DialoguesLite` autoload: register / start / advance / choose + signals.
- Drop-in `dialogue_box_lite.tscn` (speaker line, choice buttons, keyboard advance).
- Per-node `event` hooks for decoupled game reactions.
- Demo: branching "Healer" conversation with a quest-giving event.
- Headless `tools/verify.tscn` — 7 automated checks.
