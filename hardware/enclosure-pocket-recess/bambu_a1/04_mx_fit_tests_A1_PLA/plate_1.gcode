; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 18m 9s; total estimated time: 24m 57s
; total layer number: 53
; total filament length [mm] : 911.29
; total filament volume [cm^3] : 2191.91
; total filament weight [g] : 2.72
; model label id: 83,94,105,116
; object max height: 1.50,1.50,1.50,5.30
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 5.30
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
M73 P0 R24
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
M73 P2 R24
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R24
G1 X-48.2 F3000
M73 P4 R23
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
M73 P6 R23
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
M73 P24 R18
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
M73 P25 R18
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
; layer num/total_layer_count: 1/53
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X123.382 Y148.425 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X123.382 Y149.382 E.01866
G1 X106.618 Y149.382 E.32686
M73 P26 R18
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
M73 P27 R18
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
M73 P27 R17
G1 X104.006 Y152.675 E.42863
M73 P28 R17
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
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X124.553 Y130.473 F42000
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
M73 P29 R17
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
; OBJECT_ID: 83
; WIPE_START
G1 X104.689 Y150.769 E-.4073
G1 X104.689 Y150.088 E-.25865
G1 X104.864 Y150.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S6000
G1 X112.489 Y149.93 Z.5 F42000
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
G3 X130.024 Y129.804 I.205 J-.015 E.00689
G1 X130.489 Y129.804 E.00907
M73 P30 R17
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
M73 P31 R17
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
M73 P31 R16
G1 X130.689 Y148.727 E.07168
G1 X130.689 Y149.407 E.01335
G1 X132.593 Y151.311 E.0528
G1 X131.912 Y151.311 E.01335
G1 X130.689 Y150.088 E.03392
G1 X130.689 Y150.769 E.01335
G1 X131.447 Y151.527 E.02102
; OBJECT_ID: 94
; WIPE_START
G1 X130.689 Y150.769 E-.4073
G1 X130.689 Y150.088 E-.25865
G1 X130.864 Y150.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S6000
G1 X135.078 Y143.899 Z.5 F42000
G1 X149.332 Y122.375 Z.5
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
M73 P32 R16
G1 X149.332 Y122.315 E.30508
M204 S6000
G1 X148.854 Y122.375 F42000
G1 F1500
M204 S500
G1 X148.854 Y122.854 E.00933
G1 X133.146 Y122.854 E.30625
G1 X133.146 Y107.146 E.30625
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
G3 X152.196 Y103.988 I.017 J.201 E.00619
G1 X152.195 Y126.008 E.42934
G3 X151.976 Y126.197 I-.204 J-.015 E.00626
G1 X130.016 Y126.197 E.42817
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
G1 X134.845 Y119.476 Z.5 F42000
G1 X150.553 Y104.474 Z.5
M73 P33 R16
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
M73 P34 R16
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
; OBJECT_ID: 116
; WIPE_START
G1 X130.689 Y124.769 E-.4073
G1 X130.689 Y124.088 E-.25865
G1 X130.864 Y124.263 E-.09405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S6000
G1 X127.319 Y117.504 Z.5 F42000
G1 X124.215 Y111.585 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X124.232 Y111.755 E.00333
G1 X124.232 Y124.045 E.23964
G1 X124.215 Y124.215 E.00333
G1 X124.045 Y124.232 E.00333
G1 X111.755 Y124.232 E.23964
G1 X111.585 Y124.215 E.00333
G1 X111.568 Y124.045 E.00333
G1 X111.568 Y111.755 E.23964
G1 X111.585 Y111.585 E.00333
G3 X112.188 Y111.568 I.387 J3.05 E.01179
G1 X124.049 Y111.568 E.23125
G1 X124.156 Y111.579 E.00209
M204 S6000
G1 X124.523 Y111.277 F42000
G1 F1500
M204 S500
G3 X124.711 Y111.731 I-.451 J.452 E.00984
G1 X124.711 Y124.069 E.24056
G3 X124.069 Y124.711 I-.639 J.002 E.01967
G1 X111.731 Y124.711 E.24056
G3 X111.089 Y124.069 I-.002 J-.639 E.01967
G1 X111.089 Y111.731 E.24056
G3 X111.731 Y111.089 I.639 J-.002 E.01967
G1 X112.188 Y111.089 E.00891
G1 X124.073 Y111.09 E.23171
G3 X124.479 Y111.236 I-.001 J.639 E.00859
M204 S6000
G1 X124.87 Y110.93 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X125.189 Y111.707 I-.77 J.77 E.01682
G1 X125.189 Y124.092 E.24148
G3 X124.093 Y125.189 I-1.09 J.007 E.03365
G1 X111.708 Y125.189 E.24148
G3 X110.611 Y124.093 I-.007 J-1.09 E.03365
G1 X110.611 Y111.708 E.24148
G3 X111.707 Y110.611 I1.09 J-.007 E.03365
G1 X112.188 Y110.611 E.00937
G1 X124.096 Y110.611 E.23217
G3 X124.826 Y110.889 I.004 J1.089 E.01558
; WIPE_START
G1 X125.006 Y111.092 E-.10298
G1 X125.105 Y111.279 E-.08039
G1 X125.167 Y111.481 E-.08038
G1 X125.189 Y111.707 E-.0865
G1 X125.189 Y112.786 E-.40976
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.061 Y111.76 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50579
G1 F2400
M204 S500
G1 X123.825 Y112.524 E.02133
G1 X123.825 Y113.209 E.01352
G1 X122.591 Y111.975 E.03444
G1 X121.906 Y111.975 E.01352
G1 X123.825 Y113.894 E.05355
G1 X123.825 Y114.579 E.01352
G1 X121.221 Y111.975 E.07267
G1 X120.537 Y111.975 E.01352
G1 X123.825 Y115.264 E.09178
G1 X123.825 Y115.949 E.01352
G1 X119.852 Y111.975 E.1109
G1 X119.167 Y111.975 E.01352
G1 X123.825 Y116.634 E.13001
G1 X123.825 Y117.319 E.01352
G1 X118.482 Y111.975 E.14913
G1 X117.797 Y111.975 E.01352
G1 X123.825 Y118.004 E.16825
G1 X123.825 Y118.689 E.01352
G1 X117.112 Y111.975 E.18736
G1 X116.427 Y111.975 E.01352
G1 X123.825 Y119.373 E.20648
G1 X123.825 Y120.058 E.01352
G1 X115.742 Y111.975 E.22559
G1 X115.057 Y111.975 E.01352
G1 X123.825 Y120.743 E.24471
G1 X123.825 Y121.428 E.01352
G1 X114.372 Y111.975 E.26382
G1 X113.687 Y111.975 E.01352
G1 X123.825 Y122.113 E.28294
G1 X123.825 Y122.798 E.01352
G1 X113.002 Y111.975 E.30205
G1 X112.317 Y111.975 E.01352
G1 X123.825 Y123.483 E.32117
G1 X123.825 Y123.825 E.00675
G1 X123.483 Y123.825 E.00676
G1 X111.975 Y112.317 E.32116
G1 X111.975 Y113.002 E.01352
G1 X122.798 Y123.825 E.30204
M73 P35 R16
G1 X122.113 Y123.825 E.01352
G1 X111.975 Y113.687 E.28293
G1 X111.975 Y114.372 E.01352
G1 X121.428 Y123.825 E.26381
G1 X120.743 Y123.825 E.01352
G1 X111.975 Y115.057 E.2447
G1 X111.975 Y115.742 E.01352
G1 X120.058 Y123.825 E.22558
G1 X119.373 Y123.825 E.01352
G1 X111.975 Y116.427 E.20647
G1 X111.975 Y117.112 E.01352
G1 X118.688 Y123.825 E.18735
G1 X118.003 Y123.825 E.01352
G1 X111.975 Y117.797 E.16824
G1 X111.975 Y118.482 E.01352
G1 X117.318 Y123.825 E.14912
G1 X116.633 Y123.825 E.01352
G1 X111.975 Y119.167 E.13001
G1 X111.975 Y119.852 E.01352
G1 X115.948 Y123.825 E.11089
G1 X115.263 Y123.825 E.01352
G1 X111.975 Y120.537 E.09178
G1 X111.975 Y121.222 E.01352
G1 X114.578 Y123.825 E.07266
G1 X113.893 Y123.825 E.01352
G1 X111.975 Y121.907 E.05355
G1 X111.975 Y122.592 E.01352
G1 X113.209 Y123.825 E.03443
G1 X112.524 Y123.825 E.01352
G1 X111.759 Y123.061 E.02133
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F2400
G1 X112.524 Y123.825 E-.41073
G1 X113.209 Y123.825 E-.26028
G1 X113.043 Y123.66 E-.08899
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 2/53
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S188.7
; open powerlost recovery
M1003 S1
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.5 I-1.126 J.462 P1  F42000
G1 X123.152 Y148.31 Z.5
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
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
M73 P35 R15
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
M73 P36 R15
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z.6 F42000
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
M73 P37 R15
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z.6 F42000
G1 X149.102 Y122.26 Z.6
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
G1 X135.004 Y119.855 Z.6 F42000
G1 X151.534 Y105.682 Z.6
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.719 Y110.364 Z.6 F42000
G1 X124.375 Y111.425 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.49 Y111.726 I-.278 J.279 E.0058
G1 X124.49 Y124.074 E.21559
G3 X124.074 Y124.49 I-.395 J.021 E.01161
G1 X111.726 Y124.49 E.21559
G3 X111.31 Y124.074 I-.021 J-.395 E.01161
G1 X111.31 Y111.726 E.21559
G3 X111.726 Y111.31 I.395 J-.021 E.0116
G1 X124.085 Y111.311 E.21578
G3 X124.329 Y111.386 I.013 J.393 E.00455
M204 S10000
G1 X124.683 Y111.117 F42000
G1 F6000
M204 S6000
G3 X124.919 Y111.705 I-.568 J.57 E.01137
G1 X124.919 Y124.095 E.21633
G3 X124.095 Y124.919 I-.811 J.014 E.02271
G1 X111.705 Y124.919 E.21633
G3 X110.881 Y124.095 I-.014 J-.811 E.02271
G1 X110.881 Y111.705 E.21633
G3 X111.705 Y110.881 I.811 J-.014 E.02271
G1 X124.106 Y110.882 E.21652
G3 X124.639 Y111.076 I.009 J.805 E.01012
M204 S250
G1 X124.978 Y110.821 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.977 Y110.823 E.00003
G3 X125.332 Y111.685 I-.856 J.857 E.01554
G1 X125.332 Y124.115 E.20184
G3 X124.115 Y125.332 I-1.213 J.005 E.03108
G1 X111.685 Y125.332 E.20184
G3 X110.468 Y124.115 I-.005 J-1.213 E.03108
G1 X110.468 Y111.685 E.20184
G3 X111.685 Y110.468 I1.213 J-.005 E.03108
G1 X124.126 Y110.469 E.20202
G3 X124.795 Y110.673 I-.005 J1.212 E.01151
G1 X124.931 Y110.783 E.00285
; WIPE_START
M204 S6000
G1 X124.977 Y110.823 E-.02307
G1 X125.128 Y111.005 E-.08981
G1 X125.24 Y111.213 E-.08982
G1 X125.308 Y111.439 E-.08984
G1 X125.332 Y111.685 E-.09376
G1 X125.332 Y112.668 E-.37371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.732 Y111.969 Z.6 F42000
G1 X112.428 Y111.482 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42184
G1 F15000
M204 S6000
G1 X111.661 Y112.248 E.01769
G1 X111.661 Y112.815 E.00924
G1 X112.815 Y111.661 E.02661
G1 X113.381 Y111.661 E.00924
G1 X111.661 Y113.381 E.03967
G1 X111.661 Y113.947 E.00924
G1 X113.947 Y111.661 E.05274
G1 X114.513 Y111.661 E.00924
G1 X111.661 Y114.513 E.0658
G1 X111.661 Y115.08 E.00924
G1 X115.079 Y111.661 E.07886
G1 X115.645 Y111.661 E.00924
G1 X111.661 Y115.646 E.09192
G1 X111.661 Y116.212 E.00924
G1 X116.212 Y111.661 E.10498
G1 X116.778 Y111.662 E.00924
G1 X111.661 Y116.778 E.11804
G1 X111.661 Y117.344 E.00924
G1 X117.344 Y111.662 E.1311
G1 X117.91 Y111.662 E.00924
G1 X111.661 Y117.911 E.14417
G1 X111.661 Y118.477 E.00924
G1 X118.476 Y111.662 E.15723
G1 X119.043 Y111.662 E.00924
G1 X111.661 Y119.043 E.17029
G1 X111.661 Y119.609 E.00924
G1 X119.609 Y111.662 E.18335
G1 X120.175 Y111.662 E.00924
G1 X111.661 Y120.176 E.19641
G1 X111.661 Y120.742 E.00924
G1 X120.741 Y111.662 E.20947
G1 X121.307 Y111.662 E.00924
G1 X111.661 Y121.308 E.22254
G1 X111.661 Y121.874 E.00924
G1 X121.873 Y111.662 E.2356
G1 X122.44 Y111.662 E.00924
G1 X111.661 Y122.441 E.24866
G1 X111.661 Y123.007 E.00924
G1 X123.006 Y111.662 E.26172
G1 X123.572 Y111.662 E.00924
G1 X111.661 Y123.573 E.27478
G1 X111.675 Y124.125 E.00901
G1 X124.125 Y111.675 E.28722
G1 X124.139 Y112.228 E.00901
G1 X112.228 Y124.139 E.2748
G1 X112.794 Y124.139 E.00924
G1 X124.139 Y112.794 E.26173
G1 X124.139 Y113.36 E.00924
G1 X113.36 Y124.139 E.24867
G1 X113.926 Y124.139 E.00924
G1 X124.139 Y113.926 E.23561
G1 X124.139 Y114.492 E.00924
G1 X114.492 Y124.139 E.22254
G1 X115.059 Y124.139 E.00924
G1 X124.139 Y115.059 E.20948
M73 P38 R15
G1 X124.139 Y115.625 E.00924
G1 X115.625 Y124.139 E.19642
G1 X116.191 Y124.139 E.00924
G1 X124.139 Y116.191 E.18336
G1 X124.139 Y116.757 E.00924
G1 X116.757 Y124.139 E.17029
G1 X117.324 Y124.139 E.00924
G1 X124.139 Y117.324 E.15723
G1 X124.139 Y117.89 E.00924
G1 X117.89 Y124.139 E.14417
G1 X118.456 Y124.139 E.00924
G1 X124.139 Y118.456 E.13111
G1 X124.139 Y119.022 E.00924
G1 X119.022 Y124.139 E.11804
G1 X119.588 Y124.139 E.00924
G1 X124.139 Y119.588 E.10498
G1 X124.139 Y120.155 E.00924
G1 X120.155 Y124.139 E.09192
G1 X120.721 Y124.139 E.00924
G1 X124.139 Y120.721 E.07885
G1 X124.139 Y121.287 E.00924
G1 X121.287 Y124.139 E.06579
G1 X121.853 Y124.139 E.00924
G1 X124.139 Y121.853 E.05273
G1 X124.139 Y122.42 E.00924
G1 X122.42 Y124.139 E.03967
G1 X122.986 Y124.139 E.00924
G1 X124.139 Y122.986 E.0266
G1 X124.139 Y123.552 E.00924
G1 X123.373 Y124.318 E.01768
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.139 Y123.552 E-.4118
G1 X124.139 Y122.986 E-.21517
G1 X123.891 Y123.233 E-.13304
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 3/53
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.216 J-.036 P1  F42000
G1 X123.152 Y148.31 Z.6
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
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
M73 P39 R15
G1 X105.666 Y131.688 E.0011
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z.7 F42000
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z.7 F42000
G1 X149.102 Y122.26 Z.7
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
M73 P39 R14
G1 X129.468 Y126.578 E-.05879
G1 X129.362 Y126.466 E-.05861
G1 X129.281 Y126.327 E-.06108
G1 X129.225 Y126.152 E-.06991
G1 X129.21 Y125.994 E-.06041
G1 X129.21 Y124.806 E-.45119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.006 Y119.841 Z.7 F42000
G1 X151.534 Y105.682 Z.7
G1 Z.3
M73 P40 R14
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.717 Y110.361 Z.7 F42000
G1 X124.4 Y111.4 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.519 Y111.709 I-.284 J.287 E.00596
G1 X124.519 Y124.091 E.21618
G3 X124.091 Y124.519 I-.407 J.021 E.01191
G1 X111.709 Y124.519 E.21618
G3 X111.281 Y124.091 I-.021 J-.407 E.01191
G1 X111.281 Y111.709 E.21618
G3 X111.709 Y111.281 I.407 J-.021 E.01191
G1 X124.109 Y111.283 E.2165
G3 X124.354 Y111.361 I.007 J.404 E.00457
M204 S10000
G1 X124.706 Y111.094 F42000
G1 F6000
M204 S6000
G3 X124.947 Y111.688 I-.579 J.581 E.01151
G1 X124.947 Y124.112 E.21692
G3 X124.112 Y124.947 I-.822 J.014 E.02302
G1 X111.688 Y124.947 E.21692
G3 X110.853 Y124.112 I-.014 J-.822 E.02302
G1 X110.853 Y111.688 E.21692
G3 X111.688 Y110.853 I.822 J-.014 E.02302
G1 X124.13 Y110.855 E.21724
G3 X124.662 Y111.053 I-.003 J.82 E.01013
M204 S250
G1 X125.001 Y110.795 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.002 Y110.798 E.00005
G3 X125.361 Y111.668 I-.863 J.865 E.01568
G1 X125.361 Y124.132 E.20239
G3 X124.132 Y125.361 I-1.224 J.004 E.03137
G1 X111.668 Y125.361 E.20239
G3 X110.439 Y124.132 I-.004 J-1.224 E.03137
G1 X110.439 Y111.668 E.20239
G3 X111.668 Y110.439 I1.224 J-.004 E.03137
G1 X124.151 Y110.441 E.20269
G3 X124.818 Y110.647 I-.012 J1.222 E.0115
G1 X124.954 Y110.757 E.00285
; WIPE_START
M204 S6000
G1 X125.002 Y110.798 E-.02376
G1 X125.155 Y110.981 E-.09061
G1 X125.267 Y111.192 E-.09067
G1 X125.336 Y111.42 E-.09069
G1 X125.361 Y111.668 E-.09461
G1 X125.361 Y112.641 E-.36966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.347 Y112.409 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42341
G1 F15000
M204 S6000
G1 X123.572 Y111.635 E.01794
G1 X123.004 Y111.634 E.00931
G1 X124.167 Y112.798 E.02695
G1 X124.167 Y113.367 E.00931
G1 X122.435 Y111.634 E.04012
G1 X121.867 Y111.634 E.00931
G1 X124.167 Y113.935 E.05329
G1 X124.167 Y114.503 E.00931
G1 X121.298 Y111.634 E.06645
G1 X120.729 Y111.634 E.00931
G1 X124.167 Y115.072 E.07962
G1 X124.167 Y115.64 E.00931
G1 X120.161 Y111.634 E.09279
G1 X119.592 Y111.634 E.00931
G1 X124.167 Y116.209 E.10596
G1 X124.167 Y116.777 E.00931
G1 X119.024 Y111.634 E.11912
G1 X118.455 Y111.634 E.00931
G1 X124.167 Y117.346 E.13229
G1 X124.167 Y117.914 E.00931
G1 X117.887 Y111.634 E.14546
G1 X117.318 Y111.634 E.00931
G1 X124.167 Y118.483 E.15863
G1 X124.167 Y119.051 E.00931
G1 X116.75 Y111.634 E.17179
G1 X116.181 Y111.633 E.00931
G1 X124.167 Y119.619 E.18496
G1 X124.167 Y120.188 E.00931
G1 X115.613 Y111.633 E.19813
G1 X115.044 Y111.633 E.00931
G1 X124.167 Y120.756 E.21129
G1 X124.167 Y121.325 E.00931
G1 X114.476 Y111.633 E.22446
G1 X113.907 Y111.633 E.00931
G1 X124.167 Y121.893 E.23763
G1 X124.167 Y122.462 E.00931
G1 X113.339 Y111.633 E.2508
G1 X112.77 Y111.633 E.00931
G1 X124.167 Y123.03 E.26396
G1 X124.167 Y123.599 E.00931
G1 X112.202 Y111.633 E.27713
G1 X111.739 Y111.633 E.00757
G1 X111.649 Y111.648 E.00151
G1 X124.151 Y124.151 E.28957
G1 X124.061 Y124.167 E.00151
G1 X123.599 Y124.167 E.00756
G1 X111.633 Y112.201 E.27714
G1 X111.633 Y112.769 E.00931
G1 X123.031 Y124.167 E.26398
G1 X122.462 Y124.167 E.00931
G1 X111.633 Y113.338 E.25081
G1 X111.633 Y113.906 E.00931
G1 X121.894 Y124.167 E.23765
G1 X121.325 Y124.167 E.00931
G1 X111.633 Y114.475 E.22448
G1 X111.633 Y115.043 E.00931
G1 X120.757 Y124.167 E.21132
G1 X120.188 Y124.167 E.00931
G1 X111.633 Y115.612 E.19815
G1 X111.633 Y116.18 E.00931
G1 X119.62 Y124.167 E.18499
G1 X119.051 Y124.167 E.00931
G1 X111.633 Y116.749 E.17182
G1 X111.633 Y117.317 E.00931
G1 X118.483 Y124.167 E.15866
G1 X117.915 Y124.167 E.00931
G1 X111.633 Y117.885 E.14549
G1 X111.633 Y118.454 E.00931
G1 X117.346 Y124.167 E.13232
G1 X116.778 Y124.167 E.00931
G1 X111.633 Y119.022 E.11916
G1 X111.633 Y119.591 E.00931
G1 X116.209 Y124.167 E.10599
G1 X115.641 Y124.167 E.00931
G1 X111.633 Y120.159 E.09283
G1 X111.633 Y120.728 E.00931
G1 X115.072 Y124.167 E.07966
G1 X114.504 Y124.167 E.00931
G1 X111.633 Y121.296 E.0665
G1 X111.633 Y121.865 E.00931
G1 X113.936 Y124.167 E.05333
G1 X113.367 Y124.167 E.00931
G1 X111.633 Y122.433 E.04017
G1 X111.633 Y123.001 E.00931
G1 X112.799 Y124.167 E.027
G1 X112.23 Y124.167 E.00931
G1 X111.453 Y123.391 E.01799
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X112.23 Y124.167 E-.41741
G1 X112.799 Y124.167 E-.21601
G1 X112.563 Y123.932 E-.12658
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 4/53
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S191.25
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I-1.116 J.485 P1  F42000
G1 X123.152 Y148.31 Z.7
G1 Z.4
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
M73 P41 R14
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
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X105.704 Y151.581 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X123.519 Y146.698 E-.65138
G1 X123.713 Y146.489 E-.10863
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.328 Y147.006 Z.8 F42000
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
M73 P42 R14
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
; OBJECT_ID: 94
; WIPE_START
G1 X149.419 Y146.785 E-.65138
G1 X149.617 Y146.579 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.455 Y138.948 Z.8 F42000
G1 X149.102 Y122.26 Z.8
G1 Z.4
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
G1 X131.704 Y125.581 Z.8 F42000
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
; OBJECT_ID: 116
; WIPE_START
G1 X149.469 Y120.742 E-.65138
G1 X149.665 Y120.534 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X142.49 Y117.931 Z.8 F42000
G1 X124.425 Y111.375 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X124.476 Y111.429 E.0013
G3 X124.547 Y111.692 I-.331 J.23 E.00486
G1 X124.547 Y124.108 E.21678
G3 X124.108 Y124.547 I-.419 J.02 E.01222
G1 X111.692 Y124.547 E.21678
G3 X111.253 Y124.108 I-.02 J-.419 E.01222
G1 X111.253 Y111.692 E.21678
G3 X111.692 Y111.253 I.419 J-.02 E.01222
G1 X124.108 Y111.253 E.21678
G1 X124.234 Y111.265 E.00222
G3 X124.371 Y111.324 I-.089 J.393 E.00261
G1 X124.381 Y111.334 E.00025
M204 S10000
G1 X124.732 Y111.068 F42000
G1 F6000
M204 S6000
G3 X124.976 Y111.671 I-.589 J.589 E.01166
G1 X124.976 Y124.129 E.21751
G3 X124.129 Y124.976 I-.833 J.013 E.02333
G1 X111.671 Y124.976 E.21751
G3 X110.824 Y124.129 I-.013 J-.833 E.02333
G1 X110.824 Y111.671 E.21751
G3 X111.671 Y110.824 I.833 J-.013 E.02333
G1 X124.129 Y110.824 E.21751
G1 X124.318 Y110.843 E.00332
G3 X124.688 Y111.028 I-.176 J.815 E.00729
M204 S250
G1 X125.025 Y110.769 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.027 Y110.773 E.00007
G3 X125.389 Y111.651 I-.872 J.873 E.01583
G1 X125.389 Y124.149 E.20295
G3 X124.149 Y125.389 I-1.235 J.004 E.03166
G1 X111.651 Y125.389 E.20295
G3 X110.411 Y124.149 I-.004 J-1.235 E.03166
G1 X110.411 Y111.651 E.20295
G3 X111.651 Y110.411 I1.235 J-.004 E.03166
G1 X124.165 Y110.412 E.2032
G3 X124.841 Y110.621 I-.009 J1.234 E.01166
G1 X124.978 Y110.731 E.00286
; WIPE_START
M204 S6000
G1 X125.027 Y110.773 E-.02443
G1 X125.181 Y110.958 E-.09144
G1 X125.295 Y111.17 E-.09152
G1 X125.364 Y111.401 E-.09154
G1 X125.389 Y111.651 E-.09544
G1 X125.389 Y112.613 E-.36562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.788 Y111.918 Z.8 F42000
G1 X112.391 Y111.425 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42499
G1 F15000
M204 S6000
G1 X111.604 Y112.211 E.01828
G1 X111.604 Y112.782 E.00938
G1 X112.782 Y111.604 E.02738
G1 X113.353 Y111.604 E.00938
G1 X111.604 Y113.353 E.04065
G1 X111.604 Y113.923 E.00938
G1 X113.923 Y111.604 E.05392
G1 X114.494 Y111.604 E.00938
G1 X111.604 Y114.494 E.06719
G1 X111.604 Y115.065 E.00938
G1 X115.065 Y111.604 E.08045
G1 X115.635 Y111.604 E.00938
G1 X111.604 Y115.635 E.09372
G1 X111.604 Y116.206 E.00938
G1 X116.206 Y111.604 E.10699
G1 X116.777 Y111.604 E.00938
G1 X111.604 Y116.777 E.12026
G1 X111.604 Y117.347 E.00938
G1 X117.347 Y111.604 E.13353
G1 X117.918 Y111.604 E.00938
G1 X111.604 Y117.918 E.1468
G1 X111.604 Y118.489 E.00938
G1 X118.489 Y111.604 E.16007
G1 X119.059 Y111.604 E.00938
G1 X111.604 Y119.059 E.17334
G1 X111.604 Y119.63 E.00938
G1 X119.63 Y111.604 E.18661
G1 X120.201 Y111.604 E.00938
G1 X111.604 Y120.201 E.19988
G1 X111.604 Y120.771 E.00938
G1 X120.771 Y111.604 E.21315
G1 X121.342 Y111.604 E.00938
G1 X111.604 Y121.342 E.22642
G1 X111.604 Y121.913 E.00938
G1 X121.913 Y111.604 E.23968
G1 X122.483 Y111.604 E.00938
G1 X111.604 Y122.483 E.25295
G1 X111.604 Y123.054 E.00938
G1 X123.054 Y111.604 E.26622
G1 X123.625 Y111.604 E.00938
G1 X111.604 Y123.625 E.27949
G1 X111.604 Y124.078 E.00744
G2 X111.624 Y124.176 I.121 J.028 E.0017
G1 X124.176 Y111.624 E.29187
G1 X124.19 Y111.652 E.00052
G3 X124.196 Y112.175 I-2.652 J.29 E.00861
G1 X112.175 Y124.196 E.27949
G1 X112.746 Y124.196 E.00938
G1 X124.196 Y112.746 E.26622
G1 X124.196 Y113.316 E.00938
G1 X113.316 Y124.196 E.25295
M73 P43 R14
G1 X113.887 Y124.196 E.00938
G1 X124.196 Y113.887 E.23969
G1 X124.196 Y114.458 E.00938
G1 X114.458 Y124.196 E.22642
G1 X115.029 Y124.196 E.00938
G1 X124.196 Y115.029 E.21315
G1 X124.196 Y115.599 E.00938
G1 X115.599 Y124.196 E.19988
G1 X116.17 Y124.196 E.00938
G1 X124.196 Y116.17 E.18661
G1 X124.196 Y116.741 E.00938
G1 X116.741 Y124.196 E.17334
G1 X117.311 Y124.196 E.00938
G1 X124.196 Y117.311 E.16007
G1 X124.196 Y117.882 E.00938
G1 X117.882 Y124.196 E.1468
G1 X118.453 Y124.196 E.00938
G1 X124.196 Y118.453 E.13353
G1 X124.196 Y119.023 E.00938
G1 X119.023 Y124.196 E.12026
G1 X119.594 Y124.196 E.00938
G1 X124.196 Y119.594 E.10699
G1 X124.196 Y120.165 E.00938
G1 X120.165 Y124.196 E.09373
G1 X120.735 Y124.196 E.00938
G1 X124.196 Y120.735 E.08046
G1 X124.196 Y121.306 E.00938
G1 X121.306 Y124.196 E.06719
G1 X121.877 Y124.196 E.00938
G1 X124.196 Y121.877 E.05392
G1 X124.196 Y122.447 E.00938
G1 X122.447 Y124.196 E.04065
G1 X123.018 Y124.196 E.00938
G1 X124.196 Y123.018 E.02738
G1 X124.196 Y123.589 E.00938
G1 X123.409 Y124.375 E.01828
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.196 Y123.589 E-.4225
G1 X124.196 Y123.018 E-.21686
G1 X123.971 Y123.242 E-.12064
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 5/53
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-1.216 J-.04 P1  F42000
G1 X123.152 Y148.31 Z.8
G1 Z.5
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
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X105.671 Y151.581 F42000
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
M73 P43 R13
G1 X124.201 Y151.346 E.01236
G1 X124.166 Y151.581 E.00416
G1 X125.581 Y151.581 E.02471
G1 X125.581 Y151.283 E.00522
; OBJECT_ID: 83
; WIPE_START
G1 X125.581 Y151.581 E-.11358
G1 X124.166 Y151.581 E-.5378
G1 X124.201 Y151.346 E-.09059
G1 X124.19 Y151.299 E-.01803
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.764 Y150.358 Z.9 F42000
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
M73 P44 R13
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
; OBJECT_ID: 94
; WIPE_START
G1 X149.419 Y146.871 E-.65138
G1 X149.647 Y146.699 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.477 Y139.068 Z.9 F42000
G1 X149.102 Y122.26 Z.9
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
G1 X131.671 Y125.581 Z.9 F42000
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
M73 P45 R13
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
; OBJECT_ID: 116
; WIPE_START
G1 X151.581 Y125.581 E-.11358
G1 X150.166 Y125.581 E-.5378
G1 X150.201 Y125.346 E-.09059
G1 X150.19 Y125.299 E-.01803
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X143.479 Y121.663 Z.9 F42000
G1 X124.45 Y111.351 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X124.503 Y111.406 E.00134
G3 X124.575 Y111.675 I-.341 J.236 E.00498
G1 X124.575 Y124.125 E.21737
G3 X124.125 Y124.575 I-.431 J.02 E.01252
G1 X111.675 Y124.575 E.21737
G3 X111.225 Y124.125 I-.02 J-.431 E.01252
G1 X111.225 Y111.675 E.21737
G3 X111.675 Y111.225 I.431 J-.02 E.01252
G1 X124.125 Y111.225 E.21737
G1 X124.253 Y111.237 E.00225
G3 X124.394 Y111.298 I-.091 J.405 E.00269
G1 X124.406 Y111.309 E.00029
M204 S10000
G1 X124.756 Y111.044 F42000
G1 F6000
M204 S6000
G3 X125.004 Y111.654 I-.598 J.598 E.01182
G1 X125.004 Y124.146 E.21811
G3 X124.146 Y125.004 I-.845 J.013 E.02364
G1 X111.654 Y125.004 E.21811
G3 X110.796 Y124.146 I-.013 J-.845 E.02364
G1 X110.796 Y111.654 E.21811
G3 X111.654 Y110.796 I.845 J-.013 E.02364
G1 X124.146 Y110.796 E.2181
G1 X124.337 Y110.815 E.00336
G3 X124.713 Y111.003 I-.178 J.826 E.0074
M204 S250
G1 X125.048 Y110.743 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.052 Y110.748 E.0001
G3 X125.417 Y111.634 I-.879 J.881 E.01597
G1 X125.417 Y124.166 E.2035
G3 X124.166 Y125.417 I-1.247 J.005 E.03195
G1 X111.634 Y125.417 E.2035
G3 X110.383 Y124.166 I-.005 J-1.247 E.03195
G1 X110.383 Y111.634 E.2035
G3 X111.634 Y110.383 I1.247 J-.005 E.03195
G1 X124.189 Y110.385 E.20387
G3 X124.864 Y110.594 I-.016 J1.244 E.01164
G1 X125.002 Y110.705 E.00287
; WIPE_START
M204 S6000
G1 X125.052 Y110.748 E-.02507
G1 X125.207 Y110.935 E-.0923
G1 X125.322 Y111.149 E-.09235
G1 X125.393 Y111.382 E-.09239
G1 X125.417 Y111.634 E-.09627
G1 X125.417 Y112.585 E-.36161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.403 Y111.806 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42645
G1 F15000
M204 S6000
G1 X124.188 Y111.591 E.00502
G2 X124.107 Y111.576 I-.065 J.126 E.00137
G1 X123.601 Y111.576 E.00836
G1 X124.224 Y112.199 E.01454
G1 X124.224 Y112.772 E.00945
G1 X123.028 Y111.576 E.02791
G1 X122.455 Y111.576 E.00945
G1 X124.224 Y113.345 E.04127
G1 X124.224 Y113.917 E.00945
G1 X121.883 Y111.576 E.05464
G1 X121.31 Y111.576 E.00945
G1 X124.224 Y114.49 E.068
G1 X124.224 Y115.063 E.00945
G1 X120.737 Y111.576 E.08137
G1 X120.164 Y111.576 E.00945
G1 X124.224 Y115.636 E.09473
G1 X124.224 Y116.208 E.00945
G1 X119.592 Y111.576 E.1081
G1 X119.019 Y111.576 E.00945
G1 X124.224 Y116.781 E.12146
G1 X124.224 Y117.354 E.00945
G1 X118.446 Y111.576 E.13483
G1 X117.873 Y111.576 E.00945
G1 X124.224 Y117.927 E.14819
G1 X124.224 Y118.499 E.00945
G1 X117.301 Y111.576 E.16156
G1 X116.728 Y111.576 E.00945
G1 X124.224 Y119.072 E.17492
G1 X124.224 Y119.645 E.00945
G1 X116.155 Y111.576 E.18829
G1 X115.582 Y111.576 E.00945
G1 X124.224 Y120.218 E.20165
G1 X124.224 Y120.79 E.00945
G1 X115.01 Y111.576 E.21502
G1 X114.437 Y111.576 E.00945
G1 X124.224 Y121.363 E.22839
G1 X124.224 Y121.936 E.00945
G1 X113.864 Y111.576 E.24175
G1 X113.291 Y111.576 E.00945
G1 X124.224 Y122.509 E.25512
G1 X124.224 Y123.081 E.00945
G1 X112.719 Y111.576 E.26848
G1 X112.146 Y111.576 E.00945
G1 X124.224 Y123.654 E.28185
G1 X124.224 Y124.094 E.00726
G3 X124.2 Y124.203 I-.113 J.031 E.00191
G1 X111.597 Y111.6 E.29408
G2 X111.576 Y111.706 I.108 J.077 E.00182
G1 X111.576 Y112.152 E.00736
G1 X123.648 Y124.224 E.28171
G1 X123.075 Y124.224 E.00945
G1 X111.576 Y112.725 E.26834
G1 X111.576 Y113.297 E.00945
G1 X122.503 Y124.224 E.25498
G1 X121.93 Y124.224 E.00945
G1 X111.576 Y113.87 E.24161
G1 X111.576 Y114.443 E.00945
G1 X121.357 Y124.224 E.22824
G1 X120.784 Y124.224 E.00945
G1 X111.576 Y115.016 E.21488
G1 X111.576 Y115.588 E.00945
G1 X120.212 Y124.224 E.20151
G1 X119.639 Y124.224 E.00945
G1 X111.576 Y116.161 E.18815
G1 X111.576 Y116.734 E.00945
G1 X119.066 Y124.224 E.17478
G1 X118.493 Y124.224 E.00945
G1 X111.576 Y117.307 E.16142
G1 X111.576 Y117.879 E.00945
G1 X117.921 Y124.224 E.14805
G1 X117.348 Y124.224 E.00945
G1 X111.576 Y118.452 E.13469
G1 X111.576 Y119.025 E.00945
G1 X116.775 Y124.224 E.12132
G1 X116.202 Y124.224 E.00945
G1 X111.576 Y119.598 E.10796
G1 X111.576 Y120.17 E.00945
G1 X115.63 Y124.224 E.09459
G1 X115.057 Y124.224 E.00945
G1 X111.576 Y120.743 E.08123
G1 X111.576 Y121.316 E.00945
G1 X114.484 Y124.224 E.06786
G1 X113.911 Y124.224 E.00945
G1 X111.576 Y121.889 E.0545
G1 X111.576 Y122.461 E.00945
G1 X113.339 Y124.224 E.04113
G1 X112.766 Y124.224 E.00945
G1 X111.576 Y123.034 E.02776
G1 X111.576 Y123.607 E.00945
G1 X112.373 Y124.403 E.01858
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.576 Y123.607 E-.42799
G1 X111.576 Y123.034 E-.21764
G1 X111.789 Y123.247 E-.11437
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 6/53
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S186.15
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I-1.108 J.503 P1  F42000
G1 X123.152 Y148.31 Z.9
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
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X104.466 Y151.534 F42000
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
G1 E-.04 F1800
M204 S10000
G1 X110.246 Y144.49 Z1 F42000
G1 X125.135 Y131.653 Z1
G1 Z.6
G1 E.8 F1800
G1 F12000
M204 S6000
M73 P46 R13
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
; OBJECT_ID: 83
; WIPE_START
G1 X124.299 Y131.653 E-.11246
G1 X124.37 Y131.694 E-.41052
G1 X124.394 Y131.653 E-.23702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.731 Y135.908 Z1 F42000
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
M73 P47 R13
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
; OBJECT_ID: 94
; WIPE_START
G1 X150.257 Y131.766 E-.19275
G1 X150.226 Y131.712 E-.18909
G1 X150.257 Y131.658 E-.18909
G1 X150.319 Y131.658 E-.18907
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.339 Y124.088 Z1 F42000
G1 X149.102 Y122.26 Z1
G1 Z.6
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
G1 X130.466 Y125.534 Z1 F42000
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
; OBJECT_ID: 116
; WIPE_START
G1 X150.29 Y105.73 E-.17686
G1 X150.262 Y105.682 E-.19439
G1 X150.29 Y105.635 E-.19439
G1 X150.345 Y105.635 E-.19437
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X142.891 Y107.274 Z1 F42000
G1 X124.474 Y111.326 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.529 Y111.382 E.00138
G3 X124.604 Y111.658 I-.35 J.243 E.00509
G1 X124.604 Y124.142 E.21796
G3 X124.142 Y124.604 I-.442 J.02 E.01283
G1 X111.658 Y124.604 E.21796
G3 X111.196 Y124.142 I-.02 J-.442 E.01283
G1 X111.196 Y111.658 E.21796
G3 X111.658 Y111.196 I.442 J-.02 E.01283
G1 X124.142 Y111.196 E.21796
G1 X124.272 Y111.209 E.00229
G3 X124.417 Y111.272 I-.094 J.416 E.00277
G1 X124.431 Y111.285 E.00033
M204 S10000
G1 X124.783 Y111.017 F42000
G1 F6000
M204 S6000
G3 X125.032 Y111.637 I-.601 J.602 E.01199
G1 X125.032 Y124.163 E.2187
G3 X124.163 Y125.032 I-.856 J.013 E.02395
G1 X111.637 Y125.032 E.2187
G3 X110.768 Y124.163 I-.013 J-.856 E.02395
G1 X110.768 Y111.637 E.2187
G3 X111.637 Y110.768 I.856 J-.013 E.02395
G1 X124.173 Y110.769 E.21887
G3 X124.739 Y110.976 I.009 J.851 E.01076
M204 S250
G1 X125.072 Y110.717 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.077 Y110.723 E.00013
G3 X125.446 Y111.617 I-.886 J.889 E.01612
G1 X125.446 Y124.183 E.20405
G3 X124.183 Y125.446 I-1.258 J.004 E.03224
G1 X111.617 Y125.446 E.20405
M73 P47 R12
G3 X110.354 Y124.183 I-.004 J-1.258 E.03224
G1 X110.354 Y111.617 E.20405
G3 X111.617 Y110.354 I1.258 J-.004 E.03224
G1 X124.213 Y110.357 E.20454
G3 X124.887 Y110.568 I-.023 J1.255 E.01162
G1 X125.025 Y110.679 E.00288
; WIPE_START
M204 S6000
G1 X125.077 Y110.723 E-.0257
G1 X125.234 Y110.911 E-.09314
G1 X125.349 Y111.128 E-.09321
G1 X125.421 Y111.363 E-.09321
G1 X125.446 Y111.617 E-.09714
G1 X125.446 Y112.558 E-.35761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.842 Y111.896 Z1 F42000
G1 X111.779 Y111.369 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42813
G1 F15000
M204 S6000
G1 X111.573 Y111.574 E.00482
G2 X111.548 Y111.689 I.117 J.086 E.002
G1 X111.548 Y112.175 E.00805
G1 X112.175 Y111.548 E.01469
M73 P48 R12
G1 X112.75 Y111.548 E.00953
G1 X111.548 Y112.75 E.02816
G1 X111.548 Y113.325 E.00953
G1 X113.325 Y111.548 E.04164
G1 X113.9 Y111.548 E.00953
G1 X111.548 Y113.9 E.05512
G1 X111.548 Y114.475 E.00953
G1 X114.475 Y111.548 E.06859
G1 X115.05 Y111.548 E.00953
G1 X111.548 Y115.05 E.08207
G1 X111.548 Y115.625 E.00953
G1 X115.625 Y111.548 E.09555
G1 X116.2 Y111.548 E.00953
G1 X111.548 Y116.2 E.10902
G1 X111.548 Y116.776 E.00953
G1 X116.776 Y111.548 E.1225
G1 X117.351 Y111.548 E.00953
G1 X111.548 Y117.351 E.13597
G1 X111.548 Y117.926 E.00953
G1 X117.926 Y111.548 E.14945
G1 X118.501 Y111.548 E.00953
G1 X111.548 Y118.501 E.16293
G1 X111.548 Y119.076 E.00953
G1 X119.076 Y111.548 E.1764
G1 X119.651 Y111.548 E.00953
G1 X111.548 Y119.651 E.18988
G1 X111.548 Y120.226 E.00953
G1 X120.226 Y111.548 E.20336
G1 X120.801 Y111.548 E.00953
G1 X111.548 Y120.801 E.21683
G1 X111.548 Y121.377 E.00953
G1 X121.377 Y111.548 E.23031
G1 X121.952 Y111.548 E.00953
G1 X111.548 Y121.952 E.24379
G1 X111.548 Y122.527 E.00953
G1 X122.527 Y111.548 E.25726
G1 X123.102 Y111.548 E.00953
G1 X111.548 Y123.102 E.27074
G1 X111.548 Y123.677 E.00953
G1 X123.677 Y111.548 E.28421
G1 X124.124 Y111.548 E.00741
G3 X124.226 Y111.574 I.016 J.149 E.00178
G1 X111.574 Y124.226 E.29647
G2 X111.689 Y124.252 I.089 J-.127 E.002
G1 X112.123 Y124.252 E.0072
G1 X124.252 Y112.123 E.28422
G1 X124.252 Y112.698 E.00953
G1 X112.698 Y124.252 E.27074
G1 X113.273 Y124.252 E.00953
G1 X124.252 Y113.273 E.25726
G1 X124.252 Y113.848 E.00953
G1 X113.848 Y124.252 E.24379
G1 X114.423 Y124.252 E.00953
G1 X124.252 Y114.423 E.23031
G1 X124.252 Y114.999 E.00953
G1 X114.999 Y124.252 E.21683
G1 X115.574 Y124.252 E.00953
G1 X124.252 Y115.574 E.20336
G1 X124.252 Y116.149 E.00953
G1 X116.149 Y124.252 E.18988
G1 X116.724 Y124.252 E.00953
G1 X124.252 Y116.724 E.1764
G1 X124.252 Y117.299 E.00953
G1 X117.299 Y124.252 E.16293
G1 X117.874 Y124.252 E.00953
G1 X124.252 Y117.874 E.14945
G1 X124.252 Y118.449 E.00953
G1 X118.449 Y124.252 E.13598
G1 X119.024 Y124.252 E.00953
G1 X124.252 Y119.024 E.1225
G1 X124.252 Y119.599 E.00953
G1 X119.6 Y124.252 E.10902
G1 X120.175 Y124.252 E.00953
G1 X124.252 Y120.175 E.09555
G1 X124.252 Y120.75 E.00953
G1 X120.75 Y124.252 E.08207
G1 X121.325 Y124.252 E.00953
G1 X124.252 Y121.325 E.06859
G1 X124.252 Y121.9 E.00953
G1 X121.9 Y124.252 E.05512
G1 X122.475 Y124.252 E.00953
G1 X124.252 Y122.475 E.04164
G1 X124.252 Y123.05 E.00953
G1 X123.05 Y124.252 E.02816
G1 X123.625 Y124.252 E.00953
G1 X124.252 Y123.625 E.01469
G1 X124.252 Y124.111 E.00805
G3 X124.227 Y124.226 I-.142 J.029 E.00199
G1 X124.021 Y124.431 E.00483
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.227 Y124.226 E-.11069
G1 X124.252 Y124.111 E-.04442
G1 X124.252 Y123.625 E-.18468
G1 X123.625 Y124.252 E-.33685
G1 X123.406 Y124.252 E-.08336
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 7/53
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S188.7
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-1.217 J-.013 P1  F42000
G1 X123.152 Y148.31 Z1
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
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
M73 P49 R12
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.1 F42000
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.1 F42000
G1 X149.102 Y122.26 Z1.1
G1 Z.7
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
M73 P50 R12
G1 X129.362 Y126.466 E-.05872
G1 X129.284 Y126.332 E-.05889
G1 X129.226 Y126.154 E-.07127
G1 X129.21 Y125.996 E-.06037
G1 X129.21 Y124.74 E-.47708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.015 Y119.785 Z1.1 F42000
G1 X151.534 Y105.682 Z1.1
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.709 Y110.35 Z1.1 F42000
G1 X124.499 Y111.301 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.555 Y111.359 E.00141
G3 X124.632 Y111.641 I-.36 J.249 E.00521
G1 X124.632 Y124.159 E.21856
G3 X124.159 Y124.632 I-.454 J.019 E.01313
G1 X111.641 Y124.632 E.21856
G3 X111.168 Y124.159 I-.019 J-.454 E.01313
G1 X111.168 Y111.641 E.21856
G3 X111.641 Y111.168 I.454 J-.019 E.01313
G1 X124.158 Y111.168 E.21855
G1 X124.292 Y111.181 E.00234
G3 X124.44 Y111.245 I-.096 J.427 E.00284
G1 X124.456 Y111.26 E.00036
M204 S10000
G1 X124.806 Y110.994 F42000
G1 F6000
M204 S6000
G3 X125.06 Y111.62 I-.611 J.613 E.01213
G1 X125.06 Y124.18 E.21929
G3 X124.18 Y125.06 I-.867 J.014 E.02426
G1 X111.62 Y125.06 E.21929
G3 X110.74 Y124.18 I-.014 J-.867 E.02426
G1 X110.74 Y111.62 E.21929
G3 X111.62 Y110.74 I.867 J-.014 E.02426
G1 X124.197 Y110.741 E.2196
G3 X124.762 Y110.953 I-.002 J.865 E.01076
M204 S250
G1 X125.096 Y110.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.102 Y110.698 E.00015
G3 X125.474 Y111.6 I-.893 J.897 E.01626
G1 X125.474 Y124.2 E.2046
G3 X124.2 Y125.474 I-1.269 J.005 E.03252
G1 X111.6 Y125.474 E.2046
G3 X110.326 Y124.2 I-.005 J-1.269 E.03252
G1 X110.326 Y111.6 E.2046
G3 X111.6 Y110.326 I1.269 J-.005 E.03252
G1 X124.238 Y110.33 E.20521
G3 X124.91 Y110.542 I-.029 J1.265 E.01161
G1 X125.049 Y110.653 E.00289
; WIPE_START
M204 S6000
G1 X125.102 Y110.698 E-.02632
G1 X125.26 Y110.888 E-.09397
G1 X125.377 Y111.106 E-.09406
G1 X125.449 Y111.343 E-.09406
G1 X125.474 Y111.6 E-.09796
G1 X125.474 Y112.531 E-.35363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.46 Y111.759 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X124.242 Y111.541 E.00502
G2 X124.141 Y111.52 I-.085 J.155 E.0017
G1 X123.656 Y111.52 E.0079
G1 X124.28 Y112.144 E.01437
G1 X124.28 Y112.709 E.00918
G1 X123.091 Y111.52 E.02736
G1 X122.526 Y111.52 E.00918
G1 X124.28 Y113.274 E.04035
G1 X124.28 Y113.838 E.00918
G1 X121.962 Y111.52 E.05334
G1 X121.397 Y111.52 E.00918
G1 X124.28 Y114.403 E.06633
G1 X124.28 Y114.967 E.00918
G1 X120.833 Y111.52 E.07932
G1 X120.268 Y111.52 E.00918
G1 X124.28 Y115.532 E.09231
G1 X124.28 Y116.097 E.00918
G1 X119.703 Y111.52 E.1053
G1 X119.139 Y111.52 E.00918
G1 X124.28 Y116.661 E.11829
G1 X124.28 Y117.226 E.00918
G1 X118.574 Y111.52 E.13128
G1 X118.009 Y111.52 E.00918
G1 X124.28 Y117.791 E.14426
G1 X124.28 Y118.355 E.00918
G1 X117.445 Y111.52 E.15725
G1 X116.88 Y111.52 E.00918
G1 X124.28 Y118.92 E.17024
G1 X124.28 Y119.484 E.00918
G1 X116.316 Y111.52 E.18323
G1 X115.751 Y111.52 E.00918
G1 X124.28 Y120.049 E.19622
G1 X124.28 Y120.614 E.00918
G1 X115.186 Y111.52 E.20921
G1 X114.622 Y111.52 E.00918
G1 X124.28 Y121.178 E.2222
G1 X124.28 Y121.743 E.00918
G1 X114.057 Y111.52 E.23519
G1 X113.492 Y111.52 E.00918
G1 X124.28 Y122.308 E.24818
G1 X124.28 Y122.872 E.00918
G1 X112.928 Y111.52 E.26117
G1 X112.363 Y111.52 E.00918
G1 X124.28 Y123.437 E.27416
G1 X124.28 Y124.001 E.00918
G1 X111.799 Y111.52 E.28715
G2 X111.538 Y111.564 I-.063 J.414 E.00437
G2 X111.52 Y111.805 I.683 J.175 E.00396
G1 X123.995 Y124.28 E.28699
G1 X123.43 Y124.28 E.00918
G1 X111.52 Y112.37 E.274
G1 X111.52 Y112.934 E.00918
G1 X122.866 Y124.28 E.26101
G1 X122.301 Y124.28 E.00918
G1 X111.52 Y113.499 E.24802
G1 X111.52 Y114.064 E.00918
G1 X121.736 Y124.28 E.23503
G1 X121.172 Y124.28 E.00918
G1 X111.52 Y114.628 E.22204
G1 X111.52 Y115.193 E.00918
G1 X120.607 Y124.28 E.20906
G1 X120.042 Y124.28 E.00918
G1 X111.52 Y115.758 E.19607
G1 X111.52 Y116.322 E.00918
G1 X119.478 Y124.28 E.18308
G1 X118.913 Y124.28 E.00918
G1 X111.52 Y116.887 E.17009
G1 X111.52 Y117.451 E.00918
G1 X118.349 Y124.28 E.1571
G1 X117.784 Y124.28 E.00918
G1 X111.52 Y118.016 E.14411
G1 X111.52 Y118.581 E.00918
G1 X117.219 Y124.28 E.13112
G1 X116.655 Y124.28 E.00918
G1 X111.52 Y119.145 E.11813
G1 X111.52 Y119.71 E.00918
G1 X116.09 Y124.28 E.10514
G1 X115.525 Y124.28 E.00918
G1 X111.52 Y120.275 E.09215
G1 X111.52 Y120.839 E.00918
G1 X114.961 Y124.28 E.07916
G1 X114.396 Y124.28 E.00918
G1 X111.52 Y121.404 E.06618
G1 X111.52 Y121.968 E.00918
G1 X113.832 Y124.28 E.05319
G1 X113.267 Y124.28 E.00918
G1 X111.52 Y122.533 E.0402
G1 X111.52 Y123.098 E.00918
G1 X112.702 Y124.28 E.02721
G1 X112.138 Y124.28 E.00918
G1 X111.34 Y123.483 E.01834
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X112.138 Y124.28 E-.42854
G1 X112.702 Y124.28 E-.21456
G1 X112.485 Y124.063 E-.11691
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 8/53
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I-1.114 J.49 P1  F42000
G1 X123.152 Y148.31 Z1.1
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
M73 P51 R12
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
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.2 F42000
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
M73 P51 R11
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
G1 X130.466 Y130.466 E.3421
G1 X130.466 Y151.534 E.34211
G1 X151.534 Y151.534 E.34211
G1 X151.534 Y131.772 E.3209
M204 S10000
M73 P52 R11
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.2 F42000
G1 X149.102 Y122.26 Z1.2
G1 Z.8
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
G1 X135.016 Y119.776 Z1.2 F42000
G1 X151.534 Y105.682 Z1.2
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.706 Y110.348 Z1.2 F42000
G1 X124.524 Y111.276 Z1.2
G1 Z.8
M73 P53 R11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.582 Y111.336 E.00145
G3 X124.66 Y111.624 I-.369 J.255 E.00532
G1 X124.66 Y124.176 E.21915
G3 X124.176 Y124.66 I-.466 J.019 E.01344
G1 X111.624 Y124.66 E.21915
G3 X111.14 Y124.176 I-.019 J-.466 E.01344
G1 X111.14 Y111.624 E.21915
G3 X111.624 Y111.14 I.466 J-.019 E.01344
G1 X124.176 Y111.14 E.21915
G1 X124.311 Y111.153 E.00237
G3 X124.464 Y111.219 I-.098 J.438 E.00292
G1 X124.48 Y111.235 E.0004
M204 S10000
G1 X124.831 Y110.969 F42000
G1 F6000
M204 S6000
G3 X125.089 Y111.603 I-.618 J.621 E.01228
G1 X125.089 Y124.197 E.21988
G3 X124.197 Y125.089 I-.879 J.013 E.02457
G1 X111.603 Y125.089 E.21988
G3 X110.711 Y124.197 I-.013 J-.879 E.02457
G1 X110.711 Y111.603 E.21988
G3 X111.603 Y110.711 I.879 J-.013 E.02457
G1 X124.222 Y110.714 E.22032
G3 X124.787 Y110.928 I-.008 J.876 E.01078
M204 S250
G1 X125.12 Y110.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.127 Y110.674 E.00018
G3 X125.502 Y111.583 I-.901 J.904 E.0164
G1 X125.502 Y124.217 E.20515
G3 X124.217 Y125.502 I-1.281 J.005 E.03281
G1 X111.583 Y125.502 E.20515
G3 X110.298 Y124.217 I-.005 J-1.281 E.03281
G1 X110.298 Y111.583 E.20515
G3 X111.583 Y110.298 I1.281 J-.005 E.03281
G1 X124.262 Y110.302 E.20588
G3 X124.934 Y110.516 I-.036 J1.276 E.01159
G1 X125.073 Y110.627 E.0029
; WIPE_START
M204 S6000
G1 X125.127 Y110.674 E-.02692
G1 X125.287 Y110.865 E-.09482
G1 X125.404 Y111.085 E-.0949
G1 X125.477 Y111.324 E-.09488
G1 X125.502 Y111.583 E-.09883
G1 X125.502 Y112.503 E-.34965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.871 Y112.393 Z1.2 F42000
G1 X111.312 Y112.298 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F15000
M204 S6000
G1 X112.119 Y111.491 E.01865
G1 X112.686 Y111.491 E.00926
G1 X111.491 Y112.686 E.0276
G1 X111.491 Y113.253 E.00926
G1 X113.253 Y111.491 E.0407
G1 X113.82 Y111.491 E.00926
G1 X111.491 Y113.82 E.05379
G1 X111.491 Y114.387 E.00926
G1 X114.387 Y111.491 E.06689
G1 X114.954 Y111.491 E.00926
G1 X111.491 Y114.954 E.07999
G1 X111.491 Y115.521 E.00926
G1 X115.521 Y111.491 E.09308
G1 X116.088 Y111.491 E.00926
G1 X111.491 Y116.088 E.10618
G1 X111.491 Y116.655 E.00926
G1 X116.655 Y111.491 E.11928
G1 X117.222 Y111.491 E.00926
G1 X111.491 Y117.222 E.13237
G1 X111.491 Y117.789 E.00926
G1 X117.789 Y111.491 E.14547
G1 X118.356 Y111.491 E.00926
G1 X111.491 Y118.356 E.15857
G1 X111.491 Y118.923 E.00926
G1 X118.923 Y111.491 E.17166
G1 X119.49 Y111.491 E.00926
G1 X111.491 Y119.49 E.18476
G1 X111.491 Y120.057 E.00926
G1 X120.057 Y111.491 E.19786
G1 X120.624 Y111.491 E.00926
G1 X111.491 Y120.624 E.21095
G1 X111.491 Y121.19 E.00926
G1 X121.19 Y111.491 E.22405
G1 X121.757 Y111.491 E.00926
G1 X111.491 Y121.757 E.23715
G1 X111.491 Y122.324 E.00926
G1 X122.324 Y111.491 E.25024
G1 X122.891 Y111.491 E.00926
G1 X111.491 Y122.891 E.26334
G1 X111.491 Y123.458 E.00926
G1 X123.458 Y111.491 E.27644
G1 X124.025 Y111.491 E.00926
G1 X111.491 Y124.025 E.28953
G2 X111.524 Y124.276 I.539 J.058 E.00417
G2 X111.775 Y124.309 I.193 J-.508 E.00417
G1 X124.309 Y111.775 E.28953
G1 X124.309 Y112.342 E.00926
G1 X112.342 Y124.309 E.27644
G1 X112.909 Y124.309 E.00926
G1 X124.309 Y112.909 E.26334
G1 X124.309 Y113.476 E.00926
G1 X113.476 Y124.309 E.25024
G1 X114.043 Y124.309 E.00926
G1 X124.309 Y114.043 E.23715
G1 X124.309 Y114.61 E.00926
G1 X114.61 Y124.309 E.22405
G1 X115.177 Y124.309 E.00926
G1 X124.309 Y115.177 E.21095
G1 X124.309 Y115.743 E.00926
G1 X115.743 Y124.309 E.19786
G1 X116.31 Y124.309 E.00926
G1 X124.309 Y116.31 E.18476
G1 X124.309 Y116.877 E.00926
G1 X116.877 Y124.309 E.17166
G1 X117.444 Y124.309 E.00926
G1 X124.309 Y117.444 E.15857
G1 X124.309 Y118.011 E.00926
G1 X118.011 Y124.309 E.14547
G1 X118.578 Y124.309 E.00926
G1 X124.309 Y118.578 E.13237
G1 X124.309 Y119.145 E.00926
G1 X119.145 Y124.309 E.11928
G1 X119.712 Y124.309 E.00926
G1 X124.309 Y119.712 E.10618
G1 X124.309 Y120.279 E.00926
G1 X120.279 Y124.309 E.09308
G1 X120.846 Y124.309 E.00926
G1 X124.309 Y120.846 E.07999
G1 X124.309 Y121.413 E.00926
G1 X121.413 Y124.309 E.06689
G1 X121.98 Y124.309 E.00926
G1 X124.309 Y121.98 E.05379
G1 X124.309 Y122.547 E.00926
G1 X122.547 Y124.309 E.0407
G1 X123.114 Y124.309 E.00926
G1 X124.309 Y123.114 E.0276
G1 X124.309 Y123.681 E.00926
G1 X123.502 Y124.488 E.01865
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.309 Y123.681 E-.43379
G1 X124.309 Y123.114 E-.21544
G1 X124.103 Y123.32 E-.11077
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 9/53
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-1.216 J-.046 P1  F42000
G1 X123.152 Y148.31 Z1.2
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
G1 X103.21 Y150.719 E-.48505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
M73 P54 R11
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.3 F42000
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.3 F42000
G1 X149.102 Y122.26 Z1.3
G1 Z.9
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
M73 P55 R11
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
G1 X135.017 Y119.767 Z1.3 F42000
G1 X151.534 Y105.682 Z1.3
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.704 Y110.345 Z1.3 F42000
G1 X124.549 Y111.251 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.689 Y111.607 I-.336 J.337 E.00688
G1 X124.689 Y124.193 E.21974
G3 X124.193 Y124.689 I-.478 J.018 E.01375
G1 X111.607 Y124.689 E.21974
G3 X111.111 Y124.193 I-.018 J-.478 E.01375
G1 X111.111 Y111.607 E.21974
G3 X111.607 Y111.111 I.478 J-.018 E.01375
G1 X124.204 Y111.113 E.21993
G3 X124.504 Y111.212 I.009 J.476 E.00562
M204 S10000
G1 X124.858 Y110.942 F42000
G1 F6000
M204 S6000
G3 X125.117 Y111.586 I-.62 J.624 E.01247
G1 X125.117 Y124.214 E.22048
G3 X124.214 Y125.117 I-.89 J.013 E.02488
G1 X111.586 Y125.117 E.22048
G3 X110.683 Y124.214 I-.013 J-.89 E.02488
G1 X110.683 Y111.586 E.22048
G3 X111.586 Y110.683 I.89 J-.013 E.02488
G1 X124.246 Y110.686 E.22104
G3 X124.814 Y110.901 I-.008 J.879 E.01083
M204 S250
G1 X125.161 Y110.657 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.312 Y110.843 E.00388
G3 X125.531 Y111.566 I-1.068 J.718 E.01245
G1 X125.531 Y124.234 E.2057
G3 X124.234 Y125.531 I-1.292 J.005 E.0331
G1 X111.566 Y125.531 E.2057
G3 X110.269 Y124.234 I-.005 J-1.292 E.0331
G1 X110.269 Y111.566 E.2057
G3 X111.566 Y110.269 I1.292 J-.005 E.0331
G1 X124.286 Y110.275 E.20655
G3 X125.117 Y110.616 I-.043 J1.286 E.0149
; WIPE_START
M204 S6000
G1 X125.312 Y110.843 E-.11349
G1 X125.432 Y111.064 E-.09565
G1 X125.505 Y111.305 E-.09577
G1 X125.531 Y111.566 E-.09964
G1 X125.531 Y112.501 E-.35545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.516 Y112.28 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42389
G1 F15000
M204 S6000
G1 X123.7 Y111.464 E.01892
G1 X123.131 Y111.464 E.00933
G1 X124.337 Y112.67 E.02796
G1 X124.337 Y113.239 E.00933
G1 X122.562 Y111.464 E.04116
G1 X121.993 Y111.464 E.00933
G1 X124.337 Y113.808 E.05436
G1 X124.337 Y114.377 E.00933
G1 X121.424 Y111.464 E.06755
G1 X120.855 Y111.464 E.00933
G1 X124.337 Y114.946 E.08075
G1 X124.337 Y115.515 E.00933
G1 X120.285 Y111.464 E.09395
G1 X119.716 Y111.464 E.00933
G1 X124.337 Y116.085 E.10715
G1 X124.337 Y116.654 E.00933
G1 X119.147 Y111.464 E.12035
G1 X118.578 Y111.464 E.00933
G1 X124.337 Y117.223 E.13355
G1 X124.337 Y117.792 E.00933
G1 X118.009 Y111.464 E.14674
G1 X117.44 Y111.463 E.00933
G1 X124.337 Y118.361 E.15994
G1 X124.337 Y118.93 E.00933
G1 X116.87 Y111.463 E.17314
G1 X116.301 Y111.463 E.00933
G1 X124.337 Y119.499 E.18634
G1 X124.337 Y120.068 E.00933
G1 X115.732 Y111.463 E.19954
G1 X115.163 Y111.463 E.00933
G1 X124.337 Y120.638 E.21273
G1 X124.337 Y121.207 E.00933
G1 X114.594 Y111.463 E.22593
G1 X114.024 Y111.463 E.00933
G1 X124.337 Y121.776 E.23913
G1 X124.337 Y122.345 E.00933
G1 X113.455 Y111.463 E.25233
G1 X112.886 Y111.463 E.00933
G1 X124.337 Y122.914 E.26553
G1 X124.337 Y123.483 E.00933
G1 X112.317 Y111.463 E.27872
G1 X111.748 Y111.463 E.00933
G1 X124.337 Y124.052 E.29192
G3 X124.301 Y124.301 I-.52 J.053 E.00417
G3 X124.053 Y124.337 I-.196 J-.484 E.00416
G1 X111.463 Y111.747 E.29193
G1 X111.463 Y112.316 E.00933
G1 X123.484 Y124.337 E.27874
G1 X122.915 Y124.337 E.00933
G1 X111.463 Y112.886 E.26554
G1 X111.463 Y113.455 E.00933
G1 X122.345 Y124.337 E.25234
G1 X121.776 Y124.337 E.00933
G1 X111.463 Y114.024 E.23915
G1 X111.463 Y114.593 E.00933
G1 X121.207 Y124.337 E.22595
G1 X120.638 Y124.337 E.00933
G1 X111.463 Y115.162 E.21275
G1 X111.463 Y115.731 E.00933
G1 X120.069 Y124.337 E.19956
G1 X119.5 Y124.337 E.00933
G1 X111.463 Y116.3 E.18636
G1 X111.463 Y116.869 E.00933
G1 X118.931 Y124.337 E.17316
G1 X118.362 Y124.337 E.00933
G1 X111.463 Y117.438 E.15996
G1 X111.463 Y118.008 E.00933
G1 X117.792 Y124.337 E.14677
G1 X117.223 Y124.337 E.00933
G1 X111.463 Y118.577 E.13357
G1 X111.463 Y119.146 E.00933
G1 X116.654 Y124.337 E.12037
G1 X116.085 Y124.337 E.00933
G1 X111.463 Y119.715 E.10718
G1 X111.463 Y120.284 E.00933
G1 X115.516 Y124.337 E.09398
G1 X114.947 Y124.337 E.00933
G1 X111.463 Y120.853 E.08078
G1 X111.463 Y121.422 E.00933
G1 X114.378 Y124.337 E.06759
G1 X113.809 Y124.337 E.00933
G1 X111.463 Y121.991 E.05439
G1 X111.463 Y122.561 E.00933
M73 P55 R10
G1 X113.239 Y124.337 E.04119
G1 X112.67 Y124.337 E.00933
G1 X111.463 Y123.13 E.028
G1 X111.463 Y123.699 E.00933
G1 X112.281 Y124.516 E.01896
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.463 Y123.699 E-.43936
G1 X111.463 Y123.13 E-.21627
G1 X111.657 Y123.324 E-.10438
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 10/53
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I-1.106 J.509 P1  F42000
G1 X123.152 Y148.31 Z1.3
G1 Z1
M73 P56 R10
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
G1 X103.364 Y152.463 E-.0801
G1 X103.284 Y152.333 E-.05816
G1 X103.226 Y152.154 E-.07132
G1 X103.21 Y151.996 E-.06039
G1 X103.21 Y150.706 E-.49003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34973
G1 X105.677 Y131.612 E-.41027
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.4 F42000
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
M73 P57 R10
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.4 F42000
G1 X149.102 Y122.26 Z1.4
G1 Z1
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
G1 X135.019 Y119.756 Z1.4 F42000
G1 X151.534 Y105.682 Z1.4
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
M73 P58 R10
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.702 Y110.342 Z1.4 F42000
G1 X124.574 Y111.226 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.717 Y111.59 I-.343 J.345 E.00703
G1 X124.717 Y124.21 E.22033
G3 X124.21 Y124.717 I-.49 J.018 E.01405
G1 X111.59 Y124.717 E.22033
G3 X111.083 Y124.21 I-.018 J-.49 E.01405
G1 X111.083 Y111.59 E.22033
G3 X111.59 Y111.083 I.49 J-.018 E.01405
G1 X124.228 Y111.085 E.22066
G3 X124.529 Y111.187 I.003 J.486 E.00564
M204 S10000
G1 X124.883 Y110.917 F42000
G1 F6000
M204 S6000
G3 X125.145 Y111.569 I-.627 J.631 E.01262
G1 X125.145 Y124.231 E.22107
G3 X124.231 Y125.145 I-.901 J.013 E.02519
G1 X111.569 Y125.145 E.22107
G3 X110.655 Y124.231 I-.013 J-.901 E.02519
G1 X110.655 Y111.569 E.22107
G3 X111.569 Y110.655 I.901 J-.013 E.02519
G1 X124.27 Y110.659 E.22176
G3 X124.839 Y110.876 I-.014 J.89 E.01085
M204 S250
G1 X125.167 Y110.613 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.176 Y110.624 E.00023
G3 X125.559 Y111.549 I-.915 J.92 E.01669
G1 X125.559 Y124.251 E.20626
G3 X124.251 Y125.559 I-1.303 J.005 E.03339
G1 X111.549 Y125.559 E.20626
G3 X110.241 Y124.251 I-.005 J-1.303 E.03339
G1 X110.241 Y111.549 E.20626
G3 X111.549 Y110.241 I1.303 J-.005 E.03339
G1 X124.311 Y110.247 E.20722
G3 X124.98 Y110.463 I-.05 J1.297 E.01156
G1 X125.12 Y110.576 E.00292
; WIPE_START
M204 S6000
G1 X125.176 Y110.624 E-.02808
G1 X125.339 Y110.818 E-.0965
G1 X125.459 Y111.043 E-.09658
G1 X125.533 Y111.286 E-.09659
G1 X125.559 Y111.549 E-.10051
G1 X125.559 Y112.448 E-.34176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.927 Y112.349 Z1.4 F42000
G1 X111.255 Y112.262 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42543
G1 F15000
M204 S6000
G1 X112.082 Y111.435 E.01925
G1 X112.654 Y111.435 E.0094
G1 X111.435 Y112.654 E.02838
G1 X111.435 Y113.225 E.0094
G1 X113.225 Y111.435 E.04167
G1 X113.796 Y111.435 E.0094
G1 X111.435 Y113.796 E.05497
G1 X111.435 Y114.368 E.0094
G1 X114.367 Y111.435 E.06826
G1 X114.939 Y111.435 E.0094
G1 X111.435 Y114.939 E.08156
G1 X111.435 Y115.51 E.0094
G1 X115.51 Y111.435 E.09486
G1 X116.081 Y111.435 E.0094
G1 X111.435 Y116.082 E.10815
G1 X111.435 Y116.653 E.0094
G1 X116.652 Y111.435 E.12145
G1 X117.223 Y111.435 E.0094
G1 X111.435 Y117.224 E.13474
G1 X111.435 Y117.796 E.0094
G1 X117.795 Y111.436 E.14804
G1 X118.366 Y111.436 E.0094
G1 X111.435 Y118.367 E.16134
G1 X111.435 Y118.938 E.0094
G1 X118.937 Y111.436 E.17463
G1 X119.508 Y111.436 E.0094
G1 X111.435 Y119.509 E.18793
G1 X111.435 Y120.081 E.0094
G1 X120.08 Y111.436 E.20122
G1 X120.651 Y111.436 E.0094
G1 X111.435 Y120.652 E.21452
G1 X111.435 Y121.223 E.0094
G1 X121.222 Y111.436 E.22782
G1 X121.793 Y111.436 E.0094
G1 X111.435 Y121.795 E.24111
G1 X111.435 Y122.366 E.0094
G1 X122.364 Y111.436 E.25441
G1 X122.936 Y111.436 E.0094
G1 X111.435 Y122.937 E.26771
G1 X111.435 Y123.509 E.0094
G1 X123.507 Y111.436 E.281
G1 X124.078 Y111.436 E.0094
G1 X111.435 Y124.08 E.2943
G2 X111.474 Y124.326 I.506 J.046 E.00415
G2 X111.72 Y124.365 I.2 J-.467 E.00416
G1 X124.365 Y111.72 E.29433
G1 X124.365 Y112.292 E.0094
G1 X112.292 Y124.365 E.28104
G1 X112.863 Y124.365 E.0094
G1 X124.365 Y112.863 E.26774
G1 X124.365 Y113.434 E.0094
G1 X113.434 Y124.365 E.25444
G1 X114.006 Y124.365 E.0094
G1 X124.365 Y114.006 E.24114
G1 X124.365 Y114.577 E.0094
G1 X114.577 Y124.365 E.22784
G1 X115.148 Y124.365 E.0094
G1 X124.365 Y115.148 E.21455
G1 X124.365 Y115.72 E.0094
G1 X115.72 Y124.365 E.20125
G1 X116.291 Y124.365 E.0094
G1 X124.365 Y116.291 E.18795
G1 X124.365 Y116.862 E.0094
G1 X116.862 Y124.365 E.17465
G1 X117.433 Y124.365 E.0094
G1 X124.365 Y117.433 E.16135
G1 X124.365 Y118.005 E.0094
G1 X118.005 Y124.365 E.14805
G1 X118.576 Y124.365 E.0094
G1 X124.365 Y118.576 E.13476
G1 X124.365 Y119.147 E.0094
G1 X119.147 Y124.365 E.12146
G1 X119.719 Y124.365 E.0094
G1 X124.365 Y119.719 E.10816
G1 X124.365 Y120.29 E.0094
G1 X120.29 Y124.365 E.09486
G1 X120.861 Y124.365 E.0094
G1 X124.365 Y120.861 E.08156
G1 X124.365 Y121.433 E.0094
G1 X121.433 Y124.365 E.06827
G1 X122.004 Y124.365 E.0094
G1 X124.365 Y122.004 E.05497
G1 X124.365 Y122.575 E.0094
G1 X122.575 Y124.365 E.04167
G1 X123.146 Y124.365 E.0094
G1 X124.365 Y123.146 E.02837
G1 X124.365 Y123.718 E.0094
G1 X123.538 Y124.545 E.01925
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.365 Y123.718 E-.4444
G1 X124.365 Y123.146 E-.21709
G1 X124.182 Y123.33 E-.0985
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 11/53
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-1.216 J-.05 P1  F42000
G1 X123.152 Y148.31 Z1.4
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
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
M73 P59 R10
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.5 F42000
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
G1 F15000
M204 S6000
M73 P59 R9
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
M73 P60 R9
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.5 F42000
G1 X149.102 Y122.26 Z1.5
G1 Z1.1
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
G1 X135.023 Y119.731 Z1.5 F42000
G1 X151.534 Y105.682 Z1.5
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.7 Y110.339 Z1.5 F42000
G1 X124.599 Y111.202 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.745 Y111.573 I-.35 J.353 E.00718
G1 X124.745 Y124.227 E.22093
G3 X124.227 Y124.745 I-.501 J.017 E.01436
G1 X111.573 Y124.745 E.22093
G3 X111.055 Y124.227 I-.017 J-.501 E.01436
G1 X111.055 Y111.573 E.22093
G3 X111.573 Y111.055 I.501 J-.017 E.01436
G1 X124.252 Y111.057 E.22138
G3 X124.553 Y111.162 I-.004 J.497 E.00566
M204 S10000
G1 X124.908 Y110.892 F42000
G1 F6000
M204 S6000
G3 X125.174 Y111.552 I-.634 J.639 E.01277
G1 X125.174 Y124.248 E.22166
G3 X124.248 Y125.174 I-.913 J.013 E.0255
G1 X111.552 Y125.174 E.22166
G3 X110.626 Y124.248 I-.013 J-.913 E.0255
G1 X110.626 Y111.552 E.22166
G3 X111.552 Y110.626 I.913 J-.013 E.0255
G1 X124.294 Y110.631 E.22248
G3 X124.864 Y110.851 I-.021 J.9 E.01088
M204 S250
G1 X125.191 Y110.587 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.201 Y110.599 E.00025
G3 X125.587 Y111.532 I-.923 J.928 E.01683
G1 X125.587 Y124.268 E.20681
G3 X124.268 Y125.587 I-1.315 J.005 E.03368
G1 X111.532 Y125.587 E.20681
G3 X110.213 Y124.268 I-.005 J-1.315 E.03368
G1 X110.213 Y111.532 E.20681
G3 X111.532 Y110.213 I1.315 J-.005 E.03368
G1 X124.335 Y110.219 E.2079
G3 X125.003 Y110.437 I-.056 J1.307 E.01155
G1 X125.144 Y110.55 E.00293
; WIPE_START
M204 S6000
G1 X125.201 Y110.599 E-.02865
G1 X125.366 Y110.795 E-.0973
G1 X125.487 Y111.021 E-.09743
G1 X125.561 Y111.267 E-.09745
G1 X125.587 Y111.532 E-.10133
G1 X125.587 Y112.421 E-.33784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.573 Y112.243 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42697
G1 F15000
M204 S6000
G1 X123.739 Y111.409 E.0195
G1 X123.165 Y111.409 E.00948
G1 X124.394 Y112.637 E.02871
G1 X124.394 Y113.211 E.00948
G1 X122.591 Y111.409 E.04211
G1 X122.018 Y111.408 E.00948
G1 X124.394 Y113.784 E.05551
G1 X124.394 Y114.358 E.00948
G1 X121.444 Y111.408 E.06892
G1 X120.871 Y111.408 E.00948
G1 X124.394 Y114.931 E.08232
G1 X124.394 Y115.505 E.00948
G1 X120.297 Y111.408 E.09572
G1 X119.723 Y111.408 E.00948
G1 X124.394 Y116.078 E.10912
G1 X124.394 Y116.652 E.00948
G1 X119.15 Y111.408 E.12252
G1 X118.576 Y111.408 E.00948
G1 X124.394 Y117.225 E.13593
G1 X124.394 Y117.799 E.00948
G1 X118.003 Y111.408 E.14933
G1 X117.429 Y111.408 E.00948
G1 X124.394 Y118.372 E.16273
G1 X124.394 Y118.946 E.00947
G1 X116.855 Y111.407 E.17613
G1 X116.282 Y111.407 E.00948
G1 X124.394 Y119.519 E.18954
G1 X124.394 Y120.093 E.00948
G1 X115.708 Y111.407 E.20294
G1 X115.135 Y111.407 E.00948
G1 X124.394 Y120.666 E.21634
G1 X124.394 Y121.24 E.00947
G1 X114.561 Y111.407 E.22974
G1 X113.988 Y111.407 E.00948
G1 X124.394 Y121.813 E.24315
G1 X124.394 Y122.386 E.00948
G1 X113.414 Y111.407 E.25655
G1 X112.84 Y111.407 E.00948
G1 X124.394 Y122.96 E.26995
G1 X124.394 Y123.533 E.00947
G1 X112.267 Y111.407 E.28335
G1 X111.693 Y111.406 E.00948
G1 X124.394 Y124.107 E.29676
G3 X124.351 Y124.351 I-.496 J.04 E.00414
G3 X124.107 Y124.394 I-.205 J-.455 E.00414
G1 X111.406 Y111.693 E.29676
G1 X111.406 Y112.267 E.00948
G1 X123.533 Y124.394 E.28336
G1 X122.96 Y124.394 E.00948
G1 X111.406 Y112.84 E.26996
G1 X111.406 Y113.414 E.00947
G1 X122.386 Y124.394 E.25656
G1 X121.813 Y124.394 E.00948
G1 X111.406 Y113.987 E.24316
M73 P61 R9
G1 X111.406 Y114.56 E.00948
G1 X121.24 Y124.394 E.22976
G1 X120.666 Y124.394 E.00948
G1 X111.406 Y115.134 E.21636
G1 X111.406 Y115.707 E.00948
G1 X120.093 Y124.394 E.20296
G1 X119.519 Y124.394 E.00947
G1 X111.406 Y116.281 E.18956
G1 X111.406 Y116.854 E.00948
G1 X118.946 Y124.394 E.17616
G1 X118.372 Y124.394 E.00948
G1 X111.406 Y117.428 E.16276
G1 X111.406 Y118.001 E.00948
G1 X117.799 Y124.394 E.14936
G1 X117.225 Y124.394 E.00947
G1 X111.406 Y118.575 E.13596
G1 X111.406 Y119.148 E.00948
G1 X116.652 Y124.394 E.12256
G1 X116.078 Y124.394 E.00948
G1 X111.406 Y119.722 E.10916
G1 X111.406 Y120.295 E.00948
G1 X115.505 Y124.394 E.09576
G1 X114.931 Y124.394 E.00948
G1 X111.406 Y120.869 E.08236
G1 X111.406 Y121.442 E.00947
G1 X114.358 Y124.394 E.06896
G1 X113.784 Y124.394 E.00948
G1 X111.406 Y122.016 E.05556
G1 X111.406 Y122.589 E.00948
G1 X113.211 Y124.394 E.04216
G1 X112.637 Y124.394 E.00948
G1 X111.406 Y123.163 E.02876
G1 X111.406 Y123.736 E.00947
G1 X112.243 Y124.573 E.01955
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.406 Y123.736 E-.44972
G1 X111.406 Y123.163 E-.21792
G1 X111.578 Y123.335 E-.09236
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 12/53
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I-1.104 J.512 P1  F42000
G1 X123.152 Y148.31 Z1.5
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
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.6 F42000
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
M73 P62 R9
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.6 F42000
G1 X149.102 Y122.26 Z1.6
G1 Z1.2
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
G1 X135.022 Y119.74 Z1.6 F42000
G1 X151.534 Y105.683 Z1.6
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
M73 P63 R9
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.698 Y110.337 Z1.6 F42000
G1 X124.623 Y111.177 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.773 Y111.556 I-.357 J.361 E.00734
G1 X124.773 Y124.244 E.22152
G3 X124.244 Y124.773 I-.513 J.017 E.01467
G1 X111.556 Y124.773 E.22152
G3 X111.027 Y124.244 I-.017 J-.513 E.01467
G1 X111.027 Y111.556 E.22152
G3 X111.556 Y111.027 I.513 J-.017 E.01467
G1 X124.277 Y111.03 E.2221
G3 X124.578 Y111.137 I-.011 J.507 E.00568
M204 S10000
G1 X124.933 Y110.867 F42000
G1 F6000
M204 S6000
G3 X125.202 Y111.535 I-.642 J.647 E.01293
G1 X125.202 Y124.265 E.22226
G3 X124.265 Y125.202 I-.924 J.013 E.02581
G1 X111.535 Y125.202 E.22226
G3 X110.598 Y124.265 I-.013 J-.924 E.02581
G1 X110.598 Y111.535 E.22226
G3 X111.535 Y110.598 I.924 J-.013 E.02581
G1 X124.319 Y110.603 E.2232
G3 X124.889 Y110.826 I-.028 J.911 E.0109
M204 S250
G1 X125.215 Y110.561 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.226 Y110.574 E.00028
G3 X125.615 Y111.515 I-.93 J.936 E.01698
G1 X125.615 Y124.285 E.20736
G3 X124.285 Y125.615 I-1.326 J.005 E.03397
G1 X111.515 Y125.615 E.20736
G3 X110.185 Y124.285 I-.005 J-1.326 E.03397
G1 X110.185 Y111.515 E.20736
G3 X111.515 Y110.185 I1.326 J-.005 E.03397
G1 X124.359 Y110.192 E.20857
G3 X125.026 Y110.411 I-.063 J1.318 E.01154
G1 X125.168 Y110.524 E.00294
; WIPE_START
M204 S6000
G1 X125.226 Y110.574 E-.02917
G1 X125.392 Y110.772 E-.09819
G1 X125.514 Y111 E-.09826
G1 X125.589 Y111.247 E-.0983
G1 X125.615 Y111.515 E-.10218
G1 X125.615 Y112.394 E-.33392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.993 Y112 Z1.6 F42000
G1 X111.199 Y111.65 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4285
G1 F15000
M204 S6000
G1 X111.427 Y111.422 E.00535
G3 X111.587 Y111.378 I.13 J.161 E.00284
G1 X112.046 Y111.378 E.0076
G1 X111.378 Y112.046 E.01566
G1 X111.378 Y112.622 E.00955
G1 X112.621 Y111.378 E.02916
G1 X113.197 Y111.378 E.00954
G1 X111.378 Y113.197 E.04266
G1 X111.378 Y113.773 E.00955
G1 X113.772 Y111.379 E.05615
G1 X114.348 Y111.379 E.00954
G1 X111.378 Y114.348 E.06965
G1 X111.378 Y114.924 E.00955
G1 X114.923 Y111.379 E.08315
G1 X115.499 Y111.379 E.00954
G1 X111.378 Y115.5 E.09665
G1 X111.378 Y116.075 E.00955
G1 X116.074 Y111.379 E.11014
G1 X116.65 Y111.379 E.00954
G1 X111.378 Y116.651 E.12364
G1 X111.378 Y117.227 E.00955
G1 X117.225 Y111.38 E.13714
G1 X117.801 Y111.38 E.00954
G1 X111.378 Y117.802 E.15063
G1 X111.378 Y118.378 E.00955
G1 X118.376 Y111.38 E.16413
G1 X118.952 Y111.38 E.00954
G1 X111.378 Y118.954 E.17763
G1 X111.378 Y119.529 E.00955
G1 X119.527 Y111.38 E.19113
G1 X120.103 Y111.38 E.00954
G1 X111.378 Y120.105 E.20462
G1 X111.378 Y120.681 E.00955
G1 X120.678 Y111.38 E.21812
G1 X121.254 Y111.381 E.00954
G1 X111.378 Y121.256 E.23162
G1 X111.378 Y121.832 E.00955
G1 X121.829 Y111.381 E.24512
G1 X122.405 Y111.381 E.00954
G1 X111.378 Y122.407 E.25861
G1 X111.378 Y122.983 E.00955
G1 X122.98 Y111.381 E.27211
G1 X123.556 Y111.381 E.00954
G1 X111.378 Y123.559 E.28561
G1 X111.378 Y124.134 E.00955
G1 X124.131 Y111.381 E.29911
G3 X124.376 Y111.424 I.058 J.394 E.0042
G3 X124.422 Y111.666 I-.446 J.209 E.00414
G1 X111.666 Y124.422 E.29917
G1 X112.242 Y124.422 E.00955
G1 X124.422 Y112.242 E.28567
G1 X124.422 Y112.817 E.00955
G1 X112.817 Y124.422 E.27217
G1 X113.393 Y124.422 E.00955
G1 X124.422 Y113.393 E.25867
G1 X124.422 Y113.969 E.00955
G1 X113.969 Y124.422 E.24517
G1 X114.544 Y124.422 E.00955
G1 X124.422 Y114.544 E.23167
G1 X124.422 Y115.12 E.00955
G1 X115.12 Y124.422 E.21817
G1 X115.696 Y124.422 E.00955
G1 X124.422 Y115.696 E.20467
G1 X124.422 Y116.271 E.00955
G1 X116.271 Y124.422 E.19116
G1 X116.847 Y124.422 E.00955
G1 X124.422 Y116.847 E.17766
G1 X124.422 Y117.423 E.00955
G1 X117.423 Y124.422 E.16416
G1 X117.998 Y124.422 E.00955
G1 X124.422 Y117.998 E.15066
G1 X124.422 Y118.574 E.00955
G1 X118.574 Y124.422 E.13716
G1 X119.149 Y124.422 E.00955
G1 X124.422 Y119.149 E.12366
G1 X124.422 Y119.725 E.00955
G1 X119.725 Y124.422 E.11016
G1 X120.301 Y124.422 E.00955
G1 X124.422 Y120.301 E.09666
G1 X124.422 Y120.876 E.00955
G1 X120.876 Y124.422 E.08316
G1 X121.452 Y124.422 E.00955
G1 X124.422 Y121.452 E.06966
G1 X124.422 Y122.028 E.00955
G1 X122.028 Y124.422 E.05616
G1 X122.603 Y124.422 E.00955
G1 X124.422 Y122.603 E.04265
G1 X124.422 Y123.179 E.00955
G1 X123.179 Y124.422 E.02915
G1 X123.755 Y124.422 E.00955
G1 X124.422 Y123.755 E.01565
G1 X124.422 Y124.213 E.0076
G3 X124.378 Y124.375 I-.207 J.03 E.00287
G1 X124.151 Y124.601 E.00532
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X124.378 Y124.375 E-.12179
G1 X124.399 Y124.342 E-.01474
G1 X124.422 Y124.213 E-.05005
G1 X124.422 Y123.755 E-.1741
G1 X123.755 Y124.422 E-.35865
G1 X123.648 Y124.422 E-.04068
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 13/53
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S181.05
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-1.217 J-.025 P1  F42000
G1 X123.152 Y148.31 Z1.6
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
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
G1 X0 Y128 F18000 ; move to safe pos
M73 P63 R8
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M73 P64 R8
G1 X125.534 Y131.653 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34978
G1 X105.677 Y131.612 E-.41022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.339 Z1.7 F42000
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
M73 P65 R8
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.7 F42000
G1 X149.102 Y122.26 Z1.7
G1 Z1.3
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
G1 X135.022 Y119.734 Z1.7 F42000
G1 X151.534 Y105.683 Z1.7
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X126.001 Y110.7 Z1.7 F42000
G1 X118.534 Y117.326 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.866 Y117.038 I-.643 J.573 E.08134
G1 X117.951 Y117.04 E.00148
G3 X118.493 Y117.283 I-.059 J.859 E.01059
M204 S10000
G1 X118.845 Y117.028 F42000
G1 F6000
M204 S6000
G3 X117.861 Y116.61 I-.952 J.871 E.12228
G1 X117.976 Y116.612 E.00201
G3 X118.803 Y116.985 I-.083 J1.287 E.01619
; WIPE_START
G1 X118.996 Y117.218 E-.11489
G1 X119.114 Y117.46 E-.10233
G1 X119.177 Y117.709 E-.09742
G1 X119.189 Y117.951 E-.09216
G1 X119.158 Y118.192 E-.09219
G1 X119.085 Y118.413 E-.08841
G1 X118.961 Y118.636 E-.09694
G1 X118.849 Y118.775 E-.06813
G1 X118.834 Y118.789 E-.00752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.513 Y112.759 Z1.7 F42000
G1 X125.239 Y110.535 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X125.251 Y110.549 E.0003
G3 X125.644 Y111.498 I-.938 J.944 E.01712
G1 X125.644 Y124.302 E.20791
G3 X124.302 Y125.644 I-1.337 J.005 E.03426
G1 X111.498 Y125.644 E.20791
G3 X110.156 Y124.302 I-.005 J-1.337 E.03426
G1 X110.156 Y111.498 E.20791
G3 X111.498 Y110.156 I1.337 J-.005 E.03426
G1 X124.384 Y110.164 E.20924
G3 X125.049 Y110.385 I-.07 J1.329 E.01152
G1 X125.192 Y110.498 E.00296
; WIPE_START
M204 S6000
G1 X125.251 Y110.549 E-.02972
G1 X125.419 Y110.749 E-.099
G1 X125.541 Y110.979 E-.09912
G1 X125.617 Y111.228 E-.09913
G1 X125.644 Y111.498 E-.10302
G1 X125.644 Y112.366 E-.33001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.425 Y111.616 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X124.184 Y110.375 E.0285
G1 X123.62 Y110.375
G1 X125.425 Y112.18 E.04144
G1 X125.425 Y112.744
G1 X123.057 Y110.375 E.05438
G1 X122.493 Y110.375
G1 X125.425 Y113.307 E.06732
G1 X125.425 Y113.871
G1 X121.929 Y110.375 E.08027
G1 X121.366 Y110.375
G1 X125.425 Y114.434 E.09321
G1 X125.425 Y114.998
G1 X120.802 Y110.375 E.10615
G1 X120.238 Y110.375
G1 X125.425 Y115.562 E.11909
G1 X125.425 Y116.125
G1 X119.675 Y110.375 E.13204
G1 X119.111 Y110.375
G1 X125.425 Y116.689 E.14498
G1 X125.425 Y117.252
G1 X118.548 Y110.375 E.15792
G1 X117.984 Y110.375
G1 X125.425 Y117.816 E.17086
G1 X125.425 Y118.38
G1 X117.42 Y110.375 E.18381
G1 X116.857 Y110.375
G1 X125.425 Y118.943 E.19675
G1 X125.425 Y119.507
G1 X116.293 Y110.375 E.20969
M73 P66 R8
G1 X115.73 Y110.375
G1 X125.425 Y120.07 E.22263
G1 X125.425 Y120.634
G1 X115.166 Y110.375 E.23558
G1 X114.602 Y110.375
G1 X125.425 Y121.198 E.24852
G1 X125.425 Y121.761
G1 X114.039 Y110.375 E.26146
G1 X113.475 Y110.375
G1 X125.425 Y122.325 E.27441
G1 X125.425 Y122.888
G1 X112.912 Y110.375 E.28735
G1 X112.348 Y110.375
G1 X118.453 Y116.48 E.14019
G1 X117.789 Y116.38
G1 X111.784 Y110.375 E.13789
G1 X111.25 Y110.405
G1 X117.332 Y116.486 E.13965
G1 X116.973 Y116.691
G1 X110.857 Y110.576 E.14043
G1 X110.576 Y110.857
G1 X116.69 Y116.972 E.14041
G1 X116.486 Y117.332
G1 X110.405 Y111.251 E.13965
G1 X110.375 Y111.785
G1 X116.38 Y117.789 E.1379
G1 X116.48 Y118.453
G1 X110.375 Y112.348 E.14018
; WIPE_START
M204 S6000
G1 X111.79 Y113.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.681 Y117.044 Z1.7 F42000
G1 X119.321 Y117.348 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X125.425 Y123.452 E.14016
G1 X125.425 Y124.016
G1 X119.42 Y118.011 E.1379
G1 X119.314 Y118.469
G1 X125.395 Y124.55 E.13964
G1 X125.224 Y124.943
G1 X119.109 Y118.828 E.14043
G1 X118.828 Y119.11
G1 X124.943 Y125.224 E.14041
G1 X124.549 Y125.395
G1 X118.468 Y119.314 E.13965
G1 X118.011 Y119.42
G1 X124.016 Y125.425 E.13788
G1 X123.452 Y125.425
G1 X117.347 Y119.32 E.14019
; WIPE_START
M204 S6000
G1 X118.761 Y120.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.888 Y125.425 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X110.375 Y112.912 E.28735
G1 X110.375 Y113.475
G1 X122.325 Y125.425 E.2744
G1 X121.761 Y125.425
G1 X110.375 Y114.039 E.26146
G1 X110.375 Y114.603
G1 X121.197 Y125.425 E.24852
G1 X120.634 Y125.425
G1 X110.375 Y115.166 E.23557
G1 X110.375 Y115.73
G1 X120.07 Y125.425 E.22263
G1 X119.507 Y125.425
G1 X110.375 Y116.293 E.20969
G1 X110.375 Y116.857
G1 X118.943 Y125.425 E.19675
G1 X118.379 Y125.425
G1 X110.375 Y117.421 E.1838
G1 X110.375 Y117.984
G1 X117.816 Y125.425 E.17086
G1 X117.252 Y125.425
G1 X110.375 Y118.548 E.15792
G1 X110.375 Y119.111
G1 X116.689 Y125.425 E.14498
G1 X116.125 Y125.425
G1 X110.375 Y119.675 E.13203
G1 X110.375 Y120.239
G1 X115.561 Y125.425 E.11909
G1 X114.998 Y125.425
G1 X110.375 Y120.802 E.10615
G1 X110.375 Y121.366
G1 X114.434 Y125.425 E.09321
G1 X113.871 Y125.425
G1 X110.375 Y121.929 E.08026
G1 X110.375 Y122.493
G1 X113.307 Y125.425 E.06732
G1 X112.743 Y125.425
G1 X110.375 Y123.057 E.05438
G1 X110.375 Y123.62
G1 X112.18 Y125.425 E.04144
G1 X111.616 Y125.425
G1 X110.375 Y124.184 E.02849
; WIPE_START
M204 S6000
G1 X111.616 Y125.425 E-.66678
G1 X111.862 Y125.425 E-.09323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.141 Y119.913 Z1.7 F42000
G1 X125.421 Y111.269 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191324
G1 F15000
M204 S6000
G1 X125.292 Y111.094 E.0015
; LINE_WIDTH: 0.237614
G2 X124.88 Y110.638 I-1.915 J1.312 E.00543
; LINE_WIDTH: 0.221508
G1 X124.706 Y110.508 E.00177
; LINE_WIDTH: 0.191324
G1 X124.531 Y110.379 E.0015
; WIPE_START
G1 X124.706 Y110.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.597 Y116.179 Z1.7 F42000
G1 X111.269 Y125.421 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.191222
G1 F15000
M204 S6000
G1 X111.094 Y125.292 E.0015
; LINE_WIDTH: 0.237526
G3 X110.638 Y124.88 I1.312 J-1.914 E.00542
; LINE_WIDTH: 0.221405
G1 X110.508 Y124.706 E.00177
; LINE_WIDTH: 0.191231
G1 X110.379 Y124.531 E.0015
; WIPE_START
G1 X110.508 Y124.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.368 Y119.815 Z1.7 F42000
G1 X119.308 Y117.361 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.180724
G1 F15000
M204 S6000
G1 X119.336 Y117.208 E.00101
G1 X119.231 Y117.068 E.00113
; LINE_WIDTH: 0.126283
G1 X118.942 Y116.752 E.00183
G1 X118.699 Y116.543 E.00137
; LINE_WIDTH: 0.182416
G1 X118.52 Y116.413 E.00145
; WIPE_START
G1 X118.699 Y116.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.933 Y119.498 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0925342
G1 F15000
M204 S6000
G1 X117.707 Y119.398 E.00072
M204 S10000
G1 X118.027 Y119.404 F42000
; LINE_WIDTH: 0.0916638
G1 F15000
M204 S6000
G1 X117.806 Y119.497 E.00069
M204 S10000
G1 X117.28 Y119.387 F42000
; LINE_WIDTH: 0.193148
G1 F15000
M204 S6000
G1 X117.151 Y119.295 E.00111
; LINE_WIDTH: 0.160862
G1 X117.045 Y119.212 E.00077
; LINE_WIDTH: 0.124229
G1 X116.822 Y119.013 E.00125
G1 X116.56 Y118.721 E.00165
; LINE_WIDTH: 0.175946
G1 X116.465 Y118.593 E.001
G1 X116.471 Y118.554 E.00025
; LINE_WIDTH: 0.140176
G1 X116.476 Y118.532 E.00011
; LINE_WIDTH: 0.103731
G1 X116.494 Y118.439 E.00032
M204 S10000
G1 X116.469 Y117.375 F42000
; LINE_WIDTH: 0.0763834
G1 F15000
M204 S6000
G1 X116.385 Y117.512 E.00036
; WIPE_START
G1 X116.469 Y117.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.121 Y118.274 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
M73 P67 R8
G1 X118.307 Y118.078 E.00439
G1 X118.331 Y117.836 E.00395
G1 X118.23 Y117.604 E.00411
G1 X118.084 Y117.499 E.00291
G1 X117.828 Y117.464 E.0042
G1 X117.614 Y117.572 E.00389
G1 X117.47 Y117.8 E.00439
G1 X117.485 Y118.05 E.00407
G1 X117.642 Y118.25 E.00413
G1 X117.86 Y118.342 E.00384
G1 X118.063 Y118.289 E.0034
M204 S10000
G1 X117.933 Y117.856 F42000
; LINE_WIDTH: 0.4766
G1 F15000
M204 S6000
G2 X117.929 Y117.954 I-.028 J.048 E.00431
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.876 Y117.954 E-.18211
G1 X117.847 Y117.905 E-.19264
G1 X117.876 Y117.856 E-.19265
G1 X117.933 Y117.856 E-.1926
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 14/53
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S188.7
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I-1.199 J.206 P1  F42000
G1 X123.152 Y148.31 Z1.7
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
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.534 Y131.653 F42000
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
; OBJECT_ID: 83
; WIPE_START
G1 X105.605 Y131.653 E-.34973
G1 X105.677 Y131.612 E-.41027
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.805 Y134.34 Z1.8 F42000
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
M73 P67 R7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.534 Y130.466 E.02023
M73 P68 R7
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
; OBJECT_ID: 94
; WIPE_START
G1 X131.68 Y131.766 E-.19285
G1 X131.649 Y131.712 E-.18906
G1 X131.68 Y131.658 E-.18907
G1 X131.743 Y131.658 E-.18902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.455 Y128.024 Z1.8 F42000
G1 X149.102 Y122.26 Z1.8
G1 Z1.4
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
G1 X135.026 Y119.714 Z1.8 F42000
G1 X151.534 Y105.683 Z1.8
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
M73 P69 R7
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
; OBJECT_ID: 116
; WIPE_START
G1 X131.655 Y105.73 E-.1771
G1 X131.627 Y105.682 E-.19431
G1 X131.655 Y105.635 E-.19432
G1 X131.71 Y105.635 E-.19427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X125.658 Y110.286 Z1.8 F42000
G1 X125.036 Y110.764 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.421 Y111.685 I-.929 J.929 E.01663
G1 X125.421 Y124.115 E.20185
G3 X124.115 Y125.421 I-1.314 J-.008 E.03325
G1 X111.685 Y125.421 E.20185
G3 X110.379 Y124.115 I.008 J-1.314 E.03325
G1 X110.379 Y111.685 E.20185
G3 X111.685 Y110.379 I1.314 J.008 E.03325
G1 X124.115 Y110.379 E.20185
G3 X124.993 Y110.722 I-.008 J1.314 E.01565
; WIPE_START
M204 S6000
G1 X125.2 Y110.963 E-.12077
G1 X125.322 Y111.191 E-.09814
G1 X125.397 Y111.438 E-.09811
G1 X125.421 Y111.685 E-.09415
G1 X125.421 Y112.603 E-.34884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.941 Y120.22 Z1.8 F42000
G1 X124.599 Y125.643 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.591 Y125.645 E.00014
G3 X124.319 Y125.672 I-.268 J-1.322 E.00445
G1 X111.481 Y125.672 E.20846
G3 X110.128 Y124.319 I-.004 J-1.349 E.03455
G1 X110.128 Y111.481 E.20846
G3 X111.481 Y110.128 I1.349 J-.004 E.03455
G1 X124.408 Y110.137 E.20991
G3 X125.672 Y111.481 I-.077 J1.339 E.03304
G1 X125.672 Y124.319 E.20846
G3 X124.842 Y125.568 I-1.349 J.004 E.02582
G1 X124.656 Y125.625 E.00316
; WIPE_START
M204 S6000
G1 X124.591 Y125.645 E-.02598
G1 X124.319 Y125.672 E-.10388
G1 X122.661 Y125.672 E-.63015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.598 Y119.96 Z1.8 F42000
G1 X116.771 Y119.027 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.612 Y118.85 E.00415
G3 X117.858 Y116.303 I1.282 J-.951 E.06094
G1 X117.994 Y116.306 E.00238
G3 X116.811 Y119.072 I-.1 J1.593 E.10663
M204 S10000
G1 X116.448 Y119.308 F42000
G1 F6000
M204 S6000
G1 X116.269 Y119.104 E.00475
G3 X117.854 Y115.874 I1.628 J-1.205 E.07732
G1 X118.02 Y115.878 E.0029
G3 X116.487 Y119.354 I-.123 J2.022 E.13615
M204 S250
G1 X116.137 Y119.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.937 Y119.348 E.00495
G3 X117.849 Y115.461 I1.961 J-1.449 E.08661
G1 X118.044 Y115.464 E.00316
G3 X116.194 Y119.643 I-.146 J2.435 E.1527
G1 X116.177 Y119.624 E.00043
; WIPE_START
M204 S6000
G1 X115.937 Y119.348 E-.13861
G1 X115.78 Y119.108 E-.10921
G1 X115.651 Y118.847 E-.11069
G1 X115.529 Y118.477 E-.14803
G1 X115.491 Y118.287 E-.07366
G1 X115.46 Y117.898 E-.14819
G1 X115.468 Y117.815 E-.0316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.064 Y117.566 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.803 Y117.533 E.00426
G1 X117.618 Y117.647 E.00353
G1 X117.525 Y117.843 E.00352
G1 X117.595 Y118.125 E.00473
G1 X117.774 Y118.257 E.00361
G1 X117.992 Y118.268 E.00355
G1 X118.184 Y118.149 E.00367
G1 X118.276 Y117.948 E.00359
G1 X118.279 Y117.879 E.00113
G1 X118.197 Y117.664 E.00373
G1 X118.112 Y117.601 E.00172
M204 S10000
G1 X117.929 Y117.87 F42000
; LINE_WIDTH: 0.35916
G1 F15000
M204 S6000
G1 X117.866 Y117.907 E.00101
G1 X117.913 Y117.934 E.00076
M204 S10000
G1 X117.171 Y117.633 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.122 Y117.926 E.00482
G1 X117.238 Y118.312 E.00653
G1 X117.424 Y118.519 E.00452
G1 X117.701 Y118.656 E.00502
G1 X118.017 Y118.673 E.00513
G1 X118.306 Y118.567 E.005
G1 X118.532 Y118.359 E.005
G1 X118.661 Y118.079 E.00499
G1 X118.677 Y117.857 E.00362
G1 X118.592 Y117.548 E.0052
G1 X118.401 Y117.305 E.00502
G1 X118.236 Y117.197 E.00319
G1 X117.844 Y117.124 E.00648
G1 X117.57 Y117.196 E.0046
G1 X117.324 Y117.377 E.00496
G1 X117.201 Y117.582 E.00387
M204 S10000
G1 X116.776 Y118.201 F42000
G1 F15000
M204 S6000
G1 X116.882 Y118.498 E.00512
G1 X117.179 Y118.836 E.00731
G1 X117.598 Y119.042 E.00759
G1 X118.073 Y119.069 E.00772
G1 X118.512 Y118.911 E.00758
G1 X118.856 Y118.595 E.00758
G1 X119.05 Y118.171 E.00757
G2 X119.01 Y117.494 I-1.296 J-.263 E.01115
G1 X118.766 Y117.096 E.00758
G1 X118.385 Y116.823 E.00761
G1 X117.962 Y116.721 E.00707
G1 X117.516 Y116.782 E.00731
G1 X117.113 Y117.019 E.00759
G1 X116.833 Y117.391 E.00756
G1 X116.719 Y117.861 E.00786
G1 X116.766 Y118.142 E.00462
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.719 Y117.861 E-.10805
G1 X116.833 Y117.391 E-.18398
G1 X117.113 Y117.019 E-.1769
G1 X117.516 Y116.782 E-.17764
G1 X117.812 Y116.742 E-.11343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 15/53
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S160.65
; OBJECT_ID: 105
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-1.205 J.172 P1  F42000
G1 X122.31 Y148.31 Z1.8
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
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 105
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
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
G1 X125.692 Y129.43 F42000
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
M73 P70 R7
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
M73 P71 R7
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
; OBJECT_ID: 83
; WIPE_START
G1 X126.345 Y129.657 E-.38435
G1 X126.584 Y129.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G1 X132.418 Y134.885 Z1.9 F42000
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
M73 P71 R6
G1 X152.57 Y138.762
G1 X148.429 Y134.621 E.0951
G1 X148.429 Y135.184
G1 X152.57 Y139.326 E.0951
M73 P72 R6
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
; OBJECT_ID: 94
; WIPE_START
G1 X152.345 Y129.657 E-.38435
G1 X152.584 Y129.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.848 Y123.308 Z1.9 F42000
G1 X148.26 Y122.26 Z1.9
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
G1 X134.759 Y119.425 Z1.9 F42000
G1 X151.692 Y103.43 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
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
M73 P73 R6
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
M73 P74 R6
G1 X129.429 Y107.656
G1 X133.521 Y111.748 E.09396
G1 X133.521 Y112.312
G1 X129.429 Y108.22 E.09396
G1 X129.429 Y108.784
G1 X133.521 Y112.875 E.09396
G1 X133.521 Y113.439
G1 X129.429 Y109.347 E.09396
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
; OBJECT_ID: 116
; WIPE_START
G1 X152.345 Y103.657 E-.38435
G1 X152.584 Y103.964 E-.37565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.173 Y105.789 Z1.9 F42000
G1 X125.055 Y110.745 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.443 Y111.675 I-.937 J.937 E.01678
G1 X125.443 Y124.125 E.20216
G3 X124.125 Y125.443 I-1.326 J-.008 E.03356
G1 X111.675 Y125.443 E.20216
G3 X110.357 Y124.125 I.008 J-1.326 E.03356
G1 X110.357 Y111.675 E.20216
G3 X111.675 Y110.357 I1.326 J.008 E.03356
G1 X124.125 Y110.357 E.20216
G3 X125.011 Y110.704 I-.008 J1.326 E.01581
; WIPE_START
M204 S6000
G1 X125.22 Y110.947 E-.12168
G1 X125.343 Y111.177 E-.09901
G1 X125.418 Y111.426 E-.09904
G1 X125.443 Y111.675 E-.09507
G1 X125.443 Y112.583 E-.34521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.962 Y120.201 Z1.9 F42000
G1 X124.616 Y125.672 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.61 Y125.673 E.0001
G3 X124.336 Y125.7 I-.27 J-1.333 E.00448
G1 X111.464 Y125.7 E.20901
G3 X110.1 Y124.336 I-.005 J-1.36 E.03483
G1 X110.1 Y111.464 E.20901
G3 X111.464 Y110.1 I1.36 J-.005 E.03483
G1 X124.432 Y110.109 E.21058
G3 X125.7 Y111.464 I-.084 J1.35 E.03321
G1 X125.7 Y124.336 E.20901
G3 X124.864 Y125.596 I-1.36 J.005 E.02604
G1 X124.673 Y125.654 E.00324
; WIPE_START
M204 S6000
G1 X124.61 Y125.673 E-.02503
G1 X124.336 Y125.7 E-.10471
G1 X122.677 Y125.7 E-.63026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.619 Y119.985 Z1.9 F42000
G1 X116.773 Y119.029 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.575 Y118.8 E.00529
G3 X117.858 Y116.303 I1.318 J-.9 E.05987
G1 X117.992 Y116.306 E.00234
G3 X116.812 Y119.074 I-.098 J1.594 E.10661
M204 S10000
G1 X116.445 Y119.303 F42000
G1 F6000
M204 S6000
G1 X116.222 Y119.039 E.00603
G3 X117.854 Y115.874 I1.674 J-1.14 E.07596
G1 X118.017 Y115.877 E.00286
G3 X116.483 Y119.35 I-.121 J2.022 E.13628
M204 S250
G1 X116.129 Y119.567 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.881 Y119.271 E.00627
G3 X117.85 Y115.461 I2.017 J-1.372 E.08508
G1 X118.042 Y115.464 E.00312
G3 X116.192 Y119.642 I-.144 J2.435 E.15276
G1 X116.168 Y119.613 E.00062
; WIPE_START
M204 S6000
G1 X115.881 Y119.271 E-.16954
G1 X115.689 Y118.932 E-.14808
G1 X115.529 Y118.476 E-.18336
G1 X115.462 Y117.997 E-.18396
G1 X115.47 Y117.8 E-.07506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.073 Y117.569 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.8 Y117.535 E.00446
G1 X117.621 Y117.643 E.0034
G1 X117.525 Y117.844 E.00362
G1 X117.595 Y118.125 E.00471
G1 X117.772 Y118.257 E.00359
G1 X117.993 Y118.268 E.0036
G1 X118.187 Y118.148 E.0037
G1 X118.276 Y117.948 E.00356
G1 X118.279 Y117.881 E.00107
G1 X118.199 Y117.667 E.00372
G1 X118.12 Y117.605 E.00162
M204 S10000
G1 X117.928 Y117.871 F42000
; LINE_WIDTH: 0.36074
G1 F15000
M204 S6000
G1 X117.864 Y117.908 E.00102
G1 X117.912 Y117.935 E.00077
M204 S10000
G1 X118.636 Y118.149 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X118.677 Y117.859 E.00474
G1 X118.593 Y117.548 E.00523
G1 X118.421 Y117.323 E.00461
G1 X118.24 Y117.199 E.00356
G1 X117.845 Y117.124 E.00652
G1 X117.567 Y117.198 E.00467
G1 X117.327 Y117.374 E.00484
G1 X117.167 Y117.64 E.00505
G1 X117.122 Y117.845 E.0034
G1 X117.2 Y118.238 E.0065
G1 X117.364 Y118.464 E.00454
G1 X117.634 Y118.631 E.00515
G1 X117.942 Y118.676 E.00505
G1 X118.229 Y118.605 E.0048
G1 X118.482 Y118.415 E.00514
G1 X118.606 Y118.201 E.00402
M204 S10000
G1 X119.075 Y117.837 F42000
G1 F15000
M204 S6000
G1 X119.006 Y117.486 E.00582
G1 X118.766 Y117.096 E.00744
G1 X118.389 Y116.825 E.00753
G1 X117.962 Y116.721 E.00714
G1 X117.509 Y116.785 E.00743
G1 X117.106 Y117.025 E.0076
G1 X116.826 Y117.407 E.0077
G1 X116.72 Y117.846 E.00733
G1 X116.781 Y118.276 E.00706
G1 X117.003 Y118.669 E.00733
G1 X117.387 Y118.965 E.00787
G1 X117.82 Y119.079 E.00728
G1 X118.291 Y119.015 E.00771
G1 X118.693 Y118.776 E.0076
G1 X118.967 Y118.409 E.00743
G1 X119.081 Y117.946 E.00774
G1 X119.078 Y117.897 E.0008
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X119.081 Y117.946 E-.01863
G1 X118.967 Y118.409 E-.18123
G1 X118.693 Y118.776 E-.17384
G1 X118.291 Y119.015 E-.17777
G1 X117.82 Y119.079 E-.18045
G1 X117.749 Y119.06 E-.02807
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 16/53
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I.914 J.803 P1  F42000
G1 X125.073 Y110.727 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
M204 S5000
G3 X125.465 Y111.665 I-.946 J.946 E.01694
G1 X125.465 Y124.135 E.20248
G3 X124.135 Y125.465 I-1.338 J-.008 E.03387
G1 X111.665 Y125.465 E.20248
G3 X110.335 Y124.135 I.008 J-1.338 E.03387
G1 X110.335 Y111.665 E.20248
G3 X111.665 Y110.335 I1.338 J.008 E.03387
G1 X124.135 Y110.335 E.20248
G3 X125.03 Y110.686 I-.008 J1.338 E.01596
; WIPE_START
G1 F3600
M204 S6000
G1 X125.24 Y110.93 E-.12257
G1 X125.364 Y111.162 E-.09992
G1 X125.44 Y111.414 E-.09994
G1 X125.465 Y111.665 E-.09597
G1 X125.465 Y112.564 E-.34159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.982 Y120.181 Z2 F42000
G1 X124.633 Y125.7 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X124.629 Y125.701 E.00006
G3 X124.353 Y125.729 I-.272 J-1.344 E.00452
G1 X111.447 Y125.729 E.20956
G3 X110.071 Y124.353 I-.005 J-1.371 E.03512
G1 X110.071 Y111.447 E.20956
G3 X111.447 Y110.071 I1.371 J-.005 E.03512
G1 X124.457 Y110.082 E.21125
G3 X125.729 Y111.447 I-.091 J1.36 E.03337
G1 X125.729 Y124.353 E.20956
G3 X124.885 Y125.623 I-1.371 J.005 E.02625
G1 X124.69 Y125.683 E.00331
; WIPE_START
G1 F3600
M204 S6000
G1 X124.629 Y125.701 E-.0242
G1 X124.353 Y125.729 E-.10554
G1 X122.694 Y125.729 E-.63026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.64 Y120.01 Z2 F42000
G1 X116.77 Y119.026 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1733
M204 S6000
G1 X116.611 Y118.851 E.00413
G3 X117.858 Y116.303 I1.282 J-.951 E.06097
G1 X117.99 Y116.306 E.0023
G3 X116.809 Y119.071 I-.096 J1.594 E.1067
M204 S10000
G1 X116.448 Y119.307 F42000
G1 F1733
M204 S6000
G1 X116.268 Y119.105 E.00472
G3 X117.854 Y115.874 I1.627 J-1.206 E.07736
G1 X118.015 Y115.877 E.00281
G3 X116.486 Y119.353 I-.12 J2.022 E.13622
M204 S250
G1 X116.136 Y119.578 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
M204 S5000
M73 P75 R6
G1 X115.937 Y119.35 E.00492
G3 X117.849 Y115.461 I1.96 J-1.451 E.08666
G1 X118.039 Y115.464 E.00308
G3 X116.193 Y119.644 I-.142 J2.435 E.15275
G1 X116.175 Y119.623 E.00044
; WIPE_START
G1 F3600
M204 S6000
G1 X115.937 Y119.35 E-.13784
G1 X115.829 Y119.189 E-.07363
G1 X115.652 Y118.849 E-.14565
G1 X115.509 Y118.386 E-.18411
G1 X115.46 Y117.898 E-.18638
G1 X115.469 Y117.813 E-.03239
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
G1 X116.98 Y118.613 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1733
M204 S6000
G1 X117.186 Y118.84 E.00497
G1 X117.597 Y119.042 E.00745
G1 X118.072 Y119.069 E.00773
G1 X118.505 Y118.916 E.00745
G1 X118.855 Y118.596 E.00771
G1 X119.051 Y118.171 E.0076
G2 X119.007 Y117.487 I-1.301 J-.26 E.01125
G1 X118.76 Y117.09 E.00758
G1 X118.386 Y116.824 E.00745
G1 X117.96 Y116.721 E.00713
G1 X117.517 Y116.782 E.00725
G1 X117.107 Y117.024 E.00773
G1 X116.83 Y117.399 E.00757
G1 X116.719 Y117.862 E.00773
G1 X116.796 Y118.321 E.00756
G1 X116.948 Y118.563 E.00464
M204 S10000
G1 X117.931 Y117.87 F42000
; LINE_WIDTH: 0.35664
G1 F1733
M204 S6000
G1 X117.868 Y117.906 E.00099
G1 X117.915 Y117.933 E.00074
M204 S10000
G1 X118.072 Y117.568 F42000
; LINE_WIDTH: 0.41999
G1 F1733
M204 S6000
G1 X117.805 Y117.533 E.00437
G1 X117.618 Y117.648 E.00358
G1 X117.524 Y117.856 E.00371
G1 X117.558 Y118.064 E.00343
G1 X117.777 Y118.259 E.00476
G1 X117.993 Y118.268 E.0035
G1 X118.187 Y118.147 E.00371
G1 X118.276 Y117.949 E.00351
G1 X118.278 Y117.875 E.00121
G1 X118.195 Y117.662 E.00371
G1 X118.119 Y117.604 E.00155
M204 S10000
G1 X118.166 Y117.181 F42000
G1 F1733
M204 S6000
G1 X117.79 Y117.127 E.00616
G1 X117.499 Y117.229 E.00502
G1 X117.272 Y117.436 E.00498
G1 X117.139 Y117.722 E.00512
G1 X117.129 Y118.029 E.00498
G1 X117.226 Y118.291 E.00455
G1 X117.512 Y118.574 E.00653
G1 X117.774 Y118.668 E.00452
G1 X118.089 Y118.655 E.00512
G1 X118.362 Y118.525 E.00491
G1 X118.57 Y118.295 E.00503
G1 X118.671 Y118.003 E.00502
G1 X118.676 Y117.852 E.00246
G1 X118.591 Y117.545 E.00516
G1 X118.393 Y117.298 E.00514
G1 X118.219 Y117.208 E.00318
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X118.393 Y117.298 E-.07448
G1 X118.591 Y117.545 E-.12032
G1 X118.676 Y117.852 E-.1208
G1 X118.671 Y118.003 E-.0575
G1 X118.57 Y118.295 E-.11751
G1 X118.362 Y118.525 E-.11779
G1 X118.089 Y118.655 E-.11493
G1 X117.993 Y118.658 E-.03668
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 17/53
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I.908 J.811 P1  F42000
G1 X125.091 Y110.709 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1734
M204 S5000
G3 X125.487 Y111.655 I-.955 J.955 E.01709
G1 X125.487 Y124.145 E.2028
G3 X124.145 Y125.487 I-1.35 J-.008 E.03418
G1 X111.655 Y125.487 E.2028
G3 X110.313 Y124.145 I.008 J-1.35 E.03418
G1 X110.313 Y111.655 E.2028
G3 X111.655 Y110.313 I1.35 J.008 E.03418
G1 X124.145 Y110.313 E.2028
G3 X125.048 Y110.667 I-.008 J1.35 E.01612
; WIPE_START
G1 F3600
M204 S6000
G1 X125.26 Y110.914 E-.12348
G1 X125.385 Y111.148 E-.10084
G1 X125.462 Y111.402 E-.10084
G1 X125.487 Y111.655 E-.09688
G1 X125.487 Y112.545 E-.33796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.004 Y120.162 Z2.1 F42000
G1 X124.65 Y125.729 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F1734
M204 S5000
G1 X124.649 Y125.73 E.00003
G3 X124.37 Y125.757 I-.274 J-1.355 E.00455
G1 X111.43 Y125.757 E.21012
G3 X110.043 Y124.37 I-.005 J-1.383 E.03541
G1 X110.043 Y111.43 E.21012
G3 X111.43 Y110.043 I1.383 J-.005 E.03541
G1 X124.481 Y110.054 E.21192
G3 X125.757 Y111.43 I-.098 J1.371 E.03354
G1 X125.757 Y124.37 E.21012
G3 X124.906 Y125.651 I-1.383 J.005 E.02647
G1 X124.708 Y125.711 E.00338
; WIPE_START
G1 F3600
M204 S6000
G1 X124.649 Y125.73 E-.02348
G1 X124.37 Y125.757 E-.10639
G1 X122.712 Y125.757 E-.63014
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.663 Y120.033 Z2.1 F42000
G1 X116.769 Y119.018 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1734
M204 S6000
G1 X116.607 Y118.846 E.00412
G3 X117.858 Y116.303 I1.286 J-.947 E.06088
G1 X117.988 Y116.305 E.00226
G3 X116.826 Y119.087 I-.095 J1.594 E.10632
G1 X116.807 Y119.064 E.00052
M204 S10000
G1 X116.452 Y119.303 F42000
G1 F1734
M204 S6000
G1 X116.263 Y119.099 E.00485
G3 X117.854 Y115.874 I1.631 J-1.2 E.07725
G1 X118.013 Y115.877 E.00278
G3 X116.539 Y119.404 I-.118 J2.022 E.13496
G1 X116.491 Y119.349 E.00127
M204 S250
G1 X116.161 Y119.605 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1734
M204 S5000
G1 X116.06 Y119.503 E.00232
G3 X117.849 Y115.461 I1.837 J-1.604 E.08987
G1 X118.037 Y115.464 E.00304
G3 X116.262 Y119.709 I-.14 J2.435 E.15122
G1 X116.203 Y119.648 E.00139
; WIPE_START
G1 F3600
M204 S6000
G1 X116.06 Y119.503 E-.07718
G1 X115.933 Y119.343 E-.07799
G1 X115.689 Y118.932 E-.18145
G1 X115.529 Y118.476 E-.18343
G1 X115.491 Y118.287 E-.07354
G1 X115.46 Y117.907 E-.14479
G1 X115.466 Y117.85 E-.02162
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
G1 X116.776 Y118.201 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1734
M204 S6000
G1 X116.881 Y118.498 E.00512
G1 X117.178 Y118.835 E.00729
G1 X117.599 Y119.043 E.00762
G1 X118.064 Y119.07 E.00757
G1 X118.505 Y118.915 E.00759
G1 X118.846 Y118.609 E.00744
G1 X119.012 Y118.281 E.00598
G1 X119.081 Y117.946 E.00555
G2 X119.01 Y117.493 I-1.739 J.041 E.00746
G1 X118.76 Y117.09 E.00771
G1 X118.386 Y116.824 E.00745
G1 X117.958 Y116.721 E.00715
G1 X117.509 Y116.785 E.00736
G1 X117.107 Y117.024 E.00761
G1 X116.826 Y117.407 E.00771
G1 X116.719 Y117.861 E.00757
G1 X116.766 Y118.142 E.00463
M204 S10000
G1 X117.929 Y117.871 F42000
; LINE_WIDTH: 0.35918
G1 F1734
M204 S6000
G1 X117.866 Y117.907 E.00101
G1 X117.914 Y117.935 E.00076
M204 S10000
G1 X118.077 Y117.569 F42000
; LINE_WIDTH: 0.41999
G1 F1734
M204 S6000
G1 X117.801 Y117.534 E.00452
G1 X117.621 Y117.643 E.0034
G1 X117.526 Y117.84 E.00356
G1 X117.595 Y118.124 E.00476
G1 X117.774 Y118.257 E.00362
G1 X117.991 Y118.268 E.00354
G1 X118.18 Y118.156 E.00355
G1 X118.276 Y117.948 E.00373
G1 X118.279 Y117.878 E.00114
G1 X118.205 Y117.676 E.00349
G1 X118.123 Y117.608 E.00174
M204 S10000
G1 X118.416 Y117.319 F42000
G1 F1734
M204 S6000
G1 X118.239 Y117.198 E.00348
G1 X117.844 Y117.124 E.00652
G1 X117.567 Y117.198 E.00466
G1 X117.327 Y117.374 E.00483
G1 X117.161 Y117.656 E.00532
G1 X117.122 Y117.926 E.00442
G1 X117.238 Y118.311 E.00653
G1 X117.422 Y118.518 E.00449
G1 X117.702 Y118.656 E.00507
G1 X118.009 Y118.673 E.005
G1 X118.3 Y118.571 E.00501
G1 X118.525 Y118.37 E.0049
M73 P76 R5
G1 X118.661 Y118.078 E.00523
G1 X118.677 Y117.856 E.00362
G1 X118.599 Y117.56 E.00496
G1 X118.452 Y117.367 E.00394
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X118.599 Y117.56 E-.09227
G1 X118.677 Y117.856 E-.11616
G1 X118.661 Y118.078 E-.08461
G1 X118.525 Y118.37 E-.12229
G1 X118.3 Y118.571 E-.11465
G1 X118.009 Y118.673 E-.11719
G1 X117.713 Y118.656 E-.11283
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 18/53
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I.892 J.828 P1  F42000
G1 X125.11 Y110.69 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1739
M204 S5000
G3 X125.509 Y111.646 I-.963 J.963 E.01725
G1 X125.509 Y124.154 E.20311
G3 X124.154 Y125.509 I-1.362 J-.008 E.0345
G1 X111.646 Y125.509 E.20311
G3 X110.291 Y124.154 I.008 J-1.362 E.0345
G1 X110.291 Y111.646 E.20311
G3 X111.646 Y110.291 I1.362 J.008 E.0345
G1 X124.154 Y110.291 E.20311
G3 X125.066 Y110.649 I-.008 J1.362 E.01627
; WIPE_START
G1 F3600
M204 S6000
G1 X125.28 Y110.897 E-.1244
G1 X125.406 Y111.133 E-.10174
G1 X125.484 Y111.39 E-.10175
G1 X125.509 Y111.646 E-.09779
G1 X125.509 Y112.526 E-.33432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.025 Y120.143 Z2.2 F42000
G1 X124.668 Y125.758 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1739
M204 S5000
G3 X124.387 Y125.785 I-.276 J-1.366 E.00459
G1 X111.413 Y125.785 E.21067
G3 X110.015 Y124.387 I-.005 J-1.394 E.0357
G1 X110.015 Y111.413 E.21067
G3 X111.413 Y110.015 I1.394 J-.005 E.0357
G1 X124.505 Y110.026 E.21259
G3 X125.785 Y111.413 I-.106 J1.381 E.03371
G1 X125.785 Y124.387 E.21067
G3 X124.726 Y125.744 I-1.394 J.005 E.03014
; WIPE_START
G1 F3600
M204 S6000
G1 X124.387 Y125.785 E-.12987
G1 X122.729 Y125.785 E-.63013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.681 Y120.06 Z2.2 F42000
G1 X116.758 Y119.013 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1739
M204 S6000
G1 X116.727 Y118.991 E.00066
G3 X117.858 Y116.303 I1.165 J-1.091 E.06418
G1 X117.986 Y116.305 E.00223
G3 X116.924 Y119.168 I-.094 J1.594 E.10412
G1 X116.802 Y119.054 E.00292
M204 S10000
G1 X116.471 Y119.33 F42000
G1 F1739
M204 S6000
G1 X116.419 Y119.287 E.00117
G3 X117.854 Y115.874 I1.475 J-1.388 E.08153
G1 X118.01 Y115.877 E.00273
G3 X116.663 Y119.507 I-.116 J2.022 E.13217
G1 X116.515 Y119.37 E.00352
M204 S250
G1 X116.171 Y119.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1739
M204 S5000
G1 X116.122 Y119.572 E.0011
G3 X117.85 Y115.461 I1.774 J-1.673 E.09139
G1 X118.034 Y115.464 E.003
G3 X116.262 Y119.709 I-.138 J2.435 E.15125
G1 X116.213 Y119.661 E.00111
; WIPE_START
G1 F3600
M204 S6000
G1 X116.122 Y119.572 E-.04853
G1 X115.829 Y119.189 E-.18329
G1 X115.615 Y118.755 E-.18402
G1 X115.491 Y118.289 E-.18309
G1 X115.46 Y117.898 E-.14906
G1 X115.463 Y117.867 E-.012
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
G1 X119.075 Y117.835 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1739
M204 S6000
G1 X119.006 Y117.485 E.0058
G1 X118.76 Y117.09 E.00754
G1 X118.387 Y116.824 E.00745
G1 X117.956 Y116.721 E.00719
G1 X117.518 Y116.782 E.00719
G1 X117.107 Y117.024 E.00775
G1 X116.826 Y117.407 E.00771
G1 X116.719 Y117.862 E.00759
G1 X116.793 Y118.313 E.00742
G1 X117.03 Y118.699 E.00736
G1 X117.384 Y118.963 E.00717
G1 X117.829 Y119.079 E.00747
G1 X118.29 Y119.015 E.00755
G1 X118.693 Y118.776 E.0076
G1 X118.974 Y118.393 E.00772
G1 X119.081 Y117.946 E.00746
G1 X119.078 Y117.895 E.00082
M204 S10000
G1 X118.073 Y117.568 F42000
G1 F1739
M204 S6000
G1 X117.805 Y117.533 E.00439
G1 X117.621 Y117.643 E.00347
G1 X117.524 Y117.854 E.00378
G1 X117.555 Y118.056 E.00332
G1 X117.769 Y118.255 E.00475
G1 X117.992 Y118.268 E.00363
G1 X118.181 Y118.154 E.00357
G1 X118.276 Y117.949 E.00367
G1 X118.279 Y117.881 E.00111
G1 X118.206 Y117.677 E.00351
G1 X118.119 Y117.606 E.00181
M204 S10000
G1 X117.932 Y117.87 F42000
; LINE_WIDTH: 0.35422
G1 F1739
M204 S6000
G1 X117.87 Y117.906 E.00098
G1 X117.916 Y117.932 E.00073
M204 S10000
G1 X117.372 Y118.456 F42000
; LINE_WIDTH: 0.41999
G1 F1739
M204 S6000
G1 X117.7 Y118.655 E.00623
G1 X118.014 Y118.673 E.00511
G1 X118.3 Y118.571 E.00492
G1 X118.528 Y118.365 E.005
G1 X118.661 Y118.078 E.00513
G1 X118.677 Y117.858 E.00358
G1 X118.6 Y117.56 E.005
G1 X118.418 Y117.32 E.00488
G1 X118.239 Y117.199 E.00351
G1 X117.843 Y117.124 E.00655
G1 X117.567 Y117.198 E.00462
G1 X117.327 Y117.374 E.00484
G1 X117.164 Y117.65 E.00522
G1 X117.125 Y117.96 E.00507
G1 X117.215 Y118.269 E.00522
G1 X117.333 Y118.41 E.00299
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.215 Y118.269 E-.06986
G1 X117.125 Y117.96 E-.12226
G1 X117.164 Y117.65 E-.11871
G1 X117.327 Y117.374 E-.12213
G1 X117.567 Y117.198 E-.1132
G1 X117.843 Y117.124 E-.10823
G1 X118.116 Y117.175 E-.1056
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 19/53
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I.828 J.892 P1  F42000
G1 X125.128 Y110.672 Z2.2
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G3 X125.531 Y111.636 I-.972 J.972 E.0174
G1 X125.531 Y124.164 E.20343
G3 X124.164 Y125.531 I-1.375 J-.008 E.03481
G1 X111.636 Y125.531 E.20343
G3 X110.269 Y124.164 I.008 J-1.375 E.03481
G1 X110.269 Y111.636 E.20343
G3 X111.636 Y110.269 I1.375 J.008 E.03481
G1 X124.164 Y110.269 E.20343
G3 X125.085 Y110.63 I-.008 J1.375 E.01643
; WIPE_START
G1 F3600
M204 S6000
G1 X125.3 Y110.881 E-.12533
G1 X125.427 Y111.119 E-.10264
G1 X125.505 Y111.378 E-.10267
G1 X125.531 Y111.636 E-.0987
G1 X125.531 Y112.506 E-.33067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.046 Y120.123 Z2.3 F42000
G1 X124.685 Y125.786 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F1741
M204 S5000
G1 X124.404 Y125.814 E.00459
G1 X111.396 Y125.814 E.21122
G3 X109.986 Y124.404 I-.005 J-1.405 E.03599
G1 X109.986 Y111.396 E.21122
G3 X111.396 Y109.986 I1.405 J-.005 E.03599
G1 X124.404 Y109.986 E.21122
G1 X124.53 Y109.999 E.00205
G3 X125.814 Y111.396 I-.113 J1.392 E.03388
G1 X125.814 Y124.404 E.21122
G3 X124.744 Y125.773 I-1.405 J.005 E.03042
; WIPE_START
G1 F3600
M204 S6000
G1 X124.404 Y125.814 E-.13004
G1 X122.746 Y125.814 E-.62996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.702 Y120.086 Z2.3 F42000
G1 X116.757 Y119.013 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1741
M204 S6000
G1 X116.738 Y118.996 E.00045
G3 X117.859 Y116.303 I1.159 J-1.097 E.06423
G1 X117.994 Y116.305 E.00237
G3 X116.924 Y119.164 I-.097 J1.593 E.10412
G1 X116.802 Y119.053 E.00288
M204 S10000
G1 X116.471 Y119.331 F42000
G1 F1741
M204 S6000
G1 X116.43 Y119.294 E.00096
G3 X117.854 Y115.874 I1.467 J-1.395 E.08166
G1 X118.014 Y115.877 E.0028
G3 X116.664 Y119.504 I-.118 J2.021 E.13215
G1 X116.515 Y119.371 E.00348
M204 S250
G1 X116.194 Y119.637 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G1 X116.133 Y119.581 E.00135
G3 X117.85 Y115.461 I1.764 J-1.683 E.09158
G1 X118.034 Y115.464 E.00299
G3 X116.412 Y119.832 I-.137 J2.434 E.14805
G1 X116.239 Y119.677 E.00377
; WIPE_START
G1 F3600
M204 S6000
G1 X116.133 Y119.581 E-.05449
G1 X115.882 Y119.271 E-.15161
G1 X115.651 Y118.847 E-.1835
G1 X115.529 Y118.476 E-.14814
G1 X115.491 Y118.287 E-.07336
G1 X115.46 Y117.898 E-.14828
G1 X115.46 Y117.896 E-.00062
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
G1 X116.775 Y118.201 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1741
M204 S6000
G1 X116.952 Y118.596 E.00702
G1 X117.178 Y118.835 E.00534
G1 X117.598 Y119.042 E.0076
G1 X118.072 Y119.069 E.00772
G1 X118.506 Y118.915 E.00747
G1 X118.851 Y118.603 E.00756
M73 P77 R5
G1 X119.051 Y118.17 E.00774
G1 X119.075 Y117.835 E.00545
G1 X119.006 Y117.485 E.00579
G1 X118.761 Y117.09 E.00755
G1 X118.378 Y116.82 E.00761
G1 X117.964 Y116.721 E.00692
G1 X117.518 Y116.782 E.00731
G1 X117.107 Y117.024 E.00776
G1 X116.826 Y117.407 E.0077
G1 X116.719 Y117.863 E.00761
G1 X116.766 Y118.142 E.0046
M204 S10000
G1 X117.929 Y117.869 F42000
; LINE_WIDTH: 0.3607
G1 F1741
M204 S6000
G1 X117.865 Y117.906 E.00102
G1 X117.914 Y117.934 E.00077
M204 S10000
G1 X118.064 Y117.564 F42000
; LINE_WIDTH: 0.41999
G1 F1741
M204 S6000
G1 X117.806 Y117.532 E.00422
G1 X117.621 Y117.643 E.00349
G1 X117.525 Y117.841 E.00358
G1 X117.592 Y118.122 E.00469
G1 X117.77 Y118.256 E.00362
G1 X117.993 Y118.268 E.00361
G1 X118.18 Y118.155 E.00356
G1 X118.276 Y117.949 E.00368
G1 X118.279 Y117.881 E.00112
G1 X118.197 Y117.664 E.00376
G1 X118.112 Y117.6 E.00173
M204 S10000
G1 X118.417 Y117.32 F42000
G1 F1741
M204 S6000
G1 X118.231 Y117.194 E.00364
G1 X117.846 Y117.124 E.00636
G1 X117.568 Y117.197 E.00466
G1 X117.327 Y117.374 E.00485
G1 X117.161 Y117.657 E.00534
G1 X117.122 Y117.928 E.00444
G1 X117.235 Y118.306 E.00641
G1 X117.423 Y118.518 E.0046
G1 X117.7 Y118.655 E.00502
G1 X118.016 Y118.673 E.00513
G1 X118.302 Y118.57 E.00494
G1 X118.528 Y118.364 E.00497
G1 X118.661 Y118.078 E.00512
G1 X118.677 Y117.858 E.00358
G1 X118.596 Y117.554 E.00511
G1 X118.453 Y117.368 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X118.596 Y117.554 E-.08909
G1 X118.677 Y117.858 E-.11959
G1 X118.661 Y118.078 E-.08389
G1 X118.528 Y118.364 E-.1199
G1 X118.302 Y118.57 E-.11632
G1 X118.016 Y118.673 E-.11557
G1 X117.712 Y118.656 E-.11564
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 20/53
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I.892 J.828 P1  F42000
G1 X125.147 Y110.653 Z2.3
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1745
M204 S5000
G3 X125.553 Y111.626 I-.981 J.981 E.01756
G1 X125.553 Y124.174 E.20375
G3 X124.174 Y125.553 I-1.387 J-.008 E.03512
G1 X111.626 Y125.553 E.20375
G3 X110.247 Y124.174 I.008 J-1.387 E.03512
G1 X110.247 Y111.626 E.20375
G3 X111.626 Y110.247 I1.387 J.008 E.03512
G1 X124.174 Y110.247 E.20375
G3 X125.103 Y110.612 I-.008 J1.387 E.01659
; WIPE_START
G1 F3600
M204 S6000
G1 X125.319 Y110.864 E-.12622
G1 X125.448 Y111.105 E-.10355
G1 X125.527 Y111.365 E-.10357
G1 X125.553 Y111.626 E-.09961
G1 X125.553 Y112.487 E-.32705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.067 Y120.104 Z2.4 F42000
G1 X124.703 Y125.814 Z2.4
G1 Z2
G1 E.8 F1800
G1 F1745
M204 S5000
G1 X124.421 Y125.842 E.0046
G1 X111.379 Y125.842 E.21177
G3 X109.958 Y124.421 I-.004 J-1.417 E.03628
G1 X109.958 Y111.379 E.21177
G3 X111.379 Y109.958 I1.417 J-.004 E.03628
G1 X124.421 Y109.958 E.21177
G1 X124.554 Y109.971 E.00217
G3 X125.842 Y111.379 I-.12 J1.403 E.03404
G1 X125.842 Y124.421 E.21177
G3 X124.761 Y125.802 I-1.417 J.004 E.0307
; WIPE_START
G1 F3600
M204 S6000
G1 X124.421 Y125.842 E-.13024
G1 X122.764 Y125.842 E-.62976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.723 Y120.111 Z2.4 F42000
G1 X116.76 Y119.015 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1745
M204 S6000
G1 X116.739 Y118.994 E.00053
G3 X117.859 Y116.303 I1.158 J-1.097 E.06419
G1 X117.992 Y116.305 E.00233
G3 X116.93 Y119.165 I-.096 J1.592 E.10394
G1 X116.805 Y119.055 E.0029
M204 S10000
G1 X116.474 Y119.333 F42000
G1 F1745
M204 S6000
G1 X116.427 Y119.287 E.00113
G3 X117.854 Y115.874 I1.469 J-1.39 E.08151
G1 X118.012 Y115.877 E.00276
G3 X116.673 Y119.508 I-.116 J2.019 E.13187
G1 X116.519 Y119.372 E.00359
M204 S250
G1 X116.198 Y119.64 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1745
M204 S5000
G1 X116.127 Y119.57 E.00161
G3 X117.85 Y115.461 I1.769 J-1.674 E.09135
G1 X118.031 Y115.464 E.00295
G3 X116.426 Y119.838 I-.135 J2.432 E.14771
G1 X116.243 Y119.679 E.00393
; WIPE_START
G1 F3600
M204 S6000
G1 X116.127 Y119.57 E-.06056
G1 X115.827 Y119.188 E-.18466
G1 X115.615 Y118.755 E-.18317
G1 X115.491 Y118.287 E-.18407
G1 X115.46 Y117.9 E-.14753
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
G1 X119.073 Y117.821 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1745
M204 S6000
G1 X119.01 Y117.494 E.00541
G1 X118.756 Y117.085 E.00782
G1 X118.395 Y116.828 E.00719
G1 X117.962 Y116.721 E.00725
G1 X117.508 Y116.785 E.00744
G1 X117.107 Y117.023 E.00759
G1 X116.825 Y117.408 E.00774
G1 X116.719 Y117.853 E.00743
G1 X116.793 Y118.315 E.00759
G1 X117.036 Y118.705 E.00747
G1 X117.393 Y118.967 E.00718
G1 X117.829 Y119.079 E.00731
G1 X118.291 Y119.015 E.00757
G1 X118.692 Y118.777 E.00758
G1 X118.974 Y118.393 E.00775
G1 X119.081 Y117.956 E.0073
G1 X119.076 Y117.881 E.00121
M204 S10000
G1 X118.086 Y117.572 F42000
G1 F1745
M204 S6000
G1 X117.801 Y117.533 E.00468
G1 X117.618 Y117.647 E.00348
G1 X117.524 Y117.851 E.00365
G1 X117.555 Y118.059 E.00341
G1 X117.774 Y118.257 E.00479
G1 X117.991 Y118.268 E.00354
G1 X118.183 Y118.152 E.00364
G1 X118.275 Y117.957 E.0035
G1 X118.277 Y117.867 E.00146
G1 X118.205 Y117.677 E.0033
G1 X118.131 Y117.612 E.0016
M204 S10000
G1 X117.933 Y117.87 F42000
; LINE_WIDTH: 0.35402
G1 F1745
M204 S6000
G1 X117.871 Y117.906 E.00098
G1 X117.917 Y117.933 E.00073
M204 S10000
G1 X118.242 Y118.598 F42000
; LINE_WIDTH: 0.41999
G1 F1745
M204 S6000
G1 X118.479 Y118.418 E.00484
G1 X118.636 Y118.154 E.00499
G1 X118.675 Y117.844 E.00506
G1 X118.6 Y117.561 E.00475
G1 X118.413 Y117.316 E.00501
G1 X118.246 Y117.201 E.00329
G1 X117.84 Y117.125 E.00671
G1 X117.566 Y117.198 E.00462
G1 X117.322 Y117.38 E.00493
G1 X117.164 Y117.646 E.00502
G1 X117.124 Y117.952 E.00502
G1 X117.207 Y118.254 E.00508
G1 X117.318 Y118.418 E.00321
G1 X117.654 Y118.638 E.00653
G1 X117.936 Y118.676 E.00462
G1 X118.184 Y118.613 E.00415
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.936 Y118.676 E-.09714
G1 X117.654 Y118.638 E-.10806
G1 X117.318 Y118.418 E-.1529
G1 X117.207 Y118.254 E-.07502
G1 X117.124 Y117.952 E-.11898
G1 X117.164 Y117.646 E-.11748
G1 X117.286 Y117.441 E-.09043
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 21/53
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.796 J.921 P1  F42000
G1 X125.165 Y110.635 Z2.4
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1880
M204 S5000
G3 X125.575 Y111.616 I-.989 J.989 E.01771
G1 X125.575 Y124.184 E.20406
G3 X124.184 Y125.575 I-1.399 J-.008 E.03543
G1 X111.616 Y125.575 E.20406
G3 X110.225 Y124.184 I.008 J-1.399 E.03543
G1 X110.225 Y111.616 E.20406
G3 X111.616 Y110.225 I1.399 J.008 E.03543
G1 X124.184 Y110.225 E.20406
G3 X125.122 Y110.594 I-.008 J1.399 E.01674
; WIPE_START
G1 F3600
M204 S6000
G1 X125.339 Y110.848 E-.12714
G1 X125.469 Y111.09 E-.10445
G1 X125.549 Y111.353 E-.10448
G1 X125.575 Y111.616 E-.10051
G1 X125.575 Y112.468 E-.32341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.088 Y120.084 Z2.5 F42000
G1 X124.721 Y125.842 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F1880
M204 S5000
G1 X124.438 Y125.87 E.00461
G1 X111.362 Y125.87 E.21232
G3 X109.93 Y124.438 I-.005 J-1.428 E.03657
G1 X109.93 Y111.362 E.21232
G3 X111.362 Y109.93 I1.428 J-.005 E.03657
G1 X124.438 Y109.93 E.21232
G1 X124.578 Y109.944 E.00229
G3 X125.87 Y111.362 I-.127 J1.413 E.03421
G1 X125.87 Y124.438 E.21232
G3 X124.779 Y125.83 I-1.428 J.005 E.03097
; WIPE_START
G1 F3600
M204 S6000
G1 X124.438 Y125.87 E-.13059
G1 X122.782 Y125.87 E-.62941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.238 Y120.624 Z2.5 F42000
G1 X116.143 Y119.588 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F1880
M204 S5000
G1 X115.997 Y119.426 E.00353
G3 X117.85 Y115.461 I1.899 J-1.528 E.08825
G1 X118.029 Y115.464 E.00291
G3 X116.194 Y119.643 I-.133 J2.434 E.15278
G1 X116.183 Y119.632 E.00025
; WIPE_START
G1 F3600
M204 S6000
G1 X115.997 Y119.426 E-.10547
G1 X115.829 Y119.189 E-.11036
G1 X115.65 Y118.843 E-.1481
G1 X115.508 Y118.38 E-.18407
G1 X115.46 Y117.898 E-.18404
G1 X115.465 Y117.825 E-.02796
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
G1 X119.97 Y117.434 F42000
M73 P78 R5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1880
M204 S2000
G1 X118.366 Y115.83 E.03684
G1 X117.802 Y115.83
G1 X119.97 Y117.998 E.04978
G1 X120.007 Y118.598
G1 X117.201 Y115.792 E.06444
G1 X116.811 Y115.965
G1 X119.835 Y118.989 E.06944
G1 X119.604 Y119.322
G1 X116.477 Y116.195 E.0718
G1 X116.196 Y116.478
G1 X119.323 Y119.605 E.0718
G1 X118.988 Y119.834
G1 X115.966 Y116.812 E.06939
G1 X115.793 Y117.202
G1 X118.599 Y120.008 E.06443
G1 X117.998 Y119.97
G1 X115.83 Y117.803 E.04978
G1 X115.83 Y118.366
G1 X117.434 Y119.97 E.03684
; WIPE_START
G1 F3000
M204 S6000
G1 X116.02 Y118.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.989 Y117.145 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0694856
G1 F1880
M204 S6000
G1 X119.976 Y117.124 E.00005
; LINE_WIDTH: 0.086872
G1 X119.926 Y117.05 E.00024
; LINE_WIDTH: 0.121247
G1 X119.876 Y116.976 E.00036
; LINE_WIDTH: 0.152202
G1 X119.823 Y116.903 E.00048
; LINE_WIDTH: 0.191012
G2 X119.721 Y116.767 I-2.324 J1.644 E.00118
; LINE_WIDTH: 0.23661
G2 X119.556 Y116.572 I-3.354 J2.666 E.00224
; LINE_WIDTH: 0.260308
G2 X119.132 Y116.161 I-3.768 J3.459 E.00575
; LINE_WIDTH: 0.220512
G1 X118.997 Y116.051 E.00142
; LINE_WIDTH: 0.189165
G1 X118.92 Y115.993 E.00066
; LINE_WIDTH: 0.162736
G1 X118.791 Y115.9 E.00092
; LINE_WIDTH: 0.136165
G1 X118.661 Y115.808 E.00074
; WIPE_START
G1 F15000
G1 X118.791 Y115.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.14 Y119.991 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.134735
G1 F1880
M204 S6000
G1 X116.943 Y119.853 E.00111
; LINE_WIDTH: 0.165112
G1 X116.87 Y119.799 E.00053
; LINE_WIDTH: 0.201177
G3 X116.737 Y119.697 I1.631 J-2.261 E.00122
; LINE_WIDTH: 0.255766
G3 X116.191 Y119.169 I3.014 J-3.66 E.00726
; LINE_WIDTH: 0.22976
G1 X116.079 Y119.033 E.00149
; LINE_WIDTH: 0.190025
G1 X115.974 Y118.895 E.00119
; LINE_WIDTH: 0.15124
G1 X115.891 Y118.777 E.00077
; LINE_WIDTH: 0.120045
G1 X115.808 Y118.658 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X115.891 Y118.777 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 22/53
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I.803 J.914 P1  F42000
G1 X125.183 Y110.617 Z2.5
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1669
M204 S5000
G3 X125.597 Y111.607 I-.998 J.998 E.01787
G1 X125.597 Y124.193 E.20438
G3 X124.193 Y125.597 I-1.411 J-.008 E.03574
G1 X111.607 Y125.597 E.20438
G3 X110.203 Y124.193 I.008 J-1.411 E.03574
G1 X110.203 Y111.607 E.20438
G3 X111.607 Y110.203 I1.411 J.008 E.03574
G1 X124.193 Y110.203 E.20438
G3 X125.14 Y110.575 I-.008 J1.411 E.0169
; WIPE_START
G1 F3600
M204 S6000
G1 X125.359 Y110.831 E-.12804
G1 X125.49 Y111.076 E-.10536
G1 X125.57 Y111.341 E-.10539
G1 X125.597 Y111.607 E-.10142
G1 X125.597 Y112.448 E-.31979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.11 Y120.065 Z2.6 F42000
G1 X124.739 Y125.871 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X124.455 Y125.899 E.00463
G1 X111.345 Y125.899 E.21287
G3 X109.902 Y124.455 I-.004 J-1.439 E.03686
G1 X109.902 Y111.345 E.21287
G3 X111.345 Y109.902 I1.439 J-.004 E.03686
G1 X124.455 Y109.902 E.21287
G1 X124.603 Y109.916 E.00241
G3 X125.899 Y111.345 I-.134 J1.424 E.03438
G1 X125.899 Y124.455 E.21287
G3 X124.797 Y125.858 I-1.439 J.004 E.03124
; WIPE_START
G1 F3600
M204 S6000
G1 X124.455 Y125.899 E-.13109
G1 X122.8 Y125.899 E-.62892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.638 Y119.501 Z2.6 F42000
G1 X117.03 Y117.03 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.621 I2.306 J.896 E.03329
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53541
G1 X115.828 Y116.612 E-.17705
G1 X115.904 Y116.513 E-.04754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X118.026 Y115.464 I.811 J2.319 E.01544
G3 X118.712 Y115.6 I-.212 J2.862 E.01139
G1 X117.151 Y115.598 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16123
G1 X118.026 Y115.464 E-.17752
G1 X118.432 Y115.519 E-.1555
G1 X118.712 Y115.6 E-.11102
G1 X118.305 Y115.6 E-.15473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X118.77 Y115.621 E.02288
G1 X118.801 Y115.632 E.00053
G3 X120.179 Y117.03 I-.938 J2.304 E.03277
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.621 E-.53585
G1 X118.801 Y115.632 E-.01241
G1 X119.232 Y115.856 E-.18447
G1 X119.288 Y115.901 E-.02728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X120.2 Y118.711 I-2.386 J-.485 E.00552
G1 X120.2 Y117.087 E.02637
G1 X120.217 Y117.135 E.00083
G3 X120.302 Y118.325 I-2.312 J.763 E.01956
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.15174
G1 X120.2 Y117.11 E-.60826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.846 E.00133
G3 X118.77 Y120.179 I-2.268 J-.967 E.03198
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53541
G1 X120.149 Y118.846 E-.03105
G1 X119.917 Y119.272 E-.18421
G1 X119.902 Y119.291 E-.00933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X118.711 Y120.201 E.02638
G3 X117.143 Y120.219 I-.81 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.59569
G1 X118.431 Y120.282 E-.11077
G1 X118.291 Y120.298 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.622 Y118.77 I.859 J-2.267 E.03331
G1 X116.97 Y118.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.823 Y120.089 E-.08564
G1 X116.586 Y119.956 E-.10326
G1 X116.509 Y119.902 E-.03572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.416 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X115.6 Y117.089 I2.377 J.484 E.00552
G1 X115.6 Y118.711 E.02633
G3 X115.498 Y117.475 I2.287 J-.811 E.02036
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.1517
G1 X115.6 Y118.69 E-.6083
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
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 23/53
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.202 Y110.598 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
M73 P79 R5
G3 X125.619 Y111.597 I-1.006 J1.006 E.01803
G1 X125.619 Y124.203 E.2047
G3 X124.203 Y125.619 I-1.423 J-.008 E.03605
G1 X111.597 Y125.619 E.2047
G3 X110.181 Y124.203 I.008 J-1.423 E.03605
G1 X110.181 Y111.597 E.2047
G3 X111.597 Y110.181 I1.423 J.008 E.03605
G1 X124.203 Y110.181 E.2047
G3 X125.158 Y110.557 I-.008 J1.423 E.01705
; WIPE_START
G1 F3600
M204 S6000
G1 X125.379 Y110.815 E-.12896
G1 X125.511 Y111.061 E-.10627
G1 X125.592 Y111.329 E-.1063
G1 X125.619 Y111.597 E-.10233
G1 X125.619 Y112.429 E-.31614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.132 Y120.046 Z2.7 F42000
G1 X124.757 Y125.899 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X124.472 Y125.927 E.00466
G1 X111.328 Y125.927 E.21343
G3 X109.873 Y124.472 I-.004 J-1.451 E.03714
G1 X109.873 Y111.328 E.21343
G3 X111.328 Y109.873 I1.451 J-.004 E.03714
G1 X124.472 Y109.873 E.21343
G1 X124.627 Y109.889 E.00253
G3 X125.927 Y111.328 I-.142 J1.434 E.03455
G1 X125.927 Y124.472 E.21343
G3 X124.816 Y125.886 I-1.451 J.004 E.0315
; WIPE_START
G1 F3600
M204 S6000
G1 X124.472 Y125.927 E-.13169
G1 X122.818 Y125.927 E-.62831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.656 Y119.529 Z2.7 F42000
G1 X117.03 Y117.03 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X115.623 Y117.03 E.02285
G3 X117.03 Y115.621 I2.276 J.866 E.03332
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.623 Y117.03 E-.53532
G1 X115.732 Y116.781 E-.10328
G1 X115.882 Y116.529 E-.11159
G1 X115.898 Y116.509 E-.00981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.089 Y115.599 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X118.024 Y115.464 I.88 J2.784 E.0154
G3 X118.712 Y115.6 I-.208 J2.854 E.01143
G1 X117.149 Y115.599 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16262
G1 X118.024 Y115.464 E-.17576
G1 X118.432 Y115.519 E-.15644
G1 X118.712 Y115.6 E-.11097
G1 X118.306 Y115.6 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X118.77 Y115.621 E.02288
G1 X118.801 Y115.632 E.00053
G3 X120.179 Y117.03 I-.916 J2.281 E.03278
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.621 E-.53584
G1 X118.801 Y115.632 E-.01246
G1 X119.044 Y115.745 E-.10196
G1 X119.29 Y115.897 E-.10974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X120.2 Y118.71 I-2.382 J-.486 E.0055
G1 X120.2 Y117.09 E.0263
G1 X120.246 Y117.23 E.00238
G3 X120.302 Y118.325 I-2.337 J.668 E.01796
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.71 E-.15138
G1 X120.2 Y117.108 E-.60862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.109 Y118.936 E.00292
G3 X118.77 Y120.179 I-2.244 J-1.074 E.03039
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.109 Y118.936 E-.06826
G1 X119.899 Y119.288 E-.1559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59511
G1 X118.333 Y120.301 E-.14796
G1 X118.288 Y120.306 E-.01693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.622 Y118.77 I.892 J-2.3 E.03328
G1 X116.97 Y118.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53546
G1 X116.824 Y120.09 E-.08523
G1 X116.571 Y119.947 E-.11023
G1 X116.512 Y119.899 E-.02908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.512 Y117.417 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X115.6 Y117.09 I2.434 J.484 E.0055
G1 X115.6 Y118.711 E.02631
G3 X115.501 Y117.476 I2.345 J-.81 E.02034
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.09 E-.15123
G1 X115.6 Y118.692 E-.60877
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
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 24/53
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.22 Y110.58 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X125.641 Y111.587 I-1.015 J1.015 E.01818
G1 X125.641 Y124.213 E.20501
G3 X124.213 Y125.64 I-1.436 J-.008 E.03636
G1 X111.587 Y125.64 E.20501
G3 X110.16 Y124.213 I.008 J-1.436 E.03636
G1 X110.16 Y111.587 E.20501
G3 X111.587 Y110.16 I1.436 J.008 E.03636
G1 X124.213 Y110.16 E.20501
G3 X125.177 Y110.538 I-.008 J1.436 E.01721
; WIPE_START
G1 F3600
M204 S6000
G1 X125.399 Y110.798 E-.12985
G1 X125.532 Y111.047 E-.10719
G1 X125.614 Y111.317 E-.1072
G1 X125.641 Y111.587 E-.10324
G1 X125.641 Y112.41 E-.31252
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.154 Y120.027 Z2.8 F42000
G1 X124.776 Y125.927 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X124.489 Y125.955 E.00469
G1 X111.311 Y125.955 E.21398
G3 X109.845 Y124.489 I-.005 J-1.462 E.03743
G1 X109.845 Y111.311 E.21398
G3 X111.311 Y109.845 I1.462 J-.005 E.03743
G1 X124.489 Y109.845 E.21398
G1 X124.651 Y109.861 E.00265
G3 X125.955 Y111.311 I-.149 J1.445 E.03471
G1 X125.955 Y124.489 E.21398
G3 X124.835 Y125.915 I-1.462 J.005 E.03176
; WIPE_START
G1 F3600
M204 S6000
G1 X124.489 Y125.955 E-.13242
G1 X122.837 Y125.955 E-.62759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.675 Y119.558 Z2.8 F42000
G1 X117.03 Y117.03 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.283 J.873 E.03333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53584
G1 X115.732 Y116.781 E-.1036
G1 X115.882 Y116.529 E-.11154
G1 X115.897 Y116.51 E-.00902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X118.021 Y115.463 I.879 J2.788 E.01533
G3 X118.714 Y115.6 I-.208 J2.881 E.01149
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16203
G1 X118.021 Y115.463 E-.17484
G1 X118.431 Y115.519 E-.15729
G1 X118.714 Y115.6 E-.11161
G1 X118.308 Y115.6 E-.15423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-.993 J2.23 E.0312
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04957
G1 X119.292 Y115.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P79 R4
G1 X120.291 Y118.384 Z2.8 F42000
M73 P80 R4
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X120.2 Y118.712 I-2.39 J-.485 E.00553
G1 X120.2 Y117.09 E.02633
G1 X120.246 Y117.231 E.0024
G3 X120.302 Y118.325 I-2.345 J.668 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.712 E-.1521
G1 X120.2 Y117.112 E-.6079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.109 Y118.935 E.00291
G3 X118.77 Y120.178 I-2.204 J-1.033 E.03041
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.109 Y118.935 E-.06817
G1 X119.899 Y119.288 E-.156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.468 Y120.297 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X117.086 Y120.2 I.433 J-2.493 E.00639
G1 X118.708 Y120.202 E.02632
G3 X117.527 Y120.307 I-.807 J-2.398 E.01943
; WIPE_START
G1 F3600
M204 S6000
G1 X117.086 Y120.2 E-.17215
G1 X118.633 Y120.202 E-.58785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.867 J-2.277 E.03332
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.825 Y120.09 E-.08486
G1 X116.571 Y119.947 E-.11056
G1 X116.511 Y119.899 E-.0292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.53 Y117.325 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X115.6 Y117.088 I2.39 J.575 E.00402
G1 X115.6 Y118.712 E.02636
G3 X115.517 Y117.384 I2.32 J-.812 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.11674
G1 X115.6 Y118.712 E-.61693
G1 X115.581 Y118.645 E-.02633
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
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 25/53
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.238 Y110.562 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X125.662 Y111.577 I-1.024 J1.024 E.01834
G1 X125.662 Y124.223 E.20533
G3 X124.223 Y125.662 I-1.448 J-.008 E.03667
G1 X111.577 Y125.662 E.20533
G3 X110.138 Y124.223 I.008 J-1.448 E.03667
G1 X110.138 Y111.577 E.20533
G3 X111.577 Y110.138 I1.448 J.008 E.03667
G1 X124.223 Y110.138 E.20533
G3 X125.195 Y110.52 I-.008 J1.448 E.01736
; WIPE_START
G1 F3600
M204 S6000
G1 X125.419 Y110.782 E-.13074
G1 X125.553 Y111.032 E-.1081
G1 X125.636 Y111.305 E-.10812
G1 X125.662 Y111.577 E-.10414
G1 X125.662 Y112.39 E-.3089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.176 Y120.007 Z2.9 F42000
G1 X124.795 Y125.955 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X124.506 Y125.983 E.00473
G1 X111.294 Y125.983 E.21453
G3 X109.817 Y124.506 I-.004 J-1.473 E.03772
G1 X109.817 Y111.294 E.21453
G3 X111.294 Y109.817 I1.473 J-.004 E.03772
G1 X124.506 Y109.817 E.21453
G1 X124.676 Y109.833 E.00278
G3 X125.983 Y111.294 I-.156 J1.456 E.03488
G1 X125.983 Y124.506 E.21453
G3 X124.854 Y125.943 I-1.473 J.004 E.03201
; WIPE_START
G1 F3600
M204 S6000
G1 X124.506 Y125.983 E-.13326
G1 X122.856 Y125.983 E-.62675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.693 Y119.586 Z2.9 F42000
G1 X117.03 Y117.03 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.621 I2.307 J.897 E.03329
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53544
G1 X115.732 Y116.781 E-.10343
G1 X115.882 Y116.529 E-.11153
G1 X115.898 Y116.509 E-.0096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X118.019 Y115.463 I.879 J2.791 E.01529
G3 X118.714 Y115.6 I-.32 J3.464 E.01152
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16201
G1 X118.019 Y115.463 E-.17388
G1 X118.429 Y115.518 E-.15744
G1 X118.714 Y115.6 E-.11241
G1 X118.308 Y115.6 E-.15426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.015 J2.25 E.03118
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04963
G1 X119.292 Y115.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.289 Y118.383 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X120.2 Y118.711 I-2.429 J-.485 E.00552
G1 X120.2 Y117.09 E.02633
G1 X120.238 Y117.204 E.00196
G3 X120.3 Y118.324 I-2.378 J.694 E.01838
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.15181
G1 X120.2 Y117.111 E-.60819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.847 E.00133
G3 X118.77 Y120.179 I-2.28 J-.979 E.03197
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53544
G1 X120.149 Y118.847 E-.03111
G1 X120.02 Y119.108 E-.11065
G1 X119.901 Y119.29 E-.08281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.279 Y120.258 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X117.086 Y120.2 I.622 J-2.393 E.00326
G1 X118.709 Y120.202 E.02635
G3 X117.337 Y120.273 I-.809 J-2.336 E.02261
; WIPE_START
G1 F3600
M204 S6000
G1 X117.086 Y120.2 E-.09911
G1 X118.709 Y120.202 E-.61671
G1 X118.597 Y120.234 E-.04419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.891 J-2.3 E.03329
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53548
G1 X116.823 Y120.089 E-.08572
G1 X116.57 Y119.946 E-.1103
G1 X116.512 Y119.899 E-.0285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.416 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X115.6 Y117.089 I2.385 J.485 E.00552
G1 X115.6 Y118.713 E.02637
G3 X115.498 Y117.475 I2.294 J-.812 E.0204
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.1518
G1 X115.6 Y118.689 E-.6082
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
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 26/53
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.257 Y110.543 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G3 X125.684 Y111.568 I-1.032 J1.032 E.01849
G1 X125.684 Y124.232 E.20565
G3 X124.232 Y125.684 I-1.46 J-.008 E.03698
G1 X111.568 Y125.684 E.20565
G3 X110.116 Y124.232 I.008 J-1.46 E.03698
G1 X110.116 Y111.568 E.20565
G3 X111.568 Y110.116 I1.46 J.008 E.03698
G1 X124.232 Y110.116 E.20565
G3 X125.214 Y110.502 I-.008 J1.46 E.01752
; WIPE_START
G1 F3600
M204 S6000
G1 X125.439 Y110.765 E-.13165
G1 X125.574 Y111.018 E-.10903
G1 X125.657 Y111.293 E-.10902
G1 X125.684 Y111.568 E-.10506
G1 X125.684 Y112.371 E-.30525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.198 Y119.988 Z3 F42000
G1 X124.815 Y125.983 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X124.523 Y126.012 E.00477
G1 X111.277 Y126.012 E.21508
G3 X109.788 Y124.523 I-.004 J-1.485 E.03801
G1 X109.788 Y111.277 E.21508
G3 X111.277 Y109.788 I1.485 J-.004 E.03801
G1 X124.523 Y109.788 E.21508
G1 X124.7 Y109.806 E.0029
G3 X126.012 Y111.277 I-.164 J1.466 E.03505
G1 X126.012 Y124.523 E.21508
G3 X124.873 Y125.971 I-1.485 J.004 E.03226
; WIPE_START
G1 F3600
M204 S6000
G1 X124.523 Y126.012 E-.13418
G1 X122.876 Y126.012 E-.62582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.712 Y119.615 Z3 F42000
G1 X117.03 Y117.03 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.622 I2.3 J.892 E.03328
G1 X117.03 Y116.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53545
G1 X115.828 Y116.612 E-.17715
G1 X115.904 Y116.513 E-.0474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.09 Y115.598 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G3 X118.016 Y115.463 I.856 J2.624 E.01526
G3 X118.714 Y115.6 I-.276 J3.257 E.01157
G1 X117.15 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.56 Y115.484 E-.16173
G1 X118.016 Y115.463 E-.17333
G1 X118.43 Y115.518 E-.15864
G1 X118.714 Y115.6 E-.11218
G1 X118.308 Y115.6 E-.15411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3 F42000
G1 Z2.6
G1 E.8 F1800
M73 P81 R4
G1 F1729
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.015 J2.251 E.03119
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04954
G1 X119.292 Y115.898 E-.17508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G3 X120.2 Y118.711 I-2.388 J-.485 E.00553
G1 X120.2 Y117.087 E.02638
G1 X120.217 Y117.135 E.00083
G3 X120.302 Y118.325 I-2.314 J.763 E.01957
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.15194
G1 X120.2 Y117.111 E-.60806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.846 E.00133
G3 X118.77 Y120.178 I-2.279 J-.981 E.03196
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53545
G1 X120.149 Y118.846 E-.03105
G1 X120.006 Y119.131 E-.12108
G1 X119.901 Y119.291 E-.07243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.468 Y120.298 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G3 X117.086 Y120.2 I.432 J-2.474 E.00641
G1 X118.708 Y120.202 E.02633
G3 X117.527 Y120.308 I-.807 J-2.379 E.01942
; WIPE_START
G1 F3600
M204 S6000
G1 X117.086 Y120.2 E-.17252
G1 X118.632 Y120.202 E-.58748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.866 J-2.276 E.03332
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53548
G1 X116.824 Y120.09 E-.0853
G1 X116.545 Y119.929 E-.1221
G1 X116.51 Y119.901 E-.01711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.51 Y117.417 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1729
M204 S5000
G3 X115.6 Y117.089 I2.401 J.483 E.00553
G1 X115.6 Y118.71 E.02632
G3 X115.499 Y117.475 I2.311 J-.811 E.02033
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.15189
G1 X115.6 Y118.689 E-.60811
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
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 27/53
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.275 Y110.525 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G3 X125.706 Y111.558 I-1.041 J1.041 E.01865
G1 X125.706 Y124.242 E.20596
G3 X124.242 Y125.706 I-1.472 J-.008 E.03729
G1 X111.558 Y125.706 E.20596
G3 X110.094 Y124.242 I.008 J-1.472 E.03729
G1 X110.094 Y111.558 E.20596
G3 X111.558 Y110.094 I1.472 J.008 E.03729
G1 X124.242 Y110.094 E.20596
G3 X125.232 Y110.483 I-.008 J1.472 E.01767
; WIPE_START
G1 F3600
M204 S6000
G1 X125.459 Y110.749 E-.13257
G1 X125.595 Y111.004 E-.10991
G1 X125.679 Y111.28 E-.10993
G1 X125.706 Y111.558 E-.10596
G1 X125.706 Y112.352 E-.30163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.22 Y119.969 Z3.1 F42000
G1 X124.834 Y126.011 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X124.54 Y126.04 E.00481
G1 X111.26 Y126.04 E.21563
G3 X109.76 Y124.54 I-.004 J-1.496 E.0383
G1 X109.76 Y111.26 E.21563
G3 X111.26 Y109.76 I1.496 J-.004 E.0383
G1 X124.54 Y109.76 E.21563
G1 X124.725 Y109.778 E.00302
G3 X126.04 Y111.26 I-.171 J1.477 E.03522
G1 X126.04 Y124.54 E.21563
G3 X124.893 Y125.999 I-1.496 J.004 E.03251
; WIPE_START
G1 F3600
M204 S6000
G1 X124.54 Y126.04 E-.13518
G1 X122.895 Y126.04 E-.62482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.731 Y119.644 Z3.1 F42000
G1 X117.03 Y117.03 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.278 J.869 E.03333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.828 Y116.612 E-.17733
G1 X115.899 Y116.511 E-.04683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G3 X118.013 Y115.463 I.88 J2.794 E.0152
G3 X118.714 Y115.6 I-.31 J3.446 E.0116
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.16196
G1 X118.013 Y115.463 E-.17194
G1 X118.429 Y115.518 E-.15946
G1 X118.714 Y115.6 E-.11235
G1 X118.308 Y115.6 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.006 J2.243 E.03119
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04956
G1 X119.292 Y115.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G3 X120.2 Y118.71 I-2.381 J-.486 E.0055
G1 X120.2 Y117.09 E.0263
G1 X120.246 Y117.231 E.0024
G3 X120.302 Y118.325 I-2.337 J.667 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.71 E-.15131
G1 X120.2 Y117.108 E-.60869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X120.177 Y118.77 E.02285
G1 X120.149 Y118.847 E.00133
G3 X118.77 Y120.179 I-2.271 J-.971 E.03197
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.177 Y118.77 E-.53532
G1 X120.149 Y118.847 E-.03123
G1 X119.918 Y119.272 E-.18382
G1 X119.901 Y119.291 E-.00963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
M73 P82 R4
G1 F1733
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59513
G1 X118.333 Y120.301 E-.14796
G1 X118.288 Y120.306 E-.01691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.623 Y118.77 I.922 J-2.329 E.03324
G1 X116.97 Y118.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.5355
G1 X116.824 Y120.09 E-.08524
G1 X116.543 Y119.927 E-.12314
G1 X116.51 Y119.901 E-.01612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.531 Y117.326 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1733
M204 S5000
G3 X115.6 Y117.088 I2.425 J.574 E.00401
G1 X115.6 Y118.71 E.02633
G3 X115.518 Y117.384 I2.356 J-.811 E.02183
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.11656
G1 X115.6 Y118.71 E-.61608
G1 X115.581 Y118.64 E-.02736
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
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 28/53
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
G1 X125.294 Y110.506 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G3 X125.728 Y111.548 I-1.05 J1.05 E.0188
G1 X125.728 Y124.252 E.20628
G3 X124.252 Y125.728 I-1.484 J-.008 E.03761
G1 X111.548 Y125.728 E.20628
G3 X110.072 Y124.252 I.008 J-1.484 E.03761
G1 X110.072 Y111.548 E.20628
G3 X111.548 Y110.072 I1.484 J.008 E.03761
G1 X124.252 Y110.072 E.20628
G3 X125.25 Y110.465 I-.008 J1.484 E.01783
; WIPE_START
G1 F3600
M204 S6000
G1 X125.479 Y110.732 E-.13348
G1 X125.616 Y110.989 E-.11083
G1 X125.701 Y111.268 E-.11084
G1 X125.728 Y111.548 E-.10687
G1 X125.728 Y112.332 E-.29798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.243 Y119.949 Z3.2 F42000
G1 X124.854 Y126.039 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G1 X124.557 Y126.068 E.00486
G1 X111.243 Y126.068 E.21618
G3 X109.732 Y124.557 I-.005 J-1.507 E.03859
G1 X109.732 Y111.243 E.21618
G3 X111.243 Y109.732 I1.507 J-.005 E.03859
G1 X124.557 Y109.732 E.21618
G1 X124.749 Y109.751 E.00314
G3 X126.068 Y111.243 I-.178 J1.487 E.03539
G1 X126.068 Y124.557 E.21618
G3 X124.913 Y126.027 I-1.507 J.005 E.03275
; WIPE_START
G1 F3600
M204 S6000
G1 X124.557 Y126.068 E-.13626
G1 X122.915 Y126.068 E-.62374
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
G1 X125.234 Y125.641 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0782642
G1 F1917
M204 S6000
G2 X125.641 Y125.234 I-.694 J-1.101 E.00134
; WIPE_START
G1 F15000
G1 X125.461 Y125.461 E-.37999
G1 X125.234 Y125.641 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.44 Y118.012 Z3.2 F42000
G1 X125.641 Y110.566 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S6000
G2 X125.234 Y110.159 I-1.101 J.694 E.00134
; WIPE_START
G1 F15000
G1 X125.461 Y110.339 E-.37999
G1 X125.641 Y110.566 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.012 Y110.36 Z3.2 F42000
G1 X110.566 Y110.159 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S6000
G2 X110.159 Y110.566 I.694 J1.101 E.00134
; WIPE_START
G1 F15000
G1 X110.339 Y110.339 E-.37999
G1 X110.566 Y110.159 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.36 Y117.788 Z3.2 F42000
G1 X110.159 Y125.234 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S6000
G2 X110.566 Y125.641 I1.101 J-.694 E.00134
; WIPE_START
G1 F15000
G1 X110.339 Y125.461 E-.37999
G1 X110.159 Y125.234 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.059 Y119.383 Z3.2 F42000
G1 X117.03 Y117.03 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1917
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.621 I2.275 J.865 E.03332
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53548
G1 X115.827 Y116.612 E-.1768
G1 X115.898 Y116.509 E-.04773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G3 X118.011 Y115.463 I.81 J2.315 E.01519
G3 X118.714 Y115.6 I-.305 J3.436 E.01165
G1 X117.151 Y115.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16116
G1 X118.011 Y115.463 E-.17175
G1 X118.429 Y115.518 E-.16044
G1 X118.714 Y115.6 E-.11236
G1 X118.308 Y115.6 E-.15431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.889 Y115.67 E.00208
G3 X120.179 Y117.03 I-.99 J2.23 E.03124
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.889 Y115.67 E-.04877
G1 X119.292 Y115.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G3 X120.2 Y118.712 I-2.389 J-.485 E.00553
G1 X120.2 Y117.087 E.02638
G1 X120.217 Y117.135 E.00083
G3 X120.302 Y118.325 I-2.315 J.763 E.01956
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.712 E-.15209
G1 X120.2 Y117.112 E-.60791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.251 J-.949 E.032
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53548
G1 X120.149 Y118.846 E-.03097
G1 X119.918 Y119.272 E-.18407
G1 X119.902 Y119.291 E-.00948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59511
G1 X118.429 Y120.282 E-.11056
G1 X118.287 Y120.299 E-.05433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.622 Y118.77 I.923 J-2.331 E.03325
G1 X116.97 Y118.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53551
G1 X116.824 Y120.09 E-.0853
G1 X116.541 Y119.926 E-.12408
G1 X116.51 Y119.901 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.416 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1917
M204 S5000
G3 X115.6 Y117.088 I2.383 J.484 E.00553
G1 X115.6 Y118.712 E.02636
G3 X115.498 Y117.475 I2.292 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.15205
G1 X115.6 Y118.688 E-.60795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 29/53
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.785 J.93 P1  F42000
G1 X125.312 Y110.488 Z3.2
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X125.75 Y111.538 I-1.058 J1.058 E.01896
G1 X125.75 Y124.262 E.2066
G3 X124.262 Y125.75 I-1.496 J-.008 E.03792
G1 X111.538 Y125.75 E.2066
G3 X110.05 Y124.262 I.008 J-1.496 E.03792
G1 X110.05 Y111.538 E.2066
G3 X111.538 Y110.05 I1.496 J.008 E.03792
G1 X124.262 Y110.05 E.2066
G3 X125.269 Y110.447 I-.008 J1.496 E.01799
; WIPE_START
G1 F3600
M204 S6000
G1 X125.498 Y110.715 E-.13438
G1 X125.637 Y110.975 E-.11174
G1 X125.722 Y111.256 E-.11175
G1 X125.75 Y111.538 E-.10778
G1 X125.75 Y112.313 E-.29436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.265 Y119.93 Z3.3 F42000
G1 X124.874 Y126.067 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X124.574 Y126.097 E.0049
G1 X111.226 Y126.097 E.21673
G3 X109.703 Y124.574 I-.004 J-1.518 E.03888
G1 X109.703 Y111.226 E.21673
G3 X111.226 Y109.703 I1.518 J-.004 E.03888
G1 X124.574 Y109.703 E.21673
G1 X124.773 Y109.723 E.00326
G3 X126.097 Y111.226 I-.186 J1.498 E.03556
G1 X126.097 Y124.574 E.21673
G3 X124.933 Y126.055 I-1.518 J.004 E.03299
; WIPE_START
G1 F3600
M204 S6000
G1 X124.574 Y126.097 E-.1374
G1 X122.935 Y126.097 E-.62261
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
G1 X125.215 Y125.69 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0861364
G1 F1884
M204 S6000
G2 X125.69 Y125.215 I-.707 J-1.182 E.00179
; WIPE_START
G1 F15000
G1 X125.482 Y125.482 E-.38001
G1 X125.215 Y125.69 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.455 Y118.062 Z3.3 F42000
G1 X125.69 Y110.585 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S6000
G2 X125.215 Y110.11 I-1.182 J.707 E.00179
; WIPE_START
G1 F15000
G1 X125.482 Y110.318 E-.38001
G1 X125.69 Y110.585 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.062 Y110.345 Z3.3 F42000
G1 X110.585 Y110.11 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S6000
G2 X110.11 Y110.585 I.707 J1.182 E.00179
; WIPE_START
G1 F15000
G1 X110.318 Y110.318 E-.38001
G1 X110.585 Y110.11 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.345 Y117.738 Z3.3 F42000
G1 X110.11 Y125.215 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S6000
G2 X110.585 Y125.69 I1.182 J-.707 E.00179
; WIPE_START
G1 F15000
G1 X110.318 Y125.482 E-.38001
G1 X110.11 Y125.215 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.038 Y119.387 Z3.3 F42000
M73 P83 R4
G1 X117.03 Y117.03 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.622 I2.288 J.881 E.03329
G1 X117.03 Y116.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53549
G1 X115.829 Y116.611 E-.17757
G1 X115.9 Y116.51 E-.04694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.093 Y115.597 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X118.008 Y115.463 I.808 J2.315 E.01512
G3 X118.714 Y115.6 I-.299 J3.423 E.01169
G1 X117.153 Y115.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16039
G1 X118.008 Y115.463 E-.17083
G1 X118.43 Y115.518 E-.16139
G1 X118.714 Y115.6 E-.11232
G1 X118.306 Y115.599 E-.15507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.047 J2.282 E.03117
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04953
G1 X119.292 Y115.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.288 Y118.383 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X120.2 Y118.711 I-2.462 J-.485 E.00552
G1 X120.2 Y117.087 E.02638
G1 X120.217 Y117.135 E.00083
G3 X120.299 Y118.324 I-2.39 J.762 E.01954
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.1519
G1 X120.2 Y117.111 E-.6081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.0029
G3 X118.77 Y120.178 I-2.217 J-1.045 E.03041
G1 X118.77 Y118.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.11 Y118.934 E-.06779
G1 X119.899 Y119.288 E-.15638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X118.707 Y120.203 E.02632
G3 X117.143 Y120.219 I-.807 J-2.337 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X118.707 Y120.203 E-.59436
G1 X118.284 Y120.305 E-.16564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.622 Y118.77 I.868 J-2.275 E.03331
G1 X116.97 Y118.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53553
G1 X116.823 Y120.089 E-.08578
G1 X116.57 Y119.946 E-.11025
G1 X116.51 Y119.901 E-.02844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.416 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X115.6 Y117.088 I2.383 J.484 E.00553
G1 X115.6 Y118.712 E.02636
G3 X115.498 Y117.475 I2.293 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.15207
G1 X115.6 Y118.688 E-.60793
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 30/53
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I.785 J.93 P1  F42000
G1 X125.33 Y110.47 Z3.3
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G3 X125.772 Y111.529 I-1.067 J1.067 E.01911
G1 X125.772 Y124.271 E.20692
G3 X124.271 Y125.772 I-1.509 J-.008 E.03823
G1 X111.529 Y125.772 E.20692
G3 X110.028 Y124.271 I.008 J-1.509 E.03823
G1 X110.028 Y111.529 E.20692
G3 X111.529 Y110.028 I1.509 J.008 E.03823
G1 X124.271 Y110.028 E.20692
G3 X125.287 Y110.428 I-.008 J1.509 E.01814
; WIPE_START
G1 F3600
M204 S6000
G1 X125.518 Y110.699 E-.13531
G1 X125.658 Y110.96 E-.11263
G1 X125.744 Y111.244 E-.11266
G1 X125.772 Y111.529 E-.10869
G1 X125.772 Y112.294 E-.29071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.288 Y119.911 Z3.4 F42000
G1 X124.894 Y126.095 Z3.4
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G1 X124.591 Y126.125 E.00495
G1 X111.209 Y126.125 E.21729
G3 X109.675 Y124.591 I-.004 J-1.53 E.03917
G1 X109.675 Y111.209 E.21729
G3 X111.209 Y109.675 I1.53 J-.004 E.03917
G1 X124.591 Y109.675 E.21729
G1 X124.798 Y109.695 E.00338
G3 X126.125 Y111.209 I-.193 J1.509 E.03573
G1 X126.125 Y124.591 E.21729
G3 X124.953 Y126.083 I-1.53 J.004 E.03323
; WIPE_START
G1 F3600
M204 S6000
G1 X124.591 Y126.125 E-.13858
G1 X122.955 Y126.125 E-.62142
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
G1 X125.053 Y125.806 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.088576
G1 F1847
M204 S6000
G2 X125.806 Y125.053 I-.541 J-1.294 E.00299
M204 S10000
G1 X125.806 Y110.747 F42000
G1 F1847
M204 S6000
G2 X125.053 Y109.994 I-1.294 J.541 E.00299
M204 S10000
G1 X110.747 Y109.994 F42000
G1 F1847
M204 S6000
G2 X109.994 Y110.747 I.541 J1.294 E.00299
M204 S10000
G1 X109.994 Y125.053 F42000
G1 F1847
M204 S6000
G2 X110.747 Y125.806 I1.294 J-.541 E.00299
; WIPE_START
G1 F15000
G1 X110.49 Y125.663 E-.20541
G1 X110.296 Y125.504 E-.17463
G1 X110.137 Y125.311 E-.17456
G1 X109.994 Y125.053 E-.2054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.026 Y119.315 Z3.4 F42000
G1 X117.03 Y117.03 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1847
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.311 J.901 E.0333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.808 Y116.645 E-.16276
G1 X115.898 Y116.51 E-.06141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G3 X118.006 Y115.463 I.882 J2.803 E.01508
G3 X118.714 Y115.6 I-.295 J3.417 E.01173
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16197
G1 X118.006 Y115.463 E-.16904
G1 X118.43 Y115.518 E-.16236
G1 X118.714 Y115.6 E-.11234
G1 X118.308 Y115.6 E-.15429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.017 J2.253 E.03118
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04957
G1 X119.292 Y115.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.384 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G3 X120.2 Y118.711 I-2.384 J-.484 E.00553
G1 X120.2 Y117.089 E.02634
G1 X120.234 Y117.192 E.00175
G3 X120.302 Y118.325 I-2.327 J.708 E.0186
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.15195
G1 X120.2 Y117.111 E-.60805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.178 I-2.205 J-1.031 E.03044
M73 P84 R3
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.11 Y118.934 E-.06743
G1 X119.899 Y119.288 E-.15674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G1 X118.708 Y120.202 E.02634
G3 X117.143 Y120.219 I-.808 J-2.38 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.202 E-.59477
G1 X118.333 Y120.301 E-.14743
G1 X118.286 Y120.306 E-.0178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G1 X117.03 Y120.179 E.02288
G3 X115.621 Y118.77 I.903 J-2.313 E.0333
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.179 E-.53596
G1 X116.735 Y120.044 E-.12331
G1 X116.51 Y119.904 E-.10074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.531 Y117.325 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1847
M204 S5000
G3 X115.6 Y117.089 I2.403 J.575 E.004
G1 X115.6 Y118.711 E.02634
G3 X115.518 Y117.384 I2.334 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.11641
G1 X115.6 Y118.711 E-.61639
G1 X115.582 Y118.641 E-.02719
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 31/53
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I.782 J.932 P1  F42000
G1 X125.349 Y110.451 Z3.4
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G3 X125.794 Y111.519 I-1.075 J1.075 E.01927
G1 X125.794 Y124.281 E.20723
G3 X124.281 Y125.794 I-1.521 J-.008 E.03854
G1 X111.519 Y125.794 E.20723
G3 X110.006 Y124.281 I.008 J-1.521 E.03854
G1 X110.006 Y111.519 E.20723
G3 X111.519 Y110.006 I1.521 J.008 E.03854
G1 X124.281 Y110.006 E.20723
G3 X125.306 Y110.41 I-.008 J1.521 E.0183
; WIPE_START
G1 F3600
M204 S6000
G1 X125.538 Y110.682 E-.13617
G1 X125.679 Y110.946 E-.11357
G1 X125.766 Y111.232 E-.11355
G1 X125.794 Y111.519 E-.1096
G1 X125.794 Y112.274 E-.28711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.31 Y119.892 Z3.5 F42000
G1 X124.914 Y126.123 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G1 X124.608 Y126.153 E.00501
G1 X111.192 Y126.153 E.21784
G3 X109.647 Y124.608 I-.004 J-1.541 E.03945
G1 X109.647 Y111.192 E.21784
G3 X111.192 Y109.647 I1.541 J-.004 E.03945
G1 X124.608 Y109.647 E.21784
G1 X124.822 Y109.668 E.0035
G3 X126.153 Y111.192 I-.201 J1.519 E.0359
G1 X126.153 Y124.608 E.21784
G3 X124.973 Y126.11 I-1.541 J.004 E.03347
; WIPE_START
G1 F3600
M204 S6000
G1 X124.608 Y126.153 E-.1398
G1 X122.976 Y126.153 E-.6202
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
G1 X125.031 Y125.847 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961651
G1 F1856
M204 S6000
G2 X125.847 Y125.031 I-.509 J-1.325 E.00362
M204 S10000
G1 X125.847 Y110.769 F42000
; LINE_WIDTH: 0.0961636
G1 F1856
M204 S6000
G2 X125.031 Y109.953 I-1.325 J.509 E.00362
M204 S10000
G1 X110.769 Y109.953 F42000
; LINE_WIDTH: 0.0961651
G1 F1856
M204 S6000
G2 X109.953 Y110.769 I.509 J1.325 E.00362
M204 S10000
G1 X109.953 Y125.031 F42000
G1 F1856
M204 S6000
G2 X110.769 Y125.847 I1.325 J-.509 E.00362
; WIPE_START
G1 F15000
G1 X110.546 Y125.737 E-.1596
G1 X110.274 Y125.526 E-.2204
G1 X110.063 Y125.254 E-.22036
G1 X109.953 Y125.031 E-.15965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.01 Y119.314 Z3.5 F42000
G1 X117.03 Y117.03 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1856
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.278 J.869 E.03333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.732 Y116.781 E-.10371
G1 X115.882 Y116.528 E-.11159
G1 X115.897 Y116.51 E-.00886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G3 X118.003 Y115.463 I.882 J2.806 E.01504
G3 X118.714 Y115.6 I-.29 J3.41 E.01177
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.16196
G1 X118.003 Y115.463 E-.16805
G1 X118.429 Y115.518 E-.16333
G1 X118.714 Y115.6 E-.11236
G1 X118.308 Y115.6 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.008 J2.245 E.0312
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04953
G1 X119.292 Y115.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.383 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G3 X120.2 Y118.713 I-2.39 J-.483 E.00556
G1 X120.2 Y117.089 E.02637
G1 X120.234 Y117.189 E.00171
G3 X120.302 Y118.325 I-2.333 J.711 E.01864
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.713 E-.15266
G1 X120.2 Y117.115 E-.60734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.109 Y118.935 E.00291
G3 X118.77 Y120.179 I-2.211 J-1.038 E.03042
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.109 Y118.935 E-.06821
G1 X119.899 Y119.288 E-.15596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.379 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59509
G1 X118.333 Y120.301 E-.14797
G1 X118.288 Y120.306 E-.01694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.888 J-2.298 E.0333
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53554
G1 X116.823 Y120.089 E-.08578
G1 X116.57 Y119.946 E-.11023
G1 X116.512 Y119.899 E-.02845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.531 Y117.326 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1856
M204 S5000
G3 X115.6 Y117.087 I2.433 J.573 E.00404
G1 X115.6 Y118.711 E.02637
G3 X115.518 Y117.385 I2.364 J-.812 E.02184
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.087 E-.11729
G1 X115.6 Y118.711 E-.61708
G1 X115.583 Y118.646 E-.02563
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 32/53
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I.782 J.932 P1  F42000
G1 X125.367 Y110.433 Z3.5
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G3 X125.816 Y111.509 I-1.084 J1.084 E.01942
G1 X125.816 Y124.291 E.20755
G3 X124.291 Y125.816 I-1.533 J-.008 E.03885
G1 X111.509 Y125.816 E.20755
G3 X109.984 Y124.291 I.008 J-1.533 E.03885
G1 X109.984 Y111.509 E.20755
G3 X111.509 Y109.984 I1.533 J.008 E.03885
G1 X124.291 Y109.984 E.20755
G3 X125.324 Y110.391 I-.008 J1.533 E.01845
; WIPE_START
G1 F3600
M204 S6000
G1 X125.558 Y110.666 E-.13709
G1 X125.7 Y110.931 E-.11445
G1 X125.788 Y111.22 E-.11449
G1 X125.816 Y111.509 E-.1105
G1 X125.816 Y112.255 E-.28347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.333 Y119.872 Z3.6 F42000
G1 X124.935 Y126.151 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G1 X124.625 Y126.182 E.00506
G1 X111.175 Y126.182 E.21839
G3 X109.618 Y124.625 I-.005 J-1.552 E.03974
G1 X109.618 Y111.175 E.21839
G3 X111.175 Y109.618 I1.552 J-.005 E.03974
G1 X124.625 Y109.618 E.21839
G1 X124.846 Y109.64 E.00362
G3 X126.182 Y111.175 I-.209 J1.53 E.03607
G1 X126.182 Y124.625 E.21839
G3 X124.993 Y126.138 I-1.552 J.005 E.0337
; WIPE_START
G1 F3600
M204 S6000
G1 X124.625 Y126.182 E-.14105
G1 X122.996 Y126.182 E-.61896
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
G1 X125.008 Y125.887 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103322
G1 F1864
M204 S6000
G2 X125.888 Y125.008 I-.485 J-1.364 E.00429
M204 S10000
G1 X125.888 Y110.792 F42000
G1 F1864
M204 S6000
G2 X125.008 Y109.913 I-1.364 J.485 E.00429
M204 S10000
G1 X110.792 Y109.913 F42000
G1 F1864
M204 S6000
G2 X109.913 Y110.792 I.485 J1.364 E.00429
M204 S10000
G1 X109.913 Y125.008 F42000
G1 F1864
M204 S6000
G2 X110.792 Y125.888 I1.364 J-.485 E.00429
; WIPE_START
G1 F15000
G1 X110.526 Y125.76 E-.17444
G1 X110.253 Y125.547 E-.20556
G1 X110.04 Y125.274 E-.20554
G1 X109.913 Y125.008 E-.17446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.993 Y119.313 Z3.6 F42000
G1 X117.03 Y117.03 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.622 I2.273 J.866 E.03332
G1 X117.03 Y116.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.829 Y116.611 E-.17777
G1 X115.901 Y116.513 E-.04639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.092 Y115.598 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G3 X118.001 Y115.463 I.808 J2.314 E.015
G3 X118.708 Y115.6 I-.12 J2.512 E.01174
G1 X117.152 Y115.598 E.02527
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16062
G1 X118.001 Y115.463 E-.16793
G1 X118.43 Y115.518 E-.16427
G1 X118.708 Y115.6 E-.11043
G1 X118.296 Y115.599 E-.15676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
M73 P85 R3
G1 F1864
M204 S5000
G1 X118.77 Y115.622 E.02287
G1 X118.802 Y115.633 E.00055
G3 X120.179 Y117.03 I-.911 J2.275 E.03277
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53565
G1 X118.802 Y115.633 E-.01285
G1 X119.231 Y115.855 E-.18384
G1 X119.288 Y115.901 E-.02766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.291 Y118.383 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G3 X120.2 Y118.712 I-2.392 J-.485 E.00554
G1 X120.2 Y117.087 E.02639
G1 X120.217 Y117.135 E.00084
G3 X120.302 Y118.325 I-2.318 J.763 E.01955
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.712 E-.15236
G1 X120.2 Y117.113 E-.60764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.846 E.00133
G3 X118.77 Y120.179 I-2.317 J-1.018 E.03194
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53553
G1 X120.149 Y118.846 E-.0311
G1 X120.046 Y119.06 E-.09006
G1 X119.9 Y119.29 E-.10332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G1 X118.709 Y120.202 E.02636
G3 X117.143 Y120.219 I-.809 J-2.338 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59531
G1 X118.429 Y120.282 E-.11056
G1 X118.288 Y120.299 E-.05414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G1 X117.03 Y120.179 E.02288
G3 X115.621 Y118.77 I.871 J-2.28 E.03333
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.179 E-.53596
G1 X116.654 Y119.998 E-.15864
G1 X116.512 Y119.901 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.417 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1864
M204 S5000
G3 X115.6 Y117.089 I2.376 J.483 E.00553
G1 X115.6 Y118.71 E.02632
G3 X115.498 Y117.475 I2.285 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.15192
G1 X115.6 Y118.689 E-.60808
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 33/53
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I.786 J.929 P1  F42000
G1 X125.385 Y110.415 Z3.6
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G3 X125.838 Y111.499 I-1.093 J1.093 E.01958
G1 X125.838 Y124.301 E.20787
G3 X124.301 Y125.838 I-1.545 J-.008 E.03916
G1 X111.499 Y125.838 E.20787
G3 X109.962 Y124.301 I.008 J-1.545 E.03916
G1 X109.962 Y111.499 E.20787
G3 X111.499 Y109.962 I1.545 J.008 E.03916
G1 X124.301 Y109.962 E.20787
G3 X125.342 Y110.373 I-.008 J1.545 E.01861
; WIPE_START
G1 F3600
M204 S6000
G1 X125.578 Y110.649 E-.13801
G1 X125.721 Y110.917 E-.11539
G1 X125.809 Y111.208 E-.11537
G1 X125.838 Y111.499 E-.11142
G1 X125.838 Y112.236 E-.27982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.356 Y119.853 Z3.7 F42000
G1 X124.956 Y126.179 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G3 X124.642 Y126.21 I-.309 J-1.533 E.00513
G1 X111.158 Y126.21 E.21894
G3 X109.59 Y124.642 I-.005 J-1.564 E.04003
G1 X109.59 Y111.158 E.21894
G3 X111.158 Y109.59 I1.564 J-.005 E.04003
G1 X124.642 Y109.59 E.21894
G1 X124.871 Y109.613 E.00374
G3 X126.21 Y111.158 I-.216 J1.54 E.03624
G1 X126.21 Y124.642 E.21894
G3 X125.014 Y126.166 I-1.564 J.005 E.03393
; WIPE_START
G1 F3600
M204 S6000
G1 X124.642 Y126.21 E-.14253
G1 X123.017 Y126.21 E-.61747
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
G1 X124.986 Y125.928 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11015
G1 F1872
M204 S6000
G2 X125.928 Y124.986 I-.466 J-1.409 E.00499
M204 S10000
G1 X125.928 Y110.814 F42000
G1 F1872
M204 S6000
G2 X124.986 Y109.872 I-1.409 J.466 E.00499
M204 S10000
G1 X110.814 Y109.872 F42000
G1 F1872
M204 S6000
G2 X109.872 Y110.814 I.466 J1.409 E.00499
M204 S10000
G1 X109.872 Y124.986 F42000
G1 F1872
M204 S6000
G2 X110.814 Y125.928 I1.409 J-.466 E.00499
; WIPE_START
G1 F15000
G1 X110.507 Y125.784 E-.18718
G1 X110.231 Y125.569 E-.19281
G1 X110.016 Y125.293 E-.19278
G1 X109.872 Y124.986 E-.18723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.977 Y119.312 Z3.7 F42000
G1 X117.03 Y117.03 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1872
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.341 J.932 E.03326
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53584
G1 X115.828 Y116.611 E-.17745
G1 X115.903 Y116.514 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G3 X117.998 Y115.463 I.81 J2.315 E.01499
G3 X118.714 Y115.6 I-.281 J3.393 E.01185
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16121
G1 X117.998 Y115.463 E-.167
G1 X118.43 Y115.518 E-.16521
G1 X118.714 Y115.6 E-.11233
G1 X118.308 Y115.6 E-.15425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.889 Y115.67 E.00208
G3 X120.179 Y117.03 I-.99 J2.23 E.03124
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.889 Y115.67 E-.04877
G1 X119.292 Y115.898 E-.17585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.289 Y118.383 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G3 X120.2 Y118.712 I-2.444 J-.484 E.00555
G1 X120.2 Y117.089 E.02636
G1 X120.232 Y117.184 E.00163
G3 X120.3 Y118.324 I-2.387 J.714 E.0187
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.712 E-.15244
G1 X120.2 Y117.114 E-.60756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G1 X120.178 Y118.77 E.02286
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.285 J-.984 E.03197
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53555
G1 X120.149 Y118.846 E-.03096
G1 X120.045 Y119.062 E-.09113
G1 X119.901 Y119.29 E-.10236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59515
G1 X118.429 Y120.282 E-.11057
G1 X118.288 Y120.299 E-.05428
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P86 R3
G1 X117.03 Y118.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.622 Y118.77 I.875 J-2.283 E.0333
G1 X116.97 Y118.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53557
G1 X116.822 Y120.089 E-.08613
G1 X116.57 Y119.945 E-.11009
G1 X116.512 Y119.899 E-.02821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.417 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1872
M204 S5000
G3 X115.6 Y117.089 I2.384 J.484 E.00553
G1 X115.6 Y118.712 E.02636
G1 X115.598 Y118.708 E.00008
G3 X115.498 Y117.476 I2.295 J-.807 E.0203
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.15193
G1 X115.6 Y118.689 E-.60807
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 34/53
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I.786 J.929 P1  F42000
G1 X125.404 Y110.396 Z3.7
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G3 X125.86 Y111.49 I-1.101 J1.101 E.01974
G1 X125.86 Y124.31 E.20818
G3 X124.31 Y125.86 I-1.557 J-.008 E.03947
G1 X111.49 Y125.86 E.20818
G3 X109.94 Y124.31 I.008 J-1.557 E.03947
G1 X109.94 Y111.49 E.20818
G3 X111.49 Y109.94 I1.557 J.008 E.03947
G1 X124.31 Y109.94 E.20818
G3 X125.361 Y110.355 I-.008 J1.557 E.01876
; WIPE_START
G1 F3600
M204 S6000
G1 X125.598 Y110.633 E-.13893
G1 X125.742 Y110.903 E-.11627
G1 X125.831 Y111.195 E-.1163
G1 X125.86 Y111.49 E-.11231
G1 X125.86 Y112.216 E-.27619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.378 Y119.834 Z3.8 F42000
G1 X124.975 Y126.207 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G3 X124.659 Y126.238 I-.312 J-1.544 E.00517
G1 X111.141 Y126.238 E.21949
G3 X109.562 Y124.659 I-.005 J-1.575 E.04032
G1 X109.562 Y111.141 E.21949
G3 X111.141 Y109.562 I1.575 J-.005 E.04032
G1 X124.659 Y109.562 E.21949
G1 X124.895 Y109.585 E.00386
G1 X124.975 Y109.593 E.0013
G3 X126.238 Y111.141 I-.333 J1.562 E.03506
G1 X126.238 Y124.659 E.21949
G3 X125.033 Y126.194 I-1.575 J.005 E.03418
; WIPE_START
G1 F3600
M204 S6000
G1 X124.659 Y126.238 E-.14336
G1 X123.036 Y126.238 E-.61664
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
G1 X124.964 Y125.969 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0948822
G1 F1879
M204 S6000
G1 X125.172 Y125.883 E.00067
; LINE_WIDTH: 0.12845
G2 X125.807 Y125.312 I-.717 J-1.438 E.00377
; LINE_WIDTH: 0.102969
G2 X125.969 Y124.964 I-2.127 J-1.199 E.00128
M204 S10000
G1 X125.969 Y110.836 F42000
; LINE_WIDTH: 0.102962
G1 F1879
M204 S6000
G2 X125.807 Y110.488 I-2.285 J.849 E.00128
; LINE_WIDTH: 0.128454
G2 X125.172 Y109.917 I-1.352 J.867 E.00377
; LINE_WIDTH: 0.0948924
G1 X124.964 Y109.831 E.00067
M204 S10000
G1 X110.836 Y109.831 F42000
; LINE_WIDTH: 0.102962
G1 F1879
M204 S6000
G2 X110.488 Y109.993 I.849 J2.285 E.00128
; LINE_WIDTH: 0.128452
G2 X109.917 Y110.628 I.867 J1.352 E.00377
; LINE_WIDTH: 0.0948873
G1 X109.831 Y110.836 E.00067
M204 S10000
G1 X109.831 Y124.964 F42000
; LINE_WIDTH: 0.0948822
G1 F1879
M204 S6000
G1 X109.917 Y125.172 E.00067
; LINE_WIDTH: 0.12845
G2 X110.488 Y125.807 I1.438 J-.717 E.00377
; LINE_WIDTH: 0.102969
G2 X110.837 Y125.969 I1.199 J-2.127 E.00128
; WIPE_START
G1 F15000
G1 X110.488 Y125.807 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.049 Y119.688 Z3.8 F42000
G1 X117.03 Y117.03 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1879
M204 S5000
G1 X115.622 Y117.03 E.02286
G3 X117.03 Y115.622 I2.33 J.923 E.03325
G1 X117.03 Y116.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53556
G1 X115.829 Y116.611 E-.17764
G1 X115.904 Y116.513 E-.0468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.093 Y115.597 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G3 X117.996 Y115.462 I.883 J2.818 E.01488
G3 X118.714 Y115.6 I-.276 J3.382 E.01189
G1 X117.153 Y115.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16116
G1 X117.996 Y115.462 E-.16519
G1 X118.43 Y115.518 E-.16621
G1 X118.714 Y115.6 E-.11233
G1 X118.305 Y115.599 E-.15512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.023 J2.259 E.03118
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04956
G1 X119.292 Y115.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.288 Y118.383 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G3 X120.2 Y118.711 I-2.46 J-.485 E.00552
G1 X120.2 Y117.087 E.02637
G1 X120.217 Y117.136 E.00084
G3 X120.299 Y118.324 I-2.389 J.762 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X120.2 Y118.711 E-.15183
G1 X120.2 Y117.111 E-.60817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.109 Y118.936 E.00292
G3 X118.77 Y120.178 I-2.24 J-1.073 E.03037
G1 X118.77 Y118.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.109 Y118.936 E-.0683
G1 X119.899 Y119.288 E-.15587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G1 X118.707 Y120.203 E.02632
G3 X117.143 Y120.219 I-.807 J-2.379 E.02582
; WIPE_START
G1 F3600
M204 S6000
G1 X118.707 Y120.203 E-.59425
G1 X118.283 Y120.306 E-.16575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.87 J-2.279 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08511
G1 X116.569 Y119.945 E-.1116
G1 X116.511 Y119.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.53 Y117.323 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1879
M204 S5000
G3 X115.6 Y117.087 I2.364 J.576 E.004
G1 X115.6 Y118.711 E.02636
G3 X115.516 Y117.382 I2.294 J-.812 E.0219
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.087 E-.11637
G1 X115.6 Y118.711 E-.61699
G1 X115.583 Y118.643 E-.02664
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 35/53
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.783 J.932 P1  F42000
G1 X125.422 Y110.378 Z3.8
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G3 X125.882 Y111.48 I-1.11 J1.11 E.01989
G1 X125.882 Y124.32 E.2085
G3 X124.32 Y125.882 I-1.57 J-.008 E.03978
G1 X111.48 Y125.882 E.2085
G3 X109.918 Y124.32 I.008 J-1.57 E.03978
G1 X109.918 Y111.48 E.2085
G3 X111.48 Y109.918 I1.57 J.008 E.03978
G1 X124.32 Y109.918 E.2085
G3 X125.379 Y110.336 I-.008 J1.57 E.01892
; WIPE_START
G1 F3600
M204 S6000
G1 X125.618 Y110.616 E-.13985
G1 X125.763 Y110.888 E-.11717
G1 X125.853 Y111.183 E-.11721
G1 X125.882 Y111.48 E-.11322
G1 X125.882 Y112.197 E-.27254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.401 Y119.814 Z3.9 F42000
G1 X124.995 Y126.235 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X124.994 Y126.235 E.00002
G3 X124.676 Y126.266 I-.314 J-1.555 E.0052
G1 X111.124 Y126.266 E.22004
G3 X109.534 Y124.676 I-.004 J-1.586 E.04061
G1 X109.534 Y111.124 E.22004
G3 X111.124 Y109.534 I1.586 J-.004 E.04061
G1 X124.676 Y109.534 E.22004
G1 X124.919 Y109.558 E.00398
G1 X124.994 Y109.565 E.00122
G3 X126.266 Y111.124 I-.336 J1.573 E.03531
G1 X126.266 Y124.676 E.22004
G3 X125.29 Y126.144 I-1.586 J.004 E.03037
G1 X125.052 Y126.217 E.00404
; WIPE_START
G1 F3600
M204 S6000
G1 X124.994 Y126.235 E-.02319
G1 X124.676 Y126.266 E-.12159
G1 X123.057 Y126.266 E-.61522
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
G1 X124.882 Y126.014 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0948627
G1 F1891
M204 S6000
G2 X125 Y125.985 I-.089 J-.618 E.00037
G1 X125.191 Y125.906 E.00062
; LINE_WIDTH: 0.137652
G2 X125.83 Y125.332 I-.723 J-1.447 E.00412
; LINE_WIDTH: 0.104139
G2 X126.014 Y124.882 I-1.461 J-.858 E.00164
M204 S10000
G1 X126.014 Y110.918 F42000
; LINE_WIDTH: 0.104142
G1 F1891
M204 S6000
G2 X125.83 Y110.468 I-1.643 J.408 E.00164
; LINE_WIDTH: 0.137653
G2 X125.191 Y109.894 I-1.361 J.872 E.00412
; LINE_WIDTH: 0.0948677
G1 X125 Y109.815 E.00062
G2 X124.882 Y109.786 I-.207 J.588 E.00037
M204 S10000
G1 X110.918 Y109.786 F42000
; LINE_WIDTH: 0.104142
G1 F1891
M204 S6000
G2 X110.468 Y109.97 I.408 J1.643 E.00164
; LINE_WIDTH: 0.137651
G2 X109.894 Y110.609 I.872 J1.361 E.00412
; LINE_WIDTH: 0.0948582
G1 X109.815 Y110.8 E.00062
G2 X109.786 Y110.918 I.587 J.207 E.00037
M204 S10000
G1 X109.786 Y124.882 F42000
; LINE_WIDTH: 0.0948627
G1 F1891
M204 S6000
G2 X109.815 Y125 I.618 J-.089 E.00037
G1 X109.894 Y125.191 E.00062
; LINE_WIDTH: 0.137652
G2 X110.468 Y125.83 I1.447 J-.723 E.00412
; LINE_WIDTH: 0.104139
G2 X110.918 Y126.014 I.858 J-1.461 E.00164
; WIPE_START
G1 F15000
G1 X110.794 Y125.983 E-.19983
G1 X110.468 Y125.83 E-.56017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.031 Y119.712 Z3.9 F42000
G1 X117.03 Y117.03 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1891
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.622 I2.331 J.923 E.03325
G1 X117.03 Y116.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53558
G1 X115.828 Y116.611 E-.17738
G1 X115.904 Y116.513 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.093 Y115.597 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G3 X117.993 Y115.462 I.807 J2.314 E.01487
G3 X118.714 Y115.6 I-.169 J2.839 E.01194
G1 X117.153 Y115.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16039
G1 X117.993 Y115.462 E-.16506
G1 X118.431 Y115.519 E-.16784
G1 X118.714 Y115.6 E-.11162
G1 X118.305 Y115.599 E-.15509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.89 Y115.67 E.0021
G3 X120.179 Y117.03 I-1.008 J2.247 E.03122
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.89 Y115.67 E-.04908
G1 X119.292 Y115.898 E-.17554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.087 Z3.9 F42000
M73 P87 R3
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X120.217 Y117.135 E.00083
G3 X120.2 Y118.71 I-2.456 J.761 E.02598
G1 X120.2 Y117.147 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X120.217 Y117.135 E-.00782
G1 X120.309 Y117.512 E-.14738
G1 X120.338 Y117.997 E-.18454
G1 X120.309 Y118.285 E-.10996
G1 X120.2 Y118.71 E-.16669
G1 X120.2 Y118.332 E-.14362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X120.177 Y118.77 E.02285
G1 X120.149 Y118.845 E.0013
G3 X118.77 Y120.178 I-2.247 J-.944 E.03202
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.177 Y118.77 E-.53532
G1 X120.149 Y118.845 E-.03037
G1 X119.919 Y119.271 E-.18399
G1 X119.901 Y119.291 E-.01032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.616 Y120.232 E.00158
G3 X117.143 Y120.219 I-.716 J-2.338 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59481
G1 X118.616 Y120.232 E-.03702
G1 X118.287 Y120.306 E-.12817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.895 J-2.304 E.03328
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.783 Y120.069 E-.10259
G1 X116.508 Y119.902 E-.12202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.532 Y117.324 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1891
M204 S5000
G3 X115.6 Y117.087 I2.438 J.576 E.004
G1 X115.6 Y118.713 E.0264
G3 X115.519 Y117.382 I2.37 J-.813 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.087 E-.1164
G1 X115.6 Y118.713 E-.61786
G1 X115.582 Y118.648 E-.02574
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 36/53
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I.783 J.932 P1  F42000
G1 X125.441 Y110.359 Z3.9
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G3 X125.904 Y111.47 I-1.118 J1.119 E.02005
G1 X125.904 Y124.33 E.20882
G3 X124.33 Y125.904 I-1.582 J-.008 E.04009
G1 X111.47 Y125.904 E.20882
G3 X109.896 Y124.33 I.008 J-1.582 E.04009
G1 X109.896 Y111.47 E.20882
G3 X111.47 Y109.896 I1.582 J.008 E.04009
G1 X124.33 Y109.896 E.20882
G3 X125.397 Y110.318 I-.008 J1.582 E.01907
; WIPE_START
G1 F3600
M204 S6000
G1 X125.638 Y110.6 E-.14076
G1 X125.784 Y110.874 E-.11808
G1 X125.874 Y111.171 E-.11812
G1 X125.904 Y111.47 E-.11413
G1 X125.904 Y112.178 E-.26891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.423 Y119.795 Z4 F42000
G1 X125.015 Y126.263 Z4
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X125.013 Y126.263 E.00003
G3 X124.693 Y126.295 I-.316 J-1.566 E.00524
G1 X111.107 Y126.295 E.22059
G3 X109.505 Y124.693 I-.004 J-1.598 E.0409
G1 X109.505 Y111.107 E.22059
G3 X111.107 Y109.505 I1.598 J-.004 E.0409
G1 X124.693 Y109.505 E.22059
G1 X124.944 Y109.53 E.0041
G1 X125.013 Y109.537 E.00114
G3 X126.295 Y111.107 I-.338 J1.584 E.03556
G1 X126.295 Y124.693 E.22059
G3 X125.311 Y126.172 I-1.598 J.004 E.03059
G1 X125.072 Y126.245 E.00406
; WIPE_START
G1 F3600
M204 S6000
G1 X125.013 Y126.263 E-.02344
G1 X124.693 Y126.295 E-.12244
G1 X123.076 Y126.295 E-.61412
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
G1 X124.859 Y126.046 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0834562
G1 F1899
M204 S6000
G1 X124.966 Y126.025 E.00027
; LINE_WIDTH: 0.107499
G1 X125.211 Y125.929 E.00092
; LINE_WIDTH: 0.14686
G2 X125.854 Y125.351 I-.728 J-1.456 E.00447
; LINE_WIDTH: 0.120919
G2 X126.007 Y125.022 I-2.021 J-1.145 E.00147
; LINE_WIDTH: 0.0862971
G2 X126.046 Y124.859 I-.894 J-.298 E.00044
M204 S10000
G1 X126.046 Y110.941 F42000
; LINE_WIDTH: 0.0862994
G1 F1899
M204 S6000
G2 X126.007 Y110.778 I-.93 J.135 E.00044
; LINE_WIDTH: 0.120932
G2 X125.854 Y110.449 I-2.175 J.816 E.00147
; LINE_WIDTH: 0.146858
G2 X125.211 Y109.871 I-1.371 J.878 E.00447
; LINE_WIDTH: 0.104403
G1 X125.016 Y109.79 E.00071
G2 X124.92 Y109.766 I-.171 J.473 E.00033
; LINE_WIDTH: 0.0789197
G1 X124.859 Y109.754 E.00015
M204 S10000
G1 X110.941 Y109.754 F42000
; LINE_WIDTH: 0.0862994
G1 F1899
M204 S6000
G2 X110.778 Y109.793 I.135 J.93 E.00044
; LINE_WIDTH: 0.120932
G2 X110.449 Y109.946 I.816 J2.175 E.00147
; LINE_WIDTH: 0.146858
G2 X109.871 Y110.589 I.878 J1.371 E.00447
; LINE_WIDTH: 0.107481
G1 X109.775 Y110.834 E.00092
; LINE_WIDTH: 0.0834603
G1 X109.754 Y110.941 E.00027
M204 S10000
G1 X109.754 Y124.859 F42000
; LINE_WIDTH: 0.0834562
G1 F1899
M204 S6000
G1 X109.775 Y124.966 E.00027
; LINE_WIDTH: 0.107499
G1 X109.871 Y125.211 E.00092
; LINE_WIDTH: 0.14686
G2 X110.449 Y125.854 I1.456 J-.728 E.00447
; LINE_WIDTH: 0.120919
G2 X110.778 Y126.007 I1.145 J-2.021 E.00147
; LINE_WIDTH: 0.0862971
G2 X110.941 Y126.046 I.298 J-.894 E.00044
; WIPE_START
G1 F15000
G1 X110.778 Y126.007 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.14 Y119.744 Z4 F42000
G1 X117.03 Y117.03 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1899
M204 S5000
G1 X115.623 Y117.03 E.02285
G3 X117.03 Y115.621 I2.319 J.908 E.03327
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.623 Y117.03 E-.53532
G1 X115.801 Y116.658 E-.15676
G1 X115.899 Y116.509 E-.06792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.09 Y115.598 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G3 X117.991 Y115.462 I.887 J2.822 E.01485
G3 X118.714 Y115.6 I-.268 J3.372 E.01198
G1 X117.15 Y115.599 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16236
G1 X117.991 Y115.462 E-.16326
G1 X118.429 Y115.518 E-.16807
G1 X118.714 Y115.6 E-.1124
G1 X118.309 Y115.6 E-.1539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.031 J2.266 E.03117
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04956
G1 X119.292 Y115.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.089 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X120.23 Y117.177 E.00151
G3 X120.2 Y118.713 I-2.329 J.723 E.02538
G1 X120.2 Y117.149 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X120.23 Y117.177 E-.01566
G1 X120.309 Y117.514 E-.1316
G1 X120.338 Y117.999 E-.18453
G1 X120.292 Y118.383 E-.14706
G1 X120.2 Y118.713 E-.13007
G1 X120.2 Y118.315 E-.15108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.127 Y118.895 E.0022
G3 X118.77 Y120.178 I-2.259 J-1.03 E.03109
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53589
G1 X120.127 Y118.895 E-.05146
G1 X119.917 Y119.273 E-.16409
G1 X119.903 Y119.29 E-.00857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.615 Y120.233 E.0016
G3 X117.143 Y120.219 I-.715 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59482
G1 X118.615 Y120.233 E-.03754
G1 X118.287 Y120.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.877 J-2.287 E.03331
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08508
G1 X116.569 Y119.945 E-.11169
G1 X116.51 Y119.9 E-.02785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.417 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1899
M204 S5000
G3 X115.6 Y117.09 I2.375 J.484 E.00551
G1 X115.6 Y118.711 E.02632
G3 X115.498 Y117.476 I2.285 J-.81 E.02036
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.09 E-.1515
G1 X115.6 Y118.692 E-.6085
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 37/53
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.787 J.929 P1  F42000
G1 X125.459 Y110.341 Z4
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G3 X125.926 Y111.46 I-1.127 J1.127 E.0202
G1 X125.926 Y124.34 E.20913
G3 X124.34 Y125.926 I-1.594 J-.008 E.0404
G1 X111.46 Y125.926 E.20913
G3 X109.874 Y124.34 I.008 J-1.594 E.0404
G1 X109.874 Y111.46 E.20913
G3 X111.46 Y109.874 I1.594 J.008 E.0404
G1 X124.34 Y109.874 E.20913
G3 X125.416 Y110.299 I-.008 J1.594 E.01923
; WIPE_START
G1 F3600
M204 S6000
G1 X125.658 Y110.583 E-.14166
G1 X125.805 Y110.859 E-.11899
G1 X125.896 Y111.159 E-.11902
G1 X125.926 Y111.46 E-.11504
G1 X125.926 Y112.158 E-.26529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.445 Y119.776 Z4.1 F42000
G1 X125.035 Y126.291 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X125.032 Y126.291 E.00004
G3 X124.71 Y126.323 I-.318 J-1.577 E.00528
G1 X111.09 Y126.323 E.22115
G3 X109.477 Y124.71 I-.005 J-1.609 E.04119
G1 X109.477 Y111.09 E.22115
G3 X111.091 Y109.477 I1.609 J-.005 E.04119
M73 P88 R3
G1 X124.71 Y109.477 E.22115
G1 X124.968 Y109.502 E.00422
G1 X125.032 Y109.509 E.00105
G3 X126.323 Y111.09 I-.341 J1.595 E.03582
G1 X126.323 Y124.71 E.22115
G3 X125.333 Y126.199 I-1.609 J.005 E.0308
G1 X125.092 Y126.273 E.00409
; WIPE_START
G1 F3600
M204 S6000
G1 X125.032 Y126.291 E-.02368
G1 X124.71 Y126.323 E-.12329
G1 X123.096 Y126.323 E-.61303
; WIPE_END
M73 P88 R2
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
G1 X124.837 Y126.078 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875279
G1 F1907
M204 S6000
G1 X124.984 Y126.049 E.0004
; LINE_WIDTH: 0.116153
G1 X125.23 Y125.953 E.00102
; LINE_WIDTH: 0.156066
G2 X125.877 Y125.371 I-.734 J-1.465 E.00483
; LINE_WIDTH: 0.129559
G2 X126.032 Y125.039 I-2.009 J-1.14 E.00161
; LINE_WIDTH: 0.0908701
G2 X126.078 Y124.837 I-1.027 J-.341 E.00059
M204 S10000
G1 X126.078 Y110.963 F42000
; LINE_WIDTH: 0.0908686
G1 F1907
M204 S6000
G2 X126.032 Y110.761 I-1.073 J.14 E.00059
; LINE_WIDTH: 0.129557
G2 X125.877 Y110.429 I-2.167 J.81 E.00161
; LINE_WIDTH: 0.156066
G2 X125.23 Y109.847 I-1.38 J.883 E.00483
; LINE_WIDTH: 0.113412
G1 X125.032 Y109.765 E.00081
G2 X124.944 Y109.743 I-.157 J.432 E.00034
; LINE_WIDTH: 0.0835366
G1 X124.837 Y109.722 E.00028
M204 S10000
G1 X110.963 Y109.722 F42000
; LINE_WIDTH: 0.0908686
G1 F1907
M204 S6000
G2 X110.761 Y109.768 I.14 J1.073 E.00059
; LINE_WIDTH: 0.129557
G2 X110.429 Y109.923 I.81 J2.167 E.00161
; LINE_WIDTH: 0.156066
G2 X109.847 Y110.57 I.883 J1.381 E.00483
; LINE_WIDTH: 0.116158
G1 X109.751 Y110.816 E.00102
; LINE_WIDTH: 0.0875287
G1 X109.722 Y110.963 E.0004
M204 S10000
G1 X109.722 Y124.837 F42000
; LINE_WIDTH: 0.0875279
G1 F1907
M204 S6000
G1 X109.751 Y124.984 E.0004
; LINE_WIDTH: 0.116153
G1 X109.847 Y125.23 E.00102
; LINE_WIDTH: 0.156066
G2 X110.429 Y125.877 I1.465 J-.734 E.00483
; LINE_WIDTH: 0.129559
G2 X110.761 Y126.032 I1.14 J-2.009 E.00161
; LINE_WIDTH: 0.0908701
G2 X110.963 Y126.078 I.341 J-1.027 E.00059
; WIPE_START
G1 F15000
G1 X110.761 Y126.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.123 Y119.769 Z4.1 F42000
G1 X117.03 Y117.03 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.622 I2.303 J.896 E.03328
G1 X117.03 Y116.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.828 Y116.612 E-.17706
G1 X115.903 Y116.514 E-.04711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.093 Y115.597 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G3 X117.988 Y115.462 I.808 J2.315 E.01479
G3 X118.714 Y115.6 I-.201 J3.038 E.01202
G1 X117.153 Y115.598 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16043
G1 X117.988 Y115.462 E-.16312
G1 X118.43 Y115.518 E-.16933
G1 X118.714 Y115.6 E-.11208
G1 X118.306 Y115.599 E-.15504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-.995 J2.232 E.03121
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04963
G1 X119.292 Y115.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.089 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X120.229 Y117.175 E.00147
G3 X120.2 Y118.712 I-2.326 J.725 E.02541
G1 X120.2 Y117.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X120.229 Y117.175 E-.01484
G1 X120.309 Y117.514 E-.13233
G1 X120.338 Y117.999 E-.18475
G1 X120.292 Y118.383 E-.14701
G1 X120.2 Y118.712 E-.1299
G1 X120.2 Y118.315 E-.15117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X120.178 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.178 I-2.26 J-.96 E.03199
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53561
G1 X120.149 Y118.846 E-.03087
G1 X119.917 Y119.272 E-.18448
G1 X119.902 Y119.291 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.617 Y120.232 E.00157
G3 X117.143 Y120.219 I-.716 J-2.366 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59476
G1 X118.617 Y120.232 E-.03681
G1 X118.287 Y120.306 E-.12843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.863 J-2.272 E.03332
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08504
G1 X116.569 Y119.945 E-.11167
G1 X116.511 Y119.899 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.532 Y117.325 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1907
M204 S5000
G3 X115.6 Y117.089 I2.426 J.575 E.00399
G1 X115.6 Y118.711 E.02634
G3 X115.519 Y117.384 I2.358 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.11612
G1 X115.6 Y118.711 E-.61638
G1 X115.582 Y118.641 E-.0275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 38/53
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.783 J.932 P1  F42000
G1 X125.477 Y110.323 Z4.1
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G3 X125.948 Y111.451 I-1.136 J1.136 E.02036
G1 X125.948 Y124.349 E.20945
G3 X124.349 Y125.948 I-1.606 J-.008 E.04072
G1 X111.451 Y125.948 E.20945
G3 X109.852 Y124.349 I.008 J-1.606 E.04072
G1 X109.852 Y111.451 E.20945
G3 X111.451 Y109.852 I1.606 J.008 E.04072
G1 X124.349 Y109.852 E.20945
G3 X125.434 Y110.281 I-.008 J1.606 E.01939
; WIPE_START
G1 F3600
M204 S6000
G1 X125.678 Y110.567 E-.14257
G1 X125.826 Y110.845 E-.1199
G1 X125.918 Y111.147 E-.11994
G1 X125.948 Y111.451 E-.11595
G1 X125.948 Y112.139 E-.26165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.468 Y119.757 Z4.2 F42000
G1 X125.054 Y126.318 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X125.052 Y126.319 E.00005
G3 X124.727 Y126.351 I-.321 J-1.588 E.00531
G1 X111.074 Y126.351 E.2217
G3 X109.449 Y124.726 I-.005 J-1.62 E.04148
G1 X109.449 Y111.074 E.2217
G3 X111.074 Y109.449 I1.62 J-.005 E.04148
G1 X124.727 Y109.449 E.2217
G1 X124.992 Y109.475 E.00434
G1 X125.052 Y109.481 E.00097
G3 X126.351 Y111.074 I-.343 J1.607 E.03607
G1 X126.351 Y124.727 E.2217
G3 X125.354 Y126.227 I-1.62 J.005 E.03102
G1 X125.112 Y126.301 E.00411
; WIPE_START
G1 F3600
M204 S6000
G1 X125.052 Y126.319 E-.0239
G1 X124.727 Y126.351 E-.12413
G1 X123.116 Y126.351 E-.61197
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
G1 X124.815 Y126.11 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0916041
G1 F1915
M204 S6000
G1 X125.003 Y126.073 E.00055
; LINE_WIDTH: 0.124835
G1 X125.25 Y125.976 E.00112
; LINE_WIDTH: 0.165257
G2 X125.9 Y125.39 I-.74 J-1.475 E.00519
; LINE_WIDTH: 0.138182
G2 X126.057 Y125.055 I-2.004 J-1.139 E.00176
; LINE_WIDTH: 0.0952228
G2 X126.11 Y124.815 I-1.165 J-.387 E.00074
M204 S10000
G1 X126.11 Y110.985 F42000
; LINE_WIDTH: 0.0952211
G1 F1915
M204 S6000
G2 X126.057 Y110.745 I-1.219 J.146 E.00074
; LINE_WIDTH: 0.138181
G2 X125.9 Y110.41 I-2.16 J.804 E.00176
; LINE_WIDTH: 0.165256
G2 X125.25 Y109.824 I-1.39 J.889 E.00519
; LINE_WIDTH: 0.122435
G1 X125.047 Y109.741 E.0009
G2 X124.968 Y109.72 I-.143 J.392 E.00034
; LINE_WIDTH: 0.0881621
G1 X124.815 Y109.69 E.00043
M204 S10000
G1 X110.985 Y109.69 F42000
; LINE_WIDTH: 0.0952211
G1 F1915
M204 S6000
G2 X110.745 Y109.743 I.146 J1.219 E.00074
; LINE_WIDTH: 0.138181
G2 X110.41 Y109.9 I.804 J2.16 E.00176
; LINE_WIDTH: 0.165259
G2 X109.824 Y110.55 I.889 J1.39 E.00519
; LINE_WIDTH: 0.124831
G1 X109.727 Y110.797 E.00112
; LINE_WIDTH: 0.0916051
G1 X109.69 Y110.985 E.00055
M204 S10000
G1 X109.69 Y124.815 F42000
; LINE_WIDTH: 0.0916041
G1 F1915
M204 S6000
G1 X109.727 Y125.003 E.00055
; LINE_WIDTH: 0.124835
G1 X109.824 Y125.25 E.00112
; LINE_WIDTH: 0.165257
G2 X110.41 Y125.9 I1.475 J-.74 E.00519
; LINE_WIDTH: 0.138182
G2 X110.745 Y126.057 I1.139 J-2.004 E.00176
; LINE_WIDTH: 0.0952228
G2 X110.985 Y126.11 I.387 J-1.165 E.00074
; WIPE_START
G1 F15000
G1 X110.745 Y126.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.106 Y119.793 Z4.2 F42000
G1 X117.03 Y117.03 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1915
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.29 J.881 E.03332
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.732 Y116.78 E-.10375
G1 X115.882 Y116.528 E-.11172
G1 X115.897 Y116.51 E-.0087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G3 X117.986 Y115.462 I.888 J2.833 E.01475
G3 X118.714 Y115.6 I-.259 J3.355 E.01206
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.162
G1 X117.986 Y115.462 E-.16134
G1 X118.429 Y115.518 E-.17001
G1 X118.714 Y115.6 E-.11238
G1 X118.308 Y115.6 E-.15427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.008 J2.244 E.03119
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04957
G1 X119.292 Y115.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.087 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X120.217 Y117.136 E.00084
G3 X120.2 Y118.712 I-2.394 J.762 E.02604
G1 X120.2 Y117.147 E.02542
; WIPE_START
G1 F3600
M204 S6000
G1 X120.217 Y117.136 E-.00778
M73 P89 R2
G1 X120.309 Y117.512 E-.14718
G1 X120.338 Y117.999 E-.18538
G1 X120.292 Y118.383 E-.14707
G1 X120.2 Y118.712 E-.12977
G1 X120.2 Y118.336 E-.14282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X120.178 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.286 J-.985 E.03198
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53563
G1 X120.149 Y118.846 E-.03089
G1 X120.039 Y119.073 E-.09608
G1 X119.901 Y119.289 E-.09739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.144 Y120.218 I-.809 J-2.445 E.02583
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59499
G1 X118.287 Y120.305 E-.16501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.875 J-2.285 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08507
G1 X116.569 Y119.945 E-.11157
G1 X116.51 Y119.901 E-.02799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.531 Y117.325 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1915
M204 S5000
G3 X115.6 Y117.089 I2.39 J.576 E.00399
G1 X115.6 Y118.713 E.02637
G3 X115.517 Y117.383 I2.321 J-.812 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.089 E-.11613
G1 X115.6 Y118.713 E-.61706
G1 X115.581 Y118.645 E-.02681
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 39/53
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.783 J.931 P1  F42000
G1 X125.496 Y110.304 Z4.2
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G3 X125.97 Y111.441 I-1.144 J1.144 E.02051
G1 X125.97 Y124.359 E.20977
G3 X124.359 Y125.97 I-1.618 J-.008 E.04103
G1 X111.441 Y125.97 E.20977
G3 X109.83 Y124.359 I.008 J-1.618 E.04103
G1 X109.83 Y111.441 E.20977
G3 X111.441 Y109.83 I1.618 J.008 E.04103
G1 X124.359 Y109.83 E.20977
G3 X125.453 Y110.263 I-.008 J1.618 E.01954
; WIPE_START
G1 F3600
M204 S6000
G1 X125.697 Y110.55 E-.14347
G1 X125.847 Y110.831 E-.12081
G1 X125.94 Y111.135 E-.12083
G1 X125.97 Y111.441 E-.11687
G1 X125.97 Y112.12 E-.25802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.49 Y119.737 Z4.3 F42000
G1 X125.074 Y126.346 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X125.071 Y126.347 E.00006
G3 X124.744 Y126.38 I-.323 J-1.599 E.00535
G1 X111.057 Y126.38 E.22225
G3 X109.42 Y124.743 I-.005 J-1.632 E.04176
G1 X109.42 Y111.057 E.22225
G3 X111.057 Y109.42 I1.632 J-.005 E.04176
G1 X124.744 Y109.42 E.22225
G1 X125.017 Y109.447 E.00446
G1 X125.071 Y109.453 E.00088
G3 X126.38 Y111.057 I-.345 J1.618 E.03632
G1 X126.38 Y124.744 E.22225
G3 X125.375 Y126.254 I-1.632 J.005 E.03124
G1 X125.131 Y126.329 E.00414
; WIPE_START
G1 F3600
M204 S6000
G1 X125.071 Y126.347 E-.02409
G1 X124.744 Y126.38 E-.12496
G1 X123.136 Y126.38 E-.61096
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
G1 X124.792 Y126.143 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0956677
G1 F1923
M204 S6000
G1 X125.021 Y126.097 E.00071
; LINE_WIDTH: 0.1335
G1 X125.27 Y125.999 E.00122
; LINE_WIDTH: 0.174459
G2 X125.924 Y125.409 I-.745 J-1.484 E.00556
; LINE_WIDTH: 0.146799
G2 X126.081 Y125.071 I-1.998 J-1.137 E.00191
; LINE_WIDTH: 0.099433
G2 X126.143 Y124.792 I-1.303 J-.432 E.00091
M204 S10000
G1 X126.143 Y111.008 F42000
; LINE_WIDTH: 0.0994238
G1 F1923
M204 S6000
G2 X126.081 Y110.729 I-1.363 J.153 E.00091
; LINE_WIDTH: 0.146797
G2 X125.924 Y110.391 I-2.157 J.8 E.00191
; LINE_WIDTH: 0.174461
G2 X125.27 Y109.801 I-1.4 J.894 E.00556
; LINE_WIDTH: 0.131471
G1 X125.063 Y109.716 E.001
G2 X124.992 Y109.697 I-.129 J.35 E.00033
; LINE_WIDTH: 0.092784
G1 X124.792 Y109.657 E.00059
M204 S10000
G1 X111.008 Y109.657 F42000
; LINE_WIDTH: 0.0994238
G1 F1923
M204 S6000
G2 X110.729 Y109.719 I.153 J1.363 E.00091
; LINE_WIDTH: 0.146797
G2 X110.391 Y109.876 I.8 J2.157 E.00191
; LINE_WIDTH: 0.174459
G2 X109.801 Y110.53 I.894 J1.399 E.00556
; LINE_WIDTH: 0.133507
G1 X109.703 Y110.779 E.00122
; LINE_WIDTH: 0.0956742
G1 X109.657 Y111.008 E.00071
M204 S10000
G1 X109.657 Y124.792 F42000
; LINE_WIDTH: 0.0956677
G1 F1923
M204 S6000
G1 X109.703 Y125.021 E.00071
; LINE_WIDTH: 0.1335
G1 X109.801 Y125.27 E.00122
; LINE_WIDTH: 0.174459
G2 X110.391 Y125.924 I1.484 J-.745 E.00556
; LINE_WIDTH: 0.146799
G2 X110.729 Y126.081 I1.137 J-1.998 E.00191
; LINE_WIDTH: 0.099433
G2 X111.008 Y126.143 I.432 J-1.303 E.00091
; WIPE_START
G1 F15000
G1 X110.729 Y126.081 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.089 Y119.817 Z4.3 F42000
G1 X117.03 Y117.03 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1923
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.308 J.899 E.03329
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53565
G1 X115.732 Y116.78 E-.10376
G1 X115.882 Y116.528 E-.11155
G1 X115.898 Y116.51 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G3 X117.983 Y115.462 I.889 J2.837 E.01471
G3 X118.714 Y115.6 I-.19 J3.005 E.0121
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.16196
G1 X117.983 Y115.462 E-.1604
G1 X118.43 Y115.518 E-.17133
G1 X118.714 Y115.6 E-.11201
G1 X118.308 Y115.6 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.889 Y115.67 E.00208
G3 X120.179 Y117.03 I-1.063 J2.299 E.03118
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.889 Y115.67 E-.04878
G1 X119.292 Y115.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.089 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X120.228 Y117.17 E.00139
G3 X120.2 Y118.712 I-2.355 J.729 E.02548
G1 X120.2 Y117.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X120.228 Y117.17 E-.01324
G1 X120.309 Y117.514 E-.13445
G1 X120.338 Y117.997 E-.18381
G1 X120.292 Y118.382 E-.14741
G1 X120.2 Y118.712 E-.13015
G1 X120.2 Y118.315 E-.15095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X120.178 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.178 I-2.26 J-.96 E.03199
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53565
G1 X120.149 Y118.846 E-.03089
G1 X119.918 Y119.271 E-.18368
G1 X119.902 Y119.29 E-.00977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.616 Y120.232 E.00158
G3 X117.143 Y120.219 I-.715 J-2.388 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59477
G1 X118.616 Y120.232 E-.03705
G1 X118.287 Y120.306 E-.12818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.875 J-2.285 E.0333
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.737 Y120.045 E-.1224
G1 X116.568 Y119.944 E-.07451
G1 X116.509 Y119.902 E-.0277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.509 Y117.417 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1923
M204 S5000
G3 X115.6 Y117.088 I2.38 J.482 E.00555
G1 X115.6 Y118.71 E.02634
G3 X115.498 Y117.476 I2.288 J-.811 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.15241
G1 X115.6 Y118.687 E-.60759
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 40/53
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.3 I.787 J.928 P1  F42000
G1 X125.514 Y110.286 Z4.3
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G3 X125.992 Y111.431 I-1.153 J1.153 E.02067
G1 X125.992 Y124.369 E.21008
G3 X124.369 Y125.992 I-1.631 J-.008 E.04134
G1 X111.431 Y125.992 E.21008
G3 X109.808 Y124.369 I.008 J-1.631 E.04134
G1 X109.808 Y111.431 E.21008
G3 X111.431 Y109.808 I1.631 J.008 E.04134
G1 X124.369 Y109.808 E.21008
G3 X125.471 Y110.244 I-.008 J1.631 E.0197
; WIPE_START
G1 F3600
M204 S6000
G1 X125.717 Y110.534 E-.14437
G1 X125.868 Y110.816 E-.12172
G1 X125.961 Y111.123 E-.12175
G1 X125.992 Y111.431 E-.11777
G1 X125.992 Y112.101 E-.25439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.512 Y119.718 Z4.4 F42000
G1 X125.094 Y126.374 Z4.4
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X125.09 Y126.375 E.00006
G3 X124.76 Y126.408 I-.325 J-1.61 E.00539
G1 X111.04 Y126.408 E.2228
G3 X109.392 Y124.76 I-.005 J-1.643 E.04205
G1 X109.392 Y111.04 E.2228
G3 X111.04 Y109.392 I1.643 J-.005 E.04205
G1 X124.76 Y109.392 E.2228
G1 X125.041 Y109.42 E.00458
G1 X125.09 Y109.425 E.0008
G3 X126.408 Y111.04 I-.348 J1.629 E.03657
G1 X126.408 Y124.76 E.2228
G3 X125.397 Y126.282 I-1.643 J.005 E.03145
G1 X125.151 Y126.357 E.00417
; WIPE_START
G1 F3600
M204 S6000
G1 X125.09 Y126.375 E-.02422
G1 X124.76 Y126.408 E-.12581
G1 X123.155 Y126.408 E-.60997
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
G1 X124.77 Y126.175 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0997479
G1 F1931
M204 S6000
G1 X125.039 Y126.121 E.00088
; LINE_WIDTH: 0.142184
G2 X125.289 Y126.023 I-.412 J-1.411 E.00132
; LINE_WIDTH: 0.183656
G2 X125.947 Y125.429 I-.751 J-1.494 E.00593
; LINE_WIDTH: 0.155432
G2 X126.106 Y125.088 I-1.997 J-1.138 E.00206
; LINE_WIDTH: 0.103554
G2 X126.175 Y124.77 I-1.435 J-.477 E.00109
M204 S10000
G1 X126.175 Y111.03 F42000
; LINE_WIDTH: 0.103556
G1 F1931
M204 S6000
G2 X126.106 Y110.712 I-1.504 J.159 E.00109
; LINE_WIDTH: 0.155423
G2 X125.947 Y110.371 I-2.154 J.796 E.00205
; LINE_WIDTH: 0.183657
G2 X125.289 Y109.777 I-1.409 J.9 E.00593
; LINE_WIDTH: 0.140525
G2 X125.016 Y109.674 I-.528 J.983 E.00142
; LINE_WIDTH: 0.0974031
G1 X124.77 Y109.625 E.00078
M204 S10000
G1 X111.03 Y109.625 F42000
; LINE_WIDTH: 0.103556
G1 F1931
M204 S6000
G2 X110.712 Y109.694 I.159 J1.504 E.00109
; LINE_WIDTH: 0.155423
G2 X110.371 Y109.853 I.796 J2.154 E.00205
; LINE_WIDTH: 0.183657
G2 X109.778 Y110.511 I.9 J1.409 E.00593
; LINE_WIDTH: 0.142199
G2 X109.679 Y110.761 I1.315 J.663 E.00132
; LINE_WIDTH: 0.0997513
G1 X109.625 Y111.03 E.00088
M204 S10000
G1 X109.625 Y124.77 F42000
; LINE_WIDTH: 0.0997479
G1 F1931
M204 S6000
G1 X109.679 Y125.039 E.00088
; LINE_WIDTH: 0.142184
G2 X109.777 Y125.289 I1.411 J-.412 E.00132
; LINE_WIDTH: 0.183656
G2 X110.371 Y125.947 I1.494 J-.751 E.00593
; LINE_WIDTH: 0.155432
G2 X110.712 Y126.106 I1.138 J-1.997 E.00206
; LINE_WIDTH: 0.103554
G2 X111.03 Y126.175 I.477 J-1.435 E.00109
; WIPE_START
G1 F15000
G1 X110.712 Y126.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.073 Y119.842 Z4.4 F42000
G1 X117.03 Y117.03 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1931
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.319 J.91 E.03328
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53567
G1 X115.795 Y116.667 E-.15307
G1 X115.898 Y116.51 E-.07127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G3 X117.98 Y115.462 I.81 J2.316 E.0147
G3 X118.714 Y115.6 I-.184 J2.99 E.01215
M73 P90 R2
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16127
G1 X117.98 Y115.462 E-.16019
G1 X118.43 Y115.518 E-.17236
G1 X118.714 Y115.6 E-.11199
G1 X118.308 Y115.6 E-.1542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.006 J2.243 E.0312
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04953
G1 X119.292 Y115.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.088 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X120.227 Y117.167 E.00135
G3 X120.2 Y118.712 I-2.322 J.732 E.02552
G1 X120.2 Y117.148 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X120.227 Y117.167 E-.01248
G1 X120.309 Y117.514 E-.13543
G1 X120.338 Y117.999 E-.18459
G1 X120.292 Y118.383 E-.147
G1 X120.2 Y118.712 E-.1297
G1 X120.2 Y118.315 E-.15081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X120.178 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.317 J-1.017 E.03194
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53567
G1 X120.149 Y118.846 E-.03097
G1 X119.971 Y119.189 E-.14681
G1 X119.903 Y119.29 E-.04655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X118.711 Y120.201 E.02638
G3 X117.143 Y120.219 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.59581
G1 X118.303 Y120.306 E-.16027
G1 X118.292 Y120.307 E-.00392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.872 J-2.281 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08501
G1 X116.569 Y119.945 E-.11155
G1 X116.51 Y119.901 E-.02805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.532 Y117.324 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1931
M204 S5000
G3 X115.6 Y117.088 I2.43 J.576 E.00399
G1 X115.6 Y118.712 E.02636
G3 X115.519 Y117.383 I2.362 J-.812 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y117.088 E-.11609
G1 X115.6 Y118.712 E-.6169
G1 X115.582 Y118.643 E-.02702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 41/53
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.784 J.931 P1  F42000
G1 X125.533 Y110.268 Z4.4
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G3 X126.014 Y111.421 I-1.162 J1.162 E.02082
G1 X126.014 Y124.379 E.2104
G3 X124.379 Y126.014 I-1.643 J-.008 E.04165
G1 X111.421 Y126.014 E.2104
G3 X109.786 Y124.379 I.008 J-1.643 E.04165
G1 X109.786 Y111.421 E.2104
G3 X111.421 Y109.786 I1.643 J.008 E.04165
G1 X124.379 Y109.786 E.2104
G3 X125.489 Y110.226 I-.008 J1.643 E.01985
; WIPE_START
G1 F3600
M204 S6000
G1 X125.737 Y110.517 E-.14528
G1 X125.889 Y110.802 E-.12266
G1 X125.983 Y111.111 E-.12263
G1 X126.014 Y111.421 E-.11868
G1 X126.014 Y112.081 E-.25075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.535 Y119.699 Z4.5 F42000
G1 X125.113 Y126.402 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X125.109 Y126.404 E.00007
G3 X124.777 Y126.436 I-.327 J-1.622 E.00542
G1 X111.023 Y126.436 E.22335
G3 X109.364 Y124.777 I-.005 J-1.654 E.04234
G1 X109.364 Y111.023 E.22335
G3 X111.023 Y109.364 I1.654 J-.005 E.04234
G1 X124.777 Y109.364 E.22335
G1 X125.065 Y109.392 E.0047
G1 X125.109 Y109.396 E.00072
G3 X126.436 Y111.023 I-.35 J1.64 E.03682
G1 X126.436 Y124.777 E.22335
G3 X125.418 Y126.309 I-1.654 J.005 E.03167
G1 X125.17 Y126.385 E.0042
; WIPE_START
G1 F3600
M204 S6000
G1 X125.109 Y126.404 E-.02434
G1 X124.777 Y126.436 E-.12665
G1 X123.175 Y126.436 E-.60902
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
G1 X124.748 Y126.207 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0896334
G1 F1939
M204 S6000
G1 X124.903 Y126.176 E.00044
; LINE_WIDTH: 0.117986
G1 X125.058 Y126.145 E.00062
; LINE_WIDTH: 0.150878
G2 X125.309 Y126.046 I-.422 J-1.432 E.00143
; LINE_WIDTH: 0.192883
G2 X125.971 Y125.448 I-.756 J-1.502 E.0063
; LINE_WIDTH: 0.164031
G2 X126.131 Y125.104 I-1.99 J-1.136 E.00221
; LINE_WIDTH: 0.12135
G2 X126.176 Y124.903 I-.93 J-.316 E.00084
; LINE_WIDTH: 0.0896344
G1 X126.207 Y124.748 E.00044
M204 S10000
G1 X126.207 Y111.052 F42000
; LINE_WIDTH: 0.0896334
G1 F1939
M204 S6000
G1 X126.176 Y110.897 E.00044
; LINE_WIDTH: 0.121355
G2 X126.131 Y110.696 I-.973 J.114 E.00084
; LINE_WIDTH: 0.164046
G2 X125.971 Y110.352 I-2.147 J.79 E.00221
; LINE_WIDTH: 0.192882
G2 X125.309 Y109.754 I-1.418 J.905 E.0063
; LINE_WIDTH: 0.149558
G2 X125.04 Y109.651 I-.543 J1.015 E.00151
; LINE_WIDTH: 0.115285
G1 X124.894 Y109.622 E.00057
; LINE_WIDTH: 0.0887359
G1 X124.748 Y109.593 E.00041
M204 S10000
G1 X111.052 Y109.593 F42000
; LINE_WIDTH: 0.0896334
G1 F1939
M204 S6000
G1 X110.897 Y109.624 E.00044
; LINE_WIDTH: 0.121355
G2 X110.696 Y109.669 I.114 J.973 E.00084
; LINE_WIDTH: 0.164046
G2 X110.352 Y109.829 I.79 J2.147 E.00221
; LINE_WIDTH: 0.192882
G2 X109.754 Y110.491 I.905 J1.418 E.0063
; LINE_WIDTH: 0.150859
G2 X109.655 Y110.742 I1.326 J.67 E.00143
; LINE_WIDTH: 0.117981
G1 X109.624 Y110.897 E.00062
; LINE_WIDTH: 0.0896344
G1 X109.593 Y111.052 E.00044
M204 S10000
G1 X109.593 Y124.748 F42000
; LINE_WIDTH: 0.0896334
G1 F1939
M204 S6000
G1 X109.624 Y124.903 E.00044
; LINE_WIDTH: 0.117986
G1 X109.655 Y125.058 E.00062
; LINE_WIDTH: 0.150878
G2 X109.754 Y125.309 I1.432 J-.422 E.00143
; LINE_WIDTH: 0.192883
G2 X110.352 Y125.971 I1.502 J-.756 E.0063
; LINE_WIDTH: 0.164031
G2 X110.696 Y126.131 I1.136 J-1.99 E.00221
; LINE_WIDTH: 0.12135
G2 X110.897 Y126.176 I.316 J-.93 E.00084
; LINE_WIDTH: 0.0896344
G1 X111.053 Y126.207 E.00044
; WIPE_START
G1 F15000
G1 X110.897 Y126.176 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.148 Y119.837 Z4.5 F42000
G1 X117.03 Y117.03 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1939
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.309 J.899 E.03329
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53569
G1 X115.732 Y116.78 E-.10373
G1 X115.882 Y116.528 E-.11163
G1 X115.897 Y116.51 E-.00895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G3 X117.978 Y115.462 I.81 J2.317 E.01466
G3 X118.714 Y115.6 I-.247 J3.342 E.01218
G1 X117.151 Y115.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16113
G1 X117.978 Y115.462 E-.15933
G1 X118.429 Y115.518 E-.17277
G1 X118.714 Y115.6 E-.11244
G1 X118.307 Y115.6 E-.15433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.033 J2.268 E.03118
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04956
G1 X119.292 Y115.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.087 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X120.217 Y117.136 E.00084
G3 X120.2 Y118.712 I-2.392 J.762 E.02603
G1 X120.2 Y117.147 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X120.217 Y117.136 E-.00777
G1 X120.322 Y117.608 E-.18363
G1 X120.338 Y117.999 E-.14887
G1 X120.292 Y118.383 E-.14694
G1 X120.2 Y118.712 E-.12969
G1 X120.2 Y118.335 E-.1431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
M73 P91 R2
G1 X120.178 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.318 J-1.018 E.03195
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53569
G1 X120.149 Y118.846 E-.03082
G1 X120.035 Y119.08 E-.09908
G1 X119.901 Y119.289 E-.09441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X118.71 Y120.202 E.02637
G3 X117.143 Y120.219 I-.81 J-2.35 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.71 Y120.202 E-.59543
G1 X118.289 Y120.304 E-.16457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.895 J-2.306 E.03329
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08495
G1 X116.569 Y119.945 E-.11153
G1 X116.51 Y119.901 E-.02814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.088 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1939
M204 S5000
G1 X115.6 Y118.713 E.02638
G3 X115.581 Y117.145 I2.324 J-.812 E.02592
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.713 E-.5959
G1 X115.508 Y118.38 E-.13119
G1 X115.498 Y118.294 E-.03291
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 42/53
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.5 I.76 J.95 P1  F42000
G1 X125.55 Y110.249 Z4.5
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X125.551 Y110.249 E.00001
G3 X126.036 Y111.412 I-1.17 J1.17 E.02098
G1 X126.036 Y124.388 E.21072
G3 X124.388 Y126.036 I-1.655 J-.008 E.04196
G1 X111.412 Y126.036 E.21072
G3 X109.764 Y124.388 I.008 J-1.655 E.04196
G1 X109.764 Y111.412 E.21072
G3 X111.412 Y109.764 I1.655 J.008 E.04196
G1 X124.388 Y109.764 E.21072
G3 X125.299 Y110.043 I-.008 J1.655 E.01569
G1 X125.504 Y110.211 E.0043
; WIPE_START
G1 F3600
M204 S6000
G1 X125.551 Y110.249 E-.02299
G1 X125.757 Y110.501 E-.12357
G1 X125.91 Y110.787 E-.12353
G1 X126.005 Y111.098 E-.12357
G1 X126.036 Y111.412 E-.11959
G1 X126.036 Y112.061 E-.24675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.557 Y119.678 Z4.6 F42000
G1 X125.132 Y126.43 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X125.128 Y126.432 E.00007
G3 X124.794 Y126.465 I-.329 J-1.633 E.00546
G1 X111.006 Y126.465 E.2239
G3 X109.335 Y124.794 I-.005 J-1.666 E.04263
G1 X109.335 Y111.006 E.2239
G3 X111.006 Y109.335 I1.666 J-.005 E.04263
G1 X124.794 Y109.335 E.2239
G1 X125.09 Y109.365 E.00482
G1 X125.128 Y109.368 E.00063
G3 X126.465 Y111.006 I-.353 J1.652 E.03708
G1 X126.465 Y124.794 E.2239
G3 X125.439 Y126.337 I-1.666 J.005 E.03189
G1 X125.19 Y126.413 E.00424
; WIPE_START
G1 F3600
M204 S6000
G1 X125.128 Y126.432 E-.02438
G1 X124.794 Y126.465 E-.1275
G1 X123.194 Y126.465 E-.60813
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
G1 X124.735 Y126.235 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0920077
G1 F1946
M204 S6000
G2 X124.929 Y126.198 I-.269 J-1.983 E.00057
; LINE_WIDTH: 0.125658
G1 X125.076 Y126.169 E.00064
; LINE_WIDTH: 0.159566
G2 X125.328 Y126.069 I-.43 J-1.451 E.00153
; LINE_WIDTH: 0.202068
G2 X125.994 Y125.467 I-.763 J-1.512 E.00668
; LINE_WIDTH: 0.172652
G2 X126.155 Y125.121 I-1.986 J-1.135 E.00236
; LINE_WIDTH: 0.129171
G2 X126.198 Y124.929 I-.865 J-.296 E.00086
; LINE_WIDTH: 0.0963369
G1 X126.228 Y124.783 E.00046
; LINE_WIDTH: 0.0785623
G1 X126.235 Y124.735 E.00011
M204 S10000
G1 X126.235 Y111.065 F42000
; LINE_WIDTH: 0.0785626
G1 F1946
M204 S6000
G1 X126.228 Y111.017 E.00011
; LINE_WIDTH: 0.0963346
G1 X126.199 Y110.871 E.00046
; LINE_WIDTH: 0.129176
G2 X126.155 Y110.679 I-.909 J.105 E.00086
; LINE_WIDTH: 0.172664
G2 X125.994 Y110.333 I-2.146 J.787 E.00236
; LINE_WIDTH: 0.202068
G2 X125.328 Y109.731 I-1.428 J.91 E.00668
; LINE_WIDTH: 0.158639
G2 X125.064 Y109.628 I-.571 J1.079 E.00159
; LINE_WIDTH: 0.12379
G1 X124.923 Y109.6 E.0006
; LINE_WIDTH: 0.0913997
G2 X124.735 Y109.565 I-.451 J1.899 E.00055
M204 S10000
G1 X111.065 Y109.565 F42000
; LINE_WIDTH: 0.0785626
G1 F1946
M204 S6000
G1 X111.017 Y109.572 E.00011
; LINE_WIDTH: 0.0963346
G1 X110.871 Y109.602 E.00046
; LINE_WIDTH: 0.129176
G2 X110.679 Y109.645 I.105 J.909 E.00086
; LINE_WIDTH: 0.172664
G2 X110.333 Y109.806 I.787 J2.146 E.00236
; LINE_WIDTH: 0.202068
G2 X109.731 Y110.472 I.91 J1.428 E.00668
; LINE_WIDTH: 0.159557
G2 X109.631 Y110.724 I1.35 J.682 E.00153
; LINE_WIDTH: 0.12565
G1 X109.602 Y110.871 E.00063
; LINE_WIDTH: 0.0920077
G2 X109.565 Y111.065 I1.96 J.466 E.00057
M204 S10000
G1 X109.565 Y124.735 F42000
; LINE_WIDTH: 0.0920077
G1 F1946
M204 S6000
G2 X109.602 Y124.929 I1.983 J-.269 E.00057
; LINE_WIDTH: 0.125658
G1 X109.631 Y125.076 E.00064
; LINE_WIDTH: 0.159566
G2 X109.731 Y125.328 I1.451 J-.43 E.00153
; LINE_WIDTH: 0.202068
G2 X110.333 Y125.994 I1.512 J-.763 E.00668
; LINE_WIDTH: 0.172652
G2 X110.679 Y126.155 I1.135 J-1.986 E.00236
; LINE_WIDTH: 0.129171
G2 X110.871 Y126.198 I.296 J-.865 E.00086
; LINE_WIDTH: 0.0963369
G1 X111.017 Y126.228 E.00046
; LINE_WIDTH: 0.0785623
G1 X111.065 Y126.235 E.00011
; WIPE_START
G1 F15000
G1 X111.017 Y126.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.194 Y119.839 Z4.6 F42000
G1 X117.03 Y117.03 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.277 J.868 E.03333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53571
G1 X115.827 Y116.613 E-.17683
G1 X115.898 Y116.509 E-.04747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G3 X117.975 Y115.462 I.81 J2.317 E.01462
G3 X118.714 Y115.6 I-.243 J3.334 E.01222
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16125
G1 X117.975 Y115.462 E-.15832
G1 X118.429 Y115.518 E-.17382
G1 X118.714 Y115.6 E-.11239
G1 X118.308 Y115.6 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-.993 J2.23 E.03121
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04953
G1 X119.292 Y115.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X120.225 Y117.163 E.00127
G3 X120.2 Y118.712 I-2.32 J.737 E.0256
G1 X120.2 Y117.148 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X120.225 Y117.163 E-.01106
G1 X120.309 Y117.514 E-.13727
G1 X120.338 Y117.999 E-.18466
G1 X120.292 Y118.383 E-.14697
G1 X120.2 Y118.712 E-.1296
G1 X120.2 Y118.316 E-.15044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X120.179 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.179 I-2.265 J-.962 E.032
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53571
G1 X120.149 Y118.846 E-.0308
G1 X119.985 Y119.166 E-.13685
G1 X119.902 Y119.29 E-.05663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.378 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59507
G1 X118.288 Y120.305 E-.16494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.863 J-2.272 E.03332
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08501
G1 X116.569 Y119.945 E-.11151
G1 X116.511 Y119.899 E-.0281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X115.6 Y118.712 E.02636
G3 X115.581 Y117.145 I2.292 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.712 E-.59533
G1 X115.493 Y118.292 E-.16467
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 43/53
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I.76 J.95 P1  F42000
G1 X125.568 Y110.23 Z4.6
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X125.569 Y110.231 E.00002
G3 X126.058 Y111.402 I-1.179 J1.179 E.02114
G1 X126.058 Y124.398 E.21103
G3 X124.398 Y126.058 I-1.667 J-.008 E.04227
G1 X111.402 Y126.058 E.21103
G3 X109.742 Y124.398 I.008 J-1.667 E.04227
G1 X109.742 Y111.402 E.21103
G3 X111.402 Y109.742 I1.667 J.008 E.04227
G1 X124.398 Y109.742 E.21103
G3 X125.316 Y110.023 I-.008 J1.667 E.01581
G1 X125.522 Y110.192 E.00433
; WIPE_START
G1 F3600
M204 S6000
G1 X125.569 Y110.231 E-.02322
G1 X125.777 Y110.484 E-.12445
G1 X125.931 Y110.773 E-.12448
G1 X126.026 Y111.086 E-.12446
G1 X126.058 Y111.402 E-.12049
G1 X126.058 Y112.041 E-.2429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.579 Y119.658 Z4.7 F42000
G1 X125.151 Y126.459 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X125.148 Y126.46 E.00007
G3 X124.811 Y126.493 I-.332 J-1.644 E.00549
G1 X110.989 Y126.493 E.22445
G3 X109.307 Y124.811 I-.004 J-1.677 E.04292
G1 X109.307 Y110.989 E.22445
G3 X110.989 Y109.307 I1.677 J-.004 E.04292
G1 X124.811 Y109.307 E.22445
G1 X125.114 Y109.337 E.00494
G1 X125.148 Y109.34 E.00055
G3 X126.493 Y110.989 I-.355 J1.663 E.03733
G1 X126.493 Y124.811 E.22445
G3 X125.461 Y126.364 I-1.677 J.004 E.0321
G1 X125.209 Y126.441 E.00427
; WIPE_START
G1 F3600
M204 S6000
G1 X125.148 Y126.46 E-.02437
G1 X124.811 Y126.493 E-.12834
G1 X123.213 Y126.493 E-.60729
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
G1 X124.71 Y126.26 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0950413
G1 F1953
M204 S6000
G2 X124.947 Y126.223 I-.05 J-1.076 E.00072
; LINE_WIDTH: 0.133715
G1 X125.095 Y126.193 E.00069
; LINE_WIDTH: 0.168268
G2 X125.348 Y126.092 I-.441 J-1.476 E.00163
; LINE_WIDTH: 0.211273
G2 X126.017 Y125.487 I-.768 J-1.521 E.00706
; LINE_WIDTH: 0.181285
G2 X126.18 Y125.137 I-1.981 J-1.133 E.00252
; LINE_WIDTH: 0.137111
G2 X126.223 Y124.947 I-.837 J-.289 E.00092
; LINE_WIDTH: 0.104235
G1 X126.252 Y124.8 E.00051
; LINE_WIDTH: 0.0796811
G1 X126.26 Y124.71 E.00021
M204 S10000
G1 X126.26 Y111.09 F42000
; LINE_WIDTH: 0.079682
G1 F1953
M204 S6000
G1 X126.252 Y111 E.00021
; LINE_WIDTH: 0.104228
G1 X126.223 Y110.853 E.00051
; LINE_WIDTH: 0.137118
G2 X126.18 Y110.663 I-.879 J.099 E.00092
; LINE_WIDTH: 0.181284
G2 X126.017 Y110.313 I-2.146 J.784 E.00252
; LINE_WIDTH: 0.211272
G2 X125.348 Y109.708 I-1.437 J.916 E.00706
; LINE_WIDTH: 0.167755
G2 X125.088 Y109.605 I-.622 J1.201 E.00167
; LINE_WIDTH: 0.132666
G1 X124.944 Y109.577 E.00067
; LINE_WIDTH: 0.0946874
G2 X124.71 Y109.54 I-.282 J1.026 E.00071
M204 S10000
G1 X111.09 Y109.54 F42000
; LINE_WIDTH: 0.079682
G1 F1953
M204 S6000
G1 X111.001 Y109.548 E.00021
; LINE_WIDTH: 0.104228
G1 X110.853 Y109.577 E.00051
; LINE_WIDTH: 0.137118
G2 X110.663 Y109.62 I.099 J.879 E.00092
; LINE_WIDTH: 0.181284
G2 X110.313 Y109.783 I.784 J2.146 E.00252
; LINE_WIDTH: 0.211272
G2 X109.708 Y110.452 I.916 J1.437 E.00706
; LINE_WIDTH: 0.168273
G2 X109.607 Y110.705 I1.374 J.694 E.00163
; LINE_WIDTH: 0.133706
G1 X109.577 Y110.853 E.00069
; LINE_WIDTH: 0.09504
G2 X109.54 Y111.09 I1.039 J.287 E.00072
M204 S10000
G1 X109.54 Y124.71 F42000
; LINE_WIDTH: 0.0950413
G1 F1953
M204 S6000
G2 X109.577 Y124.947 I1.076 J-.05 E.00072
; LINE_WIDTH: 0.133715
G1 X109.607 Y125.095 E.00069
; LINE_WIDTH: 0.168268
G2 X109.708 Y125.348 I1.476 J-.441 E.00163
; LINE_WIDTH: 0.211273
G2 X110.313 Y126.017 I1.521 J-.768 E.00706
; LINE_WIDTH: 0.181285
G2 X110.663 Y126.18 I1.133 J-1.981 E.00252
; LINE_WIDTH: 0.137111
G2 X110.853 Y126.223 I.289 J-.837 E.00092
; LINE_WIDTH: 0.104235
G1 X111 Y126.252 E.00051
; LINE_WIDTH: 0.0796811
G1 X111.09 Y126.26 E.00021
; WIPE_START
G1 F15000
G1 X111 Y126.252 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.177 Y119.864 Z4.7 F42000
G1 X117.03 Y117.03 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.311 J.901 E.0333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53584
G1 X115.827 Y116.613 E-.17687
G1 X115.903 Y116.514 E-.04729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G3 X117.973 Y115.462 I.894 J2.856 E.01455
G3 X118.714 Y115.6 I-.144 J2.823 E.01227
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
M73 P92 R2
G1 X117.561 Y115.484 E-.16203
M73 P92 R1
G1 X117.973 Y115.462 E-.15661
G1 X118.431 Y115.519 E-.17551
G1 X118.714 Y115.6 E-.11163
G1 X118.308 Y115.6 E-.15422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00211
G3 X120.179 Y117.03 I-1.029 J2.265 E.03118
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53537
G1 X118.891 Y115.67 E-.04933
G1 X119.292 Y115.898 E-.1753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X120.246 Y117.23 E.00239
G3 X120.2 Y118.711 I-2.343 J.669 E.02446
G1 X120.2 Y117.15 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03498
G1 X120.33 Y117.682 E-.17471
G1 X120.338 Y117.999 E-.12053
G1 X120.292 Y118.383 E-.14693
G1 X120.2 Y118.711 E-.12959
G1 X120.2 Y118.308 E-.15327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X120.179 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.178 I-2.282 J-.982 E.03197
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53573
G1 X120.149 Y118.846 E-.03083
G1 X120.021 Y119.107 E-.11061
G1 X119.902 Y119.289 E-.08283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.615 Y120.233 E.00161
G3 X117.143 Y120.219 I-.714 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.5948
G1 X118.615 Y120.233 E-.03758
G1 X118.287 Y120.304 E-.12762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.895 J-2.304 E.03328
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53537
G1 X116.801 Y120.078 E-.09488
G1 X116.508 Y119.902 E-.12975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X115.6 Y118.71 E.02631
G3 X115.581 Y117.146 I2.283 J-.81 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59419
G1 X115.491 Y118.287 E-.16581
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 44/53
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.7 I.76 J.95 P1  F42000
G1 X125.586 Y110.211 Z4.7
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X125.588 Y110.212 E.00003
G3 X126.08 Y111.392 I-1.188 J1.187 E.02129
G1 X126.08 Y124.408 E.21135
G3 X124.408 Y126.08 I-1.679 J-.008 E.04258
G1 X111.392 Y126.08 E.21135
G3 X109.721 Y124.408 I.008 J-1.679 E.04258
G1 X109.721 Y111.392 E.21135
G3 X111.392 Y109.72 I1.679 J.008 E.04258
G1 X124.408 Y109.72 E.21135
G3 X125.333 Y110.003 I-.008 J1.679 E.01593
G1 X125.54 Y110.173 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X125.588 Y110.212 E-.02347
G1 X125.797 Y110.467 E-.12536
G1 X125.952 Y110.758 E-.12537
G1 X126.048 Y111.074 E-.12538
G1 X126.08 Y111.392 E-.1214
G1 X126.08 Y112.021 E-.23902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.601 Y119.639 Z4.8 F42000
G1 X125.17 Y126.487 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X125.167 Y126.488 E.00006
G3 X124.828 Y126.521 I-.334 J-1.655 E.00553
G1 X110.972 Y126.521 E.22501
G3 X109.279 Y124.828 I-.005 J-1.688 E.04321
G1 X109.279 Y110.972 E.22501
G3 X110.972 Y109.279 I1.688 J-.005 E.04321
G1 X124.828 Y109.279 E.22501
G1 X125.138 Y109.309 E.00506
G1 X125.167 Y109.312 E.00046
G3 X126.521 Y110.972 I-.357 J1.674 E.03758
G1 X126.521 Y124.828 E.22501
G3 X125.482 Y126.391 I-1.688 J.005 E.03232
G1 X125.228 Y126.469 E.00431
; WIPE_START
G1 F3600
M204 S6000
G1 X125.167 Y126.488 E-.02431
G1 X124.828 Y126.521 E-.12917
G1 X123.232 Y126.521 E-.60653
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
G1 X124.655 Y126.289 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0797514
G1 F1964
M204 S6000
G1 X124.769 Y126.283 E.00027
; LINE_WIDTH: 0.106956
G2 X124.965 Y126.247 I-.234 J-1.808 E.00069
; LINE_WIDTH: 0.141762
G1 X125.113 Y126.217 E.00074
; LINE_WIDTH: 0.176965
G2 X125.368 Y126.116 I-.452 J-1.503 E.00174
; LINE_WIDTH: 0.220497
G2 X126.041 Y125.506 I-.774 J-1.531 E.00745
; LINE_WIDTH: 0.189893
G2 X126.205 Y125.153 I-1.976 J-1.132 E.00267
; LINE_WIDTH: 0.145066
G2 X126.247 Y124.965 I-.811 J-.281 E.00098
; LINE_WIDTH: 0.112138
G1 X126.276 Y124.816 E.00056
; LINE_WIDTH: 0.0828675
G1 X126.289 Y124.655 E.0004
M204 S10000
G1 X126.289 Y111.145 F42000
; LINE_WIDTH: 0.0828746
G1 F1964
M204 S6000
G1 X126.276 Y110.984 E.0004
; LINE_WIDTH: 0.112138
G1 X126.247 Y110.835 E.00056
; LINE_WIDTH: 0.145052
G2 X126.205 Y110.647 I-.853 J.093 E.00098
; LINE_WIDTH: 0.189904
G2 X126.041 Y110.294 I-2.142 J.78 E.00267
; LINE_WIDTH: 0.220498
G2 X125.368 Y109.684 I-1.447 J.921 E.00745
; LINE_WIDTH: 0.175622
G2 X125.105 Y109.581 I-.709 J1.415 E.00178
; LINE_WIDTH: 0.140608
G1 X124.961 Y109.552 E.00071
; LINE_WIDTH: 0.106554
G2 X124.769 Y109.517 I-.421 J1.739 E.00067
; LINE_WIDTH: 0.0797412
G1 X124.655 Y109.511 E.00027
M204 S10000
G1 X111.145 Y109.511 F42000
; LINE_WIDTH: 0.0828746
G1 F1964
M204 S6000
G1 X110.984 Y109.524 E.0004
; LINE_WIDTH: 0.112138
G1 X110.835 Y109.553 E.00056
; LINE_WIDTH: 0.145052
G2 X110.647 Y109.595 I.093 J.853 E.00098
; LINE_WIDTH: 0.189904
G2 X110.294 Y109.759 I.78 J2.142 E.00267
; LINE_WIDTH: 0.220493
G2 X109.684 Y110.432 I.921 J1.447 E.00745
; LINE_WIDTH: 0.176962
G2 X109.583 Y110.687 I1.401 J.707 E.00174
; LINE_WIDTH: 0.141775
G1 X109.553 Y110.835 E.00074
; LINE_WIDTH: 0.106954
G2 X109.517 Y111.031 I1.769 J.429 E.00069
; LINE_WIDTH: 0.0797412
G1 X109.511 Y111.145 E.00027
M204 S10000
G1 X109.511 Y124.655 F42000
; LINE_WIDTH: 0.0797514
G1 F1964
M204 S6000
G1 X109.517 Y124.769 E.00027
; LINE_WIDTH: 0.106956
G2 X109.553 Y124.965 I1.808 J-.234 E.00069
; LINE_WIDTH: 0.141762
G1 X109.583 Y125.113 E.00074
; LINE_WIDTH: 0.176965
G2 X109.684 Y125.368 I1.503 J-.452 E.00174
; LINE_WIDTH: 0.220497
G2 X110.294 Y126.041 I1.531 J-.774 E.00745
; LINE_WIDTH: 0.189893
G2 X110.647 Y126.205 I1.132 J-1.976 E.00267
; LINE_WIDTH: 0.145066
G2 X110.835 Y126.247 I.281 J-.811 E.00098
; LINE_WIDTH: 0.112138
G1 X110.984 Y126.276 E.00056
; LINE_WIDTH: 0.0828675
G1 X111.145 Y126.289 E.0004
; WIPE_START
G1 F15000
G1 X110.984 Y126.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.161 Y119.888 Z4.8 F42000
G1 X117.03 Y117.03 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1964
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.338 J.93 E.03326
G1 X117.03 Y116.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53584
G1 X115.732 Y116.78 E-.10396
G1 X115.883 Y116.528 E-.11154
G1 X115.897 Y116.51 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G3 X117.97 Y115.461 I.81 J2.318 E.01452
G3 X118.714 Y115.6 I-.235 J3.324 E.0123
G1 X117.151 Y115.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16102
G1 X117.97 Y115.461 E-.15636
G1 X118.429 Y115.518 E-.17575
G1 X118.714 Y115.6 E-.11239
G1 X118.307 Y115.599 E-.15448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.01 J2.247 E.03119
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04957
G1 X119.292 Y115.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.087 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X120.217 Y117.136 E.00085
G3 X120.2 Y118.711 I-2.391 J.761 E.02602
G1 X120.2 Y117.147 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X120.217 Y117.136 E-.00775
G1 X120.309 Y117.512 E-.14699
G1 X120.338 Y117.999 E-.18545
G1 X120.292 Y118.383 E-.14688
G1 X120.2 Y118.711 E-.12958
G1 X120.2 Y118.334 E-.14335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X120.179 Y118.77 E.02287
G1 X120.149 Y118.846 E.00132
G3 X118.77 Y120.178 I-2.251 J-.949 E.032
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53575
G1 X120.149 Y118.846 E-.03084
G1 X119.918 Y119.271 E-.18377
G1 X119.902 Y119.29 E-.00964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X118.708 Y120.2 E.02634
M73 P93 R1
G1 X118.617 Y120.232 E.00158
G3 X117.143 Y120.219 I-.716 J-2.338 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.5948
G1 X118.617 Y120.232 E-.03692
G1 X118.287 Y120.306 E-.12828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.873 J-2.282 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.825 Y120.09 E-.08487
G1 X116.508 Y119.902 E-.13975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1964
M204 S5000
G1 X115.6 Y118.713 E.02635
G3 X115.581 Y117.147 I2.318 J-.811 E.02589
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.713 E-.59519
G1 X115.508 Y118.38 E-.13127
G1 X115.497 Y118.293 E-.03354
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 45/53
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.761 J.95 P1  F42000
G1 X125.608 Y110.196 Z4.8
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X125.817 Y110.451 E.00536
G3 X126.101 Y111.382 I-1.407 J.939 E.01604
G1 X126.101 Y124.418 E.21167
G3 X124.418 Y126.101 I-1.692 J-.008 E.04289
G1 X111.382 Y126.101 E.21167
G3 X109.699 Y124.418 I.008 J-1.692 E.04289
G1 X109.699 Y111.382 E.21167
G3 X111.382 Y109.699 I1.692 J.008 E.04289
G1 X124.418 Y109.699 E.21167
G3 X125.565 Y110.154 I-.008 J1.692 E.02051
; WIPE_START
G1 F3600
M204 S6000
G1 X125.817 Y110.451 E-.14802
G1 X125.973 Y110.744 E-.12626
G1 X126.07 Y111.062 E-.12629
G1 X126.101 Y111.382 E-.12231
G1 X126.101 Y112.006 E-.23712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.623 Y119.624 Z4.9 F42000
G1 X125.189 Y126.515 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X125.186 Y126.516 E.00006
G3 X124.845 Y126.549 I-.336 J-1.666 E.00557
G1 X110.955 Y126.549 E.22556
G3 X109.251 Y124.845 I-.005 J-1.7 E.0435
G1 X109.251 Y110.955 E.22556
G3 X110.955 Y109.251 I1.7 J-.005 E.0435
G1 X124.845 Y109.251 E.22556
G1 X125.163 Y109.282 E.00518
G1 X125.186 Y109.284 E.00038
G3 X126.549 Y110.955 I-.36 J1.685 E.03783
G1 X126.549 Y124.845 E.22556
G3 X125.503 Y126.419 I-1.7 J.005 E.03253
G1 X125.247 Y126.497 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X125.186 Y126.516 E-.02415
G1 X124.845 Y126.549 E-.13003
G1 X123.251 Y126.549 E-.60582
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
G1 X124.601 Y126.317 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.083041
G1 F1975
M204 S6000
G1 X124.782 Y126.308 E.00046
; LINE_WIDTH: 0.114332
G2 X124.982 Y126.271 I-.241 J-1.87 E.00077
; LINE_WIDTH: 0.14983
G1 X125.131 Y126.242 E.0008
; LINE_WIDTH: 0.185677
G2 X125.387 Y126.139 I-.465 J-1.531 E.00185
; LINE_WIDTH: 0.229685
G2 X126.064 Y125.526 I-.779 J-1.54 E.00784
; LINE_WIDTH: 0.198511
G2 X126.229 Y125.17 I-1.975 J-1.133 E.00283
; LINE_WIDTH: 0.153021
G2 X126.271 Y124.982 I-.784 J-.274 E.00103
; LINE_WIDTH: 0.120041
G1 X126.301 Y124.833 E.00061
; LINE_WIDTH: 0.0862652
G1 X126.317 Y124.601 E.00062
M204 S10000
G1 X126.317 Y111.199 F42000
; LINE_WIDTH: 0.0862673
G1 F1975
M204 S6000
G1 X126.301 Y110.967 E.00062
; LINE_WIDTH: 0.120024
G1 X126.271 Y110.818 E.00061
; LINE_WIDTH: 0.153002
G2 X126.229 Y110.63 I-.828 J.087 E.00103
; LINE_WIDTH: 0.198512
G2 X126.064 Y110.274 I-2.138 J.776 E.00283
; LINE_WIDTH: 0.229686
G2 X125.387 Y109.661 I-1.456 J.927 E.00784
; LINE_WIDTH: 0.185185
G2 X125.129 Y109.558 I-.722 J1.437 E.00186
; LINE_WIDTH: 0.149426
G1 X124.981 Y109.529 E.00079
; LINE_WIDTH: 0.114195
G2 X124.782 Y109.492 I-.438 J1.82 E.00076
; LINE_WIDTH: 0.0830368
G1 X124.601 Y109.483 E.00046
M204 S10000
G1 X111.199 Y109.483 F42000
; LINE_WIDTH: 0.0862673
G1 F1975
M204 S6000
G1 X110.967 Y109.499 E.00062
; LINE_WIDTH: 0.120024
G1 X110.818 Y109.529 E.00061
; LINE_WIDTH: 0.153002
G2 X110.63 Y109.571 I.087 J.828 E.00103
; LINE_WIDTH: 0.198512
G2 X110.274 Y109.736 I.776 J2.138 E.00283
; LINE_WIDTH: 0.229685
G2 X109.661 Y110.413 I.926 J1.456 E.00784
; LINE_WIDTH: 0.185675
G2 X109.558 Y110.669 I1.426 J.72 E.00185
; LINE_WIDTH: 0.149845
G1 X109.529 Y110.818 E.0008
; LINE_WIDTH: 0.114338
G2 X109.492 Y111.018 I1.83 J.441 E.00077
; LINE_WIDTH: 0.0830368
G1 X109.483 Y111.199 E.00046
M204 S10000
G1 X109.483 Y124.601 F42000
; LINE_WIDTH: 0.083041
G1 F1975
M204 S6000
G1 X109.492 Y124.782 E.00046
; LINE_WIDTH: 0.114332
G2 X109.529 Y124.982 I1.87 J-.241 E.00077
; LINE_WIDTH: 0.14983
G1 X109.558 Y125.131 E.0008
; LINE_WIDTH: 0.185677
G2 X109.661 Y125.387 I1.531 J-.465 E.00185
; LINE_WIDTH: 0.229685
G2 X110.274 Y126.064 I1.54 J-.779 E.00784
; LINE_WIDTH: 0.198511
G2 X110.63 Y126.229 I1.133 J-1.975 E.00283
; LINE_WIDTH: 0.153021
G2 X110.818 Y126.271 I.274 J-.784 E.00103
; LINE_WIDTH: 0.120041
G1 X110.967 Y126.301 E.00061
; LINE_WIDTH: 0.0862652
G1 X111.199 Y126.317 E.00062
; WIPE_START
G1 F15000
G1 X110.967 Y126.301 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.144 Y119.913 Z4.9 F42000
G1 X117.03 Y117.03 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1975
M204 S5000
G1 X115.621 Y117.03 E.02287
G3 X117.03 Y115.621 I2.31 J.9 E.03329
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53578
G1 X115.789 Y116.678 E-.14829
G1 X115.898 Y116.51 E-.07593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G3 X117.968 Y115.461 I.811 J2.32 E.01449
G3 X118.709 Y115.6 I-.129 J2.739 E.01228
G1 X117.151 Y115.598 E.0253
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16113
G1 X117.968 Y115.461 E-.1555
G1 X118.431 Y115.519 E-.17752
G1 X118.709 Y115.6 E-.10993
G1 X118.299 Y115.6 E-.15592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X118.77 Y115.622 E.02287
G1 X118.802 Y115.633 E.00055
G3 X120.179 Y117.03 I-.933 J2.297 E.03275
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53569
G1 X118.802 Y115.633 E-.01277
G1 X119.064 Y115.756 E-.10991
G1 X119.291 Y115.897 E-.10164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.088 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X120.223 Y117.155 E.00116
G3 X120.2 Y118.71 I-2.314 J.743 E.0257
G1 X120.2 Y117.148 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X120.223 Y117.155 E-.00922
G1 X120.309 Y117.514 E-.14014
G1 X120.338 Y117.999 E-.18467
G1 X120.292 Y118.383 E-.14687
G1 X120.2 Y118.71 E-.12924
G1 X120.2 Y118.316 E-.14986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.179 I-2.227 J-1.052 E.03043
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.11 Y118.934 E-.06751
G1 X119.899 Y119.288 E-.15666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X118.711 Y120.201 E.02638
G3 X117.143 Y120.219 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.59578
G1 X118.315 Y120.304 E-.15545
G1 X118.292 Y120.306 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.865 J-2.275 E.03332
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.736 Y120.045 E-.12248
G1 X116.568 Y119.944 E-.07445
G1 X116.51 Y119.901 E-.02769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.089 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1975
M204 S5000
G1 X115.6 Y118.712 E.02636
G3 X115.581 Y117.146 I2.361 J-.812 E.02587
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.712 E-.5952
G1 X115.492 Y118.292 E-.1648
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 46/53
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.9 I.761 J.95 P1  F42000
G1 X125.622 Y110.174 Z4.9
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X125.624 Y110.176 E.00005
G3 X126.123 Y111.373 I-1.205 J1.205 E.0216
G1 X126.123 Y124.427 E.21198
G3 X124.427 Y126.123 I-1.704 J-.008 E.04321
G1 X111.373 Y126.123 E.21198
G3 X109.677 Y124.427 I.008 J-1.704 E.04321
G1 X109.677 Y111.373 E.21198
G3 X111.373 Y109.677 I1.704 J.008 E.04321
G1 X124.427 Y109.677 E.21198
G3 X125.366 Y109.963 I-.008 J1.704 E.01616
G1 X125.576 Y110.136 E.00441
; WIPE_START
G1 F3600
M204 S6000
G1 X125.624 Y110.176 E-.02399
G1 X125.837 Y110.434 E-.12717
G1 X125.994 Y110.73 E-.12718
G1 X126.092 Y111.05 E-.1272
G1 X126.123 Y111.373 E-.12323
G1 X126.123 Y111.981 E-.23123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.645 Y119.598 Z5 F42000
G1 X125.208 Y126.543 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X125.205 Y126.544 E.00005
G3 X124.862 Y126.578 I-.338 J-1.677 E.0056
G1 X110.938 Y126.578 E.22611
G3 X109.222 Y124.862 I-.004 J-1.711 E.04379
G1 X109.222 Y110.938 E.22611
G3 X110.938 Y109.222 I1.711 J-.004 E.04379
G1 X124.862 Y109.222 E.22611
G1 X125.187 Y109.254 E.0053
G1 X125.205 Y109.256 E.0003
G3 X126.578 Y110.938 I-.362 J1.697 E.03808
G1 X126.578 Y124.862 E.22611
G3 X125.524 Y126.446 I-1.711 J.004 E.03275
G1 X125.265 Y126.526 E.0044
; WIPE_START
G1 F3600
M204 S6000
G1 X125.205 Y126.544 E-.02393
G1 X124.862 Y126.578 E-.13088
G1 X123.27 Y126.578 E-.6052
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
G1 X124.546 Y126.345 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.086351
G1 F1986
M204 S6000
G1 X124.794 Y126.333 E.00066
; LINE_WIDTH: 0.121721
G2 X125 Y126.295 I-.247 J-1.923 E.00085
; LINE_WIDTH: 0.157892
G1 X125.15 Y126.266 E.00085
; LINE_WIDTH: 0.194389
G2 X125.407 Y126.162 I-.481 J-1.569 E.00195
; LINE_WIDTH: 0.238894
G2 X126.087 Y125.545 I-.785 J-1.549 E.00824
; LINE_WIDTH: 0.207116
G2 X126.254 Y125.186 I-1.971 J-1.132 E.003
; LINE_WIDTH: 0.160952
G2 X126.295 Y125 I-.759 J-.267 E.00109
; LINE_WIDTH: 0.127941
G1 X126.325 Y124.85 E.00066
; LINE_WIDTH: 0.0897413
G1 X126.345 Y124.546 E.00085
M204 S10000
G1 X126.345 Y111.254 F42000
; LINE_WIDTH: 0.0897365
G1 F1986
M204 S6000
G1 X126.325 Y110.95 E.00085
; LINE_WIDTH: 0.127934
G1 X126.295 Y110.8 E.00066
; LINE_WIDTH: 0.160947
G2 X126.254 Y110.614 I-.801 J.081 E.00109
; LINE_WIDTH: 0.207128
G2 X126.087 Y110.255 I-2.135 J.772 E.003
; LINE_WIDTH: 0.238891
G2 X125.407 Y109.638 I-1.466 J.932 E.00824
; LINE_WIDTH: 0.194388
G2 X125.15 Y109.534 I-.739 J1.468 E.00195
; LINE_WIDTH: 0.157905
G1 X125 Y109.505 E.00085
; LINE_WIDTH: 0.12173
G2 X124.794 Y109.467 I-.452 J1.884 E.00085
; LINE_WIDTH: 0.0863532
G1 X124.546 Y109.455 E.00066
M204 S10000
G1 X111.254 Y109.455 F42000
; LINE_WIDTH: 0.0897365
G1 F1986
M204 S6000
G1 X110.95 Y109.475 E.00085
; LINE_WIDTH: 0.127934
G1 X110.8 Y109.505 E.00066
; LINE_WIDTH: 0.160947
G2 X110.614 Y109.546 I.081 J.801 E.00109
; LINE_WIDTH: 0.207128
G2 X110.255 Y109.713 I.772 J2.135 E.003
; LINE_WIDTH: 0.238891
G2 X109.638 Y110.393 I.932 J1.466 E.00824
; LINE_WIDTH: 0.19439
G2 X109.534 Y110.65 I1.464 J.737 E.00195
; LINE_WIDTH: 0.157901
G1 X109.505 Y110.8 E.00085
; LINE_WIDTH: 0.121729
G2 X109.467 Y111.006 I1.884 J.452 E.00085
; LINE_WIDTH: 0.0863532
G1 X109.455 Y111.254 E.00066
M204 S10000
G1 X109.455 Y124.546 F42000
; LINE_WIDTH: 0.086351
G1 F1986
M204 S6000
G1 X109.467 Y124.794 E.00066
; LINE_WIDTH: 0.121722
G2 X109.505 Y125 I1.921 J-.246 E.00085
; LINE_WIDTH: 0.157906
G1 X109.534 Y125.15 E.00085
; LINE_WIDTH: 0.194391
G2 X109.638 Y125.407 I1.569 J-.481 E.00195
; LINE_WIDTH: 0.238893
G2 X110.255 Y126.087 I1.549 J-.785 E.00824
; LINE_WIDTH: 0.207116
G2 X110.614 Y126.254 I1.132 J-1.971 E.003
; LINE_WIDTH: 0.160952
G2 X110.8 Y126.295 I.267 J-.759 E.00109
; LINE_WIDTH: 0.127941
G1 X110.95 Y126.325 E.00066
; LINE_WIDTH: 0.0897413
G1 X111.254 Y126.345 E.00085
; WIPE_START
G1 F15000
G1 X110.95 Y126.325 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.128 Y119.938 Z5 F42000
G1 X117.03 Y117.03 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1986
M204 S5000
G1 X115.621 Y117.03 E.02287
G3 X117.03 Y115.621 I2.31 J.9 E.0333
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.5358
G1 X115.779 Y116.694 E-.14108
G1 X115.883 Y116.528 E-.07437
G1 X115.897 Y116.51 E-.00875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.09 Y115.598 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G3 X117.965 Y115.461 I.898 J2.87 E.01444
G3 X118.714 Y115.6 I-.228 J3.317 E.01239
G1 X117.15 Y115.598 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.16228
G1 X117.965 Y115.461 E-.15365
G1 X118.429 Y115.518 E-.17769
G1 X118.714 Y115.6 E-.1124
G1 X118.308 Y115.6 E-.15398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.889 Y115.67 E.00209
G3 X120.179 Y117.03 I-.991 J2.23 E.03124
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.889 Y115.67 E-.04881
G1 X119.292 Y115.898 E-.17581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5 F42000
G1 Z4.6
G1 E.8 F1800
M73 P94 R1
G1 F1986
M204 S5000
G1 X120.246 Y117.23 E.00238
G3 X120.2 Y118.711 I-2.341 J.669 E.02445
G1 X120.2 Y117.15 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03489
G1 X120.331 Y117.689 E-.17762
G1 X120.338 Y117.999 E-.1177
G1 X120.292 Y118.383 E-.14687
G1 X120.2 Y118.711 E-.12947
G1 X120.2 Y118.307 E-.15345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X120.179 Y118.77 E.02287
G1 X120.149 Y118.845 E.00131
G3 X118.77 Y120.179 I-2.251 J-.948 E.03202
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.5358
G1 X120.149 Y118.845 E-.03072
G1 X120.02 Y119.108 E-.11119
G1 X119.902 Y119.289 E-.08228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.087 Y120.2 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X118.711 Y120.201 E.02637
G3 X117.144 Y120.219 I-.81 J-2.332 E.0259
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.59555
G1 X118.318 Y120.304 E-.15452
G1 X118.292 Y120.306 E-.00993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.894 J-2.304 E.03329
G1 X116.97 Y118.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53549
G1 X116.737 Y120.045 E-.12241
G1 X116.568 Y119.944 E-.07454
G1 X116.512 Y119.899 E-.02757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.089 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1986
M204 S5000
G1 X115.6 Y118.713 E.02637
G3 X115.581 Y117.146 I2.329 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.713 E-.59559
G1 X115.493 Y118.294 E-.16441
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 47/53
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5 I.761 J.949 P1  F42000
G1 X125.64 Y110.155 Z5
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X125.643 Y110.157 E.00006
G3 X126.145 Y111.363 I-1.213 J1.213 E.02176
G1 X126.145 Y124.437 E.2123
G3 X124.437 Y126.145 I-1.716 J-.008 E.04352
G1 X111.363 Y126.145 E.2123
G3 X109.655 Y124.437 I.008 J-1.716 E.04352
G1 X109.655 Y111.363 E.2123
G3 X111.363 Y109.655 I1.716 J.008 E.04352
G1 X124.437 Y109.655 E.2123
G3 X125.382 Y109.943 I-.008 J1.716 E.01628
G1 X125.593 Y110.117 E.00444
; WIPE_START
G1 F3600
M204 S6000
G1 X125.643 Y110.157 E-.02425
G1 X125.857 Y110.418 E-.12809
G1 X126.016 Y110.715 E-.12813
G1 X126.113 Y111.038 E-.12808
G1 X126.145 Y111.363 E-.12413
G1 X126.145 Y111.961 E-.22733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.666 Y119.578 Z5.1 F42000
G1 X125.226 Y126.571 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X125.224 Y126.572 E.00004
G3 X124.879 Y126.606 I-.34 J-1.688 E.00564
G1 X110.921 Y126.606 E.22666
G3 X109.194 Y124.879 I-.004 J-1.722 E.04407
G1 X109.194 Y110.921 E.22666
G3 X110.921 Y109.194 I1.722 J-.004 E.04407
G1 X124.879 Y109.194 E.22666
G1 X125.211 Y109.227 E.00542
G1 X125.224 Y109.228 E.00021
G3 X126.606 Y110.921 I-.365 J1.708 E.03833
G1 X126.606 Y124.879 E.22666
G3 X125.546 Y126.474 I-1.722 J.004 E.03297
G1 X125.284 Y126.554 E.00445
; WIPE_START
G1 F3600
M204 S6000
G1 X125.224 Y126.572 E-.02362
G1 X124.879 Y126.606 E-.13172
G1 X123.288 Y126.606 E-.60466
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
G1 X124.491 Y126.374 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0896514
G1 F1997
M204 S6000
G1 X124.807 Y126.358 E.00088
; LINE_WIDTH: 0.129095
G2 X125.017 Y126.32 I-.254 J-1.985 E.00094
; LINE_WIDTH: 0.165949
G1 X125.168 Y126.29 E.0009
; LINE_WIDTH: 0.203115
G2 X125.426 Y126.186 I-.498 J-1.609 E.00206
; LINE_WIDTH: 0.248083
G2 X126.111 Y125.564 I-.791 J-1.559 E.00864
; LINE_WIDTH: 0.215733
G2 X126.278 Y125.202 I-1.967 J-1.131 E.00316
; LINE_WIDTH: 0.16888
G2 X126.32 Y125.017 I-.735 J-.261 E.00114
; LINE_WIDTH: 0.135838
G1 X126.35 Y124.867 E.00072
; LINE_WIDTH: 0.0932293
G2 X126.374 Y124.491 I-1.978 J-.315 E.0011
M204 S10000
G1 X126.374 Y111.309 F42000
; LINE_WIDTH: 0.0932334
G1 F1997
M204 S6000
G2 X126.35 Y110.933 I-2.002 J-.061 E.0011
; LINE_WIDTH: 0.135829
G1 X126.32 Y110.783 E.00072
; LINE_WIDTH: 0.168874
G2 X126.278 Y110.598 I-.776 J.076 E.00114
; LINE_WIDTH: 0.21574
G2 X126.111 Y110.236 I-2.135 J.769 E.00316
; LINE_WIDTH: 0.248086
G2 X125.426 Y109.614 I-1.475 J.937 E.00864
; LINE_WIDTH: 0.2031
G2 X125.168 Y109.51 I-.755 J1.503 E.00206
; LINE_WIDTH: 0.165954
G1 X125.017 Y109.48 E.0009
; LINE_WIDTH: 0.129099
G2 X124.807 Y109.442 I-.464 J1.946 E.00094
; LINE_WIDTH: 0.0896488
G1 X124.491 Y109.426 E.00088
M204 S10000
G1 X111.309 Y109.426 F42000
; LINE_WIDTH: 0.0932334
G1 F1997
M204 S6000
G2 X110.933 Y109.45 I-.061 J2.002 E.0011
; LINE_WIDTH: 0.135829
G1 X110.783 Y109.48 E.00072
; LINE_WIDTH: 0.168874
G2 X110.598 Y109.522 I.076 J.776 E.00114
; LINE_WIDTH: 0.21574
G2 X110.236 Y109.689 I.769 J2.135 E.00316
; LINE_WIDTH: 0.248086
G2 X109.614 Y110.374 I.937 J1.475 E.00864
; LINE_WIDTH: 0.2031
G2 X109.51 Y110.632 I1.503 J.755 E.00206
; LINE_WIDTH: 0.165954
G1 X109.48 Y110.783 E.0009
; LINE_WIDTH: 0.129099
G2 X109.442 Y110.993 I1.946 J.464 E.00094
; LINE_WIDTH: 0.0896488
G1 X109.426 Y111.309 E.00088
M204 S10000
G1 X109.426 Y124.491 F42000
; LINE_WIDTH: 0.0896514
G1 F1997
M204 S6000
G1 X109.442 Y124.807 E.00088
; LINE_WIDTH: 0.129095
G2 X109.48 Y125.017 I1.985 J-.254 E.00094
; LINE_WIDTH: 0.165949
G1 X109.51 Y125.168 E.0009
; LINE_WIDTH: 0.203115
G2 X109.614 Y125.426 I1.609 J-.498 E.00206
; LINE_WIDTH: 0.248083
G2 X110.236 Y126.111 I1.559 J-.791 E.00864
; LINE_WIDTH: 0.215733
G2 X110.598 Y126.278 I1.131 J-1.967 E.00316
; LINE_WIDTH: 0.16888
G2 X110.783 Y126.32 I.261 J-.735 E.00114
; LINE_WIDTH: 0.135838
G1 X110.933 Y126.35 E.00072
; LINE_WIDTH: 0.0932293
G2 X111.309 Y126.374 I.315 J-1.978 E.0011
; WIPE_START
G1 F15000
G1 X110.933 Y126.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.112 Y119.962 Z5.1 F42000
G1 X117.03 Y117.03 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1997
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.622 I2.271 J.864 E.03332
G1 X117.03 Y116.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.779 Y116.694 E-.14104
G1 X115.882 Y116.528 E-.07441
G1 X115.897 Y116.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G3 X117.963 Y115.461 I.899 J2.876 E.01438
G3 X118.714 Y115.6 I-.146 J2.89 E.01244
G1 X117.151 Y115.598 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16204
G1 X117.963 Y115.461 E-.15268
G1 X118.431 Y115.519 E-.17922
G1 X118.714 Y115.6 E-.11181
G1 X118.308 Y115.6 E-.15426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.007 J2.243 E.03119
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04962
G1 X119.292 Y115.898 E-.175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.087 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X120.217 Y117.136 E.00085
G3 X120.2 Y118.711 I-2.389 J.761 E.02601
G1 X120.2 Y117.147 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X120.217 Y117.136 E-.00775
G1 X120.322 Y117.607 E-.18348
G1 X120.338 Y117.999 E-.14892
G1 X120.292 Y118.383 E-.14678
G1 X120.2 Y118.711 E-.12951
G1 X120.2 Y118.333 E-.14356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.149 Y118.845 E.00131
G3 X118.77 Y120.178 I-2.255 J-.955 E.032
G1 X118.77 Y118.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.149 Y118.845 E-.03075
G1 X119.964 Y119.201 E-.15257
G1 X119.9 Y119.288 E-.04085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.341 E.02587
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59507
G1 X118.287 Y120.304 E-.16493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.894 J-2.304 E.03328
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.824 Y120.09 E-.08494
G1 X116.569 Y119.945 E-.11152
G1 X116.51 Y119.901 E-.02816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.089 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1997
M204 S5000
G1 X115.6 Y118.71 E.02632
G3 X115.581 Y117.146 I2.354 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59427
G1 X115.491 Y118.287 E-.16573
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 48/53
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.1 I.761 J.95 P1  F42000
G1 X125.664 Y110.142 Z5.1
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X125.876 Y110.401 E.00544
G3 X126.167 Y111.353 I-1.437 J.96 E.01639
G1 X126.167 Y124.447 E.21262
G3 X124.447 Y126.167 I-1.728 J-.008 E.04383
G1 X111.353 Y126.167 E.21262
G3 X109.633 Y124.447 I.008 J-1.728 E.04383
G1 X109.633 Y111.353 E.21262
G3 X111.353 Y109.633 I1.728 J.008 E.04383
G1 X124.447 Y109.633 E.21262
G3 X125.621 Y110.1 I-.008 J1.728 E.02102
; WIPE_START
G1 F3600
M204 S6000
G1 X125.876 Y110.401 E-.14991
G1 X126.037 Y110.701 E-.12898
G1 X126.135 Y111.026 E-.129
G1 X126.167 Y111.353 E-.12505
G1 X126.167 Y111.951 E-.22706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.687 Y119.568 Z5.2 F42000
G1 X125.245 Y126.6 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X125.243 Y126.6 E.00002
G3 X124.896 Y126.634 I-.343 J-1.699 E.00567
G1 X110.904 Y126.634 E.22721
G3 X109.166 Y124.896 I-.005 J-1.734 E.04436
G1 X109.166 Y110.904 E.22721
G3 X110.904 Y109.166 I1.734 J-.005 E.04436
G1 X124.896 Y109.166 E.22721
G1 X125.236 Y109.199 E.00554
G1 X125.243 Y109.2 E.00013
G3 X126.634 Y110.904 I-.367 J1.719 E.03859
G1 X126.634 Y124.896 E.22721
G3 X125.567 Y126.501 I-1.734 J.005 E.03319
G1 X125.302 Y126.582 E.0045
; WIPE_START
G1 F3600
M204 S6000
G1 X125.243 Y126.6 E-.02323
G1 X124.896 Y126.634 E-.13254
G1 X123.306 Y126.634 E-.60423
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
G1 X124.437 Y126.402 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0929516
G1 F2007
M204 S6000
G1 X124.819 Y126.383 E.00112
; LINE_WIDTH: 0.136475
G2 X125.035 Y126.344 I-.261 J-2.049 E.00103
; LINE_WIDTH: 0.174025
G1 X125.186 Y126.314 E.00096
; LINE_WIDTH: 0.211823
G2 X125.446 Y126.209 I-.521 J-1.663 E.00217
; LINE_WIDTH: 0.256916
G2 X126.145 Y125.565 I-.675 J-1.435 E.00926
; LINE_WIDTH: 0.223469
G2 X126.303 Y125.219 I-1.679 J-.974 E.00314
; LINE_WIDTH: 0.176816
G2 X126.344 Y125.035 I-.711 J-.254 E.00119
; LINE_WIDTH: 0.143737
M73 P95 R1
G1 X126.374 Y124.883 E.00077
; LINE_WIDTH: 0.120389
G1 X126.382 Y124.828 E.00023
; LINE_WIDTH: 0.0933589
G2 X126.402 Y124.437 I-3.956 J-.395 E.00115
M204 S10000
G1 X126.402 Y111.363 F42000
; LINE_WIDTH: 0.0933661
G1 F2007
M204 S6000
G2 X126.382 Y110.972 I-3.976 J.004 E.00115
; LINE_WIDTH: 0.120394
G1 X126.374 Y110.917 E.00023
; LINE_WIDTH: 0.143741
G1 X126.344 Y110.765 E.00077
; LINE_WIDTH: 0.17683
G2 X126.303 Y110.581 I-.752 J.07 E.00119
; LINE_WIDTH: 0.223458
G2 X126.145 Y110.235 I-1.839 J.629 E.00314
; LINE_WIDTH: 0.256919
G2 X125.446 Y109.591 I-1.374 J.791 E.00926
; LINE_WIDTH: 0.211834
G2 X125.186 Y109.486 I-.78 J1.559 E.00217
; LINE_WIDTH: 0.174026
G1 X125.035 Y109.456 E.00096
; LINE_WIDTH: 0.136472
G2 X124.819 Y109.417 I-.476 J2.008 E.00103
; LINE_WIDTH: 0.0929444
G1 X124.437 Y109.398 E.00112
M204 S10000
G1 X111.363 Y109.398 F42000
; LINE_WIDTH: 0.0933661
G1 F2007
M204 S6000
G2 X110.972 Y109.418 I.004 J3.976 E.00115
; LINE_WIDTH: 0.120394
G1 X110.917 Y109.426 E.00023
; LINE_WIDTH: 0.143741
G1 X110.765 Y109.456 E.00077
; LINE_WIDTH: 0.17683
G2 X110.581 Y109.497 I.07 J.752 E.00119
; LINE_WIDTH: 0.223458
G2 X110.235 Y109.655 I.629 J1.839 E.00314
; LINE_WIDTH: 0.256919
G2 X109.591 Y110.354 I.791 J1.374 E.00926
; LINE_WIDTH: 0.211836
G2 X109.486 Y110.614 I1.552 J.777 E.00217
; LINE_WIDTH: 0.174012
G1 X109.456 Y110.765 E.00096
; LINE_WIDTH: 0.136469
G2 X109.417 Y110.981 I2.006 J.476 E.00103
; LINE_WIDTH: 0.0929444
G1 X109.398 Y111.363 E.00112
M204 S10000
G1 X109.398 Y124.437 F42000
; LINE_WIDTH: 0.0929516
G1 F2007
M204 S6000
G1 X109.417 Y124.819 E.00112
; LINE_WIDTH: 0.136475
G2 X109.456 Y125.035 I2.049 J-.261 E.00103
; LINE_WIDTH: 0.174025
G1 X109.486 Y125.186 E.00096
; LINE_WIDTH: 0.211823
G2 X109.591 Y125.446 I1.663 J-.521 E.00217
; LINE_WIDTH: 0.256916
G2 X110.235 Y126.145 I1.435 J-.675 E.00926
; LINE_WIDTH: 0.223469
G2 X110.581 Y126.303 I.974 J-1.679 E.00314
; LINE_WIDTH: 0.176816
G2 X110.765 Y126.344 I.254 J-.711 E.00119
; LINE_WIDTH: 0.143737
G1 X110.917 Y126.374 E.00077
; LINE_WIDTH: 0.120389
G1 X110.972 Y126.382 E.00023
; LINE_WIDTH: 0.0933589
G2 X111.363 Y126.402 I.395 J-3.956 E.00115
; WIPE_START
G1 F15000
G1 X110.972 Y126.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.121 Y119.976 Z5.2 F42000
G1 X117.03 Y117.03 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2007
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.621 I2.29 J.881 E.03332
G1 X117.03 Y116.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.732 Y116.78 E-.10407
G1 X115.883 Y116.528 E-.11147
G1 X115.897 Y116.51 E-.00862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.089 Y115.599 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G3 X117.96 Y115.461 I.858 J2.596 E.01439
G3 X118.714 Y115.6 I-.141 J2.879 E.01248
G1 X117.149 Y115.599 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X117.559 Y115.484 E-.16208
G1 X117.96 Y115.461 E-.15262
G1 X118.431 Y115.519 E-.18011
G1 X118.714 Y115.6 E-.11186
G1 X118.31 Y115.6 E-.15333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-.993 J2.23 E.0312
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04965
G1 X119.292 Y115.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.091 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X120.25 Y117.243 E.0026
G3 X120.2 Y118.713 I-2.438 J.654 E.02423
G1 X120.2 Y117.151 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X120.25 Y117.243 E-.03977
G1 X120.331 Y117.695 E-.17431
G1 X120.338 Y117.999 E-.11576
G1 X120.311 Y118.273 E-.10449
G1 X120.2 Y118.713 E-.17256
G1 X120.2 Y118.31 E-.1531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.00289
G3 X118.77 Y120.179 I-2.225 J-1.05 E.03043
G1 X118.77 Y118.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.11 Y118.934 E-.06753
G1 X119.899 Y119.288 E-.15664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.092 Y120.2 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X118.711 Y120.201 E.0263
G3 X117.149 Y120.219 I-.808 J-2.371 E.0258
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.59379
G1 X118.333 Y120.301 E-.14873
G1 X118.287 Y120.305 E-.01749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X117.03 Y120.178 E.02287
G3 X115.621 Y118.77 I.878 J-2.288 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53565
G1 X116.824 Y120.09 E-.085
G1 X116.569 Y119.945 E-.11145
G1 X116.512 Y119.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X115.6 Y118.709 E.02629
G3 X115.581 Y117.147 I2.308 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.709 E-.59381
G1 X115.508 Y118.38 E-.12993
G1 X115.496 Y118.285 E-.03626
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 49/53
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.762 J.949 P1  F42000
G1 X125.675 Y110.117 Z5.2
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X125.68 Y110.12 E.00009
G3 X126.189 Y111.343 I-1.231 J1.231 E.02207
G1 X126.189 Y124.457 E.21293
G3 X124.457 Y126.189 I-1.74 J-.008 E.04414
G1 X111.343 Y126.189 E.21293
G3 X109.611 Y124.457 I.008 J-1.74 E.04414
G1 X109.611 Y111.343 E.21293
G3 X111.343 Y109.611 I1.74 J.008 E.04414
G1 X124.457 Y109.611 E.21293
G3 X125.415 Y109.904 I-.008 J1.74 E.01651
G1 X125.629 Y110.079 E.00449
; WIPE_START
G1 F3600
M204 S6000
G1 X125.68 Y110.12 E-.02486
G1 X125.896 Y110.385 E-.12991
G1 X126.058 Y110.686 E-.12991
G1 X126.157 Y111.013 E-.12992
G1 X126.189 Y111.343 E-.12595
G1 X126.189 Y111.921 E-.21945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.709 Y119.538 Z5.3 F42000
G1 X125.263 Y126.628 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G3 X124.913 Y126.663 I-.345 J-1.71 E.00571
G1 X110.887 Y126.663 E.22776
G3 X109.137 Y124.913 I-.005 J-1.745 E.04465
G1 X109.137 Y110.887 E.22776
G3 X110.887 Y109.137 I1.745 J-.005 E.04465
G1 X124.913 Y109.137 E.22776
G1 X125.26 Y109.172 E.00566
G1 X125.263 Y109.172 E.00004
G3 X126.663 Y110.887 I-.369 J1.73 E.03884
G1 X126.663 Y124.913 E.22776
G3 X125.321 Y126.615 I-1.745 J.005 E.03797
; WIPE_START
G1 F3600
M204 S6000
G1 X124.913 Y126.663 E-.15602
G1 X123.324 Y126.663 E-.60398
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
G1 X123.324 Y126.426 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0822724
G1 F2560
M204 S6000
G1 X111.333 Y126.426 E.02971
G1 X110.968 Y126.408 E.00091
; LINE_WIDTH: 0.14384
G3 X110.747 Y126.368 I.266 J-2.1 E.00112
; LINE_WIDTH: 0.182076
G1 X110.595 Y126.338 E.00102
; LINE_WIDTH: 0.197768
G1 X110.565 Y126.328 E.00023
; LINE_WIDTH: 0.223473
G1 X110.334 Y126.232 E.00205
; LINE_WIDTH: 0.266118
G3 X109.631 Y125.584 I.68 J-1.444 E.00968
; LINE_WIDTH: 0.232026
G3 X109.472 Y125.235 I1.691 J-.98 E.00329
; LINE_WIDTH: 0.184752
G3 X109.432 Y125.053 I.689 J-.248 E.00125
; LINE_WIDTH: 0.151643
G1 X109.402 Y124.9 E.00082
; LINE_WIDTH: 0.127667
G1 X109.393 Y124.841 E.00026
; LINE_WIDTH: 0.081817
G3 X109.374 Y124.47 I3.778 J-.377 E.00091
G1 X109.374 Y111.33 E.03231
; LINE_WIDTH: 0.0992509
G1 X109.392 Y110.968 E.00115
; LINE_WIDTH: 0.14384
G3 X109.432 Y110.747 I2.1 J.266 E.00112
; LINE_WIDTH: 0.182076
G1 X109.462 Y110.595 E.00102
; LINE_WIDTH: 0.197768
G1 X109.472 Y110.565 E.00023
; LINE_WIDTH: 0.223473
G1 X109.568 Y110.334 E.00205
; LINE_WIDTH: 0.266118
G3 X110.216 Y109.631 I1.444 J.68 E.00968
; LINE_WIDTH: 0.232026
G3 X110.565 Y109.472 I.98 J1.691 E.00329
; LINE_WIDTH: 0.184752
G3 X110.747 Y109.432 I.248 J.689 E.00125
; LINE_WIDTH: 0.151643
G1 X110.9 Y109.402 E.00082
; LINE_WIDTH: 0.127667
G1 X110.959 Y109.393 E.00026
; LINE_WIDTH: 0.0822724
G3 X111.33 Y109.374 I.377 J3.778 E.00092
G1 X124.467 Y109.374 E.03255
G1 X124.832 Y109.392 E.00091
; LINE_WIDTH: 0.143842
G3 X125.053 Y109.432 I-.266 J2.1 E.00112
; LINE_WIDTH: 0.182084
G1 X125.205 Y109.462 E.00102
; LINE_WIDTH: 0.19777
G1 X125.235 Y109.472 E.00023
; LINE_WIDTH: 0.223476
G1 X125.466 Y109.568 E.00205
; LINE_WIDTH: 0.266116
G3 X126.169 Y110.216 I-.68 J1.444 E.00968
; LINE_WIDTH: 0.232026
G3 X126.328 Y110.565 I-1.691 J.98 E.00329
; LINE_WIDTH: 0.184752
G3 X126.368 Y110.747 I-.689 J.248 E.00125
; LINE_WIDTH: 0.151643
G1 X126.398 Y110.9 E.00082
; LINE_WIDTH: 0.127667
G1 X126.407 Y110.959 E.00026
; LINE_WIDTH: 0.0822724
G3 X126.426 Y111.33 I-3.778 J.377 E.00092
G1 X126.426 Y124.467 E.03255
G1 X126.408 Y124.832 E.00091
; LINE_WIDTH: 0.14384
G3 X126.368 Y125.053 I-2.1 J-.266 E.00112
; LINE_WIDTH: 0.182076
G1 X126.338 Y125.205 E.00102
; LINE_WIDTH: 0.197768
G1 X126.328 Y125.235 E.00023
; LINE_WIDTH: 0.223473
G1 X126.232 Y125.466 E.00205
; LINE_WIDTH: 0.266118
G3 X125.584 Y126.169 I-1.444 J-.68 E.00968
; LINE_WIDTH: 0.232026
G3 X125.235 Y126.328 I-.98 J-1.691 E.00329
; LINE_WIDTH: 0.184752
G3 X125.053 Y126.368 I-.248 J-.689 E.00125
; LINE_WIDTH: 0.151643
G1 X124.9 Y126.398 E.00082
; LINE_WIDTH: 0.127667
G1 X124.841 Y126.407 E.00026
; LINE_WIDTH: 0.0822724
G3 X124.47 Y126.426 I-.377 J-3.778 E.00092
G1 X123.384 Y126.426 E.00269
; WIPE_START
G1 F15000
G1 X121.384 Y126.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.175 Y119.501 Z5.3 F42000
G1 X117.03 Y117.03 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2560
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.336 J.927 E.03326
G1 X117.03 Y116.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53559
G1 X115.827 Y116.613 E-.17677
G1 X115.898 Y116.509 E-.04764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G3 X118.144 Y115.472 I.854 J2.681 E.01732
G3 X118.708 Y115.6 I-.607 J3.995 E.0094
G1 X117.151 Y115.598 E.02528
; WIPE_START
G1 F3600
M204 S6000
G1 X117.562 Y115.484 E-.16179
G1 X117.754 Y115.465 E-.07353
G1 X118.144 Y115.472 E-.14823
G1 X118.429 Y115.518 E-.10979
G1 X118.708 Y115.6 E-.11047
G1 X118.297 Y115.599 E-.15618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X118.77 Y115.622 E.02287
G1 X118.802 Y115.633 E.00055
G3 X120.179 Y117.03 I-.916 J2.279 E.03277
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53565
G1 X118.802 Y115.633 E-.01286
G1 X118.985 Y115.715 E-.07638
G1 X119.291 Y115.897 E-.1351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X120.246 Y117.23 E.00239
G3 X120.2 Y118.71 I-2.426 J.666 E.02442
G1 X120.2 Y117.15 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03489
G1 X120.331 Y117.697 E-.1805
G1 X120.338 Y117.999 E-.11483
G1 X120.311 Y118.275 E-.10543
G1 X120.2 Y118.71 E-.17067
G1 X120.2 Y118.306 E-.15368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
M73 P96 R0
G1 X120.178 Y118.77 E.02287
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.178 I-2.276 J-1.107 E.03038
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53559
G1 X120.11 Y118.934 E-.06748
G1 X119.899 Y119.289 E-.15693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.617 Y120.232 E.00157
G3 X117.143 Y120.219 I-.716 J-2.342 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59479
G1 X118.617 Y120.232 E-.03685
G1 X118.287 Y120.306 E-.12836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.874 J-2.284 E.03331
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.815 Y120.085 E-.08911
G1 X116.508 Y119.902 E-.13552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2560
M204 S5000
G1 X115.6 Y118.71 E.02631
G3 X115.581 Y117.146 I2.317 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59417
G1 X115.491 Y118.287 E-.16583
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 50/53
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.3 I.762 J.949 P1  F42000
G1 X125.693 Y110.098 Z5.3
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X125.698 Y110.102 E.0001
G3 X126.211 Y111.334 I-1.239 J1.239 E.02222
G1 X126.211 Y124.466 E.21325
G3 X124.466 Y126.211 I-1.753 J-.008 E.04445
G1 X111.334 Y126.211 E.21325
G3 X109.589 Y124.466 I.008 J-1.753 E.04445
G1 X109.589 Y111.334 E.21325
G3 X111.334 Y109.589 I1.753 J.008 E.04445
G1 X124.466 Y109.589 E.21325
G3 X125.432 Y109.884 I-.008 J1.753 E.01663
G1 X125.647 Y110.06 E.00451
; WIPE_START
G1 F3600
M204 S6000
G1 X125.698 Y110.102 E-.02518
G1 X125.916 Y110.368 E-.13082
G1 X126.079 Y110.672 E-.13082
G1 X126.179 Y111.001 E-.13083
G1 X126.211 Y111.334 E-.12685
G1 X126.211 Y111.901 E-.21549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.73 Y119.518 Z5.4 F42000
G1 X125.279 Y126.657 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X124.93 Y126.691 E.00569
G1 X110.87 Y126.691 E.22832
G3 X109.109 Y124.93 I-.005 J-1.756 E.04494
G1 X109.109 Y110.87 E.22832
G3 X110.87 Y109.109 I1.756 J-.005 E.04494
G1 X124.93 Y109.109 E.22832
G1 X125.282 Y109.144 E.00574
G3 X126.691 Y110.87 I-.372 J1.742 E.03909
G1 X126.691 Y124.93 E.22832
G3 X125.338 Y126.644 I-1.756 J.005 E.03827
; WIPE_START
G1 F3600
M204 S6000
G1 X124.93 Y126.691 E-.15578
G1 X123.34 Y126.691 E-.60422
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
G1 X123.34 Y126.451 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0886616
G1 F2567
M204 S6000
G1 X111.323 Y126.451 E.0329
G3 X110.946 Y126.432 I2.936 J-62.197 E.00104
; LINE_WIDTH: 0.152432
G3 X110.73 Y126.392 I.298 J-2.221 E.00117
; LINE_WIDTH: 0.190147
G1 X110.577 Y126.362 E.00107
; LINE_WIDTH: 0.205989
G1 X110.549 Y126.352 E.00022
; LINE_WIDTH: 0.232033
G1 X110.315 Y126.256 E.00217
; LINE_WIDTH: 0.275288
G3 X109.607 Y125.603 I.685 J-1.453 E.01011
; LINE_WIDTH: 0.240582
G3 X109.448 Y125.251 I1.702 J-.985 E.00345
; LINE_WIDTH: 0.192691
G3 X109.408 Y125.07 I.661 J-.241 E.0013
; LINE_WIDTH: 0.159546
G1 X109.377 Y124.917 E.00088
; LINE_WIDTH: 0.134933
G1 X109.368 Y124.854 E.00029
; LINE_WIDTH: 0.0881747
G3 X109.349 Y124.48 I3.77 J-.378 E.00102
G1 X109.349 Y111.32 E.03577
; LINE_WIDTH: 0.106238
G3 X109.368 Y110.946 I3.789 J.004 E.0013
; LINE_WIDTH: 0.152432
G3 X109.408 Y110.73 I2.221 J.298 E.00117
; LINE_WIDTH: 0.190147
G1 X109.438 Y110.577 E.00107
; LINE_WIDTH: 0.205989
G1 X109.448 Y110.549 E.00022
; LINE_WIDTH: 0.232033
G1 X109.544 Y110.315 E.00217
; LINE_WIDTH: 0.275288
G3 X110.197 Y109.607 I1.453 J.685 E.01011
; LINE_WIDTH: 0.240582
G3 X110.549 Y109.448 I.985 J1.702 E.00345
; LINE_WIDTH: 0.192691
G3 X110.73 Y109.408 I.241 J.661 E.0013
; LINE_WIDTH: 0.159546
G1 X110.883 Y109.377 E.00088
; LINE_WIDTH: 0.134933
G1 X110.946 Y109.368 E.00029
; LINE_WIDTH: 0.0886616
G3 X111.32 Y109.349 I.378 J3.77 E.00103
G1 X124.477 Y109.349 E.03602
G3 X124.854 Y109.368 I-2.936 J62.197 E.00104
; LINE_WIDTH: 0.152431
G3 X125.07 Y109.408 I-.298 J2.221 E.00117
; LINE_WIDTH: 0.190142
G1 X125.223 Y109.438 E.00107
; LINE_WIDTH: 0.205988
G1 X125.251 Y109.448 E.00022
; LINE_WIDTH: 0.232032
G1 X125.485 Y109.544 E.00217
; LINE_WIDTH: 0.27529
G3 X126.193 Y110.197 I-.685 J1.453 E.01011
; LINE_WIDTH: 0.240582
G3 X126.352 Y110.549 I-1.702 J.985 E.00345
; LINE_WIDTH: 0.192691
G3 X126.392 Y110.73 I-.661 J.241 E.0013
; LINE_WIDTH: 0.159546
G1 X126.423 Y110.883 E.00088
; LINE_WIDTH: 0.134933
G1 X126.432 Y110.946 E.00029
; LINE_WIDTH: 0.0886616
G3 X126.451 Y111.32 I-3.77 J.378 E.00103
G1 X126.451 Y124.477 E.03602
G3 X126.432 Y124.854 I-62.197 J-2.936 E.00104
; LINE_WIDTH: 0.152432
G3 X126.392 Y125.07 I-2.221 J-.298 E.00117
; LINE_WIDTH: 0.190147
G1 X126.362 Y125.223 E.00107
; LINE_WIDTH: 0.205989
G1 X126.352 Y125.251 E.00022
; LINE_WIDTH: 0.232033
G1 X126.256 Y125.485 E.00217
; LINE_WIDTH: 0.275288
G3 X125.603 Y126.193 I-1.453 J-.685 E.01011
; LINE_WIDTH: 0.240582
G3 X125.251 Y126.352 I-.985 J-1.702 E.00345
; LINE_WIDTH: 0.192691
G3 X125.07 Y126.392 I-.241 J-.661 E.0013
; LINE_WIDTH: 0.159546
G1 X124.917 Y126.423 E.00088
; LINE_WIDTH: 0.134933
G1 X124.854 Y126.432 E.00029
; LINE_WIDTH: 0.0886616
G3 X124.48 Y126.451 I-.378 J-3.77 E.00103
G1 X123.4 Y126.451 E.00296
; WIPE_START
G1 F15000
G1 X121.4 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.188 Y119.527 Z5.4 F42000
G1 X117.03 Y117.03 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2567
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.621 I2.335 J.925 E.03326
G1 X117.03 Y116.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.53565
G1 X115.829 Y116.611 E-.17764
G1 X115.898 Y116.509 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.091 Y115.598 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G3 X118.144 Y115.472 I.854 J2.68 E.01733
G3 X118.714 Y115.6 I-.26 J2.493 E.00949
G1 X117.151 Y115.598 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117.561 Y115.484 E-.16193
G1 X117.755 Y115.465 E-.07374
G1 X118.144 Y115.472 E-.1482
G1 X118.431 Y115.519 E-.11033
G1 X118.714 Y115.6 E-.11173
G1 X118.308 Y115.6 E-.15407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.67 E.00212
G3 X120.179 Y117.03 I-1.034 J2.269 E.03117
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.67 E-.04951
G1 X119.292 Y115.898 E-.17511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X120.246 Y117.23 E.00238
G3 X120.2 Y118.71 I-2.426 J.666 E.02442
G1 X120.2 Y117.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03487
G1 X120.332 Y117.708 E-.18487
G1 X120.338 Y117.999 E-.11048
G1 X120.31 Y118.278 E-.10641
G1 X120.2 Y118.71 E-.16966
G1 X120.2 Y118.306 E-.15371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X120.178 Y118.77 E.02287
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.179 I-2.248 J-1.075 E.03041
G1 X118.77 Y118.83 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X120.178 Y118.77 E-.53564
G1 X120.11 Y118.934 E-.06749
G1 X119.899 Y119.289 E-.15687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X118.711 Y120.201 E.02638
G3 X117.143 Y120.219 I-.811 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.711 Y120.201 E-.5958
G1 X118.326 Y120.302 E-.15142
G1 X118.292 Y120.305 E-.01279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.863 J-2.273 E.03332
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53543
G1 X116.652 Y119.997 E-.15917
G1 X116.508 Y119.903 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2567
M204 S5000
G1 X115.6 Y118.71 E.02631
G3 X115.581 Y117.146 I2.315 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59416
G1 X115.491 Y118.287 E-.16584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 51/53
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.762 J.949 P1  F42000
G1 X125.711 Y110.079 Z5.4
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X125.716 Y110.084 E.00012
G3 X126.233 Y111.324 I-1.248 J1.248 E.02238
G1 X126.233 Y124.476 E.21357
G3 X124.476 Y126.233 I-1.765 J-.008 E.04476
G1 X111.324 Y126.233 E.21357
G3 X109.567 Y124.476 I.008 J-1.765 E.04476
G1 X109.567 Y111.324 E.21357
G3 X111.324 Y109.567 I1.765 J.008 E.04476
G1 X124.476 Y109.567 E.21357
G3 X125.448 Y109.864 I-.008 J1.765 E.01674
G1 X125.664 Y110.041 E.00454
; WIPE_START
G1 F3600
M204 S6000
G1 X125.716 Y110.084 E-.02553
G1 X125.936 Y110.352 E-.13175
G1 X126.1 Y110.657 E-.13171
G1 X126.2 Y110.989 E-.13173
G1 X126.233 Y111.324 E-.12777
G1 X126.233 Y111.88 E-.21151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.751 Y119.498 Z5.5 F42000
G1 X125.295 Y126.685 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X124.947 Y126.719 E.00568
G1 X110.853 Y126.719 E.22887
G3 X109.081 Y124.947 I-.004 J-1.768 E.04523
G1 X109.081 Y110.853 E.22887
G3 X110.853 Y109.081 I1.768 J-.004 E.04523
G1 X124.947 Y109.081 E.22887
G1 X125.289 Y109.114 E.00557
G3 X126.719 Y110.853 I-.359 J1.753 E.03954
G1 X126.719 Y124.947 E.22887
G3 X125.354 Y126.673 I-1.768 J.004 E.03857
; WIPE_START
G1 F3600
M204 S6000
G1 X124.947 Y126.719 E-.1555
G1 X123.356 Y126.719 E-.6045
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
G1 X123.356 Y126.476 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0950087
G1 F2572
M204 S6000
G1 X111.314 Y126.476 E.03609
G1 X110.943 Y126.458 E.00111
; LINE_WIDTH: 0.140688
G1 X110.866 Y126.447 E.00038
; LINE_WIDTH: 0.167437
G1 X110.712 Y126.417 E.00093
; LINE_WIDTH: 0.198192
G1 X110.558 Y126.386 E.00113
; LINE_WIDTH: 0.22556
G3 X110.414 Y126.328 I.349 J-1.079 E.0013
; LINE_WIDTH: 0.253156
G1 X110.295 Y126.279 E.00121
; LINE_WIDTH: 0.284917
G3 X109.596 Y125.642 I.814 J-1.596 E.01028
; LINE_WIDTH: 0.260175
G3 X109.472 Y125.386 I1.572 J-.919 E.00276
; LINE_WIDTH: 0.228019
G1 X109.423 Y125.268 E.00108
; LINE_WIDTH: 0.200599
G3 X109.383 Y125.088 I.643 J-.235 E.00135
; LINE_WIDTH: 0.167437
G1 X109.353 Y124.934 E.00093
; LINE_WIDTH: 0.142219
G1 X109.343 Y124.867 E.00033
; LINE_WIDTH: 0.0945427
G3 X109.324 Y124.49 I3.839 J-.383 E.00113
G1 X109.324 Y111.31 E.03925
; LINE_WIDTH: 0.112212
G1 X109.342 Y110.943 E.00136
; LINE_WIDTH: 0.140688
G1 X109.353 Y110.866 E.00038
; LINE_WIDTH: 0.167437
G1 X109.383 Y110.712 E.00093
; LINE_WIDTH: 0.198192
G1 X109.414 Y110.558 E.00113
; LINE_WIDTH: 0.225558
G3 X109.472 Y110.414 I1.079 J.349 E.0013
; LINE_WIDTH: 0.253148
G1 X109.521 Y110.295 E.00121
; LINE_WIDTH: 0.284914
G3 X110.158 Y109.596 I1.596 J.814 E.01028
; LINE_WIDTH: 0.260175
G3 X110.414 Y109.472 I.919 J1.573 E.00276
; LINE_WIDTH: 0.228019
G1 X110.532 Y109.423 E.00108
; LINE_WIDTH: 0.200599
G3 X110.712 Y109.383 I.235 J.643 E.00135
; LINE_WIDTH: 0.167437
G1 X110.866 Y109.353 E.00093
; LINE_WIDTH: 0.142219
G1 X110.933 Y109.343 E.00033
; LINE_WIDTH: 0.0950369
G3 X111.31 Y109.324 I.383 J3.839 E.00113
G1 X124.486 Y109.324 E.0395
G3 X124.867 Y109.343 I-2.826 J59.974 E.00114
; LINE_WIDTH: 0.159299
G3 X125.082 Y109.382 I-.294 J2.207 E.00123
; LINE_WIDTH: 0.196528
G1 X125.231 Y109.412 E.00108
; LINE_WIDTH: 0.223166
G3 X125.387 Y109.473 I-.307 J1.016 E.00138
; LINE_WIDTH: 0.252677
G1 X125.506 Y109.522 E.00122
; LINE_WIDTH: 0.284951
G3 X126.204 Y110.158 I-.815 J1.595 E.01026
; LINE_WIDTH: 0.260175
G3 X126.328 Y110.414 I-1.573 J.919 E.00276
; LINE_WIDTH: 0.228019
G1 X126.377 Y110.532 E.00108
; LINE_WIDTH: 0.200599
G3 X126.417 Y110.712 I-.643 J.235 E.00135
; LINE_WIDTH: 0.167437
G1 X126.447 Y110.866 E.00093
; LINE_WIDTH: 0.142219
G1 X126.457 Y110.933 E.00033
; LINE_WIDTH: 0.0950087
G3 X126.476 Y111.31 I-3.839 J.383 E.00113
G1 X126.476 Y124.486 E.03948
G1 X126.458 Y124.857 E.00111
; LINE_WIDTH: 0.140688
G1 X126.447 Y124.934 E.00038
; LINE_WIDTH: 0.167437
G1 X126.417 Y125.088 E.00093
; LINE_WIDTH: 0.198192
G1 X126.386 Y125.242 E.00113
; LINE_WIDTH: 0.225558
G3 X126.328 Y125.386 I-1.079 J-.349 E.0013
; LINE_WIDTH: 0.253148
G1 X126.279 Y125.505 E.00121
; LINE_WIDTH: 0.284914
G3 X125.642 Y126.204 I-1.596 J-.814 E.01028
; LINE_WIDTH: 0.260175
G3 X125.386 Y126.328 I-.919 J-1.573 E.00276
; LINE_WIDTH: 0.228019
G1 X125.268 Y126.377 E.00108
; LINE_WIDTH: 0.200599
G3 X125.088 Y126.417 I-.235 J-.643 E.00135
; LINE_WIDTH: 0.167437
G1 X124.934 Y126.447 E.00093
; LINE_WIDTH: 0.142219
G1 X124.867 Y126.457 E.00033
; LINE_WIDTH: 0.0950087
G3 X124.49 Y126.476 I-.383 J-3.839 E.00113
G1 X123.416 Y126.476 E.00322
; WIPE_START
G1 F15000
G1 X121.416 Y126.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.202 Y119.554 Z5.5 F42000
G1 X117.03 Y117.03 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2572
M204 S5000
G1 X115.622 Y117.03 E.02287
G3 X117.03 Y115.622 I2.272 J.864 E.03332
G1 X117.03 Y116.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.622 Y117.03 E-.5357
G1 X115.779 Y116.694 E-.14093
G1 X115.883 Y116.527 E-.07465
G1 X115.898 Y116.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.092 Y115.6 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G3 X118.144 Y115.472 I.851 J2.611 E.01732
M73 P97 R0
G3 X118.714 Y115.6 I-.318 J2.756 E.0095
G1 X117.152 Y115.6 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X117.371 Y115.518 E-.08859
G1 X117.562 Y115.484 E-.07375
G1 X117.755 Y115.465 E-.0737
G1 X118.144 Y115.472 E-.14811
G1 X118.429 Y115.518 E-.10971
G1 X118.714 Y115.6 E-.11256
G1 X118.31 Y115.6 E-.15359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.008 J2.245 E.0312
G1 X118.83 Y117.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53542
G1 X118.891 Y115.671 E-.0496
G1 X119.291 Y115.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X120.246 Y117.23 E.00238
G3 X120.2 Y118.71 I-2.424 J.666 E.02441
G1 X120.2 Y117.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03488
G1 X120.332 Y117.702 E-.18243
G1 X120.338 Y117.999 E-.11292
G1 X120.31 Y118.28 E-.10737
G1 X120.2 Y118.71 E-.16853
G1 X120.2 Y118.305 E-.15387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.178 I-2.219 J-1.047 E.03042
G1 X118.77 Y118.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53583
G1 X120.11 Y118.934 E-.06745
G1 X119.899 Y119.288 E-.15672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X118.709 Y120.202 E.02635
G3 X117.143 Y120.219 I-.809 J-2.307 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.709 Y120.202 E-.59513
G1 X118.328 Y120.302 E-.14977
G1 X118.288 Y120.305 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.863 J-2.272 E.03332
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.658 Y120 E-.15679
G1 X116.508 Y119.903 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2572
M204 S5000
G1 X115.6 Y118.71 E.02631
G3 X115.581 Y117.147 I2.31 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59409
G1 X115.508 Y118.38 E-.13018
G1 X115.497 Y118.287 E-.03572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 52/53
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.5 I.763 J.948 P1  F42000
G1 X125.728 Y110.06 Z5.5
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X125.735 Y110.065 E.00013
G3 X126.255 Y111.314 I-1.256 J1.257 E.02254
G1 X126.255 Y124.486 E.21388
G3 X124.486 Y126.255 I-1.777 J-.008 E.04507
G1 X111.314 Y126.255 E.21388
G3 X109.545 Y124.486 I.008 J-1.777 E.04507
G1 X109.545 Y111.314 E.21388
G3 X111.314 Y109.545 I1.777 J.008 E.04507
G1 X124.486 Y109.545 E.21388
G3 X125.465 Y109.844 I-.008 J1.777 E.01686
G1 X125.682 Y110.022 E.00456
; WIPE_START
G1 F3600
M204 S6000
G1 X125.735 Y110.065 E-.02589
G1 X125.956 Y110.335 E-.13266
G1 X126.121 Y110.643 E-.13257
G1 X126.222 Y110.977 E-.13265
G1 X126.255 Y111.314 E-.12871
G1 X126.255 Y111.86 E-.20752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.771 Y119.477 Z5.6 F42000
G1 X125.311 Y126.713 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X124.964 Y126.748 E.00566
G1 X110.836 Y126.748 E.22942
G3 X109.052 Y124.964 I-.005 J-1.779 E.04552
G1 X109.052 Y110.836 E.22942
G3 X110.836 Y109.052 I1.779 J-.005 E.04552
G1 X124.964 Y109.052 E.22942
G1 X125.313 Y109.087 E.00569
G3 X126.748 Y110.836 I-.367 J1.764 E.03971
G1 X126.748 Y124.964 E.22942
G3 X125.37 Y126.702 I-1.779 J.005 E.03888
; WIPE_START
G1 F3600
M204 S6000
G1 X124.964 Y126.748 E-.15501
G1 X123.372 Y126.748 E-.60499
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
G1 X123.372 Y126.501 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101373
G1 F2578
M204 S6000
G1 X111.304 Y126.501 E.03929
G1 X110.931 Y126.483 E.00122
; LINE_WIDTH: 0.147885
G1 X110.849 Y126.472 E.00042
; LINE_WIDTH: 0.175343
G1 X110.695 Y126.441 E.00099
; LINE_WIDTH: 0.206269
G1 X110.54 Y126.41 E.00119
; LINE_WIDTH: 0.234142
G3 X110.396 Y126.352 I.383 J-1.16 E.00135
; LINE_WIDTH: 0.261916
G1 X110.276 Y126.302 E.00127
; LINE_WIDTH: 0.294132
G3 X109.572 Y125.661 I.82 J-1.606 E.0107
; LINE_WIDTH: 0.268967
G3 X109.448 Y125.404 I1.563 J-.915 E.00288
; LINE_WIDTH: 0.236435
G1 X109.398 Y125.284 E.00114
; LINE_WIDTH: 0.208545
G1 X109.359 Y125.105 E.0014
; LINE_WIDTH: 0.175353
G1 X109.328 Y124.951 E.00099
; LINE_WIDTH: 0.149504
G1 X109.318 Y124.881 E.00037
; LINE_WIDTH: 0.100901
G3 X109.299 Y124.5 I3.831 J-.385 E.00123
G1 X109.299 Y111.3 E.04272
; LINE_WIDTH: 0.118698
G1 X109.317 Y110.931 E.00146
; LINE_WIDTH: 0.14789
G1 X109.328 Y110.849 E.00042
; LINE_WIDTH: 0.175342
G1 X109.359 Y110.695 E.00099
; LINE_WIDTH: 0.206265
G1 X109.39 Y110.54 E.00119
; LINE_WIDTH: 0.234135
G3 X109.448 Y110.396 I1.167 J.386 E.00135
; LINE_WIDTH: 0.261913
G1 X109.498 Y110.276 E.00127
; LINE_WIDTH: 0.294132
G3 X110.139 Y109.572 I1.606 J.82 E.0107
; LINE_WIDTH: 0.268967
G3 X110.396 Y109.448 I.915 J1.563 E.00288
; LINE_WIDTH: 0.236435
G1 X110.516 Y109.398 E.00114
; LINE_WIDTH: 0.208545
G1 X110.695 Y109.359 E.0014
; LINE_WIDTH: 0.175353
G1 X110.849 Y109.328 E.00099
; LINE_WIDTH: 0.149504
G1 X110.919 Y109.318 E.00037
; LINE_WIDTH: 0.101373
G3 X111.3 Y109.299 I.385 J3.831 E.00124
G1 X124.496 Y109.299 E.04297
G1 X124.869 Y109.317 E.00122
; LINE_WIDTH: 0.147885
G1 X124.951 Y109.328 E.00042
; LINE_WIDTH: 0.175007
G1 X125.102 Y109.359 E.00097
; LINE_WIDTH: 0.20526
G1 X125.253 Y109.389 E.00116
; LINE_WIDTH: 0.232646
G3 X125.405 Y109.449 I-.333 J1.06 E.0014
; LINE_WIDTH: 0.2616
G1 X125.525 Y109.498 E.00128
; LINE_WIDTH: 0.294155
G3 X126.228 Y110.139 I-.82 J1.605 E.01069
; LINE_WIDTH: 0.268967
G3 X126.352 Y110.396 I-1.563 J.915 E.00288
; LINE_WIDTH: 0.236435
G1 X126.402 Y110.516 E.00114
; LINE_WIDTH: 0.208544
G1 X126.441 Y110.695 E.0014
; LINE_WIDTH: 0.17535
G1 X126.472 Y110.849 E.00099
; LINE_WIDTH: 0.149504
G1 X126.482 Y110.919 E.00037
; LINE_WIDTH: 0.101373
G3 X126.501 Y111.3 I-3.833 J.385 E.00124
G1 X126.501 Y124.496 E.04297
G1 X126.483 Y124.869 E.00122
; LINE_WIDTH: 0.14789
G1 X126.472 Y124.951 E.00042
; LINE_WIDTH: 0.175342
G1 X126.441 Y125.105 E.00099
; LINE_WIDTH: 0.206265
G1 X126.41 Y125.26 E.00119
; LINE_WIDTH: 0.234135
G3 X126.352 Y125.404 I-1.167 J-.386 E.00135
; LINE_WIDTH: 0.261913
G1 X126.302 Y125.524 E.00127
; LINE_WIDTH: 0.294132
G3 X125.661 Y126.228 I-1.606 J-.82 E.0107
; LINE_WIDTH: 0.268967
G3 X125.404 Y126.352 I-.915 J-1.563 E.00288
; LINE_WIDTH: 0.236435
G1 X125.284 Y126.402 E.00114
; LINE_WIDTH: 0.208545
G1 X125.105 Y126.441 E.0014
; LINE_WIDTH: 0.175353
G1 X124.951 Y126.472 E.00099
; LINE_WIDTH: 0.149504
G1 X124.881 Y126.482 E.00037
; LINE_WIDTH: 0.101373
G3 X124.5 Y126.501 I-.385 J-3.831 E.00124
G1 X123.432 Y126.501 E.00348
; WIPE_START
G1 F15000
G1 X121.432 Y126.501 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.215 Y119.58 Z5.6 F42000
G1 X117.03 Y117.03 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2578
M204 S5000
G1 X115.623 Y117.03 E.02285
G3 X117.03 Y115.622 I2.333 J.924 E.03324
G1 X117.03 Y116.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.623 Y117.03 E-.53526
G1 X115.734 Y116.778 E-.1048
G1 X115.883 Y116.528 E-.11051
G1 X115.898 Y116.509 E-.00943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.092 Y115.6 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G3 X118.144 Y115.472 I.809 J2.268 E.01736
G3 X118.714 Y115.6 I-.257 J2.479 E.0095
G1 X117.152 Y115.6 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X117.278 Y115.541 E-.05295
G1 X117.559 Y115.484 E-.10913
G1 X117.755 Y115.465 E-.07456
G1 X118.144 Y115.472 E-.14808
G1 X118.431 Y115.519 E-.11052
G1 X118.714 Y115.6 E-.11164
G1 X118.311 Y115.6 E-.15312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.065 J2.299 E.03114
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.04955
G1 X119.292 Y115.899 E-.17507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X120.247 Y117.233 E.00244
G3 X120.2 Y118.71 I-2.506 J.659 E.02432
G1 X120.2 Y117.15 E.02532
; WIPE_START
G1 F3600
M204 S6000
G1 X120.247 Y117.233 E-.03622
G1 X120.332 Y117.704 E-.18191
G1 X120.338 Y117.997 E-.1112
G1 X120.309 Y118.288 E-.11118
G1 X120.2 Y118.71 E-.16545
G1 X120.2 Y118.304 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X120.177 Y118.77 E.02285
G1 X120.149 Y118.847 E.00133
G3 X118.77 Y120.178 I-2.261 J-.961 E.03197
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
M73 P98 R0
G1 X120.177 Y118.77 E-.53532
G1 X120.149 Y118.847 E-.03116
G1 X119.917 Y119.272 E-.18406
G1 X119.901 Y119.291 E-.00945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.615 Y120.233 E.00161
G3 X117.143 Y120.219 I-.714 J-2.371 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.59478
G1 X118.615 Y120.233 E-.03761
G1 X118.335 Y120.301 E-.10968
G1 X118.287 Y120.305 E-.01793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.875 J-2.285 E.0333
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.821 Y120.088 E-.0863
G1 X116.508 Y119.902 E-.13832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2578
M204 S5000
G1 X115.6 Y118.71 E.02629
G3 X115.581 Y117.147 I2.306 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59376
G1 X115.508 Y118.38 E-.13011
G1 X115.497 Y118.286 E-.03614
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 53/53
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.763 J.948 P1  F42000
G1 X125.746 Y110.041 Z5.6
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X125.753 Y110.047 E.00015
G3 X126.277 Y111.304 I-1.265 J1.265 E.02269
G1 X126.277 Y124.496 E.21421
G3 X124.496 Y126.277 I-1.789 J-.008 E.04538
G1 X111.304 Y126.277 E.2142
G3 X109.523 Y124.496 I.008 J-1.789 E.04538
G1 X109.523 Y111.304 E.21421
G3 X111.304 Y109.523 I1.789 J.008 E.04538
G1 X124.496 Y109.523 E.2142
G3 X125.481 Y109.824 I-.008 J1.789 E.01698
G1 X125.7 Y110.003 E.00458
; WIPE_START
G1 F3600
M204 S6000
G1 X125.753 Y110.047 E-.02628
G1 X125.976 Y110.319 E-.13355
G1 X126.142 Y110.629 E-.13355
G1 X126.244 Y110.965 E-.13355
G1 X126.277 Y111.304 E-.12956
G1 X126.277 Y111.84 E-.20351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.791 Y119.457 Z5.7 F42000
G1 X125.326 Y126.742 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X124.981 Y126.776 E.00563
G1 X110.819 Y126.776 E.22997
G3 X109.024 Y124.981 I-.005 J-1.79 E.04581
G1 X109.024 Y110.819 E.22997
G3 X110.819 Y109.024 I1.79 J-.004 E.04581
G1 X124.981 Y109.024 E.22997
G1 X125.337 Y109.059 E.0058
G3 X126.776 Y110.819 I-.376 J1.775 E.03988
G1 X126.776 Y124.981 E.22997
G3 X125.385 Y126.731 I-1.79 J.004 E.0392
; WIPE_START
G1 F3600
M204 S6000
G1 X124.981 Y126.776 E-.15431
G1 X123.387 Y126.776 E-.60569
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
G1 X123.387 Y126.526 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107736
G1 F2584
M204 S6000
G1 X111.294 Y126.526 E.04251
G1 X110.918 Y126.508 E.00132
; LINE_WIDTH: 0.155069
G1 X110.833 Y126.496 E.00047
; LINE_WIDTH: 0.183235
G1 X110.677 Y126.465 E.00105
; LINE_WIDTH: 0.214306
G1 X110.522 Y126.434 E.00125
; LINE_WIDTH: 0.242671
G3 X110.378 Y126.376 I.446 J-1.31 E.0014
; LINE_WIDTH: 0.270633
G1 X110.256 Y126.326 E.00134
; LINE_WIDTH: 0.30333
G3 X109.549 Y125.681 I.826 J-1.615 E.01112
; LINE_WIDTH: 0.277747
G3 X109.424 Y125.422 I1.554 J-.911 E.003
; LINE_WIDTH: 0.244807
G1 X109.374 Y125.301 E.0012
; LINE_WIDTH: 0.216431
G1 X109.335 Y125.123 E.00144
; LINE_WIDTH: 0.183243
G1 X109.304 Y124.967 E.00105
; LINE_WIDTH: 0.156768
G1 X109.293 Y124.894 E.00041
; LINE_WIDTH: 0.125595
G3 X109.274 Y124.51 I3.888 J-.389 E.00163
G1 X109.274 Y124.506 E.00002
; LINE_WIDTH: 0.107245
G1 X109.274 Y111.294 E.04618
G1 X109.292 Y110.918 E.00131
; LINE_WIDTH: 0.155064
G1 X109.304 Y110.833 E.00047
; LINE_WIDTH: 0.183237
G1 X109.335 Y110.677 E.00105
; LINE_WIDTH: 0.214311
G1 X109.366 Y110.522 E.00125
; LINE_WIDTH: 0.24267
G3 X109.424 Y110.378 I1.316 J.449 E.0014
; LINE_WIDTH: 0.27062
G1 X109.475 Y110.256 E.00134
; LINE_WIDTH: 0.303332
G3 X110.119 Y109.549 I1.615 J.826 E.01112
; LINE_WIDTH: 0.277747
G3 X110.378 Y109.424 I.911 J1.554 E.003
; LINE_WIDTH: 0.244807
G1 X110.5 Y109.374 E.0012
; LINE_WIDTH: 0.216431
G1 X110.677 Y109.335 E.00144
; LINE_WIDTH: 0.183243
G1 X110.833 Y109.304 E.00105
; LINE_WIDTH: 0.156768
G1 X110.906 Y109.293 E.00041
; LINE_WIDTH: 0.107736
G3 X111.29 Y109.274 I.389 J3.888 E.00135
G1 X124.506 Y109.274 E.04646
G1 X124.882 Y109.292 E.00132
; LINE_WIDTH: 0.155067
G1 X124.967 Y109.304 E.00047
; LINE_WIDTH: 0.183123
G1 X125.122 Y109.335 E.00104
; LINE_WIDTH: 0.213971
G1 X125.276 Y109.365 E.00123
; LINE_WIDTH: 0.242148
G3 X125.422 Y109.424 I-.398 J1.201 E.00142
; LINE_WIDTH: 0.270519
G1 X125.544 Y109.475 E.00134
; LINE_WIDTH: 0.303336
G3 X126.251 Y110.119 I-.826 J1.615 E.01112
; LINE_WIDTH: 0.277736
G3 X126.376 Y110.378 I-1.555 J.911 E.003
; LINE_WIDTH: 0.244802
G1 X126.426 Y110.5 E.0012
; LINE_WIDTH: 0.216431
G1 X126.465 Y110.677 E.00144
; LINE_WIDTH: 0.183243
G1 X126.496 Y110.833 E.00105
; LINE_WIDTH: 0.156768
G1 X126.507 Y110.906 E.00041
; LINE_WIDTH: 0.107755
G3 X126.526 Y111.29 I-3.888 J.389 E.00135
G1 X126.526 Y124.506 E.04647
G1 X126.508 Y124.882 E.00132
; LINE_WIDTH: 0.155064
G1 X126.496 Y124.967 E.00047
; LINE_WIDTH: 0.183237
G1 X126.465 Y125.123 E.00105
; LINE_WIDTH: 0.214311
G1 X126.434 Y125.278 E.00125
; LINE_WIDTH: 0.24267
G3 X126.376 Y125.422 I-1.316 J-.449 E.0014
; LINE_WIDTH: 0.27062
G1 X126.326 Y125.544 E.00134
; LINE_WIDTH: 0.303332
G3 X125.681 Y126.251 I-1.615 J-.826 E.01112
; LINE_WIDTH: 0.277747
G3 X125.422 Y126.376 I-.911 J-1.554 E.003
; LINE_WIDTH: 0.244807
G1 X125.301 Y126.426 E.0012
; LINE_WIDTH: 0.216431
G1 X125.123 Y126.465 E.00144
; LINE_WIDTH: 0.183243
G1 X124.967 Y126.496 E.00105
; LINE_WIDTH: 0.156768
G1 X124.894 Y126.507 E.00041
; LINE_WIDTH: 0.107736
G3 X124.51 Y126.526 I-.389 J-3.888 E.00135
G1 X123.447 Y126.526 E.00374
; WIPE_START
G1 F15000
G1 X121.447 Y126.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.228 Y119.606 Z5.7 F42000
G1 X117.03 Y117.03 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2584
M204 S5000
G1 X115.621 Y117.03 E.02288
G3 X117.03 Y115.622 I2.274 J.866 E.03332
G1 X117.03 Y116.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.621 Y117.03 E-.53583
G1 X115.78 Y116.693 E-.14148
G1 X115.883 Y116.528 E-.07404
G1 X115.897 Y116.51 E-.00865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.092 Y115.6 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G3 X118.144 Y115.472 I.851 J2.617 E.01732
G3 X118.714 Y115.6 I-.316 J2.743 E.00949
G1 X117.152 Y115.6 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X117.371 Y115.518 E-.08879
G1 X117.562 Y115.484 E-.07375
G1 X117.755 Y115.465 E-.07373
G1 X118.144 Y115.472 E-.14808
G1 X118.43 Y115.518 E-.10985
G1 X118.714 Y115.6 E-.1123
G1 X118.31 Y115.6 E-.1535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y117.03 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X118.77 Y115.622 E.02286
G1 X118.891 Y115.671 E.00212
G3 X120.179 Y117.03 I-1.066 J2.299 E.03114
G1 X118.83 Y117.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.77 Y115.622 E-.53538
G1 X118.891 Y115.671 E-.0496
G1 X119.292 Y115.899 E-.17502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.2 Y117.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X120.246 Y117.23 E.00238
G3 X120.2 Y118.71 I-2.337 J.668 E.02444
G1 X120.2 Y117.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X120.246 Y117.23 E-.03487
G1 X120.323 Y117.61 E-.14729
G1 X120.338 Y117.999 E-.14812
G1 X120.309 Y118.285 E-.10923
G1 X120.2 Y118.71 E-.1667
G1 X120.2 Y118.305 E-.15379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.77 Y118.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X120.179 Y118.77 E.02288
G1 X120.11 Y118.934 E.00288
G3 X118.77 Y120.178 I-2.244 J-1.072 E.03041
G1 X118.77 Y118.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X120.179 Y118.77 E-.53581
G1 X120.11 Y118.934 E-.06745
G1 X119.899 Y119.288 E-.15673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.086 Y120.2 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X118.708 Y120.2 E.02634
G1 X118.615 Y120.233 E.00161
G3 X117.143 Y120.219 I-.714 J-2.372 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X118.708 Y120.2 E-.5948
G1 X118.615 Y120.233 E-.03756
G1 X118.287 Y120.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.03 Y118.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X117.03 Y120.178 E.02286
G3 X115.621 Y118.77 I.875 J-2.285 E.0333
G1 X116.97 Y118.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.03 Y120.178 E-.53538
G1 X116.823 Y120.09 E-.08532
G1 X116.508 Y119.902 E-.1393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.6 Y117.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2584
M204 S5000
G1 X115.6 Y118.71 E.0263
G3 X115.581 Y117.147 I2.309 J-.81 E.02583
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3600
M204 S6000
G1 X115.6 Y118.71 E-.59399
G1 X115.491 Y118.287 E-.16601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
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
G1 Z5.7 F900 ; lower z a little
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

    G1 Z105.3 F600
    G1 Z103.3

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

