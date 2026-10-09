; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 16m 23s; total estimated time: 23m 10s
; total layer number: 72
; total filament length [mm] : 638.08
; total filament volume [cm^3] : 1534.76
; total filament weight [g] : 1.90
; model label id: 104,115,126,137,148
; object max height: 1.50,7.20,0.80,1.00,1.00
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 7.20
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #171717
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 40
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.1
; initial_layer_speed = 25
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 100
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.1
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20260513 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG90\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != \"by object\"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 6000,6000
; machine_max_acceleration_x = 6000,6000
; machine_max_acceleration_y = 6000,6000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20260513 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S250\n{endif}\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T220\n    M109 S220 ;set nozzle to common flush temp\n{else}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n{endif}\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M109 S220 H300\n{else}\n    M109 S{flush_temperatures[initial_no_support_extruder]} H300\n{endif}\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of \"draw extrinsic para cali paint\"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = AirGap Orbit Puck A1 PLA
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.4
; support_on_build_plate_only = 1
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = snug
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 50
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R23
M201 X6000 Y6000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20260513 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220

    M104 S220

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F299.339 T220
    M109 S220 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A


    M109 S220 H300

G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R22
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R22
G1 X-48.2 F3000
M73 P4 R22
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F59.781
    M983 F0.99635 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P6 R21
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F0.99635 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P7 R21
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F0.99635 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P26 R17
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
M73 P26 R16
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
M73 P27 R16
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X92.4593 Y93.5765 I71.0815 J68.8471
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F143.474
    G0 X133 E.3742  F239.124
    G0 X138 E.3742  F956.496
    G0 X143 E.3742  F239.124
    G0 X148 E.3742  F956.496
    G0 X153 E.3742  F239.124
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F143.474
    G0 X133 E.3742  F239.124
    G0 X138 E.3742  F956.496
    G0 X143 E.3742  F239.124
    G0 X148 E.3742  F956.496
    G0 X153 E.3742  F239.124
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.1
; LAYER_HEIGHT: 0.1
G1 E-.8 F1800
; layer num/total_layer_count: 1/72
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.542 Y160.063 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X114.52 Y160.112 E.00103
G3 X112.879 Y161.227 I-1.681 J-.708 E.04091
M73 P28 R16
G1 X95.44 Y161.227 E.34002
G3 X93.656 Y159.443 I.039 J-1.823 E.05432
G1 X93.656 Y142.004 E.34002
G3 X95.44 Y140.22 I1.823 J.039 E.05432
G1 X112.879 Y140.22 E.34002
G3 X114.663 Y142.004 I-.039 J1.823 E.05432
G1 X114.663 Y159.443 E.34002
G3 X114.625 Y159.775 I-1.823 J-.039 E.00652
G1 X114.558 Y160.006 E.00468
M204 S6000
G1 X114.086 Y159.925 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
M73 P29 R16
G1 X114.079 Y159.929 E.00015
G3 X112.867 Y160.749 I-1.235 J-.52 E.03018
G1 X95.451 Y160.749 E.33957
G3 X94.134 Y159.432 I.023 J-1.34 E.04015
G1 X94.134 Y142.016 E.33957
G3 X95.451 Y140.699 I1.34 J.023 E.04015
G1 X112.867 Y140.699 E.33957
G3 X114.184 Y142.016 I-.023 J1.34 E.04015
G1 X114.184 Y159.432 E.33957
G3 X114.156 Y159.682 I-1.34 J-.023 E.00491
G1 X114.102 Y159.867 E.00377
; WIPE_START
G1 X114.079 Y159.929 E-.02509
G1 X113.961 Y160.16 E-.09852
G1 X113.796 Y160.361 E-.09876
G1 X113.596 Y160.526 E-.09869
G1 X113.367 Y160.648 E-.09873
G1 X113.118 Y160.723 E-.09877
G1 X112.867 Y160.749 E-.09571
G1 X112.484 Y160.749 E-.14573
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.306 Y153.161 Z.5 F42000
G1 X114.744 Y139.901 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X114.919 Y140.046 E.00443
G3 X115.056 Y140.443 I-.462 J.381 E.00836
G1 X115.056 Y161.004 E.40088
G3 X114.439 Y161.62 I-.606 J.01 E.01896
G1 X93.879 Y161.62 E.40088
G3 X93.263 Y161.004 I-.01 J-.606 E.01896
G1 X93.263 Y140.443 E.40088
G3 X93.879 Y139.827 I.606 J-.01 E.01896
G1 X114.511 Y139.831 E.40228
G3 X114.69 Y139.875 I-.055 J.597 E.0036
M204 S6000
G1 X115.056 Y139.531 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X115.534 Y140.432 I-.6 J.896 E.02071
G1 X115.534 Y161.016 E.40134
G3 X114.451 Y162.099 I-1.089 J-.006 E.03312
G1 X93.867 Y162.099 E.40134
G3 X92.784 Y161.016 I.006 J-1.089 E.03312
G1 X92.784 Y140.432 E.40134
G3 X93.867 Y139.349 I1.088 J.005 E.03312
G1 X114.557 Y139.354 E.4034
G3 X115.005 Y139.499 I-.101 J1.074 E.00926
; WIPE_START
G1 X115.219 Y139.664 E-.10265
G1 X115.353 Y139.827 E-.08008
G1 X115.452 Y140.012 E-.08004
G1 X115.513 Y140.214 E-.08003
G1 X115.534 Y140.432 E-.08311
G1 X115.534 Y141.311 E-.33409
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 1 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer1 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.816 Y141.274 F42000
M73 P30 R16
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.303031
G1 F1500
M204 S500
G1 X114.45 Y140.067 E.01446
M204 S6000
G1 X114.416 Y140.066 F42000
; LINE_WIDTH: 0.447217
G1 F1500
M204 S500
G1 X114.816 Y141.187 E.02064
; WIPE_START
G1 X114.416 Y140.066 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.696 Y140.066 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.447284
G1 F1500
M204 S500
G1 X114.816 Y140.467 E.02064
M204 S6000
G1 X114.816 Y140.432 F42000
; LINE_WIDTH: 0.302992
G1 F1500
M204 S500
G1 X113.609 Y140.066 E.01447
; WIPE_START
G1 X114.816 Y140.432 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X107.184 Y140.293 Z.5 F42000
G1 X94.709 Y140.066 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.303136
G1 F1500
M204 S500
G1 X93.503 Y140.433 E.01447
M204 S6000
G1 X93.502 Y140.467 F42000
; LINE_WIDTH: 0.447147
G1 F1500
M204 S500
G1 X94.622 Y140.066 E.02063
M204 S6000
G1 X94.531 Y140.066 F42000
; LINE_WIDTH: 0.567524
G1 F1500
M204 S500
G1 X93.811 Y140.376 E.01743
G1 X93.502 Y141.096 E.01744
M204 S6000
G1 X93.502 Y141.187 F42000
; LINE_WIDTH: 0.447158
G1 F1500
M204 S500
G1 X93.903 Y140.066 E.02065
M204 S6000
G1 X93.868 Y140.067 F42000
; LINE_WIDTH: 0.30297
G1 F1500
M204 S500
G1 X93.502 Y141.275 E.01447
; WIPE_START
G1 X93.868 Y140.067 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.729 Y147.698 Z.5 F42000
G1 X93.502 Y160.174 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.303026
G1 F1500
M204 S500
G1 X93.868 Y161.38 E.01446
M204 S6000
G1 X93.903 Y161.381 F42000
; LINE_WIDTH: 0.447287
G1 F1500
M204 S500
G1 X93.502 Y160.261 E.02064
M204 S6000
G1 X93.502 Y160.382 F42000
; LINE_WIDTH: 0.577745
G1 F1500
M204 S500
G1 X93.794 Y161.05 E.01653
G1 X94.169 Y161.381 E.01133
M204 S6000
G1 X94.623 Y161.381 F42000
; LINE_WIDTH: 0.44718
G1 F1500
M204 S500
G1 X93.502 Y160.98 E.02065
M204 S6000
G1 X93.503 Y161.015 F42000
; LINE_WIDTH: 0.303026
G1 F1500
M204 S500
G1 X94.71 Y161.381 E.01446
; WIPE_START
G1 X93.503 Y161.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.135 Y161.154 Z.5 F42000
G1 X113.609 Y161.381 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.30317
G1 F1500
M204 S500
G1 X114.816 Y161.015 E.01447
M204 S6000
G1 X114.816 Y160.98 F42000
; LINE_WIDTH: 0.447147
G1 F1500
M204 S500
G1 X113.696 Y161.381 E.02063
M204 S6000
G1 X113.787 Y161.381 F42000
; LINE_WIDTH: 0.576787
G1 F1500
M204 S500
G1 X114.486 Y161.088 E.01714
G1 X114.816 Y160.796 E.00998
M204 S6000
G1 X114.816 Y160.26 F42000
; LINE_WIDTH: 0.447158
G1 F1500
M204 S500
G1 X114.416 Y161.381 E.02065
M204 S6000
G1 X114.45 Y161.38 F42000
; LINE_WIDTH: 0.302946
G1 F1500
M204 S500
G1 X114.816 Y160.174 E.01445
; OBJECT_ID: 137
; WIPE_START
G1 X114.45 Y161.38 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S6000
G1 X121.607 Y158.73 Z.5 F42000
G1 X162.874 Y143.449 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X163.02 Y143.481 E.00291
G1 X163.134 Y143.496 E.00225
G1 X163.115 Y143.648 E.00298
G1 X162.693 Y145.441 E.03593
G1 X161.943 Y147.627 E.04505
G1 X160.978 Y149.726 E.04506
G1 X159.809 Y151.719 E.04504
G1 X158.447 Y153.586 E.04505
G1 X156.906 Y155.307 E.04505
G1 X155.201 Y156.866 E.04505
G1 X153.349 Y158.248 E.04505
G1 X151.369 Y159.438 E.04505
G1 X149.279 Y160.424 E.04505
G1 X147.102 Y161.198 E.04505
G1 X144.858 Y161.75 E.04505
G1 X142.571 Y162.077 E.04505
G1 X140.262 Y162.173 E.04505
G1 X137.956 Y162.039 E.04505
G1 X135.674 Y161.676 E.04505
G1 X133.44 Y161.087 E.04505
G1 X131.276 Y160.278 E.04505
G1 X129.203 Y159.257 E.04505
G1 X127.242 Y158.035 E.04505
G1 X125.412 Y156.624 E.04505
G1 X123.733 Y155.037 E.04505
G1 X122.22 Y153.291 E.04505
G1 X120.889 Y151.402 E.04505
G1 X119.752 Y149.391 E.04505
G1 X118.822 Y147.276 E.04505
G1 X118.122 Y145.126 E.04408
G1 X118.258 Y144.347 E.01541
G1 X118.494 Y145.352 E.02012
G1 X119.229 Y147.496 E.0442
G1 X120.173 Y149.557 E.0442
G1 X121.317 Y151.515 E.0442
G1 X122.648 Y153.349 E.0442
G1 X124.155 Y155.043 E.0442
G1 X125.823 Y156.578 E.0442
G1 X127.634 Y157.941 E.0442
G1 X129.572 Y159.118 E.0442
G1 X131.616 Y160.097 E.0442
G1 X133.748 Y160.869 E.0442
G1 X135.945 Y161.426 E.0442
G1 X138.187 Y161.762 E.0442
G1 X140.451 Y161.874 E.0442
G1 X142.715 Y161.762 E.0442
G1 X144.957 Y161.426 E.0442
G1 X147.154 Y160.869 E.0442
G1 X149.286 Y160.097 E.0442
G1 X151.33 Y159.118 E.0442
G1 X153.268 Y157.941 E.0442
G1 X155.079 Y156.578 E.0442
G1 X156.747 Y155.043 E.0442
G1 X158.254 Y153.349 E.0442
G1 X159.585 Y151.515 E.0442
G1 X160.729 Y149.557 E.0442
G1 X161.673 Y147.496 E.0442
G1 X162.408 Y145.352 E.0442
G1 X162.818 Y143.607 E.03495
G1 X162.854 Y143.506 E.0021
; OBJECT_ID: 148
; WIPE_START
G1 X163.02 Y143.481 E-.06378
G1 X163.134 Y143.496 E-.04376
G1 X163.115 Y143.648 E-.05812
G1 X162.757 Y145.17 E-.59434
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S6000
G1 X162.89 Y137.539 Z.5 F42000
G1 X163.142 Y123.024 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X163.278 Y123.802 E.01541
G1 X162.578 Y125.952 E.04408
G1 X161.648 Y128.067 E.04505
G1 X160.511 Y130.079 E.04505
G1 X159.18 Y131.967 E.04505
G1 X157.667 Y133.714 E.04505
G1 X155.988 Y135.3 E.04505
G1 X154.158 Y136.712 E.04505
G1 X152.197 Y137.934 E.04505
G1 X150.124 Y138.954 E.04505
G1 X147.96 Y139.763 E.04505
G1 X145.726 Y140.352 E.04505
M73 P31 R16
G1 X143.444 Y140.715 E.04505
G1 X141.137 Y140.85 E.04505
M73 P31 R15
G1 X138.829 Y140.753 E.04505
G1 X136.542 Y140.427 E.04505
G1 X134.298 Y139.874 E.04505
G1 X132.121 Y139.101 E.04505
G1 X130.031 Y138.114 E.04505
G1 X128.051 Y136.924 E.04505
G1 X126.199 Y135.543 E.04505
G1 X124.494 Y133.984 E.04505
G1 X122.953 Y132.262 E.04505
G1 X121.591 Y130.396 E.04505
G1 X120.422 Y128.403 E.04505
G1 X119.457 Y126.303 E.04505
G1 X118.707 Y124.118 E.04505
G1 X118.285 Y122.324 E.03593
G1 X118.266 Y122.172 E.00298
G2 X118.526 Y122.126 I-.144 J-1.546 E.00516
G1 X118.582 Y122.284 E.00327
G1 X118.992 Y124.028 E.03495
G1 X119.727 Y126.173 E.0442
G1 X120.671 Y128.234 E.0442
G1 X121.815 Y130.191 E.0442
G1 X123.146 Y132.026 E.0442
G1 X124.653 Y133.719 E.0442
G1 X126.321 Y135.255 E.0442
G1 X128.132 Y136.618 E.0442
G1 X130.07 Y137.795 E.0442
G1 X132.114 Y138.774 E.0442
G1 X134.246 Y139.546 E.0442
G1 X136.443 Y140.102 E.0442
G1 X138.685 Y140.438 E.0442
G1 X140.949 Y140.551 E.0442
G1 X143.213 Y140.438 E.0442
G1 X145.455 Y140.102 E.0442
G1 X147.652 Y139.546 E.0442
G1 X149.784 Y138.774 E.0442
G1 X151.828 Y137.795 E.0442
G1 X153.766 Y136.618 E.0442
G1 X155.577 Y135.255 E.0442
G1 X157.245 Y133.719 E.0442
G1 X158.752 Y132.026 E.0442
G1 X160.083 Y130.191 E.0442
G1 X161.227 Y128.234 E.0442
G1 X162.171 Y126.173 E.0442
G1 X162.906 Y124.028 E.0442
G1 X163.128 Y123.082 E.01895
; OBJECT_ID: 104
; WIPE_START
G1 X163.278 Y123.802 E-.27948
G1 X162.886 Y125.005 E-.48052
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S6000
G1 X161.941 Y117.431 Z.5 F42000
G1 X159.416 Y97.201 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X156.866 Y97.201 E.04972
G1 X156.866 Y95.915 E.02507
G3 X156.965 Y94.226 I12.333 J-.121 E.03301
G1 X159.316 Y94.226 E.04583
G1 X159.39 Y94.938 E.01395
G3 X159.417 Y97.141 I-37.437 J1.554 E.04297
; WIPE_START
G1 X157.417 Y97.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.593 Y104.819 Z.5 F42000
G1 X157.816 Y114.53 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X142.587 Y114.53 E.29692
G1 X142.587 Y98.823 E.30625
G1 X158.294 Y98.823 E.30625
G1 X158.294 Y114.53 E.30625
G1 X157.876 Y114.53 E.00816
M204 S6000
G1 X157.816 Y114.051 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X143.066 Y114.051 E.28759
G1 X143.066 Y99.301 E.28759
G1 X157.816 Y99.301 E.28759
G1 X157.816 Y113.991 E.28642
; WIPE_START
G1 X155.816 Y114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X155.859 Y106.367 Z.5 F42000
G1 X155.91 Y97.196 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X155.908 Y98.344 E.02239
G1 X144.973 Y98.344 E.21321
G2 X144.944 Y94.851 I-66.687 J-1.199 E.06812
G1 X145.239 Y94.857 E.00575
G2 X155.644 Y94.857 I5.2 J-1490.837 E.20287
G1 X155.937 Y94.851 E.00571
G1 X155.913 Y95.406 E.01082
G1 X155.91 Y97.136 E.03374
; WIPE_START
G1 X155.908 Y98.344 E-.45919
G1 X155.117 Y98.344 E-.30081
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.173 Y104.81 Z.5 F42000
G1 X160.459 Y106.859 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X162.259 Y106.859 E.0351
G1 X162.259 Y115.877 E.17583
G3 X158.421 Y118.494 I-12.108 J-13.628 E.09082
G1 X142.46 Y118.494 E.31119
G3 X138.623 Y115.877 I8.263 J-16.236 E.09082
G1 X138.623 Y106.859 E.17583
G1 X140.423 Y106.859 E.0351
G1 X140.423 Y102.494 E.08509
G1 X138.623 Y102.494 E.0351
G1 X138.623 Y94.857 E.1489
G2 X140.537 Y94.85 I.818 J-34.697 E.03733
G2 X140.509 Y95.913 I14.952 J.928 E.02074
G1 X140.508 Y98.159 E.04379
G1 X142.109 Y98.159 E.0312
G1 X142.109 Y115.009 E.32853
G1 X158.773 Y115.009 E.32491
G1 X158.773 Y98.159 E.32853
G1 X160.373 Y98.159 E.0312
G2 X160.344 Y94.85 I-63.123 J-1.107 E.06452
G1 X160.558 Y94.856 E.00416
G1 X162.259 Y94.857 E.03317
G1 X162.259 Y102.494 E.1489
G1 X160.459 Y102.494 E.0351
G1 X160.459 Y106.799 E.08392
M204 S6000
G1 X160.937 Y106.38 F42000
G1 F1500
M204 S500
G1 X162.737 Y106.38 E.0351
M73 P32 R15
G1 X162.737 Y116.087 E.18926
G3 X158.533 Y118.973 I-12.289 J-13.394 E.09976
G1 X142.348 Y118.973 E.31557
G3 X138.144 Y116.087 I8.075 J-16.266 E.09976
G1 X138.144 Y106.38 E.18926
G1 X139.944 Y106.38 E.0351
G1 X139.944 Y102.973 E.06643
G1 X138.144 Y102.973 E.0351
G1 X138.144 Y94.379 E.16755
G1 X140.317 Y94.377 E.04237
G2 X141.072 Y94.346 I-.009 J-9.453 E.01473
G2 X140.987 Y95.914 I12.027 J1.433 E.03063
G1 X140.987 Y97.68 E.03443
G1 X144.494 Y97.68 E.06839
G2 X144.468 Y94.903 I-45.279 J-.953 E.05416
G1 X144.41 Y94.352 E.0108
G2 X145.243 Y94.378 I.815 J-12.46 E.01626
G2 X155.639 Y94.378 I5.196 J-1494.218 E.20269
G2 X156.471 Y94.352 I.018 J-12.478 E.01624
G2 X156.387 Y95.914 I12.009 J1.428 E.03053
G1 X156.387 Y97.68 E.03443
G1 X159.894 Y97.68 E.06839
G2 X159.868 Y94.903 I-45.279 J-.953 E.05416
G1 X159.81 Y94.346 E.01091
G1 X160.045 Y94.362 E.0046
G1 X162.737 Y94.379 E.05249
G1 X162.737 Y102.973 E.16755
G1 X160.937 Y102.973 E.0351
G1 X160.937 Y106.32 E.06526
; WIPE_START
G1 X162.737 Y106.38 E-.68438
G1 X162.737 Y106.579 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X155.913 Y103.161 Z.5 F42000
G1 X144.016 Y97.201 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X141.466 Y97.201 E.04972
G1 X141.466 Y95.915 E.02507
G3 X141.565 Y94.226 I12.333 J-.121 E.03301
G1 X143.916 Y94.226 E.04583
G1 X143.99 Y94.938 E.01395
G3 X144.017 Y97.141 I-37.437 J1.554 E.04297
; WIPE_START
G1 X142.017 Y97.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.98 Y100.316 Z.5 F42000
G1 X161.416 Y105.901 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X163.216 Y105.901 E.0351
G1 X163.216 Y116.295 E.20266
G3 X158.645 Y119.451 I-12.776 J-13.614 E.10869
G1 X142.236 Y119.451 E.31994
G3 X137.666 Y116.295 I8.197 J-16.757 E.1087
G1 X137.666 Y105.901 E.20266
G1 X139.466 Y105.901 E.0351
G1 X139.466 Y103.451 E.04777
G1 X137.666 Y103.451 E.0351
G1 X137.666 Y93.901 E.18621
G1 X140.31 Y93.899 E.05157
G2 X141.796 Y93.826 I-1.826 J-52.835 E.029
G1 X143.757 Y93.826 E.03824
G1 X144.245 Y93.864 E.00954
G2 X145.248 Y93.9 I1.039 J-14.995 E.01956
G2 X155.634 Y93.9 I5.193 J-1497.758 E.20251
G2 X157.124 Y93.826 I-.218 J-19.618 E.02909
G1 X159.085 Y93.826 E.03824
G2 X160.571 Y93.899 I3.311 J-52.762 E.029
G1 X163.216 Y93.901 E.05157
G1 X163.216 Y103.451 E.18621
G1 X161.416 Y103.451 E.0351
G1 X161.416 Y105.841 E.0466
; WIPE_START
G1 X163.216 Y105.901 E-.68438
G1 X163.216 Y106.1 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.306 Y99.546 Z.5 F42000
G1 X158.533 Y98.251 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.68588
G1 F1500
M204 S500
G1 X156.148 Y98.251 E.06458
; WIPE_START
M73 P33 R15
G1 X158.148 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X154.753 Y95.042 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50866
G1 F2400
M204 S500
G1 X155.506 Y95.796 E.02114
G1 X155.505 Y96.484 E.01366
G1 X154.279 Y95.258 E.03441
G1 X153.59 Y95.258 E.01368
G1 X155.504 Y97.171 E.05372
G1 X155.502 Y97.859 E.01366
G1 X152.901 Y95.258 E.07303
G1 X152.212 Y95.258 E.01368
G1 X154.892 Y97.938 E.07523
G1 X154.203 Y97.938 E.01368
G1 X151.523 Y95.258 E.07523
G1 X150.834 Y95.258 E.01368
G1 X153.514 Y97.938 E.07523
G1 X152.825 Y97.938 E.01368
G1 X150.145 Y95.258 E.07523
G1 X149.456 Y95.258 E.01368
G1 X152.136 Y97.938 E.07523
G1 X151.447 Y97.938 E.01368
G1 X148.767 Y95.258 E.07523
G1 X148.078 Y95.258 E.01368
G1 X150.758 Y97.938 E.07523
G1 X150.069 Y97.938 E.01368
G1 X147.389 Y95.258 E.07523
G1 X146.7 Y95.258 E.01368
G1 X149.38 Y97.938 E.07523
G1 X148.691 Y97.938 E.01368
G1 X146.011 Y95.258 E.07523
G1 X145.369 Y95.258 E.01274
G1 X145.371 Y95.307 E.00098
G1 X148.002 Y97.938 E.07384
G1 X147.313 Y97.938 E.01368
G1 X145.376 Y96.001 E.05437
G1 X145.377 Y96.691 E.0137
G1 X146.624 Y97.938 E.03499
G1 X145.935 Y97.938 E.01368
G1 X145.163 Y97.166 E.02168
; WIPE_START
G1 X145.935 Y97.938 E-.41494
G1 X146.624 Y97.938 E-.26183
G1 X146.469 Y97.783 E-.08323
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.734 Y98.251 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.68588
G1 F1500
M204 S500
G1 X142.348 Y98.251 E.06458
; WIPE_START
G1 X144.348 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.845 Y96.817 Z.5 F42000
G1 X161.097 Y95.048 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50093
G1 F2400
M204 S500
G1 X161.852 Y95.803 E.02086
G1 X161.852 Y96.481 E.01325
G1 X160.775 Y95.404 E.02975
G1 X160.776 Y96.083 E.01327
G1 X161.852 Y97.159 E.02972
G1 X161.852 Y97.837 E.01325
G1 X160.777 Y96.762 E.02969
G1 X160.779 Y97.441 E.01327
G1 X161.852 Y98.515 E.02966
G1 X161.852 Y99.193 E.01325
G1 X160.78 Y98.121 E.02963
G1 X160.78 Y98.565 E.00869
G1 X160.546 Y98.565 E.00457
G1 X161.852 Y99.871 E.03608
G1 X161.852 Y100.549 E.01325
G1 X159.868 Y98.565 E.05481
G1 X159.19 Y98.565 E.01325
G1 X161.852 Y101.227 E.07354
G1 X161.852 Y101.905 E.01325
G1 X159.179 Y99.233 E.07384
G1 X159.179 Y99.911 E.01325
G1 X161.357 Y102.088 E.06015
G1 X160.678 Y102.088 E.01325
G1 X159.179 Y100.589 E.04141
G1 X159.179 Y101.267 E.01325
G1 X160.052 Y102.139 E.02411
G1 X160.052 Y102.817 E.01325
G1 X159.179 Y101.945 E.02411
G1 X159.179 Y102.623 E.01325
G1 X160.052 Y103.496 E.02411
G1 X160.052 Y104.174 E.01325
G1 X159.179 Y103.301 E.02411
G1 X159.179 Y103.979 E.01325
G1 X160.052 Y104.852 E.02411
G1 X160.052 Y105.53 E.01325
G1 X159.179 Y104.657 E.02411
G1 X159.179 Y105.335 E.01325
G1 X160.267 Y106.423 E.03006
; WIPE_START
G1 X159.179 Y105.335 E-.58465
G1 X159.179 Y104.874 E-.17535
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.572 Y107.05 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X161.852 Y107.33 E.00773
G1 X161.852 Y108.008 E.01325
G1 X160.894 Y107.05 E.02647
; WIPE_START
G1 X161.852 Y108.008 E-.51484
G1 X161.852 Y107.363 E-.24516
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X162.067 Y108.901 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X159.179 Y106.013 E.07979
G1 X159.179 Y106.691 E.01325
G1 X161.852 Y109.364 E.07384
G1 X161.852 Y110.042 E.01325
G1 X159.179 Y107.369 E.07384
G1 X159.179 Y108.048 E.01325
G1 X161.852 Y110.72 E.07384
G1 X161.852 Y111.398 E.01325
G1 X159.179 Y108.726 E.07384
G1 X159.179 Y109.404 E.01325
G1 X161.852 Y112.076 E.07384
G1 X161.852 Y112.754 E.01325
G1 X159.179 Y110.082 E.07384
G1 X159.179 Y110.76 E.01325
G1 X161.852 Y113.432 E.07384
G1 X161.852 Y114.111 E.01325
G1 X159.179 Y111.438 E.07384
G1 X159.179 Y112.116 E.01325
G1 X161.852 Y114.789 E.07384
G1 X161.852 Y115.467 E.01325
G1 X159.179 Y112.794 E.07384
G1 X159.179 Y113.472 E.01325
G1 X161.602 Y115.895 E.06694
G1 X161.233 Y116.204 E.0094
G1 X159.179 Y114.15 E.05674
G1 X159.179 Y114.828 E.01325
G1 X160.85 Y116.499 E.04615
G1 X160.456 Y116.783 E.00949
G1 X159.088 Y115.415 E.03779
G1 X158.41 Y115.415 E.01325
G1 X160.062 Y117.067 E.04563
G1 X159.643 Y117.326 E.00962
G1 X157.732 Y115.415 E.0528
G1 X157.054 Y115.415 E.01325
G1 X159.225 Y117.586 E.05997
G3 X158.794 Y117.833 I-2.199 J-3.338 E.00971
G1 X156.376 Y115.415 E.06679
G1 X155.698 Y115.415 E.01325
G1 X158.352 Y118.07 E.07334
G1 X158.319 Y118.088 E.00075
G1 X157.692 Y118.088 E.01223
G1 X155.02 Y115.415 E.07384
G1 X154.342 Y115.415 E.01325
G1 X157.014 Y118.088 E.07384
G1 X156.336 Y118.088 E.01325
G1 X153.664 Y115.415 E.07384
G1 X152.986 Y115.415 E.01325
G1 X155.658 Y118.088 E.07384
G1 X154.98 Y118.088 E.01325
G1 X152.308 Y115.415 E.07384
G1 X151.63 Y115.415 E.01325
G1 X154.302 Y118.088 E.07384
G1 X153.624 Y118.088 E.01325
G1 X150.951 Y115.415 E.07384
G1 X150.273 Y115.415 E.01325
G1 X152.946 Y118.088 E.07384
G1 X152.268 Y118.088 E.01325
G1 X149.595 Y115.415 E.07384
G1 X148.917 Y115.415 E.01325
G1 X151.59 Y118.088 E.07384
G1 X150.912 Y118.088 E.01325
G1 X148.239 Y115.415 E.07384
G1 X147.561 Y115.415 E.01325
G1 X150.234 Y118.088 E.07384
G1 X149.556 Y118.088 E.01325
G1 X146.883 Y115.415 E.07384
G1 X146.205 Y115.415 E.01325
G1 X148.878 Y118.088 E.07384
G1 X148.199 Y118.088 E.01325
G1 X145.527 Y115.415 E.07384
G1 X144.849 Y115.415 E.01325
G1 X147.521 Y118.088 E.07384
G1 X146.843 Y118.088 E.01325
G1 X144.171 Y115.415 E.07384
G1 X143.493 Y115.415 E.01325
G1 X146.165 Y118.088 E.07384
G1 X145.487 Y118.088 E.01325
G1 X142.599 Y115.2 E.07979
; WIPE_START
G1 X144.013 Y116.614 E-.76
; WIPE_END
M73 P34 R15
G1 E-.04 F1800
M204 S6000
G1 X143.115 Y109.035 Z.5 F42000
G1 X141.917 Y98.922 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X141.56 Y98.565 E.00987
G1 X140.882 Y98.565 E.01325
G1 X141.917 Y99.6 E.0286
; WIPE_START
G1 X140.882 Y98.565 E-.55633
G1 X141.418 Y98.565 E-.20368
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.321 Y95.969 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X139.611 Y95.26 E.0196
G1 X139.029 Y95.262 E.01137
G1 X139.029 Y95.356 E.00183
G1 X140.105 Y96.431 E.0297
G1 X140.103 Y97.108 E.01322
G1 X139.029 Y96.034 E.02967
G1 X139.029 Y96.712 E.01325
G1 X140.317 Y98 E.03558
; WIPE_START
G1 X139.029 Y96.712 E-.69213
G1 X139.029 Y96.534 E-.06787
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.814 Y97.175 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X141.702 Y100.063 E.07979
G1 X141.702 Y100.741 E.01325
G1 X139.029 Y98.069 E.07384
G1 X139.029 Y98.747 E.01325
G1 X141.702 Y101.419 E.07384
G1 X141.702 Y102.097 E.01325
G1 X139.029 Y99.425 E.07384
G1 X139.029 Y100.103 E.01325
G1 X141.702 Y102.775 E.07384
G1 X141.702 Y103.453 E.01325
G1 X140.829 Y102.581 E.02411
G1 X140.829 Y102.088 E.00963
G1 X140.336 Y102.088 E.00963
G1 X139.029 Y100.781 E.03611
G1 X139.029 Y101.459 E.01325
G1 X139.874 Y102.303 E.02332
; WIPE_START
G1 X139.029 Y101.459 E-.45364
G1 X139.029 Y100.781 E-.25767
G1 X139.12 Y100.871 E-.04869
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.614 Y103.044 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X141.702 Y104.132 E.03006
G1 X141.702 Y104.81 E.01325
G1 X140.829 Y103.937 E.02411
G1 X140.829 Y104.615 E.01325
G1 X141.702 Y105.488 E.02411
G1 X141.702 Y106.166 E.01325
G1 X140.829 Y105.293 E.02411
G1 X140.829 Y105.971 E.01325
G1 X141.702 Y106.844 E.02411
G1 X141.702 Y107.522 E.01325
G1 X140.829 Y106.649 E.02411
G1 X140.829 Y107.265 E.01203
G1 X140.767 Y107.265 E.00122
G1 X141.702 Y108.2 E.02583
G1 X141.702 Y108.878 E.01325
G1 X140.089 Y107.265 E.04456
G1 X139.411 Y107.265 E.01325
G1 X141.702 Y109.556 E.06329
G1 X141.702 Y110.234 E.01325
G1 X139.029 Y107.562 E.07384
G1 X139.029 Y108.24 E.01325
G1 X141.702 Y110.912 E.07384
G1 X141.702 Y111.59 E.01325
G1 X139.029 Y108.918 E.07384
G1 X139.029 Y109.596 E.01325
G1 X141.702 Y112.268 E.07384
G1 X141.702 Y112.946 E.01325
G1 X139.029 Y110.274 E.07384
G1 X139.029 Y110.952 E.01325
G1 X141.702 Y113.625 E.07384
G1 X141.702 Y114.303 E.01325
G1 X139.029 Y111.63 E.07384
G1 X139.029 Y112.308 E.01325
G1 X141.702 Y114.981 E.07384
G1 X141.702 Y115.415 E.00849
G1 X142.137 Y115.415 E.00849
G1 X144.809 Y118.088 E.07384
G1 X144.131 Y118.088 E.01325
G1 X139.029 Y112.986 E.14094
G1 X139.029 Y113.664 E.01325
G1 X143.453 Y118.088 E.12221
G1 X142.775 Y118.088 E.01325
G1 X139.029 Y114.342 E.10348
G1 X139.029 Y115.02 E.01325
G1 X142.085 Y118.076 E.08441
; OBJECT_ID: 115
; WIPE_START
G1 X140.67 Y116.661 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S6000
G1 X133.039 Y116.78 Z.5 F42000
G1 X119.934 Y116.984 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X119.903 Y116.788 E.00387
G1 X119.903 Y104.565 E.2383
G1 X119.934 Y104.369 E.00387
G3 X120.526 Y104.338 I.394 J1.852 E.01161
G1 X132.36 Y104.34 E.23074
G1 X132.548 Y104.369 E.00371
G1 X132.579 Y104.565 E.00387
G1 X132.579 Y116.788 E.2383
G1 X132.548 Y116.984 E.00387
G1 X132.352 Y117.015 E.00387
G1 X120.13 Y117.015 E.2383
G1 X119.993 Y116.993 E.0027
M204 S6000
G1 X119.548 Y117.238 F42000
G1 F1500
M204 S500
G3 X119.424 Y116.825 I.574 J-.397 E.00854
G1 X119.424 Y104.528 E.23977
G3 X119.679 Y103.983 I.707 J-.001 E.01211
G3 X120.092 Y103.86 I.397 J.574 E.00854
G1 X120.526 Y103.86 E.00846
G1 X132.398 Y103.861 E.23147
G3 X133.058 Y104.528 I.015 J.645 E.02047
G1 X133.058 Y116.825 E.23977
G3 X132.802 Y117.37 I-.707 J.001 E.01211
G3 X132.39 Y117.493 I-.397 J-.574 E.00854
G1 X120.092 Y117.493 E.23977
G3 X119.588 Y117.283 I-.001 J-.707 E.01093
M204 S6000
G1 X119.202 Y117.569 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X119.156 Y117.523 E.00128
G1 X119.002 Y117.222 E.00658
G1 X118.945 Y116.863 E.00709
G1 X118.945 Y104.49 E.24124
G1 X119.002 Y104.131 E.00709
G1 X119.156 Y103.83 E.00658
G1 X119.394 Y103.591 E.00658
G1 X119.695 Y103.438 E.00658
G3 X120.526 Y103.381 I.595 J2.592 E.0163
G1 X132.436 Y103.382 E.23221
G1 X132.786 Y103.438 E.00692
G1 X133.087 Y103.591 E.00658
G1 X133.326 Y103.83 E.00658
G1 X133.479 Y104.131 E.00658
G1 X133.536 Y104.49 E.00709
G1 X133.536 Y116.863 E.24124
G1 X133.479 Y117.222 E.00709
G1 X133.326 Y117.523 E.00658
G1 X133.087 Y117.762 E.00658
G1 X132.786 Y117.915 E.00658
G1 X132.427 Y117.972 E.00709
G1 X120.054 Y117.972 E.24124
G1 X119.695 Y117.915 E.00709
G1 X119.394 Y117.762 E.00658
G1 X119.244 Y117.612 E.00413
; WIPE_START
G1 X119.156 Y117.523 E-.04769
G1 X119.002 Y117.222 E-.12831
G1 X118.945 Y116.863 E-.13817
G1 X118.945 Y115.69 E-.44584
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.631 Y110.598 Z.5 F42000
G1 X131.407 Y104.531 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50625
G1 F2400
M204 S500
M73 P35 R15
G1 X132.172 Y105.296 E.02138
G1 X132.172 Y105.982 E.01354
G1 X130.937 Y104.746 E.03452
G1 X130.251 Y104.746 E.01354
G1 X132.172 Y106.667 E.05367
G1 X132.172 Y107.353 E.01354
G1 X129.565 Y104.746 E.07282
G1 X128.88 Y104.746 E.01354
G1 X132.172 Y108.039 E.09198
G1 X132.172 Y108.724 E.01354
G1 X128.194 Y104.746 E.11113
G1 X127.508 Y104.746 E.01354
G1 X132.172 Y109.41 E.13028
G1 X132.172 Y110.095 E.01354
G1 X126.823 Y104.746 E.14944
G1 X126.137 Y104.746 E.01354
G1 X132.172 Y110.781 E.16859
G1 X132.172 Y111.467 E.01354
G1 X125.451 Y104.746 E.18774
G1 X124.766 Y104.745 E.01354
G1 X132.172 Y112.152 E.2069
G1 X132.172 Y112.838 E.01354
G1 X124.08 Y104.745 E.22605
G1 X123.394 Y104.745 E.01354
G1 X132.172 Y113.523 E.2452
G1 X132.172 Y114.209 E.01354
G1 X122.709 Y104.745 E.26436
G1 X122.023 Y104.745 E.01354
G1 X132.172 Y114.895 E.28351
G1 X132.172 Y115.58 E.01354
G1 X121.337 Y104.745 E.30266
G1 X120.652 Y104.745 E.01354
G1 X132.172 Y116.266 E.32182
G1 X132.172 Y116.608 E.00676
G1 X131.829 Y116.608 E.00678
G1 X120.309 Y105.088 E.32178
G1 X120.309 Y105.774 E.01354
G1 X131.143 Y116.608 E.30263
G1 X130.458 Y116.608 E.01354
G1 X120.309 Y106.46 E.28348
G1 X120.309 Y107.145 E.01354
G1 X129.772 Y116.608 E.26433
G1 X129.086 Y116.608 E.01354
G1 X120.309 Y107.831 E.24518
G1 X120.309 Y108.516 E.01354
G1 X128.401 Y116.608 E.22603
G1 X127.715 Y116.608 E.01354
G1 X120.309 Y109.202 E.20688
M73 P35 R14
G1 X120.309 Y109.888 E.01354
G1 X127.03 Y116.608 E.18773
G1 X126.344 Y116.608 E.01354
G1 X120.309 Y110.573 E.16857
G1 X120.309 Y111.259 E.01354
G1 X125.658 Y116.608 E.14942
G1 X124.973 Y116.608 E.01354
G1 X120.309 Y111.944 E.13027
G1 X120.309 Y112.63 E.01354
G1 X124.287 Y116.608 E.11112
G1 X123.602 Y116.608 E.01354
G1 X120.309 Y113.316 E.09197
G1 X120.309 Y114.001 E.01354
G1 X122.916 Y116.608 E.07282
G1 X122.23 Y116.608 E.01354
G1 X120.309 Y114.687 E.05367
G1 X120.309 Y115.372 E.01354
G1 X121.545 Y116.608 E.03452
G1 X120.859 Y116.608 E.01354
G1 X120.094 Y115.843 E.02138
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F2400
G1 X120.859 Y116.608 E-.41131
G1 X121.545 Y116.608 E-.26053
G1 X121.381 Y116.444 E-.08816
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 2/72
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S191.25
; open powerlost recovery
M1003 S1
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.5 I-1.202 J-.193 P1  F42000
G1 X114.371 Y160.01 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X114.354 Y160.043 E.00064
G3 X112.874 Y161.047 I-1.513 J-.637 E.03302
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.641 J.033 E.04387
G1 X112.874 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.641 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.449 Y159.74 I-1.641 J-.033 E.00529
G1 X114.387 Y159.952 E.00386
M204 S250
G1 X113.973 Y159.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X112.864 Y160.634 I-1.128 J-.475 E.02299
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X113.995 Y159.829 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X113.866 Y160.096 E-.11275
G1 X113.715 Y160.279 E-.09016
G1 X113.532 Y160.43 E-.09016
G1 X113.322 Y160.542 E-.09015
G1 X113.095 Y160.611 E-.09015
G1 X112.864 Y160.634 E-.0882
G1 X112.342 Y160.634 E-.19844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.298 Y154.905 Z.6 F42000
G1 X94.406 Y140.264 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.251 J1.957 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.527 Y140.323 I2.334 J-.234 E.01041
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.39 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12441
M73 P36 R14
G1 X94.007 Y140.572 E-.07655
G1 X93.872 Y140.721 E-.07655
G1 X93.7 Y140.97 E-.11502
G1 X93.511 Y140.918 E-.07433
G1 X93.511 Y140.449 E-.17791
G1 X93.527 Y140.323 E-.0484
G1 X93.571 Y140.231 E-.03875
G1 X93.623 Y140.179 E-.02807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.256 Y140.157 Z.6 F42000
G1 X114.622 Y140.118 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X114.807 Y140.449 I-.165 J.309 E.00699
G1 X114.807 Y140.918 E.00818
G1 X114.619 Y140.97 E.00342
G2 X113.913 Y140.264 I-1.957 J1.252 E.01756
G1 X113.965 Y140.076 E.00342
G3 X114.475 Y140.078 I.234 J5.167 E.00891
G3 X114.567 Y140.095 I-.018 J.35 E.00163
; WIPE_START
G1 X114.727 Y140.204 E-.07358
G1 X114.791 Y140.323 E-.0515
G1 X114.807 Y140.449 E-.04841
G1 X114.807 Y140.918 E-.17793
G1 X114.619 Y140.97 E-.07434
G1 X114.446 Y140.721 E-.11503
G1 X114.311 Y140.572 E-.07654
G1 X114.162 Y140.436 E-.07659
G1 X114.019 Y140.337 E-.06607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.246 Y147.966 Z.6 F42000
G1 X114.619 Y160.477 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.331 J.234 E.01041
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X114.807 Y160.529 E-.08417
G1 X114.807 Y160.998 E-.1779
G1 X114.791 Y161.124 E-.04841
G1 X114.748 Y161.216 E-.03871
G1 X114.652 Y161.312 E-.05141
G1 X114.56 Y161.355 E-.03869
G1 X114.433 Y161.372 E-.0485
G1 X113.965 Y161.372 E-.1779
G1 X113.913 Y161.183 E-.07434
G1 X113.956 Y161.153 E-.01999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z.6 F42000
G1 X94.406 Y161.183 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00341
G3 X93.759 Y161.355 I-.234 J-2.333 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00818
G1 X93.7 Y160.477 E.00342
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.736 J-1.179 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08366
G1 X93.885 Y161.372 E-.17787
G1 X93.759 Y161.355 E-.04849
G1 X93.667 Y161.312 E-.03866
G1 X93.571 Y161.216 E-.05144
G1 X93.527 Y161.124 E-.03867
G1 X93.511 Y160.998 E-.04846
G1 X93.511 Y160.529 E-.17793
G1 X93.7 Y160.477 E-.07434
G1 X93.728 Y160.524 E-.02048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z.6 F42000
G1 X114.89 Y139.78 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X115.236 Y140.439 I-.432 J.647 E.01356
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.004 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.005 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.514 Y139.651 E.36037
G3 X114.838 Y139.748 I-.057 J.776 E.00596
M204 S250
G1 X115.123 Y139.437 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.299 Y139.583 E.00373
G3 X115.649 Y140.429 I-.843 J.844 E.01525
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.552 Y139.238 E.33592
G3 X115.072 Y139.406 I-.095 J1.189 E.00895
; WIPE_START
M204 S6000
G1 X115.299 Y139.583 E-.10973
G1 X115.449 Y139.763 E-.08861
G1 X115.559 Y139.968 E-.08866
G1 X115.626 Y140.191 E-.08857
G1 X115.649 Y140.429 E-.0906
G1 X115.649 Y141.202 E-.29384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 2 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer2 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.444698
G1 F15000
M204 S6000
G2 X114.767 Y141.151 I-5.857 J.857 E.00506
M204 S10000
G1 X114.817 Y141.44 F42000
; LINE_WIDTH: 0.407893
G1 F15000
M204 S6000
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00483
; LINE_WIDTH: 0.405762
G1 X114.817 Y160.007 E.00313
; LINE_WIDTH: 0.444726
G3 X114.767 Y160.296 I-5.996 J-.881 E.00506
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.13092
G1 F15000
M204 S6000
G3 X114.352 Y161.157 I-.319 J-.047 E.0017
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.444731
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.159 J-5.877 E.00506
; LINE_WIDTH: 0.405779
G1 X113.244 Y161.405 E.00313
; LINE_WIDTH: 0.346464
G1 X112.88 Y161.424 E.00484
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407938
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444729
G3 X94.587 Y161.332 I.872 J-5.94 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125596
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.048 J-.312 E.00169
M204 S10000
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.4447
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.896 J-1.162 E.00506
; LINE_WIDTH: 0.407891
G1 X93.479 Y159.826 E.00286
; LINE_WIDTH: 0.346463
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405772
G1 X93.501 Y141.44 E.00313
; LINE_WIDTH: 0.444713
G3 X93.551 Y141.151 I5.924 J.87 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125599
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.048 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.444734
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.158 J5.875 E.00506
; LINE_WIDTH: 0.407945
G1 X95.056 Y140.043 E.00286
; LINE_WIDTH: 0.346464
G1 X95.439 Y140.024 E.00507
G1 X112.88 Y140.024 E.23095
G1 X113.245 Y140.042 E.00484
; LINE_WIDTH: 0.405783
G1 X113.443 Y140.066 E.00312
; LINE_WIDTH: 0.444718
G3 X113.732 Y140.115 I-.873 J5.949 E.00506
M204 S10000
G1 X114.341 Y140.29 F42000
; LINE_WIDTH: 0.136564
G1 F15000
M204 S6000
G3 X114.592 Y140.531 I-.051 J.306 E.00173
; OBJECT_ID: 137
; WIPE_START
G1 X114.508 Y140.375 E-.36909
G1 X114.341 Y140.29 E-.39091
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X121.958 Y140.769 Z.6 F42000
G1 X162.839 Y143.341 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.213 Y143.406 E.00616
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03759
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.014 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.213 Y143.406 E-.14725
G1 X162.844 Y144.976 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.344 Z.6 F42000
G1 X163.148 Y122.824 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03674
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z.6 F42000
G1 X158.543 Y113.936 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z.6 F42000
G1 X144.743 Y97.086 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.091 J-13.366 E.08518
M73 P37 R14
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.045 J-16.065 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.481 J-13.489 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z.6 F42000
G1 X159.301 Y97.086 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z.6 F42000
G1 X161.531 Y105.786 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.92 J-13.707 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.446 Y99.416 Z.6 F42000
G1 X158.757 Y98.251 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.34 Y115.801 E.01114
G1 X159.127 Y115.918 E.00393
G1 X158.757 Y115.989 E.00612
G1 X142.124 Y115.989 E.27007
G1 X141.709 Y115.899 E.0069
G1 X141.559 Y115.813 E.00281
G1 X141.241 Y115.454 E.00779
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.197 J-13.287 E.06092
G1 X158.172 Y117.514 E.25106
G2 X160.723 Y115.882 I-8.688 J-16.393 E.04923
G1 X161.278 Y115.417 E.01177
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.0055
; LINE_WIDTH: 0.439333
G1 X159.853 Y115.742 E.0083
; LINE_WIDTH: 0.464797
G1 X159.595 Y116.156 E.0088
G1 X160.471 Y115.572 E.01901
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.295 Y116.337 F42000
; LINE_WIDTH: 0.51136
G1 F14696.877
M204 S6000
G1 X159.544 Y116.187 E.0058
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443573
G1 F15000
M204 S6000
G1 X141.824 Y116.346 E.00521
; LINE_WIDTH: 0.474716
G1 X141.524 Y116.304 E.0056
G1 X142.041 Y116.684 E.01187
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01282
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.552 Y116.859 E.00883
; LINE_WIDTH: 0.437552
G1 X158.799 Y116.685 E.00513
; LINE_WIDTH: 0.472675
G1 X159.047 Y116.511 E.00557
; LINE_WIDTH: 0.507798
G1 F14804.509
G1 X159.295 Y116.337 E.006
G1 X159.116 Y116.354 E.00357
; LINE_WIDTH: 0.472675
G1 F15000
G1 X158.936 Y116.371 E.00331
; LINE_WIDTH: 0.420179
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.312 Y116.171 F42000
; LINE_WIDTH: 0.50347
G1 F14937.449
M204 S6000
G1 X141.473 Y116.272 E.00372
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.702 Y115.794 E.01449
; LINE_WIDTH: 0.438148
G1 X141.007 Y115.983 E.00609
; LINE_WIDTH: 0.462572
G1 X141.312 Y116.171 E.00645
G1 X140.888 Y115.639 E.01224
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00981
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.12 J-13.817 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.212 Y116.512 I-9.062 J-17.453 E.05467
G1 X162.075 Y115.789 E.01828
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.857 Y115.165 E.00322
G1 X157.981 Y115.192 E.01424
G1 X142.124 Y115.192 E.25747
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420078
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.641 J-13.522 E.06694
G1 X158.271 Y117.912 E.25436
G2 X160.968 Y116.197 I-8.858 J-16.898 E.05196
G1 X161.677 Y115.603 E.01503
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.058 Y115.509 E.00756
G1 X158.757 Y115.591 E.00506
G1 X142.124 Y115.591 E.27021
G1 X141.875 Y115.536 E.00414
G1 X141.595 Y115.27 E.00629
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z.6 F42000
G1 X144.107 Y94.026 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.913 Y99.358 Z.6 F42000
G1 X119.718 Y117.121 Z.6
G1 Z.2
M73 P38 R14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X119.632 Y116.83 I.336 J-.258 E.00541
G1 X119.632 Y104.523 E.21489
G3 X120.087 Y104.068 I.423 J-.032 E.01276
G1 X132.394 Y104.068 E.21489
G1 X132.588 Y104.098 E.00343
G3 X132.85 Y104.523 I-.162 J.392 E.0093
G1 X132.85 Y116.83 E.21489
G3 X132.394 Y117.285 I-.423 J.032 E.01276
G1 X120.087 Y117.285 E.21489
G3 X119.758 Y117.165 I-.032 J-.423 E.0063
M204 S10000
G1 X119.376 Y117.392 F42000
G1 F6000
M204 S6000
G1 X119.37 Y117.374 E.00033
G3 X119.25 Y117.158 I.706 J-.532 E.00432
G1 X119.203 Y116.864 E.0052
G1 X119.203 Y104.489 E.21607
G1 X119.25 Y104.195 E.0052
G3 X119.759 Y103.686 I.825 J.316 E.01295
G1 X120.053 Y103.639 E.0052
G1 X132.428 Y103.639 E.21607
G1 X132.722 Y103.686 E.0052
G3 X133.231 Y104.195 I-.316 J.825 E.01295
G1 X133.278 Y104.489 E.0052
G1 X133.278 Y116.864 E.21607
G1 X133.231 Y117.158 E.0052
G3 X132.722 Y117.667 I-.825 J-.316 E.01295
G1 X132.428 Y117.714 E.0052
G1 X120.053 Y117.714 E.21607
G1 X119.759 Y117.667 E.0052
G3 X119.543 Y117.548 I.316 J-.825 E.00432
G1 X119.42 Y117.433 E.00295
M204 S250
G1 X119.083 Y117.684 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X119.024 Y117.625 E.00136
G1 X118.852 Y117.287 E.00615
G1 X118.79 Y116.878 E.00672
G1 X118.79 Y104.475 E.20141
G1 X118.852 Y104.066 E.00672
G1 X119.024 Y103.728 E.00616
G1 X119.292 Y103.46 E.00616
G1 X119.63 Y103.288 E.00616
G1 X120.039 Y103.226 E.00672
G1 X124.271 Y103.226 E.06872
G1 X132.469 Y103.227 E.13312
G1 X132.852 Y103.288 E.00628
G1 X133.189 Y103.46 E.00616
G1 X133.458 Y103.728 E.00616
G1 X133.63 Y104.066 E.00616
G1 X133.692 Y104.475 E.00672
G1 X133.692 Y116.878 E.20141
G1 X133.63 Y117.287 E.00672
G1 X133.458 Y117.625 E.00616
G1 X133.189 Y117.893 E.00616
G1 X132.852 Y118.065 E.00616
G1 X132.442 Y118.127 E.00672
G1 X120.039 Y118.127 E.20141
G1 X119.63 Y118.065 E.00672
G1 X119.292 Y117.893 E.00616
G1 X119.126 Y117.727 E.00382
; WIPE_START
M204 S6000
G1 X119.024 Y117.625 E-.05465
G1 X118.852 Y117.287 E-.14403
G1 X118.79 Y116.878 E-.15729
G1 X118.79 Y115.815 E-.40402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.387 Y116.546 Z.6 F42000
G1 X132.28 Y117.113 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42244
G1 F15000
M204 S6000
G1 X132.481 Y116.912 E.00464
G1 X132.498 Y116.802 E.00182
G1 X132.498 Y116.328 E.00775
G1 X131.892 Y116.934 E.014
G1 X131.325 Y116.934 E.00926
G1 X132.498 Y115.761 E.0271
G1 X132.498 Y115.194 E.00926
G1 X130.758 Y116.934 E.0402
G1 X130.191 Y116.934 E.00926
G1 X132.498 Y114.627 E.05331
G1 X132.498 Y114.06 E.00926
G1 X129.624 Y116.934 E.06641
G1 X129.057 Y116.934 E.00926
G1 X132.498 Y113.492 E.07951
G1 X132.498 Y112.925 E.00926
G1 X128.49 Y116.934 E.09261
G1 X127.923 Y116.934 E.00926
G1 X132.498 Y112.358 E.10571
G1 X132.498 Y111.791 E.00926
G1 X127.356 Y116.934 E.11881
G1 X126.788 Y116.934 E.00926
G1 X132.498 Y111.224 E.13192
G1 X132.498 Y110.657 E.00926
G1 X126.221 Y116.934 E.14502
G1 X125.654 Y116.934 E.00926
G1 X132.498 Y110.09 E.15812
G1 X132.498 Y109.523 E.00926
G1 X125.087 Y116.934 E.17122
G1 X124.52 Y116.934 E.00926
G1 X132.498 Y108.956 E.18432
G1 X132.498 Y108.389 E.00926
G1 X123.953 Y116.934 E.19743
G1 X123.386 Y116.934 E.00926
G1 X132.498 Y107.822 E.21053
G1 X132.498 Y107.255 E.00926
G1 X122.819 Y116.934 E.22363
G1 X122.252 Y116.934 E.00926
G1 X132.498 Y106.688 E.23673
G1 X132.498 Y106.121 E.00926
G1 X121.685 Y116.934 E.24983
G1 X121.118 Y116.934 E.00926
G1 X132.498 Y105.553 E.26294
G1 X132.498 Y104.986 E.00926
G1 X120.551 Y116.934 E.27604
G1 X120.115 Y116.934 E.00712
G1 X120.002 Y116.915 E.00187
G1 X132.48 Y104.438 E.28829
G1 X132.367 Y104.419 E.00187
G1 X131.931 Y104.419 E.00711
G1 X119.983 Y116.367 E.27605
G1 X119.983 Y115.8 E.00926
G1 X131.364 Y104.419 E.26294
G1 X130.797 Y104.419 E.00926
G1 X119.983 Y115.233 E.24984
G1 X119.983 Y114.666 E.00926
G1 X130.23 Y104.419 E.23674
G1 X129.663 Y104.419 E.00926
G1 X119.983 Y114.099 E.22364
G1 X119.983 Y113.531 E.00926
G1 X129.096 Y104.419 E.21054
G1 X128.529 Y104.419 E.00926
G1 X119.983 Y112.964 E.19743
G1 X119.983 Y112.397 E.00926
G1 X127.962 Y104.419 E.18433
G1 X127.395 Y104.419 E.00926
G1 X119.983 Y111.83 E.17123
G1 X119.983 Y111.263 E.00926
G1 X126.827 Y104.419 E.15813
G1 X126.26 Y104.419 E.00926
G1 X119.983 Y110.696 E.14503
G1 X119.983 Y110.129 E.00926
G1 X125.693 Y104.419 E.13192
G1 X125.126 Y104.419 E.00926
G1 X119.983 Y109.562 E.11882
G1 X119.983 Y108.995 E.00926
G1 X124.559 Y104.419 E.10572
G1 X123.992 Y104.419 E.00926
G1 X119.983 Y108.428 E.09262
G1 X119.983 Y107.861 E.00926
G1 X123.425 Y104.419 E.07952
G1 X122.858 Y104.419 E.00926
G1 X119.983 Y107.294 E.06641
G1 X119.983 Y106.727 E.00926
G1 X122.291 Y104.419 E.05331
G1 X121.724 Y104.419 E.00926
G1 X119.983 Y106.16 E.04021
G1 X119.983 Y105.592 E.00926
G1 X121.157 Y104.419 E.02711
G1 X120.59 Y104.419 E.00926
G1 X119.983 Y105.025 E.01401
G1 X119.983 Y104.551 E.00776
G1 X120.001 Y104.441 E.00181
G1 X120.202 Y104.24 E.00465
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.001 Y104.441 E-.10809
G1 X119.983 Y104.551 E-.04218
G1 X119.983 Y105.025 E-.18043
G1 X120.59 Y104.419 E-.3258
G1 X120.862 Y104.419 E-.1035
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 3/72
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.209 J-.141 P1  F42000
G1 X114.371 Y160.009 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X114.354 Y160.043 E.00066
G3 X112.874 Y161.047 I-1.513 J-.637 E.03302
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.642 J.033 E.04387
G1 X112.874 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.642 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.449 Y159.74 I-1.642 J-.033 E.0053
G1 X114.388 Y159.951 E.00384
M204 S250
G1 X113.973 Y159.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X112.864 Y160.634 I-1.128 J-.475 E.02298
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X113.995 Y159.829 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X113.866 Y160.096 E-.11274
G1 X113.715 Y160.279 E-.09013
G1 X113.532 Y160.43 E-.09015
G1 X113.322 Y160.542 E-.09012
G1 X113.095 Y160.611 E-.0902
G1 X112.864 Y160.634 E-.08819
G1 X112.342 Y160.634 E-.19848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.298 Y154.905 Z.7 F42000
G1 X94.405 Y140.264 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.252 J1.958 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.527 Y140.323 I2.33 J-.234 E.01041
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.389 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12435
G1 X94.007 Y140.572 E-.07661
G1 X93.872 Y140.721 E-.07656
G1 X93.7 Y140.97 E-.115
G1 X93.511 Y140.918 E-.07434
G1 X93.511 Y140.45 E-.17789
G1 X93.527 Y140.323 E-.04847
G1 X93.591 Y140.204 E-.05142
G1 X93.621 Y140.177 E-.01536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.254 Y140.155 Z.7 F42000
G1 X114.622 Y140.118 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X114.807 Y140.449 I-.166 J.31 E.00699
G1 X114.807 Y140.918 E.00817
G1 X114.619 Y140.97 E.00342
G2 X113.913 Y140.264 I-1.959 J1.253 E.01756
G1 X113.965 Y140.076 E.00342
G3 X114.493 Y140.079 I.234 J5.351 E.00922
G3 X114.567 Y140.095 I-.037 J.35 E.00132
; WIPE_START
G1 X114.727 Y140.204 E-.07363
G1 X114.791 Y140.323 E-.05144
G1 X114.807 Y140.449 E-.04845
G1 X114.807 Y140.918 E-.17791
G1 X114.619 Y140.97 E-.07433
G1 X114.447 Y140.721 E-.11498
G1 X114.311 Y140.572 E-.07662
G1 X114.162 Y140.436 E-.07661
G1 X114.019 Y140.337 E-.06603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.246 Y147.966 Z.7 F42000
G1 X114.619 Y160.477 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.33 J.234 E.01042
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X114.807 Y160.529 E-.08419
G1 X114.807 Y160.998 E-.17789
G1 X114.791 Y161.124 E-.04851
G1 X114.727 Y161.243 E-.05139
G1 X114.652 Y161.312 E-.03865
G1 X114.56 Y161.355 E-.03874
G1 X114.433 Y161.372 E-.04843
G1 X113.965 Y161.372 E-.17788
G1 X113.913 Y161.183 E-.07433
G1 X113.956 Y161.153 E-.01998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z.7 F42000
G1 X94.405 Y161.183 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00342
G3 X93.759 Y161.355 I-.234 J-2.33 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00818
G1 X93.7 Y160.477 E.00342
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.736 J-1.179 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08367
G1 X93.885 Y161.372 E-.17788
G1 X93.759 Y161.355 E-.04847
G1 X93.667 Y161.312 E-.03869
G1 X93.571 Y161.216 E-.05135
G1 X93.527 Y161.124 E-.03874
G1 X93.511 Y160.998 E-.04845
G1 X93.511 Y160.529 E-.17792
G1 X93.7 Y160.477 E-.07433
G1 X93.728 Y160.524 E-.0205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z.7 F42000
G1 X114.888 Y139.782 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.951 Y139.825 E.00133
G3 X115.236 Y140.439 I-.495 J.603 E.01223
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.004 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.004 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.523 Y139.651 E.36053
G1 X114.535 Y139.652 E.00021
G3 X114.825 Y139.74 I-.079 J.776 E.00532
G1 X114.838 Y139.749 E.00028
M204 S250
G1 X115.122 Y139.436 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.296 Y139.586 E.00373
G3 X115.649 Y140.429 I-.851 J.851 E.01521
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.543 Y139.238 E.33578
G3 X115.072 Y139.41 I-.098 J1.2 E.0091
; WIPE_START
M204 S6000
G1 X115.296 Y139.586 E-.10868
G1 X115.449 Y139.763 E-.08847
G1 X115.558 Y139.968 E-.08859
G1 X115.626 Y140.192 E-.08866
G1 X115.649 Y140.429 E-.09058
G1 X115.649 Y141.205 E-.29502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 3 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z0.700
; object ids of this layer3 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.407931
G1 F15000
M204 S6000
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00484
; LINE_WIDTH: 0.405766
G1 X114.817 Y160.007 E.00312
; LINE_WIDTH: 0.444709
G3 X114.767 Y160.296 I-5.79 J-.846 E.00506
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.130899
M73 P39 R14
G1 F15000
M204 S6000
G3 X114.352 Y161.157 I-.319 J-.047 E.0017
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.44472
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.15 J-5.824 E.00506
; LINE_WIDTH: 0.405759
G1 X113.244 Y161.405 E.00312
; LINE_WIDTH: 0.346463
G1 X112.88 Y161.424 E.00484
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407926
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444737
G3 X94.587 Y161.332 I.868 J-5.918 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125574
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.049 J-.312 E.00169
M204 S10000
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.444723
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.81 J-1.148 E.00506
; LINE_WIDTH: 0.407928
G1 X93.479 Y159.827 E.00286
; LINE_WIDTH: 0.346464
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405775
G1 X93.501 Y141.44 E.00312
; LINE_WIDTH: 0.444717
G3 X93.551 Y141.151 I5.875 J.861 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125604
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.048 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.444733
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.165 J5.915 E.00506
; LINE_WIDTH: 0.407911
G1 X95.056 Y140.043 E.00286
; LINE_WIDTH: 0.346463
G1 X95.439 Y140.024 E.00507
G1 X112.88 Y140.024 E.23095
G1 X113.244 Y140.042 E.00483
; LINE_WIDTH: 0.405763
G1 X113.443 Y140.066 E.00313
; LINE_WIDTH: 0.444727
G3 X113.732 Y140.115 I-.878 J5.975 E.00506
M204 S10000
G1 X114.359 Y140.29 F42000
; LINE_WIDTH: 0.139227
G1 F15000
M204 S6000
G3 X114.592 Y140.524 I-.081 J.314 E.00166
M204 S10000
G1 X114.767 Y141.151 F42000
; LINE_WIDTH: 0.44474
G1 F15000
M204 S6000
G3 X114.817 Y141.44 I-5.941 J1.169 E.00506
; OBJECT_ID: 137
; WIPE_START
G1 X114.767 Y141.151 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X122.392 Y141.498 Z.7 F42000
G1 X162.839 Y143.341 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.213 Y143.406 E.00616
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03759
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X143.142 Y162.036 E.02827
G1 X142.575 Y162.116 E.00931
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.213 Y143.406 E-.14725
G1 X162.844 Y144.976 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.344 Z.7 F42000
G1 X163.148 Y122.824 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z.7 F42000
G1 X158.543 Y113.936 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z.7 F42000
G1 X144.743 Y97.086 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
M73 P39 R13
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.113 J-13.398 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.067 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.501 J-13.518 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z.7 F42000
G1 X159.301 Y97.086 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
M73 P40 R13
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z.7 F42000
G1 X161.531 Y105.786 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.937 J-13.731 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.446 Y99.416 Z.7 F42000
G1 X158.757 Y98.251 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.489 Y115.669 E.01179
G1 X159.15 Y115.908 E.00674
G1 X158.757 Y115.989 E.00651
G1 X142.124 Y115.989 E.27007
G1 X141.709 Y115.898 E.00691
G1 X141.559 Y115.813 E.00281
G1 X141.241 Y115.454 E.00777
G1 X141.128 Y114.993 E.00772
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.155 J-13.224 E.06092
G1 X158.18 Y117.514 E.2512
G2 X161.278 Y115.424 I-8.171 J-15.453 E.0608
G1 X161.278 Y107.839 E.12315
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
; LINE_WIDTH: 0.439465
G1 X160.043 Y115.322 E.0059
; LINE_WIDTH: 0.478415
G1 X159.934 Y115.65 E.00645
; LINE_WIDTH: 0.517365
G1 F14518.91
G1 X159.825 Y115.979 E.007
G1 X160.128 Y115.773 E.00742
; LINE_WIDTH: 0.478415
G1 F15000
G1 X160.432 Y115.567 E.00683
; LINE_WIDTH: 0.420857
G2 X160.88 Y115.241 I-1.491 J-2.522 E.00902
G1 X160.88 Y108.238 E.11397
G1 X160.474 Y108.238 E.00659
G1 X160.209 Y108.149 E.00456
M204 S10000
G1 X160.515 Y115.07 F42000
; LINE_WIDTH: 0.35059
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08594
M204 S10000
G1 X159.326 Y116.318 F42000
; LINE_WIDTH: 0.52579
G1 F14276.367
M204 S6000
G1 X159.775 Y116.013 E.01116
M204 S10000
G1 X158.047 Y116.388 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.124 Y116.388 E.25854
; LINE_WIDTH: 0.443688
G1 X141.824 Y116.346 E.00522
; LINE_WIDTH: 0.474986
G1 X141.523 Y116.304 E.00561
G1 X142.041 Y116.684 E.01188
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01283
G1 X142.901 Y117.115 E.00287
G1 X158.083 Y117.115 E.24652
G1 X158.838 Y116.69 E.01407
; LINE_WIDTH: 0.443678
G1 X159.082 Y116.504 E.00528
; LINE_WIDTH: 0.47602
G1 X159.326 Y116.318 E.00568
G1 X158.797 Y116.387 E.00987
; LINE_WIDTH: 0.41999
G1 X158.107 Y116.388 E.01121
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.934 Y116.752 E.20158
M204 S10000
G1 X141.312 Y116.171 F42000
; LINE_WIDTH: 0.50393
G1 F14923.208
M204 S6000
G1 X141.472 Y116.272 E.00372
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08596
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.702 Y115.795 E.01449
; LINE_WIDTH: 0.438263
G1 X141.007 Y115.983 E.00608
; LINE_WIDTH: 0.462841
G1 X141.312 Y116.171 E.00644
G1 X140.888 Y115.639 E.01222
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00982
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.092 J-13.776 E.07294
G1 X158.374 Y118.311 E.25759
G1 X159.431 Y117.728 E.0196
G2 X161.537 Y116.253 I-11.004 J-17.945 E.04178
G1 X162.075 Y115.789 E.01153
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.866 Y115.16 E.00308
G1 X158.757 Y115.192 E.00185
G1 X142.124 Y115.192 E.27007
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.611 J-13.477 E.06694
G1 X158.277 Y117.912 E.25445
G2 X161.677 Y115.606 I-8.197 J-15.743 E.06687
G1 X161.677 Y107.441 E.13262
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.196 Y115.398 E.00708
G1 X158.993 Y115.542 E.00405
G1 X158.757 Y115.591 E.00391
G1 X142.124 Y115.591 E.27021
G1 X141.875 Y115.536 E.00415
G1 X141.595 Y115.27 E.00628
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z.7 F42000
G1 X144.107 Y94.026 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.912 Y99.358 Z.7 F42000
G1 X119.681 Y117.154 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X119.591 Y116.854 I.35 J-.268 E.00559
G1 X119.591 Y104.499 E.21574
G3 X120.063 Y104.027 I.439 J-.032 E.01321
G1 X132.419 Y104.027 E.21574
G1 X132.618 Y104.059 E.00352
G3 X132.89 Y104.499 I-.167 J.408 E.00966
G1 X132.89 Y116.854 E.21574
G3 X132.419 Y117.326 I-.439 J.032 E.01321
G1 X120.063 Y117.326 E.21574
G3 X119.721 Y117.199 I-.032 J-.439 E.00657
M204 S10000
G1 X119.332 Y117.42 F42000
G1 F6000
M204 S6000
G1 X119.332 Y117.408 E.00021
G3 X119.21 Y117.187 I.72 J-.543 E.00441
G1 X119.163 Y116.888 E.00529
G1 X119.163 Y104.465 E.21691
G1 X119.21 Y104.166 E.00529
G3 X119.73 Y103.646 I.842 J.322 E.01321
G1 X120.029 Y103.599 E.00529
G1 X132.452 Y103.599 E.21692
G1 X132.752 Y103.646 E.00529
G3 X133.271 Y104.166 I-.322 J.842 E.01321
G1 X133.319 Y104.465 E.00529
G1 X133.319 Y116.888 E.21692
G1 X133.271 Y117.187 E.00529
G3 X132.752 Y117.707 I-.842 J-.322 E.01321
G1 X132.452 Y117.754 E.00529
G1 X120.029 Y117.754 E.21691
G1 X119.73 Y117.707 E.00529
G3 X119.51 Y117.585 I.322 J-.842 E.00441
G1 X119.376 Y117.461 E.00318
M204 S250
G1 X119.04 Y117.712 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.987 Y117.659 E.00122
G1 X118.812 Y117.317 E.00624
G1 X118.749 Y116.902 E.0068
G1 X118.749 Y104.45 E.2022
G1 X118.812 Y104.036 E.0068
G1 X118.987 Y103.694 E.00624
G1 X119.258 Y103.422 E.00624
G1 X119.6 Y103.248 E.00624
G1 X120.015 Y103.185 E.0068
G1 X132.467 Y103.185 E.2022
G1 X132.511 Y103.189 E.00071
G1 X132.881 Y103.248 E.00609
G1 X133.223 Y103.422 E.00624
G1 X133.495 Y103.694 E.00624
G1 X133.669 Y104.036 E.00624
G1 X133.732 Y104.45 E.0068
G1 X133.732 Y116.902 E.2022
G1 X133.669 Y117.317 E.0068
G1 X133.495 Y117.659 E.00624
G1 X133.223 Y117.931 E.00624
G1 X132.881 Y118.105 E.00624
G1 X132.467 Y118.168 E.0068
G1 X120.015 Y118.168 E.2022
G1 X119.601 Y118.105 E.0068
G1 X119.258 Y117.931 E.00624
G1 X119.082 Y117.755 E.00404
; WIPE_START
M204 S6000
G1 X118.987 Y117.659 E-.05143
G1 X118.812 Y117.317 E-.14598
G1 X118.749 Y116.902 E-.15921
G1 X118.749 Y115.841 E-.40338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.764 Y116.744 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42468
G1 F15000
M204 S6000
G1 X119.975 Y116.956 E.00492
G1 X120.091 Y116.974 E.00192
G1 X120.564 Y116.974 E.00777
G1 X119.943 Y116.353 E.01442
G1 X119.943 Y115.783 E.00937
G1 X121.134 Y116.974 E.02767
G1 X121.704 Y116.974 E.00937
G1 X119.943 Y115.213 E.04092
G1 X119.943 Y114.643 E.00937
G1 X122.274 Y116.974 E.05417
G1 X122.845 Y116.974 E.00937
G1 X119.943 Y114.072 E.06742
G1 X119.943 Y113.502 E.00937
G1 X123.415 Y116.974 E.08067
G1 X123.985 Y116.974 E.00937
G1 X119.943 Y112.932 E.09392
G1 X119.943 Y112.362 E.00937
G1 X124.555 Y116.974 E.10717
G1 X125.126 Y116.974 E.00937
G1 X119.943 Y111.792 E.12041
G1 X119.943 Y111.221 E.00937
G1 X125.696 Y116.974 E.13366
G1 X126.266 Y116.974 E.00937
G1 X119.943 Y110.651 E.14691
G1 X119.943 Y110.081 E.00937
G1 X126.836 Y116.974 E.16016
G1 X127.407 Y116.974 E.00937
G1 X119.943 Y109.511 E.17341
G1 X119.943 Y108.94 E.00937
G1 X127.977 Y116.974 E.18666
G1 X128.547 Y116.974 E.00937
G1 X119.943 Y108.37 E.19991
G1 X119.943 Y107.8 E.00937
G1 X129.117 Y116.974 E.21316
G1 X129.688 Y116.974 E.00937
G1 X119.943 Y107.23 E.2264
G1 X119.943 Y106.659 E.00937
G1 X130.258 Y116.974 E.23965
G1 X130.828 Y116.974 E.00937
G1 X119.943 Y106.089 E.2529
G1 X119.943 Y105.519 E.00937
G1 X131.398 Y116.974 E.26615
G1 X131.969 Y116.974 E.00937
G1 X119.943 Y104.949 E.2794
M73 P41 R13
G1 X119.943 Y104.526 E.00694
G3 X119.964 Y104.404 I.199 J-.028 E.00207
G1 X132.515 Y116.951 E.29156
G2 X132.539 Y116.827 I-.13 J-.089 E.00214
G1 X132.539 Y116.404 E.00695
G1 X120.513 Y104.379 E.27939
G1 X121.084 Y104.379 E.00937
G1 X132.539 Y115.834 E.26614
G1 X132.539 Y115.263 E.00937
G1 X121.654 Y104.379 E.25289
G1 X122.224 Y104.379 E.00937
G1 X132.539 Y114.693 E.23964
G1 X132.539 Y114.123 E.00937
G1 X122.794 Y104.379 E.22639
G1 X123.365 Y104.379 E.00937
G1 X132.539 Y113.553 E.21315
G1 X132.539 Y112.982 E.00937
G1 X123.935 Y104.379 E.1999
G1 X124.505 Y104.379 E.00937
G1 X132.539 Y112.412 E.18665
G1 X132.539 Y111.842 E.00937
G1 X125.075 Y104.379 E.1734
G1 X125.646 Y104.379 E.00937
G1 X132.539 Y111.272 E.16015
G1 X132.539 Y110.701 E.00937
G1 X126.216 Y104.379 E.1469
G1 X126.786 Y104.379 E.00937
G1 X132.539 Y110.131 E.13365
G1 X132.539 Y109.561 E.00937
G1 X127.356 Y104.379 E.1204
G1 X127.926 Y104.379 E.00937
G1 X132.539 Y108.991 E.10716
G1 X132.539 Y108.42 E.00937
G1 X128.497 Y104.379 E.09391
G1 X129.067 Y104.379 E.00937
G1 X132.539 Y107.85 E.08066
G1 X132.539 Y107.28 E.00937
G1 X129.637 Y104.379 E.06741
G1 X130.207 Y104.379 E.00937
G1 X132.539 Y106.71 E.05416
G1 X132.539 Y106.14 E.00937
G1 X130.778 Y104.379 E.04091
G1 X131.348 Y104.379 E.00937
G1 X132.539 Y105.569 E.02766
G1 X132.539 Y104.999 E.00937
G1 X131.918 Y104.379 E.01441
G1 X132.391 Y104.379 E.00777
G1 X132.507 Y104.397 E.00193
G1 X132.718 Y104.608 E.00491
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.507 Y104.397 E-.11349
G1 X132.391 Y104.379 E-.04453
G1 X131.918 Y104.379 E-.17968
G1 X132.539 Y104.999 E-.33342
G1 X132.539 Y105.233 E-.08888
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 4/72
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S193.8
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I-1.155 J-.383 P1  F42000
G1 X114.342 Y160.079 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X114.204 Y160.322 E.00487
G3 X112.874 Y161.047 I-1.362 J-.916 E.02748
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.641 J.033 E.04387
G1 X112.874 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.641 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.363 Y160.023 I-1.641 J-.033 E.01048
M204 S250
G1 X113.973 Y159.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X112.864 Y160.634 I-1.128 J-.475 E.02298
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X113.995 Y159.829 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X113.866 Y160.096 E-.11273
G1 X113.715 Y160.279 E-.09017
G1 X113.532 Y160.43 E-.09015
G1 X113.322 Y160.542 E-.09015
G1 X113.095 Y160.611 E-.09015
G1 X112.864 Y160.634 E-.08819
G1 X112.342 Y160.634 E-.19846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.298 Y154.905 Z.8 F42000
G1 X94.406 Y140.264 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.253 J1.959 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.527 Y140.323 I2.332 J-.234 E.01041
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.39 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12435
G1 X94.007 Y140.572 E-.07659
G1 X93.872 Y140.721 E-.07659
G1 X93.7 Y140.97 E-.115
G1 X93.511 Y140.918 E-.07433
G1 X93.511 Y140.45 E-.1779
G1 X93.527 Y140.323 E-.04844
G1 X93.571 Y140.231 E-.0387
G1 X93.623 Y140.179 E-.02809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.256 Y140.157 Z.8 F42000
G1 X114.622 Y140.118 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X114.807 Y140.45 I-.166 J.31 E.00699
G1 X114.807 Y140.918 E.00817
G1 X114.619 Y140.97 E.00342
G2 X113.913 Y140.264 I-1.957 J1.252 E.01756
G1 X113.965 Y140.076 E.00342
G3 X114.485 Y140.078 I.234 J5.268 E.00908
G1 X114.493 Y140.079 E.00014
G3 X114.567 Y140.095 I-.037 J.35 E.00132
; WIPE_START
G1 X114.727 Y140.204 E-.07357
G1 X114.791 Y140.323 E-.0515
G1 X114.807 Y140.45 E-.04845
G1 X114.807 Y140.918 E-.17791
G1 X114.619 Y140.97 E-.07433
G1 X114.447 Y140.721 E-.11501
G1 X114.311 Y140.572 E-.07654
G1 X114.162 Y140.436 E-.07664
G1 X114.019 Y140.337 E-.06605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.246 Y147.966 Z.8 F42000
G1 X114.619 Y160.477 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.331 J.234 E.01041
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.253 J-1.958 E.01651
; WIPE_START
G1 X114.807 Y160.529 E-.08418
G1 X114.807 Y160.998 E-.1779
G1 X114.791 Y161.124 E-.04843
G1 X114.748 Y161.216 E-.0387
G1 X114.652 Y161.312 E-.05145
G1 X114.56 Y161.355 E-.0387
G1 X114.433 Y161.372 E-.04842
G1 X113.965 Y161.372 E-.17789
G1 X113.913 Y161.183 E-.07434
G1 X113.956 Y161.153 E-.01998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z.8 F42000
G1 X94.406 Y161.183 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00342
G3 X93.759 Y161.355 I-.234 J-2.331 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00817
G1 X93.7 Y160.477 E.00342
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.735 J-1.178 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08367
G1 X93.885 Y161.372 E-.1779
G1 X93.759 Y161.355 E-.04842
G1 X93.667 Y161.312 E-.03867
G1 X93.571 Y161.216 E-.05147
G1 X93.527 Y161.124 E-.03872
G1 X93.511 Y160.998 E-.04843
G1 X93.511 Y160.529 E-.17791
G1 X93.7 Y160.477 E-.07433
G1 X93.728 Y160.524 E-.02049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z.8 F42000
G1 X114.888 Y139.782 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X115.236 Y140.439 I-.438 J.652 E.01353
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.005 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.004 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.506 Y139.65 E.36023
G3 X114.837 Y139.75 I-.056 J.784 E.00609
M204 S250
G1 X115.122 Y139.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.296 Y139.586 E.00375
G3 X115.649 Y140.429 I-.85 J.851 E.01521
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.526 Y139.237 E.3355
G3 X115.071 Y139.41 I-.08 J1.2 E.00938
; WIPE_START
M204 S6000
G1 X115.296 Y139.586 E-.10877
G1 X115.449 Y139.763 E-.08845
G1 X115.558 Y139.968 E-.08863
G1 X115.626 Y140.191 E-.08859
G1 X115.649 Y140.429 E-.09062
G1 X115.649 Y141.205 E-.29494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 4 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z0.8 F4000
            G39.3 S1
            G0 Z0.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer4 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.444703
G1 F15000
M204 S6000
G2 X114.768 Y141.151 I-5.995 J.88 E.00506
M204 S10000
G1 X114.817 Y141.44 F42000
; LINE_WIDTH: 0.407916
G1 F15000
M204 S6000
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00484
; LINE_WIDTH: 0.405765
G1 X114.817 Y160.007 E.00312
; LINE_WIDTH: 0.444719
G3 X114.767 Y160.296 I-5.935 J-.87 E.00506
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.13125
G1 F15000
M204 S6000
G3 X114.359 Y161.157 I-.308 J-.035 E.00169
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.444751
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.155 J-5.855 E.00506
; LINE_WIDTH: 0.40579
G1 X113.244 Y161.405 E.00313
; LINE_WIDTH: 0.346463
G1 X112.88 Y161.424 E.00484
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407936
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444732
G3 X94.587 Y161.332 I.866 J-5.902 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125579
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.049 J-.312 E.00169
M204 S10000
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.444744
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.838 J-1.152 E.00506
; LINE_WIDTH: 0.407948
G1 X93.479 Y159.827 E.00286
; LINE_WIDTH: 0.346464
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405783
G1 X93.501 Y141.44 E.00313
; LINE_WIDTH: 0.444728
G3 X93.551 Y141.151 I6.035 J.888 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125581
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.048 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.444725
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.162 J5.901 E.00506
; LINE_WIDTH: 0.407923
G1 X95.056 Y140.043 E.00286
; LINE_WIDTH: 0.346464
G1 X95.439 Y140.024 E.00507
G1 X112.88 Y140.024 E.23095
G1 X113.244 Y140.042 E.00484
; LINE_WIDTH: 0.405773
G1 X113.443 Y140.066 E.00313
; LINE_WIDTH: 0.444717
G3 X113.732 Y140.115 I-.873 J5.944 E.00506
M204 S10000
G1 X114.352 Y140.29 F42000
; LINE_WIDTH: 0.138801
G1 F15000
M204 S6000
G3 X114.592 Y140.524 I-.071 J.314 E.00169
; OBJECT_ID: 137
; WIPE_START
G1 X114.51 Y140.378 E-.36697
G1 X114.352 Y140.29 E-.39303
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X121.969 Y140.77 Z.8 F42000
G1 X162.839 Y143.341 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.157 Y143.396 E.00523
G1 X163.213 Y143.406 E.00093
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
M73 P42 R13
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.157 Y143.396 E-.12576
G1 X163.213 Y143.406 E-.0218
G1 X162.844 Y144.975 E-.61245
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.343 Z.8 F42000
G1 X163.148 Y122.824 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03674
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z.8 F42000
G1 X158.543 Y113.936 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z.8 F42000
G1 X144.743 Y97.086 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.133 J-13.427 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.066 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.518 J-13.543 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.436 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z.8 F42000
G1 X159.301 Y97.086 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z.8 F42000
G1 X161.531 Y105.786 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.953 J-13.754 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.267 Y98.995 Z.8 F42000
G1 X159.96 Y98.295 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X159.123 Y98.295 E.01461
G1 X159.123 Y98.737 E.00773
G1 X158.909 Y98.737 E.00374
G2 X159.061 Y99.09 I.229 J.11 E.00759
G1 X159.454 Y99.78 E.01386
G1 X159.545 Y100.469 E.01215
G3 X158.909 Y101.383 I-1.542 J-.395 E.01985
G1 X158.909 Y104.476 E.054
G1 X159.061 Y104.607 E.00351
G1 X159.454 Y105.297 E.01386
G1 X159.545 Y105.987 E.01215
G3 X158.909 Y106.9 I-1.542 J-.395 E.01985
G1 X158.909 Y109.993 E.054
G1 X159.061 Y110.125 E.00351
G1 X159.454 Y110.815 E.01386
G1 X159.545 Y111.504 E.01215
G3 X158.909 Y112.418 I-1.542 J-.395 E.01985
G1 X158.909 Y114.132 E.02993
M204 S10000
G1 X162.122 Y113.48 F42000
G1 F16200
M204 S6000
G1 X162.122 Y115.194 E.02993
G2 X161.132 Y114.263 I-3.192 J2.403 E.02384
G1 X160.739 Y113.574 E.01386
G1 X160.648 Y112.884 E.01215
G1 X160.745 Y112.539 E.00625
G3 X161.82 Y111.504 I3.535 J2.596 E.02617
G1 X162.122 Y110.974 E.01067
G1 X162.122 Y109.677 E.02265
G2 X161.132 Y108.746 I-3.192 J2.403 E.02384
G1 X160.739 Y108.056 E.01386
G3 X160.767 Y106.995 I1.312 J-.497 E.01901
G1 X160.322 Y106.995 E.00776
G1 X160.322 Y102.358 E.08096
G1 X160.715 Y102.358 E.00686
G3 X160.745 Y101.504 I1.011 J-.392 E.01534
G3 X161.82 Y100.469 I3.535 J2.596 E.02617
G1 X162.122 Y99.938 E.01067
G1 X162.122 Y98.641 E.02265
G2 X161.132 Y97.71 I-3.192 J2.403 E.02384
G1 X160.739 Y97.021 E.01386
G1 X160.648 Y96.331 E.01215
G1 X160.745 Y95.986 E.00625
G3 X161.77 Y94.995 I3.385 J2.474 E.02502
G1 X162.122 Y94.995 E.00615
G1 X162.122 Y96.357 E.02378
; WIPE_START
G1 X162.122 Y94.995 E-.5175
G1 X161.77 Y94.995 E-.13389
G1 X161.554 Y95.182 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.507 Y94.026 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X156.774 Y94.026 E.0074
; WIPE_START
G1 X158.774 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.757 Y98.251 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
M204 S10000
G1 X154.401 Y98.208 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X155.558 Y98.208 E.02021
G1 X155.558 Y97.766 E.00773
G1 X155.673 Y97.766 E.002
G1 X155.222 Y97.021 E.0152
G1 X155.131 Y96.331 E.01215
G3 X155.772 Y95.412 I1.548 J.398 E.01999
G1 X155.772 Y94.995 E.00729
G1 X154.015 Y94.995 E.03068
G1 X153.93 Y95.296 E.00547
G3 X152.856 Y96.331 I-3.535 J-2.597 E.02617
G1 X152.463 Y97.021 E.01386
G1 X152.372 Y97.71 E.01215
G2 X152.593 Y98.208 I.683 J-.006 E.00978
G1 X150.669 Y98.208 E.03359
G3 X149.704 Y97.021 I1.211 J-1.971 E.02723
G1 X149.613 Y96.331 E.01215
G1 X149.71 Y95.986 E.00625
G3 X150.735 Y94.995 I3.385 J2.474 E.02502
G1 X148.498 Y94.995 E.03906
G1 X148.413 Y95.296 E.00547
G3 X147.338 Y96.331 I-3.535 J-2.596 E.02617
G1 X146.945 Y97.021 E.01386
G1 X146.854 Y97.71 E.01215
G2 X147.076 Y98.208 I.683 J-.006 E.00978
G1 X145.362 Y98.208 E.02993
M204 S10000
G1 X144.957 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X142.124 Y98.251 E.02508
; WIPE_START
G1 X144.124 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.374 Y94.026 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X144.107 Y94.026 E.0074
; WIPE_START
G1 X142.107 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.936 Y101.568 Z.8 F42000
G1 X138.759 Y115.578 Z.8
M73 P43 R13
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X138.759 Y115.81 E.00406
G2 X139.905 Y116.749 I9.932 J-10.955 E.02587
G1 X140.142 Y116.332 E.00837
G1 X140.233 Y115.643 E.01215
G2 X139.855 Y114.953 I-.982 J.09 E.01413
G1 X139.062 Y114.263 E.01835
G1 X138.759 Y113.732 E.01067
G1 X138.759 Y112.436 E.02264
G3 X139.749 Y111.504 I3.193 J2.404 E.02385
G1 X140.142 Y110.815 E.01386
G1 X140.233 Y110.125 E.01215
G2 X139.855 Y109.435 I-.982 J.09 E.01413
G1 X139.062 Y108.746 E.01835
G1 X138.759 Y108.215 E.01067
G1 X138.759 Y106.995 E.02129
G1 X140.559 Y106.995 E.03143
G1 X140.559 Y102.358 E.08096
G1 X138.759 Y102.358 E.03143
G1 X138.759 Y101.4 E.01672
G3 X139.749 Y100.469 I3.193 J2.404 E.02385
G1 X140.142 Y99.78 E.01386
G1 X140.233 Y99.09 E.01215
G2 X139.855 Y98.4 I-.982 J.09 E.01413
G1 X139.062 Y97.71 E.01835
G1 X138.759 Y97.179 E.01067
G1 X138.759 Y95.883 E.02264
G3 X139.7 Y94.995 I3.043 J2.281 E.02269
G1 X140.372 Y94.995 E.01175
G1 X140.372 Y98.295 E.05762
G1 X141.758 Y98.295 E.0242
G1 X141.758 Y98.737 E.00773
G1 X141.972 Y98.737 E.00374
G1 X141.972 Y101.717 E.05202
G1 X141.821 Y101.849 E.00351
G1 X141.428 Y102.538 E.01386
G1 X141.337 Y103.228 E.01215
G2 X141.972 Y104.142 I1.542 J-.395 E.01985
G1 X141.972 Y107.235 E.054
G1 X141.821 Y107.366 E.00351
G1 X141.428 Y108.056 E.01386
G1 X141.337 Y108.746 E.01215
G2 X141.972 Y109.659 I1.542 J-.395 E.01985
G1 X141.972 Y112.752 E.054
G1 X141.821 Y112.884 E.00351
G1 X141.428 Y113.574 E.01386
G1 X141.337 Y114.263 E.01215
G2 X141.715 Y114.953 I.982 J-.09 E.01413
G1 X142.508 Y115.643 E.01835
G1 X142.901 Y116.332 E.01386
G1 X142.992 Y117.022 E.01215
G3 X142.11 Y118.15 I-1.846 J-.534 E.02563
G1 X142.498 Y118.358 E.0077
G1 X144.108 Y118.358 E.0281
G3 X144.474 Y117.712 I.926 J.098 E.01334
G1 X145.267 Y117.022 E.01835
G1 X145.66 Y116.332 E.01386
G1 X145.751 Y115.643 E.01215
G2 X145.529 Y115.145 I-.683 J.006 E.00978
G1 X147.453 Y115.145 E.03359
G3 X148.51 Y117.022 I-1.12 J1.866 E.03934
G3 X148.132 Y117.712 I-.982 J-.09 E.01413
G1 X147.388 Y118.358 E.0172
G1 X149.625 Y118.358 E.03906
G3 X149.991 Y117.712 I.926 J.098 E.01334
G1 X150.785 Y117.022 E.01835
G1 X151.178 Y116.332 E.01386
G1 X151.269 Y115.643 E.01215
G2 X151.047 Y115.145 I-.683 J.006 E.00978
G1 X152.971 Y115.145 E.03359
G3 X154.027 Y117.022 I-1.12 J1.866 E.03934
G3 X153.649 Y117.712 I-.982 J-.09 E.01413
G1 X152.906 Y118.358 E.0172
G1 X155.143 Y118.358 E.03906
G3 X155.509 Y117.712 I.926 J.098 E.01334
G1 X156.302 Y117.022 E.01835
G1 X156.695 Y116.332 E.01386
G1 X156.786 Y115.643 E.01215
G2 X156.565 Y115.145 I-.683 J.006 E.00978
G1 X158.489 Y115.145 E.03359
G3 X159.545 Y117.022 I-1.12 J1.866 E.03934
G3 X159.167 Y117.712 I-.982 J-.09 E.01413
G1 X158.386 Y118.358 E.0177
G1 X156.777 Y118.358 E.02808
; OBJECT_ID: 115
; WIPE_START
G1 X158.386 Y118.358 E-.61118
G1 X158.687 Y118.108 E-.14882
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X151.057 Y117.929 Z.8 F42000
G1 X119.644 Y117.188 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X119.551 Y116.879 I.363 J-.277 E.00577
G1 X119.551 Y104.474 E.21659
G3 X120.039 Y103.987 I.455 J-.032 E.01365
G1 X132.443 Y103.987 E.21659
G3 X132.931 Y104.474 I.032 J.455 E.01365
G1 X132.931 Y116.879 E.21659
G3 X132.443 Y117.366 I-.455 J.032 E.01365
G1 X120.039 Y117.366 E.21659
G3 X119.683 Y117.233 I-.032 J-.455 E.00683
M204 S10000
G1 X119.295 Y117.441 F42000
G1 F6000
M204 S6000
G3 X119.171 Y117.217 I.734 J-.554 E.0045
G1 X119.122 Y116.912 E.00538
G1 X119.122 Y104.44 E.21776
G1 X119.171 Y104.136 E.00538
G3 X119.701 Y103.606 I.859 J.329 E.01348
G1 X120.005 Y103.558 E.00538
G1 X132.477 Y103.558 E.21777
G1 X132.781 Y103.606 E.00538
G3 X133.311 Y104.136 I-.329 J.859 E.01348
G1 X133.359 Y104.44 E.00538
G1 X133.359 Y116.912 E.21776
G1 X133.311 Y117.217 E.00538
G3 X132.781 Y117.747 I-.859 J-.329 E.01348
G1 X132.477 Y117.795 E.00538
G1 X120.005 Y117.795 E.21776
G1 X119.701 Y117.747 E.00538
G3 X119.333 Y117.488 I.329 J-.859 E.00793
M204 S250
G1 X118.996 Y117.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.949 Y117.693 E.00108
G1 X118.772 Y117.346 E.00632
G1 X118.709 Y116.927 E.00689
G1 X118.709 Y104.426 E.20299
G1 X118.772 Y104.007 E.00689
G1 X118.949 Y103.66 E.00632
G1 X119.224 Y103.385 E.00632
G1 X119.571 Y103.208 E.00632
G1 X119.99 Y103.145 E.00689
G1 X132.491 Y103.145 E.20299
G3 X132.552 Y103.151 I.009 J.194 E.00099
G1 X132.91 Y103.208 E.0059
G1 X133.257 Y103.385 E.00632
G1 X133.532 Y103.66 E.00632
G1 X133.709 Y104.007 E.00632
G1 X133.773 Y104.426 E.00689
G1 X133.773 Y116.927 E.20299
G1 X133.709 Y117.346 E.00689
G1 X133.532 Y117.693 E.00632
G1 X133.257 Y117.968 E.00632
G1 X132.91 Y118.145 E.00632
G1 X132.491 Y118.208 E.00689
G1 X119.99 Y118.208 E.20299
G1 X119.571 Y118.145 E.00689
G1 X119.224 Y117.968 E.00632
G1 X119.038 Y117.782 E.00427
; WIPE_START
M204 S6000
G1 X118.949 Y117.693 E-.04802
G1 X118.772 Y117.346 E-.14791
G1 X118.709 Y116.927 E-.16115
G1 X118.709 Y115.866 E-.40292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.917 Y115.092 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X119.917 Y116.806 E.02993
G3 X120.274 Y116.194 I.881 J.104 E.01271
G1 X121.067 Y115.504 E.01835
G1 X121.46 Y114.815 E.01386
G1 X121.551 Y114.125 E.01215
G2 X121.173 Y113.435 I-.982 J.09 E.01413
G1 X120.38 Y112.746 E.01835
G1 X119.986 Y112.056 E.01386
G3 X119.992 Y111.021 I1.694 J-.507 E.01833
G3 X121.067 Y109.987 I3.535 J2.597 E.02617
G1 X121.46 Y109.297 E.01386
G1 X121.551 Y108.607 E.01215
G2 X121.173 Y107.918 I-.982 J.09 E.01413
G1 X120.38 Y107.228 E.01835
G1 X119.986 Y106.538 E.01386
G3 X119.992 Y105.504 I1.694 J-.508 E.01833
G3 X121.133 Y104.353 I54.818 J53.204 E.02829
G1 X124.294 Y104.353 E.0552
G3 X123.932 Y105.159 I-1.009 J.03 E.01597
G1 X123.138 Y105.849 E.01835
G1 X122.745 Y106.538 E.01386
G1 X122.654 Y107.228 E.01215
G2 X123.032 Y107.918 I.982 J-.09 E.01413
G1 X123.826 Y108.607 E.01835
G1 X124.219 Y109.297 E.01386
G1 X124.31 Y109.987 E.01215
G3 X123.932 Y110.677 I-.982 J-.09 E.01413
G1 X123.138 Y111.366 E.01835
G1 X122.745 Y112.056 E.01386
G1 X122.654 Y112.746 E.01215
G2 X123.032 Y113.435 I.982 J-.09 E.01413
G1 X123.826 Y114.125 E.01835
G1 X124.219 Y114.815 E.01386
G1 X124.31 Y115.504 E.01215
G3 X123.932 Y116.194 I-.982 J-.09 E.01413
G1 X123.072 Y117 E.02057
G1 X125.428 Y117 E.04114
G3 X125.791 Y116.194 I1.009 J-.03 E.01597
G1 X126.585 Y115.504 E.01835
G1 X126.978 Y114.815 E.01386
G1 X127.069 Y114.125 E.01215
G2 X126.69 Y113.435 I-.982 J.09 E.01413
G1 X125.897 Y112.746 E.01835
G1 X125.504 Y112.056 E.01386
G1 X125.413 Y111.366 E.01215
G3 X125.791 Y110.677 I.982 J.09 E.01413
G1 X126.585 Y109.987 E.01835
G1 X126.978 Y109.297 E.01386
G1 X127.069 Y108.607 E.01215
G2 X126.69 Y107.918 I-.982 J.09 E.01413
G1 X125.897 Y107.228 E.01835
G1 X125.504 Y106.538 E.01386
G1 X125.413 Y105.849 E.01215
G3 X125.791 Y105.159 I.982 J.09 E.01413
G1 X126.651 Y104.353 E.02057
G1 X129.812 Y104.353 E.0552
G3 X129.449 Y105.159 I-1.009 J.03 E.01597
G1 X128.656 Y105.849 E.01835
G1 X128.263 Y106.538 E.01386
G1 X128.172 Y107.228 E.01215
G2 X128.55 Y107.918 I.982 J-.09 E.01413
G1 X129.343 Y108.607 E.01835
G1 X129.736 Y109.297 E.01386
G1 X129.827 Y109.987 E.01215
G3 X129.449 Y110.677 I-.982 J-.09 E.01413
G1 X128.656 Y111.366 E.01835
G1 X128.263 Y112.056 E.01386
G1 X128.172 Y112.746 E.01215
G2 X128.55 Y113.435 I.982 J-.09 E.01413
G1 X129.343 Y114.125 E.01835
G1 X129.736 Y114.815 E.01386
G1 X129.827 Y115.504 E.01215
G3 X129.449 Y116.194 I-.982 J-.09 E.01413
G1 X128.59 Y117 E.02057
G1 X130.946 Y117 E.04114
G3 X131.309 Y116.194 I1.009 J-.03 E.01597
G1 X132.102 Y115.504 E.01835
G1 X132.495 Y114.815 E.01386
G2 X132.489 Y113.78 I-1.698 J-.507 E.01833
G2 X131.415 Y112.746 I-3.535 J2.597 E.02617
G1 X131.022 Y112.056 E.01386
G1 X130.931 Y111.366 E.01215
G3 X131.309 Y110.677 I.982 J.09 E.01413
G1 X132.102 Y109.987 E.01835
G1 X132.495 Y109.297 E.01386
G2 X132.489 Y108.263 I-1.698 J-.507 E.01833
G2 X131.415 Y107.228 I-3.535 J2.597 E.02617
G1 X131.022 Y106.538 E.01386
G1 X130.931 Y105.849 E.01215
G3 X131.309 Y105.159 I.982 J.09 E.01413
G1 X132.168 Y104.353 E.02057
G3 X132.545 Y104.385 I.123 J.793 E.00667
G1 X132.564 Y105.713 E.02319
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X132.545 Y104.385 E-.50471
G1 X132.168 Y104.353 E-.14381
G1 X131.954 Y104.554 E-.11149
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 5/72
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-1.16 J-.368 P1  F42000
G1 X114.341 Y160.08 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X114.204 Y160.322 E.00486
G3 X112.874 Y161.047 I-1.362 J-.916 E.02748
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.641 J.033 E.04387
G1 X112.874 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.641 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.362 Y160.024 I-1.641 J-.033 E.01049
M204 S250
G1 X113.973 Y159.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X112.864 Y160.634 I-1.128 J-.475 E.02299
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X113.995 Y159.829 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X113.866 Y160.096 E-.11275
G1 X113.715 Y160.279 E-.09016
G1 X113.532 Y160.43 E-.09015
G1 X113.322 Y160.542 E-.09015
G1 X113.095 Y160.611 E-.09017
G1 X112.864 Y160.634 E-.08818
G1 X112.342 Y160.634 E-.19842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.298 Y154.905 Z.9 F42000
G1 X94.405 Y140.264 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.252 J1.958 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.527 Y140.323 I2.33 J-.234 E.01042
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.39 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12441
G1 X94.007 Y140.572 E-.07656
G1 X93.872 Y140.721 E-.07655
G1 X93.7 Y140.97 E-.11502
G1 X93.511 Y140.918 E-.07433
G1 X93.511 Y140.45 E-.1779
G1 X93.527 Y140.323 E-.04849
G1 X93.571 Y140.231 E-.03863
G1 X93.623 Y140.179 E-.02811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.256 Y140.157 Z.9 F42000
G1 X114.622 Y140.118 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X114.807 Y140.45 I-.166 J.31 E.00699
G1 X114.807 Y140.918 E.00817
G1 X114.619 Y140.97 E.00341
G2 X113.913 Y140.264 I-1.958 J1.252 E.01756
G1 X113.965 Y140.076 E.00342
G3 X114.468 Y140.077 I.234 J5.096 E.00878
G1 X114.493 Y140.079 E.00045
G3 X114.567 Y140.095 I-.037 J.35 E.00132
; WIPE_START
G1 X114.727 Y140.204 E-.07362
G1 X114.791 Y140.323 E-.05144
G1 X114.807 Y140.45 E-.04849
G1 X114.807 Y140.918 E-.17789
G1 X114.619 Y140.97 E-.07432
G1 X114.447 Y140.721 E-.11497
G1 X114.311 Y140.572 E-.0766
G1 X114.162 Y140.436 E-.07658
G1 X114.019 Y140.337 E-.06609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.246 Y147.966 Z.9 F42000
G1 X114.619 Y160.477 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.33 J.234 E.01042
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.252 J-1.958 E.01652
; WIPE_START
G1 X114.807 Y160.529 E-.08417
G1 X114.807 Y160.998 E-.1779
G1 X114.791 Y161.124 E-.04848
G1 X114.727 Y161.243 E-.05139
G1 X114.652 Y161.312 E-.0387
G1 X114.56 Y161.355 E-.03865
G1 X114.433 Y161.372 E-.04849
G1 X113.965 Y161.372 E-.17789
G1 X113.913 Y161.183 E-.07433
G1 X113.956 Y161.153 E-.01999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z.9 F42000
G1 X94.406 Y161.183 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00342
G3 X93.759 Y161.355 I-.234 J-2.332 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00817
G1 X93.7 Y160.477 E.00342
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.735 J-1.179 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08367
G1 X93.885 Y161.372 E-.1779
G1 X93.759 Y161.355 E-.04845
G1 X93.667 Y161.312 E-.03874
G1 X93.571 Y161.216 E-.05138
G1 X93.527 Y161.124 E-.03867
G1 X93.511 Y160.998 E-.04847
G1 X93.511 Y160.529 E-.17791
G1 X93.7 Y160.477 E-.07433
G1 X93.728 Y160.523 E-.02047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z.9 F42000
G1 X114.888 Y139.782 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X115.236 Y140.439 I-.438 J.652 E.01353
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.004 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.004 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.489 Y139.649 E.35993
G3 X114.837 Y139.75 I-.038 J.784 E.00639
M204 S250
G1 X115.119 Y139.434 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.117 Y139.439 E.00009
G3 X115.649 Y140.429 I-.671 J.998 E.01899
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.509 Y139.236 E.33523
G3 X114.913 Y139.329 I-.062 J1.201 E.00676
G1 X115.066 Y139.407 E.00279
; WIPE_START
M204 S6000
G1 X115.117 Y139.439 E-.02299
G1 X115.301 Y139.582 E-.08845
G1 X115.449 Y139.763 E-.08866
G1 X115.559 Y139.968 E-.08866
G1 X115.626 Y140.191 E-.08855
G1 X115.649 Y140.429 E-.09061
G1 X115.649 Y141.197 E-.29208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 5 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z0.9 F4000
            G39.3 S1
            G0 Z0.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer5 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.444725
G1 F15000
M204 S6000
G2 X114.767 Y141.151 I-5.833 J.854 E.00506
M204 S10000
G1 X114.817 Y141.44 F42000
; LINE_WIDTH: 0.407928
G1 F15000
M204 S6000
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00484
; LINE_WIDTH: 0.405806
G1 X114.817 Y160.007 E.00313
; LINE_WIDTH: 0.444747
G3 X114.767 Y160.296 I-5.857 J-.858 E.00505
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.130882
G1 F15000
M204 S6000
M73 P43 R12
G3 X114.352 Y161.157 I-.319 J-.047 E.0017
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.444718
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.139 J-5.761 E.00506
; LINE_WIDTH: 0.405766
G1 X113.244 Y161.405 E.00312
; LINE_WIDTH: 0.346463
G1 X112.88 Y161.424 E.00484
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407923
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444712
G3 X94.587 Y161.332 I.868 J-5.914 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125585
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.049 J-.312 E.00169
M204 S10000
M73 P44 R12
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.444719
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.802 J-1.146 E.00506
; LINE_WIDTH: 0.407913
G1 X93.479 Y159.826 E.00286
; LINE_WIDTH: 0.346464
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405765
G1 X93.501 Y141.44 E.00312
; LINE_WIDTH: 0.444717
G3 X93.551 Y141.151 I5.899 J.865 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125623
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.048 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.444731
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.174 J5.964 E.00506
; LINE_WIDTH: 0.407913
G1 X95.056 Y140.043 E.00286
; LINE_WIDTH: 0.346464
G1 X95.439 Y140.024 E.00507
G1 X112.88 Y140.024 E.23095
G1 X113.244 Y140.042 E.00484
; LINE_WIDTH: 0.405787
G1 X113.443 Y140.066 E.00313
; LINE_WIDTH: 0.444729
G3 X113.732 Y140.115 I-.875 J5.961 E.00506
M204 S10000
G1 X114.335 Y140.29 F42000
; LINE_WIDTH: 0.13609
G1 F15000
M204 S6000
G3 X114.592 Y140.531 I-.044 J.305 E.00175
; OBJECT_ID: 137
; WIPE_START
G1 X114.508 Y140.375 E-.36374
G1 X114.335 Y140.29 E-.39626
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X121.952 Y140.769 Z.9 F42000
G1 X162.839 Y143.341 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.078 Y143.382 E.00393
G1 X163.213 Y143.406 E.00223
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03675
G1 X124.184 Y155.014 E.03674
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X148.312 Y160.407 E.02019
G1 X149.27 Y160.06 E.01655
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.014 E.03675
G1 X158.222 Y153.324 E.03674
G1 X159.552 Y151.493 E.03675
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.078 Y143.382 E-.09601
G1 X163.213 Y143.406 E-.0522
G1 X162.845 Y144.973 E-.61179
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.341 Z.9 F42000
G1 X163.148 Y122.824 Z.9
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132 E.03674
G1 X124.682 Y133.691 E.03675
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z.9 F42000
G1 X158.543 Y113.936 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z.9 F42000
G1 X144.743 Y97.086 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.151 J-13.453 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.067 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.535 J-13.568 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.111 J-16.436 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z.9 F42000
G1 X159.301 Y97.086 Z.9
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z.9 F42000
G1 X161.531 Y105.786 Z.9
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.968 J-13.777 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.235 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.122 Y113.286 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X162.122 Y115 E.02993
G1 X161.174 Y114.263 E.02098
G1 X160.711 Y113.574 E.0145
G1 X160.552 Y112.884 E.01236
G3 X160.866 Y112.194 I.777 J-.063 E.01382
G1 X161.778 Y111.504 E.01997
G1 X162.122 Y110.992 E.01078
G1 X162.122 Y109.483 E.02634
G1 X161.174 Y108.746 E.02098
G1 X160.711 Y108.056 E.0145
G1 X160.552 Y107.366 E.01236
G1 X160.623 Y106.995 E.0066
G1 X160.322 Y106.995 E.00524
G1 X160.322 Y102.358 E.08096
G1 X160.67 Y102.358 E.00606
M73 P45 R12
G3 X160.866 Y101.159 I.896 J-.469 E.02276
G1 X161.778 Y100.469 E.01997
G1 X162.122 Y99.956 E.01078
G1 X162.122 Y98.448 E.02634
G1 X161.174 Y97.71 E.02098
G1 X160.711 Y97.021 E.0145
G1 X160.552 Y96.331 E.01236
G3 X160.866 Y95.641 I.777 J-.063 E.01382
G1 X161.721 Y94.995 E.01872
G1 X162.122 Y94.995 E.007
G1 X162.122 Y96.308 E.02293
; WIPE_START
G1 X162.122 Y94.995 E-.49899
G1 X161.721 Y94.995 E-.1524
G1 X161.493 Y95.167 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.507 Y94.026 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X156.774 Y94.026 E.0074
M204 S10000
G1 X144.107 Y94.026 F42000
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.124 Y98.251 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X145.323 Y98.095 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X145.323 Y98.208 E.00196
G1 X146.925 Y98.208 E.02797
G3 X146.758 Y97.71 I.363 J-.399 E.00957
G1 X146.917 Y97.021 E.01236
G1 X147.379 Y96.331 E.0145
G1 X148.292 Y95.641 E.01997
G2 X148.6 Y94.995 I-.427 J-.6 E.01306
G1 X150.686 Y94.995 E.03643
G1 X149.831 Y95.641 E.01872
G2 X149.517 Y96.331 I.462 J.627 E.01382
G1 X149.676 Y97.021 E.01236
G2 X150.797 Y98.208 I2.276 J-1.026 E.02904
G1 X152.443 Y98.208 E.02874
G3 X152.275 Y97.71 I.363 J-.399 E.00957
G1 X152.435 Y97.021 E.01236
G1 X152.897 Y96.331 E.0145
G1 X153.81 Y95.641 E.01997
G2 X154.117 Y94.995 I-.427 J-.6 E.01306
G1 X155.772 Y94.995 E.0289
G1 X155.772 Y95.321 E.00569
G2 X155.034 Y96.331 I.541 J1.17 E.02281
G1 X155.194 Y97.021 E.01236
G2 X155.71 Y97.766 I2.193 J-.97 E.01592
G1 X155.558 Y97.766 E.00266
G1 X155.558 Y98.208 E.00773
G1 X154.439 Y98.208 E.01954
M204 S10000
G1 X155.925 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X158.757 Y98.251 E.02508
M204 S10000
G1 X159.912 Y98.295 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X159.123 Y98.295 E.01377
G1 X159.123 Y98.737 E.00773
G1 X158.909 Y98.737 E.00374
G1 X158.909 Y99.006 E.0047
G1 X159.482 Y99.78 E.0168
G1 X159.641 Y100.469 E.01236
G3 X158.909 Y101.475 I-1.274 J-.158 E.02267
G1 X158.909 Y104.524 E.05324
G1 X159.482 Y105.297 E.0168
G1 X159.641 Y105.987 E.01236
G3 X158.909 Y106.993 I-1.274 J-.158 E.02267
G1 X158.909 Y110.042 E.05324
G1 X159.482 Y110.815 E.0168
G1 X159.641 Y111.504 E.01236
G3 X158.909 Y112.51 I-1.274 J-.158 E.02267
G1 X158.909 Y114.224 E.02993
M204 S10000
G1 X156.982 Y118.358 F42000
G1 F16200
M204 S6000
G1 X158.386 Y118.358 E.02451
G2 X159.327 Y117.712 I-1.422 J-3.08 E.02004
G2 X159.641 Y117.022 I-.462 J-.627 E.01382
G2 X158.361 Y115.145 I-2.575 J.381 E.04105
G1 X156.715 Y115.145 E.02874
G3 X156.883 Y115.643 I-.363 J.399 E.00957
G1 X156.723 Y116.332 E.01236
G1 X156.261 Y117.022 E.0145
G1 X155.348 Y117.712 E.01997
G2 X155.041 Y118.358 I.427 J.6 E.01305
G1 X152.955 Y118.358 E.03642
G1 X153.81 Y117.712 E.01871
G2 X154.124 Y117.022 I-.462 J-.627 E.01382
G2 X152.844 Y115.145 I-2.575 J.381 E.04105
G1 X151.198 Y115.145 E.02874
G3 X151.365 Y115.643 I-.363 J.399 E.00957
G1 X151.206 Y116.332 E.01236
G1 X150.743 Y117.022 E.0145
G1 X149.831 Y117.712 E.01997
G2 X149.523 Y118.358 I.427 J.6 E.01305
G1 X147.437 Y118.358 E.03642
G1 X148.292 Y117.712 E.01871
G2 X148.606 Y117.022 I-.462 J-.627 E.01382
G2 X147.326 Y115.145 I-2.575 J.381 E.04105
G1 X145.68 Y115.145 E.02874
G3 X145.847 Y115.643 I-.363 J.399 E.00957
G1 X145.688 Y116.332 E.01236
G1 X145.226 Y117.022 E.0145
G1 X144.313 Y117.712 E.01997
G2 X144.005 Y118.358 I.427 J.6 E.01305
G1 X142.498 Y118.358 E.02631
G1 X142.159 Y118.177 E.00671
G1 X142.774 Y117.712 E.01346
G2 X143.089 Y117.022 I-.462 J-.627 E.01382
G1 X142.929 Y116.332 E.01236
G1 X142.467 Y115.643 E.0145
G1 X141.554 Y114.953 E.01997
G3 X141.24 Y114.263 I.462 J-.627 E.01382
G1 X141.4 Y113.574 E.01236
G1 X141.972 Y112.801 E.0168
G1 X141.972 Y109.751 E.05324
G3 X141.24 Y108.746 I.542 J-1.164 E.02267
G1 X141.4 Y108.056 E.01236
G1 X141.972 Y107.283 E.0168
G1 X141.972 Y104.234 E.05324
G3 X141.24 Y103.228 I.542 J-1.164 E.02267
G1 X141.4 Y102.538 E.01236
G1 X141.972 Y101.765 E.0168
G1 X141.972 Y98.737 E.05287
G1 X141.758 Y98.737 E.00374
G1 X141.758 Y98.554 E.0032
G3 X141.474 Y98.295 I.325 J-.642 E.0068
G1 X140.372 Y98.295 E.01924
G1 X140.372 Y94.995 E.05762
G1 X139.651 Y94.995 E.0126
G1 X138.759 Y95.689 E.01973
G1 X138.759 Y97.197 E.02633
G1 X139.103 Y97.71 E.01079
G1 X140.016 Y98.4 E.01997
G3 X140.33 Y99.09 I-.462 J.627 E.01382
G1 X140.17 Y99.78 E.01236
G1 X139.708 Y100.469 E.0145
G1 X138.759 Y101.207 E.02098
G1 X138.759 Y102.358 E.0201
G1 X140.559 Y102.358 E.03143
G1 X140.559 Y106.995 E.08096
G1 X138.759 Y106.995 E.03143
G1 X138.759 Y108.232 E.02161
G1 X139.103 Y108.746 E.01079
G1 X140.016 Y109.435 E.01997
G3 X140.33 Y110.125 I-.462 J.627 E.01382
G1 X140.17 Y110.815 E.01236
G1 X139.708 Y111.504 E.0145
G1 X138.759 Y112.242 E.02098
G1 X138.759 Y113.75 E.02633
G1 X139.103 Y114.263 E.01079
G1 X140.016 Y114.953 E.01997
G1 X140.279 Y115.298 E.00758
G3 X139.896 Y116.742 I-1.917 J.264 E.02679
G3 X138.759 Y115.81 I8.718 J-11.796 E.02567
G1 X138.759 Y115.566 E.00426
; OBJECT_ID: 115
; WIPE_START
G1 X138.759 Y115.81 E-.09275
G1 X139.896 Y116.742 E-.55845
G1 X140.055 Y116.504 E-.10879
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.427 Y116.772 Z.9 F42000
G1 X119.606 Y117.222 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X119.51 Y116.903 I.376 J-.287 E.00594
G1 X119.51 Y104.45 E.21744
G3 X120.014 Y103.946 I.471 J-.032 E.01409
G1 X132.467 Y103.946 E.21744
G1 X132.676 Y103.979 E.00369
G3 X132.971 Y104.45 I-.177 J.438 E.01037
G1 X132.971 Y116.903 E.21744
G3 X132.467 Y117.407 I-.471 J.032 E.01409
G1 X120.014 Y117.407 E.21744
G3 X119.646 Y117.267 I-.032 J-.471 E.0071
M204 S10000
G1 X119.258 Y117.475 F42000
G1 F6000
M204 S6000
G3 X119.131 Y117.246 I.749 J-.564 E.00459
G1 X119.082 Y116.937 E.00547
G1 X119.082 Y104.416 E.21861
G1 X119.131 Y104.107 E.00547
G3 X119.671 Y103.567 I.876 J.335 E.01374
G1 X119.98 Y103.518 E.00547
G1 X132.528 Y103.522 E.21908
G3 X133.231 Y103.872 I-.035 J.952 E.01414
G1 X133.351 Y104.107 E.0046
G1 X133.4 Y104.416 E.00547
G1 X133.4 Y116.937 E.21861
G1 X133.351 Y117.246 E.00547
G3 X132.81 Y117.786 I-.876 J-.335 E.01374
G1 X132.501 Y117.835 E.00547
G1 X119.98 Y117.835 E.21861
G1 X119.671 Y117.786 E.00547
G3 X119.295 Y117.522 I.335 J-.876 E.00811
M204 S250
G1 X118.952 Y117.767 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.912 Y117.727 E.00092
G1 X118.733 Y117.375 E.0064
G1 X118.668 Y116.951 E.00697
G1 X118.668 Y104.402 E.20378
G1 X118.733 Y103.978 E.00697
G1 X118.912 Y103.626 E.0064
G1 X119.19 Y103.347 E.0064
G1 X119.542 Y103.168 E.0064
G1 X119.966 Y103.104 E.00697
G1 X132.515 Y103.104 E.20378
G3 X132.593 Y103.113 I.009 J.248 E.00127
G1 X132.94 Y103.168 E.00571
G1 X133.291 Y103.347 E.0064
G1 X133.57 Y103.626 E.0064
G1 X133.749 Y103.978 E.0064
G1 X133.813 Y104.402 E.00697
G1 X133.813 Y116.951 E.20378
G1 X133.749 Y117.375 E.00697
G1 X133.57 Y117.727 E.0064
G1 X133.291 Y118.006 E.0064
G1 X132.94 Y118.185 E.0064
G1 X132.515 Y118.249 E.00697
G1 X119.966 Y118.249 E.20378
G1 X119.542 Y118.185 E.00697
G1 X119.19 Y118.006 E.0064
G1 X118.994 Y117.809 E.00451
; WIPE_START
M204 S6000
G1 X118.912 Y117.727 E-.04442
G1 X118.733 Y117.375 E-.14983
G1 X118.668 Y116.951 E-.16307
G1 X118.668 Y115.891 E-.40268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.877 Y114.789 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X119.877 Y116.503 E.02993
G1 X120.113 Y116.194 E.00679
G1 X121.026 Y115.504 E.01997
G1 X121.488 Y114.815 E.0145
G1 X121.647 Y114.125 E.01236
G2 X121.333 Y113.435 I-.777 J-.063 E.01382
G1 X120.421 Y112.746 E.01997
G1 X119.958 Y112.056 E.0145
G3 X119.877 Y110.986 I2.274 J-.712 E.01891
G1 X120.113 Y110.677 E.00679
G1 X121.026 Y109.987 E.01997
G1 X121.488 Y109.297 E.0145
G1 X121.647 Y108.607 E.01236
G2 X121.333 Y107.918 I-.777 J-.063 E.01382
G1 X120.421 Y107.228 E.01997
G1 X119.958 Y106.538 E.0145
G3 X119.877 Y105.468 I2.274 J-.712 E.01891
G1 X120.113 Y105.159 E.00679
G1 X121.026 Y104.469 E.01997
G1 X121.131 Y104.313 E.00329
G1 X124.37 Y104.313 E.05656
G3 X124.092 Y105.159 I-.84 J.193 E.01635
G1 X123.18 Y105.849 E.01997
G1 X122.717 Y106.538 E.0145
G1 X122.558 Y107.228 E.01236
G2 X122.872 Y107.918 I.777 J.063 E.01382
G1 X123.784 Y108.607 E.01997
G1 X124.247 Y109.297 E.0145
G1 X124.406 Y109.987 E.01236
G3 X124.092 Y110.677 I-.777 J.063 E.01382
G1 X123.18 Y111.366 E.01997
G1 X122.717 Y112.056 E.0145
G1 X122.558 Y112.746 E.01236
G2 X122.872 Y113.435 I.777 J.063 E.01382
G1 X123.784 Y114.125 E.01997
G1 X124.247 Y114.815 E.0145
G1 X124.406 Y115.504 E.01236
G3 X124.092 Y116.194 I-.777 J.063 E.01382
G1 X123.18 Y116.884 E.01997
G1 X123.075 Y117.04 E.00329
G1 X125.353 Y117.04 E.03978
G3 X125.631 Y116.194 I.84 J-.193 E.01634
G1 X126.543 Y115.504 E.01997
G1 X127.006 Y114.815 E.0145
G1 X127.165 Y114.125 E.01236
G2 X126.851 Y113.435 I-.777 J-.063 E.01382
G1 X125.938 Y112.746 E.01997
G1 X125.476 Y112.056 E.0145
G1 X125.317 Y111.366 E.01236
G3 X125.631 Y110.677 I.777 J-.063 E.01382
G1 X126.543 Y109.987 E.01997
G1 X127.006 Y109.297 E.0145
G1 X127.165 Y108.607 E.01236
G2 X126.851 Y107.918 I-.777 J-.063 E.01382
G1 X125.938 Y107.228 E.01997
G1 X125.476 Y106.538 E.0145
G1 X125.317 Y105.849 E.01236
G3 X125.631 Y105.159 I.777 J-.063 E.01382
G1 X126.543 Y104.469 E.01997
G1 X126.648 Y104.313 E.00329
G1 X129.888 Y104.313 E.05656
G3 X129.61 Y105.159 I-.84 J.193 E.01635
G1 X128.697 Y105.849 E.01997
G1 X128.235 Y106.538 E.0145
G1 X128.075 Y107.228 E.01236
G2 X128.39 Y107.918 I.777 J.063 E.01382
G1 X129.302 Y108.607 E.01997
G1 X129.764 Y109.297 E.0145
G1 X129.924 Y109.987 E.01236
G3 X129.61 Y110.677 I-.777 J.063 E.01382
G1 X128.697 Y111.366 E.01997
G1 X128.235 Y112.056 E.0145
G1 X128.075 Y112.746 E.01236
G2 X128.39 Y113.435 I.777 J.063 E.01382
G1 X129.302 Y114.125 E.01997
G1 X129.764 Y114.815 E.0145
G1 X129.924 Y115.504 E.01236
G3 X129.61 Y116.194 I-.777 J.063 E.01382
G1 X128.697 Y116.884 E.01997
G1 X128.592 Y117.04 E.00329
G1 X130.87 Y117.04 E.03978
G3 X131.148 Y116.194 I.84 J-.193 E.01634
G1 X132.061 Y115.504 E.01997
G1 X132.523 Y114.815 E.0145
G2 X132.605 Y113.744 I-2.275 J-.712 E.01891
G1 X132.368 Y113.435 E.00679
G1 X131.456 Y112.746 E.01997
G1 X130.994 Y112.056 E.0145
G1 X130.834 Y111.366 E.01236
G3 X131.148 Y110.677 I.777 J-.063 E.01382
G1 X132.061 Y109.987 E.01997
G1 X132.523 Y109.297 E.0145
G2 X132.605 Y108.227 I-2.275 J-.712 E.01891
G1 X132.368 Y107.918 E.00679
G1 X131.456 Y107.228 E.01997
G1 X130.994 Y106.538 E.0145
G1 X130.834 Y105.849 E.01236
G3 X131.148 Y105.159 I.777 J-.063 E.01382
G1 X132.061 Y104.469 E.01997
G1 X132.166 Y104.313 E.00329
G3 X132.585 Y104.356 I.136 J.735 E.00746
G1 X132.605 Y105.637 E.02237
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X132.585 Y104.356 E-.4868
G1 X132.166 Y104.313 E-.16017
G1 X132.061 Y104.469 E-.07166
G1 X131.974 Y104.535 E-.04138
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 6/72
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S191.25
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I-1.16 J-.368 P1  F42000
G1 X114.372 Y160.006 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X114.354 Y160.043 E.00071
G3 X112.874 Y161.047 I-1.513 J-.637 E.03302
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.641 J.033 E.04387
G1 X112.874 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.641 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.449 Y159.74 I-1.641 J-.033 E.00529
G1 X114.388 Y159.949 E.0038
M204 S250
G1 X113.973 Y159.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X112.864 Y160.634 I-1.128 J-.475 E.02298
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X113.995 Y159.829 I-1.224 J-.019 E.00665
; WIPE_START
M204 S6000
G1 X113.866 Y160.096 E-.11266
G1 X113.715 Y160.279 E-.09018
G1 X113.532 Y160.43 E-.09016
G1 X113.322 Y160.542 E-.09013
G1 X113.095 Y160.611 E-.09018
G1 X112.864 Y160.634 E-.08818
G1 X112.342 Y160.634 E-.19851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.298 Y154.905 Z1 F42000
G1 X94.405 Y140.264 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.252 J1.958 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.527 Y140.323 I2.331 J-.234 E.01041
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.389 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12433
G1 X94.007 Y140.572 E-.07658
G1 X93.872 Y140.721 E-.0766
G1 X93.7 Y140.97 E-.11498
G1 X93.511 Y140.918 E-.07433
G1 X93.511 Y140.449 E-.17789
G1 X93.527 Y140.323 E-.04843
G1 X93.571 Y140.231 E-.03866
G1 X93.623 Y140.179 E-.02818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.256 Y140.157 Z1 F42000
G1 X114.622 Y140.118 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X114.807 Y140.45 I-.166 J.31 E.00699
G1 X114.807 Y140.918 E.00817
G1 X114.619 Y140.97 E.00342
G2 X113.916 Y140.266 I-1.959 J1.253 E.01749
G1 X113.969 Y140.078 E.00342
G1 X114.476 Y140.078 E.00886
G1 X114.493 Y140.079 E.0003
G3 X114.567 Y140.095 I-.037 J.35 E.00132
; WIPE_START
G1 X114.727 Y140.204 E-.07364
G1 X114.791 Y140.323 E-.05142
G1 X114.807 Y140.45 E-.04844
G1 X114.807 Y140.918 E-.1779
G1 X114.619 Y140.97 E-.07434
G1 X114.447 Y140.721 E-.11495
G1 X114.311 Y140.572 E-.07662
G1 X114.162 Y140.436 E-.07658
G1 X114.019 Y140.337 E-.06611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.246 Y147.966 Z1 F42000
G1 X114.619 Y160.477 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.329 J.234 E.01041
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X114.807 Y160.529 E-.08417
G1 X114.807 Y160.998 E-.17789
G1 X114.791 Y161.124 E-.04847
G1 X114.727 Y161.244 E-.05143
G1 X114.652 Y161.312 E-.03866
G1 X114.56 Y161.355 E-.03866
G1 X114.433 Y161.372 E-.04849
G1 X113.965 Y161.372 E-.1779
G1 X113.913 Y161.183 E-.07433
G1 X113.956 Y161.153 E-.02
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z1 F42000
G1 X94.406 Y161.183 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00342
G3 X93.759 Y161.355 I-.234 J-2.332 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00817
G1 X93.7 Y160.477 E.00342
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.735 J-1.179 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08367
G1 X93.885 Y161.372 E-.1779
G1 X93.759 Y161.355 E-.04842
G1 X93.667 Y161.312 E-.03874
G1 X93.571 Y161.216 E-.05135
G1 X93.527 Y161.124 E-.03873
G1 X93.511 Y160.998 E-.04847
G1 X93.511 Y160.529 E-.1779
G1 X93.7 Y160.477 E-.07434
G1 X93.728 Y160.524 E-.02048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z1 F42000
G1 X114.888 Y139.782 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X115.236 Y140.439 I-.438 J.652 E.01352
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.005 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.004 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.487 Y139.649 E.35989
G3 X114.837 Y139.75 I-.036 J.784 E.00642
M204 S250
G1 X115.117 Y139.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X115.649 Y140.429 I-.671 J.998 E.01899
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.497 Y139.236 E.33503
G3 X115.067 Y139.407 I-.05 J1.202 E.00976
; WIPE_START
M204 S6000
G1 X115.301 Y139.582 E-.11115
G1 X115.448 Y139.762 E-.08859
G1 X115.558 Y139.968 E-.08861
G1 X115.626 Y140.191 E-.08867
G1 X115.649 Y140.429 E-.09061
G1 X115.649 Y141.198 E-.29236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 6 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1 F4000
            G39.3 S1
            G0 Z1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer6 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.407928
G1 F15000
M204 S6000
M73 P46 R12
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00484
; LINE_WIDTH: 0.405777
G1 X114.817 Y160.007 E.00313
; LINE_WIDTH: 0.444731
G3 X114.767 Y160.296 I-5.904 J-.866 E.00506
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.131279
G1 F15000
M204 S6000
G3 X114.358 Y161.157 I-.308 J-.036 E.00169
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.44474
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.169 J-5.941 E.00506
; LINE_WIDTH: 0.405778
G1 X113.244 Y161.405 E.00313
; LINE_WIDTH: 0.346463
G1 X112.88 Y161.424 E.00484
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407921
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444717
G3 X94.587 Y161.332 I.877 J-5.969 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125605
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.049 J-.312 E.00169
M204 S10000
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.444728
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.848 J-1.154 E.00506
; LINE_WIDTH: 0.407911
G1 X93.479 Y159.826 E.00286
; LINE_WIDTH: 0.346463
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405761
G1 X93.501 Y141.44 E.00312
; LINE_WIDTH: 0.444704
G3 X93.551 Y141.151 I5.955 J.875 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125598
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.048 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.44463
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.159 J5.88 E.00506
; LINE_WIDTH: 0.407798
G1 X95.056 Y140.044 E.00286
; LINE_WIDTH: 0.3454
G1 X95.439 Y140.024 E.00506
G1 X112.88 Y140.025 E.23019
G1 X113.244 Y140.043 E.00482
; LINE_WIDTH: 0.403764
G1 X113.442 Y140.067 E.00311
; LINE_WIDTH: 0.443361
G3 X113.735 Y140.117 I-.893 J6.076 E.00511
M204 S10000
G1 X114.355 Y140.292 F42000
; LINE_WIDTH: 0.138844
G1 F15000
M204 S6000
G3 X114.592 Y140.524 I-.071 J.31 E.00167
M204 S10000
G1 X114.767 Y141.151 F42000
; LINE_WIDTH: 0.444741
G1 F15000
M204 S6000
G3 X114.817 Y141.44 I-5.856 J1.155 E.00506
; OBJECT_ID: 137
; WIPE_START
G1 X114.767 Y141.151 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X122.392 Y141.498 Z1 F42000
G1 X162.839 Y143.341 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X162.999 Y143.369 E.00263
G1 X163.213 Y143.406 E.00353
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03759
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X162.999 Y143.369 E-.06687
G1 X163.213 Y143.406 E-.0826
G1 X162.845 Y144.97 E-.61053
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.95 Y137.338 Z1 F42000
G1 X163.148 Y122.824 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132 E.03675
G1 X160.05 Y130.169 E.03674
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.883 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35755
G1 X162.991 Y124.812 E-.40245
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z1 F42000
G1 X158.543 Y113.936 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1 F42000
G1 X144.743 Y97.086 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.161 J-13.468 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.214 J-16.311 E.08517
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.548 J-13.585 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.266 J-16.66 E.09233
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1 F42000
G1 X159.301 Y97.086 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
M73 P47 R12
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1 F42000
G1 X161.531 Y105.786 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.982 J-13.797 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.379 J-17.098 E.0923
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.446 Y99.416 Z1 F42000
G1 X158.757 Y98.251 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.283 Y96.488 Z1 F42000
G1 X145.37 Y98.161 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X155.511 Y98.161 E.16466
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G3 X145.37 Y98.101 I-.438 J.21 E.00502
M204 S10000
G1 X155.327 Y97.513 F42000
G1 F12000
M204 S6000
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.164 Y97.762 E.15338
G1 X155.23 Y97.562 E.00342
G1 X155.273 Y97.54 E.00079
M204 S10000
G1 X154.928 Y96.601 F42000
G1 F12000
M204 S6000
G1 X154.928 Y95.839 E.01238
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X146.049 Y97.364 E.00174
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y96.661 E.00985
M204 S10000
G1 X154.53 Y96.601 F42000
G1 F12000
M204 S6000
G1 X154.53 Y96.238 E.00591
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.53 Y96.965 E.13279
G1 X154.53 Y96.661 E.00493
M204 S10000
G1 X154.166 Y96.601 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X146.776 Y96.601 E.0991
; Slow Down End
M204 S10000
G1 X144.957 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X142.124 Y98.251 E.02508
; WIPE_START
G1 X144.124 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.374 Y94.026 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X144.107 Y94.026 E.0074
; WIPE_START
G1 X142.107 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.767 Y100.071 Z1 F42000
G1 X158.425 Y115.192 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X142.124 Y115.192 E.26468
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.843 E.07035
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.159 J-13.875 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.511 I-9.138 J-17.574 E.05469
G1 X162.075 Y115.789 E.01826
G1 X162.075 Y107.042 E.14202
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.485 Y115.188 E.00614
M204 S10000
G1 X159.072 Y115.501 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27007
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00468
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11839
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.480938
G3 X141.496 Y106.843 I3.602 J-.351 E.00945
G1 X141.496 Y102.51 E.08111
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420078
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.686 J-13.588 E.06694
G1 X158.271 Y117.912 E.25436
G1 X158.95 Y117.55 E.01249
G2 X161.677 Y115.603 I-9.381 J-16.022 E.0545
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420792
G1 X159.355 Y107.701 E.00699
G1 X159.355 Y114.993 E.11863
G1 X159.337 Y115.137 E.00236
G1 X159.108 Y115.452 E.00635
M204 S10000
G1 X159.341 Y115.8 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00614
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.0078
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.256 J-13.375 E.06091
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01066
G2 X161.278 Y115.417 I-9.041 J-15.464 E.05033
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.753 Y107.439 E.00383
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.374 Y115.75 E.01014
M204 S10000
G1 X160.88 Y108.601 F42000
G1 F12000
M204 S6000
G1 X160.88 Y108.238 E.00591
G1 X160.474 Y108.238 E.00658
G1 X160.152 Y108.13 E.00552
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.00549
; LINE_WIDTH: 0.439763
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465794
G1 X159.598 Y116.155 E.00881
G1 X160.471 Y115.572 E.01902
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00864
G1 X160.88 Y108.661 E.10667
M204 S10000
G1 X160.516 Y108.601 F42000
; Slow Down Start
; LINE_WIDTH: 0.351239
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X160.516 Y115.001 E.08598
; Slow Down End
M204 S10000
G1 X159.753 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X160.152 Y101.223 F42000
G1 F12000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F12000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X161.316 Y95.801 F42000
; Slow Down Start
; LINE_WIDTH: 0.3447
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X161.311 Y98.25 E.03224
; Slow Down End
; WIPE_START
G1 X161.315 Y96.25 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.552 Y103.844 Z1 F42000
G1 X159.296 Y116.336 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.52432
G1 F12000
M204 S6000
G1 X159.546 Y116.186 E.00597
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.506932
G1 F12000
M204 S6000
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472155
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420177
G1 X158.757 Y116.388 E.00293
G1 X142.124 Y116.388 E.2702
; LINE_WIDTH: 0.443418
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474351
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.551 Y116.859 E.00883
; LINE_WIDTH: 0.437378
G1 X158.783 Y116.696 E.0048
; LINE_WIDTH: 0.472155
G1 X159.015 Y116.533 E.0052
; LINE_WIDTH: 0.506932
G1 X159.247 Y116.37 E.00561
M204 S10000
G1 X157.981 Y116.752 F42000
; Slow Down Start
; LINE_WIDTH: 0.35056
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X142.961 Y116.752 E.2014
; Slow Down End
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.492
G1 F12000
M204 S6000
G1 X141.474 Y116.272 E.00363
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.473998
G1 F12000
M204 S6000
G1 X141.101 Y115.905 E.00629
; LINE_WIDTH: 0.420362
G1 X140.888 Y115.638 E.00555
G1 X140.731 Y115.055 E.00982
G1 X140.73 Y108.13 E.11255
G1 X140.366 Y108.238 E.00617
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11382
G1 X140.701 Y115.794 E.01449
; LINE_WIDTH: 0.437993
G1 X140.982 Y115.967 E.0056
; LINE_WIDTH: 0.473998
G1 X141.262 Y116.14 E.00608
M204 S10000
G1 X140.367 Y115.071 F42000
; Slow Down Start
; LINE_WIDTH: 0.35145
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X140.366 Y108.661 E.08618
; Slow Down End
M204 S10000
G1 X140.524 Y99.139 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X140.434 Y99.135 E.00146
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.128 Y101.96 E.00447
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G1 X140.584 Y99.139 E.00727
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F12000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F12000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.573 Y98.31 F42000
; Slow Down Start
; LINE_WIDTH: 0.35196
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X139.566 Y95.861 E.03297
; Slow Down End
; OBJECT_ID: 115
; WIPE_START
G1 X139.572 Y97.861 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X134.092 Y103.174 Z1 F42000
G1 X119.564 Y117.26 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X119.47 Y116.927 I.464 J-.311 E.00613
G1 X119.47 Y104.426 E.21828
G3 X119.658 Y104 I.534 J-.019 E.00841
G3 X119.99 Y103.906 I.311 J.464 E.00613
G1 X132.492 Y103.906 E.21829
G3 X132.918 Y104.093 I.019 J.534 E.00841
G3 X133.012 Y104.426 I-.464 J.311 E.00613
G1 X133.012 Y116.927 E.21828
G3 X132.824 Y117.353 I-.534 J.019 E.00841
G3 X132.492 Y117.447 I-.311 J-.464 E.00613
G1 X119.99 Y117.447 E.21828
G3 X119.605 Y117.303 I-.019 J-.534 E.00736
M204 S10000
G1 X119.22 Y117.509 F42000
G1 F6000
M204 S6000
G3 X119.091 Y117.275 I.763 J-.575 E.00468
G1 X119.041 Y116.961 E.00555
G1 X119.041 Y104.392 E.21946
G1 X119.091 Y104.078 E.00556
G3 X119.642 Y103.527 I.893 J.342 E.01401
G1 X119.956 Y103.477 E.00555
G1 X132.569 Y103.484 E.22022
G3 X133.39 Y104.078 I.002 J.862 E.01892
G1 X133.44 Y104.392 E.00556
G1 X133.44 Y116.961 E.21946
G1 X133.39 Y117.275 E.00556
G3 X132.84 Y117.826 I-.893 J-.342 E.01401
G1 X132.525 Y117.876 E.00555
G1 X119.956 Y117.876 E.21946
G1 X119.642 Y117.826 E.00556
G3 X119.258 Y117.556 I.342 J-.893 E.00828
M204 S250
G1 X118.907 Y117.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.874 Y117.761 E.00076
G1 X118.693 Y117.405 E.00649
G1 X118.628 Y116.975 E.00705
G1 X118.628 Y104.377 E.20457
G1 X118.693 Y103.948 E.00705
G1 X118.874 Y103.592 E.00649
G1 X119.157 Y103.31 E.00649
G1 X119.512 Y103.129 E.00649
G1 X119.942 Y103.063 E.00705
G1 X132.54 Y103.063 E.20457
G3 X132.634 Y103.075 I.009 J.302 E.00154
G1 X132.969 Y103.129 E.00552
G1 X133.325 Y103.31 E.00649
G1 X133.607 Y103.592 E.00649
G1 X133.789 Y103.948 E.00649
G1 X133.854 Y104.377 E.00705
G1 X133.854 Y116.975 E.20457
G1 X133.789 Y117.405 E.00705
G1 X133.607 Y117.761 E.00649
G1 X133.325 Y118.043 E.00649
G1 X132.969 Y118.224 E.00649
G1 X132.54 Y118.289 E.00705
G1 X119.942 Y118.289 E.20457
G1 X119.512 Y118.224 E.00705
G1 X119.157 Y118.043 E.00649
G1 X118.95 Y117.836 E.00475
; WIPE_START
M204 S6000
G1 X118.874 Y117.761 E-.04062
M73 P48 R12
G1 X118.693 Y117.405 E-.15178
G1 X118.628 Y116.975 E-.165
G1 X118.628 Y115.916 E-.40261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.836 Y114.562 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X119.836 Y116.276 E.02993
G1 X120.987 Y115.504 E.02419
G2 X121.776 Y113.78 I-1.824 J-1.878 E.03388
G1 X121.558 Y113.435 E.00712
G1 X120.46 Y112.746 E.02265
G1 X119.923 Y112.056 E.01526
G1 X119.836 Y111.801 E.0047
G1 X119.836 Y110.759 E.01821
G1 X119.888 Y110.677 E.00169
G1 X120.987 Y109.987 E.02265
G2 X121.776 Y108.263 I-1.824 J-1.878 E.03388
G1 X121.558 Y107.918 E.00712
G1 X120.46 Y107.228 E.02265
G1 X119.923 Y106.538 E.01526
G1 X119.836 Y106.284 E.0047
G1 X119.836 Y105.241 E.01821
G1 X120.987 Y104.469 E.02419
G1 X121.14 Y104.272 E.00436
G1 X122.854 Y104.272 E.02993
M204 S10000
G1 X123.328 Y106.828 F42000
G1 F16200
M204 S6000
G1 X123.328 Y107.764 E.01634
G1 X122.55 Y107.764 E.01359
G1 X122.429 Y107.573 E.00395
G3 X123.219 Y105.849 I2.614 J.153 E.03388
G1 X124.317 Y105.159 E.02265
G2 X124.45 Y104.272 I-.602 J-.543 E.01659
G1 X126.658 Y104.272 E.03855
G1 X126.504 Y104.469 E.00436
G1 X125.406 Y105.159 E.02265
G2 X125.364 Y106.314 I.755 J.605 E.02163
G1 X128.374 Y106.314 E.05255
G1 X128.736 Y105.849 E.0103
G1 X129.835 Y105.159 E.02265
G2 X129.968 Y104.272 I-.602 J-.543 E.01659
G1 X132.175 Y104.272 E.03855
G1 X132.022 Y104.469 E.00436
G1 X130.923 Y105.159 E.02265
G1 X130.706 Y105.504 E.00712
G2 X131.495 Y107.228 I2.613 J-.153 E.03388
G1 X132.594 Y107.918 E.02265
G1 X132.645 Y108.019 E.00199
G1 X132.645 Y109.013 E.01735
G1 X132.559 Y109.297 E.00519
G1 X132.022 Y109.987 E.01526
G1 X130.923 Y110.677 E.02265
G1 X130.706 Y111.021 E.00712
G2 X131.495 Y112.746 I2.613 J-.153 E.03388
G1 X132.594 Y113.435 E.02265
G1 X132.645 Y113.537 E.00199
G1 X132.645 Y114.53 E.01735
G1 X132.559 Y114.815 E.00519
G1 X132.022 Y115.504 E.01526
G1 X130.923 Y116.194 E.02265
G2 X130.791 Y117.081 I.602 J.543 E.01659
G1 X128.583 Y117.081 E.03855
G1 X128.736 Y116.884 E.00436
G1 X129.835 Y116.194 E.02265
G1 X130.052 Y115.849 E.00712
G2 X129.263 Y114.125 I-2.613 J.153 E.03388
G1 X129.153 Y114.056 E.00226
G1 X129.153 Y114.785 E.01272
G1 X128.899 Y115.039 E.00628
G1 X126.866 Y115.039 E.03549
G1 X126.504 Y115.504 E.0103
G1 X125.406 Y116.194 E.02265
G2 X125.273 Y117.081 I.602 J.543 E.01659
G1 X123.065 Y117.081 E.03855
G1 X123.219 Y116.884 E.00436
G1 X124.317 Y116.194 E.02265
G2 X124.358 Y115.039 I-.755 J-.605 E.02163
G1 X123.583 Y115.039 E.01355
G1 X123.328 Y114.785 E.00628
G1 X123.328 Y113.863 E.01609
G1 X122.891 Y113.589 E.00901
G1 X122.133 Y113.589 E.01325
G1 X121.937 Y113.394 E.00482
M204 S10000
G1 X124.043 Y112.259 F42000
G1 F16200
M204 S6000
G1 X123.208 Y112.259 E.01458
G1 X123.208 Y111.38 E.01535
G1 X123.798 Y111.003 E.01223
G1 X123.798 Y109.938 E.01859
G3 X124.414 Y109.683 I.435 J.181 E.01292
G2 X124.124 Y109.093 I-.998 J.124 E.01169
G1 X124.403 Y109.093 E.00488
G1 X124.658 Y108.839 E.00628
G1 X124.658 Y107.643 E.02088
G1 X126.639 Y107.643 E.0346
G3 X127.276 Y108.607 I-.222 J.839 E.02207
G1 X127.234 Y108.731 E.00228
G1 X127.234 Y108.488 E.00424
G1 X126.979 Y108.233 E.00628
G1 X125.868 Y108.233 E.0194
M204 S10000
G1 X129.274 Y109.17 F42000
G1 F16200
M204 S6000
G1 X129.274 Y110.884 E.02993
G2 X128.13 Y112.259 I2.498 J3.24 E.03149
G1 X127.824 Y112.514 E.00695
G1 X127.824 Y113.709 E.02088
G1 X127.249 Y113.709 E.01004
G1 X127.076 Y113.435 E.00566
G1 X126.573 Y113.119 E.01037
G1 X125.502 Y113.119 E.0187
G1 X125.248 Y112.865 E.00628
G1 X125.248 Y112.581 E.00495
M204 S10000
G1 X125.661 Y112.126 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X125.661 Y112.694 E.00921
G2 X126.808 Y112.706 I.863 J-27.349 E.01863
G2 X126.82 Y111.553 I-27.49 J-.866 E.01872
G1 X126.879 Y111.412 E.00248
G1 X127.028 Y111.277 E.00327
G3 X128.258 Y111.256 I.946 J19.359 E.01998
G2 X128.27 Y110.118 I-27.145 J-.859 E.01849
G2 X127.117 Y110.097 I-.866 J16.105 E.01873
G1 X126.977 Y110.039 E.00248
G1 X126.841 Y109.889 E.00327
G3 X126.82 Y108.659 I19.359 J-.946 E.01998
G2 X125.673 Y108.647 I-.863 J27.349 E.01863
G2 X125.661 Y109.8 I27.49 J.866 E.01872
G1 X125.603 Y109.941 E.00248
G1 X125.453 Y110.076 E.00327
G3 X124.223 Y110.097 I-.946 J-19.349 E.01998
G2 X124.211 Y111.244 I27.349 J.863 E.01863
G2 X125.364 Y111.256 I.866 J-27.49 E.01872
G1 X125.505 Y111.314 E.00248
G1 X125.64 Y111.464 E.00327
G1 X125.659 Y112.066 E.00979
M204 S10000
G1 X125.364 Y110.867 F42000
; LINE_WIDTH: 0.406324
G1 F12000
M204 S6000
G1 X125.631 Y110.921 E.00428
G1 X125.885 Y111.13 E.00516
G1 X125.996 Y111.286 E.003
G1 X126.051 Y111.553 E.00428
G1 X126.051 Y112.317 E.01197
G1 X126.431 Y112.317 E.00596
G1 X126.431 Y111.553 E.01197
G1 X126.485 Y111.286 E.00428
G1 X126.695 Y111.033 E.00516
G1 X126.851 Y110.922 E.003
G1 X127.117 Y110.867 E.00427
G1 X127.881 Y110.867 E.01197
G1 X127.881 Y110.486 E.00596
G1 X127.117 Y110.486 E.01197
G1 X126.851 Y110.431 E.00427
G1 X126.597 Y110.222 E.00515
G1 X126.486 Y110.066 E.003
G1 X126.431 Y109.8 E.00427
G1 X126.431 Y109.036 E.01197
G1 X126.051 Y109.036 E.00596
G1 X126.051 Y109.8 E.01197
G1 X125.995 Y110.066 E.00427
G1 X125.787 Y110.32 E.00515
G1 X125.631 Y110.432 E.003
G1 X125.364 Y110.486 E.00428
G1 X124.601 Y110.486 E.01197
G1 X124.601 Y110.867 E.00596
G1 X125.304 Y110.867 E.01103
M204 S10000
G1 X126.241 Y110.38 F42000
; LINE_WIDTH: 0.39501
G1 F12000
M204 S6000
G3 X125.944 Y110.676 I-.747 J-.451 E.00644
G3 X126.241 Y110.973 I-.451 J.747 E.00644
G3 X126.537 Y110.676 I.747 J.451 E.00644
G1 X126.324 Y110.495 E.00426
G1 X126.276 Y110.429 E.00125
M204 S10000
G1 X128.712 Y113.904 F42000
; LINE_WIDTH: 0.473725
G1 F12000
M204 S6000
G1 X128.714 Y113.473 E.00795
; LINE_WIDTH: 0.48968
G1 X128.74 Y113.391 E.00164
; LINE_WIDTH: 0.525
G1 X128.765 Y113.309 E.00176
; LINE_WIDTH: 0.56032
M73 P48 R11
G1 X128.791 Y113.227 E.00189
G1 X128.873 Y113.201 E.00189
; LINE_WIDTH: 0.525
G1 X128.955 Y113.175 E.00176
; LINE_WIDTH: 0.508454
G1 X129.037 Y113.149 E.0017
G1 X129.763 Y113.111 E.01443
; LINE_WIDTH: 0.56366
G1 X130.111 Y113.096 E.00768
; LINE_WIDTH: 0.560905
G1 X130.128 Y112.882 E.00472
; LINE_WIDTH: 0.526715
G1 X130.145 Y112.668 E.00442
; LINE_WIDTH: 0.473249
G2 X130.164 Y112.376 I-2.508 J-.308 E.0054
G1 X130.164 Y108.977 E.06256
; LINE_WIDTH: 0.489683
G1 X130.146 Y108.737 E.0046
; LINE_WIDTH: 0.52501
G1 X130.128 Y108.497 E.00494
; LINE_WIDTH: 0.560337
G1 X130.111 Y108.256 E.00529
; LINE_WIDTH: 0.560338
G1 X129.871 Y108.239 E.00529
; LINE_WIDTH: 0.525015
G1 X129.63 Y108.221 E.00494
; LINE_WIDTH: 0.479189
G2 X129.037 Y108.203 I-.417 J4.025 E.01108
; LINE_WIDTH: 0.48968
G1 X128.955 Y108.178 E.00164
; LINE_WIDTH: 0.525
G1 X128.873 Y108.152 E.00176
; LINE_WIDTH: 0.56032
G1 X128.791 Y108.126 E.00189
G1 X128.765 Y108.044 E.00189
; LINE_WIDTH: 0.525
G1 X128.74 Y107.962 E.00176
; LINE_WIDTH: 0.508458
G1 X128.714 Y107.88 E.0017
G1 X128.675 Y107.154 E.01443
; LINE_WIDTH: 0.563665
G1 X128.661 Y106.806 E.00768
; LINE_WIDTH: 0.560338
G1 X128.421 Y106.789 E.00529
; LINE_WIDTH: 0.525015
G1 X128.18 Y106.771 E.00494
; LINE_WIDTH: 0.473199
G1 X127.94 Y106.753 E.00443
G1 X124.541 Y106.753 E.06255
; LINE_WIDTH: 0.48969
G1 X124.301 Y106.771 E.0046
; LINE_WIDTH: 0.52501
G1 X124.061 Y106.789 E.00494
; LINE_WIDTH: 0.56033
G1 X123.821 Y106.806 E.00529
G1 X123.803 Y107.047 E.00529
; LINE_WIDTH: 0.52501
G1 X123.785 Y107.287 E.00494
; LINE_WIDTH: 0.479801
G2 X123.766 Y107.92 I4.561 J.456 E.01183
; LINE_WIDTH: 0.492525
G1 X123.741 Y107.988 E.00141
; LINE_WIDTH: 0.526715
G1 X123.716 Y108.057 E.00151
; LINE_WIDTH: 0.560905
G1 X123.69 Y108.126 E.00161
; LINE_WIDTH: 0.560337
G1 X123.608 Y108.152 E.00189
; LINE_WIDTH: 0.52501
G1 X123.527 Y108.178 E.00176
; LINE_WIDTH: 0.508454
G1 X123.445 Y108.203 E.0017
G1 X122.718 Y108.242 E.01443
; LINE_WIDTH: 0.563655
G1 X122.371 Y108.256 E.00768
; LINE_WIDTH: 0.56033
G1 X122.353 Y108.497 E.00529
; LINE_WIDTH: 0.52501
G1 X122.335 Y108.737 E.00494
; LINE_WIDTH: 0.473199
G1 X122.318 Y108.977 E.00443
G1 X122.318 Y112.376 E.06255
; LINE_WIDTH: 0.48969
G1 X122.335 Y112.616 E.0046
; LINE_WIDTH: 0.52501
G1 X122.353 Y112.856 E.00494
; LINE_WIDTH: 0.56033
G1 X122.371 Y113.096 E.00529
G1 X122.611 Y113.114 E.00529
; LINE_WIDTH: 0.52501
G1 X122.851 Y113.132 E.00494
; LINE_WIDTH: 0.479189
G2 X123.445 Y113.149 I.417 J-4.025 E.01108
; LINE_WIDTH: 0.489683
G1 X123.527 Y113.175 E.00164
; LINE_WIDTH: 0.52501
G1 X123.608 Y113.201 E.00176
; LINE_WIDTH: 0.560337
G1 X123.69 Y113.227 E.00189
; LINE_WIDTH: 0.560338
G1 X123.716 Y113.309 E.00189
; LINE_WIDTH: 0.525015
G1 X123.742 Y113.391 E.00176
; LINE_WIDTH: 0.50846
G1 X123.768 Y113.473 E.0017
G1 X123.806 Y114.199 E.01443
; LINE_WIDTH: 0.563655
G1 X123.821 Y114.546 E.00768
; LINE_WIDTH: 0.56033
G1 X124.061 Y114.564 E.00529
; LINE_WIDTH: 0.52501
G1 X124.301 Y114.582 E.00494
; LINE_WIDTH: 0.473199
G1 X124.541 Y114.599 E.00443
G1 X127.94 Y114.599 E.06255
; LINE_WIDTH: 0.489692
G1 X128.18 Y114.582 E.0046
; LINE_WIDTH: 0.525015
G1 X128.421 Y114.564 E.00494
; LINE_WIDTH: 0.560338
G1 X128.661 Y114.546 E.00529
; LINE_WIDTH: 0.560905
G1 X128.676 Y114.352 E.00428
; LINE_WIDTH: 0.526715
G1 X128.692 Y114.158 E.00401
; LINE_WIDTH: 0.492525
G1 X128.707 Y113.964 E.00374
M204 S10000
G1 X129.037 Y108.654 F42000
; LINE_WIDTH: 0.472025
G1 F12000
M204 S6000
G1 X129.39 Y108.654 E.00648
; LINE_WIDTH: 0.489692
G1 X129.472 Y108.68 E.00164
; LINE_WIDTH: 0.525015
G1 X129.554 Y108.706 E.00176
; LINE_WIDTH: 0.560338
G1 X129.636 Y108.731 E.00189
; LINE_WIDTH: 0.560337
G1 X129.662 Y108.813 E.00189
; LINE_WIDTH: 0.52501
G1 X129.687 Y108.895 E.00176
; LINE_WIDTH: 0.472455
G1 X129.713 Y108.977 E.00158
G1 X129.713 Y112.376 E.06245
; LINE_WIDTH: 0.489683
G1 X129.687 Y112.458 E.00164
; LINE_WIDTH: 0.52501
G1 X129.662 Y112.54 E.00176
; LINE_WIDTH: 0.560337
G1 X129.636 Y112.621 E.00189
; LINE_WIDTH: 0.560338
G1 X129.554 Y112.647 E.00189
; LINE_WIDTH: 0.525015
G1 X129.472 Y112.673 E.00176
; LINE_WIDTH: 0.50846
G1 X129.39 Y112.699 E.0017
G1 X128.664 Y112.738 E.01443
; LINE_WIDTH: 0.56365
G1 X128.316 Y112.752 E.00768
; LINE_WIDTH: 0.56032
G1 X128.299 Y112.992 E.00529
; LINE_WIDTH: 0.525
G1 X128.281 Y113.232 E.00494
; LINE_WIDTH: 0.479795
G2 X128.261 Y113.865 I4.566 J.456 E.01183
; LINE_WIDTH: 0.492525
G1 X128.236 Y113.934 E.00141
; LINE_WIDTH: 0.526715
G1 X128.211 Y114.003 E.00151
; LINE_WIDTH: 0.560905
G1 X128.186 Y114.071 E.00161
; LINE_WIDTH: 0.560338
G1 X128.104 Y114.097 E.00189
; LINE_WIDTH: 0.525015
G1 X128.022 Y114.123 E.00176
; LINE_WIDTH: 0.472465
G1 X127.94 Y114.149 E.00158
G1 X124.541 Y114.149 E.06245
; LINE_WIDTH: 0.48969
G1 X124.46 Y114.123 E.00164
; LINE_WIDTH: 0.52501
G1 X124.378 Y114.097 E.00176
; LINE_WIDTH: 0.56033
G1 X124.296 Y114.071 E.00189
G1 X124.27 Y113.99 E.00189
; LINE_WIDTH: 0.52501
G1 X124.244 Y113.908 E.00176
; LINE_WIDTH: 0.508464
G1 X124.218 Y113.826 E.0017
G1 X124.18 Y113.099 E.01443
; LINE_WIDTH: 0.563665
G1 X124.165 Y112.752 E.00768
; LINE_WIDTH: 0.560337
G1 X123.925 Y112.734 E.00529
; LINE_WIDTH: 0.52501
G1 X123.685 Y112.717 E.00494
; LINE_WIDTH: 0.479186
G2 X123.091 Y112.699 I-.417 J4.029 E.01108
; LINE_WIDTH: 0.48969
G1 X123.01 Y112.673 E.00164
; LINE_WIDTH: 0.52501
G1 X122.928 Y112.647 E.00176
; LINE_WIDTH: 0.56033
G1 X122.846 Y112.621 E.00189
G1 X122.82 Y112.54 E.00189
; LINE_WIDTH: 0.52501
G1 X122.794 Y112.458 E.00176
; LINE_WIDTH: 0.472465
G1 X122.768 Y112.376 E.00158
G1 X122.768 Y108.977 E.06245
; LINE_WIDTH: 0.48969
G1 X122.794 Y108.895 E.00164
; LINE_WIDTH: 0.52501
G1 X122.82 Y108.813 E.00176
; LINE_WIDTH: 0.56033
G1 X122.846 Y108.731 E.00189
G1 X122.928 Y108.706 E.00189
; LINE_WIDTH: 0.52501
G1 X123.01 Y108.68 E.00176
; LINE_WIDTH: 0.508459
G1 X123.091 Y108.654 E.0017
G1 X123.818 Y108.615 E.01443
; LINE_WIDTH: 0.575096
G3 X124.165 Y108.601 I.208 J.832 E.0079
; LINE_WIDTH: 0.560905
G1 X124.182 Y108.387 E.00472
; LINE_WIDTH: 0.526715
G1 X124.2 Y108.173 E.00442
; LINE_WIDTH: 0.479976
G2 X124.218 Y107.527 I-4.246 J-.447 E.01208
; LINE_WIDTH: 0.48969
G1 X124.244 Y107.445 E.00164
; LINE_WIDTH: 0.52501
G1 X124.27 Y107.363 E.00176
; LINE_WIDTH: 0.56033
G1 X124.296 Y107.281 E.00189
G1 X124.378 Y107.256 E.00189
; LINE_WIDTH: 0.52501
G1 X124.46 Y107.23 E.00176
; LINE_WIDTH: 0.472465
G1 X124.541 Y107.204 E.00158
G1 X127.94 Y107.204 E.06245
; LINE_WIDTH: 0.489692
G1 X128.022 Y107.23 E.00164
; LINE_WIDTH: 0.525015
G1 X128.104 Y107.256 E.00176
; LINE_WIDTH: 0.560338
G1 X128.186 Y107.281 E.00189
; LINE_WIDTH: 0.560337
G1 X128.212 Y107.363 E.00189
; LINE_WIDTH: 0.52501
G1 X128.237 Y107.445 E.00176
; LINE_WIDTH: 0.508454
G1 X128.263 Y107.527 E.0017
G1 X128.302 Y108.254 E.01443
; LINE_WIDTH: 0.56365
G1 X128.316 Y108.601 E.00768
; LINE_WIDTH: 0.56032
G1 X128.536 Y108.617 E.00485
; LINE_WIDTH: 0.525
G1 X128.757 Y108.633 E.00453
; LINE_WIDTH: 0.48968
G1 X128.977 Y108.65 E.00421
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F12000
G1 X128.757 Y108.633 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 7/72
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-1.172 J-.328 P1  F42000
G1 X114.372 Y160.006 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X114.354 Y160.043 E.00072
G3 X112.874 Y161.047 I-1.513 J-.637 E.03302
G1 X95.444 Y161.047 E.30434
G3 X93.836 Y159.439 I.033 J-1.641 E.04387
G1 X93.836 Y142.008 E.30434
G3 X95.444 Y140.4 I1.641 J.033 E.04387
G1 X112.875 Y140.4 E.30434
G3 X114.483 Y142.008 I-.033 J1.641 E.04387
G1 X114.483 Y159.439 E.30434
G3 X114.449 Y159.74 I-1.641 J-.033 E.00529
G1 X114.389 Y159.948 E.00378
M204 S250
G1 X113.978 Y159.886 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X113.973 Y159.885 E.00007
G3 X112.864 Y160.634 I-1.128 J-.475 E.02298
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X114.044 Y159.659 I-1.224 J-.019 E.00377
G1 X113.994 Y159.828 E.00286
; WIPE_START
M204 S6000
G1 X113.973 Y159.885 E-.023
G1 X113.866 Y160.096 E-.09001
G1 X113.715 Y160.279 E-.09016
G1 X113.532 Y160.43 E-.09016
G1 X113.322 Y160.542 E-.09018
G1 X113.095 Y160.611 E-.09015
G1 X112.864 Y160.634 E-.08816
G1 X112.343 Y160.634 E-.19819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.299 Y154.905 Z1.1 F42000
G1 X94.406 Y140.264 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X93.7 Y140.97 I1.253 J1.958 E.01756
G1 X93.511 Y140.918 E.00342
G3 X93.528 Y140.323 I2.329 J-.234 E.01042
G3 X93.885 Y140.076 I.337 J.105 E.00818
G1 X94.353 Y140.076 E.00817
G1 X94.389 Y140.206 E.00237
; WIPE_START
G1 X94.157 Y140.436 E-.12434
G1 X94.007 Y140.572 E-.07659
G1 X93.872 Y140.721 E-.07661
G1 X93.7 Y140.97 E-.11499
G1 X93.511 Y140.918 E-.07433
G1 X93.511 Y140.45 E-.1779
G1 X93.528 Y140.323 E-.0485
G1 X93.591 Y140.204 E-.05134
G1 X93.621 Y140.177 E-.01539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.254 Y140.164 Z1.1 F42000
G1 X114.648 Y140.141 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.703 Y140.18 E.00118
G3 X114.807 Y140.449 I-.249 J.251 E.0052
G1 X114.807 Y140.918 E.00817
G1 X114.619 Y140.97 E.00341
G2 X113.915 Y140.265 I-1.958 J1.253 E.01752
G1 X113.967 Y140.077 E.00342
G1 X114.459 Y140.077 E.00858
G3 X114.591 Y140.105 I-.005 J.354 E.00238
G1 X114.597 Y140.108 E.00012
; WIPE_START
G1 X114.703 Y140.18 E-.04848
G1 X114.78 Y140.291 E-.05136
G1 X114.807 Y140.449 E-.0611
G1 X114.807 Y140.918 E-.1779
G1 X114.619 Y140.97 E-.07432
G1 X114.447 Y140.721 E-.11497
G1 X114.311 Y140.572 E-.07663
G1 X114.162 Y140.436 E-.07657
G1 X113.992 Y140.318 E-.07868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.229 Y147.947 Z1.1 F42000
G1 X114.619 Y160.477 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X114.807 Y160.529 E.00342
G3 X114.791 Y161.124 I-2.332 J.234 E.01041
G3 X114.433 Y161.372 I-.337 J-.105 E.00818
G1 X113.965 Y161.372 E.00817
G1 X113.913 Y161.183 E.00342
G2 X114.586 Y160.527 I-1.252 J-1.958 E.01652
; WIPE_START
G1 X114.807 Y160.529 E-.08418
G1 X114.807 Y160.998 E-.1779
G1 X114.791 Y161.124 E-.04845
G1 X114.748 Y161.216 E-.03867
G1 X114.652 Y161.312 E-.05152
G1 X114.56 Y161.355 E-.03861
G1 X114.433 Y161.372 E-.04846
G1 X113.965 Y161.372 E-.17792
G1 X113.913 Y161.183 E-.07433
G1 X113.956 Y161.153 E-.01997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y161.165 Z1.1 F42000
G1 X94.406 Y161.183 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X94.353 Y161.372 E.00342
G3 X93.759 Y161.355 I-.234 J-2.334 E.01041
G3 X93.511 Y160.998 I.105 J-.337 E.00818
G1 X93.511 Y160.529 E.00817
G1 X93.7 Y160.477 E.00341
G1 X93.752 Y160.564 E.00177
G2 X94.355 Y161.151 I1.735 J-1.178 E.01479
; WIPE_START
G1 X94.353 Y161.372 E-.08368
G1 X93.885 Y161.372 E-.17792
G1 X93.759 Y161.355 E-.04839
G1 X93.667 Y161.312 E-.03872
G1 X93.571 Y161.216 E-.05148
G1 X93.527 Y161.124 E-.0387
G1 X93.511 Y160.998 E-.0484
G1 X93.511 Y160.529 E-.1779
G1 X93.7 Y160.477 E-.07432
G1 X93.728 Y160.524 E-.02049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.178 Y155.181 Z1.1 F42000
G1 X114.888 Y139.782 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X115.236 Y140.439 I-.438 J.652 E.01353
G1 X115.236 Y161.008 E.35914
G3 X114.444 Y161.8 I-.787 J.005 E.02175
G1 X93.875 Y161.8 E.35914
G3 X93.083 Y161.008 I-.004 J-.787 E.02175
G1 X93.083 Y140.439 E.35914
G3 X93.875 Y139.647 I.787 J-.004 E.02175
G1 X114.469 Y139.648 E.35959
G3 X114.837 Y139.75 I-.019 J.785 E.00673
M204 S250
G1 X115.117 Y139.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X115.649 Y140.429 I-.671 J.999 E.01899
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.48 Y139.235 E.33475
G3 X115.067 Y139.407 I-.034 J1.203 E.01004
; WIPE_START
M204 S6000
G1 X115.301 Y139.582 E-.1112
G1 X115.448 Y139.762 E-.08859
G1 X115.558 Y139.968 E-.08867
G1 X115.626 Y140.191 E-.08863
G1 X115.649 Y140.429 E-.0906
G1 X115.649 Y141.198 E-.29232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 7 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.1 F4000
            G39.3 S1
            G0 Z1.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer7 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X114.817 Y141.44 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.444746
G1 F15000
M204 S6000
G2 X114.767 Y141.151 I-5.955 J.874 E.00506
M204 S10000
G1 X114.817 Y141.44 F42000
; LINE_WIDTH: 0.407943
G1 F15000
M204 S6000
G1 X114.839 Y141.621 E.00286
; LINE_WIDTH: 0.346463
G1 X114.859 Y142.003 E.00507
G1 X114.859 Y159.444 E.23095
G1 X114.841 Y159.809 E.00484
; LINE_WIDTH: 0.405776
G1 X114.817 Y160.007 E.00313
; LINE_WIDTH: 0.444732
G3 X114.767 Y160.296 I-5.87 J-.86 E.00506
M204 S10000
G1 X114.593 Y160.891 F42000
; LINE_WIDTH: 0.130902
G1 F15000
M204 S6000
G3 X114.352 Y161.157 I-.319 J-.047 E.0017
M204 S10000
G1 X113.732 Y161.332 F42000
; LINE_WIDTH: 0.44473
G1 F15000
M204 S6000
G3 X113.443 Y161.381 I-1.162 J-5.897 E.00506
; LINE_WIDTH: 0.405777
G1 X113.244 Y161.405 E.00313
; LINE_WIDTH: 0.346463
G1 X112.88 Y161.424 E.00483
G1 X95.439 Y161.424 E.23095
G1 X95.056 Y161.404 E.00507
; LINE_WIDTH: 0.407902
G1 X94.876 Y161.381 E.00286
; LINE_WIDTH: 0.444703
G3 X94.587 Y161.332 I.864 J-5.901 E.00506
M204 S10000
G1 X93.989 Y161.157 F42000
; LINE_WIDTH: 0.125582
G1 F15000
M204 S6000
G3 X93.726 Y160.894 I.049 J-.312 E.00169
M204 S10000
G1 X93.551 Y160.296 F42000
; LINE_WIDTH: 0.444734
G1 F15000
M204 S6000
G3 X93.501 Y160.007 I5.858 J-1.155 E.00506
; LINE_WIDTH: 0.407957
G1 X93.479 Y159.827 E.00286
; LINE_WIDTH: 0.346464
G1 X93.459 Y159.444 E.00507
G1 X93.459 Y142.003 E.23095
G1 X93.477 Y141.638 E.00484
; LINE_WIDTH: 0.405786
G1 X93.501 Y141.44 E.00312
; LINE_WIDTH: 0.444719
G3 X93.551 Y141.151 I5.797 J.848 E.00506
M204 S10000
G1 X93.726 Y140.553 F42000
; LINE_WIDTH: 0.125573
G1 F15000
M204 S6000
G3 X93.989 Y140.29 I.312 J.049 E.00169
M204 S10000
G1 X94.587 Y140.115 F42000
; LINE_WIDTH: 0.444686
G1 F15000
M204 S6000
G3 X94.876 Y140.066 I1.167 J5.931 E.00506
; LINE_WIDTH: 0.407874
G1 X95.056 Y140.043 E.00286
; LINE_WIDTH: 0.345827
G1 X95.439 Y140.024 E.00506
G1 X112.88 Y140.024 E.2305
M73 P49 R11
G1 X113.244 Y140.042 E.00482
; LINE_WIDTH: 0.404576
G1 X113.443 Y140.066 E.00312
; LINE_WIDTH: 0.443899
G3 X113.734 Y140.116 I-.862 J5.887 E.00509
M204 S10000
G1 X114.361 Y140.291 F42000
; LINE_WIDTH: 0.139408
G1 F15000
M204 S6000
G3 X114.592 Y140.524 I-.083 J.314 E.00166
; OBJECT_ID: 137
; WIPE_START
G1 X114.505 Y140.373 E-.38917
G1 X114.361 Y140.291 E-.37083
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X121.978 Y140.771 Z1.1 F42000
G1 X162.839 Y143.341 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X162.92 Y143.355 E.00133
G1 X163.213 Y143.406 E.00483
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X162.92 Y143.355 E-.03966
G1 X163.213 Y143.406 E-.113
G1 X162.847 Y144.962 E-.60734
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.951 Y137.33 Z1.1 F42000
G1 X163.148 Y122.824 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03758
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X133.526 Y139.643 E.0131
G1 X132.106 Y139.138 E.02448
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z1.1 F42000
G1 X158.543 Y113.936 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.1 F42000
G1 X144.743 Y97.086 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.179 J-13.495 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.045 J-16.065 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.563 J-13.609 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.1 F42000
G1 X159.301 Y97.086 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.1 F42000
G1 X161.531 Y105.786 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.996 J-13.818 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.446 Y99.416 Z1.1 F42000
G1 X158.757 Y98.251 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
M73 P50 R11
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00614
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.0078
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.257 J-13.376 E.06091
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01065
G2 X161.278 Y115.417 I-9.035 J-15.456 E.05034
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.0055
; LINE_WIDTH: 0.439773
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465817
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.01901
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51171
G1 F14686.385
M204 S6000
G1 X159.546 Y116.186 E.00582
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474339
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.551 Y116.859 E.00882
; LINE_WIDTH: 0.437375
G1 X158.799 Y116.685 E.00514
; LINE_WIDTH: 0.472145
G1 X159.048 Y116.51 E.00557
; LINE_WIDTH: 0.506915
G1 F14831.447
G1 X159.296 Y116.336 E.006
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472145
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420177
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X141.474 Y116.272 E.00371
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.701 Y115.794 E.01448
; LINE_WIDTH: 0.437993
G1 X141.007 Y115.983 E.00611
; LINE_WIDTH: 0.462209
G1 X141.314 Y116.172 E.00646
G1 X140.888 Y115.638 E.01226
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00981
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.159 J-13.875 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.143 J-17.58 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.425 Y115.192 E.00712
G1 X142.124 Y115.192 E.26468
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.685 J-13.586 E.06694
G1 X158.271 Y117.912 E.25436
G1 X158.949 Y117.55 E.01248
G2 X161.677 Y115.603 I-9.378 J-16.017 E.0545
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00469
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.1 F42000
G1 X144.107 Y94.026 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.902 Y99.347 Z1.1 F42000
G1 X119.5 Y117.242 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.464 Y117.171 E.00139
G3 X119.429 Y116.952 I.54 J-.198 E.00389
G1 X119.429 Y104.401 E.21913
G3 X119.624 Y103.962 I.552 J-.018 E.00867
G3 X119.966 Y103.865 I.32 J.477 E.00631
G1 X132.543 Y103.869 E.2196
G3 X133.018 Y104.182 I.022 J.483 E.01061
G1 X133.052 Y104.401 E.00387
G1 X133.052 Y116.952 E.21913
G3 X132.858 Y117.391 I-.552 J.018 E.00867
G3 X132.516 Y117.488 I-.32 J-.477 E.00631
G1 X119.966 Y117.488 E.21913
G3 X119.528 Y117.295 I-.018 J-.552 E.00864
M204 S10000
G1 X119.118 Y117.436 F42000
G1 F6000
M204 S6000
G1 X119.051 Y117.305 E.00257
G1 X119.001 Y116.985 E.00564
G1 X119.001 Y104.367 E.22031
G1 X119.051 Y104.048 E.00564
G3 X119.613 Y103.487 I.909 J.348 E.01427
G1 X119.932 Y103.436 E.00564
G1 X132.61 Y103.446 E.22136
G3 X133.43 Y104.048 I-.008 J.871 E.01898
G1 X133.481 Y104.368 E.00564
G1 X133.481 Y116.985 E.22031
G1 X133.43 Y117.305 E.00564
G3 X132.869 Y117.866 I-.909 J-.348 E.01427
G1 X132.55 Y117.916 E.00564
G1 X119.932 Y117.916 E.22031
G1 X119.613 Y117.866 E.00564
G3 X119.183 Y117.543 I.348 J-.909 E.00951
G1 X119.149 Y117.487 E.00113
M204 S250
G1 X118.75 Y117.624 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.653 Y117.434 E.00346
G1 X118.587 Y117 E.00713
G1 X118.587 Y104.353 E.20535
G1 X118.653 Y103.919 E.00713
G1 X118.837 Y103.558 E.00657
G1 X119.123 Y103.272 E.00657
G1 X119.483 Y103.089 E.00657
G1 X119.917 Y103.023 E.00713
G1 X132.564 Y103.023 E.20536
G3 X132.675 Y103.038 I.009 J.356 E.00182
G1 X132.998 Y103.089 E.00532
G1 X133.359 Y103.272 E.00657
G1 X133.645 Y103.558 E.00657
G1 X133.828 Y103.919 E.00657
G1 X133.894 Y104.353 E.00713
G1 X133.894 Y117 E.20535
G1 X133.828 Y117.434 E.00713
G1 X133.645 Y117.794 E.00657
G1 X133.359 Y118.08 E.00657
G1 X132.998 Y118.264 E.00657
G1 X132.564 Y118.33 E.00713
G1 X119.917 Y118.33 E.20535
G1 X119.483 Y118.264 E.00713
G1 X119.123 Y118.08 E.00657
G1 X118.837 Y117.794 E.00657
G1 X118.777 Y117.677 E.00214
; WIPE_START
M204 S6000
G1 X118.653 Y117.434 E-.10372
G1 X118.587 Y117 E-.16693
G1 X118.587 Y115.712 E-.48935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.494 Y113.355 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4345
G1 F15000
M204 S6000
G1 X122.292 Y113.153 E.0048
G1 X122.292 Y112.569 E.00983
G1 X123.078 Y113.355 E.0187
M204 S10000
G1 X123.944 Y114.805 F42000
G1 F15000
M204 S6000
G1 X123.742 Y114.603 E.0048
G1 X123.742 Y114.019 E.00983
G1 X124.348 Y114.625 E.01444
G1 X124.933 Y114.625 E.00983
G1 X122.292 Y111.985 E.06285
G1 X122.292 Y111.401 E.00983
G1 X125.517 Y114.625 E.07675
G1 X126.101 Y114.625 E.00983
G1 X122.292 Y110.816 E.09065
G1 X122.292 Y110.232 E.00983
G1 X126.685 Y114.625 E.10455
G1 X127.269 Y114.625 E.00983
G1 X122.292 Y109.648 E.11846
G1 X122.292 Y109.064 E.00983
G1 X127.853 Y114.625 E.13236
G1 X128.437 Y114.625 E.00983
G1 X122.292 Y108.48 E.14626
G1 X122.304 Y108.178 E.00509
G1 X122.574 Y108.178 E.00454
G1 X128.74 Y114.344 E.14675
G1 X128.74 Y113.759 E.00983
G1 X123.158 Y108.178 E.13285
G1 X123.527 Y108.178 E.00622
G1 X123.635 Y108.07 E.00255
G1 X128.847 Y113.283 E.12405
G1 X128.954 Y113.175 E.00255
G1 X129.324 Y113.175 E.00622
G1 X123.742 Y107.593 E.13285
G1 X123.742 Y107.009 E.00983
G1 X129.908 Y113.175 E.14675
G1 X130.19 Y113.163 E.00475
G1 X130.19 Y112.873 E.00489
G1 X124.044 Y106.728 E.14626
G1 X124.628 Y106.728 E.00983
G1 X130.19 Y112.289 E.13236
G1 X130.19 Y111.705 E.00983
G1 X125.212 Y106.728 E.11845
G1 X125.797 Y106.728 E.00983
G1 X130.19 Y111.121 E.10455
G1 X130.19 Y110.536 E.00983
G1 X126.381 Y106.728 E.09065
G1 X126.965 Y106.728 E.00983
G1 X130.369 Y110.132 E.08102
M204 S10000
G1 X130.369 Y108.379 F42000
G1 F15000
M204 S6000
G1 X130.167 Y108.178 E.0048
G1 X129.583 Y108.178 E.00983
G1 X130.19 Y108.784 E.01444
G1 X130.19 Y109.368 E.00983
G1 X127.549 Y106.728 E.06285
G1 X128.133 Y106.728 E.00983
G1 X128.74 Y107.334 E.01444
G1 X128.74 Y106.75 E.00983
G1 X128.538 Y106.548 E.0048
M204 S10000
G1 X132.64 Y104.269 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.36146
G1 F12000
M204 S6000
G1 X132.506 Y104.233 E.00192
G1 X119.994 Y104.227 E.17333
G1 X119.832 Y104.275 E.00234
G1 X119.792 Y104.437 E.00231
G1 X119.792 Y116.923 E.17297
G1 X119.839 Y117.085 E.00234
G1 X120.001 Y117.126 E.00231
G1 X132.487 Y117.126 E.17297
G1 X132.65 Y117.078 E.00234
G1 X132.69 Y116.916 E.00231
G1 X132.69 Y104.43 E.17297
G1 X132.658 Y104.326 E.0015
M204 S10000
G1 X132.328 Y105.767 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X132.328 Y104.596 E.02044
G1 X131.784 Y104.596 E.00949
G3 X131.069 Y104.915 I-1.194 J-1.717 E.01375
G3 X130.379 Y104.969 I-.403 J-.714 E.01247
G1 X130.22 Y104.595 E.0071
G1 X126.271 Y104.593 E.06896
G3 X125.551 Y104.915 I-1.205 J-1.729 E.01385
G3 X124.861 Y104.969 I-.403 J-.714 E.01247
G1 X124.701 Y104.592 E.00715
G1 X120.758 Y104.59 E.06886
G3 X120.154 Y104.862 I-1.017 J-1.449 E.01163
G1 X120.154 Y106.899 E.03556
G2 X121.413 Y107.674 I1.991 J-1.825 E.02614
G2 X122.103 Y107.728 I.403 J-.714 E.01247
G1 X122.447 Y106.915 E.01542
G3 X124.172 Y105.403 I2.421 J1.021 E.04144
G3 X124.861 Y105.348 I.403 J.714 E.01247
G2 X125.292 Y106.314 I4.465 J-1.414 E.0185
G1 X128.305 Y106.314 E.05259
G3 X129.689 Y105.403 I2.124 J1.72 E.02941
G3 X130.379 Y105.348 I.403 J.714 E.01247
G1 X130.724 Y106.162 E.01542
G2 X132.328 Y107.621 I2.306 J-.923 E.03918
G1 X132.328 Y109.658 E.03557
G3 X130.603 Y110.519 I-2.188 J-2.225 E.03421
G2 X132.328 Y113.139 I2.329 J.344 E.05992
G1 X132.328 Y115.176 E.03557
G3 X131.069 Y115.95 I-1.991 J-1.825 E.02614
G3 X130.379 Y116.005 I-.403 J-.714 E.01247
G1 X130.034 Y115.191 E.01542
G2 X129.153 Y114.086 I-2.35 J.969 E.02501
G1 X129.153 Y114.785 E.0122
G1 X128.899 Y115.039 E.00628
G1 X126.936 Y115.039 E.03427
G3 X125.551 Y115.95 I-2.124 J-1.719 E.02941
G3 X124.861 Y116.005 I-.403 J-.714 E.01247
G2 X124.43 Y115.039 I-4.465 J1.414 E.01851
G1 X123.583 Y115.039 E.0148
G1 X123.328 Y114.785 E.00628
G1 X123.328 Y113.913 E.01521
G2 X122.103 Y113.625 I-1.028 J1.62 E.0224
G1 X121.758 Y114.438 E.01542
G3 X120.154 Y115.898 I-2.306 J-.923 E.03918
G1 X120.154 Y116.763 E.01511
G1 X123.447 Y116.763 E.0575
G3 X124.172 Y116.438 I1.216 J1.739 E.01395
G3 X124.861 Y116.384 I.403 J.714 E.01247
G1 X125.022 Y116.763 E.0072
G1 X128.965 Y116.763 E.06884
G3 X129.689 Y116.438 I1.216 J1.739 E.01395
G3 X130.379 Y116.384 I.403 J.714 E.01247
G1 X130.54 Y116.763 E.0072
G1 X132.254 Y116.763 E.02993
M204 S10000
G1 X121.878 Y111.564 F42000
G1 F16200
M204 S6000
G1 X121.878 Y113.278 E.02993
G3 X120.154 Y112.417 I.464 J-3.086 E.03421
G1 X120.154 Y110.38 E.03556
G2 X121.878 Y108.636 I-.79 J-2.506 E.04455
G1 X121.878 Y109.183 E.00955
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X121.878 Y108.636 E-.20778
G1 X121.413 Y109.531 E-.38323
G1 X121.107 Y109.854 E-.16899
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 8/72
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S183.6
; OBJECT_ID: 126
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I-1.205 J-.172 P1  F42000
G1 X113.978 Y159.885 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X113.973 Y159.885 E.00007
G3 X112.864 Y160.634 I-1.128 J-.475 E.02298
G1 X95.454 Y160.634 E.28271
G3 X94.249 Y159.429 I.019 J-1.224 E.0306
G1 X94.249 Y142.018 E.28271
G3 X95.454 Y140.814 I1.224 J.019 E.0306
G1 X112.864 Y140.814 E.28271
G3 X114.069 Y142.018 I-.019 J1.224 E.0306
G1 X114.069 Y159.429 E.28271
G3 X114.044 Y159.659 I-1.224 J-.019 E.00377
G1 X113.995 Y159.828 E.00285
; WIPE_START
M204 S6000
G1 X113.973 Y159.885 E-.02328
G1 X113.866 Y160.096 E-.09001
G1 X113.715 Y160.279 E-.09013
G1 X113.532 Y160.43 E-.09016
G1 X113.322 Y160.542 E-.09017
G1 X113.095 Y160.611 E-.09013
G1 X112.864 Y160.634 E-.0882
G1 X112.344 Y160.634 E-.19792
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P51 R11
G1 X113.334 Y153.066 Z1.2 F42000
G1 X115.117 Y139.439 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X115.649 Y140.429 I-.672 J.999 E.01899
G1 X115.649 Y161.018 E.33433
G3 X114.454 Y162.214 I-1.205 J-.009 E.03042
G1 X93.864 Y162.214 E.33433
G3 X92.669 Y161.018 I.009 J-1.205 E.03042
G1 X92.669 Y140.429 E.33433
G3 X93.864 Y139.234 I1.205 J.009 E.03042
G1 X114.463 Y139.234 E.33447
G3 X115.067 Y139.407 I-.017 J1.204 E.01032
; WIPE_START
M204 S6000
G1 X115.301 Y139.582 E-.11119
G1 X115.449 Y139.763 E-.08865
G1 X115.558 Y139.968 E-.08863
G1 X115.626 Y140.192 E-.08864
G1 X115.649 Y140.429 E-.09059
G1 X115.649 Y141.198 E-.29231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 126
M625
; object ids of layer 8 start: 104,115,126,137,148
M624 HwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer8 end: 104,115,126,137,148
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X115.415 Y161.167 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X114.603 Y161.979 E.01864
G1 X114.024 Y161.994
G1 X115.43 Y160.588 E.0323
G1 X115.43 Y160.024
G1 X113.46 Y161.994 E.04524
G1 X112.896 Y161.994
G1 X115.43 Y159.461 E.05818
G1 X115.43 Y158.897
G1 X112.333 Y161.994 E.07113
G1 X111.769 Y161.994
G1 X112.915 Y160.849 E.02631
G1 X112.347 Y160.853
G1 X111.206 Y161.994 E.02622
G1 X110.642 Y161.994
G1 X111.784 Y160.853 E.02622
G1 X111.22 Y160.853
G1 X110.078 Y161.994 E.02622
G1 X109.515 Y161.994
G1 X110.656 Y160.853 E.02622
G1 X110.093 Y160.853
G1 X108.951 Y161.994 E.02622
G1 X108.388 Y161.994
G1 X109.529 Y160.853 E.02622
G1 X108.966 Y160.853
G1 X107.824 Y161.994 E.02622
G1 X107.26 Y161.994
G1 X108.402 Y160.853 E.02622
G1 X107.838 Y160.853
G1 X106.697 Y161.994 E.02622
G1 X106.133 Y161.994
G1 X107.275 Y160.853 E.02622
G1 X106.711 Y160.853
G1 X105.569 Y161.994 E.02622
G1 X105.006 Y161.994
G1 X106.148 Y160.853 E.02622
G1 X105.584 Y160.853
G1 X104.442 Y161.994 E.02622
G1 X103.879 Y161.994
G1 X105.02 Y160.853 E.02622
G1 X104.457 Y160.853
G1 X103.315 Y161.994 E.02622
G1 X102.751 Y161.994
G1 X103.893 Y160.853 E.02622
G1 X103.329 Y160.853
G1 X102.188 Y161.994 E.02622
G1 X101.624 Y161.994
G1 X102.766 Y160.853 E.02622
G1 X102.202 Y160.853
G1 X101.061 Y161.994 E.02622
G1 X100.497 Y161.994
G1 X101.639 Y160.853 E.02622
G1 X101.075 Y160.853
G1 X99.933 Y161.994 E.02622
G1 X99.37 Y161.994
G1 X100.511 Y160.853 E.02622
G1 X99.948 Y160.853
G1 X98.806 Y161.994 E.02622
G1 X98.243 Y161.994
G1 X99.384 Y160.853 E.02622
G1 X98.821 Y160.853
G1 X97.679 Y161.994 E.02622
G1 X97.115 Y161.994
G1 X98.257 Y160.853 E.02622
G1 X97.693 Y160.853
G1 X96.552 Y161.994 E.02622
G1 X95.988 Y161.994
G1 X97.13 Y160.853 E.02622
G1 X96.566 Y160.853
G1 X95.425 Y161.994 E.02622
G1 X94.861 Y161.994
G1 X96.003 Y160.853 E.02622
G1 X95.439 Y160.852
G1 X94.297 Y161.994 E.02622
G1 X93.746 Y161.982
G1 X94.966 Y160.762 E.02802
G1 X94.602 Y160.562
G1 X93.33 Y161.835 E.02922
G1 X93.048 Y161.553
G1 X94.321 Y160.28 E.02922
G1 X94.121 Y159.916
G1 X92.901 Y161.136 E.02802
G1 X92.888 Y160.585
G1 X94.03 Y159.443 E.02622
G1 X94.03 Y158.88
G1 X92.888 Y160.022 E.02622
G1 X92.888 Y159.458
G1 X94.03 Y158.316 E.02622
G1 X94.03 Y157.753
G1 X92.888 Y158.894 E.02622
G1 X92.888 Y158.331
G1 X94.03 Y157.189 E.02622
G1 X94.03 Y156.626
G1 X92.888 Y157.767 E.02622
G1 X92.888 Y157.204
G1 X94.03 Y156.062 E.02622
G1 X94.03 Y155.498
G1 X92.888 Y156.64 E.02622
G1 X92.888 Y156.076
G1 X94.03 Y154.935 E.02622
G1 X94.03 Y154.371
G1 X92.888 Y155.513 E.02622
G1 X92.888 Y154.949
G1 X94.03 Y153.808 E.02622
G1 X94.03 Y153.244
G1 X92.888 Y154.386 E.02622
G1 X92.888 Y153.822
G1 X94.03 Y152.68 E.02622
G1 X94.03 Y152.117
G1 X92.888 Y153.258 E.02622
G1 X92.888 Y152.695
G1 X94.03 Y151.553 E.02622
G1 X94.03 Y150.99
G1 X92.888 Y152.131 E.02622
G1 X92.888 Y151.568
G1 X94.03 Y150.426 E.02622
G1 X94.03 Y149.862
G1 X92.888 Y151.004 E.02622
G1 X92.888 Y150.44
G1 X94.03 Y149.299 E.02622
G1 X94.03 Y148.735
G1 X92.888 Y149.877 E.02622
G1 X92.888 Y149.313
G1 X94.03 Y148.172 E.02622
G1 X94.03 Y147.608
G1 X92.888 Y148.75 E.02622
G1 X92.888 Y148.186
G1 X94.03 Y147.044 E.02622
G1 X94.03 Y146.481
G1 X92.888 Y147.622 E.02622
G1 X92.888 Y147.059
G1 X94.03 Y145.917 E.02622
G1 X94.03 Y145.354
G1 X92.888 Y146.495 E.02622
G1 X92.888 Y145.932
G1 X94.03 Y144.79 E.02622
G1 X94.03 Y144.226
G1 X92.888 Y145.368 E.02622
G1 X92.888 Y144.804
G1 X94.03 Y143.663 E.02622
G1 X94.03 Y143.099
G1 X92.888 Y144.241 E.02622
G1 X92.888 Y143.677
G1 X94.03 Y142.535 E.02622
G1 X94.034 Y141.968
G1 X92.888 Y143.113 E.02631
; WIPE_START
M204 S6000
G1 X94.034 Y141.968 E-.61564
G1 X94.031 Y142.348 E-.14437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.859 Y147.277 Z1.2 F42000
G1 X114.285 Y159.479 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X115.43 Y158.333 E.02631
G1 X115.43 Y157.77
G1 X114.288 Y158.912 E.02622
G1 X114.288 Y158.348
G1 X115.43 Y157.206 E.02622
G1 X115.43 Y156.643
G1 X114.288 Y157.784 E.02622
G1 X114.288 Y157.221
G1 X115.43 Y156.079 E.02622
G1 X115.43 Y155.515
G1 X114.288 Y156.657 E.02622
G1 X114.288 Y156.093
G1 X115.43 Y154.952 E.02622
G1 X115.43 Y154.388
G1 X114.288 Y155.53 E.02622
G1 X114.288 Y154.966
G1 X115.43 Y153.825 E.02622
G1 X115.43 Y153.261
G1 X114.288 Y154.403 E.02622
G1 X114.288 Y153.839
G1 X115.43 Y152.697 E.02622
G1 X115.43 Y152.134
G1 X114.288 Y153.275 E.02622
G1 X114.288 Y152.712
G1 X115.43 Y151.57 E.02622
G1 X115.43 Y151.007
G1 X114.288 Y152.148 E.02622
G1 X114.288 Y151.585
G1 X115.43 Y150.443 E.02622
G1 X115.43 Y149.879
G1 X114.288 Y151.021 E.02622
G1 X114.288 Y150.457
G1 X115.43 Y149.316 E.02622
G1 X115.43 Y148.752
G1 X114.288 Y149.894 E.02622
G1 X114.288 Y149.33
G1 X115.43 Y148.189 E.02622
G1 X115.43 Y147.625
G1 X114.288 Y148.767 E.02622
G1 X114.288 Y148.203
G1 X115.43 Y147.061 E.02622
G1 X115.43 Y146.498
G1 X114.288 Y147.639 E.02622
G1 X114.288 Y147.076
G1 X115.43 Y145.934 E.02622
G1 X115.43 Y145.371
G1 X114.288 Y146.512 E.02622
G1 X114.288 Y145.949
G1 X115.43 Y144.807 E.02622
G1 X115.43 Y144.243
G1 X114.288 Y145.385 E.02622
G1 X114.288 Y144.821
G1 X115.43 Y143.68 E.02622
G1 X115.43 Y143.116
G1 X114.288 Y144.258 E.02622
G1 X114.288 Y143.694
G1 X115.43 Y142.553 E.02622
G1 X115.43 Y141.989
G1 X114.288 Y143.131 E.02622
G1 X114.288 Y142.567
G1 X115.43 Y141.425 E.02622
G1 X115.43 Y140.862
G1 X114.288 Y142.004 E.02623
G1 X114.197 Y141.531
G1 X115.418 Y140.311 E.02802
G1 X115.27 Y139.894
G1 X113.998 Y141.167 E.02922
G1 X113.716 Y140.885
G1 X114.989 Y139.612 E.02922
G1 X114.572 Y139.465
G1 X113.352 Y140.685 E.02802
G1 X112.879 Y140.595
G1 X114.021 Y139.453 E.02622
G1 X113.457 Y139.453
G1 X112.316 Y140.594 E.02621
G1 X111.752 Y140.594
G1 X112.893 Y139.453 E.02621
G1 X112.33 Y139.453
G1 X111.189 Y140.594 E.02621
G1 X110.625 Y140.594
G1 X111.766 Y139.453 E.02621
G1 X111.203 Y139.453
G1 X110.061 Y140.594 E.02621
G1 X109.498 Y140.594
G1 X110.639 Y139.453 E.02621
G1 X110.075 Y139.453
G1 X108.934 Y140.594 E.02621
G1 X108.371 Y140.594
G1 X109.512 Y139.453 E.02621
G1 X108.948 Y139.453
G1 X107.807 Y140.594 E.02621
G1 X107.243 Y140.594
G1 X108.385 Y139.453 E.02621
G1 X107.821 Y139.453
G1 X106.68 Y140.594 E.02621
G1 X106.116 Y140.594
G1 X107.257 Y139.453 E.02621
G1 X106.694 Y139.453
G1 X105.552 Y140.594 E.02621
G1 X104.989 Y140.594
G1 X106.13 Y139.453 E.02621
G1 X105.567 Y139.453
G1 X104.425 Y140.594 E.02621
G1 X103.862 Y140.594
G1 X105.003 Y139.453 E.02621
G1 X104.439 Y139.453
G1 X103.298 Y140.594 E.02621
G1 X102.734 Y140.594
G1 X103.876 Y139.453 E.02621
G1 X103.312 Y139.453
G1 X102.171 Y140.594 E.02621
M73 P52 R11
G1 X101.607 Y140.594
G1 X102.749 Y139.453 E.02621
G1 X102.185 Y139.453
G1 X101.044 Y140.594 E.02621
G1 X100.48 Y140.594
G1 X101.621 Y139.453 E.02621
G1 X101.058 Y139.453
G1 X99.916 Y140.594 E.02621
G1 X99.353 Y140.594
G1 X100.494 Y139.453 E.02621
G1 X99.931 Y139.453
G1 X98.789 Y140.594 E.02621
G1 X98.226 Y140.594
G1 X99.367 Y139.453 E.02621
G1 X98.804 Y139.453
G1 X97.662 Y140.594 E.02621
G1 X97.098 Y140.594
G1 X98.24 Y139.453 E.02621
G1 X97.676 Y139.453
G1 X96.535 Y140.594 E.02621
G1 X95.971 Y140.594
G1 X97.113 Y139.453 E.02621
G1 X96.549 Y139.453
G1 X95.404 Y140.598 E.02631
; WIPE_START
M204 S6000
G1 X96.549 Y139.453 E-.61561
G1 X96.929 Y139.453 E-.14439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.986 Y139.453 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X92.888 Y142.55 E.07112
G1 X92.888 Y141.986
G1 X95.422 Y139.453 E.05818
G1 X94.858 Y139.453
G1 X92.888 Y141.423 E.04524
G1 X92.888 Y140.859
G1 X94.295 Y139.453 E.03229
G1 X93.716 Y139.468
G1 X92.904 Y140.28 E.01864
; WIPE_START
M204 S6000
G1 X93.716 Y139.468 E-.43619
G1 X94.295 Y139.453 E-.22015
G1 X94.102 Y139.646 E-.10366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.326 Y140.521 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101926
G1 F15000
M204 S6000
G1 X95.097 Y140.644 E.00085
; WIPE_START
G1 X95.326 Y140.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.079 Y141.661 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101952
G1 F15000
M204 S6000
G1 X93.957 Y141.89 E.00085
; WIPE_START
G1 X94.079 Y141.661 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.476 Y147.058 Z1.2 F42000
G1 X113.222 Y160.804 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101809
G1 F15000
M204 S6000
G1 X112.992 Y160.926 E.00085
; WIPE_START
G1 X113.222 Y160.804 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.362 Y159.556 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101818
G1 F15000
M204 S6000
G1 X114.239 Y159.786 E.00085
; OBJECT_ID: 137
; WIPE_START
G1 X114.362 Y159.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G1 X121.6 Y157.135 Z1.2 F42000
G1 X162.841 Y143.341 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.213 Y143.406 E.00613
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03759
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X147.679 Y160.636 E.00927
G1 X149.27 Y160.06 E.02747
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.828 Y143.4 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.213 Y143.406 E-.14654
G1 X162.844 Y144.977 E-.61346
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.948 Y137.346 Z1.2 F42000
G1 X163.148 Y122.824 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03758
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X138.258 Y140.712 E.00931
G1 X136.534 Y140.466 E.02827
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132 E.03675
G1 X160.05 Y130.169 E.03674
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z1.2 F42000
G1 X158.543 Y113.936 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.2 F42000
G1 X144.743 Y97.086 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P52 R10
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.195 J-13.518 E.08517
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.066 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.579 J-13.631 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.2 F42000
G1 X159.301 Y97.086 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.2 F42000
G1 X161.531 Y105.786 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-13.01 J-13.838 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
M73 P53 R10
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.446 Y99.416 Z1.2 F42000
G1 X158.757 Y98.251 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00614
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.00781
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.258 J-13.377 E.06091
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01065
G2 X161.278 Y115.417 I-9.036 J-15.457 E.05034
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.00551
; LINE_WIDTH: 0.439768
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465805
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.019
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.5117
G1 F14686.685
M204 S6000
G1 X159.546 Y116.186 E.00582
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443408
G1 F15000
M204 S6000
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474327
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.551 Y116.859 E.00882
; LINE_WIDTH: 0.437375
G1 X158.799 Y116.685 E.00514
; LINE_WIDTH: 0.472145
G1 X159.048 Y116.51 E.00557
; LINE_WIDTH: 0.506915
G1 F14831.447
G1 X159.296 Y116.336 E.006
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472145
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420177
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.50282
G1 F14957.619
M204 S6000
G1 X141.474 Y116.272 E.00371
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.701 Y115.794 E.01447
; LINE_WIDTH: 0.437988
G1 X141.007 Y115.983 E.00611
; LINE_WIDTH: 0.462198
G1 X141.314 Y116.172 E.00646
G1 X140.888 Y115.638 E.01226
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.0098
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.16 J-13.876 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.141 J-17.579 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.425 Y115.192 E.00712
G1 X142.124 Y115.192 E.26468
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.686 J-13.588 E.06694
G1 X158.271 Y117.912 E.25436
G1 X158.949 Y117.55 E.01248
G2 X161.677 Y115.603 I-9.376 J-16.016 E.0545
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00469
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.2 F42000
G1 X144.107 Y94.026 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.898 Y99.343 Z1.2 F42000
G1 X119.451 Y117.252 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.424 Y117.2 E.00103
G3 X119.389 Y116.976 I.555 J-.203 E.00398
G1 X119.389 Y104.377 E.21998
G3 X119.59 Y103.925 I.57 J-.017 E.00894
G3 X119.941 Y103.824 I.33 J.49 E.00648
G1 X132.584 Y103.831 E.22074
G3 X133.057 Y104.153 I.015 J.487 E.01068
G1 X133.093 Y104.377 E.00396
G1 X133.093 Y116.976 E.21998
G3 X132.892 Y117.428 I-.57 J.017 E.00894
G3 X132.54 Y117.528 I-.33 J-.49 E.00648
G1 X119.941 Y117.528 E.21998
G3 X119.489 Y117.327 I-.017 J-.57 E.00894
G1 X119.478 Y117.306 E.00042
M204 S10000
G1 X119.069 Y117.447 F42000
G1 F6000
M204 S6000
G1 X119.012 Y117.334 E.00221
G1 X118.96 Y117.01 E.00573
G1 X118.96 Y104.343 E.22116
G1 X119.012 Y104.019 E.00573
G3 X119.583 Y103.447 I.926 J.355 E.01454
G1 X119.907 Y103.396 E.00573
G1 X132.574 Y103.396 E.22116
G1 X132.651 Y103.408 E.00136
G3 X133.47 Y104.019 I-.021 J.882 E.01902
G1 X133.521 Y104.343 E.00573
G1 X133.521 Y117.01 E.22116
G1 X133.47 Y117.334 E.00573
G3 X132.898 Y117.906 I-.926 J-.355 E.01454
G1 X132.574 Y117.957 E.00573
G1 X119.907 Y117.957 E.22116
G1 X119.583 Y117.906 E.00573
G3 X119.146 Y117.576 I.355 J-.926 E.00968
G1 X119.1 Y117.498 E.00158
M204 S250
G1 X118.701 Y117.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.613 Y117.463 E.00312
G1 X118.547 Y117.024 E.00722
G1 X118.547 Y104.329 E.20615
G1 X118.613 Y103.89 E.00722
G1 X118.799 Y103.525 E.00665
G1 X119.089 Y103.235 E.00665
G1 X119.454 Y103.049 E.00665
G1 X119.893 Y102.982 E.00722
G1 X132.588 Y102.982 E.20615
G3 X132.716 Y103 I.009 J.41 E.00209
G1 X133.028 Y103.049 E.00513
G1 X133.393 Y103.235 E.00665
G1 X133.682 Y103.525 E.00665
G1 X133.868 Y103.889 E.00665
G1 X133.935 Y104.329 E.00722
G1 X133.935 Y117.024 E.20615
G1 X133.868 Y117.463 E.00722
G1 X133.682 Y117.828 E.00665
G1 X133.393 Y118.118 E.00665
G1 X133.028 Y118.304 E.00665
G1 X132.588 Y118.371 E.00722
G1 X119.893 Y118.371 E.20615
G1 X119.454 Y118.304 E.00722
G1 X119.089 Y118.118 E.00665
G1 X118.799 Y117.828 E.00665
G1 X118.728 Y117.688 E.00256
; WIPE_START
M204 S6000
G1 X118.613 Y117.463 E-.09581
G1 X118.547 Y117.024 E-.16886
G1 X118.547 Y115.721 E-.49533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.563 Y116.538 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4044
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G2 X119.798 Y117.103 I3.623 J-1.174 E.03204
G2 X119.835 Y117.13 I.06 J-.044 E.00245
G2 X120.308 Y117.151 I.304 J-1.481 E.02484
G1 X119.766 Y115.836 E.07441
G1 X119.766 Y114.644 E.06243
G1 X120.799 Y117.151 E.14193
G1 X121.29 Y117.151 E.02572
G1 X119.766 Y113.451 E.20946
G1 X119.766 Y112.258 E.06243
G1 X121.782 Y117.151 E.27698
G1 X122.273 Y117.151 E.02572
G1 X119.766 Y111.065 E.3445
G1 X119.766 Y109.872 E.06243
G1 X122.765 Y117.151 E.41202
G1 X123.256 Y117.151 E.02572
G1 X119.766 Y108.679 E.47954
G1 X119.766 Y107.486 E.06243
G1 X123.748 Y117.151 E.54706
G1 X124.239 Y117.151 E.02572
G1 X119.766 Y106.293 E.61458
G1 X119.766 Y105.1 E.06243
G1 X122.543 Y111.84 E.38151
G1 X122.543 Y110.647 E.06243
G1 X119.893 Y104.214 E.36412
G1 X120.379 Y104.202 E.02546
G1 X122.543 Y109.454 E.29729
G1 X122.543 Y108.428 E.05369
G1 X122.612 Y108.428 E.0036
G1 X120.871 Y104.202 E.23921
G1 X121.362 Y104.202 E.02572
G1 X123.103 Y108.428 E.23919
G1 X123.594 Y108.428 E.02572
G1 X121.854 Y104.203 E.23918
G1 X122.345 Y104.203 E.02572
G1 X123.953 Y108.106 E.22093
G1 X123.993 Y108.067 E.00293
G1 X123.993 Y107.009 E.05534
G1 X122.837 Y104.203 E.15883
G1 X123.328 Y104.204 E.02572
G1 X124.471 Y106.978 E.15706
G1 X124.963 Y106.978 E.02572
G1 X123.82 Y104.204 E.15704
G1 X124.311 Y104.204 E.02572
G1 X125.454 Y106.978 E.15703
G1 X125.946 Y106.978 E.02572
G1 X124.803 Y104.204 E.15702
G1 X125.295 Y104.205 E.02572
G1 X126.437 Y106.978 E.157
G1 X126.929 Y106.978 E.02572
G1 X125.786 Y104.205 E.15698
G1 X126.278 Y104.205 E.02572
G1 X127.42 Y106.978 E.15697
G1 X127.912 Y106.978 E.02572
M73 P54 R10
G1 X126.769 Y104.205 E.15695
G1 X127.261 Y104.206 E.02572
G1 X129 Y108.428 E.23901
G1 X129.492 Y108.428 E.02572
G1 X127.752 Y104.206 E.23899
G1 X128.244 Y104.206 E.02572
G1 X132.716 Y115.061 E.61437
G1 X132.716 Y116.254 E.06243
G1 X129.939 Y109.513 E.38151
G1 X129.939 Y110.706 E.06243
G1 X132.589 Y117.139 E.36408
G1 X132.102 Y117.151 E.02546
G1 X129.939 Y111.899 E.29726
G1 X129.939 Y112.924 E.05365
G1 X129.87 Y112.924 E.00362
G1 X131.611 Y117.151 E.23923
G1 X131.119 Y117.151 E.02572
G1 X129.378 Y112.924 E.23923
G1 X128.887 Y112.924 E.02572
G1 X130.628 Y117.151 E.23923
G1 X130.137 Y117.151 E.02572
G1 X128.528 Y113.247 E.22099
G1 X128.489 Y113.286 E.00291
G1 X128.489 Y114.344 E.05538
G1 X129.645 Y117.151 E.15887
G1 X129.154 Y117.151 E.02572
G1 X128.01 Y114.374 E.15716
G1 X127.518 Y114.374 E.02572
G1 X128.662 Y117.151 E.15716
G1 X128.171 Y117.151 E.02572
G1 X127.027 Y114.374 E.15716
G1 X126.535 Y114.374 E.02572
G1 X127.679 Y117.151 E.15717
G1 X127.188 Y117.151 E.02572
G1 X126.044 Y114.374 E.15717
G1 X125.552 Y114.374 E.02572
G1 X126.696 Y117.151 E.15717
G1 X126.205 Y117.151 E.02572
G1 X125.061 Y114.374 E.15717
G1 X124.57 Y114.374 E.02572
G1 X125.713 Y117.151 E.15716
G1 X125.222 Y117.151 E.02572
G1 X123.481 Y112.924 E.23923
G1 X122.989 Y112.924 E.02572
G1 X124.814 Y117.354 E.2507
M106 S183.6
M204 S10000
G1 X127.416 Y114.129 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43052
; LAYER_HEIGHT: 0.1
G1 F15000
M204 S6000
G1 X128.064 Y113.481 E.01529
G1 X128.064 Y113.11 E.00617
G1 X128.675 Y112.5 E.01438
G1 X129.045 Y112.5 E.00617
G1 X129.514 Y112.031 E.01106
G1 X129.514 Y111.452 E.00964
G1 X127.017 Y113.95 E.05887
G1 X126.438 Y113.95 E.00964
G1 X129.514 Y110.874 E.07251
G1 X129.514 Y110.295 E.00964
G1 X125.86 Y113.95 E.08614
G1 X125.281 Y113.95 E.00964
G1 X129.514 Y109.717 E.09978
G1 X129.514 Y109.138 E.00964
G1 X124.703 Y113.95 E.11341
G1 X124.417 Y113.95 E.00476
G1 X124.417 Y113.657 E.00488
G1 X129.221 Y108.853 E.11324
G1 X128.675 Y108.853 E.00911
G1 X128.659 Y108.837 E.00037
G1 X124.401 Y113.094 E.10035
G1 X124.112 Y112.805 E.00682
G1 X128.369 Y108.548 E.10035
G1 X128.08 Y108.258 E.00682
G1 X123.823 Y112.516 E.10035
G1 X123.807 Y112.5 E.00037
G1 X123.26 Y112.5 E.00911
G1 X128.064 Y107.696 E.11324
G1 X128.064 Y107.403 E.00488
G1 X127.779 Y107.403 E.00476
G1 X122.967 Y112.215 E.11341
G1 X122.967 Y111.636 E.00964
G1 X127.2 Y107.403 E.09978
G1 X126.622 Y107.403 E.00964
G1 X122.967 Y111.058 E.08614
G1 X122.967 Y110.479 E.00964
G1 X126.043 Y107.403 E.07251
G1 X125.465 Y107.403 E.00964
G1 X122.967 Y109.901 E.05887
G1 X122.967 Y109.322 E.00964
G1 X123.436 Y108.853 E.01106
G1 X123.807 Y108.853 E.00618
G1 X124.417 Y108.243 E.01438
G1 X124.417 Y107.872 E.00618
G1 X125.066 Y107.224 E.01529
M204 S10000
G1 X128.652 Y104.004 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.4044
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X132.716 Y113.868 E.5583
G1 X132.716 Y112.675 E.06243
G1 X129.227 Y104.207 E.4793
G1 X129.719 Y104.207 E.02572
G1 X132.716 Y111.482 E.41176
G1 X132.716 Y110.289 E.06243
G1 X130.21 Y104.207 E.34422
G1 X130.702 Y104.208 E.02572
G1 X132.716 Y109.096 E.27669
G1 X132.716 Y107.903 E.06243
G1 X131.193 Y104.208 E.20915
G1 X131.685 Y104.208 E.02572
G1 X132.716 Y106.71 E.14161
G1 X132.716 Y105.517 E.06243
G1 X132.176 Y104.208 E.07408
G3 X132.646 Y104.223 I.188 J1.496 E.0247
G3 X132.692 Y104.267 I-.028 J.075 E.00339
G1 X132.918 Y104.816 E.03108
M106 S183.6
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3000
G1 X132.692 Y104.267 E-.22566
G1 X132.646 Y104.223 E-.02395
G1 X132.176 Y104.208 E-.17864
G1 X132.509 Y105.016 E-.33175
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 9/72
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S193.8
; OBJECT_ID: 137
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.954 J.755 P1  F42000
G1 X162.839 Y143.341 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.213 Y143.406 E.00616
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.641 E.03758
G1 X161.014 Y149.745 E.03759
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03758
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03758
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03758
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03759
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03675
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.213 Y143.406 E-.14725
G1 X162.844 Y144.976 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.344 Z1.3 F42000
G1 X163.148 Y122.824 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03758
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X133.966 Y139.799 E.00552
G1 X132.106 Y139.138 E.03206
G1 X130.013 Y138.15 E.03759
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.418 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03675
G1 X151.809 Y137.76 E.03674
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35756
G1 X162.991 Y124.812 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z1.3 F42000
G1 X158.543 Y113.936 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.3 F42000
G1 X144.743 Y97.086 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.06 J-13.32 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.066 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
M73 P55 R10
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.454 J-13.449 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.111 J-16.436 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.3 F42000
G1 X159.301 Y97.086 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.3 F42000
G1 X161.531 Y105.786 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.235 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 9 start: 104,115,137,148
M624 GwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.3 F4000
            G39.3 S1
            G0 Z1.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer9 end: 104,115,137,148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.0078
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.257 J-13.376 E.06091
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01065
G2 X161.278 Y115.417 I-9.036 J-15.458 E.05034
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.00551
; LINE_WIDTH: 0.439768
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465805
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.019
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474339
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.551 Y116.859 E.00882
; LINE_WIDTH: 0.437388
G1 X158.799 Y116.685 E.00514
; LINE_WIDTH: 0.472185
G1 X159.047 Y116.51 E.00557
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X159.296 Y116.336 E.006
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420178
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X141.474 Y116.272 E.00371
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.701 Y115.794 E.01448
; LINE_WIDTH: 0.437993
G1 X141.007 Y115.983 E.00611
; LINE_WIDTH: 0.462209
G1 X141.314 Y116.172 E.00646
G1 X140.888 Y115.638 E.01226
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00981
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.159 J-13.876 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.138 J-17.573 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00712
G1 X142.124 Y115.192 E.26467
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.686 J-13.588 E.06694
G1 X158.271 Y117.912 E.25436
G2 X160.968 Y116.197 I-8.941 J-17.029 E.05196
G1 X161.677 Y115.603 E.01502
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
M73 P56 R10
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00469
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.3 F42000
G1 X144.107 Y94.026 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.894 Y99.339 Z1.3 F42000
G1 X119.402 Y117.263 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.384 Y117.229 E.00066
G3 X119.348 Y117 I.571 J-.208 E.00407
G1 X119.348 Y104.353 E.22083
G3 X119.556 Y103.887 I.588 J-.016 E.0092
G3 X119.917 Y103.784 I.34 J.504 E.00666
G1 X132.625 Y103.793 E.22188
G3 X133.097 Y104.124 I.009 J.49 E.01075
G1 X133.133 Y104.353 E.00405
G1 X133.133 Y117 E.22083
G3 X132.925 Y117.466 I-.588 J.016 E.0092
G3 X132.565 Y117.569 I-.34 J-.503 E.00666
G1 X119.917 Y117.569 E.22083
G3 X119.452 Y117.361 I-.016 J-.588 E.0092
G1 X119.429 Y117.316 E.00088
M204 S10000
G1 X119.02 Y117.457 F42000
G1 F6000
M204 S6000
G1 X118.972 Y117.363 E.00184
G1 X118.92 Y117.034 E.00582
G1 X118.92 Y104.319 E.22201
G1 X118.972 Y103.99 E.00582
G3 X119.554 Y103.408 I.913 J.331 E.01484
G1 X119.883 Y103.355 E.00582
G1 X132.598 Y103.355 E.22201
G1 X132.692 Y103.37 E.00165
G1 X132.928 Y103.408 E.00417
G3 X133.51 Y103.99 I-.361 J.943 E.0148
G1 X133.562 Y104.319 E.00582
G1 X133.562 Y117.034 E.22201
G1 X133.51 Y117.363 E.00582
G3 X132.928 Y117.945 I-.914 J-.332 E.01484
G1 X132.598 Y117.998 E.00582
G1 X119.883 Y117.998 E.22201
G1 X119.554 Y117.945 E.00582
G3 X119.106 Y117.612 I.331 J-.913 E.00989
G1 X119.049 Y117.51 E.00205
M204 S250
G1 X118.651 Y117.645 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.574 Y117.493 E.00278
G1 X118.506 Y117.048 E.0073
G1 X118.506 Y104.305 E.20693
G1 X118.574 Y103.86 E.0073
G1 X118.762 Y103.491 E.00673
G1 X119.055 Y103.198 E.00673
G1 X119.424 Y103.009 E.00673
G1 X119.869 Y102.942 E.0073
G1 X132.613 Y102.942 E.20693
G3 X132.757 Y102.962 I.009 J.464 E.00237
G1 X133.057 Y103.009 E.00494
G1 X133.426 Y103.198 E.00673
G1 X133.72 Y103.491 E.00673
G1 X133.908 Y103.86 E.00673
G1 X133.975 Y104.305 E.0073
G1 X133.975 Y117.048 E.20693
G1 X133.908 Y117.493 E.0073
G1 X133.72 Y117.862 E.00673
G1 X133.426 Y118.155 E.00673
G1 X133.057 Y118.344 E.00673
G1 X132.613 Y118.411 E.0073
G1 X119.869 Y118.411 E.20693
G1 X119.424 Y118.344 E.0073
G1 X119.055 Y118.155 E.00673
G1 X118.762 Y117.862 E.00673
G1 X118.679 Y117.699 E.00298
; WIPE_START
M204 S6000
G1 X118.574 Y117.493 E-.08778
G1 X118.506 Y117.048 E-.17078
G1 X118.506 Y115.729 E-.50144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.52 Y116.932 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4204
G1 F15000
M204 S6000
G1 X119.766 Y117.178 E.00565
G2 X119.945 Y117.218 I.15 J-.255 E.00302
G1 X120.37 Y117.218 E.00691
G1 X119.7 Y116.547 E.0154
G1 X119.7 Y115.983 E.00917
G1 X120.934 Y117.218 E.02837
G1 X121.498 Y117.218 E.00917
G1 X119.7 Y115.419 E.04134
G1 X119.7 Y114.855 E.00917
G1 X122.062 Y117.218 E.05431
G1 X122.626 Y117.218 E.00917
G1 X119.7 Y114.291 E.06728
G1 X119.7 Y113.727 E.00917
G1 X123.191 Y117.218 E.08025
G1 X123.755 Y117.218 E.00917
G1 X119.7 Y113.162 E.09322
G1 X119.7 Y112.598 E.00917
G1 X124.319 Y117.218 E.10618
G1 X124.883 Y117.218 E.00917
G1 X119.7 Y112.034 E.11915
G1 X119.7 Y111.47 E.00917
G1 X125.447 Y117.218 E.13212
G1 X126.012 Y117.218 E.00917
G1 X119.7 Y110.906 E.14509
G1 X119.7 Y110.341 E.00917
G1 X126.576 Y117.218 E.15806
G1 X127.14 Y117.218 E.00917
G1 X119.7 Y109.777 E.17103
G1 X119.7 Y109.213 E.00917
G1 X127.704 Y117.218 E.184
G1 X128.268 Y117.218 E.00917
G1 X119.7 Y108.649 E.19697
G1 X119.7 Y108.085 E.00917
G1 X128.833 Y117.218 E.20994
G1 X129.397 Y117.218 E.00917
G1 X119.7 Y107.521 E.22291
G1 X119.7 Y106.956 E.00917
G1 X129.961 Y117.218 E.23587
G1 X130.525 Y117.218 E.00917
G1 X119.7 Y106.392 E.24884
G1 X119.7 Y105.828 E.00917
G1 X131.089 Y117.218 E.26181
G1 X131.653 Y117.218 E.00917
G1 X119.7 Y105.264 E.27478
G1 X119.7 Y104.7 E.00917
G1 X132.218 Y117.218 E.28775
G2 X132.684 Y117.194 I.16 J-1.482 E.00762
G2 X132.729 Y117.165 I-.023 J-.085 E.00089
G1 X119.752 Y104.188 E.29829
G1 X119.765 Y104.175 E.0003
G3 X120.264 Y104.136 I.338 J1.099 E.0082
G1 X132.782 Y116.653 E.28774
G1 X132.782 Y116.089 E.00917
G1 X120.829 Y104.136 E.27477
G1 X121.393 Y104.137 E.00918
G1 X132.782 Y115.525 E.26179
G1 X132.782 Y114.961 E.00917
G1 X121.958 Y104.137 E.24881
G1 X122.523 Y104.137 E.00918
G1 X132.782 Y114.397 E.23583
G1 X132.782 Y113.832 E.00917
G1 X123.087 Y104.138 E.22285
G1 X123.652 Y104.138 E.00918
G1 X132.782 Y113.268 E.20987
G1 X132.782 Y112.704 E.00917
G1 X124.216 Y104.139 E.19689
G1 X124.781 Y104.139 E.00918
G1 X132.782 Y112.14 E.18391
G1 X132.782 Y111.576 E.00917
G1 X125.346 Y104.139 E.17094
G1 X125.91 Y104.14 E.00918
G1 X132.782 Y111.011 E.15796
G1 X132.782 Y110.447 E.00917
G1 X126.475 Y104.14 E.14498
G1 X127.039 Y104.141 E.00918
G1 X132.782 Y109.883 E.132
G1 X132.782 Y109.319 E.00917
G1 X127.604 Y104.141 E.11902
G1 X128.169 Y104.142 E.00918
G1 X132.782 Y108.755 E.10604
G1 X132.782 Y108.191 E.00917
G1 X128.733 Y104.142 E.09306
G1 X129.298 Y104.142 E.00918
G1 X132.782 Y107.626 E.08008
G1 X132.782 Y107.062 E.00917
G1 X129.863 Y104.143 E.06711
G1 X130.427 Y104.143 E.00918
G1 X132.782 Y106.498 E.05413
G1 X132.782 Y105.934 E.00917
G1 X130.992 Y104.144 E.04115
G1 X131.556 Y104.144 E.00918
G1 X132.782 Y105.37 E.02817
G1 X132.782 Y104.805 E.00917
G1 X132.121 Y104.145 E.01519
G1 X132.597 Y104.145 E.00774
G3 X132.715 Y104.175 I.013 J.197 E.00202
G1 X132.961 Y104.421 E.00565
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.715 Y104.175 E-.13207
G1 X132.597 Y104.145 E-.04639
G1 X132.121 Y104.145 E-.18092
G1 X132.782 Y104.805 E-.35515
G1 X132.782 Y104.925 E-.04547
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 10/72
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 137
; start printing object, unique label id: 137
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I-.958 J.75 P1  F42000
G1 X162.839 Y143.341 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X163.213 Y143.406 E.00616
G1 X162.732 Y145.453 E.03414
G1 X161.98 Y147.642 E.03758
G1 X161.014 Y149.745 E.03758
G1 X159.843 Y151.741 E.03758
G1 X158.478 Y153.611 E.03758
G1 X156.935 Y155.335 E.03758
G1 X155.227 Y156.897 E.03759
G1 X153.371 Y158.281 E.03758
G1 X151.387 Y159.473 E.03758
G1 X149.294 Y160.461 E.03759
G1 X147.113 Y161.236 E.03758
G1 X144.866 Y161.79 E.03758
G1 X142.575 Y162.116 E.03758
G1 X140.262 Y162.213 E.03758
G1 X137.952 Y162.079 E.03758
G1 X135.666 Y161.715 E.03758
G1 X133.428 Y161.125 E.03758
G1 X131.26 Y160.315 E.03758
G1 X129.183 Y159.292 E.03758
G1 X127.219 Y158.068 E.03758
G1 X125.386 Y156.654 E.03758
G1 X123.704 Y155.065 E.03758
G1 X122.188 Y153.316 E.03758
G1 X120.855 Y151.424 E.03758
G1 X119.716 Y149.409 E.03758
G1 X118.784 Y147.29 E.03758
G1 X118.081 Y145.129 E.03691
G1 X118.252 Y144.148 E.01617
G1 X118.533 Y145.341 E.0199
G1 X119.266 Y147.481 E.03674
G1 X120.209 Y149.539 E.03674
G1 X121.35 Y151.493 E.03675
G1 X122.68 Y153.324 E.03674
G1 X124.184 Y155.014 E.03675
G1 X125.848 Y156.548 E.03675
G1 X127.656 Y157.908 E.03674
G1 X129.591 Y159.083 E.03675
G1 X131.632 Y160.06 E.03674
G1 X133.759 Y160.831 E.03675
G1 X135.953 Y161.387 E.03675
G1 X138.191 Y161.722 E.03675
G1 X140.451 Y161.834 E.03674
G1 X142.711 Y161.722 E.03674
G1 X144.949 Y161.387 E.03675
G1 X147.143 Y160.831 E.03675
G1 X149.27 Y160.06 E.03674
G1 X151.311 Y159.083 E.03674
G1 X153.245 Y157.908 E.03675
G1 X155.054 Y156.548 E.03674
G1 X156.718 Y155.015 E.03675
G1 X158.222 Y153.324 E.03675
G1 X159.552 Y151.493 E.03674
G1 X160.693 Y149.539 E.03675
G1 X161.635 Y147.481 E.03674
G1 X162.369 Y145.341 E.03674
G1 X162.826 Y143.399 E.03239
; OBJECT_ID: 148
; WIPE_START
M204 S6000
G1 X163.213 Y143.406 E-.14725
G1 X162.844 Y144.976 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 137
M625
; start printing object, unique label id: 148
M624 EAAAAAAAAAA=
M204 S10000
G1 X162.949 Y137.344 Z1.4 F42000
G1 X163.148 Y122.824 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.319 Y123.805 E.01617
G1 X162.616 Y125.967 E.03691
G1 X161.684 Y128.085 E.03758
G1 X160.545 Y130.1 E.03758
G1 X159.212 Y131.992 E.03758
G1 X157.696 Y133.741 E.03758
G1 X156.014 Y135.331 E.03758
G1 X154.181 Y136.745 E.03758
G1 X152.217 Y137.969 E.03759
G1 X150.14 Y138.991 E.03758
G1 X147.972 Y139.801 E.03758
G1 X145.734 Y140.391 E.03758
G1 X143.448 Y140.755 E.03758
G1 X141.138 Y140.89 E.03758
G1 X138.825 Y140.793 E.03758
G1 X136.534 Y140.466 E.03758
G1 X134.286 Y139.913 E.03758
G1 X132.106 Y139.138 E.03758
G1 X130.013 Y138.15 E.03758
G1 X128.029 Y136.958 E.03758
G1 X126.173 Y135.574 E.03759
G1 X124.465 Y134.012 E.03758
G1 X122.922 Y132.287 E.03758
G1 X121.557 Y130.417 E.03759
G1 X120.386 Y128.421 E.03758
G1 X119.42 Y126.318 E.03759
G1 X118.668 Y124.129 E.03758
G1 X118.187 Y122.082 E.03414
G1 X118.561 Y122.017 E.00616
G1 X119.031 Y124.017 E.03336
G1 X119.765 Y126.158 E.03674
G1 X120.707 Y128.215 E.03674
G1 X121.848 Y130.169 E.03675
G1 X123.178 Y132.001 E.03675
G1 X124.682 Y133.691 E.03674
G1 X126.346 Y135.224 E.03675
G1 X128.155 Y136.585 E.03674
G1 X130.089 Y137.76 E.03675
G1 X132.13 Y138.737 E.03674
G1 X134.257 Y139.507 E.03675
G1 X136.451 Y140.063 E.03675
G1 X138.689 Y140.399 E.03675
G1 X140.949 Y140.511 E.03674
G1 X143.209 Y140.399 E.03674
G1 X145.447 Y140.063 E.03675
M73 P56 R9
G1 X147.641 Y139.507 E.03675
G1 X149.768 Y138.737 E.03674
G1 X151.809 Y137.76 E.03675
G1 X153.744 Y136.585 E.03675
G1 X155.552 Y135.224 E.03674
G1 X157.216 Y133.691 E.03675
G1 X158.72 Y132.001 E.03674
G1 X160.05 Y130.169 E.03675
G1 X161.191 Y128.215 E.03675
G1 X162.134 Y126.158 E.03674
G1 X162.867 Y124.017 E.03674
G1 X163.134 Y122.882 E.01893
; OBJECT_ID: 104
; WIPE_START
M204 S6000
G1 X163.319 Y123.805 E-.35757
G1 X162.991 Y124.812 E-.40243
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.102 Y117.748 Z1.4 F42000
G1 X158.543 Y113.936 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
M73 P57 R9
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.4 F42000
G1 X144.743 Y97.086 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.06 J-13.321 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.066 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.454 J-13.449 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.111 J-16.436 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.4 F42000
G1 X159.301 Y97.086 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.4 F42000
G1 X161.531 Y105.786 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 10 start: 104,115,137,148
M624 GwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer10 end: 104,115,137,148
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.0078
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.257 J-13.376 E.06091
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01064
G2 X161.278 Y115.417 I-9.041 J-15.465 E.05035
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.0055
; LINE_WIDTH: 0.439758
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465782
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.01901
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.5117
G1 F14686.685
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474339
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.55 Y116.86 E.00881
; LINE_WIDTH: 0.437382
G1 X158.799 Y116.685 E.00515
; LINE_WIDTH: 0.472165
G1 X159.047 Y116.51 E.00558
; LINE_WIDTH: 0.506948
G1 F14830.43
G1 X159.296 Y116.336 E.00601
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472165
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420177
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X141.474 Y116.272 E.00371
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.701 Y115.794 E.01448
; LINE_WIDTH: 0.437993
G1 X141.007 Y115.983 E.00611
; LINE_WIDTH: 0.462209
G1 X141.314 Y116.172 E.00646
G1 X140.888 Y115.638 E.01226
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00981
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.159 J-13.876 E.07294
M73 P58 R9
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.137 J-17.572 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00713
G1 X142.124 Y115.192 E.26467
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.686 J-13.588 E.06694
G1 X158.271 Y117.912 E.25436
G1 X158.949 Y117.55 E.01247
G2 X161.677 Y115.603 I-9.381 J-16.023 E.05451
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00469
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.4 F42000
G1 X144.107 Y94.026 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.889 Y99.334 Z1.4 F42000
G1 X119.352 Y117.273 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.345 Y117.259 E.00028
G3 X119.308 Y117.025 I.586 J-.213 E.00416
G1 X119.308 Y104.328 E.22168
G3 X119.522 Y103.85 I.605 J-.016 E.00947
G3 X119.893 Y103.743 I.349 J.517 E.00684
G1 X132.589 Y103.743 E.22168
G1 X132.666 Y103.756 E.00136
G3 X133.137 Y104.094 I.002 J.493 E.01083
G1 X133.174 Y104.328 E.00414
G1 X133.174 Y117.025 E.22168
G3 X132.959 Y117.503 I-.605 J.016 E.00947
G3 X132.589 Y117.61 I-.349 J-.517 E.00684
G1 X119.893 Y117.61 E.22168
G3 X119.414 Y117.395 I-.016 J-.605 E.00947
G1 X119.379 Y117.326 E.00134
M204 S10000
G1 X118.97 Y117.468 F42000
G1 F6000
M204 S6000
G1 X118.932 Y117.393 E.00147
G1 X118.879 Y117.058 E.00591
G1 X118.879 Y104.295 E.22286
G1 X118.932 Y103.96 E.00591
G3 X119.525 Y103.368 I.948 J.356 E.01508
G1 X119.859 Y103.315 E.00591
G1 X132.623 Y103.315 E.22286
G1 X132.733 Y103.332 E.00195
G1 X132.957 Y103.368 E.00396
G3 X133.549 Y103.96 I-.368 J.96 E.01507
G1 X133.602 Y104.295 E.00591
G1 X133.602 Y117.058 E.22286
G1 X133.549 Y117.393 E.00591
G3 X132.957 Y117.985 I-.948 J-.356 E.01508
G1 X132.623 Y118.038 E.00591
G1 X119.859 Y118.038 E.22286
G1 X119.524 Y117.985 E.00591
G3 X119.07 Y117.645 I.356 J-.948 E.01005
G1 X119 Y117.52 E.0025
M204 S250
G1 X118.602 Y117.655 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.534 Y117.522 E.00243
G1 X118.466 Y117.073 E.00738
G1 X118.466 Y104.28 E.20772
G1 X118.534 Y103.831 E.00738
G1 X118.724 Y103.457 E.00681
G1 X119.021 Y103.16 E.00682
G1 X119.395 Y102.97 E.00681
G1 X119.844 Y102.901 E.00738
G1 X132.637 Y102.901 E.20773
G3 X132.798 Y102.924 I.009 J.518 E.00265
G1 X133.086 Y102.97 E.00475
G1 X133.46 Y103.16 E.00681
G1 X133.757 Y103.457 E.00682
G1 X133.948 Y103.831 E.00681
G1 X134.016 Y104.28 E.00738
G1 X134.016 Y117.073 E.20772
G1 X133.948 Y117.522 E.00738
G1 X133.757 Y117.896 E.00681
G1 X133.46 Y118.193 E.00682
G1 X133.086 Y118.383 E.00681
G1 X132.637 Y118.452 E.00738
G1 X119.845 Y118.452 E.20772
G1 X119.395 Y118.383 E.00738
G1 X119.021 Y118.193 E.00681
G1 X118.724 Y117.896 E.00682
G1 X118.629 Y117.709 E.00341
; WIPE_START
M204 S6000
G1 X118.534 Y117.522 E-.07963
G1 X118.466 Y117.073 E-.17274
G1 X118.466 Y115.737 E-.50763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.42 Y108.164 Z1.4 F42000
G1 X119.956 Y103.915 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42254
G1 F15000
M204 S6000
G1 X119.7 Y104.172 E.00592
G2 X119.659 Y104.356 I.263 J.155 E.00314
G1 X119.659 Y104.78 E.00692
G1 X120.344 Y104.095 E.01582
G1 X120.911 Y104.095 E.00927
G1 X119.659 Y105.347 E.02893
G1 X119.659 Y105.914 E.00927
G1 X121.478 Y104.095 E.04204
G1 X122.046 Y104.095 E.00927
G1 X119.659 Y106.481 E.05515
G1 X119.659 Y107.048 E.00927
G1 X122.613 Y104.095 E.06826
G1 X123.18 Y104.095 E.00927
G1 X119.659 Y107.616 E.08137
G1 X119.659 Y108.183 E.00927
G1 X123.747 Y104.095 E.09448
G1 X124.314 Y104.095 E.00927
G1 X119.659 Y108.75 E.10758
G1 X119.659 Y109.317 E.00927
G1 X124.882 Y104.095 E.12069
G1 X125.449 Y104.095 E.00927
G1 X119.659 Y109.884 E.1338
G1 X119.659 Y110.452 E.00927
G1 X126.016 Y104.095 E.14691
G1 X126.583 Y104.095 E.00927
G1 X119.659 Y111.019 E.16002
G1 X119.659 Y111.586 E.00927
G1 X127.15 Y104.095 E.17313
G1 X127.718 Y104.095 E.00927
G1 X119.659 Y112.153 E.18623
G1 X119.659 Y112.721 E.00927
G1 X128.285 Y104.095 E.19934
G1 X128.852 Y104.095 E.00927
G1 X119.659 Y113.288 E.21245
G1 X119.659 Y113.855 E.00927
G1 X129.419 Y104.095 E.22556
G1 X129.986 Y104.095 E.00927
G1 X119.659 Y114.422 E.23867
G1 X119.659 Y114.989 E.00927
G1 X130.554 Y104.095 E.25178
G1 X131.121 Y104.095 E.00927
G1 X119.659 Y115.557 E.26489
G1 X119.659 Y116.124 E.00927
G1 X131.688 Y104.095 E.27799
G1 X132.255 Y104.095 E.00927
G1 X119.659 Y116.691 E.2911
G2 X119.683 Y117.149 I1.456 J.153 E.00752
G2 X119.717 Y117.201 I.097 J-.026 E.00103
G1 X132.765 Y104.153 E.30154
G1 X132.779 Y104.167 E.00034
G3 X132.822 Y104.662 I-1.01 J.337 E.0082
G1 X120.227 Y117.258 E.29109
G1 X120.794 Y117.258 E.00927
G1 X132.822 Y105.229 E.27799
G1 X132.822 Y105.797 E.00927
G1 X121.361 Y117.258 E.26488
G1 X121.928 Y117.258 E.00927
G1 X132.822 Y106.364 E.25177
G1 X132.822 Y106.931 E.00927
G1 X122.495 Y117.258 E.23866
G1 X123.063 Y117.258 E.00927
G1 X132.822 Y107.498 E.22555
G1 X132.822 Y108.066 E.00927
G1 X123.63 Y117.258 E.21244
G1 X124.197 Y117.258 E.00927
G1 X132.822 Y108.633 E.19933
G1 X132.822 Y109.2 E.00927
G1 X124.764 Y117.258 E.18623
G1 X125.331 Y117.258 E.00927
G1 X132.822 Y109.767 E.17312
G1 X132.822 Y110.334 E.00927
G1 X125.899 Y117.258 E.16001
G1 X126.466 Y117.258 E.00927
G1 X132.822 Y110.902 E.1469
G1 X132.822 Y111.469 E.00927
G1 X127.033 Y117.258 E.13379
G1 X127.6 Y117.258 E.00927
G1 X132.822 Y112.036 E.12068
G1 X132.822 Y112.603 E.00927
G1 X128.168 Y117.258 E.10758
G1 X128.735 Y117.258 E.00927
G1 X132.822 Y113.17 E.09447
G1 X132.822 Y113.738 E.00927
G1 X129.302 Y117.258 E.08136
G1 X129.869 Y117.258 E.00927
G1 X132.822 Y114.305 E.06825
G1 X132.822 Y114.872 E.00927
G1 X130.436 Y117.258 E.05514
G1 X131.004 Y117.258 E.00927
G1 X132.822 Y115.439 E.04203
G1 X132.822 Y116.006 E.00927
G1 X131.571 Y117.258 E.02892
G1 X132.138 Y117.258 E.00927
G1 X132.822 Y116.574 E.01582
G1 X132.822 Y116.997 E.00692
G3 X132.781 Y117.182 I-.305 J.029 E.00315
G1 X132.526 Y117.437 E.0059
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.781 Y117.182 E-.1373
G1 X132.822 Y116.997 E-.07202
G1 X132.822 Y116.574 E-.16081
G1 X132.138 Y117.258 E-.36778
G1 X132.08 Y117.258 E-.02209
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 11/72
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S196.35
; OBJECT_ID: 104
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.152 J1.207 P1  F42000
G1 X158.543 Y113.936 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.5 F42000
G1 X144.743 Y97.086 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.06 J-13.32 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.067 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
M73 P59 R9
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.454 J-13.449 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.5 F42000
G1 X159.301 Y97.086 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.5 F42000
G1 X161.531 Y105.786 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 11 start: 104,115
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.5 F4000
            G39.3 S1
            G0 Z1.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer11 end: 104,115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.721 Y115.904 E.0067
G1 X141.398 Y115.675 E.00643
G1 X141.129 Y115.036 E.01125
G1 X141.128 Y107.439 E.12336
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I10.723 J-12.583 E.06093
G1 X158.172 Y117.514 E.25106
G1 X158.749 Y117.205 E.01064
G2 X161.278 Y115.417 I-9.036 J-15.459 E.05035
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.00551
; LINE_WIDTH: 0.439768
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465805
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.019
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.444878
G1 F15000
M204 S6000
G1 X141.832 Y116.351 E.00509
; LINE_WIDTH: 0.477745
G1 X141.539 Y116.314 E.00548
G1 X142.041 Y116.685 E.01161
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.55 Y116.86 E.00881
; LINE_WIDTH: 0.437388
G1 X158.799 Y116.685 E.00515
; LINE_WIDTH: 0.472185
G1 X159.047 Y116.51 E.00558
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X159.296 Y116.336 E.00601
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420178
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.066 Y115.987 F42000
; LINE_WIDTH: 0.52717
G1 F14237.408
M204 S6000
G1 X141.49 Y116.28 E.01062
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X140.366 Y115.01 E.08593
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.146 Y115.36 E.00304
; LINE_WIDTH: 0.439125
G1 X140.453 Y115.569 E.00631
; LINE_WIDTH: 0.477395
G1 X140.759 Y115.778 E.00689
; LINE_WIDTH: 0.515665
G1 F14568.854
G1 X141.066 Y115.987 E.00747
G1 X140.954 Y115.676 E.00665
; LINE_WIDTH: 0.477395
G1 F15000
G1 X140.842 Y115.365 E.00614
; LINE_WIDTH: 0.420869
G1 X140.731 Y115.054 E.00538
G1 X140.73 Y114.993 E.00099
G1 X140.73 Y108.19 E.1107
M204 S10000
G1 X140.606 Y106.843 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G1 X139.344 Y116.253 E.01153
G2 X142.51 Y118.311 I10.964 J-13.4 E.06144
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.138 J-17.574 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00713
G1 X142.124 Y115.192 E.26467
G1 X141.979 Y115.129 E.00257
G1 X141.925 Y114.993 E.00238
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G1 X139.595 Y115.943 E.00837
G2 X142.61 Y117.912 I10.638 J-12.991 E.0586
G1 X158.272 Y117.912 E.25436
G1 X158.949 Y117.551 E.01247
G2 X161.677 Y115.603 I-9.377 J-16.018 E.05451
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.882 Y115.539 E.00402
G1 X141.689 Y115.402 E.00386
G1 X141.527 Y114.993 E.00715
M73 P60 R9
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.5 F42000
G1 X144.107 Y94.026 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.886 Y99.331 Z1.5 F42000
G1 X119.305 Y117.288 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X119.267 Y117.049 I.601 J-.218 E.00425
G1 X119.267 Y104.304 E.22253
G3 X119.488 Y103.812 I.623 J-.015 E.00973
G3 X119.868 Y103.703 I.359 J.53 E.00702
G1 X132.613 Y103.703 E.22253
G1 X132.707 Y103.718 E.00166
G3 X133.177 Y104.065 I-.008 J.502 E.01088
G1 X133.214 Y104.304 E.00423
G1 X133.214 Y117.049 E.22253
G3 X132.993 Y117.54 I-.623 J.015 E.00973
G3 X132.613 Y117.65 I-.359 J-.53 E.00702
G1 X119.868 Y117.65 E.22253
G3 X119.377 Y117.429 I-.015 J-.623 E.00973
G3 X119.328 Y117.343 I.53 J-.359 E.00172
M204 S10000
G1 X118.921 Y117.478 F42000
G1 F6000
M204 S6000
G1 X118.892 Y117.422 E.00109
G1 X118.839 Y117.083 E.006
G1 X118.839 Y104.27 E.22371
G1 X118.892 Y103.931 E.006
G3 X119.495 Y103.328 I.983 J.38 E.01532
G1 X119.835 Y103.274 E.006
G1 X132.647 Y103.274 E.22371
G1 X132.774 Y103.294 E.00224
G1 X132.986 Y103.328 E.00375
G3 X133.589 Y103.931 I-.374 J.977 E.01533
G1 X133.643 Y104.27 E.006
G1 X133.643 Y117.083 E.22371
G1 X133.589 Y117.422 E.006
G3 X132.986 Y118.025 I-.983 J-.38 E.01532
G1 X132.647 Y118.079 E.006
G1 X119.835 Y118.079 E.22371
G1 X119.495 Y118.025 E.006
G3 X119.034 Y117.677 I.38 J-.983 E.01021
G1 X118.95 Y117.53 E.00296
M204 S250
G1 X118.552 Y117.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.494 Y117.551 E.00208
G1 X118.425 Y117.097 E.00746
G1 X118.425 Y104.256 E.20851
G1 X118.494 Y103.801 E.00746
G1 X118.687 Y103.423 E.0069
G1 X118.987 Y103.123 E.0069
G1 X119.366 Y102.93 E.0069
G1 X119.82 Y102.861 E.00746
G1 X132.661 Y102.861 E.20851
G3 X132.839 Y102.886 I.009 J.572 E.00292
G1 X133.116 Y102.93 E.00455
G1 X133.494 Y103.123 E.0069
G1 X133.795 Y103.423 E.0069
G1 X133.987 Y103.802 E.0069
G1 X134.056 Y104.256 E.00746
G1 X134.056 Y117.097 E.20851
G1 X133.987 Y117.551 E.00746
G1 X133.795 Y117.93 E.0069
G1 X133.494 Y118.23 E.0069
G1 X133.116 Y118.423 E.0069
G1 X132.661 Y118.492 E.00746
G1 X119.82 Y118.492 E.20851
G1 X119.366 Y118.423 E.00746
G1 X118.987 Y118.23 E.0069
G1 X118.687 Y117.93 E.0069
G1 X118.579 Y117.719 E.00385
; WIPE_START
M204 S6000
G1 X118.494 Y117.551 E-.07138
G1 X118.425 Y117.097 E-.17465
G1 X118.425 Y115.744 E-.51398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.439 Y116.991 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42469
G1 F15000
M204 S6000
G1 X119.705 Y117.256 E.00617
G2 X119.896 Y117.299 I.161 J-.273 E.00327
G1 X120.317 Y117.299 E.00692
G1 X119.619 Y116.6 E.01624
G1 X119.619 Y116.03 E.00937
G1 X120.888 Y117.299 E.02948
G1 X121.458 Y117.299 E.00937
G1 X119.619 Y115.459 E.04273
G1 X119.619 Y114.889 E.00937
G1 X122.028 Y117.299 E.05598
G1 X122.598 Y117.299 E.00937
G1 X119.619 Y114.319 E.06923
G1 X119.619 Y113.749 E.00937
G1 X123.169 Y117.299 E.08248
G1 X123.739 Y117.299 E.00937
G1 X119.619 Y113.178 E.09573
G1 X119.619 Y112.608 E.00937
G1 X124.309 Y117.299 E.10898
G1 X124.879 Y117.299 E.00937
G1 X119.619 Y112.038 E.12223
G1 X119.619 Y111.468 E.00937
G1 X125.45 Y117.299 E.13548
G1 X126.02 Y117.299 E.00937
G1 X119.619 Y110.897 E.14873
G1 X119.619 Y110.327 E.00937
G1 X126.59 Y117.299 E.16198
G1 X127.16 Y117.299 E.00937
G1 X119.619 Y109.757 E.17523
G1 X119.619 Y109.187 E.00937
G1 X127.731 Y117.299 E.18848
G1 X128.301 Y117.299 E.00937
G1 X119.619 Y108.616 E.20173
G1 X119.619 Y108.046 E.00937
G1 X128.871 Y117.299 E.21498
G1 X129.441 Y117.299 E.00937
G1 X119.619 Y107.476 E.22823
G1 X119.619 Y106.906 E.00937
G1 X130.012 Y117.299 E.24147
G1 X130.582 Y117.299 E.00937
G1 X119.619 Y106.335 E.25472
G1 X119.619 Y105.765 E.00937
G1 X131.152 Y117.299 E.26797
G1 X131.722 Y117.299 E.00937
G1 X119.619 Y105.195 E.28122
G1 X119.619 Y104.625 E.00937
G1 X132.293 Y117.299 E.29447
G2 X132.742 Y117.274 I.146 J-1.431 E.00743
G2 X132.8 Y117.236 I-.029 J-.108 E.00116
G1 X119.681 Y104.117 E.30482
G1 X119.698 Y104.1 E.00038
G3 X120.189 Y104.054 I.34 J.982 E.00818
G1 X132.863 Y116.728 E.29447
G1 X132.863 Y116.158 E.00937
G1 X120.759 Y104.054 E.28122
G1 X121.329 Y104.054 E.00937
G1 X132.863 Y115.588 E.26797
G1 X132.863 Y115.018 E.00937
G1 X121.9 Y104.054 E.25472
G1 X122.47 Y104.054 E.00937
G1 X132.863 Y114.447 E.24147
G1 X132.863 Y113.877 E.00937
G1 X123.04 Y104.054 E.22822
G1 X123.61 Y104.054 E.00937
G1 X132.863 Y113.307 E.21497
G1 X132.863 Y112.737 E.00937
G1 X124.181 Y104.054 E.20173
G1 X124.751 Y104.054 E.00937
G1 X132.863 Y112.166 E.18848
G1 X132.863 Y111.596 E.00937
G1 X125.321 Y104.054 E.17523
G1 X125.891 Y104.054 E.00937
G1 X132.863 Y111.026 E.16198
G1 X132.863 Y110.456 E.00937
G1 X126.462 Y104.054 E.14873
G1 X127.032 Y104.054 E.00937
G1 X132.863 Y109.885 E.13548
G1 X132.863 Y109.315 E.00937
G1 X127.602 Y104.054 E.12223
G1 X128.172 Y104.054 E.00937
G1 X132.863 Y108.745 E.10898
G1 X132.863 Y108.175 E.00937
G1 X128.743 Y104.054 E.09573
G1 X129.313 Y104.054 E.00937
G1 X132.863 Y107.604 E.08248
G1 X132.863 Y107.034 E.00937
G1 X129.883 Y104.054 E.06923
G1 X130.453 Y104.054 E.00937
G1 X132.863 Y106.464 E.05598
G1 X132.863 Y105.894 E.00937
G1 X131.024 Y104.054 E.04273
G1 X131.594 Y104.054 E.00937
G1 X132.863 Y105.323 E.02948
G1 X132.863 Y104.753 E.00937
G1 X132.164 Y104.054 E.01623
G1 X132.586 Y104.054 E.00692
G3 X132.777 Y104.097 I-.051 J.681 E.00323
G1 X133.042 Y104.362 E.00616
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.777 Y104.097 E-.14258
G1 X132.586 Y104.054 E-.07449
G1 X132.164 Y104.054 E-.16012
G1 X132.863 Y104.753 E-.37549
G1 X132.863 Y104.772 E-.00732
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 12/72
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 104
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I-.409 J1.146 P1  F42000
G1 X158.543 Y113.936 Z1.5
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.6 F42000
G1 X144.743 Y97.086 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.06 J-13.32 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.066 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.454 J-13.45 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.437 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.6 F42000
G1 X159.301 Y97.086 Z1.6
G1 Z1.2
M73 P61 R9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.6 F42000
G1 X161.531 Y105.786 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.235 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 12 start: 104,115
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer12 end: 104,115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
M73 P61 R8
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.71 Y115.899 E.00688
G1 X141.56 Y115.814 E.00281
G1 X141.241 Y115.454 E.00781
G1 X141.128 Y114.993 E.00771
G1 X141.128 Y107.439 E.12266
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I11.625 J-13.923 E.0609
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01064
G2 X161.278 Y115.417 I-9.037 J-15.459 E.05035
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.00551
; LINE_WIDTH: 0.439763
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465794
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.019
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51172
G1 F14686.085
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.443408
G1 F15000
M204 S6000
G1 X141.825 Y116.346 E.0052
; LINE_WIDTH: 0.474327
G1 X141.525 Y116.304 E.00558
G1 X142.041 Y116.685 E.01185
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.551 Y116.859 E.00882
; LINE_WIDTH: 0.437385
G1 X158.799 Y116.685 E.00514
; LINE_WIDTH: 0.472175
G1 X159.047 Y116.51 E.00557
; LINE_WIDTH: 0.506965
G1 F14829.92
G1 X159.296 Y116.336 E.006
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472175
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420178
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.314 Y116.172 F42000
; LINE_WIDTH: 0.50282
G1 F14957.619
M204 S6000
G1 X141.474 Y116.272 E.00371
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X140.366 Y115.011 E.08595
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.701 Y115.794 E.01447
; LINE_WIDTH: 0.437988
G1 X141.007 Y115.983 E.00611
; LINE_WIDTH: 0.462197
G1 X141.314 Y116.172 E.00646
G1 X140.888 Y115.638 E.01226
; LINE_WIDTH: 0.41999
G1 X140.731 Y115.055 E.00981
G1 X140.73 Y114.993 E.00101
G1 X140.73 Y108.19 E.11046
M204 S10000
G1 X140.606 Y106.843 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G2 X142.51 Y118.311 I12.159 J-13.876 E.07294
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.138 J-17.573 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00712
G1 X142.124 Y115.192 E.26467
G1 X142.011 Y115.157 E.00192
G1 X141.925 Y114.993 E.00301
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420078
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G2 X142.61 Y117.912 I11.687 J-13.589 E.06694
G1 X158.271 Y117.912 E.25436
G2 X160.968 Y116.197 I-8.941 J-17.03 E.05196
G1 X161.677 Y115.603 E.01502
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.876 Y115.537 E.00413
G1 X141.786 Y115.485 E.00168
G1 X141.594 Y115.269 E.00469
G1 X141.527 Y114.993 E.00463
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.6 F42000
G1 X144.107 Y94.026 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.885 Y99.329 Z1.6 F42000
G1 X119.265 Y117.317 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.227 Y117.073 E.00431
G1 X119.227 Y104.28 E.22338
G3 X119.455 Y103.775 I.641 J-.014 E.01
G1 X119.6 Y103.701 E.00285
G1 X119.844 Y103.662 E.00431
G1 X132.638 Y103.662 E.22338
G1 X132.748 Y103.68 E.00195
G3 X133.216 Y104.036 I-.021 J.514 E.01093
G1 X133.255 Y104.28 E.00431
G1 X133.255 Y117.073 E.22338
G3 X133.027 Y117.578 I-.641 J.014 E.01
G1 X132.882 Y117.652 E.00285
G1 X132.638 Y117.691 E.00431
G1 X119.844 Y117.691 E.22338
G3 X119.339 Y117.463 I-.014 J-.641 E.01
G1 X119.292 Y117.371 E.0018
M204 S10000
G1 X118.871 Y117.487 F42000
G1 F6000
M204 S6000
G1 X118.853 Y117.451 E.00071
G1 X118.798 Y117.107 E.00609
G1 X118.798 Y104.246 E.22456
G1 X118.853 Y103.902 E.00609
G3 X119.466 Y103.288 I.908 J.295 E.01572
G1 X119.81 Y103.234 E.00609
G1 X132.671 Y103.234 E.22456
M73 P62 R8
G1 X132.815 Y103.257 E.00254
G1 X133.016 Y103.288 E.00355
G3 X133.629 Y103.902 I-.381 J.994 E.0156
G1 X133.683 Y104.246 E.00609
G1 X133.683 Y117.107 E.22456
G1 X133.629 Y117.451 E.00609
G3 X133.016 Y118.065 I-.908 J-.295 E.01572
G1 X132.671 Y118.119 E.00609
G1 X119.81 Y118.119 E.22456
G1 X119.466 Y118.065 E.00609
G3 X118.988 Y117.718 I.295 J-.908 E.01048
G1 X118.898 Y117.541 E.00347
M204 S250
G1 X118.502 Y117.675 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.454 Y117.581 E.00172
G1 X118.385 Y117.121 E.00754
G1 X118.385 Y104.232 E.2093
G1 X118.454 Y103.772 E.00754
G1 X118.65 Y103.389 E.00698
G1 X118.953 Y103.085 E.00698
G1 X119.336 Y102.89 E.00698
G1 X119.796 Y102.82 E.00754
G1 X132.686 Y102.82 E.2093
G3 X132.88 Y102.848 I.009 J.626 E.0032
G1 X133.145 Y102.89 E.00436
G1 X133.528 Y103.085 E.00698
G1 X133.832 Y103.389 E.00698
G1 X134.027 Y103.772 E.00698
G1 X134.097 Y104.232 E.00754
G1 X134.097 Y117.121 E.2093
G1 X134.027 Y117.581 E.00754
G1 X133.832 Y117.964 E.00698
G1 X133.528 Y118.268 E.00698
G1 X133.145 Y118.463 E.00698
G1 X132.686 Y118.533 E.00754
G1 X119.796 Y118.533 E.2093
G1 X119.336 Y118.463 E.00754
G1 X118.953 Y118.268 E.00698
G1 X118.65 Y117.964 E.00698
G1 X118.53 Y117.729 E.00429
; WIPE_START
M204 S6000
G1 X118.454 Y117.581 E-.06304
G1 X118.385 Y117.121 E-.17656
G1 X118.385 Y115.752 E-.52039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.346 Y108.18 Z1.6 F42000
G1 X119.898 Y103.834 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42683
G1 F15000
M204 S6000
G1 X119.604 Y104.146 E.00707
G2 X119.578 Y104.727 I1.821 J.372 E.00966
G1 X120.291 Y104.014 E.01666
G1 X120.865 Y104.014 E.00947
G1 X119.578 Y105.3 E.03005
G1 X119.578 Y105.874 E.00947
G1 X121.438 Y104.014 E.04344
G1 X122.011 Y104.014 E.00947
G1 X119.578 Y106.447 E.05684
G1 X119.578 Y107.02 E.00947
G1 X122.585 Y104.014 E.07023
G1 X123.158 Y104.014 E.00947
G1 X119.578 Y107.594 E.08362
G1 X119.578 Y108.167 E.00947
G1 X123.731 Y104.014 E.09701
G1 X124.304 Y104.014 E.00947
G1 X119.578 Y108.74 E.1104
G1 X119.578 Y109.313 E.00947
G1 X124.878 Y104.014 E.12379
G1 X125.451 Y104.014 E.00947
G1 X119.578 Y109.887 E.13718
G1 X119.578 Y110.46 E.00947
G1 X126.024 Y104.014 E.15057
G1 X126.598 Y104.014 E.00947
G1 X119.578 Y111.033 E.16396
G1 X119.578 Y111.607 E.00947
G1 X127.171 Y104.014 E.17735
G1 X127.744 Y104.014 E.00947
G1 X119.578 Y112.18 E.19074
G1 X119.578 Y112.753 E.00947
G1 X128.317 Y104.014 E.20413
G1 X128.891 Y104.014 E.00947
G1 X119.578 Y113.326 E.21752
G1 X119.578 Y113.9 E.00947
G1 X129.464 Y104.014 E.23091
G1 X130.037 Y104.014 E.00947
G1 X119.578 Y114.473 E.2443
G1 X119.578 Y115.046 E.00947
G1 X130.611 Y104.014 E.25769
G1 X131.184 Y104.014 E.00947
G1 X119.578 Y115.62 E.27108
G1 X119.578 Y116.193 E.00947
G1 X131.757 Y104.014 E.28447
G1 X132.33 Y104.014 E.00947
G1 X119.578 Y116.766 E.29786
G2 X119.604 Y117.207 I1.405 J.14 E.00733
G2 X119.646 Y117.272 I.12 J-.032 E.00129
G1 X132.836 Y104.081 E.3081
G1 X132.854 Y104.1 E.00043
G3 X132.903 Y104.587 I-.96 J.343 E.00818
G1 X120.152 Y117.339 E.29785
G1 X120.725 Y117.339 E.00947
G1 X132.903 Y105.161 E.28446
G1 X132.903 Y105.734 E.00947
G1 X121.298 Y117.339 E.27107
G1 X121.871 Y117.339 E.00947
G1 X132.903 Y106.307 E.25768
G1 X132.903 Y106.88 E.00947
G1 X122.445 Y117.339 E.24429
G1 X123.018 Y117.339 E.00947
G1 X132.903 Y107.454 E.2309
G1 X132.903 Y108.027 E.00947
G1 X123.591 Y117.339 E.21751
G1 X124.164 Y117.339 E.00947
G1 X132.903 Y108.6 E.20412
G1 X132.903 Y109.173 E.00947
G1 X124.738 Y117.339 E.19073
G1 X125.311 Y117.339 E.00947
G1 X132.903 Y109.747 E.17734
G1 X132.903 Y110.32 E.00947
G1 X125.884 Y117.339 E.16395
G1 X126.458 Y117.339 E.00947
G1 X132.903 Y110.893 E.15056
G1 X132.903 Y111.467 E.00947
G1 X127.031 Y117.339 E.13717
G1 X127.604 Y117.339 E.00947
G1 X132.903 Y112.04 E.12378
G1 X132.903 Y112.613 E.00947
G1 X128.177 Y117.339 E.11039
G1 X128.751 Y117.339 E.00947
G1 X132.903 Y113.186 E.097
G1 X132.903 Y113.76 E.00947
G1 X129.324 Y117.339 E.08361
G1 X129.897 Y117.339 E.00947
G1 X132.903 Y114.333 E.07022
G1 X132.903 Y114.906 E.00947
G1 X130.471 Y117.339 E.05683
G1 X131.044 Y117.339 E.00947
G1 X132.903 Y115.48 E.04344
G1 X132.903 Y116.053 E.00947
G1 X131.617 Y117.339 E.03005
G1 X132.19 Y117.339 E.00947
G1 X132.903 Y116.626 E.01666
G1 X132.903 Y117.046 E.00693
G3 X132.859 Y117.243 I-.327 J.031 E.0034
G1 X132.584 Y117.518 E.00643
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X132.859 Y117.243 E-.14783
G1 X132.903 Y117.046 E-.07703
G1 X132.903 Y116.626 E-.15938
G1 X132.204 Y117.325 E-.37576
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 13/72
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 104
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.155 J1.207 P1  F42000
G1 X158.543 Y113.936 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.7 F42000
G1 X144.743 Y97.086 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.062 J-13.323 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.046 J-16.067 E.08518
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.454 J-13.449 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.112 J-16.436 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.7 F42000
G1 X159.301 Y97.086 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.7 F42000
G1 X161.531 Y105.786 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 13 start: 104,115
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.7 F4000
            G39.3 S1
            G0 Z1.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer13 end: 104,115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.7 F42000
G1 Z1.3
M73 P63 R8
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.721 Y115.904 E.0067
G1 X141.398 Y115.675 E.00643
G1 X141.129 Y115.036 E.01125
G1 X141.128 Y107.439 E.12336
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I10.725 J-12.585 E.06093
G1 X158.172 Y117.514 E.25106
G1 X158.75 Y117.205 E.01064
G2 X161.278 Y115.417 I-9.039 J-15.462 E.05035
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.0055
; LINE_WIDTH: 0.439768
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465805
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.01901
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35056
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.2014
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.444878
G1 F15000
M204 S6000
G1 X141.832 Y116.351 E.00509
; LINE_WIDTH: 0.477745
G1 X141.539 Y116.314 E.00548
G1 X142.041 Y116.685 E.01161
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.55 Y116.86 E.00881
; LINE_WIDTH: 0.437388
G1 X158.799 Y116.685 E.00515
; LINE_WIDTH: 0.472185
G1 X159.047 Y116.51 E.00558
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X159.296 Y116.336 E.00601
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420178
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.066 Y115.987 F42000
; LINE_WIDTH: 0.52717
G1 F14237.408
M204 S6000
G1 X141.49 Y116.28 E.01062
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X140.366 Y115.01 E.08593
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.146 Y115.36 E.00304
; LINE_WIDTH: 0.439125
G1 X140.453 Y115.569 E.00631
; LINE_WIDTH: 0.477395
G1 X140.759 Y115.778 E.00689
; LINE_WIDTH: 0.515665
G1 F14568.854
G1 X141.066 Y115.987 E.00747
G1 X140.954 Y115.676 E.00665
; LINE_WIDTH: 0.477395
G1 F15000
G1 X140.842 Y115.365 E.00614
; LINE_WIDTH: 0.420869
G1 X140.731 Y115.054 E.00538
G1 X140.73 Y114.993 E.00099
G1 X140.73 Y108.19 E.1107
M204 S10000
G1 X140.606 Y106.843 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G1 X139.344 Y116.253 E.01153
G2 X142.51 Y118.311 I10.964 J-13.4 E.06144
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.138 J-17.574 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00713
G1 X142.124 Y115.192 E.26467
G1 X141.979 Y115.129 E.00257
G1 X141.925 Y114.993 E.00238
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G1 X139.595 Y115.943 E.00837
G2 X142.61 Y117.912 I10.638 J-12.991 E.0586
G1 X158.271 Y117.912 E.25436
G2 X160.968 Y116.197 I-8.941 J-17.029 E.05196
G1 X161.677 Y115.603 E.01502
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.882 Y115.539 E.00402
G1 X141.689 Y115.402 E.00386
G1 X141.527 Y114.993 E.00715
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.7 F42000
G1 X144.107 Y94.026 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.884 Y99.328 Z1.7 F42000
G1 X119.225 Y117.347 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X119.186 Y117.098 I.632 J-.228 E.00443
G1 X119.186 Y104.255 E.22423
G3 X119.421 Y103.738 I.659 J-.013 E.01026
G3 X119.82 Y103.622 I.378 J.556 E.00737
G1 X132.662 Y103.622 E.22423
G1 X132.789 Y103.642 E.00225
G3 X133.256 Y104.006 I-.034 J.526 E.01098
G1 X133.295 Y104.255 E.0044
G1 X133.295 Y117.098 E.22423
G3 X133.061 Y117.615 I-.659 J.013 E.01026
G3 X132.662 Y117.731 I-.378 J-.556 E.00737
G1 X119.82 Y117.731 E.22423
G3 X119.302 Y117.496 I-.013 J-.659 E.01026
G3 X119.248 Y117.402 I.556 J-.378 E.0019
M204 S10000
G1 X118.821 Y117.497 F42000
G1 F6000
M204 S6000
G1 X118.813 Y117.481 E.00032
G1 X118.758 Y117.131 E.00618
G1 X118.758 Y104.222 E.22541
G1 X118.813 Y103.872 E.00618
G3 X119.437 Y103.249 I1.011 J.387 E.01586
G1 X119.786 Y103.193 E.00618
G1 X132.696 Y103.193 E.22541
G1 X132.856 Y103.219 E.00284
G1 X133.045 Y103.249 E.00334
G3 X133.669 Y103.872 I-.387 J1.011 E.01586
G1 X133.724 Y104.222 E.00618
G1 X133.724 Y117.131 E.22541
G1 X133.669 Y117.481 E.00618
G3 X133.045 Y118.104 I-1.011 J-.387 E.01586
G1 X132.696 Y118.16 E.00618
G1 X119.786 Y118.16 E.22541
G1 X119.436 Y118.104 E.00618
G3 X118.959 Y117.745 I.387 J-1.011 E.01057
G1 X118.85 Y117.549 E.00391
M204 S250
G1 X118.453 Y117.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.415 Y117.61 E.00136
G1 X118.344 Y117.146 E.00763
G1 X118.344 Y104.207 E.21009
G1 X118.415 Y103.743 E.00763
G1 X118.612 Y103.355 E.00706
G1 X118.92 Y103.048 E.00706
G1 X119.307 Y102.85 E.00706
G1 X119.772 Y102.78 E.00763
G1 X132.71 Y102.78 E.21009
G3 X132.921 Y102.81 I.009 J.681 E.00347
G1 X133.174 Y102.85 E.00417
G1 X133.562 Y103.048 E.00706
G1 X133.869 Y103.355 E.00706
G1 X134.067 Y103.743 E.00706
G1 X134.138 Y104.207 E.00763
G1 X134.138 Y117.146 E.21009
G1 X134.067 Y117.61 E.00763
G1 X133.869 Y117.998 E.00706
G1 X133.562 Y118.305 E.00706
G1 X133.174 Y118.503 E.00706
G1 X132.71 Y118.573 E.00763
G1 X119.772 Y118.573 E.21009
G1 X119.307 Y118.503 E.00763
G1 X118.92 Y118.305 E.00706
G1 X118.612 Y117.998 E.00706
G1 X118.48 Y117.738 E.00473
; WIPE_START
M204 S6000
G1 X118.415 Y117.61 E-.05462
G1 X118.344 Y117.146 E-.1785
G1 X118.344 Y115.759 E-.52689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.862 Y117.559 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42049
G1 F15000
M204 S6000
G1 X119.589 Y117.286 E.00627
G1 X119.564 Y117.237 E.0009
G3 X119.538 Y116.67 I1.775 J-.367 E.00926
G1 X120.247 Y117.38 E.01631
G1 X120.811 Y117.38 E.00917
G1 X119.538 Y116.106 E.02929
G1 X119.538 Y115.542 E.00917
G1 X121.376 Y117.38 E.04226
G1 X121.94 Y117.38 E.00917
G1 X119.538 Y114.977 E.05524
G1 X119.538 Y114.413 E.00917
G1 X122.504 Y117.38 E.06821
G1 X123.069 Y117.38 E.00917
G1 X119.538 Y113.849 E.08119
G1 X119.538 Y113.284 E.00917
G1 X123.633 Y117.38 E.09416
G1 X124.197 Y117.38 E.00917
G1 X119.538 Y112.72 E.10714
G1 X119.538 Y112.156 E.00917
G1 X124.762 Y117.38 E.12011
M73 P64 R8
G1 X125.326 Y117.38 E.00917
G1 X119.538 Y111.591 E.13309
G1 X119.538 Y111.027 E.00917
G1 X125.89 Y117.38 E.14606
G1 X126.454 Y117.38 E.00917
G1 X119.538 Y110.463 E.15904
G1 X119.538 Y109.898 E.00917
G1 X127.019 Y117.38 E.17201
G1 X127.583 Y117.38 E.00917
G1 X119.538 Y109.334 E.18499
G1 X119.538 Y108.77 E.00917
G1 X128.147 Y117.38 E.19796
G1 X128.712 Y117.38 E.00917
G1 X119.538 Y108.206 E.21093
G1 X119.538 Y107.641 E.00917
G1 X129.276 Y117.38 E.22391
G1 X129.84 Y117.38 E.00917
G1 X119.538 Y107.077 E.23688
G1 X119.538 Y106.513 E.00917
G1 X130.405 Y117.38 E.24986
G1 X130.969 Y117.38 E.00917
G1 X119.538 Y105.948 E.26283
G1 X119.538 Y105.384 E.00917
G1 X131.533 Y117.38 E.27581
G1 X132.098 Y117.38 E.00917
G1 X119.538 Y104.82 E.28878
G1 X119.541 Y104.259 E.00911
G1 X132.658 Y117.376 E.30158
G2 X132.94 Y117.094 I.034 J-.248 E.0075
G1 X119.824 Y103.977 E.30158
G1 X120.384 Y103.973 E.00911
G1 X132.944 Y116.533 E.28878
G1 X132.944 Y115.969 E.00917
G1 X120.948 Y103.973 E.27581
G1 X121.513 Y103.973 E.00917
G1 X132.944 Y115.405 E.26283
G1 X132.944 Y114.84 E.00917
G1 X122.077 Y103.973 E.24986
G1 X122.641 Y103.973 E.00917
G1 X132.944 Y114.276 E.23688
G1 X132.944 Y113.712 E.00917
G1 X123.206 Y103.973 E.22391
G1 X123.77 Y103.973 E.00917
G1 X132.944 Y113.147 E.21093
G1 X132.944 Y112.583 E.00917
G1 X124.334 Y103.973 E.19796
G1 X124.899 Y103.973 E.00917
G1 X132.944 Y112.019 E.18498
G1 X132.944 Y111.454 E.00917
G1 X125.463 Y103.973 E.17201
G1 X126.027 Y103.973 E.00917
G1 X132.944 Y110.89 E.15903
G1 X132.944 Y110.326 E.00917
G1 X126.592 Y103.973 E.14606
G1 X127.156 Y103.973 E.00917
G1 X132.944 Y109.761 E.13308
G1 X132.944 Y109.197 E.00917
G1 X127.72 Y103.973 E.12011
G1 X128.284 Y103.973 E.00917
G1 X132.944 Y108.633 E.10713
G1 X132.944 Y108.068 E.00917
G1 X128.849 Y103.973 E.09416
G1 X129.413 Y103.973 E.00917
G1 X132.944 Y107.504 E.08118
G1 X132.944 Y106.94 E.00917
G1 X129.977 Y103.973 E.06821
G1 X130.542 Y103.973 E.00917
G1 X132.944 Y106.376 E.05523
G1 X132.944 Y105.811 E.00917
G1 X131.106 Y103.973 E.04226
G1 X131.67 Y103.973 E.00917
G1 X132.944 Y105.247 E.02928
G1 X132.944 Y104.683 E.00917
G1 X132.235 Y103.973 E.01631
G1 X132.634 Y103.973 E.0065
G3 X132.851 Y104.025 I-.022 J.572 E.00364
G1 X133.123 Y104.298 E.00627
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.851 Y104.025 E-.1465
G1 X132.801 Y104 E-.02121
G1 X132.634 Y103.973 E-.06415
G1 X132.235 Y103.973 E-.15186
G1 X132.935 Y104.673 E-.37629
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 14/72
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 104
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I-.414 J1.144 P1  F42000
G1 X158.543 Y113.936 Z1.7
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.543 Y114.779 E.0147
G1 X142.339 Y114.779 E.28293
G1 X142.339 Y98.574 E.28293
G1 X158.543 Y98.574 E.28293
G1 X158.543 Y113.876 E.26718
M204 S10000
G1 X158.114 Y113.936 F42000
G1 F6000
M204 S6000
G1 X158.114 Y114.35 E.00722
G1 X142.767 Y114.35 E.26796
G1 X142.767 Y99.003 E.26796
G1 X158.114 Y99.003 E.26796
G1 X158.114 Y113.876 E.2597
M204 S250
G1 X157.701 Y113.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.531 Y107.492 Z1.8 F42000
G1 X144.743 Y97.086 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X144.743 Y94.629 E.04292
G1 X156.139 Y94.629 E.19898
G1 X156.139 Y97.929 E.05762
G1 X160.143 Y97.929 E.06991
G1 X160.143 Y94.629 E.05762
G1 X162.489 Y94.629 E.04096
G1 X162.489 Y102.724 E.14136
G1 X160.689 Y102.724 E.03143
G1 X160.689 Y106.629 E.06817
G1 X162.489 Y106.629 E.03143
G1 X162.489 Y115.978 E.16325
G3 X158.475 Y118.724 I-12.059 J-13.318 E.08518
G1 X142.407 Y118.724 E.28056
G3 X138.393 Y115.978 I8.078 J-16.113 E.08517
G1 X138.393 Y106.629 E.16325
G1 X140.193 Y106.629 E.03143
G1 X140.193 Y102.724 E.06817
G1 X138.393 Y102.724 E.03143
G1 X138.393 Y94.629 E.14136
G1 X140.739 Y94.629 E.04096
G1 X140.739 Y97.929 E.05762
G1 X144.743 Y97.929 E.06991
G1 X144.743 Y97.146 E.01365
M204 S10000
G1 X144.314 Y97.086 F42000
G1 F6000
M204 S6000
G1 X144.314 Y94.2 E.0504
G1 X156.567 Y94.2 E.21394
G1 X156.567 Y97.5 E.05762
G1 X159.714 Y97.5 E.05495
G1 X159.714 Y94.2 E.05762
G1 X162.917 Y94.2 E.05592
G1 X162.917 Y103.153 E.15632
G1 X161.117 Y103.153 E.03143
G1 X161.117 Y106.2 E.0532
G1 X162.917 Y106.2 E.03143
G1 X162.917 Y116.165 E.174
G3 X158.575 Y119.153 I-12.453 J-13.449 E.09234
G1 X142.306 Y119.153 E.28407
G3 X137.964 Y116.165 I8.139 J-16.476 E.09234
G1 X137.964 Y106.2 E.174
G1 X139.764 Y106.2 E.03143
G1 X139.764 Y103.153 E.0532
G1 X137.964 Y103.153 E.03143
G1 X137.964 Y94.2 E.15632
G1 X141.167 Y94.2 E.05592
G1 X141.167 Y97.5 E.05762
G1 X144.314 Y97.5 E.05495
G1 X144.314 Y97.146 E.00617
M204 S250
G1 X143.901 Y97.086 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.8 F42000
G1 X159.301 Y97.086 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.8 F42000
G1 X161.531 Y105.786 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.67 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.261 J-16.927 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 14 start: 104,115
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer14 end: 104,115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X158.757 Y98.251 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X155.925 Y98.251 E.02508
; WIPE_START
G1 X157.925 Y98.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.774 Y94.026 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.316 Y95.801 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X161.311 Y98.25 E.03228
M204 S10000
G1 X160.516 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X160.516 Y100.691 E.01069
M204 S10000
G1 X160.152 Y101.223 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.516 Y101.115 E.00616
G1 X160.88 Y101.115 E.00591
G1 X160.88 Y99.363 E.02845
G1 X160.483 Y99.532 E.007
G1 X160.152 Y99.538 E.00538
G1 X160.152 Y101.163 E.02639
M204 S10000
G1 X159.753 Y101.96 F42000
G1 F15000
M204 S6000
G1 X159.877 Y101.713 E.00447
G1 X160.474 Y101.514 E.01023
G1 X161.278 Y101.514 E.01305
G1 X161.278 Y99.019 E.04052
; LINE_WIDTH: 0.404798
G1 X161.293 Y98.664 E.00554
; LINE_WIDTH: 0.384284
G1 X161.308 Y98.31 E.00524
M73 P65 R8
G1 X161.009 Y98.896 E.00973
; LINE_WIDTH: 0.41999
G1 X160.447 Y99.135 E.00993
G3 X159.785 Y99.139 I-.63 J-48.747 E.01075
G1 X159.753 Y99.235 E.00164
G1 X159.753 Y101.9 E.04327
M204 S10000
G1 X159.753 Y107.439 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X159.753 Y114.993 E.12266
G1 X159.724 Y115.233 E.00393
G1 X159.341 Y115.8 E.01111
G1 X159.128 Y115.918 E.00395
G1 X158.757 Y115.989 E.00613
G1 X142.124 Y115.989 E.27007
G1 X141.721 Y115.904 E.0067
G1 X141.398 Y115.674 E.00644
G1 X141.129 Y115.036 E.01124
G1 X141.128 Y107.439 E.12336
G1 X141.005 Y107.64 E.00383
G1 X140.407 Y107.839 E.01023
G1 X139.603 Y107.839 E.01305
G1 X139.603 Y115.424 E.12315
G2 X142.71 Y117.514 I10.725 J-12.585 E.06093
G1 X158.172 Y117.514 E.25106
G1 X158.749 Y117.205 E.01064
G2 X161.278 Y115.417 I-9.035 J-15.457 E.05035
G1 X161.278 Y107.839 E.12304
G1 X160.474 Y107.839 E.01305
G1 X159.877 Y107.64 E.01023
G1 X159.785 Y107.49 E.00285
M204 S10000
G1 X160.152 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.152 Y114.993 E.11143
G1 X160.111 Y115.329 E.0055
; LINE_WIDTH: 0.439773
G1 X159.854 Y115.742 E.00829
; LINE_WIDTH: 0.465817
G1 X159.598 Y116.155 E.0088
G1 X160.471 Y115.573 E.01901
; LINE_WIDTH: 0.41999
G1 X160.88 Y115.231 E.00865
G1 X160.88 Y108.238 E.11355
G1 X160.474 Y108.238 E.00658
G1 X160.209 Y108.149 E.00455
M204 S10000
G1 X160.515 Y115.061 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X160.516 Y108.661 E.08581
M204 S10000
G1 X159.296 Y116.336 F42000
; LINE_WIDTH: 0.51172
G1 F14686.085
M204 S6000
G1 X159.546 Y116.186 E.00583
M204 S10000
G1 X142.901 Y116.752 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X157.921 Y116.752 E.20141
M204 S10000
G1 X142.124 Y116.388 F42000
; LINE_WIDTH: 0.444873
G1 F15000
M204 S6000
G1 X141.832 Y116.351 E.00509
; LINE_WIDTH: 0.477734
G1 X141.539 Y116.314 E.00548
G1 X142.041 Y116.685 E.01162
; LINE_WIDTH: 0.41999
G1 X142.729 Y117.072 E.01281
G1 X142.901 Y117.115 E.00287
G1 X158.072 Y117.115 E.24634
G1 X158.55 Y116.86 E.00881
; LINE_WIDTH: 0.437378
G1 X158.799 Y116.685 E.00515
; LINE_WIDTH: 0.472155
G1 X159.047 Y116.51 E.00558
; LINE_WIDTH: 0.506932
G1 F14830.937
G1 X159.296 Y116.336 E.00601
G1 X159.116 Y116.353 E.00357
; LINE_WIDTH: 0.472155
G1 F15000
G1 X158.937 Y116.37 E.00331
; LINE_WIDTH: 0.420177
G1 X158.757 Y116.388 E.00293
G1 X142.184 Y116.388 E.26923
M204 S10000
G1 X141.065 Y115.986 F42000
; LINE_WIDTH: 0.52726
G1 F14234.875
M204 S6000
G1 X141.49 Y116.28 E.01064
M204 S10000
G1 X140.366 Y108.601 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X140.366 Y115.01 E.08593
M204 S10000
G1 X140.73 Y108.13 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.366 Y108.238 E.00616
G1 X140.002 Y108.238 E.00591
G1 X140.002 Y115.241 E.11372
G1 X140.146 Y115.36 E.00304
; LINE_WIDTH: 0.439158
G1 X140.452 Y115.569 E.00631
; LINE_WIDTH: 0.477495
G1 X140.759 Y115.778 E.00689
; LINE_WIDTH: 0.515832
G1 F14563.942
G1 X141.065 Y115.986 E.00747
G1 X140.954 Y115.676 E.00665
; LINE_WIDTH: 0.477495
G1 F15000
G1 X140.842 Y115.365 E.00613
; LINE_WIDTH: 0.42087
G1 X140.731 Y115.054 E.00537
G1 X140.73 Y114.993 E.00099
G1 X140.73 Y108.19 E.1107
M204 S10000
G1 X140.606 Y106.843 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X140.527 Y107.002 E.00289
G1 X140.366 Y107.042 E.00269
G1 X138.806 Y107.042 E.02532
G1 X138.806 Y115.789 E.14203
G1 X139.344 Y116.252 E.01153
G2 X142.51 Y118.311 I10.966 J-13.402 E.06144
G1 X158.371 Y118.311 E.25755
G2 X161.213 Y116.512 I-9.141 J-17.577 E.05468
G1 X162.075 Y115.789 E.01827
G1 X162.075 Y107.042 E.14203
G1 X160.474 Y107.042 E.02599
G1 X160.355 Y107.002 E.00205
G1 X160.275 Y106.843 E.00289
G1 X160.275 Y102.51 E.07035
G1 X160.355 Y102.351 E.00289
G1 X160.516 Y102.311 E.00269
G1 X162.075 Y102.311 E.02532
G1 X162.075 Y95.042 E.11803
G1 X160.556 Y95.042 E.02466
G1 X160.556 Y98.143 E.05035
G1 X160.488 Y98.293 E.00269
G1 X160.357 Y98.342 E.00226
G1 X159.171 Y98.342 E.01927
G1 X159.171 Y98.585 E.00395
G1 X159.131 Y98.704 E.00203
G1 X158.956 Y98.799 E.00324
G1 X158.956 Y114.993 E.26294
G1 X158.862 Y115.162 E.00315
G1 X158.424 Y115.192 E.00713
G1 X142.124 Y115.192 E.26467
G1 X141.979 Y115.129 E.00257
G1 X141.925 Y114.993 E.00238
G1 X141.925 Y98.784 E.26318
G1 X141.75 Y98.704 E.00313
G1 X141.711 Y98.585 E.00203
G1 X141.711 Y98.342 E.00395
G1 X140.524 Y98.342 E.01927
G1 X140.394 Y98.293 E.00226
G1 X140.325 Y98.143 E.00269
G1 X140.325 Y95.042 E.05035
G1 X138.806 Y95.042 E.02466
G1 X138.806 Y102.311 E.11803
G1 X140.407 Y102.311 E.02599
G1 X140.527 Y102.351 E.00205
G1 X140.606 Y102.51 E.00289
G1 X140.606 Y106.783 E.06938
M204 S10000
G1 X141.496 Y106.843 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X141.496 Y102.51 E.08123
; LINE_WIDTH: 0.466205
G1 X141.511 Y102.081 E.00778
; LINE_WIDTH: 0.420388
G1 X141.527 Y101.651 E.00698
G1 X141.527 Y98.99 E.04326
G1 X141.43 Y98.941 E.00176
G1 X141.364 Y98.741 E.00343
G1 X140.524 Y98.741 E.01364
G1 X140.133 Y98.595 E.00679
G1 X139.936 Y98.246 E.00651
G1 X139.927 Y98.143 E.00169
G1 X139.927 Y95.441 E.04392
G1 X139.205 Y95.441 E.01173
G1 X139.205 Y101.912 E.10519
G1 X140.407 Y101.912 E.01954
G1 X140.766 Y102.032 E.00615
; LINE_WIDTH: 0.435395
G1 X140.901 Y102.271 E.00463
; LINE_WIDTH: 0.480789
G1 X141.036 Y102.51 E.00514
G1 X141.029 Y106.952 E.08313
; LINE_WIDTH: 0.47108
G1 X140.898 Y107.136 E.00415
; LINE_WIDTH: 0.420079
G1 X140.766 Y107.321 E.00368
G1 X140.366 Y107.441 E.00678
G1 X139.205 Y107.441 E.01885
G1 X139.205 Y115.606 E.13262
G1 X139.595 Y115.943 E.00837
G2 X142.61 Y117.912 I10.639 J-12.993 E.0586
G1 X158.271 Y117.912 E.25436
G1 X158.949 Y117.551 E.01247
G2 X161.677 Y115.603 I-9.375 J-16.015 E.05451
G1 X161.677 Y107.441 E.13256
G1 X160.474 Y107.441 E.01953
G1 X160.116 Y107.321 E.00614
; LINE_WIDTH: 0.437023
G1 X159.984 Y107.136 E.00384
; LINE_WIDTH: 0.481175
G1 X159.852 Y106.952 E.00425
G1 X159.846 Y106.843 E.00205
G1 X159.846 Y102.51 E.08115
; LINE_WIDTH: 0.466205
G1 X159.981 Y102.271 E.00498
; LINE_WIDTH: 0.420247
G1 X160.116 Y102.032 E.00446
G1 X160.516 Y101.912 E.00678
G1 X161.677 Y101.912 E.01886
G1 X161.677 Y95.441 E.10515
G1 X160.955 Y95.441 E.01173
G1 X160.955 Y98.143 E.04391
G1 X160.946 Y98.246 E.00168
G1 X160.749 Y98.595 E.00651
G1 X160.357 Y98.741 E.00679
G1 X159.518 Y98.741 E.01364
G1 X159.452 Y98.941 E.00343
G1 X159.355 Y98.99 E.00176
G1 X159.355 Y101.651 E.04325
; LINE_WIDTH: 0.435395
G1 X159.37 Y102.081 E.00725
; LINE_WIDTH: 0.48022
G1 X159.386 Y102.51 E.00803
G1 X159.386 Y106.843 E.08098
; LINE_WIDTH: 0.466205
G1 X159.37 Y107.272 E.00778
; LINE_WIDTH: 0.420188
G1 X159.355 Y107.701 E.00698
G1 X159.355 Y114.993 E.11845
G1 X159.337 Y115.137 E.00236
G1 X159.072 Y115.501 E.00731
G1 X158.757 Y115.591 E.00532
G1 X142.124 Y115.591 E.27021
G1 X141.882 Y115.539 E.00402
G1 X141.688 Y115.402 E.00386
G1 X141.527 Y114.993 E.00714
G1 X141.527 Y107.701 E.11845
; LINE_WIDTH: 0.43702
G1 X141.51 Y107.347 E.00601
; LINE_WIDTH: 0.473855
G3 X141.494 Y106.903 I3.17 J-.33 E.0082
M204 S10000
G1 X141.128 Y101.96 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X141.128 Y99.187 E.04501
G1 X141.032 Y99.139 E.00174
G3 X140.434 Y99.135 I-.254 J-6.622 E.00971
G1 X139.872 Y98.896 E.00992
; LINE_WIDTH: 0.404798
G1 X139.722 Y98.603 E.00514
; LINE_WIDTH: 0.384792
G1 X139.573 Y98.31 E.00487
G1 X139.603 Y99.019 E.0105
; LINE_WIDTH: 0.41999
G1 X139.603 Y101.514 E.04052
G1 X140.407 Y101.514 E.01305
M73 P65 R7
G1 X141.005 Y101.713 E.01023
G1 X141.101 Y101.906 E.0035
M204 S10000
G1 X140.73 Y101.223 F42000
G1 F15000
M204 S6000
G1 X140.73 Y99.538 E.02736
G1 X140.399 Y99.532 E.00538
G1 X140.002 Y99.363 E.007
G1 X140.002 Y101.115 E.02845
G1 X140.407 Y101.115 E.00658
G1 X140.673 Y101.204 E.00455
M204 S10000
G1 X140.366 Y99.894 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X140.366 Y100.691 E.01069
M204 S10000
G1 X139.566 Y95.801 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X139.57 Y98.25 E.03228
M204 S10000
G1 X142.124 Y98.251 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.957 Y98.251 E.02508
M204 S10000
G1 X146.049 Y97.364 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.897 Y97.364 E.14366
G1 X154.928 Y97.268 E.00163
G1 X154.928 Y95.839 E.02321
G1 X145.953 Y95.839 E.14573
G1 X145.953 Y97.316 E.02398
G1 X145.995 Y97.337 E.00076
M204 S10000
G1 X146.716 Y96.601 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X154.106 Y96.601 E.0991
M204 S10000
G1 X154.53 Y96.965 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X154.53 Y96.238 E.01182
G1 X146.352 Y96.238 E.13279
G1 X146.352 Y96.965 E.01182
G1 X154.47 Y96.965 E.13181
M204 S10000
G1 X155.164 Y97.762 F42000
G1 F15000
M204 S6000
G1 X155.23 Y97.562 E.00342
G1 X155.327 Y97.513 E.00176
G1 X155.327 Y95.441 E.03366
G1 X145.555 Y95.441 E.15867
G1 X145.555 Y97.513 E.03366
G1 X145.652 Y97.562 E.00176
G1 X145.718 Y97.762 E.00342
G1 X155.104 Y97.762 E.15241
M204 S10000
G1 X155.511 Y98.161 F42000
G1 F15000
M204 S6000
G1 X155.511 Y97.918 E.00395
G1 X155.55 Y97.799 E.00203
G1 X155.725 Y97.704 E.00324
G1 X155.725 Y95.042 E.04322
G1 X145.156 Y95.042 E.17161
G1 X145.156 Y97.718 E.04346
G1 X145.331 Y97.799 E.00313
G1 X145.37 Y97.918 E.00203
G1 X145.37 Y98.161 E.00395
G1 X155.451 Y98.161 E.16368
; WIPE_START
G1 X153.451 Y98.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.471 Y95.072 Z1.8 F42000
G1 X144.107 Y94.026 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X141.374 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X143.374 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.883 Y99.327 Z1.8 F42000
G1 X119.186 Y117.376 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.145 Y117.122 E.00449
G1 X119.145 Y104.231 E.22508
G1 X119.186 Y103.977 E.00449
G3 X119.541 Y103.621 I.576 J.221 E.00904
G1 X119.795 Y103.581 E.00449
G1 X132.686 Y103.581 E.22508
G1 X132.83 Y103.604 E.00254
G3 X133.296 Y103.977 I-.048 J.538 E.01104
G1 X133.336 Y104.231 E.00449
G1 X133.336 Y117.122 E.22508
G1 X133.296 Y117.376 E.00449
G3 X132.94 Y117.731 I-.576 J-.221 E.00904
G1 X132.686 Y117.772 E.00449
G1 X119.795 Y117.772 E.22508
G1 X119.541 Y117.731 E.00449
G3 X119.211 Y117.43 I.242 J-.597 E.00797
M204 S10000
G1 X118.773 Y117.51 F42000
G1 F6000
M204 S6000
G1 X118.717 Y117.156 E.00627
G1 X118.717 Y104.197 E.22626
G1 X118.773 Y103.843 E.00626
G1 X118.913 Y103.568 E.0054
G1 X119.132 Y103.349 E.00539
G1 X119.407 Y103.209 E.0054
G1 X119.762 Y103.153 E.00626
G1 X132.72 Y103.153 E.22626
G1 X132.897 Y103.181 E.00313
G1 X133.074 Y103.209 E.00313
G1 X133.35 Y103.349 E.0054
G1 X133.568 Y103.568 E.00539
G1 X133.708 Y103.843 E.0054
G1 X133.765 Y104.197 E.00626
G1 X133.765 Y117.156 E.22626
G1 X133.708 Y117.51 E.00626
G1 X133.568 Y117.785 E.00539
G1 X133.35 Y118.004 E.0054
G1 X133.074 Y118.144 E.00539
G1 X132.72 Y118.2 E.00626
G1 X119.762 Y118.2 E.22626
G1 X119.407 Y118.144 E.00626
G1 X119.132 Y118.004 E.00539
G1 X118.913 Y117.785 E.00539
G1 X118.8 Y117.563 E.00435
M204 S250
G1 X118.403 Y117.694 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.375 Y117.639 E.001
G1 X118.303 Y117.17 E.00771
G1 X118.303 Y104.183 E.21088
G1 X118.375 Y103.713 E.00771
G1 X118.575 Y103.321 E.00714
G1 X118.886 Y103.01 E.00714
G1 X119.278 Y102.811 E.00714
G1 X119.747 Y102.739 E.00771
G1 X132.734 Y102.739 E.21088
G3 X132.962 Y102.772 I.009 J.735 E.00375
G1 X133.204 Y102.811 E.00398
G1 X133.596 Y103.01 E.00714
G1 X133.907 Y103.321 E.00714
G1 X134.107 Y103.713 E.00714
G1 X134.178 Y104.183 E.00771
G1 X134.178 Y117.17 E.21088
G1 X134.107 Y117.639 E.00771
G1 X133.907 Y118.031 E.00714
G1 X133.596 Y118.343 E.00714
G1 X133.204 Y118.542 E.00714
G1 X132.734 Y118.614 E.00771
G1 X119.747 Y118.614 E.21088
G1 X119.278 Y118.542 E.00771
G1 X118.886 Y118.343 E.00714
G1 X118.575 Y118.031 E.00714
G1 X118.43 Y117.748 E.00517
; WIPE_START
M204 S6000
G1 X118.375 Y117.639 E-.04612
G1 X118.303 Y117.17 E-.18042
G1 X118.303 Y115.766 E-.53346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.974 Y108.163 Z1.8 F42000
G1 X119.318 Y104.268 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42259
G1 F15000
M204 S6000
G1 X119.6 Y103.986 E.00653
G1 X119.651 Y103.96 E.00093
G3 X120.221 Y103.933 I.371 J1.783 E.00936
G1 X119.497 Y104.656 E.01673
G1 X119.497 Y105.224 E.00927
G1 X120.788 Y103.933 E.02984
G1 X121.355 Y103.933 E.00927
G1 X119.497 Y105.791 E.04295
G1 X119.497 Y106.358 E.00927
G1 X121.923 Y103.933 E.05606
G1 X122.49 Y103.933 E.00927
G1 X119.497 Y106.926 E.06918
G1 X119.497 Y107.493 E.00927
G1 X123.057 Y103.933 E.08229
G1 X123.624 Y103.933 E.00927
G1 X119.497 Y108.06 E.0954
G1 X119.497 Y108.627 E.00927
G1 X124.192 Y103.933 E.10851
G1 X124.759 Y103.933 E.00927
G1 X119.497 Y109.195 E.12162
G1 X119.497 Y109.762 E.00927
G1 X125.326 Y103.933 E.13473
G1 X125.894 Y103.933 E.00927
G1 X119.497 Y110.329 E.14785
G1 X119.497 Y110.897 E.00927
G1 X126.461 Y103.933 E.16096
G1 X127.028 Y103.933 E.00927
G1 X119.497 Y111.464 E.17407
G1 X119.497 Y112.031 E.00927
G1 X127.595 Y103.933 E.18718
G1 X128.163 Y103.933 E.00927
G1 X119.497 Y112.598 E.20029
G1 X119.497 Y113.166 E.00927
G1 X128.73 Y103.933 E.2134
G1 X129.297 Y103.933 E.00927
G1 X119.497 Y113.733 E.22652
G1 X119.497 Y114.3 E.00927
G1 X129.865 Y103.933 E.23963
G1 X130.432 Y103.933 E.00927
G1 X119.497 Y114.868 E.25274
G1 X119.497 Y115.435 E.00927
G1 X130.999 Y103.933 E.26585
G1 X131.566 Y103.933 E.00927
G1 X119.497 Y116.002 E.27896
G1 X119.497 Y116.569 E.00927
G1 X132.134 Y103.933 E.29207
G1 X132.695 Y103.938 E.00918
G1 X119.503 Y117.131 E.30492
G2 X119.786 Y117.414 I.249 J.034 E.00759
G1 X132.979 Y104.222 E.30492
G1 X132.985 Y104.784 E.00918
G1 X120.348 Y117.42 E.29207
G1 X120.915 Y117.42 E.00927
G1 X132.985 Y105.351 E.27896
G1 X132.985 Y105.918 E.00927
G1 X121.483 Y117.42 E.26585
G1 X122.05 Y117.42 E.00927
G1 X132.985 Y106.486 E.25274
G1 X132.985 Y107.053 E.00927
G1 X122.617 Y117.42 E.23962
G1 X123.184 Y117.42 E.00927
G1 X132.985 Y107.62 E.22651
G1 X132.985 Y108.187 E.00927
G1 X123.752 Y117.42 E.2134
G1 X124.319 Y117.42 E.00927
G1 X132.985 Y108.755 E.20029
G1 X132.985 Y109.322 E.00927
G1 X124.886 Y117.42 E.18718
G1 X125.454 Y117.42 E.00927
G1 X132.985 Y109.889 E.17407
G1 X132.985 Y110.457 E.00927
G1 X126.021 Y117.42 E.16095
G1 X126.588 Y117.42 E.00927
G1 X132.985 Y111.024 E.14784
G1 X132.985 Y111.591 E.00927
G1 X127.155 Y117.42 E.13473
G1 X127.723 Y117.42 E.00927
M73 P66 R7
G1 X132.985 Y112.158 E.12162
G1 X132.985 Y112.726 E.00927
G1 X128.29 Y117.42 E.10851
G1 X128.857 Y117.42 E.00927
G1 X132.985 Y113.293 E.0954
G1 X132.985 Y113.86 E.00927
G1 X129.425 Y117.42 E.08228
G1 X129.992 Y117.42 E.00927
G1 X132.985 Y114.427 E.06917
G1 X132.985 Y114.995 E.00927
G1 X130.559 Y117.42 E.05606
G1 X131.126 Y117.42 E.00927
G1 X132.985 Y115.562 E.04295
G1 X132.985 Y116.129 E.00927
G1 X131.694 Y117.42 E.02984
G1 X132.261 Y117.42 E.00927
G1 X132.985 Y116.697 E.01672
G1 X132.985 Y117.094 E.0065
G3 X132.931 Y117.317 I-.37 J.029 E.00381
G1 X132.649 Y117.6 E.00653
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.931 Y117.317 E-.15172
G1 X132.957 Y117.266 E-.02185
G1 X132.985 Y117.094 E-.0661
G1 X132.985 Y116.697 E-.15108
G1 X132.297 Y117.384 E-.36925
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 15/72
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S183.6
; OBJECT_ID: 104
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I.164 J1.206 P1  F42000
G1 X157.701 Y113.936 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.181 Y113.936 E.23578
G1 X143.181 Y99.416 E.23578
G1 X157.701 Y99.416 E.23578
G1 X157.701 Y113.876 E.2348
; WIPE_START
M204 S6000
G1 X155.701 Y113.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.314 Y107.639 Z1.9 F42000
G1 X143.901 Y97.086 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.581 Y97.086 E.03767
G1 X141.581 Y94.266 E.04579
G1 X143.901 Y94.266 E.03767
G1 X143.901 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X141.901 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.534 Y97.082 Z1.9 F42000
G1 X159.301 Y97.086 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X156.981 Y97.086 E.03767
G1 X156.981 Y94.266 E.04579
G1 X159.301 Y94.266 E.03767
G1 X159.301 Y97.026 E.04482
; WIPE_START
M204 S6000
G1 X157.301 Y97.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.636 Y103.944 Z1.9 F42000
G1 X161.531 Y105.786 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.331 Y105.786 E.02923
G1 X163.331 Y116.346 E.17146
G3 X158.672 Y119.566 I-12.894 J-13.669 E.09231
G1 X142.209 Y119.566 E.26733
G3 X137.551 Y116.346 I8.236 J-16.89 E.09231
G1 X137.551 Y105.786 E.17146
G1 X139.351 Y105.786 E.02923
G1 X139.351 Y103.566 E.03605
G1 X137.551 Y103.566 E.02923
G1 X137.551 Y93.786 E.15881
G1 X163.331 Y93.786 E.41862
G1 X163.331 Y103.566 E.15881
G1 X161.531 Y103.566 E.02923
G1 X161.531 Y105.726 E.03507
; WIPE_START
M204 S6000
G1 X163.331 Y105.786 E-.68438
G1 X163.331 Y105.985 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 104
M625
; object ids of layer 15 start: 104,115
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.9 F4000
            G39.3 S1
            G0 Z1.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer15 end: 104,115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X162.287 Y94.006 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X163.112 Y94.83 E.01894
G1 X163.112 Y95.394
G1 X161.723 Y94.006 E.03188
G1 X161.16 Y94.006
G1 X163.112 Y95.958 E.04483
G1 X163.112 Y96.521
G1 X160.596 Y94.006 E.05777
G1 X160.032 Y94.006
G1 X163.112 Y97.085 E.07071
G1 X163.112 Y97.649
G1 X159.727 Y94.264 E.07773
G1 X159.52 Y94.62
G1 X163.112 Y98.212 E.08248
G1 X163.112 Y98.776
G1 X159.52 Y95.184 E.08248
G1 X159.52 Y95.748
G1 X163.112 Y99.339 E.08248
G1 X163.112 Y99.903
G1 X159.52 Y96.311 E.08248
G1 X159.52 Y96.875
G1 X163.112 Y100.467 E.08248
G1 X163.112 Y101.03
G1 X159.387 Y97.306 E.08553
G1 X158.823 Y97.306
G1 X163.112 Y101.594 E.09847
G1 X163.112 Y102.157
G1 X158.26 Y97.306 E.11141
G1 X157.696 Y97.306
G1 X163.112 Y102.721 E.12436
G1 X163.112 Y103.285
G1 X157.133 Y97.306 E.1373
; WIPE_START
M204 S6000
G1 X158.547 Y98.72 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.762 Y94.68 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X156.087 Y94.006 E.01549
G1 X155.523 Y94.006
G1 X156.762 Y95.244 E.02843
G1 X156.762 Y95.807
G1 X154.96 Y94.006 E.04137
G1 X154.396 Y94.006
G1 X156.762 Y96.371 E.05432
G1 X156.762 Y96.935
G1 X153.833 Y94.006 E.06726
G1 X153.269 Y94.006
G1 X162.611 Y103.347 E.21452
G1 X162.047 Y103.347
G1 X157.92 Y99.22 E.09478
G1 X157.92 Y99.784
G1 X161.483 Y103.347 E.08183
G1 X161.312 Y103.739
G1 X157.92 Y100.347 E.07789
G1 X157.92 Y100.911
G1 X161.312 Y104.303 E.07789
G1 X161.312 Y104.866
G1 X157.92 Y101.475 E.07789
G1 X157.92 Y102.038
G1 X161.312 Y105.43 E.07789
G1 X161.312 Y105.993
G1 X157.92 Y102.602 E.07789
; WIPE_START
M204 S6000
G1 X159.334 Y104.016 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.897 Y99.197 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X152.705 Y94.006 E.11922
G1 X152.142 Y94.006
G1 X157.333 Y99.197 E.11922
G1 X156.77 Y99.197
G1 X151.578 Y94.006 E.11922
G1 X151.015 Y94.006
G1 X156.206 Y99.197 E.11922
G1 X155.643 Y99.197
G1 X150.451 Y94.006 E.11922
G1 X149.887 Y94.006
G1 X155.079 Y99.197 E.11922
G1 X154.515 Y99.197
G1 X149.324 Y94.006 E.11922
G1 X148.76 Y94.006
G1 X153.952 Y99.197 E.11922
G1 X153.388 Y99.197
G1 X148.197 Y94.006 E.11922
G1 X147.633 Y94.006
G1 X152.825 Y99.197 E.11922
G1 X152.261 Y99.197
G1 X147.069 Y94.006 E.11922
G1 X146.506 Y94.006
G1 X151.697 Y99.197 E.11922
G1 X151.134 Y99.197
G1 X145.942 Y94.006 E.11922
G1 X145.379 Y94.006
G1 X150.57 Y99.197 E.11922
G1 X150.007 Y99.197
G1 X144.815 Y94.006 E.11922
G1 X144.327 Y94.081
G1 X149.443 Y99.197 E.11749
G1 X148.879 Y99.197
G1 X144.12 Y94.438 E.1093
G1 X144.12 Y95.001
G1 X148.316 Y99.197 E.09635
G1 X147.752 Y99.197
G1 X144.12 Y95.565 E.08341
G1 X144.12 Y96.129
G1 X147.189 Y99.197 E.07047
G1 X146.625 Y99.197
G1 X144.12 Y96.692 E.05753
G1 X144.12 Y97.256
G1 X146.061 Y99.197 E.04458
G1 X145.498 Y99.197
G1 X143.606 Y97.306 E.04344
G1 X143.042 Y97.306
M73 P67 R7
G1 X144.934 Y99.197 E.04344
G1 X144.371 Y99.197
G1 X142.479 Y97.306 E.04344
G1 X141.915 Y97.306
G1 X143.807 Y99.197 E.04344
; WIPE_START
M204 S6000
G1 X142.393 Y97.783 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.306 Y94.006 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X141.362 Y95.061 E.02424
G1 X141.362 Y95.625
G1 X139.742 Y94.006 E.03718
G1 X139.179 Y94.006
G1 X141.362 Y96.188 E.05012
G1 X141.362 Y96.752
G1 X138.615 Y94.006 E.06307
G1 X138.052 Y94.006
G1 X143.243 Y99.197 E.11922
G1 X142.962 Y99.479
G1 X137.77 Y94.288 E.11922
G1 X137.77 Y94.851
G1 X142.962 Y100.043 E.11922
G1 X142.962 Y100.606
G1 X137.77 Y95.415 E.11922
G1 X137.77 Y95.978
G1 X142.962 Y101.17 E.11922
G1 X142.962 Y101.734
G1 X137.77 Y96.542 E.11922
G1 X137.77 Y97.106
G1 X142.962 Y102.297 E.11922
G1 X142.962 Y102.861
G1 X137.77 Y97.669 E.11922
G1 X137.77 Y98.233
G1 X142.962 Y103.424 E.11922
G1 X142.962 Y103.988
G1 X137.77 Y98.796 E.11922
G1 X137.77 Y99.36
G1 X142.962 Y104.552 E.11922
G1 X142.962 Y105.115
G1 X137.77 Y99.924 E.11922
G1 X137.77 Y100.487
G1 X142.962 Y105.679 E.11922
G1 X142.962 Y106.242
G1 X137.77 Y101.051 E.11922
G1 X137.77 Y101.614
G1 X139.503 Y103.347 E.03979
G1 X138.939 Y103.347
G1 X137.77 Y102.178 E.02685
G1 X137.77 Y102.742
G1 X138.376 Y103.347 E.01391
G1 X139.57 Y103.414
G1 X142.962 Y106.806 E.07789
G1 X142.962 Y107.37
G1 X139.57 Y103.978 E.07789
G1 X139.57 Y104.542
G1 X142.962 Y107.933 E.07789
G1 X142.962 Y108.497
G1 X139.57 Y105.105 E.07789
G1 X139.57 Y105.669
G1 X142.962 Y109.06 E.07789
G1 X142.962 Y109.624
G1 X139.343 Y106.006 E.08309
G1 X138.78 Y106.006
G1 X142.962 Y110.188 E.09604
G1 X142.962 Y110.751
G1 X138.216 Y106.006 E.10898
G1 X137.77 Y106.123
G1 X142.962 Y111.315 E.11922
G1 X142.962 Y111.878
G1 X137.77 Y106.687 E.11922
G1 X137.77 Y107.25
G1 X142.962 Y112.442 E.11922
G1 X142.962 Y113.006
G1 X137.77 Y107.814 E.11922
G1 X137.77 Y108.378
G1 X142.962 Y113.569 E.11922
G1 X142.962 Y114.133
G1 X137.77 Y108.941 E.11922
; WIPE_START
M204 S6000
G1 X139.184 Y110.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.687 Y108.953 Z1.9 F42000
G1 X162.451 Y106.006 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X163.112 Y106.666 E.01517
G1 X163.112 Y107.23
G1 X161.887 Y106.006 E.02811
G1 X161.324 Y106.006
G1 X163.112 Y107.793 E.04105
G1 X163.112 Y108.357
G1 X157.92 Y103.165 E.11922
G1 X157.92 Y103.729
G1 X163.112 Y108.921 E.11922
G1 X163.112 Y109.484
G1 X157.92 Y104.293 E.11922
G1 X157.92 Y104.856
G1 X163.112 Y110.048 E.11922
G1 X163.112 Y110.611
G1 X157.92 Y105.42 E.11922
G1 X157.92 Y105.983
G1 X163.112 Y111.175 E.11922
G1 X163.112 Y111.739
G1 X157.92 Y106.547 E.11922
G1 X157.92 Y107.111
G1 X163.112 Y112.302 E.11922
G1 X163.112 Y112.866
G1 X157.92 Y107.674 E.11922
G1 X157.92 Y108.238
G1 X163.112 Y113.429 E.11922
G1 X163.112 Y113.993
G1 X157.92 Y108.801 E.11922
G1 X157.92 Y109.365
G1 X163.112 Y114.557 E.11922
G1 X163.112 Y115.12
G1 X157.92 Y109.929 E.11922
G1 X157.92 Y110.492
G1 X163.112 Y115.684 E.11922
G1 X163.111 Y116.247
G1 X157.92 Y111.056 E.11921
G1 X157.92 Y111.619
G1 X162.811 Y116.511 E.11233
G1 X162.512 Y116.775
G1 X157.92 Y112.183 E.10544
G1 X157.92 Y112.747
G1 X162.212 Y117.039 E.09856
G1 X161.893 Y117.283
G1 X157.92 Y113.31 E.09124
G1 X157.92 Y113.874
G1 X161.573 Y117.527 E.08388
G1 X161.252 Y117.77
G1 X157.638 Y114.156 E.083
G1 X157.074 Y114.156
G1 X160.919 Y118 E.08828
G1 X160.578 Y118.223
G1 X156.511 Y114.156 E.09339
G1 X155.947 Y114.156
G1 X160.237 Y118.445 E.09851
G1 X159.888 Y118.66
G1 X155.384 Y114.156 E.10345
G1 X154.82 Y114.156
G1 X159.53 Y118.866 E.10816
G1 X159.167 Y119.066
G1 X154.256 Y114.156 E.11277
G1 X153.693 Y114.156
G1 X158.795 Y119.257 E.11716
G1 X158.321 Y119.347
G1 X153.129 Y114.156 E.11922
G1 X152.566 Y114.156
G1 X157.757 Y119.347 E.11922
G1 X157.194 Y119.347
G1 X152.002 Y114.156 E.11922
G1 X151.438 Y114.156
G1 X156.63 Y119.347 E.11922
G1 X156.066 Y119.347
G1 X150.875 Y114.156 E.11922
G1 X150.311 Y114.156
G1 X155.503 Y119.347 E.11922
G1 X154.939 Y119.347
G1 X149.748 Y114.156 E.11922
G1 X149.184 Y114.156
G1 X154.376 Y119.347 E.11922
G1 X153.812 Y119.347
G1 X148.62 Y114.156 E.11922
G1 X148.057 Y114.156
G1 X153.248 Y119.347 E.11922
G1 X152.685 Y119.347
G1 X147.493 Y114.156 E.11922
G1 X146.93 Y114.156
G1 X152.121 Y119.347 E.11922
G1 X151.558 Y119.347
G1 X146.366 Y114.156 E.11922
G1 X145.802 Y114.156
G1 X150.994 Y119.347 E.11922
G1 X150.43 Y119.347
G1 X145.239 Y114.156 E.11922
G1 X144.675 Y114.156
G1 X149.867 Y119.347 E.11922
G1 X149.303 Y119.347
G1 X144.112 Y114.156 E.11922
M73 P68 R7
G1 X143.548 Y114.156
G1 X148.74 Y119.347 E.11922
G1 X148.176 Y119.347
G1 X142.984 Y114.156 E.11922
; WIPE_START
M204 S6000
G1 X144.399 Y115.57 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.612 Y119.347 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X137.77 Y109.505 E.22602
G1 X137.77 Y110.068
G1 X147.049 Y119.347 E.21308
G1 X146.485 Y119.347
G1 X137.77 Y110.632 E.20014
G1 X137.77 Y111.196
G1 X145.921 Y119.347 E.18719
G1 X145.358 Y119.347
G1 X137.77 Y111.759 E.17425
G1 X137.77 Y112.323
G1 X144.794 Y119.347 E.16131
G1 X144.231 Y119.347
G1 X137.77 Y112.887 E.14836
G1 X137.77 Y113.45
G1 X143.667 Y119.347 E.13542
G1 X143.103 Y119.347
G1 X137.77 Y114.014 E.12248
G1 X137.77 Y114.577
G1 X142.54 Y119.347 E.10954
G1 X141.676 Y119.047
G1 X137.77 Y115.141 E.08969
G1 X137.77 Y115.705
G1 X140.258 Y118.192 E.05713
; WIPE_START
M204 S6000
G1 X138.844 Y116.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.712 Y109.195 Z1.9 F42000
G1 X141.381 Y94.61 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.288719
G1 F15000
M204 S6000
G1 X140.757 Y93.986 E.00962
; WIPE_START
G1 X141.381 Y94.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.645 Y102.207 Z1.9 F42000
G1 X139.171 Y117.419 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0889009
G1 F15000
M204 S6000
G1 X138.944 Y117.221 E.00083
; LINE_WIDTH: 0.128133
G1 X138.717 Y117.023 E.00131
; LINE_WIDTH: 0.166591
G1 X138.233 Y116.569 E.00392
; LINE_WIDTH: 0.204263
G1 X137.75 Y116.115 E.00494
; WIPE_START
G1 X138.233 Y116.569 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.956 Y118.638 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0837884
G1 F15000
M204 S6000
G1 X140.85 Y118.557 E.00034
; LINE_WIDTH: 0.118288
G1 X140.674 Y118.414 E.00089
; LINE_WIDTH: 0.158266
G1 X140.498 Y118.271 E.00126
; LINE_WIDTH: 0.198245
G1 X140.322 Y118.128 E.00163
; WIPE_START
G1 X140.498 Y118.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.774 Y110.644 Z1.9 F42000
G1 X141.374 Y94.026 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X144.107 Y94.026 E.0074
; WIPE_START
G1 X142.107 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.74 Y94.026 Z1.9 F42000
G1 X156.774 Y94.026 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X159.507 Y94.026 E.0074
; OBJECT_ID: 115
; WIPE_START
G1 X157.507 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G1 X150.801 Y97.67 Z1.9 F42000
G1 X122.329 Y113.138 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.329 Y108.214 E.08598
G1 X123.779 Y108.214 E.02532
G1 X123.779 Y106.764 E.02532
G1 X128.703 Y106.764 E.08598
G1 X128.703 Y108.214 E.02532
G1 X130.153 Y108.214 E.02532
G1 X130.153 Y113.138 E.08598
G1 X128.703 Y113.138 E.02532
G1 X128.703 Y114.588 E.02532
G1 X123.779 Y114.588 E.08598
G1 X123.779 Y113.138 E.02532
G1 X122.389 Y113.138 E.02427
M204 S10000
G1 X122.757 Y112.71 F42000
G1 F6000
M204 S6000
G1 X122.757 Y108.643 E.07101
G1 X124.207 Y108.643 E.02532
G1 X124.207 Y107.193 E.02532
G1 X128.274 Y107.193 E.07101
G1 X128.274 Y108.643 E.02532
G1 X129.724 Y108.643 E.02532
G1 X129.724 Y112.71 E.07101
G1 X128.274 Y112.71 E.02532
G1 X128.274 Y114.16 E.02532
G1 X124.207 Y114.16 E.07101
G1 X124.207 Y112.71 E.02532
G1 X122.817 Y112.71 E.02427
; WIPE_START
G1 X122.788 Y110.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.146 Y117.405 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X119.105 Y117.146 E.00458
G1 X119.105 Y104.207 E.22593
G1 X119.146 Y103.948 E.00458
G3 X119.512 Y103.582 I.542 J.176 E.00938
G1 X119.771 Y103.541 E.00458
G1 X132.711 Y103.541 E.22593
G1 X132.871 Y103.566 E.00284
G3 X133.336 Y103.948 I-.063 J.55 E.01109
G1 X133.377 Y104.207 E.00458
G1 X133.377 Y117.146 E.22593
G1 X133.336 Y117.405 E.00458
G3 X132.97 Y117.771 I-.542 J-.176 E.00938
G1 X132.711 Y117.812 E.00458
G1 X119.771 Y117.812 E.22593
G1 X119.512 Y117.771 E.00458
G3 X119.168 Y117.461 I.176 J-.542 E.00833
M204 S10000
G1 X118.731 Y117.525 F42000
G1 F6000
M204 S6000
G1 X118.676 Y117.18 E.00609
G1 X118.676 Y104.173 E.22711
G1 X118.733 Y103.814 E.00635
G1 X118.876 Y103.534 E.00548
G1 X119.098 Y103.312 E.00548
G1 X119.378 Y103.169 E.00548
G1 X119.737 Y103.112 E.00635
G1 X132.744 Y103.112 E.22711
G1 X132.938 Y103.143 E.00343
G1 X133.104 Y103.169 E.00293
G1 X133.384 Y103.312 E.00548
G1 X133.606 Y103.534 E.00548
G1 X133.748 Y103.814 E.00548
G1 X133.805 Y104.173 E.00635
G1 X133.805 Y117.18 E.22711
G1 X133.748 Y117.539 E.00635
G1 X133.606 Y117.819 E.00548
G1 X133.384 Y118.041 E.00548
G1 X133.104 Y118.184 E.00548
G1 X132.744 Y118.241 E.00635
G1 X119.737 Y118.241 E.22711
G1 X119.378 Y118.184 E.00635
G1 X119.098 Y118.041 E.00548
G1 X118.876 Y117.819 E.00548
G1 X118.754 Y117.58 E.0047
M204 S250
G1 X118.323 Y117.587 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.263 Y117.194 E.00645
G1 X118.263 Y104.159 E.21167
G1 X118.335 Y103.684 E.00779
G1 X118.537 Y103.288 E.00723
G1 X118.852 Y102.973 E.00723
G1 X119.248 Y102.771 E.00723
G1 X119.723 Y102.699 E.00779
G1 X132.759 Y102.699 E.21167
G3 X133.003 Y102.734 I.009 J.789 E.00402
G1 X133.233 Y102.771 E.00378
G1 X133.63 Y102.973 E.00723
G1 X133.944 Y103.288 E.00723
G1 X134.146 Y103.684 E.00723
G1 X134.219 Y104.159 E.00779
G1 X134.219 Y117.194 E.21167
G1 X134.146 Y117.669 E.00779
G1 X133.944 Y118.065 E.00723
G1 X133.63 Y118.38 E.00723
G1 X133.233 Y118.582 E.00723
G1 X132.759 Y118.654 E.00779
G1 X119.723 Y118.654 E.21167
G1 X119.248 Y118.582 E.00779
G1 X118.852 Y118.38 E.00723
G1 X118.537 Y118.065 E.00723
G1 X118.335 Y117.669 E.00723
G1 X118.332 Y117.646 E.00037
; WIPE_START
M204 S6000
G1 X118.263 Y117.194 E-.17377
G1 X118.263 Y115.652 E-.58623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.659 Y111.487 Z1.9 F42000
G1 X128.669 Y108.877 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X129.49 Y109.699 E.01886
G1 X129.49 Y110.262
G1 X128.105 Y108.877 E.03181
G1 X128.04 Y108.249
G1 X127.219 Y107.427 E.01886
G1 X126.655 Y107.427
G1 X128.04 Y108.812 E.03181
M204 S10000
G1 X126.091 Y107.427 F42000
G1 F3000
M204 S2000
G1 X129.49 Y110.826 E.07805
G1 X129.49 Y111.389
G1 X125.528 Y107.427 E.09099
G1 X124.964 Y107.427
G1 X129.49 Y111.953 E.10393
G1 X129.449 Y112.476
G1 X124.442 Y107.468 E.11499
G1 X124.442 Y108.032
G1 X128.885 Y112.476 E.10205
G1 X128.322 Y112.476
G1 X124.442 Y108.596 E.0891
G1 X124.16 Y108.877
G1 X128.04 Y112.758 E.08911
G1 X128.04 Y113.321
G1 X123.596 Y108.877 E.10205
G1 X123.032 Y108.877
G1 X128.04 Y113.885 E.11499
G1 X127.517 Y113.926
G1 X122.992 Y109.4 E.10393
G1 X122.992 Y109.964
G1 X126.954 Y113.926 E.09099
G1 X126.39 Y113.926
G1 X122.992 Y110.527 E.07804
G1 X122.992 Y111.091
G1 X124.376 Y112.476 E.0318
G1 X123.813 Y112.476
G1 X122.992 Y111.654 E.01886
M204 S10000
G1 X124.442 Y112.541 F42000
G1 F3000
M204 S2000
G1 X125.826 Y113.926 E.0318
G1 X125.263 Y113.926
G1 X124.442 Y113.104 E.01886
M204 S10000
G1 X124.55 Y112.367 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106466
G1 F15000
M204 S6000
G1 X124.454 Y112.463 E.00047
G1 X124.441 Y112.542 E.00028
; WIPE_START
G1 X124.454 Y112.463 E-.2819
G1 X124.55 Y112.367 E-.4781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.079 Y108.415 Z1.9 F42000
G1 X131.765 Y108 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425871
G1 F15000
M204 S6000
G1 X131.757 Y113.536 E.09122
M204 S10000
G1 X130.312 Y106.605 F42000
; LINE_WIDTH: 0.420736
G1 F15000
M204 S6000
G1 X130.77 Y106.665 E.00751
G1 X131.213 Y106.891 E.00808
G1 X131.601 Y107.349 E.00977
G1 X131.765 Y108 E.01092
G2 X131.767 Y105.15 I-356.112 J-1.771 E.04637
G2 X128.917 Y105.153 I-1.079 J356.115 E.04637
G1 X129.568 Y105.316 E.01092
G1 X130.027 Y105.705 E.00978
G1 X130.252 Y106.147 E.00808
G1 X130.304 Y106.546 E.00654
M204 S10000
G1 X130.682 Y106.235 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
M73 P69 R7
G1 X130.885 Y106.283 E.00338
G1 X131.369 Y106.53 E.00882
G1 X131.369 Y105.548 E.01594
G1 X130.387 Y105.548 E.01594
G1 X130.634 Y106.032 E.00882
G1 X130.668 Y106.176 E.00241
M204 S10000
G1 X131.015 Y105.886 F42000
; LINE_WIDTH: 0.37382
G1 F15000
M204 S6000
G1 X130.949 Y105.924 E.0011
G1 X131.002 Y105.954 E.00087
M204 S10000
G1 X123.321 Y105.163 F42000
; LINE_WIDTH: 0.425986
G1 F15000
M204 S6000
G1 X128.857 Y105.153 E.09124
M204 S10000
G1 X122.17 Y106.605 F42000
; LINE_WIDTH: 0.42257
G1 F15000
M204 S6000
G1 X122.229 Y106.147 E.00755
G1 X122.455 Y105.705 E.00812
G1 X122.914 Y105.316 E.00982
G1 X123.321 Y105.163 E.00712
G2 X120.714 Y105.15 I-1.874 J111.401 E.04261
G2 X120.717 Y108 I356.115 J1.079 E.04658
G1 X120.881 Y107.349 E.01097
G1 X121.269 Y106.891 E.00982
G1 X121.712 Y106.665 E.00812
G1 X122.11 Y106.613 E.00657
M204 S10000
G1 X121.799 Y106.235 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X121.847 Y106.032 E.00338
G1 X122.095 Y105.548 E.00882
G1 X121.113 Y105.548 E.01594
G1 X121.113 Y106.53 E.01594
G1 X121.596 Y106.283 E.00882
G1 X121.741 Y106.249 E.00241
M204 S10000
G1 X121.51 Y105.886 F42000
; LINE_WIDTH: 0.37384
G1 F15000
M204 S6000
G1 X121.444 Y105.924 E.0011
G1 X121.496 Y105.954 E.00087
M204 S10000
G1 X120.727 Y113.596 F42000
; LINE_WIDTH: 0.425986
G1 F15000
M204 S6000
G1 X120.717 Y108.06 E.09124
M204 S10000
G1 X121.51 Y115.391 F42000
; LINE_WIDTH: 0.37384
G1 F15000
M204 S6000
G1 X121.444 Y115.429 E.0011
G1 X121.496 Y115.459 E.00087
M204 S10000
G1 X121.799 Y115.118 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X121.596 Y115.07 E.00338
G1 X121.113 Y114.823 E.00882
G1 X121.113 Y115.805 E.01594
G1 X122.095 Y115.805 E.01594
G1 X121.847 Y115.321 E.00882
G1 X121.813 Y115.176 E.00241
M204 S10000
G1 X122.17 Y114.748 F42000
; LINE_WIDTH: 0.42257
G1 F15000
M204 S6000
G1 X121.712 Y114.688 E.00755
G1 X121.269 Y114.462 E.00812
G1 X120.881 Y114.004 E.00982
G1 X120.727 Y113.596 E.00712
G2 X120.714 Y116.203 I111.401 J1.874 E.04261
G2 X123.564 Y116.2 I1.079 J-356.115 E.04658
G1 X122.914 Y116.036 E.01097
G1 X122.455 Y115.648 E.00982
G1 X122.229 Y115.206 E.00812
G1 X122.177 Y114.807 E.00657
M204 S10000
G1 X122.568 Y114.349 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X121.94 Y114.334 E.0102
G1 X121.511 Y114.145 E.00762
G1 X121.233 Y113.818 E.00697
G1 X121.133 Y113.525 E.00502
G1 X121.118 Y113.353 E.00281
G1 X121.118 Y108 E.08691
G1 X121.233 Y107.535 E.00778
G1 X121.511 Y107.208 E.00697
G1 X121.94 Y107.019 E.00762
G1 X122.568 Y107.004 E.0102
G1 X122.583 Y106.376 E.0102
G1 X122.772 Y105.946 E.00762
G1 X123.1 Y105.669 E.00697
G1 X123.392 Y105.569 E.00502
G1 X123.564 Y105.554 E.00281
G1 X128.917 Y105.554 E.08691
G1 X129.382 Y105.669 E.00778
G1 X129.71 Y105.946 E.00697
G1 X129.898 Y106.376 E.00762
G1 X129.913 Y107.004 E.0102
G1 X130.541 Y107.019 E.0102
G1 X130.971 Y107.208 E.00762
G1 X131.248 Y107.535 E.00697
G1 X131.363 Y108 E.00778
G1 X131.363 Y113.353 E.08691
G1 X131.348 Y113.525 E.00281
G1 X131.248 Y113.818 E.00502
G1 X130.971 Y114.145 E.00697
G1 X130.541 Y114.334 E.00762
G1 X129.913 Y114.349 E.0102
G1 X129.898 Y114.977 E.0102
G1 X129.71 Y115.407 E.00762
G1 X129.382 Y115.684 E.00697
G1 X129.089 Y115.784 E.00502
G1 X128.917 Y115.799 E.00281
G1 X123.564 Y115.799 E.08691
G1 X123.1 Y115.684 E.00778
G1 X122.772 Y115.407 E.00697
G1 X122.583 Y114.977 E.00762
G1 X122.57 Y114.409 E.00923
M204 S10000
G1 X122.967 Y113.951 F42000
G1 F15000
M204 S6000
G1 X122.114 Y113.951 E.01384
G3 X121.586 Y113.632 I.039 J-.663 E.01043
G1 X121.517 Y113.353 E.00467
G1 X121.517 Y108 E.08691
G1 X121.586 Y107.721 E.00467
G1 X121.752 Y107.525 E.00418
G1 X122.01 Y107.412 E.00457
G1 X122.967 Y107.402 E.01554
G1 X122.967 Y106.55 E.01384
G3 X123.286 Y106.021 I.663 J.039 E.01043
G1 X123.564 Y105.952 E.00467
G1 X128.917 Y105.952 E.08691
G1 X129.196 Y106.021 E.00467
G1 X129.393 Y106.188 E.00418
G1 X129.506 Y106.446 E.00457
G1 X129.515 Y107.402 E.01554
G1 X130.367 Y107.402 E.01384
G3 X130.896 Y107.721 I-.039 J.663 E.01043
G1 X130.965 Y108 E.00467
G1 X130.965 Y113.353 E.08691
G1 X130.896 Y113.632 E.00467
G1 X130.729 Y113.828 E.00418
G1 X130.472 Y113.941 E.00457
G1 X129.515 Y113.951 E.01554
G1 X129.515 Y114.803 E.01384
G3 X129.196 Y115.331 I-.663 J-.039 E.01043
G1 X128.917 Y115.401 E.00467
G1 X123.564 Y115.401 E.08691
G1 X123.286 Y115.331 E.00467
G1 X123.089 Y115.165 E.00418
G1 X122.976 Y114.907 E.00457
G1 X122.967 Y114.011 E.01456
M204 S10000
G1 X123.365 Y113.552 F42000
G1 F15000
M204 S6000
G1 X122.114 Y113.552 E.02031
G1 X121.994 Y113.511 E.00207
G1 X121.915 Y113.353 E.00287
G1 X121.915 Y108 E.08691
G1 X121.994 Y107.842 E.00287
G1 X122.114 Y107.801 E.00207
G1 X123.365 Y107.801 E.02031
G1 X123.365 Y106.55 E.02031
G1 X123.406 Y106.429 E.00207
G1 X123.564 Y106.351 E.00287
G1 X128.917 Y106.351 E.08691
G1 X129.076 Y106.429 E.00287
G1 X129.116 Y106.55 E.00207
G1 X129.116 Y107.801 E.02031
G1 X130.367 Y107.801 E.02031
G1 X130.488 Y107.842 E.00207
G1 X130.566 Y108 E.00287
G1 X130.566 Y113.353 E.08691
G1 X130.488 Y113.511 E.00287
G1 X130.367 Y113.552 E.00207
G1 X129.116 Y113.552 E.02031
G1 X129.116 Y114.803 E.02031
G1 X129.076 Y114.924 E.00207
G1 X128.917 Y115.002 E.00287
G1 X123.564 Y115.002 E.08691
G1 X123.406 Y114.924 E.00287
G1 X123.365 Y114.803 E.00207
G1 X123.365 Y113.612 E.01933
; WIPE_START
G1 X123.365 Y114.803 E-.45248
G1 X123.406 Y114.924 E-.04844
G1 X123.564 Y115.002 E-.06721
G1 X124.069 Y115.002 E-.19187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.16 Y116.19 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.425986
G1 F15000
M204 S6000
G1 X123.624 Y116.2 E.09124
M204 S10000
G1 X130.312 Y114.748 F42000
; LINE_WIDTH: 0.423583
G1 F15000
M204 S6000
G1 X130.252 Y115.206 E.00757
G1 X130.027 Y115.648 E.00814
G1 X129.568 Y116.036 E.00984
G1 X129.16 Y116.19 E.00713
G2 X131.767 Y116.203 I1.874 J-111.401 E.04272
G1 X131.754 Y113.596 E.04271
G1 X131.601 Y114.004 E.00713
G1 X131.213 Y114.462 E.00984
G1 X130.77 Y114.688 E.00814
G1 X130.371 Y114.74 E.00658
M204 S10000
G1 X130.682 Y115.118 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.634 Y115.321 E.00338
G1 X130.387 Y115.805 E.00882
G1 X131.369 Y115.805 E.01594
G1 X131.369 Y114.823 E.01594
G1 X130.885 Y115.07 E.00882
G1 X130.741 Y115.104 E.00241
M204 S10000
G1 X131.015 Y115.391 F42000
; LINE_WIDTH: 0.37382
G1 F15000
M204 S6000
G1 X130.949 Y115.429 E.0011
G1 X131.002 Y115.459 E.00087
M204 S10000
G1 X132.166 Y116.602 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.166 Y104.751 E.19242
G1 X120.316 Y104.751 E.19242
G1 X120.316 Y116.602 E.19242
G1 X132.106 Y116.602 E.19145
M204 S10000
G1 X132.565 Y117 F42000
G1 F15000
M204 S6000
G1 X132.565 Y104.353 E.20537
G1 X119.917 Y104.353 E.20537
G1 X119.917 Y117 E.20537
G1 X132.505 Y117 E.20439
M204 S10000
G1 X132.963 Y117.057 F42000
G1 F15000
M204 S6000
G1 X132.963 Y104.263 E.20775
G1 X132.916 Y104.06 E.00338
G1 X132.824 Y103.997 E.00182
G1 X132.622 Y103.954 E.00335
G1 X119.804 Y103.954 E.20813
G1 X119.625 Y104.001 E.00301
G1 X119.561 Y104.094 E.00182
G1 X119.518 Y104.296 E.00335
G1 X119.518 Y117.114 E.20813
G1 X119.565 Y117.293 E.00301
G1 X119.658 Y117.356 E.00182
G1 X119.86 Y117.399 E.00335
G1 X132.678 Y117.399 E.20813
G1 X132.857 Y117.352 E.00301
G2 X132.951 Y117.116 I-.234 J-.23 E.00423
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X132.921 Y117.259 E-.05563
G1 X132.857 Y117.352 E-.04265
G1 X132.678 Y117.399 E-.07033
G1 X131.122 Y117.399 E-.59139
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 16/72
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I1.029 J-.65 P1  F42000
G1 X127.968 Y112.404 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X127.968 Y113.854 E.02532
G1 X124.514 Y113.854 E.06031
G1 X124.514 Y112.404 E.02532
G1 X123.064 Y112.404 E.02532
G1 X123.064 Y108.949 E.06031
G1 X124.514 Y108.949 E.02532
G1 X124.514 Y107.499 E.02532
G1 X127.968 Y107.499 E.06031
G1 X127.968 Y108.949 E.02532
G1 X129.418 Y108.949 E.02532
G1 X129.418 Y112.404 E.06031
G1 X128.028 Y112.404 E.02427
; WIPE_START
G1 X127.968 Y113.854 E-.55147
G1 X127.419 Y113.854 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.942 Y109.378 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.942 Y107.928 E.02532
G1 X127.539 Y107.928 E.04535
G1 X127.539 Y109.378 E.02532
G1 X128.989 Y109.378 E.02532
G1 X128.989 Y111.975 E.04535
G1 X127.539 Y111.975 E.02532
G1 X127.539 Y113.425 E.02532
G1 X124.942 Y113.425 E.04535
G1 X124.942 Y111.975 E.02532
G1 X123.492 Y111.975 E.02532
G1 X123.492 Y109.378 E.04535
G1 X124.882 Y109.378 E.02427
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.334 Y114.454 Z2 F42000
G1 X119.106 Y117.435 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X119.064 Y117.171 E.00467
G1 X119.064 Y104.182 E.22678
G1 X119.106 Y103.918 E.00467
G3 X119.483 Y103.542 I.61 J.234 E.00957
G1 X119.747 Y103.5 E.00467
G1 X132.735 Y103.5 E.22678
G1 X132.912 Y103.528 E.00313
G3 X133.375 Y103.918 I-.078 J.563 E.01115
G1 X133.417 Y104.182 E.00467
G1 X133.417 Y117.171 E.22678
G1 X133.375 Y117.435 E.00467
G3 X132.999 Y117.811 I-.61 J-.233 E.00957
G1 X132.735 Y117.853 E.00467
G1 X119.747 Y117.853 E.22678
G1 X119.483 Y117.811 E.00467
G3 X119.13 Y117.49 I.234 J-.61 E.00852
M204 S10000
G1 X118.687 Y117.527 F42000
G1 F6000
M204 S6000
G1 X118.636 Y117.204 E.0057
G1 X118.636 Y104.149 E.22796
G1 X118.694 Y103.784 E.00644
G1 X118.838 Y103.5 E.00557
G1 X119.064 Y103.274 E.00557
G1 X119.348 Y103.129 E.00557
G1 X119.713 Y103.072 E.00644
G1 X132.769 Y103.072 E.22796
G1 X132.979 Y103.105 E.00372
G1 X133.133 Y103.129 E.00272
G1 X133.417 Y103.274 E.00557
G1 X133.643 Y103.5 E.00557
G1 X133.788 Y103.784 E.00557
G1 X133.846 Y104.149 E.00644
G1 X133.846 Y117.204 E.22796
G1 X133.788 Y117.569 E.00644
G1 X133.643 Y117.853 E.00557
G1 X133.417 Y118.079 E.00557
G1 X133.133 Y118.224 E.00557
G1 X132.769 Y118.281 E.00644
G1 X119.713 Y118.281 E.22796
G1 X119.348 Y118.224 E.00644
G1 X119.064 Y118.079 E.00557
G1 X118.838 Y117.853 E.00557
G1 X118.701 Y117.584 E.00527
M204 S250
G1 X118.279 Y117.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X118.222 Y117.219 E.00608
G1 X118.222 Y104.134 E.21246
G1 X118.295 Y103.655 E.00787
G1 X118.5 Y103.254 E.00731
G1 X118.818 Y102.935 E.00731
G1 X119.219 Y102.731 E.00731
G1 X119.699 Y102.658 E.00787
G1 X132.783 Y102.658 E.21246
G3 X133.044 Y102.696 I.009 J.843 E.0043
G1 X133.262 Y102.731 E.00359
G1 X133.663 Y102.935 E.00731
G1 X133.982 Y103.254 E.00731
G1 X134.186 Y103.655 E.00731
G1 X134.259 Y104.134 E.00787
G1 X134.259 Y117.219 E.21246
G1 X134.186 Y117.698 E.00787
G1 X133.982 Y118.099 E.00731
G1 X133.663 Y118.417 E.00731
G1 X133.262 Y118.622 E.00731
G1 X132.783 Y118.695 E.00787
G1 X119.699 Y118.695 E.21246
G1 X119.219 Y118.622 E.00787
G1 X118.818 Y118.417 E.00731
G1 X118.5 Y118.099 E.00731
G1 X118.295 Y117.698 E.00731
G1 X118.288 Y117.648 E.00082
; WIPE_START
M204 S6000
G1 X118.222 Y117.219 E-.16513
G1 X118.222 Y115.653 E-.59487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 16 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer16 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X119.839 Y117.439 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X132.702 Y117.439 E.20888
G1 X132.89 Y117.389 E.00315
G1 X132.96 Y117.287 E.00201
G1 X133.004 Y117.079 E.00346
G1 X133.004 Y104.24 E.20847
G1 X132.953 Y104.028 E.00354
G1 X132.852 Y103.957 E.00201
G1 X132.643 Y103.914 E.00346
G1 X119.779 Y103.914 E.20888
G1 X119.592 Y103.964 E.00315
G1 X119.522 Y104.066 E.00201
G1 X119.478 Y104.274 E.00346
G1 X119.478 Y117.138 E.20888
G1 X119.528 Y117.325 E.00315
G2 X119.78 Y117.427 I.247 J-.249 E.00452
M204 S10000
G1 X121.078 Y112.929 F42000
; LINE_WIDTH: 0.404978
G1 F8139
M204 S6000
G1 X121.064 Y112.618 E.00486
G1 X121.064 Y108.795 E.05973
M204 S10000
G1 X121.909 Y114.989 F42000
; LINE_WIDTH: 0.44616
G1 F8139
M204 S6000
G2 X121.902 Y115.081 I-.027 J.044 E.00364
M204 S10000
G1 X122.208 Y114.709 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X122.035 Y114.653 E.00296
G1 X121.471 Y114.305 E.01076
G1 X121.471 Y115.447 E.01853
G1 X122.612 Y115.447 E.01853
G1 X122.264 Y114.882 E.01076
G1 X122.227 Y114.766 E.00198
M204 S10000
G1 X122.544 Y114.374 F42000
; LINE_WIDTH: 0.419718
G1 F8139
M204 S6000
G1 X122.183 Y114.283 E.00603
G1 X121.663 Y113.963 E.00991
G1 X121.23 Y113.388 E.01168
G1 X121.078 Y112.929 E.00785
G2 X121.072 Y115.845 I344.23 J2.109 E.04733
G3 X124.299 Y115.853 I1.211 J162.327 E.05237
G1 X123.529 Y115.687 E.01278
G1 X122.955 Y115.254 E.01168
G1 X122.634 Y114.734 E.00991
G1 X122.558 Y114.432 E.00506
M204 S10000
G1 X122.905 Y114.013 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X122.511 Y113.971 E.00643
G1 X122.331 Y113.913 E.00307
M73 P69 R6
G1 X121.927 Y113.664 E.00772
G1 X121.59 Y113.217 E.00909
G1 X121.476 Y112.859 E.0061
G1 X121.455 Y112.618 E.00393
G1 X121.455 Y108.735 E.06305
G1 X121.59 Y108.136 E.00997
G1 X121.927 Y107.689 E.00909
G1 X122.331 Y107.44 E.00771
G1 X122.905 Y107.34 E.00945
G1 X122.946 Y106.947 E.00643
G1 X123.004 Y106.767 E.00307
G1 X123.253 Y106.362 E.00772
G1 X123.7 Y106.025 E.00909
G1 X124.058 Y105.911 E.0061
G1 X124.299 Y105.89 E.00393
G1 X128.182 Y105.89 E.06305
G1 X128.781 Y106.025 E.00997
G1 X129.228 Y106.362 E.00909
G1 X129.477 Y106.767 E.00771
G1 X129.577 Y107.34 E.00945
G1 X129.971 Y107.382 E.00643
G1 X130.15 Y107.44 E.00307
G1 X130.555 Y107.689 E.00771
G1 X130.892 Y108.136 E.00909
G1 X131.027 Y108.735 E.00997
G1 X131.027 Y112.618 E.06305
G1 X131.006 Y112.859 E.00393
G1 X130.892 Y113.217 E.0061
M73 P70 R6
G1 X130.555 Y113.664 E.00909
G1 X130.15 Y113.913 E.00772
G1 X129.577 Y114.013 E.00945
G1 X129.535 Y114.406 E.00643
G1 X129.477 Y114.586 E.00307
G1 X129.228 Y114.991 E.00772
G1 X128.781 Y115.328 E.00909
G1 X128.423 Y115.442 E.0061
G1 X128.182 Y115.463 E.00393
G1 X124.299 Y115.463 E.06305
G1 X123.7 Y115.328 E.00997
G1 X123.253 Y114.991 E.00909
G1 X123.004 Y114.586 E.00771
G1 X122.905 Y114.073 E.00849
M204 S10000
G1 X123.303 Y113.614 F42000
G1 F8139
M204 S6000
G1 X122.608 Y113.584 E.0113
G1 X122.19 Y113.365 E.00766
G1 X121.95 Y113.046 E.00649
G1 X121.853 Y112.618 E.00712
G1 X121.853 Y108.735 E.06305
G1 X121.95 Y108.307 E.00712
G1 X122.19 Y107.988 E.00649
G1 X122.608 Y107.769 E.00766
G1 X123.303 Y107.739 E.0113
G1 X123.333 Y107.043 E.0113
G1 X123.552 Y106.626 E.00766
G1 X123.872 Y106.385 E.00649
G1 X124.299 Y106.289 E.00712
G1 X128.182 Y106.289 E.06305
G1 X128.61 Y106.385 E.00712
G1 X128.929 Y106.626 E.00649
G1 X129.149 Y107.043 E.00766
G1 X129.178 Y107.739 E.0113
G1 X129.874 Y107.769 E.0113
G1 X130.291 Y107.988 E.00766
G1 X130.532 Y108.307 E.00649
G1 X130.628 Y108.735 E.00712
G1 X130.628 Y112.618 E.06305
G1 X130.532 Y113.046 E.00712
G1 X130.291 Y113.365 E.00649
G1 X129.874 Y113.584 E.00766
G1 X129.178 Y113.614 E.0113
G1 X129.149 Y114.31 E.0113
G1 X128.929 Y114.727 E.00766
G1 X128.61 Y114.968 E.00649
G1 X128.182 Y115.064 E.00712
G1 X124.299 Y115.064 E.06305
G1 X123.872 Y114.968 E.00712
G1 X123.552 Y114.727 E.00649
G1 X123.333 Y114.31 E.00766
G1 X123.306 Y113.674 E.01033
M204 S10000
G1 X123.702 Y113.216 F42000
G1 F8139
M204 S6000
G1 X122.849 Y113.216 E.01384
G3 X122.31 Y112.875 I.033 J-.65 E.01084
G1 X122.252 Y112.618 E.00427
G1 X122.252 Y108.735 E.06305
G1 X122.31 Y108.478 E.00427
G1 X122.454 Y108.287 E.00389
G1 X122.704 Y108.155 E.00459
G1 X123.702 Y108.137 E.0162
G1 X123.702 Y107.285 E.01384
G3 X124.043 Y106.745 I.65 J.033 E.01084
G1 X124.299 Y106.687 E.00427
G1 X128.182 Y106.687 E.06305
G1 X128.439 Y106.745 E.00427
G1 X128.63 Y106.89 E.00389
G1 X128.762 Y107.14 E.00459
G1 X128.78 Y108.137 E.0162
G1 X129.632 Y108.137 E.01384
G3 X130.172 Y108.478 I-.033 J.65 E.01084
G1 X130.23 Y108.735 E.00427
G1 X130.23 Y112.618 E.06305
G1 X130.172 Y112.875 E.00427
G1 X130.028 Y113.066 E.00389
G1 X129.777 Y113.198 E.00459
G1 X128.78 Y113.216 E.0162
G1 X128.78 Y114.068 E.01384
G3 X128.439 Y114.608 I-.65 J-.033 E.01084
G1 X128.182 Y114.666 E.00427
G1 X124.299 Y114.666 E.06305
G1 X124.043 Y114.608 E.00427
G1 X123.851 Y114.463 E.00389
G1 X123.719 Y114.213 E.00459
G1 X123.703 Y113.276 E.01522
M204 S10000
G1 X124.1 Y112.817 F42000
G1 F8139
M204 S6000
G1 X122.849 Y112.817 E.02031
G1 X122.718 Y112.767 E.00229
G1 X122.65 Y112.618 E.00266
G1 X122.65 Y108.735 E.06305
G1 X122.718 Y108.586 E.00266
G1 X122.849 Y108.536 E.00229
G1 X124.1 Y108.536 E.02031
G1 X124.1 Y107.285 E.02031
G1 X124.15 Y107.153 E.00229
G1 X124.299 Y107.086 E.00266
G1 X128.182 Y107.086 E.06305
G1 X128.332 Y107.153 E.00266
G1 X128.381 Y107.285 E.00229
G1 X128.381 Y108.536 E.02031
G1 X129.632 Y108.536 E.02031
G1 X129.764 Y108.586 E.00229
G1 X129.831 Y108.735 E.00266
G1 X129.831 Y112.618 E.06305
G1 X129.764 Y112.767 E.00266
G1 X129.632 Y112.817 E.00229
G1 X128.381 Y112.817 E.02031
G1 X128.381 Y114.068 E.02031
G1 X128.332 Y114.2 E.00229
G1 X128.182 Y114.267 E.00266
G1 X124.299 Y114.267 E.06305
G1 X124.15 Y114.2 E.00266
G1 X124.1 Y114.068 E.00229
G1 X124.1 Y112.877 E.01933
; WIPE_START
G1 F15000
G1 X124.1 Y114.068 E-.45248
G1 X124.15 Y114.2 E-.05356
G1 X124.299 Y114.267 E-.06229
G1 X124.804 Y114.267 E-.19167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.493 Y115.84 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.404978
G1 F8139
M204 S6000
G1 X128.182 Y115.853 E.00486
G1 X124.359 Y115.853 E.05973
M204 S10000
G1 X129.938 Y114.374 F42000
; LINE_WIDTH: 0.421491
G1 F8139
M204 S6000
G1 X129.847 Y114.734 E.00606
G1 X129.527 Y115.254 E.00996
G1 X128.952 Y115.687 E.01173
G1 X128.493 Y115.84 E.00789
G2 X131.409 Y115.845 I2.109 J-344.23 E.04754
G2 X131.404 Y112.929 I-130.988 J-1.211 E.04754
G1 X131.252 Y113.388 E.00789
G1 X130.819 Y113.963 E.01173
G1 X130.298 Y114.283 E.00996
G1 X129.996 Y114.359 E.00508
M204 S10000
G1 X130.273 Y114.709 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X130.217 Y114.882 E.00296
G1 X129.87 Y115.447 E.01076
G1 X131.011 Y115.447 E.01853
G1 X131.011 Y114.305 E.01853
G1 X130.446 Y114.653 E.01076
G1 X130.33 Y114.69 E.00198
M204 S10000
G1 X130.626 Y114.989 F42000
; LINE_WIDTH: 0.44616
G1 F8139
M204 S6000
G2 X130.619 Y115.081 I-.027 J.044 E.00363
M204 S10000
G1 X131.808 Y116.244 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X131.808 Y105.109 E.1808
G1 X120.674 Y105.109 E.1808
G1 X120.674 Y116.244 E.1808
G1 X131.748 Y116.244 E.17982
M204 S10000
G1 X132.207 Y116.642 F42000
G1 F8139
M204 S6000
G1 X132.207 Y104.711 E.19374
G1 X120.275 Y104.711 E.19374
G1 X120.275 Y116.642 E.19374
G1 X132.147 Y116.642 E.19276
M204 S10000
G1 X132.605 Y117.041 F42000
G1 F8139
M204 S6000
G1 X132.605 Y104.312 E.20668
G1 X119.876 Y104.312 E.20668
G1 X119.876 Y117.041 E.20668
G1 X132.545 Y117.041 E.20571
M204 S10000
G1 X131.417 Y108.735 F42000
; LINE_WIDTH: 0.404781
G1 F8139
M204 S6000
G1 X131.407 Y112.869 E.06456
M204 S10000
G1 X129.938 Y106.979 F42000
; LINE_WIDTH: 0.417744
G1 F8139
M204 S6000
G1 X130.298 Y107.07 E.006
G1 X130.819 Y107.39 E.00986
G1 X131.252 Y107.965 E.01162
G1 X131.417 Y108.735 E.01272
G3 X131.409 Y105.508 I162.319 J-2.017 E.05211
G3 X128.182 Y105.5 I-1.211 J-162.327 E.05211
G1 X128.952 Y105.665 E.01272
G1 X129.527 Y106.099 E.01162
G1 X129.847 Y106.619 E.00986
G1 X129.923 Y106.921 E.00503
M204 S10000
G1 X130.273 Y106.644 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X130.446 Y106.7 E.00296
G1 X131.011 Y107.048 E.01076
G1 X131.011 Y105.906 E.01853
G1 X129.87 Y105.906 E.01853
G1 X130.217 Y106.471 E.01076
G1 X130.255 Y106.587 E.00198
M204 S10000
G1 X130.626 Y106.272 F42000
; LINE_WIDTH: 0.44616
G1 F8139
M204 S6000
G2 X130.619 Y106.364 I-.027 J.044 E.00363
M204 S10000
G1 X123.989 Y105.513 F42000
; LINE_WIDTH: 0.404978
G1 F8139
M204 S6000
G1 X124.299 Y105.5 E.00486
G1 X128.122 Y105.5 E.05973
M204 S10000
G1 X122.544 Y106.979 F42000
; LINE_WIDTH: 0.419718
G1 F8139
M204 S6000
G1 X122.634 Y106.619 E.00603
G1 X122.955 Y106.099 E.00991
G1 X123.529 Y105.665 E.01168
G1 X123.989 Y105.513 E.00785
G2 X121.072 Y105.508 I-2.109 J344.23 E.04733
G3 X121.064 Y108.735 I-162.327 J1.211 E.05237
G1 X121.23 Y107.965 E.01278
G1 X121.663 Y107.39 E.01168
G1 X122.183 Y107.07 E.00991
G1 X122.485 Y106.994 E.00506
M204 S10000
G1 X122.208 Y106.644 F42000
; LINE_WIDTH: 0.41999
G1 F8139
M204 S6000
G1 X122.264 Y106.471 E.00296
G1 X122.612 Y105.906 E.01076
G1 X121.471 Y105.906 E.01853
G1 X121.471 Y107.048 E.01853
G1 X122.035 Y106.7 E.01076
G1 X122.151 Y106.662 E.00198
M204 S10000
G1 X121.909 Y106.272 F42000
; LINE_WIDTH: 0.44616
G1 F8139
M204 S6000
G2 X121.902 Y106.364 I-.027 J.044 E.00364
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X121.856 Y106.364 E-.17082
G1 X121.829 Y106.318 E-.19639
G1 X121.856 Y106.272 E-.19639
G1 X121.909 Y106.272 E-.19639
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 17/72
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S196.35
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.869 J.852 P1  F42000
G1 X125.356 Y109.791 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.895 Y103.613 Z2.1 F42000
G1 X133.101 Y102.661 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X133.292 Y102.691 E.00314
G1 X133.697 Y102.898 E.00739
G1 X134.019 Y103.22 E.00739
G1 X134.226 Y103.625 E.00739
G1 X134.3 Y104.11 E.00796
G1 X134.3 Y117.243 E.21325
G1 X134.226 Y117.727 E.00796
G1 X134.019 Y118.133 E.00739
G1 X133.697 Y118.455 E.00739
G1 X133.292 Y118.662 E.00739
G1 X132.807 Y118.735 E.00796
G1 X119.674 Y118.735 E.21325
G1 X119.19 Y118.662 E.00796
G1 X118.784 Y118.455 E.00739
G1 X118.462 Y118.133 E.00739
G1 X118.256 Y117.727 E.00739
G1 X118.182 Y117.243 E.00796
G1 X118.182 Y104.11 E.21325
G1 X118.256 Y103.625 E.00796
G1 X118.462 Y103.22 E.00739
G1 X118.784 Y102.898 E.00739
G1 X119.19 Y102.691 E.00739
G1 X119.674 Y102.618 E.00796
G1 X132.807 Y102.618 E.21325
G3 X133.043 Y102.647 I.009 J.897 E.00387
; WIPE_START
M204 S6000
G1 X133.292 Y102.691 E-.09605
G1 X133.697 Y102.898 E-.17297
G1 X134.019 Y103.22 E-.17298
G1 X134.226 Y103.625 E-.17298
G1 X134.283 Y104.003 E-.14502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 17 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.1 F4000
            G39.3 S1
            G0 Z2.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer17 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X132.773 Y102.837 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X134.08 Y104.144 E.03003
G1 X134.08 Y104.708
G1 X132.209 Y102.837 E.04297
G1 X131.646 Y102.837
G1 X134.08 Y105.271 E.05591
G1 X134.08 Y105.835
G1 X131.082 Y102.837 E.06885
G1 X130.518 Y102.837
G1 X134.08 Y106.399 E.0818
G1 X134.08 Y106.962
G1 X129.955 Y102.837 E.09474
G1 X129.391 Y102.837
G1 X134.08 Y107.526 E.10768
G1 X134.08 Y108.09
G1 X128.828 Y102.837 E.12063
G1 X128.264 Y102.837
G1 X134.08 Y108.653 E.13357
G1 X134.08 Y109.217
G1 X127.7 Y102.837 E.14651
G1 X127.137 Y102.837
G1 X134.08 Y109.78 E.15945
G1 X134.08 Y110.344
G1 X126.573 Y102.837 E.1724
G1 X126.01 Y102.837
G1 X134.08 Y110.908 E.18534
G1 X134.08 Y111.471
G1 X125.446 Y102.837 E.19828
G1 X124.882 Y102.837
G1 X134.08 Y112.035 E.21122
G1 X134.08 Y112.598
G1 X124.319 Y102.837 E.22417
G1 X123.755 Y102.837
G1 X134.08 Y113.162 E.23711
G1 X134.08 Y113.726
G1 X123.192 Y102.837 E.25005
G1 X122.628 Y102.837
G1 X134.08 Y114.289 E.26299
G1 X134.08 Y114.853
G1 X122.064 Y102.837 E.27594
G1 X121.501 Y102.837
G1 X126.786 Y108.122 E.12138
G1 X126.223 Y108.122
G1 X120.937 Y102.837 E.12138
G1 X120.374 Y102.837
G1 X125.659 Y108.122 E.12138
G1 X125.137 Y108.163
G1 X119.81 Y102.837 E.12232
G1 X119.305 Y102.895
G1 X125.137 Y108.727 E.13392
G1 X125.136 Y109.29
G1 X118.921 Y103.075 E.14274
G1 X118.639 Y103.356
G1 X124.854 Y109.572 E.14273
G1 X124.291 Y109.572
G1 X118.459 Y103.741 E.13392
G1 X118.401 Y104.246
G1 X123.727 Y109.572 E.12232
G1 X123.687 Y110.095
G1 X118.401 Y104.809 E.12138
G1 X118.401 Y105.373
G1 X123.687 Y110.659 E.12138
G1 X123.687 Y111.222
G1 X118.401 Y105.937 E.12138
; WIPE_START
M204 S6000
G1 X119.815 Y107.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.331 Y108.678 Z2.1 F42000
G1 X127.345 Y108.681 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X128.236 Y109.572 E.02047
G1 X128.795 Y110.131
G1 X134.08 Y115.416 E.12138
G1 X134.08 Y115.98
G1 X128.795 Y110.694 E.12138
G1 X128.795 Y111.258
G1 X134.08 Y116.544 E.12138
G1 X134.08 Y117.107
G1 X128.754 Y111.781 E.12232
G1 X128.19 Y111.781
G1 X134.022 Y117.612 E.13392
G1 X133.843 Y117.997
G1 X127.63 Y111.784 E.14266
G1 X127.347 Y112.064
G1 X133.561 Y118.278 E.1427
G1 X133.177 Y118.458
G1 X127.345 Y112.626 E.13392
G1 X127.345 Y113.19
G1 X132.671 Y118.516 E.12232
G1 X132.108 Y118.516
G1 X126.822 Y113.231 E.12138
G1 X126.259 Y113.231
G1 X131.544 Y118.516 E.12138
G1 X130.981 Y118.516
G1 X125.695 Y113.231 E.12138
M73 P71 R6
G1 X125.137 Y112.672
G1 X124.245 Y111.781 E.02047
; WIPE_START
M204 S6000
G1 X125.137 Y112.672 E-.4791
G1 X125.659 Y113.195 E-.2809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.049 Y108.02 Z2.1 F42000
G1 X118.401 Y106.5 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X130.417 Y118.516 E.27593
G1 X129.853 Y118.516
G1 X118.401 Y107.064 E.26299
G1 X118.401 Y107.627
G1 X129.29 Y118.516 E.25005
G1 X128.726 Y118.516
G1 X118.401 Y108.191 E.23711
G1 X118.401 Y108.755
G1 X128.163 Y118.516 E.22416
G1 X127.599 Y118.516
G1 X118.401 Y109.318 E.21122
G1 X118.401 Y109.882
G1 X127.035 Y118.516 E.19828
G1 X126.472 Y118.516
G1 X118.401 Y110.445 E.18534
G1 X118.401 Y111.009
G1 X125.908 Y118.516 E.17239
G1 X125.345 Y118.516
G1 X118.401 Y111.573 E.15945
G1 X118.401 Y112.136
G1 X124.781 Y118.516 E.14651
G1 X124.217 Y118.516
G1 X118.401 Y112.7 E.13357
G1 X118.401 Y113.264
G1 X123.654 Y118.516 E.12062
G1 X123.09 Y118.516
G1 X118.401 Y113.827 E.10768
G1 X118.401 Y114.391
G1 X122.526 Y118.516 E.09474
G1 X121.963 Y118.516
G1 X118.401 Y114.954 E.08179
G1 X118.401 Y115.518
G1 X121.399 Y118.516 E.06885
G1 X120.836 Y118.516
G1 X118.401 Y116.082 E.05591
G1 X118.401 Y116.645
G1 X120.272 Y118.516 E.04297
G1 X119.708 Y118.516
G1 X118.401 Y117.209 E.03002
; WIPE_START
M204 S6000
G1 X119.708 Y118.516 E-.70263
G1 X119.859 Y118.516 E-.05738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.932 Y112.813 Z2.1 F42000
G1 X127.797 Y109.592 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.263449
G1 F15000
M204 S6000
G2 X127.325 Y109.125 I-5.011 J4.583 E.00655
; WIPE_START
G1 X127.797 Y109.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.156 Y108.364 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.0452452
G1 F15000
M204 S6000
G1 X125.139 Y108.372 E.00002
; LINE_WIDTH: 0.0943093
G1 X125.121 Y108.379 E.00006
G1 X125.047 Y108.253 E.00043
M204 S10000
G1 X123.818 Y109.482 F42000
; LINE_WIDTH: 0.0965513
G1 F15000
M204 S6000
G1 X123.943 Y109.557 E.00045
; LINE_WIDTH: 0.0767761
G1 X123.936 Y109.574 E.00004
; LINE_WIDTH: 0.045288
G1 X123.929 Y109.592 E.00002
; WIPE_START
G1 X123.936 Y109.574 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.156 Y112.223 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.264375
G1 F15000
M204 S6000
G1 X124.692 Y111.761 E.00648
; WIPE_START
G1 X125.156 Y112.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.966 Y117.819 Z2.1 F42000
G1 X119.349 Y118.484 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.135912
G1 F15000
M204 S6000
G1 X119.221 Y118.391 E.00074
; LINE_WIDTH: 0.174758
G1 X119.094 Y118.298 E.00099
; LINE_WIDTH: 0.227076
G3 X118.712 Y117.951 I.902 J-1.376 E.00433
; LINE_WIDTH: 0.213602
G1 X118.619 Y117.824 E.00124
; LINE_WIDTH: 0.174754
G1 X118.526 Y117.696 E.00099
; LINE_WIDTH: 0.135905
G1 X118.434 Y117.568 E.00074
M204 S10000
G1 X118.565 Y103.565 F42000
; LINE_WIDTH: 0.0854841
G1 F15000
M204 S6000
G2 X118.459 Y103.717 I.47 J.441 E.00048
M204 S10000
G1 X119.279 Y102.892 F42000
; LINE_WIDTH: 0.087829
G1 F15000
M204 S6000
G1 X119.129 Y103.001 E.0005
; WIPE_START
G1 X119.279 Y102.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.898 Y103.353 Z2.1 F42000
G1 X134.048 Y103.785 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.136002
G1 F15000
M204 S6000
G1 X133.955 Y103.657 E.00074
; LINE_WIDTH: 0.174845
G1 X133.862 Y103.529 E.00099
; LINE_WIDTH: 0.227163
G2 X133.516 Y103.148 I-1.377 J.902 E.00434
; LINE_WIDTH: 0.213679
G1 X133.388 Y103.055 E.00124
; LINE_WIDTH: 0.174842
G1 X133.26 Y102.962 E.00099
; LINE_WIDTH: 0.136006
G1 X133.132 Y102.869 E.00074
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X133.26 Y102.962 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 18/72
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S201.45
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I-.861 J-.86 P1  F42000
G1 X118.824 Y117.399 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
M204 S5000
G1 X118.772 Y117.295 E.00189
G1 X118.709 Y116.902 E.00646
G1 X118.709 Y104.45 E.2022
G1 X118.772 Y104.058 E.00646
G1 X118.96 Y103.688 E.00673
G1 X118.992 Y103.656 E.00074
G1 X119.253 Y103.395 E.00599
G1 X119.622 Y103.207 E.00673
G1 X120.015 Y103.145 E.00646
G1 X132.467 Y103.145 E.2022
G1 X132.86 Y103.207 E.00646
G1 X133.229 Y103.395 E.00673
G1 X133.522 Y103.688 E.00673
G1 X133.71 Y104.058 E.00673
G1 X133.772 Y104.45 E.00646
G1 X133.772 Y116.902 E.2022
G1 X133.71 Y117.295 E.00646
G1 X133.522 Y117.665 E.00673
G1 X133.229 Y117.958 E.00673
G1 X132.86 Y118.146 E.00673
G1 X132.467 Y118.208 E.00646
G1 X120.015 Y118.208 E.2022
G1 X119.622 Y118.146 E.00646
G1 X119.253 Y117.958 E.00673
G1 X118.96 Y117.664 E.00673
G1 X118.852 Y117.452 E.00387
; WIPE_START
G1 F3600
M204 S6000
G1 X118.772 Y117.295 E-.067
G1 X118.709 Y116.902 E-.15113
G1 X118.709 Y115.477 E-.54187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.407 Y110.398 Z2.2 F42000
G1 X133.133 Y102.622 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2417
M204 S5000
G1 X133.321 Y102.652 E.00308
G1 X133.731 Y102.861 E.00747
G1 X134.057 Y103.186 E.00747
G1 X134.266 Y103.596 E.00747
G1 X134.34 Y104.086 E.00804
G1 X134.34 Y117.267 E.21404
G1 X134.266 Y117.757 E.00804
G1 X134.057 Y118.167 E.00747
G1 X133.731 Y118.492 E.00747
G1 X133.321 Y118.701 E.00747
G1 X132.832 Y118.776 E.00804
G1 X119.65 Y118.776 E.21404
G1 X119.16 Y118.701 E.00804
G1 X118.75 Y118.492 E.00747
G1 X118.425 Y118.167 E.00747
G1 X118.216 Y117.757 E.00747
G1 X118.141 Y117.267 E.00804
G1 X118.141 Y104.086 E.21404
G1 X118.216 Y103.596 E.00804
G1 X118.425 Y103.186 E.00747
G1 X118.75 Y102.861 E.00747
G1 X119.16 Y102.652 E.00747
G1 X119.65 Y102.577 E.00804
G1 X132.832 Y102.577 E.21404
G3 X133.076 Y102.606 I.009 J.951 E.00401
; WIPE_START
G1 F3600
M204 S6000
G1 X133.321 Y102.652 E-.09476
G1 X133.731 Y102.861 E-.17489
G1 X134.057 Y103.186 E-.17491
G1 X134.266 Y103.596 E-.17491
G1 X134.321 Y103.962 E-.14053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 18 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer18 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.011 Y104 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.222348
G1 F2417
M204 S6000
G1 X134.043 Y104.257 E.00212
; LINE_WIDTH: 0.189926
G1 X134.056 Y104.422 E.00114
; LINE_WIDTH: 0.176153
G1 X134.056 Y116.919 E.07876
G1 X134.043 Y117.096 E.00112
; LINE_WIDTH: 0.21591
G1 X134.03 Y117.261 E.00131
; LINE_WIDTH: 0.240518
G3 X133.965 Y117.527 I-.99 J-.099 E.00245
; LINE_WIDTH: 0.292899
G1 X133.926 Y117.647 E.00139
; LINE_WIDTH: 0.329029
G3 X133.457 Y118.232 I-1.19 J-.472 E.00954
; LINE_WIDTH: 0.306826
G3 X133.092 Y118.401 I-.989 J-1.667 E.00469
; LINE_WIDTH: 0.253711
G1 X132.973 Y118.439 E.00119
; LINE_WIDTH: 0.222348
G3 X132.66 Y118.478 I-.38 J-1.778 E.00258
; LINE_WIDTH: 0.189926
G1 X132.495 Y118.491 E.00114
; LINE_WIDTH: 0.176153
G1 X119.998 Y118.492 E.07876
G1 X119.821 Y118.478 E.00112
; LINE_WIDTH: 0.215923
G1 X119.656 Y118.465 E.00131
; LINE_WIDTH: 0.240563
G3 X119.39 Y118.401 I.099 J-.99 E.00245
; LINE_WIDTH: 0.292933
G1 X119.271 Y118.362 E.00139
; LINE_WIDTH: 0.329044
G3 X118.685 Y117.893 I.472 J-1.19 E.00954
; LINE_WIDTH: 0.306842
G3 X118.516 Y117.527 I1.668 J-.99 E.00469
; LINE_WIDTH: 0.253711
G1 X118.478 Y117.408 E.00119
; LINE_WIDTH: 0.22236
G3 X118.439 Y117.096 I1.779 J-.38 E.00258
; LINE_WIDTH: 0.189931
G1 X118.426 Y116.931 E.00114
; LINE_WIDTH: 0.175971
G1 X118.426 Y104.422 E.07875
; LINE_WIDTH: 0.189917
G1 X118.439 Y104.257 E.00114
; LINE_WIDTH: 0.21591
G1 X118.452 Y104.092 E.00131
; LINE_WIDTH: 0.240525
G3 X118.516 Y103.826 I.99 J.099 E.00245
; LINE_WIDTH: 0.29291
G1 X118.555 Y103.706 E.00139
; LINE_WIDTH: 0.329033
M73 P72 R6
G3 X119.024 Y103.121 I1.19 J.472 E.00954
; LINE_WIDTH: 0.30683
G3 X119.39 Y102.952 I.99 J1.668 E.00469
; LINE_WIDTH: 0.253711
G1 X119.509 Y102.913 E.00119
; LINE_WIDTH: 0.222348
G3 X119.821 Y102.874 I.38 J1.778 E.00258
; LINE_WIDTH: 0.189926
G1 X119.986 Y102.861 E.00114
; LINE_WIDTH: 0.176153
G1 X132.483 Y102.861 E.07876
G1 X132.66 Y102.874 E.00112
; LINE_WIDTH: 0.215909
G1 X132.825 Y102.887 E.00131
; LINE_WIDTH: 0.238393
G3 X133.074 Y102.946 I-.09 J.933 E.00227
; LINE_WIDTH: 0.290047
G1 X133.211 Y102.991 E.00157
; LINE_WIDTH: 0.329029
G3 X133.797 Y103.46 I-.472 J1.19 E.00955
; LINE_WIDTH: 0.306826
G3 X133.965 Y103.826 I-1.667 J.989 E.00469
; LINE_WIDTH: 0.253711
G1 X134.003 Y103.941 E.00115
; WIPE_START
G1 F15000
G1 X134.043 Y104.257 E-.12098
G1 X134.056 Y104.422 E-.06292
G1 X134.056 Y105.938 E-.5761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.915 Y108.633 Z2.2 F42000
G1 X124.942 Y109.378 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.334 J2.585 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2417
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17439
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2417
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20275
G1 X124.4 Y112.022 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.636 Y111.34 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
M204 S5000
G3 X126.442 Y107.994 I2.606 J-.663 E.08273
G3 X126.708 Y113.325 I-.205 J2.682 E.12622
G3 X123.651 Y111.398 I-.466 J-2.649 E.06435
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.1246
G1 X123.554 Y110.811 E-.10192
G1 X123.554 Y110.542 E-.10187
G1 X123.581 Y110.276 E-.10191
G1 X123.634 Y110.013 E-.10186
G1 X123.713 Y109.756 E-.10197
G1 X123.817 Y109.509 E-.10184
G1 X123.848 Y109.454 E-.02402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 19/72
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-1.027 J-.653 P1  F42000
G1 X118.779 Y117.418 Z2.2
G1 Z1.9
G1 E.8 F1800
G1 F2434
M204 S5000
G1 X118.73 Y117.322 E.00176
G1 X118.666 Y116.922 E.00658
G1 X118.666 Y104.431 E.20281
G1 X118.73 Y104.031 E.00658
G1 X118.921 Y103.655 E.00685
G1 X119.22 Y103.357 E.00685
G1 X119.596 Y103.166 E.00685
G1 X119.996 Y103.102 E.00658
G1 X132.486 Y103.102 E.20281
G1 X132.886 Y103.166 E.00658
G1 X133.262 Y103.357 E.00685
G1 X133.56 Y103.655 E.00685
G1 X133.752 Y104.031 E.00685
G1 X133.815 Y104.431 E.00658
G1 X133.815 Y116.922 E.20281
G1 X133.752 Y117.322 E.00658
G1 X133.56 Y117.698 E.00685
G1 X133.262 Y117.996 E.00685
G1 X132.886 Y118.187 E.00685
G1 X132.486 Y118.251 E.00658
G1 X119.996 Y118.251 E.20281
G1 X119.596 Y118.187 E.00658
G1 X119.22 Y117.996 E.00685
G1 X118.921 Y117.698 E.00685
G1 X118.806 Y117.471 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X118.73 Y117.322 E-.06388
G1 X118.666 Y116.922 E-.15396
G1 X118.666 Y115.495 E-.54217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.367 Y110.419 Z2.3 F42000
G1 X133.168 Y102.583 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F2434
M204 S5000
G1 X133.35 Y102.612 E.00299
G1 X133.765 Y102.823 E.00756
G1 X134.094 Y103.152 E.00756
G1 X134.305 Y103.567 E.00756
G1 X134.381 Y104.061 E.00812
G1 X134.381 Y117.292 E.21483
G1 X134.305 Y117.786 E.00812
G1 X134.094 Y118.201 E.00756
G1 X133.765 Y118.53 E.00756
G1 X133.35 Y118.741 E.00756
G1 X132.856 Y118.816 E.00812
G1 X119.626 Y118.816 E.21483
G1 X119.131 Y118.741 E.00812
G1 X118.717 Y118.53 E.00756
G1 X118.387 Y118.201 E.00756
G1 X118.176 Y117.786 E.00756
G1 X118.101 Y117.292 E.00812
G1 X118.101 Y104.061 E.21483
G1 X118.176 Y103.567 E.00812
G1 X118.387 Y103.152 E.00756
G1 X118.716 Y102.823 E.00756
G1 X119.131 Y102.612 E.00756
G1 X119.626 Y102.536 E.00812
G1 X132.856 Y102.536 E.21483
G3 X133.111 Y102.567 I.009 J1.005 E.00418
; WIPE_START
G1 F3600
M204 S6000
G1 X133.35 Y102.612 E-.09267
G1 X133.765 Y102.823 E-.17683
G1 X134.094 Y103.152 E-.17684
G1 X134.305 Y103.567 E-.17683
G1 X134.36 Y103.923 E-.13683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 19 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.3 F4000
            G39.3 S1
            G0 Z2.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer19 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.05 Y103.961 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.220742
G1 F2434
M204 S6000
G1 X134.084 Y104.235 E.00224
; LINE_WIDTH: 0.1878
G1 X134.097 Y104.403 E.00114
; LINE_WIDTH: 0.173839
G1 X134.098 Y116.938 E.07782
G1 X134.084 Y117.118 E.00112
; LINE_WIDTH: 0.214228
G1 X134.071 Y117.285 E.00132
; LINE_WIDTH: 0.239172
G3 X134.006 Y117.555 I-1 J-.1 E.00247
; LINE_WIDTH: 0.292213
G1 X133.966 Y117.676 E.0014
; LINE_WIDTH: 0.328821
G3 X133.49 Y118.271 I-1.208 J-.479 E.00968
; LINE_WIDTH: 0.306338
G3 X133.119 Y118.441 I-1.007 J-1.699 E.00475
; LINE_WIDTH: 0.25248
G1 X132.999 Y118.481 E.0012
; LINE_WIDTH: 0.220742
G3 X132.682 Y118.52 I-.386 J-1.814 E.00259
; LINE_WIDTH: 0.1878
G1 X132.514 Y118.533 E.00114
; LINE_WIDTH: 0.173839
G1 X119.979 Y118.534 E.07782
G1 X119.8 Y118.52 E.00112
; LINE_WIDTH: 0.214228
G1 X119.632 Y118.507 E.00132
; LINE_WIDTH: 0.239172
G3 X119.362 Y118.441 I.1 J-1 E.00247
; LINE_WIDTH: 0.292213
G1 X119.241 Y118.402 E.0014
; LINE_WIDTH: 0.328821
G3 X118.647 Y117.926 I.479 J-1.208 E.00968
; LINE_WIDTH: 0.306336
G3 X118.476 Y117.555 I1.699 J-1.007 E.00475
; LINE_WIDTH: 0.25248
G1 X118.437 Y117.434 E.0012
; LINE_WIDTH: 0.220742
G3 X118.397 Y117.118 I1.814 J-.386 E.00259
; LINE_WIDTH: 0.1878
G1 X118.384 Y116.95 E.00114
; LINE_WIDTH: 0.173651
G1 X118.384 Y104.403 E.0778
; LINE_WIDTH: 0.187809
G1 X118.397 Y104.235 E.00114
; LINE_WIDTH: 0.214228
G1 X118.41 Y104.067 E.00132
; LINE_WIDTH: 0.239172
G3 X118.476 Y103.798 I1 J.1 E.00247
; LINE_WIDTH: 0.292213
G1 X118.515 Y103.677 E.0014
; LINE_WIDTH: 0.328826
G3 X118.991 Y103.082 I1.208 J.479 E.00968
; LINE_WIDTH: 0.306366
G3 X119.362 Y102.912 I1.007 J1.699 E.00475
; LINE_WIDTH: 0.252479
G1 X119.483 Y102.872 E.0012
; LINE_WIDTH: 0.220742
G3 X119.8 Y102.833 I.386 J1.812 E.00259
; LINE_WIDTH: 0.1878
G1 X119.967 Y102.82 E.00114
; LINE_WIDTH: 0.173839
G1 X132.502 Y102.819 E.07782
G1 X132.682 Y102.833 E.00112
; LINE_WIDTH: 0.21423
G1 X132.85 Y102.846 E.00132
; LINE_WIDTH: 0.238631
G3 X133.115 Y102.91 I-.098 J.986 E.00242
; LINE_WIDTH: 0.291499
G1 X133.24 Y102.951 E.00145
; LINE_WIDTH: 0.328818
G3 X133.835 Y103.427 I-.479 J1.207 E.00968
; LINE_WIDTH: 0.306334
G3 X134.006 Y103.798 I-1.699 J1.007 E.00475
; LINE_WIDTH: 0.25248
G1 X134.04 Y103.902 E.00104
; WIPE_START
G1 F15000
G1 X134.084 Y104.235 E-.12761
G1 X134.097 Y104.403 E-.06397
G1 X134.097 Y105.899 E-.56842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.963 Y108.61 Z2.3 F42000
G1 X124.942 Y109.378 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2434
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.336 J2.586 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2434
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17438
M73 P73 R6
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
G1 F2434
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17437
G1 X127.539 Y112.562 E-.1498
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
G1 F2434
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.759 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21354
G1 X124.942 Y112.585 E-.23945
G1 X124.573 Y112.224 E-.20273
G1 X124.4 Y112.022 E-.10428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.638 Y111.339 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G3 X126.442 Y107.994 I2.606 J-.663 E.08268
G3 X126.708 Y113.325 I-.205 J2.682 E.12622
G3 X123.654 Y111.397 I-.463 J-2.649 E.06431
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12461
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10186
G1 X123.581 Y110.276 E-.10191
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.756 E-.10195
G1 X123.817 Y109.509 E-.10185
G1 X123.848 Y109.454 E-.02402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 20/72
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I-1.024 J-.657 P1  F42000
G1 X118.729 Y117.428 Z2.3
G1 Z2
G1 E.8 F1800
G1 F2444
M204 S5000
G1 X118.688 Y117.348 E.00145
G1 X118.624 Y116.941 E.0067
G1 X118.624 Y104.412 E.20343
G1 X118.688 Y104.005 E.0067
G1 X118.883 Y103.622 E.00697
G1 X119.187 Y103.319 E.00697
G1 X119.569 Y103.124 E.00697
G1 X119.977 Y103.059 E.0067
G1 X132.505 Y103.059 E.20343
G1 X132.912 Y103.124 E.0067
G1 X133.295 Y103.319 E.00697
G1 X133.598 Y103.622 E.00697
G1 X133.793 Y104.005 E.00697
G1 X133.858 Y104.412 E.0067
G1 X133.858 Y116.941 E.20343
G1 X133.793 Y117.348 E.0067
G1 X133.598 Y117.731 E.00697
G1 X133.295 Y118.034 E.00697
G1 X132.912 Y118.229 E.00697
G1 X132.505 Y118.294 E.0067
G1 X119.977 Y118.294 E.20343
G1 X119.569 Y118.229 E.0067
G1 X119.187 Y118.034 E.00697
G1 X118.883 Y117.731 E.00697
G1 X118.756 Y117.481 E.00455
; WIPE_START
G1 F3600
M204 S6000
G1 X118.688 Y117.348 E-.05677
G1 X118.624 Y116.941 E-.15678
G1 X118.624 Y115.503 E-.54646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.329 Y110.432 Z2.4 F42000
G1 X133.205 Y102.544 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2444
M204 S5000
G1 X133.208 Y102.545 E.00005
G1 X133.38 Y102.572 E.00282
G1 X133.799 Y102.786 E.00764
G1 X134.132 Y103.118 E.00764
G1 X134.345 Y103.537 E.00764
G1 X134.421 Y104.037 E.0082
G1 X134.421 Y117.316 E.21562
G1 X134.345 Y117.815 E.0082
G1 X134.132 Y118.235 E.00764
G1 X133.799 Y118.567 E.00764
G1 X133.38 Y118.781 E.00764
G1 X132.88 Y118.857 E.0082
G1 X119.601 Y118.857 E.21562
G1 X119.102 Y118.781 E.0082
G1 X118.683 Y118.567 E.00764
G1 X118.35 Y118.235 E.00764
G1 X118.136 Y117.815 E.00764
G1 X118.06 Y117.316 E.0082
G1 X118.06 Y104.037 E.21562
G1 X118.136 Y103.537 E.0082
G1 X118.35 Y103.118 E.00764
G1 X118.683 Y102.786 E.00764
G1 X119.102 Y102.572 E.00764
G1 X119.601 Y102.496 E.0082
G1 X132.88 Y102.496 E.21562
G1 X133.145 Y102.536 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X133.208 Y102.545 E-.02403
G1 X133.38 Y102.572 E-.06609
G1 X133.799 Y102.786 E-.17875
G1 X134.132 Y103.118 E-.17877
G1 X134.345 Y103.537 E-.17876
G1 X134.398 Y103.885 E-.13359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 20 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer20 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.09 Y103.923 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219144
G1 F2444
M204 S6000
G1 X134.126 Y104.214 E.00236
; LINE_WIDTH: 0.185704
G1 X134.139 Y104.384 E.00114
; LINE_WIDTH: 0.171534
G1 X134.14 Y116.957 E.07688
G1 X134.126 Y117.139 E.00112
; LINE_WIDTH: 0.212546
G1 X134.112 Y117.31 E.00133
; LINE_WIDTH: 0.237828
G3 X134.046 Y117.583 I-1.009 J-.1 E.00248
; LINE_WIDTH: 0.291544
G1 X134.006 Y117.705 E.00142
; LINE_WIDTH: 0.328611
G3 X133.523 Y118.309 I-1.225 J-.486 E.00982
; LINE_WIDTH: 0.305849
G3 X133.147 Y118.482 I-1.024 J-1.731 E.0048
; LINE_WIDTH: 0.251254
G1 X133.025 Y118.522 E.00121
; LINE_WIDTH: 0.219144
G3 X132.704 Y118.561 I-.393 J-1.848 E.00261
; LINE_WIDTH: 0.185704
G1 X132.533 Y118.575 E.00115
; LINE_WIDTH: 0.171534
G1 X119.96 Y118.575 E.07688
G1 X119.778 Y118.561 E.00112
; LINE_WIDTH: 0.212546
G1 X119.607 Y118.548 E.00133
; LINE_WIDTH: 0.237828
G3 X119.334 Y118.482 I.1 J-1.009 E.00248
; LINE_WIDTH: 0.291544
G1 X119.212 Y118.442 E.00142
; LINE_WIDTH: 0.328611
G3 X118.609 Y117.959 I.486 J-1.225 E.00982
; LINE_WIDTH: 0.30585
G3 X118.435 Y117.583 I1.731 J-1.024 E.0048
; LINE_WIDTH: 0.251254
G1 X118.396 Y117.46 E.00121
; LINE_WIDTH: 0.219145
G3 X118.356 Y117.139 I1.848 J-.392 E.00261
; LINE_WIDTH: 0.185704
G1 X118.342 Y116.969 E.00114
; LINE_WIDTH: 0.171341
G1 X118.342 Y104.384 E.07685
; LINE_WIDTH: 0.185689
G1 X118.356 Y104.214 E.00114
; LINE_WIDTH: 0.212546
G1 X118.369 Y104.043 E.00133
; LINE_WIDTH: 0.237828
G3 X118.435 Y103.77 I1.009 J.1 E.00248
; LINE_WIDTH: 0.291544
G1 X118.475 Y103.648 E.00142
; LINE_WIDTH: 0.328611
G3 X118.958 Y103.044 I1.225 J.486 E.00982
; LINE_WIDTH: 0.30585
G3 X119.334 Y102.871 I1.024 J1.731 E.0048
; LINE_WIDTH: 0.251254
G1 X119.457 Y102.831 E.00121
; LINE_WIDTH: 0.219145
G3 X119.778 Y102.791 I.392 J1.848 E.00261
; LINE_WIDTH: 0.185704
G1 X119.949 Y102.778 E.00114
; LINE_WIDTH: 0.171534
G1 X132.521 Y102.778 E.07688
G1 X132.704 Y102.791 E.00112
; LINE_WIDTH: 0.212551
G1 X132.874 Y102.805 E.00133
; LINE_WIDTH: 0.238928
G3 X133.156 Y102.874 I-.105 J1.038 E.00258
; LINE_WIDTH: 0.292968
G1 X133.27 Y102.911 E.00132
; LINE_WIDTH: 0.328613
G3 X133.873 Y103.394 I-.486 J1.225 E.00982
; LINE_WIDTH: 0.305849
G3 X134.046 Y103.77 I-1.73 J1.024 E.00481
; LINE_WIDTH: 0.251254
G1 X134.077 Y103.865 E.00093
; WIPE_START
G1 F15000
G1 X134.126 Y104.214 E-.13379
G1 X134.139 Y104.384 E-.06502
G1 X134.139 Y105.861 E-.56119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.01 Y108.587 Z2.4 F42000
G1 X124.942 Y109.378 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.336 J2.587 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14981
G1 X128.136 Y109.378 E-.17436
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F2444
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00788
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14976
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F2444
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20273
G1 X124.4 Y112.022 E-.10428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.634 Y111.34 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
M204 S5000
G3 X126.442 Y107.994 I2.607 J-.664 E.08276
G3 X126.708 Y113.325 I-.205 J2.682 E.12622
G3 X123.65 Y111.398 I-.467 J-2.649 E.06436
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12465
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10186
G1 X123.581 Y110.276 E-.10189
G1 X123.634 Y110.013 E-.10189
G1 X123.713 Y109.757 E-.10193
G1 X123.817 Y109.509 E-.10191
G1 X123.848 Y109.454 E-.02394
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 21/72
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-1.022 J-.661 P1  F42000
G1 X118.679 Y117.438 Z2.4
G1 Z2.1
G1 E.8 F1800
G1 F2454
M204 S5000
G1 X118.646 Y117.374 E.00115
G1 X118.581 Y116.96 E.00682
G1 X118.581 Y104.393 E.20405
G1 X118.646 Y103.978 E.00682
G1 X118.845 Y103.589 E.00709
G1 X118.929 Y103.505 E.00194
G1 X119.154 Y103.28 E.00515
G1 X119.543 Y103.082 E.00709
G1 X119.958 Y103.016 E.00682
G1 X132.524 Y103.016 E.20405
G1 X132.939 Y103.082 E.00682
G1 X133.328 Y103.28 E.00709
G1 X133.637 Y103.589 E.00709
G1 X133.835 Y103.978 E.00709
G1 X133.901 Y104.393 E.00682
G1 X133.901 Y116.96 E.20405
G1 X133.835 Y117.374 E.00682
G1 X133.637 Y117.764 E.00709
G1 X133.328 Y118.072 E.00709
G1 X132.939 Y118.271 E.00709
G1 X132.524 Y118.336 E.00682
G1 X119.958 Y118.336 E.20405
G1 X119.543 Y118.271 E.00682
G1 X119.154 Y118.072 E.00709
G1 X118.845 Y117.764 E.00709
G1 X118.706 Y117.491 E.00497
; WIPE_START
G1 F3600
M204 S6000
G1 X118.646 Y117.374 E-.04967
G1 X118.581 Y116.96 E-.15961
G1 X118.581 Y115.51 E-.55072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.291 Y110.446 Z2.5 F42000
G1 X133.243 Y102.506 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F2454
M204 S5000
G1 X133.249 Y102.507 E.0001
G1 X133.409 Y102.532 E.00263
G1 X133.833 Y102.748 E.00772
G1 X134.169 Y103.084 E.00772
G1 X134.385 Y103.508 E.00772
G1 X134.462 Y104.013 E.00829
G1 X134.462 Y117.34 E.21641
G1 X134.385 Y117.845 E.00829
G1 X134.169 Y118.268 E.00772
G1 X133.833 Y118.605 E.00772
G1 X133.409 Y118.821 E.00772
G1 X132.905 Y118.898 E.00829
G1 X119.577 Y118.898 E.21641
G1 X119.072 Y118.821 E.00829
G1 X118.649 Y118.605 E.00772
G1 X118.313 Y118.268 E.00772
G1 X118.097 Y117.845 E.00772
G1 X118.02 Y117.34 E.00829
G1 X118.02 Y104.013 E.21641
G1 X118.097 Y103.508 E.00829
G1 X118.313 Y103.084 E.00772
G1 X118.649 Y102.748 E.00772
G1 X119.072 Y102.532 E.00772
G1 X119.577 Y102.455 E.00829
G1 X132.905 Y102.455 E.21641
G1 X133.184 Y102.497 E.00458
; WIPE_START
G1 F3600
M204 S6000
G1 X133.249 Y102.507 E-.02514
G1 X133.409 Y102.532 E-.06159
G1 X133.833 Y102.748 E-.18069
G1 X134.169 Y103.084 E-.1807
G1 X134.385 Y103.508 E-.18068
G1 X134.437 Y103.849 E-.13121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 21 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.5 F4000
            G39.3 S1
            G0 Z2.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer21 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.129 Y103.888 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.217534
G1 F2454
M204 S6000
G1 X134.167 Y104.192 E.00245
; LINE_WIDTH: 0.18357
G1 X134.181 Y104.365 E.00115
; LINE_WIDTH: 0.169219
G1 X134.181 Y116.976 E.07592
G1 X134.167 Y117.161 E.00112
; LINE_WIDTH: 0.210868
G1 X134.154 Y117.334 E.00134
; LINE_WIDTH: 0.236489
G3 X134.087 Y117.611 I-1.019 J-.101 E.0025
; LINE_WIDTH: 0.290875
G1 X134.046 Y117.735 E.00143
; LINE_WIDTH: 0.328419
G3 X133.556 Y118.347 I-1.256 J-.503 E.00995
; LINE_WIDTH: 0.30536
G3 X133.175 Y118.522 I-1.041 J-1.761 E.00486
; LINE_WIDTH: 0.250029
G1 X133.051 Y118.563 E.00122
; LINE_WIDTH: 0.217534
G3 X132.725 Y118.603 I-.399 J-1.884 E.00262
; LINE_WIDTH: 0.18357
G1 X132.552 Y118.617 E.00115
; LINE_WIDTH: 0.169219
G1 X119.941 Y118.617 E.07592
G1 X119.756 Y118.603 E.00112
; LINE_WIDTH: 0.210868
G1 X119.583 Y118.589 E.00134
; LINE_WIDTH: 0.236489
G3 X119.307 Y118.522 I.101 J-1.019 E.0025
; LINE_WIDTH: 0.290875
G1 X119.182 Y118.482 E.00143
; LINE_WIDTH: 0.328419
G3 X118.57 Y117.992 I.503 J-1.256 E.00995
; LINE_WIDTH: 0.30536
G3 X118.395 Y117.611 I1.761 J-1.041 E.00486
; LINE_WIDTH: 0.250029
G1 X118.355 Y117.486 E.00122
; LINE_WIDTH: 0.217534
G3 X118.314 Y117.161 I1.884 J-.399 E.00262
; LINE_WIDTH: 0.18357
G1 X118.301 Y116.988 E.00115
; LINE_WIDTH: 0.169021
G1 X118.301 Y104.365 E.07589
; LINE_WIDTH: 0.183583
G1 X118.314 Y104.192 E.00115
; LINE_WIDTH: 0.210868
G1 X118.328 Y104.019 E.00134
; LINE_WIDTH: 0.236489
G3 X118.395 Y103.742 I1.019 J.101 E.0025
; LINE_WIDTH: 0.290875
M73 P74 R6
G1 X118.435 Y103.618 E.00143
; LINE_WIDTH: 0.328423
G3 X118.925 Y103.006 I1.331 J.564 E.00993
; LINE_WIDTH: 0.305369
G3 X119.307 Y102.831 I1.041 J1.76 E.00486
; LINE_WIDTH: 0.250029
G1 X119.431 Y102.79 E.00122
; LINE_WIDTH: 0.217534
G3 X119.756 Y102.75 I.399 J1.884 E.00262
; LINE_WIDTH: 0.18357
G1 X119.93 Y102.736 E.00115
; LINE_WIDTH: 0.169219
G1 X132.54 Y102.736 E.07592
G1 X132.725 Y102.75 E.00112
; LINE_WIDTH: 0.21087
G1 X132.899 Y102.764 E.00134
; LINE_WIDTH: 0.225054
G3 X133.051 Y102.79 I-.093 J.976 E.00128
; LINE_WIDTH: 0.253606
G1 X133.197 Y102.838 E.00145
; LINE_WIDTH: 0.294444
G1 X133.299 Y102.871 E.0012
; LINE_WIDTH: 0.328419
G3 X133.911 Y103.361 I-.503 J1.256 E.00995
; LINE_WIDTH: 0.30536
G3 X134.087 Y103.742 I-1.761 J1.041 E.00486
; LINE_WIDTH: 0.250029
G1 X134.115 Y103.83 E.00085
; WIPE_START
G1 F15000
G1 X134.167 Y104.192 E-.13915
G1 X134.181 Y104.365 E-.06608
G1 X134.181 Y105.825 E-.55477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.057 Y108.565 Z2.5 F42000
G1 X124.942 Y109.378 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2454
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.587 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2454
M204 S5000
G1 X125.356 Y108.341 E.02355
M73 P74 R5
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2454
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00677
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14984
G1 X128.136 Y109.378 E-.17433
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F2454
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F2454
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.761 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20275
G1 X124.4 Y112.022 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.634 Y111.34 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2454
M204 S5000
G3 X126.442 Y107.994 I2.607 J-.664 E.08276
G3 X126.708 Y113.325 I-.205 J2.682 E.12622
G3 X123.65 Y111.398 I-.467 J-2.649 E.06436
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12466
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.756 E-.10192
G1 X123.817 Y109.509 E-.10192
G1 X123.848 Y109.454 E-.02393
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 22/72
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I-1.019 J-.665 P1  F42000
G1 X118.628 Y117.447 Z2.5
G1 Z2.2
G1 E.8 F1800
G1 F2463
M204 S5000
G1 X118.605 Y117.401 E.00085
G1 X118.538 Y116.979 E.00694
G1 X118.538 Y104.374 E.20467
G1 X118.605 Y103.952 E.00694
G1 X118.806 Y103.556 E.00721
G1 X118.908 Y103.454 E.00234
G1 X119.121 Y103.242 E.00487
G1 X119.516 Y103.04 E.00721
G1 X119.939 Y102.974 E.00694
G1 X132.543 Y102.974 E.20467
G1 X132.965 Y103.04 E.00694
G1 X133.361 Y103.242 E.00721
G1 X133.675 Y103.556 E.00721
G1 X133.877 Y103.952 E.00721
G1 X133.944 Y104.374 E.00694
G1 X133.944 Y116.979 E.20467
G1 X133.877 Y117.401 E.00694
G1 X133.675 Y117.797 E.00721
G1 X133.361 Y118.111 E.00721
G1 X132.965 Y118.312 E.00721
G1 X132.543 Y118.379 E.00694
G1 X119.939 Y118.379 E.20467
G1 X119.516 Y118.312 E.00694
G1 X119.121 Y118.111 E.00721
G1 X118.806 Y117.797 E.00721
G1 X118.656 Y117.501 E.00539
; WIPE_START
G1 F3600
M204 S6000
G1 X118.605 Y117.401 E-.0426
G1 X118.538 Y116.979 E-.16244
G1 X118.538 Y115.518 E-.55496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.253 Y110.46 Z2.6 F42000
G1 X133.282 Y102.468 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F2463
M204 S5000
G1 X133.29 Y102.469 E.00012
G1 X133.438 Y102.493 E.00244
G1 X133.867 Y102.711 E.0078
G1 X134.206 Y103.051 E.0078
G1 X134.425 Y103.479 E.0078
G1 X134.502 Y103.988 E.00837
G1 X134.502 Y117.365 E.2172
G1 X134.425 Y117.874 E.00837
G1 X134.206 Y118.302 E.0078
G1 X133.867 Y118.642 E.0078
G1 X133.438 Y118.86 E.0078
G1 X132.929 Y118.938 E.00837
G1 X119.553 Y118.938 E.2172
G1 X119.043 Y118.86 E.00837
G1 X118.615 Y118.642 E.0078
G1 X118.275 Y118.302 E.0078
G1 X118.057 Y117.874 E.0078
G1 X117.979 Y117.365 E.00837
G1 X117.979 Y103.988 E.2172
G1 X118.057 Y103.479 E.00837
G1 X118.275 Y103.051 E.0078
G1 X118.615 Y102.711 E.0078
G1 X119.043 Y102.493 E.0078
G1 X119.553 Y102.415 E.00837
G1 X132.929 Y102.415 E.2172
G1 X133.223 Y102.459 E.00483
; WIPE_START
G1 F3600
M204 S6000
G1 X133.29 Y102.469 E-.02572
G1 X133.438 Y102.493 E-.05708
G1 X133.867 Y102.711 E-.18263
G1 X134.206 Y103.051 E-.18261
G1 X134.425 Y103.479 E-.18262
G1 X134.476 Y103.815 E-.12934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 22 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer22 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.169 Y103.853 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215934
G1 F2463
M204 S6000
G1 X134.209 Y104.17 E.00253
; LINE_WIDTH: 0.181459
G1 X134.223 Y104.347 E.00115
; LINE_WIDTH: 0.166904
G1 X134.223 Y116.995 E.07495
G1 X134.209 Y117.182 E.00111
; LINE_WIDTH: 0.209192
G1 X134.195 Y117.359 E.00135
; LINE_WIDTH: 0.235132
G3 X134.127 Y117.638 I-1.03 J-.102 E.00251
; LINE_WIDTH: 0.290196
G1 X134.086 Y117.764 E.00145
; LINE_WIDTH: 0.328202
G3 X133.589 Y118.385 I-1.273 J-.51 E.01009
; LINE_WIDTH: 0.304855
G3 X133.203 Y118.563 I-1.058 J-1.792 E.00492
; LINE_WIDTH: 0.248798
G1 X133.077 Y118.604 E.00123
; LINE_WIDTH: 0.215934
G3 X132.747 Y118.644 I-.405 J-1.918 E.00264
; LINE_WIDTH: 0.181459
G1 X132.571 Y118.658 E.00115
; LINE_WIDTH: 0.166904
G1 X119.922 Y118.659 E.07495
G1 X119.735 Y118.644 E.00111
; LINE_WIDTH: 0.209192
G1 X119.559 Y118.631 E.00135
; LINE_WIDTH: 0.235132
G3 X119.279 Y118.563 I.102 J-1.03 E.00251
; LINE_WIDTH: 0.290196
G1 X119.153 Y118.522 E.00145
; LINE_WIDTH: 0.328202
G3 X118.532 Y118.025 I.51 J-1.273 E.01009
; LINE_WIDTH: 0.304855
G3 X118.354 Y117.638 I1.792 J-1.058 E.00492
; LINE_WIDTH: 0.248798
G1 X118.314 Y117.512 E.00123
; LINE_WIDTH: 0.215934
G3 X118.273 Y117.182 I1.918 J-.405 E.00264
; LINE_WIDTH: 0.181459
G1 X118.259 Y117.006 E.00115
; LINE_WIDTH: 0.166701
G1 X118.259 Y104.347 E.07492
; LINE_WIDTH: 0.181464
G1 X118.273 Y104.17 E.00115
; LINE_WIDTH: 0.209192
G1 X118.287 Y103.994 E.00135
; LINE_WIDTH: 0.235131
G3 X118.354 Y103.715 I1.03 J.102 E.00251
; LINE_WIDTH: 0.290192
G1 X118.395 Y103.589 E.00145
; LINE_WIDTH: 0.328212
G3 X118.893 Y102.968 I1.374 J.591 E.01006
; LINE_WIDTH: 0.304869
G3 X119.279 Y102.79 I1.058 J1.792 E.00492
; LINE_WIDTH: 0.248803
G1 X119.405 Y102.749 E.00123
; LINE_WIDTH: 0.215934
G3 X119.735 Y102.709 I.405 J1.918 E.00264
; LINE_WIDTH: 0.181459
G1 X119.911 Y102.695 E.00115
; LINE_WIDTH: 0.166904
G1 X132.559 Y102.694 E.07495
G1 X132.747 Y102.709 E.00111
; LINE_WIDTH: 0.209192
G1 X132.923 Y102.722 E.00135
; LINE_WIDTH: 0.229791
G3 X133.157 Y102.775 I-.077 J.885 E.00204
; LINE_WIDTH: 0.267746
G1 X133.237 Y102.801 E.00085
; LINE_WIDTH: 0.295916
G1 X133.328 Y102.831 E.00107
; LINE_WIDTH: 0.328214
G3 X133.949 Y103.328 I-.51 J1.274 E.01009
; LINE_WIDTH: 0.304864
G3 X134.127 Y103.715 I-1.793 J1.059 E.00492
; LINE_WIDTH: 0.248798
G1 X134.153 Y103.796 E.00079
; WIPE_START
G1 F15000
G1 X134.209 Y104.17 E-.14398
G1 X134.223 Y104.347 E-.06713
G1 X134.223 Y105.791 E-.54889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.103 Y108.543 Z2.6 F42000
G1 X124.942 Y109.378 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
M73 P75 R5
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14977
G1 X128.136 Y109.378 E-.17439
G1 X127.599 Y109.378 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F2463
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F2463
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.636 Y111.34 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
M204 S5000
G3 X125.906 Y108.008 I2.605 J-.665 E.07401
G3 X126.442 Y107.994 I.341 J2.892 E.00872
G3 X123.652 Y111.398 I-.201 J2.681 E.19054
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12463
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10185
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10191
G1 X123.848 Y109.454 E-.02399
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 23/72
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-1.016 J-.669 P1  F42000
G1 X118.578 Y117.457 Z2.6
G1 Z2.3
G1 E.8 F1800
G1 F2474
M204 S5000
G1 X118.563 Y117.427 E.00055
G1 X118.495 Y116.998 E.00706
G1 X118.495 Y104.355 E.20529
G1 X118.563 Y103.926 E.00706
G1 X118.768 Y103.523 E.00733
G1 X119.087 Y103.204 E.00733
G1 X119.49 Y102.999 E.00733
G1 X119.919 Y102.931 E.00706
G1 X132.562 Y102.931 E.20529
G1 X132.992 Y102.999 E.00706
G1 X133.394 Y103.204 E.00733
G1 X133.713 Y103.523 E.00733
G1 X133.918 Y103.926 E.00733
G1 X133.986 Y104.355 E.00706
G1 X133.986 Y116.998 E.20529
G1 X133.918 Y117.427 E.00706
G1 X133.713 Y117.83 E.00733
G1 X133.394 Y118.149 E.00733
G1 X132.992 Y118.354 E.00733
G1 X132.562 Y118.422 E.00706
G1 X119.919 Y118.422 E.20529
G1 X119.49 Y118.354 E.00706
G1 X119.087 Y118.149 E.00733
G1 X118.768 Y117.83 E.00733
G1 X118.606 Y117.511 E.00581
; WIPE_START
G1 F3600
M204 S6000
G1 X118.563 Y117.427 E-.03556
G1 X118.495 Y116.998 E-.16527
G1 X118.495 Y115.526 E-.55917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.217 Y110.475 Z2.7 F42000
G1 X133.331 Y102.431 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F2474
M204 S5000
G1 X133.468 Y102.453 E.00225
G1 X133.9 Y102.673 E.00789
G1 X134.244 Y103.017 E.00789
G1 X134.464 Y103.449 E.00789
G1 X134.543 Y103.964 E.00845
G1 X134.543 Y117.389 E.21799
G1 X134.464 Y117.903 E.00845
G1 X134.244 Y118.336 E.00789
G1 X133.9 Y118.68 E.00789
G1 X133.468 Y118.9 E.00789
G1 X132.953 Y118.979 E.00845
G1 X119.528 Y118.979 E.21799
G1 X119.014 Y118.9 E.00845
G1 X118.581 Y118.68 E.00789
G1 X118.238 Y118.336 E.00789
G1 X118.017 Y117.903 E.00789
G1 X117.939 Y117.389 E.00845
G1 X117.939 Y103.964 E.21799
G1 X118.017 Y103.449 E.00845
G1 X118.238 Y103.017 E.00789
G1 X118.581 Y102.673 E.00789
G1 X119.014 Y102.453 E.00789
G1 X119.528 Y102.374 E.00845
G1 X132.953 Y102.374 E.21799
G1 X133.272 Y102.422 E.00523
; WIPE_START
G1 F3600
M204 S6000
G1 X133.468 Y102.453 E-.0754
G1 X133.9 Y102.673 E-.18454
G1 X134.244 Y103.017 E-.18455
G1 X134.464 Y103.449 E-.18455
G1 X134.516 Y103.79 E-.13097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 23 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.7 F4000
            G39.3 S1
            G0 Z2.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer23 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.211 Y103.828 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.214334
G1 F2474
M204 S6000
G1 X134.25 Y104.149 E.00254
; LINE_WIDTH: 0.179348
G1 X134.264 Y104.328 E.00115
; LINE_WIDTH: 0.164599
G1 X134.265 Y117.014 E.07399
G1 X134.25 Y117.204 E.00111
; LINE_WIDTH: 0.207503
G1 X134.236 Y117.383 E.00136
; LINE_WIDTH: 0.233777
G3 X134.167 Y117.666 I-1.038 J-.102 E.00253
; LINE_WIDTH: 0.289507
G1 X134.126 Y117.794 E.00146
; LINE_WIDTH: 0.328007
G3 X133.944 Y118.118 I-1.313 J-.525 E.00466
G1 X133.622 Y118.423 E.00554
; LINE_WIDTH: 0.304363
G3 X133.23 Y118.603 I-1.075 J-1.822 E.00498
; LINE_WIDTH: 0.247572
G1 X133.103 Y118.645 E.00123
; LINE_WIDTH: 0.214335
G3 X132.768 Y118.686 I-.411 J-1.953 E.00265
; LINE_WIDTH: 0.179348
G1 X132.59 Y118.7 E.00115
; LINE_WIDTH: 0.164599
G1 X119.903 Y118.7 E.07399
G1 X119.713 Y118.686 E.00111
; LINE_WIDTH: 0.207503
G1 X119.534 Y118.672 E.00136
; LINE_WIDTH: 0.233777
G3 X119.251 Y118.603 I.102 J-1.038 E.00253
; LINE_WIDTH: 0.289507
G1 X119.124 Y118.562 E.00146
; LINE_WIDTH: 0.328007
G3 X118.799 Y118.379 I.525 J-1.313 E.00466
G1 X118.494 Y118.058 E.00554
; LINE_WIDTH: 0.304363
G3 X118.314 Y117.666 I1.822 J-1.075 E.00498
; LINE_WIDTH: 0.247572
G1 X118.273 Y117.539 E.00123
; LINE_WIDTH: 0.214335
G3 X118.231 Y117.204 I1.953 J-.411 E.00265
; LINE_WIDTH: 0.179348
G1 X118.217 Y117.025 E.00115
; LINE_WIDTH: 0.164391
G1 X118.217 Y104.328 E.07394
; LINE_WIDTH: 0.179354
G1 X118.231 Y104.149 E.00115
; LINE_WIDTH: 0.207503
G1 X118.245 Y103.97 E.00136
; LINE_WIDTH: 0.233777
G3 X118.314 Y103.687 I1.038 J.102 E.00253
; LINE_WIDTH: 0.289507
G1 X118.355 Y103.559 E.00146
; LINE_WIDTH: 0.328007
G3 X118.538 Y103.235 I1.313 J.525 E.00466
G1 X118.86 Y102.93 E.00554
; LINE_WIDTH: 0.304363
G3 X119.251 Y102.75 I1.075 J1.822 E.00498
; LINE_WIDTH: 0.247572
G1 X119.379 Y102.708 E.00123
; LINE_WIDTH: 0.214335
G3 X119.713 Y102.667 I.411 J1.953 E.00265
; LINE_WIDTH: 0.179348
G1 X119.892 Y102.653 E.00115
; LINE_WIDTH: 0.1646
G1 X132.578 Y102.653 E.07399
G1 X132.768 Y102.667 E.00111
; LINE_WIDTH: 0.207517
G1 X132.947 Y102.681 E.00136
; LINE_WIDTH: 0.229062
G3 X133.19 Y102.737 I-.081 J.911 E.00212
; LINE_WIDTH: 0.269842
G1 X133.278 Y102.765 E.00093
; LINE_WIDTH: 0.297369
G1 X133.358 Y102.791 E.00094
; LINE_WIDTH: 0.328
G3 X133.682 Y102.974 I-.524 J1.312 E.00466
G1 X133.987 Y103.295 E.00554
; LINE_WIDTH: 0.304355
G3 X134.167 Y103.687 I-1.824 J1.076 E.00498
; LINE_WIDTH: 0.247572
G1 X134.195 Y103.77 E.00081
; WIPE_START
G1 F15000
G1 X134.25 Y104.149 E-.14538
G1 X134.264 Y104.328 E-.06818
G1 X134.264 Y105.766 E-.54645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.147 Y108.523 Z2.7 F42000
G1 X124.942 Y109.378 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2474
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.59 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2474
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2474
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F2474
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F2474
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.759 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.572 Y112.224 E-.20278
G1 X124.4 Y112.022 E-.10423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2474
M204 S5000
G3 X125.906 Y108.008 I2.605 J-.666 E.07418
G3 X126.192 Y107.988 I.241 J1.417 E.00466
G3 X123.644 Y111.4 I.041 J2.688 E.19447
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10189
G1 X123.713 Y109.756 E-.10193
G1 X123.817 Y109.509 E-.10183
G1 X123.847 Y109.454 E-.02389
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 24/72
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.7 I-1.014 J-.673 P1  F42000
G1 X118.528 Y117.467 Z2.7
G1 Z2.4
G1 E.8 F1800
G1 F2483
M204 S5000
G1 X118.521 Y117.454 E.00025
G1 X118.452 Y117.017 E.00718
G1 X118.452 Y104.336 E.20591
G1 X118.521 Y103.899 E.00718
G1 X118.73 Y103.49 E.00745
G1 X119.054 Y103.166 E.00745
G1 X119.464 Y102.957 E.00746
G1 X119.9 Y102.888 E.00718
G1 X132.581 Y102.888 E.20591
G1 X133.018 Y102.957 E.00718
G1 X133.427 Y103.166 E.00745
G1 X133.752 Y103.49 E.00745
G1 X133.96 Y103.899 E.00745
G1 X134.029 Y104.336 E.00718
G1 X134.029 Y117.017 E.20591
G1 X133.96 Y117.454 E.00718
G1 X133.752 Y117.863 E.00745
G1 X133.427 Y118.187 E.00745
G1 X133.018 Y118.396 E.00745
G1 X132.581 Y118.465 E.00718
G1 X119.9 Y118.465 E.20591
G1 X119.464 Y118.396 E.00718
G1 X119.054 Y118.187 E.00745
G1 X118.73 Y117.863 E.00745
G1 X118.556 Y117.521 E.00623
; WIPE_START
G1 F3600
M204 S6000
G1 X118.521 Y117.454 E-.02857
G1 X118.452 Y117.017 E-.1681
G1 X118.452 Y115.534 E-.56333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.178 Y110.488 Z2.8 F42000
G1 X133.365 Y102.392 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F2483
M204 S5000
G1 X133.372 Y102.393 E.00012
G1 X133.497 Y102.413 E.00205
G1 X133.934 Y102.636 E.00797
G1 X134.281 Y102.983 E.00797
G1 X134.504 Y103.42 E.00797
G1 X134.583 Y103.94 E.00853
G1 X134.583 Y117.413 E.21878
G1 X134.504 Y117.933 E.00853
G1 X134.281 Y118.37 E.00797
G1 X133.934 Y118.717 E.00797
G1 X133.497 Y118.94 E.00797
G1 X132.978 Y119.019 E.00853
G1 X119.504 Y119.019 E.21878
G1 X118.984 Y118.94 E.00853
G1 X118.547 Y118.717 E.00797
G1 X118.2 Y118.37 E.00797
G1 X117.977 Y117.933 E.00797
G1 X117.898 Y117.413 E.00853
G1 X117.898 Y103.94 E.21878
G1 X117.977 Y103.42 E.00853
G1 X118.2 Y102.983 E.00797
G1 X118.547 Y102.636 E.00797
G1 X118.984 Y102.413 E.00797
G1 X119.504 Y102.334 E.00853
G1 X132.978 Y102.334 E.21878
G1 X133.305 Y102.383 E.00538
; WIPE_START
G1 F3600
M204 S6000
G1 X133.372 Y102.393 E-.02564
G1 X133.497 Y102.413 E-.04808
G1 X133.934 Y102.636 E-.18649
G1 X134.281 Y102.983 E-.18647
G1 X134.504 Y103.42 E-.18647
G1 X134.554 Y103.75 E-.12685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 24 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer24 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.25 Y103.788 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212731
G1 F2483
M204 S6000
G3 X134.292 Y104.127 I-1.989 J.417 E.00266
; LINE_WIDTH: 0.177237
G1 X134.306 Y104.309 E.00116
; LINE_WIDTH: 0.162285
G1 X134.306 Y117.033 E.07301
G1 X134.292 Y117.226 E.00111
; LINE_WIDTH: 0.205819
G1 X134.277 Y117.407 E.00137
; LINE_WIDTH: 0.232433
G3 X134.208 Y117.694 I-1.048 J-.102 E.00254
; LINE_WIDTH: 0.288824
G1 X134.166 Y117.823 E.00148
; LINE_WIDTH: 0.3278
G3 X133.981 Y118.152 I-1.327 J-.53 E.00472
G1 X133.655 Y118.461 E.00561
; LINE_WIDTH: 0.303873
G3 X133.258 Y118.644 I-1.092 J-1.854 E.00503
; LINE_WIDTH: 0.246347
G1 X133.129 Y118.686 E.00124
; LINE_WIDTH: 0.212731
M73 P76 R5
G3 X132.79 Y118.727 I-.417 J-1.989 E.00266
; LINE_WIDTH: 0.177237
G1 X132.608 Y118.742 E.00116
; LINE_WIDTH: 0.162285
G1 X119.884 Y118.742 E.07301
G1 X119.691 Y118.727 E.00111
; LINE_WIDTH: 0.205819
G1 X119.51 Y118.713 E.00137
; LINE_WIDTH: 0.232433
G3 X119.223 Y118.644 I.102 J-1.048 E.00254
; LINE_WIDTH: 0.288824
G1 X119.094 Y118.602 E.00148
; LINE_WIDTH: 0.3278
G3 X118.765 Y118.417 I.53 J-1.327 E.00472
G1 X118.456 Y118.09 E.00561
; LINE_WIDTH: 0.303873
G3 X118.274 Y117.694 I1.854 J-1.092 E.00503
; LINE_WIDTH: 0.246347
G1 X118.232 Y117.565 E.00124
; LINE_WIDTH: 0.212731
G3 X118.19 Y117.226 I1.989 J-.417 E.00266
; LINE_WIDTH: 0.177237
G1 X118.176 Y117.044 E.00116
; LINE_WIDTH: 0.162071
G1 X118.176 Y104.309 E.07296
; LINE_WIDTH: 0.177233
G1 X118.19 Y104.127 E.00116
; LINE_WIDTH: 0.205819
G1 X118.204 Y103.946 E.00137
; LINE_WIDTH: 0.232433
G3 X118.274 Y103.659 I1.048 J.102 E.00254
; LINE_WIDTH: 0.288824
G1 X118.315 Y103.53 E.00148
; LINE_WIDTH: 0.327805
G3 X118.501 Y103.201 I1.327 J.53 E.00472
G1 X118.827 Y102.892 E.00561
; LINE_WIDTH: 0.30389
G3 X119.223 Y102.709 I1.092 J1.853 E.00503
; LINE_WIDTH: 0.246347
G1 X119.353 Y102.667 E.00124
; LINE_WIDTH: 0.212736
G3 X119.691 Y102.626 I.417 J1.987 E.00266
; LINE_WIDTH: 0.177237
G1 X119.873 Y102.611 E.00116
; LINE_WIDTH: 0.162285
G1 X132.597 Y102.611 E.07301
G1 X132.79 Y102.626 E.00111
; LINE_WIDTH: 0.205832
G1 X132.972 Y102.64 E.00137
; LINE_WIDTH: 0.22836
G3 X133.224 Y102.698 I-.084 J.939 E.00219
; LINE_WIDTH: 0.271993
G1 X133.319 Y102.729 E.00102
; LINE_WIDTH: 0.29885
G1 X133.387 Y102.751 E.00081
; LINE_WIDTH: 0.3278
G3 X133.716 Y102.936 I-.53 J1.327 E.00472
G1 X134.026 Y103.262 E.00561
; LINE_WIDTH: 0.303867
G3 X134.208 Y103.659 I-1.854 J1.093 E.00503
; LINE_WIDTH: 0.246342
G1 X134.231 Y103.731 E.00069
; WIPE_START
G1 F15000
G1 X134.292 Y104.127 E-.1522
G1 X134.306 Y104.309 E-.06923
G1 X134.306 Y105.726 E-.53857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.195 Y108.499 Z2.8 F42000
G1 X124.942 Y109.378 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2483
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.336 J2.587 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2483
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2483
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14981
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F2483
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F2483
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20274
G1 X124.4 Y112.022 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2483
M204 S5000
G3 X125.906 Y108.008 I2.604 J-.666 E.07421
G3 X126.197 Y107.988 I.242 J1.438 E.00474
G3 X123.642 Y111.4 I.033 J2.688 E.19433
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 25/72
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-1.012 J-.677 P1  F42000
G1 X118.48 Y117.48 Z2.8
G1 Z2.5
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X118.409 Y117.036 E.0073
G1 X118.409 Y104.317 E.20653
G1 X118.48 Y103.873 E.0073
G1 X118.691 Y103.457 E.00758
G1 X118.846 Y103.303 E.00354
G1 X119.021 Y103.127 E.00403
G1 X119.437 Y102.915 E.00758
G1 X119.881 Y102.845 E.0073
G1 X132.6 Y102.845 E.20653
G1 X133.044 Y102.915 E.0073
G1 X133.46 Y103.127 E.00758
G1 X133.79 Y103.457 E.00758
G1 X134.002 Y103.873 E.00758
G1 X134.072 Y104.317 E.0073
G1 X134.072 Y117.036 E.20653
G1 X134.002 Y117.48 E.0073
G1 X133.79 Y117.896 E.00758
G1 X133.46 Y118.226 E.00758
G1 X133.044 Y118.438 E.00758
G1 X132.6 Y118.508 E.0073
G1 X119.881 Y118.508 E.20653
G1 X119.437 Y118.438 E.0073
G1 X119.021 Y118.226 E.00758
G1 X118.692 Y117.896 E.00758
G1 X118.507 Y117.534 E.0066
; WIPE_START
G1 F3600
M204 S6000
G1 X118.409 Y117.036 E-.19275
G1 X118.409 Y115.543 E-.56725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.141 Y110.503 Z2.9 F42000
G1 X133.407 Y102.354 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X133.413 Y102.355 E.00011
G1 X133.526 Y102.373 E.00186
G1 X133.968 Y102.598 E.00805
G1 X134.319 Y102.949 E.00805
G1 X134.544 Y103.391 E.00805
G1 X134.624 Y103.915 E.00862
G1 X134.624 Y117.438 E.21957
G1 X134.544 Y117.962 E.00862
G1 X134.319 Y118.404 E.00805
G1 X133.968 Y118.754 E.00805
G1 X133.526 Y118.98 E.00805
G1 X133.002 Y119.06 E.00862
G1 X119.48 Y119.06 E.21957
G1 X118.955 Y118.98 E.00862
G1 X118.513 Y118.754 E.00805
G1 X118.163 Y118.404 E.00805
G1 X117.938 Y117.962 E.00805
G1 X117.858 Y117.438 E.00862
G1 X117.858 Y103.915 E.21957
G1 X117.938 Y103.391 E.00862
G1 X118.163 Y102.949 E.00805
G1 X118.513 Y102.598 E.00805
G1 X118.955 Y102.373 E.00805
G1 X119.48 Y102.293 E.00862
G1 X133.002 Y102.293 E.21957
G1 X133.347 Y102.345 E.00567
; WIPE_START
G1 F3600
M204 S6000
G1 X133.413 Y102.355 E-.02532
G1 X133.526 Y102.373 E-.04359
G1 X133.968 Y102.598 E-.18842
G1 X134.319 Y102.949 E-.1884
G1 X134.544 Y103.391 E-.1884
G1 X134.594 Y103.718 E-.12588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 25 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.9 F4000
            G39.3 S1
            G0 Z2.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer25 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.291 Y103.762 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.211135
G1 F2493
M204 S6000
G3 X134.333 Y104.106 I-2.024 J.423 E.00268
; LINE_WIDTH: 0.175126
G1 X134.348 Y104.29 E.00116
; LINE_WIDTH: 0.15997
G1 X134.348 Y117.052 E.07202
G1 X134.333 Y117.247 E.00111
; LINE_WIDTH: 0.204146
G1 X134.319 Y117.432 E.00138
; LINE_WIDTH: 0.231094
G3 X134.248 Y117.722 I-1.059 J-.103 E.00255
; LINE_WIDTH: 0.288152
G1 X134.206 Y117.852 E.00149
; LINE_WIDTH: 0.326859
G3 X134.018 Y118.186 I-1.342 J-.535 E.00477
G1 X133.75 Y118.454 E.00472
G3 X133.649 Y118.523 I-.494 J-.615 E.00153
; LINE_WIDTH: 0.302245
G3 X133.286 Y118.684 I-.689 J-1.065 E.00456
; LINE_WIDTH: 0.245134
G1 X133.155 Y118.727 E.00125
; LINE_WIDTH: 0.211135
G3 X132.812 Y118.769 I-.423 J-2.024 E.00268
; LINE_WIDTH: 0.175126
G1 X132.627 Y118.783 E.00116
; LINE_WIDTH: 0.15997
G1 X119.865 Y118.784 E.07202
G1 X119.67 Y118.769 E.00111
; LINE_WIDTH: 0.204146
G1 X119.485 Y118.754 E.00138
; LINE_WIDTH: 0.231094
G3 X119.196 Y118.684 I.103 J-1.059 E.00255
; LINE_WIDTH: 0.288152
G1 X119.065 Y118.642 E.00149
; LINE_WIDTH: 0.326859
G3 X118.731 Y118.454 I.535 J-1.342 E.00477
G1 X118.463 Y118.186 E.00472
G3 X118.394 Y118.084 I.615 J-.494 E.00153
; LINE_WIDTH: 0.302245
G3 X118.233 Y117.722 I1.065 J-.689 E.00456
; LINE_WIDTH: 0.245134
G1 X118.191 Y117.591 E.00125
; LINE_WIDTH: 0.211135
G3 X118.148 Y117.247 I2.024 J-.423 E.00268
; LINE_WIDTH: 0.175126
G1 X118.134 Y117.063 E.00116
; LINE_WIDTH: 0.159751
G1 X118.134 Y104.29 E.07197
; LINE_WIDTH: 0.175115
G1 X118.148 Y104.106 E.00116
; LINE_WIDTH: 0.204146
G1 X118.163 Y103.921 E.00138
; LINE_WIDTH: 0.231094
G3 X118.233 Y103.631 I1.059 J.103 E.00255
; LINE_WIDTH: 0.288152
G1 X118.276 Y103.501 E.00149
; LINE_WIDTH: 0.326863
G3 X118.463 Y103.167 I1.342 J.535 E.00477
G1 X118.731 Y102.899 E.00472
G3 X118.833 Y102.829 I.493 J.613 E.00153
; LINE_WIDTH: 0.302258
G3 X119.196 Y102.669 I.689 J1.065 E.00456
; LINE_WIDTH: 0.245134
G1 X119.327 Y102.626 E.00125
; LINE_WIDTH: 0.211135
G3 X119.67 Y102.584 I.423 J2.024 E.00268
; LINE_WIDTH: 0.175126
G1 X119.854 Y102.57 E.00116
; LINE_WIDTH: 0.15997
G1 X132.616 Y102.569 E.07202
G1 X132.812 Y102.584 E.00111
; LINE_WIDTH: 0.204146
G1 X132.996 Y102.599 E.00138
; LINE_WIDTH: 0.227665
G3 X133.257 Y102.659 I-.088 J.967 E.00226
; LINE_WIDTH: 0.274117
G1 X133.36 Y102.693 E.00111
; LINE_WIDTH: 0.300307
G1 X133.417 Y102.711 E.00068
; LINE_WIDTH: 0.326859
G3 X133.75 Y102.899 I-.535 J1.342 E.00477
G1 X134.018 Y103.167 E.00472
G3 X134.088 Y103.269 I-.613 J.493 E.00153
; LINE_WIDTH: 0.302245
G3 X134.248 Y103.631 I-1.065 J.689 E.00456
; LINE_WIDTH: 0.245129
G1 X134.272 Y103.705 E.00071
; WIPE_START
G1 F15000
G1 X134.333 Y104.106 E-.15389
G1 X134.348 Y104.29 E-.07028
G1 X134.348 Y105.7 E-.53583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.239 Y108.48 Z2.9 F42000
G1 X124.942 Y109.378 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2493
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.343 J2.593 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
M73 P77 R5
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2493
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17438
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F2493
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F2493
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.63 Y111.341 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06978
G3 X126.203 Y107.988 I.671 J3.288 E.00917
G3 X123.646 Y111.399 I.032 J2.688 E.1943
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12471
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.0239
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 26/72
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.9 I-1.01 J-.679 P1  F42000
G1 X118.438 Y117.507 Z2.9
G1 Z2.6
G1 E.8 F1800
G1 F2503
M204 S5000
G1 X118.366 Y117.055 E.00743
G1 X118.366 Y104.298 E.20714
G1 X118.438 Y103.846 E.00743
G1 X118.653 Y103.424 E.0077
G1 X118.988 Y103.089 E.0077
G1 X119.411 Y102.874 E.0077
G1 X119.862 Y102.802 E.00743
G1 X132.619 Y102.802 E.20714
G1 X133.071 Y102.874 E.00743
G1 X133.493 Y103.089 E.0077
G1 X133.828 Y103.424 E.0077
G1 X134.043 Y103.846 E.0077
G1 X134.115 Y104.298 E.00743
G1 X134.115 Y117.055 E.20714
G1 X134.043 Y117.507 E.00743
G1 X133.828 Y117.929 E.0077
G1 X133.493 Y118.264 E.0077
G1 X133.071 Y118.479 E.0077
G1 X132.619 Y118.551 E.00743
G1 X119.862 Y118.551 E.20714
G1 X119.411 Y118.479 E.00743
G1 X118.988 Y118.264 E.0077
G1 X118.653 Y117.929 E.0077
G1 X118.465 Y117.56 E.00672
; WIPE_START
G1 F3600
M204 S6000
G1 X118.366 Y117.055 E-.19558
G1 X118.366 Y115.57 E-.56442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.1 Y110.532 Z3 F42000
G1 X133.449 Y102.317 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2503
M204 S5000
G1 X133.454 Y102.318 E.00008
G1 X133.556 Y102.334 E.00167
G1 X134.002 Y102.561 E.00813
G1 X134.356 Y102.915 E.00813
G1 X134.584 Y103.361 E.00813
G1 X134.665 Y103.891 E.0087
G1 X134.665 Y117.462 E.22036
G1 X134.584 Y117.991 E.0087
G1 X134.356 Y118.438 E.00813
G1 X134.002 Y118.792 E.00813
G1 X133.556 Y119.019 E.00813
G1 X133.026 Y119.1 E.0087
G1 X119.455 Y119.1 E.22036
G1 X118.926 Y119.019 E.0087
G1 X118.479 Y118.792 E.00813
G1 X118.125 Y118.438 E.00813
G1 X117.898 Y117.991 E.00813
G1 X117.817 Y117.462 E.0087
G1 X117.817 Y103.891 E.22036
G1 X117.898 Y103.361 E.0087
G1 X118.125 Y102.915 E.00813
G1 X118.479 Y102.561 E.00813
G1 X118.926 Y102.334 E.00813
G1 X119.455 Y102.253 E.0087
G1 X133.026 Y102.253 E.22036
G1 X133.39 Y102.308 E.00597
; WIPE_START
G1 F3600
M204 S6000
G1 X133.454 Y102.318 E-.02465
G1 X133.556 Y102.334 E-.03909
G1 X134.002 Y102.561 E-.19034
G1 X134.356 Y102.915 E-.19032
G1 X134.584 Y103.361 E-.19033
G1 X134.633 Y103.687 E-.12527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 26 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer26 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.332 Y103.736 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.209535
G1 F2503
M204 S6000
G3 X134.375 Y104.084 I-2.059 J.429 E.00269
; LINE_WIDTH: 0.172998
G1 X134.389 Y104.271 E.00116
; LINE_WIDTH: 0.157656
G1 X134.39 Y117.071 E.07103
G1 X134.375 Y117.269 E.0011
; LINE_WIDTH: 0.202471
G1 X134.36 Y117.456 E.00138
; LINE_WIDTH: 0.229759
G3 X134.289 Y117.749 I-1.069 J-.104 E.00257
; LINE_WIDTH: 0.287493
G1 X134.246 Y117.882 E.00151
; LINE_WIDTH: 0.326653
G3 X134.056 Y118.22 I-1.357 J-.541 E.00483
G1 X133.784 Y118.492 E.00478
G3 X133.682 Y118.562 I-.498 J-.619 E.00154
; LINE_WIDTH: 0.301758
G3 X133.314 Y118.725 I-.699 J-1.08 E.00462
; LINE_WIDTH: 0.243903
G1 X133.181 Y118.768 E.00126
; LINE_WIDTH: 0.209535
G3 X132.833 Y118.81 I-.429 J-2.059 E.00269
; LINE_WIDTH: 0.172998
G1 X132.646 Y118.825 E.00116
; LINE_WIDTH: 0.157656
G1 X119.846 Y118.825 E.07103
G1 X119.648 Y118.81 E.0011
; LINE_WIDTH: 0.202471
G1 X119.461 Y118.796 E.00138
; LINE_WIDTH: 0.229759
G3 X119.168 Y118.725 I.104 J-1.069 E.00257
; LINE_WIDTH: 0.287493
G1 X119.036 Y118.682 E.00151
; LINE_WIDTH: 0.326653
G3 X118.698 Y118.492 I.541 J-1.357 E.00483
G1 X118.426 Y118.22 E.00478
G3 X118.356 Y118.117 I.619 J-.498 E.00154
; LINE_WIDTH: 0.301758
G3 X118.193 Y117.749 I1.08 J-.699 E.00462
; LINE_WIDTH: 0.243903
G1 X118.15 Y117.617 E.00126
; LINE_WIDTH: 0.209535
G3 X118.107 Y117.269 I2.059 J-.429 E.00269
; LINE_WIDTH: 0.172998
G1 X118.092 Y117.082 E.00116
; LINE_WIDTH: 0.157431
G1 X118.092 Y104.271 E.07097
; LINE_WIDTH: 0.17301
G1 X118.107 Y104.084 E.00116
; LINE_WIDTH: 0.202471
G1 X118.122 Y103.897 E.00138
; LINE_WIDTH: 0.229759
G3 X118.193 Y103.604 I1.069 J.104 E.00257
; LINE_WIDTH: 0.287493
G1 X118.236 Y103.471 E.00151
; LINE_WIDTH: 0.326653
G3 X118.426 Y103.133 I1.357 J.541 E.00483
G1 X118.698 Y102.861 E.00478
G3 X118.8 Y102.791 I.498 J.619 E.00154
; LINE_WIDTH: 0.301758
G3 X119.168 Y102.628 I.699 J1.08 E.00462
; LINE_WIDTH: 0.243903
G1 X119.3 Y102.585 E.00126
; LINE_WIDTH: 0.209535
G3 X119.648 Y102.543 I.429 J2.059 E.00269
; LINE_WIDTH: 0.172998
G1 X119.835 Y102.528 E.00116
; LINE_WIDTH: 0.157656
G1 X132.635 Y102.527 E.07103
G1 X132.833 Y102.543 E.0011
; LINE_WIDTH: 0.202471
G1 X133.02 Y102.557 E.00138
; LINE_WIDTH: 0.22699
G3 X133.291 Y102.621 I-.091 J.994 E.00233
; LINE_WIDTH: 0.276249
G1 X133.4 Y102.657 E.0012
; LINE_WIDTH: 0.325393
G3 X133.784 Y102.861 I-.962 J2.264 E.00539
G1 X134.056 Y103.133 E.00476
G3 X134.126 Y103.236 I-.619 J.498 E.00154
; LINE_WIDTH: 0.301752
G3 X134.289 Y103.604 I-1.08 J.699 E.00462
; LINE_WIDTH: 0.243903
G1 X134.313 Y103.679 E.00072
; WIPE_START
G1 F15000
G1 X134.375 Y104.084 E-.15559
G1 X134.389 Y104.271 E-.07133
G1 X134.389 Y105.674 E-.53308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.284 Y108.46 Z3 F42000
G1 X124.942 Y109.378 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2503
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.341 J2.591 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2503
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2503
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00677
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14984
G1 X128.136 Y109.378 E-.17433
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2503
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2503
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.63 Y111.341 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2503
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06979
G3 X126.208 Y107.988 I.661 J3.217 E.00926
G3 X123.645 Y111.399 I.026 J2.688 E.19419
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12473
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.756 E-.10195
G1 X123.817 Y109.509 E-.10182
G1 X123.847 Y109.454 E-.02392
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 27/72
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-1.008 J-.682 P1  F42000
G1 X118.394 Y117.518 Z3
G1 Z2.7
G1 E.8 F1800
G1 F2512
M204 S5000
G1 X118.324 Y117.074 E.00731
G1 X118.324 Y104.279 E.20776
G1 X118.396 Y103.82 E.00755
G1 X118.615 Y103.391 E.00782
G1 X118.955 Y103.051 E.00782
G1 X119.384 Y102.832 E.00782
G1 X119.843 Y102.759 E.00755
G1 X132.638 Y102.759 E.20776
G1 X133.097 Y102.832 E.00755
G1 X133.526 Y103.051 E.00782
G1 X133.867 Y103.391 E.00782
G1 X134.085 Y103.82 E.00782
G1 X134.158 Y104.279 E.00755
G1 X134.158 Y117.074 E.20776
G1 X134.085 Y117.533 E.00755
G1 X133.867 Y117.962 E.00782
G1 X133.526 Y118.302 E.00782
G1 X133.097 Y118.521 E.00782
G1 X132.638 Y118.594 E.00755
G1 X119.843 Y118.594 E.20776
G1 X119.384 Y118.521 E.00755
G1 X118.955 Y118.302 E.00782
G1 X118.615 Y117.962 E.00782
G1 X118.417 Y117.573 E.00708
; WIPE_START
G1 F3600
M204 S6000
G1 X118.324 Y117.074 E-.19301
G1 X118.324 Y115.582 E-.567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.062 Y110.549 Z3.1 F42000
G1 X133.492 Y102.279 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F2512
M204 S5000
G1 X133.495 Y102.28 E.00005
G1 X133.585 Y102.294 E.00148
G1 X134.036 Y102.524 E.00822
G1 X134.394 Y102.881 E.00822
G1 X134.623 Y103.332 E.00822
G1 X134.705 Y103.867 E.00878
G1 X134.705 Y117.486 E.22115
G1 X134.623 Y118.021 E.00878
G1 X134.394 Y118.472 E.00822
G1 X134.036 Y118.829 E.00822
G1 X133.585 Y119.059 E.00822
G1 X133.051 Y119.141 E.00878
G1 X119.431 Y119.141 E.22115
G1 X118.896 Y119.059 E.00878
G1 X118.446 Y118.829 E.00822
G1 X118.088 Y118.472 E.00822
G1 X117.858 Y118.021 E.00822
G1 X117.776 Y117.486 E.00878
G1 X117.776 Y103.867 E.22115
G1 X117.858 Y103.332 E.00878
G1 X118.088 Y102.881 E.00822
G1 X118.446 Y102.524 E.00822
G1 X118.896 Y102.294 E.00822
G1 X119.431 Y102.212 E.00878
G1 X133.051 Y102.212 E.22115
G1 X133.433 Y102.27 E.00628
; WIPE_START
G1 F3600
M204 S6000
G1 X133.495 Y102.28 E-.02387
G1 X133.585 Y102.294 E-.03461
G1 X134.036 Y102.524 E-.19225
G1 X134.394 Y102.881 E-.19227
G1 X134.623 Y103.332 E-.19226
G1 X134.673 Y103.657 E-.12475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 27 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.1 F4000
            G39.3 S1
            G0 Z3.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer27 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.373 Y103.71 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.207939
G1 F2512
M204 S6000
G3 X134.416 Y104.062 I-2.095 J.435 E.0027
; LINE_WIDTH: 0.170902
G1 X134.431 Y104.252 E.00116
; LINE_WIDTH: 0.155351
G1 X134.431 Y117.09 E.07003
G1 X134.416 Y117.291 E.0011
; LINE_WIDTH: 0.200777
G1 X134.401 Y117.481 E.00139
; LINE_WIDTH: 0.228402
G3 X134.329 Y117.777 I-1.078 J-.104 E.00258
; LINE_WIDTH: 0.286801
M73 P78 R5
G1 X134.286 Y117.911 E.00153
; LINE_WIDTH: 0.326452
G3 X134.093 Y118.253 I-1.371 J-.545 E.00489
G1 X133.818 Y118.529 E.00484
G3 X133.715 Y118.6 I-.504 J-.626 E.00156
; LINE_WIDTH: 0.301269
G3 X133.341 Y118.765 I-.709 J-1.095 E.00467
; LINE_WIDTH: 0.242673
G1 X133.207 Y118.809 E.00127
; LINE_WIDTH: 0.207939
G3 X132.855 Y118.852 I-.435 J-2.095 E.0027
; LINE_WIDTH: 0.170902
G1 X132.665 Y118.867 E.00116
; LINE_WIDTH: 0.155351
G1 X119.827 Y118.867 E.07003
G1 X119.627 Y118.852 E.0011
; LINE_WIDTH: 0.200777
G1 X119.437 Y118.837 E.00139
; LINE_WIDTH: 0.228402
G3 X119.14 Y118.765 I.104 J-1.078 E.00258
; LINE_WIDTH: 0.286801
G1 X119.006 Y118.722 E.00153
; LINE_WIDTH: 0.326452
G3 X118.664 Y118.529 I.545 J-1.371 E.00489
G1 X118.388 Y118.253 E.00484
G3 X118.317 Y118.15 I.626 J-.504 E.00156
; LINE_WIDTH: 0.301269
G3 X118.152 Y117.777 I1.095 J-.709 E.00467
; LINE_WIDTH: 0.242673
G1 X118.109 Y117.643 E.00127
; LINE_WIDTH: 0.207939
G3 X118.065 Y117.291 I2.095 J-.435 E.0027
; LINE_WIDTH: 0.170902
G1 X118.05 Y117.101 E.00116
; LINE_WIDTH: 0.155121
G1 X118.05 Y104.252 E.06997
; LINE_WIDTH: 0.170886
G1 X118.065 Y104.062 E.00116
; LINE_WIDTH: 0.200779
G1 X118.08 Y103.872 E.00139
; LINE_WIDTH: 0.228403
G3 X118.152 Y103.576 I1.078 J.104 E.00258
; LINE_WIDTH: 0.286802
G1 X118.196 Y103.442 E.00153
; LINE_WIDTH: 0.326452
G3 X118.388 Y103.099 I1.371 J.545 E.00489
G1 X118.664 Y102.824 E.00484
G3 X118.767 Y102.753 I.504 J.626 E.00156
; LINE_WIDTH: 0.301269
G3 X119.14 Y102.588 I.709 J1.095 E.00467
; LINE_WIDTH: 0.242673
G1 X119.274 Y102.544 E.00127
; LINE_WIDTH: 0.207939
G3 X119.627 Y102.501 I.435 J2.095 E.0027
; LINE_WIDTH: 0.170902
G1 X119.817 Y102.486 E.00116
; LINE_WIDTH: 0.155351
G1 X132.654 Y102.486 E.07003
G1 X132.855 Y102.501 E.0011
; LINE_WIDTH: 0.200779
G1 X133.045 Y102.516 E.00139
; LINE_WIDTH: 0.22631
G3 X133.324 Y102.582 I-.095 J1.022 E.0024
; LINE_WIDTH: 0.278362
G1 X133.441 Y102.62 E.00129
; LINE_WIDTH: 0.325567
G3 X133.818 Y102.824 I-1.077 J2.442 E.00531
G1 X134.093 Y103.099 E.00483
G3 X134.164 Y103.203 I-.622 J.501 E.00155
; LINE_WIDTH: 0.301273
G3 X134.329 Y103.576 I-1.096 J.709 E.00467
; LINE_WIDTH: 0.242678
G1 X134.354 Y103.653 E.00073
; WIPE_START
G1 F15000
G1 X134.416 Y104.062 E-.15729
G1 X134.431 Y104.252 E-.07239
G1 X134.431 Y105.648 E-.53033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.328 Y108.44 Z3.1 F42000
G1 X124.942 Y109.378 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2512
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.335 J2.585 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2512
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2512
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2512
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2512
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
M73 P78 R4
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.572 Y112.224 E-.20278
G1 X124.4 Y112.022 E-.10423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.342 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2512
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.0698
G3 X126.213 Y107.989 I.652 J3.16 E.00934
G3 X123.644 Y111.399 I.02 J2.688 E.19409
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12474
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10187
G1 X123.713 Y109.756 E-.10198
G1 X123.817 Y109.509 E-.10183
G1 X123.847 Y109.454 E-.02389
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 28/72
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.1 I-1.006 J-.685 P1  F42000
G1 X118.349 Y117.522 Z3.1
G1 Z2.8
G1 E.8 F1800
G1 F2522
M204 S5000
G1 X118.281 Y117.093 E.00705
G1 X118.281 Y104.26 E.20838
G1 X118.355 Y103.794 E.00767
G1 X118.577 Y103.358 E.00794
G1 X118.922 Y103.012 E.00794
G1 X119.358 Y102.79 E.00794
G1 X119.824 Y102.716 E.00767
G1 X132.657 Y102.716 E.20838
G1 X133.124 Y102.79 E.00767
G1 X133.559 Y103.012 E.00794
G1 X133.905 Y103.358 E.00794
G1 X134.127 Y103.794 E.00794
G1 X134.201 Y104.26 E.00767
G1 X134.201 Y117.093 E.20838
G1 X134.127 Y117.559 E.00767
G1 X133.905 Y117.995 E.00794
G1 X133.559 Y118.341 E.00794
G1 X133.124 Y118.563 E.00794
G1 X132.657 Y118.636 E.00767
G1 X119.824 Y118.636 E.20838
G1 X119.358 Y118.563 E.00767
G1 X118.922 Y118.341 E.00794
G1 X118.577 Y117.995 E.00794
G1 X118.364 Y117.579 E.00759
; WIPE_START
G1 F3600
M204 S6000
G1 X118.281 Y117.093 E-.18729
G1 X118.281 Y115.586 E-.57271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.025 Y110.561 Z3.2 F42000
G1 X133.535 Y102.242 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F2522
M204 S5000
G1 X133.536 Y102.242 E.00001
G1 X133.614 Y102.254 E.00129
G1 X134.07 Y102.486 E.0083
G1 X134.431 Y102.847 E.0083
G1 X134.663 Y103.303 E.0083
G1 X134.746 Y103.842 E.00886
G1 X134.746 Y117.51 E.22194
G1 X134.663 Y118.05 E.00886
G1 X134.431 Y118.505 E.0083
G1 X134.07 Y118.867 E.0083
G1 X133.614 Y119.099 E.0083
G1 X133.075 Y119.181 E.00886
G1 X119.407 Y119.181 E.22194
G1 X118.867 Y119.099 E.00886
G1 X118.412 Y118.867 E.0083
G1 X118.05 Y118.505 E.0083
G1 X117.818 Y118.05 E.0083
G1 X117.736 Y117.51 E.00886
G1 X117.736 Y103.842 E.22194
G1 X117.818 Y103.303 E.00886
G1 X118.05 Y102.847 E.0083
G1 X118.412 Y102.486 E.0083
G1 X118.867 Y102.254 E.0083
G1 X119.407 Y102.172 E.00886
G1 X133.075 Y102.172 E.22194
G1 X133.476 Y102.233 E.00659
; WIPE_START
G1 F3600
M204 S6000
G1 X133.536 Y102.242 E-.02312
G1 X133.614 Y102.254 E-.0301
G1 X134.07 Y102.486 E-.19419
G1 X134.431 Y102.847 E-.19418
G1 X134.663 Y103.303 E-.19419
G1 X134.713 Y103.626 E-.12423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 28 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer28 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.414 Y103.684 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20634
G1 F2522
M204 S6000
G3 X134.458 Y104.041 I-2.129 J.441 E.00271
; LINE_WIDTH: 0.168791
G1 X134.473 Y104.233 E.00116
; LINE_WIDTH: 0.153047
G1 X134.473 Y117.109 E.06903
G1 X134.458 Y117.312 E.00109
; LINE_WIDTH: 0.199111
G1 X134.442 Y117.505 E.0014
; LINE_WIDTH: 0.227062
G3 X134.37 Y117.805 I-1.089 J-.105 E.00259
; LINE_WIDTH: 0.286126
G1 X134.326 Y117.941 E.00154
; LINE_WIDTH: 0.326244
G3 X134.131 Y118.287 I-1.386 J-.551 E.00496
G1 X133.852 Y118.567 E.0049
G3 X133.747 Y118.638 I-.507 J-.63 E.00157
; LINE_WIDTH: 0.300782
G3 X133.369 Y118.806 I-.719 J-1.111 E.00473
; LINE_WIDTH: 0.241447
G1 X133.233 Y118.85 E.00128
; LINE_WIDTH: 0.20634
G3 X132.877 Y118.893 I-.441 J-2.129 E.00271
; LINE_WIDTH: 0.168791
G1 X132.684 Y118.908 E.00116
; LINE_WIDTH: 0.153047
G1 X119.808 Y118.909 E.06903
G1 X119.605 Y118.893 E.00109
; LINE_WIDTH: 0.199111
G1 X119.412 Y118.878 E.0014
; LINE_WIDTH: 0.227062
G3 X119.113 Y118.806 I.105 J-1.089 E.00259
; LINE_WIDTH: 0.286126
G1 X118.977 Y118.761 E.00154
; LINE_WIDTH: 0.326244
G3 X118.63 Y118.567 I.551 J-1.386 E.00496
G1 X118.351 Y118.287 E.0049
G3 X118.279 Y118.183 I.63 J-.508 E.00157
; LINE_WIDTH: 0.300782
G3 X118.112 Y117.805 I1.111 J-.719 E.00473
; LINE_WIDTH: 0.241447
G1 X118.067 Y117.669 E.00128
; LINE_WIDTH: 0.20634
G3 X118.024 Y117.312 I2.129 J-.441 E.00271
; LINE_WIDTH: 0.168791
G1 X118.009 Y117.12 E.00116
; LINE_WIDTH: 0.152811
G1 X118.009 Y104.233 E.06896
; LINE_WIDTH: 0.168784
G1 X118.024 Y104.041 E.00116
; LINE_WIDTH: 0.199111
G1 X118.039 Y103.848 E.0014
; LINE_WIDTH: 0.227062
G3 X118.112 Y103.548 I1.089 J.105 E.00259
; LINE_WIDTH: 0.286126
G1 X118.156 Y103.412 E.00154
; LINE_WIDTH: 0.326244
G3 X118.351 Y103.066 I1.386 J.551 E.00496
G1 X118.63 Y102.786 E.0049
G3 X118.734 Y102.715 I.508 J.63 E.00157
; LINE_WIDTH: 0.300782
G3 X119.113 Y102.547 I.719 J1.111 E.00473
; LINE_WIDTH: 0.241447
G1 X119.248 Y102.503 E.00128
; LINE_WIDTH: 0.20634
G3 X119.605 Y102.46 I.441 J2.129 E.00271
; LINE_WIDTH: 0.168791
G1 X119.798 Y102.444 E.00116
; LINE_WIDTH: 0.153047
G1 X132.674 Y102.444 E.06903
G1 X132.877 Y102.46 E.00109
; LINE_WIDTH: 0.199102
G1 X133.069 Y102.475 E.0014
; LINE_WIDTH: 0.225649
G3 X133.358 Y102.544 I-.099 J1.051 E.00247
; LINE_WIDTH: 0.280485
G1 X133.482 Y102.584 E.00138
; LINE_WIDTH: 0.325693
G3 X133.852 Y102.786 I-1.237 J2.698 E.00523
G1 X134.131 Y103.066 E.00489
G3 X134.202 Y103.17 I-.63 J.508 E.00157
; LINE_WIDTH: 0.300782
G3 X134.37 Y103.548 I-1.111 J.719 E.00473
; LINE_WIDTH: 0.241447
G1 X134.395 Y103.627 E.00074
; WIPE_START
G1 F15000
G1 X134.458 Y104.041 E-.15898
G1 X134.473 Y104.233 E-.07343
G1 X134.473 Y105.622 E-.52759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.372 Y108.42 Z3.2 F42000
G1 X124.942 Y109.378 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
M73 P79 R4
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14981
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2522
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2522
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06982
G3 X126.218 Y107.989 I.645 J3.108 E.00943
G3 X123.644 Y111.4 I.014 J2.688 E.19399
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.757 E-.10191
G1 X123.817 Y109.509 E-.10191
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 29/72
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-1.003 J-.689 P1  F42000
G1 X118.303 Y117.525 Z3.2
G1 Z2.9
G1 E.8 F1800
G1 F2532
M204 S5000
G1 X118.238 Y117.112 E.00679
G1 X118.238 Y104.241 E.209
G1 X118.313 Y103.767 E.00779
G1 X118.538 Y103.325 E.00806
G1 X118.762 Y103.101 E.00514
G1 X118.889 Y102.974 E.00292
G1 X119.331 Y102.749 E.00806
G1 X119.805 Y102.674 E.00779
G1 X132.676 Y102.674 E.209
G1 X133.15 Y102.749 E.00779
G1 X133.592 Y102.974 E.00806
G1 X133.943 Y103.325 E.00806
G1 X134.169 Y103.767 E.00806
G1 X134.244 Y104.241 E.00779
G1 X134.244 Y117.112 E.209
G1 X134.169 Y117.586 E.00779
G1 X133.943 Y118.028 E.00806
G1 X133.592 Y118.379 E.00806
G1 X133.15 Y118.604 E.00806
G1 X132.676 Y118.679 E.00779
G1 X119.805 Y118.679 E.209
G1 X119.331 Y118.604 E.00779
G1 X118.889 Y118.379 E.00806
G1 X118.538 Y118.028 E.00806
G1 X118.313 Y117.586 E.00806
G1 X118.313 Y117.584 E.00003
; WIPE_START
G1 F3600
M204 S6000
G1 X118.238 Y117.112 E-.18161
G1 X118.238 Y115.59 E-.57839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.989 Y110.572 Z3.3 F42000
G1 X133.577 Y102.204 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F2532
M204 S5000
G1 X133.578 Y102.204 E.00001
G1 X133.644 Y102.214 E.00108
G1 X134.104 Y102.449 E.00838
G1 X134.469 Y102.814 E.00838
G1 X134.703 Y103.273 E.00838
G1 X134.786 Y103.818 E.00895
G1 X134.786 Y117.535 E.22273
G1 X134.703 Y118.079 E.00895
G1 X134.469 Y118.539 E.00838
G1 X134.104 Y118.904 E.00838
G1 X133.644 Y119.138 E.00838
G1 X133.099 Y119.222 E.00895
G1 X119.382 Y119.222 E.22273
G1 X118.838 Y119.138 E.00895
G1 X118.378 Y118.904 E.00838
G1 X118.013 Y118.539 E.00838
G1 X117.779 Y118.079 E.00838
G1 X117.695 Y117.535 E.00895
G1 X117.695 Y103.818 E.22273
G1 X117.779 Y103.273 E.00895
G1 X118.013 Y102.814 E.00838
G1 X118.378 Y102.449 E.00838
G1 X118.838 Y102.214 E.00838
G1 X119.382 Y102.131 E.00895
G1 X133.099 Y102.131 E.22273
G1 X133.518 Y102.195 E.00688
; WIPE_START
G1 F3600
M204 S6000
G1 X133.578 Y102.204 E-.02313
G1 X133.644 Y102.214 E-.02525
G1 X134.104 Y102.449 E-.19612
G1 X134.469 Y102.814 E-.19612
G1 X134.703 Y103.273 E-.19611
G1 X134.752 Y103.594 E-.12327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 29 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.3 F4000
            G39.3 S1
            G0 Z3.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer29 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.455 Y103.658 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.204737
G1 F2532
M204 S6000
G3 X134.499 Y104.019 I-2.165 J.447 E.00272
; LINE_WIDTH: 0.16668
G1 X134.515 Y104.214 E.00116
; LINE_WIDTH: 0.150732
G1 X134.515 Y117.128 E.06802
G1 X134.499 Y117.334 E.00109
; LINE_WIDTH: 0.197425
G1 X134.484 Y117.529 E.00141
; LINE_WIDTH: 0.213251
G3 X134.455 Y117.695 I-1.061 J-.098 E.00132
; LINE_WIDTH: 0.240217
G1 X134.41 Y117.832 E.00129
; LINE_WIDTH: 0.285451
G1 X134.366 Y117.97 E.00155
; LINE_WIDTH: 0.326037
G3 X134.168 Y118.321 I-1.402 J-.557 E.00502
G1 X133.886 Y118.604 E.00496
G3 X133.78 Y118.676 I-.513 J-.637 E.00158
; LINE_WIDTH: 0.300295
G3 X133.397 Y118.846 I-.729 J-1.127 E.00479
; LINE_WIDTH: 0.240235
G1 X133.259 Y118.891 E.00129
; LINE_WIDTH: 0.204737
G3 X132.898 Y118.935 I-.448 J-2.168 E.00272
; LINE_WIDTH: 0.16668
G1 X132.703 Y118.95 E.00116
; LINE_WIDTH: 0.150732
G1 X119.789 Y118.951 E.06802
G1 X119.583 Y118.935 E.00109
; LINE_WIDTH: 0.197425
G1 X119.388 Y118.919 E.00141
; LINE_WIDTH: 0.213251
G3 X119.222 Y118.891 I.098 J-1.061 E.00132
; LINE_WIDTH: 0.240217
G1 X119.085 Y118.846 E.00129
; LINE_WIDTH: 0.285451
G1 X118.947 Y118.801 E.00155
; LINE_WIDTH: 0.326037
G3 X118.596 Y118.604 I.557 J-1.402 E.00502
G1 X118.313 Y118.321 E.00496
G3 X118.241 Y118.216 I.637 J-.513 E.00158
; LINE_WIDTH: 0.300295
G3 X118.071 Y117.832 I1.127 J-.729 E.00479
; LINE_WIDTH: 0.240235
G1 X118.026 Y117.695 E.00129
; LINE_WIDTH: 0.204737
G3 X117.982 Y117.334 I2.168 J-.448 E.00272
; LINE_WIDTH: 0.16668
G1 X117.967 Y117.138 E.00116
; LINE_WIDTH: 0.150491
G1 X117.967 Y104.214 E.06794
; LINE_WIDTH: 0.166662
G1 X117.982 Y104.019 E.00116
; LINE_WIDTH: 0.197425
G1 X117.998 Y103.824 E.00141
; LINE_WIDTH: 0.213251
G3 X118.026 Y103.658 I1.061 J.098 E.00132
; LINE_WIDTH: 0.240217
G1 X118.071 Y103.52 E.00129
; LINE_WIDTH: 0.285451
G1 X118.116 Y103.383 E.00155
; LINE_WIDTH: 0.326038
G1 X118.241 Y103.137 E.00343
G3 X118.701 Y102.677 I1.746 J1.286 E.0081
; LINE_WIDTH: 0.300298
G3 X119.085 Y102.507 I.729 J1.126 E.00479
; LINE_WIDTH: 0.240222
G1 X119.222 Y102.462 E.00129
; LINE_WIDTH: 0.204738
G3 X119.583 Y102.418 I.447 J2.166 E.00272
; LINE_WIDTH: 0.16668
G1 X119.779 Y102.403 E.00116
; LINE_WIDTH: 0.150732
G1 X132.693 Y102.402 E.06802
G1 X132.898 Y102.418 E.00109
; LINE_WIDTH: 0.19743
G1 X133.094 Y102.433 E.00141
; LINE_WIDTH: 0.225009
G3 X133.391 Y102.505 I-.102 J1.08 E.00255
; LINE_WIDTH: 0.282623
G1 X133.523 Y102.548 E.00147
; LINE_WIDTH: 0.325783
G3 X133.886 Y102.749 I-1.471 J3.081 E.00515
G1 X134.168 Y103.032 E.00496
G3 X134.24 Y103.137 I-.636 J.513 E.00158
; LINE_WIDTH: 0.300288
G3 X134.41 Y103.52 I-1.126 J.729 E.00479
; LINE_WIDTH: 0.240209
G1 X134.437 Y103.601 E.00075
; WIPE_START
G1 F15000
G1 X134.499 Y104.019 E-.16068
G1 X134.515 Y104.214 E-.07448
G1 X134.515 Y105.596 E-.52484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.416 Y108.4 Z3.3 F42000
G1 X124.942 Y109.378 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2532
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.343 J2.593 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2532
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2532
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14982
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2532
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2532
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2532
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.666 E.06983
G3 X126.224 Y107.989 I.639 J3.065 E.00951
G3 X123.643 Y111.4 I.008 J2.688 E.19389
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02388
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 30/72
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I-1.001 J-.693 P1  F42000
G1 X118.258 Y117.528 Z3.3
G1 Z3
G1 E.8 F1800
G1 F2541
M204 S5000
G1 X118.195 Y117.131 E.00653
G1 X118.195 Y104.222 E.20962
G1 X118.271 Y103.741 E.00791
G1 X118.5 Y103.292 E.00818
G1 X118.856 Y102.936 E.00818
G1 X119.305 Y102.707 E.00818
G1 X119.786 Y102.631 E.00791
G1 X132.695 Y102.631 E.20962
G1 X133.176 Y102.707 E.00791
G1 X133.625 Y102.936 E.00818
G1 X133.982 Y103.292 E.00818
G1 X134.21 Y103.741 E.00818
G1 X134.286 Y104.222 E.00791
G1 X134.286 Y117.131 E.20962
G1 X134.21 Y117.612 E.00791
G1 X133.982 Y118.061 E.00818
G1 X133.625 Y118.417 E.00818
G1 X133.176 Y118.646 E.00818
G1 X132.695 Y118.722 E.00791
G1 X119.786 Y118.722 E.20962
G1 X119.305 Y118.646 E.00791
G1 X118.856 Y118.417 E.00818
G1 X118.5 Y118.061 E.00818
G1 X118.271 Y117.612 E.00818
G1 X118.267 Y117.587 E.00041
; WIPE_START
G1 F3600
M204 S6000
G1 X118.195 Y117.131 E-.17558
G1 X118.195 Y115.593 E-.58442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.952 Y110.582 Z3.4 F42000
G1 X133.62 Y102.166 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2541
M204 S5000
G1 X133.673 Y102.175 E.00087
G1 X134.137 Y102.411 E.00846
G1 X134.506 Y102.78 E.00846
G1 X134.743 Y103.244 E.00846
G1 X134.827 Y103.794 E.00903
G1 X134.827 Y117.559 E.22352
G1 X134.743 Y118.109 E.00903
G1 X134.506 Y118.573 E.00846
G1 X134.137 Y118.942 E.00846
G1 X133.673 Y119.178 E.00846
G1 X133.124 Y119.262 E.00903
G1 X119.358 Y119.262 E.22352
G1 X118.808 Y119.178 E.00903
G1 X118.344 Y118.942 E.00846
G1 X117.976 Y118.573 E.00846
G1 X117.739 Y118.109 E.00846
G1 X117.655 Y117.559 E.00903
G1 X117.655 Y103.794 E.22352
G1 X117.739 Y103.244 E.00903
G1 X117.976 Y102.78 E.00846
G1 X118.344 Y102.411 E.00846
G1 X118.808 Y102.175 E.00846
G1 X119.358 Y102.09 E.00903
G1 X133.124 Y102.09 E.22352
G1 X133.561 Y102.157 E.00719
; WIPE_START
G1 F3600
M204 S6000
G1 X133.673 Y102.175 E-.0431
G1 X134.137 Y102.411 E-.19803
G1 X134.506 Y102.78 E-.19805
G1 X134.743 Y103.244 E-.19804
G1 X134.791 Y103.564 E-.12279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 30 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer30 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.496 Y103.632 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203141
G1 F2541
M204 S6000
G3 X134.541 Y103.997 I-2.204 J.454 E.00273
; LINE_WIDTH: 0.164567
G1 X134.556 Y104.196 E.00116
; LINE_WIDTH: 0.148428
G1 X134.557 Y117.147 E.067
G1 X134.541 Y117.355 E.00108
; LINE_WIDTH: 0.195757
G1 X134.525 Y117.554 E.00141
; LINE_WIDTH: 0.211763
G3 X134.496 Y117.721 I-1.075 J-.1 E.00132
; LINE_WIDTH: 0.23899
M73 P80 R4
G1 X134.451 Y117.86 E.0013
; LINE_WIDTH: 0.284774
G1 X134.406 Y117.999 E.00157
; LINE_WIDTH: 0.325836
G3 X134.206 Y118.355 I-1.415 J-.561 E.00508
G1 X133.919 Y118.641 E.00502
G3 X133.813 Y118.714 I-.516 J-.639 E.0016
; LINE_WIDTH: 0.299812
G3 X133.424 Y118.887 I-.739 J-1.141 E.00484
; LINE_WIDTH: 0.238997
G1 X133.285 Y118.932 E.0013
; LINE_WIDTH: 0.203141
G3 X132.92 Y118.976 I-.454 J-2.203 E.00273
; LINE_WIDTH: 0.164567
G1 X132.722 Y118.992 E.00116
; LINE_WIDTH: 0.148428
G1 X119.77 Y118.992 E.067
G1 X119.562 Y118.976 E.00108
; LINE_WIDTH: 0.195758
G1 X119.364 Y118.961 E.00141
; LINE_WIDTH: 0.211761
G3 X119.196 Y118.932 I.099 J-1.07 E.00132
; LINE_WIDTH: 0.239006
G1 X119.057 Y118.887 E.0013
; LINE_WIDTH: 0.284783
G1 X118.918 Y118.841 E.00157
; LINE_WIDTH: 0.325838
G3 X118.562 Y118.641 I.561 J-1.416 E.00508
G1 X118.276 Y118.355 E.00502
G3 X118.203 Y118.249 I.641 J-.517 E.0016
; LINE_WIDTH: 0.299812
G3 X118.031 Y117.86 I1.141 J-.739 E.00484
; LINE_WIDTH: 0.238997
G1 X117.985 Y117.721 E.0013
; LINE_WIDTH: 0.203141
G3 X117.941 Y117.355 I2.203 J-.454 E.00273
; LINE_WIDTH: 0.164567
G1 X117.925 Y117.157 E.00116
; LINE_WIDTH: 0.148181
G1 X117.925 Y104.196 E.06692
; LINE_WIDTH: 0.164559
G1 X117.941 Y103.997 E.00116
; LINE_WIDTH: 0.195757
G1 X117.956 Y103.799 E.00141
; LINE_WIDTH: 0.211761
G3 X117.985 Y103.632 I1.07 J.099 E.00132
; LINE_WIDTH: 0.239006
G1 X118.031 Y103.493 E.0013
; LINE_WIDTH: 0.284783
G1 X118.076 Y103.354 E.00157
; LINE_WIDTH: 0.325842
G3 X118.276 Y102.998 I1.416 J.561 E.00508
G1 X118.562 Y102.711 E.00502
G3 X118.668 Y102.639 I.518 J.642 E.0016
; LINE_WIDTH: 0.299809
G3 X119.057 Y102.466 I.739 J1.142 E.00484
; LINE_WIDTH: 0.239004
G1 X119.196 Y102.421 E.0013
; LINE_WIDTH: 0.203141
G3 X119.562 Y102.377 I.454 J2.204 E.00273
; LINE_WIDTH: 0.164567
G1 X119.76 Y102.361 E.00116
; LINE_WIDTH: 0.148428
G1 X132.712 Y102.361 E.067
G1 X132.92 Y102.377 E.00108
; LINE_WIDTH: 0.195756
G1 X133.118 Y102.392 E.00141
; LINE_WIDTH: 0.211781
G3 X133.285 Y102.421 I-.099 J1.071 E.00132
; LINE_WIDTH: 0.23899
G1 X133.424 Y102.466 E.0013
; LINE_WIDTH: 0.28473
G1 X133.563 Y102.511 E.00157
; LINE_WIDTH: 0.325836
G3 X133.919 Y102.711 I-1.84 J3.692 E.00507
G1 X134.206 Y102.998 E.00502
G3 X134.278 Y103.104 I-.642 J.518 E.0016
; LINE_WIDTH: 0.299809
G3 X134.451 Y103.493 I-1.142 J.739 E.00484
; LINE_WIDTH: 0.239004
G1 X134.478 Y103.575 E.00077
; WIPE_START
G1 F15000
G1 X134.541 Y103.997 E-.16237
G1 X134.556 Y104.196 E-.07554
G1 X134.556 Y105.57 E-.5221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.46 Y108.38 Z3.4 F42000
G1 X124.942 Y109.378 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.59 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2541
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2541
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.755 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.626 Y111.342 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06984
G3 X126.229 Y107.989 I.634 J3.027 E.0096
G3 X123.642 Y111.4 I.002 J2.688 E.19383
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 31/72
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-.998 J-.696 P1  F42000
G1 X118.213 Y117.532 Z3.4
G1 Z3.1
G1 E.8 F1800
G1 F2551
M204 S5000
G1 X118.152 Y117.15 E.00627
G1 X118.152 Y104.203 E.21024
G1 X118.23 Y103.714 E.00803
G1 X118.462 Y103.259 E.0083
G1 X118.823 Y102.897 E.0083
G1 X119.279 Y102.665 E.0083
G1 X119.767 Y102.588 E.00803
G1 X132.714 Y102.588 E.21024
G1 X133.203 Y102.665 E.00803
G1 X133.658 Y102.897 E.0083
G1 X134.02 Y103.259 E.0083
G1 X134.252 Y103.714 E.0083
G1 X134.329 Y104.203 E.00803
G1 X134.329 Y117.15 E.21024
G1 X134.252 Y117.639 E.00803
G1 X134.02 Y118.094 E.0083
G1 X133.658 Y118.456 E.0083
G1 X133.203 Y118.688 E.0083
G1 X132.714 Y118.765 E.00803
G1 X119.767 Y118.765 E.21024
G1 X119.279 Y118.688 E.00803
G1 X118.823 Y118.456 E.0083
G1 X118.462 Y118.094 E.0083
G1 X118.23 Y117.639 E.0083
G1 X118.222 Y117.591 E.00078
; WIPE_START
G1 F3600
M204 S6000
G1 X118.152 Y117.15 E-.1696
G1 X118.152 Y115.596 E-.5904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y110.592 Z3.5 F42000
G1 X133.662 Y102.128 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F2551
M204 S5000
G1 X133.702 Y102.135 E.00067
G1 X134.171 Y102.374 E.00855
G1 X134.543 Y102.746 E.00854
G1 X134.782 Y103.215 E.00855
G1 X134.867 Y103.769 E.00911
G1 X134.867 Y117.584 E.22431
G1 X134.782 Y118.138 E.00911
G1 X134.543 Y118.607 E.00855
G1 X134.171 Y118.979 E.00854
G1 X133.702 Y119.218 E.00855
G1 X133.148 Y119.303 E.00911
G1 X119.334 Y119.303 E.22431
G1 X118.779 Y119.218 E.00911
G1 X118.31 Y118.979 E.00855
G1 X117.938 Y118.607 E.00854
G1 X117.699 Y118.138 E.00855
G1 X117.614 Y117.584 E.00911
G1 X117.614 Y103.769 E.22431
G1 X117.699 Y103.215 E.00911
G1 X117.938 Y102.746 E.00855
G1 X118.31 Y102.374 E.00854
G1 X118.779 Y102.135 E.00855
G1 X119.334 Y102.05 E.00911
G1 X133.148 Y102.05 E.22431
G1 X133.603 Y102.119 E.00747
; WIPE_START
G1 F3600
M204 S6000
G1 X133.702 Y102.135 E-.03837
G1 X134.171 Y102.374 E-.19999
G1 X134.543 Y102.746 E-.19996
G1 X134.782 Y103.215 E-.19997
G1 X134.831 Y103.531 E-.12171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 31 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.5 F4000
            G39.3 S1
            G0 Z3.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer31 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.537 Y103.606 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.201529
G1 F2551
M204 S6000
G3 X134.582 Y103.976 I-2.242 J.46 E.00274
; LINE_WIDTH: 0.162436
G1 X134.598 Y104.177 E.00116
; LINE_WIDTH: 0.146114
G1 X134.598 Y117.166 E.06597
G1 X134.582 Y117.377 E.00107
; LINE_WIDTH: 0.194082
G1 X134.566 Y117.578 E.00142
; LINE_WIDTH: 0.210294
G3 X134.537 Y117.747 I-1.084 J-.1 E.00132
; LINE_WIDTH: 0.237775
G1 X134.491 Y117.888 E.0013
; LINE_WIDTH: 0.284095
G1 X134.446 Y118.029 E.00158
; LINE_WIDTH: 0.325632
G3 X134.243 Y118.389 I-1.43 J-.567 E.00514
G1 X133.953 Y118.679 E.00508
G3 X133.846 Y118.752 I-.522 J-.647 E.00161
; LINE_WIDTH: 0.299324
G3 X133.452 Y118.927 I-.749 J-1.157 E.0049
; LINE_WIDTH: 0.237772
G1 X133.311 Y118.973 E.0013
; LINE_WIDTH: 0.20153
G3 X132.941 Y119.018 I-.46 J-2.242 E.00274
; LINE_WIDTH: 0.162436
G1 X132.74 Y119.034 E.00116
; LINE_WIDTH: 0.146114
G1 X119.751 Y119.034 E.06597
G1 X119.54 Y119.018 E.00107
; LINE_WIDTH: 0.194082
G1 X119.339 Y119.002 E.00142
; LINE_WIDTH: 0.210294
G3 X119.17 Y118.973 I.1 J-1.084 E.00132
; LINE_WIDTH: 0.237775
G1 X119.029 Y118.927 E.0013
; LINE_WIDTH: 0.284095
G1 X118.889 Y118.881 E.00158
; LINE_WIDTH: 0.325633
G3 X118.528 Y118.679 I.567 J-1.43 E.00514
G1 X118.238 Y118.389 E.00508
G3 X118.165 Y118.282 I.648 J-.523 E.00161
; LINE_WIDTH: 0.299324
G3 X117.99 Y117.888 I1.157 J-.749 E.0049
; LINE_WIDTH: 0.237772
G1 X117.944 Y117.747 E.0013
; LINE_WIDTH: 0.20153
G3 X117.899 Y117.377 I2.242 J-.46 E.00274
; LINE_WIDTH: 0.162436
G1 X117.884 Y117.176 E.00116
; LINE_WIDTH: 0.145861
G1 X117.884 Y104.177 E.06589
; LINE_WIDTH: 0.162454
G1 X117.899 Y103.976 E.00116
; LINE_WIDTH: 0.194082
G1 X117.915 Y103.775 E.00142
; LINE_WIDTH: 0.210294
G3 X117.944 Y103.606 I1.084 J.1 E.00132
; LINE_WIDTH: 0.237775
G1 X117.99 Y103.465 E.0013
; LINE_WIDTH: 0.284095
G1 X118.036 Y103.324 E.00158
; LINE_WIDTH: 0.325632
G3 X118.238 Y102.964 I1.43 J.567 E.00514
G1 X118.528 Y102.674 E.00508
G3 X118.635 Y102.601 I.522 J.647 E.00161
; LINE_WIDTH: 0.299324
G3 X119.029 Y102.426 I.749 J1.157 E.0049
; LINE_WIDTH: 0.237772
G1 X119.17 Y102.38 E.0013
; LINE_WIDTH: 0.20153
G3 X119.54 Y102.335 I.46 J2.242 E.00274
; LINE_WIDTH: 0.162436
G1 X119.741 Y102.319 E.00116
; LINE_WIDTH: 0.146114
G1 X132.731 Y102.319 E.06597
G1 X132.941 Y102.335 E.00107
; LINE_WIDTH: 0.194078
G1 X133.142 Y102.351 E.00142
; LINE_WIDTH: 0.210312
G3 X133.311 Y102.38 I-.1 J1.083 E.00132
; LINE_WIDTH: 0.237777
G1 X133.452 Y102.426 E.0013
; LINE_WIDTH: 0.284095
G1 X133.593 Y102.472 E.00158
; LINE_WIDTH: 0.325627
G3 X133.953 Y102.674 I-.567 J1.431 E.00514
G1 X134.243 Y102.964 E.00508
G3 X134.317 Y103.071 I-.647 J.522 E.00161
; LINE_WIDTH: 0.299321
G3 X134.491 Y103.465 I-1.156 J.749 E.0049
; LINE_WIDTH: 0.237767
G1 X134.519 Y103.549 E.00078
; WIPE_START
G1 F15000
G1 X134.582 Y103.976 E-.16406
G1 X134.598 Y104.177 E-.07659
G1 X134.598 Y105.543 E-.51935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.504 Y108.36 Z3.5 F42000
G1 X124.942 Y109.378 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2551
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.587 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2551
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
M73 P81 R4
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2551
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00677
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14984
G1 X128.136 Y109.378 E-.17433
G1 X127.599 Y109.378 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2551
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2551
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.759 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20272
G1 X124.4 Y112.022 E-.10429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.342 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2551
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06543
G3 X126.234 Y107.989 I.839 J2.489 E.01405
G3 X123.644 Y111.399 I-.001 J2.688 E.19381
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12474
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02391
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 32/72
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I-.996 J-.7 P1  F42000
G1 X118.167 Y117.535 Z3.5
G1 Z3.2
G1 E.8 F1800
G1 F2561
M204 S5000
G1 X118.109 Y117.169 E.00602
G1 X118.109 Y104.184 E.21086
G1 X118.188 Y103.688 E.00815
G1 X118.423 Y103.226 E.00842
G1 X118.79 Y102.859 E.00842
G1 X119.252 Y102.624 E.00842
G1 X119.748 Y102.545 E.00815
G1 X132.733 Y102.545 E.21086
G1 X133.229 Y102.624 E.00815
G1 X133.691 Y102.859 E.00842
G1 X134.058 Y103.226 E.00842
G1 X134.294 Y103.688 E.00842
G1 X134.372 Y104.184 E.00815
G1 X134.372 Y117.169 E.21086
G1 X134.294 Y117.665 E.00815
G1 X134.058 Y118.127 E.00842
G1 X133.691 Y118.494 E.00842
G1 X133.229 Y118.729 E.00842
G1 X132.733 Y118.808 E.00815
G1 X119.748 Y118.808 E.21086
G1 X119.252 Y118.729 E.00815
G1 X118.79 Y118.494 E.00842
G1 X118.423 Y118.127 E.00842
G1 X118.188 Y117.665 E.00842
G1 X118.177 Y117.595 E.00116
; WIPE_START
G1 F3600
M204 S6000
G1 X118.109 Y117.169 E-.16368
G1 X118.109 Y115.6 E-.59633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.878 Y110.602 Z3.6 F42000
G1 X133.703 Y102.091 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F2561
M204 S5000
G1 X133.732 Y102.095 E.00048
G1 X134.205 Y102.336 E.00863
G1 X134.581 Y102.712 E.00863
G1 X134.822 Y103.185 E.00863
G1 X134.908 Y103.745 E.00919
G1 X134.908 Y117.608 E.2251
G1 X134.822 Y118.167 E.00919
G1 X134.581 Y118.641 E.00863
G1 X134.205 Y119.017 E.00863
G1 X133.732 Y119.258 E.00863
G1 X133.172 Y119.343 E.00919
G1 X119.309 Y119.343 E.2251
G1 X118.75 Y119.258 E.00919
G1 X118.276 Y119.017 E.00863
G1 X117.901 Y118.641 E.00863
G1 X117.659 Y118.167 E.00863
G1 X117.574 Y117.608 E.00919
G1 X117.574 Y103.745 E.2251
G1 X117.659 Y103.185 E.00919
G1 X117.901 Y102.712 E.00863
G1 X118.276 Y102.336 E.00863
G1 X118.75 Y102.095 E.00863
G1 X119.309 Y102.009 E.00919
G1 X133.172 Y102.009 E.2251
G1 X133.643 Y102.081 E.00774
; WIPE_START
G1 F3600
M204 S6000
G1 X133.732 Y102.095 E-.03403
G1 X134.205 Y102.336 E-.20191
G1 X134.581 Y102.712 E-.20189
G1 X134.822 Y103.185 E-.20191
G1 X134.87 Y103.498 E-.12026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 32 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer32 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.578 Y103.58 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.199942
G1 F2561
M204 S6000
G3 X134.624 Y103.954 I-2.277 J.466 E.00275
; LINE_WIDTH: 0.16033
G1 X134.64 Y104.158 E.00116
; LINE_WIDTH: 0.1438
G1 X134.64 Y117.185 E.06494
G1 X134.624 Y117.399 E.00107
; LINE_WIDTH: 0.192392
G1 X134.608 Y117.602 E.00142
; LINE_WIDTH: 0.208843
G3 X134.578 Y117.773 I-1.091 J-.1 E.00132
; LINE_WIDTH: 0.236551
G1 X134.532 Y117.916 E.00131
; LINE_WIDTH: 0.283416
G1 X134.486 Y118.058 E.0016
; LINE_WIDTH: 0.325426
G3 X134.281 Y118.423 I-1.446 J-.572 E.0052
G1 X133.987 Y118.716 E.00514
G3 X133.879 Y118.79 I-.528 J-.654 E.00162
; LINE_WIDTH: 0.298846
G3 X133.48 Y118.968 I-.759 J-1.172 E.00496
; LINE_WIDTH: 0.236566
G1 X133.337 Y119.014 E.00131
; LINE_WIDTH: 0.199941
G3 X132.963 Y119.059 I-.466 J-2.277 E.00275
; LINE_WIDTH: 0.16033
G1 X132.759 Y119.075 E.00116
; LINE_WIDTH: 0.1438
G1 X119.732 Y119.076 E.06494
G1 X119.518 Y119.059 E.00107
; LINE_WIDTH: 0.192392
G1 X119.315 Y119.043 E.00142
; LINE_WIDTH: 0.208843
G3 X119.144 Y119.014 I.1 J-1.091 E.00132
; LINE_WIDTH: 0.236551
G1 X119.002 Y118.968 E.00131
; LINE_WIDTH: 0.283416
G1 X118.859 Y118.921 E.0016
; LINE_WIDTH: 0.325426
G3 X118.494 Y118.716 I.572 J-1.446 E.0052
G1 X118.201 Y118.423 E.00514
G3 X118.127 Y118.315 I.654 J-.528 E.00162
; LINE_WIDTH: 0.298846
G3 X117.95 Y117.916 I1.172 J-.759 E.00496
; LINE_WIDTH: 0.236566
G1 X117.903 Y117.773 E.00131
; LINE_WIDTH: 0.199941
G3 X117.858 Y117.399 I2.277 J-.466 E.00275
; LINE_WIDTH: 0.16033
G1 X117.842 Y117.195 E.00116
; LINE_WIDTH: 0.143541
G1 X117.842 Y104.158 E.06485
; LINE_WIDTH: 0.160331
G1 X117.858 Y103.954 E.00116
; LINE_WIDTH: 0.192392
G1 X117.874 Y103.75 E.00142
; LINE_WIDTH: 0.208843
G3 X117.903 Y103.58 I1.091 J.1 E.00132
; LINE_WIDTH: 0.236551
G1 X117.95 Y103.437 E.00131
; LINE_WIDTH: 0.283416
G1 X117.996 Y103.295 E.0016
; LINE_WIDTH: 0.325426
G3 X118.201 Y102.93 I1.446 J.572 E.0052
G1 X118.494 Y102.637 E.00514
G3 X118.602 Y102.563 I.528 J.654 E.00162
; LINE_WIDTH: 0.298846
G3 X119.002 Y102.385 I.759 J1.172 E.00496
; LINE_WIDTH: 0.236566
G1 X119.144 Y102.339 E.00131
; LINE_WIDTH: 0.199941
G3 X119.518 Y102.294 I.466 J2.277 E.00275
; LINE_WIDTH: 0.16033
G1 X119.722 Y102.278 E.00116
; LINE_WIDTH: 0.1438
G1 X132.75 Y102.277 E.06494
G1 X132.963 Y102.294 E.00107
; LINE_WIDTH: 0.192392
G1 X133.167 Y102.31 E.00142
; LINE_WIDTH: 0.208843
G3 X133.337 Y102.339 I-.1 J1.091 E.00132
; LINE_WIDTH: 0.236551
G1 X133.48 Y102.385 E.00131
; LINE_WIDTH: 0.283416
G1 X133.622 Y102.432 E.0016
; LINE_WIDTH: 0.325425
G3 X133.987 Y102.637 I-.572 J1.446 E.0052
G1 X134.281 Y102.93 E.00514
G3 X134.355 Y103.038 I-.653 J.527 E.00162
; LINE_WIDTH: 0.298847
G3 X134.532 Y103.437 I-1.172 J.759 E.00496
; LINE_WIDTH: 0.236566
G1 X134.56 Y103.523 E.00079
; WIPE_START
G1 F15000
G1 X134.624 Y103.954 E-.16576
G1 X134.64 Y104.158 E-.07764
G1 X134.64 Y105.517 E-.51661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.548 Y108.34 Z3.6 F42000
G1 X124.942 Y109.378 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2561
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2561
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2561
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17439
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2561
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06544
G3 X126.239 Y107.989 I.839 J2.485 E.01413
G3 X123.644 Y111.4 I-.006 J2.688 E.19371
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 33/72
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.993 J-.703 P1  F42000
G1 X118.122 Y117.539 Z3.6
G1 Z3.3
G1 E.8 F1800
G1 F2570
M204 S5000
G1 X118.066 Y117.188 E.00577
G1 X118.066 Y104.165 E.21148
G1 X118.146 Y103.662 E.00827
G1 X118.385 Y103.193 E.00854
G1 X118.757 Y102.821 E.00854
G1 X119.226 Y102.582 E.00854
G1 X119.729 Y102.502 E.00827
G1 X132.753 Y102.502 E.21148
G1 X133.256 Y102.582 E.00827
G1 X133.724 Y102.821 E.00854
G1 X134.096 Y103.193 E.00854
G1 X134.335 Y103.662 E.00854
G1 X134.415 Y104.165 E.00827
G1 X134.415 Y117.188 E.21148
G1 X134.335 Y117.691 E.00827
G1 X134.096 Y118.16 E.00854
G1 X133.724 Y118.532 E.00854
G1 X133.256 Y118.771 E.00854
G1 X132.753 Y118.851 E.00827
G1 X119.729 Y118.851 E.21148
G1 X119.226 Y118.771 E.00827
G1 X118.757 Y118.532 E.00854
G1 X118.385 Y118.16 E.00854
G1 X118.146 Y117.691 E.00854
G1 X118.131 Y117.598 E.00153
; WIPE_START
G1 F3600
M204 S6000
G1 X118.066 Y117.188 E-.15779
G1 X118.066 Y115.603 E-.60221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.84 Y110.612 Z3.7 F42000
G1 X133.741 Y102.052 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F2570
M204 S5000
G1 X133.742 Y102.052 E.00001
G1 X133.761 Y102.055 E.00031
G1 X134.239 Y102.299 E.00871
G1 X134.618 Y102.678 E.00871
G1 X134.862 Y103.156 E.00871
G1 X134.948 Y103.721 E.00928
G1 X134.948 Y117.632 E.22589
G1 X134.862 Y118.197 E.00927
G1 X134.618 Y118.675 E.00871
G1 X134.239 Y119.054 E.00871
G1 X133.761 Y119.297 E.00871
G1 X133.196 Y119.384 E.00928
G1 X119.285 Y119.384 E.22589
G1 X118.72 Y119.298 E.00927
G1 X118.243 Y119.054 E.00871
G1 X117.863 Y118.675 E.00871
G1 X117.62 Y118.197 E.00871
G1 X117.533 Y117.632 E.00928
G1 X117.533 Y103.721 E.22589
G1 X117.62 Y103.156 E.00927
G1 X117.863 Y102.678 E.00871
G1 X118.242 Y102.299 E.00871
G1 X118.72 Y102.055 E.00871
G1 X119.285 Y101.969 E.00928
G1 X133.196 Y101.969 E.22589
G1 X133.682 Y102.043 E.00798
; WIPE_START
G1 F3600
M204 S6000
G1 X133.742 Y102.052 E-.02306
G1 X133.761 Y102.055 E-.00733
G1 X134.239 Y102.299 E-.20384
G1 X134.618 Y102.678 E-.20383
G1 X134.862 Y103.156 E-.20382
G1 X134.909 Y103.463 E-.11812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 33 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P82 R4
G1 Z3.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.7 F4000
            G39.3 S1
            G0 Z3.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer33 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.619 Y103.554 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.198327
G1 F2570
M204 S6000
G3 X134.665 Y103.933 I-2.317 J.473 E.00275
; LINE_WIDTH: 0.158214
G1 X134.681 Y104.139 E.00115
; LINE_WIDTH: 0.141486
G1 X134.682 Y117.204 E.06389
G1 X134.665 Y117.42 E.00106
; LINE_WIDTH: 0.190711
G1 X134.649 Y117.627 E.00143
; LINE_WIDTH: 0.207354
G3 X134.619 Y117.799 I-1.101 J-.101 E.00133
; LINE_WIDTH: 0.235331
G1 X134.572 Y117.943 E.00132
; LINE_WIDTH: 0.282744
G1 X134.525 Y118.087 E.00161
; LINE_WIDTH: 0.325229
G3 X134.318 Y118.457 I-1.46 J-.577 E.00526
G1 X134.021 Y118.754 E.0052
G3 X133.912 Y118.829 I-.532 J-.659 E.00163
; LINE_WIDTH: 0.298353
G3 X133.508 Y119.008 I-.769 J-1.187 E.00501
; LINE_WIDTH: 0.235315
G1 X133.364 Y119.055 E.00132
; LINE_WIDTH: 0.198328
G3 X132.985 Y119.101 I-.473 J-2.317 E.00275
; LINE_WIDTH: 0.158214
G1 X132.778 Y119.117 E.00115
; LINE_WIDTH: 0.141486
G1 X119.713 Y119.117 E.06389
G1 X119.497 Y119.101 E.00106
; LINE_WIDTH: 0.190711
G1 X119.29 Y119.085 E.00143
; LINE_WIDTH: 0.207354
G3 X119.118 Y119.055 I.101 J-1.101 E.00133
; LINE_WIDTH: 0.235331
G1 X118.974 Y119.008 E.00132
; LINE_WIDTH: 0.282744
G1 X118.83 Y118.961 E.00161
; LINE_WIDTH: 0.325229
G3 X118.461 Y118.754 I.577 J-1.46 E.00526
G1 X118.163 Y118.457 E.0052
G3 X118.089 Y118.348 I.659 J-.532 E.00163
; LINE_WIDTH: 0.298353
G3 X117.909 Y117.943 I1.187 J-.769 E.00501
; LINE_WIDTH: 0.235315
G1 X117.862 Y117.799 E.00132
; LINE_WIDTH: 0.198328
G3 X117.816 Y117.42 I2.317 J-.473 E.00275
; LINE_WIDTH: 0.158214
G1 X117.8 Y117.214 E.00115
; LINE_WIDTH: 0.141221
G1 X117.8 Y104.139 E.0638
; LINE_WIDTH: 0.15821
G1 X117.816 Y103.933 E.00115
; LINE_WIDTH: 0.190711
G1 X117.833 Y103.726 E.00143
; LINE_WIDTH: 0.207353
G3 X117.862 Y103.554 I1.1 J.101 E.00133
; LINE_WIDTH: 0.235332
G1 X117.909 Y103.41 E.00132
; LINE_WIDTH: 0.282742
G1 X117.956 Y103.265 E.00161
; LINE_WIDTH: 0.325237
G3 X118.163 Y102.896 I1.46 J.577 E.00526
G1 X118.461 Y102.599 E.0052
G3 X118.569 Y102.524 I.532 J.658 E.00163
; LINE_WIDTH: 0.29837
G3 X118.974 Y102.345 I.769 J1.187 E.00501
; LINE_WIDTH: 0.235322
G1 X119.118 Y102.298 E.00132
; LINE_WIDTH: 0.198328
G3 X119.497 Y102.252 I.473 J2.318 E.00275
; LINE_WIDTH: 0.158214
G1 X119.703 Y102.236 E.00115
; LINE_WIDTH: 0.141486
G1 X132.769 Y102.236 E.06389
G1 X132.985 Y102.252 E.00106
; LINE_WIDTH: 0.190713
G1 X133.191 Y102.268 E.00143
; LINE_WIDTH: 0.207356
G3 X133.364 Y102.298 I-.102 J1.106 E.00133
; LINE_WIDTH: 0.235321
G1 X133.508 Y102.345 E.00132
; LINE_WIDTH: 0.282741
G1 X133.652 Y102.392 E.00161
; LINE_WIDTH: 0.325229
G3 X134.021 Y102.599 I-.577 J1.46 E.00526
G1 X134.318 Y102.896 E.0052
G3 X134.393 Y103.005 I-.659 J.532 E.00163
; LINE_WIDTH: 0.298346
G3 X134.572 Y103.41 I-1.188 J.769 E.00501
; LINE_WIDTH: 0.235315
G1 X134.601 Y103.497 E.0008
; WIPE_START
G1 F15000
G1 X134.665 Y103.933 E-.16745
G1 X134.681 Y104.139 E-.07869
G1 X134.681 Y105.491 E-.51386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.593 Y108.32 Z3.7 F42000
G1 X124.942 Y109.378 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2570
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.343 J2.593 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2570
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2570
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2570
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2570
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2570
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06545
G3 X126.245 Y107.989 I.838 J2.483 E.01422
G3 X123.643 Y111.4 I-.012 J2.688 E.19365
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 34/72
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I-.991 J-.707 P1  F42000
G1 X118.077 Y117.543 Z3.7
G1 Z3.4
G1 E.8 F1800
G1 F2580
M204 S5000
G1 X118.024 Y117.207 E.00552
G1 X118.024 Y104.146 E.21209
G1 X118.104 Y103.635 E.00839
G1 X118.347 Y103.16 E.00866
G1 X118.658 Y102.849 E.00715
G1 X118.724 Y102.782 E.00152
G1 X119.199 Y102.54 E.00866
G1 X119.71 Y102.459 E.00839
G1 X132.772 Y102.459 E.21209
G1 X133.282 Y102.54 E.00839
G1 X133.757 Y102.782 E.00866
G1 X134.135 Y103.16 E.00866
G1 X134.377 Y103.635 E.00866
G1 X134.458 Y104.146 E.00839
G1 X134.458 Y117.207 E.21209
G1 X134.377 Y117.718 E.00839
G1 X134.135 Y118.193 E.00866
G1 X133.757 Y118.57 E.00866
G1 X133.282 Y118.813 E.00866
G1 X132.772 Y118.894 E.00839
G1 X119.71 Y118.894 E.21209
G1 X119.199 Y118.813 E.00839
G1 X118.724 Y118.57 E.00866
G1 X118.347 Y118.193 E.00866
G1 X118.104 Y117.718 E.00866
G1 X118.086 Y117.602 E.0019
; WIPE_START
G1 F3600
M204 S6000
G1 X118.024 Y117.207 E-.15196
G1 X118.024 Y115.607 E-.60805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.803 Y110.622 Z3.8 F42000
G1 X133.78 Y102.014 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2580
M204 S5000
G1 X133.782 Y102.014 E.00004
G1 X133.79 Y102.016 E.00013
G1 X134.273 Y102.261 E.00879
G1 X134.656 Y102.644 E.00879
G1 X134.902 Y103.127 E.00879
G1 X134.989 Y103.696 E.00936
G1 X134.989 Y117.657 E.22668
G1 X134.902 Y118.226 E.00936
G1 X134.656 Y118.709 E.00879
G1 X134.273 Y119.091 E.00879
G1 X133.79 Y119.337 E.00879
G1 X133.221 Y119.425 E.00936
G1 X119.261 Y119.425 E.22668
G1 X118.691 Y119.337 E.00936
G1 X118.209 Y119.091 E.00879
G1 X117.826 Y118.709 E.00879
G1 X117.58 Y118.226 E.00879
G1 X117.493 Y117.657 E.00936
G1 X117.493 Y103.696 E.22668
G1 X117.58 Y103.127 E.00936
G1 X117.826 Y102.644 E.00879
G1 X118.209 Y102.261 E.00879
G1 X118.691 Y102.016 E.00879
G1 X119.261 Y101.928 E.00936
G1 X133.221 Y101.928 E.22668
G1 X133.721 Y102.005 E.00821
; WIPE_START
G1 F3600
M204 S6000
G1 X133.782 Y102.014 E-.02367
G1 X133.79 Y102.016 E-.00309
G1 X134.273 Y102.261 E-.20577
G1 X134.656 Y102.644 E-.20575
G1 X134.902 Y103.127 E-.20576
G1 X134.948 Y103.428 E-.11597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 34 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer34 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.658 Y103.522 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.234089
G1 F2580
M204 S6000
G1 X134.66 Y103.528 E.00005
; LINE_WIDTH: 0.196733
G3 X134.707 Y103.911 I-2.352 J.479 E.00276
; LINE_WIDTH: 0.156101
G1 X134.723 Y104.12 E.00115
; LINE_WIDTH: 0.139182
G1 X134.723 Y117.224 E.06285
G1 X134.707 Y117.442 E.00105
; LINE_WIDTH: 0.189036
G1 X134.69 Y117.651 E.00143
; LINE_WIDTH: 0.205885
G3 X134.66 Y117.825 I-1.114 J-.102 E.00133
; LINE_WIDTH: 0.234092
G1 X134.613 Y117.971 E.00133
; LINE_WIDTH: 0.282067
G1 X134.565 Y118.117 E.00163
; LINE_WIDTH: 0.325027
G3 X134.356 Y118.491 I-1.475 J-.582 E.00532
G1 X134.055 Y118.791 E.00526
G3 X133.945 Y118.867 I-.536 J-.663 E.00165
; LINE_WIDTH: 0.297875
G3 X133.535 Y119.048 I-.779 J-1.202 E.00507
; LINE_WIDTH: 0.234089
G1 X133.39 Y119.096 E.00133
; LINE_WIDTH: 0.196731
G3 X133.006 Y119.142 I-.479 J-2.352 E.00276
; LINE_WIDTH: 0.156101
G1 X132.797 Y119.159 E.00115
; LINE_WIDTH: 0.139182
G1 X119.694 Y119.159 E.06285
G1 X119.475 Y119.142 E.00105
; LINE_WIDTH: 0.189036
G1 X119.266 Y119.126 E.00143
; LINE_WIDTH: 0.205885
G3 X119.092 Y119.096 I.102 J-1.114 E.00133
; LINE_WIDTH: 0.234092
G1 X118.946 Y119.048 E.00133
; LINE_WIDTH: 0.282067
G1 X118.8 Y119.001 E.00163
; LINE_WIDTH: 0.325027
G3 X118.427 Y118.791 I.582 J-1.475 E.00532
G1 X118.126 Y118.491 E.00526
G3 X118.051 Y118.381 I.663 J-.536 E.00165
; LINE_WIDTH: 0.297875
M73 P82 R3
G3 X117.869 Y117.971 I1.202 J-.779 E.00507
; LINE_WIDTH: 0.234089
G1 X117.821 Y117.825 E.00133
; LINE_WIDTH: 0.196731
G3 X117.775 Y117.442 I2.352 J-.479 E.00276
; LINE_WIDTH: 0.156101
G1 X117.758 Y117.233 E.00115
; LINE_WIDTH: 0.138911
G1 X117.758 Y104.12 E.06275
; LINE_WIDTH: 0.156105
G1 X117.775 Y103.911 E.00115
; LINE_WIDTH: 0.189036
G1 X117.791 Y103.702 E.00143
; LINE_WIDTH: 0.205884
G3 X117.821 Y103.528 I1.113 J.102 E.00133
; LINE_WIDTH: 0.234091
G1 X117.869 Y103.382 E.00133
; LINE_WIDTH: 0.282057
G1 X117.916 Y103.236 E.00163
; LINE_WIDTH: 0.325021
G3 X118.536 Y102.486 I1.585 J.68 E.0122
; LINE_WIDTH: 0.297875
G3 X118.946 Y102.304 I.779 J1.202 E.00507
; LINE_WIDTH: 0.234089
G1 X119.092 Y102.257 E.00133
; LINE_WIDTH: 0.196731
G3 X119.475 Y102.211 I.479 J2.352 E.00276
; LINE_WIDTH: 0.156101
G1 X119.684 Y102.194 E.00115
; LINE_WIDTH: 0.139181
G1 X132.788 Y102.194 E.06285
G1 X133.006 Y102.211 E.00105
; LINE_WIDTH: 0.189028
G1 X133.215 Y102.227 E.00143
; LINE_WIDTH: 0.205874
G3 X133.39 Y102.257 I-.102 J1.114 E.00133
; LINE_WIDTH: 0.234099
G1 X133.535 Y102.304 E.00133
; LINE_WIDTH: 0.282066
G1 X133.681 Y102.352 E.00163
; LINE_WIDTH: 0.325022
G3 X134.055 Y102.562 I-.583 J1.475 E.00532
G1 X134.356 Y102.862 E.00526
G3 X134.431 Y102.972 I-.665 J.537 E.00165
; LINE_WIDTH: 0.297867
G3 X134.613 Y103.382 I-1.203 J.779 E.00507
; LINE_WIDTH: 0.234089
G1 X134.64 Y103.465 E.00076
; WIPE_START
G1 F15000
G1 X134.66 Y103.528 E-.02487
G1 X134.707 Y103.911 E-.14672
G1 X134.723 Y104.12 E-.07975
G1 X134.723 Y105.459 E-.50867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.638 Y108.298 Z3.8 F42000
G1 X124.942 Y109.378 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2580
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.331 J2.582 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2580
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
M73 P83 R3
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2580
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2580
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2580
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2580
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06545
G3 X126.25 Y107.989 I.838 J2.482 E.0143
G3 X123.643 Y111.4 I-.017 J2.688 E.19356
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 35/72
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.988 J-.71 P1  F42000
G1 X118.032 Y117.547 Z3.8
G1 Z3.5
G1 E.8 F1800
G1 F2590
M204 S5000
G1 X117.981 Y117.226 E.00527
G1 X117.981 Y104.127 E.21271
G1 X118.063 Y103.609 E.00851
G1 X118.308 Y103.127 E.00879
G1 X118.691 Y102.744 E.00879
G1 X119.173 Y102.498 E.00879
G1 X119.691 Y102.416 E.00851
G1 X132.791 Y102.416 E.21271
G1 X133.308 Y102.498 E.00851
G1 X133.791 Y102.744 E.00879
G1 X134.173 Y103.127 E.00879
G1 X134.419 Y103.609 E.00879
G1 X134.501 Y104.127 E.00851
G1 X134.501 Y117.226 E.21271
G1 X134.419 Y117.744 E.00851
G1 X134.173 Y118.226 E.00879
G1 X133.791 Y118.609 E.00879
G1 X133.308 Y118.854 E.00879
G1 X132.791 Y118.936 E.00851
G1 X119.691 Y118.936 E.21271
G1 X119.173 Y118.854 E.00851
G1 X118.691 Y118.609 E.00879
G1 X118.308 Y118.226 E.00879
G1 X118.063 Y117.744 E.00879
G1 X118.041 Y117.606 E.00227
; WIPE_START
G1 F3600
M204 S6000
G1 X117.981 Y117.226 E-.14619
G1 X117.981 Y115.611 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.764 Y110.631 Z3.9 F42000
G1 X133.816 Y101.975 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F2590
M204 S5000
G1 X133.82 Y101.976 E.00005
G1 X134.307 Y102.224 E.00888
G1 X134.693 Y102.61 E.00887
G1 X134.941 Y103.097 E.00888
G1 X135.029 Y103.672 E.00944
G1 X135.029 Y117.681 E.22747
G1 X134.941 Y118.255 E.00944
G1 X134.693 Y118.742 E.00888
G1 X134.307 Y119.129 E.00887
G1 X133.82 Y119.377 E.00887
G1 X133.245 Y119.465 E.00944
G1 X119.236 Y119.465 E.22747
G1 X118.662 Y119.377 E.00944
G1 X118.175 Y119.129 E.00888
G1 X117.788 Y118.742 E.00887
G1 X117.54 Y118.255 E.00887
G1 X117.452 Y117.681 E.00944
G1 X117.452 Y103.672 E.22747
G1 X117.54 Y103.097 E.00944
G1 X117.788 Y102.61 E.00888
G1 X118.175 Y102.224 E.00887
G1 X118.662 Y101.976 E.00887
G1 X119.236 Y101.888 E.00944
G1 X133.245 Y101.888 E.22747
G1 X133.757 Y101.966 E.00841
; WIPE_START
G1 F3600
M204 S6000
G1 X133.82 Y101.976 E-.02408
G1 X134.307 Y102.224 E-.20769
G1 X134.693 Y102.61 E-.20767
G1 X134.941 Y103.097 E-.20769
G1 X134.986 Y103.391 E-.11285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 35 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.9 F4000
            G39.3 S1
            G0 Z3.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer35 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.696 Y103.485 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.232872
G1 F2590
M204 S6000
G1 X134.701 Y103.502 E.00015
; LINE_WIDTH: 0.195136
G3 X134.748 Y103.889 I-2.389 J.485 E.00277
; LINE_WIDTH: 0.15399
G1 X134.765 Y104.101 E.00115
; LINE_WIDTH: 0.136867
G1 X134.765 Y117.243 E.06179
G1 X134.748 Y117.464 E.00104
; LINE_WIDTH: 0.187356
G1 X134.731 Y117.676 E.00144
; LINE_WIDTH: 0.204415
G3 X134.701 Y117.851 I-1.122 J-.102 E.00133
; LINE_WIDTH: 0.232884
G1 X134.653 Y117.999 E.00134
; LINE_WIDTH: 0.281389
G1 X134.605 Y118.146 E.00164
; LINE_WIDTH: 0.324818
G3 X134.393 Y118.524 I-1.491 J-.588 E.00538
G1 X134.089 Y118.829 E.00532
G3 X133.978 Y118.905 I-.541 J-.669 E.00166
; LINE_WIDTH: 0.297383
G3 X133.563 Y119.089 I-.789 J-1.218 E.00513
; LINE_WIDTH: 0.232872
G1 X133.416 Y119.137 E.00134
; LINE_WIDTH: 0.195139
G3 X133.028 Y119.184 I-.485 J-2.389 E.00277
; LINE_WIDTH: 0.15399
G1 X132.816 Y119.2 E.00115
; LINE_WIDTH: 0.136867
G1 X119.675 Y119.201 E.06179
G1 X119.454 Y119.184 E.00104
; LINE_WIDTH: 0.187356
G1 X119.242 Y119.167 E.00144
; LINE_WIDTH: 0.204415
G3 X119.066 Y119.137 I.102 J-1.122 E.00133
; LINE_WIDTH: 0.232884
G1 X118.918 Y119.089 E.00134
; LINE_WIDTH: 0.281389
G1 X118.771 Y119.041 E.00164
; LINE_WIDTH: 0.324818
G3 X118.393 Y118.829 I.588 J-1.491 E.00538
G1 X118.088 Y118.524 E.00532
G3 X118.012 Y118.414 I.669 J-.541 E.00166
; LINE_WIDTH: 0.297383
G3 X117.828 Y117.999 I1.218 J-.789 E.00513
; LINE_WIDTH: 0.232872
G1 X117.78 Y117.851 E.00134
; LINE_WIDTH: 0.195139
G3 X117.733 Y117.464 I2.389 J-.485 E.00277
; LINE_WIDTH: 0.15399
G1 X117.717 Y117.252 E.00115
; LINE_WIDTH: 0.136591
G1 X117.717 Y104.101 E.06169
; LINE_WIDTH: 0.153986
G1 X117.733 Y103.889 E.00115
; LINE_WIDTH: 0.187356
G1 X117.75 Y103.677 E.00144
; LINE_WIDTH: 0.204415
G3 X117.78 Y103.502 I1.122 J.102 E.00133
; LINE_WIDTH: 0.232884
G1 X117.828 Y103.354 E.00134
; LINE_WIDTH: 0.281389
G1 X117.876 Y103.207 E.00164
; LINE_WIDTH: 0.324818
G3 X118.088 Y102.828 I1.491 J.588 E.00538
G1 X118.393 Y102.524 E.00532
G3 X118.503 Y102.448 I.541 J.669 E.00166
; LINE_WIDTH: 0.297383
G3 X118.918 Y102.264 I.789 J1.218 E.00513
; LINE_WIDTH: 0.232872
G1 X119.066 Y102.216 E.00134
; LINE_WIDTH: 0.195139
G3 X119.454 Y102.169 I.485 J2.389 E.00277
; LINE_WIDTH: 0.15399
G1 X119.666 Y102.152 E.00115
; LINE_WIDTH: 0.136867
G1 X132.807 Y102.152 E.06179
G1 X133.028 Y102.169 E.00104
; LINE_WIDTH: 0.187356
G1 X133.24 Y102.186 E.00144
; LINE_WIDTH: 0.204415
G3 X133.416 Y102.216 I-.102 J1.122 E.00133
; LINE_WIDTH: 0.232884
G1 X133.563 Y102.264 E.00134
; LINE_WIDTH: 0.281389
G1 X133.711 Y102.312 E.00164
; LINE_WIDTH: 0.324818
G3 X134.089 Y102.524 I-.588 J1.491 E.00538
G1 X134.393 Y102.828 E.00532
G3 X134.469 Y102.939 I-.668 J.541 E.00166
; LINE_WIDTH: 0.297382
G3 X134.653 Y103.354 I-1.218 J.789 E.00513
; LINE_WIDTH: 0.232872
G1 X134.677 Y103.428 E.00067
; WIPE_START
G1 F15000
G1 X134.701 Y103.502 E-.02927
G1 X134.748 Y103.889 E-.14842
G1 X134.765 Y104.101 E-.0808
G1 X134.765 Y105.421 E-.50152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.685 Y108.273 Z3.9 F42000
G1 X124.942 Y109.378 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2590
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.335 J2.586 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2590
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2590
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14982
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2590
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2590
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2590
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06545
G3 X126.255 Y107.99 I.837 J2.48 E.01439
G3 X123.643 Y111.4 I-.023 J2.688 E.19346
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 36/72
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I-.986 J-.714 P1  F42000
G1 X117.986 Y117.551 Z3.9
G1 Z3.6
G1 E.8 F1800
G1 F2599
M204 S5000
G1 X117.938 Y117.245 E.00503
G1 X117.938 Y104.108 E.21333
G1 X118.021 Y103.582 E.00864
G1 X118.27 Y103.094 E.00891
G1 X118.658 Y102.706 E.00891
G1 X119.147 Y102.457 E.00891
G1 X119.672 Y102.374 E.00863
G1 X132.81 Y102.374 E.21333
G1 X133.335 Y102.457 E.00863
G1 X133.824 Y102.706 E.00891
G1 X134.211 Y103.094 E.00891
G1 X134.46 Y103.582 E.00891
G1 X134.544 Y104.108 E.00863
G1 X134.544 Y117.245 E.21333
G1 X134.46 Y117.771 E.00864
G1 X134.211 Y118.259 E.00891
G1 X133.824 Y118.647 E.00891
G1 X133.335 Y118.896 E.00891
G1 X132.81 Y118.979 E.00863
G1 X119.672 Y118.979 E.21333
G1 X119.147 Y118.896 E.00864
G1 X118.658 Y118.647 E.00891
G1 X118.27 Y118.259 E.00891
G1 X118.021 Y117.771 E.00891
G1 X117.996 Y117.61 E.00263
; WIPE_START
G1 F3600
M204 S6000
G1 X117.938 Y117.245 E-.14049
G1 X117.938 Y115.615 E-.61951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.726 Y110.64 Z4 F42000
G1 X133.852 Y101.938 Z4
G1 Z3.6
G1 E.8 F1800
G1 F2599
M204 S5000
M73 P84 R3
G1 X134.341 Y102.187 E.0089
G1 X134.731 Y102.577 E.00896
G1 X134.981 Y103.068 E.00896
G1 X135.07 Y103.648 E.00952
G1 X135.07 Y117.705 E.22826
G1 X134.981 Y118.285 E.00952
G1 X134.731 Y118.776 E.00896
G1 X134.341 Y119.166 E.00896
G1 X133.849 Y119.417 E.00896
G1 X133.269 Y119.506 E.00952
G1 X119.212 Y119.506 E.22826
G1 X118.632 Y119.417 E.00952
G1 X118.141 Y119.166 E.00896
G1 X117.751 Y118.776 E.00896
G1 X117.5 Y118.285 E.00896
G1 X117.412 Y117.705 E.00952
G1 X117.412 Y103.648 E.22826
G1 X117.5 Y103.068 E.00952
G1 X117.751 Y102.577 E.00896
G1 X118.141 Y102.187 E.00896
G1 X118.632 Y101.936 E.00896
G1 X119.212 Y101.847 E.00952
G1 X133.269 Y101.847 E.22826
G1 X133.793 Y101.928 E.00861
; WIPE_START
G1 F3600
M204 S6000
G1 X134.341 Y102.187 E-.23005
G1 X134.731 Y102.577 E-.2096
G1 X134.981 Y103.068 E-.20962
G1 X135.025 Y103.356 E-.11073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 36 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer36 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.734 Y103.451 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231646
G1 F2599
M204 S6000
G1 X134.742 Y103.476 E.00022
; LINE_WIDTH: 0.193541
G3 X134.79 Y103.868 I-2.426 J.492 E.00277
; LINE_WIDTH: 0.151879
G1 X134.806 Y104.082 E.00114
; LINE_WIDTH: 0.134553
G1 X134.807 Y117.262 E.06073
G1 X134.79 Y117.485 E.00103
; LINE_WIDTH: 0.185666
G1 X134.773 Y117.7 E.00144
; LINE_WIDTH: 0.202939
G3 X134.742 Y117.877 I-1.136 J-.103 E.00133
; LINE_WIDTH: 0.231659
G1 X134.694 Y118.027 E.00134
; LINE_WIDTH: 0.280719
G1 X134.645 Y118.176 E.00166
; LINE_WIDTH: 0.324618
G3 X134.431 Y118.558 I-1.506 J-.594 E.00544
G1 X134.123 Y118.866 E.00538
G3 X134.011 Y118.943 I-.547 J-.676 E.00167
; LINE_WIDTH: 0.296903
G3 X133.591 Y119.129 I-.799 J-1.233 E.00518
; LINE_WIDTH: 0.231646
G1 X133.442 Y119.178 E.00134
; LINE_WIDTH: 0.19354
G3 X133.05 Y119.225 I-.492 J-2.426 E.00277
; LINE_WIDTH: 0.151879
G1 X132.835 Y119.242 E.00114
; LINE_WIDTH: 0.134553
G1 X119.656 Y119.242 E.06073
G1 X119.432 Y119.225 E.00103
; LINE_WIDTH: 0.185666
G1 X119.217 Y119.208 E.00144
; LINE_WIDTH: 0.202939
G3 X119.04 Y119.178 I.103 J-1.136 E.00133
; LINE_WIDTH: 0.231659
G1 X118.891 Y119.129 E.00134
; LINE_WIDTH: 0.280719
G1 X118.742 Y119.081 E.00166
; LINE_WIDTH: 0.324618
G3 X118.359 Y118.866 I.594 J-1.506 E.00544
G1 X118.051 Y118.558 E.00538
G3 X117.974 Y118.447 I.676 J-.547 E.00167
; LINE_WIDTH: 0.296903
G3 X117.788 Y118.027 I1.233 J-.799 E.00518
; LINE_WIDTH: 0.231646
G1 X117.739 Y117.877 E.00134
; LINE_WIDTH: 0.19354
G3 X117.692 Y117.485 I2.426 J-.492 E.00277
; LINE_WIDTH: 0.151879
G1 X117.675 Y117.27 E.00114
; LINE_WIDTH: 0.134271
G1 X117.675 Y104.082 E.06062
; LINE_WIDTH: 0.151862
G1 X117.692 Y103.868 E.00114
; LINE_WIDTH: 0.185666
G1 X117.709 Y103.653 E.00144
; LINE_WIDTH: 0.202939
G3 X117.739 Y103.476 I1.136 J.103 E.00133
; LINE_WIDTH: 0.231659
G1 X117.788 Y103.326 E.00134
; LINE_WIDTH: 0.280719
G1 X117.836 Y103.177 E.00166
; LINE_WIDTH: 0.324618
G3 X118.051 Y102.795 I1.506 J.594 E.00544
G1 X118.359 Y102.487 E.00538
G3 X118.47 Y102.41 I.547 J.676 E.00167
; LINE_WIDTH: 0.296903
G3 X118.891 Y102.223 I.799 J1.233 E.00518
; LINE_WIDTH: 0.231646
G1 X119.04 Y102.175 E.00134
; LINE_WIDTH: 0.19354
G3 X119.432 Y102.128 I.492 J2.426 E.00277
; LINE_WIDTH: 0.151879
G1 X119.647 Y102.111 E.00114
; LINE_WIDTH: 0.134553
G1 X132.826 Y102.11 E.06073
G1 X133.05 Y102.128 E.00103
; LINE_WIDTH: 0.185668
G1 X133.264 Y102.145 E.00144
; LINE_WIDTH: 0.20294
G3 X133.442 Y102.175 I-.103 J1.137 E.00133
; LINE_WIDTH: 0.231659
G1 X133.591 Y102.223 E.00134
; LINE_WIDTH: 0.280719
G1 X133.74 Y102.272 E.00166
; LINE_WIDTH: 0.324625
G3 X134.123 Y102.487 I-.593 J1.505 E.00544
G1 X134.43 Y102.795 E.00538
G3 X134.507 Y102.906 I-.676 J.547 E.00167
; LINE_WIDTH: 0.296901
G3 X134.694 Y103.326 I-1.233 J.799 E.00518
; LINE_WIDTH: 0.231646
G1 X134.716 Y103.394 E.00061
; WIPE_START
G1 F15000
G1 X134.742 Y103.476 E-.0327
G1 X134.79 Y103.868 E-.15011
G1 X134.806 Y104.082 E-.08185
G1 X134.806 Y105.386 E-.49534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.731 Y108.249 Z4 F42000
G1 X124.942 Y109.378 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2599
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2599
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2599
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14981
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2599
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2599
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2599
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.26 Y107.99 I.837 J2.478 E.01447
G3 X123.643 Y111.4 I-.028 J2.688 E.19337
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.1019
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 37/72
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4 I-.983 J-.717 P1  F42000
G1 X117.941 Y117.556 Z4
G1 Z3.7
G1 E.8 F1800
G1 F2609
M204 S5000
G1 X117.895 Y117.264 E.00479
G1 X117.895 Y104.089 E.21395
G1 X117.979 Y103.556 E.00876
G1 X118.232 Y103.061 E.00903
G1 X118.595 Y102.697 E.00835
G1 X118.625 Y102.667 E.00068
G1 X119.12 Y102.415 E.00903
G1 X119.653 Y102.331 E.00875
G1 X132.829 Y102.331 E.21395
G1 X133.361 Y102.415 E.00875
G1 X133.857 Y102.667 E.00903
G1 X134.25 Y103.061 E.00903
G1 X134.502 Y103.556 E.00903
G1 X134.586 Y104.088 E.00875
G1 X134.586 Y117.264 E.21395
G1 X134.502 Y117.797 E.00876
G1 X134.249 Y118.293 E.00903
G1 X133.857 Y118.685 E.00902
G1 X133.361 Y118.938 E.00903
G1 X132.829 Y119.022 E.00875
G1 X119.653 Y119.022 E.21395
G1 X119.12 Y118.938 E.00876
G1 X118.625 Y118.685 E.00902
G1 X118.232 Y118.292 E.00903
G1 X117.979 Y117.797 E.00903
G1 X117.951 Y117.615 E.00299
; WIPE_START
G1 F3600
M204 S6000
G1 X117.895 Y117.264 E-.13483
G1 X117.895 Y115.619 E-.62517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.688 Y110.65 Z4.1 F42000
G1 X133.886 Y101.902 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F2609
M204 S5000
G1 X134.375 Y102.149 E.00889
G1 X134.768 Y102.543 E.00903
G1 X135.021 Y103.039 E.00904
G1 X135.11 Y103.623 E.0096
G1 X135.11 Y117.729 E.22905
G1 X135.021 Y118.314 E.0096
G1 X134.768 Y118.81 E.00904
G1 X134.374 Y119.204 E.00904
G1 X133.878 Y119.456 E.00904
G1 X133.294 Y119.546 E.00961
G1 X119.188 Y119.546 E.22905
G1 X118.603 Y119.456 E.0096
G1 X118.107 Y119.204 E.00904
G1 X117.713 Y118.81 E.00904
G1 X117.461 Y118.314 E.00904
G1 X117.371 Y117.729 E.00961
G1 X117.371 Y103.623 E.22905
G1 X117.461 Y103.039 E.0096
G1 X117.713 Y102.543 E.00904
G1 X118.107 Y102.149 E.00904
G1 X118.603 Y101.896 E.00904
G1 X119.188 Y101.807 E.00961
G1 X133.294 Y101.807 E.22905
G1 X133.828 Y101.889 E.00878
; WIPE_START
G1 F3600
M204 S6000
G1 X134.375 Y102.149 E-.23014
G1 X134.768 Y102.543 E-.21143
G1 X135.021 Y103.039 E-.21153
G1 X135.063 Y103.317 E-.10691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 37 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.1 F4000
            G39.3 S1
            G0 Z4.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer37 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X134.771 Y103.412 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.230434
G1 F2609
M204 S6000
G1 X134.783 Y103.449 E.00034
; LINE_WIDTH: 0.191942
G3 X134.831 Y103.846 I-2.466 J.498 E.00278
; LINE_WIDTH: 0.149768
G1 X134.848 Y104.064 E.00114
; LINE_WIDTH: 0.13225
G1 X134.848 Y117.281 E.05966
G1 X134.831 Y117.507 E.00102
; LINE_WIDTH: 0.184014
G1 X134.814 Y117.724 E.00144
; LINE_WIDTH: 0.201484
G3 X134.783 Y117.904 I-1.15 J-.105 E.00134
; LINE_WIDTH: 0.230468
G1 X134.734 Y118.054 E.00135
; LINE_WIDTH: 0.280118
G1 X134.685 Y118.205 E.00167
; LINE_WIDTH: 0.324451
G3 X134.468 Y118.592 I-1.522 J-.6 E.0055
G1 X134.156 Y118.904 E.00544
G3 X134.044 Y118.981 I-.55 J-.68 E.00169
; LINE_WIDTH: 0.296425
G3 X133.619 Y119.17 I-.809 J-1.248 E.00524
; LINE_WIDTH: 0.230434
G1 X133.468 Y119.219 E.00135
; LINE_WIDTH: 0.191941
G3 X133.071 Y119.267 I-.498 J-2.466 E.00278
; LINE_WIDTH: 0.149768
G1 X132.854 Y119.284 E.00114
; LINE_WIDTH: 0.132249
G1 X119.637 Y119.284 E.05966
G1 X119.41 Y119.267 E.00102
; LINE_WIDTH: 0.184002
G1 X119.193 Y119.25 E.00144
; LINE_WIDTH: 0.20148
G3 X119.014 Y119.219 I.104 J-1.145 E.00134
; LINE_WIDTH: 0.230434
G1 X118.863 Y119.17 E.00135
; LINE_WIDTH: 0.280037
G1 X118.712 Y119.121 E.00167
; LINE_WIDTH: 0.324401
G3 X118.325 Y118.904 I.599 J-1.521 E.0055
G1 X118.014 Y118.592 E.00544
G3 X117.936 Y118.48 I.68 J-.55 E.00169
; LINE_WIDTH: 0.296422
G3 X117.747 Y118.054 I1.248 J-.809 E.00524
; LINE_WIDTH: 0.230421
G1 X117.698 Y117.903 E.00135
; LINE_WIDTH: 0.191941
G3 X117.65 Y117.507 I2.464 J-.498 E.00278
; LINE_WIDTH: 0.149768
G1 X117.633 Y117.289 E.00114
; LINE_WIDTH: 0.131961
G1 X117.633 Y104.064 E.05955
; LINE_WIDTH: 0.149762
G1 X117.65 Y103.846 E.00114
; LINE_WIDTH: 0.184006
G1 X117.668 Y103.629 E.00144
; LINE_WIDTH: 0.201493
G3 X117.698 Y103.449 I1.151 J.105 E.00134
; LINE_WIDTH: 0.230448
G1 X117.747 Y103.299 E.00135
; LINE_WIDTH: 0.280053
G1 X117.796 Y103.148 E.00167
; LINE_WIDTH: 0.324405
G3 X118.014 Y102.761 I1.519 J.598 E.0055
G1 X118.325 Y102.449 E.00544
G3 X118.437 Y102.372 I.55 J.68 E.00169
; LINE_WIDTH: 0.296425
G3 X118.863 Y102.183 I.809 J1.248 E.00524
; LINE_WIDTH: 0.230434
G1 X119.014 Y102.134 E.00135
; LINE_WIDTH: 0.191941
G3 X119.41 Y102.086 I.498 J2.466 E.00278
; LINE_WIDTH: 0.149768
G1 X119.628 Y102.069 E.00114
; LINE_WIDTH: 0.132249
G1 X132.845 Y102.069 E.05966
G1 X133.071 Y102.086 E.00102
; LINE_WIDTH: 0.183989
G1 X133.289 Y102.103 E.00144
; LINE_WIDTH: 0.201468
G3 X133.468 Y102.134 I-.104 J1.145 E.00133
; LINE_WIDTH: 0.230038
G1 X133.616 Y102.182 E.00133
; LINE_WIDTH: 0.278857
G1 X133.765 Y102.23 E.00164
; LINE_WIDTH: 0.323912
G3 X134.157 Y102.45 I-.602 J1.538 E.00556
G1 X134.468 Y102.761 E.00542
G3 X134.545 Y102.873 I-.681 J.551 E.00168
; LINE_WIDTH: 0.296428
G3 X134.734 Y103.299 I-1.248 J.809 E.00524
; LINE_WIDTH: 0.230434
G1 X134.752 Y103.355 E.0005
; WIPE_START
G1 F15000
G1 X134.783 Y103.449 E-.03783
G1 X134.831 Y103.846 E-.15178
G1 X134.848 Y104.064 E-.0829
G1 X134.848 Y105.346 E-.48749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.779 Y108.223 Z4.1 F42000
G1 X124.942 Y109.378 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2609
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.334 J2.585 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2609
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
M73 P85 R3
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2609
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14978
G1 X128.136 Y109.378 E-.17438
G1 X127.599 Y109.378 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2609
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14976
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2609
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2609
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.266 Y107.99 I.836 J2.477 E.01456
G3 X123.642 Y111.4 I-.034 J2.688 E.19328
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10186
G1 X123.817 Y109.509 E-.10195
G1 X123.847 Y109.454 E-.02383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; layer num/total_layer_count: 38/72
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S204
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.085 J1.214 P1  F42000
G1 X124.942 Y109.378 Z4.1
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.271 Y107.99 I.836 J2.476 E.01464
G3 X123.642 Y111.4 I-.039 J2.688 E.19319
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 38 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer38 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 39/72
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.276 Y107.99 I.836 J2.476 E.01473
G3 X123.642 Y111.4 I-.045 J2.688 E.1931
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.51 E-.10183
G1 X123.847 Y109.454 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 39 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.3 F4000
            G39.3 S1
            G0 Z4.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer39 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 40/72
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.281 Y107.99 I.836 J2.476 E.01481
G3 X123.642 Y111.4 I-.05 J2.688 E.19301
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P86 R3
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 40 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer40 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 41/72
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.342 J2.592 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.287 Y107.99 I.836 J2.476 E.0149
G3 X123.642 Y111.4 I-.055 J2.688 E.19292
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 41 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.5 F4000
            G39.3 S1
            G0 Z4.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer41 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 42/72
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.341 J2.591 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.626 Y111.342 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.292 Y107.99 I.836 J2.476 E.01499
G3 X123.642 Y111.4 I-.061 J2.687 E.19283
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 42 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer42 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 43/72
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.342 J2.592 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P87 R3
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14981
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.626 Y111.342 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P87 R2
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.297 Y107.991 I.836 J2.476 E.01507
G3 X123.642 Y111.4 I-.066 J2.687 E.19275
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 43 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.7 F4000
            G39.3 S1
            G0 Z4.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer43 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 44/72
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14981
G1 X128.136 Y109.378 E-.17435
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.626 Y111.342 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.302 Y107.991 I.836 J2.477 E.01516
G3 X123.642 Y111.4 I-.071 J2.687 E.19266
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 44 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer44 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 45/72
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.59 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.308 Y107.991 I.836 J2.478 E.01524
G3 X123.642 Y111.4 I-.076 J2.687 E.19258
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 45 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.9 F4000
            G39.3 S1
            G0 Z4.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer45 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 46/72
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
M73 P88 R2
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.313 Y107.991 I.837 J2.479 E.01533
G3 X123.642 Y111.4 I-.082 J2.687 E.19249
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 46 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer46 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 47/72
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.59 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06547
G3 X126.318 Y107.991 I.837 J2.48 E.01541
G3 X123.642 Y111.4 I-.087 J2.687 E.19241
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.51 E-.10183
G1 X123.847 Y109.454 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 47 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.1 F4000
            G39.3 S1
            G0 Z5.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer47 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 48/72
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20274
G1 X124.4 Y112.022 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.323 Y107.991 I.837 J2.481 E.0155
G3 X123.642 Y111.4 I-.092 J2.687 E.19233
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.51 E-.10183
G1 X123.847 Y109.454 E-.02389
; WIPE_END
M73 P89 R2
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 48 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer48 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 49/72
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14982
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.329 Y107.991 I.838 J2.483 E.01558
G3 X123.642 Y111.4 I-.097 J2.686 E.19225
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 49 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.3 F4000
            G39.3 S1
            G0 Z5.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer49 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 50/72
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.334 Y107.992 I.838 J2.485 E.01567
G3 X123.642 Y111.4 I-.102 J2.686 E.19217
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12478
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 50 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer50 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 51/72
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.333 J2.584 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
M73 P90 R2
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.196 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06546
G3 X126.339 Y107.992 I.839 J2.486 E.01575
G3 X123.643 Y111.4 I-.107 J2.686 E.19209
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10183
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 51 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.5 F4000
            G39.3 S1
            G0 Z5.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer51 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 52/72
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.59 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06545
G3 X126.344 Y107.992 I.839 J2.489 E.01584
G3 X123.643 Y111.4 I-.112 J2.686 E.19201
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 52 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer52 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 53/72
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.341 J2.592 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.604 J-.665 E.06545
G3 X126.35 Y107.992 I.84 J2.491 E.01593
G3 X123.643 Y111.4 I-.117 J2.685 E.1919
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10185
G1 X123.847 Y109.454 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 53 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.7 F4000
            G39.3 S1
            G0 Z5.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer53 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 54/72
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
M73 P91 R2
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.2077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06544
G3 X126.355 Y107.992 I.841 J2.493 E.01601
G3 X123.644 Y111.4 I-.122 J2.685 E.19182
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10183
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.1019
G1 X123.847 Y109.454 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 54 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer54 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 55/72
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
M73 P91 R1
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.755 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.384 Y108.127 I2.605 J-.664 E.06544
G3 X126.36 Y107.992 I.841 J2.496 E.0161
G3 X123.644 Y111.4 I-.127 J2.685 E.19175
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 55 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.9 F4000
            G39.3 S1
            G0 Z5.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer55 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 56/72
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P92 R1
G1 X123.626 Y111.342 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06984
G3 X126.366 Y107.992 I.607 J2.842 E.01182
G3 X123.642 Y111.4 I-.135 J2.685 E.19161
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12479
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 56 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer56 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 57/72
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.666 E.06983
G3 X126.371 Y107.992 I.608 J2.848 E.0119
G3 X123.643 Y111.4 I-.14 J2.684 E.19149
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10183
G1 X123.581 Y110.276 E-.10194
G1 X123.634 Y110.013 E-.10187
G1 X123.713 Y109.757 E-.10191
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 57 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.1 F4000
            G39.3 S1
            G0 Z6.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer57 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 58/72
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.757 J-3.196 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20277
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06982
G3 X126.376 Y107.993 I.609 J2.854 E.01199
G3 X123.643 Y111.4 I-.144 J2.684 E.19142
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 58 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer58 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 59/72
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.336 J2.587 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
M73 P93 R1
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06981
G3 X126.381 Y107.993 I.61 J2.861 E.01208
G3 X123.644 Y111.4 I-.149 J2.684 E.19135
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12476
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.757 E-.10189
G1 X123.817 Y109.509 E-.1019
G1 X123.847 Y109.454 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 59 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.3 F4000
            G39.3 S1
            G0 Z6.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer59 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 60/72
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.342 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.0698
G3 X126.387 Y107.993 I.611 J2.868 E.01216
G3 X123.644 Y111.399 I-.154 J2.683 E.19127
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12474
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.51 E-.10183
G1 X123.847 Y109.454 E-.02392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 60 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer60 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 61/72
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.331 J2.582 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14977
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20276
G1 X124.4 Y112.022 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.341 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.642 Y108.054 I2.604 J-.665 E.06979
G3 X126.392 Y107.993 I.612 J2.875 E.01225
G3 X123.645 Y111.399 I-.158 J2.683 E.1912
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12473
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10188
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.0239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 61 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.5 F4000
            G39.3 S1
            G0 Z6.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer61 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 62/72
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.331 J2.582 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
M73 P94 R1
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.761 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.572 Y112.224 E-.2028
G1 X124.4 Y112.022 E-.10421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.626 Y111.342 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.604 J-.666 E.07422
G3 X126.397 Y107.993 I.318 J2.443 E.00799
G3 X123.642 Y111.4 I-.166 J2.683 E.19107
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.1248
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.1019
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 62 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer62 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 63/72
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.17441
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.14979
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.759 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20275
G1 X124.4 Y112.022 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.604 J-.666 E.0742
G3 X126.402 Y107.993 I.32 J2.469 E.00807
G3 X123.643 Y111.4 I-.171 J2.683 E.19103
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12477
G1 X123.554 Y110.81 E-.10192
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10186
G1 X123.817 Y109.509 E-.10195
G1 X123.847 Y109.454 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 63 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.7 F4000
            G39.3 S1
            G0 Z6.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer63 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 64/72
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.335 J2.585 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.17441
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17436
G1 X127.539 Y112.562 E-.14981
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.628 Y111.342 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.605 J-.666 E.07418
G3 X126.408 Y107.993 I.322 J2.495 E.00816
M73 P95 R1
G3 X123.644 Y111.4 I-.175 J2.683 E.19098
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12474
G1 X123.554 Y110.81 E-.10194
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10186
G1 X123.817 Y109.509 E-.10195
G1 X123.847 Y109.454 E-.02385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 64 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer64 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 65/72
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.338 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23209
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14976
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20274
G1 X124.4 Y112.022 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.342 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.605 J-.665 E.07416
G3 X126.413 Y107.994 I.323 J2.521 E.00824
G3 X123.644 Y111.399 I-.179 J2.683 E.19093
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12474
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10194
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.757 E-.10189
G1 X123.817 Y109.509 E-.10191
G1 X123.847 Y109.454 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 65 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.9 F4000
            G39.3 S1
            G0 Z6.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer65 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 66/72
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.332 J2.583 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17438
G1 X127.539 Y112.562 E-.1498
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.572 Y112.224 E-.20282
G1 X124.4 Y112.022 E-.10419
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
M204 S10000
G1 X123.63 Y111.341 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.605 J-.665 E.07414
G3 X126.418 Y107.994 I.325 J2.548 E.00833
G3 X123.646 Y111.399 I-.183 J2.682 E.19086
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12473
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10183
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10188
G1 X123.713 Y109.757 E-.10189
G1 X123.817 Y109.509 E-.10193
G1 X123.847 Y109.454 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 66 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer66 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 67/72
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.1498
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
M73 P96 R0
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.572 Y112.224 E-.2028
G1 X124.4 Y112.022 E-.10421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.174 Y107.988 I2.604 J-.667 E.07857
G1 X126.423 Y107.994 E.00405
G3 X123.643 Y111.4 I-.192 J2.681 E.19066
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12472
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10185
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10187
G1 X123.713 Y109.757 E-.10191
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.02391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 67 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.1 F4000
            G39.3 S1
            G0 Z7.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer67 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 68/72
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.335 J2.586 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14976
G1 X128.136 Y109.378 E-.17441
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.764 J-3.203 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21352
G1 X124.942 Y112.585 E-.23947
G1 X124.573 Y112.224 E-.20269
G1 X124.4 Y112.022 E-.10432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.631 Y111.341 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X125.906 Y108.008 I2.604 J-.666 E.07413
G3 X126.419 Y107.994 I.326 J2.552 E.00834
G3 X123.647 Y111.399 I-.184 J2.682 E.19079
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.1247
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10187
G1 X123.713 Y109.756 E-.10193
G1 X123.817 Y109.509 E-.10184
G1 X123.848 Y109.454 E-.02395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 68 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer68 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 69/72
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.337 J2.588 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14977
G1 X128.136 Y109.378 E-.1744
G1 X127.599 Y109.378 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17437
G1 X127.539 Y112.562 E-.1498
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21351
G1 X124.942 Y112.585 E-.23948
G1 X124.573 Y112.224 E-.2027
G1 X124.4 Y112.022 E-.10431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.627 Y111.342 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.174 Y107.988 I2.605 J-.666 E.07857
G1 X126.424 Y107.994 E.00406
G3 X123.643 Y111.4 I-.192 J2.682 E.1907
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10193
G1 X123.554 Y110.542 E-.10184
G1 X123.581 Y110.276 E-.10193
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.757 E-.10187
G1 X123.817 Y109.509 E-.10192
G1 X123.847 Y109.454 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 69 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.3 F4000
            G39.3 S1
            G0 Z7.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer69 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 70/72
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.335 J2.585 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22813
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.2077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
M73 P97 R0
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23207
G1 X127.83 Y112.306 E-.1744
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.755 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.21353
G1 X124.942 Y112.585 E-.23946
G1 X124.573 Y112.224 E-.20271
G1 X124.4 Y112.022 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.629 Y111.341 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.174 Y107.988 I2.605 J-.666 E.07852
G1 X126.429 Y107.994 E.00415
G3 X123.645 Y111.399 I-.195 J2.682 E.19067
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12473
G1 X123.554 Y110.81 E-.10189
G1 X123.554 Y110.542 E-.10186
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.10189
G1 X123.713 Y109.756 E-.10191
G1 X123.817 Y109.509 E-.10189
G1 X123.847 Y109.454 E-.0239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 70 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer70 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 71/72
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X124.942 Y109.378 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X124.363 Y109.378 E.01011
G3 X124.942 Y108.768 I3.339 J2.589 E.01471
G1 X124.942 Y109.318 E.0096
M204 S250
G1 X125.356 Y109.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y109.378 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.539 Y108.791 E.01025
G1 X127.83 Y109.047 E.00676
G1 X128.136 Y109.378 E.00787
G1 X127.599 Y109.378 E.00938
; WIPE_START
G1 F6000
G1 X127.539 Y108.791 E-.22812
G1 X127.83 Y109.047 E-.14979
G1 X128.136 Y109.378 E-.17437
G1 X127.599 Y109.378 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.539 Y111.975 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X128.136 Y111.975 E.01043
G1 X127.83 Y112.306 E.00787
G1 X127.539 Y112.562 E.00676
G1 X127.539 Y112.035 E.0092
; WIPE_START
G1 F6000
G1 X128.136 Y111.975 E-.23208
G1 X127.83 Y112.306 E-.17441
G1 X127.539 Y112.562 E-.14977
G1 X127.539 Y112.035 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.363 Y111.975 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.942 Y111.975 E.01011
G1 X124.942 Y112.585 E.01065
G3 X124.4 Y112.022 I2.762 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X124.942 Y111.975 E-.2135
G1 X124.942 Y112.585 E-.23949
G1 X124.573 Y112.224 E-.20274
G1 X124.4 Y112.022 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.632 Y111.341 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.174 Y107.988 I2.605 J-.666 E.07847
G1 X126.434 Y107.994 E.00423
G3 X123.648 Y111.399 I-.197 J2.681 E.19062
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.12475
G1 X123.554 Y110.81 E-.10189
G1 X123.554 Y110.542 E-.10186
G1 X123.581 Y110.276 E-.10191
G1 X123.634 Y110.013 E-.10191
G1 X123.713 Y109.756 E-.10189
G1 X123.817 Y109.509 E-.10187
G1 X123.847 Y109.454 E-.02392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 71 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.5 F4000
            G39.3 S1
            G0 Z7.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer71 end: 115
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 72/72
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 115
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X125.356 Y109.791 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X125.356 Y108.341 E.02355
G1 X127.126 Y108.341 E.02874
G1 X127.126 Y109.791 E.02355
G1 X128.576 Y109.791 E.02355
G1 X128.576 Y111.561 E.02874
G1 X127.126 Y111.561 E.02355
G1 X127.126 Y113.011 E.02355
G1 X125.356 Y113.011 E.02874
G1 X125.356 Y111.561 E.02355
G1 X123.906 Y111.561 E.02355
G1 X123.906 Y109.791 E.02874
G1 X125.296 Y109.791 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y108.341 E-.55147
G1 X125.905 Y108.341 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.634 Y111.34 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G3 X126.174 Y107.988 I2.605 J-.665 E.07842
G1 X126.439 Y107.994 E.00431
G3 X123.65 Y111.398 I-.2 J2.681 E.1906
; WIPE_START
G1 F3600
M204 S6000
G1 X123.581 Y111.077 E-.1247
G1 X123.554 Y110.81 E-.10191
G1 X123.554 Y110.542 E-.10187
G1 X123.581 Y110.276 E-.10192
G1 X123.634 Y110.013 E-.1019
G1 X123.713 Y109.757 E-.10186
G1 X123.817 Y109.509 E-.10191
G1 X123.848 Y109.454 E-.02393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
; object ids of layer 72 start: 115
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer72 end: 115
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X125.137 Y108.681 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X124.245 Y109.572 E.02047
; WIPE_START
G1 F3000
M204 S6000
G1 X125.137 Y108.681 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.895 Y108.611 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101214
G1 F1200
M204 S6000
G2 X124.175 Y109.33 I3.095 J3.817 E.00331
; WIPE_START
G1 F15000
G1 X124.451 Y109.016 E-.31184
G1 X124.895 Y108.611 E-.44816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.642 Y112.557 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X125.137 Y112.062 E.01136
G1 X124.855 Y111.781
G1 X124.361 Y112.274 E.01134
; WIPE_START
G1 F3000
M204 S6000
G1 X124.855 Y111.781 E-.29543
G1 X125.137 Y112.062 E-.1686
G1 X124.642 Y112.557 E-.29597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.236 Y111.781 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S2000
M73 P98 R0
G1 X127.345 Y112.672 E.02047
; WIPE_START
G1 F3000
M204 S6000
G1 X128.236 Y111.781 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.311 Y112.017 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.090249
G1 F1200
M204 S6000
G3 X128.114 Y112.248 I-2.408 J-1.858 E.00085
; LINE_WIDTH: 0.114121
G3 X127.767 Y112.591 I-3.605 J-3.304 E.00184
; LINE_WIDTH: 0.0871639
G1 X127.581 Y112.749 E.00065
; WIPE_START
G1 F15000
G1 X127.767 Y112.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.122 Y109.077 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X127.627 Y109.572 E.01138
G1 X127.345 Y109.29
G1 X127.839 Y108.796 E.01135
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3000
M204 S6000
G1 X127.345 Y109.29 E-.29535
G1 X127.627 Y109.572 E-.16846
G1 X128.122 Y109.077 E-.29619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 115
M625
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20260513 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G90
G1 Z7.6 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z107.2 F600
    G1 Z105.2

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

