; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 10m 36s; total estimated time: 17m 15s
; total layer number: 42
; total filament length [mm] : 436.21
; total filament volume [cm^3] : 1049.21
; total filament weight [g] : 1.33
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 6.76
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
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
; bottom_shell_layers = 5
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = no_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 3
; close_fan_the_first_x_layers = 3
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
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
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
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
; fan_cooling_layer_time = 30
; fan_direction = undefine
; fan_max_speed = 90
; fan_min_speed = 40
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #EEF2E7
; filament_cooling_before_tower = 0
; filament_cost = 30
; filament_density = 1.27
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 75
; filament_dev_ams_drying_temperature = 65
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 80
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 55
; filament_dev_drying_softening_temperature = 60
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 8
; filament_metal_stickiness = High
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
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PETG @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PETG
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
; hot_plate_temp = 80
; hot_plate_temp_initial_layer = 80
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
; initial_layer_print_height = 0.2
; initial_layer_speed = 25
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 90
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
; layer_height = 0.16
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
; nozzle_temperature = 255
; nozzle_temperature_initial_layer = 255
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 220
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
; outer_wall_speed = 50
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 90
; overhang_fan_threshold = 10%
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
; print_settings_id = AirGap EDC Vault 03_mx_keycap_translucent A1 0.4
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
; slow_down_layer_time = 12
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
; sparse_infill_density = 99%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = cubic
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
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
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = snug
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 80
; textured_plate_temp_initial_layer = 80
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 30
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
M73 P0 R17
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
M1002 set_filament_type:PETG
M104 S140
M140 S80

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
M104 S255

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
    M109 S255

    M104 S250

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F199.559 T270
    M109 S250 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG
M621 S0A


    M109 S270 H300

G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S255
G92 E0
M73 P3 R16
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R16
G1 X-48.2 F3000
M73 P6 R16
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

M1002 set_filament_type:PETG

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S255
    G1 E10 F77.1327
    M983 F1.28555 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P8 R15
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F1.28555 A0.3 H0.4; cali dynamic extrusion compensation
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
    
M73 P9 R15
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F1.28555 H0.4
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
M73 P35 R11
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
M109 S205

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
M73 P36 R11
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
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

M190 S80; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X118.7 Y117.5 I18.6 J21
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

M104 S255 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S255

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

    M109 S255
    G0 X128 E8  F185.119
    G0 X133 E.3742  F308.531
    G0 X138 E.3742  F1234.12
    G0 X143 E.3742  F308.531
    G0 X148 E.3742  F1234.12
    G0 X153 E.3742  F308.531
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
    G0 X128 E10  F185.119
    G0 X133 E.3742  F308.531
    G0 X138 E.3742  F1234.12
    G0 X143 E.3742  F308.531
    G0 X148 E.3742  F1234.12
    G0 X153 E.3742  F308.531
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
M106 P3 S180


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/42
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X131.289 Y124.445 F42000
M204 S6000
M73 P36 R10
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
M73 P37 R10
G3 X132.139 Y126.17 I-1.411 J1.767 E.07172
G1 X132.139 Y129.03 E.10328
G3 X130.01 Y131.238 I-2.267 J-.056 E.12161
G1 X125.99 Y131.238 E.14515
G3 X123.862 Y129.126 I.142 J-2.271 E.11818
G1 X123.861 Y126.17 E.10671
G3 X124.711 Y124.444 I2.249 J.035 E.07177
G1 X124.711 Y123.011 E.05176
G1 X131.289 Y123.011 E.23752
G1 X131.289 Y124.385 E.04961
M204 S6000
M73 P38 R10
G1 X130.832 Y124.684 F42000
G1 F1500
M204 S500
G3 X131.682 Y126.181 I-.916 J1.51 E.06493
G1 X131.682 Y129.019 E.10247
G3 X129.987 Y130.781 I-1.805 J-.04 E.09696
G1 X126.012 Y130.781 E.14353
G3 X124.319 Y129.098 I.113 J-1.807 E.09413
G1 X124.318 Y126.181 E.10529
G3 X125.168 Y124.684 I1.819 J.043 E.06475
G1 X125.168 Y123.468 E.04391
G1 X130.832 Y123.468 E.20451
G1 X130.832 Y124.624 E.04174
M204 S6000
G1 X130.375 Y124.964 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X131.225 Y126.192 I-.494 J1.25 E.05719
G1 X131.225 Y129.008 E.10166
G3 X129.965 Y130.324 I-1.342 J-.024 E.0723
G1 X126.035 Y130.324 E.14191
G3 X124.776 Y129.069 I.083 J-1.342 E.07009
G1 X124.775 Y126.192 E.10388
G3 X125.625 Y124.964 I1.339 J.018 E.05722
G1 X125.625 Y123.925 E.03751
G1 X130.375 Y123.925 E.1715
G1 X130.375 Y124.904 E.03534
; WIPE_START
G1 X130.531 Y125.034 E-.07745
G1 X130.689 Y125.135 E-.07093
G1 X130.869 Y125.297 E-.09224
G1 X131.005 Y125.468 E-.08318
G1 X131.099 Y125.634 E-.07236
G1 X131.168 Y125.812 E-.07248
G1 X131.2 Y125.942 E-.0508
G1 X131.225 Y126.192 E-.09559
G1 X131.225 Y126.574 E-.14496
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.877 Y122.335 Z.6 F42000
G1 X120.839 Y119.639 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X122.163 Y119.639 E.04779
G1 X135.161 Y119.641 E.46931
G1 X135.161 Y136.361 E.6037
G1 X120.839 Y136.361 E.5171
G1 X120.839 Y119.699 E.60159
M204 S6000
G1 X120.395 Y119.445 F42000
G1 F1500
M204 S500
G1 X120.406 Y119.382 E.00232
G3 X120.719 Y119.182 I.298 J.122 E.0143
G1 X122.163 Y119.182 E.05212
G1 X135.31 Y119.184 E.47469
G1 X135.449 Y119.22 E.00521
G1 X135.545 Y119.299 E.00447
G3 X135.618 Y119.524 I-.266 J.21 E.00874
G1 X135.618 Y136.481 E.61223
G3 X135.281 Y136.818 I-.322 J.015 E.01938
G1 X120.719 Y136.818 E.52576
G3 X120.382 Y136.481 I-.015 J-.322 E.01938
G1 X120.382 Y119.519 E.61241
G1 X120.385 Y119.504 E.00055
M204 S6000
G1 X119.944 Y119.342 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X119.946 Y119.328 E.00049
G3 X120.708 Y118.725 I.764 J.182 E.03783
G1 X122.163 Y118.725 E.05253
G1 X135.321 Y118.726 E.4751
G3 X136.075 Y119.51 I-.03 J.783 E.04337
G1 X136.075 Y136.492 E.61317
M73 P39 R10
G3 X135.292 Y137.275 I-.785 J-.002 E.04438
G1 X120.708 Y137.275 E.52657
G3 X119.925 Y136.492 I.002 J-.785 E.04438
G1 X119.925 Y119.508 E.61322
G1 X119.937 Y119.401 E.00388
; WIPE_START
G1 X119.946 Y119.328 E-.02791
G1 X119.984 Y119.205 E-.049
G1 X120.056 Y119.07 E-.05825
G1 X120.152 Y118.952 E-.05772
G1 X120.268 Y118.857 E-.05671
G1 X120.425 Y118.776 E-.06753
G1 X120.524 Y118.746 E-.03919
G1 X120.708 Y118.725 E-.07035
G1 X121.585 Y118.725 E-.33335
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
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


G1 X134.978 Y120.748 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50031
G1 F2400
M204 S500
G1 X134.259 Y120.029 E.03674
G1 X133.612 Y120.029 E.02337
G1 X134.772 Y121.189 E.05928
G1 X134.772 Y121.836 E.02337
G1 X132.965 Y120.029 E.09234
G1 X132.318 Y120.029 E.02337
G1 X134.772 Y122.483 E.12539
G1 X134.772 Y123.13 E.02337
G1 X131.671 Y120.029 E.15845
G1 X131.024 Y120.029 E.02337
G1 X134.772 Y123.777 E.1915
G1 X134.772 Y124.423 E.02337
G1 X130.378 Y120.029 E.22456
G1 X129.731 Y120.029 E.02337
G1 X134.772 Y125.07 E.25761
G1 X134.772 Y125.717 E.02337
G1 X129.084 Y120.028 E.29067
G1 X128.437 Y120.028 E.02337
G1 X131.031 Y122.622 E.13254
G1 X131.678 Y122.622 E.02337
G1 X131.678 Y123.269 E.02337
G1 X134.772 Y126.364 E.15813
G1 X134.772 Y127.011 E.02337
G1 X131.678 Y123.916 E.15813
G1 X131.678 Y124.263 E.01253
G3 X132.336 Y125.221 I-1.725 J1.89 E.04237
G1 X134.772 Y127.658 E.12449
G1 X134.772 Y128.304 E.02337
G1 X132.517 Y126.05 E.11522
G3 X132.528 Y126.707 I-3.218 J.379 E.02379
G1 X134.772 Y128.951 E.1147
G1 X134.772 Y129.598 E.02337
G1 X132.528 Y127.353 E.1147
G1 X132.528 Y128 E.02337
G1 X134.772 Y130.245 E.1147
G1 X134.772 Y130.892 E.02337
G1 X132.528 Y128.647 E.1147
G3 X132.505 Y129.271 I-3.068 J.202 E.02261
M73 P40 R10
G1 X134.772 Y131.539 E.11585
G1 X134.772 Y132.186 E.02337
G1 X132.392 Y129.805 E.12163
G3 X132.197 Y130.257 I-1.235 J-.265 E.0179
G1 X134.772 Y132.832 E.13159
G1 X134.772 Y133.479 E.02337
G1 X131.938 Y130.645 E.14484
G3 X131.626 Y130.98 I-1.287 J-.882 E.0166
G1 X134.772 Y134.126 E.16075
G1 X134.772 Y134.773 E.02337
G1 X131.253 Y131.258 E.17972
G3 X130.815 Y131.462 I-.909 J-1.374 E.01754
G1 X134.772 Y135.42 E.20222
G1 X134.772 Y135.972 E.01996
G1 X134.678 Y135.972 E.00341
G1 X130.294 Y131.588 E.22401
G3 X129.685 Y131.626 I-.432 J-2.009 E.02211
G1 X134.031 Y135.972 E.22206
G1 X133.384 Y135.972 E.02337
G1 X129.038 Y131.626 E.22206
G1 X128.392 Y131.626 E.02337
G1 X132.738 Y135.972 E.22206
G1 X132.091 Y135.972 E.02337
G1 X127.745 Y131.626 E.22206
G1 X127.098 Y131.626 E.02337
G1 X131.444 Y135.972 E.22206
G1 X130.797 Y135.972 E.02337
G1 X126.451 Y131.626 E.22206
G1 X125.961 Y131.626 E.0177
G1 X125.777 Y131.599 E.00673
G1 X130.356 Y136.178 E.23397
; WIPE_START
G1 X128.942 Y134.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.986 Y127.203 Z.6 F42000
G1 X130.59 Y122.828 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X127.79 Y120.028 E.14305
G1 X127.143 Y120.028 E.02337
G1 X129.737 Y122.622 E.13255
G1 X129.09 Y122.622 E.02337
G1 X126.496 Y120.028 E.13255
G1 X125.849 Y120.028 E.02337
G1 X128.443 Y122.622 E.13255
G1 X127.797 Y122.622 E.02337
G1 X125.202 Y120.028 E.13256
G1 X124.555 Y120.028 E.02337
G1 X127.15 Y122.622 E.13256
G1 X126.503 Y122.622 E.02337
G1 X123.908 Y120.028 E.13256
G1 X123.262 Y120.028 E.02337
G1 X125.856 Y122.622 E.13257
G1 X125.209 Y122.622 E.02337
G1 X122.615 Y120.028 E.13257
G1 X121.968 Y120.028 E.02337
G1 X124.562 Y122.622 E.13257
G1 X124.322 Y122.622 E.00867
G1 X124.322 Y123.029 E.0147
G1 X121.321 Y120.028 E.15337
G1 X121.228 Y120.028 E.00337
G1 X121.228 Y120.581 E.02
G1 X124.322 Y123.676 E.15813
G1 X124.322 Y124.267 E.02135
G1 X124.292 Y124.293 E.00143
G1 X121.228 Y121.228 E.1566
G1 X121.228 Y121.875 E.02337
G1 X123.992 Y124.639 E.14124
G2 X123.743 Y125.038 I1.467 J1.191 E.01701
G1 X121.228 Y122.522 E.12854
G1 X121.228 Y123.169 E.02337
G1 X123.567 Y125.508 E.11955
G1 X123.545 Y125.572 E.00245
G2 X123.477 Y126.065 I1.965 J.521 E.01801
G1 X121.228 Y123.816 E.11493
G1 X121.228 Y124.462 E.02337
G1 X123.473 Y126.707 E.11471
G1 X123.473 Y127.355 E.02338
G1 X121.228 Y125.109 E.11472
G1 X121.228 Y125.756 E.02337
G1 X123.473 Y128.002 E.11474
G1 X123.473 Y128.649 E.02338
G1 X121.228 Y126.403 E.11475
G1 X121.228 Y127.05 E.02337
G1 X123.753 Y129.575 E.12905
; WIPE_START
G1 X122.339 Y128.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.022 Y127.491 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X129.503 Y135.972 E.43336
G1 X128.856 Y135.972 E.02337
G1 X121.228 Y128.344 E.3898
G1 X121.228 Y128.99 E.02337
G1 X128.21 Y135.972 E.35675
G1 X127.563 Y135.972 E.02337
G1 X121.228 Y129.637 E.3237
G1 X121.228 Y130.284 E.02337
G1 X126.916 Y135.972 E.29065
G1 X126.269 Y135.972 E.02337
G1 X121.228 Y130.931 E.2576
G1 X121.228 Y131.578 E.02337
G1 X125.622 Y135.972 E.22455
G1 X124.975 Y135.972 E.02337
G1 X121.228 Y132.225 E.19149
G1 X121.228 Y132.871 E.02337
G1 X124.329 Y135.972 E.15844
G1 X123.682 Y135.972 E.02337
G1 X121.228 Y133.518 E.12539
G1 X121.228 Y134.165 E.02337
G1 X123.035 Y135.972 E.09234
G1 X122.388 Y135.972 E.02337
G1 X121.228 Y134.812 E.05929
G1 X121.228 Y135.459 E.02337
G1 X121.947 Y136.178 E.03675
; WIPE_START
G1 X121.228 Y135.459 E-.38648
G1 X121.228 Y134.812 E-.2458
G1 X121.465 Y135.05 E-.12772
; WIPE_END
M73 P41 R10
G1 E-.04 F1800
M204 S6000
G1 X126.223 Y129.082 Z.6 F42000
G1 X127.557 Y127.409 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X128.443 Y127.408 E.03199
G1 X128.443 Y127.993 E.02111
G1 X127.557 Y127.991 E.03199
G1 X127.557 Y127.469 E.01886
M204 S6000
G1 X127.1 Y127.052 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X127.276 Y126.952 I.203 J.153 E.00751
G1 X128.734 Y126.953 E.05266
G3 X128.9 Y127.052 I-.045 J.262 E.00713
G1 X128.9 Y127.55 E.01798
G1 X128.95 Y127.55 E.0018
G1 X128.949 Y128.206 E.02369
G3 X128.688 Y128.45 I-.258 J-.014 E.01427
G1 X127.279 Y128.448 E.05088
G3 X127.05 Y128.188 I.029 J-.256 E.01372
G1 X127.05 Y127.55 E.02302
G1 X127.1 Y127.55 E.00181
G1 X127.1 Y127.112 E.01581
M204 S6000
G1 X127.786 Y127.7 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.169443
G1 F1500
M204 S500
G1 X128.214 Y127.7 E.00429
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F1500
G1 X127.786 Y127.7 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/42
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.843 J.878 P1  F42000
G1 X131.076 Y124.542 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X131.926 Y126.175 I-1.218 J1.672 E.05013
G1 X131.926 Y129.025 E.07484
G3 X130.012 Y131.025 I-2.033 J-.03 E.07999
G1 X126 Y131.025 E.10538
G3 X124.075 Y129.112 I.105 J-2.031 E.07805
G1 X124.074 Y126.176 E.07714
G3 X124.924 Y124.542 I2.07 J.039 E.05014
G1 X124.924 Y123.224 E.03462
G1 X131.076 Y123.224 E.16162
G1 X131.076 Y124.482 E.03305
M204 S10000
G1 X130.661 Y124.778 F42000
G1 F5400
M204 S6000
G3 X131.511 Y126.185 I-.784 J1.434 E.04525
G1 X131.511 Y129.015 E.07431
G3 X129.987 Y130.609 I-1.616 J-.019 E.06377
G1 X126.021 Y130.609 E.10417
G3 X124.491 Y129.087 I.112 J-1.643 E.06184
G1 X124.489 Y126.186 E.07621
G3 X125.339 Y124.778 I1.625 J.021 E.04528
G1 X125.339 Y123.639 E.02991
G1 X130.661 Y123.639 E.13978
G1 X130.661 Y124.718 E.02834
M204 S250
G1 X130.26 Y125.045 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X131.11 Y126.195 I-.365 J1.159 E.03727
G1 X131.11 Y129.005 E.06848
G3 X129.962 Y130.209 I-1.214 J-.008 E.04466
G1 X126.041 Y130.209 E.09558
G3 X124.891 Y129.062 I.085 J-1.234 E.04316
G1 X124.89 Y126.195 E.06987
G3 X125.74 Y125.045 I1.215 J.009 E.03727
G1 X125.74 Y124.04 E.02449
G1 X130.26 Y124.04 E.11016
G1 X130.26 Y124.985 E.02303
; WIPE_START
M204 S6000
G1 X130.475 Y125.135 E-.09986
G1 X130.623 Y125.229 E-.06652
G1 X130.756 Y125.344 E-.06653
G1 X130.909 Y125.531 E-.09191
G1 X130.995 Y125.684 E-.06656
G1 X131.058 Y125.847 E-.06661
G1 X131.11 Y126.195 E-.1337
G1 X131.11 Y126.638 E-.16831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.788 Y122.361 Z.76 F42000
G1 X120.46 Y119.433 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X120.462 Y119.416 E.00045
G1 X120.505 Y119.34 E.0023
G1 X120.581 Y119.277 E.00259
G1 X120.651 Y119.252 E.00194
G3 X120.725 Y119.246 I.068 J.376 E.00197
G1 X135.325 Y119.249 E.38349
G1 X135.46 Y119.305 E.00385
G1 X135.523 Y119.381 E.00259
G1 X135.548 Y119.451 E.00194
G3 X135.554 Y119.525 I-.376 J.068 E.00197
G1 X135.554 Y136.475 E.44522
G1 X135.538 Y136.584 E.00291
G1 X135.495 Y136.66 E.00229
G1 X135.419 Y136.723 E.00259
G1 X135.349 Y136.748 E.00194
G3 X135.275 Y136.754 I-.068 J-.376 E.00197
G1 X120.725 Y136.754 E.38217
G1 X120.616 Y136.738 E.00291
G1 X120.54 Y136.695 E.00229
G1 X120.477 Y136.619 E.00259
G1 X120.452 Y136.549 E.00194
G3 X120.446 Y136.475 I.376 J-.068 E.00197
G1 X120.446 Y119.525 E.44521
G1 X120.451 Y119.493 E.00087
M204 S10000
G1 X120.044 Y119.373 F42000
G1 F5400
M204 S6000
G3 X120.715 Y118.831 I.665 J.136 E.02456
G1 X135.352 Y118.834 E.38449
G1 X135.365 Y118.835 E.00034
G3 X135.969 Y119.515 I-.069 J.669 E.02625
G1 X135.969 Y136.485 E.44576
G3 X135.285 Y137.169 I-.679 J.005 E.0283
G1 X120.715 Y137.169 E.38271
G3 X120.031 Y136.485 I-.005 J-.679 E.0283
G1 X120.031 Y119.515 E.44576
G3 X120.035 Y119.433 I.679 J-.005 E.00216
M204 S250
G1 X119.652 Y119.329 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2520
M204 S5000
G1 X119.712 Y119.091 E.006
G1 F2400
G3 X120.291 Y118.512 I1.039 J.461 E.02041
G1 F2520
G3 X120.491 Y118.451 I.41 J.992 E.00512
G1 F2400
G3 X120.705 Y118.43 I.213 J1.076 E.00525
G1 X134.695 Y118.43 E.34095
G3 X135.372 Y118.434 I.3 J6.899 E.01651
G3 X136.243 Y118.996 I-.074 J1.072 E.02637
G1 F2520
G1 X136.288 Y119.091 E.00256
G1 F2400
G3 X136.365 Y119.395 I-1.119 J.442 E.00768
G1 F2520
G1 X136.37 Y119.505 E.00268
G1 F2400
G1 X136.37 Y135.895 E.39944
G3 X136.365 Y136.605 I-7.235 J.3 E.01731
G1 F2520
G3 X136.288 Y136.909 I-1.3 J-.164 E.00767
G1 F2400
G3 X135.709 Y137.488 I-1.039 J-.461 E.02041
G1 F2520
G3 X135.509 Y137.549 I-.41 J-.992 E.00512
G1 F2400
G3 X135.295 Y137.57 I-.213 J-1.076 E.00525
G1 X121.305 Y137.57 E.34095
G3 X120.595 Y137.565 I-.3 J-7.235 E.01731
G1 F2520
G3 X120.291 Y137.488 I.164 J-1.3 E.00767
G1 F2400
G3 X119.712 Y136.909 I.461 J-1.039 E.02041
G1 F2520
G3 X119.651 Y136.709 I.992 J-.41 E.00512
G1 F2400
G3 X119.63 Y136.495 I1.076 J-.213 E.00525
G1 X119.63 Y120.105 E.39944
G3 X119.635 Y119.395 I7.238 J-.3 E.01731
G1 F2520
G1 X119.637 Y119.388 E.00019
; WIPE_START
M204 S6000
G1 X119.712 Y119.091 E-.11633
G1 X119.811 Y118.906 E-.07968
G1 X119.944 Y118.743 E-.07973
G1 X120.106 Y118.611 E-.07966
G1 X120.291 Y118.512 E-.07966
G1 X120.491 Y118.451 E-.0797
G1 X120.705 Y118.43 E-.08166
G1 X121.136 Y118.43 E-.16358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.76
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


G1 X120.613 Y120.24 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423806
G1 F5468
M204 S6000
G1 X121.266 Y119.587 E.02273
G1 X121.817 Y119.587 E.01355
G1 X120.787 Y120.617 E.03585
G1 X120.787 Y121.168 E.01356
G1 X122.368 Y119.587 E.05502
G1 X122.918 Y119.587 E.01355
G1 X120.787 Y121.719 E.07419
G1 X120.787 Y122.27 E.01356
G1 X123.469 Y119.587 E.09336
G1 X124.02 Y119.587 E.01355
G1 X120.787 Y122.82 E.11253
G1 X120.787 Y123.371 E.01356
G1 X124.57 Y119.588 E.1317
G1 X125.121 Y119.588 E.01355
G1 X120.787 Y123.922 E.15086
G1 X120.787 Y124.473 E.01356
G1 X125.672 Y119.588 E.17003
G1 X126.223 Y119.588 E.01355
G1 X120.787 Y125.024 E.1892
G1 X120.787 Y125.574 E.01356
G1 X126.773 Y119.588 E.20837
G1 X127.324 Y119.588 E.01355
M73 P42 R10
G1 X120.613 Y126.299 E.23358
; WIPE_START
G1 F7702.776
G1 X122.028 Y124.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.023 Y132.252 Z.76 F42000
G1 X125.197 Y136.587 Z.76
G1 Z.36
G1 E.8 F1800
G1 F5468
M204 S6000
G1 X130.499 Y131.284 E.18456
G3 X129.867 Y131.366 I-.608 J-2.226 E.01574
G1 X124.819 Y136.413 E.17569
G1 X124.269 Y136.413 E.01356
G1 X129.316 Y131.366 E.17569
G1 X128.765 Y131.366 E.01356
G1 X123.718 Y136.413 E.17569
G1 X123.167 Y136.413 E.01356
G1 X128.214 Y131.366 E.17569
G1 X127.664 Y131.366 E.01356
G1 X122.616 Y136.413 E.17569
M73 P42 R9
G1 X122.065 Y136.413 E.01356
G1 X127.113 Y131.366 E.17569
G1 X126.562 Y131.366 E.01356
G1 X121.515 Y136.413 E.17569
G1 X120.964 Y136.413 E.01356
G1 X126.011 Y131.366 E.17569
G1 X125.527 Y131.299 E.01203
G1 X120.787 Y136.039 E.16499
G1 X120.787 Y135.489 E.01356
G1 X125.121 Y131.154 E.15086
G1 X124.772 Y130.953 E.00992
G1 X120.787 Y134.938 E.1387
G1 X120.787 Y134.387 E.01356
G1 X124.463 Y130.711 E.12795
G3 X124.206 Y130.417 I2.089 J-2.082 E.00961
G1 X120.787 Y133.836 E.11902
G1 X120.787 Y133.285 E.01356
G1 X123.999 Y130.074 E.11179
G3 X123.839 Y129.682 I1.063 J-.66 E.01045
G1 X120.787 Y132.735 E.10625
G1 X120.787 Y132.184 E.01356
G1 X123.746 Y129.225 E.10299
G3 X123.735 Y128.685 I2.144 J-.311 E.01334
G1 X120.787 Y131.633 E.10263
G1 X120.787 Y131.082 E.01356
G1 X123.737 Y128.132 E.10267
G1 X123.738 Y127.58 E.01359
G1 X120.787 Y130.531 E.10272
G1 X120.787 Y129.981 E.01356
G1 X123.739 Y127.028 E.10276
G1 X123.74 Y126.476 E.01359
G1 X120.787 Y129.43 E.10281
G1 X120.787 Y128.879 E.01356
G1 X123.752 Y125.913 E.10322
G3 X123.995 Y125.12 I2.461 J.318 E.0205
G1 X120.787 Y128.328 E.11165
G1 X120.787 Y127.777 E.01356
G1 X124.583 Y123.981 E.13214
G1 X124.583 Y123.43 E.01356
G1 X120.787 Y127.227 E.13214
G1 X120.787 Y126.676 E.01356
G1 X127.875 Y119.588 E.24671
G1 X128.425 Y119.588 E.01355
G1 X125.13 Y122.883 E.11469
G1 X125.681 Y122.883 E.01356
G1 X128.976 Y119.588 E.11468
G1 X129.527 Y119.588 E.01355
G1 X126.232 Y122.883 E.11468
G1 X126.783 Y122.883 E.01356
G1 X130.077 Y119.588 E.11468
G1 X130.628 Y119.589 E.01355
G1 X127.334 Y122.883 E.11467
G1 X127.884 Y122.883 E.01356
G1 X131.179 Y119.589 E.11467
G1 X131.73 Y119.589 E.01355
G1 X128.435 Y122.883 E.11467
G1 X128.986 Y122.883 E.01356
G1 X132.28 Y119.589 E.11466
G1 X132.831 Y119.589 E.01355
G1 X129.537 Y122.883 E.11466
G1 X130.088 Y122.883 E.01356
G1 X133.382 Y119.589 E.11466
G1 X133.932 Y119.589 E.01355
G1 X130.638 Y122.883 E.11465
G1 X131.189 Y122.883 E.01356
G1 X134.483 Y119.589 E.11465
G1 X135.034 Y119.589 E.01355
G1 X131.417 Y123.206 E.12589
G1 X131.417 Y123.757 E.01356
G1 X135.213 Y119.961 E.13214
G1 X135.213 Y120.511 E.01356
G1 X131.417 Y124.308 E.13214
G1 X131.417 Y124.386 E.00193
G3 X131.658 Y124.617 I-.816 J1.094 E.00824
G1 X135.213 Y121.062 E.12374
G1 X135.213 Y121.613 E.01356
G1 X131.897 Y124.929 E.11541
G3 X132.084 Y125.293 I-1.136 J.813 E.01011
G1 X135.213 Y122.164 E.10891
G1 X135.213 Y122.715 E.01356
G1 X132.216 Y125.711 E.10431
G3 X132.267 Y126.212 I-5.889 J.848 E.01238
G1 X135.213 Y123.265 E.10255
G1 X135.213 Y123.816 E.01356
G1 X132.267 Y126.762 E.10255
G1 X132.267 Y127.313 E.01356
G1 X135.213 Y124.367 E.10255
G1 X135.213 Y124.918 E.01356
G1 X132.267 Y127.864 E.10255
G1 X132.267 Y128.415 E.01356
G1 X135.213 Y125.469 E.10255
G1 X135.213 Y126.019 E.01356
G1 X132.267 Y128.966 E.10255
G3 X132.224 Y129.463 I-2.463 J.038 E.01231
G1 X132.182 Y129.601 E.00356
G1 X135.213 Y126.57 E.1055
G1 X135.213 Y127.121 E.01356
G1 X125.921 Y136.413 E.32343
G1 X126.472 Y136.413 E.01356
G1 X135.213 Y127.672 E.30426
G1 X135.213 Y128.223 E.01356
G1 X127.023 Y136.413 E.28509
G1 X127.573 Y136.413 E.01356
G1 X135.213 Y128.773 E.26592
G1 X135.213 Y129.324 E.01356
G1 X128.124 Y136.413 E.24675
G1 X128.675 Y136.413 E.01356
G1 X135.213 Y129.875 E.22757
G1 X135.213 Y130.426 E.01356
G1 X129.226 Y136.413 E.2084
G1 X129.777 Y136.413 E.01356
G1 X135.213 Y130.977 E.18923
G1 X135.213 Y131.527 E.01356
G1 X130.327 Y136.413 E.17006
G1 X130.878 Y136.413 E.01356
G1 X135.213 Y132.078 E.15089
G1 X135.213 Y132.629 E.01356
G1 X131.429 Y136.413 E.13172
G1 X131.98 Y136.413 E.01356
G1 X135.213 Y133.18 E.11255
G1 X135.213 Y133.731 E.01356
G1 X132.531 Y136.413 E.09337
G1 X133.081 Y136.413 E.01356
G1 X135.213 Y134.281 E.0742
G1 X135.213 Y134.832 E.01356
G1 X133.632 Y136.413 E.05503
G1 X134.183 Y136.413 E.01356
G1 X135.213 Y135.383 E.03586
G1 X135.213 Y135.934 E.01356
G1 X134.56 Y136.587 E.02273
; WIPE_START
G1 F7702.776
G1 X135.213 Y135.934 E-.35092
G1 X135.213 Y135.383 E-.2093
G1 X134.841 Y135.755 E-.19978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.818 Y130.009 Z.76 F42000
G1 X127.461 Y127.313 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.539 Y127.311 E.02834
G1 X128.539 Y128.089 E.02044
G1 X127.461 Y128.087 E.02834
G1 X127.461 Y127.373 E.01877
M204 S250
G1 X127.061 Y127.037 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.269 Y126.912 I.249 J.18 E.0061
G1 X128.742 Y126.914 E.03589
G3 X128.94 Y127.038 I-.047 J.294 E.00587
G1 X128.94 Y127.51 E.01149
G1 X128.99 Y127.51 E.00122
G1 X128.989 Y128.209 E.01703
G3 X128.69 Y128.49 I-.298 J-.018 E.01104
G1 X127.269 Y128.488 E.03462
G3 X127.01 Y128.189 I.036 J-.293 E.01055
G1 X127.01 Y127.51 E.01656
G1 X127.06 Y127.51 E.00122
G1 X127.061 Y127.097 E.01006
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X127.129 Y126.967 E-.05592
G1 X127.269 Y126.912 E-.05724
G1 X128.742 Y126.914 E-.55952
G1 X128.86 Y126.959 E-.04793
G1 X128.933 Y127.032 E-.03938
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/42
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.804 J-.913 P1  F42000
G1 X120.303 Y119.433 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X120.32 Y119.342 E.00241
G3 X120.726 Y119.086 I.389 J.166 E.0134
G1 X135.333 Y119.089 E.38369
G3 X135.714 Y119.526 I-.035 J.415 E.01683
G1 X135.714 Y136.475 E.44521
G3 X135.274 Y136.914 I-.422 J.017 E.01832
G1 X120.726 Y136.914 E.38217
G3 X120.286 Y136.475 I-.017 J-.422 E.01832
G1 X120.286 Y119.526 E.44522
G1 X120.292 Y119.492 E.0009
M204 S10000
G1 X119.889 Y119.339 F42000
G1 F5400
M204 S6000
G3 X120.715 Y118.671 I.823 J.173 E.03022
G1 X135.372 Y118.675 E.38499
G3 X136.129 Y119.515 I-.075 J.829 E.03268
G1 X136.129 Y136.485 E.44576
G3 X135.285 Y137.329 I-.841 J.004 E.03488
G1 X120.715 Y137.329 E.38271
G3 X119.871 Y136.485 I-.004 J-.841 E.03488
G1 X119.871 Y119.515 E.44576
G3 X119.878 Y119.398 I.841 J-.004 E.00309
M204 S250
G1 X119.491 Y119.29 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2760
M204 S5000
G1 X119.494 Y119.26 E.00073
G3 X120.705 Y118.27 I1.223 J.261 E.04119
G1 X134.695 Y118.27 E.34095
G3 X135.41 Y118.276 I.3 J7.276 E.01743
G3 X136.53 Y119.505 I-.113 J1.228 E.04449
G1 X136.53 Y135.895 E.39944
G3 X136.506 Y136.74 I-4.348 J.3 E.02064
G3 X135.295 Y137.73 I-1.223 J-.261 E.04119
G1 X121.305 Y137.73 E.34095
G3 X120.46 Y137.706 I-.3 J-4.348 E.02064
G3 X119.47 Y136.495 I.261 J-1.223 E.04119
G1 X119.47 Y120.105 E.39944
G3 X119.47 Y119.505 I4.348 J-.3 E.01463
G1 X119.485 Y119.35 E.00381
; WIPE_START
M204 S6000
G1 X119.494 Y119.26 E-.03423
G1 X119.564 Y119.029 E-.09168
G1 X119.678 Y118.817 E-.09157
G1 X119.92 Y118.549 E-.13707
G1 X120.12 Y118.415 E-.09165
G1 X120.345 Y118.323 E-.09229
G1 X120.58 Y118.276 E-.09094
G1 X120.705 Y118.27 E-.04781
M73 P43 R9
G1 X120.923 Y118.27 E-.08276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.92
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


