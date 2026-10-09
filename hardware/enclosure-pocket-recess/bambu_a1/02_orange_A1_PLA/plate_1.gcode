; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 14m 12s; total estimated time: 20m 59s
; total layer number: 53
; total filament length [mm] : 587.99
; total filament volume [cm^3] : 1414.29
; total filament weight [g] : 1.75
; model label id: 66,77,88
; object max height: 5.30,0.80,1.50
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
M73 P0 R21
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
M73 P0 R20
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
M73 P2 R20
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R20
G1 X-48.2 F3000
M73 P5 R19
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
M73 P7 R19
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
M73 P8 R19
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
M73 P28 R14
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
M73 P29 R14
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
    G29 A1 X102.2 Y106.2 I51.6 J43.6
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
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X149.032 Y144.075 F42000
M204 S6000
M73 P30 R14
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X149.032 Y145.032 E.01866
G1 X132.368 Y145.032 E.32491
G1 X132.368 Y128.368 E.32491
G1 X149.032 Y128.368 E.32491
M73 P31 R14
G1 X149.032 Y144.015 E.30508
M204 S6000
G1 X148.554 Y144.075 F42000
G1 F1500
M204 S500
G1 X148.554 Y144.554 E.00933
G1 X132.846 Y144.554 E.30625
G1 X132.846 Y128.846 E.30625
G1 X148.554 Y128.846 E.30625
G1 X148.554 Y144.015 E.29575
M204 S6000
G1 X148.075 Y144.075 F42000
; FEATURE: Outer wall
M73 P32 R14
G1 F1500
M204 S500
G1 X133.325 Y144.075 E.28759
G1 X133.325 Y129.325 E.28759
G1 X148.075 Y129.325 E.28759
G1 X148.075 Y144.015 E.28642
; WIPE_START
G1 X146.075 Y144.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.189 Y137.055 Z.5 F42000
G1 X151.418 Y132.068 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X151.418 Y136.532 E.08704
G1 X152.518 Y136.532 E.02145
G1 X152.518 Y147.975 E.2231
G3 X151.975 Y148.518 I-.522 J.021 E.01683
G1 X129.392 Y148.518 E.4403
G3 X128.883 Y148.02 I.01 J-.519 E.01529
G1 X128.882 Y136.532 E.22399
G1 X129.982 Y136.532 E.02144
G1 X129.982 Y132.068 E.08704
G1 X128.882 Y132.068 E.02145
G1 X128.882 Y125.425 E.12951
G3 X129.37 Y124.883 I.521 J-.021 E.01574
G1 X130.768 Y124.883 E.02726
G1 X130.768 Y125.182 E.00584
G1 X135.232 Y125.182 E.08704
G1 X135.232 Y124.882 E.00585
G1 X146.168 Y124.882 E.21322
G1 X146.168 Y125.182 E.00585
G1 X150.632 Y125.182 E.08704
G1 X150.632 Y124.882 E.00585
G3 X152.008 Y124.882 I.677 J33.455 E.02683
G3 X152.517 Y125.37 I-.01 J.52 E.01509
G1 X152.518 Y132.068 E.1306
G1 X151.478 Y132.068 E.02027
M204 S6000
G1 X151.896 Y132.546 F42000
G1 F1500
M204 S500
M73 P33 R14
G1 X151.896 Y136.053 E.06838
G1 X152.996 Y136.053 E.02145
G1 X152.996 Y147.984 E.23262
G3 X151.984 Y148.996 I-1 J.012 E.03111
G1 X129.409 Y148.996 E.44016
G3 X128.405 Y148.039 I.001 J-1.006 E.02985
G1 X128.404 Y136.053 E.23368
G1 X129.503 Y136.053 E.02145
G1 X129.503 Y132.546 E.06838
G1 X128.403 Y132.546 E.02145
G1 X128.403 Y125.416 E.13903
G3 X129.353 Y124.405 I1.001 J-.011 E.02988
G1 X131.246 Y124.404 E.03691
G1 X131.246 Y124.703 E.00584
G1 X134.753 Y124.703 E.06838
G1 X134.753 Y124.403 E.00585
G1 X146.646 Y124.403 E.23188
G1 X146.646 Y124.703 E.00585
G1 X150.154 Y124.703 E.06838
G1 X150.154 Y124.403 E.00585
G3 X152.031 Y124.404 I.919 J47.018 E.03662
G3 X152.995 Y125.353 I-.034 J.999 E.02896
G1 X152.996 Y132.546 E.14025
G1 X151.956 Y132.546 E.02027
M204 S6000
G1 X152.375 Y133.025 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X152.375 Y135.575 E.04972
G1 X153.475 Y135.575 E.02145
M73 P33 R13
G1 X153.475 Y147.994 E.24213
G3 X151.994 Y149.475 I-1.478 J.003 E.0454
G1 X129.404 Y149.475 E.44044
G3 X127.926 Y148.058 I.008 J-1.487 E.04402
G1 X127.925 Y135.575 E.24338
G1 X129.025 Y135.575 E.02145
G1 X129.025 Y133.025 E.04972
G1 X127.925 Y133.025 E.02145
G1 X127.925 Y125.406 E.14854
G3 X129.339 Y123.926 I1.482 J.001 E.04405
G1 X131.725 Y123.925 E.04652
G1 X131.725 Y124.225 E.00585
G1 X134.275 Y124.225 E.04972
G1 X134.275 Y123.925 E.00585
G1 X147.125 Y123.925 E.25054
G1 X147.125 Y124.225 E.00585
G1 X149.675 Y124.225 E.04972
G1 X149.675 Y123.925 E.00585
G3 X152.055 Y123.926 I1.161 J60.32 E.04641
G3 X153.474 Y125.339 I-.058 J1.477 E.04288
G1 X153.475 Y133.025 E.14986
G1 X152.435 Y133.025 E.02028
; WIPE_START
G1 X152.388 Y135.024 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z0.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X152.325 Y126.257 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50163
G1 F2400
M204 S500
G1 X151.357 Y125.289 E.02678
G1 X151.039 Y125.289 E.00623
G1 X151.039 Y125.589 E.00587
G1 X150.978 Y125.589 E.00118
G1 X152.11 Y126.721 E.03131
G1 X152.11 Y127.4 E.01329
G1 X150.299 Y125.589 E.0501
G1 X149.62 Y125.589 E.01329
G1 X152.11 Y128.079 E.0689
M73 P34 R13
G1 X152.11 Y128.758 E.01329
G1 X148.941 Y125.589 E.08769
G1 X148.262 Y125.589 E.01329
G1 X152.111 Y129.437 E.10648
G1 X152.111 Y130.116 E.01329
G1 X147.583 Y125.589 E.12527
G1 X146.904 Y125.589 E.01329
G1 X152.111 Y130.796 E.14406
G1 X152.111 Y131.475 E.01329
G1 X149.439 Y128.803 E.07393
G1 X149.439 Y129.482 E.01329
G1 X151.618 Y131.661 E.0603
G1 X151.011 Y131.661 E.01187
G1 X151.011 Y131.733 E.00141
G1 X149.439 Y130.161 E.0435
G1 X149.439 Y130.84 E.01329
G1 X151.011 Y132.412 E.0435
G1 X151.011 Y133.091 E.01329
G1 X149.439 Y131.519 E.0435
G1 X149.439 Y132.198 E.01329
G1 X151.011 Y133.77 E.0435
G1 X151.011 Y134.45 E.01329
G1 X149.439 Y132.877 E.0435
G1 X149.439 Y133.556 E.01329
G1 X151.011 Y135.129 E.0435
G1 X151.011 Y135.808 E.01329
G1 X149.439 Y134.235 E.0435
G1 X149.439 Y134.914 E.01329
G1 X151.011 Y136.487 E.0435
G1 X151.011 Y136.939 E.00884
G1 X151.463 Y136.939 E.00884
G1 X152.111 Y137.587 E.01793
G1 X152.111 Y138.266 E.01329
G1 X149.439 Y135.593 E.07394
G1 X149.439 Y136.272 E.01329
G1 X152.111 Y138.945 E.07394
G1 X152.111 Y139.624 E.01329
G1 X149.439 Y136.952 E.07394
G1 X149.439 Y137.631 E.01329
G1 X152.111 Y140.303 E.07394
G1 X152.111 Y140.982 E.01329
G1 X149.439 Y138.31 E.07394
G1 X149.439 Y138.989 E.01329
G1 X152.111 Y141.661 E.07394
G1 X152.111 Y142.34 E.01329
G1 X149.439 Y139.668 E.07394
G1 X149.439 Y140.347 E.01329
G1 X152.111 Y143.019 E.07394
G1 X152.111 Y143.698 E.01329
G1 X149.439 Y141.026 E.07394
G1 X149.439 Y141.705 E.01329
G1 X152.111 Y144.377 E.07394
G1 X152.111 Y145.056 E.01329
G1 X149.439 Y142.384 E.07394
G1 X149.439 Y143.063 E.01329
G1 X152.111 Y145.735 E.07394
G1 X152.111 Y146.415 E.01329
G1 X149.439 Y143.742 E.07394
G1 X149.439 Y144.421 E.01329
G1 X152.111 Y147.094 E.07394
G1 X152.111 Y147.773 E.01329
G1 X149.439 Y145.1 E.07394
G1 X149.439 Y145.439 E.00662
G1 X149.098 Y145.439 E.00666
G1 X151.771 Y148.111 E.07394
G1 X151.092 Y148.111 E.01329
G1 X148.419 Y145.439 E.07394
G1 X147.74 Y145.439 E.01329
G1 X150.413 Y148.111 E.07394
G1 X149.734 Y148.111 E.01329
G1 X147.061 Y145.439 E.07394
G1 X146.382 Y145.439 E.01329
G1 X149.054 Y148.111 E.07394
G1 X148.375 Y148.111 E.01329
G1 X145.703 Y145.439 E.07394
G1 X145.024 Y145.439 E.01329
G1 X147.696 Y148.111 E.07394
G1 X147.017 Y148.111 E.01329
G1 X144.345 Y145.439 E.07394
G1 X143.666 Y145.439 E.01329
G1 X146.338 Y148.111 E.07394
G1 X145.659 Y148.111 E.01329
G1 X142.987 Y145.439 E.07394
G1 X142.308 Y145.439 E.01329
G1 X144.98 Y148.111 E.07394
G1 X144.301 Y148.111 E.01329
G1 X141.629 Y145.439 E.07394
G1 X140.95 Y145.439 E.01329
G1 X143.622 Y148.111 E.07394
G1 X142.943 Y148.111 E.01329
G1 X140.271 Y145.439 E.07394
G1 X139.591 Y145.439 E.01329
G1 X142.264 Y148.111 E.07394
G1 X141.585 Y148.111 E.01329
G1 X138.912 Y145.439 E.07394
G1 X138.233 Y145.439 E.01329
G1 X140.906 Y148.111 E.07394
G1 X140.227 Y148.111 E.01329
G1 X137.554 Y145.439 E.07394
G1 X136.875 Y145.439 E.01329
G1 X139.548 Y148.111 E.07394
G1 X138.869 Y148.111 E.01329
G1 X136.196 Y145.439 E.07394
G1 X135.517 Y145.439 E.01329
G1 X138.189 Y148.111 E.07394
G1 X137.51 Y148.111 E.01329
G1 X134.838 Y145.439 E.07394
G1 X134.159 Y145.439 E.01329
G1 X136.831 Y148.111 E.07394
G1 X136.152 Y148.111 E.01329
G1 X133.48 Y145.439 E.07394
G1 X132.801 Y145.439 E.01329
G1 X135.689 Y148.327 E.0799
; WIPE_START
G1 X134.274 Y146.912 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.953 Y140.882 Z.5 F42000
G1 X148.813 Y128.176 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X146.225 Y125.589 E.0716
G1 X145.761 Y125.589 E.00907
G1 X145.761 Y125.289 E.00587
G1 X145.246 Y125.289 E.01008
G1 X147.918 Y127.961 E.07394
G1 X147.239 Y127.961 E.01329
G1 X144.567 Y125.289 E.07394
G1 X143.888 Y125.289 E.01329
G1 X146.56 Y127.961 E.07394
G1 X145.881 Y127.961 E.01329
G1 X143.209 Y125.289 E.07394
G1 X142.53 Y125.289 E.01329
M73 P35 R13
G1 X145.202 Y127.961 E.07394
G1 X144.523 Y127.961 E.01329
G1 X141.85 Y125.289 E.07394
G1 X141.171 Y125.289 E.01329
G1 X143.844 Y127.961 E.07394
G1 X143.165 Y127.961 E.01329
G1 X140.492 Y125.289 E.07394
G1 X139.813 Y125.289 E.01329
G1 X142.486 Y127.961 E.07394
G1 X141.807 Y127.961 E.01329
G1 X139.134 Y125.289 E.07394
G1 X138.455 Y125.289 E.01329
G1 X141.128 Y127.961 E.07394
G1 X140.448 Y127.961 E.01329
G1 X137.776 Y125.289 E.07394
G1 X137.097 Y125.289 E.01329
G1 X139.769 Y127.961 E.07394
G1 X139.09 Y127.961 E.01329
G1 X136.418 Y125.289 E.07394
G1 X135.739 Y125.289 E.01329
G1 X138.411 Y127.961 E.07394
G1 X137.732 Y127.961 E.01329
G1 X135.36 Y125.589 E.06564
G1 X134.681 Y125.589 E.01329
G1 X137.053 Y127.961 E.06564
G1 X136.374 Y127.961 E.01329
G1 X134.002 Y125.589 E.06564
G1 X133.323 Y125.589 E.01329
G1 X135.695 Y127.961 E.06564
G1 X135.016 Y127.961 E.01329
G1 X132.644 Y125.589 E.06564
G1 X131.965 Y125.589 E.01329
G1 X134.337 Y127.961 E.06564
G1 X133.658 Y127.961 E.01329
G1 X131.07 Y125.373 E.0716
; WIPE_START
G1 X132.484 Y126.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.092 Y125.074 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X132.979 Y127.961 E.07987
G1 X132.3 Y127.961 E.01329
G1 X129.629 Y125.29 E.0739
G2 X129.324 Y125.323 I-.104 J.459 E.0061
G2 X129.289 Y125.629 I.494 J.213 E.00611
G1 X131.961 Y128.302 E.07394
G1 X131.961 Y128.981 E.01329
G1 X129.289 Y126.308 E.07394
G1 X129.289 Y126.987 E.01329
G1 X131.961 Y129.66 E.07394
G1 X131.961 Y130.339 E.01329
G1 X129.289 Y127.666 E.07394
G1 X129.289 Y128.346 E.01329
G1 X131.961 Y131.018 E.07394
G1 X131.961 Y131.697 E.01329
G1 X129.289 Y129.025 E.07394
G1 X129.289 Y129.704 E.01329
G1 X131.961 Y132.376 E.07394
G1 X131.961 Y133.055 E.01329
G1 X129.289 Y130.383 E.07394
G1 X129.289 Y131.062 E.01329
G1 X129.888 Y131.661 E.01658
G1 X130.389 Y131.661 E.00979
G1 X130.389 Y132.162 E.00979
G1 X131.961 Y133.734 E.0435
G1 X131.961 Y134.413 E.01329
G1 X130.389 Y132.841 E.0435
G1 X130.389 Y133.52 E.01329
G1 X131.961 Y135.092 E.0435
G1 X131.961 Y135.771 E.01329
G1 X130.389 Y134.199 E.0435
G1 X130.389 Y134.878 E.01329
G1 X131.961 Y136.45 E.0435
G1 X131.961 Y137.129 E.01329
G1 X130.389 Y135.557 E.0435
G1 X130.389 Y136.236 E.01329
G1 X131.961 Y137.809 E.0435
G1 X131.961 Y138.488 E.01329
G1 X130.389 Y136.915 E.0435
G1 X130.389 Y136.939 E.00046
G1 X129.733 Y136.939 E.01282
G1 X131.961 Y139.167 E.06164
G1 X131.961 Y139.846 E.01329
G1 X129.289 Y137.174 E.07393
G1 X129.289 Y137.853 E.01329
G1 X131.961 Y140.525 E.07393
G1 X131.961 Y141.204 E.01329
G1 X129.289 Y138.532 E.07393
G1 X129.289 Y139.211 E.01329
G1 X131.961 Y141.883 E.07393
G1 X131.961 Y142.562 E.01329
G1 X129.289 Y139.89 E.07392
G1 X129.289 Y140.569 E.01329
G1 X131.961 Y143.241 E.07392
G1 X131.961 Y143.92 E.01329
G1 X129.289 Y141.248 E.07392
G1 X129.29 Y141.928 E.01329
G1 X132.176 Y144.814 E.07988
; WIPE_START
G1 X130.762 Y143.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.074 Y142.391 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X134.794 Y148.111 E.15826
G1 X134.115 Y148.111 E.01329
G1 X129.29 Y143.286 E.13351
G1 X129.29 Y143.965 E.01329
G1 X133.436 Y148.111 E.11472
G1 X132.757 Y148.111 E.01329
G1 X129.29 Y144.644 E.09593
G1 X129.29 Y145.323 E.01329
G1 X132.078 Y148.111 E.07714
G1 X131.399 Y148.111 E.01329
G1 X129.29 Y146.002 E.05835
G1 X129.29 Y146.681 E.01329
G1 X130.72 Y148.111 E.03956
G1 X130.041 Y148.111 E.01329
G1 X129.29 Y147.361 E.02077
G1 X129.29 Y147.972 E.01196
G2 X129.314 Y148.063 I.153 J.009 E.00188
G1 X129.577 Y148.327 E.00728
; OBJECT_ID: 77
; WIPE_START
G1 X129.314 Y148.063 E-.14148
G1 X129.29 Y147.972 E-.03588
G1 X129.29 Y147.361 E-.23227
G1 X129.942 Y148.013 E-.35037
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S6000
G1 X127.557 Y140.762 Z.5 F42000
G1 X123.269 Y127.732 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X123.345 Y127.757 E.00156
G3 X124.404 Y129.384 I-.744 J1.642 E.03997
G1 X124.404 Y146.823 E.34002
G3 X122.616 Y148.604 I-1.802 J-.022 E.05449
G1 X105.176 Y148.604 E.34002
G3 X103.396 Y146.816 I.022 J-1.802 E.05447
G1 X103.397 Y129.321 E.34111
G3 X105.177 Y127.596 I1.823 J.101 E.05311
G1 X122.624 Y127.596 E.34017
G3 X122.963 Y127.633 I-.022 J1.802 E.00667
G1 X123.212 Y127.714 E.0051
M204 S6000
G1 X123.122 Y128.185 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X123.147 Y128.2 E.00056
G3 X123.925 Y129.394 I-.568 J1.221 E.02927
G1 X123.925 Y146.81 E.33957
G3 X122.606 Y148.125 I-1.346 J-.031 E.0401
G1 X105.19 Y148.125 E.33957
G3 X103.875 Y146.807 I.031 J-1.346 E.0401
G1 X103.876 Y129.345 E.34046
G3 X105.191 Y128.075 I1.34 J.071 E.03921
G1 X122.61 Y128.075 E.33963
G3 X122.864 Y128.105 I-.031 J1.346 E.005
G1 X123.065 Y128.167 E.0041
; WIPE_START
G1 X123.147 Y128.2 E-.03351
G1 X123.376 Y128.326 E-.09943
G1 X123.573 Y128.5 E-.1001
G1 X123.73 Y128.708 E-.0987
M73 P36 R13
G1 X123.842 Y128.938 E-.09752
G1 X123.908 Y129.187 E-.09767
G1 X123.925 Y129.394 E-.07888
G1 X123.925 Y129.799 E-.1542
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.32 Y127.25 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X124.408 Y127.278 E.0018
G3 X124.795 Y127.873 I-.314 J.628 E.01452
G1 X124.796 Y148.276 E.39781
G3 X124.084 Y148.996 I-.703 J.017 E.02205
G1 X103.716 Y148.996 E.39713
G3 X103.004 Y148.276 I0 J-.712 E.02197
G1 X103.004 Y127.916 E.39697
G3 X103.673 Y127.205 I.706 J-.006 E.02104
G1 X124.182 Y127.209 E.39987
G1 X124.263 Y127.233 E.00163
M204 S6000
G1 X124.464 Y126.783 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X124.466 Y126.785 E.00004
G3 X125.274 Y127.854 I-.373 J1.122 E.02779
G1 X125.275 Y148.29 E.39845
G3 X124.094 Y149.475 I-1.184 J0 E.03622
G1 X103.706 Y149.475 E.3975
G3 X102.525 Y148.29 I.015 J-1.196 E.03612
G1 X102.525 Y127.906 E.39744
G3 X103.654 Y126.726 I1.19 J.008 E.0351
G1 X124.238 Y126.733 E.40134
G1 X124.405 Y126.77 E.00333
M204 S6000
G1 X124.212 Y127.46 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252242
G1 F1500
M204 S500
G1 X124.55 Y128.661 E.01173
M204 S6000
G1 X124.556 Y128.606 F42000
; LINE_WIDTH: 0.363888
G1 F1500
M204 S500
G1 X124.174 Y127.452 E.01696
M204 S6000
G1 X124.538 Y127.774 F42000
; LINE_WIDTH: 0.211345
G1 F1500
M204 S500
G1 X123.335 Y127.454 E.00963
M204 S6000
G1 X123.376 Y127.444 F42000
; LINE_WIDTH: 0.348226
G1 F1500
M204 S500
G1 X124.547 Y127.818 E.01636
M204 S6000
G1 X124.556 Y128.487 F42000
; LINE_WIDTH: 0.5086
G1 F1500
M204 S500
G2 X124.291 Y127.841 I-5.614 J1.929 E.01387
G1 X124.261 Y127.798 E.00103
; LINE_WIDTH: 0.542688
G1 X124.23 Y127.765 E.00097
G2 X124.117 Y127.689 I-.342 J.384 E.0029
; LINE_WIDTH: 0.488157
G1 X124.106 Y127.684 E.00024
G2 X123.466 Y127.444 I-5.286 J13.128 E.01299
; WIPE_START
G1 X124.106 Y127.684 E-.74644
G1 X124.117 Y127.689 E-.01356
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.485 Y127.594 Z.5 F42000
M73 P37 R13
G1 X104.457 Y127.444 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.294722
G1 F1500
M204 S500
G1 X103.257 Y127.802 E.01394
M204 S6000
G1 X103.248 Y127.84 F42000
; LINE_WIDTH: 0.423145
G1 F1500
M204 S500
G1 X104.371 Y127.444 E.01948
M204 S6000
G1 X104.213 Y127.444 F42000
; LINE_WIDTH: 0.515279
G1 F1500
M204 S500
G1 X103.621 Y127.723 E.01318
; LINE_WIDTH: 0.54448
G1 X103.533 Y127.807 E.00258
G2 X103.493 Y127.874 I.357 J.254 E.00166
; LINE_WIDTH: 0.476844
G1 X103.476 Y127.914 E.0008
G2 X103.243 Y128.577 I6.101 J2.522 E.01305
M204 S6000
G1 X103.243 Y128.618 F42000
; LINE_WIDTH: 0.356966
G1 F1500
M204 S500
G1 X103.621 Y127.453 E.01674
M204 S6000
G1 X103.583 Y127.461 F42000
; LINE_WIDTH: 0.244719
G1 F1500
M204 S500
G1 X103.249 Y128.668 E.01139
; WIPE_START
G1 X103.583 Y127.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.466 Y135.092 Z.5 F42000
G1 X103.262 Y148.425 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.211747
G1 F1500
M204 S500
G1 X104.468 Y148.748 E.00968
M204 S6000
G1 X104.424 Y148.757 F42000
; LINE_WIDTH: 0.34799
G1 F1500
M204 S500
G1 X103.252 Y148.38 E.01639
M204 S6000
G1 X103.248 Y147.536 F42000
; LINE_WIDTH: 0.253533
G1 F1500
M204 S500
G1 X103.589 Y148.741 E.01184
M204 S6000
G1 X103.625 Y148.749 F42000
; LINE_WIDTH: 0.365146
G1 F1500
M204 S500
G1 X103.243 Y147.592 E.01706
M204 S6000
G1 X103.243 Y147.798 F42000
; LINE_WIDTH: 0.528691
G1 F1500
M204 S500
G1 X103.503 Y148.348 E.01258
G1 X103.57 Y148.435 E.00227
G1 X103.658 Y148.499 E.00223
; LINE_WIDTH: 0.488596
G1 X103.691 Y148.515 E.00071
G2 X104.334 Y148.757 I5.361 J-13.263 E.01308
; WIPE_START
G1 X103.691 Y148.515 E-.7209
G1 X103.658 Y148.499 E-.0391
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.29 Y148.597 Z.5 F42000
G1 X123.336 Y148.752 Z.5
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.252329
G1 F1500
M204 S500
G1 X124.54 Y148.411 E.01177
M204 S6000
G1 X124.549 Y148.373 F42000
; LINE_WIDTH: 0.363539
G1 F1500
M204 S500
G1 X123.393 Y148.757 E.01699
M204 S6000
G1 X123.554 Y148.757 F42000
; LINE_WIDTH: 0.513052
G1 F1500
M204 S500
G1 X124.14 Y148.501 E.01281
; LINE_WIDTH: 0.543022
G2 X124.241 Y148.424 I-.152 J-.306 E.00272
G1 X124.306 Y148.327 E.00248
; LINE_WIDTH: 0.476543
G2 X124.557 Y147.673 I-7.73 J-3.341 E.013
M204 S6000
G1 X124.557 Y147.583 F42000
; LINE_WIDTH: 0.356954
G1 F1500
M204 S500
G1 X124.179 Y148.748 E.01675
M204 S6000
G1 X124.217 Y148.739 F42000
; LINE_WIDTH: 0.244695
G1 F1500
M204 S500
G1 X124.551 Y147.532 E.01139
; OBJECT_ID: 66
; WIPE_START
G1 X124.217 Y148.739 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S6000
G1 X124.109 Y141.108 Z.5 F42000
G1 X123.654 Y108.985 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X123.671 Y109.155 E.00333
G1 X123.671 Y121.445 E.23964
G1 X123.654 Y121.615 E.00333
G1 X123.484 Y121.632 E.00333
G1 X111.193 Y121.632 E.23964
G1 X111.023 Y121.615 E.00333
G1 X111.007 Y121.445 E.00333
G1 X111.007 Y109.155 E.23964
G1 X111.023 Y108.985 E.00333
G3 X111.627 Y108.968 I.387 J3.05 E.01179
G1 X123.488 Y108.968 E.23125
G1 X123.594 Y108.979 E.00209
M204 S6000
G1 X123.962 Y108.677 F42000
G1 F1500
M204 S500
G3 X124.149 Y109.131 I-.451 J.452 E.00984
G1 X124.149 Y121.469 E.24056
G3 X123.508 Y122.111 I-.639 J.002 E.01967
G1 X111.17 Y122.111 E.24056
G3 X110.528 Y121.469 I-.002 J-.639 E.01967
G1 X110.528 Y109.131 E.24056
G3 X111.17 Y108.489 I.639 J-.002 E.01967
G1 X111.627 Y108.489 E.00891
G1 X123.511 Y108.49 E.23171
G3 X123.918 Y108.636 I-.001 J.639 E.00859
M204 S6000
G1 X124.309 Y108.33 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X124.628 Y109.108 I-.77 J.77 E.01682
G1 X124.628 Y121.493 E.24148
G3 X123.531 Y122.589 I-1.09 J.007 E.03365
G1 X111.146 Y122.589 E.24148
G3 X110.049 Y121.493 I-.007 J-1.09 E.03365
G1 X110.049 Y109.108 E.24148
G3 X111.146 Y108.011 I1.09 J-.007 E.03365
G1 X111.627 Y108.011 E.00937
G1 X123.535 Y108.011 E.23217
G3 X124.265 Y108.289 I.004 J1.089 E.01558
; WIPE_START
G1 X124.444 Y108.492 E-.10298
G1 X124.544 Y108.679 E-.08039
G1 X124.605 Y108.881 E-.08038
G1 X124.628 Y109.108 E-.0865
G1 X124.628 Y110.186 E-.40976
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.5 Y109.16 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50579
G1 F2400
M204 S500
G1 X123.264 Y109.924 E.02133
G1 X123.264 Y110.609 E.01352
G1 X122.03 Y109.375 E.03444
G1 X121.345 Y109.375 E.01352
G1 X123.264 Y111.294 E.05355
G1 X123.264 Y111.979 E.01352
G1 X120.66 Y109.375 E.07267
G1 X119.975 Y109.375 E.01352
G1 X123.264 Y112.664 E.09178
G1 X123.264 Y113.349 E.01352
G1 X119.29 Y109.375 E.1109
G1 X118.605 Y109.375 E.01352
G1 X123.264 Y114.034 E.13001
G1 X123.264 Y114.719 E.01352
G1 X117.92 Y109.375 E.14913
G1 X117.235 Y109.375 E.01352
G1 X123.264 Y115.404 E.16825
G1 X123.264 Y116.089 E.01352
G1 X116.55 Y109.375 E.18736
G1 X115.865 Y109.375 E.01352
G1 X123.264 Y116.773 E.20648
G1 X123.264 Y117.458 E.01352
G1 X115.18 Y109.375 E.22559
G1 X114.495 Y109.375 E.01352
G1 X123.264 Y118.143 E.24471
G1 X123.264 Y118.828 E.01352
G1 X113.81 Y109.375 E.26382
G1 X113.126 Y109.375 E.01352
G1 X123.264 Y119.513 E.28294
G1 X123.264 Y120.198 E.01352
G1 X112.441 Y109.375 E.30205
G1 X111.756 Y109.375 E.01352
G1 X123.264 Y120.883 E.32117
G1 X123.264 Y121.225 E.00675
G1 X122.921 Y121.225 E.00676
G1 X111.413 Y109.717 E.32116
G1 X111.413 Y110.402 E.01352
G1 X122.236 Y121.225 E.30204
G1 X121.551 Y121.225 E.01352
G1 X111.413 Y111.087 E.28293
G1 X111.413 Y111.772 E.01352
G1 X120.867 Y121.225 E.26381
G1 X120.182 Y121.225 E.01352
G1 X111.413 Y112.457 E.2447
G1 X111.413 Y113.142 E.01352
G1 X119.497 Y121.225 E.22558
G1 X118.812 Y121.225 E.01352
M73 P38 R13
G1 X111.413 Y113.827 E.20647
G1 X111.413 Y114.512 E.01352
G1 X118.127 Y121.225 E.18735
G1 X117.442 Y121.225 E.01352
G1 X111.413 Y115.197 E.16824
G1 X111.413 Y115.882 E.01352
G1 X116.757 Y121.225 E.14912
M73 P38 R12
G1 X116.072 Y121.225 E.01352
G1 X111.413 Y116.567 E.13001
G1 X111.413 Y117.252 E.01352
G1 X115.387 Y121.225 E.11089
G1 X114.702 Y121.225 E.01352
G1 X111.413 Y117.937 E.09178
G1 X111.413 Y118.622 E.01352
G1 X114.017 Y121.225 E.07266
G1 X113.332 Y121.225 E.01352
G1 X111.413 Y119.307 E.05355
G1 X111.413 Y119.992 E.01352
G1 X112.647 Y121.225 E.03443
G1 X111.962 Y121.225 E.01352
G1 X111.198 Y120.461 E.02133
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F2400
G1 X111.962 Y121.225 E-.41073
G1 X112.647 Y121.225 E-.26028
G1 X112.482 Y121.06 E-.08899
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 2/53
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S193.8
; open powerlost recovery
M1003 S1
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.5 I-.649 J1.029 P1  F42000
G1 X148.802 Y143.96 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z.6 F42000
G1 X151.648 Y132.298 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.74 Y148.107 E.20612
G3 X151.979 Y148.748 I-.741 J-.108 E.019
G1 X129.42 Y148.748 E.39388
G3 X128.653 Y148.029 I-.017 J-.75 E.02034
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.752 J-.017 E.02017
G1 X130.998 Y124.653 E.02858
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G1 X151.98 Y124.652 E.02754
G3 X152.747 Y125.371 I.016 J.751 E.02033
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.0192
G1 X153.175 Y148.053 E.21265
G3 X151.987 Y149.176 I-1.178 J-.055 E.03154
G1 X129.412 Y149.176 E.39417
G3 X128.225 Y148.046 I-.007 J-1.181 E.03164
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.12771
G3 X129.348 Y124.225 I1.182 J-.007 E.03154
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.988 Y124.223 E.03517
G3 X153.175 Y125.354 I.006 J1.182 E.03163
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.588 Y148.069 E.20475
G3 X151.996 Y149.59 I-1.591 J-.072 E.03947
G1 X129.404 Y149.59 E.36684
G3 X127.811 Y148.062 I.003 J-1.597 E.03956
G1 X127.81 Y135.46 E.20464
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
M73 P39 R12
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.597 J.003 E.03953
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.996 Y123.81 E.03955
G3 X153.589 Y125.338 I-.003 J1.598 E.03956
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z0.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.331 I-327.061 J2.216 E.08563
G1 X150.013 Y145.016 E.1254
G1 X149.931 Y145.412 E.0066
G1 X149.72 Y145.721 E.0061
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y128.184 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.016 Y128.184 E.20813
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27008
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00247
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X136.139 Y128.184 E.06097
M204 S10000
G1 X136.199 Y127.786 F42000
G1 F15000
M204 S6000
G1 X149.016 Y127.786 E.20813
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27008
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01115
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X136.139 Y127.786 E.06097
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07192
G1 X150.616 Y126.561 E.00916
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.319 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X151.234 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.424 E.1049
G2 X152.13 Y125.098 I-.483 J.075 E.00641
G2 X150.816 Y125.066 I-1.056 J16.415 E.02135
G3 X150.75 Y125.314 I-.312 J.05 E.00428
G1 X150.556 Y125.366 E.00327
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.393 Y125.067 E.01934
G1 X129.191 Y125.149 E.00354
G1 X129.074 Y125.392 E.00438
G1 X129.066 Y131.884 E.10541
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.516 E.07198
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18316
G1 X129.154 Y148.218 E.00388
G2 X129.498 Y148.334 I.353 J-.477 E.00598
G1 X151.956 Y148.334 E.36466
G1 X152.135 Y148.288 E.00302
G1 X152.274 Y148.157 E.00309
G1 X152.333 Y147.955 E.00342
G1 X152.334 Y136.716 E.1825
G1 X151.434 Y136.716 E.01462
G1 X151.275 Y136.637 E.00287
G1 X151.254 Y136.573 E.00109
M204 S10000
G1 X150.836 Y136.516 F42000
G1 F15000
M204 S6000
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.935 Y125.467 E.09774
G1 X151.082 Y125.465 E.01384
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00793
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01382
G2 X129.464 Y131.486 I710.45 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.516 E.07198
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.93 E.17562
G1 X151.933 Y147.935 E.36482
G1 X151.936 Y137.114 E.1757
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.00371
G1 X150.958 Y136.878 E.00514
G1 X150.855 Y136.573 E.00523
M204 S10000
G1 X150.431 Y136.516 F42000
; LINE_WIDTH: 0.421553
G1 F15000
M204 S6000
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.865 E.08514
G1 X151.304 Y125.864 E.00378
G1 X151.287 Y125.903 E.00069
G1 X150.616 Y126.163 E.01172
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.959 Y136.69 E.0751
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.536 Y147.537 E.35328
G1 X151.537 Y137.513 E.16342
G1 X151.06 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.434 Y136.576 E.00186
M204 S10000
G1 X150.411 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X150.411 Y145.017 E.12322
G3 X150.296 Y145.571 I-1.395 J0 E.00925
G1 X150.002 Y146.003 E.00849
G1 X149.57 Y146.297 E.00848
G3 X149.016 Y146.411 I-.554 J-1.28 E.00924
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.428 E.12322
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.137 Y147.139 E.33895
G1 X151.138 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.459 Y137.464 E.00924
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.350105
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09529
M204 S10000
G1 X150.761 Y145.323 F42000
; LINE_WIDTH: 0.394398
G1 F15000
M204 S6000
G1 X150.738 Y145.463 E.00215
; LINE_WIDTH: 0.431555
G1 X150.716 Y145.603 E.00237
; LINE_WIDTH: 0.485547
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.309 E.01295
G1 X149.741 Y146.693 E.01294
; LINE_WIDTH: 0.468948
G1 X149.602 Y146.716 E.00258
; LINE_WIDTH: 0.432265
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.395582
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.432265
G1 X149.604 Y146.725 E.00237
; LINE_WIDTH: 0.48603
G1 X149.744 Y146.707 E.00268
G1 X150.705 Y146.707 E.01819
G1 X150.705 Y145.745 E.0182
; LINE_WIDTH: 0.468712
G1 X150.721 Y145.624 E.00222
; LINE_WIDTH: 0.431555
G1 X150.737 Y145.503 E.00204
; LINE_WIDTH: 0.394398
G1 X150.753 Y145.382 E.00185
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 77
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X130.54 Y140.216 Z.6 F42000
G1 X123.212 Y127.901 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.262 Y127.926 E.00098
G3 X124.224 Y129.382 I-.687 J1.499 E.0321
G1 X124.224 Y146.814 E.30437
G3 X122.612 Y148.424 I-1.648 J-.039 E.0439
G1 X105.186 Y148.424 E.30426
G3 X103.576 Y146.812 I.038 J-1.648 E.04391
G1 X103.577 Y129.335 E.30516
G3 X105.188 Y127.776 I1.647 J.091 E.04302
G1 X122.614 Y127.776 E.30426
G3 X122.917 Y127.812 I-.039 J1.649 E.00534
G1 X123.154 Y127.884 E.00433
M204 S250
G1 X123.086 Y128.293 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.095 Y128.303 E.00021
G3 X123.81 Y129.394 I-.514 J1.117 E.02233
G1 X123.81 Y146.805 E.28272
G3 X122.604 Y148.01 I-1.23 J-.024 E.03059
G1 X105.195 Y148.01 E.28268
G3 X103.99 Y146.804 I.024 J-1.23 E.03059
G1 X103.991 Y129.352 E.28339
G3 X105.196 Y128.19 I1.228 J.068 E.0299
G1 X122.605 Y128.19 E.28268
G3 X122.836 Y128.217 I-.024 J1.23 E.00378
G1 X123.028 Y128.275 E.00327
; WIPE_START
M204 S6000
G1 X123.095 Y128.303 E-.02725
G1 X123.31 Y128.42 E-.09309
G1 X123.489 Y128.578 E-.09092
G1 X123.632 Y128.768 E-.09013
G1 X123.735 Y128.979 E-.08932
G1 X123.787 Y129.164 E-.073
G1 X123.81 Y129.394 E-.08775
G1 X123.81 Y129.942 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.229 Y129.055 Z.6 F42000
G1 X104.145 Y127.641 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.439 Y128.347 I1.005 J1.71 E.01763
G1 X103.252 Y128.294 E.0034
G3 X103.277 Y127.755 I1.78 J-.187 E.00947
M73 P40 R12
G3 X103.693 Y127.453 I.436 J.164 E.0095
G1 X104.093 Y127.453 E.00698
G1 X104.129 Y127.583 E.00235
; WIPE_START
G1 X103.912 Y127.801 E-.11701
G1 X103.747 Y127.949 E-.08416
G1 X103.594 Y128.121 E-.0874
G1 X103.439 Y128.347 E-.10426
G1 X103.252 Y128.294 E-.07395
G1 X103.254 Y127.875 E-.15933
G1 X103.277 Y127.755 E-.04654
G1 X103.332 Y127.646 E-.04646
G1 X103.408 Y127.569 E-.04088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.04 Y127.538 Z.6 F42000
G1 X124.25 Y127.484 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.293 Y127.498 E.00078
G3 X124.547 Y127.885 I-.198 J.406 E.00849
G1 X124.547 Y128.293 E.00712
G1 X124.364 Y128.348 E.00333
G2 X123.65 Y127.638 I-1.815 J1.11 E.01776
G1 X123.704 Y127.453 E.00336
G3 X124.155 Y127.456 I.202 J3.042 E.00788
G1 X124.193 Y127.468 E.00069
; WIPE_START
G1 X124.293 Y127.498 E-.03986
G1 X124.411 Y127.58 E-.05466
G1 X124.514 Y127.732 E-.06977
G1 X124.547 Y127.885 E-.05952
G1 X124.547 Y128.293 E-.1549
G1 X124.364 Y128.348 E-.07247
G1 X124.108 Y128.006 E-.16243
G1 X123.942 Y127.846 E-.08787
G1 X123.816 Y127.756 E-.05852
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.024 Y135.386 Z.6 F42000
G1 X124.363 Y147.849 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.903 E.00336
G3 X124.522 Y148.446 I-1.78 J.188 E.00954
G3 X124.079 Y148.748 I-.439 J-.169 E.00996
G1 X123.705 Y148.748 E.00653
G1 X123.65 Y148.565 E.00333
G2 X124.331 Y147.9 I-1.11 J-1.817 E.01678
; WIPE_START
G1 X124.548 Y147.903 E-.08232
G1 X124.546 Y148.325 E-.16035
G1 X124.522 Y148.446 E-.04705
G1 X124.468 Y148.554 E-.04594
G1 X124.362 Y148.661 E-.05696
G1 X124.238 Y148.724 E-.05305
G1 X124.079 Y148.748 E-.06099
G1 X123.705 Y148.748 E-.14207
G1 X123.65 Y148.565 E-.07246
G1 X123.732 Y148.504 E-.03881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.103 Y148.258 Z.6 F42000
G1 X103.435 Y147.85 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.545 Y148.015 E.00347
G2 X104.151 Y148.563 I2.046 J-1.655 E.01433
G1 X104.097 Y148.748 E.00336
G3 X103.529 Y148.713 I-.188 J-1.581 E.00999
G1 X103.499 Y148.699 E.00057
G3 X103.252 Y148.269 I.214 J-.409 E.00916
G1 X103.252 Y147.905 E.00634
G1 X103.377 Y147.867 E.00228
; WIPE_START
G1 X103.545 Y148.015 E-.0849
G1 X103.692 Y148.194 E-.08799
G1 X103.858 Y148.354 E-.08787
G1 X104.151 Y148.563 E-.1367
G1 X104.097 Y148.748 E-.0732
G1 X103.675 Y148.746 E-.16029
G1 X103.529 Y148.713 E-.05706
G1 X103.499 Y148.699 E-.01238
G1 X103.404 Y148.635 E-.04352
G1 X103.379 Y148.601 E-.0161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.708 Y143.137 Z.6 F42000
G1 X124.376 Y127.07 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.867 I-.282 J.836 E.01852
G1 X124.976 Y148.288 E.35654
G3 X124.088 Y149.176 I-.888 J0 E.02438
G1 X103.712 Y149.176 E.35576
G3 X102.824 Y148.281 I-.001 J-.888 E.02449
G1 X102.824 Y127.912 E.35565
G3 X103.672 Y127.025 I.889 J.001 E.02367
G1 X124.204 Y127.03 E.3585
G3 X124.318 Y127.052 I-.11 J.875 E.00203
M204 S250
G1 X124.488 Y126.671 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.5 Y126.675 E.0002
G3 X125.389 Y127.85 I-.407 J1.231 E.02545
G1 X125.39 Y148.296 E.332
G3 X124.096 Y149.59 I-1.306 J-.012 E.03293
G1 X103.704 Y149.59 E.33112
G3 X102.41 Y148.294 I.012 J-1.306 E.03296
G1 X102.41 Y127.904 E.33109
G3 X103.652 Y126.611 I1.308 J.013 E.03207
G1 X124.252 Y126.619 E.33451
G1 X124.429 Y126.658 E.00295
; WIPE_START
M204 S6000
G1 X124.5 Y126.675 E-.02756
G1 X124.684 Y126.75 E-.07542
G1 X124.817 Y126.828 E-.05859
G1 X125.011 Y126.987 E-.09551
G1 X125.173 Y127.184 E-.09669
G1 X125.288 Y127.399 E-.09285
G1 X125.354 Y127.597 E-.07923
G1 X125.389 Y127.85 E-.09707
G1 X125.389 Y128.211 E-.13708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y127.686 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0942482
G1 F15000
M204 S6000
G3 X124.284 Y127.83 I-.171 J.376 E.00067
G1 X124.312 Y127.884 E.00018
M204 S10000
G1 X124.511 Y128.528 F42000
; LINE_WIDTH: 0.438116
G1 F15000
M204 S6000
G1 X124.56 Y128.839 E.00535
; LINE_WIDTH: 0.403405
G1 X124.58 Y128.999 E.0025
; LINE_WIDTH: 0.345876
G1 X124.599 Y129.375 E.00498
G1 X124.6 Y146.819 E.23056
G1 X124.582 Y147.185 E.00485
; LINE_WIDTH: 0.397187
G1 X124.566 Y147.314 E.00199
; LINE_WIDTH: 0.427467
G1 X124.552 Y147.422 E.0018
; LINE_WIDTH: 0.450209
G3 X124.507 Y147.667 I-4.313 J-.672 E.00437
M204 S10000
G1 X124.313 Y148.313 F42000
; LINE_WIDTH: 0.09383
G1 F15000
M204 S6000
G3 X124.116 Y148.513 I-.378 J-.175 E.00084
M204 S10000
G1 X123.47 Y148.712 F42000
; LINE_WIDTH: 0.437721
G1 F15000
M204 S6000
G3 X123.142 Y148.764 I-1.4 J-7.837 E.00563
; LINE_WIDTH: 0.398283
G1 X122.964 Y148.784 E.00275
; LINE_WIDTH: 0.34643
G1 X122.616 Y148.8 E.00461
G1 X105.014 Y148.796 E.23307
G3 X104.794 Y148.78 I.17 J-3.846 E.00291
; LINE_WIDTH: 0.399664
G1 X104.687 Y148.766 E.00167
; LINE_WIDTH: 0.443124
G1 X104.58 Y148.752 E.00186
G3 X104.333 Y148.707 I.684 J-4.412 E.00432
M204 S10000
G1 X103.687 Y148.513 F42000
; LINE_WIDTH: 0.0940996
G1 F15000
M204 S6000
G1 X103.616 Y148.474 E.00024
G3 X103.487 Y148.316 I.267 J-.35 E.00061
M204 S10000
G1 X103.288 Y147.67 F42000
; LINE_WIDTH: 0.43759
G1 F15000
M204 S6000
G1 X103.238 Y147.353 E.00545
; LINE_WIDTH: 0.396739
G1 X103.214 Y147.133 E.00337
; LINE_WIDTH: 0.346452
G1 X103.2 Y146.816 E.0042
G1 X103.201 Y129.312 E.23177
; LINE_WIDTH: 0.367827
G1 X103.226 Y128.944 E.00521
; LINE_WIDTH: 0.42011
G1 X103.249 Y128.772 E.00281
; LINE_WIDTH: 0.451319
G1 X103.293 Y128.529 E.00434
M204 S10000
G1 X103.488 Y127.889 F42000
; LINE_WIDTH: 0.0932477
G1 F15000
M204 S6000
G3 X103.69 Y127.688 I.316 J.115 E.00086
M204 S10000
G1 X104.326 Y127.492 F42000
; LINE_WIDTH: 0.440603
G1 F15000
M204 S6000
G1 X104.627 Y127.441 E.00521
; LINE_WIDTH: 0.403914
G1 X104.807 Y127.419 E.00283
; LINE_WIDTH: 0.345385
G1 X105.184 Y127.401 E.00498
G1 X122.619 Y127.4 E.2301
G1 X122.985 Y127.418 E.00484
; LINE_WIDTH: 0.39619
G1 X123.113 Y127.434 E.00197
; LINE_WIDTH: 0.426231
G1 X123.22 Y127.448 E.00178
; LINE_WIDTH: 0.449292
G3 X123.469 Y127.494 I-.68 J4.387 E.00441
; OBJECT_ID: 66
; WIPE_START
G1 X123.22 Y127.448 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.463 Y119.819 Z.6 F42000
G1 X123.814 Y108.825 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X123.929 Y109.126 I-.278 J.279 E.0058
G1 X123.929 Y121.474 E.21559
G3 X123.512 Y121.89 I-.395 J.021 E.01161
G1 X111.165 Y121.89 E.21559
G3 X110.748 Y121.474 I-.021 J-.395 E.01161
G1 X110.748 Y109.126 E.21559
G3 X111.165 Y108.71 I.395 J-.021 E.0116
G1 X123.523 Y108.711 E.21578
G3 X123.768 Y108.786 I.013 J.393 E.00455
M204 S10000
G1 X124.121 Y108.517 F42000
G1 F6000
M204 S6000
G3 X124.358 Y109.105 I-.568 J.57 E.01137
G1 X124.358 Y121.495 E.21633
G3 X123.533 Y122.319 I-.811 J.014 E.02271
G1 X111.144 Y122.319 E.21633
G3 X110.32 Y121.495 I-.014 J-.811 E.02271
G1 X110.32 Y109.105 E.21633
G3 X111.144 Y108.281 I.811 J-.014 E.02271
G1 X123.544 Y108.282 E.21652
G3 X124.077 Y108.476 I.009 J.805 E.01012
M204 S250
G1 X124.416 Y108.221 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.416 Y108.223 E.00003
G3 X124.771 Y109.085 I-.856 J.857 E.01554
G1 X124.771 Y121.515 E.20184
G3 X123.554 Y122.732 I-1.213 J.005 E.03108
G1 X111.123 Y122.732 E.20184
G3 X109.906 Y121.515 I-.005 J-1.213 E.03108
G1 X109.906 Y109.085 E.20184
G3 X111.123 Y107.868 I1.213 J-.005 E.03108
G1 X123.565 Y107.869 E.20202
G3 X124.233 Y108.073 I-.005 J1.212 E.01151
G1 X124.37 Y108.184 E.00285
; WIPE_START
M204 S6000
G1 X124.416 Y108.223 E-.02307
G1 X124.567 Y108.405 E-.08981
G1 X124.678 Y108.613 E-.08982
G1 X124.747 Y108.839 E-.08984
G1 X124.771 Y109.085 E-.09376
G1 X124.771 Y110.068 E-.37371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.171 Y109.369 Z.6 F42000
G1 X111.866 Y108.882 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42184
G1 F15000
M204 S6000
G1 X111.1 Y109.649 E.01769
G1 X111.1 Y110.215 E.00924
G1 X112.253 Y109.061 E.02661
G1 X112.819 Y109.061 E.00924
G1 X111.1 Y110.781 E.03967
G1 X111.1 Y111.347 E.00924
G1 X113.386 Y109.061 E.05274
G1 X113.952 Y109.061 E.00924
G1 X111.1 Y111.913 E.0658
G1 X111.1 Y112.48 E.00924
G1 X114.518 Y109.061 E.07886
G1 X115.084 Y109.061 E.00924
G1 X111.1 Y113.046 E.09192
G1 X111.1 Y113.612 E.00924
G1 X115.65 Y109.061 E.10498
G1 X116.216 Y109.062 E.00924
G1 X111.1 Y114.178 E.11804
G1 X111.1 Y114.745 E.00924
G1 X116.783 Y109.062 E.1311
G1 X117.349 Y109.062 E.00924
G1 X111.1 Y115.311 E.14417
G1 X111.1 Y115.877 E.00924
G1 X117.915 Y109.062 E.15723
G1 X118.481 Y109.062 E.00924
G1 X111.1 Y116.443 E.17029
G1 X111.1 Y117.009 E.00924
G1 X119.047 Y109.062 E.18335
G1 X119.614 Y109.062 E.00924
G1 X111.1 Y117.576 E.19641
G1 X111.1 Y118.142 E.00924
G1 X120.18 Y109.062 E.20947
G1 X120.746 Y109.062 E.00924
G1 X111.1 Y118.708 E.22254
G1 X111.1 Y119.274 E.00924
G1 X121.312 Y109.062 E.2356
G1 X121.878 Y109.062 E.00924
G1 X111.1 Y119.841 E.24866
G1 X111.1 Y120.407 E.00924
G1 X122.444 Y109.062 E.26172
G1 X123.011 Y109.062 E.00924
G1 X111.1 Y120.973 E.27478
G1 X111.114 Y121.525 E.00901
G1 X123.564 Y109.075 E.28722
G1 X123.578 Y109.628 E.00901
G1 X111.666 Y121.539 E.2748
G1 X112.232 Y121.539 E.00924
G1 X123.578 Y110.194 E.26173
G1 X123.578 Y110.76 E.00924
G1 X112.799 Y121.539 E.24867
G1 X113.365 Y121.539 E.00924
G1 X123.578 Y111.326 E.23561
G1 X123.578 Y111.892 E.00924
G1 X113.931 Y121.539 E.22254
G1 X114.497 Y121.539 E.00924
G1 X123.578 Y112.459 E.20948
G1 X123.578 Y113.025 E.00924
G1 X115.064 Y121.539 E.19642
G1 X115.63 Y121.539 E.00924
G1 X123.578 Y113.591 E.18336
G1 X123.578 Y114.157 E.00924
G1 X116.196 Y121.539 E.17029
G1 X116.762 Y121.539 E.00924
G1 X123.578 Y114.724 E.15723
G1 X123.578 Y115.29 E.00924
G1 X117.328 Y121.539 E.14417
G1 X117.895 Y121.539 E.00924
G1 X123.578 Y115.856 E.13111
G1 X123.578 Y116.422 E.00924
G1 X118.461 Y121.539 E.11804
G1 X119.027 Y121.539 E.00924
G1 X123.578 Y116.988 E.10498
G1 X123.578 Y117.555 E.00924
G1 X119.593 Y121.539 E.09192
G1 X120.16 Y121.539 E.00924
G1 X123.578 Y118.121 E.07885
G1 X123.578 Y118.687 E.00924
G1 X120.726 Y121.539 E.06579
G1 X121.292 Y121.539 E.00924
G1 X123.578 Y119.253 E.05273
G1 X123.578 Y119.82 E.00924
G1 X121.858 Y121.539 E.03967
G1 X122.424 Y121.539 E.00924
G1 X123.578 Y120.386 E.0266
G1 X123.578 Y120.952 E.00924
G1 X122.811 Y121.718 E.01768
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.578 Y120.952 E-.4118
G1 X123.578 Y120.386 E-.21517
G1 X123.33 Y120.633 E-.13304
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 3/53
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.822 J.897 P1  F42000
G1 X148.802 Y143.96 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z.7 F42000
G1 X151.648 Y132.298 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P41 R12
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.746 Y148.04 E.20495
G1 X152.72 Y148.201 E.00284
G3 X151.979 Y148.748 I-.721 J-.201 E.01732
G1 X129.411 Y148.748 E.39405
G3 X128.653 Y148.029 I-.002 J-.756 E.02013
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.752 J-.016 E.02016
G1 X130.998 Y124.653 E.02858
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.019 Y124.653 I.793 J41.123 E.02823
G1 X152.107 Y124.66 E.00154
G3 X152.747 Y125.371 I-.11 J.743 E.0181
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.0192
G1 X153.174 Y148.057 E.21273
G3 X151.988 Y149.176 I-1.175 J-.057 E.03147
G1 X129.406 Y149.176 E.39428
G3 X128.225 Y148.046 I.005 J-1.188 E.03149
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.12771
G3 X129.348 Y124.225 I1.183 J-.006 E.03153
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G3 X152.04 Y124.224 I1.01 J52.672 E.03608
G3 X153.175 Y125.354 I-.052 J1.187 E.03068
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.588 Y148.074 E.20482
G3 X151.996 Y149.59 I-1.589 J-.075 E.03941
G1 X129.402 Y149.59 E.36688
G3 X127.811 Y148.062 I.012 J-1.604 E.03948
G1 X127.81 Y135.46 E.20464
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.598 J.004 E.03953
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G3 X152.06 Y123.811 I1.219 J63.424 E.0406
G3 X153.589 Y125.338 I-.075 J1.604 E.03847
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z0.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; object ids of this layer3 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.137 Y147.139 E.33895
G1 X151.138 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01021
G1 X150.411 Y145.017 E.12322
G3 X150.296 Y145.571 I-1.394 J0 E.00925
G1 X150.002 Y146.003 E.00849
G1 X149.57 Y146.297 E.00848
G3 X149.016 Y146.411 I-.553 J-1.28 E.00924
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.331 I-327.052 J2.216 E.08563
G1 X150.013 Y145.017 E.1254
G1 X149.931 Y145.412 E.0066
G1 X149.72 Y145.721 E.0061
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y128.184 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.016 Y128.184 E.20813
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27008
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00247
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X136.139 Y128.184 E.06097
M204 S10000
G1 X136.199 Y127.786 F42000
G1 F15000
M204 S6000
G1 X149.016 Y127.786 E.20813
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27008
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01115
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X136.139 Y127.786 E.06097
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
M73 P42 R12
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X151.234 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.488 E.10387
G1 X152.262 Y125.204 E.00475
G1 X152.096 Y125.086 E.0033
G2 X150.816 Y125.066 I-1.003 J22.998 E.0208
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.392 Y125.067 E.01936
G1 X129.189 Y125.151 E.00357
G1 X129.076 Y125.38 E.00416
G1 X129.066 Y131.884 E.10561
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.516 E.07198
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18316
G1 X129.152 Y148.213 E.0038
G1 X129.382 Y148.324 E.00414
G1 X129.476 Y148.334 E.00155
G1 X151.948 Y148.334 E.36488
G1 X152.133 Y148.298 E.00306
G1 X152.256 Y148.199 E.00256
G1 X152.332 Y147.909 E.00488
G1 X152.334 Y136.716 E.18175
G1 X151.434 Y136.716 E.01462
G1 X151.275 Y136.637 E.00287
G1 X151.254 Y136.573 E.00109
M204 S10000
G1 X150.836 Y136.516 F42000
G1 F15000
M204 S6000
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.935 Y125.488 E.09739
G2 X151.083 Y125.464 I-.703 J10.045 E.01384
G1 X151.02 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01383
G2 X129.464 Y131.486 I941.835 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.516 E.07198
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.934 E.17569
G1 X151.909 Y147.936 E.36443
G1 X151.934 Y147.908 E.0006
G1 X151.936 Y137.114 E.17528
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.00371
G1 X150.958 Y136.878 E.00514
G1 X150.855 Y136.573 E.00523
M204 S10000
G1 X150.431 Y136.516 F42000
; LINE_WIDTH: 0.421553
G1 F15000
M204 S6000
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.306 Y125.863 E.00376
G1 X151.289 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.959 Y136.69 E.0751
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.535 Y147.537 E.35327
G1 X151.537 Y137.513 E.16342
G1 X151.06 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.434 Y136.576 E.00186
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.349982
G1 F15000
M204 S6000
G1 X150.763 Y145.263 E.09525
M204 S10000
G1 X150.761 Y145.323 F42000
; LINE_WIDTH: 0.394203
G1 F15000
M204 S6000
G1 X150.738 Y145.463 E.00215
; LINE_WIDTH: 0.43141
G1 X150.715 Y145.603 E.00237
; LINE_WIDTH: 0.485474
G1 X150.693 Y145.743 E.00268
G1 X150.307 Y146.309 E.01295
G1 X149.741 Y146.693 E.01293
; LINE_WIDTH: 0.46889
G1 X149.602 Y146.716 E.00258
; LINE_WIDTH: 0.43223
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39557
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.43223
G1 X149.604 Y146.725 E.00237
; LINE_WIDTH: 0.485961
G1 X149.744 Y146.707 E.00268
G1 X150.705 Y146.707 E.01818
G1 X150.705 Y145.745 E.0182
; LINE_WIDTH: 0.468617
G1 X150.721 Y145.624 E.00222
; LINE_WIDTH: 0.43141
G1 X150.737 Y145.503 E.00204
; LINE_WIDTH: 0.394203
G1 X150.753 Y145.382 E.00185
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 77
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X130.553 Y140.209 Z.7 F42000
G1 X123.279 Y127.931 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.546 Y128.088 E.00541
G3 X124.224 Y129.388 I-.963 J1.329 E.02653
G1 X124.224 Y146.812 E.30423
G3 X122.612 Y148.424 I-1.642 J-.03 E.04398
G1 X105.188 Y148.424 E.30423
G3 X103.576 Y146.812 I.029 J-1.641 E.04399
G1 X103.577 Y129.336 E.30513
G3 X105.188 Y127.776 I1.635 J.077 E.04313
G1 X122.612 Y127.776 E.30423
G3 X123.224 Y127.907 I-.029 J1.641 E.01099
M204 S250
G1 X123.078 Y128.29 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.307 Y128.424 E.00431
G3 X123.81 Y129.396 I-.72 J.989 E.01842
G1 X123.81 Y146.804 E.28268
G3 X122.604 Y148.01 I-1.224 J-.018 E.03063
G1 X105.196 Y148.01 E.28268
G3 X103.99 Y146.804 I.018 J-1.224 E.03064
G1 X103.991 Y129.353 E.28338
G3 X105.196 Y128.19 I1.219 J.057 E.02997
G1 X122.604 Y128.19 E.28268
G3 X123.021 Y128.27 I-.018 J1.224 E.00693
; WIPE_START
M204 S6000
G1 X123.307 Y128.424 E-.12318
G1 X123.487 Y128.577 E-.0899
G1 X123.606 Y128.728 E-.07303
G1 X123.718 Y128.937 E-.09008
G1 X123.787 Y129.166 E-.09095
G1 X123.81 Y129.396 E-.08782
G1 X123.81 Y129.935 E-.20505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.229 Y129.051 Z.7 F42000
G1 X104.145 Y127.64 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.439 Y128.347 I1.19 J1.895 E.01759
G1 X103.252 Y128.294 E.0034
G3 X103.277 Y127.755 I1.784 J-.187 E.00946
G3 X103.683 Y127.453 I.43 J.154 E.00935
G1 X104.093 Y127.453 E.00716
G1 X104.129 Y127.583 E.00235
; WIPE_START
G1 X103.874 Y127.832 E-.13537
G1 X103.748 Y127.948 E-.06524
G1 X103.632 Y128.074 E-.06526
G1 X103.439 Y128.347 E-.12683
G1 X103.252 Y128.294 E-.07395
G1 X103.254 Y127.875 E-.1593
G1 X103.277 Y127.755 E-.0465
G1 X103.34 Y127.636 E-.051
G1 X103.408 Y127.569 E-.03654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.041 Y127.537 Z.7 F42000
G1 X124.243 Y127.482 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.293 Y127.497 E.00092
G3 X124.547 Y127.883 I-.194 J.404 E.00846
G1 X124.547 Y128.292 E.00716
G1 X124.36 Y128.345 E.0034
G2 X123.65 Y127.638 I-1.966 J1.262 E.01763
G1 X123.704 Y127.453 E.00336
G3 X124.156 Y127.457 I.2 J3.182 E.00791
G1 X124.185 Y127.465 E.00053
; WIPE_START
G1 X124.293 Y127.497 E-.04283
G1 X124.44 Y127.61 E-.0702
G1 X124.528 Y127.772 E-.07007
G1 X124.547 Y127.883 E-.04273
G1 X124.547 Y128.292 E-.15576
G1 X124.36 Y128.345 E-.07395
G1 X124.101 Y127.999 E-.16446
G1 X123.941 Y127.845 E-.08403
G1 X123.821 Y127.76 E-.05597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.026 Y135.389 Z.7 F42000
G1 X124.361 Y147.853 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.906 E.0034
G3 X124.513 Y148.471 I-1.576 J.187 E.00994
G3 X124.069 Y148.748 I-.424 J-.186 E.00972
G1 X123.706 Y148.748 E.00634
G1 X123.649 Y148.568 E.0033
G2 X124.329 Y147.904 I-1.131 J-1.837 E.01673
; WIPE_START
G1 X124.548 Y147.906 E-.08331
G1 X124.546 Y148.325 E-.1593
G1 X124.513 Y148.471 E-.05694
G1 X124.448 Y148.58 E-.04814
G1 X124.342 Y148.676 E-.05433
G1 X124.214 Y148.732 E-.0531
G1 X124.069 Y148.748 E-.05566
G1 X123.706 Y148.748 E-.13794
G1 X123.649 Y148.568 E-.07171
G1 X123.732 Y148.505 E-.03959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.104 Y148.26 Z.7 F42000
G1 X103.439 Y147.853 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.493 Y147.94 E.00179
G2 X104.151 Y148.563 I1.758 J-1.199 E.01594
G1 X104.097 Y148.748 E.00336
G3 X103.53 Y148.713 I-.188 J-1.566 E.00997
G3 X103.252 Y148.279 I.18 J-.422 E.00956
G1 X103.252 Y147.906 E.00652
G1 X103.382 Y147.869 E.00235
; WIPE_START
G1 X103.493 Y147.94 E-.05024
G1 X103.699 Y148.201 E-.12649
G1 X103.859 Y148.355 E-.08403
G1 X104.151 Y148.563 E-.13646
G1 X104.097 Y148.748 E-.0732
G1 X103.675 Y148.746 E-.16037
G1 X103.53 Y148.713 E-.05642
G1 X103.397 Y148.628 E-.06009
G1 X103.376 Y148.602 E-.0127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.703 Y143.135 Z.7 F42000
G1 X124.363 Y127.065 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.866 I-.264 J.837 E.01876
G1 X124.976 Y148.288 E.35657
G3 X124.081 Y149.176 I-.884 J.005 E.02453
G1 X103.712 Y149.176 E.35565
G3 X102.824 Y148.288 I.006 J-.895 E.02434
G1 X102.824 Y127.912 E.35576
G3 X103.666 Y127.025 I.889 J0 E.02356
G1 X124.205 Y127.03 E.35863
G3 X124.305 Y127.049 I-.107 J.871 E.00177
M204 S250
G1 X124.486 Y126.67 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.683 Y126.75 E.00346
G3 X125.389 Y127.85 I-.586 J1.152 E.02223
G1 X125.39 Y148.296 E.33201
G3 X124.094 Y149.59 I-1.3 J-.006 E.033
G1 X103.704 Y149.59 E.33109
G3 X102.41 Y148.296 I.019 J-1.313 E.03288
G1 X102.41 Y127.904 E.33112
G3 X103.65 Y126.611 I1.307 J.013 E.03204
G1 X124.252 Y126.619 E.33455
G3 X124.429 Y126.653 I-.155 J1.284 E.00292
; WIPE_START
M204 S6000
G1 X124.683 Y126.75 E-.10364
G1 X124.939 Y126.921 E-.11668
G1 X125.081 Y127.062 E-.07616
G1 X125.199 Y127.224 E-.07615
G1 X125.327 Y127.503 E-.11676
G1 X125.389 Y127.85 E-.13358
G1 X125.389 Y128.21 E-.13702
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y127.685 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0942153
G1 F15000
M204 S6000
G3 X124.277 Y127.82 I-.18 J.388 E.00064
G1 X124.312 Y127.885 E.00022
M204 S10000
G1 X124.508 Y128.526 F42000
; LINE_WIDTH: 0.440597
G1 F15000
M204 S6000
G1 X124.559 Y128.827 E.00521
; LINE_WIDTH: 0.403909
G1 X124.581 Y129.007 E.00283
; LINE_WIDTH: 0.345854
G1 X124.599 Y129.384 E.00498
G1 X124.6 Y146.816 E.2304
G1 X124.582 Y147.184 E.00486
; LINE_WIDTH: 0.396359
G1 X124.567 Y147.309 E.00193
; LINE_WIDTH: 0.425707
G1 X124.553 Y147.413 E.00173
; LINE_WIDTH: 0.4491
G3 X124.508 Y147.672 I-5.215 J-.789 E.00457
M204 S10000
G1 X124.313 Y148.313 F42000
; LINE_WIDTH: 0.0945084
G1 F15000
M204 S6000
G3 X124.115 Y148.512 I-.337 J-.138 E.00086
M204 S10000
G1 X123.47 Y148.712 F42000
; LINE_WIDTH: 0.43799
G1 F15000
M204 S6000
G1 X123.145 Y148.763 E.00557
; LINE_WIDTH: 0.399639
G1 X122.975 Y148.783 E.00264
; LINE_WIDTH: 0.34645
G1 X122.616 Y148.8 E.00476
G1 X105.024 Y148.797 E.23294
G3 X104.795 Y148.78 I.164 J-3.901 E.00304
; LINE_WIDTH: 0.399034
G1 X104.691 Y148.767 E.00161
; LINE_WIDTH: 0.442001
G1 X104.587 Y148.753 E.0018
G3 X104.332 Y148.708 I.794 J-5.243 E.00444
M204 S10000
G1 X103.687 Y148.513 F42000
; LINE_WIDTH: 0.0941473
G1 F15000
M204 S6000
G3 X103.488 Y148.314 I.152 J-.352 E.00085
M204 S10000
G1 X103.291 Y147.672 F42000
; LINE_WIDTH: 0.441365
M73 P42 R11
G1 F15000
M204 S6000
G1 X103.241 Y147.373 E.00518
; LINE_WIDTH: 0.405059
G1 X103.219 Y147.193 E.00284
; LINE_WIDTH: 0.346927
G1 X103.2 Y146.816 E.005
G1 X103.2 Y129.328 E.2319
G1 X103.223 Y128.969 E.00478
; LINE_WIDTH: 0.415945
G1 X103.247 Y128.784 E.00299
; LINE_WIDTH: 0.449538
G3 X103.292 Y128.528 I5.51 J.843 E.00453
M204 S10000
G1 X103.488 Y127.887 F42000
; LINE_WIDTH: 0.0941193
G1 F15000
M204 S6000
G3 X103.686 Y127.687 I.331 J.131 E.00086
M204 S10000
G1 X104.327 Y127.493 F42000
; LINE_WIDTH: 0.441573
G1 F15000
M204 S6000
G3 X104.587 Y127.447 I1.079 J5.355 E.00453
G1 X104.691 Y127.434 E.0018
; LINE_WIDTH: 0.397856
G1 X104.795 Y127.42 E.00161
; LINE_WIDTH: 0.345483
G3 X105.025 Y127.404 I.395 J3.907 E.00304
G1 X122.616 Y127.4 E.23224
G1 X122.984 Y127.418 E.00486
; LINE_WIDTH: 0.395634
G1 X123.109 Y127.434 E.00192
; LINE_WIDTH: 0.42492
G1 X123.213 Y127.447 E.00172
; LINE_WIDTH: 0.448002
G3 X123.469 Y127.492 I-.783 J5.177 E.00452
; OBJECT_ID: 66
; WIPE_START
G1 X123.213 Y127.447 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.469 Y119.819 Z.7 F42000
G1 X123.839 Y108.8 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X123.957 Y109.109 I-.284 J.287 E.00596
G1 X123.957 Y121.491 E.21618
G3 X123.529 Y121.919 I-.407 J.021 E.01191
G1 X111.148 Y121.919 E.21618
G3 X110.72 Y121.491 I-.021 J-.407 E.01191
G1 X110.72 Y109.109 E.21618
G3 X111.148 Y108.681 I.407 J-.021 E.01191
G1 X123.548 Y108.683 E.2165
G3 X123.793 Y108.761 I.007 J.404 E.00457
M204 S10000
G1 X124.145 Y108.494 F42000
G1 F6000
M204 S6000
G3 X124.386 Y109.088 I-.579 J.581 E.01151
G1 X124.386 Y121.512 E.21692
G3 X123.55 Y122.347 I-.822 J.014 E.02302
G1 X111.127 Y122.347 E.21692
G3 X110.291 Y121.512 I-.014 J-.822 E.02302
G1 X110.291 Y109.088 E.21692
G3 X111.127 Y108.253 I.822 J-.014 E.02302
G1 X123.569 Y108.255 E.21724
G3 X124.101 Y108.453 I-.003 J.82 E.01013
M204 S250
G1 X124.44 Y108.195 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.441 Y108.198 E.00005
G3 X124.799 Y109.068 I-.863 J.865 E.01568
G1 X124.799 Y121.532 E.20239
G3 X123.571 Y122.761 I-1.224 J.004 E.03137
G1 X111.107 Y122.761 E.20239
G3 X109.878 Y121.532 I-.004 J-1.224 E.03137
G1 X109.878 Y109.068 E.20239
G3 X111.106 Y107.839 I1.224 J-.004 E.03137
G1 X123.589 Y107.841 E.20269
G3 X124.256 Y108.047 I-.012 J1.222 E.0115
G1 X124.393 Y108.157 E.00285
; WIPE_START
M204 S6000
G1 X124.441 Y108.198 E-.02376
G1 X124.593 Y108.381 E-.09061
G1 X124.706 Y108.592 E-.09067
G1 X124.775 Y108.82 E-.09069
G1 X124.799 Y109.068 E-.09461
G1 X124.799 Y110.041 E-.36966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.785 Y109.809 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42341
M73 P43 R11
G1 F15000
M204 S6000
G1 X123.011 Y109.035 E.01794
G1 X122.442 Y109.034 E.00931
G1 X123.606 Y110.198 E.02695
G1 X123.606 Y110.767 E.00931
G1 X121.874 Y109.034 E.04012
G1 X121.305 Y109.034 E.00931
G1 X123.606 Y111.335 E.05329
G1 X123.606 Y111.903 E.00931
G1 X120.737 Y109.034 E.06645
G1 X120.168 Y109.034 E.00931
G1 X123.606 Y112.472 E.07962
G1 X123.606 Y113.04 E.00931
G1 X119.6 Y109.034 E.09279
G1 X119.031 Y109.034 E.00931
G1 X123.606 Y113.609 E.10596
G1 X123.606 Y114.177 E.00931
G1 X118.463 Y109.034 E.11912
G1 X117.894 Y109.034 E.00931
G1 X123.606 Y114.746 E.13229
G1 X123.606 Y115.314 E.00931
G1 X117.325 Y109.034 E.14546
G1 X116.757 Y109.034 E.00931
G1 X123.606 Y115.883 E.15863
G1 X123.606 Y116.451 E.00931
G1 X116.188 Y109.034 E.17179
G1 X115.62 Y109.033 E.00931
G1 X123.606 Y117.019 E.18496
G1 X123.606 Y117.588 E.00931
G1 X115.051 Y109.033 E.19813
G1 X114.483 Y109.033 E.00931
G1 X123.606 Y118.156 E.21129
G1 X123.606 Y118.725 E.00931
G1 X113.914 Y109.033 E.22446
G1 X113.346 Y109.033 E.00931
G1 X123.606 Y119.293 E.23763
G1 X123.606 Y119.862 E.00931
G1 X112.777 Y109.033 E.2508
G1 X112.209 Y109.033 E.00931
G1 X123.606 Y120.43 E.26396
G1 X123.606 Y120.999 E.00931
G1 X111.64 Y109.033 E.27713
G1 X111.178 Y109.033 E.00757
G1 X111.087 Y109.048 E.00151
G1 X123.59 Y121.552 E.28957
G1 X123.499 Y121.567 E.00151
G1 X123.038 Y121.567 E.00756
G1 X111.071 Y109.601 E.27714
G1 X111.071 Y110.169 E.00931
G1 X122.469 Y121.567 E.26398
G1 X121.901 Y121.567 E.00931
G1 X111.071 Y110.738 E.25081
G1 X111.071 Y111.306 E.00931
G1 X121.332 Y121.567 E.23765
G1 X120.764 Y121.567 E.00931
G1 X111.071 Y111.875 E.22448
G1 X111.071 Y112.443 E.00931
G1 X120.195 Y121.567 E.21132
G1 X119.627 Y121.567 E.00931
G1 X111.071 Y113.012 E.19815
G1 X111.071 Y113.58 E.00931
G1 X119.059 Y121.567 E.18499
G1 X118.49 Y121.567 E.00931
G1 X111.071 Y114.149 E.17182
G1 X111.071 Y114.717 E.00931
G1 X117.922 Y121.567 E.15866
G1 X117.353 Y121.567 E.00931
G1 X111.071 Y115.285 E.14549
G1 X111.071 Y115.854 E.00931
G1 X116.785 Y121.567 E.13232
G1 X116.216 Y121.567 E.00931
G1 X111.071 Y116.422 E.11916
G1 X111.071 Y116.991 E.00931
G1 X115.648 Y121.567 E.10599
G1 X115.079 Y121.567 E.00931
G1 X111.071 Y117.559 E.09283
G1 X111.071 Y118.128 E.00931
G1 X114.511 Y121.567 E.07966
G1 X113.943 Y121.567 E.00931
G1 X111.071 Y118.696 E.0665
G1 X111.071 Y119.265 E.00931
G1 X113.374 Y121.567 E.05333
G1 X112.806 Y121.567 E.00931
G1 X111.071 Y119.833 E.04017
G1 X111.071 Y120.401 E.00931
G1 X112.237 Y121.567 E.027
G1 X111.669 Y121.567 E.00931
G1 X110.892 Y120.791 E.01799
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.669 Y121.567 E-.41741
G1 X112.237 Y121.567 E-.21601
G1 X112.002 Y121.332 E-.12658
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 4/53
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S196.35
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I-.637 J1.037 P1  F42000
G1 X148.802 Y143.96 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z.8 F42000
G1 X151.648 Y132.298 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.74 Y148.107 E.20611
G3 X151.979 Y148.748 I-.744 J-.111 E.01898
G1 X129.421 Y148.748 E.39387
G3 X128.653 Y148.039 I-.013 J-.756 E.02014
G1 X128.652 Y136.302 E.20494
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.756 J-.013 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G1 X151.979 Y124.652 E.02753
G3 X152.747 Y125.371 I.018 J.75 E.02035
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.0192
G1 X153.174 Y148.062 E.21281
G3 X151.988 Y149.176 I-1.179 J-.066 E.03136
G1 X129.412 Y149.176 E.39417
G3 X128.225 Y148.052 I-.003 J-1.186 E.0315
G1 X128.224 Y135.873 E.21264
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.1277
G3 X129.348 Y124.225 I1.187 J-.002 E.0315
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.988 Y124.223 E.03516
G3 X153.175 Y125.354 I.009 J1.179 E.03166
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.588 Y148.079 E.2049
G3 X151.996 Y149.59 I-1.594 J-.085 E.0393
G1 X129.404 Y149.59 E.36684
G3 X127.811 Y148.064 I.007 J-1.602 E.0395
G1 X127.81 Y135.46 E.20467
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12562
G3 X129.335 Y123.811 I1.603 J.008 E.03949
G1 X131.84 Y123.81 E.04067
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.996 Y123.81 E.03955
G3 X153.589 Y125.338 I.001 J1.593 E.03959
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z0.8
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer4 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X149.169 Y144.156 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X149.169 Y142.442 E.02993
G2 X149.804 Y141.528 I-.906 J-1.308 E.01985
G1 X149.713 Y140.838 E.01215
G1 X149.32 Y140.149 E.01386
G1 X149.169 Y140.017 E.00351
G1 X149.169 Y136.924 E.054
G2 X149.804 Y136.01 I-.906 J-1.308 E.01985
G1 X149.713 Y135.321 E.01215
G1 X149.32 Y134.631 E.01386
G1 X149.169 Y134.499 E.00351
M73 P44 R11
G1 X149.169 Y131.406 E.054
G2 X149.804 Y130.493 I-.906 J-1.308 E.01985
G1 X149.713 Y129.803 E.01215
G1 X149.32 Y129.113 E.01386
G1 X149.169 Y128.982 E.00351
G1 X149.169 Y128.231 E.0131
G1 X148.37 Y128.231 E.01394
G3 X148.149 Y127.734 I.461 J-.503 E.00978
G1 X148.24 Y127.044 E.01215
G1 X148.633 Y126.355 E.01386
G2 X149.708 Y125.319 I-3.039 J-4.229 E.02616
G1 X150.769 Y125.319 E.01852
G1 X150.769 Y125.019 E.00524
G1 X152.017 Y125.029 E.02181
G2 X151.004 Y126.01 I2.336 J3.426 E.02474
G1 X150.908 Y126.355 E.00625
G1 X150.998 Y127.044 E.01215
G1 X151.392 Y127.734 E.01386
G3 X152.381 Y128.664 I-2.199 J3.331 E.02382
G1 X152.381 Y129.963 E.02269
G1 X152.079 Y130.493 E.01064
G2 X151.004 Y131.527 I2.46 J3.631 E.02617
G1 X150.908 Y131.872 E.00625
G2 X151.281 Y133.058 I1.642 J.134 E.02227
G1 X151.281 Y136.669 E.06303
G1 X151.322 Y136.669 E.00071
G2 X150.908 Y137.39 I1.028 J1.071 E.01472
G1 X150.998 Y138.079 E.01215
G1 X151.392 Y138.769 E.01386
G3 X152.381 Y139.699 I-2.2 J3.331 E.02382
G1 X152.38 Y140.999 E.0227
G1 X152.079 Y141.528 E.01063
G2 X151.004 Y142.563 I2.461 J3.631 E.02617
G1 X150.908 Y142.907 E.00625
G1 X150.998 Y143.597 E.01215
G1 X151.392 Y144.287 E.01386
G3 X152.38 Y145.215 I-2.196 J3.327 E.02379
G1 X152.379 Y146.519 E.02276
G1 X152.079 Y147.046 E.01059
G2 X151.004 Y148.08 I2.46 J3.631 E.02617
G1 X150.92 Y148.381 E.00546
G1 X148.683 Y148.381 E.03906
G2 X149.707 Y147.39 I-2.36 J-3.464 E.02501
G1 X149.804 Y147.046 E.00625
G1 X149.713 Y146.356 E.01215
G2 X148.748 Y145.169 I-2.177 J.784 E.02723
G1 X146.824 Y145.169 E.03359
G3 X147.045 Y145.666 I-.461 J.504 E.00978
G1 X146.955 Y146.356 E.01215
G1 X146.561 Y147.046 E.01386
G2 X145.487 Y148.08 I2.461 J3.631 E.02617
G1 X145.402 Y148.381 E.00546
G1 X143.165 Y148.381 E.03906
G2 X144.19 Y147.39 I-2.359 J-3.464 E.02501
G1 X144.287 Y147.046 E.00625
G1 X144.196 Y146.356 E.01215
G2 X143.23 Y145.169 I-2.177 J.784 E.02723
G1 X141.306 Y145.169 E.03359
G3 X141.528 Y145.666 I-.461 J.503 E.00978
G1 X141.437 Y146.356 E.01215
G1 X141.044 Y147.046 E.01386
G2 X139.969 Y148.08 I2.46 J3.631 E.02617
G1 X139.885 Y148.381 E.00546
G1 X137.648 Y148.381 E.03906
G2 X138.672 Y147.39 I-2.359 J-3.464 E.02501
G1 X138.769 Y147.046 E.00625
G1 X138.678 Y146.356 E.01215
G2 X137.713 Y145.169 I-2.177 J.784 E.02723
G1 X135.789 Y145.169 E.03359
G3 X136.01 Y145.666 I-.461 J.504 E.00978
G1 X135.919 Y146.356 E.01215
G1 X135.526 Y147.046 E.01386
G2 X134.452 Y148.08 I2.46 J3.631 E.02617
G1 X134.367 Y148.381 E.00546
G1 X132.13 Y148.381 E.03906
G2 X133.155 Y147.39 I-2.36 J-3.464 E.02501
G1 X133.251 Y147.046 E.00625
G1 X133.16 Y146.356 E.01215
G1 X132.767 Y145.666 E.01386
G3 X131.693 Y144.632 I2.46 J-3.631 E.02617
G1 X131.596 Y144.287 E.00625
G1 X131.687 Y143.597 E.01215
G1 X132.08 Y142.907 E.01386
G1 X132.231 Y142.776 E.0035
G1 X132.231 Y139.683 E.05401
G3 X131.596 Y138.769 I.906 J-1.308 E.01985
G1 X131.687 Y138.079 E.01215
G1 X132.08 Y137.39 E.01386
G1 X132.231 Y137.258 E.0035
G1 X132.231 Y134.165 E.05401
G3 X131.596 Y133.252 I.906 J-1.308 E.01985
G1 X131.687 Y132.562 E.01215
G1 X132.08 Y131.872 E.01386
G1 X132.231 Y131.741 E.0035
G1 X132.231 Y128.647 E.05401
G3 X131.596 Y127.734 I.906 J-1.308 E.01985
G1 X131.687 Y127.044 E.01215
G1 X132.08 Y126.355 E.01386
G2 X133.155 Y125.319 I-3.039 J-4.229 E.02616
G1 X135.131 Y125.319 E.03451
G2 X134.355 Y126.355 I.932 J1.508 E.02314
G1 X134.446 Y127.044 E.01215
G2 X135.411 Y128.231 I2.177 J-.784 E.02723
G1 X137.335 Y128.231 E.03359
G3 X137.114 Y127.734 I.461 J-.503 E.00978
G1 X137.204 Y127.044 E.01215
G1 X137.598 Y126.355 E.01386
G2 X138.672 Y125.32 I-2.46 J-3.631 E.02617
G1 X138.757 Y125.019 E.00547
G1 X140.994 Y125.019 E.03906
G2 X139.969 Y126.01 I2.36 J3.465 E.02501
G1 X139.872 Y126.355 E.00625
G1 X139.963 Y127.044 E.01215
G2 X140.928 Y128.231 I2.177 J-.784 E.02723
G1 X142.853 Y128.231 E.03359
G3 X142.631 Y127.734 I.461 J-.503 E.00978
G1 X142.722 Y127.044 E.01215
G1 X143.115 Y126.355 E.01386
G2 X144.19 Y125.32 I-2.46 J-3.631 E.02617
G1 X144.274 Y125.019 E.00547
G1 X146.031 Y125.019 E.03068
G1 X146.031 Y125.319 E.00524
G1 X146.166 Y125.319 E.00236
G2 X145.39 Y126.355 I.932 J1.507 E.02314
G1 X145.481 Y127.044 E.01215
G2 X146.446 Y128.231 I2.177 J-.784 E.02723
G1 X144.732 Y128.231 E.02993
M204 S10000
G1 X131.372 Y125.319 F42000
G1 F16200
M204 S6000
G1 X130.631 Y125.319 E.01294
G1 X130.631 Y125.019 E.00523
G1 X129.957 Y125.02 E.01177
G2 X129.019 Y125.906 I2.099 J3.164 E.02266
G1 X129.019 Y127.203 E.02264
G1 X129.321 Y127.734 E.01067
G1 X130.114 Y128.424 E.01835
G3 X130.493 Y129.113 I-.604 J.78 E.01413
G1 X130.402 Y129.803 E.01215
G1 X130.009 Y130.493 E.01386
G2 X129.019 Y131.424 I2.203 J3.334 E.02384
G1 X129.019 Y131.931 E.00886
G1 X130.119 Y131.931 E.01921
G1 X130.119 Y133.946 E.03518
G1 X130.396 Y134.286 E.00766
G3 X130.119 Y135.817 I-1.737 J.476 E.0281
G1 X130.119 Y136.669 E.01486
G1 X129.252 Y136.669 E.01514
G2 X129.019 Y136.941 I.673 J.811 E.00629
G1 X129.019 Y138.239 E.02266
G1 X129.321 Y138.769 E.01066
G1 X130.114 Y139.459 E.01835
G3 X130.493 Y140.149 I-.604 J.78 E.01413
G1 X130.402 Y140.838 E.01215
G1 X130.009 Y141.528 E.01386
G2 X129.019 Y142.458 I2.201 J3.332 E.02382
G1 X129.019 Y143.758 E.02269
G1 X129.321 Y144.287 E.01064
G1 X130.114 Y144.976 E.01835
G3 X130.493 Y145.666 I-.604 J.78 E.01413
G1 X130.402 Y146.356 E.01215
G1 X130.009 Y147.046 E.01386
G2 X129.02 Y147.975 I2.198 J3.329 E.0238
G1 X129.02 Y146.261 E.02993
; OBJECT_ID: 77
; WIPE_START
G1 X129.02 Y147.975 E-.65138
G1 X129.201 Y147.753 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.016 Y140.44 Z.8 F42000
G1 X123.28 Y127.932 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X123.545 Y128.088 E.00538
G3 X124.224 Y129.388 I-.963 J1.329 E.02653
G1 X124.224 Y146.812 E.30423
G3 X122.612 Y148.424 I-1.645 J-.034 E.04395
G1 X105.188 Y148.424 E.30423
G3 X103.576 Y146.812 I.029 J-1.641 E.04398
G1 X103.577 Y129.336 E.30513
G3 X105.188 Y127.776 I1.639 J.081 E.0431
G1 X122.612 Y127.776 E.30423
G3 X123.219 Y127.905 I-.029 J1.641 E.0109
G1 X123.225 Y127.907 E.00011
M204 S250
G1 X123.079 Y128.291 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.306 Y128.424 E.00428
G3 X123.81 Y129.396 I-.72 J.99 E.01842
G1 X123.81 Y146.804 E.28268
G3 X122.604 Y148.01 I-1.227 J-.021 E.03061
G1 X105.196 Y148.01 E.28268
G3 X103.99 Y146.804 I.018 J-1.224 E.03064
G1 X103.991 Y129.353 E.28338
G3 X105.196 Y128.19 I1.221 J.06 E.02995
G1 X122.604 Y128.19 E.28268
G3 X123.023 Y128.27 I-.018 J1.224 E.00696
; WIPE_START
M204 S6000
G1 X123.306 Y128.424 E-.12259
G1 X123.487 Y128.577 E-.08993
G1 X123.606 Y128.728 E-.07298
G1 X123.718 Y128.937 E-.09018
G1 X123.787 Y129.166 E-.09092
G1 X123.81 Y129.396 E-.0878
G1 X123.81 Y129.937 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.229 Y129.052 Z.8 F42000
G1 X104.145 Y127.64 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.441 Y128.346 I1.228 J1.931 E.01755
G1 X103.252 Y128.294 E.00342
G3 X103.29 Y127.722 I1.513 J-.187 E.01006
G3 X103.683 Y127.453 I.411 J.179 E.00876
G1 X104.092 Y127.453 E.00716
G1 X104.129 Y127.583 E.00235
; WIPE_START
G1 X103.901 Y127.811 E-.12259
G1 X103.753 Y127.943 E-.07536
G1 X103.632 Y128.074 E-.0678
G1 X103.441 Y128.346 E-.12623
G1 X103.252 Y128.294 E-.07446
G1 X103.254 Y127.875 E-.1591
G1 X103.29 Y127.722 E-.05978
G1 X103.343 Y127.632 E-.03955
G1 X103.409 Y127.568 E-.03513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.041 Y127.536 Z.8 F42000
G1 X124.237 Y127.48 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.294 Y127.497 E.00104
G3 X124.547 Y127.883 I-.194 J.404 E.00846
G1 X124.547 Y128.293 E.00716
G1 X124.36 Y128.345 E.0034
G2 X123.65 Y127.638 I-1.966 J1.261 E.01764
G1 X123.704 Y127.453 E.00336
G3 X124.158 Y127.457 I.197 J3.337 E.00794
G1 X124.179 Y127.463 E.00038
; WIPE_START
G1 X124.294 Y127.497 E-.04539
G1 X124.44 Y127.61 E-.07014
G1 X124.528 Y127.772 E-.07001
G1 X124.547 Y127.883 E-.04282
G1 X124.547 Y128.293 E-.15575
G1 X124.36 Y128.345 E-.07395
G1 X124.101 Y127.999 E-.16447
G1 X123.942 Y127.846 E-.08385
G1 X123.827 Y127.764 E-.05361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.03 Y135.393 Z.8 F42000
G1 X124.363 Y147.849 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.903 E.00336
G3 X124.523 Y148.445 I-1.791 J.188 E.00951
G3 X124.069 Y148.748 I-.433 J-.158 E.0102
G1 X123.705 Y148.748 E.00634
G1 X123.649 Y148.567 E.00331
G2 X124.331 Y147.9 I-1.12 J-1.827 E.0168
; WIPE_START
G1 X124.548 Y147.903 E-.08234
G1 X124.546 Y148.325 E-.16031
G1 X124.523 Y148.445 E-.04652
G1 X124.444 Y148.585 E-.06087
G1 X124.371 Y148.655 E-.03867
G1 X124.238 Y148.724 E-.05708
G1 X124.069 Y148.748 E-.06484
G1 X123.705 Y148.748 E-.13808
G1 X123.649 Y148.567 E-.07206
G1 X123.732 Y148.505 E-.03923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.103 Y148.26 Z.8 F42000
G1 X103.439 Y147.853 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.493 Y147.94 E.0018
G2 X104.151 Y148.563 I1.757 J-1.199 E.01594
G1 X104.097 Y148.748 E.00336
G3 X103.555 Y148.723 I-.188 J-1.79 E.00951
G3 X103.252 Y148.279 I.157 J-.433 E.01001
G1 X103.252 Y147.906 E.00652
G1 X103.382 Y147.869 E.00235
; WIPE_START
G1 X103.493 Y147.94 E-.05031
G1 X103.699 Y148.201 E-.12642
G1 X103.858 Y148.354 E-.08385
G1 X104.151 Y148.563 E-.13662
G1 X104.097 Y148.748 E-.07321
G1 X103.672 Y148.746 E-.16171
G1 X103.555 Y148.723 E-.0452
G1 X103.446 Y148.668 E-.04647
G1 X103.379 Y148.6 E-.0362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.704 Y143.133 Z.8 F42000
G1 X124.357 Y127.063 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.866 I-.259 J.839 E.01886
G1 X124.976 Y148.288 E.35657
G3 X124.081 Y149.176 I-.888 J0 E.02449
G1 X103.712 Y149.176 E.35565
G3 X102.824 Y148.288 I.006 J-.894 E.02434
G1 X102.824 Y127.912 E.35576
G3 X103.666 Y127.025 I.886 J-.002 E.02358
G1 X124.206 Y127.031 E.35864
G3 X124.299 Y127.047 I-.108 J.871 E.00165
M204 S250
G1 X124.481 Y126.668 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.683 Y126.75 E.00355
G3 X125.389 Y127.85 I-.586 J1.152 E.02223
G1 X125.39 Y148.296 E.33201
G3 X124.094 Y149.59 I-1.306 J-.012 E.03296
G1 X103.704 Y149.59 E.33109
G3 X102.41 Y148.296 I.019 J-1.313 E.03288
G1 X102.41 Y127.904 E.33112
G3 X103.65 Y126.611 I1.304 J.01 E.03206
G1 X124.253 Y126.619 E.33455
G3 X124.423 Y126.652 I-.156 J1.284 E.00282
; WIPE_START
M204 S6000
G1 X124.683 Y126.75 E-.10586
G1 X124.939 Y126.921 E-.1167
G1 X125.081 Y127.062 E-.07612
G1 X125.211 Y127.245 E-.08523
G1 X125.327 Y127.503 E-.10772
G1 X125.389 Y127.85 E-.13359
G1 X125.389 Y128.204 E-.13477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y127.685 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0941677
G1 F15000
M204 S6000
G3 X124.275 Y127.816 I-.183 J.392 E.00062
G1 X124.312 Y127.885 E.00023
M204 S10000
G1 X124.508 Y128.526 F42000
; LINE_WIDTH: 0.440659
G1 F15000
M204 S6000
G1 X124.559 Y128.827 E.0052
; LINE_WIDTH: 0.403978
G1 X124.581 Y129.007 E.00283
; LINE_WIDTH: 0.345838
G1 X124.599 Y129.384 E.00498
G1 X124.6 Y146.816 E.23039
G1 X124.583 Y147.175 E.00475
; LINE_WIDTH: 0.400584
G1 X124.562 Y147.354 E.00277
; LINE_WIDTH: 0.439766
G3 X124.51 Y147.668 I-6.502 J-.924 E.00544
M204 S10000
G1 X124.313 Y148.313 F42000
; LINE_WIDTH: 0.0943954
G1 F15000
M204 S6000
G3 X124.115 Y148.513 I-.349 J-.147 E.00086
M204 S10000
G1 X123.47 Y148.712 F42000
; LINE_WIDTH: 0.437189
G1 F15000
M204 S6000
G3 X123.139 Y148.764 I-1.339 J-7.439 E.00568
; LINE_WIDTH: 0.396532
G1 X122.95 Y148.785 E.00291
; LINE_WIDTH: 0.346377
G1 X122.616 Y148.8 E.00442
G1 X105.184 Y148.8 E.23078
G1 X104.807 Y148.781 E.00499
; LINE_WIDTH: 0.405081
G1 X104.627 Y148.759 E.00284
; LINE_WIDTH: 0.440838
G1 X104.332 Y148.71 E.00511
M204 S10000
G1 X103.688 Y148.513 F42000
; LINE_WIDTH: 0.0940738
G1 F15000
M204 S6000
G3 X103.488 Y148.314 I.139 J-.339 E.00086
M204 S10000
G1 X103.291 Y147.672 F42000
; LINE_WIDTH: 0.441397
G1 F15000
M204 S6000
G1 X103.241 Y147.374 E.00518
; LINE_WIDTH: 0.405096
G1 X103.219 Y147.193 E.00284
; LINE_WIDTH: 0.346824
G1 X103.2 Y146.816 E.005
G1 X103.2 Y129.328 E.23183
G1 X103.218 Y129.013 E.00418
; LINE_WIDTH: 0.401989
G1 X103.238 Y128.846 E.00261
; LINE_WIDTH: 0.440515
G3 X103.291 Y128.527 I6.586 J.936 E.00553
M204 S10000
G1 X103.487 Y127.887 F42000
; LINE_WIDTH: 0.0940896
G1 F15000
M204 S6000
M73 P45 R11
G3 X103.688 Y127.687 I.329 J.129 E.00086
M204 S10000
G1 X104.326 Y127.492 F42000
; LINE_WIDTH: 0.440601
G1 F15000
M204 S6000
G1 X104.627 Y127.441 E.00521
; LINE_WIDTH: 0.403895
G1 X104.807 Y127.419 E.00283
; LINE_WIDTH: 0.345519
G1 X105.184 Y127.401 E.00498
G1 X122.616 Y127.4 E.23017
G1 X122.975 Y127.418 E.00475
; LINE_WIDTH: 0.399957
G1 X123.154 Y127.438 E.00277
; LINE_WIDTH: 0.439336
G3 X123.469 Y127.491 I-.936 J6.577 E.00545
; OBJECT_ID: 66
; WIPE_START
G1 X123.154 Y127.438 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.444 Y119.811 Z.8 F42000
G1 X123.863 Y108.775 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.915 Y108.829 E.0013
G3 X123.986 Y109.092 I-.331 J.23 E.00486
G1 X123.986 Y121.508 E.21678
G3 X123.546 Y121.947 I-.419 J.02 E.01222
G1 X111.131 Y121.947 E.21678
G3 X110.692 Y121.508 I-.02 J-.419 E.01222
G1 X110.692 Y109.092 E.21678
G3 X111.131 Y108.653 I.419 J-.02 E.01222
G1 X123.546 Y108.653 E.21678
G1 X123.673 Y108.665 E.00222
G3 X123.809 Y108.724 I-.089 J.393 E.00261
G1 X123.82 Y108.734 E.00025
M204 S10000
G1 X124.17 Y108.469 F42000
G1 F6000
M204 S6000
G3 X124.414 Y109.071 I-.589 J.589 E.01166
G1 X124.414 Y121.529 E.21751
G3 X123.567 Y122.376 I-.833 J.013 E.02333
G1 X111.11 Y122.376 E.21751
G3 X110.263 Y121.529 I-.013 J-.833 E.02333
G1 X110.263 Y109.071 E.21751
G3 X111.11 Y108.224 I.833 J-.013 E.02333
G1 X123.567 Y108.224 E.21751
G1 X123.757 Y108.243 E.00332
G3 X124.126 Y108.428 I-.176 J.815 E.00729
M204 S250
G1 X124.463 Y108.169 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.466 Y108.173 E.00007
G3 X124.828 Y109.051 I-.872 J.873 E.01583
G1 X124.828 Y121.549 E.20295
G3 X123.588 Y122.789 I-1.235 J.004 E.03166
G1 X111.09 Y122.789 E.20295
G3 X109.85 Y121.549 I-.004 J-1.235 E.03166
G1 X109.85 Y109.051 E.20295
G3 X111.09 Y107.811 I1.235 J-.004 E.03166
G1 X123.603 Y107.812 E.2032
G3 X124.28 Y108.021 I-.009 J1.234 E.01166
G1 X124.417 Y108.131 E.00286
; WIPE_START
M204 S6000
G1 X124.466 Y108.173 E-.02443
G1 X124.62 Y108.358 E-.09144
G1 X124.733 Y108.57 E-.09152
G1 X124.803 Y108.801 E-.09154
G1 X124.828 Y109.051 E-.09544
G1 X124.828 Y110.013 E-.36562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.227 Y109.318 Z.8 F42000
G1 X111.829 Y108.825 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42499
G1 F15000
M204 S6000
G1 X111.043 Y109.611 E.01828
G1 X111.043 Y110.182 E.00938
G1 X112.221 Y109.004 E.02738
G1 X112.791 Y109.004 E.00938
G1 X111.043 Y110.753 E.04065
G1 X111.043 Y111.323 E.00938
G1 X113.362 Y109.004 E.05392
G1 X113.933 Y109.004 E.00938
G1 X111.043 Y111.894 E.06719
G1 X111.043 Y112.465 E.00938
G1 X114.503 Y109.004 E.08045
G1 X115.074 Y109.004 E.00938
G1 X111.043 Y113.035 E.09372
G1 X111.043 Y113.606 E.00938
G1 X115.645 Y109.004 E.10699
G1 X116.215 Y109.004 E.00938
G1 X111.043 Y114.177 E.12026
G1 X111.043 Y114.747 E.00938
G1 X116.786 Y109.004 E.13353
G1 X117.357 Y109.004 E.00938
G1 X111.043 Y115.318 E.1468
G1 X111.043 Y115.889 E.00938
G1 X117.927 Y109.004 E.16007
G1 X118.498 Y109.004 E.00938
G1 X111.043 Y116.459 E.17334
G1 X111.043 Y117.03 E.00938
G1 X119.069 Y109.004 E.18661
G1 X119.639 Y109.004 E.00938
G1 X111.043 Y117.601 E.19988
G1 X111.043 Y118.171 E.00938
G1 X120.21 Y109.004 E.21315
G1 X120.781 Y109.004 E.00938
G1 X111.043 Y118.742 E.22642
G1 X111.043 Y119.313 E.00938
G1 X121.351 Y109.004 E.23968
G1 X121.922 Y109.004 E.00938
G1 X111.043 Y119.883 E.25295
G1 X111.043 Y120.454 E.00938
G1 X122.493 Y109.004 E.26622
G1 X123.063 Y109.004 E.00938
G1 X111.043 Y121.025 E.27949
G1 X111.043 Y121.478 E.00744
G2 X111.062 Y121.576 I.121 J.028 E.0017
G1 X123.615 Y109.024 E.29187
G1 X123.629 Y109.052 E.00052
G3 X123.634 Y109.575 I-2.652 J.29 E.00861
G1 X111.614 Y121.596 E.27949
G1 X112.184 Y121.596 E.00938
G1 X123.634 Y110.146 E.26622
G1 X123.634 Y110.716 E.00938
G1 X112.755 Y121.596 E.25295
G1 X113.326 Y121.596 E.00938
G1 X123.634 Y111.287 E.23969
G1 X123.634 Y111.858 E.00938
G1 X113.896 Y121.596 E.22642
G1 X114.467 Y121.596 E.00938
G1 X123.634 Y112.429 E.21315
G1 X123.634 Y112.999 E.00938
G1 X115.038 Y121.596 E.19988
G1 X115.609 Y121.596 E.00938
G1 X123.634 Y113.57 E.18661
G1 X123.634 Y114.141 E.00938
G1 X116.179 Y121.596 E.17334
G1 X116.75 Y121.596 E.00938
G1 X123.634 Y114.711 E.16007
G1 X123.634 Y115.282 E.00938
G1 X117.321 Y121.596 E.1468
G1 X117.891 Y121.596 E.00938
G1 X123.634 Y115.853 E.13353
G1 X123.634 Y116.423 E.00938
G1 X118.462 Y121.596 E.12026
G1 X119.033 Y121.596 E.00938
G1 X123.634 Y116.994 E.10699
G1 X123.634 Y117.565 E.00938
G1 X119.603 Y121.596 E.09373
G1 X120.174 Y121.596 E.00938
G1 X123.634 Y118.135 E.08046
G1 X123.634 Y118.706 E.00938
G1 X120.745 Y121.596 E.06719
G1 X121.315 Y121.596 E.00938
G1 X123.634 Y119.277 E.05392
G1 X123.634 Y119.847 E.00938
G1 X121.886 Y121.596 E.04065
G1 X122.457 Y121.596 E.00938
G1 X123.634 Y120.418 E.02738
G1 X123.634 Y120.989 E.00938
G1 X122.848 Y121.775 E.01828
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.634 Y120.989 E-.4225
G1 X123.634 Y120.418 E-.21686
G1 X123.41 Y120.642 E-.12064
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 5/53
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-.823 J.896 P1  F42000
G1 X148.802 Y143.96 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z.9 F42000
G1 X151.648 Y132.298 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.74 Y148.107 E.20612
G3 X151.979 Y148.748 I-.743 J-.11 E.01899
G1 X129.419 Y148.748 E.3939
G3 X128.653 Y148.029 I-.018 J-.748 E.02033
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.371 Y124.653 I.75 J-.018 E.02035
G1 X130.998 Y124.653 E.02841
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G1 X151.981 Y124.652 E.02756
G3 X152.747 Y125.371 I.014 J.752 E.0203
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.175 Y148.046 E.21254
G3 X151.988 Y149.176 I-1.177 J-.047 E.03166
G1 X129.411 Y149.176 E.39419
G3 X128.225 Y148.046 I-.011 J-1.177 E.03166
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.1277
G3 X129.354 Y124.225 I1.183 J-.006 E.03163
G1 X131.426 Y124.224 E.03619
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.989 Y124.223 E.03518
G3 X153.175 Y125.354 I.004 J1.183 E.03161
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.589 Y148.062 E.20464
G3 X151.996 Y149.59 I-1.59 J-.064 E.0396
G1 X129.404 Y149.59 E.36685
G3 X127.811 Y148.062 I-.003 J-1.591 E.0396
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.338 Y123.811 I1.599 J.005 E.03955
G1 X131.84 Y123.81 E.04063
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.996 Y123.81 E.03956
G3 X153.589 Y125.338 I-.005 J1.599 E.03955
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z0.9
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer5 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M73 P46 R11
G1 X152.381 Y137.196 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X152.381 Y136.669 E.00922
G1 X151.281 Y136.669 E.0192
G1 X151.281 Y136.582 E.00151
G2 X150.811 Y137.39 I.617 J.9 E.01686
G1 X150.971 Y138.079 E.01236
G1 X151.433 Y138.769 E.0145
G1 X152.381 Y139.506 E.02096
G1 X152.381 Y141.016 E.02638
G1 X152.038 Y141.528 E.01076
G1 X151.125 Y142.218 E.01997
G2 X150.811 Y142.907 I.462 J.627 E.01382
G1 X150.971 Y143.597 E.01236
G1 X151.433 Y144.287 E.0145
G1 X152.38 Y145.022 E.02094
G1 X152.38 Y146.535 E.02641
G1 X152.038 Y147.046 E.01074
G1 X151.125 Y147.735 E.01997
G2 X150.818 Y148.381 I.427 J.6 E.01305
G1 X148.732 Y148.381 E.03642
G1 X149.586 Y147.735 E.01871
G2 X149.901 Y147.046 I-.462 J-.627 E.01382
G2 X148.621 Y145.169 I-2.575 J.381 E.04105
G1 X146.975 Y145.169 E.02874
G3 X147.142 Y145.666 I-.363 J.399 E.00957
G1 X146.982 Y146.356 E.01236
G1 X146.52 Y147.046 E.0145
G1 X145.608 Y147.735 E.01997
G2 X145.3 Y148.381 I.426 J.6 E.01305
G1 X143.214 Y148.381 E.03642
G1 X144.069 Y147.735 E.01871
G2 X144.383 Y147.046 I-.462 J-.627 E.01382
G2 X143.103 Y145.169 I-2.575 J.381 E.04105
G1 X141.457 Y145.169 E.02874
G3 X141.624 Y145.666 I-.363 J.399 E.00957
G1 X141.465 Y146.356 E.01236
G1 X141.003 Y147.046 E.0145
G1 X140.09 Y147.735 E.01997
G2 X139.782 Y148.381 I.427 J.6 E.01305
G1 X137.696 Y148.381 E.03642
G1 X138.551 Y147.735 E.01871
G2 X138.865 Y147.046 I-.462 J-.627 E.01382
G2 X137.585 Y145.169 I-2.575 J.381 E.04105
G1 X135.939 Y145.169 E.02874
G3 X136.107 Y145.666 I-.363 J.399 E.00957
G1 X135.947 Y146.356 E.01236
G1 X135.485 Y147.046 E.0145
G1 X134.572 Y147.735 E.01997
G2 X134.265 Y148.381 I.427 J.6 E.01305
G1 X132.179 Y148.381 E.03642
G1 X133.034 Y147.735 E.01871
G2 X133.348 Y147.046 I-.462 J-.627 E.01382
G1 X133.188 Y146.356 E.01236
G1 X132.726 Y145.666 E.0145
G1 X131.814 Y144.976 E.01997
G3 X131.499 Y144.287 I.462 J-.627 E.01382
G1 X131.659 Y143.597 E.01236
G1 X132.231 Y142.824 E.01679
G1 X132.231 Y139.775 E.05324
G3 X131.499 Y138.769 I.542 J-1.164 E.02267
G1 X131.659 Y138.079 E.01236
G1 X132.231 Y137.306 E.01679
G1 X132.231 Y134.257 E.05324
G3 X131.499 Y133.252 I.542 J-1.164 E.02267
G1 X131.659 Y132.562 E.01236
G1 X132.231 Y131.789 E.01679
G1 X132.231 Y128.739 E.05324
G3 X131.499 Y127.734 I.542 J-1.164 E.02267
G1 X131.659 Y127.044 E.01236
G1 X132.121 Y126.355 E.0145
G1 X133.034 Y125.665 E.01997
G1 X133.298 Y125.319 E.0076
G1 X135.031 Y125.319 E.03026
G1 X134.572 Y125.665 E.01003
G2 X134.258 Y126.355 I.462 J.627 E.01382
G2 X135.538 Y128.231 I2.575 J-.381 E.04104
G1 X137.184 Y128.231 E.02874
G3 X137.017 Y127.734 I.363 J-.399 E.00957
G1 X137.177 Y127.044 E.01236
G1 X137.639 Y126.355 E.0145
G1 X138.551 Y125.665 E.01997
G2 X138.859 Y125.019 I-.427 J-.6 E.01305
G1 X140.945 Y125.019 E.03642
G1 X140.09 Y125.665 E.01871
G2 X139.776 Y126.355 I.462 J.627 E.01382
G2 X141.056 Y128.231 I2.575 J-.381 E.04104
G1 X142.702 Y128.231 E.02874
G3 X142.535 Y127.734 I.363 J-.399 E.00957
G1 X142.694 Y127.044 E.01236
G1 X143.156 Y126.355 E.0145
G1 X144.069 Y125.665 E.01997
G2 X144.377 Y125.019 I-.427 J-.6 E.01305
G1 X146.031 Y125.019 E.02889
G1 X146.066 Y125.319 E.00527
G1 X145.608 Y125.665 E.01003
G2 X145.294 Y126.355 I.462 J.627 E.01382
G2 X146.573 Y128.231 I2.575 J-.381 E.04104
G1 X148.219 Y128.231 E.02874
G3 X148.052 Y127.734 I.363 J-.399 E.00957
G1 X148.212 Y127.044 E.01236
G1 X148.674 Y126.355 E.0145
G1 X149.586 Y125.665 E.01997
G1 X149.85 Y125.319 E.0076
G1 X150.769 Y125.319 E.01603
G1 X150.769 Y125.019 E.00523
G1 X151.977 Y125.021 E.0211
G1 X151.125 Y125.665 E.01864
G2 X150.811 Y126.355 I.462 J.627 E.01382
G1 X150.971 Y127.044 E.01236
G1 X151.433 Y127.734 E.0145
G1 X152.381 Y128.47 E.02095
G1 X152.381 Y129.981 E.02638
G1 X152.038 Y130.493 E.01076
G1 X151.125 Y131.182 E.01997
G1 X150.862 Y131.527 E.00758
G2 X151.281 Y133.026 I1.946 J.263 E.02794
G1 X151.281 Y131.931 E.01911
G1 X151.901 Y131.931 E.01082
M204 S10000
G1 X149.169 Y130.744 F42000
G1 F16200
M204 S6000
G1 X149.169 Y129.03 E.02993
G1 X149.741 Y129.803 E.0168
G1 X149.901 Y130.493 E.01236
G3 X149.169 Y131.498 I-1.274 J-.158 E.02267
G1 X149.169 Y134.548 E.05324
G1 X149.741 Y135.321 E.0168
G1 X149.901 Y136.01 E.01236
G3 X149.169 Y137.016 I-1.274 J-.158 E.02267
G1 X149.169 Y140.065 E.05324
G1 X149.741 Y140.838 E.0168
G1 X149.901 Y141.528 E.01236
G3 X149.169 Y142.534 I-1.274 J-.158 E.02267
G1 X149.169 Y144.248 E.02993
; WIPE_START
G1 X149.169 Y142.534 E-.65138
G1 X149.397 Y142.361 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.887 Y143.727 Z.9 F42000
G1 X129.02 Y146.067 Z.9
G1 Z.5
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X129.02 Y147.781 E.02993
G1 X129.967 Y147.046 E.02094
G1 X130.43 Y146.356 E.0145
G1 X130.589 Y145.666 E.01236
G2 X130.275 Y144.976 I-.777 J-.063 E.01382
G1 X129.362 Y144.287 E.01997
G1 X129.019 Y143.775 E.01075
G1 X129.019 Y142.264 E.02638
G1 X129.967 Y141.528 E.02096
G1 X130.43 Y140.838 E.0145
G1 X130.589 Y140.149 E.01236
G2 X130.275 Y139.459 I-.777 J-.063 E.01382
G1 X129.362 Y138.769 E.01997
G1 X129.019 Y138.257 E.01077
G1 X129.019 Y136.669 E.02773
G1 X130.119 Y136.669 E.0192
G1 X130.119 Y135.785 E.01543
G2 X130.539 Y134.286 I-1.526 J-1.236 E.02794
G2 X130.119 Y133.823 I-1.045 J.526 E.01105
G1 X130.119 Y131.931 E.03303
G1 X129.019 Y131.931 E.01921
G1 X129.019 Y131.23 E.01225
G1 X129.967 Y130.493 E.02098
G1 X130.43 Y129.803 E.0145
G1 X130.589 Y129.113 E.01236
G2 X130.275 Y128.424 I-.777 J-.063 E.01382
G1 X129.362 Y127.734 E.01997
G1 X129.019 Y127.221 E.01078
G1 X129.019 Y125.712 E.02634
G1 X129.908 Y125.02 E.01969
G1 X130.631 Y125.019 E.01262
G1 X130.631 Y125.319 E.00522
G1 X131.323 Y125.319 E.01208
; OBJECT_ID: 77
; WIPE_START
G1 X130.631 Y125.319 E-.26295
G1 X130.631 Y125.019 E-.11372
G1 X129.908 Y125.02 E-.27471
G1 X129.683 Y125.195 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.275 Y127.928 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6000
M204 S6000
G1 X123.5 Y128.057 E.00453
G3 X124.224 Y129.388 I-.918 J1.361 E.0275
G1 X124.224 Y146.812 E.30423
G3 X122.612 Y148.424 I-1.641 J-.029 E.04398
G1 X105.188 Y148.424 E.30423
G3 X103.576 Y146.812 I.03 J-1.641 E.04398
G1 X103.577 Y129.336 E.30513
G3 X105.188 Y127.776 I1.641 J.083 E.04309
G1 X122.612 Y127.776 E.30423
G3 X123.217 Y127.904 I-.03 J1.641 E.01085
G1 X123.22 Y127.905 E.00006
M204 S250
G1 X123.081 Y128.291 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.27 Y128.399 E.00353
G3 X123.81 Y129.396 I-.684 J1.015 E.01915
G1 X123.81 Y146.804 E.28268
G3 X122.604 Y148.01 I-1.224 J-.018 E.03064
G1 X105.196 Y148.01 E.28268
G3 X103.99 Y146.804 I.018 J-1.224 E.03064
G1 X103.991 Y129.353 E.28338
G3 X105.196 Y128.19 I1.223 J.062 E.02994
G1 X122.604 Y128.19 E.28268
G3 X123.025 Y128.271 I-.018 J1.224 E.00699
; WIPE_START
M204 S6000
G1 X123.27 Y128.399 E-.10506
G1 X123.487 Y128.577 E-.10679
G1 X123.606 Y128.728 E-.07305
G1 X123.718 Y128.937 E-.09014
G1 X123.787 Y129.166 E-.0909
G1 X123.81 Y129.396 E-.08779
G1 X123.81 Y129.939 E-.20627
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.229 Y129.053 Z.9 F42000
G1 X104.145 Y127.641 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.439 Y128.347 I1.266 J1.971 E.01758
G1 X103.252 Y128.294 E.0034
G3 X103.277 Y127.755 I1.78 J-.187 E.00947
G3 X103.683 Y127.453 I.428 J.152 E.00935
G1 X104.092 Y127.453 E.00716
G1 X104.129 Y127.583 E.00235
; WIPE_START
G1 X103.895 Y127.815 E-.12541
G1 X103.748 Y127.948 E-.0752
G1 X103.615 Y128.095 E-.07517
G1 X103.439 Y128.347 E-.11695
G1 X103.252 Y128.294 E-.07396
G1 X103.254 Y127.872 E-.16065
G1 X103.277 Y127.755 E-.04522
G1 X103.356 Y127.615 E-.06085
G1 X103.407 Y127.568 E-.02659
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.039 Y127.529 Z.9 F42000
G1 X124.187 Y127.461 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.547 Y127.883 I-.091 J.442 E.01041
G1 X124.547 Y128.292 E.00716
G1 X124.36 Y128.345 E.0034
G2 X123.655 Y127.641 I-1.964 J1.261 E.01752
G1 X123.707 Y127.453 E.00342
G3 X124.128 Y127.455 I.192 J3.431 E.00735
; WIPE_START
G1 X124.308 Y127.505 E-.07127
G1 X124.44 Y127.61 E-.06391
G1 X124.528 Y127.772 E-.07004
G1 X124.547 Y127.883 E-.04276
G1 X124.547 Y128.292 E-.15574
G1 X124.36 Y128.345 E-.07395
G1 X124.101 Y127.999 E-.16444
G1 X123.934 Y127.838 E-.08781
G1 X123.869 Y127.793 E-.03009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.057 Y135.423 Z.9 F42000
G1 X124.363 Y147.849 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.903 E.00336
G3 X124.513 Y148.471 I-1.582 J.188 E.01
G3 X124.079 Y148.748 I-.43 J-.196 E.0095
G1 X123.706 Y148.748 E.00652
G1 X123.653 Y148.561 E.0034
G2 X124.33 Y147.899 I-1.258 J-1.965 E.01665
; WIPE_START
G1 X124.548 Y147.903 E-.08277
G1 X124.546 Y148.325 E-.16035
G1 X124.513 Y148.471 E-.05701
G1 X124.428 Y148.603 E-.05963
G1 X124.315 Y148.691 E-.05444
G1 X124.187 Y148.738 E-.05178
G1 X124.079 Y148.748 E-.04125
G1 X123.706 Y148.748 E-.1419
G1 X123.653 Y148.561 E-.07395
G1 X123.731 Y148.503 E-.03691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.102 Y148.258 Z.9 F42000
G1 X103.439 Y147.853 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.493 Y147.94 E.00179
G2 X104.146 Y148.559 I1.746 J-1.189 E.01583
G1 X104.094 Y148.748 E.00342
G3 X103.552 Y148.722 I-.186 J-1.754 E.00951
G3 X103.252 Y148.269 I.157 J-.43 E.01015
G1 X103.252 Y147.906 E.00634
G1 X103.382 Y147.869 E.00235
; WIPE_START
G1 X103.493 Y147.94 E-.05021
G1 X103.699 Y148.201 E-.1265
G1 X103.866 Y148.362 E-.08781
G1 X104.146 Y148.559 E-.13019
G1 X104.094 Y148.748 E-.07446
G1 X103.675 Y148.746 E-.1591
G1 X103.552 Y148.722 E-.04783
G1 X103.446 Y148.667 E-.0453
G1 X103.375 Y148.594 E-.03861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.698 Y143.124 Z.9 F42000
G1 X124.332 Y127.056 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.866 I-.233 J.846 E.01932
G1 X124.976 Y148.288 E.35657
G3 X124.088 Y149.176 I-.884 J.005 E.02442
G1 X103.712 Y149.176 E.35576
G3 X102.824 Y148.281 I.003 J-.892 E.02446
G1 X102.824 Y127.912 E.35565
G3 X103.666 Y127.025 I.886 J-.003 E.02358
G1 X124.207 Y127.031 E.35865
G3 X124.273 Y127.042 I-.109 J.871 E.00118
M204 S250
G1 X124.471 Y126.667 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.705 Y126.762 E.00409
G3 X125.389 Y127.85 I-.608 J1.141 E.02184
G1 X125.39 Y148.296 E.33201
G3 X124.096 Y149.59 I-1.3 J-.006 E.03297
G1 X103.704 Y149.59 E.33112
G3 X102.41 Y148.294 I.016 J-1.31 E.03293
G1 X102.41 Y127.904 E.33109
G3 X103.65 Y126.611 I1.304 J.009 E.03206
G1 X124.253 Y126.619 E.33456
G3 X124.414 Y126.649 I-.156 J1.283 E.00266
; WIPE_START
M204 S6000
G1 X124.705 Y126.762 E-.11838
G1 X124.939 Y126.921 E-.10773
G1 X125.081 Y127.062 E-.07608
G1 X125.226 Y127.271 E-.09684
G1 X125.327 Y127.503 E-.09607
G1 X125.389 Y127.85 E-.13364
G1 X125.389 Y128.195 E-.13125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.118 Y127.672 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100029
G1 F15000
M204 S6000
G3 X124.242 Y127.776 I-.474 J.691 E.00052
G1 X124.312 Y127.885 E.00041
M204 S10000
G1 X124.295 Y127.777 F42000
; LINE_WIDTH: 0.0763348
G1 F15000
M204 S6000
G1 X124.112 Y127.686 E.00046
M204 S10000
G1 X123.474 Y127.492 F42000
; LINE_WIDTH: 0.44014
G1 F15000
M204 S6000
G2 X123.154 Y127.438 I-1.252 J6.515 E.00554
; LINE_WIDTH: 0.400085
G1 X122.975 Y127.417 E.00277
; LINE_WIDTH: 0.345584
G1 X122.616 Y127.4 E.00475
G1 X105.184 Y127.401 E.23021
G1 X104.807 Y127.419 E.00498
; LINE_WIDTH: 0.403936
G1 X104.627 Y127.441 E.00283
; LINE_WIDTH: 0.44064
M73 P47 R11
G1 X104.326 Y127.492 E.0052
M204 S10000
G1 X103.688 Y127.687 F42000
; LINE_WIDTH: 0.0939962
G1 F15000
M204 S6000
G2 X103.487 Y127.889 I.129 J.329 E.00087
M204 S10000
G1 X103.291 Y128.528 F42000
; LINE_WIDTH: 0.440346
G1 F15000
M204 S6000
G2 X103.238 Y128.846 I6.402 J1.233 E.00551
; LINE_WIDTH: 0.401987
G1 X103.218 Y129.013 E.0026
; LINE_WIDTH: 0.346824
G1 X103.2 Y129.328 E.00418
G1 X103.2 Y146.816 E.23183
G1 X103.219 Y147.193 E.005
; LINE_WIDTH: 0.405077
G1 X103.241 Y147.373 E.00284
; LINE_WIDTH: 0.441394
G1 X103.291 Y147.672 E.00518
M204 S10000
G1 X103.487 Y148.315 F42000
; LINE_WIDTH: 0.094256
G1 F15000
M204 S6000
G2 X103.687 Y148.513 I.35 J-.153 E.00086
M204 S10000
G1 X104.327 Y148.709 F42000
; LINE_WIDTH: 0.441575
G1 F15000
M204 S6000
G1 X104.627 Y148.759 E.0052
; LINE_WIDTH: 0.405081
G1 X104.807 Y148.781 E.00284
; LINE_WIDTH: 0.346425
G1 X105.184 Y148.8 E.00499
G1 X122.616 Y148.8 E.23081
G1 X122.975 Y148.783 E.00476
; LINE_WIDTH: 0.400663
G1 X123.154 Y148.762 E.00278
; LINE_WIDTH: 0.440383
G2 X123.472 Y148.709 I-.915 J-6.462 E.0055
M204 S10000
G1 X124.114 Y148.512 F42000
; LINE_WIDTH: 0.0941996
G1 F15000
M204 S6000
G2 X124.313 Y148.313 I-.158 J-.357 E.00085
M204 S10000
G1 X124.51 Y147.668 F42000
; LINE_WIDTH: 0.439773
G1 F15000
M204 S6000
G2 X124.562 Y147.354 I-6.346 J-1.221 E.00544
; LINE_WIDTH: 0.400578
G1 X124.583 Y147.175 E.00277
; LINE_WIDTH: 0.345838
G1 X124.6 Y146.816 E.00475
G1 X124.599 Y129.384 E.23039
G1 X124.581 Y129.007 E.00498
; LINE_WIDTH: 0.403934
G1 X124.559 Y128.827 E.00283
; LINE_WIDTH: 0.440625
G1 X124.508 Y128.526 E.00521
; OBJECT_ID: 66
; WIPE_START
G1 X124.559 Y128.827 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X124.304 Y121.199 Z.9 F42000
G1 X123.888 Y108.751 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.941 Y108.806 E.00134
G3 X124.014 Y109.075 I-.341 J.236 E.00498
G1 X124.014 Y121.525 E.21737
G3 X123.563 Y121.975 I-.431 J.02 E.01252
G1 X111.114 Y121.975 E.21737
G3 X110.663 Y121.525 I-.02 J-.431 E.01252
G1 X110.663 Y109.075 E.21737
G3 X111.114 Y108.625 I.431 J-.02 E.01252
G1 X123.563 Y108.625 E.21737
G1 X123.692 Y108.637 E.00225
G3 X123.833 Y108.698 I-.091 J.405 E.00269
G1 X123.845 Y108.709 E.00029
M204 S10000
G1 X124.195 Y108.444 F42000
G1 F6000
M204 S6000
G3 X124.443 Y109.054 I-.598 J.598 E.01182
G1 X124.443 Y121.546 E.21811
G3 X123.584 Y122.404 I-.845 J.013 E.02364
G1 X111.093 Y122.404 E.21811
G3 X110.235 Y121.546 I-.013 J-.845 E.02364
G1 X110.235 Y109.054 E.21811
G3 X111.093 Y108.196 I.845 J-.013 E.02364
G1 X123.584 Y108.196 E.2181
G1 X123.776 Y108.215 E.00336
G3 X124.151 Y108.403 I-.178 J.826 E.0074
M204 S250
G1 X124.487 Y108.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.49 Y108.148 E.0001
G3 X124.856 Y109.034 I-.879 J.881 E.01597
G1 X124.856 Y121.566 E.2035
G3 X123.605 Y122.817 I-1.247 J.005 E.03195
G1 X111.073 Y122.817 E.2035
G3 X109.821 Y121.566 I-.005 J-1.247 E.03195
G1 X109.821 Y109.034 E.2035
G3 X111.073 Y107.783 I1.247 J-.005 E.03195
G1 X123.628 Y107.785 E.20387
G3 X124.303 Y107.994 I-.016 J1.244 E.01164
G1 X124.44 Y108.105 E.00287
; WIPE_START
M204 S6000
G1 X124.49 Y108.148 E-.02507
G1 X124.646 Y108.335 E-.0923
G1 X124.761 Y108.549 E-.09235
G1 X124.831 Y108.782 E-.09239
G1 X124.856 Y109.034 E-.09627
G1 X124.856 Y109.985 E-.36161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.842 Y109.206 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42645
G1 F15000
M204 S6000
G1 X123.627 Y108.991 E.00502
G2 X123.546 Y108.976 I-.065 J.126 E.00137
G1 X123.039 Y108.976 E.00836
G1 X123.662 Y109.599 E.01454
G1 X123.662 Y110.172 E.00945
G1 X122.467 Y108.976 E.02791
G1 X121.894 Y108.976 E.00945
G1 X123.662 Y110.745 E.04127
G1 X123.662 Y111.318 E.00945
G1 X121.321 Y108.976 E.05464
G1 X120.748 Y108.976 E.00945
G1 X123.662 Y111.89 E.068
G1 X123.662 Y112.463 E.00945
G1 X120.176 Y108.976 E.08137
G1 X119.603 Y108.976 E.00945
G1 X123.662 Y113.036 E.09473
G1 X123.662 Y113.608 E.00945
G1 X119.03 Y108.976 E.1081
G1 X118.457 Y108.976 E.00945
G1 X123.662 Y114.181 E.12146
G1 X123.662 Y114.754 E.00945
G1 X117.885 Y108.976 E.13483
G1 X117.312 Y108.976 E.00945
G1 X123.662 Y115.327 E.14819
G1 X123.662 Y115.899 E.00945
G1 X116.739 Y108.976 E.16156
G1 X116.166 Y108.976 E.00945
G1 X123.662 Y116.472 E.17492
G1 X123.662 Y117.045 E.00945
G1 X115.594 Y108.976 E.18829
G1 X115.021 Y108.976 E.00945
G1 X123.662 Y117.618 E.20165
G1 X123.662 Y118.19 E.00945
G1 X114.448 Y108.976 E.21502
G1 X113.876 Y108.976 E.00945
G1 X123.662 Y118.763 E.22839
G1 X123.662 Y119.336 E.00945
G1 X113.303 Y108.976 E.24175
G1 X112.73 Y108.976 E.00945
G1 X123.662 Y119.909 E.25512
G1 X123.662 Y120.481 E.00945
G1 X112.157 Y108.976 E.26848
G1 X111.585 Y108.976 E.00945
G1 X123.662 Y121.054 E.28185
G1 X123.662 Y121.494 E.00726
G3 X123.638 Y121.603 I-.113 J.031 E.00191
G1 X111.036 Y109 E.29408
G2 X111.015 Y109.106 I.108 J.077 E.00182
G1 X111.015 Y109.552 E.00736
G1 X123.087 Y121.624 E.28171
G1 X122.514 Y121.624 E.00945
G1 X111.015 Y110.125 E.26834
G1 X111.015 Y110.697 E.00945
G1 X121.941 Y121.624 E.25498
G1 X121.369 Y121.624 E.00945
G1 X111.015 Y111.27 E.24161
G1 X111.015 Y111.843 E.00945
G1 X120.796 Y121.624 E.22824
G1 X120.223 Y121.624 E.00945
G1 X111.015 Y112.416 E.21488
G1 X111.015 Y112.988 E.00945
G1 X119.65 Y121.624 E.20151
G1 X119.078 Y121.624 E.00945
G1 X111.015 Y113.561 E.18815
G1 X111.015 Y114.134 E.00945
G1 X118.505 Y121.624 E.17478
G1 X117.932 Y121.624 E.00945
G1 X111.015 Y114.707 E.16142
G1 X111.015 Y115.279 E.00945
G1 X117.359 Y121.624 E.14805
G1 X116.787 Y121.624 E.00945
G1 X111.015 Y115.852 E.13469
G1 X111.015 Y116.425 E.00945
G1 X116.214 Y121.624 E.12132
G1 X115.641 Y121.624 E.00945
G1 X111.015 Y116.998 E.10796
G1 X111.015 Y117.57 E.00945
G1 X115.068 Y121.624 E.09459
G1 X114.496 Y121.624 E.00945
G1 X111.015 Y118.143 E.08123
G1 X111.015 Y118.716 E.00945
G1 X113.923 Y121.624 E.06786
G1 X113.35 Y121.624 E.00945
G1 X111.015 Y119.289 E.0545
G1 X111.015 Y119.861 E.00945
G1 X112.777 Y121.624 E.04113
G1 X112.205 Y121.624 E.00945
G1 X111.015 Y120.434 E.02776
G1 X111.015 Y121.007 E.00945
G1 X111.811 Y121.803 E.01858
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.015 Y121.007 E-.42799
G1 X111.015 Y120.434 E-.21764
G1 X111.228 Y120.647 E-.11437
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 6/53
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S193.8
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I-.642 J1.034 P1  F42000
G1 X148.802 Y143.96 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
M73 P47 R10
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1 F42000
G1 X151.648 Y132.298 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.984 E.20397
G3 X151.979 Y148.748 I-.752 J.012 E.02114
G1 X129.419 Y148.748 E.39391
G3 X128.653 Y148.029 I-.009 J-.757 E.02026
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.754 J-.015 E.02016
G1 X130.998 Y124.653 E.02858
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G1 X151.981 Y124.652 E.02757
G3 X152.747 Y125.371 I.006 J.761 E.02023
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.99 E.21156
G3 X151.987 Y149.176 I-1.182 J.004 E.03261
G1 X129.411 Y149.176 E.39419
G3 X128.225 Y148.046 I.001 J-1.189 E.03157
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.12771
G3 X129.348 Y124.225 I1.184 J-.005 E.03152
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.989 Y124.223 E.03519
G3 X153.175 Y125.354 I-.005 J1.193 E.03154
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
M73 P48 R10
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.997 E.20357
G3 X151.996 Y149.59 I-1.597 J-.004 E.04063
G1 X129.404 Y149.59 E.36685
G3 X127.811 Y148.062 I.012 J-1.606 E.0395
G1 X127.81 Y135.46 E.20464
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.6 J.005 E.03952
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.996 Y123.81 E.03956
G3 X153.589 Y125.338 I-.016 J1.611 E.03948
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer6 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X129.075 Y125.382 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X129.066 Y131.884 E.10559
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.516 E.07198
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.997 E.18319
G1 X129.154 Y148.215 E.0038
G1 X129.377 Y148.324 E.00403
G1 X129.476 Y148.334 E.00162
G1 X151.958 Y148.334 E.36505
G1 X152.221 Y148.242 E.00454
G2 X152.334 Y147.904 I-.411 J-.325 E.00591
G1 X152.334 Y136.716 E.18167
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.422 E.10493
G1 X152.213 Y125.151 E.00482
G1 X151.904 Y125.067 E.00518
G1 X150.816 Y125.066 E.01768
G3 X150.751 Y125.314 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.396 Y125.067 E.0193
G1 X129.19 Y125.149 E.00359
G1 X129.102 Y125.328 E.00324
M204 S10000
G1 X145.85 Y125.662 F42000
G1 F12000
M204 S6000
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01383
G2 X129.464 Y131.486 I998.916 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.516 E.07198
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.934 E.1757
G1 X151.93 Y147.936 E.36477
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.491 E.09734
G2 X151.082 Y125.465 I-.711 J9.198 E.01385
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00794
G1 X146.184 Y125.764 E.07099
G1 X145.907 Y125.68 E.0047
M204 S10000
G1 X145.627 Y125.993 F42000
; LINE_WIDTH: 0.421565
G1 F12000
M204 S6000
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15839
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.959 Y136.69 E.0751
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.864 E.08515
G1 X151.305 Y125.864 E.00377
G1 X151.288 Y125.903 E.00069
G1 X150.616 Y126.163 E.01173
G1 X146.184 Y126.163 E.07226
G1 X145.684 Y126.01 E.00851
; WIPE_START
G1 X146.184 Y126.163 E-.19834
G1 X147.662 Y126.163 E-.56166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.203 Y133.776 Z1 F42000
G1 X149.016 Y145.216 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.384 E.27007
G1 X132.196 Y128.315 E.00112
G1 X132.293 Y128.206 E.00238
G1 X132.384 Y128.184 E.00151
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27007
G1 X149.157 Y145.157 E.00248
G1 X149.072 Y145.193 E.0015
M204 S10000
G1 X149.254 Y145.565 F42000
G1 F12000
M204 S6000
G1 X149.016 Y145.614 E.00394
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27007
G1 X149.565 Y145.254 E.00394
G1 X149.439 Y145.439 E.00364
G1 X149.303 Y145.531 E.00266
; WIPE_START
G1 X149.439 Y145.439 E-.06233
G1 X149.565 Y145.254 E-.08513
G1 X149.614 Y145.016 E-.09214
G1 X149.614 Y143.647 E-.52041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.824 Y138.674 Z1 F42000
G1 X131.447 Y128.043 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.42195
G1 F12000
M204 S6000
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.2714
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06038
G3 X150.013 Y137.332 I-327.131 J2.216 E.08563
G1 X150.013 Y145.016 E.1254
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.2714
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.1254
G3 X131.381 Y136.516 I10.144 J-.489 E.01331
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.437 Y128.102 E.00467
M204 S10000
G1 X145.404 Y126.323 F42000
; LINE_WIDTH: 0.423847
G1 F12000
M204 S6000
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15317
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.201 Y126.989 E.14759
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07192
G1 X150.616 Y126.561 E.00916
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.462 Y126.341 E.01241
M204 S10000
G1 X150.775 Y128.383 F42000
; Slow Down Start
; LINE_WIDTH: 0.34968
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X150.775 Y130.393 E.02688
; Slow Down End
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F12000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.319 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X151.139 Y137.854 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.428 E.12322
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.914 E.14979
M204 S10000
G1 X150.775 Y138.147 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X150.764 Y145.263 E.09542
; Slow Down End
M204 S10000
G1 X149.323 Y146.762 F42000
; Slow Down Start
; LINE_WIDTH: 0.351064
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X149.016 Y146.775 E.00412
G1 X132.444 Y146.775 E.22256
; Slow Down End
M204 S10000
G1 X130.639 Y145.323 F42000
; Slow Down Start
; LINE_WIDTH: 0.350648
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09133
; Slow Down End
M204 S10000
G1 X130.707 Y145.742 F42000
; LINE_WIDTH: 0.468848
G1 F12000
M204 S6000
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.898 Y146.729 E.0044
; LINE_WIDTH: 0.418985
G1 X132.141 Y146.752 E.00395
; LINE_WIDTH: 0.373382
G1 X132.384 Y146.775 E.00349
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.483817
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.01289
G1 X130.741 Y145.792 E.01177
M204 S10000
G1 X130.625 Y130.453 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.625 Y128.444 E.02694
; Slow Down End
M204 S10000
G1 X131.377 Y126.952 F42000
; LINE_WIDTH: 0.40462
G1 F12000
M204 S6000
G1 X130.784 Y126.952 E.00927
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01347
; LINE_WIDTH: 0.39111
G1 X130.638 Y128.074 E.00467
; LINE_WIDTH: 0.373074
G1 X130.625 Y128.384 E.00445
G1 X130.706 Y127.773 E.00882
; LINE_WIDTH: 0.40462
G1 X130.993 Y127.264 E.00913
M73 P49 R10
G1 X131.331 Y126.99 E.00679
M204 S10000
G1 X145.201 Y126.625 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X136.259 Y126.625 E.11992
; Slow Down End
; WIPE_START
G1 X138.259 Y126.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.934 Y133.314 Z1 F42000
G1 X149.323 Y146.762 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.39566
G1 F12000
M204 S6000
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.725 Y145.604 E.00259
; LINE_WIDTH: 0.43249
G1 X150.743 Y145.463 E.00238
; LINE_WIDTH: 0.395643
G1 X150.762 Y145.323 E.00216
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.622 Y146.713 E.00222
; LINE_WIDTH: 0.4325
G1 X149.502 Y146.732 E.00204
; LINE_WIDTH: 0.39566
G1 X149.382 Y146.752 E.00186
; OBJECT_ID: 77
; WIPE_START
G1 X149.502 Y146.732 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.299 Y142.285 Z1 F42000
G1 X123.278 Y127.929 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.503 Y128.059 E.00453
G3 X124.224 Y129.388 I-.921 J1.359 E.02743
G1 X124.224 Y146.812 E.30423
G3 X122.612 Y148.424 I-1.639 J-.028 E.044
G1 X105.188 Y148.424 E.30423
G3 X103.576 Y146.812 I.03 J-1.642 E.04398
G1 X103.577 Y129.33 E.30524
G3 X105.188 Y127.776 I1.641 J.089 E.04298
G1 X122.612 Y127.776 E.30423
G3 X123.223 Y127.906 I-.03 J1.642 E.01097
M204 S250
G1 X123.083 Y128.292 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.271 Y128.399 E.00352
G3 X123.81 Y129.396 I-.685 J1.015 E.01913
G1 X123.81 Y146.804 E.28268
G3 X122.604 Y148.01 I-1.222 J-.016 E.03064
G1 X105.196 Y148.01 E.28268
G3 X103.99 Y146.804 I.018 J-1.224 E.03063
G1 X103.991 Y129.35 E.28341
G3 X105.196 Y128.19 I1.223 J.065 E.0299
G1 X122.604 Y128.19 E.28268
G3 X123.026 Y128.272 I-.018 J1.224 E.00702
; WIPE_START
M204 S6000
G1 X123.271 Y128.399 E-.1048
G1 X123.487 Y128.577 E-.10633
G1 X123.631 Y128.766 E-.09014
G1 X123.724 Y128.951 E-.07894
G1 X123.787 Y129.166 E-.08504
G1 X123.81 Y129.396 E-.08776
G1 X123.81 Y129.941 E-.20699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.23 Y129.05 Z1 F42000
G1 X104.145 Y127.631 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.434 Y128.35 I1.22 J1.917 E.0178
G1 X103.252 Y128.295 E.00333
G3 X103.277 Y127.755 I1.782 J-.187 E.00947
G3 X103.683 Y127.453 I.426 J.149 E.00937
G1 X104.087 Y127.453 E.00707
G1 X104.127 Y127.574 E.00221
; WIPE_START
G1 X103.785 Y127.912 E-.18274
G1 X103.644 Y128.061 E-.07781
G1 X103.434 Y128.35 E-.13576
G1 X103.252 Y128.295 E-.07245
G1 X103.254 Y127.875 E-.15942
G1 X103.277 Y127.755 E-.04647
G1 X103.333 Y127.646 E-.04655
G1 X103.404 Y127.573 E-.0388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.036 Y127.532 Z1 F42000
G1 X124.187 Y127.461 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.547 Y127.883 I-.092 J.443 E.01041
G1 X124.547 Y128.293 E.00716
G1 X124.367 Y128.349 E.0033
G2 X123.653 Y127.64 I-1.834 J1.131 E.01773
G1 X123.706 Y127.452 E.0034
G3 X124.128 Y127.455 I.19 J3.561 E.00736
; WIPE_START
G1 X124.348 Y127.529 E-.08831
G1 X124.44 Y127.61 E-.04655
G1 X124.519 Y127.747 E-.06021
G1 X124.547 Y127.883 E-.05262
G1 X124.547 Y128.293 E-.15578
G1 X124.367 Y128.349 E-.07172
G1 X124.101 Y127.998 E-.16729
G1 X123.934 Y127.838 E-.08793
G1 X123.87 Y127.793 E-.0296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.058 Y135.423 Z1 F42000
G1 X124.363 Y147.849 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.903 E.00336
G3 X124.51 Y148.477 I-1.526 J.188 E.01011
G3 X124.079 Y148.748 I-.418 J-.188 E.00942
G1 X123.711 Y148.748 E.00643
G1 X123.653 Y148.57 E.00326
G2 X124.331 Y147.9 I-1.187 J-1.878 E.01678
; WIPE_START
G1 X124.548 Y147.903 E-.08238
G1 X124.546 Y148.325 E-.16035
G1 X124.51 Y148.477 E-.05953
G1 X124.424 Y148.607 E-.05931
G1 X124.318 Y148.689 E-.05088
G1 X124.187 Y148.738 E-.05306
G1 X124.079 Y148.748 E-.04117
G1 X123.711 Y148.748 E-.1399
G1 X123.653 Y148.57 E-.07098
G1 X123.742 Y148.502 E-.04244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.113 Y148.257 Z1 F42000
G1 X103.432 Y147.849 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.581 Y148.063 E.00455
G2 X104.147 Y148.561 I1.592 J-1.24 E.01324
G1 X104.094 Y148.748 E.0034
G3 X103.544 Y148.718 I-.187 J-1.664 E.00967
G3 X103.252 Y148.279 I.178 J-.435 E.00978
G1 X103.252 Y147.906 E.00652
G1 X103.375 Y147.867 E.00225
; WIPE_START
G1 X103.581 Y148.063 E-.10805
G1 X103.866 Y148.362 E-.15699
G1 X104.147 Y148.561 E-.1308
G1 X104.094 Y148.748 E-.07395
G1 X103.675 Y148.746 E-.15932
G1 X103.544 Y148.718 E-.05091
G1 X103.446 Y148.667 E-.04209
G1 X103.375 Y148.597 E-.0379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.697 Y143.127 Z1 F42000
G1 X124.332 Y127.056 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.866 I-.234 J.846 E.01932
G1 X124.976 Y148.288 E.35657
G3 X124.088 Y149.176 I-.891 J-.002 E.02437
G1 X103.712 Y149.176 E.35576
G3 X102.824 Y148.288 I0 J-.888 E.02438
G1 X102.824 Y127.912 E.35576
G3 X103.666 Y127.025 I.895 J.006 E.02352
G1 X124.207 Y127.031 E.35866
G3 X124.273 Y127.042 I-.109 J.871 E.00117
M204 S250
G1 X124.467 Y126.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.683 Y126.75 E.00378
G3 X125.389 Y127.85 I-.586 J1.152 E.02223
G1 X125.39 Y148.296 E.33201
G3 X124.096 Y149.59 I-1.308 J-.014 E.03291
G1 X103.704 Y149.59 E.33112
G3 X102.41 Y148.296 I.012 J-1.306 E.03293
G1 X102.41 Y127.904 E.33112
G3 X103.65 Y126.611 I1.315 J.02 E.032
G1 X124.253 Y126.619 E.33456
G3 X124.409 Y126.648 I-.156 J1.283 E.00258
; WIPE_START
M204 S6000
G1 X124.683 Y126.75 E-.11113
G1 X124.939 Y126.921 E-.11683
G1 X125.081 Y127.062 E-.07616
G1 X125.199 Y127.224 E-.07612
G1 X125.315 Y127.468 E-.10247
G1 X125.354 Y127.598 E-.05179
G1 X125.389 Y127.85 E-.09636
G1 X125.389 Y128.189 E-.12915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.112 Y127.686 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.093633
G1 F15000
M204 S6000
G3 X124.245 Y127.779 I-.258 J.509 E.00048
G1 X124.312 Y127.885 E.00037
M204 S10000
G1 X124.509 Y128.529 F42000
; LINE_WIDTH: 0.439591
G1 F15000
M204 S6000
G1 X124.559 Y128.83 E.00519
; LINE_WIDTH: 0.403583
G1 X124.581 Y129.007 E.00279
; LINE_WIDTH: 0.345854
G1 X124.599 Y129.384 E.00498
G1 X124.6 Y146.816 E.23041
G1 X124.582 Y147.183 E.00486
; LINE_WIDTH: 0.39633
G1 X124.567 Y147.309 E.00193
; LINE_WIDTH: 0.425679
G1 X124.553 Y147.413 E.00173
; LINE_WIDTH: 0.448546
G3 X124.508 Y147.668 I-5.212 J-.789 E.00451
M204 S10000
G1 X124.313 Y148.314 F42000
; LINE_WIDTH: 0.0940115
G1 F15000
M204 S6000
G1 X124.282 Y148.371 E.00019
G3 X124.114 Y148.512 I-.315 J-.206 E.00066
M204 S10000
G1 X123.473 Y148.709 F42000
; LINE_WIDTH: 0.440302
G1 F15000
M204 S6000
G3 X123.153 Y148.762 I-1.24 J-6.447 E.00553
; LINE_WIDTH: 0.40062
G1 X122.975 Y148.783 E.00277
; LINE_WIDTH: 0.34645
G1 X122.616 Y148.8 E.00476
G1 X105.025 Y148.797 E.23293
G3 X104.795 Y148.78 I.163 J-3.895 E.00305
; LINE_WIDTH: 0.399022
G1 X104.691 Y148.767 E.00162
; LINE_WIDTH: 0.44245
G1 X104.587 Y148.753 E.0018
G3 X104.328 Y148.708 I.797 J-5.264 E.0045
M204 S10000
G1 X103.687 Y148.513 F42000
; LINE_WIDTH: 0.094001
G1 F15000
M204 S6000
G3 X103.488 Y148.314 I.139 J-.338 E.00085
M204 S10000
G1 X103.29 Y147.669 F42000
; LINE_WIDTH: 0.440396
G1 F15000
M204 S6000
G1 X103.24 Y147.371 E.00517
; LINE_WIDTH: 0.404703
G1 X103.219 Y147.193 E.0028
; LINE_WIDTH: 0.346686
G1 X103.2 Y146.816 E.00499
G1 X103.211 Y129.103 E.23471
; LINE_WIDTH: 0.385739
G1 X103.23 Y128.907 E.00293
; LINE_WIDTH: 0.429939
G1 X103.286 Y128.529 E.00636
M204 S10000
G1 X103.487 Y127.887 F42000
; LINE_WIDTH: 0.0942046
G1 F15000
M204 S6000
G3 X103.687 Y127.688 I.35 J.15 E.00086
M204 S10000
G1 X104.326 Y127.492 F42000
; LINE_WIDTH: 0.44052
G1 F15000
M204 S6000
G1 X104.627 Y127.441 E.00522
; LINE_WIDTH: 0.403892
G1 X104.807 Y127.419 E.00283
; LINE_WIDTH: 0.345679
G1 X105.184 Y127.401 E.00498
G1 X122.616 Y127.4 E.23028
G1 X122.984 Y127.418 E.00486
; LINE_WIDTH: 0.396072
G1 X123.109 Y127.433 E.00193
; LINE_WIDTH: 0.425371
G1 X123.213 Y127.447 E.00173
; LINE_WIDTH: 0.448857
G3 X123.472 Y127.493 I-.816 J5.378 E.00458
; OBJECT_ID: 66
; WIPE_START
G1 X123.213 Y127.447 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.498 Y119.82 Z1 F42000
G1 X123.913 Y108.726 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.968 Y108.782 E.00138
G3 X124.042 Y109.058 I-.35 J.243 E.00509
G1 X124.042 Y121.542 E.21796
G3 X123.58 Y122.004 I-.442 J.02 E.01283
G1 X111.097 Y122.004 E.21796
G3 X110.635 Y121.542 I-.02 J-.442 E.01283
G1 X110.635 Y109.058 E.21796
G3 X111.097 Y108.596 I.442 J-.02 E.01283
G1 X123.58 Y108.596 E.21796
G1 X123.711 Y108.609 E.00229
G3 X123.856 Y108.672 I-.094 J.416 E.00277
G1 X123.869 Y108.685 E.00033
M204 S10000
G1 X124.221 Y108.417 F42000
G1 F6000
M204 S6000
G3 X124.471 Y109.037 I-.601 J.602 E.01199
G1 X124.471 Y121.563 E.2187
G3 X123.601 Y122.432 I-.856 J.013 E.02395
G1 X111.076 Y122.432 E.2187
G3 X110.207 Y121.563 I-.013 J-.856 E.02395
G1 X110.207 Y109.037 E.2187
G3 X111.076 Y108.168 I.856 J-.013 E.02395
G1 X123.611 Y108.169 E.21887
G3 X124.177 Y108.376 I.009 J.851 E.01076
M204 S250
G1 X124.511 Y108.117 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.515 Y108.123 E.00013
G3 X124.884 Y109.017 I-.886 J.889 E.01612
G1 X124.884 Y121.583 E.20405
G3 X123.622 Y122.846 I-1.258 J.004 E.03224
G1 X111.056 Y122.846 E.20405
G3 X109.793 Y121.583 I-.004 J-1.258 E.03224
G1 X109.793 Y109.017 E.20405
G3 X111.056 Y107.754 I1.258 J-.004 E.03224
G1 X123.652 Y107.757 E.20454
G3 X124.326 Y107.968 I-.023 J1.255 E.01162
G1 X124.464 Y108.079 E.00288
; WIPE_START
M204 S6000
G1 X124.515 Y108.123 E-.0257
G1 X124.672 Y108.311 E-.09314
G1 X124.788 Y108.528 E-.09321
G1 X124.859 Y108.763 E-.09321
G1 X124.884 Y109.017 E-.09714
G1 X124.884 Y109.958 E-.35761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.281 Y109.296 Z1 F42000
G1 X111.218 Y108.769 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42813
G1 F15000
M204 S6000
G1 X111.012 Y108.974 E.00482
G2 X110.987 Y109.089 I.117 J.086 E.002
G1 X110.987 Y109.575 E.00805
G1 X111.613 Y108.948 E.01469
G1 X112.188 Y108.948 E.00953
G1 X110.987 Y110.15 E.02816
G1 X110.987 Y110.725 E.00953
G1 X112.764 Y108.948 E.04164
G1 X113.339 Y108.948 E.00953
G1 X110.987 Y111.3 E.05512
G1 X110.987 Y111.875 E.00953
G1 X113.914 Y108.948 E.06859
G1 X114.489 Y108.948 E.00953
G1 X110.987 Y112.45 E.08207
G1 X110.987 Y113.025 E.00953
G1 X115.064 Y108.948 E.09555
G1 X115.639 Y108.948 E.00953
G1 X110.987 Y113.6 E.10902
G1 X110.987 Y114.176 E.00953
G1 X116.214 Y108.948 E.1225
G1 X116.789 Y108.948 E.00953
G1 X110.987 Y114.751 E.13597
G1 X110.987 Y115.326 E.00953
G1 X117.364 Y108.948 E.14945
G1 X117.94 Y108.948 E.00953
G1 X110.987 Y115.901 E.16293
G1 X110.987 Y116.476 E.00953
G1 X118.515 Y108.948 E.1764
G1 X119.09 Y108.948 E.00953
G1 X110.987 Y117.051 E.18988
G1 X110.987 Y117.626 E.00953
G1 X119.665 Y108.948 E.20336
G1 X120.24 Y108.948 E.00953
G1 X110.987 Y118.201 E.21683
G1 X110.987 Y118.777 E.00953
G1 X120.815 Y108.948 E.23031
G1 X121.39 Y108.948 E.00953
G1 X110.987 Y119.352 E.24379
G1 X110.987 Y119.927 E.00953
G1 X121.965 Y108.948 E.25726
G1 X122.541 Y108.948 E.00953
G1 X110.987 Y120.502 E.27074
G1 X110.987 Y121.077 E.00953
G1 X123.116 Y108.948 E.28421
G1 X123.563 Y108.948 E.00741
G3 X123.664 Y108.974 I.016 J.149 E.00178
G1 X111.012 Y121.626 E.29647
G2 X111.127 Y121.652 I.089 J-.127 E.002
G1 X111.562 Y121.652 E.0072
G1 X123.691 Y109.523 E.28422
G1 X123.691 Y110.098 E.00953
G1 X112.137 Y121.652 E.27074
G1 X112.712 Y121.652 E.00953
G1 X123.691 Y110.673 E.25726
G1 X123.691 Y111.248 E.00953
G1 X113.287 Y121.652 E.24379
G1 X113.862 Y121.652 E.00953
G1 X123.691 Y111.823 E.23031
G1 X123.691 Y112.399 E.00953
G1 X114.437 Y121.652 E.21683
G1 X115.012 Y121.652 E.00953
G1 X123.691 Y112.974 E.20336
G1 X123.691 Y113.549 E.00953
G1 X115.587 Y121.652 E.18988
G1 X116.163 Y121.652 E.00953
G1 X123.691 Y114.124 E.1764
G1 X123.691 Y114.699 E.00953
G1 X116.738 Y121.652 E.16293
G1 X117.313 Y121.652 E.00953
G1 X123.691 Y115.274 E.14945
G1 X123.691 Y115.849 E.00953
M73 P50 R10
G1 X117.888 Y121.652 E.13598
G1 X118.463 Y121.652 E.00953
G1 X123.691 Y116.424 E.1225
G1 X123.691 Y117 E.00953
G1 X119.038 Y121.652 E.10902
G1 X119.613 Y121.652 E.00953
G1 X123.691 Y117.575 E.09555
G1 X123.691 Y118.15 E.00953
G1 X120.188 Y121.652 E.08207
G1 X120.763 Y121.652 E.00953
G1 X123.691 Y118.725 E.06859
G1 X123.691 Y119.3 E.00953
G1 X121.339 Y121.652 E.05512
G1 X121.914 Y121.652 E.00953
G1 X123.691 Y119.875 E.04164
G1 X123.691 Y120.45 E.00953
G1 X122.489 Y121.652 E.02816
G1 X123.064 Y121.652 E.00953
G1 X123.691 Y121.025 E.01469
G1 X123.691 Y121.511 E.00805
G3 X123.666 Y121.626 I-.142 J.029 E.00199
G1 X123.46 Y121.832 E.00483
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.666 Y121.626 E-.11069
G1 X123.691 Y121.511 E-.04442
G1 X123.691 Y121.025 E-.18468
G1 X123.064 Y121.652 E-.33685
G1 X122.845 Y121.652 E-.08336
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 7/53
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.793 J.923 P1  F42000
G1 X148.802 Y143.96 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.1 F42000
G1 X151.648 Y132.298 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.983 E.20395
G3 X151.979 Y148.748 I-.751 J.015 E.02117
G1 X129.411 Y148.748 E.39404
G3 X128.653 Y148.029 I-.008 J-.75 E.02017
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.368 Y124.653 I.755 J-.013 E.02027
G1 X130.998 Y124.653 E.02845
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.019 Y124.653 I.793 J40.97 E.02823
G3 X152.747 Y125.371 I-.027 J.755 E.01961
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.99 E.21156
G3 X151.987 Y149.176 I-1.179 J.008 E.03265
G1 X129.406 Y149.176 E.39427
G3 X128.225 Y148.046 I-.003 J-1.179 E.03155
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.12771
G3 X129.353 Y124.225 I1.186 J-.002 E.03158
G1 X131.426 Y124.224 E.03621
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G3 X152.04 Y124.224 I1.01 J52.66 E.03608
G3 X153.175 Y125.354 I-.051 J1.187 E.03069
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.997 E.20357
G3 X151.996 Y149.59 I-1.592 J.001 E.04066
G1 X129.402 Y149.59 E.36688
G3 X127.811 Y148.062 I.001 J-1.593 E.03955
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.337 Y123.811 I1.603 J.008 E.03952
G1 X131.84 Y123.81 E.04064
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G3 X152.06 Y123.811 I1.219 J63.434 E.0406
G3 X153.589 Y125.338 I-.075 J1.603 E.03848
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z1.1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer7 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X132.184 Y145.016 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27007
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.207 Y145.072 E.0015
M204 S10000
G1 X131.786 Y145.016 F42000
G1 F15000
M204 S6000
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27007
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01116
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.798 Y145.075 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
M73 P51 R10
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.332 I-327.131 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.306 Y125.863 E.00376
G1 X151.289 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.934 E.17569
G1 X151.916 Y147.936 E.36455
G1 X151.936 Y147.916 E.00045
G1 X151.936 Y137.114 E.1754
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.489 E.09737
G2 X151.083 Y125.464 I-.702 J9.42 E.01384
G1 X151.02 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01384
G2 X129.464 Y131.486 I1128.933 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.997 E.18319
G1 X129.147 Y148.206 E.00362
G2 X129.476 Y148.334 I.293 J-.262 E.00596
G1 X151.961 Y148.334 E.3651
G1 X152.214 Y148.244 E.00436
G1 X152.323 Y148.023 E.004
G1 X152.334 Y147.916 E.00174
G1 X152.334 Y136.716 E.18187
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.422 E.10494
G1 X152.259 Y125.209 E.00366
G1 X152.095 Y125.087 E.00332
G2 X150.816 Y125.066 I-1.001 J21.502 E.02078
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.401 Y125.067 E.01921
G1 X129.195 Y125.147 E.0036
G1 X129.083 Y125.32 E.00335
G1 X129.066 Y126.013 E.01125
G1 X129.066 Y131.884 E.09534
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09555
M204 S10000
G1 X150.762 Y145.323 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y146.716 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y145.624 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y145.503 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 77
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X130.542 Y140.215 Z1.1 F42000
G1 X123.218 Y127.903 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.272 Y127.928 E.00103
G3 X124.224 Y129.388 I-.689 J1.489 E.03208
G1 X124.224 Y146.812 E.30423
G3 X122.618 Y148.424 I-1.647 J-.036 E.04383
G1 X105.188 Y148.424 E.30434
G3 X103.576 Y146.812 I.029 J-1.64 E.04399
G1 X103.577 Y129.33 E.30524
G3 X105.182 Y127.776 I1.638 J.087 E.04289
G1 X122.618 Y127.776 E.30445
G3 X122.963 Y127.821 I-.035 J1.64 E.00608
G1 X123.161 Y127.885 E.00364
M204 S250
G1 X123.086 Y128.294 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.103 Y128.304 E.00032
G3 X123.81 Y129.396 I-.516 J1.109 E.02227
G1 X123.81 Y146.804 E.28268
G3 X122.606 Y148.01 I-1.229 J-.023 E.03057
G1 X105.196 Y148.01 E.28271
G3 X103.99 Y146.804 I.017 J-1.223 E.03064
G1 X103.991 Y129.35 E.28341
G3 X105.194 Y128.19 I1.221 J.062 E.02988
G1 X122.606 Y128.19 E.28274
G3 X122.872 Y128.223 I-.019 J1.223 E.00436
G1 X123.029 Y128.275 E.00268
; WIPE_START
M204 S6000
G1 X123.103 Y128.304 E-.03017
G1 X123.31 Y128.42 E-.0902
G1 X123.487 Y128.577 E-.09006
G1 X123.612 Y128.736 E-.07676
G1 X123.719 Y128.939 E-.08707
G1 X123.787 Y129.166 E-.09017
G1 X123.81 Y129.396 E-.08777
G1 X123.81 Y129.943 E-.20781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.229 Y129.056 Z1.1 F42000
G1 X104.143 Y127.643 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G2 X103.439 Y128.347 I1.21 J1.913 E.01753
G1 X103.252 Y128.294 E.0034
G3 X103.288 Y127.726 I1.553 J-.187 E.00999
G3 X103.692 Y127.453 I.415 J.178 E.00899
G1 X104.092 Y127.453 E.00698
G1 X104.127 Y127.585 E.00239
; WIPE_START
G1 X103.883 Y127.825 E-.13001
G1 X103.748 Y127.948 E-.0695
G1 X103.625 Y128.083 E-.06951
G1 X103.439 Y128.347 E-.12262
G1 X103.252 Y128.294 E-.07395
G1 X103.254 Y127.875 E-.1593
G1 X103.288 Y127.726 E-.058
G1 X103.351 Y127.621 E-.0466
G1 X103.409 Y127.566 E-.0305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.041 Y127.529 Z1.1 F42000
G1 X124.198 Y127.466 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.293 Y127.498 E.00175
G3 X124.547 Y127.892 I-.201 J.408 E.00858
G1 X124.547 Y128.289 E.00694
G1 X124.369 Y128.346 E.00327
G2 X123.649 Y127.637 I-1.864 J1.172 E.0178
G1 X123.703 Y127.452 E.00336
G3 X124.139 Y127.456 I.188 J3.718 E.00762
; WIPE_START
G1 X124.293 Y127.498 E-.06067
G1 X124.433 Y127.602 E-.06623
G1 X124.516 Y127.736 E-.05961
G1 X124.547 Y127.892 E-.06044
G1 X124.547 Y128.289 E-.15096
G1 X124.369 Y128.346 E-.07117
G1 X124.102 Y128 E-.16628
G1 X123.95 Y127.853 E-.08023
G1 X123.855 Y127.785 E-.04441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.048 Y135.415 Z1.1 F42000
G1 X124.363 Y147.849 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X124.548 Y147.903 E.00336
G3 X124.507 Y148.484 I-1.471 J.188 E.01024
G3 X124.079 Y148.748 I-.412 J-.189 E.00931
G1 X123.705 Y148.748 E.00653
G1 X123.65 Y148.565 E.00333
G2 X124.331 Y147.9 I-1.107 J-1.814 E.01678
; WIPE_START
G1 X124.548 Y147.903 E-.08229
G1 X124.546 Y148.325 E-.16029
G1 X124.507 Y148.484 E-.06236
G1 X124.433 Y148.598 E-.05145
G1 X124.325 Y148.686 E-.05312
G1 X124.187 Y148.738 E-.05588
G1 X124.079 Y148.748 E-.04128
G1 X123.705 Y148.748 E-.14201
G1 X123.65 Y148.565 E-.07246
G1 X123.732 Y148.504 E-.03885
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.103 Y148.259 Z1.1 F42000
G1 X103.43 Y147.852 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X103.586 Y148.069 E.00466
G2 X104.151 Y148.563 I2.061 J-1.786 E.01315
G1 X104.097 Y148.748 E.00336
G3 X103.554 Y148.722 I-.188 J-1.783 E.00953
G3 X103.252 Y148.279 I.16 J-.433 E.00999
G1 X103.252 Y147.91 E.00645
G1 X103.373 Y147.87 E.00222
; WIPE_START
G1 X103.586 Y148.069 E-.11054
G1 X103.85 Y148.347 E-.14582
G1 X104.151 Y148.563 E-.14076
G1 X104.097 Y148.748 E-.07321
G1 X103.675 Y148.746 E-.16035
G1 X103.554 Y148.722 E-.04698
G1 X103.446 Y148.668 E-.04601
G1 X103.377 Y148.601 E-.03633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.7 Y143.131 Z1.1 F42000
G1 X124.34 Y127.058 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X124.975 Y127.871 I-.242 J.843 E.01926
G1 X124.976 Y148.288 E.35648
G3 X124.087 Y149.176 I-.889 J-.001 E.02438
G1 X103.712 Y149.176 E.35575
G3 X102.824 Y148.288 I.005 J-.894 E.02434
G1 X102.824 Y127.912 E.35576
G3 X103.671 Y127.025 I.888 J0 E.02366
G1 X124.208 Y127.031 E.35858
G3 X124.282 Y127.043 I-.11 J.871 E.0013
M204 S250
G1 X124.464 Y126.664 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.683 Y126.75 E.00383
G3 X125.389 Y127.851 I-.586 J1.152 E.02226
G1 X125.39 Y148.296 E.33198
G3 X124.096 Y149.59 I-1.307 J-.013 E.03292
G1 X103.704 Y149.59 E.33112
G3 X102.41 Y148.296 I.018 J-1.312 E.03289
G1 X102.41 Y127.904 E.33112
G3 X103.651 Y126.611 I1.307 J.012 E.03207
G1 X124.253 Y126.619 E.33454
G3 X124.406 Y126.647 I-.156 J1.283 E.00253
; WIPE_START
M204 S6000
G1 X124.683 Y126.75 E-.11232
G1 X124.905 Y126.892 E-.09994
G1 X125.079 Y127.061 E-.09221
G1 X125.225 Y127.27 E-.09682
G1 X125.309 Y127.452 E-.07619
G1 X125.354 Y127.6 E-.05902
G1 X125.389 Y127.851 E-.09625
G1 X125.389 Y128.186 E-.12727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y127.684 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0942751
G1 F15000
M204 S6000
G3 X124.312 Y127.887 I-.141 J.337 E.00087
M204 S10000
G1 X124.508 Y128.527 F42000
; LINE_WIDTH: 0.440439
G1 F15000
M204 S6000
G1 X124.559 Y128.827 E.0052
; LINE_WIDTH: 0.403934
G1 X124.581 Y129.007 E.00283
; LINE_WIDTH: 0.345854
G1 X124.599 Y129.384 E.00498
G1 X124.6 Y146.816 E.2304
G1 X124.582 Y147.183 E.00486
; LINE_WIDTH: 0.396793
G1 X124.566 Y147.312 E.00199
; LINE_WIDTH: 0.427072
G1 X124.552 Y147.42 E.0018
; LINE_WIDTH: 0.449929
G3 X124.507 Y147.667 I-4.349 J-.674 E.00439
M204 S10000
G1 X124.313 Y148.314 F42000
; LINE_WIDTH: 0.0940667
G1 F15000
M204 S6000
G3 X124.116 Y148.513 I-.385 J-.184 E.00084
M204 S10000
G1 X123.47 Y148.712 F42000
; LINE_WIDTH: 0.438077
G1 F15000
M204 S6000
G1 X123.145 Y148.763 E.00559
; LINE_WIDTH: 0.400968
G1 X122.987 Y148.782 E.00246
; LINE_WIDTH: 0.346473
G1 X122.625 Y148.8 E.0048
G1 X105.025 Y148.797 E.23306
G3 X104.795 Y148.78 I.161 J-3.859 E.00305
; LINE_WIDTH: 0.3996
G1 X104.687 Y148.766 E.00168
; LINE_WIDTH: 0.443309
G1 X104.578 Y148.752 E.00188
G3 X104.333 Y148.707 I.656 J-4.215 E.0043
M204 S10000
G1 X103.686 Y148.513 F42000
; LINE_WIDTH: 0.094099
G1 F15000
M204 S6000
G3 X103.488 Y148.314 I.139 J-.337 E.00085
M204 S10000
G1 X103.291 Y147.672 F42000
; LINE_WIDTH: 0.441234
G1 F15000
M204 S6000
G1 X103.241 Y147.373 E.00517
; LINE_WIDTH: 0.405105
G1 X103.219 Y147.193 E.00284
; LINE_WIDTH: 0.346686
G1 X103.2 Y146.816 E.005
G1 X103.211 Y129.104 E.23471
; LINE_WIDTH: 0.383041
G1 X103.227 Y128.934 E.00251
; LINE_WIDTH: 0.422153
G1 X103.25 Y128.768 E.00274
; LINE_WIDTH: 0.452319
G3 X103.294 Y128.529 I4.835 J.775 E.00426
M204 S10000
G1 X103.488 Y127.888 F42000
; LINE_WIDTH: 0.0929878
G1 F15000
M204 S6000
G3 X103.689 Y127.687 I.328 J.128 E.00085
M204 S10000
G1 X104.324 Y127.492 F42000
; LINE_WIDTH: 0.442526
G1 F15000
M204 S6000
G1 X104.616 Y127.443 E.00507
; LINE_WIDTH: 0.406925
G1 X104.796 Y127.421 E.00285
; LINE_WIDTH: 0.34556
M73 P52 R10
G1 X105.175 Y127.401 E.00502
G1 X122.825 Y127.406 E.23307
; LINE_WIDTH: 0.376721
G3 X123.043 Y127.424 I-.212 J3.797 E.00317
G1 X123.061 Y127.426 E.00026
; LINE_WIDTH: 0.421171
G1 X123.231 Y127.449 E.00279
; LINE_WIDTH: 0.451416
G3 X123.468 Y127.494 I-.661 J4.147 E.00422
; OBJECT_ID: 66
; WIPE_START
G1 X123.231 Y127.449 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.518 Y119.822 Z1.1 F42000
G1 X123.938 Y108.701 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X123.994 Y108.759 E.00141
G3 X124.071 Y109.041 I-.36 J.249 E.00521
G1 X124.071 Y121.559 E.21856
G3 X123.597 Y122.032 I-.454 J.019 E.01313
G1 X111.08 Y122.032 E.21856
G3 X110.607 Y121.559 I-.019 J-.454 E.01313
G1 X110.607 Y109.041 E.21856
G3 X111.08 Y108.568 I.454 J-.019 E.01313
G1 X123.597 Y108.568 E.21855
G1 X123.73 Y108.581 E.00234
G3 X123.879 Y108.645 I-.096 J.427 E.00284
G1 X123.894 Y108.66 E.00036
M204 S10000
G1 X124.245 Y108.394 F42000
G1 F6000
M204 S6000
G3 X124.499 Y109.02 I-.611 J.613 E.01213
G1 X124.499 Y121.58 E.21929
G3 X123.618 Y122.46 I-.867 J.014 E.02426
G1 X111.059 Y122.46 E.21929
G3 X110.178 Y121.58 I-.014 J-.867 E.02426
G1 X110.178 Y109.02 E.21929
G3 X111.059 Y108.14 I.867 J-.014 E.02426
G1 X123.636 Y108.141 E.2196
G3 X124.201 Y108.353 I-.002 J.865 E.01076
M204 S250
G1 X124.534 Y108.091 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.54 Y108.098 E.00015
G3 X124.913 Y109 I-.893 J.897 E.01626
G1 X124.913 Y121.6 E.2046
G3 X123.639 Y122.874 I-1.269 J.005 E.03252
G1 X111.039 Y122.874 E.2046
G3 X109.765 Y121.6 I-.005 J-1.269 E.03252
G1 X109.765 Y109 E.2046
G3 X111.039 Y107.726 I1.269 J-.005 E.03252
G1 X123.676 Y107.73 E.20521
G3 X124.349 Y107.942 I-.029 J1.265 E.01161
G1 X124.488 Y108.053 E.00289
; WIPE_START
M204 S6000
G1 X124.54 Y108.098 E-.02632
G1 X124.699 Y108.288 E-.09397
G1 X124.816 Y108.506 E-.09406
G1 X124.887 Y108.743 E-.09406
G1 X124.913 Y109 E-.09796
G1 X124.913 Y109.931 E-.35363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.898 Y109.159 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X123.68 Y108.941 E.00502
G2 X123.58 Y108.92 I-.085 J.155 E.0017
G1 X123.094 Y108.92 E.0079
G1 X123.719 Y109.544 E.01437
G1 X123.719 Y110.109 E.00918
G1 X122.53 Y108.92 E.02736
G1 X121.965 Y108.92 E.00918
G1 X123.719 Y110.674 E.04035
G1 X123.719 Y111.238 E.00918
G1 X121.4 Y108.92 E.05334
G1 X120.836 Y108.92 E.00918
G1 X123.719 Y111.803 E.06633
G1 X123.719 Y112.368 E.00918
G1 X120.271 Y108.92 E.07932
G1 X119.707 Y108.92 E.00918
G1 X123.719 Y112.932 E.09231
G1 X123.719 Y113.497 E.00918
G1 X119.142 Y108.92 E.1053
G1 X118.577 Y108.92 E.00918
G1 X123.719 Y114.061 E.11829
G1 X123.719 Y114.626 E.00918
G1 X118.013 Y108.92 E.13128
G1 X117.448 Y108.92 E.00918
G1 X123.719 Y115.191 E.14426
G1 X123.719 Y115.755 E.00918
G1 X116.883 Y108.92 E.15725
G1 X116.319 Y108.92 E.00918
G1 X123.719 Y116.32 E.17024
G1 X123.719 Y116.885 E.00918
G1 X115.754 Y108.92 E.18323
G1 X115.19 Y108.92 E.00918
G1 X123.719 Y117.449 E.19622
G1 X123.719 Y118.014 E.00918
G1 X114.625 Y108.92 E.20921
G1 X114.06 Y108.92 E.00918
G1 X123.719 Y118.578 E.2222
G1 X123.719 Y119.143 E.00918
G1 X113.496 Y108.92 E.23519
G1 X112.931 Y108.92 E.00918
G1 X123.719 Y119.708 E.24818
G1 X123.719 Y120.272 E.00918
G1 X112.366 Y108.92 E.26117
G1 X111.802 Y108.92 E.00918
G1 X123.719 Y120.837 E.27416
G1 X123.719 Y121.402 E.00918
G1 X111.237 Y108.92 E.28715
G2 X110.977 Y108.964 I-.063 J.414 E.00437
G2 X110.958 Y109.205 I.683 J.175 E.00396
G1 X123.433 Y121.68 E.28699
G1 X122.869 Y121.68 E.00918
G1 X110.958 Y109.77 E.274
G1 X110.958 Y110.335 E.00918
G1 X122.304 Y121.68 E.26101
G1 X121.74 Y121.68 E.00918
G1 X110.958 Y110.899 E.24802
G1 X110.958 Y111.464 E.00918
G1 X121.175 Y121.68 E.23503
G1 X120.61 Y121.68 E.00918
G1 X110.958 Y112.028 E.22204
G1 X110.958 Y112.593 E.00918
G1 X120.046 Y121.68 E.20906
G1 X119.481 Y121.68 E.00918
G1 X110.958 Y113.158 E.19607
G1 X110.958 Y113.722 E.00918
G1 X118.916 Y121.68 E.18308
G1 X118.352 Y121.68 E.00918
G1 X110.958 Y114.287 E.17009
G1 X110.958 Y114.852 E.00918
G1 X117.787 Y121.68 E.1571
G1 X117.223 Y121.68 E.00918
G1 X110.958 Y115.416 E.14411
G1 X110.958 Y115.981 E.00918
G1 X116.658 Y121.68 E.13112
G1 X116.093 Y121.68 E.00918
G1 X110.958 Y116.545 E.11813
G1 X110.958 Y117.11 E.00918
G1 X115.529 Y121.68 E.10514
G1 X114.964 Y121.68 E.00918
G1 X110.958 Y117.675 E.09215
G1 X110.958 Y118.239 E.00918
G1 X114.399 Y121.68 E.07916
G1 X113.835 Y121.68 E.00918
G1 X110.958 Y118.804 E.06618
G1 X110.958 Y119.369 E.00918
G1 X113.27 Y121.68 E.05319
M73 P52 R9
G1 X112.706 Y121.68 E.00918
G1 X110.958 Y119.933 E.0402
G1 X110.958 Y120.498 E.00918
G1 X112.141 Y121.68 E.02721
G1 X111.576 Y121.68 E.00918
G1 X110.779 Y120.883 E.01834
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X111.576 Y121.68 E-.42854
G1 X112.141 Y121.68 E-.21456
G1 X111.923 Y121.463 E-.11691
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 8/53
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S191.25
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I-.634 J1.039 P1  F42000
G1 X148.802 Y143.96 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.2 F42000
G1 X151.648 Y132.298 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.747 Y148.029 E.20476
G3 X151.979 Y148.748 I-.752 J-.034 E.02033
G1 X129.411 Y148.748 E.39404
G3 X128.653 Y148.029 I-.006 J-.753 E.02016
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.756 J-.013 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.019 Y124.653 I.793 J40.72 E.02823
G3 X152.747 Y125.371 I-.032 J.76 E.01958
G1 X152.748 Y132.298 E.12094
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.175 Y148.046 E.21253
G3 X151.987 Y149.176 I-1.181 J-.051 E.03164
G1 X129.406 Y149.176 E.39427
G3 X128.225 Y148.046 I.01 J-1.193 E.03146
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.413 E.1277
G3 X129.348 Y124.225 I1.187 J-.002 E.03151
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G3 X152.04 Y124.224 I1.01 J52.087 E.03608
G3 X153.175 Y125.354 I-.057 J1.192 E.03065
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.589 Y148.062 E.20463
G3 X151.996 Y149.59 I-1.594 J-.068 E.03957
G1 X129.402 Y149.59 E.36688
G3 X127.811 Y148.062 I.018 J-1.611 E.03945
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.603 J.008 E.0395
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G3 X152.06 Y123.811 I1.219 J63.257 E.0406
G3 X153.589 Y125.338 I-.081 J1.61 E.03844
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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
G1 Z1.2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer8 end: 66,77,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
M73 P53 R9
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.138 Y147.139 E.33896
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01021
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.571 I-1.394 J0 E.00925
G1 X150.002 Y146.003 E.00849
G1 X149.57 Y146.297 E.00848
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.331 I-327.08 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.0066
G1 X149.721 Y145.721 E.0061
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.536 Y147.537 E.35328
G1 X151.537 Y137.513 E.16342
G1 X151.06 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y132.084 E.0751
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.306 Y125.863 E.00376
G1 X151.289 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G2 X129.47 Y147.931 I1737.201 J4.487 E.17565
G1 X151.934 Y147.936 E.36477
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G2 X151.933 Y125.466 I-1054.876 J-2.551 E.09774
G2 X151.083 Y125.464 I-.751 J147.977 E.0138
G1 X151.02 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.467 Y125.465 E.01381
G2 X129.464 Y131.486 I510.281 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18317
G1 X129.14 Y148.199 E.0035
G1 X129.3 Y148.312 E.00317
G1 X129.47 Y148.334 E.00279
G1 X151.961 Y148.334 E.3652
G1 X152.211 Y148.247 E.00429
G1 X152.326 Y148.024 E.00407
G1 X152.333 Y147.937 E.00143
G1 X152.334 Y136.716 E.1822
G1 X151.434 Y136.716 E.01462
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.404 E.10523
G1 X152.275 Y125.223 E.00308
G1 X152.094 Y125.087 E.00367
G2 X150.816 Y125.066 I-1 J21.641 E.02077
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.393 Y125.067 E.01934
G1 X129.197 Y125.146 E.00344
G1 X129.079 Y125.335 E.00363
G1 X129.066 Y131.884 E.10634
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X131.786 Y128.384 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y127.851 I.649 J.031 E.01059
G3 X132.384 Y127.786 I.271 J.533 E.00456
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27008
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01115
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.444 E.2691
M204 S10000
G1 X132.184 Y128.384 F42000
G1 F15000
M204 S6000
G1 X132.228 Y128.259 E.00215
G1 X132.349 Y128.187 E.00228
G1 X132.384 Y128.184 E.00056
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27008
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.444 E.2691
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09535
M204 S10000
G1 X150.761 Y145.323 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y145.463 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.309 E.01296
G1 X149.742 Y146.693 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y146.716 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y146.725 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y146.707 E.00268
G1 X150.705 Y146.707 E.01819
G1 X150.705 Y145.745 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y145.624 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y145.503 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 77
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G1 X130.448 Y140.272 Z1.2 F42000
G1 X123.087 Y128.294 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.105 Y128.305 E.00034
G3 X123.81 Y129.396 I-.519 J1.109 E.02223
G1 X123.81 Y146.804 E.28268
G3 X122.604 Y148.01 I-1.224 J-.018 E.03063
G1 X105.196 Y148.01 E.28267
G3 X103.99 Y146.804 I.018 J-1.224 E.03064
G1 X103.991 Y129.35 E.28341
G3 X105.196 Y128.19 I1.219 J.06 E.02993
G1 X122.604 Y128.19 E.28267
G3 X122.836 Y128.216 I-.018 J1.224 E.00379
G1 X123.03 Y128.276 E.0033
; WIPE_START
M204 S6000
G1 X123.105 Y128.305 E-.03055
G1 X123.231 Y128.367 E-.05335
G1 X123.42 Y128.51 E-.09012
G1 X123.578 Y128.687 E-.09028
G1 X123.679 Y128.852 E-.07363
G1 X123.765 Y129.072 E-.08939
G1 X123.81 Y129.396 E-.12439
G1 X123.81 Y129.944 E-.20828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.468 Y126.667 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.5 Y126.674 E.00054
G3 X125.389 Y127.851 I-.403 J1.228 E.02548
G1 X125.39 Y148.296 E.33198
G3 X124.094 Y149.59 I-1.306 J-.012 E.03296
G1 X103.704 Y149.59 E.33109
G3 X102.41 Y148.296 I.019 J-1.313 E.03288
G1 X102.41 Y127.904 E.33112
G3 X103.651 Y126.611 I1.306 J.012 E.03208
G1 X124.254 Y126.619 E.33454
G1 X124.409 Y126.654 E.00259
; WIPE_START
M204 S6000
G1 X124.5 Y126.674 E-.03542
G1 X124.684 Y126.75 E-.07535
G1 X124.899 Y126.888 E-.09733
G1 X125.081 Y127.062 E-.09562
G1 X125.199 Y127.224 E-.07611
G1 X125.327 Y127.503 E-.11676
G1 X125.389 Y127.851 E-.13425
G1 X125.389 Y128.191 E-.12915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.805 Y135.801 Z1.2 F42000
G1 X123.764 Y149.371 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X125.171 Y147.964 E.0323
G1 X125.171 Y147.401
G1 X123.201 Y149.371 E.04524
G1 X122.637 Y149.371
G1 X125.171 Y146.837 E.05818
G1 X125.171 Y146.274
G1 X122.074 Y149.371 E.07112
G1 X121.51 Y149.371
G1 X122.655 Y148.226 E.02629
G1 X122.088 Y148.229
G1 X120.946 Y149.371 E.02622
G1 X120.383 Y149.371
G1 X121.524 Y148.229 E.02622
G1 X120.961 Y148.229
G1 X119.819 Y149.371 E.02622
G1 X119.256 Y149.371
G1 X120.397 Y148.229 E.02622
M73 P54 R9
G1 X119.834 Y148.229
G1 X118.692 Y149.371 E.02622
G1 X118.128 Y149.371
G1 X119.27 Y148.229 E.02622
G1 X118.706 Y148.229
G1 X117.565 Y149.371 E.02622
G1 X117.001 Y149.371
G1 X118.143 Y148.229 E.02622
G1 X117.579 Y148.229
G1 X116.437 Y149.371 E.02622
G1 X115.874 Y149.371
G1 X117.016 Y148.229 E.02622
G1 X116.452 Y148.229
G1 X115.31 Y149.371 E.02622
G1 X114.747 Y149.371
G1 X115.888 Y148.229 E.02622
G1 X115.325 Y148.229
G1 X114.183 Y149.371 E.02622
G1 X113.619 Y149.371
G1 X114.761 Y148.229 E.02622
G1 X114.197 Y148.229
G1 X113.056 Y149.371 E.02622
G1 X112.492 Y149.371
G1 X113.634 Y148.229 E.02622
G1 X113.07 Y148.229
G1 X111.929 Y149.371 E.02622
G1 X111.365 Y149.371
G1 X112.507 Y148.229 E.02622
G1 X111.943 Y148.229
G1 X110.801 Y149.371 E.02622
G1 X110.238 Y149.371
G1 X111.379 Y148.229 E.02622
G1 X110.816 Y148.229
G1 X109.674 Y149.371 E.02622
G1 X109.111 Y149.371
G1 X110.252 Y148.229 E.02622
G1 X109.689 Y148.229
G1 X108.547 Y149.371 E.02622
G1 X107.983 Y149.371
G1 X109.125 Y148.229 E.02622
G1 X108.561 Y148.229
G1 X107.42 Y149.371 E.02622
G1 X106.856 Y149.371
G1 X107.998 Y148.229 E.02622
G1 X107.434 Y148.229
G1 X106.293 Y149.371 E.02622
G1 X105.729 Y149.371
G1 X106.871 Y148.229 E.02622
G1 X106.307 Y148.229
G1 X105.165 Y149.371 E.02622
G1 X104.602 Y149.371
G1 X105.743 Y148.229 E.02622
G1 X105.18 Y148.229
G1 X104.038 Y149.371 E.02623
G1 X103.498 Y149.347
G1 X104.71 Y148.135 E.02784
G1 X104.341 Y147.941
G1 X103.101 Y149.181 E.02848
G1 X102.818 Y148.9
G1 X104.062 Y147.656 E.02857
G1 X103.858 Y147.296
G1 X102.651 Y148.504 E.02773
G1 X102.629 Y147.962
G1 X103.771 Y146.82 E.02623
G1 X103.771 Y146.256
G1 X102.629 Y147.398 E.02622
G1 X102.629 Y146.835
G1 X103.771 Y145.693 E.02622
G1 X103.771 Y145.129
G1 X102.629 Y146.271 E.02622
G1 X102.629 Y145.707
G1 X103.771 Y144.566 E.02622
G1 X103.771 Y144.002
G1 X102.629 Y145.144 E.02622
G1 X102.629 Y144.58
G1 X103.771 Y143.438 E.02622
G1 X103.771 Y142.875
G1 X102.629 Y144.016 E.02622
G1 X102.629 Y143.453
G1 X103.771 Y142.311 E.02622
G1 X103.771 Y141.747
G1 X102.629 Y142.889 E.02622
G1 X102.629 Y142.326
G1 X103.771 Y141.184 E.02622
G1 X103.771 Y140.62
G1 X102.629 Y141.762 E.02622
G1 X102.629 Y141.198
G1 X103.771 Y140.057 E.02622
G1 X103.771 Y139.493
G1 X102.629 Y140.635 E.02622
G1 X102.629 Y140.071
G1 X103.771 Y138.929 E.02622
G1 X103.771 Y138.366
G1 X102.629 Y139.508 E.02623
G1 X102.629 Y138.944
G1 X103.771 Y137.802 E.02623
G1 X103.771 Y137.238
G1 X102.629 Y138.38 E.02623
G1 X102.629 Y137.817
G1 X103.771 Y136.675 E.02623
G1 X103.771 Y136.111
G1 X102.629 Y137.253 E.02623
G1 X102.629 Y136.69
G1 X103.771 Y135.547 E.02623
G1 X103.771 Y134.984
G1 X102.629 Y136.126 E.02623
G1 X102.629 Y135.562
G1 X103.771 Y134.42 E.02623
G1 X103.771 Y133.857
G1 X102.629 Y134.999 E.02623
G1 X102.629 Y134.435
G1 X103.771 Y133.293 E.02623
G1 X103.771 Y132.729
G1 X102.629 Y133.872 E.02623
G1 X102.629 Y133.308
G1 X103.771 Y132.166 E.02623
G1 X103.772 Y131.602
G1 X102.629 Y132.744 E.02623
G1 X102.629 Y132.181
G1 X103.772 Y131.038 E.02623
G1 X103.772 Y130.475
G1 X102.629 Y131.617 E.02623
G1 X102.629 Y131.054
G1 X103.772 Y129.911 E.02623
G1 X103.772 Y129.348
G1 X102.629 Y130.49 E.02623
; WIPE_START
M204 S6000
G1 X103.772 Y129.348 E-.61394
G1 X103.772 Y129.732 E-.14606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.6 Y134.66 Z1.2 F42000
G1 X124.025 Y146.856 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X125.171 Y145.71 E.02631
G1 X125.171 Y145.146
G1 X124.029 Y146.288 E.02621
G1 X124.029 Y145.724
G1 X125.171 Y144.583 E.02621
G1 X125.171 Y144.019
G1 X124.029 Y145.161 E.02621
G1 X124.029 Y144.597
G1 X125.171 Y143.456 E.02621
G1 X125.171 Y142.892
G1 X124.029 Y144.034 E.02621
G1 X124.029 Y143.47
G1 X125.171 Y142.329 E.02621
G1 X125.17 Y141.765
G1 X124.029 Y142.906 E.02621
G1 X124.029 Y142.343
G1 X125.17 Y141.201 E.02621
G1 X125.17 Y140.638
G1 X124.029 Y141.779 E.02621
G1 X124.029 Y141.215
G1 X125.17 Y140.074 E.02621
G1 X125.17 Y139.511
G1 X124.029 Y140.652 E.02621
G1 X124.029 Y140.088
G1 X125.17 Y138.947 E.0262
G1 X125.17 Y138.384
G1 X124.029 Y139.525 E.0262
G1 X124.029 Y138.961
G1 X125.17 Y137.82 E.0262
G1 X125.17 Y137.256
G1 X124.029 Y138.397 E.0262
G1 X124.029 Y137.834
G1 X125.17 Y136.693 E.0262
G1 X125.17 Y136.129
G1 X124.029 Y137.27 E.0262
G1 X124.029 Y136.707
G1 X125.17 Y135.566 E.0262
G1 X125.17 Y135.002
G1 X124.029 Y136.143 E.0262
G1 X124.029 Y135.579
G1 X125.17 Y134.439 E.0262
G1 X125.17 Y133.875
G1 X124.029 Y135.016 E.0262
G1 X124.029 Y134.452
G1 X125.17 Y133.311 E.0262
G1 X125.17 Y132.748
G1 X124.029 Y133.889 E.0262
G1 X124.029 Y133.325
G1 X125.17 Y132.184 E.0262
G1 X125.17 Y131.621
G1 X124.029 Y132.761 E.02619
G1 X124.029 Y132.198
G1 X125.17 Y131.057 E.02619
G1 X125.17 Y130.494
G1 X124.029 Y131.634 E.02619
G1 X124.029 Y131.071
G1 X125.17 Y129.93 E.02619
G1 X125.17 Y129.366
G1 X124.029 Y130.507 E.02619
G1 X124.029 Y129.943
G1 X125.17 Y128.803 E.02619
G1 X125.17 Y128.239
G1 X124.029 Y129.38 E.0262
G1 X123.941 Y128.904
G1 X125.14 Y127.705 E.02754
G1 X124.982 Y127.299
G1 X123.738 Y128.544 E.02858
G1 X123.459 Y128.259
G1 X124.699 Y127.02 E.02846
G1 X124.3 Y126.854
G1 X123.09 Y128.065 E.0278
G1 X122.62 Y127.971
G1 X123.753 Y126.838 E.02602
G1 X123.189 Y126.838
G1 X122.057 Y127.971 E.02601
G1 X121.493 Y127.971
G1 X122.626 Y126.838 E.02602
G1 X122.062 Y126.838
G1 X120.929 Y127.971 E.02602
G1 X120.366 Y127.971
G1 X121.499 Y126.837 E.02603
G1 X120.936 Y126.837
G1 X119.802 Y127.971 E.02603
G1 X119.238 Y127.971
G1 X120.372 Y126.837 E.02604
G1 X119.809 Y126.837
G1 X118.675 Y127.971 E.02604
G1 X118.111 Y127.971
G1 X119.245 Y126.837 E.02605
G1 X118.682 Y126.836
G1 X117.548 Y127.971 E.02605
G1 X116.984 Y127.971
G1 X118.119 Y126.836 E.02606
G1 X117.555 Y126.836
G1 X116.42 Y127.971 E.02606
G1 X115.857 Y127.971
G1 X116.992 Y126.836 E.02607
G1 X116.429 Y126.835
G1 X115.293 Y127.971 E.02607
G1 X114.73 Y127.971
G1 X115.865 Y126.835 E.02608
G1 X115.302 Y126.835
G1 X114.166 Y127.971 E.02608
G1 X113.602 Y127.971
G1 X114.738 Y126.835 E.02609
G1 X114.175 Y126.835
G1 X113.039 Y127.971 E.02609
G1 X112.475 Y127.971
G1 X113.612 Y126.834 E.0261
G1 X113.048 Y126.834
G1 X111.912 Y127.971 E.0261
G1 X111.348 Y127.971
G1 X112.485 Y126.834 E.02611
G1 X111.922 Y126.834
G1 X110.784 Y127.971 E.02611
G1 X110.221 Y127.971
G1 X111.358 Y126.833 E.02612
G1 X110.795 Y126.833
G1 X109.657 Y127.971 E.02612
G1 X109.094 Y127.971
G1 X110.231 Y126.833 E.02613
G1 X109.668 Y126.833
G1 X108.53 Y127.971 E.02613
G1 X107.966 Y127.971
G1 X109.105 Y126.833 E.02614
G1 X108.541 Y126.832
G1 X107.403 Y127.971 E.02615
G1 X106.839 Y127.971
G1 X107.978 Y126.832 E.02615
G1 X107.415 Y126.832
G1 X106.276 Y127.971 E.02616
G1 X105.712 Y127.971
G1 X106.851 Y126.832 E.02616
G1 X106.288 Y126.831
G1 X105.144 Y127.975 E.02626
; WIPE_START
M204 S6000
G1 X106.288 Y126.831 E-.61449
G1 X106.671 Y126.832 E-.14551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.724 Y126.831 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X102.629 Y129.926 E.07108
G1 X102.629 Y129.363
G1 X105.161 Y126.831 E.05814
G1 X104.598 Y126.831
G1 X102.629 Y128.799 E.0452
G1 X102.629 Y128.236
G1 X104.034 Y126.83 E.03227
; WIPE_START
M204 S6000
G1 X102.629 Y128.236 E-.75506
G1 X102.629 Y128.248 E-.00494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.327 Y133.327 Z1.2 F42000
G1 X125.184 Y148.354 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.318573
G1 F15000
M204 S6000
G1 X125.032 Y148.567 E.00317
; LINE_WIDTH: 0.350166
G1 X124.881 Y148.78 E.0035
; LINE_WIDTH: 0.381477
G3 X124.634 Y149.037 I-1.427 J-1.127 E.00524
; LINE_WIDTH: 0.356378
G1 X124.191 Y149.378 E.00762
; WIPE_START
G1 X124.634 Y149.037 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.103 Y146.934 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.100418
G1 F15000
M204 S6000
G1 X123.979 Y147.164 E.00084
; WIPE_START
G1 X124.103 Y146.934 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.706 Y141.537 Z1.2 F42000
G1 X105.067 Y127.897 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.101877
G1 F15000
M204 S6000
G1 X104.837 Y128.02 E.00085
; WIPE_START
G1 X105.067 Y127.897 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.589 Y135.515 Z1.2 F42000
G1 X103.853 Y147.265 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.072276
G1 F15000
M204 S6000
G1 X103.763 Y147.11 E.00037
; WIPE_START
G1 X103.853 Y147.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.764 Y139.633 Z1.2 F42000
G1 X103.614 Y126.817 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.356521
G1 F15000
M204 S6000
G1 X103.164 Y127.165 E.00776
; LINE_WIDTH: 0.383823
M73 P55 R9
G2 X102.943 Y127.391 I1.164 J1.365 E.00468
; LINE_WIDTH: 0.360524
G1 X102.78 Y127.61 E.00377
; LINE_WIDTH: 0.333226
G1 X102.618 Y127.829 E.00347
; OBJECT_ID: 66
; WIPE_START
G1 X102.78 Y127.61 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X108.471 Y122.523 Z1.2 F42000
G1 X123.963 Y108.676 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.02 Y108.736 E.00145
G3 X124.099 Y109.024 I-.369 J.255 E.00532
G1 X124.099 Y121.576 E.21915
G3 X123.614 Y122.06 I-.466 J.019 E.01344
G1 X111.063 Y122.06 E.21915
G3 X110.578 Y121.576 I-.019 J-.466 E.01344
G1 X110.578 Y109.024 E.21915
G3 X111.063 Y108.54 I.466 J-.019 E.01344
G1 X123.614 Y108.54 E.21915
G1 X123.749 Y108.553 E.00237
G3 X123.902 Y108.619 I-.098 J.438 E.00292
G1 X123.919 Y108.635 E.0004
M204 S10000
G1 X124.27 Y108.369 F42000
G1 F6000
M204 S6000
G3 X124.527 Y109.003 I-.618 J.621 E.01228
G1 X124.527 Y121.597 E.21988
G3 X123.635 Y122.489 I-.879 J.013 E.02457
G1 X111.042 Y122.489 E.21988
G3 X110.15 Y121.597 I-.013 J-.879 E.02457
G1 X110.15 Y109.003 E.21988
G3 X111.042 Y108.111 I.879 J-.013 E.02457
G1 X123.66 Y108.114 E.22032
G3 X124.226 Y108.328 I-.008 J.876 E.01078
M204 S250
G1 X124.558 Y108.065 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.565 Y108.074 E.00018
G3 X124.941 Y108.983 I-.901 J.904 E.0164
G1 X124.941 Y121.617 E.20515
G3 X123.656 Y122.902 I-1.281 J.005 E.03281
G1 X111.022 Y122.902 E.20515
G3 X109.736 Y121.617 I-.005 J-1.281 E.03281
G1 X109.736 Y108.983 E.20515
G3 X111.022 Y107.698 I1.281 J-.005 E.03281
G1 X123.701 Y107.702 E.20588
G3 X124.372 Y107.916 I-.036 J1.276 E.01159
G1 X124.511 Y108.027 E.0029
; WIPE_START
M204 S6000
G1 X124.565 Y108.074 E-.02692
G1 X124.725 Y108.265 E-.09482
G1 X124.843 Y108.485 E-.0949
G1 X124.915 Y108.724 E-.09488
G1 X124.941 Y108.983 E-.09883
G1 X124.941 Y109.903 E-.34965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.309 Y109.793 Z1.2 F42000
G1 X110.751 Y109.699 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F15000
M204 S6000
G1 X111.558 Y108.891 E.01865
G1 X112.125 Y108.891 E.00926
G1 X110.93 Y110.086 E.0276
G1 X110.93 Y110.653 E.00926
G1 X112.692 Y108.891 E.0407
G1 X113.259 Y108.891 E.00926
G1 X110.93 Y111.22 E.05379
G1 X110.93 Y111.787 E.00926
G1 X113.826 Y108.891 E.06689
G1 X114.393 Y108.891 E.00926
G1 X110.93 Y112.354 E.07999
G1 X110.93 Y112.921 E.00926
G1 X114.96 Y108.891 E.09308
G1 X115.527 Y108.891 E.00926
G1 X110.93 Y113.488 E.10618
G1 X110.93 Y114.055 E.00926
G1 X116.093 Y108.891 E.11928
G1 X116.66 Y108.891 E.00926
G1 X110.93 Y114.622 E.13237
G1 X110.93 Y115.189 E.00926
G1 X117.227 Y108.891 E.14547
G1 X117.794 Y108.891 E.00926
G1 X110.93 Y115.756 E.15857
G1 X110.93 Y116.323 E.00926
G1 X118.361 Y108.891 E.17166
G1 X118.928 Y108.891 E.00926
G1 X110.93 Y116.89 E.18476
G1 X110.93 Y117.457 E.00926
G1 X119.495 Y108.891 E.19786
G1 X120.062 Y108.891 E.00926
G1 X110.93 Y118.024 E.21095
G1 X110.93 Y118.591 E.00926
G1 X120.629 Y108.891 E.22405
G1 X121.196 Y108.891 E.00926
G1 X110.93 Y119.157 E.23715
G1 X110.93 Y119.724 E.00926
G1 X121.763 Y108.891 E.25024
G1 X122.33 Y108.891 E.00926
G1 X110.93 Y120.291 E.26334
G1 X110.93 Y120.858 E.00926
G1 X122.897 Y108.891 E.27644
G1 X123.464 Y108.891 E.00926
G1 X110.93 Y121.425 E.28953
G2 X110.962 Y121.676 I.539 J.058 E.00417
G2 X111.213 Y121.709 I.193 J-.508 E.00417
G1 X123.747 Y109.175 E.28953
G1 X123.747 Y109.742 E.00926
G1 X111.78 Y121.709 E.27644
G1 X112.347 Y121.709 E.00926
G1 X123.747 Y110.309 E.26334
G1 X123.747 Y110.876 E.00926
G1 X112.914 Y121.709 E.25024
G1 X113.481 Y121.709 E.00926
G1 X123.747 Y111.443 E.23715
G1 X123.747 Y112.01 E.00926
G1 X114.048 Y121.709 E.22405
G1 X114.615 Y121.709 E.00926
G1 X123.747 Y112.577 E.21095
G1 X123.747 Y113.143 E.00926
G1 X115.182 Y121.709 E.19786
G1 X115.749 Y121.709 E.00926
G1 X123.747 Y113.71 E.18476
G1 X123.747 Y114.277 E.00926
G1 X116.316 Y121.709 E.17166
G1 X116.883 Y121.709 E.00926
G1 X123.747 Y114.844 E.15857
G1 X123.747 Y115.411 E.00926
G1 X117.45 Y121.709 E.14547
G1 X118.017 Y121.709 E.00926
G1 X123.747 Y115.978 E.13237
G1 X123.747 Y116.545 E.00926
G1 X118.584 Y121.709 E.11928
G1 X119.151 Y121.709 E.00926
G1 X123.747 Y117.112 E.10618
G1 X123.747 Y117.679 E.00926
G1 X119.718 Y121.709 E.09308
G1 X120.285 Y121.709 E.00926
G1 X123.747 Y118.246 E.07999
G1 X123.747 Y118.813 E.00926
G1 X120.852 Y121.709 E.06689
G1 X121.419 Y121.709 E.00926
G1 X123.747 Y119.38 E.05379
G1 X123.747 Y119.947 E.00926
G1 X121.986 Y121.709 E.0407
G1 X122.553 Y121.709 E.00926
G1 X123.747 Y120.514 E.0276
G1 X123.747 Y121.081 E.00926
G1 X122.94 Y121.888 E.01865
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.747 Y121.081 E-.43379
G1 X123.747 Y120.514 E-.21544
G1 X123.541 Y120.72 E-.11077
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 9/53
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S198.9
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.824 J.896 P1  F42000
G1 X148.802 Y143.96 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.3 F42000
G1 X151.648 Y132.298 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
G1 X152.747 Y148.029 E.20476
G3 X151.979 Y148.748 I-.756 J-.039 E.02029
G1 X129.417 Y148.748 E.39394
G3 X128.653 Y148.029 I-.014 J-.75 E.02028
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.754 J-.014 E.02015
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G1 X151.983 Y124.652 E.0276
G3 X152.747 Y125.371 I.009 J.756 E.02024
G1 X152.748 Y132.298 E.12094
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.175 Y148.046 E.21254
G3 X151.987 Y149.176 I-1.188 J-.059 E.03158
G1 X129.41 Y149.176 E.39421
G3 X128.225 Y148.046 I-.007 J-1.179 E.03161
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.413 E.1277
G3 X129.348 Y124.225 I1.185 J-.004 E.03152
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.99 Y124.223 E.03521
G3 X153.175 Y125.354 I0 J1.187 E.03156
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.589 Y148.062 E.20464
G3 X151.996 Y149.59 I-1.605 J-.079 E.0395
G1 X129.403 Y149.59 E.36686
G3 X127.811 Y148.062 I0 J-1.593 E.03958
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.601 J.006 E.03951
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
M73 P56 R9
G1 X149.56 Y123.81 E.00487
G1 X151.997 Y123.81 E.03957
G3 X153.589 Y125.338 I-.009 J1.603 E.03952
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 9 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer9 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.138 Y147.139 E.33896
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01021
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.571 I-1.394 J0 E.00925
G1 X150.002 Y146.003 E.00849
G1 X149.57 Y146.297 E.00848
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.331 I-327.08 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.0066
G1 X149.721 Y145.721 E.0061
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.536 Y147.537 E.35328
G1 X151.537 Y137.513 E.16342
G1 X151.06 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y132.084 E.0751
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.864 E.08515
G1 X151.305 Y125.863 E.00377
G1 X151.288 Y125.902 E.00069
G1 X150.616 Y126.163 E.01174
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.935 E.1757
G1 X151.932 Y147.934 E.36481
G1 X151.936 Y137.114 E.17568
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.489 E.09737
G2 X151.082 Y125.465 I-.708 J9.728 E.01385
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00794
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01382
G2 X129.464 Y131.486 I678.289 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18317
G1 X129.152 Y148.212 E.00376
G1 X129.381 Y148.325 E.00415
G1 X129.474 Y148.334 E.00152
G1 X151.961 Y148.334 E.36513
G1 X152.218 Y148.241 E.00445
G1 X152.327 Y148.024 E.00394
G1 X152.333 Y147.934 E.00147
G1 X152.334 Y136.716 E.18216
G1 X151.434 Y136.716 E.01462
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.422 E.10494
G1 X152.259 Y125.21 E.00365
G1 X152.019 Y125.072 E.00449
G2 X150.816 Y125.066 I-.98 J69.79 E.01955
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.393 Y125.067 E.01934
G1 X129.179 Y125.16 E.00379
G1 X129.076 Y125.384 E.00402
G1 X129.066 Y131.884 E.10554
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X131.786 Y128.384 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27008
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01115
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.444 E.2691
M204 S10000
G1 X132.184 Y128.384 F42000
G1 F15000
M204 S6000
G1 X132.196 Y128.315 E.00112
G1 X132.293 Y128.206 E.00238
G1 X132.384 Y128.184 E.00151
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27008
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.444 E.2691
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09535
M204 S10000
G1 X150.761 Y145.323 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y145.463 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.309 E.01296
G1 X149.742 Y146.693 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y146.716 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y146.725 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y146.707 E.00268
G1 X150.705 Y146.707 E.01819
G1 X150.705 Y145.745 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y145.624 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y145.503 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 66
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X132.425 Y139.414 Z1.3 F42000
G1 X123.987 Y108.651 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.127 Y109.007 I-.336 J.337 E.00688
G1 X124.127 Y121.593 E.21974
G3 X123.631 Y122.089 I-.478 J.018 E.01375
G1 X111.046 Y122.089 E.21974
G3 X110.55 Y121.593 I-.018 J-.478 E.01375
G1 X110.55 Y109.007 E.21974
G3 X111.046 Y108.511 I.478 J-.018 E.01375
G1 X123.642 Y108.513 E.21993
G3 X123.942 Y108.612 I.009 J.476 E.00562
M204 S10000
G1 X124.297 Y108.342 F42000
G1 F6000
M204 S6000
G3 X124.556 Y108.986 I-.62 J.624 E.01247
G1 X124.556 Y121.614 E.22048
G3 X123.652 Y122.517 I-.89 J.013 E.02488
G1 X111.025 Y122.517 E.22048
G3 X110.122 Y121.614 I-.013 J-.89 E.02488
G1 X110.122 Y108.986 E.22048
G3 X111.025 Y108.083 I.89 J-.013 E.02488
G1 X123.684 Y108.086 E.22104
G3 X124.253 Y108.301 I-.008 J.879 E.01083
M204 S250
G1 X124.6 Y108.057 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.75 Y108.243 E.00388
G3 X124.969 Y108.966 I-1.068 J.718 E.01245
G1 X124.969 Y121.634 E.2057
G3 X123.673 Y122.931 I-1.292 J.005 E.0331
G1 X111.005 Y122.931 E.2057
G3 X109.708 Y121.634 I-.005 J-1.292 E.0331
G1 X109.708 Y108.966 E.2057
G3 X111.005 Y107.669 I1.292 J-.005 E.0331
G1 X123.725 Y107.675 E.20655
G3 X124.556 Y108.016 I-.043 J1.286 E.0149
; WIPE_START
M204 S6000
G1 X124.75 Y108.243 E-.11349
G1 X124.87 Y108.464 E-.09565
G1 X124.944 Y108.705 E-.09577
G1 X124.969 Y108.966 E-.09964
G1 X124.969 Y109.901 E-.35545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.955 Y109.68 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42389
G1 F15000
M204 S6000
G1 X123.139 Y108.864 E.01892
G1 X122.57 Y108.864 E.00933
G1 X123.776 Y110.07 E.02796
G1 X123.776 Y110.639 E.00933
G1 X122.001 Y108.864 E.04116
G1 X121.432 Y108.864 E.00933
G1 X123.776 Y111.208 E.05436
G1 X123.776 Y111.777 E.00933
G1 X120.862 Y108.864 E.06755
G1 X120.293 Y108.864 E.00933
G1 X123.776 Y112.346 E.08075
G1 X123.776 Y112.915 E.00933
G1 X119.724 Y108.864 E.09395
M73 P57 R9
G1 X119.155 Y108.864 E.00933
G1 X123.776 Y113.485 E.10715
G1 X123.776 Y114.054 E.00933
G1 X118.586 Y108.864 E.12035
G1 X118.017 Y108.864 E.00933
G1 X123.776 Y114.623 E.13355
G1 X123.776 Y115.192 E.00933
G1 X117.447 Y108.864 E.14674
G1 X116.878 Y108.863 E.00933
G1 X123.776 Y115.761 E.15994
G1 X123.776 Y116.33 E.00933
G1 X116.309 Y108.863 E.17314
G1 X115.74 Y108.863 E.00933
G1 X123.776 Y116.899 E.18634
G1 X123.776 Y117.468 E.00933
G1 X115.171 Y108.863 E.19954
G1 X114.601 Y108.863 E.00933
G1 X123.776 Y118.038 E.21273
G1 X123.776 Y118.607 E.00933
G1 X114.032 Y108.863 E.22593
G1 X113.463 Y108.863 E.00933
G1 X123.776 Y119.176 E.23913
G1 X123.776 Y119.745 E.00933
G1 X112.894 Y108.863 E.25233
G1 X112.325 Y108.863 E.00933
G1 X123.776 Y120.314 E.26553
G1 X123.776 Y120.883 E.00933
G1 X111.756 Y108.863 E.27872
G1 X111.186 Y108.863 E.00933
G1 X123.776 Y121.452 E.29192
G3 X123.74 Y121.701 I-.52 J.053 E.00417
G3 X123.491 Y121.737 I-.196 J-.484 E.00416
G1 X110.902 Y109.147 E.29193
G1 X110.902 Y109.716 E.00933
G1 X122.922 Y121.737 E.27874
G1 X122.353 Y121.737 E.00933
G1 X110.902 Y110.286 E.26554
G1 X110.902 Y110.855 E.00933
G1 X121.784 Y121.737 E.25234
G1 X121.215 Y121.737 E.00933
G1 X110.902 Y111.424 E.23915
G1 X110.902 Y111.993 E.00933
G1 X120.646 Y121.737 E.22595
G1 X120.077 Y121.737 E.00933
G1 X110.902 Y112.562 E.21275
G1 X110.902 Y113.131 E.00933
G1 X119.508 Y121.737 E.19956
G1 X118.938 Y121.737 E.00933
G1 X110.902 Y113.7 E.18636
M73 P57 R8
G1 X110.902 Y114.269 E.00933
G1 X118.369 Y121.737 E.17316
G1 X117.8 Y121.737 E.00933
G1 X110.902 Y114.839 E.15996
G1 X110.902 Y115.408 E.00933
G1 X117.231 Y121.737 E.14677
G1 X116.662 Y121.737 E.00933
G1 X110.902 Y115.977 E.13357
G1 X110.902 Y116.546 E.00933
G1 X116.093 Y121.737 E.12037
G1 X115.524 Y121.737 E.00933
G1 X110.902 Y117.115 E.10718
G1 X110.902 Y117.684 E.00933
G1 X114.955 Y121.737 E.09398
G1 X114.385 Y121.737 E.00933
G1 X110.902 Y118.253 E.08078
G1 X110.902 Y118.822 E.00933
G1 X113.816 Y121.737 E.06759
G1 X113.247 Y121.737 E.00933
G1 X110.902 Y119.391 E.05439
G1 X110.902 Y119.961 E.00933
G1 X112.678 Y121.737 E.04119
G1 X112.109 Y121.737 E.00933
G1 X110.902 Y120.53 E.028
G1 X110.902 Y121.099 E.00933
G1 X111.719 Y121.916 E.01896
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X110.902 Y121.099 E-.43936
G1 X110.902 Y120.53 E-.21627
G1 X111.096 Y120.724 E-.10438
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 10/53
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I-.638 J1.036 P1  F42000
G1 X148.802 Y143.96 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.4 F42000
G1 X151.648 Y132.298 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.981 E.20392
G3 X151.979 Y148.748 I-.758 J.009 E.02114
G1 X129.416 Y148.748 E.39395
G3 X128.653 Y148.029 I-.013 J-.75 E.02026
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.755 J-.014 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.026 Y124.653 I.791 J26.69 E.02836
G3 X152.747 Y125.371 I-.028 J.749 E.01952
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.989 E.21154
G3 X151.988 Y149.176 I-1.189 J-.001 E.03258
G1 X129.41 Y149.176 E.39422
G3 X128.225 Y148.046 I-.007 J-1.179 E.03161
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.413 E.1277
G3 X129.348 Y124.225 I1.185 J-.004 E.03151
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.99 Y124.223 E.03521
G3 X153.175 Y125.354 I.007 J1.179 E.03161
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.996 E.20356
G3 X151.996 Y149.59 I-1.605 J-.011 E.04058
G1 X129.403 Y149.59 E.36686
G3 X127.811 Y148.062 I0 J-1.593 E.03957
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.601 J.007 E.03951
G1 X131.84 Y123.81 E.04067
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.997 Y123.81 E.03957
G3 X153.589 Y125.338 I0 J1.593 E.03957
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 10 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer10 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X132.184 Y145.016 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X149.016 Y128.184 E.27007
M73 P58 R8
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27007
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.207 Y145.072 E.0015
M204 S10000
G1 X131.786 Y145.016 F42000
G1 F15000
M204 S6000
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27007
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01116
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.798 Y145.075 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.332 I-327.131 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.864 E.08515
G1 X151.305 Y125.863 E.00376
G1 X151.288 Y125.902 E.00069
G1 X150.616 Y126.163 E.01174
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.93 E.17563
G1 X151.934 Y147.936 E.36484
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.489 E.09737
G2 X151.083 Y125.465 I-.707 J9.762 E.01384
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01383
G2 X129.464 Y131.486 I925.962 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18317
G1 X129.158 Y148.222 E.00395
G2 X129.496 Y148.334 I.352 J-.495 E.00587
G1 X151.96 Y148.334 E.36477
G1 X152.219 Y148.241 E.00447
G1 X152.323 Y148.03 E.00381
G1 X152.334 Y147.924 E.00174
G1 X152.334 Y136.716 E.182
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.421 E.10494
G1 X152.208 Y125.148 E.00488
G1 X151.9 Y125.067 E.00518
G1 X150.816 Y125.066 E.0176
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.395 Y125.067 E.01931
G1 X129.19 Y125.149 E.00359
G1 X129.076 Y125.38 E.00418
G1 X129.066 Y131.884 E.10562
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09555
M204 S10000
G1 X150.762 Y145.323 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y146.716 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y145.624 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y145.503 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 66
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X132.431 Y139.413 Z1.4 F42000
G1 X124.012 Y108.626 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.155 Y108.99 I-.343 J.345 E.00703
G1 X124.155 Y121.61 E.22033
G3 X123.648 Y122.117 I-.49 J.018 E.01405
G1 X111.029 Y122.117 E.22033
G3 X110.522 Y121.61 I-.018 J-.49 E.01405
G1 X110.522 Y108.99 E.22033
G3 X111.029 Y108.483 I.49 J-.018 E.01405
G1 X123.667 Y108.485 E.22066
G3 X123.967 Y108.587 I.003 J.486 E.00564
M204 S10000
G1 X124.322 Y108.317 F42000
G1 F6000
M204 S6000
G3 X124.584 Y108.969 I-.627 J.631 E.01262
G1 X124.584 Y121.631 E.22107
G3 X123.669 Y122.545 I-.901 J.013 E.02519
G1 X111.008 Y122.545 E.22107
G3 X110.093 Y121.631 I-.013 J-.901 E.02519
G1 X110.093 Y108.969 E.22107
G3 X111.008 Y108.055 I.901 J-.013 E.02519
G1 X123.709 Y108.059 E.22176
G3 X124.278 Y108.276 I-.014 J.89 E.01085
M204 S250
G1 X124.606 Y108.013 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.615 Y108.024 E.00023
G3 X124.998 Y108.949 I-.915 J.92 E.01669
G1 X124.998 Y121.651 E.20626
G3 X123.69 Y122.959 I-1.303 J.005 E.03339
G1 X110.988 Y122.959 E.20626
G3 X109.68 Y121.651 I-.005 J-1.303 E.03339
G1 X109.68 Y108.949 E.20626
G3 X110.988 Y107.641 I1.303 J-.005 E.03339
G1 X123.749 Y107.647 E.20722
G3 X124.419 Y107.863 I-.05 J1.297 E.01156
G1 X124.559 Y107.976 E.00292
; WIPE_START
M204 S6000
G1 X124.615 Y108.024 E-.02808
G1 X124.778 Y108.218 E-.0965
G1 X124.898 Y108.443 E-.09658
G1 X124.972 Y108.686 E-.09659
G1 X124.998 Y108.949 E-.10051
G1 X124.998 Y109.848 E-.34176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.366 Y109.749 Z1.4 F42000
G1 X110.694 Y109.662 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42543
G1 F15000
M204 S6000
G1 X111.521 Y108.835 E.01925
G1 X112.092 Y108.835 E.0094
G1 X110.873 Y110.054 E.02838
G1 X110.873 Y110.625 E.0094
G1 X112.664 Y108.835 E.04167
G1 X113.235 Y108.835 E.0094
G1 X110.873 Y111.196 E.05497
G1 X110.873 Y111.768 E.0094
G1 X113.806 Y108.835 E.06826
G1 X114.377 Y108.835 E.0094
G1 X110.873 Y112.339 E.08156
G1 X110.873 Y112.91 E.0094
G1 X114.948 Y108.835 E.09486
G1 X115.52 Y108.835 E.0094
G1 X110.873 Y113.482 E.10815
G1 X110.873 Y114.053 E.0094
G1 X116.091 Y108.835 E.12145
G1 X116.662 Y108.835 E.0094
G1 X110.873 Y114.624 E.13474
G1 X110.873 Y115.196 E.0094
G1 X117.233 Y108.836 E.14804
G1 X117.805 Y108.836 E.0094
G1 X110.873 Y115.767 E.16134
G1 X110.873 Y116.338 E.0094
G1 X118.376 Y108.836 E.17463
G1 X118.947 Y108.836 E.0094
G1 X110.873 Y116.909 E.18793
G1 X110.873 Y117.481 E.0094
G1 X119.518 Y108.836 E.20122
G1 X120.089 Y108.836 E.0094
G1 X110.873 Y118.052 E.21452
G1 X110.873 Y118.623 E.0094
G1 X120.661 Y108.836 E.22782
G1 X121.232 Y108.836 E.0094
G1 X110.873 Y119.195 E.24111
G1 X110.873 Y119.766 E.0094
G1 X121.803 Y108.836 E.25441
G1 X122.374 Y108.836 E.0094
G1 X110.873 Y120.337 E.26771
G1 X110.873 Y120.909 E.0094
G1 X122.945 Y108.836 E.281
G1 X123.517 Y108.836 E.0094
G1 X110.873 Y121.48 E.2943
G2 X110.912 Y121.726 I.506 J.046 E.00415
G2 X111.159 Y121.765 I.2 J-.467 E.00416
G1 X123.804 Y109.12 E.29433
G1 X123.804 Y109.692 E.0094
G1 X111.73 Y121.765 E.28104
G1 X112.302 Y121.765 E.0094
G1 X123.804 Y110.263 E.26774
G1 X123.804 Y110.834 E.0094
G1 X112.873 Y121.765 E.25444
G1 X113.444 Y121.765 E.0094
G1 X123.804 Y111.406 E.24114
G1 X123.804 Y111.977 E.0094
G1 X114.016 Y121.765 E.22784
G1 X114.587 Y121.765 E.0094
G1 X123.804 Y112.548 E.21455
G1 X123.804 Y113.12 E.0094
G1 X115.158 Y121.765 E.20125
G1 X115.729 Y121.765 E.0094
G1 X123.804 Y113.691 E.18795
M73 P59 R8
G1 X123.804 Y114.262 E.0094
G1 X116.301 Y121.765 E.17465
G1 X116.872 Y121.765 E.0094
G1 X123.804 Y114.833 E.16135
G1 X123.804 Y115.405 E.0094
G1 X117.443 Y121.765 E.14805
G1 X118.015 Y121.765 E.0094
G1 X123.804 Y115.976 E.13476
G1 X123.804 Y116.547 E.0094
G1 X118.586 Y121.765 E.12146
G1 X119.157 Y121.765 E.0094
G1 X123.804 Y117.119 E.10816
G1 X123.804 Y117.69 E.0094
G1 X119.729 Y121.765 E.09486
G1 X120.3 Y121.765 E.0094
G1 X123.804 Y118.261 E.08156
G1 X123.804 Y118.833 E.0094
G1 X120.871 Y121.765 E.06827
G1 X121.442 Y121.765 E.0094
G1 X123.804 Y119.404 E.05497
G1 X123.804 Y119.975 E.0094
G1 X122.014 Y121.765 E.04167
G1 X122.585 Y121.765 E.0094
G1 X123.804 Y120.546 E.02837
G1 X123.804 Y121.118 E.0094
G1 X122.977 Y121.945 E.01925
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.804 Y121.118 E-.4444
G1 X123.804 Y120.546 E-.21709
G1 X123.621 Y120.73 E-.0985
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 11/53
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.825 J.894 P1  F42000
G1 X148.802 Y143.96 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.5 F42000
G1 X151.648 Y132.298 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.981 E.20391
G3 X151.979 Y148.748 I-.749 J.018 E.02121
G1 X129.411 Y148.748 E.39404
G3 X128.653 Y148.029 I-.003 J-.756 E.02013
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.755 J-.014 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.019 Y124.653 I.793 J39.906 E.02823
G1 X152.107 Y124.66 E.00155
G3 X152.747 Y125.371 I-.112 J.744 E.01809
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.989 E.21153
G3 X151.987 Y149.176 I-1.178 J.01 E.03268
G1 X129.406 Y149.176 E.39427
G3 X128.225 Y148.046 I.004 J-1.187 E.03149
G1 X128.224 Y135.873 E.21254
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.12771
G3 X129.348 Y124.225 I1.186 J-.003 E.03151
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G3 X152.04 Y124.224 I1.01 J52.18 E.03608
G3 X153.175 Y125.354 I-.043 J1.178 E.03073
G1 X153.176 Y132.726 E.12873
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.996 E.20356
G3 X151.996 Y149.59 I-1.591 J.003 E.04068
G1 X129.402 Y149.59 E.36688
G3 X127.811 Y148.062 I.011 J-1.603 E.03949
G1 X127.81 Y135.46 E.20464
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12562
G3 X129.336 Y123.811 I1.602 J.007 E.0395
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G3 X152.06 Y123.811 I1.219 J63.393 E.0406
G3 X153.589 Y125.338 I-.065 J1.593 E.03853
G1 X153.59 Y133.14 E.1267
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 11 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer11 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X132.184 Y145.016 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27007
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.207 Y145.072 E.0015
M204 S10000
G1 X131.786 Y145.016 F42000
G1 F15000
M204 S6000
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
M73 P60 R8
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27007
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01116
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.798 Y145.075 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.332 I-327.131 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.306 Y125.863 E.00376
G1 X151.289 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.934 E.1757
G1 X151.934 Y147.936 E.36483
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.482 E.09749
G2 X151.083 Y125.464 I-.704 J13.391 E.01384
G1 X151.02 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.474 Y125.465 E.0137
G1 X129.464 Y131.486 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.997 E.18318
G1 X129.15 Y148.209 E.0037
G1 X129.389 Y148.326 E.00432
G1 X129.475 Y148.334 E.00142
G1 X151.96 Y148.334 E.36509
G1 X152.213 Y148.244 E.00437
G1 X152.326 Y148.009 E.00424
G1 X152.334 Y147.921 E.00144
G1 X152.334 Y136.716 E.18194
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.419 E.10498
G1 X152.234 Y125.179 E.00422
G1 X151.968 Y125.066 E.0047
G1 X150.816 Y125.066 E.01871
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.395 Y125.067 E.01931
G1 X129.181 Y125.154 E.00375
G1 X129.096 Y125.332 E.0032
G1 X129.066 Y126.013 E.01107
G1 X129.066 Y131.884 E.09534
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09555
M204 S10000
G1 X150.762 Y145.323 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y146.716 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y145.624 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y145.503 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 66
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X132.436 Y139.411 Z1.5 F42000
G1 X124.037 Y108.602 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.184 Y108.973 I-.35 J.353 E.00718
G1 X124.184 Y121.627 E.22093
G3 X123.665 Y122.145 I-.501 J.017 E.01436
G1 X111.012 Y122.145 E.22093
G3 X110.494 Y121.627 I-.017 J-.501 E.01436
G1 X110.494 Y108.973 E.22093
G3 X111.012 Y108.455 I.501 J-.017 E.01436
G1 X123.691 Y108.457 E.22138
G3 X123.992 Y108.562 I-.004 J.497 E.00566
M204 S10000
G1 X124.347 Y108.292 F42000
G1 F6000
M204 S6000
G3 X124.612 Y108.952 I-.634 J.639 E.01277
G1 X124.612 Y121.648 E.22166
G3 X123.686 Y122.574 I-.913 J.013 E.0255
G1 X110.991 Y122.574 E.22166
G3 X110.065 Y121.648 I-.013 J-.913 E.0255
G1 X110.065 Y108.952 E.22166
G3 X110.991 Y108.026 I.913 J-.013 E.0255
G1 X123.733 Y108.031 E.22248
G3 X124.303 Y108.251 I-.021 J.9 E.01088
M204 S250
G1 X124.63 Y107.987 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.64 Y107.999 E.00025
G3 X125.026 Y108.932 I-.923 J.928 E.01683
G1 X125.026 Y121.668 E.20681
G3 X123.707 Y122.987 I-1.315 J.005 E.03368
G1 X110.971 Y122.987 E.20681
G3 X109.651 Y121.668 I-.005 J-1.315 E.03368
G1 X109.651 Y108.932 E.20681
G3 X110.971 Y107.613 I1.315 J-.005 E.03368
G1 X123.774 Y107.619 E.2079
G3 X124.442 Y107.837 I-.056 J1.307 E.01155
G1 X124.583 Y107.95 E.00293
; WIPE_START
M204 S6000
G1 X124.64 Y107.999 E-.02865
G1 X124.804 Y108.195 E-.0973
G1 X124.925 Y108.421 E-.09743
G1 X125 Y108.667 E-.09745
G1 X125.026 Y108.932 E-.10133
G1 X125.026 Y109.821 E-.33784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.012 Y109.643 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42697
G1 F15000
M204 S6000
G1 X123.177 Y108.809 E.0195
G1 X122.604 Y108.809 E.00948
G1 X123.832 Y110.037 E.02871
G1 X123.832 Y110.611 E.00948
G1 X122.03 Y108.809 E.04211
G1 X121.456 Y108.808 E.00948
G1 X123.832 Y111.184 E.05551
G1 X123.832 Y111.758 E.00948
G1 X120.883 Y108.808 E.06892
G1 X120.309 Y108.808 E.00948
G1 X123.832 Y112.331 E.08232
G1 X123.832 Y112.905 E.00948
G1 X119.736 Y108.808 E.09572
G1 X119.162 Y108.808 E.00948
G1 X123.832 Y113.478 E.10912
G1 X123.832 Y114.052 E.00948
G1 X118.588 Y108.808 E.12252
G1 X118.015 Y108.808 E.00948
G1 X123.832 Y114.625 E.13593
G1 X123.832 Y115.199 E.00948
G1 X117.441 Y108.808 E.14933
G1 X116.868 Y108.808 E.00948
G1 X123.832 Y115.772 E.16273
G1 X123.832 Y116.346 E.00947
G1 X116.294 Y108.807 E.17613
G1 X115.721 Y108.807 E.00948
G1 X123.832 Y116.919 E.18954
G1 X123.832 Y117.493 E.00948
G1 X115.147 Y108.807 E.20294
G1 X114.573 Y108.807 E.00948
G1 X123.832 Y118.066 E.21634
G1 X123.832 Y118.64 E.00947
G1 X114 Y108.807 E.22974
G1 X113.426 Y108.807 E.00948
G1 X123.832 Y119.213 E.24315
G1 X123.832 Y119.787 E.00948
G1 X112.853 Y108.807 E.25655
G1 X112.279 Y108.807 E.00948
G1 X123.832 Y120.36 E.26995
G1 X123.832 Y120.933 E.00947
G1 X111.705 Y108.807 E.28335
G1 X111.132 Y108.806 E.00948
G1 X123.832 Y121.507 E.29676
G3 X123.79 Y121.751 I-.496 J.04 E.00414
G3 X123.546 Y121.794 I-.205 J-.455 E.00414
G1 X110.845 Y109.093 E.29676
G1 X110.845 Y109.667 E.00948
G1 X122.972 Y121.794 E.28336
G1 X122.399 Y121.794 E.00948
G1 X110.845 Y110.24 E.26996
G1 X110.845 Y110.814 E.00947
G1 X121.825 Y121.794 E.25656
G1 X121.252 Y121.794 E.00948
G1 X110.845 Y111.387 E.24316
G1 X110.845 Y111.961 E.00948
G1 X120.678 Y121.794 E.22976
G1 X120.105 Y121.794 E.00948
G1 X110.845 Y112.534 E.21636
G1 X110.845 Y113.107 E.00948
G1 X119.531 Y121.794 E.20296
G1 X118.958 Y121.794 E.00947
G1 X110.845 Y113.681 E.18956
G1 X110.845 Y114.254 E.00948
G1 X118.384 Y121.794 E.17616
G1 X117.811 Y121.794 E.00948
G1 X110.845 Y114.828 E.16276
G1 X110.845 Y115.401 E.00948
G1 X117.237 Y121.794 E.14936
G1 X116.664 Y121.794 E.00947
G1 X110.845 Y115.975 E.13596
G1 X110.845 Y116.548 E.00948
G1 X116.09 Y121.794 E.12256
G1 X115.517 Y121.794 E.00948
G1 X110.845 Y117.122 E.10916
G1 X110.845 Y117.695 E.00948
G1 X114.943 Y121.794 E.09576
G1 X114.37 Y121.794 E.00948
G1 X110.845 Y118.269 E.08236
G1 X110.845 Y118.842 E.00947
G1 X113.796 Y121.794 E.06896
G1 X113.223 Y121.794 E.00948
G1 X110.845 Y119.416 E.05556
G1 X110.845 Y119.989 E.00948
G1 X112.649 Y121.794 E.04216
G1 X112.076 Y121.794 E.00948
G1 X110.845 Y120.563 E.02876
G1 X110.845 Y121.136 E.00947
G1 X111.682 Y121.973 E.01955
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X110.845 Y121.136 E-.44972
G1 X110.845 Y120.563 E-.21792
G1 X111.017 Y120.735 E-.09236
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 12/53
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I-.637 J1.037 P1  F42000
G1 X148.802 Y143.96 Z1.5
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
M73 P61 R8
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.6 F42000
G1 X151.648 Y132.298 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.979 E.20388
G3 X151.979 Y148.748 I-.752 J.017 E.02122
G1 X129.415 Y148.748 E.39398
G3 X128.653 Y148.039 I-.011 J-.752 E.02006
G1 X128.652 Y136.302 E.20494
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.752 J-.017 E.02016
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.03 Y124.653 I.791 J29.797 E.02843
G1 X152.107 Y124.66 E.00134
G3 X152.747 Y125.371 I-.11 J.743 E.0181
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.987 E.21151
G3 X151.988 Y149.176 I-1.182 J.007 E.03266
G1 X129.409 Y149.176 E.39423
G3 X128.225 Y148.052 I-.008 J-1.177 E.0315
G1 X128.224 Y135.873 E.21264
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.1277
G3 X129.348 Y124.225 I1.182 J-.007 E.03154
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.991 Y124.223 E.03523
G3 X153.175 Y125.354 I.006 J1.179 E.03159
G1 X153.176 Y132.726 E.12873
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.996 E.20356
G3 X151.996 Y149.59 I-1.597 J-.003 E.04064
G1 X129.403 Y149.59 E.36686
G3 X127.811 Y148.065 I-.002 J-1.591 E.03955
G1 X127.81 Y135.46 E.20467
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.597 J.003 E.03953
G1 X131.84 Y123.81 E.04066
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.997 Y123.81 E.03957
G3 X153.589 Y125.338 I0 J1.593 E.03957
G1 X153.59 Y133.14 E.1267
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 12 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer12 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X149.323 Y146.762 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
M204 S10000
G1 X150.762 Y145.323 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y146.716 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y145.624 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y145.503 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y145.382 E.00186
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09555
M204 S10000
G1 X150.019 Y136.516 F42000
; LINE_WIDTH: 0.42194
G1 F15000
M204 S6000
G1 X150.013 Y145.016 E.1387
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.2714
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y138.147 E.11209
G3 X131.387 Y128.384 I1275.752 J-4.882 E.1593
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.2714
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G1 X150.019 Y136.456 E.07135
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
; WIPE_START
G1 X150.775 Y128.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.201 Y126.989 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
M73 P61 R7
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.166 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y148.008 E.18336
G1 X129.155 Y148.215 E.00365
G1 X129.382 Y148.324 E.00409
M73 P62 R7
G1 X129.481 Y148.334 E.00162
G1 X151.95 Y148.334 E.36484
G1 X152.139 Y148.296 E.00313
G1 X152.287 Y148.146 E.00343
G1 X152.334 Y147.906 E.00396
G1 X152.334 Y136.716 E.18171
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.42 E.10497
G1 X152.23 Y125.169 E.00441
G1 X152.024 Y125.073 E.00368
G2 X150.816 Y125.066 I-.969 J62.117 E.01963
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.393 Y125.067 E.01934
G1 X129.188 Y125.152 E.00361
G1 X129.074 Y125.39 E.00429
G1 X129.066 Y131.884 E.10544
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.564 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.934 E.17568
G1 X151.909 Y147.936 E.36443
G1 X151.936 Y147.906 E.00065
G1 X151.936 Y137.114 E.17524
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.484 E.09745
G2 X151.083 Y125.465 I-.708 J12.177 E.01384
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.466 Y125.465 E.01383
G2 X129.464 Y131.486 I742.452 J3.284 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.305 Y125.863 E.00376
G1 X151.288 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.786 Y138.147 F42000
G1 F15000
M204 S6000
G1 X131.786 Y128.384 E.15853
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27007
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01116
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y138.207 E.11057
M204 S10000
G1 X132.184 Y138.147 F42000
G1 F15000
M204 S6000
G1 X132.184 Y128.384 E.15853
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27007
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y138.207 E.11057
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X132.384 Y146.775 F42000
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
; OBJECT_ID: 66
; WIPE_START
G1 X132.101 Y146.748 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.528 Y139.28 Z1.6 F42000
G1 X124.062 Y108.577 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X124.212 Y108.956 I-.357 J.361 E.00734
G1 X124.212 Y121.644 E.22152
G3 X123.682 Y122.173 I-.513 J.017 E.01467
G1 X110.995 Y122.173 E.22152
G3 X110.465 Y121.644 I-.017 J-.513 E.01467
G1 X110.465 Y108.956 E.22152
G3 X110.995 Y108.427 I.513 J-.017 E.01467
G1 X123.715 Y108.43 E.2221
G3 X124.017 Y108.537 I-.011 J.507 E.00568
M204 S10000
G1 X124.371 Y108.267 F42000
G1 F6000
M204 S6000
G3 X124.641 Y108.935 I-.642 J.647 E.01293
G1 X124.641 Y121.665 E.22226
G3 X123.703 Y122.602 I-.924 J.013 E.02581
G1 X110.974 Y122.602 E.22226
G3 X110.037 Y121.665 I-.013 J-.924 E.02581
G1 X110.037 Y108.935 E.22226
G3 X110.974 Y107.998 I.924 J-.013 E.02581
G1 X123.757 Y108.003 E.2232
G3 X124.327 Y108.226 I-.028 J.911 E.0109
M204 S250
G1 X124.654 Y107.961 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.665 Y107.974 E.00028
G3 X125.054 Y108.915 I-.93 J.936 E.01698
G1 X125.054 Y121.685 E.20736
G3 X123.724 Y123.016 I-1.326 J.005 E.03397
G1 X110.954 Y123.016 E.20736
G3 X109.623 Y121.685 I-.005 J-1.326 E.03397
G1 X109.623 Y108.915 E.20736
G3 X110.954 Y107.585 I1.326 J-.005 E.03397
G1 X123.798 Y107.592 E.20857
G3 X124.465 Y107.811 I-.063 J1.318 E.01154
G1 X124.607 Y107.924 E.00294
; WIPE_START
M204 S6000
G1 X124.665 Y107.974 E-.02917
G1 X124.831 Y108.172 E-.09819
G1 X124.953 Y108.4 E-.09826
G1 X125.028 Y108.647 E-.0983
G1 X125.054 Y108.915 E-.10218
G1 X125.054 Y109.794 E-.33392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.432 Y109.4 Z1.6 F42000
G1 X110.637 Y109.05 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4285
G1 F15000
M204 S6000
G1 X110.865 Y108.822 E.00535
G3 X111.026 Y108.778 I.13 J.161 E.00284
G1 X111.484 Y108.778 E.0076
G1 X110.817 Y109.446 E.01566
G1 X110.817 Y110.022 E.00955
G1 X112.06 Y108.778 E.02916
G1 X112.635 Y108.778 E.00954
G1 X110.817 Y110.597 E.04266
G1 X110.817 Y111.173 E.00955
G1 X113.211 Y108.779 E.05615
G1 X113.786 Y108.779 E.00954
G1 X110.817 Y111.748 E.06965
G1 X110.817 Y112.324 E.00955
G1 X114.362 Y108.779 E.08315
G1 X114.937 Y108.779 E.00954
G1 X110.817 Y112.9 E.09665
G1 X110.817 Y113.475 E.00955
G1 X115.513 Y108.779 E.11014
G1 X116.088 Y108.779 E.00954
G1 X110.817 Y114.051 E.12364
G1 X110.817 Y114.627 E.00955
G1 X116.664 Y108.78 E.13714
G1 X117.239 Y108.78 E.00954
G1 X110.817 Y115.202 E.15063
G1 X110.817 Y115.778 E.00955
G1 X117.815 Y108.78 E.16413
G1 X118.39 Y108.78 E.00954
G1 X110.817 Y116.354 E.17763
G1 X110.817 Y116.929 E.00955
G1 X118.966 Y108.78 E.19113
G1 X119.541 Y108.78 E.00954
G1 X110.817 Y117.505 E.20462
G1 X110.817 Y118.081 E.00955
G1 X120.117 Y108.78 E.21812
G1 X120.692 Y108.781 E.00954
G1 X110.817 Y118.656 E.23162
G1 X110.817 Y119.232 E.00955
G1 X121.268 Y108.781 E.24512
G1 X121.843 Y108.781 E.00954
G1 X110.817 Y119.807 E.25861
G1 X110.817 Y120.383 E.00955
G1 X122.419 Y108.781 E.27211
G1 X122.994 Y108.781 E.00954
G1 X110.817 Y120.959 E.28561
G1 X110.817 Y121.534 E.00955
G1 X123.57 Y108.781 E.29911
G3 X123.815 Y108.824 I.058 J.394 E.0042
G3 X123.861 Y109.066 I-.446 J.209 E.00414
G1 X111.105 Y121.822 E.29917
G1 X111.68 Y121.822 E.00955
G1 X123.861 Y109.642 E.28567
G1 X123.861 Y110.217 E.00955
G1 X112.256 Y121.822 E.27217
G1 X112.832 Y121.822 E.00955
G1 X123.861 Y110.793 E.25867
G1 X123.861 Y111.369 E.00955
G1 X113.407 Y121.822 E.24517
G1 X113.983 Y121.822 E.00955
G1 X123.861 Y111.944 E.23167
G1 X123.861 Y112.52 E.00955
G1 X114.559 Y121.822 E.21817
G1 X115.134 Y121.822 E.00955
G1 X123.861 Y113.096 E.20467
G1 X123.861 Y113.671 E.00955
G1 X115.71 Y121.822 E.19116
G1 X116.286 Y121.822 E.00955
G1 X123.861 Y114.247 E.17766
G1 X123.861 Y114.823 E.00955
G1 X116.861 Y121.822 E.16416
G1 X117.437 Y121.822 E.00955
G1 X123.861 Y115.398 E.15066
G1 X123.861 Y115.974 E.00955
G1 X118.012 Y121.822 E.13716
G1 X118.588 Y121.822 E.00955
G1 X123.861 Y116.549 E.12366
G1 X123.861 Y117.125 E.00955
G1 X119.164 Y121.822 E.11016
G1 X119.739 Y121.822 E.00955
G1 X123.861 Y117.701 E.09666
G1 X123.861 Y118.276 E.00955
G1 X120.315 Y121.822 E.08316
G1 X120.891 Y121.822 E.00955
G1 X123.861 Y118.852 E.06966
G1 X123.861 Y119.428 E.00955
G1 X121.466 Y121.822 E.05616
G1 X122.042 Y121.822 E.00955
G1 X123.861 Y120.003 E.04265
G1 X123.861 Y120.579 E.00955
G1 X122.618 Y121.822 E.02915
G1 X123.193 Y121.822 E.00955
G1 X123.861 Y121.155 E.01565
G1 X123.861 Y121.613 E.0076
G3 X123.816 Y121.775 I-.207 J.03 E.00287
G1 X123.59 Y122.001 E.00532
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X123.816 Y121.775 E-.12179
G1 X123.838 Y121.742 E-.01474
G1 X123.861 Y121.613 E-.05005
G1 X123.861 Y121.155 E-.1741
G1 X123.193 Y121.822 E-.35865
G1 X123.086 Y121.822 E-.04068
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 13/53
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S191.25
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.794 J.922 P1  F42000
G1 X148.802 Y143.96 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.7 F42000
G1 X151.648 Y132.298 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.0192
M73 P63 R7
G1 X152.74 Y148.107 E.20612
G3 X151.979 Y148.748 I-.744 J-.111 E.01898
G1 X129.414 Y148.748 E.394
G3 X128.653 Y148.029 I-.013 J-.748 E.02024
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.756 J-.013 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.027 Y124.653 I.792 J32.552 E.02837
G1 X152.2 Y124.68 E.00307
G3 X152.747 Y125.371 I-.212 J.729 E.0164
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.175 Y148.046 E.21254
G3 X151.988 Y149.176 I-1.18 J-.051 E.03164
G1 X129.408 Y149.176 E.39424
G3 X128.225 Y148.046 I-.007 J-1.177 E.0316
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.412 E.1277
G3 X129.348 Y124.225 I1.187 J-.002 E.0315
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G1 X151.992 Y124.223 E.03524
G3 X153.175 Y125.354 I.007 J1.177 E.0316
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.589 Y148.062 E.20464
G3 X151.996 Y149.59 I-1.596 J-.069 E.03956
G1 X129.403 Y149.59 E.36686
G3 X127.811 Y148.062 I-.002 J-1.591 E.03959
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.603 J.008 E.03949
G1 X131.84 Y123.81 E.04067
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.997 Y123.81 E.03957
G3 X153.589 Y125.338 I.002 J1.591 E.03958
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 13 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer13 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X132.384 Y146.775 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.138 Y147.139 E.33896
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01021
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.571 I-1.394 J0 E.00925
G1 X150.002 Y146.003 E.00849
G1 X149.57 Y146.297 E.00848
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.331 I-327.08 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.0066
G1 X149.721 Y145.721 E.0061
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.536 Y147.537 E.35328
G1 X151.537 Y137.513 E.16342
G1 X151.06 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y132.084 E.0751
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.305 Y125.863 E.00376
G1 X151.288 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.118 Y125.908 E.01162
G1 X130.101 Y125.868 E.00071
G1 X129.863 Y125.869 E.00388
G1 X129.863 Y131.087 E.08506
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.933 E.17568
G1 X151.934 Y147.936 E.36484
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.934 Y125.487 E.0974
G2 X151.083 Y125.464 I-.706 J10.495 E.01384
G1 X151.019 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.384 Y125.611 E.00694
G1 X130.321 Y125.468 E.00254
G1 X129.464 Y125.473 E.01391
G1 X129.464 Y131.486 E.09763
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.996 E.18317
G1 X129.142 Y148.2 E.00352
G1 X129.33 Y148.32 E.00363
G1 X129.471 Y148.334 E.00229
G1 X151.961 Y148.334 E.36519
G1 X152.213 Y148.246 E.00433
G1 X152.327 Y148.024 E.00404
G1 X152.333 Y147.938 E.00139
G1 X152.334 Y136.716 E.18223
G1 X151.434 Y136.716 E.01462
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.421 E.10495
G1 X152.206 Y125.147 E.00491
G1 X151.9 Y125.066 E.00513
G1 X150.816 Y125.066 E.01761
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
M73 P64 R7
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.651 Y125.315 E.00231
G3 X130.584 Y125.068 I.243 J-.197 E.00426
G1 X129.337 Y125.075 E.02025
G1 X129.13 Y125.218 E.00408
G1 X129.066 Y125.473 E.00427
G1 X129.066 Y131.884 E.1041
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.902 E.00219
G1 X130.652 Y127.764 E.01341
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X131.786 Y128.384 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y145.016 E.27008
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01115
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.444 E.2691
M204 S10000
G1 X132.184 Y128.384 F42000
G1 F15000
M204 S6000
G1 X132.196 Y128.315 E.00112
G1 X132.293 Y128.206 E.00238
G1 X132.384 Y128.184 E.00151
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y145.016 E.27008
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.444 E.2691
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.361 E.00917
G1 X130.261 Y130.746 E.07189
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09535
M204 S10000
G1 X150.761 Y145.323 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y145.463 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.309 E.01296
G1 X149.742 Y146.693 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y146.716 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y146.725 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y146.707 E.00268
G1 X150.705 Y146.707 E.01819
G1 X150.705 Y145.745 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y145.624 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y145.503 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 66
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.955 Y139.987 Z1.7 F42000
G1 X117.973 Y114.726 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.304 Y114.438 I-.643 J.573 E.08134
G1 X117.389 Y114.44 E.00148
G3 X117.931 Y114.683 I-.059 J.859 E.01059
M204 S10000
G1 X118.283 Y114.428 F42000
G1 F6000
M204 S6000
G3 X117.299 Y114.01 I-.952 J.871 E.12228
G1 X117.415 Y114.012 E.00201
G3 X118.242 Y114.385 I-.083 J1.287 E.01619
; WIPE_START
G1 X118.434 Y114.618 E-.11489
G1 X118.553 Y114.86 E-.10233
G1 X118.615 Y115.109 E-.09742
G1 X118.628 Y115.351 E-.09216
G1 X118.596 Y115.592 E-.09219
G1 X118.524 Y115.813 E-.08841
G1 X118.4 Y116.036 E-.09694
G1 X118.288 Y116.175 E-.06813
G1 X118.273 Y116.189 E-.00752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.952 Y110.159 Z1.7 F42000
G1 X124.677 Y107.935 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.69 Y107.949 E.0003
G3 X125.082 Y108.898 I-.938 J.944 E.01712
G1 X125.082 Y121.702 E.20791
G3 X123.741 Y123.044 I-1.337 J.005 E.03426
G1 X110.937 Y123.044 E.20791
G3 X109.595 Y121.702 I-.005 J-1.337 E.03426
G1 X109.595 Y108.898 E.20791
G3 X110.937 Y107.556 I1.337 J-.005 E.03426
G1 X123.822 Y107.564 E.20924
G3 X124.488 Y107.785 I-.07 J1.329 E.01152
G1 X124.63 Y107.898 E.00296
; WIPE_START
M204 S6000
G1 X124.69 Y107.949 E-.02972
G1 X124.857 Y108.149 E-.099
G1 X124.98 Y108.379 E-.09912
G1 X125.056 Y108.628 E-.09913
G1 X125.082 Y108.898 E-.10302
G1 X125.082 Y109.766 E-.33001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.863 Y109.016 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X123.622 Y107.775 E.0285
G1 X123.059 Y107.775
G1 X124.863 Y109.58 E.04144
G1 X124.863 Y110.144
G1 X122.495 Y107.775 E.05438
G1 X121.932 Y107.775
G1 X124.863 Y110.707 E.06732
G1 X124.863 Y111.271
G1 X121.368 Y107.775 E.08027
G1 X120.804 Y107.775
G1 X124.863 Y111.834 E.09321
G1 X124.863 Y112.398
G1 X120.241 Y107.775 E.10615
G1 X119.677 Y107.775
G1 X124.863 Y112.962 E.11909
G1 X124.863 Y113.525
G1 X119.114 Y107.775 E.13204
G1 X118.55 Y107.775
G1 X124.863 Y114.089 E.14498
G1 X124.863 Y114.652
G1 X117.986 Y107.775 E.15792
G1 X117.423 Y107.775
G1 X124.863 Y115.216 E.17086
G1 X124.863 Y115.78
G1 X116.859 Y107.775 E.18381
G1 X116.295 Y107.775
G1 X124.863 Y116.343 E.19675
G1 X124.863 Y116.907
G1 X115.732 Y107.775 E.20969
G1 X115.168 Y107.775
G1 X124.863 Y117.47 E.22263
G1 X124.863 Y118.034
G1 X114.605 Y107.775 E.23558
G1 X114.041 Y107.775
G1 X124.863 Y118.598 E.24852
G1 X124.863 Y119.161
G1 X113.477 Y107.775 E.26146
G1 X112.914 Y107.775
G1 X124.863 Y119.725 E.27441
G1 X124.863 Y120.288
G1 X112.35 Y107.775 E.28735
G1 X111.787 Y107.775
G1 X117.891 Y113.88 E.14019
G1 X117.227 Y113.78
G1 X111.223 Y107.775 E.13789
G1 X110.689 Y107.805
G1 X116.77 Y113.886 E.13965
G1 X116.411 Y114.091
G1 X110.296 Y107.976 E.14043
G1 X110.014 Y108.258
G1 X116.128 Y114.372 E.14041
G1 X115.925 Y114.732
G1 X109.844 Y108.651 E.13965
G1 X109.814 Y109.185
G1 X115.819 Y115.189 E.1379
G1 X115.919 Y115.853
G1 X109.814 Y109.748 E.14018
; WIPE_START
M204 S6000
G1 X111.228 Y111.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.119 Y114.444 Z1.7 F42000
G1 X118.76 Y114.748 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X124.863 Y120.852 E.14016
G1 X124.863 Y121.416
G1 X118.858 Y115.411 E.1379
G1 X118.753 Y115.869
G1 X124.834 Y121.95 E.13964
G1 X124.663 Y122.343
G1 X118.548 Y116.228 E.14043
G1 X118.267 Y116.51
G1 X124.381 Y122.624 E.14041
G1 X123.988 Y122.795
G1 X117.907 Y116.714 E.13965
G1 X117.45 Y116.82
G1 X123.454 Y122.825 E.13788
G1 X122.891 Y122.825
G1 X116.786 Y116.72 E.14019
; WIPE_START
M204 S6000
G1 X118.2 Y118.134 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.327 Y122.825 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X109.814 Y110.312 E.28735
G1 X109.814 Y110.875
G1 X121.763 Y122.825 E.2744
G1 X121.2 Y122.825
G1 X109.814 Y111.439 E.26146
G1 X109.814 Y112.003
G1 X120.636 Y122.825 E.24852
G1 X120.073 Y122.825
G1 X109.814 Y112.566 E.23557
G1 X109.814 Y113.13
G1 X119.509 Y122.825 E.22263
G1 X118.945 Y122.825
G1 X109.814 Y113.693 E.20969
G1 X109.814 Y114.257
G1 X118.382 Y122.825 E.19675
G1 X117.818 Y122.825
G1 X109.814 Y114.821 E.1838
G1 X109.814 Y115.384
G1 X117.254 Y122.825 E.17086
G1 X116.691 Y122.825
G1 X109.814 Y115.948 E.15792
G1 X109.814 Y116.511
G1 X116.127 Y122.825 E.14498
G1 X115.564 Y122.825
G1 X109.814 Y117.075 E.13203
G1 X109.814 Y117.639
G1 X115 Y122.825 E.11909
G1 X114.436 Y122.825
M73 P65 R7
G1 X109.814 Y118.202 E.10615
G1 X109.814 Y118.766
G1 X113.873 Y122.825 E.09321
G1 X113.309 Y122.825
G1 X109.814 Y119.329 E.08026
G1 X109.814 Y119.893
G1 X112.746 Y122.825 E.06732
G1 X112.182 Y122.825
G1 X109.814 Y120.457 E.05438
G1 X109.814 Y121.02
G1 X111.618 Y122.825 E.04144
G1 X111.055 Y122.825
G1 X109.814 Y121.584 E.02849
; WIPE_START
M204 S6000
G1 X111.055 Y122.825 E-.66678
G1 X111.3 Y122.825 E-.09323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.58 Y117.313 Z1.7 F42000
G1 X124.86 Y108.669 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191324
G1 F15000
M204 S6000
G1 X124.73 Y108.494 E.0015
; LINE_WIDTH: 0.237614
G2 X124.319 Y108.038 I-1.915 J1.312 E.00543
; LINE_WIDTH: 0.221508
G1 X124.144 Y107.908 E.00177
; LINE_WIDTH: 0.191324
G1 X123.97 Y107.779 E.0015
; WIPE_START
G1 X124.144 Y107.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.035 Y113.579 Z1.7 F42000
G1 X110.707 Y122.821 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.191222
G1 F15000
M204 S6000
G1 X110.533 Y122.692 E.0015
; LINE_WIDTH: 0.237526
G3 X110.076 Y122.28 I1.312 J-1.914 E.00542
; LINE_WIDTH: 0.221405
G1 X109.947 Y122.106 E.00177
; LINE_WIDTH: 0.191231
G1 X109.818 Y121.931 E.0015
; WIPE_START
G1 X109.947 Y122.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.807 Y117.215 Z1.7 F42000
G1 X118.747 Y114.761 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.180724
G1 F15000
M204 S6000
G1 X118.775 Y114.608 E.00101
G1 X118.67 Y114.469 E.00113
; LINE_WIDTH: 0.126283
G1 X118.38 Y114.152 E.00183
G1 X118.137 Y113.943 E.00137
; LINE_WIDTH: 0.182416
G1 X117.958 Y113.813 E.00145
; WIPE_START
G1 X118.137 Y113.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.372 Y116.898 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0925342
G1 F15000
M204 S6000
G1 X117.146 Y116.798 E.00072
M204 S10000
G1 X117.466 Y116.804 F42000
; LINE_WIDTH: 0.0916638
G1 F15000
M204 S6000
G1 X117.245 Y116.897 E.00069
M204 S10000
G1 X116.719 Y116.787 F42000
; LINE_WIDTH: 0.193148
G1 F15000
M204 S6000
G1 X116.59 Y116.695 E.00111
; LINE_WIDTH: 0.160862
G1 X116.484 Y116.612 E.00077
; LINE_WIDTH: 0.124229
G1 X116.26 Y116.413 E.00125
G1 X115.998 Y116.121 E.00165
; LINE_WIDTH: 0.175946
G1 X115.904 Y115.993 E.001
G1 X115.91 Y115.954 E.00025
; LINE_WIDTH: 0.140176
G1 X115.914 Y115.932 E.00011
; LINE_WIDTH: 0.103731
G1 X115.933 Y115.839 E.00032
M204 S10000
G1 X115.908 Y114.775 F42000
; LINE_WIDTH: 0.0763834
G1 F15000
M204 S6000
G1 X115.824 Y114.912 E.00036
; WIPE_START
G1 X115.908 Y114.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.559 Y115.674 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.745 Y115.478 E.00439
G1 X117.77 Y115.236 E.00395
G1 X117.669 Y115.004 E.00411
G1 X117.523 Y114.899 E.00291
G1 X117.267 Y114.864 E.0042
G1 X117.053 Y114.972 E.00389
G1 X116.909 Y115.2 E.00439
G1 X116.924 Y115.451 E.00407
G1 X117.081 Y115.65 E.00413
G1 X117.299 Y115.742 E.00384
G1 X117.501 Y115.689 E.0034
M204 S10000
G1 X117.371 Y115.256 F42000
; LINE_WIDTH: 0.4766
G1 F15000
M204 S6000
G2 X117.368 Y115.354 I-.028 J.048 E.00431
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.314 Y115.354 E-.18211
G1 X117.286 Y115.305 E-.19264
G1 X117.314 Y115.256 E-.19265
G1 X117.371 Y115.256 E-.1926
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 14/53
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S198.9
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I-.821 J.899 P1  F42000
G1 X148.802 Y143.96 Z1.7
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y144.802 E.0147
G1 X132.598 Y144.802 E.28293
G1 X132.598 Y128.598 E.28293
G1 X148.802 Y128.598 E.28293
G1 X148.802 Y143.9 E.26718
M204 S10000
G1 X148.374 Y143.96 F42000
G1 F6000
M204 S6000
G1 X148.374 Y144.374 E.00722
G1 X133.026 Y144.374 E.26796
G1 X133.026 Y129.026 E.26796
G1 X148.374 Y129.026 E.26796
G1 X148.374 Y143.9 E.2597
M204 S250
G1 X147.96 Y143.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y137.054 Z1.8 F42000
G1 X151.648 Y132.298 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y136.302 E.06991
G1 X152.748 Y136.302 E.01921
G1 X152.748 Y147.98 E.20389
G3 X151.979 Y148.748 I-.752 J.017 E.02122
G1 X129.413 Y148.748 E.39401
G3 X128.653 Y148.029 I-.012 J-.748 E.02022
G1 X128.652 Y136.302 E.20476
G1 X129.752 Y136.302 E.0192
G1 X129.752 Y132.298 E.06991
G1 X128.652 Y132.298 E.01921
G1 X128.652 Y125.421 E.12007
G3 X129.361 Y124.653 I.756 J-.013 E.02014
G1 X130.998 Y124.653 E.02859
G1 X130.998 Y124.952 E.00523
G1 X135.002 Y124.952 E.06991
G1 X135.002 Y124.652 E.00524
G1 X146.398 Y124.652 E.19898
G1 X146.398 Y124.952 E.00524
G1 X150.402 Y124.952 E.06991
G1 X150.402 Y124.652 E.00524
G3 X152.024 Y124.653 I.793 J34.944 E.02832
G3 X152.747 Y125.371 I-.026 J.749 E.01956
G1 X152.748 Y132.298 E.12095
G1 X151.708 Y132.298 E.01816
M204 S10000
G1 X152.076 Y132.726 F42000
G1 F6000
M204 S6000
G1 X152.076 Y135.873 E.05495
G1 X153.176 Y135.873 E.01921
G1 X153.176 Y147.988 E.21152
G3 X151.988 Y149.176 I-1.18 J.009 E.03267
G1 X129.408 Y149.176 E.39425
G3 X128.225 Y148.046 I-.007 J-1.177 E.03159
G1 X128.224 Y135.873 E.21253
G1 X129.323 Y135.873 E.01921
G1 X129.323 Y132.726 E.05495
G1 X128.223 Y132.726 E.01921
G1 X128.223 Y125.413 E.1277
G3 X129.348 Y124.225 I1.187 J-.003 E.0315
G1 X131.426 Y124.224 E.03629
G1 X131.426 Y124.523 E.00523
G1 X134.573 Y124.523 E.05495
G1 X134.573 Y124.223 E.00524
G1 X146.826 Y124.223 E.21394
G1 X146.826 Y124.523 E.00524
G1 X149.974 Y124.523 E.05495
G1 X149.974 Y124.223 E.00524
G3 X152.046 Y124.225 I1.009 J44.908 E.03619
G3 X153.175 Y125.354 I-.056 J1.185 E.03059
G1 X153.176 Y132.726 E.12872
G1 X152.136 Y132.726 E.01816
M204 S250
G1 X152.49 Y133.14 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.59 Y147.996 E.20356
G3 X151.996 Y149.59 I-1.593 J.001 E.04067
G1 X129.403 Y149.59 E.36687
G3 X127.811 Y148.062 I-.002 J-1.591 E.03958
G1 X127.81 Y135.46 E.20463
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.603 J.008 E.0395
G1 X131.84 Y123.81 E.04067
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.997 Y123.81 E.03958
G3 X153.589 Y125.338 I-.001 J1.594 E.03956
G1 X153.59 Y133.14 E.12669
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 14 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer14 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M73 P66 R7
G1 X132.384 Y146.775 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y146.748 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y146.721 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y146.693 E.00458
G1 X131.092 Y146.309 E.0129
G1 X130.707 Y145.742 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y145.602 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y145.463 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y145.323 E.00216
G1 X130.657 Y145.463 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y145.604 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y145.745 E.00269
G1 X130.695 Y146.707 E.01821
G1 X131.656 Y146.707 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y146.728 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y146.748 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y146.769 E.00321
M204 S10000
G1 X130.639 Y145.323 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y145.016 E.00411
G1 X130.625 Y138.207 E.09127
M204 S10000
G1 X130.989 Y137.428 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y137.81 E.01021
G1 X130.261 Y137.854 E.00376
G1 X130.262 Y147.139 E.15077
G1 X151.139 Y147.139 E.33898
G1 X151.139 Y137.854 E.15077
G1 X150.911 Y137.81 E.00376
G1 X150.411 Y137.428 E.01022
G1 X150.411 Y145.016 E.12322
G3 X150.296 Y145.57 I-1.394 J0 E.00925
G1 X150.003 Y146.003 E.00849
G1 X149.57 Y146.296 E.00849
G3 X149.016 Y146.411 I-.554 J-1.28 E.00925
G1 X132.384 Y146.411 E.27007
G1 X131.83 Y146.297 E.00918
G1 X131.398 Y146.003 E.00848
G1 X131.104 Y145.571 E.00849
G3 X130.989 Y145.016 I1.279 J-.554 E.00926
G1 X130.989 Y137.488 E.12225
M204 S10000
G1 X131.381 Y136.516 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y131.268 I327.135 J-2.216 E.08563
G1 X131.387 Y128.384 E.04707
G1 X131.447 Y128.043 E.00564
G1 X131.608 Y127.759 E.00532
G1 X131.933 Y127.495 E.00683
G3 X132.384 Y127.387 I.451 J.888 E.00764
G1 X149.016 Y127.387 E.27139
G1 X149.467 Y127.495 E.00756
G1 X149.792 Y127.758 E.00682
G1 X149.953 Y128.043 E.00533
G1 X150.013 Y128.384 E.00565
G2 X150.019 Y132.084 I230.489 J1.443 E.06037
G3 X150.013 Y137.332 I-327.131 J2.216 E.08563
G1 X150.013 Y145.016 E.12539
G1 X149.931 Y145.412 E.00659
G1 X149.721 Y145.721 E.00609
G1 X149.412 Y145.931 E.00609
G1 X149.016 Y146.013 E.00659
G1 X132.384 Y146.013 E.27139
G1 X131.988 Y145.931 E.00659
G1 X131.679 Y145.721 E.00609
G1 X131.469 Y145.412 E.0061
G1 X131.387 Y145.016 E.0066
G1 X131.387 Y137.331 E.12539
G3 X131.379 Y136.576 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y136.516 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y136.69 E.00284
G1 X130.759 Y137.12 E.00772
G1 X130.34 Y137.44 E.00861
G1 X129.863 Y137.513 E.00786
G1 X129.864 Y147.537 E.16342
G1 X151.537 Y147.537 E.35331
G1 X151.537 Y137.513 E.16342
G1 X151.061 Y137.44 E.00786
G1 X150.641 Y137.12 E.00861
G1 X150.441 Y136.69 E.00772
G1 X150.431 Y136.516 E.00284
G1 X150.431 Y132.084 E.07226
G1 X150.641 Y131.48 E.01041
G1 X151.06 Y131.16 E.00861
G1 X151.537 Y131.087 E.00786
G1 X151.536 Y125.863 E.08516
G1 X151.305 Y125.863 E.00376
G1 X151.288 Y125.902 E.00069
G1 X150.616 Y126.163 E.01175
G1 X146.184 Y126.163 E.07226
G1 X145.627 Y125.993 E.00949
G1 X145.558 Y125.863 E.0024
G1 X135.842 Y125.863 E.15838
G1 X135.773 Y125.993 E.0024
G1 X135.388 Y126.148 E.00676
G1 X135.216 Y126.163 E.00282
G1 X130.784 Y126.163 E.07226
G1 X130.112 Y125.903 E.01173
G1 X130.095 Y125.864 E.00069
G1 X129.863 Y125.864 E.00379
G1 X129.863 Y131.087 E.08515
G1 X130.339 Y131.16 E.00786
G1 X130.759 Y131.48 E.00861
G1 X130.969 Y132.084 E.01042
G1 X130.969 Y136.456 E.07128
M204 S10000
G1 X130.564 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y136.878 E.0062
G1 X130.19 Y137.071 E.00514
G1 X129.966 Y137.114 E.0037
G1 X129.464 Y137.114 E.00815
G1 X129.465 Y147.935 E.1757
G1 X151.934 Y147.936 E.36483
G1 X151.936 Y137.114 E.17572
G1 X151.434 Y137.114 E.00815
G1 X151.21 Y137.071 E.0037
G1 X150.958 Y136.878 E.00514
G1 X150.836 Y136.516 E.0062
G1 X150.836 Y132.084 E.07198
G1 X150.958 Y131.722 E.0062
G1 X151.21 Y131.529 E.00514
G1 X151.434 Y131.486 E.00371
G1 X151.936 Y131.486 E.00815
G1 X151.935 Y125.475 E.0976
G2 X151.083 Y125.464 I-.711 J22.788 E.01383
G1 X151.02 Y125.608 E.00254
G1 X150.556 Y125.764 E.00795
G1 X146.184 Y125.764 E.07099
G1 X145.85 Y125.662 E.00567
G1 X145.744 Y125.464 E.00364
G1 X135.656 Y125.464 E.16382
G1 X135.55 Y125.662 E.00364
G1 X135.216 Y125.764 E.00567
G1 X130.784 Y125.764 E.07198
G1 X130.381 Y125.608 E.00701
G1 X130.318 Y125.465 E.00254
G1 X129.474 Y125.465 E.0137
G1 X129.464 Y131.486 E.09776
G1 X129.966 Y131.486 E.00815
G1 X130.19 Y131.529 E.0037
G1 X130.442 Y131.722 E.00514
G1 X130.564 Y132.084 E.0062
G1 X130.564 Y136.456 E.071
M204 S10000
G1 X130.166 Y136.516 F42000
G1 F15000
M204 S6000
G1 X130.125 Y136.637 E.00207
G1 X129.966 Y136.716 E.00287
G1 X129.066 Y136.716 E.01462
G1 X129.067 Y147.997 E.18318
G1 X129.148 Y148.207 E.00367
G1 X129.309 Y148.314 E.00314
G1 X129.474 Y148.334 E.0027
G1 X151.961 Y148.334 E.36512
G1 X152.211 Y148.246 E.00431
G1 X152.321 Y148.067 E.00341
G1 X152.334 Y147.93 E.00222
G1 X152.334 Y136.716 E.1821
G1 X151.434 Y136.716 E.01463
G1 X151.275 Y136.637 E.00287
G1 X151.234 Y136.516 E.00207
G1 X151.234 Y132.084 E.07198
G1 X151.275 Y131.963 E.00207
G1 X151.434 Y131.884 E.00287
G1 X152.334 Y131.884 E.01462
G1 X152.333 Y125.411 E.10511
G1 X152.251 Y125.208 E.00356
G1 X152.116 Y125.116 E.00266
G1 X151.898 Y125.066 E.00363
G1 X150.816 Y125.066 E.01758
G3 X150.751 Y125.313 I-.313 J.05 E.00428
G1 X150.556 Y125.366 E.00328
G1 X146.184 Y125.366 E.07099
G1 X146.072 Y125.332 E.00189
G1 X145.984 Y125.166 E.00304
G1 X145.984 Y125.066 E.00164
G1 X135.416 Y125.066 E.17161
G1 X135.416 Y125.166 E.00164
G1 X135.328 Y125.332 E.00304
G1 X135.216 Y125.366 E.00189
G1 X130.784 Y125.366 E.07198
G1 X130.649 Y125.314 E.00234
G3 X130.584 Y125.066 I.247 J-.197 E.00427
G1 X129.407 Y125.067 E.01912
G2 X129.118 Y125.239 I.011 J.347 E.0057
G1 X129.066 Y125.512 E.00452
G1 X129.066 Y131.884 E.10348
G1 X129.966 Y131.884 E.01463
G1 X130.125 Y131.963 E.00287
G1 X130.166 Y132.084 E.00207
G1 X130.166 Y136.456 E.071
M204 S10000
G1 X130.625 Y130.453 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y128.444 E.02694
M204 S10000
G1 X130.625 Y128.384 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y128.078 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y127.773 E.00479
G1 X130.993 Y127.264 E.0091
G1 X131.377 Y126.952 E.0077
G1 X130.784 Y126.952 E.00923
G1 X130.652 Y126.901 E.0022
G1 X130.652 Y127.764 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y128.044 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y128.324 E.00391
M204 S10000
G1 X136.199 Y126.625 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y126.625 E.11992
M204 S10000
G1 X145.201 Y126.989 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y126.982 I2.399 J257.423 E.06255
G1 X149.648 Y127.14 E.01067
G1 X150.102 Y127.508 E.0096
G1 X150.327 Y127.906 E.00749
G1 X150.411 Y128.384 E.00794
G1 X150.411 Y131.172 E.04572
G1 X150.911 Y130.79 E.01031
G1 X151.138 Y130.746 E.0038
G1 X151.138 Y126.359 E.07193
G1 X150.616 Y126.561 E.00917
G3 X146.184 Y126.568 I-4.175 J-1194.195 E.07267
G1 X145.404 Y126.323 E.01339
G1 X145.371 Y126.261 E.00115
G1 X136.029 Y126.261 E.15318
G1 X135.995 Y126.323 E.00115
G1 X135.46 Y126.553 E.00956
G1 X135.216 Y126.568 E.004
G3 X130.784 Y126.561 I-.264 J-1188.589 E.07267
G1 X130.261 Y126.359 E.00919
G1 X130.261 Y130.746 E.07193
G1 X130.489 Y130.79 E.0038
G1 X130.989 Y131.172 E.01032
G1 X130.989 Y128.384 E.04572
G1 X131.073 Y127.907 E.00794
M73 P66 R6
G1 X131.297 Y127.509 E.00749
G1 X131.752 Y127.14 E.0096
G1 X132.14 Y126.997 E.00678
G1 X132.384 Y126.982 E.004
G3 X136.199 Y126.989 I1.416 J257.431 E.06255
G1 X145.141 Y126.989 E.14661
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y130.393 E.0269
M204 S10000
G1 X150.775 Y128.383 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y128.073 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y126.901 I13.32 J-.744 E.01822
G1 X150.556 Y126.952 E.00308
G1 X150.022 Y126.952 E.00829
G1 X150.407 Y127.263 E.00769
G1 X150.694 Y127.773 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y128.048 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y128.324 E.00387
M204 S10000
G1 X149.216 Y136.516 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.216 Y145.016 E.13802
G1 X149.157 Y145.157 E.00248
G1 X149.016 Y145.216 E.00248
G1 X132.384 Y145.216 E.27007
G1 X132.243 Y145.157 E.00248
G1 X132.184 Y145.016 E.00248
G1 X132.184 Y128.384 E.27007
G1 X132.228 Y128.259 E.00215
G1 X132.384 Y128.184 E.00279
G1 X149.016 Y128.184 E.27007
G1 X149.171 Y128.259 E.00279
G1 X149.216 Y128.384 E.00215
G1 X149.216 Y136.456 E.13108
M204 S10000
G1 X149.614 Y136.516 F42000
G1 F15000
M204 S6000
G1 X149.614 Y145.016 E.13802
G1 X149.565 Y145.254 E.00394
G3 X149.016 Y145.614 I-.588 J-.297 E.01116
G1 X132.384 Y145.614 E.27007
G1 X132.146 Y145.565 E.00393
G3 X131.786 Y145.016 I.297 J-.588 E.01116
G1 X131.786 Y128.384 E.27007
G3 X132.113 Y127.851 I.649 J.031 E.01059
G1 X132.384 Y127.786 E.00452
G1 X149.016 Y127.786 E.27007
G1 X149.287 Y127.851 E.00452
G1 X149.482 Y128.009 E.00407
G3 X149.614 Y128.384 I-.465 J.375 E.00658
G1 X149.614 Y136.456 E.13108
M204 S10000
G1 X150.775 Y138.147 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y145.263 E.09555
M204 S10000
G1 X150.762 Y145.323 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y145.462 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y145.602 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y145.742 E.00268
G1 X150.308 Y146.308 E.01296
G1 X149.742 Y146.693 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y146.716 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y146.739 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y146.762 E.00216
G1 X149.463 Y146.743 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y146.725 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y146.706 E.00269
G1 X150.706 Y146.706 E.01822
G1 X150.706 Y145.745 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y145.624 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y145.503 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y145.382 E.00186
M204 S10000
G1 X149.323 Y146.762 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y146.775 E.00411
G1 X132.444 Y146.775 E.2224
; OBJECT_ID: 66
; WIPE_START
G1 X134.444 Y146.775 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X132.536 Y139.385 Z1.8 F42000
G1 X124.475 Y108.164 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X124.86 Y109.085 I-.929 J.929 E.01663
G1 X124.86 Y121.515 E.20185
G3 X123.554 Y122.821 I-1.314 J-.008 E.03325
G1 X111.123 Y122.821 E.20185
G3 X109.818 Y121.515 I.008 J-1.314 E.03325
G1 X109.818 Y109.085 E.20185
G3 X111.123 Y107.779 I1.314 J.008 E.03325
G1 X123.554 Y107.779 E.20185
G3 X124.432 Y108.122 I-.008 J1.314 E.01565
; WIPE_START
M204 S6000
G1 X124.639 Y108.363 E-.12077
G1 X124.76 Y108.591 E-.09814
G1 X124.835 Y108.838 E-.09811
G1 X124.86 Y109.085 E-.09415
G1 X124.86 Y110.003 E-.34884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.379 Y117.62 Z1.8 F42000
G1 X124.038 Y123.043 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.03 Y123.045 E.00014
G3 X123.758 Y123.072 I-.268 J-1.322 E.00445
G1 X110.92 Y123.072 E.20846
G3 X109.567 Y121.719 I-.004 J-1.349 E.03455
G1 X109.567 Y108.881 E.20846
G3 X110.92 Y107.528 I1.349 J-.004 E.03455
G1 X123.847 Y107.537 E.20991
G3 X125.111 Y108.881 I-.077 J1.339 E.03304
G1 X125.111 Y121.719 E.20846
G3 X124.281 Y122.968 I-1.349 J.004 E.02582
G1 X124.095 Y123.025 E.00316
; WIPE_START
M204 S6000
G1 X124.03 Y123.045 E-.02598
G1 X123.758 Y123.072 E-.10388
G1 X122.099 Y123.072 E-.63015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.037 Y117.36 Z1.8 F42000
G1 X116.21 Y116.427 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.051 Y116.25 E.00415
G3 X117.296 Y113.703 I1.282 J-.951 E.06094
G1 X117.433 Y113.706 E.00238
G3 X116.249 Y116.472 I-.1 J1.593 E.10663
M204 S10000
G1 X115.887 Y116.708 F42000
G1 F6000
M204 S6000
G1 X115.707 Y116.504 E.00475
G3 X117.292 Y113.274 I1.628 J-1.205 E.07732
G1 X117.458 Y113.278 E.0029
G3 X115.926 Y116.754 I-.123 J2.022 E.13615
M204 S250
G1 X115.576 Y116.979 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.376 Y116.748 E.00495
G3 X117.288 Y112.861 I1.961 J-1.449 E.08661
G1 X117.483 Y112.864 E.00316
G3 X115.633 Y117.043 I-.146 J2.435 E.1527
G1 X115.615 Y117.024 E.00043
; WIPE_START
M204 S6000
G1 X115.376 Y116.748 E-.13861
M73 P67 R6
G1 X115.219 Y116.508 E-.10921
G1 X115.09 Y116.247 E-.11069
G1 X114.968 Y115.877 E-.14803
G1 X114.93 Y115.687 E-.07366
G1 X114.899 Y115.298 E-.14819
G1 X114.907 Y115.215 E-.0316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.503 Y114.966 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.242 Y114.933 E.00426
G1 X117.057 Y115.047 E.00353
G1 X116.964 Y115.243 E.00352
G1 X117.034 Y115.525 E.00473
G1 X117.213 Y115.657 E.00361
G1 X117.431 Y115.668 E.00355
G1 X117.623 Y115.549 E.00367
G1 X117.715 Y115.348 E.00359
G1 X117.717 Y115.279 E.00113
G1 X117.636 Y115.064 E.00373
G1 X117.551 Y115.001 E.00172
M204 S10000
G1 X117.368 Y115.27 F42000
; LINE_WIDTH: 0.35916
G1 F15000
M204 S6000
G1 X117.304 Y115.307 E.00101
G1 X117.352 Y115.334 E.00076
M204 S10000
G1 X116.609 Y115.033 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X116.561 Y115.326 E.00482
G1 X116.677 Y115.712 E.00653
G1 X116.862 Y115.919 E.00452
G1 X117.14 Y116.056 E.00502
G1 X117.455 Y116.073 E.00513
G1 X117.745 Y115.968 E.005
G1 X117.971 Y115.759 E.005
G1 X118.099 Y115.479 E.00499
G1 X118.115 Y115.257 E.00362
G1 X118.031 Y114.948 E.0052
G1 X117.839 Y114.705 E.00502
G1 X117.675 Y114.597 E.00319
G1 X117.283 Y114.524 E.00648
G1 X117.009 Y114.596 E.0046
G1 X116.763 Y114.777 E.00496
G1 X116.64 Y114.982 E.00387
M204 S10000
G1 X116.214 Y115.601 F42000
G1 F15000
M204 S6000
G1 X116.32 Y115.898 E.00512
G1 X116.618 Y116.236 E.00731
G1 X117.037 Y116.443 E.00759
G1 X117.512 Y116.469 E.00772
G1 X117.951 Y116.311 E.00758
G1 X118.294 Y115.995 E.00758
G1 X118.489 Y115.572 E.00757
G2 X118.449 Y114.894 I-1.296 J-.263 E.01115
G1 X118.205 Y114.496 E.00758
G1 X117.824 Y114.223 E.00761
G1 X117.4 Y114.121 E.00707
G1 X116.954 Y114.182 E.00731
G1 X116.551 Y114.419 E.00759
G1 X116.272 Y114.791 E.00756
G1 X116.157 Y115.261 E.00786
G1 X116.204 Y115.542 E.00462
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.157 Y115.261 E-.10805
G1 X116.272 Y114.791 E-.18398
G1 X116.551 Y114.419 E-.1769
G1 X116.954 Y114.182 E-.17764
G1 X117.25 Y114.142 E-.11343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 15/53
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S186.15
; OBJECT_ID: 88
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.848 J.873 P1  F42000
G1 X147.96 Y143.96 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y143.96 E.23578
G1 X133.44 Y129.44 E.23578
G1 X147.96 Y129.44 E.23578
G1 X147.96 Y143.9 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y143.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.918 Y137.382 Z1.9 F42000
G1 X152.49 Y133.14 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X152.49 Y135.46 E.03767
G1 X153.59 Y135.46 E.01786
G1 X153.589 Y148.063 E.20464
G3 X151.996 Y149.59 I-1.592 J-.066 E.03958
G1 X129.404 Y149.59 E.36684
G3 X127.811 Y148.062 I-.001 J-1.593 E.03959
G1 X127.81 Y135.46 E.20464
G1 X128.91 Y135.46 E.01786
G1 X128.91 Y133.14 E.03767
G1 X127.81 Y133.14 E.01786
G1 X127.81 Y125.404 E.12561
G3 X129.336 Y123.811 I1.603 J.008 E.03949
G1 X131.84 Y123.81 E.04067
G1 X131.84 Y124.11 E.00487
G1 X134.16 Y124.11 E.03767
G1 X134.16 Y123.81 E.00487
G1 X147.24 Y123.81 E.21239
G1 X147.24 Y124.11 E.00487
G1 X149.56 Y124.11 E.03767
G1 X149.56 Y123.81 E.00487
G1 X151.996 Y123.81 E.03955
G3 X153.589 Y125.338 I.001 J1.593 E.03959
G1 X153.59 Y133.14 E.1267
G1 X152.55 Y133.14 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y135.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
M625
; object ids of layer 15 start: 66,88
M624 BQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.9
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer15 end: 66,88
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
G1 X153.369 Y125.416 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X151.982 Y124.029 E.03185
G1 X151.419 Y124.029
G1 X153.37 Y125.98 E.0448
G1 X153.37 Y126.544
G1 X150.855 Y124.029 E.05774
G1 X150.292 Y124.029
G1 X153.37 Y127.107 E.07069
G1 X153.37 Y127.671
G1 X149.779 Y124.08 E.08246
G1 X149.464 Y124.329
G1 X153.37 Y128.235 E.08969
G1 X153.37 Y128.798
G1 X148.901 Y124.329 E.10263
G1 X148.337 Y124.329
G1 X153.37 Y129.362 E.11558
G1 X153.37 Y129.926
G1 X147.774 Y124.329 E.12852
G1 X147.21 Y124.329
G1 X153.37 Y130.49 E.14147
G1 X153.37 Y131.053
G1 X146.346 Y124.029 E.1613
G1 X145.783 Y124.029
G1 X153.371 Y131.617 E.17425
G1 X153.371 Y132.181
G1 X145.219 Y124.029 E.18719
G1 X144.655 Y124.029
G1 X153.371 Y132.744 E.20014
G1 X152.984 Y132.921
G1 X144.092 Y124.029 E.20419
G1 X143.528 Y124.029
G1 X152.42 Y132.921 E.20419
G1 X152.271 Y133.335
G1 X148.179 Y129.244 E.09396
G1 X148.179 Y129.807
G1 X152.271 Y133.899 E.09396
G1 X152.271 Y134.463
G1 X148.179 Y130.371 E.09396
G1 X148.179 Y130.934
G1 X152.271 Y135.026 E.09396
G1 X152.271 Y135.59
G1 X148.179 Y131.498 E.09396
; WIPE_START
M204 S6000
G1 X149.593 Y132.912 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.156 Y129.221 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X142.965 Y124.029 E.11922
G1 X142.401 Y124.029
G1 X147.593 Y129.221 E.11922
G1 X147.029 Y129.221
G1 X141.837 Y124.029 E.11922
G1 X141.274 Y124.029
G1 X146.465 Y129.221 E.11922
G1 X145.902 Y129.221
G1 X140.71 Y124.029 E.11922
G1 X140.147 Y124.029
G1 X145.338 Y129.221 E.11922
G1 X144.775 Y129.221
G1 X139.583 Y124.029 E.11922
G1 X139.019 Y124.029
G1 X144.211 Y129.221 E.11922
G1 X143.647 Y129.221
G1 X138.456 Y124.029 E.11922
G1 X137.892 Y124.029
G1 X143.084 Y129.221 E.11922
G1 X142.52 Y129.221
G1 X137.329 Y124.029 E.11922
G1 X136.765 Y124.029
G1 X141.957 Y129.221 E.11922
G1 X141.393 Y129.221
G1 X136.201 Y124.029 E.11922
G1 X135.638 Y124.029
G1 X140.829 Y129.221 E.11922
G1 X140.266 Y129.221
G1 X135.074 Y124.029 E.11922
G1 X134.511 Y124.029
G1 X139.702 Y129.221 E.11922
G1 X139.139 Y129.221
G1 X134.247 Y124.329 E.11233
G1 X133.683 Y124.329
G1 X138.575 Y129.221 E.11233
G1 X138.011 Y129.221
G1 X133.12 Y124.329 E.11233
G1 X132.556 Y124.329
G1 X137.448 Y129.221 E.11233
G1 X136.884 Y129.221
G1 X131.993 Y124.329 E.11233
G1 X131.129 Y124.03
G1 X136.321 Y129.221 E.11921
G1 X135.757 Y129.221
G1 X130.566 Y124.03 E.1192
G1 X130.003 Y124.03
G1 X135.193 Y129.221 E.1192
G1 X134.63 Y129.221
G1 X129.439 Y124.03 E.11919
G1 X128.956 Y124.11
G1 X134.066 Y129.221 E.11736
G1 X133.503 Y129.221
G1 X128.589 Y124.307 E.11284
M73 P68 R6
G1 X128.302 Y124.584
G1 X133.221 Y129.503 E.11294
G1 X133.221 Y130.066
G1 X128.108 Y124.953 E.11742
G1 X128.029 Y125.438
G1 X133.221 Y130.63 E.11922
G1 X133.221 Y131.193
G1 X128.029 Y126.002 E.11922
G1 X128.029 Y126.565
G1 X133.221 Y131.757 E.11922
G1 X133.221 Y132.321
G1 X128.029 Y127.129 E.11922
G1 X128.029 Y127.693
G1 X133.221 Y132.884 E.11922
G1 X133.221 Y133.448
G1 X128.029 Y128.256 E.11922
G1 X128.029 Y128.82
G1 X133.221 Y134.012 E.11922
G1 X133.221 Y134.575
G1 X128.029 Y129.383 E.11922
G1 X128.029 Y129.947
G1 X133.221 Y135.139 E.11922
G1 X133.221 Y135.702
G1 X128.029 Y130.511 E.11922
G1 X128.029 Y131.074
G1 X133.221 Y136.266 E.11922
G1 X133.221 Y136.83
G1 X128.029 Y131.638 E.11922
G1 X128.029 Y132.202
G1 X128.748 Y132.921 E.01652
G1 X129.129 Y133.302
G1 X133.221 Y137.393 E.09396
G1 X133.221 Y137.957
G1 X129.129 Y133.865 E.09396
G1 X129.129 Y134.429
G1 X133.221 Y138.52 E.09396
G1 X133.221 Y139.084
G1 X129.129 Y134.992 E.09396
G1 X129.129 Y135.556
G1 X133.221 Y139.648 E.09396
G1 X133.221 Y140.211
G1 X128.689 Y135.679 E.10407
G1 X128.125 Y135.679
G1 X133.221 Y140.775 E.11702
G1 X133.221 Y141.338
G1 X128.029 Y136.147 E.11922
G1 X128.029 Y136.711
G1 X133.221 Y141.902 E.11922
G1 X133.221 Y142.466
G1 X128.029 Y137.274 E.11922
G1 X128.029 Y137.838
G1 X133.221 Y143.029 E.11921
G1 X133.221 Y143.593
G1 X128.029 Y138.402 E.11921
G1 X128.03 Y138.965
G1 X133.221 Y144.156 E.11921
; WIPE_START
M204 S6000
G1 X131.807 Y142.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.045 Y140.321 Z1.9 F42000
G1 X152.924 Y135.679 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X153.371 Y136.126 E.01026
G1 X153.371 Y136.69
G1 X152.36 Y135.679 E.0232
; WIPE_START
M204 S6000
G1 X153.371 Y136.69 E-.543
G1 X153.371 Y136.126 E-.21415
G1 X153.365 Y136.121 E-.00286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.179 Y132.062 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X153.371 Y137.253 E.11922
G1 X153.371 Y137.817
G1 X148.179 Y132.625 E.11921
G1 X148.179 Y133.189
G1 X153.37 Y138.38 E.11921
G1 X153.37 Y138.944
G1 X148.179 Y133.753 E.11921
G1 X148.179 Y134.316
G1 X153.37 Y139.507 E.11921
G1 X153.37 Y140.071
G1 X148.179 Y134.88 E.11921
G1 X148.179 Y135.443
G1 X153.37 Y140.634 E.11921
G1 X153.37 Y141.198
G1 X148.179 Y136.007 E.11921
G1 X148.179 Y136.571
G1 X153.37 Y141.761 E.1192
G1 X153.37 Y142.325
G1 X148.179 Y137.134 E.1192
G1 X148.179 Y137.698
G1 X153.37 Y142.889 E.1192
G1 X153.37 Y143.452
G1 X148.179 Y138.261 E.1192
G1 X148.179 Y138.825
G1 X153.37 Y144.016 E.1192
G1 X153.37 Y144.579
G1 X148.179 Y139.389 E.1192
G1 X148.179 Y139.952
G1 X153.37 Y145.143 E.1192
G1 X153.37 Y145.706
G1 X148.179 Y140.516 E.11919
G1 X148.179 Y141.079
G1 X153.37 Y146.27 E.11919
G1 X153.37 Y146.833
G1 X148.179 Y141.643 E.11919
G1 X148.179 Y142.207
G1 X153.369 Y147.397 E.11919
G1 X153.369 Y147.96
G1 X148.179 Y142.77 E.11919
G1 X148.179 Y143.334
G1 X153.293 Y148.448 E.11743
G1 X153.097 Y148.816
G1 X148.179 Y143.897 E.11294
G1 X147.897 Y144.179
G1 X152.814 Y149.096 E.11292
G1 X152.441 Y149.286
G1 X147.334 Y144.179 E.11728
G1 X146.77 Y144.179
G1 X151.962 Y149.371 E.11922
G1 X151.398 Y149.371
G1 X146.206 Y144.179 E.11922
G1 X145.643 Y144.179
G1 X150.835 Y149.371 E.11922
G1 X150.271 Y149.371
G1 X145.079 Y144.179 E.11922
G1 X144.516 Y144.179
G1 X149.707 Y149.371 E.11922
G1 X149.144 Y149.371
G1 X143.952 Y144.179 E.11922
G1 X143.388 Y144.179
G1 X148.58 Y149.371 E.11922
G1 X148.016 Y149.371
G1 X142.825 Y144.179 E.11922
G1 X142.261 Y144.179
G1 X147.453 Y149.371 E.11922
G1 X146.889 Y149.371
G1 X141.698 Y144.179 E.11922
G1 X141.134 Y144.179
G1 X146.326 Y149.371 E.11922
G1 X145.762 Y149.371
G1 X140.57 Y144.179 E.11922
G1 X140.007 Y144.179
G1 X145.198 Y149.371 E.11922
G1 X144.635 Y149.371
G1 X139.443 Y144.179 E.11922
G1 X138.88 Y144.179
G1 X144.071 Y149.371 E.11922
M73 P69 R6
G1 X143.508 Y149.371
G1 X138.316 Y144.179 E.11922
G1 X137.752 Y144.179
G1 X142.944 Y149.371 E.11922
G1 X142.38 Y149.371
G1 X137.189 Y144.179 E.11922
G1 X136.625 Y144.179
G1 X141.817 Y149.371 E.11922
G1 X141.253 Y149.371
G1 X136.062 Y144.179 E.11922
G1 X135.498 Y144.179
G1 X140.69 Y149.371 E.11922
G1 X140.126 Y149.371
G1 X134.934 Y144.179 E.11922
G1 X134.371 Y144.179
G1 X139.562 Y149.371 E.11922
G1 X138.999 Y149.371
G1 X133.807 Y144.179 E.11922
G1 X133.244 Y144.179
G1 X138.435 Y149.371 E.11922
G1 X137.872 Y149.371
G1 X128.03 Y139.529 E.22601
G1 X128.03 Y140.093
G1 X137.308 Y149.371 E.21307
G1 X136.744 Y149.371
G1 X128.03 Y140.656 E.20012
G1 X128.03 Y141.22
G1 X136.181 Y149.371 E.18718
G1 X135.617 Y149.371
G1 X128.03 Y141.784 E.17423
G1 X128.03 Y142.347
G1 X135.054 Y149.371 E.16129
G1 X134.49 Y149.371
G1 X128.03 Y142.911 E.14835
G1 X128.03 Y143.475
G1 X133.926 Y149.371 E.1354
G1 X133.363 Y149.371
G1 X128.03 Y144.038 E.12246
G1 X128.03 Y144.602
G1 X132.799 Y149.371 E.10951
G1 X132.235 Y149.371
G1 X128.03 Y145.166 E.09657
G1 X128.03 Y145.729
G1 X131.672 Y149.371 E.08363
G1 X131.108 Y149.371
G1 X128.03 Y146.293 E.07068
G1 X128.03 Y146.857
G1 X130.545 Y149.371 E.05774
G1 X129.981 Y149.371
G1 X128.03 Y147.42 E.04479
G1 X128.031 Y147.984
G1 X129.417 Y149.371 E.03185
; WIPE_START
M204 S6000
G1 X128.031 Y147.984 E-.74534
G1 X128.031 Y147.945 E-.01466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.84 Y142.019 Z1.9 F42000
G1 X147.136 Y124.403 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133149
G1 F15000
M204 S6000
G1 X147.041 Y124.364 E.00047
G1 X146.686 Y124.009 E.00228
; WIPE_START
G1 X147.041 Y124.364 E-.63084
G1 X147.136 Y124.403 E-.12916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.341 Y125.05 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.197069
G1 F15000
M204 S6000
G1 X153.104 Y124.729 E.00285
; LINE_WIDTH: 0.240251
G2 X152.676 Y124.301 I-2.25 J1.817 E.00541
; LINE_WIDTH: 0.2038
G1 X152.515 Y124.183 E.00148
; LINE_WIDTH: 0.171914
G1 X152.354 Y124.066 E.00122
; WIPE_START
G1 X152.515 Y124.183 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.328 Y125.069 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0764927
G1 F15000
M204 S6000
G1 X153.015 Y124.456 E.00154
; WIPE_START
G1 X153.328 Y125.069 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.813 Y130.346 Z1.9 F42000
G1 X128.381 Y148.937 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0757753
G1 F15000
M204 S6000
G1 X128.072 Y148.331 E.00151
; WIPE_START
G1 X128.381 Y148.937 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.063 Y149.334 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.129637
G1 F15000
M204 S6000
G1 X128.936 Y149.248 E.00068
; LINE_WIDTH: 0.170515
G1 X128.808 Y149.163 E.00093
; LINE_WIDTH: 0.214269
G1 X128.652 Y149.04 E.00156
; LINE_WIDTH: 0.227712
G3 X128.064 Y148.38 I2.484 J-2.806 E.00745
; OBJECT_ID: 66
; WIPE_START
G1 X128.432 Y148.829 E-.49874
G1 X128.652 Y149.04 E-.26126
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.88 Y141.447 Z1.9 F42000
G1 X124.493 Y108.145 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X124.882 Y109.075 I-.937 J.937 E.01678
G1 X124.882 Y121.525 E.20216
G3 X123.564 Y122.843 I-1.326 J-.008 E.03356
G1 X111.114 Y122.843 E.20216
G3 X109.796 Y121.525 I.008 J-1.326 E.03356
G1 X109.796 Y109.075 E.20216
G3 X111.114 Y107.757 I1.326 J.008 E.03356
G1 X123.564 Y107.757 E.20216
G3 X124.45 Y108.104 I-.008 J1.326 E.01581
; WIPE_START
M204 S6000
G1 X124.659 Y108.347 E-.12168
G1 X124.781 Y108.577 E-.09901
G1 X124.857 Y108.826 E-.09904
G1 X124.882 Y109.075 E-.09507
G1 X124.882 Y109.984 E-.34521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.4 Y117.601 Z1.9 F42000
G1 X124.054 Y123.072 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X124.049 Y123.073 E.0001
G3 X123.775 Y123.1 I-.27 J-1.333 E.00448
G1 X110.903 Y123.1 E.20901
G3 X109.538 Y121.736 I-.005 J-1.36 E.03483
G1 X109.538 Y108.864 E.20901
G3 X110.903 Y107.5 I1.36 J-.005 E.03483
G1 X123.871 Y107.509 E.21058
G3 X125.139 Y108.864 I-.084 J1.35 E.03321
G1 X125.139 Y121.736 E.20901
G3 X124.302 Y122.996 I-1.36 J.005 E.02604
G1 X124.112 Y123.054 E.00324
; WIPE_START
M204 S6000
G1 X124.049 Y123.073 E-.02503
G1 X123.775 Y123.1 E-.10471
G1 X122.116 Y123.1 E-.63026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.057 Y117.385 Z1.9 F42000
G1 X116.211 Y116.429 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.014 Y116.2 E.00529
G3 X117.297 Y113.703 I1.318 J-.9 E.05987
G1 X117.431 Y113.706 E.00234
G3 X116.251 Y116.474 I-.098 J1.594 E.10661
M204 S10000
G1 X115.884 Y116.703 F42000
G1 F6000
M204 S6000
G1 X115.661 Y116.439 E.00603
G3 X117.292 Y113.274 I1.674 J-1.14 E.07596
G1 X117.456 Y113.278 E.00286
G3 X115.921 Y116.75 I-.121 J2.022 E.13628
M204 S250
G1 X115.568 Y116.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X115.32 Y116.671 E.00627
G3 X117.288 Y112.861 I2.017 J-1.372 E.08508
G1 X117.48 Y112.864 E.00312
G3 X115.631 Y117.042 I-.144 J2.435 E.15276
G1 X115.606 Y117.013 E.00062
; WIPE_START
M204 S6000
G1 X115.32 Y116.671 E-.16954
G1 X115.128 Y116.332 E-.14808
G1 X114.968 Y115.876 E-.18336
G1 X114.901 Y115.397 E-.18396
G1 X114.909 Y115.2 E-.07506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.512 Y114.969 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X117.239 Y114.935 E.00446
G1 X117.06 Y115.043 E.0034
G1 X116.963 Y115.244 E.00362
G1 X117.033 Y115.525 E.00471
G1 X117.21 Y115.657 E.00359
G1 X117.432 Y115.668 E.0036
G1 X117.625 Y115.548 E.0037
G1 X117.715 Y115.348 E.00356
M73 P70 R6
G1 X117.718 Y115.281 E.00107
G1 X117.638 Y115.067 E.00372
G1 X117.559 Y115.005 E.00162
M204 S10000
G1 X117.366 Y115.271 F42000
; LINE_WIDTH: 0.36074
G1 F15000
M204 S6000
G1 X117.303 Y115.308 E.00102
G1 X117.351 Y115.336 E.00077
M204 S10000
G1 X118.074 Y115.549 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X118.116 Y115.259 E.00474
G1 X118.032 Y114.948 E.00523
G1 X117.859 Y114.723 E.00461
G1 X117.679 Y114.599 E.00356
G1 X117.284 Y114.524 E.00652
G1 X117.006 Y114.598 E.00467
G1 X116.766 Y114.774 E.00484
G1 X116.606 Y115.04 E.00505
G1 X116.561 Y115.245 E.0034
G1 X116.638 Y115.638 E.0065
G1 X116.803 Y115.864 E.00454
G1 X117.072 Y116.031 E.00515
G1 X117.38 Y116.076 E.00505
G1 X117.667 Y116.005 E.0048
G1 X117.921 Y115.815 E.00514
G1 X118.044 Y115.601 E.00402
M204 S10000
G1 X118.513 Y115.237 F42000
G1 F15000
M204 S6000
G1 X118.445 Y114.886 E.00582
G1 X118.205 Y114.496 E.00744
G1 X117.827 Y114.225 E.00753
G1 X117.4 Y114.121 E.00714
G1 X116.947 Y114.185 E.00743
G1 X116.545 Y114.425 E.0076
G1 X116.265 Y114.807 E.0077
G1 X116.159 Y115.246 E.00733
G1 X116.219 Y115.676 E.00706
G1 X116.441 Y116.069 E.00733
G1 X116.825 Y116.365 E.00787
G1 X117.259 Y116.479 E.00728
G1 X117.73 Y116.415 E.00771
G1 X118.132 Y116.176 E.0076
G1 X118.405 Y115.809 E.00743
G1 X118.519 Y115.346 E.00774
G1 X118.517 Y115.297 E.0008
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X118.519 Y115.346 E-.01863
G1 X118.405 Y115.809 E-.18123
G1 X118.132 Y116.176 E-.17384
G1 X117.73 Y116.415 E-.17777
G1 X117.259 Y116.479 E-.18045
G1 X117.188 Y116.46 E-.02807
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 16/53
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I.914 J.803 P1  F42000
G1 X124.512 Y108.127 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
M204 S5000
G3 X124.904 Y109.065 I-.946 J.946 E.01694
G1 X124.904 Y121.535 E.20248
G3 X123.573 Y122.865 I-1.338 J-.008 E.03387
G1 X111.104 Y122.865 E.20248
G3 X109.774 Y121.535 I.008 J-1.338 E.03387
G1 X109.774 Y109.065 E.20248
G3 X111.104 Y107.735 I1.338 J.008 E.03387
G1 X123.573 Y107.735 E.20248
G3 X124.468 Y108.086 I-.008 J1.338 E.01596
; WIPE_START
G1 F3600
M204 S6000
G1 X124.678 Y108.33 E-.12257
G1 X124.802 Y108.562 E-.09992
G1 X124.879 Y108.814 E-.09994
G1 X124.904 Y109.065 E-.09597
G1 X124.904 Y109.964 E-.34159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.421 Y117.581 Z2 F42000
G1 X124.072 Y123.1 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1733
M204 S5000
G1 X124.068 Y123.101 E.00006
G3 X123.792 Y123.129 I-.272 J-1.344 E.00452
G1 X110.886 Y123.129 E.20956
G3 X109.51 Y121.753 I-.005 J-1.371 E.03512
G1 X109.51 Y108.847 E.20956
G3 X110.886 Y107.471 I1.371 J-.005 E.03512
G1 X123.895 Y107.482 E.21125
G3 X125.167 Y108.847 I-.091 J1.36 E.03337
G1 X125.167 Y121.753 E.20956
G3 X124.324 Y123.023 I-1.371 J.005 E.02625
G1 X124.129 Y123.083 E.00331
; WIPE_START
G1 F3600
M204 S6000
G1 X124.068 Y123.101 E-.0242
G1 X123.792 Y123.129 E-.10554
G1 X122.133 Y123.129 E-.63026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.078 Y117.41 Z2 F42000
G1 X116.209 Y116.426 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1733
M204 S6000
G1 X116.05 Y116.251 E.00413
G3 X117.297 Y113.703 I1.282 J-.951 E.06097
G1 X117.429 Y113.706 E.0023
G3 X116.248 Y116.471 I-.096 J1.594 E.1067
M204 S10000
G1 X115.886 Y116.707 F42000
G1 F1733
M204 S6000
G1 X115.707 Y116.505 E.00472
G3 X117.292 Y113.274 I1.627 J-1.206 E.07736
G1 X117.454 Y113.277 E.00281
G3 X115.925 Y116.753 I-.12 J2.022 E.13622
M204 S250
G1 X115.575 Y116.978 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
M204 S5000
G1 X115.376 Y116.75 E.00492
G3 X117.288 Y112.861 I1.96 J-1.451 E.08666
G1 X117.478 Y112.864 E.00308
G3 X115.632 Y117.044 I-.142 J2.435 E.15275
G1 X115.614 Y117.023 E.00044
; WIPE_START
G1 F3600
M204 S6000
G1 X115.376 Y116.75 E-.13784
G1 X115.267 Y116.589 E-.07363
G1 X115.091 Y116.249 E-.14565
G1 X114.948 Y115.786 E-.18411
G1 X114.899 Y115.298 E-.18638
G1 X114.907 Y115.213 E-.03239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 16 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer16 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X116.419 Y116.013 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1733
M204 S6000
G1 X116.624 Y116.24 E.00497
G1 X117.036 Y116.442 E.00745
G1 X117.511 Y116.469 E.00773
G1 X117.943 Y116.316 E.00745
G1 X118.294 Y115.996 E.00771
G1 X118.489 Y115.571 E.0076
G2 X118.446 Y114.887 I-1.301 J-.26 E.01125
G1 X118.199 Y114.49 E.00758
G1 X117.825 Y114.224 E.00745
G1 X117.398 Y114.121 E.00713
G1 X116.956 Y114.182 E.00725
G1 X116.546 Y114.424 E.00773
G1 X116.269 Y114.799 E.00757
G1 X116.157 Y115.262 E.00773
G1 X116.234 Y115.721 E.00756
G1 X116.387 Y115.963 E.00464
M204 S10000
G1 X117.37 Y115.27 F42000
; LINE_WIDTH: 0.35664
G1 F1733
M204 S6000
G1 X117.307 Y115.306 E.00099
G1 X117.354 Y115.333 E.00074
M204 S10000
G1 X117.51 Y114.968 F42000
; LINE_WIDTH: 0.41999
G1 F1733
M204 S6000
G1 X117.244 Y114.933 E.00437
G1 X117.056 Y115.048 E.00358
G1 X116.962 Y115.256 E.00371
G1 X116.997 Y115.464 E.00343
G1 X117.216 Y115.659 E.00476
G1 X117.432 Y115.668 E.0035
G1 X117.626 Y115.547 E.00371
G1 X117.715 Y115.35 E.00351
G1 X117.717 Y115.275 E.00121
G1 X117.634 Y115.062 E.00371
G1 X117.558 Y115.004 E.00155
M204 S10000
G1 X117.604 Y114.581 F42000
G1 F1733
M204 S6000
G1 X117.229 Y114.527 E.00616
G1 X116.937 Y114.63 E.00502
G1 X116.71 Y114.836 E.00498
G1 X116.578 Y115.122 E.00512
G1 X116.568 Y115.429 E.00498
G1 X116.665 Y115.691 E.00455
G1 X116.951 Y115.974 E.00653
G1 X117.213 Y116.068 E.00452
G1 X117.528 Y116.055 E.00512
G1 X117.801 Y115.925 E.00491
G1 X118.009 Y115.695 E.00503
G1 X118.11 Y115.403 E.00502
G1 X118.115 Y115.252 E.00246
G1 X118.03 Y114.945 E.00516
G1 X117.832 Y114.698 E.00514
G1 X117.657 Y114.608 E.00318
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X117.832 Y114.698 E-.07448
G1 X118.03 Y114.945 E-.12032
G1 X118.115 Y115.252 E-.1208
G1 X118.11 Y115.403 E-.0575
G1 X118.009 Y115.695 E-.11751
G1 X117.801 Y115.925 E-.11779
G1 X117.528 Y116.055 E-.11493
G1 X117.431 Y116.059 E-.03668
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 17/53
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2 I.908 J.811 P1  F42000
G1 X124.53 Y108.109 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1734
M204 S5000
G3 X124.925 Y109.056 I-.955 J.955 E.01709
G1 X124.925 Y121.545 E.2028
G3 X123.583 Y122.887 I-1.35 J-.008 E.03418
G1 X111.094 Y122.887 E.2028
G3 X109.752 Y121.545 I.008 J-1.35 E.03418
G1 X109.752 Y109.056 E.2028
G3 X111.094 Y107.713 I1.35 J.008 E.03418
G1 X123.583 Y107.713 E.2028
G3 X124.487 Y108.067 I-.008 J1.35 E.01612
; WIPE_START
G1 F3600
M204 S6000
G1 X124.698 Y108.314 E-.12348
G1 X124.823 Y108.548 E-.10084
G1 X124.9 Y108.802 E-.10084
G1 X124.925 Y109.056 E-.09688
G1 X124.925 Y109.945 E-.33796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.442 Y117.562 Z2.1 F42000
G1 X124.089 Y123.129 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F1734
M204 S5000
G1 X124.087 Y123.13 E.00003
G3 X123.809 Y123.157 I-.274 J-1.355 E.00455
G1 X110.869 Y123.157 E.21012
G3 X109.482 Y121.77 I-.005 J-1.383 E.03541
G1 X109.482 Y108.83 E.21012
G3 X110.869 Y107.443 I1.383 J-.005 E.03541
G1 X123.92 Y107.454 E.21192
G3 X125.196 Y108.83 I-.098 J1.371 E.03354
G1 X125.196 Y121.77 E.21012
G3 X124.345 Y123.051 I-1.383 J.005 E.02647
G1 X124.146 Y123.111 E.00338
; WIPE_START
G1 F3600
M204 S6000
G1 X124.087 Y123.13 E-.02348
G1 X123.809 Y123.157 E-.10639
G1 X122.15 Y123.157 E-.63014
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.102 Y117.433 Z2.1 F42000
G1 X116.207 Y116.418 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1734
M204 S6000
G1 X116.046 Y116.246 E.00412
G3 X117.297 Y113.703 I1.286 J-.947 E.06088
G1 X117.426 Y113.705 E.00226
G3 X116.264 Y116.487 I-.095 J1.594 E.10632
G1 X116.246 Y116.464 E.00052
M204 S10000
G1 X115.89 Y116.703 F42000
G1 F1734
M204 S6000
G1 X115.702 Y116.499 E.00485
G3 X117.292 Y113.274 I1.631 J-1.2 E.07725
G1 X117.451 Y113.277 E.00278
G3 X115.978 Y116.804 I-.118 J2.022 E.13496
G1 X115.93 Y116.749 E.00127
M204 S250
G1 X115.599 Y117.005 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1734
M204 S5000
G1 X115.499 Y116.903 E.00232
G3 X117.288 Y112.861 I1.837 J-1.604 E.08987
M73 P71 R6
G1 X117.475 Y112.864 E.00304
G3 X115.701 Y117.109 I-.14 J2.435 E.15122
G1 X115.641 Y117.048 E.00139
; WIPE_START
G1 F3600
M204 S6000
G1 X115.499 Y116.903 E-.07718
G1 X115.371 Y116.743 E-.07799
G1 X115.128 Y116.332 E-.18145
G1 X114.968 Y115.876 E-.18343
G1 X114.93 Y115.687 E-.07354
G1 X114.899 Y115.307 E-.14479
G1 X114.904 Y115.25 E-.02162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 17 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer17 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X116.214 Y115.601 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1734
M204 S6000
G1 X116.32 Y115.898 E.00512
G1 X116.616 Y116.235 E.00729
G1 X117.037 Y116.443 E.00762
G1 X117.503 Y116.47 E.00757
G1 X117.944 Y116.316 E.00759
G1 X118.284 Y116.009 E.00744
G1 X118.451 Y115.681 E.00598
G1 X118.519 Y115.346 E.00555
G2 X118.448 Y114.893 I-1.739 J.041 E.00746
G1 X118.199 Y114.49 E.00771
G1 X117.825 Y114.224 E.00745
G1 X117.397 Y114.121 E.00715
G1 X116.948 Y114.185 E.00736
G1 X116.545 Y114.424 E.00761
G1 X116.264 Y114.807 E.00771
G1 X116.157 Y115.261 E.00757
G1 X116.205 Y115.542 E.00463
M204 S10000
G1 X117.368 Y115.271 F42000
; LINE_WIDTH: 0.35918
G1 F1734
M204 S6000
G1 X117.304 Y115.307 E.00101
G1 X117.352 Y115.335 E.00076
M204 S10000
G1 X117.516 Y114.969 F42000
; LINE_WIDTH: 0.41999
G1 F1734
M204 S6000
G1 X117.239 Y114.934 E.00452
G1 X117.06 Y115.043 E.0034
G1 X116.964 Y115.24 E.00356
G1 X117.033 Y115.524 E.00476
G1 X117.212 Y115.657 E.00362
G1 X117.43 Y115.668 E.00354
G1 X117.618 Y115.556 E.00355
G1 X117.715 Y115.348 E.00373
G1 X117.717 Y115.278 E.00114
G1 X117.644 Y115.076 E.00349
G1 X117.562 Y115.008 E.00174
M204 S10000
G1 X117.855 Y114.719 F42000
G1 F1734
M204 S6000
G1 X117.678 Y114.598 E.00348
G1 X117.283 Y114.524 E.00652
G1 X117.006 Y114.598 E.00466
G1 X116.766 Y114.774 E.00483
G1 X116.6 Y115.056 E.00532
G1 X116.561 Y115.326 E.00442
G1 X116.677 Y115.711 E.00653
G1 X116.86 Y115.918 E.00449
G1 X117.14 Y116.056 E.00507
G1 X117.448 Y116.073 E.005
G1 X117.739 Y115.971 E.00501
G1 X117.963 Y115.77 E.0049
G1 X118.099 Y115.478 E.00523
M73 P71 R5
G1 X118.115 Y115.256 E.00362
G1 X118.038 Y114.96 E.00496
G1 X117.891 Y114.767 E.00394
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X118.038 Y114.96 E-.09227
G1 X118.115 Y115.256 E-.11616
G1 X118.099 Y115.478 E-.08461
G1 X117.963 Y115.77 E-.12229
G1 X117.739 Y115.971 E-.11465
G1 X117.448 Y116.073 E-.11719
G1 X117.151 Y116.056 E-.11283
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 18/53
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I.892 J.828 P1  F42000
G1 X124.548 Y108.09 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G3 X124.947 Y109.046 I-.963 J.963 E.01725
G1 X124.947 Y121.554 E.20311
G3 X123.593 Y122.909 I-1.362 J-.008 E.0345
G1 X111.084 Y122.909 E.20311
G3 X109.73 Y121.554 I.008 J-1.362 E.0345
G1 X109.73 Y109.046 E.20311
G3 X111.084 Y107.691 I1.362 J.008 E.0345
G1 X123.593 Y107.691 E.20311
G3 X124.505 Y108.049 I-.008 J1.362 E.01627
; WIPE_START
G1 F3600
M204 S6000
G1 X124.718 Y108.297 E-.1244
G1 X124.844 Y108.533 E-.10174
G1 X124.922 Y108.79 E-.10175
G1 X124.947 Y109.046 E-.09779
G1 X124.947 Y109.926 E-.33432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.463 Y117.543 Z2.2 F42000
G1 X124.106 Y123.158 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1738
M204 S5000
G3 X123.826 Y123.185 I-.276 J-1.366 E.00459
G1 X110.852 Y123.185 E.21067
G3 X109.453 Y121.787 I-.005 J-1.394 E.0357
G1 X109.453 Y108.813 E.21067
G3 X110.852 Y107.415 I1.394 J-.005 E.0357
G1 X123.944 Y107.426 E.21259
G3 X125.224 Y108.813 I-.106 J1.381 E.03371
G1 X125.224 Y121.787 E.21067
G3 X124.165 Y123.145 I-1.394 J.005 E.03014
; WIPE_START
G1 F3600
M204 S6000
G1 X123.826 Y123.185 E-.12987
G1 X122.167 Y123.185 E-.63013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.12 Y117.46 Z2.2 F42000
G1 X116.196 Y116.413 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1738
M204 S6000
G1 X116.166 Y116.391 E.00066
G3 X117.297 Y113.703 I1.165 J-1.091 E.06418
G1 X117.424 Y113.705 E.00223
G3 X116.362 Y116.568 I-.094 J1.594 E.10412
G1 X116.24 Y116.454 E.00292
M204 S10000
G1 X115.909 Y116.73 F42000
G1 F1738
M204 S6000
G1 X115.858 Y116.687 E.00117
G3 X117.292 Y113.274 I1.475 J-1.388 E.08153
G1 X117.449 Y113.277 E.00273
G3 X116.102 Y116.907 I-.116 J2.022 E.13217
G1 X115.953 Y116.771 E.00352
M204 S250
G1 X115.61 Y117.019 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G1 X115.56 Y116.972 E.0011
G3 X117.288 Y112.861 I1.774 J-1.673 E.09139
G1 X117.473 Y112.864 E.003
G3 X115.701 Y117.109 I-.138 J2.435 E.15125
G1 X115.652 Y117.061 E.00111
; WIPE_START
G1 F3600
M204 S6000
G1 X115.56 Y116.972 E-.04853
G1 X115.267 Y116.589 E-.18329
G1 X115.053 Y116.155 E-.18402
G1 X114.93 Y115.689 E-.18309
G1 X114.899 Y115.298 E-.14906
G1 X114.902 Y115.267 E-.012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 18 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer18 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X118.513 Y115.236 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1738
M204 S6000
G1 X118.445 Y114.885 E.0058
G1 X118.199 Y114.49 E.00754
G1 X117.825 Y114.224 E.00745
G1 X117.395 Y114.121 E.00719
G1 X116.956 Y114.182 E.00719
G1 X116.545 Y114.424 E.00775
G1 X116.264 Y114.807 E.00771
G1 X116.157 Y115.262 E.00759
G1 X116.231 Y115.713 E.00742
G1 X116.469 Y116.099 E.00736
G1 X116.823 Y116.363 E.00717
M73 P72 R5
G1 X117.268 Y116.479 E.00747
G1 X117.729 Y116.415 E.00755
G1 X118.131 Y116.176 E.0076
G1 X118.413 Y115.793 E.00772
G1 X118.519 Y115.346 E.00746
G1 X118.517 Y115.295 E.00082
M204 S10000
G1 X117.512 Y114.969 F42000
G1 F1738
M204 S6000
G1 X117.243 Y114.933 E.00439
G1 X117.06 Y115.043 E.00347
G1 X116.962 Y115.254 E.00378
G1 X116.993 Y115.456 E.00332
G1 X117.208 Y115.655 E.00475
G1 X117.431 Y115.668 E.00363
G1 X117.619 Y115.554 E.00357
G1 X117.715 Y115.349 E.00367
G1 X117.717 Y115.281 E.00111
G1 X117.644 Y115.077 E.00351
G1 X117.558 Y115.006 E.00181
M204 S10000
G1 X117.371 Y115.27 F42000
; LINE_WIDTH: 0.35422
G1 F1738
M204 S6000
G1 X117.308 Y115.306 E.00098
G1 X117.355 Y115.333 E.00073
M204 S10000
G1 X116.81 Y115.857 F42000
; LINE_WIDTH: 0.41999
G1 F1738
M204 S6000
G1 X117.139 Y116.055 E.00623
G1 X117.453 Y116.073 E.00511
G1 X117.738 Y115.971 E.00492
G1 X117.966 Y115.765 E.005
G1 X118.1 Y115.478 E.00513
G1 X118.115 Y115.258 E.00358
G1 X118.038 Y114.96 E.005
G1 X117.857 Y114.72 E.00488
G1 X117.678 Y114.599 E.00351
G1 X117.281 Y114.524 E.00655
G1 X117.006 Y114.598 E.00462
G1 X116.766 Y114.774 E.00484
G1 X116.602 Y115.05 E.00522
G1 X116.563 Y115.36 E.00507
G1 X116.654 Y115.669 E.00522
G1 X116.772 Y115.81 E.00299
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X116.654 Y115.669 E-.06986
G1 X116.563 Y115.36 E-.12226
G1 X116.602 Y115.05 E-.11871
G1 X116.766 Y114.774 E-.12213
G1 X117.006 Y114.598 E-.1132
G1 X117.281 Y114.524 E-.10823
G1 X117.554 Y114.575 E-.1056
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 19/53
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I.828 J.892 P1  F42000
G1 X124.567 Y108.072 Z2.2
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1740
M204 S5000
G3 X124.969 Y109.036 I-.972 J.972 E.0174
G1 X124.969 Y121.564 E.20343
G3 X123.603 Y122.931 I-1.375 J-.008 E.03481
G1 X111.075 Y122.931 E.20343
G3 X109.708 Y121.564 I.008 J-1.375 E.03481
G1 X109.708 Y109.036 E.20343
G3 X111.075 Y107.669 I1.375 J.008 E.03481
G1 X123.603 Y107.669 E.20343
G3 X124.523 Y108.03 I-.008 J1.375 E.01643
; WIPE_START
G1 F3600
M204 S6000
G1 X124.738 Y108.281 E-.12533
G1 X124.865 Y108.519 E-.10264
G1 X124.944 Y108.778 E-.10267
G1 X124.969 Y109.036 E-.0987
G1 X124.969 Y109.906 E-.33067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.484 Y117.523 Z2.3 F42000
G1 X124.124 Y123.186 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F1740
M204 S5000
G1 X123.843 Y123.214 E.00459
G1 X110.835 Y123.214 E.21122
G3 X109.425 Y121.804 I-.005 J-1.405 E.03599
G1 X109.425 Y108.796 E.21122
G3 X110.835 Y107.386 I1.405 J-.005 E.03599
G1 X123.842 Y107.386 E.21122
G1 X123.968 Y107.399 E.00205
G3 X125.252 Y108.796 I-.113 J1.392 E.03388
G1 X125.252 Y121.804 E.21122
G3 X124.182 Y123.173 I-1.405 J.005 E.03042
; WIPE_START
G1 F3600
M204 S6000
G1 X123.843 Y123.214 E-.13004
G1 X122.185 Y123.214 E-.62996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.14 Y117.486 Z2.3 F42000
G1 X116.196 Y116.413 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1740
M204 S6000
G1 X116.176 Y116.396 E.00045
G3 X117.297 Y113.703 I1.159 J-1.097 E.06423
G1 X117.433 Y113.705 E.00237
G3 X116.363 Y116.564 I-.097 J1.593 E.10412
G1 X116.24 Y116.453 E.00288
M204 S10000
G1 X115.909 Y116.731 F42000
G1 F1740
M204 S6000
G1 X115.869 Y116.694 E.00096
G3 X117.293 Y113.274 I1.467 J-1.395 E.08166
G1 X117.453 Y113.277 E.0028
G3 X116.102 Y116.904 I-.118 J2.021 E.13215
G1 X115.954 Y116.771 E.00348
M204 S250
G1 X115.633 Y117.037 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1740
M204 S5000
G1 X115.572 Y116.981 E.00135
G3 X117.288 Y112.861 I1.764 J-1.683 E.09158
G1 X117.472 Y112.864 E.00299
G3 X115.851 Y117.232 I-.137 J2.434 E.14805
G1 X115.678 Y117.077 E.00377
; WIPE_START
G1 F3600
M204 S6000
G1 X115.572 Y116.981 E-.05449
G1 X115.32 Y116.671 E-.15161
G1 X115.09 Y116.247 E-.1835
G1 X114.968 Y115.876 E-.14814
G1 X114.93 Y115.687 E-.07336
G1 X114.899 Y115.298 E-.14828
G1 X114.899 Y115.296 E-.00062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 19 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer19 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X116.214 Y115.602 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1740
M204 S6000
G1 X116.391 Y115.996 E.00702
G1 X116.617 Y116.235 E.00534
G1 X117.037 Y116.442 E.0076
G1 X117.511 Y116.469 E.00772
G1 X117.944 Y116.315 E.00747
G1 X118.289 Y116.003 E.00756
G1 X118.489 Y115.57 E.00774
G1 X118.513 Y115.235 E.00545
G1 X118.445 Y114.885 E.00579
G1 X118.199 Y114.49 E.00755
G1 X117.817 Y114.22 E.00761
G1 X117.402 Y114.121 E.00692
G1 X116.957 Y114.182 E.00731
G1 X116.545 Y114.424 E.00776
G1 X116.265 Y114.807 E.0077
G1 X116.157 Y115.263 E.00761
G1 X116.204 Y115.542 E.0046
M204 S10000
G1 X117.367 Y115.269 F42000
; LINE_WIDTH: 0.3607
G1 F1740
M204 S6000
G1 X117.304 Y115.306 E.00102
G1 X117.352 Y115.334 E.00077
M204 S10000
G1 X117.502 Y114.964 F42000
; LINE_WIDTH: 0.41999
G1 F1740
M204 S6000
G1 X117.245 Y114.932 E.00422
G1 X117.06 Y115.043 E.00349
G1 X116.964 Y115.241 E.00358
G1 X117.031 Y115.522 E.00469
G1 X117.209 Y115.656 E.00362
G1 X117.431 Y115.668 E.00361
G1 X117.619 Y115.555 E.00356
G1 X117.715 Y115.349 E.00368
G1 X117.717 Y115.281 E.00112
G1 X117.635 Y115.064 E.00376
G1 X117.55 Y115 E.00173
M204 S10000
G1 X117.856 Y114.72 F42000
G1 F1740
M204 S6000
G1 X117.67 Y114.594 E.00364
G1 X117.285 Y114.524 E.00636
G1 X117.007 Y114.597 E.00466
G1 X116.766 Y114.774 E.00485
G1 X116.6 Y115.057 E.00534
G1 X116.561 Y115.328 E.00444
G1 X116.674 Y115.706 E.00641
G1 X116.862 Y115.918 E.0046
G1 X117.139 Y116.055 E.00502
G1 X117.454 Y116.073 E.00513
G1 X117.741 Y115.97 E.00494
G1 X117.967 Y115.764 E.00497
G1 X118.1 Y115.478 E.00512
G1 X118.115 Y115.258 E.00358
G1 X118.035 Y114.954 E.00511
G1 X117.892 Y114.768 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X118.035 Y114.954 E-.08909
M73 P73 R5
G1 X118.115 Y115.258 E-.11959
G1 X118.1 Y115.478 E-.08389
G1 X117.967 Y115.764 E-.1199
G1 X117.741 Y115.97 E-.11632
G1 X117.454 Y116.073 E-.11557
G1 X117.15 Y116.056 E-.11564
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 20/53
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I.892 J.828 P1  F42000
G1 X124.585 Y108.053 Z2.3
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1745
M204 S5000
G3 X124.991 Y109.026 I-.981 J.981 E.01756
G1 X124.991 Y121.574 E.20375
G3 X123.612 Y122.953 I-1.387 J-.008 E.03512
G1 X111.065 Y122.953 E.20375
G3 X109.686 Y121.574 I.008 J-1.387 E.03512
G1 X109.686 Y109.026 E.20375
G3 X111.065 Y107.647 I1.387 J.008 E.03512
G1 X123.612 Y107.647 E.20375
G3 X124.542 Y108.012 I-.008 J1.387 E.01659
; WIPE_START
G1 F3600
M204 S6000
G1 X124.758 Y108.264 E-.12622
G1 X124.887 Y108.505 E-.10355
G1 X124.966 Y108.765 E-.10357
G1 X124.991 Y109.026 E-.09961
G1 X124.991 Y109.887 E-.32705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.506 Y117.504 Z2.4 F42000
G1 X124.141 Y123.214 Z2.4
G1 Z2
G1 E.8 F1800
G1 F1745
M204 S5000
G1 X123.859 Y123.242 E.0046
G1 X110.818 Y123.242 E.21177
G3 X109.397 Y121.821 I-.004 J-1.417 E.03628
G1 X109.397 Y108.779 E.21177
G3 X110.818 Y107.358 I1.417 J-.004 E.03628
G1 X123.859 Y107.358 E.21177
G1 X123.993 Y107.371 E.00217
G3 X125.281 Y108.779 I-.12 J1.403 E.03404
G1 X125.281 Y121.821 E.21177
G3 X124.2 Y123.202 I-1.417 J.004 E.0307
; WIPE_START
G1 F3600
M204 S6000
G1 X123.859 Y123.242 E-.13024
G1 X122.202 Y123.242 E-.62976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.162 Y117.511 Z2.4 F42000
G1 X116.198 Y116.415 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1745
M204 S6000
G1 X116.177 Y116.394 E.00053
G3 X117.297 Y113.703 I1.158 J-1.097 E.06419
G1 X117.431 Y113.705 E.00233
G3 X116.368 Y116.565 I-.096 J1.592 E.10394
G1 X116.243 Y116.455 E.0029
M204 S10000
G1 X115.912 Y116.733 F42000
G1 F1745
M204 S6000
G1 X115.866 Y116.687 E.00113
G3 X117.293 Y113.274 I1.469 J-1.39 E.08151
G1 X117.451 Y113.277 E.00276
G3 X116.112 Y116.908 I-.116 J2.019 E.13187
G1 X115.957 Y116.772 E.00359
M204 S250
G1 X115.637 Y117.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1745
M204 S5000
G1 X115.566 Y116.97 E.00161
G3 X117.288 Y112.861 I1.769 J-1.674 E.09135
G1 X117.47 Y112.864 E.00295
G3 X115.864 Y117.238 I-.135 J2.432 E.14771
G1 X115.682 Y117.079 E.00393
; WIPE_START
G1 F3600
M204 S6000
G1 X115.566 Y116.97 E-.06056
G1 X115.266 Y116.588 E-.18466
G1 X115.053 Y116.155 E-.18317
G1 X114.93 Y115.687 E-.18407
G1 X114.899 Y115.3 E-.14753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 20 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer20 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X118.512 Y115.221 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1745
M204 S6000
G1 X118.449 Y114.894 E.00541
G1 X118.194 Y114.485 E.00782
G1 X117.834 Y114.228 E.00719
G1 X117.401 Y114.121 E.00725
G1 X116.947 Y114.185 E.00744
G1 X116.546 Y114.424 E.00759
G1 X116.264 Y114.808 E.00774
G1 X116.157 Y115.253 E.00743
G1 X116.232 Y115.715 E.00759
G1 X116.475 Y116.105 E.00747
G1 X116.832 Y116.367 E.00718
G1 X117.268 Y116.48 E.00731
G1 X117.729 Y116.415 E.00757
G1 X118.131 Y116.177 E.00758
G1 X118.413 Y115.793 E.00775
G1 X118.519 Y115.356 E.0073
G1 X118.515 Y115.281 E.00121
M204 S10000
G1 X117.525 Y114.972 F42000
G1 F1745
M204 S6000
G1 X117.239 Y114.934 E.00468
G1 X117.057 Y115.047 E.00348
G1 X116.963 Y115.251 E.00365
G1 X116.994 Y115.459 E.00341
G1 X117.212 Y115.658 E.00479
G1 X117.43 Y115.668 E.00354
G1 X117.622 Y115.552 E.00364
G1 X117.714 Y115.357 E.0035
G1 X117.716 Y115.267 E.00146
G1 X117.644 Y115.077 E.0033
G1 X117.57 Y115.012 E.0016
M204 S10000
G1 X117.372 Y115.27 F42000
; LINE_WIDTH: 0.35402
G1 F1745
M204 S6000
G1 X117.309 Y115.306 E.00098
G1 X117.356 Y115.333 E.00073
M204 S10000
G1 X117.68 Y115.998 F42000
; LINE_WIDTH: 0.41999
G1 F1745
M204 S6000
G1 X117.918 Y115.818 E.00484
G1 X118.074 Y115.554 E.00499
G1 X118.114 Y115.244 E.00506
G1 X118.039 Y114.962 E.00475
G1 X117.852 Y114.716 E.00501
G1 X117.685 Y114.601 E.00329
G1 X117.279 Y114.525 E.00671
G1 X117.004 Y114.598 E.00462
G1 X116.761 Y114.78 E.00493
G1 X116.603 Y115.046 E.00502
G1 X116.563 Y115.352 E.00502
G1 X116.646 Y115.654 E.00508
G1 X116.757 Y115.818 E.00321
G1 X117.093 Y116.038 E.00653
G1 X117.375 Y116.076 E.00462
G1 X117.622 Y116.013 E.00415
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X117.375 Y116.076 E-.09714
G1 X117.093 Y116.038 E-.10806
G1 X116.757 Y115.818 E-.1529
G1 X116.646 Y115.654 E-.07502
G1 X116.563 Y115.352 E-.11898
G1 X116.603 Y115.046 E-.11748
G1 X116.725 Y114.841 E-.09043
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 21/53
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.796 J.921 P1  F42000
G1 X124.604 Y108.035 Z2.4
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1880
M204 S5000
G3 X125.013 Y109.016 I-.989 J.989 E.01771
G1 X125.013 Y121.584 E.20406
G3 X123.622 Y122.975 I-1.399 J-.008 E.03543
G1 X111.055 Y122.975 E.20406
G3 X109.664 Y121.584 I.008 J-1.399 E.03543
G1 X109.664 Y109.016 E.20406
G3 X111.055 Y107.625 I1.399 J.008 E.03543
G1 X123.622 Y107.625 E.20406
G3 X124.56 Y107.994 I-.008 J1.399 E.01674
; WIPE_START
G1 F3600
M204 S6000
G1 X124.778 Y108.248 E-.12714
G1 X124.908 Y108.49 E-.10445
G1 X124.987 Y108.753 E-.10448
G1 X125.013 Y109.016 E-.10051
G1 X125.013 Y109.868 E-.32341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.527 Y117.485 Z2.5 F42000
G1 X124.159 Y123.242 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F1880
M204 S5000
G1 X123.876 Y123.27 E.00461
G1 X110.801 Y123.27 E.21232
G3 X109.368 Y121.838 I-.005 J-1.428 E.03657
G1 X109.368 Y108.762 E.21232
G3 X110.801 Y107.33 I1.428 J-.005 E.03657
G1 X123.876 Y107.33 E.21232
G1 X124.017 Y107.344 E.00229
G3 X125.309 Y108.762 I-.127 J1.413 E.03421
G1 X125.309 Y121.838 E.21232
G3 X124.218 Y123.23 I-1.428 J.005 E.03097
; WIPE_START
G1 F3600
M204 S6000
G1 X123.876 Y123.27 E-.13059
G1 X122.22 Y123.27 E-.62941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.676 Y118.024 Z2.5 F42000
G1 X115.581 Y116.988 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F1880
M204 S5000
G1 X115.435 Y116.826 E.00353
G3 X117.288 Y112.861 I1.899 J-1.528 E.08825
G1 X117.467 Y112.864 E.00291
G3 X115.632 Y117.043 I-.133 J2.434 E.15278
G1 X115.622 Y117.032 E.00025
; WIPE_START
G1 F3600
M204 S6000
G1 X115.435 Y116.826 E-.10547
G1 X115.267 Y116.589 E-.11036
G1 X115.088 Y116.243 E-.1481
G1 X114.946 Y115.78 E-.18407
G1 X114.899 Y115.298 E-.18404
G1 X114.903 Y115.225 E-.02796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 21 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer21 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X119.409 Y114.834 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1880
M204 S2000
G1 X117.805 Y113.23 E.03684
G1 X117.241 Y113.23
G1 X119.409 Y115.398 E.04978
G1 X119.446 Y115.998
G1 X116.64 Y113.192 E.06444
G1 X116.249 Y113.365
G1 X119.273 Y116.389 E.06944
G1 X119.042 Y116.722
G1 X115.916 Y113.595 E.0718
G1 X115.635 Y113.878
G1 X118.762 Y117.005 E.0718
G1 X118.427 Y117.234
G1 X115.405 Y114.212 E.06939
G1 X115.231 Y114.602
G1 X118.037 Y117.408 E.06443
G1 X117.436 Y117.37
G1 X115.268 Y115.203 E.04978
G1 X115.268 Y115.766
G1 X116.873 Y117.37 E.03684
; WIPE_START
G1 F3000
M204 S6000
G1 X115.458 Y115.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.427 Y114.545 Z2.5 F42000
M73 P74 R5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0694856
G1 F1880
M204 S6000
G1 X119.415 Y114.524 E.00005
; LINE_WIDTH: 0.086872
G1 X119.365 Y114.45 E.00024
; LINE_WIDTH: 0.121247
G1 X119.315 Y114.376 E.00036
; LINE_WIDTH: 0.152202
G1 X119.262 Y114.303 E.00048
; LINE_WIDTH: 0.191012
G2 X119.159 Y114.167 I-2.324 J1.644 E.00118
; LINE_WIDTH: 0.23661
G2 X118.995 Y113.972 I-3.354 J2.666 E.00224
; LINE_WIDTH: 0.260308
G2 X118.571 Y113.561 I-3.768 J3.459 E.00575
; LINE_WIDTH: 0.220512
G1 X118.435 Y113.451 E.00142
; LINE_WIDTH: 0.189165
G1 X118.359 Y113.393 E.00066
; LINE_WIDTH: 0.162736
G1 X118.229 Y113.3 E.00092
; LINE_WIDTH: 0.136165
G1 X118.1 Y113.208 E.00074
; WIPE_START
G1 F15000
G1 X118.229 Y113.3 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.579 Y117.391 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.134735
G1 F1880
M204 S6000
G1 X116.381 Y117.253 E.00111
; LINE_WIDTH: 0.165112
G1 X116.308 Y117.199 E.00053
; LINE_WIDTH: 0.201177
G3 X116.176 Y117.097 I1.631 J-2.261 E.00122
; LINE_WIDTH: 0.255766
G3 X115.63 Y116.569 I3.014 J-3.66 E.00726
; LINE_WIDTH: 0.22976
G1 X115.518 Y116.433 E.00149
; LINE_WIDTH: 0.190025
G1 X115.413 Y116.296 E.00119
; LINE_WIDTH: 0.15124
G1 X115.33 Y116.177 E.00077
; LINE_WIDTH: 0.120045
G1 X115.246 Y116.058 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X115.33 Y116.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 22/53
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I.803 J.914 P1  F42000
G1 X124.622 Y108.017 Z2.5
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1669
M204 S5000
G3 X125.035 Y109.007 I-.998 J.998 E.01787
G1 X125.035 Y121.593 E.20438
G3 X123.632 Y122.997 I-1.411 J-.008 E.03574
G1 X111.045 Y122.997 E.20438
G3 X109.642 Y121.593 I.008 J-1.411 E.03574
G1 X109.642 Y109.007 E.20438
G3 X111.045 Y107.603 I1.411 J.008 E.03574
G1 X123.632 Y107.603 E.20438
G3 X124.579 Y107.975 I-.008 J1.411 E.0169
; WIPE_START
G1 F3600
M204 S6000
G1 X124.798 Y108.231 E-.12804
G1 X124.929 Y108.476 E-.10536
G1 X125.009 Y108.741 E-.10539
G1 X125.035 Y109.007 E-.10142
G1 X125.035 Y109.848 E-.31979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.548 Y117.465 Z2.6 F42000
G1 X124.177 Y123.271 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X123.893 Y123.299 E.00463
G1 X110.784 Y123.299 E.21287
G3 X109.34 Y121.855 I-.004 J-1.439 E.03686
G1 X109.34 Y108.745 E.21287
G3 X110.784 Y107.302 I1.439 J-.004 E.03686
G1 X123.893 Y107.302 E.21287
G1 X124.041 Y107.316 E.00241
G3 X125.337 Y108.745 I-.134 J1.424 E.03438
G1 X125.337 Y121.855 E.21287
G3 X124.236 Y123.258 I-1.439 J.004 E.03124
; WIPE_START
G1 F3600
M204 S6000
G1 X123.893 Y123.299 E-.13109
G1 X122.238 Y123.299 E-.62892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.076 Y116.901 Z2.6 F42000
G1 X116.469 Y114.43 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.021 I2.306 J.896 E.03329
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53541
G1 X115.267 Y114.012 E-.17705
G1 X115.343 Y113.913 E-.04754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X117.465 Y112.864 I.811 J2.319 E.01544
G3 X118.151 Y113 I-.212 J2.862 E.01139
G1 X116.589 Y112.998 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16123
G1 X117.465 Y112.864 E-.17752
G1 X117.87 Y112.919 E-.1555
G1 X118.151 Y113 E-.11102
G1 X117.744 Y113 E-.15473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X118.209 Y113.021 E.02288
G1 X118.239 Y113.032 E.00053
G3 X119.618 Y114.43 I-.938 J2.304 E.03277
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.021 E-.53585
G1 X118.239 Y113.032 E-.01241
G1 X118.67 Y113.256 E-.18447
G1 X118.726 Y113.301 E-.02728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X119.639 Y116.111 I-2.386 J-.485 E.00552
G1 X119.639 Y114.487 E.02637
G1 X119.656 Y114.535 E.00083
G3 X119.741 Y115.725 I-2.312 J.763 E.01956
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.15174
G1 X119.639 Y114.51 E-.60826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X119.616 Y116.17 E.02286
G1 X119.588 Y116.246 E.00133
G3 X118.209 Y117.579 I-2.268 J-.967 E.03198
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53541
G1 X119.588 Y116.246 E-.03105
G1 X119.356 Y116.672 E-.18421
G1 X119.34 Y116.691 E-.00933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X118.149 Y117.601 E.02638
G3 X116.582 Y117.619 I-.81 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.149 Y117.601 E-.59569
G1 X117.869 Y117.682 E-.11077
G1 X117.729 Y117.698 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.859 J-2.267 E.03331
G1 X116.409 Y116.17 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.261 Y117.489 E-.08564
G1 X116.025 Y117.356 E-.10326
G1 X115.948 Y117.302 E-.03572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.816 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F1669
M204 S5000
G3 X115.039 Y114.489 I2.377 J.484 E.00552
G1 X115.039 Y116.111 E.02633
G3 X114.937 Y114.875 I2.287 J-.811 E.02036
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.1517
G1 X115.039 Y116.09 E-.6083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 22 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer22 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 23/53
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.64 Y107.998 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
M73 P75 R5
G3 X125.057 Y108.997 I-1.006 J1.006 E.01803
G1 X125.057 Y121.603 E.2047
G3 X123.642 Y123.019 I-1.423 J-.008 E.03605
G1 X111.036 Y123.019 E.2047
G3 X109.62 Y121.603 I.008 J-1.423 E.03605
G1 X109.62 Y108.997 E.2047
G3 X111.036 Y107.581 I1.423 J.008 E.03605
G1 X123.642 Y107.581 E.2047
G3 X124.597 Y107.957 I-.008 J1.423 E.01705
; WIPE_START
G1 F3600
M204 S6000
G1 X124.818 Y108.215 E-.12896
G1 X124.95 Y108.461 E-.10627
G1 X125.031 Y108.729 E-.1063
G1 X125.057 Y108.997 E-.10233
G1 X125.057 Y109.829 E-.31614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.57 Y117.446 Z2.7 F42000
G1 X124.196 Y123.299 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X123.91 Y123.327 E.00466
G1 X110.767 Y123.327 E.21343
G3 X109.312 Y121.872 I-.004 J-1.45 E.03714
G1 X109.312 Y108.728 E.21343
G3 X110.767 Y107.273 I1.45 J-.004 E.03714
G1 X123.91 Y107.273 E.21343
G1 X124.066 Y107.289 E.00253
G3 X125.365 Y108.728 I-.142 J1.434 E.03455
G1 X125.365 Y121.872 E.21343
G3 X124.255 Y123.286 I-1.45 J.004 E.0315
; WIPE_START
G1 F3600
M204 S6000
G1 X123.91 Y123.327 E-.13169
G1 X122.257 Y123.327 E-.62831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.095 Y116.929 Z2.7 F42000
G1 X116.469 Y114.43 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X115.061 Y114.43 E.02285
G3 X116.469 Y113.021 I2.276 J.866 E.03332
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53532
G1 X115.17 Y114.181 E-.10328
G1 X115.32 Y113.929 E-.11159
G1 X115.337 Y113.909 E-.00981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.528 Y112.999 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X117.462 Y112.864 I.88 J2.784 E.0154
G3 X118.151 Y113 I-.208 J2.854 E.01143
G1 X116.588 Y112.999 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16262
G1 X117.462 Y112.864 E-.17576
G1 X117.87 Y112.919 E-.15644
G1 X118.151 Y113 E-.11097
G1 X117.745 Y113 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X118.209 Y113.021 E.02288
G1 X118.239 Y113.032 E.00053
G3 X119.617 Y114.43 I-.916 J2.281 E.03278
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.021 E-.53584
G1 X118.239 Y113.032 E-.01246
G1 X118.483 Y113.145 E-.10196
G1 X118.729 Y113.297 E-.10974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X119.639 Y116.11 I-2.382 J-.486 E.0055
G1 X119.639 Y114.49 E.0263
G1 X119.685 Y114.63 E.00238
G3 X119.741 Y115.725 I-2.337 J.668 E.01796
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.11 E-.15138
G1 X119.639 Y114.508 E-.60862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.548 Y116.336 E.00292
G3 X118.209 Y117.579 I-2.244 J-1.074 E.03039
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.548 Y116.336 E-.06826
G1 X119.338 Y116.688 E-.1559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59511
G1 X117.771 Y117.701 E-.14796
G1 X117.727 Y117.706 E-.01693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.892 J-2.3 E.03328
G1 X116.409 Y116.17 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53546
G1 X116.262 Y117.49 E-.08523
G1 X116.01 Y117.347 E-.11023
G1 X115.95 Y117.299 E-.02908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.95 Y114.817 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F1717
M204 S5000
G3 X115.039 Y114.49 I2.434 J.484 E.0055
G1 X115.039 Y116.111 E.02631
G3 X114.939 Y114.876 I2.345 J-.81 E.02034
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.49 E-.15123
G1 X115.039 Y116.092 E-.60877
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 23 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer23 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 24/53
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.659 Y107.98 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X125.079 Y108.987 I-1.015 J1.015 E.01818
G1 X125.079 Y121.613 E.20501
G3 X123.651 Y123.041 I-1.436 J-.008 E.03636
G1 X111.026 Y123.041 E.20501
G3 X109.598 Y121.613 I.008 J-1.436 E.03636
G1 X109.598 Y108.987 E.20501
G3 X111.026 Y107.56 I1.436 J.008 E.03636
G1 X123.651 Y107.56 E.20501
G3 X124.615 Y107.939 I-.008 J1.436 E.01721
; WIPE_START
G1 F3600
M204 S6000
G1 X124.838 Y108.198 E-.12985
G1 X124.971 Y108.447 E-.10719
G1 X125.053 Y108.717 E-.1072
G1 X125.079 Y108.987 E-.10324
G1 X125.079 Y109.81 E-.31252
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.592 Y117.427 Z2.8 F42000
G1 X124.215 Y123.327 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X123.927 Y123.355 E.00469
G1 X110.75 Y123.355 E.21398
G3 X109.284 Y121.889 I-.005 J-1.462 E.03743
G1 X109.284 Y108.711 E.21398
G3 X110.75 Y107.245 I1.462 J-.005 E.03743
G1 X123.927 Y107.245 E.21398
G1 X124.09 Y107.261 E.00265
G3 X125.394 Y108.711 I-.149 J1.445 E.03471
G1 X125.394 Y121.889 E.21398
G3 X124.274 Y123.315 I-1.462 J.005 E.03176
; WIPE_START
G1 F3600
M204 S6000
G1 X123.927 Y123.355 E-.13242
G1 X122.276 Y123.355 E-.62759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.113 Y116.958 Z2.8 F42000
G1 X116.469 Y114.43 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.283 J.873 E.03333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53584
G1 X115.171 Y114.181 E-.1036
G1 X115.321 Y113.929 E-.11154
G1 X115.336 Y113.91 E-.00902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X117.46 Y112.864 I.879 J2.788 E.01533
G3 X118.152 Y113 I-.208 J2.881 E.01149
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16203
G1 X117.46 Y112.864 E-.17484
G1 X117.87 Y112.919 E-.15729
G1 X118.152 Y113 E-.11161
G1 X117.746 Y113 E-.15423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z2.8 F42000
G1 Z2.4
M73 P76 R5
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-.993 J2.23 E.0312
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04957
G1 X118.73 Y113.298 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X119.639 Y116.112 I-2.39 J-.485 E.00553
G1 X119.639 Y114.49 E.02633
G1 X119.685 Y114.631 E.0024
G3 X119.741 Y115.725 I-2.345 J.668 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.112 E-.1521
G1 X119.639 Y114.512 E-.6079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
M73 P76 R4
G1 F1721
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.548 Y116.335 E.00291
G3 X118.209 Y117.578 I-2.204 J-1.033 E.03041
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.548 Y116.335 E-.06817
G1 X119.338 Y116.688 E-.156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.906 Y117.697 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X116.525 Y117.6 I.433 J-2.493 E.00639
G1 X118.146 Y117.602 E.02632
G3 X116.965 Y117.707 I-.807 J-2.398 E.01943
; WIPE_START
G1 F3600
M204 S6000
G1 X116.525 Y117.6 E-.17215
G1 X118.072 Y117.602 E-.58785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.867 J-2.277 E.03332
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08486
G1 X116.01 Y117.347 E-.11056
G1 X115.95 Y117.299 E-.0292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.969 Y114.725 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F1721
M204 S5000
G3 X115.039 Y114.488 I2.39 J.575 E.00402
G1 X115.039 Y116.112 E.02636
G3 X114.956 Y114.784 I2.32 J-.812 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.11674
G1 X115.039 Y116.112 E-.61693
G1 X115.02 Y116.045 E-.02633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 24 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer24 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 25/53
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.677 Y107.962 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X125.101 Y108.977 I-1.024 J1.024 E.01834
G1 X125.101 Y121.623 E.20533
G3 X123.661 Y123.062 I-1.448 J-.008 E.03667
G1 X111.016 Y123.062 E.20533
G3 X109.576 Y121.623 I.008 J-1.448 E.03667
G1 X109.576 Y108.977 E.20533
G3 X111.016 Y107.538 I1.448 J.008 E.03667
G1 X123.661 Y107.538 E.20533
G3 X124.634 Y107.92 I-.008 J1.448 E.01736
; WIPE_START
G1 F3600
M204 S6000
G1 X124.858 Y108.182 E-.13074
G1 X124.992 Y108.432 E-.1081
G1 X125.074 Y108.705 E-.10812
G1 X125.101 Y108.977 E-.10414
G1 X125.101 Y109.79 E-.3089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.614 Y117.407 Z2.9 F42000
G1 X124.234 Y123.355 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X123.944 Y123.383 E.00473
G1 X110.733 Y123.383 E.21453
G3 X109.255 Y121.906 I-.004 J-1.473 E.03772
G1 X109.255 Y108.694 E.21453
G3 X110.733 Y107.217 I1.473 J-.004 E.03772
G1 X123.944 Y107.217 E.21453
G1 X124.114 Y107.233 E.00278
G3 X125.422 Y108.694 I-.156 J1.456 E.03488
G1 X125.422 Y121.906 E.21453
G3 X124.293 Y123.343 I-1.473 J.004 E.03201
; WIPE_START
G1 F3600
M204 S6000
G1 X123.944 Y123.383 E-.13326
G1 X122.295 Y123.383 E-.62675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.132 Y116.986 Z2.9 F42000
G1 X116.469 Y114.43 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.021 I2.307 J.897 E.03329
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53544
G1 X115.171 Y114.181 E-.10343
G1 X115.321 Y113.929 E-.11153
G1 X115.337 Y113.909 E-.0096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X117.457 Y112.863 I.879 J2.791 E.01529
G3 X118.152 Y113 I-.32 J3.464 E.01152
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16201
G1 X117.457 Y112.863 E-.17388
G1 X117.868 Y112.918 E-.15744
G1 X118.152 Y113 E-.11241
G1 X117.746 Y113 E-.15426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.015 J2.25 E.03118
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04963
G1 X118.73 Y113.298 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.728 Y115.783 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X119.639 Y116.111 I-2.429 J-.485 E.00552
G1 X119.639 Y114.49 E.02633
G1 X119.677 Y114.604 E.00196
G3 X119.739 Y115.724 I-2.378 J.694 E.01838
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.15181
G1 X119.639 Y114.511 E-.60819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X119.616 Y116.17 E.02286
G1 X119.587 Y116.247 E.00133
G3 X118.209 Y117.579 I-2.28 J-.979 E.03197
M73 P77 R4
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53544
G1 X119.587 Y116.247 E-.03111
G1 X119.459 Y116.508 E-.11065
G1 X119.34 Y116.69 E-.08281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.717 Y117.658 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X116.525 Y117.6 I.622 J-2.393 E.00326
G1 X118.148 Y117.602 E.02635
G3 X116.775 Y117.673 I-.809 J-2.336 E.02261
; WIPE_START
G1 F3600
M204 S6000
G1 X116.525 Y117.6 E-.09911
G1 X118.148 Y117.602 E-.61671
G1 X118.036 Y117.634 E-.04419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.891 J-2.3 E.03329
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53548
G1 X116.261 Y117.489 E-.08572
G1 X116.009 Y117.346 E-.1103
G1 X115.95 Y117.299 E-.0285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.816 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1725
M204 S5000
G3 X115.039 Y114.489 I2.385 J.485 E.00552
G1 X115.039 Y116.113 E.02637
G3 X114.937 Y114.875 I2.294 J-.812 E.0204
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.1518
G1 X115.039 Y116.089 E-.6082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 25 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.9
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer25 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 26/53
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.695 Y107.943 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G3 X125.123 Y108.968 I-1.032 J1.032 E.01849
G1 X125.123 Y121.632 E.20565
G3 X123.671 Y123.084 I-1.46 J-.008 E.03698
G1 X111.006 Y123.084 E.20565
G3 X109.554 Y121.632 I.008 J-1.46 E.03698
G1 X109.554 Y108.968 E.20565
G3 X111.006 Y107.516 I1.46 J.008 E.03698
G1 X123.671 Y107.516 E.20565
G3 X124.652 Y107.902 I-.008 J1.46 E.01752
; WIPE_START
G1 F3600
M204 S6000
G1 X124.877 Y108.165 E-.13165
G1 X125.013 Y108.418 E-.10903
G1 X125.096 Y108.693 E-.10902
G1 X125.123 Y108.968 E-.10506
G1 X125.123 Y109.771 E-.30525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.636 Y117.388 Z3 F42000
G1 X124.253 Y123.383 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X123.961 Y123.412 E.00477
G1 X110.716 Y123.412 E.21508
G3 X109.227 Y121.923 I-.004 J-1.485 E.03801
G1 X109.227 Y108.677 E.21508
G3 X110.716 Y107.188 I1.485 J-.004 E.03801
G1 X123.961 Y107.188 E.21508
G1 X124.139 Y107.206 E.0029
G3 X125.45 Y108.677 I-.164 J1.466 E.03505
G1 X125.45 Y121.923 E.21508
G3 X124.312 Y123.371 I-1.485 J.004 E.03226
; WIPE_START
G1 F3600
M204 S6000
G1 X123.961 Y123.412 E-.13418
G1 X122.314 Y123.412 E-.62582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.151 Y117.015 Z3 F42000
G1 X116.469 Y114.43 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.022 I2.3 J.892 E.03328
G1 X116.469 Y114.37 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53545
G1 X115.267 Y114.012 E-.17715
G1 X115.343 Y113.913 E-.0474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G3 X117.455 Y112.863 I.856 J2.624 E.01526
G3 X118.152 Y113 I-.276 J3.257 E.01157
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.999 Y112.884 E-.16173
G1 X117.455 Y112.863 E-.17333
G1 X117.869 Y112.918 E-.15864
G1 X118.152 Y113 E-.11218
G1 X117.747 Y113 E-.15411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.015 J2.251 E.03119
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04954
G1 X118.73 Y113.298 E-.17508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G3 X119.639 Y116.111 I-2.388 J-.485 E.00553
G1 X119.639 Y114.487 E.02638
G1 X119.656 Y114.535 E.00083
G3 X119.741 Y115.725 I-2.314 J.763 E.01957
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.15194
G1 X119.639 Y114.511 E-.60806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X119.616 Y116.17 E.02286
G1 X119.588 Y116.246 E.00133
G3 X118.209 Y117.578 I-2.279 J-.981 E.03196
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53545
G1 X119.588 Y116.246 E-.03105
G1 X119.445 Y116.531 E-.12108
G1 X119.34 Y116.691 E-.07243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.907 Y117.698 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G3 X116.525 Y117.6 I.432 J-2.474 E.00641
G1 X118.146 Y117.602 E.02633
G3 X116.966 Y117.708 I-.807 J-2.379 E.01942
; WIPE_START
G1 F3600
M204 S6000
G1 X116.525 Y117.6 E-.17252
G1 X118.071 Y117.602 E-.58748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.059 Y116.17 I.866 J-2.276 E.03332
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53548
G1 X116.262 Y117.49 E-.0853
G1 X115.984 Y117.329 E-.1221
G1 X115.949 Y117.301 E-.01711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.949 Y114.817 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1728
M204 S5000
G3 X115.039 Y114.489 I2.401 J.483 E.00553
G1 X115.039 Y116.11 E.02632
G3 X114.938 Y114.875 I2.311 J-.811 E.02033
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.15189
G1 X115.039 Y116.089 E-.60811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 26 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer26 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 27/53
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.714 Y107.925 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G3 X125.145 Y108.958 I-1.041 J1.041 E.01865
G1 X125.145 Y121.642 E.20596
G3 X123.681 Y123.106 I-1.472 J-.008 E.03729
G1 X110.997 Y123.106 E.20596
G3 X109.532 Y121.642 I.008 J-1.472 E.03729
G1 X109.532 Y108.958 E.20596
G3 X110.997 Y107.494 I1.472 J.008 E.03729
G1 X123.681 Y107.494 E.20596
G3 X124.671 Y107.883 I-.008 J1.472 E.01767
; WIPE_START
G1 F3600
M204 S6000
G1 X124.897 Y108.149 E-.13257
G1 X125.034 Y108.404 E-.10991
G1 X125.118 Y108.68 E-.10993
G1 X125.145 Y108.958 E-.10596
G1 X125.145 Y109.752 E-.30163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.659 Y117.369 Z3.1 F42000
G1 X124.273 Y123.411 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X123.978 Y123.44 E.00481
G1 X110.699 Y123.44 E.21563
G3 X109.199 Y121.94 I-.004 J-1.496 E.0383
G1 X109.199 Y108.66 E.21563
G3 X110.699 Y107.16 I1.496 J-.004 E.0383
G1 X123.978 Y107.16 E.21563
G1 X124.163 Y107.178 E.00302
G3 X125.479 Y108.66 I-.171 J1.477 E.03522
G1 X125.479 Y121.94 E.21563
G3 X124.332 Y123.399 I-1.496 J.004 E.03251
; WIPE_START
G1 F3600
M204 S6000
G1 X123.978 Y123.44 E-.13518
G1 X122.334 Y123.44 E-.62482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.17 Y117.044 Z3.1 F42000
G1 X116.469 Y114.43 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.278 J.869 E.03333
M73 P78 R4
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.267 Y114.012 E-.17733
G1 X115.338 Y113.911 E-.04683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G3 X117.452 Y112.863 I.88 J2.794 E.0152
G3 X118.152 Y113 I-.31 J3.446 E.0116
G1 X116.59 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16196
G1 X117.452 Y112.863 E-.17194
G1 X117.868 Y112.918 E-.15946
G1 X118.152 Y113 E-.11235
G1 X117.746 Y113 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.006 J2.243 E.03119
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04956
G1 X118.73 Y113.298 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G3 X119.639 Y116.11 I-2.381 J-.486 E.0055
G1 X119.639 Y114.49 E.0263
G1 X119.685 Y114.631 E.0024
G3 X119.74 Y115.725 I-2.337 J.667 E.01794
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.11 E-.15131
G1 X119.639 Y114.508 E-.60869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X119.616 Y116.17 E.02285
G1 X119.587 Y116.247 E.00133
G3 X118.209 Y117.579 I-2.271 J-.971 E.03197
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53532
G1 X119.587 Y116.247 E-.03123
G1 X119.356 Y116.672 E-.18382
G1 X119.34 Y116.691 E-.00963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59513
G1 X117.771 Y117.701 E-.14796
G1 X117.727 Y117.706 E-.01691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.922 J-2.329 E.03324
G1 X116.409 Y116.17 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.5355
G1 X116.262 Y117.49 E-.08524
G1 X115.982 Y117.327 E-.12314
G1 X115.949 Y117.301 E-.01612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.97 Y114.726 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F1732
M204 S5000
G3 X115.039 Y114.488 I2.425 J.574 E.00401
G1 X115.039 Y116.11 E.02633
G3 X114.957 Y114.784 I2.356 J-.811 E.02183
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.11656
G1 X115.039 Y116.11 E-.61608
G1 X115.019 Y116.04 E-.02736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 27 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer27 end: 66
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 28/53
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.732 Y107.906 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G3 X125.167 Y108.948 I-1.05 J1.05 E.0188
G1 X125.167 Y121.652 E.20628
G3 X123.69 Y123.128 I-1.484 J-.008 E.03761
G1 X110.987 Y123.128 E.20628
G3 X109.51 Y121.652 I.008 J-1.484 E.03761
G1 X109.51 Y108.948 E.20628
G3 X110.987 Y107.472 I1.484 J.008 E.03761
G1 X123.69 Y107.472 E.20628
G3 X124.689 Y107.865 I-.008 J1.484 E.01783
; WIPE_START
G1 F3600
M204 S6000
G1 X124.917 Y108.132 E-.13348
G1 X125.055 Y108.389 E-.11083
G1 X125.139 Y108.668 E-.11084
G1 X125.167 Y108.948 E-.10687
G1 X125.167 Y109.732 E-.29798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.681 Y117.349 Z3.2 F42000
G1 X124.293 Y123.439 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G1 X123.995 Y123.468 E.00486
G1 X110.682 Y123.468 E.21618
G3 X109.17 Y121.957 I-.005 J-1.507 E.03859
G1 X109.17 Y108.643 E.21618
G3 X110.682 Y107.132 I1.507 J-.005 E.03859
G1 X123.995 Y107.132 E.21618
G1 X124.187 Y107.151 E.00314
G3 X125.507 Y108.643 I-.178 J1.487 E.03539
G1 X125.507 Y121.957 E.21618
G3 X124.352 Y123.427 I-1.507 J.005 E.03275
; WIPE_START
G1 F3600
M204 S6000
G1 X123.995 Y123.468 E-.13626
G1 X122.354 Y123.468 E-.62374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 28 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer28 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.673 Y123.041 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0782642
G1 F1916
M204 S6000
G2 X125.08 Y122.634 I-.694 J-1.101 E.00134
; WIPE_START
G1 F15000
G1 X124.899 Y122.861 E-.37999
G1 X124.673 Y123.041 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.879 Y115.412 Z3.2 F42000
G1 X125.08 Y107.966 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S6000
G2 X124.673 Y107.559 I-1.101 J.694 E.00134
; WIPE_START
G1 F15000
G1 X124.899 Y107.739 E-.37999
G1 X125.08 Y107.966 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.45 Y107.76 Z3.2 F42000
G1 X110.005 Y107.559 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S6000
G2 X109.597 Y107.966 I.694 J1.101 E.00134
; WIPE_START
G1 F15000
G1 X109.778 Y107.739 E-.37999
G1 X110.005 Y107.559 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.798 Y115.188 Z3.2 F42000
G1 X109.597 Y122.634 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S6000
G2 X110.005 Y123.041 I1.101 J-.694 E.00134
; WIPE_START
G1 F15000
G1 X109.778 Y122.861 E-.37999
G1 X109.597 Y122.634 E-.38001
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P79 R4
G1 X114.498 Y116.783 Z3.2 F42000
G1 X116.469 Y114.43 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1916
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.021 I2.275 J.865 E.03332
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53548
G1 X115.266 Y114.013 E-.1768
G1 X115.337 Y113.909 E-.04773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G3 X117.45 Y112.863 I.81 J2.315 E.01519
G3 X118.152 Y113 I-.305 J3.436 E.01165
G1 X116.59 Y112.998 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16116
G1 X117.45 Y112.863 E-.17175
G1 X117.868 Y112.918 E-.16044
G1 X118.152 Y113 E-.11236
G1 X117.746 Y113 E-.15431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.328 Y113.07 E.00208
G3 X119.617 Y114.43 I-.99 J2.23 E.03124
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.328 Y113.07 E-.04877
G1 X118.73 Y113.298 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.73 Y115.784 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G3 X119.639 Y116.112 I-2.389 J-.485 E.00553
G1 X119.639 Y114.487 E.02638
G1 X119.656 Y114.535 E.00083
G3 X119.741 Y115.725 I-2.315 J.763 E.01956
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.112 E-.15209
G1 X119.639 Y114.512 E-.60791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G1 X119.617 Y116.17 E.02286
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.251 J-.949 E.032
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53548
G1 X119.588 Y116.246 E-.03097
G1 X119.356 Y116.672 E-.18407
G1 X119.34 Y116.691 E-.00948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59511
G1 X117.868 Y117.682 E-.11056
G1 X117.726 Y117.699 E-.05433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.923 J-2.331 E.03325
G1 X116.409 Y116.17 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53551
G1 X116.262 Y117.49 E-.0853
G1 X115.98 Y117.326 E-.12408
G1 X115.949 Y117.301 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.816 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F1916
M204 S5000
G3 X115.039 Y114.488 I2.383 J.484 E.00553
G1 X115.039 Y116.112 E.02636
G3 X114.937 Y114.875 I2.292 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.15205
G1 X115.039 Y116.088 E-.60795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 29/53
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.785 J.93 P1  F42000
G1 X124.751 Y107.888 Z3.2
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G3 X125.189 Y108.938 I-1.058 J1.058 E.01896
G1 X125.189 Y121.662 E.2066
G3 X123.7 Y123.15 I-1.496 J-.008 E.03792
G1 X110.977 Y123.15 E.2066
G3 X109.488 Y121.662 I.008 J-1.496 E.03792
G1 X109.488 Y108.938 E.2066
G3 X110.977 Y107.45 I1.496 J.008 E.03792
G1 X123.7 Y107.45 E.2066
G3 X124.707 Y107.847 I-.008 J1.496 E.01799
; WIPE_START
G1 F3600
M204 S6000
G1 X124.937 Y108.115 E-.13438
G1 X125.076 Y108.375 E-.11174
G1 X125.161 Y108.656 E-.11175
G1 X125.189 Y108.938 E-.10778
G1 X125.189 Y109.713 E-.29436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.704 Y117.33 Z3.3 F42000
G1 X124.313 Y123.467 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G1 X124.012 Y123.497 E.0049
G1 X110.665 Y123.497 E.21673
G3 X109.142 Y121.974 I-.004 J-1.518 E.03888
G1 X109.142 Y108.626 E.21673
G3 X110.665 Y107.103 I1.518 J-.004 E.03888
G1 X124.012 Y107.103 E.21673
G1 X124.212 Y107.123 E.00326
G3 X125.535 Y108.626 I-.186 J1.498 E.03556
G1 X125.535 Y121.974 E.21673
G3 X124.371 Y123.455 I-1.518 J.004 E.03299
; WIPE_START
G1 F3600
M204 S6000
G1 X124.012 Y123.497 E-.1374
G1 X122.374 Y123.497 E-.62261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 29 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer29 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.654 Y123.09 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0861364
G1 F1883
M204 S6000
G2 X125.129 Y122.615 I-.707 J-1.182 E.00179
; WIPE_START
G1 F15000
G1 X124.921 Y122.882 E-.38001
G1 X124.654 Y123.09 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.894 Y115.462 Z3.3 F42000
G1 X125.129 Y107.985 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S6000
G2 X124.654 Y107.51 I-1.182 J.707 E.00179
; WIPE_START
G1 F15000
G1 X124.921 Y107.718 E-.38001
G1 X125.129 Y107.985 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.5 Y107.745 Z3.3 F42000
G1 X110.024 Y107.51 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S6000
G2 X109.548 Y107.985 I.707 J1.182 E.00179
; WIPE_START
G1 F15000
G1 X109.756 Y107.718 E-.38001
G1 X110.024 Y107.51 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.784 Y115.138 Z3.3 F42000
G1 X109.548 Y122.615 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S6000
G2 X110.024 Y123.09 I1.182 J-.707 E.00179
; WIPE_START
G1 F15000
G1 X109.756 Y122.882 E-.38001
G1 X109.548 Y122.615 E-.37999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.476 Y116.787 Z3.3 F42000
G1 X116.469 Y114.43 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1883
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.022 I2.288 J.881 E.03329
G1 X116.469 Y114.37 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53549
G1 X115.267 Y114.011 E-.17757
G1 X115.339 Y113.91 E-.04694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.532 Y112.997 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G3 X117.447 Y112.863 I.808 J2.315 E.01512
G3 X118.152 Y113 I-.299 J3.423 E.01169
G1 X116.592 Y112.998 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16039
G1 X117.447 Y112.863 E-.17083
G1 X117.868 Y112.918 E-.16139
G1 X118.152 Y113 E-.11232
G1 X117.744 Y112.999 E-.15507
; WIPE_END
M73 P80 R4
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.07 E.00212
G3 X119.618 Y114.43 I-1.047 J2.282 E.03117
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.07 E-.04953
G1 X118.73 Y113.298 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.727 Y115.783 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G3 X119.639 Y116.111 I-2.462 J-.485 E.00552
G1 X119.639 Y114.487 E.02638
G1 X119.656 Y114.535 E.00083
G3 X119.738 Y115.724 I-2.39 J.762 E.01954
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.1519
G1 X119.639 Y114.511 E-.6081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.548 Y116.335 E.0029
G3 X118.209 Y117.578 I-2.217 J-1.045 E.03041
G1 X118.209 Y116.23 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.548 Y116.335 E-.06779
G1 X119.338 Y116.688 E-.15638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G1 X118.146 Y117.603 E.02632
G3 X116.582 Y117.619 I-.807 J-2.337 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X118.146 Y117.603 E-.59436
G1 X117.722 Y117.705 E-.16564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.868 J-2.275 E.03331
G1 X116.409 Y116.17 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53553
G1 X116.261 Y117.489 E-.08578
G1 X116.009 Y117.346 E-.11025
G1 X115.949 Y117.301 E-.02844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.816 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1883
M204 S5000
G3 X115.039 Y114.488 I2.383 J.484 E.00553
G1 X115.039 Y116.112 E.02636
G3 X114.937 Y114.875 I2.293 J-.812 E.02037
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.15207
G1 X115.039 Y116.088 E-.60793
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 30/53
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I.785 J.93 P1  F42000
G1 X124.769 Y107.87 Z3.3
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G3 X125.211 Y108.929 I-1.067 J1.067 E.01911
G1 X125.211 Y121.671 E.20692
G3 X123.71 Y123.172 I-1.509 J-.008 E.03823
G1 X110.967 Y123.172 E.20692
G3 X109.466 Y121.671 I.008 J-1.509 E.03823
G1 X109.466 Y108.929 E.20692
G3 X110.967 Y107.428 I1.509 J.008 E.03823
G1 X123.71 Y107.428 E.20692
G3 X124.726 Y107.828 I-.008 J1.509 E.01814
; WIPE_START
G1 F3600
M204 S6000
G1 X124.957 Y108.099 E-.13531
G1 X125.097 Y108.36 E-.11263
G1 X125.183 Y108.644 E-.11266
G1 X125.211 Y108.929 E-.10869
G1 X125.211 Y109.694 E-.29071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.726 Y117.311 Z3.4 F42000
G1 X124.333 Y123.495 Z3.4
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G1 X124.029 Y123.525 E.00495
G1 X110.648 Y123.525 E.21729
G3 X109.114 Y121.991 I-.004 J-1.53 E.03917
G1 X109.114 Y108.609 E.21729
G3 X110.648 Y107.075 I1.53 J-.004 E.03917
G1 X124.029 Y107.075 E.21729
G1 X124.236 Y107.095 E.00338
G3 X125.564 Y108.609 I-.193 J1.509 E.03573
G1 X125.564 Y121.991 E.21729
G3 X124.392 Y123.483 I-1.53 J.004 E.03323
; WIPE_START
G1 F3600
M204 S6000
G1 X124.029 Y123.525 E-.13858
G1 X122.394 Y123.525 E-.62142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 30 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer30 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.492 Y123.206 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.088576
G1 F1846
M204 S6000
G2 X125.245 Y122.453 I-.541 J-1.294 E.00299
M204 S10000
G1 X125.245 Y108.147 F42000
G1 F1846
M204 S6000
G2 X124.492 Y107.394 I-1.294 J.541 E.00299
M204 S10000
G1 X110.186 Y107.394 F42000
G1 F1846
M204 S6000
G2 X109.433 Y108.147 I.541 J1.294 E.00299
M204 S10000
G1 X109.433 Y122.453 F42000
G1 F1846
M204 S6000
G2 X110.186 Y123.206 I1.294 J-.541 E.00299
; WIPE_START
G1 F15000
G1 X109.928 Y123.063 E-.20541
G1 X109.735 Y122.904 E-.17463
G1 X109.576 Y122.711 E-.17456
G1 X109.433 Y122.453 E-.2054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.465 Y116.715 Z3.4 F42000
G1 X116.469 Y114.43 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1846
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.311 J.901 E.0333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.247 Y114.045 E-.16276
G1 X115.336 Y113.91 E-.06141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G3 X117.445 Y112.863 I.882 J2.803 E.01508
G3 X118.152 Y113 I-.295 J3.417 E.01173
G1 X116.59 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16197
G1 X117.445 Y112.863 E-.16904
G1 X117.868 Y112.918 E-.16236
G1 X118.152 Y113 E-.11234
G1 X117.746 Y113 E-.15429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.017 J2.253 E.03118
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04957
G1 X118.73 Y113.298 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.729 Y115.784 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G3 X119.639 Y116.111 I-2.384 J-.484 E.00553
G1 X119.639 Y114.489 E.02634
G1 X119.673 Y114.592 E.00175
G3 X119.741 Y115.725 I-2.327 J.708 E.0186
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.15195
G1 X119.639 Y114.511 E-.60805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.578 I-2.205 J-1.031 E.03044
G1 X118.209 Y116.23 E.02189
; WIPE_START
M73 P81 R3
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.549 Y116.334 E-.06743
G1 X119.338 Y116.688 E-.15674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.524 Y117.6 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G1 X118.146 Y117.602 E.02634
G3 X116.581 Y117.619 I-.808 J-2.38 E.02584
; WIPE_START
G1 F3600
M204 S6000
G1 X118.146 Y117.602 E-.59477
G1 X117.771 Y117.701 E-.14743
G1 X117.725 Y117.706 E-.0178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G1 X116.469 Y117.579 E.02288
G3 X115.059 Y116.17 I.903 J-2.313 E.0333
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.579 E-.53596
G1 X116.174 Y117.444 E-.12331
G1 X115.949 Y117.304 E-.10074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.969 Y114.725 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1846
M204 S5000
G3 X115.039 Y114.489 I2.403 J.575 E.004
G1 X115.039 Y116.111 E.02634
G3 X114.956 Y114.784 I2.334 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.11641
G1 X115.039 Y116.111 E-.61639
G1 X115.021 Y116.041 E-.02719
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 31/53
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I.782 J.932 P1  F42000
G1 X124.787 Y107.851 Z3.4
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G3 X125.233 Y108.919 I-1.075 J1.075 E.01927
G1 X125.233 Y121.681 E.20723
G3 X123.72 Y123.194 I-1.521 J-.008 E.03854
G1 X110.958 Y123.194 E.20723
G3 X109.445 Y121.681 I.008 J-1.521 E.03854
G1 X109.445 Y108.919 E.20723
G3 X110.958 Y107.406 I1.521 J.008 E.03854
G1 X123.72 Y107.406 E.20723
G3 X124.744 Y107.81 I-.008 J1.521 E.0183
; WIPE_START
G1 F3600
M204 S6000
G1 X124.977 Y108.082 E-.13617
G1 X125.118 Y108.346 E-.11357
G1 X125.205 Y108.632 E-.11355
G1 X125.233 Y108.919 E-.1096
G1 X125.233 Y109.674 E-.28711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.749 Y117.292 Z3.5 F42000
G1 X124.353 Y123.523 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G1 X124.046 Y123.553 E.00501
G1 X110.631 Y123.553 E.21784
G3 X109.085 Y122.008 I-.004 J-1.541 E.03945
G1 X109.085 Y108.592 E.21784
G3 X110.631 Y107.047 I1.541 J-.004 E.03945
G1 X124.046 Y107.047 E.21784
G1 X124.261 Y107.068 E.0035
G3 X125.592 Y108.592 I-.201 J1.519 E.0359
G1 X125.592 Y122.008 E.21784
G3 X124.412 Y123.51 I-1.541 J.004 E.03347
; WIPE_START
G1 F3600
M204 S6000
G1 X124.046 Y123.553 E-.1398
G1 X122.414 Y123.553 E-.6202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 31 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer31 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.469 Y123.247 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961651
G1 F1855
M204 S6000
G2 X125.285 Y122.431 I-.509 J-1.325 E.00362
M204 S10000
G1 X125.285 Y108.169 F42000
; LINE_WIDTH: 0.0961636
G1 F1855
M204 S6000
G2 X124.469 Y107.353 I-1.325 J.509 E.00362
M204 S10000
G1 X110.208 Y107.353 F42000
; LINE_WIDTH: 0.0961651
G1 F1855
M204 S6000
G2 X109.392 Y108.169 I.509 J1.325 E.00362
M204 S10000
G1 X109.392 Y122.431 F42000
G1 F1855
M204 S6000
G2 X110.208 Y123.247 I1.325 J-.509 E.00362
; WIPE_START
G1 F15000
G1 X109.984 Y123.137 E-.1596
G1 X109.713 Y122.926 E-.2204
G1 X109.502 Y122.654 E-.22036
G1 X109.392 Y122.431 E-.15965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.449 Y116.714 Z3.5 F42000
G1 X116.469 Y114.43 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1855
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.278 J.869 E.03333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.171 Y114.181 E-.10371
G1 X115.321 Y113.928 E-.11159
G1 X115.336 Y113.91 E-.00886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G3 X117.442 Y112.863 I.882 J2.806 E.01504
G3 X118.152 Y113 I-.29 J3.41 E.01177
G1 X116.59 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16196
G1 X117.442 Y112.863 E-.16805
G1 X117.868 Y112.918 E-.16333
G1 X118.152 Y113 E-.11236
G1 X117.746 Y113 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.07 E.00212
G3 X119.618 Y114.43 I-1.008 J2.245 E.0312
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.07 E-.04953
G1 X118.73 Y113.298 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.73 Y115.783 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G3 X119.639 Y116.113 I-2.39 J-.483 E.00556
G1 X119.639 Y114.489 E.02637
G1 X119.672 Y114.589 E.00171
G3 X119.741 Y115.725 I-2.333 J.711 E.01864
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.113 E-.15266
G1 X119.639 Y114.515 E-.60734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.548 Y116.336 E.00291
G3 X118.209 Y117.579 I-2.211 J-1.038 E.03042
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.548 Y116.336 E-.06821
G1 X119.338 Y116.688 E-.15596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.379 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59509
G1 X117.771 Y117.701 E-.14797
G1 X117.727 Y117.706 E-.01694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.888 J-2.298 E.0333
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53554
G1 X116.261 Y117.489 E-.08578
G1 X116.009 Y117.346 E-.11023
G1 X115.951 Y117.299 E-.02845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.97 Y114.726 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F1855
M204 S5000
G3 X115.039 Y114.487 I2.433 J.573 E.00404
G1 X115.039 Y116.111 E.02637
G3 X114.957 Y114.785 I2.364 J-.812 E.02184
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.487 E-.11729
G1 X115.039 Y116.111 E-.61708
G1 X115.022 Y116.046 E-.02563
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 32/53
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I.782 J.932 P1  F42000
G1 X124.806 Y107.833 Z3.5
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G3 X125.255 Y108.909 I-1.084 J1.084 E.01942
G1 X125.255 Y121.691 E.20755
G3 X123.73 Y123.216 I-1.533 J-.008 E.03885
G1 X110.948 Y123.216 E.20755
G3 X109.423 Y121.691 I.008 J-1.533 E.03885
G1 X109.423 Y108.909 E.20755
G3 X110.948 Y107.384 I1.533 J.008 E.03885
G1 X123.73 Y107.384 E.20755
G3 X124.763 Y107.791 I-.008 J1.533 E.01845
; WIPE_START
G1 F3600
M204 S6000
G1 X124.997 Y108.066 E-.13709
G1 X125.139 Y108.331 E-.11445
G1 X125.226 Y108.62 E-.11449
G1 X125.255 Y108.909 E-.1105
G1 X125.255 Y109.655 E-.28347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.772 Y117.272 Z3.6 F42000
G1 X124.373 Y123.551 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G1 X124.063 Y123.582 E.00506
G1 X110.614 Y123.582 E.21839
G3 X109.057 Y122.025 I-.005 J-1.552 E.03974
G1 X109.057 Y108.575 E.21839
G3 X110.614 Y107.019 I1.552 J-.005 E.03974
G1 X124.063 Y107.019 E.21839
G1 X124.285 Y107.04 E.00362
G3 X125.62 Y108.575 I-.209 J1.53 E.03607
G1 X125.62 Y122.025 E.21839
G3 X124.432 Y123.538 I-1.552 J.005 E.0337
; WIPE_START
G1 F3600
M204 S6000
G1 X124.063 Y123.582 E-.14105
G1 X122.434 Y123.582 E-.61896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 32 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer32 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.447 Y123.288 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103322
G1 F1863
M204 S6000
G2 X125.326 Y122.408 I-.485 J-1.364 E.00429
M204 S10000
G1 X125.326 Y108.192 F42000
G1 F1863
M204 S6000
G2 X124.447 Y107.313 I-1.364 J.485 E.00429
M204 S10000
G1 X110.23 Y107.313 F42000
G1 F1863
M204 S6000
G2 X109.351 Y108.192 I.485 J1.364 E.00429
M204 S10000
G1 X109.351 Y122.408 F42000
G1 F1863
M204 S6000
G2 X110.23 Y123.288 I1.364 J-.485 E.00429
; WIPE_START
G1 F15000
G1 X109.965 Y123.16 E-.17444
G1 X109.691 Y122.947 E-.20556
G1 X109.478 Y122.674 E-.20554
G1 X109.351 Y122.408 E-.17446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.432 Y116.713 Z3.6 F42000
G1 X116.469 Y114.43 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1863
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.022 I2.273 J.866 E.03332
G1 X116.469 Y114.37 E.02189
; WIPE_START
G1 F3600
M204 S6000
M73 P82 R3
G1 X115.06 Y114.43 E-.53583
G1 X115.267 Y114.011 E-.17777
G1 X115.34 Y113.913 E-.04639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.531 Y112.998 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G3 X117.439 Y112.863 I.808 J2.314 E.015
G3 X118.147 Y113 I-.12 J2.512 E.01174
G1 X116.591 Y112.998 E.02527
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16062
G1 X117.439 Y112.863 E-.16793
G1 X117.868 Y112.918 E-.16427
G1 X118.147 Y113 E-.11043
G1 X117.735 Y112.999 E-.15676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G1 X118.209 Y113.022 E.02287
G1 X118.241 Y113.033 E.00055
G3 X119.617 Y114.43 I-.911 J2.275 E.03277
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53565
G1 X118.241 Y113.033 E-.01285
G1 X118.67 Y113.255 E-.18384
G1 X118.727 Y113.301 E-.02766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.73 Y115.783 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G3 X119.639 Y116.112 I-2.392 J-.485 E.00554
G1 X119.639 Y114.487 E.02639
G1 X119.656 Y114.536 E.00084
G3 X119.741 Y115.725 I-2.318 J.763 E.01955
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.112 E-.15236
G1 X119.639 Y114.513 E-.60764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G1 X119.617 Y116.17 E.02286
G1 X119.588 Y116.247 E.00133
G3 X118.209 Y117.579 I-2.317 J-1.018 E.03194
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53553
G1 X119.588 Y116.247 E-.0311
G1 X119.485 Y116.46 E-.09006
G1 X119.339 Y116.69 E-.10332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.524 Y117.6 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G1 X118.148 Y117.602 E.02636
G3 X116.581 Y117.619 I-.809 J-2.338 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59531
G1 X117.868 Y117.682 E-.11056
G1 X117.727 Y117.699 E-.05414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G1 X116.469 Y117.579 E.02288
G3 X115.059 Y116.17 I.871 J-2.28 E.03333
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.579 E-.53596
G1 X116.093 Y117.398 E-.15864
G1 X115.95 Y117.301 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.817 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F1863
M204 S5000
G3 X115.039 Y114.489 I2.376 J.483 E.00553
G1 X115.039 Y116.11 E.02632
G3 X114.937 Y114.875 I2.285 J-.81 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.15192
G1 X115.039 Y116.089 E-.60808
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 33/53
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I.786 J.929 P1  F42000
G1 X124.824 Y107.815 Z3.6
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G3 X125.277 Y108.899 I-1.093 J1.093 E.01958
G1 X125.277 Y121.701 E.20787
G3 X123.739 Y123.238 I-1.545 J-.008 E.03916
G1 X110.938 Y123.238 E.20787
G3 X109.401 Y121.701 I.008 J-1.545 E.03916
G1 X109.401 Y108.899 E.20787
G3 X110.938 Y107.362 I1.545 J.008 E.03916
G1 X123.739 Y107.362 E.20787
G3 X124.781 Y107.773 I-.008 J1.545 E.01861
; WIPE_START
G1 F3600
M204 S6000
G1 X125.017 Y108.049 E-.13801
G1 X125.16 Y108.317 E-.11539
G1 X125.248 Y108.608 E-.11537
G1 X125.277 Y108.899 E-.11142
G1 X125.277 Y109.636 E-.27982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.795 Y117.253 Z3.7 F42000
G1 X124.394 Y123.579 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G3 X124.08 Y123.61 I-.309 J-1.533 E.00513
G1 X110.597 Y123.61 E.21894
G3 X109.029 Y122.042 I-.005 J-1.564 E.04003
G1 X109.029 Y108.558 E.21894
G3 X110.597 Y106.99 I1.564 J-.005 E.04003
G1 X124.08 Y106.99 E.21894
G1 X124.309 Y107.013 E.00374
G3 X125.648 Y108.558 I-.216 J1.54 E.03624
G1 X125.648 Y122.042 E.21894
G3 X124.453 Y123.566 I-1.564 J.005 E.03393
; WIPE_START
G1 F3600
M204 S6000
G1 X124.08 Y123.61 E-.14253
G1 X122.455 Y123.61 E-.61747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 33 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer33 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.425 Y123.328 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11015
G1 F1871
M204 S6000
G2 X125.367 Y122.386 I-.466 J-1.409 E.00499
M204 S10000
G1 X125.367 Y108.214 F42000
G1 F1871
M204 S6000
G2 X124.425 Y107.272 I-1.409 J.466 E.00499
M204 S10000
G1 X110.253 Y107.272 F42000
G1 F1871
M204 S6000
G2 X109.31 Y108.214 I.466 J1.409 E.00499
M204 S10000
G1 X109.31 Y122.386 F42000
G1 F1871
M204 S6000
G2 X110.253 Y123.328 I1.409 J-.466 E.00499
; WIPE_START
G1 F15000
G1 X109.946 Y123.184 E-.18718
G1 X109.67 Y122.969 E-.19281
G1 X109.455 Y122.693 E-.19278
G1 X109.31 Y122.386 E-.18723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.415 Y116.712 Z3.7 F42000
G1 X116.469 Y114.43 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.341 J.932 E.03326
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53584
G1 X115.267 Y114.011 E-.17745
G1 X115.342 Y113.914 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G3 X117.437 Y112.863 I.81 J2.315 E.01499
G3 X118.152 Y113 I-.281 J3.393 E.01185
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16121
G1 X117.437 Y112.863 E-.167
G1 X117.868 Y112.918 E-.16521
G1 X118.152 Y113 E-.11233
G1 X117.746 Y113 E-.15425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.328 Y113.07 E.00208
G3 X119.617 Y114.43 I-.99 J2.23 E.03124
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.328 Y113.07 E-.04877
G1 X118.73 Y113.298 E-.17585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.728 Y115.783 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G3 X119.639 Y116.113 I-2.444 J-.484 E.00555
G1 X119.639 Y114.489 E.02636
G1 X119.671 Y114.584 E.00163
G3 X119.739 Y115.724 I-2.387 J.714 E.0187
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.113 E-.15244
M73 P83 R3
G1 X119.639 Y114.514 E-.60756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G1 X119.617 Y116.17 E.02286
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.285 J-.984 E.03197
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53555
G1 X119.588 Y116.246 E-.03096
G1 X119.483 Y116.462 E-.09113
G1 X119.339 Y116.69 E-.10236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.336 E.02588
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59515
G1 X117.868 Y117.682 E-.11057
G1 X117.726 Y117.699 E-.05428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.061 Y116.17 I.875 J-2.283 E.0333
G1 X116.409 Y116.17 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53557
G1 X116.26 Y117.489 E-.08613
G1 X116.009 Y117.345 E-.11009
G1 X115.951 Y117.299 E-.02821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.817 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1871
M204 S5000
G3 X115.039 Y114.489 I2.384 J.484 E.00553
G1 X115.039 Y116.113 E.02636
G1 X115.037 Y116.108 E.00008
G3 X114.937 Y114.876 I2.295 J-.807 E.0203
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.15193
G1 X115.039 Y116.089 E-.60807
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 34/53
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I.786 J.929 P1  F42000
G1 X124.842 Y107.796 Z3.7
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G3 X125.299 Y108.89 I-1.101 J1.101 E.01974
G1 X125.299 Y121.71 E.20818
G3 X123.749 Y123.26 I-1.557 J-.008 E.03947
G1 X110.928 Y123.26 E.20818
G3 X109.379 Y121.71 I.008 J-1.557 E.03947
G1 X109.379 Y108.89 E.20818
G3 X110.928 Y107.34 I1.557 J.008 E.03947
G1 X123.749 Y107.34 E.20818
G3 X124.799 Y107.755 I-.008 J1.557 E.01876
; WIPE_START
G1 F3600
M204 S6000
G1 X125.037 Y108.033 E-.13893
G1 X125.181 Y108.303 E-.11627
G1 X125.27 Y108.596 E-.1163
G1 X125.299 Y108.89 E-.11231
G1 X125.299 Y109.616 E-.27619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.817 Y117.234 Z3.8 F42000
G1 X124.413 Y123.607 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G3 X124.097 Y123.638 I-.312 J-1.544 E.00517
G1 X110.58 Y123.638 E.21949
G3 X109.001 Y122.059 I-.005 J-1.575 E.04032
G1 X109.001 Y108.541 E.21949
G3 X110.58 Y106.962 I1.575 J-.005 E.04032
G1 X124.097 Y106.962 E.21949
G1 X124.334 Y106.985 E.00386
G1 X124.414 Y106.993 E.0013
G3 X125.677 Y108.541 I-.333 J1.562 E.03506
G1 X125.677 Y122.059 E.21949
G3 X124.472 Y123.594 I-1.575 J.005 E.03418
; WIPE_START
G1 F3600
M204 S6000
G1 X124.097 Y123.638 E-.14336
G1 X122.475 Y123.638 E-.61664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 34 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer34 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.402 Y123.369 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0948822
G1 F1878
M204 S6000
G1 X124.61 Y123.283 E.00067
; LINE_WIDTH: 0.12845
G2 X125.246 Y122.712 I-.717 J-1.438 E.00377
; LINE_WIDTH: 0.102969
G2 X125.408 Y122.364 I-2.127 J-1.199 E.00128
M204 S10000
G1 X125.408 Y108.236 F42000
; LINE_WIDTH: 0.102962
G1 F1878
M204 S6000
G2 X125.246 Y107.888 I-2.285 J.849 E.00128
; LINE_WIDTH: 0.128454
G2 X124.61 Y107.317 I-1.352 J.867 E.00377
; LINE_WIDTH: 0.0948924
G1 X124.402 Y107.231 E.00067
M204 S10000
G1 X110.275 Y107.231 F42000
; LINE_WIDTH: 0.102962
G1 F1878
M204 S6000
G2 X109.926 Y107.393 I.849 J2.285 E.00128
; LINE_WIDTH: 0.128452
G2 X109.356 Y108.028 I.867 J1.352 E.00377
; LINE_WIDTH: 0.0948873
G1 X109.27 Y108.237 E.00067
M204 S10000
G1 X109.27 Y122.364 F42000
; LINE_WIDTH: 0.0948822
G1 F1878
M204 S6000
G1 X109.356 Y122.572 E.00067
; LINE_WIDTH: 0.12845
G2 X109.926 Y123.207 I1.438 J-.717 E.00377
; LINE_WIDTH: 0.102969
G2 X110.275 Y123.369 I1.199 J-2.127 E.00128
; WIPE_START
G1 F15000
G1 X109.926 Y123.207 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.488 Y117.088 Z3.8 F42000
G1 X116.469 Y114.43 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1878
M204 S5000
G1 X115.061 Y114.43 E.02286
G3 X116.469 Y113.022 I2.33 J.923 E.03325
G1 X116.469 Y114.37 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53556
G1 X115.267 Y114.011 E-.17764
G1 X115.342 Y113.913 E-.0468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.532 Y112.997 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G3 X117.434 Y112.863 I.883 J2.818 E.01488
G3 X118.152 Y113 I-.276 J3.382 E.01189
G1 X116.592 Y112.998 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16116
G1 X117.434 Y112.863 E-.16519
G1 X117.868 Y112.918 E-.16621
G1 X118.152 Y113 E-.11233
G1 X117.744 Y112.999 E-.15512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.618 Y114.43 I-1.023 J2.259 E.03118
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04956
G1 X118.73 Y113.298 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.727 Y115.783 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G3 X119.639 Y116.111 I-2.46 J-.485 E.00552
G1 X119.639 Y114.487 E.02637
G1 X119.656 Y114.536 E.00084
G3 X119.738 Y115.724 I-2.389 J.762 E.01953
; WIPE_START
G1 F3600
M204 S6000
G1 X119.639 Y116.111 E-.15183
G1 X119.639 Y114.511 E-.60817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.548 Y116.336 E.00292
G3 X118.209 Y117.578 I-2.24 J-1.073 E.03037
G1 X118.209 Y116.23 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
M73 P84 R3
G1 X119.548 Y116.336 E-.0683
G1 X119.338 Y116.688 E-.15587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G1 X118.146 Y117.603 E.02632
G3 X116.582 Y117.619 I-.807 J-2.379 E.02582
; WIPE_START
G1 F3600
M204 S6000
G1 X118.146 Y117.603 E-.59425
G1 X117.722 Y117.706 E-.16575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.87 J-2.279 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08511
G1 X116.007 Y117.345 E-.1116
G1 X115.95 Y117.299 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.968 Y114.723 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1878
M204 S5000
G3 X115.039 Y114.487 I2.364 J.576 E.004
G1 X115.039 Y116.111 E.02636
G3 X114.955 Y114.782 I2.294 J-.812 E.0219
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.487 E-.11637
G1 X115.039 Y116.111 E-.61699
G1 X115.021 Y116.043 E-.02664
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 35/53
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.783 J.932 P1  F42000
G1 X124.861 Y107.778 Z3.8
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G3 X125.321 Y108.88 I-1.11 J1.11 E.01989
G1 X125.321 Y121.72 E.2085
G3 X123.759 Y123.282 I-1.57 J-.008 E.03978
G1 X110.919 Y123.282 E.2085
G3 X109.357 Y121.72 I.008 J-1.57 E.03978
G1 X109.357 Y108.88 E.2085
G3 X110.919 Y107.318 I1.57 J.008 E.03978
G1 X123.759 Y107.318 E.2085
G3 X124.818 Y107.736 I-.008 J1.57 E.01892
; WIPE_START
G1 F3600
M204 S6000
G1 X125.057 Y108.016 E-.13985
G1 X125.202 Y108.288 E-.11717
G1 X125.291 Y108.583 E-.11721
G1 X125.321 Y108.88 E-.11322
G1 X125.321 Y109.597 E-.27254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.839 Y117.214 Z3.9 F42000
G1 X124.434 Y123.635 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X124.433 Y123.635 E.00002
G3 X124.114 Y123.666 I-.314 J-1.555 E.0052
G1 X110.563 Y123.666 E.22004
G3 X108.972 Y122.076 I-.004 J-1.586 E.04061
G1 X108.972 Y108.524 E.22004
G3 X110.563 Y106.934 I1.586 J-.004 E.04061
G1 X124.114 Y106.934 E.22004
G1 X124.358 Y106.958 E.00398
G1 X124.433 Y106.965 E.00122
G3 X125.705 Y108.524 I-.336 J1.573 E.03531
G1 X125.705 Y122.076 E.22004
G3 X124.729 Y123.545 I-1.586 J.004 E.03037
G1 X124.491 Y123.617 E.00404
; WIPE_START
G1 F3600
M204 S6000
G1 X124.433 Y123.635 E-.02319
G1 X124.114 Y123.666 E-.12159
G1 X122.495 Y123.666 E-.61522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 35 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.9
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer35 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.32 Y123.414 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0948627
G1 F1890
M204 S6000
G2 X124.439 Y123.385 I-.089 J-.618 E.00037
G1 X124.63 Y123.306 E.00062
; LINE_WIDTH: 0.137652
G2 X125.269 Y122.732 I-.723 J-1.447 E.00412
; LINE_WIDTH: 0.104139
G2 X125.453 Y122.282 I-1.461 J-.858 E.00164
M204 S10000
G1 X125.453 Y108.318 F42000
; LINE_WIDTH: 0.104142
G1 F1890
M204 S6000
G2 X125.269 Y107.868 I-1.643 J.408 E.00164
; LINE_WIDTH: 0.137653
G2 X124.63 Y107.294 I-1.361 J.872 E.00412
; LINE_WIDTH: 0.0948677
G1 X124.439 Y107.215 E.00062
G2 X124.32 Y107.186 I-.207 J.588 E.00037
M204 S10000
G1 X110.357 Y107.186 F42000
; LINE_WIDTH: 0.104142
G1 F1890
M204 S6000
G2 X109.907 Y107.37 I.408 J1.643 E.00164
; LINE_WIDTH: 0.137651
G2 X109.333 Y108.009 I.872 J1.361 E.00412
; LINE_WIDTH: 0.0948582
G1 X109.254 Y108.2 E.00062
G2 X109.225 Y108.318 I.587 J.207 E.00037
M204 S10000
G1 X109.225 Y122.282 F42000
; LINE_WIDTH: 0.0948627
G1 F1890
M204 S6000
G2 X109.254 Y122.4 I.618 J-.089 E.00037
G1 X109.333 Y122.591 E.00062
; LINE_WIDTH: 0.137652
G2 X109.907 Y123.23 I1.447 J-.723 E.00412
; LINE_WIDTH: 0.104139
G2 X110.357 Y123.414 I.858 J-1.461 E.00164
; WIPE_START
G1 F15000
G1 X110.233 Y123.383 E-.19983
G1 X109.907 Y123.23 E-.56017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.469 Y117.112 Z3.9 F42000
G1 X116.469 Y114.43 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1890
M204 S5000
G1 X115.061 Y114.43 E.02287
G3 X116.469 Y113.022 I2.331 J.923 E.03325
G1 X116.469 Y114.37 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53558
G1 X115.267 Y114.011 E-.17738
G1 X115.342 Y113.913 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.532 Y112.997 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G3 X117.432 Y112.862 I.807 J2.314 E.01487
G3 X118.152 Y113 I-.169 J2.839 E.01194
G1 X116.592 Y112.998 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16039
G1 X117.432 Y112.862 E-.16506
G1 X117.87 Y112.919 E-.16784
G1 X118.152 Y113 E-.11162
G1 X117.744 Y112.999 E-.15509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.329 Y113.07 E.0021
G3 X119.618 Y114.43 I-1.008 J2.247 E.03122
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.329 Y113.07 E-.04908
G1 X118.73 Y113.298 E-.17554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.487 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X119.656 Y114.535 E.00083
G3 X119.639 Y116.11 I-2.456 J.761 E.02598
G1 X119.639 Y114.547 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X119.656 Y114.535 E-.00782
G1 X119.748 Y114.912 E-.14738
G1 X119.777 Y115.397 E-.18454
G1 X119.748 Y115.685 E-.10996
G1 X119.639 Y116.11 E-.16669
G1 X119.639 Y115.732 E-.14362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X119.616 Y116.17 E.02285
G1 X119.588 Y116.245 E.0013
G3 X118.209 Y117.578 I-2.247 J-.944 E.03202
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53532
G1 X119.588 Y116.245 E-.03037
G1 X119.357 Y116.671 E-.18399
G1 X119.34 Y116.691 E-.01032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.055 Y117.632 E.00158
G3 X116.582 Y117.619 I-.716 J-2.338 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59481
G1 X118.055 Y117.632 E-.03702
G1 X117.726 Y117.706 E-.12817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.895 J-2.304 E.03328
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.222 Y117.469 E-.10259
G1 X115.947 Y117.302 E-.12202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.97 Y114.724 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F1890
M204 S5000
G3 X115.039 Y114.487 I2.438 J.576 E.004
G1 X115.039 Y116.113 E.0264
G3 X114.957 Y114.782 I2.37 J-.813 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.487 E-.1164
G1 X115.039 Y116.113 E-.61786
G1 X115.021 Y116.048 E-.02574
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 36/53
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I.783 J.932 P1  F42000
G1 X124.879 Y107.759 Z3.9
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G3 X125.343 Y108.87 I-1.118 J1.119 E.02005
G1 X125.343 Y121.73 E.20882
G3 X123.769 Y123.304 I-1.582 J-.008 E.04009
G1 X110.909 Y123.304 E.20882
G3 X109.335 Y121.73 I.008 J-1.582 E.04009
G1 X109.335 Y108.87 E.20882
G3 X110.909 Y107.296 I1.582 J.008 E.04009
G1 X123.769 Y107.296 E.20882
G3 X124.836 Y107.718 I-.008 J1.582 E.01907
; WIPE_START
G1 F3600
M204 S6000
G1 X125.076 Y108 E-.14076
G1 X125.223 Y108.274 E-.11808
G1 X125.313 Y108.571 E-.11812
G1 X125.343 Y108.87 E-.11413
G1 X125.343 Y109.578 E-.26891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.862 Y117.195 Z4 F42000
G1 X124.453 Y123.663 Z4
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X124.452 Y123.663 E.00003
G3 X124.131 Y123.695 I-.316 J-1.566 E.00524
G1 X110.546 Y123.695 E.22059
G3 X108.944 Y122.093 I-.004 J-1.598 E.0409
G1 X108.944 Y108.507 E.22059
G3 X110.546 Y106.905 I1.598 J-.004 E.0409
G1 X124.131 Y106.905 E.22059
G1 X124.382 Y106.93 E.0041
G1 X124.452 Y106.937 E.00114
G3 X125.733 Y108.507 I-.338 J1.584 E.03556
G1 X125.733 Y122.093 E.22059
G3 X124.75 Y123.572 I-1.598 J.004 E.03059
G1 X124.511 Y123.645 E.00406
; WIPE_START
G1 F3600
M204 S6000
G1 X124.452 Y123.663 E-.02344
G1 X124.131 Y123.695 E-.12244
G1 X122.515 Y123.695 E-.61412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 36 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer36 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.298 Y123.446 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0834562
G1 F1898
M204 S6000
G1 X124.404 Y123.425 E.00027
; LINE_WIDTH: 0.107499
G1 X124.649 Y123.329 E.00092
; LINE_WIDTH: 0.14686
G2 X125.292 Y122.751 I-.728 J-1.456 E.00447
; LINE_WIDTH: 0.120919
G2 X125.446 Y122.422 I-2.021 J-1.145 E.00147
; LINE_WIDTH: 0.0862971
G2 X125.485 Y122.259 I-.894 J-.298 E.00044
M204 S10000
G1 X125.485 Y108.341 F42000
; LINE_WIDTH: 0.0862994
M73 P85 R3
G1 F1898
M204 S6000
G2 X125.446 Y108.178 I-.93 J.135 E.00044
; LINE_WIDTH: 0.120932
G2 X125.292 Y107.849 I-2.175 J.816 E.00147
; LINE_WIDTH: 0.146858
G2 X124.649 Y107.271 I-1.371 J.878 E.00447
; LINE_WIDTH: 0.104403
G1 X124.455 Y107.19 E.00071
G2 X124.359 Y107.166 I-.171 J.473 E.00033
; LINE_WIDTH: 0.0789197
G1 X124.298 Y107.154 E.00015
M204 S10000
G1 X110.379 Y107.154 F42000
; LINE_WIDTH: 0.0862994
G1 F1898
M204 S6000
G2 X110.216 Y107.193 I.135 J.93 E.00044
; LINE_WIDTH: 0.120932
G2 X109.888 Y107.346 I.816 J2.175 E.00147
; LINE_WIDTH: 0.146858
G2 X109.309 Y107.989 I.878 J1.371 E.00447
; LINE_WIDTH: 0.107481
G1 X109.214 Y108.234 E.00092
; LINE_WIDTH: 0.0834603
G1 X109.193 Y108.341 E.00027
M204 S10000
G1 X109.193 Y122.259 F42000
; LINE_WIDTH: 0.0834562
G1 F1898
M204 S6000
G1 X109.214 Y122.366 E.00027
; LINE_WIDTH: 0.107499
G1 X109.309 Y122.611 E.00092
; LINE_WIDTH: 0.14686
G2 X109.887 Y123.254 I1.456 J-.728 E.00447
; LINE_WIDTH: 0.120919
G2 X110.216 Y123.407 I1.145 J-2.021 E.00147
; LINE_WIDTH: 0.0862971
G2 X110.379 Y123.446 I.298 J-.894 E.00044
; WIPE_START
G1 F15000
G1 X110.216 Y123.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.578 Y117.144 Z4 F42000
G1 X116.469 Y114.43 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G1 X115.061 Y114.43 E.02285
G3 X116.469 Y113.021 I2.319 J.908 E.03327
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53532
G1 X115.239 Y114.058 E-.15676
G1 X115.338 Y113.909 E-.06792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G3 X117.429 Y112.862 I.887 J2.822 E.01485
G3 X118.152 Y113 I-.268 J3.372 E.01198
G1 X116.589 Y112.999 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16236
G1 X117.429 Y112.862 E-.16326
G1 X117.868 Y112.918 E-.16807
G1 X118.152 Y113 E-.1124
G1 X117.747 Y113 E-.1539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.031 J2.266 E.03117
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04956
G1 X118.73 Y113.298 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.489 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X119.669 Y114.577 E.00151
G3 X119.639 Y116.113 I-2.329 J.723 E.02538
G1 X119.639 Y114.549 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.669 Y114.577 E-.01566
G1 X119.748 Y114.914 E-.1316
G1 X119.777 Y115.399 E-.18453
G1 X119.73 Y115.783 E-.14706
G1 X119.639 Y116.113 E-.13007
G1 X119.639 Y115.716 E-.15108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X119.618 Y116.17 E.02288
G1 X119.566 Y116.295 E.0022
G3 X118.209 Y117.578 I-2.259 J-1.03 E.03109
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.618 Y116.17 E-.53589
G1 X119.566 Y116.295 E-.05146
G1 X119.356 Y116.673 E-.16409
G1 X119.341 Y116.69 E-.00857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.054 Y117.633 E.0016
G3 X116.582 Y117.619 I-.715 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59482
G1 X118.054 Y117.633 E-.03754
G1 X117.726 Y117.706 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.059 Y116.17 I.877 J-2.287 E.03331
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08508
G1 X116.007 Y117.345 E-.11169
G1 X115.949 Y117.3 E-.02785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.817 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F1898
M204 S5000
G3 X115.039 Y114.49 I2.375 J.484 E.00551
G1 X115.039 Y116.111 E.02632
G3 X114.937 Y114.876 I2.285 J-.81 E.02036
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.49 E-.1515
G1 X115.039 Y116.092 E-.6085
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 37/53
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.787 J.929 P1  F42000
G1 X124.898 Y107.741 Z4
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G3 X125.365 Y108.86 I-1.127 J1.127 E.0202
G1 X125.365 Y121.74 E.20913
G3 X123.778 Y123.326 I-1.594 J-.008 E.0404
G1 X110.899 Y123.326 E.20913
G3 X109.313 Y121.74 I.008 J-1.594 E.0404
G1 X109.313 Y108.86 E.20913
G3 X110.899 Y107.274 I1.594 J.008 E.0404
G1 X123.778 Y107.274 E.20913
G3 X124.854 Y107.699 I-.008 J1.594 E.01923
; WIPE_START
G1 F3600
M204 S6000
G1 X125.096 Y107.983 E-.14166
G1 X125.244 Y108.259 E-.11899
G1 X125.335 Y108.559 E-.11902
G1 X125.365 Y108.86 E-.11504
G1 X125.365 Y109.559 E-.26529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.884 Y117.176 Z4.1 F42000
G1 X124.473 Y123.691 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X124.471 Y123.691 E.00004
G3 X124.148 Y123.723 I-.318 J-1.577 E.00528
G1 X110.529 Y123.723 E.22115
G3 X108.916 Y122.11 I-.005 J-1.609 E.04119
G1 X108.916 Y108.491 E.22115
G3 X110.529 Y106.877 I1.609 J-.005 E.04119
G1 X124.148 Y106.877 E.22115
G1 X124.407 Y106.902 E.00422
G1 X124.471 Y106.909 E.00105
G3 X125.762 Y108.491 I-.341 J1.595 E.03582
G1 X125.762 Y122.11 E.22115
G3 X124.771 Y123.599 I-1.609 J.005 E.0308
G1 X124.531 Y123.673 E.00409
; WIPE_START
G1 F3600
M204 S6000
G1 X124.471 Y123.691 E-.02368
G1 X124.148 Y123.723 E-.12329
G1 X122.535 Y123.723 E-.61303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 37 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer37 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.276 Y123.478 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875279
G1 F1906
M204 S6000
G1 X124.423 Y123.449 E.0004
; LINE_WIDTH: 0.116153
G1 X124.669 Y123.353 E.00102
; LINE_WIDTH: 0.156066
G2 X125.316 Y122.771 I-.734 J-1.465 E.00483
; LINE_WIDTH: 0.129559
M73 P85 R2
G2 X125.471 Y122.439 I-2.009 J-1.14 E.00161
; LINE_WIDTH: 0.0908701
G2 X125.517 Y122.237 I-1.027 J-.341 E.00059
M204 S10000
G1 X125.517 Y108.363 F42000
; LINE_WIDTH: 0.0908686
G1 F1906
M204 S6000
G2 X125.471 Y108.161 I-1.073 J.14 E.00059
; LINE_WIDTH: 0.129557
G2 X125.316 Y107.829 I-2.167 J.81 E.00161
; LINE_WIDTH: 0.156066
G2 X124.669 Y107.247 I-1.38 J.883 E.00483
; LINE_WIDTH: 0.113412
G1 X124.47 Y107.165 E.00081
G2 X124.383 Y107.143 I-.157 J.432 E.00034
; LINE_WIDTH: 0.0835366
G1 X124.276 Y107.122 E.00028
M204 S10000
G1 X110.402 Y107.122 F42000
; LINE_WIDTH: 0.0908686
G1 F1906
M204 S6000
G2 X110.2 Y107.168 I.14 J1.073 E.00059
; LINE_WIDTH: 0.129557
G2 X109.868 Y107.323 I.81 J2.167 E.00161
; LINE_WIDTH: 0.156066
G2 X109.286 Y107.97 I.883 J1.381 E.00483
; LINE_WIDTH: 0.116158
G1 X109.19 Y108.216 E.00102
; LINE_WIDTH: 0.0875287
G1 X109.16 Y108.363 E.0004
M204 S10000
G1 X109.16 Y122.237 F42000
; LINE_WIDTH: 0.0875279
G1 F1906
M204 S6000
G1 X109.19 Y122.384 E.0004
; LINE_WIDTH: 0.116153
G1 X109.286 Y122.63 E.00102
; LINE_WIDTH: 0.156066
G2 X109.868 Y123.277 I1.465 J-.734 E.00483
; LINE_WIDTH: 0.129559
G2 X110.2 Y123.432 I1.14 J-2.009 E.00161
; LINE_WIDTH: 0.0908701
G2 X110.402 Y123.478 I.341 J-1.027 E.00059
; WIPE_START
G1 F15000
G1 X110.2 Y123.432 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.562 Y117.169 Z4.1 F42000
G1 X116.469 Y114.43 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1906
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.022 I2.303 J.896 E.03328
G1 X116.469 Y114.37 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.266 Y114.012 E-.17706
G1 X115.342 Y113.914 E-.04711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.531 Y112.997 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G3 X117.427 Y112.862 I.808 J2.315 E.01479
G3 X118.152 Y113 I-.201 J3.038 E.01202
G1 X116.591 Y112.998 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16043
G1 X117.427 Y112.862 E-.16312
G1 X117.869 Y112.918 E-.16933
G1 X118.152 Y113 E-.11208
G1 X117.744 Y112.999 E-.15504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.618 Y114.43 I-.995 J2.232 E.03121
G1 X118.269 Y114.43 E.02191
; WIPE_START
M73 P86 R2
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04963
G1 X118.73 Y113.298 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.489 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X119.668 Y114.575 E.00147
G3 X119.639 Y116.112 I-2.326 J.725 E.02541
G1 X119.639 Y114.549 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.668 Y114.575 E-.01484
G1 X119.748 Y114.914 E-.13233
G1 X119.777 Y115.399 E-.18475
G1 X119.73 Y115.783 E-.14701
G1 X119.639 Y116.112 E-.1299
G1 X119.639 Y115.715 E-.15117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.578 I-2.26 J-.96 E.03199
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53561
G1 X119.588 Y116.246 E-.03087
G1 X119.356 Y116.672 E-.18448
G1 X119.341 Y116.691 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.056 Y117.632 E.00157
G3 X116.582 Y117.619 I-.716 J-2.366 E.0243
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59476
G1 X118.056 Y117.632 E-.03681
G1 X117.726 Y117.706 E-.12843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.863 J-2.272 E.03332
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08504
G1 X116.007 Y117.345 E-.11167
G1 X115.95 Y117.299 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.97 Y114.725 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1906
M204 S5000
G3 X115.039 Y114.489 I2.426 J.575 E.00399
G1 X115.039 Y116.111 E.02634
G3 X114.957 Y114.784 I2.358 J-.811 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.11612
G1 X115.039 Y116.111 E-.61638
G1 X115.021 Y116.041 E-.0275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 38/53
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.783 J.932 P1  F42000
G1 X124.916 Y107.723 Z4.1
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G3 X125.386 Y108.851 I-1.136 J1.136 E.02036
G1 X125.386 Y121.749 E.20945
G3 X123.788 Y123.348 I-1.606 J-.008 E.04072
G1 X110.889 Y123.348 E.20945
G3 X109.291 Y121.749 I.008 J-1.606 E.04072
G1 X109.291 Y108.851 E.20945
G3 X110.889 Y107.252 I1.606 J.008 E.04072
G1 X123.788 Y107.252 E.20945
G3 X124.873 Y107.681 I-.008 J1.606 E.01939
; WIPE_START
G1 F3600
M204 S6000
G1 X125.116 Y107.967 E-.14257
G1 X125.265 Y108.245 E-.1199
G1 X125.357 Y108.547 E-.11994
G1 X125.386 Y108.851 E-.11595
G1 X125.386 Y109.539 E-.26165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.906 Y117.157 Z4.2 F42000
G1 X124.493 Y123.718 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X124.49 Y123.719 E.00005
G3 X124.165 Y123.751 I-.321 J-1.588 E.00531
G1 X110.512 Y123.751 E.2217
G3 X108.887 Y122.127 I-.005 J-1.62 E.04148
G1 X108.887 Y108.474 E.2217
G3 X110.512 Y106.849 I1.62 J-.005 E.04148
G1 X124.165 Y106.849 E.2217
G1 X124.431 Y106.875 E.00434
G1 X124.49 Y106.881 E.00097
G3 X125.79 Y108.474 I-.343 J1.607 E.03607
G1 X125.79 Y122.127 E.2217
G3 X124.793 Y123.627 I-1.62 J.005 E.03102
G1 X124.55 Y123.701 E.00411
; WIPE_START
G1 F3600
M204 S6000
G1 X124.49 Y123.719 E-.0239
G1 X124.165 Y123.751 E-.12413
G1 X122.555 Y123.751 E-.61197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 38 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer38 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.253 Y123.51 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0916041
G1 F1914
M204 S6000
G1 X124.441 Y123.473 E.00055
; LINE_WIDTH: 0.124835
G1 X124.689 Y123.376 E.00112
; LINE_WIDTH: 0.165257
G2 X125.339 Y122.79 I-.74 J-1.475 E.00519
; LINE_WIDTH: 0.138182
G2 X125.495 Y122.455 I-2.004 J-1.139 E.00176
; LINE_WIDTH: 0.0952228
G2 X125.549 Y122.215 I-1.165 J-.387 E.00074
M204 S10000
G1 X125.549 Y108.385 F42000
; LINE_WIDTH: 0.0952211
G1 F1914
M204 S6000
G2 X125.495 Y108.145 I-1.219 J.146 E.00074
; LINE_WIDTH: 0.138181
G2 X125.339 Y107.81 I-2.16 J.804 E.00176
; LINE_WIDTH: 0.165256
G2 X124.689 Y107.224 I-1.39 J.889 E.00519
; LINE_WIDTH: 0.122435
G1 X124.486 Y107.141 E.0009
G2 X124.407 Y107.12 I-.143 J.392 E.00034
; LINE_WIDTH: 0.0881621
G1 X124.253 Y107.09 E.00043
M204 S10000
G1 X110.424 Y107.09 F42000
; LINE_WIDTH: 0.0952211
G1 F1914
M204 S6000
G2 X110.184 Y107.143 I.146 J1.219 E.00074
; LINE_WIDTH: 0.138181
G2 X109.849 Y107.3 I.804 J2.16 E.00176
; LINE_WIDTH: 0.165259
G2 X109.263 Y107.95 I.889 J1.39 E.00519
; LINE_WIDTH: 0.124831
G1 X109.166 Y108.197 E.00112
; LINE_WIDTH: 0.0916051
G1 X109.128 Y108.385 E.00055
M204 S10000
G1 X109.128 Y122.215 F42000
; LINE_WIDTH: 0.0916041
G1 F1914
M204 S6000
G1 X109.166 Y122.403 E.00055
; LINE_WIDTH: 0.124835
G1 X109.263 Y122.65 E.00112
; LINE_WIDTH: 0.165257
G2 X109.849 Y123.3 I1.475 J-.74 E.00519
; LINE_WIDTH: 0.138182
G2 X110.184 Y123.457 I1.139 J-2.004 E.00176
; LINE_WIDTH: 0.0952228
G2 X110.424 Y123.51 I.387 J-1.165 E.00074
; WIPE_START
G1 F15000
G1 X110.184 Y123.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.545 Y117.193 Z4.2 F42000
G1 X116.469 Y114.43 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1914
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.29 J.881 E.03332
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.171 Y114.181 E-.10375
G1 X115.321 Y113.928 E-.11172
G1 X115.336 Y113.91 E-.0087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G3 X117.424 Y112.862 I.888 J2.833 E.01475
G3 X118.152 Y113 I-.259 J3.355 E.01206
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.162
G1 X117.424 Y112.862 E-.16134
G1 X117.868 Y112.918 E-.17001
G1 X118.152 Y113 E-.11238
G1 X117.746 Y113 E-.15427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.008 J2.244 E.03119
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04957
G1 X118.73 Y113.298 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.487 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X119.656 Y114.536 E.00084
G3 X119.639 Y116.112 I-2.394 J.762 E.02604
G1 X119.639 Y114.547 E.02542
; WIPE_START
G1 F3600
M204 S6000
G1 X119.656 Y114.536 E-.00778
G1 X119.748 Y114.912 E-.14718
G1 X119.777 Y115.399 E-.18538
G1 X119.73 Y115.783 E-.14707
G1 X119.639 Y116.112 E-.12977
G1 X119.639 Y115.736 E-.14282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X119.617 Y116.17 E.02287
M73 P87 R2
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.286 J-.985 E.03198
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53563
G1 X119.588 Y116.246 E-.03089
G1 X119.477 Y116.473 E-.09608
G1 X119.34 Y116.689 E-.09739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.618 I-.809 J-2.445 E.02583
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59499
G1 X117.726 Y117.705 E-.16501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.875 J-2.285 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08507
G1 X116.007 Y117.345 E-.11157
G1 X115.948 Y117.301 E-.02799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.969 Y114.725 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F1914
M204 S5000
G3 X115.039 Y114.489 I2.39 J.576 E.00399
G1 X115.039 Y116.113 E.02637
G3 X114.956 Y114.783 I2.321 J-.812 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.489 E-.11613
G1 X115.039 Y116.113 E-.61706
G1 X115.02 Y116.045 E-.02681
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 39/53
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.783 J.931 P1  F42000
G1 X124.934 Y107.704 Z4.2
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G3 X125.408 Y108.841 I-1.144 J1.144 E.02051
G1 X125.408 Y121.759 E.20977
G3 X123.798 Y123.37 I-1.618 J-.008 E.04103
G1 X110.88 Y123.37 E.20977
G3 X109.269 Y121.759 I.008 J-1.618 E.04103
G1 X109.269 Y108.841 E.20977
G3 X110.88 Y107.23 I1.618 J.008 E.04103
G1 X123.798 Y107.23 E.20977
G3 X124.891 Y107.663 I-.008 J1.618 E.01954
; WIPE_START
G1 F3600
M204 S6000
G1 X125.136 Y107.95 E-.14347
G1 X125.286 Y108.231 E-.12081
G1 X125.378 Y108.535 E-.12083
G1 X125.408 Y108.841 E-.11687
G1 X125.408 Y109.52 E-.25802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.929 Y117.137 Z4.3 F42000
G1 X124.513 Y123.746 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X124.509 Y123.747 E.00006
G3 X124.182 Y123.78 I-.323 J-1.599 E.00535
G1 X110.495 Y123.78 E.22225
G3 X108.859 Y122.144 I-.005 J-1.632 E.04176
G1 X108.859 Y108.457 E.22225
G3 X110.495 Y106.82 I1.632 J-.005 E.04176
G1 X124.182 Y106.82 E.22225
G1 X124.455 Y106.847 E.00446
G1 X124.509 Y106.853 E.00088
G3 X125.818 Y108.457 I-.345 J1.618 E.03632
G1 X125.818 Y122.144 E.22225
G3 X124.814 Y123.654 I-1.632 J.005 E.03124
G1 X124.57 Y123.729 E.00414
; WIPE_START
G1 F3600
M204 S6000
G1 X124.509 Y123.747 E-.02409
G1 X124.182 Y123.78 E-.12496
G1 X122.574 Y123.78 E-.61096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 39 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer39 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.231 Y123.543 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0956677
G1 F1922
M204 S6000
G1 X124.46 Y123.497 E.00071
; LINE_WIDTH: 0.1335
G1 X124.708 Y123.399 E.00122
; LINE_WIDTH: 0.174459
G2 X125.362 Y122.809 I-.745 J-1.484 E.00556
; LINE_WIDTH: 0.146799
G2 X125.52 Y122.472 I-1.998 J-1.137 E.00191
; LINE_WIDTH: 0.099433
G2 X125.581 Y122.192 I-1.303 J-.432 E.00091
M204 S10000
G1 X125.581 Y108.408 F42000
; LINE_WIDTH: 0.0994238
G1 F1922
M204 S6000
G2 X125.52 Y108.129 I-1.363 J.153 E.00091
; LINE_WIDTH: 0.146797
G2 X125.362 Y107.791 I-2.157 J.8 E.00191
; LINE_WIDTH: 0.174461
G2 X124.708 Y107.201 I-1.4 J.894 E.00556
; LINE_WIDTH: 0.131471
G1 X124.501 Y107.116 E.001
G2 X124.431 Y107.097 I-.129 J.35 E.00033
; LINE_WIDTH: 0.092784
G1 X124.231 Y107.057 E.00059
M204 S10000
G1 X110.446 Y107.057 F42000
; LINE_WIDTH: 0.0994238
G1 F1922
M204 S6000
G2 X110.167 Y107.119 I.153 J1.363 E.00091
; LINE_WIDTH: 0.146797
G2 X109.829 Y107.276 I.8 J2.157 E.00191
; LINE_WIDTH: 0.174459
G2 X109.239 Y107.93 I.894 J1.399 E.00556
; LINE_WIDTH: 0.133507
G1 X109.142 Y108.179 E.00122
; LINE_WIDTH: 0.0956742
G1 X109.096 Y108.408 E.00071
M204 S10000
G1 X109.096 Y122.192 F42000
; LINE_WIDTH: 0.0956677
G1 F1922
M204 S6000
G1 X109.142 Y122.421 E.00071
; LINE_WIDTH: 0.1335
G1 X109.239 Y122.67 E.00122
; LINE_WIDTH: 0.174459
G2 X109.829 Y123.324 I1.484 J-.745 E.00556
; LINE_WIDTH: 0.146799
G2 X110.167 Y123.481 I1.137 J-1.998 E.00191
; LINE_WIDTH: 0.099433
G2 X110.446 Y123.543 I.432 J-1.303 E.00091
; WIPE_START
G1 F15000
G1 X110.167 Y123.481 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.528 Y117.217 Z4.3 F42000
G1 X116.469 Y114.43 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1922
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.308 J.899 E.03329
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53565
G1 X115.171 Y114.18 E-.10376
G1 X115.321 Y113.928 E-.11155
G1 X115.336 Y113.91 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G3 X117.422 Y112.862 I.889 J2.837 E.01471
G3 X118.152 Y113 I-.19 J3.005 E.0121
G1 X116.59 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16196
G1 X117.422 Y112.862 E-.1604
G1 X117.869 Y112.918 E-.17133
G1 X118.152 Y113 E-.11201
G1 X117.746 Y113 E-.1543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.328 Y113.07 E.00208
G3 X119.617 Y114.43 I-1.063 J2.299 E.03118
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.328 Y113.07 E-.04878
G1 X118.73 Y113.298 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.489 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X119.666 Y114.57 E.00139
G3 X119.639 Y116.112 I-2.355 J.729 E.02548
G1 X119.639 Y114.549 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.666 Y114.57 E-.01324
G1 X119.748 Y114.914 E-.13445
G1 X119.777 Y115.397 E-.18381
G1 X119.73 Y115.782 E-.14741
G1 X119.639 Y116.112 E-.13015
G1 X119.639 Y115.715 E-.15095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.578 I-2.26 J-.96 E.03199
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53565
G1 X119.588 Y116.246 E-.03089
G1 X119.357 Y116.671 E-.18368
G1 X119.341 Y116.69 E-.00977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.055 Y117.632 E.00158
G3 X116.582 Y117.619 I-.715 J-2.388 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59477
G1 X118.055 Y117.632 E-.03705
G1 X117.726 Y117.706 E-.12818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.875 J-2.285 E.0333
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.175 Y117.445 E-.1224
G1 X116.007 Y117.344 E-.07451
G1 X115.948 Y117.302 E-.0277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.948 Y114.817 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F1922
M204 S5000
G3 X115.039 Y114.488 I2.38 J.482 E.00555
G1 X115.039 Y116.11 E.02634
G3 X114.936 Y114.876 I2.288 J-.811 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.15241
G1 X115.039 Y116.087 E-.60759
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 40/53
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.3 I.787 J.928 P1  F42000
G1 X124.953 Y107.686 Z4.3
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G3 X125.43 Y108.831 I-1.153 J1.153 E.02067
G1 X125.43 Y121.769 E.21008
G3 X123.808 Y123.392 I-1.631 J-.008 E.04134
G1 X110.87 Y123.392 E.21008
G3 X109.247 Y121.769 I.008 J-1.631 E.04134
G1 X109.247 Y108.831 E.21008
G3 X110.87 Y107.208 I1.631 J.008 E.04134
G1 X123.808 Y107.208 E.21008
G3 X124.91 Y107.644 I-.008 J1.631 E.0197
; WIPE_START
G1 F3600
M204 S6000
G1 X125.156 Y107.934 E-.14437
G1 X125.307 Y108.216 E-.12172
G1 X125.4 Y108.523 E-.12175
G1 X125.43 Y108.831 E-.11777
G1 X125.43 Y109.501 E-.25439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.951 Y117.118 Z4.4 F42000
G1 X124.532 Y123.774 Z4.4
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X124.529 Y123.776 E.00006
G3 X124.199 Y123.808 I-.325 J-1.61 E.00539
G1 X110.478 Y123.808 E.2228
G3 X108.831 Y122.16 I-.005 J-1.643 E.04205
G1 X108.831 Y108.44 E.2228
G3 X110.478 Y106.792 I1.643 J-.005 E.04205
G1 X124.199 Y106.792 E.2228
G1 X124.48 Y106.82 E.00458
G1 X124.529 Y106.825 E.0008
G3 X125.847 Y108.44 I-.348 J1.629 E.03657
G1 X125.847 Y122.16 E.2228
G3 X124.835 Y123.682 I-1.643 J.005 E.03145
G1 X124.59 Y123.757 E.00417
; WIPE_START
G1 F3600
M204 S6000
G1 X124.529 Y123.776 E-.02422
G1 X124.199 Y123.808 E-.12581
M73 P88 R2
G1 X122.594 Y123.808 E-.60997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 40 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer40 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.209 Y123.575 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0997479
G1 F1930
M204 S6000
G1 X124.478 Y123.521 E.00088
; LINE_WIDTH: 0.142184
G2 X124.728 Y123.423 I-.412 J-1.411 E.00132
; LINE_WIDTH: 0.183656
G2 X125.386 Y122.829 I-.751 J-1.494 E.00593
; LINE_WIDTH: 0.155432
G2 X125.545 Y122.488 I-1.997 J-1.138 E.00206
; LINE_WIDTH: 0.103554
G2 X125.613 Y122.17 I-1.435 J-.477 E.00109
M204 S10000
G1 X125.613 Y108.43 F42000
; LINE_WIDTH: 0.103556
G1 F1930
M204 S6000
G2 X125.545 Y108.112 I-1.504 J.159 E.00109
; LINE_WIDTH: 0.155423
G2 X125.386 Y107.771 I-2.154 J.796 E.00205
; LINE_WIDTH: 0.183657
G2 X124.728 Y107.178 I-1.409 J.9 E.00593
; LINE_WIDTH: 0.140525
G2 X124.455 Y107.074 I-.528 J.983 E.00142
; LINE_WIDTH: 0.0974031
G1 X124.209 Y107.025 E.00078
M204 S10000
G1 X110.469 Y107.025 F42000
; LINE_WIDTH: 0.103556
G1 F1930
M204 S6000
G2 X110.151 Y107.094 I.159 J1.504 E.00109
; LINE_WIDTH: 0.155423
G2 X109.81 Y107.253 I.796 J2.154 E.00205
; LINE_WIDTH: 0.183657
G2 X109.216 Y107.911 I.9 J1.409 E.00593
; LINE_WIDTH: 0.142199
G2 X109.117 Y108.161 I1.315 J.663 E.00132
; LINE_WIDTH: 0.0997513
G1 X109.064 Y108.43 E.00088
M204 S10000
G1 X109.064 Y122.17 F42000
; LINE_WIDTH: 0.0997479
G1 F1930
M204 S6000
G1 X109.118 Y122.439 E.00088
; LINE_WIDTH: 0.142184
G2 X109.216 Y122.689 I1.411 J-.412 E.00132
; LINE_WIDTH: 0.183656
G2 X109.81 Y123.347 I1.494 J-.751 E.00593
; LINE_WIDTH: 0.155432
G2 X110.151 Y123.506 I1.138 J-1.997 E.00206
; LINE_WIDTH: 0.103554
G2 X110.469 Y123.575 I.477 J-1.435 E.00109
; WIPE_START
G1 F15000
G1 X110.151 Y123.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.511 Y117.242 Z4.4 F42000
G1 X116.469 Y114.43 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1930
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.319 J.91 E.03328
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53567
G1 X115.234 Y114.067 E-.15307
G1 X115.337 Y113.91 E-.07127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G3 X117.419 Y112.862 I.81 J2.316 E.0147
G3 X118.152 Y113 I-.184 J2.99 E.01215
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16127
G1 X117.419 Y112.862 E-.16019
G1 X117.869 Y112.918 E-.17236
G1 X118.152 Y113 E-.11199
G1 X117.746 Y113 E-.1542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.07 E.00212
G3 X119.618 Y114.43 I-1.006 J2.243 E.0312
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.07 E-.04953
G1 X118.73 Y113.298 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.489 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X119.666 Y114.567 E.00135
G3 X119.639 Y116.112 I-2.322 J.732 E.02552
G1 X119.639 Y114.549 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.666 Y114.567 E-.01248
G1 X119.748 Y114.914 E-.13543
G1 X119.777 Y115.399 E-.18459
G1 X119.73 Y115.783 E-.147
G1 X119.639 Y116.112 E-.1297
G1 X119.639 Y115.715 E-.15081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.317 J-1.017 E.03194
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53567
G1 X119.588 Y116.246 E-.03097
G1 X119.41 Y116.589 E-.14681
G1 X119.341 Y116.691 E-.04655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X118.15 Y117.601 E.02638
G3 X116.582 Y117.619 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.15 Y117.601 E-.59581
G1 X117.741 Y117.706 E-.16027
G1 X117.731 Y117.707 E-.00392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.872 J-2.281 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08501
G1 X116.008 Y117.345 E-.11155
G1 X115.948 Y117.301 E-.02805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.97 Y114.724 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1930
M204 S5000
G3 X115.039 Y114.488 I2.43 J.576 E.00399
G1 X115.039 Y116.112 E.02636
G3 X114.957 Y114.783 I2.362 J-.812 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y114.488 E-.11609
G1 X115.039 Y116.112 E-.6169
G1 X115.021 Y116.043 E-.02702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 41/53
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.784 J.931 P1  F42000
G1 X124.971 Y107.668 Z4.4
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G3 X125.452 Y108.821 I-1.162 J1.162 E.02082
G1 X125.452 Y121.779 E.2104
G3 X123.817 Y123.414 I-1.643 J-.008 E.04165
G1 X110.86 Y123.414 E.2104
G3 X109.225 Y121.779 I.008 J-1.643 E.04165
G1 X109.225 Y108.821 E.2104
G3 X110.86 Y107.186 I1.643 J.008 E.04165
G1 X123.817 Y107.186 E.2104
G3 X124.928 Y107.626 I-.008 J1.643 E.01985
; WIPE_START
G1 F3600
M204 S6000
G1 X125.176 Y107.917 E-.14528
G1 X125.328 Y108.202 E-.12266
G1 X125.422 Y108.511 E-.12263
G1 X125.452 Y108.821 E-.11868
G1 X125.452 Y109.481 E-.25075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.973 Y117.099 Z4.5 F42000
G1 X124.552 Y123.802 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X124.548 Y123.804 E.00007
G3 X124.216 Y123.836 I-.327 J-1.622 E.00542
G1 X110.461 Y123.836 E.22335
G3 X108.802 Y122.177 I-.005 J-1.654 E.04234
G1 X108.802 Y108.423 E.22335
G3 X110.461 Y106.764 I1.654 J-.005 E.04234
G1 X124.216 Y106.764 E.22335
G1 X124.504 Y106.792 E.0047
G1 X124.548 Y106.796 E.00072
G3 X125.875 Y108.423 I-.35 J1.64 E.03682
G1 X125.875 Y122.177 E.22335
G3 X124.857 Y123.709 I-1.654 J.005 E.03167
G1 X124.609 Y123.785 E.0042
; WIPE_START
G1 F3600
M204 S6000
G1 X124.548 Y123.804 E-.02434
G1 X124.216 Y123.836 E-.12665
G1 X122.613 Y123.836 E-.60902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 41 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer41 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.186 Y123.607 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0896334
G1 F1938
M204 S6000
G1 X124.341 Y123.576 E.00044
; LINE_WIDTH: 0.117986
G1 X124.496 Y123.545 E.00062
; LINE_WIDTH: 0.150878
G2 X124.748 Y123.446 I-.422 J-1.432 E.00143
; LINE_WIDTH: 0.192883
G2 X125.409 Y122.848 I-.756 J-1.502 E.0063
; LINE_WIDTH: 0.164031
G2 X125.569 Y122.504 I-1.99 J-1.136 E.00221
; LINE_WIDTH: 0.12135
G2 X125.615 Y122.303 I-.93 J-.316 E.00084
; LINE_WIDTH: 0.0896344
G1 X125.646 Y122.148 E.00044
M204 S10000
G1 X125.646 Y108.453 F42000
; LINE_WIDTH: 0.0896334
G1 F1938
M204 S6000
G1 X125.615 Y108.297 E.00044
; LINE_WIDTH: 0.121355
G2 X125.569 Y108.096 I-.973 J.114 E.00084
; LINE_WIDTH: 0.164046
G2 X125.409 Y107.752 I-2.147 J.79 E.00221
; LINE_WIDTH: 0.192882
G2 X124.748 Y107.154 I-1.418 J.905 E.0063
; LINE_WIDTH: 0.149558
G2 X124.478 Y107.051 I-.543 J1.015 E.00151
; LINE_WIDTH: 0.115285
G1 X124.332 Y107.022 E.00057
; LINE_WIDTH: 0.0887359
G1 X124.186 Y106.993 E.00041
M204 S10000
G1 X110.491 Y106.993 F42000
; LINE_WIDTH: 0.0896334
G1 F1938
M204 S6000
G1 X110.336 Y107.024 E.00044
; LINE_WIDTH: 0.121355
G2 X110.134 Y107.069 I.114 J.973 E.00084
; LINE_WIDTH: 0.164046
G2 X109.791 Y107.23 I.79 J2.147 E.00221
; LINE_WIDTH: 0.192882
G2 X109.193 Y107.891 I.905 J1.418 E.0063
; LINE_WIDTH: 0.150859
G2 X109.093 Y108.142 I1.326 J.67 E.00143
; LINE_WIDTH: 0.117981
G1 X109.063 Y108.297 E.00062
; LINE_WIDTH: 0.0896344
G1 X109.032 Y108.453 E.00044
M204 S10000
G1 X109.032 Y122.148 F42000
; LINE_WIDTH: 0.0896334
G1 F1938
M204 S6000
G1 X109.063 Y122.303 E.00044
; LINE_WIDTH: 0.117986
G1 X109.093 Y122.458 E.00062
; LINE_WIDTH: 0.150878
G2 X109.193 Y122.709 I1.432 J-.422 E.00143
; LINE_WIDTH: 0.192883
G2 X109.791 Y123.371 I1.502 J-.756 E.0063
; LINE_WIDTH: 0.164031
G2 X110.134 Y123.531 I1.136 J-1.99 E.00221
; LINE_WIDTH: 0.12135
G2 X110.336 Y123.576 I.316 J-.93 E.00084
; LINE_WIDTH: 0.0896344
G1 X110.491 Y123.607 E.00044
; WIPE_START
G1 F15000
G1 X110.336 Y123.576 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.587 Y117.237 Z4.5 F42000
G1 X116.469 Y114.43 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.309 J.899 E.03329
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53569
G1 X115.171 Y114.18 E-.10373
G1 X115.321 Y113.928 E-.11163
G1 X115.336 Y113.91 E-.00895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G3 X117.417 Y112.862 I.81 J2.317 E.01466
G3 X118.152 Y113 I-.247 J3.342 E.01218
G1 X116.59 Y112.998 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16113
G1 X117.417 Y112.862 E-.15933
G1 X117.868 Y112.918 E-.17277
M73 P89 R2
G1 X118.152 Y113 E-.11244
G1 X117.746 Y113 E-.15433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.618 Y114.43 I-1.033 J2.268 E.03118
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04956
G1 X118.73 Y113.298 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.487 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X119.656 Y114.536 E.00084
G3 X119.639 Y116.112 I-2.392 J.762 E.02603
G1 X119.639 Y114.547 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X119.656 Y114.536 E-.00777
G1 X119.761 Y115.008 E-.18363
G1 X119.777 Y115.399 E-.14887
G1 X119.73 Y115.783 E-.14694
G1 X119.639 Y116.112 E-.12969
G1 X119.639 Y115.735 E-.1431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.318 J-1.018 E.03195
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53569
G1 X119.588 Y116.246 E-.03082
G1 X119.474 Y116.48 E-.09908
G1 X119.34 Y116.689 E-.09441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X118.149 Y117.602 E.02637
G3 X116.582 Y117.619 I-.81 J-2.35 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.149 Y117.602 E-.59543
G1 X117.728 Y117.704 E-.16457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.059 Y116.17 I.895 J-2.306 E.03329
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08495
G1 X116.008 Y117.345 E-.11153
G1 X115.948 Y117.301 E-.02814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.488 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F1938
M204 S5000
G1 X115.039 Y116.113 E.02638
G3 X115.02 Y114.545 I2.324 J-.812 E.02592
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.113 E-.5959
G1 X114.946 Y115.78 E-.13119
G1 X114.936 Y115.694 E-.03291
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 42/53
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.5 I.76 J.95 P1  F42000
G1 X124.989 Y107.649 Z4.5
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X124.99 Y107.649 E.00001
G3 X125.474 Y108.812 I-1.17 J1.17 E.02098
G1 X125.474 Y121.788 E.21072
G3 X123.827 Y123.436 I-1.655 J-.008 E.04196
G1 X110.85 Y123.436 E.21072
G3 X109.203 Y121.788 I.008 J-1.655 E.04196
G1 X109.203 Y108.812 E.21072
G3 X110.85 Y107.164 I1.655 J.008 E.04196
G1 X123.827 Y107.164 E.21072
G3 X124.738 Y107.443 I-.008 J1.655 E.01569
G1 X124.943 Y107.611 E.0043
; WIPE_START
G1 F3600
M204 S6000
G1 X124.99 Y107.649 E-.02299
G1 X125.196 Y107.901 E-.12357
G1 X125.349 Y108.187 E-.12353
G1 X125.443 Y108.498 E-.12357
G1 X125.474 Y108.812 E-.11959
G1 X125.474 Y109.461 E-.24675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.995 Y117.078 Z4.6 F42000
G1 X124.571 Y123.83 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X124.567 Y123.832 E.00007
G3 X124.233 Y123.865 I-.329 J-1.633 E.00546
G1 X110.444 Y123.865 E.2239
G3 X108.774 Y122.194 I-.005 J-1.666 E.04263
G1 X108.774 Y108.406 E.2239
G3 X110.444 Y106.735 I1.666 J-.005 E.04263
G1 X124.233 Y106.735 E.2239
G1 X124.528 Y106.765 E.00482
G1 X124.567 Y106.768 E.00063
G3 X125.903 Y108.406 I-.353 J1.652 E.03708
G1 X125.903 Y122.194 E.2239
G3 X124.878 Y123.737 I-1.666 J.005 E.03189
G1 X124.628 Y123.813 E.00424
; WIPE_START
G1 F3600
M204 S6000
G1 X124.567 Y123.832 E-.02438
G1 X124.233 Y123.865 E-.1275
G1 X122.633 Y123.865 E-.60813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 42 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer42 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.174 Y123.635 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0920077
G1 F1945
M204 S6000
G2 X124.368 Y123.599 I-.269 J-1.983 E.00057
; LINE_WIDTH: 0.125658
G1 X124.515 Y123.569 E.00064
; LINE_WIDTH: 0.159566
G2 X124.767 Y123.469 I-.43 J-1.451 E.00153
; LINE_WIDTH: 0.202068
G2 X125.433 Y122.867 I-.763 J-1.512 E.00668
; LINE_WIDTH: 0.172652
G2 X125.594 Y122.521 I-1.986 J-1.135 E.00236
; LINE_WIDTH: 0.129171
G2 X125.637 Y122.329 I-.865 J-.296 E.00086
; LINE_WIDTH: 0.0963369
G1 X125.666 Y122.183 E.00046
; LINE_WIDTH: 0.0785623
G1 X125.673 Y122.135 E.00011
M204 S10000
G1 X125.673 Y108.465 F42000
; LINE_WIDTH: 0.0785626
G1 F1945
M204 S6000
G1 X125.666 Y108.417 E.00011
; LINE_WIDTH: 0.0963346
G1 X125.637 Y108.271 E.00046
; LINE_WIDTH: 0.129176
G2 X125.594 Y108.079 I-.909 J.105 E.00086
; LINE_WIDTH: 0.172664
G2 X125.433 Y107.733 I-2.146 J.787 E.00236
; LINE_WIDTH: 0.202068
G2 X124.767 Y107.131 I-1.428 J.91 E.00668
; LINE_WIDTH: 0.158639
G2 X124.502 Y107.028 I-.571 J1.079 E.00159
; LINE_WIDTH: 0.12379
G1 X124.362 Y107 E.0006
; LINE_WIDTH: 0.0913997
G2 X124.174 Y106.965 I-.451 J1.899 E.00055
M204 S10000
G1 X110.504 Y106.965 F42000
; LINE_WIDTH: 0.0785626
G1 F1945
M204 S6000
G1 X110.456 Y106.972 E.00011
; LINE_WIDTH: 0.0963346
G1 X110.309 Y107.002 E.00046
; LINE_WIDTH: 0.129176
G2 X110.118 Y107.045 I.105 J.909 E.00086
; LINE_WIDTH: 0.172664
G2 X109.771 Y107.206 I.787 J2.146 E.00236
; LINE_WIDTH: 0.202068
G2 X109.17 Y107.872 I.91 J1.428 E.00668
; LINE_WIDTH: 0.159557
G2 X109.069 Y108.124 I1.35 J.682 E.00153
; LINE_WIDTH: 0.12565
G1 X109.04 Y108.271 E.00063
; LINE_WIDTH: 0.0920077
G2 X109.004 Y108.465 I1.96 J.466 E.00057
M204 S10000
G1 X109.004 Y122.135 F42000
; LINE_WIDTH: 0.0920077
G1 F1945
M204 S6000
G2 X109.04 Y122.329 I1.983 J-.269 E.00057
; LINE_WIDTH: 0.125658
G1 X109.069 Y122.476 E.00064
; LINE_WIDTH: 0.159566
G2 X109.17 Y122.728 I1.451 J-.43 E.00153
; LINE_WIDTH: 0.202068
G2 X109.771 Y123.394 I1.512 J-.763 E.00668
; LINE_WIDTH: 0.172652
G2 X110.118 Y123.555 I1.135 J-1.986 E.00236
; LINE_WIDTH: 0.129171
G2 X110.309 Y123.599 I.296 J-.865 E.00086
; LINE_WIDTH: 0.0963369
G1 X110.456 Y123.628 E.00046
; LINE_WIDTH: 0.0785623
G1 X110.504 Y123.635 E.00011
; WIPE_START
G1 F15000
G1 X110.456 Y123.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.632 Y117.239 Z4.6 F42000
G1 X116.469 Y114.43 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1945
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.277 J.868 E.03333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53571
G1 X115.266 Y114.013 E-.17683
G1 X115.336 Y113.909 E-.04747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G3 X117.414 Y112.862 I.81 J2.317 E.01462
G3 X118.152 Y113 I-.243 J3.334 E.01222
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16125
G1 X117.414 Y112.862 E-.15832
G1 X117.868 Y112.918 E-.17382
G1 X118.152 Y113 E-.11239
G1 X117.746 Y113 E-.15421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.07 E.00212
G3 X119.617 Y114.43 I-.993 J2.23 E.03121
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.07 E-.04953
G1 X118.73 Y113.298 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.488 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X119.664 Y114.563 E.00127
G3 X119.639 Y116.112 I-2.32 J.737 E.0256
G1 X119.639 Y114.548 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X119.664 Y114.563 E-.01106
G1 X119.748 Y114.914 E-.13727
G1 X119.777 Y115.399 E-.18466
G1 X119.73 Y115.783 E-.14697
G1 X119.639 Y116.112 E-.1296
G1 X119.639 Y115.716 E-.15044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.6 F42000
G1 Z4.2
M73 P90 R2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.579 I-2.265 J-.962 E.032
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53571
G1 X119.588 Y116.246 E-.0308
G1 X119.424 Y116.566 E-.13685
G1 X119.341 Y116.69 E-.05663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.378 E.02586
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59507
G1 X117.726 Y117.705 E-.16494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.863 J-2.272 E.03332
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08501
G1 X116.008 Y117.345 E-.11151
G1 X115.95 Y117.299 E-.0281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.488 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1945
M204 S5000
G1 X115.039 Y116.112 E.02636
G3 X115.019 Y114.545 I2.292 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.112 E-.59533
G1 X114.931 Y115.692 E-.16467
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 43/53
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I.76 J.95 P1  F42000
G1 X125.007 Y107.63 Z4.6
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X125.008 Y107.631 E.00002
G3 X125.496 Y108.802 I-1.179 J1.179 E.02114
G1 X125.496 Y121.798 E.21103
G3 X123.837 Y123.458 I-1.667 J-.008 E.04227
G1 X110.84 Y123.458 E.21103
G3 X109.181 Y121.798 I.008 J-1.667 E.04227
G1 X109.181 Y108.802 E.21103
G3 X110.84 Y107.142 I1.667 J.008 E.04227
G1 X123.837 Y107.142 E.21103
G3 X124.755 Y107.423 I-.008 J1.667 E.01581
G1 X124.961 Y107.592 E.00433
; WIPE_START
G1 F3600
M204 S6000
G1 X125.008 Y107.631 E-.02322
G1 X125.216 Y107.884 E-.12445
G1 X125.37 Y108.173 E-.12448
G1 X125.465 Y108.486 E-.12446
G1 X125.496 Y108.802 E-.12049
G1 X125.496 Y109.441 E-.2429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.017 Y117.058 Z4.7 F42000
G1 X124.59 Y123.859 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X124.586 Y123.86 E.00007
G3 X124.25 Y123.893 I-.332 J-1.644 E.00549
G1 X110.427 Y123.893 E.22445
G3 X108.746 Y122.211 I-.004 J-1.677 E.04292
G1 X108.746 Y108.389 E.22445
G3 X110.427 Y106.707 I1.677 J-.004 E.04292
G1 X124.25 Y106.707 E.22445
G1 X124.553 Y106.737 E.00494
G1 X124.586 Y106.74 E.00055
G3 X125.931 Y108.389 I-.355 J1.663 E.03733
G1 X125.931 Y122.211 E.22445
G3 X124.899 Y123.764 I-1.677 J.004 E.0321
G1 X124.647 Y123.841 E.00427
; WIPE_START
G1 F3600
M204 S6000
G1 X124.586 Y123.86 E-.02437
G1 X124.25 Y123.893 E-.12834
G1 X122.652 Y123.893 E-.60729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 43 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer43 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.149 Y123.66 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0950413
G1 F1953
M204 S6000
G2 X124.386 Y123.623 I-.05 J-1.076 E.00072
; LINE_WIDTH: 0.133715
G1 X124.533 Y123.593 E.00069
; LINE_WIDTH: 0.168268
G2 X124.787 Y123.492 I-.441 J-1.476 E.00163
; LINE_WIDTH: 0.211273
G2 X125.456 Y122.887 I-.768 J-1.521 E.00706
; LINE_WIDTH: 0.181285
G2 X125.619 Y122.537 I-1.981 J-1.133 E.00252
; LINE_WIDTH: 0.137111
G2 X125.661 Y122.347 I-.837 J-.289 E.00092
; LINE_WIDTH: 0.104235
G1 X125.691 Y122.2 E.00051
; LINE_WIDTH: 0.0796811
G1 X125.699 Y122.11 E.00021
M204 S10000
G1 X125.699 Y108.49 F42000
; LINE_WIDTH: 0.079682
G1 F1953
M204 S6000
G1 X125.691 Y108.401 E.00021
; LINE_WIDTH: 0.104228
G1 X125.661 Y108.253 E.00051
; LINE_WIDTH: 0.137118
G2 X125.619 Y108.063 I-.879 J.099 E.00092
; LINE_WIDTH: 0.181284
G2 X125.456 Y107.713 I-2.146 J.784 E.00252
; LINE_WIDTH: 0.211272
G2 X124.787 Y107.108 I-1.437 J.916 E.00706
; LINE_WIDTH: 0.167755
G2 X124.526 Y107.005 I-.622 J1.201 E.00167
; LINE_WIDTH: 0.132666
G1 X124.382 Y106.977 E.00067
; LINE_WIDTH: 0.0946874
G2 X124.149 Y106.94 I-.282 J1.026 E.00071
M204 S10000
G1 X110.529 Y106.94 F42000
; LINE_WIDTH: 0.079682
G1 F1953
M204 S6000
G1 X110.439 Y106.948 E.00021
; LINE_WIDTH: 0.104228
G1 X110.292 Y106.977 E.00051
; LINE_WIDTH: 0.137118
G2 X110.102 Y107.02 I.099 J.879 E.00092
; LINE_WIDTH: 0.181284
G2 X109.752 Y107.183 I.784 J2.146 E.00252
; LINE_WIDTH: 0.211272
G2 X109.146 Y107.852 I.916 J1.437 E.00706
; LINE_WIDTH: 0.168273
G2 X109.045 Y108.105 I1.374 J.694 E.00163
; LINE_WIDTH: 0.133706
G1 X109.016 Y108.253 E.00069
; LINE_WIDTH: 0.09504
G2 X108.978 Y108.49 I1.039 J.287 E.00072
M204 S10000
G1 X108.978 Y122.11 F42000
; LINE_WIDTH: 0.0950413
G1 F1953
M204 S6000
G2 X109.016 Y122.347 I1.076 J-.05 E.00072
; LINE_WIDTH: 0.133715
G1 X109.045 Y122.495 E.00069
; LINE_WIDTH: 0.168268
G2 X109.146 Y122.748 I1.476 J-.441 E.00163
; LINE_WIDTH: 0.211273
G2 X109.752 Y123.417 I1.521 J-.768 E.00706
; LINE_WIDTH: 0.181285
G2 X110.102 Y123.58 I1.133 J-1.981 E.00252
; LINE_WIDTH: 0.137111
G2 X110.292 Y123.623 I.289 J-.837 E.00092
; LINE_WIDTH: 0.104235
G1 X110.439 Y123.652 E.00051
; LINE_WIDTH: 0.0796811
G1 X110.529 Y123.66 E.00021
; WIPE_START
G1 F15000
G1 X110.439 Y123.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.616 Y117.264 Z4.7 F42000
G1 X116.469 Y114.43 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.311 J.901 E.0333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53584
G1 X115.266 Y114.013 E-.17687
G1 X115.342 Y113.914 E-.04729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G3 X117.412 Y112.862 I.894 J2.856 E.01455
G3 X118.152 Y113 I-.144 J2.823 E.01227
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16203
G1 X117.412 Y112.862 E-.15661
M73 P90 R1
G1 X117.87 Y112.919 E-.17551
G1 X118.152 Y113 E-.11163
G1 X117.746 Y113 E-.15422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.329 Y113.07 E.00211
G3 X119.617 Y114.43 I-1.029 J2.265 E.03118
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53537
G1 X118.329 Y113.07 E-.04933
G1 X118.73 Y113.298 E-.1753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X119.685 Y114.63 E.00239
G3 X119.639 Y116.111 I-2.343 J.669 E.02446
G1 X119.639 Y114.55 E.02535
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03498
G1 X119.768 Y115.082 E-.17471
G1 X119.777 Y115.399 E-.12053
G1 X119.73 Y115.783 E-.14693
G1 X119.639 Y116.111 E-.12959
G1 X119.639 Y115.708 E-.15327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.578 I-2.282 J-.982 E.03197
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53573
G1 X119.588 Y116.246 E-.03083
G1 X119.459 Y116.507 E-.11061
G1 X119.34 Y116.689 E-.08283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.054 Y117.633 E.00161
G3 X116.582 Y117.619 I-.714 J-2.339 E.02428
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.5948
G1 X118.054 Y117.633 E-.03758
G1 X117.725 Y117.704 E-.12762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.895 J-2.304 E.03328
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53537
G1 X116.24 Y117.478 E-.09488
G1 X115.947 Y117.302 E-.12975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F1953
M204 S5000
G1 X115.039 Y116.11 E.02631
G3 X115.019 Y114.546 I2.283 J-.81 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59419
G1 X114.93 Y115.687 E-.16581
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 44/53
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.7 I.76 J.95 P1  F42000
G1 X125.025 Y107.611 Z4.7
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X125.026 Y107.612 E.00003
G3 X125.518 Y108.792 I-1.188 J1.187 E.02129
G1 X125.518 Y121.808 E.21135
G3 X123.847 Y123.48 I-1.679 J-.008 E.04258
G1 X110.831 Y123.48 E.21135
G3 X109.159 Y121.808 I.008 J-1.679 E.04258
G1 X109.159 Y108.792 E.21135
G3 X110.831 Y107.121 I1.679 J.008 E.04258
G1 X123.847 Y107.121 E.21135
G3 X124.771 Y107.403 I-.008 J1.679 E.01593
G1 X124.979 Y107.573 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X125.026 Y107.612 E-.02347
G1 X125.236 Y107.867 E-.12536
G1 X125.391 Y108.158 E-.12537
G1 X125.487 Y108.474 E-.12538
G1 X125.518 Y108.792 E-.1214
G1 X125.518 Y109.421 E-.23902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.039 Y117.039 Z4.8 F42000
G1 X124.609 Y123.887 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X124.605 Y123.888 E.00006
G3 X124.267 Y123.921 I-.334 J-1.655 E.00553
G1 X110.41 Y123.921 E.22501
G3 X108.718 Y122.228 I-.005 J-1.688 E.04321
G1 X108.718 Y108.372 E.22501
G3 X110.41 Y106.679 I1.688 J-.005 E.04321
M73 P91 R1
G1 X124.267 Y106.679 E.22501
G1 X124.577 Y106.709 E.00506
G1 X124.605 Y106.712 E.00046
G3 X125.96 Y108.372 I-.357 J1.674 E.03758
G1 X125.96 Y122.228 E.22501
G3 X124.92 Y123.791 I-1.688 J.005 E.03232
G1 X124.667 Y123.869 E.00431
; WIPE_START
G1 F3600
M204 S6000
G1 X124.605 Y123.888 E-.02431
G1 X124.267 Y123.921 E-.12917
G1 X122.671 Y123.921 E-.60653
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 44 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer44 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.094 Y123.689 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0797514
G1 F1963
M204 S6000
G1 X124.208 Y123.683 E.00027
; LINE_WIDTH: 0.106956
G2 X124.403 Y123.647 I-.234 J-1.808 E.00069
; LINE_WIDTH: 0.141762
G1 X124.552 Y123.617 E.00074
; LINE_WIDTH: 0.176965
G2 X124.806 Y123.516 I-.452 J-1.503 E.00174
; LINE_WIDTH: 0.220497
G2 X125.479 Y122.906 I-.774 J-1.531 E.00745
; LINE_WIDTH: 0.189893
G2 X125.643 Y122.553 I-1.976 J-1.132 E.00267
; LINE_WIDTH: 0.145066
G2 X125.686 Y122.365 I-.811 J-.281 E.00098
; LINE_WIDTH: 0.112138
G1 X125.715 Y122.216 E.00056
; LINE_WIDTH: 0.0828675
G1 X125.727 Y122.055 E.0004
M204 S10000
G1 X125.727 Y108.545 F42000
; LINE_WIDTH: 0.0828746
G1 F1963
M204 S6000
G1 X125.715 Y108.384 E.0004
; LINE_WIDTH: 0.112138
G1 X125.686 Y108.235 E.00056
; LINE_WIDTH: 0.145052
G2 X125.643 Y108.047 I-.853 J.093 E.00098
; LINE_WIDTH: 0.189904
G2 X125.479 Y107.694 I-2.142 J.78 E.00267
; LINE_WIDTH: 0.220498
G2 X124.807 Y107.084 I-1.447 J.921 E.00745
; LINE_WIDTH: 0.175622
G2 X124.544 Y106.981 I-.709 J1.415 E.00178
; LINE_WIDTH: 0.140608
G1 X124.399 Y106.952 E.00071
; LINE_WIDTH: 0.106554
G2 X124.208 Y106.917 I-.421 J1.739 E.00067
; LINE_WIDTH: 0.0797412
G1 X124.094 Y106.911 E.00027
M204 S10000
G1 X110.583 Y106.911 F42000
; LINE_WIDTH: 0.0828746
G1 F1963
M204 S6000
G1 X110.422 Y106.924 E.0004
; LINE_WIDTH: 0.112138
G1 X110.274 Y106.953 E.00056
; LINE_WIDTH: 0.145052
G2 X110.085 Y106.995 I.093 J.853 E.00098
; LINE_WIDTH: 0.189904
G2 X109.732 Y107.159 I.78 J2.142 E.00267
; LINE_WIDTH: 0.220493
G2 X109.123 Y107.832 I.921 J1.447 E.00745
; LINE_WIDTH: 0.176962
G2 X109.021 Y108.087 I1.401 J.707 E.00174
; LINE_WIDTH: 0.141775
G1 X108.992 Y108.235 E.00074
; LINE_WIDTH: 0.106954
G2 X108.956 Y108.431 I1.769 J.429 E.00069
; LINE_WIDTH: 0.0797412
G1 X108.95 Y108.545 E.00027
M204 S10000
G1 X108.95 Y122.055 F42000
; LINE_WIDTH: 0.0797514
G1 F1963
M204 S6000
G1 X108.956 Y122.169 E.00027
; LINE_WIDTH: 0.106956
G2 X108.992 Y122.365 I1.808 J-.234 E.00069
; LINE_WIDTH: 0.141762
G1 X109.021 Y122.513 E.00074
; LINE_WIDTH: 0.176965
G2 X109.123 Y122.768 I1.503 J-.452 E.00174
; LINE_WIDTH: 0.220497
G2 X109.732 Y123.441 I1.531 J-.774 E.00745
; LINE_WIDTH: 0.189893
G2 X110.085 Y123.605 I1.132 J-1.976 E.00267
; LINE_WIDTH: 0.145066
G2 X110.274 Y123.647 I.281 J-.811 E.00098
; LINE_WIDTH: 0.112138
G1 X110.422 Y123.676 E.00056
; LINE_WIDTH: 0.0828675
G1 X110.583 Y123.689 E.0004
; WIPE_START
G1 F15000
G1 X110.422 Y123.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.599 Y117.289 Z4.8 F42000
G1 X116.469 Y114.43 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.338 J.93 E.03326
G1 X116.469 Y114.37 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53584
G1 X115.171 Y114.18 E-.10396
G1 X115.321 Y113.928 E-.11154
G1 X115.335 Y113.91 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G3 X117.409 Y112.861 I.81 J2.318 E.01452
G3 X118.152 Y113 I-.235 J3.324 E.0123
G1 X116.59 Y112.998 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16102
G1 X117.409 Y112.861 E-.15636
G1 X117.868 Y112.918 E-.17575
G1 X118.152 Y113 E-.11239
G1 X117.746 Y113 E-.15448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.618 Y114.43 I-1.01 J2.247 E.03119
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04957
G1 X118.73 Y113.298 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.487 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X119.656 Y114.536 E.00085
G3 X119.639 Y116.111 I-2.391 J.761 E.02602
G1 X119.639 Y114.547 E.0254
; WIPE_START
G1 F3600
M204 S6000
G1 X119.656 Y114.536 E-.00775
G1 X119.748 Y114.912 E-.14699
G1 X119.777 Y115.399 E-.18545
G1 X119.73 Y115.783 E-.14688
G1 X119.639 Y116.111 E-.12958
G1 X119.639 Y115.734 E-.14335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.588 Y116.246 E.00132
G3 X118.209 Y117.578 I-2.251 J-.949 E.032
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53575
G1 X119.588 Y116.246 E-.03084
G1 X119.357 Y116.671 E-.18377
G1 X119.341 Y116.69 E-.00964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.055 Y117.632 E.00158
G3 X116.582 Y117.619 I-.716 J-2.338 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.5948
G1 X118.055 Y117.632 E-.03692
G1 X117.726 Y117.706 E-.12828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.873 J-2.282 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08487
G1 X115.947 Y117.302 E-.13975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1963
M204 S5000
G1 X115.039 Y116.113 E.02635
G3 X115.02 Y114.547 I2.318 J-.811 E.02589
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.113 E-.59519
G1 X114.946 Y115.78 E-.13127
G1 X114.936 Y115.693 E-.03354
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 45/53
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.761 J.95 P1  F42000
G1 X125.046 Y107.596 Z4.8
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X125.255 Y107.851 E.00536
G3 X125.54 Y108.782 I-1.407 J.939 E.01604
G1 X125.54 Y121.818 E.21167
G3 X123.856 Y123.501 I-1.692 J-.008 E.04289
G1 X110.821 Y123.501 E.21167
G3 X109.137 Y121.818 I.008 J-1.692 E.04289
G1 X109.137 Y108.782 E.21167
G3 X110.821 Y107.099 I1.692 J.008 E.04289
G1 X123.856 Y107.099 E.21167
G3 X125.003 Y107.554 I-.008 J1.692 E.02051
; WIPE_START
G1 F3600
M204 S6000
G1 X125.255 Y107.851 E-.14802
G1 X125.412 Y108.144 E-.12626
G1 X125.509 Y108.462 E-.12629
G1 X125.54 Y108.782 E-.12231
G1 X125.54 Y109.406 E-.23712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.061 Y117.024 Z4.9 F42000
G1 X124.628 Y123.915 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X124.625 Y123.916 E.00006
G3 X124.284 Y123.949 I-.336 J-1.666 E.00557
G1 X110.393 Y123.949 E.22556
G3 X108.689 Y122.245 I-.005 J-1.7 E.0435
G1 X108.689 Y108.355 E.22556
G3 X110.393 Y106.651 I1.7 J-.005 E.0435
G1 X124.284 Y106.651 E.22556
G1 X124.601 Y106.682 E.00518
G1 X124.625 Y106.684 E.00038
G3 X125.988 Y108.355 I-.36 J1.685 E.03783
G1 X125.988 Y122.245 E.22556
G3 X124.942 Y123.819 I-1.7 J.005 E.03253
G1 X124.685 Y123.897 E.00435
; WIPE_START
G1 F3600
M204 S6000
G1 X124.625 Y123.916 E-.02415
G1 X124.284 Y123.949 E-.13003
G1 X122.69 Y123.949 E-.60582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 45 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.9
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer45 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X124.039 Y123.717 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.083041
G1 F1974
M204 S6000
G1 X124.221 Y123.708 E.00046
; LINE_WIDTH: 0.114332
G2 X124.421 Y123.671 I-.241 J-1.87 E.00077
; LINE_WIDTH: 0.14983
G1 X124.57 Y123.642 E.0008
; LINE_WIDTH: 0.185677
G2 X124.826 Y123.539 I-.465 J-1.531 E.00185
; LINE_WIDTH: 0.229685
G2 X125.503 Y122.926 I-.779 J-1.54 E.00784
; LINE_WIDTH: 0.198511
G2 X125.668 Y122.57 I-1.975 J-1.133 E.00283
; LINE_WIDTH: 0.153021
G2 X125.71 Y122.382 I-.784 J-.274 E.00103
; LINE_WIDTH: 0.120041
G1 X125.739 Y122.233 E.00061
; LINE_WIDTH: 0.0862652
G1 X125.756 Y122.001 E.00062
M204 S10000
G1 X125.756 Y108.599 F42000
; LINE_WIDTH: 0.0862673
G1 F1974
M204 S6000
G1 X125.739 Y108.367 E.00062
; LINE_WIDTH: 0.120024
G1 X125.71 Y108.218 E.00061
; LINE_WIDTH: 0.153002
G2 X125.668 Y108.03 I-.828 J.087 E.00103
; LINE_WIDTH: 0.198512
G2 X125.503 Y107.674 I-2.138 J.776 E.00283
; LINE_WIDTH: 0.229686
G2 X124.826 Y107.061 I-1.456 J.927 E.00784
; LINE_WIDTH: 0.185185
G2 X124.567 Y106.958 I-.722 J1.437 E.00186
; LINE_WIDTH: 0.149426
G1 X124.419 Y106.929 E.00079
; LINE_WIDTH: 0.114195
G2 X124.221 Y106.892 I-.438 J1.82 E.00076
; LINE_WIDTH: 0.0830368
G1 X124.039 Y106.883 E.00046
M204 S10000
G1 X110.638 Y106.883 F42000
; LINE_WIDTH: 0.0862673
G1 F1974
M204 S6000
G1 X110.406 Y106.899 E.00062
; LINE_WIDTH: 0.120024
G1 X110.256 Y106.929 E.00061
; LINE_WIDTH: 0.153002
G2 X110.069 Y106.971 I.087 J.828 E.00103
; LINE_WIDTH: 0.198512
G2 X109.713 Y107.136 I.776 J2.138 E.00283
; LINE_WIDTH: 0.229685
G2 X109.1 Y107.813 I.926 J1.456 E.00784
; LINE_WIDTH: 0.185675
G2 X108.997 Y108.069 I1.426 J.72 E.00185
; LINE_WIDTH: 0.149845
G1 X108.967 Y108.218 E.0008
; LINE_WIDTH: 0.114338
G2 X108.931 Y108.418 I1.83 J.441 E.00077
; LINE_WIDTH: 0.0830368
G1 X108.922 Y108.599 E.00046
M204 S10000
G1 X108.922 Y122.001 F42000
; LINE_WIDTH: 0.083041
G1 F1974
M204 S6000
G1 X108.931 Y122.182 E.00046
; LINE_WIDTH: 0.114332
G2 X108.967 Y122.382 I1.87 J-.241 E.00077
; LINE_WIDTH: 0.14983
G1 X108.997 Y122.531 E.0008
; LINE_WIDTH: 0.185677
G2 X109.1 Y122.787 I1.531 J-.465 E.00185
; LINE_WIDTH: 0.229685
G2 X109.713 Y123.464 I1.54 J-.779 E.00784
; LINE_WIDTH: 0.198511
G2 X110.069 Y123.629 I1.133 J-1.975 E.00283
; LINE_WIDTH: 0.153021
G2 X110.256 Y123.671 I.274 J-.784 E.00103
; LINE_WIDTH: 0.120041
G1 X110.406 Y123.701 E.00061
; LINE_WIDTH: 0.0862652
G1 X110.638 Y123.717 E.00062
; WIPE_START
G1 F15000
G1 X110.406 Y123.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.583 Y117.313 Z4.9 F42000
G1 X116.469 Y114.43 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1974
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.31 J.9 E.03329
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53578
G1 X115.227 Y114.078 E-.14829
G1 X115.337 Y113.91 E-.07593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G3 X117.406 Y112.861 I.811 J2.32 E.01449
G3 X118.148 Y113 I-.129 J2.739 E.01228
G1 X116.59 Y112.998 E.0253
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16113
G1 X117.406 Y112.861 E-.1555
M73 P92 R1
G1 X117.87 Y112.919 E-.17752
G1 X118.148 Y113 E-.10993
G1 X117.737 Y113 E-.15592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X118.209 Y113.022 E.02287
G1 X118.24 Y113.033 E.00055
G3 X119.617 Y114.43 I-.933 J2.297 E.03275
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53569
G1 X118.24 Y113.033 E-.01277
G1 X118.502 Y113.156 E-.10991
G1 X118.729 Y113.297 E-.10164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.488 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X119.662 Y114.555 E.00116
G3 X119.639 Y116.11 I-2.314 J.743 E.0257
G1 X119.639 Y114.548 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X119.662 Y114.555 E-.00922
G1 X119.748 Y114.914 E-.14014
G1 X119.777 Y115.399 E-.18467
G1 X119.73 Y115.783 E-.14687
G1 X119.639 Y116.11 E-.12924
G1 X119.639 Y115.716 E-.14986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.579 I-2.227 J-1.052 E.03043
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.549 Y116.334 E-.06751
G1 X119.338 Y116.688 E-.15666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X118.15 Y117.601 E.02638
G3 X116.582 Y117.619 I-.811 J-2.377 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.15 Y117.601 E-.59578
G1 X117.754 Y117.704 E-.15545
G1 X117.731 Y117.706 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.059 Y116.17 I.865 J-2.275 E.03332
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.175 Y117.445 E-.12248
G1 X116.007 Y117.344 E-.07445
G1 X115.948 Y117.301 E-.02769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.489 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F1974
M204 S5000
G1 X115.039 Y116.112 E.02636
G3 X115.02 Y114.546 I2.361 J-.812 E.02587
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.112 E-.5952
G1 X114.931 Y115.692 E-.1648
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 46/53
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.9 I.761 J.95 P1  F42000
G1 X125.061 Y107.574 Z4.9
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X125.063 Y107.576 E.00005
G3 X125.562 Y108.773 I-1.205 J1.205 E.0216
G1 X125.562 Y121.827 E.21198
G3 X123.866 Y123.523 I-1.704 J-.008 E.04321
G1 X110.811 Y123.523 E.21198
G3 X109.115 Y121.827 I.008 J-1.704 E.04321
G1 X109.115 Y108.773 E.21198
G3 X110.811 Y107.077 I1.704 J.008 E.04321
G1 X123.866 Y107.077 E.21198
G3 X124.804 Y107.363 I-.008 J1.704 E.01616
G1 X125.014 Y107.536 E.00441
; WIPE_START
G1 F3600
M204 S6000
G1 X125.063 Y107.576 E-.02399
G1 X125.275 Y107.834 E-.12717
G1 X125.433 Y108.13 E-.12718
G1 X125.53 Y108.45 E-.1272
G1 X125.562 Y108.773 E-.12323
G1 X125.562 Y109.381 E-.23123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.083 Y116.999 Z5 F42000
G1 X124.647 Y123.943 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X124.644 Y123.944 E.00005
G3 X124.301 Y123.978 I-.338 J-1.677 E.0056
G1 X110.376 Y123.978 E.22611
G3 X108.661 Y122.262 I-.004 J-1.711 E.04379
G1 X108.661 Y108.338 E.22611
G3 X110.376 Y106.622 I1.711 J-.004 E.04379
G1 X124.301 Y106.622 E.22611
G1 X124.626 Y106.654 E.0053
G1 X124.644 Y106.656 E.0003
G3 X126.016 Y108.338 I-.362 J1.697 E.03808
G1 X126.016 Y122.262 E.22611
G3 X124.963 Y123.846 I-1.711 J.004 E.03275
G1 X124.704 Y123.926 E.0044
; WIPE_START
G1 F3600
M204 S6000
G1 X124.644 Y123.944 E-.02393
G1 X124.301 Y123.978 E-.13088
G1 X122.708 Y123.978 E-.6052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 46 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer46 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X123.985 Y123.745 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.086351
G1 F1985
M204 S6000
G1 X124.233 Y123.733 E.00066
; LINE_WIDTH: 0.121721
G2 X124.438 Y123.695 I-.247 J-1.923 E.00085
; LINE_WIDTH: 0.157892
G1 X124.588 Y123.666 E.00085
; LINE_WIDTH: 0.194389
G2 X124.846 Y123.562 I-.481 J-1.569 E.00195
; LINE_WIDTH: 0.238894
G2 X125.526 Y122.945 I-.785 J-1.549 E.00824
; LINE_WIDTH: 0.207116
G2 X125.692 Y122.586 I-1.971 J-1.132 E.003
; LINE_WIDTH: 0.160952
G2 X125.734 Y122.4 I-.759 J-.267 E.00109
; LINE_WIDTH: 0.127941
G1 X125.764 Y122.25 E.00066
; LINE_WIDTH: 0.0897413
G1 X125.784 Y121.946 E.00085
M204 S10000
G1 X125.784 Y108.654 F42000
; LINE_WIDTH: 0.0897365
G1 F1985
M204 S6000
G1 X125.764 Y108.35 E.00085
; LINE_WIDTH: 0.127934
G1 X125.734 Y108.2 E.00066
; LINE_WIDTH: 0.160947
G2 X125.692 Y108.014 I-.801 J.081 E.00109
; LINE_WIDTH: 0.207128
G2 X125.526 Y107.655 I-2.135 J.772 E.003
; LINE_WIDTH: 0.238891
G2 X124.845 Y107.038 I-1.466 J.932 E.00824
; LINE_WIDTH: 0.194388
G2 X124.588 Y106.934 I-.739 J1.468 E.00195
; LINE_WIDTH: 0.157905
G1 X124.438 Y106.905 E.00085
; LINE_WIDTH: 0.12173
G2 X124.233 Y106.867 I-.452 J1.884 E.00085
; LINE_WIDTH: 0.0863532
G1 X123.985 Y106.855 E.00066
M204 S10000
G1 X110.693 Y106.855 F42000
; LINE_WIDTH: 0.0897365
G1 F1985
M204 S6000
G1 X110.389 Y106.875 E.00085
; LINE_WIDTH: 0.127934
G1 X110.239 Y106.905 E.00066
; LINE_WIDTH: 0.160947
G2 X110.053 Y106.946 I.081 J.801 E.00109
; LINE_WIDTH: 0.207128
G2 X109.694 Y107.113 I.772 J2.135 E.003
; LINE_WIDTH: 0.238891
G2 X109.076 Y107.793 I.932 J1.466 E.00824
; LINE_WIDTH: 0.19439
G2 X108.973 Y108.05 I1.464 J.737 E.00195
; LINE_WIDTH: 0.157901
G1 X108.943 Y108.2 E.00085
; LINE_WIDTH: 0.121729
G2 X108.906 Y108.406 I1.884 J.452 E.00085
; LINE_WIDTH: 0.0863532
G1 X108.893 Y108.654 E.00066
M204 S10000
G1 X108.893 Y121.946 F42000
; LINE_WIDTH: 0.086351
G1 F1985
M204 S6000
G1 X108.906 Y122.194 E.00066
; LINE_WIDTH: 0.121722
G2 X108.943 Y122.4 I1.921 J-.246 E.00085
; LINE_WIDTH: 0.157906
G1 X108.973 Y122.55 E.00085
; LINE_WIDTH: 0.194391
G2 X109.076 Y122.807 I1.569 J-.481 E.00195
; LINE_WIDTH: 0.238893
G2 X109.694 Y123.487 I1.549 J-.785 E.00824
; LINE_WIDTH: 0.207116
G2 X110.053 Y123.654 I1.132 J-1.971 E.003
; LINE_WIDTH: 0.160952
G2 X110.239 Y123.695 I.267 J-.759 E.00109
; LINE_WIDTH: 0.127941
G1 X110.389 Y123.725 E.00066
; LINE_WIDTH: 0.0897413
G1 X110.693 Y123.745 E.00085
; WIPE_START
G1 F15000
G1 X110.389 Y123.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.567 Y117.338 Z5 F42000
G1 X116.469 Y114.43 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1985
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.31 J.9 E.0333
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.5358
G1 X115.218 Y114.094 E-.14108
G1 X115.321 Y113.928 E-.07437
G1 X115.336 Y113.91 E-.00875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G3 X117.404 Y112.861 I.898 J2.87 E.01444
G3 X118.152 Y113 I-.228 J3.317 E.01239
G1 X116.589 Y112.998 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16228
G1 X117.404 Y112.861 E-.15365
G1 X117.868 Y112.918 E-.17769
G1 X118.152 Y113 E-.1124
G1 X117.747 Y113 E-.15398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.328 Y113.07 E.00209
G3 X119.617 Y114.43 I-.991 J2.23 E.03124
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.328 Y113.07 E-.04881
G1 X118.73 Y113.298 E-.17581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X119.685 Y114.63 E.00238
G3 X119.639 Y116.111 I-2.341 J.669 E.02445
G1 X119.639 Y114.55 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03489
G1 X119.769 Y115.089 E-.17762
G1 X119.777 Y115.399 E-.1177
G1 X119.73 Y115.783 E-.14687
G1 X119.639 Y116.111 E-.12947
G1 X119.639 Y115.707 E-.15345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X119.617 Y116.17 E.02287
M73 P93 R1
G1 X119.588 Y116.245 E.00131
G3 X118.209 Y117.579 I-2.251 J-.948 E.03202
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.5358
G1 X119.588 Y116.245 E-.03072
G1 X119.459 Y116.508 E-.11119
G1 X119.34 Y116.689 E-.08228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.526 Y117.6 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X118.15 Y117.601 E.02637
G3 X116.583 Y117.619 I-.81 J-2.332 E.0259
; WIPE_START
G1 F3600
M204 S6000
G1 X118.15 Y117.601 E-.59555
G1 X117.756 Y117.704 E-.15452
G1 X117.73 Y117.706 E-.00993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.059 Y116.17 I.894 J-2.304 E.03329
G1 X116.409 Y116.17 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53549
G1 X116.175 Y117.445 E-.12241
G1 X116.007 Y117.344 E-.07454
G1 X115.95 Y117.299 E-.02757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.489 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1985
M204 S5000
G1 X115.039 Y116.113 E.02637
G3 X115.02 Y114.546 I2.329 J-.812 E.0259
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.113 E-.59559
G1 X114.931 Y115.694 E-.16441
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 47/53
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5 I.761 J.949 P1  F42000
G1 X125.078 Y107.555 Z5
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X125.081 Y107.557 E.00006
G3 X125.584 Y108.763 I-1.213 J1.213 E.02176
G1 X125.584 Y121.837 E.2123
G3 X123.876 Y123.545 I-1.716 J-.008 E.04352
G1 X110.801 Y123.545 E.2123
G3 X109.093 Y121.837 I.008 J-1.716 E.04352
G1 X109.093 Y108.763 E.2123
G3 X110.801 Y107.055 I1.716 J.008 E.04352
G1 X123.876 Y107.055 E.2123
G3 X124.821 Y107.343 I-.008 J1.716 E.01628
G1 X125.032 Y107.517 E.00444
; WIPE_START
G1 F3600
M204 S6000
G1 X125.081 Y107.557 E-.02425
G1 X125.295 Y107.818 E-.12809
G1 X125.454 Y108.115 E-.12813
G1 X125.552 Y108.438 E-.12808
G1 X125.584 Y108.763 E-.12413
G1 X125.584 Y109.361 E-.22733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.105 Y116.978 Z5.1 F42000
G1 X124.665 Y123.971 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X124.663 Y123.972 E.00004
G3 X124.318 Y124.006 I-.34 J-1.688 E.00564
G1 X110.359 Y124.006 E.22666
G3 X108.633 Y122.279 I-.004 J-1.722 E.04407
G1 X108.633 Y108.321 E.22666
G3 X110.359 Y106.594 I1.722 J-.004 E.04407
G1 X124.318 Y106.594 E.22666
G1 X124.65 Y106.627 E.00542
G1 X124.663 Y106.628 E.00021
G3 X126.045 Y108.321 I-.365 J1.708 E.03833
G1 X126.045 Y122.279 E.22666
G3 X124.984 Y123.874 I-1.722 J.004 E.03297
G1 X124.722 Y123.954 E.00445
; WIPE_START
G1 F3600
M204 S6000
G1 X124.663 Y123.972 E-.02362
G1 X124.318 Y124.006 E-.13172
G1 X122.727 Y124.006 E-.60466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 47 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.1
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer47 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X123.93 Y123.774 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0896514
G1 F1996
M204 S6000
G1 X124.246 Y123.758 E.00088
; LINE_WIDTH: 0.129095
G2 X124.456 Y123.72 I-.254 J-1.985 E.00094
; LINE_WIDTH: 0.165949
G1 X124.607 Y123.69 E.0009
; LINE_WIDTH: 0.203115
G2 X124.865 Y123.586 I-.498 J-1.609 E.00206
; LINE_WIDTH: 0.248083
G2 X125.549 Y122.964 I-.791 J-1.559 E.00864
; LINE_WIDTH: 0.215733
G2 X125.717 Y122.602 I-1.967 J-1.131 E.00316
; LINE_WIDTH: 0.16888
G2 X125.758 Y122.417 I-.735 J-.261 E.00114
; LINE_WIDTH: 0.135838
G1 X125.788 Y122.267 E.00072
; LINE_WIDTH: 0.0932293
G2 X125.812 Y121.891 I-1.978 J-.315 E.0011
M204 S10000
G1 X125.812 Y108.709 F42000
; LINE_WIDTH: 0.0932334
G1 F1996
M204 S6000
G2 X125.788 Y108.333 I-2.002 J-.061 E.0011
; LINE_WIDTH: 0.135829
G1 X125.758 Y108.183 E.00072
; LINE_WIDTH: 0.168874
G2 X125.717 Y107.998 I-.776 J.076 E.00114
; LINE_WIDTH: 0.21574
G2 X125.549 Y107.636 I-2.135 J.769 E.00316
; LINE_WIDTH: 0.248086
G2 X124.865 Y107.014 I-1.475 J.937 E.00864
; LINE_WIDTH: 0.2031
G2 X124.607 Y106.91 I-.755 J1.503 E.00206
; LINE_WIDTH: 0.165954
G1 X124.456 Y106.88 E.0009
; LINE_WIDTH: 0.129099
G2 X124.246 Y106.842 I-.464 J1.946 E.00094
; LINE_WIDTH: 0.0896488
G1 X123.93 Y106.826 E.00088
M204 S10000
G1 X110.747 Y106.826 F42000
; LINE_WIDTH: 0.0932334
G1 F1996
M204 S6000
G2 X110.372 Y106.85 I-.061 J2.002 E.0011
; LINE_WIDTH: 0.135829
G1 X110.221 Y106.88 E.00072
; LINE_WIDTH: 0.168874
G2 X110.036 Y106.922 I.076 J.776 E.00114
; LINE_WIDTH: 0.21574
G2 X109.674 Y107.089 I.769 J2.135 E.00316
; LINE_WIDTH: 0.248086
G2 X109.053 Y107.774 I.937 J1.475 E.00864
; LINE_WIDTH: 0.2031
G2 X108.949 Y108.032 I1.503 J.755 E.00206
; LINE_WIDTH: 0.165954
G1 X108.919 Y108.183 E.0009
; LINE_WIDTH: 0.129099
G2 X108.881 Y108.393 I1.946 J.464 E.00094
; LINE_WIDTH: 0.0896488
G1 X108.865 Y108.709 E.00088
M204 S10000
G1 X108.865 Y121.891 F42000
; LINE_WIDTH: 0.0896514
G1 F1996
M204 S6000
G1 X108.881 Y122.207 E.00088
; LINE_WIDTH: 0.129095
G2 X108.919 Y122.417 I1.985 J-.254 E.00094
; LINE_WIDTH: 0.165949
G1 X108.949 Y122.568 E.0009
; LINE_WIDTH: 0.203115
G2 X109.053 Y122.826 I1.609 J-.498 E.00206
; LINE_WIDTH: 0.248083
G2 X109.674 Y123.511 I1.559 J-.791 E.00864
; LINE_WIDTH: 0.215733
G2 X110.036 Y123.678 I1.131 J-1.967 E.00316
; LINE_WIDTH: 0.16888
G2 X110.221 Y123.72 I.261 J-.735 E.00114
; LINE_WIDTH: 0.135838
G1 X110.372 Y123.75 E.00072
; LINE_WIDTH: 0.0932293
G2 X110.747 Y123.774 I.315 J-1.978 E.0011
; WIPE_START
G1 F15000
G1 X110.372 Y123.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.55 Y117.362 Z5.1 F42000
G1 X116.469 Y114.43 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.022 I2.271 J.864 E.03332
G1 X116.469 Y114.37 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.218 Y114.094 E-.14104
G1 X115.321 Y113.928 E-.07441
G1 X115.336 Y113.91 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.529 Y112.998 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G3 X117.401 Y112.861 I.899 J2.876 E.01438
G3 X118.152 Y113 I-.146 J2.89 E.01244
G1 X116.589 Y112.998 E.02538
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16204
G1 X117.401 Y112.861 E-.15268
G1 X117.87 Y112.919 E-.17922
G1 X118.152 Y113 E-.11181
G1 X117.746 Y113 E-.15426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.007 J2.243 E.03119
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04962
G1 X118.73 Y113.298 E-.175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.487 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X119.656 Y114.536 E.00085
G3 X119.639 Y116.111 I-2.389 J.761 E.02601
G1 X119.639 Y114.547 E.02539
; WIPE_START
G1 F3600
M204 S6000
G1 X119.656 Y114.536 E-.00775
G1 X119.761 Y115.007 E-.18348
G1 X119.777 Y115.399 E-.14892
G1 X119.73 Y115.783 E-.14678
G1 X119.639 Y116.111 E-.12951
G1 X119.639 Y115.733 E-.14356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.588 Y116.245 E.00131
G3 X118.209 Y117.578 I-2.255 J-.955 E.032
G1 X118.209 Y116.23 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.588 Y116.245 E-.03075
G1 X119.402 Y116.601 E-.15257
G1 X119.338 Y116.688 E-.04085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.341 E.02587
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59507
G1 X117.726 Y117.704 E-.16493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.894 J-2.304 E.03328
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.263 Y117.49 E-.08494
G1 X116.008 Y117.345 E-.11152
G1 X115.948 Y117.301 E-.02816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.489 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F1996
M204 S5000
G1 X115.039 Y116.11 E.02632
G3 X115.02 Y114.546 I2.354 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59427
G1 X114.93 Y115.688 E-.16573
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 48/53
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.1 I.761 J.95 P1  F42000
G1 X125.103 Y107.542 Z5.1
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X125.315 Y107.801 E.00544
G3 X125.606 Y108.753 I-1.437 J.96 E.01639
G1 X125.606 Y121.847 E.21262
G3 X123.886 Y123.567 I-1.728 J-.008 E.04383
G1 X110.792 Y123.567 E.21262
G3 X109.071 Y121.847 I.008 J-1.728 E.04383
G1 X109.071 Y108.753 E.21262
G3 X110.792 Y107.033 I1.728 J.008 E.04383
G1 X123.886 Y107.033 E.21262
G3 X125.06 Y107.5 I-.008 J1.728 E.02102
; WIPE_START
G1 F3600
M204 S6000
G1 X125.315 Y107.801 E-.14991
G1 X125.475 Y108.101 E-.12898
G1 X125.574 Y108.426 E-.129
G1 X125.606 Y108.753 E-.12505
G1 X125.606 Y109.351 E-.22706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.126 Y116.968 Z5.2 F42000
G1 X124.683 Y124 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X124.682 Y124 E.00002
G3 X124.335 Y124.034 I-.343 J-1.699 E.00567
G1 X110.342 Y124.034 E.22721
M73 P94 R1
G3 X108.604 Y122.296 I-.005 J-1.734 E.04436
G1 X108.604 Y108.304 E.22721
G3 X110.342 Y106.566 I1.734 J-.005 E.04436
G1 X124.335 Y106.566 E.22721
G1 X124.674 Y106.599 E.00554
G1 X124.682 Y106.6 E.00013
G3 X126.073 Y108.304 I-.367 J1.719 E.03859
G1 X126.073 Y122.296 E.22721
G3 X125.006 Y123.901 I-1.734 J.005 E.03319
G1 X124.741 Y123.982 E.0045
; WIPE_START
G1 F3600
M204 S6000
G1 X124.682 Y124 E-.02323
G1 X124.335 Y124.034 E-.13254
G1 X122.745 Y124.034 E-.60423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 48 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer48 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X123.875 Y123.802 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0929516
G1 F2007
M204 S6000
G1 X124.258 Y123.783 E.00112
; LINE_WIDTH: 0.136475
G2 X124.474 Y123.744 I-.261 J-2.049 E.00103
; LINE_WIDTH: 0.174025
G1 X124.625 Y123.714 E.00096
; LINE_WIDTH: 0.211823
G2 X124.885 Y123.609 I-.521 J-1.663 E.00217
; LINE_WIDTH: 0.256916
G2 X125.584 Y122.965 I-.675 J-1.435 E.00926
; LINE_WIDTH: 0.223469
G2 X125.742 Y122.619 I-1.679 J-.974 E.00314
; LINE_WIDTH: 0.176816
G2 X125.783 Y122.435 I-.711 J-.254 E.00119
; LINE_WIDTH: 0.143737
G1 X125.813 Y122.283 E.00077
; LINE_WIDTH: 0.120389
G1 X125.821 Y122.228 E.00023
; LINE_WIDTH: 0.0933589
G2 X125.841 Y121.837 I-3.956 J-.395 E.00115
M204 S10000
G1 X125.841 Y108.763 F42000
; LINE_WIDTH: 0.0933661
G1 F2007
M204 S6000
G2 X125.821 Y108.372 I-3.976 J.004 E.00115
; LINE_WIDTH: 0.120394
G1 X125.813 Y108.317 E.00023
; LINE_WIDTH: 0.143741
G1 X125.783 Y108.165 E.00077
; LINE_WIDTH: 0.17683
G2 X125.742 Y107.981 I-.752 J.07 E.00119
; LINE_WIDTH: 0.223458
G2 X125.584 Y107.635 I-1.839 J.629 E.00314
; LINE_WIDTH: 0.256919
G2 X124.885 Y106.991 I-1.374 J.791 E.00926
; LINE_WIDTH: 0.211834
G2 X124.625 Y106.886 I-.78 J1.559 E.00217
; LINE_WIDTH: 0.174026
G1 X124.474 Y106.856 E.00096
; LINE_WIDTH: 0.136472
G2 X124.258 Y106.817 I-.476 J2.008 E.00103
; LINE_WIDTH: 0.0929444
G1 X123.875 Y106.798 E.00112
M204 S10000
G1 X110.802 Y106.798 F42000
; LINE_WIDTH: 0.0933661
G1 F2007
M204 S6000
G2 X110.411 Y106.818 I.004 J3.976 E.00115
; LINE_WIDTH: 0.120394
G1 X110.355 Y106.826 E.00023
; LINE_WIDTH: 0.143741
G1 X110.204 Y106.856 E.00077
; LINE_WIDTH: 0.17683
G2 X110.02 Y106.897 I.07 J.752 E.00119
; LINE_WIDTH: 0.223458
G2 X109.673 Y107.055 I.629 J1.839 E.00314
; LINE_WIDTH: 0.256919
G2 X109.03 Y107.754 I.791 J1.374 E.00926
; LINE_WIDTH: 0.211836
G2 X108.925 Y108.014 I1.552 J.777 E.00217
; LINE_WIDTH: 0.174012
G1 X108.895 Y108.165 E.00096
; LINE_WIDTH: 0.136469
G2 X108.856 Y108.381 I2.006 J.476 E.00103
; LINE_WIDTH: 0.0929444
G1 X108.837 Y108.764 E.00112
M204 S10000
G1 X108.837 Y121.837 F42000
; LINE_WIDTH: 0.0929516
G1 F2007
M204 S6000
G1 X108.856 Y122.219 E.00112
; LINE_WIDTH: 0.136475
G2 X108.895 Y122.435 I2.049 J-.261 E.00103
; LINE_WIDTH: 0.174025
G1 X108.925 Y122.586 E.00096
; LINE_WIDTH: 0.211823
G2 X109.03 Y122.846 I1.663 J-.521 E.00217
; LINE_WIDTH: 0.256916
G2 X109.673 Y123.545 I1.435 J-.675 E.00926
; LINE_WIDTH: 0.223469
G2 X110.02 Y123.703 I.974 J-1.679 E.00314
; LINE_WIDTH: 0.176816
G2 X110.204 Y123.744 I.254 J-.711 E.00119
; LINE_WIDTH: 0.143737
G1 X110.355 Y123.774 E.00077
; LINE_WIDTH: 0.120389
G1 X110.411 Y123.782 E.00023
; LINE_WIDTH: 0.0933589
G2 X110.802 Y123.802 I.395 J-3.956 E.00115
; WIPE_START
G1 F15000
G1 X110.411 Y123.782 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.56 Y117.376 Z5.2 F42000
G1 X116.469 Y114.43 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2007
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.021 I2.29 J.881 E.03332
G1 X116.469 Y114.37 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.171 Y114.18 E-.10407
G1 X115.321 Y113.928 E-.11147
G1 X115.335 Y113.91 E-.00862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.527 Y112.999 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G3 X117.399 Y112.861 I.858 J2.596 E.01439
G3 X118.152 Y113 I-.141 J2.879 E.01248
G1 X116.587 Y112.999 E.02541
; WIPE_START
G1 F3600
M204 S6000
G1 X116.998 Y112.884 E-.16208
G1 X117.399 Y112.861 E-.15262
G1 X117.869 Y112.919 E-.18011
G1 X118.152 Y113 E-.11186
G1 X117.749 Y113 E-.15333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-.993 J2.23 E.0312
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04965
G1 X118.73 Y113.298 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.491 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X119.688 Y114.643 E.0026
G3 X119.639 Y116.113 I-2.438 J.654 E.02423
G1 X119.639 Y114.551 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X119.688 Y114.643 E-.03977
G1 X119.77 Y115.095 E-.17431
G1 X119.777 Y115.399 E-.11576
G1 X119.75 Y115.673 E-.10449
G1 X119.639 Y116.113 E-.17256
G1 X119.639 Y115.71 E-.1531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.549 Y116.334 E.00289
G3 X118.209 Y117.579 I-2.225 J-1.05 E.03043
G1 X118.209 Y116.23 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.549 Y116.334 E-.06753
G1 X119.338 Y116.688 E-.15664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y117.6 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X118.15 Y117.601 E.0263
G3 X116.587 Y117.619 I-.808 J-2.371 E.0258
; WIPE_START
G1 F3600
M204 S6000
G1 X118.15 Y117.601 E-.59379
G1 X117.771 Y117.701 E-.14873
G1 X117.726 Y117.705 E-.01749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X116.469 Y117.578 E.02287
G3 X115.06 Y116.17 I.878 J-2.288 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53565
G1 X116.263 Y117.49 E-.085
G1 X116.008 Y117.345 E-.11145
G1 X115.951 Y117.299 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X115.039 Y116.109 E.02629
G3 X115.02 Y114.547 I2.308 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.109 E-.59381
G1 X114.946 Y115.78 E-.12993
G1 X114.935 Y115.685 E-.03626
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 49/53
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.762 J.949 P1  F42000
G1 X125.114 Y107.517 Z5.2
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X125.118 Y107.521 E.00009
G3 X125.628 Y108.743 I-1.231 J1.231 E.02207
G1 X125.628 Y121.857 E.21293
G3 X123.895 Y123.589 I-1.74 J-.008 E.04414
G1 X110.782 Y123.589 E.21293
G3 X109.049 Y121.857 I.008 J-1.74 E.04414
G1 X109.049 Y108.743 E.21293
G3 X110.782 Y107.011 I1.74 J.008 E.04414
G1 X123.895 Y107.011 E.21293
G3 X124.854 Y107.304 I-.008 J1.74 E.01651
G1 X125.068 Y107.479 E.00449
; WIPE_START
G1 F3600
M204 S6000
G1 X125.118 Y107.521 E-.02486
G1 X125.335 Y107.785 E-.12991
G1 X125.496 Y108.086 E-.12991
G1 X125.595 Y108.413 E-.12992
G1 X125.628 Y108.743 E-.12595
G1 X125.628 Y109.321 E-.21945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.148 Y116.938 Z5.3 F42000
G1 X124.701 Y124.028 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G3 X124.352 Y124.063 I-.345 J-1.71 E.00571
G1 X110.325 Y124.063 E.22776
G3 X108.576 Y122.313 I-.005 J-1.745 E.04465
G1 X108.576 Y108.287 E.22776
G3 X110.325 Y106.537 I1.745 J-.005 E.04465
G1 X124.352 Y106.537 E.22776
G1 X124.699 Y106.572 E.00566
G1 X124.701 Y106.572 E.00004
G3 X126.101 Y108.287 I-.369 J1.73 E.03884
G1 X126.101 Y122.313 E.22776
G3 X124.76 Y124.015 I-1.745 J.005 E.03797
; WIPE_START
G1 F3600
M204 S6000
G1 X124.352 Y124.063 E-.15602
G1 X122.763 Y124.063 E-.60398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 49 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.3
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer49 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X122.763 Y123.826 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0822724
G1 F2559
M204 S6000
G1 X110.772 Y123.826 E.02971
G1 X110.407 Y123.808 E.00091
; LINE_WIDTH: 0.14384
G3 X110.186 Y123.768 I.266 J-2.1 E.00112
; LINE_WIDTH: 0.182076
G1 X110.034 Y123.738 E.00102
; LINE_WIDTH: 0.197768
G1 X110.004 Y123.728 E.00023
; LINE_WIDTH: 0.223473
G1 X109.773 Y123.632 E.00205
; LINE_WIDTH: 0.266118
G3 X109.07 Y122.984 I.68 J-1.444 E.00968
; LINE_WIDTH: 0.232026
G3 X108.911 Y122.635 I1.691 J-.98 E.00329
; LINE_WIDTH: 0.184752
G3 X108.871 Y122.453 I.689 J-.248 E.00125
; LINE_WIDTH: 0.151643
G1 X108.84 Y122.3 E.00082
; LINE_WIDTH: 0.127667
G1 X108.831 Y122.241 E.00026
; LINE_WIDTH: 0.081817
G3 X108.813 Y121.87 I3.778 J-.377 E.00091
G1 X108.813 Y108.73 E.03231
; LINE_WIDTH: 0.0992509
G1 X108.831 Y108.368 E.00115
; LINE_WIDTH: 0.14384
G3 X108.871 Y108.147 I2.1 J.266 E.00112
; LINE_WIDTH: 0.182076
G1 X108.901 Y107.995 E.00102
; LINE_WIDTH: 0.197768
G1 X108.911 Y107.965 E.00023
; LINE_WIDTH: 0.223473
G1 X109.006 Y107.734 E.00205
; LINE_WIDTH: 0.266118
G3 X109.655 Y107.031 I1.444 J.68 E.00968
; LINE_WIDTH: 0.232026
G3 X110.004 Y106.872 I.98 J1.691 E.00329
; LINE_WIDTH: 0.184752
G3 X110.186 Y106.832 I.248 J.689 E.00125
; LINE_WIDTH: 0.151643
G1 X110.338 Y106.802 E.00082
; LINE_WIDTH: 0.127667
G1 X110.397 Y106.793 E.00026
; LINE_WIDTH: 0.0822724
G3 X110.769 Y106.774 I.377 J3.778 E.00092
G1 X123.906 Y106.774 E.03255
G1 X124.27 Y106.792 E.00091
; LINE_WIDTH: 0.143842
G3 X124.491 Y106.832 I-.266 J2.1 E.00112
; LINE_WIDTH: 0.182084
G1 X124.644 Y106.862 E.00102
; LINE_WIDTH: 0.19777
G1 X124.674 Y106.872 E.00023
; LINE_WIDTH: 0.223476
G1 X124.904 Y106.968 E.00205
; LINE_WIDTH: 0.266116
G3 X125.608 Y107.616 I-.68 J1.444 E.00968
; LINE_WIDTH: 0.232026
G3 X125.766 Y107.965 I-1.691 J.98 E.00329
; LINE_WIDTH: 0.184752
G3 X125.807 Y108.147 I-.689 J.248 E.00125
; LINE_WIDTH: 0.151643
G1 X125.837 Y108.3 E.00082
; LINE_WIDTH: 0.127667
G1 X125.846 Y108.359 E.00026
; LINE_WIDTH: 0.0822724
G3 X125.865 Y108.73 I-3.778 J.377 E.00092
G1 X125.865 Y121.867 E.03255
G1 X125.847 Y122.232 E.00091
; LINE_WIDTH: 0.14384
G3 X125.807 Y122.453 I-2.1 J-.266 E.00112
; LINE_WIDTH: 0.182076
G1 X125.776 Y122.605 E.00102
; LINE_WIDTH: 0.197768
G1 X125.766 Y122.635 E.00023
; LINE_WIDTH: 0.223473
G1 X125.671 Y122.866 E.00205
; LINE_WIDTH: 0.266118
G3 X125.023 Y123.569 I-1.444 J-.68 E.00968
; LINE_WIDTH: 0.232026
G3 X124.674 Y123.728 I-.98 J-1.691 E.00329
; LINE_WIDTH: 0.184752
G3 X124.491 Y123.768 I-.248 J-.689 E.00125
; LINE_WIDTH: 0.151643
G1 X124.339 Y123.798 E.00082
; LINE_WIDTH: 0.127667
G1 X124.28 Y123.807 E.00026
; LINE_WIDTH: 0.0822724
G3 X123.908 Y123.826 I-.377 J-3.778 E.00092
G1 X122.823 Y123.826 E.00269
; WIPE_START
G1 F15000
G1 X120.823 Y123.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.614 Y116.901 Z5.3 F42000
G1 X116.469 Y114.43 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2559
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.336 J.927 E.03326
G1 X116.469 Y114.37 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53559
G1 X115.266 Y114.013 E-.17677
G1 X115.336 Y113.909 E-.04764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G3 X117.583 Y112.872 I.854 J2.681 E.01732
G3 X118.147 Y113 I-.607 J3.995 E.0094
G1 X116.59 Y112.998 E.02528
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16179
G1 X117.193 Y112.865 E-.07353
G1 X117.583 Y112.872 E-.14823
G1 X117.868 Y112.918 E-.10979
G1 X118.147 Y113 E-.11047
M73 P95 R1
G1 X117.736 Y113 E-.15618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X118.209 Y113.022 E.02287
G1 X118.241 Y113.033 E.00055
G3 X119.617 Y114.43 I-.916 J2.279 E.03277
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53565
G1 X118.241 Y113.033 E-.01286
G1 X118.424 Y113.115 E-.07638
G1 X118.729 Y113.297 E-.1351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X119.685 Y114.63 E.00239
G3 X119.639 Y116.11 I-2.426 J.666 E.02442
G1 X119.639 Y114.55 E.02534
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03489
G1 X119.77 Y115.097 E-.1805
G1 X119.777 Y115.399 E-.11483
G1 X119.749 Y115.675 E-.10543
G1 X119.639 Y116.11 E-.17067
G1 X119.639 Y115.706 E-.15368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
M73 P95 R0
G1 X119.617 Y116.17 E.02287
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.578 I-2.276 J-1.107 E.03038
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53559
G1 X119.549 Y116.334 E-.06748
G1 X119.337 Y116.689 E-.15693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.056 Y117.632 E.00157
G3 X116.582 Y117.619 I-.716 J-2.342 E.02431
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59479
G1 X118.056 Y117.632 E-.03685
G1 X117.726 Y117.706 E-.12836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.874 J-2.284 E.03331
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.253 Y117.485 E-.08911
G1 X115.947 Y117.302 E-.13552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2559
M204 S5000
G1 X115.039 Y116.11 E.02631
G3 X115.02 Y114.546 I2.317 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59417
G1 X114.93 Y115.687 E-.16583
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 50/53
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.3 I.762 J.949 P1  F42000
G1 X125.132 Y107.498 Z5.3
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X125.137 Y107.502 E.0001
G3 X125.65 Y108.734 I-1.239 J1.239 E.02222
G1 X125.65 Y121.866 E.21325
G3 X123.905 Y123.611 I-1.753 J-.008 E.04445
G1 X110.772 Y123.611 E.21325
G3 X109.027 Y121.866 I.008 J-1.753 E.04445
G1 X109.027 Y108.734 E.21325
G3 X110.772 Y106.989 I1.753 J.008 E.04445
G1 X123.905 Y106.989 E.21325
G3 X124.87 Y107.284 I-.008 J1.753 E.01663
G1 X125.085 Y107.46 E.00451
; WIPE_START
G1 F3600
M204 S6000
G1 X125.137 Y107.502 E-.02518
G1 X125.355 Y107.768 E-.13082
G1 X125.517 Y108.072 E-.13082
G1 X125.617 Y108.401 E-.13083
G1 X125.65 Y108.734 E-.12685
G1 X125.65 Y109.301 E-.21549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.169 Y116.918 Z5.4 F42000
G1 X124.718 Y124.057 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X124.369 Y124.091 E.00569
G1 X110.308 Y124.091 E.22832
G3 X108.548 Y122.33 I-.005 J-1.756 E.04494
G1 X108.548 Y108.27 E.22832
G3 X110.308 Y106.509 I1.756 J-.005 E.04494
G1 X124.369 Y106.509 E.22832
G1 X124.72 Y106.544 E.00574
G3 X126.13 Y108.27 I-.372 J1.742 E.03909
G1 X126.13 Y122.33 E.22832
G3 X124.776 Y124.044 I-1.756 J.005 E.03827
; WIPE_START
G1 F3600
M204 S6000
G1 X124.369 Y124.091 E-.15578
G1 X122.779 Y124.091 E-.60422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 50 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer50 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X122.779 Y123.851 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0886616
G1 F2566
M204 S6000
G1 X110.762 Y123.851 E.0329
G3 X110.384 Y123.832 I2.936 J-62.197 E.00104
; LINE_WIDTH: 0.152432
G3 X110.168 Y123.792 I.298 J-2.221 E.00117
; LINE_WIDTH: 0.190147
G1 X110.015 Y123.762 E.00107
; LINE_WIDTH: 0.205989
G1 X109.987 Y123.752 E.00022
; LINE_WIDTH: 0.232033
G1 X109.753 Y123.656 E.00217
; LINE_WIDTH: 0.275288
G3 X109.046 Y123.003 I.685 J-1.453 E.01011
; LINE_WIDTH: 0.240582
G3 X108.886 Y122.651 I1.702 J-.985 E.00345
; LINE_WIDTH: 0.192691
G3 X108.846 Y122.47 I.661 J-.241 E.0013
; LINE_WIDTH: 0.159546
G1 X108.816 Y122.317 E.00088
; LINE_WIDTH: 0.134933
G1 X108.807 Y122.254 E.00029
; LINE_WIDTH: 0.0881747
G3 X108.788 Y121.88 I3.77 J-.378 E.00102
G1 X108.788 Y108.72 E.03577
; LINE_WIDTH: 0.106238
G3 X108.807 Y108.346 I3.789 J.004 E.0013
; LINE_WIDTH: 0.152432
G3 X108.846 Y108.13 I2.221 J.298 E.00117
; LINE_WIDTH: 0.190147
G1 X108.877 Y107.977 E.00107
; LINE_WIDTH: 0.205989
G1 X108.886 Y107.949 E.00022
; LINE_WIDTH: 0.232033
G1 X108.983 Y107.715 E.00217
; LINE_WIDTH: 0.275288
G3 X109.636 Y107.007 I1.453 J.685 E.01011
; LINE_WIDTH: 0.240582
G3 X109.987 Y106.848 I.985 J1.702 E.00345
; LINE_WIDTH: 0.192691
G3 X110.168 Y106.808 I.241 J.661 E.0013
; LINE_WIDTH: 0.159546
G1 X110.322 Y106.777 E.00088
; LINE_WIDTH: 0.134933
G1 X110.384 Y106.768 E.00029
; LINE_WIDTH: 0.0886616
G3 X110.759 Y106.749 I.378 J3.77 E.00103
G1 X123.915 Y106.749 E.03602
G3 X124.293 Y106.768 I-2.936 J62.197 E.00104
; LINE_WIDTH: 0.152431
G3 X124.509 Y106.808 I-.298 J2.221 E.00117
; LINE_WIDTH: 0.190142
G1 X124.662 Y106.838 E.00107
; LINE_WIDTH: 0.205988
G1 X124.69 Y106.848 E.00022
; LINE_WIDTH: 0.232032
G1 X124.924 Y106.944 E.00217
; LINE_WIDTH: 0.27529
G3 X125.631 Y107.597 I-.685 J1.453 E.01011
; LINE_WIDTH: 0.240582
G3 X125.791 Y107.949 I-1.702 J.985 E.00345
; LINE_WIDTH: 0.192691
G3 X125.831 Y108.13 I-.661 J.241 E.0013
; LINE_WIDTH: 0.159546
G1 X125.861 Y108.283 E.00088
; LINE_WIDTH: 0.134933
G1 X125.871 Y108.346 E.00029
; LINE_WIDTH: 0.0886616
G3 X125.89 Y108.72 I-3.77 J.378 E.00103
G1 X125.89 Y121.877 E.03602
G3 X125.871 Y122.254 I-62.197 J-2.936 E.00104
; LINE_WIDTH: 0.152432
G3 X125.831 Y122.47 I-2.221 J-.298 E.00117
; LINE_WIDTH: 0.190147
G1 X125.801 Y122.623 E.00107
; LINE_WIDTH: 0.205989
G1 X125.791 Y122.651 E.00022
; LINE_WIDTH: 0.232033
G1 X125.694 Y122.885 E.00217
; LINE_WIDTH: 0.275288
G3 X125.041 Y123.593 I-1.453 J-.685 E.01011
; LINE_WIDTH: 0.240582
G3 X124.69 Y123.752 I-.985 J-1.702 E.00345
; LINE_WIDTH: 0.192691
G3 X124.509 Y123.792 I-.241 J-.661 E.0013
; LINE_WIDTH: 0.159546
G1 X124.356 Y123.823 E.00088
; LINE_WIDTH: 0.134933
G1 X124.293 Y123.832 E.00029
; LINE_WIDTH: 0.0886616
G3 X123.919 Y123.851 I-.378 J-3.77 E.00103
G1 X122.839 Y123.851 E.00296
; WIPE_START
G1 F15000
G1 X120.839 Y123.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.627 Y116.927 Z5.4 F42000
G1 X116.469 Y114.43 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2566
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.021 I2.335 J.925 E.03326
G1 X116.469 Y114.37 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53565
G1 X115.267 Y114.011 E-.17764
G1 X115.336 Y113.909 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y112.998 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G3 X117.583 Y112.872 I.854 J2.68 E.01733
G3 X118.152 Y113 I-.26 J2.493 E.00949
G1 X116.59 Y112.998 E.02537
; WIPE_START
G1 F3600
M204 S6000
G1 X117 Y112.884 E-.16193
G1 X117.193 Y112.865 E-.07374
G1 X117.583 Y112.872 E-.1482
G1 X117.87 Y112.919 E-.11033
G1 X118.152 Y113 E-.11173
G1 X117.747 Y113 E-.15407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.07 E.00212
G3 X119.617 Y114.43 I-1.034 J2.269 E.03117
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.07 E-.04951
G1 X118.73 Y113.298 E-.17511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X119.685 Y114.63 E.00238
G3 X119.639 Y116.11 I-2.426 J.666 E.02442
G1 X119.639 Y114.55 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03487
G1 X119.771 Y115.108 E-.18487
G1 X119.777 Y115.399 E-.11048
G1 X119.749 Y115.678 E-.10641
G1 X119.639 Y116.11 E-.16966
G1 X119.639 Y115.706 E-.15371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X119.617 Y116.17 E.02287
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.579 I-2.248 J-1.075 E.03041
M73 P96 R0
G1 X118.209 Y116.23 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53564
G1 X119.549 Y116.334 E-.06749
G1 X119.337 Y116.689 E-.15687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X118.15 Y117.601 E.02638
G3 X116.582 Y117.619 I-.811 J-2.378 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.15 Y117.601 E-.5958
G1 X117.764 Y117.702 E-.15142
G1 X117.731 Y117.705 E-.01279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.863 J-2.273 E.03332
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53543
G1 X116.091 Y117.397 E-.15917
G1 X115.947 Y117.303 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2566
M204 S5000
G1 X115.039 Y116.11 E.02631
G3 X115.02 Y114.546 I2.315 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59416
G1 X114.93 Y115.687 E-.16584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 51/53
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.762 J.949 P1  F42000
G1 X125.149 Y107.479 Z5.4
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X125.155 Y107.484 E.00012
G3 X125.672 Y108.724 I-1.248 J1.248 E.02238
G1 X125.672 Y121.876 E.21357
G3 X123.915 Y123.633 I-1.765 J-.008 E.04476
G1 X110.762 Y123.633 E.21357
G3 X109.005 Y121.876 I.008 J-1.765 E.04476
G1 X109.005 Y108.724 E.21357
G3 X110.762 Y106.967 I1.765 J.008 E.04476
G1 X123.915 Y106.967 E.21357
G3 X124.887 Y107.264 I-.008 J1.765 E.01674
G1 X125.103 Y107.441 E.00454
; WIPE_START
G1 F3600
M204 S6000
G1 X125.155 Y107.484 E-.02553
G1 X125.375 Y107.752 E-.13175
G1 X125.538 Y108.057 E-.13171
G1 X125.639 Y108.389 E-.13173
G1 X125.672 Y108.724 E-.12777
G1 X125.672 Y109.28 E-.21151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.189 Y116.898 Z5.5 F42000
G1 X124.734 Y124.085 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X124.386 Y124.119 E.00568
G1 X110.291 Y124.119 E.22887
G3 X108.519 Y122.347 I-.004 J-1.768 E.04523
G1 X108.519 Y108.253 E.22887
G3 X110.291 Y106.481 I1.768 J-.004 E.04523
G1 X124.386 Y106.481 E.22887
G1 X124.727 Y106.514 E.00557
G3 X126.158 Y108.253 I-.359 J1.753 E.03954
G1 X126.158 Y122.347 E.22887
G3 X124.792 Y124.073 I-1.768 J.004 E.03857
; WIPE_START
G1 F3600
M204 S6000
G1 X124.386 Y124.119 E-.1555
G1 X122.795 Y124.119 E-.6045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 51 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.5
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer51 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X122.795 Y123.876 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0950087
G1 F2571
M204 S6000
G1 X110.752 Y123.876 E.03609
G1 X110.382 Y123.858 E.00111
; LINE_WIDTH: 0.140688
G1 X110.305 Y123.847 E.00038
; LINE_WIDTH: 0.167437
G1 X110.151 Y123.817 E.00093
; LINE_WIDTH: 0.198192
G1 X109.997 Y123.786 E.00113
; LINE_WIDTH: 0.22556
G3 X109.852 Y123.728 I.349 J-1.079 E.0013
; LINE_WIDTH: 0.253156
G1 X109.734 Y123.679 E.00121
; LINE_WIDTH: 0.284917
G3 X109.034 Y123.042 I.814 J-1.596 E.01028
; LINE_WIDTH: 0.260175
G3 X108.911 Y122.786 I1.572 J-.919 E.00276
; LINE_WIDTH: 0.228019
G1 X108.862 Y122.668 E.00108
; LINE_WIDTH: 0.200599
G3 X108.822 Y122.488 I.643 J-.235 E.00135
; LINE_WIDTH: 0.167437
G1 X108.791 Y122.334 E.00093
; LINE_WIDTH: 0.142219
G1 X108.782 Y122.267 E.00033
; LINE_WIDTH: 0.0945427
G3 X108.763 Y121.89 I3.839 J-.383 E.00113
G1 X108.763 Y108.71 E.03925
; LINE_WIDTH: 0.112212
G1 X108.781 Y108.343 E.00136
; LINE_WIDTH: 0.140688
G1 X108.791 Y108.266 E.00038
; LINE_WIDTH: 0.167437
G1 X108.822 Y108.112 E.00093
; LINE_WIDTH: 0.198192
G1 X108.853 Y107.958 E.00113
; LINE_WIDTH: 0.225558
G3 X108.911 Y107.814 I1.079 J.349 E.0013
; LINE_WIDTH: 0.253148
G1 X108.96 Y107.695 E.00121
; LINE_WIDTH: 0.284914
G3 X109.597 Y106.996 I1.596 J.814 E.01028
; LINE_WIDTH: 0.260175
G3 X109.852 Y106.872 I.919 J1.573 E.00276
; LINE_WIDTH: 0.228019
G1 X109.971 Y106.823 E.00108
; LINE_WIDTH: 0.200599
G3 X110.151 Y106.783 I.235 J.643 E.00135
; LINE_WIDTH: 0.167437
G1 X110.305 Y106.753 E.00093
; LINE_WIDTH: 0.142219
G1 X110.371 Y106.743 E.00033
; LINE_WIDTH: 0.0950369
G3 X110.749 Y106.724 I.383 J3.839 E.00113
G1 X123.925 Y106.724 E.0395
G3 X124.306 Y106.743 I-2.826 J59.974 E.00114
; LINE_WIDTH: 0.159299
G3 X124.521 Y106.782 I-.294 J2.207 E.00123
; LINE_WIDTH: 0.196528
G1 X124.669 Y106.812 E.00108
; LINE_WIDTH: 0.223166
G3 X124.826 Y106.873 I-.307 J1.016 E.00138
; LINE_WIDTH: 0.252677
G1 X124.945 Y106.922 E.00122
; LINE_WIDTH: 0.284951
G3 X125.643 Y107.558 I-.815 J1.595 E.01026
; LINE_WIDTH: 0.260175
G3 X125.767 Y107.814 I-1.573 J.919 E.00276
; LINE_WIDTH: 0.228019
G1 X125.816 Y107.932 E.00108
; LINE_WIDTH: 0.200599
G3 X125.855 Y108.112 I-.643 J.235 E.00135
; LINE_WIDTH: 0.167437
G1 X125.886 Y108.266 E.00093
; LINE_WIDTH: 0.142219
G1 X125.896 Y108.333 E.00033
; LINE_WIDTH: 0.0950087
G3 X125.915 Y108.71 I-3.839 J.383 E.00113
G1 X125.915 Y121.886 E.03948
G1 X125.897 Y122.257 E.00111
; LINE_WIDTH: 0.140688
G1 X125.886 Y122.334 E.00038
; LINE_WIDTH: 0.167437
G1 X125.855 Y122.488 E.00093
; LINE_WIDTH: 0.198192
G1 X125.825 Y122.642 E.00113
; LINE_WIDTH: 0.225558
G3 X125.767 Y122.786 I-1.079 J-.349 E.0013
; LINE_WIDTH: 0.253148
G1 X125.718 Y122.905 E.00121
; LINE_WIDTH: 0.284914
G3 X125.081 Y123.604 I-1.596 J-.814 E.01028
; LINE_WIDTH: 0.260175
G3 X124.825 Y123.728 I-.919 J-1.573 E.00276
; LINE_WIDTH: 0.228019
G1 X124.706 Y123.777 E.00108
; LINE_WIDTH: 0.200599
G3 X124.526 Y123.817 I-.235 J-.643 E.00135
; LINE_WIDTH: 0.167437
G1 X124.372 Y123.847 E.00093
; LINE_WIDTH: 0.142219
G1 X124.306 Y123.857 E.00033
; LINE_WIDTH: 0.0950087
G3 X123.929 Y123.876 I-.383 J-3.839 E.00113
G1 X122.855 Y123.876 E.00322
; WIPE_START
G1 F15000
G1 X120.855 Y123.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.641 Y116.954 Z5.5 F42000
G1 X116.469 Y114.43 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2571
M204 S5000
G1 X115.06 Y114.43 E.02287
G3 X116.469 Y113.022 I2.272 J.864 E.03332
G1 X116.469 Y114.37 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.5357
G1 X115.218 Y114.094 E-.14093
G1 X115.321 Y113.927 E-.07465
G1 X115.336 Y113.91 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.531 Y113 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G3 X117.583 Y112.872 I.851 J2.611 E.01732
G3 X118.153 Y113 I-.318 J2.756 E.0095
G1 X116.591 Y113 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X116.809 Y112.918 E-.08859
G1 X117 Y112.884 E-.07375
G1 X117.193 Y112.865 E-.0737
G1 X117.583 Y112.872 E-.14811
G1 X117.868 Y112.918 E-.10971
G1 X118.153 Y113 E-.11256
G1 X117.748 Y113 E-.15359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.618 Y114.43 I-1.008 J2.245 E.0312
G1 X118.269 Y114.43 E.02191
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53542
G1 X118.33 Y113.071 E-.0496
G1 X118.73 Y113.298 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X119.685 Y114.63 E.00238
G3 X119.639 Y116.11 I-2.424 J.666 E.02441
G1 X119.639 Y114.55 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03488
G1 X119.77 Y115.102 E-.18243
G1 X119.777 Y115.399 E-.11292
G1 X119.749 Y115.68 E-.10737
G1 X119.639 Y116.11 E-.16853
G1 X119.639 Y115.705 E-.15387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.578 I-2.219 J-1.047 E.03042
G1 X118.209 Y116.23 E.02188
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53583
G1 X119.549 Y116.334 E-.06745
G1 X119.338 Y116.688 E-.15672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X118.148 Y117.602 E.02635
G3 X116.582 Y117.619 I-.809 J-2.307 E.02589
; WIPE_START
G1 F3600
M204 S6000
G1 X118.148 Y117.602 E-.59513
G1 X117.767 Y117.702 E-.14977
G1 X117.727 Y117.705 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.863 J-2.272 E.03332
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.096 Y117.4 E-.15679
G1 X115.947 Y117.303 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F2571
M204 S5000
G1 X115.039 Y116.11 E.02631
G3 X115.02 Y114.547 I2.31 J-.81 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59409
G1 X114.946 Y115.78 E-.13018
G1 X114.935 Y115.687 E-.03572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 52/53
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.5 I.763 J.948 P1  F42000
G1 X125.167 Y107.46 Z5.5
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X125.173 Y107.465 E.00013
G3 X125.694 Y108.714 I-1.256 J1.257 E.02254
G1 X125.694 Y121.886 E.21388
G3 X123.925 Y123.655 I-1.777 J-.008 E.04507
G1 X110.753 Y123.655 E.21388
G3 X108.984 Y121.886 I.008 J-1.777 E.04507
G1 X108.984 Y108.714 E.21388
G3 X110.753 Y106.945 I1.777 J.008 E.04507
G1 X123.924 Y106.945 E.21388
G3 X124.903 Y107.244 I-.008 J1.777 E.01686
G1 X125.121 Y107.422 E.00456
; WIPE_START
G1 F3600
M204 S6000
G1 X125.173 Y107.465 E-.02589
G1 X125.395 Y107.735 E-.13266
G1 X125.559 Y108.043 E-.13257
G1 X125.661 Y108.377 E-.13265
G1 X125.694 Y108.714 E-.12871
M73 P97 R0
G1 X125.694 Y109.26 E-.20752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.21 Y116.877 Z5.6 F42000
G1 X124.75 Y124.113 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X124.403 Y124.148 E.00566
G1 X110.274 Y124.148 E.22942
G3 X108.491 Y122.364 I-.005 J-1.779 E.04552
G1 X108.491 Y108.236 E.22942
G3 X110.274 Y106.452 I1.779 J-.005 E.04552
G1 X124.403 Y106.452 E.22942
G1 X124.752 Y106.487 E.00569
G3 X126.186 Y108.236 I-.367 J1.764 E.03971
G1 X126.186 Y122.364 E.22942
G3 X124.808 Y124.102 I-1.779 J.005 E.03888
; WIPE_START
G1 F3600
M204 S6000
G1 X124.403 Y124.148 E-.15501
G1 X122.811 Y124.148 E-.60499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 52 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer52 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X122.811 Y123.901 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101373
G1 F2577
M204 S6000
G1 X110.743 Y123.901 E.03929
G1 X110.37 Y123.883 E.00122
; LINE_WIDTH: 0.147885
G1 X110.288 Y123.872 E.00042
; LINE_WIDTH: 0.175343
G1 X110.133 Y123.841 E.00099
; LINE_WIDTH: 0.206269
G1 X109.979 Y123.81 E.00119
; LINE_WIDTH: 0.234142
G3 X109.834 Y123.752 I.383 J-1.16 E.00135
; LINE_WIDTH: 0.261916
G1 X109.714 Y123.702 E.00127
; LINE_WIDTH: 0.294132
G3 X109.011 Y123.061 I.82 J-1.606 E.0107
; LINE_WIDTH: 0.268967
G3 X108.887 Y122.804 I1.563 J-.915 E.00288
; LINE_WIDTH: 0.236435
G1 X108.837 Y122.684 E.00114
; LINE_WIDTH: 0.208545
G1 X108.798 Y122.505 E.0014
; LINE_WIDTH: 0.175353
G1 X108.767 Y122.351 E.00099
; LINE_WIDTH: 0.149504
G1 X108.757 Y122.281 E.00037
; LINE_WIDTH: 0.100901
G3 X108.737 Y121.9 I3.831 J-.385 E.00123
G1 X108.737 Y108.7 E.04272
; LINE_WIDTH: 0.118698
G1 X108.756 Y108.331 E.00146
; LINE_WIDTH: 0.14789
G1 X108.767 Y108.249 E.00042
; LINE_WIDTH: 0.175342
G1 X108.798 Y108.095 E.00099
; LINE_WIDTH: 0.206265
G1 X108.829 Y107.94 E.00119
; LINE_WIDTH: 0.234135
G3 X108.887 Y107.796 I1.167 J.386 E.00135
; LINE_WIDTH: 0.261913
G1 X108.936 Y107.676 E.00127
; LINE_WIDTH: 0.294132
G3 X109.577 Y106.972 I1.606 J.82 E.0107
; LINE_WIDTH: 0.268967
G3 X109.834 Y106.848 I.915 J1.563 E.00288
; LINE_WIDTH: 0.236435
G1 X109.954 Y106.798 E.00114
; LINE_WIDTH: 0.208545
G1 X110.133 Y106.759 E.0014
; LINE_WIDTH: 0.175353
G1 X110.288 Y106.728 E.00099
; LINE_WIDTH: 0.149504
G1 X110.358 Y106.718 E.00037
; LINE_WIDTH: 0.101373
G3 X110.739 Y106.699 I.385 J3.831 E.00124
G1 X123.935 Y106.699 E.04297
G1 X124.308 Y106.717 E.00122
; LINE_WIDTH: 0.147885
G1 X124.389 Y106.728 E.00042
; LINE_WIDTH: 0.175007
G1 X124.541 Y106.759 E.00097
; LINE_WIDTH: 0.20526
G1 X124.692 Y106.789 E.00116
; LINE_WIDTH: 0.232646
G3 X124.843 Y106.849 I-.333 J1.06 E.0014
; LINE_WIDTH: 0.2616
G1 X124.964 Y106.898 E.00128
; LINE_WIDTH: 0.294155
G3 X125.666 Y107.539 I-.82 J1.605 E.01069
; LINE_WIDTH: 0.268967
G3 X125.791 Y107.796 I-1.563 J.915 E.00288
; LINE_WIDTH: 0.236435
G1 X125.84 Y107.916 E.00114
; LINE_WIDTH: 0.208544
G1 X125.879 Y108.095 E.0014
; LINE_WIDTH: 0.17535
G1 X125.91 Y108.249 E.00099
; LINE_WIDTH: 0.149504
G1 X125.921 Y108.319 E.00037
; LINE_WIDTH: 0.101373
G3 X125.94 Y108.7 I-3.833 J.385 E.00124
G1 X125.94 Y121.896 E.04297
G1 X125.922 Y122.269 E.00122
; LINE_WIDTH: 0.14789
G1 X125.91 Y122.351 E.00042
; LINE_WIDTH: 0.175342
G1 X125.879 Y122.505 E.00099
; LINE_WIDTH: 0.206265
G1 X125.849 Y122.66 E.00119
; LINE_WIDTH: 0.234135
G3 X125.791 Y122.804 I-1.167 J-.386 E.00135
; LINE_WIDTH: 0.261913
G1 X125.741 Y122.924 E.00127
; LINE_WIDTH: 0.294132
G3 X125.1 Y123.628 I-1.606 J-.82 E.0107
; LINE_WIDTH: 0.268967
G3 X124.843 Y123.752 I-.915 J-1.563 E.00288
; LINE_WIDTH: 0.236435
G1 X124.723 Y123.802 E.00114
; LINE_WIDTH: 0.208545
G1 X124.544 Y123.841 E.0014
; LINE_WIDTH: 0.175353
G1 X124.389 Y123.872 E.00099
; LINE_WIDTH: 0.149504
G1 X124.319 Y123.882 E.00037
; LINE_WIDTH: 0.101373
G3 X123.939 Y123.901 I-.385 J-3.831 E.00124
G1 X122.871 Y123.901 E.00348
; WIPE_START
G1 F15000
G1 X120.871 Y123.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.654 Y116.98 Z5.6 F42000
G1 X116.469 Y114.43 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2577
M204 S5000
G1 X115.061 Y114.43 E.02285
G3 X116.469 Y113.022 I2.333 J.924 E.03324
G1 X116.469 Y114.37 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.061 Y114.43 E-.53526
G1 X115.172 Y114.178 E-.1048
G1 X115.321 Y113.928 E-.11051
G1 X115.337 Y113.909 E-.00943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y113 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G3 X117.583 Y112.872 I.809 J2.268 E.01736
G3 X118.152 Y113 I-.257 J2.479 E.0095
G1 X116.59 Y113 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X116.716 Y112.941 E-.05295
G1 X116.998 Y112.884 E-.10913
G1 X117.193 Y112.865 E-.07456
G1 X117.583 Y112.872 E-.14808
G1 X117.87 Y112.919 E-.11052
G1 X118.152 Y113 E-.11164
G1 X117.749 Y113 E-.15312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.065 J2.299 E.03114
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.04955
G1 X118.73 Y113.299 E-.17507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X119.686 Y114.633 E.00244
G3 X119.639 Y116.11 I-2.506 J.659 E.02432
G1 X119.639 Y114.55 E.02532
; WIPE_START
G1 F3600
M204 S6000
G1 X119.686 Y114.633 E-.03622
G1 X119.771 Y115.104 E-.18191
G1 X119.777 Y115.397 E-.1112
G1 X119.747 Y115.688 E-.11118
G1 X119.639 Y116.11 E-.16545
G1 X119.639 Y115.704 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X119.616 Y116.17 E.02285
G1 X119.587 Y116.247 E.00133
G3 X118.209 Y117.578 I-2.261 J-.961 E.03197
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.616 Y116.17 E-.53532
G1 X119.587 Y116.247 E-.03116
G1 X119.356 Y116.672 E-.18406
G1 X119.34 Y116.691 E-.00945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.054 Y117.633 E.00161
G3 X116.582 Y117.619 I-.714 J-2.371 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.59478
G1 X118.054 Y117.633 E-.03761
G1 X117.773 Y117.701 E-.10968
G1 X117.726 Y117.705 E-.01793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.875 J-2.285 E.0333
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.26 Y117.488 E-.0863
G1 X115.947 Y117.302 E-.13832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.491 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2577
M204 S5000
G1 X115.039 Y116.11 E.02629
G3 X115.019 Y114.547 I2.306 J-.81 E.02583
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59376
G1 X114.946 Y115.78 E-.13011
G1 X114.935 Y115.686 E-.03614
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 53/53
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 66
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.763 J.948 P1  F42000
G1 X125.185 Y107.441 Z5.6
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X125.192 Y107.447 E.00015
G3 X125.716 Y108.704 I-1.265 J1.265 E.02269
G1 X125.716 Y121.896 E.21421
G3 X123.934 Y123.677 I-1.789 J-.008 E.04538
G1 X110.743 Y123.677 E.2142
G3 X108.962 Y121.896 I.008 J-1.789 E.04538
G1 X108.962 Y108.704 E.21421
G3 X110.743 Y106.923 I1.789 J.008 E.04538
G1 X123.934 Y106.923 E.2142
G3 X124.92 Y107.224 I-.008 J1.789 E.01698
G1 X125.138 Y107.403 E.00458
; WIPE_START
G1 F3600
M204 S6000
G1 X125.192 Y107.447 E-.02628
G1 X125.415 Y107.719 E-.13355
G1 X125.58 Y108.029 E-.13355
G1 X125.682 Y108.365 E-.13355
G1 X125.716 Y108.704 E-.12956
G1 X125.716 Y109.24 E-.20351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.23 Y116.857 Z5.7 F42000
G1 X124.765 Y124.142 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X124.42 Y124.176 E.00563
G1 X110.257 Y124.176 E.22997
G3 X108.463 Y122.381 I-.005 J-1.79 E.04581
G1 X108.463 Y108.219 E.22997
G3 X110.257 Y106.424 I1.79 J-.004 E.04581
G1 X124.42 Y106.424 E.22997
G1 X124.776 Y106.459 E.0058
G3 X126.215 Y108.219 I-.376 J1.775 E.03988
G1 X126.215 Y122.381 E.22997
G3 X124.823 Y124.131 I-1.79 J.004 E.0392
; WIPE_START
G1 F3600
M204 S6000
G1 X124.42 Y124.176 E-.15431
G1 X122.826 Y124.176 E-.60569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
M625
; object ids of layer 53 start: 66
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.7
G1 X0 Y128.743 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer53 end: 66
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X122.826 Y123.926 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107736
G1 F2583
M204 S6000
G1 X110.733 Y123.926 E.04251
G1 X110.357 Y123.908 E.00132
; LINE_WIDTH: 0.155069
G1 X110.271 Y123.896 E.00047
; LINE_WIDTH: 0.183235
G1 X110.116 Y123.865 E.00105
; LINE_WIDTH: 0.214306
G1 X109.96 Y123.834 E.00125
; LINE_WIDTH: 0.242671
G3 X109.816 Y123.776 I.446 J-1.31 E.0014
; LINE_WIDTH: 0.270633
G1 X109.695 Y123.726 E.00134
; LINE_WIDTH: 0.30333
G3 X108.988 Y123.081 I.826 J-1.615 E.01112
; LINE_WIDTH: 0.277747
G3 X108.863 Y122.822 I1.554 J-.911 E.003
; LINE_WIDTH: 0.244807
G1 X108.812 Y122.701 E.0012
; LINE_WIDTH: 0.216431
G1 X108.774 Y122.523 E.00144
; LINE_WIDTH: 0.183243
G1 X108.743 Y122.367 E.00105
; LINE_WIDTH: 0.156768
G1 X108.732 Y122.294 E.00041
; LINE_WIDTH: 0.125595
G3 X108.712 Y121.91 I3.888 J-.389 E.00163
G1 X108.712 Y121.906 E.00002
; LINE_WIDTH: 0.107245
G1 X108.712 Y108.694 E.04618
G1 X108.731 Y108.318 E.00131
; LINE_WIDTH: 0.155064
G1 X108.743 Y108.233 E.00047
; LINE_WIDTH: 0.183237
G1 X108.774 Y108.077 E.00105
; LINE_WIDTH: 0.214311
G1 X108.805 Y107.922 E.00125
; LINE_WIDTH: 0.24267
G3 X108.863 Y107.778 I1.316 J.449 E.0014
; LINE_WIDTH: 0.27062
G1 X108.913 Y107.656 E.00134
; LINE_WIDTH: 0.303332
G3 X109.558 Y106.949 I1.615 J.826 E.01112
; LINE_WIDTH: 0.277747
G3 X109.816 Y106.824 I.911 J1.554 E.003
; LINE_WIDTH: 0.244807
G1 X109.938 Y106.774 E.0012
; LINE_WIDTH: 0.216431
G1 X110.116 Y106.735 E.00144
; LINE_WIDTH: 0.183243
G1 X110.271 Y106.704 E.00105
; LINE_WIDTH: 0.156768
G1 X110.345 Y106.693 E.00041
; LINE_WIDTH: 0.107736
G3 X110.729 Y106.674 I.389 J3.888 E.00135
G1 X123.945 Y106.674 E.04646
G1 X124.32 Y106.692 E.00132
; LINE_WIDTH: 0.155067
G1 X124.406 Y106.704 E.00047
; LINE_WIDTH: 0.183123
G1 X124.56 Y106.735 E.00104
; LINE_WIDTH: 0.213971
G1 X124.715 Y106.765 E.00123
; LINE_WIDTH: 0.242148
G3 X124.861 Y106.824 I-.398 J1.201 E.00142
; LINE_WIDTH: 0.270519
G1 X124.983 Y106.875 E.00134
; LINE_WIDTH: 0.303336
G3 X125.69 Y107.519 I-.826 J1.615 E.01112
; LINE_WIDTH: 0.277736
G3 X125.815 Y107.778 I-1.555 J.911 E.003
; LINE_WIDTH: 0.244802
G1 X125.865 Y107.9 E.0012
; LINE_WIDTH: 0.216431
G1 X125.904 Y108.077 E.00144
; LINE_WIDTH: 0.183243
G1 X125.935 Y108.233 E.00105
; LINE_WIDTH: 0.156768
G1 X125.946 Y108.306 E.00041
; LINE_WIDTH: 0.107755
G3 X125.965 Y108.69 I-3.888 J.389 E.00135
G1 X125.965 Y121.906 E.04647
G1 X125.947 Y122.282 E.00132
; LINE_WIDTH: 0.155064
G1 X125.935 Y122.367 E.00047
; LINE_WIDTH: 0.183237
G1 X125.904 Y122.523 E.00105
; LINE_WIDTH: 0.214311
G1 X125.873 Y122.678 E.00125
; LINE_WIDTH: 0.24267
G3 X125.815 Y122.822 I-1.316 J-.449 E.0014
; LINE_WIDTH: 0.27062
G1 X125.764 Y122.944 E.00134
; LINE_WIDTH: 0.303332
G3 X125.119 Y123.651 I-1.615 J-.826 E.01112
; LINE_WIDTH: 0.277747
G3 X124.861 Y123.776 I-.911 J-1.554 E.003
; LINE_WIDTH: 0.244807
G1 X124.739 Y123.826 E.0012
; LINE_WIDTH: 0.216431
G1 X124.562 Y123.865 E.00144
; LINE_WIDTH: 0.183243
G1 X124.406 Y123.896 E.00105
; LINE_WIDTH: 0.156768
G1 X124.332 Y123.907 E.00041
; LINE_WIDTH: 0.107736
G3 X123.949 Y123.926 I-.389 J-3.888 E.00135
G1 X122.886 Y123.926 E.00374
; WIPE_START
G1 F15000
G1 X120.886 Y123.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.667 Y117.006 Z5.7 F42000
G1 X116.469 Y114.43 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2583
M204 S5000
G1 X115.06 Y114.43 E.02288
G3 X116.469 Y113.022 I2.274 J.866 E.03332
G1 X116.469 Y114.37 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X115.06 Y114.43 E-.53583
G1 X115.218 Y114.093 E-.14148
G1 X115.321 Y113.928 E-.07404
G1 X115.336 Y113.91 E-.00865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.53 Y113 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G3 X117.583 Y112.872 I.851 J2.617 E.01732
G3 X118.152 Y113 I-.316 J2.743 E.00949
G1 X116.59 Y113 E.02536
; WIPE_START
G1 F3600
M204 S6000
G1 X116.809 Y112.918 E-.08879
G1 X117 Y112.884 E-.07375
G1 X117.193 Y112.865 E-.07373
M73 P98 R0
G1 X117.583 Y112.872 E-.14808
G1 X117.868 Y112.918 E-.10985
G1 X118.152 Y113 E-.1123
G1 X117.748 Y113 E-.1535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y114.43 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X118.209 Y113.022 E.02286
G1 X118.33 Y113.071 E.00212
G3 X119.617 Y114.43 I-1.066 J2.299 E.03114
G1 X118.269 Y114.43 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X118.209 Y113.022 E-.53538
G1 X118.33 Y113.071 E-.0496
G1 X118.73 Y113.299 E-.17502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y114.49 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X119.685 Y114.63 E.00238
G3 X119.639 Y116.11 I-2.337 J.668 E.02444
G1 X119.639 Y114.55 E.02533
; WIPE_START
G1 F3600
M204 S6000
G1 X119.685 Y114.63 E-.03487
G1 X119.761 Y115.01 E-.14729
G1 X119.777 Y115.399 E-.14812
G1 X119.748 Y115.685 E-.10923
G1 X119.639 Y116.11 E-.1667
G1 X119.639 Y115.705 E-.15379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.209 Y116.17 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X119.617 Y116.17 E.02288
G1 X119.549 Y116.334 E.00288
G3 X118.209 Y117.578 I-2.244 J-1.072 E.03041
G1 X118.209 Y116.23 E.02189
; WIPE_START
G1 F3600
M204 S6000
G1 X119.617 Y116.17 E-.53581
G1 X119.549 Y116.334 E-.06745
G1 X119.338 Y116.688 E-.15673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.525 Y117.6 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X118.147 Y117.6 E.02634
G1 X118.054 Y117.633 E.00161
G3 X116.582 Y117.619 I-.714 J-2.372 E.02427
; WIPE_START
G1 F3600
M204 S6000
G1 X118.147 Y117.6 E-.5948
G1 X118.054 Y117.633 E-.03756
G1 X117.726 Y117.706 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.469 Y116.17 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X116.469 Y117.578 E.02286
G3 X115.06 Y116.17 I.875 J-2.285 E.0333
G1 X116.409 Y116.17 E.0219
; WIPE_START
G1 F3600
M204 S6000
G1 X116.469 Y117.578 E-.53538
G1 X116.262 Y117.49 E-.08532
G1 X115.947 Y117.302 E-.1393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.039 Y114.49 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2583
M204 S5000
G1 X115.039 Y116.11 E.0263
G3 X115.02 Y114.547 I2.309 J-.81 E.02583
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3600
M204 S6000
G1 X115.039 Y116.11 E-.59399
G1 X114.93 Y115.687 E-.16601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 66
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
G1 X0 Y128.743 F18000 ; move to safe pos
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

