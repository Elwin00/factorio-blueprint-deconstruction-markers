local ICON = "__blueprint-deconstruction-markers__/graphics/icons/deconstruction-marker.png"
local ICON_SIZE = 64

data:extend({
  {
    type = "simple-entity-with-owner",
    name = "bpdm-deconstruction-marker",
    icon = ICON,
    icon_size = ICON_SIZE,
    flags = { "placeable-neutral", "placeable-player", "player-creation", "not-on-map" },
    hidden = true,
    max_health = 1,
    -- Minable with no result: removing a marker destroys it, yields no item.
    minable = { mining_time = 0.05 },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    -- Most common collision mask of buildings
    collision_mask = {
      layers = {
        item = true,
        meltable = true,
        object = true,
        player = true,
        water_tile = true,
        is_object = true,
        is_lower_object = true,
      },
    },
    picture = {
      filename = ICON,
      width = ICON_SIZE,
      height = ICON_SIZE,
      scale = 0.5,
    },
  },
  {
    type = "item",
    name = "bpdm-deconstruction-marker",
    icon = ICON,
    icon_size = ICON_SIZE,
    subgroup = "tool",
    order = "z[bpdm-deconstruction-marker]",
    stack_size = 100,
    flags = { "spawnable", "only-in-cursor" },
    hidden = true,
    place_result = "bpdm-deconstruction-marker",
  },
  {
    type = "shortcut",
    name = "bpdm-give-marker",
    action = "spawn-item",
    item_to_spawn = "bpdm-deconstruction-marker",
    associated_control_input = "bpdm-give-marker",
    order = "z[bpdm-give-marker]",
    style = "default",
    icon = "__blueprint-deconstruction-markers__/graphics/shortcut/deconstruction-marker-x56.png",
    icon_size = 56,
    small_icon = "__blueprint-deconstruction-markers__/graphics/shortcut/deconstruction-marker-x24.png",
    small_icon_size = 24,
  },
  {
    type = "custom-input",
    name = "bpdm-give-marker",
    key_sequence = "ALT + X",
    action = "spawn-item",
    item_to_spawn = "bpdm-deconstruction-marker",
  },
})