G1 Z0.920
G1 X122.752 Y121.453 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.621036
G1 F5113.346
M204 S6000
G2 X122.759 Y121.568 I-.033 J.06 E.01083
; WIPE_START
G1 X122.679 Y121.58 E-.20421
G1 X122.642 Y121.516 E-.18527
G1 X122.679 Y121.453 E-.18528
G1 X122.752 Y121.453 E-.18524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.23 Y123.455 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F7778.873
M204 S6000
G1 X122.363 Y123.223 E.00654
G1 X122.549 Y122.724 E.01296
G1 X123.016 Y121.932 E.02243
G3 X124.07 Y121.03 I2.999 J2.441 E.03399
G1 X122.23 Y121.03 E.04486
G1 X122.23 Y123.395 E.05765
; WIPE_START
G1 X122.23 Y121.395 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.833 Y125.345 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.418509
G1 F7808.979
M204 S6000
G1 X122.043 Y124.593 E.01894
G1 X122.367 Y123.94 E.01771
G1 X122.676 Y123.51 E.01286
G1 X122.91 Y122.859 E.01678
G1 X123.339 Y122.142 E.02028
G3 X125.062 Y121.025 I2.657 J2.21 E.05062
; LINE_WIDTH: 0.406881
G1 F8052.718
G1 X125.318 Y120.983 E.00611
; LINE_WIDTH: 0.350647
G1 F9484.339
G3 X125.851 Y120.922 I.605 J2.912 E.01074
G1 X130.07 Y120.92 E.08432
G1 X130.658 Y120.972 E.01181
; LINE_WIDTH: 0.419247
G1 F7794.012
G1 X130.941 Y121.027 E.00702
G1 X131.441 Y121.21 E.01294
G1 X132.157 Y121.639 E.0203
G1 X132.593 Y122.075 E.01499
G1 X132.961 Y122.598 E.01555
G3 X133.362 Y123.56 I-6.734 J3.374 E.02539
G3 X133.887 Y124.429 I-2.872 J2.328 E.02477
G1 X134.152 Y125.207 E.01998
G2 X134.156 Y120.647 I-354.605 J-2.572 E.11092
G3 X131.011 Y120.643 I-1.257 J-250.175 E.07651
; LINE_WIDTH: 0.398161
G1 F8245.723
G1 X130.645 Y120.627 E.00842
; LINE_WIDTH: 0.348301
G1 F9555.222
G2 X130.07 Y120.608 I-.686 J12.085 E.01142
G1 X125.851 Y120.609 E.0837
; LINE_WIDTH: 0.365786
G1 F9051.14
G1 X125.436 Y120.627 E.0087
; LINE_WIDTH: 0.418488
G1 F7809.412
G1 X125.022 Y120.645 E.01008
G1 X121.844 Y120.644 E.07714
G3 X121.835 Y125.285 I-183.83 J1.958 E.11266
; WIPE_START
G1 X121.839 Y123.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.834 Y129.882 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.380926
G1 F8655.761
M204 S6000
G1 X121.815 Y129.606 E.00606
; LINE_WIDTH: 0.333484
G1 F10028.485
G3 X121.79 Y129.156 I6.509 J-.585 E.00853
; LINE_WIDTH: 0.311436
G1 F10826.417
G1 X121.789 Y126.106 E.0534
; LINE_WIDTH: 0.332531
G1 F10060.531
G1 X121.809 Y125.755 E.00662
; LINE_WIDTH: 0.376481
G1 F8768.212
G1 X121.83 Y125.405 E.0076
; WIPE_START
G1 X121.809 Y125.755 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126 Y132.134 Z.92 F42000
G1 X126.05 Y132.21 Z.92
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F7778.881
M204 S6000
G1 X125.237 Y132.091 E.02001
G1 X124.651 Y131.863 E.01532
G3 X123.42 Y130.765 I1.682 J-3.124 E.04057
G1 X123.164 Y130.297 E.013
G1 X122.97 Y129.71 E.01507
G3 X122.893 Y129.155 I3.737 J-.8 E.01367
G1 X122.891 Y126.106 E.07432
G1 X122.97 Y125.493 E.01505
G1 X123.143 Y124.954 E.0138
G1 X123.39 Y124.481 E.013
G1 X123.726 Y124.045 E.0134
G3 X123.994 Y123.264 I5.371 J1.409 E.02016
G1 X124.308 Y122.775 E.01415
G1 X124.74 Y122.416 E.0137
G1 X125.265 Y122.169 E.01414
G1 X125.852 Y122.043 E.01463
G1 X130.071 Y122.039 E.10282
G1 X130.538 Y122.108 E.01151
G1 X131.036 Y122.294 E.01297
G1 X131.525 Y122.608 E.01414
G1 X131.884 Y123.04 E.01371
G3 X132.273 Y124.042 I-3.162 J1.801 E.02629
G1 X132.604 Y124.471 E.0132
G1 X132.859 Y124.959 E.01341
G1 X133.043 Y125.548 E.01504
G3 X133.108 Y126.102 I-4.343 J.794 E.01361
G1 X133.109 Y129.094 E.07291
G1 X133.04 Y129.63 E.01318
G1 X132.831 Y130.306 E.01725
G1 X132.521 Y130.851 E.01528
G1 X132.108 Y131.329 E.01538
G1 X131.667 Y131.679 E.01372
G1 X131.198 Y131.935 E.01304
G1 X130.645 Y132.122 E.01422
G3 X130.09 Y132.205 I-.805 J-3.486 E.01369
G1 X126.11 Y132.21 E.097
M204 S10000
G1 X126.05 Y132.595 F42000
G1 F7778.881
M204 S6000
G1 X125.168 Y132.47 E.02169
G1 X124.51 Y132.222 E.01716
G1 X123.983 Y131.905 E.01497
G1 X123.529 Y131.511 E.01465
G1 X123.118 Y131.004 E.01591
G1 X122.825 Y130.48 E.01463
G1 X122.603 Y129.83 E.01675
G3 X122.508 Y129.155 I4.018 J-.915 E.01662
G1 X122.506 Y126.106 E.07433
G1 X122.587 Y125.443 E.01627
G1 X122.776 Y124.834 E.01555
G1 X123.049 Y124.3 E.01459
G1 X123.376 Y123.867 E.01323
G3 X123.633 Y123.129 I5.168 J1.386 E.01906
G1 X123.985 Y122.564 E.01622
G1 X124.499 Y122.115 E.01663
G1 X125.105 Y121.818 E.01646
G1 X125.731 Y121.67 E.01567
G1 X125.852 Y121.657 E.00297
G1 X130.071 Y121.654 E.10283
G1 X130.673 Y121.747 E.01484
G1 X131.171 Y121.933 E.01297
G1 X131.736 Y122.285 E.01621
G1 X132.185 Y122.798 E.01664
G1 X132.474 Y123.386 E.01595
G1 X132.623 Y123.865 E.01223
G1 X132.966 Y124.324 E.01396
G1 X133.201 Y124.782 E.01256
G1 X133.411 Y125.434 E.0167
G3 X133.494 Y126.102 I-4.504 J.896 E.01641
G1 X133.494 Y129.094 E.07291
G1 X133.423 Y129.68 E.0144
G1 X133.196 Y130.43 E.01909
G1 X132.855 Y131.044 E.01712
G1 X132.398 Y131.583 E.01722
G1 X131.905 Y131.982 E.01547
G1 X131.381 Y132.275 E.01463
G1 X130.766 Y132.488 E.01587
G3 X130.09 Y132.59 I-.924 J-3.811 E.01668
G1 X126.11 Y132.595 E.09701
M204 S10000
G1 X126.05 Y132.981 F42000
; LINE_WIDTH: 0.419996
G1 F7778.882
M204 S6000
G3 X125.099 Y132.85 I.11 J-4.308 E.02343
G1 X124.368 Y132.581 E.019
G1 X123.779 Y132.233 E.01666
G1 X123.272 Y131.799 E.01626
G1 X122.815 Y131.244 E.01753
G1 X122.486 Y130.664 E.01626
G1 X122.237 Y129.949 E.01844
G1 X122.122 Y129.155 E.01954
G1 X122.12 Y126.106 E.07433
G1 X122.205 Y125.393 E.01749
G1 X122.41 Y124.713 E.0173
G1 X122.708 Y124.12 E.01619
G1 X123.026 Y123.688 E.01307
G3 X123.272 Y122.994 I4.962 J1.365 E.01796
G1 X123.662 Y122.353 E.01828
G1 X123.866 Y122.129 E.00739
G1 X124.257 Y121.814 E.01224
G1 X124.945 Y121.468 E.01878
G1 X125.65 Y121.293 E.0177
G1 X125.852 Y121.272 E.00494
G1 X130.071 Y121.268 E.10284
G1 X130.606 Y121.334 E.01315
G1 X131.306 Y121.572 E.018
G1 X131.946 Y121.962 E.01827
G3 X132.954 Y123.662 I-2.094 J2.389 E.04898
G1 X133.308 Y124.147 E.01465
G1 X133.544 Y124.606 E.01256
G1 X133.78 Y125.321 E.01836
; LINE_WIDTH: 0.441371
G1 F7370.374
G1 X133.81 Y125.362 E.00131
; LINE_WIDTH: 0.484121
G1 F6669.854
G1 X133.841 Y125.403 E.00145
; LINE_WIDTH: 0.526871
G1 F6090.938
G1 X133.871 Y125.444 E.00159
; LINE_WIDTH: 0.561148
G1 F5694.638
G1 X133.901 Y125.485 E.0017
G3 X133.949 Y126.102 I-6.617 J.819 E.0206
G1 X133.949 Y129.093 E.0996
G1 X133.932 Y129.344 E.00836
; LINE_WIDTH: 0.552253
G1 F5792.443
G1 X133.896 Y129.47 E.00431
; LINE_WIDTH: 0.514465
G1 F6248.324
G1 X133.86 Y129.597 E.00399
; LINE_WIDTH: 0.476678
G1 F6782.094
G1 X133.824 Y129.724 E.00368
; LINE_WIDTH: 0.420263
G1 F7773.503
G3 X133.562 Y130.554 I-11.682 J-3.236 E.02124
G1 X133.189 Y131.237 E.01896
G1 X132.688 Y131.837 E.01907
G1 X132.143 Y132.286 E.01722
G1 X131.564 Y132.614 E.01623
G1 X130.887 Y132.854 E.01753
G1 X130.091 Y132.976 E.01965
G1 X126.11 Y132.981 E.09709
M204 S10000
G1 X126.05 Y133.367 F42000
; LINE_WIDTH: 0.419391
G1 F7791.095
M204 S6000
G3 X125.03 Y133.229 I.122 J-4.763 E.02508
G1 X124.226 Y132.94 E.0208
G1 X123.575 Y132.56 E.01833
G1 X123.016 Y132.087 E.01784
G1 X122.513 Y131.483 E.01913
G1 X122.146 Y130.847 E.01786
G1 X121.875 Y130.067 E.02009
G1 X121.834 Y129.882 E.0046
G1 X121.844 Y135.356 E.1332
G1 X134.156 Y135.356 E.29959
G3 X134.162 Y129.916 I304.293 J-2.379 E.13238
G1 X133.927 Y130.678 E.0194
G1 X133.524 Y131.429 E.02075
G1 X132.979 Y132.091 E.02086
G1 X132.381 Y132.589 E.01893
G1 X131.748 Y132.953 E.01777
G1 X131.008 Y133.22 E.01913
G1 X130.287 Y133.347 E.01782
G1 X130.091 Y133.362 E.00478
G1 X126.11 Y133.366 E.09688
M204 S10000
G1 X126.05 Y133.752 F42000
; LINE_WIDTH: 0.419996
G1 F7778.878
M204 S6000
G3 X124.961 Y133.609 I.132 J-5.203 E.0268
G1 X124.084 Y133.298 E.02267
G1 X123.371 Y132.887 E.02006
G1 X122.759 Y132.374 E.01947
G1 X122.23 Y131.747 E.02001
G1 X122.23 Y134.97 E.07857
G1 X133.77 Y134.97 E.28127
G1 X133.77 Y131.744 E.07864
G1 X133.269 Y132.345 E.01908
G1 X132.619 Y132.893 E.02071
G1 X131.931 Y133.292 E.01939
G1 X131.13 Y133.586 E.02081
G1 X130.343 Y133.729 E.01947
G1 X130.091 Y133.747 E.00616
G1 X126.11 Y133.752 E.09704
M204 S10000
G1 X126.052 Y134.153 F42000
; LINE_WIDTH: 0.462561
G1 F7005.664
M204 S6000
G1 X125.47 Y134.121 E.01579
; LINE_WIDTH: 0.460886
G1 F7033.174
G1 X125.181 Y134.055 E.00798
; LINE_WIDTH: 0.420577
G1 F7767.18
G1 X124.892 Y133.988 E.00723
G1 X123.943 Y133.657 E.02455
G1 X123.167 Y133.215 E.02179
G1 X122.615 Y132.763 E.01741
G1 X122.615 Y134.585 E.04446
G1 X124.839 Y134.585 E.05427
; LINE_WIDTH: 0.433626
G1 F7513.337
G1 X125.134 Y134.571 E.00747
; LINE_WIDTH: 0.453523
G1 F7156.724
G3 X126.053 Y134.569 I.485 J14.466 E.02433
G1 X130.092 Y134.568 E.10701
; LINE_WIDTH: 0.468978
G1 F6902.238
G3 X131.903 Y134.585 I.791 J12.56 E.04977
; LINE_WIDTH: 0.420757
G1 F7763.562
G1 X133.385 Y134.585 E.03619
G1 X133.385 Y132.764 E.04446
G1 X132.857 Y133.196 E.01666
G1 X132.115 Y133.632 E.02102
G1 X131.252 Y133.957 E.0225
; LINE_WIDTH: 0.447781
G1 F7256.104
G1 X131.076 Y134.017 E.00486
; LINE_WIDTH: 0.476469
G1 F6785.298
G1 X130.901 Y134.078 E.0052
G3 X130.092 Y134.149 I-1.04 J-7.125 E.02269
; LINE_WIDTH: 0.451831
G1 F7185.715
G1 X126.112 Y134.153 E.105
; WIPE_START
G1 X128.112 Y134.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.178 Y134.182 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.453416
G1 F7158.538
M204 S6000
G1 X123.387 Y133.826 E.02297
G1 X123.018 Y133.595 E.01153
G1 X123.018 Y134.182 E.01555
G1 X124.118 Y134.182 E.02914
; WIPE_START
G1 X123.018 Y134.182 E-.41808
G1 X123.018 Y133.595 E-.22308
G1 X123.283 Y133.761 E-.11885
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.906 Y134.136 Z.92 F42000
G1 X131.837 Y134.182 Z.92
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.453896
G1 F7150.348
M204 S6000
G1 X132.982 Y134.182 E.03036
G1 X132.982 Y133.594 E.0156
G1 X132.306 Y133.986 E.02073
G1 X131.893 Y134.159 E.01188
; WIPE_START
G1 X132.306 Y133.986 E-.17032
G1 X132.982 Y133.594 E-.29704
G1 X132.982 Y134.182 E-.22363
G1 X132.801 Y134.182 E-.06902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.172 Y129.778 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.398166
G1 F8245.609
M204 S6000
G1 X134.166 Y129.856 E.00181
M204 S10000
G1 X134.473 Y129.093 F42000
; LINE_WIDTH: 0.561073
G1 F5695.449
M204 S6000
G1 X134.473 Y126.102 E.09958
G1 X134.456 Y125.453 E.02159
; LINE_WIDTH: 0.569621
G1 F5604.491
G1 X134.478 Y125.392 E.00221
; LINE_WIDTH: 0.526871
G1 F6090.938
G1 X134.499 Y125.33 E.00203
; LINE_WIDTH: 0.484121
G1 F6669.854
G1 X134.52 Y125.268 E.00186
; LINE_WIDTH: 0.420023
G1 F7778.338
G1 X134.542 Y125.207 E.00159
G1 X134.542 Y120.261 E.12054
G1 X121.458 Y120.258 E.31889
G1 X121.458 Y135.742 E.37738
G1 X134.542 Y135.742 E.31889
G1 X134.542 Y129.778 E.14536
; LINE_WIDTH: 0.443925
G1 F7324.428
G1 X134.518 Y129.606 E.00449
; LINE_WIDTH: 0.491781
G1 F6558.166
G1 X134.494 Y129.434 E.00502
; LINE_WIDTH: 0.547789
G1 F5842.796
G3 X134.472 Y129.153 I.89 J-.211 E.00916
; WIPE_START
G1 X134.494 Y129.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.77 Y123.458 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F7778.873
M204 S6000
G1 X133.77 Y121.032 E.05912
G1 X131.933 Y121.032 E.04478
G3 X133.525 Y122.903 I-1.845 J3.183 E.06105
G1 X133.668 Y123.325 E.01084
G1 X133.734 Y123.41 E.00264
; WIPE_START
G1 X133.668 Y123.325 E-.04116
G1 X133.525 Y122.903 E-.16909
G1 X133.311 Y122.437 E-.19497
G1 X133.087 Y122.074 E-.16202
G1 X132.772 Y121.682 E-.19095
G1 X132.769 Y121.679 E-.00181
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.315 Y121.46 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.633976
G1 F5003.002
M204 S6000
G2 X133.323 Y121.577 I-.034 J.061 E.01136
; WIPE_START
G1 X133.24 Y121.59 E-.20568
G1 X133.203 Y121.525 E-.18478
G1 X133.24 Y121.46 E-.18479
G1 X133.315 Y121.46 E-.18475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.927 Y119.875 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F7778.873
M204 S6000
G1 X121.073 Y119.873 E.33766
G1 X121.073 Y136.127 E.39615
G1 X134.927 Y136.127 E.33766
G1 X134.927 Y119.935 E.39462
M204 S10000
G1 X135.313 Y119.582 F42000
G1 F7778.873
M204 S6000
G1 X135.258 Y119.49 E.00262
G1 X120.743 Y119.487 E.35375
G1 X120.687 Y119.568 E.00239
G1 X120.687 Y136.457 E.41163
G1 X120.768 Y136.513 E.00239
M73 P44 R9
G1 X135.257 Y136.513 E.35313
G1 X135.313 Y136.433 E.00239
G1 X135.313 Y119.642 E.40922
; WIPE_START
G1 X135.313 Y121.642 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.806 Y122.428 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.425716
G1 F3000
M204 S6000
G1 X125.87 Y122.428 E.12208
G2 X125.111 Y122.651 I.182 J2.025 E.01969
G1 X124.828 Y122.819 E.00815
G1 X131.172 Y122.819 E.15691
G1 X131.364 Y122.983 E.00623
G1 X131.536 Y123.211 E.00706
G1 X124.464 Y123.211 E.17491
G1 X124.365 Y123.381 E.00487
G1 X124.271 Y123.602 E.00595
G1 X131.729 Y123.602 E.18446
G1 X131.811 Y123.827 E.00592
G1 X131.848 Y123.993 E.00421
G1 X124.152 Y123.993 E.19032
G1 X124.142 Y124.049 E.0014
G3 X124.044 Y124.264 I-.206 J.036 E.0062
G1 X123.938 Y124.385 E.00397
G1 X132.065 Y124.385 E.20098
G1 X132.337 Y124.776 E.0118
G1 X123.66 Y124.776 E.21461
G1 X123.473 Y125.168 E.01073
G1 X132.527 Y125.168 E.22393
G1 X132.651 Y125.559 E.01015
G1 X123.349 Y125.559 E.23004
G1 X123.286 Y125.95 E.00981
G1 X132.714 Y125.95 E.23318
G1 X132.725 Y126.342 E.00968
G1 X123.275 Y126.342 E.23373
G1 X123.275 Y126.733 E.00968
G1 X132.725 Y126.733 E.23373
G1 X132.725 Y127.124 E.00968
G1 X123.275 Y127.124 E.23372
G1 X123.275 Y127.516 E.00968
G1 X132.725 Y127.516 E.23372
G1 X132.725 Y127.907 E.00968
G1 X123.276 Y127.907 E.23371
G1 X123.276 Y128.299 E.00968
G1 X132.725 Y128.299 E.23371
G1 X132.725 Y128.69 E.00968
G1 X123.276 Y128.69 E.23371
G1 X123.276 Y129.081 E.00968
G1 X132.723 Y129.081 E.23365
G1 X132.685 Y129.473 E.00973
G1 X123.315 Y129.473 E.23173
G1 X123.411 Y129.864 E.00996
G1 X132.589 Y129.864 E.22702
G1 X132.43 Y130.255 E.01045
G1 X123.57 Y130.255 E.21914
G1 X123.808 Y130.647 E.01133
G1 X132.194 Y130.647 E.20743
G1 X132.046 Y130.837 E.00596
G1 X131.856 Y131.038 E.00686
G1 X124.144 Y131.038 E.19073
G1 X124.399 Y131.256 E.00829
G1 X124.659 Y131.43 E.00772
G1 X131.341 Y131.43 E.16529
G1 X131.062 Y131.575 E.00778
G1 X130.722 Y131.703 E.00898
G1 X130.419 Y131.777 E.00771
G1 X130.067 Y131.82 E.00877
G1 X125.083 Y131.821 E.12327
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X127.083 Y131.821 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/42
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S226.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I1.062 J-.593 P1  F42000
G1 X120.139 Y119.388 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X120.725 Y118.926 I.571 J.122 E.02128
G1 X135.356 Y118.93 E.38432
G3 X135.874 Y119.525 I-.062 J.577 E.02277
G1 X135.874 Y136.475 E.44522
G3 X135.275 Y137.074 I-.584 J.015 E.02489
G1 X120.725 Y137.074 E.38218
G3 X120.126 Y136.475 I-.02 J-.579 E.02495
G1 X120.126 Y119.525 E.44522
G3 X120.129 Y119.448 I.584 J-.015 E.00204
M204 S10000
G1 X119.73 Y119.315 F42000
G1 F5400
M204 S6000
G1 X119.732 Y119.308 E.00022
G3 X120.715 Y118.511 I.981 J.206 E.03597
G1 X135.388 Y118.516 E.38541
G1 X135.397 Y118.516 E.00025
G3 X136.289 Y119.515 I-.106 J.993 E.03857
G1 X136.289 Y136.485 E.44576
G3 X135.285 Y137.489 I-1.003 J.002 E.04146
G1 X120.715 Y137.489 E.38272
G3 X119.711 Y136.485 I-.01 J-.994 E.04156
G1 X119.711 Y119.515 E.44576
G1 X119.724 Y119.375 E.00369
M204 S250
G1 X119.332 Y119.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2760
M204 S5000
G1 X119.337 Y119.229 E.00118
G3 X120.168 Y118.216 I1.409 J.309 E.03315
M106 S226.95
M106 S229.5
G1 F2640
G1 X120.297 Y118.17 E.00333
M106 S226.95
M106 S229.5
G1 F2760
G3 X120.705 Y118.11 I.431 J1.512 E.01009
G1 X134.695 Y118.11 E.34095
G3 X135.407 Y118.116 I.3 J7.253 E.01737
M106 S226.95
M106 S229.5
G3 X136.584 Y118.968 I-.111 J1.391 E.03725
M106 S226.95
M106 S229.5
G1 F2640
G1 X136.63 Y119.097 E.00332
M106 S226.95
M106 S229.5
G1 F2760
G3 X136.69 Y119.505 I-1.512 J.431 E.0101
G1 X136.69 Y135.895 E.39944
G3 X136.663 Y136.771 I-4.506 J.3 E.0214
G3 X135.832 Y137.784 I-1.409 J-.309 E.03315
M106 S226.95
M106 S229.5
G1 F2640
G1 X135.703 Y137.83 E.00333
M106 S226.95
M106 S229.5
G1 F2760
G3 X135.295 Y137.89 I-.431 J-1.512 E.01009
G1 X121.305 Y137.89 E.34095
G3 X120.429 Y137.863 I-.3 J-4.506 E.0214
G3 X119.416 Y137.032 I.309 J-1.409 E.03315
M106 S226.95
M106 S229.5
G1 F2640
G1 X119.37 Y136.903 E.00332
M106 S226.95
M106 S229.5
G1 F2760
G1 X119.356 Y136.847 E.00142
G3 X119.31 Y136.495 I1.453 J-.368 E.00867
G1 X119.31 Y120.105 E.39944
G3 X119.31 Y119.505 I4.506 J-.3 E.01463
G1 X119.326 Y119.337 E.00412
M106 S226.95
; WIPE_START
M204 S6000
G1 X119.337 Y119.229 E-.04127
G1 X119.37 Y119.097 E-.05179
G1 X119.474 Y118.845 E-.10356
G1 X119.626 Y118.618 E-.10352
G1 X119.717 Y118.517 E-.05184
G1 X119.928 Y118.344 E-.10352
G1 X120.168 Y118.216 E-.10352
G1 X120.297 Y118.17 E-.05185
G1 X120.564 Y118.117 E-.10352
G1 X120.684 Y118.111 E-.04561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.08
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
            G0 Z1.08 F4000
            G39.3 S1
            G0 Z1.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X120.293 Y119.584 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420806
G1 F6089
M204 S6000
G1 X120.55 Y119.327 E.00888
G1 X120.62 Y119.285 E.00198
G3 X121.156 Y119.267 I.328 J1.785 E.01316
G1 X120.467 Y119.957 E.02382
G1 X120.467 Y120.503 E.01335
G1 X121.703 Y119.267 E.04269
G1 X122.249 Y119.267 E.01334
G1 X120.467 Y121.05 E.06156
G1 X120.467 Y121.596 E.01335
G1 X122.796 Y119.267 E.08043
G1 X123.342 Y119.268 E.01334
G1 X120.467 Y122.143 E.09931
G1 X120.467 Y122.689 E.01335
G1 X123.888 Y119.268 E.11818
G1 X124.435 Y119.268 E.01334
G1 X120.467 Y123.236 E.13705
G1 X120.467 Y123.782 E.01335
G1 X124.981 Y119.268 E.15592
G1 X125.528 Y119.268 E.01334
G1 X120.467 Y124.329 E.1748
G1 X120.467 Y124.876 E.01335
G1 X126.074 Y119.268 E.19367
M73 P45 R9
G1 X126.62 Y119.268 E.01334
G1 X120.467 Y125.422 E.21254
G1 X120.467 Y125.969 E.01335
G1 X127.167 Y119.269 E.23141
G1 X127.713 Y119.269 E.01334
G1 X120.467 Y126.515 E.25028
G1 X120.467 Y127.062 E.01335
G1 X128.26 Y119.269 E.26916
G1 X128.806 Y119.269 E.01334
G1 X120.467 Y127.608 E.28803
G1 X120.467 Y128.155 E.01335
G1 X129.352 Y119.269 E.3069
G1 X129.899 Y119.269 E.01334
G1 X120.467 Y128.701 E.32577
G1 X120.467 Y129.248 E.01335
G1 X130.445 Y119.27 E.34464
G1 X130.992 Y119.27 E.01334
G1 X120.467 Y129.795 E.36352
G1 X120.467 Y130.341 E.01335
G1 X131.538 Y119.27 E.38239
G1 X132.084 Y119.27 E.01334
G1 X120.467 Y130.888 E.40126
G1 X120.467 Y131.434 E.01335
G1 X132.631 Y119.27 E.42013
G1 X133.177 Y119.27 E.01334
G1 X120.467 Y131.981 E.439
G1 X120.467 Y132.527 E.01335
G1 X133.724 Y119.27 E.45788
G1 X134.27 Y119.271 E.01334
G1 X120.467 Y133.074 E.47675
G1 X120.467 Y133.62 E.01335
G1 X134.816 Y119.271 E.49562
G1 X135.306 Y119.271 E.01195
G1 X135.35 Y119.284 E.00112
G1 X120.467 Y134.167 E.51403
G1 X120.467 Y134.713 E.01335
G1 X135.533 Y119.647 E.52037
G1 X135.533 Y120.194 E.01335
G1 X120.467 Y135.26 E.52037
G1 X120.467 Y135.807 E.01335
G1 X135.533 Y120.74 E.52037
G1 X135.533 Y121.287 E.01335
G1 X120.467 Y136.353 E.52037
G1 X120.467 Y136.459 E.0026
G2 X120.647 Y136.719 I.257 J.015 E.00832
G1 X135.533 Y121.833 E.51415
G1 X135.533 Y122.38 E.01335
G1 X121.18 Y136.733 E.49575
G1 X121.726 Y136.733 E.01335
G1 X135.533 Y122.926 E.47687
G1 X135.533 Y123.473 E.01335
G1 X122.273 Y136.733 E.45799
G1 X122.82 Y136.733 E.01335
G1 X135.533 Y124.02 E.43911
G1 X135.533 Y124.566 E.01335
G1 X123.366 Y136.733 E.42024
G1 X123.913 Y136.733 E.01335
G1 X135.533 Y125.113 E.40136
G1 X135.533 Y125.659 E.01335
G1 X124.459 Y136.733 E.38248
G1 X125.006 Y136.733 E.01335
G1 X135.533 Y126.206 E.3636
G1 X135.533 Y126.752 E.01335
G1 X125.552 Y136.733 E.34473
G1 X126.099 Y136.733 E.01335
G1 X135.533 Y127.299 E.32585
G1 X135.533 Y127.845 E.01335
G1 X126.645 Y136.733 E.30697
G1 X127.192 Y136.733 E.01335
G1 X135.533 Y128.392 E.2881
G1 X135.533 Y128.939 E.01335
G1 X127.739 Y136.733 E.26922
G1 X128.285 Y136.733 E.01335
G1 X135.533 Y129.485 E.25034
G1 X135.533 Y130.032 E.01335
G1 X128.832 Y136.733 E.23146
G1 X129.378 Y136.733 E.01335
G1 X135.533 Y130.578 E.21259
G1 X135.533 Y131.125 E.01335
G1 X129.925 Y136.733 E.19371
G1 X130.471 Y136.733 E.01335
G1 X135.533 Y131.671 E.17483
G1 X135.533 Y132.218 E.01335
G1 X131.018 Y136.733 E.15595
G1 X131.564 Y136.733 E.01335
G1 X135.533 Y132.764 E.13708
G1 X135.533 Y133.311 E.01335
G1 X132.111 Y136.733 E.1182
G1 X132.657 Y136.733 E.01335
G1 X135.533 Y133.857 E.09932
G1 X135.533 Y134.404 E.01335
G1 X133.204 Y136.733 E.08045
G1 X133.751 Y136.733 E.01335
G1 X135.533 Y134.951 E.06157
G1 X135.533 Y135.497 E.01335
G1 X134.297 Y136.733 E.04269
G1 X134.844 Y136.733 E.01335
G1 X135.533 Y136.044 E.02381
G1 X135.533 Y136.452 E.00996
G3 X135.467 Y136.657 I-.309 J.013 E.00537
G1 X135.217 Y136.907 E.00864
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7762.569
G1 X135.467 Y136.657 E-.13439
G1 X135.519 Y136.56 E-.04175
G1 X135.533 Y136.452 E-.04143
G1 X135.533 Y136.044 E-.15504
G1 X134.844 Y136.733 E-.37052
G1 X134.799 Y136.733 E-.01688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/42
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.926 J-.79 P1  F42000
G1 X119.982 Y119.357 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X120.725 Y118.766 I.73 J.155 E.02703
G1 X135.32 Y118.769 E.38337
G3 X136.034 Y119.525 I-.029 J.742 E.03027
G1 X136.034 Y136.475 E.44522
G3 X135.275 Y137.234 I-.746 J.013 E.03148
G1 X120.725 Y137.234 E.38217
G3 X119.966 Y136.475 I-.013 J-.746 E.03148
G1 X119.966 Y119.525 E.44522
G3 X119.972 Y119.416 I.746 J-.013 E.00287
M204 S10000
G1 X119.571 Y119.301 F42000
G1 F5400
M204 S6000
G1 X119.575 Y119.276 E.00067
G3 X120.715 Y118.351 I1.14 J.239 E.04173
M73 P46 R9
G1 X135.341 Y118.353 E.38417
G3 X136.449 Y119.515 I-.053 J1.161 E.04657
G1 X136.449 Y136.485 E.44576
G3 X135.285 Y137.649 I-1.165 J-.001 E.04804
G1 X120.715 Y137.649 E.38271
G3 X119.551 Y136.485 I0 J-1.165 E.04804
G1 X119.551 Y119.515 E.44576
G1 X119.565 Y119.361 E.00406
M204 S250
G1 X119.174 Y119.263 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2760
M204 S5000
G1 X119.18 Y119.198 E.00159
G3 X120.705 Y117.95 I1.542 J.329 E.05187
G1 X134.695 Y117.95 E.34095
G3 X135.36 Y117.953 I.3 J6.768 E.01623
G3 X136.85 Y119.505 I-.077 J1.565 E.05779
G1 X136.85 Y135.895 E.39944
G3 X136.82 Y136.802 I-4.194 J.315 E.02217
G3 X135.295 Y138.05 I-1.542 J-.329 E.05187
G1 X121.305 Y138.05 E.34095
G3 X120.398 Y138.02 I-.315 J-4.197 E.02218
G3 X119.15 Y136.495 I.329 J-1.542 E.05187
G1 X119.15 Y120.105 E.39944
G3 X119.148 Y119.505 I4.194 J-.315 E.01464
G1 X119.167 Y119.322 E.00448
M106 S226.95
; WIPE_START
M204 S6000
G1 X119.18 Y119.198 E-.04764
G1 X119.267 Y118.911 E-.11397
G1 X119.411 Y118.639 E-.11693
G1 X119.604 Y118.404 E-.11534
G1 X119.719 Y118.3 E-.05911
G1 X119.969 Y118.133 E-.11419
G1 X120.25 Y118.017 E-.11548
G1 X120.45 Y117.977 E-.07734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.24
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
            G0 Z1.24 F4000
            G39.3 S1
            G0 Z1.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X135.865 Y119.516 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426156
G1 F6282
M204 S6000
G2 X135.517 Y119.176 I-1.884 J1.576 E.01208
G2 X135.302 Y119.109 I-.236 J.382 E.00563
G1 X134.904 Y119.109 E.00987
G1 X135.693 Y119.899 E.02765
G1 X135.693 Y120.453 E.01372
G1 X134.349 Y119.109 E.04705
G1 X133.795 Y119.109 E.01372
G1 X135.693 Y121.007 E.06646
G1 X135.693 Y121.561 E.01372
G1 X133.241 Y119.109 E.08587
G1 X132.687 Y119.109 E.01372
G1 X135.693 Y122.115 E.10527
G1 X135.693 Y122.669 E.01372
G1 X132.133 Y119.109 E.12468
G1 X131.578 Y119.109 E.01372
G1 X135.693 Y123.223 E.14409
G1 X135.693 Y123.777 E.01372
G1 X131.024 Y119.108 E.16349
G1 X130.47 Y119.108 E.01372
G1 X135.693 Y124.332 E.1829
G1 X135.693 Y124.886 E.01372
G1 X129.916 Y119.108 E.20231
G1 X129.362 Y119.108 E.01372
G1 X135.693 Y125.44 E.22171
G1 X135.693 Y125.994 E.01372
G1 X128.807 Y119.108 E.24112
G1 X128.253 Y119.108 E.01372
G1 X135.693 Y126.548 E.26053
G1 X135.693 Y127.102 E.01372
G1 X127.699 Y119.108 E.27993
G1 X127.145 Y119.108 E.01372
G1 X135.693 Y127.656 E.29934
G1 X135.693 Y128.21 E.01372
G1 X126.591 Y119.108 E.31875
G1 X126.036 Y119.108 E.01372
G1 X135.693 Y128.764 E.33815
G1 X135.693 Y129.319 E.01372
G1 X125.482 Y119.108 E.35756
G1 X124.928 Y119.108 E.01372
G1 X135.693 Y129.873 E.37696
G1 X135.693 Y130.427 E.01372
G1 X124.374 Y119.107 E.39637
G1 X123.82 Y119.107 E.01372
G1 X135.693 Y130.981 E.41578
G1 X135.693 Y131.535 E.01372
G1 X123.265 Y119.107 E.43518
G1 X122.711 Y119.107 E.01372
G1 X135.693 Y132.089 E.45459
G1 X135.693 Y132.643 E.01372
G1 X122.157 Y119.107 E.474
G1 X121.603 Y119.107 E.01372
G1 X135.693 Y133.197 E.4934
G1 X135.693 Y133.752 E.01372
G1 X121.049 Y119.107 E.51281
G2 X120.537 Y119.15 I-.151 J1.28 E.01279
G1 X135.693 Y134.306 E.53072
G1 X135.693 Y134.86 E.01372
G1 X120.316 Y119.483 E.53846
G1 X120.307 Y120.028 E.0135
G1 X135.693 Y135.414 E.53878
G1 X135.693 Y135.968 E.01372
G1 X120.307 Y120.582 E.53878
G1 X120.307 Y121.136 E.01372
G1 X135.685 Y136.514 E.53848
G3 X135.466 Y136.849 I-.369 J-.002 E.01048
G1 X120.307 Y121.69 E.53082
G1 X120.307 Y122.244 E.01372
G1 X134.956 Y136.893 E.51297
G1 X134.402 Y136.893 E.01372
G1 X120.307 Y122.798 E.49356
G1 X120.307 Y123.352 E.01372
G1 X133.848 Y136.893 E.47416
G1 X133.294 Y136.893 E.01372
G1 X120.307 Y123.906 E.45476
G1 X120.307 Y124.461 E.01372
G1 X132.739 Y136.893 E.43535
G1 X132.185 Y136.893 E.01372
G1 X120.307 Y125.015 E.41595
G1 X120.307 Y125.569 E.01372
G1 X131.631 Y136.893 E.39655
G1 X131.077 Y136.893 E.01372
G1 X120.307 Y126.123 E.37714
G1 X120.307 Y126.677 E.01372
G1 X130.523 Y136.893 E.35774
G1 X129.969 Y136.893 E.01372
G1 X120.307 Y127.231 E.33834
G1 X120.307 Y127.785 E.01372
G1 X129.415 Y136.893 E.31893
G1 X128.861 Y136.893 E.01372
G1 X120.307 Y128.339 E.29953
G1 X120.307 Y128.893 E.01372
G1 X128.307 Y136.893 E.28013
G1 X127.752 Y136.893 E.01372
G1 X120.307 Y129.448 E.26072
M73 P47 R9
G1 X120.307 Y130.002 E.01372
G1 X127.198 Y136.893 E.24132
G1 X126.644 Y136.893 E.01372
G1 X120.307 Y130.556 E.22192
G1 X120.307 Y131.11 E.01372
G1 X126.09 Y136.893 E.20251
G1 X125.536 Y136.893 E.01372
G1 X120.307 Y131.664 E.18311
G1 X120.307 Y132.218 E.01372
G1 X124.982 Y136.893 E.1637
G1 X124.428 Y136.893 E.01372
G1 X120.307 Y132.772 E.1443
G1 X120.307 Y133.326 E.01372
G1 X123.874 Y136.893 E.1249
G1 X123.319 Y136.893 E.01372
G1 X120.307 Y133.881 E.10549
G1 X120.307 Y134.435 E.01372
G1 X122.765 Y136.893 E.08609
G1 X122.211 Y136.893 E.01372
G1 X120.307 Y134.989 E.06669
G1 X120.307 Y135.543 E.01372
G1 X121.657 Y136.893 E.04728
G1 X121.103 Y136.893 E.01372
G1 X120.307 Y136.097 E.02788
G2 X120.338 Y136.643 I1.636 J.181 E.01362
G1 X120.396 Y136.741 E.0028
G1 X120.72 Y137.064 E.01134
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7656.576
G1 X120.396 Y136.741 E-.17405
G1 X120.338 Y136.643 E-.04302
G1 X120.307 Y136.459 E-.07111
G1 X120.307 Y136.097 E-.13754
G1 X120.929 Y136.719 E-.33427
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/42
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I1.215 J-.077 P1  F42000
G1 X119.823 Y119.331 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X120.719 Y118.606 I.884 J.176 E.03283
G1 X135.298 Y118.607 E.38297
G3 X136.194 Y119.525 I-.004 J.9 E.0375
G1 X136.194 Y136.475 E.44521
G3 X135.275 Y137.394 I-.903 J.016 E.0381
G1 X120.725 Y137.394 E.38218
G3 X119.806 Y136.475 I-.016 J-.903 E.03811
G1 X119.806 Y119.525 E.44521
G3 X119.814 Y119.391 I.901 J-.018 E.00355
M204 S10000
G1 X119.412 Y119.282 F42000
G1 F5400
M204 S6000
G1 X119.417 Y119.248 E.00089
G3 X120.711 Y118.191 I1.292 J.26 E.04756
G1 X135.308 Y118.192 E.38344
G3 X136.609 Y119.515 I-.015 J1.316 E.0541
G1 X136.609 Y136.485 E.44575
G3 X135.285 Y137.809 I-1.321 J.003 E.05469
G1 X120.715 Y137.809 E.38271
G3 X119.391 Y136.485 I-.003 J-1.321 E.05468
G1 X119.391 Y119.515 E.44575
G1 X119.407 Y119.342 E.00458
M204 S250
G1 X119.022 Y119.202 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2760
M204 S5000
G1 X119.048 Y119.062 E.00348
G3 X120.704 Y117.79 I1.677 J.47 E.05456
G1 X135.318 Y117.791 E.35618
G3 X137.01 Y119.505 I-.027 J1.718 E.06503
G1 X137.01 Y135.895 E.39944
G3 X136.952 Y136.938 I-4.037 J.3 E.02555
G3 X135.295 Y138.21 I-1.67 J-.46 E.05465
G1 X121.305 Y138.21 E.34095
G3 X120.262 Y138.152 I-.3 J-4.037 E.02555
G3 X118.99 Y136.495 I.46 J-1.67 E.05465
G1 X118.99 Y120.105 E.39944
G3 X119.007 Y119.332 I4.037 J-.3 E.01888
G1 X119.015 Y119.262 E.00173
M106 S226.95
; WIPE_START
M204 S6000
G1 X119.048 Y119.062 E-.07699
G1 X119.12 Y118.847 E-.08602
G1 X119.279 Y118.549 E-.12842
G1 X119.418 Y118.37 E-.08612
G1 X119.615 Y118.178 E-.1045
G1 X119.894 Y117.992 E-.12741
G1 X120.204 Y117.864 E-.12737
G1 X120.263 Y117.851 E-.02318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
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


