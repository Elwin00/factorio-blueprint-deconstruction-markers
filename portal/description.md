Blueprints can add entities and replace what they overlap, but they cannot make a tile *empty*. If an upgrade blueprint needs to clear part of what is already built, you have to remember what to delete by hand, every single time.

This mod fixes that.

## How it works

It adds a **deconstruction marker**: an item with no crafting recipe, which you place while authoring a blueprint on every tile whose contents should be removed.

When the blueprint is stamped with **super-force build** (Ctrl+Shift+Click):

1. The marker collides with whatever is on that tile, so the game marks that entity for deconstruction — this is vanilla super-force behavior.
2. The mod deletes the resulting marker ghost, so the marker itself is never built and never requests materials.

The blueprint clears those tiles. Nothing is left behind.

## Usage

**Authoring a blueprint**

1. Press **Alt+X**, or click the marker button on the shortcut bar, to put a marker in your cursor.
2. Place markers on the tiles that should end up empty. The cursor refills, so you can place many in a row. Press **Q** when done — nothing is left in your inventory.
3. Select the area into a blueprint, markers included.
4. Remove the placed markers (mine them, or use a deconstruction planner). They yield no items.

**Using the blueprint**

Stamp it with **super-force build** (Ctrl+Shift+Click). Normal and force build will not remove anything — super-force is what performs the collision-based deconstruction.

## Notes

- The marker item has no recipe and cannot enter your inventory or a logistic network, so it can never be built by construction robots.
- Sharing a blueprint with someone who does not have the mod is safe: Factorio silently drops unknown entities on import. Their copy behaves like a normal blueprint — it adds and replaces, but does not remove.
- Markers use the standard building collision mask, so they clear walls, turrets, assemblers, chemical plants and similar. Entities on other collision layers (rails, cliffs, resources) are not affected.
