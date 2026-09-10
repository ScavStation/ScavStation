// Unpowered machinery.
//
// Some ScavStation maps have no power infrastructure at
// all and so stock /obj/machinery on such a map
// permanently carries the NOPOWER stat, making all machinery unpowered and therefore unusable
//
// Listing NOPOWER in stat_immune sidesteps the whole power layer:
//   * power_change() returns before it can ever raise the NOPOWER flag,
//   * the machine never registers for area power-change events, and
//   * the frame/circuitboard code stops expecting a power source.
// Combined with use_power = POWER_USE_OFF and zeroed usage vars, the result is a
// machine that behaves exactly like its powered cousin but ignores the grid.
//
// DM has no multiple inheritance, so anything that already descends from a more
// specific /obj/machinery subtype cannot inherit /obj/machinery/unpowered and has
// to repeat these overrides

/obj/machinery/unpowered
	abstract_type = /obj/machinery/unpowered
	stat_immune = NOSCREEN | NOINPUT | NOPOWER
	use_power = POWER_USE_OFF
	idle_power_usage = 0
	active_power_usage = 0
	uncreated_component_parts = null // No APC stock part

// A vending machine for maps with no power. Test object
/obj/machinery/vending/unpowered
	abstract_type = /obj/machinery/vending/unpowered
	base_type = /obj/machinery/vending/unpowered
	stat_immune = NOSCREEN | NOINPUT | NOPOWER
	use_power = POWER_USE_OFF
	idle_power_usage = 0
	active_power_usage = 0
	vend_power_usage = 0