G1 X120.649 Y118.78 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424906
G1 F6552
M204 S6000
G1 X120.266 Y119.163 E.01337
G1 X120.176 Y119.333 E.00474
G2 X120.147 Y119.835 I1.583 J.344 E.01247
G1 X121.035 Y118.947 E.031
G1 X121.587 Y118.947 E.01363
G1 X120.147 Y120.387 E.05028
G1 X120.147 Y120.94 E.01363
G1 X122.14 Y118.947 E.06956
G1 X122.692 Y118.947 E.01363
G1 X120.147 Y121.492 E.08883
G1 X120.147 Y122.044 E.01363
G1 X123.244 Y118.947 E.10811
G1 X123.796 Y118.947 E.01363
G1 X120.147 Y122.597 E.12739
G1 X120.147 Y123.149 E.01363
G1 X124.349 Y118.947 E.14667
G1 X124.901 Y118.947 E.01363
G1 X120.147 Y123.701 E.16595
G1 X120.147 Y124.254 E.01363
G1 X125.453 Y118.947 E.18523
G1 X126.006 Y118.947 E.01363
G1 X120.147 Y124.806 E.2045
G1 X120.147 Y125.358 E.01363
G1 X126.558 Y118.947 E.22378
G1 X127.11 Y118.947 E.01363
G1 X120.147 Y125.911 E.24306
G1 X120.147 Y126.463 E.01363
G1 X127.663 Y118.947 E.26234
M73 P47 R8
G1 X128.215 Y118.947 E.01363
G1 X120.147 Y127.016 E.28162
G1 X120.147 Y127.568 E.01363
G1 X128.767 Y118.948 E.3009
G1 X129.319 Y118.948 E.01363
G1 X120.147 Y128.12 E.32017
G1 X120.147 Y128.673 E.01363
G1 X129.872 Y118.948 E.33945
G1 X130.424 Y118.948 E.01363
G1 X120.147 Y129.225 E.35873
G1 X120.147 Y129.777 E.01363
G1 X130.976 Y118.948 E.37801
G1 X131.529 Y118.948 E.01363
G1 X120.147 Y130.33 E.39729
G1 X120.147 Y130.882 E.01363
G1 X132.081 Y118.948 E.41657
G1 X132.633 Y118.948 E.01363
G1 X120.147 Y131.434 E.43584
G1 X120.147 Y131.987 E.01363
G1 X133.186 Y118.948 E.45512
G1 X133.738 Y118.948 E.01363
G1 X120.147 Y132.539 E.4744
M73 P48 R8
G1 X120.147 Y133.091 E.01363
G1 X134.29 Y118.948 E.49368
G1 X134.843 Y118.948 E.01363
G1 X120.147 Y133.644 E.51296
G1 X120.147 Y134.196 E.01363
G1 X135.385 Y118.958 E.53188
G3 X135.732 Y119.163 I-.09 J.549 E.01019
G1 X120.147 Y134.748 E.54401
G1 X120.147 Y135.301 E.01363
G1 X135.853 Y119.594 E.54823
G1 X135.853 Y120.147 E.01363
G1 X120.147 Y135.853 E.54823
G1 X120.147 Y136.405 E.01363
G1 X135.853 Y120.699 E.54823
G1 X135.853 Y121.251 E.01363
G1 X120.268 Y136.837 E.54402
G2 X120.613 Y137.043 I.513 J-.466 E.01009
G1 X135.853 Y121.804 E.53194
G1 X135.853 Y122.356 E.01363
G1 X121.156 Y137.053 E.513
G1 X121.709 Y137.053 E.01363
G1 X135.853 Y122.909 E.49372
G1 X135.853 Y123.461 E.01363
G1 X122.261 Y137.053 E.47444
G1 X122.813 Y137.053 E.01363
G1 X135.853 Y124.013 E.45516
G1 X135.853 Y124.566 E.01363
G1 X123.366 Y137.053 E.43588
G1 X123.918 Y137.053 E.01363
G1 X135.853 Y125.118 E.4166
G1 X135.853 Y125.67 E.01363
G1 X124.47 Y137.053 E.39732
G1 X125.023 Y137.053 E.01363
G1 X135.853 Y126.223 E.37804
G1 X135.853 Y126.775 E.01363
G1 X125.575 Y137.053 E.35876
G1 X126.127 Y137.053 E.01363
G1 X135.853 Y127.327 E.33948
G1 X135.853 Y127.88 E.01363
G1 X126.68 Y137.053 E.3202
G1 X127.232 Y137.053 E.01363
G1 X135.853 Y128.432 E.30092
G1 X135.853 Y128.984 E.01363
G1 X127.784 Y137.053 E.28164
G1 X128.337 Y137.053 E.01363
G1 X135.853 Y129.537 E.26236
G1 X135.853 Y130.089 E.01363
G1 X128.889 Y137.053 E.24308
G1 X129.441 Y137.053 E.01363
G1 X135.853 Y130.641 E.2238
G1 X135.853 Y131.194 E.01363
G1 X129.994 Y137.053 E.20452
G1 X130.546 Y137.053 E.01363
G1 X135.853 Y131.746 E.18524
G1 X135.853 Y132.298 E.01363
G1 X131.098 Y137.053 E.16596
G1 X131.651 Y137.053 E.01363
G1 X135.853 Y132.851 E.14668
G1 X135.853 Y133.403 E.01363
G1 X132.203 Y137.053 E.1274
G1 X132.756 Y137.053 E.01363
G1 X135.853 Y133.956 E.10812
G1 X135.853 Y134.508 E.01363
G1 X133.308 Y137.053 E.08884
G1 X133.86 Y137.053 E.01363
G1 X135.853 Y135.06 E.06956
G1 X135.853 Y135.613 E.01363
G1 X134.413 Y137.053 E.05028
G1 X134.965 Y137.053 E.01363
G1 X135.853 Y136.165 E.031
G1 X135.853 Y136.461 E.00732
G3 X135.734 Y136.837 I-.594 J.017 E.00991
G1 X135.353 Y137.217 E.01327
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7681.081
G1 X135.734 Y136.837 E-.20435
G1 X135.824 Y136.667 E-.07295
G1 X135.853 Y136.461 E-.07905
G1 X135.853 Y136.165 E-.11269
G1 X135.312 Y136.706 E-.29096
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/42
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.907 J-.812 P1  F42000
G1 X119.746 Y119.319 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.75 Y119.298 E.00057
G3 X120.653 Y118.529 I.963 J.216 E.03341
G1 X135.395 Y118.532 E.38726
G3 X136.274 Y119.525 I-.11 J.982 E.03818
G1 X136.274 Y136.475 E.44521
G3 X135.275 Y137.474 I-.98 J.019 E.04145
G1 X120.64 Y137.471 E.38442
G3 X119.726 Y136.487 I.065 J-.977 E.03888
G1 X119.726 Y119.525 E.44553
G1 X119.74 Y119.379 E.00386
M204 S10000
G1 X119.334 Y119.28 F42000
G1 F5400
M204 S6000
G1 X119.342 Y119.222 E.00153
G3 X120.632 Y118.113 I1.376 J.296 E.04798
G1 X135.436 Y118.118 E.38887
G3 X136.689 Y119.515 I-.156 J1.401 E.05395
G1 X136.689 Y136.485 E.44575
G3 X135.285 Y137.889 I-1.395 J.009 E.05806
G1 X120.625 Y137.887 E.38509
G3 X119.311 Y136.492 I.081 J-1.393 E.05548
G1 X119.311 Y119.515 E.44594
G1 X119.328 Y119.339 E.00464
M204 S250
G1 X118.941 Y119.198 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F3000
M204 S5000
G1 X118.963 Y119.068 E.00323
G1 X119.015 Y118.897 E.00434
M106 S226.95
G1 X119.083 Y118.732 E.00435
M106 S229.5
G3 X119.163 Y118.582 I1.575 J.745 E.00416
M106 S226.95
G1 X119.262 Y118.434 E.00434
M106 S229.5
G1 X119.374 Y118.298 E.00428
M106 S226.95
G3 X119.636 Y118.061 I1.335 J1.21 E.00863
M106 S229.5
G3 X120.095 Y117.816 I1.801 J2.818 E.01269
M106 S226.95
G3 X120.437 Y117.73 I.609 J1.703 E.00863
M106 S229.5
G1 X120.612 Y117.712 E.00428
M106 S226.95
G1 X121.212 Y117.712 E.01462
M106 S229.5
G1 X134.696 Y117.71 E.32862
G3 X135.475 Y117.719 I.301 J7.89 E.019
M106 S226.95
M106 S229.5
G3 X136.063 Y117.881 I-.423 J2.68 E.01489
M106 S226.95
G3 X136.626 Y118.298 I-1.119 J2.099 E.01714
M106 S229.5
G1 X136.738 Y118.434 E.00428
M106 S226.95
G1 X136.837 Y118.582 E.00434
M106 S229.5
G3 X137.09 Y119.505 I-1.808 J.993 E.02355
G1 X137.09 Y135.895 E.39944
G3 X137.071 Y136.76 I-5.585 J.309 E.02111
M106 S226.95
G1 X137.036 Y136.936 E.00438
M106 S229.5
G3 X136.626 Y137.702 I-2.043 J-.601 E.02131
M106 S226.95
G1 X136.5 Y137.828 E.00435
M106 S229.5
G3 X136.368 Y137.936 I-1.164 J-1.285 E.00415
M106 S226.95
G1 X136.22 Y138.035 E.00434
M106 S229.5
G1 X136.065 Y138.118 E.00428
M106 S226.95
G3 X135.732 Y138.237 I-.771 J-1.631 E.00863
M106 S229.5
G3 X134.695 Y138.29 I-.75 J-4.498 E.02538
G1 X121.21 Y138.288 E.32865
M106 S226.95
G1 X120.61 Y138.288 E.01462
M106 S229.5
G3 X120.097 Y138.185 I.213 J-2.397 E.01277
M106 S226.95
G1 X119.932 Y138.117 E.00435
M106 S229.5
G3 X119.782 Y138.037 I.745 J-1.575 E.00415
M106 S226.95
G1 X119.634 Y137.938 E.00434
M106 S229.5
G1 X119.498 Y137.826 E.00428
M106 S226.95
G1 X119.372 Y137.7 E.00435
M106 S229.5
G3 X119.083 Y137.268 I2.62 J-2.063 E.01269
M106 S226.95
G3 X118.964 Y136.935 I1.632 J-.772 E.00862
M106 S229.5
G1 X118.929 Y136.761 E.00431
M106 S226.95
G1 X118.912 Y136.585 E.00431
M106 S229.5
G3 X118.91 Y135.897 I14.005 J-.388 E.01677
G1 X118.91 Y120.105 E.38488
G3 X118.928 Y119.326 I4.554 J-.287 E.01903
G1 X118.935 Y119.258 E.00166
M106 S226.95
; WIPE_START
M204 S6000
G1 X118.963 Y119.068 E-.07309
G1 X119.015 Y118.897 E-.06772
G1 X119.083 Y118.732 E-.06779
M73 P49 R8
G1 X119.163 Y118.582 E-.06478
G1 X119.262 Y118.434 E-.06766
G1 X119.374 Y118.298 E-.06676
G1 X119.636 Y118.061 E-.13432
G1 X119.856 Y117.922 E-.09908
G1 X120.095 Y117.816 E-.09911
G1 X120.145 Y117.803 E-.01969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.56
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
            G0 Z1.56 F4000
            G39.3 S1
            G0 Z1.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X136.107 Y119.964 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421246
G1 F6657
M204 S6000
G1 X135.016 Y118.873 E.03772
G1 X134.468 Y118.873 E.01338
G1 X135.933 Y120.337 E.05065
G1 X135.933 Y120.884 E.01338
G1 X133.921 Y118.872 E.06957
G1 X133.374 Y118.872 E.01338
G1 X135.933 Y121.432 E.0885
G1 X135.933 Y121.979 E.01338
G1 X132.827 Y118.872 E.10742
G1 X132.279 Y118.872 E.01338
G1 X135.933 Y122.526 E.12635
G1 X135.933 Y123.073 E.01338
G1 X131.732 Y118.872 E.14527
G1 X131.185 Y118.872 E.01338
G1 X135.933 Y123.62 E.16419
G1 X135.933 Y124.167 E.01338
G1 X130.637 Y118.872 E.18312
G1 X130.09 Y118.872 E.01338
G1 X135.933 Y124.715 E.20204
G1 X135.933 Y125.262 E.01338
G1 X129.543 Y118.871 E.22097
G1 X128.995 Y118.871 E.01338
G1 X135.933 Y125.809 E.23989
G1 X135.933 Y126.356 E.01338
G1 X128.448 Y118.871 E.25882
G1 X127.901 Y118.871 E.01338
G1 X135.933 Y126.903 E.27774
G1 X135.933 Y127.451 E.01338
G1 X127.354 Y118.871 E.29667
G1 X126.806 Y118.871 E.01338
G1 X135.933 Y127.998 E.31559
G1 X135.933 Y128.545 E.01338
G1 X126.259 Y118.871 E.33452
G1 X125.712 Y118.87 E.01338
G1 X135.933 Y129.092 E.35344
G1 X135.933 Y129.639 E.01338
G1 X125.164 Y118.87 E.37237
G1 X124.617 Y118.87 E.01338
G1 X135.933 Y130.186 E.39129
G1 X135.933 Y130.734 E.01338
G1 X124.07 Y118.87 E.41022
G1 X123.522 Y118.87 E.01338
G1 X135.933 Y131.281 E.42914
G1 X135.933 Y131.828 E.01338
G1 X122.975 Y118.87 E.44807
G1 X122.428 Y118.87 E.01338
G1 X135.933 Y132.375 E.46699
G1 X135.933 Y132.922 E.01338
G1 X121.88 Y118.87 E.48592
G1 X121.333 Y118.869 E.01338
G1 X135.933 Y133.469 E.50484
G1 X135.933 Y134.017 E.01338
G1 X120.786 Y118.869 E.52377
G2 X120.351 Y118.982 I-.054 J.687 E.01118
G1 X135.933 Y134.564 E.5388
G1 X135.933 Y135.111 E.01338
G1 X120.109 Y119.287 E.54716
G2 X120.067 Y119.792 I1.802 J.406 E.01242
G1 X135.933 Y135.658 E.54863
G1 X135.933 Y136.205 E.01338
G1 X120.067 Y120.339 E.54863
G1 X120.067 Y120.886 E.01338
G1 X135.891 Y136.711 E.54718
G3 X135.651 Y137.018 I-.748 J-.338 E.00962
G1 X120.067 Y121.433 E.53888
G1 X120.067 Y121.981 E.01338
G1 X135.219 Y137.133 E.52395
G1 X134.672 Y137.133 E.01338
G1 X120.067 Y122.528 E.50503
G1 X120.067 Y123.075 E.01338
G1 X134.125 Y137.133 E.4861
G1 X133.578 Y137.133 E.01338
G1 X120.067 Y123.622 E.46718
G1 X120.067 Y124.169 E.01338
G1 X133.03 Y137.133 E.44826
G1 X132.483 Y137.133 E.01338
G1 X120.067 Y124.716 E.42933
G1 X120.067 Y125.264 E.01338
G1 X131.936 Y137.133 E.41041
G1 X131.389 Y137.133 E.01338
G1 X120.067 Y125.811 E.39149
G1 X120.067 Y126.358 E.01338
G1 X130.841 Y137.132 E.37256
G1 X130.294 Y137.132 E.01338
G1 X120.067 Y126.905 E.35364
G1 X120.067 Y127.452 E.01338
G1 X129.747 Y137.132 E.33472
G1 X129.2 Y137.132 E.01338
G1 X120.067 Y127.999 E.31579
G1 X120.067 Y128.547 E.01338
G1 X128.652 Y137.132 E.29687
G1 X128.105 Y137.132 E.01338
G1 X120.067 Y129.094 E.27795
G1 X120.067 Y129.641 E.01338
G1 X127.558 Y137.132 E.25902
G1 X127.011 Y137.132 E.01338
G1 X120.067 Y130.188 E.2401
G1 X120.067 Y130.735 E.01338
G1 X126.463 Y137.132 E.22118
G1 X125.916 Y137.132 E.01338
G1 X120.067 Y131.282 E.20225
G1 X120.067 Y131.83 E.01338
G1 X125.369 Y137.131 E.18333
G1 X124.821 Y137.131 E.01338
G1 X120.067 Y132.377 E.16441
G1 X120.067 Y132.924 E.01338
G1 X124.274 Y137.131 E.14548
G1 X123.727 Y137.131 E.01338
G1 X120.067 Y133.471 E.12656
G1 X120.067 Y134.018 E.01338
G1 X123.18 Y137.131 E.10764
G1 X122.632 Y137.131 E.01338
G1 X120.067 Y134.565 E.08871
G1 X120.067 Y135.113 E.01338
G1 X122.085 Y137.131 E.06979
G1 X121.538 Y137.131 E.01338
G1 X120.067 Y135.66 E.05086
G1 X120.067 Y136.207 E.01338
G1 X120.991 Y137.131 E.03194
G3 X120.49 Y137.092 I-.158 J-1.224 E.01237
G3 X120.227 Y136.914 I.203 J-.583 E.00786
M73 P50 R8
G1 X119.908 Y136.595 E.01103
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7753.742
G1 X120.227 Y136.914 E-.17138
G1 X120.321 Y137.002 E-.04885
G1 X120.49 Y137.092 E-.07292
G1 X120.675 Y137.131 E-.07188
G1 X120.991 Y137.131 E-.11991
G1 X120.479 Y136.619 E-.27507
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/42
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S102
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I1.005 J.686 P1  F42000
G1 X126.728 Y127.471 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.921 Y127.3 E.00678
G3 X127.953 Y126.953 I1.078 J1.5 E.02903
G1 X128.048 Y126.954 E.00249
G3 X126.645 Y127.543 I-.049 J1.846 E.26361
G1 X126.683 Y127.511 E.00131
M204 S10000
G1 X126.454 Y127.162 F42000
G1 F5400
M204 S6000
G1 X126.678 Y126.962 E.00789
G3 X127.943 Y126.538 I1.32 J1.837 E.03557
G1 X128.059 Y126.538 E.00305
G3 X126.341 Y127.26 I-.06 J2.262 E.32296
G1 X126.408 Y127.201 E.00237
; WIPE_START
G1 X126.678 Y126.962 E-.13695
G1 X127.069 Y126.737 E-.17137
G1 X127.496 Y126.594 E-.1712
G1 X127.943 Y126.538 E-.17108
G1 X128.059 Y126.538 E-.04409
G1 X128.23 Y126.559 E-.06532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.231 Y121.84 Z1.72 F42000
G1 X118.935 Y119.247 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X118.945 Y119.152 E.00232
G3 X120.612 Y117.712 I1.761 J.354 E.05779
G1 X135.476 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06416
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.009 E.0686
G1 X120.61 Y138.288 E.3579
G3 X118.91 Y136.497 I.103 J-1.8 E.06627
G1 X118.91 Y119.505 E.41412
G1 X118.929 Y119.306 E.00487
; WIPE_START
M204 S6000
G1 X118.945 Y119.152 E-.0589
G1 X119.016 Y118.895 E-.1014
G1 X119.163 Y118.582 E-.13145
G1 X119.374 Y118.298 E-.13426
G1 X119.498 Y118.174 E-.06685
G1 X119.704 Y118.013 E-.09906
G1 X120.017 Y117.845 E-.13523
G1 X120.1 Y117.82 E-.03284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.72
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
            G0 Z1.72 F4000
            G39.3 S1
            G0 Z1.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X128.056 Y128.561 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.491037
G1 F6568.857
M204 S6000
G1 X127.828 Y128.626 E.00686
G1 X127.754 Y128.788 E.00514
G1 X127.82 Y128.967 E.00551
G1 X127.944 Y129.04 E.00416
G1 X128.172 Y128.974 E.00684
G1 X128.246 Y128.812 E.00514
G1 X128.18 Y128.633 E.00552
G1 X128.108 Y128.591 E.00241
M204 S10000
G1 X127.928 Y128.154 F42000
; LINE_WIDTH: 0.419996
G1 F7778.873
M204 S6000
G1 X127.665 Y128.22 E.00659
G1 X127.466 Y128.396 E.00647
G1 X127.351 Y128.635 E.00647
G1 X127.338 Y128.9 E.00646
G1 X127.429 Y129.149 E.00646
G1 X127.609 Y129.343 E.00648
G1 X127.892 Y129.458 E.00743
G1 X128.246 Y129.42 E.00867
G1 X128.492 Y129.249 E.00731
G1 X128.627 Y129.025 E.00636
G1 X128.665 Y128.765 E.0064
G1 X128.599 Y128.509 E.00646
G1 X128.436 Y128.297 E.00652
G1 X128.187 Y128.16 E.00691
G1 X127.988 Y128.156 E.00487
M204 S10000
G1 X128.048 Y127.746 F42000
G1 F7778.873
M204 S6000
G1 X127.544 Y127.852 E.01255
G1 X127.301 Y128.007 E.00704
G1 X127.048 Y128.342 E.01022
G1 X126.944 Y128.747 E.0102
G1 X127.007 Y129.162 E.01021
G1 X127.225 Y129.519 E.0102
G1 X127.565 Y129.763 E.01022
G1 X127.954 Y129.854 E.00973
G1 X128.456 Y129.748 E.0125
G1 X128.699 Y129.593 E.00704
G1 X128.952 Y129.259 E.01021
G1 X129.056 Y128.853 E.01021
G2 X128.993 Y128.438 I-1.571 J.025 E.01025
G1 X128.775 Y128.081 E.0102
G1 X128.435 Y127.837 E.01021
G1 X128.106 Y127.76 E.00823
M204 S10000
G1 X128.043 Y127.357 F42000
G1 F7778.873
M204 S6000
G1 X127.533 Y127.434 E.01256
G1 X127.152 Y127.639 E.01055
G1 X126.849 Y127.928 E.01021
G1 X126.648 Y128.311 E.01054
G1 X126.557 Y128.728 E.0104
G1 X126.608 Y129.157 E.01052
G1 X126.767 Y129.553 E.0104
G1 X127.053 Y129.881 E.01062
G1 X127.406 Y130.117 E.01033
G1 X127.796 Y130.223 E.00985
G2 X128.467 Y130.166 I.109 J-2.711 E.01644
G1 X128.848 Y129.961 E.01055
G1 X129.152 Y129.672 E.01022
G1 X129.352 Y129.289 E.01053
G1 X129.443 Y128.872 E.0104
G2 X129.357 Y128.306 I-2.151 J.035 E.014
G1 X129.144 Y127.929 E.01055
G1 X128.843 Y127.627 E.01039
G1 X128.433 Y127.429 E.0111
G1 X128.102 Y127.368 E.00821
; WIPE_START
G1 X128.433 Y127.429 E-.12804
G1 X128.843 Y127.627 E-.173
G1 X129.144 Y127.929 E-.16193
G1 X129.357 Y128.306 E-.16451
G1 X129.421 Y128.649 E-.13251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.667 Y134.991 Z1.72 F42000
G1 X135.7 Y138.026 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X136.826 Y136.9 E.03881
G1 X136.878 Y136.302
G1 X135.102 Y138.078 E.0612
G1 X134.557 Y138.078
G1 X136.878 Y135.757 E.07999
G1 X136.878 Y135.211
G1 X134.012 Y138.078 E.09879
G1 X133.466 Y138.078
G1 X136.878 Y134.666 E.11758
G1 X136.878 Y134.121
G1 X132.921 Y138.078 E.13638
G1 X132.376 Y138.077
G1 X136.878 Y133.575 E.15517
G1 X136.878 Y133.03
G1 X131.83 Y138.077 E.17397
G1 X131.285 Y138.077
G1 X136.878 Y132.484 E.19277
G1 X136.878 Y131.939
G1 X130.74 Y138.077 E.21156
G1 X130.194 Y138.077
G1 X136.878 Y131.394 E.23036
G1 X136.878 Y130.848
G1 X129.649 Y138.077 E.24915
G1 X129.104 Y138.077
G1 X136.878 Y130.303 E.26795
G1 X136.878 Y129.757
G1 X128.559 Y138.077 E.28674
G1 X128.013 Y138.077
G1 X136.878 Y129.212 E.30554
G1 X136.878 Y128.667
G1 X127.468 Y138.077 E.32433
G1 X126.923 Y138.077
G1 X136.878 Y128.121 E.34313
G1 X136.878 Y127.576
G1 X126.377 Y138.076 E.36192
G1 X125.832 Y138.076
G1 X136.878 Y127.03 E.38072
G1 X136.878 Y126.485
G1 X125.287 Y138.076 E.39951
G1 X124.741 Y138.076
G1 X136.878 Y125.94 E.41831
G1 X136.878 Y125.394
G1 X124.196 Y138.076 E.4371
G1 X123.651 Y138.076
G1 X136.878 Y124.849 E.4559
G1 X136.878 Y124.303
G1 X123.105 Y138.076 E.4747
G1 X122.56 Y138.076
G1 X136.878 Y123.758 E.49349
G1 X136.878 Y123.213
G1 X130.271 Y129.819 E.22771
G1 X130.475 Y129.07
G1 X136.878 Y122.667 E.22068
G1 X136.878 Y122.122
G1 X130.475 Y128.525 E.2207
G1 X130.382 Y128.073
G1 X136.878 Y121.576 E.22391
G1 X136.878 Y121.031
G1 X130.225 Y127.684 E.2293
G1 X130.019 Y127.344
G1 X136.878 Y120.486 E.23639
G1 X136.878 Y119.94
G1 X129.769 Y127.049 E.24501
G1 X129.477 Y126.796
G1 X136.872 Y119.4 E.2549
M73 P51 R8
G1 X136.777 Y118.951
G1 X129.141 Y126.587 E.26319
G1 X128.754 Y126.427
G1 X136.589 Y118.593 E.27003
G1 X136.33 Y118.307
G1 X128.308 Y126.329 E.27649
G1 X127.77 Y126.321
G1 X136.002 Y118.089 E.28373
G1 X135.595 Y117.951
G1 X127.044 Y126.501 E.2947
; WIPE_START
M204 S6000
G1 X128.459 Y125.087 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X129.018 Y131.073 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
M204 S2000
G1 X122.015 Y138.076 E.24138
G1 X121.469 Y138.076
G1 X128.27 Y131.275 E.2344
G1 X127.725 Y131.274
G1 X120.924 Y138.076 E.23441
G1 X120.405 Y138.049
G1 X127.273 Y131.181 E.23672
G1 X126.883 Y131.025
G1 X119.998 Y137.911 E.23732
G1 X119.67 Y137.693
G1 X126.544 Y130.82 E.2369
G1 X126.248 Y130.57
G1 X119.411 Y137.407 E.23566
G1 X119.223 Y137.05
G1 X125.996 Y130.277 E.23345
G1 X125.787 Y129.94
G1 X119.127 Y136.6 E.22956
G1 X119.122 Y136.06
G1 X125.627 Y129.555 E.22421
G1 X125.529 Y129.107
G1 X119.122 Y135.514 E.22084
G1 X119.122 Y134.969
G1 X125.521 Y128.57 E.22054
G1 X125.7 Y127.845
G1 X119.122 Y134.424 E.22673
G1 X119.122 Y133.878
G1 X135.078 Y117.922 E.54995
G1 X134.532 Y117.922
G1 X119.122 Y133.333 E.53115
M73 P52 R8
G1 X119.122 Y132.787
G1 X133.987 Y117.922 E.51235
G1 X133.441 Y117.922
G1 X119.122 Y132.242 E.49354
G1 X119.122 Y131.696
G1 X132.896 Y117.923 E.47474
G1 X132.35 Y117.923
G1 X119.122 Y131.151 E.45594
G1 X119.122 Y130.606
G1 X131.805 Y117.923 E.43714
G1 X131.26 Y117.923
G1 X119.122 Y130.06 E.41834
G1 X119.122 Y129.515
G1 X130.714 Y117.923 E.39954
G1 X130.169 Y117.923
G1 X119.122 Y128.969 E.38074
G1 X119.122 Y128.424
G1 X129.623 Y117.923 E.36193
G1 X129.078 Y117.923
G1 X119.122 Y127.879 E.34313
G1 X119.122 Y127.333
G1 X128.532 Y117.923 E.32433
G1 X127.987 Y117.923
G1 X119.122 Y126.788 E.30553
G1 X119.122 Y126.242
G1 X127.441 Y117.923 E.28673
G1 X126.896 Y117.924
G1 X119.122 Y125.697 E.26793
G1 X119.122 Y125.152
G1 X126.35 Y117.924 E.24913
G1 X125.805 Y117.924
G1 X119.122 Y124.606 E.23032
G1 X119.122 Y124.061
G1 X125.259 Y117.924 E.21152
G1 X124.714 Y117.924
G1 X119.122 Y123.515 E.19272
G1 X119.122 Y122.97
G1 X124.168 Y117.924 E.17392
G1 X123.623 Y117.924
G1 X119.122 Y122.425 E.15512
G1 X119.122 Y121.879
G1 X123.077 Y117.924 E.13632
G1 X122.532 Y117.924
G1 X119.122 Y121.334 E.11752
G1 X119.122 Y120.788
G1 X121.986 Y117.924 E.09872
G1 X121.441 Y117.924
G1 X119.122 Y120.243 E.07991
M73 P53 R8
G1 X119.122 Y119.698
G1 X120.895 Y117.924 E.06111
G1 X120.299 Y117.975
G1 X119.175 Y119.099 E.03873
; WIPE_START
M204 S6000
G1 X120.299 Y117.975 E-.60395
G1 X120.708 Y117.94 E-.15605
; WIPE_END
G1 E-.04
M204 S10000
G1 X120.584 Y125.572 Z1.72 F42000
G1 X120.38 Y138.047 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0915229
G1 F15000
M204 S6000
G1 X120.222 Y137.96 E.00065
; WIPE_START
G1 X120.38 Y138.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.131 Y132.074 Z1.72 F42000
G1 X136.163 Y118.201 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.0899832
G1 F15000
M204 S6000
G2 X136.059 Y118.118 I-1.165 J1.358 E.00047
; WIPE_START
G1 X136.163 Y118.201 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.764 Y118.911 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.0969106
G1 F15000
M204 S6000
G1 X136.673 Y118.782 E.00063
; WIPE_START
G1 X136.764 Y118.911 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.906 Y125.496 Z1.72 F42000
G1 X130.335 Y129.883 Z1.72
M73 P53 R7
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.198875
G1 F15000
M204 S6000
G1 X130.236 Y130.02 E.00176
; LINE_WIDTH: 0.169689
G1 X130.158 Y130.121 E.00109
; LINE_WIDTH: 0.12808
G1 X129.998 Y130.315 E.00149
; LINE_WIDTH: 0.0928701
G1 X129.742 Y130.587 E.00138
G1 X129.465 Y130.84 E.00139
; LINE_WIDTH: 0.127682
G1 X129.368 Y130.92 E.00075
; LINE_WIDTH: 0.154639
G1 X129.268 Y130.999 E.00097
; LINE_WIDTH: 0.197328
G1 X129.081 Y131.136 E.00238
; WIPE_START
G1 X129.268 Y130.999 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.296 Y127.885 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.0971944
G1 F15000
M204 S6000
G1 X130.309 Y127.82 E.00026
G1 X130.251 Y127.736 E.00041
; WIPE_START
G1 X130.309 Y127.82 E-.45983
G1 X130.296 Y127.885 E-.30017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.721 Y126.419 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.0920323
G1 F15000
M204 S6000
G1 X128.576 Y126.333 E.00061
M204 S10000
G1 X127.699 Y126.25 F42000
; LINE_WIDTH: 0.126936
G1 F15000
M204 S6000
G1 X127.471 Y126.369 E.0015
M204 S10000
G1 X127.785 Y126.336 F42000
; LINE_WIDTH: 0.12568
G1 F15000
M204 S6000
G1 X127.559 Y126.259 E.00138
M204 S10000
G1 X126.98 Y126.437 F42000
; LINE_WIDTH: 0.193935
G1 F15000
M204 S6000
G1 X126.838 Y126.537 E.00176
; LINE_WIDTH: 0.161131
G1 X126.736 Y126.614 E.00102
; LINE_WIDTH: 0.128155
G1 X126.637 Y126.692 E.00075
; LINE_WIDTH: 0.0947417
G1 X126.472 Y126.832 E.00083
M204 S10000
G1 X126.028 Y127.276 F42000
; LINE_WIDTH: 0.101873
G1 F15000
M204 S6000
G1 X125.851 Y127.488 E.00118
; LINE_WIDTH: 0.144517
G1 X125.774 Y127.589 E.00089
; LINE_WIDTH: 0.191909
G1 X125.637 Y127.782 E.00235
; WIPE_START
G1 X125.774 Y127.589 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.453 Y129.03 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.111918
G1 F15000
M204 S6000
G1 X125.528 Y128.836 E.00102
M204 S10000
G1 X125.531 Y129.086 F42000
; LINE_WIDTH: 0.0909856
G1 F15000
M204 S6000
G1 X125.449 Y128.915 E.00068
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F15000
G1 X125.531 Y129.086 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/42
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S226.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I1.045 J-.624 P1  F42000
G1 X119.734 Y119.383 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
M204 S5000
G1 X119.81 Y119.185 E.00517
G3 X120.725 Y118.502 I1.109 J.533 E.02892
G1 X120.892 Y118.49 E.00409
G1 X135.109 Y118.49 E.34647
G3 X136.31 Y119.695 I-.022 J1.224 E.04585
G1 X136.31 Y136.305 E.40482
G3 X135.108 Y137.51 I-1.232 J-.027 E.0458
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.305 I.026 J-1.232 E.04586
G1 X119.691 Y119.641 E.40614
G3 X119.72 Y119.441 I1.228 J.077 E.00492
; WIPE_START
G1 F3000
M204 S6000
G1 X119.81 Y119.185 E-.10331
G1 X120.003 Y118.887 E-.13478
G1 X120.179 Y118.728 E-.09015
G1 X120.383 Y118.606 E-.09011
G1 X120.725 Y118.502 E-.136
G1 X120.892 Y118.49 E-.06378
G1 X121.266 Y118.49 E-.14187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.516 Y126.086 Z1.88 F42000
G1 X119.37 Y137.698 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F1929
M204 S5000
G1 X119.169 Y137.418 E.00841
G3 X118.91 Y136.495 I1.544 J-.93 E.02366
G1 X118.91 Y119.505 E.41407
G3 X120.612 Y117.712 I1.813 J.017 E.06629
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06416
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.01 E.06859
G1 X120.616 Y138.288 E.35774
G3 X119.413 Y137.737 I.097 J-1.8 E.03303
; WIPE_START
G1 F3000
M204 S6000
G1 X119.169 Y137.418 E-.15254
G1 X119.014 Y137.101 E-.13421
G1 X118.929 Y136.762 E-.13248
G1 X118.91 Y136.495 E-.10199
G1 X118.91 Y135.866 E-.23878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.88
M73 P54 R7
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
            G0 Z1.88 F4000
            G39.3 S1
            G0 Z1.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.866 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414581
