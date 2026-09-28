; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 4m 26s; total estimated time: 11m 5s
; total layer number: 23
; total filament length [mm] : 112.44
; total filament volume [cm^3] : 270.45
; total filament weight [g] : 0.34
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 3.72
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
; print_settings_id = AirGap EDC Vault 04_lightguide_translucent A1 0.4
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
M73 P0 R11
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
M73 P1 R10
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
M73 P5 R10
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P7 R10
G1 X-48.2 F3000
M73 P9 R10
G1 X-28.5 F30000 ;wipe and shake
M73 P9 R9
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
M73 P10 R9
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
M73 P13 R9
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
    
M73 P14 R9
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

M73 P15 R9
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
M73 P54 R5
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
M73 P54 R4
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P55 R4
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
M73 P56 R4
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
    G29 A1 X120.65 Y123.875 I14.7 J8.25
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
; layer num/total_layer_count: 1/23
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X134.111 Y129.664 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P57 R4
G1 F1200
M204 S500
G1 X134.111 Y130.223 E.02017
G1 X133.711 Y130.223 E.01444
G1 X133.711 Y130.886 E.02394
G1 X121.889 Y130.886 E.42684
M73 P58 R4
G1 X121.889 Y129.664 E.04411
G1 X134.051 Y129.664 E.43911
M204 S6000
G1 X134.132 Y129.207 F42000
G1 F1200
M204 S500
G1 X134.132 Y125.07 E.14937
G1 X134.568 Y125.07 E.01574
M73 P59 R4
G1 X134.568 Y130.68 E.20254
G1 X134.168 Y130.68 E.01444
G1 X134.168 Y131.343 E.02394
G1 X121.432 Y131.343 E.45984
G1 X121.432 Y129.207 E.07712
G1 X134.072 Y129.207 E.45638
M204 S6000
G1 X133.675 Y128.75 F42000
; FEATURE: Outer wall
G1 F1200
M204 S500
G1 X133.675 Y124.613 E.14937
G1 X135.025 Y124.613 E.04874
G1 X135.025 Y131.137 E.23555
G1 X134.625 Y131.137 E.01444
G1 X134.625 Y131.8 E.02394
G1 X120.975 Y131.8 E.49285
G1 X120.975 Y128.75 E.11012
G1 X133.615 Y128.75 E.45638
; WIPE_START
G1 F1500
M73 P60 R4
G1 X133.644 Y126.75 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X133.482 Y129.943 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14447
G1 F1200
M204 S500
G1 X133.882 Y129.943 E.00321
; WIPE_START
G1 F1500
G1 X133.482 Y129.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.187 Y130.703 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5212
G1 F1200
M204 S500
G1 X132.536 Y130.053 E.03475
G1 X131.86 Y130.053 E.02555
G1 X132.305 Y130.497 E.02376
G1 X131.628 Y130.497 E.02555
G1 X131.184 Y130.053 E.02376
G1 X130.507 Y130.053 E.02555
G1 X130.952 Y130.497 E.02376
G1 X130.275 Y130.497 E.02555
G1 X129.831 Y130.053 E.02376
G1 X129.154 Y130.053 E.02555
G1 X129.599 Y130.497 E.02376
G1 X128.923 Y130.497 E.02555
M73 P61 R4
G1 X128.478 Y130.053 E.02376
G1 X127.802 Y130.053 E.02555
G1 X128.246 Y130.497 E.02376
G1 X127.57 Y130.497 E.02555
G1 X127.125 Y130.053 E.02376
G1 X126.449 Y130.053 E.02555
G1 X126.894 Y130.497 E.02376
G1 X126.217 Y130.497 E.02555
G1 X125.772 Y130.053 E.02376
G1 X125.096 Y130.053 E.02555
G1 X125.541 Y130.497 E.02376
G1 X124.864 Y130.497 E.02555
G1 X124.42 Y130.053 E.02376
G1 X123.743 Y130.053 E.02555
G1 X124.188 Y130.497 E.02376
G1 X123.512 Y130.497 E.02555
G1 X123.067 Y130.053 E.02376
G1 X122.39 Y130.053 E.02555
G1 X123.041 Y130.703 E.03475
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F2400
G1 X122.39 Y130.053 E-.34952
G1 X123.067 Y130.053 E-.25703
G1 X123.352 Y130.338 E-.15345
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/23
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.098 J1.213 P1  F42000
G1 X134.324 Y129.451 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.656 E.03165
G1 X133.924 Y130.656 E.01051
G1 X133.924 Y131.099 E.01162
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.678 E.11447
G1 X134.739 Y124.678 E.02045
G1 X134.739 Y131.072 E.16795
G1 X134.339 Y131.072 E.01051
G1 X134.339 Y131.514 E.01162
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.457 E.10182
G1 X133.56 Y124.277 E.00438
G1 X135.14 Y124.277 E.03851
G1 X135.14 Y124.457 E.00438
G1 X135.14 Y131.293 E.1666
G1 X135.14 Y131.473 E.00438
G1 X134.781 Y131.473 E.00875
G1 X134.74 Y131.473 E.001
G1 X134.74 Y131.915 E.01078
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.529 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.886 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
M73 P62 R4
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.09997
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.125 Y129.852 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420382
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.26953
G1 X122.077 Y130.698 E.02064
G1 X133.523 Y130.698 E.27924
G1 X133.531 Y130.394 E.00742
G1 X133.721 Y130.251 E.00581
G1 X133.919 Y130.251 E.00481
G1 X133.919 Y129.857 E.00963
G1 X133.185 Y129.852 E.0179
; WIPE_START
G1 F7771.109
G1 X133.919 Y129.857 E-.27877
G1 X133.919 Y130.251 E-.14998
G1 X133.721 Y130.251 E-.07499
G1 X133.531 Y130.394 E-.09047
G1 X133.523 Y130.698 E-.1155
G1 X133.391 Y130.698 E-.05029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.764 Y130.402 Z.76 F42000
G1 X122.5 Y130.275 Z.76
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.494716
G1 F1200
M204 S6000
G1 X133.065 Y130.275 E.30737
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.356
G1 X131.065 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/23
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.298 J1.18 P1  F42000
G1 X134.324 Y129.451 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.763 E.03445
G1 X133.924 Y130.763 E.01051
G1 X133.924 Y131.099 E.00882
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.571 E.11726
G1 X134.739 Y124.571 E.02045
G1 X134.739 Y131.179 E.17355
G1 X134.339 Y131.179 E.01051
G1 X134.339 Y131.514 E.00882
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P63 R4
G1 F1200
M204 S5000
G1 X133.56 Y124.236 E.1072
G1 X133.56 Y124.171 E.0016
G1 X135.14 Y124.171 E.03851
G1 X135.14 Y124.236 E.0016
G1 X135.14 Y131.514 E.17736
G1 X135.14 Y131.579 E.0016
G1 X134.781 Y131.579 E.00875
G1 X134.74 Y131.579 E.001
G1 X134.74 Y131.915 E.00819
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.527 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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
G1 X134.35 Y124.779 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10241
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.167 Y129.852 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.27029
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.544 Y130.467 E.00565
; LINE_WIDTH: 0.435901
G1 X133.63 Y130.399 E.00279
; LINE_WIDTH: 0.481229
G1 X133.716 Y130.33 E.0031
G1 X133.891 Y130.33 E.00495
G1 X133.891 Y129.884 E.01261
; LINE_WIDTH: 0.467711
M73 P63 R3
G1 X133.559 Y129.869 E.0091
; LINE_WIDTH: 0.435901
G1 X133.227 Y129.855 E.00843
; WIPE_START
M73 P64 R3
G1 F7470.771
G1 X133.559 Y129.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.932 Y130.149 Z.92 F42000
G1 X122.5 Y130.275 Z.92
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.494716
G1 F1200
M204 S6000
G1 X133.107 Y130.275 E.3086
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.356
G1 X131.107 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/23
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S229.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I.302 J1.179 P1  F42000
G1 X134.324 Y129.451 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.823 E.03603
G1 X133.924 Y130.823 E.01051
G1 X133.924 Y131.099 E.00724
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.511 E.11885
G1 X134.739 Y124.511 E.02045
G1 X134.739 Y131.239 E.17672
G1 X134.339 Y131.239 E.01051
G1 X134.339 Y131.514 E.00724
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.13 E.1098
G1 X133.56 Y124.111 E.00047
G1 X135.14 Y124.111 E.03851
G1 X135.14 Y124.13 E.00047
G1 X135.14 Y131.62 E.18255
G1 X135.14 Y131.639 E.00047
G1 X134.781 Y131.639 E.00875
G1 X134.74 Y131.639 E.001
G1 X134.74 Y131.915 E.00672
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.527 Y126.635 E-.76
; WIPE_END
M73 P65 R3
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.719 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.1038
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.555 Y130.509 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X133.716 Y130.423 E.00445
G1 X133.923 Y130.423 E.00505
G1 X133.923 Y129.852 E.0139
G1 X122.077 Y129.852 E.28871
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.545 Y130.568 E.00322
; WIPE_START
G1 F7778.873
G1 X133.523 Y130.698 E-.05015
G1 X131.655 Y130.698 E-.70986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.031 Y130.346 Z1.08 F42000
G1 X122.5 Y130.275 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.494716
M73 P66 R3
G1 F1200
M204 S6000
G1 X133.143 Y130.275 E.30963
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.356
G1 X131.143 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/23
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.305 J1.178 P1  F42000
G1 X134.324 Y129.451 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.848 E.03668
G1 X133.924 Y130.848 E.01051
G1 X133.924 Y131.099 E.00659
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.487 E.11949
G1 X134.739 Y124.487 E.02045
G1 X134.739 Y131.263 E.17801
G1 X134.339 Y131.263 E.01051
G1 X134.339 Y131.514 E.00659
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.086 E.11087
G1 X135.14 Y124.086 E.03851
G1 X135.14 Y131.664 E.18469
G1 X134.74 Y131.664 E.00975
G1 X134.74 Y131.915 E.00612
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.694 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10436
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.561 Y130.526 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
M73 P67 R3
G1 X133.716 Y130.447 E.00424
G1 X133.923 Y130.447 E.00505
G1 X133.923 Y129.852 E.0145
G1 X122.077 Y129.852 E.28871
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.548 Y130.584 E.00284
; WIPE_START
G1 F7778.873
G1 X133.523 Y130.698 E-.04425
G1 X131.639 Y130.698 E-.71575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.015 Y130.345 Z1.24 F42000
G1 X122.5 Y130.275 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.494716
G1 F1200
M204 S6000
G1 X133.16 Y130.275 E.31013
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.356
G1 X131.16 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/23
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I.307 J1.178 P1  F42000
G1 X134.324 Y129.451 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
M73 P68 R3
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.588 Y129.807 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X133.524 Y130.743 E.03478
G1 X133.053 Y130.743 E.01238
G1 X133.304 Y129.807 E.02546
M204 S10000
G1 X133.568 Y130.579 F42000
G1 F1200
M204 S6000
G1 X133.568 Y130.493 E.00226
G1 X133.968 Y130.493 E.01051
G1 X133.968 Y129.807 E.01803
G1 X133.722 Y129.807 E.00647
G1 X130.228 Y130.743 E.09502
G1 X130.445 Y130.743 E.00571
G1 X130.696 Y129.807 E.02546
M73 P69 R3
G1 X130.807 Y129.807 E.00292
G1 X131.749 Y130.743 E.03489
G1 X132 Y129.807 E.02546
G1 X131.015 Y129.807 E.02588
M204 S10000
G1 X130.488 Y129.807 F42000
G1 F1200
M204 S6000
G1 X129.392 Y129.807 E.02879
G1 X129.141 Y130.743 E.02546
G1 X129.962 Y130.743 E.02156
G1 X129.026 Y129.807 E.03478
G1 X128.855 Y129.807 E.00448
G1 X125.229 Y130.743 E.09838
G1 X125.463 Y129.807 E.02535
G1 X126.399 Y130.743 E.03478
M204 S10000
G1 X126.533 Y130.743 F42000
G1 F1200
M204 S6000
G1 X126.784 Y129.807 E.02546
G1 X127.244 Y129.807 E.0121
G1 X128.181 Y130.743 E.03478
G1 X127.837 Y130.743 E.00902
G1 X128.088 Y129.807 E.02546
; WIPE_START
G1 F7217.373
G1 X127.837 Y130.743 E-.36831
G1 X128.181 Y130.743 E-.13056
G1 X127.695 Y130.257 E-.26113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.781 Y129.807 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X123.682 Y129.807 E.0026
G1 X124.618 Y130.743 E.03478
G1 X123.925 Y130.743 E.0182
G1 X124.176 Y129.807 E.02546
G1 X123.989 Y129.807 E.00492
G1 X122.032 Y130.331 E.05321
G1 X122.032 Y129.938 E.01032
G1 X122.837 Y130.743 E.02989
G1 X122.621 Y130.743 E.00567
G1 X122.872 Y129.807 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X122.621 Y130.743 E-.36832
G1 X122.837 Y130.743 E-.08195
G1 X122.26 Y130.167 E-.30973
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/23
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.072 J1.215 P1  F42000
G1 X134.324 Y129.451 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.07 Y130.743 Z1.56 F42000
M73 P70 R3
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X130.665 Y130.743 E.01063
G1 X133.968 Y129.858 E.08983
G1 X133.968 Y130.493 E.01668
G1 X133.642 Y130.493 E.00856
M204 S10000
G1 X133.187 Y129.807 F42000
G1 F1200
M204 S6000
G1 X132.936 Y130.743 E.02546
G1 X133.568 Y130.743 E.01661
G1 X133.568 Y130.627 E.00305
G1 X132.748 Y129.807 E.03046
G1 X131.883 Y129.807 E.02274
G1 X131.632 Y130.743 E.02546
M204 S10000
G1 X131.903 Y130.743 F42000
G1 F1200
M204 S6000
G1 X130.967 Y129.807 E.03478
G1 X130.579 Y129.807 E.0102
G1 X130.328 Y130.743 E.02546
G1 X130.122 Y130.743 E.00541
G1 X129.186 Y129.807 E.03478
G1 X128.887 Y129.807 E.00783
; WIPE_START
G1 F7217.373
G1 X129.186 Y129.807 E-.11329
G1 X130.122 Y130.743 E-.50313
G1 X130.328 Y130.743 E-.07828
G1 X130.372 Y130.577 E-.06529
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P71 R3
G1 X123.842 Y129.807 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.778 Y130.743 E.03478
G1 X125.112 Y130.743 E.00877
G1 X125.363 Y129.807 E.02546
G1 X125.623 Y129.807 E.00684
G1 X126.559 Y130.743 E.03478
M204 S10000
G1 X126.416 Y130.743 F42000
G1 F1200
M204 S6000
G1 X126.667 Y129.807 E.02546
G1 X125.831 Y129.807 E.02196
; WIPE_START
G1 F7217.373
G1 X126.667 Y129.807 E-.35192
G1 X126.416 Y130.743 E-.40808
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.083 Y130.743 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X127.72 Y130.743 E.01673
G1 X127.971 Y129.807 E.02546
G1 X127.404 Y129.807 E.01488
G1 X128.341 Y130.743 E.03478
G1 X129.024 Y130.743 E.01795
G1 X129.292 Y129.807 E.02558
G1 X125.798 Y130.743 E.09502
G1 X125.32 Y130.743 E.01257
M204 S10000
G1 X124.57 Y130.743 F42000
G1 F1200
M204 S6000
G1 X123.808 Y130.743 E.02002
G1 X124.059 Y129.807 E.02546
G1 X124.426 Y129.807 E.00964
G1 X122.032 Y130.448 E.0651
G1 X122.032 Y129.807 E.01685
G1 X122.997 Y130.743 E.03531
G1 X122.504 Y130.743 E.01294
G1 X122.755 Y129.807 E.02546
G1 X122.268 Y129.807 E.01278
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X122.755 Y129.807 E-.18485
G1 X122.504 Y130.743 E-.36832
G1 X122.997 Y130.743 E-.18727
G1 X122.96 Y130.707 E-.01957
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/23
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I.134 J1.21 P1  F42000
G1 X134.324 Y129.451 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.568 Y130.675 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X133.568 Y130.743 E.0018
G1 X132.819 Y130.743 E.01969
G1 X133.07 Y129.807 E.02546
G1 X132.908 Y129.807 E.00424
G1 X133.594 Y130.493 E.02549
G1 X133.968 Y130.493 E.00982
G1 X133.968 Y129.975 E.01361
G1 X131.102 Y130.743 E.07794
G1 X130.49 Y130.743 E.01609
; WIPE_START
M73 P72 R3
G1 F7217.373
G1 X131.102 Y130.743 E-.2327
G1 X132.442 Y130.384 E-.5273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.515 Y130.743 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X131.766 Y129.807 E.02546
G1 X131.127 Y129.807 E.01678
G1 X132.063 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X131.127 Y129.807 E-.50313
G1 X131.766 Y129.807 E-.24269
G1 X131.756 Y129.843 E-.01418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.293 Y130.743 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X127.603 Y130.743 E.01812
G1 X127.854 Y129.807 E.02546
G1 X127.564 Y129.807 E.0076
G1 X128.501 Y130.743 E.03478
G1 X128.907 Y130.743 E.01067
G1 X129.158 Y129.807 E.02546
M204 S10000
G1 X129.937 Y129.807 F42000
G1 F1200
M204 S6000
G1 X130.462 Y129.807 E.01377
G1 X130.211 Y130.743 E.02546
G1 X130.282 Y130.743 E.00187
G1 X129.346 Y129.807 E.03478
G1 X129.729 Y129.807 E.01008
G1 X126.235 Y130.743 E.09502
G1 X126.299 Y130.743 E.00166
G1 X126.55 Y129.807 E.02546
G1 X125.783 Y129.807 E.02014
G1 X126.719 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X125.783 Y129.807 E-.50313
G1 X126.459 Y129.807 E-.25687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.002 Y129.807 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.995 Y130.743 E.03585
G1 X125.246 Y129.807 E.02546
G1 X124.863 Y129.807 E.01005
G1 X122.032 Y130.565 E.07699
G1 X122.032 Y130.743 E.00467
G1 X122.387 Y130.743 E.00932
G1 X122.637 Y129.807 E.02546
G1 X122.22 Y129.807 E.01096
G1 X123.157 Y130.743 E.03478
G1 X123.691 Y130.743 E.01403
G1 X123.941 Y129.807 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X123.691 Y130.743 E-.36832
G1 X123.157 Y130.743 E-.20295
G1 X122.805 Y130.392 E-.18874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/23
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I.099 J1.213 P1  F42000
G1 X134.324 Y129.451 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P73 R3
G1 X133.56 Y124.085 E.11089
M73 P73 R2
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.702 Y130.743 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X132.952 Y129.807 E.02546
G1 X133.068 Y129.807 E.00304
G1 X133.754 Y130.493 E.02549
G1 X133.968 Y130.493 E.00561
G1 X133.968 Y130.092 E.01053
G1 X131.398 Y130.743 E.06965
G1 X131.648 Y129.807 E.02546
G1 X131.287 Y129.807 E.0095
G1 X132.223 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X131.287 Y129.807 E-.50313
G1 X131.648 Y129.807 E-.13739
G1 X131.567 Y130.111 E-.11948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.486 Y130.743 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X127.724 Y129.807 E.02538
G1 X128.661 Y130.743 E.03478
G1 X128.79 Y130.743 E.00339
G1 X129.04 Y129.807 E.02546
M204 S10000
G1 X129.506 Y129.807 F42000
G1 F1200
M204 S6000
M73 P74 R2
G1 X130.442 Y130.743 E.03478
G1 X130.094 Y130.743 E.00915
G1 X130.344 Y129.807 E.02546
G1 X130.167 Y129.807 E.00467
G1 X126.672 Y130.743 E.09502
G1 X126.879 Y130.743 E.00543
G1 X125.943 Y129.807 E.03478
G1 X126.432 Y129.807 E.01286
G1 X126.182 Y130.743 E.02546
G1 X125.306 Y130.743 E.02301
; WIPE_START
G1 F7217.373
G1 X126.182 Y130.743 E-.33282
G1 X126.432 Y129.807 E-.36832
G1 X126.277 Y129.807 E-.05887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.162 Y129.807 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X125.098 Y130.743 E.03478
G1 X124.878 Y130.743 E.00579
G1 X125.128 Y129.807 E.02546
G1 X125.3 Y129.807 E.0045
G1 X122.032 Y130.683 E.08887
G1 X122.032 Y130.743 E.00159
G1 X122.27 Y130.743 E.00624
G1 X122.52 Y129.807 E.02546
G1 X122.38 Y129.807 E.00368
G1 X123.317 Y130.743 E.03478
G1 X123.574 Y130.743 E.00675
G1 X123.824 Y129.807 E.02546
G1 X122.728 Y129.807 E.02879
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X123.824 Y129.807 E-.41655
G1 X123.59 Y130.68 E-.34345
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/23
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I.138 J1.209 P1  F42000
G1 X134.324 Y129.451 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.584 Y130.743 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X132.835 Y129.807 E.02546
G1 X133.228 Y129.807 E.01032
G1 X133.914 Y130.493 E.02549
G1 X133.968 Y130.493 E.00141
G1 X133.968 Y130.209 E.00745
M73 P75 R2
G1 X131.976 Y130.743 E.05417
G1 X131.28 Y130.743 E.01828
G1 X131.531 Y129.807 E.02546
G1 X131.447 Y129.807 E.00222
G1 X132.383 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X131.447 Y129.807 E-.50313
G1 X131.531 Y129.807 E-.03208
G1 X131.378 Y130.378 E-.22479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.666 Y129.807 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X130.602 Y130.743 E.03478
G1 X129.976 Y130.743 E.01643
G1 X130.227 Y129.807 E.02546
G1 X130.604 Y129.807 E.00989
G1 X127.11 Y130.743 E.09502
G1 X127.039 Y130.743 E.00185
G1 X126.103 Y129.807 E.03478
G1 X126.315 Y129.807 E.00558
G1 X126.064 Y130.743 E.02546
G1 X126.831 Y130.743 E.02015
M204 S10000
G1 X127.317 Y130.743 F42000
G1 F1200
M204 S6000
G1 X127.368 Y130.743 E.00134
G1 X127.619 Y129.807 E.02546
G1 X127.884 Y129.807 E.00696
G1 X128.821 Y130.743 E.03478
M73 P76 R2
G1 X128.672 Y130.743 E.00389
G1 X128.923 Y129.807 E.02546
G1 X128.092 Y129.807 E.02183
; WIPE_START
G1 F7217.373
G1 X128.923 Y129.807 E-.31586
G1 X128.672 Y130.743 E-.36832
G1 X128.821 Y130.743 E-.05627
G1 X128.784 Y130.707 E-.01956
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.332 Y129.807 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X125.737 Y129.807 E.01063
G1 X122.152 Y130.743 E.09732
G1 X122.403 Y129.807 E.02546
G1 X122.54 Y129.807 E.0036
G1 X123.477 Y130.743 E.03478
M204 S10000
G1 X123.456 Y130.743 F42000
G1 F1200
M204 S6000
G1 X123.707 Y129.807 E.02546
G1 X124.322 Y129.807 E.01614
G1 X125.258 Y130.743 E.03478
G1 X124.76 Y130.743 E.01307
G1 X125.011 Y129.807 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X124.76 Y130.743 E-.36832
G1 X125.258 Y130.743 E-.18904
G1 X124.881 Y130.366 E-.20264
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/23
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I.117 J1.211 P1  F42000
G1 X134.324 Y129.451 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
M204 S10000
G1 X133.968 Y130.119 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X133.968 Y129.807 E.00819
G1 X133.388 Y129.807 E.01523
G1 X133.968 Y130.387 E.02154
G1 X133.968 Y130.327 E.00158
G1 X132.413 Y130.743 E.04228
G1 X132.467 Y130.743 E.00142
G1 X132.718 Y129.807 E.02546
G1 X131.815 Y129.807 E.02373
; WIPE_START
G1 F7217.373
G1 X132.718 Y129.807 E-.34332
G1 X132.467 Y130.743 E-.36832
G1 X132.413 Y130.743 E-.0205
G1 X132.484 Y130.724 E-.02786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.818 Y130.743 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X132.543 Y130.743 E.00723
G1 X131.607 Y129.807 E.03478
G1 X131.414 Y129.807 E.00506
G1 X131.163 Y130.743 E.02546
M73 P77 R2
G1 X130.762 Y130.743 E.01055
G1 X129.826 Y129.807 E.03478
M204 S10000
G1 X129.618 Y129.807 F42000
G1 F1200
M204 S6000
G1 X128.806 Y129.807 E.02132
G1 X128.555 Y130.743 E.02546
M204 S10000
G1 X127.952 Y130.743 F42000
G1 F1200
M204 S6000
G1 X127.547 Y130.743 E.01063
G1 X131.041 Y129.807 E.09502
G1 X130.636 Y129.807 E.01063
M204 S10000
G1 X130.11 Y129.807 F42000
G1 F1200
M204 S6000
G1 X129.859 Y130.743 E.02546
G1 X128.981 Y130.743 E.02308
G1 X128.044 Y129.807 E.03478
G1 X127.502 Y129.807 E.01424
G1 X127.251 Y130.743 E.02546
G1 X127.199 Y130.743 E.00137
G1 X126.263 Y129.807 E.03478
G1 X127.294 Y129.807 E.02709
; WIPE_START
G1 F7217.373
G1 X126.263 Y129.807 E-.39192
G1 X126.948 Y130.492 E-.36808
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.21 Y130.743 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.643 Y130.743 E.01489
G1 X124.894 Y129.807 E.02546
; WIPE_START
G1 F7217.373
G1 X124.643 Y130.743 E-.47957
G1 X125.21 Y130.743 E-.28043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.637 Y130.743 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X122.7 Y129.807 E.03478
G1 X122.286 Y129.807 E.01088
G1 X122.035 Y130.743 E.02546
G1 X122.68 Y130.743 E.01694
G1 X126.198 Y129.807 E.09563
G1 X125.947 Y130.743 E.02546
G1 X125.418 Y130.743 E.01391
G1 X124.482 Y129.807 E.03478
G1 X123.59 Y129.807 E.02342
G1 X123.339 Y130.743 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X123.59 Y129.807 E-.36832
G1 X124.482 Y129.807 E-.33879
G1 X124.58 Y129.905 E-.0529
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/23
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I.057 J1.216 P1  F42000
G1 X134.324 Y129.451 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
M204 S10000
G1 X133.968 Y130.019 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P78 R2
G1 F1200
M204 S6000
G1 X133.968 Y129.807 E.00557
G1 X133.905 Y129.807 E.00166
G1 X133.721 Y130.493 E.01866
G2 X133.968 Y130.444 I.031 J-.485 E.00669
G1 X133.968 Y130.227 E.0057
G1 X133.548 Y129.807 E.0156
G1 X132.809 Y129.807 E.01942
M204 S10000
G1 X133.058 Y130.743 F42000
G1 F1200
M204 S6000
G1 X133.568 Y130.743 E.01339
G1 X133.568 Y130.551 E.00505
G1 X132.703 Y130.743 E.02328
G1 X131.767 Y129.807 E.03478
G1 X132.601 Y129.807 E.02191
G1 X132.35 Y130.743 E.02546
G1 X131.254 Y130.743 E.02879
M204 S10000
G1 X130.714 Y130.743 F42000
G1 F1200
M204 S6000
G1 X129.742 Y130.743 E.02553
G1 X129.986 Y129.807 E.02541
G1 X130.922 Y130.743 E.03478
G1 X131.046 Y130.743 E.00327
G1 X131.297 Y129.807 E.02546
G1 X131.478 Y129.807 E.00475
G1 X127.984 Y130.743 E.09502
G1 X127.567 Y130.743 E.01095
M204 S10000
G1 X128.438 Y130.743 F42000
G1 F1200
M204 S6000
G1 X128.689 Y129.807 E.02546
G1 X128.204 Y129.807 E.01273
G1 X129.141 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X128.204 Y129.807 E-.50313
G1 X128.689 Y129.807 E-.18421
G1 X128.64 Y129.992 E-.07265
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P79 R2
G1 X127.996 Y129.807 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X127.385 Y129.807 E.01606
G1 X127.134 Y130.743 E.02546
G1 X127.359 Y130.743 E.00591
G1 X126.423 Y129.807 E.03478
G1 X126.611 Y129.807 E.00495
G1 X123.117 Y130.743 E.09502
G1 X123.222 Y130.743 E.00276
G1 X123.473 Y129.807 E.02546
G1 X122.86 Y129.807 E.01609
G1 X123.797 Y130.743 E.03478
; WIPE_START
G1 F7217.373
G1 X122.86 Y129.807 E-.50313
G1 X123.473 Y129.807 E-.23282
G1 X123.457 Y129.868 E-.02405
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.37 Y130.743 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.526 Y130.743 E.02217
G1 X124.777 Y129.807 E.02546
G1 X124.642 Y129.807 E.00356
G1 X125.578 Y130.743 E.03478
G1 X125.83 Y130.743 E.00663
G1 X126.081 Y129.807 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X125.83 Y130.743 E-.36832
G1 X125.578 Y130.743 E-.09587
G1 X125.027 Y130.193 E-.29581
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/23
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I.097 J1.213 P1  F42000
G1 X134.324 Y129.451 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.071 Y130.743 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X133.537 Y130.743 E.01224
G2 X133.568 Y130.493 I-.451 J-.183 E.00669
G1 X133.788 Y129.807 E.01893
G1 X133.708 Y129.807 E.00209
G1 X133.968 Y130.067 E.00966
G1 X133.968 Y130.493 E.0112
G1 X133.812 Y130.493 E.0041
M204 S10000
G1 X133.5 Y129.807 F42000
G1 F1200
M204 S6000
G1 X132.484 Y129.807 E.0267
G1 X132.233 Y130.743 E.02546
G1 X132.863 Y130.743 E.01655
G1 X131.915 Y129.807 E.035
G1 X128.321 Y130.743 E.09756
M73 P80 R2
G1 X128.572 Y129.807 E.02546
G1 X128.364 Y129.807 E.00545
G1 X129.301 Y130.743 E.03478
M204 S10000
G1 X129.625 Y130.743 F42000
G1 F1200
M204 S6000
G1 X129.876 Y129.807 E.02546
G1 X130.146 Y129.807 E.00708
G1 X131.082 Y130.743 E.03478
G1 X130.929 Y130.743 E.00401
G1 X131.18 Y129.807 E.02546
; WIPE_START
G1 F7217.373
G1 X130.929 Y130.743 E-.36832
G1 X131.082 Y130.743 E-.05804
G1 X130.461 Y130.122 E-.33365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.409 Y130.743 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.66 Y129.807 E.02546
G1 X124.802 Y129.807 E.00372
G1 X125.738 Y130.743 E.03478
G1 X125.964 Y129.807 E.0253
M204 S10000
G1 X126.583 Y129.807 F42000
G1 F1200
M204 S6000
G1 X127.519 Y130.743 E.03478
G1 X127.017 Y130.743 E.01319
G1 X127.268 Y129.807 E.02546
G1 X127.048 Y129.807 E.00577
G1 X123.554 Y130.743 E.09502
G1 X123.957 Y130.743 E.01057
G1 X123.02 Y129.807 E.03478
G1 X123.356 Y129.807 E.00881
G1 X123.105 Y130.743 E.02546
G1 X122.032 Y130.743 E.02819
G1 X122.032 Y130.154 E.01548
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X122.032 Y130.743 E-.22401
G1 X123.105 Y130.743 E-.4078
G1 X123.192 Y130.417 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/23
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I.105 J1.212 P1  F42000
G1 X134.324 Y129.451 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
M73 P81 R2
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.412 Y130.743 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.858 Y130.743 E.01173
G1 X132.352 Y129.807 E.09502
G1 X132.116 Y130.743 E.02536
G1 X132.815 Y130.743 E.01837
M204 S10000
G1 X133.568 Y130.683 F42000
G1 F1200
M204 S6000
G1 X133.568 Y130.493 E.005
G1 X133.968 Y130.493 E.01051
G1 X133.968 Y129.807 E.01803
G1 X133.671 Y129.807 E.00781
G1 X133.42 Y130.743 E.02546
G1 X133.023 Y130.743 E.01042
G1 X132.087 Y129.807 E.03478
G1 X132.144 Y129.807 E.00151
; WIPE_START
G1 F7217.373
G1 X132.087 Y129.807 E-.02183
G1 X133.023 Y130.743 E-.50313
G1 X133.42 Y130.743 E-.1508
G1 X133.477 Y130.529 E-.08425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.513 Y129.807 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X131.063 Y129.807 E.01443
G1 X130.812 Y130.743 E.02546
G1 X131.242 Y130.743 E.01129
M73 P82 R2
G1 X130.306 Y129.807 E.03478
M73 P82 R1
G1 X129.759 Y129.807 E.01436
G1 X129.508 Y130.743 E.02546
M204 S10000
G1 X129.461 Y130.743 F42000
G1 F1200
M204 S6000
G1 X128.524 Y129.807 E.03478
G1 X128.455 Y129.807 E.00183
G1 X128.204 Y130.743 E.02546
G1 X127.679 Y130.743 E.01378
G1 X126.743 Y129.807 E.03478
; WIPE_START
G1 F7217.373
G1 X127.679 Y130.743 E-.50313
G1 X128.204 Y130.743 E-.1994
G1 X128.243 Y130.597 E-.05747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.106 Y130.743 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.9 Y130.743 E.02086
G1 X127.151 Y129.807 E.02546
G1 X127.486 Y129.807 E.00879
G1 X123.991 Y130.743 E.09502
G1 X124.117 Y130.743 E.00329
G1 X123.18 Y129.807 E.03478
G1 X123.239 Y129.807 E.00153
G1 X122.988 Y130.743 E.02546
G1 X122.335 Y130.743 E.01714
G1 X122.032 Y130.44 E.01127
G1 X122.032 Y129.807 E.01662
G1 X122.973 Y129.807 E.02471
; WIPE_START
G1 F7217.373
G1 X122.032 Y129.807 E-.35745
G1 X122.032 Y130.44 E-.24047
G1 X122.333 Y130.741 E-.16208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.292 Y130.743 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.543 Y129.807 E.02546
G1 X124.962 Y129.807 E.011
G1 X125.898 Y130.743 E.03478
G1 X125.596 Y130.743 E.00793
G1 X125.847 Y129.807 E.02546
G1 X125.169 Y129.807 E.01779
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X125.847 Y129.807 E-.25736
G1 X125.596 Y130.743 E-.36832
G1 X125.898 Y130.743 E-.11475
G1 X125.861 Y130.707 E-.01957
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/23
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I.179 J1.204 P1  F42000
G1 X134.324 Y129.451 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.194 Y130.743 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X130.695 Y130.743 E.01311
G1 X130.946 Y129.807 E.02546
G1 X130.466 Y129.807 E.01261
G1 X131.402 Y130.743 E.03478
G1 X131.999 Y130.743 E.01568
G1 X132.25 Y129.807 E.02546
M204 S10000
G1 X132.247 Y129.807 F42000
G1 F1200
M204 S6000
M73 P83 R1
G1 X133.183 Y130.743 E.03478
G1 X133.303 Y130.743 E.00314
G1 X133.554 Y129.807 E.02546
G1 X132.789 Y129.807 E.02008
G1 X129.295 Y130.743 E.09502
G1 X129.391 Y130.743 E.00251
G1 X129.642 Y129.807 E.02546
G1 X128.892 Y129.807 E.01969
M204 S10000
G1 X128.13 Y129.807 F42000
G1 F1200
M204 S6000
G1 X127.923 Y129.807 E.00544
G1 X124.429 Y130.743 E.09502
G1 X124.833 Y130.743 E.01063
M204 S10000
G1 X125.479 Y130.743 F42000
G1 F1200
M204 S6000
G1 X125.73 Y129.807 E.02546
G1 X125.122 Y129.807 E.01597
G1 X126.058 Y130.743 E.03478
G1 X126.783 Y130.743 E.01904
G1 X127.034 Y129.807 E.02546
M204 S10000
G1 X126.903 Y129.807 F42000
G1 F1200
M204 S6000
G1 X127.839 Y130.743 E.03478
G1 X128.087 Y130.743 E.0065
G1 X128.338 Y129.807 E.02546
G1 X128.684 Y129.807 E.00911
G1 X129.599 Y130.743 E.03438
; WIPE_START
G1 F7217.373
G1 X128.684 Y129.807 E-.49729
M73 P84 R1
G1 X128.338 Y129.807 E-.13172
G1 X128.248 Y130.14 E-.13099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.914 Y129.807 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.426 Y129.807 E.01282
G1 X124.175 Y130.743 E.02546
G1 X124.277 Y130.743 E.00267
G1 X123.34 Y129.807 E.03478
G1 X124.218 Y129.807 E.02305
M204 S10000
G1 X123.967 Y130.743 F42000
G1 F1200
M204 S6000
G1 X122.871 Y130.743 E.02879
G1 X123.122 Y129.807 E.02546
G1 X122.032 Y130.081 E.02952
G1 X122.032 Y130.28 E.00521
G1 X122.495 Y130.743 E.01721
G1 X122.032 Y130.743 E.01217
G1 X122.032 Y130.488 E.00671
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X122.032 Y130.743 E-.09712
G1 X122.495 Y130.743 E-.1761
G1 X122.032 Y130.28 E-.24904
G1 X122.032 Y130.081 E-.07539
G1 X122.446 Y129.977 E-.16236
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/23
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I.054 J1.216 P1  F42000
G1 X134.324 Y129.451 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.578 Y130.743 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X130.829 Y129.807 E.02546
G1 X130.626 Y129.807 E.00533
G1 X131.562 Y130.743 E.03478
G1 X131.882 Y130.743 E.0084
G1 X132.133 Y129.807 E.02546
M204 S10000
G1 X132.407 Y129.807 F42000
G1 F1200
M204 S6000
G1 X133.343 Y130.743 E.03478
G1 X133.186 Y130.743 E.00413
G1 X133.437 Y129.807 E.02546
G1 X133.226 Y129.807 E.00552
G1 X129.732 Y130.743 E.09502
G1 X129.781 Y130.743 E.00126
G1 X128.844 Y129.807 E.03478
G1 X129.525 Y129.807 E.01787
G1 X129.274 Y130.743 E.02546
G1 X128.207 Y130.743 E.02802
; WIPE_START
G1 F7217.373
G1 X129.274 Y130.743 E-.40533
G1 X129.515 Y129.842 E-.35467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.644 Y130.743 Z3 F42000
M73 P85 R1
G1 Z2.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X124.866 Y130.743 E.00581
G1 X128.36 Y129.807 E.09502
G1 X128.221 Y129.807 E.00366
G1 X127.97 Y130.743 E.02546
G1 X127.063 Y129.807 E.03424
G1 X126.917 Y129.807 E.00385
G1 X126.666 Y130.743 E.02546
G1 X126.218 Y130.743 E.01176
G1 X125.282 Y129.807 E.03478
G1 X125.613 Y129.807 E.00869
G1 X125.362 Y130.743 E.02546
M204 S10000
G1 X125.074 Y129.807 F42000
G1 F1200
M204 S6000
G1 X124.308 Y129.807 E.0201
G1 X124.058 Y130.743 E.02546
G1 X124.437 Y130.743 E.00995
G1 X123.5 Y129.807 E.03478
G1 X122.032 Y130.198 E.03992
G1 X122.032 Y130.12 E.00207
G1 X122.655 Y130.743 E.02316
G1 X122.754 Y130.743 E.00258
G1 X123.004 Y129.807 E.02546
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7217.373
G1 X122.754 Y130.743 E-.36832
G1 X122.655 Y130.743 E-.03738
G1 X122.032 Y130.12 E-.33501
G1 X122.032 Y130.171 E-.01929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/23
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I.071 J1.215 P1  F42000
G1 X134.324 Y129.451 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
M73 P86 R1
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
M204 S10000
G1 X133.923 Y129.852 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.28871
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.561 Y130.526 E.00429
G1 X133.716 Y130.448 E.00423
G1 X133.923 Y130.448 E.00505
G1 X133.923 Y129.912 E.01306
M204 S10000
G1 X133.22 Y130.275 F42000
; Slow Down Start
; LINE_WIDTH: 0.494696
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X122.56 Y130.275 E.31014
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X124.56 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/23
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I.102 J1.213 P1  F42000
G1 X134.324 Y129.451 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.849 E.03671
G1 X133.924 Y130.849 E.01051
G1 X133.924 Y131.099 E.00657
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.486 E.11952
G1 X134.739 Y124.486 E.02045
G1 X134.739 Y131.264 E.17806
G1 X134.339 Y131.264 E.01051
G1 X134.339 Y131.514 E.00657
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.085 E.11089
G1 X135.14 Y124.085 E.03851
G1 X135.14 Y131.665 E.18474
G1 X134.74 Y131.665 E.00975
G1 X134.74 Y131.915 E.00609
M73 P87 R1
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.693 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10438
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.561 Y130.526 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X133.716 Y130.448 E.00423
G1 X133.923 Y130.448 E.00505
G1 X133.923 Y129.852 E.01453
G1 X122.077 Y129.852 E.28871
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.548 Y130.585 E.00282
; WIPE_START
G1 F7778.873
G1 X133.523 Y130.698 E-.04401
G1 X131.639 Y130.698 E-.71599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.015 Y130.345 Z3.32 F42000
G1 X122.5 Y130.275 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.494706
G1 F1200
M204 S6000
G1 X133.16 Y130.275 E.31014
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.498
G1 X131.16 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/23
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I.307 J1.178 P1  F42000
G1 X134.324 Y129.451 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P88 R1
G1 F1200
M204 S6000
G1 X134.324 Y130.842 E.03653
G1 X133.924 Y130.842 E.01051
G1 X133.924 Y131.099 E.00674
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.492 E.11935
G1 X134.739 Y124.492 E.02045
G1 X134.739 Y131.258 E.17772
G1 X134.339 Y131.258 E.01051
G1 X134.339 Y131.514 E.00674
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.092 E.11073
G1 X135.14 Y124.092 E.03851
G1 X135.14 Y131.659 E.18442
G1 X134.74 Y131.659 E.00975
G1 X134.74 Y131.915 E.00625
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.526 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.7 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
M73 P89 R1
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10423
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.559 Y130.522 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X133.716 Y130.442 E.00429
G1 X133.923 Y130.442 E.00505
G1 X133.923 Y129.852 E.01437
G1 X122.077 Y129.852 E.28871
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.547 Y130.581 E.00292
; WIPE_START
G1 F7778.873
G1 X133.523 Y130.698 E-.04556
G1 X131.643 Y130.698 E-.71445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.019 Y130.345 Z3.48 F42000
G1 X122.5 Y130.275 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.494716
G1 F1200
M204 S6000
G1 X133.156 Y130.275 E.31001
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.356
G1 X131.156 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/23
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I.306 J1.178 P1  F42000
G1 X134.324 Y129.451 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.805 E.03556
G1 X133.924 Y130.805 E.01051
G1 X133.924 Y131.099 E.00771
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.529 E.11837
G1 X134.739 Y124.529 E.02045
G1 X134.739 Y131.221 E.17577
M73 P90 R1
G1 X134.339 Y131.221 E.01051
G1 X134.339 Y131.514 E.00771
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.129 E.10983
G1 X135.14 Y124.129 E.03851
G1 X135.14 Y131.621 E.18261
G1 X134.74 Y131.621 E.00975
G1 X134.74 Y131.915 E.00716
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.527 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.737 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10338
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.191 Y129.852 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.27087
G1 X122.077 Y130.698 E.02062
G1 X133.523 Y130.698 E.27896
G1 X133.552 Y130.496 E.00496
; LINE_WIDTH: 0.441529
G1 X133.634 Y130.429 E.00274
; LINE_WIDTH: 0.503018
G1 X133.716 Y130.361 E.00315
G1 X133.88 Y130.361 E.00486
G1 X133.88 Y129.895 E.01381
; LINE_WIDTH: 0.484594
G1 X133.565 Y129.875 E.00897
; LINE_WIDTH: 0.441529
G1 X133.251 Y129.856 E.00811
; WIPE_START
G1 F7367.523
G1 X133.565 Y129.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.938 Y130.151 Z3.64 F42000
G1 X122.5 Y130.275 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.494706
G1 F1200
M204 S6000
M73 P91 R1
G1 X133.131 Y130.275 E.30929
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.498
M73 P91 R0
G1 X131.131 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/23
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I.304 J1.178 P1  F42000
G1 X134.324 Y129.451 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.729 E.03357
G1 X133.924 Y130.729 E.01051
G1 X133.924 Y131.099 E.0097
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.605 E.11638
G1 X134.739 Y124.605 E.02045
G1 X134.739 Y131.145 E.17179
G1 X134.339 Y131.145 E.01051
G1 X134.339 Y131.514 E.0097
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.204 E.10798
G1 X135.14 Y124.204 E.03851
G1 X135.14 Y131.546 E.17892
M73 P92 R0
G1 X134.74 Y131.546 E.00975
G1 X134.74 Y131.915 E.009
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.527 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.813 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.10164
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.152 Y129.852 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421961
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.27128
G1 X122.077 Y130.698 E.02072
G1 X133.523 Y130.698 E.28038
G1 X133.539 Y130.444 E.00623
G1 X133.716 Y130.306 E.0055
G1 X133.9 Y130.306 E.00451
G1 X133.9 Y129.875 E.01055
G1 X133.211 Y129.854 E.01687
; WIPE_START
G1 F7739.45
G1 X133.9 Y129.875 E-.26176
G1 X133.9 Y130.306 E-.16363
G1 X133.716 Y130.306 E-.06997
G1 X133.539 Y130.444 E-.08536
G1 X133.523 Y130.698 E-.0966
G1 X133.305 Y130.698 E-.08268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.679 Y130.399 Z3.8 F42000
G1 X122.5 Y130.275 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.494706
G1 F1200
M204 S6000
G1 X133.092 Y130.275 E.30814
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.498
G1 X131.092 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/23
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I.301 J1.179 P1  F42000
G1 X134.324 Y129.451 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.324 Y130.599 E.03016
G1 X133.924 Y130.599 E.01051
M73 P93 R0
G1 X133.924 Y131.099 E.01312
G1 X121.676 Y131.099 E.32171
G1 X121.676 Y129.451 E.04327
G1 X134.264 Y129.451 E.33064
M204 S10000
G1 X133.961 Y129.036 F42000
G1 F1200
M204 S6000
G1 X133.961 Y124.735 E.11297
G1 X134.739 Y124.735 E.02045
G1 X134.739 Y131.015 E.16496
G1 X134.339 Y131.015 E.01051
G1 X134.339 Y131.514 E.01312
G1 X121.261 Y131.514 E.34355
G1 X121.261 Y129.036 E.06511
G1 X133.901 Y129.036 E.33202
M204 S250
G1 X133.56 Y128.635 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.334 E.10481
G1 X135.14 Y124.334 E.03851
G1 X135.14 Y131.416 E.17258
G1 X134.74 Y131.416 E.00975
G1 X134.74 Y131.915 E.01217
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.528 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.35 Y124.943 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F1200
M204 S6000
G1 X134.35 Y129.243 E.09866
; WIPE_START
G1 F8263.78
G1 X134.35 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.111 Y129.852 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41916
G1 F1200
M204 S6000
G1 X122.077 Y129.852 E.26834
G1 X122.077 Y130.698 E.02057
G1 X133.523 Y130.698 E.27835
G1 X133.527 Y130.355 E.00834
G1 X133.716 Y130.208 E.00582
M73 P94 R0
G1 X133.933 Y130.208 E.00528
G1 X133.933 Y129.842 E.00891
G1 X133.171 Y129.851 E.01852
; WIPE_START
G1 F7795.779
G1 X133.933 Y129.842 E-.28945
G1 X133.933 Y130.208 E-.13915
G1 X133.716 Y130.208 E-.08243
G1 X133.527 Y130.355 E-.091
G1 X133.523 Y130.698 E-.13035
G1 X133.45 Y130.698 E-.02763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.824 Y130.403 Z3.96 F42000
G1 X122.5 Y130.275 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.494706
G1 F1200
M204 S6000
G1 X133.051 Y130.275 E.30696
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6516.498
G1 X131.051 Y130.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/23
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I.666 J1.019 P1  F42000
G1 X133.56 Y128.635 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.56 Y124.581 E.0988
G1 X135.14 Y124.581 E.03851
G1 X135.14 Y131.169 E.16055
G1 X134.74 Y131.169 E.00975
G1 X134.74 Y131.915 E.01819
G1 X120.86 Y131.915 E.33828
G1 X120.86 Y128.635 E.07994
G1 X133.5 Y128.635 E.30806
; WIPE_START
G1 F3000
M204 S6000
G1 X133.53 Y126.635 E-.76
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
G1 X0 Y128.207 F18000 ; move to safe pos
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


