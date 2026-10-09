; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 16m 44s; total estimated time: 23m 32s
; total layer number: 72
; total filament length [mm] : 640.71
; total filament volume [cm^3] : 1541.08
; total filament weight [g] : 1.91
; model label id: 138,149,160,171,182,193,204
; object max height: 1.50,7.20,0.80,1.00,1.00,1.20,1.20
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
; filament_colour = #F47A20
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
; print_settings_id = Orbit Puck two-colour mechanical test
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
M73 P6 R22
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
M73 P6 R21
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
M73 P25 R17
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
M73 P26 R17
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
    G29 A1 X90.5099 Y83.4765 I74.9803 J89.0471
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
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X150.083 Y98.884 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P27 R17
G1 F1500
M204 S500
G1 X150.052 Y98.688 E.00387
G1 X150.052 Y86.465 E.2383
G1 X150.083 Y86.269 E.00387
G3 X150.675 Y86.238 I.394 J1.852 E.01161
G1 X162.51 Y86.24 E.23074
G1 X162.697 Y86.269 E.00371
M73 P27 R16
G1 X162.728 Y86.465 E.00387
G1 X162.728 Y98.688 E.2383
G1 X162.697 Y98.884 E.00387
G1 X162.501 Y98.915 E.00387
M73 P28 R16
G1 X150.279 Y98.915 E.2383
G1 X150.142 Y98.893 E.0027
M204 S6000
G1 X149.697 Y99.138 F42000
G1 F1500
M204 S500
G3 X149.573 Y98.725 I.574 J-.397 E.00854
G1 X149.573 Y86.428 E.23977
G3 X149.828 Y85.883 I.707 J-.001 E.01211
G3 X150.241 Y85.76 I.397 J.574 E.00854
G1 X150.675 Y85.76 E.00846
G1 X162.547 Y85.761 E.23147
G3 X163.207 Y86.428 I.015 J.645 E.02047
G1 X163.207 Y98.725 E.23977
G3 X162.952 Y99.27 I-.707 J.001 E.01211
G3 X162.539 Y99.393 I-.397 J-.574 E.00854
G1 X150.241 Y99.393 E.23977
G3 X149.737 Y99.183 I-.001 J-.707 E.01093
M204 S6000
G1 X149.351 Y99.469 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X149.305 Y99.423 E.00128
G1 X149.152 Y99.122 E.00658
G1 X149.095 Y98.763 E.00709
G1 X149.095 Y86.39 E.24124
G1 X149.152 Y86.031 E.00709
G1 X149.305 Y85.73 E.00658
G1 X149.544 Y85.491 E.00658
G1 X149.845 Y85.338 E.00658
M73 P29 R16
G3 X150.675 Y85.281 I.595 J2.592 E.0163
G1 X162.585 Y85.283 E.23221
G1 X162.936 Y85.338 E.00692
G1 X163.237 Y85.491 E.00658
G1 X163.475 Y85.73 E.00658
G1 X163.629 Y86.031 E.00658
G1 X163.685 Y86.39 E.00709
G1 X163.685 Y98.763 E.24124
G1 X163.629 Y99.122 E.00709
G1 X163.475 Y99.423 E.00658
G1 X163.237 Y99.662 E.00658
G1 X162.936 Y99.815 E.00658
G1 X162.577 Y99.872 E.00709
G1 X150.204 Y99.872 E.24124
G1 X149.844 Y99.815 E.00709
G1 X149.544 Y99.662 E.00658
G1 X149.394 Y99.512 E.00413
; WIPE_START
G1 X149.305 Y99.423 E-.04769
G1 X149.152 Y99.122 E-.12831
G1 X149.095 Y98.763 E-.13817
G1 X149.095 Y97.59 E-.44584
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 1 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.5
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


; object ids of this layer1 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X161.556 Y86.431 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50625
G1 F2400
M204 S500
G1 X162.322 Y87.196 E.02138
G1 X162.322 Y87.882 E.01354
G1 X161.086 Y86.646 E.03452
G1 X160.4 Y86.646 E.01354
G1 X162.322 Y88.567 E.05367
G1 X162.322 Y89.253 E.01354
G1 X159.715 Y86.646 E.07282
G1 X159.029 Y86.646 E.01354
G1 X162.322 Y89.939 E.09198
G1 X162.322 Y90.624 E.01354
G1 X158.343 Y86.646 E.11113
G1 X157.658 Y86.646 E.01354
G1 X162.322 Y91.31 E.13028
G1 X162.322 Y91.995 E.01354
G1 X156.972 Y86.646 E.14944
G1 X156.286 Y86.646 E.01354
G1 X162.322 Y92.681 E.16859
G1 X162.322 Y93.367 E.01354
G1 X155.601 Y86.646 E.18774
G1 X154.915 Y86.646 E.01354
G1 X162.322 Y94.052 E.2069
G1 X162.322 Y94.738 E.01354
G1 X154.229 Y86.645 E.22605
G1 X153.544 Y86.645 E.01354
G1 X162.322 Y95.423 E.2452
G1 X162.322 Y96.109 E.01354
G1 X152.858 Y86.645 E.26436
G1 X152.172 Y86.645 E.01354
G1 X162.322 Y96.795 E.28351
G1 X162.322 Y97.48 E.01354
G1 X151.487 Y86.645 E.30266
G1 X150.801 Y86.645 E.01354
G1 X162.322 Y98.166 E.32182
G1 X162.322 Y98.508 E.00676
G1 X161.978 Y98.508 E.00678
G1 X150.459 Y86.988 E.32178
G1 X150.459 Y87.674 E.01354
G1 X161.293 Y98.508 E.30263
G1 X160.607 Y98.508 E.01354
G1 X150.459 Y88.36 E.28348
G1 X150.459 Y89.045 E.01354
G1 X159.921 Y98.508 E.26433
G1 X159.236 Y98.508 E.01354
G1 X150.459 Y89.731 E.24518
G1 X150.459 Y90.416 E.01354
G1 X158.55 Y98.508 E.22603
G1 X157.865 Y98.508 E.01354
G1 X150.459 Y91.102 E.20688
G1 X150.459 Y91.788 E.01354
G1 X157.179 Y98.508 E.18773
G1 X156.493 Y98.508 E.01354
G1 X150.459 Y92.473 E.16857
G1 X150.459 Y93.159 E.01354
G1 X155.808 Y98.508 E.14942
G1 X155.122 Y98.508 E.01354
G1 X150.459 Y93.844 E.13027
G1 X150.459 Y94.53 E.01354
G1 X154.437 Y98.508 E.11112
G1 X153.751 Y98.508 E.01354
G1 X150.459 Y95.216 E.09197
G1 X150.459 Y95.901 E.01354
G1 X153.065 Y98.508 E.07282
G1 X152.38 Y98.508 E.01354
G1 X150.459 Y96.587 E.05367
G1 X150.459 Y97.272 E.01354
G1 X151.694 Y98.508 E.03452
G1 X151.009 Y98.508 E.01354
G1 X150.243 Y97.743 E.02138
; OBJECT_ID: 138
; WIPE_START
G1 X151.009 Y98.508 E-.41131
M73 P30 R16
G1 X151.694 Y98.508 E-.26053
G1 X151.53 Y98.344 E-.08816
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S6000
G1 X157.173 Y103.483 Z.5 F42000
G1 X161.365 Y107.301 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X158.815 Y107.301 E.04972
G1 X158.815 Y106.015 E.02507
G3 X158.915 Y104.326 I12.333 J-.121 E.03301
G1 X161.265 Y104.326 E.04583
G1 X161.34 Y105.038 E.01395
G3 X161.366 Y107.241 I-37.437 J1.554 E.04297
; WIPE_START
G1 X159.367 Y107.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.542 Y114.919 Z.5 F42000
G1 X159.765 Y124.63 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X144.537 Y124.63 E.29692
G1 X144.537 Y108.923 E.30625
G1 X160.244 Y108.923 E.30625
G1 X160.244 Y124.63 E.30625
G1 X159.825 Y124.63 E.00816
M204 S6000
G1 X159.765 Y124.151 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X145.015 Y124.151 E.28759
G1 X145.015 Y109.401 E.28759
G1 X159.765 Y109.401 E.28759
G1 X159.765 Y124.091 E.28642
; WIPE_START
G1 X157.765 Y124.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.808 Y116.467 Z.5 F42000
G1 X157.86 Y107.296 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X157.858 Y108.444 E.02239
G1 X146.923 Y108.444 E.21321
G2 X146.894 Y104.951 I-66.687 J-1.199 E.06812
G1 X147.189 Y104.957 E.00575
G2 X157.594 Y104.957 I5.2 J-1490.837 E.20287
G1 X157.886 Y104.951 E.00571
G1 X157.862 Y105.506 E.01082
G1 X157.86 Y107.236 E.03374
; WIPE_START
G1 X157.858 Y108.444 E-.45919
G1 X157.066 Y108.444 E-.30081
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.123 Y114.91 Z.5 F42000
G1 X162.408 Y116.959 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X164.208 Y116.959 E.0351
G1 X164.208 Y125.977 E.17583
G3 X160.37 Y128.594 I-12.108 J-13.628 E.09082
G1 X144.41 Y128.594 E.31119
G3 X140.572 Y125.977 I8.263 J-16.236 E.09082
G1 X140.572 Y116.959 E.17583
G1 X142.372 Y116.959 E.0351
G1 X142.372 Y112.594 E.08509
G1 X140.572 Y112.594 E.0351
G1 X140.572 Y104.957 E.1489
G2 X142.486 Y104.95 I.818 J-34.697 E.03733
G2 X142.458 Y106.013 I14.952 J.928 E.02074
G1 X142.458 Y108.258 E.04379
G1 X144.058 Y108.258 E.0312
G1 X144.058 Y125.109 E.32853
G1 X160.722 Y125.109 E.32491
G1 X160.722 Y108.258 E.32853
G1 X162.322 Y108.258 E.0312
G2 X162.294 Y104.95 I-63.123 J-1.107 E.06452
G1 X162.507 Y104.956 E.00416
G1 X164.208 Y104.957 E.03317
G1 X164.208 Y112.594 E.1489
G1 X162.408 Y112.594 E.0351
G1 X162.408 Y116.899 E.08392
M204 S6000
G1 X162.887 Y116.48 F42000
G1 F1500
M204 S500
G1 X164.687 Y116.48 E.0351
G1 X164.687 Y126.187 E.18926
G3 X160.483 Y129.073 I-12.289 J-13.394 E.09976
G1 X144.298 Y129.073 E.31557
G3 X140.094 Y126.187 I8.075 J-16.266 E.09976
G1 X140.094 Y116.48 E.18926
G1 X141.894 Y116.48 E.0351
G1 X141.894 Y113.073 E.06643
G1 X140.094 Y113.073 E.0351
G1 X140.094 Y104.479 E.16755
G1 X142.267 Y104.477 E.04237
G2 X143.021 Y104.446 I-.009 J-9.453 E.01473
G2 X142.937 Y106.014 I12.027 J1.433 E.03063
G1 X142.936 Y107.78 E.03443
M73 P31 R16
G1 X146.444 Y107.78 E.06839
G2 X146.417 Y105.003 I-45.279 J-.953 E.05416
G1 X146.36 Y104.452 E.0108
G2 X147.193 Y104.478 I.815 J-12.46 E.01626
G2 X157.588 Y104.478 I5.196 J-1494.218 E.20269
G2 X158.421 Y104.452 I.018 J-12.478 E.01624
G2 X158.337 Y106.014 I12.009 J1.428 E.03053
G1 X158.336 Y107.78 E.03443
G1 X161.844 Y107.78 E.06839
G2 X161.817 Y105.003 I-45.279 J-.953 E.05416
G1 X161.759 Y104.446 E.01091
G1 X161.994 Y104.462 E.0046
G1 X164.687 Y104.479 E.05249
G1 X164.687 Y113.073 E.16755
G1 X162.887 Y113.073 E.0351
G1 X162.887 Y116.42 E.06526
; WIPE_START
G1 X164.687 Y116.48 E-.68438
G1 X164.687 Y116.679 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.862 Y113.261 Z.5 F42000
G1 X145.965 Y107.301 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X143.415 Y107.301 E.04972
G1 X143.415 Y106.015 E.02507
G3 X143.515 Y104.326 I12.333 J-.121 E.03301
G1 X145.865 Y104.326 E.04583
G1 X145.94 Y105.038 E.01395
G3 X145.966 Y107.241 I-37.437 J1.554 E.04297
; WIPE_START
G1 X143.967 Y107.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X150.929 Y110.416 Z.5 F42000
G1 X163.365 Y116.001 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X165.165 Y116.001 E.0351
G1 X165.165 Y126.395 E.20266
G3 X160.595 Y129.551 I-12.776 J-13.614 E.10869
G1 X144.185 Y129.551 E.31994
G3 X139.615 Y126.395 I8.197 J-16.757 E.1087
G1 X139.615 Y116.001 E.20266
G1 X141.415 Y116.001 E.0351
G1 X141.415 Y113.551 E.04777
G1 X139.615 Y113.551 E.0351
G1 X139.615 Y104.001 E.18621
G1 X142.26 Y103.999 E.05157
G2 X143.745 Y103.926 I-1.826 J-52.835 E.029
G1 X145.707 Y103.926 E.03824
G1 X146.195 Y103.964 E.00954
G2 X147.197 Y104 I1.039 J-14.995 E.01956
G2 X157.583 Y104 I5.193 J-1497.758 E.20251
G2 X159.073 Y103.926 I-.218 J-19.618 E.02909
G1 X161.035 Y103.926 E.03824
G2 X162.52 Y103.999 I3.311 J-52.762 E.029
G1 X165.165 Y104.001 E.05157
G1 X165.165 Y113.551 E.18621
G1 X163.365 Y113.551 E.0351
G1 X163.365 Y115.941 E.0466
; WIPE_START
G1 X165.165 Y116.001 E-.68438
G1 X165.165 Y116.2 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.255 Y109.646 Z.5 F42000
G1 X160.483 Y108.351 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.68588
G1 F1500
M204 S500
G1 X158.097 Y108.351 E.06458
; WIPE_START
G1 X160.097 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X156.702 Y105.142 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50866
G1 F2400
M204 S500
G1 X157.455 Y105.896 E.02114
G1 X157.454 Y106.584 E.01366
G1 X156.228 Y105.358 E.03441
G1 X155.539 Y105.358 E.01368
G1 X157.453 Y107.271 E.05372
G1 X157.452 Y107.959 E.01366
G1 X154.85 Y105.358 E.07303
G1 X154.161 Y105.358 E.01368
G1 X156.841 Y108.038 E.07523
G1 X156.152 Y108.038 E.01368
G1 X153.472 Y105.358 E.07523
G1 X152.783 Y105.358 E.01368
G1 X155.463 Y108.038 E.07523
G1 X154.774 Y108.038 E.01368
G1 X152.094 Y105.358 E.07523
G1 X151.405 Y105.358 E.01368
G1 X154.085 Y108.038 E.07523
G1 X153.396 Y108.038 E.01368
G1 X150.716 Y105.358 E.07523
G1 X150.027 Y105.358 E.01368
G1 X152.707 Y108.038 E.07523
G1 X152.018 Y108.038 E.01368
G1 X149.338 Y105.358 E.07523
G1 X148.649 Y105.358 E.01368
G1 X151.329 Y108.038 E.07523
G1 X150.64 Y108.038 E.01368
G1 X147.96 Y105.358 E.07523
G1 X147.319 Y105.358 E.01274
M73 P32 R16
G1 X147.321 Y105.407 E.00098
G1 X149.951 Y108.038 E.07384
G1 X149.262 Y108.038 E.01368
G1 X147.325 Y106.101 E.05437
G1 X147.327 Y106.791 E.0137
G1 X148.573 Y108.038 E.03499
G1 X147.884 Y108.038 E.01368
G1 X147.112 Y107.266 E.02168
; WIPE_START
G1 X147.884 Y108.038 E-.41494
M73 P32 R15
G1 X148.573 Y108.038 E-.26183
G1 X148.418 Y107.883 E-.08323
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.683 Y108.351 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.68588
G1 F1500
M204 S500
G1 X144.297 Y108.351 E.06458
; WIPE_START
G1 X146.297 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X153.794 Y106.917 Z.5 F42000
G1 X163.047 Y105.148 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50093
G1 F2400
M204 S500
G1 X163.801 Y105.903 E.02086
G1 X163.801 Y106.581 E.01325
G1 X162.725 Y105.504 E.02975
G1 X162.726 Y106.183 E.01327
G1 X163.801 Y107.259 E.02972
G1 X163.801 Y107.937 E.01325
G1 X162.727 Y106.862 E.02969
G1 X162.728 Y107.541 E.01327
G1 X163.801 Y108.615 E.02966
G1 X163.801 Y109.293 E.01325
G1 X162.729 Y108.221 E.02963
G1 X162.73 Y108.665 E.00869
G1 X162.496 Y108.665 E.00457
G1 X163.801 Y109.971 E.03608
G1 X163.801 Y110.649 E.01325
G1 X161.818 Y108.665 E.05481
G1 X161.139 Y108.665 E.01325
G1 X163.801 Y111.327 E.07354
G1 X163.801 Y112.005 E.01325
G1 X161.129 Y109.333 E.07384
G1 X161.129 Y110.011 E.01325
G1 X163.306 Y112.188 E.06015
G1 X162.628 Y112.188 E.01325
G1 X161.129 Y110.689 E.04141
G1 X161.129 Y111.367 E.01325
G1 X162.001 Y112.239 E.02411
G1 X162.001 Y112.917 E.01325
G1 X161.129 Y112.045 E.02411
G1 X161.129 Y112.723 E.01325
G1 X162.001 Y113.596 E.02411
G1 X162.001 Y114.274 E.01325
G1 X161.129 Y113.401 E.02411
G1 X161.129 Y114.079 E.01325
G1 X162.001 Y114.952 E.02411
G1 X162.001 Y115.63 E.01325
G1 X161.129 Y114.757 E.02411
G1 X161.129 Y115.435 E.01325
G1 X162.217 Y116.523 E.03006
; WIPE_START
G1 X161.129 Y115.435 E-.58465
G1 X161.129 Y114.974 E-.17535
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.522 Y117.15 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X163.801 Y117.43 E.00773
G1 X163.801 Y118.108 E.01325
G1 X162.843 Y117.15 E.02647
; WIPE_START
G1 X163.801 Y118.108 E-.51484
G1 X163.801 Y117.463 E-.24516
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X164.017 Y119.001 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X161.129 Y116.113 E.07979
G1 X161.129 Y116.791 E.01325
G1 X163.801 Y119.464 E.07384
G1 X163.801 Y120.142 E.01325
G1 X161.129 Y117.469 E.07384
G1 X161.129 Y118.148 E.01325
G1 X163.801 Y120.82 E.07384
G1 X163.801 Y121.498 E.01325
G1 X161.129 Y118.826 E.07384
G1 X161.129 Y119.504 E.01325
G1 X163.801 Y122.176 E.07384
G1 X163.801 Y122.854 E.01325
G1 X161.129 Y120.182 E.07384
G1 X161.129 Y120.86 E.01325
G1 X163.801 Y123.532 E.07384
G1 X163.801 Y124.21 E.01325
G1 X161.129 Y121.538 E.07384
G1 X161.129 Y122.216 E.01325
G1 X163.801 Y124.889 E.07384
G1 X163.801 Y125.567 E.01325
G1 X161.129 Y122.894 E.07384
G1 X161.129 Y123.572 E.01325
G1 X163.552 Y125.995 E.06694
G1 X163.182 Y126.304 E.0094
G1 X161.129 Y124.25 E.05674
G1 X161.129 Y124.928 E.01325
G1 X162.799 Y126.599 E.04615
G1 X162.405 Y126.883 E.00949
G1 X161.038 Y125.515 E.03779
G1 X160.36 Y125.515 E.01325
G1 X162.011 Y127.167 E.04563
G1 X161.593 Y127.426 E.00962
G1 X159.682 Y125.515 E.0528
G1 X159.004 Y125.515 E.01325
G1 X161.174 Y127.686 E.05997
G3 X160.743 Y127.933 I-2.199 J-3.338 E.00971
G1 X158.325 Y125.515 E.06679
G1 X157.647 Y125.515 E.01325
G1 X160.302 Y128.17 E.07334
G1 X160.268 Y128.188 E.00075
G1 X159.642 Y128.188 E.01223
G1 X156.969 Y125.515 E.07384
G1 X156.291 Y125.515 E.01325
G1 X158.964 Y128.188 E.07384
G1 X158.286 Y128.188 E.01325
G1 X155.613 Y125.515 E.07384
G1 X154.935 Y125.515 E.01325
G1 X157.608 Y128.188 E.07384
G1 X156.93 Y128.188 E.01325
G1 X154.257 Y125.515 E.07384
G1 X153.579 Y125.515 E.01325
G1 X156.252 Y128.188 E.07384
G1 X155.573 Y128.188 E.01325
G1 X152.901 Y125.515 E.07384
G1 X152.223 Y125.515 E.01325
G1 X154.895 Y128.188 E.07384
G1 X154.217 Y128.188 E.01325
G1 X151.545 Y125.515 E.07384
G1 X150.867 Y125.515 E.01325
G1 X153.539 Y128.188 E.07384
G1 X152.861 Y128.188 E.01325
G1 X150.189 Y125.515 E.07384
G1 X149.51 Y125.515 E.01325
G1 X152.183 Y128.188 E.07384
G1 X151.505 Y128.188 E.01325
G1 X148.832 Y125.515 E.07384
G1 X148.154 Y125.515 E.01325
G1 X150.827 Y128.188 E.07384
G1 X150.149 Y128.188 E.01325
G1 X147.476 Y125.515 E.07384
G1 X146.798 Y125.515 E.01325
G1 X149.471 Y128.188 E.07384
G1 X148.793 Y128.188 E.01325
G1 X146.12 Y125.515 E.07384
G1 X145.442 Y125.515 E.01325
G1 X148.115 Y128.188 E.07384
G1 X147.437 Y128.188 E.01325
G1 X144.549 Y125.3 E.07979
; WIPE_START
G1 X145.963 Y126.714 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.065 Y119.135 Z.5 F42000
G1 X143.867 Y109.022 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X143.51 Y108.665 E.00987
G1 X142.832 Y108.665 E.01325
G1 X143.867 Y109.7 E.0286
; WIPE_START
G1 X142.832 Y108.665 E-.55633
G1 X143.368 Y108.665 E-.20368
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.27 Y106.069 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X141.561 Y105.36 E.0196
G1 X140.979 Y105.362 E.01137
G1 X140.979 Y105.456 E.00183
G1 X142.054 Y106.531 E.0297
G1 X142.053 Y107.208 E.01322
G1 X140.979 Y106.134 E.02967
G1 X140.979 Y106.812 E.01325
G1 X142.267 Y108.1 E.03558
; WIPE_START
G1 X140.979 Y106.812 E-.69213
G1 X140.979 Y106.634 E-.06787
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.763 Y107.275 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X143.651 Y110.163 E.07979
G1 X143.651 Y110.841 E.01325
G1 X140.979 Y108.169 E.07384
G1 X140.979 Y108.847 E.01325
G1 X143.651 Y111.519 E.07384
G1 X143.651 Y112.197 E.01325
G1 X140.979 Y109.525 E.07384
G1 X140.979 Y110.203 E.01325
G1 X143.651 Y112.875 E.07384
G1 X143.651 Y113.553 E.01325
G1 X142.779 Y112.681 E.02411
G1 X142.779 Y112.188 E.00963
G1 X142.286 Y112.188 E.00963
G1 X140.979 Y110.881 E.03611
G1 X140.979 Y111.559 E.01325
G1 X141.823 Y112.403 E.02332
; WIPE_START
G1 X140.979 Y111.559 E-.45364
G1 X140.979 Y110.881 E-.25767
M73 P33 R15
G1 X141.069 Y110.971 E-.04869
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.563 Y113.144 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X143.651 Y114.232 E.03006
G1 X143.651 Y114.91 E.01325
G1 X142.779 Y114.037 E.02411
G1 X142.779 Y114.715 E.01325
G1 X143.651 Y115.588 E.02411
G1 X143.651 Y116.266 E.01325
G1 X142.779 Y115.393 E.02411
G1 X142.779 Y116.071 E.01325
G1 X143.651 Y116.944 E.02411
G1 X143.651 Y117.622 E.01325
G1 X142.779 Y116.749 E.02411
G1 X142.779 Y117.365 E.01203
G1 X142.717 Y117.365 E.00122
G1 X143.651 Y118.3 E.02583
G1 X143.651 Y118.978 E.01325
G1 X142.039 Y117.365 E.04456
G1 X141.36 Y117.365 E.01325
G1 X143.651 Y119.656 E.06329
G1 X143.651 Y120.334 E.01325
G1 X140.979 Y117.662 E.07384
G1 X140.979 Y118.34 E.01325
G1 X143.651 Y121.012 E.07384
G1 X143.651 Y121.69 E.01325
G1 X140.979 Y119.018 E.07384
G1 X140.979 Y119.696 E.01325
G1 X143.651 Y122.368 E.07384
G1 X143.651 Y123.046 E.01325
G1 X140.979 Y120.374 E.07384
G1 X140.979 Y121.052 E.01325
G1 X143.651 Y123.725 E.07384
G1 X143.651 Y124.403 E.01325
G1 X140.979 Y121.73 E.07384
G1 X140.979 Y122.408 E.01325
G1 X143.651 Y125.081 E.07384
G1 X143.651 Y125.515 E.00849
G1 X144.086 Y125.515 E.00849
G1 X146.758 Y128.188 E.07384
G1 X146.08 Y128.188 E.01325
G1 X140.979 Y123.086 E.14094
G1 X140.979 Y123.764 E.01325
G1 X145.402 Y128.188 E.12221
G1 X144.724 Y128.188 E.01325
G1 X140.979 Y124.442 E.10348
G1 X140.979 Y125.12 E.01325
G1 X144.034 Y128.176 E.08441
; OBJECT_ID: 193
; WIPE_START
G1 X142.62 Y126.761 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S6000
G1 X136.883 Y131.796 Z.5 F42000
G1 X91.662 Y171.488 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X91.679 Y171.574 E.00171
G1 X91.662 Y171.659 E.0017
G1 X91.613 Y171.731 E.00171
G1 X91.539 Y171.779 E.0017
G1 X91.453 Y171.794 E.00171
G1 X91.368 Y171.775 E.00171
G1 X91.297 Y171.724 E.0017
G1 X91.251 Y171.649 E.00171
G1 X91.238 Y171.563 E.0017
G1 X91.26 Y171.478 E.00171
G1 X91.313 Y171.408 E.0017
G1 X91.388 Y171.364 E.00171
G1 X91.473 Y171.354 E.00166
G1 X91.539 Y171.368 E.00133
G1 X91.613 Y171.416 E.0017
G1 X91.628 Y171.438 E.00053
M204 S6000
G1 X92.098 Y171.291 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X92.101 Y171.303 E.00023
G3 X91.441 Y170.874 I-.644 J.269 E.0692
G1 X91.507 Y170.876 E.00129
G3 X92.035 Y171.181 I-.051 J.696 E.01229
G1 X92.068 Y171.239 E.00131
; OBJECT_ID: 160
; WIPE_START
G1 X92.101 Y171.303 E-.02716
G1 X92.145 Y171.435 E-.05291
G1 X92.158 Y171.574 E-.05291
G1 X92.144 Y171.712 E-.05295
G1 X92.103 Y171.845 E-.05296
G1 X92.037 Y171.968 E-.05293
G1 X91.947 Y172.074 E-.05298
G1 X91.838 Y172.161 E-.05292
G1 X91.714 Y172.225 E-.05294
G1 X91.58 Y172.263 E-.05293
G1 X91.441 Y172.273 E-.05298
G1 X91.236 Y172.237 E-.07925
G1 X91.109 Y172.18 E-.05291
G1 X90.996 Y172.098 E-.05296
G1 X90.963 Y172.063 E-.0183
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S6000
G1 X98.574 Y171.496 Z.5 F42000
G1 X116.491 Y170.163 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X116.47 Y170.212 E.00103
G3 X114.828 Y171.327 I-1.681 J-.708 E.04091
G1 X97.389 Y171.327 E.34002
G3 X95.605 Y169.543 I.039 J-1.823 E.05432
G1 X95.605 Y152.104 E.34002
G3 X97.389 Y150.32 I1.823 J.039 E.05432
G1 X114.828 Y150.32 E.34002
G3 X116.612 Y152.104 I-.039 J1.823 E.05432
G1 X116.612 Y169.543 E.34002
G3 X116.574 Y169.875 I-1.823 J-.039 E.00652
G1 X116.508 Y170.105 E.00468
M204 S6000
G1 X116.035 Y170.025 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X116.029 Y170.029 E.00015
G3 X114.817 Y170.849 I-1.235 J-.52 E.03018
G1 X97.401 Y170.849 E.33957
G3 X96.084 Y169.532 I.023 J-1.34 E.04015
G1 X96.084 Y152.116 E.33957
G3 X97.401 Y150.799 I1.34 J.023 E.04015
G1 X114.817 Y150.799 E.33957
G3 X116.134 Y152.116 I-.023 J1.34 E.04015
G1 X116.134 Y169.532 E.33957
G3 X116.106 Y169.782 I-1.34 J-.023 E.00491
G1 X116.052 Y169.967 E.00377
; WIPE_START
G1 X116.029 Y170.029 E-.02509
G1 X115.911 Y170.26 E-.09852
G1 X115.746 Y170.461 E-.09876
G1 X115.545 Y170.625 E-.09869
G1 X115.316 Y170.748 E-.09873
G1 X115.067 Y170.823 E-.09877
G1 X114.817 Y170.849 E-.09571
G1 X114.433 Y170.849 E-.14573
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.256 Y163.261 Z.5 F42000
G1 X116.693 Y150.001 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X116.869 Y150.146 E.00443
G3 X117.005 Y150.543 I-.462 J.381 E.00836
G1 X117.005 Y171.104 E.40088
G3 X116.389 Y171.72 I-.606 J.01 E.01896
G1 X95.828 Y171.72 E.40088
G3 X95.212 Y171.104 I-.01 J-.606 E.01896
G1 X95.212 Y150.543 E.40088
G3 X95.828 Y149.927 I.606 J-.01 E.01896
G1 X116.461 Y149.931 E.40228
G3 X116.639 Y149.975 I-.055 J.597 E.0036
M204 S6000
G1 X117.005 Y149.631 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X117.484 Y150.532 I-.6 J.896 E.02071
G1 X117.484 Y171.116 E.40134
G3 X116.401 Y172.199 I-1.089 J-.006 E.03312
G1 X95.817 Y172.199 E.40134
G3 X94.734 Y171.116 I.006 J-1.089 E.03312
G1 X94.734 Y150.532 E.40134
G3 X95.817 Y149.449 I1.088 J.005 E.03312
G1 X116.506 Y149.454 E.4034
G3 X116.954 Y149.599 I-.101 J1.074 E.00926
M204 S6000
G1 X116.4 Y150.167 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.303031
G1 F1500
M204 S500
G1 X116.766 Y151.374 E.01446
M204 S6000
G1 X116.766 Y151.287 F42000
; LINE_WIDTH: 0.447217
G1 F1500
M204 S500
G1 X116.365 Y150.166 E.02064
M204 S6000
G1 X115.646 Y150.166 F42000
; LINE_WIDTH: 0.447284
G1 F1500
M204 S500
G1 X116.766 Y150.567 E.02064
M204 S6000
M73 P34 R15
G1 X116.765 Y150.532 F42000
; LINE_WIDTH: 0.302992
G1 F1500
M204 S500
G1 X115.558 Y150.166 E.01447
; WIPE_START
G1 X116.765 Y150.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X109.134 Y150.393 Z.5 F42000
G1 X96.659 Y150.166 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.303136
G1 F1500
M204 S500
G1 X95.452 Y150.533 E.01447
M204 S6000
G1 X95.451 Y150.567 F42000
; LINE_WIDTH: 0.447147
G1 F1500
M204 S500
G1 X96.571 Y150.166 E.02063
M204 S6000
G1 X96.481 Y150.166 F42000
; LINE_WIDTH: 0.567524
G1 F1500
M204 S500
G1 X95.761 Y150.476 E.01743
G1 X95.451 Y151.196 E.01744
M204 S6000
G1 X95.451 Y151.287 F42000
; LINE_WIDTH: 0.447158
G1 F1500
M204 S500
G1 X95.852 Y150.166 E.02065
M204 S6000
G1 X95.817 Y150.167 F42000
; LINE_WIDTH: 0.30297
G1 F1500
M204 S500
G1 X95.451 Y151.375 E.01447
; WIPE_START
G1 X95.817 Y150.167 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.678 Y157.798 Z.5 F42000
G1 X95.451 Y170.274 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.303026
G1 F1500
M204 S500
G1 X95.818 Y171.48 E.01446
M204 S6000
G1 X95.853 Y171.481 F42000
; LINE_WIDTH: 0.447287
G1 F1500
M204 S500
G1 X95.451 Y170.361 E.02064
M204 S6000
G1 X95.451 Y170.482 F42000
; LINE_WIDTH: 0.577745
G1 F1500
M204 S500
G1 X95.744 Y171.15 E.01653
G1 X96.119 Y171.481 E.01133
M204 S6000
G1 X96.572 Y171.481 F42000
; LINE_WIDTH: 0.44718
G1 F1500
M204 S500
G1 X95.451 Y171.08 E.02065
M204 S6000
G1 X95.453 Y171.115 F42000
; LINE_WIDTH: 0.303026
G1 F1500
M204 S500
G1 X96.659 Y171.481 E.01446
; WIPE_START
G1 X95.453 Y171.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.084 Y171.254 Z.5 F42000
G1 X115.559 Y171.481 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.30317
G1 F1500
M204 S500
G1 X116.765 Y171.114 E.01447
M204 S6000
G1 X116.766 Y171.08 F42000
; LINE_WIDTH: 0.447147
G1 F1500
M204 S500
G1 X115.646 Y171.481 E.02063
M204 S6000
G1 X115.737 Y171.481 F42000
; LINE_WIDTH: 0.576787
G1 F1500
M204 S500
G1 X116.435 Y171.188 E.01714
G1 X116.766 Y170.896 E.00998
M204 S6000
G1 X116.766 Y170.36 F42000
; LINE_WIDTH: 0.447158
G1 F1500
M204 S500
G1 X116.365 Y171.481 E.02065
M204 S6000
G1 X116.399 Y171.48 F42000
; LINE_WIDTH: 0.302946
G1 F1500
M204 S500
G1 X116.766 Y170.274 E.01445
; OBJECT_ID: 171
; WIPE_START
G1 X116.399 Y171.48 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S6000
G1 X123.557 Y168.83 Z.5 F42000
G1 X164.823 Y153.549 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X164.969 Y153.581 E.00291
G1 X165.084 Y153.596 E.00225
G1 X165.065 Y153.748 E.00298
G1 X164.643 Y155.541 E.03593
G1 X163.892 Y157.727 E.04505
G1 X162.928 Y159.826 E.04506
G1 X161.759 Y161.819 E.04504
G1 X160.397 Y163.686 E.04505
G1 X158.856 Y165.407 E.04505
G1 X157.15 Y166.966 E.04505
G1 X155.298 Y168.348 E.04505
G1 X153.318 Y169.538 E.04505
G1 X151.229 Y170.524 E.04505
G1 X149.051 Y171.298 E.04505
G1 X146.808 Y171.85 E.04505
G1 X144.521 Y172.177 E.04505
G1 X142.212 Y172.273 E.04505
G1 X139.905 Y172.139 E.04505
G1 X137.624 Y171.776 E.04505
G1 X135.389 Y171.187 E.04505
G1 X133.225 Y170.378 E.04505
G1 X131.152 Y169.357 E.04505
G1 X129.191 Y168.135 E.04505
G1 X127.362 Y166.724 E.04505
G1 X125.682 Y165.137 E.04505
G1 X124.169 Y163.391 E.04505
G1 X122.838 Y161.502 E.04505
G1 X121.702 Y159.491 E.04505
G1 X120.771 Y157.376 E.04505
G1 X120.072 Y155.226 E.04408
G1 X120.207 Y154.447 E.01541
G1 X120.444 Y155.452 E.02012
G1 X121.179 Y157.596 E.0442
G1 X122.123 Y159.657 E.0442
G1 X123.266 Y161.615 E.0442
G1 X124.598 Y163.449 E.0442
G1 X126.105 Y165.143 E.0442
G1 X127.772 Y166.678 E.0442
G1 X129.583 Y168.041 E.0442
G1 X131.521 Y169.218 E.0442
G1 X133.565 Y170.197 E.0442
G1 X135.697 Y170.969 E.0442
G1 X137.894 Y171.526 E.0442
G1 X140.136 Y171.862 E.0442
G1 X142.4 Y171.974 E.0442
G1 X144.664 Y171.862 E.0442
G1 X146.906 Y171.526 E.0442
G1 X149.104 Y170.969 E.0442
G1 X151.235 Y170.197 E.0442
G1 X153.28 Y169.218 E.0442
G1 X155.217 Y168.041 E.0442
G1 X157.029 Y166.678 E.0442
G1 X158.696 Y165.143 E.0442
G1 X160.203 Y163.449 E.0442
G1 X161.535 Y161.615 E.0442
G1 X162.678 Y159.657 E.0442
G1 X163.622 Y157.596 E.0442
G1 X164.357 Y155.452 E.0442
G1 X164.767 Y153.707 E.03495
G1 X164.803 Y153.606 E.0021
; OBJECT_ID: 182
; WIPE_START
G1 X164.969 Y153.581 E-.06378
G1 X165.084 Y153.596 E-.04376
G1 X165.065 Y153.748 E-.05812
G1 X164.707 Y155.27 E-.59434
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S6000
G1 X164.839 Y147.639 Z.5 F42000
G1 X165.091 Y133.124 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X165.227 Y133.902 E.01541
G1 X164.528 Y136.052 E.04408
G1 X163.597 Y138.167 E.04505
G1 X162.461 Y140.179 E.04505
G1 X161.129 Y142.067 E.04505
G1 X159.616 Y143.814 E.04505
G1 X157.937 Y145.4 E.04505
G1 X156.108 Y146.812 E.04505
G1 X154.147 Y148.034 E.04505
G1 X152.074 Y149.054 E.04505
G1 X149.909 Y149.863 E.04505
G1 X147.675 Y150.452 E.04505
G1 X145.393 Y150.815 E.04505
G1 X143.087 Y150.95 E.04505
G1 X140.778 Y150.853 E.04505
G1 X138.491 Y150.527 E.04505
G1 X136.247 Y149.974 E.04505
G1 X134.07 Y149.201 E.04505
G1 X131.981 Y148.214 E.04505
G1 X130 Y147.024 E.04505
G1 X128.148 Y145.643 E.04505
G1 X126.443 Y144.084 E.04505
G1 X124.902 Y142.362 E.04505
G1 X123.54 Y140.496 E.04505
G1 X122.371 Y138.503 E.04505
G1 X121.406 Y136.403 E.04505
M73 P35 R15
G1 X120.656 Y134.218 E.04505
G1 X120.234 Y132.424 E.03593
G1 X120.215 Y132.272 E.00298
G2 X120.475 Y132.226 I-.144 J-1.546 E.00516
G1 X120.531 Y132.384 E.00327
G1 X120.942 Y134.128 E.03495
G1 X121.677 Y136.273 E.0442
G1 X122.621 Y138.334 E.0442
G1 X123.764 Y140.291 E.0442
G1 X125.096 Y142.126 E.0442
G1 X126.603 Y143.819 E.0442
G1 X128.27 Y145.355 E.0442
G1 X130.081 Y146.718 E.0442
G1 X132.019 Y147.895 E.0442
G1 X134.064 Y148.874 E.0442
G1 X136.195 Y149.646 E.0442
G1 X138.392 Y150.202 E.0442
G1 X140.634 Y150.538 E.0442
G1 X142.898 Y150.651 E.0442
G1 X145.163 Y150.538 E.0442
G1 X147.404 Y150.202 E.0442
G1 X149.602 Y149.646 E.0442
G1 X151.733 Y148.874 E.0442
G1 X153.778 Y147.895 E.0442
G1 X155.715 Y146.718 E.0442
G1 X157.527 Y145.355 E.0442
G1 X159.194 Y143.819 E.0442
G1 X160.701 Y142.126 E.0442
G1 X162.033 Y140.291 E.0442
G1 X163.176 Y138.334 E.0442
G1 X164.12 Y136.273 E.0442
G1 X164.855 Y134.128 E.0442
G1 X165.078 Y133.182 E.01895
; OBJECT_ID: 204
; WIPE_START
G1 X165.227 Y133.902 E-.27948
G1 X164.836 Y135.105 E-.48052
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S6000
G1 X157.309 Y133.838 Z.5 F42000
G1 X128.218 Y128.941 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X128.219 Y128.959 E.00036
G1 X128.189 Y129.041 E.0017
G1 X128.13 Y129.106 E.0017
G1 X128.05 Y129.142 E.00171
G1 X127.962 Y129.144 E.0017
G1 X127.881 Y129.112 E.00171
G1 X127.818 Y129.051 E.0017
G1 X127.785 Y128.97 E.0017
G1 X127.781 Y128.904 E.00128
G1 X127.807 Y128.821 E.00171
G1 X127.863 Y128.754 E.0017
G1 X127.941 Y128.714 E.00171
G1 X128.028 Y128.708 E.0017
G1 X128.111 Y128.735 E.0017
G1 X128.177 Y128.793 E.0017
G1 X128.214 Y128.872 E.0017
G1 X128.215 Y128.881 E.00018
M204 S6000
G1 X128.698 Y128.915 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X128.693 Y129.031 E.00226
G3 X128.022 Y128.227 I-.69 J-.106 E.06242
G1 X128.088 Y128.232 E.00129
G3 X128.697 Y128.855 I-.085 J.693 E.01835
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F1500
G1 X128.693 Y129.031 E-.06672
G1 X128.631 Y129.23 E-.07926
G1 X128.558 Y129.349 E-.05295
G1 X128.464 Y129.451 E-.05292
G1 X128.351 Y129.532 E-.05292
G1 X128.224 Y129.59 E-.05296
G1 X128.088 Y129.621 E-.05293
G1 X127.949 Y129.624 E-.05297
G1 X127.811 Y129.6 E-.05292
G1 X127.682 Y129.549 E-.05298
G1 X127.564 Y129.473 E-.053
G1 X127.465 Y129.376 E-.05289
G1 X127.386 Y129.261 E-.05295
G1 X127.354 Y129.184 E-.03162
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 2/72
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S191.25
; open powerlost recovery
M1003 S1
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.5 I.975 J.728 P1  F42000
G1 X149.868 Y99.021 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.781 Y98.73 I.336 J-.258 E.00541
G1 X149.781 Y86.423 E.21489
G3 X150.237 Y85.968 I.423 J-.032 E.01276
G1 X162.544 Y85.968 E.21489
G1 X162.738 Y85.998 E.00343
G3 X162.999 Y86.423 I-.162 J.392 E.0093
G1 X162.999 Y98.73 E.21489
G3 X162.544 Y99.185 I-.423 J.032 E.01276
G1 X150.237 Y99.185 E.21489
G3 X149.908 Y99.065 I-.032 J-.423 E.0063
M204 S10000
G1 X149.525 Y99.292 F42000
G1 F6000
M204 S6000
G1 X149.519 Y99.274 E.00033
G3 X149.399 Y99.058 I.706 J-.532 E.00432
G1 X149.353 Y98.764 E.0052
G1 X149.353 Y86.389 E.21607
G1 X149.399 Y86.095 E.0052
G3 X149.909 Y85.586 I.825 J.316 E.01295
G1 X150.203 Y85.539 E.0052
G1 X162.577 Y85.539 E.21607
G1 X162.872 Y85.586 E.0052
G3 X163.381 Y86.095 I-.316 J.825 E.01295
G1 X163.427 Y86.389 E.0052
G1 X163.427 Y98.764 E.21607
G1 X163.381 Y99.058 E.0052
G3 X162.872 Y99.567 I-.825 J-.316 E.01295
G1 X162.577 Y99.614 E.0052
G1 X150.203 Y99.614 E.21607
G1 X149.909 Y99.567 E.0052
G3 X149.693 Y99.448 I.316 J-.825 E.00432
G1 X149.569 Y99.333 E.00295
M204 S250
G1 X149.233 Y99.584 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.173 Y99.525 E.00136
G1 X149.001 Y99.187 E.00615
G1 X148.939 Y98.778 E.00672
G1 X148.939 Y86.375 E.20141
G1 X149.001 Y85.966 E.00672
G1 X149.173 Y85.628 E.00616
G1 X149.441 Y85.36 E.00616
G1 X149.779 Y85.188 E.00616
G1 X150.188 Y85.126 E.00672
G1 X154.421 Y85.126 E.06872
G1 X162.619 Y85.127 E.13312
G1 X163.001 Y85.188 E.00628
G1 X163.339 Y85.36 E.00616
G1 X163.607 Y85.628 E.00616
G1 X163.779 Y85.966 E.00616
G1 X163.841 Y86.375 E.00672
G1 X163.841 Y98.778 E.20141
G1 X163.779 Y99.187 E.00672
G1 X163.607 Y99.525 E.00616
G1 X163.339 Y99.793 E.00616
G1 X163.001 Y99.965 E.00616
G1 X162.592 Y100.027 E.00672
G1 X150.188 Y100.027 E.20141
G1 X149.779 Y99.965 E.00672
G1 X149.441 Y99.793 E.00616
G1 X149.275 Y99.627 E.00382
; WIPE_START
M204 S6000
G1 X149.173 Y99.525 E-.05465
G1 X149.001 Y99.187 E-.14403
G1 X148.939 Y98.778 E-.15729
G1 X148.939 Y97.715 E-.40402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 2 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


; object ids of this layer2 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X150.351 Y86.14 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42244
G1 F15000
M204 S6000
G1 X150.15 Y86.341 E.00465
G1 X150.133 Y86.451 E.00181
G1 X150.133 Y86.925 E.00776
G1 X150.739 Y86.319 E.01401
G1 X151.306 Y86.319 E.00926
G1 X150.133 Y87.492 E.02711
G1 X150.133 Y88.06 E.00926
G1 X151.873 Y86.319 E.04021
G1 X152.44 Y86.319 E.00926
G1 X150.133 Y88.627 E.05331
G1 X150.133 Y89.194 E.00926
G1 X153.007 Y86.319 E.06641
G1 X153.574 Y86.319 E.00926
G1 X150.133 Y89.761 E.07952
G1 X150.133 Y90.328 E.00926
G1 X154.142 Y86.319 E.09262
G1 X154.709 Y86.319 E.00926
G1 X150.133 Y90.895 E.10572
G1 X150.133 Y91.462 E.00926
G1 X155.276 Y86.319 E.11882
G1 X155.843 Y86.319 E.00926
G1 X150.133 Y92.029 E.13192
G1 X150.133 Y92.596 E.00926
G1 X156.41 Y86.319 E.14503
G1 X156.977 Y86.319 E.00926
G1 X150.133 Y93.163 E.15813
G1 X150.133 Y93.73 E.00926
G1 X157.544 Y86.319 E.17123
G1 X158.111 Y86.319 E.00926
G1 X150.133 Y94.297 E.18433
G1 X150.133 Y94.864 E.00926
G1 X158.678 Y86.319 E.19743
G1 X159.245 Y86.319 E.00926
G1 X150.133 Y95.431 E.21054
G1 X150.133 Y95.999 E.00926
G1 X159.812 Y86.319 E.22364
G1 X160.379 Y86.319 E.00926
G1 X150.133 Y96.566 E.23674
G1 X150.133 Y97.133 E.00926
G1 X160.946 Y86.319 E.24984
G1 X161.513 Y86.319 E.00926
G1 X150.133 Y97.7 E.26294
G1 X150.133 Y98.267 E.00926
G1 X162.081 Y86.319 E.27605
G1 X162.516 Y86.319 E.00711
G1 X162.629 Y86.338 E.00187
G1 X150.151 Y98.815 E.28829
G1 X150.264 Y98.834 E.00187
G1 X150.7 Y98.834 E.00712
G1 X162.647 Y86.886 E.27604
G1 X162.647 Y87.453 E.00926
G1 X151.267 Y98.834 E.26294
G1 X151.834 Y98.834 E.00926
G1 X162.647 Y88.021 E.24983
G1 X162.647 Y88.588 E.00926
G1 X152.401 Y98.834 E.23673
G1 X152.968 Y98.834 E.00926
G1 X162.647 Y89.155 E.22363
G1 X162.647 Y89.722 E.00926
G1 X153.535 Y98.834 E.21053
G1 X154.103 Y98.834 E.00926
G1 X162.647 Y90.289 E.19743
G1 X162.647 Y90.856 E.00926
G1 X154.67 Y98.834 E.18432
G1 X155.237 Y98.834 E.00926
G1 X162.647 Y91.423 E.17122
G1 X162.647 Y91.99 E.00926
G1 X155.804 Y98.834 E.15812
G1 X156.371 Y98.834 E.00926
G1 X162.647 Y92.557 E.14502
G1 X162.647 Y93.124 E.00926
G1 X156.938 Y98.834 E.13192
G1 X157.505 Y98.834 E.00926
G1 X162.647 Y93.691 E.11881
G1 X162.647 Y94.258 E.00926
G1 X158.072 Y98.834 E.10571
G1 X158.639 Y98.834 E.00926
G1 X162.647 Y94.825 E.09261
G1 X162.647 Y95.392 E.00926
G1 X159.206 Y98.834 E.07951
G1 X159.773 Y98.834 E.00926
G1 X162.647 Y95.96 E.06641
G1 X162.647 Y96.527 E.00926
G1 X160.34 Y98.834 E.05331
G1 X160.907 Y98.834 E.00926
G1 X162.647 Y97.094 E.0402
G1 X162.647 Y97.661 E.00926
G1 X161.474 Y98.834 E.0271
G1 X162.042 Y98.834 E.00926
G1 X162.647 Y98.228 E.014
G1 X162.647 Y98.702 E.00775
G1 X162.63 Y98.812 E.00182
G1 X162.429 Y99.013 E.00464
; OBJECT_ID: 138
; WIPE_START
G1 X162.63 Y98.812 E-.10787
G1 X162.647 Y98.702 E-.04234
G1 X162.647 Y98.228 E-.1803
G1 X162.042 Y98.834 E-.32562
M73 P36 R15
G1 X161.768 Y98.834 E-.10388
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X161.382 Y106.456 Z.6 F42000
G1 X160.492 Y124.036 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z.6 F42000
G1 X146.692 Y107.186 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.091 J-13.366 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.045 J-16.065 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
M73 P36 R14
G3 X160.525 Y129.253 I-12.481 J-13.489 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z.6 F42000
G1 X161.25 Y107.186 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z.6 F42000
G1 X163.48 Y115.886 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.92 J-13.707 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z.6 F42000
G1 X160.706 Y108.351 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.289 Y125.901 E.01114
G1 X161.077 Y126.018 E.00393
G1 X160.706 Y126.089 E.00612
G1 X144.074 Y126.089 E.27007
G1 X143.659 Y125.999 E.0069
G1 X143.509 Y125.913 E.00281
G1 X143.191 Y125.554 E.00779
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.197 J-13.287 E.06092
G1 X160.121 Y127.614 E.25106
G2 X162.672 Y125.982 I-8.688 J-16.393 E.04923
G1 X163.228 Y125.517 E.01177
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.0055
; LINE_WIDTH: 0.439333
G1 X161.802 Y125.842 E.0083
; LINE_WIDTH: 0.464797
G1 X161.545 Y126.256 E.0088
G1 X162.42 Y125.672 E.01901
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.244 Y126.437 F42000
; LINE_WIDTH: 0.51136
G1 F14696.877
M204 S6000
G1 X161.493 Y126.287 E.0058
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443573
G1 F15000
M204 S6000
G1 X143.773 Y126.446 E.00521
; LINE_WIDTH: 0.474716
G1 X143.473 Y126.404 E.0056
G1 X143.991 Y126.784 E.01187
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01282
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.501 Y126.959 E.00883
; LINE_WIDTH: 0.437552
G1 X160.749 Y126.785 E.00513
; LINE_WIDTH: 0.472675
G1 X160.997 Y126.611 E.00557
; LINE_WIDTH: 0.507798
G1 F14804.509
G1 X161.244 Y126.437 E.006
G1 X161.065 Y126.454 E.00357
; LINE_WIDTH: 0.472675
G1 F15000
G1 X160.886 Y126.471 E.00331
; LINE_WIDTH: 0.420179
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.262 Y126.271 F42000
; LINE_WIDTH: 0.50347
G1 F14937.449
M204 S6000
G1 X143.422 Y126.372 E.00372
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.651 Y125.894 E.01449
; LINE_WIDTH: 0.438148
G1 X142.956 Y126.083 E.00609
; LINE_WIDTH: 0.462572
G1 X143.262 Y126.271 E.00645
G1 X142.837 Y125.739 E.01224
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00981
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.12 J-13.817 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.062 J-17.453 E.05467
G1 X164.025 Y125.889 E.01828
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.807 Y125.265 E.00322
G1 X159.93 Y125.292 E.01424
G1 X144.074 Y125.292 E.25747
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420078
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.641 J-13.522 E.06694
G1 X160.221 Y128.012 E.25436
G2 X162.917 Y126.297 I-8.858 J-16.898 E.05196
G1 X163.626 Y125.703 E.01503
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
M73 P37 R14
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.007 Y125.609 E.00756
G1 X160.706 Y125.691 E.00506
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00414
G1 X143.544 Y125.37 E.00629
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z.6 F42000
G1 X146.057 Y104.126 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 193
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X140.571 Y110.099 Z.6 F42000
G1 X91.755 Y171.449 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X91.451 Y171.248 I-.3 J.124 E.02888
G1 X91.475 Y171.249 E.00042
G3 X91.726 Y171.395 I-.02 J.324 E.00528
M204 S250
G1 X92.135 Y171.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.135 Y171.289 E.00019
G3 X91.44 Y170.834 I-.681 J.283 E.06096
G1 X91.503 Y170.836 E.00102
G3 X92.065 Y171.16 I-.05 J.736 E.01091
G1 X92.104 Y171.225 E.00124
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.135 Y171.289 E-.02661
G1 X92.184 Y171.427 E-.05581
G1 X92.198 Y171.574 E-.05597
G1 X92.184 Y171.72 E-.05595
G1 X92.14 Y171.861 E-.056
G1 X92.07 Y171.99 E-.05598
G1 X91.975 Y172.103 E-.05596
G1 X91.86 Y172.195 E-.056
G1 X91.729 Y172.262 E-.05597
G1 X91.587 Y172.302 E-.056
G1 X91.44 Y172.313 E-.056
G1 X91.294 Y172.295 E-.05597
G1 X91.155 Y172.248 E-.05592
G1 X91.027 Y172.174 E-.05603
G1 X91.015 Y172.164 E-.00584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.623 Y171.546 Z.6 F42000
G1 X116.32 Y170.11 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.304 Y170.143 E.00064
G3 X114.824 Y171.147 I-1.513 J-.637 E.03302
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.641 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.641 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.398 Y169.84 I-1.641 J-.033 E.00529
G1 X116.337 Y170.052 E.00386
M204 S250
G1 X115.923 Y169.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X114.814 Y170.734 I-1.128 J-.475 E.02299
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.945 Y169.929 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X115.815 Y170.196 E-.11275
G1 X115.664 Y170.379 E-.09016
G1 X115.481 Y170.53 E-.09016
G1 X115.272 Y170.642 E-.09015
G1 X115.045 Y170.711 E-.09015
G1 X114.814 Y170.734 E-.0882
G1 X114.292 Y170.734 E-.19844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.248 Y165.005 Z.6 F42000
G1 X96.355 Y150.364 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.251 J1.957 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.334 J-.234 E.01041
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12441
G1 X95.957 Y150.672 E-.07655
G1 X95.821 Y150.821 E-.07655
G1 X95.649 Y151.07 E-.11502
G1 X95.461 Y151.018 E-.07433
G1 X95.461 Y150.549 E-.17791
G1 X95.477 Y150.423 E-.0484
G1 X95.52 Y150.331 E-.03875
G1 X95.573 Y150.279 E-.02807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.205 Y150.257 Z.6 F42000
G1 X116.572 Y150.218 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X116.757 Y150.549 I-.165 J.309 E.00699
G1 X116.757 Y151.018 E.00818
G1 X116.568 Y151.07 E.00342
G2 X115.862 Y150.364 I-1.957 J1.252 E.01756
G1 X115.915 Y150.176 E.00342
G3 X116.425 Y150.178 I.234 J5.167 E.00891
G3 X116.516 Y150.195 I-.018 J.35 E.00163
; WIPE_START
G1 X116.677 Y150.304 E-.07358
G1 X116.74 Y150.423 E-.0515
G1 X116.757 Y150.549 E-.04841
G1 X116.757 Y151.018 E-.17793
G1 X116.568 Y151.07 E-.07434
G1 X116.396 Y150.821 E-.11503
G1 X116.261 Y150.672 E-.07654
G1 X116.111 Y150.536 E-.07659
G1 X115.968 Y150.437 E-.06607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.195 Y158.066 Z.6 F42000
G1 X116.568 Y170.577 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.331 J.234 E.01041
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X116.757 Y170.629 E-.08417
G1 X116.757 Y171.098 E-.1779
G1 X116.74 Y171.224 E-.04841
G1 X116.697 Y171.316 E-.03871
G1 X116.601 Y171.412 E-.05141
G1 X116.509 Y171.455 E-.03869
G1 X116.383 Y171.472 E-.0485
G1 X115.915 Y171.472 E-.1779
G1 X115.862 Y171.283 E-.07434
G1 X115.906 Y171.253 E-.01999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z.6 F42000
G1 X96.355 Y171.283 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00341
G3 X95.708 Y171.455 I-.234 J-2.333 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00818
G1 X95.649 Y170.577 E.00342
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.736 J-1.179 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08366
G1 X95.835 Y171.472 E-.17787
G1 X95.708 Y171.455 E-.04849
G1 X95.616 Y171.412 E-.03866
G1 X95.52 Y171.316 E-.05144
G1 X95.477 Y171.224 E-.03867
G1 X95.461 Y171.098 E-.04846
G1 X95.461 Y170.629 E-.17793
G1 X95.649 Y170.577 E-.07434
G1 X95.677 Y170.624 E-.02048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.127 Y165.281 Z.6 F42000
G1 X116.839 Y149.879 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X117.185 Y150.539 I-.432 J.647 E.01356
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.004 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.005 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.464 Y149.751 E.36037
G3 X116.788 Y149.848 I-.057 J.776 E.00596
M204 S250
G1 X117.072 Y149.537 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.249 Y149.683 E.00373
G3 X117.599 Y150.529 I-.843 J.844 E.01525
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.501 Y149.338 E.33592
G3 X117.021 Y149.506 I-.095 J1.189 E.00895
; WIPE_START
M204 S6000
G1 X117.249 Y149.683 E-.10973
G1 X117.398 Y149.863 E-.08861
G1 X117.508 Y150.068 E-.08866
G1 X117.576 Y150.291 E-.08857
G1 X117.599 Y150.529 E-.0906
G1 X117.599 Y151.302 E-.29384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.29 Y150.39 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136564
G1 F15000
M204 S6000
G3 X116.542 Y150.631 I-.051 J.306 E.00173
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.444698
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.807 J1.146 E.00506
; LINE_WIDTH: 0.407893
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00483
; LINE_WIDTH: 0.405762
G1 X116.767 Y170.107 E.00313
; LINE_WIDTH: 0.444726
G3 X116.717 Y170.396 I-5.996 J-.881 E.00506
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.13092
G1 F15000
M204 S6000
G3 X116.301 Y171.257 I-.319 J-.047 E.0017
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.444731
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.159 J-5.877 E.00506
; LINE_WIDTH: 0.405779
G1 X115.194 Y171.505 E.00313
; LINE_WIDTH: 0.346464
G1 X114.829 Y171.524 E.00484
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407938
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444729
G3 X96.536 Y171.432 I.872 J-5.94 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125596
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.048 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.4447
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.896 J-1.162 E.00506
; LINE_WIDTH: 0.407891
G1 X95.429 Y169.926 E.00286
; LINE_WIDTH: 0.346463
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405772
G1 X95.451 Y151.54 E.00313
; LINE_WIDTH: 0.444713
G3 X95.5 Y151.251 I5.924 J.87 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125599
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.048 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.444734
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.158 J5.875 E.00506
; LINE_WIDTH: 0.407945
G1 X97.006 Y150.143 E.00286
; LINE_WIDTH: 0.346464
G1 X97.388 Y150.124 E.00507
G1 X114.829 Y150.124 E.23095
G1 X115.194 Y150.142 E.00484
; LINE_WIDTH: 0.405783
G1 X115.392 Y150.166 E.00312
; LINE_WIDTH: 0.444718
G3 X115.681 Y150.215 I-.873 J5.949 E.00506
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z.6 F42000
G1 X164.789 Y153.441 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.163 Y153.506 E.00616
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03759
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.163 Y153.506 E-.14725
G1 X164.793 Y155.076 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.444 Z.6 F42000
G1 X165.097 Y132.924 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03674
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
M73 P38 R14
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.687 Z.6 F42000
G1 X128.322 Y128.959 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X128.326 Y128.975 E.0003
G3 X128.017 Y128.601 I-.321 J-.049 E.02607
G1 X128.041 Y128.603 E.00042
G3 X128.32 Y128.845 I-.036 J.323 E.00685
G1 X128.321 Y128.899 E.00094
M204 S250
G1 X128.738 Y128.938 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.743 Y128.963 E.00042
G3 X128.03 Y128.188 I-.737 J-.038 E.05622
G1 X128.093 Y128.192 E.00102
G3 X128.736 Y128.816 I-.086 J.733 E.01563
G1 X128.737 Y128.878 E.00102
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.743 Y128.963 E-.03249
G1 X128.718 Y129.109 E-.05614
G1 X128.667 Y129.247 E-.05595
G1 X128.59 Y129.373 E-.056
G1 X128.49 Y129.481 E-.05601
G1 X128.371 Y129.567 E-.05595
G1 X128.236 Y129.628 E-.05595
G1 X128.093 Y129.66 E-.05599
G1 X127.946 Y129.664 E-.05596
G1 X127.8 Y129.639 E-.05598
G1 X127.663 Y129.585 E-.05601
G1 X127.54 Y129.505 E-.05597
G1 X127.434 Y129.402 E-.05597
G1 X127.352 Y129.281 E-.05562
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 3/72
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.977 J.726 P1  F42000
G1 X149.83 Y99.054 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.741 Y98.754 I.35 J-.268 E.00559
G1 X149.741 Y86.399 E.21574
G3 X150.212 Y85.927 I.439 J-.032 E.01321
G1 X162.568 Y85.927 E.21574
G1 X162.767 Y85.959 E.00352
G3 X163.039 Y86.399 I-.167 J.408 E.00966
G1 X163.039 Y98.754 E.21574
G3 X162.568 Y99.226 I-.439 J.032 E.01321
G1 X150.212 Y99.226 E.21574
G3 X149.87 Y99.099 I-.032 J-.439 E.00657
M204 S10000
G1 X149.482 Y99.32 F42000
G1 F6000
M204 S6000
G1 X149.482 Y99.308 E.00021
G3 X149.36 Y99.087 I.72 J-.543 E.00441
G1 X149.312 Y98.788 E.00529
G1 X149.312 Y86.365 E.21691
G1 X149.36 Y86.066 E.00529
G3 X149.879 Y85.546 I.842 J.322 E.01321
G1 X150.178 Y85.499 E.00529
G1 X162.602 Y85.499 E.21692
G1 X162.901 Y85.546 E.00529
G3 X163.421 Y86.066 I-.322 J.842 E.01321
G1 X163.468 Y86.365 E.00529
G1 X163.468 Y98.788 E.21692
G1 X163.421 Y99.087 E.00529
G3 X162.901 Y99.607 I-.842 J-.322 E.01321
G1 X162.602 Y99.654 E.00529
G1 X150.178 Y99.654 E.21691
G1 X149.879 Y99.607 E.00529
G3 X149.659 Y99.485 I.322 J-.842 E.00441
G1 X149.526 Y99.361 E.00318
M204 S250
G1 X149.189 Y99.612 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.136 Y99.559 E.00122
G1 X148.961 Y99.217 E.00624
G1 X148.899 Y98.802 E.0068
G1 X148.899 Y86.35 E.2022
G1 X148.961 Y85.936 E.0068
G1 X149.136 Y85.594 E.00624
G1 X149.408 Y85.322 E.00624
G1 X149.75 Y85.148 E.00624
G1 X150.164 Y85.085 E.0068
G1 X162.616 Y85.085 E.2022
G1 X162.66 Y85.089 E.00071
G1 X163.03 Y85.148 E.00609
G1 X163.373 Y85.322 E.00624
G1 X163.644 Y85.594 E.00624
G1 X163.819 Y85.936 E.00624
G1 X163.881 Y86.35 E.0068
G1 X163.881 Y98.802 E.2022
G1 X163.819 Y99.217 E.0068
G1 X163.644 Y99.559 E.00624
G1 X163.373 Y99.831 E.00624
G1 X163.03 Y100.005 E.00624
G1 X162.616 Y100.068 E.0068
G1 X150.164 Y100.068 E.2022
G1 X149.75 Y100.005 E.0068
G1 X149.408 Y99.831 E.00624
G1 X149.232 Y99.655 E.00404
; WIPE_START
M204 S6000
G1 X149.136 Y99.559 E-.05143
G1 X148.961 Y99.217 E-.14598
G1 X148.899 Y98.802 E-.15921
G1 X148.899 Y97.741 E-.40338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 3 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.7
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; object ids of this layer3 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.913 Y98.644 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42468
G1 F15000
M204 S6000
G1 X150.125 Y98.856 E.00492
G1 X150.24 Y98.874 E.00192
G1 X150.713 Y98.874 E.00777
G1 X150.092 Y98.253 E.01442
G1 X150.092 Y97.683 E.00937
G1 X151.283 Y98.874 E.02767
G1 X151.854 Y98.874 E.00937
G1 X150.092 Y97.113 E.04092
G1 X150.092 Y96.543 E.00937
G1 X152.424 Y98.874 E.05417
G1 X152.994 Y98.874 E.00937
G1 X150.092 Y95.973 E.06742
G1 X150.092 Y95.402 E.00937
G1 X153.564 Y98.874 E.08067
G1 X154.135 Y98.874 E.00937
G1 X150.092 Y94.832 E.09392
G1 X150.092 Y94.262 E.00937
G1 X154.705 Y98.874 E.10717
G1 X155.275 Y98.874 E.00937
G1 X150.092 Y93.692 E.12041
G1 X150.092 Y93.121 E.00937
G1 X155.845 Y98.874 E.13366
G1 X156.416 Y98.874 E.00937
G1 X150.092 Y92.551 E.14691
G1 X150.092 Y91.981 E.00937
G1 X156.986 Y98.874 E.16016
G1 X157.556 Y98.874 E.00937
G1 X150.092 Y91.411 E.17341
G1 X150.092 Y90.84 E.00937
G1 X158.126 Y98.874 E.18666
G1 X158.696 Y98.874 E.00937
G1 X150.092 Y90.27 E.19991
G1 X150.092 Y89.7 E.00937
G1 X159.267 Y98.874 E.21316
G1 X159.837 Y98.874 E.00937
G1 X150.092 Y89.13 E.2264
G1 X150.092 Y88.559 E.00937
G1 X160.407 Y98.874 E.23965
G1 X160.977 Y98.874 E.00937
G1 X150.092 Y87.989 E.2529
G1 X150.092 Y87.419 E.00937
G1 X161.548 Y98.874 E.26615
G1 X162.118 Y98.874 E.00937
G1 X150.092 Y86.849 E.2794
G1 X150.092 Y86.426 E.00694
G3 X150.114 Y86.304 I.199 J-.028 E.00207
G1 X162.665 Y98.851 E.29156
G2 X162.688 Y98.727 I-.13 J-.089 E.00214
G1 X162.688 Y98.304 E.00695
G1 X150.663 Y86.279 E.27939
G1 X151.233 Y86.279 E.00937
G1 X162.688 Y97.734 E.26614
G1 X162.688 Y97.163 E.00937
G1 X151.803 Y86.279 E.25289
G1 X152.373 Y86.279 E.00937
G1 X162.688 Y96.593 E.23964
G1 X162.688 Y96.023 E.00937
G1 X152.944 Y86.279 E.22639
G1 X153.514 Y86.279 E.00937
G1 X162.688 Y95.453 E.21315
G1 X162.688 Y94.882 E.00937
G1 X154.084 Y86.279 E.1999
G1 X154.654 Y86.279 E.00937
G1 X162.688 Y94.312 E.18665
G1 X162.688 Y93.742 E.00937
G1 X155.225 Y86.279 E.1734
G1 X155.795 Y86.279 E.00937
G1 X162.688 Y93.172 E.16015
G1 X162.688 Y92.601 E.00937
G1 X156.365 Y86.279 E.1469
G1 X156.935 Y86.279 E.00937
G1 X162.688 Y92.031 E.13365
G1 X162.688 Y91.461 E.00937
G1 X157.506 Y86.279 E.1204
G1 X158.076 Y86.279 E.00937
G1 X162.688 Y90.891 E.10716
G1 X162.688 Y90.321 E.00937
G1 X158.646 Y86.279 E.09391
G1 X159.216 Y86.279 E.00937
G1 X162.688 Y89.75 E.08066
G1 X162.688 Y89.18 E.00937
G1 X159.787 Y86.279 E.06741
G1 X160.357 Y86.279 E.00937
G1 X162.688 Y88.61 E.05416
G1 X162.688 Y88.04 E.00937
G1 X160.927 Y86.279 E.04091
G1 X161.497 Y86.279 E.00937
G1 X162.688 Y87.469 E.02766
G1 X162.688 Y86.899 E.00937
G1 X162.068 Y86.279 E.01441
G1 X162.54 Y86.279 E.00777
G1 X162.656 Y86.297 E.00193
G1 X162.867 Y86.508 E.00491
; OBJECT_ID: 138
; WIPE_START
G1 X162.656 Y86.297 E-.11349
G1 X162.54 Y86.279 E-.04453
G1 X162.068 Y86.279 E-.17968
G1 X162.688 Y86.899 E-.33342
G1 X162.688 Y87.133 E-.08888
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X162.235 Y94.752 Z.7 F42000
G1 X160.492 Y124.036 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z.7 F42000
G1 X146.692 Y107.186 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.113 J-13.398 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.067 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
M73 P39 R14
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.501 J-13.518 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z.7 F42000
G1 X161.25 Y107.186 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z.7 F42000
G1 X163.48 Y115.886 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.937 J-13.731 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z.7 F42000
G1 X160.706 Y108.351 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.438 Y125.769 E.01179
G1 X161.099 Y126.008 E.00674
G1 X160.706 Y126.089 E.00651
G1 X144.074 Y126.089 E.27007
G1 X143.658 Y125.998 E.00691
G1 X143.508 Y125.913 E.00281
G1 X143.191 Y125.554 E.00777
G1 X143.077 Y125.093 E.00772
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.155 J-13.224 E.06092
G1 X160.129 Y127.614 E.2512
G2 X163.228 Y125.524 I-8.171 J-15.453 E.0608
G1 X163.228 Y117.939 E.12315
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
; LINE_WIDTH: 0.439465
G1 X161.992 Y125.422 E.0059
; LINE_WIDTH: 0.478415
G1 X161.883 Y125.75 E.00645
; LINE_WIDTH: 0.517365
G1 F14518.91
G1 X161.774 Y126.079 E.007
G1 X162.078 Y125.873 E.00742
; LINE_WIDTH: 0.478415
G1 F15000
G1 X162.381 Y125.666 E.00683
; LINE_WIDTH: 0.420857
G2 X162.829 Y125.341 I-1.491 J-2.522 E.00902
G1 X162.829 Y118.338 E.11397
G1 X162.424 Y118.338 E.00659
G1 X162.158 Y118.249 E.00456
M204 S10000
G1 X162.464 Y125.17 F42000
; LINE_WIDTH: 0.35059
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08594
M204 S10000
G1 X161.275 Y126.418 F42000
; LINE_WIDTH: 0.52579
G1 F14276.367
M204 S6000
G1 X161.724 Y126.113 E.01116
M204 S10000
G1 X159.996 Y126.488 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.074 Y126.488 E.25854
; LINE_WIDTH: 0.443688
G1 X143.773 Y126.446 E.00522
; LINE_WIDTH: 0.474986
G1 X143.472 Y126.404 E.00561
G1 X143.991 Y126.784 E.01188
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01283
G1 X144.85 Y127.215 E.00287
G1 X160.032 Y127.215 E.24652
G1 X160.787 Y126.79 E.01407
; LINE_WIDTH: 0.443678
G1 X161.031 Y126.604 E.00528
; LINE_WIDTH: 0.47602
G1 X161.275 Y126.418 E.00568
G1 X160.746 Y126.487 E.00987
; LINE_WIDTH: 0.41999
G1 X160.056 Y126.488 E.01121
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.883 Y126.851 E.20158
M204 S10000
G1 X143.261 Y126.271 F42000
; LINE_WIDTH: 0.50393
G1 F14923.208
M204 S6000
G1 X143.421 Y126.372 E.00372
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08596
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.651 Y125.895 E.01449
; LINE_WIDTH: 0.438263
G1 X142.956 Y126.083 E.00608
; LINE_WIDTH: 0.462841
G1 X143.261 Y126.271 E.00644
G1 X142.838 Y125.739 E.01222
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00982
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.092 J-13.776 E.07294
G1 X160.323 Y128.411 E.25759
G1 X161.381 Y127.828 E.0196
G2 X163.487 Y126.353 I-11.004 J-17.945 E.04178
G1 X164.025 Y125.889 E.01153
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.815 Y125.26 E.00308
G1 X160.706 Y125.292 E.00185
G1 X144.074 Y125.292 E.27007
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.611 J-13.477 E.06694
G1 X160.226 Y128.012 E.25445
G2 X163.626 Y125.706 I-8.197 J-15.743 E.06687
G1 X163.626 Y117.541 E.13262
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.146 Y125.498 E.00708
G1 X160.942 Y125.642 E.00405
G1 X160.706 Y125.691 E.00391
G1 X144.074 Y125.691 E.27021
G1 X143.824 Y125.636 E.00415
G1 X143.544 Y125.37 E.00628
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z.7 F42000
G1 X146.057 Y104.126 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 193
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X140.571 Y110.099 Z.7 F42000
G1 X91.752 Y171.45 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X91.451 Y171.248 I-.301 J.123 E.02892
G1 X91.469 Y171.248 E.00031
G3 X91.724 Y171.396 I-.017 J.324 E.00535
M204 S250
G1 X92.138 Y171.281 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.132 Y171.29 E.00017
G3 X91.44 Y170.834 I-.682 J.282 E.06099
G1 X91.496 Y170.835 E.00091
G3 X92.063 Y171.162 I-.046 J.736 E.011
G1 X92.106 Y171.23 E.00131
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.132 Y171.29 E-.0247
G1 X92.184 Y171.427 E-.05572
G1 X92.198 Y171.574 E-.056
G1 X92.184 Y171.72 E-.056
G1 X92.14 Y171.861 E-.05594
G1 X92.07 Y171.99 E-.05596
G1 X91.975 Y172.103 E-.05599
G1 X91.86 Y172.195 E-.05598
G1 X91.729 Y172.262 E-.05596
G1 X91.587 Y172.302 E-.05601
G1 X91.44 Y172.313 E-.05596
G1 X91.294 Y172.295 E-.05596
G1 X91.155 Y172.248 E-.05596
G1 X91.027 Y172.174 E-.05601
G1 X91.011 Y172.161 E-.00783
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.619 Y171.544 Z.7 F42000
G1 X116.32 Y170.109 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.304 Y170.143 E.00066
G3 X114.824 Y171.147 I-1.513 J-.637 E.03302
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
M73 P40 R14
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.642 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.642 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.398 Y169.84 I-1.642 J-.033 E.0053
G1 X116.337 Y170.051 E.00384
M204 S250
G1 X115.923 Y169.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X114.814 Y170.734 I-1.128 J-.475 E.02298
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.945 Y169.929 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X115.815 Y170.196 E-.11274
G1 X115.664 Y170.379 E-.09013
G1 X115.481 Y170.53 E-.09015
G1 X115.272 Y170.642 E-.09012
G1 X115.045 Y170.711 E-.0902
G1 X114.814 Y170.734 E-.08819
G1 X114.292 Y170.734 E-.19848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.247 Y165.005 Z.7 F42000
G1 X96.355 Y150.364 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.252 J1.958 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.33 J-.234 E.01041
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12435
G1 X95.957 Y150.672 E-.07661
G1 X95.821 Y150.821 E-.07656
G1 X95.649 Y151.07 E-.115
G1 X95.461 Y151.018 E-.07434
G1 X95.461 Y150.55 E-.17789
G1 X95.477 Y150.423 E-.04847
G1 X95.541 Y150.304 E-.05142
G1 X95.571 Y150.277 E-.01536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.203 Y150.255 Z.7 F42000
G1 X116.572 Y150.218 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X116.757 Y150.549 I-.166 J.31 E.00699
G1 X116.757 Y151.018 E.00817
G1 X116.568 Y151.07 E.00342
G2 X115.862 Y150.364 I-1.959 J1.253 E.01756
G1 X115.915 Y150.176 E.00342
G3 X116.443 Y150.179 I.234 J5.351 E.00922
G3 X116.517 Y150.195 I-.037 J.35 E.00132
; WIPE_START
G1 X116.677 Y150.304 E-.07363
G1 X116.74 Y150.423 E-.05144
G1 X116.757 Y150.549 E-.04845
G1 X116.757 Y151.018 E-.17791
G1 X116.568 Y151.07 E-.07433
G1 X116.396 Y150.821 E-.11498
G1 X116.261 Y150.672 E-.07662
G1 X116.111 Y150.536 E-.07661
G1 X115.968 Y150.437 E-.06603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.195 Y158.066 Z.7 F42000
G1 X116.568 Y170.577 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.33 J.234 E.01042
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X116.757 Y170.629 E-.08419
G1 X116.757 Y171.098 E-.17789
G1 X116.74 Y171.224 E-.04851
G1 X116.677 Y171.343 E-.05139
G1 X116.601 Y171.412 E-.03865
G1 X116.509 Y171.455 E-.03874
G1 X116.383 Y171.472 E-.04843
G1 X115.915 Y171.472 E-.17788
G1 X115.862 Y171.283 E-.07433
G1 X115.906 Y171.253 E-.01998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z.7 F42000
G1 X96.355 Y171.283 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00342
G3 X95.708 Y171.455 I-.234 J-2.33 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00818
G1 X95.649 Y170.577 E.00342
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.736 J-1.179 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08367
G1 X95.835 Y171.472 E-.17788
G1 X95.708 Y171.455 E-.04847
G1 X95.616 Y171.412 E-.03869
G1 X95.52 Y171.316 E-.05135
G1 X95.477 Y171.224 E-.03874
G1 X95.461 Y171.098 E-.04845
G1 X95.461 Y170.629 E-.17792
G1 X95.649 Y170.577 E-.07433
G1 X95.677 Y170.624 E-.0205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.128 Y165.281 Z.7 F42000
G1 X116.838 Y149.882 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.9 Y149.925 E.00133
G3 X117.185 Y150.539 I-.495 J.603 E.01223
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.004 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.004 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.472 Y149.751 E.36053
G1 X116.485 Y149.752 E.00021
G3 X116.774 Y149.84 I-.079 J.776 E.00532
G1 X116.787 Y149.849 E.00028
M204 S250
G1 X117.072 Y149.536 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.246 Y149.686 E.00373
G3 X117.599 Y150.529 I-.851 J.851 E.01521
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.493 Y149.338 E.33578
G3 X117.021 Y149.51 I-.098 J1.2 E.0091
; WIPE_START
M204 S6000
G1 X117.246 Y149.686 E-.10868
G1 X117.398 Y149.863 E-.08847
G1 X117.508 Y150.068 E-.08859
G1 X117.576 Y150.291 E-.08866
G1 X117.599 Y150.529 E-.09058
G1 X117.599 Y151.305 E-.29502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.308 Y150.39 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.139227
G1 F15000
M204 S6000
G3 X116.542 Y150.624 I-.081 J.314 E.00166
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.44474
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.941 J1.169 E.00506
; LINE_WIDTH: 0.407931
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00484
; LINE_WIDTH: 0.405766
G1 X116.767 Y170.107 E.00312
; LINE_WIDTH: 0.444709
G3 X116.717 Y170.396 I-5.79 J-.846 E.00506
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.130899
G1 F15000
M204 S6000
G3 X116.301 Y171.257 I-.319 J-.047 E.0017
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.44472
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.15 J-5.824 E.00506
; LINE_WIDTH: 0.405759
G1 X115.194 Y171.505 E.00312
; LINE_WIDTH: 0.346463
G1 X114.829 Y171.524 E.00484
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407926
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444737
G3 X96.536 Y171.432 I.868 J-5.918 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125574
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.049 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.444723
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.81 J-1.148 E.00506
; LINE_WIDTH: 0.407928
G1 X95.429 Y169.927 E.00286
; LINE_WIDTH: 0.346464
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405775
G1 X95.451 Y151.54 E.00312
; LINE_WIDTH: 0.444717
G3 X95.5 Y151.251 I5.875 J.861 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125604
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.048 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.444733
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.165 J5.915 E.00506
; LINE_WIDTH: 0.407911
G1 X97.006 Y150.143 E.00286
; LINE_WIDTH: 0.346463
G1 X97.388 Y150.124 E.00507
G1 X114.829 Y150.124 E.23095
G1 X115.194 Y150.142 E.00483
; LINE_WIDTH: 0.405763
G1 X115.392 Y150.166 E.00313
; LINE_WIDTH: 0.444727
G3 X115.681 Y150.215 I-.878 J5.975 E.00506
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z.7 F42000
G1 X164.789 Y153.441 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.163 Y153.506 E.00616
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03759
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X145.092 Y172.135 E.02827
G1 X144.524 Y172.216 E.00931
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
M73 P40 R13
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.163 Y153.506 E-.14725
G1 X164.793 Y155.076 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.444 Z.7 F42000
G1 X165.097 Y132.924 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.408 Y133.684 Z.7 F42000
G1 X128.321 Y128.941 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X128.329 Y128.976 E.00062
G3 X128.023 Y128.602 I-.321 J-.05 E.02611
G1 X128.041 Y128.603 E.00032
G3 X128.323 Y128.844 I-.033 J.323 E.00689
G1 X128.322 Y128.881 E.00065
M204 S250
G1 X128.738 Y128.921 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.739 Y129.038 E.00189
G3 X128.037 Y128.188 I-.729 J-.112 E.05507
G1 X128.093 Y128.192 E.00091
G3 X128.745 Y128.862 I-.083 J.733 E.01644
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.739 Y129.038 E-.06664
G1 X128.667 Y129.247 E-.08425
G1 X128.59 Y129.373 E-.05599
G1 X128.49 Y129.481 E-.05595
G1 X128.371 Y129.567 E-.05596
G1 X128.236 Y129.628 E-.05598
G1 X128.093 Y129.66 E-.05598
G1 X127.946 Y129.664 E-.05598
G1 X127.801 Y129.639 E-.05594
G1 X127.663 Y129.585 E-.05601
G1 X127.539 Y129.505 E-.05602
G1 X127.434 Y129.402 E-.05595
G1 X127.361 Y129.295 E-.04935
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 4/72
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I.977 J.726 P1  F42000
G1 X149.793 Y99.088 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.7 Y98.779 I.363 J-.277 E.00577
G1 X149.7 Y86.374 E.21659
G3 X150.188 Y85.887 I.455 J-.032 E.01365
G1 X162.592 Y85.887 E.21659
G3 X163.08 Y86.374 I.032 J.455 E.01365
G1 X163.08 Y98.779 E.21659
G3 X162.592 Y99.266 I-.455 J.032 E.01365
G1 X150.188 Y99.266 E.21659
G3 X149.832 Y99.133 I-.032 J-.455 E.00683
M204 S10000
G1 X149.444 Y99.341 F42000
G1 F6000
M204 S6000
G3 X149.32 Y99.117 I.734 J-.554 E.0045
G1 X149.272 Y98.812 E.00538
G1 X149.272 Y86.34 E.21776
G1 X149.32 Y86.036 E.00538
G3 X149.85 Y85.506 I.859 J.329 E.01348
G1 X150.154 Y85.458 E.00538
G1 X162.626 Y85.458 E.21777
G1 X162.93 Y85.506 E.00538
G3 X163.46 Y86.036 I-.329 J.859 E.01348
G1 X163.509 Y86.34 E.00538
G1 X163.509 Y98.812 E.21776
G1 X163.46 Y99.117 E.00538
G3 X162.93 Y99.647 I-.859 J-.329 E.01348
G1 X162.626 Y99.695 E.00538
G1 X150.154 Y99.695 E.21776
G1 X149.85 Y99.647 E.00538
G3 X149.482 Y99.388 I.329 J-.859 E.00793
M204 S250
G1 X149.145 Y99.64 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.098 Y99.593 E.00108
G1 X148.922 Y99.246 E.00632
G1 X148.858 Y98.827 E.00689
G1 X148.858 Y86.326 E.20299
G1 X148.922 Y85.907 E.00689
G1 X149.098 Y85.56 E.00632
G1 X149.374 Y85.285 E.00632
G1 X149.721 Y85.108 E.00632
G1 X150.14 Y85.045 E.00689
G1 X162.64 Y85.045 E.20299
G3 X162.701 Y85.051 I.009 J.194 E.00099
G1 X163.06 Y85.108 E.0059
G1 X163.407 Y85.285 E.00632
G1 X163.682 Y85.56 E.00632
G1 X163.858 Y85.907 E.00632
G1 X163.922 Y86.326 E.00689
G1 X163.922 Y98.827 E.20299
G1 X163.858 Y99.246 E.00689
G1 X163.682 Y99.593 E.00632
G1 X163.407 Y99.868 E.00632
G1 X163.06 Y100.045 E.00632
G1 X162.64 Y100.108 E.00689
G1 X150.14 Y100.108 E.20299
G1 X149.721 Y100.045 E.00689
G1 X149.374 Y99.868 E.00632
M73 P41 R13
G1 X149.188 Y99.682 E.00427
; WIPE_START
M204 S6000
G1 X149.098 Y99.593 E-.04802
G1 X148.922 Y99.246 E-.14791
G1 X148.858 Y98.827 E-.16115
G1 X148.858 Y97.766 E-.40292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 4 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer4 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X150.067 Y96.992 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X150.067 Y98.706 E.02993
G3 X150.423 Y98.094 I.881 J.104 E.01271
G1 X151.216 Y97.404 E.01835
G1 X151.609 Y96.715 E.01386
G1 X151.7 Y96.025 E.01215
G2 X151.322 Y95.335 I-.982 J.09 E.01413
G1 X150.529 Y94.646 E.01835
G1 X150.136 Y93.956 E.01386
G3 X150.142 Y92.921 I1.694 J-.507 E.01833
G3 X151.216 Y91.887 I3.535 J2.597 E.02617
G1 X151.609 Y91.197 E.01386
G1 X151.7 Y90.507 E.01215
G2 X151.322 Y89.818 I-.982 J.09 E.01413
G1 X150.529 Y89.128 E.01835
G1 X150.136 Y88.438 E.01386
G3 X150.142 Y87.404 I1.694 J-.508 E.01833
G3 X151.282 Y86.253 I54.818 J53.204 E.02829
G1 X154.444 Y86.253 E.0552
G3 X154.081 Y87.059 I-1.009 J.03 E.01597
G1 X153.288 Y87.749 E.01835
G1 X152.895 Y88.438 E.01386
G1 X152.804 Y89.128 E.01215
G2 X153.182 Y89.818 I.982 J-.09 E.01413
G1 X153.975 Y90.507 E.01835
G1 X154.368 Y91.197 E.01386
G1 X154.459 Y91.887 E.01215
G3 X154.081 Y92.577 I-.982 J-.09 E.01413
G1 X153.288 Y93.266 E.01835
G1 X152.895 Y93.956 E.01386
G1 X152.804 Y94.646 E.01215
G2 X153.182 Y95.335 I.982 J-.09 E.01413
G1 X153.975 Y96.025 E.01835
G1 X154.368 Y96.715 E.01386
G1 X154.459 Y97.404 E.01215
G3 X154.081 Y98.094 I-.982 J-.09 E.01413
G1 X153.222 Y98.9 E.02057
G1 X155.578 Y98.9 E.04114
G3 X155.941 Y98.094 I1.009 J-.03 E.01597
G1 X156.734 Y97.404 E.01835
G1 X157.127 Y96.715 E.01386
G1 X157.218 Y96.025 E.01215
G2 X156.84 Y95.335 I-.982 J.09 E.01413
G1 X156.046 Y94.646 E.01835
G1 X155.653 Y93.956 E.01386
G1 X155.562 Y93.266 E.01215
G3 X155.941 Y92.577 I.982 J.09 E.01413
G1 X156.734 Y91.887 E.01835
G1 X157.127 Y91.197 E.01386
G1 X157.218 Y90.507 E.01215
G2 X156.84 Y89.818 I-.982 J.09 E.01413
G1 X156.046 Y89.128 E.01835
G1 X155.653 Y88.438 E.01386
G1 X155.562 Y87.749 E.01215
G3 X155.941 Y87.059 I.982 J.09 E.01413
G1 X156.8 Y86.253 E.02057
G1 X159.961 Y86.253 E.0552
G3 X159.599 Y87.059 I-1.009 J.03 E.01597
G1 X158.805 Y87.749 E.01835
G1 X158.412 Y88.438 E.01386
G1 X158.321 Y89.128 E.01215
G2 X158.699 Y89.818 I.982 J-.09 E.01413
G1 X159.493 Y90.507 E.01835
G1 X159.886 Y91.197 E.01386
G1 X159.977 Y91.887 E.01215
G3 X159.599 Y92.577 I-.982 J-.09 E.01413
G1 X158.805 Y93.266 E.01835
G1 X158.412 Y93.956 E.01386
G1 X158.321 Y94.646 E.01215
G2 X158.699 Y95.335 I.982 J-.09 E.01413
G1 X159.493 Y96.025 E.01835
G1 X159.886 Y96.715 E.01386
G1 X159.977 Y97.404 E.01215
G3 X159.599 Y98.094 I-.982 J-.09 E.01413
G1 X158.739 Y98.9 E.02057
G1 X161.095 Y98.9 E.04114
G3 X161.458 Y98.094 I1.009 J-.03 E.01597
G1 X162.251 Y97.404 E.01835
G1 X162.645 Y96.715 E.01386
G2 X162.639 Y95.68 I-1.698 J-.507 E.01833
G2 X161.564 Y94.646 I-3.535 J2.597 E.02617
G1 X161.171 Y93.956 E.01386
G1 X161.08 Y93.266 E.01215
G3 X161.458 Y92.577 I.982 J.09 E.01413
G1 X162.251 Y91.887 E.01835
G1 X162.645 Y91.197 E.01386
G2 X162.639 Y90.163 I-1.698 J-.507 E.01833
G2 X161.564 Y89.128 I-3.535 J2.597 E.02617
G1 X161.171 Y88.438 E.01386
G1 X161.08 Y87.749 E.01215
G3 X161.458 Y87.059 I.982 J.09 E.01413
G1 X162.318 Y86.253 E.02057
G3 X162.695 Y86.285 I.123 J.793 E.00667
G1 X162.713 Y87.613 E.02319
; OBJECT_ID: 138
; WIPE_START
G1 X162.695 Y86.285 E-.50471
G1 X162.318 Y86.253 E-.14381
G1 X162.104 Y86.454 E-.11149
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X161.777 Y94.079 Z.8 F42000
G1 X160.492 Y124.036 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z.8 F42000
G1 X146.692 Y107.186 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.133 J-13.427 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.066 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.518 J-13.543 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.436 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z.8 F42000
G1 X161.25 Y107.186 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z.8 F42000
G1 X163.48 Y115.886 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.953 J-13.754 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.217 Y109.095 Z.8 F42000
G1 X161.91 Y108.395 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X161.073 Y108.395 E.01461
G1 X161.073 Y108.837 E.00773
G1 X160.859 Y108.837 E.00374
G2 X161.01 Y109.19 I.229 J.11 E.00759
G1 X161.403 Y109.88 E.01386
G1 X161.494 Y110.569 E.01215
G3 X160.859 Y111.483 I-1.542 J-.395 E.01985
G1 X160.859 Y114.576 E.054
G1 X161.01 Y114.707 E.00351
G1 X161.403 Y115.397 E.01386
G1 X161.494 Y116.087 E.01215
G3 X160.859 Y117 I-1.542 J-.395 E.01985
G1 X160.859 Y120.093 E.054
G1 X161.01 Y120.225 E.00351
G1 X161.403 Y120.915 E.01386
G1 X161.494 Y121.604 E.01215
G3 X160.859 Y122.518 I-1.542 J-.395 E.01985
G1 X160.859 Y124.232 E.02993
M204 S10000
G1 X164.072 Y123.58 F42000
G1 F16200
M204 S6000
G1 X164.072 Y125.294 E.02993
G2 X163.082 Y124.363 I-3.192 J2.403 E.02384
G1 X162.689 Y123.674 E.01386
G1 X162.598 Y122.984 E.01215
G1 X162.695 Y122.639 E.00625
G3 X163.769 Y121.604 I3.535 J2.596 E.02617
G1 X164.072 Y121.074 E.01067
G1 X164.072 Y119.777 E.02265
G2 X163.082 Y118.846 I-3.192 J2.403 E.02384
G1 X162.689 Y118.156 E.01386
G3 X162.716 Y117.095 I1.312 J-.497 E.01901
G1 X162.272 Y117.095 E.00776
G1 X162.272 Y112.458 E.08096
G1 X162.665 Y112.458 E.00686
G3 X162.695 Y111.604 I1.011 J-.392 E.01534
G3 X163.769 Y110.569 I3.535 J2.596 E.02617
G1 X164.072 Y110.038 E.01067
G1 X164.072 Y108.741 E.02265
G2 X163.082 Y107.81 I-3.192 J2.403 E.02384
G1 X162.689 Y107.121 E.01386
G1 X162.598 Y106.431 E.01215
G1 X162.695 Y106.086 E.00625
G3 X163.719 Y105.095 I3.385 J2.474 E.02502
G1 X164.072 Y105.095 E.00615
G1 X164.072 Y106.457 E.02378
; WIPE_START
G1 X164.072 Y105.095 E-.5175
G1 X163.719 Y105.095 E-.13389
G1 X163.504 Y105.282 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.457 Y104.126 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
M73 P42 R13
G1 F15000
M204 S6000
G1 X158.723 Y104.126 E.0074
; WIPE_START
G1 X160.723 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.706 Y108.351 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
M204 S10000
G1 X156.35 Y108.308 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X157.508 Y108.308 E.02021
G1 X157.508 Y107.866 E.00773
G1 X157.622 Y107.866 E.002
G1 X157.171 Y107.121 E.0152
G1 X157.08 Y106.431 E.01215
G3 X157.722 Y105.512 I1.548 J.398 E.01999
G1 X157.722 Y105.095 E.00729
G1 X155.965 Y105.095 E.03068
G1 X155.88 Y105.396 E.00547
G3 X154.805 Y106.431 I-3.535 J-2.597 E.02617
G1 X154.412 Y107.121 E.01386
G1 X154.321 Y107.81 E.01215
G2 X154.543 Y108.308 I.683 J-.006 E.00978
G1 X152.619 Y108.308 E.03359
G3 X151.653 Y107.121 I1.211 J-1.971 E.02723
G1 X151.562 Y106.431 E.01215
G1 X151.659 Y106.086 E.00625
G3 X152.684 Y105.095 I3.385 J2.474 E.02502
G1 X150.447 Y105.095 E.03906
G1 X150.362 Y105.396 E.00547
G3 X149.288 Y106.431 I-3.535 J-2.596 E.02617
G1 X148.895 Y107.121 E.01386
G1 X148.804 Y107.81 E.01215
G2 X149.025 Y108.308 I.683 J-.006 E.00978
G1 X147.311 Y108.308 E.02993
M204 S10000
G1 X146.906 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.074 Y108.351 E.02508
; WIPE_START
G1 X146.074 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.323 Y104.126 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X146.057 Y104.126 E.0074
; WIPE_START
G1 X144.057 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.885 Y111.668 Z.8 F42000
G1 X140.709 Y125.678 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X140.709 Y125.91 E.00406
G2 X141.854 Y126.849 I9.932 J-10.955 E.02587
G1 X142.092 Y126.432 E.00837
G1 X142.183 Y125.743 E.01215
G2 X141.805 Y125.053 I-.982 J.09 E.01413
G1 X141.011 Y124.363 E.01835
G1 X140.709 Y123.832 E.01067
G1 X140.709 Y122.536 E.02264
G3 X141.699 Y121.604 I3.193 J2.404 E.02385
G1 X142.092 Y120.915 E.01386
G1 X142.183 Y120.225 E.01215
G2 X141.805 Y119.535 I-.982 J.09 E.01413
G1 X141.011 Y118.846 E.01835
G1 X140.709 Y118.315 E.01067
G1 X140.709 Y117.095 E.02129
G1 X142.509 Y117.095 E.03143
G1 X142.509 Y112.458 E.08096
G1 X140.709 Y112.458 E.03143
G1 X140.709 Y111.5 E.01672
G3 X141.699 Y110.569 I3.193 J2.404 E.02385
G1 X142.092 Y109.88 E.01386
G1 X142.183 Y109.19 E.01215
G2 X141.805 Y108.5 I-.982 J.09 E.01413
G1 X141.011 Y107.81 E.01835
G1 X140.709 Y107.279 E.01067
G1 X140.709 Y105.983 E.02264
G3 X141.649 Y105.095 I3.043 J2.281 E.02269
G1 X142.322 Y105.095 E.01175
G1 X142.322 Y108.395 E.05762
G1 X143.707 Y108.395 E.0242
G1 X143.707 Y108.837 E.00773
G1 X143.922 Y108.837 E.00374
G1 X143.922 Y111.817 E.05202
G1 X143.77 Y111.949 E.00351
G1 X143.377 Y112.638 E.01386
G1 X143.286 Y113.328 E.01215
G2 X143.922 Y114.242 I1.542 J-.395 E.01985
G1 X143.922 Y117.335 E.054
G1 X143.77 Y117.466 E.00351
G1 X143.377 Y118.156 E.01386
G1 X143.286 Y118.846 E.01215
G2 X143.922 Y119.759 I1.542 J-.395 E.01985
G1 X143.922 Y122.852 E.054
G1 X143.77 Y122.984 E.00351
G1 X143.377 Y123.674 E.01386
G1 X143.286 Y124.363 E.01215
G2 X143.664 Y125.053 I.982 J-.09 E.01413
G1 X144.457 Y125.743 E.01835
G1 X144.851 Y126.432 E.01386
G1 X144.942 Y127.122 E.01215
G3 X144.059 Y128.25 I-1.846 J-.534 E.02563
G1 X144.448 Y128.458 E.0077
G1 X146.057 Y128.458 E.0281
G3 X146.423 Y127.812 I.926 J.098 E.01334
G1 X147.216 Y127.122 E.01835
G1 X147.609 Y126.432 E.01386
G1 X147.7 Y125.743 E.01215
G2 X147.479 Y125.245 I-.683 J.006 E.00978
G1 X149.403 Y125.245 E.03359
G3 X150.459 Y127.122 I-1.12 J1.866 E.03934
G3 X150.081 Y127.812 I-.982 J-.09 E.01413
G1 X149.338 Y128.458 E.0172
G1 X151.575 Y128.458 E.03906
G3 X151.941 Y127.812 I.926 J.098 E.01334
G1 X152.734 Y127.122 E.01835
G1 X153.127 Y126.432 E.01386
G1 X153.218 Y125.743 E.01215
G2 X152.996 Y125.245 I-.683 J.006 E.00978
G1 X154.92 Y125.245 E.03359
G3 X155.977 Y127.122 I-1.12 J1.866 E.03934
G3 X155.599 Y127.812 I-.982 J-.09 E.01413
G1 X154.855 Y128.458 E.0172
G1 X157.092 Y128.458 E.03906
G3 X157.458 Y127.812 I.926 J.098 E.01334
G1 X158.252 Y127.122 E.01835
G1 X158.645 Y126.432 E.01386
G1 X158.736 Y125.743 E.01215
G2 X158.514 Y125.245 I-.683 J.006 E.00978
G1 X160.438 Y125.245 E.03359
G3 X161.494 Y127.122 I-1.12 J1.866 E.03934
G3 X161.116 Y127.812 I-.982 J-.09 E.01413
G1 X160.335 Y128.458 E.0177
G1 X158.727 Y128.458 E.02808
; OBJECT_ID: 193
; WIPE_START
G1 X160.335 Y128.458 E-.61118
G1 X160.637 Y128.208 E-.14882
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X154.171 Y132.264 Z.8 F42000
G1 X91.747 Y171.417 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X91.522 Y171.254 I-.285 J.157 E.03069
G1 X91.547 Y171.26 E.00045
G3 X91.713 Y171.367 I-.085 J.314 E.0035
M204 S250
G1 X92.14 Y171.286 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.135 Y171.288 E.00009
G3 X91.367 Y170.84 I-.682 J.285 E.05989
G3 X91.489 Y170.835 I.082 J.606 E.00199
G3 X92.066 Y171.16 I-.035 J.738 E.01115
G1 X92.11 Y171.234 E.0014
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.135 Y171.288 E-.02283
G1 X92.184 Y171.427 E-.05582
G1 X92.198 Y171.574 E-.05597
G1 X92.184 Y171.72 E-.05598
G1 X92.14 Y171.861 E-.05598
G1 X92.07 Y171.99 E-.05599
G1 X91.975 Y172.103 E-.05599
G1 X91.86 Y172.195 E-.05592
G1 X91.729 Y172.262 E-.05599
G1 X91.514 Y172.311 E-.08382
G1 X91.367 Y172.308 E-.05596
G1 X91.223 Y172.275 E-.056
G1 X91.089 Y172.214 E-.05592
G1 X91.008 Y172.156 E-.03782
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.617 Y171.561 Z.8 F42000
G1 X116.291 Y170.179 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.153 Y170.422 E.00487
G3 X114.824 Y171.147 I-1.362 J-.916 E.02748
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.641 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.641 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.312 Y170.123 I-1.641 J-.033 E.01048
M204 S250
G1 X115.923 Y169.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X114.814 Y170.734 I-1.128 J-.475 E.02298
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.945 Y169.929 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X115.815 Y170.196 E-.11273
G1 X115.664 Y170.379 E-.09017
G1 X115.481 Y170.53 E-.09015
G1 X115.272 Y170.642 E-.09015
G1 X115.045 Y170.711 E-.09015
G1 X114.814 Y170.734 E-.08819
G1 X114.292 Y170.734 E-.19846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.248 Y165.005 Z.8 F42000
G1 X96.355 Y150.364 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.253 J1.959 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.332 J-.234 E.01041
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12435
G1 X95.957 Y150.672 E-.07659
G1 X95.821 Y150.821 E-.07659
G1 X95.649 Y151.07 E-.115
G1 X95.461 Y151.018 E-.07433
G1 X95.461 Y150.55 E-.1779
G1 X95.477 Y150.423 E-.04844
G1 X95.52 Y150.331 E-.0387
G1 X95.573 Y150.279 E-.02809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.205 Y150.257 Z.8 F42000
G1 X116.572 Y150.218 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X116.757 Y150.549 I-.166 J.31 E.00699
G1 X116.757 Y151.018 E.00817
G1 X116.568 Y151.07 E.00342
G2 X115.862 Y150.364 I-1.957 J1.252 E.01756
G1 X115.915 Y150.176 E.00342
G3 X116.434 Y150.178 I.234 J5.268 E.00908
G1 X116.443 Y150.179 E.00014
G3 X116.517 Y150.195 I-.037 J.35 E.00132
; WIPE_START
G1 X116.677 Y150.304 E-.07357
G1 X116.74 Y150.423 E-.0515
G1 X116.757 Y150.549 E-.04845
G1 X116.757 Y151.018 E-.17791
G1 X116.568 Y151.07 E-.07433
G1 X116.396 Y150.821 E-.11501
G1 X116.261 Y150.672 E-.07654
G1 X116.111 Y150.536 E-.07664
G1 X115.968 Y150.437 E-.06605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.195 Y158.066 Z.8 F42000
G1 X116.568 Y170.577 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.331 J.234 E.01041
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.253 J-1.958 E.01651
; WIPE_START
G1 X116.757 Y170.629 E-.08418
G1 X116.757 Y171.098 E-.1779
G1 X116.74 Y171.224 E-.04843
G1 X116.697 Y171.316 E-.0387
G1 X116.601 Y171.412 E-.05145
G1 X116.509 Y171.455 E-.0387
G1 X116.383 Y171.472 E-.04842
G1 X115.915 Y171.472 E-.17789
G1 X115.862 Y171.283 E-.07434
G1 X115.906 Y171.253 E-.01998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z.8 F42000
G1 X96.355 Y171.283 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00342
G3 X95.708 Y171.455 I-.234 J-2.331 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00817
G1 X95.649 Y170.577 E.00342
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.735 J-1.178 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08367
G1 X95.835 Y171.472 E-.1779
G1 X95.708 Y171.455 E-.04842
G1 X95.616 Y171.412 E-.03867
G1 X95.52 Y171.316 E-.05147
G1 X95.477 Y171.224 E-.03872
G1 X95.461 Y171.098 E-.04843
G1 X95.461 Y170.629 E-.17791
G1 X95.649 Y170.577 E-.07433
G1 X95.677 Y170.624 E-.02049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.128 Y165.281 Z.8 F42000
G1 X116.838 Y149.882 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X117.185 Y150.539 I-.438 J.652 E.01353
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.005 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.004 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.455 Y149.75 E.36023
G3 X116.786 Y149.85 I-.056 J.784 E.00609
M204 S250
G1 X117.071 Y149.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.246 Y149.686 E.00375
G3 X117.599 Y150.529 I-.85 J.851 E.01521
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.476 Y149.337 E.3355
G3 X117.021 Y149.51 I-.08 J1.2 E.00938
; WIPE_START
M204 S6000
G1 X117.246 Y149.686 E-.10877
G1 X117.398 Y149.863 E-.08845
G1 X117.508 Y150.068 E-.08863
G1 X117.576 Y150.291 E-.08859
G1 X117.599 Y150.529 E-.09062
G1 X117.599 Y151.305 E-.29494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.301 Y150.39 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.138801
G1 F15000
M204 S6000
G3 X116.542 Y150.624 I-.071 J.314 E.00169
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.444703
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.945 J1.169 E.00506
; LINE_WIDTH: 0.407916
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00484
; LINE_WIDTH: 0.405765
G1 X116.767 Y170.107 E.00312
; LINE_WIDTH: 0.444719
G3 X116.717 Y170.396 I-5.935 J-.87 E.00506
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.13125
G1 F15000
M204 S6000
G3 X116.308 Y171.257 I-.308 J-.035 E.00169
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.444751
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.155 J-5.855 E.00506
; LINE_WIDTH: 0.40579
G1 X115.194 Y171.505 E.00313
; LINE_WIDTH: 0.346463
G1 X114.829 Y171.524 E.00484
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407936
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444732
G3 X96.536 Y171.432 I.866 J-5.902 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125579
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.049 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.444744
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.838 J-1.152 E.00506
; LINE_WIDTH: 0.407948
G1 X95.429 Y169.927 E.00286
; LINE_WIDTH: 0.346464
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405783
G1 X95.451 Y151.54 E.00313
; LINE_WIDTH: 0.444728
G3 X95.5 Y151.251 I6.035 J.888 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125581
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.048 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.444725
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.162 J5.901 E.00506
; LINE_WIDTH: 0.407923
G1 X97.006 Y150.143 E.00286
; LINE_WIDTH: 0.346464
G1 X97.388 Y150.124 E.00507
G1 X114.829 Y150.124 E.23095
G1 X115.194 Y150.142 E.00484
; LINE_WIDTH: 0.405773
G1 X115.392 Y150.166 E.00313
; LINE_WIDTH: 0.444717
G3 X115.681 Y150.215 I-.873 J5.944 E.00506
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z.8 F42000
G1 X164.789 Y153.441 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.106 Y153.496 E.00523
G1 X165.163 Y153.506 E.00093
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.106 Y153.496 E-.12576
G1 X165.163 Y153.506 E-.0218
G1 X164.794 Y155.075 E-.61245
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.443 Z.8 F42000
G1 X165.097 Y132.924 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03674
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
M73 P43 R13
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.689 Z.8 F42000
G1 X128.322 Y128.969 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X128.32 Y128.975 E.00011
G3 X128.036 Y128.602 I-.322 J-.049 E.02661
G1 X128.073 Y128.609 E.00065
G3 X128.314 Y128.847 I-.075 J.317 E.00621
G1 X128.318 Y128.909 E.00109
M204 S250
G1 X128.738 Y128.948 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.74 Y128.963 E.00025
G3 X127.943 Y128.189 I-.738 J-.037 E.05502
G3 X128.093 Y128.192 I.053 J.969 E.00243
G3 X128.718 Y128.744 I-.091 J.734 E.01438
G1 X128.732 Y128.888 E.00236
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.74 Y128.963 E-.02859
G1 X128.696 Y129.179 E-.08378
G1 X128.632 Y129.312 E-.05605
G1 X128.543 Y129.43 E-.05596
G1 X128.433 Y129.527 E-.05597
G1 X128.305 Y129.601 E-.05596
G1 X128.165 Y129.648 E-.05598
G1 X128.019 Y129.666 E-.056
G1 X127.8 Y129.639 E-.08376
G1 X127.663 Y129.585 E-.05599
G1 X127.54 Y129.505 E-.05598
G1 X127.434 Y129.402 E-.05595
G1 X127.351 Y129.28 E-.056
G1 X127.347 Y129.271 E-.00401
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 5/72
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.977 J.726 P1  F42000
G1 X149.755 Y99.122 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.66 Y98.803 I.376 J-.287 E.00594
G1 X149.66 Y86.35 E.21744
G3 X150.164 Y85.846 I.471 J-.032 E.01409
G1 X162.617 Y85.846 E.21744
G1 X162.826 Y85.879 E.00369
G3 X163.121 Y86.35 I-.177 J.438 E.01037
G1 X163.121 Y98.803 E.21744
G3 X162.617 Y99.307 I-.471 J.032 E.01409
G1 X150.164 Y99.307 E.21744
G3 X149.795 Y99.167 I-.032 J-.471 E.0071
M204 S10000
G1 X149.407 Y99.375 F42000
G1 F6000
M204 S6000
G3 X149.28 Y99.146 I.749 J-.564 E.00459
G1 X149.231 Y98.837 E.00547
G1 X149.231 Y86.316 E.21861
G1 X149.28 Y86.007 E.00547
G3 X149.821 Y85.467 I.876 J.335 E.01374
G1 X150.13 Y85.418 E.00547
G1 X162.677 Y85.422 E.21908
G3 X163.381 Y85.772 I-.035 J.952 E.01414
G1 X163.5 Y86.007 E.0046
G1 X163.549 Y86.316 E.00547
G1 X163.549 Y98.837 E.21861
G1 X163.5 Y99.146 E.00547
G3 X162.96 Y99.686 I-.876 J-.335 E.01374
G1 X162.65 Y99.735 E.00547
G1 X150.13 Y99.735 E.21861
G1 X149.821 Y99.686 E.00547
G3 X149.445 Y99.422 I.335 J-.876 E.00811
M204 S250
G1 X149.101 Y99.667 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.061 Y99.627 E.00092
G1 X148.882 Y99.275 E.0064
G1 X148.818 Y98.851 E.00697
G1 X148.818 Y86.302 E.20378
G1 X148.882 Y85.878 E.00697
G1 X149.061 Y85.526 E.0064
G1 X149.34 Y85.247 E.0064
G1 X149.691 Y85.068 E.0064
G1 X150.115 Y85.004 E.00697
G1 X162.665 Y85.004 E.20378
G3 X162.742 Y85.013 I.009 J.248 E.00127
G1 X163.089 Y85.068 E.00571
G1 X163.44 Y85.247 E.0064
G1 X163.719 Y85.526 E.0064
G1 X163.898 Y85.878 E.0064
G1 X163.963 Y86.302 E.00697
G1 X163.963 Y98.851 E.20378
G1 X163.898 Y99.275 E.00697
G1 X163.719 Y99.627 E.0064
G1 X163.44 Y99.906 E.0064
G1 X163.089 Y100.085 E.0064
G1 X162.665 Y100.149 E.00697
G1 X150.115 Y100.149 E.20378
G1 X149.691 Y100.085 E.00697
G1 X149.34 Y99.906 E.0064
G1 X149.144 Y99.709 E.00451
; WIPE_START
M204 S6000
G1 X149.061 Y99.627 E-.04442
G1 X148.882 Y99.275 E-.14983
G1 X148.818 Y98.851 E-.16307
G1 X148.818 Y97.791 E-.40268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 5 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.9
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer5 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X150.026 Y96.689 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X150.026 Y98.403 E.02993
G1 X150.263 Y98.094 E.00679
G1 X151.175 Y97.404 E.01997
G1 X151.637 Y96.715 E.0145
G1 X151.797 Y96.025 E.01236
G2 X151.483 Y95.335 I-.777 J-.063 E.01382
G1 X150.57 Y94.646 E.01997
G1 X150.108 Y93.956 E.0145
G3 X150.026 Y92.886 I2.274 J-.712 E.01891
G1 X150.263 Y92.577 E.00679
G1 X151.175 Y91.887 E.01997
G1 X151.637 Y91.197 E.0145
G1 X151.797 Y90.507 E.01236
G2 X151.483 Y89.818 I-.777 J-.063 E.01382
G1 X150.57 Y89.128 E.01997
G1 X150.108 Y88.438 E.0145
G3 X150.026 Y87.368 I2.274 J-.712 E.01891
G1 X150.263 Y87.059 E.00679
G1 X151.175 Y86.369 E.01997
G1 X151.28 Y86.213 E.00329
G1 X154.519 Y86.213 E.05656
G3 X154.241 Y87.059 I-.84 J.193 E.01635
G1 X153.329 Y87.749 E.01997
G1 X152.867 Y88.438 E.0145
G1 X152.707 Y89.128 E.01236
G2 X153.021 Y89.818 I.777 J.063 E.01382
G1 X153.934 Y90.507 E.01997
G1 X154.396 Y91.197 E.0145
G1 X154.556 Y91.887 E.01236
G3 X154.241 Y92.577 I-.777 J.063 E.01382
G1 X153.329 Y93.266 E.01997
G1 X152.867 Y93.956 E.0145
G1 X152.707 Y94.646 E.01236
G2 X153.021 Y95.335 I.777 J.063 E.01382
G1 X153.934 Y96.025 E.01997
G1 X154.396 Y96.715 E.0145
G1 X154.556 Y97.404 E.01236
G3 X154.241 Y98.094 I-.777 J.063 E.01382
G1 X153.329 Y98.784 E.01997
G1 X153.224 Y98.94 E.00329
G1 X155.502 Y98.94 E.03978
G3 X155.78 Y98.094 I.84 J-.193 E.01634
G1 X156.693 Y97.404 E.01997
G1 X157.155 Y96.715 E.0145
G1 X157.314 Y96.025 E.01236
G2 X157 Y95.335 I-.777 J-.063 E.01382
G1 X156.088 Y94.646 E.01997
G1 X155.625 Y93.956 E.0145
G1 X155.466 Y93.266 E.01236
G3 X155.78 Y92.577 I.777 J-.063 E.01382
G1 X156.693 Y91.887 E.01997
G1 X157.155 Y91.197 E.0145
G1 X157.314 Y90.507 E.01236
G2 X157 Y89.818 I-.777 J-.063 E.01382
G1 X156.088 Y89.128 E.01997
G1 X155.625 Y88.438 E.0145
G1 X155.466 Y87.749 E.01236
G3 X155.78 Y87.059 I.777 J-.063 E.01382
G1 X156.693 Y86.369 E.01997
G1 X156.798 Y86.213 E.00329
G1 X160.037 Y86.213 E.05656
G3 X159.759 Y87.059 I-.84 J.193 E.01635
G1 X158.847 Y87.749 E.01997
G1 X158.384 Y88.438 E.0145
G1 X158.225 Y89.128 E.01236
G2 X158.539 Y89.818 I.777 J.063 E.01382
G1 X159.451 Y90.507 E.01997
G1 X159.914 Y91.197 E.0145
G1 X160.073 Y91.887 E.01236
G3 X159.759 Y92.577 I-.777 J.063 E.01382
G1 X158.847 Y93.266 E.01997
G1 X158.384 Y93.956 E.0145
G1 X158.225 Y94.646 E.01236
G2 X158.539 Y95.335 I.777 J.063 E.01382
G1 X159.451 Y96.025 E.01997
G1 X159.914 Y96.715 E.0145
G1 X160.073 Y97.404 E.01236
G3 X159.759 Y98.094 I-.777 J.063 E.01382
G1 X158.847 Y98.784 E.01997
G1 X158.742 Y98.94 E.00329
G1 X161.02 Y98.94 E.03978
G3 X161.298 Y98.094 I.84 J-.193 E.01634
G1 X162.21 Y97.404 E.01997
G1 X162.673 Y96.715 E.0145
G2 X162.754 Y95.644 I-2.275 J-.712 E.01891
G1 X162.518 Y95.335 E.00679
G1 X161.605 Y94.646 E.01997
G1 X161.143 Y93.956 E.0145
G1 X160.984 Y93.266 E.01236
G3 X161.298 Y92.577 I.777 J-.063 E.01382
G1 X162.21 Y91.887 E.01997
G1 X162.673 Y91.197 E.0145
G2 X162.754 Y90.127 I-2.275 J-.712 E.01891
G1 X162.518 Y89.818 E.00679
G1 X161.605 Y89.128 E.01997
G1 X161.143 Y88.438 E.0145
G1 X160.984 Y87.749 E.01236
G3 X161.298 Y87.059 I.777 J-.063 E.01382
G1 X162.21 Y86.369 E.01997
G1 X162.315 Y86.213 E.00329
G3 X162.735 Y86.256 I.136 J.735 E.00746
G1 X162.754 Y87.537 E.02237
; OBJECT_ID: 138
; WIPE_START
G1 X162.735 Y86.256 E-.4868
G1 X162.315 Y86.213 E-.16017
G1 X162.21 Y86.369 E-.07166
G1 X162.123 Y86.435 E-.04138
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X161.793 Y94.06 Z.9 F42000
G1 X160.492 Y124.036 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z.9 F42000
G1 X146.692 Y107.186 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.151 J-13.453 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.067 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.535 J-13.568 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.111 J-16.436 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z.9 F42000
G1 X161.25 Y107.186 Z.9
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z.9 F42000
G1 X163.48 Y115.886 Z.9
G1 Z.5
G1 E.8 F1800
M73 P44 R13
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.968 J-13.777 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.235 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.072 Y123.386 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X164.072 Y125.1 E.02993
G1 X163.123 Y124.363 E.02098
G1 X162.661 Y123.674 E.0145
G1 X162.501 Y122.984 E.01236
G3 X162.815 Y122.294 I.777 J-.063 E.01382
G1 X163.728 Y121.604 E.01997
G1 X164.072 Y121.092 E.01078
G1 X164.072 Y119.583 E.02634
G1 X163.123 Y118.846 E.02098
G1 X162.661 Y118.156 E.0145
G1 X162.501 Y117.466 E.01236
G1 X162.572 Y117.095 E.0066
G1 X162.272 Y117.095 E.00524
G1 X162.272 Y112.458 E.08096
G1 X162.619 Y112.458 E.00606
G3 X162.815 Y111.259 I.896 J-.469 E.02276
G1 X163.728 Y110.569 E.01997
G1 X164.072 Y110.056 E.01078
G1 X164.072 Y108.548 E.02634
G1 X163.123 Y107.81 E.02098
G1 X162.661 Y107.121 E.0145
G1 X162.501 Y106.431 E.01236
G3 X162.815 Y105.741 I.777 J-.063 E.01382
G1 X163.671 Y105.095 E.01872
G1 X164.072 Y105.095 E.007
G1 X164.072 Y106.408 E.02293
; WIPE_START
G1 X164.072 Y105.095 E-.49899
G1 X163.671 Y105.095 E-.1524
G1 X163.443 Y105.267 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.457 Y104.126 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X158.723 Y104.126 E.0074
M204 S10000
G1 X146.057 Y104.126 F42000
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.074 Y108.351 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.273 Y108.195 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X147.273 Y108.308 E.00196
G1 X148.874 Y108.308 E.02797
G3 X148.707 Y107.81 I.363 J-.399 E.00957
G1 X148.867 Y107.121 E.01236
G1 X149.329 Y106.431 E.0145
G1 X150.241 Y105.741 E.01997
G2 X150.549 Y105.095 I-.427 J-.6 E.01306
G1 X152.635 Y105.095 E.03643
G1 X151.78 Y105.741 E.01872
G2 X151.466 Y106.431 I.462 J.627 E.01382
G1 X151.625 Y107.121 E.01236
G2 X152.746 Y108.308 I2.276 J-1.026 E.02904
G1 X154.392 Y108.308 E.02874
G3 X154.225 Y107.81 I.363 J-.399 E.00957
G1 X154.384 Y107.121 E.01236
G1 X154.847 Y106.431 E.0145
G1 X155.759 Y105.741 E.01997
G2 X156.067 Y105.095 I-.427 J-.6 E.01306
G1 X157.722 Y105.095 E.0289
G1 X157.722 Y105.421 E.00569
G2 X156.984 Y106.431 I.541 J1.17 E.02281
G1 X157.143 Y107.121 E.01236
G2 X157.66 Y107.866 I2.193 J-.97 E.01592
G1 X157.508 Y107.866 E.00266
G1 X157.508 Y108.308 E.00773
G1 X156.388 Y108.308 E.01954
M204 S10000
G1 X157.874 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X160.706 Y108.351 E.02508
M204 S10000
G1 X161.861 Y108.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X161.073 Y108.395 E.01377
G1 X161.073 Y108.837 E.00773
G1 X160.859 Y108.837 E.00374
G1 X160.859 Y109.106 E.0047
G1 X161.431 Y109.88 E.0168
G1 X161.591 Y110.569 E.01236
G3 X160.859 Y111.575 I-1.274 J-.158 E.02267
G1 X160.859 Y114.624 E.05324
G1 X161.431 Y115.397 E.0168
G1 X161.591 Y116.087 E.01236
G3 X160.859 Y117.093 I-1.274 J-.158 E.02267
G1 X160.859 Y120.142 E.05324
G1 X161.431 Y120.915 E.0168
G1 X161.591 Y121.604 E.01236
G3 X160.859 Y122.61 I-1.274 J-.158 E.02267
G1 X160.859 Y124.324 E.02993
M204 S10000
G1 X158.931 Y128.458 F42000
G1 F16200
M204 S6000
G1 X160.335 Y128.458 E.02451
G2 X161.277 Y127.812 I-1.422 J-3.08 E.02004
G2 X161.591 Y127.122 I-.462 J-.627 E.01382
G2 X160.311 Y125.245 I-2.575 J.381 E.04105
G1 X158.665 Y125.245 E.02874
G3 X158.832 Y125.743 I-.363 J.399 E.00957
G1 X158.673 Y126.432 E.01236
G1 X158.21 Y127.122 E.0145
G1 X157.298 Y127.812 E.01997
G2 X156.99 Y128.458 I.427 J.6 E.01305
G1 X154.904 Y128.458 E.03642
G1 X155.759 Y127.812 E.01871
G2 X156.073 Y127.122 I-.462 J-.627 E.01382
G2 X154.793 Y125.245 I-2.575 J.381 E.04105
G1 X153.147 Y125.245 E.02874
G3 X153.314 Y125.743 I-.363 J.399 E.00957
G1 X153.155 Y126.432 E.01236
G1 X152.693 Y127.122 E.0145
G1 X151.78 Y127.812 E.01997
G2 X151.472 Y128.458 I.427 J.6 E.01305
G1 X149.386 Y128.458 E.03642
G1 X150.241 Y127.812 E.01871
G2 X150.556 Y127.122 I-.462 J-.627 E.01382
G2 X149.275 Y125.245 I-2.575 J.381 E.04105
G1 X147.629 Y125.245 E.02874
G3 X147.797 Y125.743 I-.363 J.399 E.00957
G1 X147.637 Y126.432 E.01236
G1 X147.175 Y127.122 E.0145
G1 X146.263 Y127.812 E.01997
G2 X145.955 Y128.458 I.427 J.6 E.01305
G1 X144.448 Y128.458 E.02631
G1 X144.109 Y128.277 E.00671
G1 X144.724 Y127.812 E.01346
G2 X145.038 Y127.122 I-.462 J-.627 E.01382
G1 X144.879 Y126.432 E.01236
G1 X144.416 Y125.743 E.0145
G1 X143.504 Y125.053 E.01997
G3 X143.19 Y124.363 I.462 J-.627 E.01382
G1 X143.349 Y123.674 E.01236
G1 X143.922 Y122.901 E.0168
G1 X143.922 Y119.851 E.05324
G3 X143.19 Y118.846 I.542 J-1.164 E.02267
G1 X143.349 Y118.156 E.01236
G1 X143.922 Y117.383 E.0168
G1 X143.922 Y114.334 E.05324
G3 X143.19 Y113.328 I.542 J-1.164 E.02267
G1 X143.349 Y112.638 E.01236
G1 X143.922 Y111.865 E.0168
G1 X143.922 Y108.837 E.05287
G1 X143.707 Y108.837 E.00374
G1 X143.707 Y108.654 E.0032
G3 X143.423 Y108.395 I.325 J-.642 E.0068
G1 X142.322 Y108.395 E.01924
G1 X142.322 Y105.095 E.05762
G1 X141.6 Y105.095 E.0126
G1 X140.709 Y105.789 E.01973
G1 X140.709 Y107.297 E.02633
G1 X141.053 Y107.81 E.01079
G1 X141.965 Y108.5 E.01997
G3 X142.279 Y109.19 I-.462 J.627 E.01382
G1 X142.12 Y109.88 E.01236
G1 X141.657 Y110.569 E.0145
G1 X140.709 Y111.307 E.02098
G1 X140.709 Y112.458 E.0201
G1 X142.509 Y112.458 E.03143
G1 X142.509 Y117.095 E.08096
G1 X140.709 Y117.095 E.03143
G1 X140.709 Y118.332 E.02161
G1 X141.053 Y118.846 E.01079
G1 X141.965 Y119.535 E.01997
G3 X142.279 Y120.225 I-.462 J.627 E.01382
G1 X142.12 Y120.915 E.01236
G1 X141.657 Y121.604 E.0145
G1 X140.709 Y122.342 E.02098
G1 X140.709 Y123.85 E.02633
G1 X141.053 Y124.363 E.01079
G1 X141.965 Y125.053 E.01997
G1 X142.229 Y125.398 E.00758
G3 X141.845 Y126.842 I-1.917 J.264 E.02679
G3 X140.709 Y125.91 I8.718 J-11.796 E.02567
G1 X140.709 Y125.666 E.00426
; OBJECT_ID: 193
; WIPE_START
G1 X140.709 Y125.91 E-.09275
G1 X141.845 Y126.842 E-.55846
G1 X142.005 Y126.604 E-.10879
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X136.312 Y131.689 Z.9 F42000
G1 X91.769 Y171.478 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X91.451 Y171.248 I-.311 J.095 E.02827
G1 X91.483 Y171.249 E.00056
G3 X91.746 Y171.422 I-.024 J.324 E.00575
M204 S250
G1 X92.142 Y171.292 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.177 Y171.428 E.00229
G3 X91.367 Y170.84 I-.724 J.144 E.05739
G3 X91.489 Y170.835 I.083 J.607 E.00199
G3 X92.113 Y171.241 I-.035 J.737 E.01267
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.177 Y171.428 E-.0751
G1 X92.198 Y171.574 E-.0558
G1 X92.184 Y171.72 E-.05597
G1 X92.14 Y171.861 E-.05598
G1 X92.07 Y171.99 E-.05597
G1 X91.975 Y172.103 E-.05601
G1 X91.86 Y172.195 E-.05594
G1 X91.729 Y172.262 E-.05601
G1 X91.514 Y172.311 E-.08379
G1 X91.367 Y172.308 E-.05596
G1 X91.223 Y172.275 E-.05602
G1 X91.089 Y172.214 E-.05596
G1 X91 Y172.15 E-.04148
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.61 Y171.558 Z.9 F42000
G1 X116.291 Y170.18 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.153 Y170.422 E.00486
G3 X114.824 Y171.147 I-1.362 J-.916 E.02748
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.641 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.641 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.312 Y170.124 I-1.641 J-.033 E.01049
M204 S250
G1 X115.923 Y169.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X114.814 Y170.734 I-1.128 J-.475 E.02299
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.945 Y169.929 I-1.224 J-.019 E.00664
; WIPE_START
M204 S6000
G1 X115.815 Y170.196 E-.11275
G1 X115.664 Y170.379 E-.09016
G1 X115.481 Y170.53 E-.09015
G1 X115.272 Y170.642 E-.09015
G1 X115.045 Y170.711 E-.09017
G1 X114.814 Y170.734 E-.08818
G1 X114.292 Y170.734 E-.19842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.248 Y165.005 Z.9 F42000
G1 X96.355 Y150.364 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.252 J1.958 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.33 J-.234 E.01042
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12441
G1 X95.957 Y150.672 E-.07656
G1 X95.821 Y150.821 E-.07655
G1 X95.649 Y151.07 E-.11502
G1 X95.461 Y151.018 E-.07433
G1 X95.461 Y150.55 E-.1779
G1 X95.477 Y150.423 E-.04849
G1 X95.52 Y150.331 E-.03863
G1 X95.573 Y150.279 E-.02811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.205 Y150.257 Z.9 F42000
G1 X116.572 Y150.218 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X116.757 Y150.55 I-.166 J.31 E.00699
G1 X116.757 Y151.018 E.00817
G1 X116.568 Y151.07 E.00341
G2 X115.862 Y150.364 I-1.958 J1.252 E.01756
G1 X115.915 Y150.176 E.00342
G3 X116.417 Y150.177 I.234 J5.096 E.00878
G1 X116.443 Y150.179 E.00045
G3 X116.516 Y150.195 I-.037 J.35 E.00132
; WIPE_START
G1 X116.677 Y150.304 E-.07362
G1 X116.74 Y150.423 E-.05144
G1 X116.757 Y150.55 E-.04849
G1 X116.757 Y151.018 E-.17789
G1 X116.568 Y151.07 E-.07432
G1 X116.396 Y150.821 E-.11497
G1 X116.261 Y150.672 E-.0766
G1 X116.111 Y150.536 E-.07658
G1 X115.968 Y150.437 E-.06609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.195 Y158.066 Z.9 F42000
G1 X116.568 Y170.577 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.33 J.234 E.01042
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.252 J-1.958 E.01652
; WIPE_START
G1 X116.757 Y170.629 E-.08417
G1 X116.757 Y171.098 E-.1779
G1 X116.74 Y171.224 E-.04848
G1 X116.677 Y171.343 E-.05139
G1 X116.601 Y171.412 E-.0387
G1 X116.509 Y171.455 E-.03865
G1 X116.383 Y171.472 E-.04849
G1 X115.915 Y171.472 E-.17789
G1 X115.862 Y171.283 E-.07433
G1 X115.906 Y171.253 E-.01999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z.9 F42000
G1 X96.355 Y171.283 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00342
G3 X95.708 Y171.455 I-.234 J-2.332 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00817
G1 X95.649 Y170.577 E.00342
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.735 J-1.179 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08367
G1 X95.835 Y171.472 E-.1779
G1 X95.708 Y171.455 E-.04845
G1 X95.616 Y171.412 E-.03874
G1 X95.52 Y171.316 E-.05138
G1 X95.477 Y171.224 E-.03867
G1 X95.461 Y171.098 E-.04847
G1 X95.461 Y170.629 E-.17791
G1 X95.649 Y170.577 E-.07433
G1 X95.677 Y170.623 E-.02047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.128 Y165.281 Z.9 F42000
G1 X116.838 Y149.882 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X117.185 Y150.539 I-.438 J.652 E.01353
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.004 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.004 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.438 Y149.749 E.35993
G3 X116.786 Y149.85 I-.038 J.784 E.00639
M204 S250
G1 X117.069 Y149.534 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.067 Y149.539 E.00009
G3 X117.599 Y150.529 I-.671 J.998 E.01899
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.458 Y149.336 E.33523
G3 X116.862 Y149.429 I-.062 J1.201 E.00676
G1 X117.015 Y149.507 E.00279
; WIPE_START
M204 S6000
G1 X117.067 Y149.539 E-.02299
G1 X117.25 Y149.682 E-.08845
G1 X117.398 Y149.863 E-.08866
G1 X117.508 Y150.068 E-.08866
G1 X117.576 Y150.291 E-.08855
G1 X117.599 Y150.529 E-.09061
G1 X117.599 Y151.297 E-.29208
; WIPE_END
M73 P44 R12
G1 E-.04 F1800
M204 S10000
G1 X116.284 Y150.39 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13609
G1 F15000
M204 S6000
G3 X116.542 Y150.631 I-.044 J.305 E.00175
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.444725
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.784 J1.143 E.00506
; LINE_WIDTH: 0.407928
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00484
; LINE_WIDTH: 0.405806
G1 X116.766 Y170.107 E.00313
; LINE_WIDTH: 0.444747
G3 X116.717 Y170.396 I-5.857 J-.858 E.00505
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.130882
G1 F15000
M204 S6000
G3 X116.302 Y171.257 I-.319 J-.047 E.0017
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.444718
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.139 J-5.761 E.00506
; LINE_WIDTH: 0.405766
G1 X115.194 Y171.505 E.00312
; LINE_WIDTH: 0.346463
G1 X114.829 Y171.524 E.00484
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407923
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444712
G3 X96.536 Y171.432 I.868 J-5.914 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125585
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.049 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.444719
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.802 J-1.146 E.00506
; LINE_WIDTH: 0.407913
G1 X95.429 Y169.926 E.00286
; LINE_WIDTH: 0.346464
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405765
G1 X95.451 Y151.54 E.00312
; LINE_WIDTH: 0.444717
G3 X95.5 Y151.251 I5.899 J.865 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125623
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.048 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.444731
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.174 J5.964 E.00506
; LINE_WIDTH: 0.407913
G1 X97.006 Y150.143 E.00286
; LINE_WIDTH: 0.346464
G1 X97.388 Y150.124 E.00507
G1 X114.829 Y150.124 E.23095
G1 X115.194 Y150.142 E.00484
; LINE_WIDTH: 0.405787
G1 X115.392 Y150.166 E.00313
; LINE_WIDTH: 0.444729
G3 X115.681 Y150.215 I-.875 J5.961 E.00506
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z.9 F42000
G1 X164.789 Y153.441 Z.9
G1 Z.5
M73 P45 R12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.027 Y153.482 E.00393
G1 X165.163 Y153.506 E.00223
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03675
G1 X126.133 Y165.114 E.03674
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X150.261 Y170.507 E.02019
G1 X151.22 Y170.16 E.01655
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03674
G1 X161.501 Y161.593 E.03675
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.027 Y153.482 E-.09601
G1 X165.163 Y153.506 E-.0522
G1 X164.794 Y155.073 E-.61179
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.441 Z.9 F42000
G1 X165.097 Y132.924 Z.9
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.1 E.03674
G1 X126.631 Y143.791 E.03675
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.684 Z.9 F42000
G1 X128.325 Y128.943 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.009 Y128.601 I-.324 J-.017 E.02658
G1 X128.041 Y128.603 E.00057
G3 X128.323 Y128.882 I-.04 J.322 E.00744
M204 S250
G1 X128.739 Y128.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.731 Y128.963 E.00025
G3 X127.945 Y128.189 I-.737 J-.038 E.05504
G3 X128.044 Y128.189 I.049 J.493 E.0016
G3 X128.724 Y128.817 I-.049 J.736 E.01626
G1 X128.732 Y128.89 E.00119
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.731 Y128.963 E-.02769
G1 X128.718 Y129.109 E-.05578
G1 X128.667 Y129.247 E-.05598
G1 X128.543 Y129.43 E-.08378
G1 X128.433 Y129.527 E-.05595
G1 X128.305 Y129.601 E-.05605
G1 X128.165 Y129.648 E-.05594
G1 X128.019 Y129.666 E-.05601
G1 X127.872 Y129.655 E-.05595
G1 X127.731 Y129.615 E-.05596
G1 X127.599 Y129.548 E-.056
G1 X127.484 Y129.456 E-.05597
G1 X127.351 Y129.28 E-.08378
G1 X127.346 Y129.268 E-.00516
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 6/72
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S188.7
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I.977 J.726 P1  F42000
G1 X149.713 Y99.16 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.619 Y98.827 I.464 J-.311 E.00613
G1 X149.619 Y86.326 E.21828
G3 X149.807 Y85.9 I.534 J-.019 E.00841
G3 X150.139 Y85.806 I.311 J.464 E.00613
G1 X162.641 Y85.806 E.21829
G3 X163.067 Y85.993 I.019 J.534 E.00841
G3 X163.161 Y86.326 I-.464 J.311 E.00613
G1 X163.161 Y98.827 E.21828
G3 X162.973 Y99.253 I-.534 J.019 E.00841
G3 X162.641 Y99.347 I-.311 J-.464 E.00613
G1 X150.139 Y99.347 E.21828
G3 X149.755 Y99.203 I-.019 J-.534 E.00736
M204 S10000
G1 X149.37 Y99.409 F42000
G1 F6000
M204 S6000
G3 X149.24 Y99.175 I.763 J-.575 E.00468
G1 X149.191 Y98.861 E.00555
G1 X149.191 Y86.292 E.21946
G1 X149.24 Y85.978 E.00556
G3 X149.791 Y85.427 I.893 J.342 E.01401
G1 X150.105 Y85.377 E.00555
G1 X162.718 Y85.384 E.22022
G3 X163.54 Y85.978 I.002 J.862 E.01892
G1 X163.59 Y86.292 E.00556
G1 X163.59 Y98.861 E.21946
G1 X163.54 Y99.175 E.00556
G3 X162.989 Y99.726 I-.893 J-.342 E.01401
G1 X162.675 Y99.776 E.00555
G1 X150.105 Y99.776 E.21946
G1 X149.791 Y99.726 E.00556
G3 X149.407 Y99.456 I.342 J-.893 E.00828
M204 S250
G1 X149.057 Y99.694 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.024 Y99.661 E.00076
G1 X148.842 Y99.305 E.00649
G1 X148.777 Y98.875 E.00705
G1 X148.777 Y86.277 E.20457
G1 X148.842 Y85.848 E.00705
G1 X149.024 Y85.492 E.00649
G1 X149.306 Y85.21 E.00649
G1 X149.662 Y85.029 E.00649
G1 X150.091 Y84.963 E.00705
G1 X162.689 Y84.963 E.20457
G3 X162.783 Y84.975 I.009 J.302 E.00154
G1 X163.118 Y85.029 E.00552
G1 X163.474 Y85.21 E.00649
G1 X163.757 Y85.492 E.00649
G1 X163.938 Y85.848 E.00649
G1 X164.003 Y86.277 E.00705
G1 X164.003 Y98.875 E.20457
G1 X163.938 Y99.305 E.00705
G1 X163.757 Y99.661 E.00649
G1 X163.474 Y99.943 E.00649
G1 X163.118 Y100.124 E.00649
G1 X162.689 Y100.189 E.00705
G1 X150.091 Y100.189 E.20457
G1 X149.662 Y100.124 E.00705
G1 X149.306 Y99.943 E.00649
G1 X149.099 Y99.736 E.00475
; WIPE_START
M204 S6000
G1 X149.024 Y99.661 E-.04062
G1 X148.842 Y99.305 E-.15178
G1 X148.777 Y98.875 E-.165
G1 X148.777 Y97.816 E-.40261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 6 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer6 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.986 Y96.462 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X149.986 Y98.176 E.02993
G1 X151.136 Y97.404 E.02419
G2 X151.925 Y95.68 I-1.824 J-1.878 E.03388
G1 X151.708 Y95.335 E.00712
G1 X150.609 Y94.646 E.02265
G1 X150.072 Y93.956 E.01526
G1 X149.986 Y93.701 E.0047
G1 X149.986 Y92.659 E.01821
G1 X150.037 Y92.577 E.00169
G1 X151.136 Y91.887 E.02265
G2 X151.925 Y90.163 I-1.824 J-1.878 E.03388
G1 X151.708 Y89.818 E.00712
G1 X150.609 Y89.128 E.02265
G1 X150.072 Y88.438 E.01526
G1 X149.986 Y88.184 E.0047
G1 X149.986 Y87.141 E.01821
G1 X151.136 Y86.369 E.02419
G1 X151.289 Y86.172 E.00436
G1 X153.004 Y86.172 E.02993
M204 S10000
G1 X153.478 Y88.728 F42000
G1 F16200
M204 S6000
G1 X153.478 Y89.664 E.01634
G1 X152.699 Y89.664 E.01359
G1 X152.579 Y89.473 E.00395
G3 X153.368 Y87.749 I2.614 J.153 E.03388
G1 X154.467 Y87.059 E.02265
G2 X154.599 Y86.172 I-.602 J-.543 E.01659
G1 X156.807 Y86.172 E.03855
G1 X156.654 Y86.369 E.00436
G1 X155.555 Y87.059 E.02265
G2 X155.514 Y88.214 I.755 J.605 E.02163
G1 X158.523 Y88.214 E.05255
G1 X158.886 Y87.749 E.0103
G1 X159.984 Y87.059 E.02265
G2 X160.117 Y86.172 I-.602 J-.543 E.01659
G1 X162.325 Y86.172 E.03855
G1 X162.171 Y86.369 E.00436
G1 X161.073 Y87.059 E.02265
G1 X160.855 Y87.404 E.00712
G2 X161.644 Y89.128 I2.613 J-.153 E.03388
G1 X162.743 Y89.818 E.02265
G1 X162.795 Y89.919 E.00199
G1 X162.795 Y90.913 E.01735
G1 X162.708 Y91.197 E.00519
G1 X162.171 Y91.887 E.01526
G1 X161.073 Y92.577 E.02265
G1 X160.855 Y92.921 E.00712
G2 X161.644 Y94.646 I2.613 J-.153 E.03388
G1 X162.743 Y95.335 E.02265
G1 X162.795 Y95.437 E.00199
G1 X162.795 Y96.43 E.01735
G1 X162.708 Y96.715 E.00519
G1 X162.171 Y97.404 E.01526
G1 X161.073 Y98.094 E.02265
G2 X160.94 Y98.981 I.602 J.543 E.01659
G1 X158.732 Y98.981 E.03855
G1 X158.886 Y98.784 E.00436
G1 X159.984 Y98.094 E.02265
G1 X160.202 Y97.749 E.00712
G2 X159.412 Y96.025 I-2.613 J.153 E.03388
G1 X159.303 Y95.956 E.00226
G1 X159.303 Y96.685 E.01272
G1 X159.048 Y96.939 E.00628
G1 X157.016 Y96.939 E.03549
G1 X156.654 Y97.404 E.0103
G1 X155.555 Y98.094 E.02265
G2 X155.422 Y98.981 I.602 J.543 E.01659
G1 X153.215 Y98.981 E.03855
G1 X153.368 Y98.784 E.00436
G1 X154.467 Y98.094 E.02265
G2 X154.508 Y96.939 I-.755 J-.605 E.02163
G1 X153.732 Y96.939 E.01355
G1 X153.478 Y96.685 E.00628
G1 X153.478 Y95.763 E.01609
G1 X153.041 Y95.489 E.00901
G1 X152.282 Y95.489 E.01325
G1 X152.087 Y95.294 E.00482
M204 S10000
G1 X154.192 Y94.159 F42000
G1 F16200
M204 S6000
G1 X153.357 Y94.159 E.01458
G1 X153.357 Y93.28 E.01535
G1 X153.947 Y92.903 E.01223
G1 X153.947 Y91.838 E.01859
G3 X154.563 Y91.583 I.435 J.181 E.01292
G2 X154.273 Y90.993 I-.998 J.124 E.01169
G1 X154.553 Y90.993 E.00488
G1 X154.807 Y90.739 E.00628
G1 X154.807 Y89.543 E.02088
G1 X156.789 Y89.543 E.0346
G3 X157.425 Y90.507 I-.222 J.839 E.02207
G1 X157.383 Y90.631 E.00228
G1 X157.383 Y90.388 E.00424
G1 X157.129 Y90.133 E.00628
G1 X156.017 Y90.133 E.0194
M204 S10000
G1 X159.423 Y91.07 F42000
G1 F16200
M204 S6000
G1 X159.423 Y92.784 E.02993
G2 X158.28 Y94.159 I2.498 J3.24 E.03149
G1 X157.973 Y94.414 E.00695
G1 X157.973 Y95.609 E.02088
G1 X157.398 Y95.609 E.01004
G1 X157.225 Y95.335 E.00566
G1 X156.722 Y95.019 E.01037
G1 X155.651 Y95.019 E.0187
G1 X155.397 Y94.765 E.00628
G1 X155.397 Y94.481 E.00495
M204 S10000
G1 X155.811 Y94.026 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X155.811 Y94.594 E.00921
G2 X156.958 Y94.606 I.863 J-27.349 E.01863
G2 X156.97 Y93.453 I-27.49 J-.866 E.01872
G1 X157.028 Y93.312 E.00248
G1 X157.178 Y93.177 E.00327
G3 X158.408 Y93.156 I.946 J19.359 E.01998
G2 X158.42 Y92.018 I-27.145 J-.859 E.01849
G2 X157.267 Y91.997 I-.866 J16.105 E.01873
G1 X157.126 Y91.939 E.00248
G1 X156.991 Y91.789 E.00327
G3 X156.97 Y90.559 I19.359 J-.946 E.01998
G2 X155.823 Y90.547 I-.863 J27.349 E.01863
G2 X155.811 Y91.7 I27.49 J.866 E.01872
G1 X155.752 Y91.841 E.00248
G1 X155.603 Y91.976 E.00327
G3 X154.373 Y91.997 I-.946 J-19.349 E.01998
G2 X154.361 Y93.144 I27.349 J.863 E.01863
G2 X155.513 Y93.156 I.866 J-27.49 E.01872
G1 X155.654 Y93.214 E.00248
G1 X155.79 Y93.364 E.00327
G1 X155.809 Y93.966 E.00979
M204 S10000
G1 X155.513 Y92.767 F42000
; LINE_WIDTH: 0.406324
G1 F12000
M204 S6000
G1 X155.781 Y92.821 E.00428
G1 X156.034 Y93.03 E.00516
G1 X156.146 Y93.186 E.003
G1 X156.2 Y93.453 E.00428
G1 X156.2 Y94.217 E.01197
G1 X156.58 Y94.217 E.00596
G1 X156.58 Y93.453 E.01197
G1 X156.634 Y93.186 E.00428
G1 X156.844 Y92.933 E.00516
G1 X157 Y92.822 E.003
G1 X157.267 Y92.767 E.00427
G1 X158.03 Y92.767 E.01197
G1 X158.03 Y92.386 E.00596
G1 X157.267 Y92.386 E.01197
G1 X157 Y92.331 E.00427
G1 X156.746 Y92.122 E.00515
G1 X156.636 Y91.966 E.003
G1 X156.58 Y91.7 E.00427
G1 X156.58 Y90.936 E.01197
G1 X156.2 Y90.936 E.00596
G1 X156.2 Y91.7 E.01197
G1 X156.145 Y91.966 E.00427
G1 X155.936 Y92.22 E.00515
G1 X155.781 Y92.332 E.003
G1 X155.513 Y92.386 E.00428
G1 X154.75 Y92.386 E.01197
G1 X154.75 Y92.767 E.00596
G1 X155.453 Y92.767 E.01103
M204 S10000
G1 X156.39 Y92.28 F42000
; LINE_WIDTH: 0.39501
G1 F12000
M204 S6000
G3 X156.094 Y92.576 I-.747 J-.451 E.00644
G3 X156.39 Y92.873 I-.451 J.747 E.00644
G3 X156.686 Y92.576 I.747 J.451 E.00644
G1 X156.473 Y92.395 E.00426
G1 X156.425 Y92.329 E.00125
M204 S10000
G1 X158.861 Y95.804 F42000
; LINE_WIDTH: 0.473725
G1 F12000
M204 S6000
G1 X158.863 Y95.373 E.00795
; LINE_WIDTH: 0.48968
G1 X158.889 Y95.291 E.00164
; LINE_WIDTH: 0.525
G1 X158.915 Y95.209 E.00176
; LINE_WIDTH: 0.56032
G1 X158.941 Y95.127 E.00189
G1 X159.022 Y95.101 E.00189
; LINE_WIDTH: 0.525
G1 X159.104 Y95.075 E.00176
; LINE_WIDTH: 0.508454
G1 X159.186 Y95.049 E.0017
G1 X159.913 Y95.011 E.01443
; LINE_WIDTH: 0.56366
G1 X160.26 Y94.996 E.00768
; LINE_WIDTH: 0.560905
G1 X160.277 Y94.782 E.00472
; LINE_WIDTH: 0.526715
G1 X160.294 Y94.568 E.00442
; LINE_WIDTH: 0.473249
G2 X160.313 Y94.276 I-2.508 J-.308 E.0054
G1 X160.313 Y90.877 E.06256
; LINE_WIDTH: 0.489683
G1 X160.295 Y90.637 E.0046
; LINE_WIDTH: 0.52501
G1 X160.278 Y90.397 E.00494
; LINE_WIDTH: 0.560337
G1 X160.26 Y90.156 E.00529
; LINE_WIDTH: 0.560338
G1 X160.02 Y90.139 E.00529
; LINE_WIDTH: 0.525015
G1 X159.78 Y90.121 E.00494
; LINE_WIDTH: 0.479189
G2 X159.186 Y90.103 I-.417 J4.025 E.01108
; LINE_WIDTH: 0.48968
G1 X159.104 Y90.078 E.00164
; LINE_WIDTH: 0.525
G1 X159.022 Y90.052 E.00176
; LINE_WIDTH: 0.56032
G1 X158.941 Y90.026 E.00189
G1 X158.915 Y89.944 E.00189
; LINE_WIDTH: 0.525
G1 X158.889 Y89.862 E.00176
; LINE_WIDTH: 0.508458
G1 X158.863 Y89.78 E.0017
G1 X158.824 Y89.054 E.01443
; LINE_WIDTH: 0.563665
G1 X158.81 Y88.706 E.00768
; LINE_WIDTH: 0.560338
G1 X158.57 Y88.689 E.00529
; LINE_WIDTH: 0.525015
G1 X158.33 Y88.671 E.00494
; LINE_WIDTH: 0.473199
G1 X158.089 Y88.653 E.00443
G1 X154.691 Y88.653 E.06255
; LINE_WIDTH: 0.48969
G1 X154.451 Y88.671 E.0046
; LINE_WIDTH: 0.52501
G1 X154.21 Y88.689 E.00494
; LINE_WIDTH: 0.56033
G1 X153.97 Y88.706 E.00529
G1 X153.952 Y88.947 E.00529
; LINE_WIDTH: 0.52501
G1 X153.935 Y89.187 E.00494
; LINE_WIDTH: 0.479801
G2 X153.915 Y89.82 I4.561 J.456 E.01183
; LINE_WIDTH: 0.492525
G1 X153.89 Y89.888 E.00141
; LINE_WIDTH: 0.526715
G1 X153.865 Y89.957 E.00151
; LINE_WIDTH: 0.560905
G1 X153.84 Y90.026 E.00161
; LINE_WIDTH: 0.560337
G1 X153.758 Y90.052 E.00189
; LINE_WIDTH: 0.52501
G1 X153.676 Y90.078 E.00176
; LINE_WIDTH: 0.508454
G1 X153.594 Y90.103 E.0017
G1 X152.868 Y90.142 E.01443
; LINE_WIDTH: 0.563655
G1 X152.52 Y90.156 E.00768
; LINE_WIDTH: 0.56033
G1 X152.502 Y90.397 E.00529
; LINE_WIDTH: 0.52501
G1 X152.485 Y90.637 E.00494
; LINE_WIDTH: 0.473199
G1 X152.467 Y90.877 E.00443
G1 X152.467 Y94.276 E.06255
; LINE_WIDTH: 0.48969
G1 X152.485 Y94.516 E.0046
; LINE_WIDTH: 0.52501
G1 X152.502 Y94.756 E.00494
; LINE_WIDTH: 0.56033
G1 X152.52 Y94.996 E.00529
G1 X152.76 Y95.014 E.00529
; LINE_WIDTH: 0.52501
G1 X153.001 Y95.032 E.00494
; LINE_WIDTH: 0.479189
G2 X153.594 Y95.049 I.417 J-4.025 E.01108
; LINE_WIDTH: 0.489683
G1 X153.676 Y95.075 E.00164
; LINE_WIDTH: 0.52501
G1 X153.758 Y95.101 E.00176
; LINE_WIDTH: 0.560337
G1 X153.84 Y95.127 E.00189
; LINE_WIDTH: 0.560338
G1 X153.865 Y95.209 E.00189
; LINE_WIDTH: 0.525015
G1 X153.891 Y95.291 E.00176
; LINE_WIDTH: 0.50846
G1 X153.917 Y95.373 E.0017
G1 X153.956 Y96.099 E.01443
; LINE_WIDTH: 0.563655
G1 X153.97 Y96.446 E.00768
; LINE_WIDTH: 0.56033
G1 X154.21 Y96.464 E.00529
; LINE_WIDTH: 0.52501
G1 X154.451 Y96.482 E.00494
; LINE_WIDTH: 0.473199
G1 X154.691 Y96.499 E.00443
G1 X158.089 Y96.499 E.06255
; LINE_WIDTH: 0.489692
G1 X158.33 Y96.482 E.0046
; LINE_WIDTH: 0.525015
G1 X158.57 Y96.464 E.00494
; LINE_WIDTH: 0.560338
G1 X158.81 Y96.446 E.00529
; LINE_WIDTH: 0.560905
G1 X158.826 Y96.252 E.00428
; LINE_WIDTH: 0.526715
G1 X158.841 Y96.058 E.00401
; LINE_WIDTH: 0.492525
G1 X158.857 Y95.864 E.00374
M204 S10000
G1 X159.186 Y90.554 F42000
; LINE_WIDTH: 0.472025
G1 F12000
M204 S6000
G1 X159.539 Y90.554 E.00648
; LINE_WIDTH: 0.489692
G1 X159.621 Y90.58 E.00164
; LINE_WIDTH: 0.525015
G1 X159.703 Y90.606 E.00176
; LINE_WIDTH: 0.560338
G1 X159.785 Y90.631 E.00189
; LINE_WIDTH: 0.560337
G1 X159.811 Y90.713 E.00189
; LINE_WIDTH: 0.52501
G1 X159.837 Y90.795 E.00176
; LINE_WIDTH: 0.472455
G1 X159.863 Y90.877 E.00158
G1 X159.863 Y94.276 E.06245
; LINE_WIDTH: 0.489683
G1 X159.837 Y94.358 E.00164
; LINE_WIDTH: 0.52501
G1 X159.811 Y94.44 E.00176
; LINE_WIDTH: 0.560337
G1 X159.785 Y94.521 E.00189
; LINE_WIDTH: 0.560338
G1 X159.703 Y94.547 E.00189
; LINE_WIDTH: 0.525015
G1 X159.621 Y94.573 E.00176
; LINE_WIDTH: 0.50846
G1 X159.539 Y94.599 E.0017
G1 X158.813 Y94.638 E.01443
; LINE_WIDTH: 0.56365
G1 X158.466 Y94.652 E.00768
; LINE_WIDTH: 0.56032
G1 X158.448 Y94.892 E.00529
; LINE_WIDTH: 0.525
G1 X158.43 Y95.132 E.00494
; LINE_WIDTH: 0.479795
G2 X158.411 Y95.765 I4.566 J.456 E.01183
; LINE_WIDTH: 0.492525
G1 X158.386 Y95.834 E.00141
; LINE_WIDTH: 0.526715
G1 X158.36 Y95.903 E.00151
; LINE_WIDTH: 0.560905
G1 X158.335 Y95.971 E.00161
; LINE_WIDTH: 0.560338
G1 X158.253 Y95.997 E.00189
; LINE_WIDTH: 0.525015
G1 X158.171 Y96.023 E.00176
; LINE_WIDTH: 0.472465
G1 X158.089 Y96.049 E.00158
G1 X154.691 Y96.049 E.06245
; LINE_WIDTH: 0.48969
G1 X154.609 Y96.023 E.00164
; LINE_WIDTH: 0.52501
G1 X154.527 Y95.997 E.00176
; LINE_WIDTH: 0.56033
G1 X154.445 Y95.971 E.00189
G1 X154.419 Y95.89 E.00189
; LINE_WIDTH: 0.52501
G1 X154.394 Y95.808 E.00176
; LINE_WIDTH: 0.508464
G1 X154.368 Y95.726 E.0017
G1 X154.329 Y94.999 E.01443
; LINE_WIDTH: 0.563665
G1 X154.315 Y94.652 E.00768
; LINE_WIDTH: 0.560337
G1 X154.074 Y94.634 E.00529
; LINE_WIDTH: 0.52501
G1 X153.834 Y94.617 E.00494
; LINE_WIDTH: 0.479186
G2 X153.241 Y94.599 I-.417 J4.029 E.01108
; LINE_WIDTH: 0.48969
G1 X153.159 Y94.573 E.00164
; LINE_WIDTH: 0.52501
G1 X153.077 Y94.547 E.00176
; LINE_WIDTH: 0.56033
G1 X152.995 Y94.521 E.00189
G1 X152.969 Y94.44 E.00189
; LINE_WIDTH: 0.52501
G1 X152.944 Y94.358 E.00176
; LINE_WIDTH: 0.472465
G1 X152.918 Y94.276 E.00158
G1 X152.918 Y90.877 E.06245
; LINE_WIDTH: 0.48969
G1 X152.944 Y90.795 E.00164
; LINE_WIDTH: 0.52501
G1 X152.969 Y90.713 E.00176
; LINE_WIDTH: 0.56033
G1 X152.995 Y90.631 E.00189
G1 X153.077 Y90.606 E.00189
; LINE_WIDTH: 0.52501
G1 X153.159 Y90.58 E.00176
; LINE_WIDTH: 0.508459
G1 X153.241 Y90.554 E.0017
G1 X153.967 Y90.515 E.01443
; LINE_WIDTH: 0.575096
G3 X154.315 Y90.501 I.208 J.832 E.0079
; LINE_WIDTH: 0.560905
G1 X154.332 Y90.287 E.00472
; LINE_WIDTH: 0.526715
G1 X154.349 Y90.073 E.00442
; LINE_WIDTH: 0.479976
G2 X154.368 Y89.427 I-4.246 J-.447 E.01208
; LINE_WIDTH: 0.48969
G1 X154.394 Y89.345 E.00164
; LINE_WIDTH: 0.52501
G1 X154.419 Y89.263 E.00176
; LINE_WIDTH: 0.56033
G1 X154.445 Y89.181 E.00189
G1 X154.527 Y89.156 E.00189
; LINE_WIDTH: 0.52501
G1 X154.609 Y89.13 E.00176
; LINE_WIDTH: 0.472465
G1 X154.691 Y89.104 E.00158
G1 X158.089 Y89.104 E.06245
; LINE_WIDTH: 0.489692
G1 X158.171 Y89.13 E.00164
; LINE_WIDTH: 0.525015
G1 X158.253 Y89.156 E.00176
; LINE_WIDTH: 0.560338
G1 X158.335 Y89.181 E.00189
; LINE_WIDTH: 0.560337
G1 X158.361 Y89.263 E.00189
; LINE_WIDTH: 0.52501
G1 X158.387 Y89.345 E.00176
; LINE_WIDTH: 0.508454
G1 X158.413 Y89.427 E.0017
G1 X158.451 Y90.154 E.01443
; LINE_WIDTH: 0.56365
G1 X158.466 Y90.501 E.00768
; LINE_WIDTH: 0.56032
G1 X158.686 Y90.517 E.00485
; LINE_WIDTH: 0.525
G1 X158.906 Y90.533 E.00453
; LINE_WIDTH: 0.48968
G1 X159.126 Y90.55 E.00421
; OBJECT_ID: 138
; WIPE_START
G1 X158.906 Y90.533 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X159.267 Y98.157 Z1 F42000
G1 X160.492 Y124.036 Z1
G1 Z.6
M73 P46 R12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1 F42000
G1 X146.692 Y107.186 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.161 J-13.468 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.214 J-16.311 E.08517
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.548 J-13.585 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.266 J-16.66 E.09233
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1 F42000
G1 X161.25 Y107.186 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1 F42000
G1 X163.48 Y115.886 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.982 J-13.797 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.379 J-17.098 E.0923
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1 F42000
G1 X160.706 Y108.351 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.232 Y106.588 Z1 F42000
G1 X147.32 Y108.261 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X157.46 Y108.261 E.16466
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G3 X147.32 Y108.201 I-.438 J.21 E.00502
M204 S10000
G1 X157.276 Y107.613 F42000
G1 F12000
M204 S6000
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.113 Y107.862 E.15338
G1 X157.179 Y107.662 E.00342
G1 X157.222 Y107.64 E.00079
M204 S10000
G1 X156.878 Y106.701 F42000
G1 F12000
M204 S6000
G1 X156.878 Y105.939 E.01238
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.998 Y107.464 E.00174
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y106.761 E.00985
M204 S10000
G1 X156.479 Y106.701 F42000
G1 F12000
M204 S6000
G1 X156.479 Y106.338 E.00591
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.479 Y107.065 E.13279
G1 X156.479 Y106.761 E.00493
M204 S10000
G1 X156.115 Y106.701 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X148.725 Y106.701 E.0991
; Slow Down End
M204 S10000
G1 X146.906 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X144.074 Y108.351 E.02508
; WIPE_START
G1 X146.074 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.323 Y104.126 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X146.057 Y104.126 E.0074
; WIPE_START
G1 X144.057 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.717 Y110.171 Z1 F42000
G1 X160.374 Y125.292 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X144.074 Y125.292 E.26468
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.943 E.07035
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.159 J-13.875 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.163 Y126.611 I-9.138 J-17.574 E.05469
G1 X164.025 Y125.889 E.01826
G1 X164.025 Y117.142 E.14202
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.434 Y125.288 E.00614
M204 S10000
G1 X161.022 Y125.601 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27007
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00468
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11839
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.480938
G3 X143.445 Y116.943 I3.602 J-.351 E.00945
G1 X143.445 Y112.61 E.08111
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420078
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.686 J-13.588 E.06694
G1 X160.221 Y128.012 E.25436
G1 X160.899 Y127.65 E.01249
G2 X163.626 Y125.703 I-9.381 J-16.022 E.0545
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420792
G1 X161.304 Y117.801 E.00699
G1 X161.304 Y125.093 E.11863
G1 X161.287 Y125.237 E.00236
G1 X161.057 Y125.552 E.00635
M204 S10000
G1 X161.29 Y125.9 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X161.077 Y126.017 E.00395
G1 X160.706 Y126.089 E.00614
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.191 Y125.554 E.0078
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.256 J-13.375 E.06091
G1 X160.121 Y127.614 E.25106
G1 X160.7 Y127.305 E.01066
G2 X163.228 Y125.517 I-9.041 J-15.464 E.05033
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.703 Y117.539 E.00383
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.324 Y125.85 E.01014
M204 S10000
G1 X162.829 Y118.701 F42000
G1 F12000
M204 S6000
G1 X162.829 Y118.338 E.00591
G1 X162.424 Y118.338 E.00658
G1 X162.101 Y118.23 E.00552
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.00549
; LINE_WIDTH: 0.439763
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465794
G1 X161.547 Y126.255 E.00881
G1 X162.421 Y125.672 E.01902
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00864
G1 X162.829 Y118.761 E.10667
M204 S10000
G1 X162.465 Y118.701 F42000
; Slow Down Start
; LINE_WIDTH: 0.351239
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X162.465 Y125.101 E.08598
; Slow Down End
M204 S10000
G1 X161.703 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
M73 P47 R12
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X162.101 Y111.323 F42000
G1 F12000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F12000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X163.265 Y105.901 F42000
; Slow Down Start
; LINE_WIDTH: 0.3447
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X163.26 Y108.35 E.03224
; Slow Down End
; WIPE_START
G1 X163.264 Y106.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.501 Y113.944 Z1 F42000
G1 X161.245 Y126.436 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.52432
G1 F12000
M204 S6000
G1 X161.495 Y126.286 E.00597
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.506932
G1 F12000
M204 S6000
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472155
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420177
G1 X160.706 Y126.488 E.00293
G1 X144.074 Y126.488 E.2702
; LINE_WIDTH: 0.443418
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474351
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.501 Y126.959 E.00883
; LINE_WIDTH: 0.437378
G1 X160.733 Y126.796 E.0048
; LINE_WIDTH: 0.472155
G1 X160.964 Y126.633 E.0052
; LINE_WIDTH: 0.506932
G1 X161.196 Y126.47 E.00561
M204 S10000
G1 X159.93 Y126.851 F42000
; Slow Down Start
; LINE_WIDTH: 0.35056
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X144.91 Y126.851 E.2014
; Slow Down End
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.492
G1 F12000
M204 S6000
G1 X143.423 Y126.372 E.00363
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.473998
G1 F12000
M204 S6000
G1 X143.05 Y126.005 E.00629
; LINE_WIDTH: 0.420362
G1 X142.837 Y125.738 E.00555
G1 X142.68 Y125.155 E.00982
G1 X142.679 Y118.23 E.11255
G1 X142.315 Y118.338 E.00617
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11382
G1 X142.651 Y125.894 E.01449
; LINE_WIDTH: 0.437993
G1 X142.931 Y126.067 E.0056
; LINE_WIDTH: 0.473998
G1 X143.212 Y126.24 E.00608
M204 S10000
G1 X142.316 Y125.171 F42000
; Slow Down Start
; LINE_WIDTH: 0.35145
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X142.315 Y118.761 E.08618
; Slow Down End
M204 S10000
G1 X142.474 Y109.239 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X142.384 Y109.235 E.00146
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.077 Y112.06 E.00447
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G1 X142.534 Y109.239 E.00727
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F12000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F12000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.522 Y108.41 F42000
; Slow Down Start
; LINE_WIDTH: 0.35196
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X141.515 Y105.961 E.03297
; Slow Down End
; OBJECT_ID: 193
; WIPE_START
G1 X141.521 Y107.961 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X136.81 Y113.967 Z1 F42000
G1 X91.745 Y171.42 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X91.782 Y171.541 E.00221
G3 X91.515 Y171.894 I-.324 J.032 E.0085
G3 X91.471 Y171.248 I-.055 J-.321 E.019
G1 X91.483 Y171.249 E.00022
G3 X91.712 Y171.37 I-.025 J.325 E.00466
M204 S250
G1 X92.144 Y171.297 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.176 Y171.428 E.0022
G3 X91.367 Y170.84 I-.724 J.144 E.0574
G3 X91.481 Y170.835 I.08 J.566 E.00186
G3 X92.114 Y171.246 I-.028 J.737 E.01287
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.176 Y171.428 E-.07326
G1 X92.198 Y171.574 E-.05575
G1 X92.184 Y171.72 E-.05598
G1 X92.14 Y171.861 E-.05599
G1 X92.07 Y171.99 E-.05594
G1 X91.975 Y172.103 E-.05597
G1 X91.796 Y172.232 E-.0838
G1 X91.659 Y172.286 E-.056
G1 X91.514 Y172.311 E-.05599
G1 X91.367 Y172.308 E-.05595
G1 X91.223 Y172.275 E-.05599
G1 X91.089 Y172.214 E-.05592
G1 X90.996 Y172.147 E-.04345
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.604 Y171.534 Z1 F42000
G1 X116.321 Y170.106 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.304 Y170.143 E.00071
G3 X114.824 Y171.147 I-1.513 J-.637 E.03302
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.641 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.641 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.398 Y169.84 I-1.641 J-.033 E.00529
G1 X116.338 Y170.049 E.0038
M204 S250
G1 X115.923 Y169.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X114.814 Y170.734 I-1.128 J-.475 E.02298
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.945 Y169.929 I-1.224 J-.019 E.00665
; WIPE_START
M204 S6000
G1 X115.815 Y170.196 E-.11266
G1 X115.664 Y170.379 E-.09018
G1 X115.481 Y170.53 E-.09016
G1 X115.272 Y170.642 E-.09013
G1 X115.045 Y170.711 E-.09018
G1 X114.814 Y170.734 E-.08818
G1 X114.291 Y170.734 E-.19851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.247 Y165.005 Z1 F42000
G1 X96.355 Y150.364 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.252 J1.958 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.331 J-.234 E.01041
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12433
G1 X95.957 Y150.672 E-.07658
G1 X95.821 Y150.821 E-.0766
G1 X95.649 Y151.07 E-.11498
G1 X95.461 Y151.018 E-.07433
G1 X95.461 Y150.549 E-.17789
G1 X95.477 Y150.423 E-.04843
G1 X95.52 Y150.331 E-.03866
G1 X95.573 Y150.279 E-.02818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.205 Y150.257 Z1 F42000
G1 X116.572 Y150.218 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X116.757 Y150.55 I-.166 J.31 E.00699
G1 X116.757 Y151.018 E.00817
G1 X116.568 Y151.07 E.00342
G2 X115.866 Y150.366 I-1.959 J1.253 E.01749
G1 X115.918 Y150.178 E.00342
G1 X116.426 Y150.178 E.00886
G1 X116.443 Y150.179 E.0003
G3 X116.517 Y150.195 I-.037 J.35 E.00132
; WIPE_START
G1 X116.677 Y150.304 E-.07364
G1 X116.74 Y150.423 E-.05142
G1 X116.757 Y150.55 E-.04844
G1 X116.757 Y151.018 E-.1779
G1 X116.568 Y151.07 E-.07434
G1 X116.396 Y150.821 E-.11495
G1 X116.261 Y150.672 E-.07662
G1 X116.111 Y150.536 E-.07658
G1 X115.968 Y150.437 E-.06611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.195 Y158.066 Z1 F42000
G1 X116.568 Y170.577 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.329 J.234 E.01041
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.252 J-1.958 E.01651
; WIPE_START
G1 X116.757 Y170.629 E-.08417
G1 X116.757 Y171.098 E-.17789
G1 X116.74 Y171.224 E-.04847
G1 X116.677 Y171.344 E-.05143
G1 X116.601 Y171.412 E-.03866
G1 X116.509 Y171.455 E-.03866
G1 X116.383 Y171.472 E-.04849
G1 X115.915 Y171.472 E-.1779
G1 X115.862 Y171.283 E-.07433
G1 X115.906 Y171.253 E-.02
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z1 F42000
G1 X96.355 Y171.283 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00342
G3 X95.708 Y171.455 I-.234 J-2.332 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00817
G1 X95.649 Y170.577 E.00342
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.735 J-1.179 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08367
G1 X95.835 Y171.472 E-.1779
G1 X95.708 Y171.455 E-.04842
G1 X95.616 Y171.412 E-.03874
G1 X95.52 Y171.316 E-.05135
G1 X95.477 Y171.224 E-.03873
G1 X95.461 Y171.098 E-.04847
G1 X95.461 Y170.629 E-.1779
G1 X95.649 Y170.577 E-.07434
G1 X95.677 Y170.624 E-.02048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.128 Y165.281 Z1 F42000
G1 X116.838 Y149.882 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X117.185 Y150.539 I-.438 J.652 E.01352
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.005 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.004 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.436 Y149.749 E.35989
G3 X116.787 Y149.85 I-.036 J.784 E.00642
M204 S250
G1 X117.067 Y149.539 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X117.599 Y150.529 I-.671 J.998 E.01899
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.446 Y149.336 E.33503
G3 X117.016 Y149.507 I-.05 J1.202 E.00976
; WIPE_START
M204 S6000
G1 X117.25 Y149.682 E-.11115
G1 X117.398 Y149.862 E-.08859
G1 X117.508 Y150.068 E-.08861
G1 X117.576 Y150.291 E-.08867
G1 X117.599 Y150.529 E-.09061
G1 X117.599 Y151.298 E-.29236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y150.392 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.138844
G1 F15000
M204 S6000
G3 X116.542 Y150.624 I-.071 J.31 E.00167
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.444741
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.856 J1.155 E.00506
; LINE_WIDTH: 0.407928
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00484
; LINE_WIDTH: 0.405777
G1 X116.767 Y170.107 E.00313
; LINE_WIDTH: 0.444731
G3 X116.717 Y170.396 I-5.904 J-.866 E.00506
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.131279
G1 F15000
M204 S6000
G3 X116.308 Y171.257 I-.308 J-.036 E.00169
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.44474
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.169 J-5.941 E.00506
; LINE_WIDTH: 0.405778
G1 X115.194 Y171.505 E.00313
; LINE_WIDTH: 0.346463
G1 X114.829 Y171.524 E.00484
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407921
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444717
G3 X96.536 Y171.432 I.877 J-5.969 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125605
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.049 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.444728
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.848 J-1.154 E.00506
; LINE_WIDTH: 0.407911
G1 X95.429 Y169.926 E.00286
; LINE_WIDTH: 0.346463
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405761
G1 X95.451 Y151.54 E.00312
; LINE_WIDTH: 0.444704
G3 X95.5 Y151.251 I5.955 J.875 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125598
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.048 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.44463
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.159 J5.88 E.00506
; LINE_WIDTH: 0.407798
G1 X97.006 Y150.144 E.00286
; LINE_WIDTH: 0.3454
G1 X97.388 Y150.124 E.00506
G1 X114.829 Y150.125 E.23019
G1 X115.194 Y150.143 E.00482
; LINE_WIDTH: 0.403764
G1 X115.392 Y150.167 E.00311
; LINE_WIDTH: 0.443361
G3 X115.685 Y150.217 I-.893 J6.076 E.00511
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.167 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z1 F42000
G1 X164.789 Y153.441 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X164.948 Y153.469 E.00263
G1 X165.163 Y153.506 E.00353
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03759
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X164.948 Y153.469 E-.06687
G1 X165.163 Y153.506 E-.0826
G1 X164.795 Y155.07 E-.61053
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.899 Y147.438 Z1 F42000
G1 X165.097 Y132.924 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
M73 P48 R12
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.165 Y143.791 E.03675
G1 X160.67 Y142.1 E.03675
G1 X161.999 Y140.269 E.03674
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35755
G1 X164.94 Y134.912 E-.40245
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.408 Y133.684 Z1 F42000
G1 X128.332 Y128.943 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.021 Y128.602 I-.325 J-.016 E.02676
G1 X128.041 Y128.603 E.00035
G3 X128.329 Y128.883 I-.034 J.324 E.00755
M204 S250
G1 X128.739 Y128.953 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.731 Y128.963 E.0002
G3 X127.945 Y128.189 I-.737 J-.038 E.05504
G3 X128.052 Y128.189 I.05 J.529 E.00173
G3 X128.724 Y128.817 I-.057 J.736 E.01613
G1 X128.733 Y128.893 E.00124
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.731 Y128.963 E-.02638
G1 X128.718 Y129.109 E-.05575
G1 X128.667 Y129.247 E-.05601
G1 X128.543 Y129.43 E-.0838
G1 X128.433 Y129.527 E-.056
G1 X128.305 Y129.601 E-.05596
G1 X128.165 Y129.648 E-.05599
G1 X128.019 Y129.666 E-.05598
G1 X127.8 Y129.639 E-.08374
G1 X127.663 Y129.585 E-.05602
G1 X127.54 Y129.505 E-.05597
G1 X127.434 Y129.402 E-.05598
G1 X127.351 Y129.28 E-.05597
G1 X127.344 Y129.265 E-.00646
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 7/72
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S191.25
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.978 J.724 P1  F42000
G1 X149.649 Y99.142 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.613 Y99.071 E.00139
G3 X149.579 Y98.852 I.54 J-.198 E.00389
G1 X149.579 Y86.301 E.21913
G3 X149.773 Y85.862 I.552 J-.018 E.00867
G3 X150.115 Y85.765 I.32 J.477 E.00631
G1 X162.692 Y85.769 E.2196
G3 X163.167 Y86.082 I.022 J.483 E.01061
G1 X163.202 Y86.301 E.00387
G1 X163.202 Y98.852 E.21913
G3 X163.007 Y99.291 I-.552 J.018 E.00867
G3 X162.665 Y99.388 I-.32 J-.477 E.00631
G1 X150.115 Y99.388 E.21913
G3 X149.677 Y99.195 I-.018 J-.552 E.00864
M204 S10000
G1 X149.268 Y99.336 F42000
G1 F6000
M204 S6000
G1 X149.201 Y99.205 E.00257
G1 X149.15 Y98.885 E.00564
G1 X149.15 Y86.268 E.22031
G1 X149.201 Y85.948 E.00564
G3 X149.762 Y85.387 I.909 J.348 E.01427
G1 X150.081 Y85.336 E.00564
G1 X162.759 Y85.346 E.22136
G3 X163.58 Y85.948 I-.008 J.871 E.01898
G1 X163.63 Y86.268 E.00564
G1 X163.63 Y98.885 E.22031
G1 X163.58 Y99.205 E.00564
G3 X163.018 Y99.766 I-.909 J-.348 E.01427
G1 X162.699 Y99.816 E.00564
G1 X150.081 Y99.816 E.22031
G1 X149.762 Y99.766 E.00564
G3 X149.332 Y99.443 I.348 J-.909 E.00951
G1 X149.299 Y99.387 E.00113
M204 S250
G1 X148.899 Y99.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.803 Y99.334 E.00346
G1 X148.737 Y98.9 E.00713
G1 X148.737 Y86.253 E.20535
G1 X148.803 Y85.819 E.00713
G1 X148.986 Y85.458 E.00657
G1 X149.272 Y85.172 E.00657
G1 X149.633 Y84.989 E.00657
G1 X150.067 Y84.923 E.00713
G1 X162.713 Y84.923 E.20536
G3 X162.824 Y84.938 I.009 J.356 E.00182
G1 X163.148 Y84.989 E.00532
G1 X163.508 Y85.172 E.00657
G1 X163.794 Y85.458 E.00657
G1 X163.978 Y85.819 E.00657
G1 X164.044 Y86.253 E.00713
G1 X164.044 Y98.9 E.20535
G1 X163.978 Y99.334 E.00713
G1 X163.794 Y99.694 E.00657
G1 X163.508 Y99.98 E.00657
G1 X163.148 Y100.164 E.00657
G1 X162.713 Y100.23 E.00713
G1 X150.067 Y100.23 E.20535
G1 X149.633 Y100.164 E.00713
G1 X149.272 Y99.98 E.00657
G1 X148.986 Y99.694 E.00657
G1 X148.926 Y99.577 E.00214
; WIPE_START
M204 S6000
G1 X148.803 Y99.334 E-.10372
G1 X148.737 Y98.9 E-.16693
G1 X148.737 Y97.612 E-.48935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 7 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.1
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer7 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X152.643 Y95.255 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4345
G1 F15000
M204 S6000
G1 X152.441 Y95.053 E.0048
G1 X152.441 Y94.469 E.00983
G1 X153.227 Y95.255 E.0187
M204 S10000
G1 X154.093 Y96.705 F42000
G1 F15000
M204 S6000
G1 X153.891 Y96.503 E.0048
G1 X153.891 Y95.919 E.00983
G1 X154.498 Y96.525 E.01444
G1 X155.082 Y96.525 E.00983
G1 X152.441 Y93.885 E.06285
G1 X152.441 Y93.301 E.00983
G1 X155.666 Y96.525 E.07675
G1 X156.25 Y96.525 E.00983
G1 X152.441 Y92.716 E.09065
G1 X152.441 Y92.132 E.00983
G1 X156.834 Y96.525 E.10455
G1 X157.418 Y96.525 E.00983
G1 X152.441 Y91.548 E.11846
G1 X152.441 Y90.964 E.00983
G1 X158.003 Y96.525 E.13236
G1 X158.587 Y96.525 E.00983
G1 X152.441 Y90.38 E.14626
G1 X152.453 Y90.078 E.00509
G1 X152.723 Y90.078 E.00454
G1 X158.889 Y96.244 E.14675
G1 X158.889 Y95.66 E.00983
G1 X153.307 Y90.078 E.13285
G1 X153.677 Y90.078 E.00622
G1 X153.784 Y89.97 E.00255
G1 X158.996 Y95.183 E.12405
G1 X159.104 Y95.075 E.00255
G1 X159.473 Y95.075 E.00622
G1 X153.891 Y89.493 E.13285
G1 X153.891 Y88.909 E.00983
G1 X160.057 Y95.075 E.14675
G1 X160.339 Y95.063 E.00475
G1 X160.339 Y94.773 E.00489
G1 X154.194 Y88.628 E.14626
G1 X154.778 Y88.628 E.00983
G1 X160.339 Y94.189 E.13236
G1 X160.339 Y93.605 E.00983
G1 X155.362 Y88.628 E.11845
G1 X155.946 Y88.628 E.00983
G1 X160.339 Y93.021 E.10455
G1 X160.339 Y92.436 E.00983
G1 X156.53 Y88.628 E.09065
G1 X157.114 Y88.628 E.00983
G1 X160.518 Y92.032 E.08102
M204 S10000
G1 X160.518 Y90.279 F42000
G1 F15000
M204 S6000
G1 X160.317 Y90.078 E.0048
G1 X159.732 Y90.078 E.00983
G1 X160.339 Y90.684 E.01444
G1 X160.339 Y91.268 E.00983
G1 X157.698 Y88.628 E.06285
G1 X158.282 Y88.628 E.00983
G1 X158.889 Y89.234 E.01444
G1 X158.889 Y88.65 E.00983
G1 X158.687 Y88.448 E.0048
M204 S10000
G1 X162.789 Y86.169 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.36146
G1 F12000
M204 S6000
G1 X162.656 Y86.133 E.00192
G1 X150.143 Y86.127 E.17333
G1 X149.981 Y86.175 E.00234
G1 X149.941 Y86.337 E.00231
G1 X149.941 Y98.823 E.17297
G1 X149.989 Y98.985 E.00234
G1 X150.15 Y99.026 E.00231
G1 X162.637 Y99.026 E.17297
G1 X162.799 Y98.978 E.00234
G1 X162.839 Y98.816 E.00231
G1 X162.839 Y86.33 E.17297
G1 X162.807 Y86.226 E.0015
M204 S10000
G1 X162.477 Y87.667 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X162.477 Y86.496 E.02044
G1 X161.933 Y86.496 E.00949
G3 X161.218 Y86.815 I-1.194 J-1.717 E.01375
G3 X160.528 Y86.869 I-.403 J-.714 E.01247
G1 X160.37 Y86.495 E.0071
G1 X156.42 Y86.493 E.06896
G3 X155.7 Y86.815 I-1.205 J-1.729 E.01385
G3 X155.011 Y86.869 I-.403 J-.714 E.01247
G1 X154.851 Y86.492 E.00715
G1 X150.907 Y86.49 E.06886
G3 X150.303 Y86.762 I-1.017 J-1.449 E.01163
G1 X150.303 Y88.799 E.03556
G2 X151.562 Y89.574 I1.991 J-1.825 E.02614
G2 X152.252 Y89.628 I.403 J-.714 E.01247
G1 X152.597 Y88.815 E.01542
G3 X154.321 Y87.303 I2.421 J1.021 E.04144
G3 X155.011 Y87.248 I.403 J.714 E.01247
G2 X155.442 Y88.214 I4.465 J-1.414 E.0185
G1 X158.454 Y88.214 E.05259
G3 X159.839 Y87.303 I2.124 J1.72 E.02941
G3 X160.528 Y87.248 I.403 J.714 E.01247
G1 X160.873 Y88.062 E.01542
G2 X162.477 Y89.521 I2.306 J-.923 E.03918
G1 X162.477 Y91.558 E.03557
G3 X160.753 Y92.419 I-2.188 J-2.225 E.03421
G2 X162.477 Y95.039 I2.329 J.344 E.05992
G1 X162.477 Y97.076 E.03557
G3 X161.218 Y97.85 I-1.991 J-1.825 E.02614
G3 X160.528 Y97.905 I-.403 J-.714 E.01247
G1 X160.184 Y97.091 E.01542
G2 X159.303 Y95.986 I-2.35 J.969 E.02501
G1 X159.303 Y96.685 E.0122
G1 X159.048 Y96.939 E.00628
G1 X157.085 Y96.939 E.03427
G3 X155.7 Y97.85 I-2.124 J-1.719 E.02941
G3 X155.011 Y97.905 I-.403 J-.714 E.01247
G2 X154.58 Y96.939 I-4.465 J1.414 E.01851
G1 X153.732 Y96.939 E.0148
G1 X153.478 Y96.685 E.00628
G1 X153.478 Y95.813 E.01521
G2 X152.252 Y95.525 I-1.028 J1.62 E.0224
G1 X151.907 Y96.338 E.01542
G3 X150.303 Y97.798 I-2.306 J-.923 E.03918
G1 X150.303 Y98.663 E.01511
G1 X153.597 Y98.663 E.0575
G3 X154.321 Y98.338 I1.216 J1.739 E.01395
G3 X155.011 Y98.284 I.403 J.714 E.01247
G1 X155.172 Y98.663 E.0072
G1 X159.114 Y98.663 E.06884
G3 X159.839 Y98.338 I1.216 J1.739 E.01395
G3 X160.528 Y98.284 I.403 J.714 E.01247
G1 X160.689 Y98.663 E.0072
G1 X162.404 Y98.663 E.02993
M204 S10000
G1 X152.028 Y93.464 F42000
G1 F16200
M204 S6000
G1 X152.028 Y95.178 E.02993
G3 X150.303 Y94.317 I.464 J-3.086 E.03421
G1 X150.303 Y92.28 E.03556
G2 X152.028 Y90.536 I-.79 J-2.506 E.04455
G1 X152.028 Y91.083 E.00955
; OBJECT_ID: 138
; WIPE_START
G1 X152.028 Y90.536 E-.20778
G1 X151.562 Y91.431 E-.38323
G1 X151.257 Y91.754 E-.16899
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X153.356 Y99.092 Z1.1 F42000
G1 X160.492 Y124.036 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.1 F42000
G1 X146.692 Y107.186 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.179 J-13.495 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.045 J-16.065 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.563 J-13.609 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
M73 P49 R12
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
M73 P49 R11
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.1 F42000
G1 X161.25 Y107.186 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.1 F42000
G1 X163.48 Y115.886 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.996 J-13.818 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.1 F42000
G1 X160.706 Y108.351 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.017 E.00395
G1 X160.706 Y126.089 E.00614
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.191 Y125.554 E.0078
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.257 J-13.376 E.06091
G1 X160.121 Y127.614 E.25106
G1 X160.7 Y127.305 E.01065
G2 X163.228 Y125.517 I-9.035 J-15.456 E.05034
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.0055
; LINE_WIDTH: 0.439773
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465817
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.01901
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.465 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51171
G1 F14686.385
M204 S6000
G1 X161.496 Y126.286 E.00582
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474339
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.959 E.00882
; LINE_WIDTH: 0.437375
G1 X160.749 Y126.785 E.00514
; LINE_WIDTH: 0.472145
G1 X160.997 Y126.61 E.00557
; LINE_WIDTH: 0.506915
G1 F14831.447
G1 X161.245 Y126.436 E.006
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472145
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420177
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X143.424 Y126.372 E.00371
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.651 Y125.894 E.01448
; LINE_WIDTH: 0.437993
G1 X142.957 Y126.083 E.00611
; LINE_WIDTH: 0.462209
G1 X143.263 Y126.272 E.00646
G1 X142.837 Y125.738 E.01226
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00981
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.159 J-13.875 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.611 I-9.143 J-17.58 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00712
G1 X144.074 Y125.292 E.26468
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.685 J-13.586 E.06694
G1 X160.221 Y128.012 E.25436
G1 X160.899 Y127.65 E.01248
G2 X163.626 Y125.703 I-9.378 J-16.017 E.0545
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00469
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.1 F42000
G1 X146.057 Y104.126 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 193
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X140.573 Y110.101 Z1.1 F42000
G1 X91.775 Y171.476 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X91.463 Y171.248 I-.311 J.098 E.02849
G1 X91.483 Y171.249 E.00036
G3 X91.752 Y171.421 I-.018 J.325 E.00582
M204 S250
G1 X92.145 Y171.303 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.176 Y171.428 E.0021
G3 X91.367 Y170.84 I-.724 J.144 E.05741
G3 X91.473 Y170.835 I.076 J.527 E.00173
G3 X92.116 Y171.251 I-.021 J.737 E.01308
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.176 Y171.428 E-.07123
G1 X92.198 Y171.574 E-.0558
G1 X92.184 Y171.72 E-.05598
G1 X92.14 Y171.861 E-.05598
G1 X92.07 Y171.99 E-.05599
G1 X91.975 Y172.103 E-.05599
G1 X91.796 Y172.232 E-.08378
G1 X91.659 Y172.286 E-.05598
G1 X91.514 Y172.311 E-.05598
G1 X91.367 Y172.308 E-.05597
G1 X91.223 Y172.275 E-.05597
G1 X91.089 Y172.214 E-.05595
G1 X90.992 Y172.144 E-.0454
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.6 Y171.532 Z1.1 F42000
G1 X116.321 Y170.106 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.304 Y170.143 E.00072
G3 X114.824 Y171.147 I-1.513 J-.637 E.03302
G1 X97.393 Y171.147 E.30434
G3 X95.785 Y169.539 I.033 J-1.641 E.04387
G1 X95.785 Y152.108 E.30434
G3 X97.393 Y150.5 I1.641 J.033 E.04387
G1 X114.824 Y150.5 E.30434
G3 X116.432 Y152.108 I-.033 J1.641 E.04387
G1 X116.432 Y169.539 E.30434
G3 X116.398 Y169.84 I-1.641 J-.033 E.00529
G1 X116.338 Y170.048 E.00378
M204 S250
G1 X115.927 Y169.986 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.923 Y169.985 E.00007
G3 X114.814 Y170.734 I-1.128 J-.475 E.02298
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.993 Y169.759 I-1.224 J-.019 E.00377
G1 X115.944 Y169.928 E.00286
; WIPE_START
M204 S6000
G1 X115.923 Y169.985 E-.023
G1 X115.815 Y170.196 E-.09001
G1 X115.664 Y170.379 E-.09016
G1 X115.481 Y170.53 E-.09016
G1 X115.272 Y170.642 E-.09018
G1 X115.045 Y170.711 E-.09015
G1 X114.814 Y170.734 E-.08816
G1 X114.292 Y170.734 E-.19819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.248 Y165.005 Z1.1 F42000
G1 X96.355 Y150.364 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X95.649 Y151.07 I1.253 J1.958 E.01756
G1 X95.461 Y151.018 E.00342
G3 X95.477 Y150.423 I2.329 J-.234 E.01042
G3 X95.835 Y150.176 I.337 J.105 E.00818
G1 X96.303 Y150.176 E.00817
M73 P50 R11
G1 X96.339 Y150.306 E.00237
; WIPE_START
G1 X96.106 Y150.536 E-.12434
G1 X95.957 Y150.672 E-.07659
G1 X95.821 Y150.821 E-.07661
G1 X95.649 Y151.07 E-.11499
G1 X95.461 Y151.018 E-.07433
G1 X95.461 Y150.55 E-.1779
G1 X95.477 Y150.423 E-.0485
G1 X95.541 Y150.304 E-.05134
G1 X95.571 Y150.277 E-.01539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.203 Y150.264 Z1.1 F42000
G1 X116.597 Y150.241 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.653 Y150.28 E.00118
G3 X116.757 Y150.549 I-.249 J.251 E.0052
G1 X116.757 Y151.018 E.00817
G1 X116.568 Y151.07 E.00341
G2 X115.864 Y150.365 I-1.958 J1.253 E.01752
G1 X115.917 Y150.177 E.00342
G1 X116.408 Y150.177 E.00858
G3 X116.541 Y150.205 I-.005 J.354 E.00238
G1 X116.547 Y150.208 E.00012
; WIPE_START
G1 X116.653 Y150.28 E-.04848
G1 X116.729 Y150.391 E-.05136
G1 X116.757 Y150.549 E-.0611
G1 X116.757 Y151.018 E-.1779
G1 X116.568 Y151.07 E-.07432
G1 X116.396 Y150.821 E-.11497
G1 X116.261 Y150.672 E-.07663
G1 X116.111 Y150.536 E-.07657
G1 X115.941 Y150.418 E-.07868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.178 Y158.047 Z1.1 F42000
G1 X116.568 Y170.577 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.757 Y170.629 E.00342
G3 X116.74 Y171.224 I-2.332 J.234 E.01041
G3 X116.383 Y171.472 I-.337 J-.105 E.00818
G1 X115.915 Y171.472 E.00817
G1 X115.862 Y171.283 E.00342
G2 X116.535 Y170.627 I-1.252 J-1.958 E.01652
; WIPE_START
G1 X116.757 Y170.629 E-.08418
G1 X116.757 Y171.098 E-.1779
G1 X116.74 Y171.224 E-.04845
G1 X116.697 Y171.316 E-.03867
G1 X116.601 Y171.412 E-.05152
G1 X116.509 Y171.455 E-.03861
G1 X116.383 Y171.472 E-.04846
G1 X115.915 Y171.472 E-.17792
G1 X115.862 Y171.283 E-.07433
G1 X115.906 Y171.253 E-.01997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.273 Y171.265 Z1.1 F42000
G1 X96.355 Y171.283 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X96.303 Y171.472 E.00342
G3 X95.708 Y171.455 I-.234 J-2.334 E.01041
G3 X95.461 Y171.098 I.105 J-.337 E.00818
G1 X95.461 Y170.629 E.00817
G1 X95.649 Y170.577 E.00341
G1 X95.701 Y170.664 E.00177
G2 X96.304 Y171.251 I1.735 J-1.178 E.01479
; WIPE_START
G1 X96.303 Y171.472 E-.08368
G1 X95.835 Y171.472 E-.17792
G1 X95.708 Y171.455 E-.04839
G1 X95.616 Y171.412 E-.03872
G1 X95.52 Y171.316 E-.05148
G1 X95.477 Y171.224 E-.0387
G1 X95.461 Y171.098 E-.0484
G1 X95.461 Y170.629 E-.1779
G1 X95.649 Y170.577 E-.07432
G1 X95.677 Y170.624 E-.02049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.128 Y165.281 Z1.1 F42000
G1 X116.838 Y149.882 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X117.185 Y150.539 I-.438 J.652 E.01353
G1 X117.185 Y171.108 E.35914
G3 X116.393 Y171.9 I-.787 J.005 E.02175
G1 X95.824 Y171.9 E.35914
G3 X95.032 Y171.108 I-.004 J-.787 E.02175
G1 X95.032 Y150.539 E.35914
G3 X95.824 Y149.747 I.787 J-.004 E.02175
G1 X116.419 Y149.748 E.35959
G3 X116.786 Y149.85 I-.019 J.785 E.00673
M204 S250
G1 X117.067 Y149.539 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X117.599 Y150.529 I-.671 J.999 E.01899
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.429 Y149.335 E.33475
G3 X117.016 Y149.507 I-.034 J1.203 E.01004
; WIPE_START
M204 S6000
G1 X117.25 Y149.682 E-.1112
G1 X117.398 Y149.862 E-.08859
G1 X117.508 Y150.068 E-.08867
G1 X117.576 Y150.291 E-.08863
G1 X117.599 Y150.529 E-.0906
G1 X117.599 Y151.298 E-.29232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.31 Y150.391 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.139408
G1 F15000
M204 S6000
G3 X116.542 Y150.624 I-.083 J.314 E.00166
M204 S10000
G1 X116.717 Y151.251 F42000
; LINE_WIDTH: 0.444746
G1 F15000
M204 S6000
G3 X116.767 Y151.54 I-5.905 J1.163 E.00506
; LINE_WIDTH: 0.407943
G1 X116.789 Y151.721 E.00286
; LINE_WIDTH: 0.346463
G1 X116.809 Y152.103 E.00507
G1 X116.809 Y169.544 E.23095
G1 X116.791 Y169.909 E.00484
; LINE_WIDTH: 0.405776
G1 X116.767 Y170.107 E.00313
; LINE_WIDTH: 0.444732
G3 X116.717 Y170.396 I-5.87 J-.86 E.00506
M204 S10000
G1 X116.542 Y170.991 F42000
; LINE_WIDTH: 0.130902
G1 F15000
M204 S6000
G3 X116.302 Y171.257 I-.319 J-.047 E.0017
M204 S10000
G1 X115.681 Y171.432 F42000
; LINE_WIDTH: 0.44473
G1 F15000
M204 S6000
G3 X115.392 Y171.481 I-1.162 J-5.897 E.00506
; LINE_WIDTH: 0.405777
G1 X115.194 Y171.505 E.00313
; LINE_WIDTH: 0.346463
G1 X114.829 Y171.524 E.00483
G1 X97.388 Y171.524 E.23095
G1 X97.006 Y171.504 E.00507
; LINE_WIDTH: 0.407902
G1 X96.825 Y171.481 E.00286
; LINE_WIDTH: 0.444703
G3 X96.536 Y171.432 I.864 J-5.901 E.00506
M204 S10000
G1 X95.938 Y171.257 F42000
; LINE_WIDTH: 0.125582
G1 F15000
M204 S6000
G3 X95.675 Y170.994 I.049 J-.312 E.00169
M204 S10000
G1 X95.5 Y170.396 F42000
; LINE_WIDTH: 0.444734
G1 F15000
M204 S6000
G3 X95.451 Y170.107 I5.858 J-1.155 E.00506
; LINE_WIDTH: 0.407957
G1 X95.429 Y169.927 E.00286
; LINE_WIDTH: 0.346464
G1 X95.409 Y169.544 E.00507
G1 X95.409 Y152.103 E.23095
G1 X95.427 Y151.738 E.00484
; LINE_WIDTH: 0.405786
G1 X95.451 Y151.54 E.00312
; LINE_WIDTH: 0.444719
G3 X95.5 Y151.251 I5.797 J.848 E.00506
M204 S10000
G1 X95.675 Y150.653 F42000
; LINE_WIDTH: 0.125573
G1 F15000
M204 S6000
G3 X95.938 Y150.39 I.312 J.049 E.00169
M204 S10000
G1 X96.536 Y150.215 F42000
; LINE_WIDTH: 0.444686
G1 F15000
M204 S6000
G3 X96.825 Y150.166 I1.167 J5.931 E.00506
; LINE_WIDTH: 0.407874
G1 X97.006 Y150.143 E.00286
; LINE_WIDTH: 0.345827
G1 X97.388 Y150.124 E.00506
G1 X114.829 Y150.124 E.2305
G1 X115.194 Y150.142 E.00482
; LINE_WIDTH: 0.404576
G1 X115.392 Y150.166 E.00312
; LINE_WIDTH: 0.443899
G3 X115.683 Y150.216 I-.862 J5.887 E.00509
; OBJECT_ID: 171
; WIPE_START
G1 X115.392 Y150.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.008 Y150.671 Z1.1 F42000
G1 X164.789 Y153.441 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X164.87 Y153.455 E.00133
G1 X165.163 Y153.506 E.00483
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X164.87 Y153.455 E-.03966
G1 X165.163 Y153.506 E-.113
G1 X164.797 Y155.062 E-.60734
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.9 Y147.43 Z1.1 F42000
G1 X165.097 Y132.924 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03758
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X135.476 Y149.743 E.0131
G1 X134.055 Y149.238 E.02448
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.408 Y133.684 Z1.1 F42000
G1 X128.336 Y128.943 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.029 Y128.602 I-.325 J-.016 E.02684
G1 X128.041 Y128.603 E.00021
G3 X128.333 Y128.883 I-.03 J.324 E.00762
M204 S250
G1 X128.739 Y128.957 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.732 Y128.963 E.00016
G3 X127.945 Y128.189 I-.737 J-.038 E.05504
G3 X128.06 Y128.19 I.051 J.569 E.00186
G3 X128.725 Y128.817 I-.065 J.735 E.01601
G1 X128.733 Y128.897 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.732 Y128.963 E-.02507
G1 X128.718 Y129.109 E-.05581
G1 X128.667 Y129.247 E-.05593
G1 X128.543 Y129.43 E-.08384
G1 X128.433 Y129.527 E-.05597
G1 X128.305 Y129.601 E-.05598
G1 X128.165 Y129.648 E-.05603
G1 X128.019 Y129.666 E-.05594
G1 X127.872 Y129.655 E-.05599
G1 X127.73 Y129.615 E-.05595
G1 X127.599 Y129.548 E-.05598
G1 X127.484 Y129.456 E-.05598
G1 X127.351 Y129.28 E-.08375
G1 X127.343 Y129.261 E-.00779
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 8/72
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S183.6
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I.979 J.723 P1  F42000
G1 X149.6 Y99.152 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.574 Y99.1 E.00103
G3 X149.538 Y98.876 I.555 J-.203 E.00398
G1 X149.538 Y86.277 E.21998
G3 X149.739 Y85.825 I.57 J-.017 E.00894
G3 X150.091 Y85.724 I.33 J.49 E.00648
G1 X162.733 Y85.731 E.22074
G3 X163.207 Y86.053 I.015 J.487 E.01068
G1 X163.242 Y86.277 E.00396
G1 X163.242 Y98.876 E.21998
G3 X163.041 Y99.328 I-.57 J.017 E.00894
G3 X162.69 Y99.428 I-.33 J-.49 E.00648
G1 X150.091 Y99.428 E.21998
G3 X149.638 Y99.227 I-.017 J-.57 E.00894
G1 X149.628 Y99.206 E.00042
M204 S10000
G1 X149.218 Y99.347 F42000
G1 F6000
M204 S6000
G1 X149.161 Y99.234 E.00221
G1 X149.11 Y98.91 E.00573
G1 X149.11 Y86.243 E.22116
G1 X149.161 Y85.919 E.00573
G3 X149.733 Y85.347 I.926 J.355 E.01454
G1 X150.057 Y85.296 E.00573
G1 X162.723 Y85.296 E.22116
G1 X162.8 Y85.308 E.00136
G3 X163.619 Y85.919 I-.021 J.882 E.01902
G1 X163.671 Y86.243 E.00573
G1 X163.671 Y98.91 E.22116
G1 X163.619 Y99.234 E.00573
G3 X163.048 Y99.806 I-.926 J-.355 E.01454
G1 X162.723 Y99.857 E.00573
G1 X150.057 Y99.857 E.22116
G1 X149.733 Y99.806 E.00573
G3 X149.295 Y99.476 I.355 J-.926 E.00968
G1 X149.249 Y99.398 E.00158
M204 S250
G1 X148.85 Y99.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.763 Y99.363 E.00312
G1 X148.696 Y98.924 E.00722
G1 X148.696 Y86.229 E.20615
G1 X148.763 Y85.79 E.00722
G1 X148.949 Y85.425 E.00665
G1 X149.238 Y85.135 E.00665
G1 X149.603 Y84.949 E.00665
G1 X150.043 Y84.882 E.00722
G1 X162.738 Y84.882 E.20615
G3 X162.865 Y84.9 I.009 J.41 E.00209
G1 X163.177 Y84.949 E.00513
G1 X163.542 Y85.135 E.00665
G1 X163.832 Y85.425 E.00665
G1 X164.017 Y85.79 E.00665
G1 X164.084 Y86.229 E.00722
G1 X164.084 Y98.924 E.20615
G1 X164.017 Y99.363 E.00722
G1 X163.832 Y99.728 E.00665
G1 X163.542 Y100.018 E.00665
G1 X163.177 Y100.204 E.00665
G1 X162.738 Y100.271 E.00722
G1 X150.042 Y100.271 E.20615
G1 X149.603 Y100.204 E.00722
G1 X149.238 Y100.018 E.00665
G1 X148.949 Y99.728 E.00665
G1 X148.877 Y99.588 E.00256
; WIPE_START
M204 S6000
G1 X148.763 Y99.363 E-.09581
G1 X148.696 Y98.924 E-.16886
G1 X148.696 Y97.621 E-.49533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 8 start: 138,149,160,171,182,193,204
M624 fwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer8 end: 138,149,160,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.713 Y98.438 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4044
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G2 X149.947 Y99.003 I3.623 J-1.174 E.03204
G2 X149.985 Y99.03 I.06 J-.044 E.00245
G2 X150.457 Y99.051 I.304 J-1.481 E.02484
G1 X149.915 Y97.737 E.07441
G1 X149.915 Y96.544 E.06243
G1 X150.948 Y99.051 E.14193
G1 X151.44 Y99.051 E.02572
G1 X149.915 Y95.351 E.20946
G1 X149.915 Y94.158 E.06243
G1 X151.931 Y99.051 E.27698
G1 X152.423 Y99.051 E.02572
G1 X149.915 Y92.965 E.3445
G1 X149.915 Y91.772 E.06243
G1 X152.914 Y99.051 E.41202
G1 X153.406 Y99.051 E.02572
G1 X149.915 Y90.579 E.47954
G1 X149.915 Y89.386 E.06243
G1 X153.897 Y99.051 E.54706
G1 X154.389 Y99.051 E.02572
M73 P51 R11
G1 X149.915 Y88.193 E.61458
G1 X149.915 Y87 E.06243
G1 X152.692 Y93.74 E.38151
G1 X152.692 Y92.547 E.06243
G1 X150.042 Y86.114 E.36412
G1 X150.528 Y86.102 E.02546
G1 X152.692 Y91.354 E.29729
G1 X152.692 Y90.328 E.05369
G1 X152.761 Y90.328 E.0036
G1 X151.02 Y86.102 E.23921
G1 X151.511 Y86.102 E.02572
G1 X153.252 Y90.328 E.23919
G1 X153.744 Y90.328 E.02572
G1 X152.003 Y86.103 E.23918
G1 X152.495 Y86.103 E.02572
G1 X154.103 Y90.006 E.22093
G1 X154.142 Y89.967 E.00293
G1 X154.142 Y88.909 E.05534
G1 X152.986 Y86.103 E.15883
G1 X153.478 Y86.104 E.02572
G1 X154.621 Y88.878 E.15706
G1 X155.112 Y88.878 E.02572
G1 X153.969 Y86.104 E.15704
G1 X154.461 Y86.104 E.02572
G1 X155.604 Y88.878 E.15703
G1 X156.095 Y88.878 E.02572
G1 X154.952 Y86.104 E.15702
G1 X155.444 Y86.105 E.02572
G1 X156.587 Y88.878 E.157
G1 X157.078 Y88.878 E.02572
G1 X155.936 Y86.105 E.15698
G1 X156.427 Y86.105 E.02572
G1 X157.57 Y88.878 E.15697
G1 X158.061 Y88.878 E.02572
G1 X156.919 Y86.105 E.15695
G1 X157.41 Y86.106 E.02572
G1 X159.15 Y90.328 E.23901
G1 X159.641 Y90.328 E.02572
G1 X157.902 Y86.106 E.23899
G1 X158.393 Y86.106 E.02572
G1 X162.865 Y96.961 E.61437
G1 X162.865 Y98.154 E.06243
G1 X160.088 Y91.413 E.38151
G1 X160.088 Y92.606 E.06243
G1 X162.738 Y99.039 E.36408
G1 X162.252 Y99.051 E.02546
G1 X160.088 Y93.799 E.29726
G1 X160.088 Y94.824 E.05365
G1 X160.019 Y94.824 E.00362
G1 X161.76 Y99.051 E.23923
G1 X161.269 Y99.051 E.02572
G1 X159.528 Y94.824 E.23923
G1 X159.036 Y94.824 E.02572
G1 X160.777 Y99.051 E.23923
G1 X160.286 Y99.051 E.02572
G1 X158.677 Y95.147 E.22099
G1 X158.638 Y95.186 E.00291
G1 X158.638 Y96.244 E.05538
G1 X159.794 Y99.051 E.15887
G1 X159.303 Y99.051 E.02572
G1 X158.159 Y96.274 E.15716
G1 X157.668 Y96.274 E.02572
G1 X158.812 Y99.051 E.15716
G1 X158.32 Y99.051 E.02572
G1 X157.176 Y96.274 E.15716
G1 X156.685 Y96.274 E.02572
G1 X157.829 Y99.051 E.15717
G1 X157.337 Y99.051 E.02572
G1 X156.193 Y96.274 E.15717
G1 X155.702 Y96.274 E.02572
G1 X156.846 Y99.051 E.15717
G1 X156.354 Y99.051 E.02572
G1 X155.21 Y96.274 E.15717
G1 X154.719 Y96.274 E.02572
G1 X155.863 Y99.051 E.15716
G1 X155.371 Y99.051 E.02572
G1 X153.63 Y94.824 E.23923
G1 X153.139 Y94.824 E.02572
G1 X154.963 Y99.254 E.2507
M106 S183.6
M204 S10000
G1 X157.565 Y96.029 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43052
; LAYER_HEIGHT: 0.1
G1 F15000
M204 S6000
G1 X158.214 Y95.381 E.01529
G1 X158.214 Y95.01 E.00617
G1 X158.824 Y94.4 E.01438
G1 X159.194 Y94.4 E.00617
G1 X159.664 Y93.931 E.01106
G1 X159.664 Y93.352 E.00964
G1 X157.166 Y95.85 E.05887
G1 X156.587 Y95.85 E.00964
G1 X159.664 Y92.774 E.07251
G1 X159.664 Y92.195 E.00964
G1 X156.009 Y95.85 E.08614
G1 X155.43 Y95.85 E.00964
G1 X159.664 Y91.617 E.09978
G1 X159.664 Y91.038 E.00964
G1 X154.852 Y95.85 E.11341
G1 X154.567 Y95.85 E.00476
G1 X154.567 Y95.557 E.00488
G1 X159.371 Y90.753 E.11324
G1 X158.824 Y90.753 E.00911
G1 X158.808 Y90.737 E.00037
G1 X154.551 Y94.994 E.10035
G1 X154.261 Y94.705 E.00682
G1 X158.519 Y90.448 E.10035
G1 X158.23 Y90.158 E.00682
G1 X153.972 Y94.416 E.10035
G1 X153.956 Y94.4 E.00037
G1 X153.409 Y94.4 E.00911
G1 X158.214 Y89.596 E.11324
G1 X158.214 Y89.303 E.00488
G1 X157.928 Y89.303 E.00476
G1 X153.117 Y94.115 E.11341
G1 X153.117 Y93.536 E.00964
G1 X157.35 Y89.303 E.09978
G1 X156.771 Y89.303 E.00964
G1 X153.117 Y92.958 E.08614
G1 X153.117 Y92.379 E.00964
G1 X156.193 Y89.303 E.07251
G1 X155.614 Y89.303 E.00964
G1 X153.117 Y91.801 E.05887
G1 X153.117 Y91.222 E.00964
G1 X153.586 Y90.753 E.01106
G1 X153.956 Y90.753 E.00618
G1 X154.566 Y90.143 E.01438
G1 X154.566 Y89.772 E.00618
G1 X155.215 Y89.124 E.01529
M204 S10000
G1 X158.801 Y85.904 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.4044
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X162.865 Y95.768 E.5583
G1 X162.865 Y94.575 E.06243
G1 X159.376 Y86.107 E.4793
G1 X159.868 Y86.107 E.02572
G1 X162.865 Y93.382 E.41176
G1 X162.865 Y92.189 E.06243
G1 X160.36 Y86.107 E.34422
G1 X160.851 Y86.108 E.02572
G1 X162.865 Y90.996 E.27669
G1 X162.865 Y89.803 E.06243
G1 X161.343 Y86.108 E.20915
G1 X161.834 Y86.108 E.02572
G1 X162.865 Y88.61 E.14161
G1 X162.865 Y87.417 E.06243
G1 X162.326 Y86.108 E.07408
G3 X162.796 Y86.123 I.188 J1.496 E.0247
G3 X162.841 Y86.167 I-.028 J.075 E.00339
G1 X163.067 Y86.716 E.03108
M106 S183.6
; OBJECT_ID: 138
; WIPE_START
G1 X162.841 Y86.167 E-.22566
G1 X162.796 Y86.123 E-.02395
G1 X162.326 Y86.108 E-.17864
G1 X162.658 Y86.916 E-.33175
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X162.214 Y94.535 Z1.2 F42000
G1 X160.492 Y124.036 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.1
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.2 F42000
G1 X146.692 Y107.186 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.195 J-13.518 E.08517
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.066 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.579 J-13.631 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
M73 P52 R11
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.2 F42000
G1 X161.25 Y107.186 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.2 F42000
G1 X163.48 Y115.886 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-13.01 J-13.838 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.2 F42000
G1 X160.706 Y108.351 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00614
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.19 Y125.554 E.00781
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.258 J-13.377 E.06091
G1 X160.121 Y127.614 E.25106
G1 X160.7 Y127.305 E.01065
G2 X163.228 Y125.517 I-9.036 J-15.457 E.05034
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.00551
; LINE_WIDTH: 0.439768
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465805
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.019
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.5117
G1 F14686.685
M204 S6000
G1 X161.495 Y126.286 E.00582
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443408
G1 F15000
M204 S6000
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474327
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.959 E.00882
; LINE_WIDTH: 0.437375
G1 X160.749 Y126.785 E.00514
; LINE_WIDTH: 0.472145
G1 X160.997 Y126.61 E.00557
; LINE_WIDTH: 0.506915
G1 F14831.447
G1 X161.245 Y126.436 E.006
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472145
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420177
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.50282
G1 F14957.619
M204 S6000
G1 X143.423 Y126.372 E.00371
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.65 Y125.894 E.01447
; LINE_WIDTH: 0.437988
G1 X142.957 Y126.083 E.00611
; LINE_WIDTH: 0.462198
G1 X143.263 Y126.272 E.00646
G1 X142.837 Y125.738 E.01226
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.0098
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.16 J-13.876 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.141 J-17.579 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00712
G1 X144.074 Y125.292 E.26468
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.686 J-13.588 E.06694
G1 X160.221 Y128.012 E.25436
G1 X160.899 Y127.65 E.01248
G2 X163.626 Y125.703 I-9.376 J-16.016 E.0545
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00469
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.2 F42000
G1 X146.057 Y104.126 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 193
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G1 X140.57 Y110.098 Z1.2 F42000
G1 X91.748 Y171.429 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X91.781 Y171.541 E.00205
G3 X91.547 Y171.887 I-.324 J.032 E.00791
G3 X91.483 Y171.249 I-.088 J-.314 E.01984
G3 X91.717 Y171.377 I-.026 J.325 E.0048
M204 S250
G1 X92.146 Y171.306 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.176 Y171.428 E.00205
G3 X91.367 Y170.84 I-.724 J.144 E.05741
G3 X91.465 Y170.835 I.074 J.488 E.0016
G3 X92.118 Y171.254 I-.013 J.738 E.01326
; OBJECT_ID: 160
; WIPE_START
M204 S6000
G1 X92.176 Y171.428 E-.07
G1 X92.198 Y171.574 E-.05578
G1 X92.166 Y171.792 E-.08377
G1 X92.108 Y171.927 E-.056
G1 X92.025 Y172.049 E-.05599
G1 X91.92 Y172.152 E-.05594
G1 X91.796 Y172.232 E-.056
G1 X91.659 Y172.286 E-.05596
G1 X91.514 Y172.311 E-.05602
G1 X91.367 Y172.308 E-.05598
G1 X91.223 Y172.275 E-.05598
G1 X91.089 Y172.214 E-.05593
G1 X90.989 Y172.143 E-.04665
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 160
M624 BAAAAAAAAAA=
M204 S10000
G1 X98.593 Y171.485 Z1.2 F42000
G1 X115.927 Y169.985 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X115.923 Y169.985 E.00007
G3 X114.814 Y170.734 I-1.128 J-.475 E.02298
G1 X97.403 Y170.734 E.28271
G3 X96.199 Y169.529 I.019 J-1.224 E.0306
G1 X96.199 Y152.118 E.28271
G3 X97.403 Y150.914 I1.224 J.019 E.0306
G1 X114.814 Y150.914 E.28271
G3 X116.019 Y152.118 I-.019 J1.224 E.0306
G1 X116.019 Y169.529 E.28271
G3 X115.993 Y169.759 I-1.224 J-.019 E.00377
G1 X115.944 Y169.928 E.00285
; WIPE_START
M204 S6000
G1 X115.923 Y169.985 E-.02328
G1 X115.815 Y170.196 E-.09001
G1 X115.664 Y170.379 E-.09013
G1 X115.481 Y170.53 E-.09016
G1 X115.272 Y170.642 E-.09017
G1 X115.045 Y170.711 E-.09013
G1 X114.814 Y170.734 E-.0882
G1 X114.293 Y170.734 E-.19792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.283 Y163.166 Z1.2 F42000
G1 X117.067 Y149.539 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X117.599 Y150.529 I-.672 J.999 E.01899
G1 X117.599 Y171.118 E.33433
G3 X116.403 Y172.314 I-1.205 J-.009 E.03042
G1 X95.814 Y172.314 E.33433
G3 X94.619 Y171.118 I.009 J-1.205 E.03042
G1 X94.619 Y150.529 E.33433
G3 X95.814 Y149.334 I1.205 J.009 E.03042
G1 X116.412 Y149.334 E.33447
G3 X117.016 Y149.507 I-.017 J1.204 E.01032
; WIPE_START
M204 S6000
G1 X117.25 Y149.682 E-.11119
G1 X117.398 Y149.863 E-.08865
G1 X117.508 Y150.068 E-.08863
G1 X117.576 Y150.291 E-.08864
G1 X117.599 Y150.529 E-.09059
G1 X117.599 Y151.298 E-.29231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.509 Y158.93 Z1.2 F42000
G1 X117.364 Y171.267 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
M73 P53 R11
G1 F3000
M204 S2000
G1 X116.552 Y172.079 E.01864
G1 X115.973 Y172.094
G1 X117.379 Y170.688 E.0323
G1 X117.379 Y170.124
G1 X115.409 Y172.094 E.04524
G1 X114.846 Y172.094
G1 X117.379 Y169.561 E.05818
G1 X117.379 Y168.997
G1 X114.282 Y172.094 E.07113
G1 X113.719 Y172.094
G1 X114.864 Y170.949 E.02631
G1 X114.297 Y170.953
G1 X113.155 Y172.094 E.02622
G1 X112.591 Y172.094
G1 X113.733 Y170.953 E.02622
G1 X113.169 Y170.953
G1 X112.028 Y172.094 E.02622
G1 X111.464 Y172.094
G1 X112.606 Y170.953 E.02622
G1 X112.042 Y170.953
G1 X110.901 Y172.094 E.02622
G1 X110.337 Y172.094
G1 X111.479 Y170.953 E.02622
G1 X110.915 Y170.953
G1 X109.773 Y172.094 E.02622
G1 X109.21 Y172.094
G1 X110.351 Y170.953 E.02622
G1 X109.788 Y170.953
G1 X108.646 Y172.094 E.02622
G1 X108.083 Y172.094
G1 X109.224 Y170.953 E.02622
G1 X108.661 Y170.953
G1 X107.519 Y172.094 E.02622
G1 X106.955 Y172.094
G1 X108.097 Y170.953 E.02622
G1 X107.533 Y170.953
G1 X106.392 Y172.094 E.02622
G1 X105.828 Y172.094
G1 X106.97 Y170.953 E.02622
G1 X106.406 Y170.953
G1 X105.264 Y172.094 E.02622
G1 X104.701 Y172.094
G1 X105.842 Y170.953 E.02622
G1 X105.279 Y170.953
G1 X104.137 Y172.094 E.02622
G1 X103.574 Y172.094
G1 X104.715 Y170.953 E.02622
G1 X104.152 Y170.953
G1 X103.01 Y172.094 E.02622
G1 X102.446 Y172.094
G1 X103.588 Y170.953 E.02622
G1 X103.024 Y170.953
G1 X101.883 Y172.094 E.02622
G1 X101.319 Y172.094
G1 X102.461 Y170.953 E.02622
G1 X101.897 Y170.953
G1 X100.756 Y172.094 E.02622
G1 X100.192 Y172.094
G1 X101.334 Y170.953 E.02622
G1 X100.77 Y170.953
G1 X99.628 Y172.094 E.02622
G1 X99.065 Y172.094
G1 X100.206 Y170.953 E.02622
G1 X99.643 Y170.953
G1 X98.501 Y172.094 E.02622
G1 X97.938 Y172.094
G1 X99.079 Y170.953 E.02622
G1 X98.516 Y170.953
G1 X97.374 Y172.094 E.02622
G1 X96.81 Y172.094
G1 X97.952 Y170.953 E.02622
G1 X97.389 Y170.952
G1 X96.247 Y172.094 E.02622
G1 X95.696 Y172.082
G1 X96.916 Y170.862 E.02802
G1 X96.552 Y170.662
G1 X95.279 Y171.935 E.02922
G1 X94.998 Y171.653
G1 X96.27 Y170.38 E.02922
G1 X96.07 Y170.016
M73 P53 R10
G1 X94.85 Y171.236 E.02802
G1 X94.838 Y170.685
G1 X95.98 Y169.543 E.02622
G1 X95.979 Y168.98
G1 X94.838 Y170.122 E.02622
G1 X94.838 Y169.558
G1 X95.979 Y168.416 E.02622
G1 X95.979 Y167.853
G1 X94.838 Y168.994 E.02622
G1 X94.838 Y168.431
G1 X95.979 Y167.289 E.02622
G1 X95.979 Y166.726
G1 X94.838 Y167.867 E.02622
G1 X94.838 Y167.304
G1 X95.979 Y166.162 E.02622
G1 X95.979 Y165.598
G1 X94.838 Y166.74 E.02622
G1 X94.838 Y166.176
G1 X95.979 Y165.035 E.02622
G1 X95.979 Y164.471
G1 X94.838 Y165.613 E.02622
G1 X94.838 Y165.049
G1 X95.979 Y163.908 E.02622
G1 X95.979 Y163.344
G1 X94.838 Y164.486 E.02622
G1 X94.838 Y163.922
G1 X95.979 Y162.78 E.02622
G1 X95.979 Y162.217
G1 X94.838 Y163.358 E.02622
G1 X94.838 Y162.795
G1 X95.979 Y161.653 E.02622
G1 X95.979 Y161.09
G1 X94.838 Y162.231 E.02622
G1 X94.838 Y161.668
G1 X95.979 Y160.526 E.02622
G1 X95.979 Y159.962
G1 X94.838 Y161.104 E.02622
G1 X94.838 Y160.54
G1 X95.979 Y159.399 E.02622
G1 X95.979 Y158.835
G1 X94.838 Y159.977 E.02622
G1 X94.838 Y159.413
G1 X95.979 Y158.272 E.02622
G1 X95.979 Y157.708
G1 X94.838 Y158.85 E.02622
G1 X94.838 Y158.286
G1 X95.979 Y157.144 E.02622
G1 X95.979 Y156.581
G1 X94.838 Y157.722 E.02622
G1 X94.838 Y157.159
G1 X95.979 Y156.017 E.02622
G1 X95.979 Y155.453
G1 X94.838 Y156.595 E.02622
G1 X94.838 Y156.032
G1 X95.979 Y154.89 E.02622
G1 X95.979 Y154.326
G1 X94.838 Y155.468 E.02622
G1 X94.838 Y154.904
G1 X95.979 Y153.763 E.02622
G1 X95.979 Y153.199
G1 X94.838 Y154.341 E.02622
G1 X94.838 Y153.777
G1 X95.979 Y152.635 E.02622
G1 X95.983 Y152.068
G1 X94.838 Y153.213 E.02631
; WIPE_START
M204 S6000
G1 X95.983 Y152.068 E-.61564
G1 X95.981 Y152.448 E-.14437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.808 Y157.377 Z1.2 F42000
G1 X116.234 Y169.579 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X117.379 Y168.433 E.02631
G1 X117.379 Y167.87
G1 X116.238 Y169.011 E.02622
G1 X116.238 Y168.448
G1 X117.379 Y167.306 E.02622
G1 X117.379 Y166.743
G1 X116.238 Y167.884 E.02622
G1 X116.238 Y167.321
G1 X117.379 Y166.179 E.02622
G1 X117.379 Y165.615
G1 X116.238 Y166.757 E.02622
G1 X116.238 Y166.193
G1 X117.379 Y165.052 E.02622
G1 X117.379 Y164.488
G1 X116.238 Y165.63 E.02622
G1 X116.238 Y165.066
G1 X117.379 Y163.925 E.02622
G1 X117.379 Y163.361
G1 X116.238 Y164.503 E.02622
G1 X116.238 Y163.939
G1 X117.379 Y162.797 E.02622
G1 X117.379 Y162.234
G1 X116.238 Y163.375 E.02622
G1 X116.238 Y162.812
G1 X117.379 Y161.67 E.02622
G1 X117.379 Y161.107
G1 X116.238 Y162.248 E.02622
G1 X116.238 Y161.685
G1 X117.379 Y160.543 E.02622
G1 X117.379 Y159.979
G1 X116.238 Y161.121 E.02622
G1 X116.238 Y160.557
G1 X117.379 Y159.416 E.02622
G1 X117.379 Y158.852
G1 X116.238 Y159.994 E.02622
G1 X116.238 Y159.43
G1 X117.379 Y158.289 E.02622
G1 X117.379 Y157.725
G1 X116.238 Y158.867 E.02622
G1 X116.238 Y158.303
G1 X117.379 Y157.161 E.02622
G1 X117.379 Y156.598
G1 X116.238 Y157.739 E.02622
G1 X116.238 Y157.176
G1 X117.379 Y156.034 E.02622
G1 X117.379 Y155.471
G1 X116.238 Y156.612 E.02622
G1 X116.238 Y156.049
G1 X117.379 Y154.907 E.02622
G1 X117.379 Y154.343
G1 X116.238 Y155.485 E.02622
G1 X116.238 Y154.921
G1 X117.379 Y153.78 E.02622
G1 X117.379 Y153.216
G1 X116.238 Y154.358 E.02622
G1 X116.238 Y153.794
G1 X117.379 Y152.652 E.02622
G1 X117.379 Y152.089
G1 X116.238 Y153.231 E.02622
G1 X116.238 Y152.667
G1 X117.379 Y151.525 E.02622
G1 X117.379 Y150.962
G1 X116.237 Y152.104 E.02623
G1 X116.147 Y151.631
G1 X117.367 Y150.411 E.02802
G1 X117.22 Y149.994
G1 X115.947 Y151.267 E.02922
G1 X115.665 Y150.985
G1 X116.938 Y149.712 E.02922
G1 X116.522 Y149.565
G1 X115.301 Y150.785 E.02802
G1 X114.828 Y150.695
G1 X115.97 Y149.553 E.02622
G1 X115.406 Y149.553
G1 X114.265 Y150.694 E.02621
G1 X113.702 Y150.694
G1 X114.843 Y149.553 E.02621
G1 X114.279 Y149.553
G1 X113.138 Y150.694 E.02621
G1 X112.574 Y150.694
G1 X113.716 Y149.553 E.02621
G1 X113.152 Y149.553
G1 X112.011 Y150.694 E.02621
G1 X111.447 Y150.694
G1 X112.588 Y149.553 E.02621
G1 X112.025 Y149.553
G1 X110.884 Y150.694 E.02621
G1 X110.32 Y150.694
G1 X111.461 Y149.553 E.02621
G1 X110.898 Y149.553
G1 X109.756 Y150.694 E.02621
G1 X109.193 Y150.694
G1 X110.334 Y149.553 E.02621
G1 X109.77 Y149.553
G1 X108.629 Y150.694 E.02621
G1 X108.065 Y150.694
G1 X109.207 Y149.553 E.02621
G1 X108.643 Y149.553
G1 X107.502 Y150.694 E.02621
G1 X106.938 Y150.694
G1 X108.08 Y149.553 E.02621
G1 X107.516 Y149.553
G1 X106.375 Y150.694 E.02621
G1 X105.811 Y150.694
G1 X106.952 Y149.553 E.02621
G1 X106.389 Y149.553
G1 X105.247 Y150.694 E.02621
G1 X104.684 Y150.694
G1 X105.825 Y149.553 E.02621
G1 X105.262 Y149.553
G1 X104.12 Y150.694 E.02621
G1 X103.557 Y150.694
G1 X104.698 Y149.553 E.02621
G1 X104.134 Y149.553
G1 X102.993 Y150.694 E.02621
G1 X102.429 Y150.694
G1 X103.571 Y149.553 E.02621
G1 X103.007 Y149.553
G1 X101.866 Y150.694 E.02621
G1 X101.302 Y150.694
G1 X102.444 Y149.553 E.02621
G1 X101.88 Y149.553
G1 X100.739 Y150.694 E.02621
G1 X100.175 Y150.694
G1 X101.317 Y149.553 E.02621
G1 X100.753 Y149.553
G1 X99.611 Y150.694 E.02621
G1 X99.048 Y150.694
G1 X100.189 Y149.553 E.02621
G1 X99.626 Y149.553
G1 X98.484 Y150.694 E.02621
G1 X97.921 Y150.694
G1 X99.062 Y149.553 E.02621
G1 X98.499 Y149.553
G1 X97.353 Y150.698 E.02631
; WIPE_START
M204 S6000
G1 X98.499 Y149.553 E-.61561
G1 X98.879 Y149.553 E-.14439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.935 Y149.553 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X94.838 Y152.65 E.07112
G1 X94.838 Y152.086
G1 X97.371 Y149.553 E.05818
G1 X96.808 Y149.553
G1 X94.838 Y151.523 E.04524
G1 X94.838 Y150.959
G1 X96.244 Y149.553 E.03229
G1 X95.665 Y149.568
G1 X94.853 Y150.38 E.01864
; WIPE_START
M204 S6000
G1 X95.665 Y149.568 E-.43619
G1 X96.244 Y149.553 E-.22015
G1 X96.051 Y149.746 E-.10366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.276 Y150.621 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101926
G1 F15000
M204 S6000
G1 X97.046 Y150.744 E.00085
; WIPE_START
G1 X97.276 Y150.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.029 Y151.761 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101952
G1 F15000
M204 S6000
G1 X95.906 Y151.99 E.00085
; WIPE_START
G1 X96.029 Y151.761 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.426 Y157.158 Z1.2 F42000
G1 X115.171 Y170.904 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101809
G1 F15000
M204 S6000
G1 X114.942 Y171.026 E.00085
; WIPE_START
G1 X115.171 Y170.904 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.311 Y169.656 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101818
G1 F15000
M204 S6000
G1 X116.189 Y169.886 E.00085
; OBJECT_ID: 171
; WIPE_START
G1 X116.311 Y169.656 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 160
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X123.55 Y167.235 Z1.2 F42000
G1 X164.791 Y153.441 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.163 Y153.506 E.00613
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03759
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
M73 P54 R10
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X149.629 Y170.736 E.00927
G1 X151.22 Y170.16 E.02747
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.777 Y153.5 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.163 Y153.506 E-.14654
G1 X164.793 Y155.077 E-.61346
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.446 Z1.2 F42000
G1 X165.097 Y132.924 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03758
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X140.207 Y150.812 E.00931
G1 X138.483 Y150.566 E.02827
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.165 Y143.791 E.03675
G1 X160.67 Y142.1 E.03675
G1 X161.999 Y140.269 E.03674
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.684 Z1.2 F42000
G1 X128.325 Y128.942 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.009 Y128.601 I-.324 J-.017 E.02658
G1 X128.041 Y128.603 E.00057
G3 X128.323 Y128.882 I-.041 J.322 E.00744
M204 S250
G1 X128.739 Y128.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.733 Y128.963 E.00012
G3 X127.945 Y128.189 I-.737 J-.038 E.05502
G3 X128.068 Y128.191 I.052 J.609 E.00199
G3 X128.726 Y128.817 I-.072 J.734 E.01589
G1 X128.734 Y128.9 E.00136
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.733 Y128.963 E-.0238
G1 X128.696 Y129.179 E-.08346
G1 X128.632 Y129.312 E-.05599
G1 X128.543 Y129.43 E-.05598
G1 X128.433 Y129.527 E-.05598
G1 X128.305 Y129.601 E-.056
G1 X128.165 Y129.648 E-.05596
G1 X128.019 Y129.666 E-.056
G1 X127.872 Y129.655 E-.05596
G1 X127.73 Y129.615 E-.05601
G1 X127.599 Y129.548 E-.05596
G1 X127.484 Y129.456 E-.05595
G1 X127.351 Y129.28 E-.08383
G1 X127.342 Y129.258 E-.00914
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 9/72
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S193.8
; OBJECT_ID: 193
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.931 J-.784 P1  F42000
G1 X91.763 Y171.473 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X91.776 Y171.509 E.00067
G3 X91.478 Y171.248 I-.319 J.064 E.02829
G1 X91.515 Y171.253 E.00066
G3 X91.726 Y171.391 I-.059 J.32 E.00453
G1 X91.738 Y171.418 E.00052
M204 S250
G1 X92.148 Y171.311 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.183 Y171.427 E.00197
G3 X91.587 Y172.302 I-.725 J.146 E.01915
G3 X91.514 Y170.836 I-.125 J-.729 E.0406
G3 X92.126 Y171.255 I-.056 J.738 E.01261
; OBJECT_ID: 149
; WIPE_START
M204 S6000
G1 X92.183 Y171.427 E-.06886
G1 X92.198 Y171.574 E-.05593
G1 X92.184 Y171.72 E-.05594
G1 X92.14 Y171.861 E-.05603
G1 X92.025 Y172.049 E-.08377
G1 X91.92 Y172.152 E-.05592
G1 X91.796 Y172.232 E-.05603
G1 X91.587 Y172.302 E-.08378
G1 X91.44 Y172.313 E-.05599
G1 X91.294 Y172.295 E-.05601
G1 X91.154 Y172.248 E-.05595
G1 X91.027 Y172.174 E-.05604
G1 X90.99 Y172.138 E-.01976
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X95.767 Y166.185 Z1.3 F42000
G1 X149.551 Y99.163 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.534 Y99.129 E.00066
G3 X149.498 Y98.9 I.571 J-.208 E.00407
G1 X149.498 Y86.253 E.22083
G3 X149.706 Y85.787 I.588 J-.016 E.0092
G3 X150.066 Y85.684 I.34 J.504 E.00666
G1 X162.774 Y85.693 E.22188
G3 X163.246 Y86.024 I.009 J.49 E.01075
G1 X163.283 Y86.253 E.00405
G1 X163.283 Y98.9 E.22083
G3 X163.075 Y99.366 I-.588 J.016 E.0092
G3 X162.714 Y99.469 I-.34 J-.503 E.00666
G1 X150.066 Y99.469 E.22083
G3 X149.601 Y99.261 I-.016 J-.588 E.0092
G1 X149.578 Y99.216 E.00088
M204 S10000
G1 X149.169 Y99.357 F42000
G1 F6000
M204 S6000
G1 X149.121 Y99.263 E.00184
G1 X149.069 Y98.934 E.00582
G1 X149.069 Y86.219 E.22201
G1 X149.121 Y85.89 E.00582
G3 X149.703 Y85.308 I.913 J.331 E.01484
G1 X150.033 Y85.255 E.00582
G1 X162.748 Y85.255 E.22201
G1 X162.841 Y85.27 E.00165
G1 X163.077 Y85.308 E.00417
G3 X163.659 Y85.89 I-.361 J.943 E.0148
G1 X163.711 Y86.219 E.00582
G1 X163.711 Y98.934 E.22201
G1 X163.659 Y99.263 E.00582
G3 X163.077 Y99.845 I-.914 J-.332 E.01484
G1 X162.748 Y99.898 E.00582
G1 X150.033 Y99.898 E.22201
G1 X149.703 Y99.845 E.00582
G3 X149.255 Y99.512 I.331 J-.913 E.00989
G1 X149.198 Y99.41 E.00205
M204 S250
G1 X148.801 Y99.545 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.723 Y99.393 E.00278
G1 X148.656 Y98.948 E.0073
G1 X148.656 Y86.205 E.20693
G1 X148.723 Y85.76 E.0073
G1 X148.911 Y85.391 E.00673
G1 X149.204 Y85.098 E.00673
G1 X149.574 Y84.909 E.00673
G1 X150.018 Y84.842 E.0073
G1 X162.762 Y84.842 E.20693
G3 X162.906 Y84.862 I.009 J.464 E.00237
G1 X163.206 Y84.909 E.00494
G1 X163.576 Y85.098 E.00673
G1 X163.869 Y85.391 E.00673
G1 X164.057 Y85.76 E.00673
G1 X164.125 Y86.205 E.0073
G1 X164.125 Y98.948 E.20693
G1 X164.057 Y99.393 E.0073
G1 X163.869 Y99.762 E.00673
G1 X163.576 Y100.055 E.00673
G1 X163.206 Y100.244 E.00673
G1 X162.762 Y100.311 E.0073
G1 X150.018 Y100.311 E.20693
G1 X149.574 Y100.244 E.0073
G1 X149.204 Y100.055 E.00673
G1 X148.911 Y99.762 E.00673
G1 X148.828 Y99.599 E.00298
; WIPE_START
M204 S6000
G1 X148.723 Y99.393 E-.08778
G1 X148.656 Y98.948 E-.17078
G1 X148.656 Y97.629 E-.50144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 9 start: 138,149,171,182,193,204
M624 ewAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.3
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer9 end: 138,149,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.67 Y98.832 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4204
G1 F15000
M204 S6000
G1 X149.915 Y99.078 E.00565
G2 X150.094 Y99.118 I.15 J-.255 E.00302
G1 X150.519 Y99.118 E.00691
G1 X149.849 Y98.447 E.0154
G1 X149.849 Y97.883 E.00917
G1 X151.083 Y99.118 E.02837
G1 X151.647 Y99.118 E.00917
G1 X149.849 Y97.319 E.04134
G1 X149.849 Y96.755 E.00917
G1 X152.212 Y99.118 E.05431
G1 X152.776 Y99.118 E.00917
G1 X149.849 Y96.191 E.06728
G1 X149.849 Y95.627 E.00917
G1 X153.34 Y99.118 E.08025
G1 X153.904 Y99.118 E.00917
G1 X149.849 Y95.062 E.09322
G1 X149.849 Y94.498 E.00917
G1 X154.468 Y99.118 E.10618
G1 X155.033 Y99.118 E.00917
G1 X149.849 Y93.934 E.11915
G1 X149.849 Y93.37 E.00917
G1 X155.597 Y99.118 E.13212
G1 X156.161 Y99.118 E.00917
G1 X149.849 Y92.806 E.14509
G1 X149.849 Y92.241 E.00917
G1 X156.725 Y99.118 E.15806
G1 X157.289 Y99.118 E.00917
G1 X149.849 Y91.677 E.17103
G1 X149.849 Y91.113 E.00917
G1 X157.854 Y99.118 E.184
G1 X158.418 Y99.118 E.00917
G1 X149.849 Y90.549 E.19697
G1 X149.849 Y89.985 E.00917
G1 X158.982 Y99.118 E.20994
G1 X159.546 Y99.118 E.00917
G1 X149.849 Y89.421 E.22291
G1 X149.849 Y88.856 E.00917
G1 X160.11 Y99.118 E.23587
G1 X160.674 Y99.118 E.00917
G1 X149.849 Y88.292 E.24884
G1 X149.849 Y87.728 E.00917
G1 X161.239 Y99.118 E.26181
G1 X161.803 Y99.118 E.00917
G1 X149.849 Y87.164 E.27478
G1 X149.849 Y86.6 E.00917
G1 X162.367 Y99.118 E.28775
G2 X162.833 Y99.094 I.16 J-1.482 E.00762
G2 X162.878 Y99.065 I-.023 J-.085 E.00089
G1 X149.902 Y86.088 E.29829
G1 X149.915 Y86.075 E.0003
G3 X150.414 Y86.036 I.338 J1.099 E.0082
G1 X162.931 Y98.553 E.28774
G1 X162.931 Y97.989 E.00917
G1 X150.978 Y86.036 E.27477
G1 X151.543 Y86.037 E.00918
G1 X162.931 Y97.425 E.26179
G1 X162.931 Y96.861 E.00917
G1 X152.107 Y86.037 E.24881
G1 X152.672 Y86.037 E.00918
G1 X162.931 Y96.297 E.23583
G1 X162.931 Y95.732 E.00917
G1 X153.237 Y86.038 E.22285
G1 X153.801 Y86.038 E.00918
G1 X162.931 Y95.168 E.20987
G1 X162.931 Y94.604 E.00917
G1 X154.366 Y86.039 E.19689
G1 X154.93 Y86.039 E.00918
G1 X162.931 Y94.04 E.18391
G1 X162.931 Y93.476 E.00917
G1 X155.495 Y86.039 E.17094
G1 X156.06 Y86.04 E.00918
G1 X162.931 Y92.911 E.15796
G1 X162.931 Y92.347 E.00917
G1 X156.624 Y86.04 E.14498
G1 X157.189 Y86.041 E.00918
G1 X162.931 Y91.783 E.132
G1 X162.931 Y91.219 E.00917
G1 X157.753 Y86.041 E.11902
G1 X158.318 Y86.042 E.00918
G1 X162.931 Y90.655 E.10604
G1 X162.931 Y90.091 E.00917
G1 X158.883 Y86.042 E.09306
G1 X159.447 Y86.042 E.00918
G1 X162.931 Y89.526 E.08008
G1 X162.931 Y88.962 E.00917
G1 X160.012 Y86.043 E.06711
G1 X160.577 Y86.043 E.00918
G1 X162.931 Y88.398 E.05413
G1 X162.931 Y87.834 E.00917
G1 X161.141 Y86.044 E.04115
G1 X161.706 Y86.044 E.00918
G1 X162.931 Y87.27 E.02817
G1 X162.931 Y86.705 E.00917
G1 X162.27 Y86.045 E.01519
G1 X162.746 Y86.045 E.00774
G3 X162.865 Y86.075 I.013 J.197 E.00202
G1 X163.111 Y86.321 E.00565
; OBJECT_ID: 138
; WIPE_START
G1 X162.865 Y86.075 E-.13207
G1 X162.746 Y86.045 E-.04639
G1 X162.27 Y86.045 E-.18092
G1 X162.931 Y86.705 E-.35515
G1 X162.931 Y86.825 E-.04547
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X162.432 Y94.441 Z1.3 F42000
M73 P55 R10
G1 X160.492 Y124.036 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.3 F42000
G1 X146.692 Y107.186 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.06 J-13.32 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.066 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.454 J-13.449 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.111 J-16.436 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.3 F42000
G1 X161.25 Y107.186 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.3 F42000
G1 X163.48 Y115.886 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.235 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.3 F42000
G1 X160.706 Y108.351 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.191 Y125.554 E.0078
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.257 J-13.376 E.06091
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01065
G2 X163.228 Y125.517 I-9.036 J-15.458 E.05034
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.00551
; LINE_WIDTH: 0.439768
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465805
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.019
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474339
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.959 E.00882
; LINE_WIDTH: 0.437388
G1 X160.749 Y126.785 E.00514
; LINE_WIDTH: 0.472185
G1 X160.997 Y126.61 E.00557
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X161.245 Y126.436 E.006
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420178
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X143.424 Y126.372 E.00371
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.651 Y125.894 E.01448
; LINE_WIDTH: 0.437993
G1 X142.957 Y126.083 E.00611
; LINE_WIDTH: 0.462209
G1 X143.263 Y126.272 E.00646
G1 X142.837 Y125.738 E.01226
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00981
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.159 J-13.876 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.138 J-17.573 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00712
G1 X144.074 Y125.292 E.26467
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.686 J-13.588 E.06694
G1 X160.221 Y128.012 E.25436
G2 X162.917 Y126.297 I-8.941 J-17.029 E.05196
G1 X163.626 Y125.703 E.01502
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
M73 P56 R10
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00469
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.3 F42000
G1 X146.057 Y104.126 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 171
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X148.126 Y111.226 Z1.3 F42000
G1 X164.789 Y153.441 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.163 Y153.506 E.00616
G1 X164.681 Y155.553 E.03414
G1 X163.93 Y157.741 E.03758
G1 X162.963 Y159.845 E.03759
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03758
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03758
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03758
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03759
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03675
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.163 Y153.506 E-.14725
G1 X164.793 Y155.076 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.444 Z1.3 F42000
G1 X165.097 Y132.924 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03758
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X135.916 Y149.899 E.00552
G1 X134.055 Y149.238 E.03206
G1 X131.962 Y148.25 E.03759
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.518 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03675
G1 X153.759 Y147.86 E.03674
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35756
G1 X164.94 Y134.912 E-.40244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.684 Z1.3 F42000
G1 X128.32 Y128.942 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X128.319 Y129.008 E.00114
G3 X128.08 Y128.611 I-.315 J-.08 E.02668
G1 X128.104 Y128.618 E.00045
G3 X128.326 Y128.877 I-.1 J.31 E.00627
G1 X128.325 Y128.882 E.00009
M204 S250
G1 X128.734 Y128.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.945 Y128.189 I-.738 J-.037 E.05514
G3 X128.068 Y128.191 I.052 J.608 E.00199
G3 X128.734 Y128.903 I-.072 J.736 E.01731
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.696 Y129.179 E-.10609
G1 X128.632 Y129.312 E-.05598
G1 X128.543 Y129.43 E-.05594
G1 X128.433 Y129.527 E-.05604
G1 X128.305 Y129.601 E-.05596
G1 X128.165 Y129.648 E-.05598
G1 X128.019 Y129.666 E-.05598
G1 X127.872 Y129.655 E-.05598
G1 X127.73 Y129.615 E-.05599
G1 X127.539 Y129.505 E-.08379
G1 X127.434 Y129.402 E-.05593
G1 X127.351 Y129.28 E-.05599
G1 X127.341 Y129.255 E-.01035
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 10/72
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 193
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I-.931 J-.784 P1  F42000
G1 X91.776 Y171.476 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X91.465 Y171.248 I-.31 J.097 E.02843
G1 X91.483 Y171.249 E.00032
G3 X91.753 Y171.42 I-.017 J.324 E.00583
M204 S250
G1 X92.158 Y171.337 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.172 Y171.353 E.00036
G3 X91.458 Y170.834 I-.705 J.219 E.0599
G1 X91.514 Y170.836 E.00091
G3 X92.114 Y171.216 I-.046 J.736 E.01204
G1 X92.137 Y171.28 E.0011
; OBJECT_ID: 149
; WIPE_START
M204 S6000
G1 X92.172 Y171.353 E-.03084
G1 X92.198 Y171.574 E-.08427
G1 X92.184 Y171.72 E-.05595
G1 X92.14 Y171.861 E-.05598
G1 X92.07 Y171.99 E-.05598
G1 X91.975 Y172.103 E-.05599
G1 X91.86 Y172.195 E-.05594
G1 X91.729 Y172.262 E-.056
G1 X91.587 Y172.302 E-.05599
G1 X91.44 Y172.313 E-.05598
G1 X91.294 Y172.295 E-.05599
G1 X91.154 Y172.248 E-.05598
G1 X91.027 Y172.174 E-.05598
G1 X90.969 Y172.123 E-.02913
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X95.746 Y166.17 Z1.4 F42000
G1 X149.501 Y99.173 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.494 Y99.159 E.00028
G3 X149.457 Y98.925 I.586 J-.213 E.00416
G1 X149.457 Y86.228 E.22168
G3 X149.672 Y85.75 I.605 J-.016 E.00947
G3 X150.042 Y85.643 I.349 J.517 E.00684
G1 X162.738 Y85.643 E.22168
G1 X162.815 Y85.656 E.00136
G3 X163.286 Y85.994 I.002 J.493 E.01083
G1 X163.323 Y86.228 E.00414
G1 X163.323 Y98.925 E.22168
G3 X163.109 Y99.403 I-.605 J.016 E.00947
G3 X162.738 Y99.51 I-.349 J-.517 E.00684
G1 X150.042 Y99.51 E.22168
G3 X149.564 Y99.295 I-.016 J-.605 E.00947
G1 X149.529 Y99.226 E.00134
M204 S10000
G1 X149.12 Y99.368 F42000
G1 F6000
M204 S6000
G1 X149.081 Y99.293 E.00147
G1 X149.028 Y98.958 E.00591
G1 X149.028 Y86.195 E.22286
G1 X149.081 Y85.86 E.00591
G3 X149.674 Y85.268 I.948 J.356 E.01508
G1 X150.008 Y85.215 E.00591
G1 X162.772 Y85.215 E.22286
G1 X162.882 Y85.232 E.00195
G1 X163.106 Y85.268 E.00396
G3 X163.699 Y85.86 I-.368 J.96 E.01507
G1 X163.752 Y86.195 E.00591
G1 X163.752 Y98.958 E.22286
G1 X163.699 Y99.293 E.00591
G3 X163.106 Y99.885 I-.948 J-.356 E.01508
G1 X162.772 Y99.938 E.00591
G1 X150.008 Y99.938 E.22286
G1 X149.674 Y99.885 E.00591
G3 X149.22 Y99.545 I.356 J-.948 E.01005
G1 X149.149 Y99.42 E.0025
M204 S250
G1 X148.751 Y99.555 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.683 Y99.422 E.00243
G1 X148.615 Y98.973 E.00738
G1 X148.615 Y86.18 E.20772
G1 X148.683 Y85.731 E.00738
G1 X148.874 Y85.357 E.00681
G1 X149.171 Y85.06 E.00682
G1 X149.545 Y84.87 E.00681
G1 X149.994 Y84.801 E.00738
G1 X162.786 Y84.801 E.20773
G3 X162.947 Y84.824 I.009 J.518 E.00265
G1 X163.236 Y84.87 E.00475
G1 X163.61 Y85.06 E.00681
G1 X163.906 Y85.357 E.00682
G1 X164.097 Y85.731 E.00681
G1 X164.165 Y86.18 E.00738
G1 X164.165 Y98.973 E.20772
G1 X164.097 Y99.422 E.00738
G1 X163.906 Y99.796 E.00681
G1 X163.61 Y100.093 E.00682
G1 X163.236 Y100.283 E.00681
G1 X162.786 Y100.352 E.00738
G1 X149.994 Y100.352 E.20772
G1 X149.544 Y100.283 E.00738
G1 X149.171 Y100.093 E.00681
G1 X148.874 Y99.796 E.00682
G1 X148.778 Y99.609 E.00341
; WIPE_START
M204 S6000
G1 X148.683 Y99.422 E-.07963
G1 X148.615 Y98.973 E-.17274
G1 X148.615 Y97.637 E-.50763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 10 start: 138,149,171,182,193,204
M624 ewAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer10 end: 138,149,171,182,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X150.105 Y85.816 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42254
G1 F15000
M204 S6000
G1 X149.849 Y86.072 E.00592
G2 X149.809 Y86.256 I.263 J.155 E.00314
G1 X149.809 Y86.68 E.00692
G1 X150.493 Y85.995 E.01582
G1 X151.06 Y85.995 E.00927
G1 X149.809 Y87.247 E.02893
G1 X149.809 Y87.814 E.00927
G1 X151.628 Y85.995 E.04204
G1 X152.195 Y85.995 E.00927
G1 X149.809 Y88.381 E.05515
G1 X149.809 Y88.948 E.00927
G1 X152.762 Y85.995 E.06826
G1 X153.329 Y85.995 E.00927
G1 X149.809 Y89.516 E.08137
G1 X149.809 Y90.083 E.00927
G1 X153.897 Y85.995 E.09448
G1 X154.464 Y85.995 E.00927
G1 X149.809 Y90.65 E.10758
G1 X149.809 Y91.217 E.00927
G1 X155.031 Y85.995 E.12069
G1 X155.598 Y85.995 E.00927
G1 X149.809 Y91.784 E.1338
G1 X149.809 Y92.352 E.00927
G1 X156.165 Y85.995 E.14691
G1 X156.733 Y85.995 E.00927
G1 X149.809 Y92.919 E.16002
G1 X149.809 Y93.486 E.00927
G1 X157.3 Y85.995 E.17313
G1 X157.867 Y85.995 E.00927
G1 X149.809 Y94.053 E.18623
G1 X149.809 Y94.621 E.00927
G1 X158.434 Y85.995 E.19934
G1 X159.001 Y85.995 E.00927
G1 X149.809 Y95.188 E.21245
G1 X149.809 Y95.755 E.00927
G1 X159.569 Y85.995 E.22556
G1 X160.136 Y85.995 E.00927
G1 X149.809 Y96.322 E.23867
G1 X149.809 Y96.889 E.00927
M73 P57 R10
G1 X160.703 Y85.995 E.25178
G1 X161.27 Y85.995 E.00927
G1 X149.809 Y97.457 E.26489
G1 X149.809 Y98.024 E.00927
G1 X161.837 Y85.995 E.27799
G1 X162.405 Y85.995 E.00927
G1 X149.809 Y98.591 E.2911
G2 X149.833 Y99.049 I1.456 J.153 E.00752
G2 X149.866 Y99.101 I.097 J-.026 E.00103
G1 X162.914 Y86.053 E.30154
G1 X162.929 Y86.067 E.00034
G3 X162.972 Y86.562 I-1.01 J.337 E.0082
G1 X150.376 Y99.158 E.29109
G1 X150.943 Y99.158 E.00927
G1 X162.972 Y87.129 E.27799
G1 X162.972 Y87.697 E.00927
G1 X151.51 Y99.158 E.26488
G1 X152.078 Y99.158 E.00927
G1 X162.972 Y88.264 E.25177
G1 X162.972 Y88.831 E.00927
G1 X152.645 Y99.158 E.23866
G1 X153.212 Y99.158 E.00927
G1 X162.972 Y89.398 E.22555
G1 X162.972 Y89.966 E.00927
G1 X153.779 Y99.158 E.21244
G1 X154.346 Y99.158 E.00927
G1 X162.972 Y90.533 E.19933
G1 X162.972 Y91.1 E.00927
G1 X154.914 Y99.158 E.18623
G1 X155.481 Y99.158 E.00927
G1 X162.972 Y91.667 E.17312
G1 X162.972 Y92.234 E.00927
G1 X156.048 Y99.158 E.16001
G1 X156.615 Y99.158 E.00927
G1 X162.972 Y92.802 E.1469
G1 X162.972 Y93.369 E.00927
G1 X157.182 Y99.158 E.13379
G1 X157.75 Y99.158 E.00927
G1 X162.972 Y93.936 E.12068
G1 X162.972 Y94.503 E.00927
G1 X158.317 Y99.158 E.10758
G1 X158.884 Y99.158 E.00927
G1 X162.972 Y95.07 E.09447
G1 X162.972 Y95.638 E.00927
G1 X159.451 Y99.158 E.08136
G1 X160.019 Y99.158 E.00927
G1 X162.972 Y96.205 E.06825
G1 X162.972 Y96.772 E.00927
G1 X160.586 Y99.158 E.05514
G1 X161.153 Y99.158 E.00927
G1 X162.972 Y97.339 E.04203
G1 X162.972 Y97.907 E.00927
G1 X161.72 Y99.158 E.02892
G1 X162.287 Y99.158 E.00927
G1 X162.972 Y98.474 E.01582
G1 X162.972 Y98.897 E.00692
G3 X162.931 Y99.082 I-.305 J.029 E.00315
G1 X162.675 Y99.337 E.0059
; OBJECT_ID: 138
; WIPE_START
G1 X162.931 Y99.082 E-.1373
G1 X162.972 Y98.897 E-.07202
G1 X162.972 Y98.474 E-.16081
G1 X162.287 Y99.158 E-.36778
G1 X162.229 Y99.158 E-.02209
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X161.698 Y106.772 Z1.4 F42000
G1 X160.492 Y124.036 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.4 F42000
G1 X146.692 Y107.186 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.06 J-13.321 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.066 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.454 J-13.449 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.111 J-16.436 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
M73 P57 R9
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.4 F42000
G1 X161.25 Y107.186 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.4 F42000
G1 X163.48 Y115.886 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.4 F42000
G1 X160.706 Y108.351 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.191 Y125.554 E.0078
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.257 J-13.376 E.06091
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01064
G2 X163.228 Y125.517 I-9.041 J-15.465 E.05035
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.0055
; LINE_WIDTH: 0.439758
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465782
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.01901
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.465 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.5117
G1 F14686.685
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443413
G1 F15000
M204 S6000
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474339
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.96 E.00881
; LINE_WIDTH: 0.437382
G1 X160.748 Y126.785 E.00515
; LINE_WIDTH: 0.472165
M73 P58 R9
G1 X160.997 Y126.61 E.00558
; LINE_WIDTH: 0.506948
G1 F14830.43
G1 X161.245 Y126.436 E.00601
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472165
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420177
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.50284
G1 F14956.999
M204 S6000
G1 X143.424 Y126.372 E.00371
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.651 Y125.894 E.01448
; LINE_WIDTH: 0.437993
G1 X142.957 Y126.083 E.00611
; LINE_WIDTH: 0.462209
G1 X143.263 Y126.272 E.00646
G1 X142.837 Y125.738 E.01226
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00981
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.159 J-13.876 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.611 I-9.137 J-17.572 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00713
G1 X144.074 Y125.292 E.26467
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.686 J-13.588 E.06694
G1 X160.221 Y128.012 E.25436
G1 X160.898 Y127.65 E.01247
G2 X163.626 Y125.703 I-9.381 J-16.023 E.05451
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00469
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.4 F42000
G1 X146.057 Y104.126 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 171
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 171
M624 CAAAAAAAAAA=
M204 S10000
G1 X148.126 Y111.226 Z1.4 F42000
G1 X164.789 Y153.441 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X165.163 Y153.506 E.00616
G1 X164.681 Y155.553 E.03414
G1 X163.929 Y157.742 E.03758
G1 X162.963 Y159.845 E.03758
G1 X161.792 Y161.841 E.03758
G1 X160.428 Y163.711 E.03758
G1 X158.884 Y165.435 E.03758
G1 X157.176 Y166.997 E.03759
G1 X155.321 Y168.381 E.03758
G1 X153.337 Y169.573 E.03758
G1 X151.244 Y170.561 E.03759
G1 X149.063 Y171.336 E.03758
G1 X146.815 Y171.89 E.03758
G1 X144.524 Y172.216 E.03758
G1 X142.212 Y172.313 E.03758
G1 X139.901 Y172.179 E.03758
G1 X137.615 Y171.815 E.03758
G1 X135.377 Y171.225 E.03758
G1 X133.209 Y170.415 E.03758
G1 X131.133 Y169.392 E.03758
G1 X129.168 Y168.168 E.03758
G1 X127.336 Y166.754 E.03758
G1 X125.653 Y165.165 E.03758
G1 X124.138 Y163.416 E.03758
G1 X122.804 Y161.524 E.03758
G1 X121.666 Y159.509 E.03758
G1 X120.734 Y157.39 E.03758
G1 X120.031 Y155.229 E.03691
G1 X120.202 Y154.248 E.01617
G1 X120.482 Y155.441 E.0199
G1 X121.216 Y157.581 E.03674
G1 X122.158 Y159.639 E.03674
G1 X123.3 Y161.593 E.03675
G1 X124.629 Y163.424 E.03674
G1 X126.133 Y165.114 E.03675
G1 X127.798 Y166.648 E.03675
G1 X129.606 Y168.008 E.03674
G1 X131.54 Y169.183 E.03675
G1 X133.581 Y170.16 E.03674
G1 X135.709 Y170.931 E.03675
G1 X137.902 Y171.487 E.03675
G1 X140.14 Y171.822 E.03675
G1 X142.4 Y171.934 E.03674
G1 X144.66 Y171.822 E.03674
G1 X146.898 Y171.487 E.03675
G1 X149.092 Y170.931 E.03675
G1 X151.22 Y170.16 E.03674
G1 X153.261 Y169.183 E.03674
G1 X155.195 Y168.008 E.03675
G1 X157.003 Y166.648 E.03674
G1 X158.667 Y165.114 E.03675
G1 X160.172 Y163.424 E.03675
G1 X161.501 Y161.593 E.03674
G1 X162.643 Y159.639 E.03675
G1 X163.585 Y157.581 E.03674
G1 X164.319 Y155.441 E.03674
G1 X164.775 Y153.499 E.03239
; OBJECT_ID: 182
; WIPE_START
M204 S6000
G1 X165.163 Y153.506 E-.14725
G1 X164.793 Y155.076 E-.61275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 171
M625
; start printing object, unique label id: 182
M624 EAAAAAAAAAA=
M204 S10000
G1 X164.898 Y147.444 Z1.4 F42000
G1 X165.097 Y132.924 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.268 Y133.905 E.01617
G1 X164.565 Y136.067 E.03691
G1 X163.633 Y138.185 E.03758
G1 X162.495 Y140.2 E.03758
G1 X161.161 Y142.092 E.03758
G1 X159.645 Y143.841 E.03758
G1 X157.963 Y145.431 E.03758
G1 X156.131 Y146.845 E.03758
G1 X154.166 Y148.069 E.03759
G1 X152.09 Y149.091 E.03758
G1 X149.922 Y149.901 E.03758
G1 X147.683 Y150.491 E.03758
G1 X145.398 Y150.855 E.03758
G1 X143.087 Y150.99 E.03758
G1 X140.775 Y150.893 E.03758
G1 X138.483 Y150.566 E.03758
G1 X136.236 Y150.013 E.03758
G1 X134.055 Y149.238 E.03758
G1 X131.962 Y148.25 E.03758
G1 X129.978 Y147.058 E.03758
G1 X128.123 Y145.674 E.03759
G1 X126.415 Y144.112 E.03758
G1 X124.871 Y142.387 E.03758
G1 X123.507 Y140.517 E.03759
G1 X122.336 Y138.521 E.03758
G1 X121.369 Y136.418 E.03759
G1 X120.617 Y134.229 E.03758
G1 X120.136 Y132.182 E.03414
G1 X120.51 Y132.117 E.00616
G1 X120.98 Y134.117 E.03336
G1 X121.714 Y136.258 E.03674
G1 X122.656 Y138.315 E.03674
G1 X123.798 Y140.269 E.03675
G1 X125.127 Y142.101 E.03675
G1 X126.631 Y143.791 E.03674
G1 X128.296 Y145.324 E.03675
G1 X130.104 Y146.685 E.03674
G1 X132.038 Y147.86 E.03675
G1 X134.079 Y148.837 E.03674
G1 X136.207 Y149.607 E.03675
G1 X138.4 Y150.163 E.03675
G1 X140.638 Y150.499 E.03675
G1 X142.898 Y150.611 E.03674
G1 X145.159 Y150.499 E.03674
G1 X147.396 Y150.163 E.03675
G1 X149.59 Y149.607 E.03675
G1 X151.718 Y148.837 E.03674
G1 X153.759 Y147.86 E.03675
G1 X155.693 Y146.685 E.03675
G1 X157.501 Y145.324 E.03674
G1 X159.166 Y143.791 E.03675
G1 X160.67 Y142.101 E.03674
G1 X161.999 Y140.269 E.03675
G1 X163.141 Y138.315 E.03675
G1 X164.083 Y136.258 E.03674
G1 X164.817 Y134.117 E.03674
G1 X165.083 Y132.982 E.01893
; OBJECT_ID: 204
; WIPE_START
M204 S6000
G1 X165.268 Y133.905 E-.35757
G1 X164.941 Y134.912 E-.40243
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 182
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X157.407 Y133.684 Z1.4 F42000
G1 X128.318 Y128.942 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.009 Y128.601 I-.324 J-.017 E.02669
G1 X128.027 Y128.602 E.00032
G3 X128.316 Y128.882 I-.033 J.323 E.00757
M204 S250
G1 X128.739 Y128.966 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.707 Y129.106 E.00233
G3 X128.019 Y128.187 I-.715 J-.182 E.05391
G1 X128.075 Y128.191 E.00091
G3 X128.729 Y128.914 I-.083 J.733 E.0173
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.707 Y129.106 E-.07356
G1 X128.667 Y129.248 E-.05578
G1 X128.59 Y129.373 E-.05591
G1 X128.49 Y129.481 E-.05598
G1 X128.371 Y129.567 E-.05599
G1 X128.236 Y129.628 E-.05596
G1 X128.093 Y129.66 E-.05599
G1 X127.946 Y129.664 E-.05594
G1 X127.801 Y129.639 E-.05595
G1 X127.663 Y129.585 E-.05601
G1 X127.539 Y129.505 E-.05602
G1 X127.434 Y129.402 E-.05596
G1 X127.351 Y129.28 E-.05599
G1 X127.336 Y129.244 E-.01496
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 11/72
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S196.35
; OBJECT_ID: 193
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.93 J-.784 P1  F42000
G1 X91.758 Y171.447 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X91.515 Y171.894 I-.3 J.126 E.0102
G3 X91.483 Y171.249 I-.055 J-.321 E.01922
G3 X91.73 Y171.394 I-.025 J.325 E.00518
M204 S250
G1 X92.161 Y171.344 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X92.165 Y171.356 E.0002
G3 X91.587 Y172.302 I-.707 J.218 E.02035
G3 X91.514 Y170.836 I-.125 J-.729 E.0406
G3 X92.108 Y171.22 I-.056 J.738 E.01197
G1 X92.137 Y171.289 E.00122
; OBJECT_ID: 149
; WIPE_START
M204 S6000
G1 X92.165 Y171.356 E-.02744
G1 X92.195 Y171.5 E-.05596
G1 X92.184 Y171.72 E-.0838
G1 X92.14 Y171.861 E-.056
G1 X92.07 Y171.99 E-.05592
G1 X91.975 Y172.103 E-.05599
G1 X91.86 Y172.195 E-.05597
G1 X91.729 Y172.262 E-.05595
G1 X91.587 Y172.302 E-.056
G1 X91.44 Y172.313 E-.05599
G1 X91.294 Y172.295 E-.05598
G1 X91.089 Y172.214 E-.08382
G1 X90.969 Y172.128 E-.05599
G1 X90.96 Y172.118 E-.00519
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X95.735 Y166.164 Z1.5 F42000
G1 X149.454 Y99.188 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.416 Y98.949 I.601 J-.218 E.00425
G1 X149.416 Y86.204 E.22253
G3 X149.638 Y85.712 I.623 J-.015 E.00973
G3 X150.018 Y85.603 I.359 J.53 E.00702
G1 X162.763 Y85.603 E.22253
G1 X162.856 Y85.618 E.00166
G3 X163.326 Y85.965 I-.008 J.502 E.01088
G1 X163.364 Y86.204 E.00423
G1 X163.364 Y98.949 E.22253
G3 X163.142 Y99.44 I-.623 J.015 E.00973
G3 X162.763 Y99.55 I-.359 J-.53 E.00702
G1 X150.018 Y99.55 E.22253
G3 X149.526 Y99.329 I-.015 J-.623 E.00973
G3 X149.477 Y99.243 I.53 J-.359 E.00172
M204 S10000
G1 X149.07 Y99.378 F42000
G1 F6000
M204 S6000
G1 X149.042 Y99.322 E.00109
G1 X148.988 Y98.983 E.006
G1 X148.988 Y86.17 E.22371
G1 X149.042 Y85.831 E.006
G3 X149.645 Y85.228 I.983 J.38 E.01532
G1 X149.984 Y85.174 E.006
G1 X162.796 Y85.174 E.22371
G1 X162.923 Y85.194 E.00224
G1 X163.136 Y85.228 E.00375
G3 X163.739 Y85.831 I-.374 J.977 E.01533
G1 X163.792 Y86.17 E.006
G1 X163.792 Y98.983 E.22371
G1 X163.739 Y99.322 E.006
G3 X163.136 Y99.925 I-.983 J-.38 E.01532
G1 X162.796 Y99.979 E.006
G1 X149.984 Y99.979 E.22371
G1 X149.645 Y99.925 E.006
G3 X149.184 Y99.577 I.38 J-.983 E.01021
G1 X149.1 Y99.43 E.00296
M204 S250
G1 X148.702 Y99.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.644 Y99.451 E.00208
G1 X148.574 Y98.997 E.00746
G1 X148.574 Y86.156 E.20851
G1 X148.644 Y85.701 E.00746
G1 X148.836 Y85.323 E.0069
G1 X149.137 Y85.023 E.0069
G1 X149.515 Y84.83 E.0069
G1 X149.97 Y84.761 E.00746
G1 X162.811 Y84.761 E.20851
G3 X162.988 Y84.786 I.009 J.572 E.00292
G1 X163.265 Y84.83 E.00455
G1 X163.644 Y85.023 E.0069
G1 X163.944 Y85.323 E.0069
G1 X164.137 Y85.702 E.0069
G1 X164.206 Y86.156 E.00746
G1 X164.206 Y98.997 E.20851
G1 X164.137 Y99.451 E.00746
G1 X163.944 Y99.83 E.0069
G1 X163.644 Y100.13 E.0069
G1 X163.265 Y100.323 E.0069
G1 X162.811 Y100.392 E.00746
G1 X149.97 Y100.392 E.20851
G1 X149.515 Y100.323 E.00746
G1 X149.137 Y100.13 E.0069
G1 X148.836 Y99.83 E.0069
G1 X148.729 Y99.619 E.00385
; WIPE_START
M204 S6000
G1 X148.644 Y99.451 E-.07138
G1 X148.574 Y98.997 E-.17465
G1 X148.574 Y97.644 E-.51398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 11 start: 138,149,193,204
M624 YwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.5
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer11 end: 138,149,193,204
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.589 Y98.891 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42469
G1 F15000
M204 S6000
G1 X149.854 Y99.156 E.00617
G2 X150.045 Y99.199 I.161 J-.273 E.00327
G1 X150.467 Y99.199 E.00692
G1 X149.768 Y98.5 E.01624
G1 X149.768 Y97.93 E.00937
G1 X151.037 Y99.199 E.02948
M73 P59 R9
G1 X151.607 Y99.199 E.00937
G1 X149.768 Y97.359 E.04273
G1 X149.768 Y96.789 E.00937
G1 X152.177 Y99.199 E.05598
G1 X152.748 Y99.199 E.00937
G1 X149.768 Y96.219 E.06923
G1 X149.768 Y95.649 E.00937
G1 X153.318 Y99.199 E.08248
G1 X153.888 Y99.199 E.00937
G1 X149.768 Y95.078 E.09573
G1 X149.768 Y94.508 E.00937
G1 X154.459 Y99.199 E.10898
G1 X155.029 Y99.199 E.00937
G1 X149.768 Y93.938 E.12223
G1 X149.768 Y93.368 E.00937
G1 X155.599 Y99.199 E.13548
G1 X156.169 Y99.199 E.00937
G1 X149.768 Y92.797 E.14873
G1 X149.768 Y92.227 E.00937
G1 X156.74 Y99.199 E.16198
G1 X157.31 Y99.199 E.00937
G1 X149.768 Y91.657 E.17523
G1 X149.768 Y91.087 E.00937
G1 X157.88 Y99.199 E.18848
G1 X158.45 Y99.199 E.00937
G1 X149.768 Y90.516 E.20173
G1 X149.768 Y89.946 E.00937
G1 X159.021 Y99.199 E.21498
G1 X159.591 Y99.199 E.00937
G1 X149.768 Y89.376 E.22823
G1 X149.768 Y88.806 E.00937
G1 X160.161 Y99.199 E.24147
G1 X160.731 Y99.199 E.00937
G1 X149.768 Y88.235 E.25472
G1 X149.768 Y87.665 E.00937
G1 X161.302 Y99.199 E.26797
G1 X161.872 Y99.199 E.00937
G1 X149.768 Y87.095 E.28122
G1 X149.768 Y86.525 E.00937
G1 X162.442 Y99.199 E.29447
G2 X162.892 Y99.174 I.146 J-1.431 E.00743
G2 X162.95 Y99.136 I-.029 J-.108 E.00116
G1 X149.831 Y86.017 E.30482
G1 X149.847 Y86 E.00038
G3 X150.338 Y85.954 I.34 J.982 E.00818
G1 X163.012 Y98.628 E.29447
G1 X163.012 Y98.058 E.00937
G1 X150.908 Y85.954 E.28122
G1 X151.479 Y85.954 E.00937
G1 X163.012 Y97.488 E.26797
G1 X163.012 Y96.918 E.00937
G1 X152.049 Y85.954 E.25472
G1 X152.619 Y85.954 E.00937
G1 X163.012 Y96.347 E.24147
G1 X163.012 Y95.777 E.00937
G1 X153.19 Y85.954 E.22822
G1 X153.76 Y85.954 E.00937
G1 X163.012 Y95.207 E.21497
G1 X163.012 Y94.637 E.00937
G1 X154.33 Y85.954 E.20173
G1 X154.9 Y85.954 E.00937
G1 X163.012 Y94.066 E.18848
G1 X163.012 Y93.496 E.00937
G1 X155.471 Y85.954 E.17523
G1 X156.041 Y85.954 E.00937
G1 X163.012 Y92.926 E.16198
G1 X163.012 Y92.356 E.00937
G1 X156.611 Y85.954 E.14873
G1 X157.181 Y85.954 E.00937
G1 X163.012 Y91.785 E.13548
G1 X163.012 Y91.215 E.00937
G1 X157.752 Y85.954 E.12223
G1 X158.322 Y85.954 E.00937
G1 X163.012 Y90.645 E.10898
G1 X163.012 Y90.075 E.00937
G1 X158.892 Y85.954 E.09573
G1 X159.462 Y85.954 E.00937
G1 X163.012 Y89.504 E.08248
G1 X163.012 Y88.934 E.00937
G1 X160.033 Y85.954 E.06923
G1 X160.603 Y85.954 E.00937
G1 X163.012 Y88.364 E.05598
G1 X163.012 Y87.794 E.00937
G1 X161.173 Y85.954 E.04273
G1 X161.743 Y85.954 E.00937
G1 X163.012 Y87.223 E.02948
G1 X163.012 Y86.653 E.00937
G1 X162.314 Y85.954 E.01623
G1 X162.735 Y85.954 E.00692
G3 X162.926 Y85.997 I-.051 J.681 E.00323
G1 X163.192 Y86.262 E.00616
; OBJECT_ID: 138
; WIPE_START
G1 X162.926 Y85.997 E-.14258
G1 X162.735 Y85.954 E-.07449
G1 X162.314 Y85.954 E-.16012
G1 X163.012 Y86.653 E-.37549
G1 X163.012 Y86.672 E-.00732
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X162.499 Y94.287 Z1.5 F42000
G1 X160.492 Y124.036 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.5 F42000
G1 X146.692 Y107.186 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.06 J-13.32 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.067 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.454 J-13.449 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.5 F42000
G1 X161.25 Y107.186 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.5 F42000
G1 X163.48 Y115.886 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.5 F42000
G1 X160.706 Y108.351 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
M73 P60 R9
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.67 Y126.004 E.0067
G1 X143.347 Y125.775 E.00643
G1 X143.078 Y125.136 E.01125
G1 X143.077 Y117.539 E.12336
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I10.723 J-12.583 E.06093
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01064
G2 X163.228 Y125.517 I-9.036 J-15.459 E.05035
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.00551
; LINE_WIDTH: 0.439768
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465805
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.019
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.444878
G1 F15000
M204 S6000
G1 X143.781 Y126.451 E.00509
; LINE_WIDTH: 0.477745
G1 X143.489 Y126.414 E.00548
G1 X143.991 Y126.785 E.01161
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.96 E.00881
; LINE_WIDTH: 0.437388
G1 X160.748 Y126.785 E.00515
; LINE_WIDTH: 0.472185
G1 X160.997 Y126.61 E.00558
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X161.245 Y126.436 E.00601
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420178
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.015 Y126.087 F42000
; LINE_WIDTH: 0.52717
G1 F14237.408
M204 S6000
G1 X143.439 Y126.38 E.01062
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X142.315 Y125.11 E.08593
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.095 Y125.46 E.00304
; LINE_WIDTH: 0.439125
G1 X142.402 Y125.669 E.00631
; LINE_WIDTH: 0.477395
G1 X142.709 Y125.878 E.00689
; LINE_WIDTH: 0.515665
G1 F14568.854
G1 X143.015 Y126.087 E.00747
G1 X142.903 Y125.776 E.00665
; LINE_WIDTH: 0.477395
G1 F15000
G1 X142.792 Y125.465 E.00614
; LINE_WIDTH: 0.420869
G1 X142.68 Y125.154 E.00538
G1 X142.679 Y125.093 E.00099
G1 X142.679 Y118.29 E.1107
M204 S10000
G1 X142.556 Y116.943 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G1 X141.293 Y126.353 E.01153
G2 X144.46 Y128.411 I10.964 J-13.4 E.06144
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.138 J-17.574 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.373 Y125.292 E.00713
G1 X144.074 Y125.292 E.26467
G1 X143.929 Y125.229 E.00257
G1 X143.875 Y125.093 E.00238
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G1 X141.544 Y126.043 E.00837
G2 X144.559 Y128.012 I10.638 J-12.991 E.0586
G1 X160.221 Y128.012 E.25436
G1 X160.898 Y127.651 E.01247
G2 X163.626 Y125.703 I-9.377 J-16.018 E.05451
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.832 Y125.639 E.00402
G1 X143.638 Y125.502 E.00386
G1 X143.476 Y125.093 E.00715
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.5 F42000
G1 X146.057 Y104.126 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 204
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X141.009 Y110.423 Z1.5 F42000
G1 X128.321 Y128.942 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X128.009 Y128.601 I-.324 J-.017 E.02665
G1 X128.033 Y128.603 E.00042
G3 X128.318 Y128.882 I-.036 J.323 E.00751
M204 S250
G1 X128.739 Y128.969 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.71 Y129.107 E.00229
G3 X128.019 Y128.187 I-.715 J-.183 E.05384
G1 X128.082 Y128.192 E.00102
G3 X128.733 Y128.912 I-.087 J.733 E.01721
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X128.71 Y129.107 E-.07472
G1 X128.667 Y129.247 E-.05574
G1 X128.59 Y129.373 E-.05596
G1 X128.49 Y129.481 E-.056
G1 X128.371 Y129.567 E-.05595
G1 X128.236 Y129.628 E-.05597
G1 X128.093 Y129.66 E-.056
G1 X127.945 Y129.664 E-.05598
G1 X127.8 Y129.639 E-.056
G1 X127.663 Y129.585 E-.05595
G1 X127.54 Y129.505 E-.05597
G1 X127.434 Y129.402 E-.05603
G1 X127.351 Y129.28 E-.05594
G1 X127.337 Y129.247 E-.0138
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 12/72
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 193
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I-.934 J-.78 P1  F42000
G1 X92.161 Y171.344 Z1.5
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X92.166 Y171.356 E.0002
G3 X91.444 Y170.834 I-.705 J.216 E.05975
G1 X91.514 Y170.836 E.00114
G3 X92.109 Y171.22 I-.054 J.736 E.01199
G1 X92.138 Y171.289 E.00122
; WIPE_START
M204 S6000
G1 X92.166 Y171.356 E-.02755
G1 X92.198 Y171.574 E-.08375
G1 X92.184 Y171.72 E-.05596
G1 X92.14 Y171.861 E-.05598
G1 X92.07 Y171.99 E-.056
G1 X91.975 Y172.103 E-.05595
G1 X91.86 Y172.195 E-.056
G1 X91.729 Y172.262 E-.05596
G1 X91.587 Y172.302 E-.05601
G1 X91.44 Y172.313 E-.05594
G1 X91.294 Y172.295 E-.05601
G1 X91.154 Y172.248 E-.05595
G1 X91.027 Y172.174 E-.05601
G1 X90.962 Y172.117 E-.03293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 193
M625
; object ids of layer 12 start: 138,149,193,204
M624 YwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer12 end: 138,149,193,204
M625
; start printing object, unique label id: 193
M624 IAAAAAAAAAA=
G1 X91.937 Y171.378 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X91.262 Y172.053 E.0155
G1 X90.98 Y171.771
G1 X91.655 Y171.095 E.01551
M204 S10000
G1 X91.99 Y171.652 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143334
G1 F15000
M204 S6000
G3 X91.535 Y172.104 I-1.275 J-.83 E.00321
M204 S10000
G1 X91.908 Y171.317 F42000
; LINE_WIDTH: 0.0775198
G1 F15000
M204 S6000
G2 X91.717 Y171.127 I-.858 J.667 E.00062
M204 S10000
G1 X91.117 Y171.158 F42000
; LINE_WIDTH: 0.0805619
G1 F15000
M204 S6000
G1 X90.943 Y171.503 E.00093
M204 S10000
G1 X91.383 Y171.048 F42000
; LINE_WIDTH: 0.12843
G1 F15000
M204 S6000
G1 X91.22 Y171.161 E.00086
; LINE_WIDTH: 0.150975
G2 X90.929 Y171.485 I.922 J1.12 E.00231
; OBJECT_ID: 149
; WIPE_START
G1 X91.083 Y171.289 E-.4331
G1 X91.22 Y171.161 E-.3269
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 193
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X96.02 Y165.226 Z1.6 F42000
G1 X149.415 Y99.217 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.376 Y98.973 E.00431
G1 X149.376 Y86.18 E.22338
G3 X149.604 Y85.675 I.641 J-.014 E.01
G1 X149.749 Y85.601 E.00285
G1 X149.993 Y85.562 E.00431
G1 X162.787 Y85.562 E.22338
G1 X162.897 Y85.58 E.00195
G3 X163.366 Y85.936 I-.021 J.514 E.01093
G1 X163.404 Y86.18 E.00431
G1 X163.404 Y98.973 E.22338
G3 X163.176 Y99.478 I-.641 J.014 E.01
G1 X163.031 Y99.552 E.00285
G1 X162.787 Y99.591 E.00431
G1 X149.993 Y99.591 E.22338
G3 X149.489 Y99.363 I-.014 J-.641 E.01
G1 X149.442 Y99.271 E.0018
M204 S10000
G1 X149.02 Y99.387 F42000
G1 F6000
M204 S6000
G1 X149.002 Y99.351 E.00071
G1 X148.947 Y99.007 E.00609
G1 X148.947 Y86.146 E.22456
G1 X149.002 Y85.802 E.00609
G3 X149.615 Y85.188 I.908 J.295 E.01572
G1 X149.96 Y85.134 E.00609
G1 X162.821 Y85.134 E.22456
G1 X162.964 Y85.157 E.00254
G1 X163.165 Y85.188 E.00355
G3 X163.778 Y85.802 I-.381 J.994 E.0156
G1 X163.833 Y86.146 E.00609
G1 X163.833 Y99.007 E.22456
G1 X163.778 Y99.351 E.00609
G3 X163.165 Y99.965 I-.908 J-.295 E.01572
G1 X162.821 Y100.019 E.00609
G1 X149.96 Y100.019 E.22456
G1 X149.615 Y99.965 E.00609
G3 X149.138 Y99.618 I.295 J-.908 E.01048
G1 X149.048 Y99.441 E.00347
M204 S250
G1 X148.652 Y99.575 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.604 Y99.481 E.00172
G1 X148.534 Y99.021 E.00754
G1 X148.534 Y86.132 E.2093
G1 X148.604 Y85.672 E.00754
G1 X148.799 Y85.289 E.00698
G1 X149.103 Y84.985 E.00698
G1 X149.486 Y84.79 E.00698
G1 X149.945 Y84.72 E.00754
G1 X162.835 Y84.72 E.2093
G3 X163.029 Y84.748 I.009 J.626 E.0032
G1 X163.294 Y84.79 E.00436
G1 X163.677 Y84.985 E.00698
G1 X163.981 Y85.289 E.00698
G1 X164.176 Y85.672 E.00698
G1 X164.246 Y86.132 E.00754
G1 X164.246 Y99.021 E.2093
G1 X164.176 Y99.481 E.00754
G1 X163.981 Y99.864 E.00698
G1 X163.677 Y100.168 E.00698
G1 X163.294 Y100.363 E.00698
G1 X162.835 Y100.433 E.00754
G1 X149.945 Y100.433 E.2093
G1 X149.486 Y100.363 E.00754
G1 X149.103 Y100.168 E.00698
G1 X148.799 Y99.864 E.00698
G1 X148.679 Y99.629 E.00429
; WIPE_START
M204 S6000
G1 X148.604 Y99.481 E-.06304
G1 X148.534 Y99.021 E-.17656
G1 X148.534 Y97.652 E-.52039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.495 Y90.08 Z1.6 F42000
G1 X150.047 Y85.734 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42683
G1 F15000
M204 S6000
G1 X149.753 Y86.046 E.00707
G2 X149.727 Y86.627 I1.821 J.372 E.00966
M73 P61 R9
G1 X150.441 Y85.914 E.01666
G1 X151.014 Y85.914 E.00947
G1 X149.727 Y87.2 E.03005
G1 X149.727 Y87.774 E.00947
G1 X151.587 Y85.914 E.04344
G1 X152.161 Y85.914 E.00947
G1 X149.727 Y88.347 E.05684
G1 X149.727 Y88.92 E.00947
G1 X152.734 Y85.914 E.07023
G1 X153.307 Y85.914 E.00947
G1 X149.727 Y89.494 E.08362
G1 X149.727 Y90.067 E.00947
G1 X153.881 Y85.914 E.09701
G1 X154.454 Y85.914 E.00947
G1 X149.727 Y90.64 E.1104
G1 X149.727 Y91.213 E.00947
G1 X155.027 Y85.914 E.12379
G1 X155.6 Y85.914 E.00947
G1 X149.727 Y91.787 E.13718
G1 X149.727 Y92.36 E.00947
G1 X156.174 Y85.914 E.15057
G1 X156.747 Y85.914 E.00947
G1 X149.727 Y92.933 E.16396
G1 X149.727 Y93.507 E.00947
G1 X157.32 Y85.914 E.17735
G1 X157.894 Y85.914 E.00947
G1 X149.727 Y94.08 E.19074
G1 X149.727 Y94.653 E.00947
G1 X158.467 Y85.914 E.20413
G1 X159.04 Y85.914 E.00947
G1 X149.727 Y95.226 E.21752
G1 X149.727 Y95.8 E.00947
G1 X159.613 Y85.914 E.23091
G1 X160.187 Y85.914 E.00947
G1 X149.727 Y96.373 E.2443
G1 X149.727 Y96.946 E.00947
G1 X160.76 Y85.914 E.25769
G1 X161.333 Y85.914 E.00947
G1 X149.727 Y97.52 E.27108
G1 X149.727 Y98.093 E.00947
G1 X161.906 Y85.914 E.28447
G1 X162.48 Y85.914 E.00947
G1 X149.727 Y98.666 E.29786
G2 X149.753 Y99.107 I1.405 J.14 E.00733
G2 X149.795 Y99.172 I.12 J-.032 E.00129
G1 X162.985 Y85.981 E.3081
G1 X163.004 Y86 E.00043
G3 X163.053 Y86.487 I-.96 J.343 E.00818
G1 X150.301 Y99.239 E.29785
G1 X150.874 Y99.239 E.00947
G1 X163.053 Y87.061 E.28446
G1 X163.053 Y87.634 E.00947
G1 X151.447 Y99.239 E.27107
G1 X152.021 Y99.239 E.00947
G1 X163.053 Y88.207 E.25768
G1 X163.053 Y88.78 E.00947
G1 X152.594 Y99.239 E.24429
G1 X153.167 Y99.239 E.00947
G1 X163.053 Y89.354 E.2309
G1 X163.053 Y89.927 E.00947
G1 X153.741 Y99.239 E.21751
G1 X154.314 Y99.239 E.00947
G1 X163.053 Y90.5 E.20412
G1 X163.053 Y91.073 E.00947
G1 X154.887 Y99.239 E.19073
G1 X155.46 Y99.239 E.00947
G1 X163.053 Y91.647 E.17734
G1 X163.053 Y92.22 E.00947
G1 X156.034 Y99.239 E.16395
G1 X156.607 Y99.239 E.00947
G1 X163.053 Y92.793 E.15056
G1 X163.053 Y93.367 E.00947
G1 X157.18 Y99.239 E.13717
G1 X157.754 Y99.239 E.00947
G1 X163.053 Y93.94 E.12378
G1 X163.053 Y94.513 E.00947
G1 X158.327 Y99.239 E.11039
G1 X158.9 Y99.239 E.00947
G1 X163.053 Y95.086 E.097
G1 X163.053 Y95.66 E.00947
G1 X159.473 Y99.239 E.08361
G1 X160.047 Y99.239 E.00947
G1 X163.053 Y96.233 E.07022
G1 X163.053 Y96.806 E.00947
G1 X160.62 Y99.239 E.05683
G1 X161.193 Y99.239 E.00947
G1 X163.053 Y97.38 E.04344
G1 X163.053 Y97.953 E.00947
G1 X161.766 Y99.239 E.03005
G1 X162.34 Y99.239 E.00947
G1 X163.053 Y98.526 E.01666
G1 X163.053 Y98.946 E.00693
G3 X163.009 Y99.143 I-.327 J.031 E.0034
G1 X162.734 Y99.419 E.00643
; OBJECT_ID: 138
; WIPE_START
G1 X163.009 Y99.143 E-.14783
G1 X163.053 Y98.946 E-.07703
G1 X163.053 Y98.526 E-.15938
G1 X162.354 Y99.225 E-.37576
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G1 X161.783 Y106.836 Z1.6 F42000
G1 X160.492 Y124.036 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.6 F42000
G1 X146.692 Y107.186 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.06 J-13.32 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.066 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.454 J-13.45 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.437 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.6 F42000
G1 X161.25 Y107.186 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.6 F42000
G1 X163.48 Y115.886 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.235 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
M73 P61 R8
G1 E-.04 F1800
M204 S10000
G1 X161.395 Y109.516 Z1.6 F42000
G1 X160.706 Y108.351 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
M73 P62 R8
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.66 Y125.999 E.00688
G1 X143.509 Y125.914 E.00281
G1 X143.191 Y125.554 E.00781
G1 X143.077 Y125.093 E.00771
G1 X143.077 Y117.539 E.12266
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I11.625 J-13.923 E.0609
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01064
G2 X163.228 Y125.517 I-9.037 J-15.459 E.05035
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.00551
; LINE_WIDTH: 0.439763
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465794
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.019
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51172
G1 F14686.085
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.443408
G1 F15000
M204 S6000
G1 X143.774 Y126.446 E.0052
; LINE_WIDTH: 0.474327
G1 X143.474 Y126.404 E.00558
G1 X143.991 Y126.785 E.01185
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.959 E.00882
; LINE_WIDTH: 0.437385
G1 X160.748 Y126.785 E.00514
; LINE_WIDTH: 0.472175
G1 X160.997 Y126.61 E.00557
; LINE_WIDTH: 0.506965
G1 F14829.92
G1 X161.245 Y126.436 E.006
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472175
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420178
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.263 Y126.272 F42000
; LINE_WIDTH: 0.50282
G1 F14957.619
M204 S6000
G1 X143.423 Y126.372 E.00371
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350583
G1 F15000
M204 S6000
G1 X142.315 Y125.111 E.08595
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.65 Y125.894 E.01447
; LINE_WIDTH: 0.437988
G1 X142.957 Y126.083 E.00611
; LINE_WIDTH: 0.462197
G1 X143.263 Y126.272 E.00646
G1 X142.837 Y125.738 E.01226
; LINE_WIDTH: 0.41999
G1 X142.68 Y125.155 E.00981
G1 X142.679 Y125.093 E.00101
G1 X142.679 Y118.29 E.11046
M204 S10000
G1 X142.556 Y116.943 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G2 X144.46 Y128.411 I12.159 J-13.876 E.07294
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.138 J-17.573 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00712
G1 X144.074 Y125.292 E.26467
G1 X143.961 Y125.257 E.00192
G1 X143.875 Y125.093 E.00301
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420078
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G2 X144.559 Y128.012 I11.687 J-13.589 E.06694
G1 X160.221 Y128.012 E.25436
G2 X162.917 Y126.297 I-8.941 J-17.03 E.05196
G1 X163.626 Y125.703 E.01502
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.825 Y125.636 E.00413
G1 X143.735 Y125.585 E.00168
G1 X143.544 Y125.369 E.00469
G1 X143.476 Y125.093 E.00463
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.6 F42000
G1 X146.057 Y104.126 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 204
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 204
M624 QAAAAAAAAAA=
M204 S10000
G1 X141.086 Y110.474 Z1.6 F42000
G1 X128.738 Y128.972 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.714 Y129.108 E.00225
G3 X128.019 Y128.187 I-.715 J-.183 E.05378
G1 X128.089 Y128.192 E.00114
G3 X128.737 Y128.912 I-.09 J.732 E.01715
M204 S10000
G1 X128.479 Y128.729 F42000
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X127.804 Y129.404 E.01551
G1 X127.522 Y129.122
G1 X128.195 Y128.449 E.01546
M204 S10000
G1 X128.53 Y129.015 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151067
G1 F15000
M204 S6000
G3 X128.239 Y129.339 I-1.213 J-.796 E.00231
; LINE_WIDTH: 0.128531
G1 X128.076 Y129.452 E.00086
M204 S10000
G1 X128.516 Y128.997 F42000
; LINE_WIDTH: 0.0805619
G1 F15000
M204 S6000
G1 X128.342 Y129.342 E.00093
M204 S10000
G1 X128.349 Y128.559 F42000
; LINE_WIDTH: 0.0778106
G1 F15000
M204 S6000
G2 X128.25 Y128.475 I-.469 J.449 E.0003
M204 S10000
G1 X128.452 Y128.67 F42000
; LINE_WIDTH: 0.077142
G1 F15000
M204 S6000
G2 X128.349 Y128.559 I-.405 J.272 E.00035
; LINE_WIDTH: 0.069247
G1 X128.342 Y128.574 E.00003
; LINE_WIDTH: 0.0412735
G1 X128.335 Y128.589 E.00001
M204 S10000
G1 X127.906 Y128.398 F42000
; LINE_WIDTH: 0.151232
G1 F15000
M204 S6000
G2 X127.58 Y128.698 I.82 J1.22 E.00235
; LINE_WIDTH: 0.122957
G1 X127.478 Y128.85 E.00076
M204 S10000
G1 X127.928 Y128.411 F42000
; LINE_WIDTH: 0.0834355
G1 F15000
M204 S6000
G1 X127.578 Y128.593 E.001
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X127.928 Y128.411 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 204
M625
; layer num/total_layer_count: 13/72
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.162 J1.206 P1  F42000
G1 X160.492 Y124.036 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.7 F42000
G1 X146.692 Y107.186 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.062 J-13.323 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.046 J-16.067 E.08518
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.454 J-13.449 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.112 J-16.436 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.7 F42000
G1 X161.25 Y107.186 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.7 F42000
G1 X163.48 Y115.886 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
M73 P63 R8
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 138
M625
; object ids of layer 13 start: 138,149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer13 end: 138,149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X160.706 Y108.351 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.67 Y126.004 E.0067
G1 X143.347 Y125.775 E.00643
G1 X143.078 Y125.136 E.01125
G1 X143.077 Y117.539 E.12336
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I10.725 J-12.585 E.06093
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01064
G2 X163.228 Y125.517 I-9.039 J-15.462 E.05035
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.0055
; LINE_WIDTH: 0.439768
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465805
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.01901
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51174
G1 F14685.485
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35056
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.2014
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.444878
G1 F15000
M204 S6000
G1 X143.781 Y126.451 E.00509
; LINE_WIDTH: 0.477745
G1 X143.489 Y126.414 E.00548
G1 X143.991 Y126.785 E.01161
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.96 E.00881
; LINE_WIDTH: 0.437388
G1 X160.748 Y126.785 E.00515
; LINE_WIDTH: 0.472185
G1 X160.997 Y126.61 E.00558
; LINE_WIDTH: 0.506982
G1 F14829.41
G1 X161.245 Y126.436 E.00601
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472185
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420178
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.015 Y126.087 F42000
; LINE_WIDTH: 0.52717
G1 F14237.408
M204 S6000
G1 X143.439 Y126.38 E.01062
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X142.315 Y125.11 E.08593
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.095 Y125.46 E.00304
; LINE_WIDTH: 0.439125
G1 X142.402 Y125.669 E.00631
; LINE_WIDTH: 0.477395
G1 X142.709 Y125.878 E.00689
; LINE_WIDTH: 0.515665
G1 F14568.854
G1 X143.015 Y126.087 E.00747
G1 X142.903 Y125.776 E.00665
; LINE_WIDTH: 0.477395
G1 F15000
G1 X142.792 Y125.465 E.00614
; LINE_WIDTH: 0.420869
G1 X142.68 Y125.154 E.00538
G1 X142.679 Y125.093 E.00099
G1 X142.679 Y118.29 E.1107
M204 S10000
G1 X142.556 Y116.943 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G1 X141.293 Y126.353 E.01153
G2 X144.46 Y128.411 I10.964 J-13.4 E.06144
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.138 J-17.574 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.374 Y125.292 E.00713
G1 X144.074 Y125.292 E.26467
G1 X143.929 Y125.229 E.00257
G1 X143.875 Y125.093 E.00238
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G1 X141.544 Y126.043 E.00837
G2 X144.559 Y128.012 I10.638 J-12.991 E.0586
G1 X160.221 Y128.012 E.25436
G2 X162.917 Y126.297 I-8.941 J-17.029 E.05196
G1 X163.626 Y125.703 E.01502
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.832 Y125.639 E.00402
G1 X143.638 Y125.502 E.00386
G1 X143.476 Y125.093 E.00715
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.7 F42000
G1 X146.057 Y104.126 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 149
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.375 Y99.247 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X149.335 Y98.998 I.632 J-.228 E.00443
G1 X149.335 Y86.155 E.22423
G3 X149.57 Y85.638 I.659 J-.013 E.01026
G3 X149.969 Y85.522 I.378 J.556 E.00737
G1 X162.811 Y85.522 E.22423
G1 X162.938 Y85.542 E.00225
G3 X163.405 Y85.906 I-.034 J.526 E.01098
G1 X163.445 Y86.155 E.0044
G1 X163.445 Y98.998 E.22423
G3 X163.21 Y99.515 I-.659 J.013 E.01026
G3 X162.811 Y99.631 I-.378 J-.556 E.00737
G1 X149.969 Y99.631 E.22423
G3 X149.451 Y99.396 I-.013 J-.659 E.01026
G3 X149.398 Y99.302 I.556 J-.378 E.0019
M204 S10000
G1 X148.97 Y99.397 F42000
G1 F6000
M204 S6000
G1 X148.962 Y99.381 E.00032
G1 X148.907 Y99.031 E.00618
G1 X148.907 Y86.122 E.22541
G1 X148.962 Y85.772 E.00618
G3 X149.586 Y85.149 I1.011 J.387 E.01586
G1 X149.935 Y85.093 E.00618
G1 X162.845 Y85.093 E.22541
G1 X163.005 Y85.119 E.00284
G1 X163.194 Y85.149 E.00334
G3 X163.818 Y85.772 I-.387 J1.011 E.01586
G1 X163.873 Y86.122 E.00618
G1 X163.873 Y99.031 E.22541
G1 X163.818 Y99.381 E.00618
G3 X163.194 Y100.004 I-1.011 J-.387 E.01586
G1 X162.845 Y100.06 E.00618
G1 X149.935 Y100.06 E.22541
G1 X149.586 Y100.004 E.00618
G3 X149.109 Y99.645 I.387 J-1.011 E.01057
G1 X149 Y99.449 E.00391
M204 S250
G1 X148.602 Y99.585 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.564 Y99.51 E.00136
G1 X148.493 Y99.046 E.00763
G1 X148.493 Y86.107 E.21009
G1 X148.564 Y85.643 E.00763
G1 X148.761 Y85.255 E.00706
G1 X149.069 Y84.948 E.00706
G1 X149.456 Y84.75 E.00706
G1 X149.921 Y84.68 E.00763
G1 X162.859 Y84.68 E.21009
G3 X163.07 Y84.71 I.009 J.681 E.00347
G1 X163.324 Y84.75 E.00417
G1 X163.711 Y84.948 E.00706
G1 X164.019 Y85.255 E.00706
G1 X164.216 Y85.643 E.00706
G1 X164.287 Y86.107 E.00763
G1 X164.287 Y99.046 E.21009
G1 X164.216 Y99.51 E.00763
G1 X164.019 Y99.898 E.00706
G1 X163.711 Y100.205 E.00706
G1 X163.324 Y100.403 E.00706
G1 X162.859 Y100.473 E.00763
G1 X149.921 Y100.473 E.21009
G1 X149.456 Y100.403 E.00763
G1 X149.069 Y100.205 E.00706
G1 X148.761 Y99.898 E.00706
G1 X148.629 Y99.638 E.00473
; WIPE_START
M204 S6000
G1 X148.564 Y99.51 E-.05462
G1 X148.493 Y99.046 E-.1785
G1 X148.493 Y97.659 E-.52689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.011 Y99.459 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42049
G1 F15000
M204 S6000
G1 X149.739 Y99.186 E.00627
G1 X149.713 Y99.137 E.0009
G3 X149.687 Y98.57 I1.775 J-.367 E.00926
G1 X150.396 Y99.28 E.01631
G1 X150.961 Y99.28 E.00917
G1 X149.687 Y98.006 E.02929
G1 X149.687 Y97.442 E.00917
G1 X151.525 Y99.28 E.04226
G1 X152.089 Y99.28 E.00917
G1 X149.687 Y96.877 E.05524
M73 P64 R8
G1 X149.687 Y96.313 E.00917
G1 X152.654 Y99.28 E.06821
G1 X153.218 Y99.28 E.00917
G1 X149.687 Y95.749 E.08119
G1 X149.687 Y95.184 E.00917
G1 X153.782 Y99.28 E.09416
G1 X154.347 Y99.28 E.00917
G1 X149.687 Y94.62 E.10714
G1 X149.687 Y94.056 E.00917
G1 X154.911 Y99.28 E.12011
G1 X155.475 Y99.28 E.00917
G1 X149.687 Y93.491 E.13309
G1 X149.687 Y92.927 E.00917
G1 X156.04 Y99.28 E.14606
G1 X156.604 Y99.28 E.00917
G1 X149.687 Y92.363 E.15904
G1 X149.687 Y91.798 E.00917
G1 X157.168 Y99.28 E.17201
G1 X157.732 Y99.28 E.00917
G1 X149.687 Y91.234 E.18499
G1 X149.687 Y90.67 E.00917
G1 X158.297 Y99.28 E.19796
G1 X158.861 Y99.28 E.00917
G1 X149.687 Y90.106 E.21093
G1 X149.687 Y89.541 E.00917
G1 X159.425 Y99.28 E.22391
G1 X159.99 Y99.28 E.00917
G1 X149.687 Y88.977 E.23688
G1 X149.687 Y88.413 E.00917
G1 X160.554 Y99.28 E.24986
G1 X161.118 Y99.28 E.00917
G1 X149.687 Y87.848 E.26283
G1 X149.687 Y87.284 E.00917
G1 X161.683 Y99.28 E.27581
G1 X162.247 Y99.28 E.00917
G1 X149.687 Y86.72 E.28878
G1 X149.691 Y86.159 E.00911
G1 X162.807 Y99.276 E.30158
G2 X163.09 Y98.994 I.034 J-.248 E.0075
G1 X149.973 Y85.877 E.30158
G1 X150.533 Y85.873 E.00911
G1 X163.093 Y98.433 E.28878
G1 X163.093 Y97.869 E.00917
G1 X151.098 Y85.873 E.27581
G1 X151.662 Y85.873 E.00917
G1 X163.093 Y97.305 E.26283
G1 X163.093 Y96.74 E.00917
G1 X152.226 Y85.873 E.24986
G1 X152.791 Y85.873 E.00917
G1 X163.093 Y96.176 E.23688
G1 X163.093 Y95.612 E.00917
G1 X153.355 Y85.873 E.22391
G1 X153.919 Y85.873 E.00917
G1 X163.093 Y95.047 E.21093
G1 X163.093 Y94.483 E.00917
G1 X154.484 Y85.873 E.19796
G1 X155.048 Y85.873 E.00917
G1 X163.093 Y93.919 E.18498
G1 X163.093 Y93.354 E.00917
G1 X155.612 Y85.873 E.17201
G1 X156.177 Y85.873 E.00917
G1 X163.093 Y92.79 E.15903
G1 X163.093 Y92.226 E.00917
G1 X156.741 Y85.873 E.14606
G1 X157.305 Y85.873 E.00917
G1 X163.093 Y91.661 E.13308
G1 X163.093 Y91.097 E.00917
G1 X157.869 Y85.873 E.12011
G1 X158.434 Y85.873 E.00917
G1 X163.093 Y90.533 E.10713
G1 X163.093 Y89.968 E.00917
G1 X158.998 Y85.873 E.09416
G1 X159.562 Y85.873 E.00917
G1 X163.093 Y89.404 E.08118
G1 X163.093 Y88.84 E.00917
G1 X160.127 Y85.873 E.06821
G1 X160.691 Y85.873 E.00917
G1 X163.093 Y88.276 E.05523
G1 X163.093 Y87.711 E.00917
G1 X161.255 Y85.873 E.04226
G1 X161.82 Y85.873 E.00917
G1 X163.093 Y87.147 E.02928
G1 X163.093 Y86.583 E.00917
G1 X162.384 Y85.873 E.01631
G1 X162.784 Y85.873 E.0065
G3 X163 Y85.925 I-.022 J.572 E.00364
G1 X163.273 Y86.198 E.00627
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X163 Y85.925 E-.1465
G1 X162.95 Y85.9 E-.02121
G1 X162.784 Y85.873 E-.06415
G1 X162.384 Y85.873 E-.15186
G1 X163.084 Y86.573 E-.37629
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 14/72
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I-1.214 J-.084 P1  F42000
G1 X160.492 Y124.036 Z1.7
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X160.492 Y124.879 E.0147
G1 X144.288 Y124.879 E.28293
G1 X144.288 Y108.674 E.28293
G1 X160.492 Y108.674 E.28293
G1 X160.492 Y123.976 E.26718
M204 S10000
G1 X160.064 Y124.036 F42000
G1 F6000
M204 S6000
G1 X160.064 Y124.45 E.00722
G1 X144.717 Y124.45 E.26796
G1 X144.717 Y109.103 E.26796
G1 X160.064 Y109.103 E.26796
G1 X160.064 Y123.976 E.2597
M204 S250
G1 X159.65 Y124.036 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.48 Y117.592 Z1.8 F42000
G1 X146.692 Y107.186 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X146.692 Y104.728 E.04292
G1 X158.088 Y104.728 E.19898
G1 X158.088 Y108.028 E.05762
G1 X162.092 Y108.028 E.06991
G1 X162.092 Y104.728 E.05762
G1 X164.438 Y104.728 E.04096
G1 X164.438 Y112.824 E.14136
G1 X162.638 Y112.824 E.03143
G1 X162.638 Y116.729 E.06817
G1 X164.438 Y116.729 E.03143
G1 X164.438 Y126.078 E.16325
G3 X160.424 Y128.824 I-12.059 J-13.318 E.08518
G1 X144.356 Y128.824 E.28056
G3 X140.342 Y126.078 I8.078 J-16.113 E.08517
G1 X140.342 Y116.729 E.16325
G1 X142.142 Y116.729 E.03143
G1 X142.142 Y112.824 E.06817
G1 X140.342 Y112.824 E.03143
G1 X140.342 Y104.728 E.14136
G1 X142.688 Y104.728 E.04096
G1 X142.688 Y108.028 E.05762
G1 X146.692 Y108.028 E.06991
G1 X146.692 Y107.246 E.01365
M204 S10000
G1 X146.264 Y107.186 F42000
G1 F6000
M204 S6000
G1 X146.264 Y104.3 E.0504
G1 X158.517 Y104.3 E.21394
G1 X158.517 Y107.6 E.05762
G1 X161.664 Y107.6 E.05495
G1 X161.664 Y104.3 E.05762
G1 X164.867 Y104.3 E.05592
G1 X164.867 Y113.253 E.15632
G1 X163.067 Y113.253 E.03143
G1 X163.067 Y116.3 E.0532
G1 X164.867 Y116.3 E.03143
G1 X164.867 Y126.265 E.174
G3 X160.525 Y129.253 I-12.453 J-13.449 E.09234
G1 X144.255 Y129.253 E.28407
G3 X139.914 Y126.265 I8.139 J-16.476 E.09234
G1 X139.914 Y116.3 E.174
G1 X141.714 Y116.3 E.03143
G1 X141.714 Y113.253 E.0532
G1 X139.914 Y113.253 E.03143
G1 X139.914 Y104.3 E.15632
G1 X143.117 Y104.3 E.05592
G1 X143.117 Y107.6 E.05762
G1 X146.264 Y107.6 E.05495
G1 X146.264 Y107.246 E.00617
M204 S250
G1 X145.85 Y107.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.8 F42000
G1 X161.25 Y107.186 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.8 F42000
G1 X163.48 Y115.886 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.67 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.261 J-16.927 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 138
M625
; object ids of layer 14 start: 138,149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer14 end: 138,149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X160.706 Y108.351 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X157.874 Y108.351 E.02508
; WIPE_START
G1 X159.874 Y108.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.723 Y104.126 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.265 Y105.901 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X163.26 Y108.35 E.03228
M204 S10000
G1 X162.465 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X162.465 Y110.791 E.01069
M204 S10000
G1 X162.101 Y111.323 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.465 Y111.215 E.00616
G1 X162.829 Y111.215 E.00591
G1 X162.829 Y109.463 E.02845
G1 X162.432 Y109.632 E.007
G1 X162.101 Y109.638 E.00538
G1 X162.101 Y111.263 E.02639
M204 S10000
G1 X161.703 Y112.06 F42000
G1 F15000
M204 S6000
G1 X161.826 Y111.813 E.00447
G1 X162.424 Y111.614 E.01023
G1 X163.228 Y111.614 E.01305
G1 X163.228 Y109.119 E.04052
; LINE_WIDTH: 0.404798
G1 X163.243 Y108.764 E.00554
; LINE_WIDTH: 0.384284
M73 P65 R8
G1 X163.258 Y108.41 E.00524
G1 X162.959 Y108.996 E.00973
; LINE_WIDTH: 0.41999
G1 X162.396 Y109.235 E.00993
G3 X161.734 Y109.239 I-.63 J-48.747 E.01075
G1 X161.703 Y109.335 E.00164
G1 X161.703 Y112 E.04327
M204 S10000
G1 X161.703 Y117.539 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X161.703 Y125.093 E.12266
G1 X161.673 Y125.333 E.00393
G1 X161.29 Y125.9 E.01111
G1 X161.077 Y126.018 E.00395
G1 X160.706 Y126.089 E.00613
G1 X144.074 Y126.089 E.27007
G1 X143.67 Y126.004 E.0067
G1 X143.347 Y125.774 E.00644
G1 X143.078 Y125.136 E.01124
G1 X143.077 Y117.539 E.12336
G1 X142.954 Y117.74 E.00383
G1 X142.356 Y117.939 E.01023
G1 X141.553 Y117.939 E.01305
G1 X141.553 Y125.524 E.12315
G2 X144.659 Y127.614 I10.725 J-12.585 E.06093
G1 X160.121 Y127.614 E.25106
G1 X160.699 Y127.305 E.01064
G2 X163.228 Y125.517 I-9.035 J-15.457 E.05035
G1 X163.228 Y117.939 E.12304
G1 X162.424 Y117.939 E.01305
G1 X161.826 Y117.74 E.01023
G1 X161.734 Y117.59 E.00285
M204 S10000
G1 X162.101 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.101 Y125.093 E.11143
G1 X162.06 Y125.429 E.0055
; LINE_WIDTH: 0.439773
G1 X161.804 Y125.842 E.00829
; LINE_WIDTH: 0.465817
G1 X161.547 Y126.255 E.0088
G1 X162.42 Y125.673 E.01901
; LINE_WIDTH: 0.41999
G1 X162.829 Y125.331 E.00865
G1 X162.829 Y118.338 E.11355
G1 X162.424 Y118.338 E.00658
G1 X162.158 Y118.249 E.00455
M204 S10000
G1 X162.464 Y125.161 F42000
; LINE_WIDTH: 0.350587
G1 F15000
M204 S6000
G1 X162.465 Y118.761 E.08581
M204 S10000
G1 X161.245 Y126.436 F42000
; LINE_WIDTH: 0.51172
G1 F14686.085
M204 S6000
G1 X161.495 Y126.286 E.00583
M204 S10000
G1 X144.85 Y126.851 F42000
; LINE_WIDTH: 0.35057
G1 F15000
M204 S6000
G1 X159.87 Y126.851 E.20141
M204 S10000
G1 X144.074 Y126.488 F42000
; LINE_WIDTH: 0.444873
G1 F15000
M204 S6000
G1 X143.781 Y126.451 E.00509
; LINE_WIDTH: 0.477734
G1 X143.489 Y126.414 E.00548
G1 X143.991 Y126.785 E.01162
; LINE_WIDTH: 0.41999
G1 X144.679 Y127.172 E.01281
G1 X144.85 Y127.215 E.00287
G1 X160.021 Y127.215 E.24634
G1 X160.5 Y126.96 E.00881
; LINE_WIDTH: 0.437378
G1 X160.748 Y126.785 E.00515
; LINE_WIDTH: 0.472155
G1 X160.997 Y126.61 E.00558
; LINE_WIDTH: 0.506932
G1 F14830.937
G1 X161.245 Y126.436 E.00601
G1 X161.066 Y126.453 E.00357
; LINE_WIDTH: 0.472155
G1 F15000
G1 X160.886 Y126.47 E.00331
; LINE_WIDTH: 0.420177
G1 X160.706 Y126.488 E.00293
G1 X144.134 Y126.488 E.26923
M204 S10000
G1 X143.014 Y126.086 F42000
; LINE_WIDTH: 0.52726
G1 F14234.875
M204 S6000
G1 X143.439 Y126.38 E.01064
M204 S10000
G1 X142.315 Y118.701 F42000
; LINE_WIDTH: 0.350582
G1 F15000
M204 S6000
G1 X142.315 Y125.11 E.08593
M204 S10000
G1 X142.679 Y118.23 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.315 Y118.338 E.00616
G1 X141.951 Y118.338 E.00591
G1 X141.951 Y125.341 E.11372
G1 X142.095 Y125.46 E.00304
; LINE_WIDTH: 0.439158
G1 X142.402 Y125.669 E.00631
; LINE_WIDTH: 0.477495
G1 X142.708 Y125.878 E.00689
; LINE_WIDTH: 0.515832
G1 F14563.942
G1 X143.014 Y126.086 E.00747
G1 X142.903 Y125.776 E.00665
; LINE_WIDTH: 0.477495
G1 F15000
G1 X142.792 Y125.465 E.00613
; LINE_WIDTH: 0.42087
G1 X142.68 Y125.154 E.00537
G1 X142.679 Y125.093 E.00099
G1 X142.679 Y118.29 E.1107
M204 S10000
G1 X142.556 Y116.943 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.476 Y117.102 E.00289
G1 X142.315 Y117.142 E.00269
G1 X140.756 Y117.142 E.02532
G1 X140.756 Y125.889 E.14203
G1 X141.293 Y126.352 E.01153
G2 X144.46 Y128.411 I10.966 J-13.402 E.06144
G1 X160.321 Y128.411 E.25755
G2 X163.162 Y126.612 I-9.141 J-17.577 E.05468
G1 X164.025 Y125.889 E.01827
G1 X164.025 Y117.142 E.14203
G1 X162.424 Y117.142 E.02599
G1 X162.304 Y117.102 E.00205
G1 X162.225 Y116.943 E.00289
G1 X162.225 Y112.61 E.07035
G1 X162.304 Y112.451 E.00289
G1 X162.465 Y112.411 E.00269
G1 X164.025 Y112.411 E.02532
G1 X164.025 Y105.142 E.11803
G1 X162.506 Y105.142 E.02466
G1 X162.506 Y108.243 E.05035
G1 X162.437 Y108.393 E.00269
G1 X162.306 Y108.442 E.00226
G1 X161.12 Y108.442 E.01927
G1 X161.12 Y108.685 E.00395
G1 X161.081 Y108.804 E.00203
G1 X160.906 Y108.899 E.00324
G1 X160.906 Y125.093 E.26294
G1 X160.812 Y125.262 E.00315
G1 X160.373 Y125.292 E.00713
G1 X144.074 Y125.292 E.26467
G1 X143.928 Y125.229 E.00257
G1 X143.875 Y125.093 E.00238
G1 X143.875 Y108.884 E.26318
G1 X143.699 Y108.804 E.00313
G1 X143.66 Y108.685 E.00203
G1 X143.66 Y108.442 E.00395
G1 X142.474 Y108.442 E.01927
G1 X142.343 Y108.393 E.00226
G1 X142.275 Y108.243 E.00269
G1 X142.275 Y105.142 E.05035
G1 X140.756 Y105.142 E.02466
G1 X140.756 Y112.411 E.11803
G1 X142.356 Y112.411 E.02599
G1 X142.476 Y112.451 E.00205
G1 X142.556 Y112.61 E.00289
G1 X142.556 Y116.883 E.06938
M204 S10000
G1 X143.445 Y116.943 F42000
; LINE_WIDTH: 0.48161
G1 F15000
M204 S6000
G1 X143.445 Y112.61 E.08123
; LINE_WIDTH: 0.466205
G1 X143.461 Y112.181 E.00778
; LINE_WIDTH: 0.420388
G1 X143.476 Y111.751 E.00698
G1 X143.476 Y109.09 E.04326
G1 X143.379 Y109.041 E.00176
G1 X143.313 Y108.841 E.00343
G1 X142.474 Y108.841 E.01364
G1 X142.082 Y108.695 E.00679
G1 X141.885 Y108.346 E.00651
G1 X141.876 Y108.243 E.00169
G1 X141.876 Y105.541 E.04392
G1 X141.154 Y105.541 E.01173
G1 X141.154 Y112.012 E.10519
G1 X142.356 Y112.012 E.01954
G1 X142.715 Y112.132 E.00615
; LINE_WIDTH: 0.435395
G1 X142.85 Y112.371 E.00463
; LINE_WIDTH: 0.480789
G1 X142.985 Y112.61 E.00514
G1 X142.979 Y117.052 E.08313
; LINE_WIDTH: 0.47108
G1 X142.847 Y117.236 E.00415
; LINE_WIDTH: 0.420079
G1 X142.715 Y117.421 E.00368
G1 X142.315 Y117.541 E.00678
G1 X141.154 Y117.541 E.01885
G1 X141.154 Y125.706 E.13262
G1 X141.544 Y126.043 E.00837
G2 X144.559 Y128.012 I10.639 J-12.993 E.0586
G1 X160.221 Y128.012 E.25436
G1 X160.898 Y127.651 E.01247
G2 X163.626 Y125.703 I-9.375 J-16.015 E.05451
G1 X163.626 Y117.541 E.13256
G1 X162.424 Y117.541 E.01953
G1 X162.065 Y117.421 E.00614
; LINE_WIDTH: 0.437023
G1 X161.933 Y117.236 E.00384
; LINE_WIDTH: 0.481175
G1 X161.801 Y117.052 E.00425
G1 X161.795 Y116.943 E.00205
G1 X161.795 Y112.61 E.08115
; LINE_WIDTH: 0.466205
G1 X161.93 Y112.371 E.00498
; LINE_WIDTH: 0.420247
G1 X162.065 Y112.132 E.00446
G1 X162.465 Y112.012 E.00678
G1 X163.626 Y112.012 E.01886
G1 X163.626 Y105.541 E.10515
G1 X162.904 Y105.541 E.01173
G1 X162.904 Y108.243 E.04391
G1 X162.895 Y108.346 E.00168
G1 X162.698 Y108.695 E.00651
G1 X162.306 Y108.841 E.00679
G1 X161.467 Y108.841 E.01364
G1 X161.401 Y109.041 E.00343
G1 X161.304 Y109.09 E.00176
G1 X161.304 Y111.751 E.04325
; LINE_WIDTH: 0.435395
G1 X161.32 Y112.181 E.00725
; LINE_WIDTH: 0.48022
G1 X161.335 Y112.61 E.00803
G1 X161.335 Y116.943 E.08098
; LINE_WIDTH: 0.466205
G1 X161.32 Y117.372 E.00778
; LINE_WIDTH: 0.420188
G1 X161.304 Y117.801 E.00698
G1 X161.304 Y125.093 E.11845
G1 X161.287 Y125.237 E.00236
G1 X161.022 Y125.601 E.00731
G1 X160.706 Y125.691 E.00532
G1 X144.074 Y125.691 E.27021
G1 X143.832 Y125.639 E.00402
G1 X143.638 Y125.502 E.00386
G1 X143.476 Y125.093 E.00714
G1 X143.476 Y117.801 E.11845
; LINE_WIDTH: 0.43702
G1 X143.459 Y117.447 E.00601
; LINE_WIDTH: 0.473855
G3 X143.444 Y117.003 I3.17 J-.33 E.0082
M204 S10000
G1 X143.077 Y112.06 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.077 Y109.287 E.04501
G1 X142.982 Y109.239 E.00174
G3 X142.384 Y109.235 I-.254 J-6.622 E.00971
G1 X141.821 Y108.996 E.00992
; LINE_WIDTH: 0.404798
G1 X141.672 Y108.703 E.00514
; LINE_WIDTH: 0.384792
G1 X141.522 Y108.41 E.00487
G1 X141.553 Y109.119 E.0105
; LINE_WIDTH: 0.41999
G1 X141.553 Y111.614 E.04052
G1 X142.356 Y111.614 E.01305
G1 X142.954 Y111.813 E.01023
G1 X143.051 Y112.006 E.0035
M204 S10000
G1 X142.679 Y111.323 F42000
G1 F15000
M204 S6000
G1 X142.679 Y109.638 E.02736
G1 X142.348 Y109.632 E.00538
G1 X141.951 Y109.463 E.007
G1 X141.951 Y111.215 E.02845
G1 X142.356 Y111.215 E.00658
G1 X142.622 Y111.304 E.00455
M204 S10000
G1 X142.315 Y109.994 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X142.315 Y110.791 E.01069
M204 S10000
G1 X141.515 Y105.901 F42000
; LINE_WIDTH: 0.345018
G1 F15000
M204 S6000
G1 X141.52 Y108.35 E.03228
M204 S10000
G1 X144.074 Y108.351 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23882
G1 F15000
M204 S6000
G1 X146.906 Y108.351 E.02508
M204 S10000
G1 X147.998 Y107.464 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.846 Y107.464 E.14366
G1 X156.878 Y107.368 E.00163
G1 X156.878 Y105.939 E.02321
G1 X147.903 Y105.939 E.14573
G1 X147.903 Y107.416 E.02398
G1 X147.945 Y107.437 E.00076
M204 S10000
G1 X148.665 Y106.701 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X156.055 Y106.701 E.0991
M204 S10000
G1 X156.479 Y107.065 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X156.479 Y106.338 E.01182
G1 X148.301 Y106.338 E.13279
G1 X148.301 Y107.065 E.01182
G1 X156.419 Y107.065 E.13181
M204 S10000
G1 X157.113 Y107.862 F42000
G1 F15000
M204 S6000
G1 X157.179 Y107.662 E.00342
G1 X157.276 Y107.613 E.00176
G1 X157.276 Y105.541 E.03366
G1 X147.504 Y105.541 E.15867
G1 X147.504 Y107.613 E.03366
G1 X147.601 Y107.662 E.00176
G1 X147.667 Y107.862 E.00342
G1 X157.053 Y107.862 E.15241
M204 S10000
G1 X157.46 Y108.261 F42000
G1 F15000
M204 S6000
G1 X157.46 Y108.018 E.00395
G1 X157.499 Y107.899 E.00203
G1 X157.675 Y107.804 E.00324
G1 X157.675 Y105.142 E.04322
G1 X147.106 Y105.142 E.17161
G1 X147.106 Y107.818 E.04346
G1 X147.281 Y107.899 E.00313
G1 X147.32 Y108.018 E.00203
G1 X147.32 Y108.261 E.00395
G1 X157.4 Y108.261 E.16368
; WIPE_START
G1 X155.4 Y108.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.421 Y105.172 Z1.8 F42000
G1 X146.057 Y104.126 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X143.323 Y104.126 E.0074
; OBJECT_ID: 149
; WIPE_START
G1 X145.323 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.335 Y99.276 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.295 Y99.022 E.00449
G1 X149.295 Y86.131 E.22508
G1 X149.335 Y85.877 E.00449
G3 X149.691 Y85.521 I.576 J.221 E.00904
G1 X149.945 Y85.481 E.00449
G1 X162.836 Y85.481 E.22508
G1 X162.979 Y85.504 E.00254
G3 X163.445 Y85.877 I-.048 J.538 E.01104
G1 X163.485 Y86.131 E.00449
G1 X163.485 Y99.022 E.22508
G1 X163.445 Y99.276 E.00449
G3 X163.09 Y99.631 I-.576 J-.221 E.00904
G1 X162.836 Y99.672 E.00449
G1 X149.945 Y99.672 E.22508
G1 X149.691 Y99.631 E.00449
G3 X149.36 Y99.331 I.242 J-.597 E.00797
M204 S10000
G1 X148.922 Y99.41 F42000
G1 F6000
M204 S6000
G1 X148.866 Y99.056 E.00627
G1 X148.866 Y86.097 E.22626
G1 X148.922 Y85.743 E.00626
G1 X149.063 Y85.468 E.0054
G1 X149.281 Y85.249 E.00539
G1 X149.557 Y85.109 E.0054
G1 X149.911 Y85.053 E.00626
G1 X162.869 Y85.053 E.22626
G1 X163.046 Y85.081 E.00313
G1 X163.224 Y85.109 E.00313
G1 X163.499 Y85.249 E.0054
G1 X163.717 Y85.468 E.00539
G1 X163.858 Y85.743 E.0054
G1 X163.914 Y86.097 E.00626
G1 X163.914 Y99.056 E.22626
G1 X163.858 Y99.41 E.00626
G1 X163.718 Y99.685 E.00539
G1 X163.499 Y99.904 E.0054
G1 X163.224 Y100.044 E.00539
G1 X162.869 Y100.1 E.00626
G1 X149.911 Y100.1 E.22626
G1 X149.557 Y100.044 E.00626
G1 X149.281 Y99.904 E.00539
G1 X149.063 Y99.685 E.00539
G1 X148.95 Y99.464 E.00435
M204 S250
G1 X148.552 Y99.594 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.524 Y99.539 E.001
G1 X148.453 Y99.07 E.00771
G1 X148.453 Y86.083 E.21088
G1 X148.524 Y85.613 E.00771
G1 X148.724 Y85.221 E.00714
G1 X149.035 Y84.91 E.00714
G1 X149.427 Y84.711 E.00714
G1 X149.897 Y84.639 E.00771
G1 X162.884 Y84.639 E.21088
G3 X163.111 Y84.672 I.009 J.735 E.00375
G1 X163.353 Y84.711 E.00398
G1 X163.745 Y84.91 E.00714
G1 X164.056 Y85.221 E.00714
G1 X164.256 Y85.613 E.00714
G1 X164.327 Y86.083 E.00771
G1 X164.327 Y99.07 E.21088
G1 X164.256 Y99.539 E.00771
G1 X164.056 Y99.931 E.00714
G1 X163.745 Y100.243 E.00714
G1 X163.353 Y100.442 E.00714
G1 X162.884 Y100.514 E.00771
G1 X149.897 Y100.514 E.21088
G1 X149.427 Y100.442 E.00771
G1 X149.035 Y100.243 E.00714
G1 X148.724 Y99.931 E.00714
G1 X148.579 Y99.648 E.00517
; WIPE_START
M204 S6000
G1 X148.524 Y99.539 E-.04612
G1 X148.453 Y99.07 E-.18042
G1 X148.453 Y97.666 E-.53346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.123 Y90.063 Z1.8 F42000
G1 X149.467 Y86.168 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42259
G1 F15000
M204 S6000
G1 X149.75 Y85.886 E.00653
G1 X149.801 Y85.86 E.00093
G3 X150.37 Y85.833 I.371 J1.783 E.00936
G1 X149.646 Y86.556 E.01673
G1 X149.646 Y87.124 E.00927
G1 X150.937 Y85.833 E.02984
G1 X151.505 Y85.833 E.00927
G1 X149.646 Y87.691 E.04295
G1 X149.646 Y88.258 E.00927
G1 X152.072 Y85.833 E.05606
G1 X152.639 Y85.833 E.00927
G1 X149.646 Y88.826 E.06918
G1 X149.646 Y89.393 E.00927
G1 X153.207 Y85.833 E.08229
G1 X153.774 Y85.833 E.00927
G1 X149.646 Y89.96 E.0954
G1 X149.646 Y90.527 E.00927
G1 X154.341 Y85.833 E.10851
G1 X154.908 Y85.833 E.00927
G1 X149.646 Y91.095 E.12162
G1 X149.646 Y91.662 E.00927
G1 X155.476 Y85.833 E.13473
G1 X156.043 Y85.833 E.00927
G1 X149.646 Y92.229 E.14785
G1 X149.646 Y92.797 E.00927
G1 X156.61 Y85.833 E.16096
G1 X157.178 Y85.833 E.00927
G1 X149.646 Y93.364 E.17407
G1 X149.646 Y93.931 E.00927
G1 X157.745 Y85.833 E.18718
G1 X158.312 Y85.833 E.00927
G1 X149.646 Y94.498 E.20029
G1 X149.646 Y95.066 E.00927
G1 X158.879 Y85.833 E.2134
G1 X159.447 Y85.833 E.00927
G1 X149.646 Y95.633 E.22652
G1 X149.646 Y96.2 E.00927
G1 X160.014 Y85.833 E.23963
G1 X160.581 Y85.833 E.00927
G1 X149.646 Y96.768 E.25274
G1 X149.646 Y97.335 E.00927
G1 X161.148 Y85.833 E.26585
G1 X161.716 Y85.833 E.00927
G1 X149.646 Y97.902 E.27896
G1 X149.646 Y98.469 E.00927
G1 X162.283 Y85.833 E.29207
G1 X162.845 Y85.838 E.00918
G1 X149.652 Y99.031 E.30492
G2 X149.936 Y99.314 I.249 J.034 E.00759
G1 X163.128 Y86.122 E.30492
G1 X163.134 Y86.684 E.00918
G1 X150.497 Y99.32 E.29207
G1 X151.065 Y99.32 E.00927
G1 X163.134 Y87.251 E.27896
G1 X163.134 Y87.818 E.00927
G1 X151.632 Y99.32 E.26585
G1 X152.199 Y99.32 E.00927
G1 X163.134 Y88.386 E.25274
G1 X163.134 Y88.953 E.00927
G1 X152.766 Y99.32 E.23962
G1 X153.334 Y99.32 E.00927
G1 X163.134 Y89.52 E.22651
G1 X163.134 Y90.087 E.00927
G1 X153.901 Y99.32 E.2134
G1 X154.468 Y99.32 E.00927
G1 X163.134 Y90.655 E.20029
G1 X163.134 Y91.222 E.00927
G1 X155.036 Y99.32 E.18718
G1 X155.603 Y99.32 E.00927
G1 X163.134 Y91.789 E.17407
G1 X163.134 Y92.357 E.00927
G1 X156.17 Y99.32 E.16095
G1 X156.737 Y99.32 E.00927
G1 X163.134 Y92.924 E.14784
G1 X163.134 Y93.491 E.00927
G1 X157.305 Y99.32 E.13473
G1 X157.872 Y99.32 E.00927
G1 X163.134 Y94.058 E.12162
G1 X163.134 Y94.626 E.00927
G1 X158.439 Y99.32 E.10851
G1 X159.007 Y99.32 E.00927
M73 P66 R8
G1 X163.134 Y95.193 E.0954
G1 X163.134 Y95.76 E.00927
G1 X159.574 Y99.32 E.08228
G1 X160.141 Y99.32 E.00927
G1 X163.134 Y96.328 E.06917
G1 X163.134 Y96.895 E.00927
G1 X160.708 Y99.32 E.05606
G1 X161.276 Y99.32 E.00927
G1 X163.134 Y97.462 E.04295
G1 X163.134 Y98.029 E.00927
G1 X161.843 Y99.32 E.02984
M73 P66 R7
G1 X162.41 Y99.32 E.00927
G1 X163.134 Y98.597 E.01672
G1 X163.134 Y98.994 E.0065
G3 X163.081 Y99.217 I-.37 J.029 E.00381
G1 X162.798 Y99.5 E.00653
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X163.081 Y99.217 E-.15172
G1 X163.107 Y99.166 E-.02185
G1 X163.134 Y98.994 E-.0661
G1 X163.134 Y98.597 E-.15108
G1 X162.447 Y99.284 E-.36925
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 15/72
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S183.6
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-1.209 J-.137 P1  F42000
G1 X159.65 Y124.036 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X145.13 Y124.036 E.23578
G1 X145.13 Y109.516 E.23578
G1 X159.65 Y109.516 E.23578
G1 X159.65 Y123.976 E.2348
; WIPE_START
M204 S6000
G1 X157.65 Y123.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.263 Y117.739 Z1.9 F42000
G1 X145.85 Y107.186 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X143.53 Y107.186 E.03767
G1 X143.53 Y104.366 E.04579
G1 X145.85 Y104.366 E.03767
G1 X145.85 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X143.851 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.483 Y107.182 Z1.9 F42000
G1 X161.25 Y107.186 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X158.93 Y107.186 E.03767
G1 X158.93 Y104.366 E.04579
G1 X161.25 Y104.366 E.03767
G1 X161.25 Y107.126 E.04482
; WIPE_START
M204 S6000
G1 X159.251 Y107.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y114.044 Z1.9 F42000
G1 X163.48 Y115.886 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X165.28 Y115.886 E.02923
G1 X165.28 Y126.446 E.17146
G3 X160.622 Y129.666 I-12.894 J-13.669 E.09231
G1 X144.158 Y129.666 E.26733
G3 X139.5 Y126.446 I8.236 J-16.89 E.09231
G1 X139.5 Y115.886 E.17146
G1 X141.3 Y115.886 E.02923
G1 X141.3 Y113.666 E.03605
G1 X139.5 Y113.666 E.02923
G1 X139.5 Y103.886 E.15881
G1 X165.28 Y103.886 E.41862
G1 X165.28 Y113.666 E.15881
G1 X163.48 Y113.666 E.02923
G1 X163.48 Y115.826 E.03507
; WIPE_START
M204 S6000
G1 X165.28 Y115.886 E-.68438
G1 X165.28 Y116.085 E-.07562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 138
M625
; object ids of layer 15 start: 138,149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer15 end: 138,149
M625
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X164.236 Y104.106 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X165.061 Y104.93 E.01894
G1 X165.061 Y105.494
G1 X163.673 Y104.106 E.03188
G1 X163.109 Y104.106
G1 X165.061 Y106.058 E.04483
G1 X165.061 Y106.621
G1 X162.545 Y104.106 E.05777
G1 X161.982 Y104.106
G1 X165.061 Y107.185 E.07071
G1 X165.061 Y107.748
G1 X161.676 Y104.364 E.07773
G1 X161.469 Y104.72
G1 X165.061 Y108.312 E.08248
G1 X165.061 Y108.876
G1 X161.469 Y105.284 E.08248
G1 X161.469 Y105.848
G1 X165.061 Y109.439 E.08248
G1 X165.061 Y110.003
G1 X161.469 Y106.411 E.08248
G1 X161.469 Y106.975
G1 X165.061 Y110.567 E.08248
G1 X165.061 Y111.13
G1 X161.336 Y107.406 E.08553
G1 X160.773 Y107.406
G1 X165.061 Y111.694 E.09847
G1 X165.061 Y112.257
G1 X160.209 Y107.406 E.11141
G1 X159.646 Y107.406
G1 X165.061 Y112.821 E.12436
G1 X165.061 Y113.385
G1 X159.082 Y107.406 E.1373
; WIPE_START
M204 S6000
G1 X160.496 Y108.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.711 Y104.78 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X158.036 Y104.106 E.01549
G1 X157.473 Y104.106
G1 X158.711 Y105.344 E.02843
G1 X158.711 Y105.907
G1 X156.909 Y104.106 E.04137
G1 X156.346 Y104.106
G1 X158.711 Y106.471 E.05432
G1 X158.711 Y107.035
G1 X155.782 Y104.106 E.06726
G1 X155.218 Y104.106
G1 X164.56 Y113.447 E.21452
G1 X163.996 Y113.447
G1 X159.869 Y109.32 E.09478
G1 X159.869 Y109.884
G1 X163.433 Y113.447 E.08183
G1 X163.261 Y113.839
G1 X159.869 Y110.447 E.07789
G1 X159.869 Y111.011
G1 X163.261 Y114.403 E.07789
G1 X163.261 Y114.966
G1 X159.869 Y111.575 E.07789
G1 X159.869 Y112.138
G1 X163.261 Y115.53 E.07789
G1 X163.261 Y116.093
G1 X159.869 Y112.702 E.07789
; WIPE_START
M204 S6000
G1 X161.284 Y114.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.846 Y109.297 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X154.655 Y104.106 E.11922
G1 X154.091 Y104.106
G1 X159.283 Y109.297 E.11922
G1 X158.719 Y109.297
G1 X153.528 Y104.106 E.11922
G1 X152.964 Y104.106
G1 X158.156 Y109.297 E.11922
G1 X157.592 Y109.297
G1 X152.4 Y104.106 E.11922
G1 X151.837 Y104.106
G1 X157.028 Y109.297 E.11922
G1 X156.465 Y109.297
G1 X151.273 Y104.106 E.11922
G1 X150.71 Y104.106
G1 X155.901 Y109.297 E.11922
G1 X155.338 Y109.297
G1 X150.146 Y104.106 E.11922
G1 X149.582 Y104.106
G1 X154.774 Y109.297 E.11922
G1 X154.21 Y109.297
G1 X149.019 Y104.106 E.11922
G1 X148.455 Y104.106
G1 X153.647 Y109.297 E.11922
G1 X153.083 Y109.297
G1 X147.892 Y104.106 E.11922
G1 X147.328 Y104.106
G1 X152.52 Y109.297 E.11922
G1 X151.956 Y109.297
G1 X146.764 Y104.106 E.11922
G1 X146.276 Y104.181
G1 X151.392 Y109.297 E.11749
G1 X150.829 Y109.297
G1 X146.069 Y104.538 E.1093
G1 X146.069 Y105.101
G1 X150.265 Y109.297 E.09635
G1 X149.702 Y109.297
G1 X146.069 Y105.665 E.08341
G1 X146.069 Y106.229
G1 X149.138 Y109.297 E.07047
G1 X148.574 Y109.297
G1 X146.069 Y106.792 E.05753
G1 X146.069 Y107.356
G1 X148.011 Y109.297 E.04458
G1 X147.447 Y109.297
G1 X145.555 Y107.406 E.04344
G1 X144.992 Y107.406
G1 X146.884 Y109.297 E.04344
G1 X146.32 Y109.297
G1 X144.428 Y107.406 E.04344
G1 X143.865 Y107.406
G1 X145.756 Y109.297 E.04344
; WIPE_START
M204 S6000
G1 X144.342 Y107.883 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P67 R7
G1 X142.255 Y104.106 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X143.311 Y105.161 E.02424
G1 X143.311 Y105.725
G1 X141.692 Y104.106 E.03718
G1 X141.128 Y104.106
G1 X143.311 Y106.288 E.05012
G1 X143.311 Y106.852
G1 X140.565 Y104.106 E.06307
G1 X140.001 Y104.106
G1 X145.193 Y109.297 E.11922
G1 X144.911 Y109.579
G1 X139.719 Y104.387 E.11922
G1 X139.719 Y104.951
G1 X144.911 Y110.143 E.11922
G1 X144.911 Y110.706
G1 X139.719 Y105.515 E.11922
G1 X139.719 Y106.078
G1 X144.911 Y111.27 E.11922
G1 X144.911 Y111.834
G1 X139.719 Y106.642 E.11922
G1 X139.719 Y107.206
G1 X144.911 Y112.397 E.11922
G1 X144.911 Y112.961
G1 X139.719 Y107.769 E.11922
G1 X139.719 Y108.333
G1 X144.911 Y113.524 E.11922
G1 X144.911 Y114.088
G1 X139.719 Y108.896 E.11922
G1 X139.719 Y109.46
G1 X144.911 Y114.652 E.11922
G1 X144.911 Y115.215
G1 X139.719 Y110.024 E.11922
G1 X139.719 Y110.587
G1 X144.911 Y115.779 E.11922
G1 X144.911 Y116.342
G1 X139.719 Y111.151 E.11922
G1 X139.719 Y111.714
G1 X141.452 Y113.447 E.03979
G1 X140.889 Y113.447
G1 X139.719 Y112.278 E.02685
G1 X139.719 Y112.842
G1 X140.325 Y113.447 E.01391
G1 X141.519 Y113.514
G1 X144.911 Y116.906 E.07789
G1 X144.911 Y117.47
G1 X141.519 Y114.078 E.07789
G1 X141.519 Y114.642
G1 X144.911 Y118.033 E.07789
G1 X144.911 Y118.597
G1 X141.519 Y115.205 E.07789
G1 X141.519 Y115.769
G1 X144.911 Y119.16 E.07789
G1 X144.911 Y119.724
G1 X141.293 Y116.106 E.08309
G1 X140.729 Y116.106
G1 X144.911 Y120.288 E.09604
G1 X144.911 Y120.851
G1 X140.165 Y116.106 E.10898
G1 X139.719 Y116.223
G1 X144.911 Y121.415 E.11922
G1 X144.911 Y121.978
G1 X139.719 Y116.787 E.11922
G1 X139.719 Y117.35
G1 X144.911 Y122.542 E.11922
G1 X144.911 Y123.106
G1 X139.719 Y117.914 E.11922
G1 X139.719 Y118.478
G1 X144.911 Y123.669 E.11922
G1 X144.911 Y124.233
G1 X139.719 Y119.041 E.11922
; WIPE_START
M204 S6000
G1 X141.134 Y120.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.636 Y119.053 Z1.9 F42000
G1 X164.4 Y116.106 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X165.061 Y116.766 E.01517
G1 X165.061 Y117.33
G1 X163.837 Y116.106 E.02811
G1 X163.273 Y116.106
G1 X165.061 Y117.893 E.04105
G1 X165.061 Y118.457
G1 X159.869 Y113.265 E.11922
G1 X159.869 Y113.829
G1 X165.061 Y119.021 E.11922
G1 X165.061 Y119.584
G1 X159.869 Y114.393 E.11922
G1 X159.869 Y114.956
G1 X165.061 Y120.148 E.11922
G1 X165.061 Y120.711
G1 X159.869 Y115.52 E.11922
G1 X159.869 Y116.083
G1 X165.061 Y121.275 E.11922
G1 X165.061 Y121.839
G1 X159.869 Y116.647 E.11922
G1 X159.869 Y117.211
G1 X165.061 Y122.402 E.11922
G1 X165.061 Y122.966
G1 X159.869 Y117.774 E.11922
G1 X159.869 Y118.338
G1 X165.061 Y123.529 E.11922
G1 X165.061 Y124.093
G1 X159.869 Y118.901 E.11922
G1 X159.869 Y119.465
G1 X165.061 Y124.657 E.11922
G1 X165.061 Y125.22
G1 X159.869 Y120.029 E.11922
G1 X159.869 Y120.592
G1 X165.061 Y125.784 E.11922
G1 X165.06 Y126.347
G1 X159.869 Y121.156 E.11921
G1 X159.869 Y121.719
G1 X164.761 Y126.611 E.11233
G1 X164.461 Y126.875
G1 X159.869 Y122.283 E.10544
G1 X159.869 Y122.847
G1 X164.161 Y127.139 E.09856
G1 X163.842 Y127.383
G1 X159.869 Y123.41 E.09124
G1 X159.869 Y123.974
G1 X163.522 Y127.627 E.08388
G1 X163.202 Y127.87
G1 X159.587 Y124.256 E.083
G1 X159.024 Y124.256
G1 X162.868 Y128.1 E.08828
G1 X162.527 Y128.322
G1 X158.46 Y124.256 E.09339
G1 X157.897 Y124.256
G1 X162.186 Y128.545 E.09851
G1 X161.838 Y128.76
G1 X157.333 Y124.256 E.10345
G1 X156.769 Y124.256
G1 X161.479 Y128.966 E.10816
G1 X161.117 Y129.166
G1 X156.206 Y124.256 E.11277
G1 X155.642 Y124.256
G1 X160.744 Y129.357 E.11716
G1 X160.27 Y129.447
G1 X155.079 Y124.256 E.11922
G1 X154.515 Y124.256
G1 X159.707 Y129.447 E.11922
G1 X159.143 Y129.447
G1 X153.951 Y124.256 E.11922
G1 X153.388 Y124.256
G1 X158.579 Y129.447 E.11922
G1 X158.016 Y129.447
G1 X152.824 Y124.256 E.11922
G1 X152.261 Y124.256
G1 X157.452 Y129.447 E.11922
G1 X156.889 Y129.447
G1 X151.697 Y124.256 E.11922
G1 X151.133 Y124.256
G1 X156.325 Y129.447 E.11922
G1 X155.761 Y129.447
G1 X150.57 Y124.256 E.11922
G1 X150.006 Y124.256
G1 X155.198 Y129.447 E.11922
G1 X154.634 Y129.447
G1 X149.443 Y124.256 E.11922
G1 X148.879 Y124.256
G1 X154.071 Y129.447 E.11922
G1 X153.507 Y129.447
G1 X148.315 Y124.256 E.11922
G1 X147.752 Y124.256
G1 X152.943 Y129.447 E.11922
G1 X152.38 Y129.447
G1 X147.188 Y124.256 E.11922
G1 X146.625 Y124.256
G1 X151.816 Y129.447 E.11922
G1 X151.253 Y129.447
G1 X146.061 Y124.256 E.11922
G1 X145.497 Y124.256
G1 X150.689 Y129.447 E.11922
G1 X150.125 Y129.447
G1 X144.934 Y124.256 E.11922
; WIPE_START
M204 S6000
G1 X146.348 Y125.67 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.562 Y129.447 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
M73 P68 R7
G1 F3000
M204 S2000
G1 X139.719 Y119.605 E.22602
G1 X139.719 Y120.168
G1 X148.998 Y129.447 E.21308
G1 X148.435 Y129.447
G1 X139.719 Y120.732 E.20014
G1 X139.719 Y121.296
G1 X147.871 Y129.447 E.18719
G1 X147.307 Y129.447
G1 X139.719 Y121.859 E.17425
G1 X139.719 Y122.423
G1 X146.744 Y129.447 E.16131
G1 X146.18 Y129.447
G1 X139.719 Y122.987 E.14836
G1 X139.719 Y123.55
G1 X145.616 Y129.447 E.13542
G1 X145.053 Y129.447
G1 X139.719 Y124.114 E.12248
G1 X139.719 Y124.677
G1 X144.489 Y129.447 E.10954
G1 X143.625 Y129.147
G1 X139.719 Y125.241 E.08969
G1 X139.719 Y125.805
G1 X142.207 Y128.292 E.05713
; WIPE_START
M204 S6000
G1 X140.793 Y126.878 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.661 Y119.295 Z1.9 F42000
G1 X143.331 Y104.71 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.288719
G1 F15000
M204 S6000
G1 X142.706 Y104.086 E.00962
; WIPE_START
G1 X143.331 Y104.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.595 Y112.307 Z1.9 F42000
G1 X141.12 Y127.519 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0889009
G1 F15000
M204 S6000
G1 X140.893 Y127.321 E.00083
; LINE_WIDTH: 0.128133
G1 X140.666 Y127.123 E.00131
; LINE_WIDTH: 0.166591
G1 X140.183 Y126.669 E.00392
; LINE_WIDTH: 0.204263
G1 X139.699 Y126.215 E.00494
; WIPE_START
G1 X140.183 Y126.669 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.906 Y128.738 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0837884
G1 F15000
M204 S6000
G1 X142.799 Y128.657 E.00034
; LINE_WIDTH: 0.118288
G1 X142.623 Y128.514 E.00089
; LINE_WIDTH: 0.158266
G1 X142.447 Y128.371 E.00126
; LINE_WIDTH: 0.198245
G1 X142.271 Y128.228 E.00163
; WIPE_START
G1 X142.447 Y128.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.723 Y120.744 Z1.9 F42000
G1 X143.323 Y104.126 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0879402
G1 F15000
M204 S6000
G1 X146.057 Y104.126 E.0074
; WIPE_START
G1 X144.057 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.689 Y104.126 Z1.9 F42000
G1 X158.723 Y104.126 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X161.457 Y104.126 E.0074
; OBJECT_ID: 149
; WIPE_START
G1 X159.457 Y104.126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G1 X154.808 Y98.073 Z1.9 F42000
G1 X152.478 Y95.039 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X152.478 Y90.114 E.08598
G1 X153.928 Y90.114 E.02532
G1 X153.928 Y88.664 E.02532
G1 X158.852 Y88.664 E.08598
G1 X158.852 Y90.114 E.02532
G1 X160.302 Y90.114 E.02532
G1 X160.302 Y95.039 E.08598
G1 X158.852 Y95.039 E.02532
G1 X158.852 Y96.489 E.02532
G1 X153.928 Y96.489 E.08598
G1 X153.928 Y95.039 E.02532
G1 X152.538 Y95.039 E.02427
M204 S10000
G1 X152.907 Y94.61 F42000
G1 F6000
M204 S6000
G1 X152.907 Y90.543 E.07101
G1 X154.357 Y90.543 E.02532
G1 X154.357 Y89.093 E.02532
G1 X158.424 Y89.093 E.07101
G1 X158.424 Y90.543 E.02532
G1 X159.874 Y90.543 E.02532
G1 X159.874 Y94.61 E.07101
G1 X158.424 Y94.61 E.02532
G1 X158.424 Y96.06 E.02532
G1 X154.357 Y96.06 E.07101
G1 X154.357 Y94.61 E.02532
G1 X152.967 Y94.61 E.02427
; WIPE_START
G1 X152.937 Y92.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.295 Y99.305 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X149.254 Y99.046 E.00458
G1 X149.254 Y86.107 E.22593
G1 X149.295 Y85.848 E.00458
G3 X149.661 Y85.482 I.542 J.176 E.00938
G1 X149.92 Y85.441 E.00458
G1 X162.86 Y85.441 E.22593
G1 X163.02 Y85.466 E.00284
G3 X163.485 Y85.848 I-.063 J.55 E.01109
G1 X163.526 Y86.107 E.00458
G1 X163.526 Y99.046 E.22593
G1 X163.485 Y99.305 E.00458
G3 X163.119 Y99.671 I-.542 J-.176 E.00938
G1 X162.86 Y99.712 E.00458
G1 X149.92 Y99.712 E.22593
G1 X149.661 Y99.671 E.00458
G3 X149.317 Y99.361 I.176 J-.542 E.00833
M204 S10000
G1 X148.88 Y99.425 F42000
G1 F6000
M204 S6000
G1 X148.826 Y99.08 E.00609
G1 X148.826 Y86.073 E.22711
G1 X148.883 Y85.714 E.00635
G1 X149.025 Y85.434 E.00548
G1 X149.247 Y85.212 E.00548
G1 X149.527 Y85.069 E.00548
G1 X149.887 Y85.012 E.00635
G1 X162.894 Y85.012 E.22711
G1 X163.088 Y85.043 E.00343
G1 X163.253 Y85.069 E.00293
G1 X163.533 Y85.212 E.00548
G1 X163.755 Y85.434 E.00548
G1 X163.898 Y85.714 E.00548
G1 X163.954 Y86.073 E.00635
G1 X163.954 Y99.08 E.22711
G1 X163.898 Y99.439 E.00635
G1 X163.755 Y99.719 E.00548
G1 X163.533 Y99.941 E.00548
G1 X163.253 Y100.084 E.00548
G1 X162.894 Y100.141 E.00635
G1 X149.887 Y100.141 E.22711
G1 X149.527 Y100.084 E.00635
G1 X149.247 Y99.941 E.00548
G1 X149.025 Y99.719 E.00548
G1 X148.903 Y99.48 E.0047
M204 S250
G1 X148.472 Y99.487 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.412 Y99.094 E.00645
G1 X148.412 Y86.059 E.21167
G1 X148.485 Y85.584 E.00779
G1 X148.687 Y85.188 E.00723
G1 X149.001 Y84.873 E.00723
G1 X149.398 Y84.671 E.00723
G1 X149.872 Y84.599 E.00779
G1 X162.908 Y84.599 E.21167
G3 X163.152 Y84.634 I.009 J.789 E.00402
G1 X163.382 Y84.671 E.00378
G1 X163.779 Y84.873 E.00723
G1 X164.094 Y85.188 E.00723
G1 X164.296 Y85.584 E.00723
G1 X164.368 Y86.059 E.00779
G1 X164.368 Y99.094 E.21167
G1 X164.296 Y99.569 E.00779
G1 X164.094 Y99.965 E.00723
G1 X163.779 Y100.28 E.00723
G1 X163.382 Y100.482 E.00723
G1 X162.908 Y100.554 E.00779
G1 X149.872 Y100.554 E.21167
G1 X149.398 Y100.482 E.00779
G1 X149.001 Y100.28 E.00723
G1 X148.687 Y99.965 E.00723
G1 X148.485 Y99.569 E.00723
G1 X148.481 Y99.546 E.00037
; WIPE_START
M204 S6000
G1 X148.412 Y99.094 E-.17377
G1 X148.412 Y97.552 E-.58623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.809 Y93.387 Z1.9 F42000
G1 X158.818 Y90.777 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X159.639 Y91.599 E.01886
G1 X159.639 Y92.162
G1 X158.254 Y90.777 E.03181
G1 X158.189 Y90.149
G1 X157.368 Y89.327 E.01886
G1 X156.804 Y89.327
G1 X158.189 Y90.712 E.03181
M204 S10000
G1 X156.241 Y89.327 F42000
G1 F3000
M204 S2000
G1 X159.639 Y92.726 E.07805
G1 X159.639 Y93.289
G1 X155.677 Y89.327 E.09099
G1 X155.113 Y89.327
G1 X159.639 Y93.853 E.10393
G1 X159.598 Y94.376
G1 X154.591 Y89.368 E.11499
G1 X154.591 Y89.932
G1 X159.035 Y94.376 E.10205
G1 X158.471 Y94.376
G1 X154.591 Y90.496 E.0891
G1 X154.309 Y90.777
G1 X158.189 Y94.658 E.08911
G1 X158.189 Y95.221
G1 X153.745 Y90.777 E.10205
G1 X153.182 Y90.777
G1 X158.189 Y95.785 E.11499
G1 X157.667 Y95.826
G1 X153.141 Y91.3 E.10393
G1 X153.141 Y91.864
G1 X157.103 Y95.826 E.09099
G1 X156.539 Y95.826
G1 X153.141 Y92.427 E.07804
G1 X153.141 Y92.991
G1 X154.526 Y94.376 E.0318
G1 X153.962 Y94.376
G1 X153.141 Y93.554 E.01886
M204 S10000
G1 X154.591 Y94.441 F42000
G1 F3000
M204 S2000
G1 X155.976 Y95.826 E.0318
G1 X155.412 Y95.826
G1 X154.591 Y95.004 E.01886
M204 S10000
G1 X154.699 Y94.267 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106466
G1 F15000
M204 S6000
G1 X154.604 Y94.363 E.00047
G1 X154.59 Y94.442 E.00028
; WIPE_START
G1 X154.604 Y94.363 E-.2819
G1 X154.699 Y94.267 E-.4781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.229 Y90.315 Z1.9 F42000
G1 X161.914 Y89.9 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425871
G1 F15000
M204 S6000
G1 X161.906 Y95.436 E.09122
M204 S10000
G1 X160.461 Y88.505 F42000
; LINE_WIDTH: 0.420736
G1 F15000
M204 S6000
G1 X160.919 Y88.565 E.00751
G1 X161.362 Y88.791 E.00808
G1 X161.75 Y89.249 E.00977
G1 X161.914 Y89.9 E.01092
G2 X161.917 Y87.05 I-356.112 J-1.771 E.04637
G2 X159.066 Y87.053 I-1.079 J356.115 E.04637
G1 X159.717 Y87.216 E.01092
G1 X160.176 Y87.605 E.00978
G1 X160.402 Y88.047 E.00808
G1 X160.454 Y88.446 E.00654
M204 S10000
G1 X160.832 Y88.135 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X161.034 Y88.183 E.00338
G1 X161.518 Y88.43 E.00882
G1 X161.518 Y87.448 E.01594
G1 X160.536 Y87.448 E.01594
G1 X160.783 Y87.932 E.00882
G1 X160.818 Y88.076 E.00241
M204 S10000
G1 X161.165 Y87.786 F42000
; LINE_WIDTH: 0.37382
G1 F15000
M204 S6000
G1 X161.099 Y87.824 E.0011
G1 X161.151 Y87.854 E.00087
M204 S10000
G1 X153.471 Y87.063 F42000
; LINE_WIDTH: 0.425986
M73 P69 R7
G1 F15000
M204 S6000
G1 X159.006 Y87.053 E.09124
M204 S10000
G1 X152.319 Y88.505 F42000
; LINE_WIDTH: 0.42257
G1 F15000
M204 S6000
G1 X152.378 Y88.047 E.00755
G1 X152.604 Y87.605 E.00812
G1 X153.063 Y87.216 E.00982
G1 X153.471 Y87.063 E.00712
G2 X150.863 Y87.05 I-1.874 J111.401 E.04261
G2 X150.866 Y89.9 I356.115 J1.079 E.04658
G1 X151.03 Y89.249 E.01097
G1 X151.418 Y88.791 E.00982
G1 X151.861 Y88.565 E.00812
G1 X152.259 Y88.513 E.00657
M204 S10000
G1 X151.948 Y88.135 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.997 Y87.932 E.00338
G1 X152.244 Y87.448 E.00882
G1 X151.262 Y87.448 E.01594
G1 X151.262 Y88.43 E.01594
G1 X151.746 Y88.183 E.00882
G1 X151.89 Y88.149 E.00241
M204 S10000
G1 X151.659 Y87.786 F42000
; LINE_WIDTH: 0.37384
G1 F15000
M204 S6000
G1 X151.593 Y87.824 E.0011
G1 X151.646 Y87.854 E.00087
M204 S10000
G1 X150.877 Y95.496 F42000
; LINE_WIDTH: 0.425986
G1 F15000
M204 S6000
G1 X150.866 Y89.96 E.09124
M204 S10000
G1 X151.659 Y97.291 F42000
; LINE_WIDTH: 0.37384
G1 F15000
M204 S6000
G1 X151.593 Y97.329 E.0011
G1 X151.646 Y97.359 E.00087
M204 S10000
G1 X151.948 Y97.018 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.746 Y96.97 E.00338
G1 X151.262 Y96.723 E.00882
G1 X151.262 Y97.705 E.01594
G1 X152.244 Y97.705 E.01594
G1 X151.997 Y97.221 E.00882
G1 X151.962 Y97.076 E.00241
M204 S10000
G1 X152.319 Y96.648 F42000
; LINE_WIDTH: 0.42257
G1 F15000
M204 S6000
G1 X151.861 Y96.588 E.00755
G1 X151.418 Y96.362 E.00812
G1 X151.03 Y95.904 E.00982
G1 X150.877 Y95.496 E.00712
G2 X150.863 Y98.103 I111.401 J1.874 E.04261
G2 X153.714 Y98.1 I1.079 J-356.115 E.04658
G1 X153.063 Y97.936 E.01097
G1 X152.604 Y97.548 E.00982
G1 X152.378 Y97.106 E.00812
G1 X152.327 Y96.707 E.00657
M204 S10000
G1 X152.717 Y96.249 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X152.09 Y96.234 E.0102
G1 X151.66 Y96.045 E.00762
G1 X151.383 Y95.718 E.00697
G1 X151.282 Y95.425 E.00502
G1 X151.267 Y95.253 E.00281
G1 X151.267 Y89.9 E.08691
G1 X151.383 Y89.435 E.00778
G1 X151.66 Y89.108 E.00697
G1 X152.09 Y88.919 E.00762
G1 X152.717 Y88.904 E.0102
G1 X152.733 Y88.276 E.0102
G1 X152.921 Y87.846 E.00762
G1 X153.249 Y87.569 E.00697
G1 X153.542 Y87.469 E.00502
G1 X153.714 Y87.454 E.00281
G1 X159.066 Y87.454 E.08691
G1 X159.531 Y87.569 E.00778
G1 X159.859 Y87.846 E.00697
G1 X160.047 Y88.276 E.00762
G1 X160.063 Y88.904 E.0102
G1 X160.691 Y88.919 E.0102
G1 X161.12 Y89.108 E.00762
G1 X161.398 Y89.435 E.00697
G1 X161.513 Y89.9 E.00778
G1 X161.513 Y95.253 E.08691
G1 X161.498 Y95.425 E.00281
G1 X161.398 Y95.718 E.00502
G1 X161.12 Y96.045 E.00697
G1 X160.691 Y96.234 E.00762
G1 X160.063 Y96.249 E.0102
G1 X160.047 Y96.877 E.0102
G1 X159.859 Y97.307 E.00762
G1 X159.531 Y97.584 E.00697
G1 X159.239 Y97.684 E.00502
G1 X159.066 Y97.699 E.00281
G1 X153.714 Y97.699 E.08691
G1 X153.249 Y97.584 E.00778
G1 X152.921 Y97.307 E.00697
G1 X152.733 Y96.877 E.00762
G1 X152.719 Y96.309 E.00923
M204 S10000
G1 X153.116 Y95.851 F42000
G1 F15000
M204 S6000
G1 X152.264 Y95.851 E.01384
G3 X151.735 Y95.532 I.039 J-.663 E.01043
G1 X151.666 Y95.253 E.00467
G1 X151.666 Y89.9 E.08691
G1 X151.735 Y89.621 E.00467
G1 X151.901 Y89.425 E.00418
G1 X152.159 Y89.312 E.00457
G1 X153.116 Y89.302 E.01554
G1 X153.116 Y88.45 E.01384
G3 X153.435 Y87.921 I.663 J.039 E.01043
G1 X153.714 Y87.852 E.00467
G1 X159.066 Y87.852 E.08691
G1 X159.345 Y87.921 E.00467
G1 X159.542 Y88.088 E.00418
G1 X159.655 Y88.346 E.00457
G1 X159.664 Y89.302 E.01554
G1 X160.516 Y89.302 E.01384
G3 X161.045 Y89.621 I-.039 J.663 E.01043
G1 X161.114 Y89.9 E.00467
G1 X161.114 Y95.253 E.08691
G1 X161.045 Y95.532 E.00467
G1 X160.879 Y95.728 E.00418
G1 X160.621 Y95.841 E.00457
G1 X159.664 Y95.851 E.01554
G1 X159.664 Y96.703 E.01384
G3 X159.345 Y97.232 I-.663 J-.039 E.01043
G1 X159.066 Y97.301 E.00467
G1 X153.714 Y97.301 E.08691
G1 X153.435 Y97.232 E.00467
G1 X153.238 Y97.065 E.00418
G1 X153.125 Y96.807 E.00457
G1 X153.117 Y95.911 E.01456
M204 S10000
G1 X153.515 Y95.452 F42000
G1 F15000
M204 S6000
G1 X152.264 Y95.452 E.02031
G1 X152.143 Y95.411 E.00207
G1 X152.065 Y95.253 E.00287
G1 X152.065 Y89.9 E.08691
G1 X152.143 Y89.742 E.00287
G1 X152.264 Y89.701 E.00207
G1 X153.515 Y89.701 E.02031
G1 X153.515 Y88.45 E.02031
G1 X153.555 Y88.329 E.00207
G1 X153.714 Y88.251 E.00287
G1 X159.066 Y88.251 E.08691
G1 X159.225 Y88.329 E.00287
G1 X159.266 Y88.45 E.00207
G1 X159.266 Y89.701 E.02031
G1 X160.516 Y89.701 E.02031
G1 X160.637 Y89.742 E.00207
G1 X160.716 Y89.9 E.00287
G1 X160.716 Y95.253 E.08691
G1 X160.637 Y95.411 E.00287
G1 X160.516 Y95.452 E.00207
G1 X159.266 Y95.452 E.02031
G1 X159.266 Y96.703 E.02031
G1 X159.225 Y96.824 E.00207
G1 X159.066 Y96.902 E.00287
G1 X153.714 Y96.902 E.08691
G1 X153.555 Y96.824 E.00287
G1 X153.515 Y96.703 E.00207
G1 X153.515 Y95.512 E.01933
; WIPE_START
G1 X153.515 Y96.703 E-.45248
G1 X153.555 Y96.824 E-.04844
G1 X153.714 Y96.902 E-.06721
G1 X154.219 Y96.902 E-.19187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.31 Y98.09 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.425986
G1 F15000
M204 S6000
G1 X153.774 Y98.1 E.09124
M204 S10000
G1 X160.461 Y96.648 F42000
; LINE_WIDTH: 0.423583
G1 F15000
M204 S6000
G1 X160.402 Y97.106 E.00757
G1 X160.176 Y97.548 E.00814
G1 X159.717 Y97.936 E.00984
G1 X159.31 Y98.09 E.00713
G2 X161.917 Y98.103 I1.874 J-111.401 E.04272
G1 X161.903 Y95.496 E.04271
G1 X161.75 Y95.904 E.00713
G1 X161.362 Y96.362 E.00984
G1 X160.919 Y96.588 E.00814
G1 X160.521 Y96.64 E.00658
M204 S10000
G1 X160.832 Y97.018 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X160.783 Y97.221 E.00338
G1 X160.536 Y97.705 E.00882
G1 X161.518 Y97.705 E.01594
G1 X161.518 Y96.723 E.01594
G1 X161.034 Y96.97 E.00882
G1 X160.89 Y97.004 E.00241
M204 S10000
G1 X161.165 Y97.291 F42000
; LINE_WIDTH: 0.37382
G1 F15000
M204 S6000
G1 X161.099 Y97.329 E.0011
G1 X161.151 Y97.359 E.00087
M204 S10000
G1 X162.315 Y98.502 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X162.315 Y86.651 E.19242
G1 X150.465 Y86.651 E.19242
G1 X150.465 Y98.502 E.19242
G1 X162.255 Y98.502 E.19145
M204 S10000
G1 X162.714 Y98.9 F42000
G1 F15000
M204 S6000
G1 X162.714 Y86.253 E.20537
G1 X150.066 Y86.253 E.20537
G1 X150.066 Y98.9 E.20537
G1 X162.654 Y98.9 E.20439
M204 S10000
G1 X163.112 Y98.957 F42000
G1 F15000
M204 S6000
G1 X163.112 Y86.163 E.20775
G1 X163.065 Y85.96 E.00338
G1 X162.973 Y85.897 E.00182
G1 X162.771 Y85.854 E.00335
G1 X149.953 Y85.854 E.20813
G1 X149.774 Y85.901 E.00301
G1 X149.71 Y85.994 E.00182
G1 X149.668 Y86.196 E.00335
G1 X149.668 Y99.014 E.20813
G1 X149.715 Y99.193 E.00301
G1 X149.807 Y99.256 E.00182
G1 X150.009 Y99.299 E.00335
G1 X162.827 Y99.299 E.20813
G1 X163.006 Y99.252 E.00301
G2 X163.1 Y99.016 I-.234 J-.23 E.00423
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X163.07 Y99.159 E-.05563
G1 X163.006 Y99.252 E-.04265
G1 X162.827 Y99.299 E-.07033
G1 X161.271 Y99.299 E-.59139
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 16/72
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I1.029 J-.65 P1  F42000
G1 X158.117 Y94.304 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X158.117 Y95.754 E.02532
G1 X154.663 Y95.754 E.06031
G1 X154.663 Y94.304 E.02532
G1 X153.213 Y94.304 E.02532
G1 X153.213 Y90.849 E.06031
G1 X154.663 Y90.849 E.02532
G1 X154.663 Y89.399 E.02532
G1 X158.117 Y89.399 E.06031
G1 X158.117 Y90.849 E.02532
G1 X159.567 Y90.849 E.02532
G1 X159.567 Y94.304 E.06031
G1 X158.177 Y94.304 E.02427
; WIPE_START
G1 X158.117 Y95.754 E-.55147
G1 X157.568 Y95.754 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.092 Y91.278 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X155.092 Y89.828 E.02532
G1 X157.689 Y89.828 E.04535
G1 X157.689 Y91.278 E.02532
G1 X159.139 Y91.278 E.02532
G1 X159.139 Y93.875 E.04535
G1 X157.689 Y93.875 E.02532
G1 X157.689 Y95.325 E.02532
G1 X155.092 Y95.325 E.04535
G1 X155.092 Y93.875 E.02532
G1 X153.642 Y93.875 E.02532
G1 X153.642 Y91.278 E.04535
G1 X155.032 Y91.278 E.02427
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.484 Y96.354 Z2 F42000
G1 X149.256 Y99.335 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.214 Y99.071 E.00467
G1 X149.214 Y86.082 E.22678
G1 X149.256 Y85.818 E.00467
G3 X149.632 Y85.442 I.61 J.234 E.00957
G1 X149.896 Y85.4 E.00467
G1 X162.884 Y85.4 E.22678
G1 X163.061 Y85.428 E.00313
G3 X163.525 Y85.818 I-.078 J.563 E.01115
G1 X163.566 Y86.082 E.00467
G1 X163.566 Y99.071 E.22678
G1 X163.525 Y99.335 E.00467
G3 X163.148 Y99.711 I-.61 J-.233 E.00957
G1 X162.884 Y99.753 E.00467
G1 X149.896 Y99.753 E.22678
G1 X149.632 Y99.711 E.00467
G3 X149.28 Y99.39 I.234 J-.61 E.00852
M204 S10000
G1 X148.836 Y99.427 F42000
G1 F6000
M204 S6000
G1 X148.785 Y99.104 E.0057
G1 X148.785 Y86.049 E.22796
G1 X148.843 Y85.684 E.00644
G1 X148.988 Y85.4 E.00557
G1 X149.214 Y85.174 E.00557
G1 X149.498 Y85.029 E.00557
G1 X149.862 Y84.972 E.00644
G1 X162.918 Y84.972 E.22796
G1 X163.129 Y85.005 E.00372
G1 X163.282 Y85.029 E.00272
G1 X163.567 Y85.174 E.00557
G1 X163.792 Y85.4 E.00557
G1 X163.937 Y85.684 E.00557
G1 X163.995 Y86.049 E.00644
G1 X163.995 Y99.104 E.22796
G1 X163.937 Y99.469 E.00644
G1 X163.792 Y99.753 E.00557
G1 X163.567 Y99.979 E.00557
G1 X163.282 Y100.124 E.00557
G1 X162.918 Y100.181 E.00644
G1 X149.862 Y100.181 E.22796
G1 X149.498 Y100.124 E.00644
G1 X149.214 Y99.979 E.00557
G1 X148.988 Y99.753 E.00557
G1 X148.851 Y99.484 E.00527
M204 S250
G1 X148.428 Y99.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.372 Y99.119 E.00608
G1 X148.372 Y86.034 E.21246
G1 X148.445 Y85.555 E.00787
G1 X148.649 Y85.154 E.00731
G1 X148.967 Y84.835 E.00731
G1 X149.368 Y84.631 E.00731
G1 X149.848 Y84.558 E.00787
G1 X162.932 Y84.558 E.21246
G3 X163.193 Y84.597 I.009 J.843 E.0043
G1 X163.412 Y84.631 E.00359
G1 X163.813 Y84.835 E.00731
G1 X164.131 Y85.154 E.00731
G1 X164.335 Y85.555 E.00731
G1 X164.409 Y86.034 E.00787
G1 X164.409 Y99.119 E.21246
G1 X164.335 Y99.598 E.00787
G1 X164.131 Y99.999 E.00731
G1 X163.813 Y100.317 E.00731
G1 X163.412 Y100.522 E.00731
G1 X162.932 Y100.595 E.00787
G1 X149.848 Y100.595 E.21246
G1 X149.368 Y100.522 E.00787
G1 X148.967 Y100.317 E.00731
G1 X148.649 Y99.999 E.00731
G1 X148.445 Y99.598 E.00731
G1 X148.437 Y99.548 E.00082
; WIPE_START
M204 S6000
G1 X148.372 Y99.119 E-.16513
G1 X148.372 Y97.553 E-.59487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 16 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer16 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X149.988 Y99.339 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X162.852 Y99.339 E.20888
G1 X163.039 Y99.289 E.00315
G1 X163.109 Y99.187 E.00201
G1 X163.153 Y98.979 E.00346
G1 X163.153 Y86.14 E.20847
G1 X163.103 Y85.928 E.00354
G1 X163.001 Y85.857 E.00201
G1 X162.792 Y85.814 E.00346
G1 X149.929 Y85.814 E.20888
G1 X149.741 Y85.864 E.00315
G1 X149.671 Y85.966 E.00201
G1 X149.627 Y86.174 E.00346
G1 X149.627 Y99.038 E.20888
G1 X149.678 Y99.225 E.00315
G2 X149.929 Y99.327 I.247 J-.249 E.00452
M204 S10000
G1 X151.227 Y94.829 F42000
; LINE_WIDTH: 0.404978
G1 F8595
M204 S6000
G1 X151.213 Y94.518 E.00486
G1 X151.213 Y90.695 E.05973
M204 S10000
G1 X152.058 Y96.889 F42000
; LINE_WIDTH: 0.44616
G1 F8595
M204 S6000
G2 X152.051 Y96.981 I-.027 J.044 E.00364
M204 S10000
G1 X152.358 Y96.609 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X152.184 Y96.553 E.00296
G1 X151.62 Y96.205 E.01076
G1 X151.62 Y97.347 E.01853
G1 X152.761 Y97.347 E.01853
G1 X152.414 Y96.782 E.01076
G1 X152.376 Y96.666 E.00198
M204 S10000
G1 X152.693 Y96.274 F42000
; LINE_WIDTH: 0.419718
G1 F8595
M204 S6000
G1 X152.333 Y96.183 E.00603
G1 X151.812 Y95.863 E.00991
G1 X151.379 Y95.288 E.01168
G1 X151.227 Y94.829 E.00785
G2 X151.221 Y97.745 I344.23 J2.109 E.04733
G3 X154.449 Y97.753 I1.211 J162.327 E.05237
G1 X153.679 Y97.587 E.01278
G1 X153.104 Y97.154 E.01168
G1 X152.784 Y96.634 E.00991
G1 X152.708 Y96.332 E.00506
M204 S10000
G1 X153.054 Y95.913 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X152.66 Y95.871 E.00643
G1 X152.481 Y95.813 E.00307
G1 X152.076 Y95.564 E.00772
G1 X151.739 Y95.117 E.00909
G1 X151.625 Y94.759 E.0061
G1 X151.604 Y94.518 E.00393
G1 X151.604 Y90.635 E.06305
G1 X151.739 Y90.036 E.00997
G1 X152.076 Y89.589 E.00909
G1 X152.481 Y89.34 E.00771
G1 X153.054 Y89.24 E.00945
G1 X153.096 Y88.847 E.00643
G1 X153.154 Y88.667 E.00307
G1 X153.403 Y88.262 E.00772
G1 X153.85 Y87.925 E.00909
G1 X154.208 Y87.811 E.0061
G1 X154.449 Y87.79 E.00393
G1 X158.331 Y87.79 E.06305
G1 X158.93 Y87.925 E.00997
G1 X159.377 Y88.262 E.00909
G1 X159.627 Y88.667 E.00771
G1 X159.726 Y89.24 E.00945
G1 X160.12 Y89.282 E.00643
G1 X160.3 Y89.34 E.00307
G1 X160.704 Y89.589 E.00771
G1 X161.041 Y90.036 E.00909
G1 X161.176 Y90.635 E.00997
G1 X161.176 Y94.518 E.06305
G1 X161.155 Y94.759 E.00393
G1 X161.041 Y95.117 E.0061
G1 X160.704 Y95.564 E.00909
G1 X160.3 Y95.813 E.00772
G1 X159.726 Y95.913 E.00945
G1 X159.685 Y96.306 E.00643
G1 X159.627 Y96.486 E.00307
G1 X159.377 Y96.891 E.00772
G1 X158.93 Y97.228 E.00909
G1 X158.572 Y97.342 E.0061
G1 X158.331 Y97.363 E.00393
G1 X154.449 Y97.363 E.06305
G1 X153.85 Y97.228 E.00997
G1 X153.403 Y96.891 E.00909
G1 X153.154 Y96.486 E.00771
G1 X153.055 Y95.973 E.00849
M204 S10000
G1 X153.452 Y95.514 F42000
G1 F8595
M204 S6000
G1 X152.757 Y95.484 E.0113
G1 X152.34 Y95.265 E.00766
G1 X152.099 Y94.946 E.00649
G1 X152.002 Y94.518 E.00712
G1 X152.002 Y90.635 E.06305
G1 X152.099 Y90.207 E.00712
G1 X152.34 Y89.888 E.00649
G1 X152.757 Y89.669 E.00766
G1 X153.452 Y89.639 E.0113
G1 X153.482 Y88.943 E.0113
G1 X153.702 Y88.526 E.00766
G1 X154.021 Y88.285 E.00649
G1 X154.449 Y88.189 E.00712
G1 X158.331 Y88.189 E.06305
G1 X158.759 Y88.285 E.00712
G1 X159.079 Y88.526 E.00649
G1 X159.298 Y88.943 E.00766
G1 X159.328 Y89.639 E.0113
G1 X160.023 Y89.669 E.0113
G1 X160.441 Y89.888 E.00766
G1 X160.681 Y90.207 E.00649
G1 X160.778 Y90.635 E.00712
G1 X160.778 Y94.518 E.06305
G1 X160.681 Y94.946 E.00712
G1 X160.441 Y95.265 E.00649
G1 X160.023 Y95.484 E.00766
G1 X159.328 Y95.514 E.0113
G1 X159.298 Y96.21 E.0113
G1 X159.079 Y96.627 E.00766
G1 X158.759 Y96.868 E.00649
G1 X158.331 Y96.964 E.00712
G1 X154.449 Y96.964 E.06305
G1 X154.021 Y96.868 E.00712
G1 X153.702 Y96.627 E.00649
G1 X153.482 Y96.21 E.00766
G1 X153.455 Y95.574 E.01033
M204 S10000
G1 X153.851 Y95.116 F42000
G1 F8595
M204 S6000
G1 X152.999 Y95.116 E.01384
G3 X152.459 Y94.775 I.033 J-.65 E.01084
G1 X152.401 Y94.518 E.00427
G1 X152.401 Y90.635 E.06305
G1 X152.459 Y90.378 E.00427
G1 X152.603 Y90.187 E.00389
G1 X152.854 Y90.055 E.00459
G1 X153.851 Y90.037 E.0162
G1 X153.851 Y89.185 E.01384
G3 X154.192 Y88.645 I.65 J.033 E.01084
G1 X154.449 Y88.587 E.00427
G1 X158.331 Y88.587 E.06305
G1 X158.588 Y88.645 E.00427
G1 X158.78 Y88.79 E.00389
G1 X158.911 Y89.04 E.00459
G1 X158.929 Y90.037 E.0162
G1 X159.781 Y90.037 E.01384
G3 X160.321 Y90.378 I-.033 J.65 E.01084
G1 X160.379 Y90.635 E.00427
G1 X160.379 Y94.518 E.06305
G1 X160.321 Y94.775 E.00427
G1 X160.177 Y94.966 E.00389
M73 P70 R7
G1 X159.927 Y95.098 E.00459
G1 X158.929 Y95.116 E.0162
G1 X158.929 Y95.968 E.01384
G3 X158.588 Y96.508 I-.65 J-.033 E.01084
G1 X158.331 Y96.566 E.00427
G1 X154.449 Y96.566 E.06305
G1 X154.192 Y96.508 E.00427
G1 X154.001 Y96.363 E.00389
G1 X153.869 Y96.113 E.00459
G1 X153.852 Y95.176 E.01522
M204 S10000
G1 X154.25 Y94.717 F42000
G1 F8595
M204 S6000
G1 X152.999 Y94.717 E.02031
G1 X152.867 Y94.667 E.00229
G1 X152.8 Y94.518 E.00266
G1 X152.8 Y90.635 E.06305
G1 X152.867 Y90.486 E.00266
G1 X152.999 Y90.436 E.00229
G1 X154.25 Y90.436 E.02031
G1 X154.25 Y89.185 E.02031
G1 X154.299 Y89.053 E.00229
G1 X154.449 Y88.986 E.00266
G1 X158.331 Y88.986 E.06305
G1 X158.481 Y89.053 E.00266
G1 X158.531 Y89.185 E.00229
G1 X158.531 Y90.436 E.02031
G1 X159.781 Y90.436 E.02031
G1 X159.913 Y90.486 E.00229
G1 X159.981 Y90.635 E.00266
G1 X159.981 Y94.518 E.06305
G1 X159.913 Y94.667 E.00266
G1 X159.781 Y94.717 E.00229
G1 X158.531 Y94.717 E.02031
G1 X158.531 Y95.968 E.02031
G1 X158.481 Y96.1 E.00229
G1 X158.331 Y96.167 E.00266
G1 X154.449 Y96.167 E.06305
G1 X154.299 Y96.1 E.00266
G1 X154.25 Y95.968 E.00229
G1 X154.25 Y94.777 E.01933
; WIPE_START
G1 F15000
G1 X154.25 Y95.968 E-.45248
G1 X154.299 Y96.1 E-.05356
G1 X154.449 Y96.167 E-.06229
G1 X154.953 Y96.167 E-.19167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.642 Y97.74 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.404978
G1 F8595
M204 S6000
G1 X158.331 Y97.753 E.00486
G1 X154.509 Y97.753 E.05973
M204 S10000
G1 X160.087 Y96.274 F42000
; LINE_WIDTH: 0.421491
G1 F8595
M204 S6000
G1 X159.997 Y96.634 E.00606
G1 X159.676 Y97.154 E.00996
G1 X159.102 Y97.587 E.01173
G1 X158.642 Y97.74 E.00789
G2 X161.559 Y97.745 I2.109 J-344.23 E.04754
G2 X161.553 Y94.829 I-130.988 J-1.211 E.04754
G1 X161.401 Y95.288 E.00789
G1 X160.968 Y95.863 E.01173
G1 X160.448 Y96.183 E.00996
G1 X160.145 Y96.259 E.00508
M204 S10000
G1 X160.423 Y96.609 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X160.367 Y96.782 E.00296
G1 X160.019 Y97.347 E.01076
G1 X161.16 Y97.347 E.01853
G1 X161.16 Y96.205 E.01853
G1 X160.596 Y96.553 E.01076
G1 X160.48 Y96.59 E.00198
M204 S10000
G1 X160.775 Y96.889 F42000
; LINE_WIDTH: 0.44616
G1 F8595
M204 S6000
G2 X160.768 Y96.981 I-.027 J.044 E.00363
M204 S10000
G1 X161.957 Y98.144 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X161.957 Y87.009 E.1808
G1 X150.823 Y87.009 E.1808
G1 X150.823 Y98.144 E.1808
G1 X161.897 Y98.144 E.17982
M204 S10000
G1 X162.356 Y98.542 F42000
G1 F8595
M204 S6000
G1 X162.356 Y86.611 E.19374
G1 X150.424 Y86.611 E.19374
G1 X150.424 Y98.542 E.19374
G1 X162.296 Y98.542 E.19276
M204 S10000
G1 X162.754 Y98.941 F42000
G1 F8595
M204 S6000
G1 X162.754 Y86.212 E.20668
G1 X150.026 Y86.212 E.20668
G1 X150.026 Y98.941 E.20668
G1 X162.694 Y98.941 E.20571
M204 S10000
G1 X161.567 Y90.635 F42000
; LINE_WIDTH: 0.404781
G1 F8595
M204 S6000
G1 X161.556 Y94.769 E.06456
M204 S10000
G1 X160.087 Y88.879 F42000
; LINE_WIDTH: 0.417744
G1 F8595
M204 S6000
G1 X160.448 Y88.97 E.006
G1 X160.968 Y89.29 E.00986
G1 X161.401 Y89.865 E.01162
G1 X161.567 Y90.635 E.01272
G3 X161.559 Y87.408 I162.319 J-2.017 E.05211
G3 X158.331 Y87.4 I-1.211 J-162.327 E.05211
G1 X159.102 Y87.566 E.01272
G1 X159.676 Y87.999 E.01162
G1 X159.997 Y88.519 E.00986
G1 X160.073 Y88.821 E.00503
M204 S10000
G1 X160.423 Y88.544 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X160.596 Y88.6 E.00296
G1 X161.16 Y88.948 E.01076
G1 X161.16 Y87.806 E.01853
G1 X160.019 Y87.806 E.01853
G1 X160.367 Y88.371 E.01076
G1 X160.404 Y88.487 E.00198
M204 S10000
G1 X160.775 Y88.172 F42000
; LINE_WIDTH: 0.44616
G1 F8595
M204 S6000
G2 X160.768 Y88.264 I-.027 J.044 E.00363
M204 S10000
G1 X154.138 Y87.413 F42000
; LINE_WIDTH: 0.404978
G1 F8595
M204 S6000
G1 X154.449 Y87.4 E.00486
G1 X158.271 Y87.4 E.05973
M204 S10000
G1 X152.693 Y88.879 F42000
; LINE_WIDTH: 0.419718
G1 F8595
M204 S6000
G1 X152.784 Y88.519 E.00603
G1 X153.104 Y87.999 E.00991
G1 X153.679 Y87.566 E.01168
G1 X154.138 Y87.413 E.00785
G2 X151.221 Y87.408 I-2.109 J344.23 E.04733
G3 X151.213 Y90.635 I-162.327 J1.211 E.05237
G1 X151.379 Y89.865 E.01278
G1 X151.812 Y89.29 E.01168
G1 X152.333 Y88.97 E.00991
G1 X152.635 Y88.894 E.00506
M204 S10000
G1 X152.358 Y88.544 F42000
; LINE_WIDTH: 0.41999
G1 F8595
M204 S6000
G1 X152.414 Y88.371 E.00296
G1 X152.761 Y87.806 E.01076
G1 X151.62 Y87.806 E.01853
G1 X151.62 Y88.948 E.01853
G1 X152.184 Y88.6 E.01076
G1 X152.301 Y88.562 E.00198
M204 S10000
G1 X152.058 Y88.172 F42000
; LINE_WIDTH: 0.44616
G1 F8595
M204 S6000
G2 X152.051 Y88.264 I-.027 J.044 E.00364
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X152.005 Y88.264 E-.17082
G1 X151.978 Y88.218 E-.19639
G1 X152.005 Y88.172 E-.19639
G1 X152.058 Y88.172 E-.19639
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 17/72
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S196.35
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.869 J.852 P1  F42000
G1 X155.505 Y91.691 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.045 Y85.513 Z2.1 F42000
G1 X163.25 Y84.561 Z2.1
M73 P70 R6
G1 Z1.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X163.441 Y84.591 E.00314
G1 X163.847 Y84.798 E.00739
G1 X164.169 Y85.12 E.00739
G1 X164.375 Y85.526 E.00739
G1 X164.449 Y86.01 E.00796
G1 X164.449 Y99.143 E.21325
G1 X164.375 Y99.627 E.00796
G1 X164.169 Y100.033 E.00739
G1 X163.847 Y100.355 E.00739
G1 X163.441 Y100.562 E.00739
G1 X162.957 Y100.635 E.00796
G1 X149.824 Y100.635 E.21325
G1 X149.339 Y100.562 E.00796
G1 X148.934 Y100.355 E.00739
G1 X148.612 Y100.033 E.00739
G1 X148.405 Y99.627 E.00739
G1 X148.331 Y99.143 E.00796
G1 X148.331 Y86.01 E.21325
G1 X148.405 Y85.525 E.00796
G1 X148.612 Y85.12 E.00739
G1 X148.934 Y84.798 E.00739
G1 X149.339 Y84.591 E.00739
G1 X149.824 Y84.518 E.00796
G1 X162.957 Y84.518 E.21325
G3 X163.192 Y84.547 I.009 J.897 E.00387
; WIPE_START
M204 S6000
G1 X163.441 Y84.591 E-.09605
G1 X163.847 Y84.798 E-.17297
G1 X164.169 Y85.12 E-.17298
G1 X164.375 Y85.526 E-.17298
G1 X164.433 Y85.903 E-.14502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 17 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer17 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X162.922 Y84.737 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X164.23 Y86.044 E.03003
G1 X164.23 Y86.608
G1 X162.359 Y84.737 E.04297
G1 X161.795 Y84.737
G1 X164.23 Y87.172 E.05591
G1 X164.23 Y87.735
G1 X161.231 Y84.737 E.06885
G1 X160.668 Y84.737
G1 X164.23 Y88.299 E.0818
G1 X164.23 Y88.862
G1 X160.104 Y84.737 E.09474
G1 X159.541 Y84.737
G1 X164.23 Y89.426 E.10768
G1 X164.23 Y89.99
G1 X158.977 Y84.737 E.12063
G1 X158.413 Y84.737
G1 X164.23 Y90.553 E.13357
G1 X164.23 Y91.117
G1 X157.85 Y84.737 E.14651
G1 X157.286 Y84.737
G1 X164.23 Y91.68 E.15945
G1 X164.23 Y92.244
G1 X156.723 Y84.737 E.1724
G1 X156.159 Y84.737
G1 X164.23 Y92.808 E.18534
G1 X164.23 Y93.371
G1 X155.595 Y84.737 E.19828
G1 X155.032 Y84.737
G1 X164.23 Y93.935 E.21122
G1 X164.23 Y94.498
G1 X154.468 Y84.737 E.22417
G1 X153.905 Y84.737
G1 X164.23 Y95.062 E.23711
G1 X164.23 Y95.626
G1 X153.341 Y84.737 E.25005
G1 X152.777 Y84.737
G1 X164.23 Y96.189 E.26299
G1 X164.23 Y96.753
G1 X152.214 Y84.737 E.27594
G1 X151.65 Y84.737
G1 X156.936 Y90.022 E.12138
G1 X156.372 Y90.022
G1 X151.087 Y84.737 E.12138
G1 X150.523 Y84.737
G1 X155.809 Y90.022 E.12138
G1 X155.286 Y90.063
G1 X149.959 Y84.737 E.12232
G1 X149.454 Y84.795
G1 X155.286 Y90.627 E.13392
G1 X155.286 Y91.19
G1 X149.07 Y84.975 E.14274
G1 X148.788 Y85.256
G1 X155.004 Y91.472 E.14273
G1 X154.44 Y91.472
G1 X148.609 Y85.641 E.13392
G1 X148.55 Y86.146
G1 X153.877 Y91.472 E.12232
G1 X153.836 Y91.995
G1 X148.55 Y86.709 E.12138
G1 X148.55 Y87.273
G1 X153.836 Y92.559 E.12138
G1 X153.836 Y93.122
G1 X148.55 Y87.837 E.12138
; WIPE_START
M204 S6000
G1 X149.965 Y89.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.481 Y90.578 Z2.1 F42000
G1 X157.494 Y90.581 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X158.386 Y91.472 E.02047
G1 X158.944 Y92.031
G1 X164.23 Y97.316 E.12138
G1 X164.23 Y97.88
G1 X158.944 Y92.594 E.12138
G1 X158.944 Y93.158
G1 X164.23 Y98.444 E.12138
G1 X164.23 Y99.007
G1 X158.903 Y93.681 E.12232
G1 X158.34 Y93.681
G1 X164.171 Y99.512 E.13392
G1 X163.992 Y99.897
G1 X157.78 Y93.684 E.14266
G1 X157.496 Y93.964
G1 X163.71 Y100.178 E.1427
G1 X163.326 Y100.358
G1 X157.494 Y94.526 E.13392
G1 X157.494 Y95.09
G1 X162.821 Y100.416 E.12232
G1 X162.257 Y100.416
G1 X156.972 Y95.131 E.12138
G1 X156.408 Y95.131
G1 X161.694 Y100.416 E.12138
G1 X161.13 Y100.416
G1 X155.844 Y95.131 E.12138
G1 X155.286 Y94.572
G1 X154.394 Y93.681 E.02047
; WIPE_START
M204 S6000
G1 X155.286 Y94.572 E-.4791
G1 X155.809 Y95.095 E-.2809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.198 Y89.92 Z2.1 F42000
G1 X148.55 Y88.4 Z2.1
G1 Z1.7
M73 P71 R6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X160.566 Y100.416 E.27593
G1 X160.003 Y100.416
G1 X148.55 Y88.964 E.26299
G1 X148.55 Y89.527
G1 X159.439 Y100.416 E.25005
G1 X158.876 Y100.416
G1 X148.55 Y90.091 E.23711
G1 X148.55 Y90.655
G1 X158.312 Y100.416 E.22416
G1 X157.748 Y100.416
G1 X148.55 Y91.218 E.21122
G1 X148.55 Y91.782
G1 X157.185 Y100.416 E.19828
G1 X156.621 Y100.416
G1 X148.55 Y92.345 E.18534
G1 X148.55 Y92.909
G1 X156.058 Y100.416 E.17239
G1 X155.494 Y100.416
G1 X148.55 Y93.473 E.15945
G1 X148.55 Y94.036
G1 X154.93 Y100.416 E.14651
G1 X154.367 Y100.416
G1 X148.55 Y94.6 E.13357
G1 X148.55 Y95.164
G1 X153.803 Y100.416 E.12062
G1 X153.239 Y100.416
G1 X148.55 Y95.727 E.10768
G1 X148.55 Y96.291
G1 X152.676 Y100.416 E.09474
G1 X152.112 Y100.416
G1 X148.55 Y96.854 E.08179
G1 X148.55 Y97.418
G1 X151.549 Y100.416 E.06885
G1 X150.985 Y100.416
G1 X148.55 Y97.982 E.05591
G1 X148.55 Y98.545
G1 X150.421 Y100.416 E.04297
G1 X149.858 Y100.416
G1 X148.55 Y99.109 E.03002
; WIPE_START
M204 S6000
G1 X149.858 Y100.416 E-.70263
G1 X150.009 Y100.416 E-.05738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.081 Y94.713 Z2.1 F42000
G1 X157.946 Y91.492 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.263449
G1 F15000
M204 S6000
G2 X157.474 Y91.025 I-5.011 J4.583 E.00655
; WIPE_START
G1 X157.946 Y91.492 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.306 Y90.264 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.0452452
G1 F15000
M204 S6000
G1 X155.288 Y90.272 E.00002
; LINE_WIDTH: 0.0943093
G1 X155.27 Y90.279 E.00006
G1 X155.196 Y90.153 E.00043
M204 S10000
G1 X153.967 Y91.382 F42000
; LINE_WIDTH: 0.0965513
G1 F15000
M204 S6000
G1 X154.093 Y91.457 E.00045
; LINE_WIDTH: 0.0767761
G1 X154.085 Y91.474 E.00004
; LINE_WIDTH: 0.045288
G1 X154.078 Y91.492 E.00002
; WIPE_START
G1 X154.085 Y91.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.306 Y94.123 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.264375
G1 F15000
M204 S6000
G1 X154.842 Y93.661 E.00648
; WIPE_START
G1 X155.306 Y94.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.115 Y99.719 Z2.1 F42000
G1 X149.499 Y100.384 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.135912
G1 F15000
M204 S6000
G1 X149.371 Y100.291 E.00074
; LINE_WIDTH: 0.174758
G1 X149.243 Y100.198 E.00099
; LINE_WIDTH: 0.227076
G3 X148.862 Y99.851 I.902 J-1.376 E.00433
; LINE_WIDTH: 0.213602
G1 X148.769 Y99.724 E.00124
; LINE_WIDTH: 0.174754
G1 X148.676 Y99.596 E.00099
; LINE_WIDTH: 0.135905
G1 X148.583 Y99.468 E.00074
M204 S10000
G1 X148.715 Y85.465 F42000
; LINE_WIDTH: 0.0854841
G1 F15000
M204 S6000
G2 X148.609 Y85.617 I.47 J.441 E.00048
M204 S10000
G1 X149.428 Y84.792 F42000
; LINE_WIDTH: 0.087829
G1 F15000
M204 S6000
G1 X149.278 Y84.901 E.0005
; WIPE_START
G1 X149.428 Y84.792 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.047 Y85.253 Z2.1 F42000
G1 X164.197 Y85.685 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.136002
G1 F15000
M204 S6000
G1 X164.104 Y85.557 E.00074
; LINE_WIDTH: 0.174845
G1 X164.012 Y85.429 E.00099
; LINE_WIDTH: 0.227163
G2 X163.665 Y85.048 I-1.377 J.902 E.00434
; LINE_WIDTH: 0.213679
G1 X163.537 Y84.955 E.00124
; LINE_WIDTH: 0.174842
G1 X163.409 Y84.862 E.00099
; LINE_WIDTH: 0.136006
G1 X163.282 Y84.769 E.00074
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X163.409 Y84.862 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 18/72
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S201.45
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I-.861 J-.86 P1  F42000
G1 X148.974 Y99.299 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X148.921 Y99.195 E.00189
G1 X148.859 Y98.802 E.00646
G1 X148.859 Y86.35 E.2022
G1 X148.921 Y85.958 E.00646
G1 X149.109 Y85.588 E.00673
G1 X149.141 Y85.556 E.00074
G1 X149.402 Y85.295 E.00599
G1 X149.771 Y85.107 E.00673
G1 X150.164 Y85.045 E.00646
G1 X162.616 Y85.045 E.2022
G1 X163.009 Y85.107 E.00646
G1 X163.378 Y85.295 E.00673
G1 X163.671 Y85.588 E.00673
G1 X163.859 Y85.958 E.00673
G1 X163.922 Y86.35 E.00646
G1 X163.922 Y98.802 E.2022
G1 X163.859 Y99.195 E.00646
G1 X163.671 Y99.565 E.00673
G1 X163.378 Y99.858 E.00673
G1 X163.009 Y100.046 E.00673
G1 X162.616 Y100.108 E.00646
G1 X150.164 Y100.108 E.2022
G1 X149.771 Y100.046 E.00646
G1 X149.402 Y99.858 E.00673
G1 X149.109 Y99.565 E.00673
G1 X149.001 Y99.352 E.00387
; WIPE_START
G1 F3600
M204 S6000
G1 X148.921 Y99.195 E-.067
G1 X148.859 Y98.802 E-.15113
G1 X148.859 Y97.377 E-.54187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.557 Y92.298 Z2.2 F42000
G1 X163.283 Y84.522 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2486
M204 S5000
G1 X163.47 Y84.552 E.00308
G1 X163.881 Y84.761 E.00747
G1 X164.206 Y85.086 E.00747
G1 X164.415 Y85.496 E.00747
G1 X164.49 Y85.986 E.00804
G1 X164.49 Y99.167 E.21404
G1 X164.415 Y99.657 E.00804
G1 X164.206 Y100.067 E.00747
G1 X163.881 Y100.392 E.00747
G1 X163.47 Y100.601 E.00747
G1 X162.981 Y100.676 E.00804
G1 X149.799 Y100.676 E.21404
G1 X149.31 Y100.601 E.00804
G1 X148.9 Y100.392 E.00747
G1 X148.574 Y100.067 E.00747
G1 X148.365 Y99.657 E.00747
G1 X148.291 Y99.167 E.00804
G1 X148.291 Y85.986 E.21404
G1 X148.365 Y85.496 E.00804
G1 X148.574 Y85.086 E.00747
G1 X148.9 Y84.761 E.00747
G1 X149.31 Y84.552 E.00747
G1 X149.799 Y84.477 E.00804
G1 X162.981 Y84.477 E.21404
G3 X163.225 Y84.506 I.009 J.951 E.00401
; WIPE_START
G1 F3600
M204 S6000
G1 X163.47 Y84.552 E-.09476
G1 X163.881 Y84.761 E-.17489
G1 X164.206 Y85.086 E-.17491
G1 X164.415 Y85.496 E-.17491
G1 X164.471 Y85.862 E-.14053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 18 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer18 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.16 Y85.9 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.222348
G1 F2486
M204 S6000
G1 X164.192 Y86.157 E.00212
; LINE_WIDTH: 0.189926
G1 X164.205 Y86.322 E.00114
; LINE_WIDTH: 0.176153
G1 X164.206 Y98.819 E.07876
G1 X164.192 Y98.996 E.00112
; LINE_WIDTH: 0.21591
G1 X164.179 Y99.161 E.00131
; LINE_WIDTH: 0.240518
G3 X164.114 Y99.427 I-.99 J-.099 E.00245
; LINE_WIDTH: 0.292899
G1 X164.076 Y99.547 E.00139
; LINE_WIDTH: 0.329029
G3 X163.607 Y100.132 I-1.19 J-.472 E.00954
; LINE_WIDTH: 0.306826
G3 X163.241 Y100.301 I-.989 J-1.667 E.00469
; LINE_WIDTH: 0.253711
G1 X163.122 Y100.34 E.00119
; LINE_WIDTH: 0.222348
G3 X162.81 Y100.378 I-.38 J-1.778 E.00258
; LINE_WIDTH: 0.189926
G1 X162.645 Y100.391 E.00114
; LINE_WIDTH: 0.176153
G1 X150.148 Y100.392 E.07876
G1 X149.971 Y100.378 E.00112
; LINE_WIDTH: 0.215923
G1 X149.806 Y100.365 E.00131
; LINE_WIDTH: 0.240563
G3 X149.539 Y100.301 I.099 J-.99 E.00245
; LINE_WIDTH: 0.292933
G1 X149.42 Y100.262 E.00139
; LINE_WIDTH: 0.329044
G3 X148.834 Y99.793 I.472 J-1.19 E.00954
; LINE_WIDTH: 0.306842
G3 X148.666 Y99.427 I1.668 J-.99 E.00469
; LINE_WIDTH: 0.253711
G1 X148.627 Y99.308 E.00119
; LINE_WIDTH: 0.22236
G3 X148.588 Y98.996 I1.779 J-.38 E.00258
; LINE_WIDTH: 0.189931
G1 X148.575 Y98.831 E.00114
; LINE_WIDTH: 0.175971
G1 X148.575 Y86.322 E.07875
; LINE_WIDTH: 0.189917
G1 X148.588 Y86.157 E.00114
; LINE_WIDTH: 0.21591
G1 X148.601 Y85.992 E.00131
; LINE_WIDTH: 0.240525
G3 X148.666 Y85.726 I.99 J.099 E.00245
; LINE_WIDTH: 0.29291
G1 X148.705 Y85.606 E.00139
; LINE_WIDTH: 0.329033
G3 X149.174 Y85.021 I1.19 J.472 E.00954
; LINE_WIDTH: 0.30683
G3 X149.539 Y84.852 I.99 J1.668 E.00469
; LINE_WIDTH: 0.253711
G1 X149.658 Y84.813 E.00119
; LINE_WIDTH: 0.222348
G3 X149.971 Y84.774 I.38 J1.778 E.00258
; LINE_WIDTH: 0.189926
G1 X150.136 Y84.761 E.00114
; LINE_WIDTH: 0.176153
G1 X162.632 Y84.761 E.07876
G1 X162.81 Y84.774 E.00112
; LINE_WIDTH: 0.215909
G1 X162.975 Y84.787 E.00131
; LINE_WIDTH: 0.238393
G3 X163.224 Y84.846 I-.09 J.933 E.00227
; LINE_WIDTH: 0.290047
G1 X163.36 Y84.891 E.00157
; LINE_WIDTH: 0.329029
G3 X163.946 Y85.36 I-.472 J1.19 E.00955
; LINE_WIDTH: 0.306826
G3 X164.114 Y85.726 I-1.667 J.989 E.00469
; LINE_WIDTH: 0.253711
G1 X164.152 Y85.841 E.00115
; WIPE_START
G1 F15000
G1 X164.192 Y86.157 E-.12098
G1 X164.205 Y86.322 E-.06292
G1 X164.205 Y87.838 E-.5761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.064 Y90.533 Z2.2 F42000
G1 X155.092 Y91.278 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2486
M204 S6000
M73 P72 R6
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.334 J2.585 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2486
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2486
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17439
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2486
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20275
G1 X154.55 Y93.922 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.785 Y93.24 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G3 X156.591 Y89.894 I2.606 J-.663 E.08273
G3 X156.857 Y95.225 I-.205 J2.682 E.12622
G3 X153.8 Y93.298 I-.466 J-2.649 E.06435
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.1246
G1 X153.704 Y92.711 E-.10192
G1 X153.704 Y92.442 E-.10187
G1 X153.73 Y92.176 E-.10191
G1 X153.784 Y91.913 E-.10186
G1 X153.863 Y91.656 E-.10197
G1 X153.967 Y91.409 E-.10184
G1 X153.997 Y91.354 E-.02402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 19/72
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-1.027 J-.653 P1  F42000
G1 X148.928 Y99.318 Z2.2
G1 Z1.9
G1 E.8 F1800
G1 F2504
M204 S5000
G1 X148.879 Y99.222 E.00176
G1 X148.816 Y98.822 E.00658
G1 X148.816 Y86.331 E.20281
G1 X148.879 Y85.931 E.00658
G1 X149.071 Y85.555 E.00685
G1 X149.369 Y85.257 E.00685
G1 X149.745 Y85.066 E.00685
G1 X150.145 Y85.002 E.00658
G1 X162.635 Y85.002 E.20281
G1 X163.035 Y85.066 E.00658
G1 X163.411 Y85.257 E.00685
G1 X163.71 Y85.555 E.00685
G1 X163.901 Y85.931 E.00685
G1 X163.964 Y86.331 E.00658
G1 X163.964 Y98.822 E.20281
G1 X163.901 Y99.222 E.00658
G1 X163.71 Y99.598 E.00685
G1 X163.411 Y99.896 E.00685
G1 X163.035 Y100.087 E.00685
G1 X162.635 Y100.151 E.00658
G1 X150.145 Y100.151 E.20281
G1 X149.745 Y100.087 E.00658
G1 X149.369 Y99.896 E.00685
G1 X149.071 Y99.598 E.00685
G1 X148.956 Y99.371 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X148.879 Y99.222 E-.06388
G1 X148.816 Y98.822 E-.15396
G1 X148.816 Y97.395 E-.54217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.516 Y92.319 Z2.3 F42000
G1 X163.318 Y84.483 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F2504
M204 S5000
G1 X163.5 Y84.512 E.00299
G1 X163.914 Y84.723 E.00756
G1 X164.243 Y85.052 E.00756
G1 X164.455 Y85.467 E.00756
G1 X164.53 Y85.961 E.00812
G1 X164.53 Y99.192 E.21483
G1 X164.455 Y99.686 E.00812
G1 X164.243 Y100.101 E.00756
G1 X163.914 Y100.43 E.00756
G1 X163.5 Y100.641 E.00756
G1 X163.005 Y100.716 E.00812
G1 X149.775 Y100.716 E.21483
G1 X149.28 Y100.641 E.00812
G1 X148.866 Y100.43 E.00756
G1 X148.537 Y100.101 E.00756
G1 X148.326 Y99.686 E.00756
G1 X148.25 Y99.192 E.00812
G1 X148.25 Y85.961 E.21483
G1 X148.326 Y85.467 E.00812
G1 X148.537 Y85.052 E.00756
G1 X148.866 Y84.723 E.00756
G1 X149.28 Y84.512 E.00756
G1 X149.775 Y84.436 E.00812
G1 X163.005 Y84.436 E.21483
G3 X163.26 Y84.467 I.009 J1.005 E.00418
; WIPE_START
G1 F3600
M204 S6000
G1 X163.5 Y84.512 E-.09267
G1 X163.914 Y84.723 E-.17683
G1 X164.243 Y85.052 E-.17684
G1 X164.455 Y85.467 E-.17683
G1 X164.509 Y85.823 E-.13683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 19 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer19 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.2 Y85.861 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.220742
G1 F2504
M204 S6000
G1 X164.234 Y86.135 E.00224
; LINE_WIDTH: 0.1878
G1 X164.247 Y86.303 E.00114
; LINE_WIDTH: 0.173839
G1 X164.247 Y98.838 E.07782
G1 X164.234 Y99.018 E.00112
; LINE_WIDTH: 0.214228
G1 X164.22 Y99.185 E.00132
; LINE_WIDTH: 0.239172
G3 X164.155 Y99.455 I-1 J-.1 E.00247
; LINE_WIDTH: 0.292213
G1 X164.116 Y99.576 E.0014
; LINE_WIDTH: 0.328821
G3 X163.64 Y100.171 I-1.208 J-.479 E.00968
; LINE_WIDTH: 0.306338
G3 X163.269 Y100.341 I-1.007 J-1.699 E.00475
; LINE_WIDTH: 0.25248
G1 X163.148 Y100.381 E.0012
; LINE_WIDTH: 0.220742
G3 X162.831 Y100.42 I-.386 J-1.814 E.00259
; LINE_WIDTH: 0.1878
G1 X162.663 Y100.433 E.00114
; LINE_WIDTH: 0.173839
G1 X150.129 Y100.434 E.07782
G1 X149.949 Y100.42 E.00112
; LINE_WIDTH: 0.214228
G1 X149.781 Y100.407 E.00132
; LINE_WIDTH: 0.239172
G3 X149.511 Y100.341 I.1 J-1 E.00247
; LINE_WIDTH: 0.292213
G1 X149.391 Y100.302 E.0014
; LINE_WIDTH: 0.328821
G3 X148.796 Y99.826 I.479 J-1.208 E.00968
; LINE_WIDTH: 0.306336
G3 X148.625 Y99.455 I1.699 J-1.007 E.00475
; LINE_WIDTH: 0.25248
G1 X148.586 Y99.334 E.0012
; LINE_WIDTH: 0.220742
G3 X148.547 Y99.018 I1.814 J-.386 E.00259
; LINE_WIDTH: 0.1878
G1 X148.533 Y98.85 E.00114
; LINE_WIDTH: 0.173651
G1 X148.533 Y86.303 E.0778
; LINE_WIDTH: 0.187809
G1 X148.547 Y86.135 E.00114
; LINE_WIDTH: 0.214228
G1 X148.56 Y85.967 E.00132
; LINE_WIDTH: 0.239172
G3 X148.625 Y85.698 I1 J.1 E.00247
; LINE_WIDTH: 0.292213
G1 X148.665 Y85.577 E.0014
; LINE_WIDTH: 0.328826
G3 X149.141 Y84.982 I1.208 J.479 E.00968
; LINE_WIDTH: 0.306366
G3 X149.511 Y84.812 I1.007 J1.699 E.00475
; LINE_WIDTH: 0.252479
G1 X149.632 Y84.772 E.0012
; LINE_WIDTH: 0.220742
G3 X149.949 Y84.733 I.386 J1.812 E.00259
; LINE_WIDTH: 0.1878
G1 X150.117 Y84.72 E.00114
; LINE_WIDTH: 0.173839
G1 X162.651 Y84.719 E.07782
G1 X162.831 Y84.733 E.00112
; LINE_WIDTH: 0.21423
G1 X162.999 Y84.746 E.00132
; LINE_WIDTH: 0.238631
G3 X163.264 Y84.81 I-.098 J.986 E.00242
; LINE_WIDTH: 0.291499
G1 X163.39 Y84.851 E.00145
; LINE_WIDTH: 0.328818
G3 X163.984 Y85.327 I-.479 J1.207 E.00968
; LINE_WIDTH: 0.306334
G3 X164.155 Y85.698 I-1.699 J1.007 E.00475
; LINE_WIDTH: 0.25248
G1 X164.189 Y85.802 E.00104
; WIPE_START
G1 F15000
G1 X164.234 Y86.135 E-.12761
G1 X164.247 Y86.303 E-.06397
G1 X164.247 Y87.799 E-.56842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.112 Y90.51 Z2.3 F42000
G1 X155.092 Y91.278 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2504
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.336 J2.586 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2504
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2504
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17438
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
G1 F2504
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17437
G1 X157.689 Y94.462 E-.1498
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
G1 F2504
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.759 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21354
G1 X155.092 Y94.485 E-.23945
G1 X154.722 Y94.124 E-.20273
G1 X154.55 Y93.922 E-.10428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.788 Y93.239 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2504
M204 S5000
G3 X156.591 Y89.894 I2.606 J-.663 E.08268
G3 X156.857 Y95.225 I-.205 J2.682 E.12622
G3 X153.803 Y93.297 I-.463 J-2.649 E.06431
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12461
G1 X153.704 Y92.711 E-.10192
G1 X153.704 Y92.442 E-.10186
G1 X153.73 Y92.176 E-.10191
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.656 E-.10195
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 20/72
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I-1.024 J-.657 P1  F42000
G1 X148.878 Y99.328 Z2.3
G1 Z2
G1 E.8 F1800
G1 F2514
M204 S5000
M73 P73 R6
G1 X148.838 Y99.248 E.00145
G1 X148.773 Y98.841 E.0067
G1 X148.773 Y86.312 E.20343
G1 X148.838 Y85.905 E.0067
G1 X149.032 Y85.522 E.00697
G1 X149.336 Y85.219 E.00697
G1 X149.718 Y85.024 E.00697
G1 X150.126 Y84.959 E.0067
G1 X162.654 Y84.959 E.20343
G1 X163.062 Y85.024 E.0067
G1 X163.444 Y85.219 E.00697
G1 X163.748 Y85.522 E.00697
G1 X163.943 Y85.905 E.00697
G1 X164.007 Y86.312 E.0067
G1 X164.007 Y98.841 E.20343
G1 X163.943 Y99.248 E.0067
G1 X163.748 Y99.631 E.00697
G1 X163.444 Y99.934 E.00697
G1 X163.062 Y100.129 E.00697
G1 X162.654 Y100.194 E.0067
G1 X150.126 Y100.194 E.20343
G1 X149.718 Y100.129 E.0067
G1 X149.336 Y99.934 E.00697
G1 X149.032 Y99.631 E.00697
G1 X148.905 Y99.381 E.00455
; WIPE_START
G1 F3600
M204 S6000
G1 X148.838 Y99.248 E-.05677
G1 X148.773 Y98.841 E-.15678
G1 X148.773 Y97.403 E-.54646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.478 Y92.332 Z2.4 F42000
G1 X163.354 Y84.444 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2514
M204 S5000
G1 X163.357 Y84.445 E.00005
G1 X163.529 Y84.472 E.00282
G1 X163.948 Y84.686 E.00764
G1 X164.281 Y85.018 E.00764
G1 X164.494 Y85.438 E.00764
G1 X164.571 Y85.937 E.0082
G1 X164.571 Y99.216 E.21562
G1 X164.494 Y99.715 E.0082
G1 X164.281 Y100.135 E.00764
G1 X163.948 Y100.467 E.00764
G1 X163.529 Y100.681 E.00764
G1 X163.03 Y100.757 E.0082
G1 X149.751 Y100.757 E.21562
G1 X149.251 Y100.681 E.0082
G1 X148.832 Y100.467 E.00764
G1 X148.499 Y100.135 E.00764
G1 X148.286 Y99.715 E.00764
G1 X148.21 Y99.216 E.0082
G1 X148.21 Y85.937 E.21562
G1 X148.286 Y85.437 E.0082
G1 X148.499 Y85.018 E.00764
G1 X148.832 Y84.686 E.00764
G1 X149.251 Y84.472 E.00764
G1 X149.751 Y84.396 E.0082
G1 X163.03 Y84.396 E.21562
G1 X163.295 Y84.436 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X163.357 Y84.445 E-.02403
G1 X163.529 Y84.472 E-.06609
G1 X163.948 Y84.686 E-.17875
G1 X164.281 Y85.018 E-.17877
G1 X164.494 Y85.438 E-.17876
G1 X164.547 Y85.785 E-.13359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 20 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer20 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.239 Y85.823 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219144
G1 F2514
M204 S6000
G1 X164.275 Y86.114 E.00236
; LINE_WIDTH: 0.185704
G1 X164.289 Y86.284 E.00114
; LINE_WIDTH: 0.171534
G1 X164.289 Y98.857 E.07688
G1 X164.275 Y99.039 E.00112
; LINE_WIDTH: 0.212546
G1 X164.262 Y99.21 E.00133
; LINE_WIDTH: 0.237828
G3 X164.195 Y99.483 I-1.009 J-.1 E.00248
; LINE_WIDTH: 0.291544
G1 X164.156 Y99.605 E.00142
; LINE_WIDTH: 0.328611
G3 X163.673 Y100.209 I-1.225 J-.486 E.00982
; LINE_WIDTH: 0.305849
G3 X163.297 Y100.382 I-1.024 J-1.731 E.0048
; LINE_WIDTH: 0.251254
G1 X163.174 Y100.422 E.00121
; LINE_WIDTH: 0.219144
G3 X162.853 Y100.461 I-.392 J-1.848 E.00261
; LINE_WIDTH: 0.185704
G1 X162.682 Y100.475 E.00115
; LINE_WIDTH: 0.171534
G1 X150.11 Y100.475 E.07688
G1 X149.927 Y100.461 E.00112
; LINE_WIDTH: 0.212546
G1 X149.757 Y100.448 E.00133
; LINE_WIDTH: 0.237828
G3 X149.484 Y100.382 I.1 J-1.009 E.00248
; LINE_WIDTH: 0.291544
G1 X149.361 Y100.342 E.00142
; LINE_WIDTH: 0.328611
G3 X148.758 Y99.859 I.486 J-1.225 E.00982
; LINE_WIDTH: 0.30585
G3 X148.585 Y99.483 I1.731 J-1.024 E.0048
; LINE_WIDTH: 0.251254
G1 X148.545 Y99.36 E.00121
; LINE_WIDTH: 0.219145
G3 X148.505 Y99.039 I1.848 J-.392 E.00261
; LINE_WIDTH: 0.185704
G1 X148.492 Y98.869 E.00114
; LINE_WIDTH: 0.171341
G1 X148.492 Y86.284 E.07685
; LINE_WIDTH: 0.185689
G1 X148.505 Y86.114 E.00114
; LINE_WIDTH: 0.212546
G1 X148.519 Y85.943 E.00133
; LINE_WIDTH: 0.237828
G3 X148.585 Y85.67 I1.009 J.1 E.00248
; LINE_WIDTH: 0.291544
G1 X148.625 Y85.548 E.00142
; LINE_WIDTH: 0.328611
G3 X149.108 Y84.944 I1.225 J.486 E.00982
; LINE_WIDTH: 0.30585
G3 X149.484 Y84.771 I1.024 J1.731 E.0048
; LINE_WIDTH: 0.251254
G1 X149.606 Y84.731 E.00121
; LINE_WIDTH: 0.219145
G3 X149.927 Y84.692 I.392 J1.848 E.00261
; LINE_WIDTH: 0.185704
G1 X150.098 Y84.678 E.00114
; LINE_WIDTH: 0.171534
G1 X162.671 Y84.678 E.07688
G1 X162.853 Y84.692 E.00112
; LINE_WIDTH: 0.212551
G1 X163.024 Y84.705 E.00133
; LINE_WIDTH: 0.238928
G3 X163.305 Y84.774 I-.105 J1.038 E.00258
; LINE_WIDTH: 0.292968
G1 X163.419 Y84.811 E.00132
; LINE_WIDTH: 0.328613
G3 X164.022 Y85.294 I-.486 J1.225 E.00982
; LINE_WIDTH: 0.305849
G3 X164.195 Y85.67 I-1.73 J1.024 E.00481
; LINE_WIDTH: 0.251254
G1 X164.226 Y85.765 E.00093
; WIPE_START
G1 F15000
G1 X164.275 Y86.114 E-.13379
G1 X164.289 Y86.284 E-.06502
G1 X164.289 Y87.761 E-.56119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.16 Y90.487 Z2.4 F42000
G1 X155.092 Y91.278 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2514
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.336 J2.587 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2514
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2514
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14981
G1 X158.286 Y91.278 E-.17436
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F2514
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00788
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14976
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F2514
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20273
G1 X154.55 Y93.922 E-.10428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.784 Y93.24 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2514
M204 S5000
G3 X156.591 Y89.894 I2.607 J-.664 E.08276
G3 X156.857 Y95.225 I-.205 J2.682 E.12622
G3 X153.799 Y93.298 I-.467 J-2.649 E.06436
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12465
G1 X153.704 Y92.711 E-.10192
G1 X153.704 Y92.442 E-.10186
G1 X153.73 Y92.176 E-.10189
G1 X153.784 Y91.913 E-.10189
G1 X153.863 Y91.657 E-.10193
G1 X153.967 Y91.409 E-.10191
G1 X153.997 Y91.354 E-.02394
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 21/72
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-1.022 J-.661 P1  F42000
G1 X148.828 Y99.338 Z2.4
G1 Z2.1
G1 E.8 F1800
G1 F2524
M204 S5000
G1 X148.796 Y99.275 E.00115
G1 X148.73 Y98.86 E.00682
G1 X148.73 Y86.293 E.20405
G1 X148.796 Y85.878 E.00682
G1 X148.994 Y85.489 E.00709
G1 X149.079 Y85.405 E.00194
G1 X149.303 Y85.18 E.00515
G1 X149.692 Y84.982 E.00709
G1 X150.107 Y84.916 E.00682
G1 X162.673 Y84.916 E.20405
G1 X163.088 Y84.982 E.00682
G1 X163.477 Y85.18 E.00709
G1 X163.786 Y85.489 E.00709
G1 X163.984 Y85.878 E.00709
G1 X164.05 Y86.293 E.00682
G1 X164.05 Y98.86 E.20405
G1 X163.984 Y99.275 E.00682
G1 X163.786 Y99.664 E.00709
G1 X163.477 Y99.972 E.00709
G1 X163.088 Y100.171 E.00709
G1 X162.673 Y100.236 E.00682
G1 X150.107 Y100.236 E.20405
G1 X149.692 Y100.171 E.00682
G1 X149.303 Y99.972 E.00709
G1 X148.994 Y99.664 E.00709
G1 X148.855 Y99.391 E.00497
; WIPE_START
G1 F3600
M204 S6000
G1 X148.796 Y99.275 E-.04967
G1 X148.73 Y98.86 E-.15961
G1 X148.73 Y97.41 E-.55072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.44 Y92.346 Z2.5 F42000
G1 X163.392 Y84.406 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F2524
M204 S5000
G1 X163.398 Y84.407 E.0001
G1 X163.558 Y84.432 E.00263
G1 X163.982 Y84.648 E.00772
G1 X164.318 Y84.984 E.00772
G1 X164.534 Y85.408 E.00772
G1 X164.611 Y85.913 E.00829
G1 X164.611 Y99.24 E.21641
G1 X164.534 Y99.745 E.00829
G1 X164.318 Y100.168 E.00772
G1 X163.982 Y100.505 E.00772
G1 X163.558 Y100.721 E.00772
G1 X163.054 Y100.798 E.00829
G1 X149.726 Y100.798 E.21641
G1 X149.222 Y100.721 E.00829
G1 X148.798 Y100.505 E.00772
G1 X148.462 Y100.168 E.00772
G1 X148.246 Y99.745 E.00772
G1 X148.169 Y99.24 E.00829
G1 X148.169 Y85.913 E.21641
G1 X148.246 Y85.408 E.00829
G1 X148.462 Y84.984 E.00772
G1 X148.798 Y84.648 E.00772
G1 X149.222 Y84.432 E.00772
G1 X149.726 Y84.355 E.00829
G1 X163.054 Y84.355 E.21641
G1 X163.333 Y84.397 E.00458
; WIPE_START
G1 F3600
M204 S6000
G1 X163.398 Y84.407 E-.02514
G1 X163.558 Y84.432 E-.06159
G1 X163.982 Y84.648 E-.18069
G1 X164.318 Y84.984 E-.1807
G1 X164.534 Y85.408 E-.18068
G1 X164.586 Y85.749 E-.13121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 21 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer21 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.279 Y85.788 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.217534
G1 F2524
M204 S6000
G1 X164.317 Y86.092 E.00245
; LINE_WIDTH: 0.18357
G1 X164.33 Y86.265 E.00115
; LINE_WIDTH: 0.169219
G1 X164.331 Y98.876 E.07592
G1 X164.317 Y99.061 E.00112
; LINE_WIDTH: 0.210868
G1 X164.303 Y99.234 E.00134
; LINE_WIDTH: 0.236489
G3 X164.236 Y99.511 I-1.019 J-.101 E.0025
; LINE_WIDTH: 0.290875
G1 X164.196 Y99.635 E.00143
; LINE_WIDTH: 0.328419
G3 X163.705 Y100.247 I-1.256 J-.503 E.00995
; LINE_WIDTH: 0.30536
G3 X163.324 Y100.422 I-1.041 J-1.761 E.00486
; LINE_WIDTH: 0.250029
G1 X163.2 Y100.463 E.00122
; LINE_WIDTH: 0.217534
G3 X162.875 Y100.503 I-.399 J-1.884 E.00262
; LINE_WIDTH: 0.18357
G1 X162.701 Y100.517 E.00115
; LINE_WIDTH: 0.169219
G1 X150.091 Y100.517 E.07592
G1 X149.906 Y100.503 E.00112
; LINE_WIDTH: 0.210868
G1 X149.732 Y100.489 E.00134
; LINE_WIDTH: 0.236489
G3 X149.456 Y100.422 I.101 J-1.019 E.0025
; LINE_WIDTH: 0.290875
G1 X149.332 Y100.382 E.00143
; LINE_WIDTH: 0.328419
G3 X148.72 Y99.892 I.503 J-1.256 E.00995
; LINE_WIDTH: 0.30536
G3 X148.544 Y99.511 I1.761 J-1.041 E.00486
; LINE_WIDTH: 0.250029
G1 X148.504 Y99.386 E.00122
; LINE_WIDTH: 0.217534
G3 X148.464 Y99.061 I1.884 J-.399 E.00262
; LINE_WIDTH: 0.18357
G1 X148.45 Y98.888 E.00115
; LINE_WIDTH: 0.169021
G1 X148.45 Y86.265 E.07589
; LINE_WIDTH: 0.183583
G1 X148.464 Y86.092 E.00115
; LINE_WIDTH: 0.210868
G1 X148.477 Y85.919 E.00134
; LINE_WIDTH: 0.236489
G3 X148.544 Y85.642 I1.019 J.101 E.0025
; LINE_WIDTH: 0.290875
G1 X148.585 Y85.518 E.00143
; LINE_WIDTH: 0.328423
G3 X149.075 Y84.906 I1.331 J.564 E.00993
; LINE_WIDTH: 0.305369
G3 X149.456 Y84.731 I1.041 J1.76 E.00486
; LINE_WIDTH: 0.250029
G1 X149.58 Y84.69 E.00122
; LINE_WIDTH: 0.217534
G3 X149.906 Y84.65 I.399 J1.884 E.00262
; LINE_WIDTH: 0.18357
G1 X150.079 Y84.636 E.00115
; LINE_WIDTH: 0.169219
G1 X162.69 Y84.636 E.07592
G1 X162.875 Y84.65 E.00112
; LINE_WIDTH: 0.21087
G1 X163.048 Y84.664 E.00134
; LINE_WIDTH: 0.225054
G3 X163.2 Y84.69 I-.093 J.976 E.00128
; LINE_WIDTH: 0.253606
G1 X163.346 Y84.738 E.00145
; LINE_WIDTH: 0.294444
G1 X163.448 Y84.771 E.0012
; LINE_WIDTH: 0.328419
G3 X164.061 Y85.261 I-.503 J1.256 E.00995
; LINE_WIDTH: 0.30536
G3 X164.236 Y85.642 I-1.761 J1.041 E.00486
; LINE_WIDTH: 0.250029
G1 X164.264 Y85.73 E.00085
; WIPE_START
G1 F15000
G1 X164.317 Y86.092 E-.13915
G1 X164.33 Y86.265 E-.06608
G1 X164.33 Y87.725 E-.55477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.206 Y90.465 Z2.5 F42000
G1 X155.092 Y91.278 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2524
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.587 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2524
M204 S5000
M73 P74 R6
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2524
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00677
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14984
G1 X158.286 Y91.278 E-.17433
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F2524
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F2524
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.761 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20275
G1 X154.55 Y93.922 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.784 Y93.24 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2524
M204 S5000
G3 X156.591 Y89.894 I2.607 J-.664 E.08276
G3 X156.857 Y95.225 I-.205 J2.682 E.12622
G3 X153.799 Y93.298 I-.467 J-2.649 E.06436
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12466
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.656 E-.10192
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02393
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 22/72
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I-1.019 J-.665 P1  F42000
G1 X148.778 Y99.347 Z2.5
G1 Z2.2
G1 E.8 F1800
G1 F2534
M204 S5000
G1 X148.754 Y99.301 E.00085
G1 X148.687 Y98.879 E.00694
G1 X148.687 Y86.274 E.20467
G1 X148.754 Y85.852 E.00694
G1 X148.956 Y85.456 E.00721
G1 X149.058 Y85.354 E.00234
G1 X149.27 Y85.142 E.00487
G1 X149.666 Y84.94 E.00721
G1 X150.088 Y84.874 E.00694
G1 X162.692 Y84.874 E.20467
G1 X163.115 Y84.94 E.00694
G1 X163.51 Y85.142 E.00721
G1 X163.824 Y85.456 E.00721
G1 X164.026 Y85.852 E.00721
G1 X164.093 Y86.274 E.00694
G1 X164.093 Y98.879 E.20467
G1 X164.026 Y99.301 E.00694
G1 X163.824 Y99.697 E.00721
G1 X163.51 Y100.011 E.00721
G1 X163.115 Y100.212 E.00721
G1 X162.692 Y100.279 E.00694
G1 X150.088 Y100.279 E.20467
G1 X149.666 Y100.212 E.00694
G1 X149.27 Y100.011 E.00721
G1 X148.956 Y99.697 E.00721
G1 X148.805 Y99.401 E.00539
; WIPE_START
G1 F3600
M204 S6000
G1 X148.754 Y99.301 E-.0426
G1 X148.687 Y98.879 E-.16244
G1 X148.687 Y97.418 E-.55496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.403 Y92.36 Z2.6 F42000
G1 X163.432 Y84.368 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F2534
M204 S5000
G1 X163.439 Y84.369 E.00012
G1 X163.588 Y84.393 E.00244
G1 X164.016 Y84.611 E.0078
G1 X164.356 Y84.951 E.0078
G1 X164.574 Y85.379 E.0078
G1 X164.652 Y85.888 E.00837
G1 X164.652 Y99.265 E.2172
G1 X164.574 Y99.774 E.00837
G1 X164.356 Y100.202 E.0078
G1 X164.016 Y100.542 E.0078
G1 X163.588 Y100.76 E.0078
G1 X163.078 Y100.838 E.00837
G1 X149.702 Y100.838 E.2172
G1 X149.193 Y100.76 E.00837
G1 X148.764 Y100.542 E.0078
G1 X148.424 Y100.202 E.0078
G1 X148.206 Y99.774 E.0078
G1 X148.128 Y99.265 E.00837
G1 X148.128 Y85.888 E.2172
G1 X148.206 Y85.379 E.00837
G1 X148.424 Y84.951 E.0078
G1 X148.764 Y84.611 E.0078
G1 X149.193 Y84.393 E.0078
G1 X149.702 Y84.315 E.00837
G1 X163.078 Y84.315 E.2172
G1 X163.372 Y84.359 E.00483
; WIPE_START
G1 F3600
M204 S6000
G1 X163.439 Y84.369 E-.02572
G1 X163.588 Y84.393 E-.05708
G1 X164.016 Y84.611 E-.18263
G1 X164.356 Y84.951 E-.18261
G1 X164.574 Y85.379 E-.18262
G1 X164.625 Y85.715 E-.12934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 22 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer22 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.319 Y85.753 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215934
G1 F2534
M204 S6000
G1 X164.358 Y86.07 E.00253
; LINE_WIDTH: 0.181459
G1 X164.372 Y86.247 E.00115
; LINE_WIDTH: 0.166904
G1 X164.372 Y98.895 E.07495
G1 X164.358 Y99.082 E.00111
; LINE_WIDTH: 0.209192
G1 X164.344 Y99.259 E.00135
; LINE_WIDTH: 0.235132
G3 X164.276 Y99.538 I-1.03 J-.102 E.00251
; LINE_WIDTH: 0.290196
G1 X164.236 Y99.664 E.00145
; LINE_WIDTH: 0.328202
G3 X163.738 Y100.285 I-1.273 J-.51 E.01009
; LINE_WIDTH: 0.304855
G3 X163.352 Y100.463 I-1.058 J-1.792 E.00492
; LINE_WIDTH: 0.248798
G1 X163.226 Y100.504 E.00123
; LINE_WIDTH: 0.215934
G3 X162.896 Y100.544 I-.405 J-1.918 E.00264
; LINE_WIDTH: 0.181459
G1 X162.72 Y100.558 E.00115
; LINE_WIDTH: 0.166904
G1 X150.072 Y100.559 E.07495
G1 X149.884 Y100.544 E.00111
; LINE_WIDTH: 0.209192
G1 X149.708 Y100.531 E.00135
; LINE_WIDTH: 0.235132
G3 X149.428 Y100.463 I.102 J-1.03 E.00251
; LINE_WIDTH: 0.290196
G1 X149.302 Y100.422 E.00145
; LINE_WIDTH: 0.328202
M73 P74 R5
G3 X148.682 Y99.925 I.51 J-1.273 E.01009
; LINE_WIDTH: 0.304855
G3 X148.504 Y99.538 I1.792 J-1.058 E.00492
; LINE_WIDTH: 0.248798
G1 X148.463 Y99.413 E.00123
; LINE_WIDTH: 0.215934
G3 X148.422 Y99.082 I1.918 J-.405 E.00264
; LINE_WIDTH: 0.181459
G1 X148.408 Y98.906 E.00115
; LINE_WIDTH: 0.166701
G1 X148.408 Y86.247 E.07492
; LINE_WIDTH: 0.181464
G1 X148.422 Y86.07 E.00115
; LINE_WIDTH: 0.209192
G1 X148.436 Y85.894 E.00135
; LINE_WIDTH: 0.235131
G3 X148.504 Y85.615 I1.03 J.102 E.00251
; LINE_WIDTH: 0.290192
G1 X148.545 Y85.489 E.00145
; LINE_WIDTH: 0.328212
G3 X149.042 Y84.868 I1.374 J.591 E.01006
; LINE_WIDTH: 0.304869
G3 X149.428 Y84.69 I1.058 J1.792 E.00492
; LINE_WIDTH: 0.248803
G1 X149.554 Y84.649 E.00123
; LINE_WIDTH: 0.215934
G3 X149.884 Y84.609 I.405 J1.918 E.00264
; LINE_WIDTH: 0.181459
G1 X150.06 Y84.595 E.00115
; LINE_WIDTH: 0.166904
G1 X162.709 Y84.594 E.07495
G1 X162.896 Y84.609 E.00111
; LINE_WIDTH: 0.209192
G1 X163.072 Y84.622 E.00135
; LINE_WIDTH: 0.229791
G3 X163.306 Y84.675 I-.077 J.885 E.00204
; LINE_WIDTH: 0.267746
G1 X163.387 Y84.701 E.00085
; LINE_WIDTH: 0.295916
G1 X163.478 Y84.731 E.00107
; LINE_WIDTH: 0.328214
G3 X164.099 Y85.228 I-.51 J1.274 E.01009
; LINE_WIDTH: 0.304864
G3 X164.276 Y85.615 I-1.793 J1.059 E.00492
; LINE_WIDTH: 0.248798
G1 X164.303 Y85.696 E.00079
; WIPE_START
G1 F15000
G1 X164.358 Y86.07 E-.14398
G1 X164.372 Y86.247 E-.06713
G1 X164.372 Y87.691 E-.54889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.253 Y90.443 Z2.6 F42000
G1 X155.092 Y91.278 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2534
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2534
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14977
G1 X158.286 Y91.278 E-.17439
G1 X157.749 Y91.278 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F2534
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F2534
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.786 Y93.24 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G3 X156.055 Y89.908 I2.605 J-.665 E.07401
G3 X156.591 Y89.894 I.341 J2.892 E.00872
G3 X153.801 Y93.298 I-.201 J2.681 E.19054
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12463
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10185
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10191
G1 X153.997 Y91.354 E-.02399
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 23/72
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-1.016 J-.669 P1  F42000
G1 X148.728 Y99.357 Z2.6
M73 P75 R5
G1 Z2.3
G1 E.8 F1800
G1 F2545
M204 S5000
G1 X148.712 Y99.327 E.00055
G1 X148.644 Y98.898 E.00706
G1 X148.644 Y86.255 E.20529
G1 X148.712 Y85.826 E.00706
G1 X148.918 Y85.423 E.00733
G1 X149.237 Y85.104 E.00733
G1 X149.639 Y84.899 E.00733
G1 X150.069 Y84.831 E.00706
G1 X162.711 Y84.831 E.20529
G1 X163.141 Y84.899 E.00706
G1 X163.543 Y85.104 E.00733
G1 X163.863 Y85.423 E.00733
G1 X164.068 Y85.826 E.00733
G1 X164.136 Y86.255 E.00706
G1 X164.136 Y98.898 E.20529
G1 X164.068 Y99.327 E.00706
G1 X163.863 Y99.73 E.00733
G1 X163.543 Y100.049 E.00733
G1 X163.141 Y100.254 E.00733
G1 X162.711 Y100.322 E.00706
G1 X150.069 Y100.322 E.20529
G1 X149.639 Y100.254 E.00706
G1 X149.237 Y100.049 E.00733
G1 X148.917 Y99.73 E.00733
G1 X148.755 Y99.411 E.00581
; WIPE_START
G1 F3600
M204 S6000
G1 X148.712 Y99.327 E-.03556
G1 X148.644 Y98.898 E-.16527
G1 X148.644 Y97.426 E-.55917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.367 Y92.375 Z2.7 F42000
G1 X163.48 Y84.331 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F2545
M204 S5000
G1 X163.617 Y84.353 E.00225
G1 X164.05 Y84.573 E.00789
G1 X164.393 Y84.917 E.00789
G1 X164.614 Y85.349 E.00789
G1 X164.692 Y85.864 E.00845
G1 X164.692 Y99.289 E.21799
G1 X164.614 Y99.803 E.00845
G1 X164.393 Y100.236 E.00789
G1 X164.05 Y100.58 E.00789
G1 X163.617 Y100.8 E.00789
G1 X163.103 Y100.879 E.00845
G1 X149.678 Y100.879 E.21799
G1 X149.163 Y100.8 E.00845
G1 X148.73 Y100.58 E.00789
G1 X148.387 Y100.236 E.00789
G1 X148.167 Y99.803 E.00789
G1 X148.088 Y99.289 E.00845
G1 X148.088 Y85.864 E.21799
G1 X148.167 Y85.349 E.00845
G1 X148.387 Y84.917 E.00789
G1 X148.73 Y84.573 E.00789
G1 X149.163 Y84.353 E.00789
G1 X149.678 Y84.274 E.00845
G1 X163.103 Y84.274 E.21799
G1 X163.421 Y84.322 E.00523
; WIPE_START
G1 F3600
M204 S6000
G1 X163.617 Y84.353 E-.0754
G1 X164.05 Y84.573 E-.18454
G1 X164.393 Y84.917 E-.18455
G1 X164.614 Y85.349 E-.18455
G1 X164.666 Y85.69 E-.13097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 23 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer23 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.36 Y85.728 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.214334
G1 F2545
M204 S6000
G1 X164.4 Y86.049 E.00254
; LINE_WIDTH: 0.179348
G1 X164.414 Y86.228 E.00115
; LINE_WIDTH: 0.164599
G1 X164.414 Y98.914 E.07399
G1 X164.4 Y99.104 E.00111
; LINE_WIDTH: 0.207503
G1 X164.385 Y99.283 E.00136
; LINE_WIDTH: 0.233777
G3 X164.317 Y99.566 I-1.038 J-.102 E.00253
; LINE_WIDTH: 0.289507
G1 X164.275 Y99.694 E.00146
; LINE_WIDTH: 0.328007
G3 X164.093 Y100.018 I-1.313 J-.525 E.00466
G1 X163.771 Y100.323 E.00554
; LINE_WIDTH: 0.304363
G3 X163.38 Y100.503 I-1.075 J-1.822 E.00498
; LINE_WIDTH: 0.247572
G1 X163.252 Y100.545 E.00123
; LINE_WIDTH: 0.214335
G3 X162.918 Y100.586 I-.411 J-1.953 E.00265
; LINE_WIDTH: 0.179348
G1 X162.739 Y100.6 E.00115
; LINE_WIDTH: 0.164599
G1 X150.053 Y100.6 E.07399
G1 X149.862 Y100.586 E.00111
; LINE_WIDTH: 0.207503
G1 X149.684 Y100.572 E.00136
; LINE_WIDTH: 0.233777
G3 X149.401 Y100.503 I.102 J-1.038 E.00253
; LINE_WIDTH: 0.289507
G1 X149.273 Y100.462 E.00146
; LINE_WIDTH: 0.328007
G3 X148.949 Y100.279 I.525 J-1.313 E.00466
G1 X148.643 Y99.958 E.00554
; LINE_WIDTH: 0.304363
G3 X148.463 Y99.566 I1.822 J-1.075 E.00498
; LINE_WIDTH: 0.247572
G1 X148.422 Y99.439 E.00123
; LINE_WIDTH: 0.214335
G3 X148.381 Y99.104 I1.953 J-.411 E.00265
; LINE_WIDTH: 0.179348
G1 X148.367 Y98.925 E.00115
; LINE_WIDTH: 0.164391
G1 X148.367 Y86.228 E.07394
; LINE_WIDTH: 0.179354
G1 X148.381 Y86.049 E.00115
; LINE_WIDTH: 0.207503
G1 X148.395 Y85.87 E.00136
; LINE_WIDTH: 0.233777
G3 X148.463 Y85.587 I1.038 J.102 E.00253
; LINE_WIDTH: 0.289507
G1 X148.505 Y85.459 E.00146
; LINE_WIDTH: 0.328007
G3 X148.687 Y85.135 I1.313 J.525 E.00466
G1 X149.009 Y84.83 E.00554
; LINE_WIDTH: 0.304363
G3 X149.401 Y84.65 I1.075 J1.822 E.00498
; LINE_WIDTH: 0.247572
G1 X149.528 Y84.608 E.00123
; LINE_WIDTH: 0.214335
G3 X149.862 Y84.567 I.411 J1.953 E.00265
; LINE_WIDTH: 0.179348
G1 X150.041 Y84.553 E.00115
; LINE_WIDTH: 0.1646
G1 X162.728 Y84.553 E.07399
G1 X162.918 Y84.567 E.00111
; LINE_WIDTH: 0.207517
G1 X163.097 Y84.581 E.00136
; LINE_WIDTH: 0.229062
G3 X163.34 Y84.637 I-.081 J.911 E.00212
; LINE_WIDTH: 0.269842
G1 X163.427 Y84.665 E.00093
; LINE_WIDTH: 0.297369
G1 X163.507 Y84.691 E.00094
; LINE_WIDTH: 0.328
G3 X163.832 Y84.874 I-.524 J1.312 E.00466
G1 X164.137 Y85.195 E.00554
; LINE_WIDTH: 0.304355
G3 X164.317 Y85.587 I-1.824 J1.076 E.00498
; LINE_WIDTH: 0.247572
G1 X164.344 Y85.67 E.00081
; WIPE_START
G1 F15000
G1 X164.4 Y86.049 E-.14538
G1 X164.414 Y86.228 E-.06818
G1 X164.414 Y87.666 E-.54645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.297 Y90.423 Z2.7 F42000
G1 X155.092 Y91.278 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2545
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.59 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2545
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2545
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F2545
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F2545
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.759 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20278
G1 X154.55 Y93.922 E-.10423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2545
M204 S5000
G3 X156.056 Y89.908 I2.605 J-.666 E.07418
G3 X156.341 Y89.888 I.241 J1.417 E.00466
G3 X153.793 Y93.3 I.041 J2.688 E.19447
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10189
G1 X153.863 Y91.656 E-.10193
G1 X153.967 Y91.409 E-.10183
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 24/72
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.7 I-1.014 J-.673 P1  F42000
G1 X148.678 Y99.367 Z2.7
G1 Z2.4
G1 E.8 F1800
G1 F2555
M204 S5000
G1 X148.671 Y99.354 E.00025
G1 X148.602 Y98.917 E.00718
G1 X148.602 Y86.236 E.20591
G1 X148.671 Y85.799 E.00718
G1 X148.879 Y85.39 E.00745
G1 X149.204 Y85.066 E.00745
G1 X149.613 Y84.857 E.00746
G1 X150.05 Y84.788 E.00718
G1 X162.73 Y84.788 E.20591
G1 X163.167 Y84.857 E.00718
G1 X163.576 Y85.066 E.00745
G1 X163.901 Y85.39 E.00745
G1 X164.109 Y85.799 E.00745
G1 X164.179 Y86.236 E.00718
G1 X164.179 Y98.917 E.20591
G1 X164.109 Y99.354 E.00718
G1 X163.901 Y99.763 E.00745
G1 X163.576 Y100.087 E.00745
G1 X163.167 Y100.296 E.00745
G1 X162.73 Y100.365 E.00718
G1 X150.05 Y100.365 E.20591
G1 X149.613 Y100.296 E.00718
G1 X149.204 Y100.087 E.00745
G1 X148.879 Y99.763 E.00745
G1 X148.705 Y99.421 E.00623
; WIPE_START
G1 F3600
M204 S6000
G1 X148.671 Y99.354 E-.02857
G1 X148.602 Y98.917 E-.1681
G1 X148.602 Y97.434 E-.56333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.328 Y92.388 Z2.8 F42000
G1 X163.514 Y84.292 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F2555
M204 S5000
G1 X163.521 Y84.293 E.00012
G1 X163.646 Y84.313 E.00205
G1 X164.084 Y84.536 E.00797
G1 X164.431 Y84.883 E.00797
G1 X164.653 Y85.32 E.00797
G1 X164.733 Y85.84 E.00853
G1 X164.733 Y99.313 E.21878
G1 X164.653 Y99.833 E.00853
G1 X164.431 Y100.27 E.00797
G1 X164.084 Y100.617 E.00797
G1 X163.646 Y100.84 E.00797
G1 X163.127 Y100.919 E.00853
G1 X149.653 Y100.919 E.21878
G1 X149.134 Y100.84 E.00853
G1 X148.697 Y100.617 E.00797
G1 X148.35 Y100.27 E.00797
G1 X148.127 Y99.833 E.00797
G1 X148.047 Y99.313 E.00853
G1 X148.047 Y85.84 E.21878
G1 X148.127 Y85.32 E.00853
G1 X148.35 Y84.883 E.00797
G1 X148.697 Y84.536 E.00797
G1 X149.134 Y84.313 E.00797
G1 X149.653 Y84.234 E.00853
G1 X163.127 Y84.234 E.21878
G1 X163.455 Y84.283 E.00538
; WIPE_START
G1 F3600
M204 S6000
G1 X163.521 Y84.293 E-.02564
G1 X163.646 Y84.313 E-.04808
G1 X164.084 Y84.536 E-.18649
G1 X164.431 Y84.883 E-.18647
G1 X164.653 Y85.32 E-.18647
G1 X164.704 Y85.65 E-.12685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 24 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer24 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.399 Y85.688 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212731
G1 F2555
M204 S6000
G3 X164.441 Y86.027 I-1.989 J.417 E.00266
; LINE_WIDTH: 0.177237
G1 X164.455 Y86.209 E.00116
; LINE_WIDTH: 0.162285
G1 X164.456 Y98.933 E.07301
G1 X164.441 Y99.126 E.00111
; LINE_WIDTH: 0.205819
G1 X164.427 Y99.307 E.00137
; LINE_WIDTH: 0.232433
G3 X164.357 Y99.594 I-1.048 J-.102 E.00254
; LINE_WIDTH: 0.288824
G1 X164.315 Y99.723 E.00148
; LINE_WIDTH: 0.3278
G3 X164.13 Y100.052 I-1.327 J-.53 E.00472
G1 X163.804 Y100.361 E.00561
; LINE_WIDTH: 0.303873
G3 X163.407 Y100.544 I-1.092 J-1.854 E.00503
; LINE_WIDTH: 0.246347
G1 X163.278 Y100.586 E.00124
; LINE_WIDTH: 0.212731
G3 X162.939 Y100.627 I-.417 J-1.989 E.00266
; LINE_WIDTH: 0.177237
G1 X162.758 Y100.642 E.00116
; LINE_WIDTH: 0.162285
G1 X150.034 Y100.642 E.07301
G1 X149.841 Y100.627 E.00111
; LINE_WIDTH: 0.205819
G1 X149.659 Y100.613 E.00137
; LINE_WIDTH: 0.232433
G3 X149.373 Y100.544 I.102 J-1.048 E.00254
; LINE_WIDTH: 0.288824
G1 X149.244 Y100.502 E.00148
; LINE_WIDTH: 0.3278
G3 X148.915 Y100.317 I.53 J-1.327 E.00472
G1 X148.605 Y99.99 E.00561
; LINE_WIDTH: 0.303873
G3 X148.423 Y99.594 I1.854 J-1.092 E.00503
; LINE_WIDTH: 0.246347
G1 X148.381 Y99.465 E.00124
; LINE_WIDTH: 0.212731
G3 X148.339 Y99.126 I1.989 J-.417 E.00266
; LINE_WIDTH: 0.177237
G1 X148.325 Y98.944 E.00116
; LINE_WIDTH: 0.162071
G1 X148.325 Y86.209 E.07296
; LINE_WIDTH: 0.177233
G1 X148.339 Y86.027 E.00116
; LINE_WIDTH: 0.205819
G1 X148.354 Y85.846 E.00137
; LINE_WIDTH: 0.232433
G3 X148.423 Y85.559 I1.048 J.102 E.00254
; LINE_WIDTH: 0.288824
G1 X148.465 Y85.43 E.00148
; LINE_WIDTH: 0.327805
G3 X148.65 Y85.101 I1.327 J.53 E.00472
G1 X148.976 Y84.792 E.00561
; LINE_WIDTH: 0.30389
G3 X149.373 Y84.609 I1.092 J1.853 E.00503
; LINE_WIDTH: 0.246347
G1 X149.502 Y84.567 E.00124
; LINE_WIDTH: 0.212736
G3 X149.841 Y84.526 I.417 J1.987 E.00266
; LINE_WIDTH: 0.177237
G1 X150.022 Y84.511 E.00116
; LINE_WIDTH: 0.162285
G1 X162.747 Y84.511 E.07301
G1 X162.939 Y84.526 E.00111
; LINE_WIDTH: 0.205832
G1 X163.121 Y84.54 E.00137
; LINE_WIDTH: 0.22836
G3 X163.373 Y84.598 I-.084 J.939 E.00219
; LINE_WIDTH: 0.271993
G1 X163.468 Y84.629 E.00102
; LINE_WIDTH: 0.29885
G1 X163.537 Y84.651 E.00081
; LINE_WIDTH: 0.3278
G3 X163.866 Y84.836 I-.53 J1.327 E.00472
G1 X164.175 Y85.162 E.00561
; LINE_WIDTH: 0.303867
G3 X164.357 Y85.559 I-1.854 J1.093 E.00503
; LINE_WIDTH: 0.246342
G1 X164.381 Y85.631 E.00069
; WIPE_START
G1 F15000
G1 X164.441 Y86.027 E-.1522
G1 X164.455 Y86.209 E-.06923
G1 X164.455 Y87.626 E-.53857
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P76 R5
G1 X157.345 Y90.399 Z2.8 F42000
G1 X155.092 Y91.278 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2555
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.336 J2.587 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2555
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2555
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14981
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F2555
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F2555
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20274
G1 X154.55 Y93.922 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2555
M204 S5000
G3 X156.056 Y89.908 I2.604 J-.666 E.07421
G3 X156.347 Y89.888 I.242 J1.438 E.00474
G3 X153.791 Y93.3 I.033 J2.688 E.19433
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 25/72
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-1.012 J-.677 P1  F42000
G1 X148.629 Y99.38 Z2.8
G1 Z2.5
G1 E.8 F1800
G1 F2565
M204 S5000
G1 X148.559 Y98.936 E.0073
G1 X148.559 Y86.217 E.20653
G1 X148.629 Y85.773 E.0073
G1 X148.841 Y85.357 E.00758
G1 X148.995 Y85.203 E.00354
G1 X149.171 Y85.027 E.00403
G1 X149.586 Y84.815 E.00758
G1 X150.031 Y84.745 E.0073
G1 X162.749 Y84.745 E.20653
G1 X163.194 Y84.815 E.0073
G1 X163.609 Y85.027 E.00758
G1 X163.939 Y85.357 E.00758
G1 X164.151 Y85.773 E.00758
G1 X164.222 Y86.217 E.0073
G1 X164.222 Y98.936 E.20653
G1 X164.151 Y99.38 E.0073
G1 X163.939 Y99.796 E.00758
G1 X163.609 Y100.126 E.00758
G1 X163.194 Y100.338 E.00758
G1 X162.749 Y100.408 E.0073
G1 X150.031 Y100.408 E.20653
G1 X149.586 Y100.338 E.0073
G1 X149.171 Y100.126 E.00758
G1 X148.841 Y99.796 E.00758
G1 X148.656 Y99.434 E.0066
; WIPE_START
G1 F3600
M204 S6000
G1 X148.559 Y98.936 E-.19275
G1 X148.559 Y97.443 E-.56725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.29 Y92.403 Z2.9 F42000
G1 X163.556 Y84.254 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F2565
M204 S5000
G1 X163.562 Y84.255 E.00011
G1 X163.676 Y84.273 E.00186
G1 X164.118 Y84.498 E.00805
G1 X164.468 Y84.849 E.00805
G1 X164.693 Y85.291 E.00805
G1 X164.773 Y85.815 E.00862
G1 X164.773 Y99.338 E.21957
G1 X164.693 Y99.862 E.00862
G1 X164.468 Y100.304 E.00805
G1 X164.118 Y100.654 E.00805
G1 X163.676 Y100.88 E.00805
G1 X163.151 Y100.96 E.00862
G1 X149.629 Y100.96 E.21957
G1 X149.104 Y100.88 E.00862
G1 X148.663 Y100.654 E.00805
G1 X148.312 Y100.304 E.00805
G1 X148.087 Y99.862 E.00805
G1 X148.007 Y99.338 E.00862
G1 X148.007 Y85.815 E.21957
G1 X148.087 Y85.291 E.00862
G1 X148.312 Y84.849 E.00805
G1 X148.663 Y84.498 E.00805
G1 X149.104 Y84.273 E.00805
G1 X149.629 Y84.193 E.00862
G1 X163.151 Y84.193 E.21957
G1 X163.497 Y84.245 E.00567
; WIPE_START
G1 F3600
M204 S6000
G1 X163.562 Y84.255 E-.02532
G1 X163.676 Y84.273 E-.04359
G1 X164.118 Y84.498 E-.18842
G1 X164.468 Y84.849 E-.1884
G1 X164.693 Y85.291 E-.1884
G1 X164.743 Y85.618 E-.12588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 25 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer25 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.44 Y85.662 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.211135
G1 F2565
M204 S6000
G3 X164.483 Y86.006 I-2.024 J.423 E.00268
; LINE_WIDTH: 0.175126
G1 X164.497 Y86.19 E.00116
; LINE_WIDTH: 0.15997
G1 X164.497 Y98.952 E.07202
G1 X164.483 Y99.147 E.00111
; LINE_WIDTH: 0.204146
G1 X164.468 Y99.332 E.00138
; LINE_WIDTH: 0.231094
G3 X164.398 Y99.622 I-1.059 J-.103 E.00255
; LINE_WIDTH: 0.288152
G1 X164.355 Y99.752 E.00149
; LINE_WIDTH: 0.326859
G3 X164.168 Y100.086 I-1.342 J-.535 E.00477
G1 X163.899 Y100.354 E.00472
G3 X163.798 Y100.423 I-.494 J-.615 E.00153
; LINE_WIDTH: 0.302245
G3 X163.435 Y100.584 I-.689 J-1.065 E.00456
; LINE_WIDTH: 0.245134
G1 X163.304 Y100.627 E.00125
; LINE_WIDTH: 0.211135
G3 X162.961 Y100.669 I-.423 J-2.024 E.00268
; LINE_WIDTH: 0.175126
G1 X162.777 Y100.683 E.00116
; LINE_WIDTH: 0.15997
G1 X150.014 Y100.684 E.07202
G1 X149.819 Y100.669 E.00111
; LINE_WIDTH: 0.204146
G1 X149.635 Y100.654 E.00138
; LINE_WIDTH: 0.231094
G3 X149.345 Y100.584 I.103 J-1.059 E.00255
; LINE_WIDTH: 0.288152
G1 X149.214 Y100.542 E.00149
; LINE_WIDTH: 0.326859
G3 X148.881 Y100.354 I.535 J-1.342 E.00477
G1 X148.612 Y100.086 E.00472
G3 X148.543 Y99.984 I.615 J-.494 E.00153
; LINE_WIDTH: 0.302245
G3 X148.382 Y99.622 I1.065 J-.689 E.00456
; LINE_WIDTH: 0.245134
G1 X148.34 Y99.491 E.00125
; LINE_WIDTH: 0.211135
G3 X148.298 Y99.147 I2.024 J-.423 E.00268
; LINE_WIDTH: 0.175126
G1 X148.283 Y98.963 E.00116
; LINE_WIDTH: 0.159751
G1 X148.283 Y86.19 E.07197
; LINE_WIDTH: 0.175115
G1 X148.298 Y86.006 E.00116
; LINE_WIDTH: 0.204146
G1 X148.312 Y85.821 E.00138
; LINE_WIDTH: 0.231094
G3 X148.382 Y85.531 I1.059 J.103 E.00255
; LINE_WIDTH: 0.288152
G1 X148.425 Y85.401 E.00149
; LINE_WIDTH: 0.326863
G3 X148.612 Y85.067 I1.342 J.535 E.00477
G1 X148.881 Y84.799 E.00472
G3 X148.982 Y84.729 I.493 J.613 E.00153
; LINE_WIDTH: 0.302258
G3 X149.345 Y84.569 I.689 J1.065 E.00456
; LINE_WIDTH: 0.245134
G1 X149.476 Y84.526 E.00125
; LINE_WIDTH: 0.211135
G3 X149.819 Y84.484 I.423 J2.024 E.00268
; LINE_WIDTH: 0.175126
G1 X150.004 Y84.47 E.00116
; LINE_WIDTH: 0.15997
G1 X162.766 Y84.469 E.07202
G1 X162.961 Y84.484 E.00111
; LINE_WIDTH: 0.204146
G1 X163.145 Y84.499 E.00138
; LINE_WIDTH: 0.227665
G3 X163.407 Y84.56 I-.088 J.967 E.00226
; LINE_WIDTH: 0.274117
G1 X163.509 Y84.593 E.00111
; LINE_WIDTH: 0.300307
G1 X163.566 Y84.611 E.00068
; LINE_WIDTH: 0.326859
G3 X163.899 Y84.799 I-.535 J1.342 E.00477
G1 X164.168 Y85.067 E.00472
G3 X164.237 Y85.169 I-.613 J.493 E.00153
; LINE_WIDTH: 0.302245
G3 X164.398 Y85.531 I-1.065 J.689 E.00456
; LINE_WIDTH: 0.245129
G1 X164.422 Y85.605 E.00071
; WIPE_START
G1 F15000
G1 X164.483 Y86.006 E-.15389
G1 X164.497 Y86.19 E-.07028
G1 X164.497 Y87.6 E-.53583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.389 Y90.38 Z2.9 F42000
G1 X155.092 Y91.278 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2565
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.343 J2.593 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2565
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2565
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17438
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F2565
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F2565
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.78 Y93.241 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2565
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06978
G3 X156.352 Y89.888 I.671 J3.288 E.00917
G3 X153.795 Y93.299 I.032 J2.688 E.1943
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12471
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.0239
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 26/72
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.9 I-1.01 J-.679 P1  F42000
M73 P77 R5
G1 X148.587 Y99.407 Z2.9
G1 Z2.6
G1 E.8 F1800
G1 F2575
M204 S5000
G1 X148.516 Y98.955 E.00743
G1 X148.516 Y86.198 E.20714
G1 X148.587 Y85.746 E.00743
G1 X148.803 Y85.324 E.0077
G1 X149.138 Y84.989 E.0077
G1 X149.56 Y84.774 E.0077
G1 X150.012 Y84.702 E.00743
G1 X162.769 Y84.702 E.20714
G1 X163.22 Y84.774 E.00743
G1 X163.643 Y84.989 E.0077
G1 X163.978 Y85.324 E.0077
G1 X164.193 Y85.746 E.0077
G1 X164.264 Y86.198 E.00743
G1 X164.264 Y98.955 E.20714
G1 X164.193 Y99.407 E.00743
G1 X163.978 Y99.829 E.0077
G1 X163.643 Y100.164 E.0077
G1 X163.22 Y100.379 E.0077
G1 X162.769 Y100.451 E.00743
G1 X150.012 Y100.451 E.20714
G1 X149.56 Y100.379 E.00743
G1 X149.138 Y100.164 E.0077
G1 X148.803 Y99.829 E.0077
G1 X148.615 Y99.46 E.00672
; WIPE_START
G1 F3600
M204 S6000
G1 X148.516 Y98.955 E-.19558
G1 X148.516 Y97.47 E-.56442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.249 Y92.432 Z3 F42000
G1 X163.599 Y84.217 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2575
M204 S5000
G1 X163.603 Y84.218 E.00008
G1 X163.705 Y84.234 E.00167
G1 X164.151 Y84.461 E.00813
G1 X164.506 Y84.815 E.00813
G1 X164.733 Y85.261 E.00813
G1 X164.814 Y85.791 E.0087
G1 X164.814 Y99.362 E.22036
G1 X164.733 Y99.891 E.0087
G1 X164.506 Y100.338 E.00813
G1 X164.151 Y100.692 E.00813
G1 X163.705 Y100.919 E.00813
G1 X163.176 Y101 E.0087
G1 X149.605 Y101 E.22036
G1 X149.075 Y100.919 E.0087
G1 X148.629 Y100.692 E.00813
G1 X148.275 Y100.338 E.00813
G1 X148.047 Y99.891 E.00813
G1 X147.966 Y99.362 E.0087
G1 X147.966 Y85.791 E.22036
G1 X148.047 Y85.261 E.0087
G1 X148.275 Y84.815 E.00813
G1 X148.629 Y84.461 E.00813
G1 X149.075 Y84.234 E.00813
G1 X149.605 Y84.153 E.0087
G1 X163.176 Y84.153 E.22036
G1 X163.539 Y84.208 E.00597
; WIPE_START
G1 F3600
M204 S6000
G1 X163.603 Y84.218 E-.02465
G1 X163.705 Y84.234 E-.03909
G1 X164.151 Y84.461 E-.19034
G1 X164.506 Y84.815 E-.19032
G1 X164.733 Y85.261 E-.19033
G1 X164.783 Y85.587 E-.12527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 26 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer26 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.481 Y85.636 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.209535
G1 F2575
M204 S6000
G3 X164.524 Y85.984 I-2.059 J.429 E.00269
; LINE_WIDTH: 0.172998
G1 X164.539 Y86.171 E.00116
; LINE_WIDTH: 0.157656
G1 X164.539 Y98.971 E.07103
G1 X164.524 Y99.169 E.0011
; LINE_WIDTH: 0.202471
G1 X164.509 Y99.356 E.00138
; LINE_WIDTH: 0.229759
G3 X164.438 Y99.649 I-1.069 J-.104 E.00257
; LINE_WIDTH: 0.287493
G1 X164.395 Y99.782 E.00151
; LINE_WIDTH: 0.326653
G3 X164.205 Y100.12 I-1.357 J-.541 E.00483
G1 X163.933 Y100.392 E.00478
G3 X163.831 Y100.462 I-.498 J-.619 E.00154
; LINE_WIDTH: 0.301758
G3 X163.463 Y100.625 I-.699 J-1.08 E.00462
; LINE_WIDTH: 0.243903
G1 X163.33 Y100.668 E.00126
; LINE_WIDTH: 0.209535
G3 X162.983 Y100.71 I-.429 J-2.059 E.00269
; LINE_WIDTH: 0.172998
G1 X162.796 Y100.725 E.00116
; LINE_WIDTH: 0.157656
G1 X149.995 Y100.726 E.07103
G1 X149.798 Y100.71 E.0011
; LINE_WIDTH: 0.202471
G1 X149.61 Y100.696 E.00138
; LINE_WIDTH: 0.229759
G3 X149.317 Y100.625 I.104 J-1.069 E.00257
; LINE_WIDTH: 0.287493
G1 X149.185 Y100.582 E.00151
; LINE_WIDTH: 0.326653
G3 X148.847 Y100.392 I.541 J-1.357 E.00483
G1 X148.575 Y100.12 E.00478
G3 X148.505 Y100.017 I.619 J-.498 E.00154
; LINE_WIDTH: 0.301758
G3 X148.342 Y99.649 I1.08 J-.699 E.00462
; LINE_WIDTH: 0.243903
G1 X148.299 Y99.517 E.00126
; LINE_WIDTH: 0.209535
G3 X148.256 Y99.169 I2.059 J-.429 E.00269
; LINE_WIDTH: 0.172998
G1 X148.242 Y98.982 E.00116
; LINE_WIDTH: 0.157431
G1 X148.242 Y86.171 E.07097
; LINE_WIDTH: 0.17301
G1 X148.256 Y85.984 E.00116
; LINE_WIDTH: 0.202471
G1 X148.271 Y85.797 E.00138
; LINE_WIDTH: 0.229759
G3 X148.342 Y85.504 I1.069 J.104 E.00257
; LINE_WIDTH: 0.287493
G1 X148.385 Y85.371 E.00151
; LINE_WIDTH: 0.326653
G3 X148.575 Y85.033 I1.357 J.541 E.00483
G1 X148.847 Y84.761 E.00478
G3 X148.949 Y84.691 I.498 J.619 E.00154
; LINE_WIDTH: 0.301758
G3 X149.317 Y84.528 I.699 J1.08 E.00462
; LINE_WIDTH: 0.243903
G1 X149.45 Y84.485 E.00126
; LINE_WIDTH: 0.209535
G3 X149.798 Y84.443 I.429 J2.059 E.00269
; LINE_WIDTH: 0.172998
G1 X149.985 Y84.428 E.00116
; LINE_WIDTH: 0.157656
G1 X162.785 Y84.427 E.07103
G1 X162.983 Y84.443 E.0011
; LINE_WIDTH: 0.202471
G1 X163.17 Y84.457 E.00138
; LINE_WIDTH: 0.22699
G3 X163.44 Y84.521 I-.091 J.994 E.00233
; LINE_WIDTH: 0.276249
G1 X163.55 Y84.557 E.0012
; LINE_WIDTH: 0.325393
G3 X163.933 Y84.761 I-.962 J2.264 E.00539
G1 X164.205 Y85.033 E.00476
G3 X164.275 Y85.136 I-.619 J.498 E.00154
; LINE_WIDTH: 0.301752
G3 X164.438 Y85.504 I-1.08 J.699 E.00462
; LINE_WIDTH: 0.243903
G1 X164.463 Y85.579 E.00072
; WIPE_START
G1 F15000
G1 X164.524 Y85.984 E-.15559
G1 X164.539 Y86.171 E-.07133
G1 X164.539 Y87.574 E-.53308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.433 Y90.36 Z3 F42000
G1 X155.092 Y91.278 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2575
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.341 J2.591 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2575
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2575
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00677
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14984
G1 X158.286 Y91.278 E-.17433
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2575
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2575
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.779 Y93.241 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2575
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06979
G3 X156.357 Y89.888 I.661 J3.217 E.00926
G3 X153.794 Y93.299 I.026 J2.688 E.19419
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12473
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.656 E-.10195
G1 X153.967 Y91.409 E-.10182
G1 X153.997 Y91.354 E-.02392
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 27/72
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-1.008 J-.682 P1  F42000
G1 X148.543 Y99.418 Z3
G1 Z2.7
G1 E.8 F1800
G1 F2585
M204 S5000
G1 X148.473 Y98.974 E.00731
G1 X148.473 Y86.179 E.20776
G1 X148.546 Y85.72 E.00755
G1 X148.764 Y85.291 E.00782
G1 X149.105 Y84.951 E.00782
G1 X149.534 Y84.732 E.00782
G1 X149.993 Y84.659 E.00755
G1 X162.788 Y84.659 E.20776
G1 X163.247 Y84.732 E.00755
G1 X163.676 Y84.951 E.00782
G1 X164.016 Y85.291 E.00782
G1 X164.235 Y85.72 E.00782
G1 X164.307 Y86.179 E.00755
G1 X164.307 Y98.974 E.20776
G1 X164.235 Y99.433 E.00755
G1 X164.016 Y99.862 E.00782
G1 X163.676 Y100.202 E.00782
G1 X163.247 Y100.421 E.00782
G1 X162.788 Y100.494 E.00755
G1 X149.993 Y100.494 E.20776
G1 X149.534 Y100.421 E.00755
G1 X149.105 Y100.202 E.00782
G1 X148.764 Y99.862 E.00782
G1 X148.566 Y99.473 E.00708
; WIPE_START
G1 F3600
M204 S6000
G1 X148.473 Y98.974 E-.19301
G1 X148.473 Y97.482 E-.567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.211 Y92.449 Z3.1 F42000
G1 X163.642 Y84.179 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F2585
M204 S5000
G1 X163.644 Y84.18 E.00005
G1 X163.734 Y84.194 E.00148
G1 X164.185 Y84.424 E.00822
G1 X164.543 Y84.781 E.00822
G1 X164.773 Y85.232 E.00822
G1 X164.854 Y85.767 E.00878
G1 X164.854 Y99.386 E.22115
G1 X164.773 Y99.921 E.00878
G1 X164.543 Y100.372 E.00822
G1 X164.185 Y100.729 E.00822
G1 X163.734 Y100.959 E.00822
G1 X163.2 Y101.041 E.00878
G1 X149.58 Y101.041 E.22115
G1 X149.046 Y100.959 E.00878
G1 X148.595 Y100.729 E.00822
G1 X148.237 Y100.372 E.00822
G1 X148.008 Y99.921 E.00822
G1 X147.926 Y99.386 E.00878
G1 X147.926 Y85.767 E.22115
G1 X148.008 Y85.232 E.00878
G1 X148.237 Y84.781 E.00822
G1 X148.595 Y84.424 E.00822
G1 X149.046 Y84.194 E.00822
G1 X149.58 Y84.112 E.00878
G1 X163.2 Y84.112 E.22115
G1 X163.582 Y84.17 E.00628
; WIPE_START
G1 F3600
M204 S6000
G1 X163.644 Y84.18 E-.02387
G1 X163.734 Y84.194 E-.03461
G1 X164.185 Y84.424 E-.19225
G1 X164.543 Y84.781 E-.19227
G1 X164.773 Y85.232 E-.19226
G1 X164.822 Y85.557 E-.12475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 27 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer27 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.522 Y85.61 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.207939
G1 F2585
M204 S6000
G3 X164.566 Y85.962 I-2.095 J.435 E.0027
; LINE_WIDTH: 0.170902
G1 X164.58 Y86.152 E.00116
; LINE_WIDTH: 0.155351
G1 X164.581 Y98.99 E.07003
G1 X164.566 Y99.191 E.0011
; LINE_WIDTH: 0.200777
G1 X164.551 Y99.381 E.00139
; LINE_WIDTH: 0.228402
G3 X164.479 Y99.677 I-1.078 J-.104 E.00258
; LINE_WIDTH: 0.286801
G1 X164.435 Y99.811 E.00153
; LINE_WIDTH: 0.326452
G3 X164.243 Y100.153 I-1.371 J-.545 E.00489
G1 X163.967 Y100.429 E.00484
G3 X163.864 Y100.5 I-.504 J-.626 E.00156
; LINE_WIDTH: 0.301269
G3 X163.491 Y100.665 I-.709 J-1.095 E.00467
; LINE_WIDTH: 0.242673
G1 X163.356 Y100.709 E.00127
; LINE_WIDTH: 0.207939
G3 X163.004 Y100.752 I-.435 J-2.095 E.0027
; LINE_WIDTH: 0.170902
G1 X162.814 Y100.767 E.00116
; LINE_WIDTH: 0.155351
G1 X149.976 Y100.767 E.07003
G1 X149.776 Y100.752 E.0011
; LINE_WIDTH: 0.200777
G1 X149.586 Y100.737 E.00139
; LINE_WIDTH: 0.228402
G3 X149.29 Y100.665 I.104 J-1.078 E.00258
; LINE_WIDTH: 0.286801
G1 X149.155 Y100.622 E.00153
; LINE_WIDTH: 0.326452
G3 X148.813 Y100.429 I.545 J-1.371 E.00489
G1 X148.538 Y100.154 E.00484
G3 X148.467 Y100.05 I.626 J-.504 E.00156
; LINE_WIDTH: 0.301269
G3 X148.301 Y99.677 I1.095 J-.709 E.00467
; LINE_WIDTH: 0.242673
G1 X148.258 Y99.543 E.00127
; LINE_WIDTH: 0.207939
G3 X148.215 Y99.191 I2.095 J-.435 E.0027
; LINE_WIDTH: 0.170902
G1 X148.2 Y99.001 E.00116
; LINE_WIDTH: 0.155121
G1 X148.2 Y86.152 E.06997
; LINE_WIDTH: 0.170886
G1 X148.215 Y85.962 E.00116
; LINE_WIDTH: 0.200779
G1 X148.23 Y85.772 E.00139
; LINE_WIDTH: 0.228403
G3 X148.301 Y85.476 I1.078 J.104 E.00258
; LINE_WIDTH: 0.286802
G1 X148.345 Y85.342 E.00153
; LINE_WIDTH: 0.326452
G3 X148.537 Y84.999 I1.371 J.545 E.00489
G1 X148.813 Y84.724 E.00484
G3 X148.916 Y84.653 I.504 J.626 E.00156
; LINE_WIDTH: 0.301269
G3 X149.29 Y84.488 I.709 J1.095 E.00467
; LINE_WIDTH: 0.242673
G1 X149.424 Y84.444 E.00127
; LINE_WIDTH: 0.207939
G3 X149.776 Y84.401 I.435 J2.095 E.0027
; LINE_WIDTH: 0.170902
G1 X149.966 Y84.386 E.00116
; LINE_WIDTH: 0.155351
G1 X162.804 Y84.386 E.07003
G1 X163.004 Y84.401 E.0011
; LINE_WIDTH: 0.200779
G1 X163.194 Y84.416 E.00139
; LINE_WIDTH: 0.22631
G3 X163.474 Y84.482 I-.095 J1.022 E.0024
; LINE_WIDTH: 0.278362
G1 X163.591 Y84.52 E.00129
; LINE_WIDTH: 0.325567
G3 X163.967 Y84.724 I-1.077 J2.442 E.00531
G1 X164.243 Y84.999 E.00483
G3 X164.313 Y85.103 I-.622 J.501 E.00155
; LINE_WIDTH: 0.301273
G3 X164.479 Y85.476 I-1.096 J.709 E.00467
; LINE_WIDTH: 0.242678
G1 X164.504 Y85.553 E.00073
; WIPE_START
G1 F15000
G1 X164.566 Y85.962 E-.15729
G1 X164.58 Y86.152 E-.07239
G1 X164.58 Y87.548 E-.53033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.477 Y90.34 Z3.1 F42000
G1 X155.092 Y91.278 Z3.1
G1 Z2.7
M73 P78 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2585
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.335 J2.585 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2585
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2585
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2585
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2585
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20278
G1 X154.55 Y93.922 E-.10423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2585
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.0698
G3 X156.362 Y89.889 I.652 J3.16 E.00934
G3 X153.794 Y93.299 I.02 J2.688 E.19409
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12474
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10187
G1 X153.863 Y91.656 E-.10198
G1 X153.967 Y91.409 E-.10183
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 28/72
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.1 I-1.006 J-.685 P1  F42000
G1 X148.498 Y99.422 Z3.1
G1 Z2.8
G1 E.8 F1800
G1 F2595
M204 S5000
G1 X148.43 Y98.993 E.00705
G1 X148.43 Y86.16 E.20838
G1 X148.504 Y85.694 E.00767
G1 X148.726 Y85.258 E.00794
G1 X149.072 Y84.912 E.00794
G1 X149.507 Y84.69 E.00794
G1 X149.974 Y84.616 E.00767
G1 X162.807 Y84.616 E.20838
G1 X163.273 Y84.69 E.00767
G1 X163.709 Y84.912 E.00794
G1 X164.054 Y85.258 E.00794
G1 X164.276 Y85.694 E.00794
G1 X164.35 Y86.16 E.00767
G1 X164.35 Y98.993 E.20838
G1 X164.276 Y99.459 E.00767
G1 X164.054 Y99.895 E.00794
G1 X163.709 Y100.241 E.00794
G1 X163.273 Y100.463 E.00794
G1 X162.807 Y100.536 E.00767
G1 X149.974 Y100.536 E.20838
G1 X149.507 Y100.463 E.00767
G1 X149.072 Y100.241 E.00794
G1 X148.726 Y99.895 E.00794
G1 X148.514 Y99.479 E.00759
; WIPE_START
G1 F3600
M204 S6000
G1 X148.43 Y98.993 E-.18729
G1 X148.43 Y97.486 E-.57271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.175 Y92.461 Z3.2 F42000
G1 X163.685 Y84.142 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F2595
M204 S5000
G1 X163.686 Y84.142 E.00001
G1 X163.764 Y84.154 E.00129
G1 X164.219 Y84.386 E.0083
G1 X164.58 Y84.747 E.0083
G1 X164.812 Y85.203 E.0083
G1 X164.895 Y85.742 E.00886
G1 X164.895 Y99.411 E.22194
G1 X164.812 Y99.95 E.00886
G1 X164.58 Y100.405 E.0083
G1 X164.219 Y100.767 E.0083
G1 X163.764 Y100.999 E.0083
G1 X163.224 Y101.081 E.00886
G1 X149.556 Y101.081 E.22194
G1 X149.016 Y100.999 E.00886
G1 X148.561 Y100.767 E.0083
G1 X148.2 Y100.405 E.0083
G1 X147.968 Y99.95 E.0083
G1 X147.885 Y99.41 E.00886
G1 X147.885 Y85.742 E.22194
G1 X147.968 Y85.203 E.00886
G1 X148.2 Y84.747 E.0083
G1 X148.561 Y84.386 E.0083
G1 X149.016 Y84.154 E.0083
G1 X149.556 Y84.072 E.00886
G1 X163.224 Y84.072 E.22194
G1 X163.625 Y84.133 E.00659
; WIPE_START
G1 F3600
M204 S6000
G1 X163.686 Y84.142 E-.02312
G1 X163.764 Y84.154 E-.0301
G1 X164.219 Y84.386 E-.19419
G1 X164.58 Y84.747 E-.19418
G1 X164.812 Y85.203 E-.19419
G1 X164.862 Y85.526 E-.12423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 28 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer28 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.563 Y85.584 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20634
G1 F2595
M204 S6000
G3 X164.607 Y85.941 I-2.129 J.441 E.00271
; LINE_WIDTH: 0.168791
G1 X164.622 Y86.133 E.00116
; LINE_WIDTH: 0.153047
G1 X164.623 Y99.009 E.06903
G1 X164.607 Y99.212 E.00109
; LINE_WIDTH: 0.199111
G1 X164.592 Y99.405 E.0014
; LINE_WIDTH: 0.227062
G3 X164.519 Y99.705 I-1.089 J-.105 E.00259
; LINE_WIDTH: 0.286126
G1 X164.475 Y99.841 E.00154
; LINE_WIDTH: 0.326244
G3 X164.28 Y100.187 I-1.386 J-.551 E.00496
G1 X164.001 Y100.467 E.0049
G3 X163.897 Y100.538 I-.507 J-.63 E.00157
; LINE_WIDTH: 0.300782
G3 X163.518 Y100.706 I-.719 J-1.111 E.00473
; LINE_WIDTH: 0.241447
G1 X163.383 Y100.75 E.00128
; LINE_WIDTH: 0.20634
G3 X163.026 Y100.793 I-.441 J-2.129 E.00271
; LINE_WIDTH: 0.168791
G1 X162.833 Y100.809 E.00116
; LINE_WIDTH: 0.153047
G1 X149.957 Y100.809 E.06903
G1 X149.754 Y100.793 E.00109
; LINE_WIDTH: 0.199111
G1 X149.562 Y100.778 E.0014
; LINE_WIDTH: 0.227062
G3 X149.262 Y100.706 I.105 J-1.089 E.00259
; LINE_WIDTH: 0.286126
G1 X149.126 Y100.661 E.00154
; LINE_WIDTH: 0.326244
G3 X148.779 Y100.467 I.551 J-1.386 E.00496
G1 X148.5 Y100.187 E.0049
G3 X148.429 Y100.083 I.63 J-.508 E.00157
; LINE_WIDTH: 0.300782
G3 X148.261 Y99.705 I1.111 J-.719 E.00473
; LINE_WIDTH: 0.241447
G1 X148.217 Y99.569 E.00128
; LINE_WIDTH: 0.20634
G3 X148.173 Y99.212 I2.129 J-.441 E.00271
; LINE_WIDTH: 0.168791
G1 X148.158 Y99.02 E.00116
; LINE_WIDTH: 0.152811
G1 X148.158 Y86.133 E.06896
; LINE_WIDTH: 0.168784
G1 X148.173 Y85.941 E.00116
; LINE_WIDTH: 0.199111
G1 X148.188 Y85.748 E.0014
; LINE_WIDTH: 0.227062
G3 X148.261 Y85.448 I1.089 J.105 E.00259
; LINE_WIDTH: 0.286126
G1 X148.305 Y85.312 E.00154
; LINE_WIDTH: 0.326244
G3 X148.5 Y84.966 I1.386 J.551 E.00496
G1 X148.779 Y84.686 E.0049
G3 X148.883 Y84.615 I.507 J.63 E.00157
; LINE_WIDTH: 0.300782
G3 X149.262 Y84.447 I.719 J1.111 E.00473
; LINE_WIDTH: 0.241447
G1 X149.398 Y84.403 E.00128
; LINE_WIDTH: 0.20634
G3 X149.754 Y84.36 I.441 J2.129 E.00271
; LINE_WIDTH: 0.168791
G1 X149.947 Y84.344 E.00116
; LINE_WIDTH: 0.153047
G1 X162.823 Y84.344 E.06903
G1 X163.026 Y84.36 E.00109
; LINE_WIDTH: 0.199102
G1 X163.219 Y84.375 E.0014
; LINE_WIDTH: 0.225649
G3 X163.507 Y84.444 I-.099 J1.051 E.00247
; LINE_WIDTH: 0.280485
G1 X163.631 Y84.484 E.00138
; LINE_WIDTH: 0.325693
G3 X164.001 Y84.686 I-1.237 J2.698 E.00523
G1 X164.28 Y84.966 E.00489
G3 X164.352 Y85.07 I-.63 J.508 E.00157
; LINE_WIDTH: 0.300782
G3 X164.519 Y85.448 I-1.111 J.719 E.00473
; LINE_WIDTH: 0.241447
G1 X164.545 Y85.527 E.00074
; WIPE_START
G1 F15000
G1 X164.607 Y85.941 E-.15898
G1 X164.622 Y86.133 E-.07343
G1 X164.622 Y87.522 E-.52759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.521 Y90.32 Z3.2 F42000
G1 X155.092 Y91.278 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2595
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2595
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
M73 P78 R4
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2595
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14981
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2595
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2595
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2595
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06982
G3 X156.368 Y89.889 I.645 J3.108 E.00943
G3 X153.793 Y93.3 I.014 J2.688 E.19399
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.657 E-.10191
M73 P79 R4
G1 X153.967 Y91.409 E-.10191
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 29/72
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-1.003 J-.689 P1  F42000
G1 X148.453 Y99.425 Z3.2
G1 Z2.9
G1 E.8 F1800
G1 F2604
M204 S5000
G1 X148.387 Y99.012 E.00679
G1 X148.387 Y86.141 E.209
G1 X148.462 Y85.667 E.00779
G1 X148.688 Y85.225 E.00806
G1 X148.912 Y85.001 E.00514
G1 X149.039 Y84.874 E.00292
G1 X149.481 Y84.649 E.00806
G1 X149.955 Y84.574 E.00779
G1 X162.826 Y84.574 E.209
G1 X163.299 Y84.649 E.00779
G1 X163.742 Y84.874 E.00806
G1 X164.093 Y85.225 E.00806
G1 X164.318 Y85.667 E.00806
G1 X164.393 Y86.141 E.00779
G1 X164.393 Y99.012 E.209
G1 X164.318 Y99.486 E.00779
G1 X164.093 Y99.928 E.00806
G1 X163.742 Y100.279 E.00806
G1 X163.299 Y100.504 E.00806
G1 X162.826 Y100.579 E.00779
G1 X149.955 Y100.579 E.209
G1 X149.481 Y100.504 E.00779
G1 X149.039 Y100.279 E.00806
G1 X148.688 Y99.928 E.00806
G1 X148.462 Y99.486 E.00806
G1 X148.462 Y99.484 E.00003
; WIPE_START
G1 F3600
M204 S6000
G1 X148.387 Y99.012 E-.18161
G1 X148.387 Y97.49 E-.57839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.138 Y92.472 Z3.3 F42000
G1 X163.727 Y84.104 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F2604
M204 S5000
G1 X163.727 Y84.104 E.00001
G1 X163.793 Y84.114 E.00108
G1 X164.253 Y84.349 E.00838
G1 X164.618 Y84.714 E.00838
G1 X164.852 Y85.173 E.00838
G1 X164.936 Y85.718 E.00895
G1 X164.936 Y99.435 E.22273
G1 X164.852 Y99.979 E.00895
G1 X164.618 Y100.439 E.00838
G1 X164.253 Y100.804 E.00838
G1 X163.793 Y101.039 E.00838
G1 X163.249 Y101.122 E.00895
G1 X149.532 Y101.122 E.22273
G1 X148.987 Y101.039 E.00895
G1 X148.527 Y100.804 E.00838
G1 X148.162 Y100.439 E.00838
G1 X147.928 Y99.979 E.00838
G1 X147.845 Y99.435 E.00895
G1 X147.845 Y85.718 E.22273
G1 X147.928 Y85.173 E.00895
G1 X148.162 Y84.714 E.00838
G1 X148.527 Y84.349 E.00838
G1 X148.987 Y84.114 E.00838
G1 X149.532 Y84.031 E.00895
G1 X163.249 Y84.031 E.22273
G1 X163.667 Y84.095 E.00688
; WIPE_START
G1 F3600
M204 S6000
G1 X163.727 Y84.104 E-.02313
G1 X163.793 Y84.114 E-.02525
G1 X164.253 Y84.349 E-.19612
G1 X164.618 Y84.714 E-.19612
G1 X164.852 Y85.173 E-.19611
G1 X164.901 Y85.494 E-.12327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 29 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer29 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.604 Y85.558 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.204737
G1 F2604
M204 S6000
G3 X164.648 Y85.919 I-2.165 J.447 E.00272
; LINE_WIDTH: 0.16668
G1 X164.664 Y86.114 E.00116
; LINE_WIDTH: 0.150732
G1 X164.664 Y99.028 E.06802
G1 X164.648 Y99.234 E.00109
; LINE_WIDTH: 0.197425
G1 X164.633 Y99.429 E.00141
; LINE_WIDTH: 0.213251
G3 X164.604 Y99.595 I-1.061 J-.098 E.00132
; LINE_WIDTH: 0.240217
G1 X164.56 Y99.732 E.00129
; LINE_WIDTH: 0.285451
G1 X164.515 Y99.87 E.00155
; LINE_WIDTH: 0.326037
G3 X164.318 Y100.221 I-1.402 J-.557 E.00502
G1 X164.035 Y100.504 E.00496
G3 X163.93 Y100.576 I-.513 J-.637 E.00158
; LINE_WIDTH: 0.300295
G3 X163.546 Y100.746 I-.729 J-1.127 E.00479
; LINE_WIDTH: 0.240235
G1 X163.409 Y100.791 E.00129
; LINE_WIDTH: 0.204737
G3 X163.048 Y100.835 I-.448 J-2.168 E.00272
; LINE_WIDTH: 0.16668
G1 X162.852 Y100.85 E.00116
; LINE_WIDTH: 0.150732
G1 X149.938 Y100.851 E.06802
G1 X149.733 Y100.835 E.00109
; LINE_WIDTH: 0.197425
G1 X149.537 Y100.819 E.00141
; LINE_WIDTH: 0.213251
G3 X149.372 Y100.791 I.098 J-1.061 E.00132
; LINE_WIDTH: 0.240217
G1 X149.234 Y100.746 E.00129
; LINE_WIDTH: 0.285451
G1 X149.097 Y100.701 E.00155
; LINE_WIDTH: 0.326037
G3 X148.745 Y100.504 I.557 J-1.402 E.00502
G1 X148.463 Y100.221 E.00496
G3 X148.391 Y100.116 I.637 J-.513 E.00158
; LINE_WIDTH: 0.300295
G3 X148.22 Y99.732 I1.127 J-.729 E.00479
; LINE_WIDTH: 0.240235
G1 X148.176 Y99.595 E.00129
; LINE_WIDTH: 0.204737
G3 X148.132 Y99.234 I2.168 J-.448 E.00272
; LINE_WIDTH: 0.16668
G1 X148.116 Y99.038 E.00116
; LINE_WIDTH: 0.150491
G1 X148.116 Y86.114 E.06794
; LINE_WIDTH: 0.166662
G1 X148.132 Y85.919 E.00116
; LINE_WIDTH: 0.197425
G1 X148.147 Y85.724 E.00141
; LINE_WIDTH: 0.213251
G3 X148.176 Y85.558 I1.061 J.098 E.00132
; LINE_WIDTH: 0.240217
G1 X148.22 Y85.42 E.00129
; LINE_WIDTH: 0.285451
G1 X148.265 Y85.283 E.00155
; LINE_WIDTH: 0.326038
G1 X148.391 Y85.037 E.00343
G3 X148.85 Y84.577 I1.746 J1.286 E.0081
; LINE_WIDTH: 0.300298
G3 X149.234 Y84.407 I.729 J1.126 E.00479
; LINE_WIDTH: 0.240222
G1 X149.372 Y84.362 E.00129
; LINE_WIDTH: 0.204738
G3 X149.733 Y84.318 I.447 J2.166 E.00272
; LINE_WIDTH: 0.16668
G1 X149.928 Y84.303 E.00116
; LINE_WIDTH: 0.150732
G1 X162.842 Y84.302 E.06802
G1 X163.048 Y84.318 E.00109
; LINE_WIDTH: 0.19743
G1 X163.243 Y84.333 E.00141
; LINE_WIDTH: 0.225009
G3 X163.54 Y84.405 I-.102 J1.08 E.00255
; LINE_WIDTH: 0.282623
G1 X163.672 Y84.448 E.00147
; LINE_WIDTH: 0.325783
G3 X164.035 Y84.649 I-1.471 J3.081 E.00515
G1 X164.318 Y84.932 E.00496
G3 X164.39 Y85.037 I-.636 J.513 E.00158
; LINE_WIDTH: 0.300288
G3 X164.56 Y85.42 I-1.126 J.729 E.00479
; LINE_WIDTH: 0.240209
G1 X164.586 Y85.501 E.00075
; WIPE_START
G1 F15000
G1 X164.648 Y85.919 E-.16068
G1 X164.664 Y86.114 E-.07448
G1 X164.664 Y87.496 E-.52484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.565 Y90.3 Z3.3 F42000
G1 X155.092 Y91.278 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2604
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.343 J2.593 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2604
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2604
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14982
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2604
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2604
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2604
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.666 E.06983
G3 X156.373 Y89.889 I.639 J3.065 E.00951
G3 X153.792 Y93.3 I.008 J2.688 E.19389
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02388
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 30/72
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I-1.001 J-.693 P1  F42000
G1 X148.407 Y99.428 Z3.3
G1 Z3
G1 E.8 F1800
G1 F2614
M204 S5000
G1 X148.344 Y99.031 E.00653
G1 X148.344 Y86.122 E.20962
G1 X148.421 Y85.641 E.00791
G1 X148.649 Y85.192 E.00818
G1 X149.006 Y84.836 E.00818
G1 X149.454 Y84.607 E.00818
G1 X149.936 Y84.531 E.00791
G1 X162.845 Y84.531 E.20962
G1 X163.326 Y84.607 E.00791
G1 X163.775 Y84.836 E.00818
G1 X164.131 Y85.192 E.00818
G1 X164.36 Y85.641 E.00818
G1 X164.436 Y86.122 E.00791
G1 X164.436 Y99.031 E.20962
G1 X164.36 Y99.512 E.00791
G1 X164.131 Y99.961 E.00818
G1 X163.775 Y100.317 E.00818
G1 X163.326 Y100.546 E.00818
G1 X162.845 Y100.622 E.00791
G1 X149.936 Y100.622 E.20962
G1 X149.454 Y100.546 E.00791
G1 X149.006 Y100.317 E.00818
G1 X148.649 Y99.961 E.00818
G1 X148.421 Y99.512 E.00818
G1 X148.417 Y99.487 E.00041
; WIPE_START
G1 F3600
M204 S6000
G1 X148.344 Y99.031 E-.17558
G1 X148.344 Y97.493 E-.58442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.101 Y92.482 Z3.4 F42000
G1 X163.77 Y84.066 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2614
M204 S5000
G1 X163.822 Y84.075 E.00087
G1 X164.287 Y84.311 E.00846
G1 X164.655 Y84.68 E.00846
G1 X164.892 Y85.144 E.00846
G1 X164.976 Y85.694 E.00903
G1 X164.976 Y99.459 E.22352
G1 X164.892 Y100.009 E.00903
G1 X164.655 Y100.473 E.00846
G1 X164.287 Y100.842 E.00846
G1 X163.822 Y101.078 E.00846
G1 X163.273 Y101.162 E.00903
G1 X149.507 Y101.162 E.22352
G1 X148.958 Y101.078 E.00903
G1 X148.493 Y100.842 E.00846
G1 X148.125 Y100.473 E.00846
G1 X147.888 Y100.009 E.00846
G1 X147.804 Y99.459 E.00903
G1 X147.804 Y85.694 E.22352
G1 X147.888 Y85.144 E.00903
G1 X148.125 Y84.68 E.00846
G1 X148.493 Y84.311 E.00846
G1 X148.958 Y84.075 E.00846
G1 X149.507 Y83.991 E.00903
G1 X163.273 Y83.991 E.22352
G1 X163.71 Y84.057 E.00719
; WIPE_START
G1 F3600
M204 S6000
G1 X163.822 Y84.075 E-.0431
G1 X164.287 Y84.311 E-.19803
G1 X164.655 Y84.68 E-.19805
G1 X164.892 Y85.144 E-.19804
G1 X164.941 Y85.464 E-.12279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 30 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer30 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.645 Y85.532 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.203141
G1 F2614
M204 S6000
G3 X164.69 Y85.897 I-2.204 J.454 E.00273
; LINE_WIDTH: 0.164567
G1 X164.706 Y86.096 E.00116
; LINE_WIDTH: 0.148428
G1 X164.706 Y99.047 E.067
G1 X164.69 Y99.255 E.00108
; LINE_WIDTH: 0.195757
G1 X164.674 Y99.454 E.00141
; LINE_WIDTH: 0.211763
G3 X164.645 Y99.621 I-1.075 J-.1 E.00132
; LINE_WIDTH: 0.23899
G1 X164.6 Y99.76 E.0013
; LINE_WIDTH: 0.284774
G1 X164.555 Y99.899 E.00157
; LINE_WIDTH: 0.325836
G3 X164.355 Y100.255 I-1.415 J-.561 E.00508
G1 X164.069 Y100.541 E.00502
G3 X163.963 Y100.614 I-.516 J-.639 E.0016
; LINE_WIDTH: 0.299812
G3 X163.574 Y100.787 I-.739 J-1.141 E.00484
; LINE_WIDTH: 0.238997
G1 X163.435 Y100.832 E.0013
; LINE_WIDTH: 0.203141
G3 X163.069 Y100.876 I-.454 J-2.203 E.00273
; LINE_WIDTH: 0.164567
G1 X162.871 Y100.892 E.00116
; LINE_WIDTH: 0.148428
G1 X149.919 Y100.892 E.067
G1 X149.711 Y100.876 E.00108
; LINE_WIDTH: 0.195758
G1 X149.513 Y100.861 E.00141
; LINE_WIDTH: 0.211761
G3 X149.346 Y100.832 I.099 J-1.07 E.00132
; LINE_WIDTH: 0.239006
G1 X149.206 Y100.787 E.0013
; LINE_WIDTH: 0.284783
G1 X149.067 Y100.741 E.00157
; LINE_WIDTH: 0.325838
G3 X148.711 Y100.541 I.561 J-1.416 E.00508
G1 X148.425 Y100.255 E.00502
G3 X148.352 Y100.149 I.641 J-.517 E.0016
; LINE_WIDTH: 0.299812
G3 X148.18 Y99.76 I1.141 J-.739 E.00484
; LINE_WIDTH: 0.238997
G1 X148.135 Y99.621 E.0013
; LINE_WIDTH: 0.203141
G3 X148.09 Y99.255 I2.203 J-.454 E.00273
; LINE_WIDTH: 0.164567
G1 X148.075 Y99.057 E.00116
; LINE_WIDTH: 0.148181
G1 X148.075 Y86.096 E.06692
; LINE_WIDTH: 0.164559
G1 X148.09 Y85.897 E.00116
; LINE_WIDTH: 0.195757
G1 X148.106 Y85.699 E.00141
; LINE_WIDTH: 0.211761
G3 X148.135 Y85.532 I1.07 J.099 E.00132
; LINE_WIDTH: 0.239006
G1 X148.18 Y85.393 E.0013
; LINE_WIDTH: 0.284783
G1 X148.225 Y85.254 E.00157
; LINE_WIDTH: 0.325842
G3 X148.425 Y84.898 I1.416 J.561 E.00508
G1 X148.711 Y84.611 E.00502
G3 X148.818 Y84.539 I.518 J.642 E.0016
; LINE_WIDTH: 0.299809
G3 X149.206 Y84.366 I.739 J1.142 E.00484
; LINE_WIDTH: 0.239004
G1 X149.346 Y84.321 E.0013
; LINE_WIDTH: 0.203141
G3 X149.711 Y84.277 I.454 J2.204 E.00273
; LINE_WIDTH: 0.164567
G1 X149.909 Y84.261 E.00116
; LINE_WIDTH: 0.148428
G1 X162.861 Y84.261 E.067
G1 X163.069 Y84.277 E.00108
; LINE_WIDTH: 0.195756
G1 X163.267 Y84.292 E.00141
; LINE_WIDTH: 0.211781
G3 X163.435 Y84.321 I-.099 J1.071 E.00132
; LINE_WIDTH: 0.23899
G1 X163.574 Y84.366 E.0013
; LINE_WIDTH: 0.28473
G1 X163.713 Y84.412 E.00157
; LINE_WIDTH: 0.325836
G3 X164.069 Y84.611 I-1.84 J3.692 E.00507
G1 X164.355 Y84.898 E.00502
G3 X164.428 Y85.004 I-.642 J.518 E.0016
; LINE_WIDTH: 0.299809
G3 X164.6 Y85.393 I-1.142 J.739 E.00484
; LINE_WIDTH: 0.239004
G1 X164.627 Y85.475 E.00077
; WIPE_START
G1 F15000
G1 X164.69 Y85.897 E-.16237
G1 X164.706 Y86.096 E-.07554
G1 X164.706 Y87.47 E-.5221
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P80 R4
G1 X157.61 Y90.28 Z3.4 F42000
G1 X155.092 Y91.278 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2614
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.59 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2614
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2614
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2614
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2614
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.755 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2614
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06984
G3 X156.378 Y89.889 I.634 J3.027 E.0096
G3 X153.791 Y93.3 I.002 J2.688 E.19383
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 31/72
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-.998 J-.696 P1  F42000
G1 X148.362 Y99.432 Z3.4
G1 Z3.1
G1 E.8 F1800
G1 F2624
M204 S5000
G1 X148.302 Y99.05 E.00627
G1 X148.302 Y86.103 E.21024
G1 X148.379 Y85.614 E.00803
G1 X148.611 Y85.159 E.0083
G1 X148.973 Y84.797 E.0083
G1 X149.428 Y84.565 E.0083
G1 X149.916 Y84.488 E.00803
G1 X162.864 Y84.488 E.21024
G1 X163.352 Y84.565 E.00803
G1 X163.808 Y84.797 E.0083
G1 X164.169 Y85.159 E.0083
G1 X164.401 Y85.614 E.0083
G1 X164.479 Y86.103 E.00803
G1 X164.479 Y99.05 E.21024
G1 X164.401 Y99.539 E.00803
G1 X164.169 Y99.994 E.0083
G1 X163.808 Y100.356 E.0083
G1 X163.352 Y100.588 E.0083
G1 X162.864 Y100.665 E.00803
G1 X149.916 Y100.665 E.21024
G1 X149.428 Y100.588 E.00803
G1 X148.973 Y100.356 E.0083
G1 X148.611 Y99.994 E.0083
G1 X148.379 Y99.539 E.0083
G1 X148.371 Y99.491 E.00078
; WIPE_START
G1 F3600
M204 S6000
G1 X148.302 Y99.05 E-.1696
G1 X148.302 Y97.496 E-.5904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.064 Y92.492 Z3.5 F42000
G1 X163.811 Y84.029 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F2624
M204 S5000
G1 X163.852 Y84.035 E.00067
G1 X164.321 Y84.274 E.00855
G1 X164.693 Y84.646 E.00854
G1 X164.932 Y85.115 E.00855
G1 X165.017 Y85.669 E.00911
G1 X165.017 Y99.484 E.22431
G1 X164.932 Y100.038 E.00911
G1 X164.693 Y100.507 E.00855
G1 X164.321 Y100.879 E.00854
G1 X163.852 Y101.118 E.00855
G1 X163.297 Y101.203 E.00911
G1 X149.483 Y101.203 E.22431
G1 X148.928 Y101.118 E.00911
G1 X148.46 Y100.879 E.00855
G1 X148.087 Y100.507 E.00854
G1 X147.849 Y100.038 E.00855
G1 X147.764 Y99.484 E.00911
G1 X147.764 Y85.669 E.22431
G1 X147.849 Y85.115 E.00911
G1 X148.087 Y84.646 E.00855
G1 X148.46 Y84.274 E.00854
G1 X148.928 Y84.035 E.00855
G1 X149.483 Y83.95 E.00911
G1 X163.297 Y83.95 E.22431
G1 X163.752 Y84.019 E.00747
; WIPE_START
G1 F3600
M204 S6000
G1 X163.852 Y84.035 E-.03837
G1 X164.321 Y84.274 E-.19999
G1 X164.693 Y84.646 E-.19996
G1 X164.932 Y85.115 E-.19997
G1 X164.98 Y85.431 E-.12171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 31 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer31 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.686 Y85.506 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.201529
G1 F2624
M204 S6000
G3 X164.731 Y85.876 I-2.242 J.46 E.00274
; LINE_WIDTH: 0.162436
G1 X164.747 Y86.077 E.00116
; LINE_WIDTH: 0.146114
G1 X164.748 Y99.066 E.06597
G1 X164.731 Y99.277 E.00107
; LINE_WIDTH: 0.194082
G1 X164.716 Y99.478 E.00142
; LINE_WIDTH: 0.210294
G3 X164.686 Y99.647 I-1.084 J-.1 E.00132
; LINE_WIDTH: 0.237775
G1 X164.641 Y99.788 E.0013
; LINE_WIDTH: 0.284095
G1 X164.595 Y99.929 E.00158
; LINE_WIDTH: 0.325632
G3 X164.393 Y100.289 I-1.43 J-.567 E.00514
G1 X164.103 Y100.579 E.00508
G3 X163.996 Y100.652 I-.522 J-.647 E.00161
; LINE_WIDTH: 0.299324
G3 X163.602 Y100.827 I-.749 J-1.157 E.0049
; LINE_WIDTH: 0.237772
G1 X163.461 Y100.873 E.0013
; LINE_WIDTH: 0.20153
G3 X163.091 Y100.918 I-.46 J-2.242 E.00274
; LINE_WIDTH: 0.162436
G1 X162.89 Y100.934 E.00116
; LINE_WIDTH: 0.146114
G1 X149.9 Y100.934 E.06597
G1 X149.689 Y100.918 E.00107
; LINE_WIDTH: 0.194082
G1 X149.489 Y100.902 E.00142
; LINE_WIDTH: 0.210294
G3 X149.319 Y100.873 I.1 J-1.084 E.00132
; LINE_WIDTH: 0.237775
G1 X149.179 Y100.827 E.0013
; LINE_WIDTH: 0.284095
G1 X149.038 Y100.781 E.00158
; LINE_WIDTH: 0.325633
G3 X148.678 Y100.579 I.567 J-1.43 E.00514
G1 X148.388 Y100.289 E.00508
G3 X148.314 Y100.182 I.648 J-.523 E.00161
; LINE_WIDTH: 0.299324
G3 X148.14 Y99.788 I1.157 J-.749 E.0049
; LINE_WIDTH: 0.237772
G1 X148.094 Y99.647 E.0013
; LINE_WIDTH: 0.20153
G3 X148.049 Y99.277 I2.242 J-.46 E.00274
; LINE_WIDTH: 0.162436
G1 X148.033 Y99.076 E.00116
; LINE_WIDTH: 0.145861
G1 X148.033 Y86.077 E.06589
; LINE_WIDTH: 0.162454
G1 X148.049 Y85.876 E.00116
; LINE_WIDTH: 0.194082
G1 X148.065 Y85.675 E.00142
; LINE_WIDTH: 0.210294
G3 X148.094 Y85.506 I1.084 J.1 E.00132
; LINE_WIDTH: 0.237775
G1 X148.14 Y85.365 E.0013
; LINE_WIDTH: 0.284095
G1 X148.185 Y85.224 E.00158
; LINE_WIDTH: 0.325632
G3 X148.388 Y84.864 I1.43 J.567 E.00514
G1 X148.678 Y84.574 E.00508
G3 X148.785 Y84.501 I.522 J.647 E.00161
; LINE_WIDTH: 0.299324
G3 X149.179 Y84.326 I.749 J1.157 E.0049
; LINE_WIDTH: 0.237772
G1 X149.32 Y84.28 E.0013
; LINE_WIDTH: 0.20153
G3 X149.689 Y84.235 I.46 J2.242 E.00274
; LINE_WIDTH: 0.162436
G1 X149.89 Y84.219 E.00116
; LINE_WIDTH: 0.146114
G1 X162.88 Y84.219 E.06597
G1 X163.091 Y84.235 E.00107
; LINE_WIDTH: 0.194078
G1 X163.292 Y84.251 E.00142
; LINE_WIDTH: 0.210312
G3 X163.461 Y84.28 I-.1 J1.083 E.00132
; LINE_WIDTH: 0.237777
G1 X163.602 Y84.326 E.0013
; LINE_WIDTH: 0.284095
G1 X163.742 Y84.372 E.00158
; LINE_WIDTH: 0.325627
G3 X164.103 Y84.574 I-.567 J1.431 E.00514
G1 X164.393 Y84.864 E.00508
G3 X164.466 Y84.971 I-.647 J.522 E.00161
; LINE_WIDTH: 0.299321
G3 X164.641 Y85.365 I-1.156 J.749 E.0049
; LINE_WIDTH: 0.237767
G1 X164.668 Y85.449 E.00078
; WIPE_START
G1 F15000
G1 X164.731 Y85.876 E-.16406
G1 X164.747 Y86.077 E-.07659
G1 X164.747 Y87.443 E-.51935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.654 Y90.26 Z3.5 F42000
G1 X155.092 Y91.278 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2624
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.587 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2624
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2624
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00677
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14984
G1 X158.286 Y91.278 E-.17433
G1 X157.749 Y91.278 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2624
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2624
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.759 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20272
G1 X154.55 Y93.922 E-.10429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z3.5 F42000
G1 Z3.1
M73 P81 R4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2624
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06543
G3 X156.384 Y89.889 I.839 J2.489 E.01405
G3 X153.794 Y93.299 I-.001 J2.688 E.19381
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12474
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02391
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 32/72
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I-.996 J-.7 P1  F42000
G1 X148.317 Y99.435 Z3.5
G1 Z3.2
G1 E.8 F1800
G1 F2634
M204 S5000
G1 X148.259 Y99.069 E.00602
G1 X148.259 Y86.084 E.21086
G1 X148.337 Y85.588 E.00815
G1 X148.573 Y85.126 E.00842
G1 X148.939 Y84.759 E.00842
G1 X149.402 Y84.524 E.00842
G1 X149.897 Y84.445 E.00815
G1 X162.883 Y84.445 E.21086
G1 X163.379 Y84.524 E.00815
G1 X163.841 Y84.759 E.00842
G1 X164.208 Y85.126 E.00842
G1 X164.443 Y85.588 E.00842
G1 X164.522 Y86.084 E.00815
G1 X164.522 Y99.069 E.21086
G1 X164.443 Y99.565 E.00815
G1 X164.208 Y100.027 E.00842
G1 X163.841 Y100.394 E.00842
G1 X163.379 Y100.629 E.00842
G1 X162.883 Y100.708 E.00815
G1 X149.897 Y100.708 E.21086
G1 X149.402 Y100.629 E.00815
G1 X148.939 Y100.394 E.00842
G1 X148.573 Y100.027 E.00842
G1 X148.337 Y99.565 E.00842
G1 X148.326 Y99.495 E.00116
; WIPE_START
G1 F3600
M204 S6000
G1 X148.259 Y99.069 E-.16368
G1 X148.259 Y97.5 E-.59633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.027 Y92.502 Z3.6 F42000
G1 X163.852 Y83.991 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F2634
M204 S5000
G1 X163.881 Y83.995 E.00048
G1 X164.355 Y84.236 E.00863
G1 X164.73 Y84.612 E.00863
G1 X164.971 Y85.085 E.00863
G1 X165.057 Y85.645 E.00919
G1 X165.057 Y99.508 E.2251
G1 X164.971 Y100.067 E.00919
G1 X164.73 Y100.541 E.00863
G1 X164.355 Y100.917 E.00863
G1 X163.881 Y101.158 E.00863
G1 X163.322 Y101.244 E.00919
G1 X149.459 Y101.244 E.2251
G1 X148.899 Y101.158 E.00919
G1 X148.426 Y100.917 E.00863
G1 X148.05 Y100.541 E.00863
G1 X147.809 Y100.067 E.00863
G1 X147.723 Y99.508 E.00919
G1 X147.723 Y85.645 E.2251
G1 X147.809 Y85.085 E.00919
G1 X148.05 Y84.612 E.00863
G1 X148.426 Y84.236 E.00863
G1 X148.899 Y83.995 E.00863
G1 X149.459 Y83.909 E.00919
G1 X163.322 Y83.909 E.2251
G1 X163.793 Y83.981 E.00774
; WIPE_START
G1 F3600
M204 S6000
G1 X163.881 Y83.995 E-.03403
G1 X164.355 Y84.236 E-.20191
G1 X164.73 Y84.612 E-.20189
G1 X164.971 Y85.085 E-.20191
G1 X165.019 Y85.398 E-.12026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 32 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer32 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.728 Y85.48 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.199942
G1 F2634
M204 S6000
G3 X164.773 Y85.854 I-2.277 J.466 E.00275
; LINE_WIDTH: 0.16033
G1 X164.789 Y86.058 E.00116
; LINE_WIDTH: 0.1438
G1 X164.789 Y99.085 E.06494
G1 X164.773 Y99.299 E.00107
; LINE_WIDTH: 0.192392
G1 X164.757 Y99.502 E.00142
; LINE_WIDTH: 0.208843
G3 X164.728 Y99.673 I-1.091 J-.1 E.00132
; LINE_WIDTH: 0.236551
G1 X164.681 Y99.816 E.00131
; LINE_WIDTH: 0.283416
G1 X164.635 Y99.958 E.0016
; LINE_WIDTH: 0.325426
G3 X164.43 Y100.323 I-1.446 J-.572 E.0052
G1 X164.136 Y100.616 E.00514
G3 X164.029 Y100.69 I-.528 J-.654 E.00162
; LINE_WIDTH: 0.298846
G3 X163.629 Y100.868 I-.759 J-1.172 E.00496
; LINE_WIDTH: 0.236566
G1 X163.487 Y100.914 E.00131
; LINE_WIDTH: 0.199941
G3 X163.112 Y100.959 I-.466 J-2.277 E.00275
; LINE_WIDTH: 0.16033
G1 X162.909 Y100.975 E.00116
; LINE_WIDTH: 0.1438
G1 X149.881 Y100.976 E.06494
G1 X149.668 Y100.959 E.00107
; LINE_WIDTH: 0.192392
G1 X149.464 Y100.943 E.00142
; LINE_WIDTH: 0.208843
G3 X149.293 Y100.914 I.1 J-1.091 E.00132
; LINE_WIDTH: 0.236551
G1 X149.151 Y100.868 E.00131
; LINE_WIDTH: 0.283416
G1 X149.008 Y100.821 E.0016
; LINE_WIDTH: 0.325426
G3 X148.644 Y100.616 I.572 J-1.446 E.0052
G1 X148.35 Y100.323 E.00514
G3 X148.276 Y100.215 I.654 J-.528 E.00162
; LINE_WIDTH: 0.298846
G3 X148.099 Y99.816 I1.172 J-.759 E.00496
; LINE_WIDTH: 0.236566
G1 X148.053 Y99.673 E.00131
; LINE_WIDTH: 0.199941
G3 X148.007 Y99.299 I2.277 J-.466 E.00275
; LINE_WIDTH: 0.16033
G1 X147.991 Y99.095 E.00116
; LINE_WIDTH: 0.143541
G1 X147.991 Y86.058 E.06485
; LINE_WIDTH: 0.160331
G1 X148.007 Y85.854 E.00116
; LINE_WIDTH: 0.192392
G1 X148.023 Y85.651 E.00142
; LINE_WIDTH: 0.208843
G3 X148.053 Y85.48 I1.091 J.1 E.00132
; LINE_WIDTH: 0.236551
G1 X148.099 Y85.337 E.00131
; LINE_WIDTH: 0.283416
G1 X148.145 Y85.195 E.0016
; LINE_WIDTH: 0.325426
G3 X148.35 Y84.83 I1.446 J.572 E.0052
G1 X148.644 Y84.537 E.00514
G3 X148.752 Y84.463 I.528 J.654 E.00162
; LINE_WIDTH: 0.298846
G3 X149.151 Y84.285 I.759 J1.172 E.00496
; LINE_WIDTH: 0.236566
G1 X149.293 Y84.239 E.00131
; LINE_WIDTH: 0.199941
G3 X149.668 Y84.194 I.466 J2.277 E.00275
; LINE_WIDTH: 0.16033
G1 X149.872 Y84.178 E.00116
; LINE_WIDTH: 0.1438
G1 X162.899 Y84.177 E.06494
G1 X163.112 Y84.194 E.00107
; LINE_WIDTH: 0.192392
G1 X163.316 Y84.21 E.00142
; LINE_WIDTH: 0.208843
G3 X163.487 Y84.239 I-.1 J1.091 E.00132
; LINE_WIDTH: 0.236551
G1 X163.629 Y84.285 E.00131
; LINE_WIDTH: 0.283416
G1 X163.772 Y84.332 E.0016
; LINE_WIDTH: 0.325425
G3 X164.136 Y84.537 I-.572 J1.446 E.0052
G1 X164.43 Y84.83 E.00514
G3 X164.504 Y84.938 I-.653 J.527 E.00162
; LINE_WIDTH: 0.298847
G3 X164.681 Y85.337 I-1.172 J.759 E.00496
; LINE_WIDTH: 0.236566
G1 X164.709 Y85.423 E.00079
; WIPE_START
G1 F15000
G1 X164.773 Y85.854 E-.16576
G1 X164.789 Y86.058 E-.07764
G1 X164.789 Y87.417 E-.51661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.698 Y90.24 Z3.6 F42000
G1 X155.092 Y91.278 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2634
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2634
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2634
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2634
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17439
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2634
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2634
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06544
G3 X156.389 Y89.889 I.839 J2.485 E.01413
G3 X153.793 Y93.3 I-.006 J2.688 E.19371
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 33/72
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.993 J-.703 P1  F42000
G1 X148.271 Y99.439 Z3.6
G1 Z3.3
G1 E.8 F1800
G1 F2644
M204 S5000
G1 X148.216 Y99.088 E.00577
G1 X148.216 Y86.065 E.21148
G1 X148.296 Y85.562 E.00827
G1 X148.534 Y85.093 E.00854
G1 X148.906 Y84.721 E.00854
G1 X149.375 Y84.482 E.00854
G1 X149.878 Y84.402 E.00827
G1 X162.902 Y84.402 E.21148
G1 X163.405 Y84.482 E.00827
G1 X163.874 Y84.721 E.00854
G1 X164.246 Y85.093 E.00854
G1 X164.485 Y85.562 E.00854
G1 X164.564 Y86.065 E.00827
G1 X164.564 Y99.088 E.21148
G1 X164.485 Y99.591 E.00827
G1 X164.246 Y100.06 E.00854
G1 X163.874 Y100.432 E.00854
G1 X163.405 Y100.671 E.00854
G1 X162.902 Y100.751 E.00827
G1 X149.878 Y100.751 E.21148
G1 X149.375 Y100.671 E.00827
G1 X148.906 Y100.432 E.00854
G1 X148.534 Y100.06 E.00854
G1 X148.296 Y99.591 E.00854
G1 X148.281 Y99.498 E.00153
; WIPE_START
G1 F3600
M204 S6000
G1 X148.216 Y99.088 E-.15779
G1 X148.216 Y97.503 E-.60221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.99 Y92.512 Z3.7 F42000
G1 X163.891 Y83.952 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F2644
M204 S5000
G1 X163.891 Y83.952 E.00001
G1 X163.91 Y83.955 E.00031
G1 X164.388 Y84.199 E.00871
G1 X164.768 Y84.578 E.00871
G1 X165.011 Y85.056 E.00871
G1 X165.098 Y85.621 E.00928
G1 X165.098 Y99.532 E.22589
G1 X165.011 Y100.097 E.00927
G1 X164.768 Y100.575 E.00871
G1 X164.388 Y100.954 E.00871
G1 X163.91 Y101.197 E.00871
G1 X163.346 Y101.284 E.00928
G1 X149.434 Y101.284 E.22589
G1 X148.87 Y101.198 E.00927
G1 X148.392 Y100.954 E.00871
G1 X148.013 Y100.575 E.00871
G1 X147.769 Y100.097 E.00871
G1 X147.683 Y99.532 E.00928
G1 X147.683 Y85.621 E.22589
G1 X147.769 Y85.056 E.00927
G1 X148.013 Y84.578 E.00871
G1 X148.392 Y84.199 E.00871
G1 X148.87 Y83.955 E.00871
G1 X149.434 Y83.869 E.00928
G1 X163.346 Y83.869 E.22589
G1 X163.831 Y83.943 E.00798
; WIPE_START
G1 F3600
M204 S6000
G1 X163.891 Y83.952 E-.02306
G1 X163.91 Y83.955 E-.00733
G1 X164.388 Y84.199 E-.20384
G1 X164.768 Y84.578 E-.20383
G1 X165.011 Y85.056 E-.20382
G1 X165.058 Y85.363 E-.11812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 33 start: 149
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.7
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer33 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.769 Y85.454 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.198327
G1 F2644
M204 S6000
G3 X164.814 Y85.833 I-2.317 J.473 E.00275
; LINE_WIDTH: 0.158214
G1 X164.831 Y86.039 E.00115
; LINE_WIDTH: 0.141486
G1 X164.831 Y99.104 E.06389
G1 X164.814 Y99.32 E.00106
; LINE_WIDTH: 0.190711
G1 X164.798 Y99.527 E.00143
; LINE_WIDTH: 0.207354
G3 X164.769 Y99.699 I-1.101 J-.101 E.00133
; LINE_WIDTH: 0.235331
G1 X164.722 Y99.843 E.00132
; LINE_WIDTH: 0.282744
G1 X164.675 Y99.987 E.00161
; LINE_WIDTH: 0.325229
G3 X164.467 Y100.357 I-1.46 J-.577 E.00526
G1 X164.17 Y100.654 E.0052
G3 X164.062 Y100.729 I-.532 J-.659 E.00163
; LINE_WIDTH: 0.298353
G3 X163.657 Y100.908 I-.769 J-1.187 E.00501
; LINE_WIDTH: 0.235315
G1 X163.513 Y100.955 E.00132
; LINE_WIDTH: 0.198328
G3 X163.134 Y101.001 I-.473 J-2.317 E.00275
; LINE_WIDTH: 0.158214
G1 X162.928 Y101.017 E.00115
; LINE_WIDTH: 0.141486
G1 X149.862 Y101.017 E.06389
G1 X149.646 Y101.001 E.00106
; LINE_WIDTH: 0.190711
G1 X149.44 Y100.985 E.00143
; LINE_WIDTH: 0.207354
G3 X149.267 Y100.955 I.101 J-1.101 E.00133
; LINE_WIDTH: 0.235331
G1 X149.123 Y100.908 E.00132
; LINE_WIDTH: 0.282744
G1 X148.979 Y100.861 E.00161
; LINE_WIDTH: 0.325229
G3 X148.61 Y100.654 I.577 J-1.46 E.00526
G1 X148.313 Y100.357 E.0052
G3 X148.238 Y100.248 I.659 J-.532 E.00163
; LINE_WIDTH: 0.298353
G3 X148.059 Y99.843 I1.187 J-.769 E.00501
; LINE_WIDTH: 0.235315
G1 X148.012 Y99.699 E.00132
; LINE_WIDTH: 0.198328
G3 X147.966 Y99.32 I2.317 J-.473 E.00275
; LINE_WIDTH: 0.158214
G1 X147.95 Y99.114 E.00115
; LINE_WIDTH: 0.141221
G1 X147.95 Y86.039 E.0638
; LINE_WIDTH: 0.15821
G1 X147.966 Y85.833 E.00115
; LINE_WIDTH: 0.190711
G1 X147.982 Y85.626 E.00143
; LINE_WIDTH: 0.207353
G3 X148.012 Y85.454 I1.1 J.101 E.00133
; LINE_WIDTH: 0.235332
G1 X148.059 Y85.31 E.00132
; LINE_WIDTH: 0.282742
G1 X148.105 Y85.165 E.00161
; LINE_WIDTH: 0.325237
G3 X148.313 Y84.796 I1.46 J.577 E.00526
G1 X148.61 Y84.499 E.0052
G3 X148.719 Y84.424 I.532 J.658 E.00163
; LINE_WIDTH: 0.29837
G3 X149.123 Y84.245 I.769 J1.187 E.00501
; LINE_WIDTH: 0.235322
G1 X149.267 Y84.198 E.00132
; LINE_WIDTH: 0.198328
G3 X149.646 Y84.152 I.473 J2.318 E.00275
; LINE_WIDTH: 0.158214
G1 X149.853 Y84.136 E.00115
; LINE_WIDTH: 0.141486
G1 X162.918 Y84.136 E.06389
G1 X163.134 Y84.152 E.00106
; LINE_WIDTH: 0.190713
G1 X163.34 Y84.168 E.00143
; LINE_WIDTH: 0.207356
G3 X163.513 Y84.198 I-.102 J1.106 E.00133
; LINE_WIDTH: 0.235321
G1 X163.657 Y84.245 E.00132
; LINE_WIDTH: 0.282741
G1 X163.801 Y84.292 E.00161
; LINE_WIDTH: 0.325229
G3 X164.17 Y84.499 I-.577 J1.46 E.00526
G1 X164.467 Y84.796 E.0052
G3 X164.542 Y84.905 I-.659 J.532 E.00163
; LINE_WIDTH: 0.298346
G3 X164.722 Y85.31 I-1.188 J.769 E.00501
; LINE_WIDTH: 0.235315
G1 X164.75 Y85.397 E.0008
; WIPE_START
G1 F15000
G1 X164.814 Y85.833 E-.16745
G1 X164.831 Y86.039 E-.07869
G1 X164.831 Y87.391 E-.51386
; WIPE_END
M73 P82 R4
G1 E-.04 F1800
M204 S10000
G1 X157.742 Y90.22 Z3.7 F42000
G1 X155.092 Y91.278 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.343 J2.593 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2644
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2644
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06545
G3 X156.394 Y89.889 I.838 J2.483 E.01422
G3 X153.793 Y93.3 I-.012 J2.688 E.19365
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 34/72
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I-.991 J-.707 P1  F42000
G1 X148.226 Y99.443 Z3.7
G1 Z3.4
G1 E.8 F1800
G1 F2654
M204 S5000
G1 X148.173 Y99.107 E.00552
G1 X148.173 Y86.046 E.21209
G1 X148.254 Y85.535 E.00839
G1 X148.496 Y85.06 E.00866
G1 X148.807 Y84.749 E.00715
G1 X148.873 Y84.682 E.00152
G1 X149.349 Y84.44 E.00866
G1 X149.859 Y84.359 E.00839
G1 X162.921 Y84.359 E.21209
G1 X163.431 Y84.44 E.00839
G1 X163.907 Y84.682 E.00866
G1 X164.284 Y85.06 E.00866
G1 X164.526 Y85.535 E.00866
G1 X164.607 Y86.046 E.00839
G1 X164.607 Y99.107 E.21209
G1 X164.526 Y99.618 E.00839
G1 X164.284 Y100.093 E.00866
G1 X163.907 Y100.471 E.00866
G1 X163.431 Y100.713 E.00866
G1 X162.921 Y100.794 E.00839
G1 X149.859 Y100.794 E.21209
G1 X149.349 Y100.713 E.00839
G1 X148.873 Y100.47 E.00866
G1 X148.496 Y100.093 E.00866
G1 X148.254 Y99.618 E.00866
G1 X148.236 Y99.502 E.0019
; WIPE_START
G1 F3600
M204 S6000
G1 X148.173 Y99.107 E-.15196
G1 X148.173 Y97.507 E-.60805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.952 Y92.522 Z3.8 F42000
G1 X163.929 Y83.914 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2654
M204 S5000
G1 X163.932 Y83.914 E.00004
G1 X163.94 Y83.916 E.00013
G1 X164.422 Y84.161 E.00879
G1 X164.805 Y84.544 E.00879
G1 X165.051 Y85.027 E.00879
G1 X165.138 Y85.596 E.00936
G1 X165.138 Y99.557 E.22668
G1 X165.051 Y100.126 E.00936
G1 X164.805 Y100.609 E.00879
G1 X164.422 Y100.991 E.00879
G1 X163.94 Y101.237 E.00879
G1 X163.37 Y101.325 E.00936
G1 X149.41 Y101.325 E.22668
G1 X148.84 Y101.237 E.00936
G1 X148.358 Y100.991 E.00879
G1 X147.975 Y100.609 E.00879
G1 X147.729 Y100.126 E.00879
G1 X147.642 Y99.557 E.00936
G1 X147.642 Y85.596 E.22668
G1 X147.729 Y85.027 E.00936
G1 X147.975 Y84.544 E.00879
G1 X148.358 Y84.161 E.00879
G1 X148.84 Y83.916 E.00879
G1 X149.41 Y83.828 E.00936
G1 X163.37 Y83.828 E.22668
G1 X163.87 Y83.905 E.00821
; WIPE_START
G1 F3600
M204 S6000
G1 X163.932 Y83.914 E-.02367
G1 X163.94 Y83.916 E-.00309
G1 X164.422 Y84.161 E-.20577
G1 X164.805 Y84.544 E-.20575
G1 X165.051 Y85.027 E-.20576
G1 X165.097 Y85.328 E-.11597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 34 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer34 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.808 Y85.422 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.234089
G1 F2654
M204 S6000
G1 X164.81 Y85.428 E.00005
; LINE_WIDTH: 0.196733
G3 X164.856 Y85.811 I-2.352 J.479 E.00276
; LINE_WIDTH: 0.156101
G1 X164.872 Y86.02 E.00115
; LINE_WIDTH: 0.139182
G1 X164.873 Y99.124 E.06285
G1 X164.856 Y99.342 E.00105
; LINE_WIDTH: 0.189036
G1 X164.839 Y99.551 E.00143
; LINE_WIDTH: 0.205885
G3 X164.81 Y99.725 I-1.114 J-.102 E.00133
; LINE_WIDTH: 0.234092
G1 X164.762 Y99.871 E.00133
; LINE_WIDTH: 0.282067
G1 X164.715 Y100.017 E.00163
; LINE_WIDTH: 0.325027
G3 X164.505 Y100.391 I-1.475 J-.582 E.00532
G1 X164.204 Y100.691 E.00526
G3 X164.095 Y100.767 I-.536 J-.663 E.00165
; LINE_WIDTH: 0.297875
G3 X163.685 Y100.949 I-.779 J-1.202 E.00507
; LINE_WIDTH: 0.234089
G1 X163.539 Y100.996 E.00133
; LINE_WIDTH: 0.196731
G3 X163.156 Y101.042 I-.479 J-2.352 E.00276
; LINE_WIDTH: 0.156101
G1 X162.946 Y101.059 E.00115
; LINE_WIDTH: 0.139182
G1 X149.843 Y101.059 E.06285
G1 X149.625 Y101.042 E.00105
; LINE_WIDTH: 0.189036
G1 X149.415 Y101.026 E.00143
; LINE_WIDTH: 0.205885
G3 X149.241 Y100.996 I.102 J-1.114 E.00133
; LINE_WIDTH: 0.234092
G1 X149.095 Y100.949 E.00133
; LINE_WIDTH: 0.282067
G1 X148.95 Y100.901 E.00163
; LINE_WIDTH: 0.325027
G3 X148.576 Y100.691 I.582 J-1.475 E.00532
G1 X148.275 Y100.391 E.00526
G3 X148.2 Y100.281 I.663 J-.536 E.00165
; LINE_WIDTH: 0.297875
G3 X148.018 Y99.871 I1.202 J-.779 E.00507
; LINE_WIDTH: 0.234089
G1 X147.971 Y99.725 E.00133
; LINE_WIDTH: 0.196731
G3 X147.924 Y99.342 I2.352 J-.479 E.00276
; LINE_WIDTH: 0.156101
G1 X147.908 Y99.133 E.00115
; LINE_WIDTH: 0.138911
G1 X147.908 Y86.02 E.06275
; LINE_WIDTH: 0.156105
G1 X147.924 Y85.811 E.00115
; LINE_WIDTH: 0.189036
G1 X147.941 Y85.602 E.00143
; LINE_WIDTH: 0.205884
G3 X147.971 Y85.428 I1.113 J.102 E.00133
; LINE_WIDTH: 0.234091
G1 X148.018 Y85.282 E.00133
; LINE_WIDTH: 0.282057
G1 X148.065 Y85.136 E.00163
; LINE_WIDTH: 0.325021
G3 X148.686 Y84.386 I1.585 J.68 E.0122
; LINE_WIDTH: 0.297875
G3 X149.095 Y84.204 I.779 J1.202 E.00507
; LINE_WIDTH: 0.234089
G1 X149.241 Y84.157 E.00133
; LINE_WIDTH: 0.196731
G3 X149.625 Y84.111 I.479 J2.352 E.00276
; LINE_WIDTH: 0.156101
G1 X149.834 Y84.094 E.00115
; LINE_WIDTH: 0.139181
G1 X162.937 Y84.094 E.06285
G1 X163.156 Y84.111 E.00105
; LINE_WIDTH: 0.189028
G1 X163.365 Y84.127 E.00143
; LINE_WIDTH: 0.205874
G3 X163.539 Y84.157 I-.102 J1.114 E.00133
; LINE_WIDTH: 0.234099
G1 X163.685 Y84.204 E.00133
; LINE_WIDTH: 0.282066
G1 X163.831 Y84.252 E.00163
; LINE_WIDTH: 0.325022
G3 X164.204 Y84.462 I-.583 J1.475 E.00532
G1 X164.505 Y84.762 E.00526
G3 X164.58 Y84.872 I-.665 J.537 E.00165
; LINE_WIDTH: 0.297867
G3 X164.762 Y85.282 I-1.203 J.779 E.00507
; LINE_WIDTH: 0.234089
G1 X164.789 Y85.365 E.00076
; WIPE_START
G1 F15000
G1 X164.81 Y85.428 E-.02487
G1 X164.856 Y85.811 E-.14672
G1 X164.872 Y86.02 E-.07975
G1 X164.872 Y87.359 E-.50867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.788 Y90.198 Z3.8 F42000
G1 X155.092 Y91.278 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2654
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.331 J2.582 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2654
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2654
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2654
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2654
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
M73 P83 R4
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2654
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06545
G3 X156.399 Y89.889 I.838 J2.482 E.0143
G3 X153.792 Y93.3 I-.017 J2.688 E.19356
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 35/72
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.988 J-.71 P1  F42000
G1 X148.181 Y99.447 Z3.8
G1 Z3.5
G1 E.8 F1800
G1 F2664
M204 S5000
G1 X148.13 Y99.126 E.00527
G1 X148.13 Y86.027 E.21271
M73 P83 R3
G1 X148.212 Y85.509 E.00851
G1 X148.458 Y85.027 E.00879
G1 X148.84 Y84.644 E.00879
G1 X149.322 Y84.398 E.00879
G1 X149.84 Y84.316 E.00851
G1 X162.94 Y84.316 E.21271
G1 X163.458 Y84.398 E.00851
G1 X163.94 Y84.644 E.00879
G1 X164.322 Y85.027 E.00879
G1 X164.568 Y85.509 E.00879
G1 X164.65 Y86.027 E.00851
G1 X164.65 Y99.126 E.21271
G1 X164.568 Y99.644 E.00851
G1 X164.322 Y100.126 E.00879
G1 X163.94 Y100.509 E.00879
G1 X163.458 Y100.754 E.00879
G1 X162.94 Y100.836 E.00851
G1 X149.84 Y100.836 E.21271
G1 X149.322 Y100.754 E.00851
G1 X148.84 Y100.509 E.00879
G1 X148.458 Y100.126 E.00879
G1 X148.212 Y99.644 E.00879
G1 X148.19 Y99.506 E.00227
; WIPE_START
G1 F3600
M204 S6000
G1 X148.13 Y99.126 E-.14619
G1 X148.13 Y97.511 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.914 Y92.531 Z3.9 F42000
G1 X163.966 Y83.875 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F2664
M204 S5000
G1 X163.969 Y83.876 E.00005
G1 X164.456 Y84.124 E.00888
G1 X164.843 Y84.51 E.00887
G1 X165.091 Y84.997 E.00888
G1 X165.179 Y85.572 E.00944
G1 X165.179 Y99.581 E.22747
G1 X165.091 Y100.155 E.00944
G1 X164.843 Y100.642 E.00888
G1 X164.456 Y101.029 E.00887
G1 X163.969 Y101.277 E.00887
G1 X163.394 Y101.365 E.00944
G1 X149.386 Y101.365 E.22747
G1 X148.811 Y101.277 E.00944
G1 X148.324 Y101.029 E.00888
G1 X147.938 Y100.642 E.00887
G1 X147.69 Y100.155 E.00887
G1 X147.601 Y99.581 E.00944
G1 X147.601 Y85.572 E.22747
G1 X147.69 Y84.997 E.00944
G1 X147.938 Y84.511 E.00888
G1 X148.324 Y84.124 E.00887
G1 X148.811 Y83.876 E.00887
G1 X149.386 Y83.788 E.00944
G1 X163.394 Y83.788 E.22747
G1 X163.906 Y83.866 E.00841
; WIPE_START
G1 F3600
M204 S6000
G1 X163.969 Y83.876 E-.02408
G1 X164.456 Y84.124 E-.20769
G1 X164.843 Y84.51 E-.20767
G1 X165.091 Y84.997 E-.20769
G1 X165.136 Y85.291 E-.11285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 35 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer35 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.845 Y85.385 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.232872
G1 F2664
M204 S6000
G1 X164.851 Y85.402 E.00015
; LINE_WIDTH: 0.195136
G3 X164.897 Y85.789 I-2.389 J.485 E.00277
; LINE_WIDTH: 0.15399
G1 X164.914 Y86.001 E.00115
; LINE_WIDTH: 0.136867
G1 X164.914 Y99.143 E.06179
G1 X164.897 Y99.364 E.00104
; LINE_WIDTH: 0.187356
G1 X164.881 Y99.576 E.00144
; LINE_WIDTH: 0.204415
G3 X164.851 Y99.751 I-1.122 J-.102 E.00133
; LINE_WIDTH: 0.232884
G1 X164.803 Y99.899 E.00134
; LINE_WIDTH: 0.281389
G1 X164.755 Y100.046 E.00164
; LINE_WIDTH: 0.324818
G3 X164.542 Y100.424 I-1.491 J-.588 E.00538
G1 X164.238 Y100.729 E.00532
G3 X164.127 Y100.805 I-.541 J-.669 E.00166
; LINE_WIDTH: 0.297383
G3 X163.712 Y100.989 I-.789 J-1.218 E.00513
; LINE_WIDTH: 0.232872
G1 X163.565 Y101.037 E.00134
; LINE_WIDTH: 0.195139
G3 X163.177 Y101.084 I-.485 J-2.389 E.00277
; LINE_WIDTH: 0.15399
G1 X162.965 Y101.1 E.00115
; LINE_WIDTH: 0.136867
G1 X149.824 Y101.101 E.06179
G1 X149.603 Y101.084 E.00104
; LINE_WIDTH: 0.187356
G1 X149.391 Y101.067 E.00144
; LINE_WIDTH: 0.204415
G3 X149.215 Y101.037 I.102 J-1.122 E.00133
; LINE_WIDTH: 0.232884
G1 X149.068 Y100.989 E.00134
; LINE_WIDTH: 0.281389
G1 X148.92 Y100.941 E.00164
; LINE_WIDTH: 0.324818
G3 X148.542 Y100.729 I.588 J-1.491 E.00538
G1 X148.238 Y100.424 E.00532
G3 X148.162 Y100.314 I.669 J-.541 E.00166
; LINE_WIDTH: 0.297383
G3 X147.978 Y99.899 I1.218 J-.789 E.00513
; LINE_WIDTH: 0.232872
G1 X147.93 Y99.751 E.00134
; LINE_WIDTH: 0.195139
G3 X147.883 Y99.364 I2.389 J-.485 E.00277
; LINE_WIDTH: 0.15399
G1 X147.866 Y99.152 E.00115
; LINE_WIDTH: 0.136591
G1 X147.866 Y86.001 E.06169
; LINE_WIDTH: 0.153986
G1 X147.883 Y85.789 E.00115
; LINE_WIDTH: 0.187356
G1 X147.9 Y85.577 E.00144
; LINE_WIDTH: 0.204415
G3 X147.93 Y85.402 I1.122 J.102 E.00133
; LINE_WIDTH: 0.232884
G1 X147.978 Y85.254 E.00134
; LINE_WIDTH: 0.281389
G1 X148.026 Y85.107 E.00164
; LINE_WIDTH: 0.324818
G3 X148.238 Y84.728 I1.491 J.588 E.00538
G1 X148.542 Y84.424 E.00532
G3 X148.653 Y84.348 I.541 J.669 E.00166
; LINE_WIDTH: 0.297383
G3 X149.068 Y84.164 I.789 J1.218 E.00513
; LINE_WIDTH: 0.232872
G1 X149.215 Y84.116 E.00134
; LINE_WIDTH: 0.195139
G3 X149.603 Y84.069 I.485 J2.389 E.00277
; LINE_WIDTH: 0.15399
G1 X149.815 Y84.052 E.00115
; LINE_WIDTH: 0.136867
G1 X162.956 Y84.052 E.06179
G1 X163.177 Y84.069 E.00104
; LINE_WIDTH: 0.187356
G1 X163.389 Y84.086 E.00144
; LINE_WIDTH: 0.204415
G3 X163.565 Y84.116 I-.102 J1.122 E.00133
; LINE_WIDTH: 0.232884
G1 X163.712 Y84.164 E.00134
; LINE_WIDTH: 0.281389
G1 X163.86 Y84.212 E.00164
; LINE_WIDTH: 0.324818
G3 X164.238 Y84.424 I-.588 J1.491 E.00538
G1 X164.542 Y84.728 E.00532
G3 X164.618 Y84.839 I-.668 J.541 E.00166
; LINE_WIDTH: 0.297382
G3 X164.803 Y85.254 I-1.218 J.789 E.00513
; LINE_WIDTH: 0.232872
G1 X164.827 Y85.328 E.00067
; WIPE_START
G1 F15000
G1 X164.851 Y85.402 E-.02927
G1 X164.897 Y85.789 E-.14842
G1 X164.914 Y86.001 E-.0808
G1 X164.914 Y87.321 E-.50152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.835 Y90.173 Z3.9 F42000
G1 X155.092 Y91.278 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2664
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.335 J2.586 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2664
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2664
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14982
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2664
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2664
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2664
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06545
G3 X156.405 Y89.89 I.837 J2.48 E.01439
G3 X153.792 Y93.3 I-.023 J2.688 E.19346
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 36/72
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I-.986 J-.714 P1  F42000
G1 X148.136 Y99.451 Z3.9
G1 Z3.6
G1 E.8 F1800
G1 F2674
M204 S5000
G1 X148.087 Y99.145 E.00503
G1 X148.087 Y86.008 E.21333
G1 X148.17 Y85.482 E.00864
G1 X148.419 Y84.994 E.00891
G1 X148.807 Y84.606 E.00891
G1 X149.296 Y84.357 E.00891
G1 X149.821 Y84.274 E.00863
G1 X162.959 Y84.274 E.21333
G1 X163.484 Y84.357 E.00863
G1 X163.973 Y84.606 E.00891
G1 X164.361 Y84.994 E.00891
G1 X164.61 Y85.482 E.00891
G1 X164.693 Y86.008 E.00863
G1 X164.693 Y99.145 E.21333
G1 X164.61 Y99.671 E.00864
G1 X164.361 Y100.159 E.00891
G1 X163.973 Y100.547 E.00891
G1 X163.484 Y100.796 E.00891
G1 X162.959 Y100.879 E.00863
G1 X149.821 Y100.879 E.21333
G1 X149.296 Y100.796 E.00864
G1 X148.807 Y100.547 E.00891
G1 X148.419 Y100.159 E.00891
G1 X148.17 Y99.671 E.00891
G1 X148.145 Y99.511 E.00263
; WIPE_START
G1 F3600
M204 S6000
G1 X148.087 Y99.145 E-.14049
G1 X148.087 Y97.515 E-.61951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.876 Y92.54 Z4 F42000
G1 X164.002 Y83.838 Z4
G1 Z3.6
G1 E.8 F1800
G1 F2674
M204 S5000
G1 X164.49 Y84.087 E.0089
G1 X164.88 Y84.477 E.00896
G1 X165.13 Y84.968 E.00896
G1 X165.219 Y85.548 E.00952
G1 X165.219 Y99.605 E.22826
G1 X165.13 Y100.185 E.00952
G1 X164.88 Y100.676 E.00896
G1 X164.49 Y101.066 E.00896
G1 X163.998 Y101.317 E.00896
G1 X163.419 Y101.406 E.00952
G1 X149.361 Y101.406 E.22826
G1 X148.782 Y101.317 E.00952
G1 X148.29 Y101.066 E.00896
G1 X147.9 Y100.676 E.00896
G1 X147.65 Y100.185 E.00896
G1 X147.561 Y99.605 E.00952
G1 X147.561 Y85.548 E.22826
G1 X147.65 Y84.968 E.00952
G1 X147.9 Y84.477 E.00896
G1 X148.29 Y84.087 E.00896
G1 X148.782 Y83.836 E.00896
G1 X149.361 Y83.747 E.00952
G1 X163.419 Y83.747 E.22826
G1 X163.943 Y83.828 E.00861
; WIPE_START
G1 F3600
M204 S6000
G1 X164.49 Y84.087 E-.23005
G1 X164.88 Y84.477 E-.2096
G1 X165.13 Y84.968 E-.20962
G1 X165.175 Y85.256 E-.11073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 36 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer36 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.884 Y85.351 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231646
G1 F2674
M204 S6000
G1 X164.892 Y85.376 E.00022
; LINE_WIDTH: 0.193541
G3 X164.939 Y85.768 I-2.426 J.492 E.00277
; LINE_WIDTH: 0.151879
G1 X164.956 Y85.982 E.00114
; LINE_WIDTH: 0.134553
G1 X164.956 Y99.162 E.06073
G1 X164.939 Y99.385 E.00103
; LINE_WIDTH: 0.185666
G1 X164.922 Y99.6 E.00144
; LINE_WIDTH: 0.202939
G3 X164.892 Y99.777 I-1.136 J-.103 E.00133
; LINE_WIDTH: 0.231659
G1 X164.843 Y99.927 E.00134
; LINE_WIDTH: 0.280719
G1 X164.795 Y100.076 E.00166
; LINE_WIDTH: 0.324618
G3 X164.58 Y100.458 I-1.506 J-.594 E.00544
G1 X164.272 Y100.766 E.00538
G3 X164.16 Y100.843 I-.547 J-.676 E.00167
; LINE_WIDTH: 0.296903
G3 X163.74 Y101.029 I-.799 J-1.233 E.00518
; LINE_WIDTH: 0.231646
G1 X163.591 Y101.078 E.00134
; LINE_WIDTH: 0.19354
G3 X163.199 Y101.125 I-.492 J-2.426 E.00277
; LINE_WIDTH: 0.151879
G1 X162.984 Y101.142 E.00114
; LINE_WIDTH: 0.134553
G1 X149.805 Y101.143 E.06073
G1 X149.581 Y101.125 E.00103
; LINE_WIDTH: 0.185666
G1 X149.367 Y101.108 E.00144
; LINE_WIDTH: 0.202939
G3 X149.189 Y101.078 I.103 J-1.136 E.00133
; LINE_WIDTH: 0.231659
G1 X149.04 Y101.029 E.00134
; LINE_WIDTH: 0.280719
G1 X148.891 Y100.981 E.00166
; LINE_WIDTH: 0.324618
G3 X148.508 Y100.766 I.594 J-1.506 E.00544
G1 X148.2 Y100.458 E.00538
G3 X148.124 Y100.347 I.676 J-.547 E.00167
; LINE_WIDTH: 0.296903
G3 X147.937 Y99.927 I1.233 J-.799 E.00518
; LINE_WIDTH: 0.231646
G1 X147.889 Y99.777 E.00134
; LINE_WIDTH: 0.19354
G3 X147.841 Y99.385 I2.426 J-.492 E.00277
; LINE_WIDTH: 0.151879
G1 X147.824 Y99.171 E.00114
; LINE_WIDTH: 0.134271
G1 X147.824 Y85.982 E.06062
; LINE_WIDTH: 0.151862
G1 X147.841 Y85.768 E.00114
; LINE_WIDTH: 0.185666
G1 X147.858 Y85.553 E.00144
; LINE_WIDTH: 0.202939
G3 X147.889 Y85.376 I1.136 J.103 E.00133
; LINE_WIDTH: 0.231659
G1 X147.937 Y85.226 E.00134
; LINE_WIDTH: 0.280719
G1 X147.986 Y85.077 E.00166
; LINE_WIDTH: 0.324618
G3 X148.2 Y84.695 I1.506 J.594 E.00544
G1 X148.508 Y84.387 E.00538
G3 X148.62 Y84.31 I.547 J.676 E.00167
; LINE_WIDTH: 0.296903
G3 X149.04 Y84.123 I.799 J1.233 E.00518
; LINE_WIDTH: 0.231646
G1 X149.189 Y84.075 E.00134
; LINE_WIDTH: 0.19354
G3 X149.581 Y84.028 I.492 J2.426 E.00277
; LINE_WIDTH: 0.151879
G1 X149.796 Y84.011 E.00114
; LINE_WIDTH: 0.134553
G1 X162.975 Y84.01 E.06073
G1 X163.199 Y84.028 E.00103
; LINE_WIDTH: 0.185668
G1 X163.414 Y84.045 E.00144
; LINE_WIDTH: 0.20294
G3 X163.591 Y84.075 I-.103 J1.137 E.00133
; LINE_WIDTH: 0.231659
G1 X163.74 Y84.123 E.00134
; LINE_WIDTH: 0.280719
G1 X163.889 Y84.172 E.00166
; LINE_WIDTH: 0.324625
G3 X164.272 Y84.387 I-.593 J1.505 E.00544
G1 X164.58 Y84.695 E.00538
G3 X164.657 Y84.806 I-.676 J.547 E.00167
; LINE_WIDTH: 0.296901
G3 X164.843 Y85.226 I-1.233 J.799 E.00518
; LINE_WIDTH: 0.231646
G1 X164.865 Y85.294 E.00061
; WIPE_START
G1 F15000
G1 X164.892 Y85.376 E-.0327
G1 X164.939 Y85.768 E-.15011
G1 X164.956 Y85.982 E-.08185
G1 X164.956 Y87.286 E-.49534
; WIPE_END
M73 P84 R3
G1 E-.04 F1800
M204 S10000
G1 X157.881 Y90.149 Z4 F42000
G1 X155.092 Y91.278 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2674
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2674
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2674
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14981
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2674
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2674
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2674
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.41 Y89.89 I.837 J2.478 E.01447
G3 X153.792 Y93.3 I-.028 J2.688 E.19337
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.1019
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 37/72
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4 I-.983 J-.717 P1  F42000
G1 X148.091 Y99.456 Z4
G1 Z3.7
G1 E.8 F1800
G1 F2684
M204 S5000
G1 X148.044 Y99.164 E.00479
G1 X148.044 Y85.989 E.21395
G1 X148.129 Y85.456 E.00876
G1 X148.381 Y84.961 E.00903
G1 X148.745 Y84.597 E.00835
G1 X148.774 Y84.568 E.00068
G1 X149.27 Y84.315 E.00903
G1 X149.802 Y84.231 E.00875
G1 X162.978 Y84.231 E.21395
G1 X163.511 Y84.315 E.00875
G1 X164.006 Y84.567 E.00903
G1 X164.399 Y84.961 E.00903
G1 X164.651 Y85.456 E.00903
G1 X164.736 Y85.989 E.00875
G1 X164.736 Y99.164 E.21395
G1 X164.651 Y99.697 E.00876
G1 X164.399 Y100.193 E.00903
G1 X164.006 Y100.585 E.00902
G1 X163.511 Y100.838 E.00903
G1 X162.978 Y100.922 E.00875
G1 X149.802 Y100.922 E.21395
G1 X149.27 Y100.838 E.00876
G1 X148.774 Y100.585 E.00902
G1 X148.381 Y100.192 E.00903
G1 X148.129 Y99.697 E.00903
G1 X148.1 Y99.515 E.00299
; WIPE_START
G1 F3600
M204 S6000
G1 X148.044 Y99.164 E-.13483
G1 X148.044 Y97.519 E-.62517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.837 Y92.55 Z4.1 F42000
G1 X164.035 Y83.802 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F2684
M204 S5000
G1 X164.524 Y84.049 E.00889
G1 X164.917 Y84.443 E.00903
G1 X165.17 Y84.939 E.00904
G1 X165.26 Y85.523 E.0096
G1 X165.26 Y99.629 E.22905
G1 X165.17 Y100.214 E.0096
G1 X164.917 Y100.71 E.00904
G1 X164.524 Y101.104 E.00904
G1 X164.028 Y101.356 E.00904
G1 X163.443 Y101.446 E.00961
G1 X149.337 Y101.446 E.22905
G1 X148.752 Y101.356 E.0096
G1 X148.256 Y101.104 E.00904
G1 X147.863 Y100.71 E.00904
G1 X147.61 Y100.214 E.00904
G1 X147.52 Y99.629 E.00961
G1 X147.52 Y85.523 E.22905
G1 X147.61 Y84.939 E.0096
G1 X147.863 Y84.443 E.00904
G1 X148.256 Y84.049 E.00904
G1 X148.752 Y83.796 E.00904
G1 X149.337 Y83.707 E.00961
G1 X163.443 Y83.707 E.22905
G1 X163.977 Y83.789 E.00878
; WIPE_START
G1 F3600
M204 S6000
G1 X164.524 Y84.049 E-.23014
G1 X164.917 Y84.443 E-.21143
G1 X165.17 Y84.939 E-.21153
G1 X165.213 Y85.217 E-.10691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 37 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer37 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X164.92 Y85.312 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.230434
G1 F2684
M204 S6000
G1 X164.933 Y85.349 E.00034
; LINE_WIDTH: 0.191942
G3 X164.98 Y85.746 I-2.466 J.498 E.00278
; LINE_WIDTH: 0.149768
G1 X164.998 Y85.964 E.00114
; LINE_WIDTH: 0.13225
G1 X164.998 Y99.181 E.05966
G1 X164.98 Y99.407 E.00102
; LINE_WIDTH: 0.184014
G1 X164.963 Y99.624 E.00144
; LINE_WIDTH: 0.201484
G3 X164.933 Y99.804 I-1.15 J-.105 E.00134
; LINE_WIDTH: 0.230468
G1 X164.884 Y99.954 E.00135
; LINE_WIDTH: 0.280118
G1 X164.835 Y100.105 E.00167
; LINE_WIDTH: 0.324451
G3 X164.617 Y100.492 I-1.522 J-.6 E.0055
G1 X164.306 Y100.804 E.00544
G3 X164.193 Y100.881 I-.55 J-.68 E.00169
; LINE_WIDTH: 0.296425
G3 X163.768 Y101.07 I-.809 J-1.248 E.00524
; LINE_WIDTH: 0.230434
G1 X163.617 Y101.119 E.00135
; LINE_WIDTH: 0.191941
G3 X163.221 Y101.167 I-.498 J-2.466 E.00278
; LINE_WIDTH: 0.149768
G1 X163.003 Y101.184 E.00114
; LINE_WIDTH: 0.132249
G1 X149.786 Y101.184 E.05966
G1 X149.56 Y101.167 E.00102
; LINE_WIDTH: 0.184002
G1 X149.342 Y101.15 E.00144
; LINE_WIDTH: 0.20148
G3 X149.163 Y101.119 I.104 J-1.145 E.00134
; LINE_WIDTH: 0.230434
G1 X149.012 Y101.07 E.00135
; LINE_WIDTH: 0.280037
G1 X148.861 Y101.021 E.00167
; LINE_WIDTH: 0.324401
G3 X148.474 Y100.804 I.599 J-1.521 E.0055
G1 X148.163 Y100.492 E.00544
G3 X148.086 Y100.38 I.68 J-.55 E.00169
; LINE_WIDTH: 0.296422
G3 X147.897 Y99.954 I1.248 J-.809 E.00524
; LINE_WIDTH: 0.230421
G1 X147.848 Y99.803 E.00135
; LINE_WIDTH: 0.191941
G3 X147.8 Y99.407 I2.464 J-.498 E.00278
; LINE_WIDTH: 0.149768
G1 X147.783 Y99.189 E.00114
; LINE_WIDTH: 0.131961
G1 X147.783 Y85.964 E.05955
; LINE_WIDTH: 0.149762
G1 X147.8 Y85.746 E.00114
; LINE_WIDTH: 0.184006
G1 X147.817 Y85.529 E.00144
; LINE_WIDTH: 0.201493
G3 X147.848 Y85.349 I1.151 J.105 E.00134
; LINE_WIDTH: 0.230448
G1 X147.897 Y85.199 E.00135
; LINE_WIDTH: 0.280053
G1 X147.946 Y85.048 E.00167
; LINE_WIDTH: 0.324405
G3 X148.163 Y84.661 I1.519 J.598 E.0055
G1 X148.474 Y84.349 E.00544
G3 X148.587 Y84.272 I.55 J.68 E.00169
; LINE_WIDTH: 0.296425
G3 X149.012 Y84.083 I.809 J1.248 E.00524
; LINE_WIDTH: 0.230434
G1 X149.163 Y84.034 E.00135
; LINE_WIDTH: 0.191941
G3 X149.56 Y83.986 I.498 J2.466 E.00278
; LINE_WIDTH: 0.149768
G1 X149.777 Y83.969 E.00114
; LINE_WIDTH: 0.132249
G1 X162.994 Y83.969 E.05966
G1 X163.221 Y83.986 E.00102
; LINE_WIDTH: 0.183989
G1 X163.438 Y84.003 E.00144
; LINE_WIDTH: 0.201468
G3 X163.617 Y84.034 I-.104 J1.145 E.00133
; LINE_WIDTH: 0.230038
G1 X163.766 Y84.082 E.00133
; LINE_WIDTH: 0.278857
G1 X163.914 Y84.13 E.00164
; LINE_WIDTH: 0.323912
G3 X164.306 Y84.35 I-.602 J1.538 E.00556
G1 X164.617 Y84.661 E.00542
G3 X164.695 Y84.773 I-.681 J.551 E.00168
; LINE_WIDTH: 0.296428
G3 X164.884 Y85.199 I-1.248 J.809 E.00524
; LINE_WIDTH: 0.230434
G1 X164.902 Y85.255 E.0005
; WIPE_START
G1 F15000
G1 X164.933 Y85.349 E-.03783
G1 X164.98 Y85.746 E-.15178
G1 X164.998 Y85.964 E-.0829
G1 X164.998 Y87.246 E-.48749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.928 Y90.124 Z4.1 F42000
G1 X155.092 Y91.278 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2684
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.334 J2.585 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2684
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2684
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14978
G1 X158.286 Y91.278 E-.17438
G1 X157.749 Y91.278 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2684
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14976
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P85 R3
G1 X154.513 Y93.875 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2684
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2684
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.415 Y89.89 I.836 J2.477 E.01456
G3 X153.792 Y93.3 I-.034 J2.688 E.19328
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10186
G1 X153.967 Y91.409 E-.10195
G1 X153.997 Y91.354 E-.02383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; layer num/total_layer_count: 38/72
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S204
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.085 J1.214 P1  F42000
G1 X155.092 Y91.278 Z4.1
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.42 Y89.89 I.836 J2.476 E.01464
G3 X153.792 Y93.3 I-.039 J2.688 E.19319
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 38 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer38 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 39/72
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.426 Y89.89 I.836 J2.476 E.01473
G3 X153.791 Y93.3 I-.045 J2.688 E.1931
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.41 E-.10183
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 39 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer39 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 40/72
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.431 Y89.89 I.836 J2.476 E.01481
G3 X153.791 Y93.3 I-.05 J2.688 E.19301
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 40 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer40 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 41/72
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.342 J2.592 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
M73 P86 R3
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.436 Y89.89 I.836 J2.476 E.0149
G3 X153.791 Y93.3 I-.055 J2.688 E.19292
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 41 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer41 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 42/72
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.341 J2.591 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.754 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.441 Y89.891 I.836 J2.476 E.01499
G3 X153.791 Y93.3 I-.061 J2.687 E.19283
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 42 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer42 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 43/72
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.342 J2.592 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14981
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.447 Y89.891 I.836 J2.476 E.01507
G3 X153.791 Y93.3 I-.066 J2.687 E.19275
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 43 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer43 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 44/72
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
M73 P87 R3
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14981
G1 X158.286 Y91.278 E-.17435
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.452 Y89.891 I.836 J2.477 E.01516
G3 X153.791 Y93.3 I-.071 J2.687 E.19266
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 44 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P87 R2
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer44 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 45/72
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.59 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.457 Y89.891 I.836 J2.478 E.01524
G3 X153.791 Y93.3 I-.076 J2.687 E.19258
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 45 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer45 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 46/72
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
M73 P88 R2
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.462 Y89.891 I.837 J2.479 E.01533
G3 X153.791 Y93.3 I-.082 J2.687 E.19249
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 46 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer46 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 47/72
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.59 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06547
G3 X156.468 Y89.891 I.837 J2.48 E.01541
G3 X153.791 Y93.3 I-.087 J2.687 E.19241
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.41 E-.10183
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 47 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer47 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 48/72
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20274
G1 X154.55 Y93.922 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.473 Y89.891 I.837 J2.481 E.0155
G3 X153.792 Y93.3 I-.092 J2.687 E.19233
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.41 E-.10183
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 48 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer48 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 49/72
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P89 R2
G1 X157.689 Y91.278 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14982
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.478 Y89.891 I.838 J2.483 E.01558
G3 X153.792 Y93.3 I-.097 J2.686 E.19225
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 49 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer49 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 50/72
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.483 Y89.892 I.838 J2.485 E.01567
G3 X153.792 Y93.3 I-.102 J2.686 E.19217
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12478
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 50 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer50 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 51/72
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.333 J2.584 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.196 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06546
G3 X156.489 Y89.892 I.839 J2.486 E.01575
G3 X153.792 Y93.3 I-.107 J2.686 E.19209
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10183
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 51 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer51 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 52/72
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.59 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
M73 P90 R2
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06545
G3 X156.494 Y89.892 I.839 J2.489 E.01584
G3 X153.792 Y93.3 I-.112 J2.686 E.19201
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 52 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer52 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 53/72
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.341 J2.592 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.604 J-.665 E.06545
G3 X156.499 Y89.892 I.84 J2.491 E.01593
G3 X153.793 Y93.3 I-.117 J2.685 E.1919
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10185
G1 X153.997 Y91.354 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 53 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer53 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 54/72
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.2077
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P91 R2
G1 X157.689 Y93.875 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06544
G3 X156.504 Y89.892 I.841 J2.493 E.01601
G3 X153.793 Y93.3 I-.122 J2.685 E.19182
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10183
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.1019
G1 X153.997 Y91.354 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 54 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer54 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 55/72
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.755 J-3.194 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.533 Y90.027 I2.605 J-.664 E.06544
G3 X156.51 Y89.892 I.841 J2.496 E.0161
G3 X153.793 Y93.3 I-.127 J2.685 E.19175
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 55 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer55 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 56/72
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
M73 P91 R1
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06984
G3 X156.515 Y89.892 I.607 J2.842 E.01182
G3 X153.791 Y93.3 I-.135 J2.685 E.19161
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12479
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 56 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer56 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 57/72
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.1 F42000
G1 Z5.7
M73 P92 R1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.666 E.06983
G3 X156.52 Y89.892 I.608 J2.848 E.0119
G3 X153.792 Y93.3 I-.14 J2.684 E.19149
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10183
G1 X153.73 Y92.176 E-.10194
G1 X153.784 Y91.913 E-.10187
G1 X153.863 Y91.657 E-.10191
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 57 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer57 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 58/72
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.757 J-3.196 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20277
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06982
G3 X156.525 Y89.893 I.609 J2.854 E.01199
G3 X153.793 Y93.3 I-.144 J2.684 E.19142
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.657 E-.10191
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 58 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer58 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 59/72
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.336 J2.587 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
M73 P93 R1
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06981
G3 X156.531 Y89.893 I.61 J2.861 E.01208
G3 X153.793 Y93.3 I-.149 J2.684 E.19135
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12476
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.657 E-.10189
G1 X153.967 Y91.409 E-.1019
G1 X153.997 Y91.354 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 59 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer59 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 60/72
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.758 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.0698
G3 X156.536 Y89.893 I.611 J2.868 E.01216
G3 X153.794 Y93.299 I-.154 J2.683 E.19127
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12474
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.41 E-.10183
G1 X153.997 Y91.354 E-.02392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 60 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer60 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 61/72
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.331 J2.582 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14977
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.757 J-3.197 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20276
G1 X154.55 Y93.922 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.779 Y93.241 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X155.792 Y89.954 I2.604 J-.665 E.06979
G3 X156.541 Y89.893 I.612 J2.875 E.01225
G3 X153.794 Y93.299 I-.158 J2.683 E.1912
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12473
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10188
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.0239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 61 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer61 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 62/72
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.331 J2.582 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
M73 P94 R1
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.761 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.2028
G1 X154.55 Y93.922 E-.10421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.604 J-.666 E.07422
G3 X156.546 Y89.893 I.318 J2.443 E.00799
G3 X153.791 Y93.3 I-.166 J2.683 E.19107
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.1248
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.1019
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 62 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer62 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 63/72
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.17441
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.14979
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.759 J-3.198 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20275
G1 X154.55 Y93.922 E-.10426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.604 J-.666 E.0742
G3 X156.552 Y89.893 I.32 J2.469 E.00807
G3 X153.792 Y93.3 I-.171 J2.683 E.19103
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12477
G1 X153.704 Y92.71 E-.10192
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10186
G1 X153.967 Y91.409 E-.10195
G1 X153.997 Y91.354 E-.02384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 63 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer63 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 64/72
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.335 J2.585 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.17441
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17436
G1 X157.689 Y94.462 E-.14981
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.605 J-.666 E.07418
G3 X156.557 Y89.893 I.322 J2.495 E.00816
G3 X153.793 Y93.3 I-.175 J2.683 E.19098
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12474
G1 X153.704 Y92.71 E-.10194
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10186
G1 X153.967 Y91.409 E-.10195
G1 X153.997 Y91.354 E-.02385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 64 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer64 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 65/72
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.338 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
M73 P95 R1
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23209
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14976
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.756 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20274
G1 X154.55 Y93.922 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.778 Y93.242 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.605 J-.665 E.07416
G3 X156.562 Y89.894 I.324 J2.521 E.00824
G3 X153.794 Y93.299 I-.179 J2.683 E.19093
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12474
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10194
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.657 E-.10189
G1 X153.967 Y91.409 E-.10191
G1 X153.997 Y91.354 E-.02387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 65 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer65 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 66/72
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.332 J2.583 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17438
G1 X157.689 Y94.462 E-.1498
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20282
G1 X154.55 Y93.922 E-.10419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.78 Y93.241 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.605 J-.665 E.07414
G3 X156.567 Y89.894 I.325 J2.548 E.00833
G3 X153.795 Y93.299 I-.183 J2.682 E.19086
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12473
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10183
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10188
G1 X153.863 Y91.657 E-.10189
G1 X153.967 Y91.409 E-.10193
G1 X153.997 Y91.354 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 66 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer66 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 67/72
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
M73 P95 R0
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.1498
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.761 J-3.2 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
M73 P96 R0
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.2028
G1 X154.55 Y93.922 E-.10421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.777 Y93.242 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.323 Y89.888 I2.604 J-.667 E.07857
G1 X156.573 Y89.894 E.00405
G3 X153.792 Y93.3 I-.192 J2.681 E.19066
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12472
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10185
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10187
G1 X153.863 Y91.657 E-.10191
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.02391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 67 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer67 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 68/72
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.335 J2.586 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14976
G1 X158.286 Y91.278 E-.17441
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.764 J-3.203 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21352
G1 X155.092 Y94.485 E-.23947
G1 X154.722 Y94.124 E-.20269
G1 X154.55 Y93.922 E-.10432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.781 Y93.241 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.056 Y89.908 I2.604 J-.666 E.07413
G3 X156.568 Y89.894 I.326 J2.552 E.00834
G3 X153.796 Y93.299 I-.184 J2.682 E.19079
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.1247
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10187
G1 X153.863 Y91.656 E-.10193
G1 X153.967 Y91.41 E-.10184
G1 X153.997 Y91.354 E-.02395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 68 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer68 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 69/72
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.337 J2.588 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14977
G1 X158.286 Y91.278 E-.1744
G1 X157.749 Y91.278 E-.20771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17437
G1 X157.689 Y94.462 E-.1498
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.76 J-3.199 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21351
G1 X155.092 Y94.485 E-.23948
G1 X154.722 Y94.124 E-.2027
G1 X154.55 Y93.922 E-.10431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.776 Y93.242 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.323 Y89.888 I2.605 J-.666 E.07857
G1 X156.573 Y89.894 E.00406
G3 X153.792 Y93.3 I-.192 J2.682 E.1907
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10193
G1 X153.704 Y92.442 E-.10184
G1 X153.73 Y92.176 E-.10193
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.657 E-.10187
G1 X153.967 Y91.409 E-.10192
G1 X153.997 Y91.354 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 69 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer69 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 70/72
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.335 J2.585 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22813
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.2077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23207
G1 X157.979 Y94.206 E-.1744
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20375
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P97 R0
G1 X154.513 Y93.875 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.755 J-3.195 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.21353
G1 X155.092 Y94.485 E-.23946
G1 X154.722 Y94.124 E-.20271
G1 X154.55 Y93.922 E-.1043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.779 Y93.241 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.323 Y89.888 I2.605 J-.666 E.07852
G1 X156.578 Y89.894 E.00415
G3 X153.794 Y93.299 I-.195 J2.682 E.19067
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12473
G1 X153.704 Y92.71 E-.10189
G1 X153.704 Y92.442 E-.10186
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.10189
G1 X153.863 Y91.656 E-.10191
G1 X153.967 Y91.409 E-.10189
G1 X153.997 Y91.354 E-.0239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 70 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer70 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 71/72
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.092 Y91.278 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X154.513 Y91.278 E.01011
G3 X155.092 Y90.668 I3.339 J2.589 E.01471
G1 X155.092 Y91.218 E.0096
M204 S250
G1 X155.505 Y91.691 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y91.278 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X157.689 Y90.691 E.01025
G1 X157.979 Y90.947 E.00676
G1 X158.286 Y91.278 E.00787
G1 X157.749 Y91.278 E.00938
; WIPE_START
G1 F6000
G1 X157.689 Y90.691 E-.22812
G1 X157.979 Y90.947 E-.14979
G1 X158.286 Y91.278 E-.17437
G1 X157.749 Y91.278 E-.20772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.689 Y93.875 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X158.286 Y93.875 E.01043
G1 X157.979 Y94.206 E.00787
G1 X157.689 Y94.462 E.00676
G1 X157.689 Y93.935 E.0092
; WIPE_START
G1 F6000
G1 X158.286 Y93.875 E-.23208
G1 X157.979 Y94.206 E-.17441
G1 X157.689 Y94.462 E-.14977
G1 X157.689 Y93.935 E-.20374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.513 Y93.875 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X155.092 Y93.875 E.01011
G1 X155.092 Y94.485 E.01065
G3 X154.55 Y93.922 I2.762 J-3.201 E.01366
; WIPE_START
G1 F6000
G1 X155.092 Y93.875 E-.2135
G1 X155.092 Y94.485 E-.23949
G1 X154.722 Y94.124 E-.20274
G1 X154.55 Y93.922 E-.10427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.781 Y93.241 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X156.323 Y89.888 I2.605 J-.666 E.07847
G1 X156.584 Y89.894 E.00423
G3 X153.797 Y93.299 I-.197 J2.681 E.19062
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.12475
G1 X153.704 Y92.71 E-.10189
G1 X153.704 Y92.442 E-.10186
G1 X153.73 Y92.176 E-.10191
G1 X153.784 Y91.913 E-.10191
G1 X153.863 Y91.656 E-.10189
G1 X153.967 Y91.409 E-.10187
G1 X153.997 Y91.354 E-.02392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 71 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer71 end: 149
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 72/72
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.505 Y91.691 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X155.505 Y90.241 E.02355
G1 X157.275 Y90.241 E.02874
G1 X157.275 Y91.691 E.02355
G1 X158.725 Y91.691 E.02355
G1 X158.725 Y93.461 E.02874
G1 X157.275 Y93.461 E.02355
G1 X157.275 Y94.911 E.02355
G1 X155.505 Y94.911 E.02874
G1 X155.505 Y93.461 E.02355
G1 X154.055 Y93.461 E.02355
G1 X154.055 Y91.691 E.02874
G1 X155.445 Y91.691 E.02257
; WIPE_START
G1 F3600
M204 S6000
G1 X155.505 Y90.241 E-.55147
G1 X156.054 Y90.241 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.784 Y93.24 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G3 X156.323 Y89.888 I2.605 J-.665 E.07842
G1 X156.589 Y89.894 E.00431
G3 X153.799 Y93.298 I-.2 J2.681 E.1906
; WIPE_START
G1 F3600
M204 S6000
G1 X153.73 Y92.977 E-.1247
G1 X153.704 Y92.71 E-.10191
G1 X153.704 Y92.442 E-.10187
G1 X153.73 Y92.176 E-.10192
G1 X153.784 Y91.913 E-.1019
G1 X153.863 Y91.657 E-.10186
G1 X153.967 Y91.409 E-.10191
G1 X153.997 Y91.354 E-.02393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
M625
; object ids of layer 72 start: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer72 end: 149
M625
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X155.286 Y90.581 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X154.394 Y91.472 E.02047
; WIPE_START
G1 F3000
M204 S6000
G1 X155.286 Y90.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.044 Y90.511 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101214
G1 F1200
M204 S6000
G2 X154.324 Y91.23 I3.095 J3.817 E.00331
; WIPE_START
G1 F15000
G1 X154.6 Y90.916 E-.31184
G1 X155.044 Y90.511 E-.44816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.791 Y94.457 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X155.286 Y93.962 E.01136
G1 X155.004 Y93.681
G1 X154.51 Y94.174 E.01134
; WIPE_START
G1 F3000
M204 S6000
G1 X155.004 Y93.681 E-.29543
G1 X155.286 Y93.962 E-.1686
G1 X154.791 Y94.457 E-.29597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.386 Y93.681 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X157.494 Y94.572 E.02047
; WIPE_START
G1 F3000
M204 S6000
M73 P98 R0
G1 X158.386 Y93.681 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.461 Y93.917 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.090249
G1 F1200
M204 S6000
G3 X158.263 Y94.148 I-2.408 J-1.858 E.00085
; LINE_WIDTH: 0.114121
G3 X157.917 Y94.491 I-3.605 J-3.304 E.00184
; LINE_WIDTH: 0.0871639
G1 X157.73 Y94.649 E.00065
; WIPE_START
G1 F15000
G1 X157.917 Y94.491 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.272 Y90.977 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X157.776 Y91.472 E.01138
G1 X157.494 Y91.19
G1 X157.988 Y90.696 E.01135
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3000
M204 S6000
G1 X157.494 Y91.19 E-.29535
G1 X157.776 Y91.472 E-.16846
G1 X158.272 Y90.977 E-.29619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 149
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
G1 X0 Y128.74 F18000 ; move to safe pos
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