G1 F1929
M204 S6000
G1 X119.301 Y119.631 E.39013
G3 X119.329 Y119.317 I2.184 J.041 E.00758
; LINE_WIDTH: 0.481281
G3 X120.343 Y118.174 I1.469 J.282 E.04529
G1 X120.363 Y118.168 E.00059
; LINE_WIDTH: 0.41363
G3 X120.871 Y118.101 I.476 J1.666 E.01233
G1 X135.116 Y118.1 E.34143
G3 X135.483 Y118.13 I.017 J2.051 E.00883
G1 X135.503 Y118.134 E.00048
; LINE_WIDTH: 0.482207
G3 X136.612 Y119.1 I-.293 J1.457 E.04354
G1 X136.625 Y119.138 E.00114
; LINE_WIDTH: 0.414756
G3 X136.679 Y119.364 I-1.956 J.586 E.0056
G1 X136.7 Y119.69 E.00785
G1 X136.7 Y136.31 E.39955
G3 X136.682 Y136.61 I-2.278 J.013 E.00722
G1 X136.665 Y136.703 E.00227
; LINE_WIDTH: 0.479976
G3 X135.658 Y137.826 I-1.462 J-.297 E.04458
G1 X135.503 Y137.867 E.00451
; LINE_WIDTH: 0.41358
G3 X135.129 Y137.9 I-.374 J-2.11 E.00901
G1 X120.89 Y137.899 E.34124
G3 X120.59 Y137.883 I-.005 J-2.682 E.00721
G1 X120.431 Y137.851 E.00388
; LINE_WIDTH: 0.483822
G3 X119.39 Y136.905 I.364 J-1.446 E.04161
G1 X119.375 Y136.862 E.00128
; LINE_WIDTH: 0.436893
G3 X119.322 Y136.64 I1.926 J-.579 E.00581
G1 X119.3 Y136.31 E.00842
; LINE_WIDTH: 0.414581
G1 X119.3 Y135.926 E.00922
; WIPE_START
G1 F7889.652
G1 X119.3 Y133.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.636 Y131.818 Z1.88 F42000
G1 X129.164 Y131.091 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
M204 S6000
G1 X129.058 Y131.144 E.00312
G3 X127.936 Y126.227 I-1.059 J-2.345 E.23936
G1 X128.067 Y126.228 E.00344
G3 X129.286 Y131.027 I-.068 J2.572 E.17512
G1 X129.217 Y131.063 E.00203
M204 S10000
G1 X129.354 Y131.461 F42000
G1 F1929
M204 S6000
G1 X129.229 Y131.523 E.00367
G3 X127.925 Y125.812 I-1.23 J-2.724 E.27802
G1 X128.077 Y125.812 E.00399
G3 X129.494 Y131.387 I-.079 J2.988 E.20343
G1 X129.407 Y131.433 E.00257
M204 S250
G1 X129.536 Y131.817 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
M204 S5000
G1 X129.393 Y131.888 E.00389
G3 X127.915 Y125.411 I-1.395 J-3.089 E.29253
G1 X128.088 Y125.411 E.0042
G3 X129.694 Y131.734 I-.089 J3.388 E.21406
G1 X129.589 Y131.789 E.00288
; WIPE_START
G1 F3000
M204 S6000
G1 X129.393 Y131.888 E-.08348
G1 X129.08 Y132.013 E-.12835
G1 X128.754 Y132.105 E-.12835
G1 X128.422 Y132.164 E-.12843
G1 X127.916 Y132.189 E-.19255
G1 X127.656 Y132.169 E-.09883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.994 Y128.591 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452663
G1 F1929
M204 S6000
G1 X127.841 Y128.652 E.00437
G1 X127.783 Y128.811 E.00446
G1 X127.856 Y128.963 E.00446
G1 X128.018 Y129.009 E.00446
G1 X128.159 Y128.946 E.00408
G1 X128.216 Y128.789 E.00441
G1 X128.141 Y128.636 E.00449
G1 X128.051 Y128.608 E.00248
M204 S10000
G1 X128.041 Y128.182 F42000
; LINE_WIDTH: 0.419996
G1 F1929
M204 S6000
G1 X127.744 Y128.234 E.00733
G1 X127.506 Y128.428 E.00749
G1 X127.386 Y128.707 E.00741
G1 X127.42 Y129.013 E.00749
G1 X127.589 Y129.266 E.00742
G1 X127.848 Y129.399 E.00711
G1 X128.152 Y129.399 E.00739
G1 X128.411 Y129.266 E.00711
G1 X128.581 Y129.011 E.00747
G1 X128.617 Y128.769 E.00596
G1 X128.53 Y128.476 E.00744
G1 X128.312 Y128.266 E.00739
G1 X128.098 Y128.2 E.00545
M204 S10000
G1 X128.046 Y127.794 F42000
G1 F1929
M204 S6000
G1 X127.666 Y127.853 E.00936
G1 X127.411 Y127.981 E.00694
G1 X127.139 Y128.274 E.00975
G1 X127.003 Y128.65 E.00974
G1 X127.022 Y129.049 E.00974
G1 X127.196 Y129.409 E.00975
G1 X127.496 Y129.674 E.00975
G1 X127.857 Y129.797 E.00931
G1 X128.321 Y129.756 E.01134
G1 X128.668 Y129.556 E.00976
M73 P55 R7
G1 X128.909 Y129.238 E.00974
G1 X129.007 Y128.85 E.00974
G2 X128.739 Y128.114 I-1.166 J.008 E.01948
G1 X128.415 Y127.88 E.00974
G1 X128.104 Y127.808 E.00777
M204 S10000
G1 X128.051 Y127.406 F42000
G1 F1929
M204 S6000
G1 X127.543 Y127.488 E.01253
G1 X127.185 Y127.666 E.00975
G1 X126.891 Y127.963 E.01017
G1 X126.688 Y128.322 E.01007
G1 X126.612 Y128.732 E.01014
G1 X126.647 Y129.144 E.01009
G1 X126.815 Y129.526 E.01017
G1 X127.076 Y129.847 E.01007
G1 X127.442 Y130.073 E.01048
G1 X127.814 Y130.183 E.00945
G1 X128.324 Y130.151 E.01244
G1 X128.698 Y130.009 E.00976
G1 X129.02 Y129.744 E.01017
G1 X129.258 Y129.406 E.01008
G1 X129.374 Y129.006 E.01013
G1 X129.388 Y128.73 E.00674
G1 X129.312 Y128.322 E.01011
G1 X129.106 Y127.959 E.01017
G1 X128.815 Y127.666 E.01007
G1 X128.427 Y127.478 E.01051
G1 X128.11 Y127.417 E.00787
M204 S10000
G1 X128.056 Y127.018 F42000
G1 F1929
M204 S6000
G1 X127.595 Y127.063 E.01129
G1 X127.125 Y127.255 E.01238
G1 X126.692 Y127.587 E.01329
G1 X126.401 Y128.028 E.01289
G1 X126.236 Y128.534 E.01296
G1 X126.245 Y129.064 E.01291
G1 X126.393 Y129.574 E.01295
G1 X126.698 Y130.006 E.01288
G1 X127.108 Y130.345 E.01298
G1 X127.591 Y130.527 E.01258
G1 X128.048 Y130.568 E.01119
G1 X128.409 Y130.527 E.00885
G1 X128.892 Y130.345 E.01257
G1 X129.299 Y130.009 E.01287
G1 X129.607 Y129.574 E.01299
G1 X129.755 Y129.066 E.0129
G1 X129.773 Y128.711 E.00865
G1 X129.676 Y128.19 E.01292
G1 X129.416 Y127.729 E.0129
G1 X129.041 Y127.352 E.01296
G1 X128.57 Y127.119 E.0128
G1 X128.115 Y127.029 E.01131
M204 S10000
G1 X128.062 Y126.63 F42000
G1 F1929
M204 S6000
G1 X127.514 Y126.684 E.01341
G2 X127.727 Y130.954 I.486 J2.116 E.14764
G1 X128.275 Y130.954 E.01334
G2 X128.285 Y126.658 I-.28 J-2.149 E.15197
G1 X128.121 Y126.637 E.00403
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7778.873
G1 X128.285 Y126.658 E-.06281
G1 X128.673 Y126.747 E-.15117
G1 X129.075 Y126.926 E-.16747
G1 X129.428 Y127.178 E-.16459
G1 X129.721 Y127.494 E-.16378
G1 X129.79 Y127.606 E-.05019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/42
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I.773 J-.94 P1  F42000
G1 X119.75 Y119.345 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1937
M204 S5000
G1 X119.761 Y119.293 E.00131
G3 X120.782 Y118.496 I1.141 J.409 E.0333
G1 X135.11 Y118.49 E.34921
G3 X136.31 Y119.695 I-.013 J1.213 E.04592
G1 X136.31 Y136.308 E.40489
G3 X135.105 Y137.51 I-1.225 J-.023 E.04586
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.008 J-1.213 E.04604
G1 X119.691 Y119.641 E.40615
G1 X119.738 Y119.404 E.00588
; WIPE_START
G1 F3000
M204 S6000
G1 X119.761 Y119.293 E-.04321
G1 X119.862 Y119.078 E-.0902
G1 X120.002 Y118.889 E-.08922
G1 X120.132 Y118.764 E-.06867
G1 X120.329 Y118.633 E-.09004
G1 X120.549 Y118.542 E-.0902
G1 X120.782 Y118.496 E-.09023
G1 X121.303 Y118.495 E-.19823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.539 Y126.089 Z2.04 F42000
G1 X119.371 Y137.698 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F1937
M204 S5000
G1 X119.17 Y137.42 E.00836
G3 X118.91 Y136.495 I1.543 J-.933 E.02372
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.803 J.009 E.06633
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06416
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.009 E.0686
G1 X120.612 Y138.288 E.35784
G3 X119.414 Y137.738 I.101 J-1.8 E.0329
; WIPE_START
G1 F3000
M204 S6000
G1 X119.17 Y137.42 E-.1521
G1 X119.015 Y137.103 E-.13418
G1 X118.945 Y136.852 E-.09908
G1 X118.91 Y136.495 E-.13637
G1 X118.91 Y135.868 E-.23829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.04
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
            G0 Z2.04 F4000
            G39.3 S1
            G0 Z2.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.868 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1937
M204 S6000
G1 X119.301 Y119.631 E.3902
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.480986
G3 X120.42 Y118.152 I1.462 J.298 E.04696
; LINE_WIDTH: 0.413596
G3 X120.734 Y118.105 I.399 J1.617 E.00762
G1 X135.118 Y118.1 E.34474
G3 X135.483 Y118.13 I.018 J2.03 E.0088
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483634
G3 X136.623 Y119.133 I-.362 J1.444 E.04274
; LINE_WIDTH: 0.414766
G3 X136.688 Y119.447 I-1.54 J.484 E.00771
G1 X136.7 Y136.315 E.40554
G1 X136.667 Y136.703 E.00936
; LINE_WIDTH: 0.481888
G3 X135.653 Y137.828 I-1.465 J-.301 E.04492
G1 X135.627 Y137.836 E.00074
; LINE_WIDTH: 0.413656
G3 X135.443 Y137.878 I-.662 J-2.492 E.00453
G1 X135.11 Y137.9 E.00801
G1 X120.89 Y137.899 E.34086
G3 X120.59 Y137.882 I-.01 J-2.513 E.0072
G1 X120.497 Y137.866 E.00226
; LINE_WIDTH: 0.482518
G3 X119.377 Y136.867 I.297 J-1.462 E.04454
; LINE_WIDTH: 0.436891
G3 X119.312 Y136.553 I1.496 J-.475 E.00817
G1 X119.3 Y136.31 E.00619
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.928 E.0092
; WIPE_START
G1 F7888.833
G1 X119.3 Y133.928 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.635 Y131.818 Z2.04 F42000
G1 X129.173 Y131.088 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1937
M204 S6000
G3 X127.935 Y126.227 I-1.176 J-2.289 E.24276
G1 X128.071 Y126.228 E.00358
G3 X129.226 Y131.06 I-.074 J2.572 E.17673
M204 S10000
G1 X129.363 Y131.458 F42000
G1 F1937
M204 S6000
G3 X127.925 Y125.812 I-1.366 J-2.658 E.282
G1 X128.082 Y125.812 E.00413
G3 X129.416 Y131.43 I-.085 J2.987 E.20555
M204 S250
G1 X129.529 Y131.825 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1937
M204 S5000
G1 X129.238 Y131.953 E.00775
G3 X127.915 Y125.411 I-1.241 J-3.154 E.28851
G1 X128.093 Y125.412 E.00432
G3 X129.581 Y131.796 I-.096 J3.388 E.21698
; WIPE_START
G1 F3000
M204 S6000
G1 X129.238 Y131.953 E-.14357
G1 X128.918 Y132.063 E-.12844
G1 X128.589 Y132.138 E-.12836
G1 X128.253 Y132.18 E-.12846
G1 X127.916 Y132.189 E-.12839
G1 X127.646 Y132.169 E-.10279
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P56 R7
G1 X127.844 Y126.652 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1937
M204 S6000
G1 X127.514 Y126.684 E.00807
G2 X129.906 Y129.841 I.486 J2.116 E.21099
G1 X130.105 Y129.331 E.01334
G1 X130.169 Y128.908 E.01042
G2 X129.946 Y127.861 I-2.681 J.023 E.02627
G2 X127.904 Y126.653 I-1.928 J.928 E.06131
M204 S10000
G1 X128.06 Y127.018 F42000
G1 F1937
M204 S6000
G1 X127.595 Y127.063 E.01138
G1 X127.126 Y127.255 E.01236
G1 X126.692 Y127.587 E.0133
G1 X126.402 Y128.028 E.01288
G1 X126.236 Y128.534 E.01297
G1 X126.245 Y129.064 E.01291
G1 X126.393 Y129.574 E.01295
G1 X126.698 Y130.007 E.01292
G1 X127.108 Y130.345 E.01294
G1 X127.605 Y130.53 E.01292
G1 X128.133 Y130.579 E.01294
G1 X128.647 Y130.453 E.01289
G1 X129.111 Y130.195 E.01295
G1 X129.459 Y129.812 E.01261
G1 X129.664 Y129.401 E.01118
G2 X129.773 Y128.706 I-1.518 J-.594 E.01728
G1 X129.676 Y128.19 E.0128
G1 X129.416 Y127.73 E.01289
G1 X129.041 Y127.352 E.01297
G1 X128.571 Y127.119 E.01279
G1 X128.119 Y127.03 E.01122
M204 S10000
G1 X128.055 Y127.406 F42000
G1 F1937
M204 S6000
G1 X127.543 Y127.488 E.01263
G1 X127.185 Y127.666 E.00975
G1 X126.891 Y127.962 E.01016
G1 X126.688 Y128.323 E.01008
G1 X126.612 Y128.732 E.01013
G1 X126.647 Y129.145 E.0101
G1 X126.815 Y129.525 E.01013
G1 X127.076 Y129.847 E.01011
G1 X127.429 Y130.067 E.01014
G1 X127.826 Y130.185 E.01009
G1 X128.243 Y130.168 E.01017
G1 X128.637 Y130.043 E.01008
G1 X128.98 Y129.784 E.01047
G1 X129.219 Y129.478 E.00947
G1 X129.376 Y128.992 E.01244
G1 X129.387 Y128.725 E.00651
G1 X129.312 Y128.322 E.00999
G1 X129.106 Y127.96 E.01017
G1 X128.815 Y127.666 E.01007
G1 X128.425 Y127.477 E.01057
G1 X128.113 Y127.417 E.00772
M204 S10000
G1 X128.049 Y127.794 F42000
G1 F1937
M204 S6000
G1 X127.666 Y127.853 E.00945
G1 X127.411 Y127.981 E.00694
G1 X127.139 Y128.274 E.00974
G1 X127.003 Y128.65 E.00974
G1 X127.022 Y129.049 E.00975
G1 X127.196 Y129.409 E.00974
G1 X127.496 Y129.673 E.00974
G1 X127.874 Y129.801 E.00974
G1 X128.273 Y129.771 E.00975
G1 X128.628 Y129.589 E.00972
G1 X128.876 Y129.297 E.00934
G1 X129.007 Y128.85 E.01134
G2 X128.948 Y128.455 I-1.482 J.021 E.00978
G1 X128.739 Y128.114 E.00974
G1 X128.415 Y127.881 E.00975
G1 X128.107 Y127.808 E.0077
M204 S10000
G1 X128.043 Y128.182 F42000
G1 F1937
M204 S6000
G1 X127.745 Y128.234 E.00739
G1 X127.506 Y128.428 E.00749
G1 X127.386 Y128.707 E.00741
G1 X127.419 Y129.012 E.00747
G1 X127.589 Y129.266 E.00744
G1 X127.863 Y129.403 E.00747
G1 X128.168 Y129.398 E.00744
G1 X128.427 Y129.246 E.00731
G1 X128.568 Y129.027 E.00635
G1 X128.617 Y128.764 E.00652
G1 X128.53 Y128.476 E.00733
G1 X128.312 Y128.266 E.00738
G1 X128.101 Y128.2 E.00539
M204 S10000
G1 X127.993 Y128.592 F42000
; LINE_WIDTH: 0.454876
G1 F1937
M204 S6000
G1 X127.842 Y128.653 E.00433
G1 X127.784 Y128.811 E.00446
G1 X127.857 Y128.962 E.00446
G1 X128.016 Y129.015 E.00446
G1 X128.17 Y128.933 E.00463
G1 X128.214 Y128.784 E.00413
G1 X128.14 Y128.637 E.00438
G1 X128.05 Y128.61 E.0025
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7133.686
G1 X128.14 Y128.637 E-.057
G1 X128.214 Y128.784 E-.09979
G1 X128.17 Y128.933 E-.09412
G1 X128.016 Y129.015 E-.10553
G1 X127.857 Y128.962 E-.10163
G1 X127.784 Y128.811 E-.10168
G1 X127.842 Y128.653 E-.10165
G1 X127.993 Y128.592 E-.0986
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/42
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I.906 J-.813 P1  F42000
G1 X119.733 Y119.385 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1934
M204 S5000
G1 X119.807 Y119.183 E.00524
G3 X120.781 Y118.496 I1.097 J.521 E.03038
G1 X135.112 Y118.49 E.34925
G3 X136.31 Y119.695 I-.015 J1.213 E.04589
G1 X136.31 Y136.305 E.40481
G3 X135.108 Y137.51 I-1.213 J-.008 E.04599
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.305 I.008 J-1.213 E.04605
G1 X119.691 Y119.64 E.40614
G3 X119.718 Y119.443 I1.213 J.064 E.00486
; WIPE_START
G1 F3000
M204 S6000
G1 X119.807 Y119.183 E-.10438
G1 X120.003 Y118.887 E-.13487
G1 X120.179 Y118.728 E-.09021
G1 X120.381 Y118.607 E-.08928
G1 X120.549 Y118.542 E-.06863
G1 X120.781 Y118.496 E-.09007
G1 X121.262 Y118.495 E-.18257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.514 Y126.091 Z2.2 F42000
G1 X119.371 Y137.699 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1934
M204 S5000
G1 X119.167 Y137.422 E.00839
G3 X118.91 Y136.495 I1.535 J-.924 E.02374
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.813 J.02 E.06624
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06417
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.792 J.001 E.06871
G1 X120.612 Y138.288 E.35784
G3 X119.412 Y137.742 I.09 J-1.79 E.03289
; WIPE_START
G1 F3000
M204 S6000
G1 X119.167 Y137.422 E-.1534
G1 X119.016 Y137.105 E-.13322
G1 X118.931 Y136.771 E-.13097
G1 X118.91 Y136.495 E-.10547
G1 X118.91 Y135.871 E-.23695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
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


G1 X119.3 Y135.871 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414582
G1 F1934
M204 S6000
G1 X119.301 Y119.631 E.39025
G1 X119.33 Y119.317 E.00757
; LINE_WIDTH: 0.480547
G3 X120.42 Y118.152 I1.459 J.272 E.04752
; LINE_WIDTH: 0.413571
G3 X120.734 Y118.105 I.397 J1.603 E.0076
G1 X135.119 Y118.1 E.34476
G3 X135.483 Y118.13 I.018 J2.005 E.00876
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483421
G3 X136.626 Y119.143 I-.367 J1.45 E.043
; LINE_WIDTH: 0.414737
G3 X136.688 Y119.445 I-1.499 J.464 E.00743
G1 X136.7 Y136.31 E.40542
G3 X136.682 Y136.609 I-2.285 J.013 E.00722
G1 X136.665 Y136.703 E.00228
; LINE_WIDTH: 0.481017
G3 X135.657 Y137.826 I-1.461 J-.296 E.04469
G1 X135.566 Y137.852 E.00266
; LINE_WIDTH: 0.413469
G3 X135.129 Y137.9 I-.421 J-1.826 E.01057
G1 X120.89 Y137.899 E.34114
G3 X120.532 Y137.873 I-.019 J-2.218 E.00862
G1 X120.5 Y137.867 E.00078
; LINE_WIDTH: 0.482276
G3 X119.374 Y136.857 I.309 J-1.477 E.04484
; LINE_WIDTH: 0.436408
G3 X119.312 Y136.555 I1.297 J-.422 E.00785
G1 X119.3 Y136.31 E.00624
; LINE_WIDTH: 0.414582
G1 X119.3 Y135.931 E.0091
; WIPE_START
G1 F7889.629
G1 X119.3 Y133.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.635 Y131.822 Z2.2 F42000
G1 X129.148 Y131.1 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1934
M204 S6000
G1 X129.057 Y131.143 E.00263
G3 X127.934 Y126.228 I-1.062 J-2.343 E.23944
G1 X128.076 Y126.228 E.00373
G3 X129.285 Y131.026 I-.08 J2.571 E.17472
G1 X129.201 Y131.071 E.00252
M204 S10000
G1 X129.337 Y131.469 F42000
G1 F1934
M204 S6000
M73 P57 R7
G1 X129.229 Y131.524 E.00318
G3 X128.223 Y131.781 I-1.23 J-2.724 E.02741
G3 X128.087 Y125.812 I-.222 J-2.981 E.25477
G3 X129.494 Y131.388 I-.088 J2.988 E.20322
G1 X129.391 Y131.442 E.00306
M204 S250
G1 X129.52 Y131.825 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1934
M204 S5000
G1 X129.394 Y131.89 E.00344
G3 X128.253 Y132.18 I-1.395 J-3.089 E.02884
G3 X128.098 Y125.412 I-.252 J-3.38 E.26806
G3 X129.695 Y131.735 I-.099 J3.388 E.21386
G1 X129.573 Y131.798 E.00333
; WIPE_START
G1 F3000
M204 S6000
G1 X129.394 Y131.89 E-.0765
G1 X129.08 Y132.013 E-.12838
G1 X128.754 Y132.105 E-.1285
G1 X128.253 Y132.18 E-.1925
G1 X127.915 Y132.189 E-.12854
G1 X127.639 Y132.161 E-.10558
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.85 Y126.651 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1934
M204 S6000
G1 X127.514 Y126.684 E.00822
G2 X127.728 Y130.954 I.485 J2.116 E.14766
G1 X128.275 Y130.954 E.01334
G2 X127.91 Y126.652 I-.272 J-2.143 E.16103
M204 S10000
G1 X128.064 Y127.018 F42000
G1 F1934
M204 S6000
G1 X127.595 Y127.063 E.01147
G1 X127.126 Y127.255 E.01236
G1 X126.692 Y127.586 E.0133
G1 X126.402 Y128.028 E.01289
G1 X126.236 Y128.534 E.01298
G1 X126.245 Y129.064 E.0129
G1 X126.393 Y129.574 E.01295
G1 X126.698 Y130.006 E.01289
G1 X127.108 Y130.345 E.01297
G1 X127.591 Y130.527 E.01258
G1 X128.048 Y130.568 E.01119
G1 X128.41 Y130.527 E.00886
G1 X128.892 Y130.345 E.01257
G1 X129.299 Y130.01 E.01286
G1 X129.607 Y129.574 E.013
G1 X129.755 Y129.065 E.01292
G1 X129.773 Y128.71 E.00865
G1 X129.676 Y128.19 E.01291
G1 X129.416 Y127.729 E.01289
G1 X129.041 Y127.352 E.01297
G1 X128.571 Y127.119 E.01278
G1 X128.123 Y127.03 E.01114
M204 S10000
G1 X128.058 Y127.406 F42000
G1 F1934
M204 S6000
G1 X127.543 Y127.488 E.01272
G1 X127.185 Y127.666 E.00974
G1 X126.891 Y127.963 E.01017
G1 X126.688 Y128.322 E.01007
G1 X126.612 Y128.732 E.01014
G1 X126.647 Y129.145 E.0101
G1 X126.815 Y129.526 E.01016
G1 X127.076 Y129.847 E.01008
G1 X127.442 Y130.072 E.01047
G1 X127.814 Y130.183 E.00947
G1 X128.324 Y130.151 E.01244
G1 X128.698 Y130.009 E.00976
G1 X129.02 Y129.744 E.01016
G1 X129.258 Y129.406 E.01008
G1 X129.374 Y129.006 E.01014
G1 X129.388 Y128.73 E.00674
G1 X129.312 Y128.322 E.0101
G1 X129.106 Y127.959 E.01017
G1 X128.815 Y127.666 E.01007
G1 X128.423 Y127.476 E.01062
G1 X128.117 Y127.418 E.00759
M204 S10000
G1 X128.052 Y127.794 F42000
G1 F1934
M204 S6000
G1 X127.665 Y127.854 E.00954
G1 X127.411 Y127.981 E.00693
G1 X127.139 Y128.274 E.00975
G1 X127.003 Y128.65 E.00975
G1 X127.022 Y129.049 E.00974
G1 X127.196 Y129.409 E.00974
G1 X127.496 Y129.674 E.00975
G1 X127.857 Y129.797 E.00931
G1 X128.321 Y129.756 E.01134
G1 X128.667 Y129.556 E.00974
G1 X128.909 Y129.238 E.00975
G1 X129.007 Y128.85 E.00975
G2 X128.739 Y128.114 I-1.166 J.007 E.01948
G1 X128.415 Y127.881 E.00974
G1 X128.111 Y127.808 E.00763
M204 S10000
G1 X128.046 Y128.182 F42000
G1 F1934
M204 S6000
G1 X127.744 Y128.234 E.00746
G1 X127.506 Y128.428 E.0075
G1 X127.386 Y128.708 E.00741
G1 X127.42 Y129.012 E.00747
G1 X127.589 Y129.266 E.00743
G1 X127.848 Y129.399 E.00711
G1 X128.152 Y129.399 E.00739
G1 X128.411 Y129.266 E.0071
G1 X128.581 Y129.01 E.00748
G1 X128.617 Y128.768 E.00597
G1 X128.53 Y128.476 E.00743
G1 X128.312 Y128.266 E.00739
G1 X128.103 Y128.2 E.00532
M204 S10000
G1 X127.996 Y128.591 F42000
; LINE_WIDTH: 0.452363
G1 F1934
M204 S6000
G1 X127.841 Y128.652 E.0044
G1 X127.783 Y128.811 E.00447
G1 X127.856 Y128.963 E.00447
G1 X128.019 Y129.009 E.00446
G1 X128.16 Y128.946 E.00408
G1 X128.216 Y128.788 E.00441
G1 X128.14 Y128.636 E.00449
G1 X128.053 Y128.609 E.00242
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7176.582
G1 X128.14 Y128.636 E-.05534
G1 X128.216 Y128.788 E-.10286
G1 X128.16 Y128.946 E-.10097
G1 X128.019 Y129.009 E-.09348
G1 X127.856 Y128.963 E-.10217
G1 X127.783 Y128.811 E-.10226
G1 X127.841 Y128.652 E-.10222
G1 X127.996 Y128.591 E-.1007
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/42
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I.906 J-.813 P1  F42000
G1 X119.734 Y119.382 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1936
M204 S5000
G1 X119.786 Y119.23 E.00393
G3 X120.781 Y118.496 I1.118 J.475 E.03162
G1 X135.113 Y118.49 E.34929
G3 X136.31 Y119.692 I-.027 J1.224 E.04567
G1 X136.31 Y136.308 E.40496
G3 X135.105 Y137.51 I-1.224 J-.022 E.04587
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.308 I.027 J-1.232 E.04579
G1 X119.691 Y119.64 E.40621
G3 X119.719 Y119.44 I1.213 J.064 E.00494
; WIPE_START
G1 F3000
M204 S6000
G1 X119.786 Y119.23 E-.08393
G1 X119.894 Y119.028 E-.08692
G1 X120.044 Y118.844 E-.09018
G1 X120.228 Y118.694 E-.0901
G1 X120.437 Y118.582 E-.09019
G1 X120.781 Y118.496 E-.13496
G1 X121.265 Y118.495 E-.18371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.517 Y126.091 Z2.36 F42000
G1 X119.374 Y137.699 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F1936
M204 S5000
G3 X118.91 Y136.495 I1.332 J-1.204 E.03216
G1 X118.91 Y119.505 E.41406
G3 X120.612 Y117.712 I1.803 J.007 E.06639
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06417
G1 X137.09 Y136.497 E.41411
G3 X135.295 Y138.29 I-1.802 J-.009 E.06861
G1 X120.624 Y138.288 E.35755
G3 X119.415 Y137.742 I.082 J-1.794 E.03312
; WIPE_START
G1 F3000
M204 S6000
G1 X119.212 Y137.494 E-.12181
G1 X119.127 Y137.354 E-.06234
G1 X119.015 Y137.103 E-.10431
G1 X118.945 Y136.852 E-.0991
G1 X118.91 Y136.495 E-.13641
G1 X118.91 Y135.873 E-.23603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.36
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
            G0 Z2.36 F4000
            G39.3 S1
            G0 Z2.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.873 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414605
G1 F1936
M204 S6000
G1 X119.301 Y119.631 E.39033
G3 X119.329 Y119.317 I2.204 J.043 E.00757
G1 X119.331 Y119.305 E.0003
; LINE_WIDTH: 0.480836
G3 X120.42 Y118.152 I1.47 J.297 E.04713
; LINE_WIDTH: 0.41338
G3 X120.733 Y118.105 I.398 J1.604 E.00761
G1 X135.121 Y118.1 E.34462
G3 X135.483 Y118.13 I.019 J1.984 E.00872
G1 X135.503 Y118.134 E.00048
; LINE_WIDTH: 0.482272
G3 X136.623 Y119.133 I-.302 J1.467 E.04451
; LINE_WIDTH: 0.414777
G3 X136.7 Y119.671 I-1.602 J.503 E.01312
G1 X136.7 Y136.315 E.40016
G3 X136.67 Y136.683 I-2.045 J.02 E.00888
G1 X136.667 Y136.702 E.00047
; LINE_WIDTH: 0.481912
G3 X135.632 Y137.835 I-1.471 J-.305 E.04553
; LINE_WIDTH: 0.414067
G3 X135.443 Y137.878 I-1.212 J-4.892 E.00465
G1 X135.11 Y137.9 E.00802
G1 X120.89 Y137.899 E.34123
G3 X120.59 Y137.883 I-.007 J-2.629 E.00722
G1 X120.424 Y137.849 E.00407
; LINE_WIDTH: 0.483793
G3 X119.374 Y136.857 I.38 J-1.455 E.0428
; LINE_WIDTH: 0.437002
M73 P58 R7
G3 X119.3 Y136.329 I1.631 J-.496 E.01362
G1 X119.3 Y136.315 E.00036
; LINE_WIDTH: 0.414605
G1 X119.3 Y135.933 E.00917
; WIPE_START
G1 F7889.16
G1 X119.3 Y133.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.634 Y131.819 Z2.36 F42000
G1 X129.173 Y131.087 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1936
M204 S6000
G3 X127.933 Y126.228 I-1.178 J-2.287 E.24284
G1 X128.081 Y126.228 E.00387
G3 X129.226 Y131.059 I-.086 J2.571 E.17635
M204 S10000
G1 X129.346 Y131.468 F42000
G1 F1936
M204 S6000
G1 X129.091 Y131.58 E.00732
G3 X127.924 Y125.812 I-1.097 J-2.78 E.27429
G1 X128.092 Y125.813 E.00441
G3 X129.398 Y131.438 I-.098 J2.987 E.20565
M204 S250
G1 X129.511 Y131.833 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1936
M204 S5000
G1 X129.237 Y131.952 E.00728
G3 X127.915 Y125.411 I-1.244 J-3.153 E.28866
G1 X128.103 Y125.412 E.00458
G3 X129.563 Y131.803 I-.11 J3.388 E.21704
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.952 E-.13621
G1 X128.918 Y132.063 E-.1283
G1 X128.589 Y132.138 E-.12845
G1 X128.253 Y132.18 E-.12845
G1 X127.916 Y132.189 E-.12837
G1 X127.627 Y132.16 E-.1102
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.857 Y126.651 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1936
M204 S6000
G1 X127.514 Y126.684 E.00839
G2 X129.906 Y129.841 I.486 J2.116 E.21098
G1 X130.105 Y129.331 E.01334
G1 X130.169 Y128.908 E.01042
G2 X129.946 Y127.861 I-2.681 J.023 E.02627
G2 X127.917 Y126.652 I-1.927 J.927 E.06098
M204 S10000
G1 X128.068 Y127.018 F42000
G1 F1936
M204 S6000
G1 X127.595 Y127.064 E.01159
G1 X127.127 Y127.255 E.01233
G1 X126.692 Y127.587 E.01332
G1 X126.402 Y128.028 E.01288
G1 X126.236 Y128.534 E.01298
G1 X126.245 Y129.064 E.01291
G1 X126.393 Y129.574 E.01295
G1 X126.698 Y130.007 E.01292
G1 X127.108 Y130.345 E.01294
G1 X127.605 Y130.53 E.01292
G1 X128.133 Y130.579 E.01294
G1 X128.647 Y130.453 E.01289
G1 X129.111 Y130.196 E.01292
G1 X129.459 Y129.811 E.01264
G1 X129.664 Y129.401 E.01118
G2 X129.773 Y128.706 I-1.517 J-.594 E.01728
G1 X129.676 Y128.19 E.0128
G1 X129.416 Y127.73 E.01289
G1 X129.041 Y127.352 E.01297
G1 X128.571 Y127.119 E.01278
G1 X128.127 Y127.03 E.01104
M204 S10000
G1 X128.062 Y127.406 F42000
G1 F1936
M204 S6000
G1 X127.542 Y127.488 E.01283
G1 X127.185 Y127.666 E.00973
G1 X126.891 Y127.963 E.01016
G1 X126.688 Y128.323 E.01008
G1 X126.612 Y128.732 E.01013
G1 X126.647 Y129.145 E.0101
G1 X126.815 Y129.525 E.01013
G1 X127.076 Y129.847 E.01011
G1 X127.43 Y130.067 E.01015
G1 X127.826 Y130.185 E.01009
G1 X128.243 Y130.168 E.01017
G1 X128.637 Y130.042 E.01008
G1 X128.981 Y129.784 E.01047
G1 X129.219 Y129.478 E.00946
G1 X129.376 Y128.992 E.01244
G1 X129.387 Y128.725 E.00652
G1 X129.312 Y128.322 E.00999
G1 X129.106 Y127.959 E.01017
G1 X128.815 Y127.666 E.01007
G1 X128.42 Y127.475 E.0107
G1 X128.121 Y127.418 E.00742
M204 S10000
G1 X128.056 Y127.795 F42000
G1 F1936
M204 S6000
G1 X127.665 Y127.854 E.00963
G1 X127.411 Y127.981 E.00692
G1 X127.139 Y128.274 E.00973
G1 X127.003 Y128.649 E.00974
G1 X127.022 Y129.049 E.00975
G1 X127.196 Y129.409 E.00974
G1 X127.496 Y129.674 E.00974
G1 X127.874 Y129.801 E.00974
G1 X128.273 Y129.771 E.00975
G1 X128.628 Y129.59 E.0097
G1 X128.876 Y129.297 E.00936
G1 X129.007 Y128.851 E.01134
G2 X128.948 Y128.455 I-1.482 J.021 E.00978
G1 X128.739 Y128.114 E.00974
G1 X128.415 Y127.881 E.00974
G1 X128.114 Y127.808 E.00754
M204 S10000
G1 X128.049 Y128.183 F42000
G1 F1936
M204 S6000
G1 X127.744 Y128.234 E.00753
G1 X127.506 Y128.428 E.00749
G1 X127.386 Y128.707 E.0074
G1 X127.419 Y129.012 E.00747
G1 X127.589 Y129.266 E.00744
G1 X127.863 Y129.403 E.00747
G1 X128.168 Y129.398 E.00744
G1 X128.427 Y129.247 E.0073
G1 X128.568 Y129.027 E.00636
G1 X128.617 Y128.764 E.00653
G1 X128.53 Y128.476 E.00732
G1 X128.312 Y128.266 E.00737
G1 X128.106 Y128.201 E.00526
M204 S10000
G1 X127.994 Y128.593 F42000
; LINE_WIDTH: 0.454666
G1 F1936
M204 S6000
G1 X127.842 Y128.653 E.00435
G1 X127.784 Y128.811 E.00446
G1 X127.857 Y128.962 E.00446
G1 X128.016 Y129.015 E.00446
G1 X128.17 Y128.933 E.00464
G1 X128.214 Y128.784 E.00412
G1 X128.14 Y128.637 E.00439
G1 X128.051 Y128.61 E.00245
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7137.249
G1 X128.14 Y128.637 E-.05596
G1 X128.214 Y128.784 E-.10001
G1 X128.17 Y128.933 E-.09403
G1 X128.016 Y129.015 E-.10568
G1 X127.857 Y128.962 E-.10169
G1 X127.784 Y128.811 E-.10167
G1 X127.842 Y128.653 E-.10175
G1 X127.994 Y128.593 E-.0992
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/42
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I.906 J-.813 P1  F42000
G1 X119.733 Y119.387 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
M204 S5000
G1 X119.81 Y119.185 E.00529
G3 X120.781 Y118.496 I1.108 J.532 E.0303
G1 X135.115 Y118.49 E.34933
G3 X136.31 Y119.695 I-.036 J1.231 E.04563
G1 X136.31 Y136.305 E.40481
G3 X135.108 Y137.51 I-1.232 J-.027 E.0458
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.305 I.012 J-1.217 E.04601
G1 X119.691 Y119.64 E.40614
G3 X119.719 Y119.446 I1.227 J.076 E.0048
; WIPE_START
G1 F3000
M204 S6000
G1 X119.81 Y119.185 E-.10503
G1 X120.003 Y118.887 E-.13477
G1 X120.179 Y118.728 E-.09015
G1 X120.383 Y118.606 E-.09012
G1 X120.661 Y118.513 E-.11164
G1 X120.781 Y118.496 E-.04606
G1 X121.261 Y118.495 E-.18223
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.514 Y126.091 Z2.52 F42000
G1 X119.374 Y137.698 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2184
M204 S5000
G3 X118.91 Y136.495 I1.332 J-1.204 E.03216
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.796 J.003 E.06639
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.201 J1.804 E.06417
G1 X137.09 Y136.496 E.4141
G3 X135.295 Y138.29 I-1.791 J.002 E.06873
G1 X120.612 Y138.288 E.35784
G3 X119.415 Y137.742 I.094 J-1.793 E.03283
; WIPE_START
G1 F3000
M204 S6000
G1 X119.165 Y137.42 E-.15487
G1 X119.015 Y137.103 E-.13328
G1 X118.929 Y136.76 E-.13435
G1 X118.91 Y136.495 E-.10111
G1 X118.91 Y135.873 E-.23639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.52
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
            G0 Z2.52 F4000
            G39.3 S1
            G0 Z2.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.873 F42000
