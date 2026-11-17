# Upgrading to the full Dialogue

Dialogue (Lite) is the free, working core: branching conversations, a drop-in box,
and per-node `event` hooks. When you outgrow it, **the full Dialogue** adds the parts
that get painful to hand-roll.

| | Lite (free) | Full |
|---|---|---|
| Speaker lines + player choices | ✅ | ✅ |
| Drop-in dialogue box | ✅ | ✅ (portraits, typewriter, theming) |
| Branching | ✅ (via choices) | ✅ + condition-gated |
| Reacting to dialogue | `event` string | direct quest/inventory/flag actions |
| Conditions / flags / variables | — | ✅ |
| Character portraits + expressions | — | ✅ |
| Typewriter / auto-advance | — | ✅ |
| Save-aware conversation state | — | ✅ |
| Localization (CSV / keys) | — | ✅ |
| Editor authoring dock | ✅ (lines, choices, events) | ✅ + conditions & actions |

Lite conversations keep working while Dialogue (Lite) stays installed. They don't import into the full version, which has its own resources (`Dialogue`, `DialogueNode`, `DialogueChoice`) and the `DialogueManager` autoload in place of `DialoguesLite`. You rebuild each conversation in the full dock. The id, speaker, text, next and choices fields keep their names, and the Lite `event` string becomes actions.

Get it on itch.io. Use it in any game you make, commercial or not.
