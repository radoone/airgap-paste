; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 23m 6s; total estimated time: 29m 53s
; total layer number: 83
; total filament length [mm] : 1176.08
; total filament volume [cm^3] : 2828.81
; total filament weight [g] : 3.51
; model label id: 83,94,105,116
; object max height: 1.50,1.50,1.50,8.30
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.30
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
; brim_object_gap = 0.15
; brim_type = no_brim
; brim_width = 4
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
; filament_colour = #EF7525
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
; print_settings_id = AirGap Pocket Recess A1 PLA
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
; support_on_build_plate_only = 0
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
M73 P0 R29
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
M73 P1 R29
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P2 R29
G1 X-48.2 F3000
M73 P3 R28
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
M73 P5 R28
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
M73 P20 R23
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
    G29 A1 X103 Y103 I50 J50
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
M73 P21 R23
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
; layer num/total_layer_count: 1/83
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X149.332 Y122.375 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X149.332 Y123.332 E.01866
G1 X132.668 Y123.332 E.32491
G1 X132.668 Y106.668 E.32491
G1 X149.332 Y106.668 E.32491
G1 X149.332 Y122.315 E.30508
M204 S6000
G1 X148.854 Y122.375 F42000
G1 F1500
M204 S500
G1 X148.854 Y122.854 E.00933
G1 X133.146 Y122.854 E.30625
G1 X133.146 Y107.146 E.30625
M73 P22 R23
G1 X148.854 Y107.146 E.30625
G1 X148.854 Y122.315 E.29575
M204 S6000
G1 X148.375 Y122.375 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X133.625 Y122.375 E.28759
G1 X133.625 Y107.625 E.28759
G1 X148.375 Y107.625 E.28759
G1 X148.375 Y122.315 E.28642
; WIPE_START
G1 X146.375 Y122.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.907 Y123.899 Z.5 F42000
G1 X130.282 Y125.718 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X130.282 Y104.282 E.41795
G1 X151.717 Y104.282 E.41793
G1 X151.718 Y125.718 E.41795
G1 X130.342 Y125.718 E.41678
M204 S6000
G1 X129.891 Y126.157 F42000
G1 F1500
M204 S500
G1 X129.868 Y126.143 E.00052
G3 X129.804 Y125.976 I.137 J-.149 E.00361
G1 X129.804 Y104.024 E.42801
G3 X130.024 Y103.804 I.205 J-.015 E.00689
G1 X130.489 Y103.804 E.00907
G1 X151.977 Y103.804 E.41897
M73 P23 R23
G3 X152.196 Y103.988 I.017 J.201 E.00619
G1 X152.195 Y126.008 E.42934
G3 X151.976 Y126.197 I-.204 J-.015 E.00626
G1 X130.016 Y126.197 E.42817
M73 P23 R22
G3 X129.947 Y126.188 I-.011 J-.202 E.00136
G1 X129.943 Y126.186 E.00008
M204 S6000
G1 X129.65 Y126.571 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X129.325 Y125.99 I.363 J-.584 E.01355
G1 X129.325 Y104.01 E.42857
G3 X130.01 Y103.325 I.684 J-.001 E.02097
G1 X130.489 Y103.325 E.00935
G1 X151.992 Y103.325 E.41925
G3 X152.674 Y103.974 I-.001 J.684 E.02024
G1 X152.675 Y125.993 E.42933
G3 X151.99 Y126.675 I-.684 J-.002 E.02091
G1 X130.006 Y126.675 E.42863
G3 X129.702 Y126.601 I.007 J-.688 E.00616
; WIPE_START
G1 X129.542 Y126.495 E-.0728
G1 X129.456 Y126.399 E-.04913
G1 X129.388 Y126.284 E-.05062
G1 X129.338 Y126.129 E-.06192
G1 X129.325 Y125.99 E-.05311
G1 X129.325 Y124.747 E-.47243
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 1 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer1 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X150.553 Y104.474 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50276
G1 F2400
M204 S500
G1 X151.31 Y105.231 E.02102
G1 X151.311 Y105.912 E.01335
G1 X150.087 Y104.689 E.03392
G1 X149.407 Y104.689 E.01335
G1 X151.311 Y106.593 E.0528
G1 X151.311 Y107.273 E.01335
G1 X148.726 Y104.689 E.07168
G1 X148.045 Y104.689 E.01335
G1 X151.311 Y107.954 E.09056
G1 X151.311 Y108.635 E.01335
G1 X149.739 Y107.063 E.04359
G1 X149.739 Y107.744 E.01335
G1 X151.311 Y109.316 E.04359
G1 X151.311 Y109.996 E.01335
G1 X149.739 Y108.424 E.04359
G1 X149.739 Y109.105 E.01335
G1 X151.311 Y110.677 E.04359
G1 X151.311 Y111.358 E.01335
G1 X149.739 Y109.786 E.04359
G1 X149.739 Y110.466 E.01335
G1 X151.311 Y112.038 E.04359
G1 X151.311 Y112.719 E.01335
G1 X149.739 Y111.147 E.04359
G1 X149.739 Y111.828 E.01335
G1 X151.311 Y113.4 E.04359
G1 X151.311 Y114.08 E.01335
G1 X149.739 Y112.508 E.04359
G1 X149.739 Y113.189 E.01335
G1 X151.311 Y114.761 E.0436
G1 X151.311 Y115.442 E.01335
G1 X149.739 Y113.87 E.0436
G1 X149.739 Y114.55 E.01335
G1 X151.311 Y116.122 E.0436
G1 X151.311 Y116.803 E.01335
G1 X149.739 Y115.231 E.0436
G1 X149.739 Y115.912 E.01335
G1 X151.311 Y117.484 E.0436
G1 X151.311 Y118.164 E.01335
G1 X149.739 Y116.592 E.0436
G1 X149.739 Y117.273 E.01335
G1 X151.311 Y118.845 E.0436
G1 X151.311 Y119.526 E.01335
G1 X149.739 Y117.954 E.0436
G1 X149.739 Y118.634 E.01335
G1 X151.311 Y120.206 E.0436
G1 X151.311 Y120.887 E.01335
G1 X149.739 Y119.315 E.0436
G1 X149.739 Y119.996 E.01335
M73 P24 R22
G1 X151.311 Y121.568 E.0436
G1 X151.311 Y122.249 E.01335
G1 X149.739 Y120.676 E.0436
G1 X149.739 Y121.357 E.01335
G1 X151.311 Y122.929 E.0436
G1 X151.311 Y123.61 E.01335
G1 X149.739 Y122.038 E.0436
G1 X149.739 Y122.718 E.01335
G1 X151.311 Y124.291 E.0436
G1 X151.311 Y124.971 E.01335
G1 X149.739 Y123.399 E.04361
G1 X149.739 Y123.739 E.00667
G1 X149.398 Y123.739 E.00668
G1 X150.97 Y125.311 E.04361
G1 X150.29 Y125.311 E.01335
G1 X148.717 Y123.739 E.04361
G1 X148.037 Y123.739 E.01335
G1 X149.609 Y125.311 E.04361
G1 X148.929 Y125.311 E.01335
G1 X147.356 Y123.739 E.04361
G1 X146.675 Y123.739 E.01335
G1 X148.248 Y125.311 E.04361
G1 X147.567 Y125.311 E.01335
G1 X145.995 Y123.739 E.04361
G1 X145.314 Y123.739 E.01335
G1 X146.887 Y125.311 E.04361
G1 X146.206 Y125.311 E.01335
G1 X144.633 Y123.739 E.04361
G1 X143.953 Y123.739 E.01335
G1 X145.525 Y125.311 E.04361
G1 X144.845 Y125.311 E.01335
G1 X143.272 Y123.739 E.04361
G1 X142.591 Y123.739 E.01335
G1 X144.164 Y125.311 E.04361
G1 X143.483 Y125.311 E.01335
G1 X141.911 Y123.739 E.04361
G1 X141.23 Y123.739 E.01335
G1 X142.803 Y125.311 E.04361
G1 X142.122 Y125.311 E.01335
G1 X140.55 Y123.739 E.04361
G1 X139.869 Y123.739 E.01335
G1 X141.441 Y125.311 E.04361
G1 X140.761 Y125.311 E.01335
G1 X139.188 Y123.739 E.04361
G1 X138.508 Y123.739 E.01335
G1 X140.08 Y125.311 E.04361
G1 X139.399 Y125.311 E.01335
G1 X137.827 Y123.739 E.04361
G1 X137.146 Y123.739 E.01335
G1 X138.719 Y125.311 E.04361
G1 X138.038 Y125.311 E.01335
G1 X136.466 Y123.739 E.04361
G1 X135.785 Y123.739 E.01335
G1 X137.357 Y125.311 E.04361
G1 X136.677 Y125.311 E.01335
G1 X135.104 Y123.739 E.04361
G1 X134.424 Y123.739 E.01335
G1 X135.996 Y125.311 E.04361
G1 X135.315 Y125.311 E.01335
G1 X133.743 Y123.739 E.04361
G1 X133.062 Y123.739 E.01335
G1 X134.85 Y125.527 E.04958
; WIPE_START
G1 X133.436 Y124.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.805 Y117.855 Z.5 F42000
G1 X147.149 Y104.473 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X148.937 Y106.261 E.04958
G1 X148.256 Y106.261 E.01335
G1 X146.684 Y104.689 E.04361
G1 X146.003 Y104.689 E.01335
G1 X147.576 Y106.261 E.04361
G1 X146.895 Y106.261 E.01335
G1 X145.323 Y104.689 E.04361
G1 X144.642 Y104.689 E.01335
G1 X146.214 Y106.261 E.04361
G1 X145.534 Y106.261 E.01335
G1 X143.961 Y104.689 E.04361
G1 X143.281 Y104.689 E.01335
G1 X144.853 Y106.261 E.04361
G1 X144.172 Y106.261 E.01335
G1 X142.6 Y104.689 E.04361
G1 X141.919 Y104.689 E.01335
G1 X143.492 Y106.261 E.04361
G1 X142.811 Y106.261 E.01335
G1 X141.239 Y104.689 E.04361
G1 X140.558 Y104.689 E.01335
G1 X142.13 Y106.261 E.04361
G1 X141.45 Y106.261 E.01335
G1 X139.877 Y104.689 E.04361
G1 X139.197 Y104.689 E.01335
G1 X140.769 Y106.261 E.04361
G1 X140.088 Y106.261 E.01335
G1 X138.516 Y104.689 E.04361
G1 X137.835 Y104.689 E.01335
G1 X139.408 Y106.261 E.04361
G1 X138.727 Y106.261 E.01335
G1 X137.155 Y104.689 E.04361
G1 X136.474 Y104.689 E.01335
G1 X138.046 Y106.261 E.04361
G1 X137.366 Y106.261 E.01335
G1 X135.793 Y104.689 E.04361
G1 X135.113 Y104.689 E.01335
G1 X136.685 Y106.261 E.04361
G1 X136.004 Y106.261 E.01335
G1 X134.432 Y104.689 E.04361
G1 X133.751 Y104.689 E.01335
G1 X135.324 Y106.261 E.04361
G1 X134.643 Y106.261 E.01335
G1 X133.071 Y104.689 E.04361
G1 X132.39 Y104.689 E.01335
G1 X133.962 Y106.261 E.04361
G1 X133.282 Y106.261 E.01335
G1 X131.709 Y104.689 E.04361
G1 X131.029 Y104.689 E.01335
G1 X132.601 Y106.261 E.04361
G1 X132.261 Y106.261 E.00667
G1 X132.261 Y106.602 E.00668
G1 X130.689 Y105.03 E.04361
G1 X130.689 Y105.71 E.01335
G1 X132.261 Y107.283 E.04361
G1 X132.261 Y107.963 E.01335
G1 X130.689 Y106.391 E.04361
G1 X130.689 Y107.072 E.01335
G1 X132.261 Y108.644 E.04361
G1 X132.261 Y109.325 E.01335
G1 X130.689 Y107.752 E.04361
G1 X130.689 Y108.433 E.01335
G1 X132.261 Y110.005 E.04361
G1 X132.261 Y110.686 E.01335
G1 X130.689 Y109.113 E.04361
G1 X130.689 Y109.794 E.01335
G1 X132.261 Y111.367 E.04361
G1 X132.261 Y112.047 E.01335
G1 X130.689 Y110.475 E.04361
G1 X130.689 Y111.155 E.01335
G1 X132.261 Y112.728 E.04361
G1 X132.261 Y113.409 E.01335
G1 X130.689 Y111.836 E.04361
G1 X130.689 Y112.517 E.01335
G1 X132.261 Y114.089 E.04361
G1 X132.261 Y114.77 E.01335
G1 X130.689 Y113.197 E.04361
G1 X130.689 Y113.878 E.01335
G1 X132.261 Y115.451 E.04361
G1 X132.261 Y116.131 E.01335
G1 X130.689 Y114.559 E.04361
G1 X130.689 Y115.239 E.01335
G1 X132.261 Y116.812 E.04361
G1 X132.261 Y117.492 E.01335
G1 X130.689 Y115.92 E.04361
G1 X130.689 Y116.601 E.01335
G1 X132.261 Y118.173 E.04361
G1 X132.261 Y118.854 E.01335
G1 X130.689 Y117.281 E.04361
G1 X130.689 Y117.962 E.01335
G1 X132.261 Y119.534 E.04361
G1 X132.261 Y120.215 E.01335
G1 X130.689 Y118.643 E.04361
G1 X130.689 Y119.323 E.01335
G1 X132.261 Y120.896 E.04361
G1 X132.261 Y121.576 E.01335
G1 X130.689 Y120.004 E.04361
G1 X130.689 Y120.685 E.01335
G1 X132.261 Y122.257 E.04361
G1 X132.261 Y122.938 E.01335
G1 X130.689 Y121.365 E.04361
G1 X130.689 Y122.046 E.01335
G1 X133.954 Y125.311 E.09055
G1 X133.273 Y125.311 E.01335
G1 X130.689 Y122.727 E.07168
G1 X130.689 Y123.407 E.01335
G1 X132.593 Y125.311 E.0528
G1 X131.912 Y125.311 E.01335
G1 X130.689 Y124.088 E.03392
G1 X130.689 Y124.769 E.01335
G1 X131.447 Y125.527 E.02102
; OBJECT_ID: 83
; WIPE_START
G1 X130.689 Y124.769 E-.4073
G1 X130.689 Y124.088 E-.25865
G1 X130.864 Y124.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S6000
G1 X135.503 Y130.324 Z.5 F42000
G1 X149.282 Y148.325 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X149.282 Y149.282 E.01866
G1 X132.718 Y149.282 E.32296
G1 X132.718 Y132.718 E.32296
G1 X149.282 Y132.718 E.32296
G1 X149.282 Y148.265 E.30313
M204 S6000
G1 X148.804 Y148.325 F42000
G1 F1500
M204 S500
G1 X148.804 Y148.804 E.00933
G1 X133.196 Y148.804 E.3043
G1 X133.196 Y133.196 E.3043
G1 X148.804 Y133.196 E.3043
G1 X148.804 Y148.265 E.2938
M204 S6000
G1 X148.325 Y148.325 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X133.675 Y148.325 E.28564
G1 X133.675 Y133.675 E.28564
G1 X148.325 Y133.675 E.28564
G1 X148.325 Y148.265 E.28447
; WIPE_START
G1 X146.325 Y148.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.863 Y149.876 Z.5 F42000
G1 X130.282 Y151.718 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X130.282 Y130.282 E.41795
G1 X151.717 Y130.282 E.41793
G1 X151.718 Y151.718 E.41795
G1 X130.342 Y151.718 E.41678
M204 S6000
G1 X129.891 Y152.157 F42000
G1 F1500
M204 S500
G1 X129.868 Y152.143 E.00052
G3 X129.804 Y151.976 I.137 J-.149 E.00361
G1 X129.804 Y130.024 E.42801
M73 P25 R22
G3 X130.024 Y129.804 I.205 J-.015 E.00689
G1 X130.489 Y129.804 E.00907
G1 X151.977 Y129.804 E.41897
G3 X152.196 Y129.988 I.017 J.201 E.00619
G1 X152.195 Y152.008 E.42934
G3 X151.976 Y152.196 I-.204 J-.015 E.00626
G1 X130.016 Y152.196 E.42817
G3 X129.947 Y152.188 I-.011 J-.202 E.00136
G1 X129.943 Y152.186 E.00008
M204 S6000
G1 X129.65 Y152.571 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X129.325 Y151.99 I.363 J-.584 E.01355
G1 X129.325 Y130.01 E.42857
G3 X130.01 Y129.325 I.684 J-.001 E.02097
G1 X130.489 Y129.325 E.00935
G1 X151.992 Y129.325 E.41925
G3 X152.674 Y129.973 I-.001 J.684 E.02024
G1 X152.675 Y151.993 E.42933
G3 X151.99 Y152.675 I-.684 J-.002 E.02091
G1 X130.006 Y152.675 E.42863
G3 X129.702 Y152.601 I.007 J-.688 E.00616
; WIPE_START
G1 X129.542 Y152.495 E-.0728
G1 X129.456 Y152.399 E-.04913
G1 X129.388 Y152.284 E-.05062
G1 X129.338 Y152.129 E-.06192
G1 X129.325 Y151.99 E-.05311
G1 X129.325 Y150.747 E-.47243
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.845 Y145.475 Z.5 F42000
G1 X150.553 Y130.473 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50276
G1 F2400
M204 S500
G1 X151.31 Y131.231 E.02102
G1 X151.311 Y131.912 E.01335
G1 X150.087 Y130.689 E.03392
G1 X149.407 Y130.689 E.01335
G1 X151.311 Y132.593 E.0528
G1 X151.311 Y133.273 E.01335
G1 X148.726 Y130.689 E.07168
G1 X148.045 Y130.689 E.01335
G1 X151.311 Y133.954 E.09056
G1 X151.311 Y134.635 E.01335
G1 X149.689 Y133.013 E.04498
G1 X149.689 Y133.694 E.01335
G1 X151.311 Y135.316 E.04498
G1 X151.311 Y135.996 E.01335
G1 X149.689 Y134.374 E.04498
G1 X149.689 Y135.055 E.01335
G1 X151.311 Y136.677 E.04498
G1 X151.311 Y137.358 E.01335
G1 X149.689 Y135.736 E.04498
G1 X149.689 Y136.416 E.01335
G1 X151.311 Y138.038 E.04498
G1 X151.311 Y138.719 E.01335
G1 X149.689 Y137.097 E.04498
G1 X149.689 Y137.778 E.01335
G1 X151.311 Y139.4 E.04498
G1 X151.311 Y140.08 E.01335
G1 X149.689 Y138.458 E.04498
G1 X149.689 Y139.139 E.01335
G1 X151.311 Y140.761 E.04498
G1 X151.311 Y141.442 E.01335
G1 X149.689 Y139.82 E.04498
G1 X149.689 Y140.5 E.01335
G1 X151.311 Y142.122 E.04498
G1 X151.311 Y142.803 E.01335
G1 X149.689 Y141.181 E.04498
G1 X149.689 Y141.862 E.01335
G1 X151.311 Y143.484 E.04498
G1 X151.311 Y144.164 E.01335
G1 X149.689 Y142.542 E.04499
G1 X149.689 Y143.223 E.01335
G1 X151.311 Y144.845 E.04499
G1 X151.311 Y145.526 E.01335
G1 X149.689 Y143.904 E.04499
G1 X149.689 Y144.584 E.01335
G1 X151.311 Y146.206 E.04499
G1 X151.311 Y146.887 E.01335
G1 X149.689 Y145.265 E.04499
G1 X149.689 Y145.946 E.01335
G1 X151.311 Y147.568 E.04499
G1 X151.311 Y148.249 E.01335
G1 X149.689 Y146.626 E.04499
G1 X149.689 Y147.307 E.01335
G1 X151.311 Y148.929 E.04499
M73 P26 R22
G1 X151.311 Y149.61 E.01335
G1 X149.689 Y147.988 E.04499
G1 X149.689 Y148.668 E.01335
G1 X151.311 Y150.291 E.04499
G1 X151.311 Y150.971 E.01335
G1 X149.689 Y149.349 E.04499
G1 X149.689 Y149.689 E.00667
G1 X149.348 Y149.689 E.00668
G1 X150.97 Y151.311 E.04499
G1 X150.29 Y151.311 E.01335
G1 X148.667 Y149.689 E.04499
G1 X147.987 Y149.689 E.01335
G1 X149.609 Y151.311 E.04499
G1 X148.929 Y151.311 E.01335
G1 X147.306 Y149.689 E.04499
G1 X146.625 Y149.689 E.01335
G1 X148.248 Y151.311 E.04499
G1 X147.567 Y151.311 E.01335
G1 X145.945 Y149.689 E.04499
G1 X145.264 Y149.689 E.01335
G1 X146.887 Y151.311 E.04499
G1 X146.206 Y151.311 E.01335
G1 X144.583 Y149.689 E.04499
G1 X143.903 Y149.689 E.01335
G1 X145.525 Y151.311 E.04499
G1 X144.845 Y151.311 E.01335
G1 X143.222 Y149.689 E.04499
G1 X142.541 Y149.689 E.01335
G1 X144.164 Y151.311 E.04499
G1 X143.483 Y151.311 E.01335
G1 X141.861 Y149.689 E.04499
G1 X141.18 Y149.689 E.01335
G1 X142.803 Y151.311 E.04499
G1 X142.122 Y151.311 E.01335
G1 X140.5 Y149.689 E.04499
G1 X139.819 Y149.689 E.01335
G1 X141.441 Y151.311 E.04499
G1 X140.761 Y151.311 E.01335
G1 X139.138 Y149.689 E.04499
G1 X138.458 Y149.689 E.01335
G1 X140.08 Y151.311 E.04499
G1 X139.399 Y151.311 E.01335
G1 X137.777 Y149.689 E.04499
G1 X137.096 Y149.689 E.01335
G1 X138.719 Y151.311 E.04499
G1 X138.038 Y151.311 E.01335
G1 X136.416 Y149.689 E.04499
G1 X135.735 Y149.689 E.01335
G1 X137.357 Y151.311 E.04499
G1 X136.677 Y151.311 E.01335
G1 X135.054 Y149.689 E.04499
G1 X134.374 Y149.689 E.01335
G1 X135.996 Y151.311 E.04499
G1 X135.315 Y151.311 E.01335
G1 X133.693 Y149.689 E.04499
G1 X133.012 Y149.689 E.01335
G1 X134.85 Y151.527 E.05097
; WIPE_START
G1 X133.436 Y150.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.805 Y143.855 Z.5 F42000
G1 X147.149 Y130.473 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X148.987 Y132.311 E.05096
G1 X148.306 Y132.311 E.01335
G1 X146.684 Y130.689 E.04499
G1 X146.003 Y130.689 E.01335
G1 X147.626 Y132.311 E.04499
G1 X146.945 Y132.311 E.01335
G1 X145.323 Y130.689 E.04499
G1 X144.642 Y130.689 E.01335
G1 X146.264 Y132.311 E.04499
G1 X145.584 Y132.311 E.01335
G1 X143.961 Y130.689 E.04499
G1 X143.281 Y130.689 E.01335
G1 X144.903 Y132.311 E.04499
G1 X144.222 Y132.311 E.01335
G1 X142.6 Y130.689 E.04499
G1 X141.919 Y130.689 E.01335
G1 X143.542 Y132.311 E.04499
G1 X142.861 Y132.311 E.01335
G1 X141.239 Y130.689 E.04499
G1 X140.558 Y130.689 E.01335
G1 X142.18 Y132.311 E.04499
G1 X141.5 Y132.311 E.01335
G1 X139.877 Y130.689 E.04499
G1 X139.197 Y130.689 E.01335
G1 X140.819 Y132.311 E.04499
G1 X140.138 Y132.311 E.01335
G1 X138.516 Y130.689 E.04499
G1 X137.835 Y130.689 E.01335
G1 X139.458 Y132.311 E.04499
G1 X138.777 Y132.311 E.01335
G1 X137.155 Y130.689 E.04499
G1 X136.474 Y130.689 E.01335
G1 X138.096 Y132.311 E.04499
G1 X137.416 Y132.311 E.01335
G1 X135.793 Y130.689 E.04499
G1 X135.113 Y130.689 E.01335
G1 X136.735 Y132.311 E.04499
G1 X136.054 Y132.311 E.01335
G1 X134.432 Y130.689 E.04499
G1 X133.751 Y130.689 E.01335
G1 X135.374 Y132.311 E.04499
G1 X134.693 Y132.311 E.01335
G1 X133.071 Y130.689 E.04499
G1 X132.39 Y130.689 E.01335
G1 X134.012 Y132.311 E.04499
G1 X133.332 Y132.311 E.01335
G1 X131.709 Y130.689 E.04499
G1 X131.029 Y130.689 E.01335
G1 X132.651 Y132.311 E.04499
M73 P26 R21
G1 X132.311 Y132.311 E.00667
G1 X132.311 Y132.652 E.00668
G1 X130.689 Y131.03 E.04499
G1 X130.689 Y131.71 E.01335
G1 X132.311 Y133.333 E.04499
G1 X132.311 Y134.013 E.01335
G1 X130.689 Y132.391 E.04499
G1 X130.689 Y133.071 E.01335
G1 X132.311 Y134.694 E.04499
G1 X132.311 Y135.375 E.01335
G1 X130.689 Y133.752 E.04499
G1 X130.689 Y134.433 E.01335
G1 X132.311 Y136.055 E.04499
G1 X132.311 Y136.736 E.01335
G1 X130.689 Y135.113 E.04499
G1 X130.689 Y135.794 E.01335
G1 X132.311 Y137.417 E.04499
G1 X132.311 Y138.097 E.01335
G1 X130.689 Y136.475 E.04499
G1 X130.689 Y137.155 E.01335
G1 X132.311 Y138.778 E.04499
G1 X132.311 Y139.459 E.01335
G1 X130.689 Y137.836 E.04499
G1 X130.689 Y138.517 E.01335
G1 X132.311 Y140.139 E.04499
G1 X132.311 Y140.82 E.01335
G1 X130.689 Y139.197 E.04499
G1 X130.689 Y139.878 E.01335
G1 X132.311 Y141.5 E.04499
G1 X132.311 Y142.181 E.01335
G1 X130.689 Y140.559 E.04499
G1 X130.689 Y141.239 E.01335
G1 X132.311 Y142.862 E.04499
G1 X132.311 Y143.542 E.01335
G1 X130.689 Y141.92 E.04499
G1 X130.689 Y142.601 E.01335
G1 X132.311 Y144.223 E.04499
G1 X132.311 Y144.904 E.01335
G1 X130.689 Y143.281 E.04499
G1 X130.689 Y143.962 E.01335
G1 X132.311 Y145.584 E.04499
G1 X132.311 Y146.265 E.01335
G1 X130.689 Y144.643 E.04499
G1 X130.689 Y145.323 E.01335
G1 X132.311 Y146.946 E.04499
G1 X132.311 Y147.626 E.01335
G1 X130.689 Y146.004 E.04499
G1 X130.689 Y146.685 E.01335
G1 X132.311 Y148.307 E.04499
G1 X132.311 Y148.988 E.01335
G1 X130.689 Y147.365 E.04499
G1 X130.689 Y148.046 E.01335
G1 X133.954 Y151.311 E.09055
G1 X133.273 Y151.311 E.01335
G1 X130.689 Y148.727 E.07168
G1 X130.689 Y149.407 E.01335
G1 X132.593 Y151.311 E.0528
G1 X131.912 Y151.311 E.01335
G1 X130.689 Y150.088 E.03392
G1 X130.689 Y150.769 E.01335
G1 X131.447 Y151.527 E.02102
; OBJECT_ID: 105
; WIPE_START
G1 X130.689 Y150.769 E-.4073
G1 X130.689 Y150.088 E-.25865
G1 X130.864 Y150.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S6000
G1 X123.452 Y148.442 Z.5 F42000
G1 X123.382 Y148.425 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X123.382 Y149.382 E.01866
G1 X106.618 Y149.382 E.32686
G1 X106.618 Y132.618 E.32686
G1 X123.382 Y132.618 E.32686
G1 X123.382 Y148.365 E.30703
M204 S6000
G1 X122.904 Y148.425 F42000
G1 F1500
M204 S500
G1 X122.904 Y148.904 E.00933
G1 X107.096 Y148.904 E.3082
G1 X107.096 Y133.096 E.3082
G1 X122.904 Y133.096 E.3082
G1 X122.904 Y148.365 E.2977
M204 S6000
G1 X122.425 Y148.425 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X107.575 Y148.425 E.28954
G1 X107.575 Y133.575 E.28954
G1 X122.425 Y133.575 E.28954
G1 X122.425 Y148.365 E.28837
; WIPE_START
G1 X120.425 Y148.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.951 Y149.922 Z.5 F42000
G1 X104.282 Y151.718 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X104.282 Y130.282 E.41795
G1 X125.717 Y130.282 E.41793
G1 X125.718 Y151.718 E.41795
G1 X104.342 Y151.718 E.41678
M204 S6000
G1 X103.891 Y152.157 F42000
G1 F1500
M204 S500
G1 X103.868 Y152.143 E.00052
G3 X103.804 Y151.976 I.137 J-.149 E.00361
G1 X103.804 Y130.024 E.42801
G3 X104.024 Y129.804 I.205 J-.015 E.00689
M73 P27 R21
G1 X104.489 Y129.804 E.00907
G1 X125.977 Y129.804 E.41897
G3 X126.196 Y129.988 I.017 J.201 E.00619
G1 X126.196 Y152.008 E.42934
G3 X125.976 Y152.196 I-.204 J-.015 E.00626
G1 X104.016 Y152.196 E.42817
G3 X103.947 Y152.188 I-.011 J-.202 E.00136
G1 X103.943 Y152.186 E.00008
M204 S6000
G1 X103.65 Y152.571 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X103.325 Y151.99 I.363 J-.584 E.01355
G1 X103.325 Y130.01 E.42857
G3 X104.01 Y129.325 I.684 J-.001 E.02097
G1 X104.489 Y129.325 E.00935
G1 X125.992 Y129.325 E.41925
G3 X126.674 Y129.973 I-.001 J.684 E.02024
G1 X126.675 Y151.993 E.42933
G3 X125.99 Y152.675 I-.684 J-.002 E.02091
G1 X104.006 Y152.675 E.42863
G3 X103.702 Y152.601 I.007 J-.688 E.00616
; WIPE_START
G1 X103.542 Y152.495 E-.0728
G1 X103.456 Y152.399 E-.04913
G1 X103.388 Y152.284 E-.05062
G1 X103.338 Y152.129 E-.06192
G1 X103.325 Y151.99 E-.05311
G1 X103.325 Y150.747 E-.47243
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.845 Y145.475 Z.5 F42000
G1 X124.553 Y130.473 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50276
G1 F2400
M204 S500
G1 X125.311 Y131.231 E.02102
G1 X125.311 Y131.912 E.01335
G1 X124.087 Y130.689 E.03392
G1 X123.407 Y130.689 E.01335
G1 X125.311 Y132.593 E.0528
G1 X125.311 Y133.273 E.01335
G1 X122.726 Y130.689 E.07168
G1 X122.045 Y130.689 E.01335
G1 X125.311 Y133.954 E.09056
G1 X125.311 Y134.635 E.01335
G1 X123.789 Y133.113 E.0422
G1 X123.789 Y133.794 E.01335
G1 X125.311 Y135.316 E.0422
G1 X125.311 Y135.996 E.01335
G1 X123.789 Y134.474 E.0422
G1 X123.789 Y135.155 E.01335
G1 X125.311 Y136.677 E.0422
G1 X125.311 Y137.358 E.01335
G1 X123.789 Y135.836 E.04221
G1 X123.789 Y136.516 E.01335
G1 X125.311 Y138.038 E.04221
G1 X125.311 Y138.719 E.01335
G1 X123.789 Y137.197 E.04221
G1 X123.789 Y137.878 E.01335
G1 X125.311 Y139.4 E.04221
G1 X125.311 Y140.08 E.01335
G1 X123.789 Y138.558 E.04221
G1 X123.789 Y139.239 E.01335
G1 X125.311 Y140.761 E.04221
G1 X125.311 Y141.442 E.01335
G1 X123.789 Y139.92 E.04221
G1 X123.789 Y140.6 E.01335
G1 X125.311 Y142.122 E.04221
G1 X125.311 Y142.803 E.01335
G1 X123.789 Y141.281 E.04221
G1 X123.789 Y141.962 E.01335
G1 X125.311 Y143.484 E.04221
G1 X125.311 Y144.164 E.01335
G1 X123.789 Y142.642 E.04221
G1 X123.789 Y143.323 E.01335
G1 X125.311 Y144.845 E.04221
G1 X125.311 Y145.526 E.01335
G1 X123.789 Y144.004 E.04221
G1 X123.789 Y144.684 E.01335
G1 X125.311 Y146.206 E.04221
G1 X125.311 Y146.887 E.01335
G1 X123.789 Y145.365 E.04221
G1 X123.789 Y146.046 E.01335
G1 X125.311 Y147.568 E.04222
G1 X125.311 Y148.249 E.01335
G1 X123.789 Y146.726 E.04222
G1 X123.789 Y147.407 E.01335
G1 X125.311 Y148.929 E.04222
G1 X125.311 Y149.61 E.01335
G1 X123.789 Y148.088 E.04222
G1 X123.789 Y148.768 E.01335
G1 X125.311 Y150.291 E.04222
M73 P28 R21
G1 X125.311 Y150.971 E.01335
G1 X123.789 Y149.449 E.04222
G1 X123.789 Y149.789 E.00667
G1 X123.448 Y149.789 E.00668
G1 X124.971 Y151.311 E.04222
G1 X124.29 Y151.311 E.01335
G1 X122.767 Y149.789 E.04222
G1 X122.087 Y149.789 E.01335
G1 X123.609 Y151.311 E.04222
G1 X122.929 Y151.311 E.01335
G1 X121.406 Y149.789 E.04222
G1 X120.725 Y149.789 E.01335
G1 X122.248 Y151.311 E.04222
G1 X121.567 Y151.311 E.01335
G1 X120.045 Y149.789 E.04222
G1 X119.364 Y149.789 E.01335
G1 X120.887 Y151.311 E.04222
G1 X120.206 Y151.311 E.01335
G1 X118.683 Y149.789 E.04222
G1 X118.003 Y149.789 E.01335
G1 X119.525 Y151.311 E.04222
G1 X118.845 Y151.311 E.01335
G1 X117.322 Y149.789 E.04222
G1 X116.642 Y149.789 E.01335
G1 X118.164 Y151.311 E.04222
G1 X117.483 Y151.311 E.01335
G1 X115.961 Y149.789 E.04222
G1 X115.28 Y149.789 E.01335
G1 X116.803 Y151.311 E.04222
G1 X116.122 Y151.311 E.01335
G1 X114.6 Y149.789 E.04222
G1 X113.919 Y149.789 E.01335
G1 X115.441 Y151.311 E.04222
G1 X114.761 Y151.311 E.01335
G1 X113.238 Y149.789 E.04222
G1 X112.558 Y149.789 E.01335
G1 X114.08 Y151.311 E.04222
G1 X113.399 Y151.311 E.01335
G1 X111.877 Y149.789 E.04222
G1 X111.196 Y149.789 E.01335
G1 X112.719 Y151.311 E.04222
G1 X112.038 Y151.311 E.01335
G1 X110.516 Y149.789 E.04222
G1 X109.835 Y149.789 E.01335
G1 X111.357 Y151.311 E.04222
G1 X110.677 Y151.311 E.01335
G1 X109.154 Y149.789 E.04222
G1 X108.474 Y149.789 E.01335
G1 X109.996 Y151.311 E.04222
G1 X109.315 Y151.311 E.01335
G1 X107.793 Y149.789 E.04222
G1 X107.112 Y149.789 E.01335
G1 X108.85 Y151.527 E.04819
; WIPE_START
G1 X107.436 Y150.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.805 Y143.855 Z.5 F42000
G1 X121.149 Y130.473 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X122.887 Y132.211 E.04819
G1 X122.206 Y132.211 E.01335
G1 X120.684 Y130.689 E.04222
G1 X120.003 Y130.689 E.01335
G1 X121.526 Y132.211 E.04222
G1 X120.845 Y132.211 E.01335
G1 X119.323 Y130.689 E.04222
G1 X118.642 Y130.689 E.01335
G1 X120.164 Y132.211 E.04222
G1 X119.484 Y132.211 E.01335
G1 X117.961 Y130.689 E.04222
G1 X117.281 Y130.689 E.01335
G1 X118.803 Y132.211 E.04222
G1 X118.122 Y132.211 E.01335
G1 X116.6 Y130.689 E.04222
G1 X115.919 Y130.689 E.01335
G1 X117.442 Y132.211 E.04222
G1 X116.761 Y132.211 E.01335
G1 X115.239 Y130.689 E.04222
G1 X114.558 Y130.689 E.01335
G1 X116.08 Y132.211 E.04222
G1 X115.4 Y132.211 E.01335
G1 X113.877 Y130.689 E.04222
G1 X113.197 Y130.689 E.01335
G1 X114.719 Y132.211 E.04222
G1 X114.038 Y132.211 E.01335
G1 X112.516 Y130.689 E.04222
G1 X111.835 Y130.689 E.01335
G1 X113.358 Y132.211 E.04222
G1 X112.677 Y132.211 E.01335
G1 X111.155 Y130.689 E.04222
G1 X110.474 Y130.689 E.01335
G1 X111.996 Y132.211 E.04222
G1 X111.316 Y132.211 E.01335
G1 X109.793 Y130.689 E.04222
G1 X109.113 Y130.689 E.01335
G1 X110.635 Y132.211 E.04222
G1 X109.954 Y132.211 E.01335
G1 X108.432 Y130.689 E.04222
G1 X107.751 Y130.689 E.01335
G1 X109.274 Y132.211 E.04222
G1 X108.593 Y132.211 E.01335
G1 X107.071 Y130.689 E.04222
G1 X106.39 Y130.689 E.01335
G1 X107.912 Y132.211 E.04222
G1 X107.232 Y132.211 E.01335
G1 X105.709 Y130.689 E.04222
G1 X105.029 Y130.689 E.01335
G1 X106.551 Y132.211 E.04222
G1 X106.211 Y132.211 E.00667
G1 X106.211 Y132.552 E.00668
G1 X104.689 Y131.03 E.04222
G1 X104.689 Y131.71 E.01335
G1 X106.211 Y133.233 E.04222
G1 X106.211 Y133.913 E.01335
G1 X104.689 Y132.391 E.04222
G1 X104.689 Y133.071 E.01335
G1 X106.211 Y134.594 E.04222
G1 X106.211 Y135.275 E.01335
G1 X104.689 Y133.752 E.04222
G1 X104.689 Y134.433 E.01335
G1 X106.211 Y135.955 E.04222
G1 X106.211 Y136.636 E.01335
G1 X104.689 Y135.113 E.04222
G1 X104.689 Y135.794 E.01335
G1 X106.211 Y137.317 E.04222
G1 X106.211 Y137.997 E.01335
G1 X104.689 Y136.475 E.04222
G1 X104.689 Y137.155 E.01335
G1 X106.211 Y138.678 E.04222
G1 X106.211 Y139.359 E.01335
G1 X104.689 Y137.836 E.04222
G1 X104.689 Y138.517 E.01335
G1 X106.211 Y140.039 E.04222
G1 X106.211 Y140.72 E.01335
G1 X104.689 Y139.197 E.04222
G1 X104.689 Y139.878 E.01335
G1 X106.211 Y141.4 E.04222
G1 X106.211 Y142.081 E.01335
G1 X104.689 Y140.559 E.04222
G1 X104.689 Y141.239 E.01335
G1 X106.211 Y142.762 E.04222
G1 X106.211 Y143.442 E.01335
G1 X104.689 Y141.92 E.04222
G1 X104.689 Y142.601 E.01335
G1 X106.211 Y144.123 E.04222
G1 X106.211 Y144.804 E.01335
G1 X104.689 Y143.281 E.04222
G1 X104.689 Y143.962 E.01335
G1 X106.211 Y145.484 E.04222
G1 X106.211 Y146.165 E.01335
G1 X104.689 Y144.643 E.04222
G1 X104.689 Y145.323 E.01335
G1 X106.211 Y146.846 E.04222
G1 X106.211 Y147.526 E.01335
G1 X104.689 Y146.004 E.04222
G1 X104.689 Y146.685 E.01335
G1 X106.211 Y148.207 E.04222
G1 X106.211 Y148.888 E.01335
G1 X104.689 Y147.365 E.04222
G1 X104.689 Y148.046 E.01335
G1 X107.954 Y151.311 E.09055
G1 X107.273 Y151.311 E.01335
G1 X104.689 Y148.727 E.07168
G1 X104.689 Y149.407 E.01335
G1 X106.593 Y151.311 E.0528
G1 X105.912 Y151.311 E.01335
G1 X104.689 Y150.088 E.03392
G1 X104.689 Y150.769 E.01335
G1 X105.447 Y151.527 E.02102
; OBJECT_ID: 116
; WIPE_START
G1 X104.689 Y150.769 E-.4073
G1 X104.689 Y150.088 E-.25865
G1 X104.864 Y150.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S6000
G1 X108.131 Y143.365 Z.5 F42000
G1 X124.05 Y109.75 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X124.049 Y110.736 E.01923
G2 X124.048 Y118.164 I954.002 J3.816 E.14482
G2 X124.05 Y124.05 I545.069 J2.705 E.11477
G2 X123.459 Y124.049 I-.309 J5.421 E.01153
G2 X114.276 Y124.048 I-4.728 J1954.202 E.17905
G2 X109.75 Y124.05 I-2.004 J548.011 E.08824
G2 X109.752 Y115.187 I-983.585 J-4.674 E.17281
G1 X109.752 Y110.441 E.09254
G2 X109.752 Y109.75 I-7.307 J-.342 E.01349
G1 X110.148 Y109.75 E.00773
G1 X111.471 Y109.752 E.02579
G3 X121.357 Y109.755 I4.588 J1423.144 E.19276
G3 X123.99 Y109.75 I1.579 J134.68 E.05134
M204 S6000
G1 X124.205 Y109.28 F42000
G1 F1500
M204 S500
G3 X124.529 Y109.709 I-.073 J.393 E.0115
G1 X124.527 Y110.755 E.0204
G3 X124.523 Y118.74 I-745.621 J3.627 E.15569
G3 X124.52 Y124.205 I-921.385 J2.154 E.10654
G3 X124.086 Y124.529 I-.399 J-.081 E.01156
G1 X123.679 Y124.527 E.00793
G2 X123.435 Y124.527 I-.122 J1.306 E.00477
G2 X114.278 Y124.527 I-4.748 J1937.035 E.17854
G3 X109.595 Y124.52 I-1.842 J-334.743 E.0913
G3 X109.271 Y124.086 I.081 J-.398 E.01155
G2 X109.273 Y115.211 I-987.559 J-4.699 E.17305
G1 X109.274 Y110.419 E.09344
G3 X109.28 Y109.598 I20.408 J-.245 E.016
G3 X109.715 Y109.271 I.399 J.078 E.01163
G1 X110.149 Y109.272 E.00845
G1 X111.489 Y109.274 E.02613
G2 X118.377 Y109.274 I3.404 J-1718.087 E.1343
G3 X124.145 Y109.28 I1.22 J1444.632 E.11244
M204 S6000
G1 X124.248 Y108.806 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X124.357 Y108.825 E.00216
G3 X125.008 Y109.7 I-.234 J.853 E.02289
G1 X125.006 Y110.774 E.02095
G3 X125.002 Y118.734 I-744.51 J3.622 E.15519
G3 X125.003 Y124.198 I-1790.81 J3.138 E.10653
G3 X124.098 Y125.008 I-.875 J-.067 E.02614
G1 X123.641 Y125.006 E.00892
G2 X116.184 Y125.005 I-3.893 J1825.412 E.1454
G1 X116.154 Y125.002 E.00059
G3 X109.602 Y125.003 I-3.402 J-1685.484 E.12774
G3 X108.793 Y124.098 I.067 J-.875 E.02614
G2 X108.795 Y115.235 I-987.937 J-4.701 E.17282
G1 X108.795 Y110.396 E.09435
G3 X108.809 Y109.513 I13.893 J-.225 E.01723
G3 X109.702 Y108.792 I.874 J.17 E.02431
G1 X110.15 Y108.793 E.00872
G1 X111.507 Y108.795 E.02647
G2 X118.382 Y108.795 I3.388 J-1777.049 E.13403
M73 P29 R21
G2 X124.189 Y108.797 I3.527 J-1705.725 E.11322
; WIPE_START
G1 X124.357 Y108.825 E-.06491
G1 X124.517 Y108.883 E-.06446
G1 X124.653 Y108.965 E-.06038
G1 X124.782 Y109.082 E-.06606
G1 X124.883 Y109.219 E-.06482
G1 X124.945 Y109.346 E-.05373
G1 X124.993 Y109.522 E-.06939
G1 X125.008 Y109.7 E-.06763
G1 X125.006 Y110.354 E-.24862
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.857 Y110.914 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50316
G1 F2400
M204 S500
G1 X123.1 Y110.157 E.02101
G1 X122.419 Y110.157 E.01337
G1 X123.641 Y111.379 E.03392
G1 X123.64 Y112.059 E.01335
G1 X121.738 Y110.157 E.0528
G1 X121.056 Y110.157 E.01337
G1 X123.639 Y112.739 E.07167
G1 X123.638 Y113.419 E.01335
G1 X120.375 Y110.157 E.09055
G1 X119.694 Y110.157 E.01337
G1 X123.636 Y114.099 E.10943
G1 X123.635 Y114.779 E.01335
G1 X119.013 Y110.157 E.1283
G1 X118.331 Y110.157 E.01337
G1 X123.634 Y115.459 E.14718
G1 X123.633 Y116.14 E.01335
G1 X117.65 Y110.157 E.16605
G1 X116.969 Y110.157 E.01337
G1 X123.632 Y116.82 E.18493
G1 X123.631 Y117.5 E.01335
G1 X116.288 Y110.157 E.20381
G1 X115.607 Y110.157 E.01337
G1 X123.631 Y118.181 E.22272
G1 X123.632 Y118.864 E.0134
G1 X114.925 Y110.157 E.24167
G1 X114.244 Y110.157 E.01337
G1 X123.634 Y119.547 E.26062
G1 X123.635 Y120.229 E.0134
G1 X113.563 Y110.157 E.27956
G1 X112.882 Y110.157 E.01337
G1 X123.637 Y120.912 E.29851
G1 X123.638 Y121.595 E.0134
G1 X112.201 Y110.157 E.31746
G1 X111.519 Y110.157 E.01337
G1 X123.64 Y122.277 E.33641
G1 X123.641 Y122.96 E.0134
G1 X110.838 Y110.157 E.35536
G1 X110.169 Y110.157 E.01314
G1 X123.628 Y123.628 E.37373
G3 X122.961 Y123.642 I-.473 J-6.439 E.01309
G1 X110.159 Y110.84 E.35533
G1 X110.159 Y111.521 E.01337
G1 X122.28 Y123.642 E.33643
G1 X121.599 Y123.642 E.01337
G1 X110.159 Y112.202 E.31753
G1 X110.158 Y112.883 E.01337
G1 X120.917 Y123.642 E.29862
G1 X120.236 Y123.643 E.01337
G1 X110.158 Y113.565 E.27972
G1 X110.158 Y114.246 E.01337
G1 X119.555 Y123.643 E.26082
G1 X118.874 Y123.643 E.01337
G1 X110.158 Y114.927 E.24191
G1 X110.158 Y115.608 E.01337
G1 X118.193 Y123.643 E.22301
G1 X117.512 Y123.643 E.01337
G1 X110.158 Y116.289 E.20411
G1 X110.158 Y116.97 E.01337
G1 X116.831 Y123.643 E.18521
G1 X116.149 Y123.643 E.01337
G1 X110.158 Y117.651 E.1663
G1 X110.158 Y118.332 E.01337
G1 X115.468 Y123.643 E.1474
G1 X114.787 Y123.643 E.01337
G1 X110.157 Y119.013 E.1285
G1 X110.157 Y119.695 E.01337
G1 X114.106 Y123.643 E.1096
G1 X113.425 Y123.643 E.01337
G1 X110.157 Y120.376 E.09069
G1 X110.157 Y121.057 E.01337
G1 X112.744 Y123.643 E.07179
G1 X112.062 Y123.643 E.01337
G1 X110.157 Y121.738 E.05289
G1 X110.157 Y122.419 E.01337
G1 X111.381 Y123.643 E.03398
G1 X110.7 Y123.643 E.01337
G1 X109.941 Y122.885 E.02106
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F2400
G1 X110.7 Y123.643 E-.40772
G1 X111.381 Y123.643 E-.25884
G1 X111.207 Y123.47 E-.09344
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 2/83
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S186.15
; open powerlost recovery
M1003 S1
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
M73 P29 R20
G3 Z.5 I.039 J1.216 P1  F42000
G1 X149.102 Y122.26 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z.6 F42000
G1 X130.052 Y125.948 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.38231
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.769 Y126.292 F42000
G1 F6000
M204 S6000
G1 X129.751 Y126.279 E.00039
G3 X129.624 Y125.981 I.256 J-.285 E.00583
G1 X129.629 Y103.941 E.38483
G3 X130.012 Y103.624 I.382 J.071 E.00944
G1 X151.985 Y103.624 E.38366
M73 P30 R20
G3 X152.376 Y103.985 I.005 J.386 E.01025
G1 X152.376 Y125.988 E.38417
G3 X151.982 Y126.377 I-.38 J.009 E.01084
G1 X130.018 Y126.377 E.38348
G3 X129.876 Y126.354 I-.012 J-.383 E.00253
G1 X129.821 Y126.322 E.00111
M204 S250
G1 X129.555 Y126.649 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y126.579 E.00182
G3 X129.21 Y125.994 I.542 J-.588 E.01068
G1 X129.21 Y104.004 E.35707
G3 X130.004 Y103.21 I.8 J.006 E.02022
G1 X151.998 Y103.21 E.35713
G3 X152.789 Y103.969 I-.013 J.805 E.01959
G1 X152.79 Y125.996 E.35767
G3 X151.994 Y126.79 I-.796 J-.002 E.02028
G1 X130.006 Y126.79 E.35703
G3 X129.606 Y126.681 I.004 J-.8 E.00681
; WIPE_START
M204 S6000
G1 X129.468 Y126.579 E-.06531
G1 X129.344 Y126.44 E-.07066
G1 X129.27 Y126.302 E-.05938
G1 X129.225 Y126.154 E-.05889
G1 X129.21 Y125.994 E-.06111
G1 X129.21 Y124.824 E-.44465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 2 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer2 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32138
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.864 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32917
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.31491
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.4619
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00398
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432733
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27871
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27871
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27871
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27871
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431926
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.556 J-1.206 E.02376
G2 X149.316 Y105.269 I-.21 J109.178 E.02375
G1 X132.684 Y105.269 E.27816
G2 X131.263 Y105.263 I-1.211 J108.615 E.02377
G2 X131.269 Y106.684 I108.786 J.21 E.02377
G1 X131.269 Y123.316 E.27816
G2 X131.263 Y124.737 I108.946 J1.211 E.02377
G2 X132.684 Y124.731 I.21 J-108.953 E.02377
G1 X149.316 Y124.731 E.27816
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27716
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z.6 F42000
G1 X149.052 Y148.21 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z.6 F42000
G1 X130.052 Y151.948 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.38231
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.769 Y152.292 F42000
G1 F6000
M204 S6000
G1 X129.751 Y152.279 E.00039
G3 X129.624 Y151.981 I.256 J-.285 E.00583
G1 X129.629 Y129.941 E.38483
G3 X130.012 Y129.624 I.382 J.071 E.00944
G1 X151.985 Y129.624 E.38366
G3 X152.376 Y129.985 I.005 J.386 E.01025
G1 X152.376 Y151.988 E.38417
G3 X151.982 Y152.376 I-.38 J.009 E.01084
G1 X130.018 Y152.376 E.38348
G3 X129.876 Y152.354 I-.012 J-.383 E.00253
G1 X129.821 Y152.322 E.00111
M204 S250
G1 X129.555 Y152.649 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y152.579 E.00182
G3 X129.21 Y151.994 I.542 J-.588 E.01068
G1 X129.21 Y130.004 E.35707
G3 X130.004 Y129.21 I.8 J.006 E.02022
G1 X151.998 Y129.21 E.35713
G3 X152.789 Y129.969 I-.013 J.805 E.01959
G1 X152.79 Y151.996 E.35767
G3 X151.994 Y152.79 I-.796 J-.002 E.02028
G1 X130.006 Y152.79 E.35703
G3 X129.606 Y152.681 I.004 J-.8 E.00681
; WIPE_START
M204 S6000
G1 X129.468 Y152.579 E-.06531
G1 X129.344 Y152.44 E-.07066
G1 X129.27 Y152.302 E-.05938
G1 X129.225 Y152.154 E-.05889
G1 X129.21 Y151.994 E-.06111
G1 X129.21 Y150.824 E-.44465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.008 Y145.86 Z.6 F42000
G1 X151.534 Y131.711 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.771 E.3209
M204 S10000
G1 X151.135 Y131.711 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.864 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32917
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.771 E.31443
M204 S10000
G1 X150.319 Y131.657 F42000
; LINE_WIDTH: 0.5205
G1 F14427.701
M204 S6000
G2 X150.32 Y131.763 I-.026 J.053 E.00489
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456792
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29324
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29324
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29324
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29324
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.0126
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454521
G1 F15000
M204 S6000
M73 P31 R20
G2 X150.737 Y131.263 I-39.797 J-1.245 E.02596
G2 X149.266 Y131.282 I-.224 J39.514 E.02595
G1 X132.734 Y131.282 E.29171
G2 X131.263 Y131.263 I-1.247 J39.451 E.02596
G2 X131.282 Y132.734 I39.49 J.225 E.02596
G1 X131.282 Y149.266 E.29171
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29171
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29065
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z.6 F42000
G1 X123.152 Y148.31 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z.6 F42000
G1 X104.052 Y151.948 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.38231
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.769 Y152.292 F42000
G1 F6000
M204 S6000
G1 X103.751 Y152.279 E.00039
G3 X103.624 Y151.981 I.256 J-.285 E.00583
G1 X103.629 Y129.941 E.38483
G3 X104.012 Y129.624 I.382 J.071 E.00944
G1 X125.985 Y129.624 E.38366
G3 X126.376 Y129.985 I.005 J.386 E.01025
G1 X126.377 Y151.988 E.38417
G3 X125.982 Y152.376 I-.38 J.009 E.01084
G1 X104.018 Y152.376 E.38348
G3 X103.876 Y152.354 I-.012 J-.383 E.00253
G1 X103.821 Y152.322 E.00111
M204 S250
G1 X103.555 Y152.649 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.468 Y152.579 E.00182
G3 X103.21 Y151.994 I.542 J-.588 E.01068
G1 X103.21 Y130.004 E.35707
G3 X104.004 Y129.21 I.8 J.006 E.02022
G1 X125.998 Y129.21 E.35713
G3 X126.789 Y129.969 I-.013 J.805 E.01959
G1 X126.79 Y151.996 E.35767
G3 X125.994 Y152.79 I-.796 J-.002 E.02028
G1 X104.006 Y152.79 E.35703
G3 X103.606 Y152.681 I.004 J-.8 E.00681
; WIPE_START
M204 S6000
G1 X103.468 Y152.579 E-.06531
G1 X103.344 Y152.44 E-.07066
G1 X103.27 Y152.302 E-.05938
G1 X103.225 Y152.154 E-.05889
G1 X103.21 Y151.994 E-.06111
G1 X103.21 Y150.824 E-.44465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109 Y145.851 Z.6 F42000
G1 X125.534 Y131.653 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.864 E.01281
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32917
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40332
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00129
G1 X124.36 Y131.688 E.0011
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408654
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26397
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26397
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26397
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26397
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409049
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.849 J-1.181 E.02165
G1 X106.634 Y131.257 E.28588
G3 X105.263 Y131.263 I-1.176 J-112.973 E.02165
G1 X105.257 Y149.366 E.28589
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28589
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26329
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.557 Y125.743 Z.6 F42000
G1 X124.151 Y109.393 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.408 Y109.694 I-.021 J.278 E.00767
G1 X124.407 Y117.133 E.12989
G2 X124.407 Y124.146 I1075.811 J3.559 E.12245
G3 X124.102 Y124.408 I-.277 J-.014 E.00786
G1 X117.834 Y124.407 E.10943
G2 X109.654 Y124.407 I-4.068 J784.205 E.14283
G3 X109.392 Y124.102 I.014 J-.277 E.00786
G1 X109.394 Y109.647 E.25238
G3 X109.698 Y109.392 I.275 J.018 E.00775
G1 X116.862 Y109.393 E.12508
G2 X117.081 Y109.393 I.11 J-1.436 E.00383
G1 X121.022 Y109.393 E.06881
G2 X124.091 Y109.392 I1.387 J-422.385 E.05359
M204 S10000
G1 X124.184 Y108.966 F42000
G1 F6000
M204 S6000
G3 X124.837 Y109.686 I-.058 J.708 E.01869
G1 X124.836 Y117.134 E.13004
G3 X124.825 Y124.256 I-1967.174 J.528 E.12435
G3 X124.111 Y124.837 I-.701 J-.133 E.01746
G1 X117.833 Y124.835 E.10961
G2 X109.619 Y124.835 I-4.195 J965.553 E.14343
G3 X108.963 Y124.111 I.049 J-.703 E.01883
G1 X108.964 Y109.674 E.25207
G3 X109.689 Y108.963 I.71 J-.001 E.01975
G1 X116.871 Y108.964 E.12541
G2 X117.074 Y108.964 I.102 J-1.326 E.00354
G1 X121.031 Y108.964 E.06909
G2 X124.1 Y108.963 I1.384 J-423.593 E.05359
G1 X124.124 Y108.964 E.00043
M204 S250
G1 X124.296 Y108.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3060
M204 S5000
G1 X124.383 Y108.58 E.00143
G3 X125.25 Y109.679 I-.261 J1.098 E.02453
G1 X125.249 Y116.535 E.11133
G3 X125.249 Y117.34 I-223.898 J.266 E.01308
G1 F3120
G1 X125.244 Y117.46 E.00195
G1 F3060
G1 X125.249 Y117.593 E.00216
G1 F3000
G1 X125.249 Y118.193 E.00974
G1 F3060
G1 X125.247 Y120.47 E.03697
G1 F3120
G1 X125.248 Y121.07 E.00974
G1 F3060
G1 X125.25 Y123.521 E.03981
G3 X125.232 Y124.33 I-4.613 J.304 E.01315
G3 X124.12 Y125.25 I-1.113 J-.213 E.02541
G1 X118.432 Y125.249 E.09236
G3 X117.355 Y125.248 I-.202 J-365.961 E.01749
G1 F3120
G2 X117.193 Y125.249 I-.077 J.538 E.00264
G1 F3060
G3 X116.315 Y125.25 I-.63 J-390.054 E.01426
G1 X110.279 Y125.25 E.09802
G3 X109.47 Y125.232 I-.314 J-4.081 E.01316
G3 X108.55 Y124.12 I.213 J-1.113 E.02541
G1 X108.553 Y118.38 E.09321
G1 F3120
G1 X108.553 Y117.78 E.00974
G1 F3060
G1 X108.551 Y110.267 E.122
G3 X108.568 Y109.466 I4.498 J-.301 E.01302
G3 X109.68 Y108.55 I1.11 J.214 E.02536
G1 X116.88 Y108.551 E.11692
G1 F3120
G2 X117.067 Y108.551 I.094 J-1.219 E.00303
G1 F3060
G1 X120.439 Y108.551 E.05476
G2 X121.384 Y108.551 I.479 J-57.633 E.01534
G1 F3120
G1 X122.121 Y108.554 E.01197
G1 F3060
G3 X124.216 Y108.553 I1.123 J166.237 E.03403
G1 X124.236 Y108.556 E.00033
; WIPE_START
M204 S6000
G1 X124.383 Y108.58 E-.05632
G1 X124.624 Y108.663 E-.09715
G1 X124.791 Y108.763 E-.0738
G1 X124.967 Y108.922 E-.09008
G1 X125.075 Y109.064 E-.06778
G1 X125.174 Y109.261 E-.08398
G1 X125.235 Y109.485 E-.08808
G1 X125.25 Y109.679 E-.07402
G1 X125.25 Y110.018 E-.1288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.622 Y109.784 Z.6 F42000
G1 X110.461 Y109.564 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42779
G1 F15000
M204 S6000
G1 X109.744 Y110.281 E.01678
G1 X109.744 Y110.855 E.00951
G1 X110.856 Y109.743 E.02604
G1 X111.431 Y109.743 E.00951
G1 X109.744 Y111.43 E.03949
G1 X109.744 Y112.005 E.00951
G1 X112.005 Y109.743 E.05294
G1 X112.58 Y109.743 E.00951
G1 X109.744 Y112.579 E.0664
G1 X109.744 Y113.154 E.00951
G1 X113.154 Y109.744 E.07985
G1 X113.729 Y109.744 E.00951
G1 X109.744 Y113.729 E.0933
G1 X109.744 Y114.303 E.00951
G1 X114.304 Y109.744 E.10676
G1 X114.878 Y109.744 E.00951
G1 X109.744 Y114.878 E.12021
G1 X109.744 Y115.453 E.00951
G1 X115.453 Y109.744 E.13366
G1 X116.027 Y109.744 E.00951
G1 X109.744 Y116.028 E.14712
G1 X109.744 Y116.602 E.00951
G1 X116.602 Y109.744 E.16057
G1 X117.176 Y109.744 E.00951
G1 X109.744 Y117.177 E.17402
G1 X109.744 Y117.752 E.00951
G1 X117.751 Y109.744 E.18748
G1 X118.326 Y109.744 E.00951
G1 X109.744 Y118.326 E.20093
G1 X109.743 Y118.901 E.00951
G1 X118.9 Y109.744 E.21438
G1 X119.475 Y109.744 E.00951
G1 X109.743 Y119.476 E.22784
G1 X109.743 Y120.05 E.00951
G1 X120.049 Y109.744 E.24129
G1 X120.624 Y109.744 E.00951
G1 X109.743 Y120.625 E.25474
G1 X109.743 Y121.2 E.00951
G1 X121.198 Y109.745 E.2682
G1 X121.773 Y109.745 E.00951
G1 X109.743 Y121.774 E.28165
G1 X109.743 Y122.349 E.00951
G1 X122.347 Y109.745 E.2951
G1 X122.922 Y109.745 E.00951
G1 X109.743 Y122.924 E.30855
G1 X109.743 Y123.498 E.00951
G1 X123.497 Y109.745 E.32201
G1 X124.057 Y109.745 E.00928
G1 X124.057 Y109.759 E.00024
G1 X109.759 Y124.057 E.33475
G1 X110.334 Y124.057 E.00951
G1 X124.057 Y110.334 E.3213
G1 X124.057 Y110.908 E.00951
G1 X110.908 Y124.057 E.30784
G1 X111.483 Y124.057 E.00951
G1 X124.057 Y111.483 E.29439
G1 X124.057 Y112.058 E.00951
G1 X112.058 Y124.057 E.28094
G1 X112.632 Y124.057 E.00951
G1 X124.057 Y112.632 E.26748
G1 X124.057 Y113.207 E.00951
G1 X113.207 Y124.057 E.25403
G1 X113.782 Y124.057 E.00951
G1 X124.057 Y113.782 E.24057
G1 X124.057 Y114.356 E.00951
G1 X114.356 Y124.057 E.22712
G1 X114.931 Y124.057 E.00951
G1 X124.057 Y114.931 E.21367
M73 P32 R20
G1 X124.057 Y115.506 E.00951
G1 X115.506 Y124.057 E.20021
G1 X116.08 Y124.057 E.00951
G1 X124.057 Y116.08 E.18676
G1 X124.057 Y116.655 E.00951
G1 X116.655 Y124.057 E.1733
G1 X117.229 Y124.057 E.00951
G1 X124.057 Y117.229 E.15985
G1 X124.057 Y117.804 E.00951
G1 X117.804 Y124.057 E.1464
G1 X118.379 Y124.057 E.00951
G1 X124.057 Y118.379 E.13294
G1 X124.057 Y118.953 E.00951
G1 X118.953 Y124.057 E.11949
G1 X119.528 Y124.057 E.00951
G1 X124.057 Y119.528 E.10603
G1 X124.057 Y120.103 E.00951
G1 X120.103 Y124.057 E.09258
G1 X120.677 Y124.057 E.00951
G1 X124.057 Y120.677 E.07913
G1 X124.057 Y121.252 E.00951
G1 X121.252 Y124.057 E.06567
G1 X121.827 Y124.057 E.00951
G1 X124.057 Y121.827 E.05222
G1 X124.057 Y122.401 E.00951
G1 X122.401 Y124.057 E.03876
G1 X122.976 Y124.057 E.00951
G1 X124.057 Y122.976 E.02531
G1 X124.057 Y123.551 E.00951
G1 X123.371 Y124.236 E.01606
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.057 Y123.551 E-.36853
G1 X124.057 Y122.976 E-.21836
G1 X123.735 Y123.298 E-.1731
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 3/83
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.05 J1.216 P1  F42000
G1 X149.102 Y122.26 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z.7 F42000
G1 X130.052 Y125.948 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.38231
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.753 Y126.282 F42000
G1 F6000
M204 S6000
G1 X129.751 Y126.279 E.00008
G3 X129.624 Y125.981 I.256 J-.286 E.00582
G1 X129.624 Y104.019 E.38348
G3 X130.018 Y103.624 I.381 J-.014 E.01093
G1 X151.987 Y103.624 E.38359
G3 X152.376 Y103.985 I.009 J.38 E.01026
G1 X152.376 Y125.982 E.38406
G3 X151.982 Y126.377 I-.387 J.008 E.0109
G1 X130.018 Y126.377 E.38348
G3 X129.878 Y126.354 I-.011 J-.383 E.00249
G1 X129.805 Y126.312 E.00147
M204 S250
G1 X129.54 Y126.64 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y126.578 E.00155
G3 X129.21 Y125.994 I.542 J-.588 E.01067
G1 X129.21 Y104.006 E.35703
G3 X130.006 Y103.21 I.796 J0 E.02031
G1 X152 Y103.21 E.35714
G3 X152.789 Y103.969 I-.007 J.797 E.0196
G1 X152.79 Y125.994 E.35764
G3 X151.994 Y126.79 I-.805 J-.008 E.02025
G1 X130.006 Y126.79 E.35703
G3 X129.591 Y126.672 I.004 J-.8 E.00709
; WIPE_START
M204 S6000
G1 X129.468 Y126.578 E-.05879
G1 X129.362 Y126.466 E-.05861
G1 X129.281 Y126.327 E-.06108
G1 X129.225 Y126.152 E-.06991
G1 X129.21 Y125.994 E-.06041
G1 X129.21 Y124.806 E-.45119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 3 start: 83,94,105,116
M624 DwAAAAAAAAA=
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
; object ids of this layer3 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32138
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.864 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32917
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.31491
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46188
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00398
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.43273
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27871
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27871
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27871
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27871
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431923
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.549 J-1.206 E.02376
G2 X149.316 Y105.269 I-.21 J109.347 E.02375
G1 X132.684 Y105.269 E.27816
G2 X131.263 Y105.263 I-1.211 J108.615 E.02377
G2 X131.269 Y106.684 I108.786 J.21 E.02377
G1 X131.269 Y123.316 E.27816
G2 X131.263 Y124.737 I108.946 J1.211 E.02377
G2 X132.684 Y124.731 I.21 J-108.953 E.02377
G1 X149.316 Y124.731 E.27816
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27716
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z.7 F42000
G1 X149.052 Y148.21 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z.7 F42000
G1 X130.052 Y151.948 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.38231
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.753 Y152.282 F42000
G1 F6000
M204 S6000
G1 X129.751 Y152.279 E.00008
G3 X129.624 Y151.981 I.256 J-.286 E.00582
G1 X129.624 Y130.018 E.38348
G3 X130.018 Y129.624 I.381 J-.014 E.01093
G1 X151.987 Y129.624 E.38359
G3 X152.376 Y129.985 I.009 J.38 E.01026
G1 X152.376 Y151.981 E.38406
G3 X151.982 Y152.376 I-.387 J.008 E.0109
G1 X130.018 Y152.376 E.38348
G3 X129.878 Y152.354 I-.011 J-.383 E.00249
G1 X129.805 Y152.312 E.00147
M204 S250
G1 X129.54 Y152.64 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P33 R20
G1 X129.468 Y152.578 E.00155
G3 X129.21 Y151.994 I.542 J-.588 E.01067
G1 X129.21 Y130.006 E.35703
G3 X130.006 Y129.21 I.796 J0 E.02031
G1 X152 Y129.21 E.35714
G3 X152.789 Y129.969 I-.007 J.797 E.0196
G1 X152.79 Y151.994 E.35764
G3 X151.994 Y152.79 I-.805 J-.008 E.02025
G1 X130.006 Y152.79 E.35703
G3 X129.591 Y152.672 I.004 J-.8 E.00709
; WIPE_START
M204 S6000
G1 X129.468 Y152.578 E-.05879
G1 X129.362 Y152.466 E-.05861
G1 X129.281 Y152.327 E-.06108
G1 X129.225 Y152.152 E-.06991
G1 X129.21 Y151.994 E-.06041
G1 X129.21 Y150.806 E-.45119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.01 Y145.845 Z.7 F42000
G1 X151.534 Y131.711 Z.7
G1 Z.3
M73 P33 R19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.771 E.3209
M204 S10000
G1 X151.135 Y131.711 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.864 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32917
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.771 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52046
G1 F14428.857
M204 S6000
G2 X150.32 Y131.763 I-.026 J.053 E.00489
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456788
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29324
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29324
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29324
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29324
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.0126
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454517
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.794 J-1.245 E.02596
G2 X149.266 Y131.282 I-.225 J39.467 E.02595
G1 X132.734 Y131.282 E.29171
G2 X131.263 Y131.263 I-1.247 J39.519 E.02596
G2 X131.282 Y132.734 I39.49 J.225 E.02596
G1 X131.282 Y149.266 E.29171
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29171
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29065
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z.7 F42000
G1 X123.152 Y148.31 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z.7 F42000
G1 X104.052 Y151.948 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.38231
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.753 Y152.282 F42000
G1 F6000
M204 S6000
G1 X103.751 Y152.279 E.00008
G3 X103.624 Y151.981 I.256 J-.286 E.00582
G1 X103.624 Y130.018 E.38348
G3 X104.018 Y129.624 I.381 J-.014 E.01093
G1 X125.987 Y129.624 E.38359
G3 X126.376 Y129.985 I.009 J.38 E.01026
G1 X126.377 Y151.981 E.38406
G3 X125.982 Y152.376 I-.387 J.008 E.0109
G1 X104.018 Y152.376 E.38348
G3 X103.878 Y152.354 I-.011 J-.383 E.00249
G1 X103.805 Y152.312 E.00147
M204 S250
G1 X103.54 Y152.64 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.468 Y152.578 E.00155
G3 X103.21 Y151.994 I.542 J-.588 E.01067
G1 X103.21 Y130.006 E.35703
G3 X104.006 Y129.21 I.796 J0 E.02031
G1 X126 Y129.21 E.35714
G3 X126.789 Y129.969 I-.007 J.797 E.0196
G1 X126.79 Y151.994 E.35764
G3 X125.994 Y152.79 I-.805 J-.008 E.02025
G1 X104.006 Y152.79 E.35703
G3 X103.591 Y152.672 I.004 J-.8 E.00709
; WIPE_START
M204 S6000
G1 X103.468 Y152.578 E-.05879
G1 X103.362 Y152.466 E-.05861
G1 X103.281 Y152.327 E-.06108
G1 X103.225 Y152.152 E-.06991
G1 X103.21 Y151.994 E-.06041
G1 X103.21 Y150.806 E-.45119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.003 Y145.836 Z.7 F42000
G1 X125.534 Y131.653 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.864 E.01281
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32917
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.4033
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00129
G1 X124.36 Y131.688 E.0011
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.40865
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26397
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26397
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26397
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26397
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409046
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.84 J-1.181 E.02165
G1 X106.634 Y131.257 E.28588
G3 X105.263 Y131.263 I-1.173 J-112.5 E.02165
G1 X105.257 Y149.366 E.28589
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28589
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26329
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40382
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.558 Y125.744 Z.7 F42000
G1 X124.209 Y109.333 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.475 Y109.667 I-.075 J.333 E.00804
G1 X124.476 Y124.107 E.25212
G3 X124.132 Y124.475 I-.344 J.024 E.00985
G1 X109.694 Y124.476 E.25211
G3 X109.325 Y124.132 I-.024 J-.344 E.00986
G1 X109.325 Y109.681 E.25233
G3 X109.695 Y109.325 I.343 J-.015 E.01013
G1 X110.714 Y109.325 E.01779
G2 X116.81 Y109.325 I3.068 J-593.919 E.10644
G2 X117.537 Y109.325 I.363 J-18.26 E.01269
G1 X124.149 Y109.333 E.11545
M204 S10000
G1 X124.264 Y108.91 F42000
G1 F6000
M204 S6000
G1 X124.304 Y108.917 E.00071
G3 X124.903 Y109.654 I-.175 J.754 E.01785
G1 X124.904 Y124.118 E.25255
G3 X124.146 Y124.903 I-.776 J.01 E.02114
M73 P34 R19
G1 X109.682 Y124.904 E.25254
G3 X108.897 Y124.146 I-.01 J-.776 E.02115
G1 X108.896 Y109.673 E.2527
G3 X109.684 Y108.896 I.769 J-.008 E.02154
G1 X110.725 Y108.896 E.01818
G2 X116.823 Y108.897 I3.069 J-592.952 E.10648
G2 X117.536 Y108.897 I.356 J-18.124 E.01245
G1 X124.154 Y108.897 E.11554
G1 X124.204 Y108.903 E.00089
M204 S250
G1 X124.303 Y108.495 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.294 Y109.429 I-.17 J1.172 E.02356
G3 X125.317 Y109.641 I-1.186 J.237 E.00347
G1 X125.315 Y110.496 E.01388
G2 X125.315 Y111.696 I299.999 J.825 E.01949
G1 X125.317 Y123.529 E.19214
G1 X125.318 Y124.129 E.00974
G3 X125.29 Y124.39 I-1.245 J-.001 E.00428
G1 X125.256 Y124.512 E.00204
G1 X125.213 Y124.622 E.00193
G3 X124.159 Y125.317 I-1.091 J-.509 E.02158
G1 X123.559 Y125.317 E.00974
G1 X109.671 Y125.318 E.22551
G3 X109.41 Y125.29 I.001 J-1.245 E.00428
G1 X109.288 Y125.256 E.00204
G1 X109.178 Y125.213 E.00193
G3 X108.483 Y124.159 I.509 J-1.091 E.02159
G1 X108.483 Y123.559 E.00974
G1 X108.483 Y110.265 E.21586
G3 X108.499 Y109.469 I4.302 J-.311 E.01295
G3 X109.54 Y108.489 I1.179 J.21 E.02488
G1 X109.673 Y108.483 E.00215
G1 X110.736 Y108.483 E.01726
G2 X111.511 Y108.483 I.388 J-6.782 E.01259
G1 X116.836 Y108.483 E.08647
G2 X117.121 Y108.483 I.144 J-1.712 E.00464
G3 X118.136 Y108.483 I.672 J642.764 E.01648
G1 X123.572 Y108.483 E.08826
G3 X124.244 Y108.489 I.3 J4.268 E.01092
; WIPE_START
M204 S6000
G1 X124.631 Y108.591 E-.15226
G1 X124.92 Y108.78 E-.13122
G1 X125.134 Y109.031 E-.12539
G1 X125.231 Y109.221 E-.08097
G1 X125.294 Y109.429 E-.08272
G1 X125.317 Y109.641 E-.08099
G1 X125.316 Y109.921 E-.10646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.303 Y110.421 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42211
G1 F15000
M204 S6000
G1 X123.559 Y109.677 E.01717
G1 X122.992 Y109.677 E.00925
G1 X124.123 Y110.808 E.02611
G1 X124.123 Y111.375 E.00925
G1 X122.426 Y109.677 E.03919
G1 X121.859 Y109.677 E.00925
G1 X124.123 Y111.941 E.05227
G1 X124.123 Y112.508 E.00925
G1 X121.293 Y109.677 E.06535
G1 X120.726 Y109.677 E.00925
G1 X124.123 Y113.074 E.07843
G1 X124.124 Y113.641 E.00925
G1 X120.159 Y109.677 E.09152
G1 X119.593 Y109.677 E.00925
G1 X124.124 Y114.208 E.1046
G1 X124.124 Y114.774 E.00925
G1 X119.026 Y109.677 E.11768
G1 X118.459 Y109.677 E.00925
G1 X124.124 Y115.341 E.13076
G1 X124.124 Y115.908 E.00925
G1 X117.893 Y109.677 E.14384
G1 X117.326 Y109.677 E.00925
G1 X124.124 Y116.474 E.15692
G1 X124.124 Y117.041 E.00925
G1 X116.759 Y109.677 E.17001
G1 X116.193 Y109.677 E.00925
G1 X124.124 Y117.607 E.18309
G1 X124.124 Y118.174 E.00925
G1 X115.626 Y109.677 E.19617
G1 X115.06 Y109.677 E.00925
G1 X124.124 Y118.741 E.20925
G1 X124.124 Y119.307 E.00925
G1 X114.493 Y109.677 E.22233
G1 X113.926 Y109.677 E.00925
G1 X124.124 Y119.874 E.23541
G1 X124.124 Y120.441 E.00925
G1 X113.36 Y109.677 E.2485
G1 X112.793 Y109.676 E.00925
G1 X124.124 Y121.007 E.26158
G1 X124.124 Y121.574 E.00925
G1 X112.226 Y109.676 E.27466
G1 X111.66 Y109.676 E.00925
G1 X124.124 Y122.141 E.28774
G1 X124.124 Y122.707 E.00925
G1 X111.093 Y109.676 E.30082
G2 X110.528 Y109.678 I-.191 J44.202 E.00923
G1 X124.124 Y123.274 E.31388
G1 X124.124 Y123.84 E.00925
G1 X109.965 Y109.681 E.32688
G1 X109.678 Y109.683 E.00469
G1 X109.678 Y109.961 E.00453
G1 X123.84 Y124.123 E.32695
G1 X123.274 Y124.123 E.00925
G1 X109.678 Y110.527 E.31387
G1 X109.678 Y111.094 E.00925
G1 X122.707 Y124.123 E.3008
G1 X122.141 Y124.123 E.00925
G1 X109.678 Y111.66 E.28772
G1 X109.677 Y112.227 E.00925
G1 X121.574 Y124.123 E.27464
G1 X121.007 Y124.124 E.00925
G1 X109.677 Y112.794 E.26156
G1 X109.677 Y113.36 E.00925
G1 X120.441 Y124.124 E.24848
G1 X119.874 Y124.124 E.00925
G1 X109.677 Y113.927 E.2354
G1 X109.677 Y114.493 E.00925
G1 X119.308 Y124.124 E.22232
G1 X118.741 Y124.124 E.00925
G1 X109.677 Y115.06 E.20924
G1 X109.677 Y115.626 E.00925
G1 X118.175 Y124.124 E.19617
G1 X117.608 Y124.124 E.00925
G1 X109.677 Y116.193 E.18309
G1 X109.677 Y116.759 E.00925
G1 X117.041 Y124.124 E.17001
G1 X116.475 Y124.124 E.00925
G1 X109.677 Y117.326 E.15693
G1 X109.677 Y117.893 E.00925
G1 X115.908 Y124.124 E.14385
G1 X115.342 Y124.124 E.00925
G1 X109.677 Y118.459 E.13077
G1 X109.677 Y119.026 E.00925
G1 X114.775 Y124.124 E.11769
G1 X114.209 Y124.124 E.00925
G1 X109.677 Y119.592 E.10461
G1 X109.677 Y120.159 E.00925
G1 X113.642 Y124.124 E.09153
G1 X113.075 Y124.124 E.00925
G1 X109.677 Y120.725 E.07846
G1 X109.677 Y121.292 E.00925
G1 X112.509 Y124.124 E.06538
G1 X111.942 Y124.124 E.00925
G1 X109.677 Y121.859 E.0523
G1 X109.677 Y122.425 E.00925
G1 X111.376 Y124.124 E.03922
G1 X110.809 Y124.124 E.00925
G1 X109.677 Y122.992 E.02614
G1 X109.677 Y123.558 E.00925
G1 X110.422 Y124.303 E.0172
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.677 Y123.558 E-.40043
G1 X109.677 Y122.992 E-.21529
G1 X109.945 Y123.26 E-.14427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 4/83
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S191.25
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I.031 J1.217 P1  F42000
G1 X149.102 Y122.26 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z.8 F42000
G1 X130.052 Y125.948 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.38231
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.775 Y126.292 F42000
G1 F6000
M204 S6000
G1 X129.729 Y126.259 E.001
G3 X129.624 Y125.982 I.276 J-.263 E.00532
G1 X129.624 Y104.018 E.38348
G3 X130.012 Y103.624 I.383 J-.012 E.01082
G1 X151.989 Y103.624 E.38372
G3 X152.376 Y103.985 I.007 J.38 E.01022
G1 X152.376 Y125.982 E.38406
G3 X151.982 Y126.377 I-.387 J.008 E.0109
G1 X130.019 Y126.377 E.38348
G3 X129.852 Y126.345 I-.014 J-.381 E.00299
G1 X129.825 Y126.326 E.00057
M204 S250
G1 X129.536 Y126.634 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.423 Y126.536 E.00243
G3 X129.21 Y125.994 I.583 J-.542 E.00968
G1 X129.21 Y104.006 E.35703
G3 X130.004 Y103.21 I.8 J.004 E.02025
G1 X152.002 Y103.21 E.35721
G3 X152.789 Y103.969 I-.01 J.797 E.01956
G1 X152.79 Y125.994 E.35764
G3 X151.994 Y126.79 I-.805 J-.008 E.02025
G1 X130.006 Y126.79 E.35703
G3 X129.584 Y126.669 I0 J-.796 E.00722
; WIPE_START
M204 S6000
G1 X129.423 Y126.536 E-.07946
G1 X129.27 Y126.302 E-.10623
G1 X129.225 Y126.154 E-.05885
G1 X129.21 Y125.994 E-.06104
G1 X129.21 Y124.798 E-.45442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 4 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer4 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X131.704 Y125.581 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X130.419 Y125.581 E.02244
G1 X130.419 Y125.153 E.00749
G2 X130.696 Y123.621 I-1.46 J-1.055 E.0281
G1 X130.419 Y123.282 E.00766
G1 X130.419 Y119.635 E.06367
G2 X130.696 Y118.104 I-1.46 J-1.055 E.0281
G1 X130.419 Y117.764 E.00766
G1 X130.419 Y114.117 E.06367
G2 X130.696 Y112.586 I-1.46 J-1.055 E.0281
G1 X130.419 Y112.246 E.00766
G1 X130.419 Y108.6 E.06367
G2 X130.696 Y107.069 I-1.46 J-1.055 E.0281
G1 X130.419 Y106.729 E.00766
G1 X130.419 Y105.015 E.02993
M204 S10000
G1 X145.032 Y106.531 F42000
G1 F16200
M204 S6000
G1 X146.746 Y106.531 E.02993
G3 X145.781 Y105.344 I1.211 J-1.971 E.02723
G1 X145.69 Y104.655 E.01215
G1 X145.756 Y104.419 E.00428
G1 X143.686 Y104.419 E.03614
G1 X143.415 Y104.655 E.00628
G1 X143.022 Y105.344 E.01386
G1 X142.931 Y106.034 E.01215
G2 X143.153 Y106.531 I.683 J-.006 E.00978
G1 X141.229 Y106.531 E.03359
G3 X140.263 Y105.344 I1.211 J-1.971 E.02723
G1 X140.172 Y104.655 E.01215
G1 X140.239 Y104.419 E.00428
G1 X138.169 Y104.419 E.03614
G1 X137.898 Y104.655 E.00628
G1 X137.504 Y105.344 E.01386
G1 X137.413 Y106.034 E.01215
G2 X137.635 Y106.531 I.683 J-.006 E.00978
G1 X135.711 Y106.531 E.03359
G3 X134.746 Y105.344 I1.211 J-1.971 E.02723
G1 X134.655 Y104.655 E.01215
G1 X134.721 Y104.419 E.00428
G1 X132.651 Y104.419 E.03614
G1 X132.38 Y104.655 E.00628
G1 X131.987 Y105.344 E.01386
G1 X131.896 Y106.034 E.01215
G2 X132.531 Y106.947 I1.542 J-.395 E.01985
G1 X132.531 Y110.04 E.05401
G1 X132.38 Y110.172 E.0035
G1 X131.987 Y110.862 E.01386
G1 X131.896 Y111.552 E.01215
G2 X132.531 Y112.465 I1.542 J-.395 E.01985
G1 X132.531 Y115.558 E.05401
G1 X132.38 Y115.69 E.0035
G1 X131.987 Y116.379 E.01386
G1 X131.896 Y117.069 E.01215
G2 X132.531 Y117.983 I1.542 J-.395 E.01985
G1 X132.531 Y121.076 E.05401
G1 X132.38 Y121.207 E.0035
G1 X131.987 Y121.897 E.01386
G1 X131.896 Y122.587 E.01215
G1 X131.993 Y122.932 E.00625
G2 X133.067 Y123.966 I3.535 J-2.596 E.02617
G1 X133.46 Y124.656 E.01386
G1 X133.551 Y125.346 E.01215
G1 X133.485 Y125.581 E.00428
G1 X135.555 Y125.581 E.03614
G1 X135.826 Y125.346 E.00628
G1 X136.219 Y124.656 E.01386
G1 X136.31 Y123.966 E.01215
G2 X136.089 Y123.469 I-.683 J.006 E.00978
G1 X138.013 Y123.469 E.03359
G3 X138.978 Y124.656 I-1.211 J1.971 E.02723
G1 X139.069 Y125.346 E.01215
G1 X139.003 Y125.581 E.00428
G1 X141.072 Y125.581 E.03614
G1 X141.344 Y125.346 E.00628
G1 X141.737 Y124.656 E.01386
G1 X141.828 Y123.966 E.01215
G2 X141.606 Y123.469 I-.683 J.006 E.00978
G1 X143.53 Y123.469 E.03359
G3 X144.496 Y124.656 I-1.211 J1.971 E.02723
G1 X144.587 Y125.346 E.01215
G1 X144.52 Y125.581 E.00428
G1 X146.59 Y125.581 E.03614
G1 X146.861 Y125.346 E.00628
G1 X147.254 Y124.656 E.01386
G1 X147.345 Y123.966 E.01215
G2 X147.124 Y123.469 I-.683 J.006 E.00978
G1 X149.048 Y123.469 E.03359
G3 X150.013 Y124.656 I-1.211 J1.971 E.02723
G1 X150.104 Y125.346 E.01215
G1 X150.038 Y125.581 E.00428
G1 X151.581 Y125.581 E.02695
G1 X151.581 Y122.393 E.05567
G3 X151.208 Y121.207 I1.268 J-1.052 E.02226
G3 X151.581 Y120.523 I.973 J.088 E.014
G1 X151.581 Y116.875 E.06369
G3 X151.208 Y115.69 I1.268 J-1.051 E.02226
G3 X151.581 Y115.006 I.973 J.087 E.014
G1 X151.581 Y111.357 E.0637
G3 X151.208 Y110.172 I1.268 J-1.051 E.02225
G3 X151.581 Y109.488 I.973 J.087 E.01399
G1 X151.581 Y105.839 E.06371
G3 X151.208 Y104.655 I1.267 J-1.05 E.02224
G1 X151.274 Y104.419 E.00428
G1 X149.204 Y104.419 E.03614
G1 X148.933 Y104.655 E.00628
G1 X148.54 Y105.344 E.01386
G1 X148.449 Y106.034 E.01215
M73 P35 R19
G2 X148.67 Y106.531 I.683 J-.006 E.00978
G1 X149.469 Y106.531 E.01394
G1 X149.469 Y107.282 E.0131
G1 X149.62 Y107.413 E.00351
G1 X150.013 Y108.103 E.01386
G1 X150.104 Y108.793 E.01215
G3 X149.469 Y109.706 I-1.542 J-.395 E.01985
G1 X149.469 Y112.799 E.054
G1 X149.62 Y112.931 E.00351
G1 X150.013 Y113.621 E.01386
G1 X150.104 Y114.31 E.01215
G3 X149.469 Y115.224 I-1.542 J-.395 E.01985
G1 X149.469 Y118.317 E.054
G1 X149.62 Y118.449 E.00351
G1 X150.013 Y119.138 E.01386
G1 X150.104 Y119.828 E.01215
G3 X149.469 Y120.742 I-1.542 J-.395 E.01985
G1 X149.469 Y122.456 E.02993
; OBJECT_ID: 83
; WIPE_START
G1 X149.469 Y120.742 E-.65138
G1 X149.665 Y120.534 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X149.496 Y128.165 Z.8 F42000
G1 X149.052 Y148.21 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z.8 F42000
G1 X130.052 Y151.948 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.38231
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.775 Y152.292 F42000
G1 F6000
M204 S6000
G1 X129.729 Y152.259 E.001
G3 X129.624 Y151.982 I.276 J-.263 E.00532
G1 X129.624 Y130.018 E.38348
G3 X130.012 Y129.624 I.383 J-.012 E.01082
G1 X151.989 Y129.624 E.38372
G3 X152.376 Y129.985 I.007 J.38 E.01022
G1 X152.376 Y151.982 E.38406
G3 X151.982 Y152.376 I-.387 J.008 E.0109
G1 X130.019 Y152.376 E.38348
G3 X129.852 Y152.345 I-.014 J-.381 E.00299
G1 X129.825 Y152.326 E.00057
M204 S250
G1 X129.536 Y152.634 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.423 Y152.536 E.00243
G3 X129.21 Y151.994 I.583 J-.542 E.00968
G1 X129.21 Y130.006 E.35703
G3 X130.004 Y129.21 I.8 J.004 E.02025
G1 X152.002 Y129.21 E.35721
G3 X152.789 Y129.969 I-.01 J.797 E.01956
G1 X152.79 Y151.994 E.35764
G3 X151.994 Y152.79 I-.805 J-.008 E.02025
G1 X130.006 Y152.79 E.35703
G3 X129.584 Y152.669 I0 J-.796 E.00722
; WIPE_START
M204 S6000
G1 X129.423 Y152.536 E-.07946
G1 X129.27 Y152.302 E-.10623
G1 X129.225 Y152.154 E-.05885
G1 X129.21 Y151.994 E-.06104
G1 X129.21 Y150.798 E-.45442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.704 Y151.581 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X130.419 Y151.581 E.02244
G1 X130.419 Y151.153 E.00749
G2 X130.696 Y149.621 I-1.46 J-1.055 E.0281
G1 X130.419 Y149.282 E.00766
G1 X130.419 Y145.635 E.06367
G2 X130.696 Y144.104 I-1.46 J-1.055 E.0281
G1 X130.419 Y143.764 E.00766
G1 X130.419 Y140.117 E.06367
G2 X130.696 Y138.586 I-1.46 J-1.055 E.0281
G1 X130.419 Y138.246 E.00766
G1 X130.419 Y134.6 E.06367
G2 X130.696 Y133.068 I-1.46 J-1.055 E.0281
G1 X130.419 Y132.729 E.00766
G1 X130.419 Y131.015 E.02993
M204 S10000
G1 X145.089 Y132.581 F42000
G1 F16200
M204 S6000
G1 X146.804 Y132.581 E.02993
G3 X145.781 Y131.344 I1.254 J-2.078 E.02856
G1 X145.69 Y130.655 E.01215
G1 X145.756 Y130.419 E.00428
G1 X143.686 Y130.419 E.03614
G1 X143.415 Y130.655 E.00628
G1 X143.022 Y131.344 E.01386
G1 X142.931 Y132.034 E.01215
G2 X143.193 Y132.581 I.76 J-.028 E.0109
G1 X141.286 Y132.581 E.0333
G3 X140.263 Y131.344 I1.254 J-2.078 E.02856
G1 X140.172 Y130.655 E.01215
G1 X140.239 Y130.419 E.00428
G1 X138.169 Y130.419 E.03614
G1 X137.898 Y130.655 E.00628
G1 X137.504 Y131.344 E.01386
G1 X137.413 Y132.034 E.01215
G2 X137.676 Y132.581 I.76 J-.028 E.0109
G1 X135.768 Y132.581 E.0333
G3 X134.746 Y131.344 I1.254 J-2.078 E.02856
G1 X134.655 Y130.655 E.01215
G1 X134.721 Y130.419 E.00428
G1 X132.651 Y130.419 E.03614
G1 X132.38 Y130.655 E.00628
G1 X131.987 Y131.344 E.01386
G1 X131.896 Y132.034 E.01215
G2 X132.581 Y132.991 I1.598 J-.421 E.02101
G1 X132.581 Y135.997 E.05249
G1 X132.38 Y136.172 E.00466
G1 X131.987 Y136.862 E.01386
G1 X131.896 Y137.552 E.01215
G2 X132.581 Y138.508 I1.598 J-.421 E.02101
G1 X132.581 Y141.515 E.05249
G1 X132.38 Y141.69 E.00466
G1 X131.987 Y142.379 E.01386
G1 X131.896 Y143.069 E.01215
G2 X132.581 Y144.026 I1.598 J-.421 E.02101
G1 X132.581 Y147.032 E.05249
G1 X132.38 Y147.207 E.00466
G1 X131.987 Y147.897 E.01386
G1 X131.896 Y148.587 E.01215
G1 X131.993 Y148.932 E.00625
G2 X133.067 Y149.966 I3.535 J-2.596 E.02617
G1 X133.46 Y150.656 E.01386
G1 X133.551 Y151.346 E.01215
G1 X133.485 Y151.581 E.00428
G1 X135.555 Y151.581 E.03614
G1 X135.826 Y151.346 E.00628
G1 X136.219 Y150.656 E.01386
G1 X136.31 Y149.966 E.01215
G2 X136.048 Y149.419 I-.761 J.028 E.0109
G1 X137.955 Y149.419 E.0333
G3 X138.978 Y150.656 I-1.254 J2.078 E.02857
G1 X139.069 Y151.346 E.01215
G1 X139.003 Y151.581 E.00428
G1 X141.072 Y151.581 E.03614
G1 X141.344 Y151.346 E.00628
G1 X141.737 Y150.656 E.01386
G1 X141.828 Y149.966 E.01215
G2 X141.566 Y149.419 I-.761 J.028 E.0109
G1 X143.473 Y149.419 E.0333
G3 X144.496 Y150.656 I-1.254 J2.078 E.02857
G1 X144.587 Y151.346 E.01215
G1 X144.52 Y151.581 E.00428
G1 X146.59 Y151.581 E.03614
G1 X146.861 Y151.346 E.00628
G1 X147.254 Y150.656 E.01386
G1 X147.345 Y149.966 E.01215
G2 X147.083 Y149.419 I-.761 J.028 E.0109
G1 X148.99 Y149.419 E.0333
G3 X150.013 Y150.656 I-1.254 J2.078 E.02857
G1 X150.104 Y151.346 E.01215
G1 X150.038 Y151.581 E.00428
G1 X151.581 Y151.581 E.02695
G1 X151.581 Y148.393 E.05567
G3 X151.208 Y147.207 I1.268 J-1.052 E.02226
G3 X151.581 Y146.523 I.973 J.088 E.014
G1 X151.581 Y142.875 E.06369
G3 X151.208 Y141.69 I1.268 J-1.051 E.02226
G3 X151.581 Y141.006 I.973 J.087 E.014
G1 X151.581 Y137.357 E.0637
G3 X151.208 Y136.172 I1.268 J-1.051 E.02225
G3 X151.581 Y135.488 I.973 J.087 E.01399
G1 X151.581 Y131.839 E.06371
G3 X151.208 Y130.655 I1.267 J-1.05 E.02224
G1 X151.274 Y130.419 E.00428
G1 X149.204 Y130.419 E.03614
G1 X148.933 Y130.655 E.00628
G1 X148.54 Y131.344 E.01386
G1 X148.449 Y132.034 E.01215
G2 X148.711 Y132.581 I.76 J-.028 E.0109
G1 X149.419 Y132.581 E.01236
G1 X149.419 Y133.238 E.01147
G1 X149.62 Y133.413 E.00466
G1 X150.013 Y134.103 E.01386
G1 X150.104 Y134.793 E.01215
G3 X149.419 Y135.75 I-1.598 J-.421 E.02102
G1 X149.419 Y138.756 E.05248
G1 X149.62 Y138.931 E.00466
G1 X150.013 Y139.621 E.01386
G1 X150.104 Y140.31 E.01215
G3 X149.419 Y141.267 I-1.598 J-.421 E.02102
G1 X149.419 Y144.273 E.05248
G1 X149.62 Y144.449 E.00466
G1 X150.013 Y145.138 E.01386
G1 X150.104 Y145.828 E.01215
G3 X149.419 Y146.785 I-1.598 J-.421 E.02102
G1 X149.419 Y148.499 E.02993
; OBJECT_ID: 105
; WIPE_START
G1 X149.419 Y146.785 E-.65138
G1 X149.617 Y146.579 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X142.001 Y147.077 Z.8 F42000
G1 X123.152 Y148.31 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z.8 F42000
G1 X104.052 Y151.948 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.38231
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.775 Y152.292 F42000
G1 F6000
M204 S6000
G1 X103.729 Y152.259 E.001
G3 X103.624 Y151.982 I.276 J-.263 E.00532
G1 X103.624 Y130.018 E.38348
G3 X104.013 Y129.624 I.383 J-.012 E.01082
G1 X125.99 Y129.624 E.38372
G3 X126.376 Y129.985 I.007 J.38 E.01022
G1 X126.377 Y151.982 E.38406
G3 X125.982 Y152.376 I-.387 J.008 E.0109
G1 X104.019 Y152.376 E.38348
G3 X103.852 Y152.345 I-.014 J-.381 E.00299
G1 X103.825 Y152.326 E.00057
M204 S250
G1 X103.536 Y152.634 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.423 Y152.536 E.00243
G3 X103.21 Y151.994 I.583 J-.542 E.00968
G1 X103.21 Y130.006 E.35703
G3 X104.004 Y129.21 I.8 J.004 E.02025
G1 X126.003 Y129.21 E.35721
G3 X126.789 Y129.969 I-.01 J.797 E.01956
G1 X126.79 Y151.994 E.35764
G3 X125.994 Y152.79 I-.805 J-.008 E.02025
G1 X104.006 Y152.79 E.35703
G3 X103.584 Y152.669 I0 J-.796 E.00722
; WIPE_START
M204 S6000
G1 X103.423 Y152.536 E-.07946
G1 X103.27 Y152.302 E-.10623
G1 X103.225 Y152.154 E-.05885
G1 X103.21 Y151.994 E-.06104
G1 X103.21 Y150.798 E-.45442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.704 Y151.581 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X104.419 Y151.581 E.02244
G1 X104.419 Y151.153 E.00749
G2 X104.696 Y149.621 I-1.46 J-1.055 E.0281
G1 X104.419 Y149.282 E.00766
G1 X104.419 Y145.635 E.06367
G2 X104.696 Y144.104 I-1.46 J-1.055 E.0281
G1 X104.419 Y143.764 E.00766
G1 X104.419 Y140.117 E.06367
G2 X104.696 Y138.586 I-1.46 J-1.055 E.0281
G1 X104.419 Y138.246 E.00766
G1 X104.419 Y134.6 E.06367
G2 X104.696 Y133.068 I-1.46 J-1.055 E.0281
G1 X104.419 Y132.729 E.00766
G1 X104.419 Y131.015 E.02993
M204 S10000
G1 X118.974 Y132.481 F42000
G1 F16200
M204 S6000
G1 X120.689 Y132.481 E.02993
G3 X119.781 Y131.344 I1.169 J-1.864 E.02589
G1 X119.69 Y130.655 E.01215
G1 X119.756 Y130.419 E.00428
G1 X117.686 Y130.419 E.03614
G1 X117.415 Y130.655 E.00628
G1 X117.022 Y131.344 E.01386
G1 X116.931 Y132.034 E.01215
G2 X117.112 Y132.481 I.605 J.016 E.00867
G1 X115.171 Y132.481 E.03389
G3 X114.263 Y131.344 I1.169 J-1.864 E.02589
G1 X114.172 Y130.655 E.01215
G1 X114.239 Y130.419 E.00428
G1 X112.169 Y130.419 E.03614
G1 X111.898 Y130.655 E.00628
G1 X111.504 Y131.344 E.01386
G1 X111.413 Y132.034 E.01215
G2 X111.594 Y132.481 I.605 J.016 E.00867
G1 X109.653 Y132.481 E.03389
G3 X108.746 Y131.344 I1.169 J-1.864 E.02589
G1 X108.655 Y130.655 E.01215
G1 X108.721 Y130.419 E.00428
G1 X106.651 Y130.419 E.03614
G1 X106.38 Y130.655 E.00628
G1 X105.987 Y131.344 E.01386
G1 X105.896 Y132.034 E.01215
G2 X106.481 Y132.904 I1.491 J-.372 E.01868
G1 X106.481 Y136.084 E.05552
G1 X105.987 Y136.862 E.0161
G1 X105.896 Y137.552 E.01215
G2 X106.481 Y138.421 I1.491 J-.372 E.01868
G1 X106.481 Y141.602 E.05552
G1 X105.987 Y142.379 E.0161
G1 X105.896 Y143.069 E.01215
G2 X106.481 Y143.939 I1.491 J-.372 E.01868
G1 X106.481 Y147.119 E.05552
G1 X105.987 Y147.897 E.0161
G1 X105.896 Y148.587 E.01215
G2 X106.481 Y149.457 I1.491 J-.372 E.01868
G1 X106.481 Y149.519 E.00108
G3 X107.46 Y150.656 I-1.049 J1.893 E.02676
G1 X107.551 Y151.346 E.01215
G1 X107.485 Y151.581 E.00428
G1 X109.555 Y151.581 E.03614
G1 X109.826 Y151.346 E.00628
G1 X110.219 Y150.656 E.01386
G1 X110.31 Y149.966 E.01215
G2 X110.13 Y149.519 I-.605 J-.016 E.00867
G1 X112.07 Y149.519 E.03388
G3 X112.978 Y150.656 I-1.169 J1.864 E.0259
G1 X113.069 Y151.346 E.01215
G1 X113.003 Y151.581 E.00428
G1 X115.072 Y151.581 E.03614
G1 X115.344 Y151.346 E.00628
G1 X115.737 Y150.656 E.01386
G1 X115.828 Y149.966 E.01215
G2 X115.647 Y149.519 I-.605 J-.016 E.00867
G1 X117.588 Y149.519 E.03388
G3 X118.496 Y150.656 I-1.169 J1.864 E.0259
G1 X118.587 Y151.346 E.01215
G1 X118.52 Y151.581 E.00428
G1 X120.59 Y151.581 E.03614
G1 X120.861 Y151.346 E.00628
G1 X121.255 Y150.656 E.01386
G1 X121.345 Y149.966 E.01215
G2 X121.165 Y149.519 I-.605 J-.016 E.00867
G1 X123.105 Y149.519 E.03388
G3 X124.013 Y150.656 I-1.169 J1.864 E.0259
G1 X124.104 Y151.346 E.01215
G1 X124.038 Y151.581 E.00428
G1 X125.581 Y151.581 E.02695
G1 X125.581 Y148.393 E.05567
G3 X125.208 Y147.207 I1.268 J-1.052 E.02226
G3 X125.581 Y146.523 I.973 J.088 E.014
M73 P36 R19
G1 X125.581 Y142.875 E.06369
G3 X125.208 Y141.69 I1.268 J-1.051 E.02226
G3 X125.581 Y141.006 I.973 J.087 E.014
G1 X125.581 Y137.357 E.0637
G3 X125.208 Y136.172 I1.268 J-1.051 E.02225
G3 X125.581 Y135.488 I.973 J.087 E.01399
G1 X125.581 Y131.839 E.06371
G3 X125.208 Y130.655 I1.267 J-1.05 E.02224
G1 X125.274 Y130.419 E.00428
G1 X123.204 Y130.419 E.03614
G1 X122.933 Y130.655 E.00628
G1 X122.54 Y131.344 E.01386
G1 X122.449 Y132.034 E.01215
G2 X122.629 Y132.481 I.605 J.016 E.00867
G1 X123.519 Y132.481 E.01553
G1 X123.519 Y133.325 E.01473
G1 X124.013 Y134.103 E.0161
G1 X124.104 Y134.793 E.01215
G3 X123.519 Y135.663 I-1.491 J-.372 E.01869
G1 X123.519 Y138.843 E.05552
G1 X124.013 Y139.621 E.0161
G1 X124.104 Y140.31 E.01215
G3 X123.519 Y141.18 I-1.491 J-.372 E.01869
G1 X123.519 Y144.36 E.05552
G1 X124.013 Y145.138 E.0161
G1 X124.104 Y145.828 E.01215
G3 X123.519 Y146.698 I-1.492 J-.372 E.01869
G1 X123.519 Y148.412 E.02993
; OBJECT_ID: 116
; WIPE_START
G1 X123.519 Y146.698 E-.65138
G1 X123.713 Y146.489 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.801 Y138.857 Z.8 F42000
G1 X124.142 Y109.291 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X124.511 Y109.684 I-.008 J.378 E.01049
G1 X124.511 Y124.108 E.25184
G3 X124.116 Y124.511 I-.377 J.025 E.01112
G1 X109.692 Y124.511 E.25184
G3 X109.289 Y124.116 I-.025 J-.377 E.01113
G1 X109.291 Y109.645 E.25266
G3 X109.695 Y109.29 I.379 J.023 E.01046
G1 X124.082 Y109.291 E.25119
M204 S10000
G1 X124.269 Y108.876 F42000
G1 F6000
M204 S6000
G1 X124.316 Y108.883 E.00083
G3 X124.939 Y109.673 I-.187 J.788 E.01895
G1 X124.939 Y124.121 E.25226
G3 X124.127 Y124.939 I-.811 J.007 E.02239
G1 X109.679 Y124.939 E.25226
G3 X108.861 Y124.127 I-.007 J-.811 E.0224
G1 X108.861 Y109.671 E.25239
G3 X109.687 Y108.861 I.804 J-.006 E.02256
G1 X124.159 Y108.862 E.25268
G1 X124.209 Y108.868 E.00088
M204 S250
G1 X124.319 Y108.467 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.409 Y108.481 E.00147
G3 X125.353 Y109.662 I-.284 J1.195 E.02645
G1 X125.353 Y124.133 E.23498
G3 X124.138 Y125.353 I-1.229 J-.009 E.03097
G1 X109.667 Y125.353 E.23498
G3 X108.447 Y124.138 I.009 J-1.229 E.03098
G1 X108.447 Y109.664 E.23502
G3 X109.68 Y108.448 I1.218 J.001 E.03128
G1 X124.176 Y108.449 E.23539
G1 X124.26 Y108.459 E.00137
; WIPE_START
M204 S6000
G1 X124.409 Y108.481 E-.0572
G1 X124.638 Y108.555 E-.09163
G1 X124.846 Y108.675 E-.09116
G1 X125.025 Y108.831 E-.09021
G1 X125.169 Y109.019 E-.09
G1 X125.26 Y109.197 E-.07615
G1 X125.329 Y109.426 E-.09078
G1 X125.353 Y109.662 E-.09009
G1 X125.353 Y109.88 E-.08279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.721 Y109.765 Z.8 F42000
G1 X110.451 Y109.656 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X112.165 Y109.656 E.02993
G1 X112.119 Y110.003 E.00611
G1 X111.726 Y110.693 E.01386
G2 X110.652 Y111.727 I2.461 J3.631 E.02617
G1 X110.555 Y112.072 E.00625
G1 X110.646 Y112.762 E.01215
G1 X111.039 Y113.452 E.01386
G3 X112.113 Y114.486 I-2.46 J3.631 E.02617
G1 X112.21 Y114.831 E.00625
G1 X112.119 Y115.521 E.01215
G1 X111.726 Y116.21 E.01386
G2 X110.652 Y117.245 I2.461 J3.631 E.02617
G1 X110.555 Y117.59 E.00625
G1 X110.646 Y118.279 E.01215
G1 X111.039 Y118.969 E.01386
G3 X112.113 Y120.004 I-2.46 J3.631 E.02617
G1 X112.21 Y120.349 E.00625
G1 X112.119 Y121.038 E.01215
G1 X111.726 Y121.728 E.01386
G2 X110.652 Y122.763 I2.461 J3.631 E.02617
G1 X110.555 Y123.107 E.00625
G1 X110.646 Y123.797 E.01215
G1 X110.844 Y124.144 E.00698
G1 X113.359 Y124.144 E.04392
G1 X113.404 Y123.797 E.00611
G1 X113.798 Y123.107 E.01386
G2 X114.872 Y122.073 I-2.461 J-3.631 E.02617
G1 X114.969 Y121.728 E.00625
G1 X114.878 Y121.038 E.01215
G1 X114.485 Y120.349 E.01386
G3 X113.41 Y119.314 I2.46 J-3.631 E.02617
G1 X113.313 Y118.969 E.00625
G1 X113.404 Y118.279 E.01215
G1 X113.798 Y117.59 E.01386
G2 X114.872 Y116.555 I-2.461 J-3.631 E.02617
G1 X114.969 Y116.21 E.00625
G1 X114.878 Y115.521 E.01215
G1 X114.485 Y114.831 E.01386
G3 X113.41 Y113.796 I2.461 J-3.631 E.02617
G1 X113.313 Y113.452 E.00625
G1 X113.404 Y112.762 E.01215
G1 X113.798 Y112.072 E.01386
G2 X114.872 Y111.038 I-2.461 J-3.631 E.02617
G1 X114.969 Y110.693 E.00625
G1 X114.878 Y110.003 E.01215
G1 X114.681 Y109.656 E.00697
G1 X117.683 Y109.657 E.05242
G1 X117.637 Y110.003 E.0061
G1 X117.244 Y110.693 E.01386
G2 X116.169 Y111.727 I2.46 J3.631 E.02617
G1 X116.072 Y112.072 E.00625
G1 X116.163 Y112.762 E.01215
G1 X116.556 Y113.452 E.01386
G3 X117.631 Y114.486 I-2.46 J3.631 E.02617
G1 X117.728 Y114.831 E.00625
G1 X117.637 Y115.521 E.01215
G1 X117.244 Y116.21 E.01386
G2 X116.169 Y117.245 I2.46 J3.631 E.02617
G1 X116.072 Y117.59 E.00625
G1 X116.163 Y118.279 E.01215
G1 X116.556 Y118.969 E.01386
G3 X117.631 Y120.004 I-2.46 J3.631 E.02617
G1 X117.728 Y120.349 E.00625
G1 X117.637 Y121.038 E.01215
G1 X117.244 Y121.728 E.01386
G2 X116.169 Y122.763 I2.46 J3.631 E.02617
G1 X116.072 Y123.107 E.00625
G1 X116.163 Y123.797 E.01215
G1 X116.361 Y124.144 E.00698
G1 X118.876 Y124.144 E.04392
G1 X118.922 Y123.797 E.00611
G1 X119.315 Y123.107 E.01386
G2 X120.39 Y122.073 I-2.46 J-3.631 E.02617
G1 X120.487 Y121.728 E.00625
G1 X120.396 Y121.038 E.01215
G1 X120.003 Y120.349 E.01386
G3 X118.928 Y119.314 I2.461 J-3.631 E.02617
G1 X118.831 Y118.969 E.00625
G1 X118.922 Y118.279 E.01215
G1 X119.315 Y117.59 E.01386
G2 X120.39 Y116.555 I-2.46 J-3.631 E.02617
G1 X120.487 Y116.21 E.00625
G1 X120.396 Y115.521 E.01215
G1 X120.003 Y114.831 E.01386
G3 X118.928 Y113.796 I2.461 J-3.631 E.02617
G1 X118.831 Y113.452 E.00625
G1 X118.922 Y112.762 E.01215
G1 X119.315 Y112.072 E.01386
G2 X120.39 Y111.038 I-2.46 J-3.631 E.02617
G1 X120.487 Y110.693 E.00625
G1 X120.396 Y110.003 E.01215
G1 X120.198 Y109.657 E.00696
G1 X123.2 Y109.657 E.05241
G1 X123.155 Y110.003 E.00609
G1 X122.761 Y110.693 E.01386
G2 X121.687 Y111.727 I2.46 J3.631 E.02617
G1 X121.59 Y112.072 E.00625
G1 X121.681 Y112.762 E.01215
G1 X122.074 Y113.452 E.01386
G3 X123.149 Y114.486 I-2.461 J3.631 E.02617
G1 X123.245 Y114.831 E.00625
G1 X123.155 Y115.521 E.01215
G1 X122.761 Y116.21 E.01386
G2 X121.687 Y117.245 I2.46 J3.631 E.02617
G1 X121.59 Y117.59 E.00625
G1 X121.681 Y118.279 E.01215
G1 X122.074 Y118.969 E.01386
G3 X123.149 Y120.004 I-2.461 J3.631 E.02617
G1 X123.245 Y120.349 E.00625
G1 X123.155 Y121.038 E.01215
G1 X122.761 Y121.728 E.01386
G2 X121.687 Y122.763 I2.46 J3.631 E.02617
G1 X121.59 Y123.107 E.00625
G1 X121.681 Y123.797 E.01215
G1 X121.879 Y124.144 E.00698
G1 X123.593 Y124.144 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X121.879 Y124.144 E-.65138
G1 X121.737 Y123.896 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 5/83
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.073 J1.215 P1  F42000
G1 X149.102 Y122.26 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z.9 F42000
G1 X130.052 Y125.948 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.751 Y126.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.256 J-.285 E.00572
G1 X129.624 Y104.012 E.3837
G3 X130.019 Y103.624 I.38 J-.009 E.01084
G1 X151.992 Y103.624 E.38366
G1 X152.049 Y103.627 E.00099
G3 X152.376 Y103.986 I-.051 J.375 E.00919
G1 X152.376 Y125.988 E.38416
G3 X151.982 Y126.377 I-.387 J.002 E.01079
G1 X130.012 Y126.377 E.38359
G3 X129.799 Y126.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.508 Y126.609 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y126.579 E.00081
G3 X129.21 Y125.996 I.542 J-.588 E.01064
G1 X129.21 Y104.004 E.3571
M73 P36 R18
G3 X130.006 Y103.21 I.796 J.002 E.02028
G1 X152.005 Y103.21 E.35722
G3 X152.789 Y103.969 I-.019 J.804 E.01948
G1 X152.79 Y125.996 E.35767
G3 X151.994 Y126.79 I-.805 J-.011 E.02022
G1 X130.004 Y126.79 E.35707
G3 X129.697 Y126.726 I.006 J-.8 E.00512
G1 X129.559 Y126.64 E.00265
; WIPE_START
M204 S6000
G1 X129.468 Y126.579 E-.04173
G1 X129.362 Y126.466 E-.05875
G1 X129.27 Y126.3 E-.07207
G1 X129.226 Y126.154 E-.05799
G1 X129.21 Y125.996 E-.06041
G1 X129.21 Y124.762 E-.46904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 5 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer5 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X131.671 Y125.581 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X130.419 Y125.581 E.02187
G1 X130.419 Y125.12 E.00806
G2 X130.839 Y123.621 I-1.526 J-1.236 E.02794
G2 X130.419 Y123.1 I-3.871 J2.688 E.0117
G1 X130.419 Y119.602 E.06107
G2 X130.839 Y118.104 I-1.526 J-1.236 E.02794
G2 X130.419 Y117.582 I-3.871 J2.688 E.0117
G1 X130.419 Y114.085 E.06107
G2 X130.839 Y112.586 I-1.526 J-1.236 E.02794
G2 X130.419 Y112.065 I-3.871 J2.688 E.0117
G1 X130.419 Y108.567 E.06107
G2 X130.839 Y107.069 I-1.526 J-1.236 E.02794
G2 X130.419 Y106.547 I-3.871 J2.688 E.0117
G1 X130.419 Y104.833 E.02993
; WIPE_START
G1 X130.419 Y106.547 E-.65138
G1 X130.598 Y106.77 E-.10863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.175 Y107.683 Z.9 F42000
G1 X149.469 Y109.044 Z.9
G1 Z.5
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X149.469 Y107.33 E.02993
G1 X150.041 Y108.103 E.0168
G1 X150.201 Y108.793 E.01236
G3 X149.469 Y109.798 I-1.274 J-.158 E.02267
G1 X149.469 Y112.848 E.05324
G1 X150.041 Y113.621 E.0168
G1 X150.201 Y114.31 E.01236
G3 X149.469 Y115.316 I-1.274 J-.158 E.02267
G1 X149.469 Y118.365 E.05324
G1 X150.041 Y119.138 E.0168
G1 X150.201 Y119.828 E.01236
G3 X149.469 Y120.834 I-1.274 J-.158 E.02267
G1 X149.469 Y122.548 E.02993
M204 S10000
G1 X151.581 Y124.075 F42000
G1 F16200
M204 S6000
G1 X151.581 Y122.361 E.02993
G3 X151.111 Y121.207 I1.282 J-1.195 E.02223
G1 X151.162 Y120.863 E.00609
G2 X151.581 Y120.3 I-8.58 J-6.837 E.01226
G1 X151.581 Y116.843 E.06036
G3 X151.111 Y115.69 I1.282 J-1.195 E.02223
G1 X151.162 Y115.345 E.00609
G2 X151.581 Y114.782 I-8.57 J-6.829 E.01226
G1 X151.581 Y111.325 E.06037
G3 X151.111 Y110.172 I1.281 J-1.194 E.02222
G1 X151.162 Y109.827 E.00609
G2 X151.581 Y109.265 I-8.569 J-6.828 E.01225
G1 X151.581 Y105.807 E.06038
G3 X151.111 Y104.655 I1.281 J-1.194 E.02221
G1 X151.146 Y104.419 E.00416
G1 X149.286 Y104.419 E.03247
G1 X148.974 Y104.655 E.00683
G1 X148.512 Y105.344 E.0145
G1 X148.352 Y106.034 E.01236
G2 X148.519 Y106.531 I.53 J.099 E.00957
G1 X146.873 Y106.531 E.02874
G3 X145.753 Y105.344 I1.156 J-2.213 E.02904
G1 X145.594 Y104.655 E.01236
G1 X145.628 Y104.419 E.00416
G1 X143.768 Y104.419 E.03247
G1 X143.456 Y104.655 E.00683
G1 X142.994 Y105.344 E.0145
G1 X142.835 Y106.034 E.01236
G2 X143.002 Y106.531 I.53 J.099 E.00957
G1 X141.356 Y106.531 E.02874
G3 X140.235 Y105.344 I1.156 J-2.213 E.02904
G1 X140.076 Y104.655 E.01236
G1 X140.11 Y104.419 E.00416
G1 X138.251 Y104.419 E.03247
G1 X137.939 Y104.655 E.00683
G1 X137.477 Y105.344 E.0145
G1 X137.317 Y106.034 E.01236
G2 X137.484 Y106.531 I.53 J.099 E.00957
G1 X135.838 Y106.531 E.02874
G3 X134.718 Y105.344 I1.156 J-2.213 E.02904
G1 X134.558 Y104.655 E.01236
G1 X134.593 Y104.419 E.00416
G1 X132.733 Y104.419 E.03247
G1 X132.421 Y104.655 E.00683
G1 X131.959 Y105.344 E.0145
G1 X131.799 Y106.034 E.01236
G2 X132.531 Y107.039 I1.274 J-.158 E.02267
G1 X132.531 Y110.089 E.05324
G1 X131.959 Y110.862 E.0168
G1 X131.799 Y111.552 E.01236
G2 X132.531 Y112.557 I1.274 J-.158 E.02267
G1 X132.531 Y115.606 E.05324
G1 X131.959 Y116.379 E.0168
G1 X131.799 Y117.069 E.01236
G2 X132.531 Y118.075 I1.274 J-.158 E.02267
G1 X132.531 Y121.124 E.05324
G1 X131.959 Y121.897 E.0168
G1 X131.799 Y122.587 E.01236
G2 X132.114 Y123.276 I.777 J.063 E.01382
G1 X133.026 Y123.966 E.01997
G1 X133.488 Y124.656 E.0145
G1 X133.648 Y125.346 E.01236
G1 X133.613 Y125.581 E.00416
G1 X135.473 Y125.581 E.03247
G1 X135.785 Y125.346 E.00683
G1 X136.247 Y124.656 E.0145
G1 X136.407 Y123.966 E.01236
G2 X136.239 Y123.469 I-.531 J-.099 E.00957
G1 X137.885 Y123.469 E.02874
G3 X139.006 Y124.656 I-1.156 J2.213 E.02904
G1 X139.165 Y125.346 E.01236
G1 X139.131 Y125.581 E.00416
G1 X140.99 Y125.581 E.03247
G1 X141.303 Y125.346 E.00683
G1 X141.765 Y124.656 E.0145
G1 X141.924 Y123.966 E.01236
G2 X141.757 Y123.469 I-.531 J-.099 E.00957
G1 X143.403 Y123.469 E.02874
G3 X144.524 Y124.656 I-1.156 J2.213 E.02904
G1 X144.683 Y125.346 E.01236
G1 X144.649 Y125.581 E.00416
G1 X146.508 Y125.581 E.03247
G1 X146.82 Y125.346 E.00683
G1 X147.282 Y124.656 E.0145
G1 X147.442 Y123.966 E.01236
G2 X147.275 Y123.469 I-.531 J-.099 E.00957
G1 X148.921 Y123.469 E.02874
G3 X150.041 Y124.656 I-1.156 J2.213 E.02904
G1 X150.201 Y125.346 E.01236
G1 X150.166 Y125.581 E.00416
G1 X151.581 Y125.581 E.02471
G1 X151.581 Y125.283 E.00522
; OBJECT_ID: 83
; WIPE_START
G1 X151.581 Y125.581 E-.11358
G1 X150.166 Y125.581 E-.5378
G1 X150.201 Y125.346 E-.09059
G1 X150.19 Y125.299 E-.01803
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X149.811 Y132.922 Z.9 F42000
G1 X149.052 Y148.21 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z.9 F42000
G1 X130.052 Y151.948 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.256 J-.285 E.00572
G1 X129.624 Y130.012 E.3837
G3 X130.019 Y129.624 I.38 J-.009 E.01084
M73 P37 R18
G1 X151.992 Y129.624 E.38366
G1 X152.049 Y129.627 E.00099
G3 X152.376 Y129.986 I-.051 J.375 E.00919
G1 X152.376 Y151.988 E.38416
G3 X151.982 Y152.376 I-.387 J.002 E.01079
G1 X130.012 Y152.376 E.38359
G3 X129.799 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.508 Y152.608 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y152.578 E.00081
G3 X129.21 Y151.996 I.542 J-.588 E.01064
G1 X129.21 Y130.004 E.3571
G3 X130.006 Y129.21 I.796 J.002 E.02028
G1 X152.005 Y129.21 E.35722
G3 X152.789 Y129.969 I-.019 J.804 E.01948
G1 X152.79 Y151.996 E.35767
G3 X151.994 Y152.79 I-.805 J-.011 E.02022
G1 X130.004 Y152.79 E.35707
G3 X129.697 Y152.726 I.006 J-.8 E.00512
G1 X129.559 Y152.64 E.00265
; WIPE_START
M204 S6000
G1 X129.468 Y152.578 E-.04173
G1 X129.362 Y152.466 E-.05875
G1 X129.27 Y152.3 E-.07207
G1 X129.226 Y152.154 E-.05799
G1 X129.21 Y151.996 E-.06041
G1 X129.21 Y150.762 E-.46904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.671 Y151.581 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X130.419 Y151.581 E.02187
G1 X130.419 Y151.12 E.00806
G2 X130.839 Y149.621 I-1.526 J-1.236 E.02794
G2 X130.419 Y149.1 I-3.871 J2.688 E.0117
G1 X130.419 Y145.602 E.06107
G2 X130.839 Y144.104 I-1.526 J-1.236 E.02794
G2 X130.419 Y143.582 I-3.871 J2.688 E.0117
G1 X130.419 Y140.085 E.06107
G2 X130.839 Y138.586 I-1.526 J-1.236 E.02794
G2 X130.419 Y138.065 I-3.871 J2.688 E.0117
G1 X130.419 Y134.567 E.06107
G2 X130.839 Y133.068 I-1.526 J-1.236 E.02794
G2 X130.419 Y132.547 I-3.871 J2.688 E.0117
G1 X130.419 Y130.833 E.02993
M204 S10000
G1 X145.225 Y132.581 F42000
G1 F16200
M204 S6000
G1 X146.939 Y132.581 E.02993
G3 X145.753 Y131.344 I1.195 J-2.334 E.03049
G1 X145.594 Y130.655 E.01236
G1 X145.628 Y130.419 E.00416
G1 X143.768 Y130.419 E.03247
G1 X143.456 Y130.655 E.00683
G1 X142.994 Y131.344 E.0145
G1 X142.835 Y132.034 E.01236
G2 X143.04 Y132.581 I.594 J.089 E.01066
G1 X141.422 Y132.581 E.02825
G3 X140.235 Y131.344 I1.195 J-2.333 E.03049
G1 X140.076 Y130.655 E.01236
G1 X140.11 Y130.419 E.00416
G1 X138.251 Y130.419 E.03247
G1 X137.939 Y130.655 E.00683
G1 X137.477 Y131.344 E.0145
G1 X137.317 Y132.034 E.01236
G2 X137.522 Y132.581 I.594 J.089 E.01066
G1 X135.904 Y132.581 E.02825
G3 X134.718 Y131.344 I1.195 J-2.333 E.03049
G1 X134.558 Y130.655 E.01236
G1 X134.593 Y130.419 E.00416
G1 X132.733 Y130.419 E.03247
G1 X132.421 Y130.655 E.00683
G1 X131.959 Y131.344 E.0145
G1 X131.799 Y132.034 E.01236
G1 X131.85 Y132.379 E.00609
G2 X132.581 Y133.077 I1.625 J-.97 E.01788
G1 X132.581 Y136.051 E.05192
G1 X132.421 Y136.172 E.00351
G1 X131.959 Y136.862 E.0145
G1 X131.799 Y137.552 E.01236
G1 X131.85 Y137.896 E.00609
G2 X132.581 Y138.595 I1.625 J-.97 E.01788
G1 X132.581 Y141.569 E.05192
G1 X132.421 Y141.69 E.00351
G1 X131.959 Y142.379 E.0145
G1 X131.799 Y143.069 E.01236
G1 X131.85 Y143.414 E.00609
G2 X132.581 Y144.112 I1.625 J-.97 E.01788
G1 X132.581 Y147.086 E.05192
G1 X132.421 Y147.207 E.00351
G1 X131.959 Y147.897 E.0145
G1 X131.799 Y148.587 E.01236
G2 X132.114 Y149.276 I.777 J.063 E.01382
G1 X133.026 Y149.966 E.01997
G1 X133.488 Y150.656 E.0145
G1 X133.648 Y151.346 E.01236
G1 X133.613 Y151.581 E.00416
G1 X135.473 Y151.581 E.03247
G1 X135.785 Y151.346 E.00683
G1 X136.247 Y150.656 E.0145
G1 X136.407 Y149.966 E.01236
G2 X136.201 Y149.419 I-.595 J-.089 E.01066
G1 X137.819 Y149.419 E.02825
G3 X139.006 Y150.656 I-1.195 J2.334 E.03049
G1 X139.165 Y151.346 E.01236
G1 X139.131 Y151.581 E.00416
G1 X140.99 Y151.581 E.03247
G1 X141.303 Y151.346 E.00683
G1 X141.765 Y150.656 E.0145
G1 X141.924 Y149.966 E.01236
G2 X141.719 Y149.419 I-.595 J-.089 E.01066
G1 X143.337 Y149.419 E.02825
G3 X144.524 Y150.656 I-1.195 J2.334 E.03049
G1 X144.683 Y151.346 E.01236
G1 X144.649 Y151.581 E.00416
G1 X146.508 Y151.581 E.03247
G1 X146.82 Y151.346 E.00683
G1 X147.282 Y150.656 E.0145
G1 X147.442 Y149.966 E.01236
G2 X147.236 Y149.419 I-.595 J-.089 E.01066
G1 X148.855 Y149.419 E.02825
G3 X150.041 Y150.656 I-1.195 J2.334 E.03049
G1 X150.201 Y151.346 E.01236
G1 X150.166 Y151.581 E.00416
G1 X151.581 Y151.581 E.02471
G1 X151.581 Y148.361 E.05624
G3 X151.111 Y147.207 I1.282 J-1.195 E.02223
G1 X151.162 Y146.863 E.00609
G2 X151.581 Y146.3 I-8.58 J-6.837 E.01226
G1 X151.581 Y142.843 E.06036
G3 X151.111 Y141.69 I1.282 J-1.195 E.02223
G1 X151.162 Y141.345 E.00609
G2 X151.581 Y140.782 I-8.57 J-6.829 E.01226
G1 X151.581 Y137.325 E.06037
G3 X151.111 Y136.172 I1.281 J-1.194 E.02222
G1 X151.162 Y135.827 E.00609
G2 X151.581 Y135.265 I-8.569 J-6.828 E.01225
G1 X151.581 Y131.807 E.06038
G3 X151.111 Y130.655 I1.281 J-1.194 E.02221
G1 X151.146 Y130.419 E.00416
G1 X149.286 Y130.419 E.03247
G1 X148.974 Y130.655 E.00683
G1 X148.512 Y131.344 E.0145
G1 X148.352 Y132.034 E.01236
G2 X148.558 Y132.581 I.594 J.089 E.01066
G1 X149.419 Y132.581 E.01503
G1 X149.419 Y133.292 E.01241
G1 X149.579 Y133.413 E.00351
G1 X150.041 Y134.103 E.0145
G1 X150.201 Y134.793 E.01236
G1 X150.15 Y135.138 E.00609
G3 X149.419 Y135.836 I-1.625 J-.97 E.01788
G1 X149.419 Y138.81 E.05192
G1 X149.579 Y138.931 E.00351
G1 X150.041 Y139.621 E.0145
G1 X150.201 Y140.31 E.01236
G1 X150.15 Y140.655 E.00609
G3 X149.419 Y141.354 I-1.625 J-.97 E.01788
G1 X149.419 Y144.327 E.05192
G1 X149.579 Y144.449 E.00351
G1 X150.041 Y145.138 E.0145
G1 X150.201 Y145.828 E.01236
G1 X150.15 Y146.173 E.00609
G3 X149.419 Y146.871 I-1.625 J-.97 E.01788
G1 X149.419 Y148.585 E.02993
; OBJECT_ID: 105
; WIPE_START
G1 X149.419 Y146.871 E-.65138
G1 X149.647 Y146.699 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X142.028 Y147.162 Z.9 F42000
G1 X123.152 Y148.31 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z.9 F42000
G1 X104.052 Y151.948 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.256 J-.285 E.00572
G1 X103.624 Y130.012 E.3837
G3 X104.019 Y129.624 I.38 J-.009 E.01084
G1 X125.992 Y129.624 E.38366
G1 X126.049 Y129.627 E.00099
G3 X126.376 Y129.986 I-.051 J.375 E.00919
G1 X126.377 Y151.988 E.38416
G3 X125.982 Y152.376 I-.387 J.002 E.01079
G1 X104.012 Y152.376 E.38359
G3 X103.799 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X103.508 Y152.608 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.468 Y152.578 E.00081
G3 X103.21 Y151.996 I.542 J-.588 E.01064
G1 X103.21 Y130.004 E.3571
G3 X104.006 Y129.21 I.796 J.002 E.02028
G1 X126.005 Y129.21 E.35722
G3 X126.789 Y129.969 I-.019 J.804 E.01948
G1 X126.79 Y151.996 E.35767
G3 X125.994 Y152.79 I-.805 J-.011 E.02022
G1 X104.004 Y152.79 E.35707
G3 X103.698 Y152.726 I.006 J-.8 E.00512
G1 X103.559 Y152.64 E.00265
; WIPE_START
M204 S6000
G1 X103.468 Y152.578 E-.04173
G1 X103.362 Y152.466 E-.05875
G1 X103.27 Y152.3 E-.07207
G1 X103.226 Y152.154 E-.05799
G1 X103.21 Y151.996 E-.06041
G1 X103.21 Y150.762 E-.46904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.671 Y151.581 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X104.419 Y151.581 E.02187
G1 X104.419 Y151.12 E.00806
G2 X104.839 Y149.621 I-1.526 J-1.236 E.02794
G2 X104.419 Y149.1 I-3.871 J2.688 E.0117
G1 X104.419 Y145.602 E.06107
G2 X104.839 Y144.104 I-1.526 J-1.236 E.02794
G2 X104.419 Y143.582 I-3.871 J2.688 E.0117
G1 X104.419 Y140.085 E.06107
G2 X104.839 Y138.586 I-1.526 J-1.236 E.02794
G2 X104.419 Y138.065 I-3.871 J2.688 E.0117
G1 X104.419 Y134.567 E.06107
G2 X104.839 Y133.068 I-1.526 J-1.236 E.02794
G2 X104.419 Y132.547 I-3.871 J2.688 E.0117
G1 X104.419 Y130.833 E.02993
; WIPE_START
G1 X104.419 Y132.547 E-.65138
G1 X104.598 Y132.77 E-.10863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.174 Y133.695 Z.9 F42000
G1 X123.519 Y135.082 Z.9
G1 Z.5
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X123.519 Y133.368 E.02993
G1 X124.041 Y134.103 E.01575
G1 X124.201 Y134.793 E.01236
G3 X123.519 Y135.761 I-1.23 J-.143 E.02155
G1 X123.519 Y138.885 E.05456
G1 X124.041 Y139.621 E.01575
G1 X124.201 Y140.31 E.01236
G3 X123.519 Y141.278 I-1.23 J-.143 E.02155
G1 X123.519 Y144.403 E.05456
G1 X124.041 Y145.138 E.01575
G1 X124.201 Y145.828 E.01236
G3 X123.519 Y146.796 I-1.23 J-.143 E.02155
G1 X123.519 Y148.51 E.02993
M204 S10000
G1 X125.581 Y150.075 F42000
G1 F16200
M204 S6000
G1 X125.581 Y148.361 E.02993
G3 X125.111 Y147.207 I1.282 J-1.195 E.02223
G1 X125.162 Y146.863 E.00609
G2 X125.581 Y146.3 I-8.58 J-6.837 E.01226
G1 X125.581 Y142.843 E.06036
G3 X125.111 Y141.69 I1.282 J-1.195 E.02223
G1 X125.162 Y141.345 E.00609
G2 X125.581 Y140.782 I-8.57 J-6.829 E.01226
G1 X125.581 Y137.325 E.06037
G3 X125.111 Y136.172 I1.281 J-1.194 E.02222
G1 X125.162 Y135.827 E.00609
G2 X125.581 Y135.265 I-8.569 J-6.828 E.01225
G1 X125.581 Y131.807 E.06038
G3 X125.111 Y130.655 I1.281 J-1.194 E.02221
G1 X125.146 Y130.419 E.00416
G1 X123.286 Y130.419 E.03247
G1 X122.974 Y130.655 E.00683
G1 X122.512 Y131.344 E.0145
G1 X122.352 Y132.034 E.01236
G2 X122.481 Y132.481 I.466 J.108 E.00849
G1 X120.807 Y132.481 E.02923
G3 X119.753 Y131.344 I1.117 J-2.092 E.02758
G1 X119.594 Y130.655 E.01236
G1 X119.628 Y130.419 E.00416
G1 X117.768 Y130.419 E.03247
G1 X117.456 Y130.655 E.00683
G1 X116.994 Y131.344 E.0145
G1 X116.835 Y132.034 E.01236
G2 X116.964 Y132.481 I.466 J.108 E.00849
G1 X115.29 Y132.481 E.02923
G3 X114.235 Y131.344 I1.116 J-2.092 E.02758
G1 X114.076 Y130.655 E.01236
G1 X114.11 Y130.419 E.00416
G1 X112.251 Y130.419 E.03247
G1 X111.939 Y130.655 E.00683
G1 X111.477 Y131.344 E.0145
G1 X111.317 Y132.034 E.01236
G2 X111.446 Y132.481 I.466 J.108 E.00849
G1 X109.772 Y132.481 E.02923
G3 X108.718 Y131.344 I1.116 J-2.092 E.02758
G1 X108.558 Y130.655 E.01236
G1 X108.593 Y130.419 E.00416
G1 X106.733 Y130.419 E.03247
G1 X106.421 Y130.655 E.00683
G1 X105.959 Y131.344 E.0145
G1 X105.799 Y132.034 E.01236
G2 X106.481 Y133.002 I1.23 J-.143 E.02155
G1 X106.481 Y136.127 E.05456
G1 X105.959 Y136.862 E.01575
G1 X105.799 Y137.552 E.01236
G2 X106.481 Y138.519 I1.23 J-.143 E.02155
G1 X106.481 Y141.644 E.05456
G1 X105.959 Y142.379 E.01575
G1 X105.799 Y143.069 E.01236
G2 X106.481 Y144.037 I1.23 J-.143 E.02155
G1 X106.481 Y147.162 E.05456
G1 X105.959 Y147.897 E.01575
G1 X105.799 Y148.587 E.01236
G2 X106.114 Y149.276 I.777 J.063 E.01382
G1 X107.026 Y149.966 E.01997
G1 X107.488 Y150.656 E.0145
G1 X107.648 Y151.346 E.01236
G1 X107.613 Y151.581 E.00416
G1 X109.473 Y151.581 E.03247
G1 X109.785 Y151.346 E.00683
G1 X110.247 Y150.656 E.0145
G1 X110.407 Y149.966 E.01236
G2 X110.278 Y149.519 I-.467 J-.108 E.00849
G1 X111.952 Y149.519 E.02923
G3 X113.006 Y150.656 I-1.117 J2.093 E.02759
G1 X113.165 Y151.346 E.01236
G1 X113.131 Y151.581 E.00416
G1 X114.99 Y151.581 E.03247
G1 X115.303 Y151.346 E.00683
G1 X115.765 Y150.656 E.0145
G1 X115.924 Y149.966 E.01236
G2 X115.795 Y149.519 I-.467 J-.108 E.00849
G1 X117.469 Y149.519 E.02923
G3 X118.524 Y150.656 I-1.117 J2.093 E.02759
G1 X118.683 Y151.346 E.01236
G1 X118.649 Y151.581 E.00416
G1 X120.508 Y151.581 E.03247
G1 X120.82 Y151.346 E.00683
G1 X121.282 Y150.656 E.0145
G1 X121.442 Y149.966 E.01236
G2 X121.313 Y149.519 I-.466 J-.108 E.00849
G1 X122.987 Y149.519 E.02923
G3 X124.041 Y150.656 I-1.117 J2.093 E.02759
G1 X124.201 Y151.346 E.01236
G1 X124.166 Y151.581 E.00416
G1 X125.581 Y151.581 E.02471
G1 X125.581 Y151.283 E.00522
; OBJECT_ID: 116
; WIPE_START
G1 X125.581 Y151.581 E-.11358
G1 X124.166 Y151.581 E-.5378
G1 X124.201 Y151.346 E-.09059
G1 X124.19 Y151.299 E-.01803
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X124.189 Y143.667 Z.9 F42000
G1 X124.185 Y109.274 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X124.529 Y109.669 I-.043 J.385 E.01005
G1 X124.528 Y124.153 E.25289
G3 X124.131 Y124.529 I-.384 J-.007 E.01064
G1 X109.647 Y124.528 E.25289
G3 X109.271 Y124.131 I.007 J-.384 E.01064
G1 X109.272 Y109.647 E.2529
G3 X109.647 Y109.272 I.386 J.01 E.01023
G1 X124.125 Y109.274 E.25279
M204 S10000
G1 X124.239 Y108.849 F42000
G1 F6000
M204 S6000
G1 X124.387 Y108.881 E.00266
G3 X124.958 Y109.662 I-.25 J.782 E.01806
G1 X124.957 Y124.17 E.25332
G3 X124.138 Y124.958 I-.812 J-.025 E.02196
M73 P38 R18
G1 X109.63 Y124.957 E.25332
G3 X108.842 Y124.138 I.025 J-.812 E.02196
G1 X108.843 Y109.629 E.25333
G3 X109.63 Y108.843 I.819 J.033 E.02134
G1 X124.179 Y108.847 E.25403
M204 S250
G1 X124.319 Y108.445 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.504 Y108.484 E.00307
G3 X125.371 Y109.655 I-.372 J1.183 E.02529
G1 X125.371 Y124.187 E.23597
G3 X124.145 Y125.371 I-1.226 J-.043 E.03059
G1 X109.613 Y125.371 E.23597
G3 X108.429 Y124.145 I.043 J-1.226 E.03059
G1 X108.429 Y109.612 E.23598
G3 X109.613 Y108.429 I1.238 J.055 E.02983
G1 X124.26 Y108.435 E.23784
; WIPE_START
M204 S6000
G1 X124.504 Y108.484 E-.09448
G1 X124.69 Y108.555 E-.07554
G1 X124.894 Y108.682 E-.09122
G1 X125.068 Y108.845 E-.09067
G1 X125.207 Y109.039 E-.09069
G1 X125.307 Y109.26 E-.09222
G1 X125.355 Y109.453 E-.07557
G1 X125.371 Y109.655 E-.07699
G1 X125.371 Y109.846 E-.07263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.74 Y109.739 Z.9 F42000
G1 X110.517 Y109.638 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X112.231 Y109.638 E.02993
G1 X112.147 Y110.003 E.00653
G1 X111.685 Y110.693 E.0145
G1 X110.772 Y111.382 E.01997
G2 X110.458 Y112.072 I.462 J.627 E.01382
G1 X110.618 Y112.762 E.01236
G1 X111.08 Y113.452 E.0145
G1 X111.992 Y114.141 E.01997
G3 X112.307 Y114.831 I-.462 J.627 E.01382
G1 X112.147 Y115.521 E.01236
G1 X111.685 Y116.21 E.0145
G1 X110.772 Y116.9 E.01997
G2 X110.458 Y117.59 I.462 J.627 E.01382
G1 X110.618 Y118.279 E.01236
G1 X111.08 Y118.969 E.0145
G1 X111.992 Y119.659 E.01997
G3 X112.307 Y120.349 I-.462 J.627 E.01382
G1 X112.147 Y121.038 E.01236
G1 X111.685 Y121.728 E.0145
G1 X110.772 Y122.418 E.01997
G2 X110.458 Y123.107 I.462 J.627 E.01382
G2 X110.862 Y124.162 I1.589 J-.004 E.02016
G1 X113.292 Y124.162 E.04242
G1 X113.377 Y123.797 E.00654
G1 X113.839 Y123.107 E.0145
G1 X114.751 Y122.418 E.01997
G2 X115.065 Y121.728 I-.462 J-.627 E.01382
G1 X114.906 Y121.038 E.01236
G1 X114.444 Y120.349 E.0145
G1 X113.531 Y119.659 E.01997
G3 X113.217 Y118.969 I.462 J-.627 E.01382
G1 X113.377 Y118.279 E.01236
G1 X113.839 Y117.59 E.0145
G1 X114.751 Y116.9 E.01997
G2 X115.065 Y116.21 I-.462 J-.627 E.01382
G1 X114.906 Y115.521 E.01236
G1 X114.444 Y114.831 E.0145
G1 X113.531 Y114.141 E.01997
G3 X113.217 Y113.452 I.462 J-.627 E.01382
G1 X113.377 Y112.762 E.01236
G1 X113.839 Y112.072 E.0145
G1 X114.751 Y111.382 E.01997
G2 X115.065 Y110.693 I-.462 J-.627 E.01382
G2 X114.662 Y109.639 I-1.588 J.004 E.02015
G1 X117.749 Y109.639 E.0539
G1 X117.665 Y110.003 E.00652
G1 X117.203 Y110.693 E.0145
G1 X116.29 Y111.382 E.01997
G2 X115.976 Y112.072 I.462 J.627 E.01382
G1 X116.135 Y112.762 E.01236
G1 X116.598 Y113.452 E.0145
G1 X117.51 Y114.141 E.01997
G3 X117.824 Y114.831 I-.462 J.627 E.01382
G1 X117.665 Y115.521 E.01236
G1 X117.203 Y116.21 E.0145
G1 X116.29 Y116.9 E.01997
G2 X115.976 Y117.59 I.462 J.627 E.01382
G1 X116.135 Y118.279 E.01236
G1 X116.598 Y118.969 E.0145
G1 X117.51 Y119.659 E.01997
G3 X117.824 Y120.349 I-.462 J.627 E.01382
G1 X117.665 Y121.038 E.01236
G1 X117.203 Y121.728 E.0145
G1 X116.29 Y122.418 E.01997
G2 X115.976 Y123.107 I.462 J.627 E.01382
G2 X116.38 Y124.162 I1.59 J-.004 E.02017
G1 X118.81 Y124.163 E.04242
G1 X118.894 Y123.797 E.00655
G1 X119.356 Y123.107 E.0145
G1 X120.269 Y122.418 E.01997
G2 X120.583 Y121.728 I-.462 J-.627 E.01382
G1 X120.424 Y121.038 E.01236
G1 X119.961 Y120.349 E.0145
G1 X119.049 Y119.659 E.01997
G3 X118.735 Y118.969 I.462 J-.627 E.01382
G1 X118.894 Y118.279 E.01236
G1 X119.356 Y117.59 E.0145
G1 X120.269 Y116.9 E.01997
G2 X120.583 Y116.21 I-.462 J-.627 E.01382
G1 X120.424 Y115.521 E.01236
G1 X119.961 Y114.831 E.0145
G1 X119.049 Y114.141 E.01997
G3 X118.735 Y113.452 I.462 J-.627 E.01382
G1 X118.894 Y112.762 E.01236
G1 X119.356 Y112.072 E.0145
G1 X120.269 Y111.382 E.01997
G2 X120.583 Y110.693 I-.462 J-.627 E.01382
G2 X120.18 Y109.64 I-1.586 J.003 E.02013
G1 X123.266 Y109.64 E.05389
G1 X123.182 Y110.003 E.0065
G1 X122.72 Y110.693 E.0145
G1 X121.808 Y111.382 E.01997
G2 X121.494 Y112.072 I.462 J.627 E.01382
G1 X121.653 Y112.762 E.01236
G1 X122.115 Y113.452 E.0145
G1 X123.028 Y114.141 E.01997
G3 X123.342 Y114.831 I-.462 J.627 E.01382
G1 X123.182 Y115.521 E.01236
G1 X122.72 Y116.21 E.0145
G1 X121.808 Y116.9 E.01997
G2 X121.494 Y117.59 I.462 J.627 E.01382
G1 X121.653 Y118.279 E.01236
G1 X122.115 Y118.969 E.0145
G1 X123.028 Y119.659 E.01997
G3 X123.342 Y120.349 I-.462 J.627 E.01382
G1 X123.182 Y121.038 E.01236
G1 X122.72 Y121.728 E.0145
G1 X121.808 Y122.418 E.01997
G2 X121.494 Y123.107 I.462 J.627 E.01382
G2 X121.898 Y124.163 I1.59 J-.004 E.02017
G1 X123.612 Y124.163 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X121.898 Y124.163 E-.65138
G1 X121.739 Y123.925 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 6/83
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S186.15
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I.074 J1.215 P1  F42000
G1 X149.102 Y122.26 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1 F42000
G1 X130.052 Y125.948 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.73 Y126.258 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.982 I.277 J-.265 E.00532
G1 X129.624 Y104.012 E.38359
G3 X130.018 Y103.624 I.384 J-.005 E.01081
G1 X151.994 Y103.624 E.3837
G3 X152.376 Y103.992 I0 J.382 E.01023
G1 X152.376 Y125.988 E.38406
G3 X151.988 Y126.377 I-.386 J.003 E.01069
G1 X130.012 Y126.377 E.38369
G3 X129.775 Y126.298 I-.006 J-.383 E.00445
M204 S250
G1 X129.486 Y126.594 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.424 Y126.535 E.00139
G3 X129.21 Y125.994 I.586 J-.545 E.00967
G1 X129.21 Y104.004 E.35707
G3 X130.006 Y103.21 I.802 J.008 E.02024
G1 X152.008 Y103.21 E.35726
G3 X152.789 Y103.971 I-.017 J.8 E.01949
G1 X152.79 Y125.996 E.35764
G3 X151.996 Y126.79 I-.805 J-.01 E.02018
G1 X130.004 Y126.79 E.3571
G3 X129.54 Y126.637 I.006 J-.8 E.00807
G1 X129.533 Y126.632 E.00014
; WIPE_START
M204 S6000
G1 X129.424 Y126.535 E-.0552
G1 X129.27 Y126.3 E-.1068
G1 X129.225 Y126.152 E-.05883
G1 X129.21 Y125.994 E-.06044
G1 X129.21 Y124.734 E-.47874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 6 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer6 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X130.466 Y125.534 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y104.466 E.3421
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.474 E.34113
; WIPE_START
G1 X130.466 Y123.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.25 Y118.495 Z1 F42000
G1 X151.135 Y105.682 Z1
G1 Z.6
G1 E.8 F1800
G1 F12000
M204 S6000
G1 X151.135 Y104.864 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32917
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.31491
M204 S10000
G1 X150.737 Y105.682 F42000
; LINE_WIDTH: 0.43192
G1 F12000
M204 S6000
G1 X150.737 Y105.263 E.00701
G2 X149.316 Y105.269 I-.212 J109.625 E.02375
G1 X132.684 Y105.269 E.27816
G2 X131.263 Y105.263 I-1.211 J108.615 E.02377
G2 X131.269 Y106.684 I108.784 J.21 E.02377
G1 X131.269 Y123.316 E.27816
G2 X131.263 Y124.737 I108.946 J1.211 E.02377
G2 X132.684 Y124.731 I.21 J-108.953 E.02377
G1 X149.316 Y124.731 E.27816
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.736 Y105.742 E.2939
M204 S10000
G1 X149.316 Y123.516 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.484 Y123.316 E.00248
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.372 Y123.493 E.0015
M204 S10000
G1 X149.42 Y123.905 F42000
G1 F12000
M204 S6000
G1 X132.684 Y123.914 E.27175
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.086 Y123.316 E.00168
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.473 Y123.877 E.00487
; WIPE_START
G1 X149.739 Y123.739 E-.114
G1 X149.905 Y123.42 E-.13683
G1 X149.914 Y123.316 E-.03939
G1 X149.914 Y122.08 E-.46979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.083 Y117.156 Z1 F42000
G1 X131.681 Y106.684 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.432716
G1 F12000
M204 S6000
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.2787
G1 X150.021 Y105.979 E.01282
G1 X150.319 Y106.684 E.01282
G1 X150.319 Y123.316 E.2787
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.2787
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.744 E.27769
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46238
G1 F12000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
G1 F12000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F12000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46178
G1 F12000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
; OBJECT_ID: 83
; WIPE_START
G1 X150.29 Y105.73 E-.17686
G1 X150.262 Y105.682 E-.19439
G1 X150.29 Y105.635 E-.19439
G1 X150.345 Y105.635 E-.19437
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X150.113 Y113.264 Z1 F42000
G1 X149.052 Y148.21 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1 F42000
G1 X130.052 Y151.948 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.73 Y152.258 F42000
G1 F6000
M204 S6000
M73 P39 R18
G3 X129.624 Y151.982 I.277 J-.265 E.00532
G1 X129.624 Y130.012 E.38359
G3 X130.018 Y129.624 I.384 J-.005 E.01081
G1 X151.994 Y129.624 E.3837
G3 X152.376 Y129.992 I0 J.382 E.01023
G1 X152.376 Y151.988 E.38406
G3 X151.988 Y152.376 I-.386 J.003 E.01069
G1 X130.012 Y152.376 E.38369
G3 X129.775 Y152.298 I-.006 J-.383 E.00445
M204 S250
G1 X129.486 Y152.594 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.424 Y152.535 E.00139
G3 X129.21 Y151.994 I.586 J-.545 E.00967
G1 X129.21 Y130.004 E.35707
G3 X130.006 Y129.21 I.802 J.008 E.02024
G1 X152.008 Y129.21 E.35726
G3 X152.789 Y129.971 I-.017 J.8 E.01949
G1 X152.79 Y151.996 E.35764
G3 X151.996 Y152.79 I-.805 J-.01 E.02018
G1 X130.004 Y152.79 E.3571
G3 X129.54 Y152.637 I.006 J-.8 E.00807
G1 X129.533 Y152.632 E.00014
; WIPE_START
M204 S6000
G1 X129.424 Y152.535 E-.0552
G1 X129.27 Y152.3 E-.1068
G1 X129.225 Y152.152 E-.05883
G1 X129.21 Y151.994 E-.06044
G1 X129.21 Y150.734 E-.47874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.466 Y151.534 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y130.466 E.3421
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.474 E.34113
; WIPE_START
G1 X130.466 Y149.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.254 Y144.5 Z1 F42000
G1 X151.135 Y131.712 Z1
G1 Z.6
G1 E.8 F1800
G1 F12000
M204 S6000
G1 X151.135 Y130.864 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32917
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.737 Y131.712 F42000
; LINE_WIDTH: 0.454524
G1 F12000
M204 S6000
G1 X150.737 Y131.263 E.00792
G2 X149.266 Y131.282 I-.225 J39.552 E.02595
G1 X132.734 Y131.282 E.29171
G2 X131.263 Y131.263 I-1.247 J39.519 E.02596
G2 X131.282 Y132.734 I39.489 J.225 E.02596
G1 X131.282 Y149.266 E.29171
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29171
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02597
G1 X150.718 Y132.734 E.29171
G1 X150.736 Y131.772 E.01698
M204 S10000
G1 X149.266 Y132.534 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.534 Y149.266 E.00248
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.206 Y132.534 E.26748
M204 S10000
G1 X149.37 Y149.855 F42000
G1 F12000
M204 S6000
G1 X132.734 Y149.864 E.27013
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.136 Y149.266 E.00168
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.423 Y149.827 E.00487
; WIPE_START
G1 X149.689 Y149.689 E-.114
G1 X149.855 Y149.37 E-.13683
G1 X149.864 Y149.266 E-.03939
G1 X149.864 Y148.03 E-.46979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.028 Y143.111 Z1 F42000
G1 X131.718 Y132.734 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.456764
G1 F12000
M204 S6000
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01365
G1 X150.282 Y132.734 E.01366
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.794 E.29216
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52096
G1 F12000
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
G1 F12000
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F12000
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52038
G1 F12000
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00489
; OBJECT_ID: 105
; WIPE_START
G1 X150.257 Y131.766 E-.19275
G1 X150.226 Y131.712 E-.18909
G1 X150.257 Y131.658 E-.18909
G1 X150.319 Y131.658 E-.18907
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X143.812 Y135.646 Z1 F42000
G1 X123.152 Y148.31 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1 F42000
G1 X104.052 Y151.948 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.73 Y152.258 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.982 I.277 J-.265 E.00532
G1 X103.624 Y130.012 E.38359
G3 X104.018 Y129.624 I.384 J-.005 E.01081
G1 X125.994 Y129.624 E.3837
G3 X126.376 Y129.992 I0 J.382 E.01023
G1 X126.377 Y151.988 E.38406
G3 X125.988 Y152.376 I-.386 J.003 E.01069
G1 X104.012 Y152.376 E.38369
G3 X103.775 Y152.298 I-.006 J-.383 E.00445
M204 S250
G1 X103.486 Y152.594 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.424 Y152.535 E.00139
G3 X103.21 Y151.994 I.586 J-.545 E.00967
G1 X103.21 Y130.004 E.35707
G3 X104.006 Y129.21 I.802 J.008 E.02024
G1 X126.008 Y129.21 E.35726
G3 X126.789 Y129.971 I-.017 J.8 E.01949
G1 X126.79 Y151.996 E.35764
G3 X125.996 Y152.79 I-.805 J-.01 E.02018
G1 X104.004 Y152.79 E.3571
G3 X103.54 Y152.637 I.006 J-.8 E.00807
G1 X103.533 Y152.632 E.00014
; WIPE_START
M204 S6000
G1 X103.424 Y152.535 E-.0552
G1 X103.27 Y152.3 E-.1068
G1 X103.225 Y152.152 E-.05883
G1 X103.21 Y151.994 E-.06044
G1 X103.21 Y150.734 E-.47874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.466 Y151.534 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y130.466 E.3421
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.474 E.34113
; WIPE_START
G1 X104.466 Y149.474 E-.76
; WIPE_END
M73 P39 R17
G1 E-.04 F1800
M204 S10000
G1 X110.246 Y144.49 Z1 F42000
G1 X125.135 Y131.653 Z1
G1 Z.6
G1 E.8 F1800
G1 F12000
M204 S6000
G1 X125.135 Y130.864 E.01281
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32917
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.737 Y131.653 F42000
; LINE_WIDTH: 0.409033
G1 F12000
M204 S6000
G1 X124.737 Y131.263 E.00616
G1 X106.634 Y131.257 E.28587
G3 X105.263 Y131.263 I-1.176 J-112.975 E.02165
G1 X105.257 Y149.366 E.28588
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28588
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.737 Y131.713 E.27877
M204 S10000
G1 X123.366 Y149.566 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.434 Y149.366 E.00248
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.422 Y149.543 E.0015
M204 S10000
G1 X123.47 Y149.955 F42000
G1 F12000
M204 S6000
G1 X106.634 Y149.964 E.27338
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.036 Y149.366 E.00168
M73 P40 R17
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.523 Y149.927 E.00487
; WIPE_START
G1 X123.789 Y149.789 E-.114
G1 X123.955 Y149.47 E-.13683
G1 X123.964 Y149.366 E-.03939
G1 X123.964 Y148.13 E-.46979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.137 Y143.201 Z1 F42000
G1 X105.643 Y132.634 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.408646
G1 F12000
M204 S6000
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26396
G1 X124.071 Y131.929 E.01199
G1 X124.357 Y132.634 E.012
G1 X124.357 Y149.366 E.26396
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26396
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.694 E.26302
M204 S10000
G1 X105.701 Y131.653 F42000
; LINE_WIDTH: 0.4038
G1 F12000
M204 S6000
G1 X105.677 Y131.694 E.00074
G1 X105.605 Y131.653 E.00129
G1 X105.625 Y131.642 E.00035
M204 S10000
G1 X105.701 Y150.347 F42000
G1 F12000
M204 S6000
G1 X105.677 Y150.388 E.00074
G1 X105.605 Y150.347 E.00129
G1 X105.625 Y150.336 E.00035
M204 S10000
G1 X124.395 Y150.347 F42000
; LINE_WIDTH: 0.40378
G1 F12000
M204 S6000
G1 X124.371 Y150.388 E.00074
G1 X124.299 Y150.347 E.00129
G1 X124.319 Y150.336 E.00035
M204 S10000
G1 X124.394 Y131.653 F42000
; LINE_WIDTH: 0.40322
G1 F12000
M204 S6000
G1 X124.37 Y131.694 E.00074
G1 X124.299 Y131.653 E.00129
G1 X124.318 Y131.642 E.00035
; OBJECT_ID: 116
; WIPE_START
G1 X124.299 Y131.653 E-.11246
G1 X124.37 Y131.694 E-.41052
G1 X124.394 Y131.653 E-.23702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X124.327 Y124.021 Z1 F42000
G1 X124.197 Y109.256 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.547 Y109.658 I-.045 J.393 E.01023
G1 X124.546 Y124.165 E.25329
G3 X124.133 Y124.547 I-.392 J-.009 E.01097
G1 X109.635 Y124.546 E.25314
G3 X109.253 Y124.133 I.009 J-.392 E.01097
G1 X109.254 Y109.635 E.25315
G3 X109.635 Y109.254 I.393 J.011 E.01038
G1 X124.137 Y109.256 E.2532
M204 S10000
G1 X124.245 Y108.83 F42000
G1 F6000
M204 S6000
G1 X124.4 Y108.863 E.00277
G3 X124.976 Y109.651 I-.253 J.789 E.01821
G1 X124.975 Y124.182 E.25372
G3 X124.144 Y124.976 I-.819 J-.026 E.02223
G1 X109.618 Y124.975 E.25364
G3 X108.824 Y124.144 I.026 J-.819 E.02223
G1 X108.825 Y109.617 E.25364
G3 X109.618 Y108.825 I.826 J.034 E.0215
G1 X124.185 Y108.829 E.25436
M204 S250
G1 X124.326 Y108.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.517 Y108.467 E.00317
G3 X125.389 Y109.644 I-.375 J1.19 E.02543
G1 X125.389 Y124.199 E.23635
G3 X124.154 Y125.389 I-1.233 J-.044 E.03078
G1 X109.601 Y125.389 E.23632
G3 X108.411 Y124.154 I.044 J-1.233 E.03078
G1 X108.411 Y109.6 E.23633
G3 X109.601 Y108.411 I1.245 J.056 E.02997
G1 X124.267 Y108.417 E.23815
; WIPE_START
M204 S6000
G1 X124.517 Y108.467 E-.09694
G1 X124.704 Y108.538 E-.07597
G1 X124.909 Y108.666 E-.09172
G1 X125.084 Y108.83 E-.09143
G1 X125.203 Y108.99 E-.07546
G1 X125.31 Y109.207 E-.09197
G1 X125.373 Y109.44 E-.09199
G1 X125.389 Y109.644 E-.07766
G1 X125.389 Y109.82 E-.06687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.181 Y111.573 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.181 Y113.287 E.02993
G2 X124.181 Y113.904 I.958 J.308 E.01094
G1 X124.18 Y118.806 E.0856
G2 X124.18 Y119.421 I.959 J.307 E.0109
G1 X124.173 Y124.163 E.0828
G3 X124.105 Y124.181 I-.053 J-.064 E.00127
G1 X121.916 Y124.181 E.03821
G3 X121.365 Y122.763 I1.825 J-1.525 E.02704
G1 X121.582 Y122.418 E.00712
G1 X122.681 Y121.728 E.02265
G2 X123.47 Y120.004 I-1.824 J-1.878 E.03388
G1 X123.253 Y119.659 E.00712
G1 X122.154 Y118.969 E.02265
G3 X121.365 Y117.245 I1.824 J-1.878 E.03388
G1 X121.582 Y116.9 E.00712
G1 X122.681 Y116.21 E.02265
G2 X123.47 Y114.486 I-1.824 J-1.878 E.03388
G1 X123.253 Y114.141 E.00712
G1 X122.154 Y113.452 E.02265
G3 X121.365 Y111.727 I1.824 J-1.878 E.03388
G1 X121.582 Y111.382 E.00712
G1 X122.681 Y110.693 E.02265
G1 X123.218 Y110.003 E.01526
G1 X123.348 Y109.622 E.00703
G1 X120.162 Y109.622 E.05562
G3 X120.711 Y111.038 I-1.826 J1.523 E.02699
G1 X120.494 Y111.382 E.00712
G1 X119.395 Y112.072 E.02265
G2 X118.606 Y113.796 I1.824 J1.878 E.03388
G1 X118.824 Y114.141 E.00712
G1 X119.922 Y114.831 E.02265
G3 X120.711 Y116.555 I-1.824 J1.878 E.03388
G1 X120.494 Y116.9 E.00712
G1 X119.395 Y117.59 E.02265
G2 X118.606 Y119.314 I1.824 J1.878 E.03388
G1 X118.824 Y119.659 E.00712
G1 X119.922 Y120.349 E.02265
G3 X120.711 Y122.073 I-1.824 J1.878 E.03388
G1 X120.494 Y122.418 E.00712
G1 X119.395 Y123.107 E.02265
G1 X118.859 Y123.797 E.01526
G1 X118.728 Y124.181 E.00707
G1 X116.398 Y124.18 E.04068
G3 X115.848 Y122.763 I1.825 J-1.525 E.02703
G1 X116.065 Y122.418 E.00712
G1 X117.163 Y121.728 E.02265
G2 X117.953 Y120.004 I-1.824 J-1.878 E.03388
G1 X117.735 Y119.659 E.00712
G1 X116.637 Y118.969 E.02265
G3 X115.848 Y117.245 I1.824 J-1.878 E.03388
G1 X116.065 Y116.9 E.00712
G1 X117.163 Y116.21 E.02265
G2 X117.953 Y114.486 I-1.824 J-1.878 E.03388
G1 X117.735 Y114.141 E.00712
G1 X116.637 Y113.452 E.02265
G3 X115.848 Y111.727 I1.824 J-1.878 E.03388
G1 X116.065 Y111.382 E.00712
G1 X117.163 Y110.693 E.02265
G1 X117.7 Y110.003 E.01526
G1 X117.83 Y109.621 E.00704
G1 X114.644 Y109.621 E.05563
G3 X115.194 Y111.038 I-1.825 J1.524 E.02701
G1 X114.976 Y111.382 E.00712
G1 X113.878 Y112.072 E.02265
G2 X113.089 Y113.796 I1.824 J1.878 E.03388
G1 X113.306 Y114.141 E.00712
G1 X114.405 Y114.831 E.02265
G3 X115.194 Y116.555 I-1.824 J1.878 E.03388
G1 X114.976 Y116.9 E.00712
G1 X113.878 Y117.59 E.02265
G2 X113.089 Y119.314 I1.824 J1.878 E.03388
G1 X113.306 Y119.659 E.00712
G1 X114.405 Y120.349 E.02265
G3 X115.194 Y122.073 I-1.824 J1.878 E.03388
G1 X114.976 Y122.418 E.00712
G1 X113.878 Y123.107 E.02265
G1 X113.341 Y123.797 E.01526
G1 X113.211 Y124.18 E.00707
G1 X110.88 Y124.18 E.04069
G3 X110.33 Y122.763 I1.825 J-1.524 E.02703
G1 X110.547 Y122.418 E.00712
G1 X111.646 Y121.728 E.02265
G2 X112.435 Y120.004 I-1.824 J-1.878 E.03388
G1 X112.218 Y119.659 E.00712
G1 X111.119 Y118.969 E.02265
G3 X110.33 Y117.245 I1.824 J-1.878 E.03388
G1 X110.547 Y116.9 E.00712
G1 X111.646 Y116.21 E.02265
G2 X112.435 Y114.486 I-1.824 J-1.878 E.03388
G1 X112.218 Y114.141 E.00712
G1 X111.119 Y113.452 E.02265
G3 X110.33 Y111.727 I1.824 J-1.878 E.03388
G1 X110.547 Y111.382 E.00712
G1 X111.646 Y110.693 E.02265
G1 X112.183 Y110.003 E.01526
G1 X112.313 Y109.62 E.00706
G1 X109.676 Y109.62 E.04604
G2 X109.62 Y109.673 I-.013 J.043 E.00163
G1 X109.62 Y110.579 E.01582
G3 X109.62 Y111.127 I-.765 J.274 E.00975
G1 X109.62 Y116.096 E.08676
G3 X109.62 Y116.645 I-.763 J.275 E.00978
G1 X109.619 Y121.612 E.08673
G3 X109.619 Y123.877 I-16.336 J1.131 E.03958
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.619 Y122.163 E-.65138
G1 X109.676 Y122.073 E-.04058
G1 X109.654 Y121.895 E-.06804
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 7/83
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S188.7
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.011 J1.217 P1  F42000
G1 X149.102 Y122.26 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.1 F42000
G1 X130.052 Y125.948 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.751 Y126.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.256 J-.285 E.00572
G1 X129.624 Y104.012 E.38369
G3 X130.012 Y103.624 I.383 J-.006 E.01071
G1 X151.996 Y103.624 E.38385
G3 X152.376 Y103.985 I-.002 J.382 E.01008
G1 X152.376 Y125.988 E.38417
G3 X151.988 Y126.377 I-.383 J.006 E.01071
G1 X130.012 Y126.377 E.38369
G3 X129.798 Y126.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.489 Y126.599 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y126.579 E.00047
G3 X129.21 Y125.996 I.542 J-.588 E.01064
G1 X129.21 Y104.004 E.3571
G3 X130.004 Y103.21 I.8 J.006 E.02022
G1 X152.01 Y103.21 E.35733
G3 X152.789 Y103.969 I-.02 J.8 E.01942
G1 X152.79 Y125.996 E.35767
G3 X151.996 Y126.79 I-.8 J-.006 E.02022
G1 X130.004 Y126.79 E.3571
G3 X129.591 Y126.672 I.006 J-.8 E.00707
G1 X129.537 Y126.634 E.00107
; WIPE_START
M204 S6000
G1 X129.468 Y126.579 E-.03367
G1 X129.362 Y126.466 E-.05872
G1 X129.284 Y126.332 E-.05889
G1 X129.226 Y126.154 E-.07127
G1 X129.21 Y125.996 E-.06037
G1 X129.21 Y124.74 E-.47708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 7 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer7 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32138
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.864 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32917
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46176
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432718
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.2787
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.2787
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.2787
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.2787
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431912
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.517 J-1.206 E.02376
G2 X149.316 Y105.269 I-.212 J109.965 E.02375
G1 X132.684 Y105.269 E.27815
G2 X131.263 Y105.263 I-1.214 J109.18 E.02376
G2 X131.269 Y106.684 I108.784 J.21 E.02376
G1 X131.269 Y123.316 E.27815
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27815
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27715
M204 S10000
M73 P41 R17
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.1 F42000
G1 X149.052 Y148.21 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.1 F42000
G1 X130.052 Y151.948 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.256 J-.285 E.00572
G1 X129.624 Y130.012 E.38369
G3 X130.012 Y129.624 I.383 J-.006 E.01071
G1 X151.996 Y129.624 E.38385
G3 X152.376 Y129.985 I-.002 J.382 E.01008
G1 X152.376 Y151.988 E.38417
G3 X151.988 Y152.376 I-.383 J.006 E.01071
G1 X130.012 Y152.376 E.38369
G3 X129.798 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.489 Y152.599 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y152.579 E.00047
G3 X129.21 Y151.996 I.542 J-.588 E.01064
G1 X129.21 Y130.004 E.3571
G3 X130.004 Y129.21 I.8 J.006 E.02022
G1 X152.01 Y129.21 E.35733
G3 X152.789 Y129.969 I-.02 J.8 E.01942
G1 X152.79 Y151.996 E.35767
G3 X151.996 Y152.79 I-.8 J-.006 E.02022
G1 X130.004 Y152.79 E.3571
G3 X129.591 Y152.672 I.006 J-.8 E.00707
G1 X129.537 Y152.633 E.00107
; WIPE_START
M204 S6000
G1 X129.468 Y152.579 E-.03367
G1 X129.362 Y152.466 E-.05872
G1 X129.284 Y152.332 E-.05889
G1 X129.226 Y152.154 E-.07127
G1 X129.21 Y151.996 E-.06037
G1 X129.21 Y150.74 E-.47708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.019 Y145.789 Z1.1 F42000
G1 X151.534 Y131.712 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.864 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32917
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52036
G1 F14431.75
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00489
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456778
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29323
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29323
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29323
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29323
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.0126
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454507
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.784 J-1.245 E.02595
G2 X149.266 Y131.282 I-.225 J39.594 E.02595
G1 X132.734 Y131.282 E.2917
G2 X131.263 Y131.263 I-1.247 J39.498 E.02596
G2 X131.282 Y132.734 I39.489 J.225 E.02596
G1 X131.282 Y149.266 E.2917
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.2917
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29064
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.1 F42000
G1 X123.152 Y148.31 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.1 F42000
G1 X104.052 Y151.948 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.256 J-.285 E.00572
G1 X103.624 Y130.012 E.38369
G3 X104.012 Y129.624 I.383 J-.006 E.01071
G1 X125.996 Y129.624 E.38385
G3 X126.376 Y129.985 I-.002 J.382 E.01008
G1 X126.377 Y151.988 E.38417
G3 X125.988 Y152.376 I-.383 J.006 E.01071
G1 X104.012 Y152.376 E.38369
G3 X103.798 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X103.489 Y152.599 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.468 Y152.579 E.00047
G3 X103.21 Y151.996 I.542 J-.588 E.01064
G1 X103.21 Y130.004 E.3571
G3 X104.004 Y129.21 I.8 J.006 E.02022
G1 X126.01 Y129.21 E.35733
G3 X126.789 Y129.969 I-.02 J.8 E.01942
G1 X126.79 Y151.996 E.35767
G3 X125.996 Y152.79 I-.8 J-.006 E.02022
G1 X104.004 Y152.79 E.3571
G3 X103.591 Y152.672 I.006 J-.8 E.00707
G1 X103.537 Y152.633 E.00107
; WIPE_START
M204 S6000
G1 X103.468 Y152.579 E-.03367
G1 X103.362 Y152.466 E-.05872
G1 X103.284 Y152.332 E-.05889
G1 X103.226 Y152.154 E-.07127
G1 X103.21 Y151.996 E-.06037
G1 X103.21 Y150.74 E-.47708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.011 Y145.78 Z1.1 F42000
G1 X125.534 Y131.653 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.864 E.01281
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32917
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40318
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00129
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408638
G1 F15000
M204 S6000
M73 P42 R17
G1 X124.357 Y149.366 E.26396
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26396
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26396
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26396
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409034
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.81 J-1.181 E.02165
G1 X106.634 Y131.257 E.28587
G3 X105.263 Y131.263 I-1.173 J-112.312 E.02165
G1 X105.257 Y149.366 E.28588
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28588
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26328
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.545 Y125.734 Z1.1 F42000
G1 X124.208 Y109.238 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.565 Y109.648 I-.046 J.4 E.01043
G1 X124.564 Y124.177 E.25367
G3 X124.144 Y124.565 I-.399 J-.01 E.01115
G1 X109.623 Y124.565 E.25354
G3 X109.235 Y124.144 I.01 J-.399 E.01115
G1 X109.236 Y109.623 E.25354
G3 X109.623 Y109.236 I.4 J.012 E.01055
G1 X124.148 Y109.238 E.25361
M204 S10000
G1 X124.251 Y108.811 F42000
G1 F6000
M204 S6000
G3 X124.994 Y109.641 I-.093 J.831 E.02129
G1 X124.993 Y124.194 E.25411
G3 X124.155 Y124.994 I-.827 J-.028 E.0224
G1 X109.606 Y124.993 E.25404
G3 X108.806 Y124.155 I.028 J-.827 E.0224
G1 X108.807 Y109.605 E.25404
G3 X109.606 Y108.807 I.834 J.036 E.02165
G1 X124.191 Y108.811 E.25466
M204 S250
G1 X124.333 Y108.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.53 Y108.449 E.00328
G3 X125.407 Y109.633 I-.377 J1.196 E.02558
G1 X125.407 Y124.212 E.23672
G3 X124.165 Y125.407 I-1.24 J-.045 E.03094
G1 X109.588 Y125.407 E.2367
G3 X108.393 Y124.165 I.045 J-1.24 E.03094
G1 X108.393 Y109.588 E.23671
G3 X109.589 Y108.393 I1.252 J.058 E.03011
G1 X124.274 Y108.399 E.23846
; WIPE_START
M204 S6000
G1 X124.53 Y108.449 E-.09935
G1 X124.718 Y108.521 E-.07642
G1 X124.925 Y108.649 E-.09234
G1 X125.101 Y108.815 E-.09196
G1 X125.22 Y108.975 E-.07583
G1 X125.327 Y109.192 E-.09211
G1 X125.391 Y109.428 E-.09256
G1 X125.407 Y109.633 E-.07845
G1 X125.407 Y109.794 E-.06098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.776 Y109.695 Z1.1 F42000
G1 X110.66 Y109.602 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X109.664 Y109.602 E.01738
G2 X109.602 Y109.662 I-.012 J.05 E.00179
G1 X109.602 Y110.28 E.0108
G3 X110.003 Y111.193 I-3.816 J2.221 E.01744
G2 X110.693 Y111.139 I.286 J-.769 E.01247
G2 X112.427 Y109.602 I-.685 J-2.52 E.04191
G1 X114.673 Y109.603 E.03922
G3 X115.521 Y111.193 I-4.014 J3.16 E.03163
G2 X116.21 Y111.139 I.286 J-.768 E.01247
G2 X117.944 Y109.603 I-.685 J-2.52 E.0419
G1 X120.192 Y109.604 E.03924
G3 X121.038 Y111.193 I-4.02 J3.161 E.03161
G2 X121.728 Y111.139 I.286 J-.768 E.01247
G2 X123.462 Y109.604 I-.685 J-2.52 E.04188
G1 X124.157 Y109.604 E.01214
G3 X124.199 Y109.679 I-.006 J.053 E.00175
G1 X124.199 Y113.038 E.05865
G2 X123.797 Y113.952 I3.819 J2.224 E.01746
G3 X123.107 Y113.897 I-.286 J-.768 E.01247
G3 X121.383 Y112.385 I.696 J-2.533 E.04144
G1 X121.038 Y111.572 E.01542
G2 X120.349 Y111.626 I-.286 J.768 E.01247
G2 X118.624 Y113.139 I.696 J2.533 E.04144
G1 X118.279 Y113.952 E.01542
G3 X117.59 Y113.897 I-.286 J-.768 E.01247
G3 X115.866 Y112.385 I.696 J-2.533 E.04144
G1 X115.521 Y111.572 E.01542
G2 X114.831 Y111.626 I-.286 J.768 E.01247
G2 X113.107 Y113.139 I.696 J2.533 E.04144
G1 X112.762 Y113.952 E.01542
G3 X112.072 Y113.897 I-.286 J-.768 E.01247
G3 X110.348 Y112.385 I.696 J-2.533 E.04144
G1 X110.003 Y111.572 E.01542
G2 X109.602 Y111.539 I-.236 J.415 E.00725
G1 X109.602 Y115.797 E.07435
G3 X110.003 Y116.711 I-3.818 J2.223 E.01746
G2 X110.693 Y116.656 I.286 J-.768 E.01247
G2 X112.417 Y115.144 I-.696 J-2.533 E.04144
G1 X112.762 Y114.331 E.01542
G3 X113.452 Y114.385 I.286 J.768 E.01247
G3 X115.176 Y115.897 I-.696 J2.533 E.04144
G1 X115.521 Y116.711 E.01542
G2 X116.21 Y116.656 I.286 J-.768 E.01247
G2 X117.935 Y115.144 I-.696 J-2.533 E.04144
G1 X118.279 Y114.331 E.01542
G3 X118.969 Y114.385 I.286 J.768 E.01247
G3 X120.693 Y115.897 I-.696 J2.533 E.04144
G1 X121.038 Y116.711 E.01542
G2 X121.728 Y116.656 I.286 J-.768 E.01247
G2 X123.452 Y115.144 I-.696 J-2.533 E.04144
G1 X123.797 Y114.331 E.01542
G3 X124.199 Y114.298 I.236 J.415 E.00726
G1 X124.198 Y118.556 E.07435
G2 X123.797 Y119.469 I3.817 J2.222 E.01745
G3 X123.107 Y119.415 I-.286 J-.769 E.01247
G3 X121.383 Y117.903 I.696 J-2.533 E.04144
G1 X121.038 Y117.09 E.01542
G2 X120.349 Y117.144 I-.286 J.768 E.01247
G2 X118.624 Y118.656 I.696 J2.533 E.04144
G1 X118.279 Y119.469 E.01542
G3 X117.59 Y119.415 I-.286 J-.768 E.01247
G3 X115.866 Y117.903 I.696 J-2.533 E.04144
G1 X115.521 Y117.09 E.01542
G2 X114.831 Y117.144 I-.286 J.768 E.01247
G2 X113.107 Y118.656 I.696 J2.533 E.04144
G1 X112.762 Y119.469 E.01542
G3 X112.072 Y119.415 I-.286 J-.768 E.01247
G3 X110.348 Y117.903 I.696 J-2.533 E.04144
G1 X110.003 Y117.09 E.01542
G2 X109.602 Y117.057 I-.236 J.415 E.00726
G1 X109.601 Y121.314 E.07433
G3 X110.003 Y122.228 I-3.82 J2.225 E.01747
G2 X110.693 Y122.174 I.286 J-.768 E.01247
G2 X112.417 Y120.662 I-.696 J-2.533 E.04144
G1 X112.762 Y119.848 E.01542
G3 X113.452 Y119.903 I.286 J.768 E.01247
G3 X115.176 Y121.415 I-.696 J2.533 E.04144
G1 X115.521 Y122.228 E.01542
G2 X116.21 Y122.174 I.286 J-.768 E.01247
G2 X117.935 Y120.662 I-.696 J-2.533 E.04144
G1 X118.279 Y119.848 E.01542
G3 X118.969 Y119.903 I.286 J.768 E.01247
G3 X120.693 Y121.415 I-.696 J2.533 E.04144
G1 X121.038 Y122.228 E.01542
G2 X121.728 Y122.174 I.286 J-.768 E.01247
G2 X123.452 Y120.662 I-.696 J-2.533 E.04144
G1 X123.797 Y119.848 E.01542
G3 X124.198 Y119.816 I.236 J.415 E.00726
G1 X124.189 Y124.179 E.07618
G3 X124.115 Y124.199 I-.058 J-.068 E.00138
G1 X121.938 Y124.199 E.03801
G1 X121.728 Y124.031 E.0047
G3 X121.038 Y122.607 I5.918 J-3.746 E.02768
G2 X120.349 Y122.662 I-.286 J.768 E.01247
G2 X118.624 Y124.174 I.696 J2.533 E.04144
G1 X116.42 Y124.198 E.03848
G1 X116.21 Y124.031 E.00469
G3 X115.521 Y122.607 I5.918 J-3.746 E.02768
G2 X114.831 Y122.662 I-.286 J.768 E.01247
G2 X113.107 Y124.174 I.696 J2.533 E.04144
G1 X110.902 Y124.198 E.03849
G1 X110.693 Y124.031 E.00468
G3 X110.003 Y122.607 I5.919 J-3.747 E.02768
G2 X109.601 Y122.575 I-.236 J.416 E.00727
G1 X109.601 Y124.115 E.0269
G2 X109.716 Y124.198 I.073 J.019 E.00317
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.621 Y124.189 E-.03601
G1 X109.601 Y124.115 E-.02901
G1 X109.601 Y122.575 E-.58544
G1 X109.889 Y122.598 E-.10954
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 8/83
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I.01 J1.217 P1  F42000
G1 X149.102 Y122.26 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.2 F42000
G1 X130.052 Y125.948 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.052 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.751 Y126.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.982 I.256 J-.285 E.00583
G1 X129.624 Y104.012 E.38359
G3 X130.018 Y103.624 I.383 J-.006 E.01082
G1 X151.999 Y103.624 E.38378
G1 X152.048 Y103.627 E.00087
G3 X152.376 Y103.989 I-.051 J.376 E.00926
G1 X152.376 Y125.988 E.3841
G3 X151.982 Y126.377 I-.383 J.006 E.01082
G1 X130.012 Y126.377 E.38359
G3 X129.798 Y126.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.48 Y126.592 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y126.578 E.0003
G3 X129.21 Y125.994 I.542 J-.588 E.01067
G1 X129.21 Y104.004 E.35707
G3 X130.006 Y103.21 I.8 J.006 E.02025
G1 X152.013 Y103.21 E.35734
G3 X152.789 Y103.97 I-.027 J.805 E.01937
G1 X152.79 Y125.996 E.35765
G3 X151.994 Y126.79 I-.8 J-.006 E.02025
G1 X130.004 Y126.79 E.35707
G3 X129.591 Y126.672 I.006 J-.8 E.00706
G1 X129.529 Y126.627 E.00124
; WIPE_START
M204 S6000
G1 X129.468 Y126.578 E-.02969
G1 X129.362 Y126.466 E-.05867
G1 X129.27 Y126.3 E-.07207
G1 X129.225 Y126.152 E-.05888
G1 X129.21 Y125.994 E-.06038
G1 X129.21 Y124.73 E-.48031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 8 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer8 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32138
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.864 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46174
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432714
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.2787
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.2787
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.2787
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.2787
M73 P43 R17
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431908
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.511 J-1.206 E.02376
G2 X149.316 Y105.269 I-.212 J110.136 E.02375
G1 X132.684 Y105.269 E.27815
G2 X131.263 Y105.263 I-1.211 J108.614 E.02376
G2 X131.269 Y106.684 I108.948 J.21 E.02376
G1 X131.269 Y123.316 E.27815
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27815
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27715
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
M73 P43 R16
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.2 F42000
G1 X149.052 Y148.21 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.2 F42000
G1 X130.052 Y151.948 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.982 I.256 J-.285 E.00583
G1 X129.624 Y130.012 E.38359
G3 X130.018 Y129.624 I.383 J-.006 E.01082
G1 X151.999 Y129.624 E.38378
G1 X152.048 Y129.627 E.00087
G3 X152.376 Y129.989 I-.051 J.376 E.00926
G1 X152.376 Y151.988 E.3841
G3 X151.982 Y152.376 I-.383 J.006 E.01082
G1 X130.012 Y152.376 E.38359
G3 X129.798 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X129.48 Y152.592 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.468 Y152.578 E.0003
G3 X129.21 Y151.994 I.542 J-.588 E.01067
G1 X129.21 Y130.004 E.35707
G3 X130.006 Y129.21 I.8 J.006 E.02025
G1 X152.013 Y129.21 E.35734
G3 X152.789 Y129.97 I-.027 J.805 E.01937
G1 X152.79 Y151.996 E.35765
G3 X151.994 Y152.79 I-.8 J-.006 E.02025
G1 X130.004 Y152.79 E.35707
G3 X129.591 Y152.672 I.006 J-.8 E.00706
G1 X129.529 Y152.627 E.00124
; WIPE_START
M204 S6000
G1 X129.468 Y152.578 E-.02969
G1 X129.362 Y152.466 E-.05867
G1 X129.27 Y152.3 E-.07207
G1 X129.225 Y152.152 E-.05888
G1 X129.21 Y151.994 E-.06038
G1 X129.21 Y150.73 E-.48031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.02 Y145.78 Z1.2 F42000
G1 X151.534 Y131.712 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.864 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52034
G1 F14432.327
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00489
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456773
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29323
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29323
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29323
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29323
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.0126
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454503
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.781 J-1.245 E.02595
G2 X149.266 Y131.282 I-.224 J39.684 E.02595
G1 X132.734 Y131.282 E.2917
G2 X131.263 Y131.263 I-1.247 J39.45 E.02596
G2 X131.282 Y132.734 I39.509 J.225 E.02596
G1 X131.282 Y149.266 E.2917
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.2917
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29064
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52094
G1 F14414.992
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.2 F42000
G1 X123.152 Y148.31 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.2 F42000
G1 X104.052 Y151.948 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.751 Y152.279 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.982 I.256 J-.285 E.00583
G1 X103.624 Y130.012 E.38359
G3 X104.018 Y129.624 I.383 J-.006 E.01082
G1 X125.999 Y129.624 E.38378
G1 X126.048 Y129.627 E.00087
G3 X126.376 Y129.989 I-.051 J.376 E.00926
G1 X126.377 Y151.988 E.3841
G3 X125.982 Y152.376 I-.383 J.006 E.01082
G1 X104.012 Y152.376 E.38359
G3 X103.798 Y152.315 I-.006 J-.383 E.00394
M204 S250
G1 X103.48 Y152.592 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.468 Y152.578 E.0003
G3 X103.21 Y151.994 I.542 J-.588 E.01067
G1 X103.21 Y130.004 E.35707
G3 X104.006 Y129.21 I.8 J.006 E.02025
G1 X126.013 Y129.21 E.35734
G3 X126.789 Y129.97 I-.027 J.805 E.01937
G1 X126.79 Y151.996 E.35765
G3 X125.994 Y152.79 I-.8 J-.006 E.02025
G1 X104.004 Y152.79 E.35707
G3 X103.591 Y152.672 I.006 J-.8 E.00706
G1 X103.529 Y152.627 E.00124
; WIPE_START
M204 S6000
G1 X103.468 Y152.578 E-.02969
G1 X103.362 Y152.466 E-.05867
G1 X103.27 Y152.3 E-.07207
G1 X103.225 Y152.152 E-.05888
G1 X103.21 Y151.994 E-.06038
G1 X103.21 Y150.73 E-.48031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.012 Y145.771 Z1.2 F42000
G1 X125.534 Y131.653 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
M73 P44 R16
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.864 E.01281
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40316
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00129
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408634
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26396
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26396
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26396
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26396
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409031
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.803 J-1.181 E.02164
G1 X106.634 Y131.257 E.28587
G3 X105.263 Y131.263 I-1.176 J-112.975 E.02165
G1 X105.257 Y149.366 E.28588
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28588
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26328
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.545 Y125.733 Z1.2 F42000
G1 X124.22 Y109.22 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.584 Y109.638 I-.046 J.408 E.01062
G1 X124.582 Y124.189 E.25407
G3 X124.155 Y124.584 I-.406 J-.011 E.01132
G1 X109.611 Y124.583 E.25394
G3 X109.216 Y124.155 I.011 J-.406 E.01132
G1 X109.218 Y109.611 E.25394
G3 X109.611 Y109.218 I.408 J.014 E.0107
G1 X124.16 Y109.22 E.25402
M204 S10000
G1 X124.262 Y108.793 F42000
G1 F6000
M204 S6000
G3 X125.012 Y109.63 I-.094 J.838 E.02148
G1 X125.011 Y124.207 E.25451
G3 X124.166 Y125.012 I-.834 J-.029 E.02258
G1 X109.593 Y125.011 E.25444
G3 X108.788 Y124.166 I.029 J-.834 E.02258
G1 X108.789 Y109.593 E.25444
G3 X109.594 Y108.789 I.837 J.033 E.02183
G1 X124.202 Y108.793 E.25507
M204 S250
G1 X124.34 Y108.388 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.544 Y108.432 E.00339
G3 X125.426 Y109.622 I-.38 J1.203 E.02571
G1 X125.425 Y124.224 E.2371
G3 X124.176 Y125.426 I-1.248 J-.047 E.0311
G1 X109.576 Y125.425 E.23707
G3 X108.374 Y124.176 I.047 J-1.248 E.0311
G1 X108.375 Y109.576 E.23708
G3 X109.576 Y108.375 I1.254 J.054 E.03028
G1 X124.281 Y108.381 E.23877
; WIPE_START
M204 S6000
G1 X124.544 Y108.432 E-.10186
G1 X124.733 Y108.504 E-.07678
G1 X124.94 Y108.633 E-.0929
G1 X125.117 Y108.799 E-.09242
G1 X125.237 Y108.961 E-.07629
G1 X125.345 Y109.178 E-.09224
G1 X125.408 Y109.415 E-.09318
G1 X125.426 Y109.622 E-.07912
G1 X125.426 Y109.768 E-.05523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.217 Y110.666 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.217 Y109.669 E.01741
G2 X124.169 Y109.586 I-.056 J-.022 E.00192
G1 X123.559 Y109.586 E.01064
G3 X122.418 Y110.795 I-2.263 J-.993 E.02961
G1 X121.728 Y111.014 E.01263
G3 X121.038 Y110.783 I-.174 J-.625 E.01348
G1 X120.349 Y109.732 E.02195
G1 X120.155 Y109.586 E.00424
G1 X118.042 Y109.585 E.03689
G3 X116.9 Y110.795 I-2.264 J-.993 E.02963
G1 X116.21 Y111.014 E.01263
G3 X115.521 Y110.783 I-.174 J-.625 E.01348
G1 X114.831 Y109.732 E.02195
G1 X114.636 Y109.585 E.00426
G1 X112.525 Y109.584 E.03687
G3 X111.382 Y110.795 I-2.266 J-.993 E.02964
G1 X110.693 Y111.014 E.01263
G3 X110.003 Y110.783 I-.174 J-.625 E.01348
G1 X109.584 Y110.144 E.01334
G1 X109.584 Y111.75 E.02804
G1 X110.003 Y111.982 E.00836
G1 X110.693 Y113.033 E.02195
G1 X111.382 Y113.554 E.01509
G1 X112.072 Y113.773 E.01263
G2 X112.762 Y113.542 I.174 J-.625 E.01348
G1 X113.452 Y112.491 E.02195
G1 X114.141 Y111.97 E.01509
G1 X114.831 Y111.751 E.01263
G3 X115.521 Y111.982 I.174 J.625 E.01348
G1 X116.21 Y113.033 E.02195
G1 X116.9 Y113.554 E.01509
G1 X117.59 Y113.773 E.01263
G2 X118.279 Y113.542 I.174 J-.625 E.01348
G1 X118.969 Y112.491 E.02195
G1 X119.659 Y111.97 E.01509
G1 X120.349 Y111.751 E.01263
G3 X121.038 Y111.982 I.174 J.625 E.01348
G1 X121.728 Y113.033 E.02195
G1 X122.418 Y113.554 E.01509
G1 X123.107 Y113.773 E.01263
G2 X123.797 Y113.542 I.174 J-.625 E.01348
G1 X124.217 Y112.902 E.01336
G1 X124.217 Y114.509 E.02806
G1 X123.797 Y114.741 E.00837
G1 X123.107 Y115.792 E.02195
G1 X122.418 Y116.313 E.01509
G1 X121.728 Y116.532 E.01263
G3 X121.038 Y116.3 I-.174 J-.625 E.01348
G1 X120.349 Y115.249 E.02195
G1 X119.659 Y114.728 E.01509
G1 X118.969 Y114.51 E.01263
G2 X118.279 Y114.741 I-.174 J.625 E.01348
G1 X117.59 Y115.792 E.02195
G1 X116.9 Y116.313 E.01509
G1 X116.21 Y116.532 E.01263
G3 X115.521 Y116.3 I-.174 J-.625 E.01348
G1 X114.831 Y115.249 E.02195
G1 X114.141 Y114.728 E.01509
G1 X113.452 Y114.51 E.01263
G2 X112.762 Y114.741 I-.174 J.625 E.01348
G1 X112.072 Y115.792 E.02195
G1 X111.382 Y116.313 E.01509
G1 X110.693 Y116.532 E.01263
G3 X110.003 Y116.3 I-.174 J-.625 E.01348
G1 X109.584 Y115.661 E.01335
G1 X109.583 Y117.268 E.02805
G1 X110.003 Y117.5 E.00837
G1 X110.693 Y118.551 E.02195
G1 X111.382 Y119.072 E.01509
G1 X112.072 Y119.29 E.01263
G2 X112.762 Y119.059 I.174 J-.625 E.01348
G1 X113.452 Y118.008 E.02195
G1 X114.141 Y117.487 E.01509
G1 X114.831 Y117.269 E.01263
G3 X115.521 Y117.5 I.174 J.625 E.01348
G1 X116.21 Y118.551 E.02195
G1 X116.9 Y119.072 E.01509
G1 X117.59 Y119.29 E.01263
G2 X118.279 Y119.059 I.174 J-.625 E.01348
G1 X118.969 Y118.008 E.02195
G1 X119.659 Y117.487 E.01509
G1 X120.349 Y117.269 E.01263
G3 X121.038 Y117.5 I.174 J.625 E.01348
G1 X121.728 Y118.551 E.02195
G1 X122.418 Y119.072 E.01509
G1 X123.107 Y119.29 E.01263
G2 X123.797 Y119.059 I.174 J-.625 E.01348
G1 X124.216 Y118.42 E.01334
G1 X124.216 Y120.027 E.02805
G1 X123.797 Y120.259 E.00836
G1 X123.107 Y121.31 E.02195
G1 X122.418 Y121.83 E.01509
G1 X121.728 Y122.049 E.01263
G3 X121.038 Y121.818 I-.174 J-.625 E.01348
G1 X120.349 Y120.767 E.02195
G1 X119.659 Y120.246 E.01509
G1 X118.969 Y120.027 E.01263
G2 X118.279 Y120.259 I-.174 J.625 E.01348
G1 X117.59 Y121.31 E.02195
G1 X116.9 Y121.83 E.01509
G1 X116.21 Y122.049 E.01263
G3 X115.521 Y121.818 I-.174 J-.625 E.01348
G1 X114.831 Y120.767 E.02195
G1 X114.141 Y120.246 E.01509
G1 X113.452 Y120.027 E.01263
G2 X112.762 Y120.259 I-.174 J.625 E.01348
G1 X112.072 Y121.31 E.02195
G1 X111.382 Y121.83 E.01509
G1 X110.693 Y122.049 E.01263
G3 X110.003 Y121.818 I-.174 J-.625 E.01348
G1 X109.583 Y121.178 E.01336
G1 X109.583 Y122.786 E.02806
G1 X110.003 Y123.017 E.00838
G1 X110.693 Y124.068 E.02195
G1 X111.121 Y124.216 E.00792
G1 X112.841 Y124.216 E.03003
G3 X114.141 Y123.005 I3.637 J2.6 E.03123
G1 X114.831 Y122.786 E.01263
G3 X115.521 Y123.017 I.174 J.625 E.01348
G1 X116.21 Y124.068 E.02195
G1 X116.64 Y124.216 E.00794
G1 X118.359 Y124.217 E.03001
G3 X119.659 Y123.005 I3.638 J2.601 E.03124
G1 X120.349 Y122.786 E.01263
G3 X121.038 Y123.017 I.174 J.625 E.01348
G1 X121.728 Y124.068 E.02195
G1 X122.159 Y124.217 E.00796
G1 X123.876 Y124.217 E.02998
G1 X124.216 Y123.832 E.00897
G1 X124.216 Y122.118 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.216 Y123.832 E-.65138
G1 X124.027 Y124.046 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 9/83
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.086 J1.214 P1  F42000
G1 X149.102 Y122.26 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.3 F42000
G1 X130.052 Y125.948 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.748 Y126.277 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.257 J-.282 E.00568
G1 X129.624 Y104.012 E.38369
G3 X130.012 Y103.624 I.386 J-.003 E.01069
G1 X152.001 Y103.624 E.38392
G3 X152.376 Y103.985 I-.005 J.381 E.01001
G1 X152.376 Y125.988 E.38416
G3 X151.988 Y126.377 I-.386 J.003 E.01069
G1 X130.012 Y126.377 E.38369
G3 X129.796 Y126.314 I-.007 J-.381 E.00399
M204 S250
G1 X129.472 Y126.586 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.467 Y126.579 E.00014
G3 X129.21 Y125.996 I.541 J-.586 E.01064
G1 X129.21 Y104.004 E.3571
G3 X130.004 Y103.21 I.805 J.01 E.02019
G1 X152.015 Y103.21 E.35741
G3 X152.789 Y103.969 I-.023 J.798 E.01935
G1 X152.79 Y125.996 E.35767
G3 X151.996 Y126.79 I-.805 J-.01 E.02019
G1 X130.004 Y126.79 E.3571
G3 X129.697 Y126.727 I.004 J-.798 E.00513
G1 X129.523 Y126.618 E.00333
; WIPE_START
M204 S6000
G1 X129.467 Y126.579 E-.026
G1 X129.361 Y126.465 E-.05897
G1 X129.27 Y126.3 E-.07155
G1 X129.226 Y126.154 E-.05808
G1 X129.21 Y125.996 E-.06035
G1 X129.21 Y124.719 E-.48505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 9 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer9 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32137
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.4617
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432712
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.2787
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.2787
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.2787
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.2787
G1 X150.021 Y105.979 E.01282
M73 P45 R16
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431906
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.503 J-1.206 E.02376
G2 X149.316 Y105.269 I-.212 J110.309 E.02375
G1 X132.684 Y105.269 E.27815
G2 X131.263 Y105.263 I-1.211 J108.614 E.02376
G2 X131.269 Y106.684 I108.948 J.21 E.02376
G1 X131.269 Y123.316 E.27815
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27815
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27715
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.3 F42000
G1 X149.052 Y148.21 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.3 F42000
G1 X130.052 Y151.948 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.052 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.748 Y152.277 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.257 J-.282 E.00568
G1 X129.624 Y130.012 E.38369
G3 X130.012 Y129.624 I.386 J-.003 E.01069
G1 X152.001 Y129.624 E.38392
G3 X152.376 Y129.985 I-.005 J.381 E.01001
G1 X152.376 Y151.988 E.38416
G3 X151.988 Y152.376 I-.386 J.003 E.01069
G1 X130.012 Y152.376 E.38369
G3 X129.796 Y152.314 I-.007 J-.381 E.00399
M204 S250
G1 X129.472 Y152.586 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.467 Y152.579 E.00014
G3 X129.21 Y151.996 I.541 J-.586 E.01064
G1 X129.21 Y130.004 E.3571
G3 X130.004 Y129.21 I.805 J.01 E.02019
G1 X152.015 Y129.21 E.35741
G3 X152.789 Y129.969 I-.023 J.798 E.01935
G1 X152.79 Y151.996 E.35767
G3 X151.996 Y152.79 I-.805 J-.01 E.02019
G1 X130.004 Y152.79 E.3571
G3 X129.697 Y152.727 I.004 J-.798 E.00513
G1 X129.523 Y152.618 E.00333
; WIPE_START
M204 S6000
G1 X129.467 Y152.579 E-.026
G1 X129.361 Y152.465 E-.05897
G1 X129.27 Y152.3 E-.07155
G1 X129.226 Y152.154 E-.05808
G1 X129.21 Y151.996 E-.06035
G1 X129.21 Y150.719 E-.48505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.021 Y145.771 Z1.3 F42000
G1 X151.534 Y131.712 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.5203
G1 F14433.486
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.45677
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29323
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29323
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29323
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29323
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.4545
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.779 J-1.244 E.02595
G2 X149.266 Y131.282 I-.224 J39.727 E.02595
G1 X132.734 Y131.282 E.2917
G2 X131.263 Y131.263 I-1.247 J39.477 E.02596
G2 X131.282 Y132.734 I39.488 J.225 E.02596
G1 X131.282 Y149.266 E.2917
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.2917
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29064
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.3 F42000
G1 X123.152 Y148.31 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.3 F42000
G1 X104.052 Y151.948 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.052 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.748 Y152.277 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.257 J-.282 E.00568
G1 X103.624 Y130.012 E.38369
G3 X104.012 Y129.624 I.386 J-.003 E.01069
G1 X126.001 Y129.624 E.38392
G3 X126.376 Y129.985 I-.005 J.381 E.01001
G1 X126.377 Y151.988 E.38416
G3 X125.988 Y152.376 I-.386 J.003 E.01069
G1 X104.012 Y152.376 E.38369
G3 X103.796 Y152.314 I-.007 J-.381 E.00399
M204 S250
G1 X103.472 Y152.586 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.467 Y152.579 E.00014
G3 X103.21 Y151.996 I.541 J-.586 E.01064
G1 X103.21 Y130.004 E.3571
G3 X104.004 Y129.21 I.805 J.01 E.02019
G1 X126.015 Y129.21 E.35741
G3 X126.789 Y129.969 I-.023 J.798 E.01935
G1 X126.79 Y151.996 E.35767
G3 X125.996 Y152.79 I-.805 J-.01 E.02019
G1 X104.004 Y152.79 E.3571
G3 X103.697 Y152.727 I.004 J-.798 E.00513
G1 X103.523 Y152.618 E.00333
; WIPE_START
M204 S6000
G1 X103.467 Y152.579 E-.026
G1 X103.361 Y152.465 E-.05897
G1 X103.27 Y152.3 E-.07155
G1 X103.226 Y152.154 E-.05808
G1 X103.21 Y151.996 E-.06035
M73 P46 R16
G1 X103.21 Y150.719 E-.48505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.014 Y145.763 Z1.3 F42000
G1 X125.534 Y131.653 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40312
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408632
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26395
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26395
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26395
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26395
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409028
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.796 J-1.181 E.02164
G1 X106.634 Y131.257 E.28586
G3 X105.263 Y131.263 I-1.176 J-112.975 E.02165
G1 X105.257 Y149.366 E.28587
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28588
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26328
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.544 Y125.733 Z1.3 F42000
G1 X124.231 Y109.202 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.602 Y109.627 I-.047 J.415 E.01082
G1 X124.594 Y124.265 E.25558
G3 X124.166 Y124.602 I-.411 J-.082 E.01036
G1 X109.535 Y124.594 E.25545
G3 X109.198 Y124.166 I.082 J-.411 E.01036
G1 X109.2 Y109.599 E.25434
G3 X109.599 Y109.2 I.41 J.011 E.01089
G1 X124.171 Y109.202 E.25443
M204 S10000
G1 X124.274 Y108.775 F42000
G1 F6000
M204 S6000
G3 X125.03 Y109.619 I-.095 J.845 E.02166
G1 X125.029 Y124.219 E.25491
G3 X124.177 Y125.03 I-.841 J-.03 E.02276
G1 X109.581 Y125.029 E.25484
G3 X108.77 Y124.177 I.03 J-.841 E.02276
G1 X108.771 Y109.581 E.25484
G3 X109.581 Y108.771 I.848 J.038 E.02196
G1 X124.214 Y108.775 E.25549
M204 S250
G1 X124.347 Y108.369 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.557 Y108.414 E.00349
G3 X125.444 Y109.612 I-.383 J1.21 E.02586
G1 X125.443 Y124.236 E.23747
G3 X124.187 Y125.444 I-1.255 J-.048 E.03126
G1 X109.564 Y125.443 E.23744
G3 X108.356 Y124.187 I.048 J-1.255 E.03126
G1 X108.357 Y109.563 E.23745
G3 X109.564 Y108.357 I1.267 J.061 E.03039
G1 X124.288 Y108.363 E.23908
; WIPE_START
M204 S6000
G1 X124.557 Y108.414 E-.10429
G1 X124.747 Y108.486 E-.0772
G1 X124.955 Y108.616 E-.09335
G1 X125.134 Y108.784 E-.09292
G1 X125.254 Y108.946 E-.07678
G1 X125.362 Y109.164 E-.09249
G1 X125.426 Y109.402 E-.09363
G1 X125.444 Y109.612 E-.07995
G1 X125.444 Y109.742 E-.04938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.235 Y110.763 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.235 Y109.658 E.01929
G2 X124.221 Y109.588 I-.098 J-.017 E.00129
G1 X124.205 Y109.575 E.00035
G2 X123.689 Y109.568 I-.271 J.903 E.00913
G1 X123.107 Y110.314 E.01651
G1 X122.418 Y110.761 E.01436
G1 X121.728 Y110.906 E.01231
G3 X121.038 Y110.576 I-.033 J-.818 E.01389
G1 X120.349 Y109.692 E.01958
G1 X120.156 Y109.568 E.004
G1 X118.172 Y109.567 E.03464
G1 X117.59 Y110.314 E.01653
G1 X116.9 Y110.761 E.01436
G1 X116.21 Y110.906 E.01231
G3 X115.521 Y110.576 I-.033 J-.818 E.01389
M73 P46 R15
G1 X114.831 Y109.692 E.01958
G1 X114.637 Y109.567 E.00403
G1 X112.655 Y109.566 E.03461
G1 X112.072 Y110.314 E.01655
G1 X111.382 Y110.761 E.01436
G1 X110.693 Y110.906 E.01231
G1 X110.348 Y110.845 E.00612
G3 X109.566 Y110.016 I1.256 J-1.968 E.0201
G1 X109.566 Y111.903 E.03295
G1 X110.003 Y112.189 E.00911
G1 X110.693 Y113.073 E.01958
G1 X111.382 Y113.52 E.01436
G1 X112.072 Y113.665 E.01231
G2 X112.762 Y113.335 I.033 J-.818 E.01389
G1 X113.452 Y112.451 E.01958
G1 X114.141 Y112.003 E.01436
G1 X114.831 Y111.859 E.01231
G3 X115.521 Y112.189 I.033 J.818 E.01389
G1 X116.21 Y113.073 E.01958
G1 X116.9 Y113.52 E.01436
G1 X117.59 Y113.665 E.01231
G2 X118.279 Y113.335 I.033 J-.818 E.01389
G1 X118.969 Y112.451 E.01958
G1 X119.659 Y112.003 E.01436
G1 X120.349 Y111.859 E.01231
G3 X121.038 Y112.189 I.033 J.818 E.01389
G1 X121.728 Y113.073 E.01958
G1 X122.418 Y113.52 E.01436
G1 X123.107 Y113.665 E.01231
G1 X123.452 Y113.604 E.00612
G2 X124.235 Y112.774 I-1.257 J-1.97 E.02012
G1 X124.235 Y114.662 E.03297
G1 X123.797 Y114.947 E.00912
G1 X123.107 Y115.831 E.01958
G1 X122.418 Y116.279 E.01436
G1 X121.728 Y116.424 E.01231
G3 X121.038 Y116.094 I-.033 J-.818 E.01389
G1 X120.349 Y115.21 E.01958
G1 X119.659 Y114.762 E.01436
G1 X118.969 Y114.617 E.01231
G2 X118.279 Y114.947 I-.033 J.818 E.01389
G1 X117.59 Y115.831 E.01958
G1 X116.9 Y116.279 E.01436
G1 X116.21 Y116.424 E.01231
G3 X115.521 Y116.094 I-.033 J-.818 E.01389
G1 X114.831 Y115.21 E.01958
G1 X114.141 Y114.762 E.01436
G1 X113.452 Y114.617 E.01231
G2 X112.762 Y114.947 I-.033 J.818 E.01389
G1 X112.072 Y115.831 E.01958
G1 X111.382 Y116.279 E.01436
G1 X110.693 Y116.424 E.01231
G1 X110.348 Y116.363 E.00612
G3 X109.566 Y115.533 I1.257 J-1.969 E.02011
G1 X109.565 Y117.421 E.03296
G1 X110.003 Y117.706 E.00912
G1 X110.693 Y118.59 E.01958
G1 X111.382 Y119.038 E.01436
G1 X112.072 Y119.183 E.01231
G2 X112.762 Y118.853 I.033 J-.818 E.01389
G1 X113.452 Y117.969 E.01958
G1 X114.141 Y117.521 E.01436
G1 X114.831 Y117.376 E.01231
G3 X115.521 Y117.706 I.033 J.818 E.01389
G1 X116.21 Y118.59 E.01958
G1 X116.9 Y119.038 E.01436
G1 X117.59 Y119.183 E.01231
G2 X118.279 Y118.853 I.033 J-.818 E.01389
G1 X118.969 Y117.969 E.01958
G1 X119.659 Y117.521 E.01436
G1 X120.349 Y117.376 E.01231
G3 X121.038 Y117.706 I.033 J.818 E.01389
G1 X121.728 Y118.59 E.01958
G1 X122.418 Y119.038 E.01436
G1 X123.107 Y119.183 E.01231
G1 X123.452 Y119.121 E.00612
G2 X124.234 Y118.292 I-1.256 J-1.969 E.02011
G1 X124.234 Y120.18 E.03296
G1 X123.797 Y120.465 E.00911
G1 X123.107 Y121.349 E.01958
G1 X122.418 Y121.797 E.01436
G1 X121.728 Y121.942 E.01231
G3 X121.038 Y121.612 I-.033 J-.818 E.01389
G1 X120.349 Y120.728 E.01958
G1 X119.659 Y120.28 E.01436
G1 X118.969 Y120.135 E.01231
G2 X118.279 Y120.465 I-.033 J.818 E.01389
G1 X117.59 Y121.349 E.01958
G1 X116.9 Y121.797 E.01436
G1 X116.21 Y121.942 E.01231
G3 X115.521 Y121.612 I-.033 J-.818 E.01389
G1 X114.831 Y120.728 E.01958
G1 X114.141 Y120.28 E.01436
G1 X113.452 Y120.135 E.01231
G2 X112.762 Y120.465 I-.033 J.818 E.01389
G1 X112.072 Y121.349 E.01958
G1 X111.382 Y121.797 E.01436
G1 X110.693 Y121.942 E.01231
G1 X110.348 Y121.88 E.00612
G3 X109.565 Y121.05 I1.257 J-1.97 E.02012
G1 X109.565 Y122.939 E.03297
G1 X110.003 Y123.224 E.00913
G1 X110.693 Y124.108 E.01958
G1 X111.132 Y124.234 E.00798
G1 X112.822 Y124.234 E.02951
G3 X114.141 Y123.039 I2.622 J1.567 E.03154
G1 X114.831 Y122.894 E.01231
G3 X115.521 Y123.224 I.033 J.818 E.01389
G1 X116.21 Y124.108 E.01958
G1 X116.651 Y124.235 E.00801
G1 X118.34 Y124.235 E.02948
G3 X119.659 Y123.039 I2.623 J1.568 E.03155
G1 X120.349 Y122.894 E.01231
G3 X121.038 Y123.224 I.033 J.818 E.01389
G1 X121.728 Y124.108 E.01958
G1 X122.17 Y124.235 E.00803
G1 X123.857 Y124.235 E.02945
G1 X124.234 Y123.787 E.01023
G1 X124.234 Y122.073 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.234 Y123.787 E-.65138
G1 X124.05 Y124.006 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 10/83
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I.085 J1.214 P1  F42000
G1 X149.102 Y122.26 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.4 F42000
G1 X130.052 Y125.948 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.748 Y126.277 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.257 J-.282 E.00567
G1 X129.624 Y104.012 E.3837
G3 X130.012 Y103.624 I.383 J-.006 E.01071
G1 X152.003 Y103.624 E.38396
G1 X152.047 Y103.627 E.00077
G3 X152.376 Y103.985 I-.048 J.374 E.00923
G1 X152.376 Y125.988 E.38417
G3 X151.988 Y126.377 I-.382 J.007 E.01072
G1 X130.012 Y126.377 E.38369
G3 X129.795 Y126.314 I-.008 J-.381 E.00401
M204 S250
G1 X129.463 Y126.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.364 Y126.463 E.00248
G3 X129.21 Y125.996 I.644 J-.471 E.00812
G1 X129.21 Y104.004 E.3571
G3 X130.004 Y103.21 I.8 J.006 E.02022
G1 X152.018 Y103.21 E.35745
G3 X152.789 Y103.969 I-.026 J.799 E.01931
G1 X152.79 Y125.996 E.35767
G3 X151.996 Y126.79 I-.799 J-.004 E.02022
G1 X130.004 Y126.79 E.3571
G3 X129.509 Y126.615 I.003 J-.798 E.00868
; WIPE_START
M204 S6000
G1 X129.364 Y126.463 E-.0801
G1 X129.284 Y126.333 E-.05816
G1 X129.226 Y126.154 E-.07132
G1 X129.21 Y125.996 E-.06039
G1 X129.21 Y124.706 E-.49003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 10 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer10 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32137
M204 S10000
G1 X151.135 Y105.682 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46168
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432709
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27869
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
M73 P47 R15
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27869
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27869
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27869
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431904
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.495 J-1.206 E.02376
G2 X149.316 Y105.27 I-.212 J110.654 E.02375
G1 X132.684 Y105.269 E.27815
G2 X131.263 Y105.263 I-1.214 J109.012 E.02376
G2 X131.269 Y106.684 I108.78 J.21 E.02376
G1 X131.269 Y123.316 E.27815
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27815
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27715
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.4 F42000
G1 X149.052 Y148.21 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.4 F42000
G1 X130.052 Y151.948 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.053 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.748 Y152.277 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.257 J-.282 E.00567
G1 X129.624 Y130.012 E.3837
G3 X130.012 Y129.624 I.383 J-.006 E.01071
G1 X152.003 Y129.624 E.38396
G1 X152.047 Y129.627 E.00077
G3 X152.376 Y129.985 I-.048 J.374 E.00923
G1 X152.376 Y151.988 E.38417
G3 X151.988 Y152.376 I-.382 J.007 E.01072
G1 X130.012 Y152.376 E.38369
G3 X129.795 Y152.314 I-.008 J-.381 E.00401
M204 S250
G1 X129.463 Y152.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.364 Y152.463 E.00248
G3 X129.21 Y151.996 I.644 J-.471 E.00812
G1 X129.21 Y130.004 E.3571
G3 X130.004 Y129.21 I.8 J.006 E.02022
G1 X152.018 Y129.21 E.35745
G3 X152.789 Y129.969 I-.026 J.799 E.01931
G1 X152.79 Y151.996 E.35767
G3 X151.996 Y152.79 I-.799 J-.004 E.02022
G1 X130.004 Y152.79 E.3571
G3 X129.509 Y152.615 I.003 J-.798 E.00868
; WIPE_START
M204 S6000
G1 X129.364 Y152.463 E-.0801
G1 X129.284 Y152.333 E-.05816
G1 X129.226 Y152.154 E-.07132
G1 X129.21 Y151.996 E-.06039
G1 X129.21 Y150.706 E-.49003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.023 Y145.76 Z1.4 F42000
G1 X151.534 Y131.712 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52028
G1 F14434.064
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456768
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29322
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454498
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.776 J-1.244 E.02595
G2 X149.266 Y131.282 I-.225 J39.679 E.02594
G1 X132.734 Y131.282 E.2917
G2 X131.263 Y131.263 I-1.247 J39.498 E.02596
G2 X131.282 Y132.734 I39.488 J.225 E.02596
G1 X131.282 Y149.266 E.2917
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.2917
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29064
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52094
G1 F14414.992
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.4 F42000
G1 X123.152 Y148.31 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.4 F42000
G1 X104.052 Y151.948 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.053 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.748 Y152.277 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.257 J-.282 E.00567
G1 X103.624 Y130.012 E.3837
G3 X104.012 Y129.624 I.383 J-.006 E.01071
G1 X126.003 Y129.624 E.38396
G1 X126.047 Y129.627 E.00077
G3 X126.376 Y129.985 I-.048 J.374 E.00923
G1 X126.377 Y151.988 E.38417
G3 X125.988 Y152.376 I-.382 J.007 E.01072
G1 X104.012 Y152.376 E.38369
G3 X103.795 Y152.314 I-.008 J-.381 E.00401
M204 S250
G1 X103.463 Y152.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.364 Y152.463 E.00248
G3 X103.21 Y151.996 I.644 J-.471 E.00812
G1 X103.21 Y130.004 E.3571
G3 X104.004 Y129.21 I.8 J.006 E.02022
G1 X126.018 Y129.21 E.35745
G3 X126.789 Y129.969 I-.026 J.799 E.01931
G1 X126.79 Y151.996 E.35767
G3 X125.996 Y152.79 I-.799 J-.004 E.02022
G1 X104.004 Y152.79 E.3571
G3 X103.509 Y152.615 I.003 J-.798 E.00868
; WIPE_START
M204 S6000
M73 P48 R15
G1 X103.364 Y152.463 E-.0801
G1 X103.284 Y152.333 E-.05816
G1 X103.226 Y152.154 E-.07132
G1 X103.21 Y151.996 E-.06039
G1 X103.21 Y150.706 E-.49003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.015 Y145.751 Z1.4 F42000
G1 X125.534 Y131.653 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.4031
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.40863
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26395
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26395
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26395
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26395
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409026
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.787 J-1.181 E.02164
G1 X106.634 Y131.257 E.28586
G3 X105.263 Y131.263 I-1.173 J-112.31 E.02165
G1 X105.257 Y149.366 E.28587
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28587
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26328
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40376
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34973
G1 X105.677 Y131.612 E-.41027
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.544 Y125.732 Z1.4 F42000
G1 X124.243 Y109.184 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.62 Y109.617 I-.048 J.422 E.01101
G1 X124.619 Y124.213 E.25484
G3 X124.176 Y124.62 I-.42 J-.013 E.01169
G1 X109.587 Y124.619 E.25473
G3 X109.18 Y124.176 I.013 J-.42 E.01169
G1 X109.188 Y109.522 E.25587
G3 X109.587 Y109.182 I.416 J.083 E.00988
G1 X124.183 Y109.184 E.25484
M204 S10000
G1 X124.286 Y108.757 F42000
G1 F6000
M204 S6000
G3 X125.048 Y109.609 I-.096 J.853 E.02185
G1 X125.047 Y124.231 E.2553
G3 X124.187 Y125.048 I-.848 J-.031 E.02294
G1 X109.569 Y125.047 E.25523
G3 X108.752 Y124.187 I.031 J-.848 E.02293
G1 X108.753 Y109.569 E.25524
G3 X109.569 Y108.753 I.855 J.04 E.02211
G1 X124.226 Y108.757 E.25591
M204 S250
G1 X124.354 Y108.35 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.57 Y108.396 E.0036
G3 X125.462 Y109.601 I-.385 J1.217 E.026
G1 X125.461 Y124.248 E.23784
G3 X124.198 Y125.462 I-1.262 J-.049 E.03143
G1 X109.552 Y125.461 E.23782
G3 X108.338 Y124.198 I.049 J-1.262 E.03143
G1 X108.339 Y109.551 E.23783
G3 X109.552 Y108.339 I1.274 J.062 E.03052
G1 X124.294 Y108.345 E.23939
; WIPE_START
M204 S6000
G1 X124.57 Y108.396 E-.1067
G1 X124.761 Y108.469 E-.07765
G1 X124.971 Y108.6 E-.09394
G1 X125.15 Y108.768 E-.0934
G1 X125.271 Y108.931 E-.07712
G1 X125.379 Y109.15 E-.09266
G1 X125.444 Y109.389 E-.09422
G1 X125.462 Y109.601 E-.0807
G1 X125.462 Y109.716 E-.04361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.122 Y109.55 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X123.836 Y109.55 E.02993
G2 X123.107 Y110.356 I2.227 J2.747 E.01904
G1 X122.418 Y110.735 E.01374
G1 X121.728 Y110.813 E.01212
G3 X121.038 Y110.424 I.124 J-1.026 E.01418
G1 X120.349 Y109.651 E.01809
G1 X120.165 Y109.55 E.00366
G1 X118.32 Y109.549 E.03222
G2 X117.59 Y110.356 I2.229 J2.751 E.01906
G1 X116.9 Y110.735 E.01374
G1 X116.21 Y110.813 E.01212
G3 X115.521 Y110.424 I.124 J-1.026 E.01418
G1 X114.831 Y109.651 E.01809
G1 X114.646 Y109.549 E.00369
G1 X112.803 Y109.548 E.03218
G2 X112.072 Y110.356 I2.231 J2.754 E.01909
G1 X111.382 Y110.735 E.01374
G1 X110.693 Y110.813 E.01212
G3 X109.548 Y109.914 I.624 J-1.972 E.02597
G1 X109.548 Y112.024 E.03684
G3 X110.003 Y112.341 I-.155 J.708 E.00994
G1 X110.693 Y113.114 E.01809
G1 X111.382 Y113.494 E.01374
G1 X112.072 Y113.571 E.01212
G2 X112.762 Y113.183 I-.124 J-1.026 E.01418
G1 X113.452 Y112.409 E.01809
G1 X114.141 Y112.03 E.01374
G1 X114.831 Y111.952 E.01212
G3 X115.521 Y112.341 I-.124 J1.026 E.01418
G1 X116.21 Y113.114 E.01809
G1 X116.9 Y113.494 E.01374
G1 X117.59 Y113.571 E.01212
G2 X118.279 Y113.183 I-.124 J-1.026 E.01418
G1 X118.969 Y112.409 E.01809
G1 X119.659 Y112.03 E.01374
G1 X120.349 Y111.952 E.01212
G3 X121.038 Y112.341 I-.124 J1.026 E.01418
G1 X121.728 Y113.114 E.01809
G1 X122.418 Y113.494 E.01374
G1 X123.107 Y113.571 E.01212
G2 X124.253 Y112.672 I-.624 J-1.974 E.02599
G1 X124.253 Y114.782 E.03686
G2 X123.797 Y115.1 I.155 J.708 E.00995
G1 X123.107 Y115.873 E.01809
G1 X122.418 Y116.253 E.01374
G1 X121.728 Y116.33 E.01212
G3 X121.038 Y115.942 I.124 J-1.026 E.01418
G1 X120.349 Y115.168 E.01809
G1 X119.659 Y114.789 E.01374
G1 X118.969 Y114.711 E.01212
G2 X118.279 Y115.1 I.124 J1.026 E.01418
G1 X117.59 Y115.873 E.01809
G1 X116.9 Y116.253 E.01374
G1 X116.21 Y116.33 E.01212
G3 X115.521 Y115.942 I.124 J-1.026 E.01418
G1 X114.831 Y115.168 E.01809
G1 X114.141 Y114.789 E.01374
G1 X113.452 Y114.711 E.01212
G2 X112.762 Y115.1 I.124 J1.026 E.01418
G1 X112.072 Y115.873 E.01809
G1 X111.382 Y116.253 E.01374
G1 X110.693 Y116.33 E.01212
G3 X109.548 Y115.431 I.624 J-1.973 E.02598
G1 X109.547 Y117.541 E.03685
G3 X110.003 Y117.859 I-.155 J.708 E.00995
G1 X110.693 Y118.632 E.01809
G1 X111.382 Y119.011 E.01374
G1 X112.072 Y119.089 E.01212
G2 X112.762 Y118.7 I-.124 J-1.026 E.01418
G1 X113.452 Y117.927 E.01809
G1 X114.141 Y117.548 E.01374
G1 X114.831 Y117.47 E.01212
G3 X115.521 Y117.859 I-.124 J1.027 E.01418
G1 X116.21 Y118.632 E.01809
G1 X116.9 Y119.011 E.01374
G1 X117.59 Y119.089 E.01212
G2 X118.279 Y118.7 I-.124 J-1.026 E.01418
G1 X118.969 Y117.927 E.01809
G1 X119.659 Y117.548 E.01374
G1 X120.349 Y117.47 E.01212
G3 X121.038 Y117.859 I-.124 J1.027 E.01418
G1 X121.728 Y118.632 E.01809
G1 X122.418 Y119.011 E.01374
G1 X123.107 Y119.089 E.01212
G2 X124.252 Y118.19 I-.624 J-1.973 E.02598
G1 X124.252 Y120.3 E.03685
G2 X123.797 Y120.617 I.155 J.708 E.00994
G1 X123.107 Y121.391 E.01809
G1 X122.418 Y121.77 E.01374
G1 X121.728 Y121.848 E.01212
G3 X121.038 Y121.459 I.124 J-1.027 E.01418
G1 X120.349 Y120.686 E.01809
G1 X119.659 Y120.306 E.01374
G1 X118.969 Y120.229 E.01212
G2 X118.279 Y120.617 I.124 J1.026 E.01418
G1 X117.59 Y121.391 E.01809
G1 X116.9 Y121.77 E.01374
G1 X116.21 Y121.848 E.01212
G3 X115.521 Y121.459 I.124 J-1.027 E.01418
G1 X114.831 Y120.686 E.01809
G1 X114.141 Y120.306 E.01374
G1 X113.452 Y120.229 E.01212
G2 X112.762 Y120.617 I.124 J1.026 E.01418
G1 X112.072 Y121.391 E.01809
G1 X111.382 Y121.77 E.01374
G1 X110.693 Y121.848 E.01212
G3 X109.547 Y120.948 I.624 J-1.974 E.02599
G1 X109.547 Y123.059 E.03686
G3 X110.003 Y123.376 I-.155 J.709 E.00996
G1 X110.693 Y124.15 E.01809
G1 X111.145 Y124.252 E.00809
G1 X112.628 Y124.252 E.0259
G1 X112.762 Y124.218 E.00242
G1 X113.452 Y123.445 E.01809
G1 X114.141 Y123.065 E.01374
G1 X114.831 Y122.988 E.01212
G3 X115.521 Y123.376 I-.124 J1.026 E.01418
G1 X116.21 Y124.15 E.01809
G1 X116.664 Y124.253 E.00812
G1 X118.144 Y124.253 E.02583
G1 X118.279 Y124.218 E.00245
G1 X118.969 Y123.445 E.01809
G1 X119.659 Y123.065 E.01374
G1 X120.349 Y122.988 E.01212
G3 X121.038 Y123.376 I-.124 J1.026 E.01418
G1 X121.728 Y124.15 E.01809
G1 X122.184 Y124.253 E.00816
G1 X123.797 Y124.218 E.02818
G1 X124.252 Y123.708 E.01193
G1 X124.252 Y121.994 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.252 Y123.708 E-.65138
G1 X124.062 Y123.921 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 11/83
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.081 J1.214 P1  F42000
G1 X149.102 Y122.26 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.5 F42000
G1 X130.052 Y125.948 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.729 Y126.258 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.982 I.277 J-.265 E.00531
G1 X129.624 Y104.013 E.38359
G3 X130.018 Y103.624 I.386 J-.003 E.01079
G1 X152.005 Y103.624 E.38389
G1 X152.071 Y103.631 E.00115
G3 X152.376 Y103.992 I-.074 J.372 E.0089
G1 X152.376 Y125.988 E.38406
G3 X151.981 Y126.377 I-.386 J.002 E.01079
G1 X130.012 Y126.377 E.38359
G3 X129.774 Y126.298 I-.006 J-.383 E.00446
M204 S250
G1 X129.443 Y126.557 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.424 Y126.535 E.00046
G3 X129.21 Y125.994 I.586 J-.545 E.00967
G1 X129.21 Y104.004 E.35707
G3 X130.006 Y103.21 I.805 J.01 E.02022
G1 X152.02 Y103.211 E.35746
G3 X152.789 Y103.971 I-.026 J.796 E.01932
G1 X152.79 Y125.996 E.35763
G3 X151.994 Y126.79 I-.805 J-.01 E.02022
G1 X130.004 Y126.79 E.35707
G3 X129.54 Y126.637 I.006 J-.8 E.00807
G1 X129.489 Y126.595 E.00107
; WIPE_START
M204 S6000
G1 X129.424 Y126.535 E-.03352
G1 X129.328 Y126.414 E-.05873
G1 X129.248 Y126.242 E-.0721
G1 X129.21 Y125.994 E-.09547
G1 X129.21 Y124.678 E-.50019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 11 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer11 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.682 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.742 E.32137
M204 S10000
G1 X151.135 Y105.682 F42000
M73 P49 R15
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.742 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46166
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432706
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27869
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27869
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27869
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27869
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01181
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.4319
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.489 J-1.206 E.02376
G2 X149.316 Y105.27 I-.212 J110.827 E.02375
G1 X132.684 Y105.269 E.27815
G2 X131.263 Y105.263 I-1.214 J109.012 E.02376
G2 X131.269 Y106.684 I108.78 J.21 E.02376
G1 X131.269 Y123.316 E.27815
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27815
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27714
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.5 F42000
G1 X149.052 Y148.21 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.5 F42000
G1 X130.052 Y151.948 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.053 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.729 Y152.258 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.982 I.277 J-.265 E.00531
G1 X129.624 Y130.012 E.38359
G3 X130.018 Y129.624 I.386 J-.003 E.01079
G1 X152.005 Y129.624 E.38389
G1 X152.071 Y129.631 E.00115
G3 X152.376 Y129.992 I-.074 J.372 E.0089
G1 X152.376 Y151.988 E.38406
G3 X151.981 Y152.376 I-.386 J.002 E.01079
G1 X130.012 Y152.376 E.38359
G3 X129.774 Y152.298 I-.006 J-.383 E.00446
M204 S250
G1 X129.443 Y152.557 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.424 Y152.535 E.00046
G3 X129.21 Y151.994 I.586 J-.545 E.00967
G1 X129.21 Y130.004 E.35707
G3 X130.006 Y129.21 I.805 J.01 E.02022
G1 X152.02 Y129.211 E.35746
G3 X152.789 Y129.971 I-.026 J.796 E.01932
G1 X152.79 Y151.996 E.35763
G3 X151.994 Y152.79 I-.805 J-.01 E.02022
G1 X130.004 Y152.79 E.35707
G3 X129.54 Y152.637 I.006 J-.8 E.00807
G1 X129.489 Y152.595 E.00107
; WIPE_START
M204 S6000
G1 X129.424 Y152.535 E-.03352
G1 X129.328 Y152.414 E-.05873
G1 X129.248 Y152.242 E-.0721
G1 X129.21 Y151.994 E-.09547
G1 X129.21 Y150.678 E-.50019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.027 Y145.736 Z1.5 F42000
G1 X151.534 Y131.712 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52024
G1 F14435.222
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456764
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29322
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01365
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454495
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.773 J-1.244 E.02595
G2 X149.266 Y131.282 I-.225 J39.722 E.02594
G1 X132.734 Y131.282 E.29169
G2 X131.263 Y131.263 I-1.247 J39.498 E.02596
G2 X131.282 Y132.734 I39.488 J.225 E.02596
G1 X131.282 Y149.266 E.29169
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29169
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29063
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
M73 P49 R14
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52094
G1 F14414.992
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.5 F42000
G1 X123.152 Y148.31 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.5 F42000
G1 X104.052 Y151.948 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.053 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.73 Y152.258 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.982 I.277 J-.265 E.00531
G1 X103.624 Y130.012 E.38359
G3 X104.018 Y129.624 I.386 J-.003 E.01079
G1 X126.005 Y129.624 E.38389
G1 X126.071 Y129.631 E.00115
G3 X126.376 Y129.992 I-.074 J.372 E.0089
G1 X126.377 Y151.988 E.38406
G3 X125.981 Y152.376 I-.386 J.002 E.01079
G1 X104.012 Y152.376 E.38359
M73 P50 R14
G3 X103.774 Y152.298 I-.006 J-.383 E.00446
M204 S250
G1 X103.443 Y152.557 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.424 Y152.535 E.00046
G3 X103.21 Y151.994 I.586 J-.545 E.00967
G1 X103.21 Y130.004 E.35707
G3 X104.006 Y129.21 I.805 J.01 E.02022
G1 X126.02 Y129.211 E.35746
G3 X126.789 Y129.971 I-.026 J.796 E.01932
G1 X126.79 Y151.996 E.35763
G3 X125.994 Y152.79 I-.805 J-.01 E.02022
G1 X104.004 Y152.79 E.35707
G3 X103.54 Y152.637 I.006 J-.8 E.00807
G1 X103.489 Y152.595 E.00107
; WIPE_START
M204 S6000
G1 X103.424 Y152.535 E-.03352
G1 X103.328 Y152.414 E-.05873
G1 X103.248 Y152.242 E-.0721
G1 X103.21 Y151.994 E-.09547
G1 X103.21 Y150.678 E-.50019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.019 Y145.727 Z1.5 F42000
G1 X125.534 Y131.653 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40308
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408626
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26395
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26395
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26395
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26395
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409023
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.781 J-1.181 E.02164
G1 X106.634 Y131.257 E.28586
G3 X105.263 Y131.263 I-1.173 J-112.5 E.02165
G1 X105.257 Y149.366 E.28587
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28587
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26327
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.543 Y125.732 Z1.5 F42000
G1 X124.254 Y109.166 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.638 Y109.606 I-.048 J.429 E.0112
G1 X124.63 Y124.29 E.25639
G3 X124.187 Y124.638 I-.421 J-.081 E.01072
G1 X109.51 Y124.63 E.25627
G3 X109.162 Y124.187 I.081 J-.421 E.01072
G1 X109.17 Y109.509 E.25629
G3 X109.575 Y109.164 I.423 J.086 E.01002
G1 X124.194 Y109.166 E.25525
M204 S10000
G1 X124.298 Y108.739 F42000
G1 F6000
M204 S6000
G3 X125.066 Y109.598 I-.097 J.86 E.02203
G1 X125.065 Y124.243 E.2557
G3 X124.198 Y125.066 I-.855 J-.032 E.02311
G1 X109.557 Y125.065 E.25563
G3 X108.734 Y124.198 I.032 J-.855 E.02311
G1 X108.735 Y109.557 E.25565
G3 X109.557 Y108.735 I.863 J.041 E.02227
G1 X124.238 Y108.739 E.25632
M204 S250
G1 X124.361 Y108.331 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.584 Y108.379 E.0037
G3 X125.48 Y109.59 I-.388 J1.224 E.02615
G1 X125.479 Y124.26 E.23821
G3 X124.209 Y125.48 I-1.269 J-.051 E.03159
G1 X109.54 Y125.479 E.23819
G3 X108.32 Y124.209 I.051 J-1.269 E.03159
G1 X108.321 Y109.539 E.23821
G3 X109.54 Y108.321 I1.281 J.063 E.03066
G1 X124.301 Y108.327 E.2397
; WIPE_START
M204 S6000
G1 X124.584 Y108.379 E-.10905
G1 X124.776 Y108.452 E-.07802
G1 X124.986 Y108.584 E-.09448
G1 X125.167 Y108.753 E-.09394
G1 X125.288 Y108.917 E-.07763
G1 X125.397 Y109.136 E-.09285
G1 X125.462 Y109.377 E-.09473
G1 X125.48 Y109.59 E-.08148
G1 X125.48 Y109.69 E-.03782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.29 Y109.532 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.005 Y109.532 E.02993
G2 X123.107 Y110.4 I4.783 J5.843 E.02182
G1 X122.418 Y110.715 E.01324
G1 X121.728 Y110.73 E.01205
G3 X121.038 Y110.298 I.307 J-1.257 E.01446
G1 X120.349 Y109.606 E.01706
G1 X120.185 Y109.532 E.00313
G1 X118.488 Y109.531 E.02964
G2 X117.59 Y110.4 I4.785 J5.846 E.02184
G1 X116.9 Y110.715 E.01324
G1 X116.21 Y110.73 E.01205
G3 X115.521 Y110.298 I.307 J-1.257 E.01446
G1 X114.831 Y109.606 E.01706
G1 X114.666 Y109.531 E.00316
G1 X112.971 Y109.53 E.02959
G2 X112.072 Y110.4 I4.79 J5.852 E.02186
G1 X111.382 Y110.715 E.01324
G1 X110.693 Y110.73 E.01205
G3 X109.53 Y109.823 I1.115 J-2.629 E.02604
G1 X109.53 Y112.122 E.04014
G3 X110.693 Y113.159 I-2.137 J3.568 E.02736
G1 X111.382 Y113.474 E.01324
G1 X112.072 Y113.489 E.01205
G2 X112.762 Y113.057 I-.307 J-1.257 E.01446
G1 X113.452 Y112.365 E.01706
G1 X114.141 Y112.05 E.01324
G1 X114.831 Y112.035 E.01205
G3 X115.521 Y112.467 I-.307 J1.257 E.01446
G1 X116.21 Y113.159 E.01706
G1 X116.9 Y113.474 E.01324
G1 X117.59 Y113.489 E.01205
G2 X118.279 Y113.057 I-.307 J-1.257 E.01446
G1 X118.969 Y112.365 E.01706
G1 X119.659 Y112.05 E.01324
G1 X120.349 Y112.035 E.01205
G3 X121.038 Y112.467 I-.307 J1.257 E.01446
G1 X121.728 Y113.159 E.01706
G1 X122.418 Y113.474 E.01324
G1 X123.107 Y113.489 E.01205
G2 X124.271 Y112.581 I-1.116 J-2.631 E.02606
G1 X124.271 Y114.881 E.04015
G2 X123.107 Y115.918 I2.133 J3.565 E.02737
G1 X122.418 Y116.233 E.01324
G1 X121.728 Y116.248 E.01205
G3 X121.038 Y115.815 I.307 J-1.257 E.01446
G1 X120.349 Y115.124 E.01706
G1 X119.659 Y114.808 E.01324
G1 X118.969 Y114.794 E.01205
G2 X118.279 Y115.226 I.307 J1.257 E.01446
G1 X117.59 Y115.918 E.01706
G1 X116.9 Y116.233 E.01324
G1 X116.21 Y116.248 E.01205
G3 X115.521 Y115.815 I.307 J-1.257 E.01446
G1 X114.831 Y115.124 E.01706
G1 X114.141 Y114.808 E.01324
G1 X113.452 Y114.794 E.01205
G2 X112.762 Y115.226 I.307 J1.257 E.01446
G1 X112.072 Y115.918 E.01706
G1 X111.382 Y116.233 E.01324
G1 X110.693 Y116.248 E.01205
G3 X109.53 Y115.341 I1.115 J-2.63 E.02605
G1 X109.529 Y117.64 E.04015
G3 X110.693 Y118.676 I-2.132 J3.564 E.02737
G1 X111.382 Y118.992 E.01324
G1 X112.072 Y119.006 E.01205
G2 X112.762 Y118.574 I-.307 J-1.257 E.01446
G1 X113.452 Y117.883 E.01706
G1 X114.141 Y117.567 E.01324
G1 X114.831 Y117.552 E.01205
G3 X115.521 Y117.985 I-.307 J1.257 E.01446
G1 X116.21 Y118.676 E.01706
G1 X116.9 Y118.992 E.01324
G1 X117.59 Y119.006 E.01205
G2 X118.279 Y118.574 I-.307 J-1.257 E.01446
G1 X118.969 Y117.883 E.01706
G1 X119.659 Y117.567 E.01324
G1 X120.349 Y117.552 E.01205
G3 X121.038 Y117.985 I-.307 J1.257 E.01446
G1 X121.728 Y118.676 E.01706
G1 X122.418 Y118.992 E.01324
G1 X123.107 Y119.006 E.01205
G2 X124.271 Y118.099 I-1.115 J-2.63 E.02605
G1 X124.27 Y120.399 E.04015
G2 X123.107 Y121.435 I2.137 J3.568 E.02736
G1 X122.418 Y121.751 E.01324
G1 X121.728 Y121.765 E.01205
G3 X121.038 Y121.333 I.307 J-1.257 E.01446
G1 X120.349 Y120.641 E.01706
G1 X119.659 Y120.326 E.01324
G1 X118.969 Y120.311 E.01205
G2 X118.279 Y120.744 I.307 J1.257 E.01446
G1 X117.59 Y121.435 E.01706
G1 X116.9 Y121.751 E.01324
G1 X116.21 Y121.765 E.01205
G3 X115.521 Y121.333 I.307 J-1.257 E.01446
G1 X114.831 Y120.641 E.01706
G1 X114.141 Y120.326 E.01324
G1 X113.452 Y120.311 E.01205
G2 X112.762 Y120.744 I.307 J1.257 E.01446
G1 X112.072 Y121.435 E.01706
G1 X111.382 Y121.751 E.01324
G1 X110.693 Y121.765 E.01205
G3 X109.529 Y120.858 I1.116 J-2.631 E.02606
G1 X109.529 Y123.157 E.04015
G3 X110.693 Y124.194 I-2.129 J3.561 E.02738
G2 X112.475 Y124.27 I1.126 J-5.449 E.03128
G1 X112.762 Y124.092 E.0059
G1 X113.452 Y123.4 E.01706
G1 X114.141 Y123.085 E.01324
G1 X114.831 Y123.07 E.01205
G3 X115.521 Y123.502 I-.307 J1.257 E.01446
G1 X116.21 Y124.194 E.01706
G2 X117.992 Y124.271 I1.127 J-5.446 E.03126
G1 X118.279 Y124.092 E.00592
G1 X118.969 Y123.4 E.01706
G1 X119.659 Y123.085 E.01324
G1 X120.349 Y123.07 E.01205
G3 X121.038 Y123.502 I-.307 J1.257 E.01446
G1 X121.728 Y124.194 E.01706
G2 X123.508 Y124.271 I1.128 J-5.444 E.03125
G2 X124.27 Y123.617 I-1.01 J-1.947 E.01768
G1 X124.27 Y121.903 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.27 Y123.617 E-.65138
G1 X124.068 Y123.82 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 12/83
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I.076 J1.215 P1  F42000
G1 X149.102 Y122.26 Z1.5
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.6 F42000
G1 X130.052 Y125.948 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.747 Y126.274 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.263 J-.283 E.0056
G1 X129.624 Y104.012 E.38369
G3 X130.018 Y103.624 I.383 J-.006 E.01082
G1 X152.007 Y103.624 E.38393
G1 X152.071 Y103.631 E.00112
G3 X152.376 Y103.991 I-.078 J.375 E.00888
G1 X152.376 Y125.988 E.38406
G3 X151.988 Y126.377 I-.386 J.003 E.01068
G1 X130.013 Y126.377 E.38369
G3 X129.794 Y126.311 I-.003 J-.386 E.00404
M204 S250
G1 X129.451 Y126.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.367 Y126.463 E.00215
G3 X129.21 Y125.996 I.648 J-.477 E.00812
G1 X129.21 Y104.004 E.3571
G3 X130.006 Y103.21 I.8 J.006 E.02025
G1 X152.022 Y103.211 E.3575
G3 X152.789 Y103.971 I-.032 J.8 E.01925
G1 X152.79 Y125.996 E.35764
G3 X151.996 Y126.79 I-.805 J-.011 E.02018
G1 X130.004 Y126.79 E.3571
G3 X129.498 Y126.602 I.01 J-.805 E.00894
; WIPE_START
M204 S6000
G1 X129.367 Y126.463 E-.07277
G1 X129.273 Y126.308 E-.06877
G1 X129.226 Y126.154 E-.06112
G1 X129.21 Y125.996 E-.06041
G1 X129.21 Y124.688 E-.49694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 12 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer12 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.683 F42000
M73 P51 R14
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.743 E.32137
M204 S10000
G1 X151.135 Y105.683 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.743 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46162
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432703
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27869
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27869
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27869
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27869
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01181
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431898
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.481 J-1.205 E.02375
G2 X149.316 Y105.27 I-.212 J111.176 E.02375
G1 X132.684 Y105.269 E.27814
G2 X131.263 Y105.263 I-1.214 J109.012 E.02376
G2 X131.269 Y106.684 I108.78 J.21 E.02376
G1 X131.269 Y123.316 E.27814
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27814
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27714
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.6 F42000
G1 X149.052 Y148.21 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.6 F42000
G1 X130.052 Y151.948 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.053 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.747 Y152.274 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.263 J-.283 E.0056
G1 X129.624 Y130.012 E.38369
G3 X130.018 Y129.624 I.383 J-.006 E.01082
G1 X152.007 Y129.624 E.38393
G1 X152.071 Y129.631 E.00112
G3 X152.376 Y129.991 I-.078 J.375 E.00888
G1 X152.376 Y151.988 E.38406
G3 X151.988 Y152.376 I-.386 J.003 E.01068
G1 X130.013 Y152.376 E.38369
G3 X129.794 Y152.311 I-.003 J-.386 E.00404
M204 S250
G1 X129.451 Y152.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.367 Y152.463 E.00215
G3 X129.21 Y151.996 I.648 J-.477 E.00812
G1 X129.21 Y130.004 E.3571
G3 X130.006 Y129.21 I.8 J.006 E.02025
G1 X152.022 Y129.211 E.3575
G3 X152.789 Y129.971 I-.032 J.8 E.01925
G1 X152.79 Y151.996 E.35764
G3 X151.996 Y152.79 I-.805 J-.011 E.02018
G1 X130.004 Y152.79 E.3571
G3 X129.498 Y152.602 I.01 J-.805 E.00894
; WIPE_START
M204 S6000
G1 X129.367 Y152.463 E-.07277
G1 X129.273 Y152.308 E-.06877
G1 X129.226 Y152.154 E-.06112
G1 X129.21 Y151.996 E-.06041
G1 X129.21 Y150.688 E-.49694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.025 Y145.745 Z1.6 F42000
G1 X151.534 Y131.712 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52022
G1 F14435.802
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456762
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29322
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01366
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454493
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.772 J-1.244 E.02595
G2 X149.266 Y131.282 I-.225 J39.743 E.02594
G1 X132.734 Y131.282 E.29169
G2 X131.263 Y131.263 I-1.247 J39.498 E.02596
G2 X131.282 Y132.734 I39.488 J.225 E.02596
G1 X131.282 Y149.266 E.29169
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29169
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29063
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52094
G1 F14414.992
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.6 F42000
M73 P52 R14
G1 X123.152 Y148.31 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.6 F42000
G1 X104.052 Y151.948 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.053 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.747 Y152.274 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.263 J-.283 E.0056
G1 X103.624 Y130.012 E.38369
G3 X104.019 Y129.624 I.383 J-.006 E.01082
G1 X126.007 Y129.624 E.38393
G1 X126.071 Y129.631 E.00112
G3 X126.376 Y129.991 I-.078 J.375 E.00888
G1 X126.377 Y151.988 E.38406
G3 X125.988 Y152.376 I-.386 J.003 E.01068
G1 X104.013 Y152.376 E.38369
G3 X103.794 Y152.311 I-.003 J-.386 E.00404
M204 S250
G1 X103.451 Y152.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.367 Y152.463 E.00215
G3 X103.21 Y151.996 I.648 J-.477 E.00812
G1 X103.21 Y130.004 E.3571
G3 X104.006 Y129.21 I.8 J.006 E.02025
G1 X126.022 Y129.211 E.3575
G3 X126.789 Y129.971 I-.032 J.8 E.01925
G1 X126.79 Y151.996 E.35764
G3 X125.996 Y152.79 I-.805 J-.011 E.02018
G1 X104.004 Y152.79 E.3571
G3 X103.498 Y152.602 I.01 J-.805 E.00894
; WIPE_START
M204 S6000
G1 X103.367 Y152.463 E-.07277
G1 X103.273 Y152.308 E-.06877
G1 X103.226 Y152.154 E-.06112
G1 X103.21 Y151.996 E-.06041
G1 X103.21 Y150.688 E-.49694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.018 Y145.736 Z1.6 F42000
G1 X125.534 Y131.653 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01928
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40306
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408624
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26395
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26395
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26395
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26395
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.40902
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.774 J-1.181 E.02164
G1 X106.634 Y131.257 E.28586
G3 X105.263 Y131.263 I-1.173 J-112.5 E.02165
G1 X105.257 Y149.366 E.28587
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28587
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26327
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.543 Y125.731 Z1.6 F42000
G1 X124.266 Y109.148 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.656 Y109.596 I-.049 J.436 E.01139
G1 X124.648 Y124.303 E.25679
G3 X124.198 Y124.656 I-.428 J-.083 E.01088
G1 X109.497 Y124.648 E.25669
G3 X109.144 Y124.198 I.083 J-.428 E.01088
G1 X109.152 Y109.497 E.2567
G3 X109.563 Y109.146 I.43 J.087 E.01017
G1 X124.206 Y109.148 E.25567
M204 S10000
G1 X124.309 Y108.721 F42000
G1 F6000
M204 S6000
G3 X125.084 Y109.587 I-.098 J.867 E.02222
G1 X125.083 Y124.255 E.2561
G3 X124.209 Y125.084 I-.863 J-.034 E.02329
G1 X109.545 Y125.083 E.25604
G3 X108.716 Y124.209 I.034 J-.863 E.02329
G1 X108.717 Y109.545 E.25604
G3 X109.545 Y108.717 I.87 J.042 E.02242
G1 X124.249 Y108.721 E.25674
M204 S250
G1 X124.368 Y108.312 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.597 Y108.361 E.0038
G3 X125.498 Y109.579 I-.39 J1.231 E.02629
G1 X125.497 Y124.273 E.23859
G3 X124.219 Y125.498 I-1.276 J-.052 E.03175
G1 X109.527 Y125.497 E.23857
G3 X108.302 Y124.219 I.052 J-1.276 E.03175
G1 X108.303 Y109.527 E.23858
G3 X109.528 Y108.303 I1.288 J.065 E.0308
G1 X124.309 Y108.309 E.24001
; WIPE_START
M204 S6000
G1 X124.597 Y108.361 E-.11141
G1 X124.79 Y108.435 E-.07842
G1 X125.002 Y108.567 E-.09501
G1 X125.183 Y108.738 E-.09452
G1 X125.305 Y108.903 E-.07806
G1 X125.414 Y109.122 E-.09297
G1 X125.48 Y109.364 E-.09527
G1 X125.498 Y109.579 E-.0822
G1 X125.498 Y109.664 E-.03214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.437 Y109.514 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.151 Y109.514 E.02993
G2 X123.107 Y110.448 I16.503 J19.497 E.02445
G3 X121.383 Y110.488 I-.899 J-1.59 E.03136
G2 X120.227 Y109.513 I-7.253 J7.436 E.02642
G1 X118.635 Y109.513 E.02779
G2 X117.59 Y110.448 I15.459 J18.343 E.02448
G3 X115.866 Y110.488 I-.899 J-1.59 E.03136
G2 X114.707 Y109.513 I-7.157 J7.328 E.02646
G1 X113.119 Y109.512 E.02773
G2 X112.072 Y110.448 I14.567 J17.358 E.02451
G3 X110.348 Y110.488 I-.899 J-1.59 E.03136
G3 X109.512 Y109.739 I17.855 J-20.785 E.01959
G1 X109.512 Y112.205 E.04306
G3 X110.693 Y113.207 I-3.384 J5.189 E.0271
G2 X112.417 Y113.246 I.899 J-1.59 E.03136
G2 X113.452 Y112.317 I-22.188 J-25.743 E.02428
G3 X115.176 Y112.277 I.899 J1.591 E.03136
G3 X116.21 Y113.207 I-22.188 J25.743 E.02428
G2 X117.935 Y113.246 I.899 J-1.59 E.03136
G2 X118.969 Y112.317 I-22.196 J-25.752 E.02428
G3 X120.693 Y112.277 I.899 J1.591 E.03136
G3 X121.728 Y113.207 I-22.188 J25.743 E.02428
G2 X123.452 Y113.246 I.899 J-1.59 E.03136
G2 X124.289 Y112.497 I-17.885 J-20.818 E.01961
G1 X124.289 Y114.964 E.04307
G2 X123.107 Y115.965 I3.378 J5.183 E.02711
G3 X121.383 Y116.005 I-.899 J-1.59 E.03136
G3 X120.349 Y115.076 I22.17 J-25.723 E.02428
G2 X118.624 Y115.036 I-.899 J1.59 E.03136
G2 X117.59 Y115.965 I22.188 J25.743 E.02428
G3 X115.866 Y116.005 I-.899 J-1.59 E.03136
G3 X114.831 Y115.076 I22.17 J-25.723 E.02428
G2 X113.107 Y115.036 I-.899 J1.59 E.03136
G2 X112.072 Y115.965 I22.188 J25.743 E.02428
G3 X110.348 Y116.005 I-.899 J-1.59 E.03136
G3 X109.512 Y115.256 I17.846 J-20.775 E.0196
G1 X109.511 Y117.723 E.04306
G3 X110.693 Y118.724 I-3.377 J5.182 E.02711
G2 X112.417 Y118.764 I.899 J-1.59 E.03136
G2 X113.452 Y117.835 I-22.188 J-25.743 E.02428
G3 X115.176 Y117.795 I.899 J1.591 E.03136
G3 X116.21 Y118.724 I-22.17 J25.723 E.02428
G2 X117.935 Y118.764 I.899 J-1.59 E.03136
G2 X118.969 Y117.835 I-22.196 J-25.752 E.02428
G3 X120.693 Y117.795 I.899 J1.591 E.03136
G3 X121.728 Y118.724 I-22.17 J25.723 E.02428
G2 X123.452 Y118.764 I.899 J-1.59 E.03136
G2 X124.289 Y118.015 I-17.878 J-20.81 E.0196
G1 X124.288 Y120.482 E.04307
G2 X123.107 Y121.483 I3.384 J5.189 E.0271
G3 X121.383 Y121.523 I-.899 J-1.591 E.03136
G3 X120.349 Y120.594 I22.188 J-25.743 E.02428
G2 X118.624 Y120.554 I-.899 J1.59 E.03136
G2 X117.59 Y121.483 I22.188 J25.743 E.02428
G3 X115.866 Y121.523 I-.899 J-1.591 E.03136
G3 X114.831 Y120.594 I22.188 J-25.743 E.02428
G2 X113.107 Y120.554 I-.899 J1.59 E.03136
G2 X112.072 Y121.483 I22.188 J25.743 E.02428
G3 X110.348 Y121.523 I-.899 J-1.591 E.03136
G3 X109.511 Y120.774 I17.877 J-20.81 E.01961
G1 X109.511 Y123.24 E.04307
G3 X110.693 Y124.242 I-3.371 J5.176 E.02712
G2 X112.417 Y124.282 I1.234 J-16.069 E.03013
G2 X113.452 Y123.352 I-22.17 J-25.723 E.02428
G3 X115.176 Y123.313 I.899 J1.59 E.03136
G3 X116.21 Y124.242 I-22.188 J25.743 E.02428
G2 X117.935 Y124.282 I1.226 J-15.709 E.03013
G2 X118.969 Y123.352 I-22.178 J-25.732 E.02428
G3 X120.693 Y123.313 I.899 J1.59 E.03136
G3 X121.728 Y124.242 I-22.188 J25.743 E.02428
G2 X123.452 Y124.282 I1.218 J-15.358 E.03013
G2 X124.288 Y123.533 I-17.856 J-20.786 E.01959
G1 X124.288 Y121.819 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X124.288 Y123.533 E-.65138
G1 X124.075 Y123.724 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 13/83
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.071 J1.215 P1  F42000
G1 X149.102 Y122.26 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.7 F42000
G1 X130.052 Y125.948 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.726 Y126.256 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.982 I.279 J-.26 E.00523
G1 X129.624 Y104.013 E.3836
G3 X130.012 Y103.624 I.383 J-.006 E.01071
G1 X152.01 Y103.624 E.38407
G1 X152.073 Y103.631 E.00112
G3 X152.376 Y103.992 I-.08 J.374 E.00885
G1 X152.376 Y125.988 E.38406
G3 X151.981 Y126.377 I-.383 J.006 E.01082
G1 X130.012 Y126.377 E.38359
G3 X129.77 Y126.296 I-.008 J-.381 E.00454
M204 S250
G1 X129.445 Y126.559 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.363 Y126.463 E.00204
G3 X129.21 Y125.994 I.644 J-.47 E.00814
G1 X129.21 Y104.004 E.35707
G3 X130.004 Y103.21 I.8 J.006 E.02022
G1 X152.025 Y103.211 E.35757
G3 X152.789 Y103.971 I-.035 J.8 E.01921
G1 X152.79 Y125.996 E.35763
G3 X151.994 Y126.79 I-.8 J-.006 E.02025
G1 X130.004 Y126.79 E.35707
G3 X129.489 Y126.599 I.003 J-.797 E.0091
; WIPE_START
M204 S6000
G1 X129.363 Y126.463 E-.07044
G1 X129.272 Y126.306 E-.06913
G1 X129.225 Y126.153 E-.06081
G1 X129.21 Y125.994 E-.06055
G1 X129.21 Y124.681 E-.49907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 13 start: 83,94,105,116
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.7
M73 P53 R14
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


; object ids of this layer13 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.683 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.743 E.32137
M204 S10000
G1 X151.135 Y105.683 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.743 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.4616
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432701
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27869
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27869
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
M73 P53 R13
G1 X131.681 Y106.684 E.27869
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27869
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01181
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431896
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.475 J-1.205 E.02375
G2 X149.316 Y105.27 I-.212 J111.353 E.02375
G1 X132.684 Y105.269 E.27814
G2 X131.263 Y105.263 I-1.216 J109.412 E.02376
G2 X131.269 Y106.684 I108.78 J.21 E.02376
G1 X131.269 Y123.316 E.27814
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27814
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27714
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.7 F42000
G1 X149.052 Y148.21 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.7 F42000
G1 X130.052 Y151.948 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.053 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.726 Y152.256 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.982 I.279 J-.26 E.00523
G1 X129.624 Y130.012 E.3836
G3 X130.012 Y129.624 I.383 J-.006 E.01071
G1 X152.01 Y129.624 E.38407
G1 X152.073 Y129.631 E.00112
G3 X152.376 Y129.992 I-.08 J.374 E.00885
G1 X152.376 Y151.988 E.38406
G3 X151.981 Y152.376 I-.383 J.006 E.01082
G1 X130.012 Y152.376 E.38359
G3 X129.77 Y152.296 I-.008 J-.381 E.00454
M204 S250
G1 X129.445 Y152.559 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.363 Y152.463 E.00204
G3 X129.21 Y151.994 I.644 J-.47 E.00814
G1 X129.21 Y130.004 E.35707
G3 X130.004 Y129.21 I.8 J.006 E.02022
G1 X152.025 Y129.211 E.35757
G3 X152.789 Y129.971 I-.035 J.8 E.01921
G1 X152.79 Y151.996 E.35763
G3 X151.994 Y152.79 I-.8 J-.006 E.02025
G1 X130.004 Y152.79 E.35707
G3 X129.489 Y152.599 I.003 J-.797 E.0091
; WIPE_START
M204 S6000
G1 X129.363 Y152.463 E-.07044
G1 X129.272 Y152.306 E-.06913
G1 X129.225 Y152.153 E-.06081
G1 X129.21 Y151.994 E-.06055
G1 X129.21 Y150.681 E-.49907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.026 Y145.738 Z1.7 F42000
G1 X151.534 Y131.712 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.5202
G1 F14436.38
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.45676
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29322
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01366
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.45449
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.769 J-1.244 E.02595
G2 X149.266 Y131.282 I-.226 J39.717 E.02594
G1 X132.734 Y131.282 E.29169
G2 X131.263 Y131.263 I-1.248 J39.545 E.02596
G2 X131.282 Y132.734 I39.488 J.225 E.02596
G1 X131.282 Y149.266 E.29169
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29169
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29063
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
M73 P54 R13
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52094
G1 F14414.992
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.7 F42000
G1 X123.152 Y148.31 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.7 F42000
G1 X104.052 Y151.948 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.053 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.726 Y152.256 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.982 I.279 J-.26 E.00523
G1 X103.624 Y130.012 E.3836
G3 X104.012 Y129.624 I.383 J-.006 E.01071
G1 X126.01 Y129.624 E.38407
G1 X126.073 Y129.631 E.00112
G3 X126.376 Y129.992 I-.08 J.374 E.00885
G1 X126.377 Y151.988 E.38406
G3 X125.982 Y152.376 I-.383 J.006 E.01082
G1 X104.012 Y152.376 E.38359
G3 X103.77 Y152.296 I-.008 J-.381 E.00454
M204 S250
G1 X103.445 Y152.559 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.363 Y152.463 E.00204
G3 X103.21 Y151.994 I.644 J-.47 E.00814
G1 X103.21 Y130.004 E.35707
G3 X104.004 Y129.21 I.8 J.006 E.02022
G1 X126.025 Y129.211 E.35757
G3 X126.789 Y129.971 I-.035 J.8 E.01921
G1 X126.79 Y151.996 E.35763
G3 X125.994 Y152.79 I-.8 J-.006 E.02025
G1 X104.004 Y152.79 E.35707
G3 X103.489 Y152.599 I.003 J-.797 E.0091
; WIPE_START
M204 S6000
G1 X103.363 Y152.463 E-.07044
G1 X103.272 Y152.306 E-.06913
G1 X103.225 Y152.153 E-.06081
G1 X103.21 Y151.994 E-.06055
G1 X103.21 Y150.681 E-.49907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.019 Y145.73 Z1.7 F42000
G1 X125.534 Y131.653 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01927
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.40302
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.40862
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26395
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26395
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26395
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26395
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409017
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.767 J-1.181 E.02164
G1 X106.634 Y131.257 E.28585
G3 X105.263 Y131.263 I-1.17 J-111.843 E.02165
G1 X105.257 Y149.366 E.28587
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28587
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26327
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.542 Y125.731 Z1.7 F42000
G1 X124.278 Y109.13 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.674 Y109.585 I-.05 J.444 E.01158
G1 X124.666 Y124.315 E.25719
G3 X124.209 Y124.674 I-.435 J-.084 E.01105
G1 X109.484 Y124.666 E.25709
G3 X109.126 Y124.209 I.084 J-.435 E.01105
G1 X109.135 Y109.484 E.2571
G3 X109.551 Y109.127 I.437 J.089 E.01031
G1 X124.218 Y109.13 E.25608
M204 S10000
G1 X124.321 Y108.703 F42000
G1 F6000
M204 S6000
G3 X125.102 Y109.577 I-.099 J.874 E.0224
G1 X125.101 Y124.267 E.25649
G3 X124.22 Y125.102 I-.87 J-.035 E.02346
G1 X109.533 Y125.101 E.25643
G3 X108.698 Y124.22 I.035 J-.87 E.02346
G1 X108.699 Y109.533 E.25644
G3 X109.533 Y108.699 I.877 J.043 E.02257
G1 X124.261 Y108.703 E.25716
M204 S250
G1 X124.375 Y108.293 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.61 Y108.343 E.0039
G3 X125.516 Y109.569 I-.393 J1.238 E.02644
G1 X125.515 Y124.285 E.23896
G3 X124.23 Y125.516 I-1.284 J-.053 E.03191
G1 X109.515 Y125.515 E.23894
G3 X108.284 Y124.23 I.053 J-1.284 E.03191
G1 X108.285 Y109.515 E.23895
G3 X109.515 Y108.285 I1.295 J.066 E.03094
G1 X124.316 Y108.291 E.24033
; WIPE_START
M204 S6000
G1 X124.61 Y108.343 E-.11374
G1 X124.804 Y108.418 E-.07887
G1 X125.017 Y108.551 E-.09555
G1 X125.2 Y108.723 E-.09526
G1 X125.322 Y108.888 E-.07819
G1 X125.431 Y109.108 E-.09324
G1 X125.498 Y109.351 E-.09577
G1 X125.516 Y109.569 E-.08301
G1 X125.516 Y109.638 E-.02637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.612 Y109.496 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X124.226 Y109.496 E.02818
G3 X124.297 Y109.555 I-.009 J.082 E.0017
G2 X123.107 Y110.499 I7.187 J10.273 E.02653
G3 X121.038 Y110.083 I-.751 J-1.615 E.03944
G1 X120.309 Y109.495 E.01635
G1 X118.86 Y109.495 E.02529
G2 X117.59 Y110.499 I7.636 J10.967 E.02829
G3 X115.521 Y110.083 I-.751 J-1.615 E.03944
G1 X114.788 Y109.495 E.0164
G1 X113.344 Y109.495 E.02522
G2 X112.072 Y110.499 I7.643 J10.978 E.02831
G3 X110.003 Y110.083 I-.751 J-1.615 E.03944
G1 X109.494 Y109.658 E.01158
G1 X109.494 Y112.307 E.04625
G3 X110.693 Y113.258 I-7.241 J10.357 E.02674
G2 X112.762 Y112.842 I.751 J-1.615 E.03944
G1 X113.452 Y112.266 E.01569
G3 X115.521 Y112.682 I.751 J1.615 E.03944
G1 X116.21 Y113.258 E.01569
G2 X118.279 Y112.842 I.751 J-1.615 E.03944
G1 X118.969 Y112.266 E.01569
G3 X121.038 Y112.682 I.751 J1.615 E.03944
G1 X121.728 Y113.258 E.01569
G2 X123.797 Y112.842 I.751 J-1.615 E.03944
G1 X124.307 Y112.416 E.0116
G1 X124.307 Y115.065 E.04626
G2 X123.107 Y116.017 I7.245 J10.363 E.02675
G3 X121.038 Y115.6 I-.751 J-1.615 E.03944
G1 X120.349 Y115.024 E.01569
G2 X118.279 Y115.441 I-.751 J1.615 E.03944
G1 X117.59 Y116.017 E.01569
G3 X115.521 Y115.6 I-.751 J-1.615 E.03944
G1 X114.831 Y115.024 E.01569
G2 X112.762 Y115.441 I-.751 J1.615 E.03944
G1 X112.072 Y116.017 E.01569
G3 X110.003 Y115.6 I-.751 J-1.615 E.03944
G1 X109.493 Y115.175 E.01159
G1 X109.493 Y117.824 E.04625
G3 X110.693 Y118.776 I-7.245 J10.362 E.02675
G2 X112.762 Y118.359 I.751 J-1.615 E.03944
G1 X113.452 Y117.783 E.01569
G3 X115.521 Y118.2 I.751 J1.615 E.03944
G1 X116.21 Y118.776 E.01569
G2 X118.279 Y118.359 I.751 J-1.615 E.03944
G1 X118.969 Y117.783 E.01569
G3 X121.038 Y118.2 I.751 J1.615 E.03944
G1 X121.728 Y118.776 E.01569
G2 X123.797 Y118.359 I.751 J-1.615 E.03944
G1 X124.307 Y117.934 E.01159
G1 X124.306 Y120.583 E.04626
G2 X123.107 Y121.535 I7.242 J10.357 E.02674
G3 X121.038 Y121.118 I-.751 J-1.615 E.03944
G1 X120.349 Y120.542 E.01569
G2 X118.279 Y120.959 I-.751 J1.615 E.03944
G1 X117.59 Y121.535 E.01569
G3 X115.521 Y121.118 I-.751 J-1.615 E.03944
G1 X114.831 Y120.542 E.01569
G2 X112.762 Y120.959 I-.751 J1.615 E.03944
G1 X112.072 Y121.535 E.01569
G3 X110.003 Y121.118 I-.751 J-1.615 E.03944
G1 X109.493 Y120.692 E.0116
G1 X109.493 Y123.341 E.04626
G2 X110.738 Y124.306 I143.539 J-183.942 E.02751
G1 X112.179 Y124.306 E.02517
G2 X113.452 Y123.301 I-7.648 J-10.986 E.02833
G3 X115.521 Y123.717 I.751 J1.615 E.03944
G1 X116.257 Y124.307 E.01647
G1 X117.696 Y124.307 E.02512
G2 X118.969 Y123.301 I-7.653 J-10.994 E.02835
G3 X121.038 Y123.717 I.751 J1.615 E.03944
G1 X121.777 Y124.307 E.0165
G1 X123.213 Y124.307 E.02508
G2 X124.306 Y123.452 I-6.503 J-9.434 E.02425
G1 X124.306 Y121.738 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.306 Y123.452 E-.65138
G1 X124.081 Y123.628 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 14/83
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I.066 J1.215 P1  F42000
G1 X149.102 Y122.26 Z1.7
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
G1 X149.102 Y106.898 E.28293
G1 X149.102 Y122.2 E.26718
M204 S10000
G1 X148.674 Y122.26 F42000
G1 F6000
M204 S6000
G1 X148.674 Y122.674 E.00722
G1 X133.326 Y122.674 E.26796
G1 X133.326 Y107.326 E.26796
G1 X148.674 Y107.326 E.26796
G1 X148.674 Y122.2 E.2597
M204 S250
G1 X148.26 Y122.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.823 Y123.924 Z1.8 F42000
G1 X130.052 Y125.948 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y104.052 E.38231
G1 X151.947 Y104.053 E.3823
G1 X151.948 Y125.948 E.3823
G1 X130.112 Y125.948 E.38126
M204 S10000
G1 X129.745 Y126.275 F42000
G1 F6000
M204 S6000
G3 X129.624 Y125.988 I.258 J-.279 E.00562
G1 X129.624 Y104.012 E.3837
G3 X130.018 Y103.624 I.383 J-.006 E.01082
G1 X152.012 Y103.624 E.38401
G1 X152.044 Y103.627 E.00057
G3 X152.376 Y103.991 I-.045 J.374 E.00938
G1 X152.376 Y125.988 E.38407
G3 X151.988 Y126.377 I-.383 J.006 E.01071
G1 X130.012 Y126.377 E.3837
G3 X129.793 Y126.313 I-.009 J-.38 E.00406
M204 S250
G1 X129.428 Y126.543 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.423 Y126.536 E.00013
G3 X129.21 Y125.996 I.583 J-.542 E.00965
G1 X129.21 Y104.004 E.3571
G3 X130.006 Y103.21 I.799 J.005 E.02025
G1 X152.027 Y103.211 E.35758
G3 X152.789 Y103.971 I-.038 J.8 E.01917
G1 X152.79 Y125.996 E.35764
G3 X151.996 Y126.79 I-.8 J-.006 E.02022
G1 X130.004 Y126.79 E.3571
G3 X129.59 Y126.673 I.002 J-.796 E.00708
M73 P55 R13
G1 X129.474 Y126.58 E.0024
; WIPE_START
M204 S6000
G1 X129.423 Y126.536 E-.0257
G1 X129.271 Y126.304 E-.10562
G1 X129.226 Y126.154 E-.05931
G1 X129.21 Y125.996 E-.06044
G1 X129.21 Y124.657 E-.50893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 14 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer14 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.534 Y105.683 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y104.466 E.01975
G1 X130.466 Y104.466 E.3421
G1 X130.466 Y125.534 E.34211
G1 X151.534 Y125.534 E.34211
G1 X151.534 Y105.743 E.32137
M204 S10000
G1 X151.135 Y105.683 F42000
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
G1 X151.135 Y105.743 E.3149
M204 S10000
G1 X150.345 Y105.635 F42000
; LINE_WIDTH: 0.46158
G1 F15000
M204 S6000
G2 X150.34 Y105.73 I-.028 J.046 E.00397
M204 S10000
G1 X150.319 Y106.684 F42000
; LINE_WIDTH: 0.432696
G1 F15000
M204 S6000
G1 X150.319 Y123.316 E.27869
G1 X150.309 Y123.49 E.00292
G1 X150.021 Y124.021 E.01011
G1 X149.49 Y124.309 E.01011
G1 X149.316 Y124.319 E.00292
G1 X132.684 Y124.319 E.27869
G1 X131.979 Y124.021 E.01282
G1 X131.691 Y123.49 E.01011
G1 X131.681 Y123.316 E.00292
G1 X131.681 Y106.684 E.27869
G1 X131.979 Y105.979 E.01282
G1 X132.51 Y105.691 E.01011
G1 X132.684 Y105.681 E.00292
G1 X149.316 Y105.681 E.27869
G1 X150.021 Y105.979 E.01282
G1 X150.296 Y106.628 E.01181
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431891
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.468 J-1.205 E.02375
G2 X149.316 Y105.27 I-.215 J110.939 E.02375
G1 X132.684 Y105.269 E.27814
G2 X131.263 Y105.263 I-1.214 J109.011 E.02376
G2 X131.269 Y106.684 I108.944 J.21 E.02376
G1 X131.269 Y123.316 E.27814
G2 X131.263 Y124.737 I108.946 J1.211 E.02376
G2 X132.684 Y124.731 I.21 J-108.953 E.02376
G1 X149.316 Y124.731 E.27814
G2 X150.737 Y124.737 I1.211 J-108.77 E.02376
G3 X150.731 Y123.316 I22.974 J-.817 E.02377
G1 X150.73 Y106.744 E.27714
M204 S10000
G1 X150.345 Y124.27 F42000
; LINE_WIDTH: 0.46236
G1 F15000
M204 S6000
G2 X150.34 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X131.71 Y124.27 F42000
; LINE_WIDTH: 0.46238
G1 F15000
M204 S6000
G2 X131.705 Y124.365 I-.028 J.046 E.00399
M204 S10000
G1 X132.086 Y123.316 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.086 Y106.684 E.27007
G1 X132.261 Y106.261 E.00743
G1 X132.58 Y106.095 E.00585
G1 X132.684 Y106.086 E.00168
G1 X149.316 Y106.086 E.27007
G1 X149.739 Y106.261 E.00743
G1 X149.914 Y106.684 E.00743
G1 X149.914 Y123.316 E.27007
G1 X149.905 Y123.42 E.00168
G1 X149.739 Y123.739 E.00585
G1 X149.42 Y123.905 E.00585
G1 X149.316 Y123.914 E.00168
G1 X132.684 Y123.914 E.27007
G1 X132.261 Y123.739 E.00743
G1 X132.095 Y123.42 E.00585
G1 X132.091 Y123.376 E.00071
M204 S10000
G1 X132.484 Y123.316 F42000
G1 F15000
M204 S6000
G1 X132.484 Y106.684 E.27007
G1 X132.543 Y106.543 E.00248
G1 X132.684 Y106.484 E.00248
G1 X149.316 Y106.484 E.27007
G1 X149.457 Y106.543 E.00248
G1 X149.516 Y106.684 E.00248
G1 X149.516 Y123.316 E.27007
G1 X149.457 Y123.457 E.00248
G1 X149.316 Y123.516 E.00248
G1 X132.684 Y123.516 E.27007
G1 X132.543 Y123.457 E.00248
G1 X132.507 Y123.372 E.0015
M204 S10000
G1 X131.71 Y105.635 F42000
; LINE_WIDTH: 0.46234
G1 F15000
M204 S6000
G2 X131.705 Y105.73 I-.028 J.046 E.00399
; OBJECT_ID: 83
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.589 Y112.703 Z1.8 F42000
G1 X149.052 Y148.21 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.052 Y149.052 E.0147
G1 X132.948 Y149.052 E.28118
G1 X132.948 Y132.948 E.28118
G1 X149.052 Y132.948 E.28118
G1 X149.052 Y148.15 E.26543
M204 S10000
G1 X148.624 Y148.21 F42000
G1 F6000
M204 S6000
G1 X148.624 Y148.624 E.00722
G1 X133.376 Y148.624 E.26622
G1 X133.376 Y133.376 E.26622
G1 X148.624 Y133.376 E.26622
G1 X148.624 Y148.15 E.25795
M204 S250
G1 X148.21 Y148.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.779 Y149.901 Z1.8 F42000
G1 X130.052 Y151.948 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.052 Y130.052 E.38231
G1 X151.947 Y130.053 E.3823
G1 X151.948 Y151.948 E.3823
G1 X130.112 Y151.948 E.38126
M204 S10000
G1 X129.745 Y152.275 F42000
G1 F6000
M204 S6000
G3 X129.624 Y151.988 I.258 J-.279 E.00562
G1 X129.624 Y130.012 E.3837
G3 X130.018 Y129.624 I.383 J-.006 E.01082
G1 X152.012 Y129.624 E.38401
G1 X152.044 Y129.627 E.00057
G3 X152.376 Y129.991 I-.045 J.374 E.00938
G1 X152.376 Y151.988 E.38407
G3 X151.988 Y152.376 I-.383 J.006 E.01071
G1 X130.012 Y152.376 E.3837
G3 X129.793 Y152.313 I-.009 J-.38 E.00406
M204 S250
G1 X129.428 Y152.543 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.423 Y152.536 E.00013
G3 X129.21 Y151.996 I.583 J-.542 E.00965
G1 X129.21 Y130.004 E.3571
G3 X130.006 Y129.21 I.799 J.005 E.02025
G1 X152.027 Y129.211 E.35758
G3 X152.789 Y129.971 I-.038 J.8 E.01917
G1 X152.79 Y151.996 E.35764
G3 X151.996 Y152.79 I-.8 J-.006 E.02022
G1 X130.004 Y152.79 E.3571
G3 X129.59 Y152.673 I.002 J-.796 E.00708
G1 X129.474 Y152.58 E.0024
; WIPE_START
M204 S6000
G1 X129.423 Y152.536 E-.0257
G1 X129.271 Y152.304 E-.10562
G1 X129.226 Y152.154 E-.05931
G1 X129.21 Y151.996 E-.06044
G1 X129.21 Y150.657 E-.50893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.029 Y145.718 Z1.8 F42000
G1 X151.534 Y131.712 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
G1 X151.135 Y131.712 F42000
G1 F15000
M204 S6000
G1 X151.135 Y130.865 E.01376
G1 X130.864 Y130.864 E.32915
G1 X130.864 Y151.136 E.32916
G1 X151.136 Y151.136 E.32916
G1 X151.135 Y131.772 E.31443
M204 S10000
G1 X150.319 Y131.658 F42000
; LINE_WIDTH: 0.52018
G1 F14436.959
M204 S6000
G2 X150.32 Y131.764 I-.026 J.053 E.00488
M204 S10000
G1 X150.282 Y132.734 F42000
; LINE_WIDTH: 0.456755
G1 F15000
M204 S6000
G1 X150.282 Y149.266 E.29322
G1 X150.271 Y149.443 E.00313
G1 X149.971 Y149.971 E.01078
G1 X149.443 Y150.271 E.01078
G1 X149.266 Y150.282 E.00313
G1 X132.734 Y150.282 E.29322
G1 X132.029 Y149.971 E.01366
G1 X131.729 Y149.443 E.01078
G1 X131.718 Y149.266 E.00313
G1 X131.718 Y132.734 E.29322
G1 X132.029 Y132.029 E.01366
G1 X132.557 Y131.729 E.01078
G1 X132.734 Y131.718 E.00313
G1 X149.266 Y131.718 E.29322
G1 X149.971 Y132.029 E.01366
G1 X150.257 Y132.679 E.01259
M204 S10000
G1 X150.718 Y132.734 F42000
; LINE_WIDTH: 0.454486
G1 F15000
M204 S6000
G2 X150.737 Y131.263 I-39.766 J-1.244 E.02595
G2 X149.266 Y131.282 I-.225 J39.787 E.02594
G1 X132.734 Y131.282 E.29169
G2 X131.263 Y131.263 I-1.247 J39.498 E.02596
G2 X131.282 Y132.734 I39.508 J.225 E.02596
G1 X131.282 Y149.266 E.29169
G2 X131.263 Y150.737 I39.491 J1.247 E.02596
G2 X132.734 Y150.718 I.225 J-39.511 E.02596
G1 X149.266 Y150.718 E.29169
G2 X150.737 Y150.737 I1.246 J-39.488 E.02596
G3 X150.718 Y149.266 I18.11 J-.97 E.02596
G1 X150.718 Y132.794 E.29063
M204 S10000
G1 X150.32 Y150.234 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X150.321 Y150.34 I-.026 J.053 E.0049
M204 S10000
G1 X131.743 Y150.234 F42000
; LINE_WIDTH: 0.52096
G1 F14414.416
M204 S6000
G2 X131.744 Y150.34 I-.026 J.053 E.0049
M204 S10000
M73 P56 R13
G1 X132.136 Y149.266 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.136 Y132.734 E.26845
G1 X132.311 Y132.311 E.00743
G1 X132.63 Y132.145 E.00585
G1 X132.734 Y132.136 E.00168
G1 X149.266 Y132.136 E.26845
G1 X149.689 Y132.311 E.00743
G1 X149.864 Y132.734 E.00743
G1 X149.864 Y149.266 E.26845
G1 X149.855 Y149.37 E.00168
G1 X149.689 Y149.689 E.00585
G1 X149.37 Y149.855 E.00585
G1 X149.266 Y149.864 E.00168
G1 X132.734 Y149.864 E.26845
G1 X132.311 Y149.689 E.00743
G1 X132.145 Y149.37 E.00585
G1 X132.141 Y149.326 E.00071
M204 S10000
G1 X132.534 Y149.266 F42000
G1 F15000
M204 S6000
G1 X132.534 Y132.734 E.26845
G1 X132.593 Y132.593 E.00248
G1 X132.734 Y132.534 E.00248
G1 X149.266 Y132.534 E.26845
G1 X149.407 Y132.593 E.00248
G1 X149.466 Y132.734 E.00248
G1 X149.466 Y149.266 E.26845
G1 X149.407 Y149.407 E.00248
G1 X149.266 Y149.466 E.00248
G1 X132.734 Y149.466 E.26845
G1 X132.593 Y149.407 E.00248
G1 X132.557 Y149.322 E.0015
M204 S10000
G1 X131.743 Y131.658 F42000
; LINE_WIDTH: 0.52092
G1 F14415.569
M204 S6000
G2 X131.744 Y131.764 I-.026 J.053 E.0049
; OBJECT_ID: 105
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X128.244 Y138.441 Z1.8 F42000
G1 X123.152 Y148.31 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.152 Y149.152 E.0147
G1 X106.848 Y149.152 E.28468
G1 X106.848 Y132.848 E.28468
G1 X123.152 Y132.848 E.28468
G1 X123.152 Y148.25 E.26892
M204 S10000
G1 X122.724 Y148.31 F42000
G1 F6000
M204 S6000
G1 X122.724 Y148.724 E.00722
G1 X107.276 Y148.724 E.26971
G1 X107.276 Y133.276 E.26971
G1 X122.724 Y133.276 E.26971
G1 X122.724 Y148.25 E.26144
M204 S250
G1 X122.31 Y148.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.867 Y149.947 Z1.8 F42000
G1 X104.052 Y151.948 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X104.052 Y130.052 E.38231
G1 X125.947 Y130.053 E.3823
G1 X125.948 Y151.948 E.3823
G1 X104.112 Y151.948 E.38126
M204 S10000
G1 X103.745 Y152.275 F42000
G1 F6000
M204 S6000
G3 X103.624 Y151.988 I.258 J-.279 E.00562
G1 X103.624 Y130.012 E.3837
G3 X104.018 Y129.624 I.383 J-.006 E.01082
G1 X126.012 Y129.624 E.38401
G1 X126.044 Y129.627 E.00057
G3 X126.376 Y129.991 I-.045 J.374 E.00938
G1 X126.377 Y151.988 E.38407
G3 X125.988 Y152.376 I-.383 J.006 E.01071
G1 X104.012 Y152.376 E.3837
G3 X103.793 Y152.313 I-.009 J-.38 E.00406
M204 S250
G1 X103.428 Y152.543 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.423 Y152.536 E.00013
G3 X103.21 Y151.996 I.583 J-.542 E.00965
G1 X103.21 Y130.004 E.3571
G3 X104.006 Y129.21 I.799 J.005 E.02025
G1 X126.027 Y129.211 E.35758
G3 X126.789 Y129.971 I-.038 J.8 E.01917
G1 X126.79 Y151.996 E.35764
G3 X125.996 Y152.79 I-.8 J-.006 E.02022
G1 X104.004 Y152.79 E.3571
G3 X103.59 Y152.673 I.002 J-.796 E.00708
G1 X103.474 Y152.58 E.0024
; WIPE_START
M204 S6000
G1 X103.423 Y152.536 E-.0257
G1 X103.271 Y152.304 E-.10562
G1 X103.226 Y152.154 E-.05931
G1 X103.21 Y151.996 E-.06044
G1 X103.21 Y150.657 E-.50893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.022 Y145.709 Z1.8 F42000
G1 X125.534 Y131.653 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X125.534 Y130.466 E.01927
G1 X104.466 Y130.466 E.3421
G1 X104.466 Y151.534 E.34211
G1 X125.534 Y151.534 E.34211
G1 X125.534 Y131.713 E.32185
M204 S10000
G1 X125.135 Y131.653 F42000
G1 F15000
M204 S6000
G1 X125.135 Y130.865 E.0128
G1 X104.864 Y130.864 E.32915
G1 X104.864 Y151.136 E.32916
G1 X125.136 Y151.136 E.32916
G1 X125.135 Y131.713 E.31538
M204 S10000
G1 X124.37 Y131.612 F42000
; LINE_WIDTH: 0.403
G1 F15000
M204 S6000
G1 X124.299 Y131.653 E.00128
G1 X124.36 Y131.688 E.00109
M204 S10000
G1 X124.357 Y132.634 F42000
; LINE_WIDTH: 0.408616
G1 F15000
M204 S6000
G1 X124.357 Y149.366 E.26394
G1 X124.346 Y149.538 E.00272
G1 X124.071 Y150.071 E.00946
G1 X123.538 Y150.346 E.00946
G1 X123.366 Y150.357 E.00272
G1 X106.634 Y150.357 E.26394
G1 X105.929 Y150.071 E.01199
G1 X105.654 Y149.538 E.00946
G1 X105.643 Y149.366 E.00272
G1 X105.643 Y132.634 E.26394
G1 X105.929 Y131.929 E.01199
G1 X106.462 Y131.654 E.00946
G1 X106.634 Y131.643 E.00272
G1 X123.366 Y131.643 E.26394
G1 X124.071 Y131.929 E.01199
G1 X124.334 Y132.578 E.01105
M204 S10000
G1 X124.743 Y132.634 F42000
; LINE_WIDTH: 0.409013
G1 F15000
M204 S6000
G3 X124.737 Y131.263 I109.759 J-1.181 E.02164
G1 X106.634 Y131.257 E.28585
G3 X105.263 Y131.263 I-1.173 J-112.5 E.02165
G1 X105.257 Y149.366 E.28586
G3 X105.263 Y150.737 I-112.595 J1.176 E.02165
G1 X123.366 Y150.743 E.28586
G3 X124.737 Y150.737 I1.176 J112.774 E.02165
G3 X124.743 Y149.366 I33.548 J-.54 E.02165
G1 X124.743 Y132.694 E.26327
M204 S10000
G1 X124.371 Y150.306 F42000
; LINE_WIDTH: 0.40378
G1 F15000
M204 S6000
M73 P56 R12
G1 X124.299 Y150.347 E.00129
G1 X124.36 Y150.382 E.0011
M204 S10000
G1 X105.677 Y150.306 F42000
; LINE_WIDTH: 0.4038
G1 F15000
M204 S6000
G1 X105.605 Y150.347 E.00129
G1 X105.666 Y150.382 E.0011
M204 S10000
G1 X106.036 Y149.366 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X106.036 Y132.634 E.2717
G1 X106.211 Y132.211 E.00743
G1 X106.53 Y132.045 E.00585
G1 X106.634 Y132.036 E.00168
G1 X123.366 Y132.036 E.2717
G1 X123.789 Y132.211 E.00743
G1 X123.964 Y132.634 E.00743
G1 X123.964 Y149.366 E.2717
G1 X123.955 Y149.47 E.00168
G1 X123.789 Y149.789 E.00585
G1 X123.47 Y149.955 E.00585
G1 X123.366 Y149.964 E.00168
G1 X106.634 Y149.964 E.2717
G1 X106.211 Y149.789 E.00743
G1 X106.045 Y149.47 E.00585
G1 X106.041 Y149.426 E.00071
M204 S10000
G1 X106.434 Y149.366 F42000
G1 F15000
M204 S6000
G1 X106.434 Y132.634 E.2717
G1 X106.493 Y132.493 E.00248
G1 X106.634 Y132.434 E.00248
G1 X123.366 Y132.434 E.2717
G1 X123.507 Y132.493 E.00248
G1 X123.566 Y132.634 E.00248
G1 X123.566 Y149.366 E.2717
G1 X123.507 Y149.507 E.00248
G1 X123.366 Y149.566 E.00248
G1 X106.634 Y149.566 E.2717
G1 X106.493 Y149.507 E.00248
G1 X106.457 Y149.422 E.0015
M204 S10000
G1 X105.677 Y131.612 F42000
; LINE_WIDTH: 0.40376
G1 F15000
M204 S6000
G1 X105.605 Y131.653 E.00129
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 116
; WIPE_START
G1 X105.605 Y131.653 E-.34973
G1 X105.677 Y131.612 E-.41027
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X110.543 Y125.732 Z1.8 F42000
G1 X124.298 Y109.112 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.314 Y109.114 E.00028
G3 X124.692 Y109.575 I-.071 J.444 E.01138
G1 X124.683 Y124.328 E.25761
G3 X124.22 Y124.692 I-.442 J-.086 E.01122
G1 X109.471 Y124.683 E.25751
G3 X109.108 Y124.22 I.087 J-.442 E.01121
G1 X109.117 Y109.471 E.25751
G3 X109.539 Y109.109 I.444 J.091 E.01046
G1 X124.238 Y109.112 E.25664
M204 S10000
G1 X124.338 Y108.685 F42000
G1 F6000
M204 S6000
G3 X125.12 Y109.566 I-.106 J.882 E.0225
G1 X125.119 Y124.279 E.25689
G3 X124.23 Y125.12 I-.877 J-.036 E.02364
G1 X109.521 Y125.119 E.25683
G3 X108.68 Y124.23 I.036 J-.877 E.02364
G1 X108.681 Y109.52 E.25684
G3 X109.521 Y108.681 I.884 J.045 E.02273
G1 X124.278 Y108.685 E.25766
M204 S250
G1 X124.383 Y108.274 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.58 Y108.313 E.00327
G3 X125.534 Y109.558 I-.352 J1.258 E.02732
G1 X125.533 Y124.297 E.23933
G3 X124.241 Y125.534 I-1.291 J-.055 E.03208
G1 X109.503 Y125.533 E.23931
G3 X108.266 Y124.241 I.055 J-1.291 E.03208
G1 X108.267 Y109.502 E.23932
G3 X109.503 Y108.267 I1.303 J.068 E.03108
G1 X124.323 Y108.273 E.24064
; WIPE_START
M204 S6000
G1 X124.58 Y108.313 E-.09908
G1 X124.818 Y108.4 E-.09645
G1 X125.033 Y108.535 E-.09613
G1 X125.216 Y108.707 E-.09567
G1 X125.339 Y108.873 E-.07867
G1 X125.449 Y109.094 E-.09343
G1 X125.516 Y109.338 E-.09636
G1 X125.534 Y109.558 E-.0837
G1 X125.534 Y109.612 E-.02052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.902 Y109.54 Z1.8 F42000
G1 X111.132 Y109.476 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X109.581 Y109.476 E.02708
G2 X109.477 Y109.577 I-.001 J.103 E.00281
G3 X110.693 Y110.532 I-29.94 J39.366 E.027
G2 X112.762 Y110.024 I.675 J-1.718 E.03965
G1 X113.449 Y109.477 E.01533
G1 X114.865 Y109.477 E.02473
G3 X116.21 Y110.532 I-33.022 J43.498 E.02985
G2 X118.279 Y110.024 I.675 J-1.718 E.03965
G1 X118.965 Y109.478 E.01531
G1 X120.384 Y109.478 E.02477
G3 X121.728 Y110.532 I-33.009 J43.48 E.02982
G2 X123.797 Y110.024 I.675 J-1.718 E.03965
G1 X124.325 Y109.603 E.01178
G1 X124.325 Y112.334 E.04768
G2 X123.107 Y113.291 I29.983 J39.424 E.02704
G3 X121.038 Y112.782 I-.675 J-1.718 E.03965
G1 X120.349 Y112.233 E.0154
G2 X118.279 Y112.741 I-.675 J1.718 E.03965
G1 X117.59 Y113.291 E.0154
G3 X115.521 Y112.782 I-.675 J-1.718 E.03965
G1 X114.831 Y112.233 E.0154
G2 X112.762 Y112.741 I-.675 J1.718 E.03965
G1 X112.072 Y113.291 E.0154
G3 X110.003 Y112.782 I-.675 J-1.718 E.03965
G1 X109.476 Y112.362 E.01177
G1 X109.475 Y115.093 E.04768
G3 X110.693 Y116.049 I-29.967 J39.403 E.02703
G2 X112.762 Y115.541 I.675 J-1.718 E.03965
G1 X113.452 Y114.992 E.0154
G3 X115.521 Y115.5 I.675 J1.718 E.03965
G1 X116.21 Y116.049 E.0154
G2 X118.279 Y115.541 I.675 J-1.718 E.03965
G1 X118.969 Y114.992 E.0154
G3 X121.038 Y115.5 I.675 J1.718 E.03965
G1 X121.728 Y116.049 E.0154
G2 X123.797 Y115.541 I.675 J-1.718 E.03965
G1 X124.325 Y115.121 E.01178
G1 X124.325 Y117.852 E.04769
G2 X123.107 Y118.808 I29.956 J39.389 E.02703
G3 X121.038 Y118.3 I-.675 J-1.718 E.03965
G1 X120.349 Y117.751 E.0154
G2 X118.279 Y118.259 I-.675 J1.718 E.03965
G1 X117.59 Y118.808 E.0154
G3 X115.521 Y118.3 I-.675 J-1.718 E.03965
G1 X114.831 Y117.751 E.0154
G2 X112.762 Y118.259 I-.675 J1.718 E.03965
G1 X112.072 Y118.808 E.0154
G3 X110.003 Y118.3 I-.675 J-1.718 E.03965
G1 X109.475 Y117.88 E.01178
G1 X109.475 Y120.61 E.04768
G3 X110.693 Y121.567 I-29.976 J39.416 E.02704
G2 X112.762 Y121.059 I.675 J-1.718 E.03965
G1 X113.452 Y120.51 E.0154
G3 X115.521 Y121.018 I.675 J1.718 E.03965
G1 X116.21 Y121.567 E.0154
G2 X118.279 Y121.059 I.675 J-1.718 E.03965
G1 X118.969 Y120.51 E.0154
G3 X121.038 Y121.018 I.675 J1.718 E.03965
G1 X121.728 Y121.567 E.0154
G2 X123.797 Y121.059 I.675 J-1.718 E.03965
G1 X124.324 Y120.639 E.01177
G1 X124.324 Y123.37 E.04769
G2 X123.108 Y124.325 I29.942 J39.37 E.027
G1 X121.696 Y124.325 E.02465
G3 X120.349 Y123.268 I33.097 J-43.597 E.02991
G2 X118.279 Y123.776 I-.675 J1.718 E.03965
G1 X117.591 Y124.325 E.01537
G1 X116.178 Y124.325 E.02467
G3 X114.831 Y123.268 I33.074 J-43.567 E.02989
G2 X112.762 Y123.776 I-.675 J1.718 E.03965
G1 X112.074 Y124.324 E.01535
G1 X110.66 Y124.324 E.02469
G3 X109.475 Y123.397 I29.036 J-38.33 E.02627
G1 X109.475 Y121.683 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.475 Y123.397 E-.65138
G1 X109.7 Y123.573 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 15/83
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S160.65
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I.041 J1.216 P1  F42000
G1 X148.26 Y122.26 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.74 Y122.26 E.23578
G1 X133.74 Y107.74 E.23578
G1 X148.26 Y107.74 E.23578
G1 X148.26 Y122.2 E.2348
; WIPE_START
M204 S6000
G1 X146.26 Y122.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.869 Y124.114 Z1.9 F42000
G1 X129.435 Y126.548 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.364 Y126.463 E.0018
G3 X129.21 Y125.994 I.645 J-.473 E.00815
G1 X129.21 Y104.006 E.35703
G3 X130.006 Y103.21 I.8 J.004 E.02028
G1 X152.03 Y103.211 E.35762
G3 X152.789 Y103.969 I-.04 J.8 E.0191
G1 X152.79 Y125.996 E.35767
G3 X151.996 Y126.79 I-.8 J-.006 E.02022
G1 X130.004 Y126.79 E.3571
G3 X129.479 Y126.588 I.006 J-.8 E.00933
; WIPE_START
M204 S6000
G1 X129.364 Y126.463 E-.06464
G1 X129.27 Y126.301 E-.07106
G1 X129.225 Y126.152 E-.05917
G1 X129.21 Y125.994 E-.06047
G1 X129.21 Y124.666 E-.50466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 15 start: 83,94,105,116
M624 DwAAAAAAAAA=
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


; object ids of this layer15 end: 83,94,105,116
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X151.692 Y103.43 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
M73 P57 R12
G1 F3000
M204 S2000
G1 X152.57 Y104.308 E.02016
G1 X152.57 Y104.871
G1 X151.129 Y103.43 E.0331
G1 X150.565 Y103.43
G1 X152.57 Y105.435 E.04604
G1 X152.57 Y105.999
G1 X150.001 Y103.43 E.05899
G1 X149.438 Y103.43
G1 X152.57 Y106.562 E.07193
G1 X152.57 Y107.126
G1 X148.874 Y103.43 E.08487
G1 X148.311 Y103.43
G1 X152.57 Y107.689 E.09782
G1 X152.57 Y108.253
G1 X147.747 Y103.43 E.11076
G1 X147.183 Y103.43
G1 X152.57 Y108.817 E.12371
G1 X152.57 Y109.38
G1 X146.62 Y103.43 E.13665
G1 X146.056 Y103.43
G1 X152.57 Y109.944 E.14959
G1 X152.57 Y110.508
G1 X145.492 Y103.43 E.16254
G1 X144.929 Y103.43
G1 X152.57 Y111.071 E.17548
G1 X152.57 Y111.635
G1 X148.479 Y107.544 E.09395
G1 X148.479 Y108.107
G1 X152.57 Y112.198 E.09395
G1 X152.57 Y112.762
G1 X148.479 Y108.671 E.09395
G1 X148.479 Y109.235
G1 X152.57 Y113.326 E.09395
G1 X152.57 Y113.889
G1 X148.479 Y109.798 E.09395
G1 X148.479 Y110.362
G1 X152.57 Y114.453 E.09395
G1 X152.57 Y115.017
G1 X148.479 Y110.925 E.09395
G1 X148.479 Y111.489
G1 X152.57 Y115.58 E.09395
G1 X152.57 Y116.144
G1 X148.479 Y112.053 E.09395
G1 X148.479 Y112.616
G1 X152.57 Y116.707 E.09395
G1 X152.571 Y117.271
G1 X148.479 Y113.18 E.09395
G1 X148.479 Y113.743
G1 X152.571 Y117.835 E.09395
G1 X152.571 Y118.398
G1 X148.479 Y114.307 E.09395
G1 X148.479 Y114.871
G1 X152.571 Y118.962 E.09395
G1 X152.571 Y119.526
G1 X148.479 Y115.434 E.09395
G1 X148.479 Y115.998
G1 X152.571 Y120.089 E.09396
G1 X152.571 Y120.653
G1 X148.479 Y116.561 E.09396
G1 X148.479 Y117.125
G1 X152.571 Y121.216 E.09396
G1 X152.571 Y121.78
G1 X148.479 Y117.689 E.09396
G1 X148.479 Y118.252
G1 X152.571 Y122.344 E.09396
G1 X152.571 Y122.907
G1 X148.479 Y118.816 E.09396
G1 X148.479 Y119.379
G1 X152.571 Y123.471 E.09396
G1 X152.571 Y124.035
G1 X148.479 Y119.943 E.09396
G1 X148.479 Y120.507
G1 X152.571 Y124.598 E.09396
G1 X152.571 Y125.162
G1 X148.479 Y121.07 E.09396
G1 X148.479 Y121.634
G1 X152.571 Y125.725 E.09396
G1 X152.514 Y126.232
G1 X148.479 Y122.197 E.09266
G1 X148.197 Y122.479
G1 X152.234 Y126.516 E.09271
G1 X151.725 Y126.571
G1 X147.634 Y122.479 E.09396
G1 X147.07 Y122.479
G1 X151.162 Y126.571 E.09396
G1 X150.598 Y126.571
G1 X146.506 Y122.479 E.09396
G1 X145.943 Y122.479
G1 X150.035 Y126.571 E.09396
G1 X149.471 Y126.571
G1 X145.379 Y122.479 E.09396
G1 X144.816 Y122.479
G1 X148.907 Y126.571 E.09396
G1 X148.344 Y126.571
G1 X144.252 Y122.479 E.09396
G1 X143.688 Y122.479
G1 X147.78 Y126.571 E.09396
G1 X147.216 Y126.571
G1 X143.125 Y122.479 E.09396
G1 X142.561 Y122.479
G1 X146.653 Y126.571 E.09396
G1 X146.089 Y126.571
G1 X141.998 Y122.479 E.09396
G1 X141.434 Y122.479
G1 X145.526 Y126.571 E.09396
G1 X144.962 Y126.571
G1 X140.87 Y122.479 E.09396
G1 X140.307 Y122.479
G1 X144.398 Y126.571 E.09396
G1 X143.835 Y126.571
G1 X139.743 Y122.479 E.09396
G1 X139.18 Y122.479
G1 X143.271 Y126.571 E.09396
G1 X142.708 Y126.571
G1 X138.616 Y122.479 E.09396
G1 X138.052 Y122.479
G1 X142.144 Y126.571 E.09396
G1 X141.58 Y126.571
G1 X137.489 Y122.479 E.09396
G1 X136.925 Y122.479
G1 X141.017 Y126.571 E.09396
G1 X140.453 Y126.571
G1 X136.362 Y122.479 E.09396
G1 X135.798 Y122.479
G1 X139.89 Y126.571 E.09396
G1 X139.326 Y126.571
G1 X135.234 Y122.479 E.09396
G1 X134.671 Y122.479
G1 X138.762 Y126.571 E.09396
G1 X138.199 Y126.571
G1 X134.107 Y122.479 E.09396
G1 X133.544 Y122.479
G1 X137.635 Y126.571 E.09396
; WIPE_START
M204 S6000
G1 X136.221 Y125.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.9 Y118.01 Z1.9 F42000
G1 X144.365 Y103.43 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X148.456 Y107.521 E.09395
G1 X147.893 Y107.521
G1 X143.802 Y103.43 E.09395
G1 X143.238 Y103.43
G1 X147.329 Y107.521 E.09395
G1 X146.765 Y107.521
G1 X142.674 Y103.43 E.09395
G1 X142.111 Y103.43
G1 X146.202 Y107.521 E.09395
G1 X145.638 Y107.521
G1 X141.547 Y103.43 E.09395
G1 X140.983 Y103.43
G1 X145.075 Y107.521 E.09395
G1 X144.511 Y107.521
G1 X140.42 Y103.43 E.09395
G1 X139.856 Y103.43
G1 X143.947 Y107.521 E.09395
G1 X143.384 Y107.521
G1 X139.293 Y103.429 E.09395
G1 X138.729 Y103.429
G1 X142.82 Y107.521 E.09395
G1 X142.257 Y107.521
G1 X138.165 Y103.429 E.09395
G1 X137.602 Y103.429
G1 X141.693 Y107.521 E.09395
G1 X141.129 Y107.521
G1 X137.038 Y103.429 E.09395
G1 X136.474 Y103.429
G1 X140.566 Y107.521 E.09396
G1 X140.002 Y107.521
G1 X135.911 Y103.429 E.09396
G1 X135.347 Y103.429
G1 X139.439 Y107.521 E.09396
G1 X138.875 Y107.521
G1 X134.784 Y103.429 E.09396
G1 X134.22 Y103.429
G1 X138.311 Y107.521 E.09396
G1 X137.748 Y107.521
G1 X133.656 Y103.429 E.09396
G1 X133.093 Y103.429
G1 X137.184 Y107.521 E.09396
G1 X136.621 Y107.521
G1 X132.529 Y103.429 E.09396
G1 X131.965 Y103.429
G1 X136.057 Y107.521 E.09396
G1 X135.493 Y107.521
G1 X131.402 Y103.429 E.09396
G1 X130.838 Y103.429
G1 X134.93 Y107.521 E.09396
G1 X134.366 Y107.521
G1 X130.275 Y103.429 E.09396
G1 X129.766 Y103.484
G1 X133.803 Y107.521 E.09271
G1 X133.521 Y107.803
G1 X129.486 Y103.768 E.09266
G1 X129.429 Y104.275
G1 X133.521 Y108.366 E.09396
G1 X133.521 Y108.93
G1 X129.429 Y104.838 E.09396
G1 X129.429 Y105.402
G1 X133.521 Y109.494 E.09396
G1 X133.521 Y110.057
G1 X129.429 Y105.965 E.09396
G1 X129.429 Y106.529
G1 X133.521 Y110.621 E.09396
G1 X133.521 Y111.184
G1 X129.429 Y107.093 E.09396
G1 X129.429 Y107.656
G1 X133.521 Y111.748 E.09396
G1 X133.521 Y112.312
G1 X129.429 Y108.22 E.09396
G1 X129.429 Y108.784
G1 X133.521 Y112.875 E.09396
G1 X133.521 Y113.439
G1 X129.429 Y109.347 E.09396
M73 P58 R12
G1 X129.429 Y109.911
G1 X133.521 Y114.002 E.09396
G1 X133.521 Y114.566
G1 X129.429 Y110.474 E.09396
G1 X129.429 Y111.038
G1 X133.521 Y115.13 E.09396
G1 X133.521 Y115.693
G1 X129.429 Y111.602 E.09396
G1 X129.429 Y112.165
G1 X133.521 Y116.257 E.09396
G1 X133.521 Y116.82
G1 X129.429 Y112.729 E.09396
G1 X129.429 Y113.292
G1 X133.521 Y117.384 E.09396
G1 X133.521 Y117.948
G1 X129.429 Y113.856 E.09396
G1 X129.429 Y114.42
G1 X133.521 Y118.511 E.09396
G1 X133.521 Y119.075
G1 X129.429 Y114.983 E.09396
G1 X129.429 Y115.547
G1 X133.521 Y119.638 E.09396
G1 X133.521 Y120.202
G1 X129.429 Y116.11 E.09396
G1 X129.429 Y116.674
G1 X133.521 Y120.766 E.09396
G1 X133.521 Y121.329
G1 X129.429 Y117.238 E.09396
G1 X129.429 Y117.801
G1 X133.521 Y121.893 E.09396
G1 X133.521 Y122.456
G1 X129.429 Y118.365 E.09396
G1 X129.429 Y118.928
G1 X137.072 Y126.571 E.1755
G1 X136.508 Y126.571
G1 X129.429 Y119.492 E.16256
G1 X129.429 Y120.056
G1 X135.944 Y126.571 E.14961
G1 X135.381 Y126.571
G1 X129.429 Y120.619 E.13667
G1 X129.429 Y121.183
G1 X134.817 Y126.571 E.12373
G1 X134.254 Y126.571
G1 X129.429 Y121.746 E.11079
G1 X129.429 Y122.31
G1 X133.69 Y126.571 E.09784
G1 X133.126 Y126.571
G1 X129.429 Y122.874 E.0849
G1 X129.429 Y123.437
G1 X132.563 Y126.571 E.07196
G1 X131.999 Y126.571
G1 X129.429 Y124.001 E.05902
G1 X129.429 Y124.564
G1 X131.436 Y126.571 E.04607
G1 X130.872 Y126.571
G1 X129.429 Y125.128 E.03313
G1 X129.429 Y125.692
G1 X130.308 Y126.571 E.02019
; WIPE_START
M204 S6000
G1 X129.429 Y125.692 E-.47245
G1 X129.429 Y125.128 E-.21417
G1 X129.566 Y125.265 E-.07338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.189 Y125.639 Z1.9 F42000
G1 X152.404 Y126.386 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0748798
G1 F15000
M204 S6000
G3 X152.303 Y126.477 I-.645 J-.61 E.0003
; WIPE_START
G1 X152.404 Y126.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.771 Y126.453 Z1.9 F42000
G1 X129.954 Y126.585 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.204874
G1 F15000
M204 S6000
G3 X129.414 Y126.037 I.954 J-1.481 E.00579
; WIPE_START
G1 X129.662 Y126.35 E-.39122
G1 X129.954 Y126.585 E-.36878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.869 Y118.953 Z1.9 F42000
G1 X129.697 Y103.523 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0749449
G1 F15000
M204 S6000
G2 X129.596 Y103.614 I.534 J.69 E.0003
; LINE_WIDTH: 0.0680851
G1 X129.611 Y103.621 E.00003
; LINE_WIDTH: 0.0407542
G1 X129.625 Y103.628 E.00001
; WIPE_START
G1 X129.611 Y103.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.242 Y103.735 Z1.9 F42000
G1 X152.584 Y103.964 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.206898
G1 F15000
M204 S6000
G2 X152.031 Y103.412 I-1.493 J.942 E.00595
; OBJECT_ID: 83
; WIPE_START
G1 X152.345 Y103.657 E-.38435
G1 X152.584 Y103.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X151.833 Y111.559 Z1.9 F42000
G1 X148.21 Y148.21 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.79 Y148.21 E.23415
G1 X133.79 Y133.79 E.23415
G1 X148.21 Y133.79 E.23415
G1 X148.21 Y148.15 E.23318
; WIPE_START
M204 S6000
G1 X146.21 Y148.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.826 Y150.09 Z1.9 F42000
G1 X129.435 Y152.548 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.364 Y152.463 E.0018
G3 X129.21 Y151.994 I.645 J-.473 E.00815
G1 X129.21 Y130.006 E.35703
G3 X130.006 Y129.21 I.8 J.004 E.02028
G1 X152.03 Y129.211 E.35762
G3 X152.789 Y129.969 I-.04 J.8 E.0191
G1 X152.79 Y151.996 E.35767
G3 X151.996 Y152.79 I-.8 J-.006 E.02022
G1 X130.004 Y152.79 E.3571
G3 X129.479 Y152.588 I.006 J-.8 E.00933
; WIPE_START
M204 S6000
G1 X129.364 Y152.463 E-.06464
G1 X129.27 Y152.301 E-.07106
G1 X129.225 Y152.152 E-.05917
G1 X129.21 Y151.994 E-.06047
G1 X129.21 Y150.666 E-.50466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.759 Y145.425 Z1.9 F42000
G1 X151.692 Y129.43 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X152.57 Y130.308 E.02016
G1 X152.57 Y130.871
G1 X151.129 Y129.43 E.0331
G1 X150.565 Y129.43
G1 X152.57 Y131.435 E.04604
G1 X152.57 Y131.999
G1 X150.001 Y129.43 E.05899
G1 X149.438 Y129.43
G1 X152.57 Y132.562 E.07193
G1 X152.57 Y133.126
G1 X148.874 Y129.43 E.08487
G1 X148.311 Y129.43
G1 X152.57 Y133.689 E.09782
G1 X152.57 Y134.253
G1 X147.747 Y129.43 E.11076
G1 X147.183 Y129.43
G1 X152.57 Y134.817 E.12371
G1 X152.57 Y135.38
G1 X146.62 Y129.43 E.13665
G1 X146.056 Y129.43
G1 X152.57 Y135.944 E.14959
G1 X152.57 Y136.508
G1 X145.492 Y129.43 E.16254
G1 X144.929 Y129.43
G1 X152.57 Y137.071 E.17548
G1 X152.57 Y137.635
G1 X144.365 Y129.43 E.18842
G1 X143.802 Y129.43
G1 X147.943 Y133.571 E.0951
G1 X147.379 Y133.571
G1 X143.238 Y129.43 E.0951
G1 X142.674 Y129.43
G1 X146.815 Y133.571 E.0951
G1 X146.252 Y133.571
G1 X142.111 Y129.43 E.0951
G1 X141.547 Y129.43
G1 X145.688 Y133.571 E.0951
G1 X145.125 Y133.571
G1 X140.983 Y129.43 E.0951
G1 X140.42 Y129.43
G1 X144.561 Y133.571 E.0951
G1 X143.997 Y133.571
G1 X139.856 Y129.43 E.0951
G1 X139.293 Y129.429
G1 X143.434 Y133.571 E.0951
G1 X142.87 Y133.571
G1 X138.729 Y129.429 E.0951
G1 X138.165 Y129.429
G1 X142.307 Y133.571 E.0951
G1 X141.743 Y133.571
G1 X137.602 Y129.429 E.0951
G1 X137.038 Y129.429
G1 X141.179 Y133.571 E.0951
G1 X140.616 Y133.571
G1 X136.474 Y129.429 E.0951
G1 X135.911 Y129.429
G1 X140.052 Y133.571 E.0951
G1 X139.489 Y133.571
G1 X135.347 Y129.429 E.0951
G1 X134.784 Y129.429
G1 X138.925 Y133.571 E.0951
G1 X138.361 Y133.571
G1 X134.22 Y129.429 E.09511
G1 X133.656 Y129.429
G1 X137.798 Y133.571 E.09511
G1 X137.234 Y133.571
G1 X133.093 Y129.429 E.09511
G1 X132.529 Y129.429
G1 X136.671 Y133.571 E.09511
G1 X136.107 Y133.571
G1 X131.965 Y129.429 E.09511
G1 X131.402 Y129.429
G1 X135.543 Y133.571 E.09511
G1 X134.98 Y133.571
G1 X130.838 Y129.429 E.09511
G1 X130.275 Y129.429
G1 X134.416 Y133.571 E.09511
G1 X133.853 Y133.571
G1 X129.766 Y129.484 E.09385
G1 X129.486 Y129.768
G1 X133.571 Y133.853 E.09381
G1 X133.571 Y134.416
G1 X129.429 Y130.275 E.09511
G1 X129.429 Y130.838
G1 X133.571 Y134.98 E.09511
G1 X133.571 Y135.543
G1 X129.429 Y131.402 E.09511
G1 X129.429 Y131.965
G1 X133.571 Y136.107 E.09511
G1 X133.571 Y136.671
G1 X129.429 Y132.529 E.09511
G1 X129.429 Y133.093
G1 X133.571 Y137.234 E.09511
G1 X133.571 Y137.798
G1 X129.429 Y133.656 E.09511
G1 X129.429 Y134.22
G1 X133.571 Y138.362 E.09511
G1 X133.571 Y138.925
G1 X129.429 Y134.783 E.09511
G1 X129.429 Y135.347
G1 X133.571 Y139.489 E.09511
G1 X133.571 Y140.052
G1 X129.429 Y135.911 E.09511
G1 X129.429 Y136.474
G1 X133.571 Y140.616 E.09511
G1 X133.571 Y141.18
G1 X129.429 Y137.038 E.09511
G1 X129.429 Y137.602
G1 X133.571 Y141.743 E.09511
G1 X133.571 Y142.307
G1 X129.429 Y138.165 E.09511
G1 X129.429 Y138.729
M73 P59 R12
G1 X133.571 Y142.87 E.09511
G1 X133.571 Y143.434
G1 X129.429 Y139.292 E.09511
G1 X129.429 Y139.856
G1 X133.571 Y143.998 E.09511
G1 X133.571 Y144.561
G1 X129.429 Y140.42 E.09511
G1 X129.429 Y140.983
G1 X133.571 Y145.125 E.09511
G1 X133.571 Y145.688
G1 X129.429 Y141.547 E.09511
G1 X129.429 Y142.11
G1 X133.571 Y146.252 E.09511
G1 X133.571 Y146.816
G1 X129.429 Y142.674 E.09511
G1 X129.429 Y143.238
G1 X133.571 Y147.379 E.09511
G1 X133.571 Y147.943
G1 X129.429 Y143.801 E.09511
; WIPE_START
M204 S6000
G1 X130.843 Y145.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.288 Y141.126 Z1.9 F42000
G1 X148.429 Y134.057 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X152.57 Y138.198 E.0951
G1 X152.57 Y138.762
G1 X148.429 Y134.621 E.0951
G1 X148.429 Y135.184
G1 X152.57 Y139.326 E.0951
G1 X152.57 Y139.889
G1 X148.429 Y135.748 E.0951
G1 X148.429 Y136.312
G1 X152.57 Y140.453 E.0951
G1 X152.57 Y141.017
G1 X148.429 Y136.875 E.0951
G1 X148.429 Y137.439
G1 X152.57 Y141.58 E.0951
G1 X152.57 Y142.144
G1 X148.429 Y138.003 E.0951
G1 X148.429 Y138.566
G1 X152.57 Y142.707 E.0951
G1 X152.571 Y143.271
G1 X148.429 Y139.13 E.0951
G1 X148.429 Y139.693
G1 X152.571 Y143.835 E.0951
G1 X152.571 Y144.398
G1 X148.429 Y140.257 E.0951
G1 X148.429 Y140.821
G1 X152.571 Y144.962 E.0951
G1 X152.571 Y145.526
G1 X148.429 Y141.384 E.0951
G1 X148.429 Y141.948
G1 X152.571 Y146.089 E.0951
G1 X152.571 Y146.653
G1 X148.429 Y142.511 E.0951
G1 X148.429 Y143.075
G1 X152.571 Y147.216 E.0951
G1 X152.571 Y147.78
G1 X148.429 Y143.639 E.0951
G1 X148.429 Y144.202
G1 X152.571 Y148.344 E.09511
G1 X152.571 Y148.907
G1 X148.429 Y144.766 E.09511
G1 X148.429 Y145.329
G1 X152.571 Y149.471 E.09511
G1 X152.571 Y150.035
G1 X148.429 Y145.893 E.09511
G1 X148.429 Y146.457
G1 X152.571 Y150.598 E.09511
G1 X152.571 Y151.162
G1 X148.429 Y147.02 E.09511
G1 X148.429 Y147.584
G1 X152.571 Y151.725 E.09511
G1 X152.514 Y152.232
G1 X148.429 Y148.147 E.09381
G1 X148.147 Y148.429
G1 X152.234 Y152.516 E.09386
G1 X151.725 Y152.571
G1 X147.584 Y148.429 E.09511
G1 X147.02 Y148.429
G1 X151.162 Y152.571 E.09511
G1 X150.598 Y152.571
G1 X146.456 Y148.429 E.09511
G1 X145.893 Y148.429
G1 X150.035 Y152.571 E.09511
G1 X149.471 Y152.571
G1 X145.329 Y148.429 E.09511
G1 X144.766 Y148.429
G1 X148.907 Y152.571 E.09511
G1 X148.344 Y152.571
G1 X144.202 Y148.429 E.09511
G1 X143.638 Y148.429
G1 X147.78 Y152.571 E.09511
G1 X147.216 Y152.571
G1 X143.075 Y148.429 E.09511
G1 X142.511 Y148.429
G1 X146.653 Y152.571 E.09511
G1 X146.089 Y152.571
G1 X141.948 Y148.429 E.09511
G1 X141.384 Y148.429
G1 X145.526 Y152.571 E.09511
G1 X144.962 Y152.571
G1 X140.82 Y148.429 E.09511
G1 X140.257 Y148.429
G1 X144.398 Y152.571 E.09511
G1 X143.835 Y152.571
G1 X139.693 Y148.429 E.09511
G1 X139.13 Y148.429
G1 X143.271 Y152.571 E.09511
G1 X142.708 Y152.571
G1 X138.566 Y148.429 E.09511
G1 X138.002 Y148.429
G1 X142.144 Y152.571 E.09511
G1 X141.58 Y152.571
G1 X137.439 Y148.429 E.09511
G1 X136.875 Y148.429
G1 X141.017 Y152.571 E.09511
G1 X140.453 Y152.571
G1 X136.312 Y148.429 E.09511
G1 X135.748 Y148.429
G1 X139.89 Y152.571 E.09511
G1 X139.326 Y152.571
G1 X135.184 Y148.429 E.09511
G1 X134.621 Y148.429
G1 X138.762 Y152.571 E.09511
G1 X138.199 Y152.571
G1 X134.057 Y148.429 E.09511
; WIPE_START
M204 S6000
G1 X135.471 Y149.843 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.635 Y152.571 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X129.429 Y144.365 E.18844
G1 X129.429 Y144.928
G1 X137.072 Y152.571 E.1755
G1 X136.508 Y152.571
G1 X129.429 Y145.492 E.16256
G1 X129.429 Y146.056
G1 X135.944 Y152.571 E.14961
G1 X135.381 Y152.571
G1 X129.429 Y146.619 E.13667
G1 X129.429 Y147.183
G1 X134.817 Y152.571 E.12373
G1 X134.254 Y152.571
G1 X129.429 Y147.746 E.11079
G1 X129.429 Y148.31
G1 X133.69 Y152.571 E.09784
G1 X133.126 Y152.571
G1 X129.429 Y148.874 E.0849
G1 X129.429 Y149.437
G1 X132.563 Y152.571 E.07196
G1 X131.999 Y152.571
G1 X129.429 Y150.001 E.05902
G1 X129.429 Y150.564
G1 X131.436 Y152.571 E.04607
G1 X130.872 Y152.571
G1 X129.429 Y151.128 E.03313
G1 X129.429 Y151.692
G1 X130.308 Y152.571 E.02019
; WIPE_START
M204 S6000
G1 X129.429 Y151.692 E-.47245
G1 X129.429 Y151.128 E-.21417
G1 X129.566 Y151.265 E-.07338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.189 Y151.639 Z1.9 F42000
G1 X152.404 Y152.386 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0748798
G1 F15000
M204 S6000
G3 X152.303 Y152.477 I-.645 J-.61 E.0003
; WIPE_START
G1 X152.404 Y152.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.771 Y152.453 Z1.9 F42000
G1 X129.954 Y152.585 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.204874
G1 F15000
M204 S6000
G3 X129.414 Y152.037 I.954 J-1.481 E.00579
; WIPE_START
G1 X129.662 Y152.35 E-.39122
G1 X129.954 Y152.585 E-.36878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.352 Y147.189 Z1.9 F42000
G1 X152.584 Y129.964 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.206898
G1 F15000
M204 S6000
G2 X152.031 Y129.412 I-1.493 J.942 E.00595
; OBJECT_ID: 105
; WIPE_START
G1 X152.345 Y129.657 E-.38435
G1 X152.584 Y129.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.057 Y133.919 Z1.9 F42000
G1 X122.31 Y148.31 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.69 Y148.31 E.2374
G1 X107.69 Y133.69 E.2374
G1 X122.31 Y133.69 E.2374
G1 X122.31 Y148.25 E.23642
; WIPE_START
M204 S6000
G1 X120.31 Y148.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.913 Y150.138 Z1.9 F42000
M73 P59 R11
G1 X103.435 Y152.548 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.364 Y152.463 E.0018
G3 X103.21 Y151.994 I.645 J-.473 E.00815
G1 X103.21 Y130.006 E.35703
G3 X104.006 Y129.21 I.8 J.004 E.02028
G1 X126.03 Y129.211 E.35762
G3 X126.789 Y129.969 I-.04 J.8 E.0191
G1 X126.79 Y151.996 E.35767
G3 X125.996 Y152.79 I-.8 J-.006 E.02022
G1 X104.004 Y152.79 E.3571
G3 X103.479 Y152.588 I.006 J-.8 E.00933
; WIPE_START
M204 S6000
G1 X103.364 Y152.463 E-.06464
G1 X103.27 Y152.301 E-.07106
G1 X103.225 Y152.152 E-.05917
G1 X103.21 Y151.994 E-.06047
G1 X103.21 Y150.666 E-.50466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.759 Y145.425 Z1.9 F42000
G1 X125.692 Y129.43 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X126.57 Y130.308 E.02016
G1 X126.57 Y130.871
G1 X125.129 Y129.43 E.0331
G1 X124.565 Y129.43
G1 X126.57 Y131.435 E.04604
G1 X126.57 Y131.999
G1 X124.001 Y129.43 E.05899
G1 X123.438 Y129.43
G1 X126.57 Y132.562 E.07193
G1 X126.57 Y133.126
G1 X122.874 Y129.43 E.08487
G1 X122.311 Y129.43
G1 X126.57 Y133.689 E.09782
G1 X126.57 Y134.253
G1 X121.747 Y129.43 E.11076
G1 X121.183 Y129.43
G1 X126.57 Y134.817 E.12371
G1 X126.57 Y135.38
G1 X120.62 Y129.43 E.13665
G1 X120.056 Y129.43
G1 X126.57 Y135.944 E.14959
G1 X126.57 Y136.508
M73 P60 R11
G1 X119.492 Y129.43 E.16254
G1 X118.929 Y129.43
G1 X126.57 Y137.071 E.17548
G1 X126.57 Y137.635
G1 X122.529 Y133.594 E.0928
G1 X122.529 Y134.157
G1 X126.57 Y138.198 E.0928
G1 X126.57 Y138.762
G1 X122.529 Y134.721 E.0928
G1 X122.529 Y135.284
G1 X126.57 Y139.326 E.0928
G1 X126.57 Y139.889
G1 X122.529 Y135.848 E.0928
G1 X122.529 Y136.412
G1 X126.57 Y140.453 E.0928
G1 X126.57 Y141.017
G1 X122.529 Y136.975 E.0928
G1 X122.529 Y137.539
G1 X126.57 Y141.58 E.0928
G1 X126.57 Y142.144
G1 X122.529 Y138.103 E.0928
G1 X122.529 Y138.666
G1 X126.571 Y142.707 E.0928
G1 X126.571 Y143.271
G1 X122.529 Y139.23 E.0928
G1 X122.529 Y139.793
G1 X126.571 Y143.835 E.09281
G1 X126.571 Y144.398
G1 X122.529 Y140.357 E.09281
G1 X122.529 Y140.921
G1 X126.571 Y144.962 E.09281
G1 X126.571 Y145.526
G1 X122.529 Y141.484 E.09281
G1 X122.529 Y142.048
G1 X126.571 Y146.089 E.09281
G1 X126.571 Y146.653
G1 X122.529 Y142.611 E.09281
G1 X122.529 Y143.175
G1 X126.571 Y147.216 E.09281
G1 X126.571 Y147.78
G1 X122.529 Y143.739 E.09281
G1 X122.529 Y144.302
G1 X126.571 Y148.344 E.09281
G1 X126.571 Y148.907
G1 X122.529 Y144.866 E.09281
G1 X122.529 Y145.429
G1 X126.571 Y149.471 E.09281
G1 X126.571 Y150.035
G1 X122.529 Y145.993 E.09281
G1 X122.529 Y146.557
G1 X126.571 Y150.598 E.09281
G1 X126.571 Y151.162
G1 X122.529 Y147.12 E.09281
G1 X122.529 Y147.684
G1 X126.571 Y151.725 E.09281
G1 X126.514 Y152.232
G1 X122.529 Y148.247 E.09151
G1 X122.247 Y148.529
G1 X126.234 Y152.516 E.09156
G1 X125.725 Y152.571
G1 X121.684 Y148.529 E.09281
G1 X121.12 Y148.529
G1 X125.162 Y152.571 E.09281
G1 X124.598 Y152.571
G1 X120.557 Y148.529 E.09281
G1 X119.993 Y148.529
G1 X124.035 Y152.571 E.09281
G1 X123.471 Y152.571
G1 X119.429 Y148.529 E.09281
G1 X118.866 Y148.529
G1 X122.907 Y152.571 E.09281
G1 X122.344 Y152.571
G1 X118.302 Y148.529 E.09281
G1 X117.738 Y148.529
G1 X121.78 Y152.571 E.09281
G1 X121.217 Y152.571
G1 X117.175 Y148.529 E.09281
G1 X116.611 Y148.529
G1 X120.653 Y152.571 E.09281
G1 X120.089 Y152.571
G1 X116.048 Y148.529 E.09281
G1 X115.484 Y148.529
G1 X119.526 Y152.571 E.09281
G1 X118.962 Y152.571
G1 X114.92 Y148.529 E.09281
G1 X114.357 Y148.529
G1 X118.398 Y152.571 E.09281
G1 X117.835 Y152.571
G1 X113.793 Y148.529 E.09281
G1 X113.23 Y148.529
G1 X117.271 Y152.571 E.09281
G1 X116.708 Y152.571
G1 X112.666 Y148.529 E.09281
G1 X112.102 Y148.529
G1 X116.144 Y152.571 E.09281
G1 X115.58 Y152.571
G1 X111.539 Y148.529 E.09281
G1 X110.975 Y148.529
G1 X115.017 Y152.571 E.09281
G1 X114.453 Y152.571
G1 X110.412 Y148.529 E.09281
G1 X109.848 Y148.529
G1 X113.89 Y152.571 E.09281
G1 X113.326 Y152.571
G1 X109.284 Y148.529 E.09281
G1 X108.721 Y148.529
G1 X112.762 Y152.571 E.09281
G1 X112.199 Y152.571
G1 X108.157 Y148.529 E.09281
G1 X107.594 Y148.529
G1 X111.635 Y152.571 E.09281
; WIPE_START
M204 S6000
G1 X110.221 Y151.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.9 Y144.01 Z1.9 F42000
G1 X118.365 Y129.43 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X122.406 Y133.471 E.0928
G1 X121.843 Y133.471
G1 X117.802 Y129.43 E.0928
G1 X117.238 Y129.43
G1 X121.279 Y133.471 E.0928
G1 X120.716 Y133.471
G1 X116.674 Y129.43 E.0928
G1 X116.111 Y129.43
G1 X120.152 Y133.471 E.0928
G1 X119.588 Y133.471
G1 X115.547 Y129.43 E.0928
G1 X114.983 Y129.43
G1 X119.025 Y133.471 E.0928
G1 X118.461 Y133.471
G1 X114.42 Y129.43 E.0928
G1 X113.856 Y129.43
G1 X117.897 Y133.471 E.0928
G1 X117.334 Y133.471
G1 X113.293 Y129.429 E.0928
G1 X112.729 Y129.429
G1 X116.77 Y133.471 E.09281
G1 X116.207 Y133.471
G1 X112.165 Y129.429 E.09281
G1 X111.602 Y129.429
G1 X115.643 Y133.471 E.09281
G1 X115.079 Y133.471
G1 X111.038 Y129.429 E.09281
G1 X110.474 Y129.429
G1 X114.516 Y133.471 E.09281
G1 X113.952 Y133.471
G1 X109.911 Y129.429 E.09281
G1 X109.347 Y129.429
G1 X113.389 Y133.471 E.09281
G1 X112.825 Y133.471
G1 X108.784 Y129.429 E.09281
G1 X108.22 Y129.429
G1 X112.261 Y133.471 E.09281
G1 X111.698 Y133.471
G1 X107.656 Y129.429 E.09281
G1 X107.093 Y129.429
G1 X111.134 Y133.471 E.09281
G1 X110.571 Y133.471
G1 X106.529 Y129.429 E.09281
G1 X105.965 Y129.429
G1 X110.007 Y133.471 E.09281
G1 X109.443 Y133.471
G1 X105.402 Y129.429 E.09281
G1 X104.838 Y129.429
G1 X108.88 Y133.471 E.09281
G1 X108.316 Y133.471
G1 X104.275 Y129.429 E.09281
G1 X103.766 Y129.484
G1 X107.753 Y133.471 E.09156
G1 X107.471 Y133.753
G1 X103.486 Y129.768 E.09151
G1 X103.429 Y130.275
G1 X107.471 Y134.316 E.09281
G1 X107.471 Y134.88
G1 X103.429 Y130.838 E.09281
G1 X103.429 Y131.402
G1 X107.471 Y135.443 E.09281
G1 X107.471 Y136.007
G1 X103.429 Y131.965 E.09281
G1 X103.429 Y132.529
G1 X107.471 Y136.571 E.09281
G1 X107.471 Y137.134
G1 X103.429 Y133.093 E.09281
G1 X103.429 Y133.656
G1 X107.471 Y137.698 E.09281
G1 X107.471 Y138.262
G1 X103.429 Y134.22 E.09281
G1 X103.429 Y134.783
G1 X107.471 Y138.825 E.09281
G1 X107.471 Y139.389
G1 X103.429 Y135.347 E.09281
G1 X103.429 Y135.911
G1 X107.471 Y139.952 E.09281
G1 X107.471 Y140.516
G1 X103.429 Y136.474 E.09281
G1 X103.429 Y137.038
G1 X107.471 Y141.08 E.09281
G1 X107.471 Y141.643
G1 X103.429 Y137.602 E.09281
G1 X103.429 Y138.165
G1 X107.471 Y142.207 E.09281
G1 X107.471 Y142.77
G1 X103.429 Y138.729 E.09281
G1 X103.429 Y139.292
G1 X107.471 Y143.334 E.09281
G1 X107.471 Y143.898
G1 X103.429 Y139.856 E.09281
G1 X103.429 Y140.42
G1 X107.471 Y144.461 E.09281
G1 X107.471 Y145.025
G1 X103.429 Y140.983 E.09281
G1 X103.429 Y141.547
G1 X107.471 Y145.588 E.09281
G1 X107.471 Y146.152
G1 X103.429 Y142.11 E.09281
G1 X103.429 Y142.674
G1 X107.471 Y146.716 E.09281
G1 X107.471 Y147.279
G1 X103.429 Y143.238 E.09281
G1 X103.429 Y143.801
G1 X107.471 Y147.843 E.09281
G1 X107.471 Y148.406
G1 X103.429 Y144.365 E.09281
G1 X103.429 Y144.928
G1 X111.072 Y152.571 E.1755
G1 X110.508 Y152.571
G1 X103.429 Y145.492 E.16256
G1 X103.429 Y146.056
G1 X109.944 Y152.571 E.14961
M73 P61 R11
G1 X109.381 Y152.571
G1 X103.429 Y146.619 E.13667
G1 X103.429 Y147.183
G1 X108.817 Y152.571 E.12373
G1 X108.254 Y152.571
G1 X103.429 Y147.746 E.11079
G1 X103.429 Y148.31
G1 X107.69 Y152.571 E.09784
G1 X107.126 Y152.571
G1 X103.429 Y148.874 E.0849
G1 X103.429 Y149.437
G1 X106.563 Y152.571 E.07196
G1 X105.999 Y152.571
G1 X103.429 Y150.001 E.05902
G1 X103.429 Y150.564
G1 X105.436 Y152.571 E.04607
G1 X104.872 Y152.571
G1 X103.429 Y151.128 E.03313
G1 X103.429 Y151.692
G1 X104.308 Y152.571 E.02019
; WIPE_START
M204 S6000
G1 X103.429 Y151.692 E-.47245
G1 X103.429 Y151.128 E-.21417
G1 X103.566 Y151.265 E-.07338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.586 Y148.537 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145529
G1 F15000
M204 S6000
G1 X107.453 Y148.569 E.00069
G1 X107.431 Y148.547 E.00016
G1 X107.463 Y148.414 E.00069
; WIPE_START
G1 X107.431 Y148.547 E-.3411
G1 X107.453 Y148.569 E-.07781
G1 X107.586 Y148.537 E-.3411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.983 Y143.14 Z1.9 F42000
G1 X122.537 Y133.586 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.145549
G1 F15000
M204 S6000
G1 X122.569 Y133.453 E.00069
G1 X122.547 Y133.431 E.00016
G1 X122.414 Y133.463 E.00069
; WIPE_START
G1 X122.547 Y133.431 E-.34083
G1 X122.569 Y133.453 E-.07834
G1 X122.537 Y133.586 E-.34083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.075 Y141.062 Z1.9 F42000
G1 X126.404 Y152.386 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0748798
G1 F15000
M204 S6000
G3 X126.303 Y152.477 I-.645 J-.61 E.0003
; WIPE_START
G1 X126.404 Y152.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.772 Y152.453 Z1.9 F42000
G1 X103.954 Y152.585 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.204874
G1 F15000
M204 S6000
G3 X103.414 Y152.037 I.954 J-1.481 E.00579
; WIPE_START
G1 X103.662 Y152.35 E-.39122
G1 X103.954 Y152.585 E-.36878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.869 Y144.953 Z1.9 F42000
G1 X103.697 Y129.523 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0749449
G1 F15000
M204 S6000
G2 X103.596 Y129.614 I.534 J.69 E.0003
; LINE_WIDTH: 0.0680851
G1 X103.611 Y129.621 E.00003
; LINE_WIDTH: 0.0407542
G1 X103.625 Y129.628 E.00001
; WIPE_START
G1 X103.611 Y129.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.242 Y129.735 Z1.9 F42000
G1 X126.584 Y129.964 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.206898
G1 F15000
M204 S6000
G2 X126.031 Y129.412 I-1.493 J.942 E.00595
; OBJECT_ID: 116
; WIPE_START
G1 X126.345 Y129.657 E-.38435
G1 X126.584 Y129.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.757 Y122.376 Z1.9 F42000
G1 X124.309 Y109.094 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.326 Y109.096 E.00029
G3 X124.71 Y109.564 I-.073 J.451 E.01155
G1 X124.701 Y124.341 E.25801
G3 X124.23 Y124.71 I-.449 J-.088 E.01139
G1 X109.459 Y124.701 E.25791
G3 X109.09 Y124.23 I.088 J-.449 E.01139
G1 X109.099 Y109.458 E.25792
G3 X109.527 Y109.091 I.451 J.093 E.0106
G1 X124.249 Y109.094 E.25705
M204 S10000
G1 X124.35 Y108.667 F42000
G1 F6000
M204 S6000
G3 X125.139 Y109.555 I-.106 J.889 E.02268
G1 X125.137 Y124.291 E.25729
G3 X124.241 Y125.139 I-.884 J-.038 E.02382
G1 X109.509 Y125.137 E.25723
G3 X108.661 Y124.241 I.038 J-.884 E.02382
G1 X108.663 Y109.509 E.25724
G3 X109.509 Y108.663 I.891 J.046 E.02288
G1 X124.29 Y108.667 E.25808
M204 S250
G1 X124.385 Y108.255 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.389 Y108.255 E.00007
G3 X125.552 Y109.547 I-.15 J1.305 E.03085
G1 X125.551 Y124.309 E.2397
G3 X124.252 Y125.552 I-1.298 J-.056 E.03224
G1 X109.491 Y125.551 E.23969
G3 X108.248 Y124.252 I.056 J-1.298 E.03224
G1 X108.249 Y109.49 E.2397
G3 X109.491 Y108.249 I1.31 J.069 E.03122
G1 X124.325 Y108.255 E.24087
; WIPE_START
M204 S6000
G1 X124.389 Y108.255 E-.02438
G1 X124.594 Y108.293 E-.07925
G1 X124.833 Y108.383 E-.09708
G1 X125.048 Y108.518 E-.0966
G1 X125.233 Y108.692 E-.09626
G1 X125.356 Y108.859 E-.079
G1 X125.466 Y109.08 E-.09365
G1 X125.533 Y109.326 E-.09691
G1 X125.552 Y109.547 E-.08449
G1 X125.552 Y109.58 E-.01237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.92 Y109.515 Z1.9 F42000
G1 X111.201 Y109.458 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X109.569 Y109.458 E.02848
G2 X109.493 Y109.485 I-.005 J.106 E.00146
G3 X110.693 Y110.478 I-4.708 J6.916 E.02723
G2 X112.417 Y110.432 I.819 J-1.647 E.03135
G3 X113.452 Y109.529 I32.127 J35.761 E.02398
G1 X113.671 Y109.459 E.00403
G1 X114.961 Y109.459 E.02252
G3 X116.21 Y110.478 I-4.058 J6.252 E.0282
G2 X117.935 Y110.432 I.819 J-1.647 E.03135
G3 X118.969 Y109.529 I32.111 J35.743 E.02398
G1 X119.186 Y109.46 E.00397
G1 X120.48 Y109.46 E.0226
G3 X121.728 Y110.478 I-4.076 J6.269 E.02817
G2 X123.452 Y110.432 I.819 J-1.647 E.03135
G3 X124.344 Y109.652 I27.727 J30.816 E.02067
G1 X124.343 Y112.225 E.04492
G2 X123.107 Y113.236 I4.201 J6.393 E.02794
G3 X121.383 Y113.19 I-.819 J-1.647 E.03135
G2 X120.349 Y112.287 I-32.146 J35.782 E.02398
G2 X118.624 Y112.333 I-.819 J1.648 E.03135
G3 X117.59 Y113.236 I-32.146 J-35.782 E.02398
G3 X115.866 Y113.19 I-.819 J-1.647 E.03135
G2 X114.831 Y112.287 I-32.146 J35.782 E.02398
G2 X113.107 Y112.333 I-.819 J1.647 E.03135
G3 X112.072 Y113.236 I-32.146 J-35.782 E.02398
G3 X110.348 Y113.19 I-.819 J-1.647 E.03135
G2 X109.458 Y112.412 I-27.723 J30.812 E.02065
G1 X109.457 Y114.984 E.0449
G3 X110.693 Y115.995 I-4.207 J6.399 E.02792
G2 X112.417 Y115.949 I.819 J-1.647 E.03135
G3 X113.452 Y115.046 I32.181 J35.823 E.02398
G3 X115.176 Y115.092 I.819 J1.648 E.03135
G2 X116.21 Y115.995 I32.146 J-35.782 E.02398
G2 X117.935 Y115.949 I.819 J-1.647 E.03135
G3 X118.969 Y115.046 I32.165 J35.805 E.02398
G3 X120.693 Y115.092 I.819 J1.647 E.03135
G2 X121.728 Y115.995 I32.146 J-35.782 E.02398
G2 X123.452 Y115.949 I.819 J-1.647 E.03135
G3 X124.343 Y115.171 I27.767 J30.861 E.02066
G1 X124.343 Y117.743 E.04491
G2 X123.107 Y118.754 I4.206 J6.398 E.02792
G3 X121.383 Y118.708 I-.819 J-1.647 E.03135
G2 X120.349 Y117.805 I-32.146 J35.782 E.02398
G2 X118.624 Y117.851 I-.819 J1.647 E.03135
G3 X117.59 Y118.754 I-32.181 J-35.823 E.02398
G3 X115.866 Y118.708 I-.819 J-1.647 E.03135
G2 X114.831 Y117.805 I-32.146 J35.782 E.02398
G2 X113.107 Y117.851 I-.819 J1.647 E.03135
G3 X112.072 Y118.754 I-32.181 J-35.823 E.02398
G3 X110.348 Y118.708 I-.819 J-1.647 E.03135
G2 X109.457 Y117.929 I-27.755 J30.848 E.02066
G1 X109.457 Y120.501 E.04491
G3 X110.693 Y121.513 I-4.199 J6.392 E.02794
G2 X112.417 Y121.467 I.819 J-1.647 E.03135
G3 X113.452 Y120.564 I32.146 J35.782 E.02398
G3 X115.176 Y120.61 I.819 J1.647 E.03135
G2 X116.21 Y121.513 I32.146 J-35.782 E.02398
G2 X117.935 Y121.467 I.819 J-1.647 E.03135
G3 X118.969 Y120.564 I32.13 J35.764 E.02398
G3 X120.693 Y120.61 I.819 J1.647 E.03135
G2 X121.728 Y121.513 I32.146 J-35.782 E.02398
G2 X123.452 Y121.467 I.819 J-1.648 E.03135
G3 X124.342 Y120.689 I27.686 J30.77 E.02065
G1 X124.342 Y123.261 E.04491
G2 X123.107 Y124.272 I4.213 J6.405 E.02791
G1 X122.882 Y124.343 E.00414
G1 X121.601 Y124.343 E.02235
G3 X120.349 Y123.323 I4.022 J-6.216 E.02827
G2 X118.624 Y123.369 I-.819 J1.647 E.03135
G3 X117.59 Y124.272 I-32.146 J-35.782 E.02398
G1 X117.366 Y124.343 E.0041
G1 X116.083 Y124.343 E.0224
G3 X114.831 Y123.323 I4.033 J-6.227 E.02825
G2 X113.107 Y123.369 I-.819 J1.647 E.03135
G3 X112.072 Y124.272 I-32.146 J-35.782 E.02398
G1 X111.85 Y124.342 E.00407
G1 X110.564 Y124.342 E.02245
G3 X109.457 Y123.446 I3.525 J-5.492 E.02492
G1 X109.457 Y121.732 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.457 Y123.446 E-.65138
G1 X109.672 Y123.635 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 16/83
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I.858 J.863 P1  F42000
G1 X124.321 Y109.076 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3085
M204 S6000
G1 X124.338 Y109.078 E.00031
G3 X124.728 Y109.554 I-.074 J.458 E.01173
G1 X124.728 Y124.252 E.25663
G3 X124.241 Y124.728 I-.465 J.012 E.01334
G1 X109.549 Y124.728 E.25654
G3 X109.072 Y124.241 I-.012 J-.465 E.01334
G1 X109.072 Y109.543 E.25663
G3 X109.516 Y109.073 I.466 J-.004 E.01246
G1 X124.261 Y109.076 E.25746
M204 S10000
G1 X124.362 Y108.649 F42000
G1 F3085
M204 S6000
G3 X125.157 Y109.545 I-.108 J.896 E.02287
G1 X125.156 Y124.263 E.25698
G3 X124.252 Y125.157 I-.893 J.001 E.0247
G1 X109.537 Y125.156 E.25693
G3 X108.643 Y124.252 I-.001 J-.893 E.0247
G1 X108.644 Y109.534 E.25698
G3 X109.497 Y108.645 I.9 J.01 E.0237
G1 X124.302 Y108.649 E.2585
M204 S250
G1 X124.39 Y108.237 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3085
M204 S5000
G1 X124.401 Y108.237 E.00018
G3 X125.57 Y109.536 I-.151 J1.312 E.03102
G1 X125.57 Y124.274 E.23931
G3 X124.263 Y125.57 I-1.307 J-.011 E.03316
G1 X109.526 Y125.57 E.2393
G3 X108.23 Y124.263 I.011 J-1.307 E.03316
G1 X108.23 Y109.525 E.23931
G3 X109.479 Y108.231 I1.318 J.023 E.03212
G1 X124.33 Y108.237 E.24115
; WIPE_START
G1 F3600
M204 S6000
G1 X124.401 Y108.237 E-.02702
G1 X124.607 Y108.275 E-.07959
G1 X124.847 Y108.366 E-.09759
G1 X125.064 Y108.502 E-.09734
G1 X125.249 Y108.676 E-.09674
G1 X125.374 Y108.844 E-.0794
G1 X125.483 Y109.066 E-.09381
G1 X125.551 Y109.313 E-.09742
G1 X125.57 Y109.536 E-.08521
G1 X125.57 Y109.552 E-.00588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 16 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer16 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X111.29 Y109.44 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3085
M204 S6000
G1 X109.576 Y109.44 E.02993
G3 X110.693 Y110.428 I-3.646 J5.247 E.02609
G1 X111.382 Y110.707 E.01299
G1 X112.072 Y110.686 E.01205
G2 X113.452 Y109.578 I-1.852 J-3.72 E.03113
G1 X113.792 Y109.441 E.00641
G1 X115.096 Y109.441 E.02276
G3 X116.21 Y110.428 I-3.693 J5.294 E.02605
G1 X116.9 Y110.707 E.01299
G1 X117.59 Y110.686 E.01205
G2 X118.969 Y109.578 I-1.852 J-3.72 E.03113
G1 X119.307 Y109.442 E.00637
G1 X120.615 Y109.442 E.02284
G3 X121.728 Y110.428 I-3.744 J5.347 E.02601
G1 X122.418 Y110.707 E.01299
G1 X123.107 Y110.686 E.01205
G2 X124.362 Y109.697 I-1.66 J-3.394 E.0281
G1 X124.362 Y112.136 E.04259
G2 X123.107 Y113.186 I2.211 J3.914 E.02872
G1 X122.418 Y113.466 E.01299
G1 X121.728 Y113.445 E.01205
G3 X120.349 Y112.337 I1.852 J-3.719 E.03113
G1 X119.659 Y112.058 E.01299
G1 X118.969 Y112.079 E.01205
G2 X117.59 Y113.186 I1.852 J3.72 E.03113
G1 X116.9 Y113.466 E.01299
G1 X116.21 Y113.445 E.01205
G3 X114.831 Y112.337 I1.852 J-3.72 E.03113
G1 X114.141 Y112.058 E.01299
G1 X113.452 Y112.079 E.01205
G2 X112.072 Y113.186 I1.852 J3.72 E.03113
G1 X111.382 Y113.466 E.01299
G1 X110.693 Y113.445 E.01205
G3 X109.439 Y112.456 I1.659 J-3.394 E.0281
G1 X109.439 Y114.895 E.04259
G3 X110.693 Y115.945 I-2.212 J3.914 E.02872
G1 X111.382 Y116.224 E.01299
G1 X112.072 Y116.204 E.01205
G2 X113.452 Y115.096 I-1.852 J-3.72 E.03113
G1 X114.141 Y114.817 E.01299
G1 X114.831 Y114.838 E.01205
G3 X116.21 Y115.945 I-1.852 J3.72 E.03113
G1 X116.9 Y116.224 E.01299
G1 X117.59 Y116.204 E.01205
G2 X118.969 Y115.096 I-1.852 J-3.72 E.03113
G1 X119.659 Y114.817 E.01299
G1 X120.349 Y114.838 E.01205
G3 X121.728 Y115.945 I-1.853 J3.72 E.03113
M73 P62 R11
G1 X122.418 Y116.224 E.01299
G1 X123.107 Y116.204 E.01205
G2 X124.361 Y115.215 I-1.659 J-3.394 E.0281
G1 X124.361 Y117.654 E.04259
G2 X123.107 Y118.704 I2.211 J3.914 E.02872
G1 X122.418 Y118.983 E.01299
G1 X121.728 Y118.962 E.01205
G3 X120.349 Y117.855 I1.852 J-3.72 E.03113
G1 X119.659 Y117.576 E.01299
G1 X118.969 Y117.597 E.01205
G2 X117.59 Y118.704 I1.852 J3.719 E.03113
G1 X116.9 Y118.983 E.01299
G1 X116.21 Y118.962 E.01205
G3 X114.831 Y117.855 I1.853 J-3.72 E.03113
G1 X114.141 Y117.576 E.01299
G1 X113.452 Y117.597 E.01205
G2 X112.072 Y118.704 I1.852 J3.72 E.03113
G1 X111.382 Y118.983 E.01299
G1 X110.693 Y118.962 E.01205
G3 X109.439 Y117.973 I1.66 J-3.395 E.0281
G1 X109.438 Y120.412 E.04259
G3 X110.693 Y121.463 I-2.21 J3.913 E.02873
G1 X111.382 Y121.742 E.01299
G1 X112.072 Y121.721 E.01205
G2 X113.452 Y120.614 I-1.852 J-3.72 E.03113
G1 X114.141 Y120.335 E.01299
G1 X114.831 Y120.355 E.01205
G3 X116.21 Y121.463 I-1.852 J3.719 E.03113
G1 X116.9 Y121.742 E.01299
G1 X117.59 Y121.721 E.01205
G2 X118.969 Y120.614 I-1.853 J-3.72 E.03113
G1 X119.659 Y120.335 E.01299
G1 X120.349 Y120.355 E.01205
G3 X121.728 Y121.463 I-1.852 J3.72 E.03113
G1 X122.418 Y121.742 E.01299
G1 X123.107 Y121.721 E.01205
G2 X124.361 Y120.732 I-1.659 J-3.394 E.0281
G1 X124.361 Y123.171 E.04259
G2 X123.107 Y124.222 I2.212 J3.914 E.02872
G1 X122.762 Y124.362 E.00651
G1 X121.468 Y124.362 E.02258
G3 X120.349 Y123.373 I3.573 J-5.173 E.02615
G1 X119.659 Y123.093 E.01299
G1 X118.969 Y123.114 E.01205
G2 X117.59 Y124.222 I1.852 J3.719 E.03113
G1 X117.244 Y124.361 E.00651
G1 X115.95 Y124.361 E.02259
G3 X114.831 Y123.373 I3.578 J-5.179 E.02614
G1 X114.141 Y123.093 E.01299
G1 X113.452 Y123.114 E.01205
G2 X112.072 Y124.222 I1.852 J3.72 E.03113
G1 X111.727 Y124.361 E.0065
G1 X110.433 Y124.361 E.0226
G3 X109.438 Y123.491 I3.198 J-4.655 E.02313
G1 X109.438 Y121.777 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.438 Y123.491 E-.65138
G1 X109.653 Y123.679 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 17/83
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I.859 J.862 P1  F42000
G1 X124.333 Y109.058 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3103
M204 S6000
G1 X124.351 Y109.06 E.00032
G3 X124.746 Y109.543 I-.076 J.465 E.01191
G1 X124.746 Y124.263 E.25701
G3 X124.252 Y124.746 I-.473 J.011 E.01353
G1 X109.537 Y124.746 E.25693
G3 X109.054 Y124.252 I-.011 J-.473 E.01353
G1 X109.054 Y109.532 E.25702
G3 X109.504 Y109.055 I.474 J-.003 E.01262
G1 X124.273 Y109.058 E.25787
M204 S10000
G1 X124.373 Y108.631 F42000
G1 F3103
M204 S6000
G3 X125.175 Y109.534 I-.109 J.903 E.02305
G1 X125.174 Y124.275 E.25737
G3 X124.263 Y125.175 I-.9 J0 E.02488
G1 X109.525 Y125.174 E.25732
G3 X108.625 Y124.263 I0 J-.9 E.02488
G1 X108.626 Y109.522 E.25738
G3 X109.485 Y108.627 I.907 J.011 E.02386
G1 X124.313 Y108.631 E.25891
M204 S250
G1 X124.395 Y108.219 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3103
M204 S5000
G1 X124.413 Y108.219 E.00029
G3 X125.588 Y109.526 I-.153 J1.319 E.03119
G1 X125.588 Y124.286 E.23968
G3 X124.274 Y125.588 I-1.314 J-.011 E.03334
G1 X109.514 Y125.588 E.23966
G3 X108.212 Y124.274 I.011 J-1.314 E.03334
G1 X108.212 Y109.513 E.23968
G3 X109.467 Y108.213 I1.325 J.024 E.03227
G1 X124.335 Y108.219 E.24143
; WIPE_START
G1 F3600
M204 S6000
G1 X124.413 Y108.219 E-.02963
G1 X124.62 Y108.257 E-.08
G1 X124.861 Y108.349 E-.09815
G1 X125.079 Y108.485 E-.09782
G1 X125.266 Y108.661 E-.09724
G1 X125.391 Y108.83 E-.0799
G1 X125.501 Y109.051 E-.09396
G1 X125.569 Y109.3 E-.09795
G1 X125.588 Y109.524 E-.08536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 17 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer17 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X111.435 Y109.422 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3103
M204 S6000
G1 X109.721 Y109.422 E.02993
G3 X110.693 Y110.381 I-3.832 J4.854 E.02389
G1 X111.382 Y110.723 E.01344
G1 X112.072 Y110.763 E.01206
G2 X112.762 Y110.347 I-.228 J-1.159 E.01434
G1 X113.452 Y109.625 E.01744
G1 X113.86 Y109.423 E.00796
G1 X115.24 Y109.423 E.02409
G3 X116.21 Y110.381 I-3.829 J4.848 E.02387
G1 X116.9 Y110.723 E.01344
G1 X117.59 Y110.763 E.01206
G2 X118.279 Y110.347 I-.228 J-1.159 E.01434
G1 X118.969 Y109.625 E.01744
G1 X119.376 Y109.424 E.00792
G1 X120.758 Y109.424 E.02414
G3 X121.728 Y110.381 I-3.825 J4.843 E.02384
G1 X122.418 Y110.723 E.01344
G1 X123.107 Y110.763 E.01206
G2 X123.797 Y110.347 I-.228 J-1.159 E.01435
G1 X124.38 Y109.737 E.01473
G1 X124.38 Y112.041 E.04023
G2 X123.797 Y112.417 I.227 J.991 E.01236
G1 X123.107 Y113.14 E.01744
G1 X122.418 Y113.481 E.01344
G1 X121.728 Y113.522 E.01206
G3 X121.038 Y113.106 I.228 J-1.159 E.01434
G1 X120.349 Y112.384 E.01744
G1 X119.659 Y112.042 E.01344
G1 X118.969 Y112.002 E.01206
G2 X118.279 Y112.417 I.228 J1.159 E.01435
G1 X117.59 Y113.14 E.01744
G1 X116.9 Y113.481 E.01344
G1 X116.21 Y113.522 E.01206
G3 X115.521 Y113.106 I.228 J-1.159 E.01434
G1 X114.831 Y112.384 E.01744
G1 X114.141 Y112.042 E.01344
G1 X113.452 Y112.002 E.01206
G2 X112.762 Y112.417 I.228 J1.159 E.01434
G1 X112.072 Y113.14 E.01744
G1 X111.382 Y113.481 E.01344
G1 X110.693 Y113.522 E.01206
G3 X110.003 Y113.106 I.228 J-1.159 E.01435
G1 X109.421 Y112.496 E.01473
G1 X109.421 Y114.8 E.04023
G3 X110.003 Y115.176 I-.227 J.991 E.01236
G1 X110.693 Y115.899 E.01744
G1 X111.382 Y116.24 E.01344
G1 X112.072 Y116.28 E.01206
G2 X112.762 Y115.865 I-.228 J-1.159 E.01434
G1 X113.452 Y115.142 E.01744
G1 X114.141 Y114.801 E.01344
G1 X114.831 Y114.761 E.01206
G3 X115.521 Y115.176 I-.228 J1.159 E.01434
G1 X116.21 Y115.899 E.01744
G1 X116.9 Y116.24 E.01344
G1 X117.59 Y116.28 E.01206
G2 X118.279 Y115.865 I-.228 J-1.159 E.01434
G1 X118.969 Y115.142 E.01744
G1 X119.659 Y114.801 E.01344
G1 X120.349 Y114.761 E.01206
G3 X121.038 Y115.176 I-.228 J1.159 E.01434
G1 X121.728 Y115.899 E.01744
G1 X122.418 Y116.24 E.01344
G1 X123.107 Y116.28 E.01206
G2 X123.797 Y115.865 I-.228 J-1.159 E.01435
G1 X124.38 Y115.255 E.01473
G1 X124.38 Y117.559 E.04023
G2 X123.797 Y117.935 I.227 J.991 E.01235
G1 X123.107 Y118.658 E.01744
G1 X122.418 Y118.999 E.01344
G1 X121.728 Y119.039 E.01206
G3 X121.038 Y118.624 I.228 J-1.159 E.01434
G1 X120.349 Y117.901 E.01744
G1 X119.659 Y117.56 E.01344
G1 X118.969 Y117.52 E.01206
G2 X118.279 Y117.935 I.228 J1.159 E.01435
G1 X117.59 Y118.658 E.01744
G1 X116.9 Y118.999 E.01344
G1 X116.21 Y119.039 E.01206
G3 X115.521 Y118.624 I.228 J-1.159 E.01434
G1 X114.831 Y117.901 E.01744
G1 X114.141 Y117.56 E.01344
G1 X113.452 Y117.52 E.01206
G2 X112.762 Y117.935 I.228 J1.159 E.01434
G1 X112.072 Y118.658 E.01744
G1 X111.382 Y118.999 E.01344
G1 X110.693 Y119.039 E.01206
G3 X110.003 Y118.624 I.228 J-1.159 E.01435
G1 X109.42 Y118.013 E.01473
G1 X109.42 Y120.318 E.04023
G3 X110.003 Y120.694 I-.227 J.991 E.01236
G1 X110.693 Y121.417 E.01744
G1 X111.382 Y121.758 E.01344
G1 X112.072 Y121.798 E.01206
G2 X112.762 Y121.383 I-.228 J-1.159 E.01434
G1 X113.452 Y120.66 E.01744
G1 X114.141 Y120.319 E.01344
G1 X114.831 Y120.279 E.01206
G3 X115.521 Y120.694 I-.228 J1.159 E.01434
G1 X116.21 Y121.417 E.01744
G1 X116.9 Y121.758 E.01344
G1 X117.59 Y121.798 E.01206
G2 X118.279 Y121.383 I-.228 J-1.159 E.01434
G1 X118.969 Y120.66 E.01744
G1 X119.659 Y120.319 E.01344
G1 X120.349 Y120.279 E.01206
G3 X121.038 Y120.694 I-.228 J1.159 E.01434
G1 X121.728 Y121.417 E.01744
G1 X122.418 Y121.758 E.01344
G1 X123.107 Y121.798 E.01206
G2 X123.797 Y121.383 I-.228 J-1.159 E.01435
G1 X124.379 Y120.772 E.01473
G1 X124.379 Y123.077 E.04023
G2 X123.797 Y123.453 I.227 J.991 E.01235
G1 X123.107 Y124.175 E.01744
G1 X122.695 Y124.38 E.00804
G1 X121.322 Y124.38 E.02397
G3 X120.349 Y123.419 I3.838 J-4.862 E.02393
G1 X119.659 Y123.077 E.01344
G1 X118.969 Y123.037 E.01206
G2 X118.279 Y123.453 I.228 J1.159 E.01435
G1 X117.59 Y124.175 E.01744
G1 X117.177 Y124.38 E.00804
G1 X115.804 Y124.38 E.02397
G3 X114.831 Y123.419 I3.838 J-4.862 E.02393
G1 X114.141 Y123.077 E.01344
G1 X113.452 Y123.037 E.01206
G2 X112.762 Y123.453 I.228 J1.159 E.01434
G1 X112.072 Y124.175 E.01744
G1 X111.66 Y124.379 E.00803
G1 X110.287 Y124.379 E.02398
G3 X109.42 Y123.531 I3.385 J-4.322 E.02121
G1 X109.42 Y121.817 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.42 Y123.531 E-.65138
G1 X109.625 Y123.731 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 18/83
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I.86 J.861 P1  F42000
G1 X124.344 Y109.04 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3128
M204 S6000
G1 X124.363 Y109.042 E.00033
G3 X124.764 Y109.532 I-.077 J.472 E.01207
G1 X124.764 Y124.274 E.2574
G3 X124.263 Y124.764 I-.48 J.01 E.01372
G1 X109.526 Y124.764 E.25731
G3 X109.036 Y124.263 I-.01 J-.48 E.01372
G1 X109.036 Y109.52 E.25741
G3 X109.492 Y109.037 I.481 J-.003 E.01279
G1 X124.284 Y109.04 E.25829
M204 S10000
G1 X124.385 Y108.613 F42000
G1 F3128
M204 S6000
G3 X125.193 Y109.523 I-.11 J.911 E.02323
G1 X125.192 Y124.286 E.25777
G3 X124.274 Y125.193 I-.908 J-.001 E.02507
G1 X109.514 Y125.192 E.25771
G3 X108.607 Y124.274 I.001 J-.908 E.02507
G1 X108.608 Y109.511 E.25777
G3 X109.473 Y108.609 I.914 J.011 E.02402
G1 X124.325 Y108.613 E.25933
M204 S250
G1 X124.4 Y108.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3128
M204 S5000
G1 X124.425 Y108.201 E.0004
G3 X125.606 Y109.515 I-.154 J1.327 E.03135
G1 X125.606 Y124.298 E.24005
G3 X124.284 Y125.606 I-1.321 J-.012 E.03351
G1 X109.502 Y125.606 E.24003
G3 X108.194 Y124.284 I.012 J-1.321 E.03351
G1 X108.194 Y109.501 E.24005
G3 X109.454 Y108.195 I1.333 J.025 E.03242
G1 X124.34 Y108.201 E.24171
; WIPE_START
G1 F3600
M204 S6000
G1 X124.425 Y108.201 E-.03224
G1 X124.633 Y108.239 E-.08033
G1 X124.876 Y108.332 E-.09874
G1 X125.095 Y108.469 E-.09841
G1 X125.282 Y108.646 E-.09785
G1 X125.408 Y108.815 E-.08018
G1 X125.518 Y109.037 E-.09419
G1 X125.587 Y109.287 E-.09846
G1 X125.605 Y109.496 E-.07961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 18 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer18 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X111.569 Y109.404 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3128
M204 S6000
G1 X109.855 Y109.404 E.02993
G1 X110.693 Y110.338 E.02191
G1 X111.382 Y110.745 E.01398
G1 X112.072 Y110.85 E.01218
G2 X112.762 Y110.483 I-.057 J-.938 E.01407
G1 X113.452 Y109.668 E.01863
G1 X113.898 Y109.405 E.00905
G1 X115.374 Y109.405 E.02577
G1 X116.21 Y110.338 E.02188
G1 X116.9 Y110.745 E.01398
G1 X117.59 Y110.85 E.01218
G2 X118.279 Y110.483 I-.057 J-.938 E.01407
G1 X118.969 Y109.668 E.01864
G1 X119.414 Y109.406 E.00902
G1 X120.893 Y109.406 E.02582
G1 X121.728 Y110.338 E.02186
G1 X122.418 Y110.745 E.01398
G1 X123.107 Y110.85 E.01218
G2 X123.797 Y110.483 I-.057 J-.938 E.01407
G1 X124.398 Y109.773 E.01623
G1 X124.398 Y111.938 E.0378
G2 X123.797 Y112.282 I.076 J.829 E.01247
G1 X123.107 Y113.097 E.01863
G1 X122.418 Y113.504 E.01398
G1 X121.728 Y113.608 E.01218
G3 X121.038 Y113.241 I.057 J-.938 E.01407
G1 X120.349 Y112.427 E.01863
G1 X119.659 Y112.02 E.01398
G1 X118.969 Y111.915 E.01218
G2 X118.279 Y112.282 I.057 J.938 E.01407
G1 X117.59 Y113.097 E.01863
G1 X116.9 Y113.504 E.01398
G1 X116.21 Y113.608 E.01218
G3 X115.521 Y113.241 I.057 J-.938 E.01407
G1 X114.831 Y112.427 E.01863
G1 X114.141 Y112.02 E.01398
G1 X113.452 Y111.915 E.01218
G2 X112.762 Y112.282 I.057 J.938 E.01407
G1 X112.072 Y113.097 E.01863
G1 X111.382 Y113.504 E.01398
G1 X110.693 Y113.608 E.01218
G3 X110.003 Y113.241 I.057 J-.938 E.01407
G1 X109.403 Y112.532 E.01623
G1 X109.402 Y114.697 E.0378
G3 X110.003 Y115.041 I-.076 J.829 E.01246
G1 X110.693 Y115.856 E.01864
G1 X111.382 Y116.263 E.01398
G1 X112.072 Y116.367 E.01218
G2 X112.762 Y116 I-.057 J-.938 E.01407
G1 X113.452 Y115.186 E.01863
G1 X114.141 Y114.779 E.01398
M73 P63 R11
G1 X114.831 Y114.674 E.01218
G3 X115.521 Y115.041 I-.057 J.938 E.01407
G1 X116.21 Y115.856 E.01863
G1 X116.9 Y116.263 E.01398
G1 X117.59 Y116.367 E.01218
G2 X118.279 Y116 I-.057 J-.938 E.01407
G1 X118.969 Y115.186 E.01863
G1 X119.659 Y114.779 E.01398
G1 X120.349 Y114.674 E.01218
G3 X121.038 Y115.041 I-.057 J.938 E.01407
G1 X121.728 Y115.856 E.01863
G1 X122.418 Y116.263 E.01398
G1 X123.107 Y116.367 E.01218
G2 X123.797 Y116 I-.057 J-.938 E.01407
G1 X124.398 Y115.291 E.01623
G1 X124.398 Y117.456 E.0378
G2 X123.797 Y117.8 I.077 J.829 E.01246
G1 X123.107 Y118.614 E.01863
G1 X122.418 Y119.021 E.01398
G1 X121.728 Y119.126 E.01218
G3 X121.038 Y118.759 I.057 J-.938 E.01407
G1 X120.349 Y117.944 E.01863
G1 X119.659 Y117.537 E.01398
G1 X118.969 Y117.433 E.01218
G2 X118.279 Y117.8 I.057 J.938 E.01407
G1 X117.59 Y118.614 E.01863
G1 X116.9 Y119.021 E.01398
G1 X116.21 Y119.126 E.01218
G3 X115.521 Y118.759 I.057 J-.938 E.01407
G1 X114.831 Y117.944 E.01863
G1 X114.141 Y117.537 E.01398
G1 X113.452 Y117.433 E.01218
G2 X112.762 Y117.8 I.057 J.938 E.01407
G1 X112.072 Y118.614 E.01863
G1 X111.382 Y119.021 E.01398
G1 X110.693 Y119.126 E.01218
G3 X110.003 Y118.759 I.057 J-.938 E.01407
G1 X109.402 Y118.05 E.01623
G1 X109.402 Y120.215 E.0378
G3 X110.003 Y120.559 I-.076 J.83 E.01247
G1 X110.693 Y121.373 E.01863
G1 X111.382 Y121.78 E.01398
G1 X112.072 Y121.885 E.01218
G2 X112.762 Y121.518 I-.057 J-.938 E.01407
G1 X113.452 Y120.703 E.01863
G1 X114.141 Y120.296 E.01398
G1 X114.831 Y120.192 E.01218
G3 X115.521 Y120.559 I-.057 J.938 E.01407
G1 X116.21 Y121.373 E.01863
G1 X116.9 Y121.78 E.01398
G1 X117.59 Y121.885 E.01218
G2 X118.279 Y121.518 I-.057 J-.938 E.01407
G1 X118.969 Y120.703 E.01863
G1 X119.659 Y120.296 E.01398
G1 X120.349 Y120.192 E.01218
G3 X121.038 Y120.559 I-.057 J.938 E.01407
G1 X121.728 Y121.373 E.01863
G1 X122.418 Y121.78 E.01398
G1 X123.107 Y121.885 E.01218
G2 X123.797 Y121.518 I-.057 J-.938 E.01407
G1 X124.398 Y120.809 E.01622
G1 X124.397 Y122.973 E.0378
G2 X123.797 Y123.318 I.076 J.829 E.01246
G1 X123.107 Y124.132 E.01864
G1 X122.657 Y124.398 E.00913
G1 X121.188 Y124.398 E.02565
G1 X120.349 Y123.462 E.02195
G1 X119.659 Y123.055 E.01398
G1 X118.969 Y122.951 E.01218
G2 X118.279 Y123.318 I.057 J.938 E.01407
G1 X117.59 Y124.132 E.01863
G1 X117.14 Y124.398 E.00912
G1 X115.67 Y124.398 E.02566
G1 X114.831 Y123.462 E.02195
G1 X114.141 Y123.055 E.01398
G1 X113.452 Y122.951 E.01218
G2 X112.762 Y123.318 I.057 J.938 E.01407
G1 X112.072 Y124.132 E.01863
G1 X111.622 Y124.397 E.00912
G1 X110.153 Y124.397 E.02566
G3 X109.402 Y123.567 I1.8 J-2.381 E.01966
G1 X109.402 Y121.853 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.402 Y123.567 E-.65138
G1 X109.594 Y123.779 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 19/83
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I.86 J.861 P1  F42000
G1 X124.356 Y109.022 Z2.2
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3166
M204 S6000
G1 X124.376 Y109.025 E.00035
G3 X124.782 Y109.522 I-.079 J.48 E.01225
G1 X124.782 Y124.286 E.25779
G3 X124.273 Y124.782 I-.487 J.009 E.01391
G1 X109.514 Y124.782 E.2577
G3 X109.018 Y124.273 I-.01 J-.487 E.01391
G1 X109.018 Y109.509 E.25778
G3 X109.48 Y109.019 I.488 J-.002 E.01296
G1 X124.296 Y109.022 E.2587
M204 S10000
G1 X124.397 Y108.595 F42000
G1 F3166
M204 S6000
G3 X125.211 Y109.513 I-.111 J.918 E.02342
G1 X125.211 Y124.298 E.25815
G3 X124.284 Y125.211 I-.915 J-.002 E.02526
G1 X109.502 Y125.211 E.2581
G3 X108.589 Y124.284 I.002 J-.915 E.02526
G1 X108.589 Y109.499 E.25815
G3 X109.461 Y108.591 I.922 J.012 E.02419
G1 X124.337 Y108.595 E.25975
M204 S250
G1 X124.405 Y108.183 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3166
M204 S5000
G1 X124.437 Y108.183 E.00051
G3 X125.624 Y109.504 I-.155 J1.334 E.03152
G1 X125.624 Y124.309 E.24041
G3 X124.295 Y125.624 I-1.328 J-.013 E.03368
G1 X109.491 Y125.624 E.24039
G3 X108.176 Y124.295 I.013 J-1.328 E.03368
G1 X108.176 Y109.49 E.24041
G3 X109.442 Y108.177 I1.34 J.026 E.03257
G1 X124.345 Y108.183 E.24199
; WIPE_START
G1 F3600
M204 S6000
G1 X124.437 Y108.183 E-.0348
G1 X124.646 Y108.222 E-.08079
G1 X124.89 Y108.314 E-.09922
G1 X125.11 Y108.453 E-.09892
G1 X125.298 Y108.63 E-.09818
G1 X125.425 Y108.801 E-.0807
G1 X125.535 Y109.023 E-.09444
G1 X125.605 Y109.274 E-.099
G1 X125.621 Y109.468 E-.07394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 19 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer19 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X111.741 Y109.386 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3166
M204 S6000
G1 X110.027 Y109.386 E.02993
G1 X110.693 Y110.297 E.01971
G1 X111.382 Y110.774 E.01464
G1 X112.072 Y110.949 E.01242
G2 X112.762 Y110.652 I.092 J-.736 E.01374
G1 X113.452 Y109.709 E.0204
G1 X113.917 Y109.387 E.00989
G1 X115.545 Y109.387 E.02842
G1 X116.21 Y110.297 E.01969
G1 X116.9 Y110.774 E.01464
G1 X117.59 Y110.949 E.01242
G2 X118.279 Y110.652 I.092 J-.736 E.01374
G1 X118.969 Y109.709 E.0204
M73 P63 R10
G1 X119.434 Y109.388 E.00986
G1 X121.063 Y109.388 E.02845
G1 X121.728 Y110.297 E.01967
G1 X122.418 Y110.774 E.01464
G1 X123.107 Y110.949 E.01242
G2 X123.797 Y110.652 I.092 J-.736 E.01374
G1 X124.416 Y109.806 E.0183
G1 X124.416 Y111.824 E.03524
G2 X123.797 Y112.113 I-.063 J.672 E.0125
G1 X123.107 Y113.056 E.0204
G1 X122.418 Y113.533 E.01464
G1 X121.728 Y113.708 E.01242
G3 X121.038 Y113.411 I-.092 J-.736 E.01374
G1 X120.349 Y112.468 E.0204
G1 X119.659 Y111.99 E.01464
G1 X118.969 Y111.816 E.01242
G2 X118.279 Y112.113 I-.092 J.736 E.01374
G1 X117.59 Y113.056 E.0204
G1 X116.9 Y113.533 E.01464
G1 X116.21 Y113.708 E.01242
G3 X115.521 Y113.411 I-.092 J-.736 E.01374
G1 X114.831 Y112.468 E.0204
G1 X114.141 Y111.99 E.01464
G1 X113.452 Y111.816 E.01242
G2 X112.762 Y112.113 I-.092 J.736 E.01374
G1 X112.072 Y113.056 E.0204
G1 X111.382 Y113.533 E.01464
G1 X110.693 Y113.708 E.01242
G3 X110.003 Y113.411 I-.092 J-.736 E.01374
G1 X109.384 Y112.565 E.0183
G1 X109.384 Y114.583 E.03524
G3 X110.003 Y114.872 I.063 J.672 E.0125
G1 X110.693 Y115.815 E.0204
G1 X111.382 Y116.292 E.01464
G1 X112.072 Y116.466 E.01242
G2 X112.762 Y116.17 I.092 J-.736 E.01374
G1 X113.452 Y115.226 E.0204
G1 X114.141 Y114.749 E.01464
G1 X114.831 Y114.575 E.01242
G3 X115.521 Y114.872 I.092 J.736 E.01374
G1 X116.21 Y115.815 E.0204
G1 X116.9 Y116.292 E.01464
G1 X117.59 Y116.466 E.01242
G2 X118.279 Y116.17 I.092 J-.736 E.01374
G1 X118.969 Y115.226 E.0204
G1 X119.659 Y114.749 E.01464
G1 X120.349 Y114.575 E.01242
G3 X121.038 Y114.872 I.092 J.736 E.01374
G1 X121.728 Y115.815 E.0204
G1 X122.418 Y116.292 E.01464
G1 X123.107 Y116.466 E.01242
G2 X123.797 Y116.17 I.092 J-.736 E.01374
G1 X124.416 Y115.324 E.0183
G1 X124.416 Y117.342 E.03524
G2 X123.797 Y117.63 I-.063 J.671 E.0125
G1 X123.107 Y118.574 E.0204
G1 X122.418 Y119.051 E.01464
G1 X121.728 Y119.225 E.01242
G3 X121.038 Y118.929 I-.092 J-.736 E.01374
G1 X120.349 Y117.985 E.0204
G1 X119.659 Y117.508 E.01464
G1 X118.969 Y117.334 E.01242
G2 X118.279 Y117.63 I-.092 J.736 E.01374
G1 X117.59 Y118.574 E.0204
G1 X116.9 Y119.051 E.01464
G1 X116.21 Y119.225 E.01242
G3 X115.521 Y118.929 I-.092 J-.736 E.01374
G1 X114.831 Y117.985 E.0204
G1 X114.141 Y117.508 E.01464
G1 X113.452 Y117.334 E.01242
G2 X112.762 Y117.63 I-.092 J.736 E.01374
G1 X112.072 Y118.574 E.0204
G1 X111.382 Y119.051 E.01464
G1 X110.693 Y119.225 E.01242
G3 X110.003 Y118.929 I-.092 J-.736 E.01374
G1 X109.384 Y118.082 E.0183
G1 X109.384 Y120.101 E.03524
G3 X110.003 Y120.389 I.063 J.672 E.0125
G1 X110.693 Y121.333 E.0204
G1 X111.382 Y121.81 E.01464
G1 X112.072 Y121.984 E.01242
G2 X112.762 Y121.687 I.092 J-.736 E.01374
G1 X113.452 Y120.744 E.0204
G1 X114.141 Y120.267 E.01464
G1 X114.831 Y120.093 E.01242
G3 X115.521 Y120.389 I.092 J.736 E.01374
G1 X116.21 Y121.333 E.0204
G1 X116.9 Y121.81 E.01464
G1 X117.59 Y121.984 E.01242
G2 X118.279 Y121.687 I.092 J-.736 E.01374
G1 X118.969 Y120.744 E.0204
G1 X119.659 Y120.267 E.01464
G1 X120.349 Y120.093 E.01242
G3 X121.038 Y120.389 I.092 J.736 E.01374
G1 X121.728 Y121.333 E.0204
G1 X122.418 Y121.81 E.01464
G1 X123.107 Y121.984 E.01242
G2 X123.797 Y121.687 I.092 J-.736 E.01374
G1 X124.416 Y120.841 E.0183
G1 X124.416 Y122.859 E.03523
G2 X123.797 Y123.148 I-.063 J.671 E.01249
G1 X123.107 Y124.091 E.0204
G1 X122.638 Y124.416 E.00996
G1 X121.016 Y124.416 E.02833
G1 X120.349 Y123.503 E.01975
G1 X119.659 Y123.026 E.01464
G1 X118.969 Y122.851 E.01242
G2 X118.279 Y123.148 I-.092 J.736 E.01374
G1 X117.59 Y124.091 E.0204
G1 X117.121 Y124.416 E.00995
G1 X115.498 Y124.416 E.02833
G1 X114.831 Y123.503 E.01974
G1 X114.141 Y123.026 E.01464
G1 X113.452 Y122.851 E.01242
G2 X112.762 Y123.148 I-.092 J.736 E.01374
G1 X112.072 Y124.091 E.0204
G1 X111.603 Y124.416 E.00995
G1 X109.981 Y124.416 E.02834
G1 X109.384 Y123.6 E.01764
G1 X109.384 Y121.886 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.384 Y123.6 E-.65138
G1 X109.553 Y123.831 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 20/83
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I.861 J.86 P1  F42000
G1 X124.368 Y109.004 Z2.3
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3225
M204 S6000
G1 X124.388 Y109.007 E.00036
G3 X124.8 Y109.511 I-.081 J.487 E.01243
G1 X124.8 Y124.298 E.25818
G3 X124.284 Y124.8 I-.492 J.011 E.01411
G1 X109.502 Y124.8 E.2581
G3 X109 Y124.284 I-.011 J-.492 E.01411
G1 X109 Y109.498 E.25818
G3 X109.468 Y109.001 I.488 J-.009 E.01318
G1 X124.308 Y109.004 E.25911
M204 S10000
G1 X124.409 Y108.577 F42000
G1 F3225
M204 S6000
G3 X125.229 Y109.502 I-.112 J.925 E.0236
G1 X125.229 Y124.31 E.25855
G3 X124.295 Y125.229 I-.921 J-.002 E.02545
G1 X109.49 Y125.229 E.2585
G3 X108.571 Y124.295 I.002 J-.921 E.02545
G1 X108.571 Y109.488 E.25855
G3 X109.449 Y108.573 I.917 J.002 E.02443
G1 X124.349 Y108.577 E.26016
M204 S250
G1 X124.41 Y108.165 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3225
M204 S5000
G1 X124.449 Y108.165 E.00062
G3 X125.642 Y109.493 I-.156 J1.341 E.03168
G1 X125.642 Y124.321 E.24078
G3 X124.306 Y125.642 I-1.336 J-.015 E.03384
G1 X109.479 Y125.642 E.24076
G3 X108.158 Y124.306 I.015 J-1.336 E.03384
G1 X108.158 Y109.478 E.24078
G3 X109.43 Y108.159 I1.331 J.012 E.03281
G1 X124.35 Y108.165 E.24228
; WIPE_START
G1 F3600
M204 S6000
G1 X124.449 Y108.165 E-.03737
G1 X124.659 Y108.204 E-.08115
G1 X124.904 Y108.297 E-.09981
G1 X125.126 Y108.436 E-.09943
G1 X125.315 Y108.615 E-.09886
G1 X125.442 Y108.786 E-.08102
G1 X125.553 Y109.009 E-.09459
G1 X125.623 Y109.262 E-.09958
G1 X125.638 Y109.441 E-.06819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 20 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer20 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X109.366 Y110.351 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3225
M204 S6000
G3 X109.382 Y109.449 I2.429 J-.41 E.01584
G3 X109.51 Y109.368 I.124 J.055 E.00281
G1 X110.161 Y109.368 E.01135
G1 X110.693 Y110.259 E.01811
G2 X112.417 Y111.099 I1.802 J-1.508 E.0345
G1 X112.762 Y110.902 E.00694
G1 X113.452 Y109.747 E.02348
G3 X113.865 Y109.369 I1.101 J.787 E.00987
G1 X115.679 Y109.369 E.03166
G1 X116.21 Y110.259 E.0181
G2 X117.935 Y111.099 I1.802 J-1.508 E.0345
G1 X118.279 Y110.902 E.00694
G1 X118.969 Y109.747 E.02348
G3 X119.382 Y109.37 I1.099 J.785 E.00984
G1 X121.197 Y109.37 E.03169
G1 X121.728 Y110.259 E.01808
G2 X123.452 Y111.099 I1.802 J-1.508 E.0345
G1 X123.797 Y110.902 E.00694
G1 X124.434 Y109.836 E.02168
G1 X124.434 Y111.696 E.03248
G2 X123.797 Y111.863 I-.203 J.525 E.01228
G1 X123.107 Y113.017 E.02348
G3 X121.383 Y113.858 I-1.802 J-1.508 E.0345
G1 X121.038 Y113.66 E.00694
G1 X120.349 Y112.506 E.02348
G2 X118.624 Y111.666 I-1.802 J1.508 E.0345
G1 X118.279 Y111.863 E.00694
G1 X117.59 Y113.017 E.02348
G3 X115.866 Y113.858 I-1.802 J-1.508 E.0345
G1 X115.521 Y113.66 E.00694
G1 X114.831 Y112.506 E.02348
G2 X113.107 Y111.666 I-1.802 J1.508 E.0345
G1 X112.762 Y111.863 E.00694
G1 X112.072 Y113.017 E.02348
G3 X110.348 Y113.858 I-1.802 J-1.508 E.0345
G1 X110.003 Y113.66 E.00694
G1 X109.366 Y112.595 E.02167
G1 X109.366 Y114.455 E.03248
G3 X110.003 Y114.622 I.202 J.525 E.01227
G1 X110.693 Y115.776 E.02348
G2 X112.417 Y116.617 I1.802 J-1.508 E.0345
G1 X112.762 Y116.419 E.00694
G1 X113.452 Y115.265 E.02348
G3 X115.176 Y114.425 I1.802 J1.508 E.0345
G1 X115.521 Y114.622 E.00694
G1 X116.21 Y115.776 E.02348
G2 X117.935 Y116.617 I1.802 J-1.508 E.0345
G1 X118.279 Y116.419 E.00694
G1 X118.969 Y115.265 E.02348
G3 X120.693 Y114.425 I1.802 J1.508 E.0345
G1 X121.038 Y114.622 E.00694
G1 X121.728 Y115.776 E.02348
G2 X123.452 Y116.617 I1.802 J-1.508 E.0345
G1 X123.797 Y116.419 E.00694
G1 X124.434 Y115.354 E.02167
M73 P64 R10
G1 X124.434 Y117.214 E.03248
G2 X123.797 Y117.381 I-.202 J.525 E.01227
G1 X123.107 Y118.535 E.02348
G3 X121.383 Y119.376 I-1.802 J-1.508 E.0345
G1 X121.038 Y119.178 E.00694
G1 X120.349 Y118.024 E.02348
G2 X118.624 Y117.183 I-1.802 J1.508 E.0345
G1 X118.279 Y117.381 E.00694
G1 X117.59 Y118.535 E.02348
G3 X115.866 Y119.376 I-1.802 J-1.508 E.0345
G1 X115.521 Y119.178 E.00694
G1 X114.831 Y118.024 E.02348
G2 X113.107 Y117.183 I-1.802 J1.508 E.0345
G1 X112.762 Y117.381 E.00694
G1 X112.072 Y118.535 E.02348
G3 X110.348 Y119.376 I-1.802 J-1.508 E.0345
G1 X110.003 Y119.178 E.00694
G1 X109.366 Y118.112 E.02167
G1 X109.366 Y119.973 E.03248
G3 X110.003 Y120.14 I.203 J.525 E.01228
G1 X110.693 Y121.294 E.02348
G2 X112.417 Y122.134 I1.802 J-1.508 E.0345
G1 X112.762 Y121.937 E.00694
G1 X113.452 Y120.783 E.02348
G3 X115.176 Y119.942 I1.802 J1.508 E.0345
G1 X115.521 Y120.14 E.00694
G1 X116.21 Y121.294 E.02348
G2 X117.935 Y122.134 I1.802 J-1.508 E.0345
G1 X118.279 Y121.937 E.00694
G1 X118.969 Y120.783 E.02348
G3 X120.693 Y119.942 I1.802 J1.508 E.0345
G1 X121.038 Y120.14 E.00694
G1 X121.728 Y121.294 E.02348
G2 X123.452 Y122.134 I1.802 J-1.508 E.0345
G1 X123.797 Y121.937 E.00694
G1 X124.434 Y120.872 E.02167
G1 X124.434 Y122.732 E.03247
G2 X123.797 Y122.899 I-.202 J.525 E.01227
G1 X123.107 Y124.053 E.02348
G3 X122.69 Y124.434 I-1.109 J-.795 E.00994
G1 X120.882 Y124.434 E.03157
G1 X120.349 Y123.542 E.01815
G2 X118.624 Y122.701 I-1.802 J1.508 E.0345
G1 X118.279 Y122.899 E.00694
G1 X117.59 Y124.053 E.02348
G3 X117.172 Y124.434 I-1.108 J-.795 E.00994
G1 X115.364 Y124.434 E.03157
G1 X114.831 Y123.542 E.01815
G2 X113.107 Y122.701 I-1.802 J1.508 E.0345
G1 X112.762 Y122.899 E.00694
G1 X112.072 Y124.053 E.02348
G3 X111.655 Y124.434 I-1.108 J-.794 E.00994
G1 X109.846 Y124.434 E.03158
G1 X109.366 Y123.63 E.01635
G1 X109.366 Y121.916 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.366 Y123.63 E-.65138
G1 X109.513 Y123.875 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 21/83
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.861 J.86 P1  F42000
G1 X124.379 Y108.986 Z2.4
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3403
M204 S6000
G1 X124.401 Y108.989 E.00038
G3 X124.817 Y109.456 I-.086 J.495 E.01178
G1 X124.818 Y124.309 E.25935
G3 X124.295 Y124.818 I-.502 J.008 E.01427
G1 X109.491 Y124.818 E.25849
G3 X108.982 Y124.295 I-.008 J-.501 E.01427
G1 X108.982 Y109.486 E.25856
G3 X109.456 Y108.983 I.495 J-.008 E.01335
G1 X124.319 Y108.986 E.25952
M204 S10000
G1 X124.416 Y108.559 F42000
G1 F3403
M204 S6000
G1 X124.421 Y108.559 E.00009
G3 X125.245 Y109.436 I-.101 J.921 E.02288
G1 X125.247 Y124.321 E.2599
G3 X124.306 Y125.247 I-.929 J-.004 E.02562
G1 X109.479 Y125.247 E.25889
G3 X108.553 Y124.306 I.004 J-.929 E.02562
G1 X108.553 Y109.476 E.25894
G3 X109.436 Y108.555 I.924 J.002 E.02459
G1 X124.356 Y108.559 E.26049
M204 S250
G1 X124.416 Y108.147 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3403
M204 S5000
G1 X124.461 Y108.147 E.00073
G3 X125.659 Y109.418 I-.143 J1.334 E.03088
G1 X125.66 Y124.333 E.24219
G3 X124.317 Y125.661 I-1.343 J-.015 E.03401
G1 X109.467 Y125.66 E.24113
G3 X108.14 Y124.317 I.015 J-1.343 E.03401
G1 X108.14 Y109.466 E.24115
G3 X109.418 Y108.141 I1.339 J.013 E.03296
G1 X124.356 Y108.147 E.24256
; WIPE_START
G1 F3600
M204 S6000
G1 X124.461 Y108.147 E-.03988
G1 X124.672 Y108.186 E-.0816
G1 X124.918 Y108.28 E-.10028
G1 X125.141 Y108.419 E-.09968
G1 X125.331 Y108.599 E-.09945
G1 X125.475 Y108.8 E-.09393
G1 X125.54 Y108.924 E-.0532
G1 X125.621 Y109.158 E-.09428
G1 X125.658 Y109.413 E-.09769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 21 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer21 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.449 Y124.29 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3403
M204 S6000
G1 X124.451 Y122.576 E.02993
G3 X123.991 Y122.073 I.037 J-.496 E.01313
G3 X124.451 Y120.889 I4.233 J.964 E.02226
G1 X124.451 Y117.058 E.06688
G3 X123.991 Y116.555 I.037 J-.495 E.01312
G3 X124.451 Y115.372 I4.238 J.965 E.02224
G1 X124.45 Y111.54 E.0669
G3 X123.991 Y111.038 I.037 J-.495 E.0131
G3 X124.352 Y110.003 I3.193 J.533 E.01922
G2 X124.45 Y109.491 I-.336 J-.33 E.00966
G2 X124.325 Y109.352 I-.182 J.038 E.0034
G1 X121.325 Y109.352 E.05239
G2 X121.822 Y110.348 I2.74 J-.746 E.01957
G2 X123.471 Y111.382 I3.359 J-3.523 E.03422
G1 X123.603 Y111.727 E.00645
G3 X123.013 Y113.107 I-3.948 J-.873 E.02635
G3 X121.364 Y114.141 I-3.359 J-3.523 E.03422
G1 X121.232 Y114.486 E.00645
G2 X121.822 Y115.866 I3.948 J-.873 E.02635
G2 X123.471 Y116.9 I3.359 J-3.523 E.03422
G1 X123.603 Y117.245 E.00645
G3 X123.013 Y118.624 I-3.948 J-.873 E.02635
G3 X121.364 Y119.659 I-3.359 J-3.523 E.03422
G1 X121.232 Y120.004 E.00645
G2 X121.822 Y121.383 I3.948 J-.873 E.02635
G2 X123.471 Y122.418 I3.359 J-3.523 E.03422
G1 X123.603 Y122.763 E.00645
G3 X122.695 Y124.452 I-2.89 J-.465 E.03412
G1 X120.753 Y124.452 E.03391
G2 X120.254 Y123.452 I-2.75 J.748 E.01963
G2 X118.605 Y122.418 I-3.359 J3.523 E.03422
G1 X118.473 Y122.073 E.00645
G3 X119.064 Y120.693 I3.948 J.873 E.02635
G3 X120.713 Y119.659 I3.359 J3.523 E.03422
G1 X120.844 Y119.314 E.00645
G2 X120.254 Y117.935 I-3.948 J.873 E.02635
G2 X118.605 Y116.9 I-3.359 J3.523 E.03422
G1 X118.473 Y116.555 E.00645
G3 X119.064 Y115.176 I3.948 J.873 E.02635
G3 X120.713 Y114.141 I3.359 J3.523 E.03422
G1 X120.844 Y113.796 E.00645
G2 X120.254 Y112.417 I-3.948 J.873 E.02635
G2 X118.605 Y111.382 I-3.359 J3.523 E.03422
G1 X118.473 Y111.038 E.00645
G3 X119.378 Y109.352 I2.889 J.465 E.03404
G1 X115.807 Y109.351 E.06235
G2 X116.305 Y110.348 I2.743 J-.746 E.01958
G2 X117.954 Y111.382 I3.359 J-3.523 E.03422
G1 X118.085 Y111.727 E.00645
G3 X117.495 Y113.107 I-3.948 J-.873 E.02635
G3 X115.846 Y114.141 I-3.359 J-3.523 E.03422
G1 X115.715 Y114.486 E.00645
G2 X116.305 Y115.866 I3.948 J-.873 E.02635
G2 X117.954 Y116.9 I3.359 J-3.523 E.03422
G1 X118.085 Y117.245 E.00645
G3 X117.495 Y118.624 I-3.948 J-.873 E.02635
G3 X115.846 Y119.659 I-3.359 J-3.523 E.03422
G1 X115.715 Y120.004 E.00645
G2 X116.305 Y121.383 I3.948 J-.873 E.02635
G2 X117.954 Y122.418 I3.36 J-3.523 E.03422
G1 X118.085 Y122.763 E.00645
G3 X117.177 Y124.452 I-2.89 J-.465 E.03412
G1 X115.235 Y124.452 E.03391
G2 X114.736 Y123.452 I-2.75 J.748 E.01963
G2 X113.088 Y122.418 I-3.359 J3.523 E.03422
G1 X112.956 Y122.073 E.00645
G3 X113.546 Y120.693 I3.948 J.873 E.02635
G3 X115.195 Y119.659 I3.359 J3.523 E.03422
G1 X115.327 Y119.314 E.00645
G2 X114.736 Y117.935 I-3.948 J.873 E.02635
G2 X113.088 Y116.9 I-3.359 J3.523 E.03422
G1 X112.956 Y116.555 E.00645
G3 X113.546 Y115.176 I3.948 J.873 E.02635
G3 X115.195 Y114.141 I3.359 J3.523 E.03422
G1 X115.327 Y113.796 E.00645
G2 X114.736 Y112.417 I-3.948 J.873 E.02635
G2 X113.088 Y111.382 I-3.359 J3.523 E.03422
G1 X112.956 Y111.038 E.00645
G3 X113.862 Y109.351 I2.89 J.465 E.03406
G1 X110.289 Y109.35 E.06238
G2 X110.787 Y110.348 I2.745 J-.747 E.0196
G2 X112.436 Y111.382 I3.359 J-3.523 E.03422
G1 X112.568 Y111.727 E.00645
G3 X111.978 Y113.107 I-3.948 J-.873 E.02635
G3 X110.329 Y114.141 I-3.359 J-3.523 E.03422
G1 X110.197 Y114.486 E.00645
G2 X110.787 Y115.866 I3.948 J-.873 E.02635
G2 X112.436 Y116.9 I3.359 J-3.523 E.03422
G1 X112.568 Y117.245 E.00645
G3 X111.978 Y118.624 I-3.948 J-.873 E.02635
G3 X110.329 Y119.659 I-3.359 J-3.523 E.03422
G1 X110.197 Y120.004 E.00645
G2 X110.787 Y121.383 I3.948 J-.873 E.02635
G2 X112.436 Y122.418 I3.359 J-3.523 E.03422
G1 X112.568 Y122.763 E.00645
G3 X111.66 Y124.452 I-2.89 J-.465 E.03411
G1 X109.717 Y124.452 E.03391
G2 X109.348 Y123.646 I-2.199 J.521 E.01557
G1 X109.348 Y119.818 E.06685
G2 X109.809 Y119.314 I-.036 J-.496 E.01314
G2 X109.348 Y118.129 I-4.23 J.962 E.02228
G1 X109.348 Y114.3 E.06685
G2 X109.809 Y113.796 I-.036 J-.496 E.01314
G2 X109.348 Y112.612 I-4.23 J.963 E.02228
G1 X109.348 Y110.897 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.348 Y112.612 E-.65138
G1 X109.467 Y112.872 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 22/83
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I.308 J1.177 P1  F42000
G1 X124.391 Y108.968 Z2.5
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3324
M204 S6000
G1 X124.413 Y108.971 E.00039
G3 X124.837 Y109.49 I-.084 J.501 E.01278
G1 X124.836 Y124.321 E.25895
G3 X124.306 Y124.837 I-.506 J.01 E.01448
G1 X109.479 Y124.836 E.25888
G3 X108.963 Y124.306 I-.01 J-.506 E.01448
G1 X108.964 Y109.475 E.25895
G3 X109.444 Y108.965 I.502 J-.008 E.01352
G1 X124.331 Y108.968 E.25993
M204 S10000
G1 X124.421 Y108.541 F42000
G1 F3324
M204 S6000
G1 X124.432 Y108.541 E.0002
G3 X125.265 Y109.481 I-.114 J.94 E.02397
G1 X125.265 Y124.333 E.25933
G3 X124.317 Y125.265 I-.936 J-.004 E.02581
G1 X109.467 Y125.265 E.25928
G3 X108.535 Y124.317 I.004 J-.936 E.02581
G1 X108.535 Y109.465 E.25933
G3 X109.424 Y108.537 I.931 J.003 E.02476
G1 X124.361 Y108.541 E.2608
M204 S250
G1 X124.421 Y108.129 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3324
M204 S5000
G1 X124.473 Y108.129 E.00084
G3 X125.679 Y109.472 I-.159 J1.356 E.03202
G1 X125.678 Y124.345 E.24151
G3 X124.328 Y125.679 I-1.351 J-.017 E.03418
G1 X109.455 Y125.678 E.2415
G3 X108.121 Y124.328 I.017 J-1.351 E.03418
G1 X108.122 Y109.454 E.24151
G3 X109.406 Y108.123 I1.346 J.013 E.03311
G1 X124.361 Y108.129 E.24285
; WIPE_START
G1 F3600
M204 S6000
G1 X124.473 Y108.129 E-.0424
G1 X124.685 Y108.168 E-.08196
G1 X124.933 Y108.263 E-.10093
G1 X125.157 Y108.403 E-.1004
G1 X125.348 Y108.584 E-.10014
G1 X125.476 Y108.757 E-.08174
G1 X125.587 Y108.981 E-.09489
G1 X125.658 Y109.236 E-.10068
G1 X125.671 Y109.385 E-.05686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 22 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer22 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.47 Y124.154 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3324
M204 S6000
G1 X124.47 Y122.439 E.02993
G3 X124.189 Y121.728 I.574 J-.638 E.01384
G1 X124.47 Y120.932 E.01474
G1 X124.47 Y116.922 E.07002
G3 X124.189 Y116.21 I.574 J-.638 E.01384
G1 X124.47 Y115.414 E.01474
G1 X124.47 Y111.405 E.07001
G3 X124.189 Y110.693 I.574 J-.638 E.01385
G1 X124.47 Y109.896 E.01474
G2 X124.337 Y109.334 I-.464 J-.187 E.01075
G1 X121.436 Y109.334 E.05065
G1 X121.633 Y110.003 E.01218
G1 X122.138 Y110.693 E.01493
G1 X123.148 Y111.382 E.02134
G3 X123.405 Y112.072 I-.406 J.544 E.01358
G1 X123.202 Y112.762 E.01255
G1 X122.697 Y113.452 E.01493
G1 X121.688 Y114.141 E.02134
G2 X121.43 Y114.831 I.406 J.544 E.01358
G1 X121.633 Y115.521 E.01255
G1 X122.138 Y116.21 E.01493
G1 X123.148 Y116.9 E.02134
G3 X123.405 Y117.59 I-.406 J.544 E.01358
G1 X123.202 Y118.279 E.01255
G1 X122.697 Y118.969 E.01493
G1 X121.688 Y119.659 E.02134
G2 X121.43 Y120.349 I.406 J.544 E.01358
G1 X121.633 Y121.038 E.01255
G1 X122.138 Y121.728 E.01493
G1 X123.148 Y122.418 E.02134
G3 X123.405 Y123.107 I-.406 J.544 E.01358
G3 X122.709 Y124.47 I-2.236 J-.283 E.02726
G1 X120.641 Y124.47 E.03611
G1 X120.443 Y123.797 E.01225
G1 X119.938 Y123.107 E.01493
G1 X118.929 Y122.418 E.02134
G3 X118.671 Y121.728 I.406 J-.544 E.01358
G1 X118.874 Y121.038 E.01255
G1 X119.38 Y120.349 E.01493
G1 X120.389 Y119.659 E.02134
G2 X120.646 Y118.969 I-.406 J-.544 E.01358
G1 X120.443 Y118.279 E.01255
G1 X119.938 Y117.59 E.01493
G1 X118.929 Y116.9 E.02134
G3 X118.671 Y116.21 I.406 J-.544 E.01358
G1 X118.874 Y115.521 E.01255
G1 X119.38 Y114.831 E.01493
G1 X120.389 Y114.141 E.02134
G2 X120.646 Y113.452 I-.406 J-.544 E.01358
G1 X120.443 Y112.762 E.01255
G1 X119.938 Y112.072 E.01493
G1 X118.929 Y111.382 E.02134
G3 X118.671 Y110.693 I.406 J-.544 E.01358
G3 X119.365 Y109.333 I2.23 J.281 E.02718
G1 X115.918 Y109.333 E.06018
G1 X116.115 Y110.003 E.0122
G1 X116.621 Y110.693 E.01493
G1 X117.63 Y111.382 E.02134
G3 X117.887 Y112.072 I-.406 J.544 E.01358
M73 P65 R10
G1 X117.685 Y112.762 E.01255
G1 X117.179 Y113.452 E.01493
G1 X116.17 Y114.141 E.02134
G2 X115.913 Y114.831 I.406 J.544 E.01358
G1 X116.115 Y115.521 E.01255
G1 X116.621 Y116.21 E.01493
G1 X117.63 Y116.9 E.02134
G3 X117.887 Y117.59 I-.406 J.544 E.01358
G1 X117.685 Y118.279 E.01255
G1 X117.179 Y118.969 E.01493
G1 X116.17 Y119.659 E.02134
G2 X115.913 Y120.349 I.406 J.544 E.01358
G1 X116.115 Y121.038 E.01255
G1 X116.621 Y121.728 E.01493
G1 X117.63 Y122.418 E.02134
G3 X117.887 Y123.107 I-.406 J.544 E.01358
G3 X117.192 Y124.47 I-2.236 J-.283 E.02725
G1 X115.124 Y124.47 E.03611
G1 X114.926 Y123.797 E.01224
G1 X114.42 Y123.107 E.01493
G1 X113.411 Y122.418 E.02134
G3 X113.154 Y121.728 I.406 J-.544 E.01358
G1 X113.357 Y121.038 E.01255
G1 X113.862 Y120.349 E.01493
G1 X114.871 Y119.659 E.02134
G2 X115.129 Y118.969 I-.406 J-.544 E.01358
G1 X114.926 Y118.279 E.01255
G1 X114.42 Y117.59 E.01493
G1 X113.411 Y116.9 E.02134
G3 X113.154 Y116.21 I.406 J-.544 E.01358
G1 X113.357 Y115.521 E.01255
G1 X113.862 Y114.831 E.01493
G1 X114.871 Y114.141 E.02134
G2 X115.129 Y113.452 I-.406 J-.544 E.01358
G1 X114.926 Y112.762 E.01255
G1 X114.42 Y112.072 E.01493
G1 X113.411 Y111.382 E.02134
G3 X113.154 Y110.693 I.406 J-.544 E.01358
G3 X113.848 Y109.333 I2.231 J.281 E.0272
G1 X110.401 Y109.332 E.06019
G1 X110.598 Y110.003 E.01221
G1 X111.103 Y110.693 E.01493
G1 X112.113 Y111.382 E.02134
G3 X112.37 Y112.072 I-.406 J.544 E.01358
G1 X112.167 Y112.762 E.01255
G1 X111.662 Y113.452 E.01493
G1 X110.652 Y114.141 E.02134
G2 X110.395 Y114.831 I.406 J.544 E.01358
G1 X110.598 Y115.521 E.01255
G1 X111.103 Y116.21 E.01493
G1 X112.113 Y116.9 E.02134
G3 X112.37 Y117.59 I-.406 J.544 E.01358
G1 X112.167 Y118.279 E.01255
G1 X111.662 Y118.969 E.01493
G1 X110.652 Y119.659 E.02134
G2 X110.395 Y120.349 I.406 J.544 E.01358
G1 X110.598 Y121.038 E.01255
G1 X111.103 Y121.728 E.01493
G1 X112.113 Y122.418 E.02134
G3 X112.37 Y123.107 I-.406 J.544 E.01358
G3 X111.674 Y124.47 I-2.235 J-.283 E.02725
G1 X109.606 Y124.47 E.03611
G1 X109.33 Y123.69 E.01444
G1 X109.33 Y119.675 E.07011
G2 X109.611 Y118.969 I-.695 J-.686 E.01362
G1 X109.33 Y118.173 E.01474
G1 X109.33 Y114.157 E.07011
G2 X109.611 Y113.452 I-.696 J-.686 E.01362
G1 X109.33 Y112.655 E.01474
G1 X109.33 Y110.941 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.33 Y112.655 E-.65138
G1 X109.425 Y112.925 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 23/83
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I.312 J1.176 P1  F42000
G1 X124.402 Y108.95 Z2.6
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3285
M204 S6000
G1 X124.425 Y108.953 E.00041
G3 X124.853 Y109.432 I-.089 J.509 E.01209
G1 X124.854 Y124.333 E.26018
G3 X124.316 Y124.855 I-.516 J.006 E.01464
G1 X109.467 Y124.854 E.25927
G3 X108.945 Y124.316 I-.006 J-.516 E.01465
G1 X108.946 Y109.463 E.25934
G3 X109.432 Y108.947 I.509 J-.007 E.01369
G1 X124.342 Y108.95 E.26034
M204 S10000
G1 X124.426 Y108.523 F42000
G1 F3285
M204 S6000
G1 X124.444 Y108.523 E.00031
G3 X125.281 Y109.412 I-.103 J.936 E.0232
G1 X125.283 Y124.345 E.26073
G3 X124.328 Y125.283 I-.944 J-.006 E.02598
G1 X109.455 Y125.283 E.25968
G3 X108.517 Y124.328 I.006 J-.944 E.02599
G1 X108.517 Y109.453 E.25972
G3 X109.412 Y108.519 I.939 J.004 E.02492
G1 X124.366 Y108.523 E.2611
M204 S250
G1 X124.426 Y108.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3285
M204 S5000
G1 X124.485 Y108.111 E.00094
G3 X125.695 Y109.393 I-.145 J1.349 E.03117
G1 X125.696 Y124.357 E.24297
G3 X124.338 Y125.697 I-1.357 J-.017 E.03435
G1 X109.443 Y125.696 E.24187
G3 X108.103 Y124.338 I.017 J-1.357 E.03435
G1 X108.104 Y109.443 E.24188
G3 X109.393 Y108.105 I1.353 J.014 E.03325
G1 X124.366 Y108.111 E.24313
; WIPE_START
G1 F3600
M204 S6000
G1 X124.485 Y108.111 E-.04487
G1 X124.698 Y108.151 E-.08244
G1 X124.947 Y108.246 E-.10136
G1 X125.172 Y108.386 E-.1007
G1 X125.364 Y108.568 E-.10072
G1 X125.509 Y108.77 E-.09426
G1 X125.575 Y108.896 E-.05415
G1 X125.656 Y109.131 E-.09461
G1 X125.689 Y109.358 E-.0869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 23 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer23 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.488 Y123.942 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3285
M204 S6000
G1 X124.487 Y122.228 E.02993
G3 X124.294 Y121.728 I.401 J-.443 E.00971
G1 X124.487 Y120.938 E.01421
G1 X124.487 Y116.709 E.07383
G3 X124.294 Y116.21 I.401 J-.442 E.00969
G1 X124.487 Y115.421 E.01419
G1 X124.486 Y111.191 E.07386
G3 X124.294 Y110.693 I.4 J-.441 E.00967
G1 X124.486 Y109.904 E.01417
G1 X124.486 Y109.475 E.0075
G2 X124.349 Y109.316 I-.175 J.013 E.00393
G1 X121.535 Y109.316 E.04912
G1 X121.665 Y110.003 E.01221
G1 X122.099 Y110.693 E.01422
G1 X122.957 Y111.382 E.01922
G3 X123.301 Y112.072 I-.515 J.688 E.01395
G1 X123.17 Y112.762 E.01226
G1 X122.737 Y113.452 E.01422
G1 X121.879 Y114.141 E.01922
G2 X121.535 Y114.831 I.515 J.688 E.01395
G1 X121.665 Y115.521 E.01226
G1 X122.099 Y116.21 E.01422
G1 X122.957 Y116.9 E.01922
G3 X123.301 Y117.59 I-.515 J.688 E.01395
G1 X123.17 Y118.279 E.01226
G1 X122.737 Y118.969 E.01422
G1 X121.879 Y119.659 E.01922
G2 X121.535 Y120.349 I.515 J.688 E.01395
G1 X121.665 Y121.038 E.01226
G1 X122.099 Y121.728 E.01422
G1 X122.957 Y122.418 E.01922
G3 X123.301 Y123.107 I-.515 J.688 E.01395
G1 X123.17 Y123.797 E.01226
G1 X122.735 Y124.488 E.01425
G1 X120.541 Y124.488 E.0383
G1 X120.411 Y123.797 E.01228
G1 X119.978 Y123.107 E.01422
G1 X119.12 Y122.418 E.01922
G3 X118.776 Y121.728 I.515 J-.688 E.01395
G1 X118.907 Y121.038 E.01226
G1 X119.34 Y120.349 E.01422
G1 X120.198 Y119.659 E.01922
G2 X120.542 Y118.969 I-.515 J-.688 E.01395
G1 X120.411 Y118.279 E.01226
G1 X119.978 Y117.59 E.01422
G1 X119.12 Y116.9 E.01922
G3 X118.776 Y116.21 I.515 J-.688 E.01395
G1 X118.907 Y115.521 E.01226
G1 X119.34 Y114.831 E.01422
G1 X120.198 Y114.141 E.01922
G2 X120.542 Y113.452 I-.515 J-.688 E.01395
G1 X120.411 Y112.762 E.01226
G1 X119.978 Y112.072 E.01422
G1 X119.12 Y111.382 E.01922
G3 X118.776 Y110.693 I.515 J-.688 E.01395
G1 X118.907 Y110.003 E.01226
G1 X119.338 Y109.315 E.01418
G1 X116.017 Y109.315 E.05798
G1 X116.148 Y110.003 E.01223
G1 X116.581 Y110.693 E.01422
G1 X117.439 Y111.382 E.01922
G3 X117.783 Y112.072 I-.515 J.688 E.01395
G1 X117.652 Y112.762 E.01226
G1 X117.219 Y113.452 E.01422
G1 X116.361 Y114.141 E.01922
G2 X116.017 Y114.831 I.515 J.688 E.01395
G1 X116.148 Y115.521 E.01226
G1 X116.581 Y116.21 E.01422
G1 X117.439 Y116.9 E.01922
G3 X117.783 Y117.59 I-.515 J.688 E.01395
G1 X117.652 Y118.279 E.01226
G1 X117.219 Y118.969 E.01422
G1 X116.361 Y119.659 E.01922
G2 X116.017 Y120.349 I.515 J.688 E.01395
G1 X116.148 Y121.038 E.01226
G1 X116.581 Y121.728 E.01422
G1 X117.439 Y122.418 E.01922
G3 X117.783 Y123.107 I-.515 J.688 E.01395
G1 X117.652 Y123.797 E.01226
G1 X117.218 Y124.488 E.01425
G1 X115.024 Y124.488 E.03831
G1 X114.894 Y123.797 E.01227
G1 X114.46 Y123.107 E.01422
G1 X113.602 Y122.418 E.01922
G3 X113.258 Y121.728 I.515 J-.688 E.01395
G1 X113.389 Y121.038 E.01226
G1 X113.822 Y120.349 E.01422
G1 X114.68 Y119.659 E.01922
G2 X115.024 Y118.969 I-.515 J-.688 E.01395
G1 X114.894 Y118.279 E.01226
G1 X114.46 Y117.59 E.01422
G1 X113.602 Y116.9 E.01922
G3 X113.258 Y116.21 I.515 J-.688 E.01395
G1 X113.389 Y115.521 E.01226
G1 X113.822 Y114.831 E.01422
G1 X114.68 Y114.141 E.01922
G2 X115.024 Y113.452 I-.515 J-.688 E.01395
G1 X114.894 Y112.762 E.01226
G1 X114.46 Y112.072 E.01422
G1 X113.602 Y111.382 E.01922
G3 X113.258 Y110.693 I.515 J-.688 E.01395
G1 X113.389 Y110.003 E.01226
G1 X113.821 Y109.315 E.01419
G1 X110.5 Y109.314 E.058
G1 X110.63 Y110.003 E.01224
G1 X111.063 Y110.693 E.01422
G1 X111.921 Y111.382 E.01922
G3 X112.265 Y112.072 I-.515 J.688 E.01395
G1 X112.135 Y112.762 E.01226
G1 X111.702 Y113.452 E.01422
G1 X110.844 Y114.141 E.01922
G2 X110.5 Y114.831 I.515 J.688 E.01395
G1 X110.63 Y115.521 E.01226
G1 X111.063 Y116.21 E.01422
G1 X111.921 Y116.9 E.01922
G3 X112.265 Y117.59 I-.515 J.688 E.01395
G1 X112.135 Y118.279 E.01226
G1 X111.702 Y118.969 E.01422
G1 X110.844 Y119.659 E.01922
G2 X110.5 Y120.349 I.515 J.688 E.01395
G1 X110.63 Y121.038 E.01226
G1 X111.063 Y121.728 E.01422
G1 X111.921 Y122.418 E.01922
G3 X112.265 Y123.107 I-.515 J.688 E.01395
G1 X112.135 Y123.797 E.01226
G1 X111.7 Y124.488 E.01425
G1 X109.506 Y124.488 E.03831
G1 X109.312 Y123.695 E.01425
G1 X109.312 Y119.47 E.07377
G2 X109.507 Y118.969 I-.402 J-.444 E.00972
G1 X109.312 Y118.178 E.01423
G1 X109.312 Y113.952 E.07378
G2 X109.507 Y113.452 I-.402 J-.444 E.00972
G1 X109.312 Y112.66 E.01423
G1 X109.312 Y110.946 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.312 Y112.66 E-.65138
G1 X109.38 Y112.938 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 24/83
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.7 I.313 J1.176 P1  F42000
G1 X124.414 Y108.932 Z2.7
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3260
M204 S6000
G1 X124.438 Y108.935 E.00043
G3 X124.871 Y109.42 I-.091 J.516 E.01223
G1 X124.872 Y124.344 E.26059
G3 X124.327 Y124.873 I-.523 J.006 E.01483
G1 X109.456 Y124.872 E.25966
G3 X108.927 Y124.327 I-.006 J-.523 E.01483
G1 X108.928 Y109.452 E.25973
G3 X109.42 Y108.929 I.516 J-.007 E.01385
G1 X124.354 Y108.932 E.26076
M204 S10000
G1 X124.432 Y108.505 F42000
G1 F3260
M204 S6000
G1 X124.456 Y108.505 E.00042
G3 X125.299 Y109.4 I-.104 J.943 E.02336
G1 X125.301 Y124.357 E.26114
G3 X124.338 Y125.301 I-.951 J-.006 E.02617
G1 X109.444 Y125.301 E.26007
G3 X108.499 Y124.338 I.006 J-.951 E.02617
G1 X108.499 Y109.441 E.26011
G3 X109.4 Y108.501 I.946 J.004 E.02508
G1 X124.372 Y108.505 E.26141
M204 S250
G1 X124.432 Y108.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3260
M204 S5000
G1 X124.497 Y108.093 E.00105
G3 X125.713 Y109.381 I-.146 J1.356 E.03131
G1 X125.714 Y124.368 E.24336
G3 X124.349 Y125.715 I-1.365 J-.018 E.03452
G1 X109.432 Y125.714 E.24223
G3 X108.085 Y124.349 I.018 J-1.365 E.03452
G1 X108.086 Y109.431 E.24224
G3 X109.381 Y108.087 I1.36 J.015 E.0334
G1 X124.372 Y108.093 E.24342
; WIPE_START
G1 F3600
M204 S6000
G1 X124.497 Y108.093 E-.04739
G1 X124.71 Y108.133 E-.08268
G1 X124.961 Y108.228 E-.102
G1 X125.187 Y108.37 E-.10127
G1 X125.381 Y108.553 E-.10131
G1 X125.526 Y108.755 E-.09442
G1 X125.592 Y108.882 E-.05446
G1 X125.674 Y109.118 E-.09476
G1 X125.705 Y109.33 E-.08171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 24 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer24 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.506 Y123.797 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3260
M204 S6000
G1 X124.506 Y122.083 E.02993
G3 X124.385 Y121.728 I.388 J-.33 E.0067
G1 X124.505 Y120.932 E.01405
G1 X124.505 Y116.564 E.07627
G3 X124.385 Y116.21 I.388 J-.329 E.00668
G1 X124.505 Y115.416 E.01403
G1 X124.504 Y111.046 E.0763
G3 X124.385 Y110.693 I.386 J-.327 E.00666
G1 X124.504 Y109.899 E.01401
G1 X124.504 Y109.463 E.00762
G2 X124.36 Y109.298 I-.184 J.015 E.00409
G1 X121.631 Y109.298 E.04765
G1 X121.69 Y110.003 E.01236
G1 X122.056 Y110.693 E.01363
G1 X122.811 Y111.382 E.01785
G3 X123.209 Y112.072 I-.673 J.849 E.01424
G1 X123.145 Y112.762 E.01209
G1 X122.779 Y113.452 E.01363
G1 X122.024 Y114.141 E.01785
G2 X121.626 Y114.831 I.673 J.849 E.01424
G1 X121.69 Y115.521 E.01209
G1 X122.056 Y116.21 E.01363
G1 X122.811 Y116.9 E.01785
G3 X123.209 Y117.59 I-.673 J.849 E.01424
G1 X123.145 Y118.279 E.01209
G1 X122.779 Y118.969 E.01363
G1 X122.024 Y119.659 E.01785
G2 X121.626 Y120.349 I.673 J.849 E.01424
G1 X121.69 Y121.038 E.01209
G1 X122.056 Y121.728 E.01363
G1 X122.811 Y122.418 E.01785
G3 X123.209 Y123.107 I-.673 J.849 E.01424
G1 X123.145 Y123.797 E.01209
G1 X122.758 Y124.506 E.01411
G1 X120.444 Y124.506 E.0404
G1 X120.386 Y123.797 E.01242
G1 X120.02 Y123.107 E.01363
G1 X119.266 Y122.418 E.01785
G3 X118.867 Y121.728 I.673 J-.849 E.01424
G1 X118.931 Y121.038 E.01209
G1 X119.297 Y120.349 E.01363
G1 X120.052 Y119.659 E.01785
G2 X120.45 Y118.969 I-.673 J-.849 E.01424
G1 X120.386 Y118.279 E.01209
G1 X120.02 Y117.59 E.01363
G1 X119.266 Y116.9 E.01785
G3 X118.867 Y116.21 I.673 J-.849 E.01424
G1 X118.931 Y115.521 E.01209
G1 X119.297 Y114.831 E.01363
G1 X120.052 Y114.141 E.01785
G2 X120.45 Y113.452 I-.673 J-.849 E.01424
G1 X120.386 Y112.762 E.01209
G1 X120.02 Y112.072 E.01363
G1 X119.266 Y111.382 E.01785
G3 X118.867 Y110.693 I.673 J-.849 E.01424
G1 X118.931 Y110.003 E.01209
G1 X119.315 Y109.297 E.01402
G1 X116.114 Y109.297 E.05589
G1 X116.173 Y110.003 E.01237
G1 X116.539 Y110.693 E.01363
G1 X117.293 Y111.382 E.01785
G3 X117.692 Y112.072 I-.673 J.849 E.01424
G1 X117.627 Y112.762 E.01209
M73 P66 R10
G1 X117.261 Y113.452 E.01363
G1 X116.507 Y114.141 E.01785
G2 X116.108 Y114.831 I.673 J.849 E.01424
G1 X116.173 Y115.521 E.01209
G1 X116.539 Y116.21 E.01363
G1 X117.293 Y116.9 E.01785
G3 X117.692 Y117.59 I-.673 J.849 E.01424
G1 X117.627 Y118.279 E.01209
G1 X117.261 Y118.969 E.01363
G1 X116.507 Y119.659 E.01785
G2 X116.108 Y120.349 I.673 J.849 E.01424
G1 X116.173 Y121.038 E.01209
G1 X116.539 Y121.728 E.01363
G1 X117.293 Y122.418 E.01785
G3 X117.692 Y123.107 I-.673 J.849 E.01424
G1 X117.627 Y123.797 E.01209
G1 X117.24 Y124.506 E.0141
G1 X114.927 Y124.506 E.0404
G1 X114.869 Y123.797 E.01242
G1 X114.503 Y123.107 E.01363
G1 X113.748 Y122.418 E.01785
G3 X113.35 Y121.728 I.673 J-.849 E.01424
G1 X113.414 Y121.038 E.01209
G1 X113.78 Y120.349 E.01363
G1 X114.534 Y119.659 E.01785
G2 X114.933 Y118.969 I-.673 J-.849 E.01424
G1 X114.869 Y118.279 E.01209
G1 X114.503 Y117.59 E.01363
G1 X113.748 Y116.9 E.01785
G3 X113.35 Y116.21 I.673 J-.849 E.01424
G1 X113.414 Y115.521 E.01209
G1 X113.78 Y114.831 E.01363
G1 X114.534 Y114.141 E.01785
G2 X114.933 Y113.452 I-.673 J-.849 E.01424
G1 X114.869 Y112.762 E.01209
G1 X114.503 Y112.072 E.01363
G1 X113.748 Y111.382 E.01785
G3 X113.35 Y110.693 I.673 J-.849 E.01424
G1 X113.414 Y110.003 E.01209
G1 X113.798 Y109.297 E.01404
G1 X110.596 Y109.296 E.0559
G1 X110.655 Y110.003 E.01239
G1 X111.021 Y110.693 E.01363
G1 X111.776 Y111.382 E.01785
G3 X112.174 Y112.072 I-.673 J.849 E.01424
G1 X112.11 Y112.762 E.01209
G1 X111.744 Y113.452 E.01363
G1 X110.989 Y114.141 E.01785
G2 X110.591 Y114.831 I.673 J.849 E.01424
G1 X110.655 Y115.521 E.01209
G1 X111.021 Y116.21 E.01363
G1 X111.776 Y116.9 E.01785
G3 X112.174 Y117.59 I-.673 J.849 E.01424
G1 X112.11 Y118.279 E.01209
G1 X111.744 Y118.969 E.01363
G1 X110.989 Y119.659 E.01785
G2 X110.591 Y120.349 I.673 J.849 E.01424
G1 X110.655 Y121.038 E.01209
G1 X111.021 Y121.728 E.01363
G1 X111.776 Y122.418 E.01785
G3 X112.174 Y123.107 I-.673 J.849 E.01424
G1 X112.11 Y123.797 E.01209
G1 X111.723 Y124.506 E.0141
G1 X109.414 Y124.492 E.04032
G1 X109.351 Y123.797 E.01218
G1 X109.294 Y123.689 E.00213
G1 X109.294 Y119.325 E.07621
G2 X109.415 Y118.969 I-.389 J-.331 E.00671
G1 X109.351 Y118.279 E.01209
G1 X109.294 Y118.172 E.00212
G1 X109.294 Y113.807 E.07622
G2 X109.415 Y113.452 I-.389 J-.331 E.00671
G1 X109.351 Y112.762 E.01209
G1 X109.294 Y112.655 E.00212
G1 X109.294 Y110.941 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.294 Y112.655 E-.65138
G1 X109.351 Y112.762 E-.0461
G1 X109.366 Y112.926 E-.06253
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 25/83
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I.313 J1.176 P1  F42000
G1 X124.426 Y108.914 Z2.8
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3245
M204 S6000
G1 X124.451 Y108.917 E.00044
G3 X124.889 Y109.408 I-.092 J.523 E.01238
G1 X124.89 Y124.356 E.261
G3 X124.338 Y124.891 I-.528 J.007 E.01504
G1 X109.444 Y124.89 E.26005
G3 X108.909 Y124.338 I-.007 J-.528 E.01504
G1 X108.91 Y109.44 E.26011
G3 X109.408 Y108.911 I.523 J-.006 E.01402
G1 X124.366 Y108.914 E.26117
M204 S10000
G1 X124.437 Y108.487 F42000
G1 F3245
M204 S6000
G1 X124.468 Y108.487 E.00053
G3 X125.317 Y109.388 I-.105 J.95 E.02352
G1 X125.319 Y124.368 E.26156
G3 X124.349 Y125.319 I-.957 J-.006 E.02637
G1 X109.432 Y125.319 E.26046
G3 X108.481 Y124.349 I.006 J-.957 E.02637
G1 X108.481 Y109.429 E.2605
G3 X109.388 Y108.483 I.953 J.005 E.02524
G1 X124.377 Y108.487 E.26172
M204 S250
G1 X124.437 Y108.075 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3245
M204 S5000
G1 X124.509 Y108.075 E.00116
G3 X125.731 Y109.369 I-.147 J1.363 E.03145
G1 X125.732 Y124.38 E.24375
G3 X124.36 Y125.733 I-1.372 J-.02 E.03468
G1 X109.42 Y125.732 E.2426
G3 X108.067 Y124.36 I.02 J-1.372 E.03469
G1 X108.068 Y109.419 E.24261
G3 X109.369 Y108.069 I1.367 J.016 E.03355
G1 X124.377 Y108.075 E.2437
; WIPE_START
G1 F3600
M204 S6000
G1 X124.509 Y108.075 E-.04985
G1 X124.723 Y108.115 E-.08309
G1 X124.976 Y108.211 E-.10259
G1 X125.203 Y108.354 E-.10183
G1 X125.397 Y108.537 E-.10156
G1 X125.543 Y108.74 E-.09481
G1 X125.61 Y108.868 E-.05497
G1 X125.692 Y109.104 E-.09489
G1 X125.721 Y109.303 E-.07641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 25 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer25 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.524 Y123.58 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3245
M204 S6000
G1 X124.524 Y121.866 E.02993
G1 X124.465 Y121.728 E.00261
G1 X124.467 Y121.038 E.01204
G1 X124.523 Y120.911 E.00243
G1 X124.523 Y116.347 E.07969
G1 X124.465 Y116.21 E.00258
G1 X124.467 Y115.521 E.01204
G1 X124.523 Y115.395 E.00241
G1 X124.522 Y110.827 E.07974
G1 X124.465 Y110.693 E.00255
G3 X124.522 Y109.451 I37.732 J1.104 E.0217
G2 X124.372 Y109.28 I-.192 J.018 E.00425
G1 X121.721 Y109.28 E.04629
G1 X121.709 Y110.003 E.01263
G1 X122.011 Y110.693 E.01315
G1 X122.689 Y111.382 E.01688
G3 X123.129 Y112.072 I-.868 J1.039 E.01451
G1 X123.127 Y112.762 E.01204
G1 X122.824 Y113.452 E.01315
G1 X122.147 Y114.141 E.01688
G2 X121.706 Y114.831 I.868 J1.039 E.01451
G1 X121.709 Y115.521 E.01204
G1 X122.011 Y116.21 E.01315
G1 X122.689 Y116.9 E.01688
G3 X123.129 Y117.59 I-.868 J1.039 E.01451
G1 X123.127 Y118.279 E.01204
G1 X122.824 Y118.969 E.01315
G1 X122.147 Y119.659 E.01688
G2 X121.706 Y120.349 I.868 J1.039 E.01451
G1 X121.709 Y121.038 E.01204
G1 X122.011 Y121.728 E.01315
G1 X122.689 Y122.418 E.01688
G3 X123.129 Y123.107 I-.868 J1.039 E.01451
G1 X123.127 Y123.797 E.01204
G1 X122.787 Y124.524 E.01401
G1 X120.354 Y124.524 E.04248
G1 X120.368 Y123.797 E.0127
G1 X120.065 Y123.107 E.01315
G1 X119.388 Y122.418 E.01688
G3 X118.948 Y121.728 I.868 J-1.039 E.01451
G1 X118.95 Y121.038 E.01204
G1 X119.252 Y120.349 E.01315
G1 X119.93 Y119.659 E.01688
G2 X120.37 Y118.969 I-.868 J-1.039 E.01451
G1 X120.368 Y118.279 E.01204
G1 X120.065 Y117.59 E.01315
G1 X119.388 Y116.9 E.01688
G3 X118.948 Y116.21 I.868 J-1.039 E.01451
G1 X118.95 Y115.521 E.01204
G1 X119.252 Y114.831 E.01315
G1 X119.93 Y114.141 E.01688
G2 X120.37 Y113.452 I-.868 J-1.039 E.01451
G1 X120.368 Y112.762 E.01204
G1 X120.065 Y112.072 E.01315
G1 X119.388 Y111.382 E.01688
G3 X118.948 Y110.693 I.868 J-1.039 E.01451
G1 X118.95 Y110.003 E.01204
G1 X119.286 Y109.279 E.01393
G1 X116.203 Y109.279 E.05382
G1 X116.191 Y110.003 E.01264
G1 X116.494 Y110.693 E.01315
G1 X117.171 Y111.382 E.01688
G3 X117.611 Y112.072 I-.868 J1.04 E.01451
G1 X117.609 Y112.762 E.01204
G1 X117.307 Y113.452 E.01315
G1 X116.629 Y114.141 E.01688
G2 X116.189 Y114.831 I.868 J1.04 E.01451
G1 X116.191 Y115.521 E.01204
G1 X116.494 Y116.21 E.01315
M73 P66 R9
G1 X117.171 Y116.9 E.01688
G3 X117.611 Y117.59 I-.868 J1.04 E.01451
G1 X117.609 Y118.279 E.01204
G1 X117.307 Y118.969 E.01315
G1 X116.629 Y119.659 E.01688
G2 X116.189 Y120.349 I.868 J1.04 E.01451
G1 X116.191 Y121.038 E.01204
G1 X116.494 Y121.728 E.01315
G1 X117.171 Y122.418 E.01688
G3 X117.611 Y123.107 I-.868 J1.04 E.01451
G1 X117.609 Y123.797 E.01204
G1 X117.27 Y124.524 E.01401
G1 X114.837 Y124.524 E.04248
G1 X114.85 Y123.797 E.01269
G1 X114.548 Y123.107 E.01315
G1 X113.87 Y122.418 E.01688
G3 X113.43 Y121.728 I.868 J-1.039 E.01451
G1 X113.432 Y121.038 E.01204
G1 X113.735 Y120.349 E.01315
G1 X114.412 Y119.659 E.01688
G2 X114.852 Y118.969 I-.868 J-1.039 E.01451
G1 X114.85 Y118.279 E.01204
G1 X114.548 Y117.59 E.01315
G1 X113.87 Y116.9 E.01688
G3 X113.43 Y116.21 I.868 J-1.039 E.01451
G1 X113.432 Y115.521 E.01204
G1 X113.735 Y114.831 E.01315
G1 X114.412 Y114.141 E.01688
G2 X114.852 Y113.452 I-.868 J-1.039 E.01451
G1 X114.85 Y112.762 E.01204
G1 X114.548 Y112.072 E.01315
G1 X113.87 Y111.382 E.01688
G3 X113.43 Y110.693 I.868 J-1.039 E.01451
G1 X113.432 Y110.003 E.01204
G1 X113.769 Y109.279 E.01395
G1 X110.686 Y109.278 E.05383
G1 X110.673 Y110.003 E.01266
G1 X110.976 Y110.693 E.01315
G1 X111.653 Y111.382 E.01688
G3 X112.094 Y112.072 I-.868 J1.039 E.01451
G1 X112.091 Y112.762 E.01204
G1 X111.789 Y113.452 E.01315
G1 X111.112 Y114.141 E.01688
G2 X110.671 Y114.831 I.868 J1.039 E.01451
G1 X110.673 Y115.521 E.01204
G1 X110.976 Y116.21 E.01315
G1 X111.653 Y116.9 E.01688
G3 X112.094 Y117.59 I-.868 J1.039 E.01451
G1 X112.091 Y118.279 E.01204
G1 X111.789 Y118.969 E.01315
G1 X111.112 Y119.659 E.01688
G2 X110.671 Y120.349 I.868 J1.039 E.01451
G1 X110.673 Y121.038 E.01204
G1 X110.976 Y121.728 E.01315
G1 X111.653 Y122.418 E.01688
G3 X112.094 Y123.107 I-.868 J1.039 E.01451
G1 X112.091 Y123.797 E.01204
G1 X111.753 Y124.524 E.014
G1 X109.478 Y124.524 E.03971
G3 X109.335 Y124.476 I-.014 J-.197 E.0027
G1 X109.333 Y123.797 E.01185
G1 X109.276 Y123.667 E.00247
G1 X109.276 Y119.109 E.0796
G1 X109.335 Y118.969 E.00264
G1 X109.333 Y118.279 E.01204
G1 X109.276 Y118.15 E.00247
G1 X109.276 Y113.591 E.07961
G1 X109.335 Y113.452 E.00264
G1 X109.276 Y110.919 E.04424
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.323 Y112.918 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 26/83
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.9 I.313 J1.176 P1  F42000
G1 X124.437 Y108.896 Z2.9
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3235
M204 S6000
G3 X124.907 Y109.396 I-.063 J.529 E.01301
G1 X124.908 Y124.368 E.26141
G3 X124.349 Y124.909 I-.535 J.007 E.01522
G1 X109.433 Y124.908 E.26044
G3 X108.891 Y124.349 I-.007 J-.535 E.01523
G1 X108.892 Y109.429 E.2605
G3 X109.432 Y108.892 I.534 J-.004 E.01483
G1 X124.377 Y108.896 E.26094
M204 S10000
G1 X124.443 Y108.469 F42000
G1 F3235
M204 S6000
G1 X124.48 Y108.469 E.00065
G3 X125.335 Y109.376 I-.106 J.957 E.02368
G1 X125.337 Y124.38 E.26197
G3 X124.36 Y125.337 I-.964 J-.007 E.02655
G1 X109.42 Y125.337 E.26085
G3 X108.463 Y124.36 I.007 J-.964 E.02655
G1 X108.463 Y109.418 E.26089
G3 X109.42 Y108.463 I.964 J.009 E.02616
G1 X124.383 Y108.469 E.26125
M204 S250
G1 X124.443 Y108.057 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G1 X124.521 Y108.057 E.00126
G3 X125.749 Y109.357 I-.148 J1.37 E.0316
G1 X125.75 Y124.392 E.24414
G3 X124.371 Y125.751 I-1.379 J-.02 E.03486
G1 X109.408 Y125.75 E.24297
G3 X108.049 Y124.371 I.02 J-1.379 E.03486
G1 X108.05 Y109.408 E.24298
G3 X109.408 Y108.05 I1.379 J.021 E.0345
G1 X124.383 Y108.057 E.24316
; WIPE_START
G1 F3600
M204 S6000
G1 X124.521 Y108.057 E-.05232
G1 X124.736 Y108.097 E-.08344
G1 X124.99 Y108.194 E-.10313
G1 X125.218 Y108.337 E-.10242
G1 X125.414 Y108.522 E-.1021
G1 X125.56 Y108.725 E-.09501
G1 X125.627 Y108.854 E-.05545
G1 X125.709 Y109.09 E-.09503
G1 X125.737 Y109.276 E-.07111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 26 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer26 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.542 Y123.452 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X124.542 Y121.737 E.02993
G1 X124.48 Y121.038 E.01225
G1 X124.541 Y120.862 E.00326
G1 X124.541 Y116.218 E.08108
G1 X124.48 Y115.521 E.01223
G1 X124.541 Y115.346 E.00323
G1 X124.537 Y110.693 E.08125
G3 X124.54 Y109.439 I6.381 J-.61 E.02192
G2 X124.384 Y109.262 I-.201 J.02 E.00441
G1 X121.804 Y109.261 E.04503
G1 X121.778 Y109.313 E.00102
G2 X121.963 Y110.693 I1.636 J.483 E.02503
G3 X122.882 Y111.727 I-62.617 J56.584 E.02417
G3 X122.873 Y113.452 I-1.619 J.853 E.03135
G2 X121.953 Y114.486 I62.555 J56.53 E.02417
G2 X121.963 Y116.21 I1.619 J.853 E.03135
G3 X122.882 Y117.245 I-62.617 J56.584 E.02417
G3 X122.873 Y118.969 I-1.619 J.853 E.03135
G2 X121.953 Y120.004 I62.555 J56.53 E.02417
G2 X121.963 Y121.728 I1.619 J.853 E.03135
G3 X122.882 Y122.763 I-62.617 J56.584 E.02417
G3 X122.873 Y124.487 I-1.619 J.853 E.03135
G1 X122.823 Y124.542 E.0013
G1 X120.27 Y124.542 E.04457
G1 X120.299 Y124.487 E.00108
G2 X120.114 Y123.107 I-1.636 J-.483 E.02503
G3 X119.194 Y122.073 I62.617 J-56.584 E.02417
G3 X119.204 Y120.349 I1.619 J-.853 E.03135
G2 X120.124 Y119.314 I-62.555 J-56.53 E.02417
G2 X120.114 Y117.59 I-1.619 J-.853 E.03135
G3 X119.194 Y116.555 I62.617 J-56.584 E.02417
G3 X119.204 Y114.831 I1.619 J-.853 E.03135
G2 X120.124 Y113.796 I-62.611 J-56.579 E.02417
G2 X120.114 Y112.072 I-1.619 J-.853 E.03135
G3 X119.194 Y111.038 I62.617 J-56.584 E.02417
G3 X119.204 Y109.313 I1.619 J-.853 E.03135
G1 X119.251 Y109.261 E.00123
G1 X116.287 Y109.26 E.05174
G1 X116.26 Y109.313 E.00105
G2 X116.445 Y110.693 I1.636 J.483 E.02503
G3 X117.365 Y111.727 I-62.617 J56.584 E.02417
G3 X117.355 Y113.452 I-1.619 J.853 E.03135
G2 X116.435 Y114.486 I62.617 J56.584 E.02417
G2 X116.445 Y116.21 I1.619 J.853 E.03135
G3 X117.365 Y117.245 I-62.617 J56.584 E.02417
G3 X117.355 Y118.969 I-1.619 J.853 E.03135
G2 X116.435 Y120.004 I62.617 J56.584 E.02417
G2 X116.445 Y121.728 I1.619 J.853 E.03135
G3 X117.365 Y122.763 I-62.617 J56.584 E.02417
G3 X117.355 Y124.487 I-1.619 J.853 E.03135
G1 X117.306 Y124.542 E.0013
G1 X114.753 Y124.542 E.04457
G1 X114.781 Y124.487 E.00108
G2 X114.596 Y123.107 I-1.636 J-.483 E.02503
G3 X113.677 Y122.073 I62.617 J-56.584 E.02417
G3 X113.686 Y120.349 I1.619 J-.853 E.03135
G2 X114.606 Y119.314 I-62.617 J-56.584 E.02417
G2 X114.596 Y117.59 I-1.619 J-.853 E.03135
G3 X113.677 Y116.555 I62.617 J-56.584 E.02417
G3 X113.686 Y114.831 I1.619 J-.853 E.03135
G2 X114.606 Y113.796 I-62.673 J-56.634 E.02417
G2 X114.596 Y112.072 I-1.619 J-.853 E.03135
G3 X113.677 Y111.038 I62.617 J-56.584 E.02417
G3 X113.686 Y109.313 I1.619 J-.853 E.03135
G1 X113.735 Y109.259 E.00127
G1 X110.771 Y109.258 E.05175
G1 X110.743 Y109.313 E.00107
M73 P67 R9
G2 X110.927 Y110.693 I1.636 J.483 E.02503
G3 X111.847 Y111.727 I-62.555 J56.53 E.02417
G3 X111.837 Y113.452 I-1.619 J.853 E.03135
G2 X110.918 Y114.486 I62.617 J56.584 E.02417
G2 X110.927 Y116.21 I1.619 J.853 E.03135
G3 X111.847 Y117.245 I-62.555 J56.53 E.02417
G3 X111.837 Y118.969 I-1.619 J.853 E.03135
G2 X110.918 Y120.004 I62.617 J56.584 E.02417
G2 X110.927 Y121.728 I1.619 J.853 E.03135
G3 X111.847 Y122.763 I-62.555 J56.53 E.02417
G3 X111.837 Y124.487 I-1.619 J.853 E.03135
G1 X111.788 Y124.542 E.00129
G1 X109.467 Y124.542 E.04053
G3 X109.278 Y124.436 I-.011 J-.201 E.00399
G3 X109.321 Y123.797 I1.261 J-.237 E.0113
G1 X109.258 Y123.618 E.00331
G1 X109.258 Y118.98 E.08098
G1 X109.321 Y118.279 E.01228
G1 X109.258 Y118.101 E.00331
G1 X109.258 Y113.462 E.081
G1 X109.321 Y112.762 E.01227
G1 X109.258 Y112.584 E.0033
G1 X109.258 Y110.87 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.258 Y112.584 E-.65138
G1 X109.321 Y112.762 E-.07176
G1 X109.312 Y112.858 E-.03686
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 27/83
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3 I.31 J1.177 P1  F42000
G1 X124.448 Y108.878 Z3
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3262
M204 S6000
G1 X124.449 Y108.878 E.00001
G3 X124.925 Y109.384 I-.063 J.536 E.01317
G1 X124.926 Y124.379 E.26183
G3 X124.359 Y124.927 I-.542 J.006 E.01541
G1 X109.421 Y124.926 E.26084
G3 X108.873 Y124.359 I-.006 J-.542 E.01541
G1 X108.874 Y109.417 E.26089
G3 X109.421 Y108.874 I.54 J-.003 E.015
G1 X124.388 Y108.878 E.26134
M204 S10000
G1 X124.448 Y108.451 F42000
G1 F3262
M204 S6000
G1 X124.491 Y108.451 E.00075
G3 X125.353 Y109.364 I-.107 J.964 E.02384
G1 X125.355 Y124.392 E.26239
G3 X124.371 Y125.355 I-.971 J-.008 E.02673
G1 X109.408 Y125.355 E.26125
G3 X108.445 Y124.371 I.008 J-.971 E.02673
G1 X108.445 Y109.406 E.26129
G3 X109.408 Y108.445 I.971 J.009 E.02633
G1 X124.388 Y108.451 E.26156
M204 S250
G1 X124.448 Y108.039 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3262
M204 S5000
G1 X124.532 Y108.039 E.00136
G3 X125.767 Y109.345 I-.149 J1.377 E.03174
G1 X125.768 Y124.404 E.24453
G3 X124.382 Y125.769 I-1.386 J-.022 E.03502
G1 X109.396 Y125.768 E.24334
G3 X108.031 Y124.382 I.022 J-1.386 E.03502
G1 X108.032 Y109.396 E.24335
G3 X109.396 Y108.032 I1.386 J.022 E.03465
G1 X124.388 Y108.039 E.24345
; WIPE_START
G1 F3600
M204 S6000
G1 X124.532 Y108.039 E-.05472
G1 X124.75 Y108.08 E-.08397
G1 X125.004 Y108.177 E-.10361
G1 X125.233 Y108.321 E-.1028
G1 X125.43 Y108.507 E-.10275
G1 X125.576 Y108.71 E-.09519
G1 X125.644 Y108.84 E-.05586
G1 X125.727 Y109.077 E-.0954
G1 X125.752 Y109.248 E-.0657
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 27 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer27 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X123.252 Y109.244 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3262
M204 S6000
G1 X124.395 Y109.244 E.01996
G3 X124.558 Y109.731 I-.192 J.335 E.0098
G2 X124.558 Y110.436 I.778 J.352 E.01269
G1 X124.559 Y115.246 E.08398
G2 X124.559 Y115.958 I.786 J.356 E.01281
G1 X124.559 Y120.761 E.08386
G2 X124.56 Y121.48 I.793 J.359 E.01294
G1 X124.56 Y124.345 E.05003
G3 X124.328 Y124.56 I-.226 J-.01 E.00612
G1 X122.865 Y124.56 E.02555
G1 X122.925 Y124.487 E.00166
G2 X122.477 Y122.418 I-1.651 J-.725 E.03951
G1 X121.91 Y121.728 E.01558
G3 X122.359 Y119.659 I1.651 J-.725 E.03951
G1 X122.925 Y118.969 E.01558
G2 X122.477 Y116.9 I-1.651 J-.725 E.03951
G1 X121.91 Y116.21 E.01558
G3 X122.359 Y114.141 I1.651 J-.725 E.03951
G1 X122.925 Y113.452 E.01558
G2 X122.477 Y111.382 I-1.651 J-.725 E.03951
G1 X121.91 Y110.693 E.01558
G3 X121.895 Y109.243 I1.806 J-.744 E.02593
G1 X119.209 Y109.243 E.04688
G1 X119.151 Y109.313 E.0016
G2 X119.6 Y111.382 I1.651 J.725 E.03951
G1 X120.166 Y112.072 E.01558
G3 X119.718 Y114.141 I-1.651 J.725 E.03951
G1 X119.151 Y114.831 E.01558
G2 X119.6 Y116.9 I1.651 J.725 E.03951
G1 X120.166 Y117.59 E.01558
G3 X119.718 Y119.659 I-1.651 J.725 E.03951
G1 X119.151 Y120.349 E.01558
G2 X119.6 Y122.418 I1.651 J.725 E.03951
G1 X120.166 Y123.107 E.01558
G3 X120.179 Y124.56 I-1.792 J.742 E.026
G1 X117.347 Y124.56 E.04945
G1 X117.407 Y124.487 E.00166
G2 X116.959 Y122.418 I-1.651 J-.725 E.03951
G1 X116.393 Y121.728 E.01558
G3 X116.841 Y119.659 I1.651 J-.725 E.03951
G1 X117.407 Y118.969 E.01558
G2 X116.959 Y116.9 I-1.651 J-.725 E.03951
G1 X116.393 Y116.21 E.01558
G3 X116.841 Y114.141 I1.651 J-.725 E.03951
G1 X117.407 Y113.452 E.01558
G2 X116.959 Y111.382 I-1.651 J-.725 E.03951
G1 X116.393 Y110.693 E.01558
G3 X116.378 Y109.242 I1.8 J-.743 E.02596
G1 X113.693 Y109.241 E.04688
G1 X113.634 Y109.313 E.00163
G2 X114.082 Y111.382 I1.651 J.725 E.03951
G1 X114.649 Y112.072 E.01558
G3 X114.2 Y114.141 I-1.651 J.725 E.03951
G1 X113.634 Y114.831 E.01558
G2 X114.082 Y116.9 I1.651 J.725 E.03951
G1 X114.649 Y117.59 E.01558
G3 X114.2 Y119.659 I-1.651 J.725 E.03951
G1 X113.634 Y120.349 E.01558
G2 X114.082 Y122.418 I1.651 J.725 E.03951
G1 X114.649 Y123.107 E.01558
G3 X114.662 Y124.56 I-1.793 J.743 E.026
G1 X112.948 Y124.56 E.02993
M204 S10000
G1 X109.24 Y116.285 F42000
G1 F3262
M204 S6000
G1 X109.24 Y117.999 E.02993
G3 X109.24 Y118.725 I-.802 J.363 E.01307
G1 X109.24 Y123.516 E.08365
G3 X109.24 Y124.244 I-.804 J.364 E.0131
G2 X109.455 Y124.56 I.217 J.083 E.00784
G1 X111.83 Y124.56 E.04146
G2 X111.958 Y123.107 I-1.803 J-.891 E.02606
G1 X111.441 Y122.418 E.01504
G3 X110.807 Y120.349 I1.23 J-1.509 E.04007
G1 X111.324 Y119.659 E.01504
G2 X111.958 Y117.59 I-1.23 J-1.509 E.04007
G1 X111.441 Y116.9 E.01504
G3 X110.807 Y114.831 I1.23 J-1.509 E.04007
G1 X111.324 Y114.141 E.01504
G2 X111.958 Y112.072 I-1.23 J-1.509 E.04007
G1 X111.441 Y111.382 E.01504
G3 X110.807 Y109.313 I1.23 J-1.509 E.04007
G1 X110.862 Y109.24 E.00159
G1 X109.454 Y109.24 E.02457
G2 X109.24 Y109.452 I.012 J.226 E.00576
G1 X109.24 Y112.482 E.0529
G3 X109.24 Y113.207 I-.8 J.362 E.01304
G1 X109.24 Y114.921 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X109.24 Y113.207 E-.65138
G1 X109.287 Y112.925 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 28/83
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.1 I.315 J1.175 P1  F42000
G1 X124.454 Y108.86 Z3.1
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3242
M204 S6000
G1 X124.461 Y108.86 E.00012
G3 X124.943 Y109.372 I-.064 J.543 E.01333
G1 X124.944 Y124.391 E.26224
G3 X124.37 Y124.945 I-.55 J.005 E.0156
G1 X109.409 Y124.944 E.26122
G3 X108.855 Y124.37 I-.005 J-.55 E.0156
G1 X108.856 Y109.406 E.26128
G3 X109.409 Y108.856 I.548 J-.003 E.01517
G1 X124.394 Y108.86 E.26164
M204 S10000
G1 X124.454 Y108.433 F42000
G1 F3242
M204 S6000
G1 X124.503 Y108.433 E.00087
G3 X125.371 Y109.352 I-.108 J.971 E.02399
G1 X125.373 Y124.403 E.2628
G3 X124.382 Y125.373 I-.979 J-.008 E.02692
G1 X109.397 Y125.373 E.26164
G3 X108.427 Y124.382 I.008 J-.979 E.02692
G1 X108.427 Y109.395 E.26168
G3 X109.397 Y108.427 I.978 J.01 E.0265
G1 X124.394 Y108.433 E.26186
M204 S250
G1 X124.454 Y108.021 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3242
M204 S5000
G1 X124.545 Y108.021 E.00147
G3 X125.785 Y109.332 I-.151 J1.384 E.03188
G1 X125.787 Y124.415 E.24492
G3 X124.393 Y125.787 I-1.394 J-.022 E.03519
G1 X109.385 Y125.787 E.2437
G3 X108.013 Y124.393 I.022 J-1.394 E.0352
G1 X108.013 Y109.384 E.24371
G3 X109.385 Y108.013 I1.393 J.023 E.03481
G1 X124.394 Y108.021 E.24372
; WIPE_START
G1 F3600
M204 S6000
G1 X124.545 Y108.021 E-.0572
G1 X124.763 Y108.062 E-.08426
G1 X125.019 Y108.16 E-.10418
G1 X125.249 Y108.305 E-.10348
G1 X125.447 Y108.491 E-.10331
G1 X125.593 Y108.695 E-.0953
G1 X125.662 Y108.826 E-.05633
G1 X125.744 Y109.063 E-.09537
G1 X125.768 Y109.221 E-.06057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 28 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer28 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.578 Y123.116 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3242
M204 S6000
G1 X124.578 Y121.402 E.02993
G3 X124.578 Y120.537 I.954 J-.433 E.01558
G1 X124.577 Y115.882 E.08128
G3 X124.577 Y115.023 I.947 J-.429 E.01545
G1 X124.576 Y110.361 E.0814
G3 X124.576 Y109.509 I.939 J-.426 E.01533
G2 X124.407 Y109.226 I-.204 J-.07 E.00656
G1 X121.972 Y109.225 E.04252
G2 X121.853 Y110.693 I1.741 J.879 E.02636
G1 X122.376 Y111.382 E.01512
G3 X122.982 Y113.452 I-1.225 J1.482 E.03996
G1 X122.459 Y114.141 E.01512
G2 X121.853 Y116.21 I1.225 J1.482 E.03996
G1 X122.376 Y116.9 E.01512
G3 X122.982 Y118.969 I-1.225 J1.482 E.03996
G1 X122.459 Y119.659 E.01512
G2 X121.853 Y121.728 I1.225 J1.482 E.03996
G1 X122.376 Y122.418 E.01512
G3 X122.982 Y124.487 I-1.225 J1.482 E.03996
G1 X122.913 Y124.578 E.00201
G1 X120.102 Y124.578 E.04908
G2 X120.224 Y123.107 I-1.727 J-.883 E.02644
G1 X119.7 Y122.418 E.01512
G3 X119.094 Y120.349 I1.225 J-1.482 E.03996
G1 X119.618 Y119.659 E.01512
G2 X120.224 Y117.59 I-1.225 J-1.482 E.03996
G1 X119.7 Y116.9 E.01512
G3 X119.094 Y114.831 I1.225 J-1.482 E.03996
G1 X119.618 Y114.141 E.01512
G2 X120.224 Y112.072 I-1.225 J-1.482 E.03996
G1 X119.7 Y111.382 E.01512
G3 X119.094 Y109.313 I1.225 J-1.482 E.03996
G1 X119.161 Y109.225 E.00194
G1 X116.455 Y109.224 E.04725
G2 X116.335 Y110.693 I1.735 J.881 E.02639
G1 X116.859 Y111.382 E.01512
G3 X117.465 Y113.452 I-1.225 J1.482 E.03996
G1 X116.941 Y114.141 E.01512
G2 X116.335 Y116.21 I1.225 J1.482 E.03996
G1 X116.859 Y116.9 E.01512
G3 X117.465 Y118.969 I-1.225 J1.482 E.03996
G1 X116.941 Y119.659 E.01512
G2 X116.335 Y121.728 I1.225 J1.482 E.03996
G1 X116.859 Y122.418 E.01512
G3 X117.465 Y124.487 I-1.225 J1.482 E.03996
G1 X117.395 Y124.578 E.002
G1 X114.584 Y124.578 E.04908
G2 X114.706 Y123.107 I-1.727 J-.883 E.02643
G1 X114.182 Y122.418 E.01512
G3 X113.577 Y120.349 I1.225 J-1.482 E.03996
G1 X114.1 Y119.659 E.01512
G2 X114.706 Y117.59 I-1.225 J-1.482 E.03996
G1 X114.182 Y116.9 E.01512
G3 X113.577 Y114.831 I1.225 J-1.482 E.03996
G1 X114.1 Y114.141 E.01512
G2 X114.706 Y112.072 I-1.225 J-1.482 E.03996
G1 X114.182 Y111.382 E.01512
G3 X113.577 Y109.313 I1.225 J-1.482 E.03996
G1 X113.645 Y109.223 E.00198
G1 X110.939 Y109.222 E.04725
G2 X110.818 Y110.693 I1.729 J.883 E.02642
G1 X111.341 Y111.382 E.01512
G3 X111.947 Y113.452 I-1.225 J1.482 E.03996
G1 X111.424 Y114.141 E.01512
G2 X110.818 Y116.21 I1.225 J1.482 E.03996
G1 X111.341 Y116.9 E.01512
G3 X111.947 Y118.969 I-1.225 J1.482 E.03996
G1 X111.424 Y119.659 E.01512
G2 X110.818 Y121.728 I1.225 J1.482 E.03996
G1 X111.341 Y122.418 E.01512
M73 P68 R9
G3 X111.947 Y124.487 I-1.225 J1.482 E.03996
G1 X111.878 Y124.578 E.002
G1 X109.444 Y124.578 E.0425
G3 X109.222 Y124.165 I.02 J-.277 E.00975
G2 X109.222 Y123.29 I-.965 J-.438 E.01575
G1 X109.222 Y118.647 E.08107
G2 X109.222 Y117.773 I-.963 J-.437 E.01572
G1 X109.222 Y113.128 E.0811
G2 X109.222 Y112.257 I-.961 J-.436 E.01569
G1 X109.222 Y110.543 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X109.222 Y112.257 E-.65138
G1 X109.273 Y112.538 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 29/83
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.288 J1.182 P1  F42000
G1 X124.459 Y108.842 Z3.2
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3277
M204 S6000
G1 X124.472 Y108.842 E.00022
G3 X124.961 Y109.36 I-.065 J.551 E.0135
G1 X124.963 Y124.403 E.26265
G3 X124.381 Y124.963 I-.556 J.005 E.01578
G1 X109.398 Y124.963 E.26161
G3 X108.837 Y124.381 I-.005 J-.556 E.01578
G1 X108.837 Y109.394 E.26167
G3 X109.397 Y108.837 I.555 J-.002 E.01534
G1 X124.399 Y108.842 E.26194
M204 S10000
G1 X124.459 Y108.415 F42000
G1 F3277
M204 S6000
G1 X124.515 Y108.415 E.00097
G3 X125.389 Y109.34 I-.109 J.979 E.02416
G1 X125.391 Y124.415 E.26322
G3 X124.392 Y125.392 I-.986 J-.009 E.0271
G1 X109.385 Y125.391 E.26204
G3 X108.408 Y124.392 I.009 J-.986 E.0271
G1 X108.409 Y109.383 E.26207
G3 X109.385 Y108.409 I.985 J.011 E.02666
G1 X124.399 Y108.415 E.26216
M204 S250
G1 X124.46 Y108.003 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3277
M204 S5000
G1 X124.556 Y108.003 E.00157
G3 X125.803 Y109.32 I-.152 J1.391 E.03203
G1 X125.805 Y124.427 E.24531
G3 X124.403 Y125.805 I-1.401 J-.023 E.03536
G1 X109.373 Y125.805 E.24407
G3 X107.995 Y124.403 I.023 J-1.401 E.03536
G1 X107.995 Y109.372 E.24408
G3 X109.373 Y107.995 I1.4 J.024 E.03496
G1 X124.4 Y108.003 E.24401
; WIPE_START
G1 F3600
M204 S6000
G1 X124.556 Y108.003 E-.05959
G1 X124.775 Y108.044 E-.08466
G1 X125.033 Y108.142 E-.10475
G1 X125.264 Y108.288 E-.10393
G1 X125.463 Y108.476 E-.10378
G1 X125.61 Y108.68 E-.09555
G1 X125.679 Y108.812 E-.05687
G1 X125.762 Y109.05 E-.09558
G1 X125.784 Y109.194 E-.0553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 29 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer29 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X120.801 Y109.207 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3277
M204 S6000
G1 X119.087 Y109.207 E.02993
G1 X119.031 Y109.313 E.0021
G2 X119.195 Y110.693 I1.62 J.507 E.02499
G3 X120.287 Y112.072 I-3.989 J4.279 E.03083
G3 X120.123 Y113.452 I-1.62 J.507 E.02499
G2 X119.031 Y114.831 I3.988 J4.278 E.03083
G2 X119.195 Y116.21 I1.62 J.507 E.02499
G3 X120.287 Y117.59 I-3.989 J4.279 E.03083
G3 X120.123 Y118.969 I-1.62 J.507 E.02499
G2 X119.031 Y120.349 I3.988 J4.278 E.03083
G2 X119.195 Y121.728 I1.62 J.507 E.02499
G3 X120.287 Y123.107 I-3.989 J4.279 E.03083
G3 X120.026 Y124.596 I-1.94 J.428 E.02708
G1 X117.471 Y124.596 E.04462
G1 X117.528 Y124.487 E.00216
G2 X117.364 Y123.107 I-1.62 J-.507 E.02499
G3 X116.272 Y121.728 I3.989 J-4.279 E.03083
G3 X116.436 Y120.349 I1.62 J-.507 E.02499
G2 X117.528 Y118.969 I-3.989 J-4.279 E.03083
G2 X117.364 Y117.59 I-1.62 J-.507 E.02499
G3 X116.272 Y116.21 I3.989 J-4.279 E.03083
G3 X116.436 Y114.831 I1.62 J-.507 E.02499
G2 X117.528 Y113.452 I-3.989 J-4.279 E.03083
G2 X117.364 Y112.072 I-1.62 J-.507 E.02499
G3 X116.272 Y110.693 I3.989 J-4.279 E.03083
G3 X116.531 Y109.206 I1.945 J-.428 E.02703
G1 X114.817 Y109.205 E.02993
M204 S10000
G1 X109.204 Y110.267 F42000
G1 F3277
M204 S6000
G1 X109.204 Y111.981 E.02993
G1 X109.319 Y112.762 E.01378
G1 X109.204 Y113.105 E.00632
G1 X109.204 Y117.498 E.07671
G1 X109.319 Y118.279 E.01379
G1 X109.204 Y118.623 E.00633
G1 X109.204 Y123.015 E.07669
G1 X109.319 Y123.797 E.0138
G2 X109.203 Y124.35 I.765 J.448 E.01003
G2 X109.432 Y124.596 I.243 J.004 E.00649
G1 X111.953 Y124.596 E.04402
G2 X111.846 Y123.107 I-1.884 J-.613 E.02672
G2 X110.935 Y122.073 I-237.123 J208.057 E.02408
G3 X110.919 Y120.349 I1.611 J-.877 E.03134
G3 X111.83 Y119.314 I235.373 J206.518 E.02408
G2 X111.846 Y117.59 I-1.611 J-.877 E.03134
G2 X110.935 Y116.555 I-237.123 J208.057 E.02408
G3 X110.919 Y114.831 I1.611 J-.877 E.03134
G3 X111.83 Y113.796 I234.61 J205.844 E.02408
G2 X111.846 Y112.072 I-1.611 J-.877 E.03134
G2 X110.935 Y111.038 I-237.123 J208.057 E.02408
G3 X110.919 Y109.313 I1.611 J-.877 E.03134
G1 X111.014 Y109.204 E.00253
G1 X113.57 Y109.205 E.04462
G2 X113.677 Y110.693 I1.887 J.611 E.0267
G2 X114.589 Y111.727 I237.123 J-208.057 E.02408
G3 X114.605 Y113.452 I-1.611 J.877 E.03134
G3 X113.693 Y114.486 I-237.123 J-208.057 E.02408
G2 X113.677 Y116.21 I1.611 J.877 E.03134
G2 X114.589 Y117.245 I237.123 J-208.057 E.02408
G3 X114.605 Y118.969 I-1.611 J.877 E.03134
G3 X113.693 Y120.004 I-237.123 J-208.057 E.02408
G2 X113.677 Y121.728 I1.611 J.877 E.03134
G2 X114.589 Y122.763 I237.123 J-208.057 E.02408
G3 X114.605 Y124.487 I-1.611 J.877 E.03134
G1 X114.509 Y124.596 E.00254
G1 X116.223 Y124.596 E.02993
M204 S10000
G1 X124.591 Y124.396 F42000
G1 F3277
M204 S6000
G3 X124.35 Y124.597 I-.235 J-.037 E.00598
G1 X122.988 Y124.596 E.02377
G1 X123.046 Y124.487 E.00216
G2 X122.882 Y123.107 I-1.62 J-.507 E.02499
G3 X121.79 Y121.728 I3.989 J-4.279 E.03083
G3 X121.954 Y120.349 I1.62 J-.507 E.02499
G2 X123.046 Y118.969 I-3.989 J-4.279 E.03083
G2 X122.882 Y117.59 I-1.62 J-.507 E.02499
G3 X121.79 Y116.21 I3.988 J-4.278 E.03083
G3 X121.954 Y114.831 I1.62 J-.507 E.02499
G2 X123.046 Y113.452 I-3.989 J-4.279 E.03083
G2 X122.882 Y112.072 I-1.62 J-.507 E.02499
G3 X121.79 Y110.693 I3.988 J-4.278 E.03083
G3 X122.047 Y109.207 I1.948 J-.428 E.02699
G1 X124.418 Y109.208 E.04141
G3 X124.56 Y109.292 I-.054 J.252 E.00292
G1 X124.481 Y110.003 E.01249
G1 X124.594 Y110.34 E.00621
G1 X124.595 Y114.743 E.07687
G1 X124.481 Y115.521 E.01373
G1 X124.595 Y115.86 E.00625
G1 X124.596 Y120.259 E.07681
G1 X124.481 Y121.038 E.01376
G1 X124.596 Y121.38 E.00629
G1 X124.596 Y123.094 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X124.596 Y121.38 E-.65138
G1 X124.505 Y121.109 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 30/83
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I1.217 J-.004 P1  F42000
G1 X124.465 Y108.824 Z3.3
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3301
M204 S6000
G1 X124.484 Y108.824 E.00033
G3 X124.979 Y109.348 I-.066 J.558 E.01366
G1 X124.981 Y124.414 E.26306
G3 X124.392 Y124.981 I-.564 J.004 E.01597
G1 X109.386 Y124.981 E.262
G3 X108.819 Y124.392 I-.004 J-.564 E.01597
G1 X108.819 Y109.383 E.26205
G3 X109.386 Y108.819 I.562 J-.002 E.01552
G1 X124.405 Y108.824 E.26224
M204 S10000
G1 X124.465 Y108.397 F42000
G1 F3301
M204 S6000
G1 X124.527 Y108.397 E.00108
G3 X125.407 Y109.328 I-.11 J.986 E.02431
G1 X125.409 Y124.427 E.26364
G3 X124.403 Y125.41 I-.993 J-.01 E.02729
G1 X109.373 Y125.409 E.26242
G3 X108.39 Y124.403 I.01 J-.993 E.02729
G1 X108.391 Y109.372 E.26245
G3 X109.373 Y108.391 I.992 J.011 E.02684
G1 X124.405 Y108.397 E.26246
M204 S250
G1 X124.465 Y107.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3301
M204 S5000
G1 X124.569 Y107.985 E.00168
G3 X125.821 Y109.308 I-.153 J1.399 E.03217
G1 X125.823 Y124.439 E.2457
G3 X124.414 Y125.823 I-1.408 J-.024 E.03553
G1 X109.361 Y125.823 E.24443
G3 X107.977 Y124.414 I.024 J-1.408 E.03554
G1 X107.977 Y109.36 E.24444
G3 X109.361 Y107.977 I1.407 J.024 E.03512
G1 X124.405 Y107.985 E.24429
; WIPE_START
G1 F3600
M204 S6000
G1 X124.569 Y107.985 E-.06204
G1 X124.789 Y108.027 E-.08509
G1 X125.047 Y108.125 E-.10491
G1 X125.279 Y108.271 E-.10454
G1 X125.48 Y108.461 E-.10465
G1 X125.627 Y108.665 E-.09564
G1 X125.697 Y108.798 E-.05732
G1 X125.78 Y109.037 E-.09592
G1 X125.799 Y109.167 E-.04989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 30 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer30 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X120.73 Y109.189 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3301
M204 S6000
G1 X119.016 Y109.189 E.02993
G1 X118.961 Y109.313 E.00238
G1 X118.952 Y110.003 E.01204
G1 X119.244 Y110.693 E.01308
G3 X120.357 Y112.072 I-2.361 J3.043 E.03122
G1 X120.365 Y112.762 E.01204
G1 X120.074 Y113.452 E.01308
G2 X118.961 Y114.831 I2.361 J3.043 E.03122
G1 X118.952 Y115.521 E.01204
G1 X119.244 Y116.21 E.01308
G3 X120.357 Y117.59 I-2.361 J3.043 E.03122
G1 X120.365 Y118.279 E.01204
G1 X120.074 Y118.969 E.01308
G2 X118.961 Y120.349 I2.361 J3.043 E.03122
G1 X118.952 Y121.038 E.01204
G1 X119.244 Y121.728 E.01308
G3 X120.357 Y123.107 I-2.361 J3.043 E.03122
G1 X120.365 Y123.797 E.01204
G1 X120.074 Y124.487 E.01308
G1 X119.95 Y124.614 E.0031
G1 X117.542 Y124.614 E.04205
G1 X117.598 Y124.487 E.00243
G1 X117.607 Y123.797 E.01204
G1 X117.315 Y123.107 E.01308
G3 X116.202 Y121.728 I2.361 J-3.043 E.03122
G1 X116.194 Y121.038 E.01204
G1 X116.485 Y120.349 E.01308
G2 X117.598 Y118.969 I-2.361 J-3.043 E.03122
G1 X117.607 Y118.279 E.01204
G1 X117.315 Y117.59 E.01308
G3 X116.202 Y116.21 I2.361 J-3.043 E.03122
G1 X116.194 Y115.521 E.01204
G1 X116.485 Y114.831 E.01308
G2 X117.598 Y113.452 I-2.361 J-3.043 E.03122
G1 X117.607 Y112.762 E.01204
G1 X117.315 Y112.072 E.01308
G3 X116.202 Y110.693 I2.361 J-3.043 E.03122
G1 X116.194 Y110.003 E.01204
G1 X116.485 Y109.313 E.01308
G1 X116.606 Y109.188 E.00304
G1 X113.499 Y109.187 E.05426
G1 X113.443 Y109.313 E.00241
G1 X113.435 Y110.003 E.01204
G1 X113.726 Y110.693 E.01308
G3 X114.839 Y112.072 I-2.361 J3.043 E.03122
G1 X114.848 Y112.762 E.01204
G1 X114.556 Y113.452 E.01308
G2 X113.443 Y114.831 I2.361 J3.043 E.03122
G1 X113.435 Y115.521 E.01204
G1 X113.726 Y116.21 E.01308
G3 X114.839 Y117.59 I-2.361 J3.043 E.03122
G1 X114.848 Y118.279 E.01204
G1 X114.556 Y118.969 E.01308
G2 X113.443 Y120.349 I2.361 J3.043 E.03122
G1 X113.435 Y121.038 E.01204
G1 X113.726 Y121.728 E.01308
G3 X114.839 Y123.107 I-2.361 J3.043 E.03122
G1 X114.848 Y123.797 E.01204
G1 X114.556 Y124.487 E.01308
G1 X114.433 Y124.614 E.00309
G1 X112.025 Y124.614 E.04205
G1 X112.08 Y124.487 E.00243
G1 X112.089 Y123.797 E.01204
G1 X111.797 Y123.107 E.01308
G3 X110.684 Y121.728 I2.361 J-3.043 E.03122
G1 X110.676 Y121.038 E.01204
G1 X110.968 Y120.349 E.01308
G2 X112.08 Y118.969 I-2.361 J-3.043 E.03122
G1 X112.089 Y118.279 E.01204
G1 X111.797 Y117.59 E.01308
G3 X110.684 Y116.21 I2.361 J-3.043 E.03122
G1 X110.676 Y115.521 E.01204
G1 X110.968 Y114.831 E.01308
G2 X112.08 Y113.452 I-2.361 J-3.043 E.03122
M73 P69 R9
G1 X112.089 Y112.762 E.01204
G1 X111.797 Y112.072 E.01308
G3 X110.684 Y110.693 I2.361 J-3.043 E.03122
G1 X110.676 Y110.003 E.01204
G1 X110.968 Y109.313 E.01308
G1 X111.09 Y109.186 E.00308
G1 X109.42 Y109.186 E.02916
G2 X109.186 Y109.418 I.018 J.252 E.00628
G1 X109.186 Y111.762 E.04092
G1 X109.322 Y112.072 E.00591
G1 X109.33 Y112.762 E.01204
G1 X109.186 Y113.103 E.00647
G1 X109.186 Y117.279 E.07292
G1 X109.322 Y117.59 E.00592
G1 X109.33 Y118.279 E.01204
G1 X109.186 Y118.621 E.00648
G1 X109.185 Y122.797 E.0729
G1 X109.322 Y123.107 E.00592
G1 X109.33 Y123.797 E.01204
G2 X109.185 Y124.36 I.593 J.453 E.01043
G2 X109.421 Y124.614 I.251 J.003 E.00667
G1 X110.522 Y124.614 E.01922
M204 S10000
G1 X124.614 Y124.358 F42000
G1 F3301
M204 S6000
G3 X124.36 Y124.615 I-.229 J.027 E.00724
G1 X123.06 Y124.615 E.02271
G1 X123.116 Y124.487 E.00244
G1 X123.124 Y123.797 E.01204
G1 X122.832 Y123.107 E.01308
G3 X121.72 Y121.728 I2.361 J-3.043 E.03122
G1 X121.711 Y121.038 E.01204
G1 X122.003 Y120.349 E.01308
G2 X123.116 Y118.969 I-2.362 J-3.044 E.03122
G1 X123.124 Y118.279 E.01204
G1 X122.832 Y117.59 E.01308
G3 X121.72 Y116.21 I2.361 J-3.043 E.03122
G1 X121.711 Y115.521 E.01204
G1 X122.003 Y114.831 E.01308
G2 X123.116 Y113.452 I-2.361 J-3.044 E.03122
G1 X123.124 Y112.762 E.01204
G1 X122.832 Y112.072 E.01308
G3 X121.72 Y110.693 I2.361 J-3.043 E.03122
G1 X121.711 Y110.003 E.01204
G1 X122.003 Y109.313 E.01308
G1 X122.123 Y109.189 E.00301
G1 X124.431 Y109.19 E.0403
G3 X124.517 Y109.225 I-.002 J.13 E.00166
G1 X124.47 Y110.003 E.01361
G1 X124.612 Y110.339 E.00637
G1 X124.613 Y114.525 E.07308
G1 X124.478 Y114.831 E.00584
G1 X124.47 Y115.521 E.01204
G1 X124.613 Y115.859 E.00641
G1 X124.614 Y120.04 E.07302
G1 X124.478 Y120.349 E.00587
G1 X124.47 Y121.038 E.01204
G1 X124.614 Y121.378 E.00644
G1 X124.614 Y123.092 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X124.614 Y121.378 E-.65138
G1 X124.502 Y121.115 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 31/83
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I1.217 J-.003 P1  F42000
G1 X124.471 Y108.806 Z3.4
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3327
M204 S6000
G1 X124.495 Y108.806 E.00043
G3 X124.999 Y109.386 I-.073 J.572 E.01469
G1 X124.999 Y124.426 E.26259
G3 X124.402 Y124.999 I-.571 J.003 E.01616
G1 X109.374 Y124.999 E.2624
G3 X108.801 Y124.402 I-.003 J-.571 E.01615
G1 X108.801 Y109.372 E.26244
G3 X109.374 Y108.801 I.569 J-.001 E.0157
G1 X124.411 Y108.806 E.26254
M204 S10000
G1 X124.471 Y108.379 F42000
G1 F3327
M204 S6000
G1 X124.539 Y108.379 E.00118
G3 X125.428 Y109.379 I-.121 J1.002 E.02555
G1 X125.427 Y124.439 E.26294
G3 X124.414 Y125.428 I-1 J-.011 E.02747
G1 X109.362 Y125.427 E.26282
G3 X108.372 Y124.414 I.011 J-1 E.02747
G1 X108.373 Y109.36 E.26285
G3 X109.362 Y108.373 I.999 J.012 E.02701
G1 X124.411 Y108.379 E.26276
M204 S250
G1 X124.471 Y107.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3327
M204 S5000
G1 X124.58 Y107.967 E.00178
G3 X125.841 Y109.373 I-.167 J1.418 E.0335
G1 X125.841 Y124.451 E.24484
G3 X124.425 Y125.841 I-1.415 J-.025 E.0357
G1 X109.349 Y125.841 E.2448
G3 X107.959 Y124.425 I.025 J-1.415 E.0357
G1 X107.959 Y109.349 E.24481
G3 X109.349 Y107.959 I1.415 J.025 E.03528
G1 X124.411 Y107.967 E.24457
; WIPE_START
G1 F3600
M204 S6000
G1 X124.58 Y107.967 E-.06437
G1 X124.802 Y108.009 E-.08557
G1 X125.061 Y108.108 E-.10534
G1 X125.295 Y108.255 E-.10518
G1 X125.496 Y108.445 E-.10524
G1 X125.643 Y108.65 E-.09577
G1 X125.761 Y108.902 E-.10559
G1 X125.819 Y109.139 E-.09294
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 31 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer31 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X120.646 Y109.171 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3327
M204 S6000
G1 X118.931 Y109.17 E.02993
G1 X118.882 Y109.313 E.00264
G1 X118.935 Y110.003 E.01208
G1 X119.29 Y110.693 E.01354
G1 X120.029 Y111.382 E.01766
G3 X120.436 Y112.072 I-.705 J.88 E.01429
G1 X120.383 Y112.762 E.01208
G1 X120.028 Y113.452 E.01354
G1 X119.289 Y114.141 E.01766
G2 X118.882 Y114.831 I.705 J.88 E.01429
G1 X118.935 Y115.521 E.01208
G1 X119.29 Y116.21 E.01354
G1 X120.029 Y116.9 E.01766
G3 X120.436 Y117.59 I-.705 J.88 E.01429
G1 X120.383 Y118.279 E.01208
G1 X120.028 Y118.969 E.01354
G1 X119.289 Y119.659 E.01766
G2 X118.882 Y120.349 I.705 J.88 E.01429
G1 X118.935 Y121.038 E.01208
G1 X119.29 Y121.728 E.01354
G1 X120.029 Y122.418 E.01766
G3 X120.436 Y123.107 I-.705 J.88 E.01429
G1 X120.383 Y123.797 E.01208
G1 X120.028 Y124.487 E.01354
G1 X119.872 Y124.633 E.00373
G1 X117.627 Y124.632 E.0392
G1 X117.677 Y124.487 E.00269
G1 X117.624 Y123.797 E.01208
G1 X117.269 Y123.107 E.01354
G1 X116.53 Y122.418 E.01766
G3 X116.123 Y121.728 I.705 J-.88 E.01429
G1 X116.176 Y121.038 E.01208
G1 X116.531 Y120.349 E.01354
G1 X117.27 Y119.659 E.01766
G2 X117.677 Y118.969 I-.705 J-.88 E.01429
G1 X117.624 Y118.279 E.01208
G1 X117.269 Y117.59 E.01354
G1 X116.53 Y116.9 E.01766
G3 X116.123 Y116.21 I.705 J-.88 E.01429
G1 X116.176 Y115.521 E.01208
G1 X116.531 Y114.831 E.01354
G1 X117.27 Y114.141 E.01766
G2 X117.677 Y113.452 I-.705 J-.88 E.01429
G1 X117.624 Y112.762 E.01208
G1 X117.269 Y112.072 E.01354
G1 X116.53 Y111.382 E.01766
G3 X116.123 Y110.693 I.705 J-.88 E.01429
G1 X116.176 Y110.003 E.01208
G1 X116.531 Y109.313 E.01354
G1 X116.685 Y109.17 E.00367
G1 X113.414 Y109.169 E.0571
G1 X113.365 Y109.313 E.00267
G1 X113.418 Y110.003 E.01208
G1 X113.772 Y110.693 E.01354
G1 X114.512 Y111.382 E.01766
G3 X114.918 Y112.072 I-.705 J.88 E.01429
G1 X114.865 Y112.762 E.01208
G1 X114.51 Y113.452 E.01354
G1 X113.771 Y114.141 E.01766
G2 X113.365 Y114.831 I.705 J.88 E.01429
G1 X113.418 Y115.521 E.01208
G1 X113.772 Y116.21 E.01354
G1 X114.512 Y116.9 E.01766
G3 X114.918 Y117.59 I-.705 J.88 E.01429
G1 X114.865 Y118.279 E.01208
G1 X114.51 Y118.969 E.01354
G1 X113.771 Y119.659 E.01766
G2 X113.365 Y120.349 I.705 J.88 E.01429
G1 X113.418 Y121.038 E.01208
G1 X113.772 Y121.728 E.01354
G1 X114.512 Y122.418 E.01766
G3 X114.918 Y123.107 I-.705 J.88 E.01429
G1 X114.865 Y123.797 E.01208
G1 X114.51 Y124.487 E.01354
G1 X114.354 Y124.632 E.00373
G1 X112.109 Y124.632 E.0392
G1 X112.159 Y124.487 E.00269
G1 X112.106 Y123.797 E.01208
G1 X111.752 Y123.107 E.01354
G1 X111.012 Y122.418 E.01766
G3 X110.606 Y121.728 I.705 J-.88 E.01429
G1 X110.659 Y121.038 E.01208
G1 X111.013 Y120.349 E.01354
G1 X111.753 Y119.659 E.01766
G2 X112.159 Y118.969 I-.705 J-.88 E.01429
G1 X112.106 Y118.279 E.01208
G1 X111.752 Y117.59 E.01354
G1 X111.012 Y116.9 E.01766
G3 X110.606 Y116.21 I.705 J-.88 E.01429
G1 X110.659 Y115.521 E.01208
G1 X111.013 Y114.831 E.01354
G1 X111.753 Y114.141 E.01766
G2 X112.159 Y113.452 I-.705 J-.88 E.01429
G1 X112.106 Y112.762 E.01208
G1 X111.752 Y112.072 E.01354
G1 X111.012 Y111.382 E.01766
G3 X110.606 Y110.693 I.705 J-.88 E.01429
G1 X110.659 Y110.003 E.01208
G1 X111.013 Y109.313 E.01354
G1 X111.169 Y109.168 E.00371
G1 X109.409 Y109.168 E.03073
G2 X109.168 Y109.407 I.02 J.261 E.00645
G1 X109.168 Y111.591 E.03813
G3 X109.4 Y112.072 I-.517 J.547 E.00954
G1 X109.347 Y112.762 E.01208
G1 X109.168 Y113.111 E.00686
G1 X109.168 Y117.108 E.06979
G3 X109.4 Y117.59 I-.518 J.547 E.00955
G1 X109.347 Y118.279 E.01208
G1 X109.168 Y118.629 E.00687
G1 X109.167 Y122.626 E.06978
G3 X109.4 Y123.107 I-.518 J.548 E.00955
G1 X109.347 Y123.797 E.01208
G2 X109.167 Y124.371 I.468 J.462 E.0109
G2 X109.409 Y124.632 I.26 J.002 E.00685
G1 X110.497 Y124.632 E.01898
M204 S10000
G1 X124.632 Y124.307 F42000
G1 F3327
M204 S6000
G3 X124.371 Y124.633 I-.244 J.072 E.00856
G1 X123.144 Y124.633 E.02142
G1 X123.194 Y124.487 E.00269
G1 X123.141 Y123.797 E.01208
G1 X122.787 Y123.107 E.01354
G3 X121.76 Y122.073 I3.594 J-4.594 E.02552
G1 X121.641 Y121.728 E.00637
G1 X121.694 Y121.038 E.01208
G1 X122.049 Y120.349 E.01354
G2 X123.076 Y119.314 I-3.594 J-4.594 E.02552
G1 X123.194 Y118.969 E.00637
G1 X123.141 Y118.279 E.01208
G1 X122.787 Y117.59 E.01354
G3 X121.76 Y116.555 I3.594 J-4.595 E.02552
G1 X121.641 Y116.21 E.00637
G1 X121.694 Y115.521 E.01208
G1 X122.049 Y114.831 E.01354
G2 X123.076 Y113.796 I-3.594 J-4.595 E.02552
G1 X123.194 Y113.452 E.00637
G1 X123.141 Y112.762 E.01208
G1 X122.787 Y112.072 E.01354
G3 X121.76 Y111.038 I3.594 J-4.594 E.02552
G1 X121.641 Y110.693 E.00637
G1 X121.694 Y110.003 E.01208
G1 X122.049 Y109.313 E.01354
G1 X122.201 Y109.171 E.00363
G1 X124.448 Y109.174 E.03924
G1 X124.4 Y109.313 E.00258
G1 X124.453 Y110.003 E.01208
G1 X124.633 Y110.353 E.00687
G1 X124.632 Y114.35 E.06978
G2 X124.4 Y114.831 I.517 J.547 E.00954
G1 X124.453 Y115.521 E.01208
G1 X124.632 Y115.87 E.00686
G1 X124.632 Y119.867 E.06979
G2 X124.4 Y120.349 I.517 J.547 E.00954
G1 X124.453 Y121.038 E.01208
G1 X124.632 Y121.387 E.00685
G1 X124.632 Y123.101 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.632 Y121.387 E-.65138
G1 X124.502 Y121.133 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 32/83
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I1.217 J-.002 P1  F42000
G1 X124.476 Y108.787 Z3.5
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3362
M204 S6000
G1 X124.507 Y108.787 E.00054
G3 X125.017 Y109.375 I-.074 J.579 E.01487
G1 X125.017 Y124.437 E.26299
G3 X124.413 Y125.017 I-.581 J-.001 E.01631
G1 X109.363 Y125.017 E.26279
G3 X108.783 Y124.413 I.001 J-.581 E.01631
G1 X108.783 Y109.36 E.26283
G3 X109.363 Y108.783 I.576 J0 E.01587
G1 X124.416 Y108.787 E.26284
M204 S10000
G1 X124.476 Y108.361 F42000
G1 F3362
M204 S6000
G1 X124.55 Y108.361 E.00129
G3 X125.446 Y109.368 I-.122 J1.01 E.02573
G1 X125.445 Y124.45 E.26333
G3 X124.425 Y125.446 I-1.009 J-.014 E.02764
G1 X109.35 Y125.445 E.26321
G3 X108.354 Y124.425 I.014 J-1.009 E.02764
G1 X108.355 Y109.348 E.26324
G3 X109.35 Y108.355 I1.007 J.013 E.02718
G1 X124.416 Y108.361 E.26307
M204 S250
G1 X124.477 Y107.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3362
M204 S5000
G1 X124.592 Y107.949 E.00188
G3 X125.859 Y109.362 I-.168 J1.425 E.03367
G1 X125.859 Y124.463 E.24521
G3 X124.436 Y125.859 I-1.423 J-.027 E.03587
G1 X109.337 Y125.859 E.24517
G3 X107.941 Y124.436 I.027 J-1.423 E.03587
G1 X107.941 Y109.337 E.24518
G3 X109.337 Y107.941 I1.422 J.026 E.03543
G1 X124.417 Y107.949 E.24486
; WIPE_START
G1 F3600
M204 S6000
G1 X124.592 Y107.949 E-.06677
G1 X124.814 Y107.991 E-.08585
G1 X125.075 Y108.09 E-.10597
G1 X125.31 Y108.239 E-.10571
G1 X125.513 Y108.43 E-.10581
G1 X125.66 Y108.635 E-.09601
G1 X125.779 Y108.888 E-.1061
G1 X125.833 Y109.112 E-.08777
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 32 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer32 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X120.544 Y109.153 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3362
M204 S6000
G1 X118.83 Y109.152 E.02993
G1 X118.793 Y109.313 E.00288
G1 X118.911 Y110.003 E.01222
G1 X119.332 Y110.693 E.01411
G1 X120.17 Y111.382 E.01894
G3 X120.525 Y112.072 I-.54 J.715 E.01401
G1 X120.406 Y112.762 E.01222
G1 X119.985 Y113.452 E.01411
G1 X119.148 Y114.141 E.01894
G2 X118.793 Y114.831 I.54 J.715 E.01401
G1 X118.911 Y115.521 E.01222
G1 X119.332 Y116.21 E.01411
G1 X120.17 Y116.9 E.01894
G3 X120.525 Y117.59 I-.54 J.715 E.01401
G1 X120.406 Y118.279 E.01222
G1 X119.985 Y118.969 E.01411
G1 X119.148 Y119.659 E.01894
G2 X118.793 Y120.349 I.54 J.715 E.01401
G1 X118.911 Y121.038 E.01222
G1 X119.332 Y121.728 E.01411
G1 X120.17 Y122.418 E.01894
G3 X120.525 Y123.107 I-.54 J.715 E.01401
G1 X120.406 Y123.797 E.01222
G1 X119.985 Y124.487 E.01411
G1 X119.786 Y124.651 E.0045
G1 X117.728 Y124.651 E.03594
G1 X117.766 Y124.487 E.00293
G1 X117.648 Y123.797 E.01222
G1 X117.226 Y123.107 E.01411
G1 X116.389 Y122.418 E.01894
G3 X116.034 Y121.728 I.54 J-.715 E.01401
G1 X116.153 Y121.038 E.01222
G1 X116.574 Y120.349 E.01411
G1 X117.411 Y119.659 E.01894
G2 X117.766 Y118.969 I-.54 J-.715 E.01401
G1 X117.648 Y118.279 E.01222
G1 X117.226 Y117.59 E.01411
G1 X116.389 Y116.9 E.01894
G3 X116.034 Y116.21 I.54 J-.715 E.01401
G1 X116.153 Y115.521 E.01222
G1 X116.574 Y114.831 E.01411
G1 X117.411 Y114.141 E.01894
G2 X117.766 Y113.452 I-.54 J-.715 E.01401
G1 X117.648 Y112.762 E.01222
G1 X117.226 Y112.072 E.01411
G1 X116.389 Y111.382 E.01894
G3 X116.034 Y110.693 I.54 J-.715 E.01401
G1 X116.153 Y110.003 E.01222
G1 X116.574 Y109.313 E.01411
G1 X116.77 Y109.152 E.00443
G1 X113.313 Y109.151 E.06036
G1 X113.275 Y109.313 E.00291
G1 X113.394 Y110.003 E.01222
G1 X113.815 Y110.693 E.01411
M73 P69 R8
G1 X114.652 Y111.382 E.01894
G3 X115.007 Y112.072 I-.54 J.714 E.01401
G1 X114.889 Y112.762 E.01222
G1 X114.468 Y113.452 E.01411
G1 X113.63 Y114.141 E.01894
G2 X113.275 Y114.831 I.54 J.715 E.01401
G1 X113.394 Y115.521 E.01222
G1 X113.815 Y116.21 E.01411
G1 X114.652 Y116.9 E.01894
G3 X115.007 Y117.59 I-.54 J.714 E.01401
G1 X114.889 Y118.279 E.01222
M73 P70 R8
G1 X114.468 Y118.969 E.01411
G1 X113.63 Y119.659 E.01894
G2 X113.275 Y120.349 I.54 J.715 E.01401
G1 X113.394 Y121.038 E.01222
G1 X113.815 Y121.728 E.01411
G1 X114.652 Y122.418 E.01894
G3 X115.007 Y123.107 I-.54 J.714 E.01401
G1 X114.889 Y123.797 E.01222
G1 X114.468 Y124.487 E.01411
G1 X114.269 Y124.65 E.00449
G1 X112.211 Y124.65 E.03594
G1 X112.248 Y124.487 E.00293
G1 X112.13 Y123.797 E.01222
G1 X111.709 Y123.107 E.01411
G1 X110.872 Y122.418 E.01894
G3 X110.517 Y121.728 I.54 J-.715 E.01401
G1 X110.635 Y121.038 E.01222
G1 X111.056 Y120.349 E.01411
G1 X111.893 Y119.659 E.01894
G2 X112.248 Y118.969 I-.54 J-.715 E.01401
G1 X112.13 Y118.279 E.01222
G1 X111.709 Y117.59 E.01411
G1 X110.872 Y116.9 E.01894
G3 X110.517 Y116.21 I.54 J-.715 E.01401
G1 X110.635 Y115.521 E.01222
G1 X111.056 Y114.831 E.01411
G1 X111.893 Y114.141 E.01894
G2 X112.248 Y113.452 I-.54 J-.715 E.01401
G1 X112.13 Y112.762 E.01222
G1 X111.709 Y112.072 E.01411
G1 X110.872 Y111.382 E.01894
G3 X110.517 Y110.693 I.54 J-.715 E.01401
G1 X110.635 Y110.003 E.01222
G1 X111.056 Y109.313 E.01411
G1 X111.254 Y109.15 E.00448
G1 X109.397 Y109.15 E.03242
G2 X109.15 Y109.396 I.022 J.27 E.00662
G1 X109.15 Y111.402 E.03503
G3 X109.49 Y112.072 I-.528 J.689 E.01357
G1 X109.371 Y112.762 E.01222
G1 X109.15 Y113.125 E.00742
G1 X109.15 Y116.919 E.06625
G3 X109.49 Y117.59 I-.528 J.689 E.01358
G1 X109.371 Y118.279 E.01222
G1 X109.149 Y118.643 E.00743
G1 X109.149 Y122.436 E.06624
G3 X109.49 Y123.107 I-.528 J.69 E.01359
G1 X109.371 Y123.797 E.01222
G1 X109.149 Y124.16 E.00743
G2 X109.398 Y124.65 I.296 J.158 E.01123
G1 X110.471 Y124.65 E.01874
M204 S10000
G1 X124.65 Y124.243 F42000
G1 F3362
M204 S6000
G3 X124.395 Y124.651 I-.24 J.133 E.01022
G1 X123.246 Y124.651 E.02006
G1 X123.284 Y124.487 E.00294
G1 X123.165 Y123.797 E.01222
G1 X122.744 Y123.107 E.01411
G1 X121.907 Y122.418 E.01894
G3 X121.552 Y121.728 I.54 J-.715 E.01401
G1 X121.67 Y121.038 E.01222
G1 X122.091 Y120.349 E.01411
G1 X122.928 Y119.659 E.01894
G2 X123.284 Y118.969 I-.54 J-.715 E.01401
G1 X123.165 Y118.279 E.01222
G1 X122.744 Y117.59 E.01411
G1 X121.907 Y116.9 E.01894
G3 X121.552 Y116.21 I.54 J-.715 E.01401
G1 X121.67 Y115.521 E.01222
G1 X122.091 Y114.831 E.01411
G1 X122.928 Y114.141 E.01894
G2 X123.284 Y113.452 I-.54 J-.715 E.01401
G1 X123.165 Y112.762 E.01222
G1 X122.744 Y112.072 E.01411
G1 X121.907 Y111.382 E.01894
G3 X121.552 Y110.693 I.54 J-.715 E.01401
G1 X121.67 Y110.003 E.01222
G1 X122.091 Y109.313 E.01411
G1 X122.285 Y109.153 E.00439
G1 X124.347 Y109.154 E.036
G1 X124.311 Y109.313 E.00286
G1 X124.429 Y110.003 E.01222
G1 X124.651 Y110.366 E.00743
G1 X124.651 Y114.16 E.06624
G2 X124.311 Y114.831 I.528 J.689 E.01358
G1 X124.429 Y115.521 E.01222
G1 X124.651 Y115.883 E.00742
G1 X124.65 Y119.678 E.06625
G2 X124.311 Y120.349 I.528 J.689 E.01357
G1 X124.429 Y121.038 E.01222
G1 X124.65 Y121.401 E.00741
G1 X124.65 Y123.115 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F16200
G1 X124.65 Y121.401 E-.65138
G1 X124.501 Y121.157 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 33/83
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I1.217 J-.002 P1  F42000
G1 X124.482 Y108.769 Z3.6
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4023
M204 S6000
G1 X124.519 Y108.769 E.00064
G3 X125.035 Y109.365 I-.075 J.586 E.01506
G1 X125.035 Y124.449 E.26338
G3 X124.424 Y125.035 I-.589 J-.002 E.0165
G1 X109.351 Y125.035 E.26318
G3 X108.765 Y124.424 I.002 J-.589 E.0165
G1 X108.765 Y109.348 E.26322
G3 X109.351 Y108.765 I.587 J.004 E.01601
G1 X124.422 Y108.769 E.26315
M204 S10000
G1 X124.482 Y108.343 F42000
G1 F4023
M204 S6000
G1 X124.562 Y108.343 E.0014
G3 X125.464 Y109.358 I-.123 J1.017 E.02591
G1 X125.463 Y124.462 E.26373
G3 X124.436 Y125.464 I-1.017 J-.015 E.02782
G1 X109.338 Y125.463 E.26361
G3 X108.336 Y124.436 I.015 J-1.017 E.02782
G1 X108.337 Y109.336 E.26363
G3 X109.338 Y108.337 I1.016 J.016 E.02732
G1 X124.422 Y108.343 E.26338
M204 S250
G1 X124.482 Y107.931 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.604 Y107.931 E.00198
G3 X125.877 Y109.351 I-.169 J1.432 E.03383
G1 X125.877 Y124.475 E.24558
G3 X124.447 Y125.877 I-1.43 J-.028 E.03603
G1 X109.325 Y125.877 E.24554
G3 X107.923 Y124.447 I.028 J-1.43 E.03603
G1 X107.923 Y109.325 E.24555
G3 X109.325 Y107.923 I1.43 J.028 E.03557
G1 X124.422 Y107.931 E.24515
; WIPE_START
M204 S6000
G1 X124.604 Y107.931 E-.06917
G1 X124.828 Y107.973 E-.08628
G1 X125.089 Y108.073 E-.10649
G1 X125.326 Y108.222 E-.10618
G1 X125.529 Y108.415 E-.10638
G1 X125.677 Y108.62 E-.09618
G1 X125.796 Y108.874 E-.10663
G1 X125.848 Y109.085 E-.0827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 33 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
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


; object ids of this layer33 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.465 Y109.143 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.36146
G1 F4023
M204 S6000
G1 X109.388 Y109.139 E.20885
G1 X109.206 Y109.202 E.00267
G1 X109.139 Y109.397 E.00286
G1 X109.138 Y124.407 E.20793
G1 X109.207 Y124.6 E.00284
G1 X109.399 Y124.661 E.0028
G1 X124.407 Y124.662 E.2079
G1 X124.6 Y124.593 E.00284
G1 X124.661 Y124.401 E.0028
G1 X124.662 Y109.395 E.20787
G1 X124.598 Y109.201 E.00284
G1 X124.52 Y109.167 E.00118
M204 S10000
G1 X120.461 Y109.516 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4023
M204 S6000
G1 X118.746 Y109.515 E.02993
G1 X118.881 Y110.003 E.00884
G1 X119.373 Y110.693 E.01479
G1 X120.35 Y111.382 E.02089
G3 X120.627 Y112.072 I-.42 J.569 E.01366
G1 X120.437 Y112.762 E.01249
G1 X119.945 Y113.452 E.01479
G1 X118.968 Y114.141 E.02089
G2 X118.691 Y114.831 I.42 J.569 E.01366
G1 X118.881 Y115.521 E.01249
G1 X119.373 Y116.21 E.01479
G1 X120.35 Y116.9 E.02089
G3 X120.627 Y117.59 I-.42 J.569 E.01366
G1 X120.437 Y118.279 E.01249
G1 X119.945 Y118.969 E.0148
G1 X118.968 Y119.659 E.02089
G2 X118.691 Y120.349 I.42 J.569 E.01366
G1 X118.881 Y121.038 E.01249
G1 X119.373 Y121.728 E.01479
G1 X120.35 Y122.418 E.02089
G1 X120.601 Y122.763 E.00744
G3 X120.087 Y124.288 I-2.113 J.138 E.02883
G1 X117.813 Y124.288 E.0397
G1 X117.678 Y123.797 E.00889
G1 X117.186 Y123.107 E.0148
G1 X116.209 Y122.418 E.02089
G3 X115.932 Y121.728 I.42 J-.569 E.01366
G1 X116.122 Y121.038 E.01249
G1 X116.614 Y120.349 E.01479
G1 X117.591 Y119.659 E.02089
G2 X117.868 Y118.969 I-.42 J-.569 E.01366
G1 X117.678 Y118.279 E.01249
G1 X117.186 Y117.59 E.01479
G1 X116.209 Y116.9 E.02089
G3 X115.932 Y116.21 I.42 J-.569 E.01366
G1 X116.122 Y115.521 E.01249
G1 X116.614 Y114.831 E.01479
G1 X117.591 Y114.141 E.02089
G2 X117.868 Y113.452 I-.42 J-.569 E.01366
G1 X117.678 Y112.762 E.01249
G1 X117.186 Y112.072 E.01479
G1 X116.209 Y111.382 E.02089
G1 X115.958 Y111.038 E.00744
G3 X116.47 Y109.514 I2.111 J-.138 E.02878
G1 X113.228 Y109.514 E.05661
G1 X113.363 Y110.003 E.00886
G1 X113.855 Y110.693 E.01479
G1 X114.832 Y111.382 E.02089
G3 X115.109 Y112.072 I-.42 J.569 E.01366
G1 X114.92 Y112.762 E.01249
G1 X114.427 Y113.452 E.01479
G1 X113.45 Y114.141 E.02089
G2 X113.173 Y114.831 I.42 J.569 E.01366
G1 X113.363 Y115.521 E.01249
G1 X113.855 Y116.21 E.01479
G1 X114.832 Y116.9 E.02089
G3 X115.109 Y117.59 I-.42 J.569 E.01366
G1 X114.92 Y118.279 E.01249
G1 X114.427 Y118.969 E.01479
G1 X113.45 Y119.659 E.02089
G2 X113.173 Y120.349 I.42 J.569 E.01366
G1 X113.363 Y121.038 E.01249
G1 X113.855 Y121.728 E.01479
G1 X114.832 Y122.418 E.02089
G1 X115.083 Y122.763 E.00744
G3 X114.569 Y124.288 I-2.113 J.138 E.02883
G1 X112.296 Y124.288 E.0397
G1 X112.161 Y123.797 E.00888
G1 X111.669 Y123.107 E.0148
G1 X110.691 Y122.418 E.02089
G3 X110.415 Y121.728 I.42 J-.569 E.01366
G1 X110.604 Y121.038 E.01249
G1 X111.096 Y120.349 E.01479
G1 X112.074 Y119.659 E.02089
G2 X112.35 Y118.969 I-.42 J-.569 E.01366
G1 X112.161 Y118.279 E.01249
G1 X111.669 Y117.59 E.01479
G1 X110.691 Y116.9 E.02089
G3 X110.415 Y116.21 I.42 J-.569 E.01366
G1 X110.604 Y115.521 E.01249
G1 X111.096 Y114.831 E.01479
G1 X112.074 Y114.141 E.02089
G2 X112.35 Y113.452 I-.42 J-.569 E.01366
G1 X112.161 Y112.762 E.01249
G1 X111.669 Y112.072 E.01479
G1 X110.691 Y111.382 E.02089
G1 X110.441 Y111.038 E.00744
G3 X110.954 Y109.513 I2.112 J-.138 E.02882
G1 X109.512 Y109.512 E.02517
G1 X109.512 Y111.654 E.03739
G3 X109.512 Y112.36 I-.821 J.353 E.01268
G1 X109.512 Y117.171 E.084
G3 X109.512 Y117.879 I-.821 J.354 E.0127
G1 X109.512 Y122.689 E.08398
G3 X109.512 Y123.397 I-.82 J.354 E.01272
G1 X109.512 Y124.288 E.01554
G1 X110.336 Y124.288 E.01438
M204 S10000
G1 X124.288 Y118.033 F42000
G1 F4023
M204 S6000
G1 X124.288 Y119.747 E.02993
G2 X124.288 Y120.908 I2.338 J.58 E.02047
G1 X124.288 Y124.288 E.05902
G1 X123.331 Y124.288 E.0167
G1 X123.196 Y123.797 E.00889
G1 X122.704 Y123.107 E.01479
G1 X121.726 Y122.418 E.02089
G3 X121.45 Y121.728 I.42 J-.569 E.01366
G1 X121.639 Y121.038 E.01249
G1 X122.132 Y120.349 E.01479
G1 X123.109 Y119.659 E.02089
G2 X123.386 Y118.969 I-.42 J-.569 E.01366
G1 X123.196 Y118.279 E.01249
G1 X122.704 Y117.59 E.01479
G1 X121.726 Y116.9 E.02089
G3 X121.45 Y116.21 I.42 J-.569 E.01366
G1 X121.639 Y115.521 E.01249
G1 X122.132 Y114.831 E.01479
G1 X123.109 Y114.141 E.02089
G2 X123.386 Y113.452 I-.42 J-.569 E.01366
G1 X123.196 Y112.762 E.01249
G1 X122.704 Y112.072 E.01479
G1 X121.726 Y111.382 E.02089
G3 X121.45 Y110.693 I.42 J-.569 E.01366
G3 X121.987 Y109.516 I1.872 J.144 E.02306
G1 X124.237 Y109.517 E.03929
G1 X124.288 Y109.876 E.00634
G1 X124.288 Y114.229 E.076
G2 X124.288 Y115.392 I2.341 J.582 E.02052
G1 X124.288 Y117.106 E.02993
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F16200
G1 X124.288 Y115.392 E-.65138
G1 X124.248 Y115.109 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 34/83
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
M106 S196.35
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I1.216 J.046 P1  F42000
G1 X124.488 Y108.751 Z3.7
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X124.531 Y108.751 E.00075
G3 X125.053 Y109.354 I-.075 J.594 E.01524
G1 X125.053 Y124.461 E.26377
G3 X124.435 Y125.053 I-.596 J-.003 E.01668
G1 X109.339 Y125.053 E.26357
G3 X108.747 Y124.435 I.003 J-.596 E.01668
G1 X108.747 Y109.337 E.26361
G3 X109.339 Y108.747 I.594 J.005 E.01618
G1 X124.428 Y108.751 E.26345
M204 S10000
G1 X124.488 Y108.325 F42000
G1 F6000
M204 S6000
G1 X124.574 Y108.325 E.00151
G3 X125.482 Y109.347 I-.124 J1.024 E.02609
G1 X125.481 Y124.474 E.26412
G3 X124.446 Y125.482 I-1.024 J-.016 E.028
G1 X109.326 Y125.481 E.264
G3 X108.318 Y124.446 I.016 J-1.024 E.028
G1 X108.319 Y109.325 E.26403
G3 X109.326 Y108.319 I1.023 J.017 E.0275
G1 X124.428 Y108.325 E.26368
M204 S250
G1 X124.488 Y107.913 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.616 Y107.913 E.00208
G3 X125.895 Y109.34 I-.17 J1.439 E.034
G1 X125.895 Y124.486 E.24594
G3 X124.458 Y125.895 I-1.437 J-.029 E.0362
G1 X109.314 Y125.895 E.24591
G3 X107.905 Y124.458 I.029 J-1.437 E.0362
G1 X107.905 Y109.313 E.24591
G3 X109.314 Y107.905 I1.437 J.029 E.03573
G1 X124.428 Y107.913 E.24543
; WIPE_START
M204 S6000
G1 X124.616 Y107.913 E-.07152
G1 X124.84 Y107.955 E-.08669
G1 X125.104 Y108.056 E-.10705
G1 X125.341 Y108.206 E-.10666
G1 X125.545 Y108.399 E-.10681
G1 X125.694 Y108.605 E-.09653
G1 X125.813 Y108.86 E-.1072
G1 X125.862 Y109.059 E-.07755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 34 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer34 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X123.74 Y124.879 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40255
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G2 X124.544 Y124.657 I-2.477 J-10.56 E.04326
G2 X124.676 Y124.424 I-.128 J-.226 E.01457
G1 X124.676 Y124.152 E.01409
G1 X122.77 Y124.676 E.1025
G1 X121.062 Y124.676 E.08854
G1 X124.676 Y123.683 E.19433
G1 X124.676 Y123.214 E.02434
G1 X119.355 Y124.676 E.28615
G1 X117.647 Y124.676 E.08854
G1 X124.676 Y122.744 E.37798
G1 X124.676 Y122.275 E.02434
G1 X115.94 Y124.676 E.4698
G1 X114.232 Y124.676 E.08854
G1 X124.676 Y121.806 E.56163
G1 X124.676 Y121.336 E.02434
G1 X112.525 Y124.676 E.65345
G1 X110.817 Y124.676 E.08854
G1 X124.676 Y120.867 E.74528
G1 X124.676 Y120.398 E.02434
G1 X109.238 Y124.64 E.8302
G3 X109.124 Y124.416 I.113 J-.199 E.01383
G1 X109.124 Y124.202 E.01107
G1 X124.676 Y119.928 E.83634
G1 X124.676 Y119.459 E.02434
G1 X109.124 Y123.733 E.83634
G1 X109.124 Y123.264 E.02434
G1 X124.676 Y118.99 E.83634
G1 X124.676 Y118.52 E.02434
G1 X109.124 Y122.794 E.83634
G1 X109.124 Y122.325 E.02434
G1 X124.676 Y118.051 E.83634
G1 X124.676 Y117.582 E.02434
G1 X109.124 Y121.856 E.83634
G1 X109.124 Y121.386 E.02434
G1 X124.676 Y117.112 E.83634
G1 X124.676 Y116.643 E.02434
G1 X109.124 Y120.917 E.83634
G1 X109.124 Y120.448 E.02434
G1 X124.676 Y116.174 E.83634
G1 X124.676 Y115.704 E.02434
G1 X109.124 Y119.978 E.83634
G1 X109.124 Y119.509 E.02434
G1 X124.676 Y115.235 E.83634
G1 X124.676 Y114.766 E.02434
G1 X109.124 Y119.04 E.83634
G1 X109.124 Y118.57 E.02434
G1 X124.676 Y114.296 E.83634
G1 X124.676 Y113.827 E.02434
G1 X109.124 Y118.101 E.83634
G1 X109.124 Y117.632 E.02434
G1 X124.676 Y113.358 E.83634
G1 X124.676 Y112.888 E.02434
G1 X109.124 Y117.162 E.83634
G1 X109.124 Y116.693 E.02434
G1 X124.676 Y112.419 E.83634
G1 X124.676 Y111.95 E.02434
G1 X109.124 Y116.224 E.83634
G1 X109.124 Y115.754 E.02434
G1 X124.676 Y111.48 E.83634
G1 X124.676 Y111.011 E.02434
G1 X109.124 Y115.285 E.83634
G1 X109.124 Y114.816 E.02434
G1 X124.676 Y110.542 E.83634
G1 X124.676 Y110.072 E.02434
G1 X109.124 Y114.346 E.83634
G1 X109.124 Y113.877 E.02434
G1 X124.676 Y109.603 E.83634
G2 X124.62 Y109.205 I-.604 J-.117 E.02122
G1 X124.566 Y109.164 E.00351
G1 X109.124 Y113.408 E.83043
G1 X109.124 Y112.938 E.02434
G1 X122.988 Y109.128 E.74554
G1 X121.282 Y109.128 E.08846
G1 X109.124 Y112.469 E.65379
G1 X109.124 Y112 E.02434
G1 X119.576 Y109.127 E.56205
G1 X117.87 Y109.127 E.08846
G1 X109.124 Y111.53 E.4703
G1 X109.124 Y111.061 E.02434
G1 X116.164 Y109.126 E.37856
G1 X114.458 Y109.126 E.08846
G1 X109.124 Y110.592 E.28681
M73 P71 R8
G1 X109.124 Y110.122 E.02434
G1 X112.752 Y109.125 E.19507
G1 X111.046 Y109.125 E.08846
G1 X108.922 Y109.709 E.11421
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3000
G1 X110.85 Y109.179 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 35/83
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
M106 S201.45
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.04 J1.216 P1  F42000
G1 X124.494 Y108.733 Z3.8
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.542 Y108.733 E.00085
G3 X125.071 Y109.343 I-.076 J.601 E.01543
G1 X125.071 Y124.472 E.26415
G3 X124.445 Y125.071 I-.603 J-.003 E.01687
G1 X109.328 Y125.071 E.26396
G3 X108.729 Y124.445 I.003 J-.603 E.01687
G1 X108.729 Y109.325 E.264
G3 X109.328 Y108.729 I.601 J.005 E.01636
G1 X124.434 Y108.733 E.26375
M204 S10000
G1 X124.494 Y108.307 F42000
G1 F6000
M204 S6000
G1 X124.586 Y108.307 E.00161
G3 X125.5 Y109.336 I-.125 J1.031 E.02628
G1 X125.499 Y124.485 E.26451
G3 X124.457 Y125.5 I-1.031 J-.017 E.02819
G1 X109.315 Y125.499 E.26439
G3 X108.3 Y124.457 I.016 J-1.031 E.02819
G1 X108.301 Y109.313 E.26442
G3 X109.315 Y108.301 I1.03 J.018 E.02767
G1 X124.434 Y108.307 E.26398
M204 S250
G1 X124.494 Y107.895 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.628 Y107.895 E.00218
G3 X125.914 Y109.329 I-.171 J1.446 E.03417
G1 X125.913 Y124.498 E.24631
G3 X124.468 Y125.914 I-1.445 J-.029 E.03638
G1 X109.302 Y125.913 E.24627
G3 X107.887 Y124.468 I.029 J-1.445 E.03638
G1 X107.887 Y109.301 E.24628
G3 X109.302 Y107.887 I1.444 J.03 E.03588
G1 X124.434 Y107.895 E.24571
; WIPE_START
M204 S6000
G1 X124.628 Y107.895 E-.0739
G1 X124.853 Y107.938 E-.08702
G1 X125.118 Y108.039 E-.10762
G1 X125.357 Y108.189 E-.10728
G1 X125.562 Y108.384 E-.10741
G1 X125.711 Y108.59 E-.09662
G1 X125.831 Y108.847 E-.10776
G1 X125.876 Y109.032 E-.07239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 35 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer35 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.899 Y109.416 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42699
G1 F10549
M204 S6000
G2 X124.574 Y109.109 I-1.344 J1.1 E.0074
G1 X124.491 Y109.085 E.00143
G1 X123.995 Y109.085 E.0082
G1 X124.72 Y109.81 E.01695
G1 X124.72 Y110.384 E.00948
G1 X123.421 Y109.085 E.03035
G1 X122.847 Y109.084 E.00948
G1 X124.72 Y110.957 E.04376
G1 X124.72 Y111.531 E.00948
G1 X122.274 Y109.084 E.05716
G1 X121.7 Y109.084 E.00948
G1 X124.72 Y112.104 E.07056
G1 X124.72 Y112.677 E.00948
G1 X121.126 Y109.084 E.08397
G1 X120.553 Y109.084 E.00948
G1 X124.72 Y113.251 E.09737
G1 X124.72 Y113.824 E.00948
G1 X119.979 Y109.084 E.11078
G1 X119.405 Y109.083 E.00948
G1 X124.72 Y114.398 E.12418
G1 X124.72 Y114.971 E.00948
G1 X118.832 Y109.083 E.13759
G1 X118.258 Y109.083 E.00948
G1 X124.72 Y115.545 E.15099
G1 X124.72 Y116.118 E.00948
G1 X117.684 Y109.083 E.16439
G1 X117.111 Y109.083 E.00948
G1 X124.72 Y116.692 E.1778
G1 X124.72 Y117.265 E.00948
G1 X116.537 Y109.083 E.1912
G1 X115.963 Y109.083 E.00948
G1 X124.72 Y117.839 E.20461
G1 X124.72 Y118.412 E.00948
G1 X115.39 Y109.082 E.21801
G1 X114.816 Y109.082 E.00948
G1 X124.72 Y118.986 E.23141
G1 X124.72 Y119.559 E.00948
G1 X114.242 Y109.082 E.24482
G1 X113.669 Y109.082 E.00948
G1 X124.72 Y120.133 E.25822
G1 X124.72 Y120.706 E.00948
G1 X113.095 Y109.082 E.27163
G1 X112.521 Y109.082 E.00948
G1 X124.719 Y121.28 E.28503
G1 X124.719 Y121.853 E.00948
G1 X111.948 Y109.081 E.29844
G1 X111.374 Y109.081 E.00948
G1 X124.719 Y122.427 E.31184
G1 X124.719 Y123 E.00948
G1 X110.8 Y109.081 E.32524
G1 X110.227 Y109.081 E.00948
G1 X124.719 Y123.574 E.33865
G1 X124.719 Y124.147 E.00948
G1 X109.653 Y109.081 E.35205
G2 X109.188 Y109.127 I-.144 J.921 E.00781
G1 X109.155 Y109.156 E.00073
G1 X124.644 Y124.645 E.36193
G3 X124.428 Y124.72 I-.201 J-.231 E.00387
G1 X124.145 Y124.72 E.00467
G1 X109.081 Y109.655 E.35201
G1 X109.081 Y110.229 E.00948
G1 X123.572 Y124.72 E.33861
G1 X122.998 Y124.72 E.00948
G1 X109.081 Y110.802 E.32521
G1 X109.081 Y111.376 E.00948
G1 X122.425 Y124.72 E.31181
G1 X121.851 Y124.72 E.00948
G1 X109.081 Y111.949 E.29841
G1 X109.081 Y112.523 E.00948
G1 X121.278 Y124.72 E.285
G1 X120.704 Y124.72 E.00948
G1 X109.081 Y113.096 E.2716
G1 X109.08 Y113.67 E.00948
G1 X120.13 Y124.72 E.2582
G1 X119.557 Y124.72 E.00948
G1 X109.08 Y114.243 E.2448
G1 X109.08 Y114.817 E.00948
G1 X118.983 Y124.72 E.2314
G1 X118.41 Y124.72 E.00948
G1 X109.08 Y115.39 E.218
G1 X109.08 Y115.964 E.00948
G1 X117.836 Y124.72 E.2046
G1 X117.263 Y124.72 E.00948
G1 X109.08 Y116.537 E.1912
G1 X109.08 Y117.111 E.00948
M73 P72 R8
G1 X116.689 Y124.72 E.1778
G1 X116.116 Y124.72 E.00948
G1 X109.08 Y117.684 E.1644
G1 X109.08 Y118.258 E.00948
G1 X115.542 Y124.72 E.15099
G1 X114.969 Y124.72 E.00948
G1 X109.08 Y118.831 E.13759
G1 X109.08 Y119.405 E.00948
G1 X114.395 Y124.72 E.12419
G1 X113.822 Y124.72 E.00948
G1 X109.08 Y119.978 E.11079
G1 X109.08 Y120.552 E.00948
G1 X113.248 Y124.72 E.09739
G1 X112.675 Y124.719 E.00948
G1 X109.08 Y121.125 E.08399
G1 X109.08 Y121.699 E.00948
G1 X112.101 Y124.719 E.07059
G1 X111.528 Y124.719 E.00948
G1 X109.08 Y122.272 E.05719
G1 X109.08 Y122.846 E.00948
G1 X110.954 Y124.719 E.04379
G1 X110.38 Y124.719 E.00948
G1 X109.08 Y123.419 E.03039
G1 X109.08 Y123.992 E.00948
G1 X109.807 Y124.719 E.01699
G1 X109.362 Y124.719 E.00735
G3 X109.165 Y124.651 I-.009 J-.291 E.00352
G1 X108.901 Y124.387 E.00618
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X109.165 Y124.651 E-.14214
G1 X109.234 Y124.694 E-.03093
G1 X109.362 Y124.719 E-.04949
G1 X109.807 Y124.719 E-.16908
G1 X109.122 Y124.034 E-.36836
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 36/83
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I.859 J.862 P1  F42000
G1 X124.499 Y108.715 Z3.9
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.554 Y108.715 E.00095
G3 X125.09 Y109.332 I-.077 J.608 E.01561
G1 X125.089 Y124.484 E.26455
G3 X124.456 Y125.09 I-.61 J-.004 E.01705
G1 X109.316 Y125.089 E.26435
G3 X108.71 Y124.456 I.004 J-.61 E.01705
G1 X108.711 Y109.314 E.26439
G3 X109.316 Y108.711 I.608 J.006 E.01652
G1 X124.439 Y108.715 E.26406
M204 S10000
G1 X124.499 Y108.289 F42000
G1 F6000
M204 S6000
G1 X124.598 Y108.289 E.00172
G3 X125.518 Y109.325 I-.126 J1.038 E.02646
G1 X125.517 Y124.497 E.2649
G3 X124.468 Y125.518 I-1.038 J-.017 E.02837
G1 X109.303 Y125.517 E.26479
G3 X108.282 Y124.468 I.017 J-1.038 E.02837
G1 X108.283 Y109.301 E.26481
G3 X109.303 Y108.283 I1.037 J.018 E.02783
G1 X124.439 Y108.289 E.26429
M204 S250
G1 X124.5 Y107.877 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.64 Y107.877 E.00229
G3 X125.932 Y109.319 I-.172 J1.454 E.03433
G1 X125.931 Y124.51 E.24667
G3 X124.479 Y125.932 I-1.452 J-.03 E.03654
G1 X109.29 Y125.931 E.24664
G3 X107.868 Y124.479 I.03 J-1.452 E.03654
G1 X107.869 Y109.29 E.24665
G3 X109.29 Y107.869 I1.451 J.031 E.03603
G1 X124.44 Y107.877 E.246
; WIPE_START
M204 S6000
G1 X124.64 Y107.877 E-.07628
G1 X124.866 Y107.92 E-.08736
G1 X125.132 Y108.022 E-.10814
G1 X125.372 Y108.173 E-.10786
G1 X125.578 Y108.368 E-.10792
G1 X125.727 Y108.575 E-.09687
G1 X125.849 Y108.833 E-.1083
G1 X125.891 Y109.005 E-.06727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 36 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer36 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X123.841 Y124.917 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42059
G1 F10669
M204 S6000
G1 X124.737 Y124.021 E.02062
G1 X124.737 Y123.456 E.00918
G1 X123.456 Y124.738 E.02948
G1 X122.891 Y124.738 E.00918
G1 X124.737 Y122.892 E.04246
G1 X124.738 Y122.327 E.00918
G1 X122.327 Y124.738 E.05544
G1 X121.762 Y124.738 E.00918
G1 X124.738 Y121.763 E.06842
G1 X124.738 Y121.198 E.00918
G1 X121.198 Y124.738 E.0814
G1 X120.633 Y124.738 E.00918
G1 X124.738 Y120.634 E.09439
G1 X124.738 Y120.069 E.00918
G1 X120.069 Y124.738 E.10737
G1 X119.505 Y124.738 E.00918
G1 X124.738 Y119.505 E.12035
G1 X124.738 Y118.94 E.00918
G1 X118.94 Y124.738 E.13333
G1 X118.376 Y124.738 E.00918
G1 X124.738 Y118.376 E.14631
G1 X124.738 Y117.811 E.00918
G1 X117.811 Y124.738 E.15929
G1 X117.247 Y124.738 E.00918
G1 X124.738 Y117.247 E.17227
G1 X124.738 Y116.682 E.00918
G1 X116.682 Y124.738 E.18526
G1 X116.118 Y124.738 E.00918
G1 X124.738 Y116.118 E.19824
G1 X124.738 Y115.553 E.00918
G1 X115.554 Y124.738 E.21122
G1 X114.989 Y124.738 E.00918
G1 X124.738 Y114.989 E.2242
G1 X124.738 Y114.425 E.00918
G1 X114.425 Y124.738 E.23718
G1 X113.86 Y124.738 E.00918
G1 X124.738 Y113.86 E.25016
G1 X124.738 Y113.296 E.00918
G1 X113.296 Y124.738 E.26314
G1 X112.731 Y124.738 E.00918
G1 X124.738 Y112.731 E.27612
G1 X124.738 Y112.167 E.00918
G1 X112.167 Y124.738 E.28911
G1 X111.603 Y124.738 E.00918
G1 X124.738 Y111.602 E.30209
G1 X124.738 Y111.038 E.00918
G1 X111.038 Y124.737 E.31507
G1 X110.474 Y124.737 E.00918
G1 X124.738 Y110.473 E.32805
G1 X124.738 Y109.909 E.00918
G1 X109.909 Y124.737 E.34103
G1 X109.346 Y124.736 E.00916
G1 X124.736 Y109.347 E.35394
G2 X124.451 Y109.067 I-.273 J-.006 E.00728
G1 X109.064 Y124.454 E.35388
G1 X109.062 Y123.891 E.00915
G1 X123.887 Y109.067 E.34094
G1 X123.322 Y109.067 E.00918
G1 X109.062 Y123.327 E.32796
G1 X109.062 Y122.762 E.00918
G1 X122.758 Y109.066 E.31498
G1 X122.194 Y109.066 E.00918
G1 X109.062 Y122.198 E.302
G1 X109.062 Y121.633 E.00918
G1 X121.629 Y109.066 E.28902
G1 X121.065 Y109.066 E.00918
G1 X109.062 Y121.069 E.27605
G1 X109.062 Y120.504 E.00918
G1 X120.501 Y109.066 E.26307
G1 X119.937 Y109.066 E.00918
G1 X109.062 Y119.94 E.25009
G1 X109.062 Y119.376 E.00918
G1 X119.372 Y109.065 E.23711
G1 X118.808 Y109.065 E.00918
G1 X109.062 Y118.811 E.22413
G1 X109.062 Y118.247 E.00918
G1 X118.244 Y109.065 E.21115
G1 X117.679 Y109.065 E.00918
G1 X109.062 Y117.682 E.19818
G1 X109.062 Y117.118 E.00918
G1 X117.115 Y109.065 E.1852
G1 X116.551 Y109.065 E.00918
G1 X109.062 Y116.553 E.17222
G1 X109.062 Y115.989 E.00918
G1 X115.986 Y109.064 E.15924
G1 X115.422 Y109.064 E.00918
G1 X109.062 Y115.424 E.14626
G1 X109.062 Y114.86 E.00918
G1 X114.858 Y109.064 E.13329
G1 X114.294 Y109.064 E.00918
G1 X109.062 Y114.295 E.12031
G1 X109.062 Y113.731 E.00918
G1 X113.729 Y109.064 E.10733
G1 X113.165 Y109.064 E.00918
G1 X109.062 Y113.166 E.09435
G1 X109.062 Y112.602 E.00918
G1 X112.601 Y109.064 E.08137
G1 X112.036 Y109.063 E.00918
G1 X109.062 Y112.037 E.06839
G1 X109.063 Y111.473 E.00918
G1 X111.472 Y109.063 E.05542
G1 X110.908 Y109.063 E.00918
G1 X109.063 Y110.908 E.04244
G1 X109.063 Y110.344 E.00918
G1 X110.344 Y109.063 E.02946
G1 X109.779 Y109.063 E.00918
G1 X108.883 Y109.959 E.02061
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.779 Y109.063 E-.48152
G1 X110.344 Y109.063 E-.21443
G1 X110.224 Y109.182 E-.06405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 37/83
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.041 J1.216 P1  F42000
G1 X124.505 Y108.697 Z4
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.565 Y108.697 E.00105
G3 X125.108 Y109.322 I-.078 J.615 E.01581
G1 X125.107 Y124.495 E.26494
G3 X124.467 Y125.108 I-.617 J-.005 E.01724
G1 X109.305 Y125.107 E.26474
G3 X108.692 Y124.467 I.005 J-.617 E.01724
G1 X108.693 Y109.303 E.26478
G3 X109.305 Y108.693 I.616 J.006 E.01671
G1 X124.445 Y108.697 E.26436
M204 S10000
G1 X124.505 Y108.271 F42000
G1 F6000
M204 S6000
G1 X124.61 Y108.271 E.00182
G3 X125.536 Y109.315 I-.127 J1.045 E.02664
G1 X125.535 Y124.509 E.2653
G3 X124.479 Y125.536 I-1.045 J-.018 E.02856
G1 X109.291 Y125.535 E.26518
G3 X108.264 Y124.479 I.018 J-1.045 E.02856
G1 X108.265 Y109.29 E.2652
G3 X109.291 Y108.265 I1.044 J.019 E.02801
G1 X124.445 Y108.271 E.26459
M204 S250
G1 X124.505 Y107.859 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.652 Y107.859 E.00238
G3 X125.95 Y109.308 I-.174 J1.461 E.0345
G1 X125.949 Y124.522 E.24704
G3 X124.49 Y125.95 I-1.459 J-.031 E.03672
G1 X109.278 Y125.949 E.24701
G3 X107.85 Y124.49 I.031 J-1.459 E.03672
G1 X107.851 Y109.278 E.24701
G3 X109.279 Y107.851 I1.458 J.031 E.0362
G1 X124.445 Y107.859 E.24628
; WIPE_START
M204 S6000
G1 X124.652 Y107.859 E-.0786
G1 X124.879 Y107.902 E-.08787
G1 X125.146 Y108.004 E-.10857
G1 X125.388 Y108.156 E-.10835
G1 X125.595 Y108.353 E-.10848
G1 X125.744 Y108.56 E-.09715
G1 X125.866 Y108.819 E-.10881
G1 X125.905 Y108.978 E-.06217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 37 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer37 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.935 Y109.947 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42139
G1 F10690
M204 S6000
G1 X124.037 Y109.049 E.0207
G1 X123.471 Y109.049 E.00922
G1 X124.756 Y110.333 E.02961
G1 X124.756 Y110.899 E.00922
G1 X122.906 Y109.048 E.04264
G1 X122.34 Y109.048 E.00922
G1 X124.756 Y111.464 E.05568
G1 X124.756 Y112.03 E.00922
G1 X121.774 Y109.048 E.06872
G1 X121.208 Y109.048 E.00922
G1 X124.756 Y112.596 E.08175
G1 X124.756 Y113.161 E.00922
G1 X120.643 Y109.048 E.09479
G1 X120.077 Y109.048 E.00922
G1 X124.756 Y113.727 E.10783
G1 X124.756 Y114.292 E.00922
G1 X119.511 Y109.047 E.12086
G1 X118.945 Y109.047 E.00922
G1 X124.756 Y114.858 E.1339
G1 X124.756 Y115.423 E.00922
G1 X118.38 Y109.047 E.14694
G1 X117.814 Y109.047 E.00922
G1 X124.756 Y115.989 E.15997
G1 X124.756 Y116.555 E.00922
G1 X117.248 Y109.047 E.17301
G1 X116.682 Y109.047 E.00922
G1 X124.756 Y117.12 E.18605
G1 X124.756 Y117.686 E.00922
G1 X116.117 Y109.046 E.19908
G1 X115.551 Y109.046 E.00922
G1 X124.756 Y118.251 E.21212
G1 X124.756 Y118.817 E.00922
G1 X114.985 Y109.046 E.22515
G1 X114.419 Y109.046 E.00922
G1 X124.756 Y119.382 E.23819
G1 X124.756 Y119.948 E.00922
G1 X113.854 Y109.046 E.25123
G1 X113.288 Y109.046 E.00922
G1 X124.756 Y120.513 E.26426
G1 X124.756 Y121.079 E.00922
G1 X112.722 Y109.046 E.2773
G1 X112.156 Y109.045 E.00922
G1 X124.756 Y121.645 E.29034
G1 X124.756 Y122.21 E.00922
G1 X111.591 Y109.045 E.30337
G1 X111.025 Y109.045 E.00922
G1 X124.756 Y122.776 E.31641
M73 P73 R8
G1 X124.756 Y123.341 E.00922
G1 X110.459 Y109.045 E.32945
G1 X109.893 Y109.045 E.00922
G1 X124.755 Y123.907 E.34248
G1 X124.754 Y124.471 E.00919
G1 X109.33 Y109.047 E.35543
G2 X109.046 Y109.329 I-.018 J.266 E.00737
G1 X124.471 Y124.754 E.35546
G1 X123.908 Y124.756 E.00918
G1 X109.045 Y109.893 E.34251
G1 X109.045 Y110.458 E.00922
G1 X123.342 Y124.756 E.32948
G1 X122.777 Y124.756 E.00922
G1 X109.044 Y111.024 E.31645
G1 X109.044 Y111.589 E.00922
G1 X122.211 Y124.756 E.30341
G1 X121.646 Y124.756 E.00922
G1 X109.044 Y112.155 E.29038
G1 X109.044 Y112.72 E.00922
G1 X121.08 Y124.756 E.27735
G1 X120.514 Y124.756 E.00922
G1 X109.044 Y113.286 E.26431
G1 X109.044 Y113.852 E.00922
G1 X119.949 Y124.756 E.25128
G1 X119.383 Y124.756 E.00922
G1 X109.044 Y114.417 E.23825
G1 X109.044 Y114.983 E.00922
G1 X118.817 Y124.756 E.22521
G1 X118.252 Y124.756 E.00922
G1 X109.044 Y115.548 E.21218
G1 X109.044 Y116.114 E.00922
G1 X117.686 Y124.756 E.19915
G1 X117.121 Y124.756 E.00922
G1 X109.044 Y116.679 E.18611
G1 X109.044 Y117.245 E.00922
G1 X116.555 Y124.756 E.17308
G1 X115.989 Y124.756 E.00922
G1 X109.044 Y117.81 E.16005
G1 X109.044 Y118.376 E.00922
G1 X115.424 Y124.756 E.14701
G1 X114.858 Y124.756 E.00922
G1 X109.044 Y118.942 E.13398
G1 X109.044 Y119.507 E.00922
G1 X114.293 Y124.756 E.12095
G1 X113.727 Y124.756 E.00922
G1 X109.044 Y120.073 E.10791
M73 P73 R7
G1 X109.044 Y120.638 E.00922
G1 X113.161 Y124.756 E.09488
G1 X112.596 Y124.756 E.00922
G1 X109.044 Y121.204 E.08185
G1 X109.044 Y121.769 E.00922
G1 X112.03 Y124.756 E.06881
G1 X111.465 Y124.756 E.00922
G1 X109.044 Y122.335 E.05578
G1 X109.044 Y122.901 E.00922
G1 X110.899 Y124.756 E.04275
G1 X110.333 Y124.756 E.00922
G1 X109.044 Y123.466 E.02971
G1 X109.044 Y124.032 E.00922
G1 X109.947 Y124.935 E.02081
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X109.044 Y124.032 E-.48535
G1 X109.044 Y123.466 E-.21492
G1 X109.155 Y123.577 E-.05973
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 38/83
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.847 J.873 P1  F42000
G1 X124.511 Y108.679 Z4.1
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.577 Y108.679 E.00116
G3 X125.126 Y109.311 I-.074 J.618 E.01601
G1 X125.125 Y124.507 E.26533
G3 X124.478 Y125.126 I-.624 J-.005 E.01743
G1 X109.293 Y125.125 E.26513
G3 X108.674 Y124.478 I.005 J-.624 E.01743
G1 X108.675 Y109.291 E.26517
G3 X109.293 Y108.675 I.623 J.007 E.01688
G1 X124.451 Y108.679 E.26467
M204 S10000
G1 X124.511 Y108.253 F42000
G1 F6000
M204 S6000
G1 X124.622 Y108.253 E.00193
G3 X125.554 Y109.304 I-.119 J1.045 E.02687
G1 X125.554 Y124.52 E.26569
G3 X124.489 Y125.554 I-1.052 J-.019 E.02875
G1 X109.28 Y125.554 E.26557
G3 X108.246 Y124.489 I.019 J-1.052 E.02875
G1 X108.246 Y109.278 E.26559
G3 X109.28 Y108.246 I1.052 J.02 E.02818
G1 X124.451 Y108.253 E.2649
M204 S250
G1 X124.511 Y107.841 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.664 Y107.841 E.00249
G3 X125.968 Y109.297 I-.162 J1.457 E.03473
G1 X125.967 Y124.533 E.24741
G3 X124.501 Y125.968 I-1.466 J-.032 E.03689
G1 X109.267 Y125.967 E.24737
G3 X107.832 Y124.501 I.032 J-1.466 E.03689
G1 X107.833 Y109.266 E.24738
G3 X109.267 Y107.833 I1.465 J.032 E.03635
G1 X124.451 Y107.841 E.24657
; WIPE_START
M204 S6000
G1 X124.664 Y107.841 E-.08099
G1 X124.892 Y107.884 E-.0882
G1 X125.161 Y107.987 E-.10915
G1 X125.406 Y108.142 E-.11002
G1 X125.611 Y108.338 E-.10795
G1 X125.761 Y108.545 E-.0973
G1 X125.883 Y108.805 E-.10929
G1 X125.919 Y108.951 E-.05709
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 38 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer38 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X123.865 Y124.954 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4222
G1 F10765
M204 S6000
G1 X124.774 Y124.045 E.02098
G1 X124.774 Y123.478 E.00925
G1 X123.478 Y124.774 E.02992
G1 X122.911 Y124.774 E.00925
G1 X124.774 Y122.911 E.04301
G1 X124.774 Y122.345 E.00925
G1 X122.344 Y124.774 E.0561
G1 X121.778 Y124.774 E.00925
G1 X124.774 Y121.778 E.06918
G1 X124.774 Y121.211 E.00925
G1 X121.211 Y124.774 E.08227
G1 X120.644 Y124.774 E.00925
G1 X124.774 Y120.644 E.09535
G1 X124.774 Y120.078 E.00925
G1 X120.077 Y124.774 E.10844
G1 X119.511 Y124.774 E.00925
G1 X124.774 Y119.511 E.12153
G1 X124.774 Y118.944 E.00925
G1 X118.944 Y124.774 E.13461
G1 X118.377 Y124.774 E.00925
G1 X124.774 Y118.377 E.1477
G1 X124.774 Y117.811 E.00925
G1 X117.811 Y124.774 E.16079
G1 X117.244 Y124.774 E.00925
G1 X124.774 Y117.244 E.17387
G1 X124.774 Y116.677 E.00925
G1 X116.677 Y124.774 E.18696
G1 X116.11 Y124.774 E.00925
G1 X124.774 Y116.11 E.20004
G1 X124.774 Y115.544 E.00925
G1 X115.544 Y124.774 E.21313
G1 X114.977 Y124.774 E.00925
G1 X124.774 Y114.977 E.22622
G1 X124.774 Y114.41 E.00925
G1 X114.41 Y124.774 E.2393
G1 X113.844 Y124.774 E.00925
G1 X124.774 Y113.843 E.25239
G1 X124.774 Y113.277 E.00925
G1 X113.277 Y124.774 E.26548
G1 X112.71 Y124.774 E.00925
G1 X124.774 Y112.71 E.27856
G1 X124.774 Y112.143 E.00925
G1 X112.144 Y124.774 E.29165
G1 X111.577 Y124.774 E.00925
G1 X124.774 Y111.576 E.30473
G1 X124.774 Y111.01 E.00925
G1 X111.01 Y124.774 E.31782
G1 X110.443 Y124.774 E.00925
G1 X124.774 Y110.443 E.33091
G1 X124.774 Y109.876 E.00925
G1 X109.877 Y124.774 E.34399
G1 X109.313 Y124.771 E.00921
G1 X124.77 Y109.314 E.35691
G2 X124.486 Y109.031 I-.269 J-.014 E.00738
G1 X109.029 Y124.488 E.35692
G1 X109.026 Y123.924 E.00921
G1 X123.919 Y109.031 E.3439
G1 X123.353 Y109.031 E.00925
G1 X109.026 Y123.357 E.33082
G1 X109.026 Y122.791 E.00925
G1 X122.786 Y109.03 E.31774
G1 X122.22 Y109.03 E.00925
G1 X109.026 Y122.224 E.30465
G1 X109.026 Y121.657 E.00925
G1 X121.653 Y109.03 E.29157
G1 X121.087 Y109.03 E.00925
G1 X109.026 Y121.09 E.27849
G1 X109.026 Y120.524 E.00925
G1 X120.52 Y109.03 E.2654
G1 X119.953 Y109.03 E.00925
G1 X109.026 Y119.957 E.25232
G1 X109.026 Y119.39 E.00925
G1 X119.387 Y109.029 E.23924
G1 X118.82 Y109.029 E.00925
G1 X109.026 Y118.823 E.22615
G1 X109.026 Y118.257 E.00925
G1 X118.254 Y109.029 E.21307
G1 X117.687 Y109.029 E.00925
G1 X109.026 Y117.69 E.19999
G1 X109.026 Y117.123 E.00925
G1 X117.121 Y109.029 E.1869
G1 X116.554 Y109.029 E.00925
G1 X109.026 Y116.556 E.17382
G1 X109.026 Y115.99 E.00925
G1 X115.987 Y109.028 E.16074
G1 X115.421 Y109.028 E.00925
G1 X109.026 Y115.423 E.14766
G1 X109.026 Y114.856 E.00925
G1 X114.854 Y109.028 E.13457
G1 X114.288 Y109.028 E.00925
G1 X109.026 Y114.289 E.12149
G1 X109.026 Y113.723 E.00925
G1 X113.721 Y109.028 E.10841
G1 X113.155 Y109.028 E.00925
G1 X109.026 Y113.156 E.09532
G1 X109.026 Y112.589 E.00925
G1 X112.588 Y109.027 E.08224
G1 X112.021 Y109.027 E.00925
G1 X109.026 Y112.022 E.06916
G1 X109.026 Y111.456 E.00925
G1 X111.455 Y109.027 E.05607
G1 X110.888 Y109.027 E.00925
G1 X109.026 Y110.889 E.04299
G1 X109.026 Y110.322 E.00925
G1 X110.322 Y109.027 E.02991
G1 X109.755 Y109.027 E.00925
G1 X109.026 Y109.755 E.01682
G1 X109.027 Y109.326 E.00701
G3 X109.106 Y109.109 I.326 J-.004 E.00386
G1 X109.368 Y108.847 E.00603
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.106 Y109.109 E-.14046
G1 X109.053 Y109.193 E-.03811
G1 X109.027 Y109.326 E-.05131
G1 X109.026 Y109.755 E-.16319
G1 X109.709 Y109.072 E-.36694
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 39/83
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.034 J1.216 P1  F42000
G1 X124.517 Y108.661 Z4.2
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.589 Y108.661 E.00126
G3 X125.144 Y109.3 I-.08 J.63 E.01617
G1 X125.143 Y124.519 E.26572
G3 X124.489 Y125.144 I-.632 J-.006 E.01761
G1 X109.281 Y125.143 E.26553
G3 X108.656 Y124.489 I.006 J-.632 E.01761
G1 X108.657 Y109.279 E.26556
G3 X109.281 Y108.657 I.63 J.008 E.01704
G1 X124.457 Y108.661 E.26497
M204 S10000
G1 X124.517 Y108.235 F42000
G1 F6000
M204 S6000
G1 X124.633 Y108.235 E.00203
G3 X125.572 Y109.293 I-.129 J1.06 E.027
G1 X125.572 Y124.532 E.26608
G3 X124.5 Y125.572 I-1.06 J-.02 E.02892
G1 X109.268 Y125.572 E.26597
G3 X108.228 Y124.5 I.02 J-1.06 E.02892
G1 X108.228 Y109.267 E.26599
G3 X109.268 Y108.228 I1.059 J.021 E.02834
M73 P74 R7
G1 X124.457 Y108.235 E.26521
M204 S250
G1 X124.517 Y107.823 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.676 Y107.823 E.00259
G3 X125.986 Y109.286 I-.176 J1.475 E.03483
G1 X125.985 Y124.545 E.24778
G3 X124.512 Y125.986 I-1.473 J-.033 E.03705
G1 X109.255 Y125.985 E.24775
G3 X107.814 Y124.512 I.033 J-1.473 E.03705
G1 X107.815 Y109.254 E.24775
G3 X109.255 Y107.815 I1.473 J.033 E.0365
G1 X124.457 Y107.823 E.24686
; WIPE_START
M204 S6000
G1 X124.676 Y107.823 E-.08333
G1 X124.906 Y107.867 E-.08865
G1 X125.175 Y107.97 E-.10959
G1 X125.437 Y108.138 E-.11851
G1 X125.628 Y108.322 E-.10063
G1 X125.778 Y108.53 E-.09741
G1 X125.901 Y108.792 E-.10988
G1 X125.934 Y108.925 E-.05201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 39 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer39 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.972 Y109.355 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42301
G1 F10802
M204 S6000
G1 X124.69 Y109.073 E.00652
G2 X124.538 Y109.013 I-.179 J.232 E.0027
G1 X124.062 Y109.013 E.00779
G1 X124.792 Y109.743 E.0169
G1 X124.792 Y110.311 E.00929
G1 X123.494 Y109.013 E.03005
G1 X122.926 Y109.012 E.00929
G1 X124.792 Y110.879 E.04319
G1 X124.792 Y111.447 E.00929
G1 X122.358 Y109.012 E.05633
G1 X121.79 Y109.012 E.00929
G1 X124.792 Y112.015 E.06947
G1 X124.792 Y112.583 E.00929
G1 X121.221 Y109.012 E.08262
G1 X120.653 Y109.012 E.00929
G1 X124.792 Y113.15 E.09576
G1 X124.792 Y113.718 E.00929
G1 X120.085 Y109.012 E.1089
G1 X119.517 Y109.011 E.00929
G1 X124.792 Y114.286 E.12204
G1 X124.792 Y114.854 E.00929
G1 X118.949 Y109.011 E.13518
G1 X118.381 Y109.011 E.00929
G1 X124.792 Y115.422 E.14833
G1 X124.792 Y115.99 E.00929
G1 X117.813 Y109.011 E.16147
G1 X117.245 Y109.011 E.00929
G1 X124.792 Y116.557 E.17461
G1 X124.792 Y117.125 E.00929
G1 X116.677 Y109.011 E.18775
G1 X116.109 Y109.01 E.00929
G1 X124.792 Y117.693 E.2009
G1 X124.792 Y118.261 E.00929
G1 X115.541 Y109.01 E.21404
G1 X114.973 Y109.01 E.00929
G1 X124.792 Y118.829 E.22718
G1 X124.792 Y119.397 E.00929
G1 X114.405 Y109.01 E.24032
G1 X113.837 Y109.01 E.00929
G1 X124.792 Y119.965 E.25347
G1 X124.792 Y120.532 E.00929
G1 X113.269 Y109.01 E.26661
G1 X112.701 Y109.009 E.00929
G1 X124.792 Y121.1 E.27975
G1 X124.792 Y121.668 E.00929
G1 X112.133 Y109.009 E.29289
G1 X111.565 Y109.009 E.00929
G1 X124.792 Y122.236 E.30604
G1 X124.792 Y122.804 E.00929
G1 X110.997 Y109.009 E.31918
G1 X110.429 Y109.009 E.00929
G1 X124.792 Y123.372 E.33232
G1 X124.792 Y123.94 E.00929
G1 X109.861 Y109.009 E.34546
G1 X109.297 Y109.013 E.00923
G1 X124.788 Y124.504 E.35842
G3 X124.505 Y124.789 I-.285 J0 E.00729
G1 X109.012 Y109.296 E.35846
G1 X109.008 Y109.86 E.00923
G1 X123.941 Y124.792 E.34549
G1 X123.373 Y124.792 E.00929
G1 X109.008 Y110.428 E.33235
G1 X109.008 Y110.996 E.00929
G1 X122.805 Y124.792 E.31921
G1 X122.237 Y124.792 E.00929
G1 X109.008 Y111.564 E.30608
G1 X109.008 Y112.131 E.00929
G1 X121.669 Y124.792 E.29294
G1 X121.101 Y124.792 E.00929
G1 X109.008 Y112.699 E.2798
G1 X109.008 Y113.267 E.00929
G1 X120.533 Y124.792 E.26666
G1 X119.965 Y124.792 E.00929
G1 X109.008 Y113.835 E.25352
G1 X109.008 Y114.403 E.00929
G1 X119.397 Y124.792 E.24038
G1 X118.83 Y124.792 E.00929
G1 X109.008 Y114.971 E.22724
G1 X109.008 Y115.539 E.00929
G1 X118.262 Y124.792 E.2141
G1 X117.694 Y124.792 E.00929
G1 X109.008 Y116.106 E.20096
G1 X109.008 Y116.674 E.00929
G1 X117.126 Y124.792 E.18782
G1 X116.558 Y124.792 E.00929
G1 X109.008 Y117.242 E.17468
G1 X109.008 Y117.81 E.00929
G1 X115.99 Y124.792 E.16154
G1 X115.422 Y124.792 E.00929
G1 X109.008 Y118.378 E.14841
G1 X109.008 Y118.946 E.00929
G1 X114.854 Y124.792 E.13527
G1 X114.286 Y124.792 E.00929
G1 X109.008 Y119.513 E.12213
G1 X109.008 Y120.081 E.00929
G1 X113.718 Y124.792 E.10899
G1 X113.15 Y124.792 E.00929
G1 X109.008 Y120.649 E.09585
G1 X109.008 Y121.217 E.00929
G1 X112.583 Y124.792 E.08271
G1 X112.015 Y124.792 E.00929
G1 X109.008 Y121.785 E.06957
G1 X109.008 Y122.353 E.00929
G1 X111.447 Y124.792 E.05643
G1 X110.879 Y124.792 E.00929
G1 X109.008 Y122.921 E.04329
G1 X109.008 Y123.488 E.00929
G1 X110.311 Y124.792 E.03015
G1 X109.743 Y124.792 E.00929
G1 X109.008 Y124.056 E.01701
G2 X109.032 Y124.623 I1.812 J.207 E.00932
G2 X109.092 Y124.708 I.225 J-.095 E.00172
G1 X109.355 Y124.971 E.00607
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X109.092 Y124.708 E-.14106
G1 X109.032 Y124.623 E-.03962
G1 X109.008 Y124.471 E-.05874
G1 X109.008 Y124.056 E-.15745
G1 X109.683 Y124.732 E-.36313
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 40/83
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.3 I.895 J.825 P1  F42000
G1 X124.523 Y108.643 Z4.3
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.601 Y108.643 E.00136
G3 X125.162 Y109.29 I-.076 J.633 E.01639
G1 X125.161 Y124.53 E.2661
G3 X124.499 Y125.162 I-.639 J-.007 E.0178
G1 X109.27 Y125.161 E.26592
G3 X108.638 Y124.499 I.007 J-.639 E.0178
G1 X108.639 Y109.268 E.26595
G3 X109.27 Y108.639 I.637 J.008 E.01722
G1 X124.463 Y108.643 E.26528
M204 S10000
G1 X124.523 Y108.217 F42000
G1 F6000
M204 S6000
G1 X124.645 Y108.217 E.00214
G3 X125.59 Y109.282 I-.121 J1.059 E.02723
G1 X125.59 Y124.544 E.26647
G3 X124.511 Y125.59 I-1.067 J-.021 E.02911
G1 X109.256 Y125.59 E.26636
G3 X108.21 Y124.511 I.021 J-1.067 E.02911
G1 X108.21 Y109.255 E.26638
G3 X109.256 Y108.21 I1.066 J.021 E.02851
G1 X124.463 Y108.217 E.26551
M204 S250
G1 X124.523 Y107.805 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.688 Y107.805 E.00269
G3 X126.004 Y109.275 I-.165 J1.471 E.03506
G1 X126.003 Y124.557 E.24815
G3 X124.523 Y126.004 I-1.48 J-.034 E.03722
G1 X109.243 Y126.003 E.24811
G3 X107.796 Y124.523 I.034 J-1.48 E.03722
G1 X107.797 Y109.242 E.24812
G3 X109.243 Y107.797 I1.48 J.034 E.03665
G1 X124.463 Y107.805 E.24714
; WIPE_START
M204 S6000
G1 X124.688 Y107.805 E-.08568
G1 X124.918 Y107.849 E-.08895
G1 X125.191 Y107.954 E-.11094
G1 X125.452 Y108.122 E-.11805
G1 X125.644 Y108.307 E-.10143
G1 X125.795 Y108.515 E-.09759
G1 X125.918 Y108.778 E-.11049
G1 X125.948 Y108.898 E-.04686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 40 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer40 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.458 Y124.99 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42381
G1 F10866
M204 S6000
G1 X124.732 Y124.715 E.00636
G2 X124.81 Y124.495 I-.259 J-.214 E.0039
G1 X124.81 Y124.069 E.00699
G1 X124.069 Y124.81 E.01718
G1 X123.5 Y124.81 E.00933
G1 X124.81 Y123.5 E.03037
G1 X124.81 Y122.931 E.00933
G1 X122.931 Y124.81 E.04356
G1 X122.362 Y124.81 E.00933
G1 X124.81 Y122.362 E.05675
G1 X124.81 Y121.793 E.00933
G1 X121.793 Y124.81 E.06995
G1 X121.224 Y124.81 E.00933
G1 X124.81 Y121.224 E.08314
G1 X124.81 Y120.655 E.00933
G1 X120.655 Y124.81 E.09633
G1 X120.086 Y124.81 E.00933
G1 X124.81 Y120.086 E.10952
G1 X124.81 Y119.517 E.00933
G1 X119.517 Y124.81 E.12271
G1 X118.948 Y124.81 E.00933
G1 X124.81 Y118.948 E.1359
G1 X124.81 Y118.379 E.00933
G1 X118.379 Y124.81 E.1491
G1 X117.81 Y124.81 E.00933
G1 X124.81 Y117.81 E.16229
G1 X124.81 Y117.241 E.00933
G1 X117.241 Y124.81 E.17548
G1 X116.672 Y124.81 E.00933
G1 X124.81 Y116.672 E.18867
G1 X124.81 Y116.103 E.00933
G1 X116.103 Y124.81 E.20186
G1 X115.534 Y124.81 E.00933
G1 X124.81 Y115.534 E.21505
G1 X124.81 Y114.965 E.00933
G1 X114.965 Y124.81 E.22824
G1 X114.396 Y124.81 E.00933
G1 X124.81 Y114.396 E.24144
G1 X124.81 Y113.827 E.00933
G1 X113.827 Y124.81 E.25463
G1 X113.258 Y124.81 E.00933
G1 X124.81 Y113.258 E.26782
G1 X124.81 Y112.689 E.00933
G1 X112.689 Y124.81 E.28101
G1 X112.12 Y124.81 E.00933
G1 X124.81 Y112.12 E.2942
G1 X124.81 Y111.551 E.00933
G1 X111.551 Y124.81 E.30739
G1 X110.982 Y124.81 E.00933
G1 X124.81 Y110.981 E.32059
G1 X124.81 Y110.412 E.00933
G1 X110.413 Y124.81 E.33378
G1 X109.844 Y124.81 E.00933
G1 X124.81 Y109.843 E.34697
G1 X124.804 Y109.281 E.00923
G1 X109.28 Y124.805 E.3599
G3 X108.994 Y124.522 I.003 J-.29 E.00729
G1 X124.521 Y108.995 E.35997
G1 X123.952 Y108.995 E.00932
G1 X108.99 Y123.957 E.34688
G1 X108.99 Y123.388 E.00933
G1 X123.383 Y108.994 E.33369
G1 X122.814 Y108.994 E.00933
G1 X108.99 Y122.819 E.3205
G1 X108.99 Y122.25 E.00933
G1 X122.246 Y108.994 E.30731
G1 X121.677 Y108.994 E.00933
G1 X108.99 Y121.681 E.29413
G1 X108.99 Y121.112 E.00933
G1 X121.108 Y108.994 E.28094
G1 X120.539 Y108.994 E.00933
G1 X108.99 Y120.543 E.26775
G1 X108.99 Y119.974 E.00933
G1 X119.97 Y108.994 E.25456
G1 X119.401 Y108.993 E.00933
G1 X108.99 Y119.405 E.24137
G1 X108.99 Y118.836 E.00933
G1 X118.832 Y108.993 E.22818
G1 X118.264 Y108.993 E.00933
G1 X108.99 Y118.267 E.215
G1 X108.99 Y117.698 E.00933
G1 X117.695 Y108.993 E.20181
G1 X117.126 Y108.993 E.00933
G1 X108.99 Y117.129 E.18862
G1 X108.99 Y116.56 E.00933
G1 X116.557 Y108.993 E.17543
G1 X115.988 Y108.992 E.00933
G1 X108.99 Y115.991 E.16224
G1 X108.99 Y115.421 E.00933
G1 X115.419 Y108.992 E.14905
G1 X114.851 Y108.992 E.00933
G1 X108.99 Y114.852 E.13587
G1 X108.99 Y114.283 E.00933
G1 X114.282 Y108.992 E.12268
M73 P75 R7
G1 X113.713 Y108.992 E.00933
G1 X108.99 Y113.714 E.10949
G1 X108.99 Y113.145 E.00933
G1 X113.144 Y108.992 E.0963
G1 X112.575 Y108.991 E.00933
G1 X108.99 Y112.576 E.08311
G1 X108.99 Y112.007 E.00933
G1 X112.006 Y108.991 E.06992
G1 X111.438 Y108.991 E.00933
G1 X108.99 Y111.438 E.05673
G1 X108.99 Y110.869 E.00933
G1 X110.869 Y108.991 E.04355
G1 X110.3 Y108.991 E.00933
G1 X108.99 Y110.3 E.03036
G1 X108.99 Y109.731 E.00933
G1 X109.731 Y108.991 E.01717
G1 X109.306 Y108.99 E.00697
G2 X109.086 Y109.066 I-.023 J.289 E.00391
G1 X108.811 Y109.341 E.00638
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X109.086 Y109.066 E-.14788
G1 X109.147 Y109.023 E-.02835
G1 X109.306 Y108.99 E-.06146
G1 X109.731 Y108.991 E-.16166
G1 X109.06 Y109.662 E-.36065
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 41/83
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.081 J1.214 P1  F42000
G1 X124.528 Y108.625 Z4.4
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.612 Y108.625 E.00146
G3 X125.18 Y109.279 I-.076 J.64 E.01657
G1 X125.179 Y124.542 E.2665
G3 X124.51 Y125.18 I-.646 J-.008 E.01799
G1 X109.258 Y125.179 E.26631
G3 X108.62 Y124.51 I.008 J-.646 E.01799
G1 X108.621 Y109.256 E.26634
G3 X109.258 Y108.621 I.646 J.011 E.01738
G1 X124.468 Y108.625 E.26558
M204 S10000
G1 X124.529 Y108.199 F42000
G1 F6000
M204 S6000
G1 X124.657 Y108.199 E.00224
G3 X125.608 Y109.272 I-.122 J1.066 E.02742
G1 X125.608 Y124.556 E.26686
G3 X124.522 Y125.608 I-1.074 J-.021 E.02929
G1 X109.244 Y125.608 E.26675
G3 X108.192 Y124.522 I.021 J-1.074 E.02929
G1 X108.192 Y109.243 E.26677
G3 X109.244 Y108.192 I1.077 J.026 E.02865
G1 X124.469 Y108.199 E.26582
M204 S250
G1 X124.529 Y107.787 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.7 Y107.787 E.00279
G3 X126.022 Y109.265 I-.166 J1.478 E.03523
G1 X126.021 Y124.569 E.24851
G3 X124.533 Y126.022 I-1.488 J-.035 E.03739
G1 X109.231 Y126.021 E.24848
G3 X107.778 Y124.533 I.035 J-1.488 E.03739
G1 X107.779 Y109.231 E.24848
G3 X109.231 Y107.779 I1.494 J.042 E.03677
G1 X124.469 Y107.787 E.24743
; WIPE_START
M204 S6000
G1 X124.7 Y107.787 E-.08798
G1 X124.931 Y107.831 E-.08939
G1 X125.205 Y107.936 E-.1115
G1 X125.467 Y108.105 E-.11839
G1 X125.661 Y108.291 E-.10205
G1 X125.811 Y108.5 E-.09786
G1 X125.936 Y108.764 E-.11105
G1 X125.962 Y108.871 E-.04179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 41 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer41 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.008 Y109.901 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42458
G1 F10876
M204 S6000
G1 X124.083 Y108.977 E.02147
G1 X123.513 Y108.976 E.00937
G1 X124.828 Y110.292 E.03055
G1 X124.828 Y110.862 E.00936
G1 X122.943 Y108.976 E.0438
G1 X122.372 Y108.976 E.00937
G1 X124.828 Y111.432 E.05704
G1 X124.828 Y112.002 E.00936
G1 X121.802 Y108.976 E.07029
G1 X121.232 Y108.976 E.00937
G1 X124.828 Y112.572 E.08353
G1 X124.828 Y113.142 E.00936
G1 X120.662 Y108.976 E.09678
G1 X120.091 Y108.975 E.00937
G1 X124.828 Y113.712 E.11003
G1 X124.828 Y114.282 E.00936
G1 X119.521 Y108.975 E.12327
G1 X118.951 Y108.975 E.00937
G1 X124.828 Y114.852 E.13652
G1 X124.828 Y115.422 E.00936
G1 X118.381 Y108.975 E.14976
G1 X117.81 Y108.975 E.00937
G1 X124.828 Y115.993 E.16301
G1 X124.828 Y116.563 E.00936
G1 X117.24 Y108.975 E.17625
G1 X116.67 Y108.974 E.00937
G1 X124.828 Y117.133 E.1895
G1 X124.828 Y117.703 E.00936
G1 X116.1 Y108.974 E.20274
G1 X115.529 Y108.974 E.00937
G1 X124.828 Y118.273 E.21599
G1 X124.828 Y118.843 E.00936
G1 X114.959 Y108.974 E.22923
G1 X114.389 Y108.974 E.00937
G1 X124.828 Y119.413 E.24248
G1 X124.828 Y119.983 E.00936
G1 X113.819 Y108.974 E.25572
G1 X113.248 Y108.973 E.00937
G1 X124.828 Y120.553 E.26897
G1 X124.828 Y121.123 E.00936
G1 X112.678 Y108.973 E.28222
G1 X112.108 Y108.973 E.00937
G1 X124.828 Y121.693 E.29546
G1 X124.828 Y122.263 E.00936
G1 X111.537 Y108.973 E.30871
G1 X110.967 Y108.973 E.00937
G1 X124.828 Y122.833 E.32195
G1 X124.828 Y123.403 E.00936
G1 X110.397 Y108.973 E.3352
G1 X109.827 Y108.972 E.00937
G1 X124.828 Y123.974 E.34844
G1 X124.822 Y124.537 E.00926
G1 X109.263 Y108.979 E.36139
G2 X108.978 Y109.264 I-.009 J.276 E.00742
G1 X124.538 Y124.824 E.36142
G1 X123.972 Y124.828 E.00929
G1 X108.972 Y109.828 E.34842
G1 X108.972 Y110.399 E.00936
G1 X123.402 Y124.828 E.33517
G1 X122.832 Y124.828 E.00936
G1 X108.972 Y110.969 E.32193
G1 X108.972 Y111.539 E.00936
G1 X122.262 Y124.828 E.30869
G1 X121.692 Y124.828 E.00936
G1 X108.972 Y112.109 E.29545
G1 X108.972 Y112.679 E.00936
G1 X121.122 Y124.828 E.28221
G1 X120.552 Y124.828 E.00936
G1 X108.972 Y113.249 E.26896
G1 X108.972 Y113.819 E.00936
G1 X119.981 Y124.828 E.25572
G1 X119.411 Y124.828 E.00936
G1 X108.972 Y114.389 E.24248
G1 X108.972 Y114.959 E.00936
G1 X118.841 Y124.828 E.22924
G1 X118.271 Y124.828 E.00936
G1 X108.972 Y115.529 E.216
G1 X108.972 Y116.099 E.00936
G1 X117.701 Y124.828 E.20275
G1 X117.131 Y124.828 E.00936
G1 X108.972 Y116.669 E.18951
G1 X108.972 Y117.239 E.00936
G1 X116.561 Y124.828 E.17627
G1 X115.991 Y124.828 E.00936
G1 X108.972 Y117.809 E.16303
G1 X108.972 Y118.38 E.00936
G1 X115.42 Y124.828 E.14978
G1 X114.85 Y124.828 E.00936
G1 X108.972 Y118.95 E.13654
G1 X108.972 Y119.52 E.00936
G1 X114.28 Y124.828 E.1233
G1 X113.71 Y124.828 E.00936
G1 X108.972 Y120.09 E.11006
G1 X108.972 Y120.66 E.00936
G1 X113.14 Y124.828 E.09682
G1 X112.57 Y124.828 E.00936
G1 X108.972 Y121.23 E.08357
G1 X108.972 Y121.8 E.00936
G1 X112 Y124.828 E.07033
G1 X111.43 Y124.828 E.00936
G1 X108.972 Y122.37 E.05709
G1 X108.972 Y122.94 E.00936
G1 X110.859 Y124.828 E.04385
G1 X110.289 Y124.828 E.00936
G1 X108.972 Y123.51 E.03061
G1 X108.972 Y124.08 E.00936
G1 X109.719 Y124.828 E.01736
G1 X109.293 Y124.828 E.007
G3 X109.067 Y124.745 I-.005 J-.338 E.00404
G1 X108.792 Y124.471 E.00638
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X109.067 Y124.745 E-.14751
G1 X109.152 Y124.799 E-.03845
G1 X109.293 Y124.828 E-.05454
G1 X109.719 Y124.828 E-.16191
G1 X109.054 Y124.162 E-.35759
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 42/83
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.5 I.863 J.858 P1  F42000
G1 X124.534 Y108.607 Z4.5
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.624 Y108.607 E.00157
G3 X125.198 Y109.268 I-.078 J.647 E.01676
G1 X125.197 Y124.554 E.26688
G3 X124.521 Y125.198 I-.655 J-.011 E.01816
G1 X109.246 Y125.197 E.26669
G3 X108.602 Y124.521 I.008 J-.653 E.01818
G1 X108.603 Y109.245 E.26673
G3 X109.246 Y108.603 I.654 J.012 E.01755
G1 X124.474 Y108.607 E.26588
M204 S10000
G1 X124.534 Y108.181 F42000
G1 F6000
M204 S6000
G1 X124.669 Y108.181 E.00235
G3 X125.626 Y109.261 I-.123 J1.073 E.0276
G1 X125.626 Y124.567 E.26725
G3 X124.533 Y125.627 I-1.086 J-.027 E.02945
G1 X109.233 Y125.626 E.26714
G3 X108.174 Y124.533 I.022 J-1.081 E.02948
G1 X108.174 Y109.232 E.26716
G3 X109.233 Y108.174 I1.085 J.027 E.02882
G1 X124.474 Y108.181 E.26612
M204 S250
G1 X124.535 Y107.769 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.712 Y107.769 E.00289
G3 X126.04 Y109.254 I-.167 J1.485 E.0354
G1 X126.039 Y124.581 E.24888
G3 X124.544 Y126.04 I-1.502 J-.043 E.03752
G1 X109.219 Y126.039 E.24884
G3 X107.76 Y124.544 I.036 J-1.495 E.03756
G1 X107.761 Y109.219 E.24885
G3 X109.219 Y107.761 I1.501 J.043 E.03692
G1 X124.475 Y107.769 E.24771
; WIPE_START
M204 S6000
G1 X124.712 Y107.769 E-.09035
G1 X124.944 Y107.813 E-.08978
G1 X125.22 Y107.919 E-.11199
G1 X125.482 Y108.088 E-.11841
G1 X125.677 Y108.276 E-.10305
G1 X125.828 Y108.485 E-.09811
G1 X125.953 Y108.751 E-.11161
G1 X125.977 Y108.844 E-.03669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 42 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer42 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X124.485 Y125.026 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42544
G1 F10950
M204 S6000
G1 X124.766 Y124.745 E.00653
G2 X124.846 Y124.518 I-.267 J-.222 E.00404
G1 X124.846 Y124.094 E.00698
G1 X124.093 Y124.846 E.01751
G1 X123.522 Y124.846 E.0094
G1 X124.846 Y123.523 E.03081
G1 X124.846 Y122.951 E.0094
G1 X122.951 Y124.846 E.04411
G1 X122.379 Y124.846 E.0094
G1 X124.846 Y122.38 E.05741
G1 X124.846 Y121.809 E.0094
G1 X121.808 Y124.846 E.07071
G1 X121.237 Y124.846 E.0094
G1 X124.846 Y121.237 E.08401
M73 P76 R7
G1 X124.846 Y120.666 E.0094
G1 X120.666 Y124.846 E.09731
G1 X120.094 Y124.846 E.0094
G1 X124.846 Y120.095 E.11061
G1 X124.846 Y119.523 E.0094
G1 X119.523 Y124.846 E.1239
G1 X118.952 Y124.846 E.0094
G1 X124.846 Y118.952 E.1372
G1 X124.846 Y118.381 E.0094
G1 X118.38 Y124.846 E.1505
G1 X117.809 Y124.846 E.0094
G1 X124.846 Y117.809 E.1638
G1 X124.846 Y117.238 E.0094
G1 X117.238 Y124.846 E.1771
G1 X116.667 Y124.846 E.0094
G1 X124.846 Y116.667 E.1904
G1 X124.846 Y116.095 E.0094
G1 X116.095 Y124.846 E.2037
G1 X115.524 Y124.846 E.0094
G1 X124.846 Y115.524 E.217
G1 X124.846 Y114.953 E.0094
G1 X114.953 Y124.846 E.23029
G1 X114.381 Y124.846 E.0094
G1 X124.846 Y114.381 E.24359
G1 X124.846 Y113.81 E.0094
G1 X113.81 Y124.846 E.25689
G1 X113.239 Y124.846 E.0094
G1 X124.846 Y113.239 E.27019
G1 X124.846 Y112.667 E.0094
G1 X112.668 Y124.846 E.28349
G1 X112.096 Y124.846 E.0094
G1 X124.846 Y112.096 E.29679
G1 X124.846 Y111.525 E.0094
G1 X111.525 Y124.846 E.31009
G1 X110.954 Y124.846 E.0094
G1 X124.846 Y110.953 E.32338
G1 X124.846 Y110.382 E.0094
G1 X110.382 Y124.846 E.33668
G1 X109.811 Y124.846 E.0094
G1 X124.846 Y109.81 E.34998
G1 X124.838 Y109.247 E.00927
G1 X109.247 Y124.839 E.36293
G3 X108.959 Y124.555 I.012 J-.3 E.00729
G1 X124.556 Y108.959 E.36305
G1 X123.984 Y108.959 E.0094
G1 X108.954 Y123.989 E.34988
G1 X108.954 Y123.418 E.0094
G1 X123.413 Y108.958 E.33658
G1 X122.842 Y108.958 E.0094
G1 X108.954 Y122.847 E.32329
G1 X108.954 Y122.275 E.0094
G1 X122.271 Y108.958 E.30999
G1 X121.7 Y108.958 E.0094
G1 X108.954 Y121.704 E.2967
G1 X108.954 Y121.133 E.0094
G1 X121.129 Y108.958 E.2834
G1 X120.558 Y108.958 E.0094
G1 X108.954 Y120.561 E.27011
G1 X108.954 Y119.99 E.0094
G1 X119.986 Y108.957 E.25681
G1 X119.415 Y108.957 E.0094
G1 X108.954 Y119.419 E.24352
G1 X108.954 Y118.847 E.0094
G1 X118.844 Y108.957 E.23022
G1 X118.273 Y108.957 E.0094
G1 X108.954 Y118.276 E.21692
G1 X108.954 Y117.705 E.0094
G1 X117.702 Y108.957 E.20363
G1 X117.131 Y108.957 E.0094
G1 X108.954 Y117.133 E.19033
G1 X108.954 Y116.562 E.0094
G1 X116.559 Y108.956 E.17704
G1 X115.988 Y108.956 E.0094
G1 X108.954 Y115.991 E.16374
G1 X108.954 Y115.419 E.0094
G1 X115.417 Y108.956 E.15045
G1 X114.846 Y108.956 E.0094
G1 X108.954 Y114.848 E.13715
G1 X108.954 Y114.277 E.0094
G1 X114.275 Y108.956 E.12386
G1 X113.704 Y108.956 E.0094
G1 X108.954 Y113.705 E.11056
G1 X108.954 Y113.134 E.0094
G1 X113.133 Y108.955 E.09726
G1 X112.561 Y108.955 E.0094
G1 X108.954 Y112.563 E.08397
G1 X108.954 Y111.991 E.0094
G1 X111.99 Y108.955 E.07067
G1 X111.419 Y108.955 E.0094
G1 X108.954 Y111.42 E.05738
G1 X108.954 Y110.849 E.0094
G1 X110.848 Y108.955 E.04408
G1 X110.277 Y108.955 E.0094
G1 X108.954 Y110.277 E.03079
G1 X108.954 Y109.706 E.0094
G1 X109.706 Y108.954 E.01749
G1 X109.283 Y108.954 E.00696
G2 X109.073 Y109.015 I-.011 J.35 E.00365
G1 X108.775 Y109.314 E.00695
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.073 Y109.015 E-.16043
G1 X109.121 Y108.988 E-.02082
G1 X109.283 Y108.954 E-.06277
G1 X109.706 Y108.954 E-.16076
G1 X109.045 Y109.615 E-.35522
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 43/83
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
M106 S193.8
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I-.753 J.956 P1  F42000
G1 X117.415 Y116.203 Z4.6
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X116.918 Y116.039 I-.506 J.698 E.08527
G1 X117.003 Y116.044 E.00148
G3 X117.366 Y116.169 I-.094 J.857 E.00676
M204 S10000
G1 X117.68 Y115.867 F42000
G1 F6000
M204 S6000
G3 X116.927 Y115.61 I-.773 J1.034 E.12748
G1 X117.042 Y115.617 E.00201
G3 X117.631 Y115.832 I-.134 J1.284 E.01107
; WIPE_START
G1 X117.865 Y116.043 E-.11978
G1 X117.996 Y116.219 E-.08315
G1 X118.109 Y116.448 E-.09711
G1 X118.177 Y116.709 E-.10245
G1 X118.189 Y116.951 E-.09227
G1 X118.158 Y117.192 E-.09214
G1 X118.075 Y117.434 E-.09746
G1 X117.975 Y117.607 E-.07563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.207 Y111.254 Z4.7 F42000
G1 X124.54 Y107.751 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.724 Y107.751 E.00299
G3 X126.058 Y109.243 I-.168 J1.492 E.03556
G1 X126.057 Y124.592 E.24924
G3 X124.555 Y126.058 I-1.502 J-.037 E.03773
G1 X109.208 Y126.057 E.24921
G3 X107.742 Y124.555 I.037 J-1.502 E.03773
G1 X107.743 Y109.207 E.24921
G3 X109.208 Y107.743 I1.509 J.044 E.03708
G1 X124.48 Y107.751 E.248
; WIPE_START
M204 S6000
G1 X124.724 Y107.751 E-.09269
G1 X124.957 Y107.796 E-.09016
G1 X125.234 Y107.902 E-.1125
G1 X125.497 Y108.071 E-.11889
G1 X125.694 Y108.261 E-.10385
G1 X125.845 Y108.47 E-.0982
G1 X125.971 Y108.737 E-.11211
G1 X125.991 Y108.818 E-.03159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 43 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer43 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.838 Y109.211 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X124.588 Y107.962 E.02869
G1 X124.025 Y107.962
G1 X125.839 Y109.776 E.04166
G1 X125.839 Y110.34
G1 X123.461 Y107.962 E.0546
G1 X122.897 Y107.962
G1 X125.839 Y110.903 E.06755
G1 X125.839 Y111.467
G1 X122.334 Y107.962 E.08049
G1 X121.77 Y107.962
G1 X125.839 Y112.03 E.09343
G1 X125.839 Y112.594
G1 X121.207 Y107.962 E.10637
G1 X120.643 Y107.962
M73 P76 R6
G1 X125.839 Y113.158 E.11932
G1 X125.839 Y113.721
G1 X120.079 Y107.962 E.13226
G1 X119.516 Y107.962
G1 X125.839 Y114.285 E.1452
G1 X125.839 Y114.848
G1 X118.952 Y107.962 E.15814
G1 X118.389 Y107.962
G1 X125.839 Y115.412 E.17108
G1 X125.839 Y115.976
G1 X117.825 Y107.962 E.18402
G1 X117.261 Y107.962
G1 X125.839 Y116.539 E.19697
G1 X125.839 Y117.103
G1 X116.698 Y107.962 E.20991
G1 X116.134 Y107.962
G1 X125.838 Y117.666 E.22285
G1 X125.838 Y118.23
G1 X115.57 Y107.962 E.23579
G1 X115.007 Y107.962
G1 X125.838 Y118.793 E.24874
G1 X125.838 Y119.357
G1 X114.443 Y107.962 E.26168
G1 X113.88 Y107.962
G1 X125.838 Y119.921 E.27462
G1 X125.838 Y120.484
G1 X113.316 Y107.962 E.28756
G1 X112.752 Y107.962
G1 X125.838 Y121.048 E.3005
G1 X125.838 Y121.611
G1 X112.189 Y107.962 E.31345
G1 X111.625 Y107.962
G1 X125.838 Y122.175 E.32639
G1 X125.838 Y122.738
G1 X111.062 Y107.962 E.33933
G1 X110.498 Y107.962
G1 X125.838 Y123.302 E.35227
G1 X125.838 Y123.866
G1 X118.321 Y116.348 E.17262
G1 X118.42 Y117.011
G1 X125.838 Y124.429 E.17036
G1 X125.781 Y124.935
G1 X118.314 Y117.469 E.17146
G1 X118.109 Y117.828
G1 X125.594 Y125.312 E.17188
G1 X125.312 Y125.594
G1 X117.828 Y118.11 E.17187
G1 X117.469 Y118.314
G1 X124.936 Y125.782 E.17148
G1 X124.43 Y125.839
G1 X117.012 Y118.421 E.17034
G1 X116.347 Y118.32
G1 X123.866 Y125.839 E.17266
; WIPE_START
M204 S6000
G1 X122.452 Y124.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.728 Y117.762 Z4.7 F42000
G1 X117.453 Y115.48 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X109.934 Y107.962 E.17265
G1 X109.371 Y107.962
G1 X116.789 Y115.38 E.17035
G1 X116.332 Y115.486
G1 X108.864 Y108.018 E.17149
G1 X108.488 Y108.206
G1 X115.973 Y115.691 E.17189
G1 X115.69 Y115.972
G1 X108.207 Y108.489 E.17183
G1 X108.019 Y108.865
G1 X115.486 Y116.331 E.17146
G1 X115.38 Y116.789
G1 X107.962 Y109.371 E.17036
G1 X107.962 Y109.935
G1 X115.477 Y117.45 E.17258
; WIPE_START
M204 S6000
G1 X114.063 Y116.036 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.411 Y110.906 Z4.7 F42000
G1 X107.962 Y110.498 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X123.303 Y125.839 E.35228
G1 X122.739 Y125.839
G1 X107.962 Y111.062 E.33934
G1 X107.962 Y111.625
G1 X122.175 Y125.839 E.3264
G1 X121.612 Y125.839
G1 X107.962 Y112.189 E.31346
G1 X107.962 Y112.752
G1 X121.048 Y125.839 E.30051
G1 X120.484 Y125.839
G1 X107.962 Y113.316 E.28757
G1 X107.962 Y113.88
G1 X119.921 Y125.839 E.27463
G1 X119.357 Y125.839
G1 X107.962 Y114.443 E.26169
G1 X107.962 Y115.007
G1 X118.793 Y125.839 E.24874
G1 X118.23 Y125.839
G1 X107.962 Y115.57 E.2358
G1 X107.962 Y116.134
G1 X117.666 Y125.839 E.22286
G1 X117.103 Y125.839
G1 X107.961 Y116.697 E.20992
G1 X107.961 Y117.261
G1 X116.539 Y125.839 E.19697
G1 X115.975 Y125.838
G1 X107.961 Y117.825 E.18403
G1 X107.961 Y118.388
G1 X115.412 Y125.838 E.17109
G1 X114.848 Y125.838
G1 X107.961 Y118.952 E.15814
G1 X107.961 Y119.515
G1 X114.284 Y125.838 E.1452
G1 X113.721 Y125.838
G1 X107.961 Y120.079 E.13226
M73 P77 R6
G1 X107.961 Y120.643
G1 X113.157 Y125.838 E.11932
G1 X112.593 Y125.838
G1 X107.961 Y121.206 E.10637
G1 X107.961 Y121.77
G1 X112.03 Y125.838 E.09343
G1 X111.466 Y125.838
G1 X107.961 Y122.333 E.08049
G1 X107.961 Y122.897
G1 X110.903 Y125.838 E.06755
G1 X110.339 Y125.838
G1 X107.961 Y123.46 E.0546
G1 X107.961 Y124.024
G1 X109.775 Y125.838 E.04166
G1 X109.211 Y125.838
G1 X107.963 Y124.59 E.02866
; WIPE_START
M204 S6000
G1 X109.211 Y125.838 E-.67075
G1 X109.446 Y125.838 E-.08925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.735 Y120.335 Z4.7 F42000
G1 X125.783 Y108.837 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.138969
G1 F15000
M204 S6000
G1 X125.613 Y108.607 E.00137
; LINE_WIDTH: 0.184078
G2 X125.193 Y108.187 I-2.2 J1.779 E.00394
; LINE_WIDTH: 0.14776
G1 X125.12 Y108.131 E.00048
; LINE_WIDTH: 0.114829
G1 X124.963 Y108.023 E.00072
M204 S10000
G1 X125.776 Y108.842 F42000
; LINE_WIDTH: 0.0717872
G1 F15000
M204 S6000
G1 X125.444 Y108.291 E.00132
; WIPE_START
G1 X125.776 Y108.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.378 Y114.238 Z4.7 F42000
G1 X108.837 Y125.777 Z4.7
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.114514
G1 F15000
M204 S6000
G1 X108.681 Y125.67 E.00072
; LINE_WIDTH: 0.160147
G3 X108.524 Y125.546 I1.459 J-2.022 E.00113
; LINE_WIDTH: 0.187001
G3 X108.187 Y125.193 I1.926 J-2.18 E.0033
; LINE_WIDTH: 0.138301
G1 X108.1 Y125.075 E.0007
; LINE_WIDTH: 0.105833
G1 X108.022 Y124.96 E.00048
; WIPE_START
G1 X108.1 Y125.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.191 Y120.477 Z4.7 F42000
G1 X118.415 Y117.288 Z4.7
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.080454
G1 F15000
M204 S6000
G3 X118.328 Y117.428 I-3.457 J-2.061 E.0004
M204 S10000
G1 X118.308 Y116.361 F42000
; LINE_WIDTH: 0.180663
G1 F15000
M204 S6000
G1 X118.336 Y116.208 E.00101
G1 X118.231 Y116.069 E.00113
; LINE_WIDTH: 0.123227
G1 X118.035 Y115.844 E.00124
G1 X117.76 Y115.592 E.00155
; LINE_WIDTH: 0.159407
G1 X117.652 Y115.508 E.00077
; LINE_WIDTH: 0.188446
G1 X117.52 Y115.413 E.00111
; WIPE_START
G1 X117.652 Y115.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.28 Y118.387 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.188036
G1 F15000
M204 S6000
G1 X116.143 Y118.289 E.00115
; LINE_WIDTH: 0.158142
G1 X116.036 Y118.205 E.00075
; LINE_WIDTH: 0.123396
G1 X115.765 Y117.956 E.00153
G1 X115.565 Y117.727 E.00126
; LINE_WIDTH: 0.181855
G1 X115.411 Y117.516 E.00171
; WIPE_START
G1 X115.565 Y117.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.515 Y116.722 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X116.461 Y116.86 E.0024
G1 X116.506 Y117.089 E.00379
G1 X116.695 Y117.293 E.00452
G1 X116.926 Y117.334 E.00381
G1 X117.171 Y117.251 E.00419
G1 X117.315 Y117.027 E.00432
G1 X117.334 Y116.863 E.00269
G1 X117.259 Y116.64 E.00382
G1 X117.023 Y116.481 E.00462
G1 X116.829 Y116.461 E.00317
G1 X116.627 Y116.561 E.00366
G1 X116.549 Y116.673 E.00221
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X116.627 Y116.561 E-.05165
G1 X116.829 Y116.461 E-.08575
G1 X117.023 Y116.481 E-.07409
G1 X117.259 Y116.64 E-.10819
G1 X117.334 Y116.863 E-.08945
G1 X117.315 Y117.027 E-.0629
G1 X117.171 Y117.251 E-.10112
G1 X116.926 Y117.334 E-.09812
G1 X116.696 Y117.293 E-.08874
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 44/83
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
M106 S201.45
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.7 I.918 J.799 P1  F42000
G1 X124.423 Y108.422 Z4.7
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2607
M204 S5000
G1 X124.609 Y108.478 E.00315
G3 X125.421 Y109.685 I-.501 J1.214 E.02502
G1 X125.421 Y124.115 E.23432
G3 X124.115 Y125.421 I-1.314 J-.008 E.03325
G1 X109.685 Y125.421 E.23432
G3 X108.379 Y124.115 I.008 J-1.314 E.03325
G1 X108.379 Y109.685 E.23432
G3 X109.685 Y108.379 I1.314 J.008 E.03325
G1 X124.115 Y108.379 E.23432
G3 X124.362 Y108.404 I-.008 J1.314 E.00403
G1 X124.366 Y108.405 E.00007
; WIPE_START
G1 F3600
M204 S6000
G1 X124.609 Y108.478 E-.0965
G1 X124.837 Y108.6 E-.0981
G1 X125.036 Y108.764 E-.09812
G1 X125.2 Y108.963 E-.09813
G1 X125.322 Y109.191 E-.09814
G1 X125.397 Y109.438 E-.09811
G1 X125.421 Y109.685 E-.09415
G1 X125.421 Y109.892 E-.07876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.946 Y115.21 Z4.8 F42000
G1 X108.82 Y126.018 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F2607
M204 S5000
G1 X108.553 Y125.914 E.00465
G3 X107.724 Y124.566 I.68 J-1.348 E.02706
G1 X107.725 Y109.196 E.24958
G3 X109.196 Y107.725 I1.516 J.045 E.03723
G1 X124.736 Y107.733 E.25235
G3 X126.076 Y109.232 I-.169 J1.499 E.03572
G1 X126.075 Y124.604 E.24961
G3 X124.566 Y126.076 I-1.509 J-.037 E.0379
G1 X109.196 Y126.075 E.24958
G3 X108.878 Y126.033 I.037 J-1.509 E.00522
; WIPE_START
G1 F3600
M204 S6000
G1 X108.553 Y125.914 E-.13139
G1 X108.346 Y125.79 E-.09168
G1 X108.111 Y125.579 E-.12009
G1 X107.938 Y125.345 E-.11062
G1 X107.831 Y125.129 E-.09144
G1 X107.761 Y124.899 E-.09143
G1 X107.725 Y124.577 E-.12335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 44 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer44 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X108.08 Y124.524 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.313144
G1 F2607
M204 S6000
G1 X108.068 Y124.442 E.00098
; LINE_WIDTH: 0.263051
G3 X108.052 Y124.137 I3.062 J-.317 E.00301
G1 X108.052 Y109.663 E.14248
; LINE_WIDTH: 0.278049
G3 X108.068 Y109.358 I3.091 J.013 E.00319
; LINE_WIDTH: 0.317931
G1 X108.091 Y109.207 E.00184
; LINE_WIDTH: 0.360045
G3 X108.129 Y109.027 I1.686 J.261 E.00253
; LINE_WIDTH: 0.405474
G3 X108.213 Y108.82 I2.655 J.958 E.00351
; LINE_WIDTH: 0.443602
G3 X108.898 Y108.178 I1.174 J.567 E.0165
; LINE_WIDTH: 0.396982
G3 X109.028 Y108.129 I.58 J1.344 E.00213
; LINE_WIDTH: 0.359614
G3 X109.208 Y108.091 I.369 J1.279 E.00254
; LINE_WIDTH: 0.317788
G1 X109.358 Y108.068 E.00183
; LINE_WIDTH: 0.262913
G3 X109.663 Y108.052 I.317 J3.069 E.003
G1 X124.125 Y108.052 E.14228
G1 X124.416 Y108.066 E.00286
; LINE_WIDTH: 0.314074
G3 X124.592 Y108.091 I-.165 J1.812 E.00213
; LINE_WIDTH: 0.360137
G3 X124.739 Y108.119 I-.273 J1.803 E.00207
G1 X124.772 Y108.128 E.00048
; LINE_WIDTH: 0.40537
M73 P78 R6
G3 X124.98 Y108.213 I-1.052 J2.884 E.0035
; LINE_WIDTH: 0.444906
G3 X125.605 Y108.859 I-.558 J1.166 E.01584
; LINE_WIDTH: 0.401134
G3 X125.671 Y109.028 I-1.756 J.78 E.0028
; LINE_WIDTH: 0.356483
G3 X125.714 Y109.238 I-1.747 J.472 E.00294
; LINE_WIDTH: 0.314034
G1 X125.732 Y109.358 E.00144
; LINE_WIDTH: 0.263301
G3 X125.748 Y109.663 I-3.062 J.317 E.00301
G1 X125.748 Y124.125 E.14251
G1 X125.734 Y124.416 E.00286
; LINE_WIDTH: 0.314077
G3 X125.709 Y124.592 I-1.811 J-.165 E.00213
; LINE_WIDTH: 0.360134
G3 X125.681 Y124.739 I-1.802 J-.273 E.00207
G1 X125.672 Y124.772 E.00048
; LINE_WIDTH: 0.405363
G3 X125.587 Y124.98 I-2.86 J-1.043 E.0035
; LINE_WIDTH: 0.443683
G3 X124.903 Y125.621 I-1.174 J-.567 E.0165
; LINE_WIDTH: 0.39708
G3 X124.772 Y125.671 I-.583 J-1.352 E.00214
; LINE_WIDTH: 0.355041
G3 X124.556 Y125.715 I-.397 J-1.383 E.00301
; LINE_WIDTH: 0.313144
G1 X124.442 Y125.732 E.00136
; LINE_WIDTH: 0.263302
G3 X124.137 Y125.748 I-.317 J-3.062 E.00301
G1 X109.675 Y125.748 E.14251
G1 X109.384 Y125.734 E.00286
; LINE_WIDTH: 0.314077
G3 X109.208 Y125.709 I.165 J-1.811 E.00213
; LINE_WIDTH: 0.360134
G3 X109.061 Y125.681 I.273 J-1.802 E.00207
G1 X109.028 Y125.672 E.00048
; LINE_WIDTH: 0.405363
G3 X108.82 Y125.587 I1.043 J-2.86 E.0035
; LINE_WIDTH: 0.443683
G3 X108.179 Y124.903 I.567 J-1.174 E.0165
; LINE_WIDTH: 0.39708
G3 X108.129 Y124.772 I1.352 J-.583 E.00214
; LINE_WIDTH: 0.355041
G3 X108.089 Y124.583 I1.383 J-.397 E.00263
; WIPE_START
G1 F15000
G1 X108.068 Y124.442 E-.05422
G1 X108.052 Y124.137 E-.11603
G1 X108.052 Y122.585 E-.58974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.774 Y117.535 Z4.8 F42000
G1 X115.804 Y115.744 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2607
M204 S6000
G1 X115.839 Y115.712 E.00082
G3 X116.933 Y115.303 I1.067 J1.187 E.02088
G1 X117.069 Y115.311 E.00238
G3 X115.626 Y115.946 I-.163 J1.587 E.14628
G1 X115.764 Y115.789 E.00366
M204 S10000
G1 X115.488 Y115.456 F42000
G1 F2607
M204 S6000
G1 X115.547 Y115.396 E.00146
G3 X116.942 Y114.874 I1.357 J1.502 E.02662
G1 X117.107 Y114.884 E.0029
G3 X115.277 Y115.694 I-.204 J2.014 E.18552
G1 X115.448 Y115.501 E.00451
M204 S250
G1 X115.183 Y115.179 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2607
M204 S5000
G1 X115.265 Y115.091 E.00196
G3 X116.95 Y114.461 I1.636 J1.807 E.02991
G1 X117.144 Y114.472 E.00316
G3 X114.941 Y115.45 I-.243 J2.426 E.20776
G1 X115.143 Y115.224 E.00492
; WIPE_START
G1 F3600
M204 S6000
G1 X115.265 Y115.091 E-.06876
G1 X115.654 Y114.802 E-.18404
G1 X116.091 Y114.598 E-.18318
G1 X116.559 Y114.484 E-.18327
G1 X116.929 Y114.462 E-.14075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.666 Y116.925 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2607
M204 S6000
G1 X117.665 Y116.781 E.00234
G1 X117.511 Y116.417 E.00641
G1 X117.263 Y116.209 E.00526
G1 X116.83 Y116.124 E.00717
G1 X116.515 Y116.221 E.00535
G1 X116.288 Y116.415 E.00485
G1 X116.146 Y116.755 E.00599
G1 X116.131 Y117.016 E.00425
G1 X116.198 Y117.238 E.00376
G1 X116.465 Y117.54 E.00654
G1 X116.642 Y117.636 E.00327
G1 X117.097 Y117.656 E.0074
G1 X117.377 Y117.519 E.00506
G1 X117.579 Y117.286 E.00501
G1 X117.652 Y116.984 E.00505
M204 S10000
G1 X116.611 Y117.121 F42000
G1 F2607
M204 S6000
G1 X116.754 Y117.248 E.0031
G1 X117.003 Y117.265 E.00406
G1 X117.183 Y117.155 E.00343
G2 X117.272 Y116.842 I-.469 J-.301 E.00535
G1 X117.156 Y116.621 E.00405
G2 X116.807 Y116.534 I-.288 J.407 E.00598
G1 X116.602 Y116.663 E.00394
G1 X116.524 Y116.946 E.00476
G1 X116.584 Y117.067 E.00221
M204 S10000
G1 X116.815 Y118.057 F42000
G1 F2607
M204 S6000
G1 X117.113 Y118.057 E.00485
G1 X117.43 Y117.957 E.00539
G1 X117.786 Y117.683 E.0073
G1 X118.019 Y117.277 E.00759
G1 X118.079 Y116.85 E.00701
G2 X117.459 Y115.859 I-1.324 J.14 E.01966
G2 X116.823 Y115.722 I-.699 J1.692 E.01062
G1 X116.439 Y115.822 E.00645
G1 X116.136 Y115.998 E.00568
G1 X115.85 Y116.359 E.00749
G1 X115.727 Y116.766 E.0069
G1 X115.764 Y117.225 E.00748
G2 X116.111 Y117.778 I1.724 J-.697 E.01065
G1 X116.426 Y117.977 E.00604
G1 X116.756 Y118.045 E.00548
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X116.426 Y117.977 E-.12835
G1 X116.111 Y117.778 E-.14138
G1 X115.93 Y117.543 E-.11281
G1 X115.764 Y117.225 E-.13619
G1 X115.727 Y116.766 E-.17497
G1 X115.777 Y116.599 E-.0663
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 45/83
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.837 J.884 P1  F42000
G1 X124.433 Y108.4 Z4.8
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2613
M204 S5000
G1 X124.623 Y108.457 E.00322
G3 X125.443 Y109.675 I-.506 J1.225 E.02526
G1 X125.443 Y124.125 E.23464
G3 X124.125 Y125.443 I-1.326 J-.008 E.03356
G1 X109.675 Y125.443 E.23464
G3 X108.357 Y124.125 I.008 J-1.326 E.03356
G1 X108.357 Y109.675 E.23464
G3 X109.675 Y108.357 I1.326 J.008 E.03356
G1 X124.125 Y108.357 E.23464
G3 X124.374 Y108.382 I-.008 J1.326 E.00407
G1 X124.376 Y108.383 E.00003
; WIPE_START
G1 F3600
M204 S6000
G1 X124.623 Y108.457 E-.09825
G1 X124.853 Y108.58 E-.099
G1 X125.055 Y108.745 E-.09903
G1 X125.22 Y108.947 E-.09904
G1 X125.343 Y109.177 E-.09901
G1 X125.418 Y109.426 E-.09904
G1 X125.443 Y109.675 E-.09507
G1 X125.443 Y109.863 E-.07157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.971 Y115.184 Z4.9 F42000
G1 X108.809 Y126.037 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F2613
M204 S5000
G1 X108.54 Y125.929 E.0047
G3 X107.706 Y124.577 I.69 J-1.359 E.02715
G1 X107.707 Y109.184 E.24995
G3 X109.184 Y107.707 I1.523 J.046 E.03737
G1 X124.748 Y107.715 E.25273
G3 X126.094 Y109.221 I-.17 J1.507 E.03589
G1 X126.093 Y124.616 E.24998
G3 X124.577 Y126.094 I-1.523 J-.046 E.03802
G1 X109.184 Y126.093 E.24995
G3 X108.867 Y126.05 I.046 J-1.523 E.0052
; WIPE_START
G1 F3600
M204 S6000
G1 X108.54 Y125.929 E-.13239
G1 X108.286 Y125.773 E-.11316
G1 X108.095 Y125.595 E-.09926
G1 X107.921 Y125.36 E-.11128
G1 X107.814 Y125.144 E-.09164
G1 X107.743 Y124.913 E-.09184
G1 X107.708 Y124.598 E-.12043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 45 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer45 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X108.062 Y124.545 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.309324
G1 F2613
M204 S6000
G1 X108.048 Y124.454 E.00108
; LINE_WIDTH: 0.259174
G3 X108.032 Y124.147 I3.093 J-.319 E.00298
G1 X108.032 Y109.653 E.14038
; LINE_WIDTH: 0.27424
G3 X108.049 Y109.346 I3.121 J.013 E.00317
; LINE_WIDTH: 0.314242
G1 X108.071 Y109.195 E.00182
; LINE_WIDTH: 0.356525
G3 X108.109 Y109.014 I1.719 J.267 E.00253
; LINE_WIDTH: 0.402005
G3 X108.194 Y108.805 I2.711 J.981 E.00349
; LINE_WIDTH: 0.44018
G3 X108.884 Y108.159 I1.182 J.571 E.01649
; LINE_WIDTH: 0.393479
G3 X109.014 Y108.11 I.583 J1.35 E.00211
; LINE_WIDTH: 0.356086
G3 X109.196 Y108.071 I.377 J1.31 E.00253
; LINE_WIDTH: 0.314116
G1 X109.346 Y108.049 E.00182
; LINE_WIDTH: 0.25902
G3 X109.653 Y108.032 I.319 J3.1 E.00298
G1 X124.135 Y108.032 E.14017
G1 X124.428 Y108.046 E.00283
; LINE_WIDTH: 0.310467
G3 X124.604 Y108.071 I-.167 J1.823 E.0021
; LINE_WIDTH: 0.356574
G3 X124.753 Y108.1 I-.276 J1.813 E.00207
G1 X124.785 Y108.109 E.00046
; LINE_WIDTH: 0.401833
G3 X124.995 Y108.194 I-1.058 J2.898 E.0035
; LINE_WIDTH: 0.441483
G3 X125.624 Y108.845 I-.562 J1.174 E.01583
; LINE_WIDTH: 0.397647
G3 X125.69 Y109.014 I-1.759 J.782 E.00278
; LINE_WIDTH: 0.352829
G3 X125.734 Y109.227 I-1.79 J.482 E.00294
; LINE_WIDTH: 0.310224
G1 X125.752 Y109.346 E.00141
; LINE_WIDTH: 0.259428
G3 X125.768 Y109.653 I-3.093 J.319 E.00298
G1 X125.768 Y124.135 E.14041
G1 X125.754 Y124.428 E.00284
; LINE_WIDTH: 0.310469
G3 X125.729 Y124.604 I-1.822 J-.167 E.0021
; LINE_WIDTH: 0.356568
G3 X125.7 Y124.753 I-1.816 J-.276 E.00207
G1 X125.691 Y124.785 E.00046
; LINE_WIDTH: 0.401829
G3 X125.606 Y124.995 I-2.879 J-1.05 E.0035
; LINE_WIDTH: 0.440184
G3 X124.917 Y125.641 I-1.183 J-.571 E.01649
; LINE_WIDTH: 0.39354
G3 X124.786 Y125.69 I-.584 J-1.352 E.00212
; LINE_WIDTH: 0.35138
G3 X124.567 Y125.735 I-.405 J-1.413 E.00301
; LINE_WIDTH: 0.309324
G1 X124.454 Y125.752 E.00134
; LINE_WIDTH: 0.259428
G3 X124.147 Y125.768 I-.319 J-3.093 E.00298
G1 X109.665 Y125.768 E.14041
G1 X109.372 Y125.754 E.00284
; LINE_WIDTH: 0.310469
G3 X109.196 Y125.729 I.167 J-1.822 E.0021
; LINE_WIDTH: 0.356568
G3 X109.047 Y125.7 I.276 J-1.816 E.00207
G1 X109.015 Y125.691 E.00046
; LINE_WIDTH: 0.401829
G3 X108.805 Y125.606 I1.05 J-2.879 E.0035
; LINE_WIDTH: 0.440184
G3 X108.159 Y124.917 I.571 J-1.183 E.01649
; LINE_WIDTH: 0.39354
G3 X108.11 Y124.786 I1.352 J-.584 E.00212
; LINE_WIDTH: 0.35138
G3 X108.07 Y124.605 I1.413 J-.405 E.0025
; WIPE_START
G1 F15000
G1 X108.048 Y124.454 E-.05789
G1 X108.032 Y124.147 E-.11682
G1 X108.032 Y122.607 E-.5853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.753 Y117.554 Z4.9 F42000
G1 X115.803 Y115.744 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2613
M204 S6000
G1 X115.828 Y115.721 E.00059
G3 X116.935 Y115.303 I1.077 J1.178 E.02116
G1 X117.066 Y115.311 E.00228
G3 X115.619 Y115.954 I-.161 J1.588 E.14621
G1 X115.763 Y115.789 E.00382
M204 S10000
G1 X115.486 Y115.457 F42000
G1 F2613
M204 S6000
G1 X115.539 Y115.402 E.00134
G3 X116.944 Y114.875 I1.364 J1.497 E.02684
G1 X117.104 Y114.884 E.0028
G3 X115.273 Y115.698 I-.201 J2.015 E.18557
G1 X115.446 Y115.502 E.00457
M204 S250
G1 X115.181 Y115.181 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2613
M204 S5000
G1 X115.261 Y115.094 E.00191
G3 X116.952 Y114.461 I1.64 J1.805 E.03005
G1 X117.141 Y114.472 E.00306
G3 X114.939 Y115.451 I-.24 J2.427 E.2079
G1 X115.141 Y115.226 E.00491
; WIPE_START
G1 F3600
M204 S6000
G1 X115.261 Y115.094 E-.06757
G1 X115.652 Y114.803 E-.18547
G1 X116.091 Y114.598 E-.18407
G1 X116.558 Y114.484 E-.18252
G1 X116.926 Y114.462 E-.14037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.043 Y117.076 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2613
M204 S6000
G2 X118.05 Y116.665 I-.624 J-.215 E.00677
G1 X117.957 Y116.372 E.00499
G1 X117.69 Y116.023 E.00713
G1 X117.376 Y115.824 E.00604
G2 X116.831 Y115.723 I-.782 J2.684 E.00901
G1 X116.417 Y115.823 E.00691
G1 X116.182 Y115.963 E.00444
G1 X115.896 Y116.279 E.00692
G1 X115.75 Y116.656 E.00655
G1 X115.722 Y116.992 E.00548
G2 X115.955 Y117.607 I1.825 J-.34 E.01073
G1 X116.249 Y117.879 E.00651
G1 X116.545 Y118.027 E.00537
G2 X117.218 Y118.037 I.364 J-1.845 E.01099
G1 X117.615 Y117.84 E.0072
G1 X117.954 Y117.42 E.00876
G1 X118.028 Y117.134 E.00481
M204 S10000
G1 X116.874 Y117.666 F42000
G1 F2613
M204 S6000
G1 X117.245 Y117.601 E.00613
G1 X117.538 Y117.331 E.00646
G1 X117.63 Y117.139 E.00346
G1 X117.661 Y116.757 E.00622
G1 X117.566 Y116.517 E.0042
G1 X117.335 Y116.26 E.00561
G1 X117.158 Y116.165 E.00326
G1 X116.854 Y116.127 E.00497
G1 X116.503 Y116.236 E.00596
G1 X116.232 Y116.502 E.00618
G1 X116.124 Y116.808 E.00526
G1 X116.143 Y117.086 E.00452
G1 X116.356 Y117.451 E.00687
G1 X116.615 Y117.624 E.00505
G1 X116.814 Y117.656 E.00328
M204 S10000
G1 X116.918 Y116.864 F42000
; LINE_WIDTH: 0.34614
G1 F2613
M204 S6000
G1 X116.858 Y116.899 E.00093
G1 X116.902 Y116.924 E.00067
M204 S10000
G1 X116.813 Y116.547 F42000
; LINE_WIDTH: 0.41999
G1 F2613
M204 S6000
G1 X116.682 Y116.599 E.00229
G1 X116.53 Y116.821 E.00436
G1 X116.534 Y116.977 E.00254
G1 X116.666 Y117.199 E.00419
G1 X116.841 Y117.269 E.00306
G1 X117.099 Y117.222 E.00425
G1 X117.237 Y117.069 E.00335
G1 X117.263 Y116.791 E.00454
G1 X117.07 Y116.56 E.00488
G1 X116.873 Y116.55 E.0032
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.07 Y116.56 E-.07485
G1 X117.263 Y116.791 E-.1143
G1 X117.237 Y117.069 E-.10628
G1 X117.099 Y117.222 E-.07837
G1 X116.841 Y117.269 E-.09951
G1 X116.666 Y117.199 E-.07159
G1 X116.534 Y116.977 E-.09817
G1 X116.53 Y116.821 E-.05947
G1 X116.615 Y116.696 E-.05746
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 46/83
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.9 I.886 J.834 P1  F42000
G1 X124.443 Y108.377 Z4.9
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2616
M204 S5000
G1 X124.638 Y108.436 E.0033
G3 X125.465 Y109.665 I-.511 J1.237 E.02549
G1 X125.465 Y124.135 E.23496
G3 X124.135 Y125.465 I-1.338 J-.008 E.03387
G1 X109.665 Y125.465 E.23496
G3 X108.335 Y124.135 I.008 J-1.338 E.03387
G1 X108.335 Y109.665 E.23496
G3 X109.665 Y108.335 I1.338 J.008 E.03387
G1 X124.135 Y108.335 E.23496
G3 X124.386 Y108.36 I-.008 J1.338 E.0041
; WIPE_START
G1 F3600
M204 S6000
G1 X124.638 Y108.436 E-.1
G1 X124.87 Y108.56 E-.0999
G1 X125.073 Y108.727 E-.09996
G1 X125.24 Y108.93 E-.09993
G1 X125.364 Y109.162 E-.09992
G1 X125.44 Y109.414 E-.09994
G1 X125.465 Y109.665 E-.09597
G1 X125.465 Y109.835 E-.06437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.995 Y115.158 Z5 F42000
G1 X108.797 Y126.055 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2616
M204 S5000
G1 X108.526 Y125.946 E.00474
G3 X107.688 Y124.588 I.693 J-1.365 E.02727
G1 X107.689 Y109.172 E.25032
G3 X109.172 Y107.689 I1.53 J.047 E.03753
G1 X124.76 Y107.697 E.25312
G3 X126.112 Y109.21 I-.171 J1.514 E.03606
G1 X126.111 Y124.628 E.25035
G3 X124.588 Y126.112 I-1.531 J-.047 E.03819
G1 X109.172 Y126.112 E.25032
M73 P79 R6
G3 X108.855 Y126.068 I.047 J-1.531 E.0052
; WIPE_START
G1 F3600
M204 S6000
G1 X108.526 Y125.946 E-.13345
G1 X108.271 Y125.79 E-.11371
G1 X108.08 Y125.611 E-.09937
G1 X107.905 Y125.375 E-.11184
G1 X107.797 Y125.158 E-.09199
G1 X107.725 Y124.926 E-.09236
G1 X107.691 Y124.619 E-.11728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 46 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer46 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X108.043 Y124.567 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.3055
G1 F2616
M204 S6000
G1 X108.028 Y124.465 E.00118
; LINE_WIDTH: 0.255287
G3 X108.012 Y124.156 I3.128 J-.322 E.00295
G1 X108.012 Y109.644 E.13826
; LINE_WIDTH: 0.269046
G1 X108.026 Y109.361 E.00286
; LINE_WIDTH: 0.306886
G3 X108.051 Y109.183 I1.833 J.168 E.00208
; LINE_WIDTH: 0.352949
G3 X108.09 Y109 I1.753 J.274 E.00253
; LINE_WIDTH: 0.398541
G3 X108.175 Y108.79 I2.749 J.998 E.00348
; LINE_WIDTH: 0.436746
G3 X108.87 Y108.14 I1.191 J.576 E.01647
; LINE_WIDTH: 0.389961
G3 X109 Y108.09 I.584 J1.352 E.0021
; LINE_WIDTH: 0.352498
G3 X109.184 Y108.051 I.385 J1.342 E.00253
; LINE_WIDTH: 0.310372
G1 X109.335 Y108.029 E.00179
; LINE_WIDTH: 0.255137
G3 X109.644 Y108.012 I.321 J3.11 E.00295
G1 X124.145 Y108.012 E.13806
G1 X124.439 Y108.026 E.00281
; LINE_WIDTH: 0.306787
G3 X124.616 Y108.051 I-.166 J1.814 E.00207
; LINE_WIDTH: 0.352937
G3 X124.767 Y108.08 I-.281 J1.843 E.00208
G1 X124.798 Y108.089 E.00044
; LINE_WIDTH: 0.398296
G3 X125.009 Y108.175 I-1.059 J2.902 E.0035
; LINE_WIDTH: 0.438057
G3 X125.643 Y108.831 I-.567 J1.182 E.01581
; LINE_WIDTH: 0.394139
G3 X125.71 Y109.001 I-1.755 J.781 E.00277
; LINE_WIDTH: 0.349155
G3 X125.754 Y109.216 I-1.827 J.492 E.00295
; LINE_WIDTH: 0.30638
G1 X125.772 Y109.335 E.00139
; LINE_WIDTH: 0.255545
G3 X125.788 Y109.644 I-3.128 J.322 E.00295
G1 X125.788 Y124.145 E.13831
G1 X125.774 Y124.439 E.00281
; LINE_WIDTH: 0.306793
G3 X125.749 Y124.616 I-1.827 J-.168 E.00207
; LINE_WIDTH: 0.352932
G3 X125.72 Y124.767 I-1.853 J-.283 E.00208
G1 X125.711 Y124.798 E.00044
; LINE_WIDTH: 0.398298
G3 X125.625 Y125.01 I-2.905 J-1.061 E.0035
; LINE_WIDTH: 0.436746
G3 X124.93 Y125.66 I-1.191 J-.575 E.01647
; LINE_WIDTH: 0.389996
G3 X124.8 Y125.71 I-.582 J-1.346 E.0021
; LINE_WIDTH: 0.347733
G3 X124.578 Y125.755 I-.413 J-1.446 E.00301
; LINE_WIDTH: 0.3055
G1 X124.465 Y125.772 E.00131
; LINE_WIDTH: 0.255545
G3 X124.156 Y125.788 I-.322 J-3.128 E.00295
G1 X109.655 Y125.788 E.13831
G1 X109.361 Y125.774 E.00281
; LINE_WIDTH: 0.306793
G3 X109.184 Y125.749 I.168 J-1.827 E.00207
; LINE_WIDTH: 0.35293
G3 X109.033 Y125.72 I.282 J-1.845 E.00208
G1 X109.002 Y125.711 E.00044
; LINE_WIDTH: 0.398298
G3 X108.79 Y125.625 I1.056 J-2.894 E.0035
; LINE_WIDTH: 0.436753
G3 X108.14 Y124.931 I.575 J-1.191 E.01647
; LINE_WIDTH: 0.390018
G3 X108.09 Y124.8 I1.344 J-.581 E.00211
; LINE_WIDTH: 0.347733
G3 X108.052 Y124.626 I1.443 J-.412 E.00236
; WIPE_START
G1 F15000
G1 X108.028 Y124.465 E-.06168
G1 X108.012 Y124.156 E-.1176
G1 X108.012 Y122.628 E-.58072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.731 Y117.574 Z5 F42000
G1 X115.802 Y115.745 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2616
M204 S6000
G1 X115.831 Y115.72 E.00067
G3 X116.937 Y115.303 I1.075 J1.18 E.02113
G1 X117.069 Y115.311 E.00231
G3 X115.614 Y115.963 I-.162 J1.588 E.14597
G1 X115.763 Y115.79 E.00398
M204 S10000
G1 X115.485 Y115.459 F42000
G1 F2616
M204 S6000
G1 X115.543 Y115.401 E.00143
G3 X116.946 Y114.875 I1.362 J1.498 E.02681
G1 X117.107 Y114.884 E.00282
G3 X115.27 Y115.704 I-.203 J2.014 E.18534
G1 X115.446 Y115.504 E.00464
M204 S250
G1 X115.18 Y115.182 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2616
M204 S5000
G1 X115.264 Y115.093 E.00199
G3 X116.955 Y114.461 I1.639 J1.805 E.03002
G1 X117.144 Y114.472 E.00308
G3 X114.939 Y115.454 I-.242 J2.426 E.20771
G1 X115.14 Y115.227 E.00492
; WIPE_START
G1 F3600
M204 S6000
G1 X115.264 Y115.093 E-.06944
G1 X115.652 Y114.803 E-.1839
G1 X116.091 Y114.598 E-.18418
G1 X116.56 Y114.484 E-.18336
G1 X116.925 Y114.463 E-.13912
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.479 Y115.892 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2616
M204 S6000
G1 X117.255 Y115.775 E.00411
G1 X116.83 Y115.723 E.00695
G1 X116.415 Y115.824 E.00694
G1 X116.093 Y116.044 E.00634
G1 X115.872 Y116.317 E.00571
G1 X115.727 Y116.755 E.00749
G1 X115.764 Y117.226 E.00766
G2 X116.113 Y117.78 I1.725 J-.699 E.01069
G1 X116.331 Y117.934 E.00433
G1 X116.748 Y118.071 E.00713
G1 X117.206 Y118.041 E.00745
G1 X117.62 Y117.837 E.0075
G1 X117.928 Y117.483 E.00761
G2 X118.079 Y116.851 I-1.705 J-.743 E.01062
G2 X117.954 Y116.364 I-1.769 J.198 E.00818
G1 X117.739 Y116.081 E.00577
G1 X117.528 Y115.927 E.00424
M204 S10000
G1 X116.762 Y116.56 F42000
G1 F2616
M204 S6000
G1 X116.602 Y116.667 E.00313
G1 X116.522 Y116.853 E.00329
G1 X116.554 Y117.045 E.00315
G1 X116.706 Y117.218 E.00374
G1 X116.971 Y117.272 E.00439
G1 X117.161 Y117.175 E.00347
G1 X117.246 Y117.044 E.00252
G1 X117.266 Y116.81 E.00382
G1 X117.18 Y116.649 E.00296
G1 X117.014 Y116.548 E.00316
G1 X116.822 Y116.557 E.00312
M204 S10000
G1 X116.921 Y116.865 F42000
; LINE_WIDTH: 0.34874
G1 F2616
M204 S6000
G1 X116.859 Y116.9 E.00094
G1 X116.904 Y116.926 E.00069
M204 S10000
G1 X116.453 Y117.532 F42000
; LINE_WIDTH: 0.41999
G1 F2616
M204 S6000
G1 X116.819 Y117.675 E.0064
G1 X117.103 Y117.654 E.00461
G1 X117.376 Y117.52 E.00495
G1 X117.58 Y117.284 E.00506
G1 X117.676 Y116.854 E.00716
G2 X116.854 Y116.127 I-.796 J.072 E.01964
G1 X116.477 Y116.251 E.00644
G1 X116.261 Y116.458 E.00485
G1 X116.141 Y116.734 E.00489
G1 X116.133 Y117.026 E.00474
G1 X116.194 Y117.231 E.00346
G1 X116.413 Y117.486 E.00547
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X116.194 Y117.231 E-.12803
G1 X116.133 Y117.026 E-.08103
G1 X116.141 Y116.734 E-.11094
G1 X116.261 Y116.458 E-.11451
G1 X116.477 Y116.251 E-.11356
G1 X116.854 Y116.127 E-.15081
G1 X117.013 Y116.147 E-.06111
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 47/83
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5 I.88 J.84 P1  F42000
G1 X124.453 Y108.355 Z5
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2620
M204 S5000
G1 X124.652 Y108.415 E.00337
G3 X125.487 Y109.655 I-.515 J1.248 E.02572
G1 X125.487 Y124.145 E.23527
G3 X124.145 Y125.487 I-1.35 J-.008 E.03418
G1 X109.655 Y125.487 E.23527
G3 X108.313 Y124.145 I.008 J-1.35 E.03418
G1 X108.313 Y109.655 E.23527
G3 X109.655 Y108.313 I1.35 J.008 E.03418
G1 X124.145 Y108.313 E.23527
G3 X124.396 Y108.338 I-.008 J1.35 E.00411
; WIPE_START
G1 F3600
M204 S6000
G1 X124.652 Y108.415 E-.10173
G1 X124.886 Y108.54 E-.10082
G1 X125.091 Y108.709 E-.10086
G1 X125.26 Y108.914 E-.10084
G1 X125.385 Y109.148 E-.10084
G1 X125.462 Y109.402 E-.10084
G1 X125.487 Y109.655 E-.09688
G1 X125.487 Y109.806 E-.05719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.019 Y115.131 Z5.1 F42000
G1 X108.785 Y126.073 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F2620
M204 S5000
G1 X108.511 Y125.963 E.00479
G3 X107.67 Y124.598 I.697 J-1.372 E.02739
G1 X107.67 Y109.16 E.25069
G3 X109.16 Y107.67 I1.538 J.048 E.03768
G1 X124.772 Y107.679 E.25351
G3 X126.13 Y109.2 I-.185 J1.532 E.03616
G1 X126.13 Y124.64 E.25072
G3 X124.598 Y126.13 I-1.538 J-.048 E.03836
G1 X109.16 Y126.13 E.25068
G3 X108.843 Y126.086 I.048 J-1.538 E.0052
; WIPE_START
G1 F3600
M204 S6000
G1 X108.511 Y125.963 E-.13448
G1 X108.255 Y125.806 E-.11423
G1 X108.064 Y125.627 E-.09957
G1 X107.888 Y125.39 E-.11233
G1 X107.779 Y125.172 E-.09255
G1 X107.707 Y124.939 E-.09261
G1 X107.674 Y124.64 E-.11423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 47 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer47 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X108.025 Y124.588 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.301654
G1 F2620
M204 S6000
G1 X108.008 Y124.477 E.00129
; LINE_WIDTH: 0.2514
G3 X107.992 Y124.166 I3.133 J-.323 E.00292
G1 X107.992 Y109.634 E.13614
; LINE_WIDTH: 0.265237
G1 X108.006 Y109.349 E.00284
; LINE_WIDTH: 0.303184
G3 X108.031 Y109.172 I1.824 J.167 E.00205
; LINE_WIDTH: 0.349374
G3 X108.07 Y108.986 I1.793 J.281 E.00253
; LINE_WIDTH: 0.395069
G3 X108.156 Y108.776 I2.802 J1.02 E.00347
; LINE_WIDTH: 0.433301
G3 X108.856 Y108.12 I1.199 J.579 E.01646
; LINE_WIDTH: 0.386398
G3 X108.987 Y108.071 I.584 J1.351 E.00208
; LINE_WIDTH: 0.348935
G3 X109.172 Y108.031 I.392 J1.37 E.00253
; LINE_WIDTH: 0.306686
G1 X109.323 Y108.009 E.00177
; LINE_WIDTH: 0.251244
G3 X109.634 Y107.992 I.323 J3.137 E.00292
G1 X124.155 Y107.992 E.13595
G1 X124.451 Y108.006 E.00278
; LINE_WIDTH: 0.303098
G3 X124.628 Y108.031 I-.165 J1.806 E.00205
; LINE_WIDTH: 0.349308
G3 X124.781 Y108.061 I-.286 J1.869 E.00208
G1 X124.811 Y108.069 E.00042
; LINE_WIDTH: 0.394723
G3 X125.024 Y108.156 I-1.058 J2.899 E.00349
; LINE_WIDTH: 0.434556
G3 X125.664 Y108.819 I-.571 J1.191 E.01585
; LINE_WIDTH: 0.390688
G3 X125.729 Y108.987 I-1.629 J.731 E.00271
; LINE_WIDTH: 0.345533
G3 X125.774 Y109.206 I-1.848 J.496 E.00295
; LINE_WIDTH: 0.302524
G1 X125.792 Y109.323 E.00136
; LINE_WIDTH: 0.251661
G3 X125.808 Y109.634 I-3.133 J.323 E.00292
G1 X125.808 Y124.155 E.13619
G1 X125.794 Y124.451 E.00279
; LINE_WIDTH: 0.303104
G3 X125.769 Y124.628 I-1.818 J-.167 E.00205
; LINE_WIDTH: 0.349295
G3 X125.739 Y124.781 I-1.881 J-.288 E.00208
G1 X125.731 Y124.811 E.00042
; LINE_WIDTH: 0.394717
G3 X125.644 Y125.024 I-2.901 J-1.058 E.00349
; LINE_WIDTH: 0.433317
G3 X124.945 Y125.679 I-1.199 J-.579 E.01646
; LINE_WIDTH: 0.38648
G3 X124.813 Y125.729 I-.584 J-1.349 E.00209
; LINE_WIDTH: 0.344031
G3 X124.588 Y125.775 I-.421 J-1.478 E.00302
; LINE_WIDTH: 0.301654
G1 X124.477 Y125.792 E.00129
; LINE_WIDTH: 0.251662
G3 X124.166 Y125.808 I-.323 J-3.133 E.00292
G1 X109.645 Y125.808 E.13619
G1 X109.349 Y125.794 E.00279
; LINE_WIDTH: 0.303104
G3 X109.172 Y125.769 I.167 J-1.818 E.00205
; LINE_WIDTH: 0.349303
G3 X109.019 Y125.739 I.286 J-1.869 E.00208
G1 X108.989 Y125.731 E.00042
; LINE_WIDTH: 0.394718
G3 X108.776 Y125.644 I1.06 J-2.905 E.00349
; LINE_WIDTH: 0.433316
G3 X108.121 Y124.945 I.579 J-1.199 E.01646
; LINE_WIDTH: 0.38648
G3 X108.071 Y124.813 I1.349 J-.584 E.00209
; LINE_WIDTH: 0.344031
G3 X108.034 Y124.648 I1.478 J-.421 E.00223
; WIPE_START
G1 F15000
G1 X108.008 Y124.477 E-.06558
G1 X107.992 Y124.166 E-.11836
G1 X107.992 Y122.65 E-.57606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.71 Y117.595 Z5.1 F42000
G1 X115.8 Y115.747 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2620
M204 S6000
G1 X115.832 Y115.72 E.00073
G3 X116.939 Y115.304 I1.075 J1.179 E.02116
G1 X117.069 Y115.311 E.00227
G3 X115.627 Y115.947 I-.161 J1.588 E.14634
G1 X115.761 Y115.792 E.00357
M204 S10000
G1 X115.485 Y115.459 F42000
G1 F2620
M204 S6000
G1 X115.543 Y115.401 E.00145
G3 X116.948 Y114.875 I1.362 J1.498 E.02684
G1 X117.107 Y114.884 E.00278
G3 X115.278 Y115.694 I-.202 J2.014 E.18557
G1 X115.445 Y115.505 E.00441
M204 S250
G1 X115.179 Y115.183 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2620
M204 S5000
G1 X115.265 Y115.093 E.00201
G3 X116.957 Y114.461 I1.639 J1.805 E.03006
G1 X117.144 Y114.472 E.00304
G3 X114.942 Y115.451 I-.241 J2.426 E.20778
G1 X115.139 Y115.228 E.00483
; WIPE_START
G1 F3600
M204 S6000
G1 X115.265 Y115.093 E-.06994
G1 X115.652 Y114.803 E-.18389
G1 X116.091 Y114.598 E-.18427
G1 X116.562 Y114.484 E-.18388
G1 X116.924 Y114.463 E-.13802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.01 Y117.24 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2620
M204 S6000
G2 X118.039 Y116.585 I-1.047 J-.374 E.01081
G1 X117.845 Y116.192 E.0071
G1 X117.542 Y115.917 E.00666
G1 X117.263 Y115.776 E.00507
G1 X116.83 Y115.723 E.00707
G1 X116.413 Y115.825 E.00697
G1 X116.187 Y115.959 E.00428
G1 X115.896 Y116.28 E.00703
G1 X115.751 Y116.649 E.00644
G1 X115.722 Y116.994 E.00562
G1 X115.851 Y117.444 E.0076
G1 X116.136 Y117.802 E.00743
G2 X116.75 Y118.071 I1.053 J-1.565 E.01096
G1 X117.208 Y118.041 E.00744
G1 X117.623 Y117.834 E.00753
G1 X117.874 Y117.558 E.00607
G1 X117.986 Y117.295 E.00463
M204 S10000
G1 X117.584 Y116.563 F42000
G1 F2620
M204 S6000
G1 X117.423 Y116.321 E.00472
G1 X117.158 Y116.165 E.00501
G1 X116.854 Y116.127 E.00497
G1 X116.504 Y116.235 E.00595
G1 X116.231 Y116.503 E.00621
G1 X116.125 Y116.802 E.00515
G1 X116.149 Y117.114 E.00509
G1 X116.287 Y117.384 E.00492
G1 X116.504 Y117.571 E.00465
G1 X116.893 Y117.678 E.00655
G1 X117.181 Y117.624 E.00475
G1 X117.431 Y117.464 E.00482
G1 X117.582 Y117.277 E.00391
G1 X117.674 Y116.887 E.0065
G1 X117.674 Y116.833 E.00089
G1 X117.603 Y116.62 E.00364
M204 S10000
G1 X117.237 Y117.041 F42000
G1 F2620
M204 S6000
G1 X117.276 Y116.84 E.00332
G1 X117.146 Y116.613 E.00424
G1 X116.996 Y116.546 E.00267
G1 X116.719 Y116.571 E.00453
G1 X116.536 Y116.794 E.00469
G1 X116.534 Y117.004 E.00342
G1 X116.665 Y117.198 E.0038
G1 X116.931 Y117.278 E.00451
G1 X117.127 Y117.205 E.00339
G1 X117.204 Y117.09 E.00224
M204 S10000
G1 X116.921 Y116.865 F42000
; LINE_WIDTH: 0.34832
G1 F2620
M204 S6000
G1 X116.86 Y116.9 E.00094
G1 X116.905 Y116.926 E.00069
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.86 Y116.9 E-.32053
G1 X116.921 Y116.865 E-.43947
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 48/83
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.1 I.912 J.806 P1  F42000
G1 X124.463 Y108.333 Z5.1
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2621
M204 S5000
G1 X124.667 Y108.394 E.00345
G3 X125.509 Y109.646 I-.52 J1.259 E.02596
G1 X125.509 Y124.154 E.23559
G3 X124.154 Y125.509 I-1.362 J-.008 E.0345
G1 X109.646 Y125.509 E.23559
G3 X108.291 Y124.154 I.008 J-1.362 E.0345
G1 X108.291 Y109.646 E.23559
G3 X109.646 Y108.291 I1.362 J.008 E.0345
M73 P79 R5
G1 X124.154 Y108.291 E.23559
G3 X124.406 Y108.316 I-.008 J1.362 E.00411
; WIPE_START
G1 F3600
M204 S6000
G1 X124.667 Y108.394 E-.10347
G1 X124.903 Y108.52 E-.10173
G1 X125.11 Y108.69 E-.10176
G1 X125.28 Y108.897 E-.10176
G1 X125.406 Y109.133 E-.10174
G1 X125.484 Y109.39 E-.10175
G1 X125.509 Y109.646 E-.09779
G1 X125.509 Y109.777 E-.05
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.043 Y115.105 Z5.2 F42000
G1 X108.773 Y126.091 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2621
M204 S5000
G1 X108.497 Y125.981 E.00483
G3 X107.652 Y124.609 I.7 J-1.378 E.02752
G1 X107.652 Y109.148 E.25105
G3 X109.149 Y107.652 I1.545 J.049 E.03784
G1 X124.784 Y107.661 E.25389
G3 X126.148 Y109.189 I-.186 J1.539 E.03633
G1 X126.148 Y124.651 E.25108
G3 X124.609 Y126.148 I-1.545 J-.049 E.03853
G1 X109.149 Y126.148 E.25105
G3 X108.831 Y126.104 I.049 J-1.545 E.00521
; WIPE_START
G1 F3600
M204 S6000
G1 X108.497 Y125.981 E-.13545
M73 P80 R5
G1 X108.24 Y125.822 E-.11474
G1 X108.048 Y125.644 E-.0996
G1 X107.871 Y125.405 E-.11302
G1 X107.762 Y125.186 E-.09294
G1 X107.69 Y124.952 E-.09303
G1 X107.657 Y124.661 E-.11124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 48 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer48 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X108.005 Y124.599 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297807
G1 F2621
M204 S6000
G1 X107.988 Y124.489 E.00126
; LINE_WIDTH: 0.247513
G3 X107.972 Y124.176 I3.165 J-.325 E.00289
G1 X107.972 Y109.625 E.13402
; LINE_WIDTH: 0.261448
G1 X107.986 Y109.337 E.00282
; LINE_WIDTH: 0.299502
G3 X108.011 Y109.16 I1.818 J.167 E.00202
; LINE_WIDTH: 0.345793
G3 X108.051 Y108.973 I1.818 J.286 E.00253
; LINE_WIDTH: 0.391582
G3 X108.137 Y108.761 I2.839 J1.036 E.00345
; LINE_WIDTH: 0.429891
G3 X108.842 Y108.101 I1.208 J.584 E.01643
; LINE_WIDTH: 0.38291
G3 X108.973 Y108.052 I.587 J1.357 E.00207
; LINE_WIDTH: 0.345318
G3 X109.161 Y108.011 I.401 J1.404 E.00253
; LINE_WIDTH: 0.30292
G1 X109.312 Y107.989 E.00175
; LINE_WIDTH: 0.247352
G3 X109.625 Y107.972 I.325 J3.172 E.00289
G1 X124.164 Y107.972 E.13382
G1 X124.463 Y107.986 E.00275
; LINE_WIDTH: 0.299393
G3 X124.639 Y108.011 I-.166 J1.811 E.00201
; LINE_WIDTH: 0.345627
G3 X124.795 Y108.042 I-.292 J1.902 E.00209
G1 X124.824 Y108.05 E.0004
; LINE_WIDTH: 0.39116
G3 X125.039 Y108.137 I-1.061 J2.907 E.00349
; LINE_WIDTH: 0.431144
G3 X125.683 Y108.805 I-.575 J1.199 E.01582
; LINE_WIDTH: 0.387227
G3 X125.749 Y108.973 I-1.64 J.736 E.0027
; LINE_WIDTH: 0.341865
G3 X125.794 Y109.195 I-1.889 J.506 E.00296
; LINE_WIDTH: 0.298667
G1 X125.812 Y109.311 E.00133
; LINE_WIDTH: 0.247778
G3 X125.828 Y109.624 I-3.165 J.325 E.00289
G1 X125.828 Y124.164 E.13407
G1 X125.814 Y124.463 E.00276
; LINE_WIDTH: 0.299396
G3 X125.789 Y124.639 I-1.81 J-.166 E.00201
; LINE_WIDTH: 0.345626
G3 X125.758 Y124.795 I-1.9 J-.292 E.00209
G1 X125.75 Y124.824 E.0004
; LINE_WIDTH: 0.391151
G3 X125.663 Y125.039 I-2.907 J-1.061 E.00348
; LINE_WIDTH: 0.429892
G3 X124.958 Y125.699 I-1.208 J-.583 E.01644
; LINE_WIDTH: 0.382958
G3 X124.827 Y125.749 I-.586 J-1.352 E.00207
; LINE_WIDTH: 0.340362
G3 X124.599 Y125.795 I-.429 J-1.508 E.00302
; LINE_WIDTH: 0.297807
G1 X124.489 Y125.812 E.00126
; LINE_WIDTH: 0.247778
G3 X124.176 Y125.828 I-.325 J-3.165 E.00289
G1 X109.636 Y125.828 E.13407
G1 X109.337 Y125.814 E.00276
; LINE_WIDTH: 0.299396
G3 X109.161 Y125.789 I.166 J-1.81 E.00201
; LINE_WIDTH: 0.345626
G3 X109.005 Y125.758 I.292 J-1.9 E.00209
G1 X108.976 Y125.75 E.0004
; LINE_WIDTH: 0.391151
G3 X108.762 Y125.663 I1.061 J-2.907 E.00348
; LINE_WIDTH: 0.429888
G3 X108.101 Y124.958 I.583 J-1.208 E.01644
; LINE_WIDTH: 0.38295
G3 X108.052 Y124.827 I1.357 J-.587 E.00207
; LINE_WIDTH: 0.340361
G3 X108.014 Y124.659 I1.508 J-.429 E.00224
; WIPE_START
G1 F15000
G1 X107.988 Y124.489 E-.06527
G1 X107.972 Y124.176 E-.11914
G1 X107.972 Y122.661 E-.57559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.692 Y117.608 Z5.2 F42000
G1 X115.799 Y115.748 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2621
M204 S6000
G1 X115.832 Y115.72 E.00076
G3 X116.941 Y115.304 I1.076 J1.18 E.0212
G1 X117.069 Y115.311 E.00223
G3 X115.627 Y115.947 I-.16 J1.589 E.1464
G1 X115.76 Y115.794 E.00354
M204 S10000
G1 X115.483 Y115.461 F42000
G1 F2621
M204 S6000
G1 X115.543 Y115.401 E.00147
G3 X116.951 Y114.875 I1.363 J1.498 E.02688
G1 X117.107 Y114.884 E.00273
G3 X115.278 Y115.694 I-.201 J2.015 E.18566
G1 X115.444 Y115.506 E.00438
M204 S250
G1 X115.178 Y115.185 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2621
M204 S5000
G1 X115.265 Y115.094 E.00204
G3 X116.96 Y114.461 I1.639 J1.806 E.0301
G1 X117.144 Y114.472 E.003
G3 X114.942 Y115.451 I-.24 J2.427 E.2079
G1 X115.138 Y115.23 E.0048
; WIPE_START
G1 F3600
M204 S6000
G1 X115.265 Y115.094 E-.07058
G1 X115.652 Y114.803 E-.18399
G1 X116.091 Y114.598 E-.18418
G1 X116.56 Y114.484 E-.18324
G1 X116.922 Y114.463 E-.138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.336 Y117.415 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2621
M204 S6000
G1 X116.53 Y117.587 E.00421
G1 X116.799 Y117.673 E.00459
G1 X117.2 Y117.617 E.00657
G1 X117.437 Y117.463 E.00459
G1 X117.599 Y117.241 E.00445
G1 X117.676 Y116.852 E.00645
G2 X117.564 Y116.516 I-.714 J.051 E.00581
G1 X117.331 Y116.257 E.00566
G1 X117.159 Y116.165 E.00318
G1 X116.854 Y116.127 E.00498
G1 X116.501 Y116.236 E.00599
G1 X116.231 Y116.504 E.00617
G1 X116.125 Y116.802 E.00515
G1 X116.15 Y117.116 E.00511
G1 X116.304 Y117.364 E.00475
M204 S10000
G1 X116.878 Y116.532 F42000
G1 F2621
M204 S6000
G1 X116.684 Y116.597 E.00332
G1 X116.531 Y116.817 E.00435
G1 X116.547 Y117.037 E.00359
G1 X116.75 Y117.248 E.00475
G1 X117.038 Y117.253 E.00468
G1 X117.202 Y117.13 E.00332
G1 X117.273 Y116.854 E.00463
G1 X117.264 Y116.795 E.00097
G1 X117.075 Y116.564 E.00485
G1 X116.937 Y116.541 E.00227
M204 S10000
G1 X117.041 Y115.749 F42000
G1 F2621
M204 S6000
G1 X116.83 Y115.723 E.00345
G1 X116.412 Y115.825 E.00699
G1 X116.182 Y115.963 E.00436
G1 X115.895 Y116.28 E.00694
G1 X115.752 Y116.646 E.00638
G1 X115.722 Y116.986 E.00554
G1 X115.848 Y117.436 E.00758
G1 X116.116 Y117.782 E.00712
G1 X116.455 Y117.989 E.00644
G1 X116.775 Y118.074 E.00539
G1 X117.217 Y118.038 E.0072
G1 X117.62 Y117.837 E.00731
G1 X117.923 Y117.491 E.00746
G2 X118.079 Y116.849 I-1.726 J-.759 E.01079
G2 X117.957 Y116.372 I-1.629 J.165 E.00803
G1 X117.684 Y116.018 E.00726
G1 X117.375 Y115.824 E.00593
G1 X117.099 Y115.762 E.00459
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.375 Y115.824 E-.10734
G1 X117.684 Y116.018 E-.13878
G1 X117.957 Y116.372 E-.16989
G1 X118.051 Y116.672 E-.11929
G1 X118.079 Y116.849 E-.06833
G1 X118.035 Y117.153 E-.11675
G1 X118.003 Y117.252 E-.03962
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 49/83
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.986 J.713 P1  F42000
G1 X124.473 Y108.31 Z5.2
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2629
M204 S5000
G1 X124.681 Y108.373 E.00352
G3 X125.531 Y109.636 I-.525 J1.27 E.02619
G1 X125.531 Y124.164 E.23591
G3 X124.164 Y125.531 I-1.375 J-.008 E.03481
G1 X109.636 Y125.531 E.23591
G3 X108.269 Y124.164 I.008 J-1.375 E.03481
G1 X108.269 Y109.636 E.23591
G3 X109.636 Y108.269 I1.375 J.008 E.03481
G1 X124.164 Y108.269 E.23591
G3 X124.416 Y108.294 I-.008 J1.375 E.00411
; WIPE_START
G1 F3600
M204 S6000
G1 X124.681 Y108.373 E-.10521
G1 X124.919 Y108.501 E-.10264
G1 X125.128 Y108.672 E-.10264
G1 X125.3 Y108.881 E-.10269
G1 X125.427 Y109.119 E-.10264
G1 X125.505 Y109.378 E-.10267
G1 X125.531 Y109.636 E-.0987
G1 X125.531 Y109.749 E-.04281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.068 Y115.079 Z5.3 F42000
G1 X108.761 Y126.11 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F2629
M204 S5000
G1 X108.482 Y126 E.00488
G3 X107.633 Y124.62 I.697 J-1.379 E.02769
G1 X107.634 Y109.137 E.25142
G3 X109.137 Y107.634 I1.552 J.05 E.038
G1 X124.796 Y107.643 E.25427
G3 X126.167 Y109.178 I-.187 J1.546 E.03649
G1 X126.166 Y124.663 E.25145
G3 X124.62 Y126.167 I-1.545 J-.042 E.03875
G1 X109.137 Y126.166 E.25141
G3 X108.819 Y126.124 I.042 J-1.545 E.00521
; WIPE_START
G1 F3600
M204 S6000
G1 X108.482 Y126 E-.13663
G1 X108.27 Y125.874 E-.09357
G1 X108.032 Y125.66 E-.12174
G1 X107.854 Y125.42 E-.11344
G1 X107.745 Y125.2 E-.09333
G1 X107.672 Y124.965 E-.09339
G1 X107.64 Y124.683 E-.1079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 49 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer49 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.985 Y124.612 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336699
G1 F2629
M204 S6000
G1 X107.985 Y124.61 E.00002
; LINE_WIDTH: 0.293997
G1 X107.968 Y124.5 E.00123
; LINE_WIDTH: 0.243626
G3 X107.952 Y124.185 I3.17 J-.326 E.00286
G1 X107.952 Y109.615 E.13189
; LINE_WIDTH: 0.257651
G1 X107.966 Y109.325 E.0028
; LINE_WIDTH: 0.295839
G3 X107.991 Y109.148 I1.806 J.165 E.002
; LINE_WIDTH: 0.342253
G3 X108.031 Y108.959 I1.861 J.294 E.00252
; LINE_WIDTH: 0.38811
G3 X108.118 Y108.746 I2.919 J1.069 E.00344
; LINE_WIDTH: 0.426447
G3 X108.828 Y108.082 I1.216 J.587 E.01642
; LINE_WIDTH: 0.37936
G3 X108.96 Y108.032 I.587 J1.356 E.00205
; LINE_WIDTH: 0.341768
G3 X109.149 Y107.991 I.408 J1.43 E.00253
; LINE_WIDTH: 0.299208
G1 X109.3 Y107.969 E.00173
; LINE_WIDTH: 0.243459
G3 X109.615 Y107.952 I.328 J3.202 E.00285
G1 X124.174 Y107.952 E.13169
G1 X124.475 Y107.966 E.00273
; LINE_WIDTH: 0.295742
G3 X124.651 Y107.991 I-.167 J1.817 E.00199
; LINE_WIDTH: 0.342048
G3 X124.809 Y108.022 I-.299 J1.935 E.0021
G1 X124.838 Y108.03 E.00039
; LINE_WIDTH: 0.38765
G3 X125.053 Y108.118 I-1.065 J2.917 E.00348
; LINE_WIDTH: 0.427713
G3 X125.702 Y108.791 I-.578 J1.207 E.0158
; LINE_WIDTH: 0.38372
G3 X125.768 Y108.96 I-1.64 J.737 E.00268
; LINE_WIDTH: 0.33818
G3 X125.815 Y109.184 I-1.927 J.516 E.00296
; LINE_WIDTH: 0.294817
G1 X125.832 Y109.3 E.0013
; LINE_WIDTH: 0.243895
G3 X125.848 Y109.615 I-3.17 J.326 E.00286
G1 X125.848 Y124.174 E.13195
G1 X125.834 Y124.475 E.00273
; LINE_WIDTH: 0.295738
G3 X125.809 Y124.651 I-1.799 J-.165 E.00199
; LINE_WIDTH: 0.342049
G3 X125.778 Y124.809 I-1.931 J-.298 E.0021
G1 X125.77 Y124.838 E.00039
; LINE_WIDTH: 0.38765
G3 X125.682 Y125.053 I-2.911 J-1.062 E.00348
; LINE_WIDTH: 0.426522
G3 X124.972 Y125.718 I-1.216 J-.587 E.01643
; LINE_WIDTH: 0.379406
G3 X124.84 Y125.768 I-.585 J-1.35 E.00205
; LINE_WIDTH: 0.336699
G3 X124.61 Y125.815 I-.437 J-1.542 E.00302
; LINE_WIDTH: 0.293997
G1 X124.5 Y125.832 E.00123
; LINE_WIDTH: 0.243895
G3 X124.185 Y125.848 I-.326 J-3.17 E.00286
G1 X109.626 Y125.848 E.13195
G1 X109.325 Y125.834 E.00273
; LINE_WIDTH: 0.295738
G3 X109.149 Y125.809 I.165 J-1.799 E.00199
; LINE_WIDTH: 0.342048
G3 X108.991 Y125.778 I.298 J-1.931 E.0021
G1 X108.963 Y125.77 E.00039
; LINE_WIDTH: 0.387646
G3 X108.747 Y125.682 I1.063 J-2.913 E.00348
; LINE_WIDTH: 0.426524
G3 X108.082 Y124.972 I.587 J-1.216 E.01642
; LINE_WIDTH: 0.379411
G3 X108.032 Y124.84 I1.352 J-.586 E.00205
; LINE_WIDTH: 0.336699
G1 X107.997 Y124.671 E.00222
; WIPE_START
G1 F15000
G1 X107.985 Y124.61 E-.02353
G1 X107.968 Y124.5 E-.04225
G1 X107.952 Y124.185 E-.11991
G1 X107.952 Y122.674 E-.57431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.675 Y117.624 Z5.3 F42000
G1 X115.79 Y115.759 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2629
M204 S6000
G1 X115.932 Y115.623 E.00342
G3 X116.866 Y115.303 I.96 J1.276 E.01753
G1 X116.933 Y115.303 E.00117
G3 X115.725 Y115.809 I-.041 J1.596 E.1516
G1 X115.743 Y115.795 E.00039
M204 S10000
G1 X115.503 Y115.442 F42000
G1 F2629
M204 S6000
G1 X115.671 Y115.283 E.00404
G3 X116.858 Y114.874 I1.221 J1.616 E.02229
G1 X116.947 Y114.875 E.00154
G3 X115.413 Y115.517 I-.054 J2.024 E.19225
G1 X115.457 Y115.48 E.001
M204 S250
G1 X115.226 Y115.136 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2629
M204 S5000
G1 X115.42 Y114.956 E.0043
G3 X116.851 Y114.461 I1.473 J1.943 E.02499
G1 X116.96 Y114.461 E.00177
G3 X115.112 Y115.234 I-.066 J2.438 E.21528
G1 X115.181 Y115.175 E.00148
; WIPE_START
G1 F3600
M204 S6000
G1 X115.42 Y114.956 E-.12347
G1 X115.652 Y114.804 E-.10515
G1 X115.91 Y114.67 E-.11062
G1 X116.29 Y114.538 E-.15276
G1 X116.559 Y114.484 E-.1044
G1 X116.851 Y114.461 E-.1112
G1 X116.96 Y114.461 E-.0415
G1 X116.989 Y114.465 E-.01089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.583 Y115.78 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2629
M204 S6000
G1 X116.287 Y115.89 E.00513
G1 X115.955 Y116.19 E.00727
G1 X115.786 Y116.522 E.00604
G1 X115.719 Y116.863 E.00564
G1 X115.793 Y117.314 E.00743
G1 X116.04 Y117.71 E.00756
G1 X116.419 Y117.979 E.00756
G1 X116.866 Y118.082 E.00745
G1 X117.263 Y118.019 E.00652
G1 X117.53 Y117.899 E.00475
G1 X117.86 Y117.589 E.00736
G1 X118.051 Y117.17 E.00747
G2 X118.006 Y116.484 I-1.304 J-.259 E.0113
G1 X117.766 Y116.096 E.0074
G1 X117.371 Y115.816 E.00787
G1 X116.923 Y115.718 E.00744
G1 X116.642 Y115.769 E.00463
M204 S10000
G1 X117.404 Y116.309 F42000
G1 F2629
M204 S6000
G1 X117.144 Y116.161 E.00485
G1 X116.863 Y116.123 E.00462
G1 X116.479 Y116.244 E.00653
G1 X116.277 Y116.429 E.00446
G1 X116.139 Y116.721 E.00525
G1 X116.129 Y117.023 E.0049
G1 X116.237 Y117.313 E.00502
G1 X116.453 Y117.541 E.00511
G1 X116.733 Y117.664 E.00496
G1 X117.032 Y117.67 E.00486
G1 X117.297 Y117.571 E.00459
G1 X117.583 Y117.272 E.00673
G1 X117.671 Y116.999 E.00465
G1 X117.676 Y116.85 E.00243
G1 X117.6 Y116.56 E.00487
G1 X117.441 Y116.356 E.0042
M204 S10000
G1 X116.861 Y116.527 F42000
G1 F2629
M204 S6000
G1 X116.616 Y116.649 E.00445
G1 X116.524 Y116.854 E.00366
G1 X116.56 Y117.068 E.00352
G1 X116.714 Y117.231 E.00364
G1 X116.932 Y117.278 E.00362
G1 X117.072 Y117.236 E.00236
G1 X117.262 Y117.012 E.00478
G1 X117.278 Y116.874 E.00227
G1 X117.203 Y116.673 E.00348
G1 X117.02 Y116.539 E.00368
G1 X116.921 Y116.532 E.00161
M204 S10000
G1 X116.909 Y116.871 F42000
; LINE_WIDTH: 0.3537
G1 F2629
M204 S6000
G1 X116.847 Y116.907 E.00097
G1 X116.893 Y116.934 E.00072
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X116.847 Y116.907 E-.32406
G1 X116.909 Y116.871 E-.43594
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 50/83
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.3 I.912 J.805 P1  F42000
G1 X124.483 Y108.288 Z5.3
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2633
M204 S5000
G1 X124.695 Y108.352 E.0036
G3 X125.553 Y109.626 I-.529 J1.282 E.02642
G1 X125.553 Y124.174 E.23622
G3 X124.174 Y125.553 I-1.387 J-.008 E.03512
G1 X109.626 Y125.553 E.23622
G3 X108.247 Y124.174 I.008 J-1.387 E.03512
G1 X108.247 Y109.626 E.23622
G3 X109.626 Y108.247 I1.387 J.008 E.03512
G1 X124.174 Y108.247 E.23622
G3 X124.426 Y108.272 I-.008 J1.387 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.695 Y108.352 E-.10695
G1 X124.936 Y108.481 E-.10354
G1 X125.146 Y108.654 E-.10358
G1 X125.319 Y108.864 E-.10358
G1 X125.448 Y109.105 E-.10355
G1 X125.527 Y109.365 E-.10357
G1 X125.553 Y109.626 E-.09961
G1 X125.553 Y109.72 E-.03561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.092 Y115.052 Z5.4 F42000
G1 X108.749 Y126.128 Z5.4
G1 Z5
G1 E.8 F1800
M73 P81 R5
G1 F2633
M204 S5000
G1 X108.469 Y126.015 E.00491
G3 X107.615 Y124.631 I.707 J-1.391 E.02777
G1 X107.616 Y109.125 E.25178
G3 X109.125 Y107.616 I1.559 J.051 E.03815
G1 X124.808 Y107.625 E.25466
G3 X126.185 Y109.167 I-.189 J1.553 E.03665
G1 X126.184 Y124.675 E.25182
G3 X124.631 Y126.185 I-1.56 J-.051 E.03887
G1 X109.125 Y126.184 E.25178
G3 X108.807 Y126.14 I.051 J-1.56 E.00523
; WIPE_START
G1 F3600
M204 S6000
G1 X108.469 Y126.015 E-.13707
G1 X108.209 Y125.855 E-.11583
G1 X108.016 Y125.676 E-.09999
G1 X107.837 Y125.435 E-.11413
G1 X107.728 Y125.214 E-.09361
G1 X107.654 Y124.978 E-.09389
G1 X107.623 Y124.702 E-.10548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 50 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer50 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.967 Y124.632 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333019
G1 F2633
M204 S6000
G1 X107.965 Y124.621 E.00014
; LINE_WIDTH: 0.290174
G1 X107.948 Y124.512 E.00121
; LINE_WIDTH: 0.23975
G3 X107.932 Y124.195 I3.197 J-.328 E.00283
G1 X107.932 Y109.605 E.12976
; LINE_WIDTH: 0.253872
G1 X107.946 Y109.313 E.00277
; LINE_WIDTH: 0.292156
G3 X107.971 Y109.136 I1.812 J.166 E.00197
; LINE_WIDTH: 0.338589
G3 X108.011 Y108.947 I1.92 J.305 E.00251
; LINE_WIDTH: 0.384509
G3 X108.099 Y108.732 I2.937 J1.076 E.00344
; LINE_WIDTH: 0.423022
G3 X108.814 Y108.062 I1.224 J.592 E.01639
; LINE_WIDTH: 0.37583
G3 X108.946 Y108.013 I.59 J1.361 E.00203
; LINE_WIDTH: 0.338177
G3 X109.137 Y107.971 I.416 J1.463 E.00252
; LINE_WIDTH: 0.295494
G1 X109.288 Y107.949 E.00171
; LINE_WIDTH: 0.239576
G3 X109.605 Y107.932 I.329 J3.204 E.00282
G1 X124.184 Y107.932 E.12956
G1 X124.487 Y107.946 E.0027
; LINE_WIDTH: 0.292055
G3 X124.663 Y107.971 I-.166 J1.808 E.00196
; LINE_WIDTH: 0.338398
G3 X124.823 Y108.003 I-.302 J1.956 E.0021
G1 X124.851 Y108.01 E.00037
; LINE_WIDTH: 0.38409
G3 X125.068 Y108.099 I-1.061 J2.91 E.00347
; LINE_WIDTH: 0.4243
G3 X125.721 Y108.776 I-.582 J1.216 E.01577
; LINE_WIDTH: 0.380248
G3 X125.788 Y108.946 I-1.65 J.742 E.00267
; LINE_WIDTH: 0.334545
G3 X125.835 Y109.173 I-1.967 J.526 E.00296
; LINE_WIDTH: 0.291024
G1 X125.852 Y109.288 E.00128
; LINE_WIDTH: 0.240022
G3 X125.868 Y109.605 I-3.197 J.328 E.00283
G1 X125.868 Y124.184 E.12982
G1 X125.854 Y124.487 E.0027
; LINE_WIDTH: 0.29205
G3 X125.829 Y124.663 I-1.805 J-.166 E.00196
; LINE_WIDTH: 0.338398
G3 X125.797 Y124.823 I-1.955 J-.302 E.0021
G1 X125.79 Y124.851 E.00037
; LINE_WIDTH: 0.38409
G3 X125.701 Y125.068 I-2.906 J-1.06 E.00347
; LINE_WIDTH: 0.42302
G3 X124.986 Y125.738 I-1.224 J-.591 E.0164
; LINE_WIDTH: 0.375862
G3 X124.854 Y125.787 I-.587 J-1.353 E.00204
; LINE_WIDTH: 0.333019
G3 X124.621 Y125.835 I-.445 J-1.573 E.00302
; LINE_WIDTH: 0.290174
G1 X124.512 Y125.852 E.00121
; LINE_WIDTH: 0.240022
G3 X124.195 Y125.868 I-.328 J-3.197 E.00283
G1 X109.616 Y125.868 E.12982
G1 X109.313 Y125.854 E.0027
; LINE_WIDTH: 0.29205
G3 X109.137 Y125.829 I.166 J-1.805 E.00196
; LINE_WIDTH: 0.338398
G3 X108.977 Y125.797 I.302 J-1.955 E.0021
G1 X108.949 Y125.79 E.00037
; LINE_WIDTH: 0.38409
G3 X108.732 Y125.701 I1.06 J-2.906 E.00347
; LINE_WIDTH: 0.42302
G3 X108.062 Y124.986 I.591 J-1.224 E.0164
; LINE_WIDTH: 0.375862
G3 X108.013 Y124.854 I1.353 J-.587 E.00204
; LINE_WIDTH: 0.333019
G1 X107.979 Y124.691 E.00212
; WIPE_START
G1 F15000
G1 X107.965 Y124.621 E-.02696
G1 X107.948 Y124.512 E-.04197
G1 X107.932 Y124.195 E-.12068
G1 X107.932 Y122.694 E-.57039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.649 Y117.637 Z5.4 F42000
G1 X115.785 Y115.748 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2633
M204 S6000
G3 X116.865 Y115.303 I1.106 J1.152 E.02088
G1 X116.935 Y115.303 E.00121
G3 X115.743 Y115.79 I-.044 J1.596 E.15204
M204 S10000
G1 X115.516 Y115.425 F42000
G1 F2633
M204 S6000
G1 X115.798 Y115.195 E.00636
G3 X116.858 Y114.874 I1.094 J1.704 E.01959
G1 X116.949 Y114.875 E.00159
G3 X115.467 Y115.46 I-.057 J2.025 E.19361
M204 S250
G1 X115.258 Y115.105 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2633
M204 S5000
G1 X115.57 Y114.851 E.00653
G3 X116.851 Y114.461 I1.324 J2.048 E.02203
G1 X116.963 Y114.461 E.00181
G3 X115.19 Y115.153 I-.069 J2.438 E.2171
G1 X115.209 Y115.14 E.00038
; WIPE_START
G1 F3600
M204 S6000
G1 X115.57 Y114.851 E-.17548
G1 X116.001 Y114.632 E-.1837
G1 X116.369 Y114.519 E-.14653
G1 X116.851 Y114.461 E-.18441
G1 X116.963 Y114.461 E-.04246
G1 X117.034 Y114.47 E-.02742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.073 Y116.821 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2633
M204 S6000
G1 X118.01 Y116.494 E.00541
G1 X117.756 Y116.085 E.00782
G1 X117.388 Y115.824 E.00732
G1 X116.932 Y115.719 E.0076
G1 X116.493 Y115.791 E.00723
G1 X116.107 Y116.023 E.00731
G1 X115.83 Y116.4 E.00759
G1 X115.719 Y116.853 E.00758
G1 X115.79 Y117.306 E.00745
G1 X116.04 Y117.71 E.00771
G1 X116.42 Y117.98 E.00757
G1 X116.869 Y118.081 E.00748
G1 X117.307 Y118.009 E.0072
G1 X117.693 Y117.777 E.00731
G1 X117.974 Y117.393 E.00773
G1 X118.081 Y116.956 E.0073
G1 X118.076 Y116.881 E.00122
M204 S10000
G1 X117.117 Y117.636 F42000
G1 F2633
M204 S6000
G1 X117.34 Y117.542 E.00393
G1 X117.531 Y117.361 E.00428
G1 X117.66 Y117.085 E.00495
G1 X117.675 Y116.844 E.00392
G1 X117.601 Y116.564 E.00471
G1 X117.408 Y116.311 E.00516
G1 X117.159 Y116.167 E.00466
G1 X116.941 Y116.122 E.00363
G1 X116.501 Y116.228 E.00734
G1 X116.272 Y116.436 E.00503
G1 X116.14 Y116.716 E.00503
G1 X116.128 Y117.025 E.00502
G1 X116.233 Y117.307 E.00488
G1 X116.455 Y117.542 E.00525
G1 X116.731 Y117.662 E.00489
G1 X117.057 Y117.64 E.00531
M204 S10000
G1 X116.784 Y116.551 F42000
G1 F2633
M204 S6000
G1 X116.627 Y116.637 E.00291
G1 X116.53 Y116.811 E.00324
G1 X116.541 Y117.029 E.00354
G1 X116.685 Y117.214 E.00381
G1 X116.873 Y117.272 E.00319
G1 X117.132 Y117.2 E.00438
G1 X117.259 Y117.022 E.00355
G1 X117.277 Y116.867 E.00254
G1 X117.195 Y116.663 E.00356
G1 X117.034 Y116.546 E.00324
G1 X116.844 Y116.55 E.00308
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.034 Y116.546 E-.072
G1 X117.195 Y116.663 E-.07576
G1 X117.277 Y116.867 E-.0834
G1 X117.259 Y117.022 E-.05949
G1 X117.132 Y117.2 E-.08303
G1 X116.873 Y117.272 E-.10245
G1 X116.685 Y117.214 E-.07456
G1 X116.541 Y117.029 E-.08921
G1 X116.53 Y116.811 E-.08293
G1 X116.577 Y116.726 E-.03717
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 51/83
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.889 J.831 P1  F42000
G1 X124.493 Y108.265 Z5.4
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2783
M204 S5000
G1 X124.71 Y108.331 E.00367
G3 X125.575 Y109.616 I-.534 J1.293 E.02666
G1 X125.575 Y124.184 E.23654
G3 X124.184 Y125.575 I-1.399 J-.008 E.03543
G1 X109.616 Y125.575 E.23654
G3 X108.225 Y124.184 I.008 J-1.399 E.03543
G1 X108.225 Y109.616 E.23654
G3 X109.616 Y108.225 I1.399 J.008 E.03543
G1 X124.184 Y108.225 E.23654
G3 X124.436 Y108.25 I-.008 J1.399 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.71 Y108.331 E-.10869
G1 X124.952 Y108.461 E-.10446
G1 X125.165 Y108.635 E-.10447
G1 X125.339 Y108.848 E-.10451
G1 X125.469 Y109.09 E-.10445
G1 X125.549 Y109.353 E-.10448
G1 X125.575 Y109.616 E-.10051
G1 X125.575 Y109.691 E-.02843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.116 Y115.026 Z5.5 F42000
G1 X108.737 Y126.146 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X108.454 Y126.032 E.00495
G3 X107.597 Y124.642 I.711 J-1.397 E.0279
G1 X107.598 Y109.113 E.25215
G3 X109.113 Y107.598 I1.567 J.052 E.0383
G1 X124.82 Y107.607 E.25505
G3 X126.203 Y109.156 I-.19 J1.561 E.03682
G1 X126.202 Y124.687 E.25219
G3 X124.642 Y126.203 I-1.567 J-.052 E.03903
G1 X109.113 Y126.202 E.25215
G3 X108.794 Y126.158 I.052 J-1.567 E.00523
; WIPE_START
G1 F3600
M204 S6000
G1 X108.454 Y126.032 E-.13777
G1 X108.194 Y125.872 E-.1164
G1 X108.001 Y125.692 E-.10015
G1 X107.821 Y125.45 E-.11459
G1 X107.71 Y125.228 E-.09413
G1 X107.636 Y124.992 E-.0942
G1 X107.606 Y124.723 E-.10278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 51 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer51 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.949 Y124.656 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.326286
G1 F2783
M204 S6000
G1 X107.945 Y124.632 E.00031
; LINE_WIDTH: 0.286324
G1 X107.929 Y124.523 E.00118
; LINE_WIDTH: 0.235863
G3 X107.912 Y124.204 I3.203 J-.329 E.00279
G1 X107.912 Y109.596 E.12761
; LINE_WIDTH: 0.250084
G1 X107.927 Y109.301 E.00275
; LINE_WIDTH: 0.288524
G3 X107.952 Y109.124 I1.809 J.166 E.00194
; LINE_WIDTH: 0.334984
G3 X107.992 Y108.933 I1.976 J.316 E.00249
; LINE_WIDTH: 0.380959
G3 X108.08 Y108.717 I2.944 J1.079 E.00343
; LINE_WIDTH: 0.419581
G3 X108.801 Y108.043 I1.233 J.595 E.01637
; LINE_WIDTH: 0.372276
G3 X108.933 Y107.993 I.588 J1.356 E.00201
; LINE_WIDTH: 0.334646
G3 X109.125 Y107.951 I.425 J1.499 E.00251
; LINE_WIDTH: 0.291815
G1 X109.277 Y107.929 E.00169
; LINE_WIDTH: 0.235684
G3 X109.596 Y107.912 I.33 J3.21 E.00279
G1 X124.194 Y107.912 E.12741
G1 X124.499 Y107.927 E.00267
; LINE_WIDTH: 0.288434
G3 X124.675 Y107.951 I-.168 J1.821 E.00193
; LINE_WIDTH: 0.334819
G3 X124.837 Y107.983 I-.308 J1.986 E.0021
G1 X124.864 Y107.991 E.00036
; LINE_WIDTH: 0.380558
G3 X125.083 Y108.08 I-1.067 J2.924 E.00346
; LINE_WIDTH: 0.420872
G3 X125.74 Y108.762 I-.586 J1.224 E.01575
; LINE_WIDTH: 0.376734
G3 X125.807 Y108.933 I-1.657 J.746 E.00265
; LINE_WIDTH: 0.33088
G3 X125.855 Y109.162 I-1.997 J.534 E.00296
; LINE_WIDTH: 0.287174
G1 X125.872 Y109.277 E.00125
; LINE_WIDTH: 0.236139
G3 X125.888 Y109.596 I-3.203 J.329 E.0028
G1 X125.888 Y124.194 E.12769
G1 X125.873 Y124.499 E.00268
; LINE_WIDTH: 0.288434
G3 X125.849 Y124.675 I-1.803 J-.166 E.00193
; LINE_WIDTH: 0.334818
G3 X125.817 Y124.837 I-1.985 J-.308 E.0021
G1 X125.809 Y124.864 E.00036
; LINE_WIDTH: 0.380559
G3 X125.72 Y125.083 I-2.924 J-1.067 E.00346
; LINE_WIDTH: 0.419583
G3 X125 Y125.757 I-1.233 J-.595 E.01638
; LINE_WIDTH: 0.367984
G3 X124.867 Y125.807 I-.589 J-1.356 E.00199
G1 X124.836 Y125.816 E.00046
; LINE_WIDTH: 0.326286
G3 X124.632 Y125.855 I-.455 J-1.804 E.00259
; LINE_WIDTH: 0.286324
G1 X124.523 Y125.872 E.00118
; LINE_WIDTH: 0.236139
G3 X124.204 Y125.888 I-.329 J-3.203 E.0028
G1 X109.606 Y125.888 E.12769
G1 X109.301 Y125.873 E.00268
; LINE_WIDTH: 0.288434
G3 X109.125 Y125.849 I.166 J-1.803 E.00193
; LINE_WIDTH: 0.334818
G3 X108.963 Y125.817 I.308 J-1.985 E.0021
G1 X108.936 Y125.809 E.00036
; LINE_WIDTH: 0.380559
G3 X108.717 Y125.72 I1.067 J-2.924 E.00346
; LINE_WIDTH: 0.419583
G3 X108.043 Y125 I.595 J-1.233 E.01638
; LINE_WIDTH: 0.367984
G3 X107.993 Y124.867 I1.356 J-.589 E.00199
G1 X107.984 Y124.836 E.00046
; LINE_WIDTH: 0.326286
G1 X107.961 Y124.715 E.00153
; WIPE_START
G1 F15000
G1 X107.945 Y124.632 E-.03233
G1 X107.929 Y124.523 E-.04168
G1 X107.912 Y124.204 E-.12144
G1 X107.912 Y122.719 E-.56456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.209 Y117.224 Z5.5 F42000
G1 X115.244 Y115.114 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2783
M204 S5000
G1 X115.487 Y114.906 E.00519
G3 X116.851 Y114.461 I1.406 J1.993 E.02364
G1 X116.965 Y114.461 E.00186
G3 X115.189 Y115.154 I-.073 J2.438 E.217
G1 X115.196 Y115.149 E.00013
; WIPE_START
G1 F3600
M204 S6000
G1 X115.487 Y114.906 E-.14424
G1 X115.91 Y114.67 E-.18406
G1 X116.371 Y114.518 E-.18419
G1 X116.851 Y114.461 E-.18384
G1 X116.965 Y114.461 E-.04351
G1 X117.018 Y114.468 E-.02016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.366 Y114.83 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F2783
M204 S2000
G1 X118.97 Y116.434 E.03684
G1 X118.97 Y116.998
G1 X116.802 Y114.83 E.04978
G1 X116.201 Y114.792
G1 X119.008 Y117.599 E.06444
G1 X118.835 Y117.99
G1 X115.811 Y114.966 E.06944
G1 X115.477 Y115.195
G1 X118.605 Y118.323 E.07182
G1 X118.323 Y118.605
G1 X115.196 Y115.478 E.0718
G1 X114.966 Y115.812
G1 X117.988 Y118.834 E.0694
G1 X117.598 Y119.007
G1 X114.794 Y116.203 E.06439
G1 X114.83 Y116.803
G1 X116.998 Y118.97 E.04978
G1 X116.434 Y118.97
G1 X114.83 Y117.366 E.03684
; WIPE_START
G1 F3000
M204 S6000
G1 X116.244 Y118.78 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.99 Y116.144 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.08701
G1 F2783
M204 S6000
G1 X118.932 Y116.058 E.00028
; LINE_WIDTH: 0.122424
G1 X118.874 Y115.972 E.00043
; LINE_WIDTH: 0.152912
G1 X118.828 Y115.908 E.00042
; LINE_WIDTH: 0.190155
G1 X118.718 Y115.763 E.00126
; LINE_WIDTH: 0.237088
G2 X118.556 Y115.572 I-3.282 J2.61 E.0022
; LINE_WIDTH: 0.260315
G2 X118.132 Y115.161 I-3.767 J3.458 E.00574
; LINE_WIDTH: 0.220512
G1 X117.997 Y115.051 E.00142
; LINE_WIDTH: 0.189165
G1 X117.92 Y114.993 E.00066
; LINE_WIDTH: 0.162736
G1 X117.791 Y114.9 E.00092
; LINE_WIDTH: 0.136165
G1 X117.661 Y114.808 E.00074
; WIPE_START
G1 F15000
G1 X117.791 Y114.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.144 Y118.988 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.0790964
G1 F2783
M204 S6000
G1 X116.085 Y118.951 E.00016
; LINE_WIDTH: 0.104981
G1 X116.016 Y118.904 E.00028
; LINE_WIDTH: 0.136145
G1 X115.941 Y118.851 E.00043
; LINE_WIDTH: 0.166301
G1 X115.866 Y118.797 E.00054
; LINE_WIDTH: 0.191621
G1 X115.805 Y118.75 E.00053
; LINE_WIDTH: 0.220263
G1 X115.668 Y118.639 E.00143
; LINE_WIDTH: 0.256357
G3 X115.13 Y118.096 I2.903 J-3.409 E.00733
; LINE_WIDTH: 0.222403
G1 X115.082 Y118.037 E.00062
; LINE_WIDTH: 0.190699
G1 X114.974 Y117.896 E.00123
; LINE_WIDTH: 0.151273
G1 X114.891 Y117.777 E.00077
; LINE_WIDTH: 0.120055
G1 X114.808 Y117.658 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X114.891 Y117.777 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 52/83
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.5 I.857 J.864 P1  F42000
G1 X124.503 Y108.243 Z5.5
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2657
M204 S5000
G1 X124.724 Y108.31 E.00375
G3 X125.597 Y109.607 I-.539 J1.304 E.02689
G1 X125.597 Y124.193 E.23686
G3 X124.193 Y125.597 I-1.411 J-.008 E.03574
G1 X109.607 Y125.597 E.23686
G3 X108.203 Y124.193 I.008 J-1.411 E.03574
G1 X108.203 Y109.607 E.23686
G3 X109.607 Y108.203 I1.411 J.008 E.03574
G1 X124.193 Y108.203 E.23686
G3 X124.446 Y108.228 I-.008 J1.411 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.724 Y108.31 E-.11046
G1 X124.969 Y108.441 E-.10535
G1 X125.183 Y108.617 E-.1054
G1 X125.359 Y108.831 E-.1054
G1 X125.49 Y109.076 E-.10536
G1 X125.57 Y109.341 E-.10539
G1 X125.597 Y109.607 E-.10142
G1 X125.597 Y109.663 E-.02122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.14 Y114.999 Z5.6 F42000
G1 X108.725 Y126.164 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
M73 P82 R5
G1 X108.44 Y126.049 E.00498
G3 X107.579 Y124.652 I.714 J-1.404 E.02803
G1 X107.58 Y109.101 E.25252
G3 X109.102 Y107.58 I1.574 J.053 E.03846
G1 X124.832 Y107.589 E.25544
G3 X126.221 Y109.145 I-.191 J1.568 E.03699
G1 X126.22 Y124.698 E.25255
G3 X124.652 Y126.221 I-1.566 J-.045 E.03926
G1 X109.102 Y126.22 E.25252
G3 X108.782 Y126.176 I.053 J-1.574 E.00525
; WIPE_START
G1 F3600
M204 S6000
G1 X108.44 Y126.049 E-.13837
G1 X108.178 Y125.888 E-.11696
G1 X107.985 Y125.708 E-.10046
G1 X107.804 Y125.465 E-.11505
G1 X107.693 Y125.242 E-.09446
G1 X107.619 Y125.005 E-.0946
G1 X107.589 Y124.743 E-.1001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 52 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer52 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.931 Y124.677 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.322649
G1 F2657
M204 S6000
G1 X107.925 Y124.643 E.00043
; LINE_WIDTH: 0.282487
G1 X107.909 Y124.535 E.00116
; LINE_WIDTH: 0.231966
G3 X107.892 Y124.214 I3.239 J-.332 E.00276
G1 X107.892 Y109.586 E.12546
; LINE_WIDTH: 0.246286
G1 X107.907 Y109.289 E.00273
; LINE_WIDTH: 0.284812
G3 X107.932 Y109.113 I1.811 J.167 E.00191
; LINE_WIDTH: 0.331345
G3 X107.972 Y108.92 I2.03 J.326 E.00248
; LINE_WIDTH: 0.377422
G3 X108.061 Y108.703 I2.954 J1.082 E.00342
; LINE_WIDTH: 0.416156
G3 X108.787 Y108.024 I1.241 J.599 E.01635
; LINE_WIDTH: 0.368761
G3 X108.919 Y107.974 I.592 J1.365 E.002
; LINE_WIDTH: 0.331038
G3 X109.114 Y107.932 I.433 J1.53 E.00251
; LINE_WIDTH: 0.288066
G1 X109.265 Y107.909 E.00167
; LINE_WIDTH: 0.231781
G3 X109.586 Y107.892 I.332 J3.243 E.00276
G1 X124.203 Y107.892 E.12526
G1 X124.511 Y107.907 E.00264
; LINE_WIDTH: 0.284708
G3 X124.686 Y107.932 I-.166 J1.806 E.0019
; LINE_WIDTH: 0.331144
G3 X124.851 Y107.964 I-.316 J2.027 E.00211
G1 X124.877 Y107.971 E.00034
; LINE_WIDTH: 0.376998
G3 X125.097 Y108.061 I-1.07 J2.934 E.00345
; LINE_WIDTH: 0.417456
G3 X125.759 Y108.748 I-.59 J1.232 E.01572
; LINE_WIDTH: 0.373282
G3 X125.826 Y108.919 I-1.665 J.75 E.00264
; LINE_WIDTH: 0.327232
G3 X125.875 Y109.151 I-2.04 J.544 E.00296
; LINE_WIDTH: 0.283367
G1 X125.891 Y109.265 E.00123
; LINE_WIDTH: 0.232246
G3 X125.908 Y109.586 I-3.239 J.332 E.00276
G1 X125.908 Y124.203 E.12554
G1 X125.893 Y124.511 E.00265
; LINE_WIDTH: 0.284706
G3 X125.869 Y124.686 I-1.803 J-.166 E.0019
; LINE_WIDTH: 0.331152
G3 X125.836 Y124.851 I-2.022 J-.315 E.00211
G1 X125.829 Y124.877 E.00034
; LINE_WIDTH: 0.377004
G3 X125.739 Y125.097 I-2.934 J-1.071 E.00345
; LINE_WIDTH: 0.416238
G3 X125.014 Y125.776 I-1.241 J-.599 E.01635
; LINE_WIDTH: 0.364549
G3 X124.881 Y125.826 I-.591 J-1.362 E.00198
G1 X124.85 Y125.835 E.00045
; LINE_WIDTH: 0.322648
G3 X124.643 Y125.875 I-.462 J-1.826 E.0026
; LINE_WIDTH: 0.282487
G1 X124.535 Y125.891 E.00116
; LINE_WIDTH: 0.232246
G3 X124.214 Y125.908 I-.332 J-3.239 E.00276
G1 X109.597 Y125.908 E.12554
G1 X109.289 Y125.893 E.00265
; LINE_WIDTH: 0.284708
G3 X109.114 Y125.869 I.166 J-1.804 E.0019
; LINE_WIDTH: 0.331144
G3 X108.949 Y125.836 I.316 J-2.027 E.00211
G1 X108.923 Y125.829 E.00034
; LINE_WIDTH: 0.376999
G3 X108.703 Y125.739 I1.071 J-2.935 E.00346
; LINE_WIDTH: 0.416165
G3 X108.024 Y125.014 I.599 J-1.241 E.01634
; LINE_WIDTH: 0.364554
G3 X107.974 Y124.881 I1.354 J-.588 E.00198
G1 X107.965 Y124.85 E.00045
; LINE_WIDTH: 0.322649
G1 X107.943 Y124.736 E.00143
; WIPE_START
G1 F15000
G1 X107.925 Y124.643 E-.03599
G1 X107.909 Y124.535 E-.04136
G1 X107.892 Y124.214 E-.12223
G1 X107.892 Y122.739 E-.56043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.781 Y117.884 Z5.6 F42000
G1 X116.03 Y116.03 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2657
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.306 J.896 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53541
G1 X114.828 Y115.611 E-.17746
G1 X114.904 Y115.513 E-.04713
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.089 Y114.599 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G3 X116.968 Y114.461 I.898 J2.865 E.0145
G3 X117.712 Y114.6 I-.135 J2.795 E.01233
G1 X116.149 Y114.599 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16271
G1 X116.968 Y114.461 E-.15464
G1 X117.432 Y114.519 E-.17759
G1 X117.712 Y114.6 E-.11101
G1 X117.307 Y114.6 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G1 X117.77 Y114.621 E.02288
G1 X117.801 Y114.632 E.00053
G3 X119.179 Y116.03 I-.902 J2.268 E.0328
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.621 E-.53585
G1 X117.801 Y114.632 E-.01241
G1 X118.065 Y114.756 E-.11105
G1 X118.29 Y114.897 E-.1007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.289 Y117.383 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G3 X119.2 Y117.711 I-2.422 J-.485 E.00552
G1 X119.2 Y116.088 E.02635
G1 X119.223 Y116.155 E.00115
G3 X119.3 Y117.324 I-2.356 J.743 E.01921
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.1517
G1 X119.2 Y116.11 E-.6083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00133
G3 X117.77 Y119.179 I-2.254 J-.953 E.032
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53541
G1 X119.149 Y117.846 E-.03105
G1 X118.917 Y118.272 E-.18421
G1 X118.902 Y118.291 E-.00933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.466 Y119.298 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G3 X116.086 Y119.2 I.435 J-2.469 E.00636
G1 X117.711 Y119.201 E.02638
G3 X116.525 Y119.308 I-.811 J-2.372 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17149
G1 X117.635 Y119.201 E-.58851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.272 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.652 Y118.997 E-.15914
G1 X115.512 Y118.897 E-.06548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.51 Y116.417 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2657
M204 S5000
G3 X114.6 Y116.089 I2.4 J.483 E.00552
G1 X114.6 Y117.71 E.02632
G3 X114.499 Y116.475 I2.31 J-.811 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15165
G1 X114.6 Y117.69 E-.60835
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 53/83
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.841 J.88 P1  F42000
G1 X124.513 Y108.221 Z5.6
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G1 X124.739 Y108.289 E.00382
G3 X125.619 Y109.597 I-.543 J1.316 E.02712
G1 X125.619 Y124.203 E.23717
G3 X124.203 Y125.619 I-1.423 J-.008 E.03605
G1 X109.597 Y125.619 E.23717
G3 X108.181 Y124.203 I.008 J-1.423 E.03605
G1 X108.181 Y109.597 E.23717
G3 X109.597 Y108.181 I1.423 J.008 E.03605
G1 X124.203 Y108.181 E.23717
G3 X124.456 Y108.205 I-.008 J1.423 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.739 Y108.289 E-.11221
G1 X124.985 Y108.421 E-.10627
G1 X125.202 Y108.598 E-.10629
G1 X125.379 Y108.815 E-.10632
G1 X125.511 Y109.061 E-.10627
G1 X125.592 Y109.329 E-.1063
G1 X125.619 Y109.597 E-.10233
G1 X125.619 Y109.634 E-.01401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.164 Y114.973 Z5.7 F42000
G1 X108.714 Y126.182 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G1 X108.713 Y126.179 E.00004
G3 X107.561 Y124.663 I.43 J-1.523 E.03318
G1 X107.562 Y109.089 E.25289
G3 X109.09 Y107.562 I1.573 J.046 E.03865
G1 X124.844 Y107.571 E.25582
G3 X126.239 Y109.135 I-.192 J1.575 E.03716
G1 X126.238 Y124.71 E.25292
G3 X124.663 Y126.239 I-1.581 J-.054 E.03937
G1 X109.09 Y126.238 E.25289
G1 X108.773 Y126.191 E.0052
; WIPE_START
G1 F3600
M204 S6000
G1 X108.713 Y126.179 E-.02306
G1 X108.424 Y126.07 E-.11762
G1 X108.163 Y125.904 E-.11757
G1 X107.969 Y125.724 E-.10048
G1 X107.787 Y125.479 E-.11593
G1 X107.676 Y125.257 E-.09469
G1 X107.601 Y125.018 E-.095
G1 X107.573 Y124.768 E-.09566
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 53 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer53 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.914 Y124.702 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.319026
G1 F2677
M204 S6000
G1 X107.905 Y124.654 E.00059
; LINE_WIDTH: 0.278683
G1 X107.889 Y124.547 E.00113
; LINE_WIDTH: 0.22809
G3 X107.872 Y124.223 I3.269 J-.334 E.00273
G1 X107.872 Y109.577 E.12331
; LINE_WIDTH: 0.242508
G1 X107.887 Y109.277 E.0027
; LINE_WIDTH: 0.28117
G3 X107.912 Y109.101 I1.822 J.169 E.00188
; LINE_WIDTH: 0.327712
G3 X107.945 Y108.936 I2.201 J.354 E.00211
G1 X107.952 Y108.907 E.00036
; LINE_WIDTH: 0.373823
G3 X108.041 Y108.692 I2.954 J1.08 E.00335
; LINE_WIDTH: 0.412651
G3 X108.773 Y108.004 I1.251 J.6 E.01638
; LINE_WIDTH: 0.365233
G3 X108.905 Y107.954 I.593 J1.366 E.00198
; LINE_WIDTH: 0.327494
G3 X109.101 Y107.912 I.441 J1.561 E.0025
; LINE_WIDTH: 0.284383
G1 X109.254 Y107.889 E.00165
; LINE_WIDTH: 0.227899
G3 X109.577 Y107.872 I.333 J3.246 E.00272
G1 X124.213 Y107.872 E.12311
G1 X124.523 Y107.887 E.00261
; LINE_WIDTH: 0.281085
G3 X124.698 Y107.912 I-.166 J1.802 E.00187
; LINE_WIDTH: 0.327564
G3 X124.865 Y107.945 I-.322 J2.055 E.00211
G1 X124.89 Y107.951 E.00032
; LINE_WIDTH: 0.373461
G3 X125.112 Y108.042 I-1.069 J2.932 E.00344
; LINE_WIDTH: 0.414024
G3 X125.779 Y108.734 I-.594 J1.24 E.01569
; LINE_WIDTH: 0.369736
G3 X125.846 Y108.905 I-1.672 J.753 E.00262
; LINE_WIDTH: 0.323554
G3 X125.895 Y109.141 I-2.075 J.553 E.00296
; LINE_WIDTH: 0.279533
G1 X125.911 Y109.253 E.0012
; LINE_WIDTH: 0.228373
G3 X125.928 Y109.577 I-3.269 J.334 E.00273
G1 X125.928 Y124.213 E.12339
G1 X125.913 Y124.523 E.00262
; LINE_WIDTH: 0.28109
G3 X125.888 Y124.698 I-1.816 J-.168 E.00187
; LINE_WIDTH: 0.327565
G3 X125.855 Y124.865 I-2.044 J-.319 E.00211
G1 X125.849 Y124.89 E.00032
; LINE_WIDTH: 0.373466
G3 X125.758 Y125.112 I-2.927 J-1.067 E.00344
; LINE_WIDTH: 0.412722
G3 X125.027 Y125.796 I-1.249 J-.603 E.01632
; LINE_WIDTH: 0.361034
G3 X124.895 Y125.846 I-.592 J-1.362 E.00196
G1 X124.864 Y125.855 E.00044
; LINE_WIDTH: 0.319026
G3 X124.654 Y125.896 I-.47 J-1.86 E.0026
; LINE_WIDTH: 0.278683
G1 X124.547 Y125.911 E.00113
; LINE_WIDTH: 0.228373
G3 X124.223 Y125.928 I-.334 J-3.269 E.00273
G1 X109.587 Y125.928 E.12339
G1 X109.277 Y125.913 E.00262
; LINE_WIDTH: 0.28109
G3 X109.102 Y125.888 I.168 J-1.816 E.00187
; LINE_WIDTH: 0.327565
G3 X108.935 Y125.855 I.319 J-2.044 E.00211
G1 X108.91 Y125.849 E.00032
; LINE_WIDTH: 0.373466
G3 X108.688 Y125.758 I1.067 J-2.927 E.00344
; LINE_WIDTH: 0.41272
G3 X108.004 Y125.027 I.603 J-1.249 E.01632
; LINE_WIDTH: 0.361035
G3 X107.954 Y124.895 I1.361 J-.591 E.00196
G1 X107.945 Y124.864 E.00044
; LINE_WIDTH: 0.319026
G1 X107.925 Y124.761 E.00128
; WIPE_START
G1 F15000
G1 X107.905 Y124.654 E-.04138
G1 X107.889 Y124.547 E-.04112
G1 X107.872 Y124.223 E-.12299
G1 X107.872 Y122.764 E-.55452
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.758 Y117.905 Z5.7 F42000
G1 X116.03 Y116.03 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2677
M204 S5000
G1 X114.623 Y116.03 E.02285
G3 X116.03 Y114.622 I2.299 J.891 E.03327
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.623 Y116.03 E-.53532
G1 X114.732 Y115.781 E-.10341
G1 X114.882 Y115.529 E-.11143
G1 X114.898 Y115.509 E-.00984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G3 X116.97 Y114.461 I.809 J2.318 E.0145
G3 X117.712 Y114.6 I-.138 J2.793 E.01229
G1 X116.153 Y114.598 E.02532
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16042
G1 X116.97 Y114.461 E-.15637
G1 X117.432 Y114.519 E-.17662
G1 X117.712 Y114.6 E-.11097
G1 X117.303 Y114.599 E-.15562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G1 X117.77 Y114.621 E.02288
G1 X117.801 Y114.632 E.00053
G3 X119.179 Y116.03 I-.937 J2.303 E.03277
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.621 E-.53584
G1 X117.801 Y114.632 E-.01246
G1 X118.044 Y114.745 E-.10196
G1 X118.29 Y114.897 E-.10974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y117.383 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G3 X119.2 Y117.71 I-2.457 J-.486 E.0055
G1 X119.2 Y116.087 E.02635
G1 X119.217 Y116.136 E.00085
G3 X119.299 Y117.324 I-2.386 J.761 E.01952
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.71 E-.15132
G1 X119.2 Y116.108 E-.60868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.178 I-2.204 J-1.034 E.0304
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.06826
G1 X118.899 Y118.288 E-.1559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.369 Y119.278 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G3 X116.088 Y119.2 I.532 J-2.45 E.00474
G1 X117.707 Y119.202 E.0263
G3 X116.428 Y119.29 I-.806 J-2.374 E.02106
; WIPE_START
G1 F3600
M204 S6000
G1 X116.088 Y119.2 E-.13362
G1 X117.707 Y119.202 E-.61541
G1 X117.679 Y119.209 E-.01097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G1 X116.03 Y119.179 E.02288
M73 P83 R5
G3 X114.621 Y117.77 I.909 J-2.319 E.03329
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53584
G1 X115.736 Y119.044 E-.1227
G1 X115.568 Y118.944 E-.07446
G1 X115.511 Y118.902 E-.027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2677
M204 S5000
G3 X114.6 Y116.09 I2.372 J.484 E.0055
G1 X114.6 Y117.71 E.0263
G3 X114.498 Y116.475 I2.281 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.09 E-.15133
G1 X114.6 Y117.692 E-.60867
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 54/83
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.7 I.841 J.879 P1  F42000
G1 X124.523 Y108.198 Z5.7
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G1 X124.753 Y108.268 E.0039
G3 X125.64 Y109.587 I-.548 J1.327 E.02736
G1 X125.64 Y124.213 E.23749
G3 X124.213 Y125.641 I-1.436 J-.008 E.03636
G1 X109.587 Y125.641 E.23749
G3 X108.16 Y124.213 I.008 J-1.436 E.03636
G1 X108.16 Y109.587 E.23749
G3 X109.587 Y108.16 I1.436 J.008 E.03636
G1 X124.213 Y108.16 E.23749
G3 X124.465 Y108.183 I-.008 J1.436 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.753 Y108.268 E-.11395
G1 X125.002 Y108.401 E-.10718
G1 X125.22 Y108.58 E-.10722
G1 X125.399 Y108.798 E-.10721
G1 X125.532 Y109.047 E-.10719
G1 X125.614 Y109.317 E-.1072
G1 X125.64 Y109.587 E-.10324
G1 X125.64 Y109.605 E-.00682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.188 Y114.946 Z5.8 F42000
G1 X108.701 Y126.199 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G1 X108.696 Y126.198 E.00008
G3 X107.543 Y124.674 I.426 J-1.52 E.03333
G1 X107.544 Y109.078 E.25325
G3 X109.078 Y107.544 I1.589 J.055 E.03876
G1 X124.856 Y107.553 E.25621
G3 X126.257 Y109.124 I-.193 J1.582 E.03732
G1 X126.256 Y124.722 E.25328
G3 X124.674 Y126.257 I-1.578 J-.044 E.03961
G1 X109.078 Y126.256 E.25325
G1 X108.76 Y126.208 E.00522
; WIPE_START
G1 F3600
M204 S6000
G1 X108.696 Y126.198 E-.02467
G1 X108.409 Y126.087 E-.11679
G1 X108.147 Y125.921 E-.11811
G1 X107.953 Y125.74 E-.1008
G1 X107.768 Y125.491 E-.1178
G1 X107.658 Y125.271 E-.09361
G1 X107.571 Y124.974 E-.11759
G1 X107.554 Y124.789 E-.07064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 54 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer54 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.896 Y124.723 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.315556
G1 F2682
M204 S6000
G1 X107.884 Y124.664 E.00071
; LINE_WIDTH: 0.274836
G1 X107.869 Y124.558 E.00111
; LINE_WIDTH: 0.224203
G3 X107.852 Y124.233 I3.306 J-.337 E.00269
G1 X107.852 Y109.567 E.12115
; LINE_WIDTH: 0.23871
G1 X107.867 Y109.265 E.00268
; LINE_WIDTH: 0.277466
G3 X107.892 Y109.09 I1.811 J.167 E.00185
; LINE_WIDTH: 0.324057
G3 X107.925 Y108.922 I2.224 J.358 E.00211
G1 X107.933 Y108.895 E.00035
; LINE_WIDTH: 0.37027
G3 X108.022 Y108.677 I2.968 J1.086 E.00334
; LINE_WIDTH: 0.409359
G3 X108.759 Y107.985 I1.26 J.604 E.01636
; LINE_WIDTH: 0.361919
G3 X108.892 Y107.934 I.579 J1.318 E.00197
; LINE_WIDTH: 0.324138
G3 X109.09 Y107.892 I.442 J1.573 E.0025
; LINE_WIDTH: 0.280623
G1 X109.242 Y107.869 E.00162
; LINE_WIDTH: 0.224007
G3 X109.567 Y107.852 I.336 J3.277 E.00269
G1 X124.223 Y107.852 E.12095
G1 X124.535 Y107.867 E.00258
; LINE_WIDTH: 0.277403
G3 X124.71 Y107.892 I-.167 J1.808 E.00184
; LINE_WIDTH: 0.321638
G3 X124.878 Y107.925 I-.326 J2.078 E.0021
; LINE_WIDTH: 0.357269
G1 X125.039 Y107.984 E.00235
; LINE_WIDTH: 0.40845
G3 X125.798 Y108.719 I-.519 J1.294 E.01708
; LINE_WIDTH: 0.366276
G3 X125.865 Y108.892 I-1.666 J.752 E.00261
; LINE_WIDTH: 0.319876
G3 X125.915 Y109.13 I-2.112 J.562 E.00296
; LINE_WIDTH: 0.275676
G1 X125.931 Y109.242 E.00117
; LINE_WIDTH: 0.22449
G3 X125.948 Y109.567 I-3.306 J.337 E.0027
G1 X125.948 Y124.223 E.12124
G1 X125.933 Y124.535 E.00258
; LINE_WIDTH: 0.277407
G3 X125.908 Y124.71 I-1.807 J-.167 E.00184
; LINE_WIDTH: 0.323952
G3 X125.875 Y124.878 I-2.076 J-.325 E.00212
G1 X125.868 Y124.903 E.00031
; LINE_WIDTH: 0.369885
G3 X125.779 Y125.123 I-2.914 J-1.06 E.00337
; LINE_WIDTH: 0.409278
G3 X125.041 Y125.815 I-1.26 J-.603 E.01636
; LINE_WIDTH: 0.357824
G3 X124.908 Y125.866 I-.583 J-1.329 E.00194
G1 X124.878 Y125.874 E.00043
; LINE_WIDTH: 0.315556
G3 X124.664 Y125.916 I-.481 J-1.915 E.00261
; LINE_WIDTH: 0.274836
G1 X124.558 Y125.931 E.00111
; LINE_WIDTH: 0.22449
G3 X124.233 Y125.948 I-.337 J-3.306 E.0027
G1 X109.577 Y125.948 E.12124
G1 X109.265 Y125.933 E.00258
; LINE_WIDTH: 0.277407
G3 X109.09 Y125.908 I.167 J-1.807 E.00184
; LINE_WIDTH: 0.323952
G3 X108.922 Y125.875 I.325 J-2.076 E.00212
G1 X108.897 Y125.868 E.00031
; LINE_WIDTH: 0.369885
G3 X108.677 Y125.779 I1.06 J-2.914 E.00337
; LINE_WIDTH: 0.409278
G3 X107.985 Y125.041 I.603 J-1.26 E.01636
; LINE_WIDTH: 0.357824
G3 X107.934 Y124.908 I1.329 J-.583 E.00194
G1 X107.926 Y124.878 E.00043
; LINE_WIDTH: 0.315556
G1 X107.907 Y124.781 E.00118
; WIPE_START
G1 F15000
G1 X107.884 Y124.664 E-.0453
G1 X107.869 Y124.558 E-.04082
G1 X107.852 Y124.233 E-.12377
G1 X107.852 Y122.785 E-.55012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.736 Y117.925 Z5.8 F42000
G1 X116.03 Y116.03 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2682
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.283 J.873 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.732 Y115.781 E-.1036
G1 X114.882 Y115.529 E-.11154
G1 X114.897 Y115.51 E-.00902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G3 X116.973 Y114.462 I.811 J2.318 E.01458
G3 X117.714 Y114.6 I-.144 J2.823 E.01227
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16125
G1 X116.973 Y114.462 E-.15737
G1 X117.431 Y114.519 E-.17557
G1 X117.714 Y114.6 E-.1116
G1 X117.308 Y114.6 E-.15422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.006 J2.243 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04957
G1 X118.292 Y114.899 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.384 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G3 X119.2 Y117.712 I-2.39 J-.485 E.00553
G1 X119.2 Y116.09 E.02633
G1 X119.246 Y116.231 E.0024
G3 X119.302 Y117.325 I-2.345 J.668 E.01794
; WIPE_START
G1 F3600
M204 S6000
M73 P83 R4
G1 X119.2 Y117.712 E-.1521
G1 X119.2 Y116.112 E-.6079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.935 E.00291
G3 X117.77 Y119.178 I-2.225 J-1.055 E.03039
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.935 E-.06817
G1 X118.899 Y118.288 E-.156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.465 Y119.3 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G3 X116.086 Y119.2 I.435 J-2.405 E.00637
G1 X117.71 Y119.202 E.02636
G3 X116.524 Y119.31 I-.809 J-2.306 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17149
G1 X117.635 Y119.202 E-.58851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.867 J-2.276 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.652 Y118.997 E-.15914
G1 X115.508 Y118.903 E-.06548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2682
M204 S5000
G3 X114.6 Y116.088 I2.378 J.483 E.00553
G1 X114.6 Y117.71 E.02633
G3 X114.498 Y116.475 I2.287 J-.811 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15208
G1 X114.6 Y117.688 E-.60792
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 55/83
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I.842 J.879 P1  F42000
G1 X124.533 Y108.176 Z5.8
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G1 X124.767 Y108.247 E.00397
G3 X125.662 Y109.577 I-.553 J1.338 E.02759
G1 X125.662 Y124.223 E.23781
G3 X124.223 Y125.662 I-1.448 J-.008 E.03667
G1 X109.577 Y125.662 E.23781
G3 X108.138 Y124.223 I.008 J-1.448 E.03667
G1 X108.138 Y109.577 E.23781
G3 X109.577 Y108.138 I1.448 J.008 E.03667
G1 X124.223 Y108.138 E.23781
G3 X124.475 Y108.161 I-.008 J1.448 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.767 Y108.247 E-.11573
G1 X125.018 Y108.381 E-.10808
G1 X125.238 Y108.562 E-.10814
G1 X125.419 Y108.782 E-.1081
G1 X125.553 Y109.032 E-.1081
G1 X125.636 Y109.305 E-.10812
G1 X125.662 Y109.576 E-.10374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.212 Y114.92 Z5.9 F42000
G1 X108.688 Y126.217 Z5.9
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G1 X108.686 Y126.214 E.00007
G3 X107.525 Y124.685 I.436 J-1.536 E.03344
G1 X107.526 Y109.066 E.25362
G3 X109.066 Y107.526 I1.596 J.056 E.03891
G1 X124.868 Y107.535 E.25659
G3 X126.275 Y109.113 I-.194 J1.589 E.03749
G1 X126.274 Y124.734 E.25365
G3 X124.685 Y126.275 I-1.596 J-.056 E.03971
G1 X109.066 Y126.274 E.25362
G1 X108.748 Y126.226 E.00523
; WIPE_START
G1 F3600
M204 S6000
G1 X108.686 Y126.214 E-.02412
G1 X108.395 Y126.105 E-.11795
G1 X108.179 Y125.973 E-.09604
G1 X107.937 Y125.756 E-.12365
G1 X107.751 Y125.507 E-.11811
G1 X107.641 Y125.285 E-.09423
G1 X107.553 Y124.987 E-.11805
G1 X107.537 Y124.809 E-.06785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 55 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer55 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.877 Y124.743 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.311935
G1 F2687
M204 S6000
G1 X107.864 Y124.675 E.00081
; LINE_WIDTH: 0.270994
G1 X107.849 Y124.57 E.00108
; LINE_WIDTH: 0.220316
G3 X107.832 Y124.243 I3.308 J-.338 E.00266
G1 X107.832 Y109.558 E.11898
; LINE_WIDTH: 0.234921
G1 X107.847 Y109.253 E.00265
; LINE_WIDTH: 0.273817
G3 X107.872 Y109.078 I1.805 J.167 E.00182
; LINE_WIDTH: 0.320447
G3 X107.906 Y108.908 I2.235 J.36 E.00211
G1 X107.913 Y108.882 E.00033
; LINE_WIDTH: 0.366681
G3 X108.003 Y108.662 I2.961 J1.082 E.00334
; LINE_WIDTH: 0.405907
G3 X108.746 Y107.966 I1.268 J.608 E.01633
; LINE_WIDTH: 0.358366
G3 X108.878 Y107.915 I.58 J1.319 E.00195
; LINE_WIDTH: 0.320591
G3 X109.078 Y107.872 I.45 J1.603 E.0025
; LINE_WIDTH: 0.276924
G1 X109.23 Y107.849 E.0016
; LINE_WIDTH: 0.220114
G3 X109.558 Y107.832 I.338 J3.313 E.00265
G1 X124.233 Y107.832 E.11878
G1 X124.547 Y107.847 E.00255
; LINE_WIDTH: 0.273738
G3 X124.722 Y107.872 I-.167 J1.803 E.00182
; LINE_WIDTH: 0.320316
G3 X124.892 Y107.906 I-.328 J2.089 E.00212
G1 X124.916 Y107.912 E.00029
; LINE_WIDTH: 0.365998
G3 X125.134 Y108.001 I-1.089 J2.992 E.00331
; LINE_WIDTH: 0.407111
G3 X125.817 Y108.705 I-.596 J1.261 E.01575
; LINE_WIDTH: 0.358933
G3 X125.894 Y108.908 I-1.92 J.846 E.00298
; LINE_WIDTH: 0.31339
G3 X125.935 Y109.119 I-2.92 J.673 E.00256
; LINE_WIDTH: 0.271814
G1 X125.951 Y109.23 E.00115
; LINE_WIDTH: 0.220607
G3 X125.968 Y109.558 I-3.308 J.338 E.00266
G1 X125.968 Y124.233 E.11907
G1 X125.953 Y124.547 E.00255
; LINE_WIDTH: 0.273737
G3 X125.928 Y124.722 I-1.8 J-.166 E.00182
; LINE_WIDTH: 0.320316
G3 X125.894 Y124.892 I-2.089 J-.328 E.00212
G1 X125.888 Y124.916 E.00029
; LINE_WIDTH: 0.365988
G3 X125.799 Y125.134 I-2.989 J-1.088 E.00331
; LINE_WIDTH: 0.405861
G3 X125.055 Y125.834 I-1.27 J-.604 E.01638
; LINE_WIDTH: 0.35435
G3 X124.922 Y125.885 I-.583 J-1.328 E.00193
G1 X124.892 Y125.894 E.00042
; LINE_WIDTH: 0.311935
G3 X124.675 Y125.936 I-.486 J-1.93 E.00262
; LINE_WIDTH: 0.270994
G1 X124.57 Y125.951 E.00108
; LINE_WIDTH: 0.220607
G3 X124.243 Y125.968 I-.338 J-3.308 E.00266
G1 X109.567 Y125.968 E.11907
G1 X109.253 Y125.953 E.00255
; LINE_WIDTH: 0.273737
G3 X109.078 Y125.928 I.166 J-1.8 E.00182
; LINE_WIDTH: 0.320316
G3 X108.908 Y125.894 I.328 J-2.089 E.00212
G1 X108.884 Y125.888 E.00029
; LINE_WIDTH: 0.365988
G3 X108.666 Y125.799 I1.088 J-2.989 E.00331
; LINE_WIDTH: 0.405869
G3 X107.966 Y125.055 I.604 J-1.27 E.01638
; LINE_WIDTH: 0.35437
G3 X107.915 Y124.922 I1.33 J-.585 E.00193
G1 X107.906 Y124.892 E.00042
; LINE_WIDTH: 0.311935
G1 X107.889 Y124.802 E.00109
; WIPE_START
G1 F15000
G1 X107.864 Y124.675 E-.04896
G1 X107.849 Y124.57 E-.04055
G1 X107.832 Y124.243 E-.12453
G1 X107.832 Y122.806 E-.54597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.715 Y117.943 Z5.9 F42000
G1 X116.03 Y116.03 Z5.9
G1 Z5.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2687
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.304 J.895 E.03328
G1 X116.03 Y115.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53544
G1 X114.732 Y115.781 E-.10345
G1 X114.882 Y115.529 E-.11152
G1 X114.898 Y115.509 E-.0096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.092 Y114.598 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G3 X116.975 Y114.462 I.892 J2.853 E.01457
G3 X117.714 Y114.6 I-.243 J3.335 E.01222
G1 X116.152 Y114.598 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16162
G1 X116.975 Y114.462 E-.15752
G1 X117.429 Y114.518 E-.17381
G1 X117.714 Y114.6 E-.11241
G1 X117.307 Y114.599 E-.15466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-.993 J2.23 E.0312
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04963
G1 X118.292 Y114.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.289 Y117.383 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G3 X119.2 Y117.711 I-2.427 J-.485 E.00552
G1 X119.2 Y116.088 E.02635
G1 X119.225 Y116.163 E.00127
G3 X119.3 Y117.324 I-2.363 J.736 E.01908
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15181
G1 X119.2 Y116.111 E-.60819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.178 I-2.281 J-.982 E.03196
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53544
G1 X119.149 Y117.847 E-.03111
G1 X119.02 Y118.108 E-.11065
G1 X118.901 Y118.29 E-.08281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.387 E.00481
G1 X117.708 Y119.2 E.02634
M73 P84 R4
G1 X117.617 Y119.232 E.00157
G3 X116.429 Y119.294 I-.717 J-2.337 E.01951
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13508
G1 X117.708 Y119.2 E-.61634
G1 X117.687 Y119.208 E-.00858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.867 J-2.276 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08524
G1 X115.569 Y118.945 E-.1115
G1 X115.511 Y118.899 E-.02788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2687
M204 S5000
G3 X114.6 Y116.089 I2.385 J.485 E.00552
G1 X114.6 Y117.713 E.02637
G3 X114.498 Y116.475 I2.294 J-.812 E.02039
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15184
G1 X114.6 Y117.689 E-.60816
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 56/83
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.9 I.842 J.878 P1  F42000
G1 X124.543 Y108.154 Z5.9
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G1 X124.782 Y108.226 E.00405
G3 X125.684 Y109.568 I-.557 J1.349 E.02782
G1 X125.684 Y124.232 E.23812
G3 X124.232 Y125.684 I-1.46 J-.008 E.03698
G1 X109.568 Y125.684 E.23812
G3 X108.116 Y124.232 I.008 J-1.46 E.03698
G1 X108.116 Y109.568 E.23812
G3 X109.568 Y108.116 I1.46 J.008 E.03698
G1 X124.232 Y108.116 E.23812
G3 X124.485 Y108.139 I-.008 J1.46 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.782 Y108.226 E-.1175
G1 X125.035 Y108.361 E-.10899
G1 X125.257 Y108.543 E-.10903
G1 X125.439 Y108.765 E-.10902
G1 X125.574 Y109.018 E-.10903
G1 X125.657 Y109.293 E-.10902
G1 X125.682 Y109.548 E-.09743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.235 Y114.893 Z6 F42000
G1 X108.676 Y126.235 Z6
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G1 X108.671 Y126.231 E.0001
G3 X107.507 Y124.696 I.44 J-1.543 E.03356
G1 X107.508 Y109.054 E.25399
G3 X109.054 Y107.508 I1.603 J.057 E.03907
G1 X124.88 Y107.517 E.25698
G3 X126.293 Y109.102 I-.195 J1.596 E.03765
G1 X126.292 Y124.746 E.25402
G3 X124.696 Y126.293 I-1.603 J-.057 E.03988
G1 X109.054 Y126.292 E.25399
G1 X108.735 Y126.244 E.00525
; WIPE_START
G1 F3600
M204 S6000
G1 X108.671 Y126.231 E-.0248
G1 X108.381 Y126.122 E-.1178
G1 X108.119 Y125.956 E-.11773
G1 X107.921 Y125.772 E-.10267
G1 X107.736 Y125.523 E-.11806
G1 X107.623 Y125.299 E-.09532
G1 X107.547 Y125.055 E-.09684
G1 X107.522 Y124.828 E-.08678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 56 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer56 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.859 Y124.763 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30836
G1 F2691
M204 S6000
G1 X107.844 Y124.686 E.00092
; LINE_WIDTH: 0.267154
G1 X107.829 Y124.581 E.00106
; LINE_WIDTH: 0.21643
G3 X107.812 Y124.252 I3.341 J-.34 E.00262
G1 X107.812 Y109.548 E.11681
; LINE_WIDTH: 0.231123
G1 X107.827 Y109.241 E.00263
; LINE_WIDTH: 0.270132
G3 X107.852 Y109.066 I1.81 J.168 E.00179
; LINE_WIDTH: 0.316811
G3 X107.887 Y108.894 I2.286 J.37 E.00211
G1 X107.893 Y108.869 E.00031
; LINE_WIDTH: 0.362825
G3 X107.982 Y108.651 I3.042 J1.113 E.00327
; LINE_WIDTH: 0.40243
G3 X108.732 Y107.946 I1.278 J.609 E.01634
; LINE_WIDTH: 0.354839
G3 X108.864 Y107.895 I.582 J1.324 E.00193
; LINE_WIDTH: 0.317011
G3 X109.066 Y107.852 I.459 J1.637 E.00249
; LINE_WIDTH: 0.273194
G1 X109.219 Y107.829 E.00158
; LINE_WIDTH: 0.216222
G3 X109.548 Y107.812 I.341 J3.345 E.00262
G1 X124.242 Y107.812 E.11661
G1 X124.559 Y107.827 E.00251
; LINE_WIDTH: 0.270041
G3 X124.734 Y107.852 I-.165 J1.787 E.00179
; LINE_WIDTH: 0.316702
G3 X124.906 Y107.886 I-.336 J2.132 E.00212
G1 X124.929 Y107.892 E.00028
; LINE_WIDTH: 0.362468
G3 X125.149 Y107.982 I-1.086 J2.984 E.0033
; LINE_WIDTH: 0.403699
G3 X125.836 Y108.69 I-.6 J1.269 E.01571
; LINE_WIDTH: 0.355518
G3 X125.913 Y108.894 I-1.921 J.848 E.00296
; LINE_WIDTH: 0.309771
G3 X125.955 Y109.108 I-2.89 J.67 E.00257
; LINE_WIDTH: 0.267974
G1 X125.971 Y109.219 E.00112
; LINE_WIDTH: 0.216724
G3 X125.988 Y109.548 I-3.341 J.34 E.00262
G1 X125.988 Y124.242 E.11691
G1 X125.973 Y124.559 E.00252
; LINE_WIDTH: 0.270053
G3 X125.948 Y124.734 I-1.805 J-.167 E.00179
; LINE_WIDTH: 0.316696
G3 X125.914 Y124.906 I-2.136 J-.337 E.00212
G1 X125.908 Y124.929 E.00028
; LINE_WIDTH: 0.362781
G3 X125.817 Y125.152 I-2.915 J-1.059 E.00335
; LINE_WIDTH: 0.402487
G3 X125.069 Y125.854 I-1.277 J-.611 E.01629
; LINE_WIDTH: 0.350843
G3 X124.936 Y125.905 I-.618 J-1.417 E.00191
G1 X124.906 Y125.913 E.00041
; LINE_WIDTH: 0.30836
G3 X124.686 Y125.956 I-.475 J-1.864 E.00262
; LINE_WIDTH: 0.267154
G1 X124.581 Y125.971 E.00106
; LINE_WIDTH: 0.216724
G3 X124.252 Y125.988 I-.34 J-3.341 E.00262
G1 X109.558 Y125.988 E.11691
G1 X109.241 Y125.973 E.00252
; LINE_WIDTH: 0.270053
G3 X109.066 Y125.948 I.167 J-1.805 E.00179
; LINE_WIDTH: 0.316696
G3 X108.894 Y125.914 I.337 J-2.136 E.00212
G1 X108.871 Y125.908 E.00028
; LINE_WIDTH: 0.362781
G3 X108.648 Y125.817 I1.059 J-2.915 E.00335
; LINE_WIDTH: 0.402487
G3 X107.946 Y125.069 I.611 J-1.277 E.01629
; LINE_WIDTH: 0.350843
G3 X107.896 Y124.936 I1.417 J-.618 E.00191
G1 X107.887 Y124.906 E.00041
; LINE_WIDTH: 0.30836
G1 X107.871 Y124.822 E.001
; WIPE_START
G1 F15000
G1 X107.844 Y124.686 E-.05261
G1 X107.829 Y124.581 E-.04025
G1 X107.812 Y124.252 E-.1253
G1 X107.812 Y122.826 E-.54184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.693 Y117.962 Z6 F42000
G1 X116.03 Y116.03 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2691
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.287 J.877 E.03331
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53545
G1 X114.828 Y115.611 E-.17744
G1 X114.904 Y115.513 E-.04712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G3 X116.978 Y114.462 I.81 J2.317 E.01466
G3 X117.714 Y114.6 I-.215 J3.167 E.01218
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16119
G1 X116.978 Y114.462 E-.15933
G1 X117.43 Y114.518 E-.17301
G1 X117.714 Y114.6 E-.11219
G1 X117.308 Y114.6 E-.15428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.006 J2.243 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04954
G1 X118.292 Y114.898 E-.17508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.384 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G3 X119.2 Y117.711 I-2.388 J-.485 E.00553
G1 X119.2 Y116.087 E.02638
G1 X119.217 Y116.136 E.00084
G3 X119.302 Y117.325 I-2.315 J.763 E.01955
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15194
G1 X119.2 Y116.111 E-.60806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00133
G3 X117.77 Y119.178 I-2.279 J-.981 E.03196
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53545
G1 X119.149 Y117.846 E-.03105
G1 X119.006 Y118.131 E-.12108
G1 X118.901 Y118.291 E-.07243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.279 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.455 E.00479
G1 X117.708 Y119.202 E.02632
G3 X116.429 Y119.291 I-.807 J-2.378 E.02104
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13484
G1 X117.708 Y119.202 E-.61602
G1 X117.684 Y119.208 E-.00914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.894 J-2.304 E.03328
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.0853
G1 X115.568 Y118.944 E-.11158
G1 X115.51 Y118.901 E-.02775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.51 Y116.417 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2691
M204 S5000
G3 X114.6 Y116.089 I2.401 J.483 E.00553
G1 X114.6 Y117.71 E.02632
G3 X114.499 Y116.475 I2.311 J-.811 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.1519
G1 X114.6 Y117.689 E-.6081
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 57/83
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6 I.843 J.878 P1  F42000
G1 X124.553 Y108.131 Z6
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X124.796 Y108.205 E.00413
G3 X125.706 Y109.558 I-.562 J1.361 E.02806
G1 X125.706 Y124.242 E.23844
G3 X124.242 Y125.706 I-1.472 J-.008 E.03729
G1 X109.558 Y125.706 E.23844
G3 X108.094 Y124.242 I.008 J-1.472 E.03729
G1 X108.094 Y109.558 E.23844
G3 X109.558 Y108.094 I1.472 J.008 E.03729
G1 X124.242 Y108.094 E.23844
G3 X124.495 Y108.117 I-.008 J1.472 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.796 Y108.205 E-.11927
G1 X125.052 Y108.341 E-.1099
G1 X125.275 Y108.525 E-.10994
G1 X125.459 Y108.749 E-.10994
G1 X125.595 Y109.004 E-.10991
G1 X125.679 Y109.28 E-.10993
G1 X125.703 Y109.519 E-.09112
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.257 Y114.867 Z6.1 F42000
G1 X108.663 Y126.253 Z6.1
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X108.658 Y126.249 E.0001
G3 X107.489 Y124.707 I.443 J-1.549 E.03371
G1 X107.49 Y109.042 E.25436
G3 X109.042 Y107.49 I1.61 J.058 E.03922
G1 X124.892 Y107.499 E.25737
G3 X126.311 Y109.091 I-.196 J1.603 E.03782
G1 X126.31 Y124.758 E.25439
G3 X124.707 Y126.311 I-1.61 J-.058 E.04005
G1 X109.042 Y126.31 E.25436
G1 X108.722 Y126.262 E.00526
; WIPE_START
G1 F3600
M204 S6000
G1 X108.658 Y126.249 E-.0249
G1 X108.367 Y126.139 E-.11826
G1 X108.102 Y125.971 E-.11903
G1 X107.906 Y125.789 E-.10192
G1 X107.718 Y125.536 E-.11947
G1 X107.606 Y125.313 E-.09492
G1 X107.517 Y125.012 E-.11927
G1 X107.502 Y124.849 E-.06222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 57 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer57 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.841 Y124.783 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.304666
G1 F2696
M204 S6000
G1 X107.824 Y124.697 E.00101
; LINE_WIDTH: 0.263324
G1 X107.809 Y124.593 E.00104
; LINE_WIDTH: 0.212553
G3 X107.792 Y124.262 I3.343 J-.341 E.00258
G1 X107.792 Y109.538 E.11463
; LINE_WIDTH: 0.227335
G1 X107.807 Y109.229 E.0026
; LINE_WIDTH: 0.266471
G3 X107.832 Y109.054 I1.802 J.167 E.00177
; LINE_WIDTH: 0.313193
G3 X107.867 Y108.88 I2.309 J.374 E.00211
G1 X107.874 Y108.856 E.00029
; LINE_WIDTH: 0.359249
G3 X107.963 Y108.636 I3.046 J1.114 E.00326
; LINE_WIDTH: 0.398986
G3 X108.718 Y107.927 I1.287 J.613 E.01631
; LINE_WIDTH: 0.351313
G3 X108.851 Y107.876 I.586 J1.332 E.00191
; LINE_WIDTH: 0.313497
G3 X109.054 Y107.832 I.468 J1.676 E.00248
; LINE_WIDTH: 0.269542
G1 X109.207 Y107.809 E.00156
; LINE_WIDTH: 0.212339
G3 X109.538 Y107.792 I.342 J3.347 E.00258
G1 X124.252 Y107.792 E.11443
G1 X124.571 Y107.807 E.00248
; LINE_WIDTH: 0.266439
G3 X124.746 Y107.832 I-.167 J1.802 E.00176
; LINE_WIDTH: 0.311146
G3 X124.92 Y107.867 I-.344 J2.172 E.0021
; LINE_WIDTH: 0.346796
G1 X125.081 Y107.926 E.00227
; LINE_WIDTH: 0.398155
G3 X125.855 Y108.676 I-.529 J1.321 E.01697
; LINE_WIDTH: 0.352052
G3 X125.933 Y108.88 I-1.922 J.849 E.00294
; LINE_WIDTH: 0.306138
G3 X125.975 Y109.098 I-2.884 J.672 E.00257
; LINE_WIDTH: 0.264134
G1 X125.991 Y109.207 E.00109
; LINE_WIDTH: 0.21285
G3 X126.008 Y109.538 I-3.343 J.341 E.00259
G1 X126.008 Y124.252 E.11474
G1 X125.993 Y124.571 E.00249
; LINE_WIDTH: 0.266447
G3 X125.968 Y124.746 I-1.801 J-.167 E.00176
; LINE_WIDTH: 0.313123
G3 X125.933 Y124.92 I-2.171 J-.344 E.00212
G1 X125.927 Y124.942 E.00026
; LINE_WIDTH: 0.359227
G3 X125.836 Y125.167 I-2.915 J-1.059 E.00334
; LINE_WIDTH: 0.399053
G3 X125.082 Y125.873 I-1.285 J-.615 E.01626
; LINE_WIDTH: 0.347396
G3 X124.949 Y125.924 I-.586 J-1.331 E.00189
G1 X124.92 Y125.932 E.0004
; LINE_WIDTH: 0.304666
G3 X124.697 Y125.976 I-.5 J-1.981 E.00262
; LINE_WIDTH: 0.263324
G1 X124.593 Y125.991 E.00104
; LINE_WIDTH: 0.212851
G3 X124.262 Y126.008 I-.341 J-3.343 E.00259
G1 X109.548 Y126.008 E.11474
G1 X109.229 Y125.993 E.00249
; LINE_WIDTH: 0.266447
G3 X109.054 Y125.968 I.167 J-1.801 E.00176
; LINE_WIDTH: 0.313123
G3 X108.88 Y125.933 I.344 J-2.171 E.00212
G1 X108.858 Y125.927 E.00026
; LINE_WIDTH: 0.359227
G3 X108.633 Y125.836 I1.059 J-2.915 E.00334
; LINE_WIDTH: 0.39907
G3 X107.927 Y125.082 I.615 J-1.285 E.01626
; LINE_WIDTH: 0.347405
G3 X107.876 Y124.949 I1.332 J-.587 E.0019
G1 X107.868 Y124.92 E.0004
; LINE_WIDTH: 0.304666
G1 X107.852 Y124.842 E.00092
; WIPE_START
G1 F15000
G1 X107.824 Y124.697 E-.05615
G1 X107.809 Y124.593 E-.03996
G1 X107.792 Y124.262 E-.12607
G1 X107.792 Y122.846 E-.53781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.672 Y117.981 Z6.1 F42000
G1 X116.03 Y116.03 Z6.1
G1 Z5.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2696
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.279 J.869 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.829 Y115.611 E-.1777
G1 X114.899 Y115.511 E-.04646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G3 X116.98 Y114.462 I.81 J2.317 E.0147
G3 X117.714 Y114.6 I-.251 J3.348 E.01214
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16121
G1 X116.98 Y114.462 E-.1602
G1 X117.429 Y114.518 E-.17199
G1 X117.714 Y114.6 E-.11235
G1 X117.308 Y114.6 E-.15425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.008 J2.245 E.0312
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.384 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G3 X119.2 Y117.71 I-2.378 J-.485 E.0055
G1 X119.2 Y116.088 E.02633
G1 X119.227 Y116.167 E.00136
G3 X119.302 Y117.325 I-2.314 J.731 E.01902
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.71 E-.15131
G1 X119.2 Y116.108 E-.60869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X119.177 Y117.77 E.02285
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.178 I-2.251 J-.952 E.03197
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.177 Y117.77 E-.53532
G1 X119.149 Y117.847 E-.03123
G1 X118.918 Y118.272 E-.18382
G1 X118.901 Y118.291 E-.00963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.279 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G3 X116.086 Y119.2 I.529 J-2.455 E.0048
G1 X117.708 Y119.202 E.02633
G3 X116.43 Y119.291 I-.807 J-2.378 E.02103
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.135
G1 X117.708 Y119.202 E-.61611
G1 X117.685 Y119.208 E-.0089
; WIPE_END
M73 P85 R4
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.864 J-2.275 E.03332
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08526
G1 X115.568 Y118.945 E-.11158
G1 X115.511 Y118.899 E-.02778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.326 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2696
M204 S5000
G3 X114.6 Y116.088 I2.425 J.574 E.00401
G1 X114.6 Y117.71 E.02633
G3 X114.518 Y116.384 I2.356 J-.811 E.02183
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.11656
G1 X114.6 Y117.71 E-.61613
G1 X114.581 Y117.641 E-.02731
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 58/83
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.1 I.84 J.88 P1  F42000
G1 X124.563 Y108.109 Z6.1
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X124.811 Y108.184 E.0042
G3 X125.728 Y109.548 I-.567 J1.372 E.02829
G1 X125.728 Y124.252 E.23876
G3 X124.252 Y125.728 I-1.484 J-.008 E.03761
G1 X109.548 Y125.728 E.23876
G3 X108.072 Y124.252 I.008 J-1.484 E.03761
G1 X108.072 Y109.548 E.23876
G3 X109.548 Y108.072 I1.484 J.008 E.03761
G1 X124.252 Y108.072 E.23876
G3 X124.505 Y108.095 I-.008 J1.484 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.811 Y108.184 E-.12106
G1 X125.068 Y108.321 E-.11081
G1 X125.294 Y108.506 E-.11084
G1 X125.479 Y108.732 E-.11084
G1 X125.616 Y108.989 E-.11083
G1 X125.701 Y109.268 E-.11085
G1 X125.723 Y109.49 E-.08477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.279 Y114.84 Z6.2 F42000
G1 X108.65 Y126.271 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X108.645 Y126.267 E.0001
G3 X107.471 Y124.717 I.445 J-1.556 E.03386
G1 X107.472 Y109.03 E.25473
G3 X109.031 Y107.472 I1.618 J.059 E.03937
G1 X124.904 Y107.481 E.25776
G3 X126.329 Y109.081 I-.198 J1.611 E.03799
G1 X126.328 Y124.77 E.25476
G3 X124.717 Y126.329 I-1.618 J-.059 E.04021
G1 X109.03 Y126.328 E.25472
G1 X108.709 Y126.28 E.00528
; WIPE_START
G1 F3600
M204 S6000
G1 X108.645 Y126.267 E-.02497
G1 X108.352 Y126.156 E-.11876
G1 X108.134 Y126.023 E-.09729
G1 X107.889 Y125.804 E-.12457
G1 X107.702 Y125.553 E-.11907
G1 X107.589 Y125.327 E-.0961
G1 X107.5 Y125.025 E-.1197
G1 X107.485 Y124.869 E-.05952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 58 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer58 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.823 Y124.803 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.301055
G1 F2701
M204 S6000
G1 X107.804 Y124.708 E.00111
; LINE_WIDTH: 0.259503
G1 X107.789 Y124.605 E.00101
; LINE_WIDTH: 0.208676
G3 X107.772 Y124.271 I3.378 J-.344 E.00255
G1 X107.772 Y109.529 E.11245
; LINE_WIDTH: 0.223547
G1 X107.787 Y109.217 E.00257
; LINE_WIDTH: 0.262827
G3 X107.812 Y109.042 I1.795 J.166 E.00174
; LINE_WIDTH: 0.309602
G3 X107.848 Y108.866 I2.334 J.379 E.00211
G1 X107.854 Y108.843 E.00028
; LINE_WIDTH: 0.355725
G3 X107.944 Y108.622 I3.044 J1.113 E.00325
; LINE_WIDTH: 0.395549
G3 X108.704 Y107.908 I1.295 J.617 E.01627
; LINE_WIDTH: 0.347755
G3 X108.837 Y107.857 I.587 J1.334 E.00189
; LINE_WIDTH: 0.30991
G3 X109.042 Y107.812 I.476 J1.707 E.00247
; LINE_WIDTH: 0.265819
G1 X109.196 Y107.789 E.00154
; LINE_WIDTH: 0.208447
G3 X109.529 Y107.772 I.344 J3.376 E.00254
G1 X124.262 Y107.772 E.11224
G1 X124.583 Y107.787 E.00245
; LINE_WIDTH: 0.262799
G3 X124.758 Y107.812 I-.169 J1.812 E.00174
; LINE_WIDTH: 0.30954
G3 X124.934 Y107.848 I-.345 J2.174 E.00211
G1 X124.955 Y107.853 E.00025
; LINE_WIDTH: 0.355689
G3 X125.181 Y107.946 I-1.054 J2.906 E.00333
; LINE_WIDTH: 0.396918
G3 X125.874 Y108.662 I-.61 J1.284 E.01558
; LINE_WIDTH: 0.348586
G3 X125.952 Y108.866 I-1.925 J.851 E.00291
; LINE_WIDTH: 0.302512
G3 X125.995 Y109.087 I-2.851 J.668 E.00258
; LINE_WIDTH: 0.260294
G1 X126.011 Y109.195 E.00107
; LINE_WIDTH: 0.208977
G3 X126.028 Y109.529 I-3.378 J.344 E.00255
G1 X126.028 Y124.262 E.11256
G1 X126.013 Y124.583 E.00245
; LINE_WIDTH: 0.262797
G3 X125.988 Y124.758 I-1.792 J-.166 E.00174
; LINE_WIDTH: 0.309542
G3 X125.952 Y124.934 I-2.175 J-.345 E.00211
G1 X125.947 Y124.955 E.00025
; LINE_WIDTH: 0.355716
G3 X125.854 Y125.181 I-2.893 J-1.049 E.00334
; LINE_WIDTH: 0.39562
G3 X125.096 Y125.892 I-1.293 J-.619 E.01622
; LINE_WIDTH: 0.343905
G3 X124.963 Y125.943 I-.588 J-1.334 E.00188
G1 X124.934 Y125.952 E.00039
; LINE_WIDTH: 0.301055
G3 X124.708 Y125.996 I-.509 J-2.013 E.00262
; LINE_WIDTH: 0.259503
G1 X124.605 Y126.011 E.00101
; LINE_WIDTH: 0.208977
G3 X124.271 Y126.029 I-.344 J-3.378 E.00255
G1 X109.538 Y126.028 E.11256
G1 X109.217 Y126.013 E.00245
; LINE_WIDTH: 0.262797
G3 X109.042 Y125.988 I.166 J-1.792 E.00174
; LINE_WIDTH: 0.309539
G3 X108.866 Y125.952 I.344 J-2.173 E.00211
G1 X108.845 Y125.947 E.00025
; LINE_WIDTH: 0.355692
G3 X108.619 Y125.855 I1.055 J-2.908 E.00333
; LINE_WIDTH: 0.395617
G3 X107.908 Y125.096 I.619 J-1.293 E.01622
; LINE_WIDTH: 0.343904
G3 X107.857 Y124.963 I1.334 J-.587 E.00188
G1 X107.848 Y124.934 E.00039
; LINE_WIDTH: 0.301055
G1 X107.834 Y124.862 E.00083
; WIPE_START
G1 F15000
G1 X107.804 Y124.708 E-.05971
G1 X107.789 Y124.605 E-.03972
G1 X107.772 Y124.271 E-.12684
G1 X107.772 Y122.867 E-.53373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.651 Y118 Z6.2 F42000
G1 X116.03 Y116.03 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2701
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.275 J.865 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53548
G1 X114.829 Y115.611 E-.17761
G1 X114.902 Y115.511 E-.04692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G3 X116.983 Y114.462 I.889 J2.835 E.01471
G3 X117.714 Y114.6 I-.255 J3.353 E.0121
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16196
G1 X116.983 Y114.462 E-.16042
G1 X117.429 Y114.518 E-.17098
G1 X117.714 Y114.6 E-.11236
G1 X117.308 Y114.6 E-.15428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00208
G3 X119.179 Y116.03 I-1.063 J2.299 E.03118
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04877
G1 X118.292 Y114.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.289 Y117.383 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G3 X119.2 Y117.712 I-2.441 J-.486 E.00553
G1 X119.2 Y116.09 E.02633
G1 X119.247 Y116.232 E.00242
G3 X119.3 Y117.324 I-2.399 J.665 E.01791
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15205
G1 X119.2 Y116.112 E-.60795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.26 J-.96 E.03198
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53548
G1 X119.149 Y117.846 E-.03097
G1 X118.918 Y118.272 E-.18407
G1 X118.902 Y118.291 E-.00948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.387 E.0048
G1 X117.708 Y119.2 E.02634
G1 X117.617 Y119.232 E.00157
G3 X116.429 Y119.294 I-.716 J-2.337 E.01951
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13503
G1 X117.708 Y119.2 E-.61633
G1 X117.687 Y119.208 E-.00864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.895 J-2.304 E.03328
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.736 Y119.045 E-.12246
G1 X115.568 Y118.944 E-.07453
G1 X115.51 Y118.901 E-.02763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.51 Y116.417 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2701
M204 S5000
G3 X114.6 Y116.088 I2.404 J.483 E.00553
G1 X114.6 Y117.711 E.02634
G3 X114.499 Y116.476 I2.314 J-.811 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15204
G1 X114.6 Y117.688 E-.60796
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 59/83
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I.844 J.877 P1  F42000
G1 X124.573 Y108.086 Z6.2
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G1 X124.825 Y108.163 E.00428
G3 X125.75 Y109.538 I-.571 J1.383 E.02852
G1 X125.75 Y124.262 E.23907
G3 X124.262 Y125.75 I-1.496 J-.008 E.03792
G1 X109.538 Y125.75 E.23907
G3 X108.05 Y124.262 I.008 J-1.496 E.03792
G1 X108.05 Y109.538 E.23907
G3 X109.538 Y108.05 I1.496 J.008 E.03792
G1 X124.262 Y108.05 E.23907
G3 X124.515 Y108.073 I-.008 J1.496 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.825 Y108.163 E-.12285
G1 X125.085 Y108.302 E-.11173
G1 X125.312 Y108.488 E-.11175
G1 X125.498 Y108.715 E-.11174
G1 X125.637 Y108.975 E-.11174
G1 X125.722 Y109.256 E-.11175
G1 X125.743 Y109.462 E-.07845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.301 Y114.814 Z6.3 F42000
G1 X108.637 Y126.288 Z6.3
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G1 X108.632 Y126.285 E.0001
G3 X107.453 Y124.728 I.447 J-1.563 E.034
G1 X107.454 Y109.019 E.25509
G3 X109.019 Y107.454 I1.625 J.06 E.03953
G1 X124.916 Y107.463 E.25814
G3 X126.347 Y109.07 I-.199 J1.618 E.03815
G1 X126.346 Y124.781 E.25512
G3 X124.728 Y126.347 I-1.625 J-.06 E.04039
G1 X109.019 Y126.346 E.25509
G1 X108.696 Y126.297 E.0053
; WIPE_START
G1 F3600
M204 S6000
G1 X108.632 Y126.285 E-.02499
G1 X108.338 Y126.174 E-.11925
G1 X108.118 Y126.04 E-.09771
G1 X107.874 Y125.82 E-.12489
G1 X107.684 Y125.566 E-.12047
G1 X107.571 Y125.341 E-.09571
G1 X107.482 Y125.038 E-.12016
G1 X107.468 Y124.889 E-.05684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 59 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer59 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.805 Y124.823 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297419
G1 F2705
M204 S6000
G1 X107.784 Y124.719 E.0012
; LINE_WIDTH: 0.255654
G1 X107.769 Y124.616 E.00099
; LINE_WIDTH: 0.204789
G3 X107.751 Y124.281 I3.381 J-.345 E.00251
G1 X107.752 Y109.519 E.11026
; LINE_WIDTH: 0.219759
G1 X107.767 Y109.205 E.00254
; LINE_WIDTH: 0.259104
G3 X107.792 Y109.031 I1.799 J.167 E.00171
; LINE_WIDTH: 0.305924
G3 X107.828 Y108.852 I2.376 J.387 E.00211
G1 X107.834 Y108.83 E.00027
; LINE_WIDTH: 0.352161
G3 X107.925 Y108.607 I3.018 J1.101 E.00324
; LINE_WIDTH: 0.39212
G3 X108.691 Y107.888 I1.303 J.621 E.01623
; LINE_WIDTH: 0.344224
G3 X108.824 Y107.837 I.587 J1.334 E.00187
; LINE_WIDTH: 0.306325
G3 X109.031 Y107.792 I.486 J1.747 E.00246
; LINE_WIDTH: 0.262073
G1 X109.184 Y107.77 E.00152
; LINE_WIDTH: 0.204555
G3 X109.519 Y107.752 I.345 J3.383 E.00251
G1 X124.272 Y107.752 E.11005
G1 X124.595 Y107.767 E.00241
; LINE_WIDTH: 0.259093
G3 X124.769 Y107.792 I-.168 J1.803 E.00171
; LINE_WIDTH: 0.304091
G3 X124.948 Y107.828 I-.355 J2.227 E.0021
; LINE_WIDTH: 0.339823
G1 X125.109 Y107.888 E.00222
; LINE_WIDTH: 0.391283
G3 X125.893 Y108.648 I-.536 J1.338 E.01689
; LINE_WIDTH: 0.34516
G3 X125.971 Y108.852 I-1.931 J.854 E.00288
; LINE_WIDTH: 0.298923
G3 X126.015 Y109.076 I-2.831 J.667 E.00258
; LINE_WIDTH: 0.256474
G1 X126.031 Y109.184 E.00105
; LINE_WIDTH: 0.205094
G3 X126.049 Y109.519 I-3.381 J.345 E.00251
G1 X126.048 Y124.272 E.11038
G1 X126.033 Y124.595 E.00242
; LINE_WIDTH: 0.259094
G3 X126.008 Y124.769 I-1.798 J-.167 E.00171
; LINE_WIDTH: 0.306747
G3 X125.972 Y124.948 I-2.218 J-.353 E.00212
G1 X125.963 Y124.977 E.00035
; LINE_WIDTH: 0.353234
G3 X125.873 Y125.196 I-2.172 J-.764 E.00321
; LINE_WIDTH: 0.392212
G3 X125.11 Y125.912 I-1.302 J-.623 E.01618
; LINE_WIDTH: 0.340447
G3 X124.976 Y125.963 I-.591 J-1.342 E.00186
G1 X124.948 Y125.971 E.00039
; LINE_WIDTH: 0.297423
G3 X124.719 Y126.016 I-.515 J-2.036 E.00263
; LINE_WIDTH: 0.255654
G1 X124.616 Y126.031 E.00099
; LINE_WIDTH: 0.205095
G3 X124.281 Y126.049 I-.345 J-3.381 E.00251
G1 X109.528 Y126.048 E.11038
G1 X109.205 Y126.033 E.00242
; LINE_WIDTH: 0.259094
G3 X109.031 Y126.008 I.167 J-1.798 E.00171
; LINE_WIDTH: 0.306747
G3 X108.852 Y125.972 I.353 J-2.218 E.00212
G1 X108.823 Y125.963 E.00035
; LINE_WIDTH: 0.353234
G3 X108.604 Y125.873 I.764 J-2.172 E.00321
; LINE_WIDTH: 0.392207
G3 X107.888 Y125.11 I.623 J-1.302 E.01618
; LINE_WIDTH: 0.340439
G3 X107.837 Y124.976 I1.341 J-.591 E.00186
G1 X107.829 Y124.948 E.00039
; LINE_WIDTH: 0.297419
G1 X107.816 Y124.882 E.00075
; WIPE_START
G1 F15000
G1 X107.784 Y124.719 E-.06326
G1 X107.769 Y124.616 E-.03941
G1 X107.751 Y124.281 E-.12762
G1 X107.752 Y122.887 E-.5297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.63 Y118.018 Z6.3 F42000
G1 X116.03 Y116.03 Z6.3
G1 Z5.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2705
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.288 J.881 E.03329
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53549
G1 X114.828 Y115.611 E-.17739
G1 X114.9 Y115.51 E-.04712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G3 X116.986 Y114.462 I.886 J2.834 E.01471
G3 X117.714 Y114.6 I-.259 J3.356 E.01206
G1 X116.153 Y114.597 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16111
G1 X116.986 Y114.462 E-.16135
G1 X117.43 Y114.518 E-.17007
G1 X117.714 Y114.6 E-.11233
G1 X117.305 Y114.599 E-.15514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.047 J2.282 E.03117
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04953
G1 X118.292 Y114.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y117.383 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G3 X119.2 Y117.711 I-2.462 J-.485 E.00552
G1 X119.2 Y116.087 E.02638
G1 X119.217 Y116.136 E.00084
G3 X119.299 Y117.324 I-2.391 J.762 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.1519
G1 X119.2 Y116.111 E-.6081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.0029
G3 X117.77 Y119.178 I-2.214 J-1.041 E.03042
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06779
G1 X118.899 Y118.288 E-.15638
; WIPE_END
M73 P86 R4
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.388 E.0048
G1 X117.708 Y119.2 E.02634
G1 X117.615 Y119.233 E.00161
G3 X116.429 Y119.294 I-.714 J-2.339 E.01948
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.135
G1 X117.708 Y119.2 E-.61634
G1 X117.687 Y119.208 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.885 J-2.295 E.0333
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.0852
G1 X115.569 Y118.945 E-.11156
G1 X115.51 Y118.901 E-.02786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.51 Y116.417 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2705
M204 S5000
G3 X114.6 Y116.088 I2.403 J.482 E.00553
G1 X114.6 Y117.71 E.02633
G3 X114.499 Y116.475 I2.313 J-.811 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15207
G1 X114.6 Y117.688 E-.60793
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 60/83
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.3 I.845 J.876 P1  F42000
G1 X124.583 Y108.064 Z6.3
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G1 X124.84 Y108.142 E.00436
G3 X125.772 Y109.529 I-.576 J1.394 E.02876
G1 X125.772 Y124.271 E.23939
G3 X124.271 Y125.772 I-1.509 J-.008 E.03823
G1 X109.529 Y125.772 E.23939
G3 X108.028 Y124.271 I.008 J-1.509 E.03823
G1 X108.028 Y109.529 E.23939
G3 X109.529 Y108.028 I1.509 J.008 E.03823
G1 X124.271 Y108.028 E.23939
G3 X124.525 Y108.051 I-.008 J1.509 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.84 Y108.142 E-.12464
G1 X125.101 Y108.282 E-.11262
G1 X125.33 Y108.47 E-.11267
G1 X125.518 Y108.699 E-.11267
G1 X125.658 Y108.96 E-.11263
G1 X125.744 Y109.244 E-.11266
G1 X125.763 Y109.433 E-.07212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.324 Y114.787 Z6.4 F42000
G1 X108.623 Y126.306 Z6.4
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G1 X108.619 Y126.302 E.0001
G3 X107.435 Y124.739 I.449 J-1.57 E.03415
G1 X107.436 Y109.007 E.25546
G3 X109.007 Y107.436 I1.632 J.061 E.03968
G1 X124.928 Y107.445 E.25853
G3 X126.365 Y109.059 I-.2 J1.625 E.03832
G1 X126.364 Y124.793 E.25549
G3 X124.739 Y126.365 I-1.632 J-.061 E.04055
G1 X109.007 Y126.364 E.25546
G1 X108.683 Y126.315 E.00532
; WIPE_START
G1 F3600
M204 S6000
G1 X108.619 Y126.302 E-.02487
G1 X108.324 Y126.191 E-.11987
G1 X108.056 Y126.02 E-.12071
G1 X107.858 Y125.837 E-.10259
G1 X107.668 Y125.583 E-.12026
G1 X107.554 Y125.355 E-.09683
G1 X107.464 Y125.05 E-.12074
G1 X107.451 Y124.909 E-.05415
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 60 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer60 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.786 Y124.843 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.293797
G1 F2710
M204 S6000
G1 X107.764 Y124.73 E.00128
; LINE_WIDTH: 0.251824
G1 X107.749 Y124.628 E.00097
; LINE_WIDTH: 0.200903
G3 X107.731 Y124.29 I3.381 J-.346 E.00247
G1 X107.732 Y109.51 E.10806
; LINE_WIDTH: 0.21598
G1 X107.748 Y109.193 E.00251
; LINE_WIDTH: 0.255488
G3 X107.772 Y109.019 I1.794 J.167 E.00168
; LINE_WIDTH: 0.30234
G3 X107.809 Y108.838 I2.401 J.392 E.00211
G1 X107.814 Y108.817 E.00025
; LINE_WIDTH: 0.348915
G3 X107.908 Y108.589 I2.949 J1.074 E.00329
; LINE_WIDTH: 0.388783
G3 X108.676 Y107.869 I1.31 J.628 E.01613
; LINE_WIDTH: 0.340736
G3 X108.81 Y107.818 I.589 J1.335 E.00186
; LINE_WIDTH: 0.302772
G3 X109.019 Y107.772 I.496 J1.786 E.00245
; LINE_WIDTH: 0.25841
G1 X109.172 Y107.75 E.0015
; LINE_WIDTH: 0.200663
G3 X109.51 Y107.732 I.347 J3.415 E.00247
G1 X124.282 Y107.732 E.10785
G1 X124.607 Y107.748 E.00238
; LINE_WIDTH: 0.255468
G3 X124.781 Y107.772 I-.167 J1.795 E.00168
; LINE_WIDTH: 0.300603
G3 X124.962 Y107.809 I-.357 J2.24 E.0021
; LINE_WIDTH: 0.33631
G1 X125.122 Y107.868 E.00219
; LINE_WIDTH: 0.387854
G3 X125.913 Y108.634 I-.539 J1.347 E.01684
; LINE_WIDTH: 0.3417
G3 X125.991 Y108.838 I-1.927 J.854 E.00286
; LINE_WIDTH: 0.295293
G3 X126.035 Y109.065 I-2.829 J.669 E.00258
; LINE_WIDTH: 0.252634
G1 X126.051 Y109.172 E.00102
; LINE_WIDTH: 0.201212
G3 X126.069 Y109.51 I-3.381 J.346 E.00248
G1 X126.068 Y124.282 E.10819
G1 X126.052 Y124.607 E.00239
; LINE_WIDTH: 0.255462
G3 X126.028 Y124.781 I-1.792 J-.166 E.00168
; LINE_WIDTH: 0.303204
G3 X125.991 Y124.962 I-2.238 J-.357 E.00212
G1 X125.983 Y124.99 E.00034
; LINE_WIDTH: 0.34973
G3 X125.892 Y125.21 I-2.189 J-.771 E.00319
; LINE_WIDTH: 0.388768
G3 X125.124 Y125.931 I-1.31 J-.627 E.01613
; LINE_WIDTH: 0.336974
G3 X124.99 Y125.982 I-.592 J-1.342 E.00185
G1 X124.962 Y125.991 E.00038
; LINE_WIDTH: 0.293797
G3 X124.73 Y126.036 I-.521 J-2.056 E.00263
; LINE_WIDTH: 0.251824
G1 X124.628 Y126.051 E.00097
; LINE_WIDTH: 0.201212
G3 X124.29 Y126.069 I-.346 J-3.381 E.00248
G1 X109.518 Y126.068 E.10819
G1 X109.193 Y126.052 E.00239
; LINE_WIDTH: 0.255462
G3 X109.019 Y126.028 I.166 J-1.792 E.00168
; LINE_WIDTH: 0.303204
G3 X108.838 Y125.991 I.357 J-2.238 E.00212
G1 X108.81 Y125.983 E.00034
; LINE_WIDTH: 0.34973
G3 X108.59 Y125.892 I.771 J-2.189 E.00319
; LINE_WIDTH: 0.388765
G3 X107.869 Y125.124 I.627 J-1.31 E.01613
; LINE_WIDTH: 0.336967
G3 X107.818 Y124.99 I1.341 J-.592 E.00184
G1 X107.809 Y124.962 E.00038
; LINE_WIDTH: 0.293797
G1 X107.798 Y124.902 E.00068
; WIPE_START
G1 F15000
G1 X107.764 Y124.73 E-.06675
G1 X107.749 Y124.628 E-.03914
G1 X107.731 Y124.29 E-.12839
G1 X107.732 Y122.907 E-.52572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.608 Y118.037 Z6.4 F42000
G1 X116.03 Y116.03 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2710
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.311 J.901 E.0333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.808 Y115.645 E-.16276
G1 X114.898 Y115.51 E-.06141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G3 X116.988 Y114.462 I.81 J2.315 E.01482
G3 X117.714 Y114.6 I-.264 J3.365 E.01201
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16117
G1 X116.988 Y114.462 E-.16314
G1 X117.43 Y114.518 E-.16906
G1 X117.714 Y114.6 E-.11234
G1 X117.308 Y114.6 E-.15428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.002 J2.239 E.0312
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04957
G1 X118.292 Y114.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.384 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G3 X119.2 Y117.711 I-2.384 J-.484 E.00553
G1 X119.2 Y116.089 E.02635
G1 X119.229 Y116.175 E.00147
G3 X119.302 Y117.325 I-2.322 J.725 E.01889
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15195
G1 X119.2 Y116.111 E-.60805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.214 J-1.04 E.03044
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06743
G1 X118.899 Y118.288 E-.15674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.407 E.0048
G1 X117.708 Y119.2 E.02634
G1 X117.617 Y119.232 E.00157
G3 X116.429 Y119.293 I-.716 J-2.359 E.0195
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13501
G1 X117.708 Y119.2 E-.61635
G1 X117.687 Y119.208 E-.00864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.885 J-2.296 E.0333
M73 P86 R3
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.787 Y119.071 E-.10068
G1 X115.508 Y118.902 E-.12394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.325 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2710
M204 S5000
G3 X114.6 Y116.089 I2.403 J.574 E.004
G1 X114.6 Y117.711 E.02634
G3 X114.518 Y116.384 I2.334 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11642
G1 X114.6 Y117.711 E-.61639
G1 X114.582 Y117.641 E-.02719
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 61/83
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I.842 J.878 P1  F42000
G1 X124.593 Y108.042 Z6.4
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G1 X124.854 Y108.121 E.00443
G3 X125.794 Y109.519 I-.581 J1.406 E.02899
G1 X125.794 Y124.281 E.23971
G3 X124.281 Y125.794 I-1.521 J-.008 E.03854
G1 X109.519 Y125.794 E.23971
G3 X108.006 Y124.281 I.008 J-1.521 E.03854
G1 X108.006 Y109.519 E.23971
G3 X109.519 Y108.006 I1.521 J.008 E.03854
G1 X124.281 Y108.006 E.23971
G3 X124.534 Y108.028 I-.008 J1.521 E.00414
; WIPE_START
G1 F3600
M204 S6000
G1 X124.854 Y108.121 E-.12644
G1 X125.118 Y108.262 E-.11354
G1 X125.349 Y108.451 E-.11359
G1 X125.538 Y108.682 E-.11354
G1 X125.679 Y108.946 E-.11357
G1 X125.766 Y109.232 E-.11355
G1 X125.783 Y109.404 E-.06577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.346 Y114.761 Z6.5 F42000
G1 X108.611 Y126.324 Z6.5
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G1 X108.607 Y126.323 E.00006
G3 X107.417 Y124.752 I.439 J-1.569 E.03437
G1 X107.418 Y108.995 E.25586
G3 X108.995 Y107.418 I1.639 J.062 E.03984
G1 X124.94 Y107.427 E.25891
G3 X126.383 Y109.048 I-.201 J1.632 E.03848
G1 X126.382 Y124.805 E.25586
G3 X124.752 Y126.383 I-1.629 J-.051 E.04076
G1 X108.995 Y126.382 E.25586
G1 X108.67 Y126.333 E.00535
; WIPE_START
G1 F3600
M204 S6000
G1 X108.607 Y126.323 E-.02418
G1 X108.309 Y126.208 E-.12131
G1 X108.042 Y126.038 E-.12037
G1 X107.842 Y125.853 E-.10345
G1 X107.652 Y125.598 E-.121
G1 X107.537 Y125.369 E-.09712
G1 X107.446 Y125.063 E-.12138
G1 X107.433 Y124.929 E-.05119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 61 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer61 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.768 Y124.863 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290903
G1 F2715
M204 S6000
G1 X107.745 Y124.745 E.00133
; LINE_WIDTH: 0.248634
G1 X107.729 Y124.639 E.00099
; LINE_WIDTH: 0.197016
G3 X107.711 Y124.3 I3.417 J-.348 E.00243
G1 X107.712 Y109.5 E.10586
; LINE_WIDTH: 0.212182
G1 X107.728 Y109.181 E.00248
; LINE_WIDTH: 0.251813
G3 X107.753 Y109.007 I1.801 J.168 E.00165
; LINE_WIDTH: 0.299478
G3 X107.79 Y108.824 I2.418 J.395 E.00211
G1 X107.798 Y108.796 E.00033
; LINE_WIDTH: 0.346312
G3 X107.889 Y108.574 I2.207 J.778 E.00317
; LINE_WIDTH: 0.385338
G3 X108.663 Y107.85 I1.318 J.632 E.01609
; LINE_WIDTH: 0.337193
G3 X108.796 Y107.798 I.588 J1.332 E.00185
; LINE_WIDTH: 0.299152
G3 X109.007 Y107.752 I.504 J1.82 E.00244
; LINE_WIDTH: 0.254647
G1 X109.161 Y107.73 E.00148
; LINE_WIDTH: 0.19677
G3 X109.5 Y107.712 I.35 J3.448 E.00243
G1 X124.291 Y107.712 E.10565
G1 X124.619 Y107.728 E.00234
; LINE_WIDTH: 0.25175
G3 X124.793 Y107.752 I-.165 J1.78 E.00165
; LINE_WIDTH: 0.299598
G3 X124.976 Y107.789 I-.363 J2.273 E.00212
G1 X125.004 Y107.798 E.00033
; LINE_WIDTH: 0.34593
G3 X125.222 Y107.887 I-.806 J2.277 E.00312
; LINE_WIDTH: 0.386583
G3 X125.932 Y108.619 I-.619 J1.31 E.0155
; LINE_WIDTH: 0.338242
G3 X126.01 Y108.824 I-1.933 J.857 E.00283
; LINE_WIDTH: 0.291668
G3 X126.055 Y109.054 I-2.801 J.666 E.00258
; LINE_WIDTH: 0.248794
G1 X126.071 Y109.161 E.001
; LINE_WIDTH: 0.197329
G3 X126.089 Y109.5 I-3.417 J.348 E.00244
G1 X126.088 Y124.291 E.10599
G1 X126.072 Y124.619 E.00235
; LINE_WIDTH: 0.25176
G3 X126.048 Y124.793 I-1.798 J-.168 E.00165
; LINE_WIDTH: 0.299597
G3 X126.011 Y124.976 I-2.278 J-.364 E.00212
G1 X126.002 Y125.004 E.00033
; LINE_WIDTH: 0.345951
G3 X125.913 Y125.222 I-2.281 J-.808 E.00312
; LINE_WIDTH: 0.385276
G3 X125.138 Y125.95 I-1.32 J-.628 E.01614
; LINE_WIDTH: 0.333448
G3 X125.004 Y126.002 I-.588 J-1.331 E.00183
G1 X124.976 Y126.01 E.00037
; LINE_WIDTH: 0.290903
G3 X124.745 Y126.055 I-.514 J-2.009 E.00258
; LINE_WIDTH: 0.248634
G1 X124.639 Y126.071 E.00099
; LINE_WIDTH: 0.197329
G3 X124.3 Y126.089 I-.348 J-3.417 E.00244
G1 X109.509 Y126.088 E.10599
G1 X109.181 Y126.072 E.00235
; LINE_WIDTH: 0.25176
G3 X109.007 Y126.048 I.168 J-1.798 E.00165
; LINE_WIDTH: 0.299599
G3 X108.824 Y126.011 I.363 J-2.273 E.00212
G1 X108.796 Y126.002 E.00033
; LINE_WIDTH: 0.345937
G3 X108.578 Y125.913 I.809 J-2.284 E.00312
; LINE_WIDTH: 0.385272
G3 X107.85 Y125.138 I.628 J-1.32 E.01614
; LINE_WIDTH: 0.333448
G3 X107.798 Y125.004 I1.331 J-.588 E.00183
G1 X107.79 Y124.976 E.00037
; LINE_WIDTH: 0.290903
G1 X107.78 Y124.922 E.0006
; WIPE_START
G1 F15000
G1 X107.745 Y124.745 E-.06873
G1 X107.729 Y124.639 E-.04051
G1 X107.711 Y124.3 E-.12916
G1 X107.712 Y122.927 E-.5216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.587 Y118.056 Z6.5 F42000
G1 X116.03 Y116.03 Z6.5
G1 Z6.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.303 J.896 E.03328
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.732 Y115.781 E-.10371
G1 X114.882 Y115.528 E-.11159
G1 X114.897 Y115.51 E-.00886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G3 X116.991 Y114.462 I.808 J2.315 E.01483
G3 X117.714 Y114.6 I-.268 J3.373 E.01197
G1 X116.153 Y114.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16039
G1 X116.991 Y114.462 E-.16408
G1 X117.429 Y114.518 E-.1681
G1 X117.714 Y114.6 E-.11236
G1 X117.306 Y114.599 E-.15508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.006 J2.243 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04953
G1 X118.292 Y114.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G3 X119.2 Y117.713 I-2.391 J-.483 E.00556
G1 X119.2 Y116.089 E.02637
G1 X119.23 Y116.177 E.00151
G3 X119.302 Y117.325 I-2.329 J.723 E.01885
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.713 E-.15265
G1 X119.2 Y116.115 E-.60735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00291
G3 X117.77 Y119.179 I-2.211 J-1.038 E.03042
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
M73 P87 R3
G1 X119.109 Y117.936 E-.06821
G1 X118.899 Y118.288 E-.15596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.278 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G3 X116.086 Y119.2 I.529 J-2.494 E.0048
G1 X117.709 Y119.202 E.02635
G3 X116.43 Y119.29 I-.808 J-2.418 E.02104
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13499
G1 X117.709 Y119.202 E-.61663
G1 X117.688 Y119.207 E-.00838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.272 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08524
G1 X115.568 Y118.945 E-.11154
G1 X115.511 Y118.899 E-.02785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.326 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2715
M204 S5000
G3 X114.6 Y116.087 I2.433 J.573 E.00404
G1 X114.6 Y117.711 E.02637
G3 X114.518 Y116.385 I2.364 J-.812 E.02184
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.087 E-.11728
G1 X114.6 Y117.711 E-.61708
G1 X114.583 Y117.646 E-.02564
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 62/83
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.5 I.843 J.878 P1  F42000
G1 X124.603 Y108.019 Z6.5
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X124.868 Y108.1 E.00451
G3 X125.816 Y109.509 I-.585 J1.417 E.02922
G1 X125.816 Y124.291 E.24003
G3 X124.291 Y125.816 I-1.533 J-.008 E.03885
G1 X109.509 Y125.816 E.24003
G3 X107.984 Y124.291 I.008 J-1.533 E.03885
G1 X107.984 Y109.509 E.24003
G3 X109.509 Y107.984 I1.533 J.008 E.03885
G1 X124.291 Y107.984 E.24003
G3 X124.544 Y108.006 I-.008 J1.533 E.00414
; WIPE_START
G1 F3600
M204 S6000
G1 X124.868 Y108.1 E-.12826
G1 X125.134 Y108.242 E-.11443
G1 X125.367 Y108.433 E-.1145
G1 X125.558 Y108.666 E-.11446
G1 X125.7 Y108.931 E-.11445
G1 X125.788 Y109.22 E-.11449
G1 X125.803 Y109.375 E-.05941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.368 Y114.734 Z6.6 F42000
G1 X108.597 Y126.342 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X108.594 Y126.34 E.00006
G3 X107.399 Y124.763 I.442 J-1.576 E.03451
G1 X107.4 Y108.984 E.25623
G3 X108.984 Y107.4 I1.647 J.063 E.03999
G1 X124.952 Y107.409 E.2593
G3 X126.401 Y109.037 I-.202 J1.639 E.03865
G1 X126.4 Y124.816 E.25622
G3 X124.763 Y126.401 I-1.636 J-.052 E.04093
G1 X108.984 Y126.4 E.25622
G1 X108.657 Y126.351 E.00537
; WIPE_START
G1 F3600
M204 S6000
G1 X108.594 Y126.34 E-.02412
G1 X108.295 Y126.225 E-.12177
G1 X108.025 Y126.053 E-.12171
G1 X107.826 Y125.869 E-.10298
G1 X107.634 Y125.611 E-.12216
G1 X107.52 Y125.383 E-.09682
G1 X107.428 Y125.076 E-.12181
G1 X107.416 Y124.949 E-.04862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 62 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer62 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.75 Y124.883 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.287324
G1 F2719
M204 S6000
G1 X107.725 Y124.756 E.00141
; LINE_WIDTH: 0.244814
G1 X107.709 Y124.651 E.00096
; LINE_WIDTH: 0.193129
G3 X107.691 Y124.309 I3.454 J-.351 E.00239
G1 X107.692 Y109.491 E.10365
; LINE_WIDTH: 0.208385
G1 X107.708 Y109.169 E.00245
; LINE_WIDTH: 0.248122
G3 X107.733 Y108.995 I1.791 J.167 E.00162
; LINE_WIDTH: 0.295906
G3 X107.77 Y108.81 I2.444 J.4 E.00211
G1 X107.778 Y108.783 E.00032
; LINE_WIDTH: 0.342525
G3 X107.868 Y108.563 I2.3 J.815 E.00311
; LINE_WIDTH: 0.381863
G3 X108.649 Y107.83 I1.328 J.633 E.01609
; LINE_WIDTH: 0.333592
G3 X108.783 Y107.779 I.616 J1.405 E.00183
; LINE_WIDTH: 0.295657
G3 X108.995 Y107.733 I.493 J1.758 E.00243
; LINE_WIDTH: 0.250931
G1 X109.149 Y107.71 E.00145
; LINE_WIDTH: 0.192878
G3 X109.491 Y107.692 I.349 J3.415 E.00239
G1 X124.301 Y107.692 E.10344
G1 X124.631 Y107.708 E.00231
; LINE_WIDTH: 0.248084
G3 X124.805 Y107.733 I-.169 J1.808 E.00162
; LINE_WIDTH: 0.296039
G3 X124.99 Y107.77 I-.371 J2.31 E.00212
G1 X125.017 Y107.778 E.00032
; LINE_WIDTH: 0.342484
G3 X125.237 Y107.868 I-.811 J2.29 E.0031
; LINE_WIDTH: 0.383182
G3 X125.951 Y108.605 I-.623 J1.319 E.01545
; LINE_WIDTH: 0.33484
G3 X126.03 Y108.81 I-1.934 J.859 E.00281
; LINE_WIDTH: 0.288082
G3 X126.075 Y109.043 I-2.803 J.67 E.00258
; LINE_WIDTH: 0.244974
G1 X126.091 Y109.149 E.00098
; LINE_WIDTH: 0.193446
G3 X126.109 Y109.491 I-3.454 J.351 E.0024
G1 X126.108 Y124.301 E.10378
G1 X126.092 Y124.631 E.00231
; LINE_WIDTH: 0.248082
G3 X126.067 Y124.805 I-1.787 J-.166 E.00162
; LINE_WIDTH: 0.296038
G3 X126.03 Y124.99 I-2.306 J-.37 E.00212
G1 X126.022 Y125.017 E.00032
; LINE_WIDTH: 0.342483
G3 X125.932 Y125.237 I-2.29 J-.811 E.0031
; LINE_WIDTH: 0.381863
G3 X125.151 Y125.97 I-1.329 J-.632 E.01609
; LINE_WIDTH: 0.329996
G3 X125.017 Y126.021 I-.583 J-1.318 E.00181
G1 X124.99 Y126.029 E.00036
; LINE_WIDTH: 0.287324
G3 X124.756 Y126.075 I-.522 J-2.038 E.00258
; LINE_WIDTH: 0.244814
G1 X124.651 Y126.091 E.00096
; LINE_WIDTH: 0.193446
G3 X124.309 Y126.109 I-.351 J-3.454 E.0024
G1 X109.499 Y126.108 E.10378
G1 X109.169 Y126.092 E.00231
; LINE_WIDTH: 0.248082
G3 X108.995 Y126.067 I.166 J-1.787 E.00162
; LINE_WIDTH: 0.296038
G3 X108.81 Y126.03 I.37 J-2.306 E.00212
G1 X108.783 Y126.022 E.00032
; LINE_WIDTH: 0.342483
G3 X108.563 Y125.932 I.811 J-2.29 E.0031
; LINE_WIDTH: 0.381863
G3 X107.83 Y125.151 I.632 J-1.329 E.01609
; LINE_WIDTH: 0.329996
G3 X107.779 Y125.017 I1.318 J-.583 E.00181
G1 X107.771 Y124.99 E.00036
; LINE_WIDTH: 0.287324
G1 X107.761 Y124.942 E.00053
; WIPE_START
G1 F15000
G1 X107.725 Y124.756 E-.07212
G1 X107.709 Y124.651 E-.04029
G1 X107.691 Y124.309 E-.12993
G1 X107.691 Y122.947 E-.51766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.566 Y118.074 Z6.6 F42000
G1 X116.03 Y116.03 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2719
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.271 J.864 E.03332
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.829 Y115.611 E-.17777
G1 X114.901 Y115.513 E-.04639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G3 X116.993 Y114.462 I.884 J2.821 E.01484
G3 X117.708 Y114.6 I-.112 J2.51 E.01187
G1 X116.153 Y114.598 E.02526
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16117
G1 X116.993 Y114.462 E-.16428
G1 X117.429 Y114.518 E-.16712
G1 X117.708 Y114.6 E-.11043
G1 X117.295 Y114.599 E-.157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.927 J2.291 E.03275
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53565
G1 X117.802 Y114.633 E-.01285
G1 X118.231 Y114.855 E-.18384
G1 X118.288 Y114.901 E-.02766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.289 Y117.383 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G3 X119.2 Y117.712 I-2.449 J-.486 E.00554
G1 X119.2 Y116.09 E.02634
G1 X119.246 Y116.23 E.0024
G3 X119.3 Y117.324 I-2.406 J.667 E.01793
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15232
G1 X119.2 Y116.113 E-.60768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00133
G3 X117.77 Y119.179 I-2.251 J-.949 E.032
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53553
G1 X119.149 Y117.846 E-.0311
G1 X119.046 Y118.06 E-.09006
G1 X118.9 Y118.29 E-.10332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.404 E.0048
G1 X117.709 Y119.202 E.02635
G3 X116.429 Y119.293 I-.809 J-2.325 E.02108
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13501
G1 X117.709 Y119.202 E-.6166
G1 X117.688 Y119.207 E-.00839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.869 J-2.279 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08516
G1 X115.569 Y118.945 E-.11155
G1 X115.511 Y118.899 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2719
M204 S5000
G3 X114.6 Y116.089 I2.376 J.483 E.00553
G1 X114.6 Y117.71 E.02632
G3 X114.498 Y116.475 I2.285 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15192
G1 X114.6 Y117.689 E-.60808
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 63/83
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.846 J.874 P1  F42000
G1 X124.613 Y107.997 Z6.6
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G1 X124.883 Y108.079 E.00459
G3 X125.838 Y109.499 I-.59 J1.428 E.02946
G1 X125.838 Y124.301 E.24034
G3 X124.301 Y125.838 I-1.545 J-.008 E.03916
G1 X109.499 Y125.838 E.24034
G3 X107.962 Y124.301 I.008 J-1.545 E.03916
G1 X107.962 Y109.499 E.24034
G3 X109.499 Y107.962 I1.545 J.008 E.03916
G1 X124.301 Y107.962 E.24034
G3 X124.554 Y107.984 I-.008 J1.545 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.883 Y108.079 E-.13007
G1 X125.151 Y108.222 E-.11535
G1 X125.385 Y108.415 E-.11539
G1 X125.578 Y108.649 E-.11538
G1 X125.721 Y108.917 E-.11539
G1 X125.809 Y109.208 E-.11537
G1 X125.823 Y109.347 E-.05305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.391 Y114.708 Z6.7 F42000
G1 X108.584 Y126.359 Z6.7
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G1 X108.581 Y126.358 E.00005
G3 X107.38 Y124.774 I.444 J-1.583 E.03466
G1 X107.382 Y108.972 E.25659
G3 X108.972 Y107.382 I1.654 J.064 E.04014
G1 X124.964 Y107.391 E.25969
G3 X126.42 Y109.026 I-.191 J1.635 E.03888
G1 X126.418 Y124.828 E.25659
G3 X124.774 Y126.42 I-1.643 J-.053 E.0411
G1 X108.972 Y126.418 E.25659
G1 X108.643 Y126.368 E.00539
; WIPE_START
G1 F3600
M204 S6000
G1 X108.581 Y126.358 E-.02402
G1 X108.281 Y126.242 E-.12238
G1 X108.009 Y126.069 E-.12222
G1 X107.811 Y125.885 E-.10299
G1 X107.618 Y125.628 E-.12199
G1 X107.502 Y125.398 E-.09806
G1 X107.423 Y125.148 E-.09958
G1 X107.403 Y124.968 E-.06876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 63 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer63 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.732 Y124.903 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.283665
G1 F2724
M204 S6000
G1 X107.705 Y124.767 E.00149
; LINE_WIDTH: 0.240964
G1 X107.689 Y124.663 E.00094
; LINE_WIDTH: 0.189243
G3 X107.671 Y124.319 I3.455 J-.352 E.00235
G1 X107.672 Y109.481 E.10143
; LINE_WIDTH: 0.204596
G1 X107.688 Y109.157 E.00242
; LINE_WIDTH: 0.244472
G3 X107.713 Y108.983 I1.802 J.169 E.0016
; LINE_WIDTH: 0.292355
G3 X107.751 Y108.796 I2.472 J.405 E.00211
G1 X107.759 Y108.769 E.00031
; LINE_WIDTH: 0.339337
G3 X107.851 Y108.545 I2.232 J.788 E.00313
; LINE_WIDTH: 0.378483
G3 X108.635 Y107.811 I1.335 J.64 E.016
; LINE_WIDTH: 0.330048
G3 X108.769 Y107.759 I.618 J1.408 E.00181
; LINE_WIDTH: 0.292074
G3 X108.984 Y107.713 I.502 J1.792 E.00242
; LINE_WIDTH: 0.247218
G1 X109.138 Y107.69 E.00143
; LINE_WIDTH: 0.188986
G3 X109.481 Y107.672 I.353 J3.485 E.00235
G1 X124.311 Y107.672 E.10122
G1 X124.643 Y107.688 E.00227
; LINE_WIDTH: 0.244416
G3 X124.816 Y107.713 I-.165 J1.78 E.00159
; LINE_WIDTH: 0.292483
G3 X125.004 Y107.751 I-.374 J2.329 E.00211
G1 X125.031 Y107.759 E.00031
; LINE_WIDTH: 0.339008
G3 X125.251 Y107.849 I-.818 J2.305 E.00308
; LINE_WIDTH: 0.379847
G3 X125.97 Y108.591 I-.627 J1.327 E.01541
; LINE_WIDTH: 0.3314
G3 X126.049 Y108.796 I-1.942 J.863 E.00279
; LINE_WIDTH: 0.284436
G3 X126.095 Y109.032 I-2.817 J.675 E.00258
; LINE_WIDTH: 0.241124
G1 X126.111 Y109.137 E.00095
; LINE_WIDTH: 0.189564
G3 X126.129 Y109.481 I-3.455 J.352 E.00236
G1 X126.128 Y124.311 E.10157
G1 X126.112 Y124.643 E.00228
; LINE_WIDTH: 0.244423
G3 X126.087 Y124.816 I-1.798 J-.168 E.00159
; LINE_WIDTH: 0.292478
G3 X126.049 Y125.004 I-2.323 J-.373 E.00211
G1 X126.041 Y125.031 E.00031
; LINE_WIDTH: 0.338994
G3 X125.951 Y125.251 I-2.306 J-.818 E.00308
; LINE_WIDTH: 0.37843
G3 X125.165 Y125.989 I-1.337 J-.636 E.01604
; LINE_WIDTH: 0.326443
G3 X125.031 Y126.041 I-.614 J-1.399 E.00179
G1 X125.004 Y126.049 E.00035
; LINE_WIDTH: 0.283665
G3 X124.767 Y126.095 I-.515 J-1.992 E.00258
; LINE_WIDTH: 0.240964
G1 X124.663 Y126.111 E.00094
; LINE_WIDTH: 0.189564
G3 X124.319 Y126.129 I-.352 J-3.455 E.00236
G1 X109.489 Y126.128 E.10157
G1 X109.157 Y126.112 E.00228
; LINE_WIDTH: 0.244423
G3 X108.984 Y126.087 I.168 J-1.798 E.00159
; LINE_WIDTH: 0.292478
G3 X108.796 Y126.049 I.373 J-2.323 E.00211
G1 X108.769 Y126.041 E.00031
; LINE_WIDTH: 0.338989
G3 X108.549 Y125.951 I.815 J-2.298 E.00308
; LINE_WIDTH: 0.378433
G3 X107.811 Y125.165 I.636 J-1.337 E.01604
; LINE_WIDTH: 0.326443
G3 X107.759 Y125.031 I1.399 J-.614 E.00179
G1 X107.751 Y125.004 E.00035
; LINE_WIDTH: 0.283665
G1 X107.743 Y124.962 E.00045
; WIPE_START
G1 F15000
G1 X107.705 Y124.767 E-.07571
G1 X107.689 Y124.663 E-.03996
G1 X107.671 Y124.319 E-.13071
G1 X107.671 Y122.967 E-.51362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.545 Y118.093 Z6.7 F42000
G1 X116.03 Y116.03 Z6.7
G1 Z6.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2724
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.341 J.932 E.03326
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.829 Y115.611 E-.1777
G1 X114.903 Y115.514 E-.04647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G3 X116.996 Y114.462 I.885 J2.816 E.01492
G3 X117.714 Y114.6 I-.276 J3.385 E.01189
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16196
G1 X116.996 Y114.462 E-.16522
G1 X117.43 Y114.518 E-.1662
G1 X117.714 Y114.6 E-.11233
G1 X117.308 Y114.6 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00208
G3 X119.179 Y116.03 I-.992 J2.233 E.03124
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04877
G1 X118.292 Y114.898 E-.17585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.289 Y117.383 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G3 X119.2 Y117.712 I-2.444 J-.484 E.00555
G1 X119.2 Y116.089 E.02636
M73 P88 R3
G1 X119.231 Y116.182 E.00159
G3 X119.3 Y117.324 I-2.386 J.717 E.01875
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15244
G1 X119.2 Y116.114 E-.60756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.317 J-1.017 E.03194
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53555
G1 X119.149 Y117.846 E-.03096
G1 X119.045 Y118.062 E-.09113
G1 X118.901 Y118.29 E-.10236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.371 Y119.281 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G3 X116.086 Y119.2 I.53 J-2.403 E.0048
G1 X117.709 Y119.202 E.02635
G3 X116.429 Y119.293 I-.809 J-2.324 E.02108
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.13501
G1 X117.709 Y119.202 E-.61666
G1 X117.688 Y119.207 E-.00833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.886 J-2.297 E.0333
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08512
G1 X115.569 Y118.945 E-.11159
G1 X115.511 Y118.899 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F2724
M204 S5000
G3 X114.6 Y116.089 I2.376 J.483 E.00553
G1 X114.6 Y117.71 E.02632
G3 X114.498 Y116.475 I2.285 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15191
G1 X114.6 Y117.689 E-.60809
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 64/83
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.7 I.847 J.874 P1  F42000
G1 X124.622 Y107.974 Z6.7
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G1 X124.897 Y108.058 E.00467
G3 X125.86 Y109.49 I-.595 J1.439 E.02969
G1 X125.86 Y124.31 E.24066
G3 X124.31 Y125.86 I-1.557 J-.008 E.03947
G1 X109.49 Y125.86 E.24066
G3 X107.94 Y124.31 I.008 J-1.557 E.03947
G1 X107.94 Y109.49 E.24066
G3 X109.49 Y107.94 I1.557 J.008 E.03947
G1 X124.31 Y107.94 E.24066
G3 X124.564 Y107.962 I-.008 J1.557 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.897 Y108.058 E-.1319
G1 X125.167 Y108.202 E-.11626
G1 X125.404 Y108.396 E-.1163
G1 X125.598 Y108.633 E-.1163
G1 X125.742 Y108.903 E-.11627
G1 X125.831 Y109.196 E-.1163
G1 X125.843 Y109.318 E-.04668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.413 Y114.681 Z6.8 F42000
G1 X108.571 Y126.377 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G1 X108.568 Y126.376 E.00005
G3 X107.362 Y124.785 I.446 J-1.59 E.03481
G1 X107.364 Y108.96 E.25696
G3 X108.96 Y107.364 I1.661 J.065 E.04029
G1 X124.976 Y107.373 E.26008
G3 X126.438 Y109.015 I-.192 J1.642 E.03905
G1 X126.436 Y124.84 E.25696
G3 X124.785 Y126.438 I-1.651 J-.054 E.04126
G1 X108.96 Y126.436 E.25696
G1 X108.63 Y126.386 E.00541
; WIPE_START
G1 F3600
M204 S6000
G1 X108.568 Y126.376 E-.02402
G1 X108.266 Y126.259 E-.12282
G1 X108.042 Y126.123 E-.09971
G1 X107.795 Y125.901 E-.12621
G1 X107.6 Y125.641 E-.12338
G1 X107.485 Y125.412 E-.09766
G1 X107.393 Y125.102 E-.12292
G1 X107.382 Y124.988 E-.04329
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 64 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer64 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.713 Y124.923 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280033
G1 F2728
M204 S6000
G1 X107.685 Y124.777 E.00156
; LINE_WIDTH: 0.23715
G1 X107.669 Y124.674 E.00092
; LINE_WIDTH: 0.185356
G3 X107.651 Y124.329 I3.521 J-.356 E.00231
G1 X107.652 Y109.471 E.09921
; LINE_WIDTH: 0.200808
G1 X107.668 Y109.145 E.00239
; LINE_WIDTH: 0.240833
G3 X107.693 Y108.971 I1.794 J.168 E.00157
; LINE_WIDTH: 0.288815
G3 X107.731 Y108.782 I2.506 J.412 E.0021
G1 X107.739 Y108.755 E.00031
; LINE_WIDTH: 0.33556
G3 X107.83 Y108.534 I2.317 J.823 E.00307
; LINE_WIDTH: 0.374993
G3 X108.621 Y107.791 I1.345 J.641 E.01599
; LINE_WIDTH: 0.326575
G3 X108.756 Y107.74 I.593 J1.34 E.00179
; LINE_WIDTH: 0.288482
G3 X108.972 Y107.693 I.532 J1.929 E.0024
; LINE_WIDTH: 0.243546
G1 X109.126 Y107.67 E.00141
; LINE_WIDTH: 0.185104
G3 X109.471 Y107.652 I.354 J3.483 E.00231
G1 X124.321 Y107.652 E.09901
G1 X124.655 Y107.668 E.00223
; LINE_WIDTH: 0.240795
G3 X124.828 Y107.693 I-.165 J1.773 E.00157
; LINE_WIDTH: 0.288954
G3 X125.018 Y107.731 I-.381 J2.364 E.00211
G1 X125.045 Y107.739 E.00031
; LINE_WIDTH: 0.335519
G3 X125.266 Y107.83 I-.822 J2.315 E.00306
; LINE_WIDTH: 0.376416
G3 X125.989 Y108.576 I-.631 J1.335 E.01536
; LINE_WIDTH: 0.327919
G3 X126.068 Y108.782 I-1.945 J.865 E.00276
; LINE_WIDTH: 0.280818
G3 X126.115 Y109.022 I-2.786 J.671 E.00258
; LINE_WIDTH: 0.2373
G1 X126.131 Y109.126 E.00093
; LINE_WIDTH: 0.185681
G3 X126.149 Y109.471 I-3.521 J.356 E.00232
G1 X126.148 Y124.321 E.09935
G1 X126.132 Y124.655 E.00224
; LINE_WIDTH: 0.240798
G3 X126.107 Y124.828 I-1.79 J-.167 E.00157
; LINE_WIDTH: 0.288953
G3 X126.069 Y125.018 I-2.362 J-.381 E.00211
G1 X126.061 Y125.045 E.00031
; LINE_WIDTH: 0.335522
G3 X125.97 Y125.266 I-2.317 J-.822 E.00306
; LINE_WIDTH: 0.375013
G3 X125.179 Y126.008 I-1.345 J-.64 E.01599
; LINE_WIDTH: 0.323028
G3 X125.044 Y126.06 I-.593 J-1.339 E.00177
G1 X125.018 Y126.068 E.00034
; LINE_WIDTH: 0.280033
G3 X124.777 Y126.115 I-.533 J-2.073 E.00258
; LINE_WIDTH: 0.23715
G1 X124.674 Y126.131 E.00092
; LINE_WIDTH: 0.185681
G3 X124.329 Y126.149 I-.356 J-3.521 E.00232
G1 X109.479 Y126.148 E.09935
G1 X109.145 Y126.132 E.00224
; LINE_WIDTH: 0.240798
G3 X108.972 Y126.107 I.167 J-1.79 E.00157
; LINE_WIDTH: 0.288953
G3 X108.782 Y126.069 I.381 J-2.362 E.00211
G1 X108.755 Y126.061 E.00031
; LINE_WIDTH: 0.335522
G3 X108.534 Y125.97 I.822 J-2.317 E.00306
; LINE_WIDTH: 0.37501
G3 X107.792 Y125.179 I.64 J-1.345 E.01599
; LINE_WIDTH: 0.323028
G3 X107.74 Y125.044 I1.339 J-.593 E.00177
G1 X107.732 Y125.018 E.00034
; LINE_WIDTH: 0.280033
G1 X107.725 Y124.982 E.00038
; WIPE_START
G1 F15000
G1 X107.685 Y124.777 E-.07914
G1 X107.669 Y124.674 E-.0397
G1 X107.651 Y124.329 E-.13147
G1 X107.651 Y122.987 E-.5097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.523 Y118.111 Z6.8 F42000
G1 X116.03 Y116.03 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2728
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.33 J.923 E.03325
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53556
G1 X114.829 Y115.611 E-.17767
G1 X114.904 Y115.513 E-.04677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G3 X116.998 Y114.463 I.807 J2.314 E.01495
G3 X117.714 Y114.6 I-.28 J3.39 E.01185
G1 X116.153 Y114.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.1604
G1 X116.998 Y114.463 E-.16698
G1 X117.43 Y114.518 E-.16522
G1 X117.714 Y114.6 E-.11233
G1 X117.305 Y114.599 E-.15508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-.995 J2.232 E.03121
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G3 X119.2 Y117.711 I-2.386 J-.485 E.00552
G1 X119.2 Y116.09 E.02632
G1 X119.246 Y116.23 E.00239
G3 X119.302 Y117.325 I-2.341 J.669 E.01795
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15189
G1 X119.2 Y116.111 E-.60811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.178 I-2.275 J-1.11 E.03034
G1 X117.77 Y117.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.0683
G1 X118.899 Y118.288 E-.15587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y119.297 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G3 X116.086 Y119.2 I.432 J-2.511 E.00642
G1 X117.707 Y119.203 E.02633
G3 X116.528 Y119.306 I-.807 J-2.417 E.0194
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17273
G1 X117.631 Y119.202 E-.58727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.894 J-2.304 E.03331
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53595
G1 X115.654 Y118.998 E-.15863
G1 X115.512 Y118.901 E-.06541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.53 Y116.323 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2728
M204 S5000
G3 X114.6 Y116.087 I2.364 J.576 E.004
G1 X114.6 Y117.711 E.02636
G3 X114.516 Y116.382 I2.294 J-.812 E.0219
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.087 E-.11637
G1 X114.6 Y117.711 E-.61699
G1 X114.583 Y117.643 E-.02664
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 65/83
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.845 J.876 P1  F42000
G1 X124.632 Y107.952 Z6.8
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G1 X124.912 Y108.037 E.00475
G3 X125.882 Y109.48 I-.599 J1.451 E.02992
G1 X125.882 Y124.32 E.24098
G3 X124.32 Y125.882 I-1.57 J-.008 E.03978
G1 X109.48 Y125.882 E.24098
G3 X107.918 Y124.32 I.008 J-1.57 E.03978
G1 X107.918 Y109.48 E.24098
G3 X109.48 Y107.918 I1.57 J.008 E.03978
G1 X124.32 Y107.918 E.24098
G3 X124.573 Y107.94 I-.008 J1.57 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.912 Y108.037 E-.13374
G1 X125.184 Y108.182 E-.11717
G1 X125.422 Y108.378 E-.11719
G1 X125.618 Y108.616 E-.11721
G1 X125.763 Y108.888 E-.11721
G1 X125.853 Y109.183 E-.11718
G1 X125.863 Y109.289 E-.04031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.435 Y114.654 Z6.9 F42000
G1 X108.558 Y126.395 Z6.9
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G1 X108.555 Y126.394 E.00005
G3 X107.344 Y124.795 I.448 J-1.597 E.03496
G1 X107.346 Y108.948 E.25733
G3 X108.948 Y107.346 I1.669 J.066 E.04045
G1 X124.988 Y107.355 E.26046
G3 X126.456 Y109.005 I-.193 J1.649 E.03921
G1 X126.454 Y124.852 E.25733
G3 X124.795 Y126.456 I-1.658 J-.055 E.04144
G1 X108.948 Y126.455 E.25733
G1 X108.617 Y126.404 E.00544
; WIPE_START
G1 F3600
M204 S6000
G1 X108.555 Y126.394 E-.02388
G1 X108.252 Y126.277 E-.12338
G1 X107.978 Y126.102 E-.12332
G1 X107.779 Y125.917 E-.10334
G1 X107.583 Y125.656 E-.12399
G1 X107.468 Y125.426 E-.09804
G1 X107.375 Y125.115 E-.12334
G1 X107.365 Y125.008 E-.04071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 65 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer65 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.695 Y124.943 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276407
G1 F2733
M204 S6000
G1 X107.665 Y124.788 E.00163
; LINE_WIDTH: 0.233304
G1 X107.649 Y124.686 E.00089
; LINE_WIDTH: 0.18147
G3 X107.631 Y124.338 I3.524 J-.357 E.00227
G1 X107.632 Y109.462 E.09698
; LINE_WIDTH: 0.19703
G1 X107.648 Y109.133 E.00235
; LINE_WIDTH: 0.23713
G3 X107.673 Y108.96 I1.804 J.169 E.00154
; LINE_WIDTH: 0.285218
G3 X107.712 Y108.768 I2.522 J.414 E.0021
G1 X107.72 Y108.742 E.0003
; LINE_WIDTH: 0.332383
G3 X107.813 Y108.516 I2.262 J.801 E.0031
; LINE_WIDTH: 0.371633
G3 X108.607 Y107.772 I1.352 J.648 E.01589
; LINE_WIDTH: 0.323087
G3 X108.742 Y107.72 I.588 J1.326 E.00178
; LINE_WIDTH: 0.284877
G3 X108.96 Y107.673 I.543 J1.973 E.0024
; LINE_WIDTH: 0.239789
G1 X109.114 Y107.65 E.00139
; LINE_WIDTH: 0.181212
G3 X109.462 Y107.632 I.357 J3.522 E.00227
G1 X124.33 Y107.632 E.09678
G1 X124.667 Y107.648 E.00219
; LINE_WIDTH: 0.237095
G3 X124.84 Y107.673 I-.166 J1.783 E.00154
; LINE_WIDTH: 0.28534
G3 X125.032 Y107.712 I-.386 J2.39 E.0021
G1 X125.058 Y107.72 E.0003
; LINE_WIDTH: 0.332051
G3 X125.281 Y107.811 I-.825 J2.324 E.00305
; LINE_WIDTH: 0.372994
G3 X126.008 Y108.562 I-.635 J1.343 E.0153
; LINE_WIDTH: 0.324477
G3 X126.088 Y108.769 I-1.941 J.865 E.00273
; LINE_WIDTH: 0.277182
G3 X126.135 Y109.011 I-2.793 J.675 E.00257
; LINE_WIDTH: 0.233454
G1 X126.151 Y109.114 E.0009
; LINE_WIDTH: 0.181799
G3 X126.169 Y109.462 I-3.524 J.357 E.00227
G1 X126.168 Y124.33 E.09713
G1 X126.152 Y124.667 E.0022
; LINE_WIDTH: 0.237103
G3 X126.127 Y124.84 I-1.802 J-.169 E.00154
; LINE_WIDTH: 0.285339
G3 X126.088 Y125.032 I-2.386 J-.385 E.0021
G1 X126.08 Y125.058 E.0003
; LINE_WIDTH: 0.332038
G3 X125.989 Y125.281 I-2.319 J-.823 E.00304
; LINE_WIDTH: 0.371582
G3 X125.193 Y126.028 I-1.353 J-.644 E.01594
; LINE_WIDTH: 0.31955
G3 X125.058 Y126.08 I-.591 J-1.333 E.00176
G1 X125.031 Y126.087 E.00033
; LINE_WIDTH: 0.276407
G3 X124.788 Y126.135 I-.54 J-2.097 E.00258
; LINE_WIDTH: 0.233304
G1 X124.686 Y126.151 E.00089
; LINE_WIDTH: 0.181799
G3 X124.338 Y126.169 I-.357 J-3.524 E.00227
G1 X109.47 Y126.168 E.09713
G1 X109.133 Y126.152 E.0022
; LINE_WIDTH: 0.237103
G3 X108.96 Y126.127 I.169 J-1.802 E.00154
; LINE_WIDTH: 0.285338
G3 X108.768 Y126.088 I.386 J-2.389 E.0021
G1 X108.742 Y126.08 E.0003
; LINE_WIDTH: 0.332027
G3 X108.519 Y125.989 I.826 J-2.325 E.00304
; LINE_WIDTH: 0.371585
G3 X107.772 Y125.193 I.644 J-1.353 E.01594
; LINE_WIDTH: 0.319561
G3 X107.72 Y125.058 I1.335 J-.592 E.00176
G1 X107.713 Y125.031 E.00033
; LINE_WIDTH: 0.276407
G1 X107.707 Y125.002 E.00032
; WIPE_START
G1 F15000
G1 X107.665 Y124.788 E-.08261
G1 X107.649 Y124.686 E-.03939
G1 X107.631 Y124.338 E-.13225
G1 X107.631 Y123.007 E-.50575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.502 Y118.13 Z6.9 F42000
G1 X116.03 Y116.03 Z6.9
G1 Z6.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2733
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.622 I2.331 J.923 E.03325
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53558
G1 X114.827 Y115.613 E-.17684
G1 X114.904 Y115.513 E-.04758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G3 X117.001 Y114.463 I.807 J2.314 E.01499
G3 X117.714 Y114.6 I-.179 J2.848 E.01182
G1 X116.153 Y114.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16039
G1 X117.001 Y114.463 E-.16791
G1 X117.431 Y114.519 E-.16499
G1 X117.714 Y114.6 E-.11162
G1 X117.305 Y114.599 E-.15508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.89 Y114.67 E.0021
G3 X119.179 Y116.03 I-1.019 J2.257 E.03121
M73 P89 R3
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.89 Y114.67 E-.04908
G1 X118.292 Y114.898 E-.17554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y117.383 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G3 X119.2 Y117.711 I-2.46 J-.485 E.00552
G1 X119.2 Y116.087 E.02637
G1 X119.217 Y116.136 E.00084
G3 X119.299 Y117.324 I-2.389 J.762 E.01952
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15187
G1 X119.2 Y116.111 E-.60813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.178 I-2.274 J-1.109 E.03034
G1 X117.77 Y117.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.06823
G1 X118.899 Y118.288 E-.15594
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.468 Y119.298 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G3 X116.086 Y119.2 I.432 J-2.475 E.00642
G1 X117.707 Y119.203 E.02632
G3 X116.528 Y119.308 I-.807 J-2.379 E.01941
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17268
G1 X117.632 Y119.202 E-.58732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.895 J-2.303 E.03328
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.5356
G1 X115.823 Y119.09 E-.08544
G1 X115.572 Y118.947 E-.11001
G1 X115.511 Y118.9 E-.02896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F2733
M204 S5000
G3 X114.6 Y116.087 I2.39 J.483 E.00556
G1 X114.6 Y117.713 E.0264
G1 X114.6 Y117.713 E.00001
G3 X114.498 Y116.476 I2.299 J-.813 E.02038
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.087 E-.15264
G1 X114.6 Y117.685 E-.60736
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 66/83
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z6.9 I.848 J.873 P1  F42000
G1 X124.642 Y107.93 Z6.9
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G1 X124.926 Y108.016 E.00483
G3 X125.904 Y109.47 I-.604 J1.462 E.03016
G1 X125.904 Y124.33 E.24129
G3 X124.33 Y125.904 I-1.582 J-.008 E.04009
G1 X109.47 Y125.904 E.24129
G3 X107.896 Y124.33 I.008 J-1.582 E.04009
G1 X107.896 Y109.47 E.24129
G3 X109.47 Y107.896 I1.582 J.008 E.04009
G1 X124.33 Y107.896 E.24129
G3 X124.583 Y107.918 I-.008 J1.582 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.926 Y108.016 E-.13559
G1 X125.2 Y108.162 E-.11809
G1 X125.441 Y108.359 E-.11809
G1 X125.638 Y108.6 E-.11813
G1 X125.784 Y108.874 E-.11808
G1 X125.874 Y109.171 E-.11812
G1 X125.883 Y109.26 E-.03391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.457 Y114.628 Z7 F42000
G1 X108.544 Y126.412 Z7
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G1 X108.542 Y126.411 E.00004
G3 X107.326 Y124.806 I.45 J-1.604 E.03511
G1 X107.327 Y108.936 E.25769
G3 X108.936 Y107.327 I1.676 J.067 E.0406
G1 X125 Y107.337 E.26084
G3 X126.474 Y108.994 I-.194 J1.657 E.03938
G1 X126.473 Y124.864 E.25769
G3 X124.806 Y126.474 I-1.665 J-.056 E.04161
G1 X108.936 Y126.473 E.25769
G1 X108.604 Y126.422 E.00546
; WIPE_START
G1 F3600
M204 S6000
G1 X108.542 Y126.411 E-.02374
G1 X108.238 Y126.294 E-.1239
G1 X107.963 Y126.119 E-.124
G1 X107.763 Y125.933 E-.10346
G1 X107.568 Y125.673 E-.12371
G1 X107.45 Y125.44 E-.09916
G1 X107.357 Y125.127 E-.12398
G1 X107.347 Y125.028 E-.03806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 66 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer66 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.677 Y124.963 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.272777
G1 F2738
M204 S6000
G1 X107.645 Y124.799 E.00171
; LINE_WIDTH: 0.229464
G1 X107.629 Y124.697 E.00087
; LINE_WIDTH: 0.177593
G3 X107.611 Y124.348 I3.522 J-.358 E.00223
G1 X107.612 Y109.452 E.09476
; LINE_WIDTH: 0.193232
G1 X107.628 Y109.121 E.00232
; LINE_WIDTH: 0.233469
G3 X107.653 Y108.948 I1.793 J.168 E.00151
; LINE_WIDTH: 0.281674
G3 X107.693 Y108.754 I2.544 J.419 E.0021
G1 X107.7 Y108.728 E.00029
; LINE_WIDTH: 0.328566
G3 X107.792 Y108.505 I2.348 J.836 E.00303
; LINE_WIDTH: 0.368147
G3 X108.593 Y107.753 I1.362 J.649 E.01588
; LINE_WIDTH: 0.319547
G3 X108.728 Y107.701 I.593 J1.339 E.00176
; LINE_WIDTH: 0.281334
G3 X108.948 Y107.653 I.551 J2.005 E.00238
; LINE_WIDTH: 0.236097
G1 X109.103 Y107.63 E.00137
; LINE_WIDTH: 0.17732
G3 X109.452 Y107.612 I.357 J3.518 E.00222
G1 X124.34 Y107.612 E.09454
G1 X124.679 Y107.628 E.00215
; LINE_WIDTH: 0.233445
G3 X124.852 Y107.653 I-.168 J1.793 E.00151
; LINE_WIDTH: 0.281795
G3 X125.046 Y107.692 I-.392 J2.42 E.0021
G1 X125.072 Y107.7 E.00029
; LINE_WIDTH: 0.328538
G3 X125.295 Y107.792 I-.83 J2.336 E.00302
; LINE_WIDTH: 0.369568
G3 X126.027 Y108.548 I-.639 J1.352 E.01525
; LINE_WIDTH: 0.321038
G3 X126.107 Y108.755 I-1.94 J.865 E.00271
; LINE_WIDTH: 0.273564
G3 X126.155 Y109 I-2.776 J.674 E.00257
; LINE_WIDTH: 0.229614
G1 X126.171 Y109.103 E.00088
; LINE_WIDTH: 0.177925
G3 X126.189 Y109.452 I-3.522 J.358 E.00223
G1 X126.188 Y124.34 E.09491
G1 X126.172 Y124.679 E.00216
; LINE_WIDTH: 0.23344
G3 X126.147 Y124.852 I-1.79 J-.168 E.00151
; LINE_WIDTH: 0.281794
G3 X126.108 Y125.046 I-2.415 J-.391 E.0021
G1 X126.1 Y125.072 E.00029
; LINE_WIDTH: 0.328553
G3 X126.008 Y125.295 I-2.339 J-.832 E.00303
; LINE_WIDTH: 0.368151
G3 X125.207 Y126.047 I-1.362 J-.648 E.01588
; LINE_WIDTH: 0.316091
G3 X125.072 Y126.099 I-.59 J-1.329 E.00174
G1 X125.045 Y126.107 E.00033
; LINE_WIDTH: 0.272777
G3 X124.799 Y126.155 I-.548 J-2.128 E.00257
; LINE_WIDTH: 0.229464
G1 X124.697 Y126.171 E.00087
; LINE_WIDTH: 0.177925
G3 X124.348 Y126.189 I-.358 J-3.522 E.00223
G1 X109.46 Y126.188 E.09491
G1 X109.121 Y126.172 E.00216
; LINE_WIDTH: 0.23344
G3 X108.948 Y126.147 I.168 J-1.79 E.00151
; LINE_WIDTH: 0.281794
G3 X108.754 Y126.108 I.391 J-2.415 E.0021
G1 X108.728 Y126.1 E.00029
; LINE_WIDTH: 0.328553
G3 X108.505 Y126.008 I.832 J-2.339 E.00303
; LINE_WIDTH: 0.368134
G3 X107.753 Y125.207 I.648 J-1.362 E.01588
; LINE_WIDTH: 0.316079
G3 X107.701 Y125.072 I1.33 J-.59 E.00174
G1 X107.693 Y125.045 E.00033
; LINE_WIDTH: 0.272777
G1 X107.689 Y125.021 E.00025
; WIPE_START
G1 F15000
G1 X107.645 Y124.799 E-.08613
G1 X107.629 Y124.697 E-.03909
G1 X107.611 Y124.348 E-.13302
G1 X107.611 Y123.027 E-.50176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.481 Y118.149 Z7 F42000
G1 X116.03 Y116.03 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2738
M204 S5000
G1 X114.623 Y116.03 E.02285
G3 X116.03 Y114.622 I2.272 J.865 E.0333
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.623 Y116.03 E-.53532
G1 X114.801 Y115.658 E-.15676
G1 X114.899 Y115.509 E-.06792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.092 Y114.598 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G3 X117.003 Y114.463 I.881 J2.805 E.01502
G3 X117.714 Y114.6 I-.29 J3.409 E.01177
G1 X116.152 Y114.598 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16158
G1 X117.003 Y114.463 E-.16802
G1 X117.429 Y114.518 E-.1633
G1 X117.714 Y114.6 E-.1124
G1 X117.307 Y114.599 E-.15469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.01 J2.247 E.03119
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G3 X119.2 Y117.71 I-2.377 J-.484 E.00551
G1 X119.2 Y116.089 E.02631
G1 X119.234 Y116.189 E.00172
G3 X119.302 Y117.324 I-2.32 J.709 E.01863
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.71 E-.15153
G1 X119.2 Y116.108 E-.60847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G1 X119.177 Y117.77 E.02285
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.179 I-2.264 J-.964 E.03198
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.177 Y117.77 E-.53532
G1 X119.149 Y117.847 E-.03122
G1 X118.993 Y118.153 E-.13053
G1 X118.901 Y118.291 E-.06293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.467 Y119.3 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G3 X116.086 Y119.2 I.434 J-2.433 E.00639
G1 X117.71 Y119.202 E.02636
G3 X116.526 Y119.309 I-.81 J-2.335 E.0195
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17201
G1 X117.634 Y119.201 E-.58799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.893 J-2.301 E.03328
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08508
G1 X115.57 Y118.946 E-.11084
G1 X115.511 Y118.9 E-.0287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2738
M204 S5000
G3 X114.6 Y116.09 I2.379 J.484 E.00551
G1 X114.6 Y117.713 E.02634
G3 X114.498 Y116.476 I2.289 J-.811 E.02038
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.09 E-.15151
G1 X114.6 Y117.692 E-.60849
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 67/83
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.849 J.872 P1  F42000
G1 X124.652 Y107.907 Z7
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G1 X124.941 Y107.995 E.0049
G3 X125.926 Y109.46 I-.609 J1.473 E.03039
G1 X125.926 Y124.34 E.24161
G3 X124.34 Y125.926 I-1.594 J-.008 E.0404
G1 X109.46 Y125.926 E.24161
G3 X107.874 Y124.34 I.008 J-1.594 E.0404
G1 X107.874 Y109.46 E.24161
G3 X109.46 Y107.874 I1.594 J.008 E.0404
G1 X124.34 Y107.874 E.24161
G3 X124.593 Y107.896 I-.008 J1.594 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.941 Y107.995 E-.13744
G1 X125.217 Y108.142 E-.11898
G1 X125.459 Y108.341 E-.11903
G1 X125.658 Y108.583 E-.11902
G1 X125.805 Y108.859 E-.11899
G1 X125.896 Y109.159 E-.11902
G1 X125.903 Y109.231 E-.02752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.479 Y114.601 Z7.1 F42000
G1 X108.531 Y126.43 Z7.1
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G1 X108.529 Y126.429 E.00004
G3 X107.308 Y124.817 I.453 J-1.611 E.03526
G1 X107.309 Y108.924 E.25806
G3 X108.924 Y107.309 I1.683 J.068 E.04075
G1 X125.012 Y107.319 E.26123
G3 X126.492 Y108.983 I-.196 J1.664 E.03954
G1 X126.491 Y124.876 E.25806
G3 X124.817 Y126.492 I-1.673 J-.057 E.04177
G1 X108.924 Y126.491 E.25806
G1 X108.591 Y126.439 E.00548
; WIPE_START
G1 F3600
M204 S6000
G1 X108.529 Y126.429 E-.02376
G1 X108.223 Y126.311 E-.12449
G1 X107.949 Y126.136 E-.12369
G1 X107.747 Y125.95 E-.10443
G1 X107.55 Y125.686 E-.12504
G1 X107.433 Y125.454 E-.09878
G1 X107.352 Y125.2 E-.10121
G1 X107.335 Y125.047 E-.0586
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 67 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer67 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.654 Y124.974 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.26048
G1 F2741
M204 S6000
G1 X107.625 Y124.81 E.00163
; LINE_WIDTH: 0.22562
G1 X107.61 Y124.709 E.00085
; LINE_WIDTH: 0.173717
G3 X107.591 Y124.357 I3.559 J-.36 E.00218
G1 X107.592 Y109.443 E.09252
; LINE_WIDTH: 0.189444
G1 X107.608 Y109.11 E.00228
; LINE_WIDTH: 0.229846
G3 X107.633 Y108.936 I1.789 J.167 E.00149
; LINE_WIDTH: 0.278118
G3 X107.673 Y108.741 I2.587 J.427 E.00209
G1 X107.681 Y108.715 E.00028
; LINE_WIDTH: 0.325424
G3 X107.775 Y108.487 I2.275 J.806 E.00306
; LINE_WIDTH: 0.364763
G3 X108.58 Y107.733 I1.369 J.656 E.01578
; LINE_WIDTH: 0.315997
G3 X108.715 Y107.681 I.593 J1.335 E.00174
; LINE_WIDTH: 0.277738
G3 X108.936 Y107.633 I.561 J2.045 E.00237
; LINE_WIDTH: 0.232384
G1 X109.091 Y107.61 E.00135
; LINE_WIDTH: 0.173438
G3 X109.443 Y107.592 I.36 J3.552 E.00218
G1 X124.35 Y107.592 E.09231
G1 X124.69 Y107.608 E.00211
; LINE_WIDTH: 0.229798
G3 X124.864 Y107.633 I-.167 J1.785 E.00149
; LINE_WIDTH: 0.278239
G3 X125.06 Y107.673 I-.398 J2.452 E.00209
G1 X125.085 Y107.681 E.00028
; LINE_WIDTH: 0.325058
G3 X125.31 Y107.773 I-.838 J2.354 E.003
; LINE_WIDTH: 0.370565
G3 X125.926 Y108.311 I-.691 J1.412 E.01177
; LINE_WIDTH: 0.346014
G3 X126.086 Y108.627 I-1.197 J.807 E.00469
; LINE_WIDTH: 0.302077
G3 X126.126 Y108.741 I-1.142 J.468 E.00139
G1 X126.136 Y108.777 E.00043
; LINE_WIDTH: 0.266486
G3 X126.175 Y108.989 I-2.872 J.647 E.00216
; LINE_WIDTH: 0.225771
G1 X126.19 Y109.091 E.00086
; LINE_WIDTH: 0.174053
G3 X126.209 Y109.443 I-3.559 J.36 E.00219
G1 X126.208 Y124.35 E.09268
G1 X126.192 Y124.69 E.00212
; LINE_WIDTH: 0.229814
G3 X126.167 Y124.864 I-1.786 J-.167 E.00149
; LINE_WIDTH: 0.278234
G3 X126.127 Y125.06 I-2.455 J-.399 E.00209
G1 X126.119 Y125.085 E.00028
; LINE_WIDTH: 0.325052
G3 X126.027 Y125.31 I-2.353 J-.838 E.003
; LINE_WIDTH: 0.36993
G3 X125.438 Y125.959 I-1.431 J-.705 E.01261
; LINE_WIDTH: 0.338015
M73 P89 R2
G3 X125.121 Y126.106 I-1.497 J-2.816 E.0045
; LINE_WIDTH: 0.291382
G3 X124.974 Y126.146 I-.328 J-.908 E.00168
; LINE_WIDTH: 0.26048
G1 X124.81 Y126.176 E.00163
; LINE_WIDTH: 0.22562
G1 X124.709 Y126.19 E.00085
; LINE_WIDTH: 0.174053
G3 X124.357 Y126.209 I-.36 J-3.559 E.00219
G1 X109.45 Y126.208 E.09268
G1 X109.11 Y126.192 E.00212
; LINE_WIDTH: 0.229814
M73 P90 R2
G3 X108.936 Y126.167 I.167 J-1.786 E.00149
; LINE_WIDTH: 0.278234
G3 X108.74 Y126.127 I.399 J-2.455 E.00209
G1 X108.715 Y126.119 E.00028
; LINE_WIDTH: 0.325052
G3 X108.49 Y126.027 I.838 J-2.353 E.003
; LINE_WIDTH: 0.369931
G3 X107.841 Y125.438 I.705 J-1.431 E.01261
; LINE_WIDTH: 0.338017
G3 X107.694 Y125.121 I2.819 J-1.499 E.0045
; LINE_WIDTH: 0.291382
G3 X107.667 Y125.033 I.908 J-.328 E.00102
; WIPE_START
G1 F15000
G1 X107.625 Y124.81 E-.0863
G1 X107.61 Y124.709 E-.03878
G1 X107.591 Y124.357 E-.13379
G1 X107.591 Y123.039 E-.50114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.463 Y118.162 Z7.1 F42000
G1 X116.03 Y116.03 Z7.1
G1 Z6.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2741
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.305 J.898 E.03329
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.829 Y115.611 E-.17773
G1 X114.903 Y115.514 E-.04644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.092 Y114.598 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G3 X117.006 Y114.463 I.88 J2.805 E.01506
G3 X117.714 Y114.6 I-.227 J3.069 E.01173
G1 X116.152 Y114.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16141
G1 X117.006 Y114.463 E-.16903
G1 X117.43 Y114.518 E-.16263
G1 X117.714 Y114.6 E-.11208
G1 X117.306 Y114.599 E-.15487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.006 J2.242 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04963
G1 X118.292 Y114.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G3 X119.2 Y117.712 I-2.388 J-.483 E.00555
G1 X119.2 Y116.089 E.02636
G1 X119.234 Y116.192 E.00176
G3 X119.302 Y117.324 I-2.331 J.708 E.01859
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15259
G1 X119.2 Y116.114 E-.60741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.263 J-.961 E.032
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53561
G1 X119.149 Y117.846 E-.03087
G1 X118.918 Y118.272 E-.18416
G1 X118.902 Y118.291 E-.00936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.337 E.02685
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.238 Y119.316 E-.1623
G1 X116.949 Y119.339 E-.11001
G1 X116.561 Y119.316 E-.14785
G1 X116.086 Y119.2 E-.18565
G1 X116.492 Y119.2 E-.15419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.877 J-2.285 E.03331
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53562
G1 X115.619 Y118.976 E-.17424
G1 X115.51 Y118.901 E-.05014
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.532 Y116.325 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F2741
M204 S5000
G3 X114.6 Y116.089 I2.43 J.576 E.00399
G1 X114.6 Y117.712 E.02636
G3 X114.519 Y116.384 I2.361 J-.812 E.02188
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11611
G1 X114.6 Y117.712 E-.61682
G1 X114.582 Y117.643 E-.02708
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 68/83
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.1 I.847 J.874 P1  F42000
G1 X124.661 Y107.885 Z7.1
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G1 X124.955 Y107.974 E.00499
G3 X125.948 Y109.451 I-.613 J1.484 E.03062
G1 X125.948 Y124.349 E.24193
G3 X124.349 Y125.948 I-1.606 J-.008 E.04072
G1 X109.451 Y125.948 E.24193
G3 X107.852 Y124.349 I.008 J-1.606 E.04072
G1 X107.852 Y109.451 E.24193
G3 X109.451 Y107.852 I1.606 J.008 E.04072
G1 X124.349 Y107.852 E.24193
G3 X124.602 Y107.874 I-.008 J1.606 E.00413
; WIPE_START
G1 F3600
M204 S6000
G1 X124.955 Y107.974 E-.13931
G1 X125.233 Y108.122 E-.11989
G1 X125.477 Y108.323 E-.11991
G1 X125.678 Y108.567 E-.11995
G1 X125.826 Y108.845 E-.11989
G1 X125.918 Y109.147 E-.11994
G1 X125.923 Y109.202 E-.0211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.502 Y114.574 Z7.2 F42000
G1 X108.518 Y126.448 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G1 X108.514 Y126.446 E.00007
G3 X107.29 Y124.828 I.457 J-1.617 E.03538
G1 X107.291 Y108.913 E.25843
G3 X108.913 Y107.291 I1.69 J.069 E.04091
G1 X125.024 Y107.301 E.26162
G3 X126.51 Y108.972 I-.197 J1.671 E.03971
G1 X126.509 Y124.887 E.25843
G3 X124.828 Y126.51 I-1.68 J-.058 E.04195
G1 X108.913 Y126.509 E.25843
G1 X108.578 Y126.457 E.00551
; WIPE_START
G1 F3600
M204 S6000
G1 X108.514 Y126.446 E-.02443
G1 X108.209 Y126.328 E-.12422
G1 X107.934 Y126.153 E-.12418
G1 X107.731 Y125.965 E-.10487
G1 X107.533 Y125.701 E-.12548
G1 X107.416 Y125.468 E-.09912
G1 X107.334 Y125.213 E-.1016
G1 X107.318 Y125.067 E-.0561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 68 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer68 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.634 Y124.987 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.256683
G1 F2746
M204 S6000
G1 X107.604 Y124.821 E.00161
; LINE_WIDTH: 0.221774
G1 X107.59 Y124.721 E.00083
; LINE_WIDTH: 0.16982
G3 X107.571 Y124.367 I3.56 J-.361 E.00214
G1 X107.572 Y109.433 E.09027
; LINE_WIDTH: 0.185646
G1 X107.588 Y109.098 E.00225
; LINE_WIDTH: 0.226147
G3 X107.613 Y108.924 I1.77 J.165 E.00146
; LINE_WIDTH: 0.274552
G3 X107.654 Y108.727 I2.607 J.431 E.00208
G1 X107.661 Y108.701 E.00027
; LINE_WIDTH: 0.321635
G3 X107.755 Y108.475 I2.365 J.842 E.00299
; LINE_WIDTH: 0.361294
G3 X108.566 Y107.714 I1.378 J.657 E.01576
; LINE_WIDTH: 0.312496
G3 X108.701 Y107.662 I.598 J1.348 E.00172
; LINE_WIDTH: 0.274182
G3 X108.925 Y107.613 I.571 J2.085 E.00235
; LINE_WIDTH: 0.228655
G1 X109.08 Y107.59 E.00132
; LINE_WIDTH: 0.169536
G3 X109.433 Y107.572 I.363 J3.591 E.00214
G1 X124.36 Y107.572 E.09005
G1 X124.702 Y107.588 E.00207
; LINE_WIDTH: 0.226116
G3 X124.875 Y107.613 I-.168 J1.791 E.00146
; LINE_WIDTH: 0.272417
G3 X125.073 Y107.654 I-.403 J2.474 E.00207
; LINE_WIDTH: 0.308387
G1 X125.233 Y107.714 E.00199
; LINE_WIDTH: 0.363804
G3 X125.944 Y108.296 I-.648 J1.517 E.01299
; LINE_WIDTH: 0.342505
G3 X126.106 Y108.613 I-1.21 J.815 E.00467
; LINE_WIDTH: 0.298425
G3 X126.146 Y108.727 I-1.143 J.468 E.00136
G1 X126.155 Y108.764 E.00044
; LINE_WIDTH: 0.26275
G3 X126.195 Y108.978 I-2.89 J.651 E.00214
; LINE_WIDTH: 0.221914
G1 X126.21 Y109.08 E.00084
; LINE_WIDTH: 0.17016
G3 X126.229 Y109.433 I-3.56 J.361 E.00215
G1 X126.228 Y124.36 E.09043
G1 X126.212 Y124.702 E.00208
; LINE_WIDTH: 0.226115
G3 X126.187 Y124.875 I-1.768 J-.165 E.00146
; LINE_WIDTH: 0.274663
G3 X126.146 Y125.073 I-2.48 J-.404 E.00209
G1 X126.139 Y125.099 E.00027
; LINE_WIDTH: 0.321917
G3 X126.044 Y125.328 I-2.295 J-.814 E.00303
; LINE_WIDTH: 0.366614
G3 X125.453 Y125.978 I-1.463 J-.736 E.0125
; LINE_WIDTH: 0.334555
G3 X125.135 Y126.126 I-1.517 J-2.855 E.00448
; LINE_WIDTH: 0.287794
G3 X124.987 Y126.166 I-.331 J-.916 E.00167
; LINE_WIDTH: 0.256683
G1 X124.821 Y126.196 E.00161
; LINE_WIDTH: 0.221774
G1 X124.72 Y126.21 E.00083
; LINE_WIDTH: 0.17016
G3 X124.367 Y126.229 I-.361 J-3.56 E.00215
G1 X109.44 Y126.228 E.09043
G1 X109.098 Y126.212 E.00208
; LINE_WIDTH: 0.226115
G3 X108.925 Y126.187 I.165 J-1.768 E.00146
; LINE_WIDTH: 0.274665
G3 X108.727 Y126.146 I.402 J-2.473 E.00209
G1 X108.701 Y126.139 E.00027
; LINE_WIDTH: 0.321917
G3 X108.472 Y126.044 I.814 J-2.295 E.00303
; LINE_WIDTH: 0.366614
G3 X107.822 Y125.453 I.713 J-1.438 E.01251
; LINE_WIDTH: 0.334555
G3 X107.674 Y125.135 I2.855 J-1.517 E.00448
; LINE_WIDTH: 0.287794
G3 X107.647 Y125.045 I.916 J-.331 E.00102
; WIPE_START
G1 F15000
G1 X107.604 Y124.821 E-.08681
G1 X107.59 Y124.721 E-.03848
G1 X107.571 Y124.367 E-.13456
G1 X107.571 Y123.051 E-.50015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.444 Y118.176 Z7.2 F42000
G1 X116.03 Y116.03 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2746
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.29 J.881 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.732 Y115.78 E-.10382
G1 X114.882 Y115.528 E-.11165
G1 X114.897 Y115.51 E-.0087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G3 X117.008 Y114.463 I.81 J2.315 E.01515
G3 X117.714 Y114.6 I-.299 J3.424 E.01169
G1 X116.151 Y114.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16118
G1 X117.008 Y114.463 E-.17081
G1 X117.429 Y114.518 E-.16133
G1 X117.714 Y114.6 E-.11238
G1 X117.308 Y114.6 E-.15429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-.993 J2.23 E.0312
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04957
G1 X118.292 Y114.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G3 X119.2 Y117.712 I-2.392 J-.484 E.00555
G1 X119.2 Y116.09 E.02634
G1 X119.246 Y116.23 E.00239
G3 X119.302 Y117.324 I-2.347 J.669 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15246
G1 X119.2 Y116.113 E-.60754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.286 J-.985 E.03198
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53563
G1 X119.149 Y117.846 E-.03089
G1 X119.039 Y118.073 E-.09608
G1 X118.901 Y118.289 E-.09739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.337 E.02685
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.333 Y119.301 E-.12591
G1 X116.949 Y119.339 E-.14669
G1 X116.525 Y119.31 E-.16149
G1 X116.086 Y119.2 E-.17196
G1 X116.491 Y119.2 E-.15394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.621 Y117.77 I.928 J-2.337 E.03326
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53564
G1 X115.738 Y119.045 E-.12206
G1 X115.509 Y118.903 E-.1023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.325 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2746
M204 S5000
G3 X114.6 Y116.089 I2.39 J.576 E.00399
G1 X114.6 Y117.713 E.02637
G3 X114.517 Y116.384 I2.321 J-.812 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11615
G1 X114.6 Y117.713 E-.61706
G1 X114.581 Y117.645 E-.0268
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 69/83
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I.847 J.874 P1  F42000
G1 X124.671 Y107.862 Z7.2
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G1 X124.969 Y107.953 E.00507
G3 X125.97 Y109.441 I-.618 J1.496 E.03086
G1 X125.97 Y124.359 E.24224
G3 X124.359 Y125.97 I-1.618 J-.008 E.04103
G1 X109.441 Y125.97 E.24224
G3 X107.83 Y124.359 I.008 J-1.618 E.04103
G1 X107.83 Y109.441 E.24224
G3 X109.441 Y107.83 I1.618 J.008 E.04103
G1 X124.359 Y107.83 E.24224
G3 X124.612 Y107.851 I-.008 J1.618 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.969 Y107.953 E-.14118
G1 X125.25 Y108.103 E-.1208
G1 X125.496 Y108.304 E-.12084
G1 X125.697 Y108.55 E-.12084
G1 X125.847 Y108.831 E-.12081
G1 X125.94 Y109.135 E-.12083
G1 X125.943 Y109.173 E-.01469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.524 Y114.548 Z7.3 F42000
G1 X108.505 Y126.466 Z7.3
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G1 X108.503 Y126.465 E.00004
G3 X107.272 Y124.839 I.457 J-1.625 E.03555
G1 X107.273 Y108.901 E.2588
G3 X108.901 Y107.273 I1.698 J.07 E.04106
G1 X125.036 Y107.283 E.26201
G3 X126.528 Y108.961 I-.198 J1.678 E.03987
G1 X126.527 Y124.899 E.2588
G3 X124.839 Y126.528 I-1.687 J-.059 E.04211
G1 X108.901 Y126.527 E.2588
G1 X108.565 Y126.475 E.00553
; WIPE_START
G1 F3600
M204 S6000
M73 P91 R2
G1 X108.503 Y126.465 E-.02374
G1 X108.195 Y126.345 E-.12546
G1 X107.916 Y126.168 E-.12552
G1 X107.715 Y125.981 E-.10424
G1 X107.517 Y125.718 E-.12523
G1 X107.398 Y125.482 E-.10033
G1 X107.303 Y125.166 E-.12559
G1 X107.296 Y125.087 E-.02988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 69 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer69 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.615 Y125.002 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.283518
G1 F2750
M204 S6000
G1 X107.613 Y124.995 E.00007
; LINE_WIDTH: 0.252574
G1 X107.584 Y124.832 E.00156
; LINE_WIDTH: 0.217984
G1 X107.57 Y124.732 E.00081
; LINE_WIDTH: 0.165934
G3 X107.551 Y124.376 I3.558 J-.362 E.0021
G1 X107.552 Y109.424 E.08802
; LINE_WIDTH: 0.181868
G1 X107.569 Y109.086 E.00221
; LINE_WIDTH: 0.2225
G3 X107.593 Y108.913 I1.784 J.167 E.00143
; LINE_WIDTH: 0.271004
G3 X107.634 Y108.713 I2.626 J.435 E.00208
G1 X107.642 Y108.687 E.00027
; LINE_WIDTH: 0.31815
G3 X107.736 Y108.461 I2.378 J.848 E.00297
; LINE_WIDTH: 0.35787
G3 X108.552 Y107.695 I1.387 J.661 E.0157
; LINE_WIDTH: 0.308955
G3 X108.688 Y107.642 I.599 J1.348 E.00171
; LINE_WIDTH: 0.270593
G3 X108.913 Y107.593 I.58 J2.119 E.00234
; LINE_WIDTH: 0.224945
G1 X109.068 Y107.57 E.0013
; LINE_WIDTH: 0.165644
G3 X109.424 Y107.552 I.364 J3.59 E.00209
G1 X124.369 Y107.552 E.0878
G1 X124.714 Y107.569 E.00203
; LINE_WIDTH: 0.222459
G3 X124.887 Y107.593 I-.167 J1.784 E.00143
; LINE_WIDTH: 0.271099
G3 X125.087 Y107.634 I-.411 J2.515 E.00208
G1 X125.113 Y107.642 E.00027
; LINE_WIDTH: 0.318114
G3 X125.339 Y107.735 I-.849 J2.382 E.00296
; LINE_WIDTH: 0.363758
G3 X125.96 Y108.277 I-.699 J1.428 E.01162
; LINE_WIDTH: 0.339249
G3 X126.125 Y108.6 I-1.187 J.809 E.0047
; LINE_WIDTH: 0.294773
G3 X126.165 Y108.713 I-1.138 J.467 E.00134
G1 X126.175 Y108.752 E.00045
; LINE_WIDTH: 0.259035
G3 X126.215 Y108.967 I-2.885 J.651 E.00212
; LINE_WIDTH: 0.218124
G1 X126.23 Y109.068 E.00082
; LINE_WIDTH: 0.166278
G3 X126.249 Y109.424 I-3.558 J.362 E.0021
G1 X126.248 Y124.369 E.08819
G1 X126.231 Y124.714 E.00204
; LINE_WIDTH: 0.22246
G3 X126.207 Y124.887 I-1.781 J-.167 E.00143
; LINE_WIDTH: 0.271098
G3 X126.166 Y125.087 I-2.514 J-.41 E.00208
G1 X126.158 Y125.113 E.00027
; LINE_WIDTH: 0.318114
G3 X126.065 Y125.339 I-2.382 J-.849 E.00296
; LINE_WIDTH: 0.363089
G3 X125.469 Y125.996 I-1.447 J-.713 E.01251
; LINE_WIDTH: 0.330757
G3 X125.145 Y126.146 I-1.527 J-2.871 E.0045
; LINE_WIDTH: 0.283518
G3 X124.995 Y126.187 I-.331 J-.932 E.00166
; LINE_WIDTH: 0.252574
G1 X124.832 Y126.216 E.00156
; LINE_WIDTH: 0.217984
G1 X124.732 Y126.23 E.00081
; LINE_WIDTH: 0.166278
G3 X124.376 Y126.249 I-.362 J-3.558 E.0021
G1 X109.431 Y126.248 E.08819
G1 X109.086 Y126.231 E.00204
; LINE_WIDTH: 0.22246
G3 X108.913 Y126.207 I.167 J-1.781 E.00143
; LINE_WIDTH: 0.271098
G3 X108.713 Y126.166 I.41 J-2.514 E.00208
G1 X108.687 Y126.158 E.00027
; LINE_WIDTH: 0.318114
G3 X108.461 Y126.065 I.849 J-2.382 E.00296
; LINE_WIDTH: 0.363095
G3 X107.804 Y125.469 I.713 J-1.447 E.01251
; LINE_WIDTH: 0.330756
G3 X107.654 Y125.145 I2.881 J-1.531 E.0045
; LINE_WIDTH: 0.283518
G1 X107.631 Y125.06 E.00094
; WIPE_START
G1 F15000
G1 X107.613 Y124.995 E-.02534
G1 X107.584 Y124.832 E-.06301
G1 X107.57 Y124.732 E-.0383
G1 X107.551 Y124.376 E-.13535
G1 X107.551 Y123.066 E-.49801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.425 Y118.192 Z7.3 F42000
G1 X116.03 Y116.03 Z7.3
G1 Z6.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2750
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.622 I2.282 J.875 E.0333
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53565
G1 X114.732 Y115.78 E-.10376
G1 X114.882 Y115.528 E-.11155
G1 X114.898 Y115.51 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.598 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G3 X117.011 Y114.463 I.808 J2.315 E.01516
G3 X117.714 Y114.6 I-.231 J3.055 E.01165
G1 X116.153 Y114.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16046
G1 X117.011 Y114.463 E-.1718
G1 X117.43 Y114.518 E-.16072
G1 X117.714 Y114.6 E-.11201
G1 X117.306 Y114.599 E-.15502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00208
G3 X119.179 Y116.03 I-1.063 J2.299 E.03118
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04878
G1 X118.292 Y114.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G3 X119.2 Y117.712 I-2.387 J-.483 E.00555
G1 X119.2 Y116.089 E.02635
G1 X119.236 Y116.196 E.00183
G3 X119.302 Y117.324 I-2.332 J.703 E.01851
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15244
G1 X119.2 Y116.113 E-.60756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.259 J-.958 E.03199
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53565
G1 X119.149 Y117.846 E-.03089
G1 X119.02 Y118.108 E-.11092
G1 X118.902 Y118.29 E-.08254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.708 Y119.202 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G3 X116.086 Y119.2 I-.808 J-2.379 E.02682
G1 X117.648 Y119.202 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X117.333 Y119.301 E-.12545
G1 X116.951 Y119.339 E-.14612
G1 X116.468 Y119.301 E-.18403
G1 X116.086 Y119.2 E-.15006
G1 X116.492 Y119.201 E-.15434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.897 J-2.305 E.03329
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53566
G1 X115.823 Y119.089 E-.08574
G1 X115.571 Y118.946 E-.11017
G1 X115.51 Y118.903 E-.02843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F2750
M204 S5000
G3 X114.6 Y116.088 I2.386 J.483 E.00555
G1 X114.6 Y117.712 E.02637
G3 X114.498 Y116.476 I2.295 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15239
G1 X114.6 Y117.687 E-.60761
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 70/83
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.3 I.85 J.871 P1  F42000
G1 X124.681 Y107.84 Z7.3
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G1 X124.984 Y107.932 E.00515
G3 X125.992 Y109.431 I-.623 J1.507 E.03109
G1 X125.992 Y124.369 E.24256
G3 X124.369 Y125.992 I-1.631 J-.008 E.04134
G1 X109.431 Y125.992 E.24256
G3 X107.808 Y124.369 I.008 J-1.631 E.04134
G1 X107.808 Y109.431 E.24256
G3 X109.431 Y107.808 I1.631 J.008 E.04134
G1 X124.369 Y107.808 E.24256
G3 X124.622 Y107.829 I-.008 J1.631 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.984 Y107.932 E-.14305
G1 X125.266 Y108.083 E-.12176
G1 X125.514 Y108.286 E-.12172
G1 X125.717 Y108.534 E-.12174
G1 X125.868 Y108.816 E-.12172
G1 X125.961 Y109.123 E-.12175
G1 X125.963 Y109.144 E-.00826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.546 Y114.521 Z7.4 F42000
G1 X108.492 Y126.483 Z7.4
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G1 X108.49 Y126.482 E.00004
G3 X107.254 Y124.85 I.459 J-1.632 E.0357
G1 X107.255 Y108.889 E.25917
G3 X108.889 Y107.255 I1.705 J.071 E.04122
G1 X125.048 Y107.265 E.26239
G3 X126.546 Y108.95 I-.199 J1.685 E.04004
G1 X126.545 Y124.911 E.25917
G3 X124.85 Y126.546 I-1.694 J-.06 E.04228
G1 X108.889 Y126.545 E.25917
G1 X108.552 Y126.493 E.00555
; WIPE_START
G1 F3600
M204 S6000
G1 X108.49 Y126.482 E-.02372
G1 X108.181 Y126.363 E-.12601
G1 X107.951 Y126.222 E-.10226
G1 X107.699 Y125.998 E-.12824
G1 X107.5 Y125.733 E-.12587
G1 X107.381 Y125.496 E-.10062
G1 X107.286 Y125.179 E-.12609
G1 X107.279 Y125.107 E-.02719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 70 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer70 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.597 Y125.022 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279893
G1 F2755
M204 S6000
G1 X107.593 Y125.007 E.00016
; LINE_WIDTH: 0.248761
G1 X107.564 Y124.843 E.00155
; LINE_WIDTH: 0.214134
G1 X107.55 Y124.744 E.00079
; LINE_WIDTH: 0.162047
G3 X107.531 Y124.386 I3.597 J-.365 E.00205
G1 X107.532 Y109.414 E.08576
; LINE_WIDTH: 0.17807
G1 X107.549 Y109.074 E.00217
; LINE_WIDTH: 0.218787
G3 X107.573 Y108.901 I1.791 J.169 E.0014
; LINE_WIDTH: 0.267409
G3 X107.615 Y108.699 I2.65 J.439 E.00207
G1 X107.622 Y108.674 E.00026
; LINE_WIDTH: 0.314994
G3 X107.718 Y108.443 I2.321 J.825 E.003
; LINE_WIDTH: 0.354492
G3 X108.538 Y107.676 I1.393 J.668 E.01559
; LINE_WIDTH: 0.305369
G3 X108.674 Y107.623 I.625 J1.417 E.00169
; LINE_WIDTH: 0.267091
G3 X108.901 Y107.573 I.566 J2.047 E.00232
; LINE_WIDTH: 0.221226
G1 X109.057 Y107.55 E.00128
; LINE_WIDTH: 0.161752
G3 X109.414 Y107.532 I.364 J3.585 E.00205
G1 X124.379 Y107.532 E.08554
G1 X124.726 Y107.549 E.00199
; LINE_WIDTH: 0.21878
G3 X124.899 Y107.573 I-.166 J1.77 E.0014
; LINE_WIDTH: 0.267539
G3 X125.101 Y107.615 I-.415 J2.536 E.00207
G1 X125.126 Y107.622 E.00026
; LINE_WIDTH: 0.314658
G3 X125.354 Y107.717 I-.855 J2.395 E.00295
; LINE_WIDTH: 0.360343
G3 X125.981 Y108.264 I-.705 J1.44 E.01162
; LINE_WIDTH: 0.335527
G3 X126.145 Y108.586 I-1.233 J.83 E.00464
; LINE_WIDTH: 0.291104
G3 X126.184 Y108.699 I-1.136 J.466 E.00131
G1 X126.195 Y108.739 E.00046
; LINE_WIDTH: 0.25529
G3 X126.235 Y108.956 I-2.898 J.655 E.00211
; LINE_WIDTH: 0.214274
G1 X126.25 Y109.056 E.00079
; LINE_WIDTH: 0.162396
G3 X126.269 Y109.414 I-3.597 J.365 E.00206
G1 X126.268 Y124.379 E.08593
G1 X126.251 Y124.726 E.002
; LINE_WIDTH: 0.218793
G3 X126.227 Y124.899 I-1.792 J-.169 E.0014
; LINE_WIDTH: 0.267533
G3 X126.185 Y125.101 I-2.539 J-.415 E.00207
G1 X126.178 Y125.126 E.00026
; LINE_WIDTH: 0.31464
G3 X126.084 Y125.354 I-2.397 J-.856 E.00294
; LINE_WIDTH: 0.359691
G3 X125.484 Y126.015 I-1.482 J-.741 E.01245
; LINE_WIDTH: 0.327307
G3 X125.158 Y126.166 I-1.558 J-2.936 E.00448
; LINE_WIDTH: 0.279901
G3 X125.007 Y126.207 I-.333 J-.937 E.00165
; LINE_WIDTH: 0.248751
G1 X124.843 Y126.236 E.00155
; LINE_WIDTH: 0.214134
G1 X124.744 Y126.25 E.00079
; LINE_WIDTH: 0.162396
G3 X124.386 Y126.269 I-.365 J-3.597 E.00206
G1 X109.421 Y126.268 E.08593
G1 X109.074 Y126.251 E.002
; LINE_WIDTH: 0.218793
G3 X108.901 Y126.227 I.169 J-1.792 E.0014
; LINE_WIDTH: 0.267533
G3 X108.699 Y126.185 I.415 J-2.539 E.00207
G1 X108.674 Y126.178 E.00026
; LINE_WIDTH: 0.314656
G3 X108.446 Y126.083 I.856 J-2.397 E.00295
; LINE_WIDTH: 0.359681
G3 X107.785 Y125.484 I.741 J-1.482 E.01245
; LINE_WIDTH: 0.327282
G3 X107.634 Y125.158 I2.916 J-1.549 E.00448
; LINE_WIDTH: 0.279893
G1 X107.613 Y125.08 E.00086
; WIPE_START
G1 F15000
G1 X107.593 Y125.007 E-.02858
G1 X107.564 Y124.843 E-.06349
G1 X107.55 Y124.744 E-.038
G1 X107.531 Y124.386 E-.13611
G1 X107.531 Y123.086 E-.49382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.404 Y118.211 Z7.4 F42000
G1 X116.03 Y116.03 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2755
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.319 J.91 E.03328
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53567
G1 X114.795 Y115.667 E-.15307
G1 X114.898 Y115.51 E-.07127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G3 X117.013 Y114.463 I.81 J2.316 E.01524
G3 X117.714 Y114.6 I-.232 J3.046 E.01161
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16127
G1 X117.013 Y114.463 E-.17271
G1 X117.43 Y114.518 E-.15984
G1 X117.714 Y114.6 E-.11199
G1 X117.308 Y114.6 E-.1542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.024 J2.259 E.03118
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04953
G1 X118.292 Y114.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G3 X119.2 Y117.712 I-2.39 J-.484 E.00555
G1 X119.2 Y116.09 E.02633
G1 X119.246 Y116.23 E.00238
G3 X119.302 Y117.324 I-2.345 J.669 E.01795
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15239
G1 X119.2 Y116.113 E-.60761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.318 J-1.018 E.03194
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53567
G1 X119.149 Y117.846 E-.03097
G1 X118.971 Y118.189 E-.14681
G1 X118.903 Y118.291 E-.04655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.379 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.241 Y119.316 E-.16119
G1 X116.849 Y119.339 E-.14889
G1 X116.468 Y119.301 E-.14578
G1 X116.086 Y119.2 E-.15005
G1 X116.492 Y119.2 E-.15409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.874 J-2.282 E.03331
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53567
G1 X115.823 Y119.089 E-.08554
G1 X115.572 Y118.947 E-.10997
G1 X115.511 Y118.902 E-.02882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.532 Y116.324 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2755
M204 S5000
G3 X114.6 Y116.088 I2.431 J.576 E.00399
G1 X114.6 Y117.712 E.02637
G3 X114.519 Y116.383 I2.363 J-.812 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.11609
G1 X114.6 Y117.712 E-.61703
G1 X114.582 Y117.643 E-.02689
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 71/83
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I.848 J.872 P1  F42000
G1 X124.686 Y107.817 Z7.4
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X124.689 Y107.818 E.00005
G3 X126.014 Y109.421 I-.319 J1.612 E.03657
G1 X126.014 Y124.379 E.24288
G3 X124.379 Y126.014 I-1.643 J-.008 E.04165
G1 X109.421 Y126.014 E.24288
G3 X107.786 Y124.379 I.008 J-1.643 E.04165
G1 X107.786 Y109.421 E.24288
G3 X109.421 Y107.786 I1.643 J.008 E.04165
G1 X124.379 Y107.786 E.24288
G1 X124.627 Y107.811 E.00405
; WIPE_START
G1 F3600
M204 S6000
G1 X124.689 Y107.818 E-.02398
G1 X124.998 Y107.911 E-.12263
M73 P92 R2
G1 X125.283 Y108.063 E-.12263
G1 X125.532 Y108.268 E-.12266
G1 X125.737 Y108.517 E-.12265
G1 X125.889 Y108.802 E-.12266
G1 X125.983 Y109.111 E-.12263
G1 X125.983 Y109.111 E-.00018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.569 Y114.49 Z7.5 F42000
G1 X108.479 Y126.501 Z7.5
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X108.477 Y126.5 E.00005
G3 X107.236 Y124.86 I.462 J-1.639 E.03585
G1 X107.237 Y108.877 E.25954
G3 X108.877 Y107.237 I1.712 J.072 E.04136
G1 X125.06 Y107.247 E.26278
G3 X126.564 Y108.94 I-.2 J1.692 E.0402
G1 X126.563 Y124.923 E.25953
G3 X124.86 Y126.564 I-1.702 J-.061 E.04245
G1 X108.877 Y126.563 E.25953
G1 X108.539 Y126.51 E.00556
; WIPE_START
G1 F3600
M204 S6000
G1 X108.477 Y126.5 E-.02384
G1 X108.166 Y126.38 E-.12661
G1 X107.936 Y126.239 E-.10254
G1 X107.684 Y126.014 E-.12857
G1 X107.483 Y125.746 E-.12706
G1 X107.364 Y125.511 E-.10036
G1 X107.268 Y125.191 E-.12671
G1 X107.262 Y125.128 E-.02431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 71 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer71 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.581 Y125.049 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274021
G1 F2760
M204 S6000
G1 X107.574 Y125.02 E.00031
; LINE_WIDTH: 0.245074
G1 X107.544 Y124.854 E.00154
; LINE_WIDTH: 0.210313
G1 X107.53 Y124.755 E.00076
; LINE_WIDTH: 0.158171
G3 X107.511 Y124.396 I3.636 J-.367 E.00201
G1 X107.512 Y109.405 E.0835
; LINE_WIDTH: 0.174281
G1 X107.529 Y109.062 E.00214
; LINE_WIDTH: 0.215173
G3 X107.554 Y108.889 I1.787 J.168 E.00138
; LINE_WIDTH: 0.263887
G3 X107.596 Y108.685 I2.663 J.441 E.00206
G1 X107.603 Y108.66 E.00025
; LINE_WIDTH: 0.311186
G3 X107.698 Y108.431 I2.406 J.859 E.00293
; LINE_WIDTH: 0.350992
G3 X108.524 Y107.656 I1.404 J.669 E.01557
; LINE_WIDTH: 0.301882
G3 X108.661 Y107.603 I.6 J1.35 E.00167
; LINE_WIDTH: 0.263475
G3 X108.889 Y107.554 I.602 J2.207 E.00231
; LINE_WIDTH: 0.217566
G1 X109.045 Y107.53 E.00126
; LINE_WIDTH: 0.15787
G3 X109.405 Y107.512 I.367 J3.625 E.002
G1 X124.389 Y107.512 E.08328
G1 X124.738 Y107.529 E.00194
; LINE_WIDTH: 0.21516
G3 X124.911 Y107.554 I-.168 J1.787 E.00138
; LINE_WIDTH: 0.263988
G3 X125.115 Y107.596 I-.422 J2.569 E.00206
G1 X125.14 Y107.603 E.00025
; LINE_WIDTH: 0.311156
G3 X125.369 Y107.698 I-.86 J2.408 E.00292
; LINE_WIDTH: 0.356936
G3 X125.999 Y108.248 I-.71 J1.449 E.01157
; LINE_WIDTH: 0.332088
G3 X126.164 Y108.573 I-1.243 J.837 E.00462
; LINE_WIDTH: 0.287465
G3 X126.204 Y108.685 I-1.133 J.465 E.00129
G1 X126.215 Y108.727 E.00047
; LINE_WIDTH: 0.251533
G3 X126.256 Y108.946 I-2.905 J.657 E.00209
; LINE_WIDTH: 0.210443
G1 X126.27 Y109.045 E.00077
; LINE_WIDTH: 0.158523
G3 X126.289 Y109.404 I-3.636 J.367 E.00201
G1 X126.288 Y124.389 E.08368
G1 X126.271 Y124.738 E.00195
; LINE_WIDTH: 0.21517
G3 X126.246 Y124.911 I-1.787 J-.168 E.00138
; LINE_WIDTH: 0.263986
G3 X126.204 Y125.115 I-2.581 J-.424 E.00206
G1 X126.197 Y125.14 E.00025
; LINE_WIDTH: 0.311148
G3 X126.103 Y125.368 I-2.406 J-.859 E.00292
; LINE_WIDTH: 0.351047
G3 X125.277 Y126.143 I-1.404 J-.668 E.01556
; LINE_WIDTH: 0.301152
G1 X125.14 Y126.197 E.00168
; LINE_WIDTH: 0.274021
G1 X125.02 Y126.226 E.00127
; LINE_WIDTH: 0.245074
G1 X124.853 Y126.256 E.00154
; LINE_WIDTH: 0.210313
G1 X124.755 Y126.27 E.00076
; LINE_WIDTH: 0.158523
G3 X124.396 Y126.289 I-.367 J-3.636 E.00201
G1 X109.411 Y126.288 E.08368
G1 X109.062 Y126.271 E.00195
; LINE_WIDTH: 0.21517
G3 X108.889 Y126.246 I.168 J-1.787 E.00138
; LINE_WIDTH: 0.263986
G3 X108.685 Y126.205 I.424 J-2.581 E.00206
G1 X108.66 Y126.197 E.00025
; LINE_WIDTH: 0.311148
G3 X108.432 Y126.103 I.859 J-2.406 E.00292
; LINE_WIDTH: 0.351051
G3 X107.657 Y125.277 I.668 J-1.404 E.01556
; LINE_WIDTH: 0.301152
G1 X107.603 Y125.14 E.00168
; LINE_WIDTH: 0.274021
G1 X107.595 Y125.108 E.00034
; WIPE_START
G1 F15000
G1 X107.574 Y125.02 E-.03428
G1 X107.544 Y124.854 E-.06426
G1 X107.53 Y124.755 E-.03772
G1 X107.511 Y124.396 E-.13689
G1 X107.511 Y123.114 E-.48686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.38 Y118.234 Z7.5 F42000
G1 X116.03 Y116.03 Z7.5
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2760
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.309 J.899 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53569
G1 X114.732 Y115.78 E-.10377
G1 X114.882 Y115.528 E-.11159
G1 X114.897 Y115.51 E-.00896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.09 Y114.598 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G3 X117.016 Y114.463 I.88 J2.791 E.01526
G3 X117.714 Y114.6 I-.315 J3.454 E.01156
G1 X116.15 Y114.599 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16236
G1 X117.016 Y114.463 E-.1729
G1 X117.429 Y114.518 E-.15839
G1 X117.714 Y114.6 E-.11245
G1 X117.309 Y114.6 E-.1539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.009 J2.246 E.03119
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G3 X119.2 Y117.712 I-2.389 J-.484 E.00555
G1 X119.2 Y116.09 E.02633
G1 X119.246 Y116.23 E.00239
G3 X119.302 Y117.324 I-2.344 J.669 E.01795
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15238
G1 X119.2 Y116.113 E-.60762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.251 J-.948 E.03201
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53569
G1 X119.149 Y117.846 E-.03082
G1 X119.035 Y118.08 E-.09908
G1 X118.901 Y118.289 E-.09441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.71 Y119.202 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G3 X116.086 Y119.2 I-.81 J-2.38 E.02685
G1 X117.65 Y119.202 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X117.43 Y119.282 E-.08908
G1 X116.951 Y119.339 E-.18342
G1 X116.532 Y119.312 E-.15929
G1 X116.086 Y119.2 E-.17479
G1 X116.49 Y119.2 E-.15342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.897 J-2.305 E.03329
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53569
G1 X115.821 Y119.089 E-.08637
G1 X115.57 Y118.945 E-.10992
G1 X115.511 Y118.9 E-.02802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.088 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F2760
M204 S5000
G1 X114.6 Y117.712 E.02636
G3 X114.581 Y116.145 I2.362 J-.812 E.02588
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.712 E-.59536
G1 X114.492 Y117.292 E-.16464
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 72/83
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.5 I.829 J.891 P1  F42000
G1 X124.693 Y107.794 Z7.5
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X124.701 Y107.796 E.00014
G3 X126.036 Y109.412 I-.321 J1.624 E.03684
G1 X126.036 Y124.388 E.24319
G3 X124.388 Y126.036 I-1.655 J-.008 E.04196
G1 X109.412 Y126.036 E.24319
G3 X107.764 Y124.388 I.008 J-1.655 E.04196
G1 X107.764 Y109.412 E.24319
G3 X109.412 Y107.764 I1.655 J.008 E.04196
G1 X124.388 Y107.764 E.24319
G1 X124.633 Y107.789 E.00399
; WIPE_START
G1 F3600
M204 S6000
G1 X124.701 Y107.796 E-.02609
G1 X125.013 Y107.89 E-.12355
G1 X125.299 Y108.043 E-.12353
G1 X125.551 Y108.249 E-.12357
G1 X125.757 Y108.501 E-.12357
G1 X125.91 Y108.787 E-.12353
G1 X125.999 Y109.08 E-.11618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.588 Y114.462 Z7.6 F42000
G1 X108.467 Y126.519 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X108.462 Y126.517 E.00008
G3 X107.218 Y124.871 I.466 J-1.645 E.03597
G1 X107.219 Y108.866 E.2599
G3 X108.866 Y107.219 I1.72 J.073 E.04152
G1 X125.072 Y107.229 E.26316
G3 X126.582 Y108.929 I-.201 J1.699 E.04037
G1 X126.581 Y124.934 E.2599
G3 X124.871 Y126.582 I-1.709 J-.062 E.04262
G1 X108.866 Y126.581 E.2599
G1 X108.526 Y126.528 E.00558
; WIPE_START
G1 F3600
M204 S6000
G1 X108.462 Y126.517 E-.02469
G1 X108.152 Y126.397 E-.12633
G1 X107.87 Y126.217 E-.12708
G1 X107.668 Y126.03 E-.10463
G1 X107.467 Y125.763 E-.12713
G1 X107.346 Y125.525 E-.10139
G1 X107.25 Y125.204 E-.12723
G1 X107.245 Y125.148 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 72 start: 116
M624 CAAAAAAAAAA=
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


; object ids of this layer72 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.562 Y125.063 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.272663
G1 F2764
M204 S6000
G1 X107.554 Y125.031 E.00033
; LINE_WIDTH: 0.241197
G1 X107.524 Y124.865 E.00152
; LINE_WIDTH: 0.206491
G1 X107.51 Y124.767 E.00074
; LINE_WIDTH: 0.154284
G3 X107.491 Y124.405 I3.671 J-.37 E.00196
G1 X107.492 Y109.395 E.08123
; LINE_WIDTH: 0.170493
G1 X107.509 Y109.05 E.0021
; LINE_WIDTH: 0.211467
G3 X107.534 Y108.877 I1.772 J.166 E.00135
; LINE_WIDTH: 0.260302
G3 X107.576 Y108.671 I2.7 J.449 E.00205
G1 X107.584 Y108.647 E.00025
; LINE_WIDTH: 0.308038
G3 X107.68 Y108.413 I2.35 J.837 E.00295
; LINE_WIDTH: 0.347632
G3 X108.51 Y107.637 I1.41 J.676 E.01546
; LINE_WIDTH: 0.298373
G3 X108.647 Y107.584 I.597 J1.34 E.00165
; LINE_WIDTH: 0.259897
G3 X108.877 Y107.534 I.611 J2.242 E.00229
; LINE_WIDTH: 0.213813
G1 X109.033 Y107.511 E.00124
; LINE_WIDTH: 0.153978
G3 X109.395 Y107.492 I.37 J3.664 E.00196
G1 X124.399 Y107.492 E.08101
G1 X124.75 Y107.509 E.0019
; LINE_WIDTH: 0.211475
G3 X124.923 Y107.534 I-.17 J1.796 E.00135
; LINE_WIDTH: 0.260424
G3 X125.129 Y107.576 I-.428 J2.603 E.00205
G1 X125.153 Y107.584 E.00025
; LINE_WIDTH: 0.308016
G3 X125.387 Y107.68 I-.834 J2.343 E.00295
; LINE_WIDTH: 0.353647
G3 X126.015 Y108.23 I-.717 J1.454 E.01143
; LINE_WIDTH: 0.328771
G3 X126.184 Y108.56 I-1.22 J.831 E.00465
; LINE_WIDTH: 0.283803
G3 X126.223 Y108.671 I-1.125 J.462 E.00126
G1 X126.234 Y108.714 E.00048
; LINE_WIDTH: 0.24782
G3 X126.276 Y108.935 I-2.924 J.662 E.00207
; LINE_WIDTH: 0.206621
G1 X126.29 Y109.033 E.00075
; LINE_WIDTH: 0.15464
G3 X126.309 Y109.395 I-3.671 J.37 E.00197
G1 X126.308 Y124.399 E.08141
G1 X126.291 Y124.75 E.00191
; LINE_WIDTH: 0.21148
G3 X126.266 Y124.923 I-1.772 J-.167 E.00135
; LINE_WIDTH: 0.260423
G3 X126.224 Y125.129 I-2.606 J-.428 E.00205
G1 X126.216 Y125.153 E.00025
; LINE_WIDTH: 0.308017
G3 X126.12 Y125.387 I-2.341 J-.833 E.00295
; LINE_WIDTH: 0.352966
G3 X125.515 Y126.052 I-1.472 J-.73 E.0123
; LINE_WIDTH: 0.320325
G3 X125.185 Y126.205 I-1.593 J-3.004 E.00443
; LINE_WIDTH: 0.272663
G3 X125.031 Y126.246 I-.336 J-.949 E.00163
; LINE_WIDTH: 0.241197
G1 X124.865 Y126.276 E.00152
; LINE_WIDTH: 0.206491
G1 X124.767 Y126.29 E.00074
; LINE_WIDTH: 0.15464
G3 X124.405 Y126.309 I-.37 J-3.671 E.00197
G1 X109.401 Y126.308 E.08141
G1 X109.05 Y126.291 E.00191
; LINE_WIDTH: 0.21148
G3 X108.877 Y126.266 I.167 J-1.772 E.00135
; LINE_WIDTH: 0.260423
G3 X108.671 Y126.224 I.428 J-2.606 E.00205
G1 X108.647 Y126.216 E.00025
; LINE_WIDTH: 0.308017
G3 X108.413 Y126.12 I.833 J-2.341 E.00295
; LINE_WIDTH: 0.352966
G3 X107.748 Y125.515 I.73 J-1.472 E.0123
; LINE_WIDTH: 0.320325
G3 X107.595 Y125.185 I3.004 J-1.593 E.00443
; LINE_WIDTH: 0.272663
G1 X107.578 Y125.121 E.00069
; WIPE_START
G1 F15000
G1 X107.554 Y125.031 E-.03509
G1 X107.524 Y124.865 E-.06437
G1 X107.51 Y124.767 E-.03752
G1 X107.491 Y124.405 E-.13765
G1 X107.491 Y123.128 E-.48537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.361 Y118.249 Z7.6 F42000
G1 X116.03 Y116.03 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2764
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.277 J.868 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53571
G1 X114.827 Y115.613 E-.17683
G1 X114.897 Y115.509 E-.04746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G3 X117.019 Y114.463 I.81 J2.316 E.01532
G3 X117.714 Y114.6 I-.32 J3.463 E.01152
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16125
G1 X117.019 Y114.463 E-.17469
G1 X117.429 Y114.518 E-.15746
G1 X117.714 Y114.6 E-.11239
G1 X117.308 Y114.6 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.033 J2.268 E.03118
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04953
G1 X118.292 Y114.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y117.382 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G3 X119.2 Y117.712 I-2.462 J-.485 E.00554
G1 X119.2 Y116.087 E.02638
G1 X119.217 Y116.135 E.00083
G3 X119.299 Y117.323 I-2.391 J.763 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.712 E-.15224
G1 X119.2 Y116.112 E-.60776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.265 J-.962 E.032
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53571
G1 X119.149 Y117.846 E-.0308
G1 X118.985 Y118.166 E-.13685
G1 X118.902 Y118.29 E-.05663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.379 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.241 Y119.316 E-.16122
G1 X116.849 Y119.339 E-.14889
G1 X116.468 Y119.301 E-.14574
G1 X116.086 Y119.2 E-.15011
G1 X116.491 Y119.2 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.622 Y117.77 I.875 J-2.284 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.5357
G1 X115.823 Y119.089 E-.08574
G1 X115.571 Y118.946 E-.11011
G1 X115.511 Y118.902 E-.02844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.088 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X114.6 Y117.712 E.02636
G3 X114.581 Y116.145 I2.291 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 7.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.712 E-.59527
G1 X114.492 Y117.292 E-.16473
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 73/83
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I.83 J.89 P1  F42000
G1 X124.699 Y107.772 Z7.6
M73 P93 R2
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X124.714 Y107.774 E.00023
G3 X126.058 Y109.402 I-.323 J1.636 E.03712
G1 X126.058 Y124.398 E.24351
G3 X124.398 Y126.058 I-1.667 J-.008 E.04227
G1 X109.402 Y126.058 E.24351
G3 X107.742 Y124.398 I.008 J-1.667 E.04227
G1 X107.742 Y109.402 E.24351
G3 X109.402 Y107.742 I1.667 J.008 E.04227
G1 X124.398 Y107.742 E.24351
G1 X124.64 Y107.766 E.00394
; WIPE_START
G1 F3600
M204 S6000
G1 X124.714 Y107.774 E-.02824
G1 X125.027 Y107.869 E-.12443
G1 X125.316 Y108.023 E-.12449
G1 X125.569 Y108.231 E-.12445
G1 X125.777 Y108.484 E-.12445
G1 X125.931 Y108.773 E-.12448
G1 X126.015 Y109.049 E-.10947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.607 Y114.434 Z7.7 F42000
G1 X108.454 Y126.537 Z7.7
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X108.449 Y126.535 E.00009
G3 X107.2 Y124.882 I.468 J-1.652 E.03612
G1 X107.201 Y108.854 E.26027
G3 X108.854 Y107.201 I1.727 J.074 E.04168
G1 X125.084 Y107.211 E.26355
G3 X126.6 Y108.918 I-.203 J1.706 E.04054
G1 X126.599 Y124.946 E.26027
G3 X124.882 Y126.6 I-1.716 J-.063 E.04279
G1 X108.854 Y126.599 E.26027
G1 X108.513 Y126.546 E.0056
; WIPE_START
G1 F3600
M204 S6000
G1 X108.449 Y126.535 E-.02481
G1 X108.138 Y126.414 E-.1269
G1 X107.856 Y126.235 E-.12687
G1 X107.652 Y126.046 E-.10575
G1 X107.45 Y125.778 E-.12752
G1 X107.329 Y125.539 E-.10183
G1 X107.246 Y125.28 E-.10342
G1 X107.233 Y125.167 E-.0429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 73 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.7
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
            G0 Z7.7 F4000
            G39.3 S1
            G0 Z7.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer73 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.544 Y125.083 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269695
G1 F2769
M204 S6000
G1 X107.535 Y125.047 E.00037
; LINE_WIDTH: 0.237768
G1 X107.504 Y124.875 E.00154
; LINE_WIDTH: 0.202661
G1 X107.49 Y124.778 E.00072
; LINE_WIDTH: 0.150397
G3 X107.471 Y124.415 I3.665 J-.37 E.00191
G1 X107.472 Y109.385 E.07895
; LINE_WIDTH: 0.166705
G1 X107.489 Y109.038 E.00206
; LINE_WIDTH: 0.207812
G3 X107.514 Y108.866 I1.782 J.168 E.00132
; LINE_WIDTH: 0.256749
G3 X107.557 Y108.657 I2.71 J.45 E.00204
G1 X107.564 Y108.633 E.00024
; LINE_WIDTH: 0.304544
G3 X107.661 Y108.399 I2.355 J.839 E.00293
; LINE_WIDTH: 0.344186
G3 X108.497 Y107.617 I1.419 J.68 E.01539
; LINE_WIDTH: 0.294836
G3 X108.633 Y107.565 I.6 J1.347 E.00163
; LINE_WIDTH: 0.256296
G3 X108.866 Y107.514 I.623 J2.292 E.00228
; LINE_WIDTH: 0.210084
G1 X109.022 Y107.491 E.00121
; LINE_WIDTH: 0.150086
G3 X109.385 Y107.472 I.372 J3.703 E.00191
G1 X124.408 Y107.472 E.07873
G1 X124.762 Y107.489 E.00186
; LINE_WIDTH: 0.207794
G3 X124.934 Y107.514 I-.168 J1.784 E.00132
; LINE_WIDTH: 0.256832
G3 X125.143 Y107.557 I-.434 J2.636 E.00204
G1 X125.167 Y107.564 E.00024
; LINE_WIDTH: 0.304526
G3 X125.401 Y107.661 I-.842 J2.362 E.00293
; LINE_WIDTH: 0.350238
G3 X126.033 Y108.214 I-.722 J1.464 E.01138
; LINE_WIDTH: 0.325277
G3 X126.203 Y108.546 I-1.232 J.838 E.00463
; LINE_WIDTH: 0.280148
G3 X126.242 Y108.657 I-1.114 J.457 E.00124
G1 X126.254 Y108.702 E.00048
; LINE_WIDTH: 0.244082
G3 X126.296 Y108.924 I-2.936 J.665 E.00205
; LINE_WIDTH: 0.202791
G1 X126.31 Y109.022 E.00073
; LINE_WIDTH: 0.150758
G3 X126.329 Y109.385 I-3.665 J.37 E.00192
G1 X126.328 Y124.408 E.07914
G1 X126.311 Y124.762 E.00187
; LINE_WIDTH: 0.207793
G3 X126.286 Y124.934 I-1.78 J-.168 E.00132
; LINE_WIDTH: 0.256831
G3 X126.243 Y125.143 I-2.634 J-.434 E.00204
G1 X126.236 Y125.167 E.00024
; LINE_WIDTH: 0.304522
G3 X126.139 Y125.401 I-2.361 J-.841 E.00293
; LINE_WIDTH: 0.349538
G3 X125.531 Y126.071 I-1.507 J-.759 E.01224
; LINE_WIDTH: 0.317186
G3 X125.202 Y126.223 I-1.614 J-3.045 E.00436
; LINE_WIDTH: 0.269695
G3 X125.047 Y126.265 I-.34 J-.942 E.00163
; LINE_WIDTH: 0.237768
G1 X124.875 Y126.296 E.00154
; LINE_WIDTH: 0.202661
G1 X124.778 Y126.31 E.00072
; LINE_WIDTH: 0.150758
G3 X124.415 Y126.329 I-.37 J-3.665 E.00192
G1 X109.392 Y126.328 E.07914
G1 X109.038 Y126.311 E.00187
; LINE_WIDTH: 0.207793
G3 X108.866 Y126.286 I.168 J-1.78 E.00132
; LINE_WIDTH: 0.256831
G3 X108.657 Y126.243 I.434 J-2.634 E.00204
G1 X108.633 Y126.236 E.00024
; LINE_WIDTH: 0.304522
G3 X108.399 Y126.139 I.841 J-2.361 E.00293
; LINE_WIDTH: 0.349538
G3 X107.729 Y125.531 I.759 J-1.507 E.01224
; LINE_WIDTH: 0.317186
G3 X107.577 Y125.202 I3.045 J-1.614 E.00436
; LINE_WIDTH: 0.269695
G1 X107.56 Y125.14 E.00065
; WIPE_START
G1 F15000
G1 X107.535 Y125.047 E-.03675
G1 X107.504 Y124.875 E-.06628
G1 X107.49 Y124.778 E-.03722
G1 X107.471 Y124.415 E-.13841
G1 X107.471 Y123.148 E-.48134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.34 Y118.268 Z7.7 F42000
G1 X116.03 Y116.03 Z7.7
G1 Z7.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2769
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.311 J.901 E.0333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.827 Y115.613 E-.17687
G1 X114.903 Y115.514 E-.04729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G3 X117.021 Y114.464 I.81 J2.318 E.01536
G3 X117.714 Y114.6 I-.208 J2.88 E.01149
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16122
G1 X117.021 Y114.464 E-.1757
G1 X117.431 Y114.519 E-.15723
G1 X117.714 Y114.6 E-.11164
G1 X117.308 Y114.6 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00211
G3 X119.179 Y116.03 I-.992 J2.23 E.03121
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53537
G1 X117.891 Y114.67 E-.04933
G1 X118.292 Y114.898 E-.1753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G3 X119.2 Y117.711 I-2.385 J-.484 E.00554
G1 X119.2 Y116.09 E.02633
G1 X119.239 Y116.206 E.002
G3 X119.302 Y117.324 I-2.333 J.693 E.01834
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15228
G1 X119.2 Y116.112 E-.60772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.285 J-.984 E.03198
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53573
G1 X119.149 Y117.846 E-.03083
G1 X119.021 Y118.107 E-.11061
G1 X118.902 Y118.289 E-.08283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.379 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.333 Y119.301 E-.12577
G1 X116.951 Y119.339 E-.14621
G1 X116.468 Y119.301 E-.184
G1 X116.086 Y119.2 E-.15012
G1 X116.491 Y119.2 E-.15391
; WIPE_END
M73 P93 R1
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X116.03 Y119.179 E.02287
G3 X114.621 Y117.77 I.899 J-2.308 E.03329
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53572
G1 X115.631 Y118.984 E-.16857
G1 X115.51 Y118.901 E-.05571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F2769
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.283 J-.81 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59418
G1 X114.491 Y117.287 E-.16583
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 74/83
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.7 I.831 J.89 P1  F42000
G1 X124.706 Y107.75 Z7.7
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X124.726 Y107.752 E.00032
G3 X126.08 Y109.392 I-.326 J1.648 E.03739
G1 X126.08 Y124.408 E.24383
G3 X124.408 Y126.08 I-1.679 J-.008 E.04258
G1 X109.392 Y126.08 E.24383
G3 X107.72 Y124.408 I.008 J-1.679 E.04258
G1 X107.72 Y109.392 E.24383
G3 X109.392 Y107.721 I1.679 J.008 E.04258
G1 X124.408 Y107.721 E.24383
G1 X124.646 Y107.744 E.00389
; WIPE_START
G1 F3600
M204 S6000
G1 X124.726 Y107.752 E-.03039
G1 X125.042 Y107.848 E-.12538
G1 X125.333 Y108.003 E-.12536
G1 X125.588 Y108.212 E-.12538
G1 X125.797 Y108.467 E-.12536
G1 X125.952 Y108.758 E-.12537
G1 X126.031 Y109.017 E-.10277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.626 Y114.406 Z7.8 F42000
G1 X108.442 Y126.555 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X108.438 Y126.553 E.00007
G3 X107.182 Y124.893 I.468 J-1.66 E.0363
G1 X107.183 Y108.842 E.26063
G3 X108.842 Y107.183 I1.734 J.075 E.04183
G1 X125.096 Y107.193 E.26394
G3 X126.618 Y108.907 I-.204 J1.714 E.0407
G1 X126.617 Y124.958 E.26063
G3 X124.893 Y126.618 I-1.723 J-.064 E.04296
G1 X108.842 Y126.617 E.26063
G1 X108.501 Y126.564 E.0056
; WIPE_START
G1 F3600
M204 S6000
G1 X108.438 Y126.553 E-.02436
G1 X108.123 Y126.431 E-.12815
G1 X107.891 Y126.289 E-.10375
G1 X107.636 Y126.062 E-.12942
G1 X107.432 Y125.791 E-.12887
G1 X107.312 Y125.553 E-.10158
G1 X107.228 Y125.293 E-.10383
G1 X107.216 Y125.188 E-.04004
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 74 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
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
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer74 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.527 Y125.103 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.266037
G1 F2773
M204 S6000
G1 X107.515 Y125.059 E.00046
; LINE_WIDTH: 0.233964
G1 X107.484 Y124.886 E.00152
; LINE_WIDTH: 0.198821
G1 X107.47 Y124.79 E.0007
; LINE_WIDTH: 0.146521
G3 X107.451 Y124.424 I3.709 J-.373 E.00187
G1 X107.452 Y109.376 E.07668
; LINE_WIDTH: 0.162917
G1 X107.469 Y109.026 E.00202
; LINE_WIDTH: 0.204155
G3 X107.494 Y108.854 I1.773 J.167 E.0013
; LINE_WIDTH: 0.253198
G3 X107.537 Y108.643 I2.758 J.46 E.00203
G1 X107.545 Y108.62 E.00023
; LINE_WIDTH: 0.301056
G3 X107.642 Y108.384 I2.366 J.844 E.00291
; LINE_WIDTH: 0.340758
G3 X108.483 Y107.598 I1.427 J.684 E.01532
; LINE_WIDTH: 0.291224
G3 X108.62 Y107.545 I.626 J1.414 E.00162
; LINE_WIDTH: 0.252768
G3 X108.854 Y107.494 I.607 J2.209 E.00226
; LINE_WIDTH: 0.206381
G1 X109.01 Y107.471 E.00119
; LINE_WIDTH: 0.146205
G3 X109.376 Y107.452 I.373 J3.694 E.00186
G1 X124.418 Y107.452 E.07645
G1 X124.774 Y107.469 E.00181
; LINE_WIDTH: 0.204138
G3 X124.946 Y107.494 I-.167 J1.775 E.00129
; LINE_WIDTH: 0.253269
G3 X125.157 Y107.537 I-.441 J2.667 E.00203
G1 X125.18 Y107.545 E.00023
; LINE_WIDTH: 0.300711
G3 X125.412 Y107.641 I-.877 J2.449 E.00286
; LINE_WIDTH: 0.346713
G3 X126.054 Y108.201 I-.724 J1.477 E.01141
; LINE_WIDTH: 0.321613
G3 X126.223 Y108.533 I-1.281 J.861 E.00457
; LINE_WIDTH: 0.276505
G3 X126.262 Y108.643 I-1.108 J.456 E.00122
G1 X126.274 Y108.689 E.00049
; LINE_WIDTH: 0.240347
G3 X126.316 Y108.913 I-2.952 J.669 E.00203
; LINE_WIDTH: 0.198951
G1 X126.33 Y109.01 E.00071
; LINE_WIDTH: 0.146886
G3 X126.349 Y109.376 I-3.709 J.373 E.00187
G1 X126.348 Y124.418 E.07687
G1 X126.331 Y124.774 E.00182
; LINE_WIDTH: 0.204137
G3 X126.306 Y124.946 I-1.772 J-.167 E.00129
; LINE_WIDTH: 0.253268
G3 X126.263 Y125.157 I-2.665 J-.44 E.00203
G1 X126.255 Y125.18 E.00023
; LINE_WIDTH: 0.300707
G3 X126.159 Y125.412 I-2.449 J-.877 E.00286
; LINE_WIDTH: 0.346053
G3 X125.546 Y126.089 I-1.519 J-.76 E.01223
; LINE_WIDTH: 0.313691
G3 X125.216 Y126.243 I-1.645 J-3.11 E.00434
; LINE_WIDTH: 0.266037
G3 X125.059 Y126.285 I-.341 J-.946 E.00162
; LINE_WIDTH: 0.233964
G1 X124.886 Y126.316 E.00152
; LINE_WIDTH: 0.198821
G1 X124.79 Y126.33 E.0007
; LINE_WIDTH: 0.146886
G3 X124.424 Y126.349 I-.373 J-3.709 E.00187
G1 X109.382 Y126.348 E.07687
G1 X109.026 Y126.331 E.00182
; LINE_WIDTH: 0.204137
G3 X108.854 Y126.306 I.167 J-1.772 E.00129
; LINE_WIDTH: 0.253268
G3 X108.643 Y126.263 I.44 J-2.665 E.00203
G1 X108.62 Y126.255 E.00023
; LINE_WIDTH: 0.300707
G3 X108.388 Y126.159 I.877 J-2.449 E.00286
; LINE_WIDTH: 0.346052
G3 X107.711 Y125.546 I.76 J-1.519 E.01223
; LINE_WIDTH: 0.313693
G3 X107.557 Y125.216 I3.11 J-1.646 E.00434
; LINE_WIDTH: 0.266037
G1 X107.543 Y125.161 E.00056
; WIPE_START
G1 F15000
G1 X107.515 Y125.059 E-.04021
G1 X107.484 Y124.886 E-.06678
G1 X107.47 Y124.79 E-.03693
G1 X107.451 Y124.424 E-.13918
G1 X107.451 Y123.169 E-.47689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.318 Y118.287 Z7.8 F42000
G1 X116.03 Y116.03 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2773
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.335 J.928 E.03325
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.732 Y115.78 E-.10396
G1 X114.882 Y115.528 E-.11154
G1 X114.897 Y115.51 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.092 Y114.598 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G3 X117.024 Y114.464 I.809 J2.317 E.01537
G3 X117.714 Y114.6 I-.33 J3.483 E.01144
G1 X116.152 Y114.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.1606
G1 X117.024 Y114.464 E-.17654
G1 X117.429 Y114.518 E-.15558
G1 X117.714 Y114.6 E-.11239
G1 X117.306 Y114.599 E-.15489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.066 J2.299 E.03114
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04957
G1 X118.292 Y114.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G3 X119.2 Y117.711 I-2.387 J-.484 E.00554
G1 X119.2 Y116.09 E.02632
G1 X119.246 Y116.23 E.00239
G3 X119.302 Y117.324 I-2.343 J.668 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15226
G1 X119.2 Y116.112 E-.60774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.251 J-.948 E.03201
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53575
G1 X119.149 Y117.846 E-.03084
G1 X118.918 Y118.271 E-.18402
G1 X118.902 Y118.29 E-.00938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.337 E.02685
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.429 Y119.282 E-.08885
G1 X116.951 Y119.339 E-.18326
G1 X116.468 Y119.301 E-.18398
G1 X116.086 Y119.2 E-.15014
G1 X116.491 Y119.2 E-.15376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X116.03 Y119.179 E.02287
G3 X114.621 Y117.77 I.899 J-2.308 E.03329
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53574
G1 X115.737 Y119.045 E-.12229
G1 X115.509 Y118.903 E-.10197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2773
M204 S5000
G1 X114.6 Y117.711 E.02632
G3 X114.581 Y116.147 I2.355 J-.811 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.711 E-.59445
G1 X114.492 Y117.289 E-.16555
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 75/83
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I.831 J.889 P1  F42000
G1 X124.712 Y107.728 Z7.8
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
M73 P94 R1
G1 X124.738 Y107.731 E.00042
G3 X126.101 Y109.382 I-.328 J1.659 E.03766
G1 X126.101 Y124.418 E.24414
G3 X124.418 Y126.101 I-1.692 J-.008 E.04289
G1 X109.382 Y126.101 E.24414
G3 X107.699 Y124.418 I.008 J-1.692 E.04289
G1 X107.699 Y109.382 E.24414
G3 X109.382 Y107.699 I1.692 J.008 E.04289
G1 X124.418 Y107.699 E.24414
G1 X124.653 Y107.722 E.00383
; WIPE_START
G1 F3600
M204 S6000
G1 X124.738 Y107.731 E-.03258
G1 X125.056 Y107.827 E-.12627
G1 X125.349 Y107.983 E-.12628
G1 X125.606 Y108.194 E-.12626
G1 X125.817 Y108.451 E-.12631
G1 X125.973 Y108.744 E-.12626
G1 X126.047 Y108.986 E-.09605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.645 Y114.378 Z7.9 F42000
G1 X108.43 Y126.573 Z7.9
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G1 X108.425 Y126.572 E.00008
G3 X107.164 Y124.904 I.468 J-1.665 E.03647
G1 X107.165 Y108.83 E.261
G3 X108.83 Y107.165 I1.742 J.076 E.04198
G1 X125.108 Y107.175 E.26433
G3 X126.636 Y108.896 I-.201 J1.718 E.04089
G1 X126.635 Y124.97 E.261
G3 X124.904 Y126.636 I-1.728 J-.063 E.04314
G1 X108.83 Y126.635 E.261
G1 X108.489 Y126.582 E.00561
; WIPE_START
G1 F3600
M204 S6000
G1 X108.425 Y126.572 E-.02462
G1 X108.109 Y126.449 E-.12883
G1 X107.825 Y126.268 E-.12797
G1 X107.622 Y126.08 E-.10486
G1 X107.417 Y125.808 E-.12972
G1 X107.294 Y125.567 E-.10261
G1 X107.196 Y125.242 E-.12883
G1 X107.193 Y125.21 E-.01256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 75 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.9
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
            G0 Z7.9 F4000
            G39.3 S1
            G0 Z7.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer75 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.51 Y125.132 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.259755
G1 F2778
M204 S6000
G1 X107.495 Y125.069 E.00063
; LINE_WIDTH: 0.229899
G1 X107.464 Y124.897 E.00148
; LINE_WIDTH: 0.194991
G1 X107.45 Y124.802 E.00068
; LINE_WIDTH: 0.142645
G3 X107.431 Y124.434 I3.701 J-.374 E.00182
G1 X107.432 Y109.366 E.0744
; LINE_WIDTH: 0.159128
G1 X107.449 Y109.014 E.00198
; LINE_WIDTH: 0.200502
G3 X107.474 Y108.842 I1.784 J.169 E.00127
; LINE_WIDTH: 0.249661
G3 X107.518 Y108.629 I2.766 J.461 E.00202
G1 X107.525 Y108.606 E.00023
; LINE_WIDTH: 0.297581
G3 X107.623 Y108.369 I2.387 J.852 E.00288
; LINE_WIDTH: 0.337355
G3 X108.469 Y107.579 I1.435 J.688 E.01525
; LINE_WIDTH: 0.287719
G3 X108.606 Y107.526 I.629 J1.42 E.0016
; LINE_WIDTH: 0.249242
G3 X108.842 Y107.474 I.618 J2.253 E.00224
; LINE_WIDTH: 0.202722
G1 X108.999 Y107.451 E.00117
; LINE_WIDTH: 0.142313
G3 X109.366 Y107.432 I.376 J3.734 E.00181
G1 X124.428 Y107.432 E.07416
G1 X124.786 Y107.449 E.00177
; LINE_WIDTH: 0.200515
G3 X124.958 Y107.474 I-.169 J1.787 E.00127
; LINE_WIDTH: 0.249749
G3 X125.171 Y107.518 I-.446 J2.692 E.00202
G1 X125.194 Y107.525 E.00023
; LINE_WIDTH: 0.297242
G3 X125.427 Y107.622 I-.881 J2.459 E.00284
; LINE_WIDTH: 0.338822
G3 X126.2 Y108.419 I-.68 J1.431 E.01467
; LINE_WIDTH: 0.292896
G3 X126.274 Y108.606 I-1.822 J.834 E.00223
; LINE_WIDTH: 0.254621
G3 X126.316 Y108.787 I-1.376 J.417 E.00177
; LINE_WIDTH: 0.224256
G1 X126.336 Y108.902 E.00096
; LINE_WIDTH: 0.195101
G1 X126.35 Y108.998 E.00069
; LINE_WIDTH: 0.143013
G3 X126.369 Y109.366 I-3.701 J.374 E.00182
G1 X126.368 Y124.428 E.07459
G1 X126.351 Y124.786 E.00178
; LINE_WIDTH: 0.200523
G3 X126.326 Y124.958 I-1.786 J-.169 E.00127
; LINE_WIDTH: 0.249744
G3 X126.282 Y125.171 I-2.696 J-.447 E.00202
G1 X126.275 Y125.194 E.00023
; LINE_WIDTH: 0.297227
G3 X126.178 Y125.427 I-2.455 J-.88 E.00283
; LINE_WIDTH: 0.337635
G3 X125.334 Y126.22 I-1.461 J-.709 E.01526
; LINE_WIDTH: 0.287116
G1 X125.194 Y126.275 E.00162
; LINE_WIDTH: 0.259755
G1 X125.069 Y126.305 E.00125
; LINE_WIDTH: 0.229899
G1 X124.897 Y126.336 E.00148
; LINE_WIDTH: 0.194991
G1 X124.802 Y126.35 E.00068
; LINE_WIDTH: 0.143013
G3 X124.434 Y126.369 I-.374 J-3.701 E.00182
G1 X109.372 Y126.368 E.07459
G1 X109.014 Y126.351 E.00178
; LINE_WIDTH: 0.200523
G3 X108.842 Y126.326 I.169 J-1.786 E.00127
; LINE_WIDTH: 0.249743
G3 X108.629 Y126.282 I.447 J-2.696 E.00202
G1 X108.606 Y126.275 E.00023
; LINE_WIDTH: 0.297242
G3 X108.373 Y126.178 I.881 J-2.459 E.00284
; LINE_WIDTH: 0.337632
G3 X107.58 Y125.334 I.709 J-1.461 E.01526
; LINE_WIDTH: 0.287104
G1 X107.525 Y125.194 E.00162
; LINE_WIDTH: 0.259755
G1 X107.524 Y125.19 E.00004
; WIPE_START
G1 F15000
G1 X107.495 Y125.069 E-.0476
G1 X107.464 Y124.897 E-.06622
G1 X107.45 Y124.802 E-.03663
G1 X107.431 Y124.434 E-.13997
G1 X107.431 Y123.198 E-.46959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.294 Y118.311 Z7.9 F42000
G1 X116.03 Y116.03 Z7.9
G1 Z7.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2778
M204 S5000
G1 X114.621 Y116.03 E.02287
G3 X116.03 Y114.621 I2.31 J.9 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53578
G1 X114.789 Y115.677 E-.14832
G1 X114.898 Y115.51 E-.0759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G3 X117.026 Y114.464 I.811 J2.319 E.01544
G3 X117.709 Y114.6 I-.204 J2.799 E.01134
G1 X116.151 Y114.598 E.0253
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16115
G1 X117.026 Y114.464 E-.17759
G1 X117.431 Y114.519 E-.15544
G1 X117.709 Y114.6 E-.10993
G1 X117.299 Y114.6 E-.1559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.905 J2.27 E.03279
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53569
G1 X117.802 Y114.633 E-.01277
G1 X118.064 Y114.756 E-.10991
G1 X118.291 Y114.897 E-.10163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G3 X119.2 Y117.71 I-2.381 J-.484 E.00553
G1 X119.2 Y116.09 E.02631
G1 X119.24 Y116.211 E.00208
G3 X119.302 Y117.324 I-2.331 J.687 E.01826
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.71 E-.15192
G1 X119.2 Y116.11 E-.60808
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.231 J-1.057 E.03043
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06751
G1 X118.899 Y118.288 E-.15666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.379 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.333 Y119.301 E-.12576
G1 X116.951 Y119.339 E-.14622
G1 X116.56 Y119.316 E-.14861
G1 X116.086 Y119.2 E-.18551
G1 X116.491 Y119.2 E-.1539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G1 X116.03 Y119.179 E.02287
G3 X114.621 Y117.77 I.878 J-2.287 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53576
G1 X115.821 Y119.088 E-.08644
G1 X115.57 Y118.945 E-.10984
G1 X115.511 Y118.902 E-.02796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F2778
M204 S5000
G1 X114.6 Y117.712 E.02636
G3 X114.581 Y116.146 I2.361 J-.812 E.02587
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.712 E-.59519
G1 X114.492 Y117.292 E-.16481
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 76/83
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z7.9 I.832 J.888 P1  F42000
G1 X124.719 Y107.705 Z7.9
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X124.75 Y107.709 E.00051
G3 X126.123 Y109.373 I-.33 J1.671 E.03793
G1 X126.123 Y124.427 E.24446
G3 X124.427 Y126.123 I-1.704 J-.008 E.04321
G1 X109.373 Y126.123 E.24446
G3 X107.677 Y124.427 I.008 J-1.704 E.04321
G1 X107.677 Y109.373 E.24446
G3 X109.373 Y107.677 I1.704 J.008 E.04321
G1 X124.427 Y107.677 E.24446
G1 X124.659 Y107.699 E.00378
; WIPE_START
G1 F3600
M204 S6000
G1 X124.75 Y107.709 E-.03479
G1 X125.07 Y107.806 E-.12717
G1 X125.366 Y107.963 E-.12717
G1 X125.624 Y108.176 E-.12721
G1 X125.837 Y108.434 E-.12718
G1 X125.994 Y108.73 E-.12717
G1 X126.063 Y108.954 E-.08931
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.664 Y114.35 Z8 F42000
G1 X108.418 Y126.59 Z8
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X108.412 Y126.589 E.00009
G3 X107.146 Y124.915 I.473 J-1.674 E.0366
G1 X107.147 Y108.818 E.26137
G3 X108.818 Y107.147 I1.749 J.077 E.04214
G1 X125.12 Y107.157 E.26471
G3 X126.654 Y108.886 I-.206 J1.728 E.04103
G1 X126.653 Y124.982 E.26137
G3 X124.915 Y126.654 I-1.738 J-.066 E.04329
G1 X108.818 Y126.653 E.26137
G1 X108.477 Y126.6 E.00561
; WIPE_START
G1 F3600
M204 S6000
G1 X108.412 Y126.589 E-.02499
G1 X108.095 Y126.466 E-.12925
G1 X107.81 Y126.284 E-.12859
G1 X107.604 Y126.094 E-.10622
G1 X107.399 Y125.821 E-.12986
G1 X107.277 Y125.581 E-.10223
G1 X107.179 Y125.255 E-.12942
G1 X107.176 Y125.23 E-.00944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 76 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
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
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer76 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.492 Y125.153 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.256198
G1 F2783
M204 S6000
G1 X107.475 Y125.081 E.00071
; LINE_WIDTH: 0.226123
G1 X107.444 Y124.908 E.00146
; LINE_WIDTH: 0.191151
G1 X107.43 Y124.813 E.00066
; LINE_WIDTH: 0.138739
G3 X107.411 Y124.443 I3.69 J-.374 E.00177
G1 X107.412 Y109.357 E.07209
; LINE_WIDTH: 0.155341
G1 X107.429 Y109.002 E.00194
; LINE_WIDTH: 0.196832
G3 X107.454 Y108.83 I1.772 J.168 E.00124
; LINE_WIDTH: 0.246096
G3 X107.499 Y108.615 I2.79 J.466 E.00201
G1 X107.506 Y108.592 E.00022
; LINE_WIDTH: 0.293787
G3 X107.603 Y108.358 I2.474 J.887 E.00282
; LINE_WIDTH: 0.33385
G3 X108.455 Y107.559 I1.446 J.689 E.01522
; LINE_WIDTH: 0.284229
G3 X108.593 Y107.506 I.604 J1.353 E.00158
; LINE_WIDTH: 0.245593
G3 X108.83 Y107.454 I.654 J2.417 E.00222
; LINE_WIDTH: 0.198952
G1 X108.987 Y107.431 E.00115
; LINE_WIDTH: 0.138411
G3 X109.357 Y107.412 I.376 J3.728 E.00176
G1 X124.438 Y107.412 E.07186
G1 X124.798 Y107.429 E.00172
; LINE_WIDTH: 0.196823
G3 X124.97 Y107.454 I-.168 J1.775 E.00124
; LINE_WIDTH: 0.246151
G3 X125.185 Y107.499 I-.451 J2.719 E.00201
G1 X125.208 Y107.506 E.00022
; LINE_WIDTH: 0.293754
G3 X125.442 Y107.603 I-.886 J2.47 E.00281
; LINE_WIDTH: 0.335378
G3 X126.219 Y108.405 I-.678 J1.434 E.01459
; LINE_WIDTH: 0.289406
G3 X126.293 Y108.593 I-1.835 J.84 E.00221
; LINE_WIDTH: 0.2511
G3 X126.336 Y108.775 I-1.409 J.426 E.00175
; LINE_WIDTH: 0.220495
G1 X126.356 Y108.891 E.00096
; LINE_WIDTH: 0.191261
G1 X126.37 Y108.987 E.00067
; LINE_WIDTH: 0.139112
G3 X126.389 Y109.357 I-3.69 J.374 E.00178
G1 X126.388 Y124.438 E.07229
G1 X126.371 Y124.798 E.00173
; LINE_WIDTH: 0.19682
G3 X126.346 Y124.97 I-1.771 J-.168 E.00124
; LINE_WIDTH: 0.24615
G3 X126.301 Y125.185 I-2.716 J-.45 E.00201
G1 X126.294 Y125.208 E.00022
; LINE_WIDTH: 0.293756
G3 X126.197 Y125.442 I-2.471 J-.886 E.00282
; LINE_WIDTH: 0.333901
G3 X125.346 Y126.24 I-1.445 J-.688 E.0152
; LINE_WIDTH: 0.283428
G1 X125.208 Y126.294 E.00159
; LINE_WIDTH: 0.256198
G1 X125.081 Y126.325 E.00125
; LINE_WIDTH: 0.226123
G1 X124.908 Y126.356 E.00146
; LINE_WIDTH: 0.191151
G1 X124.813 Y126.37 E.00066
; LINE_WIDTH: 0.139112
G3 X124.443 Y126.389 I-.374 J-3.69 E.00178
G1 X109.362 Y126.388 E.07229
G1 X109.002 Y126.371 E.00173
; LINE_WIDTH: 0.196821
G3 X108.83 Y126.346 I.168 J-1.771 E.00124
; LINE_WIDTH: 0.246159
G3 X108.615 Y126.301 I.451 J-2.719 E.00201
G1 X108.592 Y126.294 E.00022
; LINE_WIDTH: 0.293765
G3 X108.358 Y126.197 I.891 J-2.483 E.00281
; LINE_WIDTH: 0.333896
G3 X107.56 Y125.346 I.689 J-1.445 E.0152
; LINE_WIDTH: 0.283396
G1 X107.507 Y125.211 E.00155
; WIPE_START
G1 F15000
G1 X107.475 Y125.081 E-.05099
G1 X107.444 Y124.908 E-.06675
G1 X107.43 Y124.813 E-.03635
G1 X107.411 Y124.443 E-.14075
G1 X107.411 Y123.219 E-.46516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.272 Y118.33 Z8 F42000
G1 X116.03 Y116.03 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2783
M204 S5000
G1 X114.621 Y116.03 E.02287
G3 X116.03 Y114.622 I2.304 J.896 E.03328
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.5358
G1 X114.779 Y115.694 E-.14099
G1 X114.883 Y115.528 E-.07451
G1 X114.897 Y115.51 E-.00869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.092 Y114.598 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G3 X117.029 Y114.464 I.809 J2.319 E.01545
G3 X117.714 Y114.6 I-.342 J3.511 E.01136
G1 X116.152 Y114.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16057
G1 X117.029 Y114.464 E-.17849
G1 X117.429 Y114.518 E-.15364
G1 X117.714 Y114.6 E-.1124
G1 X117.306 Y114.599 E-.1549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00209
G3 X119.179 Y116.03 I-.992 J2.233 E.03124
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04881
G1 X118.292 Y114.898 E-.17581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.291 Y117.383 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G3 X119.2 Y117.711 I-2.386 J-.484 E.00554
G1 X119.2 Y116.09 E.02632
G1 X119.246 Y116.23 E.00239
G3 X119.302 Y117.324 I-2.341 J.669 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15215
G1 X119.2 Y116.111 E-.60785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.845 E.00131
G3 X117.77 Y119.179 I-2.264 J-.961 E.03201
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.5358
G1 X119.149 Y117.845 E-.03072
G1 X119.02 Y118.108 E-.11119
G1 X118.902 Y118.289 E-.08228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.38 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.333 Y119.301 E-.12573
G1 X116.951 Y119.339 E-.14621
G1 X116.56 Y119.316 E-.14866
G1 X116.086 Y119.2 E-.18554
G1 X116.491 Y119.2 E-.15385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.882 J-2.291 E.03332
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53596
G1 X115.654 Y118.998 E-.15876
G1 X115.512 Y118.901 E-.06528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2783
M204 S5000
M73 P95 R1
G1 X114.6 Y117.713 E.02637
G3 X114.581 Y116.146 I2.329 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.713 E-.59558
G1 X114.493 Y117.294 E-.16442
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 77/83
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8 I.833 J.887 P1  F42000
G1 X124.725 Y107.683 Z8
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X124.762 Y107.687 E.00061
G3 X126.145 Y109.363 I-.333 J1.683 E.0382
G1 X126.145 Y124.437 E.24478
G3 X124.437 Y126.145 I-1.716 J-.008 E.04352
G1 X109.363 Y126.145 E.24478
G3 X107.655 Y124.437 I.008 J-1.716 E.04352
G1 X107.655 Y109.363 E.24478
G3 X109.363 Y107.655 I1.716 J.008 E.04352
G1 X124.437 Y107.655 E.24478
G1 X124.665 Y107.677 E.00372
; WIPE_START
G1 F3600
M204 S6000
G1 X124.762 Y107.687 E-.03702
G1 X125.085 Y107.785 E-.12807
G1 X125.382 Y107.943 E-.12809
G1 X125.643 Y108.157 E-.12809
G1 X125.857 Y108.418 E-.12808
G1 X126.016 Y108.715 E-.12813
G1 X126.079 Y108.923 E-.08251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.683 Y114.322 Z8.1 F42000
G1 X108.406 Y126.608 Z8.1
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X108.397 Y126.606 E.00015
G3 X107.127 Y124.925 I.477 J-1.68 E.03671
G1 X107.129 Y108.807 E.26173
G3 X108.807 Y107.129 I1.756 J.078 E.04229
G1 X125.132 Y107.139 E.26509
G3 X126.673 Y108.875 I-.207 J1.735 E.0412
G1 X126.671 Y124.993 E.26174
G3 X124.925 Y126.673 I-1.745 J-.067 E.04346
G1 X108.807 Y126.671 E.26174
G1 X108.465 Y126.618 E.00561
; WIPE_START
G1 F3600
M204 S6000
G1 X108.397 Y126.606 E-.02623
G1 X108.08 Y126.483 E-.12903
G1 X107.845 Y126.339 E-.10491
G1 X107.589 Y126.11 E-.13056
G1 X107.382 Y125.836 E-.13052
G1 X107.26 Y125.595 E-.10257
G1 X107.175 Y125.332 E-.10503
G1 X107.161 Y125.251 E-.03116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 77 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.1
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
            G0 Z8.1 F4000
            G39.3 S1
            G0 Z8.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer77 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.475 Y125.166 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255192
G1 F2787
M204 S6000
G1 X107.455 Y125.096 E.0007
; LINE_WIDTH: 0.222558
G1 X107.424 Y124.919 E.00147
; LINE_WIDTH: 0.18732
G1 X107.41 Y124.825 E.00064
; LINE_WIDTH: 0.134852
G3 X107.391 Y124.453 I3.783 J-.38 E.00172
G1 X107.392 Y109.347 E.06979
; LINE_WIDTH: 0.151533
G1 X107.409 Y108.99 E.0019
; LINE_WIDTH: 0.193151
G3 X107.434 Y108.818 I1.763 J.167 E.00121
; LINE_WIDTH: 0.242503
G3 X107.479 Y108.601 I2.815 J.471 E.002
G1 X107.486 Y108.579 E.00021
; LINE_WIDTH: 0.290282
G3 X107.584 Y108.343 I2.483 J.891 E.00279
; LINE_WIDTH: 0.330441
G3 X108.441 Y107.54 I1.454 J.693 E.01514
; LINE_WIDTH: 0.280668
G3 X108.579 Y107.487 I.633 J1.428 E.00156
; LINE_WIDTH: 0.242046
G3 X108.818 Y107.434 I.639 J2.34 E.0022
; LINE_WIDTH: 0.195249
G1 X108.975 Y107.411 E.00112
; LINE_WIDTH: 0.13452
G3 X109.347 Y107.392 I.379 J3.764 E.00172
G1 X124.447 Y107.392 E.06956
G1 X124.81 Y107.409 E.00167
; LINE_WIDTH: 0.193168
G3 X124.982 Y107.434 I-.167 J1.765 E.00121
; LINE_WIDTH: 0.240711
G3 X125.199 Y107.479 I-.458 J2.754 E.00198
; LINE_WIDTH: 0.27692
G3 X125.357 Y107.539 I-.402 J1.296 E.00177
; LINE_WIDTH: 0.329596
G3 X126.238 Y108.391 I-.594 J1.495 E.01577
; LINE_WIDTH: 0.285911
G3 X126.313 Y108.579 I-1.839 J.842 E.00219
; LINE_WIDTH: 0.247544
G3 X126.356 Y108.763 I-1.433 J.433 E.00174
; LINE_WIDTH: 0.216723
G1 X126.376 Y108.881 E.00095
; LINE_WIDTH: 0.18743
G1 X126.39 Y108.975 E.00065
; LINE_WIDTH: 0.135229
G3 X126.409 Y109.347 I-3.783 J.38 E.00173
G1 X126.408 Y124.447 E.07
G1 X126.391 Y124.81 E.00168
; LINE_WIDTH: 0.193177
G3 X126.366 Y124.982 I-1.764 J-.167 E.00121
; LINE_WIDTH: 0.231173
G1 X126.345 Y125.095 E.00099
; LINE_WIDTH: 0.262308
G1 X126.279 Y125.312 E.00222
; LINE_WIDTH: 0.300005
G1 X126.215 Y125.46 E.00183
; LINE_WIDTH: 0.335909
G3 X125.592 Y126.145 I-1.545 J-.778 E.012
; LINE_WIDTH: 0.303288
G3 X125.256 Y126.301 I-1.713 J-3.244 E.00426
; LINE_WIDTH: 0.255205
G3 X125.095 Y126.345 I-.346 J-.961 E.00159
; LINE_WIDTH: 0.222558
G1 X124.919 Y126.376 E.00147
; LINE_WIDTH: 0.18732
G1 X124.825 Y126.39 E.00064
; LINE_WIDTH: 0.135229
G3 X124.453 Y126.409 I-.38 J-3.783 E.00173
G1 X109.353 Y126.408 E.07
G1 X108.99 Y126.391 E.00168
; LINE_WIDTH: 0.193177
G3 X108.818 Y126.366 I.167 J-1.764 E.00121
; LINE_WIDTH: 0.231165
G1 X108.705 Y126.345 E.00099
; LINE_WIDTH: 0.26231
G1 X108.488 Y126.279 E.00222
; LINE_WIDTH: 0.299992
G1 X108.34 Y126.215 E.00183
; LINE_WIDTH: 0.335909
G3 X107.655 Y125.592 I.778 J-1.545 E.012
; LINE_WIDTH: 0.303278
G3 X107.499 Y125.256 I3.24 J-1.711 E.00426
; LINE_WIDTH: 0.255192
G1 X107.49 Y125.224 E.00031
; WIPE_START
G1 F15000
G1 X107.455 Y125.096 E-.05071
G1 X107.424 Y124.919 E-.06824
G1 X107.41 Y124.825 E-.03604
G1 X107.391 Y124.453 E-.14151
G1 X107.391 Y123.233 E-.46351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.253 Y118.345 Z8.1 F42000
G1 X116.03 Y116.03 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2787
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.271 J.864 E.03332
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.779 Y115.694 E-.14102
G1 X114.882 Y115.528 E-.07443
G1 X114.897 Y115.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G3 X117.031 Y114.464 I.877 J2.779 E.01549
G3 X117.714 Y114.6 I-.242 J2.992 E.01132
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16202
G1 X117.031 Y114.464 E-.17862
G1 X117.431 Y114.519 E-.15328
G1 X117.714 Y114.6 E-.11181
G1 X117.308 Y114.6 E-.15427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.008 J2.244 E.03119
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04962
G1 X118.292 Y114.898 E-.175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y117.382 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G3 X119.2 Y117.711 I-2.459 J-.484 E.00553
G1 X119.2 Y116.087 E.02637
G1 X119.217 Y116.135 E.00083
G3 X119.299 Y117.323 I-2.388 J.762 E.01952
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y117.711 E-.15214
G1 X119.2 Y116.111 E-.60786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.149 Y117.845 E.00131
G3 X117.77 Y119.178 I-2.255 J-.955 E.03199
G1 X117.77 Y117.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.149 Y117.845 E-.03075
G1 X118.964 Y118.201 E-.15257
G1 X118.9 Y118.288 E-.04085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.707 Y119.203 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G3 X116.086 Y119.2 I-.807 J-2.338 E.02682
G1 X117.647 Y119.202 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X117.238 Y119.316 E-.16124
G1 X116.951 Y119.339 E-.10975
G1 X116.56 Y119.316 E-.14865
G1 X116.086 Y119.2 E-.18549
G1 X116.493 Y119.201 E-.15487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X116.03 Y119.179 E.02287
G3 X114.621 Y117.77 I.901 J-2.311 E.0333
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.5358
G1 X115.823 Y119.089 E-.0858
G1 X115.571 Y118.946 E-.10989
G1 X115.511 Y118.902 E-.02851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X114.6 Y117.71 E.02632
G3 X114.581 Y116.146 I2.354 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59427
G1 X114.491 Y117.288 E-.16573
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 78/83
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.1 I.834 J.887 P1  F42000
G1 X124.731 Y107.661 Z8.1
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X124.774 Y107.666 E.0007
G3 X126.167 Y109.353 I-.335 J1.695 E.03848
G1 X126.167 Y124.447 E.24509
G3 X124.447 Y126.167 I-1.728 J-.008 E.04383
G1 X109.353 Y126.167 E.24509
G3 X107.633 Y124.447 I.008 J-1.728 E.04383
G1 X107.633 Y109.353 E.24509
G3 X109.353 Y107.633 I1.728 J.008 E.04383
G1 X124.447 Y107.633 E.24509
G1 X124.672 Y107.655 E.00366
; WIPE_START
G1 F3600
M204 S6000
G1 X124.774 Y107.666 E-.03926
G1 X125.099 Y107.764 E-.12899
G1 X125.399 Y107.924 E-.12898
G1 X125.661 Y108.139 E-.12902
G1 X125.876 Y108.401 E-.12901
G1 X126.037 Y108.701 E-.12898
G1 X126.094 Y108.891 E-.07575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.703 Y114.294 Z8.2 F42000
G1 X108.394 Y126.626 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X108.386 Y126.624 E.00014
G3 X107.109 Y124.936 I.477 J-1.688 E.0369
G1 X107.111 Y108.795 E.26211
G3 X108.795 Y107.111 I1.763 J.08 E.04244
G1 X125.144 Y107.122 E.26549
G3 X126.691 Y108.864 I-.208 J1.742 E.04137
G1 X126.689 Y125.005 E.2621
G3 X124.936 Y126.691 I-1.752 J-.068 E.04363
G1 X108.795 Y126.689 E.2621
G1 X108.453 Y126.636 E.00561
; WIPE_START
G1 F3600
M204 S6000
G1 X108.386 Y126.624 E-.026
G1 X108.066 Y126.5 E-.13041
G1 X107.777 Y126.316 E-.13028
G1 X107.573 Y126.127 E-.10569
G1 X107.366 Y125.853 E-.13039
G1 X107.242 Y125.609 E-.10381
G1 X107.157 Y125.345 E-.10539
G1 X107.144 Y125.273 E-.02803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 78 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
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
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer78 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.46 Y125.193 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.247955
G1 F2792
M204 S6000
G1 X107.425 Y125.054 E.00133
; LINE_WIDTH: 0.213469
G1 X107.404 Y124.93 E.00098
; LINE_WIDTH: 0.18359
G1 X107.39 Y124.837 E.00063
; LINE_WIDTH: 0.130976
G3 X107.371 Y124.463 I3.832 J-.383 E.00167
G1 X107.372 Y109.338 E.06749
; LINE_WIDTH: 0.147755
G1 X107.39 Y108.978 E.00185
; LINE_WIDTH: 0.18953
G3 X107.414 Y108.806 I1.778 J.169 E.00119
; LINE_WIDTH: 0.227224
G1 X107.435 Y108.695 E.00095
; LINE_WIDTH: 0.258398
G1 X107.501 Y108.474 E.00222
; LINE_WIDTH: 0.296509
G1 X107.567 Y108.325 E.00183
; LINE_WIDTH: 0.327056
G3 X108.427 Y107.521 I1.46 J.7 E.01501
; LINE_WIDTH: 0.277173
G3 X108.565 Y107.467 I.603 J1.349 E.00154
; LINE_WIDTH: 0.238454
G3 X108.806 Y107.414 I.676 J2.507 E.00218
; LINE_WIDTH: 0.19156
G1 X108.964 Y107.391 E.0011
; LINE_WIDTH: 0.130638
G3 X109.338 Y107.372 I.379 J3.756 E.00167
G1 X124.457 Y107.372 E.06726
G1 X124.822 Y107.39 E.00163
; LINE_WIDTH: 0.189508
G3 X124.994 Y107.414 I-.165 J1.751 E.00119
; LINE_WIDTH: 0.239043
G3 X125.213 Y107.46 I-.464 J2.788 E.00198
G1 X125.235 Y107.467 E.00021
; LINE_WIDTH: 0.286798
G3 X125.471 Y107.565 I-.902 J2.508 E.00277
; LINE_WIDTH: 0.328551
G3 X126.257 Y108.376 I-.686 J1.451 E.01444
; LINE_WIDTH: 0.282404
G3 X126.332 Y108.566 I-1.837 J.842 E.00217
; LINE_WIDTH: 0.243998
G3 X126.376 Y108.751 I-1.457 J.439 E.00172
; LINE_WIDTH: 0.212925
G1 X126.396 Y108.87 E.00094
; LINE_WIDTH: 0.18359
G1 X126.41 Y108.964 E.00063
; LINE_WIDTH: 0.131357
G3 X126.429 Y109.338 I-3.832 J.383 E.00168
G1 X126.428 Y124.457 E.0677
G1 X126.41 Y124.822 E.00164
; LINE_WIDTH: 0.189513
G3 X126.386 Y124.994 I-1.775 J-.169 E.00119
; LINE_WIDTH: 0.239042
G3 X126.34 Y125.213 I-2.785 J-.464 E.00198
G1 X126.333 Y125.235 E.00021
; LINE_WIDTH: 0.286816
G3 X126.235 Y125.471 I-2.509 J-.902 E.00277
; LINE_WIDTH: 0.33247
G3 X125.608 Y126.164 I-1.534 J-.759 E.01199
; LINE_WIDTH: 0.300449
G3 X125.269 Y126.321 I-1.135 J-2.007 E.00426
; LINE_WIDTH: 0.247955
G3 X125.054 Y126.375 I-.448 J-1.326 E.00205
; LINE_WIDTH: 0.213469
G1 X124.93 Y126.396 E.00098
; LINE_WIDTH: 0.18359
G1 X124.836 Y126.41 E.00063
; LINE_WIDTH: 0.131357
G3 X124.463 Y126.429 I-.383 J-3.832 E.00168
G1 X109.343 Y126.428 E.0677
G1 X108.978 Y126.41 E.00164
; LINE_WIDTH: 0.189513
G3 X108.806 Y126.386 I.169 J-1.775 E.00119
; LINE_WIDTH: 0.239042
G3 X108.587 Y126.34 I.464 J-2.785 E.00198
G1 X108.565 Y126.333 E.00021
; LINE_WIDTH: 0.286816
G3 X108.329 Y126.235 I.902 J-2.509 E.00277
; LINE_WIDTH: 0.33247
G3 X107.636 Y125.608 I.759 J-1.534 E.01199
; LINE_WIDTH: 0.300453
G3 X107.479 Y125.269 I2.012 J-1.137 E.00426
; LINE_WIDTH: 0.247955
G1 X107.475 Y125.251 E.00016
; WIPE_START
G1 F15000
G1 X107.425 Y125.054 E-.07749
G1 X107.404 Y124.93 E-.04754
G1 X107.39 Y124.837 E-.03603
G1 X107.371 Y124.463 E-.1423
G1 X107.371 Y123.261 E-.45665
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.23 Y118.369 Z8.2 F42000
G1 X116.03 Y116.03 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.29 J.881 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.732 Y115.78 E-.10408
G1 X114.883 Y115.528 E-.11146
G1 X114.897 Y115.51 E-.00862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G3 X117.032 Y114.464 I.811 J2.319 E.01552
G3 X117.714 Y114.6 I-.141 J2.483 E.01133
G1 X116.151 Y114.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X116.559 Y114.484 E-.16111
G1 X117.032 Y114.464 E-.17961
G1 X117.431 Y114.519 E-.15312
G1 X117.714 Y114.6 E-.11186
G1 X117.308 Y114.6 E-.15431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.008 J2.245 E.03119
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04965
G1 X118.292 Y114.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.713 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X119.2 Y116.087 E.0264
G1 X119.217 Y116.135 E.00083
G3 X119.219 Y117.656 I-2.351 J.764 E.02511
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.087 E-.59639
G1 X119.217 Y116.135 E-.01935
G1 X119.307 Y116.504 E-.14426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00289
G3 X117.77 Y119.179 I-2.225 J-1.051 E.03043
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06753
G1 X118.899 Y118.288 E-.15664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.38 E.02684
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.334 Y119.301 E-.12551
G1 X116.951 Y119.339 E-.14644
G1 X116.468 Y119.301 E-.18398
G1 X116.086 Y119.2 E-.15018
G1 X116.491 Y119.2 E-.15389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.882 J-2.292 E.03332
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53582
G1 X115.64 Y118.989 E-.16465
G1 X115.511 Y118.901 E-.05953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2792
M204 S5000
M73 P96 R1
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.147 I2.352 J-.81 E.02582
; CHANGE_LAYER
; Z_HEIGHT: 7.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59403
G1 X114.491 Y117.287 E-.16597
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 79/83
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I.834 J.886 P1  F42000
G1 X124.737 Y107.638 Z8.2
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X124.786 Y107.644 E.0008
G3 X126.189 Y109.343 I-.338 J1.707 E.03875
G1 X126.189 Y124.457 E.24541
G3 X124.457 Y126.189 I-1.74 J-.008 E.04414
G1 X109.343 Y126.189 E.24541
G3 X107.611 Y124.457 I.008 J-1.74 E.04414
G1 X107.611 Y109.343 E.24541
G3 X109.343 Y107.611 I1.74 J.008 E.04414
G1 X124.457 Y107.611 E.24541
G1 X124.678 Y107.633 E.00361
; WIPE_START
G1 F3600
M204 S6000
G1 X124.786 Y107.644 E-.04154
G1 X125.114 Y107.742 E-.12989
G1 X125.415 Y107.904 E-.12991
G1 X125.679 Y108.121 E-.12992
G1 X125.896 Y108.385 E-.12992
G1 X126.058 Y108.686 E-.1299
G1 X126.11 Y108.86 E-.06893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.722 Y114.265 Z8.3 F42000
G1 X108.383 Y126.644 Z8.3
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X108.371 Y126.642 E.0002
G3 X107.091 Y124.947 I.481 J-1.694 E.03701
G1 X107.093 Y108.783 E.26247
G3 X108.783 Y107.093 I1.771 J.08 E.0426
G1 X125.156 Y107.104 E.26587
G3 X126.709 Y108.853 I-.209 J1.749 E.04153
G1 X126.707 Y125.017 E.26247
G3 X124.947 Y126.709 I-1.76 J-.069 E.0438
G1 X108.783 Y126.707 E.26247
G1 X108.442 Y126.654 E.0056
; WIPE_START
G1 F3600
M204 S6000
G1 X108.371 Y126.642 E-.02739
G1 X108.052 Y126.517 E-.13016
G1 X107.762 Y126.332 E-.13083
G1 X107.557 Y126.143 E-.10587
G1 X107.35 Y125.868 E-.13073
G1 X107.225 Y125.623 E-.10441
G1 X107.125 Y125.294 E-.13061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 79 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.3
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
            G0 Z8.3 F4000
            G39.3 S1
            G0 Z8.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer79 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.44 Y125.218 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.245484
G1 F2796
M204 S6000
G1 X107.415 Y125.117 E.00094
; LINE_WIDTH: 0.214723
G1 X107.384 Y124.94 E.00141
; LINE_WIDTH: 0.17965
G1 X107.37 Y124.848 E.0006
; LINE_WIDTH: 0.127099
G3 X107.351 Y124.472 I3.821 J-.383 E.00162
G1 X107.352 Y109.328 E.06518
; LINE_WIDTH: 0.143967
G1 X107.37 Y108.966 E.00181
; LINE_WIDTH: 0.185854
G3 X107.394 Y108.795 I1.762 J.167 E.00116
; LINE_WIDTH: 0.223605
G1 X107.415 Y108.683 E.00094
; LINE_WIDTH: 0.254418
G1 X107.48 Y108.464 E.00216
; LINE_WIDTH: 0.292419
G1 X107.546 Y108.314 E.00181
; LINE_WIDTH: 0.323584
G3 X108.413 Y107.502 I1.471 J.701 E.01498
; LINE_WIDTH: 0.273665
G3 X108.552 Y107.448 I.61 J1.364 E.00153
; LINE_WIDTH: 0.23488
G3 X108.795 Y107.394 I.689 J2.558 E.00216
; LINE_WIDTH: 0.187847
G1 X108.952 Y107.371 E.00108
; LINE_WIDTH: 0.126746
G3 X109.328 Y107.352 I.382 J3.795 E.00161
G1 X124.467 Y107.352 E.06494
G1 X124.834 Y107.37 E.00158
; LINE_WIDTH: 0.185848
G3 X125.005 Y107.394 I-.167 J1.764 E.00116
; LINE_WIDTH: 0.223843
G1 X125.12 Y107.416 E.00096
; LINE_WIDTH: 0.255006
G1 X125.339 Y107.482 E.00218
; LINE_WIDTH: 0.293349
G1 X125.494 Y107.55 E.00188
; LINE_WIDTH: 0.325466
G3 X126.276 Y108.362 I-.704 J1.46 E.01426
; LINE_WIDTH: 0.278906
G3 X126.352 Y108.552 I-1.854 J.85 E.00215
; LINE_WIDTH: 0.240447
G3 X126.396 Y108.738 I-1.493 J.449 E.00171
; LINE_WIDTH: 0.209157
G1 X126.416 Y108.859 E.00094
; LINE_WIDTH: 0.17976
G1 X126.43 Y108.952 E.00061
; LINE_WIDTH: 0.127484
G3 X126.449 Y109.328 I-3.821 J.383 E.00163
G1 X126.448 Y124.467 E.0654
G1 X126.43 Y124.834 E.00159
; LINE_WIDTH: 0.185854
G3 X126.406 Y125.005 I-1.762 J-.167 E.00116
; LINE_WIDTH: 0.223843
G1 X126.384 Y125.12 E.00096
; LINE_WIDTH: 0.255012
G1 X126.318 Y125.339 E.00218
; LINE_WIDTH: 0.292966
G1 X126.252 Y125.489 E.00182
; LINE_WIDTH: 0.323712
G3 X125.389 Y126.298 I-1.468 J-.704 E.01491
; LINE_WIDTH: 0.272949
G1 X125.248 Y126.353 E.00155
; LINE_WIDTH: 0.245484
G1 X125.117 Y126.385 E.00123
; LINE_WIDTH: 0.214723
G1 X124.94 Y126.416 E.00141
; LINE_WIDTH: 0.17965
G1 X124.848 Y126.43 E.0006
; LINE_WIDTH: 0.127484
G3 X124.472 Y126.449 I-.383 J-3.821 E.00163
G1 X109.333 Y126.448 E.0654
G1 X108.966 Y126.43 E.00159
; LINE_WIDTH: 0.185854
G3 X108.795 Y126.406 I.167 J-1.762 E.00116
; LINE_WIDTH: 0.223843
G1 X108.68 Y126.384 E.00096
; LINE_WIDTH: 0.255012
G1 X108.461 Y126.318 E.00218
; LINE_WIDTH: 0.292966
G1 X108.311 Y126.252 E.00182
; LINE_WIDTH: 0.323712
G3 X107.502 Y125.389 I.704 J-1.468 E.01491
; LINE_WIDTH: 0.272949
G1 X107.458 Y125.275 E.00126
; WIPE_START
G1 F15000
G1 X107.415 Y125.117 E-.06203
G1 X107.384 Y124.94 E-.06818
G1 X107.37 Y124.848 E-.03547
G1 X107.351 Y124.472 E-.14306
G1 X107.351 Y123.285 E-.45127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.207 Y118.39 Z8.3 F42000
G1 X116.03 Y116.03 Z8.3
G1 Z7.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2796
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.276 J.866 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53559
G1 X114.69 Y115.866 E-.06749
G1 X114.876 Y115.537 E-.14367
G1 X114.898 Y115.509 E-.01326
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G3 X117.034 Y114.464 I.881 J2.818 E.01554
G3 X117.708 Y114.6 I-.322 J3.336 E.01119
G1 X116.151 Y114.598 E.02529
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16206
G1 X117.034 Y114.464 E-.17961
G1 X117.429 Y114.518 E-.15159
G1 X117.708 Y114.6 E-.11047
G1 X117.297 Y114.6 E-.15626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.903 J2.267 E.03278
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53565
G1 X117.802 Y114.633 E-.01286
G1 X117.985 Y114.715 E-.07638
G1 X118.291 Y114.897 E-.13511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.71 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X119.2 Y116.09 E.02631
G1 X119.246 Y116.23 E.00239
G3 X119.219 Y117.654 I-2.426 J.666 E.02344
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.09 E-.59413
G1 X119.246 Y116.23 E-.05583
G1 X119.298 Y116.515 E-.11005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.247 J-1.075 E.03041
G1 X117.77 Y117.83 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53559
G1 X119.11 Y117.934 E-.06748
G1 X118.899 Y118.289 E-.15693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G3 X116.092 Y119.2 I-.806 J-2.319 E.02676
G1 X117.649 Y119.202 E.02528
; WIPE_START
G1 F3600
M204 S6000
G1 X117.429 Y119.282 E-.08867
G1 X116.951 Y119.339 E-.18329
G1 X116.55 Y119.314 E-.15239
G1 X116.276 Y119.259 E-.10627
G1 X116.092 Y119.2 E-.07362
G1 X116.502 Y119.201 E-.15577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.621 Y117.77 I.879 J-2.288 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53565
G1 X115.823 Y119.089 E-.08565
G1 X115.509 Y118.903 E-.1387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
G1 F2796
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.317 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59419
G1 X114.491 Y117.287 E-.16581
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 80/83
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.3 I.835 J.885 P1  F42000
G1 X124.744 Y107.616 Z8.3
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X124.799 Y107.622 E.0009
G3 X126.211 Y109.334 I-.34 J1.719 E.03902
G1 X126.211 Y124.466 E.24573
G3 X124.466 Y126.211 I-1.753 J-.008 E.04445
G1 X109.334 Y126.211 E.24573
G3 X107.589 Y124.466 I.008 J-1.753 E.04445
G1 X107.589 Y109.334 E.24573
G3 X109.334 Y107.589 I1.753 J.008 E.04445
G1 X124.466 Y107.589 E.24573
G1 X124.684 Y107.61 E.00355
; WIPE_START
G1 F3600
M204 S6000
M73 P96 R0
G1 X124.799 Y107.622 E-.04384
G1 X125.128 Y107.721 E-.1308
G1 X125.432 Y107.884 E-.13083
G1 X125.698 Y108.102 E-.13081
G1 X125.916 Y108.368 E-.13082
G1 X126.079 Y108.672 E-.13082
G1 X126.126 Y108.828 E-.06208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.741 Y114.237 Z8.4 F42000
G1 X108.372 Y126.662 Z8.4
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X108.36 Y126.66 E.0002
G3 X107.073 Y124.958 I.481 J-1.701 E.03719
G1 X107.075 Y108.771 E.26284
G3 X108.771 Y107.075 I1.778 J.082 E.04274
G1 X125.168 Y107.086 E.26626
G3 X126.727 Y108.842 I-.211 J1.756 E.0417
G1 X126.725 Y125.029 E.26284
G3 X124.958 Y126.727 I-1.767 J-.07 E.04397
G1 X108.771 Y126.725 E.26284
G1 X108.431 Y126.672 E.00559
; WIPE_START
G1 F3600
M204 S6000
G1 X108.36 Y126.66 E-.02739
G1 X108.038 Y126.535 E-.13142
G1 X107.746 Y126.348 E-.13149
G1 X107.541 Y126.158 E-.10619
G1 X107.331 Y125.881 E-.13215
G1 X107.208 Y125.638 E-.10371
G1 X107.11 Y125.316 E-.12765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 80 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
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
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer80 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.423 Y125.24 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.241908
G1 F2801
M204 S6000
G1 X107.395 Y125.129 E.00102
; LINE_WIDTH: 0.210911
G1 X107.364 Y124.951 E.00139
; LINE_WIDTH: 0.1758
G1 X107.35 Y124.86 E.00058
; LINE_WIDTH: 0.123213
G3 X107.331 Y124.482 I3.867 J-.386 E.00157
G1 X107.332 Y109.318 E.06286
; LINE_WIDTH: 0.140169
G1 X107.35 Y108.954 E.00176
; LINE_WIDTH: 0.1822
G3 X107.375 Y108.783 I1.778 J.169 E.00113
; LINE_WIDTH: 0.220009
G1 X107.396 Y108.67 E.00093
; LINE_WIDTH: 0.250843
G1 X107.461 Y108.451 E.00213
; LINE_WIDTH: 0.288887
G1 X107.527 Y108.299 E.0018
; LINE_WIDTH: 0.320142
G3 X108.4 Y107.482 I1.479 J.705 E.01489
; LINE_WIDTH: 0.270063
G3 X108.538 Y107.428 I.631 J1.42 E.00151
; LINE_WIDTH: 0.23134
G3 X108.783 Y107.375 I.673 J2.475 E.00214
; LINE_WIDTH: 0.184118
G1 X108.941 Y107.351 E.00106
; LINE_WIDTH: 0.122854
G3 X109.318 Y107.332 I.385 J3.84 E.00156
G1 X124.477 Y107.332 E.06262
G1 X124.846 Y107.35 E.00153
; LINE_WIDTH: 0.182185
G3 X125.017 Y107.375 I-.166 J1.754 E.00113
; LINE_WIDTH: 0.220198
G1 X125.132 Y107.396 E.00095
; LINE_WIDTH: 0.251001
G1 X125.349 Y107.461 E.00212
; LINE_WIDTH: 0.288861
G1 X125.501 Y107.527 E.0018
; LINE_WIDTH: 0.321715
G3 X126.295 Y108.348 I-.694 J1.467 E.01428
; LINE_WIDTH: 0.275421
G3 X126.371 Y108.538 I-1.863 J.854 E.00213
; LINE_WIDTH: 0.236921
G3 X126.415 Y108.726 I-1.521 J.456 E.00169
; LINE_WIDTH: 0.205384
G1 X126.436 Y108.848 E.00093
; LINE_WIDTH: 0.1759
G1 X126.45 Y108.94 E.00059
; LINE_WIDTH: 0.123602
G3 X126.469 Y109.318 I-3.867 J.386 E.00158
G1 X126.468 Y124.477 E.06308
G1 X126.45 Y124.846 E.00154
; LINE_WIDTH: 0.182195
G3 X126.425 Y125.017 I-1.777 J-.169 E.00113
; LINE_WIDTH: 0.220198
G1 X126.404 Y125.132 E.00095
; LINE_WIDTH: 0.250997
G1 X126.339 Y125.349 E.00212
; LINE_WIDTH: 0.288854
G1 X126.273 Y125.501 E.0018
; LINE_WIDTH: 0.320219
G3 X125.403 Y126.317 I-1.479 J-.704 E.01487
; LINE_WIDTH: 0.269377
G1 X125.262 Y126.372 E.00153
; LINE_WIDTH: 0.241908
G1 X125.129 Y126.405 E.00123
; LINE_WIDTH: 0.210911
G1 X124.951 Y126.436 E.00139
; LINE_WIDTH: 0.1758
G1 X124.86 Y126.45 E.00058
; LINE_WIDTH: 0.123602
G3 X124.482 Y126.469 I-.386 J-3.867 E.00158
G1 X109.323 Y126.468 E.06308
G1 X108.954 Y126.45 E.00154
; LINE_WIDTH: 0.182195
G3 X108.783 Y126.425 I.169 J-1.777 E.00113
; LINE_WIDTH: 0.220198
G1 X108.668 Y126.404 E.00095
; LINE_WIDTH: 0.250997
G1 X108.451 Y126.339 E.00212
; LINE_WIDTH: 0.288854
G1 X108.299 Y126.273 E.0018
; LINE_WIDTH: 0.320216
G3 X107.483 Y125.403 I.704 J-1.479 E.01487
; LINE_WIDTH: 0.269379
G1 X107.442 Y125.296 E.00115
; WIPE_START
G1 F15000
G1 X107.395 Y125.129 E-.06598
G1 X107.364 Y124.951 E-.06864
G1 X107.35 Y124.86 E-.03517
G1 X107.331 Y124.482 E-.14382
G1 X107.331 Y123.307 E-.4464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.185 Y118.41 Z8.4 F42000
G1 X116.03 Y116.03 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2801
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.277 J.867 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53564
G1 X114.779 Y115.694 E-.14097
G1 X114.883 Y115.528 E-.07447
G1 X114.898 Y115.51 E-.00891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.091 Y114.598 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G3 X117.037 Y114.464 I.876 J2.776 E.01559
G3 X117.714 Y114.6 I-.144 J2.475 E.01125
G1 X116.151 Y114.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16207
G1 X117.037 Y114.464 E-.18074
G1 X117.431 Y114.519 E-.1513
G1 X117.714 Y114.6 E-.11173
G1 X117.308 Y114.6 E-.15415
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.034 J2.269 E.03117
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.67 E-.04951
G1 X118.292 Y114.898 E-.17511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.71 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X119.2 Y116.087 E.02636
G1 X119.217 Y116.135 E.00082
G3 X119.219 Y117.653 I-2.387 J.762 E.02505
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.087 E-.59532
G1 X119.217 Y116.135 E-.01929
G1 X119.307 Y116.507 E-.1454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.282 J-1.113 E.03038
G1 X117.77 Y117.83 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53564
G1 X119.11 Y117.934 E-.06749
G1 X118.899 Y118.289 E-.15687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G3 X116.086 Y119.2 I-.809 J-2.31 E.02686
G1 X117.649 Y119.202 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.239 Y119.316 E-.16179
G1 X116.849 Y119.339 E-.14814
G1 X116.468 Y119.301 E-.14572
G1 X116.086 Y119.2 E-.15023
G1 X116.491 Y119.201 E-.15413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.4 F42000
G1 Z8
M73 P97 R0
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.885 J-2.293 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53596
G1 X115.821 Y119.088 E-.08666
G1 X115.57 Y118.945 E-.10974
G1 X115.512 Y118.901 E-.02764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2801
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.315 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59416
G1 X114.491 Y117.287 E-.16584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 81/83
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I.836 J.885 P1  F42000
G1 X124.75 Y107.594 Z8.4
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X124.811 Y107.6 E.001
G3 X126.233 Y109.324 I-.342 J1.731 E.03929
G1 X126.233 Y124.476 E.24604
G3 X124.476 Y126.233 I-1.765 J-.008 E.04476
G1 X109.324 Y126.233 E.24604
G3 X107.567 Y124.476 I.008 J-1.765 E.04476
G1 X107.567 Y109.324 E.24604
G3 X109.324 Y107.567 I1.765 J.008 E.04476
G1 X124.476 Y107.567 E.24604
G1 X124.69 Y107.588 E.00349
; WIPE_START
G1 F3600
M204 S6000
G1 X124.811 Y107.6 E-.04617
G1 X125.143 Y107.7 E-.13171
G1 X125.448 Y107.864 E-.13172
G1 X125.716 Y108.084 E-.13173
G1 X125.936 Y108.352 E-.13175
G1 X126.1 Y108.657 E-.13171
G1 X126.142 Y108.796 E-.05521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.76 Y114.209 Z8.5 F42000
G1 X108.361 Y126.681 Z8.5
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X108.347 Y126.678 E.00024
G3 X107.055 Y124.969 I.484 J-1.708 E.03734
G1 X107.057 Y108.759 E.26321
G3 X108.759 Y107.057 I1.785 J.083 E.0429
G1 X125.18 Y107.068 E.26664
G3 X126.745 Y108.831 I-.212 J1.764 E.04187
G1 X126.743 Y125.041 E.26321
G3 X124.969 Y126.745 I-1.774 J-.072 E.04414
G1 X108.759 Y126.743 E.26321
G1 X108.42 Y126.69 E.00557
; WIPE_START
G1 F3600
M204 S6000
G1 X108.347 Y126.678 E-.0283
G1 X108.023 Y126.552 E-.13201
G1 X107.784 Y126.405 E-.10646
G1 X107.525 Y126.175 E-.13169
G1 X107.316 Y125.898 E-.13208
G1 X107.19 Y125.652 E-.10491
G1 X107.095 Y125.338 E-.12454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 81 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.5
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
            G0 Z8.5 F4000
            G39.3 S1
            G0 Z8.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer81 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.406 Y125.266 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.233205
G1 F2806
M204 S6000
G1 X107.365 Y125.089 E.00156
; LINE_WIDTH: 0.202012
G1 X107.344 Y124.963 E.00094
; LINE_WIDTH: 0.17208
G1 X107.33 Y124.871 E.00057
; LINE_WIDTH: 0.119337
G3 X107.311 Y124.491 I3.854 J-.386 E.00152
G1 X107.312 Y109.309 E.06054
; LINE_WIDTH: 0.13638
G1 X107.33 Y108.942 E.00172
; LINE_WIDTH: 0.178538
G3 X107.355 Y108.771 I1.764 J.168 E.00111
; LINE_WIDTH: 0.216406
G1 X107.376 Y108.657 E.00092
; LINE_WIDTH: 0.247237
G1 X107.441 Y108.438 E.00211
; LINE_WIDTH: 0.285332
G1 X107.508 Y108.285 E.00179
; LINE_WIDTH: 0.316733
G3 X108.386 Y107.463 I1.487 J.709 E.01481
; LINE_WIDTH: 0.266607
G3 X108.525 Y107.409 I.608 J1.355 E.00149
; LINE_WIDTH: 0.227725
G3 X108.771 Y107.355 I.714 J2.659 E.00212
; LINE_WIDTH: 0.180428
G1 X108.929 Y107.331 E.00104
; LINE_WIDTH: 0.118973
G3 X109.309 Y107.312 I.385 J3.829 E.00151
G1 X124.486 Y107.312 E.0603
G1 X124.858 Y107.33 E.00148
; LINE_WIDTH: 0.178527
G3 X125.029 Y107.355 I-.164 J1.738 E.00111
; LINE_WIDTH: 0.216505
G1 X125.144 Y107.376 E.00093
; LINE_WIDTH: 0.247308
G1 X125.362 Y107.441 E.0021
; LINE_WIDTH: 0.285319
G1 X125.515 Y107.508 E.00179
; LINE_WIDTH: 0.31829
G3 X126.314 Y108.333 I-.698 J1.475 E.0142
; LINE_WIDTH: 0.271897
G3 X126.391 Y108.525 I-1.863 J.855 E.0021
; LINE_WIDTH: 0.233373
G3 X126.435 Y108.714 I-1.549 J.464 E.00168
; LINE_WIDTH: 0.201626
G1 X126.456 Y108.837 E.00092
; LINE_WIDTH: 0.17208
G1 X126.47 Y108.929 E.00057
; LINE_WIDTH: 0.119729
G3 X126.489 Y109.309 I-3.854 J.386 E.00152
G1 X126.488 Y124.486 E.06077
G1 X126.47 Y124.858 E.00149
; LINE_WIDTH: 0.178535
G3 X126.445 Y125.029 I-1.764 J-.168 E.00111
; LINE_WIDTH: 0.216505
G1 X126.424 Y125.144 E.00093
; LINE_WIDTH: 0.247306
G1 X126.359 Y125.362 E.0021
; LINE_WIDTH: 0.285324
G1 X126.292 Y125.515 E.00179
; LINE_WIDTH: 0.317065
G3 X125.416 Y126.336 I-1.496 J-.718 E.01479
; LINE_WIDTH: 0.265841
G1 X125.276 Y126.392 E.00151
; LINE_WIDTH: 0.233205
G1 X125.089 Y126.435 E.00165
; LINE_WIDTH: 0.202012
G1 X124.963 Y126.456 E.00094
; LINE_WIDTH: 0.17208
G1 X124.871 Y126.47 E.00057
; LINE_WIDTH: 0.119729
G3 X124.491 Y126.489 I-.386 J-3.854 E.00152
G1 X109.314 Y126.488 E.06077
G1 X108.942 Y126.47 E.00149
; LINE_WIDTH: 0.178535
G3 X108.771 Y126.445 I.168 J-1.764 E.00111
; LINE_WIDTH: 0.216505
G1 X108.656 Y126.424 E.00093
; LINE_WIDTH: 0.247307
G1 X108.438 Y126.359 E.0021
; LINE_WIDTH: 0.285329
G1 X108.285 Y126.292 E.00179
; LINE_WIDTH: 0.317065
G3 X107.464 Y125.416 I.718 J-1.496 E.01479
; LINE_WIDTH: 0.265841
G1 X107.427 Y125.322 E.00101
; WIPE_START
G1 F15000
G1 X107.365 Y125.089 E-.09155
G1 X107.344 Y124.963 E-.04873
G1 X107.33 Y124.871 E-.03518
G1 X107.311 Y124.491 E-.1446
G1 X107.311 Y123.333 E-.43995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.162 Y118.432 Z8.5 F42000
G1 X116.03 Y116.03 Z8.5
G1 Z8.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2806
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.622 I2.27 J.863 E.03332
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.5357
G1 X114.828 Y115.612 E-.177
G1 X114.898 Y115.509 E-.04731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.598 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G3 X117.039 Y114.464 I.873 J2.775 E.01559
G3 X117.714 Y114.6 I-.188 J2.679 E.01121
G1 X116.153 Y114.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16131
G1 X117.039 Y114.464 E-.18163
G1 X117.429 Y114.518 E-.14967
G1 X117.714 Y114.6 E-.11255
G1 X117.306 Y114.599 E-.15484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.03 J2.264 E.03117
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53542
G1 X117.891 Y114.671 E-.0496
G1 X118.291 Y114.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.71 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X119.2 Y116.09 E.0263
G1 X119.246 Y116.23 E.00238
G3 X119.219 Y117.653 I-2.429 J.666 E.02344
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.09 E-.59392
G1 X119.246 Y116.23 E-.05576
G1 X119.298 Y116.515 E-.11032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.275 J-1.107 E.03038
G1 X117.77 Y117.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06745
G1 X118.899 Y118.288 E-.15672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.707 Y119.203 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G3 X116.086 Y119.2 I-.807 J-2.336 E.02681
G1 X117.647 Y119.202 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117.237 Y119.317 E-.16193
G1 X116.949 Y119.339 E-.10982
G1 X116.468 Y119.301 E-.18327
G1 X116.086 Y119.2 E-.14995
G1 X116.494 Y119.201 E-.15504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.877 J-2.286 E.0333
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08494
G1 X115.571 Y118.946 E-.11052
G1 X115.511 Y118.9 E-.02916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
G1 F2806
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.147 I2.31 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59409
G1 X114.508 Y117.38 E-.13019
G1 X114.497 Y117.287 E-.03572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 82/83
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.5 I.837 J.884 P1  F42000
G1 X124.756 Y107.571 Z8.5
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X124.823 Y107.579 E.0011
G3 X126.255 Y109.314 I-.345 J1.743 E.03956
G1 X126.255 Y124.486 E.24636
G3 X124.486 Y126.255 I-1.777 J-.008 E.04507
G1 X109.314 Y126.255 E.24636
G3 X107.545 Y124.486 I.008 J-1.777 E.04507
G1 X107.545 Y109.314 E.24636
G3 X109.314 Y107.545 I1.777 J.008 E.04507
G1 X124.486 Y107.545 E.24636
G1 X124.696 Y107.566 E.00343
; WIPE_START
G1 F3600
M204 S6000
G1 X124.823 Y107.579 E-.04852
G1 X125.157 Y107.679 E-.13261
G1 X125.465 Y107.844 E-.13265
G1 X125.735 Y108.065 E-.13264
G1 X125.956 Y108.335 E-.13265
G1 X126.121 Y108.643 E-.13257
G1 X126.157 Y108.765 E-.04837
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.78 Y114.181 Z8.6 F42000
G1 X108.351 Y126.699 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X108.334 Y126.695 E.00028
G3 X107.037 Y124.98 I.486 J-1.715 E.03749
G1 X107.039 Y108.747 E.26358
G3 X108.747 Y107.039 I1.793 J.084 E.04305
G1 X125.194 Y107.05 E.26706
G3 X126.763 Y108.82 I-.215 J1.771 E.04199
G1 X126.761 Y125.053 E.26358
G3 X124.98 Y126.763 I-1.781 J-.073 E.0443
G1 X108.747 Y126.761 E.26358
G1 X108.41 Y126.708 E.00555
; WIPE_START
G1 F3600
M204 S6000
G1 X108.334 Y126.695 E-.0293
G1 X108.009 Y126.569 E-.13247
G1 X107.769 Y126.422 E-.10691
G1 X107.509 Y126.191 E-.1322
G1 X107.298 Y125.911 E-.13327
G1 X107.146 Y125.597 E-.13252
G1 X107.085 Y125.359 E-.09333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 82 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
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
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer82 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.389 Y125.277 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.237045
G1 F2810
M204 S6000
G1 X107.356 Y125.156 E.0011
; LINE_WIDTH: 0.20363
G1 X107.324 Y124.973 E.00138
; LINE_WIDTH: 0.168183
G1 X107.311 Y124.883 E.00055
; LINE_WIDTH: 0.115451
G3 X107.291 Y124.501 I3.847 J-.387 E.00147
G1 X107.292 Y109.299 E.05821
; LINE_WIDTH: 0.132602
G1 X107.31 Y108.93 E.00167
; LINE_WIDTH: 0.174871
G1 X107.335 Y108.759 E.00108
; LINE_WIDTH: 0.212756
G1 X107.356 Y108.645 E.00091
; LINE_WIDTH: 0.244058
G3 X107.423 Y108.421 I.924 J.154 E.00213
; LINE_WIDTH: 0.282444
G1 X107.491 Y108.267 E.00179
; LINE_WIDTH: 0.315344
G3 X107.774 Y107.853 I1.453 J.692 E.00602
; LINE_WIDTH: 0.312023
G3 X108.372 Y107.444 I1.284 J1.232 E.00864
; LINE_WIDTH: 0.26313
G3 X108.511 Y107.389 I.608 J1.353 E.00147
; LINE_WIDTH: 0.224203
G3 X108.759 Y107.335 I.725 J2.704 E.0021
; LINE_WIDTH: 0.176748
G1 X108.917 Y107.311 E.00101
; LINE_WIDTH: 0.115082
G3 X109.299 Y107.292 I.389 J3.881 E.00146
G1 X124.496 Y107.292 E.05797
G1 X124.87 Y107.31 E.00143
; LINE_WIDTH: 0.174881
G3 X125.041 Y107.335 I-.166 J1.751 E.00108
; LINE_WIDTH: 0.222589
G3 X125.268 Y107.383 I-.37 J2.288 E.0019
; LINE_WIDTH: 0.260732
G3 X125.432 Y107.445 I-.374 J1.239 E.00171
; LINE_WIDTH: 0.31261
G3 X126.333 Y108.319 I-.615 J1.536 E.01528
; LINE_WIDTH: 0.268421
G3 X126.41 Y108.511 I-1.875 J.861 E.00208
; LINE_WIDTH: 0.229856
G3 X126.455 Y108.702 I-1.583 J.473 E.00166
; LINE_WIDTH: 0.197892
G1 X126.476 Y108.826 E.00091
; LINE_WIDTH: 0.168303
G1 X126.489 Y108.917 E.00055
; LINE_WIDTH: 0.115848
G3 X126.509 Y109.299 I-3.847 J.387 E.00147
G1 X126.508 Y124.496 E.05844
G1 X126.49 Y124.87 E.00144
; LINE_WIDTH: 0.1749
G1 X126.465 Y125.041 E.00108
; LINE_WIDTH: 0.212856
G1 X126.444 Y125.156 E.00091
; LINE_WIDTH: 0.243689
G1 X126.378 Y125.376 E.00208
; LINE_WIDTH: 0.281809
G1 X126.311 Y125.53 E.00178
; LINE_WIDTH: 0.31879
G3 X125.669 Y126.238 I-1.592 J-.798 E.01172
; LINE_WIDTH: 0.285837
G3 X125.323 Y126.399 I-1.47 J-2.706 E.00412
; LINE_WIDTH: 0.237045
G3 X125.156 Y126.444 I-.354 J-.986 E.00152
; LINE_WIDTH: 0.20363
G1 X124.973 Y126.476 E.00138
; LINE_WIDTH: 0.168183
G1 X124.883 Y126.489 E.00055
; LINE_WIDTH: 0.115848
G3 X124.501 Y126.509 I-.387 J-3.847 E.00147
G1 X109.304 Y126.508 E.05844
G1 X108.93 Y126.49 E.00144
; LINE_WIDTH: 0.174899
G1 X108.759 Y126.465 E.00108
; LINE_WIDTH: 0.212862
G1 X108.644 Y126.444 E.00091
; LINE_WIDTH: 0.243696
G1 X108.424 Y126.378 E.00208
; LINE_WIDTH: 0.281811
G1 X108.27 Y126.311 E.00178
; LINE_WIDTH: 0.31879
G3 X107.562 Y125.669 I.798 J-1.592 E.01172
; LINE_WIDTH: 0.285837
G3 X107.406 Y125.335 I2.706 J-1.47 E.00398
; WIPE_START
G1 F15000
G1 X107.356 Y125.156 E-.07042
G1 X107.324 Y124.973 E-.07062
G1 X107.311 Y124.883 E-.03467
G1 X107.291 Y124.501 E-.1454
G1 X107.291 Y123.346 E-.43889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.144 Y118.446 Z8.6 F42000
G1 X116.03 Y116.03 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2810
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.278 J.869 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.781 Y115.691 E-.14246
G1 X114.883 Y115.528 E-.07304
G1 X114.897 Y115.51 E-.00867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.089 Y114.599 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G3 X117.042 Y114.464 I.876 J2.763 E.0157
G3 X117.714 Y114.6 I-.148 J2.467 E.01117
G1 X116.149 Y114.599 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X116.561 Y114.484 E-.16273
G1 X117.042 Y114.464 E-.18268
G1 X117.431 Y114.519 E-.14949
G1 X117.714 Y114.6 E-.11164
G1 X117.31 Y114.6 E-.15346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.032 J2.267 E.03117
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04955
G1 X118.292 Y114.898 E-.17507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.71 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X119.2 Y116.09 E.0263
G1 X119.246 Y116.229 E.00238
G3 X119.218 Y117.653 I-2.505 J.663 E.02342
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.09 E-.59387
G1 X119.246 Y116.229 E-.05575
G1 X119.298 Y116.515 E-.11038
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.179 I-2.285 J-1.118 E.03035
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.06826
G1 X118.899 Y118.288 E-.15591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.711 Y119.201 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
M73 P98 R0
G3 X116.086 Y119.2 I-.811 J-2.336 E.02689
G1 X117.651 Y119.201 E.02542
; WIPE_START
G1 F3600
M204 S6000
G1 X117.428 Y119.282 E-.09035
G1 X116.948 Y119.339 E-.18336
G1 X116.558 Y119.316 E-.14875
G1 X116.086 Y119.2 E-.18464
G1 X116.488 Y119.2 E-.15289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.623 Y117.77 I.896 J-2.303 E.03328
G1 X115.97 Y117.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53592
G1 X115.823 Y119.089 E-.08576
G1 X115.51 Y118.903 E-.13833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2810
M204 S5000
G1 X114.6 Y117.71 E.0263
G3 X114.581 Y116.147 I2.311 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 8.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59391
G1 X114.508 Y117.382 E-.12927
G1 X114.497 Y117.286 E-.03682
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 83/83
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I.838 J.883 P1  F42000
G1 X124.761 Y107.549 Z8.6
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X124.835 Y107.557 E.0012
G3 X126.277 Y109.304 I-.347 J1.755 E.03984
G1 X126.277 Y124.496 E.24668
G3 X124.496 Y126.277 I-1.789 J-.008 E.04538
G1 X109.304 Y126.277 E.24668
G3 X107.523 Y124.496 I.008 J-1.789 E.04538
G1 X107.523 Y109.304 E.24668
G3 X109.304 Y107.523 I1.789 J.008 E.04538
G1 X124.496 Y107.523 E.24668
G1 X124.702 Y107.543 E.00336
; WIPE_START
G1 F3600
M204 S6000
G1 X124.835 Y107.557 E-.0509
G1 X125.171 Y107.658 E-.13354
G1 X125.481 Y107.824 E-.13353
G1 X125.753 Y108.047 E-.13356
G1 X125.976 Y108.319 E-.13356
G1 X126.142 Y108.629 E-.13353
G1 X126.173 Y108.733 E-.04138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.8 Y114.153 Z8.7 F42000
G1 X108.347 Y126.713 Z8.7
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X108.123 Y126.644 E.00382
G3 X107.019 Y124.99 I.687 J-1.653 E.03422
G1 X107.021 Y108.736 E.26394
G3 X108.736 Y107.021 I1.793 J.078 E.04325
G1 X125.204 Y107.032 E.26742
G3 X126.781 Y108.81 I-.214 J1.778 E.04219
G1 X126.779 Y125.064 E.26394
G3 X124.99 Y126.781 I-1.789 J-.073 E.04447
G1 X108.736 Y126.779 E.26394
G3 X108.457 Y126.746 I.073 J-1.789 E.00456
G1 X108.405 Y126.73 E.00089
; WIPE_START
G1 F3600
M204 S6000
G1 X108.123 Y126.644 E-.11217
G1 X107.872 Y126.518 E-.10654
G1 X107.701 Y126.399 E-.0792
G1 X107.544 Y126.259 E-.07992
G1 X107.36 Y126.044 E-.10736
G1 X107.248 Y125.869 E-.07917
G1 X107.156 Y125.68 E-.07999
G1 X107.067 Y125.388 E-.11565
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
M625
; object ids of layer 83 start: 116
M624 CAAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.7
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
            G0 Z8.7 F4000
            G39.3 S1
            G0 Z8.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer83 end: 116
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X107.37 Y125.303 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.226145
G1 F2814
M204 S6000
G1 X107.326 Y125.114 E.00162
; LINE_WIDTH: 0.194489
G1 X107.304 Y124.985 E.00092
; LINE_WIDTH: 0.164428
G1 X107.291 Y124.894 E.00053
; LINE_WIDTH: 0.130693
G3 X107.271 Y124.51 I3.883 J-.389 E.00171
G1 X107.271 Y124.506 E.00002
; LINE_WIDTH: 0.111518
G1 X107.272 Y109.294 E.05582
G1 X107.29 Y108.918 E.00138
; LINE_WIDTH: 0.171209
G1 X107.315 Y108.747 E.00105
; LINE_WIDTH: 0.209149
G1 X107.337 Y108.632 E.0009
; LINE_WIDTH: 0.240026
G1 X107.402 Y108.411 E.00205
; LINE_WIDTH: 0.278414
G1 X107.471 Y108.253 E.0018
; LINE_WIDTH: 0.315802
G3 X107.965 Y107.651 I1.609 J.816 E.00942
; LINE_WIDTH: 0.299767
G3 X108.358 Y107.424 I.866 J1.046 E.00516
; LINE_WIDTH: 0.259574
G3 X108.497 Y107.37 I.613 J1.364 E.00146
; LINE_WIDTH: 0.22056
G3 X108.747 Y107.315 I.736 J2.75 E.00208
; LINE_WIDTH: 0.172966
G1 X108.906 Y107.291 E.00099
; LINE_WIDTH: 0.11119
G3 X109.29 Y107.272 I.388 J3.855 E.00141
G1 X124.506 Y107.272 E.05563
G1 X124.882 Y107.29 E.00138
; LINE_WIDTH: 0.171189
G1 X125.053 Y107.315 E.00105
; LINE_WIDTH: 0.209084
G1 X125.167 Y107.337 E.00089
; LINE_WIDTH: 0.233145
G3 X125.303 Y107.37 I-.272 J1.391 E.0012
G1 X125.334 Y107.381 E.00028
; LINE_WIDTH: 0.276919
G3 X125.596 Y107.495 I-1.056 J2.78 E.00298
; LINE_WIDTH: 0.312502
G3 X126.352 Y108.305 I-.761 J1.47 E.0134
; LINE_WIDTH: 0.265257
G3 X126.431 Y108.497 I-2.412 J1.089 E.00207
; LINE_WIDTH: 0.226189
G1 X126.474 Y108.686 E.00162
; LINE_WIDTH: 0.194489
G1 X126.496 Y108.815 E.00092
; LINE_WIDTH: 0.164428
G1 X126.509 Y108.906 E.00053
; LINE_WIDTH: 0.111984
G3 X126.529 Y109.29 I-3.883 J.389 E.00142
G1 X126.528 Y124.506 E.05612
G1 X126.51 Y124.882 E.00139
; LINE_WIDTH: 0.171204
G1 X126.485 Y125.053 E.00105
; LINE_WIDTH: 0.209183
G1 X126.463 Y125.168 E.0009
; LINE_WIDTH: 0.240485
G3 X126.396 Y125.393 I-.93 J-.156 E.00209
; LINE_WIDTH: 0.278884
G1 X126.328 Y125.548 E.00178
; LINE_WIDTH: 0.309892
G3 X125.441 Y126.376 I-1.503 J-.72 E.0146
; LINE_WIDTH: 0.258359
G1 X125.303 Y126.43 E.00143
; LINE_WIDTH: 0.226145
G1 X125.114 Y126.474 E.00162
; LINE_WIDTH: 0.194489
G1 X124.985 Y126.496 E.00092
; LINE_WIDTH: 0.164428
G1 X124.894 Y126.509 E.00053
; LINE_WIDTH: 0.111965
G3 X124.51 Y126.529 I-.389 J-3.883 E.00142
G1 X109.294 Y126.528 E.05611
G1 X108.918 Y126.51 E.00139
; LINE_WIDTH: 0.171198
G1 X108.747 Y126.485 E.00105
; LINE_WIDTH: 0.219369
G3 X108.52 Y126.438 I.491 J-2.921 E.00188
; LINE_WIDTH: 0.255759
G3 X108.359 Y126.376 I.497 J-1.543 E.00164
; LINE_WIDTH: 0.283958
G1 X108.253 Y126.329 E.00125
; LINE_WIDTH: 0.315825
G3 X107.651 Y125.835 I.859 J-1.661 E.00941
; LINE_WIDTH: 0.299665
G3 X107.424 Y125.441 I1.071 J-.881 E.00518
; LINE_WIDTH: 0.258369
G1 X107.392 Y125.359 E.00085
; WIPE_START
G1 F15000
G1 X107.326 Y125.114 E-.09627
G1 X107.304 Y124.985 E-.04978
G1 X107.291 Y124.894 E-.03469
G1 X107.271 Y124.51 E-.14612
G1 X107.271 Y124.506 E-.00169
G1 X107.271 Y123.371 E-.43146
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.121 Y118.468 Z8.7 F42000
G1 X116.03 Y116.03 Z8.7
G1 Z8.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.271 J.864 E.03332
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.78 Y115.693 E-.14148
G1 X114.883 Y115.528 E-.074
G1 X114.897 Y115.51 E-.00868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.093 Y114.597 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G3 X117.044 Y114.464 I.873 J2.774 E.01567
G3 X117.714 Y114.6 I-.193 J2.674 E.01112
G1 X116.153 Y114.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.562 Y114.484 E-.16122
G1 X117.044 Y114.464 E-.18358
G1 X117.43 Y114.518 E-.14786
G1 X117.714 Y114.6 E-.1123
G1 X117.306 Y114.599 E-.15504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.068 J2.302 E.03114
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.0496
G1 X118.292 Y114.899 E-.17502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y117.71 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X119.2 Y116.087 E.02635
G1 X119.217 Y116.135 E.00082
G3 X119.219 Y117.653 I-2.386 J.762 E.02505
; WIPE_START
G1 F3600
M204 S6000
G1 X119.2 Y116.087 E-.59517
G1 X119.217 Y116.135 E-.01923
G1 X119.307 Y116.507 E-.14561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.249 J-1.076 E.03042
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53581
G1 X119.11 Y117.934 E-.06745
G1 X118.899 Y118.288 E-.15673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y119.202 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G3 X116.086 Y119.2 I-.808 J-2.336 E.02684
G1 X117.649 Y119.202 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117.43 Y119.282 E-.08869
G1 X116.951 Y119.339 E-.18337
G1 X116.466 Y119.301 E-.18479
G1 X116.086 Y119.2 E-.14918
G1 X116.492 Y119.2 E-.15397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.623 Y117.77 I.89 J-2.298 E.03327
G1 X115.97 Y117.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.825 Y119.09 E-.08485
G1 X115.508 Y118.902 E-.13977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
G1 F2814
M204 S5000
G1 X114.6 Y117.71 E.0263
G3 X114.581 Y116.147 I2.309 J-.81 E.02583
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.5939
G1 X114.491 Y117.286 E-.1661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 116
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
G1 Z8.7 F900 ; lower z a little
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

    G1 Z108.3 F600
    G1 Z106.3

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