G1 Z2.12
M73 P59 R7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414582
G1 F2184
M204 S6000
G1 X119.301 Y119.631 E.39028
G1 X119.33 Y119.317 E.00756
; LINE_WIDTH: 0.481222
G3 X120.049 Y118.302 I1.463 J.274 E.03626
G1 X120.372 Y118.164 E.00992
; LINE_WIDTH: 0.413699
G3 X120.733 Y118.105 I.425 J1.466 E.00879
G1 X135.122 Y118.1 E.34495
G3 X135.483 Y118.13 I.02 J1.961 E.00869
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483567
G3 X136.615 Y119.108 I-.375 J1.459 E.04195
G1 X136.625 Y119.137 E.00088
; LINE_WIDTH: 0.414756
G3 X136.679 Y119.364 I-1.974 J.589 E.00561
G1 X136.7 Y119.69 E.00785
G1 X136.7 Y136.31 E.39954
G3 X136.682 Y136.609 I-2.311 J.013 E.00722
G1 X136.666 Y136.702 E.00226
; LINE_WIDTH: 0.479971
G3 X135.503 Y137.867 I-1.456 J-.29 E.04914
; LINE_WIDTH: 0.413295
G3 X135.129 Y137.9 I-.375 J-2.118 E.009
G1 X120.89 Y137.899 E.34099
G3 X120.535 Y137.873 I-.019 J-2.229 E.00853
G1 X120.504 Y137.868 E.00076
; LINE_WIDTH: 0.482224
G3 X119.374 Y136.857 I.293 J-1.466 E.04502
; LINE_WIDTH: 0.436389
G3 X119.312 Y136.559 I1.273 J-.417 E.00775
G1 X119.3 Y136.31 E.00634
; LINE_WIDTH: 0.414582
G1 X119.3 Y135.933 E.00907
; WIPE_START
G1 F7889.635
G1 X119.3 Y133.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.776 Y132.397 Z2.52 F42000
G1 X129.502 Y131.837 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
M204 S5000
G1 X129.237 Y131.952 E.00704
G3 X127.915 Y125.411 I-1.245 J-3.152 E.28872
G1 X128.108 Y125.412 E.00471
G3 X129.554 Y131.807 I-.117 J3.387 E.21709
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.952 E-.13239
G1 X128.918 Y132.063 E-.12829
G1 X128.589 Y132.138 E-.12847
G1 X128.253 Y132.18 E-.12843
M73 P59 R6
G1 X127.916 Y132.189 E-.12837
G1 X127.616 Y132.166 E-.11404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.098 Y128.099 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Top surface
M204 S2000
G1 X129.99 Y126.991 E.03819
G1 X129.734 Y126.735
G1 X128.7 Y125.701 E.03565
G1 X128.078 Y125.624
G1 X131.176 Y128.722 E.10676
G1 X131.147 Y129.238
G1 X127.562 Y125.653 E.12355
G1 X127.113 Y125.749
G1 X131.051 Y129.687 E.13573
G1 X130.905 Y130.087
G1 X126.713 Y125.895 E.14447
G1 X126.355 Y126.082
G1 X130.718 Y130.446 E.15039
G1 X130.337 Y130.609
G1 X126.266 Y126.538 E.14032
G1 X126.172 Y126.991
G1 X129.791 Y130.609 E.12473
G1 X129.734 Y131.098
G1 X125.627 Y126.991 E.14157
G1 X125.269 Y127.178
G1 X129.622 Y131.531 E.15007
G1 X129.261 Y131.716
G1 X125.084 Y127.538 E.14398
G1 X124.941 Y127.941
G1 X128.859 Y131.859 E.13504
G1 X128.406 Y131.951
G1 X124.849 Y128.394 E.1226
G1 X124.825 Y128.916
G1 X127.884 Y131.975 E.10544
G1 X127.252 Y131.888
G1 X126.266 Y130.902 E.03398
G1 X125.973 Y130.609
G1 X124.912 Y129.548 E.03657
; WIPE_START
M204 S6000
G1 X125.973 Y130.609 E-.5702
G1 X126.266 Y130.902 E-.15704
G1 X126.327 Y130.963 E-.03276
; WIPE_END
G1 E-.04
M204 S10000
G1 X130.974 Y127.671 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133312
G1 F2184
M204 S6000
G1 X130.895 Y127.557 E.00087
; LINE_WIDTH: 0.162012
G1 X130.816 Y127.443 E.00112
; LINE_WIDTH: 0.200651
G1 X130.724 Y127.317 E.00164
; LINE_WIDTH: 0.245335
G1 X130.629 Y127.193 E.00208
; LINE_WIDTH: 0.278407
G1 X130.45 Y126.971 E.00439
; WIPE_START
G1 F12291.515
G1 X130.629 Y127.193 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.812 Y131.747 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.101377
G1 F2184
M204 S6000
G1 X126.703 Y131.674 E.00056
; LINE_WIDTH: 0.135435
G1 X126.638 Y131.628 E.00051
; LINE_WIDTH: 0.162024
G1 X126.574 Y131.582 E.00064
; LINE_WIDTH: 0.197775
G1 X126.448 Y131.488 E.00162
; LINE_WIDTH: 0.234434
G1 X126.246 Y131.329 E.00324
M204 S10000
G1 X125.533 Y130.629 F42000
; LINE_WIDTH: 0.253043
M73 P60 R6
G1 F2184
M204 S6000
G1 X125.36 Y130.414 E.00382
; LINE_WIDTH: 0.219114
G1 X125.264 Y130.289 E.00183
; LINE_WIDTH: 0.174251
G1 X125.172 Y130.162 E.00139
; LINE_WIDTH: 0.135453
G1 X125.126 Y130.096 E.00051
; LINE_WIDTH: 0.0987187
G3 X125.052 Y129.987 I2.135 J-1.524 E.00054
; WIPE_START
G1 F15000
G1 X125.126 Y130.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.931 Y128.204 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.0893965
G1 F2184
M204 S6000
G1 X124.848 Y128.373 E.00066
; WIPE_START
G1 F15000
G1 X124.931 Y128.204 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.754 Y126.287 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.259664
G1 F2184
M204 S6000
G1 X129.545 Y126.123 E.00378
; LINE_WIDTH: 0.223982
G1 X129.42 Y126.03 E.00187
; LINE_WIDTH: 0.188442
G1 X129.356 Y125.984 E.00077
; LINE_WIDTH: 0.161947
G1 X129.291 Y125.938 E.00064
; LINE_WIDTH: 0.133281
G1 X129.225 Y125.893 E.0005
; LINE_WIDTH: 0.0964555
G1 X129.126 Y125.828 E.00046
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F15000
G1 X129.225 Y125.893 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/42
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I.688 J-1.004 P1  F42000
G1 X119.733 Y119.388 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1815
M204 S5000
G1 X119.808 Y119.184 E.0053
G3 X120.895 Y118.49 I1.1 J.525 E.03311
G1 X135.105 Y118.49 E.34633
G3 X136.31 Y119.695 I-.027 J1.232 E.04585
G1 X136.31 Y136.305 E.40483
G3 X135.105 Y137.51 I-1.232 J-.027 E.04586
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.308 I.026 J-1.232 E.0458
G1 X119.691 Y119.64 E.40622
G3 X119.718 Y119.446 I1.217 J.068 E.0048
; WIPE_START
G1 F3000
M204 S6000
G1 X119.808 Y119.184 E-.1053
G1 X119.928 Y118.979 E-.09002
G1 X120.053 Y118.836 E-.07211
G1 X120.228 Y118.694 E-.08573
G1 X120.437 Y118.582 E-.09012
G1 X120.664 Y118.513 E-.09026
G1 X120.895 Y118.49 E-.08825
G1 X121.259 Y118.49 E-.13822
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.512 Y126.086 Z2.68 F42000
G1 X119.371 Y137.696 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S5000
G1 X119.317 Y137.635 E.002
G3 X118.91 Y136.495 I1.385 J-1.136 E.0301
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.801 J.008 E.06634
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.2 J1.804 E.06417
G1 X137.09 Y136.496 E.4141
G3 X135.295 Y138.29 I-1.791 J.002 E.06873
G1 X120.61 Y138.288 E.3579
G3 X119.436 Y137.767 I.092 J-1.789 E.03199
G1 X119.412 Y137.74 E.00088
; WIPE_START
G1 F3000
M204 S6000
G1 X119.317 Y137.635 E-.05402
G1 X119.166 Y137.422 E-.09929
G1 X119.015 Y137.103 E-.13399
G1 X118.945 Y136.852 E-.09903
G1 X118.91 Y136.495 E-.1364
G1 X118.91 Y135.87 E-.23727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.68
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
            G0 Z2.68 F4000
            G39.3 S1
            G0 Z2.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.87 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1815
M204 S6000
G1 X119.301 Y119.631 E.39027
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.48098
G3 X120.42 Y118.152 I1.458 J.295 E.04697
; LINE_WIDTH: 0.413429
G3 X120.734 Y118.105 I.397 J1.594 E.00762
G1 X135.11 Y118.1 E.34442
G3 X135.421 Y118.119 I.016 J2.292 E.00745
G1 X135.569 Y118.149 E.00362
; LINE_WIDTH: 0.483357
G3 X136.628 Y119.147 I-.364 J1.448 E.04314
; LINE_WIDTH: 0.414734
G3 X136.679 Y119.363 I-1.895 J.558 E.00533
G1 X136.7 Y119.69 E.00787
G1 X136.7 Y136.31 E.39954
G3 X136.68 Y136.62 I-2.231 J.015 E.00748
G1 X136.666 Y136.702 E.00198
; LINE_WIDTH: 0.480989
G3 X135.632 Y137.835 I-1.455 J-.29 E.04549
G1 X135.56 Y137.853 E.00211
; LINE_WIDTH: 0.413654
G1 X135.41 Y137.882 E.00366
G1 X135.11 Y137.9 E.0072
G1 X120.89 Y137.899 E.34085
G3 X120.59 Y137.883 I-.005 J-2.725 E.00721
G1 X120.424 Y137.849 E.00407
; LINE_WIDTH: 0.483947
G3 X119.377 Y136.867 I.378 J-1.452 E.04252
; LINE_WIDTH: 0.437479
G3 X119.3 Y136.329 I1.615 J-.505 E.0139
G1 X119.3 Y136.315 E.00036
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.93 E.00925
; WIPE_START
G1 F7888.835
G1 X119.3 Y133.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.079 Y128.944 Z2.68 F42000
G1 X126.764 Y127.489 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1815
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.445 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1815
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
M73 P61 R6
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1815
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.102 Y125.813 I.253 J3.193 E.00959
G1 X128.263 Y125.821 E.00424
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26799
G1 X127.737 Y125.821 E-.12558
G1 X128.102 Y125.813 E-.18844
G1 X128.263 Y125.821 E-.0834
G1 X128.258 Y126.004 E-.0946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.492 Y127.489 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G1 X129.236 Y127.489 E.00672
G1 X129.236 Y126.07 E.03727
G1 X129.494 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.552 Y127.489 E.03
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.12004
G1 X129.236 Y126.07 E-.53922
G1 X129.468 Y126.197 E-.10073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.296 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27196
G1 X130.976 Y128.521 E-.11979
G1 X130.985 Y128.651 E-.06498
G1 X130.976 Y129.079 E-.21341
G1 X130.796 Y129.072 E-.08987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.296 Y131.496 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G1 X129.236 Y131.53 E.00182
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.623 Y131.313 I-2.626 J-1.625 E.03523
G1 X129.348 Y131.466 E.00827
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.04911
G1 X129.236 Y130.111 E-.53923
G1 X129.687 Y130.111 E-.17165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21437
G1 X125.913 Y130.94 E-.16976
G1 X125.617 Y130.605 E-.16976
G1 X125.328 Y130.146 E-.20611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1815
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12427
G1 X125.011 Y128.8 E-.13882
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11952
G1 X125.264 Y129.01 E-.23855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.492 Y131.841 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1815
M204 S5000
G1 X129.237 Y131.951 E.00676
G3 X127.915 Y125.411 I-1.247 J-3.152 E.28878
G1 X128.113 Y125.413 E.00484
G3 X129.544 Y131.812 I-.123 J3.387 E.21717
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.951 E-.12814
G1 X128.918 Y132.063 E-.12838
G1 X128.589 Y132.138 E-.12846
G1 X128.253 Y132.18 E-.12844
G1 X127.916 Y132.189 E-.12837
G1 X127.605 Y132.166 E-.1182
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/42
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I1.036 J-.638 P1  F42000
G1 X119.736 Y119.387 Z2.68
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S5000
G1 X119.786 Y119.238 E.00382
G3 X120.781 Y118.496 I1.132 J.479 E.03173
G1 X135.118 Y118.49 E.3494
G3 X136.31 Y119.695 I-.038 J1.23 E.04557
G1 X136.31 Y136.305 E.40481
G3 X135.105 Y137.51 I-1.226 J-.021 E.04592
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.008 J-1.213 E.04605
G1 X119.691 Y119.638 E.4062
G3 X119.714 Y119.467 I1.227 J.079 E.00422
G1 X119.72 Y119.445 E.00055
; WIPE_START
G1 F3000
M204 S6000
G1 X119.786 Y119.238 E-.08236
G1 X119.894 Y119.028 E-.08994
G1 X120.044 Y118.844 E-.09016
G1 X120.228 Y118.694 E-.09013
G1 X120.437 Y118.582 E-.09025
G1 X120.781 Y118.496 E-.13487
G1 X121.261 Y118.495 E-.1823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.514 Y126.091 Z2.84 F42000
G1 X119.374 Y137.699 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S5000
G3 X118.91 Y136.495 I1.332 J-1.204 E.03216
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.813 J.02 E.06624
G1 X135.475 Y117.719 E.36224
G3 X137.09 Y119.505 I-.2 J1.804 E.06417
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.009 E.0686
G1 X120.632 Y138.288 E.35736
G3 X119.415 Y137.742 I.074 J-1.794 E.03331
; WIPE_START
G1 F3000
M204 S6000
G1 X119.165 Y137.42 E-.15489
G1 X119.014 Y137.102 E-.13391
G1 X118.945 Y136.85 E-.09934
G1 X118.91 Y136.495 E-.13552
G1 X118.91 Y135.873 E-.23634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.84
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
            G0 Z2.84 F4000
            G39.3 S1
            G0 Z2.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.873 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414632
G1 F1825
M204 S6000
G1 X119.301 Y119.626 E.39045
G1 X119.334 Y119.297 E.00793
; LINE_WIDTH: 0.48097
G3 X120.42 Y118.152 I1.459 J.295 E.04695
; LINE_WIDTH: 0.413509
G3 X120.733 Y118.105 I.398 J1.602 E.00761
G1 X135.125 Y118.1 E.34485
G3 X135.483 Y118.13 I.021 J1.918 E.00861
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483565
G3 X136.616 Y119.113 I-.374 J1.458 E.04209
G1 X136.625 Y119.138 E.00075
; LINE_WIDTH: 0.414757
G3 X136.679 Y119.364 I-1.976 J.589 E.0056
G1 X136.7 Y119.69 E.00785
G1 X136.7 Y136.31 E.39954
G3 X136.682 Y136.61 I-2.276 J.014 E.00723
G1 X136.665 Y136.703 E.00226
; LINE_WIDTH: 0.481998
G3 X135.633 Y137.834 I-1.459 J-.294 E.04553
; LINE_WIDTH: 0.414147
G3 X135.443 Y137.878 I-1.015 J-4.006 E.00466
G1 X135.11 Y137.9 E.00802
G1 X120.89 Y137.899 E.3413
G3 X120.591 Y137.883 I-.008 J-2.589 E.00719
G1 X120.43 Y137.851 E.00394
; LINE_WIDTH: 0.483577
G3 X119.65 Y137.362 I.355 J-1.435 E.02658
G1 X119.466 Y137.084 E.00947
G1 X119.372 Y136.853 E.00708
; LINE_WIDTH: 0.436367
G3 X119.321 Y136.636 I2.006 J-.585 E.00566
G1 X119.3 Y136.31 E.0083
; LINE_WIDTH: 0.414632
G1 X119.3 Y135.933 E.00906
; WIPE_START
G1 F7888.601
G1 X119.3 Y133.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.078 Y128.945 Z2.84 F42000
G1 X126.764 Y127.489 Z2.84
M73 P62 R6
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.107 Y125.813 I.252 J3.183 E.00972
G1 X128.263 Y125.821 E.00411
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26797
G1 X127.737 Y125.821 E-.1256
G1 X128.107 Y125.813 E-.19103
G1 X128.263 Y125.821 E-.08079
G1 X128.258 Y126.004 E-.09461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.482 Y127.489 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G1 X129.236 Y127.489 E.00647
G1 X129.236 Y126.07 E.03727
G1 X129.494 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04669
G1 X129.542 Y127.489 E.03026
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.11635
G1 X129.236 Y126.07 E-.53923
G1 X129.477 Y126.202 E-.10442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.291 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27195
G1 X130.976 Y128.521 E-.11978
G1 X130.985 Y128.651 E-.06498
G1 X130.976 Y129.079 E-.21342
G1 X130.796 Y129.072 E-.08986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.287 Y131.501 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G1 X129.236 Y131.53 E.00154
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.623 Y131.313 I-2.624 J-1.623 E.03523
G1 X129.339 Y131.472 E.00855
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.04506
G1 X129.236 Y130.111 E-.53922
G1 X129.698 Y130.111 E-.17572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.665 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.261 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27327
G1 X127.743 Y131.536 E-.1259
G1 X128.257 Y131.536 E-.266
G1 X128.261 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21439
G1 X125.913 Y130.94 E-.16977
G1 X125.617 Y130.605 E-.16978
G1 X125.328 Y130.146 E-.20606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1825
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.986 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12428
G1 X125.011 Y128.8 E-.13881
G1 X125.024 Y128.521 E-.13885
G1 X125.264 Y128.53 E-.11953
G1 X125.264 Y129.01 E-.23854
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.482 Y131.846 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G1 X129.237 Y131.951 E.0065
G3 X127.915 Y125.411 I-1.248 J-3.151 E.28883
G1 X128.118 Y125.413 E.00497
G3 X129.544 Y131.811 I-.129 J3.387 E.217
G1 X129.534 Y131.817 E.00026
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.951 E-.12404
G1 X128.918 Y132.063 E-.12841
G1 X128.589 Y132.138 E-.12847
G1 X128.253 Y132.18 E-.12844
G1 X127.916 Y132.189 E-.12837
G1 X127.595 Y132.165 E-.12227
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/42
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I1.036 J-.638 P1  F42000
G1 X119.732 Y119.39 Z2.84
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.81 Y119.185 E.00536
G3 X120.895 Y118.49 I1.105 J.531 E.03306
G1 X135.105 Y118.49 E.34633
G3 X136.31 Y119.695 I-.025 J1.23 E.04586
G1 X136.31 Y136.305 E.40483
G3 X135.105 Y137.51 I-1.213 J-.008 E.04604
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.008 J-1.213 E.04604
G1 X119.691 Y119.64 E.40615
G3 X119.718 Y119.448 I1.223 J.075 E.00473
; WIPE_START
G1 F3000
M204 S6000
G1 X119.81 Y119.185 E-.10611
G1 X119.928 Y118.979 E-.09
G1 X120.087 Y118.803 E-.09014
G1 X120.278 Y118.662 E-.0902
G1 X120.451 Y118.577 E-.07325
G1 X120.664 Y118.513 E-.08458
G1 X120.895 Y118.49 E-.08827
G1 X121.257 Y118.49 E-.13745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.515 Y126.086 Z3 F42000
G1 X119.381 Y137.701 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.228 Y137.51 E.00597
G3 X118.91 Y136.495 I1.485 J-1.022 E.02632
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.795 J.002 E.0664
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.198 J1.802 E.06419
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.009 E.0686
G1 X120.612 Y138.288 E.35784
G3 X119.44 Y137.764 I.101 J-1.8 E.03199
G1 X119.422 Y137.745 E.00064
; WIPE_START
G1 F3000
M204 S6000
G1 X119.228 Y137.51 E-.11583
G1 X119.047 Y137.187 E-.14055
G1 X118.945 Y136.852 E-.13317
G1 X118.91 Y136.495 E-.13638
G1 X118.91 Y135.879 E-.23407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
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


G1 X119.3 Y135.879 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39047
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.481055
G3 X120.421 Y118.152 I1.46 J.297 E.047
; LINE_WIDTH: 0.413358
G3 X120.734 Y118.105 I.396 J1.602 E.00758
G1 X135.11 Y118.1 E.34435
M73 P63 R6
G3 X135.406 Y118.117 I.014 J2.33 E.00711
G1 X135.569 Y118.148 E.00396
; LINE_WIDTH: 0.483667
G3 X136.625 Y119.138 I-.364 J1.447 E.04289
; LINE_WIDTH: 0.414756
G3 X136.679 Y119.364 I-1.947 J.584 E.0056
G1 X136.7 Y119.69 E.00784
G1 X136.7 Y136.31 E.39956
G3 X136.682 Y136.61 I-2.276 J.013 E.00722
G1 X136.665 Y136.703 E.00226
; LINE_WIDTH: 0.481362
G3 X135.657 Y137.827 I-1.456 J-.291 E.04475
G1 X135.576 Y137.849 E.00238
; LINE_WIDTH: 0.413657
G1 X135.386 Y137.885 E.00464
G1 X135.11 Y137.9 E.00663
G1 X120.89 Y137.899 E.34086
G3 X120.541 Y137.874 I-.018 J-2.247 E.00841
G1 X120.434 Y137.852 E.00261
; LINE_WIDTH: 0.483513
G3 X119.377 Y136.867 I.356 J-1.443 E.04283
G1 X119.368 Y136.842 E.00075
; LINE_WIDTH: 0.435648
G3 X119.313 Y136.565 I1.722 J-.488 E.00719
G1 X119.3 Y136.31 E.00646
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.939 E.00893
; WIPE_START
G1 F7888.828
G1 X119.3 Y133.939 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.075 Y128.949 Z3 F42000
G1 X126.764 Y127.489 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.112 Y125.814 I.252 J3.173 E.00985
G1 X128.263 Y125.821 E.00399
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26799
G1 X127.737 Y125.821 E-.12557
G1 X128.112 Y125.814 E-.19349
G1 X128.263 Y125.821 E-.07835
G1 X128.259 Y126.004 E-.09459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.47 Y127.489 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00615
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.53 Y127.489 E.03058
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.11175
G1 X129.236 Y126.07 E-.53923
G1 X129.488 Y126.208 E-.10902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00734
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27191
G1 X130.976 Y128.521 E-.11976
G1 X130.985 Y128.651 E-.06497
G1 X130.989 Y128.8 E-.07429
G1 X130.976 Y129.079 E-.13922
G1 X130.796 Y129.072 E-.08985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.275 Y131.507 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y131.53 E.00119
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.621 Y131.314 I-2.626 J-1.625 E.0353
G1 X129.328 Y131.478 E.00883
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.04004
G1 X129.236 Y130.111 E-.53923
G1 X129.711 Y130.111 E-.18073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.665 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27327
M73 P64 R6
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21443
G1 X125.913 Y130.94 E-.16963
G1 X125.617 Y130.605 E-.16982
G1 X125.328 Y130.146 E-.20613
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.986 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12428
G1 X125.011 Y128.8 E-.13881
G1 X125.024 Y128.521 E-.13885
G1 X125.264 Y128.53 E-.11953
G1 X125.264 Y129.01 E-.23854
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.47 Y131.851 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.391 Y131.884 E.00207
G3 X127.747 Y125.42 I-1.398 J-3.086 E.28849
G3 X128.123 Y125.413 I.243 J3.188 E.00919
G3 X129.691 Y131.73 I-.13 J3.385 E.21286
G1 X129.522 Y131.822 E.00469
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.391 Y131.884 E-.05501
G1 X129.079 Y132.014 E-.1284
G1 X128.754 Y132.105 E-.12829
G1 X128.422 Y132.164 E-.12842
G1 X128.084 Y132.189 E-.12846
G1 X127.747 Y132.18 E-.12837
G1 X127.582 Y132.16 E-.06304
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/42
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I1.037 J-.637 P1  F42000
G1 X119.731 Y119.391 Z3
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.812 Y119.186 E.00539
G3 X120.781 Y118.496 I1.115 J.54 E.03024
G1 X135.121 Y118.49 E.34947
G3 X136.31 Y119.695 I-.023 J1.213 E.04567
G1 X136.31 Y136.305 E.40481
G3 X135.105 Y137.51 I-1.232 J-.027 E.04587
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.008 J-1.213 E.04605
G1 X119.691 Y119.641 E.40614
G3 X119.719 Y119.45 I1.236 J.085 E.00471
; WIPE_START
G1 F3000
M204 S6000
G1 X119.812 Y119.186 E-.10641
G1 X119.929 Y118.977 E-.09098
G1 X120.042 Y118.846 E-.06564
G1 X120.33 Y118.633 E-.136
G1 X120.549 Y118.542 E-.09007
G1 X120.781 Y118.496 E-.09015
G1 X121.257 Y118.495 E-.18075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.512 Y126.091 Z3.16 F42000
G1 X119.373 Y137.701 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.374 Y137.699 E.00007
G3 X118.91 Y136.495 I1.332 J-1.205 E.03216
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.813 J.019 E.06624
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.2 J1.804 E.06417
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.796 J-.003 E.06867
G1 X120.61 Y138.288 E.3579
G3 X119.635 Y137.936 I.096 J-1.794 E.02562
G1 X119.418 Y137.741 E.0071
; WIPE_START
G1 F3000
M204 S6000
G1 X119.374 Y137.699 E-.02341
G1 X119.166 Y137.422 E-.13137
G1 X119.015 Y137.103 E-.13421
G1 X118.945 Y136.852 E-.09907
G1 X118.91 Y136.495 E-.1364
G1 X118.91 Y135.875 E-.23554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.16
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
            G0 Z3.16 F4000
            G39.3 S1
            G0 Z3.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.875 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39037
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.481088
G3 X120.419 Y118.152 I1.462 J.299 E.04696
; LINE_WIDTH: 0.413476
G3 X120.733 Y118.105 I.398 J1.602 E.00761
G1 X135.128 Y118.101 E.3449
G3 X135.483 Y118.13 I.022 J1.879 E.00854
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483574
G3 X136.623 Y119.133 I-.374 J1.457 E.0427
; LINE_WIDTH: 0.414767
G3 X136.687 Y119.434 I-1.437 J.462 E.0074
G1 X136.7 Y119.69 E.00617
G1 X136.7 Y136.31 E.39955
G3 X136.679 Y136.626 I-2.177 J.017 E.00763
G1 X136.666 Y136.703 E.00187
; LINE_WIDTH: 0.480875
G3 X135.632 Y137.835 I-1.461 J-.296 E.04543
G1 X135.553 Y137.854 E.00231
; LINE_WIDTH: 0.413635
G1 X135.41 Y137.882 E.0035
G1 X135.11 Y137.9 E.0072
G1 X120.89 Y137.899 E.34084
G3 X120.59 Y137.883 I-.004 J-2.727 E.0072
G1 X120.424 Y137.849 E.00408
; LINE_WIDTH: 0.483936
G3 X119.377 Y136.867 I.382 J-1.455 E.04251
; LINE_WIDTH: 0.43688
G3 X119.313 Y136.566 I1.491 J-.473 E.00783
G1 X119.3 Y136.31 E.00653
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.935 E.00901
; WIPE_START
G1 F7888.829
G1 X119.3 Y133.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.077 Y128.946 Z3.16 F42000
G1 X126.764 Y127.489 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
M73 P65 R6
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.116 Y125.814 I.251 J3.158 E.00998
G1 X128.263 Y125.821 E.00386
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26797
G1 X127.737 Y125.821 E-.12561
G1 X128.116 Y125.814 E-.196
G1 X128.263 Y125.821 E-.0758
G1 X128.258 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.459 Y127.489 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00587
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.519 Y127.489 E.03085
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.10775
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.497 Y126.213 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.294 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27194
G1 X130.976 Y128.521 E-.11979
G1 X130.985 Y128.651 E-.06498
G1 X130.976 Y129.079 E-.2134
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.265 Y131.513 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
M73 P65 R5
G1 F1824
M204 S6000
G1 X129.236 Y131.53 E.00089
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.623 Y131.313 I-2.624 J-1.622 E.03523
G1 X129.317 Y131.484 E.0092
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.03562
G1 X129.236 Y130.111 E-.53923
G1 X129.723 Y130.111 E-.18515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27327
G1 X127.743 Y131.536 E-.1259
G1 X128.257 Y131.536 E-.26599
G1 X128.262 Y131.719 E-.09484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.16971
G1 X125.617 Y130.605 E-.16984
G1 X125.328 Y130.146 E-.20603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12427
G1 X125.011 Y128.8 E-.13882
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11952
G1 X125.264 Y129.01 E-.23855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.46 Y131.856 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.391 Y131.884 E.00179
G3 X127.747 Y125.42 I-1.398 J-3.086 E.28851
G3 X128.128 Y125.413 I.243 J3.177 E.00931
G3 X129.691 Y131.729 I-.136 J3.385 E.21272
G1 X129.512 Y131.828 E.00498
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.391 Y131.884 E-.05062
G1 X129.079 Y132.013 E-.12834
G1 X128.754 Y132.105 E-.12834
G1 X128.422 Y132.164 E-.12839
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12837
G1 X127.571 Y132.158 E-.06745
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/42
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I1.037 J-.637 P1  F42000
G1 X119.731 Y119.393 Z3.16
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.807 Y119.183 E.00544
G3 X120.781 Y118.496 I1.097 J.521 E.03038
G1 X135.16 Y118.491 E.35042
G3 X136.31 Y119.692 I-.075 J1.224 E.04455
G1 X136.31 Y136.305 E.40487
G3 X135.108 Y137.51 I-1.213 J-.008 E.04599
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.305 I.008 J-1.213 E.04605
G1 X119.691 Y119.64 E.40614
G3 X119.716 Y119.451 I1.213 J.064 E.00466
; WIPE_START
G1 F3000
M204 S6000
G1 X119.807 Y119.183 E-.1075
G1 X120.003 Y118.887 E-.13488
G1 X120.179 Y118.728 E-.09017
G1 X120.381 Y118.607 E-.08967
G1 X120.549 Y118.542 E-.06834
G1 X120.781 Y118.496 E-.09
G1 X121.254 Y118.495 E-.17944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.51 Y126.092 Z3.32 F42000
G1 X119.374 Y137.702 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.375 Y137.697 E.00013
G3 X118.91 Y136.495 I1.337 J-1.209 E.03213
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.796 J.003 E.06639
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.2 J1.804 E.06417
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.802 J-.009 E.0686
G1 X120.612 Y138.288 E.35785
G3 X119.637 Y137.934 I.101 J-1.8 E.02565
G1 X119.419 Y137.741 E.00708
; WIPE_START
G1 F3000
M204 S6000
G1 X119.375 Y137.697 E-.02366
G1 X119.166 Y137.421 E-.13159
G1 X119.047 Y137.187 E-.09974
G1 X118.945 Y136.852 E-.13317
G1 X118.91 Y136.495 E-.13639
G1 X118.91 Y135.875 E-.23545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.32
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
            G0 Z3.32 F4000
            G39.3 S1
            G0 Z3.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.875 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39038
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.481041
G3 X120.421 Y118.151 I1.463 J.3 E.04701
; LINE_WIDTH: 0.413678
G3 X120.734 Y118.105 I.396 J1.603 E.00758
G1 X135.169 Y118.101 E.34606
G3 X135.483 Y118.13 I-.011 J1.826 E.00755
G1 X135.503 Y118.134 E.00049
; LINE_WIDTH: 0.482086
G3 X136.626 Y119.143 I-.297 J1.461 E.0448
; LINE_WIDTH: 0.414752
G3 X136.7 Y119.671 I-1.631 J.496 E.01288
G1 X136.7 Y136.31 E.39999
G3 X136.682 Y136.61 I-2.281 J.014 E.00723
G1 X136.665 Y136.704 E.0023
; LINE_WIDTH: 0.481287
G3 X135.657 Y137.826 I-1.457 J-.294 E.04469
G1 X135.576 Y137.849 E.00238
; LINE_WIDTH: 0.413452
G3 X135.129 Y137.9 I-.431 J-1.819 E.01082
G1 X120.89 Y137.899 E.34113
G3 X120.591 Y137.882 I-.009 J-2.538 E.00718
G1 X120.516 Y137.869 E.00184
; LINE_WIDTH: 0.481983
G3 X119.377 Y136.867 I.284 J-1.471 E.045
G1 X119.368 Y136.842 E.00075
; LINE_WIDTH: 0.435641
G3 X119.313 Y136.568 I1.717 J-.487 E.0071
G1 X119.3 Y136.31 E.00656
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.935 E.00901
; WIPE_START
G1 F7888.835
G1 X119.3 Y133.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.077 Y128.947 Z3.32 F42000
G1 X126.764 Y127.489 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
M73 P66 R5
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.121 Y125.814 I.25 J3.149 E.0101
G1 X128.263 Y125.821 E.00373
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26798
G1 X127.737 Y125.821 E-.12559
G1 X128.121 Y125.814 E-.19853
G1 X128.263 Y125.821 E-.07328
G1 X128.258 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y127.489 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00559
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.556 J2.661 E.04667
G1 X129.508 Y127.489 E.03114
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.10362
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11212
G1 X129.506 Y126.219 E-.00504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27188
G1 X130.976 Y128.521 E-.11981
G1 X130.985 Y128.651 E-.06499
G1 X130.989 Y128.8 E-.07424
G1 X130.976 Y129.079 E-.13919
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.255 Y131.519 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y131.53 E.00057
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.623 Y131.313 I-2.623 J-1.621 E.03523
G1 X129.307 Y131.49 E.00951
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.0311
G1 X129.236 Y130.111 E-.53921
G1 X129.735 Y130.111 E-.18969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.26601
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.16971
G1 X125.617 Y130.605 E-.16987
G1 X125.328 Y130.146 E-.20607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.449 Y131.862 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.391 Y131.884 E.00151
G3 X127.747 Y125.42 I-1.399 J-3.085 E.28852
G3 X128.134 Y125.414 I.243 J3.174 E.00943
G3 X129.691 Y131.729 I-.141 J3.385 E.21257
G1 X129.502 Y131.833 E.00527
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.391 Y131.884 E-.04616
G1 X129.08 Y132.013 E-.12819
G1 X128.754 Y132.105 E-.1284
G1 X128.422 Y132.164 E-.1284
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12838
G1 X127.559 Y132.157 E-.07198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/42
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I1.039 J-.634 P1  F42000
G1 X119.746 Y119.364 Z3.32
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.761 Y119.292 E.00179
G3 X120.781 Y118.496 I1.142 J.41 E.03328
G1 X135.123 Y118.49 E.34954
G3 X136.31 Y119.695 I-.026 J1.213 E.0456
G1 X136.31 Y136.305 E.40481
G3 X135.105 Y137.51 I-1.213 J-.008 E.04605
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.027 J-1.232 E.04586
G1 X119.691 Y119.641 E.40614
G1 X119.735 Y119.423 E.00541
; WIPE_START
G1 F3000
M204 S6000
G1 X119.761 Y119.292 E-.05068
G1 X119.862 Y119.078 E-.09002
G1 X120.002 Y118.888 E-.08973
G1 X120.133 Y118.764 E-.06836
G1 X120.329 Y118.633 E-.08992
G1 X120.549 Y118.542 E-.09022
G1 X120.781 Y118.496 E-.09007
G1 X121.284 Y118.495 E-.19101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.529 Y126.09 Z3.48 F42000
G1 X119.374 Y137.702 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.372 Y137.7 E.00007
G3 X118.91 Y136.497 I1.329 J-1.201 E.03212
G1 X118.91 Y119.503 E.41418
G3 X120.61 Y117.712 I1.796 J.003 E.06633
G1 X135.475 Y117.719 E.3623
G3 X137.09 Y119.505 I-.2 J1.804 E.06417
G1 X137.09 Y136.497 E.41412
G3 X135.297 Y138.29 I-1.791 J.001 E.06865
G1 X120.612 Y138.288 E.35791
G3 X119.634 Y137.937 I.089 J-1.789 E.02568
G1 X119.419 Y137.742 E.00708
; WIPE_START
G1 F3000
M204 S6000
G1 X119.372 Y137.7 E-.02391
G1 X119.166 Y137.422 E-.13169
G1 X119.016 Y137.105 E-.13301
G1 X118.945 Y136.851 E-.10048
G1 X118.91 Y136.497 E-.13499
G1 X118.91 Y135.876 E-.23591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.48
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
            G0 Z3.48 F4000
            G39.3 S1
            G0 Z3.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.876 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39041
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.480972
G3 X120.42 Y118.152 I1.463 J.299 E.04696
; LINE_WIDTH: 0.413465
G3 X120.733 Y118.105 I.356 J1.33 E.00761
G1 X135.132 Y118.101 E.34496
G3 X135.483 Y118.13 I.023 J1.837 E.00846
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483314
G3 X136.628 Y119.147 I-.361 J1.443 E.04314
; LINE_WIDTH: 0.414731
G3 X136.679 Y119.364 I-1.972 J.579 E.00536
G1 X136.7 Y119.69 E.00785
G1 X136.7 Y136.31 E.39952
G3 X136.682 Y136.609 I-2.274 J.014 E.0072
M73 P67 R5
G1 X136.665 Y136.704 E.00233
; LINE_WIDTH: 0.481241
G3 X136.021 Y137.654 I-1.468 J-.301 E.03327
G1 X135.805 Y137.771 E.00694
G1 X135.573 Y137.85 E.00694
; LINE_WIDTH: 0.413676
G3 X135.292 Y137.894 I-.372 J-1.457 E.00681
G1 X120.89 Y137.899 E.34525
G3 X120.546 Y137.875 I-.017 J-2.273 E.00828
G1 X120.433 Y137.851 E.00277
; LINE_WIDTH: 0.483694
G3 X119.435 Y137.02 I.358 J-1.444 E.03818
G1 X119.372 Y136.853 E.00507
; LINE_WIDTH: 0.436901
G3 X119.306 Y136.492 I1.804 J-.516 E.00933
G1 X119.3 Y136.31 E.00465
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.936 E.00898
; WIPE_START
G1 F7888.829
G1 X119.3 Y133.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y128.947 Z3.48 F42000
G1 X126.764 Y127.489 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.05441
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.126 Y125.814 I.25 J3.157 E.01024
G1 X128.263 Y125.821 E.0036
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.268
G1 X127.737 Y125.821 E-.12559
G1 X128.126 Y125.814 E-.20108
G1 X128.263 Y125.821 E-.07073
G1 X128.259 Y126.004 E-.0946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.436 Y127.489 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00527
G1 X129.236 Y126.07 E.03727
G1 X129.494 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.496 Y127.489 E.03145
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.0991
G1 X129.236 Y126.07 E-.53923
G1 X129.494 Y126.211 E-.11197
G1 X129.516 Y126.226 E-.0097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.243 Y131.525 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y131.53 E.00023
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00753
G3 X129.623 Y131.313 I-2.626 J-1.625 E.03523
G1 X129.296 Y131.496 E.00985
; WIPE_START
G1 F5400
G1 X129.236 Y131.53 E-.02614
G1 X129.236 Y130.111 E-.53923
G1 X129.748 Y130.111 E-.19462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.26601
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.16974
G1 X125.617 Y130.605 E-.16975
G1 X125.328 Y130.146 E-.20609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13882
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.436 Y131.866 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.236 Y131.949 E.00529
G3 X127.747 Y125.42 I-1.244 J-3.151 E.28443
M73 P68 R5
G3 X128.139 Y125.414 I.242 J3.175 E.00956
G3 X129.543 Y131.81 I-.147 J3.384 E.21654
G1 X129.49 Y131.838 E.00148
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.236 Y131.949 E-.10524
G1 X128.754 Y132.105 E-.19227
G1 X128.422 Y132.164 E-.12838
G1 X128.084 Y132.189 E-.12849
G1 X127.747 Y132.18 E-.12838
G1 X127.545 Y132.155 E-.07723
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/42
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I1.039 J-.634 P1  F42000
G1 X119.746 Y119.366 Z3.48
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.761 Y119.292 E.00184
G3 X120.781 Y118.496 I1.142 J.41 E.03328
G1 X135.159 Y118.491 E.35042
G3 X136.31 Y119.695 I-.063 J1.212 E.04473
G1 X136.31 Y136.305 E.40481
G3 X135.105 Y137.51 I-1.216 J-.011 E.04602
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.008 J-1.213 E.04605
G1 X119.691 Y119.641 E.40614
G1 X119.734 Y119.425 E.00535
; WIPE_START
G1 F3000
M204 S6000
G1 X119.761 Y119.292 E-.05152
G1 X119.862 Y119.078 E-.09005
G1 X120.003 Y118.888 E-.08975
G1 X120.133 Y118.764 E-.06829
G1 X120.329 Y118.633 E-.08995
G1 X120.549 Y118.542 E-.09022
G1 X120.781 Y118.496 E-.09006
G1 X121.282 Y118.495 E-.19016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.528 Y126.091 Z3.64 F42000
G1 X119.375 Y137.703 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.377 Y137.698 E.00013
G3 X118.91 Y136.495 I1.337 J-1.21 E.03216
G1 X118.91 Y119.503 E.41412
G3 X120.61 Y117.712 I1.796 J.003 E.06634
G1 X135.475 Y117.719 E.36229
G3 X137.09 Y119.505 I-.189 J1.794 E.06427
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.795 J-.002 E.06868
G1 X120.612 Y138.288 E.35785
G3 X119.635 Y137.932 I.101 J-1.8 E.0257
G1 X119.42 Y137.742 E.00699
; WIPE_START
G1 F3000
M204 S6000
G1 X119.377 Y137.698 E-.0236
G1 X119.165 Y137.421 E-.13218
G1 X119.015 Y137.103 E-.13381
G1 X118.935 Y136.794 E-.12121
G1 X118.91 Y136.495 E-.11419
G1 X118.91 Y135.876 E-.23501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.64
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
            G0 Z3.64 F4000
            G39.3 S1
            G0 Z3.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.876 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39041
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.480968
G3 X120.42 Y118.152 I1.463 J.299 E.04695
; LINE_WIDTH: 0.413656
G3 X120.733 Y118.105 I.356 J1.331 E.00762
G1 X135.169 Y118.101 E.34604
G3 X135.51 Y118.135 I-.006 J1.756 E.00821
; LINE_WIDTH: 0.482382
G3 X136.623 Y119.133 I-.304 J1.459 E.04433
; LINE_WIDTH: 0.414761
G3 X136.686 Y119.428 I-1.538 J.483 E.00728
G1 X136.7 Y119.69 E.00631
G1 X136.7 Y136.31 E.39955
G3 X136.679 Y136.632 I-2.153 J.018 E.00776
G1 X136.666 Y136.703 E.00173
; LINE_WIDTH: 0.482029
G3 X135.653 Y137.829 I-1.458 J-.293 E.04496
G1 X135.627 Y137.836 E.00074
; LINE_WIDTH: 0.413605
G3 X135.438 Y137.878 I-.742 J-2.874 E.00466
G1 X135.11 Y137.9 E.00787
G1 X120.89 Y137.899 E.34081
G3 X120.59 Y137.882 I-.009 J-2.548 E.0072
G1 X120.52 Y137.87 E.00171
; LINE_WIDTH: 0.482186
G3 X119.377 Y136.867 I.28 J-1.472 E.04514
; LINE_WIDTH: 0.436908
G3 X119.314 Y136.572 I1.347 J-.443 E.0077
G1 X119.3 Y136.31 E.00667
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.936 E.00898
; WIPE_START
G1 F7888.83
G1 X119.3 Y133.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y128.947 Z3.64 F42000
G1 X126.764 Y127.489 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.05441
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.131 Y125.815 I.25 J3.156 E.01037
G1 X128.263 Y125.821 E.00347
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26801
G1 X127.737 Y125.821 E-.12558
G1 X128.131 Y125.815 E-.2036
G1 X128.263 Y125.821 E-.06823
G1 X128.259 Y126.004 E-.09459
; WIPE_END
M73 P69 R5
G1 E-.04 F1800
M204 S10000
G1 X129.425 Y127.489 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00498
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.485 Y127.489 E.03175
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.09481
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11209
G1 X129.525 Y126.232 E-.01389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.622 J-1.621 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.16971
G1 X125.617 Y130.605 E-.16978
G1 X125.328 Y130.146 E-.20609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.425 Y131.871 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.236 Y131.949 E.00498
G3 X127.747 Y125.42 I-1.244 J-3.151 E.28445
G3 X128.144 Y125.414 I.242 J3.171 E.00969
G3 X129.543 Y131.81 I-.152 J3.384 E.2164
G1 X129.478 Y131.844 E.00178
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.236 Y131.949 E-.1004
G1 X128.754 Y132.105 E-.19239
G1 X128.422 Y132.164 E-.12839
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12837
G1 X127.533 Y132.154 E-.08197
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/42
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I1.039 J-.633 P1  F42000
G1 X119.745 Y119.369 Z3.64
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.764 Y119.294 E.00188
G3 X120.781 Y118.496 I1.154 J.423 E.03318
G1 X135.126 Y118.49 E.34962
G3 X136.31 Y119.695 I-.029 J1.212 E.04553
G1 X136.31 Y136.305 E.40481
G3 X135.108 Y137.51 I-1.217 J-.012 E.04595
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.308 I.008 J-1.213 E.04599
G1 X119.691 Y119.641 E.4062
G1 X119.734 Y119.427 E.0053
; WIPE_START
G1 F3000
M204 S6000
G1 X119.764 Y119.294 E-.05215
G1 X119.862 Y119.078 E-.09002
G1 X120.003 Y118.887 E-.09015
G1 X120.225 Y118.695 E-.11163
G1 X120.329 Y118.633 E-.04614
G1 X120.549 Y118.542 E-.09021
G1 X120.781 Y118.496 E-.09007
G1 X121.28 Y118.495 E-.18964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.527 Y126.091 Z3.8 F42000
G1 X119.375 Y137.703 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.374 Y137.7 E.00008
G3 X118.91 Y136.495 I1.33 J-1.204 E.0322
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.803 J.01 E.06633
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.196 J1.801 E.06421
G1 X137.09 Y136.497 E.41412
G3 X135.295 Y138.29 I-1.794 J-.001 E.06869
G1 X120.612 Y138.288 E.35785
G3 X119.567 Y137.884 I.092 J-1.791 E.02776
G1 X119.419 Y137.744 E.00496
; WIPE_START
G1 F3000
M204 S6000
G1 X119.374 Y137.7 E-.02391
G1 X119.165 Y137.421 E-.13234
G1 X119.014 Y137.101 E-.1347
G1 X118.929 Y136.761 E-.13295
G1 X118.91 Y136.495 E-.10154
G1 X118.91 Y135.877 E-.23456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
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


