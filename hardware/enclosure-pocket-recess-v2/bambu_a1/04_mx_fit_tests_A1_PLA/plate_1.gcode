; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 18m 37s; total estimated time: 25m 24s
; total layer number: 53
; total filament length [mm] : 956.52
; total filament volume [cm^3] : 2300.69
; total filament weight [g] : 2.85
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
M73 P0 R25
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
M73 P4 R24
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
M73 P5 R23
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F0.99635 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
M73 P6 R23
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
M73 P23 R19
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
M73 P24 R19
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
M73 P25 R18
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
M73 P26 R18
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
M73 P27 R18
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
M73 P28 R18
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
M73 P29 R18
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
M73 P29 R17
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
M73 P30 R17
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
M73 P31 R17
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
G1 X104.489 Y129.804 E.00907
G1 X125.977 Y129.804 E.41897
G3 X126.196 Y129.988 I.017 J.201 E.00619
G1 X126.196 Y152.008 E.42934
G3 X125.976 Y152.196 I-.204 J-.015 E.00626
G1 X104.016 Y152.196 E.42817
G3 X103.947 Y152.188 I-.011 J-.202 E.00136
G1 X103.943 Y152.186 E.00008
M204 S6000
M73 P32 R17
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
M73 P33 R17
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
M73 P33 R16
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
G1 X108.133 Y143.366 Z.5 F42000
G1 X124.086 Y109.714 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X124.065 Y109.955 E.00471
G1 X124.085 Y110.04 E.0017
G2 X124.081 Y110.623 I5.237 J.325 E.01139
G3 X124.081 Y114.466 I-394.702 J1.865 E.07493
G1 X124.084 Y118.414 E.07696
G2 X124.086 Y124.085 I989.254 J2.4 E.11058
G3 X122.907 Y124.083 I.125 J-415.129 E.02298
G2 X115.113 Y124.084 I-3.85 J852.544 E.15196
G2 X109.723 Y124.086 I-2.289 J936.635 E.1051
G3 X109.716 Y114.294 I1830.421 J-6.133 E.19091
G2 X109.714 Y109.724 I-548.798 J-2.04 E.0891
G3 X110.215 Y109.732 I.204 J2.96 E.00978
G3 X110.527 Y109.733 I.155 J.637 E.00615
G1 X110.64 Y109.716 E.00222
G2 X118.876 Y109.716 I4.173 J-1020.763 E.16059
G2 X124.026 Y109.714 I2.312 J-705.459 E.10041
M204 S6000
G1 X124.165 Y109.237 F42000
G1 F1500
M204 S500
G3 X124.562 Y109.768 I-.034 J.439 E.01462
G3 X124.549 Y110.518 I-182.336 J-2.642 E.01463
G3 X124.559 Y114.468 I-153.347 J2.367 E.07701
G1 X124.562 Y118.418 E.07703
G2 X124.565 Y124.111 I1063.175 J2.366 E.11099
G3 X124.117 Y124.564 I-.424 J.03 E.01404
G3 X122.947 Y124.562 I1.938 J-1115.001 E.02283
G2 X115.142 Y124.562 I-3.857 J819.368 E.15217
G3 X109.566 Y124.553 I-2.178 J-387.144 E.10872
G3 X109.247 Y124.179 I.073 J-.385 E.01037
G3 X109.238 Y114.294 I1492.652 J-6.357 E.19273
G3 X109.243 Y109.587 I512.176 J-1.816 E.09177
G3 X109.797 Y109.242 I.436 J.083 E.0143
G1 X109.835 Y109.243 E.00075
G2 X110.221 Y109.237 I.144 J-2.988 E.00752
G2 X110.604 Y109.237 I.194 J-2.583 E.00747
G2 X118.874 Y109.238 I4.193 J-1036.305 E.16126
G2 X124.105 Y109.237 I2.536 J-1165.374 E.102
M204 S6000
G1 X124.215 Y108.762 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X124.408 Y108.798 E.00382
G3 X125.041 Y109.784 I-.27 J.869 E.02481
G2 X125.038 Y114.469 I403.593 J2.577 E.09134
G1 X125.041 Y118.422 E.07709
G2 X125.043 Y124.118 I1146.762 J2.324 E.11105
G3 X124.121 Y125.043 I-.901 J.024 E.02849
G2 X115.171 Y125.041 I-4.653 J682.668 E.17449
G3 X109.562 Y125.037 I-2.368 J-688.989 E.10936
M73 P34 R16
G3 X108.766 Y124.125 I.09 J-.882 E.02598
G3 X108.759 Y114.293 I1849.945 J-6.306 E.1917
G3 X108.77 Y109.509 I228.371 J-1.879 E.09328
G3 X109.801 Y108.763 I.9 J.158 E.02745
G2 X118.872 Y108.759 I3.944 J-1348.384 E.17687
G2 X124.155 Y108.76 I2.776 J-1409.699 E.10301
; WIPE_START
G1 X124.408 Y108.798 E-.09701
G1 X124.564 Y108.861 E-.06413
G1 X124.737 Y108.979 E-.07948
G1 X124.843 Y109.09 E-.0582
G1 X124.941 Y109.24 E-.06841
G1 X125.012 Y109.423 E-.07445
G1 X125.04 Y109.598 E-.06722
G1 X125.041 Y109.784 E-.07073
G1 X125.04 Y110.259 E-.18039
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.892 Y110.923 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50474
G1 F2400
M204 S500
G1 X123.09 Y110.121 E.02233
G1 X122.407 Y110.122 E.01345
G1 X123.677 Y111.392 E.03535
G1 X123.677 Y112.075 E.01346
G1 X121.724 Y110.122 E.05438
G1 X121.041 Y110.123 E.01345
G1 X123.677 Y112.759 E.0734
G1 X123.677 Y113.442 E.01346
G1 X120.358 Y110.123 E.09242
G1 X119.675 Y110.124 E.01345
G1 X123.677 Y114.126 E.11144
G1 X123.677 Y114.81 E.01346
G1 X118.992 Y110.124 E.13046
G1 X118.309 Y110.125 E.01345
G1 X123.678 Y115.493 E.14949
G1 X123.678 Y116.177 E.01346
G1 X117.626 Y110.125 E.16851
G1 X116.943 Y110.126 E.01345
G1 X123.678 Y116.86 E.18753
G1 X123.678 Y117.544 E.01346
G1 X116.26 Y110.126 E.20655
G1 X115.577 Y110.127 E.01345
G1 X123.678 Y118.228 E.22558
G1 X123.678 Y118.911 E.01346
G1 X114.894 Y110.127 E.2446
G1 X114.212 Y110.128 E.01345
G1 X123.678 Y119.595 E.26362
G1 X123.678 Y120.278 E.01346
G1 X113.529 Y110.128 E.28264
G1 X112.846 Y110.129 E.01345
G1 X123.679 Y120.962 E.30166
G1 X123.679 Y121.646 E.01346
G1 X112.163 Y110.129 E.32069
G1 X111.48 Y110.13 E.01345
G1 X123.679 Y122.329 E.33971
G1 X123.679 Y123.013 E.01346
G1 X110.797 Y110.13 E.35873
G1 X110.121 Y110.131 E.0133
G1 X123.656 Y123.673 E.37701
G2 X122.964 Y123.665 I-.64 J24.247 E.01362
G1 X110.121 Y110.822 E.35763
G1 X110.122 Y111.506 E.01347
G1 X122.281 Y123.665 E.3386
G1 X121.599 Y123.666 E.01344
G1 X110.122 Y112.19 E.31958
G1 X110.123 Y112.874 E.01347
G1 X120.916 Y123.667 E.30056
G1 X120.233 Y123.668 E.01344
G1 X110.123 Y113.558 E.28153
G1 X110.124 Y114.241 E.01347
G1 X119.551 Y123.668 E.26251
G1 X118.868 Y123.669 E.01344
G1 X110.124 Y114.925 E.24349
G1 X110.124 Y115.609 E.01347
G1 X118.185 Y123.67 E.22447
G1 X117.502 Y123.671 E.01344
G1 X110.125 Y116.293 E.20544
G1 X110.125 Y116.977 E.01347
G1 X116.82 Y123.671 E.18642
G1 X116.137 Y123.672 E.01344
G1 X110.126 Y117.661 E.1674
G1 X110.126 Y118.345 E.01347
G1 X115.454 Y123.673 E.14838
G1 X114.772 Y123.674 E.01344
G1 X110.126 Y119.029 E.12935
G1 X110.127 Y119.712 E.01347
G1 X114.089 Y123.674 E.11033
G1 X113.406 Y123.675 E.01344
G1 X110.127 Y120.396 E.09131
G1 X110.128 Y121.08 E.01347
G1 X112.723 Y123.676 E.07228
G1 X112.041 Y123.677 E.01344
G1 X110.128 Y121.764 E.05326
G1 X110.128 Y122.448 E.01347
G1 X111.358 Y123.677 E.03424
G1 X110.675 Y123.678 E.01344
G1 X109.913 Y122.916 E.02122
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F2400
G1 X110.675 Y123.678 E-.40944
G1 X111.358 Y123.677 E-.25943
M73 P35 R16
G1 X111.188 Y123.508 E-.09113
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 2/53
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
G3 Z.5 I.04 J1.216 P1  F42000
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
M73 P36 R16
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
M73 P37 R16
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
M73 P37 R15
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
G1 X110.555 Y125.741 Z.6 F42000
G1 X124.169 Y109.358 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.444 Y109.679 I-.023 J.298 E.0082
G1 X124.443 Y113.765 E.07134
G2 X124.443 Y113.964 I1.428 J.099 E.00347
G1 X124.443 Y123.661 E.16932
G3 X124.439 Y124.196 I-172.314 J-1.081 E.00935
G3 X124.122 Y124.444 I-.298 J-.054 E.00769
G2 X118.872 Y124.443 I-2.846 J805.072 E.09166
G1 X109.631 Y124.442 E.16135
G3 X109.357 Y124.127 I.022 J-.296 E.00809
G1 X109.357 Y116.872 E.12668
G2 X109.357 Y116.614 I-2.045 J-.129 E.00451
G1 X109.356 Y109.68 E.12107
G3 X109.694 Y109.356 I.303 J-.022 E.00933
G2 X113.816 Y109.359 I2.969 J-1152.451 E.07196
G1 X124.109 Y109.358 E.17973
M204 S10000
G1 X124.201 Y108.93 F42000
G1 F6000
M204 S6000
G3 X124.873 Y109.671 I-.054 J.724 E.01925
G1 X124.872 Y113.773 E.07163
G2 X124.872 Y113.956 I1.315 J.091 E.0032
G1 X124.872 Y123.669 E.16959
G3 X124.858 Y124.29 I-2.921 J.244 E.01086
G3 X124.13 Y124.873 I-.713 J-.144 E.01767
G2 X118.875 Y124.871 I-2.854 J810.027 E.09176
G1 X109.67 Y124.873 E.16072
G3 X108.928 Y124.137 I-.013 J-.729 E.02033
G1 X108.928 Y116.867 E.12695
G2 X108.928 Y116.622 I-1.935 J-.122 E.00427
G1 X108.927 Y109.671 E.12137
G3 X109.688 Y108.928 I.728 J-.016 E.02082
G2 X113.816 Y108.931 I2.966 J-1135.431 E.07207
G1 X124.141 Y108.93 E.18029
M204 S250
G1 X124.265 Y108.522 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3060
M204 S5000
G1 X124.379 Y108.542 E.00187
G3 X124.627 Y108.619 I-.321 J1.467 E.00422
G1 F3120
G3 X124.838 Y108.748 I-.601 J1.228 E.00403
G1 F3060
G3 X125.072 Y108.989 I-.87 J1.078 E.00546
G1 F3120
G1 X125.129 Y109.074 E.00167
G1 F3060
G3 X125.286 Y109.663 I-1.133 J.618 E.00998
G1 X125.285 Y113.181 E.05713
G2 X125.285 Y123.077 I1028.022 J4.931 E.1607
G1 X125.285 Y123.677 E.00974
G1 F3120
G2 X125.286 Y124.139 I5.033 J.223 E.0075
G1 F3060
G3 X125.18 Y124.628 I-1.18 J.001 E.00819
G1 F3120
G3 X125.053 Y124.837 I-.947 J-.432 E.00398
G1 F3060
G3 X124.811 Y125.072 I-1.078 J-.867 E.00549
G1 F3120
G1 X124.726 Y125.129 E.00166
G1 F3060
G3 X124.138 Y125.286 I-.613 J-1.111 E.00999
G1 X123.071 Y125.283 E.01732
G1 F3120
G1 X122.471 Y125.282 E.00974
G1 F3060
G3 X110.262 Y125.285 I-6.479 J-1581.907 E.19825
G3 X109.422 Y125.262 I-.309 J-4.141 E.01368
G3 X109.174 Y125.181 I.228 J-1.115 E.00424
G1 F3120
G1 X109.059 Y125.12 E.00212
G1 F3060
G3 X108.515 Y124.147 I.624 J-.988 E.01886
G1 X108.515 Y117.462 E.10856
G2 X108.515 Y116.631 I-31.297 J-.415 E.01349
G1 X108.514 Y110.263 E.10341
G3 X108.532 Y109.455 I4.211 J-.312 E.01314
G3 X108.68 Y109.059 I1.431 J.311 E.00689
G1 F3120
G3 X108.844 Y108.851 I.897 J.539 E.00431
G1 F3060
G3 X108.989 Y108.728 I.626 J.588 E.00309
G1 F3120
G1 X109.074 Y108.671 E.00167
G1 F3060
G3 X109.682 Y108.514 I.619 J1.139 E.0103
G1 X110.558 Y108.518 E.01422
G1 F3120
G1 X111.028 Y108.515 E.00764
G1 F3060
G1 X113.216 Y108.517 E.03552
G2 X114.416 Y108.517 I.739 J-507.042 E.01949
G1 X123.539 Y108.514 E.14814
G3 X124.205 Y108.517 I.303 J8.633 E.01082
; WIPE_START
M204 S6000
G1 X124.379 Y108.542 E-.06652
G1 X124.627 Y108.619 E-.09868
G1 X124.838 Y108.748 E-.09414
G1 X124.952 Y108.848 E-.05746
G1 X125.072 Y108.989 E-.07037
G1 X125.129 Y109.074 E-.03911
G1 X125.244 Y109.347 E-.11256
G1 X125.286 Y109.663 E-.12084
G1 X125.286 Y109.927 E-.10031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.657 Y110.169 Z.6 F42000
G1 X109.528 Y110.427 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42104
G1 F15000
M204 S6000
G1 X110.247 Y109.708 E.01655
G1 X110.812 Y109.708 E.0092
G1 X109.708 Y110.812 E.02543
G1 X109.708 Y111.377 E.0092
G1 X111.377 Y109.708 E.03844
G1 X111.942 Y109.708 E.0092
G1 X109.708 Y111.943 E.05145
G1 X109.708 Y112.508 E.0092
G1 X112.507 Y109.708 E.06446
G1 X113.072 Y109.708 E.0092
G1 X109.708 Y113.073 E.07747
G1 X109.708 Y113.638 E.0092
G1 X113.637 Y109.708 E.09047
G1 X114.202 Y109.708 E.0092
G1 X109.708 Y114.203 E.10348
G1 X109.708 Y114.768 E.0092
G1 X114.767 Y109.708 E.11649
G1 X115.332 Y109.708 E.0092
G1 X109.708 Y115.333 E.1295
G1 X109.708 Y115.898 E.0092
G1 X115.897 Y109.708 E.14251
G1 X116.462 Y109.708 E.0092
G1 X109.708 Y116.463 E.15552
G1 X109.708 Y117.028 E.0092
G1 X117.027 Y109.709 E.16852
G1 X117.592 Y109.709 E.0092
G1 X109.708 Y117.593 E.18153
G1 X109.708 Y118.158 E.0092
G1 X118.157 Y109.709 E.19454
G1 X118.722 Y109.709 E.0092
G1 X109.708 Y118.723 E.20755
G1 X109.708 Y119.288 E.0092
G1 X119.287 Y109.709 E.22056
G1 X119.853 Y109.709 E.0092
G1 X109.708 Y119.853 E.23356
G1 X109.708 Y120.418 E.0092
G1 X120.418 Y109.709 E.24657
G1 X120.983 Y109.709 E.0092
G1 X109.708 Y120.983 E.25958
G1 X109.708 Y121.548 E.0092
G1 X121.548 Y109.709 E.27259
G1 X122.113 Y109.709 E.0092
G1 X109.708 Y122.113 E.2856
G1 X109.708 Y122.679 E.0092
G1 X122.678 Y109.709 E.2986
G1 X123.243 Y109.709 E.0092
G1 X109.708 Y123.244 E.31161
G1 X109.708 Y123.809 E.0092
G1 X123.808 Y109.709 E.32462
G1 X124.093 Y109.709 E.00464
G1 X124.093 Y109.99 E.00456
G1 X109.99 Y124.093 E.3247
G1 X110.555 Y124.093 E.0092
G1 X124.093 Y110.555 E.31169
G1 X124.093 Y111.12 E.0092
G1 X111.12 Y124.093 E.29868
G1 X111.685 Y124.093 E.0092
G1 X124.093 Y111.685 E.28567
G1 X124.093 Y112.25 E.0092
G1 X112.25 Y124.093 E.27266
G1 X112.815 Y124.093 E.0092
G1 X124.093 Y112.815 E.25965
G1 X124.092 Y113.38 E.0092
G1 X113.38 Y124.093 E.24664
G1 X113.945 Y124.093 E.0092
G1 X124.092 Y113.945 E.23363
G1 X124.092 Y114.51 E.0092
G1 X114.51 Y124.093 E.22062
G1 X115.075 Y124.093 E.0092
G1 X124.092 Y115.075 E.20761
G1 X124.092 Y115.641 E.0092
G1 X115.641 Y124.093 E.1946
G1 X116.206 Y124.093 E.0092
G1 X124.092 Y116.206 E.18159
G1 X124.092 Y116.771 E.0092
G1 X116.771 Y124.093 E.16857
G1 X117.336 Y124.093 E.0092
G1 X124.092 Y117.336 E.15556
G1 X124.092 Y117.901 E.0092
G1 X117.901 Y124.093 E.14255
G1 X118.466 Y124.093 E.0092
G1 X124.092 Y118.466 E.12954
G1 X124.092 Y119.031 E.0092
G1 X119.031 Y124.093 E.11653
G1 X119.596 Y124.093 E.0092
G1 X124.092 Y119.596 E.10352
G1 X124.092 Y120.161 E.0092
G1 X120.161 Y124.093 E.09051
G1 X120.726 Y124.093 E.0092
G1 X124.092 Y120.726 E.0775
G1 X124.092 Y121.292 E.0092
G1 X121.291 Y124.093 E.06449
G1 X121.857 Y124.093 E.0092
G1 X124.092 Y121.857 E.05148
G1 X124.092 Y122.422 E.0092
G1 X122.422 Y124.092 E.03847
G1 X122.987 Y124.092 E.0092
G1 X124.092 Y122.987 E.02546
G1 X124.092 Y123.552 E.0092
G1 X123.372 Y124.272 E.01657
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.092 Y123.552 E-.38686
G1 X124.092 Y122.987 E-.21474
G1 X123.798 Y123.282 E-.1584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 3/53
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.049 J1.216 P1  F42000
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
M73 P38 R15
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
M73 P39 R15
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
G1 X110.555 Y125.741 Z.7 F42000
G1 X124.22 Y109.297 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.511 Y109.655 I-.071 J.355 E.00874
G1 X124.507 Y124.197 E.25391
G3 X124.145 Y124.511 I-.361 J-.051 E.00913
G1 X109.581 Y124.504 E.2543
G3 X109.289 Y124.143 I.071 J-.355 E.00878
G1 X109.289 Y109.667 E.25275
G3 X109.68 Y109.289 I.365 J-.014 E.01072
G1 X117.14 Y109.289 E.13024
G1 X124.16 Y109.296 E.12257
M204 S10000
G1 X124.238 Y108.87 F42000
G1 F6000
M204 S6000
G1 X124.311 Y108.879 E.00128
G3 X124.939 Y109.647 I-.169 J.779 E.01871
G1 X124.94 Y124.14 E.25305
M73 P40 R15
G3 X124.153 Y124.939 I-.798 J.001 E.02171
G1 X109.66 Y124.94 E.25305
G3 X108.861 Y124.151 I-.002 J-.797 E.02174
G1 X108.86 Y109.66 E.25302
G3 X109.672 Y108.86 I.792 J-.007 E.02219
G1 X117.141 Y108.861 E.13041
G1 X124.153 Y108.861 E.12243
G1 X124.178 Y108.863 E.00044
M204 S250
G1 X124.28 Y108.455 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.307 Y108.458 E.00045
G3 X124.852 Y108.673 I-.166 J1.221 E.0096
G1 X124.956 Y108.757 E.00218
G1 X125.04 Y108.84 E.00192
G1 X125.103 Y108.916 E.00161
G1 X125.161 Y108.998 E.00163
G1 X125.222 Y109.103 E.00197
G3 X125.353 Y109.64 I-1.202 J.578 E.00904
G1 X125.353 Y110.24 E.00974
G1 X125.353 Y123.547 E.21609
G3 X125.327 Y124.399 I-4.156 J.3 E.01386
G3 X125.127 Y124.852 I-1.518 J-.4 E.00807
G1 X125.043 Y124.956 E.00217
G1 X124.96 Y125.04 E.00192
G1 X124.884 Y125.103 E.00161
G1 X124.802 Y125.161 E.00163
G1 X124.697 Y125.222 E.00197
G1 X124.589 Y125.27 E.00192
G1 X124.486 Y125.306 E.00178
G3 X124.16 Y125.353 I-.386 J-1.52 E.00535
G1 X110.253 Y125.353 E.22583
G3 X109.402 Y125.327 I-.3 J-4.169 E.01384
G3 X108.95 Y125.129 I.399 J-1.519 E.00805
G1 X108.846 Y125.045 E.00217
G1 X108.762 Y124.962 E.00191
G1 X108.698 Y124.886 E.00162
G3 X108.447 Y124.159 I1.041 J-.766 E.01268
G1 X108.447 Y110.253 E.22581
G3 X108.463 Y109.456 I4.439 J-.31 E.01295
G3 X108.827 Y108.772 I1.207 J.204 E.01281
G1 X108.909 Y108.702 E.00176
G1 X108.998 Y108.639 E.00177
G1 X109.103 Y108.578 E.00196
G3 X109.664 Y108.447 I.558 J1.118 E.00944
G1 X117.142 Y108.447 E.12143
G1 X118.083 Y108.449 E.01529
G2 X118.752 Y108.447 I.314 J-6.809 E.01087
G1 X123.56 Y108.447 E.07807
G1 X124.16 Y108.447 E.00974
G1 X124.22 Y108.451 E.00097
; WIPE_START
M204 S6000
G1 X124.307 Y108.458 E-.03322
G1 X124.524 Y108.506 E-.08446
G1 X124.747 Y108.605 E-.09276
G1 X124.852 Y108.673 E-.04725
G1 X124.956 Y108.757 E-.05093
G1 X125.04 Y108.84 E-.04485
G1 X125.103 Y108.916 E-.03758
G1 X125.161 Y108.998 E-.03819
G1 X125.222 Y109.103 E-.04608
G1 X125.306 Y109.314 E-.08642
G1 X125.353 Y109.64 E-.12493
G1 X125.353 Y109.833 E-.07334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.339 Y110.401 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42372
G1 F15000
M204 S6000
G1 X123.578 Y109.641 E.01762
G1 X123.01 Y109.641 E.00932
G1 X124.159 Y110.79 E.02665
G1 X124.159 Y111.359 E.00932
G1 X122.441 Y109.641 E.03983
G1 X121.872 Y109.641 E.00932
G1 X124.159 Y111.928 E.05302
G1 X124.159 Y112.497 E.00932
G1 X121.303 Y109.641 E.0662
G1 X120.734 Y109.641 E.00932
G1 X124.159 Y113.066 E.07939
G1 X124.159 Y113.635 E.00932
G1 X120.165 Y109.641 E.09258
G1 X119.596 Y109.641 E.00932
G1 X124.159 Y114.204 E.10576
G1 X124.159 Y114.773 E.00932
G1 X119.027 Y109.641 E.11895
G1 X118.459 Y109.641 E.00932
G1 X124.159 Y115.342 E.13213
G1 X124.159 Y115.91 E.00932
G1 X117.89 Y109.641 E.14532
G1 X117.321 Y109.641 E.00932
G1 X124.159 Y116.479 E.1585
G1 X124.159 Y117.048 E.00932
G1 X116.752 Y109.641 E.17169
G1 X116.183 Y109.641 E.00932
G1 X124.159 Y117.617 E.18488
G1 X124.159 Y118.186 E.00932
G1 X115.614 Y109.641 E.19806
G1 X115.045 Y109.641 E.00932
G1 X124.159 Y118.755 E.21125
G1 X124.159 Y119.324 E.00932
G1 X114.476 Y109.641 E.22444
G1 X113.907 Y109.641 E.00932
G1 X124.159 Y119.893 E.23762
G1 X124.159 Y120.462 E.00932
G1 X113.338 Y109.641 E.25081
G1 X112.77 Y109.641 E.00932
G1 X124.159 Y121.031 E.264
G1 X124.159 Y121.599 E.00932
G1 X112.201 Y109.641 E.27718
G1 X111.632 Y109.641 E.00932
G1 X124.159 Y122.168 E.29037
G1 X124.16 Y122.737 E.00932
G1 X111.063 Y109.641 E.30356
G1 X110.494 Y109.641 E.00932
G1 X124.16 Y123.306 E.31674
G1 X124.16 Y123.875 E.00932
G1 X109.925 Y109.64 E.32993
G2 X109.652 Y109.646 I-.112 J1.155 E.00449
G2 X109.641 Y109.925 I.684 J.167 E.0046
G1 X123.875 Y124.159 E.32993
G1 X123.306 Y124.159 E.00932
G1 X109.641 Y110.494 E.31674
G1 X109.641 Y111.063 E.00932
G1 X122.737 Y124.159 E.30356
G1 X122.168 Y124.159 E.00932
G1 X109.641 Y111.632 E.29037
G1 X109.641 Y112.2 E.00932
G1 X121.599 Y124.159 E.27719
G1 X121.031 Y124.159 E.00932
G1 X109.641 Y112.769 E.264
G1 X109.641 Y113.338 E.00932
G1 X120.462 Y124.159 E.25081
G1 X119.893 Y124.159 E.00932
G1 X109.641 Y113.907 E.23763
G1 X109.641 Y114.476 E.00932
G1 X119.324 Y124.159 E.22444
G1 X118.755 Y124.159 E.00932
G1 X109.641 Y115.045 E.21126
G1 X109.641 Y115.614 E.00932
G1 X118.186 Y124.159 E.19807
G1 X117.617 Y124.159 E.00932
G1 X109.641 Y116.183 E.18488
G1 X109.641 Y116.752 E.00932
G1 X117.048 Y124.159 E.1717
G1 X116.48 Y124.159 E.00932
G1 X109.641 Y117.321 E.15851
G1 X109.641 Y117.889 E.00932
G1 X115.911 Y124.159 E.14533
G1 X115.342 Y124.159 E.00932
G1 X109.641 Y118.458 E.13214
G1 X109.641 Y119.027 E.00932
G1 X114.773 Y124.159 E.11896
G1 X114.204 Y124.159 E.00932
G1 X109.641 Y119.596 E.10577
G1 X109.641 Y120.165 E.00932
G1 X113.635 Y124.159 E.09258
G1 X113.066 Y124.159 E.00932
G1 X109.641 Y120.734 E.0794
G1 X109.641 Y121.303 E.00932
G1 X112.498 Y124.159 E.06621
G1 X111.929 Y124.159 E.00932
G1 X109.641 Y121.872 E.05303
G1 X109.641 Y122.441 E.00932
G1 X111.36 Y124.16 E.03984
G1 X110.791 Y124.16 E.00932
G1 X109.641 Y123.01 E.02665
G1 X109.641 Y123.578 E.00932
G1 X110.401 Y124.339 E.01763
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.641 Y123.578 E-.40865
G1 X109.641 Y123.01 E-.21618
G1 X109.892 Y123.261 E-.13517
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 4/53
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
M73 P41 R14
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
M73 P42 R14
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
G1 X123.812 Y138.857 Z.8 F42000
G1 X124.196 Y109.256 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X124.547 Y109.658 I-.044 J.393 E.01023
G1 X124.546 Y124.163 E.25326
G3 X124.142 Y124.547 I-.391 J-.007 E.01084
G1 X109.637 Y124.546 E.25326
G3 X109.253 Y124.133 I.007 J-.392 E.011
G1 X109.254 Y109.637 E.2531
G3 X109.637 Y109.254 I.393 J.01 E.01043
G1 X124.136 Y109.256 E.25317
M204 S10000
G1 X124.238 Y108.829 F42000
G1 F6000
M204 S6000
G3 X124.976 Y109.651 I-.091 J.824 E.02111
G1 X124.975 Y124.181 E.25369
G3 X124.149 Y124.976 I-.819 J-.025 E.02217
G1 X109.62 Y124.975 E.25369
G3 X108.824 Y124.144 I.025 J-.819 E.02226
G1 X108.825 Y109.619 E.2536
G3 X109.619 Y108.825 I.826 J.032 E.02156
G1 X124.178 Y108.829 E.25419
M204 S250
G1 X124.298 Y108.422 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.628 Y108.509 E.00555
G3 X124.907 Y108.665 I-.511 J1.238 E.0052
G1 X124.91 Y108.667 E.00006
G3 X125.389 Y109.644 I-.806 J1.001 E.01825
G1 X125.388 Y124.197 E.23631
G3 X125.135 Y124.907 I-1.259 J-.049 E.01243
G1 X125.133 Y124.91 E.00005
G3 X124.156 Y125.389 I-1.001 J-.806 E.01825
G1 X109.603 Y125.388 E.23631
G3 X108.895 Y125.137 I.042 J-1.239 E.01239
G1 X108.893 Y125.135 E.00005
G3 X108.411 Y124.154 I.784 J-.994 E.01836
G1 X108.412 Y109.603 E.23628
G3 X108.665 Y108.893 I1.259 J.049 E.01243
G1 X108.667 Y108.89 E.00006
G3 X109.603 Y108.412 I.981 J.765 E.01761
G1 X124.238 Y108.417 E.23765
; WIPE_START
M204 S6000
G1 X124.628 Y108.509 E-.15234
G1 X124.907 Y108.665 E-.1215
G1 X124.91 Y108.667 E-.00137
G1 X125.084 Y108.83 E-.09037
G1 X125.262 Y109.097 E-.12229
G1 X125.348 Y109.325 E-.09222
G1 X125.389 Y109.644 E-.12248
G1 X125.389 Y109.795 E-.05744
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.762 Y110.077 Z.8 F42000
G1 X109.426 Y110.385 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42522
G1 F15000
M204 S6000
G1 X110.205 Y109.605 E.01813
G1 X110.776 Y109.605 E.00939
G1 X109.605 Y110.776 E.02724
G1 X109.605 Y111.347 E.00939
G1 X111.347 Y109.606 E.04052
G1 X111.918 Y109.606 E.00939
G1 X109.605 Y111.918 E.05381
G1 X109.605 Y112.489 E.00939
G1 X112.489 Y109.606 E.06709
G1 X113.06 Y109.606 E.00939
G1 X109.605 Y113.06 E.08037
G1 X109.605 Y113.631 E.00939
G1 X113.631 Y109.606 E.09365
G1 X114.202 Y109.606 E.00939
G1 X109.605 Y114.203 E.10694
G1 X109.605 Y114.774 E.00939
G1 X114.772 Y109.606 E.12022
G1 X115.343 Y109.606 E.00939
G1 X109.605 Y115.345 E.1335
G1 X109.605 Y115.916 E.00939
G1 X115.914 Y109.606 E.14679
G1 X116.485 Y109.606 E.00939
G1 X109.605 Y116.487 E.16007
G1 X109.605 Y117.058 E.00939
G1 X117.056 Y109.606 E.17335
G1 X117.627 Y109.606 E.00939
G1 X109.605 Y117.629 E.18664
G1 X109.605 Y118.2 E.00939
G1 X118.198 Y109.607 E.19992
G1 X118.769 Y109.607 E.00939
G1 X109.605 Y118.771 E.2132
G1 X109.605 Y119.342 E.00939
G1 X119.34 Y109.607 E.22648
G1 X119.911 Y109.607 E.00939
G1 X109.605 Y119.913 E.23977
G1 X109.605 Y120.484 E.00939
G1 X120.482 Y109.607 E.25305
G1 X121.053 Y109.607 E.00939
G1 X109.605 Y121.055 E.26633
G1 X109.605 Y121.626 E.00939
G1 X121.623 Y109.607 E.27962
G1 X122.194 Y109.607 E.00939
G1 X109.605 Y122.197 E.2929
G1 X109.605 Y122.768 E.00939
G1 X122.765 Y109.607 E.30618
G1 X123.336 Y109.607 E.00939
G1 X109.605 Y123.339 E.31946
G1 X109.604 Y123.91 E.00939
G1 X123.907 Y109.607 E.33275
G1 X124.151 Y109.607 E.00402
G3 X124.184 Y109.626 I-.006 J.049 E.00063
G3 X124.196 Y109.89 I-.703 J.164 E.00438
G1 X109.891 Y124.195 E.3328
G1 X110.462 Y124.195 E.00939
G1 X124.196 Y110.461 E.31951
G1 X124.195 Y111.032 E.00939
G1 X111.033 Y124.195 E.30623
G1 X111.604 Y124.195 E.00939
G1 X124.195 Y111.603 E.29294
G1 X124.195 Y112.174 E.00939
G1 X112.175 Y124.195 E.27966
G1 X112.746 Y124.195 E.00939
G1 X124.195 Y112.745 E.26637
G1 X124.195 Y113.316 E.00939
G1 X113.317 Y124.195 E.25309
G1 X113.888 Y124.195 E.00939
G1 X124.195 Y113.887 E.23981
G1 X124.195 Y114.458 E.00939
G1 X114.459 Y124.195 E.22652
G1 X115.03 Y124.195 E.00939
G1 X124.195 Y115.029 E.21324
G1 X124.195 Y115.6 E.00939
G1 X115.601 Y124.195 E.19995
G1 X116.171 Y124.195 E.00939
G1 X124.195 Y116.171 E.18667
G1 X124.195 Y116.742 E.00939
G1 X116.742 Y124.195 E.17339
G1 X117.313 Y124.195 E.00939
G1 X124.195 Y117.313 E.1601
G1 X124.195 Y117.885 E.00939
G1 X117.884 Y124.195 E.14682
G1 X118.455 Y124.195 E.00939
G1 X124.195 Y118.456 E.13353
G1 X124.195 Y119.027 E.00939
G1 X119.026 Y124.195 E.12025
G1 X119.597 Y124.195 E.00939
G1 X124.195 Y119.598 E.10696
G1 X124.195 Y120.169 E.00939
G1 X120.168 Y124.195 E.09368
G1 X120.739 Y124.195 E.00939
G1 X124.195 Y120.74 E.0804
G1 X124.195 Y121.311 E.00939
G1 X121.31 Y124.195 E.06711
G1 X121.881 Y124.195 E.00939
G1 X124.195 Y121.882 E.05383
G1 X124.195 Y122.453 E.00939
G1 X122.452 Y124.195 E.04054
G1 X123.023 Y124.195 E.00939
G1 X124.195 Y123.024 E.02726
G1 X124.195 Y123.595 E.00939
G1 X123.415 Y124.375 E.01815
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.195 Y123.595 E-.41918
G1 X124.195 Y123.024 E-.21699
G1 X123.964 Y123.254 E-.12383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 5/53
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.048 J1.216 P1  F42000
G1 X149.102 Y122.26 Z.8
G1 Z.5
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
M73 P43 R14
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
M73 P44 R14
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
G1 X124.194 Y143.667 Z.9 F42000
G1 X124.214 Y109.228 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G3 X124.575 Y109.642 I-.046 J.404 E.01053
G1 X124.574 Y124.182 E.25387
G3 X124.151 Y124.575 I-.403 J-.009 E.01126
G1 X109.618 Y124.574 E.25374
G3 X109.225 Y124.149 I.009 J-.403 E.01128
G1 X109.226 Y109.618 E.25372
G3 X109.618 Y109.226 I.404 J.012 E.01068
G1 X124.154 Y109.228 E.2538
M204 S10000
G1 X124.256 Y108.801 F42000
G1 F6000
M204 S6000
G3 X125.004 Y109.635 I-.092 J.835 E.0214
G1 X125.003 Y124.199 E.25431
G3 X124.161 Y125.004 I-.831 J-.027 E.02253
G1 X109.601 Y125.003 E.25423
G3 X108.796 Y124.16 I.027 J-.831 E.02254
G1 X108.797 Y109.601 E.25422
G3 X109.601 Y108.797 I.838 J.034 E.0218
G1 X124.196 Y108.801 E.25484
M204 S250
G1 X124.308 Y108.391 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.535 Y108.439 E.00376
G3 X125.417 Y109.627 I-.376 J1.201 E.0257
G1 X125.417 Y124.216 E.2369
G3 X124.171 Y125.417 I-1.244 J-.044 E.03106
G1 X109.584 Y125.417 E.23687
G3 X108.383 Y124.171 I.044 J-1.244 E.03106
G1 X108.384 Y109.584 E.23687
G3 X109.584 Y108.384 I1.256 J.056 E.03025
G1 X124.248 Y108.389 E.23812
; WIPE_START
M204 S6000
G1 X124.535 Y108.439 E-.11054
G1 X124.763 Y108.53 E-.09347
G1 X124.932 Y108.64 E-.07666
G1 X125.11 Y108.806 E-.09241
G1 X125.23 Y108.968 E-.07648
G1 X125.338 Y109.187 E-.09288
G1 X125.401 Y109.423 E-.09267
G1 X125.417 Y109.627 E-.07813
M73 P44 R13
G1 X125.417 Y109.751 E-.04677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.403 Y109.794 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42657
G1 F15000
M204 S6000
G1 X124.202 Y109.592 E.00469
G1 X124.16 Y109.579 E.00073
G1 X123.616 Y109.579 E.00898
G1 X124.224 Y110.187 E.01419
G1 X124.224 Y110.76 E.00946
M73 P45 R13
G1 X123.043 Y109.579 E.02757
G1 X122.47 Y109.579 E.00946
G1 X124.224 Y111.333 E.04094
G1 X124.224 Y111.906 E.00946
G1 X121.897 Y109.579 E.05431
G1 X121.324 Y109.579 E.00946
G1 X124.224 Y112.479 E.06769
G1 X124.224 Y113.051 E.00946
G1 X120.751 Y109.579 E.08106
G1 X120.178 Y109.579 E.00946
G1 X124.224 Y113.624 E.09444
G1 X124.224 Y114.197 E.00946
G1 X119.605 Y109.579 E.10781
G1 X119.032 Y109.578 E.00946
G1 X124.224 Y114.77 E.12119
G1 X124.223 Y115.343 E.00946
G1 X118.459 Y109.578 E.13456
G1 X117.886 Y109.578 E.00946
G1 X124.223 Y115.916 E.14793
G1 X124.223 Y116.489 E.00946
G1 X117.313 Y109.578 E.16131
G1 X116.74 Y109.578 E.00946
G1 X124.223 Y117.062 E.17468
G1 X124.223 Y117.635 E.00946
G1 X116.167 Y109.578 E.18806
G1 X115.594 Y109.578 E.00946
G1 X124.223 Y118.207 E.20143
G1 X124.223 Y118.78 E.00946
G1 X115.021 Y109.578 E.21481
G1 X114.448 Y109.578 E.00946
G1 X124.223 Y119.353 E.22818
G1 X124.223 Y119.926 E.00946
G1 X113.875 Y109.578 E.24156
G1 X113.302 Y109.578 E.00946
G1 X124.223 Y120.499 E.25493
G1 X124.223 Y121.072 E.00946
G1 X112.729 Y109.578 E.2683
G1 X112.156 Y109.577 E.00946
G1 X124.223 Y121.645 E.28168
G1 X124.223 Y122.218 E.00946
G1 X111.583 Y109.577 E.29505
G1 X111.01 Y109.577 E.00946
G1 X124.223 Y122.79 E.30843
G1 X124.223 Y123.363 E.00946
G1 X110.437 Y109.577 E.3218
G1 X109.864 Y109.577 E.00946
G1 X124.223 Y123.936 E.33518
G3 X124.21 Y124.197 I-.525 J.105 E.00435
G3 X124.123 Y124.224 I-.073 J-.08 E.00156
G1 X123.938 Y124.224 E.00306
G1 X109.577 Y109.863 E.33522
G1 X109.577 Y110.436 E.00946
G1 X123.365 Y124.224 E.32184
G1 X122.792 Y124.224 E.00946
G1 X109.577 Y111.009 E.30847
G1 X109.577 Y111.582 E.00946
G1 X122.219 Y124.224 E.2951
G1 X121.646 Y124.224 E.00946
G1 X109.577 Y112.155 E.28172
G1 X109.577 Y112.728 E.00946
G1 X121.073 Y124.224 E.26835
G1 X120.5 Y124.224 E.00946
G1 X109.577 Y113.3 E.25498
G1 X109.577 Y113.873 E.00946
G1 X119.927 Y124.224 E.2416
G1 X119.354 Y124.224 E.00946
G1 X109.577 Y114.446 E.22823
G1 X109.577 Y115.019 E.00946
G1 X118.781 Y124.224 E.21486
G1 X118.208 Y124.223 E.00946
G1 X109.577 Y115.592 E.20148
G1 X109.577 Y116.165 E.00946
G1 X117.635 Y124.223 E.18811
G1 X117.062 Y124.223 E.00946
G1 X109.577 Y116.738 E.17474
G1 X109.577 Y117.311 E.00946
G1 X116.489 Y124.223 E.16136
G1 X115.916 Y124.223 E.00946
G1 X109.577 Y117.883 E.14799
G1 X109.577 Y118.456 E.00946
G1 X115.344 Y124.223 E.13462
G1 X114.771 Y124.223 E.00946
G1 X109.576 Y119.029 E.12124
G1 X109.576 Y119.602 E.00946
G1 X114.198 Y124.223 E.10787
G1 X113.625 Y124.223 E.00946
G1 X109.576 Y120.175 E.0945
G1 X109.576 Y120.748 E.00946
G1 X113.052 Y124.223 E.08112
G1 X112.479 Y124.223 E.00946
G1 X109.576 Y121.321 E.06775
G1 X109.576 Y121.894 E.00946
G1 X111.906 Y124.223 E.05438
G1 X111.333 Y124.223 E.00946
G1 X109.576 Y122.466 E.041
G1 X109.576 Y123.039 E.00946
G1 X110.76 Y124.223 E.02763
G1 X110.187 Y124.223 E.00946
G1 X109.397 Y123.433 E.01844
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X110.187 Y124.223 E-.42463
G1 X110.76 Y124.223 E-.21772
G1 X110.541 Y124.004 E-.11765
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 6/53
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S186.15
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I.055 J1.216 P1  F42000
G1 X149.102 Y122.26 Z.9
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
M73 P46 R13
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
M73 P47 R13
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
G1 X124.339 Y124.021 Z1 F42000
G1 X124.232 Y109.2 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.604 Y109.625 I-.047 J.416 E.01083
G1 X124.603 Y124.201 E.25449
G3 X124.168 Y124.604 I-.414 J-.011 E.01154
G1 X109.535 Y124.596 E.25549
G3 X109.196 Y124.166 I.076 J-.408 E.01044
G1 X109.197 Y109.599 E.25433
G3 X109.599 Y109.197 I.415 J.014 E.01093
G1 X124.172 Y109.2 E.25445
M204 S10000
G1 X124.275 Y108.773 F42000
G1 F6000
M204 S6000
G3 X125.032 Y109.618 I-.094 J.846 E.02169
G1 X125.031 Y124.219 E.25493
G3 X124.178 Y125.032 I-.842 J-.029 E.0228
G1 X109.582 Y125.031 E.25486
G3 X108.768 Y124.177 I.029 J-.842 E.02282
G1 X108.769 Y109.582 E.25484
G3 X109.581 Y108.769 I.849 J.036 E.02204
G1 X124.215 Y108.773 E.2555
M204 S250
G1 X124.303 Y108.361 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.315 Y108.361 E.00019
G3 X125.446 Y109.61 I-.14 J1.262 E.02992
G1 X125.445 Y124.236 E.23748
G3 X124.188 Y125.446 I-1.256 J-.046 E.03131
G1 X109.565 Y125.445 E.23746
G3 X108.354 Y124.188 I.046 J-1.256 E.03132
G1 X108.355 Y109.564 E.23746
G3 X109.564 Y108.355 I1.267 J.058 E.03047
G1 X124.243 Y108.361 E.23836
; WIPE_START
M204 S6000
G1 X124.315 Y108.361 E-.02734
G1 X124.556 Y108.408 E-.09332
G1 X124.786 Y108.504 E-.09445
G1 X124.956 Y108.614 E-.07717
G1 X125.135 Y108.782 E-.09334
G1 X125.256 Y108.945 E-.07704
G1 X125.365 Y109.165 E-.09317
G1 X125.429 Y109.403 E-.09366
G1 X125.446 Y109.61 E-.07922
G1 X125.446 Y109.693 E-.0313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.815 Y109.53 Z1 F42000
G1 X110.331 Y109.37 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42024
G1 F15000
M204 S6000
G1 X109.549 Y110.152 E.01798
G1 X109.549 Y110.716 E.00916
G1 X110.716 Y109.549 E.02682
G1 X111.28 Y109.549 E.00916
G1 X109.549 Y111.28 E.03978
G1 X109.549 Y111.844 E.00916
G1 X111.844 Y109.549 E.05273
G1 X112.408 Y109.549 E.00916
G1 X109.549 Y112.408 E.06569
G1 X109.549 Y112.972 E.00916
G1 X112.971 Y109.549 E.07865
G1 X113.535 Y109.549 E.00916
G1 X109.549 Y113.536 E.09161
G1 X109.549 Y114.1 E.00916
G1 X114.099 Y109.55 E.10456
G1 X114.663 Y109.55 E.00916
G1 X109.549 Y114.664 E.11752
G1 X109.548 Y115.228 E.00916
G1 X115.227 Y109.55 E.13048
G1 X115.791 Y109.55 E.00916
G1 X109.548 Y115.792 E.14344
G1 X109.548 Y116.356 E.00916
G1 X116.355 Y109.55 E.15639
G1 X116.919 Y109.55 E.00916
G1 X109.548 Y116.92 E.16935
G1 X109.548 Y117.484 E.00916
G1 X117.482 Y109.55 E.18231
G1 X118.046 Y109.55 E.00916
G1 X109.548 Y118.048 E.19527
G1 X109.548 Y118.612 E.00916
G1 X118.61 Y109.55 E.20822
G1 X119.174 Y109.55 E.00916
G1 X109.548 Y119.176 E.22118
G1 X109.548 Y119.74 E.00916
G1 X119.738 Y109.55 E.23414
G1 X120.302 Y109.55 E.00916
G1 X109.548 Y120.304 E.2471
G1 X109.548 Y120.868 E.00916
G1 X120.866 Y109.551 E.26005
G1 X121.43 Y109.551 E.00916
G1 X109.548 Y121.432 E.27301
G1 X109.548 Y121.996 E.00916
G1 X121.993 Y109.551 E.28597
G1 X122.557 Y109.551 E.00916
G1 X109.548 Y122.56 E.29893
G1 X109.548 Y123.124 E.00916
G1 X123.121 Y109.551 E.31188
G1 X123.685 Y109.551 E.00916
G1 X109.548 Y123.688 E.32484
G1 X109.548 Y124.134 E.00725
G2 X109.572 Y124.228 I.113 J.021 E.00162
G1 X124.231 Y109.569 E.33682
G3 X124.252 Y109.655 I-.099 J.071 E.00147
G1 X124.252 Y110.112 E.00742
G1 X110.113 Y124.251 E.32489
G1 X110.677 Y124.251 E.00916
G1 X124.252 Y110.676 E.31193
G1 X124.252 Y111.24 E.00916
G1 X111.241 Y124.251 E.29897
G1 X111.805 Y124.251 E.00916
G1 X124.252 Y111.804 E.28602
G1 X124.252 Y112.368 E.00916
G1 X112.368 Y124.251 E.27306
G1 X112.932 Y124.251 E.00916
G1 X124.252 Y112.932 E.2601
G1 X124.252 Y113.496 E.00916
G1 X113.496 Y124.251 E.24714
G1 X114.06 Y124.251 E.00916
G1 X124.252 Y114.06 E.23418
G1 X124.252 Y114.624 E.00916
G1 X114.624 Y124.251 E.22122
G1 X115.188 Y124.252 E.00916
G1 X124.252 Y115.188 E.20826
G1 X124.252 Y115.752 E.00916
G1 X115.752 Y124.252 E.19531
G1 X116.316 Y124.252 E.00916
G1 X124.252 Y116.316 E.18235
M73 P48 R13
G1 X124.252 Y116.88 E.00916
G1 X116.88 Y124.252 E.16939
G1 X117.444 Y124.252 E.00916
G1 X124.252 Y117.444 E.15643
G1 X124.252 Y118.008 E.00916
G1 X118.008 Y124.252 E.14347
G1 X118.572 Y124.252 E.00916
G1 X124.252 Y118.572 E.13051
G1 X124.251 Y119.136 E.00916
G1 X119.136 Y124.252 E.11755
G1 X119.699 Y124.252 E.00916
G1 X124.251 Y119.7 E.1046
G1 X124.251 Y120.264 E.00916
G1 X120.263 Y124.252 E.09164
G1 X120.827 Y124.252 E.00916
G1 X124.251 Y120.828 E.07868
G1 X124.251 Y121.392 E.00916
G1 X121.391 Y124.252 E.06572
G1 X121.955 Y124.252 E.00916
G1 X124.251 Y121.956 E.05276
G1 X124.251 Y122.52 E.00916
G1 X122.519 Y124.252 E.0398
G1 X123.083 Y124.252 E.00916
G1 X124.251 Y123.084 E.02684
G1 X124.251 Y123.648 E.00916
G1 X123.468 Y124.431 E.01801
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.251 Y123.648 E-.42112
G1 X124.251 Y123.084 E-.21432
G1 X124.019 Y123.316 E-.12456
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 7/53
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.051 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1
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
M73 P48 R12
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
M73 P49 R12
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
M73 P50 R12
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
G1 X110.543 Y125.732 Z1.1 F42000
G1 X124.25 Y109.171 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.632 Y109.609 I-.043 J.423 E.01116
G1 X124.624 Y124.285 E.25625
G3 X124.184 Y124.632 I-.423 J-.084 E.01065
G1 X109.515 Y124.624 E.25613
G3 X109.168 Y124.182 I.079 J-.419 E.01071
G1 X109.176 Y109.515 E.2561
G3 X109.58 Y109.169 I.416 J.078 E.01005
G1 X124.19 Y109.171 E.25509
M204 S10000
G1 X124.293 Y108.744 F42000
G1 F6000
M204 S6000
G3 X125.06 Y109.601 I-.095 J.858 E.02198
G1 X125.059 Y124.237 E.25556
G3 X124.195 Y125.06 I-.853 J-.031 E.02308
G1 X109.563 Y125.059 E.25548
G3 X108.74 Y124.194 I.031 J-.853 E.0231
G1 X108.741 Y109.563 E.25546
G3 X109.563 Y108.741 I.86 J.038 E.02228
G1 X124.233 Y108.744 E.25615
M204 S250
G1 X124.313 Y108.332 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.334 Y108.332 E.00034
G3 X125.474 Y109.594 I-.142 J1.274 E.03018
G1 X125.473 Y124.255 E.23807
G3 X124.205 Y125.474 I-1.267 J-.049 E.03156
G1 X109.545 Y125.473 E.23804
G3 X108.326 Y124.205 I.048 J-1.267 E.03157
G1 X108.327 Y109.545 E.23804
G3 X109.545 Y108.327 I1.279 J.061 E.03068
G1 X124.253 Y108.332 E.23882
; WIPE_START
M204 S6000
G1 X124.334 Y108.332 E-.03081
G1 X124.577 Y108.381 E-.0942
G1 X124.768 Y108.456 E-.07795
G1 X124.981 Y108.588 E-.09517
G1 X125.161 Y108.758 E-.09411
G1 X125.283 Y108.922 E-.07769
G1 X125.392 Y109.143 E-.09344
G1 X125.457 Y109.383 E-.09449
G1 X125.474 Y109.594 E-.08043
G1 X125.474 Y109.651 E-.0217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.46 Y110.314 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42157
G1 F15000
M204 S6000
G1 X123.668 Y109.523 E.01824
G1 X123.103 Y109.523 E.00923
G1 X124.28 Y110.7 E.02715
G1 X124.28 Y111.266 E.00922
G1 X122.537 Y109.523 E.0402
G1 X121.971 Y109.522 E.00923
G1 X124.28 Y111.832 E.05325
G1 X124.28 Y112.398 E.00922
G1 X121.405 Y109.522 E.06629
G1 X120.839 Y109.522 E.00923
G1 X124.28 Y112.964 E.07934
G1 X124.28 Y113.529 E.00922
G1 X120.273 Y109.522 E.09238
G1 X119.707 Y109.522 E.00923
G1 X124.28 Y114.095 E.10543
G1 X124.28 Y114.661 E.00922
G1 X119.141 Y109.522 E.11848
G1 X118.575 Y109.522 E.00923
G1 X124.28 Y115.227 E.13152
G1 X124.28 Y115.793 E.00922
G1 X118.009 Y109.522 E.14457
G1 X117.443 Y109.522 E.00923
G1 X124.28 Y116.358 E.15761
G1 X124.28 Y116.924 E.00922
G1 X116.877 Y109.522 E.17066
G1 X116.311 Y109.522 E.00923
G1 X124.28 Y117.49 E.18371
G1 X124.28 Y118.056 E.00922
G1 X115.746 Y109.522 E.19675
G1 X115.18 Y109.521 E.00923
G1 X124.28 Y118.622 E.2098
G1 X124.28 Y119.187 E.00922
G1 X114.614 Y109.521 E.22284
G1 X114.048 Y109.521 E.00923
G1 X124.28 Y119.753 E.23589
G1 X124.28 Y120.319 E.00922
G1 X113.482 Y109.521 E.24894
G1 X112.916 Y109.521 E.00923
G1 X124.28 Y120.885 E.26198
G1 X124.28 Y121.451 E.00922
G1 X112.35 Y109.521 E.27503
G1 X111.784 Y109.521 E.00923
G1 X124.279 Y122.016 E.28808
G1 X124.279 Y122.582 E.00922
G1 X111.218 Y109.521 E.30112
G1 X110.652 Y109.521 E.00923
G1 X124.279 Y123.148 E.31417
G1 X124.279 Y123.714 E.00922
G1 X110.086 Y109.521 E.32721
G1 X109.62 Y109.521 E.0076
G2 X109.546 Y109.546 I-.006 J.101 E.00131
G1 X124.252 Y124.252 E.33904
G3 X124.156 Y124.28 I-.078 J-.088 E.00168
G1 X123.714 Y124.28 E.0072
G1 X109.521 Y110.087 E.32723
G1 X109.521 Y110.653 E.00922
G1 X123.148 Y124.28 E.31418
G1 X122.583 Y124.28 E.00922
G1 X109.521 Y111.218 E.30114
G1 X109.521 Y111.784 E.00922
G1 X122.017 Y124.28 E.28809
G1 X121.451 Y124.28 E.00922
G1 X109.52 Y112.35 E.27505
G1 X109.52 Y112.916 E.00922
G1 X120.885 Y124.28 E.262
G1 X120.319 Y124.28 E.00923
G1 X109.52 Y113.482 E.24896
G1 X109.52 Y114.047 E.00922
G1 X119.753 Y124.28 E.23591
G1 X119.187 Y124.28 E.00922
G1 X109.52 Y114.613 E.22287
G1 X109.52 Y115.179 E.00922
G1 X118.621 Y124.28 E.20982
G1 X118.055 Y124.28 E.00922
G1 X109.52 Y115.745 E.19678
G1 X109.52 Y116.311 E.00922
G1 X117.49 Y124.28 E.18373
G1 X116.924 Y124.28 E.00922
G1 X109.52 Y116.876 E.17068
G1 X109.52 Y117.442 E.00922
G1 X116.358 Y124.28 E.15764
G1 X115.792 Y124.28 E.00922
G1 X109.52 Y118.008 E.14459
G1 X109.52 Y118.574 E.00922
G1 X115.226 Y124.28 E.13155
G1 X114.66 Y124.28 E.00923
G1 X109.52 Y119.14 E.1185
G1 X109.52 Y119.705 E.00922
G1 X114.094 Y124.28 E.10546
G1 X113.528 Y124.28 E.00922
G1 X109.52 Y120.271 E.09241
G1 X109.52 Y120.837 E.00922
G1 X112.962 Y124.28 E.07937
G1 X112.397 Y124.28 E.00922
G1 X109.52 Y121.403 E.06632
G1 X109.52 Y121.969 E.00922
G1 X111.831 Y124.28 E.05328
G1 X111.265 Y124.279 E.00923
G1 X109.52 Y122.534 E.04023
G1 X109.52 Y123.1 E.00922
G1 X110.699 Y124.279 E.02719
G1 X110.133 Y124.279 E.00922
G1 X109.34 Y123.487 E.01828
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X110.133 Y124.279 E-.42605
G1 X110.699 Y124.279 E-.21503
G1 X110.478 Y124.058 E-.11891
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 8/53
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I.057 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1.1
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
M73 P51 R12
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
M73 P52 R12
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
M73 P52 R11
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
G1 X110.543 Y125.731 Z1.2 F42000
G1 X124.268 Y109.143 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.66 Y109.592 I-.049 J.438 E.01143
G1 X124.652 Y124.305 E.25688
G3 X124.201 Y124.66 I-.43 J-.082 E.01094
G1 X109.495 Y124.652 E.25677
G3 X109.14 Y124.199 I.082 J-.43 E.01098
G1 X109.148 Y109.495 E.25673
G3 X109.562 Y109.141 I.432 J.086 E.01025
G1 X124.208 Y109.143 E.25574
M204 S10000
G1 X124.311 Y108.716 F42000
G1 F6000
M204 S6000
G3 X125.089 Y109.584 I-.097 J.869 E.02227
G1 X125.088 Y124.256 E.25618
G3 X124.212 Y125.089 I-.865 J-.033 E.02336
G1 X109.544 Y125.088 E.25611
G3 X108.711 Y124.21 I.033 J-.865 E.02338
G1 X108.712 Y109.544 E.25608
G3 X109.544 Y108.712 I.871 J.04 E.02252
G1 X124.251 Y108.716 E.2568
M204 S250
G1 X124.323 Y108.304 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.353 Y108.304 E.00049
G3 X125.502 Y109.577 I-.144 J1.285 E.03044
G1 X125.501 Y124.274 E.23865
G3 X124.222 Y125.502 I-1.278 J-.051 E.03182
G1 X109.526 Y125.501 E.23863
G3 X108.298 Y124.222 I.051 J-1.278 E.03183
G1 X108.299 Y109.526 E.23862
G3 X109.526 Y108.299 I1.29 J.063 E.0309
G1 X124.263 Y108.304 E.23929
; WIPE_START
M204 S6000
G1 X124.353 Y108.304 E-.03423
G1 X124.598 Y108.353 E-.09505
G1 X124.79 Y108.429 E-.07849
G1 X125.005 Y108.563 E-.09604
G1 X125.187 Y108.734 E-.09499
G1 X125.31 Y108.9 E-.07841
G1 X125.419 Y109.121 E-.09367
G1 X125.485 Y109.363 E-.0953
G1 X125.502 Y109.577 E-.0816
G1 X125.502 Y109.609 E-.01222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.871 Y109.461 Z1.2 F42000
G1 X110.293 Y109.313 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42292
G1 F15000
M204 S6000
G1 X109.492 Y110.114 E.01851
G1 X109.492 Y110.681 E.00929
G1 X110.681 Y109.493 E.0275
G1 X111.249 Y109.493 E.00929
G1 X109.492 Y111.249 E.04063
M73 P53 R11
G1 X109.492 Y111.817 E.00929
G1 X111.816 Y109.493 E.05376
G1 X112.384 Y109.493 E.00929
G1 X109.492 Y112.385 E.06689
G1 X109.492 Y112.953 E.00929
G1 X112.952 Y109.493 E.08003
G1 X113.519 Y109.493 E.00929
G1 X109.492 Y113.52 E.09316
G1 X109.492 Y114.088 E.00929
G1 X114.087 Y109.493 E.10629
G1 X114.655 Y109.493 E.00929
G1 X109.492 Y114.656 E.11942
G1 X109.492 Y115.224 E.00929
G1 X115.222 Y109.493 E.13256
G1 X115.79 Y109.493 E.00929
G1 X109.492 Y115.791 E.14569
G1 X109.492 Y116.359 E.00929
G1 X116.358 Y109.493 E.15882
G1 X116.925 Y109.494 E.00929
G1 X109.492 Y116.927 E.17195
G1 X109.492 Y117.495 E.00929
G1 X117.493 Y109.494 E.18509
G1 X118.061 Y109.494 E.00929
G1 X109.492 Y118.063 E.19822
G1 X109.492 Y118.63 E.00929
G1 X118.628 Y109.494 E.21135
G1 X119.196 Y109.494 E.00929
G1 X109.492 Y119.198 E.22449
G1 X109.492 Y119.766 E.00929
G1 X119.764 Y109.494 E.23762
G1 X120.331 Y109.494 E.00929
G1 X109.492 Y120.334 E.25075
G1 X109.492 Y120.902 E.00929
G1 X120.899 Y109.494 E.26388
G1 X121.467 Y109.494 E.00929
G1 X109.491 Y121.469 E.27702
G1 X109.491 Y122.037 E.00929
G1 X122.034 Y109.494 E.29015
G1 X122.602 Y109.494 E.00929
G1 X109.491 Y122.605 E.30328
G1 X109.491 Y123.173 E.00929
G1 X123.17 Y109.494 E.31641
G1 X123.737 Y109.494 E.00929
G1 X109.491 Y123.741 E.32955
G1 X109.491 Y124.17 E.00703
G2 X109.523 Y124.277 I.129 J.02 E.00188
G1 X124.278 Y109.522 E.34132
G3 X124.309 Y109.622 I-.066 J.075 E.00181
G1 X124.309 Y110.059 E.00714
G1 X110.06 Y124.308 E.32961
G1 X110.628 Y124.308 E.00929
G1 X124.309 Y110.627 E.31647
G1 X124.309 Y111.194 E.00929
G1 X111.195 Y124.308 E.30334
G1 X111.763 Y124.308 E.00929
G1 X124.309 Y111.762 E.29021
G1 X124.309 Y112.33 E.00929
G1 X112.331 Y124.308 E.27707
G1 X112.898 Y124.308 E.00929
G1 X124.308 Y112.898 E.26394
G1 X124.308 Y113.466 E.00929
G1 X113.466 Y124.308 E.25081
G1 X114.034 Y124.308 E.00929
G1 X124.308 Y114.033 E.23767
G1 X124.308 Y114.601 E.00929
G1 X114.602 Y124.308 E.22454
G1 X115.169 Y124.308 E.00929
G1 X124.308 Y115.169 E.21141
G1 X124.308 Y115.737 E.00929
G1 X115.737 Y124.308 E.19827
G1 X116.305 Y124.308 E.00929
G1 X124.308 Y116.305 E.18514
G1 X124.308 Y116.872 E.00929
G1 X116.872 Y124.308 E.17201
G1 X117.44 Y124.308 E.00929
G1 X124.308 Y117.44 E.15887
G1 X124.308 Y118.008 E.00929
G1 X118.008 Y124.308 E.14574
G1 X118.575 Y124.308 E.00929
G1 X124.308 Y118.576 E.13261
G1 X124.308 Y119.144 E.00929
G1 X119.143 Y124.308 E.11947
G1 X119.711 Y124.308 E.00929
G1 X124.308 Y119.711 E.10634
G1 X124.308 Y120.279 E.00929
G1 X120.279 Y124.308 E.09321
G1 X120.846 Y124.308 E.00929
G1 X124.308 Y120.847 E.08007
G1 X124.308 Y121.415 E.00929
G1 X121.414 Y124.309 E.06694
G1 X121.982 Y124.309 E.00929
G1 X124.308 Y121.982 E.05381
G1 X124.308 Y122.55 E.00929
G1 X122.549 Y124.309 E.04067
G1 X123.117 Y124.309 E.00929
G1 X124.308 Y123.118 E.02754
G1 X124.308 Y123.686 E.00929
G1 X123.505 Y124.488 E.01856
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.308 Y123.686 E-.43108
G1 X124.308 Y123.118 E-.21576
G1 X124.097 Y123.329 E-.11316
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 9/53
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.052 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1.2
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
G1 X150.296 Y106.628 E.01182
M204 S10000
G1 X150.73 Y106.684 F42000
; LINE_WIDTH: 0.431906
G1 F15000
M204 S6000
G2 X150.737 Y105.263 I-111.503 J-1.206 E.02376
G2 X149.316 Y105.269 I-.212 J110.309 E.02375
M73 P54 R11
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
M73 P55 R11
G1 X103.27 Y152.3 E-.07155
G1 X103.226 Y152.154 E-.05808
G1 X103.21 Y151.996 E-.06035
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
G1 X110.542 Y125.731 Z1.3 F42000
G1 X124.286 Y109.115 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.689 Y109.576 I-.05 J.45 E.01174
G1 X124.68 Y124.325 E.25752
G3 X124.218 Y124.689 I-.441 J-.085 E.01119
G1 X109.475 Y124.68 E.25741
G3 X109.111 Y124.215 I.085 J-.441 E.01125
G1 X109.12 Y109.475 E.25737
G3 X109.543 Y109.113 I.443 J.09 E.01048
G1 X124.226 Y109.115 E.25638
M204 S10000
G1 X124.33 Y108.688 F42000
G1 F6000
M204 S6000
G3 X125.117 Y109.568 I-.099 J.88 E.02256
G1 X125.116 Y124.275 E.2568
G3 X124.229 Y125.117 I-.876 J-.035 E.02363
G1 X109.525 Y125.116 E.25673
G3 X108.683 Y124.227 I.035 J-.876 E.02366
G1 X108.684 Y109.525 E.25671
G3 X109.525 Y108.684 I.883 J.042 E.02276
G1 X124.27 Y108.688 E.25745
M204 S250
G1 X124.333 Y108.276 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.372 Y108.276 E.00063
G3 X125.531 Y109.56 I-.146 J1.297 E.0307
G1 X125.529 Y124.293 E.23924
G3 X124.239 Y125.531 I-1.289 J-.053 E.03207
G1 X109.507 Y125.529 E.23922
G3 X108.269 Y124.239 I.053 J-1.289 E.03208
G1 X108.271 Y109.507 E.23921
G3 X109.507 Y108.271 I1.301 J.065 E.03112
G1 X124.273 Y108.276 E.23977
; WIPE_START
M204 S6000
G1 X124.372 Y108.276 E-.03753
G1 X124.619 Y108.326 E-.09597
G1 X124.813 Y108.402 E-.07909
G1 X125.029 Y108.537 E-.09695
G1 X125.213 Y108.71 E-.09583
G1 X125.336 Y108.877 E-.0788
G1 X125.446 Y109.098 E-.09403
G1 X125.512 Y109.343 E-.09622
G1 X125.531 Y109.56 E-.08279
G1 X125.531 Y109.567 E-.0028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.516 Y110.276 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42424
G1 F15000
M204 S6000
G1 X123.706 Y109.466 E.0188
G1 X123.137 Y109.466 E.00935
G1 X124.337 Y110.667 E.02786
G1 X124.337 Y111.236 E.00935
G1 X122.567 Y109.466 E.04108
G1 X121.997 Y109.466 E.00935
G1 X124.337 Y111.806 E.0543
G1 X124.337 Y112.375 E.00935
G1 X121.427 Y109.466 E.06752
G1 X120.858 Y109.466 E.00935
G1 X124.337 Y112.945 E.08074
G1 X124.337 Y113.514 E.00935
G1 X120.288 Y109.466 E.09396
G1 X119.718 Y109.466 E.00935
G1 X124.337 Y114.084 E.10718
G1 X124.337 Y114.654 E.00935
G1 X119.149 Y109.466 E.1204
G1 X118.579 Y109.466 E.00935
G1 X124.337 Y115.223 E.13362
G1 X124.336 Y115.793 E.00935
G1 X118.009 Y109.465 E.14684
G1 X117.44 Y109.465 E.00935
G1 X124.336 Y116.362 E.16006
G1 X124.336 Y116.932 E.00935
G1 X116.87 Y109.465 E.17328
G1 X116.3 Y109.465 E.00935
G1 X124.336 Y117.501 E.1865
G1 X124.336 Y118.071 E.00935
G1 X115.731 Y109.465 E.19973
G1 X115.161 Y109.465 E.00935
G1 X124.336 Y118.64 E.21295
G1 X124.336 Y119.21 E.00935
G1 X114.591 Y109.465 E.22617
G1 X114.021 Y109.465 E.00935
G1 X124.336 Y119.78 E.23939
G1 X124.336 Y120.349 E.00935
G1 X113.452 Y109.465 E.25261
G1 X112.882 Y109.465 E.00935
G1 X124.336 Y120.919 E.26583
G1 X124.336 Y121.488 E.00935
G1 X112.312 Y109.465 E.27905
G1 X111.743 Y109.465 E.00935
G1 X124.336 Y122.058 E.29227
G1 X124.336 Y122.627 E.00935
G1 X111.173 Y109.465 E.30549
G1 X110.603 Y109.464 E.00935
G1 X124.336 Y123.197 E.31871
G1 X124.336 Y123.767 E.00935
G1 X110.034 Y109.464 E.33193
G1 X109.583 Y109.464 E.00739
G2 X109.496 Y109.497 I-.005 J.12 E.00156
G1 X124.302 Y124.302 E.34361
G3 X124.189 Y124.337 I-.094 J-.103 E.002
G1 X123.767 Y124.337 E.00693
G1 X109.464 Y110.034 E.33194
G1 X109.464 Y110.604 E.00935
G1 X123.197 Y124.337 E.31872
G1 X122.628 Y124.337 E.00935
G1 X109.464 Y111.173 E.3055
G1 X109.464 Y111.743 E.00935
G1 X122.058 Y124.337 E.29228
G1 X121.488 Y124.337 E.00935
G1 X109.464 Y112.313 E.27906
G1 X109.464 Y112.882 E.00935
G1 X120.919 Y124.337 E.26584
G1 X120.349 Y124.337 E.00935
G1 X109.464 Y113.452 E.25262
G1 X109.464 Y114.021 E.00935
G1 X119.779 Y124.337 E.2394
G1 X119.21 Y124.337 E.00935
G1 X109.464 Y114.591 E.22618
G1 X109.464 Y115.16 E.00935
G1 X118.64 Y124.337 E.21296
G1 X118.07 Y124.337 E.00935
G1 X109.464 Y115.73 E.19974
G1 X109.464 Y116.299 E.00935
G1 X117.501 Y124.336 E.18652
G1 X116.931 Y124.336 E.00935
G1 X109.464 Y116.869 E.1733
G1 X109.464 Y117.439 E.00935
G1 X116.361 Y124.336 E.16008
G1 X115.792 Y124.336 E.00935
G1 X109.464 Y118.008 E.14686
G1 X109.463 Y118.578 E.00935
G1 X115.222 Y124.336 E.13364
G1 X114.652 Y124.336 E.00935
G1 X109.463 Y119.147 E.12042
G1 X109.463 Y119.717 E.00935
G1 X114.083 Y124.336 E.1072
G1 X113.513 Y124.336 E.00935
G1 X109.463 Y120.286 E.09399
G1 X109.463 Y120.856 E.00935
G1 X112.943 Y124.336 E.08077
G1 X112.374 Y124.336 E.00935
G1 X109.463 Y121.426 E.06755
G1 X109.463 Y121.995 E.00935
G1 X111.804 Y124.336 E.05433
G1 X111.234 Y124.336 E.00935
G1 X109.463 Y122.565 E.04111
G1 X109.463 Y123.134 E.00935
G1 X110.665 Y124.336 E.02789
G1 X110.095 Y124.336 E.00935
G1 X109.284 Y123.525 E.01883
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X110.095 Y124.336 E-.43597
G1 X110.665 Y124.336 E-.21647
G1 X110.464 Y124.136 E-.10756
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 10/53
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I.059 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X149.102 Y123.102 E.0147
G1 X132.898 Y123.102 E.28293
G1 X132.898 Y106.898 E.28293
M73 P56 R11
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
M73 P56 R10
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
M73 P57 R10
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
M73 P58 R10
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
G1 X110.541 Y125.73 Z1.4 F42000
G1 X124.305 Y109.087 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.717 Y109.56 I-.052 J.461 E.01203
G1 X124.708 Y124.345 E.25815
G3 X124.234 Y124.717 I-.452 J-.088 E.01147
G1 X109.455 Y124.708 E.25804
G3 X109.083 Y124.231 I.088 J-.452 E.01152
G1 X109.092 Y109.455 E.258
G3 X109.524 Y109.085 I.454 J.092 E.01071
G1 X124.245 Y109.087 E.25702
M204 S10000
G1 X124.343 Y108.66 F42000
G1 F6000
M204 S6000
G1 X124.348 Y108.66 E.00009
G3 X125.145 Y109.551 I-.1 J.892 E.02285
G1 X125.144 Y124.294 E.25742
G3 X124.245 Y125.145 I-.887 J-.037 E.02391
G1 X109.506 Y125.144 E.25736
G3 X108.655 Y124.244 I.037 J-.887 E.02394
G1 X108.656 Y109.506 E.25733
G3 X109.506 Y108.656 I.894 J.044 E.023
G1 X124.283 Y108.66 E.25802
M204 S250
G1 X124.343 Y108.248 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.39 Y108.248 E.00076
G3 X125.559 Y109.543 I-.148 J1.308 E.03096
G1 X125.557 Y124.312 E.23982
G3 X124.256 Y125.559 I-1.301 J-.055 E.03233
G1 X109.488 Y125.557 E.2398
G3 X108.241 Y124.255 I.055 J-1.301 E.03234
G1 X108.243 Y109.488 E.23979
G3 X109.488 Y108.243 I1.313 J.067 E.03134
G1 X124.283 Y108.248 E.24025
; WIPE_START
M204 S6000
G1 X124.39 Y108.248 E-.04068
G1 X124.64 Y108.298 E-.09675
G1 X124.877 Y108.397 E-.09774
G1 X125.053 Y108.511 E-.07966
G1 X125.239 Y108.686 E-.09697
G1 X125.363 Y108.854 E-.07944
G1 X125.473 Y109.076 E-.09419
G1 X125.54 Y109.323 E-.097
G1 X125.557 Y109.526 E-.07757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.926 Y109.392 Z1.4 F42000
G1 X110.256 Y109.257 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42557
G1 F15000
M204 S6000
G1 X109.436 Y110.077 E.01909
G1 X109.436 Y110.648 E.00941
G1 X110.648 Y109.436 E.02822
G1 X111.219 Y109.436 E.00941
G1 X109.436 Y111.22 E.04152
G1 X109.436 Y111.791 E.00941
G1 X111.791 Y109.436 E.05483
G1 X112.362 Y109.436 E.00941
G1 X109.436 Y112.363 E.06814
G1 X109.436 Y112.934 E.00941
G1 X112.934 Y109.437 E.08144
G1 X113.505 Y109.437 E.00941
G1 X109.436 Y113.506 E.09475
G1 X109.436 Y114.077 E.00941
G1 X114.076 Y109.437 E.10806
G1 X114.648 Y109.437 E.00941
G1 X109.436 Y114.649 E.12136
G1 X109.436 Y115.221 E.00941
G1 X115.219 Y109.437 E.13467
G1 X115.791 Y109.437 E.00941
G1 X109.435 Y115.792 E.14798
G1 X109.435 Y116.364 E.00941
G1 X116.362 Y109.437 E.16129
G1 X116.933 Y109.437 E.00941
G1 X109.435 Y116.935 E.17459
G1 X109.435 Y117.507 E.00941
G1 X117.505 Y109.437 E.1879
G1 X118.076 Y109.437 E.00941
G1 X109.435 Y118.078 E.20121
G1 X109.435 Y118.65 E.00941
G1 X118.648 Y109.437 E.21451
G1 X119.219 Y109.437 E.00941
G1 X109.435 Y119.221 E.22782
G1 X109.435 Y119.793 E.00941
G1 X119.791 Y109.438 E.24113
G1 X120.362 Y109.438 E.00941
G1 X109.435 Y120.365 E.25443
G1 X109.435 Y120.936 E.00941
G1 X120.933 Y109.438 E.26774
G1 X121.505 Y109.438 E.00941
G1 X109.435 Y121.508 E.28105
G1 X109.435 Y122.079 E.00941
G1 X122.076 Y109.438 E.29435
G1 X122.648 Y109.438 E.00941
G1 X109.435 Y122.651 E.30766
G1 X109.435 Y123.222 E.00941
G1 X123.219 Y109.438 E.32097
G1 X123.791 Y109.438 E.00941
G1 X109.435 Y123.794 E.33427
G1 X109.435 Y124.2 E.00668
G2 X109.472 Y124.328 I.157 J.024 E.00227
G1 X124.33 Y109.47 E.34595
G3 X124.365 Y109.59 I-.115 J.099 E.00211
G1 X124.365 Y110.006 E.00686
G1 X110.008 Y124.364 E.33432
G1 X110.579 Y124.364 E.00941
G1 X124.365 Y110.578 E.32101
G1 X124.365 Y111.149 E.00941
G1 X111.15 Y124.364 E.3077
G1 X111.722 Y124.364 E.00941
G1 X124.365 Y111.721 E.2944
G1 X124.365 Y112.292 E.00941
G1 X112.293 Y124.364 E.28109
G1 X112.865 Y124.364 E.00941
G1 X124.365 Y112.864 E.26778
G1 X124.365 Y113.436 E.00941
G1 X113.436 Y124.364 E.25448
G1 X114.008 Y124.364 E.00941
G1 X124.365 Y114.007 E.24117
G1 X124.365 Y114.579 E.00941
G1 X114.579 Y124.364 E.22786
G1 X115.151 Y124.364 E.00941
G1 X124.365 Y115.15 E.21455
G1 X124.365 Y115.722 E.00941
G1 X115.722 Y124.365 E.20125
G1 X116.293 Y124.365 E.00941
G1 X124.365 Y116.293 E.18794
G1 X124.365 Y116.865 E.00941
G1 X116.865 Y124.365 E.17463
G1 X117.436 Y124.365 E.00941
G1 X124.365 Y117.436 E.16132
G1 X124.365 Y118.008 E.00941
G1 X118.008 Y124.365 E.14802
G1 X118.579 Y124.365 E.00941
G1 X124.364 Y118.58 E.13471
G1 X124.364 Y119.151 E.00941
G1 X119.151 Y124.365 E.1214
G1 X119.722 Y124.365 E.00941
G1 X124.364 Y119.723 E.1081
G1 X124.364 Y120.294 E.00941
G1 X120.294 Y124.365 E.09479
G1 X120.865 Y124.365 E.00941
G1 X124.364 Y120.866 E.08148
G1 X124.364 Y121.437 E.00941
G1 X121.436 Y124.365 E.06817
G1 X122.008 Y124.365 E.00941
G1 X124.364 Y122.009 E.05487
G1 X124.364 Y122.58 E.00941
G1 X122.579 Y124.365 E.04156
G1 X123.151 Y124.365 E.00941
G1 X124.364 Y123.152 E.02825
G1 X124.364 Y123.724 E.00941
G1 X123.543 Y124.545 E.01912
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X124.364 Y123.724 E-.44126
G1 X124.364 Y123.152 E-.21719
G1 X124.175 Y123.341 E-.10155
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 11/53
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.053 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1.4
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
G1 F15000
M204 S6000
G1 X151.135 Y104.865 E.01328
G1 X130.864 Y104.864 E.32915
G1 X130.864 Y125.136 E.32916
G1 X151.136 Y125.136 E.32916
M73 P59 R10
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
M73 P60 R10
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
M73 P60 R9
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
G1 X110.54 Y125.729 Z1.5 F42000
G1 X124.323 Y109.058 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.745 Y109.543 I-.053 J.472 E.01233
G1 X124.745 Y124.261 E.25698
G3 X124.251 Y124.745 I-.472 J.012 E.01353
G1 X109.539 Y124.745 E.25689
G3 X109.055 Y124.248 I-.012 J-.472 E.01359
G1 X109.064 Y109.435 E.25864
G3 X109.505 Y109.056 I.465 J.096 E.01093
G1 X124.263 Y109.058 E.25767
M204 S10000
G1 X124.353 Y108.632 F42000
G1 F6000
M204 S6000
G1 X124.367 Y108.632 E.00023
G3 X125.174 Y109.535 I-.102 J.903 E.02314
G1 X125.173 Y124.273 E.25734
G3 X124.262 Y125.174 I-.9 J.001 E.02489
G1 X109.527 Y125.173 E.25728
G3 X108.626 Y124.26 I-.001 J-.9 E.02493
G1 X108.628 Y109.487 E.25795
G3 X109.487 Y108.628 I.905 J.046 E.02324
G1 X124.293 Y108.632 E.25853
M204 S250
G1 X124.354 Y108.22 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.409 Y108.22 E.0009
G3 X125.587 Y109.526 I-.15 J1.319 E.03122
G1 X125.587 Y124.284 E.23964
G3 X124.273 Y125.587 I-1.313 J-.01 E.03335
G1 X109.516 Y125.587 E.23962
G3 X108.213 Y124.272 I.01 J-1.313 E.03335
G1 X108.214 Y109.469 E.24038
G3 X109.469 Y108.214 I1.324 J.07 E.03156
G1 X124.294 Y108.22 E.24072
; WIPE_START
M204 S6000
G1 X124.409 Y108.22 E-.04393
G1 X124.661 Y108.27 E-.0976
G1 X124.858 Y108.348 E-.08033
G1 X125.077 Y108.485 E-.09851
G1 X125.265 Y108.662 E-.09771
G1 X125.39 Y108.831 E-.0801
G1 X125.5 Y109.054 E-.09455
G1 X125.568 Y109.303 E-.09784
G1 X125.584 Y109.485 E-.06943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.573 Y109.665 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4269
G1 F15000
M204 S6000
G2 X124.318 Y109.421 I-1.028 J.817 E.00584
G1 X123.744 Y109.41 E.00949
G1 X124.394 Y110.059 E.01518
G1 X124.394 Y110.633 E.00947
G1 X123.171 Y109.41 E.02857
G1 X122.597 Y109.41 E.00947
G1 X124.394 Y111.206 E.04197
G1 X124.394 Y111.78 E.00947
G1 X122.024 Y109.41 E.05537
G1 X121.45 Y109.41 E.00947
G1 X124.394 Y112.353 E.06876
G1 X124.394 Y112.926 E.00947
G1 X120.877 Y109.409 E.08216
G1 X120.303 Y109.409 E.00947
G1 X124.394 Y113.5 E.09556
G1 X124.394 Y114.073 E.00947
G1 X119.73 Y109.409 E.10895
G1 X119.156 Y109.409 E.00947
G1 X124.394 Y114.646 E.12235
G1 X124.394 Y115.22 E.00947
G1 X118.583 Y109.409 E.13575
G1 X118.009 Y109.409 E.00947
G1 X124.394 Y115.793 E.14914
G1 X124.394 Y116.366 E.00947
G1 X117.436 Y109.409 E.16254
G1 X116.863 Y109.409 E.00947
G1 X124.394 Y116.94 E.17594
G1 X124.394 Y117.513 E.00947
G1 X116.289 Y109.409 E.18933
G1 X115.716 Y109.409 E.00947
G1 X124.394 Y118.087 E.20273
G1 X124.393 Y118.66 E.00947
G1 X115.142 Y109.409 E.21612
G1 X114.569 Y109.409 E.00947
G1 X124.393 Y119.233 E.22952
G1 X124.393 Y119.807 E.00947
G1 X113.995 Y109.409 E.24292
G1 X113.422 Y109.408 E.00947
G1 X124.393 Y120.38 E.25631
M73 P61 R9
G1 X124.393 Y120.953 E.00947
G1 X112.848 Y109.408 E.26971
G1 X112.275 Y109.408 E.00947
G1 X124.393 Y121.527 E.28311
G1 X124.393 Y122.1 E.00947
G1 X111.701 Y109.408 E.2965
G1 X111.128 Y109.408 E.00947
G1 X124.393 Y122.674 E.3099
G1 X124.393 Y123.247 E.00947
G1 X110.555 Y109.408 E.3233
G1 X109.981 Y109.408 E.00947
G1 X124.393 Y123.82 E.33669
G1 X124.393 Y124.228 E.00673
G3 X124.352 Y124.352 I-.119 J.029 E.00228
G1 X109.447 Y109.447 E.34821
G2 X109.408 Y109.544 I.079 J.088 E.00179
G1 X109.408 Y109.981 E.00723
G1 X123.82 Y124.394 E.33669
G1 X123.247 Y124.394 E.00947
G1 X109.408 Y110.555 E.3233
G1 X109.408 Y111.128 E.00947
G1 X122.673 Y124.394 E.3099
G1 X122.1 Y124.394 E.00947
G1 X109.408 Y111.701 E.29651
G1 X109.408 Y112.275 E.00947
G1 X121.526 Y124.394 E.28311
G1 X120.953 Y124.394 E.00947
G1 X109.408 Y112.848 E.26972
G1 X109.407 Y113.421 E.00947
G1 X120.38 Y124.394 E.25633
G1 X119.806 Y124.394 E.00947
G1 X109.407 Y113.995 E.24293
G1 X109.407 Y114.568 E.00947
G1 X119.233 Y124.394 E.22954
G1 X118.66 Y124.394 E.00947
G1 X109.407 Y115.141 E.21615
G1 X109.407 Y115.715 E.00947
G1 X118.086 Y124.394 E.20275
G1 X117.513 Y124.394 E.00947
G1 X109.407 Y116.288 E.18936
G1 X109.407 Y116.861 E.00947
G1 X116.939 Y124.394 E.17596
G1 X116.366 Y124.394 E.00947
G1 X109.407 Y117.435 E.16257
G1 X109.407 Y118.008 E.00947
G1 X115.793 Y124.394 E.14918
G1 X115.219 Y124.394 E.00947
G1 X109.407 Y118.581 E.13578
G1 X109.407 Y119.155 E.00947
G1 X114.646 Y124.393 E.12239
G1 X114.072 Y124.393 E.00947
G1 X109.407 Y119.728 E.109
G1 X109.407 Y120.301 E.00947
G1 X113.499 Y124.393 E.0956
G1 X112.926 Y124.393 E.00947
G1 X109.407 Y120.875 E.08221
G1 X109.407 Y121.448 E.00947
G1 X112.352 Y124.393 E.06881
G1 X111.779 Y124.393 E.00947
G1 X109.407 Y122.021 E.05542
G1 X109.407 Y122.595 E.00947
G1 X111.205 Y124.393 E.04203
G1 X110.632 Y124.393 E.00947
G1 X109.406 Y123.168 E.02863
G1 X109.406 Y123.741 E.00947
G1 X110.238 Y124.573 E.01943
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X109.406 Y123.741 E-.44691
G1 X109.406 Y123.168 E-.21786
G1 X109.584 Y123.345 E-.09523
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 12/53
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I.033 J1.217 P1  F42000
G1 X149.102 Y122.26 Z1.5
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
M73 P62 R9
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
M73 P63 R9
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
G1 X110.539 Y125.729 Z1.6 F42000
G1 X124.341 Y109.03 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.773 Y109.527 I-.054 J.484 E.01263
G1 X124.773 Y124.28 E.25759
G3 X124.268 Y124.773 I-.484 J.01 E.01382
G1 X109.52 Y124.773 E.25751
G3 X109.027 Y124.264 I-.01 J-.484 E.01389
G1 X109.027 Y109.52 E.25744
G3 X109.486 Y109.028 I.485 J-.008 E.01299
G1 X124.281 Y109.03 E.25831
M204 S10000
G1 X124.364 Y108.603 F42000
G1 F6000
M204 S6000
G1 X124.385 Y108.603 E.00036
G3 X125.202 Y109.518 I-.104 J.915 E.02343
G1 X125.202 Y124.291 E.25795
G3 X124.279 Y125.202 I-.911 J-.001 E.02518
G1 X109.509 Y125.202 E.2579
G3 X108.598 Y124.277 I.001 J-.911 E.02522
G1 X108.598 Y109.509 E.25786
G3 X109.468 Y108.6 I.918 J.008 E.02419
G1 X124.304 Y108.603 E.25905
M204 S250
G1 X124.365 Y108.192 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.428 Y108.192 E.00103
G3 X125.615 Y109.509 I-.151 J1.331 E.03148
G1 X125.615 Y124.303 E.24022
G3 X124.29 Y125.615 I-1.325 J-.012 E.03361
G1 X109.497 Y125.615 E.2402
G3 X108.185 Y124.289 I.012 J-1.325 E.03362
G1 X108.185 Y109.497 E.24019
G3 X109.45 Y108.186 I1.336 J.024 E.03255
G1 X124.305 Y108.191 E.24122
; WIPE_START
M204 S6000
G1 X124.428 Y108.192 E-.04684
G1 X124.682 Y108.243 E-.09857
G1 X124.923 Y108.344 E-.09942
G1 X125.102 Y108.46 E-.08086
G1 X125.291 Y108.638 E-.09854
G1 X125.417 Y108.808 E-.08067
G1 X125.527 Y109.032 E-.09473
G1 X125.596 Y109.283 E-.09886
G1 X125.61 Y109.444 E-.06152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.986 Y109.797 Z1.6 F42000
G1 X109.199 Y110.203 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X110.022 Y109.38 E.01894
G1 X110.587 Y109.38 E.00918
G1 X109.378 Y110.588 E.0278
G1 X109.378 Y111.153 E.00918
G1 X111.151 Y109.38 E.04078
G1 X111.716 Y109.38 E.00918
G1 X109.378 Y111.717 E.05377
G1 X109.378 Y112.282 E.00918
G1 X112.28 Y109.38 E.06676
G1 X112.845 Y109.38 E.00918
G1 X109.378 Y112.847 E.07975
G1 X109.378 Y113.411 E.00918
G1 X113.409 Y109.38 E.09274
G1 X113.974 Y109.38 E.00918
G1 X109.378 Y113.976 E.10572
G1 X109.378 Y114.541 E.00918
G1 X114.538 Y109.38 E.11871
G1 X115.103 Y109.38 E.00918
G1 X109.378 Y115.105 E.1317
G1 X109.378 Y115.67 E.00918
G1 X115.668 Y109.38 E.14469
G1 X116.232 Y109.381 E.00918
G1 X109.378 Y116.235 E.15767
G1 X109.378 Y116.799 E.00918
G1 X116.797 Y109.381 E.17066
G1 X117.361 Y109.381 E.00918
G1 X109.378 Y117.364 E.18365
G1 X109.378 Y117.928 E.00918
G1 X117.926 Y109.381 E.19664
G1 X118.49 Y109.381 E.00918
G1 X109.378 Y118.493 E.20963
G1 X109.378 Y119.058 E.00918
G1 X119.055 Y109.381 E.22261
G1 X119.619 Y109.381 E.00918
G1 X109.378 Y119.622 E.2356
G1 X109.378 Y120.187 E.00918
G1 X120.184 Y109.381 E.24859
G1 X120.749 Y109.381 E.00918
G1 X109.378 Y120.752 E.26158
G1 X109.378 Y121.316 E.00918
G1 X121.313 Y109.381 E.27456
G1 X121.878 Y109.381 E.00918
G1 X109.378 Y121.881 E.28755
G1 X109.378 Y122.446 E.00918
G1 X122.442 Y109.381 E.30054
G1 X123.007 Y109.381 E.00918
G1 X109.378 Y123.01 E.31353
G1 X109.378 Y123.575 E.00918
G1 X123.571 Y109.382 E.32651
G1 X124.136 Y109.382 E.00918
G1 X109.378 Y124.139 E.3395
G2 X109.432 Y124.39 I.362 J.053 E.00425
G2 X109.66 Y124.422 I.179 J-.444 E.00379
G1 X124.422 Y109.66 E.33959
G1 X124.422 Y110.225 E.00918
G1 X110.225 Y124.422 E.3266
G1 X110.79 Y124.422 E.00918
G1 X124.422 Y110.789 E.31361
G1 X124.422 Y111.354 E.00918
G1 X111.354 Y124.422 E.30062
G1 X111.919 Y124.422 E.00918
G1 X124.422 Y111.919 E.28763
G1 X124.422 Y112.483 E.00918
G1 X112.483 Y124.422 E.27464
G1 X113.048 Y124.422 E.00918
G1 X124.422 Y113.048 E.26165
G1 X124.422 Y113.613 E.00918
G1 X113.613 Y124.422 E.24866
G1 X114.177 Y124.422 E.00918
G1 X124.422 Y114.177 E.23567
G1 X124.422 Y114.742 E.00918
G1 X114.742 Y124.422 E.22269
G1 X115.307 Y124.422 E.00918
G1 X124.422 Y115.307 E.2097
G1 X124.422 Y115.871 E.00918
G1 X115.871 Y124.422 E.19671
G1 X116.436 Y124.422 E.00918
G1 X124.422 Y116.436 E.18372
G1 X124.422 Y117 E.00918
G1 X117 Y124.422 E.17073
G1 X117.565 Y124.422 E.00918
G1 X124.422 Y117.565 E.15774
G1 X124.422 Y118.13 E.00918
G1 X118.13 Y124.422 E.14475
G1 X118.694 Y124.422 E.00918
G1 X124.422 Y118.694 E.13176
G1 X124.422 Y119.259 E.00918
G1 X119.259 Y124.422 E.11877
G1 X119.823 Y124.422 E.00918
G1 X124.422 Y119.824 E.10578
G1 X124.422 Y120.388 E.00918
G1 X120.388 Y124.422 E.09279
G1 X120.953 Y124.422 E.00918
G1 X124.422 Y120.953 E.0798
G1 X124.422 Y121.517 E.00918
G1 X121.517 Y124.422 E.06682
G1 X122.082 Y124.422 E.00918
G1 X124.422 Y122.082 E.05383
G1 X124.422 Y122.647 E.00918
G1 X122.647 Y124.422 E.04084
G1 X123.211 Y124.422 E.00918
G1 X124.422 Y123.211 E.02785
G1 X124.422 Y123.776 E.00918
G1 X123.596 Y124.601 E.01898
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X124.422 Y123.776 E-.44349
G1 X124.422 Y123.211 E-.21456
G1 X124.232 Y123.401 E-.10195
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 13/53
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S178.5
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.056 J1.216 P1  F42000
G1 X149.102 Y122.26 Z1.6
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
M73 P64 R9
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
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
M73 P64 R8
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
M73 P65 R8
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
G1 X110.302 Y125.54 Z1.7 F42000
G1 X117.409 Y116.211 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X116.866 Y116.038 I-.518 J.688 E.08431
G1 X116.951 Y116.04 E.00148
G3 X117.36 Y116.177 I-.059 J.859 E.00762
M204 S10000
G1 X117.678 Y115.872 F42000
G1 F6000
M204 S6000
G1 X117.845 Y116.028 E.00399
G3 X116.861 Y115.61 I-.952 J.871 E.12228
M73 P66 R8
G1 X116.976 Y115.612 E.00201
G3 X117.628 Y115.839 I-.083 J1.287 E.0122
; WIPE_START
G1 X117.845 Y116.028 E-.10942
G1 X117.996 Y116.218 E-.09217
G1 X118.114 Y116.46 E-.10233
G1 X118.177 Y116.709 E-.09742
G1 X118.189 Y116.951 E-.09216
G1 X118.158 Y117.192 E-.09219
G1 X118.085 Y117.413 E-.08841
G1 X117.975 Y117.61 E-.08588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.256 Y111.291 Z1.7 F42000
G1 X124.375 Y108.163 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.447 Y108.163 E.00116
G3 X125.644 Y109.492 I-.153 J1.342 E.03174
G1 X125.644 Y124.321 E.24079
G3 X124.307 Y125.644 I-1.336 J-.013 E.03387
G1 X109.479 Y125.644 E.24077
G3 X108.156 Y124.306 I.013 J-1.336 E.03389
G1 X108.157 Y109.479 E.24076
G3 X109.43 Y108.158 I1.348 J.025 E.03278
G1 X124.315 Y108.163 E.24169
; WIPE_START
M204 S6000
G1 X124.447 Y108.163 E-.05001
G1 X124.703 Y108.215 E-.09939
G1 X124.902 Y108.294 E-.08155
G1 X125.126 Y108.434 E-.1002
G1 X125.316 Y108.613 E-.09927
G1 X125.443 Y108.786 E-.08143
G1 X125.555 Y109.01 E-.09511
G1 X125.624 Y109.262 E-.0995
G1 X125.636 Y109.403 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.414 Y109.352 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X124.448 Y108.385 E.02219
G1 X123.875 Y108.376
G1 X125.425 Y109.925 E.03559
G1 X125.425 Y110.489
G1 X123.311 Y108.376 E.04853
G1 X122.748 Y108.376
G1 X125.425 Y111.053 E.06147
G1 X125.425 Y111.616
G1 X122.184 Y108.376 E.07441
G1 X121.621 Y108.376
G1 X125.425 Y112.18 E.08735
G1 X125.425 Y112.743
G1 X121.057 Y108.376 E.10029
G1 X120.494 Y108.376
G1 X125.425 Y113.307 E.11323
G1 X125.425 Y113.871
G1 X119.93 Y108.376 E.12618
G1 X119.366 Y108.376
G1 X125.424 Y114.434 E.13912
G1 X125.424 Y114.998
G1 X118.803 Y108.376 E.15206
G1 X118.239 Y108.376
G1 X125.424 Y115.561 E.165
G1 X125.424 Y116.125
G1 X117.676 Y108.376 E.17794
G1 X117.112 Y108.376
G1 X125.424 Y116.689 E.19088
G1 X125.424 Y117.252
G1 X116.549 Y108.376 E.20382
G1 X115.985 Y108.377
G1 X125.424 Y117.816 E.21676
G1 X125.424 Y118.379
G1 X115.422 Y108.377 E.2297
G1 X114.858 Y108.377
G1 X125.424 Y118.943 E.24265
G1 X125.424 Y119.507
G1 X114.294 Y108.377 E.25559
G1 X113.731 Y108.377
G1 X125.424 Y120.07 E.26853
G1 X125.424 Y120.634
G1 X113.167 Y108.377 E.28147
G1 X112.604 Y108.377
G1 X125.424 Y121.197 E.29441
G1 X125.424 Y121.761
G1 X112.04 Y108.377 E.30735
G1 X111.477 Y108.377
G1 X125.424 Y122.325 E.32029
G1 X125.424 Y122.888
G1 X110.913 Y108.377 E.33323
G1 X110.35 Y108.377
G1 X117.453 Y115.48 E.16311
G1 X116.789 Y115.38
G1 X109.786 Y108.377 E.16081
G1 X109.249 Y108.403
G1 X116.332 Y115.486 E.16265
G1 X115.973 Y115.691
G1 X108.856 Y108.574 E.16343
G1 X108.574 Y108.856
G1 X115.69 Y115.972 E.1634
G1 X115.486 Y116.332
G1 X108.403 Y109.248 E.16266
G1 X108.376 Y109.785
G1 X115.38 Y116.789 E.16085
G1 X115.48 Y117.453
G1 X108.376 Y110.348 E.16314
; WIPE_START
M204 S6000
G1 X109.79 Y111.763 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.513 Y115.376 Z1.7 F42000
G1 X118.321 Y116.348 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X125.424 Y123.452 E.16312
G1 X125.424 Y124.015
G1 X118.42 Y117.011 E.16085
G1 X118.314 Y117.469
G1 X125.397 Y124.552 E.16266
G1 X125.226 Y124.944
G1 X118.109 Y117.828 E.16342
G1 X117.828 Y118.11
G1 X124.944 Y125.226 E.16342
G1 X124.552 Y125.397
G1 X117.468 Y118.314 E.16266
G1 X117.011 Y118.42
G1 X124.016 Y125.425 E.16085
G1 X123.452 Y125.425
G1 X116.347 Y118.32 E.16315
; WIPE_START
M204 S6000
G1 X117.761 Y119.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.87 Y125.405 Z1.7 F42000
G1 X122.888 Y125.425 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X108.376 Y110.912 E.33327
G1 X108.376 Y111.476
G1 X122.325 Y125.425 E.32032
G1 X121.761 Y125.425
G1 X108.376 Y112.039 E.30738
G1 X108.376 Y112.603
G1 X121.197 Y125.425 E.29444
G1 X120.634 Y125.425
G1 X108.376 Y113.166 E.2815
G1 X108.376 Y113.73
G1 X120.07 Y125.425 E.26855
G1 X119.507 Y125.425
G1 X108.376 Y114.294 E.25561
G1 X108.376 Y114.857
G1 X118.943 Y125.424 E.24267
G1 X118.379 Y125.424
G1 X108.376 Y115.421 E.22973
G1 X108.376 Y115.984
G1 X117.816 Y125.424 E.21678
G1 X117.252 Y125.424
G1 X108.376 Y116.548 E.20384
G1 X108.376 Y117.112
G1 X116.688 Y125.424 E.1909
G1 X116.125 Y125.424
G1 X108.376 Y117.675 E.17796
G1 X108.376 Y118.239
G1 X115.561 Y125.424 E.16501
G1 X114.998 Y125.424
G1 X108.376 Y118.802 E.15207
G1 X108.376 Y119.366
G1 X114.434 Y125.424 E.13913
G1 X113.87 Y125.424
G1 X108.376 Y119.93 E.12618
G1 X108.375 Y120.493
G1 X113.307 Y125.424 E.11324
G1 X112.743 Y125.424
G1 X108.375 Y121.057 E.1003
G1 X108.375 Y121.62
G1 X112.18 Y125.424 E.08736
G1 X111.616 Y125.424
G1 X108.375 Y122.184 E.07441
G1 X108.375 Y122.747
G1 X111.052 Y125.424 E.06147
G1 X110.489 Y125.424
G1 X108.375 Y123.311 E.04853
G1 X108.375 Y123.875
G1 X109.925 Y125.424 E.03559
G1 X109.352 Y125.415
G1 X108.385 Y124.448 E.0222
M204 S10000
G1 X108.826 Y125.204 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.074282
G1 F15000
M204 S6000
G3 X108.602 Y124.979 I1.704 J-1.924 E.00068
; WIPE_START
G1 X108.826 Y125.204 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.671 Y117.573 Z1.7 F42000
G1 X108.497 Y109.061 Z1.7
G1 Z1.3
M73 P67 R8
G1 E.8 F1800
; LINE_WIDTH: 0.0790647
G1 F15000
M204 S6000
G1 X108.408 Y109.218 E.00042
; WIPE_START
G1 X108.497 Y109.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.129 Y108.952 Z1.7 F42000
G1 X125.198 Y108.822 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0740274
G1 F15000
M204 S6000
G2 X124.971 Y108.596 I-2.67 J2.456 E.00069
; WIPE_START
G1 X125.198 Y108.822 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.049 Y114.456 Z1.7 F42000
G1 X118.308 Y116.361 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.180724
G1 F15000
M204 S6000
G1 X118.336 Y116.208 E.00101
G1 X118.231 Y116.068 E.00113
; LINE_WIDTH: 0.126283
G1 X117.942 Y115.752 E.00183
G1 X117.699 Y115.543 E.00137
; LINE_WIDTH: 0.182416
G1 X117.52 Y115.413 E.00145
; WIPE_START
G1 X117.699 Y115.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.933 Y118.498 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.092523
G1 F15000
M204 S6000
G1 X116.707 Y118.398 E.00072
M204 S10000
G1 X117.027 Y118.404 F42000
; LINE_WIDTH: 0.0916638
G1 F15000
M204 S6000
G1 X116.806 Y118.497 E.00069
M204 S10000
G1 X116.28 Y118.387 F42000
; LINE_WIDTH: 0.193148
G1 F15000
M204 S6000
G1 X116.151 Y118.295 E.00111
; LINE_WIDTH: 0.160862
G1 X116.045 Y118.212 E.00077
; LINE_WIDTH: 0.124229
G1 X115.822 Y118.013 E.00125
G1 X115.56 Y117.721 E.00165
; LINE_WIDTH: 0.175946
G1 X115.465 Y117.593 E.001
G1 X115.471 Y117.554 E.00025
; LINE_WIDTH: 0.140176
G1 X115.476 Y117.532 E.00011
; LINE_WIDTH: 0.103731
G1 X115.494 Y117.439 E.00032
M204 S10000
G1 X115.469 Y116.375 F42000
; LINE_WIDTH: 0.0763834
G1 F15000
M204 S6000
G1 X115.385 Y116.512 E.00036
; WIPE_START
G1 X115.469 Y116.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.121 Y117.274 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.307 Y117.078 E.00439
G1 X117.331 Y116.836 E.00395
G1 X117.23 Y116.604 E.00411
G1 X117.084 Y116.499 E.00291
G1 X116.828 Y116.464 E.0042
G1 X116.614 Y116.572 E.00389
G1 X116.47 Y116.8 E.00439
G1 X116.485 Y117.05 E.00407
G1 X116.642 Y117.25 E.00413
G1 X116.86 Y117.342 E.00384
G1 X117.063 Y117.289 E.0034
M204 S10000
G1 X116.933 Y116.856 F42000
; LINE_WIDTH: 0.4766
G1 F15000
M204 S6000
G2 X116.929 Y116.954 I-.028 J.048 E.00431
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.876 Y116.954 E-.18211
G1 X116.847 Y116.905 E-.19264
G1 X116.876 Y116.856 E-.19265
G1 X116.933 Y116.856 E-.1926
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 14/53
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S188.7
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I-.202 J1.2 P1  F42000
G1 X149.102 Y122.26 Z1.7
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
M73 P68 R8
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
M73 P68 R7
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
M73 P69 R7
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
G1 X110.463 Y125.667 Z1.8 F42000
G1 X124.362 Y108.404 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.421 Y109.685 I-.254 J1.289 E.02922
G1 X125.421 Y124.115 E.23432
G3 X124.115 Y125.421 I-1.314 J-.008 E.03325
G1 X109.685 Y125.421 E.23432
G3 X108.379 Y124.115 I.008 J-1.314 E.03325
G1 X108.379 Y109.685 E.23432
G3 X109.685 Y108.379 I1.314 J.008 E.03325
G1 X124.115 Y108.379 E.23432
G3 X124.303 Y108.394 I-.008 J1.314 E.00306
; WIPE_START
M204 S6000
G1 X124.609 Y108.478 E-.12072
G1 X124.837 Y108.6 E-.0981
G1 X125.036 Y108.764 E-.09812
G1 X125.2 Y108.963 E-.09813
G1 X125.322 Y109.191 E-.09814
G1 X125.397 Y109.438 E-.09811
G1 X125.421 Y109.685 E-.09415
G1 X125.421 Y109.828 E-.05454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.937 Y108.329 Z1.8 F42000
G1 X116.958 Y108.133 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.465 Y108.135 E.1219
G3 X125.672 Y109.475 I-.155 J1.353 E.032
G1 X125.672 Y124.339 E.24136
G3 X124.324 Y125.672 I-1.347 J-.015 E.03414
G1 X109.461 Y125.672 E.24135
G3 X108.128 Y124.323 I.015 J-1.347 E.03415
G1 X108.128 Y109.461 E.24133
G3 X109.411 Y108.13 I1.359 J.027 E.03301
G1 X116.898 Y108.132 E.12157
; WIPE_START
M204 S6000
G1 X118.898 Y108.133 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.995 Y115.192 Z1.8 F42000
G1 X115.745 Y115.798 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X115.975 Y115.594 E.00536
G3 X116.858 Y115.303 I.92 J1.305 E.01647
G1 X116.994 Y115.306 E.00238
G3 X115.702 Y115.838 I-.1 J1.593 E.1499
M204 S10000
G1 X115.465 Y115.476 F42000
G1 F6000
M204 S6000
G1 X115.728 Y115.245 E.0061
G3 X116.854 Y114.874 I1.169 J1.654 E.02101
G1 X117.02 Y114.878 E.0029
G3 X115.419 Y115.514 I-.123 J2.022 E.19112
M204 S250
G1 X115.195 Y115.165 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.489 Y114.909 E.00634
G3 X116.849 Y114.461 I1.41 J1.99 E.0236
G1 X117.044 Y114.464 E.00316
G3 X115.124 Y115.227 I-.146 J2.435 E.21418
G1 X115.149 Y115.204 E.00055
; WIPE_START
M204 S6000
G1 X115.489 Y114.909 E-.17111
G1 X115.909 Y114.67 E-.18361
G1 X116.37 Y114.518 E-.18445
G1 X116.849 Y114.461 E-.18336
G1 X116.948 Y114.463 E-.03747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.064 Y116.566 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X116.803 Y116.533 E.00426
G1 X116.618 Y116.647 E.00353
G1 X116.525 Y116.843 E.00352
G1 X116.595 Y117.125 E.00473
G1 X116.774 Y117.257 E.00361
G1 X116.992 Y117.268 E.00355
G1 X117.184 Y117.149 E.00367
G1 X117.276 Y116.948 E.00359
G1 X117.279 Y116.879 E.00113
G1 X117.197 Y116.664 E.00373
G1 X117.112 Y116.601 E.00172
M204 S10000
G1 X116.929 Y116.87 F42000
; LINE_WIDTH: 0.35916
G1 F15000
M204 S6000
G1 X116.866 Y116.907 E.00101
G1 X116.913 Y116.934 E.00076
M204 S10000
G1 X116.171 Y116.633 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X116.122 Y116.926 E.00482
G1 X116.238 Y117.312 E.00653
G1 X116.424 Y117.519 E.00452
G1 X116.701 Y117.656 E.00502
G1 X117.017 Y117.673 E.00513
G1 X117.306 Y117.567 E.005
G1 X117.532 Y117.359 E.005
G1 X117.661 Y117.079 E.00499
G1 X117.677 Y116.857 E.00362
G1 X117.592 Y116.548 E.0052
G1 X117.401 Y116.305 E.00502
G1 X117.236 Y116.197 E.00319
G1 X116.844 Y116.124 E.00648
G1 X116.57 Y116.196 E.0046
G1 X116.324 Y116.377 E.00496
G1 X116.201 Y116.582 E.00387
M204 S10000
G1 X115.776 Y117.201 F42000
G1 F15000
M204 S6000
G1 X115.882 Y117.498 E.00512
G1 X116.179 Y117.836 E.00731
G1 X116.598 Y118.042 E.00759
G1 X117.073 Y118.069 E.00772
G1 X117.512 Y117.911 E.00758
G1 X117.856 Y117.595 E.00758
G1 X118.05 Y117.171 E.00757
G2 X118.01 Y116.494 I-1.296 J-.263 E.01115
G1 X117.766 Y116.096 E.00758
G1 X117.385 Y115.823 E.00761
G1 X116.962 Y115.721 E.00707
G1 X116.516 Y115.782 E.00731
G1 X116.113 Y116.019 E.00759
G1 X115.833 Y116.391 E.00756
G1 X115.719 Y116.861 E.00786
G1 X115.766 Y117.142 E.00462
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X115.719 Y116.861 E-.10805
G1 X115.833 Y116.391 E-.18398
G1 X116.113 Y116.019 E-.1769
G1 X116.516 Y115.782 E-.17764
G1 X116.812 Y115.742 E-.11343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 15/53
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S160.65
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.247 J1.192 P1  F42000
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
M73 P70 R7
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
M73 P71 R7
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
M73 P72 R7
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
M73 P72 R6
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
M73 P73 R6
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
M73 P74 R6
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
G1 X125.807 Y122.371 Z1.9 F42000
G1 X124.374 Y108.382 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.443 Y109.675 I-.257 J1.301 E.02949
G1 X125.443 Y124.125 E.23464
G3 X124.125 Y125.443 I-1.326 J-.008 E.03356
G1 X109.675 Y125.443 E.23464
G3 X108.357 Y124.125 I.008 J-1.326 E.03356
G1 X108.357 Y109.675 E.23464
G3 X109.675 Y108.357 I1.326 J.008 E.03356
G1 X124.125 Y108.357 E.23464
G3 X124.315 Y108.372 I-.008 J1.326 E.00309
; WIPE_START
M204 S6000
G1 X124.623 Y108.457 E-.12164
G1 X124.853 Y108.58 E-.099
G1 X125.055 Y108.745 E-.09903
G1 X125.22 Y108.947 E-.09904
G1 X125.343 Y109.177 E-.09901
G1 X125.418 Y109.426 E-.09904
G1 X125.443 Y109.675 E-.09507
G1 X125.443 Y109.802 E-.04817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.959 Y108.304 Z1.9 F42000
G1 X116.959 Y108.104 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.484 Y108.107 E.1222
G3 X125.698 Y109.392 I-.142 J1.35 E.03127
G1 X125.7 Y124.358 E.24301
G3 X124.341 Y125.7 I-1.359 J-.017 E.0344
G1 X109.442 Y125.7 E.24193
G3 X108.1 Y124.34 I.017 J-1.359 E.03442
G1 X108.1 Y109.442 E.24191
G3 X109.392 Y108.102 I1.371 J.028 E.03323
G1 X116.899 Y108.104 E.12189
; WIPE_START
M204 S6000
G1 X118.899 Y108.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.005 Y115.168 Z1.9 F42000
G1 X115.748 Y115.795 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X115.926 Y115.629 E.00424
G3 X116.858 Y115.303 I.968 J1.27 E.01753
G1 X116.992 Y115.306 E.00234
G3 X115.704 Y115.834 I-.098 J1.594 E.15001
M204 S10000
G1 X115.462 Y115.478 F42000
G1 F6000
M204 S6000
G1 X115.665 Y115.291 E.00483
G3 X116.854 Y114.874 I1.23 J1.609 E.02236
G1 X117.017 Y114.877 E.00286
G3 X115.416 Y115.516 I-.121 J2.022 E.19109
M204 S250
G1 X115.185 Y115.172 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.414 Y114.964 E.00502
G3 X116.85 Y114.461 I1.484 J1.935 E.02512
G1 X117.042 Y114.464 E.00312
G3 X115.123 Y115.226 I-.144 J2.435 E.21422
G1 X115.14 Y115.211 E.00037
; WIPE_START
M204 S6000
M73 P75 R6
G1 X115.414 Y114.964 E-.14023
G1 X115.652 Y114.803 E-.10917
G1 X115.907 Y114.671 E-.10909
G1 X116.369 Y114.519 E-.18474
G1 X116.85 Y114.461 E-.18403
G1 X116.936 Y114.462 E-.03275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.073 Y116.569 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X116.8 Y116.535 E.00446
G1 X116.621 Y116.643 E.0034
G1 X116.525 Y116.844 E.00362
G1 X116.595 Y117.125 E.00471
G1 X116.772 Y117.257 E.00359
G1 X116.993 Y117.268 E.0036
G1 X117.187 Y117.148 E.0037
G1 X117.276 Y116.948 E.00356
G1 X117.279 Y116.881 E.00107
G1 X117.199 Y116.667 E.00372
G1 X117.12 Y116.605 E.00162
M204 S10000
G1 X116.928 Y116.871 F42000
; LINE_WIDTH: 0.36074
G1 F15000
M204 S6000
G1 X116.864 Y116.908 E.00102
G1 X116.912 Y116.936 E.00077
M204 S10000
G1 X117.636 Y117.149 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.677 Y116.859 E.00474
G1 X117.593 Y116.548 E.00523
G1 X117.421 Y116.323 E.00461
G1 X117.24 Y116.199 E.00356
G1 X116.845 Y116.124 E.00652
G1 X116.567 Y116.198 E.00467
G1 X116.327 Y116.374 E.00484
G1 X116.167 Y116.64 E.00505
G1 X116.122 Y116.845 E.0034
G1 X116.2 Y117.238 E.0065
G1 X116.364 Y117.464 E.00454
G1 X116.634 Y117.631 E.00515
G1 X116.942 Y117.676 E.00505
G1 X117.229 Y117.605 E.0048
G1 X117.482 Y117.415 E.00514
G1 X117.606 Y117.201 E.00402
M204 S10000
G1 X118.075 Y116.837 F42000
G1 F15000
M204 S6000
G1 X118.006 Y116.486 E.00582
G1 X117.766 Y116.096 E.00744
G1 X117.389 Y115.825 E.00753
G1 X116.962 Y115.721 E.00714
G1 X116.509 Y115.785 E.00743
G1 X116.106 Y116.025 E.0076
G1 X115.826 Y116.407 E.0077
G1 X115.72 Y116.846 E.00733
G1 X115.781 Y117.276 E.00706
G1 X116.003 Y117.669 E.00733
G1 X116.387 Y117.965 E.00787
G1 X116.82 Y118.079 E.00728
G1 X117.291 Y118.015 E.00771
G1 X117.693 Y117.776 E.0076
G1 X117.967 Y117.409 E.00743
G1 X118.081 Y116.946 E.00774
G1 X118.078 Y116.897 E.0008
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X118.081 Y116.946 E-.01863
G1 X117.967 Y117.409 E-.18123
G1 X117.693 Y117.776 E-.17384
G1 X117.291 Y118.015 E-.17777
G1 X116.82 Y118.079 E-.18045
G1 X116.749 Y118.06 E-.02807
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
G3 Z1.9 I.956 J.753 P1  F42000
G1 X124.386 Y108.36 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
M204 S5000
G3 X125.465 Y109.665 I-.259 J1.313 E.02977
G1 X125.465 Y124.135 E.23496
G3 X124.135 Y125.465 I-1.338 J-.008 E.03387
G1 X109.665 Y125.465 E.23496
G3 X108.335 Y124.135 I.008 J-1.338 E.03387
G1 X108.335 Y109.665 E.23496
G3 X109.665 Y108.335 I1.338 J.008 E.03387
G1 X124.135 Y108.335 E.23496
G3 X124.327 Y108.35 I-.008 J1.338 E.00313
; WIPE_START
G1 F3600
M204 S6000
G1 X124.638 Y108.436 E-.12256
G1 X124.87 Y108.56 E-.0999
G1 X125.073 Y108.727 E-.09996
G1 X125.24 Y108.93 E-.09993
G1 X125.364 Y109.162 E-.09992
G1 X125.44 Y109.414 E-.09994
G1 X125.465 Y109.665 E-.09597
G1 X125.465 Y109.775 E-.04181
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.98 Y108.279 Z2 F42000
G1 X116.959 Y108.075 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1893
M204 S5000
G1 X124.503 Y108.079 E.1225
G3 X125.727 Y109.373 I-.144 J1.362 E.03149
G1 X125.728 Y124.377 E.24363
G3 X124.358 Y125.729 I-1.37 J-.018 E.03466
G1 X109.423 Y125.728 E.2425
G3 X108.071 Y124.357 I.018 J-1.37 E.03468
G1 X108.072 Y109.423 E.24249
G3 X109.423 Y108.072 I1.37 J.018 E.03435
G1 X116.899 Y108.075 E.12139
; WIPE_START
G1 F3600
M204 S6000
G1 X118.899 Y108.076 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.016 Y115.143 Z2 F42000
G1 X115.75 Y115.794 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
M204 S6000
G1 X115.923 Y115.631 E.00415
G3 X116.858 Y115.303 I.97 J1.268 E.0176
G1 X116.99 Y115.306 E.0023
G3 X115.705 Y115.833 I-.096 J1.594 E.15007
M204 S10000
G1 X115.463 Y115.477 F42000
G1 F1893
M204 S6000
G1 X115.662 Y115.293 E.00475
G3 X116.854 Y114.874 I1.233 J1.606 E.02242
G1 X117.015 Y114.877 E.00281
G3 X115.417 Y115.515 I-.12 J2.022 E.19114
M204 S250
G1 X115.186 Y115.171 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
M204 S5000
G1 X115.411 Y114.966 E.00494
G3 X116.849 Y114.461 I1.487 J1.933 E.02518
G1 X117.039 Y114.464 E.00308
G3 X115.122 Y115.227 I-.142 J2.435 E.21423
G1 X115.141 Y115.211 E.00041
; WIPE_START
G1 F3600
M204 S6000
G1 X115.411 Y114.966 E-.13852
G1 X115.652 Y114.803 E-.11052
G1 X115.905 Y114.673 E-.10819
G1 X116.093 Y114.597 E-.07713
G1 X116.371 Y114.518 E-.10966
G1 X116.849 Y114.461 E-.18319
G1 X116.936 Y114.462 E-.03279
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
G1 X115.98 Y117.613 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1893
M204 S6000
G1 X116.186 Y117.84 E.00497
G1 X116.597 Y118.042 E.00745
G1 X117.072 Y118.069 E.00773
G1 X117.505 Y117.916 E.00745
G1 X117.855 Y117.596 E.00771
G1 X118.051 Y117.171 E.0076
G2 X118.007 Y116.487 I-1.301 J-.26 E.01125
G1 X117.76 Y116.09 E.00758
G1 X117.386 Y115.824 E.00745
G1 X116.96 Y115.721 E.00713
G1 X116.517 Y115.782 E.00725
G1 X116.107 Y116.024 E.00773
G1 X115.83 Y116.399 E.00757
G1 X115.719 Y116.862 E.00773
G1 X115.796 Y117.321 E.00756
G1 X115.948 Y117.563 E.00464
M204 S10000
G1 X116.931 Y116.87 F42000
; LINE_WIDTH: 0.35664
G1 F1893
M204 S6000
G1 X116.868 Y116.906 E.00099
G1 X116.915 Y116.933 E.00074
M204 S10000
G1 X117.072 Y116.568 F42000
; LINE_WIDTH: 0.41999
G1 F1893
M204 S6000
G1 X116.805 Y116.533 E.00437
G1 X116.618 Y116.648 E.00358
G1 X116.523 Y116.856 E.00371
G1 X116.558 Y117.064 E.00343
G1 X116.777 Y117.259 E.00476
G1 X116.993 Y117.268 E.0035
G1 X117.187 Y117.147 E.00371
G1 X117.276 Y116.95 E.00351
G1 X117.278 Y116.875 E.00121
G1 X117.195 Y116.662 E.00371
G1 X117.119 Y116.604 E.00155
M204 S10000
G1 X117.166 Y116.181 F42000
G1 F1893
M204 S6000
G1 X116.79 Y116.127 E.00616
G1 X116.499 Y116.229 E.00502
G1 X116.272 Y116.436 E.00498
G1 X116.139 Y116.722 E.00512
G1 X116.129 Y117.029 E.00498
G1 X116.226 Y117.291 E.00455
G1 X116.512 Y117.574 E.00653
G1 X116.774 Y117.668 E.00452
G1 X117.089 Y117.655 E.00512
G1 X117.362 Y117.525 E.00491
G1 X117.57 Y117.295 E.00503
G1 X117.671 Y117.003 E.00502
G1 X117.676 Y116.852 E.00246
G1 X117.591 Y116.545 E.00516
G1 X117.393 Y116.298 E.00514
G1 X117.219 Y116.208 E.00318
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.393 Y116.298 E-.07448
G1 X117.591 Y116.545 E-.12032
G1 X117.676 Y116.852 E-.1208
G1 X117.671 Y117.003 E-.0575
G1 X117.57 Y117.295 E-.11751
G1 X117.362 Y117.525 E-.11779
G1 X117.089 Y117.655 E-.11493
G1 X116.993 Y117.658 E-.03668
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
G3 Z2 I.953 J.757 P1  F42000
G1 X124.398 Y108.339 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1895
M204 S5000
G3 X125.487 Y109.655 I-.261 J1.325 E.03004
G1 X125.487 Y124.145 E.23527
G3 X124.145 Y125.487 I-1.35 J-.008 E.03418
G1 X109.655 Y125.487 E.23527
G3 X108.313 Y124.145 I.008 J-1.35 E.03418
G1 X108.313 Y109.655 E.23527
G3 X109.655 Y108.313 I1.35 J.008 E.03418
G1 X124.145 Y108.313 E.23527
G3 X124.339 Y108.328 I-.008 J1.35 E.00317
; WIPE_START
G1 F3600
M204 S6000
G1 X124.652 Y108.415 E-.12348
G1 X124.886 Y108.54 E-.10082
G1 X125.091 Y108.709 E-.10086
G1 X125.26 Y108.914 E-.10084
G1 X125.385 Y109.148 E-.10084
G1 X125.462 Y109.402 E-.10084
G1 X125.487 Y109.655 E-.09688
G1 X125.487 Y109.749 E-.03544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.002 Y108.255 Z2.1 F42000
G1 X116.959 Y108.047 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X124.522 Y108.051 E.1228
G3 X125.755 Y109.354 I-.146 J1.373 E.03171
G1 X125.757 Y124.395 E.24424
G3 X124.375 Y125.757 I-1.382 J-.02 E.03493
G1 X109.405 Y125.757 E.24307
G3 X108.043 Y124.377 I.031 J-1.393 E.03482
G1 X108.043 Y109.405 E.24311
G3 X109.405 Y108.043 I1.381 J.019 E.0346
G1 X116.899 Y108.047 E.12169
; WIPE_START
G1 F3600
M204 S6000
G1 X118.899 Y108.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.026 Y115.119 Z2.1 F42000
G1 X115.752 Y115.793 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1895
M204 S6000
G1 X115.929 Y115.626 E.00424
G3 X116.858 Y115.303 I.964 J1.273 E.01747
G1 X116.988 Y115.305 E.00226
G3 X115.706 Y115.831 I-.095 J1.594 E.15014
M204 S10000
G1 X115.465 Y115.476 F42000
G1 F1895
M204 S6000
G1 X115.669 Y115.287 E.00485
G3 X116.854 Y114.874 I1.226 J1.612 E.02228
G1 X117.013 Y114.877 E.00278
G3 X115.417 Y115.514 I-.118 J2.022 E.1912
G1 X115.418 Y115.514 E.00002
M204 S250
G1 X115.188 Y115.17 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1895
M204 S5000
G1 X115.417 Y114.96 E.00505
G3 X116.849 Y114.461 I1.479 J1.939 E.02504
G1 X117.037 Y114.464 E.00304
G3 X115.116 Y115.232 I-.14 J2.435 E.21415
G1 X115.143 Y115.209 E.00056
; WIPE_START
G1 F3600
M204 S6000
G1 X115.417 Y114.96 E-.14103
G1 X115.652 Y114.803 E-.10721
G1 X115.902 Y114.674 E-.10716
G1 X116.091 Y114.598 E-.07733
G1 X116.369 Y114.519 E-.10964
G1 X116.849 Y114.461 E-.18398
G1 X116.938 Y114.462 E-.03367
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
G1 X115.776 Y117.201 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1895
M204 S6000
G1 X115.881 Y117.498 E.00512
G1 X116.178 Y117.835 E.00729
G1 X116.599 Y118.043 E.00762
G1 X117.064 Y118.07 E.00757
M73 P76 R6
G1 X117.505 Y117.916 E.00759
G1 X117.846 Y117.609 E.00744
G1 X118.012 Y117.281 E.00598
G1 X118.081 Y116.946 E.00555
G2 X118.01 Y116.493 I-1.739 J.041 E.00746
G1 X117.76 Y116.09 E.00771
G1 X117.386 Y115.824 E.00745
G1 X116.958 Y115.721 E.00715
G1 X116.509 Y115.785 E.00736
G1 X116.107 Y116.024 E.00761
G1 X115.826 Y116.407 E.00771
G1 X115.719 Y116.861 E.00757
G1 X115.766 Y117.142 E.00463
M204 S10000
G1 X116.929 Y116.871 F42000
; LINE_WIDTH: 0.35918
G1 F1895
M204 S6000
G1 X116.866 Y116.907 E.00101
G1 X116.914 Y116.935 E.00076
M204 S10000
G1 X117.077 Y116.569 F42000
; LINE_WIDTH: 0.41999
G1 F1895
M204 S6000
G1 X116.801 Y116.534 E.00452
G1 X116.621 Y116.643 E.0034
G1 X116.526 Y116.84 E.00356
G1 X116.595 Y117.124 E.00476
G1 X116.774 Y117.257 E.00362
G1 X116.991 Y117.268 E.00354
G1 X117.18 Y117.156 E.00355
G1 X117.276 Y116.948 E.00373
G1 X117.279 Y116.878 E.00114
G1 X117.205 Y116.676 E.00349
G1 X117.123 Y116.608 E.00174
M204 S10000
G1 X117.416 Y116.319 F42000
G1 F1895
M204 S6000
G1 X117.239 Y116.198 E.00348
G1 X116.844 Y116.124 E.00652
G1 X116.567 Y116.198 E.00466
G1 X116.327 Y116.374 E.00483
G1 X116.161 Y116.656 E.00532
G1 X116.122 Y116.926 E.00442
G1 X116.238 Y117.311 E.00653
G1 X116.422 Y117.518 E.00449
G1 X116.702 Y117.656 E.00507
G1 X117.009 Y117.673 E.005
G1 X117.3 Y117.571 E.00501
G1 X117.525 Y117.37 E.0049
G1 X117.661 Y117.078 E.00523
G1 X117.677 Y116.856 E.00362
G1 X117.599 Y116.56 E.00496
G1 X117.452 Y116.367 E.00394
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.599 Y116.56 E-.09227
G1 X117.677 Y116.856 E-.11616
G1 X117.661 Y117.078 E-.08461
G1 X117.525 Y117.37 E-.12229
G1 X117.3 Y117.571 E-.11465
G1 X117.009 Y117.673 E-.11719
G1 X116.713 Y117.656 E-.11283
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
G3 Z2.1 I.939 J.774 P1  F42000
G1 X124.41 Y108.317 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1901
M204 S5000
G3 X125.509 Y109.646 I-.264 J1.337 E.03031
G1 X125.509 Y124.154 E.23559
G3 X124.154 Y125.509 I-1.362 J-.008 E.0345
G1 X109.646 Y125.509 E.23559
G3 X108.291 Y124.154 I.008 J-1.362 E.0345
G1 X108.291 Y109.646 E.23559
G3 X109.646 Y108.291 I1.362 J.008 E.0345
G1 X124.154 Y108.291 E.23559
G3 X124.351 Y108.307 I-.008 J1.362 E.00321
; WIPE_START
G1 F3600
M204 S6000
G1 X124.667 Y108.394 E-.12439
G1 X124.903 Y108.52 E-.10173
G1 X125.11 Y108.69 E-.10176
G1 X125.28 Y108.897 E-.10176
G1 X125.406 Y109.133 E-.10174
G1 X125.484 Y109.39 E-.10175
G1 X125.509 Y109.646 E-.09779
G1 X125.509 Y109.722 E-.02907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.023 Y108.231 Z2.2 F42000
G1 X116.959 Y108.019 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1901
M204 S5000
G1 X124.541 Y108.022 E.1231
G3 X125.783 Y109.335 I-.147 J1.384 E.03194
G1 X125.785 Y124.413 E.24484
G3 X124.392 Y125.785 I-1.393 J-.021 E.03519
G1 X109.387 Y125.785 E.24365
G3 X108.015 Y124.394 I.033 J-1.405 E.03507
G1 X108.015 Y109.387 E.24369
G3 X109.387 Y108.015 I1.393 J.021 E.03484
G1 X116.899 Y108.019 E.12199
; WIPE_START
G1 F3600
M204 S6000
G1 X118.899 Y108.02 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.034 Y115.094 Z2.2 F42000
G1 X115.752 Y115.792 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1901
M204 S6000
G1 X115.923 Y115.631 E.0041
G3 X116.858 Y115.303 I.969 J1.269 E.0176
G1 X116.986 Y115.305 E.00223
G3 X115.707 Y115.83 I-.094 J1.594 E.15019
M204 S10000
G1 X115.465 Y115.475 F42000
G1 F1901
M204 S6000
G1 X115.662 Y115.292 E.00469
G3 X116.854 Y114.874 I1.232 J1.607 E.02242
G1 X117.01 Y114.877 E.00273
G3 X115.418 Y115.512 I-.116 J2.022 E.19128
M204 S250
G1 X115.188 Y115.169 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1901
M204 S5000
G1 X115.41 Y114.965 E.0049
G3 X116.85 Y114.461 I1.486 J1.934 E.02519
G1 X117.034 Y114.464 E.003
G3 X115.122 Y115.225 I-.138 J2.435 E.21433
M73 P76 R5
G1 X115.143 Y115.208 E.00043
; WIPE_START
G1 F3600
M204 S6000
G1 X115.41 Y114.965 E-.1374
G1 X115.652 Y114.803 E-.11055
G1 X115.9 Y114.675 E-.1062
G1 X116.093 Y114.597 E-.079
G1 X116.36 Y114.521 E-.10527
G1 X116.562 Y114.484 E-.07815
G1 X116.85 Y114.461 E-.10969
G1 X116.938 Y114.462 E-.03375
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
G1 X118.075 Y116.836 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1901
M204 S6000
G1 X118.006 Y116.485 E.0058
G1 X117.76 Y116.09 E.00754
G1 X117.387 Y115.824 E.00745
G1 X116.956 Y115.721 E.00719
G1 X116.518 Y115.782 E.00719
G1 X116.107 Y116.024 E.00775
G1 X115.826 Y116.407 E.00771
G1 X115.719 Y116.862 E.00759
G1 X115.793 Y117.313 E.00742
G1 X116.03 Y117.699 E.00736
G1 X116.384 Y117.963 E.00717
G1 X116.829 Y118.079 E.00747
G1 X117.29 Y118.015 E.00755
G1 X117.693 Y117.776 E.0076
G1 X117.974 Y117.393 E.00772
G1 X118.081 Y116.946 E.00746
G1 X118.078 Y116.895 E.00082
M204 S10000
G1 X117.073 Y116.568 F42000
G1 F1901
M204 S6000
G1 X116.805 Y116.533 E.00439
G1 X116.621 Y116.643 E.00347
G1 X116.524 Y116.854 E.00378
G1 X116.555 Y117.056 E.00332
G1 X116.769 Y117.255 E.00475
G1 X116.992 Y117.268 E.00363
G1 X117.181 Y117.154 E.00357
G1 X117.276 Y116.949 E.00367
G1 X117.279 Y116.881 E.00111
G1 X117.206 Y116.677 E.00351
G1 X117.119 Y116.606 E.00181
M204 S10000
G1 X116.932 Y116.87 F42000
; LINE_WIDTH: 0.35422
G1 F1901
M204 S6000
G1 X116.87 Y116.906 E.00098
G1 X116.916 Y116.932 E.00073
M204 S10000
G1 X116.371 Y117.457 F42000
; LINE_WIDTH: 0.41999
G1 F1901
M204 S6000
G1 X116.7 Y117.655 E.00623
G1 X117.014 Y117.673 E.00511
G1 X117.3 Y117.571 E.00492
G1 X117.528 Y117.365 E.005
G1 X117.661 Y117.078 E.00513
G1 X117.677 Y116.858 E.00358
G1 X117.6 Y116.56 E.005
G1 X117.418 Y116.32 E.00488
G1 X117.239 Y116.199 E.00351
G1 X116.843 Y116.124 E.00655
G1 X116.567 Y116.198 E.00462
G1 X116.327 Y116.374 E.00484
G1 X116.164 Y116.65 E.00522
G1 X116.125 Y116.96 E.00507
G1 X116.215 Y117.269 E.00522
G1 X116.333 Y117.41 E.00299
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.215 Y117.269 E-.06986
G1 X116.125 Y116.96 E-.12226
G1 X116.164 Y116.65 E-.11871
G1 X116.327 Y116.374 E-.12213
G1 X116.567 Y116.198 E-.1132
G1 X116.843 Y116.124 E-.10823
G1 X117.116 Y116.175 E-.1056
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
G3 Z2.2 I.892 J.827 P1  F42000
G1 X124.422 Y108.295 Z2.2
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1901
M204 S5000
G3 X125.531 Y109.636 I-.266 J1.349 E.03058
G1 X125.531 Y124.164 E.23591
G3 X124.164 Y125.531 I-1.375 J-.008 E.03481
G1 X109.636 Y125.531 E.23591
G3 X108.269 Y124.164 I.008 J-1.375 E.03481
G1 X108.269 Y109.636 E.23591
G3 X109.636 Y108.269 I1.375 J.008 E.03481
G1 X124.164 Y108.269 E.23591
G3 X124.363 Y108.285 I-.008 J1.375 E.00325
; WIPE_START
G1 F3600
M204 S6000
G1 X124.681 Y108.373 E-.12529
G1 X124.919 Y108.501 E-.10265
G1 X125.128 Y108.672 E-.10264
G1 X125.3 Y108.881 E-.10269
G1 X125.427 Y109.119 E-.10264
G1 X125.505 Y109.378 E-.10267
G1 X125.531 Y109.636 E-.0987
G1 X125.531 Y109.696 E-.02272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.045 Y108.206 Z2.3 F42000
G1 X116.96 Y107.991 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F1901
M204 S5000
G1 X124.559 Y107.994 E.1234
G3 X125.811 Y109.316 I-.149 J1.395 E.03216
G1 X125.813 Y124.432 E.24546
G3 X124.409 Y125.814 I-1.404 J-.023 E.03546
G1 X109.368 Y125.813 E.24423
G3 X107.986 Y124.411 I.035 J-1.416 E.03534
G1 X107.987 Y109.368 E.24426
G3 X109.368 Y107.987 I1.404 J.023 E.03508
G1 X116.9 Y107.991 E.1223
; WIPE_START
G1 F3600
M204 S6000
G1 X118.9 Y107.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.045 Y115.07 Z2.3 F42000
G1 X115.754 Y115.791 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1901
M204 S6000
G1 X115.934 Y115.626 E.00426
M73 P77 R5
G3 X116.859 Y115.303 I.963 J1.273 E.01739
G1 X116.994 Y115.305 E.00237
G3 X115.71 Y115.831 I-.097 J1.593 E.15005
M204 S10000
G1 X115.468 Y115.474 F42000
G1 F1901
M204 S6000
G1 X115.673 Y115.286 E.00487
G3 X116.854 Y114.874 I1.224 J1.613 E.0222
G1 X117.014 Y114.877 E.0028
G3 X115.415 Y115.519 I-.118 J2.021 E.19102
G1 X115.422 Y115.513 E.00015
M204 S250
G1 X115.191 Y115.169 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1901
M204 S5000
G1 X115.422 Y114.957 E.00508
G3 X116.85 Y114.461 I1.475 J1.941 E.02496
G1 X117.034 Y114.464 E.00299
G3 X115.113 Y115.236 I-.137 J2.434 E.21401
G1 X115.145 Y115.208 E.00069
; WIPE_START
G1 F3600
M204 S6000
G1 X115.422 Y114.957 E-.14173
G1 X115.652 Y114.803 E-.10532
G1 X115.898 Y114.676 E-.10523
G1 X116.093 Y114.597 E-.08001
G1 X116.357 Y114.522 E-.10427
G1 X116.562 Y114.484 E-.07919
G1 X116.85 Y114.461 E-.10964
G1 X116.941 Y114.462 E-.03462
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
G1 X115.775 Y117.201 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1901
M204 S6000
G1 X115.952 Y117.596 E.00702
G1 X116.178 Y117.835 E.00534
G1 X116.598 Y118.042 E.0076
G1 X117.072 Y118.069 E.00772
G1 X117.506 Y117.915 E.00747
G1 X117.851 Y117.603 E.00756
G1 X118.051 Y117.17 E.00774
G1 X118.074 Y116.835 E.00545
G1 X118.006 Y116.485 E.00579
G1 X117.761 Y116.09 E.00755
G1 X117.378 Y115.82 E.00761
G1 X116.964 Y115.721 E.00692
G1 X116.518 Y115.782 E.00731
G1 X116.107 Y116.024 E.00776
G1 X115.826 Y116.407 E.0077
G1 X115.719 Y116.863 E.00761
G1 X115.765 Y117.142 E.0046
M204 S10000
G1 X116.929 Y116.869 F42000
; LINE_WIDTH: 0.3607
G1 F1901
M204 S6000
G1 X116.865 Y116.906 E.00102
G1 X116.914 Y116.934 E.00077
M204 S10000
G1 X117.064 Y116.564 F42000
; LINE_WIDTH: 0.41999
G1 F1901
M204 S6000
G1 X116.806 Y116.532 E.00422
G1 X116.621 Y116.643 E.00349
G1 X116.525 Y116.841 E.00358
G1 X116.592 Y117.122 E.00469
G1 X116.77 Y117.256 E.00362
G1 X116.993 Y117.268 E.00361
G1 X117.18 Y117.155 E.00356
G1 X117.276 Y116.949 E.00368
G1 X117.279 Y116.881 E.00112
G1 X117.197 Y116.664 E.00376
G1 X117.112 Y116.6 E.00173
M204 S10000
G1 X117.417 Y116.32 F42000
G1 F1901
M204 S6000
G1 X117.231 Y116.194 E.00364
G1 X116.846 Y116.124 E.00636
G1 X116.568 Y116.197 E.00466
G1 X116.327 Y116.374 E.00485
G1 X116.161 Y116.657 E.00534
G1 X116.122 Y116.928 E.00444
G1 X116.235 Y117.306 E.00641
G1 X116.423 Y117.518 E.0046
G1 X116.7 Y117.655 E.00502
G1 X117.015 Y117.673 E.00513
G1 X117.302 Y117.57 E.00494
G1 X117.528 Y117.364 E.00497
G1 X117.661 Y117.078 E.00512
G1 X117.677 Y116.858 E.00358
G1 X117.596 Y116.554 E.00511
G1 X117.453 Y116.368 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.596 Y116.554 E-.08909
G1 X117.677 Y116.858 E-.11959
G1 X117.661 Y117.078 E-.08389
G1 X117.528 Y117.364 E-.1199
G1 X117.302 Y117.57 E-.11632
G1 X117.015 Y117.673 E-.11557
G1 X116.712 Y117.656 E-.11564
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
G3 Z2.3 I.94 J.773 P1  F42000
G1 X124.435 Y108.274 Z2.3
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
M204 S5000
G3 X125.553 Y109.626 I-.269 J1.36 E.03086
G1 X125.553 Y124.174 E.23622
G3 X124.174 Y125.553 I-1.387 J-.008 E.03512
G1 X109.626 Y125.553 E.23622
G3 X108.247 Y124.174 I.008 J-1.387 E.03512
G1 X108.247 Y109.626 E.23622
G3 X109.626 Y108.247 I1.387 J.008 E.03512
G1 X124.174 Y108.247 E.23622
G3 X124.375 Y108.263 I-.008 J1.387 E.00329
; WIPE_START
G1 F3600
M204 S6000
G1 X124.695 Y108.352 E-.1262
G1 X124.936 Y108.481 E-.10355
G1 X125.146 Y108.654 E-.10358
G1 X125.319 Y108.864 E-.10358
G1 X125.448 Y109.105 E-.10355
G1 X125.527 Y109.365 E-.10357
G1 X125.553 Y109.626 E-.09961
G1 X125.553 Y109.669 E-.01636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.067 Y108.182 Z2.4 F42000
G1 X116.96 Y107.962 Z2.4
G1 Z2
G1 E.8 F1800
G1 F1905
M204 S5000
G1 X124.578 Y107.966 E.1237
G3 X125.839 Y109.297 I-.151 J1.406 E.03239
G1 X125.841 Y124.451 E.24607
G3 X124.425 Y125.842 I-1.415 J-.024 E.03572
G1 X109.349 Y125.841 E.24481
G3 X107.958 Y124.428 I.037 J-1.428 E.0356
G1 X107.959 Y109.349 E.24484
G3 X109.349 Y107.959 I1.415 J.024 E.03531
G1 X116.9 Y107.962 E.12261
; WIPE_START
G1 F3600
M204 S6000
G1 X118.9 Y107.963 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.058 Y115.047 Z2.4 F42000
G1 X115.763 Y115.781 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
M204 S6000
G1 X115.788 Y115.751 E.00069
G3 X116.859 Y115.303 I1.108 J1.146 E.02074
G1 X116.992 Y115.305 E.00233
G3 X115.613 Y115.951 I-.096 J1.592 E.14722
G1 X115.724 Y115.826 E.0029
M204 S10000
G1 X115.441 Y115.501 F42000
G1 F1905
M204 S6000
G1 X115.485 Y115.448 E.0012
G3 X116.854 Y114.874 I1.412 J1.449 E.02654
G1 X117.012 Y114.877 E.00276
G3 X115.269 Y115.696 I-.116 J2.019 E.18686
G1 X115.401 Y115.546 E.0035
M204 S250
G1 X115.147 Y115.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
M204 S5000
G1 X115.192 Y115.155 E.0011
G3 X116.85 Y114.461 I1.704 J1.741 E.02988
G1 X117.031 Y114.464 E.00295
G3 X115.058 Y115.298 I-.135 J2.432 E.21251
G1 X115.105 Y115.249 E.00111
; WIPE_START
G1 F3600
M204 S6000
G1 X115.192 Y115.155 E-.04854
G1 X115.571 Y114.854 E-.18408
G1 X116 Y114.632 E-.18353
G1 X116.466 Y114.499 E-.18405
G1 X116.85 Y114.461 E-.14642
G1 X116.885 Y114.461 E-.01339
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
G1 X118.073 Y116.821 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1905
M204 S6000
G1 X118.01 Y116.494 E.00541
G1 X117.756 Y116.085 E.00782
G1 X117.395 Y115.828 E.00719
G1 X116.962 Y115.721 E.00725
G1 X116.508 Y115.785 E.00744
G1 X116.107 Y116.023 E.00759
G1 X115.825 Y116.408 E.00774
G1 X115.719 Y116.853 E.00743
G1 X115.793 Y117.315 E.00759
G1 X116.036 Y117.705 E.00747
G1 X116.393 Y117.967 E.00718
G1 X116.829 Y118.079 E.00731
G1 X117.291 Y118.015 E.00757
G1 X117.692 Y117.777 E.00758
G1 X117.974 Y117.393 E.00775
G1 X118.081 Y116.956 E.0073
G1 X118.076 Y116.881 E.00121
M204 S10000
G1 X117.086 Y116.572 F42000
G1 F1905
M204 S6000
G1 X116.801 Y116.534 E.00468
G1 X116.618 Y116.647 E.00348
G1 X116.524 Y116.851 E.00365
G1 X116.555 Y117.059 E.00341
G1 X116.774 Y117.257 E.00479
G1 X116.991 Y117.268 E.00354
G1 X117.183 Y117.152 E.00364
G1 X117.275 Y116.957 E.0035
G1 X117.277 Y116.867 E.00146
G1 X117.205 Y116.677 E.0033
G1 X117.131 Y116.612 E.0016
M204 S10000
G1 X116.933 Y116.87 F42000
; LINE_WIDTH: 0.35402
G1 F1905
M204 S6000
G1 X116.871 Y116.906 E.00098
G1 X116.917 Y116.933 E.00073
M204 S10000
G1 X117.242 Y117.598 F42000
; LINE_WIDTH: 0.41999
G1 F1905
M204 S6000
G1 X117.479 Y117.418 E.00484
G1 X117.636 Y117.154 E.00499
G1 X117.675 Y116.844 E.00506
G1 X117.6 Y116.561 E.00475
G1 X117.413 Y116.316 E.00501
G1 X117.246 Y116.201 E.00329
G1 X116.84 Y116.125 E.00671
G1 X116.566 Y116.198 E.00462
G1 X116.322 Y116.38 E.00493
G1 X116.164 Y116.646 E.00502
G1 X116.124 Y116.952 E.00502
G1 X116.207 Y117.254 E.00508
G1 X116.318 Y117.418 E.00321
M73 P78 R5
G1 X116.654 Y117.638 E.00653
G1 X116.936 Y117.676 E.00462
G1 X117.184 Y117.613 E.00415
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X116.936 Y117.676 E-.09714
G1 X116.654 Y117.638 E-.10806
G1 X116.318 Y117.418 E-.1529
G1 X116.207 Y117.254 E-.07502
G1 X116.124 Y116.952 E-.11898
G1 X116.164 Y116.646 E-.11748
G1 X116.286 Y116.441 E-.09043
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
G3 Z2.4 I.862 J.859 P1  F42000
G1 X124.447 Y108.252 Z2.4
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2042
M204 S5000
G3 X125.575 Y109.616 I-.271 J1.372 E.03113
G1 X125.575 Y124.184 E.23654
G3 X124.184 Y125.575 I-1.399 J-.008 E.03543
G1 X109.616 Y125.575 E.23654
G3 X108.225 Y124.184 I.008 J-1.399 E.03543
G1 X108.225 Y109.616 E.23654
G3 X109.616 Y108.225 I1.399 J.008 E.03543
G1 X124.184 Y108.225 E.23654
G3 X124.388 Y108.242 I-.008 J1.399 E.00333
; WIPE_START
G1 F3600
M204 S6000
G1 X124.71 Y108.331 E-.12711
G1 X124.952 Y108.461 E-.10447
G1 X125.165 Y108.635 E-.10447
G1 X125.339 Y108.848 E-.10451
G1 X125.469 Y109.09 E-.10445
G1 X125.549 Y109.353 E-.10448
G1 X125.575 Y109.616 E-.10051
G1 X125.575 Y109.643 E-.01
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.088 Y108.158 Z2.5 F42000
G1 X116.96 Y107.934 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X124.597 Y107.938 E.124
G3 X125.87 Y109.355 I-.166 J1.43 E.03381
G1 X125.87 Y124.469 E.24542
G3 X124.442 Y125.87 I-1.427 J-.026 E.03599
G1 X109.331 Y125.87 E.24538
G3 X107.93 Y124.443 I.038 J-1.439 E.0359
G1 X107.93 Y109.331 E.24539
G3 X109.331 Y107.93 I1.426 J.025 E.03556
G1 X116.9 Y107.934 E.12291
; WIPE_START
G1 F3600
M204 S6000
G1 X118.9 Y107.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.396 Y114.715 Z2.5 F42000
G1 X115.13 Y115.229 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X115.191 Y115.156 E.00154
G3 X116.85 Y114.461 I1.705 J1.742 E.02991
G1 X117.029 Y114.464 E.00291
G3 X114.937 Y115.447 I-.133 J2.434 E.2096
G1 X115.091 Y115.273 E.00377
; WIPE_START
G1 F3600
M204 S6000
G1 X115.191 Y115.156 E-.05876
G1 X115.489 Y114.909 E-.14718
G1 X115.654 Y114.802 E-.07455
G1 X116 Y114.632 E-.14674
G1 X116.371 Y114.518 E-.14708
G1 X116.85 Y114.461 E-.18339
G1 X116.856 Y114.461 E-.0023
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
G1 X118.97 Y116.434 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F2042
M204 S2000
G1 X117.366 Y114.83 E.03684
G1 X116.802 Y114.83
G1 X118.97 Y116.998 E.04978
G1 X119.007 Y117.598
G1 X116.201 Y114.792 E.06444
G1 X115.811 Y114.965
G1 X118.835 Y117.989 E.06944
G1 X118.604 Y118.322
G1 X115.477 Y115.195 E.0718
G1 X115.196 Y115.478
G1 X118.323 Y118.605 E.0718
G1 X117.988 Y118.834
G1 X114.966 Y115.812 E.06939
G1 X114.793 Y116.202
G1 X117.598 Y119.008 E.06443
G1 X116.998 Y118.97
G1 X114.83 Y116.803 E.04978
G1 X114.83 Y117.366
G1 X116.434 Y118.97 E.03684
; WIPE_START
G1 F3000
M204 S6000
G1 X115.02 Y117.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.989 Y116.145 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0694856
G1 F2042
M204 S6000
G1 X118.976 Y116.124 E.00005
; LINE_WIDTH: 0.086872
G1 X118.926 Y116.05 E.00024
; LINE_WIDTH: 0.121247
G1 X118.876 Y115.976 E.00036
; LINE_WIDTH: 0.152202
G1 X118.823 Y115.903 E.00048
; LINE_WIDTH: 0.191012
G2 X118.721 Y115.767 I-2.324 J1.644 E.00118
; LINE_WIDTH: 0.23661
G2 X118.556 Y115.572 I-3.354 J2.666 E.00224
; LINE_WIDTH: 0.260308
G2 X118.132 Y115.161 I-3.768 J3.459 E.00575
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
G1 X116.14 Y118.991 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.134735
G1 F2042
M204 S6000
G1 X115.943 Y118.853 E.00111
; LINE_WIDTH: 0.165112
G1 X115.87 Y118.799 E.00053
; LINE_WIDTH: 0.201177
G3 X115.737 Y118.697 I1.631 J-2.261 E.00122
; LINE_WIDTH: 0.255766
G3 X115.191 Y118.169 I3.014 J-3.66 E.00726
; LINE_WIDTH: 0.22976
G1 X115.079 Y118.033 E.00149
; LINE_WIDTH: 0.190025
G1 X114.974 Y117.895 E.00119
; LINE_WIDTH: 0.15124
G1 X114.891 Y117.777 E.00077
; LINE_WIDTH: 0.120045
G1 X114.808 Y117.658 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X114.891 Y117.777 E-.76
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
G3 Z2.5 I.86 J.861 P1  F42000
G1 X124.459 Y108.23 Z2.5
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1832
M204 S5000
G3 X125.597 Y109.607 I-.273 J1.384 E.0314
G1 X125.597 Y124.193 E.23686
G3 X124.193 Y125.597 I-1.411 J-.008 E.03574
G1 X109.607 Y125.597 E.23686
G3 X108.203 Y124.193 I.008 J-1.411 E.03574
G1 X108.203 Y109.607 E.23686
G3 X109.607 Y108.203 I1.411 J.008 E.03574
G1 X124.193 Y108.203 E.23686
G3 X124.4 Y108.22 I-.008 J1.411 E.00337
; WIPE_START
G1 F3600
M204 S6000
G1 X124.724 Y108.31 E-.12803
G1 X124.969 Y108.441 E-.10535
G1 X125.183 Y108.617 E-.1054
G1 X125.359 Y108.831 E-.1054
G1 X125.49 Y109.076 E-.10536
G1 X125.57 Y109.341 E-.10539
G1 X125.597 Y109.607 E-.10142
G1 X125.597 Y109.616 E-.00365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.11 Y108.133 Z2.6 F42000
G1 X116.961 Y107.906 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X124.616 Y107.91 E.1243
G3 X125.899 Y109.338 I-.168 J1.441 E.03407
G1 X125.898 Y124.488 E.24599
G3 X124.46 Y125.899 I-1.438 J-.027 E.03625
G1 X109.312 Y125.898 E.24596
G3 X107.902 Y124.46 I.04 J-1.45 E.03616
G1 X107.902 Y109.312 E.24597
G3 X109.312 Y107.902 I1.437 J.027 E.03579
G1 X116.901 Y107.906 E.12322
; WIPE_START
G1 F3600
M204 S6000
G1 X118.901 Y107.907 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.358 Y115.103 Z2.6 F42000
G1 X116.03 Y116.03 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.306 J.896 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53541
G1 X114.828 Y115.612 E-.17705
G1 X114.904 Y115.513 E-.04754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.712 Y114.6 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X116.091 Y114.598 E.02633
G3 X117.026 Y114.464 I.811 J2.319 E.01544
G3 X117.655 Y114.582 I-.212 J2.862 E.01041
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59445
G1 X116.514 Y114.495 E-.16555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X117.77 Y114.621 E.02288
G1 X117.801 Y114.632 E.00053
G3 X119.179 Y116.03 I-.938 J2.304 E.03277
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.621 E-.53585
G1 X117.801 Y114.632 E-.01241
G1 X118.232 Y114.856 E-.18447
G1 X118.288 Y114.901 E-.02728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.217 Y116.135 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G3 X119.2 Y117.711 I-2.312 J.763 E.02606
G1 X119.2 Y116.096 E.02622
; WIPE_START
G1 F3600
M204 S6000
G1 X119.309 Y116.513 E-.16367
G1 X119.338 Y116.999 E-.18519
G1 X119.292 Y117.384 E-.14724
G1 X119.2 Y117.711 E-.12905
G1 X119.2 Y117.356 E-.13485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
M73 P79 R5
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00133
G3 X117.77 Y119.179 I-2.268 J-.967 E.03198
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
G1 X116.086 Y119.2 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X117.711 Y119.201 E.02638
G3 X116.143 Y119.219 I-.81 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.59569
G1 X117.431 Y119.282 E-.11077
G1 X117.291 Y119.298 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.859 J-2.267 E.03331
G1 X115.97 Y117.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.823 Y119.089 E-.08564
G1 X115.586 Y118.956 E-.10326
G1 X115.509 Y118.902 E-.03572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1832
M204 S5000
G3 X114.6 Y116.089 I2.377 J.484 E.00552
G1 X114.6 Y117.711 E.02633
G3 X114.498 Y116.475 I2.287 J-.811 E.02036
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.1517
G1 X114.6 Y117.69 E-.6083
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
G1 X124.471 Y108.208 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X125.619 Y109.597 I-.276 J1.396 E.03167
G1 X125.619 Y124.203 E.23717
G3 X124.203 Y125.619 I-1.423 J-.008 E.03605
G1 X109.597 Y125.619 E.23717
G3 X108.181 Y124.203 I.008 J-1.423 E.03605
G1 X108.181 Y109.597 E.23717
G3 X109.597 Y108.181 I1.423 J.008 E.03605
G1 X124.203 Y108.181 E.23717
G3 X124.412 Y108.198 I-.008 J1.423 E.00341
; WIPE_START
G1 F3600
M204 S6000
G1 X124.739 Y108.289 E-.12892
G1 X124.985 Y108.421 E-.10628
G1 X125.202 Y108.598 E-.10629
G1 X125.379 Y108.815 E-.10632
G1 X125.511 Y109.061 E-.10627
G1 X125.592 Y109.329 E-.1063
G1 X125.618 Y109.59 E-.09962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.13 Y108.109 Z2.7 F42000
G1 X116.961 Y107.878 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X124.635 Y107.882 E.1246
G3 X125.927 Y109.321 I-.169 J1.452 E.03433
G1 X125.926 Y124.506 E.24657
G3 X124.476 Y125.927 I-1.45 J-.029 E.03651
G1 X109.294 Y125.926 E.24653
G3 X107.873 Y124.477 I.042 J-1.462 E.03642
G1 X107.874 Y109.294 E.24654
G3 X109.294 Y107.874 I1.449 J.029 E.03603
G1 X116.901 Y107.878 E.12352
; WIPE_START
G1 F3600
M204 S6000
G1 X118.901 Y107.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.365 Y115.078 Z2.7 F42000
G1 X116.03 Y116.03 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X114.623 Y116.03 E.02285
G3 X116.03 Y114.621 I2.276 J.866 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.623 Y116.03 E-.53532
G1 X114.732 Y115.781 E-.10328
G1 X114.882 Y115.529 E-.11159
G1 X114.898 Y115.509 E-.00981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.712 Y114.6 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X116.089 Y114.599 E.02635
G3 X117.024 Y114.464 I.88 J2.784 E.0154
G3 X117.655 Y114.582 I-.208 J2.854 E.01045
; WIPE_START
G1 F3600
M204 S6000
G1 X116.089 Y114.599 E-.59495
G1 X116.511 Y114.496 E-.16505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X117.77 Y114.621 E.02288
G1 X117.801 Y114.632 E.00053
G3 X119.179 Y116.03 I-.916 J2.281 E.03278
G1 X117.83 Y116.03 E.0219
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
G1 X119.246 Y116.23 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X119.2 Y117.71 I-2.337 J.668 E.02444
G1 X119.2 Y116.09 E.0263
G1 X119.227 Y116.173 E.00141
; WIPE_START
G1 F3600
M204 S6000
G1 X119.325 Y116.632 E-.17827
G1 X119.338 Y116.999 E-.13976
G1 X119.291 Y117.384 E-.14727
G1 X119.2 Y117.71 E-.12869
G1 X119.2 Y117.273 E-.16601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.179 I-2.244 J-1.074 E.03039
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.06826
G1 X118.899 Y118.288 E-.1559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59511
G1 X117.333 Y119.301 E-.14796
G1 X117.288 Y119.306 E-.01693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.892 J-2.3 E.03328
G1 X115.97 Y117.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53546
G1 X115.824 Y119.09 E-.08523
G1 X115.571 Y118.947 E-.11023
G1 X115.512 Y118.899 E-.02908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.512 Y116.417 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1884
M204 S5000
G3 X114.6 Y116.09 I2.434 J.484 E.0055
G1 X114.6 Y117.711 E.02631
G3 X114.501 Y116.476 I2.345 J-.81 E.02034
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.09 E-.15123
G1 X114.6 Y117.692 E-.60877
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
G1 X124.483 Y108.187 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G3 X125.64 Y109.587 I-.278 J1.408 E.03194
G1 X125.64 Y124.213 E.23749
G3 X124.213 Y125.641 I-1.436 J-.008 E.03636
G1 X109.587 Y125.641 E.23749
G3 X108.16 Y124.213 I.008 J-1.436 E.03636
G1 X108.16 Y109.587 E.23749
G3 X109.587 Y108.16 I1.436 J.008 E.03636
G1 X124.213 Y108.16 E.23749
G3 X124.424 Y108.176 I-.008 J1.436 E.00344
; WIPE_START
G1 F3600
M204 S6000
G1 X124.753 Y108.268 E-.12983
G1 X125.002 Y108.401 E-.10718
G1 X125.22 Y108.58 E-.10722
G1 X125.399 Y108.798 E-.10721
G1 X125.532 Y109.047 E-.10719
G1 X125.614 Y109.317 E-.1072
G1 X125.638 Y109.563 E-.09417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.15 Y108.084 Z2.8 F42000
G1 X116.962 Y107.849 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G1 X124.653 Y107.853 E.1249
G3 X125.955 Y109.305 I-.171 J1.463 E.03459
G1 X125.954 Y124.524 E.24714
G3 X124.493 Y125.955 I-1.461 J-.031 E.03678
G1 X109.276 Y125.954 E.24711
G3 X107.845 Y124.494 I.043 J-1.473 E.03669
G1 X107.846 Y109.276 E.24711
G3 X109.276 Y107.846 I1.461 J.03 E.03627
G1 X116.902 Y107.849 E.12383
; WIPE_START
G1 F3600
M204 S6000
G1 X118.901 Y107.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.373 Y115.052 Z2.8 F42000
G1 X116.03 Y116.03 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1888
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
G1 X117.714 Y114.6 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.021 Y114.463 I.879 J2.788 E.01533
G3 X117.656 Y114.582 I-.208 J2.881 E.01051
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59498
G1 X116.513 Y114.496 E-.16502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z2.8 F42000
G1 Z2.4
M73 P80 R5
G1 E.8 F1800
G1 F1888
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
G1 X119.246 Y116.231 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G3 X119.2 Y117.712 I-2.345 J.668 E.02445
G1 X119.2 Y116.09 E.02633
G1 X119.228 Y116.174 E.00143
; WIPE_START
G1 F3600
M204 S6000
G1 X119.325 Y116.634 E-.17873
G1 X119.338 Y116.999 E-.13883
G1 X119.291 Y117.384 E-.14725
G1 X119.2 Y117.712 E-.12942
G1 X119.2 Y117.276 E-.16577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.935 E.00291
G3 X117.77 Y119.178 I-2.204 J-1.033 E.03041
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
G1 X116.468 Y119.297 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G3 X116.086 Y119.2 I.433 J-2.493 E.00639
G1 X117.708 Y119.202 E.02632
G3 X116.527 Y119.307 I-.807 J-2.398 E.01943
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17215
G1 X117.633 Y119.202 E-.58785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.867 J-2.277 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
M73 P80 R4
G1 X115.825 Y119.09 E-.08486
G1 X115.571 Y118.947 E-.11056
G1 X115.511 Y118.899 E-.0292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.53 Y116.325 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1888
M204 S5000
G3 X114.6 Y116.088 I2.39 J.575 E.00402
G1 X114.6 Y117.712 E.02636
G3 X114.517 Y116.384 I2.32 J-.812 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.11674
G1 X114.6 Y117.712 E-.61693
G1 X114.581 Y117.645 E-.02633
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
G1 X124.495 Y108.165 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G3 X125.662 Y109.577 I-.28 J1.42 E.03222
G1 X125.662 Y124.223 E.23781
G3 X124.223 Y125.662 I-1.448 J-.008 E.03667
G1 X109.577 Y125.662 E.23781
G3 X108.138 Y124.223 I.008 J-1.448 E.03667
G1 X108.138 Y109.577 E.23781
G3 X109.577 Y108.138 I1.448 J.008 E.03667
G1 X124.223 Y108.138 E.23781
G3 X124.436 Y108.155 I-.008 J1.448 E.00348
; WIPE_START
G1 F3600
M204 S6000
G1 X124.768 Y108.247 E-.13074
G1 X125.018 Y108.381 E-.10809
G1 X125.238 Y108.562 E-.10814
G1 X125.419 Y108.782 E-.1081
G1 X125.553 Y109.032 E-.1081
G1 X125.636 Y109.305 E-.10812
G1 X125.658 Y109.537 E-.08872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.17 Y108.06 Z2.9 F42000
G1 X116.962 Y107.821 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X124.672 Y107.825 E.1252
G3 X125.983 Y109.287 I-.173 J1.474 E.03485
G1 X125.983 Y124.543 E.24772
G3 X124.51 Y125.983 I-1.472 J-.032 E.03704
G1 X109.257 Y125.983 E.24768
G3 X107.817 Y124.511 I.033 J-1.473 E.03703
G1 X107.817 Y109.257 E.24769
G3 X109.257 Y107.817 I1.472 J.032 E.03651
G1 X116.902 Y107.821 E.12414
; WIPE_START
G1 F3600
M204 S6000
G1 X118.902 Y107.822 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.381 Y115.026 Z2.9 F42000
G1 X116.03 Y116.03 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.307 J.897 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53544
G1 X114.732 Y115.781 E-.10343
G1 X114.882 Y115.529 E-.11153
G1 X114.898 Y115.509 E-.0096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.019 Y114.463 I.879 J2.791 E.01529
G3 X117.656 Y114.583 I-.32 J3.464 E.01055
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59482
G1 X116.513 Y114.496 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.015 J2.25 E.03118
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
G1 X119.238 Y116.204 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G3 X119.2 Y117.711 I-2.378 J.694 E.02488
G1 X119.2 Y116.09 E.02633
G1 X119.219 Y116.147 E.00098
; WIPE_START
G1 F3600
M204 S6000
G1 X119.325 Y116.636 E-.19035
G1 X119.338 Y116.999 E-.13786
G1 X119.291 Y117.384 E-.14728
G1 X119.2 Y117.711 E-.12916
G1 X119.2 Y117.302 E-.15536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.179 I-2.28 J-.979 E.03197
G1 X117.77 Y117.83 E.02191
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
G1 X116.278 Y119.258 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G3 X116.086 Y119.2 I.622 J-2.393 E.00326
G1 X117.709 Y119.202 E.02635
G3 X116.337 Y119.273 I-.809 J-2.336 E.02261
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.09911
G1 X117.709 Y119.202 E-.61671
G1 X117.597 Y119.234 E-.04419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.891 J-2.3 E.03329
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53548
G1 X115.823 Y119.089 E-.08572
G1 X115.57 Y118.946 E-.1103
G1 X115.512 Y118.899 E-.0285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1892
M204 S5000
G3 X114.6 Y116.089 I2.385 J.485 E.00552
G1 X114.6 Y117.713 E.02637
G3 X114.498 Y116.475 I2.294 J-.812 E.0204
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.1518
G1 X114.6 Y117.689 E-.6082
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
G1 X124.507 Y108.143 F42000
G1 Z2.6
G1 E.8 F1800
M73 P81 R4
G1 F1895
M204 S5000
G3 X125.684 Y109.568 I-.283 J1.432 E.03249
G1 X125.684 Y124.232 E.23812
G3 X124.232 Y125.684 I-1.46 J-.008 E.03698
G1 X109.568 Y125.684 E.23812
G3 X108.116 Y124.232 I.008 J-1.46 E.03698
G1 X108.116 Y109.568 E.23812
G3 X109.568 Y108.116 I1.46 J.008 E.03698
G1 X124.232 Y108.116 E.23812
G3 X124.448 Y108.133 I-.008 J1.46 E.00352
; WIPE_START
G1 F3600
M204 S6000
G1 X124.782 Y108.226 E-.13165
G1 X125.035 Y108.361 E-.10899
G1 X125.257 Y108.543 E-.10903
G1 X125.439 Y108.765 E-.10902
G1 X125.574 Y109.018 E-.10903
G1 X125.657 Y109.293 E-.10902
G1 X125.679 Y109.511 E-.08327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.19 Y108.035 Z3 F42000
G1 X116.962 Y107.793 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X124.691 Y107.797 E.1255
G3 X126.012 Y109.271 I-.175 J1.485 E.03511
G1 X126.011 Y124.562 E.24829
G3 X124.527 Y126.012 I-1.484 J-.034 E.0373
G1 X109.238 Y126.011 E.24826
G3 X107.788 Y124.528 I.047 J-1.496 E.03721
G1 X107.789 Y109.238 E.24827
G3 X109.238 Y107.789 I1.483 J.034 E.03675
G1 X116.902 Y107.793 E.12444
; WIPE_START
G1 F3600
M204 S6000
G1 X118.902 Y107.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.389 Y115.001 Z3 F42000
G1 X116.03 Y116.03 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.3 J.892 E.03328
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53545
G1 X114.828 Y115.612 E-.17715
G1 X114.904 Y115.513 E-.0474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X116.09 Y114.598 E.02636
G3 X117.016 Y114.463 I.856 J2.624 E.01526
G3 X117.656 Y114.583 I-.276 J3.257 E.01059
; WIPE_START
G1 F3600
M204 S6000
G1 X116.09 Y114.598 E-.59498
G1 X116.512 Y114.496 E-.16502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.015 J2.251 E.03119
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
G1 X119.217 Y116.135 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G3 X119.2 Y117.711 I-2.314 J.763 E.02607
G1 X119.2 Y116.096 E.02623
; WIPE_START
G1 F3600
M204 S6000
G1 X119.309 Y116.513 E-.16367
G1 X119.338 Y116.999 E-.18514
G1 X119.292 Y117.384 E-.14724
G1 X119.2 Y117.711 E-.12925
G1 X119.2 Y117.357 E-.1347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
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
G1 X116.468 Y119.298 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G3 X116.086 Y119.2 I.432 J-2.474 E.00641
G1 X117.708 Y119.202 E.02633
G3 X116.527 Y119.308 I-.807 J-2.379 E.01942
; WIPE_START
G1 F3600
M204 S6000
G1 X116.086 Y119.2 E-.17252
G1 X117.632 Y119.202 E-.58748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.866 J-2.276 E.03332
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53548
G1 X115.824 Y119.09 E-.0853
G1 X115.545 Y118.929 E-.1221
G1 X115.51 Y118.901 E-.01711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.51 Y116.417 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1895
M204 S5000
G3 X114.6 Y116.089 I2.401 J.483 E.00553
G1 X114.6 Y117.71 E.02632
G3 X114.499 Y116.475 I2.311 J-.811 E.02033
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15189
G1 X114.6 Y117.689 E-.60811
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
G1 X124.519 Y108.122 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G3 X125.706 Y109.558 I-.285 J1.444 E.03276
G1 X125.706 Y124.242 E.23844
G3 X124.242 Y125.706 I-1.472 J-.008 E.03729
G1 X109.558 Y125.706 E.23844
G3 X108.094 Y124.242 I.008 J-1.472 E.03729
G1 X108.094 Y109.558 E.23844
G3 X109.558 Y108.094 I1.472 J.008 E.03729
G1 X124.242 Y108.094 E.23844
G3 X124.46 Y108.111 I-.008 J1.472 E.00356
; WIPE_START
G1 F3600
M204 S6000
G1 X124.796 Y108.205 E-.13255
G1 X125.052 Y108.341 E-.10991
G1 X125.275 Y108.525 E-.10994
G1 X125.459 Y108.749 E-.10994
G1 X125.595 Y109.004 E-.10991
G1 X125.679 Y109.28 E-.10993
G1 X125.699 Y109.484 E-.07782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.21 Y108.01 Z3.1 F42000
G1 X116.963 Y107.765 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X124.71 Y107.769 E.1258
G3 X126.04 Y109.254 I-.177 J1.497 E.03537
G1 X126.039 Y124.58 E.24886
G3 X124.544 Y126.04 I-1.495 J-.035 E.03757
G1 X109.22 Y126.039 E.24883
G3 X107.76 Y124.545 I.048 J-1.508 E.03748
G1 X107.761 Y109.22 E.24884
G3 X109.22 Y107.761 I1.494 J.035 E.037
G1 X116.903 Y107.765 E.12475
; WIPE_START
G1 F3600
M204 S6000
G1 X118.903 Y107.766 E-.76
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
G1 X125.295 Y108.24 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0761021
G1 F2077
M204 S6000
G3 X125.382 Y108.311 I-.725 J.976 E.00025
M204 S10000
G1 X125.472 Y108.398 F42000
; LINE_WIDTH: 0.0759673
G1 F2077
M204 S6000
G3 X125.553 Y108.495 I-1.059 J.961 E.00028
; WIPE_START
G1 F15000
G1 X125.472 Y108.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.518 Y116.03 Z3.1 F42000
G1 X125.574 Y125.279 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0758056
G1 F2077
M204 S6000
G3 X125.465 Y125.41 I-1.731 J-1.324 E.00038
M204 S10000
G1 X125.41 Y125.465 F42000
; LINE_WIDTH: 0.0758073
G1 F2077
M204 S6000
G3 X125.279 Y125.574 I-1.452 J-1.618 E.00038
; WIPE_START
G1 F15000
G1 X125.41 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.778 Y125.509 Z3.1 F42000
G1 X108.509 Y125.563 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0759419
G1 F2077
M204 S6000
G3 X108.413 Y125.485 I.746 J-1.02 E.00027
M204 S10000
G1 X108.326 Y125.399 F42000
; LINE_WIDTH: 0.075935
G1 F2077
M204 S6000
G3 X108.247 Y125.305 I.908 J-.836 E.00027
; WIPE_START
G1 F15000
G1 X108.326 Y125.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.281 Y117.767 Z3.1 F42000
G1 X108.226 Y108.521 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0758056
G1 F2077
M204 S6000
G3 X108.335 Y108.39 I1.731 J1.324 E.00038
M204 S10000
G1 X108.39 Y108.335 F42000
; LINE_WIDTH: 0.0758073
G1 F2077
M204 S6000
G3 X108.521 Y108.226 I1.452 J1.618 E.00038
; WIPE_START
G1 F15000
G1 X108.39 Y108.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.768 Y113.751 Z3.1 F42000
G1 X116.03 Y116.03 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2077
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.278 J.869 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.828 Y115.612 E-.17733
M73 P82 R4
G1 X114.899 Y115.511 E-.04683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.013 Y114.463 I.88 J2.794 E.0152
G3 X117.656 Y114.583 I-.31 J3.446 E.01063
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59478
G1 X116.513 Y114.495 E-.16522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.006 J2.243 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X119.246 Y116.231 E.0024
G3 X119.2 Y117.71 I-2.337 J.667 E.02442
G1 X119.2 Y116.15 E.02532
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.231 E-.03527
G1 X119.322 Y116.608 E-.1461
G1 X119.338 Y116.999 E-.14888
G1 X119.291 Y117.384 E-.14729
G1 X119.2 Y117.71 E-.12862
G1 X119.2 Y117.305 E-.15383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X119.177 Y117.77 E.02285
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.179 I-2.271 J-.971 E.03197
G1 X117.77 Y117.83 E.02191
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
G1 X116.086 Y119.2 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59513
G1 X117.333 Y119.301 E-.14796
G1 X117.288 Y119.306 E-.01691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.623 Y117.77 I.922 J-2.329 E.03324
G1 X115.97 Y117.77 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.5355
G1 X115.824 Y119.09 E-.08524
G1 X115.543 Y118.927 E-.12314
G1 X115.51 Y118.901 E-.01612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.326 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F2077
M204 S5000
G3 X114.6 Y116.088 I2.425 J.574 E.00401
G1 X114.6 Y117.71 E.02633
G3 X114.518 Y116.384 I2.356 J-.811 E.02183
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.11656
G1 X114.6 Y117.71 E-.61608
G1 X114.581 Y117.64 E-.02736
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 28/53
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.1 I.842 J.878 P1  F42000
G1 X124.532 Y108.1 Z3.1
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G3 X125.728 Y109.548 I-.288 J1.456 E.03303
G1 X125.728 Y124.252 E.23876
G3 X124.252 Y125.728 I-1.484 J-.008 E.03761
G1 X109.548 Y125.728 E.23876
G3 X108.072 Y124.252 I.008 J-1.484 E.03761
G1 X108.072 Y109.548 E.23876
G3 X109.548 Y108.072 I1.484 J.008 E.03761
G1 X124.252 Y108.072 E.23876
G3 X124.473 Y108.089 I-.008 J1.484 E.0036
; WIPE_START
G1 F3600
M204 S6000
G1 X124.811 Y108.184 E-.13347
G1 X125.068 Y108.321 E-.11082
G1 X125.294 Y108.506 E-.11084
G1 X125.479 Y108.732 E-.11084
G1 X125.616 Y108.989 E-.11083
G1 X125.701 Y109.268 E-.11085
G1 X125.719 Y109.458 E-.07235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.23 Y107.986 Z3.2 F42000
G1 X116.963 Y107.737 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X124.728 Y107.741 E.12609
G3 X126.068 Y109.237 I-.178 J1.508 E.03563
G1 X126.068 Y124.598 E.24944
G3 X124.561 Y126.068 I-1.513 J-.043 E.03779
G1 X109.202 Y126.068 E.24941
G3 X107.732 Y124.562 I.037 J-1.507 E.03783
G1 X107.732 Y109.202 E.24941
G3 X109.202 Y107.732 I1.513 J.043 E.03719
G1 X116.903 Y107.737 E.12505
; WIPE_START
G1 F3600
M204 S6000
G1 X118.903 Y107.738 E-.76
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
G1 X125.22 Y108.146 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0822966
G1 F2055
M204 S6000
G3 X125.654 Y108.579 I-.761 J1.195 E.00153
; WIPE_START
G1 F15000
G1 X125.459 Y108.337 E-.38324
G1 X125.22 Y108.146 E-.37676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.415 Y115.776 Z3.2 F42000
G1 X125.655 Y125.22 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0822202
G1 F2055
M204 S6000
G3 X125.221 Y125.654 I-1.221 J-.787 E.00153
; WIPE_START
G1 F15000
G1 X125.459 Y125.463 E-.37528
G1 X125.655 Y125.22 E-.38472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.025 Y125.415 Z3.2 F42000
G1 X108.584 Y125.657 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.081994
G1 F2055
M204 S6000
G3 X108.146 Y125.221 I.78 J-1.22 E.00154
; WIPE_START
G1 F15000
G1 X108.341 Y125.463 E-.38026
G1 X108.584 Y125.657 E-.37974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.388 Y118.027 Z3.2 F42000
G1 X108.145 Y108.58 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0824151
G1 F2055
M204 S6000
G3 X108.579 Y108.146 I1.261 J.827 E.00154
; WIPE_START
G1 F15000
G1 X108.341 Y108.337 E-.37528
G1 X108.145 Y108.58 E-.38472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.693 Y113.822 Z3.2 F42000
G1 X116.03 Y116.03 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2055
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.621 I2.275 J.865 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53548
G1 X114.827 Y115.613 E-.1768
G1 X114.898 Y115.509 E-.04773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.011 Y114.463 I.81 J2.315 E.01519
G3 X117.656 Y114.583 I-.305 J3.436 E.01067
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59477
G1 X116.513 Y114.495 E-.16523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00208
G3 X119.179 Y116.03 I-.99 J2.23 E.03124
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
G1 X119.2 Y116.087 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X119.217 Y116.135 E.00083
G3 X119.2 Y117.712 I-2.315 J.763 E.02607
G1 X119.2 Y116.147 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.135 E-.00784
G1 X119.309 Y116.512 E-.14751
G1 X119.338 Y116.999 E-.1853
G1 X119.292 Y117.384 E-.14722
G1 X119.2 Y117.712 E-.1294
G1 X119.2 Y117.336 E-.14273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.251 J-.949 E.032
G1 X117.77 Y117.83 E.02191
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
G1 X116.086 Y119.2 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59511
G1 X117.429 Y119.282 E-.11056
G1 X117.287 Y119.299 E-.05433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.923 J-2.331 E.03325
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53551
G1 X115.824 Y119.09 E-.0853
G1 X115.541 Y118.926 E-.12408
M73 P83 R4
G1 X115.51 Y118.901 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F2055
M204 S5000
G3 X114.6 Y116.088 I2.383 J.484 E.00553
G1 X114.6 Y117.712 E.02636
G3 X114.498 Y116.475 I2.292 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15205
G1 X114.6 Y117.688 E-.60795
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
G3 Z3.2 I.846 J.875 P1  F42000
G1 X124.544 Y108.078 Z3.2
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G3 X125.75 Y109.538 I-.29 J1.468 E.03331
G1 X125.75 Y124.262 E.23907
G3 X124.262 Y125.75 I-1.496 J-.008 E.03792
G1 X109.538 Y125.75 E.23907
G3 X108.05 Y124.262 I.008 J-1.496 E.03792
G1 X108.05 Y109.538 E.23907
G3 X109.538 Y108.05 I1.496 J.008 E.03792
G1 X124.262 Y108.05 E.23907
G3 X124.485 Y108.068 I-.008 J1.496 E.00364
; WIPE_START
G1 F3600
M204 S6000
G1 X124.825 Y108.163 E-.13438
G1 X125.085 Y108.302 E-.11174
G1 X125.312 Y108.488 E-.11175
G1 X125.498 Y108.715 E-.11174
G1 X125.637 Y108.975 E-.11174
G1 X125.722 Y109.256 E-.11175
G1 X125.74 Y109.431 E-.06692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.25 Y107.961 Z3.3 F42000
G1 X116.963 Y107.708 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X124.747 Y107.713 E.12639
G3 X126.097 Y109.22 I-.167 J1.508 E.03596
G1 X126.096 Y124.617 E.25002
G3 X124.578 Y126.097 I-1.517 J-.038 E.0381
G1 X109.183 Y126.096 E.24998
G3 X107.703 Y124.578 I.051 J-1.53 E.03801
G1 X107.704 Y109.183 E.24999
G3 X109.183 Y107.704 I1.517 J.038 E.03747
G1 X116.903 Y107.708 E.12536
; WIPE_START
G1 F3600
M204 S6000
G1 X118.903 Y107.709 E-.76
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
G1 X125.138 Y108.066 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0876948
G1 F2070
M204 S6000
G3 X125.692 Y108.583 I-.715 J1.322 E.00207
G1 X125.718 Y108.631 E.00015
; WIPE_START
G1 F15000
G1 X125.692 Y108.583 E-.05057
G1 X125.471 Y108.307 E-.32769
G1 X125.29 Y108.159 E-.21639
G1 X125.138 Y108.066 E-.16534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.412 Y115.693 Z3.3 F42000
G1 X125.751 Y125.106 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0873507
G1 F2070
M204 S6000
G3 X125.17 Y125.718 I-1.265 J-.621 E.0023
; WIPE_START
G1 F15000
G1 X125.485 Y125.48 E-.3508
G1 X125.668 Y125.254 E-.25892
G1 X125.751 Y125.106 E-.15027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.124 Y125.387 Z3.3 F42000
G1 X108.663 Y125.735 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0876207
G1 F2070
M204 S6000
G1 X108.582 Y125.693 E.00024
G3 X108.081 Y125.168 I.803 J-1.269 E.00198
; WIPE_START
G1 F15000
G1 X108.316 Y125.48 E-.36085
G1 X108.582 Y125.693 E-.31552
G1 X108.663 Y125.735 E-.08362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.388 Y118.107 Z3.3 F42000
G1 X108.049 Y108.694 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0872075
G1 F2070
M204 S6000
G3 X108.583 Y108.108 I1.379 J.72 E.00215
G1 X108.63 Y108.082 E.00014
; WIPE_START
G1 F15000
G1 X108.583 Y108.108 E-.04803
G1 X108.315 Y108.32 E-.30313
G1 X108.132 Y108.546 E-.25869
G1 X108.049 Y108.694 E-.15014
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.668 Y113.859 Z3.3 F42000
G1 X116.03 Y116.03 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2070
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.288 J.881 E.03329
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53549
G1 X114.829 Y115.611 E-.17757
G1 X114.9 Y115.51 E-.04694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X116.093 Y114.597 E.02632
G3 X117.008 Y114.463 I.808 J2.315 E.01512
G3 X117.656 Y114.583 I-.299 J3.423 E.01071
; WIPE_START
G1 F3600
M204 S6000
G1 X116.093 Y114.597 E-.59405
G1 X116.517 Y114.494 E-.16596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
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
G1 X119.2 Y116.087 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X119.217 Y116.135 E.00083
G3 X119.2 Y117.711 I-2.39 J.762 E.02603
G1 X119.2 Y116.147 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.135 E-.00783
G1 X119.309 Y116.513 E-.14757
G1 X119.338 Y116.999 E-.18519
G1 X119.292 Y117.384 E-.14724
G1 X119.2 Y117.711 E-.12927
G1 X119.2 Y117.335 E-.14291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.0029
G3 X117.77 Y119.178 I-2.217 J-1.045 E.03041
G1 X117.77 Y117.83 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.11 Y117.934 E-.06779
G1 X118.899 Y118.288 E-.15638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X117.707 Y119.203 E.02632
G3 X116.143 Y119.219 I-.807 J-2.337 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X117.707 Y119.203 E-.59436
G1 X117.284 Y119.305 E-.16564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.868 J-2.275 E.03331
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53553
G1 X115.823 Y119.089 E-.08578
G1 X115.57 Y118.946 E-.11025
G1 X115.51 Y118.901 E-.02844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.416 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F2070
M204 S5000
G3 X114.6 Y116.088 I2.383 J.484 E.00553
G1 X114.6 Y117.712 E.02636
G3 X114.498 Y116.475 I2.293 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 3
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
; layer num/total_layer_count: 30/53
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I.846 J.875 P1  F42000
G1 X124.557 Y108.056 Z3.3
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X124.84 Y108.142 E.0048
G3 X125.772 Y109.529 I-.576 J1.394 E.02876
G1 X125.772 Y124.271 E.23939
G3 X124.271 Y125.772 I-1.509 J-.008 E.03823
G1 X109.529 Y125.772 E.23939
G3 X108.028 Y124.271 I.008 J-1.509 E.03823
G1 X108.028 Y109.529 E.23939
G3 X109.529 Y108.028 I1.509 J.008 E.03823
G1 X124.271 Y108.028 E.23939
G3 X124.498 Y108.046 I-.008 J1.509 E.00369
; WIPE_START
G1 F3600
M204 S6000
G1 X124.84 Y108.142 E-.1349
G1 X125.101 Y108.282 E-.11262
G1 X125.33 Y108.47 E-.11267
G1 X125.518 Y108.699 E-.11267
G1 X125.658 Y108.96 E-.11263
G1 X125.744 Y109.244 E-.11266
G1 X125.76 Y109.406 E-.06186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.27 Y107.937 Z3.4 F42000
G1 X116.964 Y107.68 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X124.766 Y107.684 E.12669
G3 X126.125 Y109.203 I-.169 J1.519 E.03622
G1 X126.124 Y124.636 E.2506
G3 X124.595 Y126.125 I-1.528 J-.04 E.03837
G1 X109.164 Y126.124 E.25056
G3 X107.675 Y124.595 I.041 J-1.529 E.03835
G1 X107.676 Y109.164 E.25057
G3 X109.164 Y107.676 I1.528 J.039 E.03771
G1 X116.904 Y107.68 E.12567
; WIPE_START
G1 F3600
M204 S6000
G1 X118.904 Y107.681 E-.76
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
G1 X125.037 Y107.985 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0925379
G1 F2024
M204 S6000
G3 X125.816 Y108.763 I-.546 J1.326 E.00327
M204 S10000
G1 X125.815 Y125.037 F42000
; LINE_WIDTH: 0.0925858
G1 F2024
M204 S6000
G3 X125.034 Y125.817 I-1.339 J-.56 E.00328
M204 S10000
G1 X108.763 Y125.816 F42000
; LINE_WIDTH: 0.0924829
G1 F2024
M204 S6000
G3 X107.983 Y125.034 I.556 J-1.335 E.00328
M204 S10000
G1 X107.985 Y108.763 F42000
; LINE_WIDTH: 0.0925855
G1 F2024
M204 S6000
G3 X108.766 Y107.983 I1.339 J.56 E.00328
; WIPE_START
G1 F15000
G1 X108.538 Y108.101 E-.17194
G1 X108.299 Y108.293 E-.20654
G1 X108.084 Y108.563 E-.23156
G1 X107.985 Y108.763 E-.14996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.649 Y113.879 Z3.4 F42000
G1 X116.03 Y116.03 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
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
G1 X117.714 Y114.6 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.006 Y114.463 I.882 J2.803 E.01508
G3 X117.656 Y114.583 I-.295 J3.417 E.01075
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.5948
G1 X116.513 Y114.495 E-.1652
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.017 J2.253 E.03118
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
G1 X119.2 Y116.089 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X119.234 Y116.192 E.00175
G3 X119.2 Y117.711 I-2.327 J.708 E.0251
G1 X119.2 Y116.149 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X119.234 Y116.192 E-.02075
G1 X119.327 Y116.649 E-.17734
G1 X119.338 Y116.999 E-.13301
M73 P84 R4
G1 X119.292 Y117.384 E-.14723
G1 X119.2 Y117.711 E-.12926
G1 X119.2 Y117.31 E-.15242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.205 J-1.031 E.03044
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
G1 X116.086 Y119.2 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X117.708 Y119.202 E.02634
G3 X116.143 Y119.219 I-.808 J-2.38 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.202 E-.59477
G1 X117.333 Y119.301 E-.14743
G1 X117.286 Y119.306 E-.0178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.903 J-2.313 E.0333
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53596
G1 X115.735 Y119.044 E-.12331
G1 X115.51 Y118.904 E-.10074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.325 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2024
M204 S5000
G3 X114.6 Y116.089 I2.403 J.575 E.004
G1 X114.6 Y117.711 E.02634
G3 X114.518 Y116.384 I2.334 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11641
G1 X114.6 Y117.711 E-.61639
G1 X114.582 Y117.641 E-.02719
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
G3 Z3.4 I.844 J.877 P1  F42000
G1 X124.569 Y108.035 Z3.4
M73 P84 R3
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X124.854 Y108.121 E.00483
G3 X125.794 Y109.519 I-.581 J1.406 E.02899
G1 X125.794 Y124.281 E.23971
G3 X124.281 Y125.794 I-1.521 J-.008 E.03854
G1 X109.519 Y125.794 E.23971
G3 X108.006 Y124.281 I.008 J-1.521 E.03854
G1 X108.006 Y109.519 E.23971
G3 X109.519 Y108.006 I1.521 J.008 E.03854
G1 X124.281 Y108.006 E.23971
G3 X124.51 Y108.024 I-.008 J1.521 E.00374
; WIPE_START
G1 F3600
M204 S6000
G1 X124.854 Y108.121 E-.13568
G1 X125.118 Y108.262 E-.11354
G1 X125.349 Y108.451 E-.11359
G1 X125.538 Y108.682 E-.11354
G1 X125.679 Y108.946 E-.11357
G1 X125.766 Y109.232 E-.11355
G1 X125.78 Y109.38 E-.05653
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.291 Y107.912 Z3.5 F42000
G1 X116.964 Y107.652 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X124.785 Y107.656 E.12699
G3 X126.153 Y109.186 I-.171 J1.53 E.03648
G1 X126.152 Y124.654 E.25117
G3 X124.612 Y126.153 I-1.54 J-.041 E.03863
G1 X109.146 Y126.152 E.25114
G3 X107.647 Y124.612 I.055 J-1.553 E.03854
G1 X107.648 Y109.146 E.25114
G3 X109.146 Y107.648 I1.539 J.041 E.03795
G1 X116.904 Y107.652 E.12598
; WIPE_START
G1 F3600
M204 S6000
G1 X118.904 Y107.653 E-.76
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
G1 X124.999 Y107.936 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0992745
G1 F2034
M204 S6000
G3 X125.863 Y108.8 I-.512 J1.376 E.004
M204 S10000
G1 X125.864 Y124.999 F42000
; LINE_WIDTH: 0.0993078
G1 F2034
M204 S6000
G3 X124.998 Y125.865 I-1.394 J-.528 E.004
M204 S10000
G1 X108.801 Y125.864 F42000
; LINE_WIDTH: 0.0992495
G1 F2034
M204 S6000
G3 X107.935 Y124.998 I.526 J-1.391 E.004
M204 S10000
G1 X107.936 Y108.801 F42000
; LINE_WIDTH: 0.0993067
G1 F2034
M204 S6000
G3 X108.802 Y107.935 I1.394 J.528 E.004
; WIPE_START
G1 F15000
G1 X108.544 Y108.061 E-.17293
G1 X108.277 Y108.271 E-.20481
G1 X108.061 Y108.544 E-.20989
G1 X107.936 Y108.801 E-.17237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.628 Y113.885 Z3.5 F42000
G1 X116.03 Y116.03 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2034
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.278 J.869 E.03333
G1 X116.03 Y115.97 E.02191
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
G1 X117.714 Y114.6 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.003 Y114.463 I.882 J2.806 E.01504
G3 X117.656 Y114.583 I-.29 J3.41 E.0108
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59479
G1 X116.513 Y114.495 E-.16521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.008 J2.245 E.0312
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
G1 X119.2 Y116.089 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X119.234 Y116.189 E.00171
G3 X119.2 Y117.713 I-2.333 J.711 E.02517
G1 X119.2 Y116.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.234 Y116.189 E-.01988
G1 X119.309 Y116.514 E-.12687
G1 X119.338 Y116.999 E-.18446
G1 X119.292 Y117.384 E-.14716
G1 X119.2 Y117.713 E-.12996
G1 X119.2 Y117.314 E-.15167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00291
G3 X117.77 Y119.179 I-2.211 J-1.038 E.03042
G1 X117.77 Y117.83 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53583
G1 X119.109 Y117.936 E-.06821
G1 X118.899 Y118.288 E-.15596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.379 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59509
G1 X117.333 Y119.301 E-.14797
G1 X117.288 Y119.306 E-.01694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.888 J-2.298 E.0333
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53554
G1 X115.823 Y119.089 E-.08578
G1 X115.57 Y118.946 E-.11023
G1 X115.512 Y118.899 E-.02845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.326 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F2034
M204 S5000
G3 X114.6 Y116.087 I2.433 J.573 E.00404
G1 X114.6 Y117.711 E.02637
G3 X114.518 Y116.385 I2.364 J-.812 E.02184
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.087 E-.11729
G1 X114.6 Y117.711 E-.61708
G1 X114.583 Y117.646 E-.02563
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
G3 Z3.5 I.844 J.876 P1  F42000
G1 X124.582 Y108.013 Z3.5
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X124.868 Y108.1 E.00487
G3 X125.816 Y109.509 I-.585 J1.417 E.02922
G1 X125.816 Y124.291 E.24003
G3 X124.291 Y125.816 I-1.533 J-.008 E.03885
G1 X109.509 Y125.816 E.24003
G3 X107.984 Y124.291 I.008 J-1.533 E.03885
G1 X107.984 Y109.509 E.24003
G3 X109.509 Y107.984 I1.533 J.008 E.03885
G1 X124.291 Y107.984 E.24003
G3 X124.523 Y108.003 I-.008 J1.533 E.00378
; WIPE_START
G1 F3600
M204 S6000
G1 X124.868 Y108.1 E-.13648
G1 X125.134 Y108.242 E-.11443
G1 X125.367 Y108.433 E-.1145
G1 X125.558 Y108.666 E-.11446
G1 X125.7 Y108.931 E-.11445
G1 X125.788 Y109.22 E-.11449
G1 X125.801 Y109.354 E-.05119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.311 Y107.887 Z3.6 F42000
G1 X116.965 Y107.624 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X124.804 Y107.628 E.12729
G3 X126.182 Y109.169 I-.173 J1.541 E.03674
G1 X126.181 Y124.672 E.25174
G3 X124.629 Y126.182 I-1.551 J-.042 E.0389
G1 X109.128 Y126.181 E.25171
G3 X107.618 Y124.629 I.056 J-1.565 E.0388
G1 X107.619 Y109.128 E.25172
G3 X109.128 Y107.619 I1.55 J.042 E.03819
G1 X116.905 Y107.624 E.12628
; WIPE_START
G1 F3600
M204 S6000
G1 X118.905 Y107.625 E-.76
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
G1 X124.977 Y107.896 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106166
G1 F2042
M204 S6000
G3 X125.906 Y108.825 I-.487 J1.416 E.00469
M204 S10000
G1 X125.904 Y124.977 F42000
; LINE_WIDTH: 0.106385
G1 F2042
M204 S6000
G3 X124.977 Y125.904 I-1.422 J-.496 E.00469
M204 S10000
G1 X108.823 Y125.904 F42000
; LINE_WIDTH: 0.106203
G1 F2042
M204 S6000
M73 P85 R3
G3 X107.896 Y124.977 I.488 J-1.415 E.00468
M204 S10000
G1 X107.896 Y108.823 F42000
; LINE_WIDTH: 0.10613
G1 F2042
M204 S6000
G3 X108.823 Y107.896 I1.422 J.496 E.00468
; WIPE_START
G1 F15000
G1 X108.524 Y108.038 E-.18533
G1 X108.249 Y108.256 E-.19722
G1 X108.037 Y108.524 E-.19209
G1 X107.896 Y108.823 E-.18537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.609 Y113.885 Z3.6 F42000
G1 X116.03 Y116.03 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2042
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.273 J.866 E.03332
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.829 Y115.611 E-.17777
G1 X114.901 Y115.513 E-.04639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.708 Y114.6 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X116.092 Y114.598 E.02624
G3 X117.001 Y114.463 I.808 J2.314 E.015
G3 X117.651 Y114.581 I-.12 J2.512 E.01077
; WIPE_START
G1 F3600
M204 S6000
G1 X116.092 Y114.598 E-.59253
G1 X116.521 Y114.493 E-.16747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.911 J2.275 E.03277
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
G1 X119.2 Y116.087 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X119.217 Y116.136 E.00084
G3 X119.2 Y117.712 I-2.318 J.763 E.02607
G1 X119.2 Y116.147 E.02542
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.136 E-.00781
G1 X119.322 Y116.608 E-.18377
G1 X119.338 Y116.999 E-.1489
G1 X119.292 Y117.384 E-.14717
G1 X119.2 Y117.712 E-.12967
G1 X119.2 Y117.337 E-.14269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00133
G3 X117.77 Y119.179 I-2.317 J-1.018 E.03194
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
G1 X116.086 Y119.2 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X117.709 Y119.202 E.02636
G3 X116.143 Y119.219 I-.809 J-2.338 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59531
G1 X117.429 Y119.282 E-.11056
G1 X117.288 Y119.299 E-.05414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G1 X116.03 Y119.179 E.02288
G3 X114.621 Y117.77 I.871 J-2.28 E.03333
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.179 E-.53596
G1 X115.654 Y118.998 E-.15864
G1 X115.512 Y118.901 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2042
M204 S5000
G3 X114.6 Y116.089 I2.376 J.483 E.00553
G1 X114.6 Y117.71 E.02632
G3 X114.498 Y116.475 I2.285 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15192
G1 X114.6 Y117.689 E-.60808
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
G3 Z3.6 I.847 J.873 P1  F42000
G1 X124.594 Y107.991 Z3.6
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X124.883 Y108.079 E.0049
G3 X125.838 Y109.499 I-.59 J1.428 E.02946
G1 X125.838 Y124.301 E.24034
G3 X124.301 Y125.838 I-1.545 J-.008 E.03916
G1 X109.499 Y125.838 E.24034
G3 X107.962 Y124.301 I.008 J-1.545 E.03916
G1 X107.962 Y109.499 E.24034
G3 X109.499 Y107.962 I1.545 J.008 E.03916
G1 X124.301 Y107.962 E.24034
G3 X124.535 Y107.981 I-.008 J1.545 E.00383
; WIPE_START
G1 F3600
M204 S6000
G1 X124.883 Y108.079 E-.13726
G1 X125.151 Y108.222 E-.11535
G1 X125.385 Y108.415 E-.11539
G1 X125.578 Y108.649 E-.11538
G1 X125.721 Y108.917 E-.11539
G1 X125.809 Y109.208 E-.11537
G1 X125.821 Y109.328 E-.04587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.331 Y107.863 Z3.7 F42000
G1 X116.965 Y107.596 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X124.822 Y107.6 E.12759
G3 X126.21 Y109.152 I-.175 J1.552 E.037
G1 X126.209 Y124.691 E.25233
G3 X124.646 Y126.21 I-1.57 J-.052 E.03911
G1 X109.109 Y126.209 E.25229
G3 X107.59 Y124.646 I.041 J-1.559 E.03917
G1 X107.591 Y109.109 E.25229
G3 X109.109 Y107.591 I1.57 J.052 E.03838
G1 X116.905 Y107.595 E.12659
; WIPE_START
G1 F3600
M204 S6000
G1 X118.905 Y107.597 E-.76
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
G1 X124.96 Y107.858 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0834027
G1 F2048
M204 S6000
G1 X125.05 Y107.894 E.00024
; LINE_WIDTH: 0.121447
G3 X125.766 Y108.475 I-.612 J1.485 E.00381
; LINE_WIDTH: 0.100979
G3 X125.944 Y108.844 I-1.656 J1.024 E.00133
M204 S10000
G1 X125.942 Y124.96 F42000
; LINE_WIDTH: 0.102043
G1 F2048
M204 S6000
G3 X125.761 Y125.331 I-1.896 J-.691 E.00136
; LINE_WIDTH: 0.121574
G3 X125.051 Y125.906 I-1.284 J-.862 E.00378
; LINE_WIDTH: 0.0834787
G1 X124.96 Y125.942 E.00025
M204 S10000
G1 X108.84 Y125.941 F42000
; LINE_WIDTH: 0.101982
G1 F2048
M204 S6000
G3 X108.469 Y125.762 I.696 J-1.908 E.00135
; LINE_WIDTH: 0.121302
G3 X107.895 Y125.052 I.872 J-1.294 E.00377
; LINE_WIDTH: 0.0835963
G1 X107.858 Y124.96 E.00025
M204 S10000
G1 X107.858 Y108.84 F42000
; LINE_WIDTH: 0.0833887
G1 F2048
M204 S6000
G1 X107.894 Y108.75 E.00024
; LINE_WIDTH: 0.121494
G3 X108.475 Y108.034 I1.488 J.614 E.00381
; LINE_WIDTH: 0.101054
G3 X108.84 Y107.858 I1.013 J1.638 E.00132
; WIPE_START
G1 F15000
G1 X108.475 Y108.034 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.717 Y113.582 Z3.7 F42000
G1 X116.03 Y116.03 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2048
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.341 J.932 E.03326
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53584
G1 X114.828 Y115.611 E-.17745
G1 X114.903 Y115.514 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.998 Y114.463 I.81 J2.315 E.01499
G3 X117.656 Y114.583 I-.281 J3.393 E.01088
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59482
G1 X116.513 Y114.495 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00208
G3 X119.179 Y116.03 I-.99 J2.23 E.03124
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04877
G1 X118.292 Y114.898 E-.17585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.089 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X119.232 Y116.184 E.00163
G3 X119.2 Y117.712 I-2.387 J.714 E.02523
G1 X119.2 Y116.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.232 Y116.184 E-.01814
G1 X119.309 Y116.514 E-.12878
G1 X119.338 Y116.999 E-.18449
G1 X119.292 Y117.383 E-.14713
G1 X119.2 Y117.712 E-.12979
G1 X119.2 Y117.313 E-.15168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X119.178 Y117.77 E.02286
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.285 J-.984 E.03197
M73 P86 R3
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
G1 X116.086 Y119.2 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59515
G1 X117.429 Y119.282 E-.11057
G1 X117.288 Y119.299 E-.05428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.622 Y117.77 I.875 J-2.283 E.0333
G1 X115.97 Y117.77 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53557
G1 X115.822 Y119.089 E-.08613
G1 X115.57 Y118.945 E-.11009
G1 X115.512 Y118.899 E-.02821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F2048
M204 S5000
G3 X114.6 Y116.089 I2.384 J.484 E.00553
G1 X114.6 Y117.712 E.02636
G1 X114.598 Y117.708 E.00008
G3 X114.498 Y116.476 I2.295 J-.807 E.0203
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.15193
G1 X114.6 Y117.689 E-.60807
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
G3 Z3.7 I.848 J.873 P1  F42000
G1 X124.607 Y107.97 Z3.7
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X124.897 Y108.058 E.00493
G3 X125.86 Y109.49 I-.595 J1.439 E.02969
G1 X125.86 Y124.31 E.24066
G3 X124.31 Y125.86 I-1.557 J-.008 E.03947
G1 X109.49 Y125.86 E.24066
G3 X107.94 Y124.31 I.008 J-1.557 E.03947
G1 X107.94 Y109.49 E.24066
G3 X109.49 Y107.94 I1.557 J.008 E.03947
G1 X124.31 Y107.94 E.24066
G3 X124.548 Y107.959 I-.008 J1.557 E.00387
; WIPE_START
G1 F3600
M204 S6000
G1 X124.897 Y108.058 E-.13806
G1 X125.167 Y108.202 E-.11626
G1 X125.404 Y108.396 E-.1163
G1 X125.598 Y108.633 E-.1163
G1 X125.742 Y108.903 E-.11627
G1 X125.831 Y109.196 E-.1163
G1 X125.841 Y109.302 E-.04052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.351 Y107.838 Z3.8 F42000
G1 X116.965 Y107.567 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X124.841 Y107.572 E.12789
G3 X126.238 Y109.135 I-.177 J1.563 E.03725
G1 X126.237 Y124.709 E.2529
G3 X124.663 Y126.238 I-1.573 J-.045 E.03943
G1 X109.091 Y126.237 E.25286
G3 X107.562 Y124.663 I.042 J-1.571 E.03944
G1 X107.563 Y109.091 E.25287
G3 X109.091 Y107.563 I1.573 J.045 E.03868
G1 X116.905 Y107.567 E.12689
; WIPE_START
G1 F3600
M204 S6000
G1 X118.905 Y107.568 E-.76
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
G1 X124.907 Y107.818 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.084422
G1 F2059
M204 S6000
G1 X125.069 Y107.871 E.00044
; LINE_WIDTH: 0.13044
G3 X125.809 Y108.486 I-.578 J1.447 E.00434
; LINE_WIDTH: 0.102463
G3 X125.96 Y108.809 I-2.148 J1.201 E.00118
G1 X125.985 Y108.901 E.00031
M204 S10000
G1 X125.982 Y124.907 F42000
; LINE_WIDTH: 0.103349
G1 F2059
M204 S6000
G1 X125.96 Y124.991 E.00029
G3 X125.81 Y125.315 I-2.251 J-.853 E.00119
; LINE_WIDTH: 0.130656
G3 X125.07 Y125.929 I-1.33 J-.848 E.00435
; LINE_WIDTH: 0.0844929
G1 X124.907 Y125.982 E.00044
M204 S10000
G1 X108.893 Y125.982 F42000
; LINE_WIDTH: 0.103349
G1 F2059
M204 S6000
G1 X108.809 Y125.96 E.00029
G3 X108.486 Y125.81 I.854 J-2.253 E.00119
; LINE_WIDTH: 0.13047
G3 X107.871 Y125.071 I.813 J-1.3 E.00434
; LINE_WIDTH: 0.0842818
G1 X107.815 Y124.899 E.00046
M204 S10000
G1 X107.818 Y108.893 F42000
; LINE_WIDTH: 0.0844231
G1 F2059
M204 S6000
G1 X107.871 Y108.731 E.00044
; LINE_WIDTH: 0.130534
G3 X108.486 Y107.991 I1.445 J.576 E.00435
; LINE_WIDTH: 0.10315
G3 X108.809 Y107.84 I1.115 J1.963 E.00119
G1 X108.893 Y107.818 E.00029
; WIPE_START
G1 F15000
G1 X108.809 Y107.84 E-.14814
G1 X108.486 Y107.991 E-.61186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.709 Y113.556 Z3.8 F42000
G1 X116.03 Y116.03 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2059
M204 S5000
G1 X114.622 Y116.03 E.02286
G3 X116.03 Y114.622 I2.33 J.923 E.03325
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53556
G1 X114.829 Y115.611 E-.17764
G1 X114.904 Y115.513 E-.0468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X116.093 Y114.597 E.02632
G3 X116.996 Y114.462 I.883 J2.818 E.01488
G3 X117.656 Y114.583 I-.276 J3.382 E.01092
; WIPE_START
G1 F3600
M204 S6000
G1 X116.093 Y114.597 E-.59401
G1 X116.517 Y114.494 E-.166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.023 J2.259 E.03118
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
G1 X119.2 Y116.087 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X119.217 Y116.136 E.00084
G3 X119.2 Y117.711 I-2.389 J.762 E.02602
G1 X119.2 Y116.147 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.136 E-.0078
G1 X119.322 Y116.608 E-.18379
G1 X119.338 Y116.999 E-.14888
G1 X119.292 Y117.384 E-.14716
G1 X119.2 Y117.711 E-.1292
G1 X119.2 Y117.334 E-.14318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.109 Y117.936 E.00292
G3 X117.77 Y119.178 I-2.24 J-1.073 E.03037
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
G1 X116.086 Y119.2 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X117.707 Y119.203 E.02632
G3 X116.143 Y119.219 I-.807 J-2.379 E.02582
; WIPE_START
G1 F3600
M204 S6000
G1 X117.707 Y119.203 E-.59425
G1 X117.283 Y119.306 E-.16575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.87 J-2.279 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08511
G1 X115.569 Y118.945 E-.1116
G1 X115.511 Y118.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.53 Y116.323 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2059
M204 S5000
G3 X114.6 Y116.087 I2.364 J.576 E.004
G1 X114.6 Y117.711 E.02636
G3 X114.516 Y116.382 I2.294 J-.812 E.0219
; CHANGE_LAYER
; Z_HEIGHT: 3.5
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
; layer num/total_layer_count: 35/53
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.846 J.875 P1  F42000
G1 X124.619 Y107.948 Z3.8
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X124.912 Y108.037 E.00497
G3 X125.882 Y109.48 I-.599 J1.451 E.02992
G1 X125.882 Y124.32 E.24098
G3 X124.32 Y125.882 I-1.57 J-.008 E.03978
G1 X109.48 Y125.882 E.24098
G3 X107.918 Y124.32 I.008 J-1.57 E.03978
G1 X107.918 Y109.48 E.24098
G3 X109.48 Y107.918 I1.57 J.008 E.03978
G1 X124.32 Y107.918 E.24098
G3 X124.56 Y107.938 I-.008 J1.57 E.00391
; WIPE_START
G1 F3600
M204 S6000
G1 X124.912 Y108.037 E-.13887
G1 X125.184 Y108.182 E-.11717
G1 X125.422 Y108.378 E-.11719
G1 X125.618 Y108.616 E-.11721
G1 X125.763 Y108.888 E-.11721
G1 X125.853 Y109.183 E-.11718
G1 X125.862 Y109.275 E-.03518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.371 Y107.813 Z3.9 F42000
G1 X116.966 Y107.539 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X124.862 Y107.544 E.12822
G3 X126.266 Y109.118 I-.193 J1.586 E.03742
G1 X126.265 Y124.728 E.25347
G3 X124.68 Y126.266 I-1.593 J-.055 E.03964
G1 X109.072 Y126.265 E.25344
G3 X107.534 Y124.68 I.048 J-1.586 E.03968
G1 X107.535 Y109.072 E.25344
G3 X109.072 Y107.535 I1.592 J.055 E.03886
G1 X116.906 Y107.539 E.1272
; WIPE_START
G1 F3600
M204 S6000
G1 X118.906 Y107.54 E-.76
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
G1 X124.853 Y107.777 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881928
G1 F2069
M204 S6000
G3 X125.001 Y107.814 I-.295 J1.501 E.00041
G1 X125.089 Y107.847 E.00026
; LINE_WIDTH: 0.13725
G3 X125.934 Y108.667 I-.533 J1.395 E.00571
; LINE_WIDTH: 0.0923307
G3 X125.985 Y108.793 I-1.898 J.857 E.00039
G1 X126.024 Y108.95 E.00047
M204 S10000
G1 X126.023 Y124.853 F42000
; LINE_WIDTH: 0.088564
G1 F2069
M204 S6000
G3 X125.953 Y125.089 I-.96 J-.159 E.00067
; LINE_WIDTH: 0.136255
G3 X125.089 Y125.953 I-1.415 J-.551 E.00588
; LINE_WIDTH: 0.0886035
G1 X125.001 Y125.987 E.00026
G3 X124.853 Y126.023 I-.448 J-1.519 E.00042
M204 S10000
G1 X108.947 Y126.023 F42000
; LINE_WIDTH: 0.0885098
G1 F2069
M204 S6000
G3 X108.712 Y125.953 I.159 J-.961 E.00067
; LINE_WIDTH: 0.136264
G3 X107.848 Y125.091 I.546 J-1.41 E.00588
; LINE_WIDTH: 0.0882839
G1 X107.813 Y125.001 E.00026
G3 X107.776 Y124.848 I1.603 J-.471 E.00043
M204 S10000
G1 X107.777 Y108.947 F42000
; LINE_WIDTH: 0.088564
G1 F2069
M204 S6000
G3 X107.813 Y108.799 I1.577 J.306 E.00042
G1 X107.847 Y108.711 E.00026
; LINE_WIDTH: 0.138139
G3 X108.617 Y107.889 I1.407 J.546 E.00549
; LINE_WIDTH: 0.0968368
G3 X108.947 Y107.777 I.518 J.982 E.00107
; WIPE_START
G1 F15000
G1 X108.799 Y107.813 E-.3308
G1 X108.617 Y107.889 E-.4292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.756 Y113.532 Z3.9 F42000
G1 X116.03 Y116.03 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2069
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.622 I2.331 J.923 E.03325
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53558
G1 X114.828 Y115.611 E-.17738
G1 X114.904 Y115.513 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X116.093 Y114.597 E.02632
G3 X116.993 Y114.462 I.807 J2.314 E.01487
G3 X117.656 Y114.582 I-.169 J2.839 E.01097
; WIPE_START
G1 F3600
M204 S6000
G1 X116.093 Y114.597 E-.59416
G1 X116.517 Y114.494 E-.16584
; WIPE_END
M73 P87 R3
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.89 Y114.67 E.0021
G3 X119.179 Y116.03 I-1.008 J2.247 E.03122
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
G1 X119.2 Y116.087 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X119.217 Y116.135 E.00083
G3 X119.2 Y117.71 I-2.456 J.761 E.02598
G1 X119.2 Y116.147 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.135 E-.00782
G1 X119.309 Y116.512 E-.14738
G1 X119.338 Y116.997 E-.18454
G1 X119.309 Y117.285 E-.10996
G1 X119.2 Y117.71 E-.16669
G1 X119.2 Y117.332 E-.14362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X119.177 Y117.77 E.02285
G1 X119.149 Y117.845 E.0013
G3 X117.77 Y119.178 I-2.247 J-.944 E.03202
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.177 Y117.77 E-.53532
G1 X119.149 Y117.845 E-.03037
G1 X118.919 Y118.271 E-.18399
G1 X118.901 Y118.291 E-.01032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.616 Y119.232 E.00158
G3 X116.143 Y119.219 I-.716 J-2.338 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59481
G1 X117.616 Y119.232 E-.03702
G1 X117.287 Y119.306 E-.12817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.895 J-2.304 E.03328
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.783 Y119.069 E-.10259
G1 X115.508 Y118.902 E-.12202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.532 Y116.324 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F2069
M204 S5000
G3 X114.6 Y116.087 I2.438 J.576 E.004
G1 X114.6 Y117.713 E.0264
G3 X114.519 Y116.382 I2.37 J-.813 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.087 E-.1164
G1 X114.6 Y117.713 E-.61786
G1 X114.582 Y117.648 E-.02574
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
G3 Z3.9 I.846 J.875 P1  F42000
G1 X124.631 Y107.926 Z3.9
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X124.926 Y108.016 E.005
G3 X125.904 Y109.47 I-.604 J1.462 E.03016
G1 X125.904 Y124.33 E.24129
G3 X124.33 Y125.904 I-1.582 J-.008 E.04009
G1 X109.47 Y125.904 E.24129
G3 X107.896 Y124.33 I.008 J-1.582 E.04009
G1 X107.896 Y109.47 E.24129
G3 X109.47 Y107.896 I1.582 J.008 E.04009
G1 X124.33 Y107.896 E.24129
G3 X124.572 Y107.916 I-.008 J1.582 E.00395
; WIPE_START
G1 F3600
M204 S6000
G1 X124.926 Y108.016 E-.13971
G1 X125.2 Y108.162 E-.11809
G1 X125.441 Y108.359 E-.11809
G1 X125.638 Y108.6 E-.11813
G1 X125.784 Y108.874 E-.11808
G1 X125.874 Y109.171 E-.11812
G1 X125.882 Y109.249 E-.02979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.391 Y107.789 Z4 F42000
G1 X116.966 Y107.511 Z4
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X124.881 Y107.516 E.12852
G3 X126.295 Y109.101 I-.195 J1.597 E.03768
G1 X126.294 Y124.747 E.25405
G3 X124.697 Y126.295 I-1.604 J-.057 E.0399
G1 X109.053 Y126.294 E.25402
G3 X107.505 Y124.697 I.057 J-1.604 E.0399
G1 X107.506 Y109.054 E.25402
G3 X109.053 Y107.506 I1.604 J.057 E.0391
G1 X116.906 Y107.511 E.12751
; WIPE_START
G1 F3600
M204 S6000
G1 X118.906 Y107.512 E-.76
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
G1 X124.821 Y107.743 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0927183
G1 F2078
M204 S6000
G3 X125.017 Y107.788 I-.766 J3.764 E.00058
G1 X125.108 Y107.824 E.00029
; LINE_WIDTH: 0.149141
G3 X125.838 Y108.419 I-.628 J1.515 E.00497
; LINE_WIDTH: 0.130763
G3 X125.996 Y108.74 I-1.6 J.988 E.0016
; LINE_WIDTH: 0.0891976
G3 X126.056 Y108.974 I-1.706 J.563 E.00067
M204 S10000
G1 X126.057 Y124.821 F42000
; LINE_WIDTH: 0.0927531
G1 F2078
M204 S6000
G3 X125.976 Y125.108 I-1.052 J-.142 E.00087
; LINE_WIDTH: 0.145631
G3 X125.11 Y125.976 I-1.413 J-.546 E.00638
; LINE_WIDTH: 0.0928847
G1 X125.016 Y126.011 E.00029
G3 X124.822 Y126.057 I-.58 J-2.046 E.00058
M204 S10000
G1 X108.979 Y126.057 F42000
; LINE_WIDTH: 0.092692
G1 F2078
M204 S6000
G3 X108.692 Y125.976 I.142 J-1.053 E.00087
; LINE_WIDTH: 0.145647
G3 X107.825 Y125.11 I.545 J-1.414 E.00638
; LINE_WIDTH: 0.0935102
G1 X107.784 Y125.002 E.00034
G3 X107.743 Y124.821 I2.029 J-.552 E.00055
M204 S10000
G1 X107.743 Y108.979 F42000
; LINE_WIDTH: 0.0928707
G1 F2078
M204 S6000
G3 X107.789 Y108.784 I1.667 J.289 E.00059
G1 X107.824 Y108.691 E.00029
; LINE_WIDTH: 0.145633
G3 X108.691 Y107.824 I1.413 J.546 E.00639
; LINE_WIDTH: 0.0928276
G3 X108.979 Y107.743 I.431 J.973 E.00087
; WIPE_START
G1 F15000
G1 X108.691 Y107.824 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.779 Y113.513 Z4 F42000
G1 X116.03 Y116.03 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2078
M204 S5000
G1 X114.623 Y116.03 E.02285
G3 X116.03 Y114.621 I2.319 J.908 E.03327
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.623 Y116.03 E-.53532
G1 X114.801 Y115.658 E-.15676
G1 X114.899 Y115.509 E-.06792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X116.09 Y114.598 E.02637
G3 X116.991 Y114.462 I.887 J2.822 E.01485
G3 X117.656 Y114.583 I-.268 J3.372 E.011
; WIPE_START
G1 F3600
M204 S6000
G1 X116.09 Y114.598 E-.59517
G1 X116.511 Y114.496 E-.16484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.031 J2.266 E.03117
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04956
G1 X118.292 Y114.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.089 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X119.23 Y116.177 E.00151
G3 X119.2 Y117.713 I-2.329 J.723 E.02538
G1 X119.2 Y116.149 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.23 Y116.177 E-.01566
G1 X119.309 Y116.514 E-.1316
G1 X119.338 Y116.999 E-.18453
G1 X119.292 Y117.383 E-.14706
G1 X119.2 Y117.713 E-.13007
G1 X119.2 Y117.315 E-.15108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.127 Y117.895 E.0022
G3 X117.77 Y119.178 I-2.259 J-1.03 E.03109
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53589
G1 X119.127 Y117.895 E-.05146
G1 X118.917 Y118.273 E-.16409
G1 X118.903 Y118.29 E-.00857
; WIPE_END
M73 P88 R3
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.615 Y119.233 E.0016
G3 X116.143 Y119.219 I-.715 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59482
G1 X117.615 Y119.233 E-.03754
G1 X117.287 Y119.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.877 J-2.287 E.03331
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08508
G1 X115.568 Y118.945 E-.11169
G1 X115.51 Y118.9 E-.02785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2078
M204 S5000
G3 X114.6 Y116.09 I2.375 J.484 E.00551
G1 X114.6 Y117.711 E.02632
G3 X114.498 Y116.476 I2.285 J-.81 E.02036
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.09 E-.1515
G1 X114.6 Y117.692 E-.6085
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
G3 Z4 I.849 J.872 P1  F42000
G1 X124.644 Y107.905 Z4
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X124.941 Y107.995 E.00504
G3 X125.926 Y109.46 I-.609 J1.473 E.03039
G1 X125.926 Y124.34 E.24161
G3 X124.34 Y125.926 I-1.594 J-.008 E.0404
G1 X109.46 Y125.926 E.24161
G3 X107.874 Y124.34 I.008 J-1.594 E.0404
G1 X107.874 Y109.46 E.24161
G3 X109.46 Y107.874 I1.594 J.008 E.0404
G1 X124.34 Y107.874 E.24161
G3 X124.585 Y107.894 I-.008 J1.594 E.004
; WIPE_START
G1 F3600
M204 S6000
G1 X124.941 Y107.995 E-.14054
G1 X125.217 Y108.142 E-.11898
G1 X125.459 Y108.341 E-.11903
G1 X125.658 Y108.583 E-.11902
G1 X125.805 Y108.859 E-.11899
G1 X125.896 Y109.159 E-.11902
G1 X125.902 Y109.223 E-.02442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.411 Y107.764 Z4.1 F42000
G1 X116.967 Y107.483 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X124.9 Y107.487 E.12882
G3 X126.323 Y109.084 I-.197 J1.608 E.03794
G1 X126.322 Y124.765 E.25462
G3 X124.714 Y126.323 I-1.615 J-.058 E.04016
G1 X109.035 Y126.322 E.25459
G3 X107.477 Y124.714 I.058 J-1.615 E.04016
G1 X107.478 Y109.035 E.2546
G3 X109.035 Y107.478 I1.615 J.058 E.03933
G1 X116.907 Y107.483 E.12782
; WIPE_START
G1 F3600
M204 S6000
G1 X118.907 Y107.484 E-.76
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
G1 X124.803 Y107.712 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.080434
G1 F2085
M204 S6000
G1 X124.873 Y107.725 E.00017
; LINE_WIDTH: 0.103367
G3 X125.032 Y107.763 I-.316 J1.669 E.00055
G1 X125.128 Y107.801 E.00034
; LINE_WIDTH: 0.1584
G3 X125.86 Y108.397 I-.634 J1.524 E.00534
; LINE_WIDTH: 0.139753
G3 X126.02 Y108.721 I-1.577 J.981 E.00174
; LINE_WIDTH: 0.0943791
G3 X126.089 Y108.998 I-1.802 J.597 E.00085
M204 S10000
G1 X126.088 Y124.803 F42000
; LINE_WIDTH: 0.0915567
G1 F2085
M204 S6000
G3 X126.034 Y125.04 I-3.545 J-.679 E.00069
; LINE_WIDTH: 0.135403
G3 X125.88 Y125.373 I-2.274 J-.855 E.0017
; LINE_WIDTH: 0.158049
G3 X125.128 Y125.999 I-1.369 J-.878 E.00553
; LINE_WIDTH: 0.103587
G1 X125.032 Y126.037 E.00034
G3 X124.876 Y126.075 I-.462 J-1.578 E.00054
; LINE_WIDTH: 0.0806305
G1 X124.807 Y126.087 E.00017
M204 S10000
G1 X108.997 Y126.088 F42000
; LINE_WIDTH: 0.0915519
G1 F2085
M204 S6000
G3 X108.76 Y126.034 I.687 J-3.581 E.00069
; LINE_WIDTH: 0.135406
G3 X108.427 Y125.88 I.855 J-2.274 E.0017
; LINE_WIDTH: 0.158075
G3 X107.801 Y125.129 I.878 J-1.369 E.00553
; LINE_WIDTH: 0.107232
G1 X107.735 Y124.922 E.00076
; LINE_WIDTH: 0.0840766
G1 X107.713 Y124.806 E.0003
M204 S10000
G1 X107.712 Y108.997 F42000
; LINE_WIDTH: 0.080434
G1 F2085
M204 S6000
G1 X107.725 Y108.927 E.00017
; LINE_WIDTH: 0.103361
G3 X107.763 Y108.768 I1.669 J.316 E.00055
G1 X107.801 Y108.672 E.00034
; LINE_WIDTH: 0.158222
G3 X108.427 Y107.92 I1.473 J.591 E.00554
; LINE_WIDTH: 0.135298
G3 X108.76 Y107.766 I1.144 J2.024 E.0017
; LINE_WIDTH: 0.0915653
G3 X108.997 Y107.712 I.92 J3.509 E.00069
; WIPE_START
G1 F15000
G1 X108.76 Y107.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.801 Y113.496 Z4.1 F42000
G1 X116.03 Y116.03 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2085
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.303 J.896 E.03328
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.828 Y115.612 E-.17706
G1 X114.903 Y115.514 E-.04711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X116.093 Y114.597 E.02632
G3 X116.988 Y114.462 I.808 J2.315 E.01479
G3 X117.656 Y114.582 I-.201 J3.038 E.01105
; WIPE_START
M73 P88 R2
G1 F3600
M204 S6000
G1 X116.093 Y114.597 E-.59415
G1 X116.517 Y114.494 E-.16586
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-.995 J2.232 E.03121
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04963
G1 X118.292 Y114.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.089 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X119.229 Y116.175 E.00147
G3 X119.2 Y117.712 I-2.326 J.725 E.02541
G1 X119.2 Y116.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.229 Y116.175 E-.01484
G1 X119.309 Y116.514 E-.13233
G1 X119.338 Y116.999 E-.18475
G1 X119.292 Y117.383 E-.14701
G1 X119.2 Y117.712 E-.1299
G1 X119.2 Y117.315 E-.15117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.26 J-.96 E.03199
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53561
G1 X119.149 Y117.846 E-.03087
G1 X118.917 Y118.272 E-.18448
G1 X118.902 Y118.291 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.617 Y119.232 E.00157
G3 X116.143 Y119.219 I-.716 J-2.366 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59476
G1 X117.617 Y119.232 E-.03681
G1 X117.287 Y119.306 E-.12843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.272 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08504
G1 X115.569 Y118.945 E-.11167
G1 X115.511 Y118.899 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.532 Y116.325 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F2085
M204 S5000
G3 X114.6 Y116.089 I2.426 J.575 E.00399
G1 X114.6 Y117.711 E.02634
G3 X114.519 Y116.384 I2.358 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11612
G1 X114.6 Y117.711 E-.61638
G1 X114.582 Y117.641 E-.0275
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
G3 Z4.1 I.847 J.874 P1  F42000
G1 X124.656 Y107.883 Z4.1
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X124.955 Y107.974 E.00508
G3 X125.948 Y109.451 I-.613 J1.484 E.03062
G1 X125.948 Y124.349 E.24193
G3 X124.349 Y125.948 I-1.606 J-.008 E.04072
G1 X109.451 Y125.948 E.24193
G3 X107.852 Y124.349 I.008 J-1.606 E.04072
G1 X107.852 Y109.451 E.24193
G3 X109.451 Y107.852 I1.606 J.008 E.04072
G1 X124.349 Y107.852 E.24193
G3 X124.597 Y107.873 I-.008 J1.606 E.00404
; WIPE_START
G1 F3600
M204 S6000
G1 X124.955 Y107.974 E-.14141
G1 X125.233 Y108.122 E-.11989
G1 X125.477 Y108.323 E-.11991
G1 X125.678 Y108.567 E-.11995
G1 X125.826 Y108.845 E-.11989
G1 X125.918 Y109.147 E-.11994
G1 X125.923 Y109.197 E-.019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.431 Y107.739 Z4.2 F42000
G1 X116.967 Y107.454 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X124.918 Y107.459 E.12912
G3 X126.351 Y109.067 I-.199 J1.619 E.03819
G1 X126.35 Y124.783 E.2552
G3 X124.731 Y126.351 I-1.627 J-.06 E.04043
G1 X109.017 Y126.35 E.25517
G3 X107.449 Y124.731 I.06 J-1.627 E.04043
G1 X107.45 Y109.017 E.25517
G3 X109.017 Y107.45 I1.627 J.06 E.03958
G1 X116.907 Y107.454 E.12812
; WIPE_START
G1 F3600
M204 S6000
G1 X118.907 Y107.456 E-.76
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
G1 X124.786 Y107.681 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0845066
G1 F2093
M204 S6000
G1 X124.891 Y107.701 E.00028
; LINE_WIDTH: 0.11182
G1 X125.148 Y107.777 E.00098
; LINE_WIDTH: 0.167401
G3 X125.903 Y108.408 I-.598 J1.484 E.00595
; LINE_WIDTH: 0.143986
G3 X126.059 Y108.743 I-2.29 J1.271 E.00185
; LINE_WIDTH: 0.0964829
G3 X126.119 Y109.017 I-2.755 J.746 E.00086
M204 S10000
G1 X126.119 Y124.786 F42000
; LINE_WIDTH: 0.0965698
G1 F2093
M204 S6000
G3 X126.059 Y125.056 I-3.454 J-.621 E.00085
; LINE_WIDTH: 0.144079
G3 X125.903 Y125.392 I-2.284 J-.857 E.00185
; LINE_WIDTH: 0.167259
G3 X125.148 Y126.023 I-1.378 J-.883 E.00594
; LINE_WIDTH: 0.112051
G1 X124.894 Y126.099 E.00098
; LINE_WIDTH: 0.0847221
G1 X124.791 Y126.117 E.00027
M204 S10000
G1 X109.015 Y126.119 F42000
; LINE_WIDTH: 0.0965609
G1 F2093
M204 S6000
G3 X108.744 Y126.059 I.62 J-3.453 E.00085
; LINE_WIDTH: 0.144079
G3 X108.408 Y125.903 I.857 J-2.285 E.00185
; LINE_WIDTH: 0.167278
G3 X107.778 Y125.149 I.883 J-1.378 E.00593
; LINE_WIDTH: 0.112111
G1 X107.736 Y125.041 E.00042
G3 X107.7 Y124.888 I2.323 J-.628 E.00058
; LINE_WIDTH: 0.0840542
G1 X107.683 Y124.79 E.00025
M204 S10000
G1 X107.681 Y109.015 F42000
; LINE_WIDTH: 0.0845047
G1 F2093
M204 S6000
G1 X107.701 Y108.909 E.00028
; LINE_WIDTH: 0.11182
G1 X107.777 Y108.652 E.00098
; LINE_WIDTH: 0.167315
G3 X108.408 Y107.897 I1.539 J.643 E.00594
; LINE_WIDTH: 0.143542
G3 X108.744 Y107.742 I1.18 J2.12 E.00184
; LINE_WIDTH: 0.0967685
G3 X109.014 Y107.681 I.865 J3.232 E.00085
; WIPE_START
G1 F15000
G1 X108.744 Y107.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.783 Y113.474 Z4.2 F42000
G1 X116.03 Y116.03 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.29 J.881 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.732 Y115.781 E-.10375
G1 X114.882 Y115.528 E-.11172
G1 X114.897 Y115.51 E-.0087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.986 Y114.462 I.888 J2.833 E.01475
G3 X117.656 Y114.583 I-.259 J3.355 E.01108
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59482
G1 X116.513 Y114.495 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.008 J2.244 E.03119
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
G1 X119.2 Y116.087 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X119.217 Y116.136 E.00084
G3 X119.2 Y117.712 I-2.394 J.762 E.02604
G1 X119.2 Y116.147 E.02542
; WIPE_START
G1 F3600
M204 S6000
M73 P89 R2
G1 X119.217 Y116.136 E-.00778
G1 X119.309 Y116.512 E-.14718
G1 X119.338 Y116.999 E-.18538
G1 X119.292 Y117.383 E-.14707
G1 X119.2 Y117.712 E-.12977
G1 X119.2 Y117.336 E-.14282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
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
G1 X116.086 Y119.2 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.218 I-.809 J-2.445 E.02583
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59499
G1 X117.287 Y119.305 E-.16501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.875 J-2.285 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08507
G1 X115.569 Y118.945 E-.11157
G1 X115.51 Y118.901 E-.02799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.531 Y116.325 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2093
M204 S5000
G3 X114.6 Y116.089 I2.39 J.576 E.00399
G1 X114.6 Y117.713 E.02637
G3 X114.517 Y116.383 I2.321 J-.812 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.089 E-.11613
G1 X114.6 Y117.713 E-.61706
G1 X114.581 Y117.645 E-.02681
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
G3 Z4.2 I.847 J.874 P1  F42000
G1 X124.668 Y107.861 Z4.2
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X124.969 Y107.953 E.00511
G3 X125.97 Y109.441 I-.618 J1.496 E.03086
G1 X125.97 Y124.359 E.24224
G3 X124.359 Y125.97 I-1.618 J-.008 E.04103
G1 X109.441 Y125.97 E.24224
G3 X107.83 Y124.359 I.008 J-1.618 E.04103
G1 X107.83 Y109.441 E.24224
G3 X109.441 Y107.83 I1.618 J.008 E.04103
G1 X124.359 Y107.83 E.24224
G3 X124.609 Y107.851 I-.008 J1.618 E.00408
; WIPE_START
G1 F3600
M204 S6000
G1 X124.969 Y107.953 E-.1423
G1 X125.25 Y108.103 E-.1208
G1 X125.496 Y108.304 E-.12084
G1 X125.697 Y108.55 E-.12084
G1 X125.847 Y108.831 E-.12081
G1 X125.94 Y109.135 E-.12083
G1 X125.943 Y109.17 E-.01358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.451 Y107.715 Z4.3 F42000
G1 X116.967 Y107.426 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X124.937 Y107.431 E.12942
G3 X126.38 Y109.05 I-.2 J1.63 E.03846
G1 X126.379 Y124.802 E.25578
G3 X124.748 Y126.38 I-1.638 J-.062 E.04069
G1 X108.998 Y126.379 E.25574
G3 X107.42 Y124.748 I.062 J-1.638 E.04069
G1 X107.421 Y108.998 E.25575
G3 X108.998 Y107.421 I1.638 J.062 E.03981
G1 X116.907 Y107.426 E.12843
; WIPE_START
G1 F3600
M204 S6000
G1 X118.907 Y107.427 E-.76
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
G1 X124.768 Y107.65 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0885605
G1 F2100
M204 S6000
G1 X124.909 Y107.677 E.00039
; LINE_WIDTH: 0.120278
G1 X125.167 Y107.754 E.00108
; LINE_WIDTH: 0.176644
G3 X125.926 Y108.389 I-.604 J1.493 E.00636
; LINE_WIDTH: 0.152526
G3 X126.083 Y108.728 I-2.149 J1.199 E.002
; LINE_WIDTH: 0.10081
G3 X126.148 Y109.03 I-4.932 J1.224 E.001
M204 S10000
G1 X126.15 Y124.768 F42000
; LINE_WIDTH: 0.101507
G1 F2100
M204 S6000
G3 X126.083 Y125.072 I-3.362 J-.576 E.00102
; LINE_WIDTH: 0.152502
G3 X125.927 Y125.412 I-2.211 J-.814 E.002
; LINE_WIDTH: 0.176482
G3 X125.167 Y126.046 I-1.387 J-.888 E.00635
; LINE_WIDTH: 0.120522
G1 X124.913 Y126.123 E.00107
; LINE_WIDTH: 0.0887922
G1 X124.775 Y126.147 E.00038
M204 S10000
G1 X109.032 Y126.15 F42000
; LINE_WIDTH: 0.101331
G1 F2100
M204 S6000
G3 X108.727 Y126.084 I.58 J-3.42 E.00102
; LINE_WIDTH: 0.152732
G3 X108.388 Y125.927 I.857 J-2.292 E.002
; LINE_WIDTH: 0.176502
G3 X107.754 Y125.168 I.887 J-1.386 E.00634
; LINE_WIDTH: 0.119877
G1 X107.676 Y124.906 E.0011
; LINE_WIDTH: 0.0881291
G1 X107.653 Y124.775 E.00036
M204 S10000
G1 X107.65 Y109.032 F42000
; LINE_WIDTH: 0.088596
G1 F2100
M204 S6000
G1 X107.677 Y108.89 E.0004
; LINE_WIDTH: 0.120277
G3 X107.714 Y108.737 I1.563 J.3 E.00064
G1 X107.754 Y108.632 E.00045
; LINE_WIDTH: 0.17659
G3 X108.388 Y107.873 I1.549 J.649 E.00635
; LINE_WIDTH: 0.152191
G3 X108.728 Y107.717 I1.187 J2.136 E.00199
; LINE_WIDTH: 0.101507
G3 X109.032 Y107.65 I.881 J3.295 E.00102
; WIPE_START
G1 F15000
G1 X108.728 Y107.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.765 Y113.451 Z4.3 F42000
G1 X116.03 Y116.03 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2100
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.308 J.899 E.03329
G1 X116.03 Y115.97 E.02191
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
G1 X117.714 Y114.6 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.983 Y114.462 I.889 J2.837 E.01471
G3 X117.656 Y114.582 I-.19 J3.005 E.01113
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59487
G1 X116.513 Y114.496 E-.16513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
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
G1 X119.2 Y116.089 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X119.228 Y116.17 E.00139
G3 X119.2 Y117.712 I-2.355 J.729 E.02548
G1 X119.2 Y116.149 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.228 Y116.17 E-.01324
G1 X119.309 Y116.514 E-.13445
G1 X119.338 Y116.997 E-.18381
G1 X119.292 Y117.382 E-.14741
G1 X119.2 Y117.712 E-.13015
G1 X119.2 Y117.315 E-.15095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.26 J-.96 E.03199
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53565
G1 X119.149 Y117.846 E-.03089
G1 X118.918 Y118.271 E-.18368
G1 X118.902 Y118.29 E-.00977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.616 Y119.232 E.00158
G3 X116.143 Y119.219 I-.715 J-2.388 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59477
G1 X117.616 Y119.232 E-.03705
G1 X117.287 Y119.306 E-.12818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.875 J-2.285 E.0333
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.737 Y119.045 E-.1224
G1 X115.568 Y118.944 E-.07451
G1 X115.509 Y118.902 E-.0277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.509 Y116.417 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F2100
M204 S5000
G3 X114.6 Y116.088 I2.38 J.482 E.00555
G1 X114.6 Y117.71 E.02634
G3 X114.498 Y116.476 I2.288 J-.811 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.15241
G1 X114.6 Y117.687 E-.60759
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
G3 Z4.3 I.85 J.871 P1  F42000
G1 X124.68 Y107.84 Z4.3
G1 Z4
G1 E.8 F1800
G1 F2107
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
G3 X124.621 Y107.829 I-.008 J1.631 E.00412
; WIPE_START
G1 F3600
M204 S6000
G1 X124.984 Y107.932 E-.14319
G1 X125.266 Y108.083 E-.12176
G1 X125.514 Y108.286 E-.12172
G1 X125.717 Y108.534 E-.12174
G1 X125.868 Y108.816 E-.12172
G1 X125.961 Y109.123 E-.12175
G1 X125.963 Y109.144 E-.00812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.471 Y107.69 Z4.4 F42000
G1 X116.968 Y107.398 Z4.4
G1 Z4
M73 P90 R2
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X124.956 Y107.403 E.12971
G3 X126.408 Y109.033 I-.202 J1.642 E.03872
G1 X126.407 Y124.821 E.25635
G3 X124.767 Y126.408 I-1.639 J-.052 E.04099
G1 X108.98 Y126.407 E.25635
G3 X107.392 Y124.765 I.063 J-1.649 E.04096
G1 X107.393 Y108.979 E.25632
G3 X108.979 Y107.393 I1.65 J.063 E.04005
G1 X116.908 Y107.398 E.12874
; WIPE_START
G1 F3600
M204 S6000
G1 X118.908 Y107.399 E-.76
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
G1 X124.758 Y107.623 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0912562
G1 F2107
M204 S6000
G3 X124.928 Y107.652 I-.325 J2.382 E.00049
; LINE_WIDTH: 0.128733
G1 X125.187 Y107.73 E.00118
; LINE_WIDTH: 0.183163
G3 X126.049 Y108.567 I-.555 J1.436 E.00813
; LINE_WIDTH: 0.137094
G3 X126.108 Y108.711 I-1.396 J.648 E.00073
G1 X126.136 Y108.821 E.00053
; LINE_WIDTH: 0.0970898
G3 X126.178 Y109.043 I-3.068 J.687 E.0007
M204 S10000
G1 X126.177 Y124.758 F42000
; LINE_WIDTH: 0.101338
G1 F2107
M204 S6000
G3 X126.124 Y125.033 I-3.204 J-.478 E.00091
; LINE_WIDTH: 0.146604
G1 X126.108 Y125.089 E.0003
G3 X126.023 Y125.29 I-2.065 J-.747 E.00111
; LINE_WIDTH: 0.184067
G3 X125.186 Y126.07 I-1.394 J-.657 E.00776
; LINE_WIDTH: 0.128493
G1 X124.925 Y126.148 E.00119
; LINE_WIDTH: 0.0921849
G1 X124.757 Y126.178 E.00049
M204 S10000
G1 X109.042 Y126.177 F42000
; LINE_WIDTH: 0.101326
G1 F2107
M204 S6000
G3 X108.768 Y126.124 I.48 J-3.211 E.00091
; LINE_WIDTH: 0.14654
G1 X108.711 Y126.108 E.0003
G3 X108.51 Y126.023 I.749 J-2.07 E.00111
; LINE_WIDTH: 0.184088
G3 X107.731 Y125.187 I.657 J-1.394 E.00776
; LINE_WIDTH: 0.128411
G1 X107.652 Y124.925 E.00119
; LINE_WIDTH: 0.0922933
G1 X107.623 Y124.759 E.00049
M204 S10000
G1 X107.623 Y109.042 F42000
; LINE_WIDTH: 0.0912956
G1 F2107
M204 S6000
G3 X107.652 Y108.872 I2.403 J.329 E.00049
; LINE_WIDTH: 0.12875
G3 X107.689 Y108.721 I1.54 J.295 E.00068
G1 X107.731 Y108.613 E.00051
; LINE_WIDTH: 0.185762
G3 X108.369 Y107.85 I1.514 J.619 E.00677
G1 X108.382 Y107.843 E.0001
; LINE_WIDTH: 0.155283
G3 X108.711 Y107.692 I1.322 J2.462 E.00197
G1 X108.768 Y107.676 E.00032
; LINE_WIDTH: 0.101331
G3 X109.042 Y107.623 I.754 J3.156 E.00091
; WIPE_START
G1 F15000
G1 X108.768 Y107.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.775 Y113.436 Z4.4 F42000
G1 X116.03 Y116.03 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2107
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
G1 X117.714 Y114.6 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.98 Y114.462 I.81 J2.316 E.0147
G3 X117.656 Y114.582 I-.184 J2.99 E.01117
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59496
G1 X116.513 Y114.495 E-.16504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-1.006 J2.243 E.0312
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
G1 X119.2 Y116.088 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X119.227 Y116.167 E.00135
G3 X119.2 Y117.712 I-2.322 J.732 E.02552
G1 X119.2 Y116.148 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.227 Y116.167 E-.01248
G1 X119.309 Y116.514 E-.13543
G1 X119.338 Y116.999 E-.18459
G1 X119.292 Y117.383 E-.147
G1 X119.2 Y117.712 E-.1297
G1 X119.2 Y117.315 E-.15081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.317 J-1.017 E.03194
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
G1 X116.086 Y119.2 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X117.711 Y119.201 E.02638
G3 X116.143 Y119.219 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.59581
G1 X117.303 Y119.306 E-.16027
G1 X117.292 Y119.307 E-.00392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.872 J-2.281 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08501
G1 X115.569 Y118.945 E-.11155
G1 X115.51 Y118.901 E-.02805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.532 Y116.324 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2107
M204 S5000
G3 X114.6 Y116.088 I2.43 J.576 E.00399
G1 X114.6 Y117.712 E.02636
G3 X114.519 Y116.383 I2.362 J-.812 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y116.088 E-.11609
G1 X114.6 Y117.712 E-.6169
G1 X114.582 Y117.643 E-.02702
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
G3 Z4.4 I.848 J.873 P1  F42000
G1 X124.692 Y107.818 Z4.4
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X124.998 Y107.911 E.00519
G3 X126.014 Y109.421 I-.627 J1.518 E.03132
G1 X126.014 Y124.379 E.24288
G3 X124.379 Y126.014 I-1.643 J-.008 E.04165
G1 X109.421 Y126.014 E.24288
G3 X107.786 Y124.379 I.008 J-1.643 E.04165
G1 X107.786 Y109.421 E.24288
G3 X109.421 Y107.786 I1.643 J.008 E.04165
G1 X124.379 Y107.786 E.24288
G3 X124.633 Y107.807 I-.008 J1.643 E.00415
; WIPE_START
G1 F3600
M204 S6000
G1 X124.998 Y107.911 E-.14414
G1 X125.283 Y108.063 E-.12262
G1 X125.532 Y108.268 E-.12266
G1 X125.737 Y108.517 E-.12265
G1 X125.889 Y108.802 E-.12266
G1 X125.983 Y109.111 E-.12263
G1 X125.984 Y109.117 E-.00265
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.491 Y107.665 Z4.5 F42000
G1 X116.968 Y107.37 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X124.975 Y107.375 E.13002
G3 X126.436 Y109.016 I-.192 J1.642 E.03904
G1 X126.435 Y124.839 E.25693
G3 X124.784 Y126.436 I-1.65 J-.054 E.04126
G1 X108.961 Y126.435 E.25693
G3 X107.364 Y124.782 I.065 J-1.661 E.04122
G1 X107.365 Y108.961 E.25689
G3 X108.961 Y107.365 I1.661 J.065 E.0403
G1 X116.908 Y107.37 E.12904
; WIPE_START
G1 F3600
M204 S6000
G1 X118.908 Y107.371 E-.76
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
G1 X124.748 Y107.595 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961115
G1 F2114
M204 S6000
G3 X124.946 Y107.628 I-.371 J2.779 E.00061
; LINE_WIDTH: 0.137227
G1 X125.206 Y107.707 E.00128
; LINE_WIDTH: 0.195413
G3 X125.947 Y108.31 I-.651 J1.555 E.00686
; LINE_WIDTH: 0.175965
G3 X126.114 Y108.645 I-1.446 J.932 E.00236
; LINE_WIDTH: 0.12731
G3 X126.184 Y108.917 I-1.598 J.556 E.00121
; LINE_WIDTH: 0.089785
G1 X126.206 Y109.055 E.00039
M204 S10000
G1 X126.205 Y124.748 F42000
; LINE_WIDTH: 0.096156
G1 F2114
M204 S6000
G3 X126.172 Y124.946 I-2.766 J-.368 E.00061
; LINE_WIDTH: 0.137237
G3 X126.093 Y125.207 I-1.139 J-.204 E.00129
; LINE_WIDTH: 0.191544
G3 X125.207 Y126.092 I-1.454 J-.568 E.00893
; LINE_WIDTH: 0.137002
G1 X125.094 Y126.136 E.00057
G3 X124.942 Y126.173 I-.445 J-1.507 E.00074
; LINE_WIDTH: 0.0962998
G3 X124.745 Y126.206 I-.669 J-3.307 E.00061
M204 S10000
G1 X109.052 Y126.205 F42000
; LINE_WIDTH: 0.0835509
G1 F2114
M204 S6000
G1 X108.97 Y126.193 E.00021
; LINE_WIDTH: 0.118361
G3 X108.695 Y126.133 I.446 J-2.704 E.00111
; LINE_WIDTH: 0.170054
G3 X108.35 Y125.973 I.862 J-2.315 E.0023
; LINE_WIDTH: 0.194938
G3 X107.708 Y125.207 I.897 J-1.404 E.00717
; LINE_WIDTH: 0.1378
G1 X107.663 Y125.095 E.00057
G3 X107.628 Y124.945 I2.295 J-.621 E.00073
; LINE_WIDTH: 0.0959467
G1 X107.593 Y124.745 E.00062
M204 S10000
G1 X107.595 Y109.052 F42000
; LINE_WIDTH: 0.096156
G1 F2114
M204 S6000
G3 X107.628 Y108.854 I2.766 J.368 E.00061
; LINE_WIDTH: 0.137237
G3 X107.664 Y108.706 I1.499 J.285 E.00072
G1 X107.707 Y108.593 E.00057
; LINE_WIDTH: 0.191306
G3 X108.594 Y107.707 I1.463 J.577 E.00892
; LINE_WIDTH: 0.137222
G3 X108.854 Y107.628 I.464 J1.06 E.00128
; LINE_WIDTH: 0.0961624
G3 X109.052 Y107.595 I.569 J2.748 E.00061
; WIPE_START
G1 F15000
G1 X108.854 Y107.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.811 Y113.432 Z4.5 F42000
G1 X116.03 Y116.03 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2114
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.309 J.899 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53569
G1 X114.732 Y115.78 E-.10373
G1 X114.882 Y115.528 E-.11163
G1 X114.897 Y115.51 E-.00895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.978 Y114.462 I.81 J2.317 E.01466
G3 X117.656 Y114.583 I-.247 J3.342 E.0112
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59475
G1 X116.514 Y114.495 E-.16525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.033 J2.268 E.03118
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
G1 X119.2 Y116.087 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X119.217 Y116.136 E.00084
G3 X119.2 Y117.712 I-2.392 J.762 E.02603
G1 X119.2 Y116.147 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.136 E-.00777
G1 X119.322 Y116.608 E-.18363
G1 X119.338 Y116.999 E-.14887
G1 X119.292 Y117.383 E-.14694
G1 X119.2 Y117.712 E-.12969
G1 X119.2 Y117.335 E-.1431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.5 F42000
M73 P91 R2
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.179 I-2.318 J-1.018 E.03195
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
G1 X116.086 Y119.2 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X117.71 Y119.202 E.02637
G3 X116.143 Y119.219 I-.81 J-2.35 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.71 Y119.202 E-.59543
G1 X117.289 Y119.304 E-.16457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.895 J-2.306 E.03329
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08495
G1 X115.569 Y118.945 E-.11153
G1 X115.51 Y118.901 E-.02814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.088 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X114.6 Y117.713 E.02638
G3 X114.581 Y116.145 I2.324 J-.812 E.02592
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.713 E-.5959
G1 X114.508 Y117.38 E-.13119
G1 X114.498 Y117.294 E-.03291
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
G3 Z4.5 I.829 J.891 P1  F42000
G1 X124.704 Y107.796 Z4.5
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X125.013 Y107.89 E.00523
G3 X126.036 Y109.412 I-.632 J1.53 E.03156
G1 X126.036 Y124.388 E.24319
G3 X124.388 Y126.036 I-1.655 J-.008 E.04196
G1 X109.412 Y126.036 E.24319
G3 X107.764 Y124.388 I.008 J-1.655 E.04196
G1 X107.764 Y109.412 E.24319
G3 X109.412 Y107.764 I1.655 J.008 E.04196
G1 X124.388 Y107.764 E.24319
G3 X124.645 Y107.786 I-.008 J1.655 E.00419
; WIPE_START
G1 F3600
M204 S6000
G1 X125.013 Y107.89 E-.14511
G1 X125.299 Y108.043 E-.12352
G1 X125.551 Y108.249 E-.12357
G1 X125.757 Y108.501 E-.12357
G1 X125.91 Y108.787 E-.12353
G1 X126.003 Y109.091 E-.12071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.509 Y107.64 Z4.6 F42000
G1 X116.968 Y107.342 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X124.994 Y107.347 E.13031
G3 X126.465 Y108.999 I-.194 J1.653 E.0393
G1 X126.463 Y124.857 E.2575
G3 X124.801 Y126.465 I-1.662 J-.055 E.04153
G1 X108.943 Y126.463 E.2575
G3 X107.335 Y124.799 I.066 J-1.672 E.04149
G1 X107.337 Y108.943 E.25747
G3 X108.943 Y107.337 I1.672 J.066 E.04054
G1 X116.908 Y107.342 E.12935
; WIPE_START
G1 F3600
M204 S6000
G1 X118.908 Y107.343 E-.76
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
G1 X124.739 Y107.566 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0877149
G1 F2121
M204 S6000
G1 X124.848 Y107.583 E.0003
; LINE_WIDTH: 0.113068
G1 X124.964 Y107.604 E.00044
; LINE_WIDTH: 0.145695
G1 X125.226 Y107.684 E.00138
; LINE_WIDTH: 0.204656
G3 X125.971 Y108.293 I-.657 J1.566 E.00728
; LINE_WIDTH: 0.184752
G3 X126.137 Y108.626 I-1.491 J.952 E.00248
; LINE_WIDTH: 0.135691
G3 X126.208 Y108.898 I-1.56 J.549 E.00131
; LINE_WIDTH: 0.0939969
G1 X126.235 Y109.065 E.0005
M204 S10000
G1 X126.234 Y124.739 F42000
; LINE_WIDTH: 0.0877119
G1 F2121
M204 S6000
G1 X126.217 Y124.848 E.0003
; LINE_WIDTH: 0.126823
G3 X126.157 Y125.121 I-3.078 J-.539 E.0012
; LINE_WIDTH: 0.178446
G3 X125.997 Y125.47 I-2.23 J-.814 E.00245
; LINE_WIDTH: 0.2041
G3 X125.225 Y126.116 I-1.412 J-.901 E.00761
; LINE_WIDTH: 0.145335
G1 X124.96 Y126.197 E.0014
; LINE_WIDTH: 0.120008
G1 X124.907 Y126.207 E.00022
; LINE_WIDTH: 0.0946268
G1 X124.735 Y126.235 E.00052
M204 S10000
G1 X109.061 Y126.234 F42000
; LINE_WIDTH: 0.087709
G1 F2121
M204 S6000
G1 X108.952 Y126.217 E.0003
; LINE_WIDTH: 0.1265
G3 X108.678 Y126.158 I.619 J-3.493 E.0012
; LINE_WIDTH: 0.178732
G3 X108.33 Y125.997 I.861 J-2.319 E.00246
; LINE_WIDTH: 0.204451
G3 X107.684 Y125.227 I.888 J-1.401 E.00761
; LINE_WIDTH: 0.146352
G1 X107.639 Y125.11 E.00064
G3 X107.604 Y124.965 I2.238 J-.606 E.00076
; LINE_WIDTH: 0.11314
G1 X107.585 Y124.85 E.00043
; LINE_WIDTH: 0.0872487
G1 X107.565 Y124.735 E.00031
M204 S10000
G1 X107.566 Y109.061 F42000
; LINE_WIDTH: 0.0877119
G1 F2121
M204 S6000
G1 X107.583 Y108.952 E.0003
; LINE_WIDTH: 0.113105
G1 X107.604 Y108.835 E.00044
; LINE_WIDTH: 0.145733
G3 X107.639 Y108.69 I1.481 J.281 E.00076
G1 X107.684 Y108.574 E.00063
; LINE_WIDTH: 0.204371
G3 X108.33 Y107.804 I1.531 J.629 E.00761
; LINE_WIDTH: 0.177822
G3 X108.679 Y107.643 I1.862 J3.583 E.00244
; LINE_WIDTH: 0.126824
G3 X108.952 Y107.583 I.812 J3.016 E.0012
; LINE_WIDTH: 0.0877225
G1 X109.061 Y107.566 E.0003
; WIPE_START
G1 F15000
G1 X108.952 Y107.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.854 Y113.433 Z4.6 F42000
G1 X116.03 Y116.03 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2121
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.277 J.868 E.03333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53571
G1 X114.827 Y115.613 E-.17683
G1 X114.897 Y115.509 E-.04747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.975 Y114.462 I.81 J2.317 E.01462
G3 X117.656 Y114.583 I-.243 J3.334 E.01125
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59487
G1 X116.513 Y114.495 E-.16513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00212
G3 X119.179 Y116.03 I-.993 J2.23 E.03121
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
G1 X119.2 Y116.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X119.225 Y116.163 E.00127
G3 X119.2 Y117.712 I-2.32 J.737 E.0256
G1 X119.2 Y116.148 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X119.225 Y116.163 E-.01106
G1 X119.309 Y116.514 E-.13727
G1 X119.338 Y116.999 E-.18466
G1 X119.292 Y117.383 E-.14697
G1 X119.2 Y117.712 E-.1296
G1 X119.2 Y117.316 E-.15044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
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
G1 X116.086 Y119.2 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.378 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59507
G1 X117.288 Y119.305 E-.16494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.272 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08501
G1 X115.569 Y118.945 E-.11151
G1 X115.511 Y118.899 E-.0281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2121
M204 S5000
G1 X114.6 Y117.712 E.02636
G3 X114.581 Y116.145 I2.292 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.712 E-.59533
G1 X114.493 Y117.292 E-.16467
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
G3 Z4.6 I.829 J.891 P1  F42000
G1 X124.716 Y107.774 Z4.6
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X125.027 Y107.869 E.00528
G3 X126.058 Y109.402 I-.637 J1.541 E.03179
G1 X126.058 Y124.398 E.24351
G3 X124.398 Y126.058 I-1.667 J-.008 E.04227
G1 X109.402 Y126.058 E.24351
G3 X107.742 Y124.398 I.008 J-1.667 E.04227
G1 X107.742 Y109.402 E.24351
G3 X109.402 Y107.742 I1.667 J.008 E.04227
G1 X124.398 Y107.742 E.24351
G3 X124.657 Y107.764 I-.008 J1.667 E.00423
; WIPE_START
G1 F3600
M204 S6000
G1 X125.027 Y107.869 E-.14608
G1 X125.316 Y108.023 E-.12448
G1 X125.569 Y108.231 E-.12445
G1 X125.777 Y108.484 E-.12445
G1 X125.931 Y108.773 E-.12448
G1 X126.02 Y109.065 E-.11606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.527 Y107.615 Z4.7 F42000
G1 X116.969 Y107.313 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X125.013 Y107.318 E.13061
G3 X126.493 Y108.982 I-.195 J1.664 E.03956
G1 X126.492 Y124.876 E.25808
G3 X124.818 Y126.493 I-1.673 J-.057 E.04179
G1 X108.924 Y126.492 E.25808
G3 X107.307 Y124.818 I.057 J-1.673 E.04179
G1 X107.308 Y108.924 E.25808
G3 X108.924 Y107.308 I1.684 J.068 E.04078
G1 X116.909 Y107.313 E.12965
; WIPE_START
G1 F3600
M204 S6000
G1 X118.909 Y107.315 E-.76
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
G1 X124.722 Y107.541 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881251
G1 F2128
M204 S6000
G1 X124.867 Y107.559 E.00039
; LINE_WIDTH: 0.121269
G1 X124.983 Y107.58 E.00048
; LINE_WIDTH: 0.154208
G1 X125.245 Y107.66 E.00149
; LINE_WIDTH: 0.213898
G3 X125.991 Y108.268 I-.661 J1.573 E.00765
; LINE_WIDTH: 0.193979
G3 X126.161 Y108.606 I-1.424 J.927 E.00267
; LINE_WIDTH: 0.144112
G3 X126.232 Y108.879 I-1.528 J.543 E.00141
; LINE_WIDTH: 0.0937113
G1 X126.26 Y109.09 E.00063
M204 S10000
G1 X126.259 Y124.722 F42000
; LINE_WIDTH: 0.0881199
G1 F2128
M204 S6000
G1 X126.241 Y124.867 E.0004
; LINE_WIDTH: 0.134888
G3 X126.181 Y125.138 I-3.005 J-.523 E.00128
; LINE_WIDTH: 0.186348
G3 X126.029 Y125.474 I-3.397 J-1.333 E.00248
; LINE_WIDTH: 0.213151
G1 X126.02 Y125.489 E.00014
G3 X125.245 Y126.14 I-1.421 J-.906 E.00803
; LINE_WIDTH: 0.153916
G1 X124.979 Y126.221 E.0015
; LINE_WIDTH: 0.113603
G1 X124.813 Y126.25 E.00064
; LINE_WIDTH: 0.0811838
G1 X124.71 Y126.26 E.00025
M204 S10000
G1 X109.078 Y126.259 F42000
; LINE_WIDTH: 0.0881296
G1 F2128
M204 S6000
G1 X108.933 Y126.241 E.0004
; LINE_WIDTH: 0.134892
G3 X108.662 Y126.181 I.526 J-3.016 E.00128
; LINE_WIDTH: 0.18702
G3 X108.311 Y126.02 I.766 J-2.126 E.00261
; LINE_WIDTH: 0.213361
G3 X107.661 Y125.246 I.901 J-1.417 E.00803
; LINE_WIDTH: 0.154286
G1 X107.614 Y125.126 E.0007
G3 X107.579 Y124.976 I2.315 J-.624 E.00083
; LINE_WIDTH: 0.113261
G1 X107.55 Y124.813 E.00062
; LINE_WIDTH: 0.0811848
G1 X107.54 Y124.71 E.00025
M204 S10000
G1 X107.541 Y109.078 F42000
; LINE_WIDTH: 0.0881199
G1 F2128
M204 S6000
G1 X107.559 Y108.933 E.0004
; LINE_WIDTH: 0.121322
G1 X107.58 Y108.817 E.00048
; LINE_WIDTH: 0.154254
G3 X107.614 Y108.674 I1.455 J.275 E.00079
G1 X107.661 Y108.554 E.0007
; LINE_WIDTH: 0.213602
G3 X108.311 Y107.78 I1.54 J.634 E.00804
; LINE_WIDTH: 0.186465
G3 X108.662 Y107.619 I1.84 J3.535 E.0026
; LINE_WIDTH: 0.134887
G3 X108.933 Y107.559 I.795 J2.95 E.00128
; LINE_WIDTH: 0.0881274
G1 X109.078 Y107.541 E.00039
; WIPE_START
G1 F15000
G1 X108.933 Y107.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.835 Y113.409 Z4.7 F42000
G1 X116.03 Y116.03 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2128
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
G1 X117.714 Y114.6 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.973 Y114.462 I.894 J2.856 E.01455
M73 P92 R2
G3 X117.656 Y114.582 I-.144 J2.823 E.0113
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.595
G1 X116.513 Y114.496 E-.165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.67 E.00211
G3 X119.179 Y116.03 I-1.029 J2.265 E.03118
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
G1 X119.2 Y116.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X119.246 Y116.23 E.00239
G3 X119.2 Y117.711 I-2.343 J.669 E.02446
G1 X119.2 Y116.15 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03498
M73 P92 R1
G1 X119.33 Y116.682 E-.17471
G1 X119.338 Y116.999 E-.12053
G1 X119.292 Y117.383 E-.14693
G1 X119.2 Y117.711 E-.12959
G1 X119.2 Y117.308 E-.15327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.282 J-.982 E.03197
G1 X117.77 Y117.83 E.02189
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
G1 X116.086 Y119.2 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.615 Y119.233 E.00161
G3 X116.143 Y119.219 I-.714 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.5948
G1 X117.615 Y119.233 E-.03758
G1 X117.287 Y119.304 E-.12762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.895 J-2.304 E.03328
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53537
G1 X115.801 Y119.078 E-.09488
G1 X115.508 Y118.902 E-.12975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F2128
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.283 J-.81 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 4.4
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
; layer num/total_layer_count: 44/53
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 116
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z4.7 I.829 J.891 P1  F42000
G1 X124.728 Y107.752 Z4.7
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X125.042 Y107.848 E.00532
G3 X126.08 Y109.392 I-.641 J1.552 E.03202
G1 X126.08 Y124.408 E.24383
G3 X124.408 Y126.08 I-1.679 J-.008 E.04258
G1 X109.392 Y126.08 E.24383
G3 X107.72 Y124.408 I.008 J-1.679 E.04258
G1 X107.72 Y109.392 E.24383
G3 X109.392 Y107.721 I1.679 J.008 E.04258
G1 X124.408 Y107.721 E.24383
G3 X124.669 Y107.742 I-.008 J1.679 E.00426
; WIPE_START
G1 F3600
M204 S6000
G1 X125.042 Y107.848 E-.14712
G1 X125.333 Y108.003 E-.12535
G1 X125.588 Y108.212 E-.12538
G1 X125.797 Y108.467 E-.12536
G1 X125.952 Y108.758 E-.12537
G1 X126.038 Y109.039 E-.11142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.544 Y107.59 Z4.8 F42000
G1 X116.969 Y107.285 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X125.033 Y107.29 E.13095
G3 X126.521 Y108.966 I-.199 J1.675 E.03979
G1 X126.52 Y124.894 E.25865
G3 X124.834 Y126.521 I-1.684 J-.058 E.04205
G1 X108.906 Y126.52 E.25865
G3 X107.279 Y124.835 I.058 J-1.684 E.04205
G1 X107.28 Y108.906 E.25865
G3 X108.906 Y107.28 I1.695 J.069 E.04101
G1 X116.909 Y107.285 E.12996
; WIPE_START
G1 F3600
M204 S6000
G1 X118.909 Y107.286 E-.76
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
G1 X124.668 Y107.513 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0899344
G1 F2139
M204 S6000
G1 X124.885 Y107.534 E.00061
; LINE_WIDTH: 0.129886
G1 X125.004 Y107.557 E.00054
; LINE_WIDTH: 0.162967
G1 X125.265 Y107.637 E.00157
; LINE_WIDTH: 0.219979
G3 X126.142 Y108.488 I-.573 J1.469 E.01015
; LINE_WIDTH: 0.171664
G3 X126.206 Y108.646 I-1.537 J.711 E.00104
G1 X126.233 Y108.746 E.00064
; LINE_WIDTH: 0.128259
G3 X126.274 Y108.97 I-3.029 J.683 E.00099
; LINE_WIDTH: 0.0841401
G1 X126.289 Y109.145 E.00045
M204 S10000
G1 X126.287 Y124.668 F42000
; LINE_WIDTH: 0.0898782
G1 F2139
M204 S6000
G1 X126.266 Y124.885 E.00061
; LINE_WIDTH: 0.142707
G3 X126.206 Y125.158 I-2.834 J-.479 E.00138
; LINE_WIDTH: 0.196241
G3 X126.043 Y125.508 I-2.213 J-.813 E.00276
; LINE_WIDTH: 0.222558
G3 X125.264 Y126.163 I-1.426 J-.906 E.00847
; LINE_WIDTH: 0.162649
G1 X125.001 Y126.244 E.00158
; LINE_WIDTH: 0.121981
G1 X124.829 Y126.275 E.00072
; LINE_WIDTH: 0.0841066
G1 X124.655 Y126.289 E.00045
M204 S10000
G1 X109.132 Y126.287 F42000
; LINE_WIDTH: 0.0899279
G1 F2139
M204 S6000
G1 X108.915 Y126.266 E.00061
; LINE_WIDTH: 0.142561
G3 X108.645 Y126.207 I.788 J-4.271 E.00136
; LINE_WIDTH: 0.196047
G3 X108.291 Y126.044 I.869 J-2.347 E.00278
; LINE_WIDTH: 0.222724
G3 X107.637 Y125.265 I.882 J-1.405 E.00848
; LINE_WIDTH: 0.162816
G1 X107.589 Y125.141 E.00076
G3 X107.555 Y124.995 I2.275 J-.613 E.00086
; LINE_WIDTH: 0.121318
G1 X107.525 Y124.829 E.00068
; LINE_WIDTH: 0.0841087
G1 X107.511 Y124.655 E.00045
M204 S10000
G1 X107.513 Y109.132 F42000
; LINE_WIDTH: 0.0898782
G1 F2139
M204 S6000
G1 X107.534 Y108.915 E.00061
; LINE_WIDTH: 0.133551
G1 X107.567 Y108.75 E.00077
; LINE_WIDTH: 0.166932
G1 X107.637 Y108.535 E.00134
; LINE_WIDTH: 0.222779
G3 X108.292 Y107.757 I1.533 J.625 E.00848
; LINE_WIDTH: 0.195709
G3 X108.642 Y107.594 I1.984 J3.82 E.00274
; LINE_WIDTH: 0.142706
G3 X108.915 Y107.534 I.749 J2.758 E.00138
; LINE_WIDTH: 0.0898877
G1 X109.132 Y107.513 E.00061
; WIPE_START
G1 F15000
G1 X108.915 Y107.534 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.816 Y113.386 Z4.8 F42000
G1 X116.03 Y116.03 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2139
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.338 J.93 E.03326
G1 X116.03 Y115.97 E.0219
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
G1 X117.714 Y114.6 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X116.091 Y114.598 E.02634
G3 X116.97 Y114.461 I.81 J2.318 E.01452
G3 X117.656 Y114.583 I-.235 J3.324 E.01133
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59461
G1 X116.514 Y114.495 E-.16539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.01 J2.247 E.03119
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
G1 X119.2 Y116.087 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X119.217 Y116.136 E.00085
G3 X119.2 Y117.711 I-2.391 J.761 E.02602
G1 X119.2 Y116.147 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.136 E-.00775
G1 X119.309 Y116.512 E-.14699
G1 X119.338 Y116.999 E-.18545
G1 X119.292 Y117.383 E-.14688
G1 X119.2 Y117.711 E-.12958
G1 X119.2 Y117.334 E-.14335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.846 E.00132
G3 X117.77 Y119.178 I-2.251 J-.949 E.032
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53575
G1 X119.149 Y117.846 E-.03084
M73 P93 R1
G1 X118.918 Y118.271 E-.18377
G1 X118.902 Y118.29 E-.00964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.617 Y119.232 E.00158
G3 X116.143 Y119.219 I-.716 J-2.338 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.5948
G1 X117.617 Y119.232 E-.03692
G1 X117.287 Y119.306 E-.12828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.873 J-2.282 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.825 Y119.09 E-.08487
G1 X115.508 Y118.902 E-.13975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2139
M204 S5000
G1 X114.6 Y117.713 E.02635
G3 X114.581 Y116.147 I2.318 J-.811 E.02589
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.713 E-.59519
G1 X114.508 Y117.38 E-.13127
G1 X114.497 Y117.293 E-.03354
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
G3 Z4.8 I.83 J.89 P1  F42000
G1 X124.74 Y107.731 Z4.8
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X125.056 Y107.827 E.00537
G3 X126.101 Y109.382 I-.646 J1.563 E.03226
G1 X126.101 Y124.418 E.24414
G3 X124.418 Y126.101 I-1.692 J-.008 E.04289
G1 X109.382 Y126.101 E.24414
G3 X107.699 Y124.418 I.008 J-1.692 E.04289
G1 X107.699 Y109.382 E.24414
G3 X109.382 Y107.699 I1.692 J.008 E.04289
G1 X124.418 Y107.699 E.24414
G3 X124.681 Y107.72 I-.008 J1.692 E.00429
; WIPE_START
G1 F3600
M204 S6000
G1 X125.056 Y107.827 E-.14818
G1 X125.349 Y107.983 E-.12627
G1 X125.606 Y108.194 E-.12626
G1 X125.817 Y108.451 E-.12631
G1 X125.973 Y108.744 E-.12626
G1 X126.055 Y109.013 E-.10672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.561 Y107.565 Z4.9 F42000
G1 X116.97 Y107.257 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X125.05 Y107.262 E.13121
G3 X126.549 Y108.948 I-.199 J1.686 E.04007
G1 X126.548 Y124.913 E.25923
G3 X124.852 Y126.549 I-1.696 J-.06 E.04231
G1 X108.887 Y126.548 E.25923
G3 X107.251 Y124.852 I.06 J-1.696 E.04231
G1 X107.252 Y108.887 E.25923
G3 X108.887 Y107.252 I1.706 J.071 E.04125
G1 X116.91 Y107.257 E.13027
; WIPE_START
G1 F3600
M204 S6000
G1 X118.91 Y107.258 E-.76
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
G1 X124.614 Y107.484 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0926612
G1 F2150
M204 S6000
G1 X124.903 Y107.51 E.00084
; LINE_WIDTH: 0.137669
G1 X125.019 Y107.532 E.00056
; LINE_WIDTH: 0.171196
G3 X125.171 Y107.569 I-.298 J1.564 E.00095
G1 X125.284 Y107.614 E.00074
; LINE_WIDTH: 0.232008
G3 X126.067 Y108.272 I-.611 J1.52 E.00892
; LINE_WIDTH: 0.204952
G3 X126.228 Y108.62 I-2.969 J1.591 E.00286
; LINE_WIDTH: 0.156835
G3 X126.28 Y108.842 I-2.283 J.653 E.00126
; LINE_WIDTH: 0.123605
G1 X126.299 Y108.953 E.00047
; LINE_WIDTH: 0.087439
G1 X126.317 Y109.199 E.00066
M204 S10000
G1 X126.316 Y124.613 F42000
; LINE_WIDTH: 0.0926532
G1 F2150
M204 S6000
G1 X126.29 Y124.903 E.00084
; LINE_WIDTH: 0.150869
G3 X126.23 Y125.174 I-3.797 J-.692 E.00146
; LINE_WIDTH: 0.205018
G3 X126.067 Y125.528 I-2.343 J-.868 E.00292
; LINE_WIDTH: 0.23176
G3 X125.284 Y126.187 I-1.438 J-.915 E.00891
; LINE_WIDTH: 0.170887
G1 X125.171 Y126.231 E.00074
G3 X125.016 Y126.269 I-.456 J-1.547 E.00097
; LINE_WIDTH: 0.129622
G1 X124.846 Y126.299 E.00076
; LINE_WIDTH: 0.0874043
G1 X124.601 Y126.317 E.00066
M204 S10000
G1 X109.187 Y126.316 F42000
; LINE_WIDTH: 0.0926511
G1 F2150
M204 S6000
G1 X108.897 Y126.29 E.00084
; LINE_WIDTH: 0.150859
G3 X108.626 Y126.23 I.695 J-3.815 E.00146
; LINE_WIDTH: 0.204989
G3 X108.272 Y126.067 I.869 J-2.346 E.00292
; LINE_WIDTH: 0.231941
G3 X107.614 Y125.284 I.886 J-1.414 E.00891
; LINE_WIDTH: 0.171411
G1 X107.564 Y125.157 E.00083
G3 X107.531 Y125.015 I2.243 J-.604 E.00089
; LINE_WIDTH: 0.129467
G1 X107.501 Y124.846 E.00075
; LINE_WIDTH: 0.0874043
G1 X107.483 Y124.601 E.00066
M204 S10000
G1 X107.484 Y109.187 F42000
; LINE_WIDTH: 0.0926532
G1 F2150
M204 S6000
G1 X107.51 Y108.897 E.00084
; LINE_WIDTH: 0.137659
G1 X107.532 Y108.781 E.00056
; LINE_WIDTH: 0.171189
G3 X107.569 Y108.629 I1.564 J.298 E.00095
G1 X107.614 Y108.516 E.00074
; LINE_WIDTH: 0.232034
G3 X108.272 Y107.733 I1.547 J.633 E.00892
; LINE_WIDTH: 0.205078
G3 X108.626 Y107.57 I1.221 J2.179 E.00292
; LINE_WIDTH: 0.150872
G3 X108.897 Y107.51 I.964 J3.747 E.00146
; LINE_WIDTH: 0.0926651
G1 X109.186 Y107.484 E.00084
; WIPE_START
G1 F15000
G1 X108.897 Y107.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.796 Y113.362 Z4.9 F42000
G1 X116.03 Y116.03 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
M204 S5000
G1 X114.621 Y116.03 E.02287
G3 X116.03 Y114.621 I2.31 J.9 E.03329
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53578
G1 X114.789 Y115.678 E-.14829
G1 X114.898 Y115.51 E-.07593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.709 Y114.6 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X116.091 Y114.598 E.02628
G3 X116.968 Y114.461 I.811 J2.32 E.01449
G3 X117.652 Y114.582 I-.129 J2.739 E.01131
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59325
G1 X116.517 Y114.494 E-.16676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.933 J2.297 E.03275
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53569
G1 X117.802 Y114.633 E-.01277
G1 X118.064 Y114.756 E-.10991
G1 X118.291 Y114.897 E-.10164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.088 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X119.223 Y116.155 E.00116
G3 X119.2 Y117.71 I-2.314 J.743 E.0257
G1 X119.2 Y116.148 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X119.223 Y116.155 E-.00922
G1 X119.309 Y116.514 E-.14014
G1 X119.338 Y116.999 E-.18467
G1 X119.292 Y117.383 E-.14687
G1 X119.2 Y117.71 E-.12924
G1 X119.2 Y117.316 E-.14986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.227 J-1.052 E.03043
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
G1 X116.086 Y119.2 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X117.711 Y119.201 E.02638
G3 X116.143 Y119.219 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.59578
G1 X117.315 Y119.304 E-.15545
G1 X117.292 Y119.306 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.865 J-2.275 E.03332
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.736 Y119.045 E-.12248
G1 X115.568 Y118.944 E-.07445
G1 X115.51 Y118.901 E-.02769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X114.6 Y117.712 E.02636
G3 X114.581 Y116.146 I2.361 J-.812 E.02587
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.712 E-.5952
G1 X114.492 Y117.292 E-.1648
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
G3 Z4.9 I.831 J.889 P1  F42000
G1 X124.747 Y107.708 Z4.9
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X124.75 Y107.709 E.00005
G3 X126.123 Y109.373 I-.33 J1.671 E.03793
G1 X126.123 Y124.427 E.24446
G3 X124.427 Y126.123 I-1.704 J-.008 E.04321
G1 X109.373 Y126.123 E.24446
G3 X107.677 Y124.427 I.008 J-1.704 E.04321
G1 X107.677 Y109.373 E.24446
G3 X109.373 Y107.677 I1.704 J.008 E.04321
G1 X124.427 Y107.677 E.24446
G1 X124.688 Y107.702 E.00424
; WIPE_START
G1 F3600
M204 S6000
G1 X124.75 Y107.709 E-.02387
G1 X125.07 Y107.806 E-.12717
G1 X125.366 Y107.963 E-.12717
G1 X125.624 Y108.176 E-.12721
G1 X125.837 Y108.434 E-.12718
G1 X125.994 Y108.73 E-.12717
G1 X126.071 Y108.982 E-.10022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.576 Y107.538 Z5 F42000
G1 X116.97 Y107.229 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X125.069 Y107.234 E.13151
G3 X126.578 Y108.931 I-.201 J1.698 E.04033
G1 X126.576 Y124.932 E.25981
G3 X124.869 Y126.578 I-1.707 J-.062 E.04258
G1 X108.868 Y126.576 E.25981
G3 X107.222 Y124.869 I.062 J-1.707 E.04258
G1 X107.224 Y108.868 E.25981
G3 X108.868 Y107.224 I1.718 J.073 E.04149
G1 X116.91 Y107.229 E.13058
; WIPE_START
G1 F3600
M204 S6000
G1 X118.91 Y107.23 E-.76
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
G1 X124.559 Y107.456 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0856995
G1 F2161
M204 S6000
G1 X124.794 Y107.468 E.00062
; LINE_WIDTH: 0.114134
G1 X124.922 Y107.486 E.00049
; LINE_WIDTH: 0.145881
G1 X125.037 Y107.508 E.00059
; LINE_WIDTH: 0.179699
G3 X125.187 Y107.544 I-.293 J1.535 E.001
G1 X125.304 Y107.59 E.00081
; LINE_WIDTH: 0.241222
G3 X126.09 Y108.253 I-.616 J1.529 E.00936
; LINE_WIDTH: 0.213889
G3 X126.251 Y108.6 I-2.941 J1.579 E.003
; LINE_WIDTH: 0.165196
G3 X126.304 Y108.823 I-2.073 J.608 E.00134
; LINE_WIDTH: 0.131707
G1 X126.323 Y108.936 E.00051
; LINE_WIDTH: 0.0908519
G1 X126.345 Y109.254 E.0009
M204 S10000
G1 X126.344 Y124.559 F42000
; LINE_WIDTH: 0.0860315
G1 F2161
M204 S6000
G1 X126.332 Y124.802 E.00064
; LINE_WIDTH: 0.115208
G1 X126.314 Y124.922 E.00046
; LINE_WIDTH: 0.159488
G3 X126.252 Y125.197 I-3.026 J-.532 E.00159
; LINE_WIDTH: 0.214175
G3 X126.09 Y125.547 I-2.213 J-.815 E.00303
; LINE_WIDTH: 0.240998
G3 X125.303 Y126.21 I-1.443 J-.915 E.00935
; LINE_WIDTH: 0.179403
G1 X125.187 Y126.256 E.0008
G3 X125.034 Y126.293 I-.45 J-1.522 E.00101
; LINE_WIDTH: 0.137635
G1 X124.863 Y126.323 E.00082
; LINE_WIDTH: 0.090818
G1 X124.546 Y126.345 E.0009
M204 S10000
G1 X109.241 Y126.344 F42000
; LINE_WIDTH: 0.0860315
G1 F2161
M204 S6000
G1 X108.998 Y126.332 E.00064
; LINE_WIDTH: 0.115208
G1 X108.878 Y126.314 E.00046
; LINE_WIDTH: 0.159168
G3 X108.606 Y126.254 I.626 J-3.472 E.00156
; LINE_WIDTH: 0.213936
G3 X108.253 Y126.09 I.869 J-2.346 E.00306
; LINE_WIDTH: 0.24117
G3 X107.59 Y125.304 I.891 J-1.422 E.00936
; LINE_WIDTH: 0.184241
G1 X107.519 Y125.088 E.00151
; LINE_WIDTH: 0.157371
G1 X107.496 Y124.981 E.00061
; LINE_WIDTH: 0.123833
G3 X107.468 Y124.802 I4.684 J-.846 E.00076
; LINE_WIDTH: 0.0866887
G1 X107.455 Y124.546 E.00068
M204 S10000
G1 X107.456 Y109.241 F42000
; LINE_WIDTH: 0.0856974
G1 F2161
M204 S6000
G1 X107.468 Y109.006 E.00062
; LINE_WIDTH: 0.114142
G1 X107.486 Y108.878 E.00049
; LINE_WIDTH: 0.145878
G1 X107.508 Y108.763 E.00059
; LINE_WIDTH: 0.179696
G3 X107.544 Y108.613 I1.535 J.293 E.001
G1 X107.59 Y108.496 E.00081
; LINE_WIDTH: 0.241254
G3 X108.253 Y107.71 I1.555 J.637 E.00936
; LINE_WIDTH: 0.214032
G3 X108.606 Y107.546 I1.219 J2.175 E.00306
; LINE_WIDTH: 0.159197
G3 X108.878 Y107.486 I.89 J3.377 E.00156
; LINE_WIDTH: 0.115195
G1 X108.998 Y107.468 E.00046
; LINE_WIDTH: 0.0860253
G1 X109.241 Y107.456 E.00064
; WIPE_START
G1 F15000
G1 X108.998 Y107.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.842 Y113.366 Z5 F42000
G1 X116.03 Y116.03 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2161
M204 S5000
G1 X114.621 Y116.03 E.02287
G3 X116.03 Y114.621 I2.31 J.9 E.0333
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.5358
G1 X114.779 Y115.694 E-.14108
G1 X114.883 Y115.528 E-.07437
G1 X114.897 Y115.51 E-.00875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X116.09 Y114.598 E.02636
G3 X116.965 Y114.461 I.898 J2.87 E.01444
G3 X117.656 Y114.583 I-.228 J3.317 E.01141
; WIPE_START
G1 F3600
M204 S6000
G1 X116.09 Y114.598 E-.59509
G1 X116.512 Y114.496 E-.16491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5 F42000
G1 Z4.6
G1 E.8 F1800
M73 P94 R1
G1 F2161
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.889 Y114.67 E.00209
G3 X119.179 Y116.03 I-.991 J2.23 E.03124
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.889 Y114.67 E-.04881
G1 X118.292 Y114.898 E-.17581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X119.246 Y116.23 E.00238
G3 X119.2 Y117.711 I-2.341 J.669 E.02445
G1 X119.2 Y116.15 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03489
G1 X119.331 Y116.689 E-.17762
G1 X119.338 Y116.999 E-.1177
G1 X119.292 Y117.383 E-.14687
G1 X119.2 Y117.711 E-.12947
G1 X119.2 Y117.307 E-.15345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X119.179 Y117.77 E.02287
G1 X119.149 Y117.845 E.00131
G3 X117.77 Y119.179 I-2.251 J-.948 E.03202
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
G1 X116.087 Y119.2 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X117.711 Y119.201 E.02637
G3 X116.144 Y119.219 I-.81 J-2.332 E.0259
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.59555
G1 X117.318 Y119.304 E-.15452
G1 X117.292 Y119.306 E-.00993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.894 J-2.304 E.03329
G1 X115.97 Y117.77 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53549
G1 X115.737 Y119.045 E-.12241
G1 X115.568 Y118.944 E-.07454
G1 X115.512 Y118.899 E-.02757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2161
M204 S5000
G1 X114.6 Y117.713 E.02637
G3 X114.581 Y116.146 I2.329 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.713 E-.59559
G1 X114.493 Y117.294 E-.16441
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
G3 Z5 I.832 J.888 P1  F42000
G1 X124.758 Y107.686 Z5
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X124.762 Y107.687 E.00008
G3 X126.145 Y109.363 I-.333 J1.683 E.0382
G1 X126.145 Y124.437 E.24478
G3 X124.437 Y126.145 I-1.716 J-.008 E.04352
G1 X109.363 Y126.145 E.24478
G3 X107.655 Y124.437 I.008 J-1.716 E.04352
G1 X107.655 Y109.363 E.24478
G3 X109.363 Y107.655 I1.716 J.008 E.04352
G1 X124.437 Y107.655 E.24478
G1 X124.698 Y107.68 E.00425
; WIPE_START
G1 F3600
M204 S6000
G1 X124.762 Y107.687 E-.02455
G1 X125.085 Y107.785 E-.12807
G1 X125.382 Y107.943 E-.12809
G1 X125.643 Y108.157 E-.12809
G1 X125.857 Y108.418 E-.12808
G1 X126.016 Y108.715 E-.12813
G1 X126.088 Y108.954 E-.09498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.593 Y107.513 Z5.1 F42000
G1 X116.97 Y107.2 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X125.088 Y107.206 E.13181
G3 X126.606 Y108.914 I-.203 J1.709 E.04059
G1 X126.605 Y124.95 E.26039
G3 X124.886 Y126.606 I-1.718 J-.064 E.04284
G1 X108.85 Y126.605 E.26039
G3 X107.194 Y124.886 I.064 J-1.718 E.04284
G1 X107.195 Y108.85 E.26039
G3 X108.85 Y107.195 I1.729 J.075 E.04172
G1 X116.91 Y107.2 E.13088
; WIPE_START
G1 F3600
M204 S6000
G1 X118.91 Y107.202 E-.76
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
G1 X124.505 Y107.428 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0889752
G1 F2171
M204 S6000
G1 X124.807 Y107.443 E.00083
; LINE_WIDTH: 0.1215
G1 X124.94 Y107.462 E.00055
; LINE_WIDTH: 0.154043
G1 X125.055 Y107.483 E.00063
; LINE_WIDTH: 0.188205
G3 X125.203 Y107.52 I-.29 J1.517 E.00104
G1 X125.323 Y107.567 E.00088
; LINE_WIDTH: 0.250444
G3 X126.113 Y108.233 I-.621 J1.537 E.00981
; LINE_WIDTH: 0.222839
G3 X126.275 Y108.581 I-2.914 J1.567 E.00314
; LINE_WIDTH: 0.173544
G3 X126.328 Y108.805 I-1.926 J.578 E.00143
; LINE_WIDTH: 0.13977
G1 X126.348 Y108.919 E.00056
; LINE_WIDTH: 0.0942955
G3 X126.374 Y109.308 I-2.037 J.332 E.00116
M204 S10000
G1 X126.372 Y124.504 F42000
; LINE_WIDTH: 0.0893544
G1 F2171
M204 S6000
G3 X126.357 Y124.815 I-3.09 J0 E.00086
; LINE_WIDTH: 0.122665
G1 X126.338 Y124.94 E.00052
; LINE_WIDTH: 0.167473
G3 X126.277 Y125.213 I-3.18 J-.566 E.00167
; LINE_WIDTH: 0.222897
G3 X126.114 Y125.567 I-2.347 J-.87 E.0032
; LINE_WIDTH: 0.250238
G3 X125.323 Y126.233 I-1.455 J-.924 E.00979
; LINE_WIDTH: 0.19732
G3 X125.167 Y126.291 I-.432 J-.924 E.0012
; LINE_WIDTH: 0.169231
G1 X124.999 Y126.328 E.00104
; LINE_WIDTH: 0.140206
G1 X124.881 Y126.348 E.00058
; LINE_WIDTH: 0.094295
G1 X124.815 Y126.357 E.0002
G3 X124.492 Y126.374 I-.324 J-3.223 E.00096
M204 S10000
G1 X109.296 Y126.372 F42000
; LINE_WIDTH: 0.0893544
G1 F2171
M204 S6000
G3 X108.985 Y126.357 I0 J-3.09 E.00086
; LINE_WIDTH: 0.122674
G1 X108.86 Y126.338 E.00052
; LINE_WIDTH: 0.166665
G3 X108.597 Y126.28 I.55 J-3.14 E.0016
; LINE_WIDTH: 0.212588
G1 X108.583 Y126.276 E.00011
G3 X108.373 Y126.187 I.996 J-2.641 E.00178
; LINE_WIDTH: 0.248394
G3 X107.567 Y125.323 I.69 J-1.452 E.01119
; LINE_WIDTH: 0.192863
G1 X107.495 Y125.107 E.00159
; LINE_WIDTH: 0.16563
G1 X107.472 Y125 E.00064
; LINE_WIDTH: 0.140304
G1 X107.452 Y124.881 E.00058
; LINE_WIDTH: 0.094296
G1 X107.443 Y124.815 E.0002
G3 X107.426 Y124.492 I3.223 J-.324 E.00096
M204 S10000
G1 X107.428 Y109.296 F42000
; LINE_WIDTH: 0.0889833
G1 F2171
M204 S6000
G1 X107.443 Y108.993 E.00083
; LINE_WIDTH: 0.121506
G1 X107.462 Y108.86 E.00055
; LINE_WIDTH: 0.15404
G1 X107.483 Y108.745 E.00063
; LINE_WIDTH: 0.188207
G3 X107.52 Y108.597 I1.516 J.29 E.00104
G1 X107.567 Y108.477 E.00088
; LINE_WIDTH: 0.250369
G3 X108.226 Y107.69 I1.625 J.693 E.00971
G1 X108.233 Y107.686 E.00007
; LINE_WIDTH: 0.222521
G3 X108.587 Y107.523 I2.055 J3.991 E.00319
; LINE_WIDTH: 0.167485
G3 X108.86 Y107.462 I.836 J3.103 E.00167
; LINE_WIDTH: 0.122659
G1 X108.985 Y107.443 E.00052
; LINE_WIDTH: 0.0893528
G3 X109.295 Y107.428 I.314 J3.147 E.00086
; WIPE_START
G1 F15000
G1 X108.985 Y107.443 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.826 Y113.344 Z5.1 F42000
G1 X116.03 Y116.03 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2171
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.271 J.864 E.03332
G1 X116.03 Y115.97 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.779 Y115.694 E-.14104
G1 X114.882 Y115.528 E-.07441
G1 X114.897 Y115.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X116.963 Y114.461 I.899 J2.876 E.01438
G3 X117.656 Y114.582 I-.146 J2.89 E.01146
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59492
G1 X116.513 Y114.496 E-.16508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.007 J2.243 E.03119
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04962
G1 X118.292 Y114.898 E-.175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.087 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X119.217 Y116.136 E.00085
G3 X119.2 Y117.711 I-2.389 J.761 E.02601
G1 X119.2 Y116.147 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.217 Y116.136 E-.00775
G1 X119.322 Y116.607 E-.18348
G1 X119.338 Y116.999 E-.14892
G1 X119.292 Y117.383 E-.14678
G1 X119.2 Y117.711 E-.12951
G1 X119.2 Y117.333 E-.14356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.149 Y117.845 E.00131
G3 X117.77 Y119.178 I-2.255 J-.955 E.032
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
G1 X116.086 Y119.2 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.341 E.02587
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59507
G1 X117.287 Y119.304 E-.16493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.894 J-2.304 E.03328
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.824 Y119.09 E-.08494
G1 X115.569 Y118.945 E-.11152
G1 X115.51 Y118.901 E-.02816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.089 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F2171
M204 S5000
G1 X114.6 Y117.71 E.02632
G3 X114.581 Y116.146 I2.354 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59427
G1 X114.491 Y117.287 E-.16573
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
G3 Z5.1 I.832 J.888 P1  F42000
G1 X124.768 Y107.664 Z5.1
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X124.774 Y107.666 E.00011
G3 X126.167 Y109.353 I-.335 J1.695 E.03848
G1 X126.167 Y124.447 E.24509
G3 X124.447 Y126.167 I-1.728 J-.008 E.04383
G1 X109.353 Y126.167 E.24509
G3 X107.633 Y124.447 I.008 J-1.728 E.04383
G1 X107.633 Y109.353 E.24509
G3 X109.353 Y107.633 I1.728 J.008 E.04383
G1 X124.447 Y107.633 E.24509
G1 X124.708 Y107.658 E.00426
; WIPE_START
G1 F3600
M204 S6000
G1 X124.774 Y107.666 E-.0253
G1 X125.099 Y107.764 E-.12899
M73 P95 R1
G1 X125.399 Y107.924 E-.12898
G1 X125.661 Y108.139 E-.12902
G1 X125.876 Y108.401 E-.12901
G1 X126.037 Y108.701 E-.12898
G1 X126.105 Y108.927 E-.08971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.61 Y107.487 Z5.2 F42000
G1 X116.971 Y107.172 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X125.107 Y107.178 E.13212
G3 X126.634 Y108.898 I-.205 J1.72 E.04085
G1 X126.633 Y124.968 E.26096
G3 X124.902 Y126.634 I-1.73 J-.065 E.04311
G1 X108.832 Y126.633 E.26096
G3 X107.166 Y124.902 I.065 J-1.73 E.04311
G1 X107.167 Y108.832 E.26096
G3 X108.832 Y107.167 I1.741 J.076 E.04197
G1 X116.911 Y107.172 E.13118
; WIPE_START
G1 F3600
M204 S6000
G1 X118.911 Y107.174 E-.76
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
G1 X124.45 Y107.399 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0922618
G1 F2182
M204 S6000
G1 X124.819 Y107.418 E.00107
; LINE_WIDTH: 0.128818
G1 X124.958 Y107.438 E.00061
; LINE_WIDTH: 0.173382
G3 X125.203 Y107.49 I-.42 J2.564 E.00155
; LINE_WIDTH: 0.208876
G1 X125.343 Y107.544 E.00114
; LINE_WIDTH: 0.259682
G3 X126.137 Y108.214 I-.626 J1.546 E.01026
; LINE_WIDTH: 0.231745
G3 X126.298 Y108.561 I-2.884 J1.553 E.00328
; LINE_WIDTH: 0.181917
G3 X126.352 Y108.786 I-1.796 J.551 E.00151
; LINE_WIDTH: 0.14783
G1 X126.372 Y108.903 E.00061
; LINE_WIDTH: 0.122454
G1 X126.382 Y108.972 E.00029
; LINE_WIDTH: 0.093369
G3 X126.402 Y109.363 I-4.042 J.399 E.00115
M204 S10000
G1 X126.401 Y124.45 F42000
; LINE_WIDTH: 0.0926667
G1 F2182
M204 S6000
G3 X126.382 Y124.828 I-3.896 J-.007 E.0011
; LINE_WIDTH: 0.130064
G1 X126.362 Y124.958 E.00058
; LINE_WIDTH: 0.174637
G3 X126.305 Y125.22 I-3.239 J-.571 E.00167
; LINE_WIDTH: 0.221233
G1 X126.301 Y125.233 E.00011
G3 X126.21 Y125.447 I-2.707 J-1.022 E.00189
; LINE_WIDTH: 0.257898
G3 X125.343 Y126.256 I-1.47 J-.705 E.01169
; LINE_WIDTH: 0.208876
G1 X125.204 Y126.31 E.00114
; LINE_WIDTH: 0.179235
G3 X125.019 Y126.352 I-.626 J-2.335 E.00122
; LINE_WIDTH: 0.148467
G1 X124.897 Y126.372 E.00064
; LINE_WIDTH: 0.121192
G1 X124.819 Y126.383 E.00032
; LINE_WIDTH: 0.0929545
G1 X124.437 Y126.402 E.00112
M204 S10000
G1 X109.35 Y126.401 F42000
; LINE_WIDTH: 0.0926667
G1 F2182
M204 S6000
G3 X108.972 Y126.382 I.007 J-3.896 E.0011
; LINE_WIDTH: 0.130061
G1 X108.842 Y126.362 E.00058
; LINE_WIDTH: 0.174636
G3 X108.58 Y126.305 I.572 J-3.241 E.00167
; LINE_WIDTH: 0.221202
G1 X108.567 Y126.301 E.00011
G3 X108.354 Y126.21 I1.019 J-2.702 E.00189
; LINE_WIDTH: 0.257587
G3 X107.543 Y125.342 I.694 J-1.461 E.01169
; LINE_WIDTH: 0.201458
G1 X107.471 Y125.126 E.00168
; LINE_WIDTH: 0.173874
G1 X107.448 Y125.018 E.00068
; LINE_WIDTH: 0.148347
G1 X107.428 Y124.897 E.00063
; LINE_WIDTH: 0.121201
G1 X107.417 Y124.819 E.00032
; LINE_WIDTH: 0.0929545
G1 X107.398 Y124.437 E.00112
M204 S10000
G1 X107.399 Y109.35 F42000
; LINE_WIDTH: 0.0922597
G1 F2182
M204 S6000
G1 X107.418 Y108.981 E.00107
; LINE_WIDTH: 0.128813
G1 X107.438 Y108.842 E.00061
; LINE_WIDTH: 0.173381
G3 X107.49 Y108.597 I2.562 J.42 E.00155
; LINE_WIDTH: 0.208876
G1 X107.544 Y108.457 E.00114
; LINE_WIDTH: 0.257885
G3 X108.354 Y107.59 I1.516 J.604 E.0117
; LINE_WIDTH: 0.221225
G3 X108.567 Y107.499 I1.242 J2.634 E.00189
G1 X108.58 Y107.495 E.00011
; LINE_WIDTH: 0.174638
G3 X108.842 Y107.438 I.834 J3.186 E.00167
; LINE_WIDTH: 0.130075
G1 X108.972 Y107.418 E.00058
; LINE_WIDTH: 0.0926783
G3 X109.35 Y107.399 I.384 J3.87 E.0011
; WIPE_START
G1 F15000
G1 X108.972 Y107.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.81 Y113.322 Z5.2 F42000
G1 X116.03 Y116.03 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2182
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.621 I2.29 J.881 E.03332
G1 X116.03 Y115.97 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.732 Y115.78 E-.10407
G1 X114.883 Y115.528 E-.11147
G1 X114.897 Y115.51 E-.00862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X116.089 Y114.599 E.02639
G3 X116.96 Y114.461 I.858 J2.596 E.01439
G3 X117.656 Y114.582 I-.141 J2.879 E.0115
; WIPE_START
G1 F3600
M204 S6000
G1 X116.089 Y114.599 E-.59581
G1 X116.508 Y114.496 E-.1642
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-.993 J2.23 E.0312
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04965
G1 X118.292 Y114.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.091 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X119.249 Y116.243 E.0026
G3 X119.2 Y117.713 I-2.438 J.654 E.02423
G1 X119.2 Y116.151 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X119.249 Y116.243 E-.03977
G1 X119.331 Y116.695 E-.17431
G1 X119.338 Y116.999 E-.11576
G1 X119.311 Y117.273 E-.10449
G1 X119.2 Y117.713 E-.17256
G1 X119.2 Y117.31 E-.1531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00289
G3 X117.77 Y119.179 I-2.225 J-1.05 E.03043
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
G1 X116.092 Y119.2 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X117.711 Y119.201 E.0263
G3 X116.149 Y119.219 I-.808 J-2.371 E.0258
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.59379
G1 X117.333 Y119.301 E-.14873
G1 X117.287 Y119.305 E-.01749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X116.03 Y119.178 E.02287
G3 X114.621 Y117.77 I.878 J-2.288 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53565
G1 X115.824 Y119.09 E-.085
G1 X115.569 Y118.945 E-.11145
G1 X115.512 Y118.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X114.6 Y117.709 E.02629
G3 X114.581 Y116.147 I2.308 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.709 E-.59381
G1 X114.508 Y117.38 E-.12993
G1 X114.496 Y117.285 E-.03626
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
G3 Z5.2 I.833 J.888 P1  F42000
G1 X124.778 Y107.642 Z5.2
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X124.786 Y107.644 E.00014
G3 X126.189 Y109.343 I-.338 J1.707 E.03875
G1 X126.189 Y124.457 E.24541
G3 X124.457 Y126.189 I-1.74 J-.008 E.04414
G1 X109.343 Y126.189 E.24541
G3 X107.611 Y124.457 I.008 J-1.74 E.04414
G1 X107.611 Y109.343 E.24541
G3 X109.343 Y107.611 I1.74 J.008 E.04414
G1 X124.457 Y107.611 E.24541
G1 X124.718 Y107.637 E.00427
; WIPE_START
G1 F3600
M204 S6000
G1 X124.786 Y107.644 E-.02612
G1 X125.114 Y107.742 E-.12989
G1 X125.415 Y107.904 E-.12991
G1 X125.679 Y108.121 E-.12992
G1 X125.896 Y108.385 E-.12992
G1 X126.058 Y108.686 E-.1299
G1 X126.122 Y108.899 E-.08435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.626 Y107.461 Z5.3 F42000
G1 X116.971 Y107.144 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X125.126 Y107.149 E.13242
G3 X126.663 Y108.881 I-.206 J1.731 E.04111
G1 X126.661 Y124.987 E.26154
G3 X124.919 Y126.663 I-1.741 J-.067 E.04337
G1 X108.813 Y126.661 E.26154
G3 X107.137 Y124.919 I.067 J-1.741 E.04337
G1 X107.139 Y108.813 E.26154
G3 X108.813 Y107.139 I1.752 J.078 E.04221
G1 X116.911 Y107.144 E.13149
; WIPE_START
G1 F3600
M204 S6000
G1 X118.911 Y107.145 E-.76
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
G1 X118.911 Y107.375 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0807507
G1 F2813
M204 S6000
G1 X124.467 Y107.375 E.01342
G1 X124.832 Y107.393 E.00088
; LINE_WIDTH: 0.136225
G1 X124.976 Y107.414 E.00068
; LINE_WIDTH: 0.181382
G3 X125.219 Y107.466 I-.415 J2.532 E.00162
; LINE_WIDTH: 0.217219
G3 X125.361 Y107.52 I-.273 J.928 E.00122
; LINE_WIDTH: 0.26597
G3 X126.258 Y108.387 I-.596 J1.512 E.01275
; LINE_WIDTH: 0.224532
G3 X126.329 Y108.564 I-1.722 J.794 E.00158
; LINE_WIDTH: 0.188064
G3 X126.376 Y108.767 I-1.897 J.552 E.00141
; LINE_WIDTH: 0.155915
G1 X126.396 Y108.886 E.00066
; LINE_WIDTH: 0.129727
G1 X126.407 Y108.959 E.00033
; LINE_WIDTH: 0.0814524
G3 X126.426 Y109.33 I-3.695 J.372 E.00091
G1 X126.425 Y124.467 E.037
G1 X126.407 Y124.832 E.00089
; LINE_WIDTH: 0.136219
G1 X126.386 Y124.976 E.00068
; LINE_WIDTH: 0.181381
G3 X126.334 Y125.219 I-2.53 J-.414 E.00162
; LINE_WIDTH: 0.217326
G3 X126.28 Y125.362 I-.934 J-.274 E.00123
; LINE_WIDTH: 0.264747
G3 X125.362 Y126.28 I-1.529 J-.611 E.01322
; LINE_WIDTH: 0.218313
G1 X125.236 Y126.329 E.00109
; LINE_WIDTH: 0.193172
G1 X125.089 Y126.365 E.00106
; LINE_WIDTH: 0.161674
G1 X124.914 Y126.396 E.00102
; LINE_WIDTH: 0.129647
G1 X124.841 Y126.407 E.00032
; LINE_WIDTH: 0.0814524
G3 X124.47 Y126.426 I-.372 J-3.695 E.00091
G1 X109.333 Y126.425 E.037
G1 X108.968 Y126.407 E.00089
; LINE_WIDTH: 0.136219
G1 X108.824 Y126.386 E.00068
; LINE_WIDTH: 0.181377
G3 X108.581 Y126.335 I.415 J-2.534 E.00162
; LINE_WIDTH: 0.217305
G3 X108.438 Y126.28 I.272 J-.928 E.00122
; LINE_WIDTH: 0.268919
G3 X107.64 Y125.605 I.662 J-1.592 E.0107
; LINE_WIDTH: 0.240409
G3 X107.477 Y125.255 I3.65 J-1.909 E.00344
; LINE_WIDTH: 0.195007
G3 X107.435 Y125.091 I1.707 J-.527 E.0012
; LINE_WIDTH: 0.161798
G1 X107.404 Y124.914 E.00103
; LINE_WIDTH: 0.129647
G1 X107.393 Y124.841 E.00032
; LINE_WIDTH: 0.0810688
G3 X107.374 Y124.47 I3.695 J-.372 E.0009
G1 X107.375 Y109.33 E.03677
; LINE_WIDTH: 0.0978716
G1 X107.393 Y108.968 E.00113
; LINE_WIDTH: 0.136219
G1 X107.414 Y108.824 E.00068
; LINE_WIDTH: 0.181381
G3 X107.466 Y108.581 I2.53 J.414 E.00162
; LINE_WIDTH: 0.217326
G3 X107.52 Y108.438 I.934 J.274 E.00123
; LINE_WIDTH: 0.264725
G3 X108.438 Y107.52 I1.529 J.611 E.01323
; LINE_WIDTH: 0.219345
G3 X108.564 Y107.47 I.554 J1.222 E.00109
; LINE_WIDTH: 0.182693
G3 X108.824 Y107.414 I.815 J3.099 E.00175
; LINE_WIDTH: 0.137569
G1 X108.959 Y107.394 E.00065
; LINE_WIDTH: 0.0807507
G3 X109.33 Y107.375 I.375 J3.754 E.0009
G1 X118.851 Y107.375 E.023
; WIPE_START
G1 F15000
G1 X120.851 Y107.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.137 Y114.043 Z5.3 F42000
G1 X116.03 Y116.03 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2813
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.336 J.927 E.03326
G1 X116.03 Y115.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53559
G1 X114.827 Y115.613 E-.17677
G1 X114.898 Y115.509 E-.04764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.708 Y114.6 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X116.091 Y114.598 E.02626
G3 X117.144 Y114.472 I.854 J2.681 E.01732
G3 X117.651 Y114.583 I-.607 J3.995 E.00843
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.5926
G1 X116.52 Y114.494 E-.16741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X117.77 Y114.622 E.02287
G1 X117.802 Y114.633 E.00055
G3 X119.179 Y116.03 I-.916 J2.279 E.03277
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53565
G1 X117.802 Y114.633 E-.01286
G1 X117.985 Y114.715 E-.07638
G1 X118.291 Y114.897 E-.1351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X119.246 Y116.23 E.00239
G3 X119.2 Y117.71 I-2.426 J.666 E.02442
G1 X119.2 Y116.15 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03489
G1 X119.331 Y116.697 E-.1805
G1 X119.338 Y116.999 E-.11483
G1 X119.311 Y117.275 E-.10543
G1 X119.2 Y117.71 E-.17067
G1 X119.2 Y117.306 E-.15368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.276 J-1.107 E.03038
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.178 Y117.77 E-.53559
M73 P96 R1
G1 X119.11 Y117.934 E-.06748
G1 X118.899 Y118.289 E-.15693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z5.3 F42000
M73 P96 R0
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.617 Y119.232 E.00157
G3 X116.143 Y119.219 I-.716 J-2.342 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59479
G1 X117.617 Y119.232 E-.03685
G1 X117.287 Y119.306 E-.12836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.874 J-2.284 E.03331
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.815 Y119.085 E-.08911
G1 X115.508 Y118.902 E-.13552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2813
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.317 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59417
G1 X114.491 Y117.287 E-.16583
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
G3 Z5.3 I.833 J.887 P1  F42000
G1 X124.788 Y107.62 Z5.3
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X124.799 Y107.622 E.00018
G3 X126.211 Y109.334 I-.34 J1.719 E.03902
G1 X126.211 Y124.466 E.24573
G3 X124.466 Y126.211 I-1.753 J-.008 E.04445
G1 X109.334 Y126.211 E.24573
G3 X107.589 Y124.466 I.008 J-1.753 E.04445
G1 X107.589 Y109.334 E.24573
G3 X109.334 Y107.589 I1.753 J.008 E.04445
G1 X124.466 Y107.589 E.24573
G1 X124.728 Y107.615 E.00427
; WIPE_START
G1 F3600
M204 S6000
G1 X124.799 Y107.622 E-.02701
G1 X125.128 Y107.721 E-.1308
G1 X125.432 Y107.884 E-.13083
G1 X125.698 Y108.102 E-.13081
G1 X125.916 Y108.368 E-.13082
G1 X126.079 Y108.672 E-.13082
G1 X126.139 Y108.871 E-.0789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.642 Y107.436 Z5.4 F42000
G1 X116.971 Y107.116 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X125.144 Y107.121 E.13272
G3 X126.691 Y108.864 I-.208 J1.742 E.04137
G1 X126.69 Y125.006 E.26211
G3 X124.936 Y126.691 I-1.752 J-.068 E.04363
G1 X108.794 Y126.69 E.26211
G3 X107.109 Y124.936 I.068 J-1.752 E.04364
G1 X107.11 Y108.795 E.26211
G3 X108.794 Y107.11 I1.764 J.08 E.04244
G1 X116.911 Y107.116 E.1318
; WIPE_START
G1 F3600
M204 S6000
G1 X118.911 Y107.117 E-.76
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
G1 X118.911 Y107.35 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0870822
G1 F2819
M204 S6000
G1 X124.477 Y107.35 E.01488
G1 X124.844 Y107.368 E.00098
; LINE_WIDTH: 0.143589
G1 X124.995 Y107.389 E.00076
; LINE_WIDTH: 0.189341
G3 X125.235 Y107.441 I-.411 J2.505 E.00168
; LINE_WIDTH: 0.225763
G3 X125.382 Y107.497 I-.288 J.979 E.00131
; LINE_WIDTH: 0.275188
G3 X126.281 Y108.367 I-.601 J1.521 E.01328
; LINE_WIDTH: 0.233153
G3 X126.353 Y108.548 I-1.761 J.811 E.00168
; LINE_WIDTH: 0.196159
G3 X126.4 Y108.748 I-1.839 J.537 E.00147
; LINE_WIDTH: 0.163955
G1 X126.421 Y108.869 E.00071
; LINE_WIDTH: 0.136993
G1 X126.432 Y108.946 E.00036
; LINE_WIDTH: 0.0878026
G3 X126.451 Y109.32 I-3.844 J.382 E.00101
G1 X126.45 Y124.477 E.04097
G1 X126.432 Y124.844 E.00099
; LINE_WIDTH: 0.143589
G1 X126.411 Y124.995 E.00076
; LINE_WIDTH: 0.189354
G3 X126.359 Y125.235 I-2.506 J-.411 E.00168
; LINE_WIDTH: 0.225758
G3 X126.303 Y125.382 I-.984 J-.29 E.00131
; LINE_WIDTH: 0.276355
G3 X125.49 Y126.255 I-1.533 J-.613 E.01268
; LINE_WIDTH: 0.23816
G3 X125.252 Y126.354 I-1.139 J-2.394 E.00227
; LINE_WIDTH: 0.201226
G1 X125.108 Y126.389 E.00109
; LINE_WIDTH: 0.169655
G1 X124.93 Y126.421 E.00109
; LINE_WIDTH: 0.136913
G1 X124.854 Y126.432 E.00036
; LINE_WIDTH: 0.0878026
G3 X124.48 Y126.451 I-.382 J-3.844 E.00101
G1 X109.323 Y126.45 E.04097
G1 X108.956 Y126.432 E.00099
; LINE_WIDTH: 0.143584
G1 X108.805 Y126.411 E.00076
; LINE_WIDTH: 0.189342
G3 X108.565 Y126.359 I.412 J-2.512 E.00168
; LINE_WIDTH: 0.225755
G3 X108.418 Y126.303 I.29 J-.984 E.00131
; LINE_WIDTH: 0.278055
G3 X107.616 Y125.625 I.656 J-1.59 E.01116
; LINE_WIDTH: 0.249589
G3 X107.454 Y125.275 I3.889 J-2.012 E.00359
; LINE_WIDTH: 0.198937
G3 X107.4 Y125.056 I1.667 J-.524 E.00163
; LINE_WIDTH: 0.1645
G1 X107.379 Y124.931 E.00074
; LINE_WIDTH: 0.136993
G1 X107.368 Y124.854 E.00036
; LINE_WIDTH: 0.0874148
G3 X107.349 Y124.48 I3.844 J-.382 E.00101
G1 X107.35 Y109.32 E.04074
; LINE_WIDTH: 0.104319
G1 X107.368 Y108.956 E.00123
; LINE_WIDTH: 0.143589
G1 X107.389 Y108.805 E.00076
; LINE_WIDTH: 0.189341
G3 X107.441 Y108.565 I2.504 J.411 E.00168
; LINE_WIDTH: 0.225757
G3 X107.497 Y108.418 I.978 J.288 E.00131
; LINE_WIDTH: 0.273883
G3 X108.419 Y107.496 I1.537 J.615 E.01378
; LINE_WIDTH: 0.227878
G3 X108.548 Y107.446 I.573 J1.27 E.00116
; LINE_WIDTH: 0.190719
G3 X108.805 Y107.389 I.799 J3.03 E.00182
; LINE_WIDTH: 0.145022
G1 X108.946 Y107.369 E.00072
; LINE_WIDTH: 0.0870822
G3 X109.32 Y107.35 I.38 J3.818 E.001
G1 X118.851 Y107.35 E.02548
; WIPE_START
G1 F15000
G1 X120.851 Y107.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.145 Y114.022 Z5.4 F42000
G1 X116.03 Y116.03 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2819
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.621 I2.335 J.925 E.03326
G1 X116.03 Y115.97 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.53565
G1 X114.829 Y115.611 E-.17764
G1 X114.898 Y115.509 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X116.091 Y114.598 E.02635
G3 X117.144 Y114.472 I.854 J2.68 E.01733
G3 X117.657 Y114.581 I-.26 J2.493 E.00852
; WIPE_START
G1 F3600
M204 S6000
G1 X116.091 Y114.598 E-.59505
G1 X116.513 Y114.496 E-.16495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
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
G1 X119.2 Y116.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X119.246 Y116.23 E.00238
G3 X119.2 Y117.71 I-2.426 J.666 E.02442
G1 X119.2 Y116.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03487
G1 X119.332 Y116.708 E-.18487
G1 X119.338 Y116.999 E-.11048
G1 X119.31 Y117.278 E-.10641
G1 X119.2 Y117.71 E-.16966
G1 X119.2 Y117.306 E-.15371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X119.178 Y117.77 E.02287
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.179 I-2.248 J-1.075 E.03041
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
G1 X116.086 Y119.2 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X117.711 Y119.201 E.02638
G3 X116.143 Y119.219 I-.811 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.711 Y119.201 E-.5958
G1 X117.325 Y119.302 E-.15142
G1 X117.292 Y119.305 E-.01279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.273 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53543
G1 X115.652 Y118.997 E-.15917
G1 X115.508 Y118.903 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2819
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.146 I2.315 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59416
G1 X114.491 Y117.287 E-.16584
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
G3 Z5.4 I.834 J.887 P1  F42000
G1 X124.797 Y107.598 Z5.4
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X124.811 Y107.6 E.00022
G3 X126.233 Y109.324 I-.342 J1.731 E.03929
G1 X126.233 Y124.476 E.24604
G3 X124.476 Y126.233 I-1.765 J-.008 E.04476
G1 X109.324 Y126.233 E.24604
G3 X107.567 Y124.476 I.008 J-1.765 E.04476
G1 X107.567 Y109.324 E.24604
G3 X109.324 Y107.567 I1.765 J.008 E.04476
G1 X124.476 Y107.567 E.24604
G1 X124.737 Y107.593 E.00426
; WIPE_START
G1 F3600
M204 S6000
G1 X124.811 Y107.6 E-.02799
G1 X125.143 Y107.7 E-.13171
G1 X125.448 Y107.864 E-.13172
G1 X125.716 Y108.084 E-.13173
G1 X125.936 Y108.352 E-.13175
G1 X126.1 Y108.657 E-.13171
G1 X126.156 Y108.842 E-.07339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.659 Y107.41 Z5.5 F42000
G1 X116.971 Y107.088 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X125.163 Y107.093 E.13302
G3 X126.719 Y108.847 I-.207 J1.75 E.04165
G1 X126.718 Y125.024 E.26268
G3 X124.953 Y126.719 I-1.764 J-.07 E.0439
G1 X108.776 Y126.718 E.26268
G3 X107.081 Y124.953 I.07 J-1.764 E.0439
G1 X107.082 Y108.776 E.26268
G3 X108.776 Y107.082 I1.775 J.081 E.04269
G1 X116.911 Y107.088 E.1321
; WIPE_START
G1 F3600
M204 S6000
G1 X118.911 Y107.089 E-.76
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
G1 X118.911 Y107.325 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.093414
G1 F2825
M204 S6000
G1 X124.486 Y107.325 E.01634
G1 X124.857 Y107.343 E.00109
; LINE_WIDTH: 0.15092
G1 X125.013 Y107.365 E.00083
; LINE_WIDTH: 0.197266
G3 X125.25 Y107.416 I-.407 J2.481 E.00174
; LINE_WIDTH: 0.234187
G3 X125.401 Y107.473 I-.305 J1.032 E.0014
; LINE_WIDTH: 0.284394
G3 X126.304 Y108.347 I-.616 J1.54 E.0138
; LINE_WIDTH: 0.241716
G3 X126.378 Y108.532 I-1.793 J.825 E.00178
; LINE_WIDTH: 0.204247
G3 X126.425 Y108.73 I-1.779 J.522 E.00152
; LINE_WIDTH: 0.172026
G1 X126.445 Y108.852 E.00076
; LINE_WIDTH: 0.144269
G1 X126.457 Y108.933 E.00041
; LINE_WIDTH: 0.0941532
G3 X126.476 Y109.31 I-3.837 J.383 E.00112
G1 X126.476 Y124.486 E.04495
G1 X126.457 Y124.857 E.0011
; LINE_WIDTH: 0.150927
G1 X126.435 Y125.013 E.00083
; LINE_WIDTH: 0.197261
G3 X126.384 Y125.25 I-2.484 J-.407 E.00174
; LINE_WIDTH: 0.234187
G3 X126.327 Y125.401 I-1.032 J-.305 E.0014
; LINE_WIDTH: 0.285519
G3 X125.507 Y126.279 I-1.541 J-.617 E.01322
; LINE_WIDTH: 0.246569
G3 X125.269 Y126.379 I-1.149 J-2.42 E.00237
; LINE_WIDTH: 0.20927
G1 X125.126 Y126.414 E.00113
; LINE_WIDTH: 0.177618
G1 X124.947 Y126.445 E.00115
; LINE_WIDTH: 0.144189
G1 X124.867 Y126.457 E.0004
; LINE_WIDTH: 0.0941532
G3 X124.49 Y126.476 I-.383 J-3.837 E.00112
G1 X109.314 Y126.476 E.04495
G1 X108.943 Y126.457 E.0011
; LINE_WIDTH: 0.150935
G1 X108.787 Y126.435 E.00083
; LINE_WIDTH: 0.197274
G3 X108.55 Y126.384 I.408 J-2.486 E.00174
; LINE_WIDTH: 0.234152
G3 X108.399 Y126.327 I.306 J-1.033 E.0014
; LINE_WIDTH: 0.287397
G3 X107.593 Y125.644 I.661 J-1.598 E.01163
; LINE_WIDTH: 0.259023
G3 X107.43 Y125.294 I2.133 J-1.201 E.00374
; LINE_WIDTH: 0.207324
G3 X107.376 Y125.074 I1.584 J-.508 E.00172
; LINE_WIDTH: 0.17256
G1 X107.355 Y124.948 E.00079
; LINE_WIDTH: 0.144279
G1 X107.343 Y124.867 E.00041
; LINE_WIDTH: 0.0937608
G3 X107.324 Y124.49 I3.837 J-.383 E.00111
G1 X107.325 Y109.31 E.04472
; LINE_WIDTH: 0.110776
G1 X107.343 Y108.943 E.00134
; LINE_WIDTH: 0.150927
G1 X107.365 Y108.787 E.00083
; LINE_WIDTH: 0.197261
G3 X107.416 Y108.55 I2.484 J.407 E.00174
; LINE_WIDTH: 0.234187
G3 X107.473 Y108.399 I1.032 J.305 E.0014
; LINE_WIDTH: 0.283063
G3 X108.4 Y107.473 I1.545 J.62 E.01434
; LINE_WIDTH: 0.236446
G3 X108.531 Y107.421 I.582 J1.291 E.00124
; LINE_WIDTH: 0.198707
G3 X108.787 Y107.365 I.783 J2.956 E.00189
; LINE_WIDTH: 0.152466
G1 X108.933 Y107.344 E.00079
; LINE_WIDTH: 0.093414
G3 X109.31 Y107.325 I.381 J3.803 E.00111
G1 X118.851 Y107.325 E.02797
; WIPE_START
G1 F15000
G1 X120.851 Y107.325 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.154 Y114.001 Z5.5 F42000
G1 X116.03 Y116.03 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2825
M204 S5000
G1 X114.622 Y116.03 E.02287
G3 X116.03 Y114.622 I2.272 J.864 E.03332
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.622 Y116.03 E-.5357
G1 X114.779 Y115.694 E-.14093
G1 X114.883 Y115.527 E-.07465
G1 X114.897 Y115.51 E-.00872
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X116.092 Y114.6 E.02633
G3 X117.144 Y114.472 I.851 J2.611 E.01732
G3 X117.657 Y114.581 I-.318 J2.756 E.00852
; WIPE_START
G1 F3600
M204 S6000
G1 X116.092 Y114.6 E-.59462
G1 X116.371 Y114.518 E-.11023
G1 X116.513 Y114.492 E-.05515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.008 J2.245 E.0312
G1 X117.83 Y116.03 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53542
G1 X117.891 Y114.671 E-.0496
G1 X118.291 Y114.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X119.246 Y116.23 E.00238
G3 X119.2 Y117.71 I-2.424 J.666 E.02441
G1 X119.2 Y116.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03488
G1 X119.332 Y116.702 E-.18243
G1 X119.338 Y116.999 E-.11292
G1 X119.31 Y117.28 E-.10737
G1 X119.2 Y117.71 E-.16853
G1 X119.2 Y117.305 E-.15387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.219 J-1.047 E.03042
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
G1 X116.086 Y119.2 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X117.709 Y119.202 E.02635
G3 X116.143 Y119.219 I-.809 J-2.307 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X117.709 Y119.202 E-.59513
G1 X117.328 Y119.302 E-.14977
G1 X117.288 Y119.305 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.863 J-2.272 E.03332
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.658 Y119 E-.15679
G1 X115.508 Y118.903 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2825
M204 S5000
G1 X114.6 Y117.71 E.02631
G3 X114.581 Y116.147 I2.31 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59409
G1 X114.508 Y117.38 E-.13018
G1 X114.497 Y117.287 E-.03572
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
G3 Z5.5 I.834 J.886 P1  F42000
G1 X124.807 Y107.576 Z5.5
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X124.823 Y107.579 E.00027
G3 X126.255 Y109.314 I-.345 J1.743 E.03956
G1 X126.255 Y124.486 E.24636
G3 X124.486 Y126.255 I-1.777 J-.008 E.04507
G1 X109.314 Y126.255 E.24636
G3 X107.545 Y124.486 I.008 J-1.777 E.04507
G1 X107.545 Y109.314 E.24636
G3 X109.314 Y107.545 I1.777 J.008 E.04507
G1 X124.486 Y107.545 E.24636
G1 X124.747 Y107.571 E.00426
; WIPE_START
G1 F3600
M204 S6000
G1 X124.823 Y107.579 E-.02905
G1 X125.157 Y107.679 E-.13261
G1 X125.465 Y107.844 E-.13265
G1 X125.735 Y108.065 E-.13264
G1 X125.956 Y108.335 E-.13265
G1 X126.121 Y108.643 E-.13257
G1 X126.172 Y108.814 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.675 Y107.384 Z5.6 F42000
G1 X116.972 Y107.059 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X125.184 Y107.065 E.13335
G3 X126.748 Y108.83 I-.214 J1.764 E.04186
G1 X126.746 Y125.042 E.26326
G3 X124.97 Y126.748 I-1.775 J-.071 E.04417
G1 X108.758 Y126.746 E.26326
G3 X107.052 Y124.97 I.071 J-1.775 E.04416
G1 X107.054 Y108.758 E.26326
G3 X108.758 Y107.054 I1.786 J.083 E.04293
G1 X116.912 Y107.059 E.13241
; WIPE_START
G1 F3600
M204 S6000
G1 X118.912 Y107.061 E-.76
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
G1 X118.912 Y107.299 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0997466
G1 F2831
M204 S6000
G1 X124.496 Y107.299 E.01781
G1 X124.869 Y107.318 E.00119
; LINE_WIDTH: 0.158308
G1 X125.031 Y107.341 E.00091
; LINE_WIDTH: 0.205303
G3 X125.266 Y107.391 I-.38 J2.348 E.0018
; LINE_WIDTH: 0.242571
G3 X125.421 Y107.45 I-.345 J1.148 E.0015
; LINE_WIDTH: 0.293605
G3 X126.327 Y108.328 I-.621 J1.549 E.01434
; LINE_WIDTH: 0.250307
G3 X126.403 Y108.515 I-1.831 J.842 E.00189
; LINE_WIDTH: 0.212399
G3 X126.449 Y108.711 I-1.713 J.506 E.00157
; LINE_WIDTH: 0.180115
G1 X126.47 Y108.835 E.00082
; LINE_WIDTH: 0.151584
G1 X126.482 Y108.919 E.00045
; LINE_WIDTH: 0.100504
G3 X126.501 Y109.3 I-3.829 J.385 E.00123
G1 X126.501 Y124.496 E.04894
G1 X126.482 Y124.869 E.0012
; LINE_WIDTH: 0.158308
G1 X126.459 Y125.031 E.00091
; LINE_WIDTH: 0.205293
G3 X126.409 Y125.266 I-2.347 J-.38 E.0018
; LINE_WIDTH: 0.242563
G3 X126.35 Y125.421 I-1.148 J-.346 E.0015
; LINE_WIDTH: 0.29665
G3 X125.664 Y126.231 I-1.607 J-.665 E.01209
; LINE_WIDTH: 0.267957
G3 X125.314 Y126.393 I-1.197 J-2.125 E.00388
; LINE_WIDTH: 0.215751
G3 X125.093 Y126.448 I-.495 J-1.52 E.0018
; LINE_WIDTH: 0.180645
G1 X124.965 Y126.47 E.00085
; LINE_WIDTH: 0.151574
G1 X124.881 Y126.482 E.00045
; LINE_WIDTH: 0.100504
G3 X124.5 Y126.501 I-.385 J-3.829 E.00123
G1 X109.304 Y126.501 E.04894
G1 X108.931 Y126.482 E.0012
; LINE_WIDTH: 0.158318
G1 X108.769 Y126.459 E.00091
; LINE_WIDTH: 0.205248
G3 X108.534 Y126.409 I.403 J-2.459 E.0018
; LINE_WIDTH: 0.242614
G3 X108.379 Y126.35 I.32 J-1.078 E.0015
; LINE_WIDTH: 0.296635
G3 X107.569 Y125.664 I.666 J-1.607 E.0121
; LINE_WIDTH: 0.267975
G3 X107.407 Y125.314 I2.12 J-1.195 E.00388
; LINE_WIDTH: 0.215734
G3 X107.352 Y125.093 I1.515 J-.494 E.0018
; LINE_WIDTH: 0.180657
G1 X107.331 Y124.965 E.00084
; LINE_WIDTH: 0.151604
G1 X107.318 Y124.881 E.00045
; LINE_WIDTH: 0.100107
G3 X107.299 Y124.5 I3.829 J-.385 E.00122
G1 X107.299 Y109.3 E.04871
; LINE_WIDTH: 0.117224
G1 X107.318 Y108.931 E.00144
; LINE_WIDTH: 0.158308
G1 X107.341 Y108.769 E.00091
; LINE_WIDTH: 0.205298
G3 X107.391 Y108.534 I2.351 J.381 E.0018
; LINE_WIDTH: 0.242556
G3 X107.45 Y108.379 I1.15 J.346 E.0015
; LINE_WIDTH: 0.292261
G3 X108.38 Y107.45 I1.553 J.624 E.01491
; LINE_WIDTH: 0.244943
G3 X108.515 Y107.397 I.619 J1.386 E.00132
; LINE_WIDTH: 0.206803
G3 X108.769 Y107.341 I.732 J2.721 E.00196
; LINE_WIDTH: 0.159952
G1 X108.92 Y107.319 E.00086
; LINE_WIDTH: 0.0997466
G3 X109.3 Y107.3 I.383 J3.797 E.00122
G1 X118.852 Y107.299 E.03047
; WIPE_START
G1 F15000
G1 X120.852 Y107.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.162 Y113.981 Z5.6 F42000
G1 X116.03 Y116.03 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2831
M204 S5000
G1 X114.623 Y116.03 E.02285
G3 X116.03 Y114.622 I2.333 J.924 E.03324
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.623 Y116.03 E-.53526
G1 X114.734 Y115.778 E-.1048
G1 X114.883 Y115.528 E-.11051
G1 X114.898 Y115.509 E-.00943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X116.092 Y114.6 E.02634
G3 X117.144 Y114.472 I.809 J2.268 E.01736
G3 X117.657 Y114.581 I-.257 J2.479 E.00852
; WIPE_START
G1 F3600
M204 S6000
G1 X116.092 Y114.6 E-.59479
G1 X116.278 Y114.541 E-.07423
G1 X116.513 Y114.493 E-.09098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.065 J2.299 E.03114
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.04955
G1 X118.292 Y114.899 E-.17507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X119.247 Y116.233 E.00244
G3 X119.2 Y117.71 I-2.506 J.659 E.02432
G1 X119.2 Y116.15 E.02532
; WIPE_START
G1 F3600
M204 S6000
G1 X119.247 Y116.233 E-.03622
G1 X119.332 Y116.704 E-.18191
G1 X119.338 Y116.997 E-.1112
G1 X119.309 Y117.288 E-.11118
G1 X119.2 Y117.71 E-.16545
G1 X119.2 Y117.304 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X119.177 Y117.77 E.02285
G1 X119.149 Y117.847 E.00133
G3 X117.77 Y119.178 I-2.261 J-.961 E.03197
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.177 Y117.77 E-.53532
G1 X119.149 Y117.847 E-.03116
G1 X118.917 Y118.272 E-.18406
G1 X118.901 Y118.291 E-.00945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X117.708 Y119.2 E.02634
M73 P98 R0
G1 X117.615 Y119.233 E.00161
G3 X116.143 Y119.219 I-.714 J-2.371 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.59478
G1 X117.615 Y119.233 E-.03761
G1 X117.335 Y119.301 E-.10968
G1 X117.287 Y119.305 E-.01793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.875 J-2.285 E.0333
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.821 Y119.088 E-.0863
G1 X115.508 Y118.902 E-.13832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2831
M204 S5000
G1 X114.6 Y117.71 E.02629
G3 X114.581 Y116.147 I2.306 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59376
G1 X114.508 Y117.38 E-.13011
G1 X114.497 Y117.286 E-.03614
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
G3 Z5.6 I.835 J.885 P1  F42000
G1 X124.816 Y107.554 Z5.6
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X124.835 Y107.557 E.00032
G3 X126.277 Y109.304 I-.347 J1.755 E.03984
G1 X126.277 Y124.496 E.24668
G3 X124.496 Y126.277 I-1.789 J-.008 E.04538
G1 X109.304 Y126.277 E.24668
G3 X107.523 Y124.496 I.008 J-1.789 E.04538
G1 X107.523 Y109.304 E.24668
G3 X109.304 Y107.523 I1.789 J.008 E.04538
G1 X124.496 Y107.523 E.24668
G1 X124.756 Y107.549 E.00425
; WIPE_START
G1 F3600
M204 S6000
G1 X124.835 Y107.557 E-.03019
G1 X125.171 Y107.658 E-.13354
G1 X125.481 Y107.824 E-.13353
G1 X125.753 Y108.047 E-.13356
G1 X125.976 Y108.319 E-.13356
G1 X126.142 Y108.629 E-.13353
G1 X126.189 Y108.785 E-.06209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.691 Y107.358 Z5.7 F42000
G1 X116.972 Y107.031 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X125.201 Y107.037 E.13362
G3 X126.776 Y108.813 I-.214 J1.776 E.04215
G1 X126.774 Y125.061 E.26384
G3 X124.987 Y126.776 I-1.787 J-.073 E.04443
G1 X108.739 Y126.774 E.26384
G3 X107.024 Y124.987 I.073 J-1.787 E.04443
G1 X107.026 Y108.739 E.26384
G3 X108.739 Y107.026 I1.798 J.084 E.04317
G1 X116.912 Y107.031 E.13271
; WIPE_START
G1 F3600
M204 S6000
G1 X118.912 Y107.032 E-.76
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
G1 X118.912 Y107.274 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106078
G1 F2836
M204 S6000
G1 X124.506 Y107.274 E.01929
G1 X124.882 Y107.293 E.0013
; LINE_WIDTH: 0.165692
G1 X125.049 Y107.317 E.001
; LINE_WIDTH: 0.213227
G3 X125.281 Y107.367 I-.399 J2.43 E.00185
; LINE_WIDTH: 0.251063
G3 X125.44 Y107.427 I-.338 J1.134 E.00159
; LINE_WIDTH: 0.302798
G3 X126.35 Y108.307 I-.626 J1.557 E.01489
; LINE_WIDTH: 0.259207
G3 X126.428 Y108.499 I-2.381 J1.076 E.002
; LINE_WIDTH: 0.220377
G1 X126.472 Y108.689 E.00159
; LINE_WIDTH: 0.188574
G1 X126.494 Y108.818 E.00089
; LINE_WIDTH: 0.158865
G1 X126.507 Y108.906 E.0005
; LINE_WIDTH: 0.106863
G3 X126.526 Y109.29 I-3.875 J.388 E.00134
G1 X126.526 Y124.506 E.05295
G1 X126.507 Y124.882 E.00131
; LINE_WIDTH: 0.165688
G1 X126.483 Y125.049 E.001
; LINE_WIDTH: 0.213233
G3 X126.433 Y125.281 I-2.434 J-.399 E.00185
; LINE_WIDTH: 0.251062
G3 X126.373 Y125.44 I-1.129 J-.336 E.00159
; LINE_WIDTH: 0.3028
G3 X125.493 Y126.35 I-1.557 J-.626 E.01489
; LINE_WIDTH: 0.259338
G3 X125.301 Y126.428 I-1.081 J-2.389 E.002
; LINE_WIDTH: 0.220367
G1 X125.111 Y126.472 E.00159
; LINE_WIDTH: 0.188575
G1 X124.982 Y126.494 E.00089
; LINE_WIDTH: 0.158865
G1 X124.894 Y126.507 E.0005
; LINE_WIDTH: 0.106844
G3 X124.51 Y126.526 I-.388 J-3.875 E.00134
G1 X109.294 Y126.526 E.05293
G1 X108.918 Y126.507 E.00131
; LINE_WIDTH: 0.165696
G1 X108.751 Y126.483 E.001
; LINE_WIDTH: 0.213215
G3 X108.519 Y126.433 I.402 J-2.447 E.00185
; LINE_WIDTH: 0.251052
G3 X108.36 Y126.373 I.336 J-1.128 E.00159
; LINE_WIDTH: 0.305814
G3 X107.546 Y125.683 I.666 J-1.608 E.01256
; LINE_WIDTH: 0.276162
G3 X107.384 Y125.333 I2.739 J-1.487 E.00401
; LINE_WIDTH: 0.227231
G3 X107.338 Y125.163 I1.003 J-.359 E.00148
; LINE_WIDTH: 0.194961
G3 X107.306 Y124.982 I3.057 J-.634 E.0013
; LINE_WIDTH: 0.158865
G1 X107.293 Y124.894 E.0005
; LINE_WIDTH: 0.125556
G3 X107.274 Y124.51 I3.875 J-.388 E.00163
G1 X107.274 Y124.506 E.00002
; LINE_WIDTH: 0.106398
G1 X107.274 Y109.294 E.05264
G1 X107.293 Y108.918 E.0013
; LINE_WIDTH: 0.165688
G1 X107.317 Y108.751 E.001
; LINE_WIDTH: 0.213226
G3 X107.367 Y108.519 I2.427 J.398 E.00185
; LINE_WIDTH: 0.25106
G3 X107.427 Y108.36 I1.133 J.338 E.00159
; LINE_WIDTH: 0.302824
G3 X108.306 Y107.45 I1.557 J.625 E.01487
; LINE_WIDTH: 0.25856
G3 X108.499 Y107.372 I.745 J1.569 E.00201
; LINE_WIDTH: 0.214733
G3 X108.751 Y107.317 I.746 J2.786 E.00203
; LINE_WIDTH: 0.167393
G1 X108.907 Y107.294 E.00094
; LINE_WIDTH: 0.106078
G3 X109.29 Y107.274 I.387 J3.853 E.00132
G1 X118.852 Y107.274 E.03297
; WIPE_START
G1 F15000
G1 X120.852 Y107.274 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.17 Y113.96 Z5.7 F42000
G1 X116.03 Y116.03 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
M204 S5000
G1 X114.621 Y116.03 E.02288
G3 X116.03 Y114.622 I2.274 J.866 E.03332
G1 X116.03 Y115.97 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X114.621 Y116.03 E-.53583
G1 X114.78 Y115.693 E-.14148
G1 X114.883 Y115.528 E-.07404
G1 X114.897 Y115.51 E-.00865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.714 Y114.6 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X116.092 Y114.6 E.02634
G3 X117.144 Y114.472 I.851 J2.617 E.01732
G3 X117.657 Y114.581 I-.316 J2.743 E.00852
; WIPE_START
G1 F3600
M204 S6000
G1 X116.092 Y114.6 E-.59472
G1 X116.371 Y114.518 E-.11044
G1 X116.513 Y114.493 E-.05484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y116.03 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X117.77 Y114.622 E.02286
G1 X117.891 Y114.671 E.00212
G3 X119.179 Y116.03 I-1.066 J2.299 E.03114
G1 X117.83 Y116.03 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X117.77 Y114.622 E-.53538
G1 X117.891 Y114.671 E-.0496
G1 X118.292 Y114.899 E-.17502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.2 Y116.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X119.246 Y116.23 E.00238
G3 X119.2 Y117.71 I-2.337 J.668 E.02444
G1 X119.2 Y116.15 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.246 Y116.23 E-.03487
G1 X119.322 Y116.61 E-.14729
G1 X119.338 Y116.999 E-.14812
G1 X119.309 Y117.285 E-.10923
G1 X119.2 Y117.71 E-.1667
G1 X119.2 Y117.305 E-.15379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.77 Y117.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X119.179 Y117.77 E.02288
G1 X119.11 Y117.934 E.00288
G3 X117.77 Y119.178 I-2.244 J-1.072 E.03041
G1 X117.77 Y117.83 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.179 Y117.77 E-.53581
G1 X119.11 Y117.934 E-.06745
G1 X118.899 Y118.288 E-.15673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.086 Y119.2 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X117.708 Y119.2 E.02634
G1 X117.615 Y119.233 E.00161
G3 X116.143 Y119.219 I-.714 J-2.372 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X117.708 Y119.2 E-.5948
G1 X117.615 Y119.233 E-.03756
G1 X117.287 Y119.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.03 Y117.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X116.03 Y119.178 E.02286
G3 X114.621 Y117.77 I.875 J-2.285 E.0333
G1 X115.97 Y117.77 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.03 Y119.178 E-.53538
G1 X115.823 Y119.09 E-.08532
G1 X115.508 Y118.902 E-.1393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.6 Y116.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2836
M204 S5000
G1 X114.6 Y117.71 E.0263
G3 X114.581 Y116.147 I2.309 J-.81 E.02583
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3600
M204 S6000
G1 X114.6 Y117.71 E-.59399
G1 X114.491 Y117.287 E-.16601
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