G1 X134.338 Y124.793 F42000
G1 Z3.72
M73 P95 R0
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X134.928 Y125.383 E.02034
G1 X134.928 Y125.929
G1 X133.792 Y124.793 E.03914
G1 X133.772 Y125.318
G1 X134.928 Y126.474 E.03984
G1 X134.928 Y127.02
G1 X133.772 Y125.864 E.03984
G1 X133.772 Y126.409
G1 X134.928 Y127.565 E.03984
G1 X134.928 Y128.11
G1 X133.772 Y126.955 E.03984
G1 X133.772 Y127.5
G1 X134.928 Y128.656 E.03984
G1 X134.928 Y129.201
G1 X133.772 Y128.045 E.03984
G1 X133.772 Y128.591
G1 X134.928 Y129.747 E.03984
G1 X134.928 Y130.292
G1 X133.483 Y128.847 E.0498
G1 X132.938 Y128.847
G1 X134.928 Y130.837 E.0686
G1 X134.528 Y130.983
G1 X132.392 Y128.847 E.07361
G1 X131.847 Y128.847
G1 X134.528 Y131.528 E.09241
G1 X134.157 Y131.703
G1 X131.301 Y128.847 E.09843
G1 X130.756 Y128.847
G1 X133.612 Y131.703 E.09843
G1 X133.066 Y131.703
G1 X130.211 Y128.847 E.09843
G1 X129.665 Y128.847
G1 X132.521 Y131.703 E.09843
G1 X131.976 Y131.703
G1 X129.12 Y128.847 E.09843
G1 X128.574 Y128.847
G1 X131.43 Y131.703 E.09843
G1 X130.885 Y131.703
G1 X128.029 Y128.847 E.09843
G1 X127.484 Y128.847
G1 X130.339 Y131.703 E.09843
G1 X129.794 Y131.703
G1 X126.938 Y128.847 E.09843
G1 X126.393 Y128.847
G1 X129.248 Y131.703 E.09843
G1 X128.703 Y131.703
G1 X125.847 Y128.847 E.09843
G1 X125.302 Y128.847
G1 X128.158 Y131.703 E.09843
G1 X127.612 Y131.703
G1 X124.756 Y128.847 E.09843
G1 X124.211 Y128.847
G1 X127.067 Y131.703 E.09843
G1 X126.521 Y131.703
M73 P96 R0
G1 X123.666 Y128.847 E.09843
G1 X123.12 Y128.847
G1 X125.976 Y131.703 E.09843
G1 X125.431 Y131.703
G1 X122.575 Y128.847 E.09843
G1 X122.029 Y128.847
G1 X124.885 Y131.703 E.09843
G1 X124.34 Y131.703
G1 X121.484 Y128.847 E.09843
G1 X121.072 Y128.981
G1 X123.794 Y131.703 E.09383
G1 X123.249 Y131.703
G1 X121.072 Y129.526 E.07503
G1 X121.072 Y130.071
G1 X122.704 Y131.703 E.05623
G1 X122.158 Y131.703
G1 X121.072 Y130.617 E.03744
G1 X121.072 Y131.162
G1 X121.613 Y131.703 E.01864
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F1800
M204 S6000
G1 X121.072 Y131.162 E-.29059
G1 X121.072 Y130.617 E-.20726
G1 X121.56 Y131.105 E-.26215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
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
G1 Z4.12 F900 ; lower z a little
G1 X0 Y128.207 F18000 ; move to safe pos
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

    G1 Z103.72 F600
    G1 Z101.72

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