G1 X119.3 Y135.877 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414621
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39044
G1 X119.333 Y119.297 E.00805
; LINE_WIDTH: 0.481244
G3 X120.42 Y118.151 I1.458 J.294 E.04702
; LINE_WIDTH: 0.413427
G3 X120.733 Y118.105 I.403 J1.668 E.00761
G1 X135.135 Y118.101 E.345
G3 X135.483 Y118.13 I.023 J1.81 E.00839
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.48329
G3 X136.628 Y119.148 I-.36 J1.443 E.04315
; LINE_WIDTH: 0.414746
G3 X136.679 Y119.364 I-1.963 J.577 E.00535
G1 X136.7 Y119.69 E.00785
G1 X136.7 Y136.31 E.39953
G3 X136.678 Y136.634 I-2.146 J.018 E.00781
G1 X136.664 Y136.71 E.00187
; LINE_WIDTH: 0.481909
G3 X135.805 Y137.771 I-1.459 J-.304 E.0401
G1 X135.61 Y137.84 E.00587
; LINE_WIDTH: 0.41378
G3 X135.129 Y137.9 I-.467 J-1.809 E.01165
G1 X120.89 Y137.899 E.34142
G3 X120.527 Y137.872 I-.018 J-2.254 E.00874
G1 X120.434 Y137.852 E.00227
; LINE_WIDTH: 0.483678
G3 X119.545 Y137.22 I.367 J-1.458 E.0317
G1 X119.466 Y137.084 E.00448
G1 X119.374 Y136.857 E.00694
; LINE_WIDTH: 0.43711
G3 X119.3 Y136.329 I1.56 J-.486 E.01364
G1 X119.3 Y136.315 E.00036
; LINE_WIDTH: 0.414621
G1 X119.3 Y135.937 E.00907
; WIPE_START
G1 F7888.836
G1 X119.3 Y133.937 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y128.948 Z3.8 F42000
G1 X126.764 Y127.489 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P70 R5
G1 X128.257 Y126.064 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.137 Y125.815 I.25 J3.146 E.0105
G1 X128.263 Y125.821 E.00333
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26799
G1 X127.737 Y125.821 E-.1256
G1 X128.137 Y125.815 E-.20638
G1 X128.263 Y125.821 E-.06542
G1 X128.259 Y126.004 E-.09461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.414 Y127.489 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00468
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.474 Y127.489 E.03205
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.09045
G1 X129.236 Y126.07 E-.53923
G1 X129.495 Y126.211 E-.11213
G1 X129.534 Y126.238 E-.0182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27188
G1 X130.976 Y128.521 E-.1198
G1 X130.985 Y128.651 E-.06499
G1 X130.989 Y128.8 E-.07425
G1 X130.976 Y129.079 E-.1392
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.621 J-1.62 E.04534
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.668 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27329
G1 X127.743 Y131.536 E-.12588
G1 X128.257 Y131.536 E-.26601
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.1698
G1 X125.617 Y130.605 E-.16967
G1 X125.328 Y130.146 E-.20616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.414 Y131.877 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.236 Y131.949 E.00467
G3 X127.747 Y125.42 I-1.244 J-3.151 E.28446
G3 X128.149 Y125.414 I.242 J3.173 E.00982
G3 X129.543 Y131.81 I-.158 J3.384 E.21626
G1 X129.467 Y131.849 E.00209
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.236 Y131.949 E-.09561
G1 X128.754 Y132.105 E-.19237
G1 X128.422 Y132.164 E-.1284
G1 X128.084 Y132.189 E-.12849
G1 X127.747 Y132.18 E-.12838
G1 X127.52 Y132.152 E-.08675
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/42
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I1.039 J-.634 P1  F42000
G1 X119.729 Y119.398 Z3.8
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.81 Y119.185 E.00555
G3 X120.781 Y118.496 I1.108 J.532 E.0303
G1 X135.159 Y118.491 E.35042
G3 X136.31 Y119.695 I-.063 J1.212 E.04473
G1 X136.31 Y136.305 E.40481
G3 X135.105 Y137.51 I-1.213 J-.008 E.04605
G1 X120.895 Y137.51 E.34632
G3 X119.69 Y136.305 I.019 J-1.224 E.04594
G1 X119.691 Y119.641 E.40614
G3 X119.717 Y119.456 I1.226 J.076 E.00455
; WIPE_START
G1 F3000
M204 S6000
G1 X119.81 Y119.185 E-.10907
G1 X120.003 Y118.887 E-.13478
G1 X120.179 Y118.728 E-.09011
G1 X120.383 Y118.606 E-.09016
G1 X120.495 Y118.559 E-.04612
G1 X120.781 Y118.496 E-.11156
G1 X121.25 Y118.495 E-.17819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.509 Y126.092 Z3.96 F42000
G1 X119.375 Y137.703 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S5000
G1 X119.376 Y137.697 E.00015
G3 X118.91 Y136.495 I1.337 J-1.209 E.03213
G1 X118.91 Y119.505 E.41406
G3 X120.612 Y117.712 I1.796 J0 E.06646
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.2 J1.804 E.06418
G1 X137.09 Y136.495 E.41406
G3 X135.295 Y138.29 I-1.791 J.004 E.06877
G1 X120.612 Y138.288 E.35785
G3 X119.637 Y137.935 I.101 J-1.8 E.02561
G1 X119.42 Y137.743 E.00706
; WIPE_START
G1 F3000
M204 S6000
G1 X119.376 Y137.697 E-.02441
G1 X119.192 Y137.463 E-.11301
G1 X119.015 Y137.103 E-.15244
G1 X118.936 Y136.799 E-.11922
G1 X118.91 Y136.495 E-.11621
G1 X118.91 Y135.877 E-.23472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.96
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
            G0 Z3.96 F4000
            G39.3 S1
            G0 Z3.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.3 Y135.877 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414617
G1 F1824
M204 S6000
G1 X119.301 Y119.631 E.39042
G3 X119.33 Y119.317 I2.106 J.038 E.00758
G1 X119.334 Y119.297 E.00049
; LINE_WIDTH: 0.481793
G3 X120.049 Y118.302 I1.46 J.295 E.03572
G1 X120.373 Y118.164 E.00994
; LINE_WIDTH: 0.413892
G3 X120.733 Y118.105 I.426 J1.479 E.00879
G1 X135.169 Y118.101 E.34626
G3 X135.483 Y118.13 I-.004 J1.754 E.00756
G1 X135.569 Y118.149 E.00211
; LINE_WIDTH: 0.483512
G3 X136.626 Y119.143 I-.362 J1.444 E.04303
; LINE_WIDTH: 0.41479
G3 X136.686 Y119.425 I-1.537 J.473 E.00694
G1 X136.7 Y119.69 E.00639
G1 X136.7 Y136.31 E.39958
G3 X136.672 Y136.673 I-2.108 J.021 E.00877
G1 X136.66 Y136.73 E.0014
; LINE_WIDTH: 0.482525
G3 X136.162 Y137.55 I-1.443 J-.315 E.02769
G1 X135.905 Y137.723 E.00877
G1 X135.628 Y137.836 E.00848
; LINE_WIDTH: 0.413599
G3 X135.443 Y137.878 I-.929 J-3.658 E.00453
G1 X135.11 Y137.9 E.00801
G1 X120.89 Y137.899 E.3408
M73 P71 R5
G3 X120.59 Y137.882 I-.008 J-2.566 E.0072
G1 X120.525 Y137.871 E.0016
; LINE_WIDTH: 0.482049
G3 X119.375 Y136.862 I.274 J-1.472 E.04542
; LINE_WIDTH: 0.437011
G3 X119.322 Y136.639 I2.136 J-.628 E.00585
G1 X119.3 Y136.31 E.00839
; LINE_WIDTH: 0.414617
G1 X119.3 Y135.937 E.00896
; WIPE_START
G1 F7888.911
G1 X119.3 Y133.937 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y128.948 Z3.96 F42000
G1 X126.764 Y127.489 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
M73 P71 R4
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1824
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.13 Y125.815 I.254 J3.427 E.01034
G1 X128.263 Y125.821 E.00349
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26797
G1 X127.737 Y125.821 E-.12561
G1 X128.13 Y125.815 E-.20319
G1 X128.263 Y125.821 E-.0686
G1 X128.258 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.402 Y127.489 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y127.489 E.00437
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.462 Y127.489 E.03235
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.08605
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.544 Y126.245 E-.02269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.295 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21335
G1 X130.796 Y129.072 E-.0899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.864 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.16971
G1 X125.617 Y130.605 E-.16978
G1 X125.328 Y130.146 E-.2061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1824
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13882
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.402 Y131.882 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X129.237 Y131.952 E.00436
G3 X127.747 Y125.42 I-1.246 J-3.152 E.28462
G3 X128.15 Y125.414 I.248 J3.652 E.00984
G3 X129.545 Y131.813 I-.159 J3.386 E.21632
G1 X129.456 Y131.856 E.0024
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.952 E-.09079
G1 X128.754 Y132.105 E-.19249
G1 X128.422 Y132.164 E-.12842
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12838
G1 X127.508 Y132.151 E-.09144
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/42
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I1.039 J-.634 P1  F42000
G1 X119.729 Y119.399 Z3.96
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S5000
G1 X119.807 Y119.183 E.00559
G3 X120.781 Y118.496 I1.097 J.521 E.03038
G1 X135.129 Y118.491 E.34969
G3 X136.31 Y119.695 I-.032 J1.212 E.04545
G1 X136.31 Y136.305 E.40481
G3 X135.108 Y137.51 I-1.232 J-.027 E.0458
G1 X120.895 Y137.51 E.34638
G3 X119.69 Y136.305 I.019 J-1.224 E.04594
G1 X119.691 Y119.641 E.40614
G3 X119.715 Y119.457 I1.213 J.064 E.00451
; WIPE_START
G1 F3000
M204 S6000
G1 X119.807 Y119.183 E-.10982
G1 X120.003 Y118.887 E-.13495
G1 X120.179 Y118.728 E-.09011
G1 X120.382 Y118.606 E-.08977
G1 X120.55 Y118.542 E-.06839
G1 X120.781 Y118.496 E-.08977
G1 X121.248 Y118.495 E-.1772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.507 Y126.092 Z4.12 F42000
G1 X119.376 Y137.704 Z4.12
M73 P72 R4
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S5000
G1 X119.379 Y137.697 E.00018
G3 X118.91 Y136.495 I1.34 J-1.215 E.03215
G1 X118.91 Y119.505 E.41406
G3 X120.612 Y117.712 I1.794 J-.001 E.06647
G1 X135.475 Y117.719 E.36223
G3 X137.09 Y119.505 I-.2 J1.805 E.06418
G1 X137.09 Y136.495 E.41406
G3 X135.295 Y138.29 I-1.802 J-.007 E.06866
G1 X120.611 Y138.288 E.35785
G3 X119.638 Y137.932 I.107 J-1.806 E.02562
G1 X119.421 Y137.743 E.00702
; WIPE_START
G1 F3000
M204 S6000
G1 X119.379 Y137.697 E-.02392
G1 X119.212 Y137.495 E-.09925
G1 X119.029 Y137.14 E-.15184
G1 X118.936 Y136.802 E-.13325
G1 X118.91 Y136.495 E-.11718
G1 X118.91 Y135.877 E-.23455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.12
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
            G0 Z4.12 F4000
            G39.3 S1
            G0 Z4.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.367 Y136.84 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.415255
G1 F1948
M204 S6000
G3 X119.314 Y136.577 I1.508 J-.441 E.00645
G1 X119.3 Y136.31 E.00644
G1 X119.301 Y119.631 E.4015
G3 X119.33 Y119.317 I2.109 J.038 E.00759
G1 X119.334 Y119.297 E.00049
; LINE_WIDTH: 0.481011
G3 X119.915 Y118.39 I1.465 J.299 E.0311
G1 X120.184 Y118.233 E.0088
G1 X120.422 Y118.15 E.00712
; LINE_WIDTH: 0.414166
G3 X120.733 Y118.105 I.402 J1.677 E.00755
G1 X120.881 Y118.101 E.00355
G3 X123.914 Y118.101 I1.524 J127.799 E.0728
; WIPE_START
G1 F7898.28
G1 X121.914 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.545 Y118.24 Z4.12 F42000
G1 X131.641 Y118.278 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X131.286 Y117.924 E.01223
G1 X130.741 Y117.924
G1 X131.095 Y118.278 E.01222
G1 X130.55 Y118.278
G1 X130.195 Y117.924 E.01222
G1 X129.65 Y117.924
G1 X130.004 Y118.278 E.01222
G1 X129.459 Y118.278
G1 X129.104 Y117.924 E.01222
G1 X128.559 Y117.924
G1 X128.914 Y118.278 E.01221
G1 X128.368 Y118.278
G1 X128.014 Y117.924 E.01221
G1 X127.468 Y117.924
G1 X127.823 Y118.278 E.01221
G1 X127.277 Y118.278
G1 X126.923 Y117.924 E.01221
G1 X126.378 Y117.924
G1 X126.732 Y118.278 E.01221
G1 X126.186 Y118.278
G1 X125.832 Y117.924 E.0122
G1 X125.287 Y117.924
G1 X125.641 Y118.278 E.0122
G1 X125.096 Y118.278
G1 X124.742 Y117.924 E.0122
G1 X124.196 Y117.924
G1 X124.55 Y118.278 E.0122
; WIPE_START
M204 S6000
G1 X124.196 Y117.924 E-.19015
G1 X124.742 Y117.924 E-.20723
G1 X125.096 Y118.278 E-.19019
G1 X125.549 Y118.278 E-.17244
; WIPE_END
G1 E-.04
M204 S10000
G1 X131.599 Y117.904 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336354
G1 F1948
M204 S6000
G1 X131.918 Y118.065 E.00681
G1 X131.928 Y118.147 E.00157
; LINE_WIDTH: 0.316143
G1 X131.855 Y118.197 E.00157
; LINE_WIDTH: 0.276382
G1 X131.782 Y118.247 E.00135
; LINE_WIDTH: 0.236622
G1 X131.71 Y118.298 E.00113
; WIPE_START
G1 F14830.523
G1 X131.782 Y118.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.157 Y117.91 Z4.12 F42000
G1 X124.043 Y117.905 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.197992
G1 F1948
M204 S6000
G1 X124.002 Y118.003 E.0011
G1 X124.002 Y118.297 E.00304
; WIPE_START
G1 F15000
G1 X124.002 Y118.003 E-.55808
G1 X124.043 Y117.905 E-.20192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.673 Y118.091 Z4.12 F42000
G1 X132.086 Y118.101 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.415388
G1 F1948
M204 S6000
G1 X135.138 Y118.101 E.07348
G3 X135.483 Y118.13 I.021 J1.801 E.00835
G1 X135.569 Y118.149 E.00212
; LINE_WIDTH: 0.483634
G3 X136.623 Y119.133 I-.362 J1.445 E.04274
; LINE_WIDTH: 0.414815
G3 X136.686 Y119.423 I-1.535 J.483 E.00715
G1 X136.7 Y119.69 E.00643
G1 X136.7 Y136.31 E.3996
G1 X136.66 Y136.732 E.0102
; LINE_WIDTH: 0.481978
G3 X135.667 Y137.823 I-1.455 J-.326 E.04366
G1 X135.576 Y137.849 E.00267
; LINE_WIDTH: 0.413676
G3 X135.129 Y137.9 I-.431 J-1.82 E.01083
G1 X120.89 Y137.899 E.34133
G3 X120.432 Y137.851 I-.023 J-2.018 E.01107
; LINE_WIDTH: 0.483436
G3 X119.373 Y136.858 I.361 J-1.446 E.04304
G1 X119.367 Y136.84 E.00054
; WIPE_START
G1 F6680.032
G1 X119.373 Y136.858 E-.00951
G1 X119.534 Y137.203 E-.18874
G1 X119.756 Y137.475 E-.17417
G1 X120.057 Y137.703 E-.18715
G1 X120.241 Y137.79 E-.10117
G1 X120.432 Y137.851 E-.09925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.412 Y131.339 Z4.12 F42000
G1 X126.764 Y127.489 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1948
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1948
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1948
M204 S6000
G1 X127.743 Y126.064 E.0135
M73 P73 R4
G1 X127.737 Y125.821 E.00639
G3 X128.136 Y125.815 I.254 J3.408 E.01048
G1 X128.263 Y125.821 E.00335
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26798
G1 X127.737 Y125.821 E-.12561
G1 X128.136 Y125.815 E-.20588
G1 X128.263 Y125.821 E-.06591
G1 X128.258 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.391 Y127.489 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G1 X129.236 Y127.489 E.00409
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.451 Y127.489 E.03263
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.08196
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.553 Y126.251 E-.02678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.864 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21441
G1 X125.913 Y130.94 E-.16972
G1 X125.617 Y130.605 E-.16972
G1 X125.328 Y130.146 E-.20615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1948
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.393 Y131.891 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1948
M204 S5000
G1 X129.078 Y132.01 E.0082
G3 X127.747 Y125.42 I-1.087 J-3.21 E.2805
G3 X128.156 Y125.415 I.248 J3.638 E.00997
G3 X129.443 Y131.863 I-.164 J3.385 E.21895
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.078 Y132.01 E-.14945
G1 X128.754 Y132.105 E-.12826
G1 X128.422 Y132.164 E-.12837
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12838
G1 X127.493 Y132.149 E-.09707
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/42
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I1.039 J-.633 P1  F42000
G1 X119.728 Y119.398 Z4.12
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.728 Y119.406 E.00019
G2 X119.69 Y119.695 I1.179 J.301 E.00712
G1 X119.69 Y136.305 E.40481
G2 X120.895 Y137.51 I1.237 J-.032 E.04581
G1 X135.159 Y137.509 E.34765
G2 X136.31 Y136.305 I-.063 J-1.212 E.04472
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.295 Y138.29 I-1.789 J-.092 E.06642
G1 X120.611 Y138.288 E.35787
G3 X118.91 Y136.495 I.101 J-1.8 E.06638
G1 X118.91 Y119.505 E.41407
G3 X120.612 Y117.712 I1.803 J.008 E.06638
G1 X124.84 Y117.71 E.10304
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.784 Y119.238 I.014 J1.217 E.0345
G1 X119.748 Y119.342 E.00268
; WIPE_START
G1 F3000
M204 S6000
G1 X119.728 Y119.406 E-.02569
G1 X119.69 Y119.695 E-.11068
G1 X119.69 Y121.336 E-.62363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.28
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
            G0 Z4.28 F4000
            G39.3 S1
            G0 Z4.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.333 Y119.297 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482033
G1 F1707
M204 S6000
G3 X120.415 Y118.153 I1.472 J.308 E.0469
; LINE_WIDTH: 0.414658
G3 X120.871 Y118.101 I.444 J1.886 E.01107
G1 X124.64 Y118.1 E.09057
; WIPE_START
G1 F7888.066
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.414535
G1 F1707
M204 S6000
G1 X119.329 Y119.322 E.0006
G2 X119.3 Y119.69 I2.102 J.348 E.00889
G1 X119.305 Y136.485 E.40351
G2 X119.351 Y136.776 I1.634 J-.107 E.0071
; LINE_WIDTH: 0.481902
G2 X120.492 Y137.865 I1.436 J-.362 E.04704
; LINE_WIDTH: 0.414049
G1 X120.529 Y137.873 E.00091
G2 X120.89 Y137.899 I.343 J-2.237 E.0087
G1 X135.345 Y137.89 E.34686
G2 X135.564 Y137.852 I-.097 J-1.228 E.00532
; LINE_WIDTH: 0.481664
G1 X135.7 Y137.812 E.00402
G2 X136.658 Y136.734 I-.487 J-1.398 E.04259
; LINE_WIDTH: 0.412096
G1 X136.683 Y136.61 E.00302
G2 X136.699 Y136.31 I-2.715 J-.296 E.00718
G1 X136.694 Y119.524 E.40073
G2 X136.666 Y119.292 I-3.187 J.27 E.00557
; LINE_WIDTH: 0.481348
G2 X135.555 Y118.145 I-1.467 J.309 E.04756
; LINE_WIDTH: 0.415608
G2 X135.115 Y118.1 I-.424 J1.976 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.399
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z4.28 F42000
G1 X126.764 Y127.489 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
M73 P74 R4
G1 X127.737 Y125.821 E.00639
G3 X128.141 Y125.815 I.253 J3.394 E.01061
G1 X128.263 Y125.821 E.00322
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26798
G1 X127.737 Y125.821 E-.12561
G1 X128.141 Y125.815 E-.20857
G1 X128.263 Y125.821 E-.06322
G1 X128.258 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.38 Y127.489 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y127.489 E.00378
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.44 Y127.489 E.03294
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.0775
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.563 Y126.258 E-.03123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.864 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.16979
G1 X125.617 Y130.605 E-.16978
G1 X125.328 Y130.146 E-.20607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13885
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.381 Y131.895 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X129.078 Y132.01 E.00789
G3 X127.747 Y125.42 I-1.087 J-3.21 E.2805
G3 X128.161 Y125.415 I.248 J3.627 E.0101
G3 X129.433 Y131.867 I-.169 J3.385 E.21908
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.078 Y132.01 E-.14552
G1 X128.754 Y132.105 E-.12822
G1 X128.422 Y132.164 E-.12839
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12836
G1 X127.483 Y132.147 E-.10104
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/42
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I1.04 J-.633 P1  F42000
G1 X119.728 Y119.4 Z4.28
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.728 Y119.405 E.00014
G2 X119.69 Y119.694 I1.179 J.301 E.0071
G1 X119.69 Y136.308 E.40491
G2 X120.895 Y137.51 I1.232 J-.03 E.0458
G1 X135.159 Y137.509 E.34765
G2 X136.31 Y136.305 I-.063 J-1.212 E.04473
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.19 J1.795 E.06199
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.794 J-.096 E.06633
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.495 I.103 J-1.8 E.06633
G1 X118.912 Y119.412 E.41633
G3 X120.611 Y117.712 I1.794 J.094 E.06417
G1 X124.84 Y117.71 E.10306
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.784 Y119.238 I.014 J1.217 E.0345
G1 X119.747 Y119.343 E.00272
; WIPE_START
G1 F3000
M204 S6000
G1 X119.728 Y119.405 E-.02483
G1 X119.69 Y119.694 E-.11047
G1 X119.69 Y121.337 E-.6247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.44
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
            G0 Z4.44 F4000
            G39.3 S1
            G0 Z4.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.335 Y119.29 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482026
G1 F1707
M204 S6000
G3 X120.414 Y118.153 I1.466 J.311 E.04669
; LINE_WIDTH: 0.414681
G3 X120.871 Y118.101 I.433 J1.802 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.573
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.335 Y119.29 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.413308
G1 F1707
M204 S6000
G1 X119.329 Y119.318 E.00068
G2 X119.301 Y119.687 I2.121 J.348 E.00888
G1 X119.3 Y136.329 E.39855
G2 X119.342 Y136.743 I1.984 J.008 E.00998
; LINE_WIDTH: 0.481661
G2 X120.465 Y137.859 I1.446 J-.331 E.04722
; LINE_WIDTH: 0.41415
G1 X120.569 Y137.879 E.00254
G2 X120.89 Y137.899 I.304 J-2.28 E.00773
G1 X135.169 Y137.899 E.34273
G1 X135.363 Y137.888 E.00467
G1 X135.574 Y137.85 E.00514
; LINE_WIDTH: 0.480959
G1 X135.663 Y137.825 E.00262
G2 X136.669 Y136.686 I-.451 J-1.413 E.04502
; LINE_WIDTH: 0.412112
G2 X136.699 Y136.31 I-2.06 J-.351 E.00902
G1 X136.694 Y119.523 E.40074
G2 X136.653 Y119.239 I-1.294 J.042 E.00688
; LINE_WIDTH: 0.482283
G1 X136.61 Y119.092 E.00433
G2 X135.556 Y118.145 I-1.401 J.5 E.04181
; LINE_WIDTH: 0.41561
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.372
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z4.44 F42000
G1 X126.764 Y127.489 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P75 R4
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.666 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12563
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.368 Y127.489 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y127.489 E.00347
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.428 Y127.489 E.03325
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.07303
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11212
G1 X129.572 Y126.264 E-.03563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21335
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.864 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.16976
G1 X125.617 Y130.605 E-.16977
G1 X125.328 Y130.146 E-.20611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.369 Y131.9 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X129.078 Y132.01 E.00757
G3 X127.747 Y125.42 I-1.087 J-3.21 E.2805
G3 X128.166 Y125.415 I.247 J3.621 E.01022
G3 X129.422 Y131.873 I-.174 J3.385 E.21926
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.078 Y132.01 E-.14071
G1 X128.754 Y132.105 E-.1282
G1 X128.422 Y132.164 E-.1284
G1 X128.084 Y132.189 E-.12849
G1 X127.747 Y132.18 E-.12836
G1 X127.47 Y132.146 E-.10584
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/42
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I1.04 J-.632 P1  F42000
G1 X119.727 Y119.401 Z4.44
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.728 Y119.404 E.00007
G2 X119.69 Y119.692 I1.179 J.303 E.00712
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.209 J-.007 E.04603
G1 X135.161 Y137.509 E.34768
G2 X136.31 Y136.308 I-.077 J-1.224 E.04452
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.06189
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.797 J-.1 E.0663
G1 X120.611 Y138.288 E.35792
G3 X118.91 Y136.497 I.095 J-1.794 E.06637
G1 X118.91 Y119.503 E.41418
G3 X120.612 Y117.712 I1.796 J.003 E.0664
G1 X124.84 Y117.71 E.10304
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.784 Y119.238 I.014 J1.217 E.03451
G1 X119.747 Y119.344 E.00274
; WIPE_START
G1 F3000
M204 S6000
G1 X119.728 Y119.404 E-.02375
G1 X119.69 Y119.692 E-.11068
G1 X119.69 Y121.339 E-.62558
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
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


