# Blueprint Deconstruction Markers

A Factorio mod that lets blueprints **remove** existing entities, not just add or replace them.

## The problem

Blueprints can only add entities or replace what they overlap. If a blueprint needs a tile to end up
*empty*, there is no way to express that. You have to remember which entities to delete by hand, every
time.

## How it works

The mod adds a **deconstruction marker**: an item with no crafting recipe, which you place while
authoring a blueprint on every tile whose contents should be removed.

When the blueprint is stamped with **super-force build** (`Ctrl+Shift+Click`):

1. The marker collides with whatever is on that tile, so the game marks that entity for deconstruction
   (this is vanilla super-force behaviour).
2. The mod deletes the resulting marker ghost, so the marker itself is never built and never requests
   materials.

Net effect: the blueprint clears those tiles.

## Usage

**Authoring a blueprint**

1. Press `Alt+X`, or click the marker button on the shortcut bar, to put a marker in your cursor.
2. Place markers on the tiles that should end up empty. The cursor refills, so you can place many in
   a row. Press `Q` when done — nothing is left in your inventory.
3. Select the area into a blueprint, markers included.
4. Remove the placed markers (mine them, or use a deconstruction planner). They yield no items.

**Using the blueprint**

Stamp it with **super-force build** (`Ctrl+Shift+Click`). Normal and force build will not remove
anything — super-force is what performs the collision-based deconstruction.

## Notes

- The marker item has no recipe and cannot enter your inventory or a logistic network, so it can never
  be built by bots.
- Sharing a blueprint with someone who does not have the mod is safe: the game silently drops unknown
  entities on import. Their blueprint simply behaves like a normal one — it adds and replaces, but does
  not remove.
- Markers collide with the standard building collision mask, so they clear walls, turrets, assemblers,
  chemical plants and so on. Entities on other collision layers (rails, cliffs, resources) are not
  affected.

## License

MIT — see [LICENSE](LICENSE).
