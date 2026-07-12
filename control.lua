local MARKER = "bpdm-deconstruction-marker"

---@param event EventData.on_built_entity
local function on_player_built(event)
  local e = event.entity
  if not (e and e.valid) then return end

  if e.name == "entity-ghost" then
    if e.ghost_name == MARKER then
      e.destroy()
    end
  elseif e.name == MARKER then
    local player = game.get_player(event.player_index)
    if player and player.cursor_stack and not player.cursor_stack.valid_for_read then
      player.cursor_stack.set_stack({ name = MARKER, count = 1 })
    end
  end
end

script.on_event(defines.events.on_built_entity, on_player_built, {
  { filter = "ghost_name", name = MARKER },
  { filter = "name", name = MARKER },
})

---@param event EventData.on_robot_built_entity
local function on_robot_built(event)
  local e = event.entity
  if e and e.valid and e.name == MARKER then
    e.destroy()
  end
end

script.on_event(defines.events.on_robot_built_entity, on_robot_built, {
  { filter = "name", name = MARKER },
})

---@param event EventData.script_raised_built
local function on_script_built(event)
  local e = event.entity
  if e and e.valid and e.name == "entity-ghost" and e.ghost_name == MARKER then
    e.destroy()
  end
end

script.on_event(defines.events.script_raised_built, on_script_built)