M73 P76 R4
G1 X119.333 Y119.297 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481824
G1 F1707
M204 S6000
G3 X120.415 Y118.153 I1.476 J.311 E.04686
; LINE_WIDTH: 0.414668
G3 X120.871 Y118.101 I.447 J1.917 E.01107
G1 X124.64 Y118.1 E.09057
; WIPE_START
G1 F7887.857
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.412649
G1 F1707
M204 S6000
G1 X119.33 Y119.312 E.00036
G2 X119.301 Y119.685 I1.9 J.338 E.00896
G1 X119.301 Y136.329 E.3979
G2 X119.351 Y136.774 I1.718 J.035 E.01074
; LINE_WIDTH: 0.481838
G2 X120.492 Y137.865 I1.438 J-.361 E.04711
; LINE_WIDTH: 0.4141
G1 X120.534 Y137.873 E.00102
G2 X120.89 Y137.899 I.338 J-2.232 E.00858
G1 X135.172 Y137.899 E.34275
G1 X135.386 Y137.885 E.00514
G2 X135.578 Y137.85 I-.573 J-3.632 E.00467
; LINE_WIDTH: 0.481278
G2 X136.666 Y136.703 I-.369 J-1.441 E.0471
; LINE_WIDTH: 0.41204
G1 X136.69 Y136.54 E.00392
G2 X136.699 Y136.315 I-12.973 J-.618 E.00539
G1 X136.699 Y119.671 E.39726
G2 X136.665 Y119.287 I-2.205 J.002 E.00921
; LINE_WIDTH: 0.481428
G2 X135.555 Y118.145 I-1.465 J.313 E.04743
; LINE_WIDTH: 0.415616
G2 X135.115 Y118.1 I-.424 J1.973 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.237
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z4.6 F42000
G1 X126.764 Y127.489 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.664 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12563
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y127.489 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y127.489 E.00316
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.416 Y127.489 E.03356
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.06855
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11212
G1 X129.582 Y126.271 E-.04011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.6 F42000
M73 P76 R3
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
M73 P77 R3
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21335
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.16982
G1 X125.617 Y130.605 E-.16971
G1 X125.328 Y130.146 E-.20611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.357 Y131.905 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X129.078 Y132.01 E.00725
G3 X127.747 Y125.42 I-1.087 J-3.21 E.28047
G3 X128.171 Y125.415 I.247 J3.617 E.01035
G3 X129.41 Y131.878 I-.18 J3.384 E.21944
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.078 Y132.01 E-.13579
G1 X128.754 Y132.105 E-.1282
G1 X128.422 Y132.164 E-.12841
G1 X128.084 Y132.189 E-.12849
G1 X127.747 Y132.18 E-.12836
G1 X127.458 Y132.144 E-.11074
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/42
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I1.04 J-.631 P1  F42000
G1 X119.727 Y119.402 Z4.6
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.728 Y119.406 E.0001
G2 X119.69 Y119.695 I1.179 J.3 E.00711
G1 X119.69 Y136.305 E.40481
G2 X120.895 Y137.51 I1.21 J-.005 E.04608
G1 X135.131 Y137.509 E.34696
G2 X136.31 Y136.308 I-.053 J-1.231 E.04517
G1 X136.31 Y119.695 E.40488
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.19 J1.795 E.06198
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.794 J-.097 E.06633
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.096 J-1.794 E.06634
G1 X118.912 Y119.412 E.41639
G3 X120.61 Y117.712 I1.794 J.094 E.06413
G1 X124.84 Y117.71 E.1031
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.784 Y119.238 I.014 J1.217 E.0345
G1 X119.746 Y119.346 E.00279
; WIPE_START
G1 F3000
M204 S6000
G1 X119.728 Y119.406 E-.02411
G1 X119.69 Y119.695 E-.11062
G1 X119.69 Y121.34 E-.62527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.76
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
            G0 Z4.76 F4000
            G39.3 S1
            G0 Z4.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.333 Y119.294 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482026
G1 F1707
M204 S6000
G3 X120.414 Y118.153 I1.462 J.302 E.04684
; LINE_WIDTH: 0.414679
G3 X120.871 Y118.101 I.423 J1.709 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.63
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.294 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.412403
G1 F1707
M204 S6000
G2 X119.301 Y119.69 I2.34 J.39 E.0095
G1 X119.306 Y136.477 E.40105
G2 X119.348 Y136.764 I1.313 J-.046 E.00696
; LINE_WIDTH: 0.481613
G2 X120.492 Y137.866 I1.451 J-.363 E.04732
; LINE_WIDTH: 0.413758
G1 X120.569 Y137.879 E.00186
G2 X120.89 Y137.899 I.304 J-2.281 E.00773
G1 X135.139 Y137.9 E.34166
G1 X135.342 Y137.89 E.00487
G1 X135.564 Y137.852 E.0054
; LINE_WIDTH: 0.48115
G1 X135.767 Y137.787 E.006
G1 X135.951 Y137.698 E.00578
G2 X136.666 Y136.703 I-.755 J-1.298 E.03566
; LINE_WIDTH: 0.412252
G1 X136.69 Y136.54 E.00392
G2 X136.699 Y136.315 I-13.077 J-.623 E.00539
G1 X136.694 Y119.524 E.40101
G2 X136.643 Y119.204 I-1.293 J.042 E.00775
; LINE_WIDTH: 0.482851
G1 X136.61 Y119.092 E.00332
G2 X135.555 Y118.145 I-1.404 J.503 E.04186
; LINE_WIDTH: 0.415609
G2 X135.115 Y118.1 I-.424 J1.976 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.383
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z4.76 F42000
G1 X126.764 Y127.489 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.445 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.663 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
M73 P78 R3
G1 X127.737 Y125.821 E-.12563
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.344 Y127.489 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y127.489 E.00285
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.404 Y127.489 E.03387
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.06408
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11212
G1 X129.592 Y126.278 E-.04458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21337
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52975
G1 X129.842 Y130.111 E-.23025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.864 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.1698
G1 X125.617 Y130.605 E-.1697
G1 X125.328 Y130.146 E-.20614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13885
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.345 Y131.909 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X129.077 Y132.007 E.00694
G3 X127.747 Y125.42 I-1.085 J-3.209 E.28031
G3 X128.176 Y125.416 I.247 J3.617 E.01048
G3 X129.397 Y131.88 I-.185 J3.382 E.21955
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.077 Y132.007 E-.13071
G1 X128.754 Y132.105 E-.12817
G1 X128.422 Y132.164 E-.1284
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12836
G1 X127.444 Y132.143 E-.11587
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/42
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I1.041 J-.63 P1  F42000
G1 X119.728 Y119.404 Z4.76
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S5000
G2 X119.69 Y119.692 I1.179 J.303 E.00711
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.21 J-.007 E.04602
G1 X135.159 Y137.509 E.34765
G2 X136.31 Y136.308 I-.075 J-1.223 E.04456
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.789 J-.092 E.06638
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.495 I.103 J-1.8 E.06634
G1 X118.91 Y119.503 E.41412
G3 X120.61 Y117.712 I1.81 J.016 E.06621
G1 X124.84 Y117.71 E.1031
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.745 Y119.346 I.014 J1.217 E.03731
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.13326
G1 X119.69 Y121.342 E-.62674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.92
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
            G0 Z4.92 F4000
            G39.3 S1
            G0 Z4.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.333 Y119.297 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48188
G1 F1707
M204 S6000
G3 X120.414 Y118.152 I1.478 J.313 E.04686
; LINE_WIDTH: 0.414681
G3 X120.871 Y118.101 I.425 J1.746 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.591
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.413537
G1 F1707
M204 S6000
G1 X119.33 Y119.312 E.00036
G2 X119.301 Y119.685 I1.904 J.338 E.00898
G1 X119.3 Y136.329 E.39884
G2 X119.343 Y136.748 I1.979 J.009 E.01013
; LINE_WIDTH: 0.481647
G2 X120.472 Y137.861 I1.449 J-.341 E.04724
; LINE_WIDTH: 0.414134
G1 X120.568 Y137.879 E.00236
G2 X120.89 Y137.899 I.305 J-2.283 E.00774
G1 X135.169 Y137.899 E.34271
G1 X135.364 Y137.888 E.00467
G1 X135.574 Y137.85 E.00514
; LINE_WIDTH: 0.481397
G1 X135.657 Y137.827 E.00243
G2 X136.666 Y136.703 I-.459 J-1.427 E.04472
; LINE_WIDTH: 0.41204
G1 X136.69 Y136.54 E.00392
G2 X136.699 Y136.315 I-12.96 J-.617 E.00539
G1 X136.699 Y119.671 E.39726
G2 X136.665 Y119.287 I-2.202 J.002 E.00922
; LINE_WIDTH: 0.481449
G2 X135.556 Y118.145 I-1.465 J.313 E.04742
; LINE_WIDTH: 0.415619
G2 X135.115 Y118.1 I-.424 J1.975 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.175
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z4.92 F42000
G1 X126.764 Y127.489 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
M73 P79 R3
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.663 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12563
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.333 Y127.489 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y127.489 E.00255
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.393 Y127.489 E.03418
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.05962
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11212
G1 X129.601 Y126.284 E-.04904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.294 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27194
G1 X130.976 Y128.521 E-.11981
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21337
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.55 Y130.359 E.00753
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04532
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52975
G1 X129.842 Y130.111 E-.23025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21435
G1 X125.913 Y130.94 E-.16978
G1 X125.617 Y130.605 E-.16976
G1 X125.328 Y130.146 E-.20612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.333 Y131.914 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X129.077 Y132.007 E.00662
G3 X127.747 Y125.42 I-1.085 J-3.209 E.28032
G3 X128.182 Y125.416 I.247 J3.62 E.01061
G3 X129.391 Y131.884 I-.19 J3.382 E.2196
G1 X129.386 Y131.886 E.00015
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.077 Y132.007 E-.12593
G1 X128.754 Y132.105 E-.12814
G1 X128.422 Y132.164 E-.12842
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12836
G1 X127.432 Y132.141 E-.12067
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/42
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I1.041 J-.63 P1  F42000
G1 X119.726 Y119.405 Z4.92
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.728 Y119.406 E.00005
G2 X119.69 Y119.695 I1.179 J.3 E.00711
G1 X119.69 Y136.308 E.40488
G2 X120.895 Y137.51 I1.236 J-.034 E.04576
G1 X135.128 Y137.51 E.34689
G2 X136.31 Y136.305 I-.043 J-1.224 E.04537
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.19 J1.795 E.06198
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.794 J-.097 E.06633
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.114 J-1.81 E.06618
G1 X118.91 Y119.503 E.41418
G3 X120.612 Y117.712 I1.807 J.014 E.06628
G1 X124.84 Y117.71 E.10305
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.784 Y119.238 I.014 J1.217 E.0345
G1 X119.746 Y119.348 E.00286
; WIPE_START
G1 F3000
M204 S6000
G1 X119.728 Y119.406 E-.02306
G1 X119.69 Y119.695 E-.11061
G1 X119.69 Y121.343 E-.62634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.08
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
            G0 Z5.08 F4000
            G39.3 S1
            G0 Z5.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.292 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482012
G1 F1706
M204 S6000
G3 X120.414 Y118.153 I1.465 J.307 E.04676
; LINE_WIDTH: 0.41468
G3 X120.871 Y118.101 I.435 J1.821 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.598
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.292 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.412666
G1 F1706
M204 S6000
G1 X119.329 Y119.322 E.00073
G2 X119.301 Y119.69 I2.16 J.348 E.00884
G1 X119.301 Y136.329 E.3978
G2 X119.347 Y136.765 I1.965 J.013 E.0105
; LINE_WIDTH: 0.481589
G2 X120.492 Y137.866 I1.453 J-.365 E.04732
; LINE_WIDTH: 0.413722
G1 X120.568 Y137.879 E.00185
G2 X120.89 Y137.899 I.305 J-2.283 E.00774
G1 X135.136 Y137.9 E.34155
G1 X135.342 Y137.89 E.00494
G1 X135.565 Y137.852 E.00542
; LINE_WIDTH: 0.48193
G1 X135.658 Y137.827 E.00273
G2 X136.656 Y136.746 I-.455 J-1.422 E.04352
; LINE_WIDTH: 0.412253
G1 X136.683 Y136.61 E.00331
G2 X136.699 Y136.31 I-2.716 J-.296 E.00718
G1 X136.694 Y119.524 E.40089
G2 X136.653 Y119.239 I-1.294 J.042 E.00689
; LINE_WIDTH: 0.482287
M73 P80 R3
G1 X136.61 Y119.092 E.00433
G2 X135.555 Y118.145 I-1.401 J.5 E.04181
; LINE_WIDTH: 0.415608
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.408
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.08 F42000
G1 X126.764 Y127.489 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.664 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12562
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.321 Y127.489 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00224
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.381 Y127.489 E.03449
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.05519
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.611 Y126.291 E-.05355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27188
G1 X130.976 Y128.521 E-.1198
G1 X130.985 Y128.651 E-.06499
G1 X130.989 Y128.8 E-.07425
G1 X130.976 Y129.079 E-.1392
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.08 F42000
G1 Z4.68
M73 P81 R3
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.1698
G1 X125.617 Y130.605 E-.16971
G1 X125.328 Y130.146 E-.20607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.321 Y131.919 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.077 Y132.007 E.00631
G3 X127.747 Y125.42 I-1.085 J-3.209 E.28031
G3 X128.187 Y125.416 I.247 J3.623 E.01073
G3 X129.391 Y131.884 I-.195 J3.382 E.21949
G1 X129.374 Y131.892 E.00046
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.077 Y132.007 E-.12111
G1 X128.754 Y132.105 E-.12816
G1 X128.422 Y132.164 E-.1284
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12836
G1 X127.419 Y132.139 E-.12549
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/42
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I1.042 J-.629 P1  F42000
G1 X119.726 Y119.406 Z5.08
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.692 E.00705
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.232 J-.03 E.0458
G1 X135.159 Y137.509 E.34765
G2 X136.31 Y136.308 I-.063 J-1.212 E.04466
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.295 Y138.29 I-1.789 J-.092 E.06644
G1 X120.612 Y138.288 E.35784
G3 X118.91 Y136.495 I.096 J-1.796 E.06644
G1 X118.91 Y119.503 E.41412
G3 X120.612 Y117.712 I1.795 J.002 E.0664
G1 X124.84 Y117.71 E.10305
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.744 Y119.349 I.014 J1.217 E.03738
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.13227
G1 X119.69 Y121.344 E-.62773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.24
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
            G0 Z5.24 F4000
            G39.3 S1
            G0 Z5.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.335 Y119.287 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482061
G1 F1706
M204 S6000
G3 X120.415 Y118.153 I1.465 J.313 E.04662
; LINE_WIDTH: 0.414679
G3 X120.871 Y118.101 I.436 J1.825 E.01107
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.622
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.335 Y119.287 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.413551
G1 F1706
M204 S6000
G1 X119.33 Y119.312 E.00061
G2 X119.301 Y119.685 I1.903 J.338 E.00898
G1 X119.3 Y136.329 E.39885
G2 X119.344 Y136.748 I1.872 J.016 E.01012
; LINE_WIDTH: 0.481461
G2 X120.492 Y137.866 I1.447 J-.338 E.04782
; LINE_WIDTH: 0.413929
G2 X120.89 Y137.899 I.392 J-2.328 E.0096
G1 X135.345 Y137.889 E.34675
G2 X135.524 Y137.862 I-.162 J-1.653 E.00433
; LINE_WIDTH: 0.480294
G1 X135.664 Y137.824 E.0041
G2 X136.666 Y136.703 I-.456 J-1.416 E.04443
; LINE_WIDTH: 0.412039
G1 X136.67 Y136.683 E.00048
G2 X136.699 Y136.315 I-1.903 J-.333 E.00882
G1 X136.699 Y119.671 E.39726
G2 X136.665 Y119.287 I-2.207 J.002 E.00922
; LINE_WIDTH: 0.481438
G2 X135.556 Y118.145 I-1.465 J.313 E.04742
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.974 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.19
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.24 F42000
G1 X126.764 Y127.489 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.309 Y127.489 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00194
G1 X129.236 Y126.07 E.03727
M73 P82 R3
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.369 Y127.489 E.03479
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.0508
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.621 Y126.297 E-.05794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21442
G1 X125.913 Y130.94 E-.16971
G1 X125.617 Y130.605 E-.16984
G1 X125.328 Y130.146 E-.20603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.309 Y131.923 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.079 Y132.01 E.00599
G3 X127.747 Y125.42 I-1.086 J-3.21 E.28045
G3 X128.188 Y125.416 I.247 J3.625 E.01077
G3 X129.392 Y131.886 I-.196 J3.383 E.21955
G1 X129.364 Y131.899 E.00076
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.079 Y132.01 E-.11623
G1 X128.754 Y132.105 E-.12838
G1 X128.422 Y132.164 E-.12839
G1 X128.084 Y132.189 E-.12848
G1 X127.747 Y132.18 E-.12836
G1 X127.411 Y132.138 E-.12843
G1 X127.407 Y132.137 E-.00172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/42
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I1.042 J-.629 P1  F42000
G1 X119.725 Y119.409 Z5.24
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.695 E.00704
G1 X119.69 Y136.305 E.40481
G2 X120.895 Y137.51 I1.21 J-.005 E.04608
G1 X135.125 Y137.51 E.34681
G2 X136.31 Y136.305 I-.045 J-1.229 E.0454
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.789 J-.092 E.06638
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.096 J-1.794 E.06634
G1 X118.91 Y119.503 E.41418
G3 X120.612 Y117.712 I1.796 J.003 E.06639
G1 X124.84 Y117.71 E.10305
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.743 Y119.352 I.014 J1.217 E.03745
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.695 E-.13208
G1 X119.69 Y121.347 E-.62792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
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


G1 X119.333 Y119.297 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481771
G1 F1706
M204 S6000
G3 X120.414 Y118.152 I1.47 J.305 E.04688
; LINE_WIDTH: 0.414692
G3 X120.871 Y118.101 I.44 J1.879 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.363
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.412651
G1 F1706
M204 S6000
G1 X119.329 Y119.322 E.0006
G2 X119.301 Y119.69 I2.157 J.348 E.00884
G1 X119.306 Y136.477 E.40132
G2 X119.348 Y136.765 I1.314 J-.046 E.00699
; LINE_WIDTH: 0.481492
G2 X120.498 Y137.867 I1.443 J-.355 E.04748
; LINE_WIDTH: 0.413683
G1 X120.568 Y137.879 E.0017
G2 X120.89 Y137.899 I.305 J-2.284 E.00776
G1 X135.133 Y137.9 E.34144
G1 X135.342 Y137.89 E.00501
G1 X135.565 Y137.852 E.00543
; LINE_WIDTH: 0.482026
G1 X135.658 Y137.827 E.00272
G2 X136.655 Y136.75 I-.456 J-1.423 E.04339
; LINE_WIDTH: 0.412333
G1 X136.683 Y136.61 E.00342
G2 X136.699 Y136.31 I-2.718 J-.296 E.00718
G1 X136.694 Y119.523 E.40098
G2 X136.646 Y119.213 I-1.283 J.041 E.00753
; LINE_WIDTH: 0.482712
G1 X136.61 Y119.092 E.00357
G2 X135.556 Y118.145 I-1.401 J.5 E.04185
; LINE_WIDTH: 0.41561
G2 X135.115 Y118.1 I-.424 J1.976 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.364
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.4 F42000
G1 X126.764 Y127.489 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
M73 P82 R2
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P83 R2
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.664 E.01383
G1 X128.258 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12563
G1 X128.263 Y125.821 E-.27172
G1 X128.258 Y126.004 E-.09464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.297 Y127.489 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.0016
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.556 J2.661 E.04668
G1 X129.357 Y127.489 E.03512
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.04599
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.631 Y126.304 E-.06275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.295 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.0899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.624 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52975
G1 X129.842 Y130.111 E-.23025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21435
G1 X125.913 Y130.94 E-.16977
G1 X125.617 Y130.605 E-.16977
G1 X125.328 Y130.146 E-.20611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.296 Y131.93 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.237 Y131.952 E.00154
G3 X127.747 Y125.42 I-1.245 J-3.152 E.28455
G3 X128.193 Y125.417 I.248 J3.632 E.01089
G3 X129.545 Y131.813 I-.201 J3.383 E.21532
G1 X129.351 Y131.904 E.00523
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.952 E-.04674
G1 X128.754 Y132.105 E-.19249
G1 X128.422 Y132.164 E-.12838
G1 X128.084 Y132.189 E-.12849
G1 X127.747 Y132.18 E-.12836
G1 X127.411 Y132.138 E-.12843
G1 X127.393 Y132.134 E-.00711
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/42
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I1.042 J-.628 P1  F42000
G1 X119.725 Y119.411 Z5.4
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.695 E.00697
G1 X119.69 Y136.308 E.40487
G2 X120.892 Y137.51 I1.239 J-.036 E.04567
G1 X135.105 Y137.51 E.3464
G2 X136.31 Y136.308 I-.008 J-1.213 E.04598
G1 X136.31 Y119.695 E.40487
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.06189
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.795 J-.098 E.06632
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.098 J-1.795 E.06632
G1 X118.91 Y119.504 E.41415
G3 X120.612 Y117.712 I1.811 J.016 E.06629
G1 X124.84 Y117.71 E.10304
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09622
G2 X119.742 Y119.354 I.015 J1.217 E.0375
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.695 E-.13116
G1 X119.69 Y121.35 E-.62885
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.56
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
            G0 Z5.56 F4000
            G39.3 S1
            G0 Z5.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.292 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481997
G1 F1706
M204 S6000
G3 X120.414 Y118.152 I1.468 J.31 E.04675
; LINE_WIDTH: 0.41469
G3 X120.871 Y118.101 I.44 J1.884 E.01107
G1 X124.64 Y118.1 E.09059
; WIPE_START
G1 F7887.391
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.292 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.4136
G1 F1706
M204 S6000
G1 X119.329 Y119.322 E.00073
G2 X119.3 Y119.69 I2.093 J.348 E.00886
G1 X119.301 Y136.329 E.39878
G2 X119.348 Y136.765 I1.786 J.029 E.01055
; LINE_WIDTH: 0.481612
G2 X120.492 Y137.866 I1.44 J-.352 E.04734
; LINE_WIDTH: 0.413509
G2 X120.885 Y137.899 I.358 J-1.887 E.00946
G1 X135.292 Y137.894 E.34523
G2 X135.565 Y137.852 I-.087 J-1.483 E.00663
; LINE_WIDTH: 0.481108
G1 X135.658 Y137.827 E.0027
G2 X136.666 Y136.703 I-.448 J-1.417 E.04472
; LINE_WIDTH: 0.412028
G1 X136.67 Y136.683 E.00048
G2 X136.699 Y136.315 I-1.9 J-.333 E.00882
G1 X136.694 Y119.523 E.40078
G2 X136.666 Y119.292 I-2.957 J.244 E.00557
; LINE_WIDTH: 0.481344
G2 X135.556 Y118.145 I-1.466 J.309 E.04756
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.196
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.56 F42000
G1 X126.764 Y127.489 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.05441
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
M73 P84 R2
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.668 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26804
G1 X127.737 Y125.821 E-.1256
G1 X128.263 Y125.821 E-.27174
G1 X128.259 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.285 Y127.489 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.0013
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.345 Y127.489 E.03542
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.04164
G1 X129.236 Y126.07 E-.53923
G1 X129.495 Y126.211 E-.11208
G1 X129.64 Y126.311 E-.06704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27188
G1 X130.976 Y128.521 E-.11981
G1 X130.985 Y128.651 E-.06499
G1 X130.989 Y128.8 E-.07425
G1 X130.976 Y129.079 E-.1392
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.55 Y130.359 E.00753
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04532
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
M73 P85 R2
G1 X126.255 Y131.227 E-.21436
G1 X125.913 Y130.94 E-.16983
G1 X125.617 Y130.605 E-.16971
G1 X125.328 Y130.146 E-.2061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.285 Y131.935 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.237 Y131.951 E.00123
G3 X127.916 Y125.411 I-1.248 J-3.151 E.28887
G3 X128.199 Y125.417 I.084 J2.839 E.0069
G3 X129.544 Y131.811 I-.21 J3.383 E.21503
G1 X129.339 Y131.909 E.00553
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.951 E-.04194
G1 X128.918 Y132.063 E-.12845
G1 X128.589 Y132.138 E-.12839
G1 X128.253 Y132.18 E-.12845
G1 X127.916 Y132.189 E-.12836
G1 X127.578 Y132.164 E-.12849
G1 X127.382 Y132.129 E-.07591
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/42
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I1.043 J-.628 P1  F42000
G1 X119.725 Y119.414 Z5.56
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.692 E.00685
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.235 J-.032 E.04577
G1 X135.122 Y137.51 E.34674
G2 X136.31 Y136.308 I-.029 J-1.216 E.04553
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.06189
G1 X137.088 Y136.589 E.41864
G3 X135.297 Y138.29 I-1.8 J-.102 E.0663
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.096 J-1.794 E.06634
G1 X118.912 Y119.412 E.41639
G3 X120.61 Y117.712 I1.793 J.093 E.06413
G1 X124.84 Y117.71 E.1031
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.742 Y119.356 I.014 J1.217 E.03756
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.12938
G1 X119.69 Y121.352 E-.63062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.72
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
            G0 Z5.72 F4000
            G39.3 S1
            G0 Z5.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.29 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482116
G1 F1706
M204 S6000
G3 X120.414 Y118.152 I1.465 J.309 E.04672
; LINE_WIDTH: 0.414681
G3 X120.871 Y118.101 I.425 J1.747 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.59
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.29 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.412452
G1 F1706
M204 S6000
G1 X119.33 Y119.312 E.00054
G2 X119.301 Y119.685 I1.932 J.339 E.00895
G1 X119.301 Y136.329 E.39769
G2 X119.35 Y136.776 I2.014 J.008 E.01076
; LINE_WIDTH: 0.48175
G2 X120.483 Y137.864 I1.442 J-.368 E.0468
; LINE_WIDTH: 0.413713
G1 X120.567 Y137.879 E.00205
G2 X120.89 Y137.899 I.306 J-2.284 E.00776
G1 X135.13 Y137.9 E.34139
G1 X135.365 Y137.888 E.00564
G1 X135.575 Y137.85 E.00512
; LINE_WIDTH: 0.482303
G1 X135.657 Y137.826 E.00242
G2 X136.651 Y136.768 I-.458 J-1.426 E.04292
; LINE_WIDTH: 0.412365
G1 X136.676 Y136.65 E.00287
G2 X136.699 Y136.315 I-1.965 J-.302 E.00803
G1 X136.699 Y119.671 E.3976
G2 X136.647 Y119.217 I-1.714 J-.035 E.01095
; LINE_WIDTH: 0.482645
G1 X136.61 Y119.092 E.00371
G2 X135.556 Y118.145 I-1.401 J.5 E.04183
; LINE_WIDTH: 0.415621
G2 X135.115 Y118.1 I-.424 J1.974 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.142
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.72 F42000
G1 X126.764 Y127.489 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.669 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.274 Y127.489 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00101
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.334 Y127.489 E.03571
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.03743
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
G1 X129.65 Y126.317 E-.07131
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
M73 P86 R2
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27188
G1 X130.976 Y128.521 E-.11981
G1 X130.985 Y128.651 E-.06499
G1 X130.989 Y128.8 E-.07425
G1 X130.976 Y129.079 E-.1392
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.391 J-2.888 E.05439
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21431
G1 X125.915 Y130.942 E-.16848
G1 X125.617 Y130.605 E-.17107
G1 X125.328 Y130.146 E-.20613
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.274 Y131.94 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.237 Y131.951 E.00094
G3 X127.916 Y125.411 I-1.247 J-3.152 E.28884
G3 X128.204 Y125.417 I.084 J2.889 E.00702
G3 X129.544 Y131.812 I-.214 J3.383 E.21494
G1 X129.328 Y131.914 E.00584
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.951 E-.03734
G1 X128.918 Y132.063 E-.12837
G1 X128.589 Y132.138 E-.12847
G1 X128.253 Y132.18 E-.12843
G1 X127.916 Y132.189 E-.12836
G1 X127.578 Y132.164 E-.12848
G1 X127.37 Y132.127 E-.08054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/42
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I1.043 J-.627 P1  F42000
G1 X119.725 Y119.416 Z5.72
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.692 E.00679
G1 X119.69 Y136.308 E.40494
G2 X120.892 Y137.51 I1.232 J-.03 E.04573
G1 X135.105 Y137.51 E.3464
G2 X136.31 Y136.308 I-.027 J-1.232 E.04579
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.589 E.41864
G3 X135.295 Y138.29 I-1.8 J-.102 E.06635
G1 X120.611 Y138.288 E.35787
G3 X118.91 Y136.497 I.105 J-1.803 E.06627
G1 X118.912 Y119.412 E.41639
G3 X120.612 Y117.712 I1.794 J.094 E.06418
G1 X124.84 Y117.71 E.10305
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09622
G2 X119.741 Y119.358 I.015 J1.217 E.03762
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.12842
G1 X119.69 Y121.355 E-.63159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.88
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
            G0 Z5.88 F4000
            G39.3 S1
            G0 Z5.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.333 Y119.297 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481839
G1 F1706
M204 S6000
G3 X120.415 Y118.153 I1.472 J.308 E.04687
; LINE_WIDTH: 0.414656
G3 X120.871 Y118.101 I.44 J1.851 E.01106
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7888.092
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.41239
G1 F1706
M204 S6000
G1 X119.331 Y119.312 E.00035
G2 X119.301 Y119.685 I1.932 J.34 E.00896
G1 X119.301 Y136.329 E.39763
G2 X119.351 Y136.775 I1.695 J.038 E.01076
; LINE_WIDTH: 0.482798
G2 X120.432 Y137.851 I1.444 J-.369 E.04539
; LINE_WIDTH: 0.413679
G1 X120.552 Y137.876 E.00294
G2 X120.885 Y137.899 I.301 J-1.97 E.008
G1 X135.11 Y137.9 E.34102
G1 X135.426 Y137.88 E.00759
G1 X135.576 Y137.849 E.00367
; LINE_WIDTH: 0.482462
G1 X135.787 Y137.779 E.0063
G1 X135.951 Y137.698 E.00517
G2 X136.651 Y136.768 I-.754 J-1.297 E.03386
; LINE_WIDTH: 0.412191
G1 X136.676 Y136.648 E.00292
G2 X136.699 Y136.315 I-1.964 J-.3 E.00798
G1 X136.699 Y119.671 E.39742
G2 X136.664 Y119.287 I-2.203 J.002 E.00922
; LINE_WIDTH: 0.48143
G2 X135.556 Y118.145 I-1.463 J.311 E.04742
; LINE_WIDTH: 0.41562
G2 X135.115 Y118.1 I-.424 J1.975 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.157
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z5.88 F42000
G1 X126.764 Y127.489 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.445 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
M73 P87 R2
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.263 Y127.489 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00073
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04667
G1 X129.323 Y127.489 E.036
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.03331
G1 X129.236 Y126.07 E-.53922
G1 X129.495 Y126.211 E-.11213
G1 X129.659 Y126.323 E-.07534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.295 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.0899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21434
G1 X125.913 Y130.94 E-.16979
G1 X125.617 Y130.605 E-.16973
G1 X125.328 Y130.146 E-.20614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13884
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.263 Y131.945 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.237 Y131.952 E.00064
G3 X127.916 Y125.411 I-1.247 J-3.152 E.28881
G3 X128.209 Y125.417 I.084 J2.94 E.00715
G3 X129.544 Y131.812 I-.218 J3.382 E.21486
G1 X129.317 Y131.919 E.00612
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.237 Y131.952 E-.03274
G1 X128.918 Y132.063 E-.12846
G1 X128.589 Y132.138 E-.12843
G1 X128.253 Y132.18 E-.12844
G1 X127.916 Y132.189 E-.12837
G1 X127.413 Y132.139 E-.1921
G1 X127.357 Y132.126 E-.02146
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/42
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I1.043 J-.627 P1  F42000
G1 X119.725 Y119.419 Z5.88
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.692 E.00672
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.209 J-.007 E.04603
G1 X135.119 Y137.51 E.34667
G2 X136.31 Y136.308 I-.022 J-1.213 E.04564
G1 X136.31 Y119.692 E.40494
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.794 J-.096 E.06634
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.495 I.114 J-1.81 E.06624
G1 X118.91 Y119.504 E.41409
G3 X120.61 Y117.712 I1.795 J.001 E.06637
G1 X124.84 Y117.71 E.10309
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.74 Y119.361 I.014 J1.217 E.03769
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.12743
G1 X119.69 Y121.357 E-.63257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.04
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
            G0 Z6.04 F4000
            G39.3 S1
            G0 Z6.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.291 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482081
G1 F1706
M204 S6000
G3 X120.414 Y118.152 I1.465 J.309 E.04674
; LINE_WIDTH: 0.41468
G3 X120.871 Y118.101 I.425 J1.746 E.01108
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.602
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.291 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.414508
G1 F1706
M204 S6000
G1 X119.33 Y119.312 E.00053
G2 X119.3 Y119.685 I2.049 J.355 E.009
G1 X119.3 Y136.329 E.39986
G2 X119.347 Y136.759 I1.847 J.018 E.01043
; LINE_WIDTH: 0.48154
G2 X120.485 Y137.864 I1.443 J-.348 E.04729
; LINE_WIDTH: 0.413642
G1 X120.527 Y137.872 E.00103
G2 X120.89 Y137.899 I.343 J-2.147 E.00874
G1 X135.127 Y137.9 E.34125
G1 X135.341 Y137.891 E.00514
G1 X135.566 Y137.852 E.00547
; LINE_WIDTH: 0.480996
G1 X135.658 Y137.826 E.00267
G2 X136.666 Y136.703 I-.45 J-1.419 E.04471
; LINE_WIDTH: 0.412039
G1 X136.67 Y136.683 E.00048
G2 X136.699 Y136.315 I-1.887 J-.332 E.00882
G1 X136.699 Y119.671 E.39726
G2 X136.665 Y119.287 I-2.205 J.002 E.00922
; LINE_WIDTH: 0.481447
G2 X135.556 Y118.145 I-1.465 J.313 E.04742
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.974 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.193
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.04 F42000
G1 X126.764 Y127.489 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.04 F42000
G1 Z5.64
M73 P88 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.253 Y127.489 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00045
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.313 Y127.489 E.03628
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.02927
G1 X129.236 Y126.07 E-.53921
G1 X129.495 Y126.211 E-.11205
M73 P88 R1
G1 X129.667 Y126.329 E-.07947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21335
G1 X130.796 Y129.072 E-.0899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.663 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.2143
G1 X125.913 Y130.94 E-.16989
G1 X125.617 Y130.605 E-.16965
G1 X125.328 Y130.146 E-.20616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13883
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.252 Y131.949 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.236 Y131.949 E.00039
G3 X127.916 Y125.411 I-1.245 J-3.151 E.28859
G3 X128.214 Y125.418 I.084 J2.991 E.00728
G3 X129.543 Y131.809 I-.222 J3.38 E.21467
G1 X129.306 Y131.923 E.00641
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.236 Y131.949 E-.02833
G1 X128.918 Y132.063 E-.12837
G1 X128.589 Y132.138 E-.12847
G1 X128.253 Y132.18 E-.12843
G1 X127.916 Y132.189 E-.12837
G1 X127.578 Y132.164 E-.12848
G1 X127.346 Y132.123 E-.08955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/42
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.04 I1.044 J-.626 P1  F42000
G1 X119.73 Y119.424 Z6.04
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.704 Y119.523 E.00249
G2 X119.69 Y119.692 I1.203 J.184 E.00415
G1 X119.69 Y136.308 E.40494
G2 X120.892 Y137.51 I1.21 J-.007 E.04595
M73 P89 R1
G1 X135.108 Y137.51 E.34646
G2 X136.31 Y136.308 I-.03 J-1.232 E.04573
G1 X136.31 Y119.693 E.40493
G2 X135.108 Y118.49 I-1.217 J.014 E.0459
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10517
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.296 Y138.29 I-1.8 J-.104 E.06629
G1 X120.61 Y138.288 E.35794
G3 X118.91 Y136.497 I.098 J-1.794 E.06632
G1 X118.91 Y119.504 E.41416
G3 X120.612 Y117.712 I1.803 J.008 E.06635
G1 X124.84 Y117.71 E.10305
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09622
G2 X119.785 Y119.236 I.015 J1.217 E.03445
G1 X119.747 Y119.367 E.00331
; WIPE_START
G1 F3000
M204 S6000
G1 X119.704 Y119.523 E-.06166
G1 X119.69 Y119.692 E-.06459
G1 X119.69 Y121.36 E-.63376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
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


