; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 10m 32s; total estimated time: 17m 6s
; total layer number: 38
; total filament length [mm] : 597.10
; total filament volume [cm^3] : 1436.20
; total filament weight [g] : 1.84
; model label id: 66,77,88
; object max height: 6.12,6.12,6.12
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 6.12
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
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.2
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
; default_acceleration = 4000
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
; fan_cooling_layer_time = 15
; fan_direction = undefine
; fan_max_speed = 50
; fan_min_speed = 30
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_bridge_speed = 25
; filament_change_length = 12
; filament_change_length_nc = 10
; filament_colour = #FFD00B
; filament_cooling_before_tower = 0
; filament_cost = 19.99
; filament_density = 1.28
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
; filament_flow_ratio = 0.94
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 18
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
; filament_prime_volume = 30
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PETG HF @BBL A1"
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
; filament_vendor = "Bambu Lab"
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
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10.6
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
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 150
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
; internal_solid_infill_speed = 200
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
; nozzle_temperature = 240
; nozzle_temperature_initial_layer = 230
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 230
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2,2,2,2
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
; print_settings_id = Duck MX fit coupons A1 PETG 0.16
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
; seam_position = nearest
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
; slow_down_layer_time = 7
; slow_down_min_speed = 10
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
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 200
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
; support_bottom_z_distance = 0.16
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
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 1
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 20
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 150
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
; wall_generator = arachne
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
M140 S70

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
M104 S230

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
M73 P0 R16
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S230

    M104 S250

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F449.008 T270
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
M104 S230
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

    M109 S240
    G1 E10 F92.5593
    M983 F1.54265 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
M73 P6 R15
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
        M983 F1.54265 A0.3 H0.4; cali dynamic extrusion compensation
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
    M984 A0.1 E1 S1 F1.54265 H0.4
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
M109 S180

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
M73 P35 R10
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
M73 P36 R10
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

M190 S70; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X117 Y117 I22 J22
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

M104 S230 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S230

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

    M109 S230
    G0 X128 E8  F222.142
    G0 X133 E.3742  F370.237
    G0 X138 E.3742  F1480.95
    G0 X143 E.3742  F370.237
    G0 X148 E.3742  F1480.95
    G0 X153 E.3742  F370.237
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
    G0 X128 E10  F222.142
    G0 X133 E.3742  F370.237
    G0 X138 E.3742  F1480.95
    G0 X143 E.3742  F370.237
    G0 X148 E.3742  F1480.95
    G0 X153 E.3742  F370.237
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
; layer num/total_layer_count: 1/38
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.239 Y118.239 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
M73 P37 R10
G1 F3000
M204 S500
G1 X137.761 Y118.239 E.26872
G1 X137.761 Y122 E.13436
G1 X137.761 Y125.761 E.13436
G1 X130.239 Y125.761 E.26872
G1 X130.239 Y118.299 E.26657
M204 S6000
G1 X129.782 Y117.782 F42000
G1 F3000
M204 S500
G1 X138.218 Y117.782 E.30137
G1 X138.218 Y122 E.15069
G1 X138.218 Y126.218 E.15069
G1 X129.782 Y126.218 E.30137
M73 P38 R10
G1 X129.782 Y117.842 E.29923
M204 S6000
G1 X129.325 Y117.325 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X138.675 Y117.325 E.33403
G1 X138.675 Y122 E.16702
G1 X138.675 Y126.675 E.16702
G1 X129.325 Y126.675 E.33403
G1 X129.325 Y117.385 E.33189
; WIPE_START
G1 X131.325 Y117.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 1 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer1 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X136.642 Y118.422 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50586
G1 F6300
M204 S500
G1 X137.372 Y119.153 E.03739
G1 X137.372 Y119.807 E.02369
G1 X136.193 Y118.628 E.06037
G1 X135.538 Y118.628 E.02369
G1 X137.372 Y120.462 E.09387
G1 X137.372 Y121.117 E.02369
G1 X134.883 Y118.628 E.12737
G1 X134.229 Y118.628 E.02369
G1 X137.372 Y121.771 E.16088
G1 X137.372 Y122.426 E.02369
G1 X133.574 Y118.628 E.19438
G1 X132.919 Y118.628 E.02369
G1 X137.372 Y123.081 E.22788
G1 X137.372 Y123.736 E.02369
G1 X132.264 Y118.628 E.26138
G1 X131.61 Y118.628 E.02369
G1 X137.372 Y124.39 E.29488
G1 X137.372 Y125.045 E.02369
G1 X130.955 Y118.628 E.32839
G1 X130.628 Y118.628 E.01185
G1 X130.628 Y118.955 E.01184
G1 X137.045 Y125.372 E.32839
G1 X136.39 Y125.372 E.02369
G1 X130.628 Y119.61 E.29489
G1 X130.628 Y120.264 E.02369
G1 X135.736 Y125.372 E.26139
G1 X135.081 Y125.372 E.02369
G1 X130.628 Y120.919 E.22789
G1 X130.628 Y121.574 E.02369
G1 X134.426 Y125.372 E.19438
G1 X133.772 Y125.372 E.02369
G1 X130.628 Y122.228 E.16088
G1 X130.628 Y122.883 E.02369
G1 X133.117 Y125.372 E.12738
G1 X132.462 Y125.372 E.02369
G1 X130.628 Y123.538 E.09388
M73 P39 R10
G1 X130.628 Y124.193 E.02369
G1 X131.808 Y125.372 E.06038
G1 X131.153 Y125.372 E.02369
G1 X130.422 Y124.642 E.0374
; OBJECT_ID: 66
; WIPE_START
G1 X131.153 Y125.372 E-.39277
G1 X131.808 Y125.372 E-.24879
G1 X131.587 Y125.152 E-.11844
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S6000
G1 X130.239 Y130.239 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
G1 F3000
M204 S500
G1 X137.761 Y130.239 E.26872
G1 X137.761 Y134 E.13436
G1 X137.761 Y137.761 E.13436
G1 X130.239 Y137.761 E.26872
G1 X130.239 Y130.299 E.26657
M204 S6000
G1 X129.782 Y129.782 F42000
G1 F3000
M204 S500
G1 X138.218 Y129.782 E.30137
G1 X138.218 Y134 E.15069
G1 X138.218 Y138.218 E.15069
G1 X129.782 Y138.218 E.30137
G1 X129.782 Y129.842 E.29923
M204 S6000
G1 X129.325 Y129.325 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X138.675 Y129.325 E.33403
G1 X138.675 Y134 E.16702
G1 X138.675 Y138.675 E.16702
G1 X129.325 Y138.675 E.33403
G1 X129.325 Y129.385 E.33189
; WIPE_START
G1 X131.325 Y129.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.642 Y130.422 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50586
G1 F6300
M204 S500
G1 X137.372 Y131.153 E.03739
G1 X137.372 Y131.807 E.02369
G1 X136.193 Y130.628 E.06037
G1 X135.538 Y130.628 E.02369
G1 X137.372 Y132.462 E.09387
G1 X137.372 Y133.117 E.02369
G1 X134.883 Y130.628 E.12737
G1 X134.229 Y130.628 E.02369
G1 X137.372 Y133.771 E.16088
G1 X137.372 Y134.426 E.02369
G1 X133.574 Y130.628 E.19438
G1 X132.919 Y130.628 E.02369
G1 X137.372 Y135.081 E.22788
G1 X137.372 Y135.736 E.02369
G1 X132.264 Y130.628 E.26138
G1 X131.61 Y130.628 E.02369
G1 X137.372 Y136.39 E.29488
G1 X137.372 Y137.045 E.02369
G1 X130.955 Y130.628 E.32839
G1 X130.628 Y130.628 E.01185
G1 X130.628 Y130.955 E.01184
G1 X137.045 Y137.372 E.32839
G1 X136.39 Y137.372 E.02369
G1 X130.628 Y131.61 E.29489
G1 X130.628 Y132.264 E.02369
G1 X135.736 Y137.372 E.26139
G1 X135.081 Y137.372 E.02369
G1 X130.628 Y132.919 E.22789
G1 X130.628 Y133.574 E.02369
G1 X134.426 Y137.372 E.19438
G1 X133.772 Y137.372 E.02369
G1 X130.628 Y134.228 E.16088
G1 X130.628 Y134.883 E.02369
G1 X133.117 Y137.372 E.12738
G1 X132.462 Y137.372 E.02369
G1 X130.628 Y135.538 E.09388
G1 X130.628 Y136.192 E.02369
G1 X131.808 Y137.372 E.06038
G1 X131.153 Y137.372 E.02369
G1 X130.422 Y136.641 E.0374
; OBJECT_ID: 88
; WIPE_START
G1 X131.153 Y137.372 E-.39277
G1 X131.808 Y137.372 E-.24879
G1 X131.587 Y137.152 E-.11845
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S6000
G1 X125.985 Y131.968 Z.6 F42000
G1 X125.761 Y131.761 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
G1 F3000
M204 S500
G1 X118.239 Y131.761 E.26872
G1 X118.239 Y124.239 E.26872
G1 X125.761 Y124.239 E.26872
G1 X125.761 Y128 E.13436
G1 X125.761 Y131.701 E.13221
M204 S6000
G1 X126.218 Y132.218 F42000
G1 F3000
M204 S500
G1 X117.782 Y132.218 E.30137
G1 X117.782 Y123.782 E.30137
G1 X126.218 Y123.782 E.30137
G1 X126.218 Y128 E.15069
G1 X126.218 Y132.158 E.14854
M204 S6000
M73 P40 R10
G1 X126.675 Y132.675 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X117.325 Y132.675 E.33403
G1 X117.325 Y123.325 E.33403
G1 X126.675 Y123.325 E.33403
G1 X126.675 Y128 E.16702
G1 X126.675 Y132.615 E.16487
; WIPE_START
G1 X124.675 Y132.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.644 Y124.995 Z.6 F42000
G1 X124.642 Y124.422 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50586
G1 F6300
M204 S500
G1 X125.372 Y125.153 E.03739
G1 X125.372 Y125.807 E.02369
G1 X124.193 Y124.628 E.06037
G1 X123.538 Y124.628 E.02369
G1 X125.372 Y126.462 E.09387
G1 X125.372 Y127.117 E.02369
G1 X122.883 Y124.628 E.12737
G1 X122.229 Y124.628 E.02369
G1 X125.372 Y127.771 E.16088
G1 X125.372 Y128.426 E.02369
G1 X121.574 Y124.628 E.19438
G1 X120.919 Y124.628 E.02369
G1 X125.372 Y129.081 E.22788
G1 X125.372 Y129.736 E.02369
G1 X120.264 Y124.628 E.26138
G1 X119.61 Y124.628 E.02369
G1 X125.372 Y130.39 E.29488
G1 X125.372 Y131.045 E.02369
G1 X118.955 Y124.628 E.32839
G1 X118.628 Y124.628 E.01185
G1 X118.628 Y124.955 E.01184
G1 X125.045 Y131.372 E.32839
G1 X124.39 Y131.372 E.02369
G1 X118.628 Y125.61 E.29489
G1 X118.628 Y126.264 E.02369
G1 X123.736 Y131.372 E.26139
G1 X123.081 Y131.372 E.02369
G1 X118.628 Y126.919 E.22789
G1 X118.628 Y127.574 E.02369
G1 X122.426 Y131.372 E.19438
G1 X121.772 Y131.372 E.02369
G1 X118.628 Y128.228 E.16088
G1 X118.628 Y128.883 E.02369
G1 X121.117 Y131.372 E.12738
G1 X120.462 Y131.372 E.02369
G1 X118.628 Y129.538 E.09388
G1 X118.628 Y130.192 E.02369
G1 X119.808 Y131.372 E.06038
G1 X119.153 Y131.372 E.02369
G1 X118.422 Y130.642 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X119.153 Y131.372 E-.39277
G1 X119.808 Y131.372 E-.24879
G1 X119.587 Y131.152 E-.11845
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 2/38
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S240 ; set nozzle temperature
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.541 J1.09 P1  F42000
G1 X130.026 Y125.974 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 2 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer2 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.191 Y118.973 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X130.8 Y118.365 E.02081
G1 X131.346 Y118.365 E.01322
G1 X130.365 Y119.346 E.03357
G1 X130.365 Y119.893 E.01322
G1 X131.893 Y118.365 E.05227
G1 X132.44 Y118.365 E.01322
G1 X130.365 Y120.44 E.07097
G1 X130.365 Y120.987 E.01322
G1 X132.987 Y118.365 E.08967
G1 X133.534 Y118.365 E.01322
G1 X130.365 Y121.534 E.10838
G1 X130.365 Y122.081 E.01322
G1 X134.081 Y118.365 E.12708
G1 X134.628 Y118.365 E.01322
G1 X130.365 Y122.628 E.14578
G1 X130.365 Y123.175 E.01322
G1 X135.175 Y118.365 E.16448
G1 X135.721 Y118.365 E.01322
G1 X130.365 Y123.721 E.18318
G1 X130.365 Y124.268 E.01322
M73 P41 R10
G1 X136.268 Y118.365 E.20188
G1 X136.815 Y118.365 E.01322
G1 X130.365 Y124.815 E.22058
G1 X130.365 Y125.362 E.01322
G1 X137.362 Y118.365 E.23928
G1 X137.635 Y118.365 E.00661
G1 X137.635 Y118.638 E.00661
G1 X130.638 Y125.635 E.23928
G1 X131.185 Y125.635 E.01322
G1 X137.635 Y119.185 E.22057
G1 X137.635 Y119.732 E.01322
G1 X131.732 Y125.635 E.20187
G1 X132.279 Y125.635 E.01322
G1 X137.635 Y120.279 E.18317
G1 X137.635 Y120.826 E.01322
G1 X132.826 Y125.635 E.16447
G1 X133.373 Y125.635 E.01322
G1 X137.635 Y121.373 E.14577
G1 X137.635 Y121.919 E.01322
G1 X133.919 Y125.635 E.12707
G1 X134.466 Y125.635 E.01322
G1 X137.635 Y122.466 E.10837
G1 X137.635 Y123.013 E.01322
G1 X135.013 Y125.635 E.08967
G1 X135.56 Y125.635 E.01322
G1 X137.635 Y123.56 E.07097
G1 X137.635 Y124.107 E.01322
G1 X136.107 Y125.635 E.05227
G1 X136.654 Y125.635 E.01322
G1 X137.635 Y124.654 E.03357
G1 X137.635 Y125.201 E.01322
G1 X137.027 Y125.809 E.0208
; OBJECT_ID: 66
; WIPE_START
G1 X137.635 Y125.201 E-.32689
G1 X137.635 Y124.654 E-.20781
G1 X137.216 Y125.073 E-.2253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.126 Y130.999 Z.76 F42000
G1 X130.191 Y130.973 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X130.8 Y130.365 E.02081
G1 X131.346 Y130.365 E.01322
G1 X130.365 Y131.346 E.03357
G1 X130.365 Y131.893 E.01322
G1 X131.893 Y130.365 E.05227
G1 X132.44 Y130.365 E.01322
G1 X130.365 Y132.44 E.07097
G1 X130.365 Y132.987 E.01322
G1 X132.987 Y130.365 E.08967
G1 X133.534 Y130.365 E.01322
G1 X130.365 Y133.534 E.10838
G1 X130.365 Y134.081 E.01322
G1 X134.081 Y130.365 E.12708
G1 X134.628 Y130.365 E.01322
G1 X130.365 Y134.628 E.14578
G1 X130.365 Y135.174 E.01322
G1 X135.175 Y130.365 E.16448
G1 X135.721 Y130.365 E.01322
G1 X130.365 Y135.721 E.18318
G1 X130.365 Y136.268 E.01322
G1 X136.268 Y130.365 E.20188
G1 X136.815 Y130.365 E.01322
G1 X130.365 Y136.815 E.22058
G1 X130.365 Y137.362 E.01322
G1 X137.362 Y130.365 E.23928
G1 X137.635 Y130.365 E.00661
G1 X137.635 Y130.638 E.00661
G1 X130.638 Y137.635 E.23928
G1 X131.185 Y137.635 E.01322
G1 X137.635 Y131.185 E.22057
G1 X137.635 Y131.732 E.01322
G1 X131.732 Y137.635 E.20187
G1 X132.279 Y137.635 E.01322
G1 X137.635 Y132.279 E.18317
G1 X137.635 Y132.826 E.01322
G1 X132.826 Y137.635 E.16447
G1 X133.373 Y137.635 E.01322
G1 X137.635 Y133.372 E.14577
M73 P41 R9
G1 X137.635 Y133.919 E.01322
G1 X133.919 Y137.635 E.12707
G1 X134.466 Y137.635 E.01322
G1 X137.635 Y134.466 E.10837
G1 X137.635 Y135.013 E.01322
G1 X135.013 Y137.635 E.08967
G1 X135.56 Y137.635 E.01322
G1 X137.635 Y135.56 E.07097
G1 X137.635 Y136.107 E.01322
G1 X136.107 Y137.635 E.05227
G1 X136.654 Y137.635 E.01322
G1 X137.635 Y136.654 E.03357
G1 X137.635 Y137.201 E.01322
G1 X137.027 Y137.809 E.0208
; OBJECT_ID: 88
; WIPE_START
G1 X137.635 Y137.201 E-.32689
G1 X137.635 Y136.654 E-.20781
G1 X137.216 Y137.073 E-.2253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X130.265 Y133.92 Z.76 F42000
G1 X125.974 Y131.974 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.027 Y131.809 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X125.635 Y131.201 E.0208
G1 X125.635 Y130.654 E.01322
G1 X124.654 Y131.635 E.03357
G1 X124.107 Y131.635 E.01322
G1 X125.635 Y130.107 E.05227
G1 X125.635 Y129.56 E.01322
G1 X123.56 Y131.635 E.07097
G1 X123.013 Y131.635 E.01322
G1 X125.635 Y129.013 E.08967
G1 X125.635 Y128.466 E.01322
G1 X122.466 Y131.635 E.10837
G1 X121.919 Y131.635 E.01322
G1 X125.635 Y127.919 E.12707
G1 X125.635 Y127.373 E.01322
G1 X121.373 Y131.635 E.14577
G1 X120.826 Y131.635 E.01322
G1 X125.635 Y126.826 E.16447
G1 X125.635 Y126.279 E.01322
G1 X120.279 Y131.635 E.18317
G1 X119.732 Y131.635 E.01322
G1 X125.635 Y125.732 E.20187
G1 X125.635 Y125.185 E.01322
G1 X119.185 Y131.635 E.22057
G1 X118.638 Y131.635 E.01322
G1 X125.635 Y124.638 E.23928
G1 X125.635 Y124.365 E.00661
G1 X125.362 Y124.365 E.00661
G1 X118.365 Y131.362 E.23928
G1 X118.365 Y130.815 E.01322
G1 X124.815 Y124.365 E.22058
G1 X124.268 Y124.365 E.01322
G1 X118.365 Y130.268 E.20188
G1 X118.365 Y129.721 E.01322
G1 X123.721 Y124.365 E.18318
G1 X123.175 Y124.365 E.01322
G1 X118.365 Y129.175 E.16448
G1 X118.365 Y128.628 E.01322
G1 X122.628 Y124.365 E.14578
G1 X122.081 Y124.365 E.01322
G1 X118.365 Y128.081 E.12708
M73 P42 R9
G1 X118.365 Y127.534 E.01322
G1 X121.534 Y124.365 E.10838
G1 X120.987 Y124.365 E.01322
G1 X118.365 Y126.987 E.08967
G1 X118.365 Y126.44 E.01322
G1 X120.44 Y124.365 E.07097
G1 X119.893 Y124.365 E.01322
G1 X118.365 Y125.893 E.05227
G1 X118.365 Y125.346 E.01322
G1 X119.346 Y124.365 E.03357
G1 X118.8 Y124.365 E.01322
G1 X118.191 Y124.973 E.02081
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.8 Y124.365 E-.32698
G1 X119.346 Y124.365 E-.20781
G1 X118.927 Y124.784 E-.22521
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 3/38
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.76 I-.13 J1.21 P1  F42000
G1 X130.026 Y125.974 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 3 start: 66,77,88
M624 BwAAAAAAAAA=
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
; object ids of this layer3 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.973 Y125.809 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X130.365 Y125.201 E.02081
G1 X130.365 Y124.654 E.01322
G1 X131.346 Y125.635 E.03357
G1 X131.893 Y125.635 E.01322
G1 X130.365 Y124.107 E.05227
G1 X130.365 Y123.56 E.01322
G1 X132.44 Y125.635 E.07097
G1 X132.987 Y125.635 E.01322
G1 X130.365 Y123.013 E.08967
G1 X130.365 Y122.466 E.01322
G1 X133.534 Y125.635 E.10838
G1 X134.081 Y125.635 E.01322
G1 X130.365 Y121.919 E.12708
G1 X130.365 Y121.372 E.01322
G1 X134.628 Y125.635 E.14578
G1 X135.175 Y125.635 E.01322
G1 X130.365 Y120.825 E.16448
G1 X130.365 Y120.279 E.01322
G1 X135.721 Y125.635 E.18318
G1 X136.268 Y125.635 E.01322
G1 X130.365 Y119.732 E.20188
G1 X130.365 Y119.185 E.01322
G1 X136.815 Y125.635 E.22058
G1 X137.362 Y125.635 E.01322
G1 X130.365 Y118.638 E.23928
G1 X130.365 Y118.365 E.00661
G1 X130.638 Y118.365 E.00661
G1 X137.635 Y125.362 E.23928
G1 X137.635 Y124.815 E.01322
G1 X131.185 Y118.365 E.22057
G1 X131.732 Y118.365 E.01322
G1 X137.635 Y124.268 E.20187
G1 X137.635 Y123.721 E.01322
G1 X132.279 Y118.365 E.18317
G1 X132.826 Y118.365 E.01322
G1 X137.635 Y123.174 E.16447
G1 X137.635 Y122.628 E.01322
G1 X133.373 Y118.365 E.14577
G1 X133.919 Y118.365 E.01322
G1 X137.635 Y122.081 E.12707
G1 X137.635 Y121.534 E.01322
G1 X134.466 Y118.365 E.10837
G1 X135.013 Y118.365 E.01322
G1 X137.635 Y120.987 E.08967
G1 X137.635 Y120.44 E.01322
G1 X135.56 Y118.365 E.07097
G1 X136.107 Y118.365 E.01322
G1 X137.635 Y119.893 E.05227
G1 X137.635 Y119.346 E.01322
G1 X136.654 Y118.365 E.03357
G1 X137.201 Y118.365 E.01322
G1 X137.809 Y118.973 E.0208
; OBJECT_ID: 66
; WIPE_START
G1 X137.201 Y118.365 E-.32689
G1 X136.654 Y118.365 E-.20781
G1 X137.073 Y118.784 E-.2253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.683 Y126.392 Z.92 F42000
G1 X137.974 Y130.026 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.809 Y130.973 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X137.201 Y130.365 E.0208
G1 X136.654 Y130.365 E.01322
G1 X137.635 Y131.346 E.03357
G1 X137.635 Y131.893 E.01322
G1 X136.107 Y130.365 E.05227
G1 X135.56 Y130.365 E.01322
G1 X137.635 Y132.44 E.07097
G1 X137.635 Y132.987 E.01322
G1 X135.013 Y130.365 E.08967
G1 X134.466 Y130.365 E.01322
G1 X137.635 Y133.534 E.10837
G1 X137.635 Y134.081 E.01322
G1 X133.919 Y130.365 E.12707
G1 X133.373 Y130.365 E.01322
G1 X137.635 Y134.627 E.14577
M73 P43 R9
G1 X137.635 Y135.174 E.01322
G1 X132.826 Y130.365 E.16447
G1 X132.279 Y130.365 E.01322
G1 X137.635 Y135.721 E.18317
G1 X137.635 Y136.268 E.01322
G1 X131.732 Y130.365 E.20187
G1 X131.185 Y130.365 E.01322
G1 X137.635 Y136.815 E.22057
G1 X137.635 Y137.362 E.01322
G1 X130.638 Y130.365 E.23928
G1 X130.365 Y130.365 E.00661
G1 X130.365 Y130.638 E.00661
G1 X137.362 Y137.635 E.23928
G1 X136.815 Y137.635 E.01322
G1 X130.365 Y131.185 E.22058
G1 X130.365 Y131.732 E.01322
G1 X136.268 Y137.635 E.20188
G1 X135.721 Y137.635 E.01322
G1 X130.365 Y132.279 E.18318
G1 X130.365 Y132.825 E.01322
G1 X135.175 Y137.635 E.16448
G1 X134.628 Y137.635 E.01322
G1 X130.365 Y133.372 E.14578
G1 X130.365 Y133.919 E.01322
G1 X134.081 Y137.635 E.12708
G1 X133.534 Y137.635 E.01322
G1 X130.365 Y134.466 E.10838
G1 X130.365 Y135.013 E.01322
G1 X132.987 Y137.635 E.08967
G1 X132.44 Y137.635 E.01322
G1 X130.365 Y135.56 E.07097
G1 X130.365 Y136.107 E.01322
G1 X131.893 Y137.635 E.05227
G1 X131.346 Y137.635 E.01322
G1 X130.365 Y136.654 E.03357
G1 X130.365 Y137.2 E.01322
G1 X130.973 Y137.809 E.02081
; OBJECT_ID: 88
; WIPE_START
G1 X130.365 Y137.2 E-.32698
G1 X130.365 Y136.654 E-.20781
G1 X130.784 Y137.073 E-.2252
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.782 Y125.175 Z.92 F42000
G1 X125.809 Y124.973 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X125.201 Y124.365 E.0208
G1 X124.654 Y124.365 E.01322
G1 X125.635 Y125.346 E.03357
G1 X125.635 Y125.893 E.01322
G1 X124.107 Y124.365 E.05227
G1 X123.56 Y124.365 E.01322
G1 X125.635 Y126.44 E.07097
G1 X125.635 Y126.987 E.01322
G1 X123.013 Y124.365 E.08967
G1 X122.466 Y124.365 E.01322
G1 X125.635 Y127.534 E.10837
G1 X125.635 Y128.081 E.01322
G1 X121.919 Y124.365 E.12707
G1 X121.373 Y124.365 E.01322
G1 X125.635 Y128.627 E.14577
G1 X125.635 Y129.174 E.01322
G1 X120.826 Y124.365 E.16447
G1 X120.279 Y124.365 E.01322
G1 X125.635 Y129.721 E.18317
G1 X125.635 Y130.268 E.01322
G1 X119.732 Y124.365 E.20187
G1 X119.185 Y124.365 E.01322
G1 X125.635 Y130.815 E.22057
G1 X125.635 Y131.362 E.01322
G1 X118.638 Y124.365 E.23928
G1 X118.365 Y124.365 E.00661
G1 X118.365 Y124.638 E.00661
G1 X125.362 Y131.635 E.23928
G1 X124.815 Y131.635 E.01322
G1 X118.365 Y125.185 E.22058
G1 X118.365 Y125.732 E.01322
G1 X124.268 Y131.635 E.20188
G1 X123.721 Y131.635 E.01322
G1 X118.365 Y126.279 E.18318
G1 X118.365 Y126.825 E.01322
G1 X123.175 Y131.635 E.16448
G1 X122.628 Y131.635 E.01322
G1 X118.365 Y127.372 E.14578
G1 X118.365 Y127.919 E.01322
G1 X122.081 Y131.635 E.12708
G1 X121.534 Y131.635 E.01322
G1 X118.365 Y128.466 E.10838
G1 X118.365 Y129.013 E.01322
G1 X120.987 Y131.635 E.08967
G1 X120.44 Y131.635 E.01322
G1 X118.365 Y129.56 E.07097
G1 X118.365 Y130.107 E.01322
G1 X119.893 Y131.635 E.05227
G1 X119.346 Y131.635 E.01322
G1 X118.365 Y130.654 E.03357
G1 X118.365 Y131.2 E.01322
G1 X118.973 Y131.809 E.02081
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.365 Y131.2 E-.32698
G1 X118.365 Y130.654 E-.20781
G1 X118.784 Y131.073 E-.22521
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 4/38
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S122.4
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.92 I.503 J1.108 P1  F42000
G1 X130.026 Y125.974 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 4 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer4 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.191 Y118.973 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X130.8 Y118.365 E.02081
G1 X131.346 Y118.365 E.01322
G1 X130.365 Y119.346 E.03357
G1 X130.365 Y119.893 E.01322
G1 X131.893 Y118.365 E.05227
G1 X132.44 Y118.365 E.01322
G1 X130.365 Y120.44 E.07097
G1 X130.365 Y120.987 E.01322
G1 X132.987 Y118.365 E.08967
G1 X133.534 Y118.365 E.01322
G1 X130.365 Y121.534 E.10838
G1 X130.365 Y122.081 E.01322
G1 X134.081 Y118.365 E.12708
G1 X134.628 Y118.365 E.01322
G1 X130.365 Y122.628 E.14578
G1 X130.365 Y123.175 E.01322
G1 X135.175 Y118.365 E.16448
G1 X135.721 Y118.365 E.01322
G1 X130.365 Y123.721 E.18318
G1 X130.365 Y124.268 E.01322
G1 X136.268 Y118.365 E.20188
G1 X136.815 Y118.365 E.01322
G1 X130.365 Y124.815 E.22058
M73 P44 R9
G1 X130.365 Y125.362 E.01322
G1 X137.362 Y118.365 E.23928
G1 X137.635 Y118.365 E.00661
G1 X137.635 Y118.638 E.00661
G1 X130.638 Y125.635 E.23928
G1 X131.185 Y125.635 E.01322
G1 X137.635 Y119.185 E.22057
G1 X137.635 Y119.732 E.01322
G1 X131.732 Y125.635 E.20187
G1 X132.279 Y125.635 E.01322
G1 X137.635 Y120.279 E.18317
G1 X137.635 Y120.826 E.01322
G1 X132.826 Y125.635 E.16447
G1 X133.373 Y125.635 E.01322
G1 X137.635 Y121.373 E.14577
G1 X137.635 Y121.919 E.01322
G1 X133.919 Y125.635 E.12707
G1 X134.466 Y125.635 E.01322
G1 X137.635 Y122.466 E.10837
G1 X137.635 Y123.013 E.01322
G1 X135.013 Y125.635 E.08967
G1 X135.56 Y125.635 E.01322
G1 X137.635 Y123.56 E.07097
G1 X137.635 Y124.107 E.01322
G1 X136.107 Y125.635 E.05227
G1 X136.654 Y125.635 E.01322
G1 X137.635 Y124.654 E.03357
G1 X137.635 Y125.201 E.01322
G1 X137.027 Y125.809 E.0208
; OBJECT_ID: 66
; WIPE_START
G1 X137.635 Y125.201 E-.32689
G1 X137.635 Y124.654 E-.20781
G1 X137.216 Y125.073 E-.2253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.126 Y130.999 Z1.08 F42000
G1 X130.191 Y130.973 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X130.8 Y130.365 E.02081
G1 X131.346 Y130.365 E.01322
G1 X130.365 Y131.346 E.03357
G1 X130.365 Y131.893 E.01322
G1 X131.893 Y130.365 E.05227
G1 X132.44 Y130.365 E.01322
G1 X130.365 Y132.44 E.07097
G1 X130.365 Y132.987 E.01322
G1 X132.987 Y130.365 E.08967
G1 X133.534 Y130.365 E.01322
G1 X130.365 Y133.534 E.10838
G1 X130.365 Y134.081 E.01322
G1 X134.081 Y130.365 E.12708
G1 X134.628 Y130.365 E.01322
G1 X130.365 Y134.628 E.14578
G1 X130.365 Y135.174 E.01322
G1 X135.175 Y130.365 E.16448
G1 X135.721 Y130.365 E.01322
G1 X130.365 Y135.721 E.18318
G1 X130.365 Y136.268 E.01322
G1 X136.268 Y130.365 E.20188
G1 X136.815 Y130.365 E.01322
G1 X130.365 Y136.815 E.22058
G1 X130.365 Y137.362 E.01322
G1 X137.362 Y130.365 E.23928
G1 X137.635 Y130.365 E.00661
G1 X137.635 Y130.638 E.00661
G1 X130.638 Y137.635 E.23928
G1 X131.185 Y137.635 E.01322
G1 X137.635 Y131.185 E.22057
G1 X137.635 Y131.732 E.01322
G1 X131.732 Y137.635 E.20187
G1 X132.279 Y137.635 E.01322
G1 X137.635 Y132.279 E.18317
G1 X137.635 Y132.826 E.01322
G1 X132.826 Y137.635 E.16447
G1 X133.373 Y137.635 E.01322
G1 X137.635 Y133.372 E.14577
G1 X137.635 Y133.919 E.01322
G1 X133.919 Y137.635 E.12707
G1 X134.466 Y137.635 E.01322
G1 X137.635 Y134.466 E.10837
G1 X137.635 Y135.013 E.01322
G1 X135.013 Y137.635 E.08967
G1 X135.56 Y137.635 E.01322
G1 X137.635 Y135.56 E.07097
G1 X137.635 Y136.107 E.01322
G1 X136.107 Y137.635 E.05227
G1 X136.654 Y137.635 E.01322
G1 X137.635 Y136.654 E.03357
G1 X137.635 Y137.201 E.01322
G1 X137.027 Y137.809 E.0208
; OBJECT_ID: 88
; WIPE_START
G1 X137.635 Y137.201 E-.32689
G1 X137.635 Y136.654 E-.20781
G1 X137.216 Y137.073 E-.2253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X130.265 Y133.92 Z1.08 F42000
G1 X125.974 Y131.974 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.027 Y131.809 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421036
G1 F12000
M204 S4000
G1 X125.635 Y131.201 E.0208
G1 X125.635 Y130.654 E.01322
G1 X124.654 Y131.635 E.03357
G1 X124.107 Y131.635 E.01322
G1 X125.635 Y130.107 E.05227
G1 X125.635 Y129.56 E.01322
G1 X123.56 Y131.635 E.07097
G1 X123.013 Y131.635 E.01322
G1 X125.635 Y129.013 E.08967
G1 X125.635 Y128.466 E.01322
G1 X122.466 Y131.635 E.10837
G1 X121.919 Y131.635 E.01322
G1 X125.635 Y127.919 E.12707
G1 X125.635 Y127.373 E.01322
G1 X121.373 Y131.635 E.14577
G1 X120.826 Y131.635 E.01322
G1 X125.635 Y126.826 E.16447
G1 X125.635 Y126.279 E.01322
G1 X120.279 Y131.635 E.18317
G1 X119.732 Y131.635 E.01322
G1 X125.635 Y125.732 E.20187
G1 X125.635 Y125.185 E.01322
G1 X119.185 Y131.635 E.22057
G1 X118.638 Y131.635 E.01322
G1 X125.635 Y124.638 E.23928
G1 X125.635 Y124.365 E.00661
G1 X125.362 Y124.365 E.00661
G1 X118.365 Y131.362 E.23928
G1 X118.365 Y130.815 E.01322
G1 X124.815 Y124.365 E.22058
G1 X124.268 Y124.365 E.01322
G1 X118.365 Y130.268 E.20188
G1 X118.365 Y129.721 E.01322
G1 X123.721 Y124.365 E.18318
G1 X123.175 Y124.365 E.01322
G1 X118.365 Y129.175 E.16448
G1 X118.365 Y128.628 E.01322
G1 X122.628 Y124.365 E.14578
G1 X122.081 Y124.365 E.01322
G1 X118.365 Y128.081 E.12708
G1 X118.365 Y127.534 E.01322
G1 X121.534 Y124.365 E.10838
G1 X120.987 Y124.365 E.01322
G1 X118.365 Y126.987 E.08967
G1 X118.365 Y126.44 E.01322
G1 X120.44 Y124.365 E.07097
G1 X119.893 Y124.365 E.01322
G1 X118.365 Y125.893 E.05227
G1 X118.365 Y125.346 E.01322
G1 X119.346 Y124.365 E.03357
G1 X118.8 Y124.365 E.01322
G1 X118.191 Y124.973 E.02081
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.8 Y124.365 E-.32698
G1 X119.346 Y124.365 E-.20781
G1 X118.927 Y124.784 E-.22521
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 5/38
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S124.95
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.08 I-.13 J1.21 P1  F42000
M73 P45 R9
G1 X130.026 Y125.974 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6279
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F6279
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 5 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer5 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y124.394 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6279
M204 S4000
G1 X130.38 Y122.732 E.04321
G3 X131.737 Y122 I5.234 J8.087 E.04013
G2 X131.85 Y121.108 I-.585 J-.527 E.02487
G2 X130.38 Y119.1 I-3.082 J.714 E.06648
G1 X130.38 Y118.38 E.01872
G1 X131.322 Y118.38 E.02449
; WIPE_START
G1 F12000
G1 X130.38 Y118.38 E-.35808
G1 X130.38 Y119.1 E-.27373
G1 X130.668 Y119.275 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y120.826 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F6279
M204 S4000
G1 X137.62 Y119.164 E.04321
G2 X136.263 Y118.432 I-5.234 J8.088 E.04013
G1 X136.239 Y118.38 E.00149
G1 X135.201 Y118.38 E.027
G1 X135.305 Y118.432 E.00304
G1 X135.503 Y118.878 E.01269
G3 X134.768 Y120.662 I-4.802 J-.935 E.05048
G3 X132.695 Y122 I-4.422 J-4.578 E.06454
G1 X132.497 Y122.446 E.01269
G2 X133.232 Y124.23 I4.802 J-.935 E.05048
G2 X135.305 Y125.568 I4.422 J-4.578 E.06454
G1 X135.328 Y125.62 E.00149
G1 X136.367 Y125.62 E.027
G1 X136.263 Y125.568 E.00304
G1 X136.064 Y125.122 E.01269
G3 X137.62 Y122.668 I3.368 J.415 E.07804
G1 X137.62 Y124.331 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 F12000
G1 X137.62 Y122.668 E-.63181
G1 X137.332 Y122.843 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6279
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F6279
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.826 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6279
M204 S4000
G1 X137.62 Y131.164 E.04321
G2 X136.263 Y130.432 I-5.234 J8.088 E.04013
G1 X136.239 Y130.38 E.00149
G1 X135.201 Y130.38 E.027
G1 X135.305 Y130.432 E.00304
G1 X135.503 Y130.878 E.01269
G3 X134.768 Y132.662 I-4.802 J-.935 E.05048
G3 X132.695 Y134 I-4.422 J-4.578 E.06454
G1 X132.497 Y134.446 E.01269
G2 X133.232 Y136.23 I4.802 J-.935 E.05048
G2 X135.305 Y137.568 I4.422 J-4.578 E.06454
G1 X135.328 Y137.62 E.00149
G1 X136.367 Y137.62 E.027
G1 X136.263 Y137.568 E.00304
G1 X136.064 Y137.122 E.01269
G3 X137.62 Y134.668 I3.368 J.415 E.07804
G1 X137.62 Y136.33 E.04321
; WIPE_START
G1 F12000
G1 X137.62 Y134.668 E-.63181
G1 X137.332 Y134.843 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y136.394 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F6279
M204 S4000
G1 X130.38 Y134.732 E.04321
G3 X131.737 Y134 I5.234 J8.087 E.04013
G2 X131.85 Y133.108 I-.585 J-.527 E.02487
G2 X130.38 Y131.1 I-3.082 J.714 E.06648
G1 X130.38 Y130.38 E.01872
G1 X131.322 Y130.38 E.02449
; OBJECT_ID: 88
; WIPE_START
G1 F12000
G1 X130.38 Y130.38 E-.35808
G1 X130.38 Y131.1 E-.27373
G1 X130.668 Y131.275 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6279
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F6279
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y130.331 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6279
M204 S4000
G1 X125.62 Y128.668 E.04321
G2 X124.065 Y131.122 I1.812 J2.869 E.07804
G1 X124.263 Y131.568 E.01269
G1 X124.367 Y131.62 E.00304
G1 X123.328 Y131.62 E.027
G1 X123.305 Y131.568 E.00149
G3 X121.232 Y130.23 I2.349 J-5.916 E.06454
G3 X120.497 Y128.446 I4.067 J-2.719 E.05048
G1 X120.695 Y128 E.01269
G2 X122.768 Y126.662 I-2.349 J-5.916 E.06454
G2 X123.503 Y124.878 I-4.067 J-2.719 E.05048
G1 X123.305 Y124.432 E.01269
G1 X123.201 Y124.38 E.00304
G1 X124.239 Y124.38 E.027
G1 X124.263 Y124.432 E.00149
G3 X125.62 Y125.164 I-3.877 J8.819 E.04013
G1 X125.62 Y126.826 E.04321
; WIPE_START
G1 F12000
G1 X125.62 Y125.164 E-.63181
G1 X125.323 Y125.004 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.322 Y124.38 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
M73 P46 R9
G1 F6279
M204 S4000
G1 X118.38 Y124.38 E.02449
G1 X118.38 Y125.1 E.01872
G3 X119.85 Y127.108 I-1.612 J2.722 E.06648
G3 X119.737 Y128 I-.697 J.365 E.02487
G2 X118.38 Y128.732 I3.876 J8.818 E.04013
G1 X118.38 Y130.394 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y128.732 E-.63181
G1 X118.677 Y128.572 E-.1282
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 6/38
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.24 I.272 J1.186 P1  F42000
G1 X130.026 Y125.974 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8257
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F8257
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 6 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer6 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.042 Y120.365 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8257
M204 S4000
G1 X133.042 Y121.042 E.01758
G1 X132.056 Y121.042 E.02563
G1 X131.77 Y120.547 E.01484
G2 X130.38 Y119.16 I-2.705 J1.321 E.05201
G1 X130.38 Y122.778 E.09405
G1 X131.324 Y122.436 E.02611
G1 X131.592 Y122.418 E.00697
G2 X131.838 Y122.958 I.393 J.147 E.01714
G1 X132.376 Y122.958 E.01399
G2 X133.042 Y124.022 I8.599 J-4.637 E.03264
G1 X133.042 Y124.162 E.00363
G1 X133.288 Y124.408 E.00906
G1 X133.409 Y124.408 E.00314
G2 X134.892 Y125.132 I2.095 J-2.411 E.04339
G1 X135.338 Y125.162 E.01162
G1 X135.784 Y124.887 E.01361
G1 X136.23 Y124.115 E.02318
G3 X137.62 Y122.728 I2.706 J1.321 E.05201
G1 X137.62 Y119.211 E.09142
G1 X136.676 Y118.868 E.02611
G1 X136.23 Y118.838 E.01162
G1 X135.784 Y119.113 E.01361
G3 X134.958 Y120.454 I-10.837 J-5.745 E.04098
G1 X134.958 Y121.042 E.01527
G1 X136.033 Y121.042 E.02795
M204 S10000
G1 X135.45 Y121.442 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F8257
M204 S4000
G1 X134.845 Y121.442 E.01459
G1 X134.709 Y121.386 E.00356
G1 X134.578 Y121.241 E.00471
G3 X134.558 Y120.004 I20.994 J-.964 E.02984
G2 X133.454 Y119.992 I-.83 J26.283 E.02661
G2 X133.442 Y121.155 I27.69 J.86 E.02803
G1 X133.386 Y121.291 E.00356
G1 X133.241 Y121.422 E.00471
G3 X132.004 Y121.442 I-.964 J-20.994 E.02984
G2 X131.992 Y122.546 I26.283 J.83 E.02661
G2 X133.155 Y122.558 I.86 J-27.69 E.02803
G1 X133.291 Y122.614 E.00356
G1 X133.422 Y122.759 E.00471
G3 X133.442 Y123.996 I-20.994 J.964 E.02984
G2 X134.546 Y124.008 I.83 J-26.283 E.02661
G2 X134.558 Y122.845 I-27.69 J-.86 E.02803
G1 X134.614 Y122.709 E.00356
G1 X134.759 Y122.578 E.00471
G3 X135.996 Y122.558 I.964 J20.994 E.02984
G2 X136.008 Y121.462 I-26.086 J-.826 E.02641
G1 X135.51 Y121.445 E.01201
; WIPE_START
G1 F9600
G1 X136.008 Y121.462 E-.1892
G1 X135.996 Y122.558 E-.41616
G1 X135.589 Y122.564 E-.15464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.235 Y121.413 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.403907
G1 F8257
M204 S4000
G1 X134.182 Y121.155 E.00608
G1 X134.182 Y120.368 E.01819
G1 X133.818 Y120.368 E.00843
G1 X133.818 Y121.155 E.01819
G1 X133.765 Y121.413 E.00608
G1 X133.564 Y121.659 E.00735
G1 X133.413 Y121.767 E.00428
G1 X133.155 Y121.818 E.00609
G1 X132.368 Y121.818 E.01819
G1 X132.368 Y122.182 E.00843
G1 X133.155 Y122.182 E.01819
G1 X133.413 Y122.234 E.00609
G1 X133.659 Y122.436 E.00735
G1 X133.766 Y122.587 E.00428
G1 X133.818 Y122.845 E.00609
G1 X133.818 Y123.632 E.01819
G1 X134.182 Y123.632 E.00843
G1 X134.182 Y122.845 E.01819
G1 X134.234 Y122.587 E.00609
G1 X134.436 Y122.341 E.00735
G1 X134.587 Y122.235 E.00428
G1 X134.845 Y122.182 E.00608
G1 X135.632 Y122.182 E.01819
G1 X135.632 Y121.818 E.00843
G1 X134.845 Y121.818 E.01819
G1 X134.587 Y121.765 E.00608
G1 X134.341 Y121.564 E.00735
G1 X134.269 Y121.462 E.00289
M204 S10000
G1 X134.283 Y122 F42000
; LINE_WIDTH: 0.391186
G1 F8257
M204 S4000
G3 X134 Y121.717 I.433 J-.715 E.00901
G3 X133.717 Y122 I-.715 J-.433 E.00901
G3 X134 Y122.283 I-.433 J.715 E.00901
G1 X134.174 Y122.079 E.00598
G1 X134.234 Y122.035 E.00167
; OBJECT_ID: 66
; WIPE_START
G1 F9600
G1 X134.174 Y122.079 E-.03663
G1 X134 Y122.283 E-.13131
G1 X133.921 Y122.174 E-.06604
G1 X133.717 Y122 E-.13131
G1 X133.826 Y121.921 E-.06604
G1 X134 Y121.717 E-.13131
G1 X134.079 Y121.826 E-.06604
G1 X134.283 Y122 E-.13131
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.472 Y128.934 Z1.4 F42000
G1 X137.974 Y130.026 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8257
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F8257
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.021 Y133.067 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8257
M204 S4000
G1 X134.933 Y133.067 E.02827
G1 X134.933 Y132.492 E.01494
G2 X135.784 Y131.113 I-10.291 J-7.3 E.04215
G1 X136.23 Y130.838 E.01361
G1 X136.676 Y130.868 E.01162
G1 X137.62 Y131.21 E.02611
G1 X137.62 Y134.728 E.09142
G2 X136.23 Y136.115 I1.315 J2.708 E.05201
G1 X135.784 Y136.887 E.02318
G1 X135.338 Y137.162 E.01361
G1 X134.892 Y137.132 E.01162
G3 X133.409 Y136.408 I.612 J-3.135 E.04339
G1 X133.313 Y136.408 E.00249
G1 X133.067 Y136.162 E.00906
G1 X133.067 Y136.06 E.00265
G3 X132.362 Y134.933 I8.4 J-6.039 E.03456
G1 X131.838 Y134.933 E.01361
G3 X131.592 Y134.418 I.134 J-.381 E.01648
G1 X131.324 Y134.436 E.00697
G1 X130.38 Y134.778 E.02611
G1 X130.38 Y131.16 E.09405
G3 X131.77 Y132.547 I-1.315 J2.708 E.05201
G1 X132.07 Y133.067 E.01559
G1 X133.067 Y133.067 E.02591
G1 X133.067 Y132.401 E.01731
; WIPE_START
G1 F12000
G1 X133.067 Y133.067 E-.25306
G1 X132.07 Y133.067 E-.37875
G1 X131.901 Y132.775 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.475 Y133.467 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F8257
M204 S4000
G1 X134.82 Y133.467 E.01579
G1 X134.684 Y133.411 E.00356
G1 X134.553 Y133.266 E.00471
G3 X134.533 Y132.004 I22.969 J-1.002 E.03044
G2 X133.479 Y131.992 I-.793 J23.966 E.02541
G2 X133.467 Y133.18 I27.017 J.86 E.02864
G1 X133.411 Y133.316 E.00356
G1 X133.266 Y133.447 E.00471
G3 X132.004 Y133.467 I-1.002 J-22.969 E.03044
G2 X131.992 Y134.521 I23.966 J.793 E.02541
G2 X133.18 Y134.533 I.86 J-27.017 E.02864
G1 X133.316 Y134.589 E.00356
G1 X133.447 Y134.734 E.00471
G3 X133.467 Y135.996 I-22.969 J1.002 E.03044
G2 X134.521 Y136.008 I.793 J-23.966 E.02541
G2 X134.533 Y134.82 I-27.017 J-.86 E.02864
G1 X134.589 Y134.684 E.00356
G1 X134.734 Y134.553 E.00471
G3 X135.996 Y134.533 I1.002 J22.969 E.03044
G2 X136.008 Y133.487 I-23.778 J-.789 E.02521
G1 X135.535 Y133.47 E.0114
; WIPE_START
G1 F9600
G1 X136.008 Y133.487 E-.17971
G1 X135.996 Y134.533 E-.39716
G1 X135.514 Y134.54 E-.18313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.83 Y133.18 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.384437
G1 F8257
M204 S4000
G1 X133.787 Y133.436 E.00569
G1 X133.589 Y133.684 E.00694
G1 X133.438 Y133.79 E.00405
G1 X133.18 Y133.83 E.00571
G1 X132.355 Y133.83 E.01805
G1 X132.355 Y134.17 E.00744
G1 X133.18 Y134.17 E.01805
G1 X133.438 Y134.21 E.00571
G1 X133.684 Y134.411 E.00696
G1 X133.79 Y134.562 E.00405
G1 X133.83 Y134.82 E.00571
G1 X133.83 Y135.645 E.01805
G1 X134.17 Y135.645 E.00744
G1 X134.17 Y134.82 E.01805
G1 X134.21 Y134.562 E.00571
G1 X134.411 Y134.316 E.00696
G1 X134.564 Y134.213 E.00404
G1 X134.82 Y134.17 E.00569
G1 X135.645 Y134.17 E.01805
G1 X135.645 Y133.83 E.00744
G1 X134.82 Y133.83 E.01805
G1 X134.564 Y133.787 E.00569
G1 X134.316 Y133.589 E.00694
G1 X134.213 Y133.436 E.00404
G1 X134.17 Y133.18 E.00569
G1 X134.17 Y132.355 E.01805
G1 X133.83 Y132.355 E.00744
G1 X133.83 Y133.12 E.01674
M204 S10000
G1 X134.253 Y134 F42000
; LINE_WIDTH: 0.355826
G1 F8257
M204 S4000
G1 X134 Y133.747 E.00719
G1 X133.747 Y134 E.00719
G1 X134 Y134.253 E.00719
G1 X134.211 Y134.042 E.00599
; OBJECT_ID: 88
; WIPE_START
G1 F9600
G1 X134 Y134.253 E-.16506
G1 X133.747 Y134 E-.19831
G1 X134 Y133.747 E-.19831
G1 X134.253 Y134 E-.19831
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.839 Y132.186 Z1.4 F42000
G1 X125.974 Y131.974 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8257
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
M73 P47 R9
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F8257
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.425 Y127.417 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F8257
M204 S4000
G1 X122.87 Y127.417 E.01338
G1 X122.734 Y127.361 E.00356
G1 X122.603 Y127.216 E.00471
G3 X122.583 Y126.004 I19.08 J-.927 E.02923
G2 X121.429 Y125.992 I-.868 J28.706 E.02782
G2 X121.417 Y127.13 I28.309 J.86 E.02743
G1 X121.361 Y127.266 E.00356
G1 X121.216 Y127.397 E.00471
G3 X120.004 Y127.417 I-.927 J-19.08 E.02923
G2 X119.992 Y128.571 I28.706 J.868 E.02782
G2 X121.13 Y128.583 I.86 J-28.309 E.02743
G1 X121.266 Y128.639 E.00356
G1 X121.397 Y128.784 E.00471
G3 X121.417 Y129.996 I-19.08 J.927 E.02923
G2 X122.571 Y130.008 I.868 J-28.706 E.02782
G2 X122.583 Y128.87 I-28.309 J-.86 E.02743
G1 X122.639 Y128.734 E.00356
G1 X122.784 Y128.603 E.00471
G3 X123.996 Y128.583 I.927 J19.08 E.02923
G2 X124.008 Y127.437 I-28.501 J-.864 E.02762
G1 X123.485 Y127.42 E.01261
; WIPE_START
G1 F9600
G1 X124.008 Y127.437 E-.19869
G1 X123.996 Y128.583 E-.43516
G1 X123.664 Y128.588 E-.12615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.257 Y127.389 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42312
G1 F8257
M204 S4000
G1 X122.195 Y127.13 E.00648
G1 X122.195 Y126.38 E.01823
G1 X121.805 Y126.38 E.00947
G1 X121.805 Y127.13 E.01823
G1 X121.743 Y127.389 E.00648
G1 X121.539 Y127.634 E.00774
G1 X121.389 Y127.742 E.00451
G1 X121.13 Y127.805 E.00647
G1 X120.38 Y127.805 E.01823
G1 X120.38 Y128.195 E.00947
G1 X121.13 Y128.195 E.01823
G1 X121.389 Y128.258 E.00647
G1 X121.634 Y128.461 E.00774
G1 X121.742 Y128.611 E.00451
G1 X121.805 Y128.87 E.00647
G1 X121.805 Y129.62 E.01823
G1 X122.195 Y129.62 E.00947
G1 X122.195 Y128.87 E.01823
G1 X122.258 Y128.611 E.00647
G1 X122.461 Y128.366 E.00774
G1 X122.611 Y128.257 E.00451
G1 X122.87 Y128.195 E.00648
G1 X123.62 Y128.195 E.01823
G1 X123.62 Y127.805 E.00947
G1 X122.87 Y127.805 E.01823
G1 X122.611 Y127.743 E.00648
G1 X122.366 Y127.539 E.00774
G1 X122.293 Y127.437 E.00305
M204 S10000
G1 X122.313 Y128 F42000
; LINE_WIDTH: 0.426546
G1 F8257
M204 S4000
G3 X122 Y127.687 I.462 J-.775 E.01096
G3 X121.687 Y128 I-.775 J-.462 E.01096
G3 X122 Y128.313 I-.462 J.775 E.01096
G1 X122.186 Y128.091 E.00709
G1 X122.264 Y128.035 E.00236
; WIPE_START
G1 F9600
G1 X122.186 Y128.091 E-.04244
G1 X122 Y128.313 E-.12769
G1 X121.909 Y128.186 E-.06893
G1 X121.687 Y128 E-.12769
G1 X121.814 Y127.909 E-.06893
G1 X122 Y127.687 E-.12769
G1 X122.091 Y127.814 E-.06893
G1 X122.313 Y128 E-.12769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.046 Y127.017 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8257
M204 S4000
G1 X122.983 Y127.017 E.02762
G1 X122.983 Y126.417 E.01559
G2 X123.784 Y125.113 I-9.732 J-6.873 E.03981
G1 X124.23 Y124.838 E.01361
G1 X124.676 Y124.868 E.01162
G1 X125.62 Y125.211 E.02611
G1 X125.62 Y128.728 E.09142
G2 X124.23 Y130.115 I1.315 J2.708 E.05201
G1 X123.784 Y130.887 E.02318
G1 X123.338 Y131.162 E.01361
G1 X122.892 Y131.132 E.01162
G3 X121.409 Y130.408 I.612 J-3.135 E.04339
G1 X121.263 Y130.408 E.00379
G1 X121.017 Y130.162 E.00906
G1 X121.017 Y129.985 E.0046
G3 X120.391 Y128.983 I7.469 J-5.364 E.03072
G1 X119.838 Y128.983 E.01437
G3 X119.592 Y128.418 I.159 J-.406 E.0178
G1 X119.324 Y128.436 E.00697
G1 X118.38 Y128.778 E.02611
G1 X118.38 Y125.16 E.09405
G3 X119.77 Y126.547 I-1.315 J2.708 E.05201
G1 X120.041 Y127.017 E.01409
G1 X121.017 Y127.017 E.02536
G1 X121.017 Y126.33 E.01786
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X121.017 Y127.017 E-.26108
G1 X120.041 Y127.017 E-.37073
G1 X119.873 Y126.725 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 7/38
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S122.4
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.09 J1.214 P1  F42000
G1 X130.026 Y125.974 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 7 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer7 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.886 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.223 E.04321
G3 X131.437 Y119.962 I-.483 J1.818 E.03423
G3 X131.899 Y119.899 I.426 J1.399 E.01215
G3 X133.051 Y118.469 I1.486 J.018 E.05146
G3 X134.669 Y118.439 I.938 J7.032 E.04214
G3 X135.978 Y119.317 I-.129 J1.608 E.0428
G3 X136.676 Y119.044 I.605 J.519 E.02027
G1 X137.62 Y119.261 E.02518
G1 X137.62 Y120.923 E.04321
; WIPE_START
G1 X137.62 Y119.261 E-.63181
G1 X137.292 Y119.185 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P47 R8
G1 X136.306 Y123.689 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X136.737 Y123.496 E.01141
G1 X137.031 Y123.156 E.01082
G1 X137.154 Y122.716 E.01101
G2 X137.16 Y121.509 I-80.577 J-.986 E.02911
G2 X137.042 Y120.873 I-4.07 J.426 E.01563
G1 X136.762 Y120.523 E.0108
G1 X136.439 Y120.347 E.00888
G1 X135.926 Y120.285 E.01245
G1 X135.738 Y120.12 E.00602
G1 X135.662 Y119.583 E.01307
G1 X135.476 Y119.238 E.00945
G1 X135.127 Y118.958 E.01078
G1 X134.634 Y118.84 E.01224
G1 X133.345 Y118.84 E.03108
G2 X132.874 Y118.953 I.171 J1.753 E.01172
G1 X132.523 Y119.238 E.01089
G1 X132.347 Y119.562 E.0089
G1 X132.284 Y120.074 E.01245
G1 X132.12 Y120.262 E.00602
G1 X131.583 Y120.338 E.01307
G1 X131.238 Y120.524 E.00945
G1 X130.958 Y120.873 E.01079
G1 X130.843 Y121.342 E.01164
G1 X130.84 Y122.655 E.03168
G2 X130.953 Y123.126 I1.752 J-.171 E.01172
G1 X131.238 Y123.477 E.01089
G1 X131.561 Y123.653 E.0089
G1 X132.074 Y123.716 E.01246
G1 X132.262 Y123.88 E.00602
G1 X132.338 Y124.417 E.01307
G1 X132.524 Y124.762 E.00945
G1 X132.873 Y125.042 E.01079
G1 X133.342 Y125.157 E.01164
G1 X134.655 Y125.16 E.03168
G2 X135.126 Y125.047 I-.171 J-1.752 E.01172
G1 X135.477 Y124.762 E.01089
G1 X135.653 Y124.439 E.0089
G1 X135.716 Y123.926 E.01246
G1 X135.88 Y123.738 E.00602
G1 X136.246 Y123.696 E.00888
; WIPE_START
G1 X135.88 Y123.738 E-.13993
G1 X135.716 Y123.926 E-.09487
G1 X135.653 Y124.439 E-.19629
G1 X135.477 Y124.762 E-.14023
G1 X135.126 Y125.047 E-.17154
G1 X135.083 Y125.061 E-.01715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.35 Y120.197 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X135.285 Y119.698 E.01213
G1 X135.174 Y119.489 E.0057
G1 X134.954 Y119.313 E.0068
G1 X134.491 Y119.226 E.01136
G1 X133.361 Y119.226 E.02724
G1 X133.062 Y119.297 E.00742
G1 X132.826 Y119.489 E.00734
G1 X132.721 Y119.68 E.00525
G1 X132.65 Y120.197 E.01258
G1 X132.466 Y120.466 E.00787
G1 X132.197 Y120.65 E.00786
G1 X131.698 Y120.715 E.01214
G1 X131.489 Y120.826 E.0057
G1 X131.312 Y121.048 E.00684
G1 X131.228 Y121.484 E.01073
G1 X131.226 Y122.64 E.02786
G1 X131.297 Y122.938 E.0074
G1 X131.489 Y123.174 E.00734
G1 X131.68 Y123.279 E.00525
G1 X132.197 Y123.35 E.0126
G1 X132.466 Y123.534 E.00786
G1 X132.65 Y123.803 E.00786
G1 X132.715 Y124.302 E.01214
G1 X132.826 Y124.511 E.0057
G1 X133.048 Y124.688 E.00684
G1 X133.484 Y124.772 E.01073
G1 X134.639 Y124.774 E.02786
G1 X134.938 Y124.703 E.0074
G1 X135.174 Y124.511 E.00734
G1 X135.279 Y124.32 E.00525
G1 X135.35 Y123.803 E.0126
G1 X135.534 Y123.534 E.00786
G1 X135.803 Y123.35 E.00787
G1 X136.34 Y123.251 E.01316
G1 X136.501 Y123.179 E.00427
G1 X136.692 Y122.958 E.00704
G1 X136.774 Y122.609 E.00863
G1 X136.774 Y121.509 E.02653
G1 X136.687 Y121.046 E.01136
G1 X136.509 Y120.825 E.00685
G1 X136.32 Y120.721 E.00519
G1 X135.803 Y120.65 E.01259
G1 X135.534 Y120.466 E.00787
G1 X135.384 Y120.246 E.00642
M204 S10000
G1 X135.681 Y121.016 F42000
G1 F9600
M204 S4000
G1 X135.452 Y120.904 E.00615
G1 X135.096 Y120.548 E.01212
G1 X134.984 Y120.319 E.00615
G1 X134.909 Y119.813 E.01235
G1 X134.78 Y119.668 E.00467
G1 X134.389 Y119.611 E.00952
G1 X133.377 Y119.611 E.0244
G1 X133.2 Y119.682 E.00461
G1 X133.096 Y119.798 E.00376
G1 X133.016 Y120.319 E.01272
G1 X132.904 Y120.548 E.00615
G1 X132.548 Y120.903 E.01211
G1 X132.32 Y121.016 E.00613
G1 X131.812 Y121.091 E.01238
G1 X131.666 Y121.222 E.00474
G1 X131.614 Y121.607 E.00937
G1 X131.611 Y122.624 E.02452
G1 X131.682 Y122.8 E.00459
G1 X131.798 Y122.904 E.00376
G1 X132.32 Y122.985 E.01274
G1 X132.695 Y123.217 E.01062
G3 X133.015 Y123.68 I-.677 J.812 E.01375
G1 X133.091 Y124.188 E.01238
G1 X133.222 Y124.334 E.00474
G1 X133.607 Y124.386 E.00937
G1 X134.624 Y124.389 E.02452
G1 X134.8 Y124.318 E.00459
G1 X134.904 Y124.202 E.00376
G1 X134.984 Y123.68 E.01274
G1 X135.217 Y123.305 E.01062
G3 X135.681 Y122.984 I.812 J.677 E.01378
G1 X136.182 Y122.899 E.01226
G1 X136.353 Y122.76 E.00533
G1 X136.388 Y122.463 E.00722
G1 X136.389 Y121.509 E.023
G1 X136.332 Y121.22 E.0071
G1 X136.202 Y121.096 E.00433
G1 X135.74 Y121.025 E.01127
; WIPE_START
G1 X136.202 Y121.096 E-.17765
G1 X136.332 Y121.22 E-.06823
G1 X136.389 Y121.509 E-.11188
G1 X136.388 Y122.463 E-.36243
G1 X136.376 Y122.567 E-.03982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.558 Y122.619 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X136.003 Y122.546 E.01087
G1 X135.993 Y121.461 E.02617
G1 X135.558 Y121.381 E.01067
G1 X135.238 Y121.224 E.0086
G3 X134.619 Y120.442 I.992 J-1.421 E.0244
G1 X134.503 Y119.998 E.01105
G2 X133.462 Y119.997 I-.773 J172.511 E.02512
G1 X133.381 Y120.442 E.0109
G1 X133.224 Y120.762 E.00861
G3 X132.443 Y121.381 I-1.422 J-.992 E.02437
G1 X132 Y121.486 E.01099
G1 X131.997 Y122.538 E.02537
G1 X132.443 Y122.619 E.01093
G1 X132.763 Y122.776 E.00859
G3 X133.381 Y123.557 I-.993 J1.421 E.02436
G1 X133.486 Y124 E.01099
G1 X134.538 Y124.003 E.02537
G1 X134.619 Y123.557 E.01093
G1 X134.776 Y123.237 E.00859
G3 X135.504 Y122.645 I1.383 J.956 E.02294
M204 S10000
G1 X135.617 Y121.787 F42000
G1 F9600
M204 S4000
G1 X135.435 Y121.747 E.0045
G1 X135.023 Y121.545 E.01106
G3 X134.253 Y120.565 I1.238 J-1.766 E.03051
G1 X134.214 Y120.383 E.00449
G1 X133.787 Y120.383 E.01028
G1 X133.747 Y120.565 E.00449
G1 X133.545 Y120.976 E.01106
G3 X132.566 Y121.747 I-1.766 J-1.238 E.03047
G1 X132.385 Y121.786 E.00448
G1 X132.384 Y122.213 E.0103
G1 X132.566 Y122.253 E.00451
G1 X132.977 Y122.455 E.01104
G3 X133.747 Y123.434 I-1.239 J1.766 E.03045
G1 X133.786 Y123.615 E.00448
G1 X134.213 Y123.616 E.0103
G1 X134.253 Y123.434 E.00451
G1 X134.455 Y123.023 E.01104
G3 X135.435 Y122.253 I1.766 J1.239 E.03049
G1 X135.617 Y122.219 E.00446
G1 X135.617 Y121.847 E.00895
M204 S10000
G1 X135.083 Y122 F42000
G1 F9600
M204 S4000
G1 X134.809 Y121.866 E.00735
G1 X134.398 Y121.513 E.01306
G1 X134.134 Y121.191 E.01005
G1 X134 Y120.917 E.00735
G1 X133.866 Y121.191 E.00735
G1 X133.513 Y121.602 E.01307
G1 X133.191 Y121.865 E.01003
G1 X132.917 Y122 E.00736
G1 X133.191 Y122.135 E.00736
G1 X133.602 Y122.487 E.01305
G1 X133.865 Y122.809 E.01003
G1 X134 Y123.083 E.00736
G1 X134.135 Y122.809 E.00736
G1 X134.487 Y122.398 E.01305
G1 X134.809 Y122.134 E.01004
G1 X135.029 Y122.026 E.0059
M204 S10000
G1 X134.33 Y122 F42000
; LINE_WIDTH: 0.467846
G1 F9600
M204 S4000
G1 X134 Y121.67 E.01267
G1 X133.67 Y122 E.01266
G1 X134 Y122.33 E.01266
G1 X134.288 Y122.042 E.01104
; OBJECT_ID: 66
; WIPE_START
G1 X134 Y122.33 E-.17109
G1 X133.67 Y122 E-.19629
M73 P48 R8
G1 X134 Y121.67 E-.1963
G1 X134.33 Y122 E-.19632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.485 Y128.95 Z1.56 F42000
G1 X137.974 Y130.026 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.923 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.261 E.04321
G1 X136.676 Y131.044 E.02518
G2 X135.96 Y131.331 I-.088 J.816 E.02087
G2 X134.644 Y130.439 I-1.446 J.716 E.0432
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.882 Y131.914 I.45 J1.588 E.05182
G2 X131.453 Y131.981 I.001 J1.414 E.01134
G2 X130.38 Y131.223 I-1.576 J1.091 E.03486
G1 X130.38 Y132.886 E.04321
; WIPE_START
G1 X130.38 Y131.223 E-.63181
G1 X130.684 Y131.368 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.297 Y135.666 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X136.733 Y135.474 E.01148
G1 X137.029 Y135.134 E.01088
G1 X137.154 Y134.691 E.01109
G2 X137.16 Y133.536 I-74.079 J-.947 E.02786
G2 X137.04 Y132.895 I-4.034 J.421 E.01576
G1 X136.758 Y132.545 E.01083
G1 X136.409 Y132.361 E.00951
G1 X135.867 Y132.283 E.01321
G1 X135.694 Y132.085 E.00635
G1 X135.639 Y131.591 E.01199
G1 X135.455 Y131.242 E.00951
G1 X135.105 Y130.96 E.01083
G1 X134.608 Y130.84 E.01233
G1 X133.37 Y130.84 E.02987
G2 X132.896 Y130.954 I.174 J1.76 E.01179
G1 X132.546 Y131.241 E.01092
G1 X132.361 Y131.591 E.00952
G1 X132.283 Y132.133 E.01321
G1 X132.085 Y132.306 E.00635
G1 X131.591 Y132.361 E.01199
G1 X131.242 Y132.545 E.00951
G1 X130.959 Y132.895 E.01085
G1 X130.843 Y133.367 E.01171
G1 X130.84 Y134.63 E.03048
G2 X130.954 Y135.104 I1.76 J-.174 E.01179
G1 X131.241 Y135.454 E.01092
G1 X131.591 Y135.639 E.00952
G1 X132.133 Y135.717 E.01322
G1 X132.306 Y135.915 E.00634
G1 X132.361 Y136.409 E.01199
G1 X132.545 Y136.758 E.00951
G1 X132.895 Y137.041 E.01085
G1 X133.367 Y137.157 E.01171
G1 X134.63 Y137.16 E.03048
G2 X135.104 Y137.046 I-.174 J-1.76 E.01179
G1 X135.454 Y136.758 E.01092
G1 X135.639 Y136.409 E.00952
G1 X135.717 Y135.867 E.01322
G1 X135.915 Y135.694 E.00635
G1 X136.237 Y135.67 E.00779
; WIPE_START
G1 X135.915 Y135.694 E-.12282
G1 X135.717 Y135.867 E-.10002
G1 X135.639 Y136.409 E-.20824
G1 X135.454 Y136.758 E-.15008
G1 X135.104 Y137.046 E-.17215
G1 X135.087 Y137.051 E-.00669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.302 Y132.087 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X135.263 Y131.705 E.00926
G1 X135.151 Y131.492 E.0058
G1 X134.931 Y131.314 E.00683
G1 X134.464 Y131.226 E.01146
G1 X133.386 Y131.226 E.02599
G1 X133.085 Y131.298 E.00747
G1 X132.85 Y131.49 E.00733
G1 X132.737 Y131.705 E.00584
G1 X132.674 Y132.2 E.01204
G3 X132.087 Y132.698 I-.754 J-.295 E.01935
G1 X131.705 Y132.737 E.00926
G1 X131.492 Y132.849 E.0058
G1 X131.313 Y133.071 E.00687
G1 X131.228 Y133.511 E.01081
G1 X131.226 Y134.614 E.02661
G1 X131.298 Y134.915 E.00745
G1 X131.49 Y135.15 E.00733
G1 X131.705 Y135.263 E.00584
G1 X132.201 Y135.326 E.01205
G3 X132.698 Y135.913 I-.296 J.754 E.01933
G1 X132.737 Y136.295 E.00926
G1 X132.849 Y136.508 E.0058
G1 X133.071 Y136.687 E.00687
G1 X133.511 Y136.772 E.01081
G1 X134.614 Y136.774 E.02661
G1 X134.915 Y136.702 E.00745
G1 X135.15 Y136.51 E.00733
G1 X135.263 Y136.295 E.00584
G1 X135.326 Y135.799 E.01205
G3 X135.94 Y135.3 I.747 J.291 E.01995
G1 X136.206 Y135.285 E.00642
G1 X136.498 Y135.156 E.00772
G1 X136.691 Y134.935 E.00707
G1 X136.774 Y134.618 E.00789
G1 X136.774 Y133.536 E.0261
G1 X136.686 Y133.069 E.01146
G1 X136.508 Y132.849 E.00683
G1 X136.295 Y132.737 E.00579
G1 X135.8 Y132.674 E.01204
G3 X135.394 Y132.345 I.351 J-.847 E.01278
G1 X135.323 Y132.143 E.00516
M204 S10000
G1 X135.072 Y132.556 F42000
G1 F9600
M204 S4000
G1 X134.958 Y132.315 E.00644
G1 X134.887 Y131.819 E.01209
G1 X134.756 Y131.669 E.00481
G1 X134.348 Y131.611 E.00993
G1 X133.403 Y131.611 E.0228
G2 X133.113 Y131.819 I.04 J.362 E.00898
G1 X133.042 Y132.315 E.01209
G1 X132.928 Y132.556 E.00644
G3 X132.316 Y133.042 I-1.087 J-.741 E.01913
G1 X131.819 Y133.113 E.01211
G1 X131.667 Y133.246 E.00487
G1 X131.614 Y133.648 E.00977
G1 X131.611 Y134.599 E.02292
G1 X131.676 Y134.768 E.00438
G1 X131.819 Y134.887 E.00448
G1 X132.316 Y134.958 E.01212
G1 X132.557 Y135.072 E.00642
G3 X133.042 Y135.684 I-.741 J1.086 E.01912
G1 X133.113 Y136.181 E.01211
G1 X133.246 Y136.333 E.00487
G1 X133.648 Y136.386 E.00977
G1 X134.599 Y136.389 E.02292
G1 X134.768 Y136.324 E.00438
G1 X134.887 Y136.181 E.00448
G1 X134.958 Y135.684 E.01212
G1 X135.072 Y135.443 E.00642
G3 X135.685 Y134.958 I1.086 J.741 E.01914
G1 X136.199 Y134.866 E.0126
G1 X136.353 Y134.736 E.00486
G1 X136.388 Y134.417 E.00774
G1 X136.389 Y133.536 E.02124
G1 X136.331 Y133.244 E.00717
G1 X136.181 Y133.113 E.0048
G1 X135.685 Y133.042 E.0121
G1 X135.444 Y132.928 E.00643
G3 X135.11 Y132.603 I.822 J-1.178 E.01129
; WIPE_START
G1 X135.196 Y132.709 E-.052
G1 X135.444 Y132.928 E-.12559
G1 X135.685 Y133.042 E-.10138
G1 X136.181 Y133.113 E-.1906
G1 X136.331 Y133.244 E-.07571
G1 X136.389 Y133.536 E-.11298
G1 X136.389 Y133.804 E-.10173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.57 Y134.59 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X136.003 Y134.524 E.01057
G1 X135.992 Y133.481 E.02516
G1 X135.57 Y133.41 E.01032
G1 X135.232 Y133.25 E.00901
G3 X134.59 Y132.43 I.984 J-1.432 E.02551
G1 X134.519 Y132.008 E.01031
G2 X133.482 Y131.997 I-.778 J23.246 E.025
G1 X133.41 Y132.43 E.01059
G1 X133.251 Y132.768 E.00901
G3 X132.432 Y133.41 I-1.433 J-.984 E.02548
G1 X132 Y133.513 E.01071
G1 X131.997 Y134.518 E.02424
G1 X132.432 Y134.59 E.01062
G1 X132.768 Y134.75 E.00899
G3 X133.41 Y135.568 I-.985 J1.432 E.02547
G1 X133.513 Y136 E.01071
G1 X134.518 Y136.003 E.02424
G1 X134.59 Y135.568 E.01062
G1 X134.75 Y135.232 E.00899
G3 X135.515 Y134.615 I1.395 J.949 E.02405
M204 S10000
G1 X135.617 Y133.812 F42000
G1 F9600
M204 S4000
G1 X135.454 Y133.778 E.00401
G1 X135.02 Y133.573 E.01158
G1 X134.651 Y133.254 E.01176
G1 X134.427 Y132.98 E.00854
G1 X134.222 Y132.545 E.01158
G1 X134.188 Y132.383 E.00401
G1 X133.812 Y132.383 E.00907
G1 X133.778 Y132.545 E.00401
G1 X133.573 Y132.98 E.01158
G1 X133.254 Y133.349 E.01177
G1 X132.98 Y133.573 E.00853
G1 X132.547 Y133.778 E.01156
G1 X132.385 Y133.811 E.004
G1 X132.384 Y134.188 E.00909
G1 X132.547 Y134.222 E.00403
G1 X132.98 Y134.427 E.01156
G1 X133.349 Y134.746 E.01175
G1 X133.573 Y135.02 E.00853
G1 X133.778 Y135.453 E.01156
G1 X133.811 Y135.615 E.004
G1 X134.188 Y135.616 E.00909
G1 X134.222 Y135.453 E.00403
G1 X134.427 Y135.02 E.01156
G1 X134.746 Y134.651 E.01175
G1 X135.02 Y134.427 E.00854
G1 X135.454 Y134.222 E.01158
G1 X135.617 Y134.192 E.00399
G1 X135.617 Y133.872 E.00772
M204 S10000
G1 X135.03 Y134 F42000
G1 F9600
M204 S4000
G1 X134.809 Y133.895 E.0059
G1 X134.378 Y133.527 E.01366
G1 X134.105 Y133.191 E.01044
G1 X134 Y132.97 E.0059
G1 X133.895 Y133.191 E.0059
G1 X133.527 Y133.622 E.01366
G1 X133.192 Y133.895 E.01042
G1 X132.97 Y134 E.00592
G1 X133.192 Y134.105 E.00592
G1 X133.622 Y134.473 E.01364
G1 X133.895 Y134.808 E.01042
G1 X134 Y135.03 E.00592
G1 X134.105 Y134.808 E.00592
G1 X134.473 Y134.378 E.01364
G1 X134.809 Y134.105 E.01044
G1 X134.976 Y134.026 E.00446
M204 S10000
G1 X134.311 Y134 F42000
; LINE_WIDTH: 0.443166
G1 F9600
M204 S4000
G1 X134 Y133.689 E.01126
G1 X133.689 Y134 E.01125
G1 X134 Y134.311 E.01125
G1 X134.269 Y134.042 E.00972
; OBJECT_ID: 88
; WIPE_START
G1 X134 Y134.311 E-.16989
G1 X133.689 Y134 E-.19669
G1 X134 Y133.689 E-.1967
G1 X134.311 Y134 E-.19671
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.895 Y132.198 Z1.56 F42000
G1 X125.974 Y131.974 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.311 Y129.713 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F9600
M204 S4000
G1 X124.742 Y129.517 E.01143
G1 X125.032 Y129.178 E.01077
G1 X125.154 Y128.741 E.01093
G2 X125.16 Y127.483 I-87.097 J-1.026 E.03034
G2 X125.043 Y126.85 I-4.07 J.423 E.01554
G1 X124.766 Y126.501 E.01074
G1 X124.445 Y126.324 E.00885
G1 X123.945 Y126.258 E.01217
G1 X123.764 Y126.098 E.00583
G1 X123.685 Y125.577 E.01271
G1 X123.498 Y125.233 E.00943
G1 X123.15 Y124.957 E.01072
G1 X122.659 Y124.84 E.01217
G1 X121.32 Y124.84 E.03229
G2 X120.852 Y124.951 I.168 J1.746 E.01164
G1 X120.502 Y125.233 E.01083
G1 X120.324 Y125.555 E.00887
G1 X120.258 Y126.055 E.01217
G1 X120.098 Y126.236 E.00583
G1 X119.577 Y126.315 E.01271
G1 X119.233 Y126.502 E.00943
G1 X118.956 Y126.851 E.01074
G1 X118.843 Y127.317 E.01157
G1 X118.84 Y128.68 E.03289
G2 X118.951 Y129.148 I1.746 J-.168 E.01164
G1 X119.233 Y129.498 E.01083
G1 X119.555 Y129.676 E.00887
G1 X120.056 Y129.742 E.01217
G1 X120.236 Y129.902 E.00583
G1 X120.315 Y130.423 E.01271
G1 X120.502 Y130.767 E.00943
G1 X120.851 Y131.044 E.01074
G1 X121.317 Y131.157 E.01157
G1 X122.68 Y131.16 E.03289
G2 X123.148 Y131.049 I-.168 J-1.746 E.01164
G1 X123.498 Y130.767 E.01083
G1 X123.676 Y130.445 E.00887
G1 X123.742 Y129.944 E.01217
G1 X123.902 Y129.764 E.00583
G1 X124.251 Y129.721 E.00847
; WIPE_START
G1 X123.902 Y129.764 E-.13348
G1 X123.742 Y129.944 E-.09182
G1 X123.676 Y130.445 E-.19182
G1 X123.498 Y130.767 E-.13977
G1 X123.148 Y131.049 E-.17069
G1 X123.067 Y131.075 E-.03242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.38 Y126.188 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X123.254 Y125.592 E.01471
G2 X122.977 Y125.312 I-.825 J.54 E.00955
G1 X122.517 Y125.226 E.01129
G1 X121.336 Y125.226 E.02847
G1 X121.039 Y125.296 E.00737
G1 X120.803 Y125.486 E.00731
G1 X120.698 Y125.676 E.00524
G1 X120.62 Y126.188 E.0125
G1 X120.442 Y126.442 E.00747
G1 X120.189 Y126.62 E.00746
G1 X119.694 Y126.691 E.01206
G1 X119.486 Y126.803 E.00569
G1 X119.311 Y127.024 E.0068
G1 X119.228 Y127.459 E.01066
G1 X119.226 Y128.664 E.02908
G1 X119.296 Y128.961 E.00735
G1 X119.486 Y129.197 E.00731
G1 X119.676 Y129.302 E.00523
G1 X120.189 Y129.38 E.01251
G1 X120.442 Y129.558 E.00746
G1 X120.62 Y129.811 E.00746
G1 X120.691 Y130.306 E.01206
G1 X120.803 Y130.514 E.00569
G1 X121.024 Y130.689 E.0068
G1 X121.459 Y130.772 E.01066
G1 X122.664 Y130.774 E.02908
G1 X122.961 Y130.704 E.00735
G1 X123.197 Y130.514 E.00731
G1 X123.302 Y130.324 E.00523
G1 X123.38 Y129.811 E.01251
G1 X123.558 Y129.558 E.00746
G1 X123.812 Y129.38 E.00747
G1 X124.343 Y129.275 E.01306
G1 X124.505 Y129.201 E.00429
G1 X124.693 Y128.981 E.007
G1 X124.774 Y128.634 E.00858
G1 X124.774 Y127.483 E.02776
G1 X124.688 Y127.023 E.01129
G1 X124.512 Y126.802 E.00681
G1 X124.324 Y126.698 E.00518
G1 X123.812 Y126.62 E.0125
G1 X123.558 Y126.442 E.00747
G1 X123.414 Y126.238 E.00602
M204 S10000
G1 X123.127 Y126.533 F42000
G1 F9600
M204 S4000
G1 X123.018 Y126.322 E.00574
G1 X122.934 Y125.811 E.01248
G1 X122.804 Y125.667 E.00467
G1 X122.429 Y125.611 E.00915
G1 X121.353 Y125.611 E.02596
G1 X121.175 Y125.681 E.00459
G1 X121.071 Y125.797 E.00375
G1 X120.982 Y126.322 E.01284
G1 X120.759 Y126.671 E.00999
G3 X120.323 Y126.982 I-.817 J-.685 E.01306
G1 X119.811 Y127.066 E.0125
G1 X119.666 Y127.198 E.00473
G1 X119.614 Y127.567 E.009
G1 X119.611 Y128.648 E.02608
G1 X119.681 Y128.825 E.00457
G1 X119.797 Y128.929 E.00375
G1 X120.323 Y129.018 E.01286
G1 X120.671 Y129.241 E.00997
G3 X120.982 Y129.678 I-.684 J.817 E.01306
G1 X121.066 Y130.189 E.0125
G1 X121.198 Y130.334 E.00473
G1 X121.567 Y130.386 E.00899
G1 X122.648 Y130.389 E.02608
G1 X122.825 Y130.319 E.00457
G1 X122.929 Y130.203 E.00375
G1 X123.018 Y129.678 E.01286
G1 X123.241 Y129.329 E.00997
G3 X123.678 Y129.018 I.817 J.684 E.01308
G1 X124.183 Y128.924 E.01239
G1 X124.354 Y128.784 E.00533
G1 X124.388 Y128.506 E.00676
G1 X124.389 Y127.483 E.02467
G1 X124.333 Y127.196 E.00706
G1 X124.203 Y127.071 E.00432
G1 X123.678 Y126.982 E.01284
G1 X123.329 Y126.759 E.00999
G1 X123.167 Y126.578 E.00587
; WIPE_START
G1 X123.329 Y126.759 E-.09244
G1 X123.678 Y126.982 E-.15736
G1 X124.203 Y127.071 E-.20234
G1 X124.333 Y127.196 E-.06814
G1 X124.389 Y127.483 E-.11122
G1 X124.389 Y127.821 E-.12851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.545 Y128.656 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X124.003 Y128.571 E.01122
G1 X124.003 Y127.483 E.02626
G1 X123.993 Y127.435 E.00119
G1 X123.545 Y127.344 E.01102
G1 X123.249 Y127.191 E.00803
G3 X122.656 Y126.455 I1.016 J-1.425 E.02309
G1 X122.53 Y125.998 E.01142
G2 X121.436 Y125.997 I-.812 J191.795 E.02638
G1 X121.344 Y126.455 E.01126
G1 X121.191 Y126.751 E.00803
G3 X120.456 Y127.343 I-1.426 J-1.016 E.02306
G1 X120 Y127.46 E.01136
G1 X119.997 Y128.564 E.02663
G1 X120.456 Y128.657 E.01129
G1 X120.751 Y128.809 E.00801
G3 X121.344 Y129.544 I-1.017 J1.425 E.02305
G1 X121.46 Y130 E.01136
G1 X122.564 Y130.003 E.02663
G1 X122.657 Y129.544 E.01129
G1 X122.809 Y129.249 E.00801
G3 X123.492 Y128.684 I1.385 J.978 E.02163
M204 S10000
G1 X123.617 Y127.755 F42000
G1 F9600
M204 S4000
G1 X123.412 Y127.706 E.00509
G1 X123.032 Y127.51 E.01033
G3 X122.294 Y126.588 I1.265 J-1.768 E.02883
G1 X122.246 Y126.383 E.00508
G1 X121.755 Y126.383 E.01183
G1 X121.706 Y126.588 E.00509
G1 X121.51 Y126.968 E.01033
G3 X120.589 Y127.705 I-1.768 J-1.265 E.02879
G1 X120.385 Y127.753 E.00507
G1 X120.384 Y128.245 E.01186
G1 X120.589 Y128.295 E.00511
G1 X120.969 Y128.491 E.0103
G3 X121.705 Y129.411 I-1.266 J1.768 E.02877
G1 X121.753 Y129.615 E.00507
G1 X122.245 Y129.616 E.01186
G1 X122.295 Y129.411 E.00511
G1 X122.491 Y129.031 E.0103
G3 X123.412 Y128.294 I1.768 J1.266 E.02881
G1 X123.617 Y128.252 E.00505
G1 X123.617 Y127.815 E.01052
M204 S10000
G1 X123.147 Y128 F42000
G1 F9600
M204 S4000
G1 X122.814 Y127.828 E.00905
G3 X122.172 Y127.186 I1.628 J-2.27 E.02198
G1 X122 Y126.853 E.00905
G1 X121.828 Y127.186 E.00905
G3 X121.187 Y127.828 I-2.27 J-1.628 E.02197
G1 X120.853 Y128 E.00906
G1 X121.187 Y128.172 E.00906
G3 X121.828 Y128.813 I-1.63 J2.271 E.02195
G1 X122 Y129.147 E.00906
G1 X122.173 Y128.813 E.00906
G3 X122.814 Y128.172 I2.27 J1.629 E.02196
G1 X123.094 Y128.028 E.00761
M204 S10000
G1 X122.356 Y128 F42000
; LINE_WIDTH: 0.502216
G1 F9600
M204 S4000
G1 X122 Y127.644 E.01472
G1 X121.644 Y128 E.01472
G1 X122 Y128.356 E.01472
G1 X122.313 Y128.042 E.01296
; WIPE_START
G1 X122 Y128.356 E-.17248
G1 X121.644 Y128 E-.19582
G1 X122 Y127.644 E-.19584
G1 X122.356 Y128 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.923 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.261 E.04321
G1 X124.676 Y125.044 E.02518
G2 X123.997 Y125.303 I-.097 J.767 E.01967
G2 X122.694 Y124.439 I-1.431 J.744 E.0424
G2 X121.027 Y124.469 I-.704 J7.294 E.04343
G2 X119.875 Y125.875 I.331 J1.446 E.05085
G2 X119.422 Y125.942 I-.022 J1.407 E.01194
G2 X118.38 Y125.223 I-1.507 J1.069 E.0336
G1 X118.38 Y126.886 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.223 E-.63181
G1 X118.684 Y125.368 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 8/38
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S124.95
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.56 I-.065 J1.215 P1  F42000
G1 X130.026 Y125.974 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 8 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer8 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.928 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.265 E.04321
G3 X131.501 Y119.942 I-.347 J1.842 E.03479
M73 P49 R8
G3 X131.899 Y119.899 I.322 J1.104 E.01045
G3 X133.051 Y118.469 I1.486 J.018 E.05146
G3 X134.669 Y118.439 I.938 J7.032 E.04214
G3 X136.053 Y119.484 I-.123 J1.602 E.04762
G3 X137.62 Y119.296 I.963 J1.405 E.04265
G1 X137.62 Y120.959 E.04321
M204 S10000
G1 X137.16 Y121.509 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.042 Y120.873 I-4.07 J.426 E.01563
G1 X136.762 Y120.523 E.0108
G1 X136.439 Y120.347 E.00888
G1 X135.926 Y120.285 E.01245
G1 X135.738 Y120.12 E.00602
G1 X135.662 Y119.583 E.01307
G1 X135.476 Y119.238 E.00945
G1 X135.127 Y118.958 E.01078
G1 X134.634 Y118.84 E.01224
G1 X133.345 Y118.84 E.03108
G2 X132.874 Y118.953 I.171 J1.753 E.01172
G1 X132.523 Y119.238 E.01089
G1 X132.347 Y119.562 E.0089
G1 X132.284 Y120.074 E.01245
G1 X132.12 Y120.262 E.00602
G1 X131.583 Y120.338 E.01307
G1 X131.238 Y120.524 E.00945
G1 X130.958 Y120.873 E.01079
G1 X130.843 Y121.342 E.01164
G1 X130.84 Y122.655 E.03168
G2 X130.953 Y123.126 I1.752 J-.171 E.01172
G1 X131.238 Y123.477 E.01089
G1 X131.561 Y123.653 E.0089
G1 X132.074 Y123.716 E.01246
G1 X132.262 Y123.88 E.00602
G1 X132.338 Y124.417 E.01307
G1 X132.524 Y124.762 E.00945
G1 X132.873 Y125.042 E.01079
G1 X133.342 Y125.157 E.01164
G1 X134.655 Y125.16 E.03168
G2 X135.126 Y125.047 I-.171 J-1.752 E.01172
G1 X135.477 Y124.762 E.01089
G1 X135.653 Y124.439 E.0089
G1 X135.716 Y123.926 E.01246
G1 X135.88 Y123.738 E.00602
G1 X136.306 Y123.689 E.01033
G1 X136.737 Y123.496 E.01141
G1 X137.031 Y123.156 E.01082
G1 X137.154 Y122.716 E.01101
G2 X137.16 Y121.569 I-76.532 J-.955 E.02766
M204 S10000
G1 X136.774 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.687 Y121.046 E.01136
G1 X136.509 Y120.825 E.00685
G1 X136.32 Y120.721 E.00519
G1 X135.803 Y120.65 E.01259
G1 X135.534 Y120.466 E.00787
G1 X135.35 Y120.197 E.00787
G1 X135.285 Y119.698 E.01213
G1 X135.174 Y119.489 E.0057
G1 X134.954 Y119.313 E.0068
G1 X134.491 Y119.226 E.01136
G1 X133.361 Y119.226 E.02724
G1 X133.062 Y119.297 E.00742
G1 X132.826 Y119.489 E.00734
G1 X132.721 Y119.68 E.00525
G1 X132.65 Y120.197 E.01258
G1 X132.466 Y120.466 E.00787
G1 X132.197 Y120.65 E.00786
G1 X131.698 Y120.715 E.01214
G1 X131.489 Y120.826 E.0057
G1 X131.312 Y121.048 E.00684
G1 X131.228 Y121.484 E.01073
G1 X131.226 Y122.64 E.02786
G1 X131.297 Y122.938 E.0074
G1 X131.489 Y123.174 E.00734
G1 X131.68 Y123.279 E.00525
G1 X132.197 Y123.35 E.0126
G1 X132.466 Y123.534 E.00786
G1 X132.65 Y123.803 E.00786
G1 X132.715 Y124.302 E.01214
G1 X132.826 Y124.511 E.0057
G1 X133.048 Y124.688 E.00684
G1 X133.484 Y124.772 E.01073
G1 X134.639 Y124.774 E.02786
G1 X134.938 Y124.703 E.0074
G1 X135.174 Y124.511 E.00734
G1 X135.279 Y124.32 E.00525
G1 X135.35 Y123.803 E.0126
G1 X135.534 Y123.534 E.00786
G1 X135.803 Y123.35 E.00787
G1 X136.34 Y123.251 E.01316
G1 X136.501 Y123.179 E.00427
G1 X136.692 Y122.958 E.00704
G1 X136.774 Y122.609 E.00863
G1 X136.774 Y121.569 E.02509
M204 S10000
G1 X136.389 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.332 Y121.22 E.0071
G1 X136.202 Y121.096 E.00433
G1 X135.681 Y121.016 E.01272
G1 X135.452 Y120.904 E.00615
G1 X135.096 Y120.548 E.01212
G1 X134.984 Y120.319 E.00615
G1 X134.909 Y119.813 E.01235
G1 X134.78 Y119.668 E.00467
G1 X134.389 Y119.611 E.00952
G1 X133.377 Y119.611 E.0244
G1 X133.2 Y119.682 E.00461
G1 X133.096 Y119.798 E.00376
G1 X133.016 Y120.319 E.01272
G1 X132.904 Y120.548 E.00615
G1 X132.548 Y120.903 E.01211
G1 X132.32 Y121.016 E.00613
G1 X131.812 Y121.091 E.01238
G1 X131.666 Y121.222 E.00474
G1 X131.614 Y121.607 E.00937
G1 X131.611 Y122.624 E.02452
G1 X131.682 Y122.8 E.00459
G1 X131.798 Y122.904 E.00376
G1 X132.32 Y122.985 E.01274
G1 X132.695 Y123.217 E.01062
G3 X133.015 Y123.68 I-.677 J.812 E.01375
G1 X133.091 Y124.188 E.01238
G1 X133.222 Y124.334 E.00474
G1 X133.607 Y124.386 E.00937
G1 X134.624 Y124.389 E.02452
G1 X134.8 Y124.318 E.00459
G1 X134.904 Y124.202 E.00376
G1 X134.984 Y123.68 E.01274
G1 X135.217 Y123.305 E.01062
G3 X135.681 Y122.984 I.812 J.677 E.01378
G1 X136.182 Y122.899 E.01226
G1 X136.353 Y122.76 E.00533
G1 X136.388 Y122.463 E.00722
G1 X136.389 Y121.569 E.02155
M204 S10000
G1 X136.003 Y121.509 F42000
G1 F9600
M204 S4000
G1 X135.993 Y121.461 E.00118
G1 X135.558 Y121.381 E.01067
G1 X135.238 Y121.224 E.0086
G3 X134.619 Y120.442 I.992 J-1.421 E.0244
G1 X134.503 Y119.998 E.01105
G2 X133.462 Y119.997 I-.773 J172.511 E.02512
G1 X133.381 Y120.442 E.0109
G1 X133.224 Y120.762 E.00861
G3 X132.443 Y121.381 I-1.422 J-.992 E.02437
G1 X132 Y121.486 E.01099
G1 X131.997 Y122.538 E.02537
G1 X132.443 Y122.619 E.01093
G1 X132.763 Y122.776 E.00859
G3 X133.381 Y123.557 I-.993 J1.421 E.02436
G1 X133.486 Y124 E.01099
G1 X134.538 Y124.003 E.02537
G1 X134.619 Y123.557 E.01093
G1 X134.776 Y123.237 E.00859
G3 X135.558 Y122.619 I1.421 J.993 E.02439
G1 X136.003 Y122.546 E.01087
G1 X136.003 Y121.569 E.02357
M204 S10000
G1 X135.617 Y121.787 F42000
G1 F9600
M204 S4000
G1 X135.435 Y121.747 E.0045
G1 X135.023 Y121.545 E.01106
G3 X134.253 Y120.565 I1.238 J-1.766 E.03051
G1 X134.214 Y120.383 E.00449
G1 X133.787 Y120.383 E.01028
G1 X133.747 Y120.565 E.00449
G1 X133.545 Y120.976 E.01106
G3 X132.566 Y121.747 I-1.766 J-1.238 E.03047
G1 X132.385 Y121.786 E.00448
G1 X132.384 Y122.213 E.0103
G1 X132.566 Y122.253 E.00451
G1 X132.977 Y122.455 E.01104
G3 X133.747 Y123.434 I-1.239 J1.766 E.03045
G1 X133.786 Y123.615 E.00448
G1 X134.213 Y123.616 E.0103
G1 X134.253 Y123.434 E.00451
G1 X134.455 Y123.023 E.01104
G3 X135.435 Y122.253 I1.766 J1.239 E.03049
G1 X135.617 Y122.219 E.00446
G1 X135.617 Y121.847 E.00895
M204 S10000
G1 X135.083 Y122 F42000
G1 F9600
M204 S4000
G1 X134.809 Y121.866 E.00735
G1 X134.398 Y121.513 E.01306
G1 X134.134 Y121.191 E.01005
G1 X134 Y120.917 E.00735
G1 X133.866 Y121.191 E.00735
G1 X133.513 Y121.602 E.01307
G1 X133.191 Y121.865 E.01003
G1 X132.917 Y122 E.00736
G1 X133.191 Y122.135 E.00736
G1 X133.602 Y122.487 E.01305
G1 X133.865 Y122.809 E.01003
G1 X134 Y123.083 E.00736
G1 X134.135 Y122.809 E.00736
G1 X134.487 Y122.398 E.01305
G1 X134.809 Y122.134 E.01004
G1 X135.029 Y122.026 E.0059
M204 S10000
G1 X134.33 Y122 F42000
; LINE_WIDTH: 0.467846
G1 F9600
M204 S4000
G1 X134 Y121.67 E.01267
G1 X133.67 Y122 E.01266
G1 X134 Y122.33 E.01266
G1 X134.288 Y122.042 E.01104
; OBJECT_ID: 66
; WIPE_START
G1 X134 Y122.33 E-.17109
G1 X133.67 Y122 E-.19629
G1 X134 Y121.67 E-.1963
G1 X134.33 Y122 E-.19632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.485 Y128.95 Z1.72 F42000
G1 X137.974 Y130.026 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.959 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.296 E.04321
G2 X136.033 Y131.501 I-.602 J1.585 E.04333
G2 X134.644 Y130.439 I-1.511 J.537 E.04806
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.882 Y131.914 I.45 J1.588 E.05182
G2 X131.52 Y131.963 I.173 J2.679 E.00951
G2 X130.38 Y131.265 I-1.505 J1.179 E.03549
G1 X130.38 Y132.928 E.04321
; WIPE_START
G1 X130.38 Y131.265 E-.63181
G1 X130.695 Y131.384 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.16 Y133.536 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.04 Y132.895 I-4.034 J.421 E.01576
G1 X136.758 Y132.545 E.01083
G1 X136.409 Y132.361 E.00951
G1 X135.867 Y132.283 E.01321
G1 X135.694 Y132.085 E.00635
G1 X135.639 Y131.591 E.01199
G1 X135.455 Y131.242 E.00951
G1 X135.105 Y130.96 E.01083
G1 X134.608 Y130.84 E.01233
G1 X133.37 Y130.84 E.02987
G2 X132.896 Y130.954 I.174 J1.76 E.01179
G1 X132.546 Y131.241 E.01092
G1 X132.361 Y131.591 E.00952
G1 X132.283 Y132.133 E.01321
G1 X132.085 Y132.306 E.00635
G1 X131.591 Y132.361 E.01199
G1 X131.242 Y132.545 E.00951
G1 X130.959 Y132.895 E.01085
G1 X130.843 Y133.367 E.01171
G1 X130.84 Y134.63 E.03048
G2 X130.954 Y135.104 I1.76 J-.174 E.01179
G1 X131.241 Y135.454 E.01092
G1 X131.591 Y135.639 E.00952
G1 X132.133 Y135.717 E.01322
G1 X132.306 Y135.915 E.00634
G1 X132.361 Y136.409 E.01199
G1 X132.545 Y136.758 E.00951
G1 X132.895 Y137.041 E.01085
G1 X133.367 Y137.157 E.01171
G1 X134.63 Y137.16 E.03048
G2 X135.104 Y137.046 I-.174 J-1.76 E.01179
G1 X135.454 Y136.758 E.01092
G1 X135.639 Y136.409 E.00952
G1 X135.717 Y135.867 E.01322
G1 X135.915 Y135.694 E.00635
G1 X136.297 Y135.666 E.00924
G1 X136.733 Y135.474 E.01148
G1 X137.029 Y135.134 E.01088
G1 X137.154 Y134.691 E.01109
G2 X137.16 Y133.596 I-70.217 J-.916 E.02641
M204 S10000
G1 X136.774 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.686 Y133.069 E.01146
G1 X136.508 Y132.849 E.00683
G1 X136.295 Y132.737 E.00579
G1 X135.8 Y132.674 E.01204
G3 X135.302 Y132.087 I.295 J-.754 E.01935
G1 X135.263 Y131.705 E.00926
G1 X135.151 Y131.492 E.0058
G1 X134.931 Y131.314 E.00683
G1 X134.464 Y131.226 E.01146
G1 X133.386 Y131.226 E.02599
G1 X133.085 Y131.298 E.00747
G1 X132.85 Y131.49 E.00733
G1 X132.737 Y131.705 E.00584
G1 X132.674 Y132.2 E.01204
G3 X132.087 Y132.698 I-.754 J-.295 E.01935
G1 X131.705 Y132.737 E.00926
G1 X131.492 Y132.849 E.0058
G1 X131.313 Y133.071 E.00687
G1 X131.228 Y133.511 E.01081
G1 X131.226 Y134.614 E.02661
G1 X131.298 Y134.915 E.00745
G1 X131.49 Y135.15 E.00733
G1 X131.705 Y135.263 E.00584
G1 X132.201 Y135.326 E.01205
G3 X132.698 Y135.913 I-.296 J.754 E.01933
G1 X132.737 Y136.295 E.00926
G1 X132.849 Y136.508 E.0058
G1 X133.071 Y136.687 E.00687
G1 X133.511 Y136.772 E.01081
G1 X134.614 Y136.774 E.02661
G1 X134.915 Y136.702 E.00745
G1 X135.15 Y136.51 E.00733
G1 X135.263 Y136.295 E.00584
G1 X135.326 Y135.799 E.01205
G3 X135.94 Y135.3 I.747 J.291 E.01995
G1 X136.206 Y135.285 E.00642
G1 X136.498 Y135.156 E.00772
G1 X136.691 Y134.935 E.00707
G1 X136.774 Y134.618 E.00789
G1 X136.774 Y133.596 E.02465
M204 S10000
G1 X136.389 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.331 Y133.244 E.00717
G1 X136.181 Y133.113 E.0048
G1 X135.685 Y133.042 E.0121
G1 X135.444 Y132.928 E.00643
G3 X134.958 Y132.315 I.741 J-1.086 E.01915
G1 X134.887 Y131.819 E.01209
G1 X134.756 Y131.669 E.00481
G1 X134.348 Y131.611 E.00993
G1 X133.403 Y131.611 E.0228
G2 X133.113 Y131.819 I.04 J.362 E.00898
G1 X133.042 Y132.315 E.01209
G1 X132.928 Y132.556 E.00644
G3 X132.316 Y133.042 I-1.087 J-.741 E.01913
G1 X131.819 Y133.113 E.01211
G1 X131.667 Y133.246 E.00487
G1 X131.614 Y133.648 E.00977
G1 X131.611 Y134.599 E.02292
G1 X131.676 Y134.768 E.00438
G1 X131.819 Y134.887 E.00448
G1 X132.316 Y134.958 E.01212
G1 X132.557 Y135.072 E.00642
G3 X133.042 Y135.684 I-.741 J1.086 E.01912
G1 X133.113 Y136.181 E.01211
G1 X133.246 Y136.333 E.00487
G1 X133.648 Y136.386 E.00977
G1 X134.599 Y136.389 E.02292
G1 X134.768 Y136.324 E.00438
G1 X134.887 Y136.181 E.00448
G1 X134.958 Y135.684 E.01212
G1 X135.072 Y135.443 E.00642
G3 X135.685 Y134.958 I1.086 J.741 E.01914
G1 X136.199 Y134.866 E.0126
G1 X136.353 Y134.736 E.00486
G1 X136.388 Y134.417 E.00774
G1 X136.389 Y133.596 E.01979
M204 S10000
G1 X136.003 Y133.536 F42000
G1 F9600
M204 S4000
G1 X135.992 Y133.481 E.00135
G1 X135.57 Y133.41 E.01032
G1 X135.232 Y133.25 E.00901
G3 X134.59 Y132.43 I.984 J-1.432 E.02551
G1 X134.519 Y132.008 E.01031
G2 X133.482 Y131.997 I-.778 J23.246 E.025
G1 X133.41 Y132.43 E.01059
G1 X133.251 Y132.768 E.00901
G3 X132.432 Y133.41 I-1.433 J-.984 E.02548
G1 X132 Y133.513 E.01071
G1 X131.997 Y134.518 E.02424
G1 X132.432 Y134.59 E.01062
G1 X132.768 Y134.75 E.00899
G3 X133.41 Y135.568 I-.985 J1.432 E.02547
G1 X133.513 Y136 E.01071
G1 X134.518 Y136.003 E.02424
G1 X134.59 Y135.568 E.01062
G1 X134.75 Y135.232 E.00899
G3 X135.57 Y134.59 I1.432 J.985 E.0255
G1 X136.003 Y134.524 E.01057
G1 X136.003 Y133.596 E.02239
M204 S10000
G1 X135.617 Y133.812 F42000
G1 F9600
M204 S4000
G1 X135.454 Y133.778 E.00401
G1 X135.02 Y133.573 E.01158
G1 X134.651 Y133.254 E.01176
G1 X134.427 Y132.98 E.00854
G1 X134.222 Y132.545 E.01158
G1 X134.188 Y132.383 E.00401
G1 X133.812 Y132.383 E.00907
G1 X133.778 Y132.545 E.00401
G1 X133.573 Y132.98 E.01158
G1 X133.254 Y133.349 E.01177
G1 X132.98 Y133.573 E.00853
G1 X132.547 Y133.778 E.01156
G1 X132.385 Y133.811 E.004
G1 X132.384 Y134.188 E.00909
G1 X132.547 Y134.222 E.00403
G1 X132.98 Y134.427 E.01156
G1 X133.349 Y134.746 E.01175
G1 X133.573 Y135.02 E.00853
G1 X133.778 Y135.453 E.01156
G1 X133.811 Y135.615 E.004
G1 X134.188 Y135.616 E.00909
G1 X134.222 Y135.453 E.00403
G1 X134.427 Y135.02 E.01156
G1 X134.746 Y134.651 E.01175
G1 X135.02 Y134.427 E.00854
G1 X135.454 Y134.222 E.01158
G1 X135.617 Y134.192 E.00399
G1 X135.617 Y133.872 E.00772
M204 S10000
G1 X135.03 Y134 F42000
G1 F9600
M204 S4000
G1 X134.809 Y133.895 E.0059
G1 X134.378 Y133.527 E.01366
G1 X134.105 Y133.191 E.01044
G1 X134 Y132.97 E.0059
G1 X133.895 Y133.191 E.0059
G1 X133.527 Y133.622 E.01366
G1 X133.192 Y133.895 E.01042
G1 X132.97 Y134 E.00592
G1 X133.192 Y134.105 E.00592
G1 X133.622 Y134.473 E.01364
G1 X133.895 Y134.808 E.01042
G1 X134 Y135.03 E.00592
G1 X134.105 Y134.808 E.00592
G1 X134.473 Y134.378 E.01364
G1 X134.809 Y134.105 E.01044
M73 P50 R8
G1 X134.976 Y134.026 E.00446
M204 S10000
G1 X134.311 Y134 F42000
; LINE_WIDTH: 0.443166
G1 F9600
M204 S4000
G1 X134 Y133.689 E.01126
G1 X133.689 Y134 E.01125
G1 X134 Y134.311 E.01125
G1 X134.269 Y134.042 E.00972
; OBJECT_ID: 88
; WIPE_START
G1 X134 Y134.311 E-.16989
G1 X133.689 Y134 E-.19669
G1 X134 Y133.689 E-.1967
G1 X134.311 Y134 E-.19671
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.895 Y132.198 Z1.72 F42000
G1 X125.974 Y131.974 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.16 Y127.483 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F9600
M204 S4000
G2 X125.043 Y126.85 I-4.07 J.423 E.01554
G1 X124.766 Y126.501 E.01074
G1 X124.445 Y126.324 E.00885
G1 X123.945 Y126.258 E.01217
G1 X123.764 Y126.098 E.00583
G1 X123.685 Y125.577 E.01271
G1 X123.498 Y125.233 E.00943
G1 X123.15 Y124.957 E.01072
G1 X122.659 Y124.84 E.01217
G1 X121.32 Y124.84 E.03229
G2 X120.852 Y124.951 I.168 J1.746 E.01164
G1 X120.502 Y125.233 E.01083
G1 X120.324 Y125.555 E.00887
G1 X120.258 Y126.055 E.01217
G1 X120.098 Y126.236 E.00583
G1 X119.577 Y126.315 E.01271
G1 X119.233 Y126.502 E.00943
G1 X118.956 Y126.851 E.01074
G1 X118.843 Y127.317 E.01157
G1 X118.84 Y128.68 E.03289
G2 X118.951 Y129.148 I1.746 J-.168 E.01164
G1 X119.233 Y129.498 E.01083
G1 X119.555 Y129.676 E.00887
G1 X120.056 Y129.742 E.01217
G1 X120.236 Y129.902 E.00583
G1 X120.315 Y130.423 E.01271
G1 X120.502 Y130.767 E.00943
G1 X120.851 Y131.044 E.01074
G1 X121.317 Y131.157 E.01157
G1 X122.68 Y131.16 E.03289
G2 X123.148 Y131.049 I-.168 J-1.746 E.01164
G1 X123.498 Y130.767 E.01083
G1 X123.676 Y130.445 E.00887
G1 X123.742 Y129.944 E.01217
G1 X123.902 Y129.764 E.00583
G1 X124.311 Y129.713 E.00992
G1 X124.742 Y129.517 E.01143
G1 X125.032 Y129.178 E.01077
G1 X125.154 Y128.741 E.01093
G2 X125.16 Y127.543 I-82.907 J-.995 E.0289
M204 S10000
G1 X124.774 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.688 Y127.023 E.01129
G1 X124.512 Y126.802 E.00681
G1 X124.324 Y126.698 E.00518
G1 X123.812 Y126.62 E.0125
G1 X123.558 Y126.442 E.00747
G1 X123.38 Y126.188 E.00747
G1 X123.254 Y125.592 E.01471
G2 X122.977 Y125.312 I-.825 J.54 E.00955
G1 X122.517 Y125.226 E.01129
G1 X121.336 Y125.226 E.02847
G1 X121.039 Y125.296 E.00737
G1 X120.803 Y125.486 E.00731
G1 X120.698 Y125.676 E.00524
G1 X120.62 Y126.188 E.0125
G1 X120.442 Y126.442 E.00747
G1 X120.189 Y126.62 E.00746
G1 X119.694 Y126.691 E.01206
G1 X119.486 Y126.803 E.00569
G1 X119.311 Y127.024 E.0068
G1 X119.228 Y127.459 E.01066
G1 X119.226 Y128.664 E.02908
G1 X119.296 Y128.961 E.00735
G1 X119.486 Y129.197 E.00731
G1 X119.676 Y129.302 E.00523
G1 X120.189 Y129.38 E.01251
G1 X120.442 Y129.558 E.00746
G1 X120.62 Y129.811 E.00746
G1 X120.691 Y130.306 E.01206
G1 X120.803 Y130.514 E.00569
G1 X121.024 Y130.689 E.0068
G1 X121.459 Y130.772 E.01066
G1 X122.664 Y130.774 E.02908
G1 X122.961 Y130.704 E.00735
G1 X123.197 Y130.514 E.00731
G1 X123.302 Y130.324 E.00523
G1 X123.38 Y129.811 E.01251
G1 X123.558 Y129.558 E.00746
G1 X123.812 Y129.38 E.00747
G1 X124.343 Y129.275 E.01306
G1 X124.505 Y129.201 E.00429
G1 X124.693 Y128.981 E.007
G1 X124.774 Y128.634 E.00858
G1 X124.774 Y127.543 E.02632
M204 S10000
G1 X124.389 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.333 Y127.196 E.00706
G1 X124.203 Y127.071 E.00432
G1 X123.678 Y126.982 E.01284
G1 X123.329 Y126.759 E.00999
G3 X123.018 Y126.322 I.684 J-.817 E.01309
G1 X122.934 Y125.811 E.01248
G1 X122.804 Y125.667 E.00467
G1 X122.429 Y125.611 E.00915
G1 X121.353 Y125.611 E.02596
G1 X121.175 Y125.681 E.00459
G1 X121.071 Y125.797 E.00375
G1 X120.982 Y126.322 E.01284
G1 X120.759 Y126.671 E.00999
G3 X120.323 Y126.982 I-.817 J-.685 E.01306
G1 X119.811 Y127.066 E.0125
G1 X119.666 Y127.198 E.00473
G1 X119.614 Y127.567 E.009
G1 X119.611 Y128.648 E.02608
G1 X119.681 Y128.825 E.00457
G1 X119.797 Y128.929 E.00375
G1 X120.323 Y129.018 E.01286
G1 X120.671 Y129.241 E.00997
G3 X120.982 Y129.678 I-.684 J.817 E.01306
G1 X121.066 Y130.189 E.0125
G1 X121.198 Y130.334 E.00473
G1 X121.567 Y130.386 E.00899
G1 X122.648 Y130.389 E.02608
G1 X122.825 Y130.319 E.00457
G1 X122.929 Y130.203 E.00375
G1 X123.018 Y129.678 E.01286
G1 X123.241 Y129.329 E.00997
G3 X123.678 Y129.018 I.817 J.684 E.01308
G1 X124.183 Y128.924 E.01239
G1 X124.354 Y128.784 E.00533
G1 X124.388 Y128.506 E.00676
G1 X124.389 Y127.543 E.02322
M204 S10000
G1 X124.003 Y127.483 F42000
G1 F9600
M204 S4000
G1 X123.993 Y127.435 E.00119
G1 X123.545 Y127.344 E.01102
G1 X123.249 Y127.191 E.00803
G3 X122.656 Y126.455 I1.016 J-1.425 E.02309
G1 X122.53 Y125.998 E.01142
G2 X121.436 Y125.997 I-.812 J191.795 E.02638
G1 X121.344 Y126.455 E.01126
G1 X121.191 Y126.751 E.00803
G3 X120.456 Y127.343 I-1.426 J-1.016 E.02306
G1 X120 Y127.46 E.01136
G1 X119.997 Y128.564 E.02663
G1 X120.456 Y128.657 E.01129
G1 X120.751 Y128.809 E.00801
G3 X121.344 Y129.544 I-1.017 J1.425 E.02305
G1 X121.46 Y130 E.01136
G1 X122.564 Y130.003 E.02663
G1 X122.657 Y129.544 E.01129
G1 X122.809 Y129.249 E.00801
G3 X123.545 Y128.656 I1.425 J1.016 E.02308
G1 X124.003 Y128.571 E.01122
G1 X124.003 Y127.543 E.02481
M204 S10000
G1 X123.617 Y127.755 F42000
G1 F9600
M204 S4000
G1 X123.412 Y127.706 E.00509
G1 X123.032 Y127.51 E.01033
G3 X122.294 Y126.588 I1.265 J-1.768 E.02883
G1 X122.246 Y126.383 E.00508
G1 X121.755 Y126.383 E.01183
G1 X121.706 Y126.588 E.00509
G1 X121.51 Y126.968 E.01033
G3 X120.589 Y127.705 I-1.768 J-1.265 E.02879
G1 X120.385 Y127.753 E.00507
G1 X120.384 Y128.245 E.01186
G1 X120.589 Y128.295 E.00511
G1 X120.969 Y128.491 E.0103
G3 X121.705 Y129.411 I-1.266 J1.768 E.02877
G1 X121.753 Y129.615 E.00507
G1 X122.245 Y129.616 E.01186
G1 X122.295 Y129.411 E.00511
G1 X122.491 Y129.031 E.0103
G3 X123.412 Y128.294 I1.768 J1.266 E.02881
G1 X123.617 Y128.252 E.00505
G1 X123.617 Y127.815 E.01052
M204 S10000
G1 X123.147 Y128 F42000
G1 F9600
M204 S4000
G1 X122.814 Y127.828 E.00905
G3 X122.172 Y127.186 I1.628 J-2.27 E.02198
G1 X122 Y126.853 E.00905
G1 X121.828 Y127.186 E.00905
G3 X121.187 Y127.828 I-2.27 J-1.628 E.02197
G1 X120.853 Y128 E.00906
G1 X121.187 Y128.172 E.00906
G3 X121.828 Y128.813 I-1.63 J2.271 E.02195
G1 X122 Y129.147 E.00906
G1 X122.173 Y128.813 E.00906
G3 X122.814 Y128.172 I2.27 J1.629 E.02196
G1 X123.094 Y128.028 E.00761
M204 S10000
G1 X122.356 Y128 F42000
; LINE_WIDTH: 0.502216
G1 F9600
M204 S4000
G1 X122 Y127.644 E.01472
G1 X121.644 Y128 E.01472
G1 X122 Y128.356 E.01472
G1 X122.313 Y128.042 E.01296
; WIPE_START
G1 X122 Y128.356 E-.17248
G1 X121.644 Y128 E-.19582
G1 X122 Y127.644 E-.19584
G1 X122.356 Y128 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.959 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.296 E.04321
G2 X124.074 Y125.467 I-.605 J1.604 E.04198
G1 X124.071 Y125.455 E.00033
G2 X122.694 Y124.439 I-1.472 J.555 E.04701
G2 X121.027 Y124.469 I-.704 J7.294 E.04343
G2 X119.875 Y125.875 I.331 J1.446 E.05085
G2 X119.483 Y125.922 I-.062 J1.122 E.01031
G2 X118.38 Y125.265 I-1.433 J1.15 E.0341
G1 X118.38 Y126.928 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.265 E-.63181
G1 X118.695 Y125.384 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 9/38
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.72 I-.063 J1.215 P1  F42000
G1 X130.026 Y125.974 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.88 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 9 start: 66,77,88
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.88
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


; object ids of this layer9 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.961 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.299 E.04321
G3 X131.324 Y119.676 I-.565 J2.786 E.02658
G2 X131.899 Y119.899 I.415 J-.218 E.01748
G3 X133.051 Y118.469 I1.486 J.018 E.05146
G3 X134.669 Y118.439 I.938 J7.032 E.04214
G3 X136.089 Y119.639 I-.012 J1.453 E.0524
G3 X137.62 Y119.319 I1.102 J1.448 E.04204
G1 X137.62 Y120.982 E.04321
M204 S10000
G1 X137.16 Y121.509 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.042 Y120.873 I-4.07 J.426 E.01563
G1 X136.762 Y120.523 E.0108
G1 X136.439 Y120.347 E.00888
G1 X135.926 Y120.285 E.01245
G1 X135.738 Y120.12 E.00602
G1 X135.662 Y119.583 E.01307
G1 X135.476 Y119.238 E.00945
G1 X135.127 Y118.958 E.01078
G1 X134.634 Y118.84 E.01224
G1 X133.345 Y118.84 E.03108
G2 X132.874 Y118.953 I.171 J1.753 E.01172
G1 X132.523 Y119.238 E.01089
G1 X132.347 Y119.562 E.0089
G1 X132.284 Y120.074 E.01245
G1 X132.12 Y120.262 E.00602
G1 X131.583 Y120.338 E.01307
G1 X131.238 Y120.524 E.00945
G1 X130.958 Y120.873 E.01079
G1 X130.843 Y121.342 E.01164
G1 X130.84 Y122.655 E.03168
G2 X130.953 Y123.126 I1.752 J-.171 E.01172
G1 X131.238 Y123.477 E.01089
G1 X131.561 Y123.653 E.0089
G1 X132.074 Y123.716 E.01246
G1 X132.262 Y123.88 E.00602
G1 X132.338 Y124.417 E.01307
G1 X132.524 Y124.762 E.00945
G1 X132.873 Y125.042 E.01079
G1 X133.342 Y125.157 E.01164
G1 X134.655 Y125.16 E.03168
G2 X135.126 Y125.047 I-.171 J-1.752 E.01172
G1 X135.477 Y124.762 E.01089
G1 X135.653 Y124.439 E.0089
G1 X135.716 Y123.926 E.01246
G1 X135.88 Y123.738 E.00602
G1 X136.306 Y123.689 E.01033
G1 X136.737 Y123.496 E.01141
G1 X137.031 Y123.156 E.01082
G1 X137.154 Y122.716 E.01101
G2 X137.16 Y121.569 I-76.532 J-.955 E.02766
M204 S10000
G1 X136.774 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.687 Y121.046 E.01136
G1 X136.509 Y120.825 E.00685
G1 X136.32 Y120.721 E.00519
G1 X135.803 Y120.65 E.01259
G1 X135.534 Y120.466 E.00787
G1 X135.35 Y120.197 E.00787
G1 X135.285 Y119.698 E.01213
G1 X135.174 Y119.489 E.0057
G1 X134.954 Y119.313 E.0068
G1 X134.491 Y119.226 E.01136
G1 X133.361 Y119.226 E.02724
G1 X133.062 Y119.297 E.00742
G1 X132.826 Y119.489 E.00734
G1 X132.721 Y119.68 E.00525
G1 X132.65 Y120.197 E.01258
G1 X132.466 Y120.466 E.00787
G1 X132.197 Y120.65 E.00786
G1 X131.698 Y120.715 E.01214
G1 X131.489 Y120.826 E.0057
G1 X131.312 Y121.048 E.00684
G1 X131.228 Y121.484 E.01073
G1 X131.226 Y122.64 E.02786
G1 X131.297 Y122.938 E.0074
G1 X131.489 Y123.174 E.00734
G1 X131.68 Y123.279 E.00525
G1 X132.197 Y123.35 E.0126
G1 X132.466 Y123.534 E.00786
G1 X132.65 Y123.803 E.00786
G1 X132.715 Y124.302 E.01214
G1 X132.826 Y124.511 E.0057
G1 X133.048 Y124.688 E.00684
G1 X133.484 Y124.772 E.01073
G1 X134.639 Y124.774 E.02786
G1 X134.938 Y124.703 E.0074
G1 X135.174 Y124.511 E.00734
G1 X135.279 Y124.32 E.00525
G1 X135.35 Y123.803 E.0126
G1 X135.534 Y123.534 E.00786
G1 X135.803 Y123.35 E.00787
G1 X136.34 Y123.251 E.01316
G1 X136.501 Y123.179 E.00427
G1 X136.692 Y122.958 E.00704
G1 X136.774 Y122.609 E.00863
G1 X136.774 Y121.569 E.02509
M204 S10000
G1 X136.389 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.332 Y121.22 E.0071
G1 X136.202 Y121.096 E.00433
G1 X135.681 Y121.016 E.01272
G1 X135.452 Y120.904 E.00615
G1 X135.096 Y120.548 E.01212
G1 X134.984 Y120.319 E.00615
G1 X134.909 Y119.813 E.01235
G1 X134.78 Y119.668 E.00467
G1 X134.389 Y119.611 E.00952
G1 X133.377 Y119.611 E.0244
G1 X133.2 Y119.682 E.00461
G1 X133.096 Y119.798 E.00376
G1 X133.016 Y120.319 E.01272
G1 X132.904 Y120.548 E.00615
G1 X132.548 Y120.903 E.01211
G1 X132.32 Y121.016 E.00613
G1 X131.812 Y121.091 E.01238
G1 X131.666 Y121.222 E.00474
G1 X131.614 Y121.607 E.00937
G1 X131.611 Y122.624 E.02452
G1 X131.682 Y122.8 E.00459
G1 X131.798 Y122.904 E.00376
G1 X132.32 Y122.985 E.01274
G1 X132.695 Y123.217 E.01062
G3 X133.015 Y123.68 I-.677 J.812 E.01375
G1 X133.091 Y124.188 E.01238
G1 X133.222 Y124.334 E.00474
G1 X133.607 Y124.386 E.00937
G1 X134.624 Y124.389 E.02452
G1 X134.8 Y124.318 E.00459
G1 X134.904 Y124.202 E.00376
G1 X134.984 Y123.68 E.01274
M73 P51 R8
G1 X135.217 Y123.305 E.01062
G3 X135.681 Y122.984 I.812 J.677 E.01378
G1 X136.182 Y122.899 E.01226
G1 X136.353 Y122.76 E.00533
G1 X136.388 Y122.463 E.00722
G1 X136.389 Y121.569 E.02155
M204 S10000
G1 X136.003 Y121.509 F42000
G1 F9600
M204 S4000
G1 X135.993 Y121.461 E.00118
G1 X135.558 Y121.381 E.01067
G1 X135.238 Y121.224 E.0086
G3 X134.619 Y120.442 I.992 J-1.421 E.0244
G1 X134.503 Y119.998 E.01105
G2 X133.462 Y119.997 I-.773 J172.511 E.02512
G1 X133.381 Y120.442 E.0109
G1 X133.224 Y120.762 E.00861
G3 X132.443 Y121.381 I-1.422 J-.992 E.02437
G1 X132 Y121.486 E.01099
G1 X131.997 Y122.538 E.02537
G1 X132.443 Y122.619 E.01093
G1 X132.763 Y122.776 E.00859
G3 X133.381 Y123.557 I-.993 J1.421 E.02436
G1 X133.486 Y124 E.01099
G1 X134.538 Y124.003 E.02537
G1 X134.619 Y123.557 E.01093
G1 X134.776 Y123.237 E.00859
G3 X135.558 Y122.619 I1.421 J.993 E.02439
G1 X136.003 Y122.546 E.01087
G1 X136.003 Y121.569 E.02357
M204 S10000
G1 X135.617 Y121.787 F42000
G1 F9600
M204 S4000
G1 X135.435 Y121.747 E.0045
G1 X135.023 Y121.545 E.01106
G3 X134.253 Y120.565 I1.238 J-1.766 E.03051
G1 X134.214 Y120.383 E.00449
G1 X133.787 Y120.383 E.01028
G1 X133.747 Y120.565 E.00449
G1 X133.545 Y120.976 E.01106
G3 X132.566 Y121.747 I-1.766 J-1.238 E.03047
G1 X132.385 Y121.786 E.00448
G1 X132.384 Y122.213 E.0103
G1 X132.566 Y122.253 E.00451
G1 X132.977 Y122.455 E.01104
G3 X133.747 Y123.434 I-1.239 J1.766 E.03045
G1 X133.786 Y123.615 E.00448
G1 X134.213 Y123.616 E.0103
G1 X134.253 Y123.434 E.00451
G1 X134.455 Y123.023 E.01104
G3 X135.435 Y122.253 I1.766 J1.239 E.03049
G1 X135.617 Y122.219 E.00446
G1 X135.617 Y121.847 E.00895
M204 S10000
G1 X135.083 Y122 F42000
G1 F9600
M204 S4000
G1 X134.809 Y121.866 E.00735
G1 X134.398 Y121.513 E.01306
G1 X134.134 Y121.191 E.01005
G1 X134 Y120.917 E.00735
G1 X133.866 Y121.191 E.00735
G1 X133.513 Y121.602 E.01307
G1 X133.191 Y121.865 E.01003
G1 X132.917 Y122 E.00736
G1 X133.191 Y122.135 E.00736
G1 X133.602 Y122.487 E.01305
G1 X133.865 Y122.809 E.01003
G1 X134 Y123.083 E.00736
G1 X134.135 Y122.809 E.00736
G1 X134.487 Y122.398 E.01305
G1 X134.809 Y122.134 E.01004
G1 X135.029 Y122.026 E.0059
M204 S10000
G1 X134.33 Y122 F42000
; LINE_WIDTH: 0.467846
G1 F9600
M204 S4000
G1 X134 Y121.67 E.01267
G1 X133.67 Y122 E.01266
G1 X134 Y122.33 E.01266
G1 X134.288 Y122.042 E.01104
; OBJECT_ID: 66
; WIPE_START
G1 X134 Y122.33 E-.17109
G1 X133.67 Y122 E-.19629
G1 X134 Y121.67 E-.1963
G1 X134.33 Y122 E-.19632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.485 Y128.95 Z1.88 F42000
G1 X137.974 Y130.026 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.982 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.319 E.04321
G2 X136.067 Y131.658 I-.43 J1.761 E.04279
G1 X136.065 Y131.646 E.0003
G2 X134.644 Y130.439 I-1.434 J.249 E.0526
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.882 Y131.914 I.45 J1.588 E.05182
G3 X131.324 Y131.676 I-.113 J-.508 E.01684
G2 X130.38 Y131.299 I-1.51 J2.409 E.02658
G1 X130.38 Y132.961 E.04321
; WIPE_START
G1 X130.38 Y131.299 E-.63181
G1 X130.705 Y131.387 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.16 Y133.536 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.04 Y132.895 I-4.034 J.421 E.01576
G1 X136.758 Y132.545 E.01083
G1 X136.409 Y132.361 E.00951
G1 X135.867 Y132.283 E.01321
G1 X135.694 Y132.085 E.00635
G1 X135.639 Y131.591 E.01199
G1 X135.455 Y131.242 E.00951
G1 X135.105 Y130.96 E.01083
G1 X134.608 Y130.84 E.01233
G1 X133.37 Y130.84 E.02987
G2 X132.896 Y130.954 I.174 J1.76 E.01179
G1 X132.546 Y131.241 E.01092
G1 X132.361 Y131.591 E.00952
G1 X132.283 Y132.133 E.01321
G1 X132.085 Y132.306 E.00635
G1 X131.591 Y132.361 E.01199
G1 X131.242 Y132.545 E.00951
G1 X130.959 Y132.895 E.01085
G1 X130.843 Y133.367 E.01171
G1 X130.84 Y134.63 E.03048
G2 X130.954 Y135.104 I1.76 J-.174 E.01179
G1 X131.241 Y135.454 E.01092
G1 X131.591 Y135.639 E.00952
G1 X132.133 Y135.717 E.01322
G1 X132.306 Y135.915 E.00634
G1 X132.361 Y136.409 E.01199
G1 X132.545 Y136.758 E.00951
G1 X132.895 Y137.041 E.01085
G1 X133.367 Y137.157 E.01171
G1 X134.63 Y137.16 E.03048
G2 X135.104 Y137.046 I-.174 J-1.76 E.01179
G1 X135.454 Y136.758 E.01092
G1 X135.639 Y136.409 E.00952
G1 X135.717 Y135.867 E.01322
G1 X135.915 Y135.694 E.00635
G1 X136.297 Y135.666 E.00924
G1 X136.733 Y135.474 E.01148
G1 X137.029 Y135.134 E.01088
G1 X137.154 Y134.691 E.01109
G2 X137.16 Y133.596 I-70.217 J-.916 E.02641
M204 S10000
G1 X136.774 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.686 Y133.069 E.01146
G1 X136.508 Y132.849 E.00683
G1 X136.295 Y132.737 E.00579
G1 X135.8 Y132.674 E.01204
G3 X135.302 Y132.087 I.295 J-.754 E.01935
G1 X135.263 Y131.705 E.00926
G1 X135.151 Y131.492 E.0058
G1 X134.931 Y131.314 E.00683
G1 X134.464 Y131.226 E.01146
G1 X133.386 Y131.226 E.02599
G1 X133.085 Y131.298 E.00747
G1 X132.85 Y131.49 E.00733
G1 X132.737 Y131.705 E.00584
G1 X132.674 Y132.2 E.01204
G3 X132.087 Y132.698 I-.754 J-.295 E.01935
G1 X131.705 Y132.737 E.00926
G1 X131.492 Y132.849 E.0058
G1 X131.313 Y133.071 E.00687
G1 X131.228 Y133.511 E.01081
G1 X131.226 Y134.614 E.02661
G1 X131.298 Y134.915 E.00745
G1 X131.49 Y135.15 E.00733
G1 X131.705 Y135.263 E.00584
G1 X132.201 Y135.326 E.01205
G3 X132.698 Y135.913 I-.296 J.754 E.01933
G1 X132.737 Y136.295 E.00926
G1 X132.849 Y136.508 E.0058
G1 X133.071 Y136.687 E.00687
G1 X133.511 Y136.772 E.01081
G1 X134.614 Y136.774 E.02661
G1 X134.915 Y136.702 E.00745
G1 X135.15 Y136.51 E.00733
G1 X135.263 Y136.295 E.00584
G1 X135.326 Y135.799 E.01205
G3 X135.94 Y135.3 I.747 J.291 E.01995
G1 X136.206 Y135.285 E.00642
G1 X136.498 Y135.156 E.00772
G1 X136.691 Y134.935 E.00707
G1 X136.774 Y134.618 E.00789
G1 X136.774 Y133.596 E.02465
M204 S10000
G1 X136.389 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.331 Y133.244 E.00717
G1 X136.181 Y133.113 E.0048
G1 X135.685 Y133.042 E.0121
G1 X135.444 Y132.928 E.00643
G3 X134.958 Y132.315 I.741 J-1.086 E.01915
G1 X134.887 Y131.819 E.01209
G1 X134.756 Y131.669 E.00481
G1 X134.348 Y131.611 E.00993
G1 X133.403 Y131.611 E.0228
G2 X133.113 Y131.819 I.04 J.362 E.00898
G1 X133.042 Y132.315 E.01209
G1 X132.928 Y132.556 E.00644
G3 X132.316 Y133.042 I-1.087 J-.741 E.01913
G1 X131.819 Y133.113 E.01211
G1 X131.667 Y133.246 E.00487
G1 X131.614 Y133.648 E.00977
G1 X131.611 Y134.599 E.02292
G1 X131.676 Y134.768 E.00438
G1 X131.819 Y134.887 E.00448
G1 X132.316 Y134.958 E.01212
G1 X132.557 Y135.072 E.00642
G3 X133.042 Y135.684 I-.741 J1.086 E.01912
G1 X133.113 Y136.181 E.01211
G1 X133.246 Y136.333 E.00487
G1 X133.648 Y136.386 E.00977
G1 X134.599 Y136.389 E.02292
G1 X134.768 Y136.324 E.00438
G1 X134.887 Y136.181 E.00448
G1 X134.958 Y135.684 E.01212
G1 X135.072 Y135.443 E.00642
G3 X135.685 Y134.958 I1.086 J.741 E.01914
G1 X136.199 Y134.866 E.0126
G1 X136.353 Y134.736 E.00486
G1 X136.388 Y134.417 E.00774
G1 X136.389 Y133.596 E.01979
M204 S10000
G1 X136.003 Y133.536 F42000
G1 F9600
M204 S4000
G1 X135.992 Y133.481 E.00135
G1 X135.57 Y133.41 E.01032
G1 X135.232 Y133.25 E.00901
G3 X134.59 Y132.43 I.984 J-1.432 E.02551
G1 X134.519 Y132.008 E.01031
G2 X133.482 Y131.997 I-.778 J23.246 E.025
G1 X133.41 Y132.43 E.01059
G1 X133.251 Y132.768 E.00901
G3 X132.432 Y133.41 I-1.433 J-.984 E.02548
G1 X132 Y133.513 E.01071
G1 X131.997 Y134.518 E.02424
G1 X132.432 Y134.59 E.01062
G1 X132.768 Y134.75 E.00899
G3 X133.41 Y135.568 I-.985 J1.432 E.02547
G1 X133.513 Y136 E.01071
G1 X134.518 Y136.003 E.02424
G1 X134.59 Y135.568 E.01062
G1 X134.75 Y135.232 E.00899
G3 X135.57 Y134.59 I1.432 J.985 E.0255
G1 X136.003 Y134.524 E.01057
G1 X136.003 Y133.596 E.02239
M204 S10000
G1 X135.617 Y133.812 F42000
G1 F9600
M204 S4000
G1 X135.454 Y133.778 E.00401
G1 X135.02 Y133.573 E.01158
G1 X134.651 Y133.254 E.01176
G1 X134.427 Y132.98 E.00854
G1 X134.222 Y132.545 E.01158
G1 X134.188 Y132.383 E.00401
G1 X133.812 Y132.383 E.00907
G1 X133.778 Y132.545 E.00401
G1 X133.573 Y132.98 E.01158
G1 X133.254 Y133.349 E.01177
G1 X132.98 Y133.573 E.00853
G1 X132.547 Y133.778 E.01156
G1 X132.385 Y133.811 E.004
G1 X132.384 Y134.188 E.00909
G1 X132.547 Y134.222 E.00403
G1 X132.98 Y134.427 E.01156
G1 X133.349 Y134.746 E.01175
G1 X133.573 Y135.02 E.00853
G1 X133.778 Y135.453 E.01156
G1 X133.811 Y135.615 E.004
G1 X134.188 Y135.616 E.00909
G1 X134.222 Y135.453 E.00403
G1 X134.427 Y135.02 E.01156
G1 X134.746 Y134.651 E.01175
G1 X135.02 Y134.427 E.00854
G1 X135.454 Y134.222 E.01158
G1 X135.617 Y134.192 E.00399
G1 X135.617 Y133.872 E.00772
M204 S10000
G1 X135.03 Y134 F42000
G1 F9600
M204 S4000
G1 X134.809 Y133.895 E.0059
G1 X134.378 Y133.527 E.01366
G1 X134.105 Y133.191 E.01044
G1 X134 Y132.97 E.0059
G1 X133.895 Y133.191 E.0059
G1 X133.527 Y133.622 E.01366
G1 X133.192 Y133.895 E.01042
G1 X132.97 Y134 E.00592
G1 X133.192 Y134.105 E.00592
G1 X133.622 Y134.473 E.01364
G1 X133.895 Y134.808 E.01042
G1 X134 Y135.03 E.00592
G1 X134.105 Y134.808 E.00592
G1 X134.473 Y134.378 E.01364
G1 X134.809 Y134.105 E.01044
G1 X134.976 Y134.026 E.00446
M204 S10000
G1 X134.311 Y134 F42000
; LINE_WIDTH: 0.443166
G1 F9600
M204 S4000
G1 X134 Y133.689 E.01126
G1 X133.689 Y134 E.01125
G1 X134 Y134.311 E.01125
G1 X134.269 Y134.042 E.00972
; OBJECT_ID: 88
; WIPE_START
G1 X134 Y134.311 E-.16989
G1 X133.689 Y134 E-.19669
G1 X134 Y133.689 E-.1967
G1 X134.311 Y134 E-.19671
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.895 Y132.198 Z1.88 F42000
G1 X125.974 Y131.974 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.16 Y127.483 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F9600
M204 S4000
G2 X125.043 Y126.85 I-4.07 J.423 E.01554
G1 X124.766 Y126.501 E.01074
G1 X124.445 Y126.324 E.00885
G1 X123.945 Y126.258 E.01217
G1 X123.764 Y126.098 E.00583
G1 X123.685 Y125.577 E.01271
G1 X123.498 Y125.233 E.00943
G1 X123.15 Y124.957 E.01072
G1 X122.659 Y124.84 E.01217
G1 X121.32 Y124.84 E.03229
G2 X120.852 Y124.951 I.168 J1.746 E.01164
G1 X120.502 Y125.233 E.01083
G1 X120.324 Y125.555 E.00887
G1 X120.258 Y126.055 E.01217
G1 X120.098 Y126.236 E.00583
G1 X119.577 Y126.315 E.01271
G1 X119.233 Y126.502 E.00943
G1 X118.956 Y126.851 E.01074
G1 X118.843 Y127.317 E.01157
G1 X118.84 Y128.68 E.03289
G2 X118.951 Y129.148 I1.746 J-.168 E.01164
G1 X119.233 Y129.498 E.01083
G1 X119.555 Y129.676 E.00887
G1 X120.056 Y129.742 E.01217
G1 X120.236 Y129.902 E.00583
G1 X120.315 Y130.423 E.01271
G1 X120.502 Y130.767 E.00943
G1 X120.851 Y131.044 E.01074
G1 X121.317 Y131.157 E.01157
G1 X122.68 Y131.16 E.03289
G2 X123.148 Y131.049 I-.168 J-1.746 E.01164
G1 X123.498 Y130.767 E.01083
G1 X123.676 Y130.445 E.00887
G1 X123.742 Y129.944 E.01217
G1 X123.902 Y129.764 E.00583
G1 X124.311 Y129.713 E.00992
G1 X124.742 Y129.517 E.01143
G1 X125.032 Y129.178 E.01077
G1 X125.154 Y128.741 E.01093
G2 X125.16 Y127.543 I-82.907 J-.995 E.0289
M204 S10000
G1 X124.774 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.688 Y127.023 E.01129
G1 X124.512 Y126.802 E.00681
G1 X124.324 Y126.698 E.00518
G1 X123.812 Y126.62 E.0125
G1 X123.558 Y126.442 E.00747
G1 X123.38 Y126.188 E.00747
G1 X123.254 Y125.592 E.01471
G2 X122.977 Y125.312 I-.825 J.54 E.00955
G1 X122.517 Y125.226 E.01129
G1 X121.336 Y125.226 E.02847
G1 X121.039 Y125.296 E.00737
G1 X120.803 Y125.486 E.00731
G1 X120.698 Y125.676 E.00524
G1 X120.62 Y126.188 E.0125
G1 X120.442 Y126.442 E.00747
G1 X120.189 Y126.62 E.00746
G1 X119.694 Y126.691 E.01206
G1 X119.486 Y126.803 E.00569
G1 X119.311 Y127.024 E.0068
G1 X119.228 Y127.459 E.01066
G1 X119.226 Y128.664 E.02908
G1 X119.296 Y128.961 E.00735
G1 X119.486 Y129.197 E.00731
G1 X119.676 Y129.302 E.00523
G1 X120.189 Y129.38 E.01251
G1 X120.442 Y129.558 E.00746
G1 X120.62 Y129.811 E.00746
G1 X120.691 Y130.306 E.01206
G1 X120.803 Y130.514 E.00569
G1 X121.024 Y130.689 E.0068
G1 X121.459 Y130.772 E.01066
G1 X122.664 Y130.774 E.02908
G1 X122.961 Y130.704 E.00735
G1 X123.197 Y130.514 E.00731
G1 X123.302 Y130.324 E.00523
G1 X123.38 Y129.811 E.01251
G1 X123.558 Y129.558 E.00746
G1 X123.812 Y129.38 E.00747
G1 X124.343 Y129.275 E.01306
G1 X124.505 Y129.201 E.00429
G1 X124.693 Y128.981 E.007
G1 X124.774 Y128.634 E.00858
G1 X124.774 Y127.543 E.02632
M204 S10000
G1 X124.389 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.333 Y127.196 E.00706
G1 X124.203 Y127.071 E.00432
G1 X123.678 Y126.982 E.01284
G1 X123.329 Y126.759 E.00999
G3 X123.018 Y126.322 I.684 J-.817 E.01309
G1 X122.934 Y125.811 E.01248
G1 X122.804 Y125.667 E.00467
G1 X122.429 Y125.611 E.00915
G1 X121.353 Y125.611 E.02596
G1 X121.175 Y125.681 E.00459
G1 X121.071 Y125.797 E.00375
G1 X120.982 Y126.322 E.01284
G1 X120.759 Y126.671 E.00999
G3 X120.323 Y126.982 I-.817 J-.685 E.01306
G1 X119.811 Y127.066 E.0125
G1 X119.666 Y127.198 E.00473
G1 X119.614 Y127.567 E.009
G1 X119.611 Y128.648 E.02608
G1 X119.681 Y128.825 E.00457
G1 X119.797 Y128.929 E.00375
G1 X120.323 Y129.018 E.01286
G1 X120.671 Y129.241 E.00997
G3 X120.982 Y129.678 I-.684 J.817 E.01306
G1 X121.066 Y130.189 E.0125
G1 X121.198 Y130.334 E.00473
G1 X121.567 Y130.386 E.00899
G1 X122.648 Y130.389 E.02608
G1 X122.825 Y130.319 E.00457
G1 X122.929 Y130.203 E.00375
G1 X123.018 Y129.678 E.01286
G1 X123.241 Y129.329 E.00997
G3 X123.678 Y129.018 I.817 J.684 E.01308
G1 X124.183 Y128.924 E.01239
G1 X124.354 Y128.784 E.00533
G1 X124.388 Y128.506 E.00676
G1 X124.389 Y127.543 E.02322
M204 S10000
G1 X124.003 Y127.483 F42000
G1 F9600
M204 S4000
G1 X123.993 Y127.435 E.00119
G1 X123.545 Y127.344 E.01102
G1 X123.249 Y127.191 E.00803
G3 X122.656 Y126.455 I1.016 J-1.425 E.02309
G1 X122.53 Y125.998 E.01142
G2 X121.436 Y125.997 I-.812 J191.795 E.02638
G1 X121.344 Y126.455 E.01126
G1 X121.191 Y126.751 E.00803
G3 X120.456 Y127.343 I-1.426 J-1.016 E.02306
G1 X120 Y127.46 E.01136
G1 X119.997 Y128.564 E.02663
G1 X120.456 Y128.657 E.01129
G1 X120.751 Y128.809 E.00801
G3 X121.344 Y129.544 I-1.017 J1.425 E.02305
G1 X121.46 Y130 E.01136
G1 X122.564 Y130.003 E.02663
G1 X122.657 Y129.544 E.01129
G1 X122.809 Y129.249 E.00801
G3 X123.545 Y128.656 I1.425 J1.016 E.02308
G1 X124.003 Y128.571 E.01122
G1 X124.003 Y127.543 E.02481
M204 S10000
G1 X123.617 Y127.755 F42000
G1 F9600
M204 S4000
G1 X123.412 Y127.706 E.00509
G1 X123.032 Y127.51 E.01033
G3 X122.294 Y126.588 I1.265 J-1.768 E.02883
G1 X122.246 Y126.383 E.00508
G1 X121.755 Y126.383 E.01183
G1 X121.706 Y126.588 E.00509
G1 X121.51 Y126.968 E.01033
G3 X120.589 Y127.705 I-1.768 J-1.265 E.02879
G1 X120.385 Y127.753 E.00507
G1 X120.384 Y128.245 E.01186
G1 X120.589 Y128.295 E.00511
G1 X120.969 Y128.491 E.0103
G3 X121.705 Y129.411 I-1.266 J1.768 E.02877
G1 X121.753 Y129.615 E.00507
G1 X122.245 Y129.616 E.01186
G1 X122.295 Y129.411 E.00511
G1 X122.491 Y129.031 E.0103
G3 X123.412 Y128.294 I1.768 J1.266 E.02881
G1 X123.617 Y128.252 E.00505
G1 X123.617 Y127.815 E.01052
M204 S10000
G1 X123.147 Y128 F42000
G1 F9600
M204 S4000
G1 X122.814 Y127.828 E.00905
G3 X122.172 Y127.186 I1.628 J-2.27 E.02198
G1 X122 Y126.853 E.00905
G1 X121.828 Y127.186 E.00905
G3 X121.187 Y127.828 I-2.27 J-1.628 E.02197
G1 X120.853 Y128 E.00906
G1 X121.187 Y128.172 E.00906
G3 X121.828 Y128.813 I-1.63 J2.271 E.02195
G1 X122 Y129.147 E.00906
G1 X122.173 Y128.813 E.00906
G3 X122.814 Y128.172 I2.27 J1.629 E.02196
G1 X123.094 Y128.028 E.00761
M204 S10000
G1 X122.356 Y128 F42000
; LINE_WIDTH: 0.502216
G1 F9600
M204 S4000
G1 X122 Y127.644 E.01472
G1 X121.644 Y128 E.01472
G1 X122 Y128.356 E.01472
G1 X122.313 Y128.042 E.01296
; WIPE_START
G1 X122 Y128.356 E-.17248
G1 X121.644 Y128 E-.19582
G1 X122 Y127.644 E-.19584
G1 X122.356 Y128 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.982 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.319 E.04321
G2 X124.111 Y125.62 I-.431 J1.778 E.0413
G2 X122.694 Y124.439 I-1.429 J.274 E.05191
G2 X121.027 Y124.469 I-.704 J7.294 E.04343
G2 X119.875 Y125.875 I.331 J1.446 E.05085
G3 X119.324 Y125.676 I-.159 J-.423 E.01655
G2 X118.38 Y125.299 I-1.51 J2.409 E.02658
G1 X118.38 Y126.961 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.299 E-.63181
G1 X118.705 Y125.387 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 10/38
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.88 I-.063 J1.215 P1  F42000
G1 X130.026 Y125.974 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 10 start: 66,77,88
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P52 R8
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


; object ids of this layer10 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.983 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.32 E.04321
G3 X131.746 Y119.906 I-.124 J2.177 E.03944
G1 X131.899 Y119.899 E.00396
G3 X133.051 Y118.469 I1.486 J.018 E.05146
G3 X134.669 Y118.439 I.938 J7.032 E.04214
G3 X136.096 Y119.792 I-.068 J1.501 E.05572
G3 X137.62 Y119.33 I1.29 J1.51 E.04259
G1 X137.62 Y120.992 E.04321
M204 S10000
G1 X137.16 Y121.509 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.042 Y120.873 I-4.07 J.426 E.01563
G1 X136.762 Y120.523 E.0108
G1 X136.439 Y120.347 E.00888
G1 X135.926 Y120.285 E.01245
G1 X135.738 Y120.12 E.00602
G1 X135.662 Y119.583 E.01307
G1 X135.476 Y119.238 E.00945
G1 X135.127 Y118.958 E.01078
G1 X134.634 Y118.84 E.01224
G1 X133.345 Y118.84 E.03108
G2 X132.874 Y118.953 I.171 J1.753 E.01172
G1 X132.523 Y119.238 E.01089
G1 X132.347 Y119.562 E.0089
G1 X132.284 Y120.074 E.01245
G1 X132.12 Y120.262 E.00602
G1 X131.583 Y120.338 E.01307
G1 X131.238 Y120.524 E.00945
G1 X130.958 Y120.873 E.01079
G1 X130.843 Y121.342 E.01164
G1 X130.84 Y122.655 E.03168
G2 X130.953 Y123.126 I1.752 J-.171 E.01172
G1 X131.238 Y123.477 E.01089
G1 X131.561 Y123.653 E.0089
G1 X132.074 Y123.716 E.01246
G1 X132.262 Y123.88 E.00602
G1 X132.338 Y124.417 E.01307
G1 X132.524 Y124.762 E.00945
G1 X132.873 Y125.042 E.01079
G1 X133.342 Y125.157 E.01164
G1 X134.655 Y125.16 E.03168
G2 X135.126 Y125.047 I-.171 J-1.752 E.01172
G1 X135.477 Y124.762 E.01089
G1 X135.653 Y124.439 E.0089
G1 X135.716 Y123.926 E.01246
G1 X135.88 Y123.738 E.00602
G1 X136.306 Y123.689 E.01033
G1 X136.737 Y123.496 E.01141
G1 X137.031 Y123.156 E.01082
G1 X137.154 Y122.716 E.01101
G2 X137.16 Y121.569 I-76.532 J-.955 E.02766
M204 S10000
G1 X136.774 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.687 Y121.046 E.01136
G1 X136.509 Y120.825 E.00685
G1 X136.32 Y120.721 E.00519
G1 X135.803 Y120.65 E.01259
G1 X135.534 Y120.466 E.00787
G1 X135.35 Y120.197 E.00787
G1 X135.285 Y119.698 E.01213
G1 X135.174 Y119.489 E.0057
G1 X134.954 Y119.313 E.0068
G1 X134.491 Y119.226 E.01136
G1 X133.361 Y119.226 E.02724
G1 X133.062 Y119.297 E.00742
G1 X132.826 Y119.489 E.00734
G1 X132.721 Y119.68 E.00525
G1 X132.65 Y120.197 E.01258
G1 X132.466 Y120.466 E.00787
G1 X132.197 Y120.65 E.00786
G1 X131.698 Y120.715 E.01214
G1 X131.489 Y120.826 E.0057
G1 X131.312 Y121.048 E.00684
G1 X131.228 Y121.484 E.01073
G1 X131.226 Y122.64 E.02786
G1 X131.297 Y122.938 E.0074
G1 X131.489 Y123.174 E.00734
G1 X131.68 Y123.279 E.00525
G1 X132.197 Y123.35 E.0126
G1 X132.466 Y123.534 E.00786
G1 X132.65 Y123.803 E.00786
G1 X132.715 Y124.302 E.01214
G1 X132.826 Y124.511 E.0057
G1 X133.048 Y124.688 E.00684
G1 X133.484 Y124.772 E.01073
G1 X134.639 Y124.774 E.02786
G1 X134.938 Y124.703 E.0074
G1 X135.174 Y124.511 E.00734
G1 X135.279 Y124.32 E.00525
G1 X135.35 Y123.803 E.0126
G1 X135.534 Y123.534 E.00786
G1 X135.803 Y123.35 E.00787
G1 X136.34 Y123.251 E.01316
G1 X136.501 Y123.179 E.00427
G1 X136.692 Y122.958 E.00704
G1 X136.774 Y122.609 E.00863
G1 X136.774 Y121.569 E.02509
M204 S10000
G1 X136.389 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.332 Y121.22 E.0071
G1 X136.202 Y121.096 E.00433
G1 X135.681 Y121.016 E.01272
G1 X135.452 Y120.904 E.00615
G1 X135.096 Y120.548 E.01212
G1 X134.984 Y120.319 E.00615
G1 X134.909 Y119.813 E.01235
G1 X134.78 Y119.668 E.00467
G1 X134.389 Y119.611 E.00952
G1 X133.377 Y119.611 E.0244
G1 X133.2 Y119.682 E.00461
G1 X133.096 Y119.798 E.00376
G1 X133.016 Y120.319 E.01272
G1 X132.904 Y120.548 E.00615
G1 X132.548 Y120.903 E.01211
G1 X132.32 Y121.016 E.00613
G1 X131.812 Y121.091 E.01238
G1 X131.666 Y121.222 E.00474
G1 X131.614 Y121.607 E.00937
G1 X131.611 Y122.624 E.02452
G1 X131.682 Y122.8 E.00459
G1 X131.798 Y122.904 E.00376
G1 X132.32 Y122.985 E.01274
G1 X132.695 Y123.217 E.01062
G3 X133.015 Y123.68 I-.677 J.812 E.01375
G1 X133.091 Y124.188 E.01238
G1 X133.222 Y124.334 E.00474
G1 X133.607 Y124.386 E.00937
G1 X134.624 Y124.389 E.02452
G1 X134.8 Y124.318 E.00459
G1 X134.904 Y124.202 E.00376
G1 X134.984 Y123.68 E.01274
G1 X135.217 Y123.305 E.01062
G3 X135.681 Y122.984 I.812 J.677 E.01378
G1 X136.182 Y122.899 E.01226
G1 X136.353 Y122.76 E.00533
G1 X136.388 Y122.463 E.00722
G1 X136.389 Y121.569 E.02155
M204 S10000
G1 X136.003 Y121.509 F42000
G1 F9600
M204 S4000
G1 X135.993 Y121.461 E.00118
G1 X135.558 Y121.381 E.01067
G1 X135.238 Y121.224 E.0086
G3 X134.619 Y120.442 I.992 J-1.421 E.0244
G1 X134.503 Y119.998 E.01105
G2 X133.462 Y119.997 I-.773 J172.511 E.02512
G1 X133.381 Y120.442 E.0109
G1 X133.224 Y120.762 E.00861
G3 X132.443 Y121.381 I-1.422 J-.992 E.02437
G1 X132 Y121.486 E.01099
G1 X131.997 Y122.538 E.02537
G1 X132.443 Y122.619 E.01093
G1 X132.763 Y122.776 E.00859
G3 X133.381 Y123.557 I-.993 J1.421 E.02436
G1 X133.486 Y124 E.01099
G1 X134.538 Y124.003 E.02537
G1 X134.619 Y123.557 E.01093
G1 X134.776 Y123.237 E.00859
G3 X135.558 Y122.619 I1.421 J.993 E.02439
G1 X136.003 Y122.546 E.01087
G1 X136.003 Y121.569 E.02357
M204 S10000
G1 X135.617 Y121.787 F42000
G1 F9600
M204 S4000
G1 X135.435 Y121.747 E.0045
G1 X135.023 Y121.545 E.01106
G3 X134.253 Y120.565 I1.238 J-1.766 E.03051
G1 X134.214 Y120.383 E.00449
G1 X133.787 Y120.383 E.01028
G1 X133.747 Y120.565 E.00449
G1 X133.545 Y120.976 E.01106
G3 X132.566 Y121.747 I-1.766 J-1.238 E.03047
G1 X132.385 Y121.786 E.00448
G1 X132.384 Y122.213 E.0103
G1 X132.566 Y122.253 E.00451
G1 X132.977 Y122.455 E.01104
G3 X133.747 Y123.434 I-1.239 J1.766 E.03045
G1 X133.786 Y123.615 E.00448
G1 X134.213 Y123.616 E.0103
G1 X134.253 Y123.434 E.00451
G1 X134.455 Y123.023 E.01104
G3 X135.435 Y122.253 I1.766 J1.239 E.03049
G1 X135.617 Y122.219 E.00446
G1 X135.617 Y121.847 E.00895
M204 S10000
G1 X135.083 Y122 F42000
G1 F9600
M204 S4000
G1 X134.809 Y121.866 E.00735
G1 X134.398 Y121.513 E.01306
G1 X134.134 Y121.191 E.01005
G1 X134 Y120.917 E.00735
G1 X133.866 Y121.191 E.00735
G1 X133.513 Y121.602 E.01307
G1 X133.191 Y121.865 E.01003
G1 X132.917 Y122 E.00736
G1 X133.191 Y122.135 E.00736
G1 X133.602 Y122.487 E.01305
G1 X133.865 Y122.809 E.01003
G1 X134 Y123.083 E.00736
G1 X134.135 Y122.809 E.00736
G1 X134.487 Y122.398 E.01305
G1 X134.809 Y122.134 E.01004
G1 X135.029 Y122.026 E.0059
M204 S10000
G1 X134.33 Y122 F42000
; LINE_WIDTH: 0.467846
G1 F9600
M204 S4000
G1 X134 Y121.67 E.01267
G1 X133.67 Y122 E.01266
G1 X134 Y122.33 E.01266
G1 X134.288 Y122.042 E.01104
; OBJECT_ID: 66
; WIPE_START
G1 X134 Y122.33 E-.17109
G1 X133.67 Y122 E-.19629
G1 X134 Y121.67 E-.1963
G1 X134.33 Y122 E-.19632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.485 Y128.95 Z2.04 F42000
G1 X137.974 Y130.026 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.992 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.33 E.04321
G2 X136.08 Y131.807 I-.234 J1.97 E.04317
G2 X134.644 Y130.439 I-1.518 J.156 E.0561
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.882 Y131.914 I.45 J1.588 E.05182
G1 X131.77 Y131.923 E.00292
G2 X130.38 Y131.32 I-1.526 J1.616 E.0402
G1 X130.38 Y132.983 E.04321
; WIPE_START
G1 X130.38 Y131.32 E-.63181
G1 X130.712 Y131.377 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.16 Y133.536 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.04 Y132.895 I-4.034 J.421 E.01576
G1 X136.758 Y132.545 E.01083
G1 X136.409 Y132.361 E.00951
G1 X135.867 Y132.283 E.01321
G1 X135.694 Y132.085 E.00635
G1 X135.639 Y131.591 E.01199
G1 X135.455 Y131.242 E.00951
G1 X135.105 Y130.96 E.01083
G1 X134.608 Y130.84 E.01233
G1 X133.37 Y130.84 E.02987
G2 X132.896 Y130.954 I.174 J1.76 E.01179
G1 X132.546 Y131.241 E.01092
G1 X132.361 Y131.591 E.00952
G1 X132.283 Y132.133 E.01321
G1 X132.085 Y132.306 E.00635
G1 X131.591 Y132.361 E.01199
G1 X131.242 Y132.545 E.00951
G1 X130.959 Y132.895 E.01085
G1 X130.843 Y133.367 E.01171
G1 X130.84 Y134.63 E.03048
G2 X130.954 Y135.104 I1.76 J-.174 E.01179
G1 X131.241 Y135.454 E.01092
G1 X131.591 Y135.639 E.00952
G1 X132.133 Y135.717 E.01322
G1 X132.306 Y135.915 E.00634
G1 X132.361 Y136.409 E.01199
G1 X132.545 Y136.758 E.00951
G1 X132.895 Y137.041 E.01085
G1 X133.367 Y137.157 E.01171
G1 X134.63 Y137.16 E.03048
G2 X135.104 Y137.046 I-.174 J-1.76 E.01179
G1 X135.454 Y136.758 E.01092
G1 X135.639 Y136.409 E.00952
G1 X135.717 Y135.867 E.01322
G1 X135.915 Y135.694 E.00635
G1 X136.297 Y135.666 E.00924
G1 X136.733 Y135.474 E.01148
G1 X137.029 Y135.134 E.01088
G1 X137.154 Y134.691 E.01109
G2 X137.16 Y133.596 I-70.217 J-.916 E.02641
M204 S10000
G1 X136.774 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.686 Y133.069 E.01146
G1 X136.508 Y132.849 E.00683
G1 X136.295 Y132.737 E.00579
G1 X135.8 Y132.674 E.01204
G3 X135.302 Y132.087 I.295 J-.754 E.01935
G1 X135.263 Y131.705 E.00926
G1 X135.151 Y131.492 E.0058
G1 X134.931 Y131.314 E.00683
G1 X134.464 Y131.226 E.01146
G1 X133.386 Y131.226 E.02599
G1 X133.085 Y131.298 E.00747
G1 X132.85 Y131.49 E.00733
G1 X132.737 Y131.705 E.00584
G1 X132.674 Y132.2 E.01204
G3 X132.087 Y132.698 I-.754 J-.295 E.01935
G1 X131.705 Y132.737 E.00926
G1 X131.492 Y132.849 E.0058
G1 X131.313 Y133.071 E.00687
G1 X131.228 Y133.511 E.01081
G1 X131.226 Y134.614 E.02661
G1 X131.298 Y134.915 E.00745
G1 X131.49 Y135.15 E.00733
G1 X131.705 Y135.263 E.00584
G1 X132.201 Y135.326 E.01205
G3 X132.698 Y135.913 I-.296 J.754 E.01933
G1 X132.737 Y136.295 E.00926
G1 X132.849 Y136.508 E.0058
G1 X133.071 Y136.687 E.00687
G1 X133.511 Y136.772 E.01081
G1 X134.614 Y136.774 E.02661
G1 X134.915 Y136.702 E.00745
G1 X135.15 Y136.51 E.00733
G1 X135.263 Y136.295 E.00584
G1 X135.326 Y135.799 E.01205
G3 X135.94 Y135.3 I.747 J.291 E.01995
G1 X136.206 Y135.285 E.00642
G1 X136.498 Y135.156 E.00772
G1 X136.691 Y134.935 E.00707
G1 X136.774 Y134.618 E.00789
G1 X136.774 Y133.596 E.02465
M204 S10000
G1 X136.389 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.331 Y133.244 E.00717
G1 X136.181 Y133.113 E.0048
G1 X135.685 Y133.042 E.0121
G1 X135.444 Y132.928 E.00643
G3 X134.958 Y132.315 I.741 J-1.086 E.01915
G1 X134.887 Y131.819 E.01209
G1 X134.756 Y131.669 E.00481
G1 X134.348 Y131.611 E.00993
G1 X133.403 Y131.611 E.0228
G2 X133.113 Y131.819 I.04 J.362 E.00898
G1 X133.042 Y132.315 E.01209
G1 X132.928 Y132.556 E.00644
G3 X132.316 Y133.042 I-1.087 J-.741 E.01913
G1 X131.819 Y133.113 E.01211
G1 X131.667 Y133.246 E.00487
G1 X131.614 Y133.648 E.00977
G1 X131.611 Y134.599 E.02292
G1 X131.676 Y134.768 E.00438
G1 X131.819 Y134.887 E.00448
G1 X132.316 Y134.958 E.01212
G1 X132.557 Y135.072 E.00642
G3 X133.042 Y135.684 I-.741 J1.086 E.01912
G1 X133.113 Y136.181 E.01211
G1 X133.246 Y136.333 E.00487
G1 X133.648 Y136.386 E.00977
G1 X134.599 Y136.389 E.02292
G1 X134.768 Y136.324 E.00438
G1 X134.887 Y136.181 E.00448
G1 X134.958 Y135.684 E.01212
G1 X135.072 Y135.443 E.00642
G3 X135.685 Y134.958 I1.086 J.741 E.01914
G1 X136.199 Y134.866 E.0126
G1 X136.353 Y134.736 E.00486
G1 X136.388 Y134.417 E.00774
G1 X136.389 Y133.596 E.01979
M204 S10000
G1 X136.003 Y133.536 F42000
G1 F9600
M204 S4000
G1 X135.992 Y133.481 E.00135
G1 X135.57 Y133.41 E.01032
G1 X135.232 Y133.25 E.00901
G3 X134.59 Y132.43 I.984 J-1.432 E.02551
G1 X134.519 Y132.008 E.01031
G2 X133.482 Y131.997 I-.778 J23.246 E.025
G1 X133.41 Y132.43 E.01059
G1 X133.251 Y132.768 E.00901
G3 X132.432 Y133.41 I-1.433 J-.984 E.02548
G1 X132 Y133.513 E.01071
G1 X131.997 Y134.518 E.02424
G1 X132.432 Y134.59 E.01062
G1 X132.768 Y134.75 E.00899
G3 X133.41 Y135.568 I-.985 J1.432 E.02547
G1 X133.513 Y136 E.01071
G1 X134.518 Y136.003 E.02424
G1 X134.59 Y135.568 E.01062
G1 X134.75 Y135.232 E.00899
G3 X135.57 Y134.59 I1.432 J.985 E.0255
G1 X136.003 Y134.524 E.01057
G1 X136.003 Y133.596 E.02239
M204 S10000
G1 X135.617 Y133.812 F42000
G1 F9600
M204 S4000
G1 X135.454 Y133.778 E.00401
G1 X135.02 Y133.573 E.01158
G1 X134.651 Y133.254 E.01176
G1 X134.427 Y132.98 E.00854
G1 X134.222 Y132.545 E.01158
G1 X134.188 Y132.383 E.00401
G1 X133.812 Y132.383 E.00907
G1 X133.778 Y132.545 E.00401
G1 X133.573 Y132.98 E.01158
G1 X133.254 Y133.349 E.01177
G1 X132.98 Y133.573 E.00853
G1 X132.547 Y133.778 E.01156
G1 X132.385 Y133.811 E.004
G1 X132.384 Y134.188 E.00909
G1 X132.547 Y134.222 E.00403
G1 X132.98 Y134.427 E.01156
G1 X133.349 Y134.746 E.01175
G1 X133.573 Y135.02 E.00853
G1 X133.778 Y135.453 E.01156
G1 X133.811 Y135.615 E.004
G1 X134.188 Y135.616 E.00909
G1 X134.222 Y135.453 E.00403
G1 X134.427 Y135.02 E.01156
G1 X134.746 Y134.651 E.01175
G1 X135.02 Y134.427 E.00854
M73 P53 R8
G1 X135.454 Y134.222 E.01158
G1 X135.617 Y134.192 E.00399
G1 X135.617 Y133.872 E.00772
M204 S10000
G1 X135.03 Y134 F42000
G1 F9600
M204 S4000
G1 X134.809 Y133.895 E.0059
G1 X134.378 Y133.527 E.01366
G1 X134.105 Y133.191 E.01044
G1 X134 Y132.97 E.0059
G1 X133.895 Y133.191 E.0059
G1 X133.527 Y133.622 E.01366
G1 X133.192 Y133.895 E.01042
G1 X132.97 Y134 E.00592
G1 X133.192 Y134.105 E.00592
G1 X133.622 Y134.473 E.01364
G1 X133.895 Y134.808 E.01042
G1 X134 Y135.03 E.00592
G1 X134.105 Y134.808 E.00592
G1 X134.473 Y134.378 E.01364
G1 X134.809 Y134.105 E.01044
G1 X134.976 Y134.026 E.00446
M204 S10000
G1 X134.311 Y134 F42000
; LINE_WIDTH: 0.443166
G1 F9600
M204 S4000
G1 X134 Y133.689 E.01126
G1 X133.689 Y134 E.01125
G1 X134 Y134.311 E.01125
G1 X134.269 Y134.042 E.00972
; OBJECT_ID: 88
; WIPE_START
G1 X134 Y134.311 E-.16989
G1 X133.689 Y134 E-.19669
G1 X134 Y133.689 E-.1967
G1 X134.311 Y134 E-.19671
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.895 Y132.198 Z2.04 F42000
G1 X125.974 Y131.974 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.16 Y127.483 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F9600
M204 S4000
G2 X125.043 Y126.85 I-4.07 J.423 E.01554
G1 X124.766 Y126.501 E.01074
G1 X124.445 Y126.324 E.00885
G1 X123.945 Y126.258 E.01217
G1 X123.764 Y126.098 E.00583
G1 X123.685 Y125.577 E.01271
G1 X123.498 Y125.233 E.00943
G1 X123.15 Y124.957 E.01072
G1 X122.659 Y124.84 E.01217
G1 X121.32 Y124.84 E.03229
G2 X120.852 Y124.951 I.168 J1.746 E.01164
G1 X120.502 Y125.233 E.01083
G1 X120.324 Y125.555 E.00887
G1 X120.258 Y126.055 E.01217
G1 X120.098 Y126.236 E.00583
G1 X119.577 Y126.315 E.01271
G1 X119.233 Y126.502 E.00943
G1 X118.956 Y126.851 E.01074
G1 X118.843 Y127.317 E.01157
G1 X118.84 Y128.68 E.03289
G2 X118.951 Y129.148 I1.746 J-.168 E.01164
G1 X119.233 Y129.498 E.01083
G1 X119.555 Y129.676 E.00887
G1 X120.056 Y129.742 E.01217
G1 X120.236 Y129.902 E.00583
G1 X120.315 Y130.423 E.01271
G1 X120.502 Y130.767 E.00943
G1 X120.851 Y131.044 E.01074
G1 X121.317 Y131.157 E.01157
G1 X122.68 Y131.16 E.03289
G2 X123.148 Y131.049 I-.168 J-1.746 E.01164
G1 X123.498 Y130.767 E.01083
G1 X123.676 Y130.445 E.00887
G1 X123.742 Y129.944 E.01217
G1 X123.902 Y129.764 E.00583
G1 X124.311 Y129.713 E.00992
G1 X124.742 Y129.517 E.01143
G1 X125.032 Y129.178 E.01077
G1 X125.154 Y128.741 E.01093
G2 X125.16 Y127.543 I-82.907 J-.995 E.0289
M204 S10000
G1 X124.774 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.688 Y127.023 E.01129
G1 X124.512 Y126.802 E.00681
G1 X124.324 Y126.698 E.00518
G1 X123.812 Y126.62 E.0125
G1 X123.558 Y126.442 E.00747
G1 X123.38 Y126.188 E.00747
G1 X123.254 Y125.592 E.01471
G2 X122.977 Y125.312 I-.825 J.54 E.00955
G1 X122.517 Y125.226 E.01129
G1 X121.336 Y125.226 E.02847
G1 X121.039 Y125.296 E.00737
G1 X120.803 Y125.486 E.00731
G1 X120.698 Y125.676 E.00524
G1 X120.62 Y126.188 E.0125
G1 X120.442 Y126.442 E.00747
G1 X120.189 Y126.62 E.00746
G1 X119.694 Y126.691 E.01206
G1 X119.486 Y126.803 E.00569
G1 X119.311 Y127.024 E.0068
G1 X119.228 Y127.459 E.01066
G1 X119.226 Y128.664 E.02908
G1 X119.296 Y128.961 E.00735
G1 X119.486 Y129.197 E.00731
G1 X119.676 Y129.302 E.00523
G1 X120.189 Y129.38 E.01251
G1 X120.442 Y129.558 E.00746
M73 P53 R7
G1 X120.62 Y129.811 E.00746
G1 X120.691 Y130.306 E.01206
G1 X120.803 Y130.514 E.00569
G1 X121.024 Y130.689 E.0068
G1 X121.459 Y130.772 E.01066
G1 X122.664 Y130.774 E.02908
G1 X122.961 Y130.704 E.00735
G1 X123.197 Y130.514 E.00731
G1 X123.302 Y130.324 E.00523
G1 X123.38 Y129.811 E.01251
G1 X123.558 Y129.558 E.00746
G1 X123.812 Y129.38 E.00747
G1 X124.343 Y129.275 E.01306
G1 X124.505 Y129.201 E.00429
G1 X124.693 Y128.981 E.007
G1 X124.774 Y128.634 E.00858
G1 X124.774 Y127.543 E.02632
M204 S10000
G1 X124.389 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.333 Y127.196 E.00706
G1 X124.203 Y127.071 E.00432
G1 X123.678 Y126.982 E.01284
G1 X123.329 Y126.759 E.00999
G3 X123.018 Y126.322 I.684 J-.817 E.01309
G1 X122.934 Y125.811 E.01248
G1 X122.804 Y125.667 E.00467
G1 X122.429 Y125.611 E.00915
G1 X121.353 Y125.611 E.02596
G1 X121.175 Y125.681 E.00459
G1 X121.071 Y125.797 E.00375
G1 X120.982 Y126.322 E.01284
G1 X120.759 Y126.671 E.00999
G3 X120.323 Y126.982 I-.817 J-.685 E.01306
G1 X119.811 Y127.066 E.0125
G1 X119.666 Y127.198 E.00473
G1 X119.614 Y127.567 E.009
G1 X119.611 Y128.648 E.02608
G1 X119.681 Y128.825 E.00457
G1 X119.797 Y128.929 E.00375
G1 X120.323 Y129.018 E.01286
G1 X120.671 Y129.241 E.00997
G3 X120.982 Y129.678 I-.684 J.817 E.01306
G1 X121.066 Y130.189 E.0125
G1 X121.198 Y130.334 E.00473
G1 X121.567 Y130.386 E.00899
G1 X122.648 Y130.389 E.02608
G1 X122.825 Y130.319 E.00457
G1 X122.929 Y130.203 E.00375
G1 X123.018 Y129.678 E.01286
G1 X123.241 Y129.329 E.00997
G3 X123.678 Y129.018 I.817 J.684 E.01308
G1 X124.183 Y128.924 E.01239
G1 X124.354 Y128.784 E.00533
G1 X124.388 Y128.506 E.00676
G1 X124.389 Y127.543 E.02322
M204 S10000
G1 X124.003 Y127.483 F42000
G1 F9600
M204 S4000
G1 X123.993 Y127.435 E.00119
G1 X123.545 Y127.344 E.01102
G1 X123.249 Y127.191 E.00803
G3 X122.656 Y126.455 I1.016 J-1.425 E.02309
G1 X122.53 Y125.998 E.01142
G2 X121.436 Y125.997 I-.812 J191.795 E.02638
G1 X121.344 Y126.455 E.01126
G1 X121.191 Y126.751 E.00803
G3 X120.456 Y127.343 I-1.426 J-1.016 E.02306
G1 X120 Y127.46 E.01136
G1 X119.997 Y128.564 E.02663
G1 X120.456 Y128.657 E.01129
G1 X120.751 Y128.809 E.00801
G3 X121.344 Y129.544 I-1.017 J1.425 E.02305
G1 X121.46 Y130 E.01136
G1 X122.564 Y130.003 E.02663
G1 X122.657 Y129.544 E.01129
G1 X122.809 Y129.249 E.00801
G3 X123.545 Y128.656 I1.425 J1.016 E.02308
G1 X124.003 Y128.571 E.01122
G1 X124.003 Y127.543 E.02481
M204 S10000
G1 X123.617 Y127.755 F42000
G1 F9600
M204 S4000
G1 X123.412 Y127.706 E.00509
G1 X123.032 Y127.51 E.01033
G3 X122.294 Y126.588 I1.265 J-1.768 E.02883
G1 X122.246 Y126.383 E.00508
G1 X121.755 Y126.383 E.01183
G1 X121.706 Y126.588 E.00509
G1 X121.51 Y126.968 E.01033
G3 X120.589 Y127.705 I-1.768 J-1.265 E.02879
G1 X120.385 Y127.753 E.00507
G1 X120.384 Y128.245 E.01186
G1 X120.589 Y128.295 E.00511
G1 X120.969 Y128.491 E.0103
G3 X121.705 Y129.411 I-1.266 J1.768 E.02877
G1 X121.753 Y129.615 E.00507
G1 X122.245 Y129.616 E.01186
G1 X122.295 Y129.411 E.00511
G1 X122.491 Y129.031 E.0103
G3 X123.412 Y128.294 I1.768 J1.266 E.02881
G1 X123.617 Y128.252 E.00505
G1 X123.617 Y127.815 E.01052
M204 S10000
G1 X123.147 Y128 F42000
G1 F9600
M204 S4000
G1 X122.814 Y127.828 E.00905
G3 X122.172 Y127.186 I1.628 J-2.27 E.02198
G1 X122 Y126.853 E.00905
G1 X121.828 Y127.186 E.00905
G3 X121.187 Y127.828 I-2.27 J-1.628 E.02197
G1 X120.853 Y128 E.00906
G1 X121.187 Y128.172 E.00906
G3 X121.828 Y128.813 I-1.63 J2.271 E.02195
G1 X122 Y129.147 E.00906
G1 X122.173 Y128.813 E.00906
G3 X122.814 Y128.172 I2.27 J1.629 E.02196
G1 X123.094 Y128.028 E.00761
M204 S10000
G1 X122.356 Y128 F42000
; LINE_WIDTH: 0.502216
G1 F9600
M204 S4000
G1 X122 Y127.644 E.01472
G1 X121.644 Y128 E.01472
G1 X122 Y128.356 E.01472
G1 X122.313 Y128.042 E.01296
; WIPE_START
G1 X122 Y128.356 E-.17248
G1 X121.644 Y128 E-.19582
G1 X122 Y127.644 E-.19584
G1 X122.356 Y128 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.992 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.33 E.04321
G2 X124.12 Y125.771 I-.233 J1.978 E.04176
G2 X122.694 Y124.439 I-1.496 J.172 E.05517
G2 X121.027 Y124.469 I-.704 J7.294 E.04343
G2 X119.875 Y125.875 I.331 J1.446 E.05085
G1 X119.715 Y125.882 E.00416
G2 X118.38 Y125.32 I-1.443 J1.56 E.03843
G1 X118.38 Y126.983 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.32 E-.63181
G1 X118.712 Y125.377 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 11/38
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.04 I-.064 J1.215 P1  F42000
G1 X130.026 Y125.974 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 11 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer11 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.993 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.33 E.04321
G3 X131.891 Y119.899 I.051 J2.155 E.04303
G3 X133.051 Y118.469 I1.522 J.05 E.0514
G3 X134.669 Y118.439 I.938 J7.032 E.04214
G3 X136.101 Y119.899 I-.065 J1.496 E.0585
G3 X137.62 Y119.329 I1.461 J1.585 E.04324
G1 X137.62 Y120.991 E.04321
M204 S10000
G1 X137.16 Y121.509 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.042 Y120.873 I-4.07 J.426 E.01563
G1 X136.762 Y120.523 E.0108
G1 X136.439 Y120.347 E.00888
G1 X135.926 Y120.285 E.01245
G1 X135.738 Y120.12 E.00602
G1 X135.662 Y119.583 E.01307
G1 X135.476 Y119.238 E.00945
G1 X135.127 Y118.958 E.01078
G1 X134.634 Y118.84 E.01224
G1 X133.345 Y118.84 E.03108
G2 X132.874 Y118.953 I.171 J1.753 E.01172
G1 X132.523 Y119.238 E.01089
G1 X132.347 Y119.562 E.0089
G1 X132.284 Y120.074 E.01245
G1 X132.12 Y120.262 E.00602
G1 X131.583 Y120.338 E.01307
G1 X131.238 Y120.524 E.00945
G1 X130.958 Y120.873 E.01079
G1 X130.843 Y121.342 E.01164
G1 X130.84 Y122.655 E.03168
G2 X130.953 Y123.126 I1.752 J-.171 E.01172
G1 X131.238 Y123.477 E.01089
G1 X131.561 Y123.653 E.0089
G1 X132.074 Y123.716 E.01246
G1 X132.262 Y123.88 E.00602
G1 X132.338 Y124.417 E.01307
G1 X132.524 Y124.762 E.00945
G1 X132.873 Y125.042 E.01079
G1 X133.342 Y125.157 E.01164
G1 X134.655 Y125.16 E.03168
G2 X135.126 Y125.047 I-.171 J-1.752 E.01172
G1 X135.477 Y124.762 E.01089
G1 X135.653 Y124.439 E.0089
G1 X135.716 Y123.926 E.01246
G1 X135.88 Y123.738 E.00602
G1 X136.306 Y123.689 E.01033
G1 X136.737 Y123.496 E.01141
G1 X137.031 Y123.156 E.01082
G1 X137.154 Y122.716 E.01101
G2 X137.16 Y121.569 I-76.532 J-.955 E.02766
M204 S10000
G1 X136.774 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.687 Y121.046 E.01136
G1 X136.509 Y120.825 E.00685
G1 X136.32 Y120.721 E.00519
G1 X135.803 Y120.65 E.01259
G1 X135.534 Y120.466 E.00787
G1 X135.35 Y120.197 E.00787
G1 X135.285 Y119.698 E.01213
G1 X135.174 Y119.489 E.0057
G1 X134.954 Y119.313 E.0068
G1 X134.491 Y119.226 E.01136
G1 X133.361 Y119.226 E.02724
G1 X133.062 Y119.297 E.00742
G1 X132.826 Y119.489 E.00734
G1 X132.721 Y119.68 E.00525
G1 X132.65 Y120.197 E.01258
G1 X132.466 Y120.466 E.00787
G1 X132.197 Y120.65 E.00786
G1 X131.698 Y120.715 E.01214
G1 X131.489 Y120.826 E.0057
G1 X131.312 Y121.048 E.00684
G1 X131.228 Y121.484 E.01073
G1 X131.226 Y122.64 E.02786
G1 X131.297 Y122.938 E.0074
G1 X131.489 Y123.174 E.00734
G1 X131.68 Y123.279 E.00525
G1 X132.197 Y123.35 E.0126
G1 X132.466 Y123.534 E.00786
G1 X132.65 Y123.803 E.00786
G1 X132.715 Y124.302 E.01214
G1 X132.826 Y124.511 E.0057
G1 X133.048 Y124.688 E.00684
G1 X133.484 Y124.772 E.01073
G1 X134.639 Y124.774 E.02786
G1 X134.938 Y124.703 E.0074
G1 X135.174 Y124.511 E.00734
G1 X135.279 Y124.32 E.00525
G1 X135.35 Y123.803 E.0126
G1 X135.534 Y123.534 E.00786
G1 X135.803 Y123.35 E.00787
G1 X136.34 Y123.251 E.01316
G1 X136.501 Y123.179 E.00427
G1 X136.692 Y122.958 E.00704
G1 X136.774 Y122.609 E.00863
G1 X136.774 Y121.569 E.02509
M204 S10000
G1 X136.389 Y121.509 F42000
G1 F9600
M204 S4000
G1 X136.332 Y121.22 E.0071
G1 X136.202 Y121.096 E.00433
G1 X135.681 Y121.016 E.01272
G1 X135.452 Y120.904 E.00615
G1 X135.096 Y120.548 E.01212
G1 X134.984 Y120.319 E.00615
G1 X134.909 Y119.813 E.01235
G1 X134.78 Y119.668 E.00467
M73 P54 R7
G1 X134.389 Y119.611 E.00952
G1 X133.377 Y119.611 E.0244
G1 X133.2 Y119.682 E.00461
G1 X133.096 Y119.798 E.00376
G1 X133.016 Y120.319 E.01272
G1 X132.904 Y120.548 E.00615
G1 X132.548 Y120.903 E.01211
G1 X132.32 Y121.016 E.00613
G1 X131.812 Y121.091 E.01238
G1 X131.666 Y121.222 E.00474
G1 X131.614 Y121.607 E.00937
G1 X131.611 Y122.624 E.02452
G1 X131.682 Y122.8 E.00459
G1 X131.798 Y122.904 E.00376
G1 X132.32 Y122.985 E.01274
G1 X132.695 Y123.217 E.01062
G3 X133.015 Y123.68 I-.677 J.812 E.01375
G1 X133.091 Y124.188 E.01238
G1 X133.222 Y124.334 E.00474
G1 X133.607 Y124.386 E.00937
G1 X134.624 Y124.389 E.02452
G1 X134.8 Y124.318 E.00459
G1 X134.904 Y124.202 E.00376
G1 X134.984 Y123.68 E.01274
G1 X135.217 Y123.305 E.01062
G3 X135.681 Y122.984 I.812 J.677 E.01378
G1 X136.182 Y122.899 E.01226
G1 X136.353 Y122.76 E.00533
G1 X136.388 Y122.463 E.00722
G1 X136.389 Y121.569 E.02155
M204 S10000
G1 X136.003 Y121.509 F42000
G1 F9600
M204 S4000
G1 X135.993 Y121.461 E.00118
G1 X135.558 Y121.381 E.01067
G1 X135.238 Y121.224 E.0086
G3 X134.619 Y120.442 I.992 J-1.421 E.0244
G1 X134.503 Y119.998 E.01105
G2 X133.462 Y119.997 I-.773 J172.511 E.02512
G1 X133.381 Y120.442 E.0109
G1 X133.224 Y120.762 E.00861
G3 X132.443 Y121.381 I-1.422 J-.992 E.02437
G1 X132 Y121.486 E.01099
G1 X131.997 Y122.538 E.02537
G1 X132.443 Y122.619 E.01093
G1 X132.763 Y122.776 E.00859
G3 X133.381 Y123.557 I-.993 J1.421 E.02436
G1 X133.486 Y124 E.01099
G1 X134.538 Y124.003 E.02537
G1 X134.619 Y123.557 E.01093
G1 X134.776 Y123.237 E.00859
G3 X135.558 Y122.619 I1.421 J.993 E.02439
G1 X136.003 Y122.546 E.01087
G1 X136.003 Y121.569 E.02357
M204 S10000
G1 X135.617 Y121.787 F42000
G1 F9600
M204 S4000
G1 X135.435 Y121.747 E.0045
G1 X135.023 Y121.545 E.01106
G3 X134.253 Y120.565 I1.238 J-1.766 E.03051
G1 X134.214 Y120.383 E.00449
G1 X133.787 Y120.383 E.01028
G1 X133.747 Y120.565 E.00449
G1 X133.545 Y120.976 E.01106
G3 X132.566 Y121.747 I-1.766 J-1.238 E.03047
G1 X132.385 Y121.786 E.00448
G1 X132.384 Y122.213 E.0103
G1 X132.566 Y122.253 E.00451
G1 X132.977 Y122.455 E.01104
G3 X133.747 Y123.434 I-1.239 J1.766 E.03045
G1 X133.786 Y123.615 E.00448
G1 X134.213 Y123.616 E.0103
G1 X134.253 Y123.434 E.00451
G1 X134.455 Y123.023 E.01104
G3 X135.435 Y122.253 I1.766 J1.239 E.03049
G1 X135.617 Y122.219 E.00446
G1 X135.617 Y121.847 E.00895
M204 S10000
G1 X135.083 Y122 F42000
G1 F9600
M204 S4000
G1 X134.809 Y121.866 E.00735
G1 X134.398 Y121.513 E.01306
G1 X134.134 Y121.191 E.01005
G1 X134 Y120.917 E.00735
G1 X133.866 Y121.191 E.00735
G1 X133.513 Y121.602 E.01307
G1 X133.191 Y121.865 E.01003
G1 X132.917 Y122 E.00736
G1 X133.191 Y122.135 E.00736
G1 X133.602 Y122.487 E.01305
G1 X133.865 Y122.809 E.01003
G1 X134 Y123.083 E.00736
G1 X134.135 Y122.809 E.00736
G1 X134.487 Y122.398 E.01305
G1 X134.809 Y122.134 E.01004
G1 X135.029 Y122.026 E.0059
M204 S10000
G1 X134.33 Y122 F42000
; LINE_WIDTH: 0.467846
G1 F9600
M204 S4000
G1 X134 Y121.67 E.01267
G1 X133.67 Y122 E.01266
G1 X134 Y122.33 E.01266
G1 X134.288 Y122.042 E.01104
; OBJECT_ID: 66
; WIPE_START
G1 X134 Y122.33 E-.17109
G1 X133.67 Y122 E-.19629
G1 X134 Y121.67 E-.1963
G1 X134.33 Y122 E-.19632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.485 Y128.95 Z2.2 F42000
G1 X137.974 Y130.026 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.991 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.329 E.04321
G2 X136.086 Y131.914 I.175 J2.763 E.04334
G1 X136.086 Y131.882 E.00084
G2 X134.644 Y130.439 I-1.502 J.059 E.05826
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.907 Y131.914 I.334 J1.466 E.05208
G2 X130.38 Y131.33 I-1.477 J1.571 E.04361
G1 X130.38 Y132.992 E.04321
; WIPE_START
G1 X130.38 Y131.33 E-.63181
G1 X130.716 Y131.353 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.16 Y133.536 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X137.04 Y132.895 I-4.034 J.421 E.01576
G1 X136.758 Y132.545 E.01083
G1 X136.409 Y132.361 E.00951
G1 X135.867 Y132.283 E.01321
G1 X135.694 Y132.085 E.00635
G1 X135.639 Y131.591 E.01199
G1 X135.455 Y131.242 E.00951
G1 X135.105 Y130.96 E.01083
G1 X134.608 Y130.84 E.01233
G1 X133.37 Y130.84 E.02987
G2 X132.896 Y130.954 I.174 J1.76 E.01179
G1 X132.546 Y131.241 E.01092
G1 X132.361 Y131.591 E.00952
G1 X132.283 Y132.133 E.01321
G1 X132.085 Y132.306 E.00635
G1 X131.591 Y132.361 E.01199
G1 X131.242 Y132.545 E.00951
G1 X130.959 Y132.895 E.01085
G1 X130.843 Y133.367 E.01171
G1 X130.84 Y134.63 E.03048
G2 X130.954 Y135.104 I1.76 J-.174 E.01179
G1 X131.241 Y135.454 E.01092
G1 X131.591 Y135.639 E.00952
G1 X132.133 Y135.717 E.01322
G1 X132.306 Y135.915 E.00634
G1 X132.361 Y136.409 E.01199
G1 X132.545 Y136.758 E.00951
G1 X132.895 Y137.041 E.01085
G1 X133.367 Y137.157 E.01171
G1 X134.63 Y137.16 E.03048
G2 X135.104 Y137.046 I-.174 J-1.76 E.01179
G1 X135.454 Y136.758 E.01092
G1 X135.639 Y136.409 E.00952
G1 X135.717 Y135.867 E.01322
G1 X135.915 Y135.694 E.00635
G1 X136.297 Y135.666 E.00924
G1 X136.733 Y135.474 E.01148
G1 X137.029 Y135.134 E.01088
G1 X137.154 Y134.691 E.01109
G2 X137.16 Y133.596 I-70.217 J-.916 E.02641
M204 S10000
G1 X136.774 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.686 Y133.069 E.01146
G1 X136.508 Y132.849 E.00683
G1 X136.295 Y132.737 E.00579
G1 X135.8 Y132.674 E.01204
G3 X135.302 Y132.087 I.295 J-.754 E.01935
G1 X135.263 Y131.705 E.00926
G1 X135.151 Y131.492 E.0058
G1 X134.931 Y131.314 E.00683
G1 X134.464 Y131.226 E.01146
G1 X133.386 Y131.226 E.02599
G1 X133.085 Y131.298 E.00747
G1 X132.85 Y131.49 E.00733
G1 X132.737 Y131.705 E.00584
G1 X132.674 Y132.2 E.01204
G3 X132.087 Y132.698 I-.754 J-.295 E.01935
G1 X131.705 Y132.737 E.00926
G1 X131.492 Y132.849 E.0058
G1 X131.313 Y133.071 E.00687
G1 X131.228 Y133.511 E.01081
G1 X131.226 Y134.614 E.02661
G1 X131.298 Y134.915 E.00745
G1 X131.49 Y135.15 E.00733
G1 X131.705 Y135.263 E.00584
G1 X132.201 Y135.326 E.01205
G3 X132.698 Y135.913 I-.296 J.754 E.01933
G1 X132.737 Y136.295 E.00926
G1 X132.849 Y136.508 E.0058
G1 X133.071 Y136.687 E.00687
G1 X133.511 Y136.772 E.01081
G1 X134.614 Y136.774 E.02661
G1 X134.915 Y136.702 E.00745
G1 X135.15 Y136.51 E.00733
G1 X135.263 Y136.295 E.00584
G1 X135.326 Y135.799 E.01205
G3 X135.94 Y135.3 I.747 J.291 E.01995
G1 X136.206 Y135.285 E.00642
G1 X136.498 Y135.156 E.00772
G1 X136.691 Y134.935 E.00707
G1 X136.774 Y134.618 E.00789
G1 X136.774 Y133.596 E.02465
M204 S10000
G1 X136.389 Y133.536 F42000
G1 F9600
M204 S4000
G1 X136.331 Y133.244 E.00717
G1 X136.181 Y133.113 E.0048
G1 X135.685 Y133.042 E.0121
G1 X135.444 Y132.928 E.00643
G3 X134.958 Y132.315 I.741 J-1.086 E.01915
G1 X134.887 Y131.819 E.01209
G1 X134.756 Y131.669 E.00481
G1 X134.348 Y131.611 E.00993
G1 X133.403 Y131.611 E.0228
G2 X133.113 Y131.819 I.04 J.362 E.00898
G1 X133.042 Y132.315 E.01209
G1 X132.928 Y132.556 E.00644
G3 X132.316 Y133.042 I-1.087 J-.741 E.01913
G1 X131.819 Y133.113 E.01211
G1 X131.667 Y133.246 E.00487
G1 X131.614 Y133.648 E.00977
G1 X131.611 Y134.599 E.02292
G1 X131.676 Y134.768 E.00438
G1 X131.819 Y134.887 E.00448
G1 X132.316 Y134.958 E.01212
G1 X132.557 Y135.072 E.00642
G3 X133.042 Y135.684 I-.741 J1.086 E.01912
G1 X133.113 Y136.181 E.01211
G1 X133.246 Y136.333 E.00487
G1 X133.648 Y136.386 E.00977
G1 X134.599 Y136.389 E.02292
G1 X134.768 Y136.324 E.00438
G1 X134.887 Y136.181 E.00448
G1 X134.958 Y135.684 E.01212
G1 X135.072 Y135.443 E.00642
G3 X135.685 Y134.958 I1.086 J.741 E.01914
G1 X136.199 Y134.866 E.0126
G1 X136.353 Y134.736 E.00486
G1 X136.388 Y134.417 E.00774
G1 X136.389 Y133.596 E.01979
M204 S10000
G1 X136.003 Y133.536 F42000
G1 F9600
M204 S4000
G1 X135.992 Y133.481 E.00135
G1 X135.57 Y133.41 E.01032
G1 X135.232 Y133.25 E.00901
G3 X134.59 Y132.43 I.984 J-1.432 E.02551
G1 X134.519 Y132.008 E.01031
G2 X133.482 Y131.997 I-.778 J23.246 E.025
G1 X133.41 Y132.43 E.01059
G1 X133.251 Y132.768 E.00901
G3 X132.432 Y133.41 I-1.433 J-.984 E.02548
G1 X132 Y133.513 E.01071
G1 X131.997 Y134.518 E.02424
G1 X132.432 Y134.59 E.01062
G1 X132.768 Y134.75 E.00899
G3 X133.41 Y135.568 I-.985 J1.432 E.02547
G1 X133.513 Y136 E.01071
G1 X134.518 Y136.003 E.02424
G1 X134.59 Y135.568 E.01062
G1 X134.75 Y135.232 E.00899
G3 X135.57 Y134.59 I1.432 J.985 E.0255
G1 X136.003 Y134.524 E.01057
G1 X136.003 Y133.596 E.02239
M204 S10000
G1 X135.617 Y133.812 F42000
G1 F9600
M204 S4000
G1 X135.454 Y133.778 E.00401
G1 X135.02 Y133.573 E.01158
G1 X134.651 Y133.254 E.01176
G1 X134.427 Y132.98 E.00854
G1 X134.222 Y132.545 E.01158
G1 X134.188 Y132.383 E.00401
G1 X133.812 Y132.383 E.00907
G1 X133.778 Y132.545 E.00401
G1 X133.573 Y132.98 E.01158
G1 X133.254 Y133.349 E.01177
G1 X132.98 Y133.573 E.00853
G1 X132.547 Y133.778 E.01156
G1 X132.385 Y133.811 E.004
G1 X132.384 Y134.188 E.00909
G1 X132.547 Y134.222 E.00403
G1 X132.98 Y134.427 E.01156
G1 X133.349 Y134.746 E.01175
G1 X133.573 Y135.02 E.00853
G1 X133.778 Y135.453 E.01156
G1 X133.811 Y135.615 E.004
G1 X134.188 Y135.616 E.00909
G1 X134.222 Y135.453 E.00403
G1 X134.427 Y135.02 E.01156
G1 X134.746 Y134.651 E.01175
G1 X135.02 Y134.427 E.00854
G1 X135.454 Y134.222 E.01158
G1 X135.617 Y134.192 E.00399
G1 X135.617 Y133.872 E.00772
M204 S10000
G1 X135.03 Y134 F42000
G1 F9600
M204 S4000
G1 X134.809 Y133.895 E.0059
G1 X134.378 Y133.527 E.01366
G1 X134.105 Y133.191 E.01044
G1 X134 Y132.97 E.0059
G1 X133.895 Y133.191 E.0059
G1 X133.527 Y133.622 E.01366
G1 X133.192 Y133.895 E.01042
G1 X132.97 Y134 E.00592
G1 X133.192 Y134.105 E.00592
G1 X133.622 Y134.473 E.01364
G1 X133.895 Y134.808 E.01042
G1 X134 Y135.03 E.00592
G1 X134.105 Y134.808 E.00592
G1 X134.473 Y134.378 E.01364
G1 X134.809 Y134.105 E.01044
G1 X134.976 Y134.026 E.00446
M204 S10000
G1 X134.311 Y134 F42000
; LINE_WIDTH: 0.443166
G1 F9600
M204 S4000
G1 X134 Y133.689 E.01126
G1 X133.689 Y134 E.01125
G1 X134 Y134.311 E.01125
G1 X134.269 Y134.042 E.00972
; OBJECT_ID: 88
; WIPE_START
G1 X134 Y134.311 E-.16989
G1 X133.689 Y134 E-.19669
G1 X134 Y133.689 E-.1967
G1 X134.311 Y134 E-.19671
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.895 Y132.198 Z2.2 F42000
G1 X125.974 Y131.974 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.16 Y127.483 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
G1 F9600
M204 S4000
G2 X125.043 Y126.85 I-4.07 J.423 E.01554
G1 X124.766 Y126.501 E.01074
G1 X124.445 Y126.324 E.00885
G1 X123.945 Y126.258 E.01217
G1 X123.764 Y126.098 E.00583
G1 X123.685 Y125.577 E.01271
G1 X123.498 Y125.233 E.00943
G1 X123.15 Y124.957 E.01072
G1 X122.659 Y124.84 E.01217
G1 X121.32 Y124.84 E.03229
G2 X120.852 Y124.951 I.168 J1.746 E.01164
G1 X120.502 Y125.233 E.01083
G1 X120.324 Y125.555 E.00887
G1 X120.258 Y126.055 E.01217
G1 X120.098 Y126.236 E.00583
G1 X119.577 Y126.315 E.01271
G1 X119.233 Y126.502 E.00943
G1 X118.956 Y126.851 E.01074
G1 X118.843 Y127.317 E.01157
G1 X118.84 Y128.68 E.03289
G2 X118.951 Y129.148 I1.746 J-.168 E.01164
G1 X119.233 Y129.498 E.01083
G1 X119.555 Y129.676 E.00887
G1 X120.056 Y129.742 E.01217
G1 X120.236 Y129.902 E.00583
G1 X120.315 Y130.423 E.01271
G1 X120.502 Y130.767 E.00943
G1 X120.851 Y131.044 E.01074
G1 X121.317 Y131.157 E.01157
G1 X122.68 Y131.16 E.03289
G2 X123.148 Y131.049 I-.168 J-1.746 E.01164
G1 X123.498 Y130.767 E.01083
G1 X123.676 Y130.445 E.00887
G1 X123.742 Y129.944 E.01217
G1 X123.902 Y129.764 E.00583
G1 X124.311 Y129.713 E.00992
G1 X124.742 Y129.517 E.01143
G1 X125.032 Y129.178 E.01077
G1 X125.154 Y128.741 E.01093
G2 X125.16 Y127.543 I-82.907 J-.995 E.0289
M204 S10000
G1 X124.774 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.688 Y127.023 E.01129
G1 X124.512 Y126.802 E.00681
G1 X124.324 Y126.698 E.00518
G1 X123.812 Y126.62 E.0125
G1 X123.558 Y126.442 E.00747
G1 X123.38 Y126.188 E.00747
G1 X123.254 Y125.592 E.01471
G2 X122.977 Y125.312 I-.825 J.54 E.00955
G1 X122.517 Y125.226 E.01129
G1 X121.336 Y125.226 E.02847
G1 X121.039 Y125.296 E.00737
G1 X120.803 Y125.486 E.00731
G1 X120.698 Y125.676 E.00524
G1 X120.62 Y126.188 E.0125
G1 X120.442 Y126.442 E.00747
G1 X120.189 Y126.62 E.00746
G1 X119.694 Y126.691 E.01206
G1 X119.486 Y126.803 E.00569
G1 X119.311 Y127.024 E.0068
G1 X119.228 Y127.459 E.01066
G1 X119.226 Y128.664 E.02908
G1 X119.296 Y128.961 E.00735
G1 X119.486 Y129.197 E.00731
G1 X119.676 Y129.302 E.00523
G1 X120.189 Y129.38 E.01251
G1 X120.442 Y129.558 E.00746
G1 X120.62 Y129.811 E.00746
G1 X120.691 Y130.306 E.01206
G1 X120.803 Y130.514 E.00569
G1 X121.024 Y130.689 E.0068
G1 X121.459 Y130.772 E.01066
G1 X122.664 Y130.774 E.02908
G1 X122.961 Y130.704 E.00735
G1 X123.197 Y130.514 E.00731
G1 X123.302 Y130.324 E.00523
G1 X123.38 Y129.811 E.01251
G1 X123.558 Y129.558 E.00746
G1 X123.812 Y129.38 E.00747
G1 X124.343 Y129.275 E.01306
G1 X124.505 Y129.201 E.00429
G1 X124.693 Y128.981 E.007
G1 X124.774 Y128.634 E.00858
G1 X124.774 Y127.543 E.02632
M204 S10000
G1 X124.389 Y127.483 F42000
G1 F9600
M204 S4000
G1 X124.333 Y127.196 E.00706
G1 X124.203 Y127.071 E.00432
G1 X123.678 Y126.982 E.01284
G1 X123.329 Y126.759 E.00999
G3 X123.018 Y126.322 I.684 J-.817 E.01309
G1 X122.934 Y125.811 E.01248
G1 X122.804 Y125.667 E.00467
G1 X122.429 Y125.611 E.00915
G1 X121.353 Y125.611 E.02596
G1 X121.175 Y125.681 E.00459
G1 X121.071 Y125.797 E.00375
G1 X120.982 Y126.322 E.01284
G1 X120.759 Y126.671 E.00999
G3 X120.323 Y126.982 I-.817 J-.685 E.01306
G1 X119.811 Y127.066 E.0125
G1 X119.666 Y127.198 E.00473
G1 X119.614 Y127.567 E.009
G1 X119.611 Y128.648 E.02608
G1 X119.681 Y128.825 E.00457
G1 X119.797 Y128.929 E.00375
G1 X120.323 Y129.018 E.01286
G1 X120.671 Y129.241 E.00997
G3 X120.982 Y129.678 I-.684 J.817 E.01306
G1 X121.066 Y130.189 E.0125
G1 X121.198 Y130.334 E.00473
G1 X121.567 Y130.386 E.00899
G1 X122.648 Y130.389 E.02608
G1 X122.825 Y130.319 E.00457
G1 X122.929 Y130.203 E.00375
G1 X123.018 Y129.678 E.01286
G1 X123.241 Y129.329 E.00997
G3 X123.678 Y129.018 I.817 J.684 E.01308
G1 X124.183 Y128.924 E.01239
G1 X124.354 Y128.784 E.00533
G1 X124.388 Y128.506 E.00676
G1 X124.389 Y127.543 E.02322
M204 S10000
G1 X124.003 Y127.483 F42000
G1 F9600
M204 S4000
G1 X123.993 Y127.435 E.00119
G1 X123.545 Y127.344 E.01102
G1 X123.249 Y127.191 E.00803
G3 X122.656 Y126.455 I1.016 J-1.425 E.02309
G1 X122.53 Y125.998 E.01142
G2 X121.436 Y125.997 I-.812 J191.795 E.02638
G1 X121.344 Y126.455 E.01126
G1 X121.191 Y126.751 E.00803
G3 X120.456 Y127.343 I-1.426 J-1.016 E.02306
G1 X120 Y127.46 E.01136
G1 X119.997 Y128.564 E.02663
G1 X120.456 Y128.657 E.01129
G1 X120.751 Y128.809 E.00801
G3 X121.344 Y129.544 I-1.017 J1.425 E.02305
G1 X121.46 Y130 E.01136
G1 X122.564 Y130.003 E.02663
G1 X122.657 Y129.544 E.01129
G1 X122.809 Y129.249 E.00801
G3 X123.545 Y128.656 I1.425 J1.016 E.02308
G1 X124.003 Y128.571 E.01122
G1 X124.003 Y127.543 E.02481
M204 S10000
G1 X123.617 Y127.755 F42000
G1 F9600
M204 S4000
G1 X123.412 Y127.706 E.00509
G1 X123.032 Y127.51 E.01033
G3 X122.294 Y126.588 I1.265 J-1.768 E.02883
G1 X122.246 Y126.383 E.00508
G1 X121.755 Y126.383 E.01183
G1 X121.706 Y126.588 E.00509
G1 X121.51 Y126.968 E.01033
G3 X120.589 Y127.705 I-1.768 J-1.265 E.02879
G1 X120.385 Y127.753 E.00507
G1 X120.384 Y128.245 E.01186
G1 X120.589 Y128.295 E.00511
G1 X120.969 Y128.491 E.0103
G3 X121.705 Y129.411 I-1.266 J1.768 E.02877
G1 X121.753 Y129.615 E.00507
G1 X122.245 Y129.616 E.01186
G1 X122.295 Y129.411 E.00511
G1 X122.491 Y129.031 E.0103
G3 X123.412 Y128.294 I1.768 J1.266 E.02881
G1 X123.617 Y128.252 E.00505
G1 X123.617 Y127.815 E.01052
M204 S10000
G1 X123.147 Y128 F42000
G1 F9600
M204 S4000
G1 X122.814 Y127.828 E.00905
G3 X122.172 Y127.186 I1.628 J-2.27 E.02198
G1 X122 Y126.853 E.00905
G1 X121.828 Y127.186 E.00905
G3 X121.187 Y127.828 I-2.27 J-1.628 E.02197
G1 X120.853 Y128 E.00906
G1 X121.187 Y128.172 E.00906
G3 X121.828 Y128.813 I-1.63 J2.271 E.02195
G1 X122 Y129.147 E.00906
G1 X122.173 Y128.813 E.00906
G3 X122.814 Y128.172 I2.27 J1.629 E.02196
G1 X123.094 Y128.028 E.00761
M204 S10000
G1 X122.356 Y128 F42000
; LINE_WIDTH: 0.502216
G1 F9600
M204 S4000
G1 X122 Y127.644 E.01472
G1 X121.644 Y128 E.01472
G1 X122 Y128.356 E.01472
G1 X122.313 Y128.042 E.01296
; WIPE_START
G1 X122 Y128.356 E-.17248
G1 X121.644 Y128 E-.19582
G1 X122 Y127.644 E-.19584
G1 X122.356 Y128 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.991 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.329 E.04321
G2 X124.125 Y125.875 I-.057 J2.163 E.04236
G2 X122.694 Y124.439 I-1.495 J.06 E.05788
G2 X121.027 Y124.469 I-.704 J7.294 E.04343
G2 X119.865 Y125.875 I.365 J1.485 E.0508
G2 X118.38 Y125.33 I-1.435 J1.613 E.04211
G1 X118.38 Y126.993 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.33 E-.63181
G1 X118.716 Y125.353 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 12/38
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S117.3
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.067 J1.215 P1  F42000
G1 X130.026 Y125.974 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y122 E.10328
G1 X137.974 Y125.974 E.10328
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y122 E.11408
G1 X138.389 Y126.389 E.11408
G1 X129.671 Y126.389 E.22661
M204 S250
M73 P55 R7
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y122 E.11551
G1 X138.79 Y126.79 E.11551
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.36 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 12 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer12 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.991 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.328 E.04321
G3 X131.905 Y119.762 I.276 J1.929 E.04245
G3 X133.051 Y118.469 I1.484 J.161 E.04791
G3 X134.669 Y118.439 I.938 J7.031 E.04214
G3 X136.101 Y119.899 I-.065 J1.496 E.0585
G1 X136.286 Y119.907 E.00482
G3 X137.62 Y119.317 I1.493 J1.571 E.03867
G1 X137.62 Y120.979 E.04321
; WIPE_START
G1 X137.62 Y119.317 E-.63181
G1 X137.289 Y119.38 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.765 Y125.325 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X135.868 Y124.222 E.03761
G1 X136.222 Y123.868
G1 X137.325 Y122.766 E.03761
G1 X137.334 Y122.212
G1 X134.212 Y125.334 E.10647
G1 X133.666 Y125.334
G1 X137.334 Y121.666 E.12507
G1 X137.292 Y121.163
G1 X133.162 Y125.292 E.14082
G1 X132.739 Y125.17
G1 X137.17 Y120.739 E.1511
G1 X136.921 Y120.442
G1 X132.442 Y124.921 E.15276
G1 X132.229 Y124.589
G1 X136.589 Y120.229 E.1487
G1 X136.145 Y120.128
G1 X132.128 Y124.145 E.13698
G1 X131.855 Y123.872
G1 X135.872 Y119.855 E.13698
G1 X135.771 Y119.411
G1 X131.411 Y123.771 E.1487
G1 X131.079 Y123.558
G1 X135.558 Y119.079 E.15276
G1 X135.261 Y118.83
G1 X130.83 Y123.261 E.1511
G1 X130.683 Y122.862
G1 X134.837 Y118.708 E.14167
G1 X134.334 Y118.667
G1 X130.666 Y122.334 E.12507
G1 X130.666 Y121.788
G1 X133.788 Y118.667 E.10647
G1 X133.234 Y118.675
G1 X132.132 Y119.778 E.03761
G1 X131.778 Y120.132
G1 X130.696 Y121.214 E.0369
; WIPE_START
M204 S4000
G1 X131.778 Y120.132 E-.58153
G1 X132.11 Y119.8 E-.17847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.217 Y123.172 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.089393
G1 F15000
M204 S4000
G3 X137.173 Y123.236 I-.366 J-.202 E.00027
; LINE_WIDTH: 0.121796
G3 X136.827 Y123.61 I-2.059 J-1.559 E.00279
; LINE_WIDTH: 0.124004
G1 X136.741 Y123.673 E.0006
; LINE_WIDTH: 0.0950746
G1 X136.654 Y123.737 E.00041
; WIPE_START
G1 X136.741 Y123.673 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.828 Y118.783 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0893163
G1 F15000
M204 S4000
G2 X132.764 Y118.827 I.202 J.366 E.00027
; LINE_WIDTH: 0.12167
G2 X132.39 Y119.173 I1.563 J2.064 E.00279
; LINE_WIDTH: 0.123925
G1 X132.327 Y119.259 E.0006
; LINE_WIDTH: 0.0950495
G1 X132.263 Y119.345 E.00041
; WIPE_START
G1 X132.327 Y119.259 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.345 Y120.263 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F15000
M204 S4000
G1 X131.259 Y120.327 E.00041
; LINE_WIDTH: 0.122257
G2 X131.15 Y120.411 I.373 J.598 E.00076
G1 X130.83 Y120.76 E.0026
; LINE_WIDTH: 0.0886992
G2 X130.789 Y120.824 I.257 J.212 E.00026
; WIPE_START
G1 X130.83 Y120.76 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.787 Y123.803 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.109947
G1 F15000
M204 S4000
G1 X131.596 Y123.867 E.00095
M204 S10000
G1 X132.197 Y124.213 F42000
; LINE_WIDTH: 0.109817
G1 F15000
M204 S4000
G1 X132.133 Y124.404 E.00095
; WIPE_START
G1 X132.197 Y124.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.737 Y124.654 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0950712
G1 F15000
M204 S4000
G1 X135.673 Y124.741 E.00041
; LINE_WIDTH: 0.122164
G3 X135.589 Y124.85 I-.598 J-.373 E.00076
G1 X135.236 Y125.173 E.00263
; LINE_WIDTH: 0.0893788
G3 X135.172 Y125.217 I-.266 J-.323 E.00027
; OBJECT_ID: 66
; WIPE_START
G1 X135.236 Y125.173 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y134 E.10328
G1 X137.974 Y137.974 E.10328
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y134 E.11408
G1 X138.389 Y138.389 E.11408
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y134 E.11551
G1 X138.79 Y138.79 E.11551
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.755 Y131.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.979 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y131.317 E.04321
G2 X136.261 Y131.926 I.173 J2.207 E.03949
G3 X136.086 Y131.882 I-.068 J-.102 E.00529
G2 X134.644 Y130.439 I-1.502 J.059 E.05826
G2 X133.076 Y130.469 I-.654 J6.836 E.04085
G2 X131.923 Y131.778 I.354 J1.475 E.04832
G2 X130.38 Y131.328 I-1.267 J1.476 E.04307
G1 X130.38 Y132.991 E.04321
; WIPE_START
G1 X130.38 Y131.328 E-.63181
G1 X130.717 Y131.318 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.768 Y137.323 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X135.847 Y136.243 E.03681
G1 X136.243 Y135.847
G1 X137.323 Y134.768 E.03681
G1 X137.334 Y134.212
G1 X134.212 Y137.334 E.10647
G1 X133.666 Y137.334
G1 X137.334 Y133.666 E.12507
G1 X137.287 Y133.168
G1 X133.168 Y137.287 E.14047
G1 X132.75 Y137.159
G1 X137.159 Y132.75 E.15035
G1 X136.909 Y132.454
G1 X132.454 Y136.909 E.15193
G1 X132.246 Y136.572
G1 X136.572 Y132.246 E.14754
G1 X136.13 Y132.143
G1 X132.143 Y136.13 E.13599
G1 X131.87 Y135.857
G1 X135.857 Y131.87 E.13599
G1 X135.754 Y131.428
G1 X131.428 Y135.754 E.14754
G1 X131.091 Y135.546
G1 X135.546 Y131.091 E.15193
G1 X135.25 Y130.841
G1 X130.841 Y135.25 E.15035
G1 X130.687 Y134.858
G1 X134.832 Y130.713 E.14135
G1 X134.334 Y130.666
G1 X130.666 Y134.334 E.12507
G1 X130.666 Y133.788
G1 X133.788 Y130.666 E.10647
G1 X133.232 Y130.677
G1 X132.153 Y131.757 E.03681
G1 X131.757 Y132.153
G1 X130.704 Y133.205 E.03589
; WIPE_START
M204 S4000
G1 X131.757 Y132.153 E-.5656
G1 X132.118 Y131.791 E-.1944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.804 Y130.804 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10228
G1 F15000
M204 S4000
G2 X132.315 Y131.294 I1.464 J1.951 E.00295
; WIPE_START
G1 X132.425 Y131.148 E-.19965
G1 X132.804 Y130.804 E-.56035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.014 Y130.804 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0881446
G1 F15000
M204 S4000
G1 X134.861 Y130.718 E.00059
; WIPE_START
G1 X135.014 Y130.804 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.196 Y135.195 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.102352
G1 F15000
M204 S4000
M73 P56 R7
G3 X136.706 Y135.685 I-1.947 J-1.459 E.00296
; WIPE_START
G1 X136.852 Y135.575 E-.19978
G1 X137.196 Y135.195 E-.56022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.685 Y136.706 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.102355
G1 F15000
M204 S4000
G3 X135.575 Y136.852 I-.793 J-.486 E.00078
G3 X135.195 Y137.196 I-2.037 J-1.861 E.00218
; WIPE_START
G1 X135.575 Y136.852 E-.56021
G1 X135.685 Y136.706 E-.19979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.294 Y132.315 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.102414
G1 F15000
M204 S4000
G2 X131.148 Y132.425 I.482 J.787 E.00078
G1 X130.807 Y132.802 E.00216
; OBJECT_ID: 88
; WIPE_START
G1 X131.148 Y132.425 E-.55908
G1 X131.294 Y132.315 E-.20092
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y128 E.10328
G1 X125.974 Y131.914 E.10172
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y128 E.11408
G1 X126.389 Y132.329 E.11252
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y128 E.11551
G1 X126.79 Y132.73 E.11406
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.763 Y131.327 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X123.894 Y130.196 E.03858
G1 X124.196 Y129.894
G1 X125.327 Y128.763 E.03858
G1 X125.334 Y128.212
G1 X122.212 Y131.334 E.10647
G1 X121.666 Y131.334
G1 X125.334 Y127.666 E.12507
G1 X125.297 Y127.157
G1 X121.157 Y131.297 E.14117
G1 X120.728 Y131.181
G1 X125.181 Y126.728 E.15184
G1 X124.933 Y126.43
G1 X120.43 Y130.933 E.15358
G1 X120.212 Y130.606
G1 X124.606 Y126.212 E.14985
G1 X124.168 Y126.104
G1 X120.104 Y130.168 E.13861
G1 X119.831 Y129.896
G1 X123.896 Y125.831 E.13861
G1 X123.788 Y125.394
G1 X119.394 Y129.788 E.14985
G1 X119.067 Y129.57
G1 X123.57 Y125.067 E.15358
G1 X123.272 Y124.819
G1 X118.819 Y129.272 E.15184
G1 X118.681 Y128.864
G1 X122.843 Y124.703 E.14191
G1 X122.334 Y124.666
G1 X118.667 Y128.334 E.12507
G1 X118.667 Y127.788
G1 X121.788 Y124.666 E.10647
G1 X121.237 Y124.673
G1 X120.106 Y125.804 E.03858
G1 X119.804 Y126.106
G1 X118.687 Y127.222 E.03807
; WIPE_START
M204 S4000
G1 X119.804 Y126.106 E-.59997
G1 X120.102 Y125.808 E-.16003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.237 Y129.162 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111531
G1 F15000
M204 S4000
G1 X125.168 Y129.253 E.00055
; LINE_WIDTH: 0.13931
G3 X124.827 Y129.624 I-2.057 J-1.553 E.00331
; LINE_WIDTH: 0.138051
G1 X124.714 Y129.707 E.00091
; LINE_WIDTH: 0.0997659
G1 X124.601 Y129.79 E.00057
; WIPE_START
G1 X124.714 Y129.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.838 Y124.763 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.111428
G1 F15000
M204 S4000
G1 X120.747 Y124.832 E.00055
; LINE_WIDTH: 0.139218
G2 X120.376 Y125.173 I1.547 J2.051 E.00331
; LINE_WIDTH: 0.137962
G1 X120.293 Y125.286 E.00091
; LINE_WIDTH: 0.0997331
G1 X120.21 Y125.399 E.00057
; WIPE_START
G1 X120.293 Y125.286 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.399 Y126.21 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0997412
G1 F15000
M204 S4000
G1 X119.286 Y126.293 E.00057
; LINE_WIDTH: 0.139123
G2 X119.151 Y126.396 I.455 J.735 E.00111
G1 X118.835 Y126.743 E.00307
; LINE_WIDTH: 0.0988571
G2 X118.78 Y126.833 I.367 J.29 E.00043
; WIPE_START
G1 X118.835 Y126.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.79 Y130.601 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0997608
G1 F15000
M204 S4000
G1 X123.707 Y130.714 E.00057
; LINE_WIDTH: 0.13904
G3 X123.604 Y130.849 I-.737 J-.457 E.00111
G1 X123.253 Y131.168 E.00311
; LINE_WIDTH: 0.111535
G1 X123.162 Y131.237 E.00055
; WIPE_START
G1 X123.253 Y131.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y126.979 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y125.317 E.04321
G2 X124.317 Y125.884 I.142 J2.108 E.03769
G1 X124.125 Y125.875 E.00498
G2 X122.694 Y124.439 I-1.495 J.06 E.05788
G2 X121.027 Y124.469 I-.704 J7.289 E.04343
G2 X119.881 Y125.741 I.34 J1.458 E.04738
G2 X118.38 Y125.328 I-1.226 J1.522 E.04163
G1 X118.38 Y126.991 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y125.328 E-.63181
G1 X118.717 Y125.318 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 13/38
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S122.4
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.36 I-.07 J1.215 P1  F42000
G1 X130.026 Y125.974 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z2.52 F42000
G1 X135.676 Y120.324 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
; WIPE_START
G1 X136.117 Y120.739 E-.32651
G1 X136.294 Y120.766 E-.06796
G1 X136.481 Y120.864 E-.07998
G1 X136.643 Y121.058 E-.09643
G1 X136.711 Y121.333 E-.10741
G1 X136.711 Y121.548 E-.08171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.14 Y121.14 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.08 Y121.14 E.02887
; WIPE_START
M204 S4000
G1 X133.14 Y119.883 E-.47827
G1 X133.18 Y119.765 E-.04742
G1 X133.333 Y119.69 E-.06452
G1 X133.78 Y119.69 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 13 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer13 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.978 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.315 E.04321
G3 X131.99 Y119.671 I.466 J1.715 E.04458
G3 X133.092 Y118.541 I1.438 J.3 E.04333
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G1 X136.336 Y119.99 E.00814
G3 X137.62 Y119.293 I1.681 J1.563 E.03865
G1 X137.62 Y120.956 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X137.62 Y119.293 E-.63181
G1 X137.297 Y119.388 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
M73 P57 R7
G1 X137.781 Y127.005 Z2.52 F42000
G1 X137.974 Y130.026 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z2.52 F42000
G1 X132.349 Y135.651 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
M204 S10000
G1 X132.764 Y135.236 F42000
G1 F9000
M204 S4000
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.765 Y135.296 E.02408
M204 S250
G1 X133.165 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.895 E.02947
; WIPE_START
M204 S4000
G1 X131.883 Y134.835 E-.48776
G1 X131.766 Y134.795 E-.04705
G1 X131.69 Y134.642 E-.06488
G1 X131.69 Y134.22 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y132.978 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y131.315 E.04321
G3 X132.012 Y131.69 I.466 J1.715 E.04533
G3 X133.117 Y130.541 I1.441 J.279 E.04381
G3 X134.66 Y130.52 I.888 J8.851 E.04014
G3 X136.005 Y131.995 I-.071 J1.416 E.05756
G3 X136.312 Y132.012 I.059 J1.73 E.00801
G3 X137.62 Y131.293 I1.725 J1.589 E.0395
G1 X137.62 Y132.956 E.04321
; OBJECT_ID: 88
; WIPE_START
G1 X137.62 Y131.293 E-.63181
G1 X137.297 Y131.388 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X129.674 Y131.782 Z2.52 F42000
G1 X125.974 Y131.974 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z2.52 F42000
G1 X120.299 Y126.299 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y126.978 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y125.315 E.04321
G3 X119.967 Y125.651 I.466 J1.717 E.04378
G3 X121.068 Y124.541 I1.444 J.331 E.04281
G3 X122.71 Y124.52 I.938 J9.423 E.04274
G3 X124.048 Y125.952 I-.064 J1.401 E.05639
G1 X124.362 Y125.967 E.00818
G3 X125.62 Y125.293 I1.633 J1.536 E.03775
G1 X125.62 Y126.956 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.62 Y125.293 E-.63181
G1 X125.297 Y125.388 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 14/38
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.52 I-.15 J1.208 P1  F42000
G1 X130.026 Y125.974 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z2.68 F42000
G1 X135.676 Y120.324 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
M73 P58 R7
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.739 Y120.739 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.679 Y120.74 E.02351
M204 S250
G1 X133.14 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.08 Y121.14 E.02887
; WIPE_START
M204 S4000
G1 X133.14 Y119.883 E-.47827
G1 X133.18 Y119.765 E-.04742
G1 X133.333 Y119.69 E-.06452
G1 X133.78 Y119.69 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 14 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer14 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.953 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.29 E.04321
G3 X130.878 Y119.171 I.574 J1.293 E.0134
G3 X132.024 Y119.507 I.21 J1.407 E.03205
G3 X133.092 Y118.541 I1.299 J.362 E.03949
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G3 X136.452 Y120.014 I.12 J1.087 E.01126
G3 X137.62 Y119.257 I1.611 J1.205 E.03695
G1 X137.62 Y120.919 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X137.62 Y119.257 E-.63181
G1 X137.307 Y119.382 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.784 Y126.999 Z2.68 F42000
G1 X137.974 Y130.026 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z2.68 F42000
G1 X132.349 Y135.651 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
M204 S10000
G1 X132.764 Y135.236 F42000
G1 F9000
M204 S4000
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.765 Y135.296 E.02408
; WIPE_START
G1 X131.883 Y135.236 E-.33596
G1 X131.71 Y135.21 E-.06651
G1 X131.522 Y135.113 E-.08023
G1 X131.357 Y134.918 E-.09693
G1 X131.289 Y134.642 E-.10809
G1 X131.289 Y134.452 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.165 Y133.165 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.105 Y133.165 E.02947
; WIPE_START
M204 S4000
G1 X133.165 Y131.883 E-.48776
G1 X133.205 Y131.766 E-.04705
G1 X133.358 Y131.69 E-.06488
G1 X133.78 Y131.69 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y132.953 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y131.29 E.04321
G3 X130.878 Y131.171 I.574 J1.293 E.0134
G3 X132.045 Y131.524 I.209 J1.413 E.03274
G3 X133.117 Y130.541 I1.303 J.344 E.03994
G3 X134.66 Y130.52 I.888 J8.851 E.04014
G3 X136.005 Y131.995 I-.071 J1.416 E.05756
G3 X136.434 Y132.035 I.027 J2.056 E.01123
G3 X137.62 Y131.257 I1.648 J1.219 E.03765
G1 X137.62 Y132.919 E.04321
; OBJECT_ID: 88
; WIPE_START
G1 X137.62 Y131.257 E-.63181
G1 X137.307 Y131.382 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X129.685 Y131.78 Z2.68 F42000
G1 X125.974 Y131.974 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z2.68 F42000
G1 X120.299 Y126.299 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
M73 P59 R7
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
M73 P59 R6
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y126.953 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y125.29 E.04321
G3 X118.878 Y125.171 I.574 J1.293 E.0134
G3 X120.004 Y125.49 I.21 J1.403 E.03136
G3 X121.068 Y124.541 I1.294 J.379 E.03904
G3 X122.71 Y124.52 I.938 J9.423 E.04274
G3 X124.048 Y125.952 I-.064 J1.401 E.05639
G3 X124.47 Y125.994 I.107 J1.067 E.01111
G3 X125.62 Y125.257 I1.575 J1.19 E.03626
G1 X125.62 Y126.919 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.62 Y125.257 E-.63181
G1 X125.307 Y125.382 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 15/38
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S119.85
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.68 I-.151 J1.208 P1  F42000
G1 X130.026 Y125.974 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z2.84 F42000
G1 X135.676 Y120.324 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.739 Y120.739 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.679 Y120.74 E.02351
M204 S250
G1 X133.14 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.08 Y121.14 E.02887
; WIPE_START
M204 S4000
G1 X133.14 Y119.883 E-.47827
G1 X133.18 Y119.765 E-.04742
G1 X133.333 Y119.69 E-.06452
G1 X133.78 Y119.69 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 15 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer15 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.915 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.252 E.04321
G1 X131.324 Y119.011 E.02533
G3 X132.108 Y119.327 I.113 J.849 E.02297
G3 X133.092 Y118.541 I1.36 J.693 E.03377
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G3 X136.524 Y120.032 I.111 J1.275 E.01317
G3 X137.62 Y119.212 I1.671 J1.09 E.03633
G1 X137.62 Y120.874 E.04321
; WIPE_START
G1 X137.62 Y119.212 E-.63181
G1 X137.318 Y119.362 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.042 Y125.413 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X132.703 Y125.329 E.00909
G3 X131.988 Y124.285 I.609 J-1.183 E.03427
G1 X131.786 Y124.015 E.00877
G3 X130.583 Y123.033 I.129 J-1.385 E.04283
; OBJECT_ID: 66
; WIPE_START
G1 X130.675 Y123.303 E-.10828
G1 X131.045 Y123.745 E-.21909
G1 X131.468 Y123.966 E-.18164
G1 X131.786 Y124.015 E-.12221
G1 X131.988 Y124.285 E-.12815
G1 X131.988 Y124.287 E-.00063
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z2.84 F42000
G1 X135.651 Y135.651 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
M73 P60 R6
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
; WIPE_START
G1 X135.635 Y136.296 E-.24718
G1 X135.443 Y136.731 E-.18068
G1 X135.112 Y137.01 E-.16481
G1 X134.817 Y137.111 E-.11854
G1 X134.689 Y137.122 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.764 Y132.764 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.704 Y132.765 E.02408
M204 S250
G1 X133.165 Y133.165 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.105 Y133.165 E.02947
; WIPE_START
M204 S4000
G1 X133.165 Y131.883 E-.48776
G1 X133.205 Y131.766 E-.04705
G1 X133.358 Y131.69 E-.06488
G1 X133.78 Y131.69 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y132.914 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y131.252 E.04321
G1 X131.324 Y131.011 E.02533
G3 X132.126 Y131.341 I.11 J.872 E.02357
G3 X133.117 Y130.541 I1.367 J.679 E.03416
G3 X134.66 Y130.52 I.888 J8.851 E.04014
G3 X136.005 Y131.995 I-.071 J1.416 E.05756
G3 X136.508 Y132.053 I.031 J1.961 E.01322
G3 X137.62 Y131.212 I1.707 J1.101 E.03699
G1 X137.62 Y132.874 E.04321
; WIPE_START
G1 X137.62 Y131.212 E-.63181
G1 X137.318 Y131.362 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.099 Y137.42 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X132.724 Y137.327 E.01006
G3 X132.013 Y136.318 I.624 J-1.195 E.03333
G1 X131.771 Y135.995 E.01048
G3 X130.579 Y134.994 I.169 J-1.412 E.04283
; OBJECT_ID: 88
; WIPE_START
G1 X130.677 Y135.281 E-.11541
G1 X131.05 Y135.724 E-.22022
G1 X131.477 Y135.944 E-.1822
G1 X131.771 Y135.995 E-.11368
G1 X131.974 Y136.266 E-.12849
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z2.84 F42000
G1 X120.299 Y126.299 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y126.914 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y125.252 E.04321
G1 X119.324 Y125.011 E.02533
G3 X120.089 Y125.313 I.116 J.826 E.02236
G3 X121.068 Y124.541 I1.353 J.707 E.03338
G3 X122.71 Y124.52 I.938 J9.423 E.04274
G3 X124.048 Y125.952 I-.064 J1.401 E.05639
G3 X124.539 Y126.012 I.098 J1.246 E.01295
G3 X125.62 Y125.212 I1.635 J1.079 E.03568
G1 X125.62 Y126.874 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.62 Y125.212 E-.63181
G1 X125.318 Y125.362 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 16/38
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.84 I-.157 J1.207 P1  F42000
G1 X130.026 Y125.974 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3 F42000
G1 X135.676 Y120.324 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.739 Y120.739 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
M73 P61 R6
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.679 Y120.74 E.02351
M204 S250
G1 X133.14 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.08 Y121.14 E.02887
; WIPE_START
M204 S4000
G1 X133.14 Y119.883 E-.47827
G1 X133.18 Y119.765 E-.04742
G1 X133.333 Y119.69 E-.06452
G1 X133.78 Y119.69 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 16 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer16 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.861 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.199 E.04321
G3 X131.77 Y118.769 I2.286 J4.931 E.03794
G1 X132.246 Y119.063 E.01453
G3 X133.092 Y118.541 I1.472 J1.441 E.02611
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G3 X136.572 Y120.055 I.112 J1.173 E.01453
G3 X137.62 Y119.145 I1.818 J1.035 E.03678
G1 X137.62 Y120.808 E.04321
; WIPE_START
G1 X137.62 Y119.145 E-.63181
G1 X137.333 Y119.321 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.016 Y125.48 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X132.703 Y125.329 I-.35 J-2.754 E.0347
G3 X131.77 Y124.163 I1.036 J-1.784 E.03971
G1 X131.673 Y124.01 E.00471
G3 X130.547 Y122.926 I.295 J-1.433 E.04287
; OBJECT_ID: 66
; WIPE_START
G1 X130.675 Y123.303 E-.15126
G1 X131.045 Y123.745 E-.21909
G1 X131.673 Y124.01 E-.25926
G1 X131.77 Y124.163 E-.06881
G1 X131.847 Y124.306 E-.06158
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3 F42000
G1 X135.651 Y135.651 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
; WIPE_START
G1 X135.635 Y136.296 E-.24718
G1 X135.443 Y136.731 E-.18068
G1 X135.112 Y137.01 E-.16481
G1 X134.817 Y137.111 E-.11854
G1 X134.689 Y137.122 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.236 Y132.764 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.235 Y132.704 E.02408
; WIPE_START
G1 X136.117 Y132.764 E-.33596
G1 X136.29 Y132.79 E-.06651
G1 X136.478 Y132.887 E-.08023
G1 X136.642 Y133.082 E-.09692
G1 X136.711 Y133.358 E-.1081
G1 X136.711 Y133.548 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.165 Y133.165 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.105 Y133.165 E.02947
; WIPE_START
M204 S4000
G1 X133.165 Y131.883 E-.48776
G1 X133.205 Y131.766 E-.04705
G1 X133.358 Y131.69 E-.06488
G1 X133.78 Y131.69 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y132.861 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y131.199 E.04321
G3 X131.77 Y130.769 I2.286 J4.931 E.03794
G1 X132.216 Y131.007 E.01314
G1 X132.258 Y131.085 E.00229
G3 X133.117 Y130.541 I1.426 J1.301 E.02676
G3 X134.66 Y130.52 I.888 J8.851 E.04014
G3 X136.005 Y131.995 I-.071 J1.416 E.05756
G3 X136.523 Y132.056 I.031 J1.968 E.01361
G3 X137.62 Y131.145 I3.214 J2.754 E.03725
G1 X137.62 Y132.808 E.04321
; WIPE_START
G1 X137.62 Y131.145 E-.63181
G1 X137.333 Y131.321 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.1 Y137.48 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X132.724 Y137.327 I-.38 J-2.864 E.03634
G2 X132.216 Y136.993 I-1.041 J1.026 E.01592
G2 X131.644 Y135.984 I-3.404 J1.264 E.03028
G3 X130.542 Y134.886 I.235 J-1.337 E.04306
; OBJECT_ID: 88
; WIPE_START
G1 X130.677 Y135.281 E-.1589
G1 X131.05 Y135.724 E-.22022
G1 X131.644 Y135.984 E-.24608
G1 X131.819 Y136.292 E-.1348
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3 F42000
G1 X120.299 Y126.299 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
M73 P62 R6
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y126.861 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y125.199 E.04321
G3 X119.77 Y124.769 I2.286 J4.931 E.03794
G1 X120.234 Y125.04 E.01397
G3 X121.068 Y124.541 I1.54 J1.625 E.02546
G3 X122.71 Y124.52 I.938 J9.423 E.04274
G3 X124.048 Y125.952 I-.064 J1.401 E.05639
G3 X124.584 Y126.035 I.099 J1.133 E.01425
G3 X125.62 Y125.145 I1.783 J1.027 E.03619
G1 X125.62 Y126.808 E.04321
; WIPE_START
G1 X125.62 Y125.145 E-.63181
G1 X125.333 Y125.321 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.93 Y131.48 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X120.681 Y131.331 I-.32 J-2.638 E.03299
G2 X120.216 Y130.993 I-1.064 J.973 E.01506
G2 X119.689 Y130.035 I-6.98 J3.217 E.02844
G3 X118.552 Y128.966 I.262 J-1.418 E.04287
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.673 Y129.324 E-.14361
G1 X119.039 Y129.765 E-.21795
G1 X119.46 Y129.988 E-.18111
G1 X119.689 Y130.035 E-.08882
G1 X119.852 Y130.331 E-.12851
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 17/38
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I.479 J1.119 P1  F42000
G1 X130.026 Y125.974 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.16 F42000
G1 X135.676 Y120.324 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.739 Y120.739 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.679 Y120.74 E.02351
M204 S250
G1 X133.14 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.08 Y121.14 E.02887
; WIPE_START
M204 S4000
G1 X133.14 Y119.883 E-.47827
G1 X133.18 Y119.765 E-.04742
G1 X133.333 Y119.69 E-.06452
G1 X133.78 Y119.69 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 17 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer17 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.38 Y120.81 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y119.147 E.04321
G3 X131.612 Y118.432 I5.791 J8.565 E.03706
G1 X131.641 Y118.38 E.00156
G1 X132.916 Y118.38 E.03312
G2 X132.673 Y118.695 I.13 J.351 E.01091
G3 X133.092 Y118.541 I.409 J.465 E.01188
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G3 X136.61 Y120.075 I.119 J1.086 E.01565
G3 X137.62 Y119.08 I2.487 J1.515 E.03724
G1 X137.62 Y120.742 E.04321
; WIPE_START
G1 X137.62 Y119.08 E-.63181
G1 X137.336 Y119.262 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.74 Y125.474 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X133.084 Y125.423 I-.465 J-11.851 E.04309
G2 X132.791 Y125.62 I.011 J.333 E.00969
G1 X131.516 Y125.62 E.03312
G1 X131.612 Y125.568 E.00284
G1 X131.861 Y125.122 E.01328
G2 X131.555 Y123.987 I-2.487 J.063 E.03083
G3 X130.532 Y122.806 I.443 J-1.417 E.04277
; OBJECT_ID: 66
; WIPE_START
G1 X130.675 Y123.303 E-.19629
G1 X131.045 Y123.745 E-.21909
G1 X131.555 Y123.987 E-.21473
G1 X131.673 Y124.308 E-.1299
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.16 F42000
G1 X135.651 Y135.651 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
; WIPE_START
M73 P63 R6
G1 X135.635 Y136.296 E-.24718
G1 X135.443 Y136.731 E-.18068
G1 X135.112 Y137.01 E-.16481
G1 X134.817 Y137.111 E-.11854
G1 X134.689 Y137.122 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.236 Y132.764 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.235 Y132.704 E.02408
; WIPE_START
G1 X136.117 Y132.764 E-.33596
G1 X136.29 Y132.79 E-.06651
G1 X136.478 Y132.887 E-.08023
G1 X136.642 Y133.082 E-.09692
G1 X136.711 Y133.358 E-.1081
G1 X136.711 Y133.548 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.165 Y133.165 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.105 Y133.165 E.02947
; WIPE_START
M204 S4000
G1 X133.165 Y131.883 E-.48776
G1 X133.205 Y131.766 E-.04705
G1 X133.358 Y131.69 E-.06488
G1 X133.78 Y131.69 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y132.81 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y131.147 E.04321
G3 X131.612 Y130.432 I5.792 J8.566 E.03706
G1 X131.641 Y130.38 E.00156
G1 X132.916 Y130.38 E.03312
G2 X132.652 Y130.733 I.15 J.387 E.01208
G3 X133.117 Y130.541 I.479 J.501 E.01339
G3 X134.66 Y130.52 I.888 J8.851 E.04014
G3 X136.005 Y131.995 I-.071 J1.416 E.05756
G3 X136.597 Y132.094 I-.032 J2.011 E.01568
G3 X137.62 Y131.08 I2.505 J1.502 E.03785
G1 X137.62 Y132.742 E.04321
; WIPE_START
G1 X137.62 Y131.08 E-.63181
G1 X137.336 Y131.262 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.747 Y137.471 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X133.092 Y137.418 I-.496 J-10.463 E.04308
G2 X132.791 Y137.62 I.01 J.342 E.00995
G1 X131.516 Y137.62 E.03312
G1 X131.612 Y137.568 E.00284
G1 X131.861 Y137.122 E.01328
G2 X131.545 Y135.96 I-2.549 J.07 E.0316
G3 X130.531 Y134.771 I.456 J-1.415 E.04277
; OBJECT_ID: 88
; WIPE_START
G1 X130.677 Y135.281 E-.20179
G1 X131.05 Y135.724 E-.22022
G1 X131.545 Y135.96 E-.20817
G1 X131.663 Y136.28 E-.12983
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.16 F42000
G1 X120.299 Y126.299 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y126.81 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y125.147 E.04321
G3 X119.612 Y124.432 I5.792 J8.566 E.03706
G1 X119.641 Y124.38 E.00156
G1 X120.916 Y124.38 E.03312
G2 X120.688 Y124.669 I.117 J.327 E.01009
G1 X121.068 Y124.541 E.01042
G3 X122.71 Y124.52 I.938 J9.423 E.04274
G3 X124.048 Y125.952 I-.064 J1.401 E.05639
G3 X124.622 Y126.055 I.105 J1.062 E.01536
G3 X125.62 Y125.08 I2.471 J1.53 E.03664
G1 X125.62 Y126.742 E.04321
; WIPE_START
G1 X125.62 Y125.08 E-.63181
G1 X125.336 Y125.262 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.732 Y131.477 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X121.076 Y131.427 I-.424 J-13.639 E.04309
G2 X120.791 Y131.62 I.011 J.324 E.00944
G1 X119.516 Y131.62 E.03312
G1 X119.612 Y131.568 E.00284
G1 X119.861 Y131.122 E.01328
G2 X119.565 Y130.015 I-2.426 J.056 E.03007
G3 X118.533 Y128.842 I.431 J-1.42 E.04278
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.673 Y129.324 E-.19074
G1 X119.039 Y129.765 E-.21795
G1 X119.565 Y130.015 E-.22137
G1 X119.684 Y130.336 E-.12995
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 18/38
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.16 I.473 J1.121 P1  F42000
G1 X130.026 Y125.974 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.32 F42000
G1 X135.676 Y120.324 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
M73 P64 R6
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.32 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 18 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer18 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.48 Y121.412 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.643 Y120.092 I-1.383 J-.048 E.04315
G3 X137.62 Y118.945 I2.907 J1.487 E.03952
G1 X137.62 Y118.38 E.01471
G1 X131.263 Y118.38 E.16522
G1 X130.38 Y119.069 E.02913
G1 X130.38 Y125.62 E.17028
G1 X131.154 Y125.62 E.02012
G1 X131.223 Y125.568 E.00226
G2 X131.629 Y124.676 I-.597 J-.809 E.0266
G1 X131.463 Y123.963 E.01902
G3 X130.524 Y122.711 I.401 J-1.28 E.04344
; OBJECT_ID: 66
; WIPE_START
G1 X130.675 Y123.303 E-.23188
G1 X131.045 Y123.745 E-.21909
G1 X131.463 Y123.963 E-.17937
G1 X131.54 Y124.296 E-.12966
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.32 F42000
G1 X135.651 Y135.651 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
; WIPE_START
G1 X135.635 Y136.296 E-.24718
G1 X135.443 Y136.731 E-.18068
G1 X135.112 Y137.01 E-.16481
G1 X134.817 Y137.111 E-.11854
G1 X134.689 Y137.122 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.236 Y132.764 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.235 Y132.704 E.02408
; WIPE_START
G1 X136.117 Y132.764 E-.33596
G1 X136.29 Y132.79 E-.06651
G1 X136.478 Y132.887 E-.08023
G1 X136.642 Y133.082 E-.09692
G1 X136.711 Y133.358 E-.1081
G1 X136.711 Y133.548 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.165 Y133.165 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.105 Y133.165 E.02947
; WIPE_START
M204 S4000
G1 X133.165 Y131.883 E-.48776
G1 X133.205 Y131.766 E-.04705
G1 X133.358 Y131.69 E-.06488
G1 X133.78 Y131.69 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.523 Y134.678 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X131.456 Y135.933 I1.329 J-.014 E.04346
G1 X131.629 Y136.676 E.01982
G3 X131.223 Y137.568 I-1.002 J.083 E.0266
G1 X131.154 Y137.62 E.00226
G1 X130.38 Y137.62 E.02012
G1 X130.38 Y131.069 E.17028
G1 X131.263 Y130.38 E.02913
G1 X137.62 Y130.38 E.16522
G1 X137.62 Y130.945 E.01471
G2 X136.633 Y132.113 I1.934 J2.638 E.04011
G3 X137.48 Y133.425 I-.528 J1.27 E.04318
; OBJECT_ID: 88
; WIPE_START
G1 X137.327 Y132.724 E-.2728
G1 X136.95 Y132.276 E-.22272
G1 X136.633 Y132.113 E-.13546
G1 X136.79 Y131.812 E-.12902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X129.158 Y131.926 Z3.32 F42000
G1 X125.974 Y131.974 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.32 F42000
G1 X120.299 Y126.299 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
M73 P64 R5
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
M73 P65 R5
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.524 Y128.743 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X119.47 Y129.991 I1.49 J-.148 E.0428
G1 X119.629 Y130.676 E.01828
G3 X119.223 Y131.568 I-1.002 J.083 E.0266
G1 X119.154 Y131.62 E.00226
G1 X118.38 Y131.62 E.02012
G1 X118.38 Y125.069 E.17028
G1 X119.263 Y124.38 E.02913
G1 X125.62 Y124.38 E.16522
G1 X125.62 Y124.945 E.01471
G2 X124.654 Y126.072 I1.928 J2.632 E.03892
G3 X125.48 Y127.398 I-.566 J1.272 E.04311
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.27823
G1 X124.961 Y126.235 E-.22045
G1 X124.654 Y126.072 E-.13214
G1 X124.811 Y125.771 E-.12918
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 19/38
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S122.4
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.32 I-.047 J1.216 P1  F42000
G1 X130.026 Y125.974 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.48 F42000
G1 X135.676 Y120.324 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.48 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 19 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer19 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.48 Y121.44 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.668 Y120.105 I-1.401 J-.062 E.04306
G3 X137.62 Y118.868 I2.532 J.965 E.04115
G1 X137.62 Y118.38 E.01271
G1 X131.016 Y118.38 E.17166
G3 X130.38 Y118.962 I-2.215 J-1.779 E.02251
G1 X130.38 Y125.62 E.17305
G1 X130.914 Y125.62 E.01389
G2 X131.41 Y123.936 I-.988 J-1.207 E.04849
G3 X130.52 Y122.652 I.54 J-1.325 E.04295
; OBJECT_ID: 66
; WIPE_START
G1 X130.675 Y123.303 E-.25404
G1 X131.045 Y123.745 E-.21909
G1 X131.41 Y123.936 E-.15681
G1 X131.441 Y124.277 E-.13006
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.48 F42000
G1 X135.651 Y135.651 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
; WIPE_START
G1 X135.236 Y136.117 E-.33596
G1 X135.21 Y136.29 E-.06651
G1 X135.113 Y136.478 E-.08023
G1 X134.918 Y136.642 E-.09693
G1 X134.642 Y136.711 E-.10809
M73 P66 R5
G1 X134.452 Y136.711 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.835 Y133.165 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.105 E.02947
; WIPE_START
M204 S4000
G1 X136.117 Y133.165 E-.48776
G1 X136.234 Y133.205 E-.04705
G1 X136.31 Y133.358 E-.06488
G1 X136.31 Y133.78 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.48 Y133.455 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.659 Y132.126 I-1.393 J-.057 E.04308
G3 X137.62 Y130.868 I2.549 J.952 E.04175
G1 X137.62 Y130.38 E.01271
G1 X131.016 Y130.38 E.17166
G3 X130.38 Y130.962 I-2.214 J-1.779 E.02251
G1 X130.38 Y137.62 E.17305
G1 X130.914 Y137.62 E.01389
G2 X131.404 Y135.906 I-.995 J-1.212 E.04929
G3 X130.52 Y134.619 I.543 J-1.32 E.04293
; OBJECT_ID: 88
; WIPE_START
G1 X130.541 Y134.883 E-.10029
G1 X130.677 Y135.281 E-.16009
G1 X131.05 Y135.724 E-.22022
G1 X131.404 Y135.906 E-.15118
G1 X131.436 Y136.242 E-.12822
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.48 F42000
G1 X120.299 Y126.299 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.52 Y128.685 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X119.417 Y129.965 I1.434 J-.05 E.04297
G3 X118.914 Y131.62 I-1.484 J.453 E.04769
G1 X118.38 Y131.62 E.01389
G1 X118.38 Y124.962 E.17305
G2 X119.016 Y124.38 I-1.578 J-2.361 E.02251
G1 X125.62 Y124.38 E.17166
G1 X125.62 Y124.868 E.01271
G2 X124.677 Y126.084 I1.574 J2.196 E.04056
G3 X125.48 Y127.424 I-.605 J1.273 E.04304
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.28783
G1 X124.961 Y126.235 E-.22045
G1 X124.677 Y126.084 E-.12234
G1 X124.807 Y125.77 E-.12916
G1 X124.807 Y125.77 E-.00022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 20/38
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.48 I-.048 J1.216 P1  F42000
G1 X130.026 Y125.974 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.64 F42000
G1 X135.676 Y120.324 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 20 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer20 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.48 Y121.457 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.684 Y120.113 I-1.413 J-.071 E.04301
G3 X137.429 Y118.878 I2.614 J.735 E.03796
G2 X137.62 Y118.38 I-.135 J-.338 E.01558
G1 X130.82 Y118.38 E.17676
G3 X130.38 Y118.798 I-2.021 J-1.684 E.01582
G1 X130.38 Y125.62 E.17731
G1 X130.718 Y125.62 E.00879
G2 X131.362 Y123.91 I-1.152 J-1.41 E.04975
G3 X130.52 Y122.597 I.577 J-1.296 E.04292
; OBJECT_ID: 66
; WIPE_START
G1 X130.541 Y122.908 E-.11821
G1 X130.675 Y123.303 E-.15852
G1 X131.045 Y123.745 E-.21909
G1 X131.362 Y123.91 E-.13591
G1 X131.396 Y124.23 E-.12217
G1 X131.394 Y124.246 E-.0061
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.64 F42000
G1 X135.651 Y135.651 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
M73 P67 R5
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.48 Y133.475 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.677 Y132.135 I-1.407 J-.067 E.04303
G3 X137.429 Y130.878 I2.63 J.72 E.03856
G2 X137.62 Y130.38 I-.135 J-.338 E.01558
G1 X130.819 Y130.38 E.17676
G3 X130.38 Y130.798 I-2.02 J-1.683 E.01582
G1 X130.38 Y137.62 E.17731
G1 X130.718 Y137.62 E.00879
G2 X131.359 Y135.883 I-1.157 J-1.414 E.05047
G3 X130.52 Y134.568 I.579 J-1.294 E.04291
; OBJECT_ID: 88
; WIPE_START
G1 X130.541 Y134.883 E-.11965
G1 X130.677 Y135.281 E-.16009
G1 X131.05 Y135.724 E-.22022
G1 X131.359 Y135.883 E-.13177
G1 X131.395 Y136.219 E-.12827
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.64 F42000
G1 X120.299 Y126.299 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.52 Y128.626 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X119.365 Y129.938 I1.419 J.014 E.04293
G3 X118.718 Y131.62 I-1.795 J.276 E.04903
G1 X118.38 Y131.62 E.00879
G1 X118.38 Y124.798 E.17731
G2 X118.82 Y124.38 I-1.581 J-2.101 E.01582
G1 X125.62 Y124.38 E.17676
G3 X125.429 Y124.878 I-.327 J.161 E.01558
G2 X124.691 Y126.091 I1.862 J1.965 E.03736
G3 X125.48 Y127.44 I-.63 J1.274 E.04299
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.29368
G1 X124.961 Y126.235 E-.22045
G1 X124.691 Y126.091 E-.11638
G1 X124.79 Y125.77 E-.12781
G1 X124.792 Y125.766 E-.00168
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 21/38
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.64 I-.048 J1.216 P1  F42000
G1 X130.026 Y125.974 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.8 F42000
G1 X135.676 Y120.324 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
M73 P68 R5
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 21 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer21 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.48 Y121.465 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.69 Y120.117 I-1.418 J-.075 E.04299
G3 X137.62 Y118.55 I2.768 J.584 E.04821
G1 X137.62 Y118.38 E.00443
G1 X130.648 Y118.38 E.18121
G3 X130.38 Y118.656 I-2.587 J-2.248 E.01003
G1 X130.38 Y125.62 E.18101
G1 X130.55 Y125.62 E.00442
G2 X131.331 Y123.894 I-1.375 J-1.662 E.05098
G3 X130.52 Y122.562 I.607 J-1.282 E.0429
; OBJECT_ID: 66
; WIPE_START
G1 X130.541 Y122.908 E-.13139
G1 X130.675 Y123.303 E-.15852
G1 X131.045 Y123.745 E-.21909
G1 X131.331 Y123.894 E-.12271
G1 X131.333 Y124.23 E-.12757
G1 X131.332 Y124.232 E-.00073
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.8 F42000
G1 X135.651 Y135.651 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.48 Y133.485 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.685 Y132.14 I-1.413 J-.072 E.043
G3 X137.62 Y130.55 I2.773 J.561 E.04882
G1 X137.62 Y130.38 E.00443
G1 X130.648 Y130.38 E.18121
G3 X130.38 Y130.656 I-2.586 J-2.247 E.01002
G1 X130.38 Y137.62 E.18101
G1 X130.55 Y137.62 E.00442
G2 X131.331 Y135.868 I-1.378 J-1.664 E.05165
G3 X130.52 Y134.537 I.607 J-1.282 E.04289
; OBJECT_ID: 88
; WIPE_START
G1 X130.541 Y134.883 E-.13159
G1 X130.677 Y135.281 E-.16009
G1 X131.05 Y135.724 E-.22022
G1 X131.331 Y135.868 E-.11981
G1 X131.333 Y136.206 E-.1283
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.8 F42000
G1 X120.299 Y126.299 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
M73 P69 R5
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.52 Y128.588 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X119.331 Y129.92 I1.417 J.05 E.04291
G3 X118.55 Y131.62 I-2.155 J.04 E.05031
G1 X118.38 Y131.62 E.00442
G1 X118.38 Y124.656 E.18101
G2 X118.648 Y124.38 I-2.317 J-2.523 E.01002
G1 X125.62 Y124.38 E.18121
G1 X125.62 Y124.55 E.00443
G2 X124.695 Y126.094 I1.839 J2.151 E.0476
G3 X125.48 Y127.445 I-.638 J1.274 E.04298
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.29558
G1 X124.961 Y126.235 E-.22045
G1 X124.695 Y126.094 E-.11445
G1 X124.762 Y125.77 E-.12561
G1 X124.766 Y125.761 E-.00392
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 22/38
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.049 J1.216 P1  F42000
G1 X130.026 Y125.974 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z3.96 F42000
G1 X135.676 Y120.324 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 22 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer22 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.62 Y120.047 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y118.384 E.04321
G2 X136.687 Y120.115 I1.667 J2.016 E.0524
G3 X137.48 Y121.315 I-.667 J1.303 E.03909
G1 X137.48 Y122.673 E.0353
G3 X136.024 Y124.024 I-1.354 J0 E.05794
G3 X134.908 Y125.459 I-1.42 J.048 E.05129
G3 X133.315 Y125.48 I-.913 J-9.137 E.04144
G3 X131.976 Y124.024 I.067 J-1.405 E.05702
G3 X131.314 Y123.886 I-.119 J-1.086 E.01787
G3 X130.391 Y125.62 I-2.563 J-.251 E.05241
G1 X130.38 Y123.969 E.04292
; OBJECT_ID: 66
; WIPE_START
G1 X130.391 Y125.62 E-.62748
G1 X130.628 Y125.365 E-.13252
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z3.96 F42000
G1 X135.651 Y135.651 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
M73 P70 R5
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y132.047 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y130.384 E.04321
G2 X136.684 Y132.139 I1.667 J2.017 E.05303
G3 X137.48 Y133.34 I-.664 J1.304 E.03915
G1 X137.48 Y134.648 E.034
G3 X136.005 Y136.005 I-1.421 J-.065 E.05779
G3 X134.883 Y137.459 I-1.427 J.059 E.05186
G3 X133.34 Y137.48 I-.888 J-8.851 E.04014
G3 X131.995 Y136.005 I.071 J-1.416 E.05756
G3 X131.317 Y135.861 I0 J-1.677 E.01816
G3 X130.391 Y137.62 I-2.566 J-.227 E.05304
G1 X130.38 Y135.969 E.04292
; OBJECT_ID: 88
; WIPE_START
G1 X130.391 Y137.62 E-.62748
G1 X130.628 Y137.365 E-.13252
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z3.96 F42000
G1 X120.299 Y126.299 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y129.969 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.391 Y131.62 E.04292
G2 X119.312 Y129.91 I-1.641 J-1.987 E.05177
G2 X119.952 Y130.048 I.535 J-.927 E.01729
G2 X121.29 Y131.48 I1.402 J.03 E.05639
G2 X122.932 Y131.459 I.704 J-9.443 E.04274
G2 X124.048 Y130.048 I-.301 J-1.384 E.05066
G2 X125.48 Y128.698 I.08 J-1.349 E.05727
G1 X125.48 Y127.29 E.03659
G2 X124.689 Y126.091 I-1.46 J.102 E.03903
G3 X125.62 Y124.384 I2.599 J.311 E.05177
G1 X125.62 Y126.047 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.62 Y124.384 E-.63181
G1 X125.39 Y124.631 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 23/38
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.96 I-.339 J1.169 P1  F42000
G1 X130.026 Y125.974 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.12 F42000
G1 X135.676 Y120.324 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
M73 P70 R4
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 23 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer23 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X135.745 Y119.045 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X136.024 Y119.976 I-1.107 J.839 E.02583
G3 X136.671 Y120.107 I.12 J1.079 E.01745
G3 X137.466 Y118.38 I2.194 J-.037 E.05111
G1 X137.62 Y118.38 E.00401
G1 X137.62 Y125.359 E.1814
G2 X137.368 Y125.62 I2.443 J2.615 E.00945
G1 X130.38 Y125.62 E.18163
G1 X130.38 Y125.466 E.00403
G2 X131.31 Y123.883 I-1.821 J-2.135 E.0486
G2 X131.976 Y124.024 I.548 J-.949 E.01801
G2 X132.245 Y124.936 I1.36 J.095 E.02526
; OBJECT_ID: 66
; WIPE_START
G1 X132.034 Y124.532 E-.17349
G1 X131.976 Y124.024 E-.19428
G1 X131.641 Y124.009 E-.12772
G1 X131.31 Y123.883 E-.13449
G1 X131.244 Y124.219 E-.13002
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
M73 P71 R4
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z4.12 F42000
G1 X135.651 Y135.651 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.254 Y136.907 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X131.995 Y136.005 I1.459 J-.906 E.0247
G3 X131.314 Y135.86 I0 J-1.674 E.01823
G3 X130.38 Y137.465 I-2.756 J-.53 E.04921
G1 X130.38 Y137.62 E.00403
G1 X137.368 Y137.62 E.18163
G3 X137.62 Y137.359 I2.695 J2.354 E.00945
G1 X137.62 Y130.38 E.1814
G1 X137.466 Y130.38 E.00401
G2 X136.671 Y132.132 I1.402 J1.693 E.05178
G2 X136.005 Y131.995 I-.668 J1.56 E.01781
G2 X135.739 Y131.079 I-1.731 J.005 E.02513
; OBJECT_ID: 88
; WIPE_START
G1 X135.944 Y131.477 E-.17013
G1 X136.005 Y131.995 E-.1984
G1 X136.356 Y132.016 E-.13387
G1 X136.671 Y132.132 E-.12757
G1 X136.673 Y131.79 E-.13003
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X129.041 Y131.921 Z4.12 F42000
G1 X125.974 Y131.974 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.12 F42000
G1 X120.299 Y126.299 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.733 Y125.012 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X123.765 Y125.039 E.00108
G3 X124.048 Y125.952 I-1.085 J.836 E.02538
G3 X124.671 Y126.081 I.106 J1.057 E.01681
G3 X125.466 Y124.38 I2.193 J-.012 E.05045
G1 X125.62 Y124.38 E.00401
G1 X125.62 Y131.359 E.1814
G2 X125.368 Y131.62 I2.443 J2.615 E.00945
G1 X118.38 Y131.62 E.18163
G1 X118.38 Y131.465 E.00403
G2 X119.305 Y129.906 I-1.822 J-2.136 E.04799
G2 X119.952 Y130.048 I.542 J-.927 E.0175
G2 X120.246 Y130.971 I1.294 J.096 E.0258
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X120.012 Y130.54 E-.18644
G1 X119.952 Y130.048 E-.1883
G1 X119.634 Y130.032 E-.12097
G1 X119.305 Y129.906 E-.13386
G1 X119.241 Y130.23 E-.12535
G1 X119.236 Y130.242 E-.00508
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 24/38
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.12 I.448 J1.132 P1  F42000
G1 X130.026 Y125.974 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.28 F42000
G1 X135.676 Y120.324 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
M73 P72 R4
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.28 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 24 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer24 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X135.72 Y119.023 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X135.745 Y119.045 E.00086
G3 X136.024 Y119.976 I-1.107 J.839 E.02583
G3 X136.642 Y120.092 I.12 J1.072 E.01659
G3 X137.299 Y118.38 I1.83 J-.28 E.04987
G1 X137.62 Y118.38 E.00834
G1 X137.62 Y125.215 E.17766
G2 X137.198 Y125.62 I1.635 J2.125 E.01524
G1 X130.38 Y125.62 E.17722
G3 X130.584 Y125.122 I.335 J-.154 E.0157
G2 X131.315 Y123.886 I-1.866 J-1.938 E.03778
G2 X131.976 Y124.024 I.542 J-.948 E.01784
G2 X132.248 Y124.942 I1.368 J.095 E.02543
; OBJECT_ID: 66
; WIPE_START
G1 X132.034 Y124.532 E-.17588
G1 X131.976 Y124.024 E-.19428
G1 X131.641 Y124.009 E-.12772
G1 X131.315 Y123.886 E-.13212
G1 X131.217 Y124.214 E-.13
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z4.28 F42000
G1 X135.651 Y135.651 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.258 Y136.914 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X131.995 Y136.005 I1.462 J-.914 E.02493
G3 X131.322 Y135.864 I.001 J-1.685 E.01801
G3 X130.584 Y137.122 I-2.613 J-.687 E.03838
G2 X130.38 Y137.62 I.131 J.345 E.0157
G1 X137.198 Y137.62 E.17722
G3 X137.62 Y137.215 I2.057 J1.72 E.01524
G1 X137.62 Y130.38 E.17766
G1 X137.299 Y130.38 E.00834
G2 X136.645 Y132.119 I1.177 J1.436 E.05059
G2 X136.005 Y131.995 I-.648 J1.637 E.01704
G2 X135.725 Y131.052 I-1.757 J.007 E.02591
; OBJECT_ID: 88
; WIPE_START
G1 X135.944 Y131.477 E-.18145
G1 X136.005 Y131.995 E-.1984
G1 X136.356 Y132.016 E-.13387
G1 X136.645 Y132.119 E-.11634
G1 X136.611 Y131.779 E-.12994
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.98 Y131.919 Z4.28 F42000
G1 X125.974 Y131.974 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.28 F42000
G1 X120.299 Y126.299 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
M73 P73 R4
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.705 Y124.989 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X123.765 Y125.039 E.00202
G3 X124.048 Y125.952 I-1.085 J.836 E.02538
G3 X124.639 Y126.064 I.106 J1.054 E.01586
G3 X125.299 Y124.38 I1.828 J-.255 E.04915
G1 X125.62 Y124.38 E.00834
G1 X125.62 Y131.215 E.17766
G2 X125.198 Y131.62 I1.635 J2.125 E.01524
G1 X118.38 Y131.62 E.17722
G3 X118.584 Y131.122 I.335 J-.154 E.0157
G2 X119.309 Y129.908 I-1.859 J-1.933 E.03718
G2 X119.952 Y130.048 I.538 J-.927 E.01739
G2 X120.249 Y130.973 I1.29 J.096 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X120.012 Y130.54 E-.18784
G1 X119.952 Y130.048 E-.1883
G1 X119.634 Y130.032 E-.12097
G1 X119.309 Y129.908 E-.13236
G1 X119.212 Y130.23 E-.12764
G1 X119.209 Y130.237 E-.00289
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 25/38
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.28 I.446 J1.132 P1  F42000
G1 X130.026 Y125.974 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.44 F42000
G1 X135.676 Y120.324 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.44 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 25 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer25 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X135.679 Y118.99 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X135.745 Y119.045 E.00223
G3 X136.024 Y119.976 I-1.107 J.839 E.02583
G3 X136.595 Y120.067 I.117 J1.106 E.01522
G3 X137.107 Y118.38 I1.515 J-.462 E.04861
G1 X137.62 Y118.38 E.01335
G1 X137.62 Y125.049 E.17335
G2 X137.005 Y125.62 I1.676 J2.422 E.02189
G1 X130.38 Y125.62 E.17221
G1 X130.38 Y125.144 E.01237
G2 X131.33 Y123.894 I-1.583 J-2.19 E.04143
G2 X131.976 Y124.024 I.527 J-.948 E.01741
G2 X132.256 Y124.956 I1.332 J.109 E.02591
; OBJECT_ID: 66
; WIPE_START
G1 X132.034 Y124.532 E-.18222
G1 X131.976 Y124.024 E-.19428
G1 X131.641 Y124.009 E-.12772
G1 X131.33 Y123.894 E-.12578
G1 X131.202 Y124.211 E-.13
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z4.44 F42000
G1 X135.651 Y135.651 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
M73 P74 R4
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.266 Y136.931 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X131.995 Y136.005 I1.47 J-.933 E.02543
G3 X131.339 Y135.873 I.004 J-1.717 E.01752
G3 X130.38 Y137.144 I-2.55 J-.926 E.04202
G1 X130.38 Y137.62 E.01237
G1 X137.005 Y137.62 E.17221
G3 X137.62 Y137.049 I2.291 J1.851 E.02189
G1 X137.62 Y130.38 E.17335
G1 X137.107 Y130.38 E.01336
G2 X136.601 Y132.096 I1.011 J1.23 E.0494
G2 X136.005 Y131.995 I-.625 J1.878 E.01579
G2 X135.724 Y131.05 I-1.759 J.008 E.02597
G1 X135.688 Y131.02 E.00122
; OBJECT_ID: 88
; WIPE_START
G1 X135.724 Y131.05 E-.01783
G1 X135.944 Y131.477 E-.18221
G1 X136.005 Y131.995 E-.1984
G1 X136.601 Y132.096 E-.22993
G1 X136.573 Y131.751 E-.13163
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.942 Y131.911 Z4.44 F42000
G1 X125.974 Y131.974 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.44 F42000
G1 X120.299 Y126.299 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.662 Y124.953 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X124.048 Y125.952 I-1.334 J1.09 E.02831
G3 X124.589 Y126.038 I.1 J1.117 E.01439
G3 X125.107 Y124.38 I1.514 J-.438 E.04782
G1 X125.62 Y124.38 E.01335
G1 X125.62 Y131.049 E.17335
G2 X125.005 Y131.62 I1.676 J2.422 E.02189
G1 X118.38 Y131.62 E.17221
G1 X118.38 Y131.144 E.01237
G2 X119.322 Y129.915 I-1.577 J-2.184 E.04083
G2 X119.952 Y130.048 I.525 J-.927 E.01701
G2 X120.261 Y130.983 I1.277 J.097 E.02626
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X120.012 Y130.54 E-.19304
G1 X119.952 Y130.048 E-.1883
G1 X119.634 Y130.032 E-.12097
G1 X119.322 Y129.915 E-.12682
G1 X119.194 Y130.23 E-.12908
G1 X119.192 Y130.234 E-.00179
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 26/38
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.44 I.445 J1.133 P1  F42000
G1 X130.026 Y125.974 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.6 F42000
G1 X135.676 Y120.324 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
M73 P75 R4
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 26 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer26 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X135.636 Y118.953 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X136.024 Y119.976 I-1.315 J1.084 E.02895
G3 X136.545 Y120.041 I.094 J1.378 E.01374
G1 X136.388 Y119.324 E.01908
G3 X136.805 Y118.432 I1.033 J-.06 E.02668
G1 X136.873 Y118.38 E.00224
G1 X137.62 Y118.38 E.01941
G1 X137.62 Y124.941 E.17053
G1 X136.765 Y125.62 E.0284
G1 X130.38 Y125.62 E.16595
G1 X130.38 Y125.022 E.01556
G2 X131.354 Y123.906 I-1.51 J-2.302 E.03897
G2 X131.976 Y124.024 I.502 J-.955 E.01671
G2 X132.277 Y124.974 I1.304 J.11 E.02657
; OBJECT_ID: 66
; WIPE_START
G1 X132.034 Y124.532 E-.19169
G1 X131.976 Y124.024 E-.19428
G1 X131.641 Y124.009 E-.12772
G1 X131.354 Y123.906 E-.11567
G1 X131.197 Y124.212 E-.13064
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z4.6 F42000
G1 X135.651 Y135.651 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.282 Y136.955 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X131.995 Y136.005 I1.153 J-.866 E.02634
G3 X131.364 Y135.886 I.011 J-1.792 E.01678
G3 X130.38 Y137.022 I-2.502 J-1.174 E.03957
G1 X130.38 Y137.62 E.01556
G1 X136.765 Y137.62 E.16595
G1 X137.62 Y136.941 E.0284
G1 X137.62 Y130.38 E.17053
G1 X136.873 Y130.38 E.01941
G1 X136.805 Y130.432 E.00224
G2 X136.388 Y131.324 I.616 J.832 E.02668
G1 X136.552 Y132.071 E.01988
G2 X136.005 Y131.995 I-.652 J2.696 E.01437
G2 X135.646 Y130.984 I-1.341 J-.093 E.02869
; OBJECT_ID: 88
; WIPE_START
G1 X135.944 Y131.477 E-.21875
G1 X136.005 Y131.995 E-.1984
G1 X136.552 Y132.071 E-.20981
G1 X136.476 Y131.729 E-.13304
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.846 Y131.907 Z4.6 F42000
G1 X125.974 Y131.974 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.6 F42000
G1 X120.299 Y126.299 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
M73 P76 R4
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.618 Y124.916 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X124.048 Y125.952 I-1.193 J1.103 E.02976
G3 X124.539 Y126.011 I.098 J1.244 E.01293
G1 X124.388 Y125.324 E.01829
G3 X124.805 Y124.432 I1.033 J-.06 E.02668
G1 X124.874 Y124.38 E.00224
G1 X125.62 Y124.38 E.01941
G1 X125.62 Y130.941 E.17053
G1 X124.765 Y131.62 E.0284
G1 X118.38 Y131.62 E.16595
G1 X118.38 Y131.022 E.01556
G2 X119.344 Y129.927 I-1.504 J-2.295 E.03838
G2 X119.952 Y130.048 I.502 J-.932 E.01637
G2 X120.28 Y130.999 I1.26 J.097 E.02688
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X120.012 Y130.54 E-.20187
G1 X119.952 Y130.048 E-.1883
G1 X119.634 Y130.032 E-.12097
G1 X119.344 Y129.927 E-.11748
G1 X119.188 Y130.23 E-.1295
G1 X119.185 Y130.234 E-.00188
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 27/38
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
M106 S119.85
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I.445 J1.133 P1  F42000
G1 X130.026 Y125.974 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.76 F42000
G1 X135.676 Y120.324 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 27 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer27 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.454 Y121.21 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.455 Y120.015 I-1.264 J.042 E.04361
G3 X136.173 Y118.878 I2.007 J-1.102 E.03079
G1 X136.439 Y118.432 E.0135
G1 X136.532 Y118.38 E.00276
G1 X135.16 Y118.38 E.03566
G3 X134.886 Y118.57 I-.305 J-.146 E.00906
G2 X133.23 Y118.529 I-1.134 J12.347 E.04309
; WIPE_START
G1 X134.685 Y118.52 E-.55288
G1 X134.886 Y118.57 E-.0788
G1 X135.16 Y118.38 E-.12662
G1 X135.164 Y118.38 E-.00171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y123.268 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X130.38 Y124.931 E.04321
G2 X131.387 Y123.923 I-1.502 J-2.509 E.0374
G2 X131.976 Y124.024 I.471 J-.982 E.01575
G2 X133.315 Y125.48 I1.405 J.051 E.05702
G2 X134.908 Y125.459 I.679 J-9.158 E.04144
G1 X135.266 Y125.338 E.00984
G3 X135.036 Y125.62 I-.364 J-.062 E.00991
G1 X136.408 Y125.62 E.03566
G1 X136.439 Y125.568 E.00159
G2 X137.62 Y124.862 I-4.783 J-9.337 E.03579
G1 X137.62 Y123.199 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X137.62 Y124.862 E-.63181
G1 X137.331 Y125.035 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z4.76 F42000
G1 X132.349 Y135.651 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
M73 P76 R3
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
M204 S10000
G1 X132.764 Y135.236 F42000
G1 F9000
M204 S4000
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
M73 P77 R3
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.765 Y135.296 E.02408
M204 S250
G1 X133.165 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.895 E.02947
; WIPE_START
M204 S4000
G1 X131.883 Y134.835 E-.48776
G1 X131.766 Y134.795 E-.04705
G1 X131.69 Y134.642 E-.06488
G1 X131.69 Y134.22 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y135.268 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y136.931 E.04321
G2 X131.399 Y135.903 I-1.508 J-2.516 E.038
G2 X131.995 Y136.005 I.625 J-1.879 E.01579
G2 X133.34 Y137.48 I1.416 J.059 E.05756
G2 X134.883 Y137.459 I.654 J-8.872 E.04014
G1 X135.273 Y137.326 E.01072
G3 X135.036 Y137.62 I-.378 J-.062 E.01027
G1 X136.408 Y137.62 E.03566
G1 X136.439 Y137.568 E.00159
G2 X137.62 Y136.862 I-4.783 J-9.337 E.03579
G1 X137.62 Y135.199 E.04321
; WIPE_START
G1 X137.62 Y136.862 E-.63181
G1 X137.331 Y137.035 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.456 Y133.245 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F12000
M204 S4000
G2 X136.465 Y132.042 I-1.27 J.037 E.04361
G3 X136.173 Y130.878 I2.054 J-1.134 E.03155
G1 X136.439 Y130.432 E.0135
G1 X136.532 Y130.38 E.00276
G1 X135.16 Y130.38 E.03566
G3 X134.878 Y130.574 I-.312 J-.151 E.0093
G2 X133.223 Y130.532 I-1.108 J10.846 E.04309
; OBJECT_ID: 88
; WIPE_START
G1 X134.66 Y130.52 E-.54618
G1 X134.878 Y130.574 E-.08546
G1 X135.156 Y130.382 E-.12836
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X127.636 Y131.686 Z4.76 F42000
G1 X125.974 Y131.974 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.76 F42000
G1 X120.299 Y126.299 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.38 Y129.268 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X118.38 Y130.931 E.04321
G2 X119.374 Y129.943 I-1.498 J-2.504 E.03679
G2 X119.952 Y130.048 I.472 J-.954 E.01546
G2 X121.29 Y131.48 I1.402 J.03 E.05639
G1 X122.699 Y131.48 E.0366
G2 X123.259 Y131.349 I.012 J-1.217 E.01511
G3 X123.036 Y131.62 I-.351 J-.061 E.00955
G1 X124.408 Y131.62 E.03566
G3 X125.62 Y130.862 I15.149 J22.852 E.03718
G1 X125.62 Y124.38 E.16847
G1 X124.532 Y124.38 E.02829
G1 X124.44 Y124.432 E.00276
G1 X124.173 Y124.878 E.0135
G2 X124.446 Y125.988 I2.233 J.04 E.03003
G3 X125.452 Y127.175 I-.265 J1.245 E.04353
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.19327
G1 X124.961 Y126.235 E-.22045
G1 X124.446 Y125.988 E-.21722
G1 X124.332 Y125.668 E-.12906
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 28/38
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.76 I-.065 J1.215 P1  F42000
G1 X130.026 Y125.974 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z4.92 F42000
G1 X135.676 Y120.324 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 28 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer28 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.426 Y121.096 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.359 Y119.991 I-1.293 J.182 E.04265
G3 X135.784 Y118.946 I3.2 J-2.442 E.03113
G2 X133.807 Y118.52 I-1.538 J2.338 E.05376
; WIPE_START
G1 X134.685 Y118.52 E-.33335
G1 X135.297 Y118.671 E-.23974
G1 X135.725 Y118.913 E-.18691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y123.2 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X130.38 Y124.862 E.04321
G2 X131.423 Y123.942 I-.771 J-1.927 E.03687
G2 X131.976 Y124.024 I.44 J-1.073 E.01467
G2 X133.315 Y125.48 I1.405 J.051 E.05702
G2 X134.908 Y125.459 I.679 J-9.158 E.04144
G2 X135.737 Y124.962 I-.228 J-1.32 E.02571
G1 X135.784 Y125.054 E.00268
G1 X136.23 Y125.268 E.01286
G2 X137.62 Y124.808 I-1.176 J-5.885 E.03816
G1 X137.62 Y123.145 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X137.62 Y124.808 E-.63181
G1 X137.308 Y124.935 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z4.92 F42000
G1 X132.349 Y135.651 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
M73 P78 R3
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
M204 S10000
G1 X132.764 Y135.236 F42000
G1 F9000
M204 S4000
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.765 Y135.296 E.02408
M204 S250
G1 X133.165 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.895 E.02947
; WIPE_START
M204 S4000
G1 X131.883 Y134.835 E-.48776
G1 X131.766 Y134.795 E-.04705
G1 X131.69 Y134.642 E-.06488
G1 X131.69 Y134.22 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y135.2 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y136.862 E.04321
G2 X131.436 Y135.922 I-.793 J-1.955 E.03747
G2 X131.995 Y136.005 I.633 J-2.366 E.01474
G2 X133.34 Y137.48 I1.416 J.059 E.05756
G2 X134.883 Y137.459 I.654 J-8.872 E.04014
G2 X135.727 Y136.944 I-.683 J-2.07 E.02594
G1 X135.784 Y137.054 E.00322
G1 X136.23 Y137.268 E.01286
G2 X137.62 Y136.808 I-1.176 J-5.885 E.03816
G1 X137.62 Y135.145 E.04321
; WIPE_START
G1 X137.62 Y136.808 E-.63181
G1 X137.308 Y136.935 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.429 Y133.136 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F12000
M204 S4000
G2 X136.356 Y132.016 I-1.296 J.167 E.04316
G3 X135.784 Y130.946 I7.143 J-4.509 E.03157
G2 X133.741 Y130.52 I-1.584 J2.485 E.05545
; OBJECT_ID: 88
; WIPE_START
G1 X134.66 Y130.52 E-.34932
G1 X135.276 Y130.672 E-.24129
G1 X135.669 Y130.884 E-.16939
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.084 Y131.736 Z4.92 F42000
G1 X125.974 Y131.974 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z4.92 F42000
G1 X120.299 Y126.299 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
; WIPE_START
G1 X120.714 Y125.883 E-.31705
G1 X120.742 Y125.702 E-.06942
G1 X120.841 Y125.517 E-.07974
G1 X121.035 Y125.356 E-.09594
G1 X121.308 Y125.289 E-.10671
G1 X121.548 Y125.289 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.885 Y128.885 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y129.145 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y130.808 E.04321
G3 X124.23 Y131.268 I-2.567 J-5.425 E.03816
G1 X123.784 Y131.054 E.01286
G1 X123.745 Y130.978 E.00222
G3 X122.932 Y131.459 I-1.033 J-.818 E.0251
G3 X121.29 Y131.48 I-.938 J-9.423 E.04274
G3 X119.952 Y130.048 I.064 J-1.401 E.05639
G3 X119.411 Y129.962 I-.1 J-1.118 E.01438
G3 X118.38 Y130.862 I-1.781 J-1 E.03628
G1 X118.38 Y129.2 E.04321
; WIPE_START
G1 X118.38 Y130.862 E-.63181
G1 X118.666 Y130.684 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.876 Y124.52 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X123.319 Y124.669 I.417 J3.037 E.03806
G2 X123.784 Y124.946 I.788 J-.792 E.01422
G2 X124.325 Y125.966 I6.915 J-3.014 E.03002
G3 X125.422 Y127.056 I-.262 J1.361 E.04265
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X125.331 Y126.681 E-.14634
G1 X124.961 Y126.235 E-.22045
G1 X124.54 Y126.012 E-.1811
G1 X124.325 Y125.966 E-.08367
G1 X124.166 Y125.667 E-.12844
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 29/38
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S122.4
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.92 I-.064 J1.215 P1  F42000
G1 X130.026 Y125.974 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.08 F42000
G1 X135.676 Y120.324 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
M73 P79 R3
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 29 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer29 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.399 Y120.987 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X136.228 Y119.986 I-1.302 J.337 E.04264
G1 X136.011 Y119.689 E.00955
G2 X135.297 Y118.671 I-1.327 J.17 E.03361
G1 X134.933 Y118.581 E.00976
; WIPE_START
G1 X135.297 Y118.671 E-.14273
G1 X135.745 Y119.045 E-.22161
G1 X135.966 Y119.468 E-.18164
G1 X136.011 Y119.689 E-.08555
G1 X136.211 Y119.962 E-.12847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y123.09 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X137.62 Y124.753 E.04321
G1 X136.676 Y125.006 E.02541
G3 X135.881 Y124.694 I-.131 J-.835 E.02325
G3 X134.908 Y125.459 I-1.349 J-.714 E.03316
G3 X133.315 Y125.48 I-.913 J-9.137 E.04144
G3 X131.976 Y124.024 I.067 J-1.405 E.05702
G3 X131.47 Y123.966 I-.111 J-1.291 E.01334
G3 X130.38 Y124.794 I-1.676 J-1.075 E.03632
G1 X130.38 Y123.132 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X130.38 Y124.794 E-.63181
G1 X130.68 Y124.641 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z5.08 F42000
G1 X135.651 Y135.651 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y135.09 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y136.753 E.04321
G1 X136.676 Y137.005 E.02541
G3 X135.863 Y136.68 I-.128 J-.858 E.02386
G3 X134.883 Y137.459 I-1.356 J-.699 E.03355
G3 X133.34 Y137.48 I-.888 J-8.851 E.04014
G3 X131.995 Y136.005 I.071 J-1.416 E.05756
G3 X131.485 Y135.946 I-.031 J-1.964 E.01339
G3 X130.38 Y136.794 I-1.712 J-1.085 E.03697
G1 X130.38 Y135.132 E.04321
; WIPE_START
G1 X130.38 Y136.794 E-.63181
G1 X130.68 Y136.641 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.873 Y130.573 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X135.985 Y131.654 I-.271 J1.391 E.04264
G1 X136.243 Y132.006 E.01135
G3 X137.402 Y133.026 I-.168 J1.36 E.04264
; OBJECT_ID: 88
; WIPE_START
G1 X137.327 Y132.724 E-.11838
G1 X136.95 Y132.276 E-.22272
G1 X136.523 Y132.056 E-.1822
G1 X136.243 Y132.006 E-.10823
G1 X136.043 Y131.733 E-.12848
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.413 Y131.915 Z5.08 F42000
G1 X125.974 Y131.974 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
M73 P80 R3
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.08 F42000
G1 X120.299 Y126.299 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
; WIPE_START
G1 X120.714 Y125.883 E-.31705
G1 X120.742 Y125.702 E-.06942
G1 X120.841 Y125.517 E-.07974
G1 X121.035 Y125.356 E-.09594
G1 X121.308 Y125.289 E-.10671
G1 X121.548 Y125.289 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.885 Y128.885 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y129.09 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y130.753 E.04321
G1 X124.676 Y131.005 E.02541
G3 X123.9 Y130.707 I-.133 J-.813 E.02266
G3 X122.932 Y131.459 I-1.342 J-.728 E.03277
G3 X121.29 Y131.48 I-.938 J-9.423 E.04274
G3 X119.952 Y130.048 I.064 J-1.401 E.05639
G3 X119.46 Y129.988 I-.098 J-1.248 E.01297
G3 X118.38 Y130.794 I-2.16 J-1.768 E.03539
G1 X118.38 Y129.132 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y130.794 E-.63181
G1 X118.68 Y130.641 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 30/38
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.08 I.463 J1.125 P1  F42000
G1 X130.026 Y125.974 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.24 F42000
G1 X135.676 Y120.324 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 30 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer30 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X137.62 Y123.05 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y124.713 E.04321
G3 X137.122 Y124.838 I-.59 J-1.299 E.01343
G3 X135.971 Y124.511 I-.229 J-1.382 E.03213
G3 X134.908 Y125.459 I-1.295 J-.381 E.03903
G3 X133.315 Y125.48 I-.913 J-9.137 E.04144
G3 X131.976 Y124.024 I.067 J-1.405 E.05702
G3 X131.54 Y123.984 I-.119 J-1.107 E.01146
G3 X130.38 Y124.748 I-1.621 J-1.199 E.03687
G1 X130.38 Y123.085 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X130.38 Y124.748 E-.63181
G1 X130.692 Y124.62 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z5.24 F42000
G1 X135.651 Y135.651 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
M73 P81 R3
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.62 Y135.05 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X137.62 Y136.713 E.04321
G3 X137.122 Y136.838 I-.59 J-1.299 E.01343
G3 X135.951 Y136.494 I-.228 J-1.388 E.03282
G3 X134.883 Y137.459 I-1.299 J-.363 E.03947
G3 X133.34 Y137.48 I-.888 J-8.851 E.04014
G3 X131.995 Y136.005 I.071 J-1.416 E.05756
G3 X131.558 Y135.963 I-.028 J-2.027 E.01144
G3 X130.38 Y136.748 I-1.658 J-1.213 E.03756
G1 X130.38 Y135.085 E.04321
; OBJECT_ID: 88
; WIPE_START
G1 X130.38 Y136.748 E-.63181
G1 X130.692 Y136.62 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.24 F42000
G1 X120.299 Y126.299 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
; WIPE_START
G1 X120.714 Y125.883 E-.31705
G1 X120.742 Y125.702 E-.06942
G1 X120.841 Y125.517 E-.07974
G1 X121.035 Y125.356 E-.09594
G1 X121.308 Y125.289 E-.10671
G1 X121.548 Y125.289 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.885 Y128.885 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y129.05 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y130.713 E.04321
G3 X125.122 Y130.838 I-.59 J-1.299 E.01343
G3 X123.992 Y130.527 I-.229 J-1.378 E.03144
G3 X122.932 Y131.459 I-1.29 J-.398 E.03858
G3 X121.29 Y131.48 I-.938 J-9.423 E.04274
G3 X119.952 Y130.048 I.064 J-1.401 E.05639
G3 X119.522 Y130.004 I-.106 J-1.086 E.0113
G3 X118.38 Y130.748 I-1.584 J-1.185 E.03617
G1 X118.38 Y129.085 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.38 Y130.748 E-.63181
G1 X118.692 Y130.62 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 31/38
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
M106 S119.85
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.24 I.462 J1.126 P1  F42000
G1 X130.026 Y125.974 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.4 F42000
G1 X135.676 Y120.324 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
; WIPE_START
G1 X136.117 Y120.739 E-.32651
M73 P82 R3
G1 X136.294 Y120.766 E-.06796
G1 X136.481 Y120.864 E-.07998
G1 X136.643 Y121.058 E-.09643
G1 X136.711 Y121.333 E-.10741
G1 X136.711 Y121.548 E-.08171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.86 Y122.86 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.92 Y122.86 E.02887
; WIPE_START
M204 S4000
G1 X134.86 Y124.117 E-.47827
G1 X134.82 Y124.235 E-.04742
G1 X134.667 Y124.31 E-.06452
G1 X134.22 Y124.31 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 31 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer31 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X132.847 Y125.561 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.444676
G1 F9600
M204 S4000
G2 X132.874 Y125.433 I-.181 J-.105 E.00341
G1 X132.633 Y125.349 E.00654
G1 X132.321 Y125.07 E.01074
G1 X132.219 Y125.143 E.0032
G1 X132.127 Y125.351 E.00584
G1 X132.156 Y125.561 E.00544
G1 X132.787 Y125.561 E.01618
; WIPE_START
G1 X132.156 Y125.561 E-.23975
G1 X132.127 Y125.351 E-.08056
G1 X132.219 Y125.143 E-.08652
G1 X132.321 Y125.07 E-.04745
G1 X132.633 Y125.349 E-.15914
G1 X132.874 Y125.433 E-.09695
G1 X132.847 Y125.561 E-.04963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y123.047 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y124.71 E.04321
G2 X131.623 Y124.004 I-.275 J-1.932 E.03805
G3 X130.541 Y122.908 I.249 J-1.328 E.04261
G3 X130.52 Y121.315 I9.137 J-.913 E.04144
G3 X131.976 Y119.976 I1.405 J.067 E.05702
G3 X133.092 Y118.541 I1.42 J-.048 E.05129
G3 X134.685 Y118.52 I.913 J9.137 E.04144
G3 X136.024 Y119.976 I-.067 J1.405 E.05702
G3 X137.48 Y121.315 I.051 J1.405 E.05702
G1 X137.48 Y122.673 E.0353
G3 X136.024 Y124.024 I-1.354 J0 E.05794
G1 X136.009 Y124.346 E.00838
G2 X137.62 Y124.687 I1.128 J-1.355 E.04453
G1 X137.62 Y123.024 E.04321
; OBJECT_ID: 66
; WIPE_START
G1 X137.62 Y124.687 E-.63181
G1 X137.286 Y124.735 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.974 Y130.026 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z5.4 F42000
G1 X132.349 Y135.651 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
M204 S10000
G1 X132.764 Y135.236 F42000
G1 F9000
M204 S4000
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
M73 P82 R2
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.236 Y135.236 E.02564
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.765 Y135.296 E.02408
M204 S250
G1 X133.165 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.835 Y134.835 E.03092
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.895 E.02947
; WIPE_START
M204 S4000
G1 X131.883 Y134.835 E-.48776
G1 X131.766 Y134.795 E-.04705
G1 X131.69 Y134.642 E-.06488
G1 X131.69 Y134.22 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.38 Y135.047 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X130.38 Y136.71 E.04321
G2 X131.644 Y135.984 I-.47 J-2.281 E.03854
G2 X131.995 Y136.005 I.292 J-1.961 E.00917
G2 X133.34 Y137.48 I1.416 J.059 E.05756
G2 X134.883 Y137.459 I.654 J-8.872 E.04014
G2 X135.987 Y136.326 I-.342 J-1.438 E.04338
G2 X137.62 Y136.687 I1.151 J-1.336 E.04531
G1 X137.62 Y135.024 E.04321
; OBJECT_ID: 88
; WIPE_START
G1 X137.62 Y136.687 E-.63181
G1 X137.286 Y136.735 E-.12819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X130.252 Y133.774 Z5.4 F42000
G1 X125.974 Y131.974 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.4 F42000
G1 X120.299 Y126.299 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
; WIPE_START
G1 X120.316 Y125.695 E-.23214
G1 X120.513 Y125.261 E-.18109
G1 X120.844 Y124.987 E-.16313
G1 X121.133 Y124.889 E-.11614
G1 X121.308 Y124.874 E-.06651
G1 X121.31 Y124.874 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.286 Y129.286 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.714 Y126.714 E.02449
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
M73 P83 R2
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.346 Y129.285 E.02293
M204 S250
G1 X122.885 Y128.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.62 Y129.024 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X125.62 Y130.687 E.04321
G3 X124.032 Y130.365 I-.483 J-1.698 E.04375
G1 X124.048 Y130.048 E.00826
G2 X125.48 Y128.698 I.08 J-1.349 E.05727
G1 X125.48 Y127.29 E.03659
G2 X124.048 Y125.952 I-1.401 J.064 E.05639
G2 X122.71 Y124.52 I-1.402 J-.03 E.05639
G2 X121.068 Y124.541 I-.704 J9.443 E.04274
G2 X119.952 Y125.952 I.301 J1.384 E.05066
G2 X118.52 Y127.29 I-.03 J1.402 E.05639
G2 X118.541 Y128.932 I9.443 J.704 E.04274
G2 X119.603 Y130.024 I1.33 J-.231 E.04207
G3 X118.38 Y130.71 I-1.483 J-1.211 E.03731
G1 X118.38 Y129.047 E.04321
; WIPE_START
G1 X118.38 Y130.71 E-.63181
G1 X118.702 Y130.612 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.337 Y131.55 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.469126
G1 F9600
M204 S4000
G1 X121.316 Y131.55 E.02775
M204 S10000
G1 X121.256 Y131.547 F42000
; LINE_WIDTH: 0.444802
G1 F9600
M204 S4000
G1 X120.701 Y131.394 E.01479
G1 X120.303 Y131.074 E.0131
G1 X120.22 Y131.134 E.00262
G1 X120.124 Y131.342 E.0059
G1 X120.154 Y131.564 E.00574
G2 X121.196 Y131.549 I.263 J-17.424 E.02675
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F9600
G1 X120.154 Y131.564 E-.39594
G1 X120.124 Y131.342 E-.08505
G1 X120.22 Y131.134 E-.0874
G1 X120.303 Y131.074 E-.03883
G1 X120.616 Y131.326 E-.15278
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 32/38
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S107.1
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.602 J1.058 P1  F42000
G1 X130.026 Y125.974 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.56 F42000
G1 X135.676 Y120.324 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.261 Y123.261 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.321 Y123.26 E.02351
M204 S250
G1 X134.86 Y122.86 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.92 Y122.86 E.02887
; WIPE_START
M204 S4000
G1 X134.86 Y124.117 E-.47827
G1 X134.82 Y124.235 E-.04742
G1 X134.667 Y124.31 E-.06452
G1 X134.22 Y124.31 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 32 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer32 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.083 Y118.461 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X134.659 Y118.45 E.04288
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.453 Y121.281 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459266
G1 F9600
M204 S4000
G1 X130.535 Y121.002 E.00771
; LINE_WIDTH: 0.421097
G1 X130.617 Y120.724 E.00702
G1 X130.99 Y120.247 E.01465
G1 X131.431 Y120 E.01223
G1 X131.939 Y119.939 E.01236
G1 X132 Y119.431 E.01236
G1 X132.247 Y118.99 E.01223
G1 X132.646 Y118.656 E.01258
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433086
G1 X130.439 Y120.961 E.00649
; LINE_WIDTH: 0.459266
G1 X130.45 Y121.221 E.00691
; WIPE_START
G1 X130.439 Y120.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.904 Y118.813 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.584 Y119.584 E.00819
G1 X131.658 Y119.253 E.00819
G1 X131.875 Y118.865 E.01071
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y122.917 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X130.45 Y121.341 E.04288
; WIPE_START
G1 X130.461 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.431 Y124 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X130.99 Y123.753 E.0122
G1 X130.656 Y123.354 E.01255
; LINE_WIDTH: 0.436941
G1 X130.558 Y123.135 E.00603
; LINE_WIDTH: 0.459218
G1 X130.461 Y122.917 E.00636
G1 X130.427 Y123.437 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y125.573 E.05151
G1 X132.701 Y125.573 E.05484
; LINE_WIDTH: 0.433081
G1 X132.991 Y125.56 E.00723
; LINE_WIDTH: 0.450528
G1 X133.281 Y125.547 E.00755
G1 X132.724 Y125.383 E.0151
; LINE_WIDTH: 0.419996
G1 X132.247 Y125.01 E.0146
G1 X132 Y124.569 E.0122
G1 X131.939 Y124.061 E.01233
G1 X131.491 Y124.007 E.01088
M204 S10000
G1 X131.253 Y124.342 F42000
G1 F9600
M204 S4000
G1 X130.813 Y124.096 E.01216
G1 X130.813 Y125.187 E.02632
G1 X131.904 Y125.187 E.02632
G1 X131.658 Y124.747 E.01216
G1 X131.584 Y124.416 E.00819
G1 X131.311 Y124.355 E.00674
M204 S10000
G1 X131.253 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X131.247 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y124.822 E-.17649
G1 X131.17 Y124.775 E-.1945
G1 X131.198 Y124.727 E-.19452
G1 X131.253 Y124.727 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.917 Y125.539 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X133.341 Y125.55 E.04288
; WIPE_START
G1 X134.917 Y125.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.573 Y123.324 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.435431
G1 F9600
M204 S4000
G1 X137.55 Y123.137 E.00473
; LINE_WIDTH: 0.45547
G1 X137.528 Y122.949 E.00497
G1 X137.344 Y123.354 E.01169
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.061 Y124.061 E.01233
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
; LINE_WIDTH: 0.436941
G1 X135.135 Y125.442 E.00603
; LINE_WIDTH: 0.459218
G1 X134.917 Y125.539 E.00636
G1 X135.437 Y125.573 E.01385
; LINE_WIDTH: 0.419996
G1 X137.573 Y125.573 E.05151
G1 X137.573 Y123.384 E.05279
M204 S10000
G1 X137.187 Y124.096 F42000
G1 F9600
M204 S4000
G1 X136.747 Y124.342 E.01216
G1 X136.416 Y124.416 E.00819
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.156 E.02487
M204 S10000
G1 X136.802 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y124.822 E-.17646
G1 X136.72 Y124.775 E-.19451
G1 X136.747 Y124.727 E-.19453
G1 X136.802 Y124.727 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y121.281 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466245
G1 F9600
M204 S4000
G1 X137.542 Y122.857 E.04256
; WIPE_START
G1 X137.547 Y121.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.719 Y118.453 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459266
G1 F9600
M204 S4000
G1 X134.998 Y118.535 E.00771
; LINE_WIDTH: 0.421097
G1 X135.276 Y118.617 E.00702
G1 X135.753 Y118.99 E.01465
G1 X136 Y119.431 E.01223
G1 X136.061 Y119.939 E.01236
G1 X136.569 Y120 E.01236
G1 X137.01 Y120.247 E.01223
G1 X137.344 Y120.646 E.01258
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.039 Y118.439 E.00649
; LINE_WIDTH: 0.459266
G1 X134.779 Y118.45 E.00691
; WIPE_START
G1 X135.039 Y118.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.187 Y119.225 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
M73 P84 R2
G1 X137.187 Y118.813 E.00995
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.416 Y119.584 E.00819
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y119.285 E.01493
M204 S10000
G1 X136.802 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
; OBJECT_ID: 66
; WIPE_START
G1 X136.747 Y119.273 E-.17646
G1 X136.72 Y119.225 E-.19451
G1 X136.747 Y119.178 E-.19453
G1 X136.802 Y119.178 E-.1945
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.622 Y126.766 Z5.56 F42000
G1 X137.974 Y130.026 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.026 E.20656
G1 X137.914 Y130.026 E.205
M204 S10000
G1 X138.389 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.611 E.22817
G1 X138.329 Y129.611 E.22661
M204 S250
G1 X138.79 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.21 E.23102
G1 X138.73 Y129.21 E.22957
; WIPE_START
M204 S4000
G1 X138.789 Y131.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.506 Y135.543 Z5.56 F42000
G1 X132.349 Y135.651 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.651 Y135.651 E.01676
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.35 Y135.711 E.0152
; WIPE_START
G1 X131.704 Y135.635 E-.24718
G1 X131.269 Y135.443 E-.18068
G1 X130.99 Y135.112 E-.16481
G1 X130.889 Y134.817 E-.11854
G1 X130.878 Y134.689 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.236 Y135.236 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04156
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z5.16 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F9600
M204 S4000
G1 X132.846 Y130.444 E.00719
; LINE_WIDTH: 0.420943
G1 X132.583 Y130.427 E.00637
G1 X130.427 Y130.427 E.05211
G1 X130.427 Y132.722 E.05548
; LINE_WIDTH: 0.433106
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450586
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.948 Y131.956 I.54 J2.152 E.01239
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.86 Y130.572 E.00533
; LINE_WIDTH: 0.470816
G1 X133.054 Y130.485 E.00578
; WIPE_START
G1 X132.86 Y130.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.929 Y130.813 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.6 Y131.588 E.00841
G1 X131.679 Y131.263 E.00806
G1 X131.9 Y130.865 E.01099
M204 S10000
G1 X131.264 Y131.186 F42000
; LINE_WIDTH: 0.494836
G1 F9600
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
; WIPE_START
G1 X131.207 Y131.286 E-.18392
G1 X131.178 Y131.236 E-.19203
G1 X131.207 Y131.186 E-.19203
G1 X131.264 Y131.186 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y134.892 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X130.45 Y133.365 I17.533 J-.888 E.04156
; WIPE_START
G1 X130.461 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.305 Y137.547 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F9600
M204 S4000
G1 X133.025 Y137.464 E.00776
; LINE_WIDTH: 0.421098
G1 X132.745 Y137.382 E.00706
G1 X132.267 Y137.005 E.01472
G1 X132.022 Y136.56 E.01227
G3 X131.956 Y136.052 I2.152 J-.54 E.01242
G1 X131.44 Y135.978 E.01261
G1 X130.995 Y135.733 E.01227
G1 X130.658 Y135.333 E.01265
; LINE_WIDTH: 0.436936
G1 X130.56 Y135.112 E.00608
; LINE_WIDTH: 0.459204
G1 X130.461 Y134.892 E.00642
G1 X130.427 Y135.417 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y137.573 E.05198
G1 X132.722 Y137.573 E.05535
; LINE_WIDTH: 0.433101
G1 X132.984 Y137.561 E.00653
; LINE_WIDTH: 0.459311
G1 X133.245 Y137.549 E.00696
; WIPE_START
G1 X132.984 Y137.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.813 Y136.07 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X130.813 Y137.187 E.02693
G1 X131.93 Y137.187 E.02693
G1 X131.679 Y136.737 E.01243
G1 X131.588 Y136.4 E.00841
G1 X131.263 Y136.321 E.00806
G1 X130.865 Y136.1 E.01099
M204 S10000
G1 X131.264 Y136.714 F42000
; LINE_WIDTH: 0.494836
G1 F9600
M204 S4000
G2 X131.262 Y136.814 I-.029 J.049 E.00681
; WIPE_START
G1 X131.207 Y136.814 E-.18392
G1 X131.178 Y136.764 E-.19203
G1 X131.207 Y136.714 E-.19203
G1 X131.264 Y136.714 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.892 Y137.539 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X133.365 Y137.55 I-.888 J-17.533 E.04156
; WIPE_START
G1 X134.892 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.978 Y136.56 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.436936
G1 X135.112 Y137.44 E.00608
; LINE_WIDTH: 0.459204
G1 X134.892 Y137.539 E.00642
G1 X135.417 Y137.573 E.01399
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.05199
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.435416
G1 X137.55 Y135.114 E.00478
; LINE_WIDTH: 0.455437
G1 X137.528 Y134.925 E.00502
G1 X137.342 Y135.333 E.01181
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.052 Y136.044 I-.54 J-2.152 E.01239
G1 X135.986 Y136.501 E.01112
M204 S10000
G1 X136.4 Y136.412 F42000
G1 F9600
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.793 Y136.714 F42000
; LINE_WIDTH: 0.494876
G1 F9600
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
; WIPE_START
G1 X136.735 Y136.814 E-.18389
G1 X136.707 Y136.764 E-.19204
G1 X136.735 Y136.714 E-.19204
G1 X136.793 Y136.714 E-.19203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y133.305 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466256
G1 F9600
M204 S4000
G1 X137.542 Y134.832 E.04122
; WIPE_START
G1 X137.547 Y133.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.573 Y131.236 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X137.573 Y130.427 E.0195
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.044 Y131.948 I-2.152 J.54 E.01239
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y131.296 E.0344
M204 S10000
G1 X137.187 Y131.236 F42000
G1 F9600
M204 S4000
G1 X137.187 Y130.813 E.0102
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.412 Y131.6 E.00841
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y131.296 E.01528
M204 S10000
G1 X136.793 Y131.186 F42000
; LINE_WIDTH: 0.494856
G1 F9600
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
; OBJECT_ID: 88
; WIPE_START
G1 X136.735 Y131.286 E-.18389
G1 X136.707 Y131.236 E-.19204
G1 X136.735 Y131.186 E-.19204
G1 X136.793 Y131.186 E-.19203
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X129.181 Y131.74 Z5.56 F42000
G1 X125.974 Y131.974 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.56 F42000
G1 X120.299 Y126.299 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
; WIPE_START
G1 X120.316 Y125.695 E-.23214
G1 X120.513 Y125.261 E-.18109
G1 X120.844 Y124.987 E-.16313
G1 X121.133 Y124.889 E-.11614
G1 X121.308 Y124.874 E-.06651
G1 X121.31 Y124.874 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.286 Y129.286 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.714 Y126.714 E.02449
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.346 Y129.285 E.02293
M204 S250
G1 X122.885 Y128.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
M73 P85 R2
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46937
G1 F9600
M204 S4000
G1 X122.684 Y124.45 E.04422
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.453 Y127.256 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F9600
M204 S4000
G1 X118.534 Y126.979 E.00766
; LINE_WIDTH: 0.4211
G1 X118.615 Y126.703 E.00697
G1 X118.984 Y126.227 E.01457
G1 X119.423 Y125.978 E.01219
G1 X119.915 Y125.915 E.012
G1 X119.978 Y125.423 E.012
G1 X120.227 Y124.984 E.01219
G1 X120.625 Y124.654 E.01252
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433056
G1 X118.439 Y126.938 E.00644
; LINE_WIDTH: 0.459176
G1 X118.45 Y127.196 E.00686
; WIPE_START
G1 X118.439 Y126.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.878 Y124.813 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.562 Y125.562 E.0055
G1 X119.637 Y125.242 E.00793
G1 X119.849 Y124.865 E.01043
M204 S10000
G1 X119.241 Y125.169 F42000
; LINE_WIDTH: 0.452456
G1 F9600
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
; WIPE_START
G1 X119.188 Y125.26 E-.16811
G1 X119.162 Y125.215 E-.1973
G1 X119.188 Y125.169 E-.1973
G1 X119.241 Y125.169 E-.19729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.461 Y128.942 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469373
G1 F9600
M204 S4000
G1 X118.45 Y127.316 E.04422
; WIPE_START
G1 X118.461 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.423 Y130.022 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X118.984 Y129.773 E.01216
G1 X118.654 Y129.375 E.01248
; LINE_WIDTH: 0.436936
G1 X118.557 Y129.158 E.00597
; LINE_WIDTH: 0.459209
G1 X118.461 Y128.942 E.0063
G1 X118.427 Y129.456 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y131.573 E.05104
G1 X120.68 Y131.573 E.05434
; LINE_WIDTH: 0.433056
G1 X120.968 Y131.56 E.00719
; LINE_WIDTH: 0.45047
G1 X121.256 Y131.547 E.0075
G1 X120.703 Y131.385 E.015
; LINE_WIDTH: 0.419996
G1 X120.227 Y131.016 E.01453
G1 X119.978 Y130.577 E.01216
G1 X119.915 Y130.085 E.01197
G1 X119.482 Y130.03 E.01052
M204 S10000
G1 X119.242 Y130.363 F42000
G1 F9600
M204 S4000
G1 X118.813 Y130.122 E.01188
G1 X118.813 Y131.187 E.0257
G1 X119.878 Y131.187 E.0257
G1 X119.597 Y130.663 E.01434
G1 X119.562 Y130.438 E.0055
G1 X119.301 Y130.377 E.00648
M204 S10000
G1 X119.241 Y130.74 F42000
; LINE_WIDTH: 0.452456
G1 F9600
M204 S4000
G2 X119.233 Y130.831 I-.026 J.043 E.00537
; WIPE_START
G1 X119.188 Y130.831 E-.16811
G1 X119.162 Y130.785 E-.1973
G1 X119.188 Y130.74 E-.1973
G1 X119.241 Y130.74 E-.19729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.942 Y131.539 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469373
G1 F9600
M204 S4000
G3 X121.316 Y131.55 I-.966 J-22.879 E.04423
; WIPE_START
G1 X122.942 Y131.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.573 Y129.345 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.435446
G1 F9600
M204 S4000
G1 X125.55 Y129.16 E.00469
; LINE_WIDTH: 0.455503
G1 X125.528 Y128.974 E.00492
G1 X125.346 Y129.375 E.01158
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.085 Y130.085 E.01197
G1 X124.022 Y130.577 E.01197
G1 X123.773 Y131.016 E.01216
G1 X123.375 Y131.346 E.01248
; LINE_WIDTH: 0.436936
G1 X123.158 Y131.443 E.00597
; LINE_WIDTH: 0.459209
G1 X122.942 Y131.539 E.0063
G1 X123.456 Y131.573 E.01371
; LINE_WIDTH: 0.419996
G1 X125.573 Y131.573 E.05104
G1 X125.573 Y129.405 E.05228
M204 S10000
G1 X125.187 Y130.122 F42000
G1 F9600
M204 S4000
G1 X124.663 Y130.403 E.01434
G1 X124.438 Y130.438 E.0055
G1 X124.363 Y130.758 E.00793
G1 X124.122 Y131.187 E.01188
G1 X125.187 Y131.187 E.0257
G1 X125.187 Y130.182 E.02426
M204 S10000
G1 X124.812 Y130.74 F42000
; LINE_WIDTH: 0.452496
G1 F9600
M204 S4000
G2 X124.804 Y130.831 I-.026 J.043 E.00537
; WIPE_START
G1 X124.759 Y130.831 E-.16812
G1 X124.733 Y130.785 E-.1973
G1 X124.759 Y130.74 E-.19732
G1 X124.812 Y130.74 E-.19726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.547 Y127.256 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466235
G1 F9600
M204 S4000
G1 X125.542 Y128.882 E.0439
; WIPE_START
G1 X125.547 Y127.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.744 Y124.453 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F9600
M204 S4000
G1 X123.021 Y124.534 E.00766
; LINE_WIDTH: 0.4211
G1 X123.297 Y124.615 E.00697
G1 X123.773 Y124.984 E.01457
G1 X124.022 Y125.423 E.01219
G1 X124.085 Y125.915 E.012
G1 X124.578 Y125.978 E.012
G1 X125.016 Y126.227 E.01219
G1 X125.346 Y126.625 E.01252
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.062 Y124.439 E.00644
; LINE_WIDTH: 0.459176
G1 X122.804 Y124.45 E.00686
; WIPE_START
G1 X123.062 Y124.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.187 Y125.215 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X125.187 Y124.813 E.00969
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.438 Y125.562 E.0055
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y125.275 E.01456
M204 S10000
G1 X124.812 Y125.169 F42000
; LINE_WIDTH: 0.452476
G1 F9600
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F9600
G1 X124.759 Y125.26 E-.16808
G1 X124.733 Y125.215 E-.19731
G1 X124.759 Y125.169 E-.19731
G1 X124.812 Y125.169 E-.1973
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 33/38
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S112.2
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.56 I-.186 J1.203 P1  F42000
G1 X130.026 Y125.974 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.72 F42000
G1 X135.676 Y120.324 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
; WIPE_START
G1 X136.117 Y120.739 E-.32651
G1 X136.294 Y120.766 E-.06796
G1 X136.481 Y120.864 E-.07998
G1 X136.643 Y121.058 E-.09643
G1 X136.711 Y121.333 E-.10741
G1 X136.711 Y121.548 E-.08171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.86 Y122.86 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.92 Y122.86 E.02887
; WIPE_START
M204 S4000
G1 X134.86 Y124.117 E-.47827
G1 X134.82 Y124.235 E-.04742
G1 X134.667 Y124.31 E-.06452
G1 X134.22 Y124.31 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.72 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 33 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer33 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.461 Y122.917 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X130.45 Y121.341 E.04272
; WIPE_START
G1 X130.461 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y124.061 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.431 Y124 E.01233
G1 X130.99 Y123.753 E.0122
G1 X130.656 Y123.354 E.01255
; LINE_WIDTH: 0.436941
G1 X130.558 Y123.135 E.00603
; LINE_WIDTH: 0.459218
G1 X130.461 Y122.917 E.00636
G1 X130.427 Y123.437 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y125.573 E.05151
G1 X132.701 Y125.573 E.05484
; LINE_WIDTH: 0.433081
G1 X132.991 Y125.56 E.00723
; LINE_WIDTH: 0.450528
G1 X133.281 Y125.547 E.00755
G1 X132.724 Y125.383 E.0151
; LINE_WIDTH: 0.419996
G1 X132.247 Y125.01 E.0146
G1 X132 Y124.569 E.0122
G1 X131.946 Y124.121 E.01088
M204 S10000
G1 X131.584 Y124.416 F42000
G1 F12000
M204 S4000
G1 X131.253 Y124.342 E.00819
G1 X130.813 Y124.096 E.01216
G1 X130.813 Y125.187 E.02632
G1 X131.904 Y125.187 E.02632
G1 X131.658 Y124.747 E.01216
G1 X131.597 Y124.474 E.00674
M204 S10000
G1 X131.253 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y124.822 E-.17649
G1 X131.17 Y124.775 E-.1945
G1 X131.198 Y124.727 E-.19452
G1 X131.253 Y124.727 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.917 Y125.539 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X133.341 Y125.55 E.04272
; WIPE_START
G1 X134.917 Y125.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y124.061 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
; LINE_WIDTH: 0.436941
G1 X135.135 Y125.442 E.00603
; LINE_WIDTH: 0.459218
G1 X134.917 Y125.539 E.00636
G1 X135.437 Y125.573 E.01385
; LINE_WIDTH: 0.419996
G1 X137.573 Y125.573 E.05151
G1 X137.573 Y123.324 E.05423
; LINE_WIDTH: 0.435431
G1 X137.55 Y123.137 E.00473
; LINE_WIDTH: 0.45547
G1 X137.528 Y122.949 E.00497
G1 X137.344 Y123.354 E.01169
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.121 Y124.054 E.01088
M204 S10000
G1 X136.416 Y124.416 F42000
G1 F12000
M204 S4000
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.096 E.02632
G1 X136.747 Y124.342 E.01216
G1 X136.474 Y124.403 E.00674
M204 S10000
G1 X136.802 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y124.822 E-.17646
G1 X136.72 Y124.775 E-.19451
G1 X136.747 Y124.727 E-.19453
G1 X136.802 Y124.727 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y121.281 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X137.542 Y122.857 E.04268
; WIPE_START
G1 X137.547 Y121.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y119.939 Z5.72 F42000
M73 P86 R2
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.569 Y120 E.01233
G1 X137.01 Y120.247 E.0122
G1 X137.344 Y120.646 E.01255
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.009 Y118.44 E.00723
; LINE_WIDTH: 0.45054
G1 X134.719 Y118.453 E.00755
G1 X135.276 Y118.617 E.0151
; LINE_WIDTH: 0.419996
G1 X135.753 Y118.99 E.0146
G1 X136 Y119.431 E.0122
G1 X136.054 Y119.879 E.01088
M204 S10000
G1 X136.416 Y119.584 F42000
G1 F12000
M204 S4000
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y118.813 E.02632
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.403 Y119.526 E.00674
M204 S10000
G1 X136.802 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y119.273 E-.17646
G1 X136.72 Y119.225 E-.19451
G1 X136.747 Y119.178 E-.19453
G1 X136.802 Y119.178 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.083 Y118.461 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X134.659 Y118.45 E.04272
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y119.939 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X132 Y119.431 E.01233
G1 X132.247 Y118.99 E.0122
G1 X132.646 Y118.656 E.01255
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433086
G1 X130.44 Y120.991 E.00723
; LINE_WIDTH: 0.45054
G1 X130.453 Y121.281 E.00755
G1 X130.617 Y120.724 E.0151
; LINE_WIDTH: 0.419996
G1 X130.99 Y120.247 E.0146
G1 X131.431 Y120 E.0122
G1 X131.879 Y119.946 E.01088
M204 S10000
G1 X131.584 Y119.584 F42000
G1 F12000
M204 S4000
G1 X131.658 Y119.253 E.00819
G1 X131.904 Y118.813 E.01216
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.526 Y119.597 E.00674
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; OBJECT_ID: 66
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.395 Y126.762 Z5.72 F42000
G1 X130.026 Y130.026 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z5.72 F42000
G1 X135.651 Y135.651 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y131.186 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X131.6 Y131.588 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.679 Y131.263 E.00806
G1 X131.929 Y130.813 E.01243
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.542 Y131.604 E.00696
M204 S10000
G1 X131.948 Y131.956 F42000
G1 F12000
M204 S4000
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.888 Y130.56 E.00608
; LINE_WIDTH: 0.459204
G1 X133.108 Y130.461 E.00642
G1 X132.583 Y130.427 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y130.427 E.05199
G1 X130.427 Y132.722 E.05535
; LINE_WIDTH: 0.433106
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450586
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.888 Y131.958 I.499 J1.893 E.01095
; WIPE_START
G1 X131.44 Y132.022 E-.21935
G1 X130.995 Y132.267 E-.2458
G1 X130.618 Y132.745 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04139
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y131.186 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X136.412 Y131.6 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y130.813 E.02693
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.396 Y131.542 E.00696
M204 S10000
G1 X136.044 Y131.948 F42000
G1 F12000
M204 S4000
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y130.427 E.05535
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.042 Y131.888 I-1.893 J.5 E.01095
; WIPE_START
G1 X135.978 Y131.44 E-.21935
G1 X135.733 Y130.995 E-.24581
G1 X135.255 Y130.618 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y133.305 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467495
G1 F12000
M204 S4000
G1 X137.542 Y134.832 E.04134
; WIPE_START
G1 X137.547 Y133.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y136.714 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494876
G1 F12000
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X136.4 Y136.412 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.052 Y136.044 F42000
G1 F12000
M204 S4000
G1 X135.978 Y136.56 E.01257
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.436936
G1 X135.112 Y137.44 E.00608
; LINE_WIDTH: 0.459204
G1 X134.892 Y137.539 E.00642
G1 X135.417 Y137.573 E.01399
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.05199
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.435416
G1 X137.55 Y135.114 E.00478
; LINE_WIDTH: 0.455437
G1 X137.528 Y134.925 E.00502
G1 X137.342 Y135.333 E.01181
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.112 Y136.042 I-.499 J-1.893 E.01095
; WIPE_START
G1 X136.56 Y135.978 E-.23203
G1 X137.005 Y135.733 E-.26003
G1 X137.342 Y135.333 E-.26794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.892 Y137.539 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X133.365 Y137.55 I-.888 J-17.533 E.04139
; WIPE_START
G1 X134.892 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y136.714 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X131.588 Y136.4 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.263 Y136.321 E.00806
G1 X130.813 Y136.07 E.01243
G1 X130.813 Y137.187 E.02693
G1 X131.93 Y137.187 E.02693
G1 X131.679 Y136.737 E.01243
G1 X131.604 Y136.458 E.00696
M204 S10000
G1 X131.956 Y136.052 F42000
G1 F12000
M204 S4000
G1 X131.44 Y135.978 E.01257
G1 X130.995 Y135.733 E.01224
G1 X130.658 Y135.333 E.01261
; LINE_WIDTH: 0.436936
G1 X130.56 Y135.112 E.00608
; LINE_WIDTH: 0.459204
G1 X130.461 Y134.892 E.00642
G1 X130.427 Y135.417 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y137.573 E.05198
G1 X132.722 Y137.573 E.05535
; LINE_WIDTH: 0.433101
G1 X133.014 Y137.56 E.00728
; LINE_WIDTH: 0.450575
G1 X133.305 Y137.547 E.0076
G1 X132.745 Y137.382 E.0152
; LINE_WIDTH: 0.419996
G1 X132.267 Y137.005 E.01468
G1 X132.022 Y136.56 E.01224
G3 X131.958 Y136.112 I1.893 J-.499 E.01095
; WIPE_START
G1 X132.022 Y136.56 E-.21935
G1 X132.267 Y137.005 E-.2458
G1 X132.745 Y137.382 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y134.892 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X130.45 Y133.365 I17.533 J-.888 E.04139
; OBJECT_ID: 88
; WIPE_START
G1 X130.461 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.72 F42000
G1 X120.299 Y126.299 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
; WIPE_START
G1 X120.316 Y125.695 E-.23214
G1 X120.513 Y125.261 E-.18109
G1 X120.844 Y124.987 E-.16313
G1 X121.133 Y124.889 E-.11614
G1 X121.308 Y124.874 E-.06651
G1 X121.31 Y124.874 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.286 Y129.286 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.714 Y126.714 E.02449
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
M73 P87 R2
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.346 Y129.285 E.02293
M204 S250
G1 X122.885 Y128.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.945 Y128.885 E.02827
; WIPE_START
M204 S4000
G1 X122.885 Y130.117 E-.46878
G1 X122.844 Y130.236 E-.0478
G1 X122.692 Y130.31 E-.06416
G1 X122.22 Y130.31 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y125.169 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.637 Y125.242 E.00793
G1 X119.878 Y124.813 E.01188
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.503 Y125.571 E.00405
M204 S10000
G1 X119.915 Y125.915 F42000
G1 F12000
M204 S4000
G1 X119.978 Y125.423 E.01196
G1 X120.227 Y124.984 E.01216
G1 X120.625 Y124.654 E.01248
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433056
G1 X118.44 Y126.968 E.00719
; LINE_WIDTH: 0.45047
G1 X118.453 Y127.256 E.0075
G1 X118.615 Y126.703 E.015
; LINE_WIDTH: 0.419996
G1 X118.984 Y126.227 E.01453
G1 X119.423 Y125.978 E.01216
G1 X119.855 Y125.922 E.01052
; WIPE_START
G1 X119.423 Y125.978 E-.21486
G1 X118.984 Y126.227 E-.24838
G1 X118.615 Y126.703 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X122.684 Y124.45 E.04405
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y125.169 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y124.813 E.0257
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.429 Y125.503 E.00405
M204 S10000
G1 X124.085 Y125.915 F42000
G1 F12000
M204 S4000
G1 X124.578 Y125.978 E.01197
G1 X125.016 Y126.227 E.01216
G1 X125.346 Y126.625 E.01248
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.032 Y124.44 E.00719
; LINE_WIDTH: 0.45047
G1 X122.744 Y124.453 E.0075
G1 X123.297 Y124.615 E.015
; LINE_WIDTH: 0.419996
G1 X123.773 Y124.984 E.01453
G1 X124.022 Y125.423 E.01216
G1 X124.078 Y125.855 E.01052
; WIPE_START
G1 X124.022 Y125.423 E-.21486
G1 X123.773 Y124.984 E-.24838
G1 X123.297 Y124.615 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.547 Y127.256 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X125.542 Y128.882 E.04402
; WIPE_START
G1 X125.547 Y127.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y130.74 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X124.804 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.363 Y130.758 E.00793
G1 X124.122 Y131.187 E.01188
G1 X125.187 Y131.187 E.0257
G1 X125.187 Y130.122 E.0257
G1 X124.663 Y130.403 E.01434
G1 X124.497 Y130.429 E.00406
M204 S10000
G1 X124.085 Y130.085 F42000
G1 F12000
M204 S4000
G1 X124.022 Y130.577 E.01197
G1 X123.773 Y131.016 E.01216
G1 X123.375 Y131.346 E.01248
; LINE_WIDTH: 0.436936
G1 X123.158 Y131.443 E.00597
; LINE_WIDTH: 0.459209
G1 X122.942 Y131.539 E.0063
G1 X123.456 Y131.573 E.01371
; LINE_WIDTH: 0.419996
G1 X125.573 Y131.573 E.05104
G1 X125.573 Y129.345 E.05373
; LINE_WIDTH: 0.435446
G1 X125.55 Y129.16 E.00469
; LINE_WIDTH: 0.455503
G1 X125.528 Y128.974 E.00492
G1 X125.346 Y129.375 E.01158
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.145 Y130.078 E.01052
; WIPE_START
G1 X124.578 Y130.022 E-.22737
G1 X125.016 Y129.773 E-.26279
G1 X125.346 Y129.375 E-.26984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.942 Y131.539 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X121.316 Y131.55 E.04405
; WIPE_START
G1 X122.942 Y131.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y130.74 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.242 Y130.363 E.00793
G1 X118.813 Y130.122 E.01188
G1 X118.813 Y131.187 E.0257
G1 X119.878 Y131.187 E.0257
G1 X119.597 Y130.663 E.01434
G1 X119.571 Y130.497 E.00406
M204 S10000
G1 X119.915 Y130.085 F42000
G1 F12000
M204 S4000
G1 X119.423 Y130.022 E.01197
G1 X118.984 Y129.773 E.01216
G1 X118.654 Y129.375 E.01248
; LINE_WIDTH: 0.436936
G1 X118.557 Y129.158 E.00597
; LINE_WIDTH: 0.459209
G1 X118.461 Y128.942 E.0063
G1 X118.427 Y129.456 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y131.573 E.05104
G1 X120.68 Y131.573 E.05434
; LINE_WIDTH: 0.433056
G1 X120.968 Y131.56 E.00719
; LINE_WIDTH: 0.45047
G1 X121.256 Y131.547 E.0075
G1 X120.703 Y131.385 E.015
; LINE_WIDTH: 0.419996
G1 X120.227 Y131.016 E.01453
G1 X119.978 Y130.577 E.01216
G1 X119.922 Y130.145 E.01052
; WIPE_START
G1 X119.978 Y130.577 E-.21488
G1 X120.227 Y131.016 E-.24836
G1 X120.703 Y131.385 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.461 Y128.942 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X118.45 Y127.316 E.04405
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.461 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 34/38
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.72 I.302 J1.179 P1  F42000
G1 X130.026 Y125.974 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z5.88 F42000
G1 X135.676 Y120.324 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.88 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 34 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer34 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.461 Y122.917 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X130.45 Y121.341 E.04272
; WIPE_START
G1 X130.461 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y124.061 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.431 Y124 E.01233
G1 X130.99 Y123.753 E.0122
G1 X130.656 Y123.354 E.01255
; LINE_WIDTH: 0.436941
G1 X130.558 Y123.135 E.00603
; LINE_WIDTH: 0.459218
G1 X130.461 Y122.917 E.00636
G1 X130.427 Y123.437 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y125.573 E.05151
G1 X132.701 Y125.573 E.05484
; LINE_WIDTH: 0.433081
G1 X132.991 Y125.56 E.00723
; LINE_WIDTH: 0.450528
G1 X133.281 Y125.547 E.00755
G1 X132.724 Y125.383 E.0151
; LINE_WIDTH: 0.419996
G1 X132.247 Y125.01 E.0146
G1 X132 Y124.569 E.0122
G1 X131.946 Y124.121 E.01088
M204 S10000
G1 X131.584 Y124.416 F42000
G1 F12000
M204 S4000
G1 X131.253 Y124.342 E.00819
G1 X130.813 Y124.096 E.01216
G1 X130.813 Y125.187 E.02632
G1 X131.904 Y125.187 E.02632
G1 X131.658 Y124.747 E.01216
G1 X131.597 Y124.474 E.00674
M204 S10000
G1 X131.253 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y124.822 E-.17649
G1 X131.17 Y124.775 E-.1945
G1 X131.198 Y124.727 E-.19452
G1 X131.253 Y124.727 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.917 Y125.539 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X133.341 Y125.55 E.04272
; WIPE_START
G1 X134.917 Y125.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y124.061 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
; LINE_WIDTH: 0.436941
G1 X135.135 Y125.442 E.00603
; LINE_WIDTH: 0.459218
G1 X134.917 Y125.539 E.00636
G1 X135.437 Y125.573 E.01385
; LINE_WIDTH: 0.419996
G1 X137.573 Y125.573 E.05151
G1 X137.573 Y123.324 E.05423
; LINE_WIDTH: 0.435431
G1 X137.55 Y123.137 E.00473
; LINE_WIDTH: 0.45547
G1 X137.528 Y122.949 E.00497
G1 X137.344 Y123.354 E.01169
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.121 Y124.054 E.01088
M204 S10000
G1 X136.416 Y124.416 F42000
G1 F12000
M204 S4000
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.096 E.02632
G1 X136.747 Y124.342 E.01216
G1 X136.474 Y124.403 E.00674
M204 S10000
G1 X136.802 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y124.822 E-.17646
G1 X136.72 Y124.775 E-.19451
G1 X136.747 Y124.727 E-.19453
G1 X136.802 Y124.727 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y121.281 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X137.542 Y122.857 E.04268
; WIPE_START
G1 X137.547 Y121.281 E-.76
; WIPE_END
M73 P88 R2
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y119.939 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.569 Y120 E.01233
G1 X137.01 Y120.247 E.0122
G1 X137.344 Y120.646 E.01255
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.009 Y118.44 E.00723
; LINE_WIDTH: 0.45054
G1 X134.719 Y118.453 E.00755
G1 X135.276 Y118.617 E.0151
; LINE_WIDTH: 0.419996
G1 X135.753 Y118.99 E.0146
G1 X136 Y119.431 E.0122
G1 X136.054 Y119.879 E.01088
M204 S10000
G1 X136.416 Y119.584 F42000
G1 F12000
M204 S4000
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y118.813 E.02632
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.403 Y119.526 E.00674
M204 S10000
G1 X136.802 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y119.273 E-.17646
G1 X136.72 Y119.225 E-.19451
G1 X136.747 Y119.178 E-.19453
G1 X136.802 Y119.178 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.083 Y118.461 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X134.659 Y118.45 E.04272
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y119.939 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X132 Y119.431 E.01233
G1 X132.247 Y118.99 E.0122
G1 X132.646 Y118.656 E.01255
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433086
G1 X130.44 Y120.991 E.00723
; LINE_WIDTH: 0.45054
G1 X130.453 Y121.281 E.00755
G1 X130.617 Y120.724 E.0151
; LINE_WIDTH: 0.419996
G1 X130.99 Y120.247 E.0146
G1 X131.431 Y120 E.0122
G1 X131.879 Y119.946 E.01088
M204 S10000
G1 X131.584 Y119.584 F42000
G1 F12000
M204 S4000
G1 X131.658 Y119.253 E.00819
G1 X131.904 Y118.813 E.01216
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.526 Y119.597 E.00674
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; OBJECT_ID: 66
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.395 Y126.762 Z5.88 F42000
G1 X130.026 Y130.026 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z5.88 F42000
G1 X135.651 Y135.651 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
M73 P88 R1
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y131.186 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X131.6 Y131.588 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.679 Y131.263 E.00806
G1 X131.929 Y130.813 E.01243
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.542 Y131.604 E.00696
M204 S10000
G1 X131.948 Y131.956 F42000
G1 F12000
M204 S4000
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.888 Y130.56 E.00608
; LINE_WIDTH: 0.459204
G1 X133.108 Y130.461 E.00642
G1 X132.583 Y130.427 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y130.427 E.05199
G1 X130.427 Y132.722 E.05535
; LINE_WIDTH: 0.433106
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450586
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.888 Y131.958 I.499 J1.893 E.01095
; WIPE_START
G1 X131.44 Y132.022 E-.21935
G1 X130.995 Y132.267 E-.2458
G1 X130.618 Y132.745 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04139
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y131.186 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X136.412 Y131.6 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y130.813 E.02693
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.396 Y131.542 E.00696
M204 S10000
G1 X136.044 Y131.948 F42000
G1 F12000
M204 S4000
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y130.427 E.05535
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.042 Y131.888 I-1.893 J.5 E.01095
; WIPE_START
G1 X135.978 Y131.44 E-.21935
G1 X135.733 Y130.995 E-.24581
G1 X135.255 Y130.618 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y133.305 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467495
G1 F12000
M204 S4000
G1 X137.542 Y134.832 E.04134
; WIPE_START
G1 X137.547 Y133.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y136.714 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.494876
G1 F12000
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X136.4 Y136.412 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.052 Y136.044 F42000
G1 F12000
M204 S4000
G1 X135.978 Y136.56 E.01257
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.436936
G1 X135.112 Y137.44 E.00608
; LINE_WIDTH: 0.459204
G1 X134.892 Y137.539 E.00642
G1 X135.417 Y137.573 E.01399
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.05199
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.435416
G1 X137.55 Y135.114 E.00478
; LINE_WIDTH: 0.455437
G1 X137.528 Y134.925 E.00502
G1 X137.342 Y135.333 E.01181
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.112 Y136.042 I-.499 J-1.893 E.01095
; WIPE_START
G1 X136.56 Y135.978 E-.23203
G1 X137.005 Y135.733 E-.26003
G1 X137.342 Y135.333 E-.26794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.892 Y137.539 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X133.365 Y137.55 I-.888 J-17.533 E.04139
; WIPE_START
G1 X134.892 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y136.714 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X131.588 Y136.4 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.263 Y136.321 E.00806
G1 X130.813 Y136.07 E.01243
G1 X130.813 Y137.187 E.02693
G1 X131.93 Y137.187 E.02693
G1 X131.679 Y136.737 E.01243
G1 X131.604 Y136.458 E.00696
M204 S10000
G1 X131.956 Y136.052 F42000
G1 F12000
M204 S4000
G1 X131.44 Y135.978 E.01257
G1 X130.995 Y135.733 E.01224
G1 X130.658 Y135.333 E.01261
; LINE_WIDTH: 0.436936
G1 X130.56 Y135.112 E.00608
; LINE_WIDTH: 0.459204
G1 X130.461 Y134.892 E.00642
G1 X130.427 Y135.417 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y137.573 E.05198
G1 X132.722 Y137.573 E.05535
; LINE_WIDTH: 0.433101
G1 X133.014 Y137.56 E.00728
; LINE_WIDTH: 0.450575
G1 X133.305 Y137.547 E.0076
G1 X132.745 Y137.382 E.0152
; LINE_WIDTH: 0.419996
G1 X132.267 Y137.005 E.01468
G1 X132.022 Y136.56 E.01224
G3 X131.958 Y136.112 I1.893 J-.499 E.01095
; WIPE_START
G1 X132.022 Y136.56 E-.21935
G1 X132.267 Y137.005 E-.2458
G1 X132.745 Y137.382 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y134.892 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X130.45 Y133.365 I17.533 J-.888 E.04139
; OBJECT_ID: 88
; WIPE_START
G1 X130.461 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z5.88 F42000
G1 X120.299 Y126.299 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
; WIPE_START
G1 X120.316 Y125.695 E-.23214
G1 X120.513 Y125.261 E-.18109
G1 X120.844 Y124.987 E-.16313
G1 X121.133 Y124.889 E-.11614
G1 X121.308 Y124.874 E-.06651
G1 X121.31 Y124.874 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.286 Y126.714 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.714 Y126.714 E.02449
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
M73 P89 R1
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.285 Y126.654 E.02293
M204 S250
G1 X122.885 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.055 E.02827
; WIPE_START
M204 S4000
G1 X124.117 Y127.115 E-.46878
G1 X124.236 Y127.156 E-.0478
G1 X124.31 Y127.308 E-.06416
G1 X124.31 Y127.78 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y125.169 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.637 Y125.242 E.00793
G1 X119.878 Y124.813 E.01188
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.503 Y125.571 E.00405
M204 S10000
G1 X119.915 Y125.915 F42000
G1 F12000
M204 S4000
G1 X119.978 Y125.423 E.01196
G1 X120.227 Y124.984 E.01216
G1 X120.625 Y124.654 E.01248
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433056
G1 X118.44 Y126.968 E.00719
; LINE_WIDTH: 0.45047
G1 X118.453 Y127.256 E.0075
G1 X118.615 Y126.703 E.015
; LINE_WIDTH: 0.419996
G1 X118.984 Y126.227 E.01453
G1 X119.423 Y125.978 E.01216
G1 X119.855 Y125.922 E.01052
; WIPE_START
G1 X119.423 Y125.978 E-.21486
G1 X118.984 Y126.227 E-.24838
G1 X118.615 Y126.703 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X122.684 Y124.45 E.04405
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y125.169 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y124.813 E.0257
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.429 Y125.503 E.00405
M204 S10000
G1 X124.085 Y125.915 F42000
G1 F12000
M204 S4000
G1 X124.578 Y125.978 E.01197
G1 X125.016 Y126.227 E.01216
G1 X125.346 Y126.625 E.01248
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.032 Y124.44 E.00719
; LINE_WIDTH: 0.45047
G1 X122.744 Y124.453 E.0075
G1 X123.297 Y124.615 E.015
; LINE_WIDTH: 0.419996
G1 X123.773 Y124.984 E.01453
G1 X124.022 Y125.423 E.01216
G1 X124.078 Y125.855 E.01052
; WIPE_START
G1 X124.022 Y125.423 E-.21486
G1 X123.773 Y124.984 E-.24838
G1 X123.297 Y124.615 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.547 Y127.256 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X125.542 Y128.882 E.04402
; WIPE_START
G1 X125.547 Y127.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y130.74 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X124.804 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.363 Y130.758 E.00793
G1 X124.122 Y131.187 E.01188
G1 X125.187 Y131.187 E.0257
G1 X125.187 Y130.122 E.0257
G1 X124.663 Y130.403 E.01434
G1 X124.497 Y130.429 E.00406
M204 S10000
G1 X124.085 Y130.085 F42000
G1 F12000
M204 S4000
G1 X124.022 Y130.577 E.01197
G1 X123.773 Y131.016 E.01216
G1 X123.375 Y131.346 E.01248
; LINE_WIDTH: 0.436936
G1 X123.158 Y131.443 E.00597
; LINE_WIDTH: 0.459209
G1 X122.942 Y131.539 E.0063
G1 X123.456 Y131.573 E.01371
; LINE_WIDTH: 0.419996
G1 X125.573 Y131.573 E.05104
G1 X125.573 Y129.345 E.05373
; LINE_WIDTH: 0.435446
G1 X125.55 Y129.16 E.00469
; LINE_WIDTH: 0.455503
G1 X125.528 Y128.974 E.00492
G1 X125.346 Y129.375 E.01158
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.145 Y130.078 E.01052
; WIPE_START
G1 X124.578 Y130.022 E-.22737
G1 X125.016 Y129.773 E-.26279
G1 X125.346 Y129.375 E-.26984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.942 Y131.539 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X121.316 Y131.55 E.04405
; WIPE_START
G1 X122.942 Y131.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y130.74 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.242 Y130.363 E.00793
G1 X118.813 Y130.122 E.01188
G1 X118.813 Y131.187 E.0257
G1 X119.878 Y131.187 E.0257
G1 X119.597 Y130.663 E.01434
G1 X119.571 Y130.497 E.00406
M204 S10000
G1 X119.915 Y130.085 F42000
G1 F12000
M204 S4000
G1 X119.423 Y130.022 E.01197
G1 X118.984 Y129.773 E.01216
G1 X118.654 Y129.375 E.01248
; LINE_WIDTH: 0.436936
G1 X118.557 Y129.158 E.00597
; LINE_WIDTH: 0.459209
G1 X118.461 Y128.942 E.0063
G1 X118.427 Y129.456 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y131.573 E.05104
G1 X120.68 Y131.573 E.05434
; LINE_WIDTH: 0.433056
G1 X120.968 Y131.56 E.00719
; LINE_WIDTH: 0.45047
G1 X121.256 Y131.547 E.0075
G1 X120.703 Y131.385 E.015
; LINE_WIDTH: 0.419996
G1 X120.227 Y131.016 E.01453
G1 X119.978 Y130.577 E.01216
G1 X119.922 Y130.145 E.01052
; WIPE_START
G1 X119.978 Y130.577 E-.21488
G1 X120.227 Y131.016 E-.24836
G1 X120.703 Y131.385 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.461 Y128.942 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X118.45 Y127.316 E.04405
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.461 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 35/38
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.88 I.302 J1.179 P1  F42000
G1 X130.026 Y125.974 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z6.04 F42000
G1 X135.676 Y120.324 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 35 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer35 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.461 Y122.917 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X130.45 Y121.341 E.04272
; WIPE_START
G1 X130.461 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y124.061 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.431 Y124 E.01233
G1 X130.99 Y123.753 E.0122
G1 X130.656 Y123.354 E.01255
; LINE_WIDTH: 0.436941
G1 X130.558 Y123.135 E.00603
; LINE_WIDTH: 0.459218
G1 X130.461 Y122.917 E.00636
G1 X130.427 Y123.437 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y125.573 E.05151
G1 X132.701 Y125.573 E.05484
; LINE_WIDTH: 0.433081
G1 X132.991 Y125.56 E.00723
; LINE_WIDTH: 0.450528
G1 X133.281 Y125.547 E.00755
G1 X132.724 Y125.383 E.0151
; LINE_WIDTH: 0.419996
G1 X132.247 Y125.01 E.0146
G1 X132 Y124.569 E.0122
G1 X131.946 Y124.121 E.01088
M204 S10000
G1 X131.584 Y124.416 F42000
G1 F12000
M204 S4000
G1 X131.253 Y124.342 E.00819
G1 X130.813 Y124.096 E.01216
G1 X130.813 Y125.187 E.02632
G1 X131.904 Y125.187 E.02632
G1 X131.658 Y124.747 E.01216
G1 X131.597 Y124.474 E.00674
M204 S10000
G1 X131.253 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y124.822 E-.17649
G1 X131.17 Y124.775 E-.1945
G1 X131.198 Y124.727 E-.19452
G1 X131.253 Y124.727 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.917 Y125.539 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X133.341 Y125.55 E.04272
; WIPE_START
G1 X134.917 Y125.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y124.061 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
; LINE_WIDTH: 0.436941
G1 X135.135 Y125.442 E.00603
; LINE_WIDTH: 0.459218
G1 X134.917 Y125.539 E.00636
G1 X135.437 Y125.573 E.01385
; LINE_WIDTH: 0.419996
G1 X137.573 Y125.573 E.05151
G1 X137.573 Y123.324 E.05423
; LINE_WIDTH: 0.435431
G1 X137.55 Y123.137 E.00473
; LINE_WIDTH: 0.45547
G1 X137.528 Y122.949 E.00497
G1 X137.344 Y123.354 E.01169
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.121 Y124.054 E.01088
M204 S10000
G1 X136.416 Y124.416 F42000
G1 F12000
M204 S4000
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.096 E.02632
G1 X136.747 Y124.342 E.01216
G1 X136.474 Y124.403 E.00674
M204 S10000
G1 X136.802 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y124.822 E-.17646
G1 X136.72 Y124.775 E-.19451
G1 X136.747 Y124.727 E-.19453
G1 X136.802 Y124.727 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y121.281 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X137.542 Y122.857 E.04268
; WIPE_START
G1 X137.547 Y121.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P90 R1
G1 X136.061 Y119.939 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.569 Y120 E.01233
G1 X137.01 Y120.247 E.0122
G1 X137.344 Y120.646 E.01255
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.009 Y118.44 E.00723
; LINE_WIDTH: 0.45054
G1 X134.719 Y118.453 E.00755
G1 X135.276 Y118.617 E.0151
; LINE_WIDTH: 0.419996
G1 X135.753 Y118.99 E.0146
G1 X136 Y119.431 E.0122
G1 X136.054 Y119.879 E.01088
M204 S10000
G1 X136.416 Y119.584 F42000
G1 F12000
M204 S4000
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y118.813 E.02632
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.403 Y119.526 E.00674
M204 S10000
G1 X136.802 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y119.273 E-.17646
G1 X136.72 Y119.225 E-.19451
G1 X136.747 Y119.178 E-.19453
G1 X136.802 Y119.178 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.083 Y118.461 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X134.659 Y118.45 E.04272
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y119.939 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X132 Y119.431 E.01233
G1 X132.247 Y118.99 E.0122
G1 X132.646 Y118.656 E.01255
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433086
G1 X130.44 Y120.991 E.00723
; LINE_WIDTH: 0.45054
G1 X130.453 Y121.281 E.00755
G1 X130.617 Y120.724 E.0151
; LINE_WIDTH: 0.419996
G1 X130.99 Y120.247 E.0146
G1 X131.431 Y120 E.0122
G1 X131.879 Y119.946 E.01088
M204 S10000
G1 X131.584 Y119.584 F42000
G1 F12000
M204 S4000
G1 X131.658 Y119.253 E.00819
G1 X131.904 Y118.813 E.01216
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.526 Y119.597 E.00674
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; OBJECT_ID: 66
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.395 Y126.762 Z6.04 F42000
G1 X130.026 Y130.026 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z6.04 F42000
G1 X135.651 Y135.651 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y131.186 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X131.6 Y131.588 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.679 Y131.263 E.00806
G1 X131.929 Y130.813 E.01243
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.542 Y131.604 E.00696
M204 S10000
G1 X131.948 Y131.956 F42000
G1 F12000
M204 S4000
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.888 Y130.56 E.00608
; LINE_WIDTH: 0.459204
G1 X133.108 Y130.461 E.00642
G1 X132.583 Y130.427 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y130.427 E.05199
G1 X130.427 Y132.722 E.05535
; LINE_WIDTH: 0.433106
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450586
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.888 Y131.958 I.499 J1.893 E.01095
; WIPE_START
G1 X131.44 Y132.022 E-.21935
G1 X130.995 Y132.267 E-.2458
G1 X130.618 Y132.745 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04139
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y131.186 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X136.412 Y131.6 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y130.813 E.02693
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.396 Y131.542 E.00696
M204 S10000
G1 X136.044 Y131.948 F42000
G1 F12000
M204 S4000
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y130.427 E.05535
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.042 Y131.888 I-1.893 J.5 E.01095
; WIPE_START
G1 X135.978 Y131.44 E-.21935
G1 X135.733 Y130.995 E-.24581
G1 X135.255 Y130.618 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y133.305 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467495
G1 F12000
M204 S4000
G1 X137.542 Y134.832 E.04134
; WIPE_START
G1 X137.547 Y133.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y136.714 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.494876
G1 F12000
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X136.4 Y136.412 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.052 Y136.044 F42000
G1 F12000
M204 S4000
G1 X135.978 Y136.56 E.01257
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.436936
G1 X135.112 Y137.44 E.00608
; LINE_WIDTH: 0.459204
G1 X134.892 Y137.539 E.00642
G1 X135.417 Y137.573 E.01399
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.05199
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.435416
G1 X137.55 Y135.114 E.00478
; LINE_WIDTH: 0.455437
G1 X137.528 Y134.925 E.00502
G1 X137.342 Y135.333 E.01181
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.112 Y136.042 I-.499 J-1.893 E.01095
; WIPE_START
G1 X136.56 Y135.978 E-.23203
G1 X137.005 Y135.733 E-.26003
G1 X137.342 Y135.333 E-.26794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.892 Y137.539 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X133.365 Y137.55 I-.888 J-17.533 E.04139
; WIPE_START
G1 X134.892 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y136.714 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X131.588 Y136.4 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.263 Y136.321 E.00806
G1 X130.813 Y136.07 E.01243
G1 X130.813 Y137.187 E.02693
G1 X131.93 Y137.187 E.02693
G1 X131.679 Y136.737 E.01243
G1 X131.604 Y136.458 E.00696
M204 S10000
G1 X131.956 Y136.052 F42000
G1 F12000
M204 S4000
G1 X131.44 Y135.978 E.01257
G1 X130.995 Y135.733 E.01224
G1 X130.658 Y135.333 E.01261
; LINE_WIDTH: 0.436936
G1 X130.56 Y135.112 E.00608
; LINE_WIDTH: 0.459204
G1 X130.461 Y134.892 E.00642
G1 X130.427 Y135.417 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y137.573 E.05198
G1 X132.722 Y137.573 E.05535
; LINE_WIDTH: 0.433101
G1 X133.014 Y137.56 E.00728
; LINE_WIDTH: 0.450575
G1 X133.305 Y137.547 E.0076
G1 X132.745 Y137.382 E.0152
; LINE_WIDTH: 0.419996
G1 X132.267 Y137.005 E.01468
G1 X132.022 Y136.56 E.01224
G3 X131.958 Y136.112 I1.893 J-.499 E.01095
; WIPE_START
G1 X132.022 Y136.56 E-.21935
G1 X132.267 Y137.005 E-.2458
G1 X132.745 Y137.382 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y134.892 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X130.45 Y133.365 I17.533 J-.888 E.04139
; OBJECT_ID: 88
; WIPE_START
G1 X130.461 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z6.04 F42000
G1 X120.299 Y126.299 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
M73 P91 R1
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y125.169 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.637 Y125.242 E.00793
G1 X119.878 Y124.813 E.01188
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.503 Y125.571 E.00405
M204 S10000
G1 X119.915 Y125.915 F42000
G1 F12000
M204 S4000
G1 X119.978 Y125.423 E.01196
G1 X120.227 Y124.984 E.01216
G1 X120.625 Y124.654 E.01248
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433056
G1 X118.44 Y126.968 E.00719
; LINE_WIDTH: 0.45047
G1 X118.453 Y127.256 E.0075
G1 X118.615 Y126.703 E.015
; LINE_WIDTH: 0.419996
G1 X118.984 Y126.227 E.01453
G1 X119.423 Y125.978 E.01216
G1 X119.855 Y125.922 E.01052
; WIPE_START
G1 X119.423 Y125.978 E-.21486
G1 X118.984 Y126.227 E-.24838
G1 X118.615 Y126.703 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X122.684 Y124.45 E.04405
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y125.169 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y124.813 E.0257
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.429 Y125.503 E.00405
M204 S10000
G1 X124.085 Y125.915 F42000
G1 F12000
M204 S4000
G1 X124.578 Y125.978 E.01197
G1 X125.016 Y126.227 E.01216
G1 X125.346 Y126.625 E.01248
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.032 Y124.44 E.00719
; LINE_WIDTH: 0.45047
G1 X122.744 Y124.453 E.0075
G1 X123.297 Y124.615 E.015
; LINE_WIDTH: 0.419996
G1 X123.773 Y124.984 E.01453
G1 X124.022 Y125.423 E.01216
G1 X124.078 Y125.855 E.01052
; WIPE_START
G1 X124.022 Y125.423 E-.21486
G1 X123.773 Y124.984 E-.24838
G1 X123.297 Y124.615 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.547 Y127.256 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X125.542 Y128.882 E.04402
; WIPE_START
G1 X125.547 Y127.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y130.74 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X124.804 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.363 Y130.758 E.00793
G1 X124.122 Y131.187 E.01188
G1 X125.187 Y131.187 E.0257
G1 X125.187 Y130.122 E.0257
G1 X124.663 Y130.403 E.01434
G1 X124.497 Y130.429 E.00406
M204 S10000
G1 X124.085 Y130.085 F42000
G1 F12000
M204 S4000
G1 X124.022 Y130.577 E.01197
G1 X123.773 Y131.016 E.01216
G1 X123.375 Y131.346 E.01248
; LINE_WIDTH: 0.436936
G1 X123.158 Y131.443 E.00597
; LINE_WIDTH: 0.459209
G1 X122.942 Y131.539 E.0063
G1 X123.456 Y131.573 E.01371
; LINE_WIDTH: 0.419996
G1 X125.573 Y131.573 E.05104
G1 X125.573 Y129.345 E.05373
; LINE_WIDTH: 0.435446
G1 X125.55 Y129.16 E.00469
; LINE_WIDTH: 0.455503
G1 X125.528 Y128.974 E.00492
G1 X125.346 Y129.375 E.01158
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.145 Y130.078 E.01052
; WIPE_START
G1 X124.578 Y130.022 E-.22737
G1 X125.016 Y129.773 E-.26279
G1 X125.346 Y129.375 E-.26984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.942 Y131.539 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X121.316 Y131.55 E.04405
; WIPE_START
G1 X122.942 Y131.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y130.74 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.242 Y130.363 E.00793
G1 X118.813 Y130.122 E.01188
G1 X118.813 Y131.187 E.0257
G1 X119.878 Y131.187 E.0257
G1 X119.597 Y130.663 E.01434
G1 X119.571 Y130.497 E.00406
M204 S10000
G1 X119.915 Y130.085 F42000
G1 F12000
M204 S4000
G1 X119.423 Y130.022 E.01197
G1 X118.984 Y129.773 E.01216
G1 X118.654 Y129.375 E.01248
; LINE_WIDTH: 0.436936
G1 X118.557 Y129.158 E.00597
; LINE_WIDTH: 0.459209
G1 X118.461 Y128.942 E.0063
G1 X118.427 Y129.456 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y131.573 E.05104
G1 X120.68 Y131.573 E.05434
; LINE_WIDTH: 0.433056
G1 X120.968 Y131.56 E.00719
; LINE_WIDTH: 0.45047
G1 X121.256 Y131.547 E.0075
G1 X120.703 Y131.385 E.015
; LINE_WIDTH: 0.419996
G1 X120.227 Y131.016 E.01453
G1 X119.978 Y130.577 E.01216
G1 X119.922 Y130.145 E.01052
; WIPE_START
G1 X119.978 Y130.577 E-.21488
G1 X120.227 Y131.016 E-.24836
G1 X120.703 Y131.385 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.461 Y128.942 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X118.45 Y127.316 E.04405
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.461 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 36/38
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.04 I.302 J1.179 P1  F42000
G1 X130.026 Y125.974 Z6.04
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z6.2 F42000
G1 X135.676 Y120.324 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
M204 S10000
G1 X135.261 Y120.739 F42000
G1 F9000
M204 S4000
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.261 Y123.261 E.02507
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.26 Y120.679 E.02351
M204 S250
G1 X134.86 Y121.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.86 Y122.86 E.03032
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.08 E.02887
; WIPE_START
M204 S4000
G1 X136.117 Y121.14 E-.47827
G1 X136.235 Y121.18 E-.04742
G1 X136.31 Y121.333 E-.06452
G1 X136.31 Y121.78 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 36 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer36 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X130.461 Y122.917 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X130.45 Y121.341 E.04272
; WIPE_START
G1 X130.461 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y124.061 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.431 Y124 E.01233
G1 X130.99 Y123.753 E.0122
G1 X130.656 Y123.354 E.01255
; LINE_WIDTH: 0.436941
G1 X130.558 Y123.135 E.00603
; LINE_WIDTH: 0.459218
G1 X130.461 Y122.917 E.00636
G1 X130.427 Y123.437 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y125.573 E.05151
G1 X132.701 Y125.573 E.05484
; LINE_WIDTH: 0.433081
G1 X132.991 Y125.56 E.00723
; LINE_WIDTH: 0.450528
G1 X133.281 Y125.547 E.00755
G1 X132.724 Y125.383 E.0151
; LINE_WIDTH: 0.419996
G1 X132.247 Y125.01 E.0146
G1 X132 Y124.569 E.0122
G1 X131.946 Y124.121 E.01088
M204 S10000
G1 X131.584 Y124.416 F42000
G1 F12000
M204 S4000
G1 X131.253 Y124.342 E.00819
G1 X130.813 Y124.096 E.01216
G1 X130.813 Y125.187 E.02632
G1 X131.904 Y125.187 E.02632
G1 X131.658 Y124.747 E.01216
G1 X131.597 Y124.474 E.00674
M204 S10000
G1 X131.253 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y124.822 E-.17649
G1 X131.17 Y124.775 E-.1945
G1 X131.198 Y124.727 E-.19452
G1 X131.253 Y124.727 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.917 Y125.539 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X133.341 Y125.55 E.04272
; WIPE_START
G1 X134.917 Y125.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y124.061 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
; LINE_WIDTH: 0.436941
G1 X135.135 Y125.442 E.00603
; LINE_WIDTH: 0.459218
G1 X134.917 Y125.539 E.00636
G1 X135.437 Y125.573 E.01385
; LINE_WIDTH: 0.419996
G1 X137.573 Y125.573 E.05151
G1 X137.573 Y123.324 E.05423
; LINE_WIDTH: 0.435431
G1 X137.55 Y123.137 E.00473
; LINE_WIDTH: 0.45547
G1 X137.528 Y122.949 E.00497
G1 X137.344 Y123.354 E.01169
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.121 Y124.054 E.01088
M204 S10000
G1 X136.416 Y124.416 F42000
G1 F12000
M204 S4000
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.096 E.02632
G1 X136.747 Y124.342 E.01216
G1 X136.474 Y124.403 E.00674
M204 S10000
G1 X136.802 Y124.727 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y124.822 E-.17646
G1 X136.72 Y124.775 E-.19451
G1 X136.747 Y124.727 E-.19453
G1 X136.802 Y124.727 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y121.281 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X137.542 Y122.857 E.04268
; WIPE_START
G1 X137.547 Y121.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.061 Y119.939 Z6.2 F42000
G1 Z5.8
M73 P92 R1
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.569 Y120 E.01233
G1 X137.01 Y120.247 E.0122
G1 X137.344 Y120.646 E.01255
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.009 Y118.44 E.00723
; LINE_WIDTH: 0.45054
G1 X134.719 Y118.453 E.00755
G1 X135.276 Y118.617 E.0151
; LINE_WIDTH: 0.419996
G1 X135.753 Y118.99 E.0146
G1 X136 Y119.431 E.0122
G1 X136.054 Y119.879 E.01088
M204 S10000
G1 X136.416 Y119.584 F42000
G1 F12000
M204 S4000
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y118.813 E.02632
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.403 Y119.526 E.00674
M204 S10000
G1 X136.802 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X136.747 Y119.273 E-.17646
G1 X136.72 Y119.225 E-.19451
G1 X136.747 Y119.178 E-.19453
G1 X136.802 Y119.178 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.083 Y118.461 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X134.659 Y118.45 E.04272
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y119.939 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X132 Y119.431 E.01233
G1 X132.247 Y118.99 E.0122
G1 X132.646 Y118.656 E.01255
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433086
G1 X130.44 Y120.991 E.00723
; LINE_WIDTH: 0.45054
G1 X130.453 Y121.281 E.00755
G1 X130.617 Y120.724 E.0151
; LINE_WIDTH: 0.419996
G1 X130.99 Y120.247 E.0146
G1 X131.431 Y120 E.0122
G1 X131.879 Y119.946 E.01088
M204 S10000
G1 X131.584 Y119.584 F42000
G1 F12000
M204 S4000
G1 X131.658 Y119.253 E.00819
G1 X131.904 Y118.813 E.01216
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.526 Y119.597 E.00674
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; OBJECT_ID: 66
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.395 Y126.762 Z6.2 F42000
G1 X130.026 Y130.026 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z6.2 F42000
G1 X135.651 Y135.651 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y131.186 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X131.6 Y131.588 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.679 Y131.263 E.00806
G1 X131.929 Y130.813 E.01243
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.542 Y131.604 E.00696
M204 S10000
G1 X131.948 Y131.956 F42000
G1 F12000
M204 S4000
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.888 Y130.56 E.00608
; LINE_WIDTH: 0.459204
G1 X133.108 Y130.461 E.00642
G1 X132.583 Y130.427 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y130.427 E.05199
G1 X130.427 Y132.722 E.05535
; LINE_WIDTH: 0.433106
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450586
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.888 Y131.958 I.499 J1.893 E.01095
; WIPE_START
G1 X131.44 Y132.022 E-.21935
G1 X130.995 Y132.267 E-.2458
G1 X130.618 Y132.745 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04139
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y131.186 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X136.412 Y131.6 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y130.813 E.02693
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.396 Y131.542 E.00696
M204 S10000
G1 X136.044 Y131.948 F42000
G1 F12000
M204 S4000
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y130.427 E.05535
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.042 Y131.888 I-1.893 J.5 E.01095
; WIPE_START
G1 X135.978 Y131.44 E-.21935
G1 X135.733 Y130.995 E-.24581
G1 X135.255 Y130.618 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.547 Y133.305 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467495
G1 F12000
M204 S4000
G1 X137.542 Y134.832 E.04134
; WIPE_START
G1 X137.547 Y133.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.793 Y136.714 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.494876
G1 F12000
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X136.4 Y136.412 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.052 Y136.044 F42000
G1 F12000
M204 S4000
G1 X135.978 Y136.56 E.01257
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.436936
G1 X135.112 Y137.44 E.00608
; LINE_WIDTH: 0.459204
G1 X134.892 Y137.539 E.00642
G1 X135.417 Y137.573 E.01399
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.05199
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.435416
G1 X137.55 Y135.114 E.00478
; LINE_WIDTH: 0.455437
G1 X137.528 Y134.925 E.00502
G1 X137.342 Y135.333 E.01181
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.112 Y136.042 I-.499 J-1.893 E.01095
; WIPE_START
G1 X136.56 Y135.978 E-.23203
G1 X137.005 Y135.733 E-.26003
G1 X137.342 Y135.333 E-.26794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.892 Y137.539 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X133.365 Y137.55 I-.888 J-17.533 E.04139
; WIPE_START
G1 X134.892 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y136.714 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y136.814 I-.029 J.049 E.00681
M204 S10000
G1 X131.588 Y136.4 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.263 Y136.321 E.00806
G1 X130.813 Y136.07 E.01243
G1 X130.813 Y137.187 E.02693
G1 X131.93 Y137.187 E.02693
G1 X131.679 Y136.737 E.01243
G1 X131.604 Y136.458 E.00696
M204 S10000
G1 X131.956 Y136.052 F42000
G1 F12000
M204 S4000
G1 X131.44 Y135.978 E.01257
G1 X130.995 Y135.733 E.01224
G1 X130.658 Y135.333 E.01261
; LINE_WIDTH: 0.436936
G1 X130.56 Y135.112 E.00608
; LINE_WIDTH: 0.459204
G1 X130.461 Y134.892 E.00642
G1 X130.427 Y135.417 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y137.573 E.05198
G1 X132.722 Y137.573 E.05535
; LINE_WIDTH: 0.433101
G1 X133.014 Y137.56 E.00728
; LINE_WIDTH: 0.450575
G1 X133.305 Y137.547 E.0076
G1 X132.745 Y137.382 E.0152
; LINE_WIDTH: 0.419996
G1 X132.267 Y137.005 E.01468
G1 X132.022 Y136.56 E.01224
G3 X131.958 Y136.112 I1.893 J-.499 E.01095
; WIPE_START
G1 X132.022 Y136.56 E-.21935
G1 X132.267 Y137.005 E-.2458
G1 X132.745 Y137.382 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.461 Y134.892 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X130.45 Y133.365 I17.533 J-.888 E.04139
; OBJECT_ID: 88
; WIPE_START
G1 X130.461 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X125.974 Y131.974 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z6.2 F42000
G1 X120.299 Y126.299 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
M73 P93 R1
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
M204 S250
G1 X121.115 Y127.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.885 E.02971
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.055 Y127.115 E.02827
; WIPE_START
M204 S4000
G1 X121.115 Y125.883 E-.46878
G1 X121.156 Y125.764 E-.0478
G1 X121.308 Y125.69 E-.06416
G1 X121.78 Y125.69 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y125.169 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.637 Y125.242 E.00793
G1 X119.878 Y124.813 E.01188
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.503 Y125.571 E.00405
M204 S10000
G1 X119.915 Y125.915 F42000
G1 F12000
M204 S4000
G1 X119.978 Y125.423 E.01196
G1 X120.227 Y124.984 E.01216
G1 X120.625 Y124.654 E.01248
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433056
G1 X118.44 Y126.968 E.00719
; LINE_WIDTH: 0.45047
G1 X118.453 Y127.256 E.0075
G1 X118.615 Y126.703 E.015
; LINE_WIDTH: 0.419996
G1 X118.984 Y126.227 E.01453
G1 X119.423 Y125.978 E.01216
G1 X119.855 Y125.922 E.01052
; WIPE_START
G1 X119.423 Y125.978 E-.21486
G1 X118.984 Y126.227 E-.24838
G1 X118.615 Y126.703 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X122.684 Y124.45 E.04405
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y125.169 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y124.813 E.0257
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.429 Y125.503 E.00405
M204 S10000
G1 X124.085 Y125.915 F42000
G1 F12000
M204 S4000
G1 X124.578 Y125.978 E.01197
G1 X125.016 Y126.227 E.01216
G1 X125.346 Y126.625 E.01248
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.032 Y124.44 E.00719
; LINE_WIDTH: 0.45047
G1 X122.744 Y124.453 E.0075
G1 X123.297 Y124.615 E.015
; LINE_WIDTH: 0.419996
G1 X123.773 Y124.984 E.01453
G1 X124.022 Y125.423 E.01216
G1 X124.078 Y125.855 E.01052
; WIPE_START
G1 X124.022 Y125.423 E-.21486
G1 X123.773 Y124.984 E-.24838
G1 X123.297 Y124.615 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.547 Y127.256 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X125.542 Y128.882 E.04402
; WIPE_START
G1 X125.547 Y127.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y130.74 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X124.804 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.363 Y130.758 E.00793
G1 X124.122 Y131.187 E.01188
G1 X125.187 Y131.187 E.0257
G1 X125.187 Y130.122 E.0257
G1 X124.663 Y130.403 E.01434
G1 X124.497 Y130.429 E.00406
M204 S10000
G1 X124.085 Y130.085 F42000
G1 F12000
M204 S4000
G1 X124.022 Y130.577 E.01197
G1 X123.773 Y131.016 E.01216
G1 X123.375 Y131.346 E.01248
; LINE_WIDTH: 0.436936
G1 X123.158 Y131.443 E.00597
; LINE_WIDTH: 0.459209
G1 X122.942 Y131.539 E.0063
G1 X123.456 Y131.573 E.01371
; LINE_WIDTH: 0.419996
G1 X125.573 Y131.573 E.05104
G1 X125.573 Y129.345 E.05373
; LINE_WIDTH: 0.435446
G1 X125.55 Y129.16 E.00469
; LINE_WIDTH: 0.455503
G1 X125.528 Y128.974 E.00492
G1 X125.346 Y129.375 E.01158
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.145 Y130.078 E.01052
; WIPE_START
G1 X124.578 Y130.022 E-.22737
G1 X125.016 Y129.773 E-.26279
G1 X125.346 Y129.375 E-.26984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.942 Y131.539 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X121.316 Y131.55 E.04405
; WIPE_START
G1 X122.942 Y131.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.241 Y130.74 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y130.831 I-.026 J.043 E.00537
M204 S10000
G1 X119.562 Y130.438 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.242 Y130.363 E.00793
G1 X118.813 Y130.122 E.01188
G1 X118.813 Y131.187 E.0257
G1 X119.878 Y131.187 E.0257
G1 X119.597 Y130.663 E.01434
G1 X119.571 Y130.497 E.00406
M204 S10000
G1 X119.915 Y130.085 F42000
G1 F12000
M204 S4000
G1 X119.423 Y130.022 E.01197
G1 X118.984 Y129.773 E.01216
G1 X118.654 Y129.375 E.01248
; LINE_WIDTH: 0.436936
G1 X118.557 Y129.158 E.00597
; LINE_WIDTH: 0.459209
G1 X118.461 Y128.942 E.0063
G1 X118.427 Y129.456 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y131.573 E.05104
G1 X120.68 Y131.573 E.05434
; LINE_WIDTH: 0.433056
G1 X120.968 Y131.56 E.00719
; LINE_WIDTH: 0.45047
G1 X121.256 Y131.547 E.0075
G1 X120.703 Y131.385 E.015
; LINE_WIDTH: 0.419996
G1 X120.227 Y131.016 E.01453
G1 X119.978 Y130.577 E.01216
G1 X119.922 Y130.145 E.01052
; WIPE_START
G1 X119.978 Y130.577 E-.21488
G1 X120.227 Y131.016 E-.24836
G1 X120.703 Y131.385 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.461 Y128.942 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X118.45 Y127.316 E.04405
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.461 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 37/38
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
M106 S109.65
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I.302 J1.179 P1  F42000
G1 X130.026 Y125.974 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X130.026 Y118.026 E.20656
G1 X137.974 Y118.026 E.20656
G1 X137.974 Y119.225 E.03116
G1 X137.974 Y125.974 E.1754
G1 X130.086 Y125.974 E.205
M204 S10000
G1 X129.611 Y126.389 F42000
G1 F9000
M204 S4000
G1 X129.611 Y117.611 E.22817
G1 X138.389 Y117.611 E.22817
G1 X138.389 Y119.225 E.04196
G1 X138.389 Y126.389 E.1862
G1 X129.671 Y126.389 E.22661
M204 S250
G1 X129.21 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.225 E.04859
G1 X138.79 Y126.79 E.18243
G1 X129.27 Y126.79 E.22957
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.522 Y120.431 Z6.36 F42000
G1 X135.676 Y120.324 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X136.301 Y120.341 E.01623
G1 X136.735 Y120.535 E.01237
G1 X137.012 Y120.866 E.01122
G1 X137.126 Y121.333 E.01249
G1 X137.126 Y122.667 E.03468
G3 X137.012 Y123.134 I-1.009 J0 E.01261
G1 X136.735 Y123.465 E.01122
G1 X136.301 Y123.66 E.01237
G1 X135.676 Y123.676 E.01623
G1 X135.659 Y124.301 E.01623
G1 X135.465 Y124.735 E.01237
G1 X135.134 Y125.012 E.01122
G3 X134.667 Y125.126 I-.467 J-.895 E.01261
G1 X133.333 Y125.126 E.03468
G1 X132.866 Y125.012 E.01249
G1 X132.535 Y124.735 E.01122
G1 X132.34 Y124.301 E.01237
G1 X132.324 Y123.676 E.01623
G1 X131.699 Y123.66 E.01623
G1 X131.265 Y123.465 E.01237
G1 X130.988 Y123.134 E.01122
G3 X130.874 Y122.667 I.895 J-.467 E.01261
G1 X130.874 Y121.333 E.03468
G1 X130.988 Y120.866 E.01249
G1 X131.265 Y120.535 E.01122
G1 X131.699 Y120.341 E.01237
G1 X132.324 Y120.324 E.01623
G1 X132.34 Y119.699 E.01623
G1 X132.535 Y119.265 E.01237
G1 X132.866 Y118.988 E.01122
G3 X133.333 Y118.874 I.467 J.895 E.01261
G1 X134.667 Y118.874 E.03468
G1 X135.134 Y118.988 E.01249
G1 X135.465 Y119.265 E.01122
G1 X135.659 Y119.699 E.01237
G1 X135.675 Y120.264 E.01467
; WIPE_START
G1 X136.301 Y120.341 E-.23964
G1 X136.735 Y120.535 E-.1809
G1 X137.012 Y120.866 E-.16397
G1 X137.122 Y121.315 E-.17549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.261 Y123.261 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X135.261 Y124.117 E.02226
G3 X135.136 Y124.481 I-.593 J0 E.01017
G1 X134.942 Y124.643 E.0066
G1 X134.667 Y124.711 E.00735
G1 X133.333 Y124.711 E.03468
G1 X133.058 Y124.643 E.00735
G1 X132.864 Y124.481 E.0066
G1 X132.749 Y124.225 E.00728
G1 X132.739 Y123.261 E.02507
G1 X131.883 Y123.261 E.02226
G3 X131.519 Y123.136 I0 J-.593 E.01017
G1 X131.357 Y122.942 E.0066
G1 X131.289 Y122.667 E.00735
G1 X131.289 Y121.333 E.03468
G1 X131.357 Y121.058 E.00735
G1 X131.519 Y120.864 E.0066
G1 X131.775 Y120.749 E.00728
G1 X132.739 Y120.739 E.02507
G1 X132.739 Y119.883 E.02226
G3 X132.864 Y119.519 I.593 J0 E.01017
G1 X133.058 Y119.357 E.0066
G1 X133.333 Y119.289 E.00735
G1 X134.667 Y119.289 E.03468
G1 X134.942 Y119.357 E.00735
G1 X135.136 Y119.519 E.0066
G1 X135.251 Y119.775 E.00728
G1 X135.261 Y120.739 E.02507
G1 X136.117 Y120.739 E.02226
G3 X136.481 Y120.864 I0 J.594 E.01017
G1 X136.643 Y121.058 E.0066
G1 X136.711 Y121.333 E.00735
G1 X136.711 Y122.667 E.03468
G1 X136.643 Y122.942 E.00735
G1 X136.481 Y123.136 E.0066
G1 X136.225 Y123.251 E.00728
G1 X135.321 Y123.26 E.02351
M204 S250
G1 X134.86 Y122.86 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.86 Y124.117 E.03032
G1 X134.82 Y124.235 E.00301
G1 X134.667 Y124.31 E.00409
G1 X133.333 Y124.31 E.03218
G1 X133.18 Y124.235 E.00409
G1 X133.14 Y124.117 E.00301
G1 X133.14 Y122.86 E.03032
G1 X131.883 Y122.86 E.03032
G1 X131.765 Y122.82 E.00301
G1 X131.69 Y122.667 E.00409
G1 X131.69 Y121.333 E.03218
G1 X131.765 Y121.18 E.00409
G1 X131.883 Y121.14 E.00301
G1 X133.14 Y121.14 E.03032
G1 X133.14 Y119.883 E.03032
G1 X133.18 Y119.765 E.00301
G1 X133.333 Y119.69 E.00409
G1 X134.667 Y119.69 E.03218
G1 X134.82 Y119.765 E.00409
G1 X134.86 Y119.883 E.00301
G1 X134.86 Y121.14 E.03032
G1 X136.117 Y121.14 E.03032
G1 X136.235 Y121.18 E.00301
G1 X136.31 Y121.333 E.00409
G1 X136.31 Y122.667 E.03218
G1 X136.235 Y122.82 E.00409
G1 X136.117 Y122.86 E.00301
G1 X134.92 Y122.86 E.02887
; WIPE_START
M204 S4000
G1 X134.86 Y124.117 E-.47827
G1 X134.82 Y124.235 E-.04742
G1 X134.667 Y124.31 E-.06452
G1 X134.22 Y124.31 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.36 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 37 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer37 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X134.354 Y125.353 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X134.747 Y125.747 E.01341
G1 X134.201 Y125.747
G1 X133.808 Y125.353 E.01341
G1 X133.241 Y125.331
G1 X133.656 Y125.747 E.01416
G1 X133.111 Y125.747
G1 X130.351 Y122.987 E.09411
G1 X130.253 Y123.435
G1 X132.565 Y125.747 E.07884
G1 X132.02 Y125.747
G1 X130.253 Y123.98 E.06024
G1 X130.253 Y124.526
G1 X131.474 Y125.747 E.04164
G1 X130.929 Y125.747
G1 X130.253 Y125.071 E.02304
; WIPE_START
M204 S4000
G1 X130.929 Y125.747 E-.36304
G1 X131.474 Y125.747 E-.20725
G1 X131.121 Y125.394 E-.18971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.128 Y124.164 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.161079
G1 F15000
M204 S4000
G1 X131.499 Y123.849 E.00558
M204 S10000
G1 X132.151 Y124.501 F42000
; LINE_WIDTH: 0.161082
G1 F15000
M204 S4000
G1 X131.836 Y123.872 E.00558
; WIPE_START
G1 X132.151 Y124.501 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.802 Y124.727 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y124.822 I-.027 J.046 E.00606
M204 S10000
G1 X136.416 Y124.416 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.342 Y124.747 E.00819
G1 X136.096 Y125.187 E.01216
G1 X137.187 Y125.187 E.02632
G1 X137.187 Y124.096 E.02632
G1 X136.747 Y124.342 E.01216
G1 X136.474 Y124.403 E.00674
M204 S10000
G1 X136.061 Y124.061 F42000
G1 F12000
M204 S4000
G1 X136 Y124.569 E.01233
G1 X135.753 Y125.01 E.0122
G1 X135.354 Y125.344 E.01255
G1 X135.199 Y125.41 E.00407
G1 X135.19 Y125.573 E.00393
G1 X137.573 Y125.573 E.05746
G1 X137.573 Y123.324 E.05423
; LINE_WIDTH: 0.436931
G1 X137.556 Y123.12 E.00515
; LINE_WIDTH: 0.458935
G1 X137.539 Y122.917 E.00543
G1 X137.344 Y123.354 E.01271
; LINE_WIDTH: 0.419996
G1 X137.01 Y123.753 E.01255
G1 X136.569 Y124 E.0122
G1 X136.121 Y124.054 E.01088
; WIPE_START
G1 X136.569 Y124 E-.23213
G1 X137.01 Y123.753 E-.26017
G1 X137.344 Y123.354 E-.2677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.539 Y122.917 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467756
G1 F12000
M204 S4000
G1 X137.55 Y121.341 E.04271
; WIPE_START
G1 X137.539 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.802 Y119.178 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X136.797 Y119.273 I-.027 J.046 E.00606
M204 S10000
G1 X136.416 Y119.584 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.747 Y119.658 E.00819
G1 X137.187 Y119.904 E.01216
G1 X137.187 Y118.813 E.02632
G1 X136.096 Y118.813 E.02632
G1 X136.342 Y119.253 E.01216
G1 X136.403 Y119.526 E.00674
M204 S10000
G1 X136.061 Y119.939 F42000
G1 F12000
M204 S4000
G1 X136.569 Y120 E.01233
G1 X137.01 Y120.247 E.0122
G1 X137.344 Y120.646 E.01255
; LINE_WIDTH: 0.433081
G1 X137.445 Y120.963 E.0083
; LINE_WIDTH: 0.450938
G1 X137.547 Y121.281 E.00868
G1 X137.573 Y120.701 E.01511
; LINE_WIDTH: 0.419996
M73 P94 R1
G1 X137.573 Y118.427 E.05484
G1 X135.299 Y118.427 E.05484
; LINE_WIDTH: 0.433086
G1 X135.009 Y118.44 E.00723
; LINE_WIDTH: 0.45054
G1 X134.719 Y118.453 E.00755
G1 X135.276 Y118.617 E.0151
; LINE_WIDTH: 0.419996
G1 X135.753 Y118.99 E.0146
G1 X136 Y119.431 E.0122
G1 X136.054 Y119.879 E.01088
; WIPE_START
G1 X136 Y119.431 E-.21947
G1 X135.753 Y118.99 E-.24599
G1 X135.276 Y118.617 E-.29454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.083 Y118.461 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X134.659 Y118.45 E.04272
; WIPE_START
G1 X133.083 Y118.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.939 Y119.939 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
M73 P94 R0
G1 X132 Y119.431 E.01233
G1 X132.247 Y118.99 E.0122
G1 X132.646 Y118.656 E.01255
; LINE_WIDTH: 0.436941
G1 X132.865 Y118.558 E.00603
; LINE_WIDTH: 0.459218
G1 X133.083 Y118.461 E.00636
G1 X132.563 Y118.427 E.01385
; LINE_WIDTH: 0.419996
G1 X130.427 Y118.427 E.05151
G1 X130.427 Y120.701 E.05484
; LINE_WIDTH: 0.433071
G1 X130.44 Y120.991 E.00723
; LINE_WIDTH: 0.450505
G1 X130.453 Y121.281 E.00755
G1 X130.617 Y120.724 E.0151
; LINE_WIDTH: 0.419996
G1 X130.99 Y120.247 E.0146
G1 X131.431 Y120 E.0122
G1 X131.879 Y119.946 E.01088
M204 S10000
G1 X131.584 Y119.584 F42000
G1 F12000
M204 S4000
G1 X131.658 Y119.253 E.00819
G1 X131.904 Y118.813 E.01216
G1 X130.813 Y118.813 E.02632
G1 X130.813 Y119.904 E.02632
G1 X131.253 Y119.658 E.01216
G1 X131.526 Y119.597 E.00674
M204 S10000
G1 X131.253 Y119.178 F42000
; LINE_WIDTH: 0.473616
G1 F12000
M204 S4000
G2 X131.247 Y119.273 I-.027 J.046 E.00606
; WIPE_START
G1 X131.198 Y119.273 E-.17649
G1 X131.17 Y119.225 E-.1945
G1 X131.198 Y119.178 E-.19452
G1 X131.253 Y119.178 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.451 Y122.734 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.46604
G1 F12000
M204 S4000
G3 X130.45 Y121.341 I34.956 J-.73 E.03761
; OBJECT_ID: 66
; WIPE_START
G1 X130.451 Y122.734 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.026 Y130.026 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X137.974 Y130.026 E.20656
G1 X137.974 Y131.236 E.03143
G1 X137.974 Y137.974 E.17513
G1 X130.026 Y137.974 E.20656
G1 X130.026 Y130.086 E.205
M204 S10000
G1 X129.611 Y129.611 F42000
G1 F9000
M204 S4000
G1 X138.389 Y129.611 E.22817
G1 X138.389 Y131.236 E.04224
G1 X138.389 Y138.389 E.18593
G1 X129.611 Y138.389 E.22817
G1 X129.611 Y129.671 E.22661
M204 S250
G1 X129.21 Y129.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.236 E.04885
G1 X138.79 Y138.79 E.18217
G1 X129.21 Y138.79 E.23102
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.564 Y135.526 Z6.36 F42000
G1 X135.651 Y135.651 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X135.635 Y136.296 E.01676
G1 X135.443 Y136.731 E.01236
G1 X135.112 Y137.01 E.01127
G1 X134.817 Y137.111 E.00811
G1 X134.642 Y137.126 E.00455
G1 X133.358 Y137.126 E.03338
G1 X132.888 Y137.01 E.01257
G1 X132.557 Y136.731 E.01127
G1 X132.365 Y136.296 E.01236
G1 X132.349 Y135.651 E.01676
G1 X131.704 Y135.635 E.01676
G1 X131.269 Y135.443 E.01236
G1 X130.99 Y135.112 E.01127
G1 X130.889 Y134.817 E.00811
G1 X130.874 Y134.642 E.00455
G1 X130.874 Y133.358 E.03338
G1 X130.99 Y132.888 E.01257
G1 X131.269 Y132.557 E.01127
G1 X131.704 Y132.365 E.01236
G1 X132.349 Y132.349 E.01676
G1 X132.365 Y131.704 E.01676
G1 X132.557 Y131.269 E.01236
G1 X132.888 Y130.99 E.01127
G1 X133.183 Y130.889 E.00811
G1 X133.358 Y130.874 E.00455
G1 X134.642 Y130.874 E.03338
G1 X135.112 Y130.99 E.01257
G1 X135.443 Y131.269 E.01127
G1 X135.635 Y131.704 E.01236
G1 X135.651 Y132.349 E.01676
G1 X136.296 Y132.365 E.01676
G1 X136.731 Y132.557 E.01236
G1 X137.01 Y132.888 E.01127
G1 X137.126 Y133.358 E.01257
G1 X137.126 Y134.642 E.03338
G1 X137.111 Y134.817 E.00455
G1 X137.01 Y135.112 E.00811
G1 X136.731 Y135.443 E.01127
G1 X136.296 Y135.635 E.01236
G1 X135.711 Y135.65 E.0152
M204 S10000
G1 X135.236 Y135.236 F42000
G1 F9000
M204 S4000
G1 X135.236 Y136.117 E.02291
G3 X135.113 Y136.478 I-.593 J0 E.01008
G1 X134.918 Y136.642 E.00663
G1 X134.642 Y136.711 E.00739
G1 X133.358 Y136.711 E.03338
G1 X133.082 Y136.642 E.00739
G1 X132.887 Y136.478 E.00663
G1 X132.774 Y136.222 E.00727
G1 X132.764 Y135.236 E.02564
G1 X131.883 Y135.236 E.02291
G3 X131.522 Y135.113 I0 J-.593 E.01008
G1 X131.357 Y134.918 E.00663
G1 X131.289 Y134.642 E.00739
G1 X131.289 Y133.358 E.03338
G1 X131.357 Y133.082 E.00739
G1 X131.522 Y132.887 E.00663
G1 X131.778 Y132.774 E.00727
G1 X132.764 Y132.764 E.02564
G1 X132.764 Y131.883 E.02291
G3 X132.887 Y131.522 I.593 J0 E.01008
G1 X133.082 Y131.357 E.00663
G1 X133.358 Y131.289 E.00739
G1 X134.642 Y131.289 E.03338
G1 X134.918 Y131.357 E.00739
G1 X135.113 Y131.522 E.00663
G1 X135.226 Y131.778 E.00727
G1 X135.236 Y132.764 E.02564
G1 X136.117 Y132.764 E.02291
G3 X136.478 Y132.887 I0 J.594 E.01008
G1 X136.642 Y133.082 E.00663
G1 X136.711 Y133.358 E.00739
G1 X136.711 Y134.642 E.03338
G1 X136.642 Y134.918 E.00739
G1 X136.478 Y135.113 E.00663
G1 X136.222 Y135.226 E.00727
G1 X135.296 Y135.235 E.02408
M204 S250
G1 X134.835 Y134.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X134.835 Y136.117 E.03092
G1 X134.795 Y136.234 E.00299
G1 X134.642 Y136.31 E.00412
G1 X133.358 Y136.31 E.03097
G1 X133.205 Y136.234 E.00412
G1 X133.165 Y136.117 E.00299
G1 X133.165 Y134.835 E.03092
G1 X131.883 Y134.835 E.03092
G1 X131.766 Y134.795 E.00299
G1 X131.69 Y134.642 E.00412
G1 X131.69 Y133.358 E.03097
G1 X131.766 Y133.205 E.00412
G1 X131.883 Y133.165 E.00299
G1 X133.165 Y133.165 E.03092
G1 X133.165 Y131.883 E.03092
G1 X133.205 Y131.766 E.00299
G1 X133.358 Y131.69 E.00412
G1 X134.642 Y131.69 E.03097
G1 X134.795 Y131.766 E.00412
G1 X134.835 Y131.883 E.00299
G1 X134.835 Y133.165 E.03092
G1 X136.117 Y133.165 E.03092
G1 X136.234 Y133.205 E.00299
G1 X136.31 Y133.358 E.00412
G1 X136.31 Y134.642 E.03097
G1 X136.234 Y134.795 E.00412
G1 X136.117 Y134.835 E.00299
G1 X134.895 Y134.835 E.02947
; WIPE_START
M204 S4000
G1 X134.835 Y136.117 E-.48776
G1 X134.795 Y136.234 E-.04705
G1 X134.642 Y136.31 E-.06488
G1 X134.22 Y136.31 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.111 Y137.747 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X130.351 Y134.987 E.09411
G1 X130.253 Y135.435
G1 X132.565 Y137.747 E.07884
G1 X132.02 Y137.747
G1 X130.253 Y135.98 E.06024
G1 X130.253 Y136.526
G1 X131.474 Y137.747 E.04164
G1 X130.929 Y137.747
G1 X130.253 Y137.071 E.02304
; WIPE_START
M204 S4000
G1 X130.929 Y137.747 E-.36303
G1 X131.474 Y137.747 E-.20725
G1 X131.121 Y137.394 E-.18972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.152 Y136.243 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0966093
G1 F15000
M204 S4000
G3 X131.456 Y135.791 I3.419 J-6.034 E.00323
M204 S10000
G1 X132.145 Y136.164 F42000
; LINE_WIDTH: 0.183284
G1 F15000
M204 S4000
G1 X131.445 Y135.805 E.00733
M204 S10000
G1 X132.142 Y136.134 F42000
; LINE_WIDTH: 0.349462
G1 F15000
M204 S4000
G1 X131.478 Y135.841 E.0143
M204 S10000
G1 X132.159 Y136.522 F42000
; LINE_WIDTH: 0.349454
G1 F15000
M204 S4000
G1 X131.866 Y135.858 E.0143
M204 S10000
G1 X132.195 Y136.555 F42000
; LINE_WIDTH: 0.183277
G1 F15000
M204 S4000
G1 X131.836 Y135.855 E.00733
M204 S10000
G1 X132.209 Y136.544 F42000
; LINE_WIDTH: 0.0966141
G1 F15000
M204 S4000
G3 X131.757 Y135.848 I5.582 J-4.115 E.00323
; WIPE_START
G1 X132.209 Y136.544 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.517 Y137.34 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.343766
G1 F15000
M204 S4000
G1 X133.355 Y137.493 E.0043
G1 X132.913 Y137.276 E.00953
; WIPE_START
G1 X133.355 Y137.493 E-.5236
G1 X133.517 Y137.34 E-.2364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.452 Y134.733 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466098
G1 F12000
M204 S4000
G3 X130.45 Y133.365 I36.724 J-.73 E.03694
; WIPE_START
G1 X130.452 Y134.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.264 Y131.186 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X131.262 Y131.286 I-.029 J.049 E.00681
M204 S10000
G1 X131.6 Y131.588 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X131.679 Y131.263 E.00806
G1 X131.929 Y130.813 E.01243
G1 X130.813 Y130.813 E.02693
G1 X130.813 Y131.929 E.02693
G1 X131.263 Y131.679 E.01243
G1 X131.542 Y131.604 E.00696
M204 S10000
G1 X131.948 Y131.956 F42000
G1 F12000
M204 S4000
G1 X132.022 Y131.44 E.01257
G1 X132.267 Y130.995 E.01224
G1 X132.667 Y130.658 E.01261
; LINE_WIDTH: 0.436936
G1 X132.888 Y130.56 E.00608
; LINE_WIDTH: 0.459204
G1 X133.108 Y130.461 E.00642
G1 X132.583 Y130.427 E.01399
; LINE_WIDTH: 0.419996
G1 X130.427 Y130.427 E.05199
G1 X130.427 Y132.722 E.05535
; LINE_WIDTH: 0.433091
G1 X130.44 Y133.014 E.00728
; LINE_WIDTH: 0.450551
G1 X130.453 Y133.305 E.0076
G1 X130.618 Y132.745 E.0152
; LINE_WIDTH: 0.419996
G1 X130.995 Y132.267 E.01468
G1 X131.44 Y132.022 E.01224
G3 X131.888 Y131.958 I.499 J1.893 E.01095
; WIPE_START
G1 X131.44 Y132.022 E-.21935
G1 X130.995 Y132.267 E-.2458
G1 X130.618 Y132.745 E-.29484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.108 Y130.461 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X134.635 Y130.45 I.888 J17.533 E.04139
; WIPE_START
G1 X133.108 Y130.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.044 Y131.948 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X136.56 Y132.022 E.01257
G1 X137.005 Y132.267 E.01224
G1 X137.342 Y132.667 E.01261
; LINE_WIDTH: 0.433101
G1 X137.444 Y132.986 E.00836
; LINE_WIDTH: 0.450985
G1 X137.547 Y133.305 E.00873
G1 X137.573 Y132.722 E.01521
; LINE_WIDTH: 0.419996
G1 X137.573 Y130.427 E.05535
G1 X135.278 Y130.427 E.05535
; LINE_WIDTH: 0.433106
G1 X134.986 Y130.44 E.00728
; LINE_WIDTH: 0.450586
G1 X134.695 Y130.453 E.0076
G1 X135.255 Y130.618 E.0152
; LINE_WIDTH: 0.419996
G1 X135.733 Y130.995 E.01468
G1 X135.978 Y131.44 E.01224
G3 X136.042 Y131.888 I-1.893 J.5 E.01095
M204 S10000
G1 X136.412 Y131.6 F42000
G1 F12000
M204 S4000
G1 X136.737 Y131.679 E.00806
G1 X137.187 Y131.929 E.01243
G1 X137.187 Y130.813 E.02693
G1 X136.07 Y130.813 E.02693
G1 X136.321 Y131.263 E.01243
G1 X136.396 Y131.542 E.00696
M204 S10000
G1 X136.793 Y131.186 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X136.791 Y131.286 I-.029 J.049 E.00681
; WIPE_START
G1 X136.735 Y131.286 E-.18389
G1 X136.707 Y131.236 E-.19204
G1 X136.735 Y131.186 E-.19204
G1 X136.793 Y131.186 E-.19203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.539 Y134.892 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467812
G1 F12000
M204 S4000
G2 X137.55 Y133.365 I-17.551 J-.888 E.04139
; WIPE_START
G1 X137.539 Y134.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.052 Y136.044 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X135.978 Y136.56 E.01257
G1 X135.733 Y137.005 E.01224
G1 X135.333 Y137.342 E.01261
; LINE_WIDTH: 0.435421
G1 X135.13 Y137.442 E.00567
; LINE_WIDTH: 0.453661
G1 X134.927 Y137.542 E.00593
G1 X135.94 Y137.573 E.02658
; LINE_WIDTH: 0.419996
G1 X137.573 Y137.573 E.03937
G1 X137.573 Y135.303 E.05473
; LINE_WIDTH: 0.436931
G1 X137.556 Y135.097 E.0052
; LINE_WIDTH: 0.458936
G1 X137.539 Y134.892 E.00548
G1 X137.342 Y135.333 E.01283
; LINE_WIDTH: 0.419996
G1 X137.005 Y135.733 E.01261
G1 X136.56 Y135.978 E.01224
G3 X136.112 Y136.042 I-.499 J-1.893 E.01095
M204 S10000
G1 X136.4 Y136.412 F42000
G1 F12000
M204 S4000
G1 X136.321 Y136.737 E.00806
G1 X136.07 Y137.187 E.01243
G1 X137.187 Y137.187 E.02693
G1 X137.187 Y136.07 E.02693
G1 X136.737 Y136.321 E.01243
G1 X136.458 Y136.396 E.00696
M204 S10000
G1 X136.793 Y136.714 F42000
; LINE_WIDTH: 0.494876
G1 F12000
M204 S4000
G2 X136.791 Y136.814 I-.029 J.049 E.00681
; WIPE_START
G1 X136.735 Y136.814 E-.18389
G1 X136.707 Y136.764 E-.19204
G1 X136.735 Y136.714 E-.19204
G1 X136.793 Y136.714 E-.19203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.718 Y137.55 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467887
G1 F12000
M204 S4000
G2 X134.832 Y137.542 I.462 J-12.786 E.0302
; OBJECT_ID: 88
; WIPE_START
G1 X133.718 Y137.55 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X127.524 Y133.09 Z6.36 F42000
G1 X125.974 Y131.974 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X118.026 Y131.974 E.20656
G1 X118.026 Y124.026 E.20656
G1 X125.974 Y124.026 E.20656
G1 X125.974 Y125.215 E.03088
G1 X125.974 Y131.914 E.17412
M204 S10000
G1 X126.389 Y132.389 F42000
G1 F9000
M204 S4000
G1 X117.611 Y132.389 E.22817
G1 X117.611 Y123.611 E.22817
G1 X126.389 Y123.611 E.22817
G1 X126.389 Y125.215 E.04169
G1 X126.389 Y132.329 E.18492
M204 S250
G1 X126.79 Y132.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X117.21 Y132.79 E.23102
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.215 E.04834
G1 X126.79 Y132.73 E.18124
; WIPE_START
M204 S4000
G1 X124.79 Y132.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.426 Y126.481 Z6.36 F42000
G1 X120.299 Y126.299 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X120.316 Y125.695 E.01571
G1 X120.513 Y125.261 E.01239
G1 X120.844 Y124.987 E.01116
G3 X121.308 Y124.874 I.464 J.896 E.01253
G1 X122.692 Y124.874 E.03598
G1 X123.156 Y124.987 E.01241
G1 X123.487 Y125.261 E.01116
G1 X123.684 Y125.695 E.01239
G1 X123.701 Y126.299 E.01571
G1 X124.306 Y126.316 E.01571
G1 X124.739 Y126.513 E.01239
G1 X125.013 Y126.844 E.01116
G1 X125.126 Y127.308 E.01241
G1 X125.126 Y128.692 E.03598
G3 X125.013 Y129.156 I-1.009 J0 E.01253
G1 X124.739 Y129.487 E.01116
G1 X124.306 Y129.684 E.01239
G1 X123.701 Y129.701 E.01571
M73 P95 R0
G1 X123.684 Y130.305 E.01571
G1 X123.487 Y130.739 E.01239
G1 X123.156 Y131.013 E.01116
G3 X122.692 Y131.126 I-.464 J-.896 E.01253
G1 X121.308 Y131.126 E.03598
G1 X120.844 Y131.013 E.01241
G1 X120.513 Y130.739 E.01116
G1 X120.316 Y130.305 E.01239
G1 X120.299 Y129.701 E.01571
G1 X119.695 Y129.684 E.01571
G1 X119.261 Y129.487 E.01239
G1 X118.987 Y129.156 E.01116
G3 X118.874 Y128.692 I.896 J-.464 E.01253
G1 X118.874 Y127.308 E.03598
G1 X118.987 Y126.844 E.01241
G1 X119.261 Y126.513 E.01116
G1 X119.695 Y126.316 E.01239
G1 X120.239 Y126.3 E.01415
M204 S10000
G1 X120.714 Y126.714 F42000
G1 F9000
M204 S4000
G1 X120.714 Y125.883 E.02161
G3 X120.841 Y125.517 I.594 J0 E.01025
G1 X121.035 Y125.356 E.00656
G1 X121.308 Y125.289 E.0073
G1 X122.692 Y125.289 E.03598
G1 X122.965 Y125.356 E.0073
G1 X123.159 Y125.517 E.00656
G1 X123.275 Y125.772 E.00728
G1 X123.286 Y126.714 E.02449
G1 X124.117 Y126.714 E.02161
G3 X124.483 Y126.841 I0 J.594 E.01025
G1 X124.644 Y127.035 E.00656
G1 X124.711 Y127.308 E.0073
G1 X124.711 Y128.692 E.03598
G1 X124.644 Y128.965 E.0073
G1 X124.483 Y129.159 E.00656
G1 X124.228 Y129.275 E.00728
G1 X123.286 Y129.286 E.02449
G1 X123.286 Y130.117 E.02161
G3 X123.159 Y130.483 I-.594 J0 E.01025
G1 X122.965 Y130.644 E.00656
G1 X122.692 Y130.711 E.0073
G1 X121.308 Y130.711 E.03598
G1 X121.035 Y130.644 E.0073
G1 X120.841 Y130.483 E.00656
G1 X120.725 Y130.228 E.00728
G1 X120.714 Y129.286 E.02449
G1 X119.883 Y129.286 E.02161
G3 X119.517 Y129.159 I0 J-.594 E.01025
G1 X119.356 Y128.965 E.00656
G1 X119.289 Y128.692 E.0073
G1 X119.289 Y127.308 E.03598
G1 X119.356 Y127.035 E.0073
G1 X119.517 Y126.841 E.00656
G1 X119.772 Y126.725 E.00728
G1 X120.654 Y126.715 E.02293
; WIPE_START
G1 X120.714 Y125.883 E-.31705
G1 X120.742 Y125.702 E-.06942
G1 X120.841 Y125.517 E-.07974
G1 X121.035 Y125.356 E-.09594
G1 X121.308 Y125.289 E-.10671
G1 X121.548 Y125.289 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.115 Y128.885 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X119.883 Y128.885 E.02971
G1 X119.764 Y128.844 E.00303
G1 X119.69 Y128.692 E.00407
G1 X119.69 Y127.308 E.03338
G1 X119.764 Y127.156 E.00407
G1 X119.883 Y127.115 E.00303
G1 X121.115 Y127.115 E.02971
G1 X121.115 Y125.883 E.02971
G1 X121.156 Y125.764 E.00303
G1 X121.308 Y125.69 E.00407
G1 X122.692 Y125.69 E.03338
G1 X122.844 Y125.764 E.00407
G1 X122.885 Y125.883 E.00303
G1 X122.885 Y127.115 E.02971
G1 X124.117 Y127.115 E.02971
G1 X124.236 Y127.156 E.00303
G1 X124.31 Y127.308 E.00407
G1 X124.31 Y128.692 E.03338
G1 X124.236 Y128.844 E.00407
G1 X124.117 Y128.885 E.00303
G1 X122.885 Y128.885 E.02971
G1 X122.885 Y130.117 E.02971
G1 X122.844 Y130.236 E.00303
G1 X122.692 Y130.31 E.00407
G1 X121.308 Y130.31 E.03338
G1 X121.156 Y130.236 E.00407
G1 X121.115 Y130.117 E.00303
G1 X121.115 Y128.945 E.02827
; WIPE_START
M204 S4000
G1 X119.883 Y128.885 E-.46878
G1 X119.764 Y128.844 E-.0478
G1 X119.69 Y128.692 E-.06416
G1 X119.69 Y128.22 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.497 Y131.315 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X123.803 Y130.621 E.02366
G1 X123.584 Y130.948
G1 X124.383 Y131.747 E.02725
G1 X123.838 Y131.747
G1 X123.286 Y131.195 E.01882
G1 X122.883 Y131.337
G1 X123.292 Y131.747 E.01397
G1 X122.747 Y131.747
G1 X122.354 Y131.353 E.01341
G1 X122.201 Y131.747
G1 X121.808 Y131.353 E.01341
G1 X121.648 Y131.739
G1 X121.249 Y131.34 E.01361
; WIPE_START
M204 S4000
G1 X121.648 Y131.739 E-.21449
G1 X121.808 Y131.353 E-.15857
G1 X122.201 Y131.747 E-.21128
G1 X122.354 Y131.353 E-.16021
G1 X122.382 Y131.382 E-.01546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.351 Y128.987 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X121.111 Y131.747 E.09411
G1 X120.565 Y131.747
G1 X118.253 Y129.435 E.07884
G1 X118.253 Y129.98
G1 X120.02 Y131.747 E.06024
G1 X119.474 Y131.747
G1 X118.253 Y130.526 E.04164
G1 X118.253 Y131.071
G1 X118.929 Y131.747 E.02304
; WIPE_START
M204 S4000
G1 X118.253 Y131.071 E-.36303
G1 X118.253 Y130.526 E-.20726
G1 X118.606 Y130.879 E-.18972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.104 Y130.168 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137466
G1 F15000
M204 S4000
G1 X119.533 Y129.88 E.00412
M204 S10000
G1 X120.12 Y130.467 F42000
; LINE_WIDTH: 0.137473
G1 F15000
M204 S4000
G1 X119.832 Y129.896 E.00412
; WIPE_START
G1 X120.12 Y130.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.806 Y131.414 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.106074
G1 F15000
M204 S4000
G1 X122.611 Y131.338 E.00094
; WIPE_START
G1 X122.806 Y131.414 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.465 Y130.97 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.16638
G1 F15000
M204 S4000
G1 X124.306 Y130.749 E.00225
; LINE_WIDTH: 0.19449
G1 X124.216 Y130.638 E.00143
; LINE_WIDTH: 0.221707
G2 X123.963 Y130.401 I-.782 J.584 E.00408
; LINE_WIDTH: 0.194715
G1 X123.955 Y130.38 E.00023
; LINE_WIDTH: 0.152067
G2 X123.908 Y130.273 I-1.125 J.428 E.00086
; WIPE_START
G1 X123.955 Y130.38 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.134 Y131.134 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.548396
G1 F12000
M204 S4000
G1 X125.117 Y130.913 E.00713
M204 S10000
G1 X124.787 Y130.327 F42000
; LINE_WIDTH: 0.406716
G1 F12000
M204 S4000
G1 X124.868 Y130.458 E.0036
; LINE_WIDTH: 0.453316
G1 X124.95 Y130.59 E.00405
; LINE_WIDTH: 0.499916
G1 X125.031 Y130.721 E.0045
; LINE_WIDTH: 0.546516
G1 X125.112 Y130.853 E.00495
G1 X125.136 Y130.738 E.00374
; LINE_WIDTH: 0.499916
G1 X125.159 Y130.624 E.0034
; LINE_WIDTH: 0.453316
G1 X125.182 Y130.509 E.00306
; LINE_WIDTH: 0.386608
G2 X125.206 Y130.084 I-1.035 J-.27 E.00946
G1 X124.838 Y130.297 E.00936
M204 S10000
G1 X124.094 Y130.085 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.118 Y130.18 E.00237
G1 X124.363 Y130.348 E.00717
G3 X124.689 Y131.573 I-1.259 J.991 E.03143
G1 X125.573 Y131.573 E.02132
G1 X125.573 Y129.345 E.05373
; LINE_WIDTH: 0.436931
G1 X125.556 Y129.143 E.00509
; LINE_WIDTH: 0.458933
G1 X125.539 Y128.942 E.00537
G1 X125.346 Y129.375 E.01258
; LINE_WIDTH: 0.419996
G1 X125.016 Y129.773 E.01248
G1 X124.578 Y130.022 E.01216
G1 X124.153 Y130.077 E.01032
; WIPE_START
G1 X124.578 Y130.022 E-.22433
G1 X125.016 Y129.773 E-.26429
G1 X125.346 Y129.375 E-.27138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.539 Y128.942 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467704
G1 F12000
M204 S4000
G1 X125.55 Y127.316 E.04405
; WIPE_START
G1 X125.539 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.812 Y125.169 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X124.804 Y125.26 I-.026 J.043 E.00537
M204 S10000
G1 X124.438 Y125.562 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X124.758 Y125.637 E.00793
G1 X125.187 Y125.878 E.01188
G1 X125.187 Y124.813 E.0257
G1 X124.122 Y124.813 E.0257
G1 X124.403 Y125.337 E.01434
G1 X124.429 Y125.503 E.00405
M204 S10000
G1 X124.085 Y125.915 F42000
G1 F12000
M204 S4000
G1 X124.578 Y125.978 E.01197
G1 X125.016 Y126.227 E.01216
G1 X125.346 Y126.625 E.01248
; LINE_WIDTH: 0.433061
G1 X125.447 Y126.941 E.00825
; LINE_WIDTH: 0.450891
G1 X125.547 Y127.256 E.00862
G1 X125.573 Y126.68 E.01501
; LINE_WIDTH: 0.419996
G1 X125.573 Y124.427 E.05434
G1 X123.32 Y124.427 E.05434
; LINE_WIDTH: 0.433056
G1 X123.032 Y124.44 E.00719
; LINE_WIDTH: 0.45047
G1 X122.744 Y124.453 E.0075
G1 X123.297 Y124.615 E.015
; LINE_WIDTH: 0.419996
G1 X123.773 Y124.984 E.01453
G1 X124.022 Y125.423 E.01216
G1 X124.078 Y125.855 E.01052
; WIPE_START
G1 X124.022 Y125.423 E-.21486
G1 X123.773 Y124.984 E-.24838
G1 X123.297 Y124.615 E-.29676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.058 Y124.461 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X122.684 Y124.45 E.04405
; WIPE_START
G1 X121.058 Y124.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.915 Y125.915 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X119.978 Y125.423 E.01196
G1 X120.227 Y124.984 E.01216
G1 X120.625 Y124.654 E.01248
; LINE_WIDTH: 0.436931
G1 X120.842 Y124.557 E.00597
; LINE_WIDTH: 0.459197
G1 X121.058 Y124.461 E.0063
G1 X120.544 Y124.427 E.01371
; LINE_WIDTH: 0.419996
G1 X118.427 Y124.427 E.05104
G1 X118.427 Y126.68 E.05434
; LINE_WIDTH: 0.433051
G1 X118.44 Y126.968 E.00719
; LINE_WIDTH: 0.450458
G1 X118.453 Y127.256 E.0075
G1 X118.615 Y126.703 E.015
; LINE_WIDTH: 0.419996
G1 X118.984 Y126.227 E.01453
G1 X119.423 Y125.978 E.01216
G1 X119.855 Y125.922 E.01052
M204 S10000
G1 X119.562 Y125.562 F42000
G1 F12000
M204 S4000
G1 X119.637 Y125.242 E.00793
G1 X119.878 Y124.813 E.01188
G1 X118.813 Y124.813 E.0257
G1 X118.813 Y125.878 E.0257
G1 X119.337 Y125.597 E.01434
G1 X119.503 Y125.571 E.00405
M204 S10000
G1 X119.241 Y125.169 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X119.233 Y125.26 I-.026 J.043 E.00537
; WIPE_START
G1 X119.188 Y125.26 E-.16811
G1 X119.162 Y125.215 E-.1973
G1 X119.188 Y125.169 E-.1973
G1 X119.241 Y125.169 E-.19729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.451 Y128.734 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.466028
G1 F12000
M204 S4000
G3 X118.45 Y127.316 I20.981 J-.73 E.03829
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X118.451 Y128.734 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 38/38
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S102
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.36 I.216 J1.198 P1  F42000
G1 X129.21 Y126.79 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X129.21 Y117.21 E.23102
G1 X138.79 Y117.21 E.23102
G1 X138.79 Y119.186 E.04766
G1 X138.79 Y126.79 E.18336
G1 X133.229 Y126.79 E.13411
; LINE_WIDTH: 0.457784
G1 X133.07 Y126.771 E.00424
; LINE_WIDTH: 0.495571
G1 X132.911 Y126.752 E.00462
; LINE_WIDTH: 0.533359
G1 X132.752 Y126.733 E.005
; LINE_WIDTH: 0.571146
G2 X132.426 Y126.731 I-.168 J.734 E.01103
; LINE_WIDTH: 0.537683
G1 X132.259 Y126.748 E.00528
; LINE_WIDTH: 0.50422
G1 X132.092 Y126.765 E.00493
; LINE_WIDTH: 0.470756
G1 X131.408 Y126.775 E.01866
; LINE_WIDTH: 0.49278
G1 X131.225 Y126.754 E.00527
; LINE_WIDTH: 0.534553
G1 X131.042 Y126.733 E.00575
; LINE_WIDTH: 0.576326
G2 X130.713 Y126.731 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X130.565 Y126.751 E.00467
; LINE_WIDTH: 0.498161
G1 X130.418 Y126.77 E.0043
; LINE_WIDTH: 0.459079
G1 X130.271 Y126.79 E.00394
; LINE_WIDTH: 0.419996
G1 X129.27 Y126.79 E.02415
; WIPE_START
M204 S4000
G1 X129.257 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.07 Y122.93 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X131.813 Y122.93 E.03032
G1 X131.681 Y122.878 E.00341
G1 X131.62 Y122.737 E.0037
G1 X131.62 Y121.263 E.03554
G1 X131.696 Y121.11 E.00413
G1 X131.813 Y121.07 E.00298
G1 X133.07 Y121.07 E.03032
G1 X133.07 Y119.813 E.03032
G1 X133.11 Y119.696 E.00298
G1 X133.263 Y119.62 E.00413
G1 X134.737 Y119.62 E.03554
G1 X134.89 Y119.696 E.00413
G1 X134.93 Y119.813 E.00298
G1 X134.93 Y121.07 E.03032
G1 X136.187 Y121.07 E.03032
G1 X136.304 Y121.11 E.00298
G1 X136.38 Y121.263 E.00413
G1 X136.38 Y122.737 E.03554
G1 X136.304 Y122.89 E.00413
G1 X136.187 Y122.93 E.00298
G1 X134.93 Y122.93 E.03032
G1 X134.93 Y124.187 E.03032
G1 X134.89 Y124.304 E.00298
G1 X134.737 Y124.38 E.00413
G1 X133.263 Y124.38 E.03554
G1 X133.112 Y124.306 E.00406
G1 X133.07 Y124.187 E.00304
G1 X133.07 Y122.99 E.02887
; WIPE_START
M204 S4000
G1 X131.813 Y122.93 E-.47827
G1 X131.681 Y122.878 E-.05379
G1 X131.62 Y122.737 E-.05837
G1 X131.62 Y122.291 E-.16958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.55 Y124.696 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X132.895 Y124.816 E.0088
G1 X133.134 Y125.091 E.00881
G1 X133.204 Y125.45 E.00881
G1 X133.084 Y125.795 E.0088
; LINE_WIDTH: 0.451006
G1 X132.813 Y126.049 E.0097
; LINE_WIDTH: 0.489706
G1 X132.708 Y126.094 E.00323
; LINE_WIDTH: 0.528406
G1 X132.604 Y126.139 E.0035
; LINE_WIDTH: 0.567106
G1 X132.5 Y126.184 E.00378
G1 X132.342 Y126.121 E.00565
; LINE_WIDTH: 0.518931
G1 X132.185 Y126.059 E.00514
; LINE_WIDTH: 0.470756
G1 X132.025 Y125.884 E.00646
; LINE_WIDTH: 0.445376
G1 X131.866 Y125.709 E.00609
; LINE_WIDTH: 0.419996
G1 X131.796 Y125.35 E.00881
G1 X131.916 Y125.005 E.0088
G1 X132.191 Y124.766 E.0088
G1 X132.491 Y124.708 E.00736
; WIPE_START
M204 S4000
G1 X132.895 Y124.816 E-.15888
G1 X133.134 Y125.091 E-.13875
G1 X133.204 Y125.45 E-.13875
G1 X133.084 Y125.795 E-.13874
G1 X132.813 Y126.049 E-.14141
G1 X132.708 Y126.094 E-.0431
G1 X132.708 Y126.094 E-.00036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.704 Y125.45 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X131.584 Y125.795 E.0088
; LINE_WIDTH: 0.451006
G1 X131.313 Y126.049 E.0097
; LINE_WIDTH: 0.489706
G1 X131.208 Y126.094 E.00323
; LINE_WIDTH: 0.528406
G1 X131.104 Y126.139 E.0035
; LINE_WIDTH: 0.567106
G1 X131 Y126.184 E.00378
G1 X130.842 Y126.121 E.00565
; LINE_WIDTH: 0.518931
G1 X130.685 Y126.059 E.00514
; LINE_WIDTH: 0.470756
G1 X130.525 Y125.884 E.00646
; LINE_WIDTH: 0.445376
G1 X130.366 Y125.709 E.00609
; LINE_WIDTH: 0.419996
G1 X130.296 Y125.45 E.00646
G1 X130.366 Y125.091 E.00881
G1 X130.605 Y124.816 E.0088
G1 X130.995 Y124.69 E.00988
G1 X131.362 Y124.789 E.00918
G1 X131.634 Y125.091 E.00981
G1 X131.692 Y125.391 E.00736
; WIPE_START
M204 S4000
G1 X131.584 Y125.795 E-.1589
G1 X131.313 Y126.049 E-.14141
G1 X131.208 Y126.094 E-.0431
G1 X131.104 Y126.139 E-.0431
G1 X131 Y126.184 E-.0431
G1 X130.842 Y126.121 E-.06441
G1 X130.685 Y126.059 E-.06441
G1 X130.525 Y125.884 E-.09002
G1 X130.366 Y125.709 E-.09002
G1 X130.351 Y125.654 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 38 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer38 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X138.578 Y125.876 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X137.876 Y126.578 E.02394
G1 X137.33 Y126.578
G1 X138.578 Y125.33 E.04255
G1 X138.578 Y124.785
G1 X136.785 Y126.578 E.06115
G1 X136.24 Y126.578
G1 X138.578 Y124.24 E.07975
G1 X138.578 Y123.694
G1 X135.694 Y126.578 E.09835
G1 X135.149 Y126.578
G1 X138.578 Y123.149 E.11695
G1 X138.578 Y122.603
G1 X134.603 Y126.578 E.13555
G1 X134.058 Y126.578
G1 X138.578 Y122.058 E.15415
G1 X138.578 Y121.513
G1 X133.513 Y126.578 E.17275
G1 X132.99 Y126.555
G1 X138.578 Y120.967 E.19056
G1 X138.578 Y120.422
G1 X136.592 Y122.408 E.06773
G1 X136.592 Y121.862
G1 X138.578 Y119.876 E.06773
G1 X138.578 Y119.331
G1 X136.592 Y121.317 E.06773
G1 X136.426 Y120.938
G1 X138.578 Y118.786 E.07339
G1 X138.578 Y118.24
G1 X135.956 Y120.863 E.08943
G1 X135.413 Y120.86
G1 X138.578 Y117.695 E.10794
G1 X138.305 Y117.422
G1 X135.14 Y120.587 E.10793
G1 X135.138 Y120.044
G1 X137.76 Y117.422 E.08943
G1 X137.214 Y117.422
G1 X135.062 Y119.574 E.07339
G1 X134.683 Y119.408
G1 X136.669 Y117.422 E.06773
G1 X136.124 Y117.422
G1 X134.137 Y119.408 E.06773
G1 X133.592 Y119.408
G1 X135.578 Y117.422 E.06773
; WIPE_START
M204 S4000
G1 X134.164 Y118.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.862 Y123.138 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X135.138 Y123.862 E.02468
G1 X134.412 Y124.588
G1 X133.375 Y125.625 E.03538
G1 X133.356 Y125.099
G1 X133.865 Y124.59 E.01735
G1 X132.862 Y123.956
G1 X132.299 Y124.519 E.01921
G1 X131.572 Y124.701
G1 X132.86 Y123.413 E.04392
G1 X132.588 Y123.139
M73 P96 R0
G1 X131.202 Y124.525 E.04725
G1 X130.601 Y124.58
G1 X132.047 Y123.135 E.0493
; WIPE_START
M204 S4000
G1 X130.633 Y124.549 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.138 Y120.862 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X132.858 Y120.142 E.02455
; WIPE_START
M204 S4000
G1 X132.138 Y120.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.24 Y126.578 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X130.575 Y126.243 E.01141
G1 X130.301 Y125.971
G1 X129.695 Y126.578 E.02068
G1 X129.422 Y126.305
G1 X130.124 Y125.603 E.02394
G1 X130.18 Y125.002
G1 X129.422 Y125.76 E.02586
G1 X129.422 Y125.214
G1 X131.576 Y123.06 E.07346
G1 X131.413 Y122.678
G1 X129.422 Y124.669 E.06791
G1 X129.422 Y124.124
G1 X131.411 Y122.134 E.06784
G1 X131.409 Y121.591
G1 X129.422 Y123.578 E.06777
G1 X129.422 Y123.033
G1 X135.033 Y117.422 E.19135
G1 X134.487 Y117.422
G1 X129.422 Y122.487 E.17274
G1 X129.422 Y121.942
G1 X133.942 Y117.422 E.15414
G1 X133.396 Y117.422
G1 X129.422 Y121.397 E.13554
G1 X129.422 Y120.851
G1 X132.851 Y117.422 E.11694
G1 X132.306 Y117.422
G1 X129.422 Y120.306 E.09834
G1 X129.422 Y119.76
G1 X131.76 Y117.422 E.07974
G1 X131.215 Y117.422
G1 X129.422 Y119.215 E.06114
G1 X129.422 Y118.669
G1 X130.669 Y117.422 E.04254
G1 X130.124 Y117.422
G1 X129.422 Y118.124 E.02394
; WIPE_START
M204 S4000
G1 X130.124 Y117.422 E-.37724
G1 X130.669 Y117.422 E-.20725
G1 X130.343 Y117.749 E-.17551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.722 Y125.256 Z6.52 F42000
G1 X131.866 Y126.043 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X131.376 Y126.533 E.01673
M204 S10000
G1 X131.248 Y126.357 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0814363
G1 F15000
M204 S4000
G1 X131.222 Y126.38 E.0001
; LINE_WIDTH: 0.0963416
G1 X131.211 Y126.406 E.00011
; LINE_WIDTH: 0.135828
G1 X131.2 Y126.431 E.00018
G1 X131.334 Y126.521 E.00102
; WIPE_START
G1 X131.2 Y126.431 E-.64761
G1 X131.211 Y126.406 E-.11239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.539 Y124.518 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.207727
G1 F15000
M204 S4000
G2 X130.118 Y124.939 I1.341 J1.762 E.00648
; WIPE_START
G1 X130.22 Y124.809 E-.20997
G1 X130.409 Y124.62 E-.34023
G1 X130.539 Y124.518 E-.2098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.441 Y125.691 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.184463
G1 F15000
M204 S4000
G3 X133.381 Y125.793 I-.789 J-.393 E.00112
; LINE_WIDTH: 0.160181
G1 X133.319 Y125.873 E.00079
; LINE_WIDTH: 0.132775
G1 X133.258 Y125.953 E.00062
G3 X132.806 Y126.371 I-3.921 J-3.784 E.00379
; LINE_WIDTH: 0.182936
G1 X132.769 Y126.422 E.00059
G1 X132.917 Y126.567 E.00193
; OBJECT_ID: 66
; WIPE_START
G1 X132.769 Y126.422 E-.58209
G1 X132.806 Y126.371 E-.17791
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.21 Y129.21 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X138.79 Y129.21 E.23102
G1 X138.79 Y131.197 E.04792
G1 X138.79 Y138.79 E.1831
G1 X131.996 Y138.79 E.16383
; LINE_WIDTH: 0.451006
G1 X131.408 Y138.774 E.01534
; LINE_WIDTH: 0.49278
G1 X131.225 Y138.754 E.00527
; LINE_WIDTH: 0.534553
G1 X131.042 Y138.733 E.00575
; LINE_WIDTH: 0.576326
G2 X130.713 Y138.731 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X130.565 Y138.751 E.00467
; LINE_WIDTH: 0.498161
G1 X130.418 Y138.77 E.0043
; LINE_WIDTH: 0.459079
G1 X130.271 Y138.79 E.00394
; LINE_WIDTH: 0.419996
G1 X129.21 Y138.79 E.02559
G1 X129.21 Y129.27 E.22957
; WIPE_START
M204 S4000
G1 X131.21 Y129.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.095 Y133.095 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X133.095 Y131.813 E.03092
G1 X133.134 Y131.697 E.00295
G1 X133.288 Y131.62 E.00415
G1 X134.712 Y131.62 E.03434
G1 X134.866 Y131.697 E.00415
G1 X134.905 Y131.813 E.00295
G1 X134.905 Y133.095 E.03092
G1 X136.187 Y133.095 E.03092
G1 X136.303 Y133.134 E.00295
G1 X136.38 Y133.288 E.00415
G1 X136.38 Y134.712 E.03434
G1 X136.303 Y134.866 E.00415
G1 X136.187 Y134.905 E.00295
G1 X134.905 Y134.905 E.03092
G1 X134.905 Y136.187 E.03092
G1 X134.866 Y136.303 E.00295
G1 X134.712 Y136.38 E.00415
G1 X133.288 Y136.38 E.03434
G1 X133.14 Y136.31 E.00394
G1 X133.095 Y136.187 E.00317
G1 X133.095 Y134.905 E.03092
G1 X131.813 Y134.905 E.03092
G1 X131.682 Y134.854 E.00338
G1 X131.62 Y134.712 E.00374
G1 X131.62 Y133.288 E.03434
G1 X131.697 Y133.134 E.00415
G1 X131.813 Y133.095 E.00295
G1 X133.035 Y133.095 E.02947
; WIPE_START
M204 S4000
G1 X133.095 Y131.813 E-.48776
G1 X133.134 Y131.697 E-.0465
G1 X133.288 Y131.62 E-.06539
G1 X133.71 Y131.62 E-.16035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.378 Y136.8 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X131.634 Y137.091 E.00935
G1 X131.704 Y137.45 E.00881
G1 X131.584 Y137.795 E.0088
; LINE_WIDTH: 0.451006
G1 X131.313 Y138.049 E.0097
; LINE_WIDTH: 0.489706
G1 X131.208 Y138.094 E.00323
; LINE_WIDTH: 0.528406
G1 X131.104 Y138.139 E.0035
; LINE_WIDTH: 0.567106
G1 X131 Y138.184 E.00378
G1 X130.842 Y138.121 E.00565
; LINE_WIDTH: 0.518931
G1 X130.685 Y138.059 E.00514
; LINE_WIDTH: 0.470756
G1 X130.525 Y137.884 E.00646
; LINE_WIDTH: 0.445376
G1 X130.366 Y137.709 E.00609
; LINE_WIDTH: 0.419996
G1 X130.296 Y137.45 E.00646
G1 X130.366 Y137.091 E.00881
G1 X130.605 Y136.816 E.0088
G1 X130.995 Y136.69 E.00988
G1 X131.32 Y136.784 E.00817
; WIPE_START
M204 S4000
G1 X131.634 Y137.091 E-.16707
G1 X131.704 Y137.45 E-.13875
G1 X131.584 Y137.795 E-.13874
G1 X131.313 Y138.049 E-.14141
G1 X131.208 Y138.094 E-.0431
G1 X131.104 Y138.139 E-.0431
G1 X131 Y138.184 E-.0431
G1 X130.891 Y138.14 E-.04472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.876 Y138.578 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X138.578 Y137.876 E.02394
G1 X138.578 Y137.33
G1 X137.33 Y138.578 E.04255
G1 X136.785 Y138.578
G1 X138.578 Y136.785 E.06115
G1 X138.578 Y136.24
G1 X136.24 Y138.578 E.07975
G1 X135.694 Y138.578
G1 X138.578 Y135.694 E.09835
G1 X138.578 Y135.149
G1 X135.149 Y138.578 E.11695
G1 X134.603 Y138.578
G1 X138.578 Y134.603 E.13555
G1 X138.578 Y134.058
G1 X134.058 Y138.578 E.15415
G1 X133.513 Y138.578
G1 X138.578 Y133.513 E.17275
G1 X138.578 Y132.967
G1 X132.967 Y138.578 E.19135
G1 X132.422 Y138.578
G1 X134.412 Y136.587 E.06788
G1 X133.865 Y136.59
G1 X131.876 Y138.578 E.06781
G1 X131.376 Y138.533
G1 X133.317 Y136.592 E.06621
G1 X132.954 Y136.41
G1 X131.915 Y137.449 E.03544
G1 X131.818 Y137
G1 X132.887 Y135.931 E.03647
G1 X132.885 Y135.388
G1 X131.575 Y136.698 E.04466
G1 X131.201 Y136.526
G1 X132.613 Y135.114 E.04813
G1 X132.072 Y135.11
G1 X130.601 Y136.58 E.05014
; WIPE_START
M204 S4000
G1 X132.016 Y135.166 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.575 Y138.243 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X130.24 Y138.578 E.01141
G1 X129.695 Y138.578
G1 X130.301 Y137.971 E.02068
G1 X130.124 Y137.603
G1 X129.422 Y138.305 E.02394
G1 X129.422 Y137.76
G1 X130.18 Y137.001 E.02586
G1 X129.422 Y137.214
G1 X131.591 Y135.046 E.07396
G1 X131.413 Y134.677
G1 X129.422 Y136.669 E.06792
G1 X129.422 Y136.123
G1 X131.411 Y134.134 E.06784
G1 X131.409 Y133.591
G1 X129.422 Y135.578 E.06777
; WIPE_START
M204 S4000
G1 X130.836 Y134.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.883 Y132.117 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X132.113 Y132.887 E.02626
; WIPE_START
M204 S4000
G1 X132.883 Y132.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.113 Y135.887 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X135.887 Y135.113 E.02638
G1 X136.592 Y134.408
G1 X138.578 Y132.422 E.06773
G1 X138.578 Y131.876
G1 X136.592 Y133.862 E.06773
G1 X136.592 Y133.317
G1 X138.578 Y131.331 E.06773
G1 X138.578 Y130.786
G1 X136.409 Y132.955 E.07398
G1 X135.931 Y132.887
G1 X138.578 Y130.24 E.09028
G1 X138.578 Y129.695
G1 X135.388 Y132.885 E.10879
G1 X135.115 Y132.612
G1 X138.305 Y129.422 E.10878
G1 X137.76 Y129.422
G1 X135.113 Y132.069 E.09027
G1 X135.045 Y131.591
G1 X137.214 Y129.422 E.07397
G1 X136.669 Y129.422
G1 X134.683 Y131.408 E.06773
G1 X134.137 Y131.408
G1 X136.123 Y129.422 E.06773
G1 X135.578 Y129.422
G1 X133.592 Y131.408 E.06773
; WIPE_START
M204 S4000
G1 X135.006 Y129.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.033 Y129.422 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X129.422 Y135.033 E.19134
G1 X129.422 Y134.487
G1 X134.487 Y129.422 E.17274
G1 X133.942 Y129.422
G1 X129.422 Y133.942 E.15414
G1 X129.422 Y133.396
G1 X133.396 Y129.422 E.13554
G1 X132.851 Y129.422
G1 X129.422 Y132.851 E.11694
M73 P97 R0
G1 X129.422 Y132.306
G1 X132.306 Y129.422 E.09834
G1 X131.76 Y129.422
G1 X129.422 Y131.76 E.07974
G1 X129.422 Y131.215
G1 X131.215 Y129.422 E.06114
G1 X130.669 Y129.422
G1 X129.422 Y130.669 E.04254
G1 X129.422 Y130.124
G1 X130.124 Y129.422 E.02394
; WIPE_START
M204 S4000
G1 X129.422 Y130.124 E-.37722
G1 X129.422 Y130.669 E-.20725
G1 X129.749 Y130.343 E-.17553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.967 Y137.646 Z6.52 F42000
G1 X131.972 Y137.664 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102849
G1 F15000
M204 S4000
G1 X131.901 Y137.436 E.00102
; WIPE_START
G1 X131.972 Y137.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.248 Y138.357 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.0814348
G1 F15000
M204 S4000
G1 X131.222 Y138.38 E.0001
; LINE_WIDTH: 0.0963387
G1 X131.211 Y138.405 E.00011
; LINE_WIDTH: 0.135815
G1 X131.2 Y138.431 E.00018
G1 X131.334 Y138.521 E.00102
; WIPE_START
G1 X131.2 Y138.431 E-.64766
G1 X131.211 Y138.405 E-.11234
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.446 Y137.463 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.0947271
G1 F15000
M204 S4000
G1 X129.423 Y137.291 E.00065
; WIPE_START
G1 X129.446 Y137.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.539 Y136.518 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.203125
G1 F15000
M204 S4000
G2 X130.215 Y136.813 I2.164 J2.696 E.00463
G1 X130.182 Y137.006 E.00207
; WIPE_START
G1 X130.215 Y136.813 E-.23427
G1 X130.409 Y136.62 E-.32805
G1 X130.539 Y136.518 E-.19768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.816 Y135.089 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.110268
G1 F15000
M204 S4000
G3 X131.647 Y135.085 I-.083 J-.071 E.00092
; OBJECT_ID: 88
; WIPE_START
G1 X131.727 Y135.127 E-.36617
G1 X131.816 Y135.089 E-.39383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X126.79 Y132.79 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X122.997 Y132.79 E.09148
; LINE_WIDTH: 0.451006
G1 X122.408 Y132.775 E.01534
; LINE_WIDTH: 0.49278
G1 X122.225 Y132.754 E.00527
; LINE_WIDTH: 0.534553
G1 X122.043 Y132.733 E.00575
; LINE_WIDTH: 0.576326
G2 X121.702 Y132.731 I-.173 J.704 E.01165
; LINE_WIDTH: 0.537244
G1 X121.544 Y132.751 E.005
; LINE_WIDTH: 0.498161
G1 X121.387 Y132.77 E.00461
; LINE_WIDTH: 0.459079
G1 X121.229 Y132.79 E.00422
; LINE_WIDTH: 0.457784
G1 X121.07 Y132.771 E.00424
; LINE_WIDTH: 0.495571
G1 X120.911 Y132.752 E.00462
; LINE_WIDTH: 0.533359
G1 X120.752 Y132.733 E.005
; LINE_WIDTH: 0.571146
G2 X120.426 Y132.731 I-.168 J.734 E.01103
; LINE_WIDTH: 0.537683
G1 X120.259 Y132.748 E.00528
; LINE_WIDTH: 0.50422
G1 X120.092 Y132.765 E.00493
; LINE_WIDTH: 0.470756
G1 X119.408 Y132.775 E.01866
; LINE_WIDTH: 0.49278
G1 X119.225 Y132.754 E.00527
; LINE_WIDTH: 0.534553
G1 X119.043 Y132.733 E.00575
; LINE_WIDTH: 0.576326
G2 X118.713 Y132.731 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X118.566 Y132.751 E.00467
; LINE_WIDTH: 0.498161
G1 X118.418 Y132.77 E.0043
; LINE_WIDTH: 0.459079
G1 X118.271 Y132.79 E.00394
; LINE_WIDTH: 0.419996
G1 X117.21 Y132.79 E.02559
G1 X117.21 Y123.21 E.23102
G1 X126.79 Y123.21 E.23102
G1 X126.79 Y125.176 E.0474
G1 X126.79 Y132.73 E.18217
; WIPE_START
M204 S4000
G1 X124.79 Y132.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.955 Y128.955 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X122.955 Y130.187 E.02971
G1 X122.882 Y130.338 E.00403
G1 X122.762 Y130.38 E.00307
G1 X122.092 Y130.364 E.01617
; LINE_WIDTH: 0.435356
G1 X121.758 Y130.387 E.00838
; LINE_WIDTH: 0.482486
G1 X121.425 Y130.411 E.00937
; LINE_WIDTH: 0.518621
G1 X121.289 Y130.422 E.00413
; LINE_WIDTH: 0.554756
G1 X121.153 Y130.433 E.00444
G1 X121.152 Y130.408 E.0008
; LINE_WIDTH: 0.509836
G1 X121.151 Y130.383 E.00073
; LINE_WIDTH: 0.464916
G1 X121.15 Y130.359 E.00067
; LINE_WIDTH: 0.419996
G1 X121.049 Y130.226 E.00403
G1 X121.045 Y128.955 E.03065
G1 X119.813 Y128.955 E.02971
G1 X119.68 Y128.902 E.00345
G1 X119.62 Y128.762 E.00367
G1 X119.62 Y127.238 E.03675
G1 X119.695 Y127.085 E.0041
G1 X119.813 Y127.045 E.003
G1 X121.045 Y127.045 E.02971
G1 X121.045 Y125.813 E.02971
G1 X121.085 Y125.695 E.003
G1 X121.238 Y125.62 E.0041
G1 X122.762 Y125.62 E.03675
G1 X122.915 Y125.695 E.0041
G1 X122.955 Y125.813 E.003
G1 X122.955 Y127.045 E.02971
G1 X124.187 Y127.045 E.02971
G1 X124.305 Y127.085 E.003
G1 X124.38 Y127.238 E.0041
G1 X124.38 Y128.762 E.03675
G1 X124.305 Y128.915 E.0041
G1 X124.187 Y128.955 E.003
G1 X123.015 Y128.955 E.02827
; WIPE_START
M204 S4000
G1 X122.955 Y130.187 E-.46878
G1 X122.882 Y130.338 E-.06357
G1 X122.762 Y130.38 E-.04842
G1 X122.29 Y130.369 E-.17923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.209 Y131.417 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X121.084 Y131.795 E.00961
; LINE_WIDTH: 0.451006
G1 X120.813 Y132.049 E.0097
; LINE_WIDTH: 0.489706
G1 X120.708 Y132.094 E.00323
; LINE_WIDTH: 0.528406
G1 X120.604 Y132.139 E.0035
; LINE_WIDTH: 0.567106
G1 X120.5 Y132.184 E.00378
G1 X120.342 Y132.121 E.00565
; LINE_WIDTH: 0.518931
G1 X120.185 Y132.059 E.00514
; LINE_WIDTH: 0.470756
G1 X120.025 Y131.884 E.00646
; LINE_WIDTH: 0.445376
G1 X119.866 Y131.709 E.00609
; LINE_WIDTH: 0.419996
G1 X119.791 Y131.417 E.00727
G1 X119.866 Y131.091 E.00805
G1 X120.137 Y130.79 E.00979
G1 X120.511 Y130.69 E.00934
G1 X120.875 Y130.798 E.00914
; LINE_WIDTH: 0.464916
G1 X120.897 Y130.788 E.00067
; LINE_WIDTH: 0.509836
G1 X120.92 Y130.778 E.00073
; LINE_WIDTH: 0.554756
G1 X120.943 Y130.768 E.0008
G1 X121.199 Y131.074 E.013
G1 X121.25 Y131.263 E.00637
G1 X121.368 Y130.957 E.01066
G1 X121.475 Y130.875 E.0044
; LINE_WIDTH: 0.518621
G1 X121.583 Y130.794 E.00409
; LINE_WIDTH: 0.482486
G1 X121.814 Y130.753 E.00659
; LINE_WIDTH: 0.435356
G1 X122.046 Y130.712 E.00589
; LINE_WIDTH: 0.419996
G1 X122.395 Y130.816 E.00878
G1 X122.634 Y131.091 E.00881
G1 X122.704 Y131.45 E.00881
G1 X122.584 Y131.795 E.0088
; LINE_WIDTH: 0.451006
G1 X122.313 Y132.049 E.0097
; LINE_WIDTH: 0.489706
G1 X122.208 Y132.094 E.00323
; LINE_WIDTH: 0.528406
G1 X122.104 Y132.139 E.0035
; LINE_WIDTH: 0.567106
G1 X122 Y132.184 E.00378
G1 X121.842 Y132.121 E.00565
; LINE_WIDTH: 0.518931
G1 X121.685 Y132.059 E.00514
; LINE_WIDTH: 0.470756
G1 X121.525 Y131.884 E.00646
; LINE_WIDTH: 0.445376
G1 X121.366 Y131.709 E.00609
; LINE_WIDTH: 0.419996
G1 X121.291 Y131.417 E.00727
G1 X121.269 Y131.417 E.00051
; WIPE_START
M204 S4000
G1 X121.084 Y131.795 E-.16
G1 X120.813 Y132.049 E-.14141
G1 X120.708 Y132.094 E-.0431
G1 X120.604 Y132.139 E-.0431
G1 X120.5 Y132.184 E-.0431
G1 X120.342 Y132.121 E-.06441
G1 X120.185 Y132.059 E-.06441
G1 X120.025 Y131.884 E-.09002
G1 X119.866 Y131.709 E-.09002
G1 X119.852 Y131.657 E-.02042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.704 Y131.45 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X119.584 Y131.795 E.0088
; LINE_WIDTH: 0.451006
G1 X119.313 Y132.049 E.0097
; LINE_WIDTH: 0.489706
G1 X119.208 Y132.094 E.00323
; LINE_WIDTH: 0.528406
G1 X119.104 Y132.139 E.0035
; LINE_WIDTH: 0.567106
G1 X119 Y132.184 E.00378
G1 X118.842 Y132.121 E.00565
; LINE_WIDTH: 0.518931
G1 X118.685 Y132.059 E.00514
; LINE_WIDTH: 0.470756
G1 X118.525 Y131.884 E.00646
; LINE_WIDTH: 0.445376
G1 X118.366 Y131.709 E.00609
; LINE_WIDTH: 0.419996
G1 X118.296 Y131.45 E.00646
G1 X118.366 Y131.091 E.00881
G1 X118.605 Y130.816 E.0088
G1 X118.995 Y130.69 E.00987
G1 X119.363 Y130.79 E.0092
G1 X119.634 Y131.091 E.00979
G1 X119.692 Y131.391 E.00736
; WIPE_START
M204 S4000
G1 X119.584 Y131.795 E-.1589
G1 X119.313 Y132.049 E-.14141
G1 X119.208 Y132.094 E-.0431
G1 X119.104 Y132.139 E-.0431
G1 X119 Y132.184 E-.0431
G1 X118.842 Y132.121 E-.06441
G1 X118.685 Y132.059 E-.06441
G1 X118.525 Y131.884 E-.09002
G1 X118.366 Y131.709 E-.09002
G1 X118.351 Y131.654 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.876 Y132.578 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X126.578 Y131.876 E.02394
G1 X126.578 Y131.33
G1 X125.33 Y132.578 E.04255
G1 X124.785 Y132.578
G1 X126.578 Y130.785 E.06115
G1 X126.578 Y130.24
G1 X124.24 Y132.578 E.07975
G1 X123.694 Y132.578
G1 X126.578 Y129.694 E.09835
G1 X126.578 Y129.149
G1 X123.149 Y132.578 E.11695
G1 X122.615 Y132.567
G1 X126.578 Y128.603 E.13517
G1 X126.578 Y128.058
G1 X122.796 Y131.84 E.12899
G1 X122.881 Y131.21
G1 X126.578 Y127.513 E.12608
G1 X126.578 Y126.967
G1 X122.712 Y130.833 E.13184
G1 X123.167 Y129.833
G1 X123.837 Y129.163 E.02284
G1 X124.588 Y128.412
G1 X126.578 Y126.422 E.06788
G1 X126.578 Y125.876
G1 X124.59 Y127.865 E.06781
G1 X124.592 Y127.317
G1 X126.578 Y125.331 E.06774
G1 X126.578 Y124.786
G1 X124.44 Y126.924 E.07291
G1 X123.98 Y126.838
G1 X126.578 Y124.24 E.08859
G1 X126.578 Y123.695
G1 X123.438 Y126.835 E.10709
G1 X123.167 Y126.56
G1 X126.305 Y123.422 E.10703
G1 X125.76 Y123.422
G1 X123.167 Y126.015 E.08843
G1 X123.076 Y125.56
G1 X125.214 Y123.422 E.07291
G1 X124.669 Y123.422
G1 X122.683 Y125.408 E.06773
G1 X122.138 Y125.408
G1 X124.124 Y123.422 E.06773
G1 X123.578 Y123.422
G1 X121.592 Y125.408 E.06773
G1 X120.837 Y126.163
G1 X120.163 Y126.837 E.02298
; WIPE_START
M204 S4000
G1 X120.837 Y126.163 E-.36212
G1 X121.577 Y125.423 E-.39788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.833 Y129.985 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X120.301 Y130.517 E.01814
G1 X119.576 Y130.697
G1 X120.833 Y129.44 E.04287
G1 X120.562 Y129.166
G1 X119.202 Y130.525 E.04636
G1 X118.602 Y130.58
G1 X120.019 Y129.163 E.04833
; WIPE_START
M204 S4000
G1 X118.605 Y130.577 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.575 Y132.243 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X118.24 Y132.578 E.01141
G1 X117.695 Y132.578
G1 X118.301 Y131.971 E.02068
G1 X118.12 Y131.607
G1 X117.422 Y132.305 E.0238
G1 X117.422 Y131.76
G1 X118.18 Y131.002 E.02586
G1 X117.422 Y131.214
G1 X119.561 Y129.075 E.07296
G1 X119.408 Y128.683
G1 X117.422 Y130.669 E.06773
G1 X117.422 Y130.124
G1 X119.408 Y128.137 E.06773
G1 X119.408 Y127.592
G1 X117.422 Y129.578 E.06773
G1 X117.422 Y129.033
G1 X123.033 Y123.422 E.19134
G1 X122.487 Y123.422
G1 X117.422 Y128.487 E.17274
G1 X117.422 Y127.942
G1 X121.942 Y123.422 E.15414
G1 X121.397 Y123.422
G1 X117.422 Y127.396 E.13554
G1 X117.422 Y126.851
G1 X120.851 Y123.422 E.11694
G1 X120.306 Y123.422
G1 X117.422 Y126.306 E.09834
G1 X117.422 Y125.76
G1 X119.76 Y123.422 E.07974
G1 X119.215 Y123.422
G1 X117.422 Y125.215 E.06114
G1 X117.422 Y124.669
G1 X118.669 Y123.422 E.04254
G1 X118.124 Y123.422
G1 X117.422 Y124.124 E.02394
; WIPE_START
M204 S4000
G1 X118.124 Y123.422 E-.37722
G1 X118.669 Y123.422 E-.20725
G1 X118.343 Y123.749 E-.17553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.722 Y131.256 Z6.52 F42000
G1 X119.866 Y132.043 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X119.376 Y132.533 E.01673
; WIPE_START
M204 S4000
G1 X119.866 Y132.043 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.436 Y132.11 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X120.991 Y132.554 E.01515
; WIPE_START
M204 S4000
G1 X121.436 Y132.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.858 Y131.903 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.223329
G1 F15000
M204 S4000
G3 X122.401 Y132.353 I-2.468 J-2.05 E.0076
; LINE_WIDTH: 0.269773
G1 X122.353 Y132.41 E.00109
; LINE_WIDTH: 0.263594
G1 X122.388 Y132.448 E.00074
; LINE_WIDTH: 0.197656
G2 X122.57 Y132.582 I.336 J-.267 E.00233
; WIPE_START
G1 X122.388 Y132.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.446 Y131.463 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.0947271
G1 F15000
M204 S4000
G1 X117.423 Y131.291 E.00065
M204 S10000
G1 X118.1 Y131.354 F42000
; LINE_WIDTH: 0.130646
G1 F15000
M204 S4000
G1 X118.054 Y131.471 E.00076
G1 X118.11 Y131.58 E.00074
; WIPE_START
G1 X118.054 Y131.471 E-.37552
G1 X118.1 Y131.354 E-.38448
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P98 R0
G1 X118.539 Y130.518 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.203134
G1 F15000
M204 S4000
G2 X118.215 Y130.813 I2.167 J2.699 E.00463
G1 X118.182 Y131.006 E.00206
; WIPE_START
G1 X118.215 Y130.813 E-.23412
G1 X118.409 Y130.62 E-.32813
G1 X118.539 Y130.518 E-.19775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.248 Y132.357 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.0814363
G1 F15000
M204 S4000
G1 X119.222 Y132.38 E.0001
; LINE_WIDTH: 0.0963416
G1 X119.211 Y132.406 E.00011
; LINE_WIDTH: 0.135828
G1 X119.2 Y132.431 E.00018
G1 X119.335 Y132.521 E.00102
; WIPE_START
G1 X119.2 Y132.431 E-.64761
G1 X119.211 Y132.406 E-.11239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.28 Y131.932 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.131907
G1 F15000
M204 S4000
G1 X120.807 Y132.37 E.00393
; LINE_WIDTH: 0.183627
G1 X120.769 Y132.422 E.0006
G1 X120.918 Y132.567 E.00194
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X120.769 Y132.422 E-.58094
G1 X120.807 Y132.37 E-.17906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z6.52 F900 ; lower z a little
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

    G1 Z106.12 F600
    G1 Z104.12

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