G1 X119.335 Y119.293 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481945
G1 F1706
M204 S6000
G3 X120.414 Y118.153 I1.46 J.301 E.04679
; LINE_WIDTH: 0.414687
G3 X120.871 Y118.101 I.439 J1.857 E.01107
G1 X124.64 Y118.1 E.09059
; WIPE_START
G1 F7887.457
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.335 Y119.293 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.413668
G1 F1706
M204 S6000
G2 X119.3 Y119.685 I1.94 J.369 E.00945
G1 X119.301 Y136.329 E.39897
G2 X119.353 Y136.784 I1.927 J.012 E.01101
; LINE_WIDTH: 0.481665
G2 X120.494 Y137.866 I1.447 J-.383 E.04682
; LINE_WIDTH: 0.413493
G1 X120.516 Y137.87 E.00052
G2 X120.885 Y137.899 I.334 J-1.894 E.00888
G1 X135.341 Y137.89 E.34637
G2 X135.566 Y137.852 I-.127 J-1.433 E.0055
; LINE_WIDTH: 0.482154
G1 X135.658 Y137.826 E.00268
G2 X136.653 Y136.761 I-.455 J-1.423 E.04309
; LINE_WIDTH: 0.412173
G1 X136.67 Y136.683 E.00193
G2 X136.699 Y136.315 I-1.888 J-.332 E.00882
G1 X136.699 Y119.673 E.39737
G2 X136.665 Y119.289 I-2.358 J.013 E.00921
; LINE_WIDTH: 0.48141
G2 X135.555 Y118.145 I-1.463 J.31 E.04748
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.189
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.2 F42000
G1 X126.764 Y127.489 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.668 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26804
G1 X127.737 Y125.821 E-.1256
G1 X128.263 Y125.821 E-.27174
G1 X128.259 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.242 Y127.489 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y127.489 E.00018
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.302 Y127.489 E.03655
; WIPE_START
G1 F5400
G1 X129.236 Y127.489 E-.02533
G1 X129.236 Y126.07 E-.53923
G1 X129.495 Y126.211 E-.112
G1 X129.676 Y126.335 E-.08344
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.0899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
M73 P90 R1
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21438
G1 X125.913 Y130.94 E-.16981
G1 X125.617 Y130.605 E-.16971
G1 X125.328 Y130.146 E-.2061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.987 J-.279 E.01465
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.01259
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.242 Y131.954 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X129.236 Y131.949 E.00019
G3 X127.916 Y125.411 I-1.244 J-3.151 E.28854
G3 X128.219 Y125.418 I.084 J3.045 E.0074
G3 X129.543 Y131.81 I-.227 J3.38 E.2146
G1 X129.296 Y131.928 E.00668
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X129.236 Y131.949 E-.02402
G1 X128.918 Y132.063 E-.1283
G1 X128.589 Y132.138 E-.12855
G1 X128.253 Y132.18 E-.12841
G1 X127.916 Y132.189 E-.12837
G1 X127.578 Y132.164 E-.12849
G1 X127.335 Y132.121 E-.09386
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/42
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I1.044 J-.626 P1  F42000
G1 X119.724 Y119.424 Z6.2
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S5000
G1 X119.69 Y119.693 E.00661
G1 X119.69 Y136.307 E.40492
G2 X120.895 Y137.51 I1.209 J-.006 E.04604
G1 X135.116 Y137.51 E.3466
G2 X136.31 Y136.305 I-.019 J-1.213 E.04577
G1 X136.31 Y119.693 E.40487
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.19 J1.795 E.06198
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.799 J-.102 E.06628
G1 X120.612 Y138.288 E.3579
G3 X118.91 Y136.497 I.101 J-1.8 E.06633
G1 X118.912 Y119.412 E.41639
G3 X120.612 Y117.712 I1.79 J.09 E.06422
G1 X124.84 Y117.71 E.10304
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.739 Y119.366 I.014 J1.217 E.03781
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.693 E-.12566
G1 X119.69 Y121.362 E-.63435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.36
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
            G0 Z6.36 F4000
            G39.3 S1
            G0 Z6.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.29 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482082
G1 F1706
M204 S6000
G3 X120.415 Y118.153 I1.467 J.312 E.04669
; LINE_WIDTH: 0.414658
G3 X120.871 Y118.101 I.444 J1.884 E.01107
G1 X124.64 Y118.1 E.09057
; WIPE_START
G1 F7888.061
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.29 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.412286
G1 F1706
M204 S6000
G1 X119.33 Y119.314 E.0006
G2 X119.301 Y119.686 I2.001 J.343 E.00891
G1 X119.301 Y136.328 E.39748
G2 X119.335 Y136.712 I2.366 J-.015 E.00922
; LINE_WIDTH: 0.480455
G2 X120.502 Y137.868 I1.456 J-.303 E.04907
; LINE_WIDTH: 0.413567
G1 X120.527 Y137.872 E.00061
G2 X120.89 Y137.899 I.343 J-2.173 E.00874
G1 X135.124 Y137.9 E.34111
G1 X135.341 Y137.891 E.00522
G1 X135.567 Y137.852 E.00548
; LINE_WIDTH: 0.482151
G1 X135.657 Y137.826 E.00266
G2 X136.652 Y136.764 I-.453 J-1.42 E.04303
; LINE_WIDTH: 0.412177
G1 X136.683 Y136.61 E.00375
G2 X136.699 Y136.31 I-2.717 J-.296 E.00718
G1 X136.699 Y119.672 E.39726
G2 X136.665 Y119.288 I-2.333 J.011 E.00921
; LINE_WIDTH: 0.481421
G2 X135.555 Y118.145 I-1.46 J.306 E.04749
; LINE_WIDTH: 0.415617
G2 X135.115 Y118.1 I-.424 J1.976 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.214
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.36 F42000
G1 X126.764 Y127.489 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1706
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y127.489 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.296 Y127.489 E.03673
; WIPE_START
G1 F5400
G1 X129.236 Y126.07 E-.53971
G1 X129.495 Y126.211 E-.11205
G1 X129.73 Y126.372 E-.10824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
M73 P91 R1
G1 F1706
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G1 X130.989 Y128.8 E.00391
G3 X130.976 Y129.079 I-2.798 J.005 E.00733
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27189
G1 X130.976 Y128.521 E-.11979
G1 X130.985 Y128.651 E-.06498
G1 X130.989 Y128.8 E-.07426
G1 X130.976 Y129.079 E-.1392
G1 X130.796 Y129.072 E-.08987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00753
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04532
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.668 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21433
G1 X125.913 Y130.94 E-.1698
G1 X125.617 Y130.605 E-.16976
G1 X125.328 Y130.146 E-.20611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1706
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.988 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13885
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.232 Y131.958 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1706
M204 S5000
G1 X128.917 Y132.057 E.00805
G3 X127.916 Y125.411 I-.923 J-3.259 E.28027
G3 X128.224 Y125.418 I.084 J3.094 E.00753
G3 X129.283 Y131.931 I-.231 J3.38 E.22152
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X128.917 Y132.057 E-.1472
G1 X128.589 Y132.138 E-.12845
G1 X128.253 Y132.18 E-.12842
G1 X127.916 Y132.189 E-.12837
G1 X127.578 Y132.164 E-.12849
G1 X127.322 Y132.118 E-.09907
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/42
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.36 I1.044 J-.625 P1  F42000
G1 X119.723 Y119.426 Z6.36
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.69 Y119.695 E.00659
G1 X119.69 Y136.305 E.40481
G2 X120.892 Y137.51 I1.209 J-.004 E.04601
G1 X135.105 Y137.51 E.3464
G2 X136.31 Y136.305 I-.019 J-1.224 E.04593
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10517
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.296 Y138.29 I-1.79 J-.092 E.06639
G1 X120.61 Y138.288 E.35793
G3 X118.91 Y136.495 I.091 J-1.789 E.06645
G1 X118.91 Y119.505 E.41406
G3 X120.61 Y117.712 I1.814 J.017 E.06624
G1 X124.84 Y117.71 E.10309
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09622
G2 X119.738 Y119.368 I.015 J1.217 E.03787
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.695 E-.12546
G1 X119.69 Y121.365 E-.63454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.52
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
            G0 Z6.52 F4000
            G39.3 S1
            G0 Z6.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.333 Y119.297 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481945
G1 F1707
M204 S6000
G3 X120.414 Y118.152 I1.468 J.304 E.04692
; LINE_WIDTH: 0.414679
G3 X120.871 Y118.101 I.425 J1.745 E.01107
G1 X124.64 Y118.1 E.09059
; WIPE_START
G1 F7887.632
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.333 Y119.297 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.414519
G1 F1707
M204 S6000
G1 X119.328 Y119.322 E.00061
G2 X119.3 Y119.69 I2.141 J.349 E.00888
G1 X119.305 Y136.485 E.40351
G2 X119.349 Y136.77 I1.683 J-.114 E.00693
; LINE_WIDTH: 0.482464
G2 X120.449 Y137.856 I1.441 J-.359 E.04602
; LINE_WIDTH: 0.413808
G2 X120.885 Y137.899 I.396 J-1.788 E.01054
G1 X135.29 Y137.894 E.34545
G2 X135.627 Y137.836 I-.1 J-1.582 E.00822
; LINE_WIDTH: 0.48181
G1 X135.653 Y137.828 E.00074
G2 X136.665 Y136.706 I-.45 J-1.424 E.04481
; LINE_WIDTH: 0.412022
G1 X136.699 Y136.31 E.0095
G1 X136.694 Y119.523 E.40065
G2 X136.666 Y119.292 I-2.969 J.245 E.00556
; LINE_WIDTH: 0.48133
G2 X135.555 Y118.145 I-1.467 J.308 E.04757
; LINE_WIDTH: 0.415609
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.377
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.52 F42000
G1 X126.764 Y127.489 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26804
G1 X127.737 Y125.821 E-.1256
G1 X128.263 Y125.821 E-.27174
G1 X128.259 Y126.004 E-.09462
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y127.489 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.296 Y127.489 E.03673
; WIPE_START
G1 F5400
G1 X129.236 Y126.07 E-.53971
G1 X129.495 Y126.211 E-.11203
G1 X129.73 Y126.372 E-.10826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.294 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27195
G1 X130.976 Y128.521 E-.1198
G1 X130.985 Y128.651 E-.06499
G1 X130.976 Y129.079 E-.21339
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52975
G1 X129.842 Y130.111 E-.23025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12588
G1 X128.257 Y131.536 E-.26601
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.2144
G1 X125.913 Y130.94 E-.16962
G1 X125.617 Y130.605 E-.16993
G1 X125.328 Y130.146 E-.20605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.996 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13884
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.221 Y131.961 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X128.917 Y132.058 E.00779
G3 X127.916 Y125.411 I-.922 J-3.26 E.28022
G3 X128.229 Y125.418 I.084 J3.147 E.00765
G3 X129.275 Y131.934 I-.235 J3.38 E.22167
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X128.917 Y132.058 E-.14379
G1 X128.589 Y132.138 E-.12842
G1 X128.253 Y132.18 E-.12841
G1 X127.916 Y132.189 E-.12838
G1 X127.578 Y132.164 E-.12849
G1 X127.313 Y132.117 E-.1025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/42
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.52 I1.044 J-.625 P1  F42000
G1 X119.723 Y119.428 Z6.52
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.69 Y119.693 E.00649
G1 X119.69 Y136.307 E.40493
G2 X120.895 Y137.51 I1.209 J-.007 E.04603
G1 X135.113 Y137.51 E.34652
G2 X136.31 Y136.305 I-.016 J-1.213 E.04585
G1 X136.31 Y119.695 E.40481
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.19 J1.795 E.06199
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.79 J-.092 E.06637
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.497 I.096 J-1.794 E.06634
G1 X118.91 Y119.503 E.41418
G3 X120.612 Y117.712 I1.804 J.011 E.06632
G1 X124.84 Y117.71 E.10304
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.737 Y119.37 I.014 J1.217 E.03792
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.693 E-.12387
G1 X119.69 Y121.367 E-.63614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.68
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
            G0 Z6.68 F4000
            G39.3 S1
            G0 Z6.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.291 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482066
G1 F1707
M204 S6000
G3 X120.414 Y118.153 I1.463 J.307 E.04674
; LINE_WIDTH: 0.414664
G3 X120.871 Y118.101 I.445 J1.892 E.01108
G1 X124.64 Y118.1 E.09057
; WIPE_START
G1 F7887.931
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.291 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.412536
G1 F1707
M204 S6000
G1 X119.33 Y119.314 E.00055
G2 X119.301 Y119.685 I1.946 J.34 E.00892
G1 X119.301 Y136.328 E.39776
G2 X119.335 Y136.712 I2.327 J-.012 E.00922
; LINE_WIDTH: 0.480565
G2 X120.494 Y137.866 I1.459 J-.306 E.04882
; LINE_WIDTH: 0.413576
G2 X120.89 Y137.899 I.39 J-2.334 E.00954
G1 X135.135 Y137.9 E.34139
G2 X135.576 Y137.85 I.012 J-1.86 E.01066
; LINE_WIDTH: 0.481234
G1 X135.657 Y137.826 E.00239
G2 X136.665 Y136.706 I-.454 J-1.422 E.0446
; LINE_WIDTH: 0.412022
M73 P93 R1
G1 X136.699 Y136.31 E.0095
G1 X136.694 Y119.524 E.40064
G2 X136.666 Y119.292 I-2.97 J.245 E.00557
; LINE_WIDTH: 0.481328
G2 X135.555 Y118.145 I-1.467 J.309 E.04756
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.975 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.195
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.68 F42000
G1 X126.764 Y127.489 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26804
G1 X127.737 Y125.821 E-.1256
G1 X128.263 Y125.821 E-.27174
G1 X128.259 Y126.004 E-.09462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y127.489 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
G1 X129.296 Y127.489 E.03673
; WIPE_START
G1 F5400
G1 X129.236 Y126.07 E-.53971
G1 X129.495 Y126.211 E-.11208
G1 X129.73 Y126.372 E-.10821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.294 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27195
G1 X130.976 Y128.521 E-.1198
G1 X130.985 Y128.651 E-.06499
G1 X130.976 Y129.079 E-.21339
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00753
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52977
G1 X129.842 Y130.111 E-.23023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12588
G1 X128.257 Y131.536 E-.26601
M73 P94 R1
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21433
G1 X125.913 Y130.94 E-.16974
G1 X125.617 Y130.605 E-.1698
G1 X125.328 Y130.146 E-.20613
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12426
G1 X125.011 Y128.8 E-.13885
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.212 Y131.965 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X128.917 Y132.059 E.00755
G3 X128.084 Y125.411 I-.926 J-3.26 E.28467
G1 X128.234 Y125.419 E.00365
G3 X129.266 Y131.939 I-.244 J3.381 E.22169
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X128.917 Y132.059 E-.14028
G1 X128.589 Y132.138 E-.12833
G1 X128.253 Y132.18 E-.12844
G1 X127.916 Y132.189 E-.12838
G1 X127.578 Y132.164 E-.12848
G1 X127.303 Y132.115 E-.1061
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/42
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.68 I1.045 J-.624 P1  F42000
G1 X119.728 Y119.43 Z6.68
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.704 Y119.523 E.00234
G2 X119.69 Y119.692 I1.203 J.184 E.00415
G1 X119.69 Y136.308 E.40494
G2 X120.892 Y137.51 I1.209 J-.007 E.04596
G1 X135.112 Y137.51 E.34656
G2 X136.31 Y136.305 I-.026 J-1.224 E.04577
G1 X136.31 Y119.692 E.40487
G2 X135.108 Y118.49 I-1.217 J.014 E.04589
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10518
G3 X137.088 Y119.412 I-.191 J1.796 E.06198
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.794 J-.096 E.06633
G1 X120.612 Y138.288 E.3579
G3 X118.91 Y136.497 I.089 J-1.789 E.06643
G1 X118.912 Y119.412 E.41639
G3 X120.61 Y117.712 I1.794 J.094 E.06413
G1 X124.84 Y117.71 E.1031
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09622
G2 X119.785 Y119.236 I.015 J1.217 E.03444
G1 X119.745 Y119.373 E.00347
; WIPE_START
G1 F3000
M204 S6000
G1 X119.704 Y119.523 E-.05923
G1 X119.69 Y119.692 E-.06467
G1 X119.69 Y121.366 E-.6361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P94 R0
G3 Z6.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.84
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
            G0 Z6.84 F4000
            G39.3 S1
            G0 Z6.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.335 Y119.291 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481967
G1 F1707
M204 S6000
G3 X120.414 Y118.153 I1.459 J.302 E.04673
; LINE_WIDTH: 0.414677
G3 X120.871 Y118.101 I.423 J1.71 E.01107
G1 X124.64 Y118.1 E.09059
; WIPE_START
G1 F7887.665
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.335 Y119.291 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.412296
G1 F1707
M204 S6000
G2 X119.301 Y119.685 I1.791 J.353 E.00947
G1 X119.301 Y136.329 E.39753
G2 X119.335 Y136.713 I2.239 J-.005 E.00922
; LINE_WIDTH: 0.480649
G2 X120.491 Y137.866 I1.459 J-.307 E.04873
; LINE_WIDTH: 0.413552
G1 X120.507 Y137.869 E.00038
G2 X120.885 Y137.899 I.344 J-1.922 E.0091
G1 X135.119 Y137.9 E.34112
G1 X135.341 Y137.891 E.00532
G1 X135.568 Y137.852 E.00552
; LINE_WIDTH: 0.482375
G1 X135.657 Y137.826 E.00263
G2 X136.651 Y136.769 I-.455 J-1.422 E.0429
; LINE_WIDTH: 0.412191
G1 X136.683 Y136.61 E.00387
G2 X136.699 Y136.31 I-2.716 J-.296 E.00718
G1 X136.699 Y119.671 E.3973
G2 X136.665 Y119.287 I-2.204 J.002 E.00922
; LINE_WIDTH: 0.481441
G2 X135.556 Y118.145 I-1.463 J.311 E.04743
; LINE_WIDTH: 0.415618
G2 X135.115 Y118.1 I-.424 J1.976 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.201
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z6.84 F42000
G1 X126.764 Y127.489 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.826 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.667 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26803
G1 X127.737 Y125.821 E-.12561
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y127.489 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00775
G3 X130.694 Y127.489 I-1.556 J2.661 E.04668
G1 X129.296 Y127.489 E.03673
; WIPE_START
G1 F5400
G1 X129.236 Y126.07 E-.53969
G1 X129.495 Y126.211 E-.11205
G1 X129.73 Y126.372 E-.10826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01418
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.294 J.139 E.01125
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27194
M73 P95 R0
G1 X130.976 Y128.521 E-.11979
G1 X130.985 Y128.651 E-.06498
G1 X130.976 Y129.079 E-.2134
G1 X130.796 Y129.072 E-.08988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.358 E.00751
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04534
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.666 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27328
G1 X127.743 Y131.536 E-.12589
G1 X128.257 Y131.536 E-.266
G1 X128.262 Y131.719 E-.09483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21427
G1 X125.913 Y130.94 E-.16984
G1 X125.617 Y130.605 E-.16975
G1 X125.328 Y130.146 E-.20615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.989 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13886
G1 X125.024 Y128.521 E-.13883
G1 X125.264 Y128.53 E-.1195
G1 X125.264 Y129.01 E-.23858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.202 Y131.968 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X128.917 Y132.06 E.0073
G3 X128.084 Y125.411 I-.924 J-3.261 E.28455
G1 X128.239 Y125.419 E.00378
G3 X129.257 Y131.944 I-.246 J3.38 E.22192
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X128.917 Y132.06 E-.13658
G1 X128.589 Y132.138 E-.12845
G1 X128.253 Y132.18 E-.12841
G1 X127.916 Y132.189 E-.12839
G1 X127.578 Y132.164 E-.12847
G1 X127.294 Y132.113 E-.10971
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/42
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.84 I1.045 J-.624 P1  F42000
G1 X119.723 Y119.433 Z6.84
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S5000
G1 X119.69 Y119.692 E.00638
G1 X119.69 Y136.308 E.40494
G2 X120.895 Y137.51 I1.232 J-.03 E.0458
G1 X135.11 Y137.51 E.34645
G2 X136.31 Y136.308 I-.032 J-1.231 E.04568
G1 X136.31 Y119.695 E.40488
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10517
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.297 Y138.29 I-1.789 J-.092 E.06638
G1 X120.61 Y138.288 E.35796
G3 X118.91 Y136.495 I.092 J-1.789 E.06644
G1 X118.91 Y119.503 E.41411
G3 X120.61 Y117.712 I1.796 J.003 E.06635
G1 X124.84 Y117.71 E.1031
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.736 Y119.374 I.014 J1.217 E.03803
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.692 E-.1222
G1 X119.69 Y121.371 E-.6378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
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


G1 X119.334 Y119.29 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481953
G1 F1707
M204 S6000
G3 X120.414 Y118.153 I1.458 J.303 E.04672
; LINE_WIDTH: 0.41468
G3 X120.871 Y118.101 I.423 J1.709 E.01109
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.595
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.29 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.413475
G1 F1707
M204 S6000
G1 X119.33 Y119.312 E.00054
G2 X119.301 Y119.685 I1.925 J.339 E.00898
G1 X119.3 Y136.329 E.39877
G2 X119.349 Y136.772 I1.983 J.008 E.01072
; LINE_WIDTH: 0.482684
G2 X120.431 Y137.851 I1.447 J-.37 E.04545
; LINE_WIDTH: 0.413696
G1 X120.572 Y137.879 E.00343
G2 X120.89 Y137.899 I.301 J-2.279 E.00766
G1 X135.118 Y137.9 E.34108
G1 X135.341 Y137.891 E.00535
G1 X135.568 Y137.852 E.00553
; LINE_WIDTH: 0.482284
G1 X135.657 Y137.826 E.00262
G2 X136.651 Y136.769 I-.453 J-1.422 E.0429
; LINE_WIDTH: 0.41232
G1 X136.67 Y136.683 E.0021
G2 X136.699 Y136.315 I-1.872 J-.332 E.00883
G1 X136.694 Y119.524 E.40108
G2 X136.652 Y119.235 I-1.288 J.041 E.00698
; LINE_WIDTH: 0.482342
G1 X136.61 Y119.092 E.00423
G2 X135.556 Y118.145 I-1.401 J.5 E.04181
; LINE_WIDTH: 0.415611
G2 X135.115 Y118.1 I-.424 J1.975 E.0107
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.341
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y124.345 Z7 F42000
G1 X126.764 Y127.489 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.306 Y127.489 E.0383
G3 X126.764 Y126.07 I2.827 J1.446 E.0544
G1 X126.764 Y127.429 E.0357
M204 S250
G1 X127.165 Y127.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y126.064 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X127.743 Y126.064 E.0135
G1 X127.737 Y125.821 E.00639
G3 X128.263 Y125.821 I.263 J3.666 E.01383
G1 X128.259 Y126.004 E.00481
; WIPE_START
G1 F5400
G1 X127.743 Y126.064 E-.26802
G1 X127.737 Y125.821 E-.12562
G1 X128.263 Y125.821 E-.27173
G1 X128.259 Y126.004 E-.09463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y127.489 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y126.07 E.03727
G1 X129.495 Y126.211 E.00774
G3 X130.694 Y127.489 I-1.555 J2.661 E.04668
M73 P96 R0
G1 X129.296 Y127.489 E.03672
; WIPE_START
G1 F5400
G1 X129.236 Y126.07 E-.53971
G1 X129.495 Y126.211 E-.112
G1 X129.73 Y126.372 E-.1083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.736 Y129.07 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X130.736 Y128.53 E.01417
G1 X130.976 Y128.521 E.00631
G1 X130.985 Y128.651 E.00342
G3 X130.976 Y129.079 I-3.293 J.139 E.01124
G1 X130.796 Y129.072 E.00473
; WIPE_START
G1 F5400
G1 X130.736 Y128.53 E-.27193
G1 X130.976 Y128.521 E-.11982
G1 X130.985 Y128.651 E-.065
G1 X130.976 Y129.079 E-.21336
G1 X130.796 Y129.072 E-.08989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y131.53 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X129.236 Y130.111 E.03727
G1 X130.694 Y130.111 E.0383
G1 X130.551 Y130.359 E.00752
G3 X129.29 Y131.504 I-2.626 J-1.625 E.04533
; WIPE_START
G1 F5400
G1 X129.236 Y130.111 E-.52976
G1 X129.842 Y130.111 E-.23024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.263 Y131.779 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X127.737 Y131.779 I-.263 J-3.668 E.01383
G1 X127.743 Y131.536 E.00639
G1 X128.257 Y131.536 E.0135
G1 X128.262 Y131.719 E.00481
; WIPE_START
G1 F5400
G1 X127.737 Y131.779 E-.27329
G1 X127.743 Y131.536 E-.12588
G1 X128.257 Y131.536 E-.26601
G1 X128.262 Y131.719 E-.09482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y131.53 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G3 X125.306 Y130.111 I1.368 J-2.865 E.0544
G1 X126.764 Y130.111 E.0383
G1 X126.764 Y131.47 E.0357
; WIPE_START
G1 F5400
G1 X126.255 Y131.227 E-.21425
G1 X125.913 Y130.94 E-.16989
G1 X125.617 Y130.605 E-.16979
G1 X125.328 Y130.146 E-.20608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.264 Y129.07 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1707
M204 S6000
G1 X125.024 Y129.079 E.00631
G3 X125.024 Y128.521 I3.992 J-.279 E.01466
G1 X125.264 Y128.53 E.00631
G1 X125.264 Y129.01 E.0126
; WIPE_START
G1 F5400
G1 X125.024 Y129.079 E-.12425
G1 X125.011 Y128.8 E-.13885
G1 X125.024 Y128.521 E-.13882
G1 X125.264 Y128.53 E-.11951
G1 X125.264 Y129.01 E-.23857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.194 Y131.971 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X128.918 Y132.061 E.00708
G3 X128.084 Y125.411 I-.922 J-3.262 E.28444
G1 X128.244 Y125.419 E.0039
G3 X129.249 Y131.948 I-.249 J3.38 E.22214
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M204 S6000
G1 X128.918 Y132.061 E-.13309
G1 X128.589 Y132.138 E-.12846
G1 X128.253 Y132.18 E-.12841
G1 X127.915 Y132.189 E-.1284
G1 X127.578 Y132.164 E-.12846
G1 X127.285 Y132.112 E-.11318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/42
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I1.045 J-.624 P1  F42000
G1 X119.722 Y119.435 Z7
G1 Z6.76
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X119.69 Y119.695 E.00638
G1 X119.69 Y136.308 E.40488
G2 X120.892 Y137.51 I1.232 J-.03 E.04573
G1 X135.109 Y137.51 E.34648
G2 X136.31 Y136.308 I-.03 J-1.232 E.04571
G1 X136.31 Y119.695 E.40487
G2 X135.108 Y118.49 I-1.217 J.012 E.04595
G1 X131.16 Y118.49 E.09621
G1 X131.16 Y117.71 E.01901
G1 X135.475 Y117.719 E.10517
G3 X137.088 Y119.412 I-.202 J1.806 E.0619
G1 X137.088 Y136.59 E.41866
G3 X135.295 Y138.29 I-1.794 J-.096 E.06639
G1 X120.612 Y138.288 E.35784
G3 X118.91 Y136.495 I.094 J-1.794 E.06646
G1 X118.91 Y119.503 E.41412
G3 X120.61 Y117.712 I1.814 J.02 E.06618
G1 X124.84 Y117.71 E.10309
G1 X124.84 Y118.49 E.01901
G1 X120.892 Y118.49 E.09621
G2 X119.736 Y119.377 I.015 J1.217 E.03808
; WIPE_START
G1 F3000
M204 S6000
G1 X119.69 Y119.695 E-.1222
G1 X119.69 Y121.373 E-.6378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.16
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
            G0 Z7.16 F4000
            G39.3 S1
            G0 Z7.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.334 Y119.292 F42000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48197
G1 F1923
M204 S6000
G3 X120.415 Y118.153 I1.467 J.309 E.04677
; LINE_WIDTH: 0.414675
G3 X120.871 Y118.101 I.423 J1.711 E.01107
G1 X124.64 Y118.1 E.09058
; WIPE_START
G1 F7887.712
G1 X122.64 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.334 Y119.292 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.413617
G1 F1923
M204 S6000
G2 X119.301 Y119.69 I2.291 J.39 E.00958
G1 X119.3 Y136.329 E.3988
G2 X119.35 Y136.776 I1.974 J.008 E.01082
; LINE_WIDTH: 0.481589
G2 X120.497 Y137.867 I1.443 J-.369 E.04716
; LINE_WIDTH: 0.413323
G1 X120.517 Y137.87 E.00049
G2 X120.885 Y137.899 I.334 J-1.912 E.00885
G1 X135.13 Y137.9 E.34117
G2 X135.503 Y137.867 I-.001 J-2.134 E.00898
; LINE_WIDTH: 0.481027
G1 X135.769 Y137.787 E.00783
G1 X135.951 Y137.698 E.00572
G2 X136.652 Y136.767 I-.754 J-1.297 E.03377
; LINE_WIDTH: 0.412311
G1 X136.67 Y136.683 E.00207
G2 X136.699 Y136.315 I-1.875 J-.332 E.00883
G1 X136.694 Y119.523 E.40107
G2 X136.652 Y119.237 I-1.29 J.042 E.00693
; LINE_WIDTH: 0.482303
G1 X136.61 Y119.092 E.00428
G2 X135.555 Y118.145 I-1.401 J.5 E.04182
; LINE_WIDTH: 0.415617
G2 X135.115 Y118.1 I-.424 J1.973 E.01069
G1 X131.36 Y118.1 E.09046
; WIPE_START
G1 F7868.221
G1 X133.36 Y118.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.279 Y124.55 Z7.16 F42000
G1 X127.165 Y127.89 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1923
M204 S5000
G1 X127.165 Y126.465 E.03473
G1 X128.835 Y126.465 E.0407
G1 X128.835 Y127.89 E.03473
G1 X130.335 Y127.89 E.03656
G1 X130.335 Y129.71 E.04436
G1 X128.835 Y129.71 E.03656
G1 X128.835 Y131.135 E.03473
G1 X127.165 Y131.135 E.0407
G1 X127.165 Y129.71 E.03473
G1 X125.665 Y129.71 E.03656
G1 X125.665 Y127.89 E.04436
G1 X127.105 Y127.89 E.0351
; WIPE_START
G1 F3000
M204 S6000
G1 X127.165 Y126.465 E-.54198
G1 X127.739 Y126.465 E-.21802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.185 Y131.974 Z7.16 F42000
G1 Z6.76
M73 P97 R0
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X128.918 Y132.062 E.00686
G3 X128.084 Y125.411 I-.92 J-3.262 E.28431
G1 X128.249 Y125.419 E.00403
G3 X129.241 Y131.953 I-.251 J3.38 E.22236
M204 S10000
G1 X128.75 Y131.886 F42000
; FEATURE: Top surface
G1 F1800
M204 S2000
G1 X130.63 Y130.005 E.06481
G1 X130.168 Y129.922
G1 X129.047 Y131.043 E.03865
G1 X129.047 Y130.498
G1 X129.623 Y129.922 E.01985
; WIPE_START
M204 S6000
G1 X129.047 Y130.498 E-.30946
G1 X129.047 Y131.043 E-.20725
G1 X129.5 Y130.591 E-.24329
; WIPE_END
G1 E-.04
M204 S10000
G1 X128.743 Y131.347 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
M204 S2000
G1 X128.117 Y131.974 E.0216
G1 X127.597 Y131.948
G1 X128.198 Y131.347 E.02071
G1 X127.653 Y131.347
G1 X127.141 Y131.859 E.01765
G1 X126.741 Y131.714
G1 X127.107 Y131.347 E.01263
G1 X126.953 Y130.956
G1 X126.38 Y131.529 E.01975
G1 X126.054 Y131.31
G1 X126.953 Y130.411 E.03098
G1 X126.896 Y129.922
G1 X125.763 Y131.055 E.03905
G1 X125.507 Y130.765
G1 X126.351 Y129.922 E.02906
G1 X125.805 Y129.922
G1 X125.285 Y130.443 E.01794
G1 X125.097 Y130.085
G1 X125.453 Y129.729 E.01228
G1 X125.453 Y129.184
G1 X124.951 Y129.686 E.01731
G1 X124.856 Y129.235
G1 X125.453 Y128.638 E.02057
G1 X125.453 Y128.093
G1 X124.829 Y128.717 E.02151
G1 X124.905 Y128.096
G1 X125.388 Y127.613 E.01665
G1 X126.413 Y127.678
G1 X126.953 Y127.138 E.0186
G1 X126.953 Y126.593
G1 X125.868 Y127.678 E.0374
; WIPE_START
M204 S6000
G1 X126.953 Y126.593 E-.58316
G1 X126.953 Y127.058 E-.17684
; WIPE_END
G1 E-.04
M204 S10000
G1 X131.086 Y129.55 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
M204 S2000
G1 X130.63 Y130.005 E.01571
G1 X130.547 Y129.543
G1 X131.174 Y128.917 E.02159
G1 X131.149 Y128.396
G1 X130.547 Y128.998 E.02075
G1 X130.547 Y128.453
G1 X131.057 Y127.943 E.01757
G1 X130.913 Y127.541
G1 X130.547 Y127.907 E.01262
G1 X130.231 Y127.678
G1 X130.731 Y127.178 E.01722
G1 X130.51 Y126.854
G1 X129.686 Y127.678 E.02841
G1 X129.14 Y127.678
G1 X130.253 Y126.565 E.03837
G1 X129.965 Y126.308
G1 X129.047 Y127.226 E.03163
G1 X129.047 Y126.68
G1 X129.644 Y126.084 E.02056
G1 X129.286 Y125.896
G1 X128.929 Y126.253 E.01232
G1 X128.384 Y126.253
G1 X128.884 Y125.752 E.01726
G1 X128.43 Y125.661
G1 X127.838 Y126.253 E.0204
G1 X127.293 Y126.253
G1 X127.922 Y125.623 E.02169
G1 X127.299 Y125.701
G1 X125.388 Y127.613 E.06589
; WIPE_START
M204 S6000
G1 X126.802 Y126.198 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X130.942 Y129.994 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0978609
G1 F1923
M204 S6000
G1 X130.885 Y130.078 E.00041
; LINE_WIDTH: 0.132369
G1 X130.828 Y130.162 E.00063
; LINE_WIDTH: 0.172063
G1 X130.734 Y130.288 E.00137
; LINE_WIDTH: 0.216943
G1 X130.64 Y130.413 E.00181
; LINE_WIDTH: 0.25377
G1 X130.542 Y130.532 E.00214
; LINE_WIDTH: 0.28256
G1 X130.444 Y130.651 E.00242
; LINE_WIDTH: 0.311526
G3 X129.793 Y131.293 I-5.147 J-4.561 E.01603
; LINE_WIDTH: 0.269144
G1 X129.672 Y131.391 E.0023
; LINE_WIDTH: 0.236377
G1 X129.552 Y131.488 E.00198
; LINE_WIDTH: 0.195512
G1 X129.374 Y131.618 E.00224
; LINE_WIDTH: 0.146506
G1 X129.196 Y131.747 E.00156
; WIPE_START
G1 F15000
G1 X129.374 Y131.618 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.374 Y130.622 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.0870244
G1 F1923
M204 S6000
M73 P98 R0
G2 X125.333 Y130.52 I-.071 J-.03 E.0004
M204 S10000
G1 X125.042 Y129.867 F42000
; LINE_WIDTH: 0.0807868
G1 F1923
M204 S6000
G1 X124.956 Y129.715 E.00051
; WIPE_START
G1 F15000
G1 X125.042 Y129.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.862 Y125.827 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.172721
G1 F1923
M204 S6000
G1 X126.658 Y125.975 E.0022
; LINE_WIDTH: 0.221546
G1 X126.455 Y126.123 E.00298
; LINE_WIDTH: 0.262259
G1 X126.335 Y126.22 E.00222
; LINE_WIDTH: 0.294859
G1 X126.215 Y126.317 E.00254
; LINE_WIDTH: 0.337066
G2 X125.567 Y126.957 I4.478 J5.183 E.01744
; LINE_WIDTH: 0.308238
G1 X125.469 Y127.075 E.00266
; LINE_WIDTH: 0.27958
G1 X125.371 Y127.193 E.00238
; LINE_WIDTH: 0.242907
G1 X125.277 Y127.318 E.00206
; LINE_WIDTH: 0.198222
G1 X125.184 Y127.444 E.00162
; LINE_WIDTH: 0.152055
G1 X125.108 Y127.556 E.00101
; LINE_WIDTH: 0.104423
G1 X125.032 Y127.669 E.0006
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X125.108 Y127.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.16 I1.217 J0 P1  F42000
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
G1 Z7.16 F900 ; lower z a little
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

    G1 Z106.76 F600
    G1 Z104.76

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

