; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 25m 34s; total estimated time: 32m 7s
; total layer number: 53
; total filament length [mm] : 2840.46
; total filament volume [cm^3] : 6832.12
; total filament weight [g] : 8.47
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 10.60
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
; layer_height = 0.2
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
; outer_wall_speed = 50
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
; print_settings_id = AirGap EDC Vault 02_bottom_chassis_edc A1 0.4
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
; top_shell_layers = 6
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
M73 P0 R32
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
M73 P0 R31
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
M73 P1 R31
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P2 R31
G1 X-48.2 F3000
M73 P3 R31
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
    G1 E10 F94.2699
    M983 F1.57117 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
M73 P3 R30
    G1 X-48.2 F3000
M73 P4 R30
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F1.57117 A0.3 H0.4; cali dynamic extrusion compensation
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
    M984 A0.1 E1 S1 F1.57117 H0.4
    M106 P1 S178
    M400 S7
M73 P5 R30
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
M73 P18 R26
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
M73 P19 R26
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
M73 P19 R25
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
    G29 A1 X97.0011 Y104 I61.9978 J48
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
    G0 X128 E8  F226.248
    G0 X133 E.3742  F377.08
    G0 X138 E.3742  F1508.32
    G0 X143 E.3742  F377.08
    G0 X148 E.3742  F1508.32
    G0 X153 E.3742  F377.08
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
    G0 X128 E10  F226.248
    G0 X133 E.3742  F377.08
    G0 X138 E.3742  F1508.32
    G0 X143 E.3742  F377.08
    G0 X148 E.3742  F1508.32
    G0 X153 E.3742  F377.08
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
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/53
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X132.74 Y133.825 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X132.74 Y134.739 E.03405
G1 X128.262 Y134.739 E.1668
G1 X128.262 Y127.261 E.27854
G1 X132.74 Y127.261 E.1668
G1 X132.74 Y133.765 E.24225
M204 S6000
G1 X132.283 Y133.825 F42000
G1 F1500
M204 S500
G1 X132.283 Y134.282 E.01702
G1 X128.719 Y134.282 E.13275
G1 X128.719 Y127.718 E.24449
M73 P20 R25
G1 X132.283 Y127.718 E.13275
G1 X132.283 Y133.765 E.22523
M204 S6000
G1 X131.826 Y133.825 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X129.176 Y133.825 E.0987
G1 X129.176 Y128.175 E.21044
G1 X131.826 Y128.175 E.0987
G1 X131.826 Y133.765 E.20821
; WIPE_START
G1 X129.827 Y133.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.212 Y134.328 Z.6 F42000
G1 X116.176 Y134.739 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X115.262 Y134.739 E.03405
G1 X115.262 Y127.261 E.27854
G1 X119.74 Y127.261 E.1668
G1 X119.74 Y134.739 E.27854
G1 X116.236 Y134.739 E.13052
M204 S6000
G1 X116.176 Y134.282 F42000
G1 F1500
M204 S500
G1 X115.719 Y134.282 E.01702
G1 X115.719 Y127.718 E.24449
G1 X119.283 Y127.718 E.13275
G1 X119.283 Y134.282 E.24449
G1 X116.236 Y134.282 E.11349
M204 S6000
G1 X116.176 Y133.825 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X116.176 Y128.175 E.21044
G1 X118.826 Y128.175 E.0987
G1 X118.826 Y133.825 E.21044
G1 X116.236 Y133.825 E.09647
; WIPE_START
G1 X116.215 Y131.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X110.269 Y136.611 Z.6 F42000
G1 X105.507 Y140.444 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X105.589 Y140.472 E.00319
G3 X103.893 Y140.172 I-1.586 J4.026 E.94816
G3 X104.319 Y140.182 I.086 J5.303 E.01585
G3 X105.18 Y140.334 I-.316 J4.316 E.03263
G1 X105.45 Y140.425 E.01064
M204 S6000
G1 X105.361 Y140.877 F42000
G1 F1500
M204 S500
G1 X105.419 Y140.897 E.00229
G3 X103.905 Y140.629 I-1.417 J3.602 E.8481
G3 X104.287 Y140.638 I.076 J4.766 E.01424
G3 X105.054 Y140.773 I-.284 J3.86 E.02907
G1 X105.304 Y140.858 E.00984
M204 S6000
G1 X105.215 Y141.31 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X105.25 Y141.321 E.00139
G3 X103.916 Y141.086 I-1.249 J3.177 E.74803
G3 X104.255 Y141.094 I.066 J4.229 E.01262
G3 X104.928 Y141.213 I-.253 J3.404 E.0255
G1 X105.158 Y141.29 E.00905
; WIPE_START
G1 X105.25 Y141.321 E-.03695
G1 X105.559 Y141.461 E-.12881
G1 X105.853 Y141.63 E-.12871
G1 X106.129 Y141.829 E-.12942
G1 X106.385 Y142.054 E-.12937
G1 X106.617 Y142.305 E-.12996
G1 X106.739 Y142.466 E-.07678
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.274 Y134.975 Z.6 F42000
G1 X100.258 Y109.331 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X100.306 Y109.249 E.00354
G3 X103.893 Y107.172 I3.697 J2.249 E.16101
G3 X104.319 Y107.182 I.086 J5.299 E.01585
G3 X100.1 Y109.628 I-.316 J4.316 E.81977
G1 X100.23 Y109.384 E.0103
M204 S6000
G1 X100.66 Y109.549 F42000
G1 F1500
M204 S500
G1 X100.696 Y109.485 E.00274
G3 X103.905 Y107.629 I3.306 J2.013 E.14396
G3 X104.287 Y107.638 I.076 J4.761 E.01424
G3 X100.512 Y109.824 I-.285 J3.86 E.7332
G1 X100.631 Y109.602 E.0094
M204 S6000
G1 X101.061 Y109.767 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X101.087 Y109.721 E.00195
G3 X103.916 Y108.086 I2.914 J1.777 E.1269
G3 X104.255 Y108.094 I.066 J4.224 E.01262
G3 X100.925 Y110.02 I-.253 J3.404 E.64663
G1 X101.033 Y109.819 E.00849
; WIPE_START
G1 X101.087 Y109.721 E-.04265
G1 X101.278 Y109.439 E-.12939
G1 X101.498 Y109.177 E-.12995
G1 X101.741 Y108.939 E-.12935
G1 X102.006 Y108.728 E-.12881
G1 X102.294 Y108.542 E-.12999
G1 X102.457 Y108.459 E-.06985
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X110.087 Y108.254 Z.6 F42000
G1 X145.093 Y107.314 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X145.18 Y107.334 E.00333
G3 X143.893 Y107.172 I-1.177 J4.164 E.96424
G3 X144.319 Y107.182 I.086 J5.298 E.01585
G3 X144.753 Y107.236 I-.316 J4.316 E.0163
G1 X145.034 Y107.3 E.01075
M204 S6000
G1 X144.99 Y107.759 F42000
G1 F1500
M204 S500
G1 X145.054 Y107.773 E.00243
G3 X143.905 Y107.629 I-1.052 J3.725 E.86248
M73 P21 R25
G3 X144.287 Y107.638 I.076 J4.761 E.01424
G3 X144.673 Y107.686 I-.285 J3.86 E.01452
G1 X144.932 Y107.745 E.00987
M204 S6000
G1 X144.888 Y108.204 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X144.928 Y108.213 E.00152
G3 X143.916 Y108.086 I-.926 J3.285 E.76071
G3 X144.255 Y108.094 I.066 J4.223 E.01262
G3 X144.594 Y108.137 I-.253 J3.404 E.01274
G1 X144.829 Y108.191 E.00899
; WIPE_START
G1 X144.928 Y108.213 E-.03832
G1 X145.25 Y108.322 E-.12932
G1 X145.559 Y108.461 E-.12882
G1 X145.853 Y108.63 E-.12871
G1 X146.129 Y108.829 E-.12942
G1 X146.385 Y109.054 E-.12937
G1 X146.521 Y109.201 E-.07605
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X147.086 Y116.812 Z.6 F42000
G1 X148.68 Y138.288 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X148.717 Y138.212 E.00316
G3 X151.908 Y136.262 I3.284 J1.788 E.14585
G1 X152.094 Y136.262 E.00694
G3 X148.556 Y138.547 I-.093 J3.738 E.70832
G1 X148.654 Y138.342 E.00848
M204 S6000
G1 X149.092 Y138.486 F42000
G1 F1500
M204 S500
G1 X149.119 Y138.43 E.00231
G3 X151.919 Y136.719 I2.882 J1.569 E.12802
G1 X152.083 Y136.719 E.00609
G3 X148.977 Y138.725 I-.082 J3.281 E.62172
G1 X149.066 Y138.54 E.00763
M204 S6000
G1 X149.503 Y138.684 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X149.52 Y138.649 E.00146
G3 X151.931 Y137.176 I2.481 J1.35 E.11019
G1 X152.071 Y137.176 E.00525
G3 X149.398 Y138.903 I-.07 J2.824 E.53512
G1 X149.477 Y138.738 E.00678
; WIPE_START
G1 X149.52 Y138.649 E-.03771
G1 X149.667 Y138.409 E-.10706
G1 X149.837 Y138.184 E-.10704
G1 X150.028 Y137.978 E-.10699
G1 X150.24 Y137.791 E-.10706
G1 X150.464 Y137.63 E-.10517
G1 X150.712 Y137.486 E-.10891
G1 X150.904 Y137.399 E-.08006
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.224 Y143.562 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X148.245 Y143.642 E.00307
G3 X143.893 Y140.172 I-4.242 J.856 E.78756
G3 X144.319 Y140.182 I.086 J5.303 E.01585
G3 X148.138 Y143.224 I-.316 J4.316 E.19324
G1 X148.21 Y143.504 E.01076
M204 S6000
G1 X147.782 Y143.674 F42000
G1 F1500
M204 S500
G1 X147.796 Y143.732 E.00225
G3 X143.905 Y140.629 I-3.794 J.766 E.70441
G3 X144.287 Y140.638 I.076 J4.765 E.01424
G3 X147.701 Y143.359 I-.284 J3.86 E.17276
G1 X147.767 Y143.616 E.00989
M204 S6000
G1 X147.339 Y143.786 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X147.348 Y143.823 E.00142
G3 X143.916 Y141.086 I-3.346 J.675 E.62125
G3 X144.255 Y141.094 I.066 J4.228 E.01262
G3 X147.264 Y143.494 I-.253 J3.404 E.15229
G1 X147.324 Y143.728 E.00902
; WIPE_START
G1 X147.348 Y143.823 E-.03726
G1 X147.399 Y144.16 E-.12944
G1 X147.413 Y144.631 E-.17892
G1 X147.348 Y145.177 E-.20897
G1 X147.265 Y145.507 E-.12932
G1 X147.196 Y145.695 E-.07609
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.864 Y138.247 Z.6 F42000
G1 X149.762 Y134.239 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X151.986 Y134.239 E.08284
G3 X151.985 Y145.761 I.012 J5.761 E.67506
G1 X149.809 Y145.761 E.08104
G1 X149.434 Y146.916 E.04524
G3 X143.985 Y150.761 I-5.439 J-1.924 E.26481
G1 X104.017 Y150.761 E1.48868
G3 X98.24 Y144.984 I.002 J-5.779 E.33792
G1 X98.24 Y111.016 E1.26521
G3 X104.017 Y105.239 I5.779 J.002 E.33792
G1 X104.495 Y105.239 E.01783
G1 X143.999 Y105.239 E1.47136
G3 X149.762 Y111.016 I-.016 J5.779 E.33741
G1 X149.762 Y134.179 E.86276
M204 S6000
G1 X150.219 Y133.782 F42000
G1 F1500
M204 S500
G3 X152.311 Y133.79 I.886 J41.877 E.07793
G3 X151.991 Y146.218 I-.318 J6.21 E.71581
G1 X150.141 Y146.218 E.06889
G3 X149.346 Y148.176 I-8.305 J-2.231 E.07891
G3 X143.991 Y151.218 I-5.353 J-3.189 E.23994
G1 X104.011 Y151.218 E1.4891
G3 X97.783 Y144.99 I.009 J-6.237 E.36424
G1 X97.783 Y111.01 E1.26562
G3 X104.011 Y104.782 I6.237 J.009 E.36423
G1 X104.495 Y104.782 E.01803
G1 X144.004 Y104.782 E1.47157
G3 X150.219 Y111.01 I-.023 J6.237 E.36372
G1 X150.219 Y133.722 E.84594
M204 S6000
G1 X150.676 Y133.325 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X152.666 Y133.358 I.661 J20.012 E.07414
G3 X151.997 Y146.675 I-.667 J6.642 E.75627
G1 X150.473 Y146.675 E.05675
G3 X143.997 Y151.675 I-6.504 J-1.731 E.32756
G1 X104.006 Y151.675 E1.48951
G3 X97.326 Y144.996 I.015 J-6.695 E.39055
G1 X97.326 Y111.004 E1.26604
G3 X104.006 Y104.325 I6.695 J.015 E.39055
G1 X104.495 Y104.325 E.01824
G1 X144.01 Y104.325 E1.47177
G3 X150.676 Y111.004 I-.029 J6.695 E.39003
G1 X150.676 Y133.265 E.82912
; WIPE_START
M73 P22 R25
G1 X151.997 Y133.325 E-.50253
G1 X152.666 Y133.358 E-.2543
G1 X152.674 Y133.359 E-.00317
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
M73 P22 R24
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X148.85 Y108.255 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50325
G1 F2400
M204 S500
G2 X147.612 Y107.023 I-25.717 J24.616 E.06554
G2 X145.941 Y105.997 I-3.724 J4.19 E.07393
G1 X149.005 Y109.061 E.16255
G3 X149.274 Y109.98 I-6.529 J2.404 E.03595
G1 X145.021 Y105.728 E.22558
G2 X144.278 Y105.636 I-.995 J4.995 E.02811
G1 X145.77 Y107.128 E.07915
G3 X148.371 Y109.729 I-1.801 J4.402 E.14168
G1 X149.575 Y110.932 E.06384
; WIPE_START
G1 X148.371 Y109.729 E-.64674
G1 X148.245 Y109.459 E-.11326
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.365 Y110.374 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X149.373 Y111.382 E.05348
G1 X149.373 Y112.033 E.02442
G1 X148.713 Y111.373 E.03502
G3 X148.692 Y112.002 I-6.733 J.083 E.02363
G1 X149.373 Y112.684 E.03617
G1 X149.373 Y113.335 E.02442
G1 X148.595 Y112.557 E.04129
G3 X148.448 Y113.061 I-2.542 J-.467 E.01973
G1 X149.373 Y113.986 E.04908
G1 X149.373 Y114.637 E.02442
G1 X148.258 Y113.522 E.05915
G3 X148.03 Y113.945 I-2.275 J-.954 E.01805
G1 X149.373 Y115.288 E.07125
G1 X149.373 Y115.939 E.02442
G1 X147.767 Y114.333 E.0852
G3 X147.472 Y114.688 I-1.884 J-1.266 E.01737
G1 X149.373 Y116.59 E.10088
G1 X149.373 Y117.241 E.02442
G1 X147.144 Y115.012 E.11825
G3 X146.785 Y115.303 I-1.635 J-1.65 E.01739
G1 X149.373 Y117.892 E.13733
G1 X149.373 Y118.543 E.02442
G1 X146.392 Y115.562 E.15816
G3 X145.964 Y115.785 I-1.354 J-2.075 E.01813
G1 X149.373 Y119.194 E.18086
G1 X149.373 Y119.845 E.02442
G1 X145.497 Y115.969 E.20561
G3 X144.987 Y116.109 I-.955 J-2.479 E.0199
G1 X149.373 Y120.496 E.23271
G1 X149.373 Y121.147 E.02442
G1 X144.423 Y116.197 E.26261
G3 X143.785 Y116.21 I-.411 J-4.415 E.02395
G1 X149.373 Y121.798 E.29644
G1 X149.373 Y122.449 E.02442
G1 X142.759 Y115.834 E.35089
; WIPE_START
G1 X144.173 Y117.249 E-.76
; WIPE_END
M73 P23 R24
G1 E-.04 F1800
M204 S6000
G1 X143.688 Y109.632 Z.6 F42000
G1 X143.421 Y105.429 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X144.852 Y106.86 E.0759
G2 X144.129 Y106.789 I-.956 J6.017 E.02723
G1 X142.975 Y105.635 E.06123
G1 X142.324 Y105.635 E.02442
G1 X143.501 Y106.811 E.06242
G2 X142.941 Y106.903 I1.147 J8.772 E.02127
G1 X141.673 Y105.634 E.06728
G1 X141.022 Y105.634 E.02442
G1 X142.438 Y107.05 E.07512
G2 X141.978 Y107.241 I.739 J2.432 E.01872
G1 X140.371 Y105.634 E.08525
G1 X139.72 Y105.634 E.02442
G1 X141.555 Y107.469 E.09736
G2 X141.167 Y107.732 I1.119 J2.072 E.01761
G1 X139.069 Y105.634 E.1113
G1 X138.417 Y105.634 E.02442
G1 X140.811 Y108.028 E.127
G2 X140.488 Y108.355 I1.44 J1.748 E.0173
G1 X137.766 Y105.634 E.14436
G1 X137.115 Y105.634 E.02442
G1 X140.196 Y108.714 E.16343
G2 X139.938 Y109.107 I1.831 J1.487 E.01766
G1 X136.464 Y105.634 E.18427
G1 X135.813 Y105.633 E.02442
G1 X139.715 Y109.535 E.20698
G2 X139.531 Y110.003 I2.291 J1.169 E.01887
G1 X135.162 Y105.633 E.23179
G1 X134.511 Y105.633 E.02442
G1 X139.392 Y110.515 E.25895
G2 X139.307 Y111.08 I2.831 J.717 E.02149
G1 X133.86 Y105.633 E.28896
G1 X133.208 Y105.633 E.02442
G1 X139.294 Y111.718 E.32283
G2 X139.383 Y112.458 I3.739 J-.075 E.02801
G1 X132.557 Y105.633 E.36209
G1 X131.906 Y105.633 E.02442
G1 X139.695 Y113.421 E.41318
G2 X142.073 Y115.799 I4.263 J-1.885 E.12906
G1 X149.373 Y123.1 E.38729
G1 X149.373 Y123.751 E.02442
G1 X131.255 Y105.633 E.96116
G1 X130.604 Y105.632 E.02442
G1 X149.373 Y124.402 E.9957
G1 X149.373 Y125.053 E.02442
G1 X129.953 Y105.632 E1.03024
G1 X129.302 Y105.632 E.02442
G1 X149.373 Y125.704 E1.06478
G1 X149.373 Y126.355 E.02442
G1 X128.651 Y105.632 E1.09932
G1 X127.999 Y105.632 E.02442
G1 X149.373 Y127.006 E1.13386
G1 X149.373 Y127.657 E.02442
G1 X127.348 Y105.632 E1.1684
G1 X126.697 Y105.632 E.02442
G1 X149.373 Y128.308 E1.20294
G1 X149.373 Y128.959 E.02442
G1 X126.046 Y105.632 E1.23749
G1 X125.395 Y105.631 E.02442
G1 X149.373 Y129.61 E1.27203
G1 X149.373 Y130.261 E.02442
G1 X124.744 Y105.631 E1.30657
G1 X124.093 Y105.631 E.02442
G1 X149.373 Y130.912 E1.34111
G1 X149.373 Y131.563 E.02442
G1 X123.442 Y105.631 E1.37565
G1 X122.79 Y105.631 E.02442
G1 X149.373 Y132.214 E1.41019
G1 X149.373 Y132.865 E.02442
G1 X122.139 Y105.631 E1.44473
G1 X121.488 Y105.631 E.02442
G1 X149.579 Y133.722 E1.49019
; WIPE_START
G1 X148.165 Y132.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X153.855 Y134.742 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X156.892 Y137.78 E.16114
G3 X157.227 Y138.765 I-7.242 J3.007 E.03906
G1 X153.235 Y134.773 E.21177
G2 X152.462 Y134.652 I-1.602 J7.654 E.02936
G1 X157.351 Y139.54 E.25933
G3 X157.366 Y140.206 I-9.421 J.549 E.025
G1 X155.947 Y138.788 E.07524
G3 X156.11 Y139.601 I-5.578 J1.536 E.03114
G1 X157.308 Y140.799 E.06356
G3 X157.197 Y141.339 I-2.779 J-.29 E.02071
G1 X156.111 Y140.254 E.05759
G3 X156.039 Y140.833 I-2.346 J.004 E.02195
G1 X157.046 Y141.84 E.05341
G3 X156.851 Y142.296 I-3.159 J-1.082 E.01862
G1 X155.901 Y141.346 E.0504
G3 X155.712 Y141.807 I-7.021 J-2.606 E.01872
G1 X156.628 Y142.724 E.04861
M73 P24 R24
G1 X156.373 Y143.119 E.01766
G1 X155.476 Y142.223 E.04757
G3 X155.202 Y142.6 I-2.024 J-1.182 E.01751
G1 X156.084 Y143.481 E.04677
G3 X155.774 Y143.822 I-2.43 J-1.902 E.0173
G1 X154.892 Y142.94 E.04677
G3 X154.545 Y143.245 I-1.696 J-1.58 E.01733
G1 X155.428 Y144.128 E.04683
G3 X155.058 Y144.409 I-1.589 J-1.707 E.01746
G1 X154.162 Y143.513 E.04753
G3 X153.74 Y143.742 I-1.358 J-1.997 E.01804
G1 X154.663 Y144.664 E.04893
G3 X154.229 Y144.882 I-1.667 J-2.785 E.01821
G1 X153.273 Y143.926 E.05071
G3 X152.751 Y144.055 I-.906 J-2.541 E.0202
G1 X153.766 Y145.07 E.05385
G3 X153.265 Y145.22 I-1.252 J-3.271 E.01964
G1 X152.168 Y144.122 E.05821
G3 X151.485 Y144.091 I-.129 J-4.625 E.02565
G1 X152.893 Y145.499 E.07469
; WIPE_START
G1 X151.485 Y144.091 E-.75662
G1 X151.494 Y144.092 E-.00338
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X153.484 Y136.724 Z.6 F42000
G1 X153.569 Y136.409 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X151.787 Y134.628 E.09451
G1 X151.136 Y134.628 E.02442
G1 X152.403 Y135.895 E.06722
G2 X151.742 Y135.884 I-.4 J4.423 E.02483
G1 X150.279 Y134.422 E.07758
; WIPE_START
G1 X151.694 Y135.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.344 Y136.138 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X149.834 Y134.628 E.08011
G1 X149.373 Y134.628 E.01728
G1 X149.373 Y134.167 E.01728
G1 X120.837 Y105.631 E1.51382
G1 X120.186 Y105.631 E.02442
G1 X150.654 Y136.099 E1.61631
G2 X150.196 Y136.292 I.747 J2.414 E.01868
G1 X119.535 Y105.63 E1.62655
G1 X118.884 Y105.63 E.02442
G1 X149.78 Y136.526 E1.63899
G2 X149.402 Y136.799 I1.162 J2.009 E.01752
G1 X118.233 Y105.63 E1.65347
G1 X117.581 Y105.63 E.02442
G1 X149.06 Y137.109 E1.6699
G2 X148.76 Y137.46 I1.25 J1.371 E.01737
G1 X116.93 Y105.63 E1.68853
G1 X116.279 Y105.63 E.02442
G1 X148.489 Y137.84 E1.70868
G2 X148.261 Y138.263 I2.003 J1.351 E.01806
G1 X115.628 Y105.63 E1.73114
G1 X114.977 Y105.63 E.02442
G1 X148.076 Y138.728 E1.75585
G2 X147.944 Y139.248 I5.537 J1.677 E.02011
G1 X114.326 Y105.629 E1.78342
G1 X113.675 Y105.629 E.02442
G1 X147.881 Y139.835 E1.81459
G2 X147.909 Y140.514 I4.358 J.161 E.02551
G1 X113.024 Y105.629 E1.85061
G1 X112.372 Y105.629 E.02442
G1 X148.111 Y141.367 E1.89587
G2 X150.634 Y143.891 I3.855 J-1.332 E.13854
G1 X152.109 Y145.366 E.07826
G3 X151.465 Y145.372 I-.389 J-6.546 E.02418
G1 X111.721 Y105.629 E2.10833
G1 X111.07 Y105.629 E.02442
G1 X132.314 Y126.872 E1.12694
G1 X131.663 Y126.872 E.02442
G1 X110.419 Y105.629 E1.12695
G1 X109.768 Y105.629 E.02442
G1 X131.012 Y126.872 E1.12695
G1 X130.361 Y126.872 E.02442
G1 X109.117 Y105.628 E1.12696
G1 X108.466 Y105.628 E.02442
G1 X129.71 Y126.872 E1.12696
G1 X129.059 Y126.872 E.02442
G1 X107.815 Y105.628 E1.12697
G1 X107.163 Y105.628 E.02442
G1 X128.408 Y126.872 E1.12698
G1 X127.873 Y126.872 E.02004
G1 X127.873 Y126.989 E.00438
G1 X106.512 Y105.628 E1.13318
M73 P25 R24
G1 X105.861 Y105.628 E.02442
G1 X127.873 Y127.64 E1.16772
G1 X127.873 Y128.291 E.02442
G1 X105.21 Y105.628 E1.20226
G1 X104.559 Y105.628 E.02442
G1 X127.873 Y128.942 E1.2368
G1 X127.873 Y129.593 E.02442
G1 X108.551 Y110.271 E1.02501
G3 X108.698 Y111.069 I-5.653 J1.454 E.03046
G1 X127.873 Y130.244 E1.01721
G1 X127.873 Y130.895 E.02442
G1 X108.708 Y111.73 E1.01668
M73 P25 R23
G3 X108.644 Y112.317 I-2.91 J-.022 E.02218
G1 X127.873 Y131.546 E1.0201
G1 X127.873 Y132.197 E.02442
G1 X108.522 Y112.846 E1.02658
G3 X108.351 Y113.326 I-2.44 J-.595 E.01916
G1 X127.873 Y132.848 E1.03562
G1 X127.873 Y133.499 E.02442
G1 X108.14 Y113.765 E1.04685
G3 X107.892 Y114.168 I-2.14 J-1.039 E.01778
G1 X128.079 Y134.356 E1.07092
; WIPE_START
G1 X126.665 Y132.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.416 Y127.924 Z.6 F42000
G1 X132.923 Y127.482 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X145.46 Y140.018 E.66505
G2 X144.618 Y139.828 I-1.47 J4.536 E.03242
G1 X133.129 Y128.338 E.60949
G1 X133.129 Y128.989 E.02442
G1 X143.923 Y139.784 E.57264
G2 X143.323 Y139.834 I.27 J6.83 E.02262
G1 X133.129 Y129.64 E.54077
G1 X133.129 Y130.291 E.02442
G1 X142.784 Y139.947 E.5122
G2 X142.294 Y140.107 I.54 J2.48 E.01939
G1 X133.129 Y130.942 E.48619
G1 X133.129 Y131.593 E.02442
G1 X141.845 Y140.309 E.46237
G2 X141.433 Y140.548 I.989 J2.177 E.01789
G1 X133.129 Y132.244 E.44052
G1 X133.129 Y132.895 E.02442
M73 P26 R23
G1 X141.055 Y140.822 E.42047
G2 X140.709 Y141.127 I1.381 J1.909 E.01733
G1 X133.129 Y133.546 E.40215
G1 X133.129 Y134.197 E.02442
G1 X140.396 Y141.465 E.38552
G2 X140.115 Y141.834 I1.71 J1.594 E.01745
G1 X133.129 Y134.848 E.37059
G1 X133.129 Y135.128 E.01047
G1 X132.757 Y135.128 E.01395
G1 X139.867 Y142.238 E.37717
G2 X139.655 Y142.677 I2.053 J1.26 E.01832
G1 X132.106 Y135.128 E.40047
G1 X131.455 Y135.128 E.02442
G1 X139.484 Y143.156 E.42591
G2 X139.358 Y143.682 I2.52 J.878 E.02031
G1 X130.804 Y135.128 E.4538
G1 X130.153 Y135.128 E.02442
G1 X139.288 Y144.263 E.48462
G2 X139.307 Y144.932 I4.461 J.212 E.02514
G1 X129.502 Y135.128 E.52013
G1 X128.851 Y135.128 E.02442
G1 X139.768 Y146.044 E.57912
; WIPE_START
G1 X138.354 Y144.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.965 Y145.2 Z.6 F42000
G1 X151.019 Y145.578 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X148.487 Y143.046 E.13433
G3 X148.674 Y143.884 I-5.186 J1.598 E.03225
G1 X150.163 Y145.372 E.07896
G1 X149.523 Y145.384 E.02399
G1 X148.716 Y144.576 E.04283
G3 X148.665 Y145.177 I-2.971 J.051 E.02264
G1 X149.364 Y145.875 E.03705
G1 X149.204 Y146.366 E.01938
G1 X148.554 Y145.717 E.03445
G3 X148.394 Y146.208 I-2.485 J-.538 E.01941
G1 X149.041 Y146.855 E.03431
G3 X148.844 Y147.309 I-3.163 J-1.104 E.01858
G1 X148.193 Y146.657 E.03455
G3 X147.954 Y147.07 I-2.225 J-1.013 E.0179
G1 X148.623 Y147.738 E.03546
G1 X148.363 Y148.13 E.01762
G1 X147.681 Y147.447 E.0362
G3 X147.375 Y147.793 I-1.837 J-1.321 E.01733
G1 X148.075 Y148.493 E.03716
G3 X147.76 Y148.829 I-1.853 J-1.426 E.0173
G1 X147.037 Y148.106 E.03834
G3 X146.667 Y148.387 I-1.59 J-1.706 E.01746
G1 X147.422 Y149.142 E.04002
G1 X147.049 Y149.42 E.01745
G1 X146.264 Y148.635 E.04162
G3 X145.826 Y148.847 I-1.303 J-2.133 E.01831
G1 X146.647 Y149.669 E.04359
G3 X146.216 Y149.889 I-1.771 J-2.939 E.01817
G1 X145.347 Y149.02 E.04611
G3 X144.823 Y149.147 I-.895 J-2.551 E.02026
G1 X145.752 Y150.075 E.04927
G3 X145.247 Y150.222 I-.998 J-2.49 E.01973
G1 X144.235 Y149.21 E.05368
G3 X143.567 Y149.193 I-.206 J-4.985 E.02509
G1 X144.699 Y150.325 E.06005
G3 X144.09 Y150.367 I-.585 J-4.051 E.02292
G1 X142.461 Y148.738 E.08643
; WIPE_START
G1 X143.875 Y150.152 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.65 Y150.578 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X107.611 Y114.539 E1.91184
G1 X107.297 Y114.876 E.01728
G1 X119.294 Y126.872 E.63639
G1 X118.643 Y126.872 E.02442
G1 X106.952 Y115.181 E.62019
G3 X106.574 Y115.454 I-1.553 J-1.752 E.01752
G1 X117.992 Y126.872 E.60571
G1 X117.341 Y126.872 E.02442
G1 X106.162 Y115.694 E.593
G3 X105.713 Y115.896 I-9.141 J-19.696 E.01847
G1 X116.69 Y126.872 E.58228
G1 X116.039 Y126.872 E.02442
G1 X105.221 Y116.055 E.57384
G3 X104.68 Y116.165 I-.804 J-2.583 E.02076
G1 X115.388 Y126.872 E.56803
G1 X114.873 Y126.872 E.01929
G1 X114.873 Y127.009 E.00513
G1 X104.081 Y116.216 E.57254
G3 X103.385 Y116.172 I.022 J-5.816 E.02615
G1 X114.873 Y127.66 E.60943
G1 X114.873 Y128.311 E.02442
G1 X102.187 Y115.625 E.67299
; WIPE_START
G1 X103.601 Y117.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.089 Y109.553 Z.6 F42000
G1 X105.544 Y107.264 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X103.913 Y105.633 E.08651
G2 X103.308 Y105.679 I-.015 J3.81 E.02279
G1 X104.434 Y106.805 E.05972
G2 X103.77 Y106.791 I-.445 J5.57 E.02494
G1 X102.759 Y105.78 E.05363
G2 X102.254 Y105.927 I.492 J2.635 E.01974
G1 X103.186 Y106.858 E.04941
G2 X102.658 Y106.982 I.353 J2.692 E.02035
G1 X101.788 Y106.112 E.04616
G2 X101.356 Y106.331 I.878 J2.269 E.0182
G1 X102.178 Y107.153 E.04361
G2 X101.738 Y107.364 I.852 J2.339 E.01833
G1 X100.954 Y106.58 E.04159
G2 X100.582 Y106.858 I1.231 J2.035 E.01747
G1 X101.335 Y107.612 E.03997
G2 X100.965 Y107.893 I1.221 J1.988 E.01745
G1 X100.24 Y107.168 E.03847
G2 X99.927 Y107.506 I1.562 J1.76 E.01731
G1 X100.628 Y108.207 E.03717
G2 X100.323 Y108.552 I1.54 J1.667 E.01733
G1 X99.642 Y107.872 E.03612
G2 X99.385 Y108.266 I1.873 J1.501 E.01768
G1 X100.049 Y108.93 E.03525
G2 X99.81 Y109.342 I1.937 J1.401 E.01789
G1 X99.159 Y108.69 E.03456
G2 X98.966 Y109.148 I2.225 J1.208 E.01867
G1 X99.607 Y109.79 E.03405
G2 X99.446 Y110.279 I2.413 J1.071 E.01936
G1 X98.81 Y109.644 E.03371
G2 X98.698 Y110.183 I2.681 J.836 E.0207
G1 X99.333 Y110.818 E.03367
G2 X99.286 Y111.422 I3.503 J.578 E.02275
G1 X98.641 Y110.777 E.03423
G2 X98.629 Y111.416 I6.558 J.442 E.02399
G1 X99.328 Y112.114 E.03707
G2 X99.513 Y112.951 I6.279 J-.952 E.03215
G1 X98.629 Y112.067 E.04689
G1 X98.629 Y112.718 E.02442
G1 X114.873 Y128.962 E.86174
G1 X114.873 Y129.613 E.02442
G1 X98.629 Y113.369 E.86173
G1 X98.629 Y114.02 E.02442
G1 X114.873 Y130.264 E.86173
G1 X114.873 Y130.915 E.02442
G1 X98.63 Y114.671 E.86172
G1 X98.63 Y115.322 E.02443
G1 X114.873 Y131.566 E.86171
M73 P27 R23
G1 X114.873 Y132.217 E.02442
G1 X98.63 Y115.974 E.8617
G1 X98.63 Y116.625 E.02443
G1 X114.873 Y132.868 E.8617
G1 X114.873 Y133.519 E.02442
G1 X98.63 Y117.276 E.86169
G1 X98.63 Y117.927 E.02442
G1 X115.079 Y134.376 E.87259
; WIPE_START
G1 X113.665 Y132.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.416 Y127.944 Z.6 F42000
G1 X119.923 Y127.502 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X142.793 Y150.372 E1.21324
G1 X142.142 Y150.372 E.02442
G1 X120.129 Y128.358 E1.16779
G1 X120.129 Y129.009 E.02442
G1 X141.491 Y150.372 E1.13325
G1 X140.84 Y150.372 E.02442
G1 X120.129 Y129.66 E1.09871
G1 X120.129 Y130.311 E.02442
G1 X140.189 Y150.372 E1.06417
G1 X139.538 Y150.372 E.02442
G1 X120.129 Y130.962 E1.02963
G1 X120.129 Y131.613 E.02442
G1 X138.887 Y150.371 E.99509
G1 X138.236 Y150.371 E.02442
G1 X120.129 Y132.264 E.96054
G1 X120.129 Y132.915 E.02442
G1 X137.584 Y150.371 E.926
G1 X136.933 Y150.371 E.02442
G1 X120.129 Y133.566 E.89146
G1 X120.129 Y134.217 E.02442
G1 X136.282 Y150.371 E.85692
G1 X135.631 Y150.371 E.02442
G1 X120.129 Y134.868 E.82238
G1 X120.129 Y135.128 E.00972
G1 X119.737 Y135.128 E.0147
G1 X134.98 Y150.371 E.80863
G1 X134.329 Y150.371 E.02442
G1 X119.086 Y135.128 E.80862
G1 X118.435 Y135.128 E.02442
G1 X133.678 Y150.37 E.80861
G1 X133.027 Y150.37 E.02442
G1 X117.784 Y135.128 E.80861
G1 X117.133 Y135.128 E.02442
G1 X132.375 Y150.37 E.8086
G1 X131.724 Y150.37 E.02442
G1 X116.482 Y135.128 E.80859
G1 X115.831 Y135.128 E.02442
G1 X131.073 Y150.37 E.80859
G1 X130.422 Y150.37 E.02442
G1 X98.63 Y118.578 E1.68651
G1 X98.63 Y119.229 E.02442
G1 X129.771 Y150.37 E1.65196
G1 X129.12 Y150.37 E.02442
G1 X98.631 Y119.88 E1.61741
G1 X98.631 Y120.532 E.02443
G1 X128.469 Y150.37 E1.58286
G1 X127.818 Y150.369 E.02442
G1 X98.631 Y121.183 E1.54832
G1 X98.631 Y121.834 E.02443
G1 X127.166 Y150.369 E1.51377
G1 X126.515 Y150.369 E.02442
G1 X98.631 Y122.485 E1.47922
G1 X98.631 Y123.136 E.02442
G1 X125.864 Y150.369 E1.44467
G1 X125.213 Y150.369 E.02442
G1 X98.631 Y123.787 E1.41012
G1 X98.632 Y124.438 E.02442
G1 X124.562 Y150.369 E1.37557
G1 X123.911 Y150.369 E.02442
G1 X98.632 Y125.09 E1.34102
G1 X98.632 Y125.741 E.02443
M73 P28 R23
G1 X123.26 Y150.369 E1.30648
G1 X122.609 Y150.368 E.02442
G1 X98.632 Y126.392 E1.27193
G1 X98.632 Y127.043 E.02443
G1 X121.957 Y150.368 E1.23738
G1 X121.306 Y150.368 E.02442
G1 X98.632 Y127.694 E1.20283
G1 X98.632 Y128.345 E.02443
G1 X120.655 Y150.368 E1.16828
G1 X120.004 Y150.368 E.02442
G1 X98.633 Y128.996 E1.13373
G1 X98.633 Y129.648 E.02442
G1 X119.353 Y150.368 E1.09919
G1 X118.702 Y150.368 E.02442
G1 X98.633 Y130.299 E1.06464
G1 X98.633 Y130.95 E.02443
M73 P28 R22
G1 X118.051 Y150.368 E1.03009
G1 X117.4 Y150.368 E.02442
G1 X98.633 Y131.601 E.99554
G1 X98.633 Y132.252 E.02443
G1 X116.749 Y150.367 E.96099
G1 X116.097 Y150.367 E.02442
G1 X108.305 Y142.575 E.41337
G2 X105.93 Y140.2 I-4.249 J1.873 E.12892
G1 X98.633 Y132.903 E.38708
G1 X98.634 Y133.554 E.02443
G1 X104.965 Y139.886 E.33588
G2 X104.219 Y139.791 I-1.013 J4.982 E.02823
G1 X98.634 Y134.206 E.2963
G1 X98.634 Y134.857 E.02442
G1 X103.582 Y139.805 E.26251
G2 X103.014 Y139.888 I.131 J2.884 E.02157
G1 X98.634 Y135.508 E.23237
G1 X98.634 Y136.159 E.02443
G1 X102.501 Y140.026 E.20514
G2 X102.036 Y140.212 I7.672 J19.9 E.01879
G1 X98.634 Y136.81 E.18045
G1 X98.634 Y137.461 E.02442
M73 P29 R22
G1 X101.608 Y140.435 E.15777
G2 X101.215 Y140.693 I1.065 J2.05 E.01767
G1 X98.634 Y138.112 E.13691
G1 X98.635 Y138.764 E.02443
G1 X100.856 Y140.985 E.11783
G2 X100.528 Y141.307 I1.421 J1.773 E.0173
G1 X98.635 Y139.415 E.10041
G1 X98.635 Y140.066 E.02442
G1 X100.231 Y141.662 E.08469
G2 X99.969 Y142.051 I1.86 J1.541 E.01761
G1 X98.635 Y140.717 E.07075
G1 X98.635 Y141.368 E.02443
G1 X99.741 Y142.474 E.05864
G2 X99.552 Y142.936 I2.253 J1.19 E.01876
G1 X98.635 Y142.019 E.04862
G1 X98.635 Y142.67 E.02442
G1 X99.407 Y143.442 E.04091
G2 X99.315 Y144.001 I2.795 J.747 E.02128
G1 X98.636 Y143.322 E.03603
G1 X98.636 Y143.973 E.02443
G1 X99.288 Y144.625 E.03462
G2 X99.366 Y145.354 I3.678 J-.024 E.02754
G1 X98.43 Y144.418 E.04966
; WIPE_START
G1 X99.366 Y145.354 E-.50303
G1 X99.312 Y145.017 E-.1298
G1 X99.292 Y144.683 E-.12717
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X106.831 Y143.494 Z.6 F42000
G1 X108.336 Y143.256 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X115.446 Y150.367 E.37722
G1 X114.795 Y150.367 E.02442
G1 X108.709 Y144.281 E.32287
G3 X108.699 Y144.922 I-3.265 J.27 E.02409
G1 X114.144 Y150.367 E.28886
G1 X113.493 Y150.367 E.02442
G1 X108.613 Y145.487 E.25888
G3 X108.472 Y145.997 I-2.569 J-.437 E.01988
G1 X112.842 Y150.367 E.23183
G1 X112.191 Y150.367 E.02442
G1 X108.287 Y146.463 E.20709
G3 X108.064 Y146.891 I-2.252 J-.904 E.01813
G1 X111.54 Y150.366 E.18439
G1 X110.888 Y150.366 E.02442
G1 X107.805 Y147.283 E.16356
G3 X107.514 Y147.643 I-1.909 J-1.247 E.01739
G1 X110.237 Y150.366 E.14447
G1 X109.586 Y150.366 E.02442
G1 X107.191 Y147.971 E.12707
G3 X106.836 Y148.267 I-1.656 J-1.628 E.01737
G1 X108.935 Y150.366 E.11137
G1 X108.284 Y150.366 E.02442
G1 X106.448 Y148.53 E.09741
G3 X106.024 Y148.757 I-1.377 J-2.051 E.01806
G1 X107.633 Y150.366 E.08532
G1 X106.982 Y150.366 E.02442
G1 X105.563 Y148.947 E.07526
G3 X105.058 Y149.093 I-.98 J-2.445 E.01975
G1 X106.331 Y150.366 E.06752
G1 X105.679 Y150.365 E.02442
G1 X104.501 Y149.187 E.06252
G3 X103.875 Y149.212 I-.468 J-3.851 E.02352
G1 X105.028 Y150.365 E.06118
G1 X104.377 Y150.365 E.02442
G1 X102.879 Y148.867 E.07945
; WIPE_START
G1 X104.294 Y150.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.932 Y150.571 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X102.229 Y148.868 E.09034
G3 X99.634 Y146.273 I1.788 J-4.384 E.14137
G1 X98.637 Y145.276 E.05286
G2 X98.735 Y146.025 I3.846 J-.12 E.02836
G1 X102.983 Y150.273 E.22535
G1 X102.953 Y150.268 E.00111
G3 X102.07 Y150.011 I1.09 J-5.387 E.03455
G1 X98.99 Y146.931 E.16339
G2 X100.17 Y148.762 I5.239 J-2.081 E.08225
G1 X101.268 Y149.86 E.05825
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X100.17 Y148.762 E-.59004
G1 X99.87 Y148.431 E-.16996
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/53
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S170.85
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.488 J1.115 P1  F42000
G1 X131.711 Y134.509 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.492 Y134.509 E.10678
G1 X128.492 Y127.491 E.23281
G1 X132.51 Y127.491 E.13329
G1 X132.51 Y134.509 E.23281
G1 X131.771 Y134.509 E.02452
M204 S10000
G1 X132.103 Y133.71 F42000
G1 F5400
M204 S6000
G1 X132.103 Y134.102 E.01301
G1 X128.899 Y134.102 E.10629
G1 X128.899 Y127.898 E.2058
G1 X132.103 Y127.898 E.10629
G1 X132.103 Y133.65 E.19081
M204 S250
G1 X131.711 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X129.291 Y133.71 E.07436
G1 X129.291 Y128.29 E.16654
G1 X131.711 Y128.29 E.07436
G1 X131.711 Y133.65 E.1647
; WIPE_START
M204 S6000
G1 X129.712 Y133.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.093 Y134.159 Z.8 F42000
G1 X116.291 Y134.509 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X115.492 Y134.509 E.02651
G1 X115.492 Y127.491 E.23281
G1 X119.51 Y127.491 E.13329
G1 X119.51 Y134.509 E.23281
G1 X116.351 Y134.509 E.10479
M204 S10000
G1 X116.291 Y134.102 F42000
G1 F5400
M204 S6000
G1 X115.899 Y134.102 E.01301
G1 X115.899 Y127.898 E.2058
G1 X119.103 Y127.898 E.10629
G1 X119.103 Y134.102 E.2058
G1 X116.351 Y134.102 E.09129
M204 S250
G1 X116.291 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.291 Y128.29 E.16654
G1 X118.711 Y128.29 E.07436
G1 X118.711 Y133.71 E.16654
G1 X116.351 Y133.71 E.07252
; WIPE_START
M204 S6000
G1 X116.329 Y131.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.504 Y136.642 Z.8 F42000
G1 X105.482 Y140.894 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.78 Y141.03 E.01087
G3 X103.516 Y140.63 I-1.779 J3.467 E.73475
G1 X103.904 Y140.601 E.01291
G3 X105.426 Y140.87 I.097 J3.896 E.05161
G1 X105.427 Y140.87 E.00003
M204 S10000
G1 X105.314 Y141.265 F42000
G1 F5400
M204 S6000
G1 X105.594 Y141.392 E.0102
G3 X103.567 Y141.034 I-1.593 J3.105 E.658
G1 X103.914 Y141.008 E.01156
G3 X105.259 Y141.242 I.087 J3.489 E.04558
M204 S250
G1 X105.153 Y141.623 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.415 Y141.742 E.00885
G3 X103.615 Y141.424 I-1.414 J2.756 E.54103
G1 X103.924 Y141.401 E.0095
G3 X105.097 Y141.6 I.077 J3.097 E.03681
; WIPE_START
M204 S6000
G1 X105.415 Y141.742 E-.13221
G1 X105.683 Y141.896 E-.11749
G1 X105.934 Y142.076 E-.11742
G1 X106.166 Y142.281 E-.11742
G1 X106.376 Y142.507 E-.11741
G1 X106.563 Y142.754 E-.11746
G1 X106.618 Y142.845 E-.0406
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.271 Y135.332 Z.8 F42000
G1 X100.644 Y109.52 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X100.674 Y109.467 E.00202
G3 X103.516 Y107.63 I3.327 J2.029 E.11611
G1 X103.904 Y107.601 E.01291
G3 X100.489 Y109.809 I.097 J3.896 E.67025
G1 X100.615 Y109.573 E.00888
M204 S10000
G1 X101.001 Y109.715 F42000
G1 F5400
M204 S6000
G1 X101.022 Y109.679 E.00135
G3 X103.567 Y108.034 I2.979 J1.817 E.10398
G1 X103.914 Y108.008 E.01156
G3 X100.856 Y109.985 I.087 J3.489 E.60024
G1 X100.973 Y109.767 E.00821
M204 S250
G1 X101.346 Y109.902 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X101.357 Y109.884 E.00065
G3 X103.615 Y108.424 I2.644 J1.613 E.08549
G1 X103.924 Y108.401 E.0095
G3 X101.209 Y110.156 I.077 J3.097 E.49354
G1 X101.317 Y109.955 E.00701
; WIPE_START
M204 S6000
G1 X101.357 Y109.884 E-.03084
G1 X101.53 Y109.628 E-.11746
G1 X101.728 Y109.391 E-.11741
G1 X101.95 Y109.175 E-.11749
G1 X102.191 Y108.983 E-.11737
G1 X102.451 Y108.815 E-.11744
G1 X102.726 Y108.674 E-.11751
G1 X102.786 Y108.651 E-.02448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.417 Y108.485 Z.8 F42000
G1 X145.007 Y107.734 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.057 Y107.746 E.00171
G3 X143.516 Y107.63 I-1.057 J3.751 E.76055
G1 X143.904 Y107.601 E.01291
G3 X144.678 Y107.659 I.097 J3.896 E.0258
G1 X144.949 Y107.721 E.0092
M204 S10000
G1 X144.917 Y108.131 F42000
G1 F5400
M204 S6000
G1 X144.947 Y108.138 E.00104
G3 X143.567 Y108.034 I-.946 J3.359 E.68111
G1 X143.914 Y108.008 E.01156
G3 X144.608 Y108.06 I.087 J3.489 E.02311
G1 X144.858 Y108.117 E.00853
M204 S250
G1 X144.829 Y108.513 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X144.841 Y108.516 E.00036
G3 X143.615 Y108.424 I-.84 J2.982 E.56003
G1 X143.924 Y108.401 E.0095
G3 X144.539 Y108.447 I.077 J3.097 E.019
G1 X144.771 Y108.5 E.0073
; WIPE_START
M204 S6000
G1 X144.841 Y108.516 E-.02724
G1 X145.134 Y108.614 E-.11737
G1 X145.415 Y108.741 E-.1175
G1 X145.683 Y108.896 E-.11737
G1 X145.934 Y109.076 E-.11755
G1 X146.166 Y109.281 E-.11742
G1 X146.376 Y109.507 E-.11741
G1 X146.421 Y109.566 E-.02813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.078 Y117.17 Z.8 F42000
G1 X148.907 Y138.352 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.007 Y138.17 E.00687
G3 X151.914 Y136.492 I2.994 J1.829 E.1161
G1 X152.088 Y136.492 E.0058
G3 X148.839 Y138.477 I-.087 J3.508 E.59783
G1 X148.879 Y138.405 E.00274
M204 S10000
G1 X149.265 Y138.546 F42000
G1 F5400
M204 S6000
G1 X149.354 Y138.382 E.0062
G3 X151.924 Y136.899 I2.647 J1.617 E.10263
G1 X152.078 Y136.899 E.00513
G3 X149.206 Y138.654 I-.077 J3.101 E.52846
G1 X149.236 Y138.599 E.00207
M204 S250
G1 X149.609 Y138.734 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.689 Y138.587 E.00514
G3 X151.934 Y137.291 I2.312 J1.413 E.08305
G1 X152.069 Y137.291 E.00415
G3 X149.56 Y138.824 I-.068 J2.709 E.42763
G1 X149.58 Y138.786 E.00132
; WIPE_START
M204 S6000
G1 X149.689 Y138.587 E-.08636
G1 X149.841 Y138.364 E-.10261
G1 X150.014 Y138.157 E-.1027
G1 X150.208 Y137.968 E-.10259
G1 X150.419 Y137.8 E-.10271
G1 X150.646 Y137.653 E-.10268
G1 X150.887 Y137.53 E-.10272
G1 X151.028 Y137.474 E-.05763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.833 Y143.789 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.879 Y144.112 E.01083
G3 X143.516 Y140.63 I-3.878 J.384 E.60577
G1 X143.904 Y140.601 E.01291
G3 X147.821 Y143.728 I.097 J3.896 E.18059
G1 X147.822 Y143.73 E.00008
M204 S10000
G1 X147.431 Y143.849 F42000
M73 P30 R22
G1 F5400
M204 S6000
G1 X147.474 Y144.153 E.01015
G3 X143.567 Y141.034 I-3.473 J.344 E.54249
G1 X143.914 Y141.008 E.01156
G3 X147.418 Y143.791 I.087 J3.489 E.16113
M204 S250
G1 X147.043 Y143.908 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X147.083 Y144.192 E.00881
G3 X143.615 Y141.424 I-3.082 J.306 E.44606
G1 X143.924 Y141.401 E.0095
G3 X147.03 Y143.849 I.077 J3.097 E.13182
; WIPE_START
M204 S6000
G1 X147.083 Y144.192 E-.13162
G1 X147.101 Y144.5 E-.11738
G1 X147.086 Y144.809 E-.11743
G1 X147.04 Y145.114 E-.11749
G1 X146.964 Y145.414 E-.11745
G1 X146.858 Y145.704 E-.1174
G1 X146.811 Y145.802 E-.04123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.799 Y138.433 Z.8 F42000
G1 X149.992 Y134.009 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.321 E.07656
G3 X151.988 Y145.991 I-.306 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.187 J-3.735 E.04473
G3 X143.989 Y150.991 I-5.569 J-2.304 E.23521
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.028 Y105.01 E1.32734
G3 X149.992 Y111.013 I-.044 J6.007 E.31143
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.523 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.437 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.033 Y104.603 E1.32767
G3 X150.399 Y111.008 I-.05 J6.416 E.3323
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.14 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.585 J-1.836 E.27203
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.038 Y104.211 E1.23013
G3 X150.791 Y111.003 I-.056 J6.808 E.32641
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25803
G1 X152.788 Y133.26 E-.04246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
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
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X148.637 Y138.536 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42085
G1 F9525.574
M204 S6000
G1 X146.255 Y140.918 E.10377
G3 X146.569 Y141.138 I-.941 J1.681 E.01184
G1 X148.192 Y139.515 E.07068
G2 X148.163 Y140.079 I2.804 J.429 E.01742
G1 X146.859 Y141.382 E.05677
G3 X147.126 Y141.65 I-1.205 J1.465 E.01166
G1 X148.201 Y140.575 E.04684
G2 X148.297 Y141.014 I2.241 J-.259 E.01385
G1 X147.369 Y141.942 E.04044
G3 X147.587 Y142.258 I-1.47 J1.25 E.01185
G1 X148.432 Y141.414 E.03678
G2 X148.6 Y141.78 I1.914 J-.657 E.01243
G1 X147.78 Y142.6 E.03572
G3 X147.944 Y142.97 I-1.765 J1.007 E.01249
G1 X148.798 Y142.116 E.03719
G2 X149.026 Y142.422 I1.335 J-.758 E.01179
G1 X148.077 Y143.371 E.04134
G3 X148.174 Y143.809 I-2.143 J.7 E.01384
G1 X149.277 Y142.706 E.04806
G2 X149.556 Y142.961 I1.16 J-.986 E.01168
G1 X148.225 Y144.293 E.05798
G3 X148.219 Y144.833 I-2.703 J.239 E.01668
G1 X149.862 Y143.19 E.07159
G2 X150.196 Y143.39 I1.169 J-1.569 E.01202
G1 X148.118 Y145.468 E.0905
G3 X147.834 Y146.286 I-4.21 J-1.002 E.02672
G1 X150.56 Y143.561 E.11871
G2 X150.957 Y143.698 I.885 J-1.91 E.01296
G1 X143.999 Y150.657 E.30306
G1 X144.561 Y150.629 E.01734
G1 X151.397 Y143.793 E.29774
G2 X151.888 Y143.837 I.465 J-2.429 E.01519
G1 X150.067 Y145.657 E.07929
G1 X150.603 Y145.656 E.01652
G1 X152.443 Y143.816 E.08012
G2 X153.121 Y143.672 I-.621 J-4.605 E.02137
G1 X151.139 Y145.654 E.0863
G1 X151.676 Y145.652 E.01652
G1 X157.643 Y139.685 E.25989
G3 X157.647 Y140.215 I-2.653 J.287 E.01635
G1 X152.212 Y145.65 E.23672
G2 X152.798 Y145.598 I.025 J-3.06 E.01816
G1 X157.597 Y140.799 E.209
G3 X157.455 Y141.476 I-3.453 J-.372 E.02133
G1 X153.477 Y145.454 E.17327
G2 X154.303 Y145.162 I-1.664 J-6.023 E.02703
G1 X157.158 Y142.307 E.12434
G3 X156.054 Y143.946 I-5.057 J-2.216 E.06121
G1 X155.012 Y144.988 E.04535
M204 S10000
G1 X155.392 Y141.402 F42000
G1 F9525.574
M204 S6000
G1 X157.596 Y139.197 E.09603
G1 X157.516 Y138.742 E.01421
G1 X155.814 Y140.445 E.07414
G2 X155.839 Y139.885 I-2.784 J-.406 E.01729
G1 X157.399 Y138.325 E.06793
G2 X157.259 Y137.931 I-2.038 J.505 E.0129
G1 X155.795 Y139.395 E.06375
G2 X155.697 Y138.959 I-2.233 J.273 E.0138
G1 X157.098 Y137.557 E.06103
G1 X156.917 Y137.204 E.01223
G1 X155.56 Y138.561 E.0591
G2 X155.39 Y138.197 I-1.904 J.668 E.0124
G1 X156.712 Y136.874 E.05759
G1 X156.487 Y136.565 E.01179
G1 X155.189 Y137.863 E.05652
G2 X154.961 Y137.556 I-1.643 J.986 E.01178
G1 X156.246 Y136.271 E.05597
G2 X155.991 Y135.992 I-2.034 J1.601 E.01166
G1 X154.706 Y137.277 E.05596
G2 X154.425 Y137.024 I-1.405 J1.279 E.01167
G1 X155.711 Y135.738 E.05601
G1 X155.42 Y135.494 E.01168
G1 X154.117 Y136.797 E.05677
G2 X153.778 Y136.602 I-.951 J1.255 E.01208
G1 X155.103 Y135.277 E.0577
G2 X154.774 Y135.071 I-1.537 J2.087 E.01195
G1 X153.417 Y136.428 E.0591
G2 X153.016 Y136.295 I-4.025 J11.452 E.01302
G1 X154.418 Y134.893 E.06105
G2 X154.048 Y134.728 I-1.285 J2.383 E.01247
G1 X152.573 Y136.203 E.06425
G2 X152.079 Y136.162 I-.451 J2.444 E.01528
G1 X153.652 Y134.59 E.06848
G1 X153.226 Y134.482 E.01354
G1 X151.52 Y136.187 E.07429
G2 X150.831 Y136.342 I.427 J3.515 E.02178
G1 X152.77 Y134.402 E.08447
G2 X152.281 Y134.357 I-.468 J2.408 E.01516
G1 X145.914 Y140.724 E.27729
G1 X145.546 Y140.558 E.01245
G1 X151.761 Y134.342 E.2707
G1 X151.227 Y134.342 E.01646
G1 X145.146 Y140.424 E.26486
G2 X144.708 Y140.327 I-.705 J2.144 E.01382
G1 X150.692 Y134.342 E.26063
G1 X150.158 Y134.342 E.01646
G1 X144.225 Y140.275 E.2584
G2 X143.683 Y140.283 I-.232 J2.712 E.01673
G1 X149.659 Y134.307 E.26028
G1 X149.659 Y133.773 E.01646
G1 X143.059 Y140.372 E.28743
G2 X142.253 Y140.644 I1.535 J5.877 E.02622
G1 X149.659 Y133.238 E.32255
G1 X149.659 Y132.704 E.01646
G1 X131.707 Y150.655 E.78184
G1 X132.241 Y150.655 E.01646
G1 X140.152 Y142.745 E.34451
G2 X139.878 Y143.553 I4.189 J1.868 E.02631
G1 X132.776 Y150.656 E.30933
G1 X133.31 Y150.656 E.01646
G1 X139.783 Y144.183 E.2819
G2 X139.778 Y144.723 I4.397 J.312 E.01663
G1 X133.845 Y150.656 E.25841
G1 X134.379 Y150.656 E.01646
G1 X139.829 Y145.205 E.23738
G2 X139.928 Y145.641 I2.226 J-.273 E.01379
G1 X134.913 Y150.656 E.21839
G1 X135.448 Y150.656 E.01646
G1 X140.062 Y146.042 E.20096
G2 X140.227 Y146.411 I1.932 J-.641 E.01248
G1 X135.982 Y150.656 E.18487
G1 X136.516 Y150.656 E.01646
G1 X140.419 Y146.753 E.16998
G2 X140.637 Y147.07 I1.688 J-.929 E.01185
G1 X137.051 Y150.656 E.1562
G1 X137.585 Y150.656 E.01646
G1 X140.881 Y147.361 E.14354
G2 X141.152 Y147.624 I1.325 J-1.095 E.01166
G1 X138.12 Y150.657 E.13209
G1 X138.654 Y150.657 E.01646
G1 X141.442 Y147.868 E.12144
G2 X141.759 Y148.086 I1.319 J-1.574 E.01185
G1 X139.188 Y150.657 E.11194
G1 X139.723 Y150.657 E.01646
G1 X142.104 Y148.275 E.10372
G2 X142.471 Y148.443 I1.031 J-1.772 E.01244
G1 X140.257 Y150.657 E.09643
G1 X140.791 Y150.657 E.01646
G1 X142.873 Y148.576 E.09065
G2 X143.311 Y148.672 I.702 J-2.139 E.01383
G1 X141.326 Y150.657 E.08644
G1 X141.86 Y150.657 E.01646
G1 X143.792 Y148.726 E.08412
G2 X144.331 Y148.72 I.141 J-13.207 E.01662
G1 X142.395 Y150.657 E.08435
G1 X142.929 Y150.657 E.01646
G1 X144.97 Y148.616 E.08889
G2 X145.788 Y148.333 I-.98 J-4.151 E.02669
G1 X143.294 Y150.827 E.10862
M204 S10000
G1 X146.57 Y150.224 F42000
G1 F9525.574
M204 S6000
G1 X148.799 Y147.994 E.09709
G2 X149.297 Y146.961 I-3.875 J-2.507 E.03541
G1 X145.95 Y150.308 E.14577
G3 X145.196 Y150.528 I-2.834 J-8.328 E.02419
G1 X149.839 Y145.885 E.20222
; WIPE_START
G1 X148.425 Y147.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.944 Y148.813 Z.8 F42000
G1 X131.003 Y150.825 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X149.659 Y132.169 E.8125
G1 X149.659 Y131.635 E.01646
G1 X130.638 Y150.655 E.82839
G1 X130.104 Y150.655 E.01646
G1 X149.659 Y131.1 E.85166
G1 X149.659 Y130.566 E.01646
G1 X129.57 Y150.655 E.87494
G1 X129.035 Y150.655 E.01646
G1 X149.659 Y130.031 E.89821
G1 X149.659 Y129.497 E.01646
G1 X128.501 Y150.655 E.92148
G1 X127.966 Y150.655 E.01646
G1 X149.659 Y128.962 E.94476
G1 X149.659 Y128.428 E.01646
G1 X127.432 Y150.655 E.96803
G1 X126.898 Y150.654 E.01646
G1 X149.659 Y127.893 E.9913
G1 X149.659 Y127.359 E.01646
G1 X126.363 Y150.654 E1.01458
G1 X125.829 Y150.654 E.01646
G1 X149.659 Y126.825 E1.03785
G1 X149.659 Y126.29 E.01646
G1 X125.295 Y150.654 E1.06112
G1 X124.76 Y150.654 E.01646
G1 X149.659 Y125.756 E1.0844
G1 X149.659 Y125.221 E.01646
G1 X124.226 Y150.654 E1.10767
G1 X123.691 Y150.654 E.01646
G1 X149.659 Y124.687 E1.13095
G1 X149.659 Y124.152 E.01646
G1 X123.157 Y150.654 E1.15422
G1 X122.623 Y150.654 E.01646
G1 X149.659 Y123.618 E1.17749
G1 X149.659 Y123.083 E.01646
G1 X122.088 Y150.654 E1.20077
G1 X121.554 Y150.653 E.01646
M73 P31 R22
G1 X149.659 Y122.549 E1.22404
G1 X149.659 Y122.014 E.01646
G1 X121.02 Y150.653 E1.24731
G1 X120.485 Y150.653 E.01646
G1 X149.659 Y121.48 E1.27059
G1 X149.659 Y120.945 E.01646
G1 X119.951 Y150.653 E1.29386
G1 X119.416 Y150.653 E.01646
G1 X149.659 Y120.411 E1.31713
G1 X149.659 Y119.876 E.01646
G1 X118.882 Y150.653 E1.34041
G1 X118.348 Y150.653 E.01646
G1 X149.659 Y119.342 E1.36368
G1 X149.659 Y118.807 E.01646
G1 X117.813 Y150.653 E1.38695
G1 X117.279 Y150.653 E.01646
G1 X149.659 Y118.273 E1.41023
G1 X149.659 Y117.738 E.01646
G1 X116.745 Y150.653 E1.4335
G1 X116.21 Y150.652 E.01646
G1 X132.02 Y134.842 E.68857
G1 X131.486 Y134.842 E.01646
G1 X115.676 Y150.652 E.68857
G1 X115.142 Y150.652 E.01646
G1 X130.951 Y134.842 E.68856
G1 X130.417 Y134.842 E.01646
G1 X114.607 Y150.652 E.68856
G1 X114.073 Y150.652 E.01646
G1 X129.882 Y134.842 E.68855
G1 X129.348 Y134.842 E.01646
G1 X113.538 Y150.652 E.68855
G1 X113.004 Y150.652 E.01646
G1 X128.813 Y134.842 E.68855
G1 X128.279 Y134.842 E.01646
G1 X112.47 Y150.652 E.68854
G1 X111.935 Y150.652 E.01646
G1 X128.159 Y134.428 E.70658
G1 X128.159 Y133.894 E.01646
G1 X111.401 Y150.652 E.72985
G1 X110.867 Y150.651 E.01646
G1 X128.159 Y133.359 E.75312
G1 X128.159 Y132.825 E.01646
G1 X110.332 Y150.651 E.7764
G1 X109.798 Y150.651 E.01646
G1 X128.159 Y132.29 E.79967
G1 X128.159 Y131.756 E.01646
G1 X109.263 Y150.651 E.82294
G1 X108.729 Y150.651 E.01646
G1 X128.159 Y131.221 E.84622
G1 X128.159 Y130.687 E.01646
G1 X108.195 Y150.651 E.86949
G1 X107.66 Y150.651 E.01646
G1 X128.159 Y130.152 E.89276
G1 X128.159 Y129.618 E.01646
G1 X107.126 Y150.651 E.91604
G1 X106.592 Y150.651 E.01646
G1 X128.159 Y129.083 E.93931
G1 X128.159 Y128.549 E.01646
G1 X106.057 Y150.651 E.96259
G1 X105.523 Y150.65 E.01646
G1 X128.328 Y127.845 E.99325
M204 S10000
G1 X128.846 Y127.327 F42000
G1 F9525.574
M204 S6000
G1 X141.366 Y114.808 E.54527
G2 X141.675 Y115.032 I1.351 J-1.536 E.0118
G1 X129.55 Y127.158 E.52809
G1 X130.085 Y127.158 E.01646
G1 X142.011 Y115.231 E.51944
G2 X142.375 Y115.401 I1.037 J-1.741 E.0124
G1 X130.619 Y127.158 E.51202
G1 X131.153 Y127.158 E.01646
G1 X142.766 Y115.545 E.50574
G2 X143.194 Y115.652 I.745 J-2.086 E.01361
G1 X131.688 Y127.158 E.50111
G1 X132.222 Y127.158 E.01646
G1 X143.664 Y115.716 E.49832
G2 X144.19 Y115.724 I.308 J-2.843 E.01623
G1 X132.757 Y127.158 E.49796
G1 X132.843 Y127.158 E.00267
G1 X132.843 Y127.606 E.01379
G1 X144.792 Y115.657 E.52039
G2 X145.539 Y115.444 I-.689 J-3.84 E.02396
G1 X132.674 Y128.31 E.56032
M204 S10000
G1 X132.674 Y134.189 F42000
G1 F9525.574
M204 S6000
G1 X149.659 Y117.204 E.73974
M73 P31 R21
G1 X149.659 Y116.67 E.01646
G1 X132.843 Y133.485 E.73235
G1 X132.843 Y132.95 E.01646
G1 X149.659 Y116.135 E.73235
G1 X149.659 Y115.601 E.01646
G1 X132.843 Y132.416 E.73235
G1 X132.843 Y131.881 E.01646
G1 X149.659 Y115.066 E.73235
G1 X149.659 Y114.532 E.01646
G1 X132.843 Y131.347 E.73235
G1 X132.843 Y130.812 E.01646
G1 X149.659 Y113.997 E.73235
G1 X149.659 Y113.463 E.01646
G1 X132.843 Y130.278 E.73235
G1 X132.843 Y129.743 E.01646
G1 X149.659 Y112.928 E.73235
G1 X149.659 Y112.394 E.01646
G1 X132.843 Y129.209 E.73235
G1 X132.843 Y128.674 E.01646
G1 X149.659 Y111.859 E.73235
G1 X149.659 Y111.325 E.01646
G1 X147.939 Y113.044 E.07489
G2 X148.158 Y112.291 I-4.673 J-1.768 E.0242
G1 X149.653 Y110.796 E.0651
G2 X149.61 Y110.305 I-3.355 J.048 E.0152
G1 X148.226 Y111.689 E.06029
G2 X148.218 Y111.162 I-2.634 J-.226 E.01626
G1 X149.533 Y109.847 E.05724
G2 X149.431 Y109.415 I-2.979 J.475 E.01369
G1 X148.156 Y110.69 E.05553
G2 X148.05 Y110.262 I-2.192 J.315 E.01361
G1 X149.293 Y109.018 E.05415
G2 X149.14 Y108.637 I-2.662 J.847 E.01267
G1 X147.908 Y109.869 E.05366
G2 X147.735 Y109.507 I-1.903 J.686 E.01237
G1 X148.957 Y108.285 E.05321
G2 X148.758 Y107.949 I-1.833 J.855 E.01204
G1 X147.535 Y109.173 E.05329
G2 X147.309 Y108.864 I-1.656 J.972 E.0118
G1 X148.543 Y107.63 E.05373
G2 X148.304 Y107.334 I-1.997 J1.368 E.01172
G1 X147.06 Y108.579 E.05421
G2 X146.786 Y108.318 I-1.441 J1.234 E.01166
G1 X148.05 Y107.054 E.05504
G2 X147.775 Y106.795 I-1.48 J1.293 E.01166
G1 X146.489 Y108.081 E.05601
G2 X146.168 Y107.868 I-1.222 J1.499 E.0119
G1 X147.487 Y106.548 E.05748
G2 X147.175 Y106.326 I-1.564 J1.864 E.01181
G1 X145.82 Y107.681 E.05904
G2 X145.443 Y107.523 I-.977 J1.802 E.0126
G1 X146.852 Y106.115 E.06135
G2 X146.503 Y105.929 I-1.886 J3.118 E.01217
G1 X145.034 Y107.398 E.06398
G2 X144.586 Y107.311 I-.658 J2.196 E.01407
G1 X146.131 Y105.766 E.0673
G2 X145.74 Y105.623 I-.934 J1.948 E.01285
G1 X144.091 Y107.272 E.07182
G2 X143.534 Y107.294 I-.167 J2.793 E.01719
G1 X145.327 Y105.501 E.07809
G2 X144.876 Y105.418 I-.792 J3.017 E.01414
G1 X142.868 Y107.426 E.08745
G2 X141.971 Y107.789 I1.167 J4.177 E.02988
G1 X144.397 Y105.362 E.10568
G2 X143.882 Y105.343 I-.445 J5.085 E.01589
G1 X119.843 Y129.382 E1.04693
G1 X119.843 Y129.916 E.01646
G1 X140.294 Y109.466 E.89066
G2 X139.924 Y110.37 I3.818 J2.087 E.03013
G1 X119.843 Y130.451 E.87458
G1 X119.843 Y130.985 E.01646
G1 X139.798 Y111.03 E.86908
G2 X139.772 Y111.591 I2.878 J.418 E.01732
G1 X119.843 Y131.519 E.86793
G1 X119.843 Y132.054 E.01646
G1 X139.81 Y112.087 E.86961
G2 X139.896 Y112.536 I2.067 J-.163 E.0141
G1 X119.843 Y132.588 E.87335
G1 X119.843 Y133.123 E.01646
G1 X140.021 Y112.945 E.87881
G2 X140.18 Y113.321 I1.994 J-.617 E.01259
G1 X119.843 Y133.657 E.8857
G1 X119.843 Y134.192 E.01646
G1 X140.367 Y113.669 E.89385
G2 X140.58 Y113.99 I1.704 J-.902 E.01189
G1 X103.92 Y150.65 E1.59667
G3 X103.416 Y150.62 I-.097 J-2.58 E.01558
G1 X105.632 Y148.404 E.09652
G3 X104.859 Y148.642 I-1.727 J-4.232 E.02493
G1 X102.949 Y150.552 E.08318
G3 X102.513 Y150.453 I.282 J-2.263 E.01379
G1 X104.243 Y148.723 E.07533
G3 X103.712 Y148.72 I-.245 J-2.874 E.01637
G1 X102.103 Y150.329 E.07008
G3 X101.725 Y150.173 I.611 J-2.021 E.01263
G1 X103.238 Y148.659 E.06591
G3 X102.806 Y148.557 I.297 J-2.21 E.01369
G1 X101.365 Y149.998 E.06275
G3 X101.021 Y149.807 I1.119 J-2.426 E.01212
G1 X102.41 Y148.419 E.06046
G3 X102.048 Y148.246 I.691 J-1.917 E.01237
G1 X100.705 Y149.589 E.05849
G3 X100.399 Y149.361 I1.006 J-1.662 E.01178
G1 X101.707 Y148.053 E.05696
G3 X101.394 Y147.831 I1.027 J-1.773 E.01182
G1 X100.119 Y149.106 E.05557
G3 X99.853 Y148.837 I1.236 J-1.481 E.01166
G1 X101.109 Y147.582 E.05467
G3 X100.842 Y147.314 I1.076 J-1.338 E.01166
G1 X99.602 Y148.554 E.05399
G1 X99.375 Y148.247 E.01177
G1 X100.601 Y147.02 E.05342
G3 X100.385 Y146.702 I1.466 J-1.229 E.01187
G1 X99.165 Y147.922 E.05313
G3 X98.972 Y147.581 I1.634 J-1.153 E.01209
G1 X100.197 Y146.356 E.05335
G3 X100.037 Y145.982 I1.792 J-.988 E.01256
G1 X98.8 Y147.218 E.05385
G3 X98.652 Y146.831 I3.699 J-1.634 E.01276
G1 X99.908 Y145.576 E.05467
G3 X99.815 Y145.134 I2.161 J-.684 E.01393
G1 X98.528 Y146.421 E.05606
G3 X98.435 Y145.98 I2.192 J-.691 E.01392
G1 X99.771 Y144.643 E.0582
G3 X99.792 Y144.088 I2.874 J-.17 E.01714
G1 X98.374 Y145.507 E.06179
G3 X98.351 Y144.995 I2.594 J-.371 E.0158
G1 X99.901 Y143.445 E.06752
G3 X100.232 Y142.58 I4.618 J1.269 E.02856
G1 X98.351 Y144.461 E.08191
G1 X98.351 Y143.926 E.01646
G1 X136.932 Y105.345 E1.68034
G1 X137.467 Y105.344 E.01646
G1 X115.654 Y127.158 E.95003
G1 X116.188 Y127.158 E.01646
G1 X138.002 Y105.344 E.95003
G1 X138.536 Y105.344 E.01646
G1 X116.723 Y127.158 E.95003
G1 X117.257 Y127.158 E.01646
G1 X139.071 Y105.344 E.95004
G1 X139.605 Y105.344 E.01646
G1 X117.792 Y127.158 E.95004
G1 X118.326 Y127.158 E.01646
G1 X140.14 Y105.344 E.95005
G1 X140.674 Y105.344 E.01646
G1 X118.861 Y127.158 E.95005
G1 X119.395 Y127.158 E.01646
G1 X141.209 Y105.344 E.95005
G1 X141.743 Y105.344 E.01646
G1 X119.843 Y127.244 E.95381
G1 X119.843 Y127.778 E.01646
G1 X142.278 Y105.344 E.97709
G1 X142.813 Y105.344 E.01646
G1 X119.843 Y128.313 E1.00037
G1 X119.843 Y128.847 E.01646
G1 X143.517 Y105.174 E1.03104
M204 S10000
G1 X98.176 Y122.722 F42000
M73 P32 R21
G1 F9525.574
M204 S6000
G1 X105.41 Y115.488 E.31506
G3 X104.688 Y115.676 I-1.607 J-4.688 E.02302
G1 X98.346 Y122.018 E.2762
G1 X98.346 Y121.483 E.01646
G1 X104.104 Y115.725 E.25077
G3 X103.585 Y115.71 I-.174 J-2.818 E.01601
G1 X98.346 Y120.949 E.22818
G1 X98.346 Y120.414 E.01646
G1 X103.121 Y115.639 E.20799
G3 X102.699 Y115.527 I.349 J-2.165 E.01348
G1 X98.345 Y119.88 E.18961
G1 X98.345 Y119.346 E.01646
G1 X102.314 Y115.377 E.17287
G3 X101.955 Y115.201 I.699 J-1.888 E.01233
G1 X98.345 Y118.811 E.15723
G1 X98.345 Y118.277 E.01646
G1 X101.623 Y114.999 E.14278
G3 X101.318 Y114.77 I1.066 J-1.742 E.01178
G1 X98.345 Y117.743 E.12948
G1 X98.345 Y117.208 E.01646
G1 X101.038 Y114.515 E.11731
G3 X100.779 Y114.239 I1.113 J-1.307 E.01167
G1 X98.345 Y116.674 E.10604
G1 X98.345 Y116.14 E.01646
G1 X100.546 Y113.939 E.09586
G3 X100.337 Y113.613 I1.52 J-1.206 E.01193
G1 X98.344 Y115.605 E.08676
G1 X98.344 Y115.071 E.01646
G1 X100.154 Y113.261 E.07883
G3 X100.001 Y112.88 I1.831 J-.956 E.01268
G1 X98.344 Y114.537 E.07217
G1 X98.344 Y114.002 E.01646
G1 X99.882 Y112.465 E.06697
G3 X99.803 Y112.009 I2.022 J-.582 E.01428
G1 X98.344 Y113.468 E.06356
G1 X98.344 Y112.934 E.01646
G1 X99.772 Y111.506 E.06219
G3 X99.808 Y110.935 I2.957 J-.101 E.01763
G1 X98.344 Y112.399 E.06376
G1 X98.344 Y111.865 E.01646
G1 X100.243 Y109.966 E.08272
M204 S10000
G1 X99.033 Y107.969 F42000
G1 F9525.574
M204 S6000
G1 X100.007 Y106.995 E.04243
G3 X101.698 Y105.839 I3.928 J3.93 E.06344
G1 X98.84 Y108.696 E.12447
G2 X98.546 Y109.525 I6.252 J2.683 E.02708
G1 X102.528 Y105.543 E.17342
G3 X103.171 Y105.404 I1.025 J3.198 E.02029
G1 X103.204 Y105.401 E.00102
G1 X98.408 Y110.197 E.20886
G2 X98.355 Y110.785 I2.941 J.563 E.01821
G1 X103.79 Y105.35 E.23669
G1 X104.324 Y105.35 E.01646
G1 X98.174 Y111.5 E.26786
; WIPE_START
G1 X99.588 Y110.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.467 Y107.742 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X104.859 Y105.35 E.10417
G1 X105.393 Y105.35 E.01646
G1 X103.438 Y107.305 E.08517
G3 X104.007 Y107.27 I.641 J5.738 E.01759
G1 X105.928 Y105.35 E.08364
G1 X106.462 Y105.349 E.01646
G1 X104.51 Y107.302 E.08503
G3 X104.964 Y107.382 I-.175 J2.31 E.01423
G1 X106.997 Y105.349 E.08854
G1 X107.532 Y105.349 E.01646
G1 X105.379 Y107.502 E.09375
G3 X105.761 Y107.655 I-.573 J1.985 E.01268
G1 X108.066 Y105.349 E.10041
G1 X108.601 Y105.349 E.01646
G1 X106.113 Y107.836 E.10833
G3 X106.439 Y108.045 I-.877 J1.732 E.01194
G1 X109.135 Y105.349 E.11741
G1 X109.67 Y105.349 E.01646
G1 X106.741 Y108.278 E.12756
G3 X107.018 Y108.535 I-1.143 J1.513 E.01167
G1 X110.204 Y105.349 E.13875
G1 X110.739 Y105.349 E.01646
G1 X107.272 Y108.815 E.15097
G3 X107.502 Y109.12 I-1.422 J1.313 E.01177
G1 X111.273 Y105.349 E.16424
G1 X111.808 Y105.349 E.01646
G1 X107.705 Y109.451 E.17869
G3 X107.881 Y109.81 I-1.703 J1.057 E.01232
G1 X112.343 Y105.349 E.19432
G1 X112.877 Y105.348 E.01646
G1 X108.027 Y110.198 E.21122
G3 X108.141 Y110.619 I-2.052 J.777 E.01346
G1 X113.412 Y105.348 E.22957
G1 X113.946 Y105.348 E.01646
G1 X108.214 Y111.08 E.24965
G3 X108.23 Y111.599 I-2.578 J.339 E.016
G1 X114.481 Y105.348 E.27223
G1 X115.015 Y105.348 E.01646
G1 X108.174 Y112.19 E.29798
G3 X107.988 Y112.91 I-4.244 J-.71 E.02293
G1 X115.55 Y105.348 E.32934
G1 X116.085 Y105.348 E.01646
G1 X98.346 Y123.086 E.77256
G1 X98.346 Y123.621 E.01646
G1 X116.619 Y105.348 E.79583
G1 X117.154 Y105.348 E.01646
G1 X98.346 Y124.155 E.81911
G1 X98.346 Y124.689 E.01646
G1 X117.688 Y105.348 E.84239
G1 X118.223 Y105.348 E.01646
G1 X98.347 Y125.224 E.86566
G1 X98.347 Y125.758 E.01646
G1 X118.757 Y105.347 E.88894
G1 X119.292 Y105.347 E.01646
G1 X98.347 Y126.292 E.91222
G1 X98.347 Y126.827 E.01646
G1 X119.826 Y105.347 E.93549
G1 X120.361 Y105.347 E.01646
G1 X98.347 Y127.361 E.95877
G1 X98.347 Y127.895 E.01646
G1 X120.896 Y105.347 E.98205
G1 X121.43 Y105.347 E.01646
G1 X98.347 Y128.43 E1.00532
G1 X98.347 Y128.964 E.01646
G1 X121.965 Y105.347 E1.0286
G1 X122.499 Y105.347 E.01646
G1 X98.348 Y129.499 E1.05188
G1 X98.348 Y130.033 E.01646
G1 X123.034 Y105.347 E1.07515
G1 X123.568 Y105.347 E.01646
G1 X98.348 Y130.567 E1.09843
G1 X98.348 Y131.102 E.01646
G1 X124.103 Y105.347 E1.1217
G1 X124.637 Y105.346 E.01646
G1 X98.348 Y131.636 E1.14498
G1 X98.348 Y132.17 E.01646
G1 X125.172 Y105.346 E1.16826
G1 X125.707 Y105.346 E.01646
G1 X98.348 Y132.705 E1.19153
G1 X98.348 Y133.239 E.01646
G1 X126.241 Y105.346 E1.21481
G1 X126.776 Y105.346 E.01646
G1 X98.348 Y133.773 E1.23809
G1 X98.349 Y134.308 E.01646
G1 X127.31 Y105.346 E1.26136
G1 X127.845 Y105.346 E.01646
G1 X98.349 Y134.842 E1.28464
G1 X98.349 Y135.376 E.01646
G1 X128.379 Y105.346 E1.30792
G1 X128.914 Y105.346 E.01646
G1 X98.349 Y135.911 E1.33119
G1 X98.349 Y136.445 E.01646
G1 X129.449 Y105.346 E1.35447
G1 X129.983 Y105.346 E.01646
G1 X98.349 Y136.98 E1.37775
G1 X98.349 Y137.514 E.01646
G1 X130.518 Y105.346 E1.40102
G1 X131.052 Y105.345 E.01646
G1 X98.349 Y138.048 E1.4243
G1 X98.35 Y138.583 E.01646
G1 X131.587 Y105.345 E1.44758
G1 X132.121 Y105.345 E.01646
G1 X98.35 Y139.117 E1.47085
G1 X98.35 Y139.651 E.01646
G1 X132.656 Y105.345 E1.49413
G1 X133.19 Y105.345 E.01646
G1 X98.35 Y140.186 E1.51741
G1 X98.35 Y140.72 E.01646
G1 X133.725 Y105.345 E1.54068
G1 X134.26 Y105.345 E.01646
G1 X98.35 Y141.254 E1.56396
G1 X98.35 Y141.789 E.01646
G1 X134.794 Y105.345 E1.58724
G1 X135.329 Y105.345 E.01646
G1 X98.35 Y142.323 E1.61051
G1 X98.35 Y142.857 E.01646
G1 X135.863 Y105.345 E1.63379
G1 X136.398 Y105.345 E.01646
G1 X98.181 Y143.561 E1.66445
M204 S10000
G1 X101.543 Y141.269 F42000
G1 F9525.574
M204 S6000
G1 X115.159 Y127.653 E.59302
G1 X115.159 Y128.187 E.01646
G1 X102.94 Y140.405 E.53214
G3 X103.59 Y140.29 I1.123 J4.439 E.02034
G1 X115.159 Y128.722 E.50384
G1 X115.159 Y129.256 E.01646
G1 X104.141 Y140.273 E.47983
G3 X104.632 Y140.317 I.027 J2.472 E.0152
G1 X115.159 Y129.791 E.45846
G1 X115.159 Y130.325 E.01646
G1 X105.076 Y140.408 E.43913
G3 X105.482 Y140.536 I-.439 J2.091 E.01313
G1 X115.159 Y130.86 E.42145
G1 X115.159 Y131.394 E.01646
G1 X105.855 Y140.697 E.40519
G3 X106.2 Y140.887 I-.774 J1.819 E.01214
G1 X115.159 Y131.928 E.39016
G1 X115.159 Y132.463 E.01646
G1 X106.519 Y141.102 E.37627
G3 X106.814 Y141.342 I-1.053 J1.593 E.01172
G1 X115.159 Y132.997 E.36344
G1 X115.159 Y133.532 E.01646
G1 X107.085 Y141.606 E.35165
G3 X107.332 Y141.893 I-1.312 J1.378 E.01169
G1 X115.159 Y134.066 E.34089
G1 X115.159 Y134.601 E.01646
G1 X107.555 Y142.205 E.33118
G3 X107.752 Y142.542 I-1.586 J1.154 E.01205
G1 X115.452 Y134.842 E.33535
G1 X115.986 Y134.842 E.01646
G1 X107.921 Y142.907 E.35124
G3 X108.06 Y143.303 I-1.909 J.89 E.01294
G1 X116.521 Y134.842 E.36848
G1 X117.055 Y134.842 E.01646
G1 X108.162 Y143.735 E.3873
G3 X108.221 Y144.211 I-2.352 J.53 E.0148
G1 X117.589 Y134.842 E.40804
G1 X118.124 Y134.842 E.01646
G1 X108.223 Y144.743 E.43121
G3 X108.148 Y145.353 I-5.887 J-.419 E.01894
G1 X118.658 Y134.842 E.45778
G1 X119.193 Y134.842 E.01646
G1 X107.537 Y146.498 E.50765
M204 S10000
G1 X104.819 Y150.82 F42000
G1 F9525.574
M204 S6000
G1 X141.082 Y114.557 E1.57938
G3 X140.818 Y114.286 I1.09 J-1.326 E.01166
M73 P33 R21
G1 X104.284 Y150.82 E1.59116
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9525.574
G1 X105.699 Y149.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/53
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I.605 J1.056 P1  F42000
G1 X131.711 Y134.509 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.492 Y134.509 E.10678
G1 X128.492 Y127.491 E.23281
G1 X132.51 Y127.491 E.13329
G1 X132.51 Y134.509 E.23281
G1 X131.771 Y134.509 E.02452
M204 S10000
G1 X132.103 Y133.71 F42000
G1 F5400
M204 S6000
G1 X132.103 Y134.102 E.01301
G1 X128.899 Y134.102 E.10629
G1 X128.899 Y127.898 E.2058
G1 X132.103 Y127.898 E.10629
G1 X132.103 Y133.65 E.19081
M204 S250
G1 X131.711 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X129.291 Y133.71 E.07436
G1 X129.291 Y128.29 E.16654
G1 X131.711 Y128.29 E.07436
G1 X131.711 Y133.65 E.1647
; WIPE_START
M204 S6000
G1 X129.712 Y133.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.093 Y134.159 Z1 F42000
G1 X116.291 Y134.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X115.492 Y134.509 E.02651
G1 X115.492 Y127.491 E.23281
G1 X119.51 Y127.491 E.13329
G1 X119.51 Y134.509 E.23281
G1 X116.351 Y134.509 E.10479
M204 S10000
G1 X116.291 Y134.102 F42000
G1 F5400
M204 S6000
G1 X115.899 Y134.102 E.01301
G1 X115.899 Y127.898 E.2058
G1 X119.103 Y127.898 E.10629
G1 X119.103 Y134.102 E.2058
G1 X116.351 Y134.102 E.09129
M204 S250
G1 X116.291 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.291 Y128.29 E.16654
G1 X118.711 Y128.29 E.07436
G1 X118.711 Y133.71 E.16654
G1 X116.351 Y133.71 E.07252
; WIPE_START
M204 S6000
G1 X116.329 Y131.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.953 Y136.87 Z1 F42000
G1 X126.541 Y141.08 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X123.995 Y144.877 I-1.245 J1.917 E.24042
G3 X124.001 Y141.12 I-1.291 J-1.881 E.32907
G1 X124.363 Y140.911 E.01384
G1 X124.826 Y140.759 E.01618
G3 X126.49 Y141.048 I.469 J2.237 E.05737
M204 S10000
G1 X126.472 Y141.531 F42000
G1 F5400
M204 S6000
G3 X124.004 Y144.351 I-1.173 J1.463 E.20082
G3 X124.001 Y141.651 I-1.301 J-1.348 E.29052
G3 X124.529 Y141.285 I1.563 J1.689 E.0214
G1 X124.912 Y141.159 E.01335
G3 X126.425 Y141.495 I.387 J1.835 E.053
; WIPE_START
G1 X126.737 Y141.796 E-.16474
G1 X126.946 Y142.103 E-.14136
G1 X127.027 Y142.271 E-.07076
G1 X127.138 Y142.63 E-.14285
G1 X127.175 Y143 E-.14099
G1 X127.165 Y143.187 E-.07127
G1 X127.151 Y143.259 E-.02802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.78 Y143.485 Z1 F42000
G1 X147.643 Y143.865 Z1
G1 Z.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X147.689 Y144.131 E.00896
G3 X143.775 Y140.811 I-3.68 J.371 E.58266
G3 X145.689 Y141.207 I.241 J3.654 E.06563
G3 X147.633 Y143.766 I-1.68 J3.294 E.11026
G1 X147.637 Y143.805 E.00131
M204 S10000
G1 X147.24 Y143.925 F42000
G1 F5400
M204 S6000
G1 X147.283 Y144.172 E.00829
G3 X143.806 Y141.217 I-3.273 J.329 E.51843
G3 X145.204 Y141.435 I.19 J3.372 E.0473
G3 X147.234 Y143.846 I-1.194 J3.065 E.10904
G1 X147.236 Y143.866 E.00064
M204 S250
G1 X146.853 Y143.984 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X146.895 Y144.21 E.00708
G3 X143.835 Y141.608 I-2.884 J.291 E.42326
G3 X144.787 Y141.708 I.184 J2.814 E.02954
G3 X146.851 Y143.924 I-.776 J2.793 E.09791
; WIPE_START
M204 S6000
G1 X146.895 Y144.21 E-.11015
G1 X146.901 Y144.5 E-.11007
G1 X146.887 Y144.789 E-.10989
G1 X146.844 Y145.075 E-.10982
G1 X146.772 Y145.355 E-.1099
G1 X146.674 Y145.627 E-.10988
G1 X146.559 Y145.864 E-.10028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.839 Y138.58 Z1 F42000
G1 X148.906 Y138.365 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.007 Y138.17 E.00727
G3 X151.914 Y136.492 I2.994 J1.829 E.1161
G1 X152.089 Y136.492 E.0058
G3 X148.767 Y138.637 I-.087 J3.508 E.59202
G1 X148.879 Y138.419 E.00814
M204 S10000
G1 X149.268 Y138.55 F42000
G1 F5400
M204 S6000
G1 X149.354 Y138.383 E.00626
G3 X151.924 Y136.899 I2.647 J1.617 E.10264
G1 X152.078 Y136.899 E.00513
G3 X149.143 Y138.795 I-.077 J3.101 E.52333
G1 X149.24 Y138.604 E.00713
M204 S250
G1 X149.611 Y138.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.621 Y138.704 E.00073
G3 X151.934 Y137.291 I2.38 J1.295 E.0872
G1 X152.069 Y137.291 E.00415
G3 X149.504 Y138.947 I-.068 J2.709 E.42348
G1 X149.585 Y138.78 E.00572
; WIPE_START
M204 S6000
G1 X149.621 Y138.704 E-.03185
G1 X149.762 Y138.473 E-.10269
G1 X150.014 Y138.157 E-.15394
G1 X150.208 Y137.968 E-.1027
G1 X150.419 Y137.8 E-.10263
G1 X150.646 Y137.653 E-.10261
G1 X150.886 Y137.53 E-.1027
G1 X151.036 Y137.471 E-.06088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.52 Y129.991 Z1 F42000
G1 X145.057 Y107.956 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.353 Y108.055 E.01036
G3 X143.674 Y107.818 I-1.343 J3.446 E.71409
G3 X144.999 Y107.939 I.323 J3.771 E.04437
M204 S10000
G1 X144.927 Y108.342 F42000
G1 F5400
M204 S6000
G1 X145.204 Y108.435 E.00968
G3 X143.705 Y108.224 I-1.195 J3.065 E.63504
G3 X144.869 Y108.326 I.293 J3.357 E.03898
M204 S250
G1 X144.802 Y108.713 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X145.061 Y108.799 E.00837
G3 X143.734 Y108.615 I-1.051 J2.701 E.51811
G3 X144.745 Y108.697 I.281 J2.823 E.03133
; WIPE_START
M204 S6000
G1 X145.061 Y108.799 E-.1263
G1 X145.324 Y108.919 E-.10988
G1 X145.575 Y109.064 E-.10985
G1 X145.809 Y109.232 E-.10987
G1 X146.026 Y109.424 E-.1099
G1 X146.223 Y109.636 E-.10988
G1 X146.357 Y109.813 E-.08432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.725 Y109.765 Z1 F42000
G1 X100.873 Y109.527 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.059 Y109.271 E.01048
G3 X103.775 Y107.811 I2.95 J2.23 E.10554
G3 X105.689 Y108.207 I.241 J3.656 E.06563
G3 X100.848 Y109.582 I-1.68 J3.294 E.58721
M204 S10000
G1 X101.21 Y109.756 F42000
G1 F5400
M204 S6000
G1 X101.384 Y109.518 E.00981
G3 X103.806 Y108.217 I2.626 J1.982 E.09408
G3 X105.204 Y108.435 I.19 J3.372 E.0473
G3 X101.186 Y109.811 I-1.194 J3.065 E.53257
M204 S250
G1 X101.533 Y109.977 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X101.697 Y109.755 E.00849
G3 X103.835 Y108.608 I2.314 J1.746 E.07692
G3 X104.787 Y108.708 I.184 J2.814 E.02954
G3 X101.512 Y110.031 I-.776 J2.793 E.44295
; WIPE_START
M204 S6000
G1 X101.697 Y109.755 E-.12625
G1 X101.875 Y109.527 E-.10973
G1 X102.082 Y109.325 E-.10987
G1 X102.308 Y109.145 E-.10986
G1 X102.551 Y108.988 E-.10991
G1 X102.808 Y108.856 E-.10984
G1 X103.015 Y108.775 E-.08455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.586 Y116.386 Z1 F42000
G1 X105.438 Y141.094 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.69 Y141.206 E.00914
G3 X103.674 Y140.818 I-1.679 J3.295 E.70184
G3 X105.353 Y141.055 I.323 J3.771 E.05672
G1 X105.384 Y141.069 E.00111
M204 S10000
G1 X105.271 Y141.465 F42000
G1 F5400
M204 S6000
G1 X105.504 Y141.569 E.00846
G3 X103.705 Y141.224 I-1.494 J2.931 E.62415
G3 X105.204 Y141.435 I.293 J3.357 E.05066
G1 X105.216 Y141.44 E.00043
M204 S250
G1 X105.109 Y141.822 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.325 Y141.918 E.00724
G3 X103.734 Y141.615 I-1.315 J2.583 E.50914
G3 X104.787 Y141.708 I.281 J2.823 E.03266
G3 X105.055 Y141.797 I-.777 J2.792 E.00869
; WIPE_START
M204 S6000
G1 X105.325 Y141.918 E-.11233
G1 X105.575 Y142.064 E-.10995
G1 X105.809 Y142.232 E-.10984
G1 X106.026 Y142.424 E-.1099
G1 X106.223 Y142.636 E-.10988
G1 X106.397 Y142.866 E-.10984
G1 X106.532 Y143.087 E-.09826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.003 Y141.526 Z1 F42000
G1 X149.992 Y134.009 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.333 E.07657
G3 X151.988 Y145.991 I-.301 J5.983 E.61469
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.194 J-3.737 E.04474
G3 X143.989 Y150.991 I-5.551 J-2.278 E.23535
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I5.996 J-.008 E.31294
G1 X144.054 Y105.011 E1.32822
G3 X149.992 Y111.013 I-.069 J6.007 E.31055
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.527 E.06373
G3 X151.994 Y146.398 I-.321 J6.39 E.65627
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.437 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.403 J-.003 E.33382
G1 X144.059 Y104.604 E1.32855
G3 X145.605 Y104.808 I-.195 J7.436 E.05181
G3 X150.399 Y111.008 I-1.614 J6.201 E.27974
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.147 E.05799
G3 X151.998 Y146.79 I-.685 J6.756 E.63422
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.811 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X101.972 Y104.522 I6.821 J.021 E.26427
G3 X104.004 Y104.21 I2.052 J6.601 E.0634
G1 X144.064 Y104.212 E1.23095
G3 X150.791 Y111.003 I-.066 J6.793 E.32579
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25804
G1 X152.788 Y133.26 E-.04245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
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


G1 Z1.000
G1 X152.156 Y136.334 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X150.165 Y134.342 E.08694
G1 X150.7 Y134.342 E.01654
G1 X152.56 Y136.202 E.08116
G3 X153.271 Y136.378 I-.598 J3.947 E.02266
G1 X151.236 Y134.342 E.08884
G1 X151.772 Y134.342 E.01654
G1 X157.647 Y140.218 E.25648
G2 X157.648 Y139.683 I-3.573 J-.271 E.01654
M73 P34 R21
G1 X152.324 Y134.359 E.23238
G3 X152.927 Y134.426 I-.029 J3.024 E.01873
G1 X157.575 Y139.074 E.20291
G2 X157.414 Y138.377 I-3.561 J.456 E.02211
G1 X153.618 Y134.582 E.16569
G3 X154.509 Y134.937 I-2.007 J6.328 E.02964
G1 X157.41 Y137.838 E.12663
M204 S10000
G1 X155.311 Y138.417 F42000
G1 F9503.695
M204 S6000
G1 X157.612 Y140.718 E.10044
G1 X157.531 Y141.173 E.01427
G1 X155.798 Y139.441 E.07564
G3 X155.843 Y140.021 I-4.978 J.675 E.01798
G1 X157.421 Y141.598 E.06886
G3 X157.286 Y141.999 I-2.073 J-.474 E.01308
G1 X155.805 Y140.518 E.06466
G3 X155.716 Y140.965 I-2.279 J-.219 E.01409
G1 X157.13 Y142.379 E.06173
G1 X156.949 Y142.734 E.01228
G1 X155.587 Y141.371 E.05946
G3 X155.422 Y141.743 I-1.937 J-.636 E.01255
G1 X156.751 Y143.072 E.05802
G1 X156.527 Y143.383 E.01185
G1 X155.227 Y142.083 E.05677
G3 X155.003 Y142.394 I-1.673 J-.967 E.01187
G1 X156.288 Y143.68 E.05613
G3 X156.036 Y143.964 I-2.015 J-1.536 E.01172
G1 X154.751 Y142.679 E.0561
G3 X154.474 Y142.938 I-1.462 J-1.29 E.01172
G1 X155.759 Y144.222 E.05608
G1 X155.468 Y144.467 E.01174
G1 X154.169 Y143.168 E.05668
G3 X153.832 Y143.367 I-.928 J-1.186 E.01211
G1 X155.154 Y144.689 E.05768
G3 X154.828 Y144.898 I-1.562 J-2.069 E.01198
G1 X153.475 Y143.545 E.05907
G3 X153.078 Y143.684 I-.895 J-1.915 E.01299
G1 X154.474 Y145.08 E.06093
G3 X154.105 Y145.247 I-1.017 J-1.76 E.01252
G1 X152.643 Y143.784 E.06383
G3 X152.16 Y143.837 I-.505 J-2.387 E.01502
G1 X153.712 Y145.39 E.06777
G3 X153.289 Y145.502 I-.774 J-2.06 E.01354
G1 X151.605 Y143.819 E.07349
G3 X150.946 Y143.695 I.609 J-5.053 E.02074
G1 X152.845 Y145.594 E.0829
G1 X152.358 Y145.642 E.01511
G1 X112.064 Y105.349 E1.75894
G1 X112.6 Y105.349 E.01653
G1 X148.31 Y141.059 E1.55887
G3 X148.178 Y140.392 I3.27 J-.991 E.02102
G1 X113.135 Y105.349 E1.52974
G1 X113.671 Y105.348 E.01653
G1 X148.166 Y139.843 E1.50581
G3 X148.216 Y139.358 I2.447 J.009 E.01509
G1 X114.206 Y105.348 E1.48463
G1 X114.742 Y105.348 E.01653
G1 X148.315 Y138.921 E1.46556
G3 X148.454 Y138.524 I2.054 J.494 E.013
G1 X115.278 Y105.348 E1.44823
G1 X115.813 Y105.348 E.01653
G1 X148.633 Y138.168 E1.43268
G3 X148.833 Y137.832 I1.44 J.632 E.01209
G1 X116.349 Y105.348 E1.41804
G1 X116.885 Y105.348 E.01653
G1 X149.065 Y137.528 E1.40476
G3 X149.323 Y137.25 I1.515 J1.15 E.01172
G1 X117.42 Y105.348 E1.39265
G1 X117.956 Y105.348 E.01653
G1 X149.607 Y136.999 E1.38169
G3 X149.919 Y136.775 I1.275 J1.445 E.01187
G1 X118.491 Y105.348 E1.37191
G1 X119.027 Y105.348 E.01653
G1 X150.259 Y136.58 E1.36338
G3 X150.63 Y136.415 I1.01 J1.771 E.01255
G1 X119.563 Y105.348 E1.35618
G1 X120.098 Y105.348 E.01653
G1 X151.035 Y136.284 E1.35049
G3 X151.481 Y136.194 I.673 J2.181 E.01405
G1 X120.634 Y105.347 E1.34656
G1 X121.17 Y105.347 E.01653
G1 X149.659 Y133.836 E1.24364
G1 X149.659 Y133.301 E.01654
G1 X121.705 Y105.347 E1.22026
G1 X122.241 Y105.347 E.01653
G1 X149.659 Y132.765 E1.19687
G1 X149.659 Y132.229 E.01654
G1 X122.776 Y105.347 E1.17349
G1 X123.312 Y105.347 E.01653
G1 X149.659 Y131.694 E1.15011
G1 X149.659 Y131.158 E.01654
G1 X123.848 Y105.347 E1.12673
G1 X124.383 Y105.347 E.01653
G1 X149.659 Y130.622 E1.10335
G1 X149.659 Y130.087 E.01654
G1 X124.919 Y105.347 E1.07997
G1 X125.455 Y105.347 E.01653
G1 X149.659 Y129.551 E1.05658
G1 X149.659 Y129.015 E.01654
G1 X125.99 Y105.347 E1.0332
G1 X126.526 Y105.347 E.01653
G1 X149.659 Y128.479 E1.00982
G1 X149.659 Y127.944 E.01654
G1 X127.061 Y105.346 E.98644
G1 X127.597 Y105.346 E.01653
G1 X149.659 Y127.408 E.96306
G1 X149.659 Y126.872 E.01654
G1 X128.133 Y105.346 E.93967
G1 X128.668 Y105.346 E.01653
G1 X149.659 Y126.337 E.91629
G1 X149.659 Y125.801 E.01654
G1 X129.204 Y105.346 E.89291
M73 P34 R20
G1 X129.74 Y105.346 E.01653
G1 X149.659 Y125.265 E.86953
G1 X149.659 Y124.729 E.01654
G1 X130.275 Y105.346 E.84615
G1 X130.811 Y105.346 E.01653
G1 X149.659 Y124.194 E.82277
G1 X149.659 Y123.658 E.01654
G1 X131.346 Y105.346 E.79938
G1 X131.882 Y105.346 E.01653
G1 X149.828 Y123.292 E.78341
M204 S10000
G1 X148.987 Y107.987 F42000
G1 F9503.695
M204 S6000
G2 X147.803 Y106.811 I-24.561 J23.549 E.05151
G2 X146.302 Y105.838 I-3.695 J4.053 E.05547
G1 X149.162 Y108.698 E.12486
G3 X149.464 Y109.535 I-6.446 J2.793 E.02748
G1 X145.47 Y105.541 E.17432
G2 X144.8 Y105.407 I-1.142 J3.948 E.02113
G1 X149.6 Y110.207 E.20956
G3 X149.653 Y110.796 I-3.961 J.652 E.01826
G1 X144.21 Y105.352 E.23762
G2 X143.666 Y105.344 I-.353 J5.249 E.01681
G1 X149.659 Y111.337 E.2616
G1 X149.659 Y111.873 E.01654
G1 X147.718 Y109.933 E.08468
G3 X147.956 Y110.705 I-5.472 J2.105 E.02496
G1 X149.659 Y112.408 E.07433
G1 X149.659 Y112.944 E.01654
G1 X148.026 Y111.311 E.07128
G3 X148.018 Y111.839 I-2.639 J.227 E.01633
G1 X149.659 Y113.48 E.07161
G1 X149.659 Y114.015 E.01654
G1 X147.953 Y112.309 E.07448
G3 X147.84 Y112.733 I-2.174 J-.351 E.01354
G1 X149.659 Y114.551 E.07939
G1 X149.659 Y115.087 E.01654
G1 X147.693 Y113.121 E.08583
G3 X147.514 Y113.478 I-1.873 J-.711 E.01235
G1 X149.659 Y115.623 E.09362
G1 X149.659 Y116.158 E.01654
G1 X147.308 Y113.807 E.10262
G3 X147.075 Y114.11 I-1.634 J-1.013 E.01181
G1 X149.659 Y116.694 E.11278
G1 X149.659 Y117.23 E.01654
G1 X146.817 Y114.388 E.12403
G1 X146.533 Y114.639 E.01172
G1 X149.659 Y117.765 E.13646
G1 X149.659 Y118.301 E.01654
G1 X146.223 Y114.865 E.14999
G3 X145.886 Y115.064 I-1.16 J-1.578 E.01209
G1 X149.659 Y118.837 E.16469
G1 X149.659 Y119.372 E.01654
G1 X145.521 Y115.235 E.18063
G3 X145.124 Y115.373 I-.891 J-1.915 E.013
G1 X149.659 Y119.908 E.19796
G1 X149.659 Y120.444 E.01654
G1 X144.689 Y115.474 E.21693
G3 X144.204 Y115.525 I-.497 J-2.396 E.01507
G1 X149.659 Y120.98 E.2381
G1 X149.659 Y121.515 E.01654
G1 X143.658 Y115.515 E.26195
G3 X143.016 Y115.408 I.387 J-4.327 E.0201
G1 X149.659 Y122.051 E.28997
G1 X149.659 Y122.587 E.01654
G1 X142.151 Y115.079 E.32771
G3 X140.419 Y113.347 I1.856 J-3.588 E.07682
G1 X132.418 Y105.346 E.34929
G1 X132.953 Y105.346 E.01653
G1 X140.089 Y112.481 E.31149
G3 X139.986 Y111.843 I3.139 J-.832 E.01999
G1 X133.489 Y105.346 E.28362
G1 X134.025 Y105.345 E.01653
G1 X139.973 Y111.293 E.25965
G3 X140.029 Y110.814 I2.422 J.043 E.01492
G1 X134.56 Y105.345 E.23874
G1 X135.096 Y105.345 E.01653
G1 X140.13 Y110.38 E.21977
G3 X140.268 Y109.982 I2.058 J.493 E.01301
G1 X135.631 Y105.345 E.20242
G1 X136.167 Y105.345 E.01653
G1 X140.439 Y109.617 E.18647
G3 X140.638 Y109.28 I1.782 J.827 E.01209
G1 X136.703 Y105.345 E.17179
G1 X137.238 Y105.345 E.01653
G1 X140.864 Y108.971 E.15827
G3 X141.115 Y108.686 I1.545 J1.114 E.01173
G1 X137.774 Y105.345 E.14586
G1 X138.31 Y105.345 E.01653
G1 X141.392 Y108.427 E.13456
G3 X141.694 Y108.194 I1.318 J1.392 E.01181
G1 X138.845 Y105.345 E.12436
G1 X139.381 Y105.345 E.01653
G1 X142.023 Y107.987 E.11533
M73 P35 R20
G3 X142.38 Y107.808 I1.07 J1.695 E.01235
G1 X139.917 Y105.345 E.10754
G1 X140.452 Y105.345 E.01653
G1 X142.769 Y107.661 E.10113
G3 X143.196 Y107.553 I.641 J1.627 E.01364
G1 X140.988 Y105.344 E.0964
G1 X141.523 Y105.344 E.01653
G1 X143.664 Y107.485 E.09344
G3 X144.189 Y107.474 I.315 J2.617 E.01624
G1 X142.059 Y105.344 E.09298
G1 X142.595 Y105.344 E.01653
G1 X144.8 Y107.55 E.09628
G3 X145.577 Y107.791 I-.871 J4.179 E.02515
G1 X142.961 Y105.174 E.11421
; WIPE_START
G1 X144.375 Y106.589 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.567 Y113.203 Z1 F42000
G1 X132.435 Y127.327 Z1
G1 Z.6
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X110.457 Y105.349 E.95942
G1 X109.921 Y105.349 E.01653
G1 X131.73 Y127.158 E.95201
G1 X131.194 Y127.158 E.01654
G1 X109.386 Y105.349 E.95201
G1 X108.85 Y105.349 E.01653
G1 X130.659 Y127.158 E.95201
G1 X130.123 Y127.158 E.01654
G1 X108.315 Y105.349 E.952
G1 X107.779 Y105.349 E.01653
G1 X129.587 Y127.158 E.952
G1 X129.052 Y127.158 E.01654
G1 X107.243 Y105.349 E.952
G1 X106.708 Y105.349 E.01653
G1 X128.516 Y127.158 E.95199
G1 X128.159 Y127.158 E.01102
G1 X128.159 Y127.336 E.00551
G1 X106.172 Y105.35 E.95978
G1 X105.636 Y105.35 E.01653
G1 X128.159 Y127.872 E.98317
G1 X128.159 Y128.408 E.01654
G1 X105.101 Y105.35 E1.00655
G1 X104.565 Y105.35 E.01653
G1 X128.159 Y128.943 E1.02993
G1 X128.159 Y129.479 E.01654
G1 X104.03 Y105.35 E1.05331
G2 X103.515 Y105.371 I-.153 J2.627 E.01594
G1 X128.159 Y130.015 E1.07579
G1 X128.159 Y130.55 E.01654
G1 X107.82 Y110.211 E.88786
G3 X107.987 Y110.915 I-3.985 J1.322 E.02235
G1 X128.159 Y131.086 E.88054
G1 X128.159 Y131.622 E.01654
G1 X108.035 Y111.5 E.87842
G3 X108 Y111.999 I-2.516 J.076 E.01547
G1 X128.159 Y132.158 E.87997
G1 X128.159 Y132.693 E.01654
G1 X107.917 Y112.451 E.88363
G3 X107.793 Y112.863 I-2.12 J-.413 E.0133
G1 X128.159 Y133.229 E.88904
G1 X128.159 Y133.765 E.01654
G1 X107.635 Y113.241 E.89593
G3 X107.447 Y113.588 I-1.829 J-.764 E.01222
G1 X128.328 Y134.47 E.91155
; WIPE_START
G1 X126.914 Y133.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.778 Y140.603 Z1 F42000
G1 X125.659 Y141.391 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X126.911 Y142.643 E.05441
G1 X126.938 Y143.202
G1 X125.099 Y141.364 E.07991
G1 X124.674 Y141.472
G1 X126.828 Y143.626 E.09361
G1 X126.636 Y143.967
G1 X124.334 Y141.665 E.10005
G1 X124.055 Y141.919
G1 X126.382 Y144.246 E.10111
G1 X126.064 Y144.462
G1 X122.975 Y141.373 E.13423
G1 X122.439 Y141.37
G1 X125.677 Y144.607 E.14068
G1 X125.182 Y144.646
G1 X122.024 Y141.488 E.13725
G1 X121.695 Y141.692
G1 X124.349 Y144.346 E.11532
G1 X123.745 Y144.276
G1 X121.424 Y141.955 E.10086
G1 X121.217 Y142.281
G1 X123.42 Y144.484 E.09574
G1 X123.021 Y144.618
G1 X121.082 Y142.679 E.08425
G1 X121.063 Y143.193
G1 X122.507 Y144.637 E.06277
M204 S10000
G1 X122.126 Y144.548 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0899487
G1 F15000
M204 S6000
G1 X122.1 Y144.532 E.00012
; LINE_WIDTH: 0.106579
G1 X122.032 Y144.485 E.00043
; LINE_WIDTH: 0.136257
G1 X121.964 Y144.438 E.00063
; LINE_WIDTH: 0.172194
G1 X121.836 Y144.339 E.0017
; LINE_WIDTH: 0.217007
G3 X121.387 Y143.896 I2.721 J-3.205 E.00895
; LINE_WIDTH: 0.182411
G1 X121.288 Y143.77 E.00183
; LINE_WIDTH: 0.149663
G1 X121.22 Y143.675 E.00102
; LINE_WIDTH: 0.122021
G1 X121.153 Y143.579 E.00075
M204 S10000
G1 X123.579 Y144.376 F42000
; LINE_WIDTH: 0.0987903
G1 F15000
M204 S6000
G3 X123.476 Y144.455 I-.835 J-.974 E.00059
; WIPE_START
G1 X123.579 Y144.376 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y144.587 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.155244
G1 F15000
M204 S6000
G1 X124.699 Y144.502 E.00137
; LINE_WIDTH: 0.184485
G1 X124.575 Y144.416 E.00173
; LINE_WIDTH: 0.214405
G1 X124.408 Y144.288 E.00295
; WIPE_START
G1 X124.575 Y144.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.711 Y142.147 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.115654
G1 F15000
M204 S6000
G2 X126.151 Y141.588 I-2.914 J2.357 E.0047
M204 S10000
G1 X124.637 Y141.48 F42000
; LINE_WIDTH: 0.101122
G1 F15000
M204 S6000
G1 X124.512 Y141.576 E.00075
M204 S10000
G1 X124.006 Y141.961 F42000
; LINE_WIDTH: 0.167396
G1 F15000
M204 S6000
G1 X123.922 Y141.96 E.00086
G2 X123.579 Y141.639 I-2.602 J2.435 E.00476
; LINE_WIDTH: 0.12165
G1 X123.449 Y141.539 E.00105
; LINE_WIDTH: 0.0941891
G1 X123.403 Y141.507 E.00023
; WIPE_START
G1 X123.449 Y141.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.742 Y136.471 Z1 F42000
G1 X115.328 Y134.327 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X98.345 Y117.343 E.74138
G1 X98.345 Y116.808 E.01654
G1 X115.159 Y133.622 E.73398
G1 X115.159 Y133.086 E.01654
G1 X98.345 Y116.272 E.73399
G1 X98.345 Y115.736 E.01654
G1 X115.159 Y132.55 E.73399
G1 X115.159 Y132.014 E.01654
G1 X98.344 Y115.2 E.734
G1 X98.344 Y114.664 E.01654
G1 X115.159 Y131.479 E.734
G1 X115.159 Y130.943 E.01654
G1 X98.344 Y114.128 E.73401
G1 X98.344 Y113.593 E.01654
G1 X115.159 Y130.407 E.73401
G1 X115.159 Y129.872 E.01654
G1 X98.344 Y113.057 E.73402
G1 X98.344 Y112.521 E.01654
G1 X115.159 Y129.336 E.73402
G1 X115.159 Y128.8 E.01654
G1 X98.344 Y111.985 E.73403
G1 X98.344 Y111.449 E.01654
G1 X115.159 Y128.264 E.73403
G1 X115.159 Y127.729 E.01654
G1 X102.769 Y115.339 E.54086
G2 X103.462 Y115.496 I1.131 J-3.378 E.02197
G1 X115.159 Y127.193 E.51061
G1 X115.159 Y127.158 E.00109
G1 X115.659 Y127.158 E.01544
G1 X104.031 Y115.53 E.5076
G2 X104.531 Y115.494 I.073 J-2.518 E.01551
G1 X116.195 Y127.158 E.50915
G1 X116.73 Y127.158 E.01654
G1 X104.982 Y115.409 E.51287
G2 X105.392 Y115.283 I-.422 J-2.109 E.01326
G1 X117.266 Y127.158 E.51836
G1 X117.802 Y127.158 E.01654
G1 X105.767 Y115.123 E.52534
G2 X106.113 Y114.933 I-.777 J-1.821 E.01219
G1 X118.337 Y127.158 E.53364
G1 X118.873 Y127.158 E.01654
G1 X106.431 Y114.715 E.54314
G2 X106.723 Y114.472 I-1.072 J-1.581 E.01176
G1 X119.579 Y127.327 E.56119
; WIPE_START
G1 X118.164 Y125.913 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.782 Y119.664 Z1 F42000
G1 X105.592 Y107.984 Z1
G1 Z.6
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X103.039 Y105.431 E.11146
G2 X102.595 Y105.522 I.243 J2.298 E.01402
G1 X104.585 Y107.513 E.08689
G2 X104.014 Y107.477 I-.425 J2.232 E.01771
G1 X102.184 Y105.647 E.07989
G2 X101.795 Y105.793 I1.248 J3.906 E.01284
G1 X103.499 Y107.497 E.07438
G2 X103.048 Y107.583 I.2 J2.293 E.01418
G1 X101.431 Y105.965 E.0706
G2 X101.088 Y106.159 I.81 J1.837 E.01216
G1 X102.637 Y107.707 E.0676
G2 X102.259 Y107.865 I.602 J1.967 E.01266
G1 X100.762 Y106.368 E.06536
G1 X100.454 Y106.596 E.01182
G1 X101.912 Y108.053 E.06361
G2 X101.591 Y108.268 I.916 J1.709 E.01194
G1 X100.17 Y106.847 E.06205
G2 X99.899 Y107.112 I1.212 J1.507 E.01171
G1 X101.297 Y108.51 E.061
G2 X101.027 Y108.776 I1.192 J1.475 E.01171
G1 X99.645 Y107.393 E.06036
G2 X99.415 Y107.699 I1.441 J1.322 E.01183
G1 X100.783 Y109.068 E.05973
G1 X100.566 Y109.386 E.0119
G1 X99.2 Y108.02 E.05963
G2 X99.001 Y108.357 I1.604 J1.174 E.01209
G1 X100.376 Y109.732 E.06003
G2 X100.216 Y110.107 I1.794 J.988 E.01262
G1 X98.829 Y108.721 E.06054
G2 X98.678 Y109.105 I1.877 J.958 E.01278
G1 X100.089 Y110.517 E.0616
G2 X100.005 Y110.968 I2.213 J.646 E.0142
G1 X98.549 Y109.512 E.06356
G2 X98.446 Y109.944 I2.142 J.741 E.01374
G1 X99.972 Y111.471 E.06663
G2 X100.006 Y112.04 I2.864 J.115 E.01764
G1 X98.377 Y110.411 E.07113
G2 X98.348 Y110.919 I2.551 J.396 E.01572
G1 X100.456 Y113.026 E.09201
; WIPE_START
G1 X99.042 Y111.612 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.429 Y119.235 Z1 F42000
G1 X100.988 Y149.986 Z1
G1 Z.6
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X99.991 Y148.989 E.04354
G3 X98.84 Y147.302 I3.896 J-3.896 E.06342
G1 X101.7 Y150.163 E.12488
G2 X102.532 Y150.459 I1.919 J-4.074 E.0273
G1 X98.545 Y146.472 E.17405
G3 X98.408 Y145.798 I3.35 J-1.035 E.02124
G1 X103.208 Y150.599 E.20957
G2 X103.795 Y150.65 I.552 J-2.96 E.0182
G1 X98.351 Y145.206 E.23765
G1 X98.351 Y144.67 E.01654
G1 X104.5 Y150.82 E.26845
M204 S10000
G1 X115.752 Y150.822 F42000
G1 F9503.695
M204 S6000
G1 X107.584 Y142.653 E.35659
G3 X107.907 Y143.513 I-3.686 J1.879 E.0284
G1 X115.047 Y150.652 E.31166
G1 X114.511 Y150.652 E.01654
G1 X108.018 Y144.159 E.28344
G3 X108.025 Y144.702 I-2.702 J.306 E.01678
G1 X113.975 Y150.652 E.25974
G1 X113.439 Y150.652 E.01654
G1 X107.972 Y145.185 E.23865
G3 X107.873 Y145.621 I-2.228 J-.277 E.01384
G1 X112.904 Y150.652 E.21959
G1 X112.368 Y150.652 E.01654
G1 X107.736 Y146.02 E.20221
G3 X107.565 Y146.385 I-1.913 J-.669 E.01246
G1 X111.832 Y150.652 E.18626
G1 X111.296 Y150.652 E.01654
G1 X107.366 Y146.721 E.17158
G3 X107.139 Y147.03 I-1.662 J-.98 E.01185
G1 X110.76 Y150.651 E.15808
G1 X110.225 Y150.651 E.01654
G1 X106.887 Y147.313 E.14571
G3 X106.609 Y147.572 I-1.429 J-1.257 E.01172
G1 X109.689 Y150.651 E.13443
G1 X109.153 Y150.651 E.01654
G1 X106.307 Y147.805 E.12425
G3 X105.977 Y148.011 I-1.196 J-1.541 E.01201
G1 X108.617 Y150.651 E.11523
G1 X108.081 Y150.651 E.01654
G1 X105.62 Y148.19 E.10744
G3 X105.232 Y148.337 I-.93 J-1.867 E.01284
G1 X107.546 Y150.651 E.10101
G1 X107.01 Y150.651 E.01654
G1 X104.808 Y148.449 E.09613
G3 X104.341 Y148.518 I-.58 J-2.296 E.01458
G1 X106.474 Y150.651 E.0931
G1 X105.938 Y150.65 E.01654
G1 X103.814 Y148.526 E.09273
G3 X103.202 Y148.45 I.074 J-3.098 E.01906
G1 X105.402 Y150.65 E.09604
G1 X104.867 Y150.65 E.01654
G1 X102.427 Y148.21 E.10651
G3 X100.294 Y146.077 I1.584 J-3.717 E.09542
G1 X98.351 Y144.134 E.08481
G1 X98.351 Y143.599 E.01654
G1 X100.052 Y145.3 E.07428
G3 X99.972 Y144.684 I5.283 J-1.002 E.01919
G1 X98.351 Y143.063 E.07078
G1 X98.35 Y142.527 E.01654
G1 X99.986 Y144.162 E.07139
G3 X100.053 Y143.694 I2.371 J.104 E.01462
G1 X98.35 Y141.991 E.07435
G1 X98.35 Y141.455 E.01654
G1 X100.164 Y143.269 E.07919
G3 X100.311 Y142.881 I2.019 J.541 E.01285
G1 X98.35 Y140.92 E.08561
G1 X98.35 Y140.384 E.01654
G1 X100.49 Y142.523 E.09341
G3 X100.697 Y142.195 I1.749 J.87 E.01201
G1 X98.35 Y139.848 E.10244
G1 X98.35 Y139.312 E.01654
G1 X100.93 Y141.892 E.11263
G3 X101.188 Y141.615 I1.514 J1.155 E.01172
G1 X98.35 Y138.776 E.12393
G1 X98.349 Y138.24 E.01654
G1 X101.472 Y141.363 E.13632
G3 X101.782 Y141.137 I1.286 J1.435 E.01185
G1 X98.349 Y137.705 E.14984
G1 X98.349 Y137.169 E.01654
G1 X102.118 Y140.938 E.16452
G3 X102.483 Y140.767 I1.034 J1.741 E.01246
G1 X98.349 Y136.633 E.18048
G1 X98.349 Y136.097 E.01654
G1 X102.881 Y140.63 E.19785
G3 X103.322 Y140.534 I.597 J1.687 E.01394
G1 X98.349 Y135.561 E.21707
G1 X98.349 Y135.026 E.01654
G1 X103.798 Y140.475 E.23788
G3 X104.341 Y140.482 I.2 J5.433 E.01677
G1 X98.349 Y134.49 E.26158
G1 X98.349 Y133.954 E.01654
G1 X104.987 Y140.592 E.28979
G3 X105.84 Y140.909 I-1.128 J4.34 E.02813
G1 X98.348 Y133.418 E.32702
G1 X98.348 Y132.882 E.01654
G1 X116.118 Y150.652 E.77572
G1 X116.654 Y150.653 E.01654
G1 X98.348 Y132.346 E.79912
G1 X98.348 Y131.811 E.01654
G1 X117.19 Y150.653 E.82251
G1 X117.726 Y150.653 E.01654
G1 X98.348 Y131.275 E.84591
G1 X98.348 Y130.739 E.01654
G1 X118.262 Y150.653 E.8693
G1 X118.797 Y150.653 E.01654
G1 X98.348 Y130.203 E.8927
G1 X98.348 Y129.667 E.01654
G1 X119.333 Y150.653 E.91609
G1 X119.869 Y150.653 E.01654
G1 X98.347 Y129.131 E.93949
G1 X98.347 Y128.596 E.01654
G1 X120.405 Y150.653 E.96288
G1 X120.941 Y150.653 E.01654
G1 X98.347 Y128.06 E.98628
G1 X98.347 Y127.524 E.01654
G1 X121.477 Y150.653 E1.00967
G1 X122.012 Y150.654 E.01654
G1 X98.347 Y126.988 E1.03307
G1 X98.347 Y126.452 E.01654
G1 X122.548 Y150.654 E1.05646
G1 X123.084 Y150.654 E.01654
G1 X98.347 Y125.917 E1.07985
G1 X98.347 Y125.381 E.01654
G1 X123.62 Y150.654 E1.10325
G1 X124.156 Y150.654 E.01654
G1 X98.347 Y124.845 E1.12664
G1 X98.346 Y124.309 E.01654
G1 X124.691 Y150.654 E1.15004
G1 X125.227 Y150.654 E.01654
G1 X98.346 Y123.773 E1.17343
G1 X98.346 Y123.237 E.01654
G1 X125.763 Y150.654 E1.19683
G1 X126.299 Y150.654 E.01654
G1 X98.346 Y122.702 E1.22022
G1 X98.346 Y122.166 E.01654
G1 X127.004 Y150.824 E1.25102
M204 S10000
M73 P36 R20
G1 X136.113 Y150.826 F42000
G1 F9503.695
M204 S6000
G1 X127.876 Y142.589 E.35956
G3 X127.908 Y143.157 I-1.871 J.39 E.01762
G1 X135.407 Y150.656 E.32737
G1 X134.872 Y150.656 E.01654
G1 X127.832 Y143.617 E.30728
G3 X127.706 Y144.026 I-2.435 J-.529 E.01323
G1 X134.336 Y150.656 E.28942
G1 X133.8 Y150.656 E.01654
G1 X127.53 Y144.386 E.27369
G1 X127.296 Y144.687 E.01178
G1 X133.264 Y150.656 E.26054
G1 X132.728 Y150.656 E.01654
G1 X127.031 Y144.958 E.24871
G3 X126.722 Y145.185 I-.827 J-.805 E.01189
G1 X132.193 Y150.655 E.23882
G1 X131.657 Y150.655 E.01654
G1 X126.383 Y145.381 E.23023
G1 X125.983 Y145.517 E.01304
G1 X131.121 Y150.655 E.22429
G1 X130.585 Y150.655 E.01654
G1 X125.525 Y145.595 E.22087
G1 X125.366 Y145.615 E.00497
G1 X124.981 Y145.586 E.01191
G1 X130.049 Y150.655 E.22126
G1 X129.514 Y150.655 E.01654
G1 X124.238 Y145.379 E.2303
G3 X123.994 Y145.261 I.271 J-.869 E.00841
G3 X123.725 Y145.402 I-.494 J-.613 E.00943
G1 X128.978 Y150.655 E.22929
G1 X128.442 Y150.655 E.01654
G1 X123.324 Y145.537 E.22341
G1 X122.856 Y145.604 E.01461
G1 X127.906 Y150.655 E.22047
G1 X127.37 Y150.655 E.01654
G1 X122.078 Y145.363 E.23101
; WIPE_START
G1 X123.493 Y146.777 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.35 Y143.634 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X98.346 Y121.63 E.96056
G1 X98.346 Y121.094 E.01654
G1 X120.1 Y142.849 E.94965
G1 X120.137 Y142.482 E.01138
G1 X120.168 Y142.381 E.00326
G1 X98.346 Y120.558 E.95261
G1 X98.345 Y120.022 E.01654
G1 X120.296 Y141.973 E.95822
G1 X120.485 Y141.626 E.01219
G1 X98.345 Y119.487 E.96647
G1 X98.345 Y118.951 E.01654
G1 X120.713 Y141.319 E.97644
G3 X120.976 Y141.046 I.805 J.512 E.01177
G1 X98.345 Y118.415 E.98792
G1 X98.345 Y117.879 E.01654
G1 X121.274 Y140.808 E1.00093
G1 X121.614 Y140.612 E.0121
G1 X115.844 Y134.842 E.25187
G1 X116.38 Y134.842 E.01654
G1 X122.015 Y140.478 E.246
G3 X122.471 Y140.398 I.413 J1.021 E.0144
G1 X116.915 Y134.842 E.24253
G1 X117.451 Y134.842 E.01654
G1 X123.016 Y140.407 E.24293
G1 X123.164 Y140.426 E.00459
G1 X123.648 Y140.562 E.01553
G1 X123.754 Y140.61 E.0036
G1 X117.987 Y134.842 E.25178
G1 X118.522 Y134.842 E.01654
G1 X124.271 Y140.591 E.25092
G1 X124.674 Y140.458 E.01311
G1 X119.058 Y134.842 E.24515
G1 X119.594 Y134.842 E.01654
G1 X125.142 Y140.391 E.24221
G3 X125.706 Y140.419 I.134 J3.001 E.01744
G1 X119.843 Y134.556 E.25591
G1 X119.843 Y134.021 E.01654
G1 X136.479 Y150.656 E.72619
G1 X137.015 Y150.656 E.01654
G1 X119.843 Y133.485 E.74958
G1 X119.843 Y132.949 E.01654
G1 X137.551 Y150.656 E.77297
G1 X138.086 Y150.657 E.01654
G1 X119.843 Y132.414 E.79636
G1 X119.843 Y131.878 E.01654
G1 X138.622 Y150.657 E.81975
G1 X139.158 Y150.657 E.01654
G1 X119.843 Y131.342 E.84314
G1 X119.843 Y130.806 E.01654
G1 X139.694 Y150.657 E.86653
G1 X140.23 Y150.657 E.01654
G1 X119.843 Y130.271 E.88992
G1 X119.843 Y129.735 E.01654
G1 X140.765 Y150.657 E.91331
G1 X141.301 Y150.657 E.01654
G1 X119.843 Y129.199 E.9367
G1 X119.843 Y128.664 E.01654
G1 X141.837 Y150.657 E.96009
G1 X142.373 Y150.657 E.01654
G1 X119.843 Y128.128 E.98348
G1 X119.843 Y127.592 E.01654
G1 X142.909 Y150.657 E1.00687
G1 X143.444 Y150.658 E.01654
G1 X106.99 Y114.203 E1.59137
G2 X107.231 Y113.908 I-1.348 J-1.353 E.01177
G1 X144.142 Y150.82 E1.61128
; WIPE_START
G1 X142.728 Y149.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.644 Y146.178 Z1 F42000
G1 X150.398 Y145.826 Z1
G1 Z.6
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X147.84 Y143.268 E.11167
G3 X147.994 Y143.957 I-4.517 J1.368 E.02182
G1 X149.726 Y145.689 E.07563
G1 X149.591 Y146.09 E.01305
G1 X148.034 Y144.532 E.06799
G3 X147.996 Y145.03 I-2.509 J.06 E.01544
G1 X149.456 Y146.491 E.06375
G1 X149.321 Y146.891 E.01305
G1 X147.909 Y145.48 E.06163
G3 X147.783 Y145.889 I-2.111 J-.426 E.01325
G1 X149.173 Y147.279 E.06066
G1 X149.002 Y147.644 E.01244
G1 X147.623 Y146.265 E.06019
G3 X147.433 Y146.611 I-1.821 J-.776 E.0122
G1 X148.806 Y147.983 E.05992
G3 X148.587 Y148.3 I-2.249 J-1.316 E.0119
G1 X147.216 Y146.929 E.05988
G3 X146.972 Y147.221 I-1.581 J-1.068 E.01176
G1 X148.357 Y148.606 E.06045
G1 X148.103 Y148.888 E.01171
G1 X146.704 Y147.488 E.06109
G3 X146.41 Y147.73 I-1.355 J-1.347 E.01177
G1 X147.837 Y149.157 E.06229
G3 X147.545 Y149.401 I-1.786 J-1.842 E.01175
G1 X146.09 Y147.946 E.06351
G3 X145.743 Y148.134 I-1.114 J-1.643 E.01222
G1 X147.239 Y149.631 E.06534
G1 X146.919 Y149.846 E.01192
G1 X145.365 Y148.292 E.06784
G3 X144.952 Y148.416 I-.823 J-1.999 E.01331
G1 X146.572 Y150.035 E.07069
G1 X146.208 Y150.207 E.01242
G1 X144.499 Y148.498 E.07459
G3 X143.996 Y148.53 I-.413 J-2.5 E.0156
G1 X145.817 Y150.351 E.07949
G3 X145.408 Y150.479 I-1.065 J-2.693 E.01321
G1 X143.418 Y148.488 E.08688
G3 X142.719 Y148.325 I.468 J-3.573 E.02221
G1 X144.963 Y150.569 E.09797
G3 X144.491 Y150.633 I-.557 J-2.348 E.01473
G1 X128.701 Y134.842 E.68929
G1 X129.236 Y134.842 E.01654
G1 X140.182 Y145.788 E.47781
G3 X140.01 Y145.08 I4.986 J-1.587 E.0225
G1 X129.772 Y134.842 E.44691
G1 X130.308 Y134.842 E.01654
G1 X139.972 Y144.507 E.42187
G3 X140.002 Y144.001 I2.543 J-.104 E.01567
G1 X130.844 Y134.842 E.39979
G1 X131.379 Y134.842 E.01654
G1 X140.083 Y143.546 E.37996
G3 X140.206 Y143.134 I2.13 J.409 E.01332
G1 X131.915 Y134.842 E.36194
G1 X132.451 Y134.842 E.01654
G1 X140.364 Y142.756 E.34544
G3 X140.552 Y142.408 I1.838 J.772 E.01222
G1 X132.843 Y134.699 E.33652
G1 X132.843 Y134.164 E.01654
G1 X140.769 Y142.089 E.34595
G3 X141.011 Y141.795 I1.588 J1.065 E.01177
G1 X132.843 Y133.628 E.35653
G1 X132.843 Y133.092 E.01654
G1 X141.278 Y141.527 E.36821
G3 X141.571 Y141.284 I1.357 J1.337 E.01176
G1 X132.843 Y132.557 E.38099
G1 X132.843 Y132.021 E.01654
G1 X141.89 Y141.067 E.3949
G3 X142.236 Y140.877 I1.122 J1.633 E.0122
G1 X132.843 Y131.485 E.41
G1 X132.843 Y130.95 E.01654
G1 X142.611 Y140.717 E.42639
G3 X143.02 Y140.591 I.838 J1.98 E.01324
G1 X132.843 Y130.414 E.44424
G1 X132.843 Y129.878 E.01654
G1 X143.468 Y140.503 E.4638
G3 X143.978 Y140.477 I.452 J3.915 E.01578
G1 X132.843 Y129.342 E.48607
G1 X132.843 Y128.807 E.01654
G1 X144.544 Y140.507 E.51077
G3 X145.237 Y140.665 I-.558 J4.06 E.02197
G1 X132.843 Y128.271 E.54104
G1 X132.843 Y127.735 E.01654
G1 X150.763 Y145.655 E.78225
G1 X151.297 Y145.653 E.01648
G1 X110.993 Y105.349 E1.75941
G1 X111.528 Y105.349 E.01653
G1 X152 Y145.821 E1.76672
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9503.695
G1 X150.586 Y144.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/53
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I.565 J-1.078 P1  F42000
G1 X131.711 Y134.509 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.492 Y134.509 E.10678
G1 X128.492 Y127.491 E.23281
G1 X132.51 Y127.491 E.13329
G1 X132.51 Y134.509 E.23281
G1 X131.771 Y134.509 E.02452
M204 S10000
G1 X132.103 Y133.71 F42000
G1 F5400
M204 S6000
G1 X132.103 Y134.102 E.01301
G1 X128.899 Y134.102 E.10629
G1 X128.899 Y127.898 E.2058
G1 X132.103 Y127.898 E.10629
G1 X132.103 Y133.65 E.19081
M204 S250
G1 X131.711 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X129.291 Y133.71 E.07436
G1 X129.291 Y128.29 E.16654
G1 X131.711 Y128.29 E.07436
G1 X131.711 Y133.65 E.1647
; WIPE_START
M204 S6000
G1 X129.712 Y133.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.093 Y134.159 Z1.2 F42000
G1 X116.291 Y134.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X115.492 Y134.509 E.02651
G1 X115.492 Y127.491 E.23281
G1 X119.51 Y127.491 E.13329
G1 X119.51 Y134.509 E.23281
G1 X116.351 Y134.509 E.10479
M204 S10000
G1 X116.291 Y134.102 F42000
G1 F5400
M204 S6000
G1 X115.899 Y134.102 E.01301
G1 X115.899 Y127.898 E.2058
G1 X119.103 Y127.898 E.10629
G1 X119.103 Y134.102 E.2058
G1 X116.351 Y134.102 E.09129
M204 S250
G1 X116.291 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.291 Y128.29 E.16654
G1 X118.711 Y128.29 E.07436
G1 X118.711 Y133.71 E.16654
G1 X116.351 Y133.71 E.07252
; WIPE_START
M204 S6000
G1 X116.329 Y131.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.606 Y137.225 Z1.2 F42000
G1 X126.819 Y142.673 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.846 Y142.845 E.00578
G3 X124.002 Y143.867 I-1.55 J.153 E.1369
G3 X124.001 Y142.135 I-1.296 J-.865 E.26383
G3 X125.107 Y141.452 I1.349 J.947 E.04432
G3 X126.786 Y142.542 I.189 J1.546 E.07212
G1 X126.804 Y142.615 E.00249
M204 S10000
G1 X126.422 Y142.753 F42000
G1 F5400
M204 S6000
G1 X126.447 Y142.885 E.00445
G3 X125.157 Y141.856 I-1.146 J.114 E.17912
G1 X125.272 Y141.848 E.00382
G3 X126.402 Y142.66 I.029 J1.152 E.04957
G1 X126.409 Y142.694 E.00116
M204 S250
G1 X126.039 Y142.831 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.057 Y142.924 E.00293
G3 X125.206 Y142.246 I-.756 J.075 E.10942
G1 X125.282 Y142.24 E.00234
G3 X126.026 Y142.772 I.019 J.76 E.03015
; WIPE_START
M204 S6000
G1 X126.057 Y142.924 E-.05902
G1 X126.058 Y143.076 E-.05757
G1 X126.028 Y143.224 E-.05753
G1 X125.928 Y143.431 E-.08718
G1 X125.804 Y143.57 E-.07082
G1 X125.681 Y143.658 E-.0575
G1 X125.543 Y143.721 E-.05754
G1 X125.396 Y143.754 E-.05748
M73 P37 R20
G1 X125.244 Y143.758 E-.0576
G1 X125.095 Y143.732 E-.05746
G1 X124.954 Y143.677 E-.05751
G1 X124.827 Y143.594 E-.05762
G1 X124.78 Y143.548 E-.02516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.466 Y141.879 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.557 Y141.856 E.00314
G1 X122.672 Y141.848 E.00382
G3 X122.287 Y141.924 I.029 J1.152 E.22703
G1 X122.407 Y141.894 E.00412
M204 S250
G1 X122.563 Y142.259 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.606 Y142.246 E.00138
G1 X122.682 Y142.24 E.00234
G3 X122.354 Y142.323 I.019 J.76 E.1362
G1 X122.506 Y142.277 E.00488
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.03985
G1 X122.682 Y142.24 E-.0289
G1 X122.833 Y142.251 E-.05751
G1 X122.979 Y142.292 E-.05749
G1 X123.175 Y142.406 E-.08614
G1 X123.283 Y142.511 E-.05749
G1 X123.369 Y142.636 E-.05752
G1 X123.428 Y142.776 E-.05757
G1 X123.458 Y142.924 E-.0575
G1 X123.458 Y143.076 E-.05759
G1 X123.428 Y143.224 E-.05753
G1 X123.328 Y143.431 E-.08718
G1 X123.227 Y143.544 E-.05773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.858 Y143.67 Z1.2 F42000
G1 X147.453 Y143.945 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.491 Y144.151 E.00694
G3 X143.65 Y141.02 I-3.481 J.35 E.54654
G3 X144.949 Y141.13 I.365 J3.42 E.04351
G3 X147.438 Y143.805 I-.939 J3.37 E.12752
G1 X147.447 Y143.885 E.00267
M204 S10000
G1 X147.05 Y144.006 F42000
G1 F5400
M204 S6000
G1 X147.085 Y144.191 E.00627
G3 X143.68 Y141.426 I-3.075 J.308 E.48236
G3 X144.538 Y141.454 I.321 J3.354 E.02855
G3 X147.039 Y143.886 I-.528 J3.045 E.12295
G1 X147.045 Y143.946 E.002
M204 S250
G1 X146.663 Y144.064 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X146.696 Y144.23 E.00521
G3 X143.71 Y141.817 I-2.685 J.269 E.38972
G3 X144.203 Y141.807 I.297 J2.458 E.01518
G3 X146.656 Y143.963 I-.192 J2.692 E.10778
G1 X146.659 Y144.004 E.00126
; WIPE_START
M204 S6000
G1 X146.696 Y144.23 E-.08714
G1 X146.701 Y144.5 E-.10251
G1 X146.688 Y144.769 E-.10231
G1 X146.648 Y145.035 E-.10228
G1 X146.581 Y145.296 E-.10229
G1 X146.489 Y145.549 E-.10227
G1 X146.372 Y145.791 E-.10233
G1 X146.292 Y145.924 E-.05887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.779 Y138.708 Z1.2 F42000
G1 X148.894 Y138.374 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X148.919 Y138.322 E.00193
G3 X151.914 Y136.492 I3.082 J1.678 E.12191
G1 X152.088 Y136.492 E.0058
G3 X148.767 Y138.637 I-.087 J3.508 E.59202
G1 X148.868 Y138.428 E.00769
M204 S10000
G1 X149.26 Y138.551 F42000
G1 F5400
M204 S6000
G1 X149.277 Y138.517 E.00125
G3 X151.924 Y136.899 I2.724 J1.483 E.10777
G1 X152.078 Y136.899 E.00513
G3 X149.143 Y138.795 I-.077 J3.101 E.52333
G1 X149.234 Y138.605 E.00701
M204 S250
G1 X149.613 Y138.721 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.621 Y138.704 E.00056
G3 X151.934 Y137.291 I2.38 J1.295 E.0872
G1 X152.069 Y137.291 E.00415
G3 X149.504 Y138.947 I-.068 J2.709 E.42348
G1 X149.587 Y138.775 E.00589
; WIPE_START
M204 S6000
G1 X149.621 Y138.704 E-.02977
G1 X149.762 Y138.473 E-.10269
G1 X149.925 Y138.258 E-.10269
G1 X150.109 Y138.06 E-.10265
G1 X150.418 Y137.8 E-.15352
G1 X150.646 Y137.653 E-.10306
G1 X150.886 Y137.53 E-.10269
G1 X151.041 Y137.469 E-.06294
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.505 Y129.993 Z1.2 F42000
G1 X145.019 Y108.154 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.28 Y108.242 E.00914
G3 X143.829 Y108.007 I-1.271 J3.258 E.67986
G3 X144.948 Y108.133 I.16 J3.611 E.0375
G1 X144.961 Y108.137 E.00044
M204 S10000
G1 X144.889 Y108.54 F42000
G1 F5400
M204 S6000
G1 X145.131 Y108.62 E.00847
G3 X143.86 Y108.413 I-1.122 J2.88 E.60121
G3 X144.832 Y108.521 I.157 J3.018 E.03259
M204 S250
G1 X144.764 Y108.911 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X144.988 Y108.985 E.00724
G3 X143.889 Y108.804 I-.978 J2.515 E.48646
G3 X144.47 Y108.841 I.089 J3.189 E.0179
G3 X144.707 Y108.893 I-.46 J2.659 E.00747
; WIPE_START
M204 S6000
G1 X144.988 Y108.985 E-.11232
G1 X145.233 Y109.097 E-.10232
G1 X145.466 Y109.232 E-.10233
G1 X145.685 Y109.389 E-.10229
G1 X145.886 Y109.567 E-.10228
G1 X146.07 Y109.764 E-.1023
G1 X146.232 Y109.979 E-.10232
G1 X146.279 Y110.055 E-.03384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.647 Y109.98 Z1.2 F42000
G1 X101.057 Y109.612 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.218 Y109.392 E.00906
G3 X103.65 Y108.02 I2.792 J2.109 E.09527
G3 X104.949 Y108.13 I.365 J3.42 E.04352
G3 X101.022 Y109.68 I-.94 J3.37 E.57885
G1 X101.029 Y109.666 E.00051
M204 S10000
G1 X101.393 Y109.842 F42000
G1 F5400
M204 S6000
G1 X101.543 Y109.638 E.00839
G3 X103.68 Y108.426 I2.467 J1.861 E.08382
G3 X104.538 Y108.454 I.321 J3.354 E.02855
G3 X101.368 Y109.896 I-.528 J3.045 E.5214
M204 S250
G1 X101.717 Y110.063 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X101.856 Y109.875 E.00717
G3 X103.71 Y108.817 I2.155 J1.624 E.06742
G3 X104.203 Y108.807 I.297 J2.458 E.01518
G3 X101.693 Y110.117 I-.192 J2.692 E.42942
; WIPE_START
M204 S6000
G1 X101.856 Y109.875 E-.11087
G1 X102.022 Y109.663 E-.10222
G1 X102.214 Y109.475 E-.10227
G1 X102.425 Y109.308 E-.1023
G1 X102.651 Y109.162 E-.10227
G1 X102.891 Y109.039 E-.10231
G1 X103.141 Y108.94 E-.10228
G1 X103.231 Y108.915 E-.03548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.741 Y116.53 Z1.2 F42000
G1 X105.398 Y141.295 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.598 Y141.384 E.00727
G3 X103.829 Y141.007 I-1.589 J3.115 E.66828
G3 X105.28 Y141.242 I.16 J3.61 E.04908
G1 X105.343 Y141.27 E.00231
M204 S10000
G1 X105.231 Y141.666 F42000
G1 F5400
M204 S6000
G1 X105.413 Y141.746 E.0066
G3 X103.86 Y141.413 I-1.404 J2.754 E.59098
G3 X104.839 Y141.523 I.157 J3.018 E.03281
G3 X105.131 Y141.62 I-.83 J2.978 E.01023
G1 X105.176 Y141.641 E.00164
M204 S250
G1 X105.069 Y142.023 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.234 Y142.095 E.00552
G3 X103.889 Y141.804 I-1.224 J2.404 E.47818
G3 X104.47 Y141.841 I.089 J3.189 E.0179
G3 X104.988 Y141.985 I-.46 J2.659 E.01655
G1 X105.015 Y141.998 E.00092
; WIPE_START
M204 S6000
G1 X105.234 Y142.095 E-.091
G1 X105.466 Y142.232 E-.10238
G1 X105.685 Y142.389 E-.10229
G1 X105.886 Y142.567 E-.10228
G1 X106.07 Y142.764 E-.1023
G1 X106.232 Y142.979 E-.10232
G1 X106.373 Y143.209 E-.10227
G1 X106.436 Y143.339 E-.05517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.899 Y141.741 Z1.2 F42000
G1 X149.992 Y134.009 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.174 J-3.73 E.04472
G3 X143.989 Y150.991 I-5.552 J-2.278 E.23536
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I-.008 J-5.996 E.31294
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I5.996 J-.008 E.31294
G1 X144.081 Y105.011 E1.32909
G3 X149.992 Y111.013 I-.095 J6.006 E.30967
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.435 J-2.014 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I-.003 J-6.403 E.33382
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.403 J-.003 E.33382
G1 X144.086 Y104.604 E1.32942
G3 X150.399 Y111.008 I-.101 J6.414 E.33054
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.812 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.002 J-6.795 E.32784
G1 X97.211 Y111.003 E1.04455
G3 X101.947 Y104.53 I6.82 J.021 E.26346
G3 X104.004 Y104.21 I2.075 J6.572 E.06421
G1 X144.091 Y104.212 E1.23176
G3 X150.363 Y108.631 I-.112 J6.819 E.25037
G3 X150.791 Y111.003 I-6.854 J2.463 E.0744
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
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


G1 X152.92 Y134.253 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42085
G1 F9525.574
M204 S6000
G1 X150.831 Y136.342 E.09097
G3 X151.52 Y136.187 I1.116 J3.36 E.02178
G1 X153.226 Y134.482 E.07428
G1 X153.652 Y134.59 E.01354
G1 X152.079 Y136.162 E.06848
G3 X152.573 Y136.203 I.043 J2.486 E.01528
G1 X154.046 Y134.731 E.06414
G1 X154.422 Y134.889 E.01257
G1 X153.016 Y136.295 E.06122
G3 X153.417 Y136.428 I-3.399 J10.892 E.01302
G1 X154.774 Y135.071 E.05911
G3 X155.103 Y135.277 I-1.212 J2.298 E.01195
M73 P37 R19
G1 X153.783 Y136.597 E.05749
G3 X154.119 Y136.795 I-.823 J1.776 E.01204
G1 X155.42 Y135.494 E.05668
G1 X155.711 Y135.738 E.01168
G1 X154.427 Y137.022 E.05592
G3 X154.708 Y137.275 I-1.12 J1.529 E.01167
G1 X155.991 Y135.992 E.05587
G3 X156.246 Y136.272 I-1.738 J1.839 E.01166
G1 X154.963 Y137.554 E.05586
G3 X155.192 Y137.86 I-1.42 J1.296 E.01178
G1 X156.489 Y136.563 E.05649
G1 X156.712 Y136.874 E.01179
G1 X155.392 Y138.195 E.05751
G3 X155.561 Y138.559 I-1.741 J1.031 E.01241
G1 X156.913 Y137.208 E.05886
G3 X157.101 Y137.555 I-2.218 J1.424 E.01216
G1 X155.697 Y138.959 E.06114
G3 X155.792 Y139.398 I-2.147 J.696 E.01386
G1 X157.259 Y137.931 E.06387
G3 X157.399 Y138.325 I-1.9 J.9 E.0129
G1 X155.839 Y139.886 E.06797
G3 X155.816 Y140.443 I-4.553 J.095 E.01718
G1 X157.516 Y138.742 E.07405
G1 X157.596 Y139.197 E.01421
G1 X155.397 Y141.396 E.09579
M204 S10000
G1 X155.013 Y144.988 F42000
G1 F9525.574
M204 S6000
G1 X156.054 Y143.947 E.04534
G2 X157.169 Y142.296 I-4.406 J-4.182 E.06162
G1 X154.304 Y145.162 E.12481
G3 X153.477 Y145.454 I-2.491 J-5.732 E.02703
G1 X157.455 Y141.476 E.17326
G2 X157.597 Y140.8 I-3.307 J-1.048 E.02133
G1 X152.798 Y145.598 E.209
G3 X152.212 Y145.65 I-.562 J-3.008 E.01816
G1 X157.647 Y140.215 E.23672
G2 X157.648 Y139.68 I-3.567 J-.269 E.01648
G1 X151.676 Y145.652 E.26009
G1 X151.14 Y145.654 E.01652
G1 X153.121 Y143.672 E.0863
G3 X152.443 Y143.816 I-1.301 J-4.467 E.02137
G1 X150.603 Y145.656 E.08012
G1 X150.067 Y145.657 E.01652
G1 X151.888 Y143.837 E.07929
G3 X151.397 Y143.793 I-.025 J-2.474 E.01519
G1 X144.561 Y150.629 E.29775
G1 X143.999 Y150.657 E.01733
G1 X150.957 Y143.698 E.30305
G3 X150.56 Y143.561 I.488 J-2.049 E.01296
G1 X143.463 Y150.658 E.30908
G1 X142.929 Y150.657 E.01646
M73 P38 R19
G1 X145.612 Y147.974 E.11687
G3 X144.808 Y148.243 I-1.625 J-3.513 E.02617
G1 X142.395 Y150.657 E.10513
G1 X141.86 Y150.657 E.01646
G1 X144.192 Y148.326 E.10154
G3 X143.668 Y148.315 I-.209 J-2.617 E.01616
G1 X141.326 Y150.657 E.102
G1 X140.792 Y150.657 E.01646
G1 X143.201 Y148.247 E.10495
G3 X142.78 Y148.134 I2.354 J-9.621 E.01344
G1 X140.257 Y150.657 E.10987
G1 X139.723 Y150.657 E.01646
G1 X142.398 Y147.981 E.11652
G3 X142.048 Y147.797 I.746 J-1.842 E.01221
G1 X139.188 Y150.657 E.12454
G1 X138.654 Y150.657 E.01646
G1 X141.727 Y147.584 E.13382
G3 X141.432 Y147.344 I1.052 J-1.589 E.01172
G1 X138.12 Y150.657 E.14428
G1 X137.585 Y150.656 E.01646
G1 X141.165 Y147.077 E.15589
G3 X140.923 Y146.784 I1.343 J-1.35 E.01171
G1 X137.051 Y150.656 E.16866
G1 X136.517 Y150.656 E.01646
G1 X140.71 Y146.463 E.18263
G3 X140.525 Y146.113 I1.659 J-1.098 E.01221
G1 X135.982 Y150.656 E.19787
G1 X135.448 Y150.656 E.01646
G1 X140.373 Y145.731 E.21452
G3 X140.258 Y145.311 I2.04 J-.785 E.01342
G1 X134.913 Y150.656 E.23278
G1 X134.379 Y150.656 E.01646
G1 X140.187 Y144.847 E.25297
G3 X140.172 Y144.329 I2.585 J-.338 E.01601
G1 X133.845 Y150.656 E.27556
G1 X133.31 Y150.656 E.01646
G1 X140.254 Y143.712 E.3024
G3 X140.512 Y142.92 I3.855 J.817 E.02571
G1 X132.776 Y150.656 E.33691
G1 X132.242 Y150.655 E.01646
G1 X149.659 Y133.238 E.75857
G1 X149.659 Y133.773 E.01646
G1 X142.428 Y141.004 E.31494
G3 X143.215 Y140.751 I1.707 J3.966 E.0255
G1 X149.659 Y134.307 E.28066
G1 X149.659 Y134.342 E.00108
G1 X150.158 Y134.342 E.01538
G1 X143.827 Y140.673 E.27571
G3 X144.35 Y140.685 I.154 J4.852 E.01612
G1 X150.692 Y134.342 E.27622
G1 X151.227 Y134.342 E.01646
G1 X144.812 Y140.757 E.27939
G3 X145.23 Y140.873 I-.371 J2.15 E.01339
G1 X151.761 Y134.342 E.28444
G3 X152.281 Y134.357 I.109 J5.268 E.01602
G1 X145.612 Y141.026 E.29044
G3 X145.962 Y141.211 I-.748 J1.841 E.0122
G1 X148.342 Y138.831 E.10364
G2 X148.193 Y139.515 I4.421 J1.324 E.02158
G1 X146.283 Y141.424 E.08317
G3 X146.576 Y141.665 I-1.058 J1.586 E.01171
G1 X148.162 Y140.08 E.06906
G2 X148.205 Y140.571 I2.473 J.028 E.01521
G1 X146.843 Y141.933 E.05933
G3 X147.083 Y142.227 I-1.349 J1.347 E.01172
G1 X148.298 Y141.013 E.0529
G2 X148.431 Y141.414 I2.075 J-.465 E.01305
G1 X147.296 Y142.549 E.04942
G3 X147.48 Y142.899 I-1.659 J1.095 E.01221
G1 X148.599 Y141.781 E.0487
G2 X148.797 Y142.117 I1.781 J-.823 E.01204
G1 X147.633 Y143.281 E.0507
G3 X147.749 Y143.7 I-2.031 J.79 E.01339
G1 X149.023 Y142.425 E.0555
G2 X149.276 Y142.707 I1.529 J-1.123 E.01167
G1 X147.818 Y144.165 E.0635
G3 X147.826 Y144.692 I-2.626 J.299 E.01627
G1 X149.556 Y142.961 E.07537
G2 X149.862 Y143.19 I1.294 J-1.418 E.01178
G1 X147.748 Y145.304 E.09209
G3 X147.475 Y146.111 I-3.968 J-.89 E.02627
G1 X150.321 Y143.266 E.12391
M204 S10000
G1 X149.839 Y145.885 F42000
G1 F9525.574
M204 S6000
G1 X145.203 Y150.522 E.20194
G2 X145.958 Y150.3 I-.779 J-4.062 E.02429
G1 X149.297 Y146.961 E.14542
G3 X148.799 Y147.995 I-4.397 J-1.485 E.03542
G1 X146.571 Y150.222 E.09701
M204 S10000
G1 X131.538 Y150.825 F42000
G1 F9525.574
M204 S6000
G1 X149.659 Y132.704 E.78923
G1 X149.659 Y132.169 E.01646
G1 X131.173 Y150.655 E.80511
G1 X130.638 Y150.655 E.01646
G1 X149.659 Y131.635 E.82839
G1 X149.659 Y131.1 E.01646
G1 X130.104 Y150.655 E.85166
G1 X129.57 Y150.655 E.01646
G1 X149.659 Y130.566 E.87493
G1 X149.659 Y130.031 E.01646
G1 X129.035 Y150.655 E.89821
G1 X128.501 Y150.655 E.01646
G1 X149.659 Y129.497 E.92148
G1 X149.659 Y128.962 E.01646
G1 X127.967 Y150.655 E.94475
G1 X127.432 Y150.655 E.01646
G1 X149.659 Y128.428 E.96803
G1 X149.659 Y127.894 E.01646
G1 X126.898 Y150.654 E.9913
G1 X126.363 Y150.654 E.01646
G1 X149.659 Y127.359 E1.01457
G1 X149.659 Y126.825 E.01646
G1 X125.829 Y150.654 E1.03785
G1 X125.295 Y150.654 E.01646
G1 X149.659 Y126.29 E1.06112
G1 X149.659 Y125.756 E.01646
G1 X124.76 Y150.654 E1.0844
G1 X124.226 Y150.654 E.01646
G1 X149.659 Y125.221 E1.10767
G1 X149.659 Y124.687 E.01646
G1 X123.692 Y150.654 E1.13094
G1 X123.157 Y150.654 E.01646
G1 X149.659 Y124.152 E1.15422
G1 X149.659 Y123.618 E.01646
G1 X122.623 Y150.654 E1.17749
G1 X122.088 Y150.654 E.01646
G1 X149.659 Y123.083 E1.20076
G1 X149.659 Y122.549 E.01646
G1 X121.554 Y150.653 E1.22404
G1 X121.02 Y150.653 E.01646
G1 X149.659 Y122.014 E1.24731
G1 X149.659 Y121.48 E.01646
G1 X120.485 Y150.653 E1.27058
G1 X119.951 Y150.653 E.01646
G1 X125.773 Y144.831 E.25358
G1 X125.348 Y144.895 E.01324
G1 X125.187 Y144.883 E.00498
G1 X119.417 Y150.653 E.25132
G1 X118.882 Y150.653 E.01646
G1 X124.735 Y144.8 E.25491
G3 X124.363 Y144.638 I.214 J-1.003 E.0126
G1 X118.348 Y150.653 E.26196
G1 X117.813 Y150.653 E.01646
G1 X124.051 Y144.415 E.27166
G1 X124.001 Y144.375 E.00198
G3 X123.077 Y144.855 I-1.383 J-1.534 E.0324
G1 X117.279 Y150.653 E.25252
G1 X116.745 Y150.653 E.01646
G1 X122.515 Y144.882 E.25131
G3 X122.077 Y144.786 I.101 J-1.503 E.01387
G1 X116.21 Y150.652 E.2555
G1 X115.676 Y150.652 E.01646
G1 X121.715 Y144.614 E.263
G1 X121.411 Y144.383 E.01175
G1 X115.142 Y150.652 E.27304
G1 X114.607 Y150.652 E.01646
G1 X121.161 Y144.098 E.28543
G1 X120.967 Y143.758 E.01206
G1 X114.073 Y150.652 E.30024
G1 X113.538 Y150.652 E.01646
G1 X120.841 Y143.35 E.31804
G3 X120.822 Y142.833 I1.267 J-.303 E.01601
G1 X113.004 Y150.652 E.34051
G1 X112.47 Y150.652 E.01646
G1 X128.279 Y134.842 E.68854
G1 X128.814 Y134.842 E.01646
G1 X122.536 Y141.12 E.27342
G1 X122.654 Y141.105 E.00366
G1 X123.051 Y141.139 E.01228
G1 X129.348 Y134.842 E.27425
G1 X129.882 Y134.842 E.01646
G1 X123.457 Y141.268 E.27986
G3 X123.797 Y141.462 I-.31 J.939 E.01215
G1 X130.417 Y134.842 E.28831
G1 X130.951 Y134.842 E.01646
G1 X124.504 Y141.29 E.28081
G1 X124.625 Y141.228 E.0042
G1 X125.054 Y141.122 E.01359
G1 X125.219 Y141.109 E.00511
G1 X131.486 Y134.842 E.27293
G1 X132.02 Y134.842 E.01646
G1 X125.708 Y141.155 E.27494
G3 X126.105 Y141.293 I-.142 J1.052 E.01303
G1 X149.659 Y117.739 E1.02585
G1 X149.659 Y118.273 E.01646
G1 X126.442 Y141.49 E1.01117
G3 X126.718 Y141.748 I-.714 J1.043 E.01169
G1 X149.659 Y118.807 E.99912
G1 X149.659 Y119.342 E.01646
G1 X126.938 Y142.063 E.98955
G3 X127.1 Y142.435 I-.839 J.587 E.01259
G1 X149.659 Y119.876 E.98248
G1 X149.659 Y120.411 E.01646
G1 X127.185 Y142.885 E.9788
G3 X127.129 Y143.475 I-1.593 J.147 E.01836
G1 X149.828 Y120.776 E.98862
; WIPE_START
G1 X148.414 Y122.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.725 Y114.747 Z1.2 F42000
G1 X144.559 Y105.201 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X119.843 Y129.916 E1.07643
G1 X119.843 Y129.382 E.01646
G1 X143.88 Y105.345 E1.04688
G1 X143.346 Y105.345 E.01646
G1 X119.843 Y128.847 E1.0236
G1 X119.843 Y128.313 E.01646
G1 X142.811 Y105.345 E1.00032
G1 X142.277 Y105.345 E.01646
G1 X119.843 Y127.778 E.97703
G1 X119.843 Y127.244 E.01646
G1 X141.742 Y105.345 E.95375
G1 X141.208 Y105.345 E.01646
G1 X119.395 Y127.158 E.95
G1 X118.861 Y127.158 E.01646
G1 X140.673 Y105.345 E.95
G1 X140.139 Y105.345 E.01646
G1 X118.326 Y127.158 E.94999
G1 X117.792 Y127.158 E.01646
G1 X139.604 Y105.345 E.94999
G1 X139.07 Y105.345 E.01646
G1 X117.257 Y127.158 E.94999
G1 X116.723 Y127.158 E.01646
G1 X138.535 Y105.345 E.94998
G1 X138 Y105.345 E.01646
G1 X116.188 Y127.158 E.94998
G1 X115.654 Y127.158 E.01646
G1 X137.466 Y105.346 E.94998
G1 X136.931 Y105.346 E.01646
G1 X98.351 Y143.926 E1.6803
G1 X98.351 Y144.461 E.01646
G1 X115.159 Y127.653 E.73203
G1 X115.159 Y128.187 E.01646
G1 X102.253 Y141.093 E.56209
G3 X103.107 Y140.774 I1.823 J3.573 E.02814
G1 X115.159 Y128.722 E.5249
G1 X115.159 Y129.256 E.01646
G1 X103.735 Y140.68 E.49754
G3 X104.273 Y140.676 I.292 J3.348 E.01659
G1 X115.159 Y129.791 E.4741
G1 X115.159 Y130.325 E.01646
G1 X104.742 Y140.741 E.45366
G3 X105.166 Y140.852 I-.34 J2.173 E.01352
G1 X115.159 Y130.86 E.43519
G1 X115.159 Y131.394 E.01646
G1 X105.553 Y140.999 E.41834
G3 X105.908 Y141.179 I-.723 J1.863 E.01226
G1 X115.159 Y131.929 E.4029
G1 X115.159 Y132.463 E.01646
G1 X106.233 Y141.389 E.38873
G3 X106.531 Y141.625 I-1.036 J1.608 E.01173
G1 X115.159 Y132.997 E.37577
G1 X115.159 Y133.532 E.01646
G1 X106.802 Y141.889 E.36396
G3 X107.047 Y142.179 I-1.327 J1.367 E.0117
G1 X115.159 Y134.066 E.35331
G1 X115.159 Y134.601 E.01646
G1 X107.264 Y142.496 E.34384
G3 X107.453 Y142.841 I-1.634 J1.116 E.01215
G1 X115.452 Y134.842 E.34838
G1 X115.986 Y134.842 E.01646
G1 X107.61 Y143.219 E.36481
G3 X107.731 Y143.632 I-2 J.814 E.01328
G1 X116.521 Y134.842 E.38279
G1 X117.055 Y134.842 E.01646
G1 X107.811 Y144.086 E.4026
G3 X107.83 Y144.602 I-5.229 J.449 E.0159
G1 X117.59 Y134.842 E.42505
G1 X118.124 Y134.842 E.01646
G1 X107.768 Y145.198 E.45102
G3 X107.547 Y145.954 I-4.354 J-.865 E.02429
G1 X118.659 Y134.842 E.48394
G1 X119.193 Y134.842 E.01646
G1 X103.416 Y150.62 E.68715
G2 X103.92 Y150.65 I.407 J-2.55 E.01558
G1 X140.868 Y113.702 E1.60919
G3 X140.661 Y113.374 I1.539 J-1.197 E.01196
G1 X119.843 Y134.192 E.90668
G1 X119.843 Y133.657 E.01646
G1 X140.485 Y113.016 E.89898
G3 X140.341 Y112.626 I1.879 J-.913 E.01284
G1 X119.843 Y133.123 E.89272
M73 P39 R19
G1 X119.843 Y132.588 E.01646
G1 X140.235 Y112.197 E.88812
G3 X140.175 Y111.723 I2.337 J-.538 E.01475
G1 X119.843 Y132.054 E.88549
G1 X119.843 Y131.52 E.01646
G1 X140.185 Y111.178 E.88593
G3 X140.29 Y110.538 I5.008 J.498 E.01999
G1 X119.843 Y130.985 E.89052
G1 X119.843 Y130.451 E.01646
G1 X144.876 Y105.418 E1.09024
G3 X145.325 Y105.503 I-.289 J2.748 E.0141
G1 X143.035 Y107.794 E.09977
G3 X143.679 Y107.684 I.985 J3.83 E.02015
G1 X145.74 Y105.623 E.08978
G3 X146.131 Y105.767 I-.559 J2.119 E.01284
G1 X144.222 Y107.676 E.08316
G3 X144.7 Y107.732 I-.392 J5.432 E.01484
G1 X146.504 Y105.928 E.07855
G3 X146.852 Y106.115 I-1.728 J3.636 E.01216
G1 X145.128 Y107.839 E.07508
G3 X145.518 Y107.983 I-.526 J2.021 E.01283
G1 X147.175 Y106.326 E.07219
G3 X147.485 Y106.55 I-.985 J1.685 E.01181
G1 X145.875 Y108.16 E.07013
G3 X146.203 Y108.367 I-.867 J1.74 E.01196
G1 X147.779 Y106.791 E.06863
G3 X148.05 Y107.054 I-3.089 J3.459 E.01164
G1 X146.503 Y108.601 E.06737
G3 X146.777 Y108.862 I-1.165 J1.496 E.01166
G1 X148.304 Y107.334 E.06652
G3 X148.542 Y107.631 I-1.668 J1.583 E.01172
G1 X147.024 Y109.149 E.06612
G3 X147.244 Y109.463 I-1.461 J1.257 E.01184
G1 X148.759 Y107.949 E.06595
G3 X148.957 Y108.286 I-1.665 J1.207 E.01204
G1 X147.436 Y109.807 E.06624
G3 X147.596 Y110.181 I-1.789 J.987 E.01256
G1 X149.14 Y108.637 E.06724
G3 X149.293 Y109.018 I-2.508 J1.228 E.01267
G1 X147.721 Y110.59 E.06846
G3 X147.804 Y111.041 I-2.213 J.643 E.01415
G1 X149.431 Y109.415 E.07082
G3 X149.533 Y109.847 I-2.874 J.907 E.01369
G1 X147.833 Y111.547 E.07403
G3 X147.778 Y112.137 I-2.978 J.019 E.01827
G1 X149.61 Y110.305 E.07981
G3 X149.653 Y110.796 I-3.311 J.539 E.0152
G1 X147.24 Y113.209 E.10511
; WIPE_START
G1 X148.654 Y111.795 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.306 Y113.858 Z1.2 F42000
G1 X141.222 Y113.882 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X104.284 Y150.82 E1.60875
M204 S10000
G1 X102.805 Y150.696 F42000
G1 F9525.574
M204 S6000
G1 X105.457 Y148.044 E.11548
G3 X104.698 Y148.269 I-1.647 J-4.173 E.02441
G1 X102.513 Y150.453 E.09513
G1 X102.103 Y150.329 E.0132
G1 X104.104 Y148.328 E.08714
G3 X103.588 Y148.309 I-.164 J-2.581 E.01592
G1 X101.725 Y150.173 E.08117
G3 X101.365 Y149.998 I.709 J-1.914 E.01233
G1 X103.13 Y148.233 E.07686
G3 X102.718 Y148.11 I.408 J-2.12 E.01325
G1 X101.023 Y149.805 E.07383
G1 X100.703 Y149.591 E.01187
G1 X102.342 Y147.952 E.07138
G3 X101.996 Y147.764 I.771 J-1.822 E.01215
G1 X100.403 Y149.356 E.06938
G3 X100.116 Y149.11 I1.526 J-2.068 E.01168
G1 X101.679 Y147.546 E.06809
G3 X101.389 Y147.302 I1.076 J-1.57 E.0117
G1 X99.853 Y148.837 E.06688
G3 X99.602 Y148.554 I1.313 J-1.416 E.01168
G1 X101.126 Y147.031 E.06634
G3 X100.889 Y146.733 I1.372 J-1.334 E.01173
G1 X99.375 Y148.247 E.06594
G3 X99.165 Y147.922 I1.545 J-1.226 E.01193
G1 X100.68 Y146.408 E.06596
G3 X100.5 Y146.053 I1.684 J-1.075 E.01227
G1 X98.972 Y147.581 E.06656
G1 X98.8 Y147.218 E.01236
G1 X100.353 Y145.665 E.06764
G3 X100.244 Y145.24 I2.07 J-.758 E.01354
G1 X98.655 Y146.829 E.06922
G3 X98.532 Y146.418 I2.028 J-.831 E.01324
G1 X100.18 Y144.77 E.07178
G3 X100.179 Y144.236 I4.692 J-.272 E.01645
G1 X98.435 Y145.98 E.07598
G3 X98.368 Y145.512 I3.136 J-.685 E.01457
G1 X100.275 Y143.605 E.08306
G3 X100.591 Y142.755 I2.807 J.559 E.02806
G1 X98.181 Y145.165 E.10496
M204 S10000
G1 X98.181 Y143.562 F42000
G1 F9525.574
M204 S6000
G1 X136.397 Y105.346 E1.66441
G1 X135.862 Y105.346 E.01646
G1 X98.35 Y142.858 E1.63375
G1 X98.35 Y142.323 E.01646
G1 X135.328 Y105.346 E1.61047
G1 X134.793 Y105.346 E.01646
G1 X98.35 Y141.789 E1.58719
G1 X98.35 Y141.254 E.01646
G1 X134.259 Y105.346 E1.56392
G1 X133.724 Y105.346 E.01646
G1 X98.35 Y140.72 E1.54064
G1 X98.35 Y140.186 E.01646
G1 X133.19 Y105.346 E1.51737
G1 X132.655 Y105.346 E.01646
G1 X98.35 Y139.651 E1.49409
G1 X98.35 Y139.117 E.01646
G1 X132.12 Y105.346 E1.47082
G1 X131.586 Y105.346 E.01646
G1 X98.35 Y138.583 E1.44754
G1 X98.349 Y138.048 E.01646
G1 X131.051 Y105.346 E1.42426
G1 X130.517 Y105.346 E.01646
G1 X98.349 Y137.514 E1.40099
G1 X98.349 Y136.98 E.01646
G1 X129.982 Y105.346 E1.37771
G1 X129.448 Y105.347 E.01646
G1 X98.349 Y136.445 E1.35444
G1 X98.349 Y135.911 E.01646
G1 X128.913 Y105.347 E1.33116
G1 X128.379 Y105.347 E.01646
G1 X98.349 Y135.377 E1.30788
G1 X98.349 Y134.842 E.01646
G1 X127.844 Y105.347 E1.28461
G1 X127.31 Y105.347 E.01646
G1 X98.349 Y134.308 E1.26133
G1 X98.348 Y133.773 E.01646
G1 X126.775 Y105.347 E1.23806
G1 X126.241 Y105.347 E.01646
G1 X98.348 Y133.239 E1.21478
G1 X98.348 Y132.705 E.01646
G1 X125.706 Y105.347 E1.19151
G1 X125.171 Y105.347 E.01646
G1 X98.348 Y132.17 E1.16823
G1 X98.348 Y131.636 E.01646
G1 X124.637 Y105.347 E1.14495
G1 X124.102 Y105.347 E.01646
G1 X98.348 Y131.102 E1.12168
G1 X98.348 Y130.567 E.01646
G1 X123.568 Y105.347 E1.0984
G1 X123.033 Y105.347 E.01646
G1 X98.348 Y130.033 E1.07513
G1 X98.348 Y129.499 E.01646
G1 X122.499 Y105.347 E1.05185
G1 X121.964 Y105.348 E.01646
G1 X98.347 Y128.964 E1.02858
G1 X98.347 Y128.43 E.01646
G1 X121.43 Y105.348 E1.0053
G1 X120.895 Y105.348 E.01646
G1 X98.347 Y127.896 E.98202
G1 X98.347 Y127.361 E.01646
G1 X120.361 Y105.348 E.95875
G1 X119.826 Y105.348 E.01646
G1 X98.347 Y126.827 E.93547
G1 X98.347 Y126.292 E.01646
G1 X119.291 Y105.348 E.9122
G1 X118.757 Y105.348 E.01646
G1 X98.347 Y125.758 E.88892
G1 X98.347 Y125.224 E.01646
G1 X118.222 Y105.348 E.86565
G1 X117.688 Y105.348 E.01646
G1 X98.346 Y124.689 E.84237
G1 X98.346 Y124.155 E.01646
G1 X117.153 Y105.348 E.81909
G1 X116.619 Y105.348 E.01646
G1 X98.346 Y123.621 E.79582
G1 X98.346 Y123.086 E.01646
G1 X116.084 Y105.348 E.77254
G1 X115.55 Y105.348 E.01646
G1 X98.346 Y122.552 E.74927
G1 X98.346 Y122.018 E.01646
G1 X105.24 Y115.123 E.30027
G3 X104.537 Y115.292 I-1.257 J-3.687 E.0223
G1 X98.346 Y121.483 E.26964
G1 X98.346 Y120.949 E.01646
G1 X103.963 Y115.331 E.24466
G3 X103.466 Y115.294 I.153 J-5.351 E.01536
G1 X98.346 Y120.415 E.22301
G1 X98.345 Y119.88 E.01646
G1 X103.023 Y115.203 E.20372
G3 X102.62 Y115.071 I.454 J-2.079 E.01308
G1 X98.345 Y119.346 E.18616
G1 X98.345 Y118.811 E.01646
G1 X102.251 Y114.906 E.1701
G3 X101.913 Y114.71 I.81 J-1.786 E.01206
G1 X98.345 Y118.277 E.15537
G1 X98.345 Y117.743 E.01646
G1 X101.603 Y114.485 E.14188
G3 X101.32 Y114.234 I1.113 J-1.538 E.01168
G1 X98.345 Y117.208 E.12956
G1 X98.345 Y116.674 E.01646
G1 X101.063 Y113.956 E.11839
G3 X100.833 Y113.651 I1.408 J-1.301 E.01177
G1 X98.345 Y116.14 E.10838
G1 X98.344 Y115.605 E.01646
G1 X100.631 Y113.319 E.09959
G3 X100.459 Y112.956 I1.725 J-1.04 E.01238
G1 X98.344 Y115.071 E.09211
G1 X98.344 Y114.537 E.01646
G1 X100.321 Y112.56 E.08608
G3 X100.221 Y112.126 I2.122 J-.717 E.01375
G1 X98.344 Y114.002 E.08173
G1 X98.344 Y113.468 E.01646
G1 X100.172 Y111.64 E.0796
G3 X100.194 Y111.083 I2.795 J-.166 E.0172
G1 X98.344 Y112.934 E.08059
G1 X98.344 Y112.399 E.01646
G1 X100.603 Y110.14 E.09839
M204 S10000
G1 X99.033 Y107.969 F42000
G1 F9525.574
M204 S6000
G1 X100.008 Y106.993 E.04249
G3 X101.696 Y105.84 I3.905 J3.902 E.06333
G1 X98.841 Y108.695 E.12435
G2 X98.546 Y109.525 I5.55 J2.441 E.02714
G1 X102.528 Y105.542 E.17344
G3 X103.171 Y105.404 I1.021 J3.189 E.02027
G1 X103.204 Y105.401 E.00103
G1 X98.408 Y110.197 E.20887
G2 X98.355 Y110.785 I2.94 J.563 E.01821
G1 X103.79 Y105.35 E.2367
G1 X104.324 Y105.35 E.01646
G1 X98.344 Y111.33 E.26047
G1 X98.344 Y111.865 E.01646
G1 X104.859 Y105.35 E.28375
G1 X105.393 Y105.35 E.01646
G1 X102.916 Y107.827 E.10791
G3 X103.584 Y107.693 I.894 J2.725 E.02105
G1 X105.928 Y105.35 E.10208
G1 X106.462 Y105.35 E.01646
G1 X104.139 Y107.673 E.10119
G3 X104.627 Y107.719 I.013 J2.463 E.01513
G1 X106.997 Y105.349 E.10321
G1 X107.531 Y105.349 E.01646
G1 X105.064 Y107.817 E.10748
G3 X105.459 Y107.957 I-.498 J2.043 E.01293
G1 X108.066 Y105.349 E.11355
G1 X108.601 Y105.349 E.01646
G1 X105.821 Y108.129 E.12106
G3 X106.153 Y108.331 I-.844 J1.763 E.012
G1 X109.135 Y105.349 E.12987
G1 X109.67 Y105.349 E.01646
G1 X106.458 Y108.561 E.13988
G3 X106.736 Y108.817 I-1.141 J1.515 E.01167
G1 X110.204 Y105.349 E.15106
G1 X110.739 Y105.349 E.01646
G1 X106.987 Y109.1 E.16339
G3 X107.212 Y109.41 I-1.435 J1.276 E.01181
G1 X111.273 Y105.349 E.17689
M73 P40 R19
G1 X111.808 Y105.349 E.01646
G1 X107.408 Y109.749 E.19163
G3 X107.573 Y110.118 I-1.762 J1.01 E.01248
G1 X112.342 Y105.349 E.20771
G1 X112.877 Y105.349 E.01646
G1 X107.704 Y110.522 E.22531
G3 X107.793 Y110.967 I-2.177 J.67 E.014
G1 X113.411 Y105.349 E.24469
G1 X113.946 Y105.349 E.01646
G1 X107.833 Y111.461 E.26623
G3 X107.793 Y112.036 I-4.681 J-.04 E.01776
G1 X114.481 Y105.349 E.29127
G1 X115.015 Y105.348 E.01646
G1 X107.319 Y113.044 E.33518
M204 S10000
G1 X128.328 Y134.259 F42000
G1 F9525.574
M204 S6000
G1 X111.935 Y150.652 E.71396
G1 X111.401 Y150.652 E.01646
G1 X128.159 Y133.894 E.72985
G1 X128.159 Y133.359 E.01646
G1 X110.867 Y150.651 E.75312
G1 X110.332 Y150.651 E.01646
G1 X128.159 Y132.825 E.77639
G1 X128.159 Y132.29 E.01646
G1 X109.798 Y150.651 E.79967
G1 X109.263 Y150.651 E.01646
G1 X128.159 Y131.756 E.82294
G1 X128.159 Y131.221 E.01646
G1 X108.729 Y150.651 E.84621
G1 X108.195 Y150.651 E.01646
G1 X128.159 Y130.687 E.86949
G1 X128.159 Y130.152 E.01646
G1 X107.66 Y150.651 E.89276
G1 X107.126 Y150.651 E.01646
G1 X128.159 Y129.618 E.91604
G1 X128.159 Y129.084 E.01646
G1 X106.592 Y150.651 E.93931
G1 X106.057 Y150.651 E.01646
G1 X128.159 Y128.549 E.96258
G1 X128.159 Y128.015 E.01646
G1 X105.523 Y150.65 E.98586
G1 X104.988 Y150.65 E.01646
G1 X141.363 Y114.276 E1.58421
G2 X141.65 Y114.523 I1.38 J-1.313 E.01169
G1 X129.016 Y127.158 E.55027
G1 X129.55 Y127.158 E.01646
G1 X141.965 Y114.743 E.54068
G2 X142.307 Y114.935 I1.13 J-1.618 E.01212
G1 X130.085 Y127.158 E.53233
G1 X130.619 Y127.158 E.01646
G1 X142.681 Y115.096 E.52533
G2 X143.09 Y115.222 I.834 J-1.98 E.01319
G1 X131.154 Y127.158 E.51985
G1 X131.688 Y127.158 E.01646
G1 X143.54 Y115.305 E.51619
G2 X144.051 Y115.329 I.374 J-2.534 E.01577
G1 X132.223 Y127.158 E.51516
G1 X132.757 Y127.158 E.01646
G1 X144.635 Y115.28 E.51731
G2 X145.369 Y115.08 I-.898 J-4.75 E.02346
G1 X132.843 Y127.606 E.54552
G1 X132.843 Y128.14 E.01646
G1 X149.659 Y111.325 E.73235
G1 X149.659 Y111.859 E.01646
G1 X132.843 Y128.675 E.73235
G1 X132.843 Y129.209 E.01646
G1 X149.659 Y112.394 E.73235
G1 X149.659 Y112.928 E.01646
G1 X132.843 Y129.743 E.73235
G1 X132.843 Y130.278 E.01646
G1 X149.659 Y113.463 E.73235
G1 X149.659 Y113.997 E.01646
G1 X132.843 Y130.812 E.73235
G1 X132.843 Y131.347 E.01646
G1 X149.659 Y114.532 E.73235
G1 X149.659 Y115.066 E.01646
G1 X132.843 Y131.881 E.73235
G1 X132.843 Y132.416 E.01646
G1 X149.659 Y115.601 E.73235
G1 X149.659 Y116.135 E.01646
G1 X132.843 Y132.95 E.73235
G1 X132.843 Y133.485 E.01646
G1 X149.659 Y116.67 E.73235
G1 X149.659 Y117.204 E.01646
G1 X132.674 Y134.189 E.73974
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9525.574
G1 X134.088 Y132.775 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/53
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I-.717 J-.983 P1  F42000
G1 X131.711 Y134.509 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.492 Y134.509 E.10678
G1 X128.492 Y127.491 E.23281
G1 X132.51 Y127.491 E.13329
G1 X132.51 Y134.509 E.23281
G1 X131.771 Y134.509 E.02452
M204 S10000
G1 X132.103 Y133.71 F42000
G1 F5400
M204 S6000
G1 X132.103 Y134.102 E.01301
G1 X128.899 Y134.102 E.10629
G1 X128.899 Y127.898 E.2058
G1 X132.103 Y127.898 E.10629
G1 X132.103 Y133.65 E.19081
M204 S250
G1 X131.711 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X129.291 Y133.71 E.07436
G1 X129.291 Y128.29 E.16654
G1 X131.711 Y128.29 E.07436
G1 X131.711 Y133.65 E.1647
; WIPE_START
M204 S6000
G1 X129.712 Y133.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.093 Y134.159 Z1.4 F42000
G1 X116.291 Y134.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X115.492 Y134.509 E.02651
G1 X115.492 Y127.491 E.23281
G1 X119.51 Y127.491 E.13329
G1 X119.51 Y134.509 E.23281
G1 X116.351 Y134.509 E.10479
M204 S10000
G1 X116.291 Y134.102 F42000
G1 F5400
M204 S6000
G1 X115.899 Y134.102 E.01301
G1 X115.899 Y127.898 E.2058
G1 X119.103 Y127.898 E.10629
G1 X119.103 Y134.102 E.2058
G1 X116.351 Y134.102 E.09129
M204 S250
G1 X116.291 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.291 Y128.29 E.16654
G1 X118.711 Y128.29 E.07436
G1 X118.711 Y133.71 E.16654
G1 X116.351 Y133.71 E.07252
; WIPE_START
M204 S6000
G1 X116.329 Y131.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.464 Y137.357 Z1.4 F42000
G1 X125.186 Y141.45 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X125.418 Y141.445 E.00767
G3 X124.005 Y143.87 I-.121 J1.553 E.2088
G3 X123.997 Y142.13 I-1.3 J-.864 E.26419
G3 X125.107 Y141.452 I1.367 J.99 E.04428
G1 X125.126 Y141.451 E.00065
M204 S10000
G1 X125.119 Y141.865 F42000
G1 F5400
M204 S6000
G1 X125.157 Y141.856 E.0013
G1 X125.272 Y141.848 E.00382
G3 X124.934 Y141.907 I.029 J1.152 E.22868
G1 X125.061 Y141.878 E.00432
M204 S250
G1 X125.206 Y142.246 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X125.282 Y142.24 E.00234
G3 X125.147 Y142.256 I.019 J.76 E.1425
; WIPE_START
M204 S6000
G1 X125.282 Y142.24 E-.05165
G1 X125.433 Y142.251 E-.05746
G1 X125.579 Y142.292 E-.05761
G1 X125.775 Y142.406 E-.08612
G1 X125.883 Y142.511 E-.05751
G1 X125.969 Y142.637 E-.0576
G1 X126.028 Y142.776 E-.05743
G1 X126.058 Y142.924 E-.05751
G1 X126.046 Y143.154 E-.08738
G1 X125.986 Y143.33 E-.07074
G1 X125.907 Y143.459 E-.05749
G1 X125.804 Y143.57 E-.05749
G1 X125.796 Y143.576 E-.004
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.451 Y141.881 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.557 Y141.856 E.00363
G1 X122.672 Y141.848 E.00382
G3 X122.334 Y141.907 I.029 J1.152 E.22868
G1 X122.392 Y141.894 E.00199
M204 S250
G1 X122.538 Y142.261 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.606 Y142.246 E.00216
G1 X122.682 Y142.24 E.00234
G3 X122.459 Y142.279 I.019 J.76 E.1397
G1 X122.479 Y142.275 E.00064
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.04952
G1 X122.682 Y142.24 E-.0289
G1 X122.833 Y142.251 E-.05745
G1 X122.979 Y142.292 E-.05761
G1 X123.175 Y142.406 E-.08612
G1 X123.283 Y142.511 E-.05751
G1 X123.369 Y142.637 E-.0576
G1 X123.428 Y142.776 E-.05743
G1 X123.458 Y142.924 E-.05751
G1 X123.446 Y143.154 E-.08738
G1 X123.386 Y143.33 E-.07074
G1 X123.307 Y143.459 E-.05749
G1 X123.245 Y143.526 E-.03472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y143.686 Z1.4 F42000
G1 X147.263 Y144.028 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.291 Y144.171 E.00482
G3 X143.727 Y141.215 I-3.281 J.33 E.517
G3 X145.207 Y141.428 I.272 J3.362 E.05002
G3 X147.242 Y143.845 I-1.197 J3.073 E.10929
G1 X147.256 Y143.969 E.00414
M204 S10000
G1 X146.861 Y144.089 F42000
G1 F5400
M204 S6000
G1 X146.887 Y144.211 E.00415
G3 X143.757 Y141.621 I-2.877 J.29 E.45315
G3 X144.785 Y141.715 I.26 J2.808 E.03442
G3 X146.844 Y143.925 I-.774 J2.786 E.10543
G1 X146.855 Y144.029 E.00347
M204 S250
G1 X146.473 Y144.147 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X146.496 Y144.25 E.00324
G3 X143.786 Y142.012 I-2.486 J.25 E.36268
G3 X144.678 Y142.093 I.228 J2.428 E.02768
G3 X146.458 Y144.003 I-.669 J2.408 E.08441
G1 X146.467 Y144.088 E.0026
; WIPE_START
M204 S6000
G1 X146.496 Y144.25 E-.06282
G1 X146.501 Y144.5 E-.09489
G1 X146.489 Y144.749 E-.09473
G1 X146.452 Y144.995 E-.0947
G1 X146.39 Y145.237 E-.09467
G1 X146.305 Y145.471 E-.09477
G1 X146.197 Y145.696 E-.09472
G1 X146.067 Y145.908 E-.09469
G1 X146.013 Y145.98 E-.034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.717 Y138.842 Z1.4 F42000
G1 X148.896 Y138.369 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X148.919 Y138.322 E.00174
G3 X151.914 Y136.492 I3.082 J1.678 E.1219
G1 X152.088 Y136.492 E.0058
G3 X148.768 Y138.637 I-.087 J3.508 E.59203
G1 X148.87 Y138.423 E.00787
M204 S10000
G1 X149.263 Y138.545 F42000
G1 F5400
M204 S6000
G1 X149.277 Y138.516 E.00106
G3 X151.924 Y136.899 I2.724 J1.483 E.10776
G1 X152.078 Y136.899 E.00513
G3 X149.143 Y138.795 I-.077 J3.101 E.52334
G1 X149.237 Y138.599 E.0072
M204 S250
G1 X149.616 Y138.715 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.621 Y138.704 E.00038
G3 X151.934 Y137.291 I2.38 J1.295 E.0872
G1 X152.069 Y137.291 E.00415
G3 X149.504 Y138.947 I-.068 J2.709 E.42348
G1 X149.59 Y138.769 E.00607
; WIPE_START
M204 S6000
G1 X149.621 Y138.704 E-.02748
G1 X149.762 Y138.473 E-.10271
G1 X150.075 Y138.094 E-.18703
G1 X150.419 Y137.8 E-.17197
G1 X150.646 Y137.653 E-.10263
G1 X150.887 Y137.53 E-.10269
G1 X151.047 Y137.467 E-.0655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.49 Y129.995 Z1.4 F42000
G1 X144.982 Y108.352 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.207 Y108.428 E.00787
G3 X143.727 Y108.215 I-1.197 J3.073 E.63724
G3 X144.894 Y108.325 I.272 J3.362 E.03911
G1 X144.925 Y108.334 E.00106
M204 S10000
G1 X144.852 Y108.738 F42000
G1 F5400
M204 S6000
G1 X145.058 Y108.806 E.00719
G3 X143.757 Y108.621 I-1.048 J2.695 E.5586
G3 X144.785 Y108.715 I.26 J2.808 E.03442
G1 X144.796 Y108.719 E.00039
M204 S250
G1 X144.728 Y109.11 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X144.915 Y109.172 E.00606
G3 X143.786 Y109.012 I-.906 J2.329 E.44711
G3 X144.671 Y109.091 I.228 J2.428 E.02743
; WIPE_START
M204 S6000
G1 X144.915 Y109.172 E-.09777
G1 X145.142 Y109.275 E-.09468
G1 X145.358 Y109.4 E-.09477
G1 X145.56 Y109.545 E-.0947
G1 X145.747 Y109.71 E-.09471
G1 X145.916 Y109.893 E-.09472
G1 X146.067 Y110.092 E-.09474
G1 X146.196 Y110.302 E-.09392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.564 Y110.2 Z1.4 F42000
G1 X101.241 Y109.696 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.378 Y109.513 E.00757
G3 X103.783 Y108.211 I2.632 J1.988 E.09354
G3 X105.207 Y108.428 I.215 J3.37 E.04816
G3 X101.194 Y109.785 I-1.197 J3.074 E.53487
G1 X101.213 Y109.749 E.00134
M204 S10000
G1 X101.578 Y109.925 F42000
G1 F5400
M204 S6000
G1 X101.702 Y109.759 E.0069
G3 X103.813 Y108.617 I2.307 J1.742 E.0821
G3 X105.058 Y108.807 I.185 J2.955 E.04209
G3 X101.541 Y109.997 I-1.049 J2.693 E.46865
G1 X101.55 Y109.979 E.00067
M204 S250
G1 X101.902 Y110.146 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X102.015 Y109.996 E.00579
G3 X103.843 Y109.008 I1.995 J1.505 E.06583
G3 X104.678 Y109.093 I.175 J2.423 E.02594
G3 X101.876 Y110.201 I-.668 J2.408 E.38302
G1 X101.876 Y110.201 E.00002
; WIPE_START
M204 S6000
G1 X102.015 Y109.996 E-.09408
G1 X102.168 Y109.799 E-.09464
G1 X102.347 Y109.625 E-.09469
G1 X102.542 Y109.47 E-.09473
G1 X102.751 Y109.335 E-.09471
G1 X102.973 Y109.221 E-.0947
G1 X103.205 Y109.13 E-.0947
G1 X103.445 Y109.062 E-.09474
G1 X103.453 Y109.061 E-.00301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.901 Y116.681 Z1.4 F42000
G1 X105.361 Y141.497 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.507 Y141.562 E.00531
G3 X103.727 Y141.215 I-1.497 J2.938 E.62632
G3 X105.207 Y141.428 I.272 J3.362 E.05002
G1 X105.306 Y141.472 E.00361
M204 S10000
G1 X105.193 Y141.868 F42000
G1 F5400
M204 S6000
G1 X105.322 Y141.924 E.00464
G3 X103.757 Y141.621 I-1.311 J2.577 E.54903
G3 X104.785 Y141.715 I.26 J2.808 E.03442
G3 X105.058 Y141.806 I-.774 J2.786 E.00957
G1 X105.139 Y141.843 E.00294
M204 S250
G1 X105.032 Y142.226 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.142 Y142.274 E.0037
G3 X103.786 Y142.012 I-1.133 J2.227 E.43944
G3 X104.678 Y142.093 I.228 J2.428 E.02768
G3 X104.915 Y142.172 I-.669 J2.408 E.00767
G1 X104.978 Y142.201 E.00212
; WIPE_START
M204 S6000
G1 X105.142 Y142.274 E-.06851
G1 X105.358 Y142.4 E-.09481
G1 X105.56 Y142.545 E-.0947
G1 X105.747 Y142.71 E-.09471
G1 X105.916 Y142.893 E-.09472
G1 X106.067 Y143.092 E-.09473
G1 X106.197 Y143.304 E-.09469
G1 X106.305 Y143.529 E-.09475
M73 P40 R18
G1 X106.331 Y143.599 E-.02838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.785 Y141.962 Z1.4 F42000
G1 X149.992 Y134.009 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.301 J5.983 E.61469
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.196 J-3.738 E.04474
G3 X143.989 Y150.991 I-5.565 J-2.298 E.23524
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I-.008 J-5.996 E.31294
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I5.996 J-.008 E.31294
G1 X144.095 Y105.012 E1.32957
G3 X149.992 Y111.013 I-.11 J6.005 E.30919
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.321 J6.39 E.65627
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.438 J-2.016 E.08813
G3 X143.994 Y151.398 I-5.157 J-3.803 E.1989
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I-.003 J-6.403 E.33382
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.403 J-.003 E.33382
G1 X144.105 Y104.605 E1.33007
G3 X150.399 Y111.008 I-.12 J6.413 E.32989
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.685 J6.756 E.63422
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.812 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.002 J-6.795 E.32784
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.795 J.002 E.32784
M73 P41 R18
G1 X144.115 Y104.213 E1.23249
G3 X150.791 Y111.003 I-.116 J6.791 E.32424
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
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


G1 X150.531 Y134.173 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X152.56 Y136.202 E.08857
G3 X153.271 Y136.377 I-.598 J3.947 E.02266
G1 X151.236 Y134.342 E.08884
G1 X151.772 Y134.342 E.01654
G1 X157.647 Y140.218 E.25649
G2 X157.648 Y139.683 I-3.57 J-.271 E.01654
G1 X152.324 Y134.359 E.23238
G3 X152.927 Y134.426 I-.029 J3.026 E.01873
G1 X157.575 Y139.074 E.20291
G2 X157.417 Y138.381 I-4.192 J.588 E.02197
G1 X153.618 Y134.582 E.16585
G3 X154.496 Y134.924 I-1.157 J4.266 E.02913
G1 X157.41 Y137.838 E.12722
M204 S10000
G1 X157.758 Y140.864 F42000
G1 F9503.695
M204 S6000
G1 X155.623 Y138.73 E.09318
G3 X155.798 Y139.441 I-3.657 J1.277 E.02263
G1 X157.531 Y141.173 E.07564
G3 X157.421 Y141.598 I-2.177 J-.34 E.01358
G1 X155.843 Y140.021 E.06886
G3 X155.805 Y140.518 I-2.502 J.056 E.01542
G1 X157.286 Y141.999 E.06466
G3 X157.13 Y142.379 I-1.976 J-.587 E.0127
G1 X155.716 Y140.965 E.06173
G3 X155.587 Y141.371 I-2.094 J-.444 E.01318
G1 X156.949 Y142.734 E.05946
G3 X156.746 Y143.067 I-1.765 J-.845 E.01206
G1 X155.422 Y141.743 E.0578
G3 X155.227 Y142.083 I-1.791 J-.803 E.01213
G1 X156.529 Y143.386 E.05687
G3 X156.29 Y143.682 I-2.309 J-1.625 E.01177
G1 X155.002 Y142.394 E.0562
G3 X154.753 Y142.681 I-1.646 J-1.183 E.01174
G1 X156.036 Y143.964 E.05603
G3 X155.759 Y144.222 I-1.863 J-1.726 E.01171
G1 X154.474 Y142.937 E.05609
G3 X154.17 Y143.169 I-1.303 J-1.397 E.01182
G1 X155.468 Y144.467 E.05666
G3 X155.154 Y144.689 I-1.265 J-1.456 E.01188
G1 X153.837 Y143.372 E.05747
G3 X153.475 Y143.545 I-1.045 J-1.724 E.01242
G1 X154.828 Y144.898 E.05907
G3 X154.474 Y145.08 I-1.39 J-2.271 E.01229
G1 X153.078 Y143.684 E.06093
G3 X152.643 Y143.784 I-.718 J-2.125 E.01382
G1 X154.105 Y145.247 E.06383
G1 X153.712 Y145.39 E.0129
G1 X152.16 Y143.837 E.06777
G3 X151.605 Y143.819 I-.126 J-4.56 E.01712
G1 X153.289 Y145.502 E.07349
G3 X152.845 Y145.594 I-1.262 J-5.007 E.01401
G1 X150.676 Y143.425 E.09467
M204 S10000
G1 X150.932 Y145.824 F42000
G1 F9503.695
M204 S6000
G1 X132.843 Y127.735 E.78963
G1 X132.843 Y128.271 E.01654
G1 X150.229 Y145.657 E.75894
G1 X149.737 Y145.658 E.0152
G1 X149.726 Y145.69 E.00101
G1 X147.477 Y143.44 E.09821
G3 X147.613 Y144.112 I-3.292 J1.019 E.02121
G1 X149.591 Y146.09 E.08635
G1 X149.456 Y146.491 E.01305
G1 X147.627 Y144.662 E.07984
G3 X147.574 Y145.145 I-2.443 J-.022 E.01502
G1 X149.321 Y146.891 E.07624
G3 X149.173 Y147.279 I-1.791 J-.463 E.01283
G1 X147.471 Y145.577 E.07427
G3 X147.324 Y145.966 I-2.008 J-.541 E.01284
G1 X149.002 Y147.644 E.07326
G3 X148.806 Y147.983 I-6.748 J-3.673 E.0121
G1 X147.142 Y146.32 E.07261
G3 X146.931 Y146.644 I-1.724 J-.898 E.01196
G1 X148.587 Y148.301 E.07232
G3 X148.358 Y148.607 I-2.173 J-1.386 E.01182
G1 X146.69 Y146.939 E.07283
G3 X146.421 Y147.205 I-1.467 J-1.21 E.01171
G1 X148.103 Y148.888 E.07344
G1 X147.836 Y149.156 E.01169
G1 X146.124 Y147.444 E.07475
G3 X145.798 Y147.654 I-1.21 J-1.524 E.01199
G1 X147.545 Y149.401 E.07627
G3 X147.243 Y149.634 I-1.729 J-1.927 E.0118
G1 X145.441 Y147.832 E.07866
G3 X145.049 Y147.977 I-.918 J-1.885 E.0129
G1 X146.914 Y149.841 E.08139
G3 X146.571 Y150.034 I-1.148 J-1.639 E.01216
G1 X144.618 Y148.081 E.08528
G3 X144.129 Y148.128 I-.479 J-2.421 E.01518
G1 X146.208 Y150.207 E.09077
G3 X145.817 Y150.351 I-.926 J-1.904 E.01289
G1 X143.573 Y148.108 E.09794
G3 X142.887 Y147.957 I.658 J-4.636 E.02171
G1 X145.408 Y150.479 E.11008
G3 X144.963 Y150.569 I-.834 J-2.956 E.01403
G1 X129.236 Y134.842 E.68653
G1 X128.701 Y134.842 E.01654
G1 X144.491 Y150.633 E.68929
G1 X143.98 Y150.658 E.01578
G1 X106.946 Y113.623 E1.61666
G2 X107.156 Y113.298 I-1.524 J-1.214 E.01198
G1 X128.159 Y134.3 E.91683
G1 X128.159 Y133.765 E.01654
G1 X107.335 Y112.941 E.909
G2 X107.479 Y112.549 I-7.409 J-2.94 E.01289
G1 X128.159 Y133.229 E.90272
G1 X128.159 Y132.693 E.01654
G1 X107.579 Y112.114 E.89836
G2 X107.629 Y111.628 I-2.409 J-.492 E.01511
G1 X128.159 Y132.158 E.89619
G1 X128.159 Y131.622 E.01654
G1 X107.607 Y111.07 E.89715
G2 X107.458 Y110.385 I-4.236 J.563 E.02165
G1 X128.159 Y131.086 E.90366
G1 X128.159 Y130.55 E.01654
G1 X103.039 Y105.431 E1.09656
G3 X103.514 Y105.371 I.543 J2.384 E.01482
G1 X128.159 Y130.015 E1.0758
G1 X128.159 Y129.479 E.01654
G1 X104.03 Y105.35 E1.05331
G1 X104.565 Y105.35 E.01653
G1 X128.159 Y128.943 E1.02993
G1 X128.159 Y128.408 E.01654
G1 X105.101 Y105.35 E1.00655
G1 X105.636 Y105.35 E.01653
G1 X128.159 Y127.872 E.98316
G1 X128.159 Y127.336 E.01654
G1 X106.172 Y105.35 E.95978
G1 X106.708 Y105.35 E.01653
G1 X128.516 Y127.158 E.95199
G1 X129.052 Y127.158 E.01654
G1 X107.243 Y105.349 E.95199
G1 X107.779 Y105.349 E.01653
G1 X129.587 Y127.158 E.95199
G1 X130.123 Y127.158 E.01654
G1 X108.315 Y105.349 E.952
G1 X108.85 Y105.349 E.01653
G1 X130.659 Y127.158 E.952
G1 X131.194 Y127.158 E.01654
G1 X109.386 Y105.349 E.952
G1 X109.922 Y105.349 E.01653
G1 X131.73 Y127.158 E.95201
G1 X132.266 Y127.158 E.01654
G1 X110.457 Y105.349 E.95201
G1 X110.993 Y105.349 E.01653
G1 X151.297 Y145.653 E1.7594
G1 X151.831 Y145.651 E.01648
G1 X111.529 Y105.349 E1.75933
G1 X112.064 Y105.349 E.01653
G1 X152.513 Y145.797 E1.7657
; WIPE_START
G1 X151.098 Y144.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.549 Y145.508 Z1.4 F42000
G1 X140.842 Y145.912 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X129.772 Y134.842 E.48321
G1 X130.308 Y134.842 E.01654
G1 X140.397 Y144.931 E.4404
G3 X140.372 Y144.37 I2.788 J-.405 E.01735
G1 X130.844 Y134.842 E.41593
G1 X131.379 Y134.842 E.01654
G1 X140.422 Y143.885 E.39476
G3 X140.526 Y143.453 I2.21 J.3 E.01374
G1 X131.915 Y134.842 E.37589
G1 X132.451 Y134.842 E.01654
G1 X140.669 Y143.061 E.35875
G3 X140.847 Y142.703 I1.875 J.709 E.01235
G1 X132.843 Y134.7 E.34937
G1 X132.843 Y134.164 E.01654
G1 X141.056 Y142.376 E.35851
G3 X141.294 Y142.079 I1.606 J1.043 E.01178
G1 X132.843 Y133.628 E.36891
G1 X132.843 Y133.092 E.01654
G1 X141.561 Y141.81 E.38055
G3 X141.855 Y141.569 I1.352 J1.351 E.01177
G1 X132.843 Y132.557 E.3934
G1 X132.843 Y132.021 E.01654
G1 X142.179 Y141.356 E.40751
M73 P42 R18
G3 X142.535 Y141.176 I5.283 J10.017 E.01231
G1 X132.843 Y131.485 E.42305
G1 X132.843 Y130.95 E.01654
G1 X142.926 Y141.032 E.44013
G3 X143.361 Y140.932 I.605 J1.629 E.01383
G1 X132.843 Y130.414 E.45914
G1 X132.843 Y129.878 E.01654
G1 X143.838 Y140.872 E.47994
G3 X144.392 Y140.891 I.142 J4.052 E.01713
G1 X132.843 Y129.342 E.50413
G1 X132.843 Y128.807 E.01654
G1 X145.349 Y141.313 E.54591
M204 S10000
G1 X148.581 Y141.33 F42000
G1 F9503.695
M204 S6000
G1 X112.6 Y105.349 E1.5707
G1 X113.135 Y105.349 E.01653
G1 X148.178 Y140.392 E1.52973
G3 X148.166 Y139.843 I5.538 J-.402 E.01694
G1 X113.671 Y105.349 E1.5058
G1 X114.207 Y105.349 E.01653
G1 X148.216 Y139.358 E1.48462
G3 X148.315 Y138.921 I2.233 J.276 E.01385
G1 X114.742 Y105.349 E1.46555
G1 X115.278 Y105.349 E.01653
G1 X148.454 Y138.524 E1.44822
G3 X148.626 Y138.162 I1.9 J.683 E.0124
G1 X115.814 Y105.348 E1.43239
G1 X116.349 Y105.348 E.01653
G1 X148.83 Y137.829 E1.41789
G1 X149.061 Y137.525 E.0118
G1 X116.885 Y105.348 E1.4046
G1 X117.421 Y105.348 E.01653
G1 X149.321 Y137.249 E1.39255
G3 X149.607 Y136.999 I1.569 J1.514 E.01174
G1 X117.956 Y105.348 E1.38168
G1 X118.492 Y105.348 E.01653
G1 X149.919 Y136.775 E1.3719
G3 X150.259 Y136.58 I1.146 J1.598 E.01213
G1 X119.027 Y105.348 E1.36336
G1 X119.563 Y105.348 E.01653
G1 X150.63 Y136.415 E1.35616
G3 X151.035 Y136.284 I.854 J1.959 E.01316
G1 X120.099 Y105.348 E1.35047
G1 X120.634 Y105.348 E.01653
G1 X151.481 Y136.194 E1.34654
G3 X151.982 Y136.16 I.614 J5.309 E.01552
G1 X150.165 Y134.342 E.07934
G1 X149.659 Y134.342 E.01562
G1 X149.659 Y133.836 E.01562
G1 X121.17 Y105.348 E1.24362
G1 X121.706 Y105.348 E.01653
G1 X149.659 Y133.301 E1.22024
G1 X149.659 Y132.765 E.01654
G1 X122.241 Y105.348 E1.19686
G1 X122.777 Y105.348 E.01653
G1 X149.659 Y132.229 E1.17347
G1 X149.659 Y131.694 E.01654
G1 X123.313 Y105.348 E1.15009
G1 X123.848 Y105.347 E.01653
G1 X149.659 Y131.158 E1.12671
G1 X149.659 Y130.622 E.01654
G1 X124.384 Y105.347 E1.10333
G1 X124.919 Y105.347 E.01653
G1 X149.659 Y130.087 E1.07994
G1 X149.659 Y129.551 E.01654
G1 X125.455 Y105.347 E1.05656
G1 X125.991 Y105.347 E.01653
G1 X149.659 Y129.015 E1.03318
G1 X149.659 Y128.479 E.01654
G1 X126.526 Y105.347 E1.0098
G1 X127.062 Y105.347 E.01653
G1 X149.659 Y127.944 E.98641
G1 X149.659 Y127.408 E.01654
G1 X127.598 Y105.347 E.96303
G1 X128.133 Y105.347 E.01653
G1 X149.659 Y126.872 E.93965
G1 X149.659 Y126.337 E.01654
G1 X128.669 Y105.347 E.91627
G1 X129.205 Y105.347 E.01653
G1 X149.659 Y125.801 E.89288
G1 X149.659 Y125.265 E.01654
G1 X129.74 Y105.347 E.8695
G1 X130.276 Y105.347 E.01653
G1 X149.659 Y124.73 E.84612
G1 X149.659 Y124.194 E.01654
G1 X130.812 Y105.347 E.82274
G1 X131.347 Y105.347 E.01653
G1 X149.659 Y123.658 E.79936
G1 X149.659 Y123.122 E.01654
G1 X131.883 Y105.346 E.77597
G1 X132.418 Y105.346 E.01653
G1 X149.828 Y122.756 E.76
M204 S10000
G1 X149.828 Y112.578 F42000
G1 F9503.695
M204 S6000
G1 X147.356 Y110.106 E.10792
G3 X147.575 Y110.861 I-3.791 J1.51 E.0243
G1 X149.659 Y112.944 E.09095
G1 X149.659 Y113.48 E.01654
G1 X147.633 Y111.454 E.08843
G3 X147.602 Y111.959 I-4.579 J-.022 E.01563
G1 X149.659 Y114.015 E.08976
G1 X149.659 Y114.551 E.01654
G1 X147.515 Y112.408 E.09356
G3 X147.385 Y112.814 I-2.097 J-.447 E.01317
G1 X149.659 Y115.087 E.09923
G1 X149.659 Y115.623 E.01654
G1 X147.219 Y113.183 E.1065
G3 X147.02 Y113.52 I-1.782 J-.824 E.0121
G1 X149.659 Y116.158 E.11517
G1 X149.659 Y116.694 E.01654
G1 X146.792 Y113.827 E.12515
G3 X146.534 Y114.105 I-16.212 J-14.738 E.0117
G1 X149.659 Y117.23 E.13639
G1 X149.659 Y117.765 E.01654
G1 X146.248 Y114.355 E.14888
G3 X145.933 Y114.576 I-1.26 J-1.462 E.01189
G1 X149.659 Y118.301 E.16263
G1 X149.659 Y118.837 E.01654
G1 X145.588 Y114.766 E.1777
G3 X145.209 Y114.923 I-.974 J-1.813 E.01267
G1 X149.659 Y119.372 E.19423
G1 X149.659 Y119.908 E.01654
G1 X144.793 Y115.042 E.21242
G3 X144.331 Y115.117 I-.602 J-2.269 E.01445
G1 X149.659 Y120.444 E.23255
G1 X149.659 Y120.98 E.01654
G1 X143.804 Y115.125 E.25557
G3 X143.184 Y115.041 I.359 J-4.956 E.01933
G1 X149.659 Y121.515 E.28264
G1 X149.659 Y122.051 E.01654
G1 X142.329 Y114.722 E.31994
G3 X140.778 Y113.17 I1.677 J-3.228 E.06881
G1 X132.954 Y105.346 E.34153
G1 X133.49 Y105.346 E.01653
G1 X140.464 Y112.321 E.30445
G3 X140.373 Y111.694 I3.088 J-.769 E.01959
G1 X134.025 Y105.346 E.27709
G1 X134.561 Y105.346 E.01653
G1 X140.386 Y111.171 E.25429
G3 X140.458 Y110.708 I2.353 J.128 E.01451
G1 X135.097 Y105.346 E.23405
G1 X135.632 Y105.346 E.01653
G1 X140.576 Y110.29 E.21581
G3 X140.733 Y109.911 I8.42 J3.277 E.01265
G1 X136.168 Y105.346 E.1993
G1 X136.704 Y105.346 E.01653
G1 X140.926 Y109.568 E.1843
G3 X141.148 Y109.254 I1.681 J.954 E.01188
G1 X137.239 Y105.346 E.17061
G1 X137.775 Y105.346 E.01653
G1 X141.398 Y108.969 E.15816
G3 X141.676 Y108.712 I1.427 J1.265 E.01172
G1 X138.31 Y105.346 E.14693
G1 X138.846 Y105.346 E.01653
G1 X141.983 Y108.483 E.13694
G3 X142.32 Y108.283 I1.165 J1.583 E.01209
G1 X139.382 Y105.346 E.12824
G1 X139.917 Y105.346 E.01653
G1 X142.688 Y108.116 E.12095
G3 X143.093 Y107.985 I.857 J1.956 E.01315
G1 X140.453 Y105.345 E.11523
G1 X140.989 Y105.345 E.01653
G1 X143.548 Y107.904 E.11171
G3 X144.049 Y107.87 I.428 J2.605 E.01555
G1 X141.524 Y105.345 E.11023
G1 X142.06 Y105.345 E.01653
G1 X144.637 Y107.922 E.11249
G3 X145.399 Y108.149 I-.796 J4.072 E.02459
G1 X142.596 Y105.345 E.12239
G1 X143.131 Y105.345 E.01653
G1 X149.659 Y111.873 E.28495
G1 X149.659 Y111.337 E.01654
G1 X143.667 Y105.345 E.26156
G3 X144.209 Y105.352 I.21 J5.03 E.01675
G1 X149.653 Y110.796 E.23765
G2 X149.6 Y110.207 I-4.021 J.065 E.01826
G1 X144.8 Y105.407 E.20956
G3 X145.47 Y105.541 I-.472 J4.086 E.02113
G1 X149.464 Y109.535 E.17433
G2 X149.165 Y108.7 I-5.823 J1.614 E.02739
G1 X146.302 Y105.838 E.12497
G3 X147.803 Y106.811 I-2.193 J5.026 E.05548
G3 X148.988 Y107.987 I-23.373 J24.721 E.05153
M204 S10000
G1 X105.415 Y108.342 F42000
G1 F9503.695
M204 S6000
G1 X102.595 Y105.522 E.12309
G1 X102.184 Y105.647 E.01326
G1 X104.433 Y107.896 E.09819
G2 X103.878 Y107.877 I-.351 J2.129 E.01718
G1 X101.795 Y105.793 E.09096
G1 X101.431 Y105.965 E.01242
G1 X103.388 Y107.923 E.08543
G2 X102.954 Y108.024 I.291 J2.22 E.01378
G1 X101.088 Y106.159 E.08144
G2 X100.762 Y106.368 I.9 J1.762 E.01199
G1 X102.56 Y108.166 E.07851
G2 X102.202 Y108.344 I.705 J1.876 E.01236
G1 X100.454 Y106.596 E.07629
G2 X100.17 Y106.847 I1.131 J1.569 E.01173
G1 X101.875 Y108.553 E.07446
G2 X101.579 Y108.792 I1.047 J1.598 E.01178
G1 X99.899 Y107.112 E.07333
G1 X99.645 Y107.393 E.01171
G1 X101.311 Y109.06 E.07274
G2 X101.071 Y109.355 I1.356 J1.348 E.01177
G1 X99.415 Y107.699 E.07228
G2 X99.2 Y108.02 I1.522 J1.251 E.01194
G1 X100.86 Y109.68 E.07245
G2 X100.68 Y110.035 I1.687 J1.077 E.01233
G1 X99.001 Y108.357 E.07327
G1 X98.829 Y108.721 E.01242
G1 X100.534 Y110.426 E.07444
G2 X100.428 Y110.856 I2.094 J.743 E.01369
G1 X98.678 Y109.105 E.0764
G2 X98.549 Y109.512 I2.001 J.858 E.01319
G1 X100.372 Y111.335 E.07955
G2 X100.393 Y111.891 I2.793 J.173 E.01723
G1 X98.446 Y109.944 E.08498
G1 X98.377 Y110.411 E.01456
G1 X100.815 Y112.85 E.10646
; WIPE_START
G1 X99.401 Y111.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.134 Y117.423 Z1.4 F42000
G1 X124.001 Y142.556 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108583
G1 F15000
M204 S6000
G3 X124.051 Y142.417 I.145 J-.025 E.00083
; WIPE_START
G1 X124.002 Y142.5 E-.48228
G1 X124.001 Y142.556 E-.27772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.32 Y141.318 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X115.844 Y134.842 E.28269
G1 X116.38 Y134.842 E.01654
G1 X122.644 Y141.107 E.27345
G3 X123.275 Y141.202 I.085 J1.57 E.01986
G1 X116.915 Y134.842 E.27764
G1 X117.451 Y134.842 E.01654
G1 X124.129 Y141.52 E.29151
G3 X124.456 Y141.312 I.679 J.707 E.01206
G1 X117.987 Y134.842 E.28243
G1 X118.522 Y134.842 E.01654
G1 X124.849 Y141.169 E.27617
G3 X125.328 Y141.113 I.378 J1.159 E.01501
G1 X119.058 Y134.842 E.27372
G1 X119.594 Y134.842 E.01654
G1 X135.407 Y150.656 E.69031
G1 X135.943 Y150.656 E.01654
G1 X119.843 Y134.556 E.7028
G1 X119.843 Y134.021 E.01654
G1 X136.479 Y150.656 E.72619
G1 X137.015 Y150.656 E.01654
G1 X119.843 Y133.485 E.74958
G1 X119.843 Y132.949 E.01654
G1 X137.551 Y150.656 E.77297
G1 X138.086 Y150.657 E.01654
G1 X119.843 Y132.414 E.79636
G1 X119.843 Y131.878 E.01654
G1 X138.622 Y150.657 E.81975
G1 X139.158 Y150.657 E.01654
G1 X119.843 Y131.342 E.84314
G1 X119.843 Y130.806 E.01654
G1 X139.694 Y150.657 E.86653
G1 X140.23 Y150.657 E.01654
G1 X119.843 Y130.271 E.88992
G1 X119.843 Y129.735 E.01654
G1 X140.765 Y150.657 E.91331
G1 X141.301 Y150.657 E.01654
G1 X119.843 Y129.199 E.9367
G1 X119.843 Y128.664 E.01654
G1 X141.837 Y150.657 E.96009
M73 P43 R18
G1 X142.373 Y150.657 E.01654
G1 X119.843 Y128.128 E.98348
G1 X119.843 Y127.592 E.01654
G1 X143.078 Y150.827 E1.01427
M204 S10000
G1 X143.614 Y150.827 F42000
G1 F9503.695
M204 S6000
G1 X106.707 Y113.92 E1.61112
G3 X106.44 Y114.189 I-1.474 J-1.199 E.01171
G1 X119.409 Y127.158 E.56614
G1 X118.873 Y127.158 E.01654
G1 X106.145 Y114.429 E.55564
G3 X105.82 Y114.641 I-1.219 J-1.514 E.01197
G1 X118.337 Y127.158 E.5464
G1 X117.802 Y127.158 E.01654
G1 X105.465 Y114.821 E.53852
G3 X105.076 Y114.968 I-.927 J-1.873 E.01286
G1 X117.266 Y127.158 E.53213
G1 X116.73 Y127.158 E.01654
G1 X104.648 Y115.075 E.52743
G3 X104.164 Y115.127 I-.804 J-5.268 E.01504
G1 X116.195 Y127.158 E.52519
G1 X115.659 Y127.158 E.01654
G1 X103.612 Y115.111 E.52589
G3 X102.937 Y114.971 I.483 J-4.037 E.02131
G1 X115.159 Y127.193 E.53353
G1 X115.159 Y127.729 E.01654
G1 X98.348 Y110.919 E.73382
G2 X98.344 Y111.449 I5.438 J.315 E.01639
G1 X115.159 Y128.264 E.73403
G1 X115.159 Y128.8 E.01654
G1 X98.344 Y111.985 E.73403
G1 X98.344 Y112.521 E.01654
G1 X115.159 Y129.336 E.73402
G1 X115.159 Y129.872 E.01654
G1 X98.344 Y113.057 E.73402
G1 X98.344 Y113.593 E.01654
G1 X115.159 Y130.407 E.73401
G1 X115.159 Y130.943 E.01654
G1 X98.344 Y114.129 E.73401
G1 X98.344 Y114.664 E.01654
G1 X115.159 Y131.479 E.734
G1 X115.159 Y132.014 E.01654
G1 X98.344 Y115.2 E.734
G1 X98.345 Y115.736 E.01654
G1 X115.159 Y132.55 E.73399
G1 X115.159 Y133.086 E.01654
G1 X98.345 Y116.272 E.73399
G1 X98.345 Y116.808 E.01654
G1 X115.159 Y133.622 E.73398
G1 X115.159 Y134.157 E.01654
G1 X98.345 Y117.343 E.73398
G1 X98.345 Y117.879 E.01654
G1 X121.805 Y141.34 E1.02411
G2 X121.487 Y141.557 I.377 J.896 E.01198
G1 X98.345 Y118.415 E1.0102
G1 X98.345 Y118.951 E.01654
G1 X121.223 Y141.828 E.99867
G2 X121.014 Y142.156 I.706 J.679 E.01206
G1 X98.345 Y119.487 E.98958
G1 X98.345 Y120.023 E.01654
G1 X120.871 Y142.548 E.98329
G2 X120.808 Y143.02 I1.87 J.489 E.01476
G1 X98.346 Y120.558 E.98054
G1 X98.346 Y121.094 E.01654
G1 X127.906 Y150.655 E1.2904
G1 X128.442 Y150.655 E.01654
G1 X122.674 Y144.887 E.25177
G2 X123.154 Y144.831 I.101 J-1.213 E.015
G1 X128.978 Y150.655 E.25423
G1 X129.514 Y150.655 E.01654
G1 X123.548 Y144.689 E.26043
G2 X123.877 Y144.482 I-.522 J-1.196 E.01204
G1 X130.049 Y150.655 E.26946
G1 X130.585 Y150.655 E.01654
G1 X124.728 Y144.798 E.25569
G2 X125.359 Y144.893 I.545 J-1.47 E.01985
G1 X131.121 Y150.655 E.25152
G1 X131.657 Y150.655 E.01654
G1 X125.817 Y144.816 E.2549
G2 X126.197 Y144.66 I-.196 J-1.018 E.01276
G1 X132.193 Y150.655 E.26171
G1 X132.728 Y150.656 E.01654
G1 X126.516 Y144.443 E.27119
G2 X126.78 Y144.171 I-.54 J-.788 E.01177
G1 X133.264 Y150.656 E.28306
G1 X133.8 Y150.656 E.01654
G1 X126.988 Y143.844 E.29736
G2 X127.137 Y143.457 I-1.058 J-.629 E.01285
G1 X134.336 Y150.656 E.31425
G1 X134.872 Y150.656 E.01654
G1 X127.011 Y142.795 E.34316
M204 S10000
G1 X127.54 Y150.824 F42000
G1 F9503.695
M204 S6000
G1 X98.346 Y121.63 E1.27442
G1 X98.346 Y122.166 E.01654
G1 X126.835 Y150.654 E1.24361
G1 X126.299 Y150.654 E.01654
G1 X98.346 Y122.702 E1.22022
G1 X98.346 Y123.237 E.01654
G1 X125.763 Y150.654 E1.19683
G1 X125.227 Y150.654 E.01654
G1 X98.346 Y123.773 E1.17343
G1 X98.346 Y124.309 E.01654
G1 X124.691 Y150.654 E1.15004
G1 X124.155 Y150.654 E.01654
G1 X98.347 Y124.845 E1.12664
G1 X98.347 Y125.381 E.01654
G1 X123.62 Y150.654 E1.10325
G1 X123.084 Y150.654 E.01654
G1 X98.347 Y125.917 E1.07985
G1 X98.347 Y126.452 E.01654
G1 X122.548 Y150.654 E1.05646
G1 X122.012 Y150.653 E.01654
G1 X98.347 Y126.988 E1.03306
G1 X98.347 Y127.524 E.01654
G1 X121.476 Y150.653 E1.00967
G1 X120.941 Y150.653 E.01654
G1 X98.347 Y128.06 E.98627
G1 X98.347 Y128.596 E.01654
G1 X120.405 Y150.653 E.96288
G1 X119.869 Y150.653 E.01654
G1 X98.347 Y129.132 E.93948
G1 X98.348 Y129.667 E.01654
G1 X119.333 Y150.653 E.91609
G1 X118.797 Y150.653 E.01654
G1 X98.348 Y130.203 E.89269
G1 X98.348 Y130.739 E.01654
G1 X118.262 Y150.653 E.8693
G1 X117.726 Y150.653 E.01654
G1 X98.348 Y131.275 E.84591
G1 X98.348 Y131.811 E.01654
G1 X117.19 Y150.653 E.82251
G1 X116.654 Y150.653 E.01654
G1 X98.348 Y132.346 E.79912
G1 X98.348 Y132.882 E.01654
G1 X116.118 Y150.652 E.77572
G1 X115.583 Y150.652 E.01654
G1 X98.348 Y133.418 E.75233
G1 X98.349 Y133.954 E.01654
G1 X105.663 Y141.269 E.31931
G2 X104.824 Y140.965 I-1.42 J2.613 E.02766
G1 X98.349 Y134.49 E.28266
G1 X98.349 Y135.026 E.01654
G1 X104.197 Y140.874 E.25531
G2 X103.674 Y140.886 I-.19 J3.219 E.01619
G1 X98.349 Y135.561 E.23244
G1 X98.349 Y136.097 E.01654
G1 X103.206 Y140.954 E.21203
G2 X102.792 Y141.076 I1.867 J7.157 E.01333
G1 X98.349 Y136.633 E.19393
G1 X98.349 Y137.169 E.01654
G1 X102.415 Y141.234 E.17748
G2 X102.071 Y141.426 I.787 J1.818 E.01218
G1 X98.349 Y137.705 E.16245
G1 X98.349 Y138.24 E.01654
G1 X101.757 Y141.648 E.14873
G2 X101.471 Y141.898 I1.107 J1.552 E.01174
G1 X98.35 Y138.776 E.13626
G1 X98.35 Y139.312 E.01654
G1 X101.213 Y142.176 E.12501
G2 X100.984 Y142.482 I1.417 J1.299 E.01183
G1 X98.35 Y139.848 E.11499
G1 X98.35 Y140.384 E.01654
G1 X100.784 Y142.818 E.10626
G2 X100.616 Y143.186 I1.751 J1.022 E.0125
G1 X98.35 Y140.92 E.09893
G1 X98.35 Y141.455 E.01654
G1 X100.484 Y143.589 E.09314
G2 X100.399 Y144.04 I5.781 J1.314 E.01418
G1 X98.35 Y141.991 E.08945
G1 X98.35 Y142.527 E.01654
G1 X100.372 Y144.548 E.08823
G2 X100.427 Y145.14 I3.827 J-.063 E.01836
G1 X98.351 Y143.063 E.09066
G1 X98.351 Y143.599 E.01654
G1 X100.653 Y145.901 E.10049
G2 X102.602 Y147.85 I3.353 J-1.404 E.08727
G1 X105.402 Y150.65 E.12225
G1 X104.867 Y150.65 E.01654
G1 X98.351 Y144.135 E.28443
G1 X98.351 Y144.67 E.01654
G1 X104.331 Y150.65 E.26104
G1 X103.795 Y150.65 E.01654
G1 X98.351 Y145.206 E.23764
G2 X98.402 Y145.793 I3.007 J.035 E.0182
G1 X103.208 Y150.599 E.20983
G1 X103.171 Y150.596 E.00117
G3 X102.532 Y150.459 I.375 J-3.309 E.02019
G1 X98.542 Y146.469 E.17417
G2 X98.84 Y147.302 I4.451 J-1.119 E.02734
G1 X101.699 Y150.161 E.12482
G3 X100.011 Y149.009 I2.209 J-5.049 E.06344
G1 X99.032 Y148.03 E.04275
M204 S10000
G1 X106.108 Y150.82 F42000
G1 F9503.695
M204 S6000
G1 X103.36 Y148.073 E.11994
G2 X103.955 Y148.132 I.714 J-4.153 E.01847
G1 X106.474 Y150.651 E.10995
G1 X107.01 Y150.651 E.01654
G1 X104.46 Y148.1 E.11132
G2 X104.91 Y148.015 I-.2 J-2.295 E.01418
G1 X107.546 Y150.651 E.11504
G1 X108.081 Y150.651 E.01654
G1 X105.317 Y147.887 E.12066
G2 X105.685 Y147.719 I-3.921 J-9.077 E.01248
G1 X108.617 Y150.651 E.128
G1 X109.153 Y150.651 E.01654
G1 X106.02 Y147.518 E.13675
G2 X106.326 Y147.289 I-.995 J-1.644 E.01183
G1 X109.689 Y150.651 E.14678
G1 X110.225 Y150.651 E.01654
G1 X106.604 Y147.031 E.15805
G2 X106.854 Y146.745 I-1.304 J-1.391 E.01174
G1 X110.76 Y150.651 E.17053
G1 X111.296 Y150.651 E.01654
G1 X107.075 Y146.43 E.18427
G2 X107.266 Y146.086 I-1.627 J-1.126 E.01219
G1 X111.832 Y150.652 E.19932
G1 X112.368 Y150.652 E.01654
G1 X107.424 Y145.708 E.21581
G2 X107.545 Y145.293 I-2.017 J-.811 E.01336
G1 X112.904 Y150.652 E.23394
G1 X113.439 Y150.652 E.01654
G1 X107.619 Y144.831 E.2541
G2 X107.625 Y144.302 I-2.635 J-.298 E.01636
G1 X113.975 Y150.652 E.27719
G1 X114.511 Y150.652 E.01654
G1 X107.537 Y143.678 E.30443
G2 X107.226 Y142.831 I-3.681 J.872 E.02792
G1 X115.217 Y150.822 E.34881
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9503.695
G1 X113.802 Y149.408 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/53
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S181.05
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.778 J.936 P1  F42000
G1 X131.711 Y134.509 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.492 Y134.509 E.10678
G1 X128.492 Y127.491 E.23281
G1 X132.51 Y127.491 E.13329
G1 X132.51 Y134.509 E.23281
G1 X131.771 Y134.509 E.02452
M204 S10000
G1 X132.103 Y133.71 F42000
G1 F5400
M204 S6000
G1 X132.103 Y134.102 E.01301
G1 X128.899 Y134.102 E.10629
G1 X128.899 Y127.898 E.2058
G1 X132.103 Y127.898 E.10629
G1 X132.103 Y133.65 E.19081
M204 S250
M73 P43 R17
G1 X131.711 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
M73 P44 R17
G1 X129.291 Y133.71 E.07436
G1 X129.291 Y128.29 E.16654
G1 X131.711 Y128.29 E.07436
G1 X131.711 Y133.65 E.1647
; WIPE_START
M204 S6000
G1 X129.712 Y133.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.093 Y134.159 Z1.6 F42000
G1 X116.291 Y134.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X115.492 Y134.509 E.02651
G1 X115.492 Y127.491 E.23281
G1 X119.51 Y127.491 E.13329
G1 X119.51 Y134.509 E.23281
G1 X116.351 Y134.509 E.10479
M204 S10000
G1 X116.291 Y134.102 F42000
G1 F5400
M204 S6000
G1 X115.899 Y134.102 E.01301
G1 X115.899 Y127.898 E.2058
G1 X119.103 Y127.898 E.10629
G1 X119.103 Y134.102 E.2058
G1 X116.351 Y134.102 E.09129
M204 S250
G1 X116.291 Y133.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.291 Y128.29 E.16654
G1 X118.711 Y128.29 E.07436
G1 X118.711 Y133.71 E.16654
G1 X116.351 Y133.71 E.07252
; WIPE_START
M204 S6000
G1 X116.329 Y131.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.758 Y124.099 Z1.6 F42000
G1 X114.772 Y110.971 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X133.23 Y110.971 E.61229
G1 X133.23 Y124.429 E.44643
G1 X114.772 Y124.429 E.61229
G1 X114.772 Y111.031 E.44444
M204 S10000
G1 X115.179 Y111.378 F42000
G1 F5400
M204 S6000
G1 X132.823 Y111.378 E.58528
G1 X132.823 Y124.022 E.41943
G1 X115.179 Y124.022 E.58528
G1 X115.179 Y111.438 E.41744
; WIPE_START
G1 X117.179 Y111.431 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.588 Y110.635 Z1.6 F42000
G1 X101.427 Y109.779 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X101.535 Y109.632 E.00605
G3 X103.629 Y108.423 I2.474 J1.867 E.08242
G1 X103.924 Y108.401 E.00979
G3 X101.361 Y109.887 I.084 J3.098 E.54348
G1 X101.396 Y109.83 E.00221
M204 S10000
G1 X101.763 Y110.008 F42000
G1 F5400
M204 S6000
G1 X101.859 Y109.877 E.00537
G3 X103.679 Y108.827 I2.149 J1.621 E.07161
G1 X103.934 Y108.808 E.00848
G3 X101.709 Y110.099 I.074 J2.691 E.47202
G1 X101.732 Y110.059 E.00154
M204 S250
G1 X102.085 Y110.238 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X102.318 Y109.939 E.01166
G3 X103.727 Y109.217 I1.689 J1.56 E.04965
G1 X103.944 Y109.2 E.00668
G3 X102.043 Y110.304 I.063 J2.298 E.37349
G1 X102.053 Y110.289 E.00054
; WIPE_START
M204 S6000
G1 X102.318 Y109.939 E-.16697
G1 X102.658 Y109.632 E-.17391
G1 X103.055 Y109.403 E-.17402
G1 X103.49 Y109.257 E-.17429
G1 X103.673 Y109.226 E-.07082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.062 Y116.848 Z1.6 F42000
G1 X105.327 Y141.701 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.413 Y141.745 E.00321
G3 X103.616 Y141.424 I-1.42 J2.754 E.58437
G1 X103.91 Y141.402 E.00978
G3 X105.133 Y141.617 I.084 J3.098 E.04147
G1 X105.272 Y141.677 E.00504
M204 S10000
G1 X105.16 Y142.072 F42000
G1 F5400
M204 S6000
G1 X105.228 Y142.107 E.00254
G3 X103.666 Y141.828 I-1.233 J2.392 E.5076
G1 X103.921 Y141.809 E.00847
G3 X104.984 Y141.996 I.073 J2.691 E.03604
G1 X105.104 Y142.048 E.00436
M204 S250
G1 X105.005 Y142.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.049 Y142.456 E.00149
G3 X103.715 Y142.218 I-1.054 J2.043 E.40164
G1 X103.932 Y142.201 E.00667
G3 X104.623 Y142.288 I.063 J2.298 E.0215
G1 X104.949 Y142.414 E.01073
; WIPE_START
M204 S6000
G1 X105.049 Y142.456 E-.0412
G1 X105.435 Y142.702 E-.17398
G1 X105.763 Y143.021 E-.17405
G1 X106.021 Y143.4 E-.17406
G1 X106.199 Y143.822 E-.17405
G1 X106.211 Y143.88 E-.02266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.83 Y143.428 Z1.6 F42000
G1 X126.822 Y142.656 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.827 Y142.691 E.00118
G3 X124.005 Y143.87 I-1.529 J.308 E.14213
G3 X123.999 Y142.133 I-1.3 J-.864 E.26431
G3 X125.107 Y141.452 I1.319 J.904 E.04442
G3 X126.789 Y142.541 I.192 J1.548 E.07219
G1 X126.805 Y142.598 E.00198
M204 S10000
G1 X126.425 Y142.769 F42000
G1 F5400
M204 S6000
G1 X126.448 Y142.885 E.00392
G3 X125.158 Y141.856 I-1.146 J.114 E.17912
G1 X125.272 Y141.848 E.00382
G3 X126.402 Y142.66 I.029 J1.152 E.04957
G1 X126.413 Y142.71 E.00169
M204 S250
G1 X126.042 Y142.847 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.057 Y142.924 E.00243
G3 X125.207 Y142.246 I-.756 J.075 E.10942
G1 X125.282 Y142.24 E.00233
G3 X126.027 Y142.776 I.019 J.76 E.03028
G1 X126.03 Y142.788 E.00037
; WIPE_START
M204 S6000
G1 X126.057 Y142.924 E-.05288
G1 X126.046 Y143.154 E-.08753
G1 X126.012 Y143.271 E-.04604
G1 X125.907 Y143.459 E-.0819
G1 X125.804 Y143.57 E-.05761
G1 X125.681 Y143.658 E-.05751
G1 X125.543 Y143.721 E-.05752
G1 X125.396 Y143.754 E-.05746
G1 X125.244 Y143.758 E-.05758
G1 X125.095 Y143.732 E-.05761
G1 X124.954 Y143.676 E-.05754
G1 X124.827 Y143.594 E-.05747
G1 X124.768 Y143.537 E-.03134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.425 Y141.886 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.558 Y141.856 E.0045
G1 X122.672 Y141.848 E.00382
G3 X122.334 Y141.907 I.029 J1.152 E.22868
G1 X122.367 Y141.9 E.00112
M204 S250
G1 X122.512 Y142.267 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.607 Y142.246 E.00297
G1 X122.682 Y142.24 E.00233
G3 X122.454 Y142.281 I.019 J.76 E.13954
; WIPE_START
M204 S6000
G1 X122.607 Y142.246 E-.05948
G1 X122.682 Y142.24 E-.02884
G1 X122.907 Y142.268 E-.08617
G1 X123.048 Y142.323 E-.05739
G1 X123.175 Y142.406 E-.05761
G1 X123.284 Y142.511 E-.05755
G1 X123.369 Y142.637 E-.05755
G1 X123.428 Y142.776 E-.0575
G1 X123.458 Y142.924 E-.05746
G1 X123.446 Y143.154 E-.08755
G1 X123.412 Y143.271 E-.04604
G1 X123.307 Y143.459 E-.0819
G1 X123.262 Y143.507 E-.02496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.892 Y143.702 Z1.6 F42000
G1 X147.075 Y144.116 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.078 Y144.192 E.00254
G3 X143.616 Y141.424 I-3.084 J.308 E.48209
G1 X143.91 Y141.402 E.00978
G3 X147.032 Y143.887 I.084 J3.098 E.14383
G1 X147.064 Y144.057 E.00571
M204 S10000
G1 X146.672 Y144.176 F42000
G1 F5400
M204 S6000
G1 X146.673 Y144.233 E.00187
G3 X143.666 Y141.828 I-2.678 J.267 E.41872
G1 X143.921 Y141.809 E.00847
G3 X146.633 Y143.968 I.073 J2.691 E.12494
G1 X146.661 Y144.117 E.00504
M204 S250
G1 X146.284 Y144.243 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X146.283 Y144.272 E.00088
G3 X143.715 Y142.218 I-2.288 J.228 E.33132
G1 X143.932 Y142.201 E.00667
G3 X146.193 Y143.824 I.063 J2.298 E.09184
G1 X146.271 Y144.184 E.01134
; WIPE_START
M204 S6000
G1 X146.283 Y144.272 E-.03346
G1 X146.29 Y144.729 E-.17386
G1 X146.199 Y145.178 E-.17406
G1 X146.021 Y145.6 E-.17405
G1 X145.763 Y145.979 E-.17405
G1 X145.706 Y146.035 E-.03052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.639 Y138.988 Z1.6 F42000
G1 X148.899 Y138.363 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X148.92 Y138.322 E.00153
G3 X151.914 Y136.492 I3.081 J1.676 E.1219
G1 X152.088 Y136.492 E.0058
G3 X148.768 Y138.637 I-.087 J3.506 E.5917
G1 X148.873 Y138.417 E.00808
M204 S10000
G1 X149.265 Y138.54 F42000
G1 F5400
M204 S6000
G1 X149.277 Y138.517 E.00086
G3 X151.924 Y136.899 I2.724 J1.481 E.10776
G1 X152.078 Y136.899 E.00513
G3 X149.144 Y138.795 I-.077 J3.099 E.52304
G1 X149.24 Y138.594 E.00741
M204 S250
G1 X149.618 Y138.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.622 Y138.704 E.00019
G3 X151.934 Y137.291 I2.379 J1.294 E.0872
G1 X152.069 Y137.291 E.00415
G3 X149.505 Y138.948 I-.068 J2.708 E.42325
G1 X149.592 Y138.764 E.00626
; WIPE_START
M204 S6000
G1 X149.622 Y138.704 E-.02517
G1 X149.762 Y138.473 E-.10274
G1 X149.925 Y138.258 E-.10262
G1 X150.109 Y138.06 E-.10264
G1 X150.483 Y137.756 E-.18327
G1 X150.886 Y137.53 E-.17573
G1 X151.053 Y137.465 E-.06783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.476 Y129.997 Z1.6 F42000
G1 X144.947 Y108.551 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.133 Y108.617 E.00655
G3 X143.616 Y108.424 I-1.139 J2.882 E.59468
G1 X143.91 Y108.402 E.00978
G3 X144.84 Y108.518 I.084 J3.098 E.03122
G1 X144.889 Y108.533 E.00171
M204 S10000
G1 X144.817 Y108.937 F42000
G1 F5400
M204 S6000
G1 X144.984 Y108.996 E.00588
G3 X143.666 Y108.828 I-.989 J2.503 E.51649
G1 X143.921 Y108.809 E.00847
G3 X144.73 Y108.91 I.073 J2.691 E.02714
G1 X144.759 Y108.919 E.00103
M204 S250
G1 X144.683 Y109.309 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X145.049 Y109.456 E.01213
G3 X143.715 Y109.218 I-1.054 J2.043 E.40164
G1 X143.932 Y109.201 E.00667
G3 X144.623 Y109.288 I.063 J2.298 E.0215
G1 X144.626 Y109.289 E.00008
; WIPE_START
M204 S6000
G1 X145.049 Y109.456 E-.17283
G1 X145.435 Y109.702 E-.17398
G1 X145.763 Y110.021 E-.17405
G1 X146.021 Y110.4 E-.17406
G1 X146.088 Y110.558 E-.06508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.341 Y118.087 Z1.6 F42000
G1 X149.992 Y134.009 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.167 J-3.728 E.04473
G3 X143.988 Y150.991 I-5.551 J-2.278 E.23535
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.122 Y105.012 E1.33045
G3 X149.992 Y111.013 I-.122 J5.991 E.3085
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19888
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.132 Y104.605 E1.33094
G3 X150.399 Y111.008 I-.132 J6.398 E.32921
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.812 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.141 Y104.213 E1.23331
G3 X150.791 Y111.003 I-.157 J6.805 E.32323
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
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


G1 X147.028 Y141.406 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.031 Y141.409 E.00014
G3 X147.95 Y142.736 I-2.96 J3.033 E.05389
G1 X148.31 Y142.995 E.01471
G2 X149.477 Y142.912 I.491 J-1.337 E.03998
G2 X154.418 Y143.006 I2.527 J-2.921 E.17787
G1 X154.862 Y142.867 E.01544
G3 X156.172 Y141.833 I6.437 J6.812 E.05544
G3 X157.306 Y141.906 I.487 J1.296 E.03884
G2 X157.599 Y139.296 I-5.893 J-1.981 E.08778
G1 X157.483 Y139.212 E.00473
G2 X155.841 Y139.626 I-.449 J1.684 E.05866
G2 X154.968 Y137.535 I-3.93 J.413 E.07625
G3 X156.172 Y136.592 I5.876 J6.267 E.05081
G1 X156.466 Y136.557 E.0098
G2 X154.853 Y135.134 I-5.002 J4.042 E.07167
G3 X152.897 Y134.441 I-.437 J-1.874 E.07274
G2 X150.631 Y134.357 I-1.695 J15.26 E.07527
M73 P45 R17
G3 X149.621 Y135.133 I-4.842 J-5.263 E.0423
G3 X147.655 Y134.441 I-.444 J-1.876 E.07303
G1 X147 Y133.971 E.02674
G2 X145.035 Y134.663 I-.444 J1.876 E.07303
G1 X144.379 Y135.133 E.02674
G3 X142.414 Y134.441 I-.444 J-1.876 E.07303
G1 X141.759 Y133.971 E.02674
G2 X139.793 Y134.663 I-.444 J1.876 E.07303
G1 X139.138 Y135.133 E.02674
G3 X137.173 Y134.441 I-.444 J-1.876 E.07303
G1 X136.517 Y133.971 E.02674
G2 X134.552 Y134.663 I-.444 J1.876 E.07303
G1 X133.897 Y135.133 E.02674
G3 X132.415 Y134.857 I-.448 J-1.712 E.05164
G1 X132.858 Y134.857 E.0147
G1 X132.858 Y132.544 E.07672
G1 X133.242 Y132.59 E.0128
G1 X133.897 Y132.384 E.02278
G3 X135.207 Y131.35 I6.436 J6.81 E.05544
G3 X137.173 Y132.043 I.444 J1.876 E.07303
G1 X137.828 Y132.512 E.02674
G2 X139.793 Y131.82 I.444 J-1.876 E.07303
G1 X140.448 Y131.35 E.02674
G3 X142.414 Y132.043 I.444 J1.876 E.07303
G1 X143.069 Y132.512 E.02674
G2 X145.035 Y131.82 I.444 J-1.876 E.07303
G1 X145.69 Y131.35 E.02674
G3 X147.655 Y132.043 I.444 J1.876 E.07303
G1 X148.31 Y132.512 E.02674
G2 X149.644 Y132.364 I.51 J-1.491 E.04596
G1 X149.621 Y129.891 E.08204
G3 X147.655 Y129.199 I-.444 J-1.876 E.07303
G1 X147 Y128.73 E.02674
G2 X145.035 Y129.422 I-.444 J1.876 E.07303
G1 X144.379 Y129.891 E.02674
G3 X142.414 Y129.199 I-.444 J-1.876 E.07303
G1 X141.759 Y128.73 E.02674
G2 X139.793 Y129.422 I-.444 J1.876 E.07303
G1 X139.138 Y129.891 E.02674
G3 X137.173 Y129.199 I-.444 J-1.876 E.07303
G1 X136.517 Y128.73 E.02674
G2 X134.552 Y129.422 I-.444 J1.876 E.07303
G1 X133.897 Y129.891 E.02674
G1 X133.242 Y129.969 E.02189
G1 X132.858 Y129.849 E.01332
G1 X132.858 Y131.477 E.05401
; WIPE_START
G1 X132.858 Y129.849 E-.61876
G1 X133.213 Y129.96 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.668 Y134.857 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X129.04 Y134.857 E.05401
G1 X128.656 Y135.133 E.01568
G3 X126.69 Y134.441 I-.444 J-1.876 E.07303
G1 X126.035 Y133.971 E.02674
G2 X124.069 Y134.663 I-.444 J1.876 E.07303
G1 X123.414 Y135.133 E.02674
G3 X121.449 Y134.441 I-.444 J-1.876 E.07303
G1 X120.794 Y133.971 E.02674
G1 X120.138 Y133.893 E.02189
G1 X119.858 Y133.981 E.00973
G1 X119.858 Y134.857 E.02907
G1 X118.557 Y134.857 E.04317
G1 X118.173 Y135.133 E.01568
G3 X116.691 Y134.857 I-.448 J-1.712 E.05164
G1 X115.144 Y134.857 E.05134
G1 X115.144 Y133.922 E.03101
G1 X114.897 Y133.893 E.00824
G1 X114.242 Y134.099 E.02278
G3 X112.932 Y135.133 I-6.438 J-6.813 E.05544
G3 X110.966 Y134.441 I-.444 J-1.876 E.07303
G1 X110.311 Y133.971 E.02674
G2 X108.345 Y134.663 I-.444 J1.876 E.07303
G1 X107.69 Y135.133 E.02674
G3 X105.725 Y134.441 I-.444 J-1.876 E.07303
G1 X105.07 Y133.971 E.02674
G2 X103.104 Y134.663 I-.444 J1.876 E.07303
G1 X102.449 Y135.133 E.02674
G3 X100.484 Y134.441 I-.444 J-1.876 E.07303
G1 X99.828 Y133.971 E.02674
G2 X98.364 Y134.232 I-.448 J1.728 E.05091
G1 X98.364 Y136.702 E.08194
G1 X98.518 Y136.592 E.00628
G3 X100.484 Y137.284 I.444 J1.876 E.07303
G1 X101.139 Y137.753 E.02674
G2 X103.104 Y137.061 I.444 J-1.876 E.07303
G1 X103.759 Y136.592 E.02674
G3 X105.725 Y137.284 I.444 J1.876 E.07303
G1 X106.38 Y137.753 E.02674
G2 X108.345 Y137.061 I.444 J-1.876 E.07303
G1 X109.001 Y136.592 E.02674
G3 X110.966 Y137.284 I.444 J1.876 E.07303
G1 X111.621 Y137.753 E.02674
G2 X113.587 Y137.061 I.444 J-1.876 E.07303
G1 X114.242 Y136.592 E.02674
G3 X116.207 Y137.284 I.444 J1.876 E.07303
G1 X116.863 Y137.753 E.02674
G2 X118.828 Y137.061 I.444 J-1.876 E.07303
G1 X119.483 Y136.592 E.02674
G3 X121.449 Y137.284 I.444 J1.876 E.07303
G1 X122.104 Y137.753 E.02674
G2 X124.069 Y137.061 I.444 J-1.876 E.07303
G1 X124.725 Y136.592 E.02674
G3 X126.69 Y137.284 I.444 J1.876 E.07303
G1 X127.345 Y137.753 E.02674
G2 X129.311 Y137.061 I.444 J-1.876 E.07303
G1 X129.966 Y136.592 E.02674
G3 X131.931 Y137.284 I.444 J1.876 E.07303
G1 X132.587 Y137.753 E.02674
G2 X134.552 Y137.061 I.444 J-1.876 E.07303
G1 X135.207 Y136.592 E.02674
G3 X137.173 Y137.284 I.444 J1.876 E.07303
G1 X137.828 Y137.753 E.02674
G2 X139.793 Y137.061 I.444 J-1.876 E.07303
G1 X140.448 Y136.592 E.02674
G3 X142.414 Y137.284 I.444 J1.876 E.07303
G1 X143.069 Y137.753 E.02674
G2 X145.035 Y137.061 I.444 J-1.876 E.07303
G1 X145.69 Y136.592 E.02674
G3 X147.655 Y137.284 I.444 J1.876 E.07303
G1 X148.31 Y137.753 E.02674
G1 X148.823 Y137.814 E.01711
G2 X148.148 Y140.106 I3.542 J2.287 E.08036
G2 X147 Y139.212 I-5.576 J5.976 E.04833
G2 X145.035 Y139.905 I-.444 J1.876 E.07303
G1 X144.597 Y140.218 E.01784
G2 X143.069 Y140.246 I-.651 J6.122 E.05084
G2 X141.759 Y139.212 I-6.437 J6.812 E.05544
G2 X139.793 Y139.905 I-.444 J1.876 E.07303
G1 X139.138 Y140.374 E.02674
G3 X137.173 Y139.682 I-.444 J-1.876 E.07303
G1 X136.517 Y139.212 E.02674
G2 X134.552 Y139.905 I-.444 J1.876 E.07303
G1 X133.897 Y140.374 E.02674
G3 X131.931 Y139.682 I-.444 J-1.876 E.07303
G1 X131.276 Y139.212 E.02674
G2 X129.311 Y139.905 I-.444 J1.876 E.07303
G1 X128.656 Y140.374 E.02674
G3 X126.69 Y139.682 I-.444 J-1.876 E.07303
G1 X126.035 Y139.212 E.02674
G2 X124.069 Y139.905 I-.444 J1.876 E.07303
G1 X123.414 Y140.374 E.02674
G2 X122.333 Y140.318 I-.716 J3.358 E.03608
G1 X122.104 Y140.246 E.00795
G2 X120.794 Y139.212 I-6.437 J6.812 E.05544
G2 X118.828 Y139.905 I-.444 J1.876 E.07303
G1 X118.173 Y140.374 E.02674
G3 X116.207 Y139.682 I-.444 J-1.876 E.07303
G1 X115.552 Y139.212 E.02674
G2 X113.587 Y139.905 I-.444 J1.876 E.07303
G1 X112.932 Y140.374 E.02674
G3 X110.966 Y139.682 I-.444 J-1.876 E.07303
G1 X110.311 Y139.212 E.02674
G2 X108.345 Y139.905 I-.444 J1.876 E.07303
G1 X107.69 Y140.374 E.02674
G3 X105.725 Y139.682 I-.444 J-1.876 E.07303
G1 X105.07 Y139.212 E.02674
G2 X103.104 Y139.905 I-.444 J1.876 E.07303
G1 X102.449 Y140.374 E.02674
G3 X100.484 Y139.682 I-.444 J-1.876 E.07303
G1 X99.828 Y139.212 E.02674
G2 X98.365 Y139.472 I-.448 J1.729 E.05086
G1 X98.365 Y141.943 E.08194
G1 X98.518 Y141.833 E.00623
G3 X100.259 Y142.332 I.448 J1.724 E.06302
G2 X99.678 Y144.436 I3.633 J2.136 E.07324
G1 X99.173 Y144.376 E.01685
G1 X98.518 Y144.582 E.02278
G1 X98.366 Y144.713 E.00666
G2 X98.745 Y147.047 I5.937 J.233 E.07899
G1 X99.173 Y146.996 E.0143
G1 X99.828 Y147.202 E.02278
G2 X101.139 Y148.236 I6.437 J-6.812 E.05544
G1 X101.794 Y148.314 E.02189
G1 X101.904 Y148.279 E.00383
G2 X106.289 Y148.171 I2.1 J-3.803 E.15253
G1 X106.38 Y148.236 E.00371
G2 X108.345 Y147.544 I.444 J-1.876 E.07303
G1 X109.001 Y147.074 E.02674
G3 X110.966 Y147.767 I.444 J1.876 E.07303
G1 X111.621 Y148.236 E.02674
G2 X113.587 Y147.544 I.444 J-1.876 E.07303
G1 X114.242 Y147.074 E.02674
G3 X116.207 Y147.767 I.444 J1.876 E.07303
G1 X116.863 Y148.236 E.02674
G2 X118.828 Y147.544 I.444 J-1.876 E.07303
G1 X119.483 Y147.074 E.02674
G3 X121.449 Y147.767 I.444 J1.876 E.07303
G1 X122.104 Y148.236 E.02674
G2 X124.069 Y147.544 I.444 J-1.876 E.07303
G1 X124.725 Y147.074 E.02674
G3 X126.69 Y147.767 I.444 J1.876 E.07303
G1 X127.345 Y148.236 E.02674
G2 X129.311 Y147.544 I.444 J-1.876 E.07303
G1 X129.966 Y147.074 E.02674
G3 X131.931 Y147.767 I.444 J1.876 E.07303
G1 X132.587 Y148.236 E.02674
G2 X134.552 Y147.544 I.444 J-1.876 E.07303
G1 X135.207 Y147.074 E.02674
G3 X137.173 Y147.767 I.444 J1.876 E.07303
G1 X137.828 Y148.236 E.02674
G2 X139.793 Y147.544 I.444 J-1.876 E.07303
G1 X140.518 Y147.066 E.0288
G3 X139.73 Y145.191 I3.586 J-2.611 E.06807
G1 X139.138 Y145.615 E.02416
G3 X137.173 Y144.923 I-.444 J-1.876 E.07303
G1 X136.517 Y144.454 E.02674
G2 X134.552 Y145.146 I-.444 J1.876 E.07303
G1 X133.897 Y145.615 E.02674
G3 X131.931 Y144.923 I-.444 J-1.876 E.07303
G1 X131.276 Y144.454 E.02674
G2 X129.311 Y145.146 I-.444 J1.876 E.07303
G1 X128.656 Y145.615 E.02674
G3 X126.95 Y145.147 I-.448 J-1.707 E.06143
G2 X128.007 Y143.071 I-1.634 J-2.138 E.07994
G1 X128.656 Y142.867 E.02256
G3 X129.966 Y141.833 I6.438 J6.813 E.05544
G3 X131.931 Y142.525 I.444 J1.876 E.07303
G1 X132.587 Y142.995 E.02674
G2 X134.552 Y142.303 I.444 J-1.876 E.07303
G1 X135.207 Y141.833 E.02674
G3 X137.173 Y142.525 I.444 J1.876 E.07303
G1 X137.828 Y142.995 E.02674
G2 X139.793 Y142.303 I.444 J-1.876 E.07303
G1 X140.448 Y141.833 E.02674
G1 X140.612 Y141.814 E.00546
G3 X141.835 Y140.753 I3.563 J2.874 E.05398
M204 S10000
G1 X141.174 Y141.794 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455825
G1 F8718.729
M204 S6000
G1 X140.694 Y142.408 E.02622
G1 X140.345 Y143.104 E.02621
G1 X140.141 Y143.857 E.02623
G1 X140.088 Y144.622 E.02582
G1 X140.194 Y145.405 E.02656
G1 X140.449 Y146.143 E.02628
G1 X140.845 Y146.814 E.02622
G1 X141.371 Y147.392 E.02627
G1 X141.99 Y147.861 E.02615
G1 X142.444 Y148.091 E.0171
G1 X143.116 Y148.312 E.0238
G1 X143.83 Y148.408 E.02425
G2 X145.416 Y148.148 I.085 J-4.446 E.05437
G1 X146.11 Y147.796 E.02621
G1 X146.722 Y147.312 E.02622
G1 X147.225 Y146.717 E.02621
G1 X147.6 Y146.035 E.02622
G1 X147.833 Y145.291 E.02621
G1 X147.914 Y144.516 E.02623
G1 X147.839 Y143.74 E.02622
G1 X147.613 Y142.995 E.0262
G1 X147.243 Y142.309 E.02622
G1 X146.745 Y141.71 E.02621
G1 X146.138 Y141.222 E.0262
G1 X145.445 Y140.863 E.02624
G1 X144.696 Y140.649 E.02622
G1 X143.927 Y140.585 E.02596
G1 X143.189 Y140.672 E.025
G1 X142.447 Y140.908 E.02621
G1 X141.766 Y141.287 E.02622
G1 X141.219 Y141.755 E.02421
M204 S10000
G1 X141.416 Y142.129 F42000
; LINE_WIDTH: 0.447468
G1 F8898.822
M204 S6000
G1 X141.937 Y141.664 E.02303
G1 X142.54 Y141.311 E.02302
G1 X143.201 Y141.085 E.02303
G1 X143.878 Y140.996 E.02253
G1 X144.604 Y141.056 E.02398
G1 X144.969 Y141.133 E.01232
G1 X145.582 Y141.373 E.02168
G1 X146.17 Y141.748 E.023
G1 X146.672 Y142.233 E.02301
G1 X147.068 Y142.807 E.02299
G1 X147.343 Y143.448 E.023
G1 X147.485 Y144.131 E.023
G1 X147.489 Y144.829 E.02301
G1 X147.355 Y145.514 E.023
G1 X147.088 Y146.158 E.023
G1 X146.698 Y146.737 E.02299
G1 X146.201 Y147.227 E.02301
G1 X145.617 Y147.609 E.023
G1 X144.969 Y147.867 E.023
G1 X144.282 Y147.992 E.02301
G1 X143.585 Y147.98 E.02298
G1 X142.904 Y147.828 E.02301
G1 X142.265 Y147.548 E.023
G1 X141.712 Y147.156 E.02235
G1 X141.218 Y146.634 E.0237
G1 X140.85 Y146.04 E.02302
G1 X140.607 Y145.385 E.02303
G1 X140.501 Y144.695 E.02302
G1 X140.53 Y143.997 E.02301
G1 X140.698 Y143.319 E.02303
G1 X140.998 Y142.689 E.02302
G1 X141.38 Y142.177 E.02105
; WIPE_START
G1 X140.998 Y142.689 E-.24261
G1 X140.698 Y143.319 E-.26535
G1 X140.538 Y143.963 E-.25205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.158 Y144.399 Z1.6 F42000
G1 X154.979 Y144.79 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X153.491 Y145.435 I-3.117 J-5.147 E.05397
G1 X152.897 Y144.923 E.02603
G2 X150.931 Y144.582 I-1.209 J1.133 E.07101
G1 X150.276 Y145.146 E.02868
G3 X148.31 Y145.487 I-1.209 J-1.133 E.07101
G1 X148.229 Y145.417 E.00358
G3 X147.217 Y147.389 I-4.139 J-.876 E.07439
G2 X148.31 Y148.236 I5.281 J-5.69 E.04592
G1 X148.591 Y148.269 E.00939
G3 X147.057 Y149.736 I-4.419 J-3.09 E.07087
G2 X145.69 Y149.823 I-.572 J1.793 E.04651
G3 X144.751 Y150.591 I-4.765 J-4.87 E.0403
G3 X142.969 Y150.642 I-1.273 J-13.143 E.05917
G1 X142.414 Y150.165 E.02429
G2 X140.448 Y149.823 I-1.209 J1.133 E.07101
G3 X139.438 Y150.642 I-5.085 J-5.242 E.0432
G1 X137.726 Y150.641 E.05678
G1 X137.173 Y150.165 E.02424
G2 X135.207 Y149.823 I-1.209 J1.133 E.07101
G3 X134.198 Y150.641 I-5.079 J-5.235 E.04314
G1 X132.484 Y150.64 E.05686
G1 X131.931 Y150.165 E.02419
G2 X129.966 Y149.823 I-1.209 J1.133 E.07101
G3 X128.958 Y150.64 I-5.072 J-5.227 E.04309
G1 X127.242 Y150.639 E.05695
G1 X126.69 Y150.165 E.02414
G2 X124.725 Y149.823 I-1.209 J1.133 E.07101
G3 X123.718 Y150.639 I-5.067 J-5.221 E.04303
G1 X121.999 Y150.638 E.05703
G1 X121.449 Y150.165 E.02409
G2 X119.483 Y149.823 I-1.209 J1.133 E.07101
G3 X118.478 Y150.638 I-5.061 J-5.214 E.04298
G1 X116.757 Y150.638 E.05711
G1 X116.207 Y150.165 E.02404
G2 X114.242 Y149.823 I-1.209 J1.133 E.07101
G3 X113.238 Y150.637 I-5.055 J-5.208 E.04292
G1 X111.514 Y150.637 E.05719
G1 X110.966 Y150.165 E.02399
G2 X109.001 Y149.823 I-1.209 J1.133 E.07101
G3 X107.998 Y150.636 I-5.048 J-5.199 E.04286
G1 X106.272 Y150.636 E.05728
G1 X105.725 Y150.165 E.02394
G2 X103.759 Y149.823 I-1.209 J1.133 E.07101
G3 X102.908 Y150.528 I-4.37 J-4.411 E.03672
G3 X101.379 Y149.988 I2.099 J-8.376 E.05386
; WIPE_START
G1 X102.1 Y150.312 E-.30053
G1 X102.908 Y150.528 E-.31758
G1 X103.195 Y150.29 E-.14189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.648 Y143.483 Z1.6 F42000
G1 X107.243 Y142.309 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455811
G1 F8719.019
M204 S6000
G1 X106.745 Y141.71 E.02621
G1 X106.138 Y141.222 E.0262
G1 X105.445 Y140.864 E.02624
G1 X104.696 Y140.649 E.02622
G1 X103.927 Y140.585 E.02596
G1 X103.189 Y140.672 E.025
G1 X102.447 Y140.908 E.02621
G1 X101.766 Y141.287 E.02621
G1 X101.174 Y141.794 E.02622
G1 X100.694 Y142.408 E.02623
G1 X100.345 Y143.105 E.02622
G1 X100.141 Y143.857 E.02622
G1 X100.088 Y144.622 E.02583
G1 X100.194 Y145.405 E.02657
G1 X100.449 Y146.143 E.02628
G1 X100.845 Y146.814 E.02621
G1 X101.371 Y147.392 E.02628
G1 X101.99 Y147.861 E.02614
G1 X102.444 Y148.091 E.0171
G1 X103.116 Y148.312 E.0238
G1 X103.83 Y148.408 E.02425
G2 X105.416 Y148.148 I.085 J-4.446 E.05437
G1 X106.11 Y147.796 E.02621
G1 X106.722 Y147.312 E.02622
G1 X107.225 Y146.717 E.02621
G1 X107.6 Y146.035 E.02622
G1 X107.833 Y145.291 E.02621
G1 X107.914 Y144.516 E.02623
G1 X107.839 Y143.74 E.02621
G1 X107.613 Y142.995 E.02621
G1 X107.271 Y142.362 E.0242
M204 S10000
G1 X107.068 Y142.807 F42000
; LINE_WIDTH: 0.447497
G1 F8898.196
M204 S6000
G1 X107.343 Y143.448 E.023
G1 X107.485 Y144.131 E.02301
G1 X107.489 Y144.829 E.02301
G1 X107.355 Y145.514 E.023
G1 X107.087 Y146.158 E.023
G1 X106.698 Y146.737 E.02299
G1 X106.201 Y147.227 E.023
G1 X105.617 Y147.609 E.02301
G1 X104.969 Y147.867 E.023
G1 X104.283 Y147.992 E.023
G1 X103.585 Y147.979 E.02299
G1 X102.904 Y147.828 E.02301
G1 X102.265 Y147.548 E.023
G1 X101.712 Y147.156 E.02235
G1 X101.218 Y146.634 E.0237
G1 X100.85 Y146.04 E.02302
G1 X100.607 Y145.385 E.02303
G1 X100.501 Y144.695 E.02303
G1 X100.53 Y143.997 E.02302
G1 X100.698 Y143.319 E.02303
G1 X100.998 Y142.688 E.02302
G1 X101.416 Y142.129 E.02303
G1 X101.937 Y141.664 E.02303
G1 X102.54 Y141.311 E.02301
G1 X103.201 Y141.085 E.02304
G1 X103.878 Y140.996 E.02253
G1 X104.604 Y141.056 E.02399
G1 X104.969 Y141.133 E.01232
G1 X105.582 Y141.373 E.02169
G1 X106.17 Y141.748 E.023
G1 X106.672 Y142.233 E.023
G1 X107.034 Y142.757 E.02102
M204 S10000
G1 X120.028 Y143.38 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X120.283 Y141.8 I2.479 J-.411 E.05403
G1 X120.138 Y141.755 E.00502
G1 X119.483 Y141.833 E.02189
G1 X118.828 Y142.303 E.02674
G3 X116.863 Y142.995 I-1.521 J-1.184 E.07303
G1 X116.207 Y142.525 E.02674
G2 X114.242 Y141.833 I-1.521 J1.184 E.07303
G1 X113.587 Y142.303 E.02674
G3 X111.621 Y142.995 I-1.521 J-1.184 E.07303
G1 X110.966 Y142.525 E.02674
G2 X109.001 Y141.833 I-1.521 J1.184 E.07303
G2 X107.918 Y142.67 I4.142 J6.472 E.04546
G3 X108.267 Y145.202 I-3.925 J1.831 E.08605
G1 X108.345 Y145.146 E.0032
G3 X110.311 Y144.454 I1.521 J1.184 E.07303
G1 X110.966 Y144.923 E.02674
G2 X112.932 Y145.615 I1.521 J-1.184 E.07303
G1 X113.587 Y145.146 E.02674
G3 X115.552 Y144.454 I1.521 J1.184 E.07303
G1 X116.207 Y144.923 E.02674
G2 X118.173 Y145.615 I1.521 J-1.184 E.07303
G2 X119.483 Y144.582 I-5.127 J-7.846 E.05544
G1 X120.138 Y144.376 E.02278
G1 X120.396 Y144.406 E.00859
G2 X121.596 Y145.464 I2.229 J-1.32 E.05396
; WIPE_START
G1 X121.008 Y145.115 E-.25991
G1 X120.396 Y144.406 E-.35595
G1 X120.138 Y144.376 E-.09841
G1 X120.024 Y144.412 E-.04573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.947 Y143.585 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105686
G1 F15000
M204 S6000
G1 X124.003 Y143.5 E.00052
G1 X124.001 Y143.444 E.00029
; WIPE_START
G1 X124.003 Y143.5 E-.26944
G1 X123.947 Y143.585 E-.49056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.701 Y140.724 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420233
G1 F9541.16
M204 S6000
G1 X125.451 Y140.692 E.00775
G1 X124.849 Y140.724 E.01854
G1 X124.358 Y140.878 E.01583
; LINE_WIDTH: 0.440057
G1 F9064.896
G1 X124.017 Y141.044 E.01227
G1 X123.558 Y140.844 E.01621
; LINE_WIDTH: 0.41242
G1 F9742.918
G1 X123.048 Y140.711 E.01587
G1 X122.592 Y140.683 E.01376
G2 X120.514 Y142.253 I.126 J2.327 E.08322
G1 X120.405 Y142.741 E.01505
G1 X120.415 Y143.354 E.01845
G1 X120.546 Y143.847 E.01536
G1 X120.779 Y144.3 E.01534
G1 X121.102 Y144.669 E.01477
G1 X121.589 Y145.027 E.01821
G1 X122.07 Y145.232 E.01573
G1 X122.73 Y145.314 E.02003
G1 X123.225 Y145.254 E.01501
G1 X123.702 Y145.088 E.0152
; LINE_WIDTH: 0.424248
G1 F9440.704
G1 X123.85 Y145.019 E.00508
; LINE_WIDTH: 0.438802
G1 F9093.625
G1 X123.998 Y144.949 E.00528
G1 X124.457 Y145.151 E.01618
; LINE_WIDTH: 0.41148
G1 F9767.762
G2 X125.413 Y145.312 I.969 J-2.832 E.02924
G2 X127.037 Y144.537 I-.114 J-2.329 E.05548
G1 X127.333 Y144.117 E.01543
G1 X127.535 Y143.545 E.01825
G1 X127.615 Y143.015 E.01609
G1 X127.517 Y142.339 E.02051
G1 X127.328 Y141.885 E.01477
G1 X127.03 Y141.458 E.01564
G1 X126.596 Y141.099 E.01692
G1 X126.179 Y140.863 E.01439
G1 X125.759 Y140.741 E.01314
M204 S10000
G1 X125.612 Y141.079 F42000
; LINE_WIDTH: 0.410062
G1 F9805.485
M204 S6000
G1 X126.029 Y141.195 E.01296
G1 X126.372 Y141.38 E.01167
G1 X126.772 Y141.723 E.01575
G1 X127.081 Y142.214 E.01736
G1 X127.231 Y142.779 E.01749
G1 X127.207 Y143.38 E.01798
G1 X126.993 Y143.969 E.01876
G1 X126.701 Y144.358 E.01455
G3 X125.331 Y144.947 I-1.406 J-1.379 E.04575
G1 X124.767 Y144.868 E.01704
G1 X124.307 Y144.672 E.01498
; LINE_WIDTH: 0.428133
G1 F9345.477
G1 X123.988 Y144.495 E.01145
G1 X123.532 Y144.761 E.01655
G3 X122.749 Y144.942 I-.917 J-2.174 E.02537
; LINE_WIDTH: 0.413381
G1 F9717.633
G1 X122.191 Y144.879 E.01695
G1 X121.796 Y144.725 E.01281
G1 X121.351 Y144.387 E.01687
G1 X121.081 Y144.083 E.01227
G3 X120.782 Y143.332 I1.605 J-1.075 E.02458
G1 X120.77 Y142.756 E.0174
G1 X120.909 Y142.245 E.01597
G3 X123.431 Y141.192 I1.798 J.76 E.09139
; LINE_WIDTH: 0.443292
G1 F8991.644
G1 X123.872 Y141.425 E.01629
G1 X123.991 Y141.529 E.00516
G1 X124.246 Y141.369 E.00983
; LINE_WIDTH: 0.411759
G1 F9760.376
G1 X124.698 Y141.147 E.01511
G1 X125.081 Y141.068 E.01175
G1 X125.552 Y141.078 E.01416
M204 S10000
G1 X128.144 Y130.917 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.144 Y132.545 E.05401
G1 X128 Y132.59 E.00498
G1 X127.345 Y132.512 E.02189
G3 X126.035 Y131.478 I5.128 J-7.847 E.05544
G2 X124.069 Y131.82 I-.756 J1.475 E.07101
G1 X123.414 Y132.384 E.02868
G3 X121.449 Y132.043 I-.756 J-1.475 E.07101
G1 X120.794 Y131.478 E.02868
G1 X120.138 Y131.272 E.02278
G1 X119.858 Y131.306 E.00935
G1 X119.858 Y128.74 E.08512
G1 X120.138 Y128.652 E.00973
G1 X120.794 Y128.73 E.02189
G3 X122.104 Y129.764 I-5.127 J7.846 E.05544
G2 X124.069 Y129.422 I.756 J-1.475 E.07101
G1 X124.725 Y128.858 E.02868
G3 X126.69 Y129.199 I.756 J1.475 E.07101
G1 X127.345 Y129.764 E.02868
G1 X128 Y129.969 E.02278
G1 X128.144 Y129.952 E.00479
G1 X128.144 Y128.324 E.05401
; WIPE_START
G1 X128.144 Y129.952 E-.61876
G1 X128 Y129.969 E-.05484
G1 X127.783 Y129.901 E-.08639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.209 Y123.683 Z1.6 F42000
G1 X132.601 Y123.133 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X131.934 Y123.8 E.02898
G1 X131.401 Y123.8
G1 X132.601 Y122.599 E.05215
G1 X132.601 Y122.066
G1 X130.867 Y123.8 E.07532
G1 X130.334 Y123.8
G1 X132.601 Y121.533 E.09849
G1 X132.601 Y121
G1 X129.801 Y123.8 E.12167
G1 X129.267 Y123.8
G1 X132.601 Y120.466 E.14484
G1 X132.601 Y119.933
G1 X128.734 Y123.8 E.16801
G1 X128.201 Y123.8
G1 X132.601 Y119.4 E.19118
G1 X132.601 Y118.867
G1 X127.668 Y123.8 E.21436
G1 X127.134 Y123.8
G1 X132.601 Y118.333 E.23753
G1 X132.601 Y117.8
G1 X126.601 Y123.8 E.2607
G1 X126.068 Y123.8
G1 X132.601 Y117.267 E.28388
G1 X132.601 Y116.734
G1 X125.535 Y123.8 E.30705
G1 X125.001 Y123.8
G1 X132.601 Y116.2 E.33022
G1 X132.601 Y115.667
G1 X124.468 Y123.8 E.35339
G1 X123.935 Y123.8
G1 X132.601 Y115.134 E.37657
G1 X132.601 Y114.601
G1 X123.402 Y123.8 E.39974
G1 X122.868 Y123.8
G1 X132.601 Y114.067 E.42291
G1 X132.601 Y113.534
G1 X122.335 Y123.8 E.44608
G1 X121.802 Y123.8
G1 X132.601 Y113.001 E.46926
G1 X132.601 Y112.468
G1 X121.269 Y123.8 E.49243
G1 X120.735 Y123.8
G1 X132.601 Y111.934 E.5156
G1 X132.401 Y111.6
G1 X120.202 Y123.8 E.53011
G1 X119.669 Y123.8
G1 X131.868 Y111.6 E.53011
G1 X131.335 Y111.6
G1 X119.136 Y123.8 E.53011
G1 X118.602 Y123.8
G1 X130.801 Y111.6 E.53011
G1 X130.268 Y111.6
G1 X118.069 Y123.8 E.53011
G1 X117.536 Y123.8
G1 X129.735 Y111.6 E.53011
G1 X129.202 Y111.6
G1 X117.003 Y123.8 E.53011
G1 X116.469 Y123.8
G1 X128.668 Y111.6 E.53011
G1 X128.135 Y111.6
G1 X115.936 Y123.8 E.53011
G1 X115.403 Y123.8
G1 X127.602 Y111.6 E.53011
G1 X127.069 Y111.6
G1 X115.402 Y123.267 E.50699
G1 X115.402 Y122.734
G1 X126.535 Y111.6 E.48382
G1 X126.002 Y111.6
G1 X115.402 Y122.201 E.46064
G1 X115.402 Y121.668
G1 X125.469 Y111.6 E.43747
G1 X124.936 Y111.6
G1 X115.402 Y121.134 E.4143
G1 X115.402 Y120.601
G1 X124.402 Y111.6 E.39113
G1 X123.869 Y111.6
G1 X115.402 Y120.068 E.36795
G1 X115.402 Y119.535
G1 X123.336 Y111.6 E.34478
G1 X122.803 Y111.6
G1 X115.402 Y119.001 E.32161
M73 P46 R17
G1 X115.402 Y118.468
G1 X122.269 Y111.6 E.29843
G1 X121.736 Y111.6
G1 X115.402 Y117.935 E.27526
G1 X115.402 Y117.402
G1 X121.203 Y111.6 E.25209
G1 X120.669 Y111.6
G1 X115.402 Y116.868 E.22892
G1 X115.402 Y116.335
G1 X120.136 Y111.6 E.20574
G1 X119.603 Y111.6
G1 X115.402 Y115.802 E.18257
G1 X115.402 Y115.269
G1 X119.07 Y111.6 E.1594
G1 X118.536 Y111.6
G1 X115.402 Y114.735 E.13623
G1 X115.402 Y114.202
G1 X118.003 Y111.6 E.11305
G1 X117.47 Y111.6
G1 X115.402 Y113.669 E.08988
G1 X115.402 Y113.136
G1 X116.937 Y111.6 E.06671
G1 X116.403 Y111.6
G1 X115.402 Y112.602 E.04354
G1 X115.402 Y112.069
G1 X115.87 Y111.6 E.02036
; WIPE_START
M204 S6000
G1 X115.402 Y112.069 E-.25183
G1 X115.402 Y112.602 E-.20264
G1 X115.97 Y112.034 E-.30553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.424 Y116.69 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X114.424 Y118.318 E.05401
G1 X114.242 Y118.375 E.00632
G3 X112.932 Y119.409 I-6.437 J-6.811 E.05544
G3 X110.966 Y118.717 I-.444 J-1.876 E.07303
G1 X110.311 Y118.247 E.02674
G2 X108.345 Y118.939 I-.444 J1.876 E.07303
G1 X107.69 Y119.409 E.02674
G3 X105.725 Y118.717 I-.444 J-1.876 E.07303
G1 X105.07 Y118.247 E.02674
G2 X103.104 Y118.939 I-.444 J1.876 E.07303
G1 X102.449 Y119.409 E.02674
G3 X100.484 Y118.717 I-.444 J-1.876 E.07303
G1 X99.828 Y118.247 E.02674
G2 X98.36 Y118.511 I-.448 J1.724 E.05106
G1 X98.361 Y120.981 E.08192
G1 X98.518 Y120.868 E.00642
G3 X100.484 Y121.56 I.444 J1.876 E.07303
G1 X101.139 Y122.03 E.02674
G2 X103.104 Y121.337 I.444 J-1.876 E.07303
G1 X103.759 Y120.868 E.02674
G3 X105.725 Y121.56 I.444 J1.876 E.07303
G1 X106.38 Y122.03 E.02674
G2 X108.345 Y121.337 I.444 J-1.876 E.07303
G1 X109.001 Y120.868 E.02674
G3 X110.966 Y121.56 I.444 J1.876 E.07303
G1 X111.621 Y122.03 E.02674
G2 X113.587 Y121.337 I.444 J-1.876 E.07303
G1 X114.242 Y120.868 E.02674
G1 X114.424 Y120.846 E.00607
G1 X114.424 Y123.559 E.09
G1 X114.242 Y123.616 E.00632
G3 X112.932 Y124.65 I-6.438 J-6.813 E.05544
G3 X110.966 Y123.958 I-.444 J-1.876 E.07303
G1 X110.311 Y123.489 E.02674
G2 X108.345 Y124.181 I-.444 J1.876 E.07303
G1 X107.69 Y124.65 E.02674
G3 X105.725 Y123.958 I-.444 J-1.876 E.07303
G1 X105.07 Y123.489 E.02674
G2 X103.104 Y124.181 I-.444 J1.876 E.07303
G1 X102.449 Y124.65 E.02674
G3 X100.484 Y123.958 I-.444 J-1.876 E.07303
G1 X99.828 Y123.489 E.02674
G2 X98.361 Y123.751 I-.448 J1.726 E.05101
G1 X98.362 Y126.221 E.08192
G1 X98.518 Y126.109 E.00638
G3 X100.484 Y126.801 I.444 J1.876 E.07303
G1 X101.139 Y127.271 E.02674
G2 X103.104 Y126.579 I.444 J-1.876 E.07303
G1 X103.759 Y126.109 E.02674
G3 X105.725 Y126.801 I.444 J1.876 E.07303
G1 X106.38 Y127.271 E.02674
G2 X108.345 Y126.579 I.444 J-1.876 E.07303
G1 X109.001 Y126.109 E.02674
G3 X110.966 Y126.801 I.444 J1.876 E.07303
G1 X111.621 Y127.271 E.02674
G2 X113.587 Y126.579 I.444 J-1.876 E.07303
G1 X114.242 Y126.109 E.02674
G3 X116.207 Y126.801 I.444 J1.876 E.07303
G1 X116.684 Y127.143 E.01944
G1 X118.173 Y127.143 E.04941
G3 X119.483 Y126.109 I6.436 J6.811 E.05542
G3 X121.449 Y126.801 I.444 J1.876 E.07303
G1 X122.104 Y127.271 E.02674
G2 X124.069 Y126.579 I.444 J-1.876 E.07303
G1 X124.725 Y126.109 E.02674
G3 X126.69 Y126.801 I.444 J1.876 E.07303
G1 X127.345 Y127.271 E.02674
G1 X128 Y127.349 E.02189
G1 X128.144 Y127.304 E.00498
G1 X128.144 Y127.143 E.00535
G1 X128.656 Y127.143 E.01699
G3 X129.966 Y126.109 I6.436 J6.811 E.05542
G3 X131.931 Y126.801 I.444 J1.876 E.07303
G1 X132.408 Y127.143 E.01944
G1 X132.858 Y127.143 E.01496
G1 X132.858 Y127.303 E.00533
G1 X133.242 Y127.349 E.0128
G1 X133.897 Y127.143 E.02278
G3 X135.207 Y126.109 I6.437 J6.812 E.05544
G3 X137.173 Y126.801 I.444 J1.876 E.07303
G1 X137.828 Y127.271 E.02674
G2 X139.793 Y126.579 I.444 J-1.876 E.07303
G1 X140.448 Y126.109 E.02674
G3 X142.414 Y126.801 I.444 J1.876 E.07303
G1 X143.069 Y127.271 E.02674
G2 X145.035 Y126.579 I.444 J-1.876 E.07303
G1 X145.69 Y126.109 E.02674
G3 X147.655 Y126.801 I.444 J1.876 E.07303
G1 X148.31 Y127.271 E.02674
G2 X149.644 Y127.123 I.51 J-1.491 E.04596
G1 X149.621 Y124.65 E.08204
G3 X147.655 Y123.958 I-.444 J-1.876 E.07303
G1 X147 Y123.489 E.02674
G2 X145.035 Y124.181 I-.444 J1.876 E.07303
G1 X144.379 Y124.65 E.02674
G3 X142.414 Y123.958 I-.444 J-1.876 E.07303
G1 X141.759 Y123.489 E.02674
G2 X139.793 Y124.181 I-.444 J1.876 E.07303
G1 X139.138 Y124.65 E.02674
G3 X137.173 Y123.958 I-.444 J-1.876 E.07303
G1 X136.517 Y123.489 E.02674
G2 X134.552 Y124.181 I-.444 J1.876 E.07303
G1 X133.897 Y124.65 E.02674
G1 X133.578 Y124.688 E.01064
G1 X133.578 Y122.002 E.08911
G1 X133.897 Y121.902 E.01107
G3 X135.207 Y120.868 I6.436 J6.81 E.05544
G3 X137.173 Y121.56 I.444 J1.876 E.07303
G1 X137.828 Y122.03 E.02674
G2 X139.793 Y121.337 I.444 J-1.876 E.07303
G1 X140.448 Y120.868 E.02674
G3 X142.414 Y121.56 I.444 J1.876 E.07303
G1 X143.069 Y122.03 E.02674
G2 X145.035 Y121.337 I.444 J-1.876 E.07303
G1 X145.69 Y120.868 E.02674
G3 X147.655 Y121.56 I.444 J1.876 E.07303
G1 X148.31 Y122.03 E.02674
G2 X149.644 Y121.882 I.51 J-1.491 E.04596
G1 X149.621 Y119.409 E.08204
G3 X147.655 Y118.717 I-.444 J-1.876 E.07303
G1 X147 Y118.247 E.02674
G2 X145.035 Y118.939 I-.444 J1.876 E.07303
G1 X144.379 Y119.409 E.02674
G3 X142.414 Y118.717 I-.444 J-1.876 E.07303
G1 X141.759 Y118.247 E.02674
G2 X139.793 Y118.939 I-.444 J1.876 E.07303
G1 X139.138 Y119.409 E.02674
G3 X137.173 Y118.717 I-.444 J-1.876 E.07303
G1 X136.517 Y118.247 E.02674
G2 X134.552 Y118.939 I-.444 J1.876 E.07303
G1 X133.897 Y119.409 E.02674
G1 X133.578 Y119.447 E.01064
G1 X133.578 Y117.818 E.05401
M204 S10000
G1 X141.122 Y114.15 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45937
G1 F8644.511
M204 S6000
G1 X141.705 Y114.668 E.02647
G1 X142.321 Y115.033 E.0243
G2 X143.83 Y115.408 I1.814 J-4.073 E.05304
G2 X145.416 Y115.148 I.085 J-4.446 E.05484
G1 X146.111 Y114.795 E.02644
G1 X146.722 Y114.312 E.02644
G1 X147.225 Y113.717 E.02643
G1 X147.6 Y113.034 E.02645
G1 X147.833 Y112.291 E.02643
G1 X147.914 Y111.516 E.02646
G1 X147.839 Y110.74 E.02645
G1 X147.613 Y109.995 E.02643
G1 X147.243 Y109.309 E.02643
G1 X146.744 Y108.71 E.02645
G1 X146.137 Y108.222 E.02645
G1 X145.445 Y107.863 E.02644
G1 X144.696 Y107.649 E.02645
G1 X143.927 Y107.584 E.02617
G1 X143.499 Y107.619 E.01459
G1 X142.77 Y107.786 E.02538
G1 X142.058 Y108.104 E.02644
G1 X141.424 Y108.556 E.02644
G1 X140.892 Y109.125 E.02644
G1 X140.483 Y109.788 E.02645
G1 X140.213 Y110.519 E.02644
G1 X140.094 Y111.287 E.02637
G1 X140.13 Y112.068 E.02654
G1 X140.319 Y112.824 E.02642
G1 X140.654 Y113.527 E.02643
G1 X141.086 Y114.102 E.02441
M204 S10000
G1 X141.698 Y114.14 F42000
; LINE_WIDTH: 0.44475
G1 F8959.026
M204 S6000
G1 X141.22 Y113.631 E.02285
G1 X140.853 Y113.038 E.02284
G1 X140.611 Y112.384 E.02285
G1 X140.503 Y111.695 E.02284
G1 X140.534 Y110.998 E.02285
G3 X141.419 Y109.131 I3.747 J.635 E.0685
G1 X141.94 Y108.667 E.02285
G1 X142.542 Y108.315 E.02283
G1 X143.202 Y108.089 E.02286
G1 X143.878 Y107.995 E.02235
G1 X144.603 Y108.056 E.02382
G1 X144.969 Y108.133 E.01225
G1 X145.582 Y108.373 E.02154
G1 X146.17 Y108.748 E.02285
G1 X146.672 Y109.233 E.02285
G1 X147.069 Y109.807 E.02284
G1 X147.343 Y110.448 E.02284
G1 X147.485 Y111.131 E.02285
G1 X147.489 Y111.829 E.02285
G1 X147.355 Y112.514 E.02285
G1 X147.088 Y113.158 E.02285
G1 X146.698 Y113.737 E.02284
G1 X146.201 Y114.227 E.02286
G1 X145.617 Y114.609 E.02285
G1 X144.969 Y114.867 E.02284
G1 X144.282 Y114.992 E.02285
G1 X143.585 Y114.98 E.02283
G1 X142.904 Y114.827 E.02286
G1 X142.266 Y114.545 E.02284
G1 X141.747 Y114.175 E.02088
; WIPE_START
G1 X142.266 Y114.545 E-.24237
G1 X142.904 Y114.827 E-.26508
G1 X143.553 Y114.972 E-.25255
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.311 Y107.344 Z1.6 F42000
G1 X143.307 Y107.233 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X141.828 Y107.757 I.758 J4.484 E.05232
G1 X141.786 Y107.784 E.00166
G2 X140.448 Y107.892 I-.556 J1.451 E.04603
G1 X139.793 Y108.457 E.02868
G3 X137.828 Y108.798 I-1.209 J-1.133 E.07101
G1 X137.173 Y108.234 E.02868
G2 X135.207 Y107.892 I-1.209 J1.133 E.07101
G1 X134.552 Y108.457 E.02868
G3 X132.587 Y108.798 I-1.209 J-1.133 E.07101
G1 X131.931 Y108.234 E.02868
G2 X129.966 Y107.892 I-1.209 J1.133 E.07101
G1 X129.311 Y108.457 E.02868
G3 X127.345 Y108.798 I-1.209 J-1.133 E.07101
G1 X126.69 Y108.234 E.02868
G2 X124.725 Y107.892 I-1.209 J1.133 E.07101
G1 X124.069 Y108.457 E.02868
G3 X122.104 Y108.798 I-1.209 J-1.133 E.07101
G1 X121.449 Y108.234 E.02868
G2 X119.483 Y107.892 I-1.209 J1.133 E.07101
G1 X118.828 Y108.457 E.02868
G3 X116.863 Y108.798 I-1.209 J-1.133 E.07101
G1 X116.207 Y108.234 E.02868
G2 X114.242 Y107.892 I-1.209 J1.133 E.07101
G1 X113.587 Y108.457 E.02868
G3 X111.621 Y108.798 I-1.209 J-1.133 E.07101
G1 X110.966 Y108.234 E.02868
G2 X109.001 Y107.892 I-1.209 J1.133 E.07101
G3 X107.69 Y108.926 I-6.437 J-6.812 E.05544
G1 X107.493 Y108.95 E.0066
G3 X108.284 Y110.908 I-3.362 J2.497 E.07082
G1 X108.345 Y110.855 E.0027
G3 X110.311 Y110.513 I1.209 J1.133 E.07101
G1 X110.966 Y111.077 E.02868
G2 X112.932 Y111.419 I1.209 J-1.133 E.07101
G1 X113.587 Y110.855 E.02868
G3 X115.552 Y110.513 I1.209 J1.133 E.07101
G1 X115.679 Y110.623 E.00557
G1 X119.152 Y110.623 E.11519
G1 X119.483 Y110.385 E.01352
G3 X120.794 Y110.513 I.513 J1.519 E.045
G1 X120.921 Y110.623 E.00557
G1 X124.393 Y110.623 E.11519
G1 X124.725 Y110.385 E.01352
G3 X126.035 Y110.513 I.513 J1.519 E.045
G1 X126.162 Y110.623 E.00557
G1 X129.635 Y110.623 E.11519
G1 X129.966 Y110.385 E.01352
G3 X131.276 Y110.513 I.513 J1.519 E.045
G1 X131.403 Y110.623 E.00557
G1 X133.578 Y110.623 E.07215
G1 X133.578 Y111.519 E.02974
G1 X133.897 Y111.419 E.01107
G1 X134.552 Y110.855 E.02868
G3 X136.517 Y110.513 I1.209 J1.133 E.07101
G1 X137.173 Y111.077 E.02868
G2 X139.138 Y111.419 I1.209 J-1.133 E.07101
G1 X139.714 Y110.923 E.02522
G2 X140.106 Y113.387 I4.396 J.564 E.08389
G1 X139.793 Y113.698 E.01464
G3 X137.828 Y114.04 I-1.209 J-1.133 E.07101
G1 X137.173 Y113.475 E.02868
G2 X135.207 Y113.134 I-1.209 J1.133 E.07101
G3 X133.897 Y114.168 I-6.438 J-6.813 E.05544
G1 X133.578 Y114.205 E.01064
G1 X133.578 Y116.76 E.08475
G1 X133.897 Y116.66 E.01107
G1 X134.552 Y116.096 E.02868
G3 X136.517 Y115.754 I1.209 J1.133 E.07101
G1 X137.173 Y116.319 E.02868
G2 X139.138 Y116.66 I1.209 J-1.133 E.07101
G1 X139.793 Y116.096 E.02868
G3 X141.759 Y115.754 I1.209 J1.133 E.07101
G1 X142.414 Y116.319 E.02868
G2 X144.379 Y116.66 I1.209 J-1.133 E.07101
G1 X145.035 Y116.096 E.02868
G3 X147 Y115.754 I1.209 J1.133 E.07101
G1 X147.655 Y116.319 E.02868
G2 X149.621 Y116.66 I1.209 J-1.133 E.07101
G1 X149.644 Y114.151 E.08324
G3 X147.79 Y113.591 I-.541 J-1.558 E.06867
G2 X148.327 Y111.549 I-3.754 J-2.08 E.07078
G2 X149.621 Y111.419 I.503 J-1.502 E.04444
G2 X149.259 Y108.969 I-6.651 J-.27 E.08262
G1 X148.966 Y109.004 E.00981
G1 X148.31 Y108.798 E.02278
G2 X147 Y107.765 I-6.437 J6.811 E.05544
G1 X146.345 Y107.687 E.02189
G1 X146.149 Y107.748 E.00681
G3 X147.323 Y108.726 I-2.28 J3.932 E.05091
G1 X147.379 Y108.799 E.00306
M204 S10000
G1 X146.726 Y106.061 F42000
G1 F8843.478
M204 S6000
G2 X145.207 Y105.49 I-2.868 J5.322 E.054
G2 X144.379 Y106.178 I3.433 J4.972 E.03575
G3 X142.414 Y105.836 I-.756 J-1.475 E.07101
G1 X141.862 Y105.361 E.02415
G1 X140.145 Y105.361 E.05695
G2 X139.138 Y106.178 I4.064 J6.043 E.04307
G3 X137.173 Y105.836 I-.756 J-1.475 E.07101
G1 X136.622 Y105.361 E.02413
G1 X134.903 Y105.362 E.05699
G2 X133.897 Y106.178 I4.06 J6.037 E.04304
G3 X131.931 Y105.836 I-.756 J-1.475 E.07101
G1 X131.381 Y105.362 E.0241
G1 X129.661 Y105.362 E.05704
G2 X128.656 Y106.178 I4.059 J6.034 E.04301
G3 X126.69 Y105.836 I-.756 J-1.475 E.07101
G1 X126.14 Y105.363 E.02407
G1 X124.419 Y105.363 E.05709
G2 X123.414 Y106.178 I4.055 J6.028 E.04298
G3 X121.449 Y105.836 I-.756 J-1.475 E.07101
G1 X120.9 Y105.363 E.02404
G1 X119.177 Y105.363 E.05713
G2 X118.173 Y106.178 I4.053 J6.024 E.04295
G3 X116.207 Y105.836 I-.756 J-1.475 E.07101
G1 X115.659 Y105.364 E.02401
G1 X113.935 Y105.364 E.05718
G2 X112.932 Y106.178 I4.05 J6.019 E.04292
G3 X110.966 Y105.836 I-.756 J-1.475 E.07101
G1 X110.418 Y105.364 E.02399
G1 X108.693 Y105.364 E.05723
G2 X107.69 Y106.178 I4.048 J6.015 E.04288
G3 X105.725 Y105.836 I-.756 J-1.475 E.07101
G1 X105.178 Y105.365 E.02396
G2 X103.407 Y105.396 I-.726 J9.012 E.05882
G2 X102.449 Y106.178 I3.893 J5.753 E.04108
G3 X101.017 Y106.219 I-.759 J-1.493 E.04909
G2 X99.421 Y107.716 I3.014 J4.813 E.07307
G1 X99.828 Y107.765 E.01361
G3 X100.842 Y108.543 I-3.844 J6.056 E.04244
G1 X100.835 Y108.549 E.00029
G2 X99.792 Y110.502 I3.281 J3.008 E.07423
G2 X98.385 Y110.481 I-.726 J1.458 E.04829
G3 X98.766 Y108.904 I10.34 J1.666 E.05388
M204 S10000
G1 X100.871 Y114.485 F42000
G1 F8843.478
M204 S6000
G3 X100.303 Y113.748 I3.813 J-3.527 E.03092
G2 X99.828 Y113.006 I-1.678 J.55 E.02953
G2 X98.518 Y113.134 I-.513 J1.519 E.045
G1 X98.359 Y113.271 E.00696
G1 X98.36 Y115.74 E.08191
G1 X98.518 Y115.627 E.00647
G3 X99.828 Y115.754 I.513 J1.519 E.045
G1 X100.484 Y116.319 E.02868
G2 X102.449 Y116.66 I1.209 J-1.133 E.07101
G3 X103.519 Y115.799 I5.353 J5.553 E.04562
G1 X103.823 Y115.823 E.01013
G3 X105.07 Y115.754 I1.607 J17.917 E.04142
G1 X105.725 Y116.319 E.02868
G2 X107.69 Y116.66 I1.209 J-1.133 E.07101
G1 X108.345 Y116.096 E.02868
G3 X110.311 Y115.754 I1.209 J1.133 E.07101
G1 X110.966 Y116.319 E.02868
G2 X112.932 Y116.66 I1.209 J-1.133 E.07101
G3 X114.242 Y115.627 I6.437 J6.812 E.05544
G1 X114.424 Y115.605 E.00607
G1 X114.424 Y113.077 E.08387
G1 X114.242 Y113.134 E.00632
G1 X113.587 Y113.698 E.02868
G3 X111.621 Y114.04 I-1.209 J-1.133 E.07101
G1 X110.966 Y113.475 E.02868
G2 X109.001 Y113.134 I-1.209 J1.133 E.07101
G3 X107.69 Y114.168 I-6.437 J-6.812 E.05544
G1 X107.375 Y114.205 E.01052
G2 X108.137 Y112.776 I-3.595 J-2.832 E.05398
M204 S10000
G1 X107.225 Y113.717 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459352
G1 F8644.878
M204 S6000
G1 X107.6 Y113.034 E.02645
G1 X107.833 Y112.291 E.02643
G1 X107.914 Y111.516 E.02645
G1 X107.839 Y110.74 E.02644
G1 X107.613 Y109.995 E.02643
G1 X107.243 Y109.309 E.02643
G1 X106.744 Y108.71 E.02645
G1 X106.137 Y108.222 E.02645
G1 X105.445 Y107.863 E.02644
G1 X104.696 Y107.649 E.02645
G1 X103.944 Y107.585 E.02559
G1 X103.499 Y107.619 E.01516
G1 X102.77 Y107.786 E.02538
G1 X102.058 Y108.104 E.02644
G1 X101.424 Y108.556 E.02643
G1 X100.892 Y109.125 E.02644
G1 X100.483 Y109.788 E.02645
G1 X100.213 Y110.519 E.02643
G1 X100.094 Y111.287 E.02637
G1 X100.13 Y112.068 E.02654
G1 X100.319 Y112.824 E.02642
G1 X100.654 Y113.527 E.02642
G1 X101.122 Y114.15 E.02644
G1 X101.705 Y114.668 E.02648
G1 X102.321 Y115.033 E.0243
G2 X103.83 Y115.408 I1.814 J-4.072 E.05303
G2 X105.416 Y115.148 I.085 J-4.445 E.05484
G1 X106.111 Y114.795 E.02644
G1 X106.722 Y114.312 E.02644
G1 X107.186 Y113.763 E.02439
M204 S10000
G1 X106.698 Y113.737 F42000
; LINE_WIDTH: 0.444749
G1 F8959.042
M204 S6000
G1 X106.201 Y114.227 E.02285
G1 X105.617 Y114.609 E.02285
G1 X104.969 Y114.867 E.02284
G1 X104.283 Y114.992 E.02285
G1 X103.585 Y114.98 E.02283
G1 X102.904 Y114.827 E.02285
G1 X102.266 Y114.545 E.02284
G1 X101.698 Y114.14 E.02285
G1 X101.22 Y113.631 E.02285
G1 X100.853 Y113.038 E.02284
G1 X100.611 Y112.384 E.02285
G1 X100.503 Y111.695 E.02285
G1 X100.534 Y110.998 E.02285
G3 X101.419 Y109.131 I3.748 J.636 E.0685
G1 X101.94 Y108.667 E.02284
G1 X102.542 Y108.315 E.02284
G1 X103.205 Y108.088 E.02296
G1 X103.894 Y107.994 E.02275
G1 X104.603 Y108.056 E.02333
G1 X104.969 Y108.133 E.01225
G1 X105.582 Y108.373 E.02155
G1 X106.17 Y108.748 E.02284
G1 X106.672 Y109.233 E.02285
G1 X107.068 Y109.807 E.02284
G1 X107.343 Y110.448 E.02284
G1 X107.485 Y111.131 E.02285
G1 X107.489 Y111.829 E.02285
G1 X107.355 Y112.514 E.02284
G1 X107.088 Y113.158 E.02285
G1 X106.731 Y113.687 E.02087
M204 S10000
G1 X115.233 Y127.143 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.144 Y127.143 E.00298
G1 X115.144 Y128.681 E.05104
G1 X114.897 Y128.652 E.00824
G1 X114.242 Y128.858 E.02278
G1 X113.587 Y129.422 E.02868
G3 X111.621 Y129.764 I-1.209 J-1.133 E.07101
G1 X110.966 Y129.199 E.02868
G2 X109.001 Y128.858 I-1.209 J1.133 E.07101
G1 X108.345 Y129.422 E.02868
G3 X106.38 Y129.764 I-1.209 J-1.133 E.07101
G1 X105.725 Y129.199 E.02868
G2 X103.759 Y128.858 I-1.209 J1.133 E.07101
G1 X103.104 Y129.422 E.02868
G3 X101.139 Y129.764 I-1.209 J-1.133 E.07101
G1 X100.484 Y129.199 E.02868
G2 X98.518 Y128.858 I-1.209 J1.133 E.07101
G1 X98.362 Y128.992 E.00681
G1 X98.363 Y131.462 E.08193
G1 X98.518 Y131.35 E.00633
G3 X99.828 Y131.478 I.513 J1.519 E.045
G1 X100.484 Y132.043 E.02868
G2 X102.449 Y132.384 I1.209 J-1.133 E.07101
G1 X103.104 Y131.82 E.02868
G3 X105.07 Y131.478 I1.209 J1.133 E.07101
G1 X105.725 Y132.043 E.02868
G2 X107.69 Y132.384 I1.209 J-1.133 E.07101
G1 X108.345 Y131.82 E.02868
G3 X110.311 Y131.478 I1.209 J1.133 E.07101
G1 X110.966 Y132.043 E.02868
G2 X112.932 Y132.384 I1.209 J-1.133 E.07101
G3 X114.242 Y131.35 I6.436 J6.81 E.05544
G1 X114.897 Y131.272 E.02189
G1 X115.144 Y131.35 E.00857
G1 X115.144 Y129.722 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X115.144 Y131.35 E-.61876
G1 X114.897 Y131.272 E-.09821
G1 X114.785 Y131.286 E-.04303
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/53
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S186.15
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I-.84 J.881 P1  F42000
G1 X126.84 Y142.781 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G1 X126.858 Y143 E.0073
G3 X124.005 Y143.87 I-1.559 J-.001 E.13182
G3 X123.999 Y142.133 I-1.301 J-.864 E.26436
G3 X125.107 Y141.452 I1.32 J.905 E.04441
G3 X126.827 Y142.692 I.192 J1.548 E.07737
G1 X126.831 Y142.721 E.00098
M204 S10000
G1 X126.436 Y142.821 F42000
G1 F5400
M204 S6000
G1 X126.453 Y143 E.00597
G3 X125.157 Y141.856 I-1.152 J-.001 E.17529
G1 X125.272 Y141.848 E.00382
G3 X126.428 Y142.762 I.029 J1.152 E.05304
M204 S250
G1 X126.047 Y142.86 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.061 Y143 E.00432
G3 X125.206 Y142.246 I-.76 J0 E.10708
G1 X125.282 Y142.24 E.00233
G3 X126.035 Y142.801 I.019 J.76 E.03109
; WIPE_START
M204 S6000
G1 X126.061 Y143 E-.07615
G1 X126.046 Y143.154 E-.05893
G1 X126.011 Y143.273 E-.04709
G1 X125.952 Y143.393 E-.05051
G1 X125.858 Y143.517 E-.05929
G1 X125.745 Y143.617 E-.05751
G1 X125.614 Y143.693 E-.05756
G1 X125.47 Y143.741 E-.0575
G1 X125.32 Y143.76 E-.05753
G1 X125.169 Y143.749 E-.05749
G1 X125.023 Y143.708 E-.05759
G1 X124.827 Y143.594 E-.08609
G1 X124.758 Y143.527 E-.03675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.42 Y141.888 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.557 Y141.856 E.00467
G1 X122.672 Y141.848 E.00382
G3 X122.334 Y141.907 I.029 J1.152 E.22868
G1 X122.362 Y141.901 E.00095
M204 S250
G1 X122.507 Y142.268 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.606 Y142.246 E.00313
G1 X122.682 Y142.24 E.00233
G3 X122.449 Y142.283 I.019 J.76 E.13937
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.06146
G1 X122.682 Y142.24 E-.02887
G1 X122.833 Y142.251 E-.05748
G1 X122.979 Y142.292 E-.05757
G1 X123.114 Y142.361 E-.05757
G1 X123.232 Y142.456 E-.05752
G1 X123.329 Y142.572 E-.05744
G1 X123.402 Y142.705 E-.05752
G1 X123.446 Y142.849 E-.05761
G1 X123.461 Y143 E-.05751
G1 X123.446 Y143.154 E-.05895
G1 X123.411 Y143.273 E-.04709
G1 X123.352 Y143.393 E-.05051
G1 X123.269 Y143.504 E-.05289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.897 Y143.739 Z1.8 F42000
G1 X146.877 Y144.23 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.895 Y144.43 E.00665
G3 X143.64 Y141.622 I-2.895 J.065 E.44276
G1 X143.929 Y141.601 E.0096
G3 X146.84 Y143.926 I.072 J2.894 E.13425
G1 X146.87 Y144.171 E.00819
M204 S10000
G1 X146.474 Y144.275 F42000
G1 F5400
M204 S6000
G1 X146.489 Y144.442 E.00556
G3 X143.691 Y142.027 I-2.488 J.054 E.38049
G1 X143.939 Y142.008 E.00825
G3 X146.441 Y144.007 I.062 J2.488 E.11539
G1 X146.467 Y144.215 E.00697
M204 S250
G1 X146.085 Y144.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X146.097 Y144.453 E.00418
G3 X143.74 Y142.416 I-2.096 J.044 E.2969
G1 X143.949 Y142.4 E.00644
G3 X146.057 Y144.084 I.052 J2.096 E.09005
G1 X146.078 Y144.258 E.00536
; WIPE_START
M204 S6000
G1 X146.097 Y144.453 E-.07453
G1 X146.091 Y144.71 E-.09767
G1 X146.06 Y144.916 E-.07938
G1 X145.936 Y145.316 E-.15881
G1 X145.736 Y145.683 E-.15899
G1 X145.501 Y145.969 E-.14097
G1 X145.404 Y146.057 E-.04964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.561 Y139.108 Z1.8 F42000
G1 X148.902 Y138.358 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X148.92 Y138.322 E.00132
G3 X151.914 Y136.492 I3.081 J1.676 E.1219
G1 X152.088 Y136.492 E.0058
G3 X148.768 Y138.637 I-.087 J3.506 E.5917
G1 X148.876 Y138.412 E.00829
M204 S10000
G1 X149.268 Y138.534 F42000
G1 F5400
M204 S6000
G1 X149.277 Y138.517 E.00065
G3 X151.924 Y136.899 I2.724 J1.481 E.10776
G1 X152.078 Y136.899 E.00513
G3 X149.144 Y138.796 I-.077 J3.099 E.52304
G1 X149.242 Y138.588 E.00762
M204 S250
G1 X149.622 Y138.705 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X151.934 Y137.291 I2.379 J1.294 E.0872
G1 X152.069 Y137.291 E.00415
G3 X149.594 Y138.758 I-.068 J2.708 E.4297
; WIPE_START
M204 S6000
G1 X149.762 Y138.473 E-.12547
G1 X149.925 Y138.258 E-.1027
G1 X150.11 Y138.059 E-.1033
G1 X150.531 Y137.723 E-.20446
G1 X150.765 Y137.588 E-.10259
G1 X151.011 Y137.477 E-.10272
G1 X151.058 Y137.462 E-.01876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.461 Y129.998 Z1.8 F42000
G1 X144.913 Y108.751 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.06 Y108.8 E.00515
G3 X143.64 Y108.622 I-1.06 J2.695 E.55549
G1 X143.929 Y108.601 E.0096
G3 X144.786 Y108.708 I.072 J2.894 E.02878
G1 X144.856 Y108.732 E.00244
M204 S10000
G1 X144.784 Y109.136 F42000
G1 F5400
M204 S6000
G1 X144.912 Y109.18 E.00448
G3 X143.691 Y109.027 I-.911 J2.316 E.47744
G1 X143.939 Y109.008 E.00825
G3 X144.676 Y109.101 I.062 J2.488 E.02474
G1 X144.727 Y109.117 E.00177
M204 S250
G1 X144.669 Y109.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X144.768 Y109.545 E.00318
M73 P47 R17
G3 X143.74 Y109.416 I-.767 J1.951 E.37262
G1 X143.949 Y109.4 E.00644
G3 X144.366 Y109.432 I.052 J2.096 E.01287
G1 X144.611 Y109.501 E.00783
; WIPE_START
M204 S6000
G1 X144.768 Y109.545 E-.06207
G1 X145.141 Y109.736 E-.15893
G1 X145.468 Y109.997 E-.15897
G1 X145.736 Y110.317 E-.15892
G1 X145.936 Y110.684 E-.15899
G1 X145.985 Y110.841 E-.06212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.355 Y111.059 Z1.8 F42000
G1 X116.291 Y111.691 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.756 Y111.33 Z1.8 F42000
G1 X101.614 Y109.859 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.691 Y109.75 E.00443
G3 X103.64 Y108.622 I2.31 J1.745 E.07673
G1 X103.929 Y108.601 E.0096
G3 X101.528 Y109.989 I.072 J2.894 E.50754
G1 X101.581 Y109.909 E.00316
M204 S10000
G1 X101.95 Y110.088 F42000
G1 F5400
M204 S6000
G1 X102.015 Y109.996 E.00376
G3 X103.691 Y109.027 I1.986 J1.5 E.06595
G1 X103.939 Y109.008 E.00825
G3 X101.876 Y110.201 I.062 J2.488 E.43623
M73 P47 R16
G1 X101.917 Y110.138 E.00249
M204 S250
G1 X102.284 Y110.301 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X102.328 Y110.233 E.00251
G3 X103.74 Y109.416 I1.673 J1.264 E.05147
G1 X103.949 Y109.4 E.00644
G3 X102.11 Y110.59 I.052 J2.096 E.33402
G1 X102.253 Y110.353 E.0085
; WIPE_START
M204 S6000
G1 X102.328 Y110.233 E-.05379
G1 X102.611 Y109.925 E-.15888
G1 X102.951 Y109.681 E-.15894
G1 X103.332 Y109.509 E-.15898
G1 X103.74 Y109.416 E-.15879
G1 X103.925 Y109.402 E-.07063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.246 Y117.028 Z1.8 F42000
G1 X105.294 Y141.905 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.324 Y141.92 E.00111
G3 X103.64 Y141.622 I-1.323 J2.575 E.54588
G1 X103.929 Y141.601 E.0096
G3 X105.06 Y141.8 I.072 J2.894 E.03837
G1 X105.239 Y141.881 E.0065
M204 S10000
G1 X105.126 Y142.276 F42000
G1 F5400
M204 S6000
G1 X105.138 Y142.282 E.00044
G3 X103.691 Y142.027 I-1.137 J2.213 E.46918
G1 X103.939 Y142.008 E.00825
G3 X104.912 Y142.18 I.062 J2.488 E.03298
G1 X105.072 Y142.252 E.00582
M204 S250
G1 X104.95 Y142.638 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X105.14 Y142.736 E.00658
G3 X103.74 Y142.416 I-1.139 J1.76 E.35975
G1 X103.949 Y142.4 E.00644
G3 X104.768 Y142.545 I.052 J2.096 E.02574
G1 X104.897 Y142.611 E.00443
; WIPE_START
M204 S6000
G1 X105.14 Y142.736 E-.10411
G1 X105.468 Y142.997 E-.15896
G1 X105.736 Y143.317 E-.15891
G1 X105.936 Y143.684 E-.15899
G1 X106.06 Y144.084 E-.15881
G1 X106.065 Y144.137 E-.02022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.503 Y142.422 Z1.8 F42000
G1 X149.992 Y134.009 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.304 J5.983 E.61447
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.167 J-3.728 E.04473
G3 X143.988 Y150.991 I-5.57 J-2.305 E.23521
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.148 Y105.013 E1.33132
G3 X149.992 Y111.013 I-.162 J6.004 E.30744
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.325 J6.39 E.65604
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.159 J-3.806 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.158 Y104.606 E1.33182
G3 X150.399 Y111.008 I-.173 J6.412 E.32814
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.63463
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.585 J-1.836 E.27203
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.168 Y104.214 E1.23412
G3 X150.791 Y111.003 I-.184 J6.805 E.32242
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
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


G1 X153.225 Y134.521 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382951
G1 F10587.266
M204 S6000
G2 X151.976 Y134.372 I-1.202 J4.751 E.03497
G1 X149.788 Y134.372 E.06061
G1 X149.657 Y134.345 E.00373
G1 X149.629 Y134.213 E.00373
G1 X149.629 Y111.015 E.64276
G1 X149.569 Y110.186 E.02304
G2 X147.358 Y106.483 I-5.567 J.814 E.12263
G1 X146.68 Y106.053 E.02225
G1 X146.153 Y105.808 E.01609
G1 X145.371 Y105.549 E.02282
G2 X144.133 Y105.376 I-1.646 J7.248 E.03469
G1 X103.725 Y105.379 E1.11963
G2 X102.109 Y105.708 I.371 J5.974 E.04585
G1 X101.359 Y106.032 E.02264
G2 X98.377 Y111.018 I2.676 J4.985 E.16905
G1 X98.373 Y144.974 E.94087
G2 X101.849 Y150.192 I5.624 J.02 E.18428
G1 X102.622 Y150.455 E.02263
G2 X103.733 Y150.621 I1.756 J-7.986 E.03114
G1 X143.978 Y150.628 E1.11511
G1 X144.557 Y150.593 E.01607
G1 X145.367 Y150.452 E.02281
G1 X146.15 Y150.2 E.02277
G2 X148.177 Y148.762 I-2.347 J-5.455 E.06937
G1 X148.688 Y148.113 E.02289
G2 X149.211 Y147.124 I-6.913 J-4.288 E.03103
G1 X149.679 Y145.737 E.04057
G1 X149.727 Y145.645 E.00287
G1 X149.829 Y145.629 E.00287
G1 X152.279 Y145.62 E.06788
G1 X152.838 Y145.558 E.01557
G1 X153.649 Y145.38 E.023
G1 X153.892 Y145.293 E.00717
M204 S10000
G1 X154.312 Y145.145 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X154.146 Y144.814 E.01228
G3 X152.965 Y145.174 I-2.685 J-6.69 E.04101
G3 X152.241 Y144.571 I3.81 J-5.3 E.03128
G2 X150.276 Y144.944 I-.731 J1.51 E.07111
G1 X149.896 Y145.266 E.01651
G1 X149.455 Y145.267 E.01464
G1 X149.35 Y145.579 E.0109
G1 X148.966 Y145.692 E.01329
G1 X148.31 Y145.602 E.02194
G1 X148.028 Y145.396 E.0116
G3 X147.134 Y147.185 I-3.969 J-.864 E.06703
G3 X148.263 Y148.079 I-5.614 J8.252 E.0478
G3 X146.461 Y149.652 I-4.221 J-3.016 E.08009
G1 X146.345 Y149.618 E.004
G1 X145.69 Y149.708 E.02194
G1 X145.092 Y150.144 E.02453
G3 X142.295 Y150.265 I-1.925 J-12.08 E.09309
G2 X140.448 Y149.708 I-1.367 J1.193 E.06744
G2 X139.7 Y150.265 I3.471 J5.452 E.03097
G1 X137.052 Y150.264 E.08783
G2 X135.207 Y149.708 I-1.366 J1.194 E.06738
G2 X134.46 Y150.264 I3.464 J5.442 E.03092
G1 X131.81 Y150.263 E.08791
G2 X129.966 Y149.708 I-1.365 J1.194 E.06733
G2 X129.22 Y150.263 I3.461 J5.438 E.03086
G1 X126.567 Y150.262 E.08799
G2 X124.725 Y149.708 I-1.364 J1.194 E.06728
G2 X123.979 Y150.262 I3.454 J5.429 E.03081
G1 X121.325 Y150.261 E.08806
G2 X119.483 Y149.708 I-1.362 J1.194 E.06723
G2 X118.739 Y150.261 I3.448 J5.42 E.03076
G1 X116.082 Y150.26 E.08814
G2 X114.242 Y149.708 I-1.361 J1.195 E.06718
G2 X113.499 Y150.26 I3.441 J5.411 E.03071
G1 X110.84 Y150.259 E.08822
G2 X109.001 Y149.708 I-1.36 J1.195 E.06713
G2 X108.259 Y150.259 I3.435 J5.402 E.03066
G1 X105.597 Y150.258 E.08829
G2 X103.759 Y149.708 I-1.359 J1.195 E.06708
G1 X103.108 Y150.183 E.02675
G3 X101.571 Y149.667 I.874 J-5.146 E.05399
; WIPE_START
G1 X102.219 Y149.954 E-.26934
G1 X103.108 Y150.183 E-.34873
G1 X103.409 Y149.963 E-.14194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.78 Y143.115 Z1.8 F42000
G1 X107.103 Y142.458 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455366
G1 F8728.412
M204 S6000
G1 X106.637 Y141.885 E.02484
M73 P48 R16
G1 X106.066 Y141.414 E.02487
G1 X105.414 Y141.066 E.02485
G1 X104.705 Y140.854 E.02485
G1 X103.97 Y140.786 E.02484
G1 X103.23 Y140.865 E.02501
G1 X102.803 Y140.985 E.01488
G1 X102.158 Y141.276 E.02379
G1 X101.556 Y141.706 E.02486
G1 X101.051 Y142.245 E.02485
G1 X100.663 Y142.875 E.02485
G1 X100.407 Y143.568 E.02484
G1 X100.293 Y144.299 E.02485
G1 X100.327 Y145.038 E.02486
G1 X100.507 Y145.755 E.02485
G1 X100.825 Y146.423 E.02485
G1 X101.268 Y147.014 E.02485
G1 X101.821 Y147.505 E.02485
G1 X102.459 Y147.878 E.02485
G1 X103.16 Y148.116 E.02486
G1 X103.893 Y148.21 E.02484
G2 X105.204 Y148.007 I.061 J-3.943 E.04481
G1 X105.959 Y147.655 E.02801
G1 X106.584 Y147.171 E.02656
G1 X107.037 Y146.639 E.02348
G1 X107.399 Y145.998 E.02474
G1 X107.628 Y145.295 E.02484
G2 X107.716 Y144.515 I-7.489 J-1.237 E.02639
G1 X107.653 Y143.829 E.02316
G1 X107.446 Y143.114 E.02503
G1 X107.131 Y142.512 E.02285
M204 S10000
G1 X106.722 Y142.62 F42000
; LINE_WIDTH: 0.448594
G1 F8874.123
M204 S6000
G1 X107.041 Y143.197 E.02178
G1 X107.239 Y143.825 E.02176
G1 X107.305 Y144.513 E.02286
G1 X107.247 Y145.137 E.02074
G1 X107.057 Y145.766 E.0217
G1 X106.745 Y146.346 E.02178
G1 X106.375 Y146.799 E.01933
G1 X105.815 Y147.266 E.02411
G1 X105.196 Y147.58 E.02293
G3 X104.308 Y147.789 I-1.655 J-5.046 E.03019
G1 X103.613 Y147.781 E.02299
G1 X102.968 Y147.638 E.02182
G1 X102.366 Y147.371 E.02176
G1 X101.83 Y146.99 E.02175
G1 X101.38 Y146.511 E.02175
G1 X101.033 Y145.951 E.02176
G1 X100.804 Y145.335 E.02174
G1 X100.702 Y144.685 E.02175
G1 X100.731 Y144.028 E.02174
G1 X100.89 Y143.389 E.02176
G1 X101.172 Y142.794 E.02175
G1 X101.593 Y142.238 E.02306
G1 X102.056 Y141.829 E.02044
G1 X102.624 Y141.497 E.02176
G1 X103.245 Y141.279 E.02175
G1 X103.898 Y141.193 E.02177
G1 X104.555 Y141.239 E.02177
G1 X105.19 Y141.414 E.02177
G1 X105.778 Y141.711 E.02177
G1 X106.296 Y142.118 E.02179
G1 X106.683 Y142.574 E.01978
M204 S10000
G1 X98.738 Y135.016 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X98.737 Y136.644 E.05401
G1 X99.173 Y136.515 E.01507
G1 X99.828 Y136.605 E.02194
G3 X101.139 Y137.636 I-6.476 J9.575 E.05536
G2 X103.104 Y137.263 I.731 J-1.51 E.0711
G1 X103.759 Y136.709 E.02846
G3 X105.725 Y137.082 I.731 J1.51 E.07111
G1 X106.38 Y137.636 E.02846
G2 X108.345 Y137.263 I.731 J-1.51 E.07111
G1 X109.001 Y136.709 E.02846
G3 X110.966 Y137.082 I.731 J1.51 E.07111
G1 X111.621 Y137.636 E.02846
G2 X113.587 Y137.263 I.731 J-1.51 E.0711
G1 X114.242 Y136.709 E.02846
G3 X116.207 Y137.082 I.731 J1.51 E.07111
G1 X116.863 Y137.636 E.02846
G2 X118.828 Y137.263 I.731 J-1.51 E.07111
G1 X119.483 Y136.709 E.02846
G3 X121.449 Y137.082 I.731 J1.51 E.07111
G1 X122.104 Y137.636 E.02846
G2 X124.069 Y137.263 I.731 J-1.51 E.07111
G1 X124.725 Y136.709 E.02846
G3 X126.69 Y137.082 I.731 J1.51 E.07111
G1 X127.345 Y137.636 E.02846
G2 X129.311 Y137.263 I.731 J-1.51 E.0711
G1 X129.966 Y136.709 E.02846
G3 X131.931 Y137.082 I.731 J1.51 E.07111
G1 X132.587 Y137.636 E.02846
G2 X134.552 Y137.263 I.731 J-1.51 E.07111
G1 X135.207 Y136.709 E.02846
G3 X137.173 Y137.082 I.731 J1.51 E.07111
G1 X137.828 Y137.636 E.02846
G2 X139.793 Y137.263 I.731 J-1.51 E.0711
G1 X140.448 Y136.709 E.02846
G3 X142.414 Y137.082 I.731 J1.51 E.07111
G1 X143.069 Y137.636 E.02846
G2 X145.035 Y137.263 I.731 J-1.51 E.07111
G1 X145.69 Y136.709 E.02846
G3 X147.655 Y137.082 I.731 J1.51 E.07111
G1 X148.31 Y137.636 E.02846
G1 X148.46 Y137.681 E.00519
G2 X147.767 Y139.965 I4.032 J2.471 E.08005
G3 X147 Y139.329 I4.011 J-5.622 E.03307
G2 X145.035 Y139.703 I-.731 J1.51 E.07111
G1 X144.379 Y140.257 E.02846
G3 X142.414 Y139.883 I-.731 J-1.51 E.0711
G1 X141.759 Y139.329 E.02846
G2 X139.793 Y139.703 I-.731 J1.51 E.07111
G1 X139.138 Y140.257 E.02846
G3 X137.173 Y139.883 I-.731 J-1.51 E.0711
G1 X136.517 Y139.329 E.02846
G2 X134.552 Y139.703 I-.731 J1.51 E.07111
G1 X133.897 Y140.257 E.02846
G3 X131.931 Y139.883 I-.731 J-1.51 E.07111
G1 X131.276 Y139.329 E.02846
G2 X129.311 Y139.703 I-.731 J1.51 E.07111
G1 X128.656 Y140.257 E.02846
G3 X126.69 Y139.883 I-.731 J-1.51 E.0711
G1 X126.035 Y139.329 E.02846
G2 X124.069 Y139.703 I-.731 J1.51 E.07111
G1 X123.414 Y140.257 E.02846
G3 X122.609 Y140.291 I-.484 J-1.925 E.02693
G2 X122.093 Y140.353 I.933 J9.92 E.01724
G3 X120.794 Y139.329 I6.425 J-9.493 E.05491
G2 X118.828 Y139.703 I-.731 J1.51 E.07111
G1 X118.173 Y140.257 E.02846
G3 X116.207 Y139.883 I-.731 J-1.51 E.07111
G1 X115.552 Y139.329 E.02846
G2 X113.587 Y139.703 I-.731 J1.51 E.07111
G1 X112.932 Y140.257 E.02846
G3 X110.966 Y139.883 I-.731 J-1.51 E.0711
G1 X110.311 Y139.329 E.02846
G2 X108.345 Y139.703 I-.731 J1.51 E.07111
G1 X107.69 Y140.257 E.02846
G3 X105.725 Y139.883 I-.731 J-1.51 E.07111
G1 X105.07 Y139.329 E.02846
G2 X103.104 Y139.703 I-.731 J1.51 E.07111
G1 X102.449 Y140.257 E.02846
G3 X100.484 Y139.883 I-.731 J-1.51 E.0711
G1 X99.828 Y139.329 E.02846
G1 X99.173 Y139.136 E.02266
G1 X98.737 Y139.196 E.01461
G1 X98.736 Y141.886 E.08923
G1 X99.173 Y141.756 E.01511
G1 X99.828 Y141.846 E.02194
G3 X100.49 Y142.329 I-2.976 J4.772 E.02721
G1 X100.484 Y142.339 E.00038
G2 X99.878 Y144.612 I3.61 J2.18 E.0791
G1 X99.173 Y144.377 E.02464
G1 X98.736 Y144.437 E.01465
G2 X99.173 Y146.998 I5.669 J.349 E.08694
G1 X99.828 Y147.088 E.02194
G3 X101.139 Y148.119 I-6.476 J9.575 E.05536
G1 X101.794 Y148.313 E.02266
G1 X102.294 Y148.259 E.01669
G2 X106.218 Y147.982 I1.704 J-3.799 E.13589
G1 X106.38 Y148.119 E.00706
G2 X108.345 Y147.745 I.731 J-1.51 E.07111
G1 X109.001 Y147.191 E.02846
G3 X110.966 Y147.565 I.731 J1.51 E.07111
G1 X111.621 Y148.119 E.02846
G2 X113.587 Y147.745 I.731 J-1.51 E.0711
G1 X114.242 Y147.191 E.02846
G3 X116.207 Y147.565 I.731 J1.51 E.07111
G1 X116.863 Y148.119 E.02846
G2 X118.828 Y147.745 I.731 J-1.51 E.07111
G1 X119.483 Y147.191 E.02846
G3 X121.449 Y147.565 I.731 J1.51 E.07111
G1 X122.104 Y148.119 E.02846
G2 X124.069 Y147.745 I.731 J-1.51 E.07111
G1 X124.725 Y147.191 E.02846
G3 X126.69 Y147.565 I.731 J1.51 E.07111
G1 X127.345 Y148.119 E.02846
G2 X129.311 Y147.745 I.731 J-1.51 E.0711
G1 X129.966 Y147.191 E.02846
G3 X131.931 Y147.565 I.731 J1.51 E.07111
G1 X132.587 Y148.119 E.02846
G2 X134.552 Y147.745 I.731 J-1.51 E.07111
G1 X135.207 Y147.191 E.02846
G3 X137.173 Y147.565 I.731 J1.51 E.07111
G1 X137.828 Y148.119 E.02846
G2 X139.793 Y147.745 I.731 J-1.51 E.0711
G1 X140.448 Y147.191 E.02846
G1 X140.792 Y147.09 E.01187
G3 X139.894 Y144.871 I3.22 J-2.593 E.08055
G2 X139.138 Y145.498 I3.96 J5.54 E.03262
G3 X137.173 Y145.125 I-.731 J-1.51 E.0711
G1 X136.517 Y144.571 E.02846
G2 X134.552 Y144.944 I-.731 J1.51 E.07111
G1 X133.897 Y145.498 E.02846
G3 X131.931 Y145.125 I-.731 J-1.51 E.07111
G1 X131.276 Y144.571 E.02846
G2 X129.311 Y144.944 I-.731 J1.51 E.07111
G1 X128.656 Y145.498 E.02846
G3 X126.833 Y145.229 I-.74 J-1.296 E.06586
G2 X128.007 Y143.071 I-1.523 J-2.226 E.08462
G1 X128.656 Y142.982 E.02172
G2 X129.966 Y141.95 I-6.475 J-9.574 E.05536
G3 X131.931 Y142.324 I.731 J1.51 E.07111
G1 X132.587 Y142.878 E.02846
G2 X134.552 Y142.504 I.731 J-1.51 E.07111
G1 X135.207 Y141.95 E.02846
G3 X137.173 Y142.324 I.731 J1.51 E.07111
G1 X137.828 Y142.878 E.02846
G2 X139.793 Y142.504 I.731 J-1.51 E.0711
G1 X140.448 Y141.95 E.02846
G1 X140.86 Y141.828 E.01424
G3 X142.129 Y140.826 I3.143 J2.674 E.05397
M204 S10000
G1 X141.32 Y141.93 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.454871
G1 F8738.92
M204 S6000
G1 X140.864 Y142.512 E.02482
G1 X140.533 Y143.173 E.02482
G1 X140.338 Y143.887 E.02484
G1 X140.29 Y144.624 E.02482
G1 X140.388 Y145.357 E.02482
G1 X140.629 Y146.056 E.02482
G1 X141.005 Y146.694 E.02484
G1 X141.499 Y147.244 E.02482
G1 X142.092 Y147.685 E.02483
G1 X142.761 Y148.001 E.02483
G1 X143.479 Y148.177 E.0248
G1 X144.263 Y148.206 E.02634
G1 X144.991 Y148.077 E.02482
G1 X145.68 Y147.811 E.02481
G1 X146.303 Y147.412 E.02484
G2 X147.545 Y145.609 I-2.494 J-3.046 E.07445
G1 X147.695 Y144.885 E.02482
G1 X147.696 Y144.146 E.02481
G1 X147.554 Y143.421 E.0248
G1 X147.269 Y142.738 E.02484
G1 X146.856 Y142.126 E.02482
G1 X146.329 Y141.607 E.02482
G1 X145.709 Y141.203 E.02484
G1 X145.022 Y140.93 E.0248
G1 X144.285 Y140.797 E.02515
G2 X142.529 Y141.091 I-.224 J4.06 E.06023
G1 X141.883 Y141.45 E.02483
G1 X141.366 Y141.891 E.02281
M204 S10000
G1 X141.574 Y142.251 F42000
; LINE_WIDTH: 0.448224
G1 F8882.226
M204 S6000
G1 X142.054 Y141.827 E.02117
G1 X142.622 Y141.494 E.02175
G1 X143.246 Y141.28 E.02176
G1 X143.818 Y141.203 E.01907
G1 X144.555 Y141.243 E.02438
G1 X145.189 Y141.417 E.02173
G1 X145.777 Y141.714 E.02173
G1 X146.294 Y142.121 E.02173
G1 X146.72 Y142.622 E.02173
G1 X147.038 Y143.198 E.02174
G1 X147.235 Y143.826 E.02172
G1 X147.303 Y144.555 E.0242
G1 X147.243 Y145.137 E.01932
G1 X147.053 Y145.765 E.02166
G1 X146.742 Y146.345 E.02174
G1 X146.374 Y146.798 E.01928
G1 X145.812 Y147.263 E.02408
G1 X145.148 Y147.597 E.02457
G1 X144.355 Y147.785 E.02691
G1 X143.613 Y147.784 E.02453
G1 X142.967 Y147.642 E.02182
G1 X142.365 Y147.374 E.02176
G1 X141.828 Y146.993 E.02176
G1 X141.377 Y146.513 E.02175
G1 X141.03 Y145.953 E.02176
G1 X140.801 Y145.336 E.02175
G1 X140.699 Y144.685 E.02175
G1 X140.728 Y144.027 E.02175
G1 X140.886 Y143.388 E.02176
G1 X141.168 Y142.793 E.02175
G1 X141.538 Y142.299 E.02036
; WIPE_START
G1 X141.168 Y142.793 E-.23426
G1 X140.886 Y143.388 E-.25028
G1 X140.728 Y144.027 E-.25041
G1 X140.725 Y144.093 E-.02505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.19 Y141.002 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X146.567 Y141.266 I-1.283 J2.235 E.0153
G2 X148.31 Y142.878 I12.507 J-11.782 E.07881
G1 X149.071 Y143.057 E.02593
G3 X148.14 Y141.734 I3.063 J-3.144 E.05398
; WIPE_START
G1 X148.501 Y142.386 E-.28342
G1 X149.071 Y143.057 E-.33444
G1 X148.707 Y142.971 E-.14214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.251 Y143.653 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X152.847 Y143.777 E.01171
G1 X152.113 Y143.869 E.0205
G1 X151.344 Y143.815 E.02135
G1 X150.601 Y143.609 E.02136
G1 X149.914 Y143.26 E.02134
G1 X149.31 Y142.782 E.02136
G1 X148.812 Y142.194 E.02136
G1 X148.44 Y141.518 E.02137
G1 X148.21 Y140.783 E.02135
G1 X148.13 Y140.016 E.02136
G1 X148.204 Y139.249 E.02135
G1 X148.428 Y138.511 E.02136
G1 X148.794 Y137.833 E.02136
G1 X149.264 Y137.266 E.0204
G1 X149.838 Y136.794 E.02058
G1 X150.321 Y136.523 E.01536
G1 X151.113 Y136.232 E.02337
G1 X151.905 Y136.138 E.02211
G1 X152.672 Y136.196 E.02129
G1 X153.461 Y136.426 E.02278
M204 S10000
G1 X151.619 Y134.735 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X153.235 Y134.889 I-.165 J10.273 E.0539
G1 X153.552 Y135.12 E.013
G2 X154.712 Y135.06 I.514 J-1.315 E.03972
G3 X156.505 Y136.61 I-3.502 J5.863 E.07903
G1 X156.172 Y136.709 E.01151
G3 X155.03 Y137.618 I-6.853 J-7.44 E.04845
G3 X155.82 Y139.482 I-3.468 J2.568 E.06781
G1 X156.172 Y139.226 E.01447
G3 X157.614 Y139.44 I.479 J1.729 E.04977
G3 X157.338 Y141.826 I-5.612 J.56 E.0803
G1 X156.828 Y141.756 E.01708
G1 X156.172 Y141.95 E.02266
G3 X154.862 Y142.982 I-7.786 J-8.543 E.05536
G1 X154.355 Y143.051 E.01696
G3 X153.587 Y143.517 I-6.487 J-9.83 E.02982
G1 X153.736 Y143.864 E.01252
G1 X153.411 Y143.991 E.01161
; WIPE_START
G1 X153.736 Y143.864 E-.133
G1 X153.587 Y143.517 E-.14341
G1 X154.355 Y143.051 E-.34151
G1 X154.726 Y143 E-.14208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.359 Y135.744 Z1.8 F42000
G1 X149.267 Y126.266 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X149.267 Y124.638 E.05401
G1 X148.966 Y124.727 E.01041
G1 X148.31 Y124.637 E.02194
G3 X147 Y123.606 I6.473 J-9.572 E.05536
G2 X145.035 Y123.979 I-.731 J1.51 E.07111
G1 X144.379 Y124.533 E.02846
G3 X142.414 Y124.16 I-.731 J-1.51 E.07111
G1 X141.759 Y123.606 E.02846
G2 X139.793 Y123.979 I-.731 J1.51 E.07111
G1 X139.138 Y124.533 E.02846
G3 X137.173 Y124.16 I-.731 J-1.51 E.0711
G1 X136.517 Y123.606 E.02846
G2 X134.552 Y123.979 I-.731 J1.51 E.0711
G1 X133.897 Y124.533 E.02846
G1 X133.658 Y124.604 E.00827
G1 X133.658 Y122.049 E.08474
G1 X133.897 Y122.016 E.008
G2 X135.207 Y120.985 I-6.476 J-9.575 E.05536
G3 X137.173 Y121.358 I.731 J1.51 E.0711
G1 X137.828 Y121.912 E.02846
G2 X139.793 Y121.539 I.731 J-1.51 E.07111
G1 X140.448 Y120.985 E.02846
G3 X142.414 Y121.358 I.731 J1.51 E.0711
G1 X143.069 Y121.912 E.02846
G2 X145.035 Y121.539 I.731 J-1.51 E.07111
G1 X145.69 Y120.985 E.02846
G3 X147.655 Y121.358 I.731 J1.51 E.07111
G1 X148.31 Y121.912 E.02846
G1 X148.966 Y122.106 E.02266
G1 X149.267 Y122.065 E.01008
G1 X149.267 Y119.397 E.08851
G1 X148.966 Y119.486 E.01041
G1 X148.31 Y119.396 E.02194
G3 X147 Y118.364 I6.475 J-9.574 E.05536
G2 X145.035 Y118.738 I-.731 J1.51 E.07111
G1 X144.379 Y119.292 E.02846
G3 X142.414 Y118.918 I-.731 J-1.51 E.07111
G1 X141.759 Y118.364 E.02846
G2 X139.793 Y118.738 I-.731 J1.51 E.07111
G1 X139.138 Y119.292 E.02846
G3 X137.173 Y118.918 I-.731 J-1.51 E.07111
G1 X136.517 Y118.364 E.02846
G2 X134.552 Y118.738 I-.731 J1.51 E.0711
G1 X133.897 Y119.292 E.02846
G1 X133.658 Y119.363 E.00827
G1 X133.658 Y116.808 E.08474
G1 X133.897 Y116.775 E.008
G2 X135.207 Y115.744 I-6.476 J-9.575 E.05536
G3 X137.173 Y116.117 I.731 J1.51 E.07111
G1 X137.828 Y116.671 E.02846
G2 X139.793 Y116.298 I.731 J-1.51 E.07111
G1 X140.448 Y115.744 E.02846
G3 X142.414 Y116.117 I.731 J1.51 E.07111
G1 X143.069 Y116.671 E.02846
G2 X145.035 Y116.298 I.731 J-1.51 E.07111
G1 X145.69 Y115.744 E.02846
G3 X147.655 Y116.117 I.731 J1.51 E.07111
G1 X148.31 Y116.671 E.02846
G1 X148.966 Y116.865 E.02266
G1 X149.267 Y116.824 E.01008
G1 X149.267 Y114.155 E.08851
G1 X148.966 Y114.244 E.01041
G1 X148.31 Y114.154 E.02194
G3 X147.555 Y113.592 I3.508 J-5.503 E.03126
G2 X148.118 Y111.267 I-3.562 J-2.093 E.08051
G1 X148.31 Y111.43 E.00836
G1 X148.966 Y111.624 E.02266
G1 X149.267 Y111.582 E.01008
G2 X148.859 Y108.988 I-5.815 J-.415 E.08786
G1 X148.31 Y108.913 E.01837
G3 X147 Y107.882 I6.475 J-9.574 E.05536
G2 X145.757 Y107.769 I-.747 J1.32 E.04267
G2 X141.865 Y107.971 I-1.757 J3.736 E.13465
G1 X141.759 Y107.882 E.0046
G2 X139.793 Y108.255 I-.731 J1.51 E.07111
G1 X139.138 Y108.809 E.02846
G3 X137.173 Y108.436 I-.731 J-1.51 E.07111
G1 X136.517 Y107.882 E.02846
G2 X134.552 Y108.255 I-.731 J1.51 E.0711
G1 X133.897 Y108.809 E.02846
G3 X131.931 Y108.436 I-.731 J-1.51 E.07111
G1 X131.276 Y107.882 E.02846
G2 X129.311 Y108.255 I-.731 J1.51 E.07111
G1 X128.656 Y108.809 E.02846
G3 X126.69 Y108.436 I-.731 J-1.51 E.07111
G1 X126.035 Y107.882 E.02846
G2 X124.069 Y108.255 I-.731 J1.51 E.0711
G1 X123.414 Y108.809 E.02846
G3 X121.449 Y108.436 I-.731 J-1.51 E.07111
G1 X120.794 Y107.882 E.02846
G2 X118.828 Y108.255 I-.731 J1.51 E.0711
G1 X118.173 Y108.809 E.02846
G3 X116.207 Y108.436 I-.731 J-1.51 E.07111
G1 X115.552 Y107.882 E.02846
G2 X113.587 Y108.255 I-.731 J1.51 E.0711
G1 X112.932 Y108.809 E.02846
G3 X110.966 Y108.436 I-.731 J-1.51 E.07111
G1 X110.311 Y107.882 E.02846
G2 X108.345 Y108.255 I-.731 J1.51 E.0711
G1 X107.69 Y108.809 E.02846
G1 X107.237 Y108.943 E.01567
G3 X108.116 Y111.224 I-3.252 J2.562 E.08229
G2 X109.001 Y110.502 I-4.546 J-6.48 E.0379
G3 X110.966 Y110.876 I.731 J1.51 E.07111
G1 X111.621 Y111.43 E.02846
G2 X113.587 Y111.056 I.731 J-1.51 E.07111
G1 X114.242 Y110.502 E.02846
G3 X115.552 Y110.398 I.77 J1.399 E.04494
G1 X115.751 Y110.543 E.00816
G1 X119.435 Y110.543 E.1222
G1 X119.483 Y110.502 E.00211
G3 X120.794 Y110.398 I.77 J1.399 E.04494
G1 X120.992 Y110.543 E.00816
G1 X124.676 Y110.543 E.1222
G1 X124.725 Y110.502 E.00211
G3 X126.035 Y110.398 I.77 J1.399 E.04494
G1 X126.234 Y110.543 E.00816
G1 X129.917 Y110.543 E.1222
G1 X129.966 Y110.502 E.00211
G3 X131.276 Y110.398 I.77 J1.399 E.04494
G1 X131.475 Y110.543 E.00816
G1 X133.417 Y110.543 E.06441
G1 X133.658 Y110.784 E.01131
G1 X133.658 Y111.567 E.02595
G1 X133.897 Y111.534 E.008
G2 X135.207 Y110.502 I-6.477 J-9.577 E.05536
G3 X137.173 Y110.876 I.731 J1.51 E.0711
G1 X137.828 Y111.43 E.02846
G2 X139.793 Y111.056 I.731 J-1.51 E.07111
G1 X139.911 Y110.956 E.00513
G2 X140.233 Y113.176 I4.008 J.553 E.07539
G2 X139.138 Y114.051 I5.497 J8.006 E.04651
G3 X137.173 Y113.677 I-.731 J-1.51 E.07111
G1 X136.517 Y113.123 E.02846
G2 X134.552 Y113.497 I-.731 J1.51 E.0711
G1 X133.897 Y114.051 E.02846
G1 X133.658 Y114.121 E.00827
G1 X133.658 Y115.75 E.05401
M204 S10000
G1 X133.237 Y110.964 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.460828
G1 F8614.347
M204 S6000
G1 X132.976 Y110.948 E.00893
; LINE_WIDTH: 0.413416
G1 F9716.717
G1 X132.714 Y110.932 E.00792
G1 X115.288 Y110.932 E.52608
; LINE_WIDTH: 0.42906
G1 F9323.043
G1 X115.027 Y110.948 E.00825
; LINE_WIDTH: 0.450234
G1 F8838.405
G1 X114.765 Y110.964 E.00871
G1 X114.733 Y111.487 E.01741
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X114.733 Y123.913 E.37489
; LINE_WIDTH: 0.42906
G1 F9323.043
G1 X114.749 Y124.174 E.00825
; LINE_WIDTH: 0.450234
G1 F8838.405
G1 X114.765 Y124.436 E.00871
G1 X115.288 Y124.468 E.01741
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X132.714 Y124.468 E.52575
; LINE_WIDTH: 0.429063
G1 F9322.983
G1 X132.976 Y124.452 E.00825
; LINE_WIDTH: 0.45024
G1 F8838.278
G1 X133.237 Y124.436 E.00871
G1 X133.269 Y123.913 E.01741
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X133.269 Y111.487 E.37489
; LINE_WIDTH: 0.429063
G1 F9322.983
G1 X133.255 Y111.255 E.00731
; LINE_WIDTH: 0.460828
G1 F8614.347
G1 X133.241 Y111.024 E.00791
M204 S10000
G1 X115.103 Y111.487 F42000
; LINE_WIDTH: 0.42906
G1 F9323.043
M204 S6000
G1 X115.119 Y111.411 E.00246
; LINE_WIDTH: 0.450234
G1 F8838.399
G1 X115.135 Y111.334 E.0026
G1 X115.288 Y111.302 E.0052
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X132.714 Y111.302 E.52575
; LINE_WIDTH: 0.429063
G1 F9322.983
G1 X132.79 Y111.318 E.00246
; LINE_WIDTH: 0.45024
G1 F8838.273
G1 X132.867 Y111.334 E.0026
G1 X132.899 Y111.487 E.0052
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X132.899 Y123.913 E.37489
; LINE_WIDTH: 0.429063
G1 F9322.983
G1 X132.883 Y123.989 E.00246
; LINE_WIDTH: 0.450239
G1 F8838.282
G1 X132.867 Y124.066 E.0026
G1 X132.714 Y124.098 E.0052
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X115.288 Y124.098 E.52575
; LINE_WIDTH: 0.42906
G1 F9323.043
G1 X115.212 Y124.082 E.00246
; LINE_WIDTH: 0.450234
G1 F8838.399
G1 X115.135 Y124.066 E.0026
G1 X115.103 Y123.913 E.0052
; LINE_WIDTH: 0.41318
G1 F9722.897
G1 X115.103 Y111.547 E.37308
M204 S10000
G1 X114.344 Y114.633 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X114.344 Y113.005 E.05401
G1 X114.242 Y113.019 E.00343
G2 X112.932 Y114.051 I6.475 J9.574 E.05536
G3 X110.966 Y113.677 I-.731 J-1.51 E.07111
G1 X110.311 Y113.123 E.02846
G2 X108.345 Y113.497 I-.731 J1.51 E.0711
G1 X107.69 Y114.051 E.02846
G1 X107.097 Y114.226 E.02054
G1 X107.157 Y114.161 E.00293
G2 X107.906 Y112.826 I-3.358 J-2.763 E.05105
M204 S10000
G1 X107.041 Y113.617 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.454893
G1 F8738.436
M204 S6000
G1 X107.274 Y113.253 E.01449
G1 X107.545 Y112.609 E.02345
G1 X107.695 Y111.885 E.02482
G1 X107.696 Y111.146 E.02481
G1 X107.554 Y110.421 E.02481
G1 X107.27 Y109.738 E.02483
G1 X106.856 Y109.126 E.02482
G1 X106.328 Y108.607 E.02483
G1 X105.709 Y108.203 E.02481
G1 X105.022 Y107.93 E.02483
G1 X104.285 Y107.798 E.02515
G2 X103.232 Y107.866 I-.288 J3.685 E.03554
G1 X102.53 Y108.09 E.02476
G1 X101.883 Y108.45 E.02483
G1 X101.32 Y108.93 E.02483
G1 X100.864 Y109.512 E.02482
G1 X100.533 Y110.173 E.02482
G1 X100.338 Y110.887 E.02484
G1 X100.29 Y111.624 E.02482
G1 X100.388 Y112.357 E.02482
G1 X100.629 Y113.056 E.02482
G1 X101.005 Y113.694 E.02484
G1 X101.499 Y114.244 E.02483
G1 X102.092 Y114.685 E.02482
G1 X102.761 Y115.001 E.02484
G1 X103.479 Y115.177 E.0248
G1 X104.263 Y115.206 E.02634
G1 X104.991 Y115.077 E.02481
G1 X105.68 Y114.811 E.02481
G1 X106.303 Y114.412 E.02484
G2 X107.003 Y113.663 I-2.406 J-2.952 E.03452
M204 S10000
G1 X106.742 Y113.345 F42000
; LINE_WIDTH: 0.448248
G1 F8881.701
M204 S6000
G1 X106.374 Y113.798 E.01928
G1 X105.812 Y114.263 E.02409
G1 X105.148 Y114.597 E.02457
G1 X104.355 Y114.785 E.02691
G1 X103.612 Y114.784 E.02453
G1 X102.967 Y114.642 E.02182
G1 X102.365 Y114.374 E.02177
G1 X101.828 Y113.993 E.02175
G1 X101.377 Y113.513 E.02175
G1 X101.03 Y112.953 E.02176
G1 X100.801 Y112.336 E.02175
G1 X100.699 Y111.685 E.02175
G1 X100.728 Y111.027 E.02175
G1 X100.886 Y110.388 E.02177
G1 X101.168 Y109.793 E.02175
G3 X101.574 Y109.251 I9.891 J6.985 E.02235
G1 X102.054 Y108.827 E.02117
G1 X102.623 Y108.494 E.02176
G1 X103.246 Y108.28 E.02175
G1 X103.818 Y108.203 E.01907
G1 X104.555 Y108.243 E.02438
G1 X105.189 Y108.417 E.02173
G1 X105.777 Y108.714 E.02173
G1 X106.294 Y109.121 E.02175
G1 X106.72 Y109.622 E.02172
G1 X107.038 Y110.198 E.02174
G1 X107.235 Y110.826 E.02172
G1 X107.303 Y111.555 E.0242
G1 X107.243 Y112.137 E.01932
G1 X107.053 Y112.765 E.02166
G1 X106.77 Y113.292 E.01976
; WIPE_START
G1 X107.053 Y112.765 E-.22731
G1 X107.243 Y112.137 E-.24918
G1 X107.303 Y111.555 E-.22233
G1 X107.288 Y111.395 E-.06117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.617 Y114.869 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X101.6 Y114.858 E.00069
G3 X100.484 Y113.677 I2.561 J-3.538 E.05421
G1 X99.828 Y113.123 E.02846
G1 X99.173 Y112.929 E.02266
G1 X98.736 Y112.989 E.01463
G3 X98.771 Y110.428 I21.282 J-.995 E.08503
G1 X99.173 Y110.308 E.01392
G1 X99.828 Y110.398 E.02194
G1 X99.998 Y110.491 E.00642
G3 X100.922 Y108.755 I4.117 J1.076 E.06583
G2 X99.779 Y107.867 I-128.245 J163.904 E.04802
G3 X101.593 Y106.323 I4.836 J3.844 E.07952
G1 X101.794 Y106.382 E.00696
G1 X102.449 Y106.292 E.02194
G1 X103.099 Y105.818 E.0267
G3 X103.743 Y105.742 I.71 J3.231 E.02153
G1 X105.852 Y105.742 E.06995
G2 X107.69 Y106.292 I1.359 J-1.195 E.0671
G2 X108.432 Y105.742 I-3.435 J-5.401 E.03067
G1 X111.093 Y105.741 E.08825
G2 X112.932 Y106.292 I1.36 J-1.195 E.06713
G2 X113.674 Y105.741 I-3.439 J-5.408 E.0307
G1 X116.333 Y105.741 E.08821
G2 X118.173 Y106.292 I1.361 J-1.195 E.06715
G2 X118.916 Y105.741 I-3.44 J-5.41 E.03072
G1 X121.574 Y105.74 E.08818
G2 X123.414 Y106.292 I1.361 J-1.195 E.06717
G2 X124.158 Y105.74 I-3.448 J-5.42 E.03075
G1 X126.815 Y105.74 E.08814
G2 X128.656 Y106.292 I1.362 J-1.194 E.0672
G2 X129.4 Y105.74 I-3.449 J-5.421 E.03077
G1 X132.056 Y105.74 E.0881
G2 X133.897 Y106.292 I1.362 J-1.194 E.06722
G2 X134.641 Y105.739 I-3.451 J-5.424 E.03079
G1 X137.296 Y105.739 E.08807
G2 X139.138 Y106.292 I1.363 J-1.194 E.06725
G2 X139.883 Y105.739 I-3.455 J-5.429 E.03082
G1 X142.537 Y105.739 E.08803
G2 X145.009 Y105.834 I1.275 J-.968 E.09376
G3 X146.533 Y106.387 I-1.05 J5.276 E.05399
; WIPE_START
G1 X145.783 Y106.046 E-.31295
G1 X145.009 Y105.834 E-.30517
G1 X144.707 Y106.054 E-.14189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.68 Y113.061 Z1.8 F42000
G1 X141.269 Y114.014 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455341
G1 F8728.958
M204 S6000
G1 X141.821 Y114.505 E.02484
G1 X142.46 Y114.878 E.02486
G1 X143.159 Y115.116 E.02485
G1 X143.893 Y115.21 E.02484
G2 X145.204 Y115.007 I.061 J-3.942 E.04481
G1 X145.959 Y114.655 E.02801
G1 X146.584 Y114.17 E.02657
G1 X147.037 Y113.639 E.02347
G1 X147.399 Y112.998 E.02474
G1 X147.628 Y112.295 E.02484
G2 X147.716 Y111.515 I-7.473 J-1.235 E.02639
G1 X147.653 Y110.829 E.02316
G1 X147.446 Y110.114 E.02502
G1 X147.103 Y109.458 E.02486
G1 X146.637 Y108.884 E.02485
G1 X146.067 Y108.414 E.02485
G1 X145.414 Y108.066 E.02486
G1 X144.705 Y107.854 E.02485
G1 X143.97 Y107.786 E.02484
G1 X143.23 Y107.865 E.02501
G1 X142.803 Y107.985 E.01487
G1 X142.158 Y108.276 E.02379
G1 X141.556 Y108.706 E.02485
G1 X141.051 Y109.246 E.02486
G1 X140.663 Y109.875 E.02484
G1 X140.407 Y110.568 E.02485
G1 X140.293 Y111.299 E.02484
G1 X140.327 Y112.038 E.02486
G1 X140.507 Y112.755 E.02485
G1 X140.825 Y113.423 E.02485
G1 X141.233 Y113.966 E.02283
M204 S10000
G1 X141.83 Y113.99 F42000
; LINE_WIDTH: 0.448608
G1 F8873.817
M204 S6000
G1 X141.38 Y113.511 E.02175
G1 X141.033 Y112.951 E.02176
G1 X140.804 Y112.334 E.02174
G1 X140.702 Y111.685 E.02175
G1 X140.731 Y111.028 E.02174
G1 X140.89 Y110.389 E.02176
G1 X141.172 Y109.794 E.02175
G1 X141.565 Y109.268 E.02174
G1 X142.056 Y108.829 E.02175
G1 X142.624 Y108.497 E.02175
G1 X143.245 Y108.279 E.02176
G1 X143.898 Y108.193 E.02177
G1 X144.555 Y108.239 E.02177
G1 X145.19 Y108.414 E.02177
G1 X145.778 Y108.711 E.02178
G1 X146.296 Y109.118 E.02177
G1 X146.722 Y109.62 E.02177
G1 X147.041 Y110.197 E.02178
G1 X147.239 Y110.825 E.02176
G1 X147.305 Y111.513 E.02286
G1 X147.247 Y112.137 E.02074
G1 X147.057 Y112.766 E.0217
G1 X146.745 Y113.346 E.02178
G1 X146.375 Y113.799 E.01932
G1 X145.815 Y114.266 E.02412
G1 X145.196 Y114.58 E.02293
G3 X144.308 Y114.789 I-1.654 J-5.041 E.0302
G1 X143.613 Y114.781 E.02299
G1 X142.968 Y114.638 E.02182
G1 X142.367 Y114.371 E.02176
G1 X141.879 Y114.025 E.01977
M204 S10000
G1 X132.715 Y127.463 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43588
M106 S255
G1 F3000
M204 S6000
G1 X128.456 Y127.467 E.13638
G1 X128.456 Y127.856 E.01247
G1 X132.546 Y127.856 E.13094
G1 X132.546 Y128.249 E.01258
G1 X128.456 Y128.249 E.13094
G1 X128.456 Y128.642 E.01258
G1 X132.546 Y128.642 E.13094
G1 X132.546 Y129.035 E.01258
G1 X128.456 Y129.035 E.13094
G1 X128.456 Y129.428 E.01258
G1 X132.546 Y129.428 E.13094
G1 X132.546 Y129.821 E.01258
G1 X128.456 Y129.821 E.13094
G1 X128.456 Y130.214 E.01258
G1 X132.546 Y130.214 E.13094
G1 X132.546 Y130.607 E.01258
G1 X128.456 Y130.607 E.13094
G1 X128.456 Y131 E.01258
G1 X132.546 Y131 E.13094
G1 X132.546 Y131.393 E.01258
G1 X128.456 Y131.393 E.13094
G1 X128.456 Y131.786 E.01258
G1 X132.546 Y131.786 E.13094
G1 X132.546 Y132.179 E.01258
G1 X128.456 Y132.179 E.13094
G1 X128.456 Y132.572 E.01258
G1 X132.546 Y132.572 E.13094
G1 X132.546 Y132.965 E.01258
G1 X128.456 Y132.965 E.13094
G1 X128.456 Y133.358 E.01258
G1 X132.546 Y133.358 E.13094
G1 X132.546 Y133.751 E.01258
G1 X128.456 Y133.751 E.13094
G1 X128.456 Y134.144 E.01258
G1 X132.546 Y134.144 E.13094
G1 X132.546 Y134.533 E.01247
G1 X128.287 Y134.537 E.13638
M106 S186.15
M204 S10000
G1 X130.377 Y134.937 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.749 Y134.937 E.05401
G1 X128.656 Y135.016 E.00406
G3 X126.69 Y134.642 I-.731 J-1.51 E.07111
G1 X126.035 Y134.088 E.02846
G2 X124.069 Y134.462 I-.731 J1.51 E.07111
G1 X123.414 Y135.016 E.02846
G3 X121.449 Y134.642 I-.731 J-1.51 E.07111
G1 X120.794 Y134.088 E.02846
G1 X120.138 Y133.894 E.02266
G1 X119.938 Y133.922 E.00672
G1 X119.938 Y134.696 E.02568
G1 X119.696 Y134.937 E.01132
G1 X118.266 Y134.937 E.04742
G1 X118.173 Y135.016 E.00406
G3 X116.863 Y135.12 I-.77 J-1.399 E.04494
G1 X116.612 Y134.937 E.0103
G1 X115.305 Y134.937 E.04334
G1 X115.064 Y134.695 E.01132
G1 X115.064 Y133.944 E.02492
G1 X114.897 Y133.894 E.00579
G1 X114.242 Y133.984 E.02194
G2 X112.932 Y135.016 I6.475 J9.574 E.05536
G3 X110.966 Y134.642 I-.731 J-1.51 E.07111
G1 X110.311 Y134.088 E.02846
G2 X108.345 Y134.462 I-.731 J1.51 E.07111
G1 X107.69 Y135.016 E.02846
G3 X105.725 Y134.642 I-.731 J-1.51 E.07111
G1 X105.07 Y134.088 E.02846
G2 X103.104 Y134.462 I-.731 J1.51 E.07111
G1 X102.449 Y135.016 E.02846
G3 X100.484 Y134.642 I-.731 J-1.51 E.07111
G1 X99.828 Y134.088 E.02846
G1 X99.173 Y133.894 E.02266
G1 X98.738 Y133.954 E.01457
G1 X98.739 Y131.402 E.08465
G1 X99.173 Y131.274 E.01503
G1 X99.828 Y131.364 E.02194
G3 X101.139 Y132.395 I-6.476 J9.575 E.05536
G2 X103.104 Y132.021 I.731 J-1.51 E.0711
G1 X103.759 Y131.467 E.02846
G3 X105.725 Y131.841 I.731 J1.51 E.07111
G1 X106.38 Y132.395 E.02846
G2 X108.345 Y132.021 I.731 J-1.51 E.07111
G1 X109.001 Y131.467 E.02846
G3 X110.966 Y131.841 I.731 J1.51 E.07111
G1 X111.621 Y132.395 E.02846
G2 X113.587 Y132.021 I.731 J-1.51 E.0711
G1 X114.242 Y131.467 E.02846
G1 X114.897 Y131.274 E.02266
G1 X115.064 Y131.297 E.0056
G1 X115.064 Y128.703 E.08605
G1 X114.897 Y128.653 E.00578
G1 X114.242 Y128.743 E.02194
G2 X112.932 Y129.774 I6.475 J9.574 E.05536
G3 X110.966 Y129.401 I-.731 J-1.51 E.0711
G1 X110.311 Y128.847 E.02846
G2 X108.345 Y129.22 I-.731 J1.51 E.07111
G1 X107.69 Y129.774 E.02846
G3 X105.725 Y129.401 I-.731 J-1.51 E.07111
G1 X105.07 Y128.847 E.02846
G2 X103.104 Y129.22 I-.731 J1.51 E.07111
G1 X102.449 Y129.774 E.02846
G3 X100.484 Y129.401 I-.731 J-1.51 E.0711
G1 X99.828 Y128.847 E.02846
G1 X99.173 Y128.653 E.02266
G1 X98.739 Y128.713 E.01453
G1 X98.739 Y126.161 E.08465
G1 X99.173 Y126.032 E.01502
G1 X99.828 Y126.122 E.02194
G3 X101.139 Y127.154 I-6.475 J9.574 E.05536
G2 X103.104 Y126.78 I.731 J-1.51 E.07111
G1 X103.759 Y126.226 E.02846
G3 X105.725 Y126.6 I.731 J1.51 E.0711
G1 X106.38 Y127.154 E.02846
G2 X108.345 Y126.78 I.731 J-1.51 E.07111
G1 X109.001 Y126.226 E.02846
G3 X110.966 Y126.6 I.731 J1.51 E.07111
G1 X111.621 Y127.154 E.02846
G2 X113.587 Y126.78 I.731 J-1.51 E.07111
G1 X114.242 Y126.226 E.02846
G3 X116.207 Y126.6 I.731 J1.51 E.0711
G1 X116.756 Y127.063 E.02381
G1 X118.44 Y127.063 E.05587
G2 X119.483 Y126.226 I-5.265 J-7.633 E.04442
G3 X121.449 Y126.6 I.731 J1.51 E.07111
G1 X122.104 Y127.154 E.02846
G2 X124.069 Y126.78 I.731 J-1.51 E.07111
G1 X124.725 Y126.226 E.02846
G3 X126.69 Y126.6 I.731 J1.51 E.0711
G1 X127.345 Y127.154 E.02846
G1 X128 Y127.348 E.02266
G1 X128.305 Y127.063 E.01383
G1 X128.922 Y127.063 E.02046
G2 X129.966 Y126.226 I-5.265 J-7.633 E.04442
G3 X131.931 Y126.6 I.731 J1.51 E.0711
G1 X132.479 Y127.063 E.02381
G3 X132.871 Y127.238 I.109 J.282 E.01581
G1 X133.242 Y127.348 E.01283
G1 X133.897 Y127.258 E.02194
G2 X135.207 Y126.226 I-6.476 J-9.575 E.05536
G3 X137.173 Y126.6 I.731 J1.51 E.0711
G1 X137.828 Y127.154 E.02846
G2 X139.793 Y126.78 I.731 J-1.51 E.07111
G1 X140.448 Y126.226 E.02846
G3 X142.414 Y126.6 I.731 J1.51 E.0711
G1 X143.069 Y127.154 E.02846
G2 X145.035 Y126.78 I.731 J-1.51 E.07111
G1 X145.69 Y126.226 E.02846
G3 X147.655 Y126.6 I.731 J1.51 E.07111
G1 X148.31 Y127.154 E.02846
G1 X148.966 Y127.348 E.02266
G1 X149.267 Y127.306 E.01008
G1 X149.267 Y129.879 E.08535
G1 X148.966 Y129.968 E.01041
G1 X148.31 Y129.878 E.02194
G3 X147 Y128.847 I6.475 J-9.574 E.05536
G2 X145.035 Y129.22 I-.731 J1.51 E.07111
G1 X144.379 Y129.774 E.02846
G3 X142.414 Y129.401 I-.731 J-1.51 E.07111
G1 X141.759 Y128.847 E.02846
G2 X139.793 Y129.22 I-.731 J1.51 E.07111
G1 X139.138 Y129.774 E.02846
G3 X137.173 Y129.401 I-.731 J-1.51 E.0711
G1 X136.517 Y128.847 E.02846
G2 X134.552 Y129.22 I-.731 J1.51 E.07111
G1 X133.897 Y129.774 E.02846
G1 X133.242 Y129.968 E.02266
G1 X132.938 Y129.926 E.01017
G1 X132.938 Y132.499 E.08533
G1 X133.242 Y132.589 E.01051
G1 X133.897 Y132.499 E.02194
G2 X135.207 Y131.467 I-6.476 J-9.575 E.05536
G3 X137.173 Y131.841 I.731 J1.51 E.07111
G1 X137.828 Y132.395 E.02846
G2 X139.793 Y132.021 I.731 J-1.51 E.0711
G1 X140.448 Y131.467 E.02846
G3 X142.414 Y131.841 I.731 J1.51 E.07111
G1 X143.069 Y132.395 E.02846
G2 X145.035 Y132.021 I.731 J-1.51 E.07111
G1 X145.69 Y131.467 E.02846
G3 X147.655 Y131.841 I.731 J1.51 E.07111
G1 X148.31 Y132.395 E.02846
G1 X148.966 Y132.589 E.02266
G1 X149.267 Y132.548 E.01008
G1 X149.267 Y134.735 E.07255
G1 X149.953 Y134.735 E.02278
G1 X149.621 Y135.016 E.01444
G3 X147.655 Y134.642 I-.731 J-1.51 E.07111
G1 X147 Y134.088 E.02846
G2 X145.035 Y134.462 I-.731 J1.51 E.07111
G1 X144.379 Y135.016 E.02846
G3 X142.414 Y134.642 I-.731 J-1.51 E.07111
G1 X141.759 Y134.088 E.02846
G2 X139.793 Y134.462 I-.731 J1.51 E.07111
G1 X139.138 Y135.016 E.02846
G3 X137.173 Y134.642 I-.731 J-1.51 E.07111
G1 X136.517 Y134.088 E.02846
G2 X134.552 Y134.462 I-.731 J1.51 E.07111
G1 X133.897 Y135.016 E.02846
G3 X132.587 Y135.12 I-.77 J-1.399 E.04494
G1 X132.336 Y134.937 E.0103
G2 X132.938 Y134.696 I.18 J-.423 E.02388
G1 X132.938 Y133.769 E.03074
M204 S10000
G1 X127.615 Y143.015 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.415863
G1 F9652.97
M204 S6000
G1 X127.517 Y142.339 E.02075
G1 X127.33 Y141.884 E.01495
G1 X127.071 Y141.508 E.01389
G1 X126.681 Y141.16 E.01587
G1 X126.19 Y140.868 E.01736
G1 X125.701 Y140.724 E.01549
G1 X125.451 Y140.692 E.00765
G1 X124.849 Y140.724 E.01833
G1 X124.358 Y140.878 E.01564
; LINE_WIDTH: 0.440067
G1 F9064.661
G1 X124.017 Y141.044 E.01227
G1 X123.558 Y140.844 E.01621
; LINE_WIDTH: 0.41198
G1 F9754.511
G1 X123.048 Y140.711 E.01586
G1 X122.592 Y140.683 E.01374
G2 X121.277 Y141.18 I.1 J2.25 E.043
G1 X120.847 Y141.616 E.01841
G1 X120.59 Y142.048 E.01512
G1 X120.429 Y142.531 E.0153
G1 X120.386 Y143.053 E.01575
G2 X120.832 Y144.364 I2.562 J-.14 E.04216
G1 X121.235 Y144.776 E.01732
G1 X121.66 Y145.07 E.01555
G1 X122.136 Y145.242 E.01523
G1 X122.73 Y145.314 E.01798
G1 X123.225 Y145.254 E.01499
G1 X123.701 Y145.088 E.01517
; LINE_WIDTH: 0.42426
G1 F9440.394
G1 X123.849 Y145.019 E.00509
; LINE_WIDTH: 0.438817
G1 F9093.292
G1 X123.998 Y144.949 E.00528
G1 X124.457 Y145.151 E.01618
; LINE_WIDTH: 0.409928
G1 F9809.055
G2 X125.413 Y145.312 I.969 J-2.832 E.02912
G2 X127.037 Y144.538 I-.114 J-2.329 E.05524
G1 X127.332 Y144.119 E.01531
G1 X127.535 Y143.546 E.01819
G1 X127.606 Y143.074 E.01427
; WIPE_START
G1 X127.535 Y143.546 E-.18133
G1 X127.332 Y144.119 E-.23116
G1 X127.037 Y144.538 E-.19449
G1 X126.741 Y144.81 E-.15301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.915 Y141.215 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.41379
G1 F9706.922
M204 S6000
G3 X123.431 Y141.192 I.785 J1.814 E.04701
; LINE_WIDTH: 0.443345
G1 F8990.454
G1 X123.87 Y141.424 E.01623
G1 X123.991 Y141.529 E.00522
G1 X124.246 Y141.369 E.00982
; LINE_WIDTH: 0.410009
G1 F9806.886
G1 X124.698 Y141.147 E.01505
G1 X125.08 Y141.068 E.01168
G1 X125.611 Y141.079 E.01589
G1 X126.032 Y141.197 E.01307
G1 X126.487 Y141.462 E.01574
G1 X126.893 Y141.881 E.01746
G1 X127.102 Y142.264 E.01306
G1 X127.231 Y142.78 E.0159
G1 X127.207 Y143.381 E.01799
G1 X126.992 Y143.97 E.01878
G1 X126.701 Y144.358 E.0145
G3 X125.331 Y144.947 I-1.405 J-1.378 E.04574
G1 X124.767 Y144.868 E.01704
G1 X124.307 Y144.672 E.01498
; LINE_WIDTH: 0.438018
G1 F9111.676
G1 X123.988 Y144.495 E.01174
G1 X123.532 Y144.761 E.017
; LINE_WIDTH: 0.411167
G1 F9776.049
G1 X122.971 Y144.927 E.01755
G3 X121.796 Y144.725 I-.229 J-2.18 E.03623
G1 X121.351 Y144.387 E.01677
G1 X121.081 Y144.083 E.01221
G3 X121.12 Y141.863 I1.618 J-1.082 E.07087
G1 X121.522 Y141.451 E.01728
G1 X121.864 Y141.246 E.01197
M204 S10000
G1 X120.025 Y143.355 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X120.295 Y141.778 I2.467 J-.39 E.05402
G1 X120.138 Y141.756 E.00525
G1 X119.483 Y141.95 E.02266
G1 X118.828 Y142.504 E.02846
G3 X116.863 Y142.878 I-1.234 J-1.136 E.07111
G1 X116.207 Y142.324 E.02846
G2 X114.242 Y141.95 I-1.234 J1.136 E.07111
G1 X113.587 Y142.504 E.02846
G3 X111.621 Y142.878 I-1.234 J-1.136 E.0711
G1 X110.966 Y142.324 E.02846
G2 X109.001 Y141.95 I-1.234 J1.136 E.07111
G3 X107.805 Y142.898 I-7.149 J-7.79 E.05064
G3 X108.069 Y145.178 I-3.891 J1.605 E.07713
G1 X108.345 Y144.944 E.01202
G3 X110.311 Y144.571 I1.234 J1.136 E.07111
G1 X110.966 Y145.125 E.02846
G2 X112.932 Y145.498 I1.234 J-1.136 E.0711
G1 X113.587 Y144.944 E.02846
G3 X115.552 Y144.571 I1.234 J1.136 E.07111
G1 X116.207 Y145.125 E.02846
G2 X118.173 Y145.498 I1.234 J-1.136 E.07111
G3 X119.483 Y144.467 I7.786 J8.543 E.05536
G1 X120.138 Y144.377 E.02194
G1 X120.426 Y144.462 E.00994
G2 X121.655 Y145.487 I2.207 J-1.396 E.05397
; WIPE_START
G1 X121.008 Y145.115 E-.28364
G1 X120.426 Y144.462 E-.33253
G1 X120.138 Y144.377 E-.11387
G1 X120.06 Y144.388 E-.02996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.948 Y143.585 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105764
G1 F15000
M204 S6000
G1 X124.003 Y143.5 E.00052
G1 X124.001 Y143.444 E.00029
; WIPE_START
G1 X124.003 Y143.5 E-.2726
G1 X123.948 Y143.585 E-.4874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.67 Y138.071 Z1.8 F42000
G1 X115.287 Y134.537 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.43588
M106 S255
G1 F3000
M204 S6000
G1 X119.546 Y134.533 E.13638
G1 X119.546 Y134.144 E.01247
G1 X115.456 Y134.144 E.13094
G1 X115.456 Y133.751 E.01258
G1 X119.546 Y133.751 E.13094
G1 X119.546 Y133.358 E.01258
G1 X115.456 Y133.358 E.13094
G1 X115.456 Y132.965 E.01258
G1 X119.546 Y132.965 E.13094
G1 X119.546 Y132.572 E.01258
G1 X115.456 Y132.572 E.13094
G1 X115.456 Y132.179 E.01258
G1 X119.546 Y132.179 E.13094
M73 P49 R16
G1 X119.546 Y131.786 E.01258
G1 X115.456 Y131.786 E.13094
G1 X115.456 Y131.393 E.01258
G1 X119.546 Y131.393 E.13094
G1 X119.546 Y131 E.01258
G1 X115.456 Y131 E.13094
G1 X115.456 Y130.607 E.01258
G1 X119.546 Y130.607 E.13094
G1 X119.546 Y130.214 E.01258
G1 X115.456 Y130.214 E.13094
G1 X115.456 Y129.821 E.01258
G1 X119.546 Y129.821 E.13094
G1 X119.546 Y129.428 E.01258
G1 X115.456 Y129.428 E.13094
G1 X115.456 Y129.035 E.01258
G1 X119.546 Y129.035 E.13094
G1 X119.546 Y128.642 E.01258
G1 X115.456 Y128.642 E.13094
G1 X115.456 Y128.249 E.01258
G1 X119.546 Y128.249 E.13094
G1 X119.546 Y127.856 E.01258
G1 X115.456 Y127.856 E.13094
G1 X115.456 Y127.467 E.01247
G1 X119.715 Y127.463 E.13638
M106 S186.15
M204 S10000
G1 X119.759 Y127.126 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.938 Y127.305 E.00838
G1 X119.938 Y128.681 E.04563
G1 X120.138 Y128.653 E.00672
G1 X120.794 Y128.847 E.02266
G2 X122.104 Y129.878 I7.786 J-8.543 E.05536
G2 X124.069 Y129.22 I.478 J-1.836 E.07274
G1 X124.725 Y128.743 E.02689
G3 X126.69 Y129.401 I.478 J1.836 E.07274
G1 X127.345 Y129.878 E.02689
G1 X128.064 Y129.949 E.02397
G1 X128.064 Y132.58 E.08727
G1 X127.345 Y132.395 E.02463
G2 X126.035 Y131.364 I-7.785 J8.542 E.05536
G2 X124.069 Y132.021 I-.478 J1.836 E.07274
G1 X123.414 Y132.499 E.02689
G3 X121.449 Y131.841 I-.478 J-1.836 E.07274
G1 X120.794 Y131.364 E.02689
G1 X120.138 Y131.274 E.02194
G1 X119.938 Y131.333 E.00694
G1 X119.938 Y129.705 E.05401
; WIPE_START
G1 X119.938 Y131.333 E-.61876
G1 X120.138 Y131.274 E-.0795
G1 X120.299 Y131.296 E-.06174
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I.336 J-1.17 P1  F42000
G1 X98.739 Y125.1 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X98.738 Y123.471 E.05401
G1 X99.173 Y123.412 E.01456
G1 X99.828 Y123.606 E.02266
G2 X101.139 Y124.637 I7.784 J-8.541 E.05536
G2 X103.104 Y123.979 I.478 J-1.836 E.07274
G1 X103.759 Y123.502 E.02689
G3 X105.725 Y124.16 I.478 J1.836 E.07274
G1 X106.38 Y124.637 E.02689
G2 X108.345 Y123.979 I.478 J-1.836 E.07274
G1 X109.001 Y123.502 E.02689
G3 X110.966 Y124.16 I.478 J1.836 E.07274
G1 X111.621 Y124.637 E.02689
G2 X113.587 Y123.979 I.478 J-1.836 E.07274
G1 X114.242 Y123.502 E.02689
G1 X114.344 Y123.488 E.00343
G1 X114.344 Y120.955 E.08403
G1 X114.242 Y120.985 E.00354
G3 X112.932 Y122.016 I-7.786 J-8.544 E.05536
G3 X110.966 Y121.358 I-.478 J-1.836 E.07274
G1 X110.311 Y120.881 E.02689
G2 X108.345 Y121.539 I-.478 J1.836 E.07274
G1 X107.69 Y122.016 E.02689
G3 X105.725 Y121.358 I-.478 J-1.836 E.07274
G1 X105.07 Y120.881 E.02689
G2 X103.104 Y121.539 I-.478 J1.836 E.07274
G1 X102.449 Y122.016 E.02689
G3 X100.484 Y121.358 I-.478 J-1.836 E.07274
G1 X99.828 Y120.881 E.02689
G1 X99.173 Y120.791 E.02194
G1 X98.738 Y120.92 E.01506
G1 X98.737 Y118.23 E.08922
G1 X99.173 Y118.17 E.01459
G1 X99.828 Y118.364 E.02266
G2 X101.139 Y119.396 I7.785 J-8.542 E.05536
G2 X103.104 Y118.738 I.478 J-1.836 E.07274
G1 X103.759 Y118.26 E.02689
G3 X105.725 Y118.918 I.478 J1.836 E.07274
G1 X106.38 Y119.396 E.02689
G2 X108.345 Y118.738 I.478 J-1.836 E.07274
G1 X109.001 Y118.26 E.02689
G3 X110.966 Y118.918 I.478 J1.836 E.07274
G1 X111.621 Y119.396 E.02689
G2 X113.587 Y118.738 I.478 J-1.836 E.07274
G1 X114.242 Y118.26 E.02689
G1 X114.344 Y118.246 E.00343
G1 X114.344 Y115.713 E.08403
G1 X114.242 Y115.744 E.00354
G3 X112.932 Y116.775 I-7.786 J-8.544 E.05536
G3 X110.966 Y116.117 I-.478 J-1.836 E.07274
G1 X110.311 Y115.64 E.02689
G2 X108.345 Y116.298 I-.478 J1.836 E.07274
G1 X107.69 Y116.775 E.02689
G3 X105.725 Y116.117 I-.478 J-1.836 E.07274
G1 X105.07 Y115.64 E.02689
G2 X103.104 Y116.298 I-.461 J1.888 E.07252
G1 X102.449 Y116.775 E.02689
G3 X100.484 Y116.117 I-.478 J-1.836 E.07274
G1 X99.828 Y115.64 E.02689
G1 X99.173 Y115.55 E.02194
G1 X98.737 Y115.679 E.0151
G1 X98.736 Y114.051 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X98.737 Y115.679 E-.61876
G1 X99.093 Y115.573 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/53
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S153
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I-.851 J.87 P1  F42000
G1 X126.831 Y142.734 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G1 X126.852 Y142.845 E.00374
G3 X124.005 Y143.87 I-1.552 J.155 E.13707
G3 X124.001 Y142.135 I-1.298 J-.865 E.26393
G3 X125.107 Y141.452 I1.351 J.95 E.04432
G3 X126.79 Y142.541 I.193 J1.548 E.07223
G1 X126.819 Y142.675 E.00457
M204 S10000
G1 X126.437 Y142.83 F42000
G1 F5400
M204 S6000
G1 X126.451 Y143.011 E.00603
G3 X125.158 Y141.856 I-1.15 J-.014 E.17452
G1 X125.272 Y141.848 E.00382
G3 X126.428 Y142.771 I.029 J1.15 E.05331
M204 S250
G1 X126.048 Y142.868 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.059 Y143.004 E.00418
G3 X125.206 Y142.246 I-.758 J-.006 E.10672
G1 X125.282 Y142.24 E.00233
G3 X126.036 Y142.81 I.019 J.758 E.03133
; WIPE_START
M204 S6000
G1 X126.059 Y143.004 E-.07441
G1 X126.017 Y143.256 E-.09712
G1 X125.95 Y143.396 E-.05919
G1 X125.858 Y143.517 E-.05755
G1 X125.745 Y143.617 E-.05748
G1 X125.614 Y143.693 E-.05756
G1 X125.47 Y143.741 E-.05755
G1 X125.32 Y143.76 E-.05751
G1 X125.095 Y143.732 E-.08611
G1 X124.954 Y143.677 E-.05747
G1 X124.827 Y143.594 E-.0576
G1 X124.751 Y143.52 E-.04046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.411 Y141.89 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.558 Y141.856 E.00499
G1 X122.672 Y141.848 E.00382
G3 X122.334 Y141.907 I.029 J1.15 E.22824
G1 X122.353 Y141.903 E.00062
M204 S250
G1 X122.498 Y142.27 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.606 Y142.246 E.00342
G1 X122.682 Y142.24 E.00233
G3 X122.44 Y142.286 I.019 J.758 E.13881
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.06504
G1 X122.682 Y142.24 E-.02883
G1 X122.833 Y142.251 E-.05751
G1 X122.979 Y142.292 E-.0576
G1 X123.114 Y142.361 E-.05746
G1 X123.232 Y142.456 E-.05757
G1 X123.329 Y142.572 E-.05754
G1 X123.402 Y142.705 E-.05748
G1 X123.446 Y142.849 E-.05759
G1 X123.462 Y143.004 E-.05898
G1 X123.417 Y143.256 E-.09725
G1 X123.35 Y143.396 E-.05919
G1 X123.274 Y143.497 E-.04794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.901 Y143.774 Z2 F42000
G1 X146.704 Y144.348 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.71 Y144.5 E.00505
G3 X143.664 Y141.811 I-2.709 J-.002 E.41214
G1 X143.934 Y141.79 E.00898
G3 X146.696 Y144.23 I.067 J2.708 E.13447
G1 X146.7 Y144.288 E.00192
M204 S10000
G1 X146.292 Y144.374 F42000
G1 F5400
M204 S6000
G1 X146.291 Y144.729 E.01177
G3 X143.714 Y142.215 I-2.29 J-.231 E.34255
G1 X143.944 Y142.198 E.00763
G3 X146.291 Y144.271 I.057 J2.301 E.11425
G1 X146.292 Y144.314 E.00144
M204 S250
G1 X145.902 Y144.402 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
M204 S5000
G1 X145.91 Y144.5 E.00303
G3 X143.763 Y142.605 I-1.909 J-.001 E.26907
G1 X143.953 Y142.59 E.00586
G3 X145.872 Y144.122 I.048 J1.908 E.08194
G1 X145.895 Y144.342 E.0068
; WIPE_START
M204 S6000
G1 X145.91 Y144.5 E-.06031
G1 X145.873 Y144.879 E-.14458
G1 X145.761 Y145.242 E-.14442
G1 X145.579 Y145.576 E-.14459
G1 X145.399 Y145.801 E-.10956
G1 X145.116 Y146.051 E-.14346
G1 X145.086 Y146.068 E-.01309
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.474 Y139.229 Z2 F42000
G1 X148.943 Y138.283 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.102 Y138.023 E.0101
G3 X151.914 Y136.492 I2.899 J1.976 E.1103
G1 X152.089 Y136.492 E.0058
G3 X148.912 Y138.334 I-.087 J3.508 E.60315
M204 S10000
G1 X149.29 Y138.495 F42000
G1 F5400
M204 S6000
G1 X149.438 Y138.253 E.00942
G3 X151.924 Y136.899 I2.563 J1.747 E.0975
G1 X152.078 Y136.899 E.00513
G3 X149.26 Y138.547 I-.077 J3.101 E.53244
M204 S250
G1 X149.624 Y138.699 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.762 Y138.474 E.00812
G3 X151.934 Y137.291 I2.239 J1.526 E.0789
G1 X152.069 Y137.291 E.00415
G3 X149.596 Y138.752 I-.068 J2.709 E.43012
; WIPE_START
M204 S6000
G1 X149.762 Y138.474 E-.12321
G1 X150.055 Y138.115 E-.17575
G1 X150.419 Y137.8 E-.18328
G1 X150.646 Y137.653 E-.10263
G1 X150.886 Y137.53 E-.10269
G1 X151.064 Y137.46 E-.07245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.448 Y130.001 Z2 F42000
G1 X144.886 Y108.941 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X144.991 Y108.977 E.0037
G3 X143.664 Y108.811 I-.99 J2.521 E.5197
G1 X143.934 Y108.79 E.00898
G3 X144.735 Y108.891 I.067 J2.708 E.0269
G1 X144.829 Y108.922 E.00328
M204 S10000
G1 X144.75 Y109.33 F42000
G1 F5400
M204 S6000
G1 X144.843 Y109.357 E.00321
G3 X143.714 Y109.215 I-.841 J2.142 E.44155
G1 X143.944 Y109.198 E.00763
G3 X144.401 Y109.232 I.057 J2.301 E.01523
G1 X144.692 Y109.314 E.01002
M204 S250
G1 X144.644 Y109.706 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
M204 S5000
G1 X144.699 Y109.722 E.00177
G3 X143.763 Y109.605 I-.698 J1.777 E.33929
G1 X143.953 Y109.59 E.00586
G3 X144.333 Y109.619 I.048 J1.908 E.0117
G1 X144.586 Y109.69 E.00808
; WIPE_START
M204 S6000
G1 X144.699 Y109.722 E-.04466
G1 X145.037 Y109.895 E-.14447
G1 X145.335 Y110.133 E-.14459
G1 X145.579 Y110.424 E-.14458
G1 X145.761 Y110.758 E-.14459
G1 X145.868 Y111.103 E-.13711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.237 Y111.255 Z2 F42000
G1 X116.291 Y111.691 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.754 Y111.337 Z2 F42000
G1 X101.812 Y109.906 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.925 Y109.758 E.00618
G3 X103.664 Y108.811 I2.076 J1.74 E.06724
G1 X103.934 Y108.79 E.00897
G3 X101.762 Y109.974 I.068 J2.708 E.47937
G1 X101.776 Y109.955 E.00079
M204 S10000
G1 X102.14 Y110.162 F42000
G1 F5400
M204 S6000
G1 X102.237 Y110.02 E.00569
G3 X103.715 Y109.215 I1.764 J1.478 E.05713
G1 X103.944 Y109.198 E.00762
G3 X101.979 Y110.399 I.057 J2.301 E.39968
G1 X102.107 Y110.211 E.00753
M204 S250
G1 X102.463 Y110.382 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
M204 S5000
G1 X102.538 Y110.272 E.00407
G3 X103.763 Y109.605 I1.463 J1.226 E.0439
G1 X103.953 Y109.59 E.00586
G3 X102.324 Y110.587 I.048 J1.908 E.30711
G1 X102.429 Y110.431 E.00577
; WIPE_START
M204 S6000
G1 X102.538 Y110.272 E-.07315
G1 X102.81 Y110.007 E-.14452
G1 X103.129 Y109.8 E-.14452
G1 X103.395 Y109.689 E-.10948
G1 X103.763 Y109.605 E-.14357
G1 X103.953 Y109.59 E-.07241
G1 X104.143 Y109.605 E-.07234
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.418 Y117.232 Z2 F42000
G1 X105.314 Y142.132 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.471 Y142.223 E.00603
G3 X103.664 Y141.811 I-1.47 J2.275 E.50178
G1 X103.934 Y141.79 E.00897
G3 X105.238 Y142.088 I.068 J2.708 E.04484
G1 X105.262 Y142.102 E.00094
M204 S10000
G1 X105.102 Y142.489 F42000
G1 F5400
M204 S6000
G1 X105.25 Y142.566 E.00555
G3 X103.715 Y142.215 I-1.249 J1.933 E.42633
G1 X103.944 Y142.198 E.00762
G3 X104.843 Y142.357 I.057 J2.301 E.03048
G1 X105.048 Y142.462 E.00767
M204 S250
G1 X104.923 Y142.837 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
M204 S5000
G1 X105.037 Y142.895 E.00394
G3 X103.763 Y142.605 I-1.036 J1.603 E.32759
G1 X103.953 Y142.59 E.00586
G3 X104.699 Y142.722 I.048 J1.908 E.02342
G1 X104.87 Y142.809 E.0059
; WIPE_START
M204 S6000
G1 X105.037 Y142.895 E-.07148
G1 X105.335 Y143.133 E-.14458
G1 X105.579 Y143.424 E-.14456
G1 X105.761 Y143.758 E-.14452
G1 X105.873 Y144.121 E-.14451
G1 X105.902 Y144.41 E-.11035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.331 Y142.658 Z2 F42000
G1 X149.992 Y134.009 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.305 J5.983 E.61444
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.167 J-3.728 E.04473
G3 X143.989 Y150.991 I-5.56 J-2.291 E.23528
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I-.008 J-5.996 E.31294
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.174 Y105.014 E1.3322
G3 X149.992 Y111.013 I-.175 J5.99 E.30675
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.325 J6.39 E.65601
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08814
G1 X149.04 Y148.939 E.0061
G3 X143.994 Y151.398 I-5.046 J-3.947 E.19277
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I-.003 J-6.403 E.33382
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.184 Y104.607 E1.33269
G3 X150.399 Y111.008 I-.185 J6.397 E.32746
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.63462
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.564 J-1.809 E.27221
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.002 J-6.795 E.32784
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.194 Y104.215 E1.23493
G3 X150.791 Y111.003 I-.195 J6.789 E.3218
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
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


G1 X149.825 Y133.146 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X141.557 Y113.963 E1.07839
G2 X142.29 Y114.522 I2.148 J-2.058 E.04775
G1 X149.622 Y131.535 E.95642
G1 X149.622 Y130.394 E.05891
G1 X142.899 Y114.794 E.87695
G2 X143.448 Y114.926 I.929 J-2.669 E.02916
G1 X149.622 Y129.253 E.80542
G1 X149.622 Y128.112 E.05891
G1 X143.959 Y114.972 E.73867
G2 X144.432 Y114.943 I.091 J-2.379 E.02451
G1 X149.622 Y126.97 E.67628
G1 X149.622 Y125.829 E.05891
G1 X144.893 Y114.855 E.61691
G2 X145.322 Y114.711 I-1.327 J-4.64 E.0234
G1 X149.622 Y124.688 E.5609
G1 X149.622 Y123.547 E.05891
G1 X145.727 Y114.51 E.50804
M73 P50 R16
G2 X146.11 Y114.257 I-1.073 J-2.041 E.02373
G1 X149.622 Y122.406 E.45809
G1 X149.622 Y121.265 E.05891
G1 X146.467 Y113.944 E.41156
G2 X146.794 Y113.56 I-1.751 J-1.821 E.02605
G1 X149.622 Y120.123 E.36897
G1 X149.622 Y118.982 E.05891
G1 X147.085 Y113.094 E.33101
G2 X147.324 Y112.509 I-4.122 J-2.033 E.03264
G1 X149.622 Y117.841 E.29972
G1 X149.622 Y116.7 E.05891
G1 X147.465 Y111.695 E.28134
G2 X147.127 Y109.994 I-3.388 J-.21 E.09053
G2 X146.237 Y108.846 I-3.099 J1.482 E.07557
M73 P50 R15
G1 X144.769 Y105.439 E.19153
G2 X144.256 Y105.389 I-.54 J2.891 E.02666
G1 X145.55 Y108.392 E.16884
G2 X144.959 Y108.161 I-1.45 J2.84 E.03283
G1 X143.761 Y105.383 E.15617
G1 X143.27 Y105.383 E.02539
G1 X144.421 Y108.056 E.15023
G2 X143.917 Y108.027 I-.408 J2.715 E.02611
G1 X142.778 Y105.384 E.14861
G1 X142.286 Y105.384 E.02539
G1 X143.448 Y108.081 E.15162
G2 X142.998 Y108.178 I.158 J1.822 E.02383
G1 X141.794 Y105.384 E.15707
G1 X141.302 Y105.384 E.02539
G1 X142.574 Y108.333 E.1658
G2 X142.175 Y108.549 I2.583 J5.241 E.02342
G1 X140.811 Y105.384 E.17795
G1 X140.319 Y105.384 E.02539
G1 X141.799 Y108.818 E.19307
G2 X141.448 Y109.145 I3.31 J3.909 E.02476
G1 X139.827 Y105.384 E.21143
G1 X139.335 Y105.384 E.02539
G1 X141.131 Y109.55 E.23423
G2 X140.851 Y110.041 I3.262 J2.188 E.0292
G1 X138.843 Y105.384 E.26182
G1 X138.352 Y105.384 E.02539
G1 X140.629 Y110.669 E.29709
G2 X140.531 Y111.583 I3.61 J.849 E.04758
G1 X137.773 Y105.181 E.35986
M106 S153
M204 S10000
G1 X133.346 Y105.182 F42000
M106 S255
G1 F3000
M204 S6000
G1 X148.152 Y139.536 E1.93129
G3 X148.32 Y138.784 I4.272 J.558 E.03983
G1 X133.925 Y105.384 E1.87763
G1 X134.417 Y105.384 E.02539
G1 X148.563 Y138.208 E1.84522
G3 X148.853 Y137.739 I4.084 J2.198 E.02848
G1 X134.909 Y105.384 E1.81885
G1 X135.401 Y105.384 E.02539
G1 X149.175 Y137.345 E1.79673
G3 X149.526 Y137.018 I2.803 J2.655 E.02478
G1 X135.893 Y105.384 E1.77834
G1 X136.384 Y105.384 E.02539
G1 X149.9 Y136.744 E1.76296
G3 X150.295 Y136.52 I1.317 J1.862 E.0235
G1 X136.876 Y105.384 E1.75036
G1 X137.368 Y105.384 E.02539
G1 X150.711 Y136.344 E1.74045
G3 X151.148 Y136.216 I2.492 J7.702 E.0235
G1 X150.356 Y134.379 E.10327
G1 X150.848 Y134.379 E.02539
G1 X151.608 Y136.144 E.09921
G3 X152.093 Y136.126 I.329 J2.414 E.02506
G1 X151.34 Y134.379 E.09823
G1 X151.831 Y134.379 E.02539
G1 X152.604 Y136.17 E.10071
G3 X153.151 Y136.299 I-1.253 J6.58 E.02902
G1 X152.331 Y134.396 E.10694
G1 X152.453 Y134.402 E.0063
G3 X152.846 Y134.451 I-.043 J1.979 E.0205
G1 X153.639 Y136.29 E.10338
M106 S153
; WIPE_START
G1 X152.847 Y134.453 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.396 Y141.926 Z2 F42000
G1 X154.6 Y142.91 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F9547.299
M204 S6000
G3 X153.938 Y143.386 I-14.515 J-19.474 E.02506
G1 X153.585 Y143.552 E.01196
G1 X154.259 Y145.115 E.05231
G1 X154.918 Y144.778 E.02275
G1 X155.599 Y144.288 E.02577
G1 X156.007 Y143.91 E.0171
G1 X156.547 Y143.266 E.02581
G2 X157.458 Y141.248 I-4.538 J-3.262 E.06849
G1 X157.583 Y140.418 E.02578
G2 X157.305 Y138.257 I-5.473 J-.394 E.06742
G1 X157 Y137.485 E.0255
G2 X155.845 Y135.936 I-5.359 J2.79 E.05962
G1 X155.427 Y135.576 E.01694
G1 X154.807 Y135.167 E.02285
G2 X153.678 Y134.671 I-3.168 J5.678 E.03793
G1 X153.899 Y135.184 E.01718
G1 X153.884 Y135.362 E.00548
G1 X153.728 Y135.464 E.00573
G1 X153.899 Y136.601 E.03534
G1 X154.419 Y136.939 E.01905
G1 X154.977 Y137.478 E.02386
G3 X155.723 Y138.832 I-3.587 J2.858 E.04772
G1 X155.878 Y139.578 E.02342
G1 X155.884 Y140.344 E.02353
G3 X155.436 Y141.849 I-4.413 J-.496 E.04851
G3 X154.642 Y142.867 I-4.072 J-2.358 E.0398
M204 S10000
G1 X155.783 Y141.996 F42000
G1 F9547.299
M204 S6000
G3 X154.87 Y143.173 I-4.508 J-2.554 E.04595
G2 X154.086 Y143.76 I29.166 J39.796 E.03009
G1 X154.446 Y144.596 E.02797
G2 X156.243 Y143.042 I-2.518 J-4.728 E.07362
G2 X157.089 Y141.168 I-4.22 J-3.032 E.06358
G1 X157.207 Y140.385 E.02433
G2 X156.945 Y138.368 I-5.035 J-.371 E.06295
G1 X156.656 Y137.64 E.02405
G2 X155.569 Y136.192 I-4.999 J2.623 E.05588
G1 X155.185 Y135.865 E.0155
G1 X154.602 Y135.483 E.02141
G1 X154.241 Y135.3 E.01245
G1 X154.237 Y135.503 E.00622
G1 X154.133 Y135.624 E.00491
G1 X154.246 Y136.377 E.02339
G1 X154.68 Y136.664 E.01596
G1 X155.241 Y137.208 E.02402
G3 X156.07 Y138.686 I-3.858 J3.139 E.05232
G1 X156.247 Y139.504 E.02571
G1 X156.262 Y140.344 E.02583
G3 X156.065 Y141.328 I-7.741 J-1.036 E.03085
G1 X155.807 Y141.94 E.02042
; WIPE_START
G1 X156.065 Y141.328 E-.25253
G1 X156.151 Y140.973 E-.13894
G1 X156.262 Y140.344 E-.24254
G1 X156.256 Y140.012 E-.12599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.682 Y136.097 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.611167
G1 F6335.275
M204 S6000
G1 X155.039 Y136.356 E.02044
G1 X155.566 Y136.875 E.03425
G3 X156.5 Y138.505 I-3.693 J3.198 E.08752
G1 X156.711 Y139.41 E.04304
G1 X156.735 Y140.344 E.04327
G3 X156.501 Y141.512 I-5.641 J-.523 E.05525
G1 X156.216 Y142.178 E.03355
G1 X155.857 Y142.757 E.03154
G1 X155.389 Y143.321 E.03396
G3 X154.715 Y143.878 I-2.474 J-2.311 E.04058
M204 S10000
G1 X152.845 Y143.577 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X153.622 Y145.38 E.10132
G1 X153.178 Y145.493 E.02361
G1 X152.471 Y143.851 E.09232
G3 X151.99 Y143.876 I-.367 J-2.391 E.0249
G1 X152.72 Y145.569 E.09522
G3 X152.247 Y145.614 I-1.422 J-12.705 E.02452
G1 X151.483 Y143.84 E.09969
G3 X150.945 Y143.733 I.857 J-5.692 E.02834
G1 X151.756 Y145.615 E.10583
G1 X151.265 Y145.617 E.02535
G1 X150.356 Y143.509 E.1185
G3 X149.694 Y143.114 I2.506 J-4.952 E.03984
G1 X150.774 Y145.618 E.14081
G1 X150.282 Y145.62 E.02535
G1 X132.942 Y105.384 E2.26191
G1 X132.45 Y105.384 E.02539
G1 X149.791 Y145.622 E2.262
G1 X149.71 Y145.622 E.00417
G1 X149.53 Y146.157 E.02914
G1 X131.958 Y105.384 E2.29208
G1 X131.466 Y105.384 E.02539
G1 X149.314 Y146.797 E2.32807
G3 X149.079 Y147.393 I-2.756 J-.744 E.03313
G1 X130.975 Y105.384 E2.36155
G1 X130.483 Y105.384 E.02539
G1 X146.172 Y141.788 E2.04648
G3 X147.461 Y144.78 I-2.186 J2.716 E.17498
G1 X148.81 Y147.909 E.1759
G3 X148.507 Y148.348 I-3.121 J-1.825 E.02756
G1 X147.307 Y145.562 E.15658
G3 X147.063 Y146.138 I-3 J-.929 E.03234
G1 X148.188 Y148.749 E.14676
G3 X147.846 Y149.095 I-2.524 J-2.158 E.02516
G1 X146.768 Y146.594 E.1406
G3 X146.439 Y146.973 I-2.175 J-1.55 E.02594
G1 X147.486 Y149.402 E.13654
G3 X147.113 Y149.679 I-2.74 J-3.305 E.02397
G1 X146.079 Y147.279 E.13489
G3 X145.695 Y147.529 I-1.438 J-1.796 E.02369
G1 X146.723 Y149.914 E.13409
G3 X146.318 Y150.114 I-1.304 J-2.124 E.02338
G1 X145.288 Y147.726 E.13427
G3 X144.856 Y147.864 I-1.788 J-4.853 E.02344
G1 X145.899 Y150.285 E.1361
G3 X145.467 Y150.423 I-1.263 J-3.21 E.02345
G1 X144.4 Y147.947 E.1392
G3 X144.088 Y147.969 I-.265 J-1.548 E.01618
G1 X143.919 Y147.973 E.0087
G1 X145.018 Y150.521 E.14327
G3 X144.559 Y150.593 I-.711 J-3.058 E.024
G1 X143.404 Y147.918 E.15042
G3 X142.851 Y147.776 I.709 J-3.908 E.0295
G1 X144.075 Y150.616 E.15969
M73 P51 R15
G3 X143.585 Y150.621 I-.292 J-4.995 E.0253
G1 X142.236 Y147.49 E.176
G3 X141.487 Y146.895 I1.948 J-3.217 E.04949
G1 X143.093 Y150.621 E.20945
G1 X142.601 Y150.621 E.02539
G1 X131.129 Y124 E1.4965
M106 S153
M204 S10000
G1 X131.62 Y124 F42000
M106 S255
G1 F3000
M204 S6000
G1 X140.532 Y144.678 E1.16241
G3 X140.616 Y143.733 I3.156 J-.194 E.04918
G1 X132.199 Y124.203 E1.09789
G1 X132.691 Y124.203 E.02539
G1 X140.831 Y143.089 E1.06169
G3 X141.106 Y142.587 I3.31 J1.49 E.02959
G1 X133.004 Y123.788 E1.05682
G1 X133.004 Y122.646 E.05891
G1 X141.421 Y142.177 E1.09792
G3 X141.769 Y141.842 I3.175 J2.952 E.02492
G1 X133.004 Y121.505 E1.14327
G1 X133.004 Y120.364 E.05891
G1 X142.143 Y141.57 E1.19209
G3 X142.54 Y141.35 I1.296 J1.874 E.02347
G1 X133.004 Y119.223 E1.24389
G1 X133.004 Y118.082 E.05891
G1 X142.962 Y141.188 E1.29894
G3 X143.408 Y141.081 I.756 J2.178 E.02371
G1 X133.004 Y116.941 E1.3571
G1 X133.004 Y115.799 E.05891
G1 X143.881 Y141.037 E1.41875
G3 X144.379 Y141.05 I.195 J1.965 E.02578
G1 X133.004 Y114.658 E1.48367
G1 X133.004 Y113.517 E.05891
G1 X144.913 Y141.149 E1.55337
G3 X145.5 Y141.37 I-1.199 J4.081 E.03239
G1 X132.802 Y111.906 E1.65634
M106 S153
M204 S10000
G1 X132.583 Y111.399 F42000
M106 S255
G1 F3000
M204 S6000
G1 X129.991 Y105.384 E.33814
G1 X129.499 Y105.384 E.02539
G1 X132.004 Y111.197 E.32676
G1 X131.512 Y111.197 E.02539
G1 X129.007 Y105.385 E.32675
G1 X128.516 Y105.385 E.02539
G1 X131.021 Y111.197 E.32675
G1 X130.529 Y111.197 E.02539
G1 X128.024 Y105.385 E.32675
G1 X127.532 Y105.385 E.02539
G1 X130.037 Y111.197 E.32675
G1 X129.545 Y111.197 E.02539
G1 X127.04 Y105.385 E.32675
G1 X126.548 Y105.385 E.02539
G1 X129.053 Y111.197 E.32675
G1 X128.561 Y111.197 E.02539
G1 X126.057 Y105.385 E.32674
G1 X125.565 Y105.385 E.02539
G1 X128.07 Y111.197 E.32674
G1 X127.578 Y111.197 E.02539
G1 X125.073 Y105.385 E.32674
G1 X124.581 Y105.385 E.02539
G1 X127.086 Y111.197 E.32674
G1 X126.594 Y111.197 E.02539
G1 X124.089 Y105.385 E.32674
G1 X123.597 Y105.385 E.02539
G1 X126.102 Y111.197 E.32673
G1 X125.611 Y111.197 E.02539
G1 X123.106 Y105.385 E.32673
G1 X122.614 Y105.385 E.02539
G1 X125.119 Y111.197 E.32673
G1 X124.627 Y111.197 E.02539
G1 X122.122 Y105.385 E.32673
G1 X121.63 Y105.385 E.02539
G1 X124.135 Y111.197 E.32673
G1 X123.643 Y111.197 E.02539
G1 X121.138 Y105.385 E.32672
G1 X120.647 Y105.385 E.02539
G1 X123.151 Y111.197 E.32672
G1 X122.66 Y111.197 E.02539
G1 X120.155 Y105.385 E.32672
G1 X119.663 Y105.385 E.02539
G1 X122.168 Y111.197 E.32672
G1 X121.676 Y111.197 E.02539
G1 X119.171 Y105.385 E.32671
G1 X118.679 Y105.385 E.02539
G1 X121.184 Y111.197 E.32671
G1 X120.692 Y111.197 E.02539
G1 X118.188 Y105.385 E.32671
G1 X117.696 Y105.385 E.02539
G1 X120.201 Y111.197 E.32671
G1 X119.709 Y111.197 E.02539
G1 X117.204 Y105.385 E.32671
G1 X116.712 Y105.385 E.02539
G1 X119.217 Y111.197 E.32671
G1 X118.725 Y111.197 E.02539
G1 X116.22 Y105.385 E.3267
G1 X115.729 Y105.385 E.02539
G1 X118.233 Y111.197 E.3267
G1 X117.741 Y111.197 E.02539
G1 X115.237 Y105.386 E.3267
G1 X114.745 Y105.386 E.02539
G1 X117.25 Y111.197 E.3267
G1 X116.758 Y111.197 E.02539
G1 X114.253 Y105.386 E.3267
G1 X113.761 Y105.386 E.02539
G1 X116.266 Y111.197 E.32669
G1 X115.774 Y111.197 E.02539
G1 X113.27 Y105.386 E.32669
G1 X112.778 Y105.386 E.02539
G1 X115.282 Y111.197 E.32669
G1 X114.998 Y111.197 E.01467
G1 X114.998 Y111.679 E.02487
G1 X112.286 Y105.386 E.35377
G1 X111.794 Y105.386 E.02539
G1 X114.998 Y112.82 E.41792
G1 X114.998 Y113.961 E.05891
G1 X111.302 Y105.386 E.48207
G1 X110.811 Y105.386 E.02539
G1 X114.998 Y115.102 E.54622
G1 X114.998 Y116.243 E.05891
G1 X110.319 Y105.386 E.61037
G1 X109.827 Y105.386 E.02539
G1 X114.998 Y117.385 E.67452
G1 X114.998 Y118.526 E.05891
G1 X109.335 Y105.386 E.73867
G1 X108.843 Y105.386 E.02539
G1 X114.998 Y119.667 E.80282
G1 X114.998 Y120.808 E.05891
G1 X108.352 Y105.386 E.86697
G1 X107.86 Y105.386 E.02539
G1 X114.998 Y121.949 E.93112
G1 X114.998 Y123.09 E.05891
G1 X107.368 Y105.386 E.99527
G1 X106.876 Y105.386 E.02539
G1 X116.5 Y127.717 E1.25535
G1 X116.008 Y127.717 E.02539
G1 X106.384 Y105.386 E1.25535
G1 X105.893 Y105.386 E.02539
G1 X115.718 Y128.184 E1.28163
G1 X115.718 Y129.326 E.05891
G1 X105.313 Y105.184 E1.35717
M106 S153
; WIPE_START
G1 X106.105 Y107.02 E-.76
; WIPE_END
M73 P52 R15
G1 E-.04 F1800
M204 S10000
G1 X106.701 Y112.97 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.388525
; LAYER_HEIGHT: 0.2
G1 F10416.515
M204 S6000
G1 X106.938 Y112.406 E.01725
G1 X107.06 Y111.806 E.01723
G1 X107.06 Y111.194 E.01723
G1 X106.938 Y110.594 E.01723
G1 X106.701 Y110.03 E.01725
G1 X106.356 Y109.524 E.01724
G1 X105.918 Y109.097 E.01723
G1 X105.403 Y108.765 E.01724
G1 X104.833 Y108.541 E.01724
G1 X104.235 Y108.435 E.01713
G2 X103.3 Y108.501 I-.243 J3.214 E.02649
G1 X102.736 Y108.698 E.0168
G1 X102.206 Y109.003 E.01724
G1 X101.746 Y109.408 E.01725
G1 X101.377 Y109.896 E.01725
G1 X101.111 Y110.448 E.01725
G1 X100.96 Y111.042 E.01725
G1 X100.929 Y111.653 E.01725
G1 X101.021 Y112.262 E.01732
G1 X101.293 Y112.957 E.02102
G1 X101.606 Y113.432 E.01602
G1 X101.965 Y113.806 E.01461
G1 X102.463 Y114.164 E.01728
G1 X103.022 Y114.416 E.01725
G1 X103.619 Y114.552 E.01725
G1 X104.231 Y114.567 E.01725
G1 X104.834 Y114.461 E.01725
G1 X105.404 Y114.237 E.01725
G1 X105.919 Y113.904 E.01725
G1 X106.353 Y113.473 E.01723
G1 X106.666 Y113.019 E.01554
M204 S10000
G1 X106.797 Y113.191 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X122.927 Y150.617 E2.10398
G1 X122.435 Y150.617 E.02539
G1 X106.578 Y113.824 E2.06838
G3 X106.231 Y114.16 I-1.851 J-1.566 E.02497
G1 X121.943 Y150.617 E2.04949
G1 X121.451 Y150.617 E.02539
G1 X105.858 Y114.435 E2.03403
G3 X105.458 Y114.649 I-1.273 J-1.891 E.02344
G1 X120.959 Y150.617 E2.02197
G1 X120.468 Y150.617 E.02539
G1 X105.037 Y114.812 E2.01279
G3 X104.593 Y114.923 I-1.508 J-5.119 E.02364
G1 X119.976 Y150.617 E2.00658
G1 X119.484 Y150.617 E.02539
G1 X104.12 Y114.968 E2.00404
G3 X103.621 Y114.951 I-.14 J-3.238 E.02581
G1 X118.992 Y150.616 E2.00498
G1 X118.5 Y150.616 E.02539
G1 X103.084 Y114.846 E2.01085
G3 X102.499 Y114.629 I.981 J-3.535 E.03229
G1 X118.008 Y150.616 E2.02308
G1 X117.516 Y150.616 E.02539
G1 X101.627 Y113.749 E2.07255
M106 S153
M204 S10000
G1 X98.18 Y121.726 F42000
M106 S255
G1 F3000
M204 S6000
G1 X110.63 Y150.615 E1.62405
G1 X111.122 Y150.615 E.02539
G1 X98.382 Y121.054 E1.66181
G1 X98.382 Y119.912 E.05894
G1 X111.614 Y150.615 E1.726
G1 X112.106 Y150.615 E.02539
G1 X98.382 Y118.77 E1.79019
G1 X98.381 Y117.629 E.05894
G1 X112.598 Y150.615 E1.85438
G1 X113.09 Y150.615 E.02539
G1 X98.381 Y116.487 E1.91857
G1 X98.381 Y115.345 E.05894
G1 X113.582 Y150.615 E1.98277
G1 X114.073 Y150.616 E.02539
G1 X98.381 Y114.203 E2.04696
G1 X98.38 Y113.062 E.05894
G1 X114.565 Y150.616 E2.11115
G1 X115.057 Y150.616 E.02539
G1 X98.38 Y111.92 E2.17534
G3 X98.391 Y110.803 I11.44 J-.451 E.05769
G1 X115.549 Y150.616 E2.23813
G1 X116.041 Y150.616 E.02539
G1 X98.491 Y109.895 E2.2892
G1 X98.534 Y109.725 E.00905
G3 X98.683 Y109.199 I2.742 J.498 E.02823
G1 X116.533 Y150.616 E2.32828
G1 X117.025 Y150.616 E.02539
G1 X98.921 Y108.611 E2.36138
G3 X99.194 Y108.102 I2.722 J1.128 E.02986
G1 X100.541 Y111.228 E.17578
G3 X100.695 Y110.445 I3.532 J.289 E.0413
G1 X99.493 Y107.655 E.15685
G3 X99.815 Y107.26 I2.165 J1.435 E.02634
G1 X100.939 Y109.868 E.14663
G3 X101.231 Y109.404 I2.468 J1.228 E.02835
G1 X100.155 Y106.909 E.14025
G3 X100.513 Y106.598 I1.758 J1.658 E.02452
G1 X101.562 Y109.032 E.13684
G3 X101.92 Y108.722 I1.731 J1.634 E.02451
G1 X100.886 Y106.322 E.13488
G1 X101.277 Y106.088 E.02352
G1 X102.304 Y108.471 E.13396
G3 X102.713 Y108.278 I1.168 J1.947 E.02337
G1 X101.682 Y105.887 E.13443
G3 X102.098 Y105.711 I1.398 J2.733 E.02334
G1 X103.143 Y108.137 E.13635
G3 X103.598 Y108.051 I1.127 J4.708 E.0239
M73 P53 R15
G1 X102.533 Y105.579 E.13895
G3 X102.982 Y105.479 I.732 J2.229 E.02377
G1 X104.084 Y108.036 E.14375
G3 X104.593 Y108.077 I.093 J2.026 E.02646
G1 X103.445 Y105.414 E.14973
G3 X103.925 Y105.386 I.38 J2.424 E.02486
G1 X105.149 Y108.225 E.15959
G3 X105.764 Y108.511 I-1.171 J3.323 E.03507
G1 X104.417 Y105.386 E.17567
G1 X104.909 Y105.386 E.02539
G1 X106.511 Y109.104 E.20899
G3 X107.466 Y111.32 I-2.481 J2.383 E.12727
G1 X115.718 Y130.467 E1.07638
G1 X115.718 Y131.608 E.05891
G1 X107.385 Y112.272 E1.08698
G3 X107.17 Y112.916 I-3.693 J-.874 E.03506
G1 X115.921 Y133.219 E1.14137
M106 S153
M204 S10000
M73 P53 R14
G1 X116.292 Y134.081 F42000
M106 S255
G1 F3000
M204 S6000
G1 X123.419 Y150.617 E.92963
G1 X123.911 Y150.617 E.02539
G1 X116.871 Y134.283 E.91825
G1 X117.363 Y134.283 E.02539
G1 X120.795 Y142.246 E.44767
G1 X121.004 Y141.842 E.0235
G1 X121.076 Y141.757 E.00573
G1 X117.855 Y134.283 E.42017
G1 X118.346 Y134.283 E.02539
G1 X121.418 Y141.409 E.40062
G3 X121.798 Y141.151 I1.048 J1.136 E.02383
G1 X118.838 Y134.283 E.38611
G1 X119.284 Y134.283 E.02302
G1 X119.284 Y134.177 E.0055
G1 X122.224 Y140.998 E.38346
G1 X122.239 Y140.993 E.00084
G1 X122.295 Y140.468 E.02723
G1 X122.484 Y140.46 E.00974
G1 X119.284 Y133.035 E.41739
G1 X119.284 Y131.894 E.05891
G1 X122.967 Y140.439 E.48036
G1 X123.182 Y140.435 E.01111
G1 X123.414 Y140.335 E.01305
G1 X119.284 Y130.753 E.53868
G1 X119.284 Y129.612 E.05891
G1 X123.829 Y140.157 E.59279
G1 X123.91 Y140.122 E.00456
G1 X124.673 Y141.047 E.06194
G1 X124.7 Y141.038 E.00148
G1 X119.284 Y128.471 E.7065
G1 X119.284 Y127.717 E.03891
G1 X118.959 Y127.717 E.01677
G1 X117.445 Y124.203 E.19754
G1 X117.937 Y124.203 E.02539
G1 X125.155 Y140.952 E.94156
G3 X125.657 Y140.976 I.141 J2.282 E.02602
G1 X118.428 Y124.203 E.94293
G1 X118.92 Y124.203 E.02539
G1 X126.376 Y141.502 E.97249
M106 S153
M204 S10000
G1 X122.754 Y140.959 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.6245
; LAYER_HEIGHT: 0.2
G1 F6190.034
M204 S6000
G1 X122.97 Y140.963 E.0102
M204 S10000
G1 X123.239 Y140.929 F42000
; LINE_WIDTH: 0.596483
G1 F6503.331
M204 S6000
G1 X123.134 Y140.947 E.00478
; LINE_WIDTH: 0.624988
G1 F6184.85
G1 X123.03 Y140.964 E.00503
; LINE_WIDTH: 0.62133
G1 F6223.959
G1 X123.216 Y141.045 E.00957
; LINE_WIDTH: 0.58551
G1 F6634.845
G1 X123.402 Y141.126 E.00898
; LINE_WIDTH: 0.54969
G1 F7103.814
G1 X123.589 Y141.207 E.00839
; LINE_WIDTH: 0.515483
G1 F7618.04
G1 X123.797 Y141.373 E.01026
; LINE_WIDTH: 0.473186
G1 F8366.926
G1 X124.005 Y141.539 E.00934
G1 X124.309 Y141.292 E.01374
; LINE_WIDTH: 0.482888
G1 F8182.422
G1 X124.099 Y141.063 E.01115
; LINE_WIDTH: 0.521531
G1 F7521.773
G3 X123.772 Y140.692 I3.367 J-3.299 E.01929
; LINE_WIDTH: 0.544393
G1 F7178.859
G1 X123.533 Y140.799 E.0107
; LINE_WIDTH: 0.569618
G1 F6835.043
G1 X123.293 Y140.905 E.01123
; WIPE_START
G1 X123.533 Y140.799 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.03 Y144.321 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X123.967 Y144.357 E.00204
G1 X124.015 Y144.386 E.00155
; WIPE_START
G1 X123.967 Y144.357 E-.32875
G1 X124.03 Y144.321 E-.43125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.819 Y144.622 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X124.402 Y150.617 E.33705
G1 X124.894 Y150.618 E.02539
G1 X122.488 Y145.034 E.31391
G2 X122.976 Y145.025 I.224 J-1.213 E.02538
G1 X125.386 Y150.618 E.31438
G1 X125.878 Y150.618 E.02539
G1 X123.42 Y144.915 E.32061
G2 X123.825 Y144.713 I-.31 J-1.132 E.0235
G1 X126.37 Y150.618 E.33194
G1 X126.862 Y150.618 E.02539
G1 X124.367 Y144.829 E.32544
G2 X124.942 Y145.023 I1.053 J-2.177 E.03142
G1 X127.354 Y150.618 E.31455
G1 X127.846 Y150.618 E.02539
G1 X125.442 Y145.042 E.31347
G2 X125.897 Y144.956 I.014 J-1.168 E.02405
G1 X128.337 Y150.618 E.31832
G1 X128.829 Y150.618 E.02539
G1 X126.311 Y144.776 E.32843
G1 X126.465 Y144.687 E.00918
G2 X126.69 Y144.514 I-.401 J-.756 E.01472
G1 X129.321 Y150.618 E.34317
G1 X129.813 Y150.618 E.02539
G1 X127.018 Y144.134 E.36456
G1 X127.057 Y144.083 E.00331
G2 X127.27 Y143.577 I-2.111 J-1.183 E.02841
G1 X130.305 Y150.619 E.39587
G1 X130.797 Y150.619 E.02539
G1 X119.412 Y124.203 E1.48499
G1 X119.904 Y124.203 E.02539
G1 X131.289 Y150.619 E1.485
G1 X131.78 Y150.619 E.02539
G1 X120.396 Y124.203 E1.485
G1 X120.888 Y124.203 E.02539
G1 X132.272 Y150.619 E1.48501
G1 X132.764 Y150.619 E.02539
G1 X121.379 Y124.203 E1.48501
G1 X121.871 Y124.203 E.02539
G1 X133.256 Y150.619 E1.48502
G1 X133.748 Y150.619 E.02539
G1 X122.363 Y124.203 E1.48502
G1 X122.855 Y124.203 E.02539
G1 X134.24 Y150.619 E1.48503
G1 X134.732 Y150.619 E.02539
G1 X123.347 Y124.203 E1.48503
G1 X123.839 Y124.203 E.02539
G1 X135.223 Y150.62 E1.48504
G1 X135.715 Y150.62 E.02539
G1 X124.33 Y124.203 E1.48504
G1 X124.822 Y124.203 E.02539
G1 X128.718 Y133.243 E.50818
G1 X128.718 Y132.102 E.05891
G1 X125.314 Y124.203 E.44402
G1 X125.806 Y124.203 E.02539
G1 X128.718 Y130.96 E.37987
G1 X128.718 Y129.819 E.05891
G1 X126.298 Y124.203 E.31572
G1 X126.789 Y124.203 E.02539
G1 X128.718 Y128.678 E.25157
G1 X128.718 Y127.717 E.04961
G1 X128.796 Y127.717 E.00401
G1 X127.281 Y124.203 E.19754
G1 X127.773 Y124.203 E.02539
G1 X129.288 Y127.717 E.19754
G1 X129.779 Y127.717 E.02539
G1 X128.265 Y124.203 E.19754
G1 X128.757 Y124.203 E.02539
G1 X130.271 Y127.717 E.19754
G1 X130.763 Y127.717 E.02539
G1 X129.249 Y124.203 E.19754
G1 X129.74 Y124.203 E.02539
G1 X131.255 Y127.717 E.19754
G1 X131.747 Y127.717 E.02539
M73 P54 R14
G1 X130.232 Y124.203 E.19754
G1 X130.724 Y124.203 E.02539
G1 X142.109 Y150.621 E1.48511
G1 X141.618 Y150.621 E.02539
G1 X132.284 Y128.964 E1.21745
G1 X132.284 Y130.105 E.05891
G1 X141.126 Y150.621 E1.15329
G1 X140.634 Y150.621 E.02539
G1 X132.284 Y131.247 E1.08913
G1 X132.284 Y132.388 E.05891
G1 X140.142 Y150.62 E1.02497
G1 X139.65 Y150.62 E.02539
G1 X132.284 Y133.529 E.96082
G1 X132.284 Y134.283 E.03893
G1 X132.117 Y134.283 E.00861
G1 X139.158 Y150.62 E.91842
G1 X138.666 Y150.62 E.02539
G1 X131.626 Y134.283 E.91841
G1 X131.134 Y134.283 E.02539
G1 X138.175 Y150.62 E.91841
G1 X137.683 Y150.62 E.02539
G1 X130.642 Y134.283 E.9184
G1 X130.15 Y134.283 E.02539
G1 X137.191 Y150.62 E.9184
G1 X136.699 Y150.62 E.02539
G1 X129.658 Y134.283 E.91839
G1 X129.166 Y134.283 E.02539
G1 X136.294 Y150.822 E.92977
M106 S153
M204 S10000
G1 X141.746 Y142.408 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.388583
; LAYER_HEIGHT: 0.2
G1 F10414.777
M204 S6000
G1 X141.377 Y142.896 E.01726
G1 X141.111 Y143.448 E.01725
G1 X140.96 Y144.041 E.01722
G1 X140.932 Y144.707 E.01877
G1 X141.02 Y145.259 E.01575
G1 X141.23 Y145.834 E.01726
G1 X141.549 Y146.357 E.01726
G1 X141.966 Y146.806 E.01724
G1 X142.463 Y147.164 E.01727
G1 X143.021 Y147.416 E.01724
G1 X143.619 Y147.552 E.01725
G1 X144.231 Y147.567 E.01725
G1 X144.834 Y147.461 E.01725
G1 X145.404 Y147.237 E.01725
G1 X145.919 Y146.905 E.01725
G1 X146.371 Y146.451 E.01804
G1 X146.7 Y145.97 E.01642
G1 X146.938 Y145.406 E.01726
G1 X147.06 Y144.806 E.01724
G1 X147.06 Y144.194 E.01723
G1 X146.938 Y143.594 E.01723
G1 X146.701 Y143.03 E.01725
G1 X146.356 Y142.524 E.01724
G1 X145.918 Y142.097 E.01724
G1 X145.403 Y141.765 E.01725
G1 X144.834 Y141.541 E.01724
G1 X144.235 Y141.435 E.01713
G2 X143.3 Y141.501 I-.243 J3.213 E.0265
G1 X142.737 Y141.698 E.0168
G1 X142.205 Y142.003 E.01725
G1 X141.791 Y142.368 E.01556
M204 S10000
G1 X130.288 Y129.287 F42000
; LINE_WIDTH: 0.46975
G1 F8434.271
M204 S6000
G1 X130.288 Y132.713 E.11919
G1 X130.715 Y132.713 E.01485
G1 X130.715 Y129.287 E.11919
G1 X130.348 Y129.287 E.01276
M204 S10000
G1 X129.886 Y128.885 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X129.886 Y133.115 E.13
G1 X131.116 Y133.115 E.03782
G1 X131.116 Y128.885 E.13
G1 X129.946 Y128.885 E.03597
M204 S10000
G1 X129.509 Y128.508 F42000
G1 F9547.299
M204 S6000
G1 X129.509 Y133.492 E.15317
G1 X131.494 Y133.492 E.06099
G1 X131.494 Y128.508 E.15317
G1 X129.569 Y128.508 E.05914
M204 S10000
G1 X129.132 Y128.13 F42000
G1 F9547.299
M204 S6000
G1 X129.132 Y133.87 E.17634
G1 X131.871 Y133.87 E.08416
G1 X131.871 Y128.13 E.17634
G1 X129.192 Y128.13 E.08232
M204 S10000
G1 X117.715 Y129.287 F42000
; LINE_WIDTH: 0.46976
G1 F8434.074
M204 S6000
G1 X117.288 Y129.287 E.01485
G1 X117.288 Y132.713 E.11919
G1 X117.715 Y132.713 E.01485
G1 X117.715 Y129.347 E.11711
M204 S10000
G1 X118.116 Y128.885 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X116.886 Y128.885 E.03782
G1 X116.886 Y133.115 E.13
G1 X118.116 Y133.115 E.03782
G1 X118.116 Y128.945 E.12815
M204 S10000
G1 X118.494 Y128.508 F42000
G1 F9547.299
M204 S6000
G1 X116.509 Y128.508 E.06099
G1 X116.509 Y133.492 E.15317
G1 X118.494 Y133.492 E.06099
G1 X118.494 Y128.568 E.15132
M204 S10000
G1 X118.871 Y128.13 F42000
G1 F9547.299
M204 S6000
G1 X116.132 Y128.13 E.08416
G1 X116.132 Y133.87 E.17634
G1 X118.871 Y133.87 E.08416
G1 X118.871 Y128.19 E.1745
M204 S10000
G1 X116.866 Y124 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X118.467 Y127.717 E.20893
G1 X117.976 Y127.717 E.02539
G1 X116.461 Y124.203 E.19754
G1 X115.969 Y124.203 E.02539
G1 X117.484 Y127.717 E.19754
G1 X116.992 Y127.717 E.02539
G1 X115.39 Y124 E.20892
M106 S153
M204 S10000
G1 X106.552 Y142.781 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383453
; LAYER_HEIGHT: 0.2
G1 F10571.682
M204 S6000
G1 X106.163 Y142.307 E.017
G1 X105.686 Y141.922 E.01702
G1 X105.142 Y141.639 E.01702
G1 X104.552 Y141.47 E.01703
G1 X103.941 Y141.421 E.01701
G1 X103.332 Y141.494 E.01702
G1 X102.737 Y141.698 E.01747
G1 X102.206 Y142.003 E.01699
G1 X101.745 Y142.409 E.01704
G1 X101.308 Y143.015 E.02073
G1 X101.068 Y143.578 E.017
G1 X100.943 Y144.178 E.01699
G1 X100.94 Y144.79 E.01698
G1 X101.058 Y145.391 E.01699
G1 X101.293 Y145.956 E.01699
G1 X101.635 Y146.464 E.01699
G1 X102.072 Y146.894 E.01699
G1 X102.584 Y147.229 E.01699
G1 X103.153 Y147.455 E.01699
G1 X103.755 Y147.565 E.01699
G1 X104.368 Y147.553 E.017
G1 X104.965 Y147.419 E.01698
G1 X105.524 Y147.171 E.01697
G1 X106.026 Y146.814 E.01708
G1 X106.534 Y146.252 E.02102
G1 X106.833 Y145.712 E.01713
G1 X107.017 Y145.127 E.01702
G2 X107.082 Y144.501 I-10.897 J-1.458 E.01746
G1 X107.02 Y143.906 E.01659
G1 X106.846 Y143.319 E.01699
G1 X106.581 Y142.833 E.01536
; WIPE_START
G1 X106.846 Y143.319 E-.21033
G1 X107.02 Y143.906 E-.23272
G1 X107.082 Y144.501 E-.22722
G1 X107.058 Y144.736 E-.08974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.323 Y150.777 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X101.76 Y147.151 E.20387
G2 X102.446 Y147.602 I2.296 J-2.745 E.0425
G1 X103.744 Y150.614 E.1693
G1 X104.236 Y150.614 E.02539
G1 X103.038 Y147.833 E.15629
G2 X103.579 Y147.948 I1.245 J-4.555 E.02857
G1 X104.728 Y150.614 E.14987
G1 X105.22 Y150.614 E.02539
G1 X104.08 Y147.969 E.1487
G2 X104.432 Y147.943 I-.019 J-2.661 E.01826
G1 X104.554 Y147.928 E.00632
G1 X105.712 Y150.614 E.15102
G1 X106.204 Y150.614 E.02539
G1 X105.001 Y147.824 E.15683
G2 X105.424 Y147.664 I-.588 J-2.195 E.02338
G1 X106.696 Y150.614 E.16582
G1 X107.187 Y150.614 E.02539
G1 X105.825 Y147.453 E.17769
G2 X106.202 Y147.186 I-2.521 J-3.944 E.02386
G1 X107.679 Y150.614 E.19274
G1 X108.171 Y150.614 E.02539
G1 X106.55 Y146.854 E.21141
G2 X106.687 Y146.701 I-.703 J-.765 E.0106
G1 X106.871 Y146.457 E.01578
G1 X108.663 Y150.615 E.23371
G1 X109.155 Y150.615 E.02539
G1 X107.149 Y145.96 E.26165
G2 X107.37 Y145.332 I-3.2 J-1.477 E.03445
G1 X109.647 Y150.615 E.297
G1 X110.139 Y150.615 E.02539
G1 X107.471 Y144.426 E.34789
G2 X106.435 Y142.022 I-3.473 J.071 E.13857
G1 X98.383 Y123.337 E1.05039
G1 X98.383 Y124.479 E.05894
G1 X105.71 Y141.48 E.95573
G2 X105.101 Y141.209 I-1.713 J3.031 E.03444
G1 X98.383 Y125.621 E.87632
G1 X98.383 Y126.763 E.05894
G1 X104.55 Y141.072 E.80441
G2 X104.041 Y141.03 I-.464 J2.526 E.02645
G1 X98.384 Y127.904 E.73788
G1 X98.384 Y129.046 E.05894
G1 X103.563 Y141.064 E.67557
G2 X103.107 Y141.147 I.101 J1.837 E.02399
G1 X98.384 Y130.188 E.61608
G1 X98.384 Y131.33 E.05894
G1 X102.678 Y141.292 E.56004
G2 X102.271 Y141.488 I.86 J2.308 E.02337
G1 X98.385 Y132.472 E.50688
G1 X98.385 Y133.613 E.05894
G1 X101.89 Y141.746 E.45718
G2 X101.533 Y142.06 I1.392 J1.938 E.02457
G1 X98.385 Y134.755 E.41066
G1 X98.385 Y135.897 E.05894
G1 X101.206 Y142.441 E.36788
G2 X100.916 Y142.91 I3.251 J2.33 E.02849
G1 X98.386 Y137.039 E.33007
G1 X98.386 Y138.18 E.05894
G1 X100.679 Y143.5 E.29905
G2 X100.534 Y144.305 I3.53 J1.051 E.0423
G1 X98.386 Y139.322 E.28011
G1 X98.386 Y140.464 E.05894
G1 X102.696 Y150.464 E.56217
G3 X102.134 Y150.3 I.552 J-2.936 E.03031
G1 X98.387 Y141.606 E.48875
G1 X98.387 Y142.747 E.05894
G1 X101.532 Y150.046 E.41028
G3 X100.876 Y149.663 I1.615 J-3.528 E.0393
G1 X98.387 Y143.889 E.32459
G1 X98.387 Y145.031 E.05894
G1 X100.129 Y149.072 E.22717
G3 X99.044 Y147.65 I4.177 J-4.31 E.09269
G3 X98.247 Y145.846 I25.491 J-12.35 E.10184
M106 S153
; WIPE_START
G1 X98.816 Y147.167 E-.54666
G1 X99.044 Y147.65 E-.20287
G1 X99.059 Y147.673 E-.01047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.061 Y142.959 Z2 F42000
G1 X142.072 Y113.894 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F10588.235
M204 S6000
G1 X142.584 Y114.229 E.01697
G1 X143.153 Y114.455 E.01696
G1 X143.755 Y114.565 E.01697
G1 X144.368 Y114.553 E.01698
G1 X144.965 Y114.419 E.01696
G1 X145.524 Y114.171 E.01695
G1 X146.026 Y113.814 E.01706
G1 X146.534 Y113.252 E.02099
G1 X146.833 Y112.711 E.0171
G1 X147.016 Y112.127 E.01698
G2 X147.082 Y111.501 I-11.03 J-1.473 E.01743
G1 X147.019 Y110.906 E.01657
G1 X146.846 Y110.319 E.01696
M73 P55 R14
G1 X146.555 Y109.779 E.017
G1 X146.163 Y109.307 E.01699
G1 X145.686 Y108.922 E.017
G1 X145.142 Y108.639 E.01699
G1 X144.552 Y108.47 E.017
G1 X143.941 Y108.421 E.01699
G1 X143.333 Y108.501 E.017
G1 X142.619 Y108.754 E.02098
G1 X142.097 Y109.086 E.01715
G1 X141.656 Y109.511 E.01696
G1 X141.309 Y110.016 E.01696
G1 X141.068 Y110.578 E.01696
G1 X140.943 Y111.178 E.01696
G1 X140.94 Y111.79 E.01696
G1 X141.058 Y112.391 E.01697
G1 X141.293 Y112.956 E.01697
G1 X141.636 Y113.464 E.01696
G1 X142.029 Y113.852 E.0153
; WIPE_START
G1 X141.636 Y113.464 E-.2098
G1 X141.293 Y112.956 E-.23266
G1 X141.058 Y112.391 E-.23271
G1 X141.015 Y112.172 E-.08483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.988 Y105.655 Z2 F42000
G1 X145.202 Y105.303 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40166
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X149.622 Y115.559 E.57652
G1 X149.622 Y114.417 E.05891
G1 X145.865 Y105.699 E.49011
G3 X146.464 Y105.949 I-5.038 J12.923 E.03354
G1 X149.622 Y113.276 E.4119
G1 X149.622 Y112.135 E.05891
G1 X147.121 Y106.331 E.3263
G1 X147.258 Y106.424 E.00855
G3 X147.868 Y106.923 I-4.861 J6.56 E.0407
G1 X149.622 Y110.993 E.22878
G2 X149.102 Y108.646 I-5.586 J.006 E.12503
G1 X148.554 Y107.375 E.07148
M106 S153
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X149.102 Y108.646 E-.52614
G1 X149.295 Y109.111 E-.19098
G1 X149.327 Y109.219 E-.04288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/53
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S170.85
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2 I-1.011 J-.678 P1  F42000
G1 X126.837 Y142.762 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.847 Y142.845 E.00279
G3 X124.005 Y143.87 I-1.55 J.153 E.13673
G3 X123.997 Y142.13 I-1.3 J-.864 E.26418
G3 X125.107 Y141.452 I1.367 J.99 E.0443
G3 X126.786 Y142.542 I.189 J1.546 E.07211
G1 X126.823 Y142.704 E.0055
M204 S10000
G1 X126.436 Y142.836 F42000
G1 F5400
M204 S6000
G1 X126.445 Y142.886 E.00168
G3 X125.158 Y141.856 I-1.145 J.112 E.17871
G1 X125.272 Y141.848 E.00381
G3 X126.361 Y142.553 I.028 J1.15 E.04572
G1 X126.42 Y142.778 E.00771
M204 S250
G1 X126.057 Y142.92 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.056 Y142.925 E.00016
G3 X125.207 Y142.246 I-.755 J.074 E.10917
G1 X125.282 Y142.24 E.00233
G3 X126.026 Y142.776 I.019 J.758 E.03026
G1 X126.044 Y142.861 E.00265
; WIPE_START
M204 S6000
G1 X126.056 Y142.925 E-.02458
G1 X126.038 Y143.188 E-.1002
G1 X125.986 Y143.33 E-.05751
G1 X125.907 Y143.459 E-.05751
G1 X125.804 Y143.57 E-.05753
G1 X125.681 Y143.658 E-.05754
G1 X125.543 Y143.721 E-.05757
G1 X125.395 Y143.754 E-.05759
G1 X125.244 Y143.758 E-.05744
G1 X125.095 Y143.732 E-.0575
G1 X124.954 Y143.676 E-.05759
G1 X124.827 Y143.594 E-.05754
G1 X124.719 Y143.489 E-.05741
G1 X124.715 Y143.483 E-.00249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.381 Y141.897 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.558 Y141.856 E.00602
G1 X122.672 Y141.848 E.00381
G3 X122.323 Y141.911 I.029 J1.152 E.22829
M204 S250
G1 X122.468 Y142.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.607 Y142.246 E.00438
G1 X122.682 Y142.24 E.00233
G3 X122.411 Y142.297 I.019 J.76 E.13813
; WIPE_START
M204 S6000
G1 X122.607 Y142.246 E-.0768
G1 X122.682 Y142.24 E-.0288
G1 X122.833 Y142.251 E-.05752
G1 X122.979 Y142.292 E-.05746
G1 X123.114 Y142.361 E-.05759
G1 X123.232 Y142.456 E-.05743
G1 X123.369 Y142.636 E-.08622
G1 X123.428 Y142.776 E-.05755
G1 X123.458 Y142.924 E-.05754
G1 X123.438 Y143.188 E-.10033
G1 X123.386 Y143.33 E-.05751
G1 X123.307 Y143.459 E-.05751
G1 X123.293 Y143.474 E-.00774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.919 Y143.783 Z2.2 F42000
G1 X146.708 Y144.423 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.71 Y144.5 E.00256
G3 X143.664 Y141.811 I-2.709 J-.002 E.41215
G1 X143.934 Y141.79 E.00897
G3 X146.696 Y144.23 I.067 J2.708 E.13447
G1 X146.704 Y144.363 E.00441
M204 S10000
G1 X146.293 Y144.455 F42000
G1 F5400
M204 S6000
G1 X146.291 Y144.724 E.00892
G3 X143.715 Y142.215 I-2.29 J-.225 E.34273
G1 X143.944 Y142.198 E.00762
G3 X146.291 Y144.271 I.057 J2.301 E.11425
G1 X146.292 Y144.395 E.00412
M204 S250
G1 X145.902 Y144.455 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.901 Y144.688 E.00716
G3 X143.763 Y142.605 I-1.9 J-.189 E.26328
G1 X143.953 Y142.59 E.00586
G3 X145.901 Y144.31 I.047 J1.908 E.08779
G1 X145.901 Y144.395 E.00262
; WIPE_START
M204 S6000
G1 X145.901 Y144.688 E-.11134
G1 X145.852 Y144.972 E-.10924
G1 X145.722 Y145.329 E-.14442
G1 X145.524 Y145.653 E-.1446
G1 X145.265 Y145.932 E-.14455
G1 X145.039 Y146.095 E-.10584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.451 Y139.268 Z2.2 F42000
G1 X148.946 Y138.277 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.102 Y138.023 E.00988
G3 X151.914 Y136.492 I2.899 J1.974 E.11028
G1 X152.088 Y136.492 E.0058
G3 X148.916 Y138.329 I-.087 J3.506 E.60304
M204 S10000
G1 X149.293 Y138.489 F42000
G1 F5400
M204 S6000
G1 X149.439 Y138.253 E.00921
G3 X151.924 Y136.899 I2.562 J1.745 E.09749
G1 X152.078 Y136.899 E.00513
G3 X149.264 Y138.542 I-.077 J3.099 E.53237
M204 S250
G1 X149.627 Y138.693 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.763 Y138.474 E.00793
G3 X151.934 Y137.291 I2.239 J1.525 E.07889
G1 X152.069 Y137.291 E.00415
G3 X149.599 Y138.746 I-.068 J2.708 E.43008
; WIPE_START
M204 S6000
G1 X149.763 Y138.474 E-.12077
G1 X150.014 Y138.157 E-.15387
G1 X150.208 Y137.968 E-.1027
G1 X150.458 Y137.773 E-.1207
G1 X150.887 Y137.53 E-.18707
G1 X151.07 Y137.458 E-.07489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.458 Y129.997 Z2.2 F42000
G1 X144.911 Y108.95 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X144.991 Y108.977 E.00281
G3 X143.664 Y108.811 I-.99 J2.521 E.51972
G1 X143.934 Y108.79 E.00897
G3 X144.735 Y108.891 I.067 J2.708 E.02689
G1 X144.854 Y108.931 E.00416
M204 S10000
G1 X144.769 Y109.336 F42000
G1 F5400
M204 S6000
G1 X144.842 Y109.356 E.00251
G3 X143.715 Y109.215 I-.841 J2.142 E.44157
G1 X143.944 Y109.198 E.00762
G3 X144.401 Y109.232 I.057 J2.301 E.01523
G1 X144.712 Y109.32 E.01071
M204 S250
G1 X144.664 Y109.712 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X144.699 Y109.722 E.00113
G3 X143.763 Y109.605 I-.698 J1.777 E.3393
G1 X143.953 Y109.59 E.00586
G3 X144.333 Y109.619 I.047 J1.908 E.0117
G1 X144.606 Y109.696 E.00872
; WIPE_START
M204 S6000
G1 X144.699 Y109.722 E-.03675
G1 X144.873 Y109.8 E-.07241
G1 X145.192 Y110.007 E-.14456
G1 X145.464 Y110.272 E-.1445
G1 X145.679 Y110.586 E-.14455
G1 X145.826 Y110.937 E-.14459
G1 X145.864 Y111.124 E-.07264
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.233 Y111.271 Z2.2 F42000
G1 X116.291 Y111.691 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.755 Y111.336 Z2.2 F42000
G1 X101.812 Y109.905 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X101.841 Y109.864 E.00167
G3 X103.664 Y108.811 I2.16 J1.635 E.07173
G1 X103.934 Y108.79 E.00897
G3 X101.689 Y110.087 I.067 J2.708 E.4749
G1 X101.779 Y109.955 E.0053
M204 S10000
G1 X102.144 Y110.145 F42000
G1 F5400
M204 S6000
G1 X102.166 Y110.11 E.00139
G3 X103.715 Y109.215 I1.835 J1.389 E.06094
G1 X103.944 Y109.198 E.00762
G3 X101.927 Y110.501 I.057 J2.301 E.39587
G1 X102.112 Y110.196 E.01183
M204 S250
G1 X102.477 Y110.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X102.479 Y110.347 E.00008
G3 X103.763 Y109.605 I1.522 J1.152 E.04683
G1 X103.953 Y109.59 E.00585
G3 X102.28 Y110.671 I.047 J1.908 E.30418
G1 X102.446 Y110.4 E.00976
; WIPE_START
M204 S6000
G1 X102.479 Y110.347 E-.02381
G1 X102.737 Y110.068 E-.14458
G1 X103.046 Y109.846 E-.14452
G1 X103.393 Y109.689 E-.14456
G1 X103.763 Y109.605 E-.14454
G1 X103.953 Y109.59 E-.0724
G1 X104.178 Y109.607 E-.0856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.456 Y117.235 Z2.2 F42000
G1 X105.366 Y142.162 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.472 Y142.224 E.00405
G3 X103.664 Y141.811 I-1.471 J2.275 E.50178
G1 X103.934 Y141.79 E.00897
G3 X105.238 Y142.088 I.067 J2.708 E.04483
G1 X105.314 Y142.132 E.00293
M204 S10000
G1 X105.15 Y142.514 F42000
G1 F5400
M204 S6000
G1 X105.25 Y142.566 E.00377
G3 X103.715 Y142.215 I-1.249 J1.933 E.42633
G1 X103.944 Y142.198 E.00762
G3 X104.842 Y142.356 I.057 J2.301 E.03047
G1 X105.096 Y142.487 E.00946
M204 S250
G1 X104.971 Y142.861 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X105.037 Y142.896 E.00229
G3 X103.763 Y142.605 I-1.037 J1.603 E.32759
G1 X103.953 Y142.59 E.00585
G3 X104.699 Y142.722 I.047 J1.908 E.02341
G1 X104.918 Y142.834 E.00756
; WIPE_START
M204 S6000
G1 X105.037 Y142.896 E-.05109
G1 X105.335 Y143.133 E-.14448
G1 X105.579 Y143.424 E-.14459
G1 X105.761 Y143.758 E-.14453
G1 X105.873 Y144.121 E-.14451
G1 X105.908 Y144.464 E-.1308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.334 Y142.703 Z2.2 F42000
G1 X149.992 Y134.009 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.167 J-3.728 E.04473
G3 X143.989 Y150.991 I-5.558 J-2.288 E.2353
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I-.008 J-5.996 E.31294
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.201 Y105.014 E1.33308
G3 X149.992 Y111.013 I-.216 J6.003 E.30569
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I-.003 J-6.403 E.33382
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.211 Y104.607 E1.33357
G3 X150.399 Y111.008 I-.212 J6.396 E.32659
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.812 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.002 J-6.795 E.32784
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.221 Y104.215 E1.23574
G3 X150.791 Y111.003 I-.221 J6.788 E.32099
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
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


G1 X150.531 Y134.173 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X152.56 Y136.202 E.08858
G3 X153.271 Y136.378 I-.598 J3.946 E.02266
G1 X151.236 Y134.342 E.08885
G1 X151.772 Y134.342 E.01654
G1 X157.647 Y140.218 E.25649
G2 X157.648 Y139.683 I-3.569 J-.271 E.01654
G1 X152.324 Y134.359 E.23238
G3 X152.927 Y134.426 I-.029 J3.025 E.01873
G1 X157.575 Y139.074 E.20291
G2 X157.414 Y138.377 I-3.558 J.456 E.02211
G1 X153.618 Y134.582 E.1657
G3 X154.509 Y134.937 I-2.005 J6.322 E.02964
G1 X157.401 Y137.828 E.12622
M204 S10000
G1 X157.758 Y140.864 F42000
G1 F9503.695
M204 S6000
G1 X155.623 Y138.729 E.09319
G3 X155.798 Y139.44 I-3.658 J1.278 E.02263
G1 X157.531 Y141.173 E.07565
G3 X157.421 Y141.598 I-2.181 J-.341 E.01358
G1 X155.843 Y140.021 E.06887
G3 X155.805 Y140.518 I-2.502 J.057 E.01542
G1 X157.286 Y141.999 E.06466
M73 P56 R14
G3 X157.13 Y142.379 I-1.976 J-.587 E.0127
G1 X155.716 Y140.965 E.06174
G3 X155.587 Y141.371 I-2.098 J-.445 E.01318
G1 X156.949 Y142.734 E.05947
G3 X156.746 Y143.067 I-1.765 J-.845 E.01206
G1 X155.417 Y141.738 E.05801
G3 X155.227 Y142.083 I-1.471 J-.588 E.0122
G1 X156.531 Y143.387 E.05692
G3 X156.289 Y143.68 I-2.078 J-1.465 E.01176
G1 X155.002 Y142.394 E.05614
G3 X154.751 Y142.679 I-1.549 J-1.113 E.01173
G1 X156.036 Y143.964 E.05607
G1 X155.758 Y144.221 E.0117
G1 X154.474 Y142.937 E.05606
G3 X154.17 Y143.169 I-1.306 J-1.403 E.01182
G1 X155.469 Y144.468 E.05673
G3 X155.154 Y144.689 I-1.628 J-1.992 E.01188
G1 X153.837 Y143.372 E.05748
G3 X153.475 Y143.545 I-1.044 J-1.722 E.01242
G1 X154.828 Y144.898 E.05908
G3 X154.474 Y145.08 I-1.393 J-2.277 E.01229
G1 X153.078 Y143.684 E.06093
G3 X152.643 Y143.784 I-.718 J-2.126 E.01382
G1 X154.105 Y145.247 E.06384
G1 X153.712 Y145.39 E.0129
G1 X152.16 Y143.837 E.06778
G3 X151.605 Y143.819 I-.126 J-4.564 E.01712
G1 X153.289 Y145.502 E.07349
G3 X152.845 Y145.594 I-1.258 J-4.982 E.014
G1 X150.676 Y143.425 E.09468
; WIPE_START
G1 X152.09 Y144.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.585 Y141.334 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X131.293 Y124.042 E.75483
G1 X131.829 Y124.042 E.01654
G1 X148.183 Y140.397 E.71391
G3 X148.163 Y139.84 I2.77 J-.381 E.01721
G1 X132.365 Y124.042 E.68963
G1 X132.843 Y124.042 E.01477
G1 X132.843 Y123.985 E.00176
G1 X148.215 Y139.357 E.67103
G3 X148.317 Y138.923 I2.222 J.29 E.01379
G1 X132.843 Y123.449 E.67546
G1 X132.843 Y122.914 E.01654
G1 X148.457 Y138.527 E.68157
G3 X148.63 Y138.165 I1.898 J.686 E.01242
G1 X132.843 Y122.378 E.68914
G1 X132.843 Y121.842 E.01654
G1 X148.833 Y137.832 E.69802
G3 X149.065 Y137.528 I1.637 J1.004 E.01182
G1 X132.843 Y121.307 E.70811
G1 X132.843 Y120.771 E.01654
G1 X149.323 Y137.251 E.71938
G3 X149.609 Y137.001 I1.273 J1.168 E.01174
G1 X132.843 Y120.235 E.73186
G1 X132.843 Y119.7 E.01654
G1 X149.918 Y136.774 E.74536
G3 X150.259 Y136.58 I1.204 J1.717 E.01214
G1 X132.843 Y119.164 E.76026
G1 X132.843 Y118.628 E.01654
G1 X150.63 Y136.415 E.77644
G3 X151.035 Y136.284 I.854 J1.959 E.01316
G1 X132.843 Y118.092 E.79414
G1 X132.843 Y117.557 E.01654
G1 X151.481 Y136.194 E.81359
G3 X151.982 Y136.16 I.614 J5.319 E.01552
G1 X150.165 Y134.342 E.07935
G1 X149.659 Y134.342 E.01561
G1 X149.659 Y133.836 E.01561
G1 X132.843 Y117.021 E.73404
G1 X132.843 Y116.485 E.01654
G1 X149.659 Y133.301 E.73404
G1 X149.659 Y132.765 E.01654
G1 X132.843 Y115.95 E.73404
G1 X132.843 Y115.414 E.01654
G1 X149.659 Y132.229 E.73404
G1 X149.659 Y131.694 E.01654
G1 X132.843 Y114.878 E.73404
G1 X132.843 Y114.343 E.01654
G1 X149.659 Y131.158 E.73404
G1 X149.659 Y130.622 E.01654
G1 X132.843 Y113.807 E.73404
G1 X132.843 Y113.271 E.01654
G1 X149.659 Y130.087 E.73404
G1 X149.659 Y129.551 E.01654
G1 X132.843 Y112.735 E.73404
G1 X132.843 Y112.2 E.01654
G1 X149.659 Y129.015 E.73404
G1 X149.659 Y128.479 E.01654
G1 X126.528 Y105.349 E1.00974
G1 X127.064 Y105.348 E.01654
G1 X149.659 Y127.944 E.98635
G1 X149.659 Y127.408 E.01654
G1 X127.599 Y105.348 E.96297
G1 X128.135 Y105.348 E.01654
G1 X149.659 Y126.872 E.93958
G1 X149.659 Y126.337 E.01654
G1 X128.671 Y105.348 E.9162
G1 X129.206 Y105.348 E.01653
G1 X149.659 Y125.801 E.89282
G1 X149.659 Y125.265 E.01654
G1 X129.742 Y105.348 E.86943
G1 X130.278 Y105.348 E.01654
G1 X149.659 Y124.729 E.84605
G1 X149.659 Y124.194 E.01654
G1 X130.813 Y105.348 E.82266
G1 X131.349 Y105.348 E.01653
G1 X149.659 Y123.658 E.79928
G1 X149.659 Y123.122 E.01654
G1 X131.885 Y105.348 E.7759
M73 P56 R13
G1 X132.42 Y105.348 E.01653
G1 X149.659 Y122.587 E.75251
G1 X149.659 Y122.051 E.01654
G1 X132.956 Y105.348 E.72913
G1 X133.492 Y105.348 E.01654
G1 X149.828 Y121.685 E.71315
M204 S10000
G1 X149.828 Y113.649 F42000
G1 F9503.695
M204 S6000
G1 X146.954 Y110.774 E.1255
G3 X147.04 Y111.396 I-2.999 J.733 E.01942
G1 X149.659 Y114.015 E.11432
G1 X149.659 Y114.551 E.01654
G1 X147.012 Y111.904 E.11555
G3 X146.921 Y112.349 I-1.788 J-.134 E.01405
G1 X149.659 Y115.087 E.11952
G1 X149.659 Y115.623 E.01654
G1 X146.777 Y112.741 E.12579
G3 X146.594 Y113.094 I-4.372 J-2.047 E.01227
G1 X149.659 Y116.158 E.13378
G1 X149.659 Y116.694 E.01654
G1 X146.371 Y113.406 E.14354
G3 X146.115 Y113.685 I-1.528 J-1.142 E.01172
G1 X149.659 Y117.23 E.15472
G1 X149.659 Y117.765 E.01654
G1 X145.826 Y113.933 E.1673
G3 X145.504 Y114.146 I-2.739 J-3.795 E.01194
G1 X149.659 Y118.301 E.18138
G1 X149.659 Y118.837 E.01654
G1 X145.141 Y114.319 E.19723
G3 X144.737 Y114.451 I-.864 J-1.953 E.01312
G1 X149.659 Y119.372 E.21483
G1 X149.659 Y119.908 E.01654
G1 X144.279 Y114.528 E.23486
G3 X143.747 Y114.532 I-.295 J-3.68 E.01642
G1 X149.659 Y120.444 E.25806
G1 X149.659 Y120.98 E.01654
G1 X143.075 Y114.396 E.28738
G3 X141.101 Y112.422 I.91 J-2.884 E.08957
G1 X134.027 Y105.348 E.30881
G1 X134.563 Y105.348 E.01653
G1 X140.97 Y111.755 E.27968
G3 X140.971 Y111.22 I2.664 J-.261 E.01652
G1 X135.099 Y105.348 E.25635
G1 X135.634 Y105.348 E.01653
G1 X141.05 Y110.763 E.2364
G3 X141.182 Y110.36 I3.484 J.922 E.01311
G1 X136.17 Y105.348 E.2188
G1 X136.706 Y105.348 E.01654
G1 X141.357 Y109.999 E.20303
G3 X141.567 Y109.673 I1.735 J.889 E.01198
G1 X137.241 Y105.348 E.18882
G1 X137.777 Y105.348 E.01654
G1 X141.815 Y109.386 E.17626
G3 X142.096 Y109.131 I1.412 J1.275 E.01173
G1 X138.313 Y105.348 E.16514
G1 X138.848 Y105.348 E.01653
G1 X142.409 Y108.909 E.15545
G3 X142.758 Y108.722 I2.438 J4.128 E.01222
G1 X139.384 Y105.348 E.14729
G1 X139.92 Y105.348 E.01653
G1 X143.153 Y108.581 E.14112
G3 X143.593 Y108.485 I.698 J2.151 E.01392
G1 X140.455 Y105.348 E.13695
G1 X140.991 Y105.348 E.01654
G1 X144.105 Y108.461 E.13592
G3 X144.726 Y108.547 I-.109 J3.088 E.0194
G1 X141.527 Y105.348 E.13967
G1 X142.062 Y105.348 E.01653
G1 X149.659 Y112.944 E.3316
G1 X149.659 Y112.408 E.01654
G1 X142.598 Y105.348 E.30822
G1 X143.134 Y105.348 E.01653
G1 X149.659 Y111.873 E.28484
G1 X149.659 Y111.337 E.01654
G1 X143.669 Y105.348 E.26145
G3 X144.206 Y105.348 I.261 J4.33 E.01657
G1 X149.653 Y110.796 E.23779
G2 X149.601 Y110.207 I-4.019 J.064 E.01826
G1 X144.8 Y105.406 E.20957
G3 X145.47 Y105.541 I-.472 J4.085 E.02113
G1 X149.464 Y109.535 E.17433
G2 X149.164 Y108.699 I-5.12 J1.367 E.02744
G1 X146.303 Y105.839 E.12486
G3 X147.803 Y106.811 I-2.211 J5.054 E.05542
G3 X148.988 Y107.988 I-23.367 J24.715 E.05156
; WIPE_START
G1 X147.803 Y106.811 E-.63471
G1 X147.548 Y106.602 E-.12529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.41 Y109.303 Z2.2 F42000
G1 X115.328 Y118.791 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X106.761 Y110.224 E.374
G3 X107 Y110.999 I-2.119 J1.078 E.02515
G1 X115.159 Y119.157 E.35615
G1 X115.159 Y119.693 E.01654
G1 X107.041 Y111.576 E.35435
G3 X106.985 Y112.055 I-1.889 J.022 E.01494
G1 X115.159 Y120.229 E.35681
G1 X115.159 Y120.765 E.01654
G1 X106.879 Y112.485 E.36144
G3 X106.721 Y112.862 I-3.722 J-1.335 E.01264
G1 X115.159 Y121.3 E.36834
G1 X115.159 Y121.836 E.01654
G1 X106.522 Y113.199 E.37702
G3 X106.29 Y113.502 I-1.627 J-1.007 E.01181
G1 X115.159 Y122.372 E.38717
G1 X115.159 Y122.907 E.01654
G1 X106.025 Y113.773 E.39874
G3 X105.723 Y114.007 I-3.218 J-3.839 E.01179
G1 X115.328 Y123.613 E.41932
; WIPE_START
G1 X113.914 Y122.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.104 Y128.812 Z2.2 F42000
G1 X99.032 Y148.03 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X100.014 Y149.012 E.0429
G2 X101.7 Y150.162 I3.888 J-3.89 E.06333
G1 X98.839 Y147.301 E.12486
G3 X98.542 Y146.469 I4.16 J-1.954 E.02734
G1 X102.533 Y150.459 E.17419
G2 X103.171 Y150.596 I1.013 J-3.17 E.02018
G1 X103.209 Y150.599 E.00118
G1 X98.402 Y145.792 E.20984
G3 X98.351 Y145.206 I2.955 J-.551 E.0182
G1 X103.795 Y150.65 E.23766
G1 X104.331 Y150.65 E.01654
G1 X98.351 Y144.67 E.26106
G1 X98.351 Y144.134 E.01654
G1 X104.867 Y150.65 E.28445
G1 X105.403 Y150.65 E.01654
G1 X98.351 Y143.598 E.30784
G1 X98.35 Y143.063 E.01654
G1 X106.108 Y150.82 E.33865
M204 S10000
G1 X114.145 Y150.822 F42000
G1 F9503.695
M204 S6000
G1 X106.9 Y143.577 E.31625
G3 X107.032 Y144.245 I-2.059 J.753 E.02109
G1 X113.44 Y150.652 E.2797
G1 X112.904 Y150.652 E.01654
G1 X107.031 Y144.779 E.25636
G1 X106.952 Y145.236 E.01432
G1 X112.368 Y150.652 E.23641
G1 X111.832 Y150.652 E.01654
G1 X106.82 Y145.639 E.2188
G3 X106.646 Y146.001 I-1.889 J-.69 E.0124
G1 X111.296 Y150.652 E.20302
G1 X110.761 Y150.652 E.01654
G1 X106.435 Y146.326 E.18881
G3 X106.188 Y146.614 I-3.959 J-3.159 E.01173
G1 X110.225 Y150.651 E.17624
G1 X109.689 Y150.651 E.01654
G1 X105.907 Y146.869 E.16511
G3 X105.593 Y147.091 I-1.266 J-1.456 E.01188
G1 X109.153 Y150.651 E.15541
G1 X108.617 Y150.651 E.01654
G1 X105.244 Y147.278 E.14725
G3 X104.85 Y147.419 I-.905 J-1.904 E.01295
G1 X108.082 Y150.651 E.14107
G1 X107.546 Y150.651 E.01654
G1 X104.41 Y147.515 E.13689
G3 X103.898 Y147.539 I-.422 J-3.605 E.01584
G1 X107.01 Y150.651 E.13586
G1 X106.474 Y150.651 E.01654
G1 X103.023 Y147.2 E.15065
; WIPE_START
G1 X104.437 Y148.614 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.303 Y145.479 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X98.35 Y142.527 E.12889
G1 X98.35 Y141.991 E.01654
G1 X100.962 Y144.603 E.11403
G3 X100.99 Y144.095 I2.826 J-.101 E.01572
G1 X98.35 Y141.455 E.11524
G1 X98.35 Y140.919 E.01654
G1 X101.081 Y143.651 E.11924
G3 X101.225 Y143.259 I2.029 J.521 E.01291
G1 X98.35 Y140.384 E.12551
G1 X98.35 Y139.848 E.01654
G1 X101.408 Y142.906 E.13351
M73 P57 R13
G3 X101.632 Y142.594 I1.672 J.961 E.01187
G1 X98.35 Y139.312 E.14328
G1 X98.349 Y138.776 E.01654
G1 X101.888 Y142.314 E.15446
G3 X102.176 Y142.067 I1.379 J1.315 E.01175
G1 X98.349 Y138.24 E.16705
G1 X98.349 Y137.704 E.01654
G1 X102.499 Y141.854 E.18114
G3 X102.862 Y141.681 I1.044 J1.727 E.01243
G1 X98.349 Y137.169 E.19699
G1 X98.349 Y136.633 E.01654
G1 X103.265 Y141.549 E.2146
G3 X103.724 Y141.472 I.788 J3.302 E.01437
G1 X98.349 Y136.097 E.23464
G1 X98.349 Y135.561 E.01654
G1 X104.256 Y141.468 E.25785
G3 X104.927 Y141.604 I-.305 J3.234 E.0212
G1 X98.349 Y135.025 E.28718
G1 X98.349 Y134.489 E.01654
G1 X114.511 Y150.652 E.70555
G1 X115.047 Y150.652 E.01654
G1 X98.348 Y133.954 E.72895
G1 X98.348 Y133.418 E.01654
G1 X115.583 Y150.652 E.75234
G1 X116.119 Y150.653 E.01654
G1 X98.348 Y132.882 E.77574
G1 X98.348 Y132.346 E.01654
G1 X116.654 Y150.653 E.79913
G1 X117.19 Y150.653 E.01654
G1 X98.348 Y131.81 E.82253
G1 X98.348 Y131.275 E.01654
G1 X117.726 Y150.653 E.84592
G1 X118.262 Y150.653 E.01654
G1 X98.348 Y130.739 E.86932
G1 X98.348 Y130.203 E.01654
G1 X118.798 Y150.653 E.89271
G1 X119.333 Y150.653 E.01654
G1 X98.347 Y129.667 E.9161
G1 X98.347 Y129.131 E.01654
G1 X119.869 Y150.653 E.9395
G1 X120.405 Y150.653 E.01654
G1 X98.347 Y128.595 E.96289
G1 X98.347 Y128.06 E.01654
G1 X120.941 Y150.653 E.98629
G1 X121.477 Y150.654 E.01654
G1 X98.347 Y127.524 E1.00968
G1 X98.347 Y126.988 E.01654
G1 X122.013 Y150.654 E1.03308
G1 X122.548 Y150.654 E.01654
G1 X98.347 Y126.452 E1.05647
G1 X98.347 Y125.916 E.01654
G1 X123.084 Y150.654 E1.07987
G1 X123.62 Y150.654 E.01654
G1 X98.347 Y125.381 E1.10326
G1 X98.346 Y124.845 E.01654
G1 X124.156 Y150.654 E1.12666
G1 X124.692 Y150.654 E.01654
G1 X98.346 Y124.309 E1.15005
G1 X98.346 Y123.773 E.01654
G1 X125.227 Y150.654 E1.17345
G1 X125.763 Y150.654 E.01654
G1 X98.346 Y123.237 E1.19684
G1 X98.346 Y122.701 E.01654
G1 X126.299 Y150.654 E1.22024
G1 X126.835 Y150.655 E.01654
G1 X98.346 Y122.166 E1.24363
G1 X98.346 Y121.63 E.01654
G1 X127.371 Y150.655 E1.26702
G1 X127.906 Y150.655 E.01654
G1 X98.346 Y121.094 E1.29042
G1 X98.345 Y120.558 E.01654
G1 X120.809 Y143.021 E.98059
G3 X120.871 Y142.548 I1.816 J-.003 E.01479
G1 X98.345 Y120.022 E.9833
G1 X98.345 Y119.486 E.01654
G1 X121.015 Y142.156 E.98959
G3 X121.223 Y141.828 I.915 J.352 E.01206
G1 X98.345 Y118.951 E.99868
G1 X98.345 Y118.415 E.01654
G1 X121.487 Y141.557 E1.01021
G3 X121.805 Y141.34 I.696 J.68 E.01198
G1 X98.345 Y117.879 E1.02412
G1 X98.345 Y117.343 E.01654
G1 X122.185 Y141.184 E1.04072
G1 X122.279 Y141.152 E.00305
G1 X122.644 Y141.107 E.01135
G1 X98.345 Y116.807 E1.06074
G1 X98.345 Y116.272 E.01654
G1 X123.276 Y141.203 E1.08832
G3 X124.003 Y141.626 I-.64 J1.936 E.02619
G3 X124.129 Y141.52 I.311 J.24 E.00511
G1 X98.344 Y115.736 E1.12557
G1 X98.344 Y115.2 E.01654
G1 X124.457 Y141.312 E1.13988
G3 X124.849 Y141.169 I.551 J.899 E.01298
G1 X98.344 Y114.664 E1.15702
G1 X98.344 Y114.128 E.01654
G1 X125.511 Y141.295 E1.1859
; WIPE_START
G1 X124.096 Y139.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.493 Y144.706 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X128.442 Y150.655 E.25969
G1 X128.978 Y150.655 E.01654
G1 X123.159 Y144.836 E.25403
G1 X123.481 Y144.728 E.01048
G1 X123.548 Y144.689 E.00239
G1 X129.514 Y150.655 E.26044
G1 X130.05 Y150.655 E.01654
G1 X123.877 Y144.482 E.26947
G2 X123.999 Y144.373 I-.272 J-.429 E.00507
G2 X124.609 Y144.764 I1.273 J-1.316 E.02252
G1 X124.728 Y144.798 E.00382
G1 X130.585 Y150.655 E.25569
G1 X131.121 Y150.655 E.01654
G1 X125.359 Y144.893 E.25153
G1 X125.723 Y144.848 E.01132
G1 X125.817 Y144.816 E.00308
G1 X131.657 Y150.655 E.25491
G1 X132.193 Y150.656 E.01654
G1 X126.197 Y144.66 E.26172
G2 X126.516 Y144.443 I-.378 J-.897 E.01198
G1 X132.729 Y150.656 E.2712
G1 X133.264 Y150.656 E.01654
G1 X126.784 Y144.175 E.28289
G2 X126.993 Y143.848 I-.983 J-.857 E.01202
G1 X133.8 Y150.656 E.29717
G1 X134.336 Y150.656 E.01654
G1 X127.138 Y143.458 E.3142
G2 X127.185 Y142.969 I-1.316 J-.371 E.01526
G1 X134.872 Y150.656 E.33557
G1 X135.408 Y150.656 E.01654
G1 X98.344 Y113.592 E1.61794
G1 X98.344 Y113.057 E.01654
G1 X135.943 Y150.656 E1.64134
G1 X136.479 Y150.656 E.01654
G1 X98.344 Y112.521 E1.66473
G1 X98.344 Y111.985 E.01654
G1 X137.015 Y150.656 E1.68813
G1 X137.551 Y150.657 E.01654
G1 X98.343 Y111.449 E1.71152
G3 X98.348 Y110.918 I5.433 J-.215 E.01639
G1 X138.256 Y150.826 E1.74211
M204 S10000
G1 X145.954 Y150.489 F42000
G1 F9503.695
M204 S6000
G1 X142.725 Y147.26 E.14096
G2 X143.503 Y147.502 I1.153 J-2.337 E.02524
G1 X146.208 Y150.207 E.11809
G1 X146.571 Y150.034 E.01241
G1 X144.08 Y147.543 E.10876
G2 X144.561 Y147.488 I-.031 J-2.431 E.01497
G1 X146.914 Y149.841 E.10272
G2 X147.243 Y149.634 I-1.233 J-2.323 E.012
G1 X144.987 Y147.379 E.09846
G2 X145.363 Y147.218 I-.613 J-1.953 E.01262
G1 X147.545 Y149.401 E.09527
G2 X147.836 Y149.156 I-1.09 J-1.593 E.01176
G1 X145.701 Y147.021 E.09321
G2 X146.006 Y146.79 I-1.004 J-1.638 E.01182
G1 X148.103 Y148.888 E.09157
G2 X148.358 Y148.607 I-1.769 J-1.862 E.01172
G1 X146.273 Y146.522 E.09102
G2 X146.508 Y146.221 I-1.384 J-1.319 E.0118
G1 X148.587 Y148.3 E.09079
G2 X148.806 Y147.983 I-2.033 J-1.634 E.0119
G1 X146.708 Y145.886 E.09157
G2 X146.87 Y145.512 I-3.7 J-1.828 E.01258
G1 X148.997 Y147.639 E.09284
G2 X149.176 Y147.282 I-2.323 J-1.387 E.01233
G1 X146.98 Y145.086 E.09585
G2 X147.04 Y144.61 I-1.907 J-.48 E.01485
G1 X149.321 Y146.891 E.0996
G1 X149.456 Y146.491 E.01305
G1 X147.006 Y144.041 E.10694
G2 X146.794 Y143.293 I-2.482 J.3 E.0241
G1 X149.591 Y146.09 E.1221
G1 X149.726 Y145.689 E.01305
G1 X128.079 Y124.042 E.94497
G1 X127.543 Y124.042 E.01654
G1 X145.212 Y141.711 E.7713
G2 X144.459 Y141.493 I-1.029 J2.149 E.02432
G1 X127.008 Y124.042 E.7618
G1 X126.472 Y124.042 E.01654
G1 X143.889 Y141.46 E.76032
G2 X143.411 Y141.517 I.047 J2.419 E.0149
G1 X125.936 Y124.042 E.76282
G1 X125.401 Y124.042 E.01654
G1 X142.989 Y141.631 E.76781
G2 X142.616 Y141.794 I.625 J1.947 E.01259
G1 X124.865 Y124.042 E.7749
G1 X124.329 Y124.042 E.01654
G1 X142.28 Y141.993 E.78359
G2 X141.978 Y142.227 I2.945 J4.112 E.01179
G1 X123.794 Y124.042 E.7938
G1 X123.258 Y124.042 E.01654
G1 X141.713 Y142.497 E.80562
G2 X141.48 Y142.8 I1.393 J1.31 E.01181
G1 X122.722 Y124.042 E.81885
G1 X122.186 Y124.042 E.01654
G1 X141.281 Y143.137 E.83356
G2 X141.123 Y143.515 I3.565 J1.714 E.01264
G1 X121.651 Y124.042 E.85004
G1 X121.115 Y124.042 E.01654
G1 X141.017 Y143.944 E.86879
G2 X140.961 Y144.424 I1.832 J.458 E.01494
G1 X120.579 Y124.042 E.88972
G1 X120.044 Y124.042 E.01654
G1 X141.002 Y145.001 E.9149
G2 X141.241 Y145.775 I2.358 J-.303 E.02514
G1 X119.508 Y124.042 E.94871
G1 X118.972 Y124.042 E.01654
G1 X145.408 Y150.478 E1.154
G3 X144.964 Y150.569 I-.685 J-2.198 E.01402
G1 X118.436 Y124.042 E1.15799
G1 X117.901 Y124.042 E.01654
G1 X144.491 Y150.633 E1.16076
G1 X143.98 Y150.658 E.01578
G1 X117.365 Y124.042 E1.16185
G1 X116.829 Y124.042 E.01654
G1 X143.445 Y150.658 E1.16184
G1 X142.909 Y150.658 E.01654
G1 X116.294 Y124.042 E1.16184
G1 X115.758 Y124.042 E.01654
G1 X142.373 Y150.657 E1.16183
G1 X141.837 Y150.657 E.01654
G1 X105.386 Y114.206 E1.5912
G3 X105.013 Y114.369 I-.999 J-1.785 E.01259
G1 X141.301 Y150.657 E1.5841
G1 X140.766 Y150.657 E.01654
G1 X104.592 Y114.483 E1.57911
G3 X104.113 Y114.54 I-.526 J-2.363 E.0149
G1 X140.23 Y150.657 E1.57661
G1 X139.694 Y150.657 E.01654
G1 X103.544 Y114.507 E1.57807
G3 X102.791 Y114.289 I.274 J-2.362 E.02431
G1 X139.158 Y150.657 E1.58756
G1 X138.622 Y150.657 E.01654
G1 X98.376 Y110.411 E1.75686
G1 X98.446 Y109.944 E.01456
G1 X101.208 Y112.706 E.12057
G3 X100.996 Y111.959 I2.273 J-1.048 E.02408
G1 X98.549 Y109.512 E.1068
G3 X98.678 Y109.105 I2.127 J.451 E.01319
G1 X100.963 Y111.39 E.09973
M73 P58 R13
G3 X101.023 Y110.914 I1.876 J-.005 E.01484
G1 X98.829 Y108.72 E.09576
G1 X99.001 Y108.357 E.01242
G1 X101.132 Y110.488 E.09302
G3 X101.294 Y110.114 I3.879 J1.463 E.01257
G1 X99.2 Y108.02 E.09142
G3 X99.415 Y107.699 I1.737 J.931 E.01194
G1 X101.495 Y109.779 E.0908
G3 X101.729 Y109.478 I1.622 J1.02 E.0118
G1 X99.645 Y107.393 E.091
G1 X99.899 Y107.112 E.01171
G1 X101.997 Y109.21 E.09157
G3 X102.301 Y108.979 I1.308 J1.407 E.01182
G1 X100.17 Y106.847 E.09305
G3 X100.454 Y106.596 I1.42 J1.323 E.01173
G1 X102.64 Y108.781 E.0954
G3 X103.015 Y108.621 I.989 J1.794 E.01262
G1 X100.762 Y106.368 E.09836
G3 X101.088 Y106.158 I1.226 J1.553 E.01199
G1 X103.441 Y108.512 E.10272
G3 X103.923 Y108.457 I.512 J2.376 E.01498
G1 X101.431 Y105.965 E.10878
G1 X101.795 Y105.793 E.01242
G1 X104.5 Y108.499 E.11809
G3 X105.278 Y108.741 I-.378 J2.584 E.02525
G1 X102.186 Y105.649 E.13498
G3 X102.599 Y105.526 I.827 J2.039 E.01333
G1 X115.159 Y118.086 E.54827
G1 X115.159 Y117.55 E.01654
G1 X103.039 Y105.431 E.52906
G3 X103.509 Y105.365 I.678 J3.151 E.01467
G1 X115.159 Y117.015 E.50853
G1 X115.159 Y116.479 E.01654
G1 X104.03 Y105.35 E.48582
G1 X104.565 Y105.35 E.01653
G1 X115.159 Y115.943 E.46244
G1 X115.159 Y115.408 E.01654
G1 X105.101 Y105.35 E.43906
G1 X105.637 Y105.35 E.01654
G1 X115.159 Y114.872 E.41567
G1 X115.159 Y114.336 E.01654
G1 X106.172 Y105.35 E.39229
G1 X106.708 Y105.35 E.01653
G1 X115.159 Y113.8 E.3689
G1 X115.159 Y113.265 E.01654
G1 X107.244 Y105.35 E.34552
G1 X107.779 Y105.35 E.01653
G1 X115.159 Y112.729 E.32214
G1 X115.159 Y112.193 E.01654
G1 X108.315 Y105.35 E.29875
G1 X108.851 Y105.35 E.01654
G1 X115.159 Y111.658 E.27537
G1 X115.159 Y111.358 E.00926
G1 X115.395 Y111.358 E.00728
G1 X109.386 Y105.349 E.26228
G1 X109.922 Y105.349 E.01653
G1 X115.93 Y111.358 E.26228
G1 X116.466 Y111.358 E.01654
G1 X110.458 Y105.349 E.26228
G1 X110.993 Y105.349 E.01653
G1 X117.002 Y111.358 E.26228
G1 X117.537 Y111.358 E.01654
G1 X111.529 Y105.349 E.26228
G1 X112.065 Y105.349 E.01654
G1 X118.073 Y111.358 E.26228
G1 X118.609 Y111.358 E.01654
G1 X112.6 Y105.349 E.26228
G1 X113.136 Y105.349 E.01653
G1 X119.144 Y111.358 E.26229
G1 X119.68 Y111.358 E.01654
G1 X113.672 Y105.349 E.26229
G1 X114.207 Y105.349 E.01654
G1 X120.216 Y111.358 E.26229
G1 X120.752 Y111.358 E.01654
G1 X114.743 Y105.349 E.26229
G1 X115.279 Y105.349 E.01654
G1 X121.287 Y111.358 E.26229
G1 X121.823 Y111.358 E.01654
G1 X115.814 Y105.349 E.26229
G1 X116.35 Y105.349 E.01653
G1 X122.359 Y111.358 E.26229
G1 X122.894 Y111.358 E.01654
G1 X116.886 Y105.349 E.2623
G1 X117.421 Y105.349 E.01654
G1 X123.43 Y111.358 E.2623
G1 X123.966 Y111.358 E.01654
G1 X117.957 Y105.349 E.2623
G1 X118.493 Y105.349 E.01653
G1 X124.502 Y111.358 E.2623
G1 X125.037 Y111.358 E.01654
G1 X119.028 Y105.349 E.2623
G1 X119.564 Y105.349 E.01653
G1 X125.573 Y111.358 E.2623
G1 X126.109 Y111.358 E.01654
G1 X120.1 Y105.349 E.2623
G1 X120.635 Y105.349 E.01654
G1 X126.644 Y111.358 E.2623
G1 X127.18 Y111.358 E.01654
G1 X121.171 Y105.349 E.26231
G1 X121.707 Y105.349 E.01654
G1 X127.716 Y111.358 E.26231
G1 X128.251 Y111.358 E.01654
G1 X122.243 Y105.349 E.26231
G1 X122.778 Y105.349 E.01653
G1 X128.787 Y111.358 E.26231
G1 X129.323 Y111.358 E.01654
G1 X123.314 Y105.349 E.26231
G1 X123.85 Y105.349 E.01653
G1 X129.859 Y111.358 E.26231
G1 X130.394 Y111.358 E.01654
G1 X124.385 Y105.349 E.26231
G1 X124.921 Y105.349 E.01654
G1 X130.93 Y111.358 E.26232
G1 X131.466 Y111.358 E.01654
G1 X125.457 Y105.349 E.26232
G1 X125.992 Y105.349 E.01653
G1 X132.171 Y111.527 E.26972
; WIPE_START
G1 X130.757 Y110.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.492 Y117.64 Z2.2 F42000
G1 X128.445 Y123.873 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X150.229 Y145.657 E.95095
G1 X150.763 Y145.655 E.01648
G1 X129.151 Y124.042 E.94347
G1 X129.686 Y124.042 E.01654
G1 X151.297 Y145.653 E.94339
G1 X151.831 Y145.652 E.01648
G1 X130.222 Y124.042 E.94331
G1 X130.758 Y124.042 E.01654
G1 X152.513 Y145.797 E.94968
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9503.695
G1 X151.099 Y144.383 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/53
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I.081 J-1.214 P1  F42000
G1 X126.839 Y142.774 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.847 Y142.846 E.00239
G3 X124.005 Y143.87 I-1.55 J.153 E.13672
G3 X124.001 Y142.135 I-1.298 J-.864 E.26394
G3 X125.107 Y141.452 I1.351 J.95 E.04431
G3 X126.786 Y142.542 I.189 J1.546 E.07213
G1 X126.826 Y142.715 E.00589
M204 S10000
G1 X126.442 Y142.854 F42000
G1 F5400
M204 S6000
G1 X126.448 Y142.885 E.00106
G3 X125.157 Y141.856 I-1.146 J.114 E.1791
G1 X125.272 Y141.848 E.00382
G3 X126.402 Y142.66 I.029 J1.152 E.04958
G1 X126.43 Y142.795 E.00456
M204 S250
G1 X126.057 Y142.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X125.206 Y142.246 I-.756 J.075 E.1094
G1 X125.282 Y142.24 E.00233
G3 X126.049 Y142.865 I.019 J.76 E.0331
; WIPE_START
M204 S6000
G1 X126.038 Y143.188 E-.12262
G1 X125.986 Y143.33 E-.05751
G1 X125.907 Y143.459 E-.05761
G1 X125.804 Y143.57 E-.05752
G1 X125.681 Y143.658 E-.05759
G1 X125.543 Y143.721 E-.05752
G1 X125.396 Y143.754 E-.05742
G1 X125.244 Y143.758 E-.05757
G1 X125.095 Y143.732 E-.05754
G1 X124.954 Y143.677 E-.05745
G1 X124.827 Y143.594 E-.05762
G1 X124.719 Y143.489 E-.05746
G1 X124.712 Y143.479 E-.00459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.368 Y141.899 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.557 Y141.856 E.00644
G1 X122.672 Y141.848 E.00382
G3 X122.311 Y141.915 I.029 J1.152 E.22786
M204 S250
G1 X122.459 Y142.279 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.606 Y142.246 I.242 J.72 E.00465
G1 X122.682 Y142.24 E.00233
G3 X122.403 Y142.301 I.019 J.76 E.13786
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.08006
G1 X122.682 Y142.24 E-.02885
G1 X122.907 Y142.268 E-.08613
G1 X123.048 Y142.323 E-.05754
G1 X123.175 Y142.406 E-.05749
G1 X123.283 Y142.511 E-.05753
G1 X123.369 Y142.636 E-.05755
G1 X123.428 Y142.776 E-.05756
G1 X123.458 Y142.924 E-.05758
G1 X123.438 Y143.188 E-.10024
G1 X123.386 Y143.33 E-.05751
G1 X123.307 Y143.459 E-.05761
G1 X123.299 Y143.468 E-.00437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.923 Y143.823 Z2.4 F42000
G1 X146.708 Y144.56 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.696 Y144.77 E.00696
G3 X143.664 Y141.811 I-2.695 J-.271 E.4032
G1 X143.934 Y141.79 E.00897
G3 X146.71 Y144.5 I.067 J2.708 E.14343
G1 X146.71 Y144.5 E.00001
M204 S10000
G1 X146.298 Y144.557 F42000
G1 F5400
M204 S6000
G1 X146.256 Y144.956 E.01331
G3 X143.715 Y142.215 I-2.255 J-.457 E.33495
G1 X143.944 Y142.198 E.00762
G3 X146.302 Y144.497 I.057 J2.301 E.12178
M204 S250
G1 X145.902 Y144.522 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.9 Y144.69 E.00516
G3 X143.763 Y142.605 I-1.899 J-.191 E.26323
G1 X143.953 Y142.59 E.00585
G3 X145.901 Y144.31 I.048 J1.908 E.08779
G1 X145.902 Y144.462 E.00468
; WIPE_START
M204 S6000
G1 X145.9 Y144.69 E-.08658
G1 X145.826 Y145.063 E-.14453
G1 X145.679 Y145.413 E-.14415
G1 X145.523 Y145.654 E-.10914
G1 X145.265 Y145.932 E-.14431
G1 X144.985 Y146.134 E-.13129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.424 Y139.321 Z2.4 F42000
G1 X148.926 Y138.326 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.007 Y138.17 E.00582
G3 X151.914 Y136.492 I2.994 J1.829 E.1161
G1 X152.089 Y136.492 E.0058
G3 X148.767 Y138.637 I-.087 J3.508 E.59201
G1 X148.899 Y138.38 E.0096
M204 S10000
G1 X149.288 Y138.511 F42000
G1 F5400
M204 S6000
G1 X149.354 Y138.383 E.00481
G3 X151.924 Y136.899 I2.647 J1.617 E.10263
G1 X152.078 Y136.899 E.00513
G3 X149.143 Y138.795 I-.077 J3.101 E.52332
G1 X149.26 Y138.565 E.00859
M204 S250
G1 X149.636 Y138.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.689 Y138.587 E.00356
G3 X151.934 Y137.291 I2.312 J1.413 E.08305
G1 X152.069 Y137.291 E.00415
G3 X149.504 Y138.948 I-.068 J2.709 E.42347
G1 X149.608 Y138.743 E.00705
; WIPE_START
M204 S6000
G1 X149.689 Y138.587 E-.06679
G1 X149.841 Y138.364 E-.10266
G1 X150.014 Y138.157 E-.10265
G1 X150.208 Y137.968 E-.10265
G1 X150.419 Y137.8 E-.10266
G1 X150.646 Y137.653 E-.10271
G1 X150.886 Y137.53 E-.10265
G1 X151.076 Y137.455 E-.07724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.468 Y129.994 Z2.4 F42000
G1 X144.937 Y108.959 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X144.991 Y108.977 E.00189
G3 X143.664 Y108.811 I-.99 J2.521 E.51973
G1 X143.934 Y108.79 E.00897
G3 X144.735 Y108.891 I.067 J2.708 E.0269
G1 X144.88 Y108.94 E.00507
M204 S10000
G1 X144.79 Y109.342 F42000
G1 F5400
M204 S6000
G1 X144.842 Y109.356 E.0018
G3 X143.715 Y109.215 I-.841 J2.142 E.44157
G1 X143.944 Y109.198 E.00762
G3 X144.401 Y109.232 I.057 J2.301 E.01523
G1 X144.732 Y109.325 E.01143
M204 S250
G1 X144.684 Y109.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X144.699 Y109.722 E.00046
G3 X143.763 Y109.605 I-.698 J1.777 E.3393
G1 X143.953 Y109.59 E.00585
G3 X144.333 Y109.619 I.048 J1.908 E.0117
G1 X144.627 Y109.701 E.00938
; WIPE_START
M204 S6000
G1 X144.699 Y109.722 E-.02854
G1 X145.038 Y109.895 E-.14457
G1 X145.335 Y110.133 E-.14455
G1 X145.579 Y110.424 E-.14454
G1 X145.761 Y110.758 E-.14454
G1 X145.873 Y111.122 E-.14457
G1 X145.877 Y111.144 E-.00868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.246 Y111.285 Z2.4 F42000
G1 X116.291 Y111.691 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.762 Y111.293 Z2.4 F42000
G1 X101.878 Y109.819 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X102.015 Y109.657 E.00702
G3 X103.664 Y108.811 I1.986 J1.841 E.06277
G1 X103.934 Y108.79 E.00897
G3 X101.84 Y109.865 I.067 J2.708 E.48381
M204 S10000
G1 X102.203 Y110.069 F42000
G1 F5400
M204 S6000
G1 X102.478 Y109.774 E.01336
G3 X103.715 Y109.215 I1.524 J1.725 E.04571
G1 X103.944 Y109.198 E.00762
G3 X102.163 Y110.113 I.057 J2.301 E.41096
M204 S250
G1 X102.49 Y110.334 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X102.737 Y110.068 E.01118
G3 X103.763 Y109.605 I1.264 J1.431 E.03512
G1 X103.953 Y109.59 E.00585
G3 X102.453 Y110.382 I.047 J1.908 E.31455
; WIPE_START
M204 S6000
G1 X102.737 Y110.068 E-.16095
G1 X103.046 Y109.846 E-.14456
G1 X103.393 Y109.689 E-.14458
G1 X103.763 Y109.605 E-.1445
G1 X103.953 Y109.59 E-.0724
G1 X104.198 Y109.609 E-.093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.483 Y117.236 Z2.4 F42000
G1 X105.416 Y142.191 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.472 Y142.224 E.00214
G3 X103.664 Y141.811 I-1.471 J2.275 E.50179
G1 X103.934 Y141.79 E.00897
G3 X105.238 Y142.088 I.067 J2.708 E.04483
G1 X105.364 Y142.161 E.00484
M204 S10000
M73 P59 R13
G1 X105.196 Y142.537 F42000
G1 F5400
M204 S6000
G1 X105.25 Y142.566 E.00205
G3 X103.715 Y142.215 I-1.249 J1.933 E.42633
G1 X103.944 Y142.198 E.00762
G3 X104.842 Y142.356 I.057 J2.301 E.03047
G1 X105.142 Y142.51 E.01118
M204 S250
G1 X105.017 Y142.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X105.037 Y142.896 E.00069
G3 X103.763 Y142.605 I-1.036 J1.603 E.32759
G1 X103.953 Y142.59 E.00585
G3 X104.699 Y142.722 I.047 J1.908 E.02341
G1 X104.964 Y142.858 E.00915
; WIPE_START
M204 S6000
G1 X105.037 Y142.896 E-.03137
G1 X105.335 Y143.133 E-.14453
G1 X105.579 Y143.424 E-.14454
G1 X105.761 Y143.758 E-.14454
G1 X105.873 Y144.121 E-.14454
G1 X105.902 Y144.31 E-.07241
G1 X105.902 Y144.515 E-.07807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.326 Y142.746 Z2.4 F42000
G1 X149.992 Y134.009 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.167 J-3.728 E.04473
G3 X143.989 Y150.991 I-5.551 J-2.278 E.23535
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I-.008 J-5.996 E.31294
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.227 Y105.015 E1.33395
G3 X149.992 Y111.013 I-.243 J6.002 E.30481
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I-.003 J-6.403 E.33382
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.237 Y104.608 E1.33445
G3 X150.399 Y111.008 I-.239 J6.396 E.32571
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.572 J-1.819 E.27214
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.002 J-6.795 E.32784
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.795 J.002 E.32784
G1 X144.247 Y104.216 E1.23655
G3 X150.791 Y111.003 I-.248 J6.788 E.32018
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
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


G1 X155.397 Y141.396 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42085
G1 F9525.574
M204 S6000
G1 X157.596 Y139.197 E.0958
G1 X157.516 Y138.742 E.01421
G1 X155.816 Y140.443 E.07405
G2 X155.839 Y139.886 I-4.528 J-.462 E.01718
G1 X157.399 Y138.325 E.06797
G2 X157.264 Y137.926 I-4.696 J1.371 E.01298
G1 X155.792 Y139.398 E.0641
G2 X155.697 Y138.959 I-2.242 J.257 E.01386
G1 X157.098 Y137.558 E.06101
G2 X156.913 Y137.208 I-1.842 J.748 E.0122
G1 X155.561 Y138.56 E.05886
G2 X155.392 Y138.195 I-1.905 J.663 E.01241
G1 X156.714 Y136.873 E.05757
G2 X156.488 Y136.564 I-2.167 J1.351 E.01179
G1 X155.192 Y137.86 E.05644
G2 X154.964 Y137.554 I-1.637 J.982 E.01178
G1 X156.251 Y136.267 E.05605
G2 X155.99 Y135.994 I-3.792 J3.357 E.01164
G1 X154.708 Y137.275 E.0558
G2 X154.427 Y137.022 I-1.405 J1.28 E.01167
G1 X155.712 Y135.736 E.05598
G2 X155.421 Y135.493 I-1.763 J1.822 E.0117
G1 X154.119 Y136.795 E.0567
G2 X153.783 Y136.597 I-1.159 J1.577 E.01204
G1 X155.103 Y135.277 E.05748
G2 X154.77 Y135.075 I-1.175 J1.561 E.012
G1 X153.417 Y136.428 E.05894
G2 X153.016 Y136.295 I-3.794 J10.737 E.01302
G1 X154.422 Y134.889 E.06121
G1 X154.046 Y134.731 E.01257
G1 X152.573 Y136.203 E.06414
G2 X152.079 Y136.162 I-.451 J2.444 E.01528
M73 P59 R12
G1 X153.647 Y134.595 E.06826
G2 X153.228 Y134.479 I-.984 J2.739 E.01339
G1 X151.52 Y136.187 E.07439
G2 X150.831 Y136.342 I.427 J3.519 E.02178
G1 X152.771 Y134.402 E.08447
G2 X152.281 Y134.357 I-.469 J2.411 E.01516
G1 X145.008 Y141.631 E.31679
G3 X145.384 Y141.789 I-.6 J1.96 E.0126
G1 X148.342 Y138.831 E.12882
G2 X148.192 Y139.515 I4.473 J1.337 E.02159
G1 X145.718 Y141.99 E.10777
G3 X146.017 Y142.224 I-1.024 J1.616 E.01174
G1 X148.162 Y140.08 E.0934
G2 X148.205 Y140.571 I2.474 J.028 E.01521
G1 X146.285 Y142.491 E.08365
G3 X146.52 Y142.791 I-4.05 J3.417 E.01173
G1 X148.298 Y141.013 E.07745
G2 X148.431 Y141.414 I2.073 J-.464 E.01305
G1 X146.716 Y143.13 E.07471
G3 X146.874 Y143.505 I-1.792 J.979 E.01258
G1 X148.599 Y141.781 E.07509
G2 X148.797 Y142.117 I1.779 J-.822 E.01204
G1 X146.989 Y143.925 E.07873
G3 X147.041 Y144.408 I-2.389 J.499 E.01498
G1 X149.023 Y142.425 E.08635
G2 X149.276 Y142.707 I1.532 J-1.125 E.01167
G1 X147.003 Y144.98 E.099
G3 X146.779 Y145.738 I-2.411 J-.3 E.02447
G1 X149.676 Y142.841 E.12618
M204 S10000
G1 X149.839 Y145.885 F42000
G1 F9525.574
M204 S6000
G1 X145.203 Y150.522 E.20193
G2 X145.959 Y150.3 I-.779 J-4.062 E.02429
G1 X149.297 Y146.962 E.14541
G3 X148.799 Y147.995 I-4.395 J-1.485 E.03542
G1 X146.571 Y150.222 E.097
; WIPE_START
G1 X147.986 Y148.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.594 Y141.97 Z2.4 F42000
G1 X144.442 Y141.662 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X151.761 Y134.342 E.3188
G1 X151.227 Y134.342 E.01646
G1 X144.108 Y141.461 E.31005
G2 X143.541 Y141.494 I-.103 J3.169 E.01751
G1 X150.693 Y134.342 E.31147
G1 X150.158 Y134.342 E.01646
G1 X142.354 Y142.147 E.33989
; WIPE_START
G1 X143.768 Y140.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.907 Y143.432 Z2.4 F42000
G1 X155.015 Y144.985 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9525.574
M204 S6000
G2 X156.24 Y143.746 I-15.967 J-17.012 E.05367
G2 X157.169 Y142.297 I-4.211 J-3.722 E.05324
G1 X154.297 Y145.168 E.12508
G3 X153.477 Y145.454 I-2.75 J-6.571 E.02677
G1 X157.455 Y141.476 E.17325
G2 X157.597 Y140.8 I-3.306 J-1.048 E.02133
G1 X152.799 Y145.598 E.20899
G3 X152.212 Y145.65 I-.562 J-3.007 E.01816
G1 X157.647 Y140.215 E.23672
G2 X157.648 Y139.68 I-3.57 J-.269 E.01648
G1 X151.676 Y145.652 E.26008
G1 X151.14 Y145.654 E.01652
G1 X153.121 Y143.672 E.0863
G3 X152.443 Y143.816 I-1.302 J-4.469 E.02137
G1 X150.603 Y145.656 E.08012
G1 X150.067 Y145.657 E.01652
G1 X151.888 Y143.837 E.07929
G3 X151.397 Y143.793 I-.025 J-2.474 E.01519
G1 X144.561 Y150.629 E.29775
G1 X143.999 Y150.657 E.01733
G1 X150.957 Y143.698 E.30305
G3 X150.56 Y143.561 I.489 J-2.052 E.01296
G1 X143.463 Y150.658 E.30908
G1 X142.929 Y150.657 E.01646
G1 X150.196 Y143.39 E.31651
G3 X149.862 Y143.19 I.836 J-1.771 E.01202
G1 X142.395 Y150.657 E.32523
G1 X141.86 Y150.657 E.01646
G1 X145.236 Y147.281 E.14703
G3 X144.48 Y147.503 I-1.281 J-2.972 E.02432
G1 X141.326 Y150.657 E.13739
G1 X140.792 Y150.657 E.01646
G1 X143.91 Y147.539 E.1358
G3 X143.427 Y147.487 I.123 J-3.434 E.01497
G1 X140.257 Y150.657 E.13804
G1 X139.723 Y150.657 E.01646
G1 X143.007 Y147.373 E.14301
G3 X142.629 Y147.216 I.596 J-1.968 E.01261
G1 X139.188 Y150.657 E.14984
G1 X138.654 Y150.657 E.01646
G1 X142.294 Y147.017 E.15852
G3 X141.993 Y146.783 I1.022 J-1.622 E.01175
G1 X138.12 Y150.657 E.1687
G1 X137.585 Y150.656 E.01646
G1 X141.725 Y146.517 E.18029
G3 X141.489 Y146.219 I1.375 J-1.332 E.01174
G1 X137.051 Y150.656 E.19328
G1 X136.517 Y150.656 E.01646
G1 X141.292 Y145.881 E.20797
G3 X141.132 Y145.506 I1.788 J-.984 E.01257
G1 X135.982 Y150.656 E.22428
G1 X135.448 Y150.656 E.01646
G1 X141.015 Y145.089 E.24247
G3 X140.962 Y144.607 I2.386 J-.505 E.01495
G1 X134.913 Y150.656 E.26345
G1 X134.379 Y150.656 E.01646
G1 X140.996 Y144.039 E.28818
G3 X141.208 Y143.292 I2.475 J.3 E.02401
G1 X133.845 Y150.656 E.3207
G1 X133.31 Y150.656 E.01646
G1 X149.659 Y134.307 E.71202
G1 X149.659 Y133.773 E.01646
G1 X132.776 Y150.656 E.73529
G1 X132.242 Y150.655 E.01646
G1 X149.659 Y133.238 E.75856
G1 X149.659 Y132.704 E.01646
G1 X131.707 Y150.655 E.78184
G1 X131.173 Y150.655 E.01646
G1 X149.659 Y132.169 E.80511
G1 X149.659 Y131.635 E.01646
G1 X130.639 Y150.655 E.82838
G1 X130.104 Y150.655 E.01646
G1 X149.659 Y131.1 E.85166
G1 X149.659 Y130.566 E.01646
G1 X129.57 Y150.655 E.87493
G1 X129.035 Y150.655 E.01646
G1 X149.659 Y130.032 E.8982
G1 X149.659 Y129.497 E.01646
G1 X128.501 Y150.655 E.92148
G1 X127.967 Y150.655 E.01646
G1 X149.659 Y128.963 E.94475
G1 X149.659 Y128.428 E.01646
G1 X127.432 Y150.655 E.96802
G1 X126.898 Y150.654 E.01646
G1 X149.659 Y127.894 E.9913
G1 X149.659 Y127.359 E.01646
G1 X126.364 Y150.654 E1.01457
G1 X125.829 Y150.654 E.01646
G1 X149.659 Y126.825 E1.03784
G1 X149.659 Y126.29 E.01646
G1 X125.295 Y150.654 E1.06112
G1 X124.76 Y150.654 E.01646
G1 X149.659 Y125.756 E1.08439
G1 X149.659 Y125.221 E.01646
G1 X124.226 Y150.654 E1.10766
G1 X123.692 Y150.654 E.01646
G1 X149.659 Y124.687 E1.13094
G1 X149.659 Y124.152 E.01646
G1 X123.157 Y150.654 E1.15421
G1 X122.623 Y150.654 E.01646
G1 X149.659 Y123.618 E1.17749
G1 X149.659 Y123.083 E.01646
G1 X122.089 Y150.654 E1.20076
G1 X121.554 Y150.653 E.01646
G1 X149.659 Y122.549 E1.22403
G1 X149.659 Y122.014 E.01646
G1 X121.02 Y150.653 E1.24731
G1 X120.485 Y150.653 E.01646
G1 X149.659 Y121.48 E1.27058
G1 X149.659 Y120.945 E.01646
G1 X127.139 Y143.466 E.98082
G1 X127.196 Y143.026 E.01365
G1 X127.189 Y142.881 E.00449
G1 X149.659 Y120.411 E.97861
G1 X149.659 Y119.877 E.01646
M73 P60 R12
G1 X127.106 Y142.429 E.98222
G2 X126.942 Y142.059 I-1.896 J.621 E.01249
G1 X149.659 Y119.342 E.98938
G1 X149.659 Y118.808 E.01646
G1 X126.718 Y141.748 E.99912
G1 X126.441 Y141.491 E.01165
G1 X149.659 Y118.273 E1.01121
G1 X149.659 Y117.739 E.01646
G1 X126.107 Y141.29 E1.02574
G2 X125.71 Y141.153 I-.653 J1.245 E.01299
G1 X149.659 Y117.204 E1.04304
G1 X149.659 Y116.67 E.01646
G1 X125.219 Y141.109 E1.06441
G2 X124.503 Y141.291 I.15 J2.092 E.02289
G1 X149.659 Y116.135 E1.09562
G1 X149.659 Y115.601 E.01646
G1 X123.797 Y141.462 E1.12634
G2 X123.457 Y141.268 I-.651 J.746 E.01215
G1 X149.659 Y115.066 E1.14117
G1 X149.659 Y114.532 E.01646
G1 X123.051 Y141.139 E1.15884
G1 X122.654 Y141.105 E.01228
G1 X122.536 Y141.12 E.00366
G1 X149.659 Y113.997 E1.18127
G1 X149.659 Y113.463 E.01646
G1 X112.47 Y150.652 E1.61968
G1 X113.004 Y150.652 E.01646
G1 X120.822 Y142.834 E.34051
G2 X120.841 Y143.35 I1.286 J.213 E.01601
G1 X113.539 Y150.652 E.31803
G1 X114.073 Y150.652 E.01646
G1 X120.967 Y143.758 E.30024
G1 X121.161 Y144.098 E.01206
G1 X114.607 Y150.652 E.28543
G1 X115.142 Y150.652 E.01646
G1 X121.411 Y144.383 E.27304
G2 X121.714 Y144.614 I.918 J-.889 E.01179
G1 X115.676 Y150.652 E.26297
G1 X116.21 Y150.652 E.01646
G1 X122.08 Y144.782 E.25566
G1 X122.188 Y144.824 E.00355
G1 X122.515 Y144.882 E.01024
G1 X116.745 Y150.653 E.25131
G1 X117.279 Y150.653 E.01646
G1 X123.078 Y144.853 E.25257
G1 X123.123 Y144.848 E.00138
G2 X123.999 Y144.374 I-.402 J-1.788 E.03107
G1 X124.051 Y144.415 E.00206
G1 X117.814 Y150.653 E.27166
G1 X118.348 Y150.653 E.01646
G1 X124.363 Y144.638 E.26196
G2 X124.735 Y144.8 I.587 J-.842 E.0126
G1 X118.882 Y150.653 E.25491
G1 X119.417 Y150.653 E.01646
G1 X125.187 Y144.883 E.25132
G1 X125.348 Y144.895 E.00498
G1 X125.773 Y144.831 E.01324
G1 X119.781 Y150.823 E.26097
M204 S10000
G1 X111.766 Y150.821 F42000
G1 F9525.574
M204 S6000
G1 X149.659 Y112.928 E1.65034
G1 X149.659 Y112.394 E.01646
G1 X111.401 Y150.652 E1.66623
G1 X110.867 Y150.651 E.01646
G1 X149.659 Y111.859 E1.6895
G1 X149.659 Y111.325 E.01646
G1 X110.332 Y150.651 E1.71278
G1 X109.798 Y150.651 E.01646
G1 X149.653 Y110.796 E1.73581
G2 X149.61 Y110.305 I-3.354 J.048 E.0152
G1 X109.264 Y150.651 E1.7572
G1 X108.729 Y150.651 E.01646
G1 X145.01 Y114.37 E1.58014
G3 X144.321 Y114.525 I-.826 J-2.065 E.02185
G1 X108.195 Y150.651 E1.57339
G1 X107.66 Y150.651 E.01646
G1 X143.774 Y114.536 E1.57288
G3 X143.315 Y114.462 I.139 J-2.33 E.01433
G1 X107.126 Y150.651 E1.57613
G1 X106.592 Y150.651 E.01646
G1 X142.904 Y114.339 E1.58149
G3 X142.54 Y114.167 I1.75 J-4.182 E.01237
G1 X106.057 Y150.651 E1.58895
G1 X105.523 Y150.65 E.01646
G1 X132.131 Y124.042 E1.15886
G1 X131.597 Y124.042 E.01646
G1 X104.989 Y150.65 E1.15885
G1 X104.454 Y150.65 E.01646
G1 X131.062 Y124.042 E1.15885
G1 X130.528 Y124.042 E.01646
G1 X103.92 Y150.65 E1.15884
G3 X103.416 Y150.62 I-.098 J-2.58 E.01558
G1 X129.993 Y124.042 E1.15752
G1 X129.459 Y124.042 E.01646
G1 X102.949 Y150.552 E1.15455
G3 X102.513 Y150.453 I.282 J-2.261 E.01379
G1 X128.924 Y124.042 E1.15026
G1 X128.39 Y124.042 E.01646
G1 X106.838 Y145.594 E.93861
G2 X107.019 Y144.879 I-2.936 J-1.12 E.02275
G1 X127.855 Y124.042 E.90749
G1 X127.321 Y124.042 E.01646
G1 X107.037 Y144.327 E.88343
G2 X106.974 Y143.855 I-3.495 J.222 E.01467
G1 X126.786 Y124.042 E.86288
G1 X126.252 Y124.042 E.01646
G1 X106.852 Y143.443 E.84493
G2 X106.688 Y143.072 I-1.932 J.632 E.0125
G1 X125.717 Y124.042 E.82879
G1 X125.183 Y124.042 E.01646
G1 X106.483 Y142.742 E.81441
G2 X106.244 Y142.447 I-1.591 J1.049 E.01172
G1 X124.648 Y124.042 E.80158
G1 X124.114 Y124.042 E.01646
G1 X105.972 Y142.184 E.79013
G2 X105.668 Y141.954 I-1.305 J1.406 E.01177
G1 X123.579 Y124.042 E.7801
G1 X123.045 Y124.042 E.01646
G1 X105.325 Y141.762 E.77174
G2 X104.943 Y141.609 I-.955 J1.833 E.01268
G1 X122.51 Y124.042 E.76509
G1 X121.976 Y124.042 E.01646
G1 X104.518 Y141.501 E.76036
G2 X104.025 Y141.459 I-.453 J2.442 E.01527
G1 X121.442 Y124.042 E.75856
G1 X120.907 Y124.042 E.01646
G1 X103.208 Y141.741 E.77082
; WIPE_START
G1 X104.623 Y140.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.24 Y143.709 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X98.532 Y146.418 E.11797
G2 X98.655 Y146.829 I2.151 J-.42 E.01324
G1 X100.958 Y144.526 E.10033
G2 X101.004 Y145.014 I2.469 J.016 E.01514
G1 X98.8 Y147.218 E.09599
G1 X98.972 Y147.581 E.01236
G1 X101.109 Y145.444 E.09309
G2 X101.264 Y145.823 I1.973 J-.583 E.01265
G1 X99.165 Y147.922 E.0914
G2 X99.375 Y148.247 I1.757 J-.903 E.01193
G1 X101.456 Y146.166 E.09064
G2 X101.684 Y146.472 I3.979 J-2.718 E.01177
G1 X99.602 Y148.554 E.09065
G2 X99.853 Y148.837 I1.562 J-1.131 E.01168
G1 X101.948 Y146.743 E.09121
G2 X102.244 Y146.981 I1.343 J-1.366 E.01173
G1 X100.116 Y149.11 E.0927
G2 X100.403 Y149.356 I1.812 J-1.82 E.01168
G1 X102.573 Y147.186 E.09452
G2 X102.943 Y147.352 I1.847 J-3.63 E.01246
G1 X100.703 Y149.591 E.09755
G1 X101.023 Y149.805 E.01187
G1 X103.357 Y147.471 E.10165
G2 X103.826 Y147.537 I.706 J-3.346 E.0146
G1 X101.365 Y149.998 E.10718
G2 X101.725 Y150.173 I1.069 J-1.739 E.01233
G1 X104.377 Y147.521 E.11551
G2 X105.096 Y147.337 I-.249 J-2.464 E.02293
G1 X101.973 Y150.459 E.136
M204 S10000
G1 X98.285 Y146.13 F42000
G1 F9525.574
M204 S6000
G1 X120.373 Y124.042 E.96197
M73 P61 R12
G1 X119.838 Y124.042 E.01646
G1 X98.368 Y145.512 E.93508
G3 X98.351 Y144.995 I3.51 J-.375 E.01596
G1 X119.304 Y124.042 E.91255
G1 X118.769 Y124.042 E.01646
G1 X98.351 Y144.461 E.88927
G1 X98.351 Y143.926 E.01646
G1 X118.235 Y124.042 E.866
G1 X117.7 Y124.042 E.01646
G1 X98.351 Y143.392 E.84273
G1 X98.35 Y142.858 E.01646
G1 X117.166 Y124.042 E.81946
G1 X116.631 Y124.042 E.01646
G1 X98.35 Y142.323 E.79618
G1 X98.35 Y141.789 E.01646
G1 X116.097 Y124.042 E.77291
G1 X115.562 Y124.042 E.01646
G1 X98.35 Y141.255 E.74964
G1 X98.35 Y140.72 E.01646
G1 X115.159 Y123.912 E.73207
G1 X115.159 Y123.377 E.01646
G1 X98.35 Y140.186 E.73207
G1 X98.35 Y139.651 E.01646
G1 X115.159 Y122.843 E.73208
G1 X115.159 Y122.308 E.01646
G1 X98.35 Y139.117 E.73208
G1 X98.35 Y138.583 E.01646
G1 X115.159 Y121.774 E.73209
G1 X115.159 Y121.239 E.01646
G1 X98.349 Y138.048 E.73209
G1 X98.349 Y137.514 E.01646
G1 X115.159 Y120.705 E.7321
G1 X115.159 Y120.17 E.01646
G1 X98.349 Y136.98 E.7321
G1 X98.349 Y136.445 E.01646
G1 X115.159 Y119.636 E.73211
G1 X115.159 Y119.101 E.01646
G1 X98.349 Y135.911 E.73211
G1 X98.349 Y135.377 E.01646
G1 X115.159 Y118.567 E.73212
G1 X115.159 Y118.032 E.01646
G1 X98.349 Y134.842 E.73212
G1 X98.349 Y134.308 E.01646
G1 X115.159 Y117.498 E.73213
G1 X115.159 Y116.963 E.01646
G1 X98.348 Y133.774 E.73213
G1 X98.348 Y133.239 E.01646
G1 X115.159 Y116.429 E.73214
G1 X115.159 Y115.894 E.01646
G1 X98.348 Y132.705 E.73214
G1 X98.348 Y132.17 E.01646
G1 X115.159 Y115.36 E.73215
G1 X115.159 Y114.825 E.01646
G1 X98.348 Y131.636 E.73215
G1 X98.348 Y131.102 E.01646
G1 X115.159 Y114.291 E.73216
G1 X115.159 Y113.757 E.01646
G1 X98.348 Y130.567 E.73216
G1 X98.348 Y130.033 E.01646
G1 X115.159 Y113.222 E.73217
G1 X115.159 Y112.688 E.01646
G1 X98.348 Y129.499 E.73217
G1 X98.347 Y128.964 E.01646
G1 X115.328 Y111.983 E.73957
M204 S10000
G1 X100.97 Y106.032 F42000
G1 F9525.574
M204 S6000
G1 X99.994 Y107.008 E.04252
G2 X98.841 Y108.695 I3.9 J3.902 E.0633
G1 X101.696 Y105.84 E.12436
G3 X102.528 Y105.542 I1.947 J4.134 E.02725
G1 X98.546 Y109.525 E.17344
G2 X98.408 Y110.197 I3.343 J1.035 E.02116
G1 X103.204 Y105.401 E.20887
G3 X103.79 Y105.35 I.553 J2.948 E.01813
G1 X98.355 Y110.785 E.2367
G2 X98.344 Y111.331 I5.583 J.39 E.01682
G1 X104.324 Y105.35 E.26048
G1 X104.859 Y105.35 E.01646
G1 X98.344 Y111.865 E.28375
G1 X98.344 Y112.399 E.01646
G1 X105.393 Y105.35 E.30702
G1 X105.928 Y105.35 E.01646
G1 X98.174 Y113.103 E.33769
M204 S10000
G1 X98.176 Y121.119 F42000
G1 F9525.574
M204 S6000
G1 X104.885 Y114.41 E.2922
G3 X104.228 Y114.532 I-.89 J-2.957 E.02061
G1 X98.346 Y120.415 E.25622
G1 X98.345 Y119.88 E.01646
G1 X103.699 Y114.526 E.23318
G3 X103.245 Y114.446 I.174 J-2.311 E.01423
G1 X98.345 Y119.346 E.21341
G1 X98.345 Y118.812 E.01646
G1 X102.844 Y114.313 E.19592
G3 X102.486 Y114.136 I.704 J-1.869 E.0123
G1 X98.345 Y118.277 E.18036
G1 X98.345 Y117.743 E.01646
G1 X102.164 Y113.924 E.16633
G3 X101.875 Y113.678 I3.498 J-4.416 E.01168
G1 X98.345 Y117.209 E.15375
G1 X98.345 Y116.674 E.01646
G1 X101.623 Y113.396 E.14278
G3 X101.404 Y113.081 I1.468 J-1.254 E.01185
G1 X98.345 Y116.14 E.13324
G1 X98.344 Y115.605 E.01646
G1 X101.219 Y112.731 E.1252
G3 X101.077 Y112.338 I3.53 J-1.5 E.01286
G1 X98.344 Y115.071 E.11902
G1 X98.344 Y114.537 E.01646
G1 X100.986 Y111.895 E.11506
G3 X100.963 Y111.384 I3.133 J-.398 E.01578
G1 X98.344 Y114.002 E.11405
G1 X98.344 Y113.468 E.01646
G1 X101.309 Y110.503 E.12914
; WIPE_START
G1 X99.895 Y111.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.005 Y108.807 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X106.462 Y105.35 E.15058
G1 X106.997 Y105.35 E.01646
G1 X103.887 Y108.46 E.13545
G3 X104.396 Y108.485 I.079 J3.504 E.0157
G1 X107.531 Y105.35 E.13657
G1 X108.066 Y105.35 E.01646
G1 X104.841 Y108.575 E.14046
G3 X105.231 Y108.719 I-.527 J2.019 E.01283
G1 X108.6 Y105.35 E.14676
G1 X109.135 Y105.35 E.01646
G1 X105.582 Y108.902 E.15472
G3 X105.899 Y109.12 I-.93 J1.693 E.01186
G1 X109.669 Y105.35 E.16421
G1 X110.204 Y105.35 E.01646
G1 X106.178 Y109.376 E.17535
G3 X106.424 Y109.664 I-1.313 J1.374 E.01169
G1 X110.738 Y105.35 E.18789
G1 X111.273 Y105.35 E.01646
G1 X106.638 Y109.984 E.20186
G3 X106.815 Y110.342 I-3.805 J2.107 E.01229
G1 X111.807 Y105.35 E.21743
G1 X112.342 Y105.35 E.01646
G1 X106.946 Y110.745 E.23499
G3 X107.03 Y111.196 I-2.21 J.644 E.01414
G1 X112.876 Y105.35 E.25462
G1 X113.411 Y105.35 E.01646
G1 X107.034 Y111.726 E.27773
G3 X106.914 Y112.381 I-3.364 J-.278 E.02051
G1 X113.945 Y105.349 E.30622
G1 X114.48 Y105.349 E.01646
G1 X98.346 Y121.483 E.70268
G1 X98.346 Y122.018 E.01646
G1 X115.014 Y105.349 E.72595
G1 X115.549 Y105.349 E.01646
G1 X98.346 Y122.552 E.74922
G1 X98.346 Y123.086 E.01646
G1 X116.083 Y105.349 E.7725
G1 X116.618 Y105.349 E.01646
G1 X98.346 Y123.621 E.79577
G1 X98.346 Y124.155 E.01646
G1 X117.152 Y105.349 E.81905
G1 X117.687 Y105.349 E.01646
G1 X98.346 Y124.689 E.84232
G1 X98.347 Y125.224 E.01646
G1 X118.221 Y105.349 E.86559
G1 X118.756 Y105.349 E.01646
G1 X98.347 Y125.758 E.88887
G1 X98.347 Y126.293 E.01646
G1 X119.29 Y105.349 E.91214
G1 X119.825 Y105.349 E.01646
G1 X98.347 Y126.827 E.93541
G1 X98.347 Y127.361 E.01646
G1 X120.359 Y105.349 E.95869
G1 X120.894 Y105.349 E.01646
G1 X98.347 Y127.896 E.98196
G1 X98.347 Y128.43 E.01646
G1 X121.428 Y105.349 E1.00523
G1 X121.963 Y105.349 E.01646
G1 X115.954 Y111.358 E.26168
G1 X116.489 Y111.358 E.01646
G1 X122.497 Y105.349 E.26168
G1 X123.032 Y105.349 E.01646
G1 X117.023 Y111.358 E.26169
G1 X117.558 Y111.358 E.01646
G1 X123.566 Y105.349 E.26169
G1 X124.101 Y105.349 E.01646
G1 X118.092 Y111.358 E.26169
G1 X118.627 Y111.358 E.01646
G1 X124.635 Y105.349 E.26169
G1 X125.17 Y105.349 E.01646
G1 X119.161 Y111.358 E.26169
G1 X119.695 Y111.358 E.01646
G1 X125.704 Y105.349 E.26169
G1 X126.239 Y105.349 E.01646
G1 X120.23 Y111.358 E.26169
G1 X120.764 Y111.358 E.01646
G1 X126.773 Y105.349 E.26169
G1 X127.308 Y105.349 E.01646
G1 X121.299 Y111.358 E.26169
G1 X121.833 Y111.358 E.01646
G1 X127.842 Y105.349 E.26169
G1 X128.377 Y105.349 E.01646
G1 X122.368 Y111.358 E.2617
G1 X122.902 Y111.358 E.01646
G1 X128.911 Y105.349 E.2617
G1 X129.446 Y105.349 E.01646
G1 X123.437 Y111.358 E.2617
G1 X123.971 Y111.358 E.01646
G1 X129.98 Y105.349 E.2617
G1 X130.515 Y105.349 E.01646
G1 X124.506 Y111.358 E.2617
G1 X125.04 Y111.358 E.01646
G1 X131.049 Y105.349 E.2617
G1 X131.584 Y105.349 E.01646
G1 X125.575 Y111.358 E.2617
G1 X126.109 Y111.358 E.01646
G1 X132.118 Y105.349 E.2617
G1 X132.653 Y105.349 E.01646
G1 X126.644 Y111.358 E.2617
G1 X127.178 Y111.358 E.01646
G1 X133.187 Y105.349 E.2617
G1 X133.722 Y105.349 E.01646
G1 X127.713 Y111.358 E.2617
G1 X128.247 Y111.358 E.01646
G1 X134.256 Y105.349 E.26171
G1 X134.791 Y105.349 E.01646
G1 X128.782 Y111.358 E.26171
G1 X129.316 Y111.358 E.01646
G1 X135.325 Y105.349 E.26171
G1 X135.859 Y105.349 E.01646
G1 X129.851 Y111.358 E.26171
G1 X130.385 Y111.358 E.01646
G1 X136.394 Y105.349 E.26171
G1 X136.928 Y105.349 E.01646
G1 X130.919 Y111.358 E.26171
G1 X131.454 Y111.358 E.01646
G1 X137.463 Y105.349 E.26171
G1 X137.997 Y105.349 E.01646
G1 X131.988 Y111.358 E.26171
G1 X132.523 Y111.358 E.01646
G1 X138.532 Y105.348 E.26171
G1 X139.066 Y105.348 E.01646
G1 X132.843 Y111.571 E.27103
G1 X132.843 Y112.106 E.01646
G1 X139.601 Y105.348 E.29431
G1 X140.135 Y105.348 E.01646
G1 X132.843 Y112.64 E.31759
G1 X132.843 Y113.175 E.01646
G1 X140.67 Y105.348 E.34086
G1 X141.204 Y105.348 E.01646
G1 X132.843 Y113.709 E.36414
G1 X132.843 Y114.244 E.01646
G1 X141.739 Y105.348 E.38742
G1 X142.273 Y105.348 E.01646
G1 X132.843 Y114.778 E.4107
G1 X132.843 Y115.313 E.01646
G1 X142.808 Y105.348 E.43398
G1 X143.342 Y105.348 E.01646
G1 X132.843 Y115.847 E.45726
G1 X132.843 Y116.382 E.01646
G1 X143.877 Y105.348 E.48054
G3 X144.4 Y105.36 I.17 J4.052 E.01611
G1 X132.843 Y116.916 E.5033
G1 X132.843 Y117.451 E.01646
G1 X144.876 Y105.418 E.52406
G3 X145.327 Y105.501 I-.341 J3.1 E.01414
G1 X132.674 Y118.155 E.55109
M204 S10000
G1 X142.335 Y113.838 F42000
G1 F9525.574
M204 S6000
G1 X132.843 Y123.33 E.4134
G1 X132.843 Y122.795 E.01646
G1 X141.92 Y113.719 E.39532
G3 X141.66 Y113.444 I3.545 J-3.627 E.01165
G1 X132.843 Y122.261 E.38398
G1 X132.843 Y121.726 E.01646
G1 X141.436 Y113.134 E.37424
G3 X141.247 Y112.788 I1.633 J-1.12 E.01214
G1 X132.843 Y121.192 E.366
G1 X132.843 Y120.658 E.01646
G1 X141.095 Y112.406 E.35939
G3 X140.997 Y111.969 I4.087 J-1.148 E.01378
G1 X132.843 Y120.123 E.35512
G1 X132.843 Y119.589 E.01646
G1 X140.958 Y111.474 E.35342
G3 X141.023 Y110.875 I3.905 J.119 E.01858
G1 X132.843 Y119.054 E.35624
G1 X132.843 Y118.52 E.01646
G1 X145.74 Y105.623 E.56168
G3 X146.136 Y105.762 I-.743 J2.756 E.01293
G1 X143.374 Y108.523 E.12027
G3 X143.974 Y108.458 I.676 J3.429 E.0186
G1 X146.5 Y105.932 E.11003
G3 X146.85 Y106.116 I-.938 J2.202 E.0122
G1 X144.472 Y108.495 E.10359
G3 X144.905 Y108.596 I-.587 J3.481 E.01371
G1 X147.176 Y106.325 E.09892
G3 X147.485 Y106.55 I-1.028 J1.738 E.0118
G1 X145.29 Y108.746 E.09563
G3 X145.636 Y108.934 I-.763 J1.826 E.01216
G1 X147.779 Y106.791 E.09331
G3 X148.052 Y107.053 I-4.131 J4.582 E.01164
G1 X145.944 Y109.16 E.09178
G3 X146.219 Y109.42 I-1.161 J1.5 E.01166
G1 X148.303 Y107.336 E.09078
G1 X148.544 Y107.629 E.0117
G1 X146.461 Y109.712 E.09072
G3 X146.67 Y110.037 I-1.523 J1.21 E.01193
G1 X148.758 Y107.95 E.09093
G3 X148.957 Y108.286 I-1.606 J1.176 E.01204
G1 X146.838 Y110.405 E.09229
G3 X146.964 Y110.813 I-1.981 J.833 E.01319
G1 X149.14 Y108.637 E.09478
G3 X149.293 Y109.018 I-2.504 J1.227 E.01267
G1 X147.034 Y111.277 E.09838
G3 X147.028 Y111.818 I-3.945 J.225 E.01667
G1 X149.431 Y109.415 E.10465
M73 P62 R12
G3 X149.533 Y109.848 I-2.871 J.906 E.01369
G1 X146.543 Y112.837 E.13019
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9525.574
G1 X147.958 Y111.423 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/53
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.4 I-1.009 J-.68 P1  F42000
G1 X126.842 Y142.785 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.847 Y142.845 E.00202
G3 X124.005 Y143.87 I-1.55 J.153 E.13672
G3 X124.001 Y142.135 I-1.301 J-.864 E.26447
G3 X125.107 Y141.452 I1.314 J.89 E.04442
G3 X126.786 Y142.542 I.189 J1.546 E.07211
G1 X126.828 Y142.726 E.00628
M204 S10000
G1 X126.444 Y142.865 F42000
G1 F5400
M204 S6000
G1 X126.445 Y142.886 E.00068
G3 X125.158 Y141.856 I-1.145 J.112 E.17869
G1 X125.272 Y141.848 E.00382
G3 X126.401 Y142.661 I.029 J1.15 E.04954
G1 X126.432 Y142.806 E.00494
M204 S250
G1 X126.056 Y142.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X125.206 Y142.246 I-.755 J.073 E.10916
G1 X125.282 Y142.24 E.00233
G3 X126.048 Y142.865 I.019 J.758 E.03307
; WIPE_START
M204 S6000
G1 X126.038 Y143.188 E-.12262
G1 X125.986 Y143.33 E-.05753
G1 X125.907 Y143.459 E-.05747
G1 X125.804 Y143.57 E-.0575
G1 X125.681 Y143.658 E-.0576
G1 X125.543 Y143.721 E-.05743
G1 X125.396 Y143.754 E-.0576
G1 X125.244 Y143.758 E-.05752
G1 X125.095 Y143.732 E-.05743
G1 X124.954 Y143.677 E-.05766
G1 X124.827 Y143.594 E-.05753
G1 X124.719 Y143.489 E-.05745
G1 X124.712 Y143.479 E-.00463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.359 Y141.909 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.558 Y141.856 E.00683
G1 X122.672 Y141.848 E.00382
G3 X122.246 Y141.941 I.029 J1.15 E.2251
G1 X122.301 Y141.926 E.00191
M204 S250
G1 X122.46 Y142.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.606 Y142.246 E.00466
G1 X122.682 Y142.24 E.00233
G3 X122.4 Y142.302 I.019 J.758 E.13748
G1 X122.402 Y142.301 E.00007
; WIPE_START
M204 S6000
G1 X122.606 Y142.246 E-.08044
G1 X122.682 Y142.24 E-.02886
G1 X122.833 Y142.251 E-.05751
G1 X122.979 Y142.292 E-.05746
G1 X123.114 Y142.361 E-.05761
G1 X123.232 Y142.456 E-.05744
G1 X123.369 Y142.636 E-.08617
G1 X123.428 Y142.776 E-.05752
G1 X123.458 Y142.924 E-.05763
G1 X123.438 Y143.188 E-.10032
G1 X123.386 Y143.33 E-.05753
G1 X123.307 Y143.459 E-.05747
G1 X123.3 Y143.467 E-.00403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.923 Y143.842 Z2.6 F42000
G1 X146.706 Y144.62 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.696 Y144.77 E.00499
G3 X143.664 Y141.811 I-2.695 J-.271 E.4032
G1 X143.934 Y141.79 E.00897
G3 X146.71 Y144.5 I.067 J2.708 E.14343
G1 X146.708 Y144.56 E.00198
M204 S10000
G1 X146.292 Y144.621 F42000
G1 F5400
M204 S6000
G1 X146.256 Y144.956 E.01117
G3 X143.715 Y142.215 I-2.255 J-.458 E.33494
G1 X143.944 Y142.198 E.00762
G3 X146.302 Y144.5 I.057 J2.301 E.12186
G1 X146.297 Y144.562 E.00205
M204 S250
G1 X145.903 Y144.582 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.872 Y144.878 E.00914
G3 X143.763 Y142.605 I-1.871 J-.38 E.25737
G1 X143.953 Y142.59 E.00585
G3 X145.91 Y144.5 I.047 J1.908 E.09364
G1 X145.908 Y144.523 E.0007
; WIPE_START
M204 S6000
G1 X145.872 Y144.878 E-.13587
G1 X145.761 Y145.242 E-.14445
G1 X145.579 Y145.576 E-.14456
G1 X145.335 Y145.867 E-.14452
G1 X145.073 Y146.08 E-.12821
G1 X144.93 Y146.161 E-.06239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.395 Y139.36 Z2.6 F42000
G1 X148.953 Y138.267 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.104 Y138.02 E.00959
G3 X151.914 Y136.492 I2.897 J1.979 E.11017
G1 X152.088 Y136.492 E.0058
G3 X148.919 Y138.322 I-.087 J3.508 E.60363
G1 X148.922 Y138.318 E.00015
M204 S10000
G1 X149.3 Y138.479 F42000
G1 F5400
M204 S6000
G1 X149.439 Y138.251 E.00887
G3 X151.924 Y136.899 I2.562 J1.749 E.09743
G1 X152.078 Y136.899 E.00513
G3 X149.269 Y138.531 I-.077 J3.101 E.53306
M204 S250
G1 X149.634 Y138.683 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.762 Y138.473 E.00757
G3 X151.934 Y137.291 I2.239 J1.527 E.07888
G1 X152.069 Y137.291 E.00415
G3 X149.604 Y138.735 I-.068 J2.709 E.43069
; WIPE_START
M204 S6000
G1 X149.762 Y138.473 E-.1164
G1 X150.014 Y138.157 E-.15367
G1 X150.208 Y137.968 E-.1027
G1 X150.419 Y137.8 E-.10266
G1 X150.646 Y137.653 E-.10266
G1 X150.887 Y137.53 E-.10267
G1 X151.081 Y137.454 E-.07923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.496 Y129.987 Z2.6 F42000
G1 X145.041 Y108.999 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.237 Y109.088 E.00717
G3 X143.664 Y108.811 I-1.237 J2.41 E.51076
G1 X143.934 Y108.79 E.00897
G3 X144.986 Y108.975 I.067 J2.708 E.03567
M204 S10000
G1 X144.893 Y109.382 F42000
G1 F5400
M204 S6000
G1 X145.25 Y109.566 E.01333
G3 X143.715 Y109.215 I-1.249 J1.933 E.42634
G1 X143.944 Y109.198 E.00762
G3 X144.839 Y109.355 I.057 J2.301 E.03036
M204 S250
G1 X144.715 Y109.73 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.037 Y109.896 E.01115
G3 X143.763 Y109.605 I-1.036 J1.603 E.3276
G1 X143.953 Y109.59 E.00585
G3 X144.659 Y109.707 I.047 J1.908 E.02211
; WIPE_START
M204 S6000
G1 X145.037 Y109.896 E-.16055
G1 X145.335 Y110.132 E-.14447
G1 X145.579 Y110.424 E-.14471
G1 X145.761 Y110.758 E-.14449
G1 X145.873 Y111.121 E-.14452
G1 X145.879 Y111.177 E-.02126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.248 Y111.31 Z2.6 F42000
G1 X116.291 Y111.691 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.764 Y111.276 Z2.6 F42000
G1 X101.905 Y109.787 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X102.015 Y109.657 E.00564
G3 X103.664 Y108.811 I1.986 J1.842 E.06276
G1 X103.934 Y108.79 E.00897
G3 X101.841 Y109.864 I.067 J2.708 E.48386
G1 X101.867 Y109.833 E.00134
M204 S10000
G1 X102.235 Y110.034 F42000
G1 F5400
M204 S6000
G1 X102.478 Y109.774 E.0118
G3 X103.715 Y109.215 I1.523 J1.725 E.0457
G1 X103.944 Y109.198 E.00762
G3 X102.166 Y110.11 I.057 J2.301 E.4111
G1 X102.195 Y110.078 E.00142
M204 S250
G1 X102.522 Y110.3 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X102.737 Y110.068 E.00973
G3 X103.763 Y109.605 I1.264 J1.431 E.03512
G1 X103.953 Y109.59 E.00585
G3 X102.479 Y110.347 I.047 J1.908 E.31589
G1 X102.481 Y110.344 E.00011
; WIPE_START
M204 S6000
G1 X102.737 Y110.068 E-.14313
G1 X103.046 Y109.846 E-.14455
G1 X103.393 Y109.689 E-.14452
G1 X103.763 Y109.605 E-.14452
G1 X103.953 Y109.59 E-.07241
G1 X104.244 Y109.612 E-.11086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.545 Y117.239 Z2.6 F42000
G1 X105.533 Y142.268 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.69 Y142.381 E.00643
G3 X103.664 Y141.811 I-1.689 J2.117 E.49284
G1 X103.934 Y141.79 E.00897
G3 X105.471 Y142.223 I.067 J2.708 E.0538
G1 X105.485 Y142.233 E.00053
M204 S10000
G1 X105.312 Y142.615 F42000
G1 F5400
M204 S6000
G1 X105.608 Y142.852 E.0126
G3 X103.715 Y142.215 I-1.607 J1.647 E.41111
G1 X103.944 Y142.198 E.00762
G3 X105.25 Y142.566 I.057 J2.301 E.04571
G1 X105.265 Y142.577 E.00061
M204 S250
G1 X105.068 Y142.92 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X105.334 Y143.133 E.01047
G3 X103.763 Y142.605 I-1.333 J1.366 E.3159
G1 X103.953 Y142.59 E.00585
G3 X105.02 Y142.885 I.047 J1.908 E.03449
; WIPE_START
M204 S6000
G1 X105.334 Y143.133 E-.15216
G1 X105.579 Y143.424 E-.14469
G1 X105.761 Y143.758 E-.14449
G1 X105.873 Y144.121 E-.14454
G1 X105.911 Y144.5 E-.14457
G1 X105.904 Y144.577 E-.02954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.326 Y142.798 Z2.6 F42000
G1 X149.992 Y134.009 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.191 J-3.736 E.04473
G3 X143.989 Y150.991 I-5.555 J-2.283 E.23533
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.254 Y105.016 E1.33483
G3 X149.992 Y111.013 I-.256 J5.989 E.30412
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.437 J-2.015 E.08814
G3 X143.994 Y151.398 I-5.16 J-3.81 E.19888
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.264 Y104.609 E1.33532
G3 X150.399 Y111.008 I-.266 J6.396 E.32483
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.566 J-1.812 E.27219
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.795 J.002 E.32784
G1 X144.273 Y104.217 E1.23737
G3 X150.791 Y111.003 I-.275 J6.788 E.31937
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
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


G1 X150.531 Y134.173 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F9503.695
M204 S6000
G1 X152.56 Y136.202 E.08857
G3 X153.271 Y136.377 I-.599 J3.95 E.02266
M73 P62 R11
G1 X151.236 Y134.342 E.08884
G1 X151.772 Y134.342 E.01654
G1 X157.647 Y140.218 E.25649
G2 X157.643 Y139.678 I-2.704 J-.247 E.01671
G1 X152.324 Y134.359 E.23216
G3 X152.927 Y134.426 I-.029 J3.027 E.01873
G1 X157.575 Y139.074 E.20291
G2 X157.417 Y138.381 I-4.185 J.587 E.02197
G1 X153.618 Y134.582 E.16585
G3 X154.456 Y134.903 I-1.538 J5.255 E.02773
G1 X154.499 Y134.927 E.00153
G1 X157.41 Y137.838 E.12706
M204 S10000
G1 X157.758 Y140.864 F42000
G1 F9503.695
M204 S6000
G1 X155.624 Y138.73 E.09318
G3 X155.798 Y139.441 I-3.657 J1.277 E.02263
G1 X157.531 Y141.173 E.07564
G3 X157.421 Y141.598 I-2.178 J-.34 E.01358
G1 X155.843 Y140.021 E.06886
G3 X155.805 Y140.518 I-2.501 J.057 E.01542
G1 X157.286 Y141.999 E.06466
G3 X157.132 Y142.381 I-2.619 J-.837 E.01271
G1 X155.716 Y140.965 E.06179
G3 X155.587 Y141.371 I-2.092 J-.444 E.01318
G1 X156.951 Y142.736 E.05956
G3 X156.746 Y143.067 I-2.307 J-1.198 E.01202
G1 X155.422 Y141.743 E.0578
M73 P63 R11
G3 X155.227 Y142.083 I-1.801 J-.809 E.01213
G1 X156.53 Y143.387 E.05692
G3 X156.288 Y143.68 I-2.077 J-1.465 E.01176
G1 X154.998 Y142.39 E.05634
G3 X154.751 Y142.679 I-1.278 J-.838 E.01176
G1 X156.036 Y143.964 E.05607
G1 X155.758 Y144.221 E.0117
G1 X154.474 Y142.937 E.05605
G3 X154.17 Y143.169 I-1.308 J-1.405 E.01182
G1 X155.469 Y144.468 E.05672
G3 X155.154 Y144.689 I-1.627 J-1.989 E.01188
G1 X153.837 Y143.372 E.05747
G3 X153.475 Y143.545 I-1.044 J-1.721 E.01242
G1 X154.828 Y144.898 E.05907
G3 X154.474 Y145.08 I-1.39 J-2.271 E.01229
G1 X153.078 Y143.684 E.06093
G3 X152.643 Y143.784 I-.718 J-2.126 E.01382
G1 X154.105 Y145.247 E.06383
G1 X153.712 Y145.39 E.0129
G1 X152.16 Y143.837 E.06777
G3 X151.605 Y143.819 I-.126 J-4.554 E.01713
G1 X153.289 Y145.502 E.07349
G3 X152.845 Y145.594 I-1.262 J-5.003 E.014
G1 X150.676 Y143.425 E.09467
; WIPE_START
G1 X152.09 Y144.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.581 Y141.33 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X131.293 Y124.042 E.75466
G1 X131.829 Y124.042 E.01654
G1 X148.178 Y140.392 E.7137
G3 X148.166 Y139.843 I5.534 J-.402 E.01694
G1 X132.365 Y124.042 E.68976
G1 X132.843 Y124.042 E.01478
G1 X132.843 Y123.985 E.00176
G1 X148.216 Y139.358 E.67106
G3 X148.315 Y138.921 I2.237 J.276 E.01385
G1 X132.843 Y123.45 E.67538
G1 X132.843 Y122.914 E.01654
G1 X148.454 Y138.524 E.68143
G3 X148.626 Y138.162 I1.89 J.678 E.0124
G1 X132.843 Y122.378 E.68898
G1 X132.843 Y121.843 E.01654
G1 X148.83 Y137.829 E.69785
G1 X149.067 Y137.531 E.01177
G1 X132.843 Y121.307 E.70823
G1 X132.843 Y120.771 E.01654
G1 X149.323 Y137.25 E.71937
G3 X149.607 Y136.999 I1.398 J1.298 E.01173
G1 X132.843 Y120.235 E.7318
G1 X132.843 Y119.7 E.01654
G1 X149.919 Y136.775 E.7454
G3 X150.259 Y136.58 I1.148 J1.601 E.01213
G1 X132.843 Y119.164 E.76025
G1 X132.843 Y118.628 E.01654
G1 X150.63 Y136.415 E.77643
G3 X151.035 Y136.284 I.854 J1.96 E.01316
G1 X132.843 Y118.093 E.79412
G1 X132.843 Y117.557 E.01654
G1 X151.481 Y136.194 E.81357
G3 X151.982 Y136.16 I.615 J5.326 E.01552
G1 X150.165 Y134.342 E.07934
G1 X149.659 Y134.342 E.01562
G1 X149.659 Y133.836 E.01562
G1 X132.843 Y117.021 E.73404
G1 X132.843 Y116.486 E.01654
G1 X149.659 Y133.301 E.73404
G1 X149.659 Y132.765 E.01654
G1 X132.843 Y115.95 E.73404
G1 X132.843 Y115.414 E.01654
G1 X149.659 Y132.229 E.73404
G1 X149.659 Y131.694 E.01654
G1 X132.843 Y114.878 E.73404
G1 X132.843 Y114.343 E.01654
G1 X149.659 Y131.158 E.73404
G1 X149.659 Y130.622 E.01654
G1 X132.843 Y113.807 E.73404
G1 X132.843 Y113.271 E.01654
G1 X149.659 Y130.087 E.73404
G1 X149.659 Y129.551 E.01654
G1 X132.843 Y112.736 E.73404
G1 X132.843 Y112.2 E.01654
G1 X149.659 Y129.015 E.73404
G1 X149.659 Y128.479 E.01654
G1 X126.529 Y105.349 E1.0097
G1 X127.064 Y105.349 E.01654
G1 X149.659 Y127.944 E.98632
G1 X149.659 Y127.408 E.01654
G1 X127.6 Y105.349 E.96293
G1 X128.136 Y105.349 E.01654
G1 X149.659 Y126.872 E.93955
G1 X149.659 Y126.337 E.01654
G1 X128.671 Y105.349 E.91616
G1 X129.207 Y105.349 E.01654
G1 X149.659 Y125.801 E.89278
G1 X149.659 Y125.265 E.01654
G1 X129.743 Y105.349 E.86939
G1 X130.278 Y105.349 E.01654
G1 X149.659 Y124.73 E.84601
G1 X149.659 Y124.194 E.01654
G1 X130.814 Y105.349 E.82262
G1 X131.35 Y105.349 E.01654
G1 X149.659 Y123.658 E.79924
G1 X149.659 Y123.122 E.01654
G1 X131.886 Y105.349 E.77585
G1 X132.421 Y105.349 E.01654
G1 X149.659 Y122.587 E.75247
G1 X149.659 Y122.051 E.01654
G1 X132.957 Y105.349 E.72909
G1 X133.493 Y105.349 E.01654
G1 X149.828 Y121.685 E.71311
M204 S10000
G1 X149.828 Y113.649 F42000
G1 F9503.695
M204 S6000
G1 X146.954 Y110.775 E.12549
G3 X147.04 Y111.397 I-3.002 J.733 E.01942
G1 X149.659 Y114.015 E.11431
G1 X149.659 Y114.551 E.01654
G1 X147.014 Y111.907 E.11543
G3 X146.922 Y112.35 I-2.261 J-.24 E.014
G1 X149.659 Y115.087 E.11947
G1 X149.659 Y115.623 E.01654
G1 X146.778 Y112.742 E.12577
G3 X146.592 Y113.091 I-1.842 J-.755 E.01225
G1 X149.659 Y116.158 E.13388
G1 X149.659 Y116.694 E.01654
G1 X146.371 Y113.406 E.14351
G3 X146.117 Y113.688 I-3.913 J-3.281 E.01171
G1 X149.659 Y117.23 E.15461
G1 X149.659 Y117.765 E.01654
G1 X145.824 Y113.931 E.16738
G3 X145.504 Y114.146 I-1.02 J-1.173 E.01195
G1 X149.659 Y118.301 E.18138
G1 X149.659 Y118.837 E.01654
G1 X145.141 Y114.319 E.19722
G3 X144.737 Y114.451 I-.864 J-1.952 E.01313
G1 X149.659 Y119.372 E.21483
G1 X149.659 Y119.908 E.01654
G1 X144.279 Y114.528 E.23486
G3 X143.747 Y114.532 I-.295 J-3.681 E.01642
G1 X149.659 Y120.444 E.25806
G1 X149.659 Y120.98 E.01654
G1 X143.075 Y114.396 E.28738
G3 X141.101 Y112.422 I.91 J-2.884 E.08957
G1 X134.028 Y105.349 E.30876
G1 X134.564 Y105.349 E.01654
G1 X140.97 Y111.755 E.27963
G3 X140.971 Y111.22 I2.663 J-.261 E.01653
G1 X135.1 Y105.349 E.2563
G1 X135.635 Y105.349 E.01654
G1 X141.051 Y110.765 E.23641
G3 X141.186 Y110.364 I1.672 J.34 E.01309
G1 X136.171 Y105.349 E.21892
G1 X136.707 Y105.349 E.01654
G1 X141.357 Y109.999 E.20298
G3 X141.567 Y109.673 I1.735 J.889 E.01198
G1 X137.242 Y105.349 E.18877
G1 X137.778 Y105.349 E.01654
G1 X141.815 Y109.386 E.17621
G3 X142.096 Y109.131 I1.411 J1.274 E.01173
G1 X138.314 Y105.349 E.16509
G1 X138.849 Y105.349 E.01654
G1 X142.409 Y108.909 E.1554
G3 X142.758 Y108.722 I2.449 J4.148 E.01222
G1 X139.385 Y105.349 E.14723
G1 X139.921 Y105.349 E.01654
G1 X143.152 Y108.58 E.14106
G3 X143.592 Y108.485 I.697 J2.15 E.01392
G1 X140.457 Y105.349 E.13689
G1 X140.992 Y105.349 E.01654
G1 X144.105 Y108.461 E.13586
G3 X144.726 Y108.547 I-.109 J3.088 E.01939
G1 X141.528 Y105.349 E.1396
G1 X142.064 Y105.349 E.01654
G1 X149.659 Y112.944 E.33155
G1 X149.659 Y112.408 E.01654
G1 X142.599 Y105.349 E.30816
G1 X143.135 Y105.349 E.01654
G1 X149.659 Y111.873 E.28478
G1 X149.659 Y111.337 E.01654
G1 X143.671 Y105.349 E.26139
G1 X144.206 Y105.349 E.01654
G1 X149.653 Y110.796 E.23777
G2 X149.6 Y110.207 I-4.018 J.064 E.01826
G1 X144.8 Y105.407 E.20956
G3 X145.47 Y105.541 I-.472 J4.084 E.02113
G1 X149.464 Y109.535 E.17433
G2 X149.164 Y108.699 I-5.117 J1.365 E.02744
G1 X146.302 Y105.838 E.12491
G3 X147.803 Y106.811 I-2.245 J5.105 E.05546
G3 X148.987 Y107.987 I-23.37 J24.717 E.05151
; WIPE_START
G1 X147.803 Y106.811 E-.63404
G1 X147.547 Y106.601 E-.12596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.408 Y109.302 Z2.6 F42000
G1 X115.328 Y118.791 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X106.761 Y110.224 E.37398
G3 X107 Y110.999 I-2.119 J1.078 E.02515
G1 X115.159 Y119.158 E.35614
G1 X115.159 Y119.693 E.01654
G1 X107.041 Y111.576 E.35435
G3 X106.991 Y112.061 I-2.455 J-.009 E.01509
G1 X115.159 Y120.229 E.35654
G1 X115.159 Y120.765 E.01654
G1 X106.878 Y112.484 E.36147
G3 X106.72 Y112.862 I-1.963 J-.602 E.01265
G1 X115.159 Y121.3 E.36838
G1 X115.159 Y121.836 E.01654
G1 X106.524 Y113.202 E.37692
G3 X106.29 Y113.503 I-4.028 J-2.889 E.01179
G1 X115.159 Y122.372 E.38715
G1 X115.159 Y122.907 E.01654
G1 X106.022 Y113.771 E.39883
G3 X105.719 Y114.003 I-1.075 J-1.093 E.01183
G1 X115.328 Y123.613 E.4195
; WIPE_START
G1 X113.914 Y122.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.104 Y128.812 Z2.6 F42000
G1 X99.032 Y148.03 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X100.031 Y149.029 E.0436
G2 X101.7 Y150.163 I4.107 J-4.253 E.06259
G1 X98.84 Y147.302 E.12488
G3 X98.545 Y146.472 I5.55 J-2.437 E.02722
G1 X102.532 Y150.459 E.17405
G2 X103.171 Y150.596 I1.014 J-3.172 E.0202
G1 X103.208 Y150.599 E.00116
G1 X98.408 Y145.798 E.20957
G3 X98.351 Y145.206 I3.955 J-.677 E.01838
G1 X103.795 Y150.65 E.23765
G1 X104.331 Y150.65 E.01654
G1 X98.351 Y144.67 E.26104
G1 X98.351 Y144.135 E.01654
G1 X104.867 Y150.65 E.28443
G1 X105.402 Y150.65 E.01654
G1 X98.351 Y143.599 E.30783
G1 X98.351 Y143.063 E.01654
G1 X106.108 Y150.82 E.33863
M204 S10000
G1 X114.145 Y150.822 F42000
G1 F9503.695
M204 S6000
G1 X106.901 Y143.577 E.31623
G3 X107.032 Y144.245 I-2.06 J.753 E.02108
G1 X113.439 Y150.652 E.27968
G1 X112.904 Y150.652 E.01654
G1 X107.031 Y144.779 E.25635
G3 X106.951 Y145.235 I-3.795 J-.431 E.01429
G1 X112.368 Y150.652 E.23645
G1 X111.832 Y150.652 E.01654
G1 X106.821 Y145.641 E.21873
G3 X106.646 Y146.002 I-3.789 J-1.613 E.01238
G1 X111.296 Y150.652 E.20298
G1 X110.76 Y150.651 E.01654
G1 X106.433 Y146.324 E.18889
G3 X106.187 Y146.614 I-1.57 J-1.085 E.01175
G1 X110.225 Y150.651 E.17625
G1 X109.689 Y150.651 E.01654
G1 X105.909 Y146.871 E.16501
G3 X105.591 Y147.09 I-1.029 J-1.156 E.01192
G1 X109.153 Y150.651 E.15547
G1 X108.617 Y150.651 E.01654
G1 X105.244 Y147.278 E.14724
G3 X104.85 Y147.419 I-.905 J-1.904 E.01295
G1 X108.081 Y150.651 E.14106
G1 X107.546 Y150.651 E.01654
G1 X104.41 Y147.515 E.13688
G3 X103.898 Y147.539 I-.422 J-3.6 E.01584
G1 X107.01 Y150.651 E.13585
G1 X106.474 Y150.651 E.01654
G1 X103.023 Y147.2 E.15064
; WIPE_START
G1 X104.437 Y148.614 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.303 Y145.479 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X98.35 Y142.527 E.12888
G1 X98.35 Y141.991 E.01654
G1 X100.962 Y144.603 E.11402
G3 X100.988 Y144.093 I3.146 J-.097 E.01578
G1 X98.35 Y141.455 E.11514
G1 X98.35 Y140.92 E.01654
G1 X101.08 Y143.65 E.11918
G3 X101.227 Y143.26 I1.63 J.39 E.01287
G1 X98.35 Y140.384 E.12557
G1 X98.35 Y139.848 E.01654
G1 X101.408 Y142.906 E.1335
G3 X101.632 Y142.594 I1.67 J.96 E.01187
G1 X98.35 Y139.312 E.14327
G1 X98.35 Y138.776 E.01654
G1 X101.888 Y142.314 E.15445
G3 X102.176 Y142.067 I1.379 J1.315 E.01175
G1 X98.349 Y138.24 E.16704
G1 X98.349 Y137.705 E.01654
G1 X102.498 Y141.854 E.18112
G3 X102.862 Y141.681 I1.045 J1.73 E.01243
G1 X98.349 Y137.169 E.19698
G1 X98.349 Y136.633 E.01654
G1 X103.265 Y141.549 E.21459
G3 X103.724 Y141.472 I.789 J3.302 E.01437
G1 X98.349 Y136.097 E.23463
G1 X98.349 Y135.561 E.01654
G1 X104.255 Y141.468 E.25783
G3 X104.927 Y141.604 I-.305 J3.233 E.02119
G1 X98.349 Y135.026 E.28716
G1 X98.349 Y134.49 E.01654
G1 X114.511 Y150.652 E.70554
G1 X115.047 Y150.652 E.01654
G1 X98.349 Y133.954 E.72893
G1 X98.348 Y133.418 E.01654
G1 X115.583 Y150.652 E.75233
G1 X116.118 Y150.652 E.01654
G1 X98.348 Y132.882 E.77572
G1 X98.348 Y132.346 E.01654
G1 X116.654 Y150.653 E.79912
G1 X117.19 Y150.653 E.01654
G1 X98.348 Y131.811 E.82251
G1 X98.348 Y131.275 E.01654
G1 X117.726 Y150.653 E.84591
G1 X118.262 Y150.653 E.01654
G1 X98.348 Y130.739 E.8693
G1 X98.348 Y130.203 E.01654
G1 X118.797 Y150.653 E.8927
G1 X119.333 Y150.653 E.01654
G1 X98.348 Y129.667 E.91609
G1 X98.347 Y129.131 E.01654
G1 X119.869 Y150.653 E.93949
G1 X120.405 Y150.653 E.01654
G1 X98.347 Y128.596 E.96288
M73 P64 R11
G1 X98.347 Y128.06 E.01654
G1 X120.941 Y150.653 E.98627
G1 X121.476 Y150.653 E.01654
G1 X98.347 Y127.524 E1.00967
G1 X98.347 Y126.988 E.01654
G1 X122.012 Y150.654 E1.03306
G1 X122.548 Y150.654 E.01654
G1 X98.347 Y126.452 E1.05646
G1 X98.347 Y125.917 E.01654
G1 X123.084 Y150.654 E1.07985
G1 X123.62 Y150.654 E.01654
G1 X98.347 Y125.381 E1.10325
G1 X98.347 Y124.845 E.01654
G1 X124.156 Y150.654 E1.12664
G1 X124.691 Y150.654 E.01654
G1 X98.346 Y124.309 E1.15004
G1 X98.346 Y123.773 E.01654
G1 X125.227 Y150.654 E1.17343
G1 X125.763 Y150.654 E.01654
G1 X98.346 Y123.237 E1.19683
G1 X98.346 Y122.702 E.01654
G1 X126.299 Y150.654 E1.22022
G1 X126.835 Y150.654 E.01654
G1 X98.346 Y122.166 E1.24362
G1 X98.346 Y121.63 E.01654
G1 X127.37 Y150.655 E1.26701
G1 X127.906 Y150.655 E.01654
G1 X98.346 Y121.094 E1.2904
G1 X98.346 Y120.558 E.01654
G1 X120.808 Y143.021 E.98055
G1 X120.843 Y142.625 E.01227
G1 X120.868 Y142.545 E.00257
G1 X98.345 Y120.023 E.98317
G1 X98.345 Y119.487 E.01654
G1 X121.014 Y142.155 E.98955
G3 X121.222 Y141.828 I.914 J.353 E.01205
G1 X98.345 Y118.951 E.99866
G1 X98.345 Y118.415 E.01654
G1 X121.487 Y141.557 E1.0102
G3 X121.802 Y141.337 I.759 J.753 E.01194
G1 X98.345 Y117.879 E1.02399
G1 X98.345 Y117.343 E.01654
G1 X122.182 Y141.181 E1.04058
G1 X122.258 Y141.156 E.00246
G1 X122.644 Y141.106 E.012
G1 X98.345 Y116.808 E1.06072
G1 X98.345 Y116.272 E.01654
G1 X123.275 Y141.202 E1.0883
G3 X124.001 Y141.625 I-.639 J1.933 E.02611
G1 X124.13 Y141.522 E.0051
G1 X98.345 Y115.736 E1.12564
G1 X98.344 Y115.2 E.01654
G1 X124.454 Y141.309 E1.13975
G3 X124.842 Y141.162 I.621 J1.045 E.01287
G1 X98.344 Y114.664 E1.15669
G1 X98.344 Y114.128 E.01654
G1 X125.51 Y141.295 E1.18588
; WIPE_START
G1 X124.096 Y139.88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.493 Y144.706 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X128.442 Y150.655 E.25968
G1 X128.978 Y150.655 E.01654
G1 X123.159 Y144.836 E.25402
G1 X123.481 Y144.728 E.01048
G1 X123.548 Y144.689 E.00238
G1 X129.514 Y150.655 E.26043
G1 X130.049 Y150.655 E.01654
G1 X123.877 Y144.482 E.26946
G2 X123.999 Y144.374 I-.273 J-.43 E.00507
G2 X124.609 Y144.764 I1.272 J-1.313 E.02251
G1 X124.728 Y144.798 E.00382
G1 X130.585 Y150.655 E.25569
G1 X131.121 Y150.655 E.01654
G1 X125.359 Y144.893 E.25152
G1 X125.723 Y144.848 E.01132
G1 X125.817 Y144.816 E.00307
G1 X131.657 Y150.655 E.2549
G1 X132.193 Y150.655 E.01654
G1 X126.197 Y144.66 E.26171
G2 X126.516 Y144.443 I-.377 J-.896 E.01198
G1 X132.728 Y150.656 E.27119
G1 X133.264 Y150.656 E.01654
G1 X126.784 Y144.176 E.28287
G2 X126.993 Y143.848 I-.985 J-.858 E.01202
G1 X133.8 Y150.656 E.29716
G1 X134.336 Y150.656 E.01654
G1 X127.14 Y143.46 E.31414
G1 X127.194 Y142.978 E.01495
G1 X134.872 Y150.656 E.33515
G1 X135.407 Y150.656 E.01654
G1 X98.344 Y113.593 E1.61793
G1 X98.344 Y113.057 E.01654
G1 X135.943 Y150.656 E1.64132
G1 X136.479 Y150.656 E.01654
G1 X98.344 Y112.521 E1.66472
G1 X98.344 Y111.985 E.01654
G1 X137.015 Y150.656 E1.68811
G1 X137.551 Y150.656 E.01654
G1 X98.344 Y111.449 E1.71151
G3 X98.348 Y110.919 I5.443 J-.215 E.01639
G1 X138.256 Y150.826 E1.74209
M204 S10000
G1 X145.949 Y150.484 F42000
G1 F9503.695
M204 S6000
G1 X142.725 Y147.26 E.14074
G2 X143.503 Y147.502 I1.155 J-2.341 E.02524
G1 X146.208 Y150.207 E.11809
G1 X146.571 Y150.034 E.01241
G1 X144.08 Y147.543 E.10876
G2 X144.561 Y147.488 I-.031 J-2.432 E.01497
G1 X146.919 Y149.846 E.10293
G1 X147.239 Y149.631 E.01192
G1 X144.987 Y147.379 E.09831
G2 X145.363 Y147.219 I-.613 J-1.952 E.01262
G1 X147.545 Y149.401 E.09527
G2 X147.836 Y149.156 I-1.092 J-1.595 E.01176
G1 X145.697 Y147.018 E.09337
G2 X146.003 Y146.788 I-.761 J-1.334 E.01184
G1 X148.103 Y148.888 E.09166
G2 X148.358 Y148.607 I-1.769 J-1.863 E.01172
G1 X146.273 Y146.522 E.09103
G2 X146.51 Y146.223 I-1.375 J-1.336 E.01179
G1 X148.587 Y148.301 E.09068
G2 X148.806 Y147.983 I-2.034 J-1.635 E.0119
G1 X146.708 Y145.886 E.09157
G2 X146.869 Y145.51 I-1.793 J-.989 E.01262
G1 X148.997 Y147.639 E.09291
G2 X149.176 Y147.282 I-2.319 J-1.385 E.01233
G1 X146.986 Y145.092 E.09557
G2 X147.04 Y144.61 I-2.386 J-.508 E.01501
G1 X149.321 Y146.891 E.09959
G1 X149.456 Y146.491 E.01305
G1 X147.007 Y144.041 E.10693
G2 X146.795 Y143.293 I-2.483 J.3 E.02409
G1 X149.591 Y146.09 E.12208
G1 X149.726 Y145.689 E.01305
G1 X128.079 Y124.042 E.94496
G1 X127.543 Y124.042 E.01654
G1 X145.212 Y141.711 E.77129
G2 X144.459 Y141.493 I-1.029 J2.149 E.02432
G1 X127.008 Y124.042 E.76178
G1 X126.472 Y124.042 E.01654
G1 X143.889 Y141.46 E.76031
G2 X143.411 Y141.517 I.047 J2.42 E.0149
G1 X125.936 Y124.042 E.76282
G1 X125.401 Y124.042 E.01654
G1 X142.989 Y141.631 E.7678
G2 X142.616 Y141.794 I.626 J1.948 E.01259
G1 X124.865 Y124.042 E.77489
G1 X124.329 Y124.042 E.01654
G1 X142.279 Y141.993 E.78359
G2 X141.978 Y142.227 I2.934 J4.097 E.01179
G1 X123.793 Y124.042 E.7938
G1 X123.258 Y124.042 E.01654
G1 X141.713 Y142.497 E.80562
G2 X141.48 Y142.8 I1.397 J1.313 E.01181
G1 X122.722 Y124.042 E.81885
G1 X122.186 Y124.042 E.01654
G1 X141.281 Y143.137 E.83355
G2 X141.126 Y143.517 I1.434 J.809 E.01271
G1 X121.651 Y124.042 E.85015
G1 X121.115 Y124.042 E.01654
G1 X141.011 Y143.939 E.86853
G2 X140.961 Y144.424 I2.402 J.494 E.01509
G1 X120.579 Y124.042 E.88972
G1 X120.044 Y124.042 E.01654
G1 X141.002 Y145.001 E.9149
G2 X141.241 Y145.775 I2.357 J-.303 E.02514
G1 X119.508 Y124.042 E.94871
G1 X118.972 Y124.042 E.01654
G1 X145.408 Y150.479 E1.15403
G3 X144.963 Y150.569 I-.835 J-2.961 E.01403
G1 X118.436 Y124.042 E1.15799
G1 X117.901 Y124.042 E.01654
G1 X144.491 Y150.633 E1.16075
G1 X143.98 Y150.658 E.01579
G1 X117.365 Y124.042 E1.16184
G1 X116.829 Y124.042 E.01654
G1 X143.444 Y150.658 E1.16183
G1 X142.909 Y150.657 E.01654
G1 X116.294 Y124.042 E1.16183
G1 X115.758 Y124.042 E.01654
G1 X142.373 Y150.657 E1.16182
G1 X141.837 Y150.657 E.01654
G1 X105.386 Y114.206 E1.59119
G3 X105.013 Y114.369 I-.997 J-1.779 E.01259
G1 X141.301 Y150.657 E1.58409
G1 X140.765 Y150.657 E.01654
G1 X104.591 Y114.483 E1.5791
G3 X104.113 Y114.54 I-.526 J-2.361 E.0149
G1 X140.23 Y150.657 E1.5766
G1 X139.694 Y150.657 E.01654
G1 X103.544 Y114.507 E1.57806
G3 X102.791 Y114.289 I.275 J-2.367 E.02431
G1 X139.158 Y150.657 E1.58755
G1 X138.622 Y150.657 E.01654
G1 X98.377 Y110.411 E1.75685
G1 X98.446 Y109.944 E.01456
G1 X101.207 Y112.706 E.12056
G3 X100.996 Y111.959 I2.272 J-1.048 E.02408
G1 X98.549 Y109.512 E.10679
G3 X98.678 Y109.105 I2.128 J.451 E.01319
G1 X100.963 Y111.39 E.09972
G3 X101.016 Y110.907 I2.439 J.025 E.01501
G1 X98.829 Y108.721 E.09546
G1 X99.001 Y108.357 E.01242
G1 X101.136 Y110.492 E.09319
G3 X101.294 Y110.114 I1.58 J.439 E.01267
G1 X99.2 Y108.02 E.09141
G3 X99.415 Y107.699 I1.735 J.929 E.01194
G1 X101.495 Y109.779 E.0908
G3 X101.729 Y109.478 I1.623 J1.021 E.0118
G1 X99.645 Y107.393 E.091
G1 X99.899 Y107.112 E.01171
G1 X101.997 Y109.21 E.09156
G3 X102.301 Y108.979 I1.309 J1.409 E.01182
G1 X100.17 Y106.847 E.09305
M73 P65 R11
G3 X100.454 Y106.596 I1.417 J1.32 E.01173
G1 X102.64 Y108.781 E.0954
G3 X103.015 Y108.621 I.989 J1.793 E.01262
G1 X100.762 Y106.368 E.09835
G3 X101.088 Y106.159 I1.225 J1.551 E.01199
G1 X103.441 Y108.512 E.10271
G3 X103.923 Y108.457 I.513 J2.379 E.01498
G1 X101.431 Y105.965 E.10877
G1 X101.794 Y105.793 E.01241
G1 X104.5 Y108.498 E.11811
G3 X105.277 Y108.74 I-.377 J2.582 E.02524
G1 X102.184 Y105.647 E.13504
G1 X102.595 Y105.522 E.01326
G1 X115.159 Y118.086 E.54845
G1 X115.159 Y117.55 E.01654
G1 X103.039 Y105.431 E.52907
G3 X103.514 Y105.371 I.543 J2.384 E.01482
G1 X115.159 Y117.015 E.50831
G1 X115.159 Y116.479 E.01654
G1 X104.03 Y105.35 E.48582
G1 X104.565 Y105.35 E.01654
G1 X115.159 Y115.943 E.46244
G1 X115.159 Y115.408 E.01654
G1 X105.101 Y105.35 E.43905
G1 X105.637 Y105.35 E.01654
G1 X115.159 Y114.872 E.41567
G1 X115.159 Y114.336 E.01654
G1 X106.172 Y105.35 E.39228
G1 X106.708 Y105.35 E.01654
G1 X115.159 Y113.8 E.3689
G1 X115.159 Y113.265 E.01654
G1 X107.244 Y105.35 E.34551
G1 X107.779 Y105.35 E.01654
G1 X115.159 Y112.729 E.32213
G1 X115.159 Y112.193 E.01654
G1 X108.315 Y105.35 E.29874
G1 X108.851 Y105.35 E.01654
G1 X115.159 Y111.658 E.27536
G1 X115.159 Y111.358 E.00926
G1 X115.394 Y111.358 E.00727
G1 X109.386 Y105.35 E.26226
G1 X109.922 Y105.35 E.01654
G1 X115.93 Y111.358 E.26226
G1 X116.466 Y111.358 E.01654
G1 X110.458 Y105.35 E.26226
G1 X110.994 Y105.35 E.01654
G1 X117.001 Y111.358 E.26226
G1 X117.537 Y111.358 E.01654
G1 X111.529 Y105.35 E.26226
G1 X112.065 Y105.35 E.01654
G1 X118.073 Y111.358 E.26226
G1 X118.609 Y111.358 E.01654
G1 X112.601 Y105.35 E.26226
G1 X113.136 Y105.35 E.01654
G1 X119.144 Y111.358 E.26226
G1 X119.68 Y111.358 E.01654
G1 X113.672 Y105.35 E.26227
G1 X114.208 Y105.35 E.01654
G1 X120.216 Y111.358 E.26227
G1 X120.751 Y111.358 E.01654
G1 X114.743 Y105.35 E.26227
G1 X115.279 Y105.35 E.01654
G1 X121.287 Y111.358 E.26227
G1 X121.823 Y111.358 E.01654
G1 X115.815 Y105.35 E.26227
G1 X116.35 Y105.35 E.01654
G1 X122.358 Y111.358 E.26227
G1 X122.894 Y111.358 E.01654
G1 X116.886 Y105.35 E.26227
G1 X117.422 Y105.35 E.01654
G1 X123.43 Y111.358 E.26227
G1 X123.966 Y111.358 E.01654
G1 X117.958 Y105.35 E.26227
G1 X118.493 Y105.35 E.01654
G1 X124.501 Y111.358 E.26227
G1 X125.037 Y111.358 E.01654
G1 X119.029 Y105.35 E.26227
G1 X119.565 Y105.35 E.01654
G1 X125.573 Y111.358 E.26227
G1 X126.108 Y111.358 E.01654
G1 X120.1 Y105.349 E.26227
G1 X120.636 Y105.349 E.01654
G1 X126.644 Y111.358 E.26227
G1 X127.18 Y111.358 E.01654
G1 X121.172 Y105.349 E.26227
G1 X121.707 Y105.349 E.01654
G1 X127.716 Y111.358 E.26227
G1 X128.251 Y111.358 E.01654
G1 X122.243 Y105.349 E.26227
G1 X122.779 Y105.349 E.01654
G1 X128.787 Y111.358 E.26227
G1 X129.323 Y111.358 E.01654
G1 X123.314 Y105.349 E.26228
G1 X123.85 Y105.349 E.01654
G1 X129.858 Y111.358 E.26228
G1 X130.394 Y111.358 E.01654
G1 X124.386 Y105.349 E.26228
G1 X124.922 Y105.349 E.01654
G1 X130.93 Y111.358 E.26228
G1 X131.465 Y111.358 E.01654
G1 X125.457 Y105.349 E.26228
G1 X125.993 Y105.349 E.01654
G1 X132.171 Y111.527 E.26969
; WIPE_START
G1 X130.757 Y110.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.492 Y117.64 Z2.6 F42000
G1 X128.445 Y123.873 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9503.695
M204 S6000
G1 X150.229 Y145.657 E.95094
G1 X150.763 Y145.655 E.01648
G1 X129.151 Y124.042 E.94346
G1 X129.686 Y124.042 E.01654
G1 X151.297 Y145.653 E.94338
G1 X151.831 Y145.651 E.01648
G1 X130.222 Y124.042 E.9433
G1 X130.758 Y124.042 E.01654
G1 X152.513 Y145.797 E.94967
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9503.695
G1 X151.098 Y144.383 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/53
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I.074 J-1.215 P1  F42000
G1 X126.854 Y142.904 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X126.846 Y143.155 E.00835
G3 X124.001 Y143.865 I-1.55 J-.157 E.12668
G3 X123.997 Y142.13 I-1.299 J-.864 E.2641
G3 X125.107 Y141.452 I1.367 J.99 E.0443
G3 X126.846 Y142.844 I.189 J1.547 E.08234
M204 S10000
G1 X126.448 Y142.904 F42000
G1 F5400
M204 S6000
G1 X126.448 Y143.115 E.00701
G3 X125.158 Y141.856 I-1.146 J-.116 E.17148
G1 X125.272 Y141.848 E.00381
G3 X126.443 Y142.844 I.029 J1.152 E.05582
M204 S250
G1 X126.055 Y142.939 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.061 Y143 E.00187
G3 X125.207 Y142.246 I-.76 J0 E.10709
G1 X125.282 Y142.24 E.00233
G3 X126.046 Y142.849 I.019 J.76 E.03261
G1 X126.049 Y142.88 E.00094
; WIPE_START
M204 S6000
G1 X126.061 Y143 E-.04591
G1 X126.046 Y143.151 E-.05757
G1 X126.002 Y143.295 E-.0575
G1 X125.929 Y143.428 E-.05755
G1 X125.832 Y143.544 E-.05748
G1 X125.714 Y143.639 E-.05754
G1 X125.583 Y143.706 E-.05589
G1 X125.32 Y143.76 E-.10197
G1 X125.095 Y143.732 E-.0861
G1 X124.954 Y143.676 E-.0576
G1 X124.827 Y143.594 E-.05745
G1 X124.719 Y143.489 E-.05756
G1 X124.704 Y143.467 E-.00989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.312 Y141.917 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.334 Y141.907 E.00081
G3 X122.558 Y141.856 I.367 J1.09 E.00763
G1 X122.672 Y141.848 E.00381
G3 X122.125 Y142.002 I.029 J1.149 E.22058
G1 X122.257 Y141.942 E.00481
M204 S250
G1 X122.44 Y142.292 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.607 Y142.246 E.00531
G1 X122.682 Y142.24 E.00233
G3 X122.383 Y142.31 I.019 J.758 E.1369
; WIPE_START
M204 S6000
G1 X122.607 Y142.246 E-.08842
G1 X122.682 Y142.24 E-.02881
G1 X122.833 Y142.251 E-.0575
G1 X122.979 Y142.292 E-.05761
G1 X123.114 Y142.361 E-.05748
G1 X123.232 Y142.456 E-.05754
G1 X123.329 Y142.572 E-.05747
G1 X123.402 Y142.705 E-.05755
G1 X123.446 Y142.849 E-.0575
G1 X123.461 Y143 E-.05757
G1 X123.446 Y143.151 E-.05758
G1 X123.402 Y143.295 E-.0575
G1 X123.329 Y143.428 E-.05755
G1 X123.312 Y143.448 E-.00992
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.934 Y143.851 Z2.8 F42000
G1 X146.702 Y144.683 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X146.696 Y144.77 E.00289
G3 X143.664 Y141.811 I-2.695 J-.271 E.4032
G1 X143.934 Y141.79 E.00897
G3 X146.71 Y144.5 I.067 J2.708 E.14343
G1 X146.705 Y144.623 E.00407
M204 S10000
G1 X146.292 Y144.635 F42000
G1 F5400
M204 S6000
G1 X146.291 Y144.729 E.00312
G3 X143.715 Y142.215 I-2.29 J-.231 E.34256
G1 X143.944 Y142.198 E.00762
G3 X146.291 Y144.271 I.057 J2.301 E.11426
G1 X146.292 Y144.575 E.01009
M204 S250
G1 X145.896 Y144.65 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.872 Y144.878 E.00706
G3 X143.763 Y142.605 I-1.871 J-.38 E.25737
G1 X143.953 Y142.59 E.00586
G3 X145.91 Y144.5 I.048 J1.908 E.09364
G1 X145.902 Y144.59 E.00278
; WIPE_START
M204 S6000
G1 X145.872 Y144.878 E-.11014
G1 X145.761 Y145.242 E-.14445
G1 X145.579 Y145.576 E-.14452
G1 X145.335 Y145.867 E-.14456
G1 X145.037 Y146.105 E-.14459
G1 X144.869 Y146.191 E-.07173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.366 Y139.406 Z2.8 F42000
G1 X148.955 Y138.262 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X149.102 Y138.023 E.00929
G3 X151.914 Y136.492 I2.9 J1.976 E.11031
G1 X152.089 Y136.492 E.0058
G3 X148.919 Y138.322 I-.087 J3.508 E.60363
G1 X148.924 Y138.313 E.00033
M204 S10000
G1 X149.302 Y138.474 F42000
G1 F5400
M204 S6000
G1 X149.438 Y138.253 E.00862
G3 X151.924 Y136.899 I2.563 J1.747 E.0975
G1 X152.078 Y136.899 E.00513
G3 X149.272 Y138.526 I-.077 J3.101 E.53324
M204 S250
G1 X149.637 Y138.678 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X149.762 Y138.474 E.00738
G3 X151.934 Y137.291 I2.239 J1.526 E.0789
G1 X152.069 Y137.291 E.00415
G3 X149.607 Y138.73 I-.068 J2.709 E.43086
; WIPE_START
M204 S6000
G1 X149.762 Y138.474 E-.11403
G1 X149.925 Y138.258 E-.1027
G1 X150.109 Y138.06 E-.10265
G1 X150.419 Y137.8 E-.15393
G1 X150.646 Y137.653 E-.10269
G1 X150.887 Y137.53 E-.10265
G1 X151.086 Y137.452 E-.08135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.506 Y129.984 Z2.8 F42000
G1 X145.07 Y109.013 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X145.238 Y109.088 E.00608
G3 X143.664 Y108.811 I-1.236 J2.41 E.51076
G1 X143.934 Y108.79 E.00897
G3 X144.991 Y108.977 I.067 J2.708 E.03587
G1 X145.016 Y108.988 E.00089
M204 S10000
G1 X144.874 Y109.381 F42000
G1 F5400
M204 S6000
G1 X145.052 Y109.451 E.00632
G3 X143.715 Y109.215 I-1.051 J2.048 E.43395
G1 X143.944 Y109.198 E.00762
G3 X144.625 Y109.283 I.057 J2.301 E.02286
G1 X144.819 Y109.359 E.0069
M204 S250
G1 X144.748 Y109.747 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X145.037 Y109.895 E.01
G3 X143.763 Y109.605 I-1.036 J1.603 E.3276
G1 X143.953 Y109.59 E.00586
G3 X144.694 Y109.72 I.048 J1.908 E.02326
; WIPE_START
M204 S6000
G1 X145.037 Y109.895 E-.1464
G1 X145.335 Y110.133 E-.14459
G1 X145.579 Y110.424 E-.14456
G1 X145.761 Y110.758 E-.14451
G1 X145.873 Y111.121 E-.14453
G1 X145.883 Y111.214 E-.03542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.251 Y111.337 Z2.8 F42000
G1 X116.291 Y111.691 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.51 Y111.691 E.53802
G1 X132.51 Y123.709 E.39867
G1 X115.492 Y123.709 E.56453
G1 X115.492 Y111.691 E.39867
G1 X116.231 Y111.691 E.02452
M204 S10000
G1 X116.291 Y112.098 F42000
G1 F5400
M204 S6000
G1 X132.103 Y112.098 E.52452
G1 X132.103 Y123.302 E.37166
G1 X115.899 Y123.302 E.53752
G1 X115.899 Y112.098 E.37166
G1 X116.231 Y112.098 E.01102
M204 S250
G1 X116.291 Y112.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.772 Y111.233 Z2.8 F42000
G1 X101.98 Y109.703 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X102.208 Y109.468 E.01085
G3 X103.664 Y108.811 I1.793 J2.03 E.05379
G1 X103.934 Y108.79 E.00897
G3 X101.917 Y109.768 I.067 J2.708 E.48793
G1 X101.938 Y109.746 E.00101
M204 S10000
M73 P65 R10
G1 X102.272 Y109.985 F42000
G1 F5400
M204 S6000
G1 X102.478 Y109.774 E.00977
G3 X103.715 Y109.215 I1.523 J1.725 E.0457
G1 X103.944 Y109.198 E.00762
G3 X102.231 Y110.028 I.057 J2.301 E.41457
M204 S250
G1 X102.553 Y110.257 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X102.737 Y110.068 E.00811
G3 X103.763 Y109.605 I1.264 J1.431 E.03512
G1 X103.953 Y109.59 E.00586
G3 X102.514 Y110.302 I.048 J1.908 E.31764
; WIPE_START
M204 S6000
G1 X102.737 Y110.068 E-.12298
G1 X103.046 Y109.846 E-.14453
G1 X103.393 Y109.689 E-.14456
G1 X103.763 Y109.605 E-.14449
G1 X103.953 Y109.59 E-.07242
G1 X104.297 Y109.616 E-.13102
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.597 Y117.243 Z2.8 F42000
G1 X105.582 Y142.302 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X105.691 Y142.381 E.00447
G3 X103.664 Y141.811 I-1.69 J2.117 E.49283
G1 X103.934 Y141.79 E.00897
G3 X105.472 Y142.224 I.067 J2.708 E.0538
G1 X105.533 Y142.267 E.0025
M204 S10000
G1 X105.318 Y142.623 F42000
G1 F5400
M204 S6000
G1 X105.437 Y142.7 E.0047
G3 X103.715 Y142.215 I-1.436 J1.799 E.41872
G1 X103.944 Y142.198 E.00762
G3 X105.052 Y142.451 I.057 J2.301 E.03809
G1 X105.267 Y142.59 E.00852
M204 S250
G1 X105.118 Y142.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X105.335 Y143.133 E.00852
G3 X103.763 Y142.605 I-1.334 J1.366 E.31588
G1 X103.953 Y142.59 E.00586
G3 X105.037 Y142.895 I.048 J1.908 E.03512
G1 X105.071 Y142.922 E.00133
; WIPE_START
M204 S6000
G1 X105.335 Y143.133 E-.12814
G1 X105.579 Y143.424 E-.14454
G1 X105.761 Y143.758 E-.14452
G1 X105.873 Y144.121 E-.14454
G1 X105.911 Y144.5 E-.14457
G1 X105.897 Y144.641 E-.05368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.317 Y142.852 Z2.8 F42000
G1 X149.992 Y134.009 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X152.3 Y134.017 I.998 J46.326 E.07656
G3 X151.988 Y145.991 I-.307 J5.983 E.61432
G1 X149.976 Y145.991 E.06674
G3 X149.546 Y147.268 I-13.175 J-3.731 E.04473
G3 X143.989 Y150.991 I-5.569 J-2.304 E.23522
G1 X104.014 Y150.991 E1.32603
G3 X98.01 Y144.987 I.005 J-6.009 E.31275
G1 X98.01 Y111.013 E1.12699
G3 X104.014 Y105.009 I6.009 J.005 E.31275
G1 X144.258 Y105.016 E1.33497
G3 X149.992 Y111.013 I-.26 J5.989 E.30398
G1 X149.992 Y133.949 E.76084
M204 S10000
G1 X150.399 Y133.602 F42000
G1 F5400
M204 S6000
G3 X152.32 Y133.61 I.797 J38.524 E.06373
M73 P66 R10
G3 X151.994 Y146.398 I-.327 J6.39 E.65588
G1 X150.272 Y146.398 E.05711
G3 X149.153 Y148.793 I-7.436 J-2.015 E.08813
G3 X143.994 Y151.398 I-5.161 J-3.81 E.19889
G1 X104.009 Y151.398 E1.32636
G3 X97.603 Y144.992 I.011 J-6.417 E.33362
G1 X97.603 Y111.008 E1.12732
G3 X104.009 Y104.602 I6.417 J.011 E.33362
G1 X144.277 Y104.609 E1.33577
G3 X150.399 Y111.008 I-.28 J6.396 E.3244
G1 X150.399 Y133.542 E.7475
M204 S250
G1 X150.791 Y133.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.143 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.585 J-1.836 E.27203
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.295 Y104.217 E1.23804
G3 X150.791 Y111.003 I-.298 J6.787 E.3187
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25811
G1 X152.788 Y133.26 E-.04238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
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


G1 X152.92 Y134.253 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42085
G1 F9525.574
M204 S6000
G1 X150.831 Y136.342 E.09097
G3 X151.52 Y136.187 I1.116 J3.361 E.02178
G1 X153.228 Y134.479 E.07439
G3 X153.647 Y134.595 I-.567 J2.862 E.01339
G1 X152.079 Y136.162 E.06826
G3 X152.573 Y136.203 I.043 J2.487 E.01528
G1 X154.048 Y134.729 E.06422
G3 X154.418 Y134.893 I-.962 J2.677 E.01249
G1 X153.016 Y136.295 E.06106
G3 X153.417 Y136.428 I-3.376 J10.824 E.01302
G1 X154.774 Y135.071 E.05911
G3 X155.103 Y135.277 I-1.212 J2.299 E.01195
G1 X153.783 Y136.597 E.05749
G3 X154.119 Y136.795 I-.827 J1.781 E.01204
G1 X155.421 Y135.494 E.05669
G3 X155.713 Y135.736 I-1.553 J2.173 E.0117
G1 X154.427 Y137.022 E.056
G3 X154.708 Y137.275 I-1.122 J1.531 E.01167
G1 X155.99 Y135.993 E.0558
G3 X156.246 Y136.272 I-1.288 J1.443 E.01167
G1 X154.964 Y137.554 E.05585
G3 X155.192 Y137.86 I-1.413 J1.292 E.01178
G1 X156.489 Y136.563 E.05649
G1 X156.712 Y136.874 E.01179
G1 X155.392 Y138.195 E.05751
G3 X155.561 Y138.559 I-1.736 J1.029 E.01241
G1 X156.913 Y137.208 E.05886
G3 X157.1 Y137.556 I-2.074 J1.339 E.01217
G1 X155.697 Y138.959 E.06111
G3 X155.789 Y139.401 I-1.719 J.589 E.01395
G1 X157.259 Y137.931 E.06403
G3 X157.399 Y138.325 I-1.936 J.91 E.01291
G1 X155.839 Y139.885 E.06793
G3 X155.814 Y140.445 I-2.812 J.153 E.01729
G1 X157.516 Y138.742 E.07414
G1 X157.596 Y139.197 E.01421
G1 X155.391 Y141.402 E.09604
M204 S10000
G1 X155.015 Y144.985 F42000
G1 F9525.574
M204 S6000
G1 X156.056 Y143.944 E.04536
G2 X157.169 Y142.296 I-4.083 J-3.958 E.06154
G1 X154.297 Y145.168 E.12508
G3 X153.477 Y145.454 I-2.75 J-6.569 E.02677
G1 X157.455 Y141.476 E.17326
G2 X157.597 Y140.8 I-3.307 J-1.048 E.02133
G1 X152.804 Y145.593 E.20875
G3 X152.212 Y145.65 I-.688 J-4.002 E.01833
G1 X157.651 Y140.211 E.23688
G2 X157.645 Y139.683 I-2.64 J-.234 E.0163
G1 X151.676 Y145.652 E.25996
G1 X151.14 Y145.654 E.01652
G1 X153.121 Y143.672 E.0863
G3 X152.443 Y143.816 I-1.302 J-4.469 E.02137
G1 X150.603 Y145.656 E.08012
G1 X150.067 Y145.657 E.01652
G1 X151.888 Y143.837 E.07929
G3 X151.397 Y143.793 I-.025 J-2.473 E.01519
G1 X144.561 Y150.629 E.29775
G1 X143.999 Y150.657 E.01733
G1 X150.957 Y143.698 E.30305
G3 X150.56 Y143.561 I.487 J-2.045 E.01296
G1 X143.463 Y150.658 E.30908
G1 X142.929 Y150.657 E.01646
G1 X150.196 Y143.39 E.31651
G3 X149.862 Y143.19 I.835 J-1.769 E.01202
G1 X142.395 Y150.657 E.32524
G1 X141.86 Y150.657 E.01646
G1 X145.25 Y147.268 E.14761
G3 X144.48 Y147.503 I-1.218 J-2.616 E.02485
G1 X141.326 Y150.657 E.13739
G1 X140.792 Y150.657 E.01646
G1 X143.91 Y147.539 E.1358
G3 X143.427 Y147.487 I.122 J-3.433 E.01497
G1 X140.257 Y150.657 E.13804
G1 X139.723 Y150.657 E.01646
G1 X143.006 Y147.373 E.14301
G3 X142.629 Y147.216 I.593 J-1.961 E.01261
G1 X139.188 Y150.657 E.14984
G1 X138.654 Y150.657 E.01646
G1 X142.294 Y147.017 E.15852
G3 X141.993 Y146.783 I1.018 J-1.617 E.01175
G1 X138.12 Y150.657 E.1687
G1 X137.585 Y150.656 E.01646
G1 X141.725 Y146.517 E.18029
G3 X141.489 Y146.218 I1.372 J-1.329 E.01174
G1 X137.051 Y150.656 E.19328
G1 X136.517 Y150.656 E.01646
G1 X141.292 Y145.881 E.20797
G3 X141.132 Y145.506 I1.791 J-.985 E.01257
G1 X135.982 Y150.656 E.22429
G1 X135.448 Y150.656 E.01646
G1 X141.015 Y145.089 E.24247
G3 X140.962 Y144.607 I2.385 J-.505 E.01495
G1 X134.913 Y150.656 E.26345
G1 X134.379 Y150.656 E.01646
G1 X140.996 Y144.039 E.28818
G3 X141.208 Y143.292 I2.476 J.3 E.02401
G1 X133.845 Y150.656 E.3207
G1 X133.31 Y150.656 E.01646
G1 X149.659 Y134.307 E.71202
G1 X149.659 Y134.342 E.00108
G1 X150.158 Y134.342 E.01538
G1 X142.792 Y141.708 E.32081
G3 X143.541 Y141.494 I1.25 J2.948 E.02405
G1 X150.693 Y134.342 E.31147
G1 X151.227 Y134.342 E.01646
G1 X144.108 Y141.461 E.31005
G3 X144.588 Y141.516 I-.132 J3.33 E.0149
G1 X151.761 Y134.342 E.31241
G3 X152.281 Y134.357 I.109 J5.269 E.01602
G1 X145.007 Y141.631 E.31679
G3 X145.384 Y141.789 I-.599 J1.959 E.0126
G1 X148.346 Y138.827 E.129
G2 X148.192 Y139.515 I3.893 J1.233 E.02176
G1 X145.718 Y141.99 E.10777
G3 X146.017 Y142.224 I-1.023 J1.614 E.01174
G1 X148.163 Y140.079 E.09344
G2 X148.201 Y140.575 I6.571 J-.261 E.01532
G1 X146.285 Y142.491 E.08347
G3 X146.52 Y142.791 I-4.062 J3.428 E.01173
G1 X148.298 Y141.013 E.07745
G1 X148.432 Y141.413 E.013
G1 X146.716 Y143.13 E.07477
G3 X146.874 Y143.505 I-1.796 J.981 E.01258
G1 X148.599 Y141.781 E.07509
G2 X148.797 Y142.117 I1.78 J-.822 E.01204
G1 X146.989 Y143.925 E.07873
G3 X147.041 Y144.408 I-2.389 J.499 E.01498
G1 X149.023 Y142.425 E.08634
G2 X149.276 Y142.707 I1.529 J-1.123 E.01167
G1 X147.003 Y144.98 E.099
G3 X146.779 Y145.738 I-2.411 J-.3 E.02447
G1 X149.676 Y142.841 E.12617
M204 S10000
G1 X149.839 Y145.885 F42000
G1 F9525.574
M204 S6000
G1 X145.203 Y150.522 E.20194
G2 X145.958 Y150.3 I-.78 J-4.065 E.02429
G1 X149.297 Y146.961 E.14542
G3 X148.799 Y147.995 I-4.379 J-1.477 E.03542
G1 X146.571 Y150.222 E.09701
; WIPE_START
G1 X147.985 Y148.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.921 Y143.097 Z2.8 F42000
G1 X115.328 Y111.983 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X98.347 Y128.964 E.73957
G1 X98.348 Y129.499 E.01646
G1 X115.159 Y112.688 E.73217
G1 X115.159 Y113.222 E.01646
G1 X98.348 Y130.033 E.73217
G1 X98.348 Y130.567 E.01646
G1 X115.159 Y113.756 E.73216
G1 X115.159 Y114.291 E.01646
G1 X98.348 Y131.102 E.73216
G1 X98.348 Y131.636 E.01646
G1 X115.159 Y114.825 E.73215
G1 X115.159 Y115.36 E.01646
G1 X98.348 Y132.17 E.73215
G1 X98.348 Y132.705 E.01646
G1 X115.159 Y115.894 E.73214
G1 X115.159 Y116.429 E.01646
G1 X98.348 Y133.239 E.73214
G1 X98.348 Y133.774 E.01646
G1 X115.159 Y116.963 E.73213
G1 X115.159 Y117.498 E.01646
G1 X98.349 Y134.308 E.73213
G1 X98.349 Y134.842 E.01646
G1 X115.159 Y118.032 E.73212
G1 X115.159 Y118.567 E.01646
G1 X98.349 Y135.377 E.73212
G1 X98.349 Y135.911 E.01646
G1 X115.159 Y119.101 E.73211
G1 X115.159 Y119.636 E.01646
G1 X98.349 Y136.445 E.73211
G1 X98.349 Y136.98 E.01646
G1 X115.159 Y120.17 E.7321
G1 X115.159 Y120.705 E.01646
G1 X98.349 Y137.514 E.7321
G1 X98.349 Y138.048 E.01646
G1 X115.159 Y121.239 E.73209
G1 X115.159 Y121.774 E.01646
G1 X98.35 Y138.583 E.73209
G1 X98.35 Y139.117 E.01646
G1 X115.159 Y122.308 E.73208
G1 X115.159 Y122.843 E.01646
G1 X98.35 Y139.651 E.73208
G1 X98.35 Y140.186 E.01646
G1 X115.159 Y123.377 E.73207
G1 X115.159 Y123.911 E.01646
G1 X98.35 Y140.72 E.73207
G1 X98.35 Y141.255 E.01646
G1 X115.562 Y124.042 E.74964
G1 X116.097 Y124.042 E.01646
G1 X98.35 Y141.789 E.77291
G1 X98.35 Y142.323 E.01646
G1 X116.631 Y124.042 E.79618
G1 X117.166 Y124.042 E.01646
G1 X98.35 Y142.858 E.81945
G1 X98.351 Y143.392 E.01646
G1 X117.7 Y124.042 E.84273
G1 X118.235 Y124.042 E.01646
G1 X98.351 Y143.926 E.866
G1 X98.351 Y144.461 E.01646
G1 X118.769 Y124.042 E.88927
G1 X119.304 Y124.042 E.01646
G1 X98.351 Y144.995 E.91255
G2 X98.374 Y145.507 I2.616 J.141 E.0158
G1 X119.838 Y124.042 E.93484
G1 X120.373 Y124.042 E.01646
G1 X98.291 Y146.124 E.96172
M204 S10000
G1 X101.973 Y150.459 F42000
G1 F9525.574
M204 S6000
G1 X105.103 Y147.329 E.13632
G3 X104.377 Y147.521 I-.913 J-1.989 E.02323
G1 X101.725 Y150.173 E.11551
G3 X101.365 Y149.998 I.709 J-1.914 E.01233
M73 P67 R10
G1 X103.826 Y147.537 E.10718
G3 X103.357 Y147.471 I.236 J-3.408 E.0146
G1 X101.023 Y149.805 E.10165
G1 X100.703 Y149.591 E.01187
G1 X102.942 Y147.352 E.09755
G3 X102.573 Y147.186 I1.47 J-3.778 E.01246
G1 X100.403 Y149.356 E.09452
G3 X100.116 Y149.11 I1.53 J-2.073 E.01168
G1 X102.244 Y146.981 E.0927
G3 X101.948 Y146.743 I1.041 J-1.597 E.01173
G1 X99.853 Y148.837 E.09122
G3 X99.602 Y148.554 I1.314 J-1.417 E.01168
G1 X101.684 Y146.472 E.09065
G3 X101.456 Y146.166 I3.729 J-3.008 E.01177
G1 X99.375 Y148.247 E.09064
G3 X99.165 Y147.922 I1.545 J-1.227 E.01193
G1 X101.264 Y145.823 E.0914
G3 X101.109 Y145.444 I1.82 J-.963 E.01265
G1 X98.972 Y147.581 E.09309
G1 X98.8 Y147.218 E.01236
G1 X101.004 Y145.014 E.09599
G3 X100.958 Y144.526 I2.418 J-.473 E.01514
G1 X98.655 Y146.829 E.10033
G3 X98.527 Y146.423 I2.69 J-1.07 E.01314
G1 X101.24 Y143.709 E.11818
; WIPE_START
G1 X99.826 Y145.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.208 Y141.741 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X120.907 Y124.042 E.77082
G1 X121.441 Y124.042 E.01646
G1 X104.024 Y141.459 E.75856
G3 X104.518 Y141.501 I.04 J2.486 E.01527
G1 X121.976 Y124.042 E.76036
G1 X122.51 Y124.042 E.01646
G1 X104.943 Y141.609 E.76509
G3 X105.325 Y141.762 I-.572 J1.984 E.01268
G1 X123.045 Y124.042 E.77174
G1 X123.579 Y124.042 E.01646
G1 X105.668 Y141.954 E.78009
G3 X105.972 Y142.184 I-1 J1.634 E.01177
G1 X124.114 Y124.042 E.79013
G1 X124.648 Y124.042 E.01646
G1 X106.244 Y142.447 E.80157
G3 X106.483 Y142.742 I-1.353 J1.345 E.01172
G1 X125.183 Y124.042 E.81441
G1 X125.717 Y124.042 E.01646
G1 X106.688 Y143.072 E.82879
G3 X106.852 Y143.443 I-1.77 J1.004 E.0125
G1 X126.252 Y124.042 E.84493
G1 X126.786 Y124.042 E.01646
G1 X106.974 Y143.855 E.86288
G3 X107.037 Y144.327 I-3.43 J.694 E.01467
G1 X127.321 Y124.042 E.88343
G1 X127.855 Y124.042 E.01646
G1 X107.019 Y144.879 E.90749
G3 X106.838 Y145.594 I-3.114 J-.405 E.02275
G1 X128.39 Y124.042 E.93861
G1 X128.924 Y124.042 E.01646
G1 X102.513 Y150.453 E1.15026
G2 X102.949 Y150.552 I.718 J-2.164 E.01379
G1 X129.459 Y124.042 E1.15455
G1 X129.993 Y124.042 E.01646
G1 X103.416 Y150.62 E1.15752
G2 X103.92 Y150.65 I.407 J-2.549 E.01558
G1 X130.528 Y124.042 E1.15884
G1 X131.062 Y124.042 E.01646
G1 X104.454 Y150.65 E1.15885
G1 X104.989 Y150.65 E.01646
G1 X131.596 Y124.042 E1.15885
G1 X132.131 Y124.042 E.01646
G1 X105.523 Y150.65 E1.15886
G1 X106.057 Y150.651 E.01646
G1 X142.54 Y114.167 E1.58895
G2 X142.904 Y114.339 I2.102 J-3.986 E.01237
G1 X106.592 Y150.651 E1.58149
G1 X107.126 Y150.651 E.01646
G1 X143.315 Y114.462 E1.57613
G2 X143.774 Y114.536 I.597 J-2.252 E.01433
G1 X107.66 Y150.651 E1.57288
G1 X108.195 Y150.651 E.01646
G1 X144.321 Y114.525 E1.57339
G2 X145.014 Y114.366 I-.134 J-2.179 E.02199
G1 X108.729 Y150.651 E1.5803
G1 X109.264 Y150.651 E.01646
G1 X149.61 Y110.305 E1.7572
G3 X149.653 Y110.796 I-3.31 J.539 E.0152
G1 X109.798 Y150.651 E1.73582
G1 X110.332 Y150.651 E.01646
G1 X149.659 Y111.325 E1.71278
G1 X149.659 Y111.859 E.01646
G1 X110.867 Y150.651 E1.6895
G1 X111.401 Y150.652 E.01646
G1 X149.659 Y112.394 E1.66623
G1 X149.659 Y112.928 E.01646
G1 X111.766 Y150.821 E1.65035
; WIPE_START
G1 X113.18 Y149.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.6 Y145.279 Z2.8 F42000
G1 X124.051 Y142.417 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10857
G1 F15000
M204 S6000
G2 X124.001 Y142.556 I.094 J.113 E.00083
; WIPE_START
G1 X124.002 Y142.5 E-.27772
G1 X124.051 Y142.417 E-.48228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.495 Y147.767 Z2.8 F42000
G1 X132.606 Y150.825 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42085
G1 F9525.574
M204 S6000
G1 X149.659 Y133.773 E.74268
G1 X149.659 Y133.238 E.01646
G1 X132.242 Y150.655 E.75856
G1 X131.707 Y150.655 E.01646
G1 X149.659 Y132.704 E.78184
G1 X149.659 Y132.169 E.01646
G1 X131.173 Y150.655 E.80511
G1 X130.638 Y150.655 E.01646
G1 X149.659 Y131.635 E.82838
G1 X149.659 Y131.1 E.01646
G1 X130.104 Y150.655 E.85166
G1 X129.57 Y150.655 E.01646
G1 X149.659 Y130.566 E.87493
G1 X149.659 Y130.031 E.01646
G1 X129.035 Y150.655 E.89821
G1 X128.501 Y150.655 E.01646
G1 X149.659 Y129.497 E.92148
G1 X149.659 Y128.963 E.01646
G1 X127.967 Y150.655 E.94475
G1 X127.432 Y150.655 E.01646
G1 X149.659 Y128.428 E.96803
G1 X149.659 Y127.894 E.01646
G1 X126.898 Y150.654 E.9913
G1 X126.363 Y150.654 E.01646
G1 X149.659 Y127.359 E1.01457
G1 X149.659 Y126.825 E.01646
G1 X125.829 Y150.654 E1.03785
G1 X125.295 Y150.654 E.01646
G1 X149.659 Y126.29 E1.06112
G1 X149.659 Y125.756 E.01646
G1 X124.76 Y150.654 E1.08439
G1 X124.226 Y150.654 E.01646
G1 X149.659 Y125.221 E1.10767
G1 X149.659 Y124.687 E.01646
G1 X123.692 Y150.654 E1.13094
G1 X123.157 Y150.654 E.01646
G1 X149.659 Y124.152 E1.15421
G1 X149.659 Y123.618 E.01646
G1 X122.623 Y150.654 E1.17749
G1 X122.088 Y150.654 E.01646
G1 X149.659 Y123.083 E1.20076
G1 X149.659 Y122.549 E.01646
G1 X121.554 Y150.653 E1.22403
G1 X121.02 Y150.653 E.01646
G1 X149.659 Y122.014 E1.24731
G1 X149.659 Y121.48 E.01646
G1 X120.485 Y150.653 E1.27058
G1 X119.951 Y150.653 E.01646
G1 X125.769 Y144.835 E.25341
G1 X125.349 Y144.895 E.01309
G1 X125.187 Y144.883 E.00499
G1 X119.417 Y150.653 E.25132
G1 X118.882 Y150.653 E.01646
G1 X124.735 Y144.8 E.25491
G3 X124.363 Y144.638 I.214 J-1.003 E.0126
G1 X118.348 Y150.653 E.26196
G1 X117.813 Y150.653 E.01646
G1 X124.051 Y144.415 E.27166
G1 X124.001 Y144.376 E.00196
G3 X123.152 Y144.841 I-1.45 J-1.636 E.03008
G1 X123.077 Y144.855 E.00234
G1 X117.279 Y150.653 E.25252
G1 X116.745 Y150.653 E.01646
G1 X122.514 Y144.883 E.25128
G3 X122.075 Y144.788 I.107 J-1.551 E.01389
G1 X116.21 Y150.652 E.25542
G1 X115.676 Y150.652 E.01646
G1 X121.715 Y144.613 E.26303
G3 X121.41 Y144.384 I.597 J-1.11 E.0118
G1 X115.142 Y150.652 E.27302
G1 X114.607 Y150.652 E.01646
G1 X121.165 Y144.095 E.28559
G3 X120.971 Y143.754 I.747 J-.649 E.01215
G1 X114.073 Y150.652 E.30043
G1 X113.538 Y150.652 E.01646
G1 X120.843 Y143.347 E.31815
G1 X120.808 Y142.905 E.01365
G1 X120.818 Y142.838 E.0021
G1 X113.004 Y150.652 E.34033
G1 X112.47 Y150.652 E.01646
G1 X149.659 Y113.463 E1.61968
G1 X149.659 Y113.997 E.01646
G1 X122.538 Y141.118 E1.18117
M73 P68 R10
G3 X123.045 Y141.146 I.184 J1.265 E.01573
G1 X149.659 Y114.532 E1.15911
G1 X149.659 Y115.066 E.01646
G1 X123.455 Y141.27 E1.14125
G3 X123.797 Y141.463 I-.306 J.942 E.01216
G1 X149.659 Y115.601 E1.12636
G1 X149.659 Y116.135 E.01646
G1 X124.503 Y141.291 E1.09562
G1 X124.697 Y141.203 E.00658
G1 X125.065 Y141.119 E.01163
G1 X125.213 Y141.116 E.00453
G1 X149.659 Y116.67 E1.0647
G1 X149.659 Y117.204 E.01646
G1 X125.706 Y141.156 E1.04319
G3 X126.105 Y141.293 I-.24 J1.352 E.01301
G1 X149.659 Y117.739 E1.02585
G1 X149.659 Y118.273 E.01646
G1 X126.438 Y141.494 E1.01135
G3 X126.715 Y141.751 I-.497 J.815 E.01173
G1 X149.659 Y118.808 E.99926
G1 X149.659 Y119.342 E.01646
G1 X126.943 Y142.058 E.98935
G3 X127.107 Y142.428 I-1.147 J.73 E.01252
G1 X149.659 Y119.876 E.9822
G1 X149.659 Y120.411 E.01646
G1 X127.189 Y142.88 E.97861
G3 X127.129 Y143.475 I-1.807 J.118 E.01849
G1 X149.828 Y120.776 E.98862
M204 S10000
G1 X146.544 Y112.837 F42000
G1 F9525.574
M204 S6000
G1 X149.533 Y109.848 E.13018
G2 X149.431 Y109.415 I-2.977 J.475 E.01369
G1 X147.028 Y111.818 E.10465
G2 X147.034 Y111.277 I-3.939 J-.316 E.01667
G1 X149.293 Y109.018 E.09838
G2 X149.14 Y108.637 I-2.66 J.846 E.01267
G1 X146.964 Y110.813 E.09478
G2 X146.838 Y110.404 I-2.105 J.424 E.01319
G1 X148.957 Y108.286 E.09229
G2 X148.758 Y107.95 I-1.805 J.84 E.01204
G1 X146.67 Y110.037 E.09093
G2 X146.461 Y109.712 I-1.73 J.884 E.01193
G1 X148.544 Y107.629 E.09072
G1 X148.303 Y107.336 E.0117
G1 X146.219 Y109.42 E.09078
G2 X145.944 Y109.16 I-1.437 J1.241 E.01166
G1 X148.052 Y107.053 E.09178
G2 X147.775 Y106.795 I-1.882 J1.743 E.01166
G1 X145.636 Y108.934 E.09314
G2 X145.29 Y108.746 I-1.111 J1.64 E.01216
G1 X147.488 Y106.547 E.09575
G2 X147.176 Y106.325 I-1.696 J2.056 E.01181
G1 X144.905 Y108.596 E.09891
G2 X144.472 Y108.495 I-1.021 J3.383 E.01371
G1 X146.851 Y106.116 E.10362
G2 X146.5 Y105.932 I-1.367 J2.173 E.0122
G1 X143.974 Y108.458 E.11004
G2 X143.374 Y108.523 I.077 J3.494 E.0186
G1 X146.135 Y105.763 E.12023
G2 X145.74 Y105.623 I-1.082 J2.428 E.01291
G1 X132.843 Y118.52 E.56168
G1 X132.843 Y119.054 E.01646
G1 X141.023 Y110.874 E.35624
G2 X140.958 Y111.474 I3.83 J.717 E.01858
G1 X132.843 Y119.589 E.35342
G1 X132.843 Y120.123 E.01646
G1 X140.997 Y111.969 E.35512
G2 X141.095 Y112.406 I4.191 J-.713 E.01378
G1 X132.843 Y120.657 E.35939
G1 X132.843 Y121.192 E.01646
G1 X141.247 Y112.788 E.366
G2 X141.436 Y113.134 I1.819 J-.772 E.01214
G1 X132.843 Y121.726 E.37424
G1 X132.843 Y122.261 E.01646
G1 X141.66 Y113.444 E.38398
G2 X141.92 Y113.719 I3.802 J-3.351 E.01165
G1 X132.843 Y122.795 E.39532
G1 X132.843 Y123.33 E.01646
G1 X142.335 Y113.838 E.4134
M204 S10000
G1 X132.674 Y118.155 F42000
G1 F9525.574
M204 S6000
G1 X145.327 Y105.501 E.55109
G2 X144.876 Y105.418 I-.792 J3.018 E.01414
G1 X132.843 Y117.451 E.52406
G1 X132.843 Y116.916 E.01646
G1 X144.4 Y105.36 E.50332
G2 X143.876 Y105.349 I-.339 J3.806 E.01615
G1 X132.843 Y116.382 E.4805
G1 X132.843 Y115.847 E.01646
G1 X143.342 Y105.349 E.45723
G1 X142.807 Y105.349 E.01646
G1 X132.843 Y115.313 E.43395
G1 X132.843 Y114.778 E.01646
G1 X142.273 Y105.349 E.41067
G1 X141.738 Y105.349 E.01646
G1 X132.843 Y114.244 E.38739
G1 X132.843 Y113.709 E.01646
G1 X141.204 Y105.349 E.36411
G1 X140.669 Y105.349 E.01646
G1 X132.843 Y113.175 E.34083
G1 X132.843 Y112.64 E.01646
G1 X140.135 Y105.349 E.31756
G1 X139.6 Y105.349 E.01646
G1 X132.843 Y112.106 E.29428
G1 X132.843 Y111.571 E.01646
G1 X139.066 Y105.349 E.271
G1 X138.531 Y105.349 E.01646
G1 X132.523 Y111.358 E.26169
G1 X131.988 Y111.358 E.01646
G1 X137.997 Y105.349 E.26169
G1 X137.462 Y105.349 E.01646
G1 X131.454 Y111.358 E.26168
G1 X130.919 Y111.358 E.01646
G1 X136.928 Y105.349 E.26168
G1 X136.393 Y105.349 E.01646
G1 X130.385 Y111.358 E.26168
G1 X129.85 Y111.358 E.01646
G1 X135.859 Y105.349 E.26168
G1 X135.324 Y105.349 E.01646
G1 X129.316 Y111.358 E.26168
G1 X128.782 Y111.358 E.01646
G1 X134.79 Y105.349 E.26168
G1 X134.255 Y105.349 E.01646
G1 X128.247 Y111.358 E.26168
G1 X127.713 Y111.358 E.01646
G1 X133.721 Y105.349 E.26168
G1 X133.186 Y105.349 E.01646
G1 X127.178 Y111.358 E.26168
G1 X126.644 Y111.358 E.01646
G1 X132.652 Y105.349 E.26168
G1 X132.117 Y105.349 E.01646
G1 X126.109 Y111.358 E.26168
G1 X125.575 Y111.358 E.01646
G1 X131.583 Y105.349 E.26168
G1 X131.048 Y105.349 E.01646
G1 X125.04 Y111.358 E.26168
G1 X124.506 Y111.358 E.01646
G1 X130.514 Y105.349 E.26168
G1 X129.98 Y105.349 E.01646
G1 X123.971 Y111.358 E.26168
G1 X123.437 Y111.358 E.01646
G1 X129.445 Y105.349 E.26168
G1 X128.911 Y105.349 E.01646
G1 X122.902 Y111.358 E.26168
G1 X122.368 Y111.358 E.01646
G1 X128.376 Y105.349 E.26168
G1 X127.842 Y105.349 E.01646
G1 X121.833 Y111.358 E.26168
G1 X121.299 Y111.358 E.01646
G1 X127.307 Y105.349 E.26167
G1 X126.773 Y105.349 E.01646
G1 X120.764 Y111.358 E.26167
G1 X120.23 Y111.358 E.01646
G1 X126.238 Y105.349 E.26167
G1 X125.704 Y105.349 E.01646
G1 X119.695 Y111.358 E.26167
G1 X119.161 Y111.358 E.01646
G1 X125.169 Y105.349 E.26167
G1 X124.635 Y105.349 E.01646
G1 X118.627 Y111.358 E.26167
G1 X118.092 Y111.358 E.01646
G1 X124.1 Y105.349 E.26167
G1 X123.566 Y105.349 E.01646
G1 X117.558 Y111.358 E.26167
G1 X117.023 Y111.358 E.01646
G1 X123.031 Y105.349 E.26167
G1 X122.497 Y105.349 E.01646
G1 X116.489 Y111.358 E.26167
G1 X115.954 Y111.358 E.01646
G1 X121.962 Y105.349 E.26167
G1 X121.428 Y105.35 E.01646
G1 X98.347 Y128.43 E1.00522
G1 X98.347 Y127.896 E.01646
G1 X120.893 Y105.35 E.98195
G1 X120.359 Y105.35 E.01646
G1 X98.347 Y127.361 E.95867
G1 X98.347 Y126.827 E.01646
G1 X119.824 Y105.35 E.9354
G1 X119.29 Y105.35 E.01646
G1 X98.347 Y126.293 E.91213
G1 X98.347 Y125.758 E.01646
G1 X118.755 Y105.35 E.88885
G1 X118.221 Y105.35 E.01646
G1 X98.347 Y125.224 E.86558
G1 X98.346 Y124.689 E.01646
G1 X117.686 Y105.35 E.84231
G1 X117.152 Y105.35 E.01646
G1 X98.346 Y124.155 E.81903
G1 X98.346 Y123.621 E.01646
G1 X116.617 Y105.35 E.79576
G1 X116.083 Y105.35 E.01646
G1 X98.346 Y123.086 E.77249
G1 X98.346 Y122.552 E.01646
G1 X115.548 Y105.35 E.74921
G1 X115.014 Y105.35 E.01646
G1 X98.346 Y122.018 E.72594
G1 X98.346 Y121.483 E.01646
G1 X114.479 Y105.35 E.70267
G1 X113.945 Y105.35 E.01646
G1 X106.914 Y112.38 E.30621
G2 X107.034 Y111.726 I-3.244 J-.932 E.02051
G1 X113.41 Y105.35 E.27772
G1 X112.876 Y105.35 E.01646
G1 X107.03 Y111.196 E.25462
G2 X106.946 Y110.745 I-2.293 J.193 E.01414
G1 X112.341 Y105.35 E.23498
G1 X111.807 Y105.35 E.01646
G1 X106.815 Y110.342 E.21742
G2 X106.638 Y109.984 I-3.981 J1.749 E.01229
G1 X111.273 Y105.35 E.20185
G1 X110.738 Y105.35 E.01646
G1 X106.424 Y109.664 E.18788
G2 X106.178 Y109.376 I-1.561 J1.088 E.01169
G1 X110.204 Y105.35 E.17534
G1 X109.669 Y105.35 E.01646
G1 X105.899 Y109.12 E.1642
G2 X105.582 Y108.902 I-1.246 J1.473 E.01186
G1 X109.135 Y105.35 E.15472
G1 X108.6 Y105.35 E.01646
G1 X105.231 Y108.719 E.14675
G2 X104.841 Y108.575 I-.917 J1.876 E.01283
G1 X108.066 Y105.35 E.14046
G1 X107.531 Y105.35 E.01646
G1 X104.396 Y108.485 E.13656
G2 X103.887 Y108.46 I-.43 J3.479 E.01571
G1 X106.997 Y105.35 E.13545
G1 X106.462 Y105.35 E.01646
G1 X103.005 Y108.807 E.15058
; WIPE_START
G1 X104.419 Y107.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.309 Y110.503 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9525.574
M204 S6000
G1 X98.344 Y113.468 E.12914
G1 X98.344 Y114.002 E.01646
G1 X100.963 Y111.384 E.11405
G2 X100.986 Y111.895 I3.155 J.113 E.01578
G1 X98.344 Y114.537 E.11505
G1 X98.344 Y115.071 E.01646
G1 X101.077 Y112.338 E.11902
G2 X101.219 Y112.731 I3.665 J-1.105 E.01286
G1 X98.344 Y115.605 E.1252
G1 X98.345 Y116.14 E.01646
G1 X101.404 Y113.08 E.13324
G2 X101.623 Y113.396 I1.686 J-.938 E.01185
G1 X98.345 Y116.674 E.14278
G1 X98.345 Y117.208 E.01646
G1 X101.875 Y113.678 E.15374
G2 X102.164 Y113.924 I3.81 J-4.197 E.01168
G1 X98.345 Y117.743 E.16633
G1 X98.345 Y118.277 E.01646
G1 X102.486 Y114.136 E.18036
G2 X102.844 Y114.313 I1.065 J-1.7 E.0123
G1 X98.345 Y118.812 E.19592
G1 X98.345 Y119.346 E.01646
G1 X103.245 Y114.446 E.21341
G2 X103.699 Y114.526 I.628 J-2.228 E.01423
M73 P68 R9
G1 X98.345 Y119.88 E.23318
G1 X98.346 Y120.415 E.01646
G1 X104.228 Y114.532 E.25621
G2 X104.885 Y114.41 I-.233 J-3.078 E.02061
G1 X98.176 Y121.119 E.29219
M204 S10000
G1 X98.174 Y113.103 F42000
G1 F9525.574
M204 S6000
G1 X105.928 Y105.35 E.33768
G1 X105.393 Y105.35 E.01646
G1 X98.344 Y112.399 E.30702
G1 X98.344 Y111.865 E.01646
G1 X104.859 Y105.35 E.28375
G1 X104.324 Y105.35 E.01646
G1 X98.344 Y111.331 E.26047
G3 X98.355 Y110.785 I5.595 J-.156 E.01682
G1 X103.79 Y105.35 E.2367
G2 X103.204 Y105.401 I-.033 J2.999 E.01813
G1 X98.408 Y110.197 E.20887
G3 X98.546 Y109.525 I3.485 J.364 E.02116
G1 X102.528 Y105.542 E.17344
G2 X101.698 Y105.838 I1.232 J4.77 E.02719
G1 X98.841 Y108.695 E.12441
G3 X99.994 Y107.008 I5.054 J2.216 E.06331
G1 X100.97 Y106.032 E.04251
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9525.574
G1 X99.994 Y107.008 E-.52448
G1 X99.628 Y107.411 E-.20697
G1 X99.584 Y107.471 E-.02855
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/53
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S153
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.8 I-.969 J.736 P1  F42000
G1 X125.363 Y141.407 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G2 X124.269 Y141.83 I.14 J1.988 E.0395
G2 X123.997 Y142.13 I1.359 J1.505 E.01344
G2 X122.879 Y141.452 I-1.301 J.884 E.04473
G1 X122.843 Y141.282 E.00575
G3 X124.153 Y140.935 I1.162 J1.741 E.0458
G3 X125.315 Y141.371 I-.224 J2.363 E.04163
; WIPE_START
G1 X124.804 Y141.521 E-.20206
G1 X124.521 Y141.649 E-.1183
G1 X124.269 Y141.83 E-.11797
G1 X123.997 Y142.13 E-.1537
G1 X123.791 Y141.883 E-.1222
G1 X123.696 Y141.808 E-.04578
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.361 Y144.578 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X124.001 Y145.505 E.05458
G1 X122.659 Y144.59 E.05389
G2 X123.734 Y144.17 I-.129 J-1.914 E.03888
M73 P69 R9
G2 X123.999 Y143.878 I-1.32 J-1.465 E.0131
G1 X124.202 Y144.108 E.01019
G2 X125.301 Y144.577 I1.173 J-1.23 E.04049
; WIPE_START
G1 X124.001 Y145.505 E-.60696
G1 X123.668 Y145.278 E-.15304
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.531 Y147.896 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X123.911 Y146.665 E.04273
G1 X124.091 Y146.665 E.00598
G1 X124.471 Y147.896 E.04273
G1 X123.591 Y147.896 E.02918
; WIPE_START
G1 X123.911 Y146.665 E-.4833
G1 X124.091 Y146.665 E-.06849
G1 X124.253 Y147.188 E-.20821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.153 Y142.216 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5400
M204 S6000
G2 X126.147 Y143.784 I-.85 J.78 E.18329
G1 X126.312 Y143.9 E.00671
G3 X125.447 Y145.012 I-2.348 J-.935 E.04736
G1 X124.257 Y145.823 E.04778
G1 X125.022 Y148.303 E.08609
G1 X122.98 Y148.303 E.06776
G1 X123.745 Y145.823 E.0861
G1 X122.555 Y145.012 E.04776
G3 X121.69 Y143.901 I1.485 J-2.047 E.04732
G1 X121.849 Y143.784 E.00654
G2 X121.856 Y142.216 I.85 J-.78 E.18329
G1 X121.69 Y142.1 E.00671
G3 X124.184 Y140.529 I2.315 J.91 E.10465
G3 X126.312 Y142.099 I-.197 J2.495 E.09243
G1 X126.201 Y142.181 E.00455
M204 S250
G1 X126.06 Y142.962 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X125.206 Y142.246 I-.759 J.037 E.10824
G1 X125.282 Y142.24 E.00233
G3 X126.055 Y142.903 I.019 J.76 E.03427
; WIPE_START
M204 S6000
G1 X126.053 Y143.113 E-.07997
G1 X126.016 Y143.26 E-.05754
G1 X125.95 Y143.396 E-.05756
G1 X125.858 Y143.517 E-.05751
G1 X125.745 Y143.617 E-.05751
G1 X125.614 Y143.693 E-.05749
G1 X125.396 Y143.754 E-.08614
G1 X125.244 Y143.758 E-.05757
G1 X125.095 Y143.732 E-.05761
G1 X124.954 Y143.677 E-.05742
G1 X124.827 Y143.594 E-.05757
G1 X124.695 Y143.444 E-.07612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.451 Y142.283 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X122.459 Y142.279 E.00028
G3 X122.606 Y142.246 I.242 J.72 E.00465
G1 X122.682 Y142.24 E.00233
G3 X122.321 Y142.342 I.019 J.76 E.13503
G1 X122.396 Y142.308 E.00253
; WIPE_START
M204 S6000
G1 X122.459 Y142.279 E-.02629
G1 X122.606 Y142.246 E-.05743
G1 X122.682 Y142.24 E-.02885
G1 X122.833 Y142.251 E-.05756
G1 X122.979 Y142.292 E-.05747
G1 X123.114 Y142.361 E-.05757
G1 X123.232 Y142.456 E-.05752
G1 X123.329 Y142.572 E-.05744
G1 X123.403 Y142.707 E-.05852
G1 X123.46 Y142.962 E-.09953
G1 X123.453 Y143.113 E-.05742
G1 X123.416 Y143.26 E-.05754
G1 X123.35 Y143.396 E-.05756
G1 X123.303 Y143.458 E-.02929
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.673 Y143.259 Z3 F42000
G1 X105.161 Y142.984 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X105.192 Y143.007 E.0012
G3 X103.763 Y142.605 I-1.191 J1.492 E.32173
G1 X103.953 Y142.59 E.00586
G3 X105.037 Y142.895 I.048 J1.908 E.03512
G1 X105.112 Y142.949 E.00282
; WIPE_START
M204 S6000
G1 X105.192 Y143.007 E-.03765
G1 X105.464 Y143.272 E-.14441
G1 X105.679 Y143.586 E-.14457
G1 X105.826 Y143.937 E-.14454
G1 X105.902 Y144.31 E-.14459
G1 X105.902 Y144.689 E-.14424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.171 Y137.092 Z3 F42000
G1 X102.586 Y110.225 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X102.81 Y110.007 E.0096
G3 X103.763 Y109.605 I1.191 J1.492 E.03219
G1 X103.953 Y109.59 E.00586
G3 X102.538 Y110.272 I.048 J1.908 E.31882
G1 X102.544 Y110.267 E.00024
; WIPE_START
M204 S6000
G1 X102.81 Y110.007 E-.14148
G1 X103.128 Y109.801 E-.14371
G1 X103.393 Y109.689 E-.10939
G1 X103.763 Y109.605 E-.14447
G1 X103.953 Y109.59 E-.07241
G1 X104.333 Y109.619 E-.14459
G1 X104.343 Y109.622 E-.00394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.764 Y111.403 Z3 F42000
G1 X116.291 Y112.49 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X131.711 Y112.49 E.47381
G1 X131.711 Y122.91 E.32018
G1 X116.291 Y122.91 E.47381
G1 X116.291 Y112.55 E.31833
; WIPE_START
M204 S6000
G1 X118.291 Y112.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.882 Y111.745 Z3 F42000
G1 X144.778 Y109.762 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X145.037 Y109.895 E.00897
G3 X143.764 Y109.605 I-1.036 J1.603 E.3276
G1 X143.953 Y109.59 E.00585
G3 X144.699 Y109.722 I.048 J1.908 E.02342
G1 X144.724 Y109.735 E.00087
; WIPE_START
M204 S6000
G1 X145.037 Y109.895 E-.13376
G1 X145.335 Y110.133 E-.14459
G1 X145.579 Y110.424 E-.14451
G1 X145.761 Y110.758 E-.14456
G1 X145.873 Y111.122 E-.14459
G1 X145.886 Y111.247 E-.048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.921 Y118.809 Z3 F42000
G1 X149.639 Y138.674 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X149.762 Y138.474 E.00723
G3 X151.934 Y137.291 I2.239 J1.526 E.0789
G1 X152.069 Y137.291 E.00415
G3 X149.609 Y138.726 I-.068 J2.709 E.43101
; WIPE_START
M204 S6000
G1 X149.762 Y138.474 E-.11219
G1 X149.925 Y138.258 E-.10272
G1 X150.109 Y138.06 E-.10266
G1 X150.423 Y137.797 E-.15579
G1 X150.646 Y137.653 E-.1008
G1 X150.887 Y137.53 E-.10269
G1 X151.09 Y137.45 E-.08315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.646 Y143.655 Z3 F42000
G1 X145.89 Y144.709 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X145.872 Y144.878 E.00522
G3 X143.764 Y142.605 I-1.871 J-.379 E.25738
G1 X143.953 Y142.59 E.00585
G3 X145.91 Y144.5 I.048 J1.908 E.09364
G1 X145.896 Y144.65 E.00462
; WIPE_START
M204 S6000
G1 X145.872 Y144.878 E-.08731
G1 X145.761 Y145.242 E-.14449
G1 X145.579 Y145.576 E-.14456
G1 X145.342 Y145.86 E-.14043
G1 X145.116 Y146.051 E-.11257
G1 X144.819 Y146.223 E-.13063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.002 Y139.286 Z3 F42000
G1 X150.791 Y133.21 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X152.677 Y133.244 I.636 J17.146 E.05799
G3 X151.998 Y146.79 I-.678 J6.756 E.6346
G1 X150.557 Y146.79 E.0443
G3 X143.998 Y151.79 I-6.585 J-1.836 E.27203
G1 X104.004 Y151.79 E1.22891
G3 X97.211 Y144.997 I.017 J-6.81 E.32764
G1 X97.211 Y111.003 E1.04455
G3 X104.004 Y104.21 I6.81 J.017 E.32764
G1 X144.321 Y104.218 E1.23884
G3 X150.791 Y111.003 I-.325 J6.787 E.31791
G1 X150.791 Y133.15 E.68052
; WIPE_START
M204 S6000
G1 X151.999 Y133.21 E-.45951
G1 X152.677 Y133.244 E-.25804
G1 X152.788 Y133.26 E-.04245
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


G1 X134.874 Y148.313 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.415341
G1 F9666.483
M204 S6000
G1 X125.231 Y148.313 E.29267
; WIPE_START
G1 X127.231 Y148.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.022 Y147.512 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X123.958 Y147.549 E.00204
G1 X124.007 Y147.577 E.00155
; WIPE_START
G1 X123.958 Y147.549 E-.32875
G1 X124.022 Y147.512 E-.43125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.771 Y148.313 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.415773
G1 F9655.277
M204 S6000
G1 X113.128 Y148.312 E.293
; WIPE_START
G1 X115.128 Y148.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.353 Y143.897 Z3 F42000
G1 X121.668 Y143.673 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.48237
G1 F8192.058
M204 S6000
G3 X121.586 Y143.394 I5.464 J-1.752 E.01044
G1 X121.545 Y143.163 E.00837
G1 X121.537 Y142.952 E.00757
G1 X121.556 Y142.755 E.00709
G1 X121.6 Y142.559 E.00721
G1 X121.525 Y142.378 E.00699
; LINE_WIDTH: 0.462828
G1 F8573.309
G1 X121.45 Y142.198 E.00668
M204 S10000
G1 X122.113 Y141.736 F42000
; LINE_WIDTH: 0.252857
G1 F15000
M204 S6000
G3 X122.66 Y141.402 I6.979 J10.822 E.01098
M204 S10000
G1 X122.653 Y141.37 F42000
; LINE_WIDTH: 0.1695
G1 F15000
M204 S6000
G2 X122.121 Y141.748 I7.356 J10.936 E.00673
; WIPE_START
G1 X122.653 Y141.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.569 Y141.467 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.382136
G1 F10612.709
M204 S6000
G3 X124.713 Y141.275 I4.452 J23.054 E.03206
M204 S10000
G1 X125.421 Y141.614 F42000
; LINE_WIDTH: 0.185384
G1 F15000
M204 S6000
G3 X125.821 Y141.637 I-.249 J7.818 E.00465
M204 S10000
G1 X125.811 Y141.623 F42000
; LINE_WIDTH: 0.12119
G1 F15000
M204 S6000
G2 X125.421 Y141.626 I-.134 J7.82 E.00249
; WIPE_START
G1 X125.811 Y141.623 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.123 Y142.482 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.446759
G1 F8914.462
M204 S6000
G1 X126.262 Y142.521 E.00473
; LINE_WIDTH: 0.480426
G1 F8228.474
G1 X126.4 Y142.56 E.00512
; LINE_WIDTH: 0.478168
G1 F8271.147
G3 X126.435 Y142.689 I-.613 J.236 E.00474
G1 X126.464 Y143.068 E.01349
G1 X126.403 Y143.441 E.0134
G1 X126.477 Y143.622 E.00692
; LINE_WIDTH: 0.463011
G1 F8569.58
G1 X126.552 Y143.802 E.00668
M204 S10000
G1 X125.881 Y144.253 F42000
; LINE_WIDTH: 0.170877
G1 F15000
M204 S6000
G3 X125.659 Y144.41 I-3.398 J-4.555 E.00284
M204 S10000
G1 X125.49 Y144.366 F42000
; LINE_WIDTH: 0.1202
G1 F15000
M204 S6000
G2 X125.827 Y144.352 I-.105 J-6.609 E.00212
; WIPE_START
G1 X125.49 Y144.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.774 Y144.732 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.110711
G1 F15000
M204 S6000
G1 X124.626 Y144.656 E.00092
M204 S10000
G1 X124.013 Y144.453 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43072
G1 F9283.136
M204 S6000
G1 X123.585 Y144.74 E.01627
G1 X124.001 Y145.024 E.01591
G1 X124.187 Y144.898 E.00709
G1 X124.134 Y144.771 E.00432
G1 X124.2 Y144.615 E.00536
G1 X124.058 Y144.493 E.00593
M204 S10000
G1 X124.063 Y143.609 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109243
G1 F15000
M204 S6000
G2 X124.001 Y143.521 I-.262 J.118 E.00058
G2 X123.951 Y143.582 I.08 J.117 E.00043
M204 S10000
G1 X124 Y142.557 F42000
; LINE_WIDTH: 0.108554
G1 F15000
M204 S6000
G3 X124.051 Y142.417 I.15 J-.024 E.00083
; WIPE_START
G1 X124.002 Y142.5 E-.47884
G1 X124 Y142.557 E-.28116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.581 Y144.374 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.121061
G1 F15000
M204 S6000
G3 X122.191 Y144.377 I-.255 J-7.789 E.00248
M204 S10000
G1 X122.181 Y144.363 F42000
; LINE_WIDTH: 0.185261
G1 F15000
M204 S6000
G2 X122.581 Y144.387 I.698 J-8.499 E.00465
; WIPE_START
G1 X122.181 Y144.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.803 Y138.289 Z3 F42000
G1 X149.856 Y107.995 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X147.006 Y105.145 E.12383
G1 X146.086 Y104.758
G1 X150.243 Y108.915 E.18064
G1 X150.442 Y109.648
G1 X145.353 Y104.559 E.22111
G1 X144.719 Y104.458
G1 X150.543 Y110.282 E.25307
G1 X150.58 Y110.852
G1 X144.149 Y104.421 E.27947
G1 X143.612 Y104.417
G1 X150.584 Y111.389 E.30297
G1 X150.584 Y111.923
G1 X143.078 Y104.417 E.32614
G1 X142.545 Y104.417
G1 X150.584 Y112.456 E.34931
G1 X150.584 Y112.989
G1 X142.012 Y104.417 E.37248
G1 X141.479 Y104.417
G1 X150.584 Y113.522 E.39566
G1 X150.584 Y114.056
G1 X140.945 Y104.417 E.41883
G1 X140.412 Y104.417
G1 X150.584 Y114.589 E.442
G1 X150.584 Y115.122
G1 X145.696 Y110.235 E.21238
G1 X146.089 Y111.161
G1 X150.584 Y115.655 E.19531
G1 X150.584 Y116.189
G1 X146.108 Y111.713 E.19449
G1 X146.015 Y112.153
G1 X150.584 Y116.722 E.19855
G1 X150.584 Y117.255
G1 X145.854 Y112.525 E.20554
G1 X145.638 Y112.843
G1 X150.584 Y117.788 E.21492
G1 X150.584 Y118.322
G1 X145.373 Y113.111 E.22642
G1 X145.062 Y113.333
G1 X150.584 Y118.855 E.23995
G1 X150.584 Y119.388
G1 X144.695 Y113.5 E.25588
G1 X144.264 Y113.602
G1 X150.584 Y119.921 E.27463
G1 X150.584 Y120.455
G1 X143.726 Y113.597 E.29798
G1 X142.906 Y113.31
G1 X150.584 Y120.988 E.33363
; WIPE_START
M204 S6000
G1 X149.169 Y119.574 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.337 Y112.486 Z3 F42000
G1 X145.265 Y109.804 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X139.879 Y104.417 E.23406
G1 X139.346 Y104.417
G1 X144.339 Y109.411 E.21698
G1 X143.79 Y109.395
G1 X138.812 Y104.417 E.21629
G1 X138.279 Y104.417
G1 X143.348 Y109.486 E.22027
G1 X142.977 Y109.649
G1 X137.746 Y104.417 E.22732
G1 X137.213 Y104.417
G1 X142.659 Y109.863 E.23666
G1 X142.389 Y110.127
G1 X136.679 Y104.417 E.24812
G1 X136.146 Y104.417
G1 X142.169 Y110.441 E.26174
G1 X142.002 Y110.807
G1 X135.613 Y104.417 E.27765
G1 X135.08 Y104.417
G1 X141.901 Y111.239 E.29643
G1 X141.903 Y111.774
G1 X134.546 Y104.417 E.31969
G1 X134.013 Y104.417
G1 X142.192 Y112.596 E.35542
; WIPE_START
M204 S6000
G1 X140.778 Y111.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.18 Y105.994 Z3 F42000
G1 X133.48 Y104.417 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X150.584 Y121.521 E.74325
G1 X150.584 Y122.054
G1 X132.947 Y104.417 E.76642
G1 X132.413 Y104.417
G1 X150.584 Y122.588 E.78959
M73 P70 R9
G1 X150.584 Y123.121
G1 X131.88 Y104.417 E.81276
G1 X131.347 Y104.417
G1 X150.584 Y123.654 E.83594
G1 X150.584 Y124.188
G1 X130.814 Y104.417 E.85911
G1 X130.28 Y104.417
G1 X150.584 Y124.721 E.88228
G1 X150.584 Y125.254
G1 X129.747 Y104.417 E.90545
G1 X129.214 Y104.417
G1 X150.584 Y125.787 E.92863
G1 X150.584 Y126.321
G1 X128.681 Y104.417 E.9518
G1 X128.147 Y104.417
G1 X150.584 Y126.854 E.97497
G1 X150.584 Y127.387
G1 X127.614 Y104.417 E.99814
G1 X127.081 Y104.417
G1 X150.584 Y127.92 E1.02132
G1 X150.584 Y128.454
G1 X126.547 Y104.417 E1.04449
G1 X126.014 Y104.417
G1 X150.584 Y128.987 E1.06766
G1 X150.584 Y129.52
G1 X125.481 Y104.417 E1.09083
G1 X124.948 Y104.417
G1 X150.584 Y130.053 E1.11401
G1 X150.584 Y130.587
G1 X124.414 Y104.417 E1.13718
G1 X123.881 Y104.417
G1 X131.746 Y112.283 E.34178
G1 X131.213 Y112.283
G1 X123.348 Y104.417 E.34178
G1 X122.815 Y104.417
G1 X130.68 Y112.283 E.34178
G1 X130.147 Y112.283
G1 X122.281 Y104.417 E.34178
G1 X121.748 Y104.417
G1 X129.613 Y112.283 E.34178
G1 X129.08 Y112.283
G1 X121.215 Y104.417 E.34178
G1 X120.682 Y104.417
G1 X128.547 Y112.283 E.34178
G1 X128.014 Y112.283
G1 X120.148 Y104.417 E.34178
G1 X119.615 Y104.417
G1 X127.48 Y112.283 E.34178
G1 X126.947 Y112.283
G1 X119.082 Y104.417 E.34178
G1 X118.549 Y104.417
G1 X126.414 Y112.283 E.34178
G1 X125.881 Y112.283
G1 X118.015 Y104.417 E.34178
G1 X117.482 Y104.417
G1 X125.347 Y112.283 E.34178
G1 X124.814 Y112.283
G1 X116.949 Y104.417 E.34178
G1 X116.416 Y104.417
G1 X124.281 Y112.283 E.34178
G1 X123.748 Y112.283
G1 X115.882 Y104.417 E.34178
G1 X115.349 Y104.417
G1 X123.214 Y112.283 E.34178
G1 X122.681 Y112.283
G1 X114.816 Y104.417 E.34178
G1 X114.283 Y104.417
G1 X122.148 Y112.283 E.34178
G1 X121.615 Y112.283
G1 X113.749 Y104.417 E.34178
G1 X113.216 Y104.417
G1 X121.081 Y112.283 E.34178
G1 X120.548 Y112.283
G1 X112.683 Y104.417 E.34178
G1 X112.15 Y104.417
G1 X120.015 Y112.283 E.34178
G1 X119.482 Y112.283
G1 X111.616 Y104.417 E.34178
G1 X111.083 Y104.417
G1 X118.948 Y112.283 E.34178
G1 X118.415 Y112.283
G1 X110.55 Y104.417 E.34178
G1 X110.017 Y104.417
G1 X117.882 Y112.283 E.34178
G1 X117.348 Y112.283
G1 X109.483 Y104.417 E.34178
G1 X108.95 Y104.417
G1 X116.815 Y112.283 E.34178
G1 X116.282 Y112.283
G1 X108.417 Y104.417 E.34178
G1 X107.883 Y104.417
G1 X116.084 Y112.618 E.35634
G1 X116.084 Y113.151
G1 X107.35 Y104.417 E.37951
G1 X106.817 Y104.417
G1 X116.084 Y113.684 E.40268
G1 X116.084 Y114.217
G1 X106.284 Y104.417 E.42586
G1 X105.75 Y104.417
G1 X116.084 Y114.751 E.44903
G1 X116.084 Y115.284
G1 X105.217 Y104.417 E.4722
G1 X104.684 Y104.417
G1 X116.084 Y115.817 E.49537
G1 X116.084 Y116.35
G1 X104.151 Y104.417 E.51855
G1 X103.629 Y104.429
G1 X116.084 Y116.884 E.54121
M73 P71 R9
G1 X116.084 Y117.417
G1 X103.142 Y104.476 E.56236
G1 X102.685 Y104.551
G1 X116.084 Y117.95 E.58225
G1 X116.084 Y118.483
G1 X102.256 Y104.655 E.6009
G1 X101.848 Y104.781
G1 X116.084 Y119.017 E.61861
G1 X116.084 Y119.55
G1 X101.461 Y104.928 E.63541
G1 X101.096 Y105.095
G1 X116.084 Y120.083 E.6513
G1 X116.084 Y120.616
G1 X105.679 Y110.211 E.45216
G1 X106.088 Y111.154
G1 X116.084 Y121.15 E.43436
G1 X116.084 Y121.683
G1 X106.109 Y111.708 E.43347
G1 X106.016 Y112.149
G1 X116.084 Y122.216 E.43749
G1 X116.084 Y122.749
G1 X105.856 Y112.522 E.44445
; WIPE_START
M204 S6000
G1 X107.27 Y113.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.285 Y109.818 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X100.747 Y105.28 E.1972
G1 X100.416 Y105.482
G1 X104.345 Y109.411 E.17077
G1 X103.795 Y109.394
G1 X100.1 Y105.699 E.16058
G1 X99.8 Y105.933
G1 X103.353 Y109.485 E.15435
G1 X102.981 Y109.647
G1 X99.517 Y106.183 E.15051
G1 X99.249 Y106.448
G1 X102.662 Y109.861 E.1483
G1 X102.392 Y110.124
G1 X98.996 Y106.728 E.14759
G1 X98.758 Y107.023
G1 X102.172 Y110.437 E.14836
G1 X102.004 Y110.803
G1 X98.535 Y107.333 E.15075
G1 X98.329 Y107.661
G1 X101.902 Y111.234 E.15525
G1 X101.902 Y111.768
G1 X98.141 Y108.006 E.16345
G1 X97.97 Y108.368
G1 X102.183 Y112.582 E.1831
; WIPE_START
M204 S6000
G1 X100.769 Y111.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.395 Y111.483 Z3 F42000
G1 X131.918 Y112.455 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X150.584 Y131.12 E.81109
G1 X150.584 Y131.653
G1 X131.918 Y112.988 E.81109
G1 X131.918 Y113.521
G1 X150.584 Y132.186 E.81109
G1 X150.584 Y132.72
G1 X131.918 Y114.054 E.81109
G1 X131.918 Y114.588
G1 X150.584 Y133.253 E.81109
; WIPE_START
M204 S6000
G1 X149.169 Y131.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.471 Y134.408 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X157.591 Y136.527 E.0921
G1 X158.13 Y137.6
G1 X154.405 Y133.875 E.16188
G1 X153.617 Y133.62
G1 X158.38 Y138.383 E.20697
G1 X158.512 Y139.049
G1 X152.951 Y133.487 E.24167
G1 X152.358 Y133.428
G1 X158.572 Y139.641 E.27
G1 X158.581 Y140.183
G1 X151.815 Y133.417 E.29401
G1 X151.281 Y133.417
G1 X158.546 Y140.682 E.31567
G1 X158.482 Y141.151
G1 X150.748 Y133.417 E.33607
; WIPE_START
M204 S6000
G1 X152.162 Y134.832 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.333 Y140.446 Z3 F42000
G1 X158.387 Y141.589 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X131.918 Y115.121 E1.15018
G1 X131.918 Y115.654
G1 X158.269 Y142.005 E1.14506
G1 X158.131 Y142.399
G1 X154.747 Y139.016 E.14701
G1 X154.904 Y139.706
G1 X157.97 Y142.772 E.13324
G1 X157.791 Y143.127
G1 X154.908 Y140.243 E.12531
G1 X154.833 Y140.701
G1 X157.596 Y143.465 E.12007
G1 X157.384 Y143.786
G1 X154.701 Y141.103 E.11658
G1 X154.526 Y141.461
G1 X157.157 Y144.092 E.11434
G1 X156.913 Y144.381
G1 X154.312 Y141.78 E.11302
G1 X154.062 Y142.064
G1 X156.653 Y144.655 E.11259
G1 X156.378 Y144.913
G1 X153.778 Y142.313 E.113
G1 X153.459 Y142.527
G1 X156.089 Y145.157 E.11428
G1 X155.783 Y145.385
G1 X153.1 Y142.702 E.1166
G1 X152.698 Y142.832
G1 X155.463 Y145.598 E.12017
G1 X155.125 Y145.793
G1 X152.239 Y142.907 E.1254
G1 X151.7 Y142.901
G1 X154.769 Y145.97 E.13338
G1 X154.395 Y146.13
G1 X151.008 Y142.742 E.1472
; WIPE_START
M204 S6000
G1 X152.422 Y144.156 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.986 Y137.255 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X131.918 Y116.187 E.91547
G1 X131.918 Y116.721
G1 X152.296 Y137.098 E.88551
G1 X151.758 Y137.093
G1 X131.918 Y117.254 E.86211
G1 X131.918 Y117.787
G1 X151.3 Y137.169 E.84222
G1 X150.898 Y137.3
G1 X131.918 Y118.32 E.82475
G1 X131.918 Y118.854
G1 X150.54 Y137.475 E.80918
G1 X150.221 Y137.69
M73 P72 R8
G1 X131.918 Y119.387 E.79533
G1 X131.918 Y119.92
G1 X149.937 Y137.939 E.783
G1 X149.688 Y138.223
G1 X131.918 Y120.454 E.77216
G1 X131.918 Y120.987
G1 X149.475 Y138.543 E.7629
G1 X149.299 Y138.901
G1 X131.918 Y121.52 E.75528
G1 X131.918 Y122.053
G1 X149.168 Y139.303 E.7496
G1 X149.094 Y139.762
G1 X131.918 Y122.587 E.74636
G1 X131.916 Y123.117
G1 X149.099 Y140.301 E.7467
G1 X149.258 Y140.992
G1 X131.383 Y123.117 E.77675
G1 X130.85 Y123.117
G1 X154.002 Y146.27 E1.00608
G1 X153.587 Y146.388
G1 X130.316 Y123.117 E1.01121
G1 X129.783 Y123.117
G1 X153.146 Y146.48 E1.01522
G1 X152.679 Y146.547
G1 X129.25 Y123.117 E1.01813
G1 X128.717 Y123.117
G1 X152.177 Y146.578 E1.01948
G1 X151.648 Y146.583
G1 X128.183 Y123.117 E1.01968
G1 X127.65 Y123.117
G1 X151.115 Y146.583 E1.01968
G1 X150.582 Y146.583
G1 X127.117 Y123.117 E1.01968
G1 X126.583 Y123.117
G1 X150.318 Y146.852 E1.0314
G1 X150.185 Y147.252
G1 X126.05 Y123.117 E1.04877
G1 X125.517 Y123.117
G1 X145.08 Y142.68 E.85011
G1 X144.268 Y142.402
G1 X124.984 Y123.117 E.83799
G1 X124.45 Y123.117
G1 X143.733 Y142.399 E.8379
G1 X143.302 Y142.502
G1 X123.917 Y123.117 E.84236
G1 X123.384 Y123.117
G1 X142.938 Y142.671 E.84971
G1 X142.626 Y142.892
G1 X122.851 Y123.117 E.85932
G1 X122.317 Y123.117
G1 X142.361 Y143.161 E.87101
G1 X142.146 Y143.479
G1 X121.784 Y123.117 E.88482
G1 X121.251 Y123.117
G1 X141.986 Y143.852 E.90103
G1 X141.894 Y144.293
G1 X120.718 Y123.117 E.92019
G1 X120.184 Y123.117
G1 X141.914 Y144.847 E.94427
G1 X142.327 Y145.794
G1 X119.651 Y123.117 E.98539
; WIPE_START
M204 S6000
G1 X121.065 Y124.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.133 Y129.162 Z3 F42000
G1 X145.821 Y143.421 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X150.032 Y147.632 E.183
G1 X149.861 Y147.995
G1 X146.1 Y144.234 E.16343
G1 X146.1 Y144.767
G1 X149.673 Y148.34 E.15525
G1 X149.467 Y148.667
G1 X145.998 Y145.198 E.15073
G1 X145.83 Y145.564
G1 X149.244 Y148.977 E.14835
G1 X149.006 Y149.273
G1 X145.61 Y145.876 E.14758
G1 X145.339 Y146.139
G1 X148.753 Y149.553 E.14835
G1 X148.485 Y149.818
G1 X145.021 Y146.354 E.15051
G1 X144.649 Y146.515
G1 X148.201 Y150.068 E.15438
G1 X147.902 Y150.301
G1 X144.206 Y146.606 E.16059
G1 X143.656 Y146.589
G1 X147.586 Y150.519 E.17079
G1 X147.254 Y150.72
G1 X142.713 Y146.179 E.19735
; WIPE_START
M204 S6000
M73 P73 R8
G1 X144.127 Y147.593 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.906 Y150.905 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X119.118 Y123.117 E1.20752
G1 X118.585 Y123.117
G1 X146.54 Y151.073 E1.2148
G1 X146.153 Y151.219
G1 X118.051 Y123.117 E1.22116
G1 X117.518 Y123.117
G1 X145.746 Y151.345 E1.22663
G1 X145.317 Y151.449
G1 X116.985 Y123.117 E1.23115
G1 X116.452 Y123.117
G1 X144.859 Y151.525 E1.23443
G1 X144.372 Y151.571
G1 X105.64 Y112.839 E1.68308
G1 X105.376 Y113.109
G1 X143.85 Y151.583 E1.67188
G1 X143.317 Y151.583
G1 X105.065 Y113.331 E1.66223
G1 X104.699 Y113.498
G1 X142.784 Y151.583 E1.65495
G1 X142.251 Y151.583
G1 X104.269 Y113.601 E1.6505
G1 X103.733 Y113.598
G1 X141.717 Y151.583 E1.65061
G1 X141.184 Y151.583
G1 X102.919 Y113.318 E1.66278
; WIPE_START
M204 S6000
G1 X104.334 Y114.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.712 Y109.57 Z3 F42000
G1 X97.817 Y108.748 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X140.651 Y151.583 E1.86136
G1 X140.118 Y151.583
G1 X97.685 Y109.15 E1.84389
G1 X97.577 Y109.575
G1 X139.584 Y151.583 E1.82543
G1 X139.051 Y151.583
G1 X97.492 Y110.023 E1.80595
G1 X97.439 Y110.504
G1 X138.518 Y151.583 E1.78506
G1 X137.984 Y151.583
G1 X134.901 Y148.499 E.13401
G1 X134.394 Y148.525
G1 X137.451 Y151.583 E.13285
G1 X136.918 Y151.583
G1 X133.861 Y148.525 E.13285
G1 X133.328 Y148.525
G1 X136.385 Y151.583 E.13285
G1 X135.851 Y151.583
G1 X132.794 Y148.525 E.13285
G1 X132.261 Y148.525
G1 X135.318 Y151.583 E.13285
G1 X134.785 Y151.583
G1 X131.728 Y148.525 E.13285
G1 X131.195 Y148.525
G1 X134.252 Y151.583 E.13285
G1 X133.718 Y151.583
G1 X130.661 Y148.525 E.13285
G1 X130.128 Y148.525
G1 X133.185 Y151.583 E.13285
G1 X132.652 Y151.583
G1 X129.595 Y148.525 E.13285
G1 X129.062 Y148.525
G1 X132.119 Y151.583 E.13285
G1 X131.585 Y151.583
G1 X128.528 Y148.525 E.13285
G1 X127.995 Y148.525
G1 X131.052 Y151.583 E.13285
G1 X130.519 Y151.583
G1 X127.462 Y148.525 E.13285
M73 P74 R8
G1 X126.928 Y148.525
G1 X129.986 Y151.583 E.13285
G1 X129.452 Y151.583
G1 X126.395 Y148.525 E.13285
G1 X125.862 Y148.525
G1 X128.919 Y151.583 E.13285
G1 X128.386 Y151.583
G1 X125.329 Y148.525 E.13285
G1 X124.795 Y148.525
G1 X127.853 Y151.583 E.13285
G1 X127.319 Y151.583
G1 X124.262 Y148.525 E.13285
G1 X123.729 Y148.525
G1 X126.786 Y151.583 E.13285
G1 X126.253 Y151.583
G1 X123.196 Y148.525 E.13285
G1 X122.662 Y148.525
G1 X125.72 Y151.583 E.13285
G1 X125.186 Y151.583
G1 X122.129 Y148.525 E.13285
G1 X121.596 Y148.525
G1 X124.653 Y151.583 E.13285
G1 X124.12 Y151.583
G1 X121.063 Y148.525 E.13285
G1 X120.529 Y148.525
G1 X123.587 Y151.583 E.13285
G1 X123.053 Y151.583
G1 X119.996 Y148.525 E.13285
G1 X119.463 Y148.525
G1 X122.52 Y151.583 E.13285
G1 X121.987 Y151.583
G1 X118.93 Y148.525 E.13285
G1 X118.396 Y148.525
G1 X121.454 Y151.583 E.13285
G1 X120.92 Y151.583
G1 X117.863 Y148.525 E.13285
G1 X117.33 Y148.525
G1 X120.387 Y151.583 E.13285
G1 X119.854 Y151.583
G1 X116.797 Y148.525 E.13285
G1 X116.263 Y148.525
G1 X119.32 Y151.583 E.13285
G1 X118.787 Y151.583
G1 X115.73 Y148.525 E.13285
G1 X115.197 Y148.525
G1 X118.254 Y151.583 E.13285
G1 X117.721 Y151.583
G1 X114.664 Y148.525 E.13285
G1 X114.13 Y148.525
G1 X117.187 Y151.583 E.13285
G1 X116.654 Y151.583
G1 X113.597 Y148.525 E.13285
; WIPE_START
M204 S6000
G1 X115.011 Y149.94 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.61 Y149.223 Z3 F42000
G1 X134.502 Y148.1 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X97.418 Y111.017 E1.61147
G1 X97.418 Y111.55
G1 X133.969 Y148.1 E1.58829
G1 X133.436 Y148.1
G1 X97.418 Y112.083 E1.56512
G1 X97.418 Y112.616
G1 X125.725 Y140.922 E1.23004
G1 X124.648 Y140.379
G1 X97.418 Y113.15 E1.18326
G1 X97.418 Y113.683
G1 X124.036 Y140.301 E1.15667
G1 X123.542 Y140.339
G1 X97.418 Y114.216 E1.13518
G1 X97.418 Y114.749
G1 X123.118 Y140.449 E1.11677
G1 X122.746 Y140.61
G1 X97.418 Y115.283 E1.1006
G1 X97.418 Y115.816
G1 X122.417 Y140.814 E1.08629
G1 X122.126 Y141.057
G1 X97.418 Y116.349 E1.07368
G1 X97.418 Y116.882
G1 X121.874 Y141.338 E1.06271
G1 X121.66 Y141.657
G1 X97.418 Y117.416 E1.0534
G1 X97.418 Y117.949
G1 X121.487 Y142.017 E1.04589
G1 X121.363 Y142.427
G1 X97.418 Y118.482 E1.04051
G1 X97.418 Y119.015
G1 X121.303 Y142.9 E1.03792
G1 X121.344 Y143.474
G1 X97.418 Y119.549 E1.03967
G1 X97.418 Y120.082
G1 X121.632 Y144.296 E1.05221
M204 S10000
G1 X123.303 Y146.5 F42000
G1 F3000
M204 S2000
G1 X97.418 Y120.615 E1.12481
G1 X97.418 Y121.148
G1 X123.177 Y146.907 E1.11934
G1 X123.052 Y147.315
G1 X97.418 Y121.682 E1.11388
G1 X97.418 Y122.215
G1 X122.926 Y147.722 E1.10842
G1 X122.77 Y148.1
G1 X97.418 Y122.748 E1.10165
G1 X97.418 Y123.282
G1 X122.237 Y148.1 E1.07848
G1 X121.704 Y148.1
G1 X97.418 Y123.815 E1.0553
G1 X97.418 Y124.348
G1 X121.17 Y148.1 E1.03213
G1 X120.637 Y148.1
G1 X97.418 Y124.881 E1.00896
G1 X97.418 Y125.415
G1 X120.104 Y148.1 E.98578
G1 X119.57 Y148.1
G1 X97.418 Y125.948 E.96261
G1 X97.418 Y126.481
G1 X119.037 Y148.1 E.93944
G1 X118.504 Y148.1
M73 P75 R8
G1 X97.418 Y127.014 E.91626
G1 X97.418 Y127.548
G1 X117.971 Y148.1 E.89309
G1 X117.437 Y148.1
G1 X97.418 Y128.081 E.86992
G1 X97.418 Y128.614
M73 P75 R7
G1 X116.904 Y148.1 E.84674
G1 X116.371 Y148.1
G1 X97.418 Y129.147 E.82357
G1 X97.418 Y129.681
G1 X115.837 Y148.1 E.8004
G1 X115.304 Y148.1
G1 X97.418 Y130.214 E.77722
G1 X97.418 Y130.747
G1 X114.771 Y148.1 E.75405
G1 X114.238 Y148.1
G1 X97.418 Y131.28 E.73088
G1 X97.418 Y131.814
G1 X113.704 Y148.1 E.7077
G1 X113.171 Y148.1
G1 X97.418 Y132.347 E.68453
G1 X97.418 Y132.88
G1 X116.121 Y151.583 E.81271
G1 X115.588 Y151.583
G1 X97.418 Y133.413 E.78954
G1 X97.418 Y133.947
G1 X115.054 Y151.583 E.76637
G1 X114.521 Y151.583
G1 X97.418 Y134.48 E.74319
G1 X97.418 Y135.013
G1 X105.093 Y142.688 E.33352
G1 X104.274 Y142.402
G1 X97.418 Y135.546 E.29793
G1 X97.418 Y136.08
G1 X103.737 Y142.399 E.27459
G1 X103.306 Y142.5
G1 X97.418 Y136.613 E.25584
G1 X97.418 Y137.146
G1 X102.941 Y142.669 E.24
G1 X102.629 Y142.89
G1 X97.418 Y137.679 E.22642
G1 X97.418 Y138.213
G1 X102.364 Y143.158 E.2149
G1 X102.148 Y143.476
G1 X97.418 Y138.746 E.20553
G1 X97.418 Y139.279
G1 X101.987 Y143.848 E.19854
G1 X101.894 Y144.288
G1 X97.418 Y139.813 E.19448
G1 X97.418 Y140.346
G1 X101.913 Y144.841 E.19532
G1 X102.31 Y145.77
G1 X97.418 Y140.879 E.21254
; WIPE_START
M204 S6000
G1 X98.833 Y142.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P76 R7
G1 X106.46 Y142.009 Z3 F42000
G1 X126.081 Y141.279 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X132.902 Y148.1 E.2964
G1 X132.369 Y148.1
G1 X126.622 Y142.353 E.24973
G1 X126.7 Y142.965
G1 X131.836 Y148.1 E.22316
G1 X131.303 Y148.1
G1 X126.661 Y143.459 E.20169
G1 X126.552 Y143.883
G1 X130.769 Y148.1 E.18326
G1 X130.236 Y148.1
G1 X126.391 Y144.255 E.16708
G1 X126.187 Y144.584
G1 X129.703 Y148.1 E.15279
G1 X129.169 Y148.1
G1 X125.944 Y144.874 E.14018
G1 X125.663 Y145.127
G1 X128.636 Y148.1 E.12919
G1 X128.103 Y148.1
G1 X125.35 Y145.347 E.11962
G1 X125.033 Y145.563
G1 X127.57 Y148.1 E.11023
G1 X127.036 Y148.1
G1 X124.716 Y145.78 E.10083
G1 X124.608 Y146.205
G1 X126.503 Y148.1 E.08234
G1 X125.97 Y148.1
G1 X124.846 Y146.976 E.04884
; WIPE_START
M204 S6000
G1 X125.97 Y148.1 E-.60396
G1 X126.38 Y148.1 E-.15604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.033 Y150.165 Z3 F42000
G1 X113.988 Y151.583 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X105.812 Y143.407 E.35529
G1 X106.099 Y144.227
G1 X113.455 Y151.583 E.31963
G1 X112.921 Y151.583
G1 X106.101 Y144.762 E.29639
G1 X106 Y145.194
G1 X112.388 Y151.583 E.27762
G1 X111.855 Y151.583
G1 X105.832 Y145.56 E.26171
G1 X105.612 Y145.873
G1 X111.322 Y151.583 E.24809
G1 X110.788 Y151.583
G1 X105.342 Y146.136 E.23667
G1 X105.025 Y146.352
G1 X110.255 Y151.583 E.22728
G1 X109.722 Y151.583
G1 X104.653 Y146.514 E.22026
G1 X104.211 Y146.605
G1 X109.189 Y151.583 E.21628
G1 X108.655 Y151.583
G1 X103.662 Y146.589 E.21698
G1 X102.733 Y146.193
G1 X108.122 Y151.583 E.23419
G1 X107.589 Y151.583
G1 X97.418 Y141.412 E.44195
G1 X97.418 Y141.946
G1 X107.056 Y151.583 E.41878
G1 X106.522 Y151.583
G1 X97.418 Y142.479 E.39561
G1 X97.418 Y143.012
G1 X105.989 Y151.583 E.37243
G1 X105.456 Y151.583
G1 X97.418 Y143.545 E.34926
G1 X97.418 Y144.079
G1 X104.923 Y151.583 E.32609
G1 X104.389 Y151.583
G1 X97.418 Y144.612 E.30291
G1 X97.422 Y145.149
G1 X103.852 Y151.579 E.27941
G1 X103.282 Y151.542
G1 X97.459 Y145.719 E.25301
G1 X97.561 Y146.354
G1 X102.647 Y151.44 E.22103
G1 X101.915 Y151.241
G1 X97.76 Y147.086 E.18053
G1 X98.148 Y148.007
G1 X100.993 Y150.853 E.12365
; WIPE_START
M204 S6000
G1 X99.579 Y149.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.642 Y142.978 Z3 F42000
G1 X104.005 Y142.4 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0916434
G1 F15000
M204 S6000
G1 X103.813 Y142.323 E.00082
; WIPE_START
G1 X104.005 Y142.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.671 Y146.256 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.23224
G1 F15000
M204 S6000
G1 X102.249 Y145.83 E.00923
; WIPE_START
G1 X102.671 Y146.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.969 Y146.381 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.097053
G1 F15000
M204 S6000
G1 X104.891 Y146.438 E.00042
G1 X104.833 Y146.427 E.00026
; WIPE_START
G1 X104.891 Y146.438 E-.29049
G1 X104.969 Y146.381 E-.46951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.18 Y144.575 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0935224
G1 F15000
M204 S6000
G3 X106.101 Y144.74 I-3.293 J-1.474 E.00076
; WIPE_START
G1 X106.18 Y144.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.873 Y143.346 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.204331
G1 F15000
M204 S6000
G1 X105.519 Y142.949 E.00699
G1 X105.156 Y142.626 E.00639
; WIPE_START
G1 X105.519 Y142.949 E-.36301
G1 X105.873 Y143.346 E-.39699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.413 Y144.528 Z3 F42000
G1 X123.446 Y146.101 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.374272
G1 F10864.577
M204 S6000
G1 X123.236 Y145.927 E.00735
; LINE_WIDTH: 0.330577
G1 F12514.931
G1 X123.027 Y145.754 E.00638
; LINE_WIDTH: 0.286881
G1 F14756.473
G1 X122.817 Y145.58 E.00541
; LINE_WIDTH: 0.243185
G1 F15000
G1 X122.608 Y145.406 E.00444
; LINE_WIDTH: 0.199219
G1 X122.395 Y145.231 E.00351
; LINE_WIDTH: 0.156083
G1 X122 Y144.859 E.00501
G1 X121.724 Y144.55 E.00381
; LINE_WIDTH: 0.211808
G1 X121.571 Y144.357 E.00339
M204 S10000
G1 X121.29 Y143.687 F42000
; LINE_WIDTH: 0.121653
G1 F15000
M204 S6000
G1 X121.358 Y143.46 E.00152
M204 S10000
G1 X121.421 Y143.797 F42000
; LINE_WIDTH: 0.147739
G1 F15000
M204 S6000
G1 X121.276 Y143.541 E.00251
; WIPE_START
G1 X121.421 Y143.797 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.142 Y141.219 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.2305
G1 F15000
M204 S6000
G1 X125.858 Y140.93 E.00619
G1 X125.713 Y140.934 E.00222
M204 S10000
G1 X126.691 Y142.285 F42000
; LINE_WIDTH: 0.115249
G1 F15000
M204 S6000
G1 X126.507 Y141.995 E.00202
M204 S10000
G1 X126.687 Y142.289 F42000
; LINE_WIDTH: 0.182453
G1 F15000
M204 S6000
G2 X126.51 Y141.993 I-11.908 J6.908 E.00392
M204 S10000
G1 X126.738 Y143.382 F42000
; LINE_WIDTH: 0.100723
G1 F15000
M204 S6000
G1 X126.675 Y143.207 E.00088
; WIPE_START
G1 X126.738 Y143.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.257 Y147.351 Z3 F42000
G1 X134.992 Y148.407 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.109742
G1 F15000
M204 S6000
G1 X134.913 Y148.289 E.00077
; LINE_WIDTH: 0.0822781
G1 X134.882 Y148.307 E.00012
; WIPE_START
G1 X134.913 Y148.289 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.55 Y144.52 Z3 F42000
G1 X141.819 Y144.368 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0995249
G1 F15000
M204 S6000
G1 X141.902 Y144.568 E.001
; WIPE_START
G1 X141.819 Y144.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.651 Y146.24 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.227568
G1 F15000
M204 S6000
G1 X142.332 Y145.927 E.00673
G1 X142.338 Y145.783 E.00216
; WIPE_START
G1 X142.332 Y145.927 E-.18479
G1 X142.651 Y146.24 E-.57521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.586 Y146.658 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.125025
G1 F15000
M204 S6000
G3 X143.33 Y146.504 I2.801 J-4.988 E.002
; WIPE_START
G1 X143.586 Y146.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.092 Y145.026 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0949129
G1 F15000
M204 S6000
G3 X146.01 Y145.161 I-2.405 J-1.37 E.00067
; WIPE_START
G1 X146.092 Y145.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.882 Y143.36 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.200563
G1 F15000
M204 S6000
G1 X145.513 Y142.945 E.00713
G1 X145.213 Y142.677 E.00517
G1 X145.181 Y142.679 E.00042
; LINE_WIDTH: 0.178778
G1 X145.069 Y142.691 E.00124
; WIPE_START
G1 X145.181 Y142.679 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.618 Y142.912 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0887353
G1 F15000
M204 S6000
G1 X152.461 Y142.862 E.00062
M204 S10000
G1 X151.631 Y142.97 F42000
; LINE_WIDTH: 0.12917
G1 F15000
M204 S6000
G1 X151.407 Y142.854 E.00177
M204 S10000
G1 X151.715 Y142.885 F42000
; LINE_WIDTH: 0.116368
G1 F15000
M204 S6000
G1 X151.494 Y142.962 E.0014
M204 S10000
G1 X150.944 Y142.806 F42000
; LINE_WIDTH: 0.186457
G1 F15000
M204 S6000
G1 X150.782 Y142.697 E.00228
; LINE_WIDTH: 0.140139
G1 X150.661 Y142.611 E.00118
; LINE_WIDTH: 0.101758
G1 X150.567 Y142.541 E.00056
; WIPE_START
G1 X150.661 Y142.611 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.46 Y141.433 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0908925
G1 F15000
M204 S6000
G1 X149.433 Y141.398 E.00017
; LINE_WIDTH: 0.116845
G1 X149.345 Y141.278 E.00089
; LINE_WIDTH: 0.153154
G1 X149.304 Y141.217 E.00066
; LINE_WIDTH: 0.192896
G1 X149.195 Y141.055 E.00239
; WIPE_START
G1 X149.304 Y141.217 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.502 Y137.038 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.122603
G1 F15000
M204 S6000
G1 X152.281 Y137.114 E.00152
M204 S10000
G1 X152.588 Y137.145 F42000
; LINE_WIDTH: 0.124779
G1 F15000
M204 S6000
G1 X152.365 Y137.029 E.00167
; WIPE_START
G1 X152.588 Y137.145 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.422 Y137.452 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0998226
G1 F15000
M204 S6000
G1 X153.339 Y137.39 E.00048
; LINE_WIDTH: 0.13624
G1 X153.219 Y137.305 E.00112
; LINE_WIDTH: 0.176744
G1 X153.119 Y137.237 E.00131
G1 X152.973 Y137.267 E.00163
; WIPE_START
G1 X153.119 Y137.237 E-.42027
G1 X153.219 Y137.305 E-.33973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.81 Y138.954 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.198586
G1 F15000
M204 S6000
G1 X154.739 Y138.844 E.00166
; LINE_WIDTH: 0.17541
G1 X154.697 Y138.784 E.00079
; LINE_WIDTH: 0.148471
G1 X154.653 Y138.721 E.00066
; LINE_WIDTH: 0.111994
G1 X154.55 Y138.581 E.00098
; WIPE_START
G1 X154.653 Y138.721 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.15 Y145.502 Z3 F42000
G1 X149.834 Y148.049 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0982529
G1 F15000
M204 S6000
G1 X149.755 Y148.155 E.0006
; WIPE_START
G1 X149.834 Y148.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.216 Y148.524 Z3 F42000
G1 X101.447 Y151.066 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.111303
G1 F15000
M204 S6000
G1 X101.333 Y150.988 E.00077
; LINE_WIDTH: 0.157578
G1 X101.22 Y150.91 E.00129
; LINE_WIDTH: 0.199103
G1 X101.055 Y150.791 E.00259
M204 S10000
G1 X100.247 Y150.402 F42000
; LINE_WIDTH: 0.103617
G1 F15000
M204 S6000
G1 X100.092 Y150.272 E.001
; LINE_WIDTH: 0.138844
G1 X99.85 Y150.058 E.00252
; LINE_WIDTH: 0.178318
G3 X98.943 Y149.151 I11.85 J-12.757 E.01415
; LINE_WIDTH: 0.13886
G1 X98.729 Y148.91 E.00252
; LINE_WIDTH: 0.103631
G1 X98.599 Y148.755 E.001
; WIPE_START
G1 X98.729 Y148.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.625 Y144.063 Z3 F42000
G1 X149.406 Y107.249 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.104045
G1 F15000
M204 S6000
G1 X149.273 Y107.091 E.00103
; LINE_WIDTH: 0.139682
G1 X149.059 Y106.849 E.00254
; LINE_WIDTH: 0.17907
G2 X148.152 Y105.942 I-12.989 J12.082 E.01423
; LINE_WIDTH: 0.139697
G1 X147.911 Y105.729 E.00254
; LINE_WIDTH: 0.104051
G1 X147.752 Y105.595 E.00103
; WIPE_START
G1 X147.911 Y105.729 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.068 Y108.448 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.112704
G1 F15000
M204 S6000
G1 X149.986 Y108.328 E.00083
; LINE_WIDTH: 0.16179
G1 X149.904 Y108.208 E.00141
; LINE_WIDTH: 0.202
G1 X149.794 Y108.057 E.00243
; WIPE_START
G1 X149.904 Y108.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.47 Y115.678 Z3 F42000
G1 X155.411 Y134.468 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.208479
M73 P77 R7
G1 F15000
M204 S6000
G1 X155.271 Y134.36 E.00238
; LINE_WIDTH: 0.174418
G1 X155.131 Y134.253 E.00189
; LINE_WIDTH: 0.140082
G1 X155.032 Y134.181 E.00097
; LINE_WIDTH: 0.105473
G1 X154.932 Y134.108 E.00063
; WIPE_START
G1 X155.032 Y134.181 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.463 Y127.434 Z3 F42000
G1 X144.188 Y113.677 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0926179
G1 F15000
M204 S6000
G1 X143.995 Y113.6 E.00084
; WIPE_START
G1 X144.188 Y113.677 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.183 Y111.638 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0938421
G1 F15000
M204 S6000
G1 X146.1 Y111.439 E.0009
; WIPE_START
G1 X146.183 Y111.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.756 Y110.174 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.231583
G1 F15000
M204 S6000
G1 X145.398 Y109.808 E.00788
; LINE_WIDTH: 0.221897
G1 X145.376 Y109.808 E.00032
; LINE_WIDTH: 0.174556
G1 X145.254 Y109.815 E.00131
M204 S10000
G1 X144.663 Y109.49 F42000
; LINE_WIDTH: 0.121909
G1 F15000
M204 S6000
G1 X144.408 Y109.341 E.0019
; WIPE_START
G1 X144.663 Y109.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.99 Y110.844 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.092897
G1 F15000
M204 S6000
G2 X141.908 Y110.979 I2.491 J1.608 E.00064
; WIPE_START
G1 X141.99 Y110.844 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.843 Y113.373 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.204962
G1 F15000
M204 S6000
G1 X142.483 Y113.052 E.00638
G1 X142.132 Y112.656 E.00697
; WIPE_START
G1 X142.483 Y113.052 E-.39694
G1 X142.843 Y113.373 E-.36306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.242 Y112.681 Z3 F42000
G1 X131.989 Y112.384 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.158163
G1 F15000
M204 S6000
G2 X131.817 Y112.212 I-.226 J.054 E.0024
; WIPE_START
G1 X131.9 Y112.247 E-.26554
G1 X131.954 Y112.301 E-.22892
G1 X131.989 Y112.384 E-.26554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.8 Y120.015 Z3 F42000
G1 X131.724 Y123.099 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.10144
G1 F15000
M204 S6000
G1 X131.701 Y123.127 E.00018
G1 X131.814 Y123.219 E.0007
; WIPE_START
G1 X131.701 Y123.127 E-.60576
G1 X131.724 Y123.099 E-.15424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.905 Y119.669 Z3 F42000
G1 X104.672 Y109.493 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.126209
G1 F15000
M204 S6000
G1 X104.415 Y109.342 E.00203
; WIPE_START
G1 X104.672 Y109.493 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.668 Y110.221 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.229383
G1 F15000
M204 S6000
G1 X105.674 Y110.078 E.00218
G1 X105.347 Y109.757 E.00697
; WIPE_START
G1 X105.674 Y110.078 E-.5788
G1 X105.668 Y110.221 E-.1812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.183 Y111.633 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.098636
G1 F15000
M204 S6000
G1 X106.1 Y111.433 E.00098
; WIPE_START
G1 X106.183 Y111.633 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.93 Y113.307 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.173764
G1 F15000
M204 S6000
G1 X102.823 Y113.319 E.00115
; LINE_WIDTH: 0.201324
G1 X102.786 Y113.322 E.00047
G1 X102.489 Y113.055 E.00515
G1 X102.122 Y112.643 E.00712
; WIPE_START
G1 X102.489 Y113.055 E-.42476
G1 X102.786 Y113.322 E-.30711
G1 X102.823 Y113.319 E-.02812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.991 Y110.84 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.094581
G1 F15000
M204 S6000
G2 X101.909 Y110.975 I2.708 J1.748 E.00066
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X101.991 Y110.84 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/53
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-.993 J.703 P1  F42000
G1 X114.499 Y128.498 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.203 Y128.498 E.00981
G1 X114.203 Y127.498 E.03317
G1 X113.781 Y127.498 E.014
G1 X113.781 Y106.977 E.68071
G1 X114.203 Y106.977 E.014
G1 X114.203 Y106.902 E.00249
G1 X114.499 Y106.902 E.00981
G1 X114.499 Y128.438 E.71438
; WIPE_START
G1 X114.203 Y128.498 E-.11472
G1 X114.203 Y127.498 E-.38001
G1 X113.781 Y127.498 E-.16036
G1 X113.781 Y127.222 E-.10491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.647 Y134.853 Z3.2 F42000
G1 X113.405 Y148.616 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X113.098 Y148.616 E.01018
G1 X113.011 Y148.261 E.01212
G1 X113.011 Y148.009 E.00835
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00833
G1 X134.904 Y148.616 E.01212
G1 X113.465 Y148.616 E.71118
M204 S10000
G1 X112.847 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.779 Y149.023 E.00225
G1 X112.604 Y148.297 E.02476
G1 X112.603 Y147.611 E.02276
G1 X112.723 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.323 E.02387
G1 X135.223 Y149.023 E.02392
G1 X112.907 Y149.023 E.74029
; WIPE_START
G1 X112.779 Y149.023 E-.04855
G1 X112.604 Y148.297 E-.28369
G1 X112.603 Y147.611 E-.26076
G1 X112.723 Y147.602 E-.04589
G1 X113.042 Y147.602 E-.12111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.658 Y142.433 Z3.2 F42000
G1 X133.799 Y128.498 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X133.503 Y128.498 E.00981
G1 X133.503 Y106.902 E.71637
G1 X133.799 Y106.902 E.00981
G1 X133.799 Y106.977 E.00249
G1 X134.221 Y106.977 E.014
G1 X134.221 Y127.498 E.68071
G1 X133.799 Y127.498 E.014
G1 X133.799 Y128.438 E.03118
; WIPE_START
G1 X133.503 Y128.498 E-.11472
G1 X133.503 Y126.8 E-.64528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.199 Y132.288 Z3.2 F42000
G1 X112.304 Y148.735 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.611 J-.577 E.01309
G3 X112.214 Y147.652 I6.637 J-.316 E.02054
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.325 Y147.211 E.69492
G3 X135.791 Y147.705 I-.039 J.504 E.02289
G1 X135.79 Y148.32 E.0189
G3 X135.698 Y148.735 I-1.704 J-.163 E.01309
G1 X143.828 Y148.735 E.24983
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.921 J.014 E.18843
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.191 Y127.89 E.01297
G1 X134.191 Y128.89 E.03073
G1 X133.111 Y128.89 E.03319
G1 X133.111 Y107.265 E.66448
G1 X132.211 Y107.265 E.02765
G1 X132.211 Y106.585 E.02089
G1 X133.111 Y106.585 E.02765
G1 X133.111 Y106.51 E.0023
G1 X134.191 Y106.51 E.03319
G1 X134.191 Y106.585 E.0023
G1 X143.823 Y106.585 E.29597
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.604 J-.011 E.22154
G1 X104.179 Y149.415 E1.21816
G3 X99.586 Y144.822 I.011 J-4.604 E.22155
G1 X99.586 Y111.178 E1.03378
G3 X104.179 Y106.585 I4.604 J.011 E.22154
G1 X113.811 Y106.585 E.29597
G1 X113.811 Y106.51 E.0023
G1 X114.891 Y106.51 E.03319
G1 X114.891 Y106.585 E.0023
G1 X115.791 Y106.585 E.02765
G1 X115.791 Y107.265 E.02089
G1 X114.891 Y107.265 E.02765
G1 X114.891 Y128.89 E.66448
G1 X113.811 Y128.89 E.03319
G1 X113.811 Y127.89 E.03073
G1 X113.389 Y127.89 E.01297
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.014 J3.921 E.18843
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.921 J-.014 E.18843
G1 X112.244 Y148.735 E.24799
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15811
G1 X112.214 Y147.652 E-.25389
G1 X112.281 Y147.448 E-.08162
G1 X112.372 Y147.337 E-.05448
G1 X112.559 Y147.232 E-.0815
G1 X112.709 Y147.21 E-.05764
G1 X112.901 Y147.21 E-.07275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
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


G1 X113.233 Y148.312 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.34969
M204 S10000
G1 X135.412 Y149.075 F42000
; LINE_WIDTH: 0.330796
G1 F12505.406
M204 S6000
G1 X143.831 Y149.075 E.19748
G1 X144.248 Y149.054 E.00979
G1 X144.859 Y148.948 E.01455
G1 X145.453 Y148.751 E.01468
G1 X146.008 Y148.472 E.01457
G1 X146.361 Y148.236 E.00995
G1 X146.829 Y147.833 E.0145
G1 X147.114 Y147.518 E.00995
G1 X147.469 Y147.013 E.0145
G1 X147.669 Y146.639 E.00995
G1 X147.893 Y146.059 E.01458
G1 X148.03 Y145.449 E.01467
G1 X148.076 Y144.818 E.01484
G1 X148.076 Y111.182 E.78903
G1 X148.056 Y110.758 E.00995
G1 X147.994 Y110.346 E.00979
G1 X147.893 Y109.941 E.00978
G1 X147.756 Y109.56 E.00951
G2 X143.819 Y106.925 I-3.93 J1.614 E.11789
G1 X134.417 Y106.925 E.22054
; WIPE_START
G1 X136.417 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.407 Y106.925 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.33086
G1 F12502.604
M204 S6000
G1 X133.307 Y106.925 E.02111
M204 S10000
G1 X133.862 Y107.181 F42000
; LINE_WIDTH: 0.35372
G1 F11583.012
M204 S6000
G1 X133.862 Y127.294 E.50941
; WIPE_START
G1 X133.862 Y125.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.269 Y126.064 Z3.2 F42000
G1 X114.14 Y127.294 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F11583.012
M204 S6000
G1 X114.14 Y107.181 E.50941
M204 S10000
G1 X114.695 Y106.925 F42000
; LINE_WIDTH: 0.33086
G1 F12502.604
M204 S6000
G1 X115.595 Y106.925 E.02111
; WIPE_START
G1 X114.695 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.585 Y106.925 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.330791
G1 F12505.596
M204 S6000
G1 X104.168 Y106.925 E.22091
G1 X103.552 Y106.971 E.01448
G1 X102.926 Y107.113 E.01507
G1 X102.549 Y107.249 E.00939
G1 X102.176 Y107.425 E.0097
G1 X101.645 Y107.762 E.01474
G1 X101.171 Y108.17 E.01467
G1 X100.763 Y108.643 E.01464
G1 X100.428 Y109.172 E.01469
G1 X100.173 Y109.746 E.01475
G1 X100.005 Y110.364 E.01501
G1 X99.947 Y110.758 E.00935
G1 X99.926 Y111.167 E.00959
G1 X99.926 Y144.817 E.78936
G1 X99.973 Y145.452 E.01494
G1 X100.054 Y145.857 E.00969
G1 X100.169 Y146.241 E.0094
G1 X100.335 Y146.645 E.01024
G1 X100.642 Y147.186 E.0146
G1 X100.893 Y147.524 E.00987
G1 X101.322 Y147.974 E.01458
G1 X101.647 Y148.241 E.00987
G1 X102.173 Y148.573 E.01458
G1 X102.554 Y148.753 E.00989
G1 X103.147 Y148.948 E.01465
G1 X103.556 Y149.029 E.00978
G1 X104.171 Y149.075 E.01447
G1 X112.59 Y149.075 E.19748
; WIPE_START
G1 X110.59 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.045 Y141.848 Z3.2 F42000
G1 X117.211 Y129.59 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.221 Y136.608 Z3.2 F42000
G1 X126.058 Y142.964 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.061 Y143 E.00111
G3 X125.207 Y142.246 I-.76 J0 E.10709
G1 X125.282 Y142.24 E.00233
G3 X126.046 Y142.849 I.019 J.76 E.0326
G1 X126.052 Y142.904 E.00171
; WIPE_START
M204 S6000
G1 X126.061 Y143 E-.03651
G1 X126.046 Y143.151 E-.05754
G1 X126.001 Y143.298 E-.05852
G1 X125.858 Y143.517 E-.09932
G1 X125.745 Y143.617 E-.05749
G1 X125.614 Y143.693 E-.05764
G1 X125.47 Y143.741 E-.05743
G1 X125.32 Y143.76 E-.0576
G1 X125.169 Y143.749 E-.0575
G1 X125.023 Y143.708 E-.05755
G1 X124.889 Y143.639 E-.05751
G1 X124.77 Y143.544 E-.05747
G1 X124.694 Y143.444 E-.04792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.396 Y142.311 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X122.607 Y142.246 E.00677
G1 X122.682 Y142.24 E.00233
G3 X122.34 Y142.331 I.019 J.76 E.1357
; WIPE_START
M204 S6000
G1 X122.607 Y142.246 E-.10646
G1 X122.682 Y142.24 E-.02882
G1 X122.833 Y142.251 E-.05751
G1 X122.979 Y142.292 E-.05753
G1 X123.114 Y142.361 E-.05753
G1 X123.232 Y142.456 E-.05748
G1 X123.329 Y142.572 E-.05754
G1 X123.402 Y142.705 E-.05756
M73 P78 R7
G1 X123.446 Y142.849 E-.05737
G1 X123.461 Y143 E-.05769
G1 X123.446 Y143.151 E-.05756
G1 X123.401 Y143.298 E-.05852
G1 X123.331 Y143.405 E-.04843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.69 Y146.341 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X124.091 Y139.411 I1.31 J-3.342 E.30809
G1 X124.266 Y139.42 E.0054
G3 X122.746 Y146.363 I-.267 J3.579 E.37765
; WIPE_START
M204 S6000
G1 X122.363 Y146.194 E-.15879
G1 X121.905 Y145.915 E-.20381
G1 X121.626 Y145.692 E-.13596
G1 X121.369 Y145.442 E-.13605
G1 X121.157 Y145.189 E-.12539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.953 Y146.245 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X127.246 Y143.952 E.09966
G1 X127.37 Y143.295
G1 X124.296 Y146.369 E.13359
G1 X123.758 Y146.373
G1 X127.374 Y142.757 E.15714
G1 X127.308 Y142.29
G1 X126.164 Y143.434 E.04969
G1 X126.251 Y142.814
G1 X127.19 Y141.875 E.04083
G1 X127.032 Y141.5
G1 X126.09 Y142.441 E.04091
G1 X125.817 Y142.181
G1 X126.838 Y141.16 E.04438
G1 X126.613 Y140.852
G1 X125.424 Y142.041 E.05168
; WIPE_START
M204 S6000
G1 X126.613 Y140.852 E-.63908
G1 X126.801 Y141.109 E-.12092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.733 Y143.865 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X123.292 Y146.306 E.1061
G1 X122.876 Y146.189
G1 X125.116 Y143.949 E.09733
G1 X124.742 Y143.789
G1 X122.501 Y146.031 E.09741
G1 X122.161 Y145.838
G1 X124.483 Y143.515 E.10092
G1 X124.342 Y143.123
G1 X121.853 Y145.612 E.10815
G1 X121.576 Y145.356
G1 X123.017 Y143.914 E.06265
G1 X122.462 Y143.937
G1 X121.328 Y145.071 E.04928
G1 X121.11 Y144.755
G1 X122.104 Y143.761 E.04319
G1 X121.858 Y143.474
G1 X120.926 Y144.406 E.0405
G1 X120.777 Y144.022
G1 X121.736 Y143.062 E.04168
; WIPE_START
M204 S6000
G1 X120.777 Y144.022 E-.51546
G1 X120.926 Y144.406 E-.15667
G1 X121.089 Y144.243 E-.08787
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.614 Y143.317 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X126.358 Y140.574 E.11922
G1 X126.072 Y140.327
G1 X123.638 Y142.761 E.10578
G1 X123.462 Y142.403
G1 X125.756 Y140.109 E.09968
G1 X125.408 Y139.924
G1 X123.175 Y142.157 E.09703
G1 X122.764 Y142.035
G1 X125.022 Y139.776 E.09813
G1 X124.595 Y139.67
G1 X120.672 Y143.593 E.17048
G1 X120.621 Y143.111
G1 X124.112 Y139.62 E.1517
G1 X123.551 Y139.648
G1 X120.65 Y142.549 E.12606
G1 X120.823 Y141.843
G1 X122.842 Y139.823 E.08777
; WIPE_START
M204 S6000
G1 X121.428 Y141.238 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.69 Y141.961 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129366
G1 F15000
M204 S6000
G1 X122.496 Y142.055 E.00152
M204 S10000
G1 X122.778 Y142.049 F42000
; LINE_WIDTH: 0.12954
G1 F15000
M204 S6000
G1 X122.568 Y141.965 E.0016
; WIPE_START
G1 X122.778 Y142.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.281 Y140.09 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.101428
G1 F15000
M204 S6000
G1 X122.175 Y140.173 E.00064
; LINE_WIDTH: 0.130371
G1 X122.046 Y140.28 E.0012
; LINE_WIDTH: 0.176557
G2 X121.336 Y140.981 I4.898 J5.67 E.01087
; LINE_WIDTH: 0.145035
G1 X121.227 Y141.109 E.0014
; LINE_WIDTH: 0.108528
G2 X121.09 Y141.281 I3.358 J2.821 E.00118
; WIPE_START
G1 X121.227 Y141.109 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.196 Y139.869 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0888667
G1 F15000
M204 S6000
G1 X125.055 Y139.785 E.00062
; WIPE_START
G1 X125.196 Y139.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.07 Y144.421 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0934737
G1 F15000
M204 S6000
G1 X127.04 Y144.464 E.00021
; LINE_WIDTH: 0.111973
G1 X126.99 Y144.532 E.00048
; LINE_WIDTH: 0.138317
G1 X126.94 Y144.601 E.00066
; LINE_WIDTH: 0.173375
G1 X126.838 Y144.734 E.00178
; LINE_WIDTH: 0.21282
G1 X126.734 Y144.863 E.0023
; LINE_WIDTH: 0.255038
M73 P78 R6
G3 X126.518 Y145.112 I-5.108 J-4.232 E.0057
; LINE_WIDTH: 0.276572
G3 X125.928 Y145.68 I-5.037 J-4.64 E.0156
; LINE_WIDTH: 0.229432
G1 X125.8 Y145.785 E.00252
; LINE_WIDTH: 0.194179
G1 X125.669 Y145.889 E.00207
; LINE_WIDTH: 0.150246
G1 X125.533 Y145.99 E.00148
; LINE_WIDTH: 0.107146
G1 X125.423 Y146.069 E.00071
; WIPE_START
G1 X125.533 Y145.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.154 Y143.424 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.164349
G1 F15000
M204 S6000
G1 X126.166 Y143.526 E.00102
; LINE_WIDTH: 0.183304
G1 X126.168 Y143.547 E.00023
; LINE_WIDTH: 0.209516
G1 X126.17 Y143.567 E.00028
G1 X126.052 Y143.702 E.00243
G1 X125.796 Y143.927 E.00463
; WIPE_START
G1 X126.052 Y143.702 E-.47933
G1 X126.17 Y143.567 E-.25188
G1 X126.168 Y143.547 E-.02879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.679 Y143.382 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.187218
G1 F15000
M204 S6000
G1 X123.503 Y143.611 E.0034
; LINE_WIDTH: 0.162233
G1 X123.209 Y143.887 E.00392
; LINE_WIDTH: 0.183835
G3 X123.122 Y143.924 I-.062 J-.025 E.00121
G1 X123.007 Y143.904 E.00134
; WIPE_START
G1 X123.122 Y143.924 E-.40784
G1 X123.151 Y143.929 E-.10184
G1 X123.209 Y143.887 E-.25032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.756 Y143.776 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0985307
G1 F15000
M204 S6000
G1 X120.673 Y143.617 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.756 Y143.776 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/53
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.2 I1.126 J-.461 P1  F42000
G1 X114.499 Y128.498 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.203 Y128.498 E.00981
G1 X114.203 Y127.498 E.03317
G1 X113.781 Y127.498 E.014
G1 X113.781 Y106.977 E.68071
G1 X114.203 Y106.977 E.014
G1 X114.203 Y106.902 E.00249
G1 X114.499 Y106.902 E.00981
G1 X114.499 Y128.438 E.71438
; WIPE_START
G1 X114.203 Y128.498 E-.11472
G1 X114.203 Y127.498 E-.38001
G1 X113.781 Y127.498 E-.16036
G1 X113.781 Y127.222 E-.10491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.647 Y134.853 Z3.4 F42000
G1 X113.405 Y148.616 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X113.098 Y148.616 E.01019
G1 X113.011 Y148.261 E.01212
G1 X113.011 Y148.009 E.00835
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00833
G1 X134.904 Y148.616 E.01212
G1 X113.465 Y148.616 E.71116
M204 S10000
G1 X112.847 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.779 Y149.023 E.00225
G1 X112.604 Y148.297 E.02477
G1 X112.603 Y147.611 E.02275
G1 X112.723 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.323 E.02389
G1 X135.223 Y149.023 E.02391
G1 X112.907 Y149.023 E.74027
; WIPE_START
G1 X112.779 Y149.023 E-.04858
G1 X112.604 Y148.297 E-.2838
G1 X112.603 Y147.611 E-.26067
G1 X112.723 Y147.602 E-.04589
G1 X113.042 Y147.602 E-.12106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.658 Y142.433 Z3.4 F42000
G1 X133.799 Y128.498 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X133.503 Y128.498 E.00981
G1 X133.503 Y106.902 E.71637
G1 X133.799 Y106.902 E.00981
G1 X133.799 Y106.977 E.00249
G1 X134.221 Y106.977 E.014
G1 X134.221 Y127.498 E.68071
G1 X133.799 Y127.498 E.014
G1 X133.799 Y128.438 E.03118
; WIPE_START
G1 X133.503 Y128.498 E-.11472
G1 X133.503 Y126.8 E-.64528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.199 Y132.288 Z3.4 F42000
G1 X112.305 Y148.735 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.615 J-.579 E.0131
G3 X112.214 Y147.652 I6.652 J-.316 E.02054
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.323 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02296
G1 X135.79 Y148.32 E.0189
G3 X135.698 Y148.735 I-1.708 J-.164 E.0131
G1 X143.828 Y148.735 E.24984
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.921 J.014 E.18843
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.191 Y127.89 E.01297
G1 X134.191 Y128.89 E.03073
G1 X133.111 Y128.89 E.03319
G1 X133.111 Y107.265 E.66448
G1 X132.211 Y107.265 E.02765
G1 X132.211 Y106.585 E.02089
G1 X133.111 Y106.585 E.02765
G1 X133.111 Y106.51 E.0023
G1 X134.191 Y106.51 E.03319
G1 X134.191 Y106.585 E.0023
G1 X143.823 Y106.585 E.29597
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.604 J-.011 E.22154
G1 X104.179 Y149.415 E1.21816
G3 X99.586 Y144.822 I.011 J-4.604 E.22154
G1 X99.586 Y111.178 E1.03379
G3 X104.179 Y106.585 I4.604 J.011 E.22154
G1 X113.811 Y106.585 E.29597
G1 X113.811 Y106.51 E.0023
G1 X114.891 Y106.51 E.03319
G1 X114.891 Y106.585 E.0023
G1 X115.791 Y106.585 E.02765
G1 X115.791 Y107.265 E.02089
G1 X114.891 Y107.265 E.02765
G1 X114.891 Y128.89 E.66448
G1 X113.811 Y128.89 E.03319
G1 X113.811 Y127.89 E.03073
G1 X113.389 Y127.89 E.01297
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.014 J3.921 E.18843
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.921 J-.014 E.18843
G1 X112.245 Y148.735 E.24799
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15814
G1 X112.214 Y147.652 E-.25388
G1 X112.281 Y147.448 E-.08154
G1 X112.372 Y147.337 E-.05461
G1 X112.559 Y147.232 E-.08149
G1 X112.709 Y147.21 E-.05761
G1 X112.901 Y147.21 E-.07274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
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


G1 X113.233 Y148.313 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.34969
M204 S10000
G1 X135.412 Y149.075 F42000
; LINE_WIDTH: 0.330794
G1 F12505.507
M204 S6000
G1 X143.819 Y149.075 E.1972
G1 X144.25 Y149.054 E.01012
G2 X148.076 Y144.818 I-.427 J-4.232 E.14679
G1 X148.076 Y111.182 E.78902
G1 X148.055 Y110.751 E.01012
G2 X143.819 Y106.925 I-4.232 J.427 E.14679
G1 X134.417 Y106.925 E.22054
; WIPE_START
G1 X136.417 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.407 Y106.925 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.33086
G1 F12502.604
M204 S6000
G1 X133.307 Y106.925 E.02111
M204 S10000
G1 X133.862 Y107.181 F42000
; LINE_WIDTH: 0.35372
G1 F11583.012
M204 S6000
G1 X133.862 Y127.294 E.50941
; WIPE_START
G1 X133.862 Y125.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.269 Y126.064 Z3.4 F42000
G1 X114.14 Y127.294 Z3.4
G1 Z3
G1 E.8 F1800
G1 F11583.012
M204 S6000
G1 X114.14 Y107.181 E.50941
M204 S10000
G1 X114.695 Y106.925 F42000
; LINE_WIDTH: 0.33086
G1 F12502.604
M204 S6000
G1 X115.595 Y106.925 E.02111
; WIPE_START
G1 X114.695 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.585 Y106.925 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.330785
G1 F12505.865
M204 S6000
G1 X103.968 Y106.93 E.2256
G1 X103.35 Y107.006 E.01459
G1 X102.898 Y107.123 E.01097
G1 X102.359 Y107.333 E.01356
G1 X101.989 Y107.532 E.00986
G2 X99.926 Y111.182 I2.192 J3.647 E.10283
G1 X99.926 Y144.818 E.789
G1 X99.944 Y145.2 E.00898
M73 P79 R6
G2 X104.183 Y149.075 I4.232 J-.374 E.14795
G1 X112.59 Y149.075 E.19719
; WIPE_START
G1 X110.59 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.046 Y141.848 Z3.4 F42000
G1 X117.211 Y129.59 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.821 Y135.734 Z3.4 F42000
G1 X121.511 Y141.551 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.54 Y141.496 E.00193
G3 X123.929 Y140.116 I2.461 J1.504 E.0884
G1 X124.073 Y140.116 E.00442
G3 X121.343 Y141.879 I-.072 J2.884 E.45083
G1 X121.483 Y141.605 E.00948
; WIPE_START
M204 S6000
G1 X121.54 Y141.496 E-.0467
G1 X121.701 Y141.258 E-.10916
G1 X121.886 Y141.038 E-.10934
G1 X122.092 Y140.837 E-.10938
G1 X122.317 Y140.658 E-.10916
G1 X122.559 Y140.501 E-.10938
G1 X122.814 Y140.37 E-.10919
G1 X122.956 Y140.315 E-.05768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.895 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.581 Y143.179 E.00871
G3 X124.091 Y139.411 I-3.585 J-.179 E.51711
G1 X124.26 Y139.42 E.00521
G3 X127.581 Y142.821 I-.264 J3.58 E.15967
G1 X127.582 Y142.835 E.00043
M204 S10000
G1 X127.231 Y142.853 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355511
G1 F11516.672
M204 S6000
G1 X127.239 Y143 E.00375
G1 X127.222 Y143.322 E.00823
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.258 E.00822
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.317 E.00822
G1 X126.019 Y145.531 E.00823
G1 X125.757 Y145.72 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.563 Y146.188 E.00822
G1 X124.243 Y146.228 E.00822
G1 X123.924 Y146.236 E.00812
G1 X123.599 Y146.212 E.00832
G1 X123.284 Y146.157 E.00813
G1 X122.815 Y146.012 E.01252
G1 X122.524 Y145.881 E.00812
G1 X122.245 Y145.72 E.00822
G1 X121.983 Y145.531 E.00822
G1 X121.738 Y145.315 E.00831
G1 X121.527 Y145.088 E.00791
G1 X121.326 Y144.824 E.00844
G1 X121.158 Y144.549 E.00821
G1 X121.018 Y144.257 E.00823
G1 X120.908 Y143.955 E.00821
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.742 E.00823
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00822
G1 X121.74 Y140.683 E.00821
G1 X121.983 Y140.469 E.00823
G1 X122.244 Y140.281 E.00821
G1 X122.524 Y140.119 E.00822
G1 X122.818 Y139.986 E.00822
G1 X123.124 Y139.883 E.00823
G1 X123.439 Y139.812 E.00821
G1 X123.759 Y139.772 E.00822
G1 X124.078 Y139.764 E.00812
G1 X124.567 Y139.812 E.01253
G1 X124.878 Y139.883 E.00812
G1 X125.187 Y139.988 E.00832
G1 X125.478 Y140.119 E.00813
G1 X125.758 Y140.281 E.00822
G1 X126.02 Y140.469 E.00822
G1 X126.264 Y140.685 E.00831
G1 X126.481 Y140.919 E.00813
G1 X126.676 Y141.176 E.00823
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.743 E.00823
G1 X127.095 Y142.046 E.00821
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.228 Y142.793 E.00294
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.672
G1 X127.239 Y143 E-.07872
G1 X127.222 Y143.322 E-.12271
G1 X127.174 Y143.642 E-.12264
G1 X127.095 Y143.954 E-.12262
G1 X126.984 Y144.258 E-.12268
G1 X126.844 Y144.548 E-.12266
G1 X126.751 Y144.701 E-.06797
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/53
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I-.343 J-1.168 P1  F42000
G1 X113.404 Y148.616 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X113.098 Y148.616 E.01017
G1 X113.011 Y148.261 E.01211
G1 X113.011 Y148.009 E.00836
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00834
G1 X134.904 Y148.616 E.01211
G1 X113.464 Y148.616 E.7112
M204 S10000
G1 X112.846 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.779 Y149.023 E.00225
G1 X112.604 Y148.297 E.02476
G1 X112.603 Y147.611 E.02277
G1 X112.724 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.323 E.02389
G1 X135.224 Y149.023 E.0239
G1 X112.906 Y149.023 E.74031
M204 S250
G1 X112.304 Y148.735 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.625 J-.58 E.01309
G3 X112.214 Y147.652 I6.629 J-.316 E.02055
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.323 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02296
G1 X135.79 Y148.32 E.01891
G3 X135.698 Y148.735 I-1.717 J-.165 E.01309
G1 X143.828 Y148.735 E.24983
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.919 J.011 E.18846
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.191 Y127.89 E.01297
G1 X134.191 Y128.89 E.03073
G1 X133.111 Y128.89 E.03319
G1 X133.111 Y107.265 E.66448
G1 X132.211 Y107.265 E.02765
G1 X132.211 Y106.585 E.02089
G1 X133.111 Y106.585 E.02765
G1 X133.111 Y106.51 E.0023
G1 X134.191 Y106.51 E.03319
G1 X134.191 Y106.585 E.0023
G1 X143.823 Y106.585 E.29597
G3 X148.416 Y111.178 I-.001 J4.594 E.22167
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.594 J-.001 E.22167
G1 X104.179 Y149.415 E1.21816
G3 X103.197 Y149.308 I.017 J-4.711 E.0304
G3 X99.586 Y144.822 I.981 J-4.486 E.19126
G1 X99.586 Y111.178 E1.03379
G3 X101.744 Y107.284 I4.624 J.018 E.14273
G3 X104.179 Y106.585 I2.436 J3.895 E.07886
G1 X113.811 Y106.585 E.29597
G1 X113.811 Y106.51 E.0023
G1 X114.891 Y106.51 E.03319
G1 X114.891 Y106.585 E.0023
G1 X115.791 Y106.585 E.02765
G1 X115.791 Y107.265 E.02089
G1 X114.891 Y107.265 E.02765
G1 X114.891 Y128.89 E.66448
G1 X113.811 Y128.89 E.03319
G1 X113.811 Y127.89 E.03073
G1 X113.389 Y127.89 E.01297
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.014 J3.921 E.18843
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.919 J-.011 E.18846
G1 X112.244 Y148.735 E.24799
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15803
G1 X112.214 Y147.652 E-.25403
G1 X112.281 Y147.448 E-.08154
G1 X112.372 Y147.337 E-.0545
G1 X112.559 Y147.232 E-.08148
G1 X112.709 Y147.21 E-.05768
G1 X112.901 Y147.21 E-.07275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
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


G1 X113.233 Y148.313 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.34969
M204 S10000
G1 X135.413 Y149.075 F42000
; LINE_WIDTH: 0.330834
G1 F12503.748
M204 S6000
G1 X143.819 Y149.075 E.19722
G1 X144.251 Y149.054 E.01015
G2 X148.076 Y144.818 I-.428 J-4.232 E.14678
G1 X148.076 Y111.182 E.78913
G1 X148.055 Y110.75 E.01015
G2 X143.819 Y106.925 I-4.236 J.433 E.14675
G1 X135.149 Y106.925 E.2034
; WIPE_START
G1 X137.149 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.023 Y114.474 Z3.6 F42000
G1 X133.984 Y128.149 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X133.45 Y128.683 E.0232
G1 X133.318 Y128.281
G1 X134.406 Y127.193 E.04725
G1 X134.406 Y126.66
G1 X133.318 Y127.747 E.04725
G1 X133.318 Y127.214
G1 X134.406 Y126.127 E.04725
G1 X134.406 Y125.594
G1 X133.318 Y126.681 E.04725
G1 X133.318 Y126.148
G1 X134.406 Y125.06 E.04725
G1 X134.406 Y124.527
G1 X133.318 Y125.614 E.04725
G1 X133.318 Y125.081
G1 X134.406 Y123.994 E.04725
G1 X134.406 Y123.461
G1 X133.318 Y124.548 E.04725
G1 X133.318 Y124.015
G1 X134.406 Y122.927 E.04725
G1 X134.406 Y122.394
G1 X133.318 Y123.481 E.04725
G1 X133.318 Y122.948
G1 X134.406 Y121.861 E.04725
G1 X134.406 Y121.328
G1 X133.318 Y122.415 E.04725
G1 X133.318 Y121.882
G1 X134.406 Y120.794 E.04725
G1 X134.406 Y120.261
G1 X133.318 Y121.348 E.04725
G1 X133.318 Y120.815
G1 X134.406 Y119.728 E.04725
G1 X134.406 Y119.195
G1 X133.318 Y120.282 E.04725
G1 X133.318 Y119.749
G1 X134.406 Y118.661 E.04725
G1 X134.406 Y118.128
G1 X133.318 Y119.215 E.04725
G1 X133.318 Y118.682
G1 X134.406 Y117.595 E.04725
G1 X134.406 Y117.062
G1 X133.318 Y118.149 E.04725
G1 X133.318 Y117.616
G1 X134.406 Y116.528 E.04725
G1 X134.406 Y115.995
G1 X133.318 Y117.082 E.04725
G1 X133.318 Y116.549
G1 X134.406 Y115.462 E.04725
G1 X134.406 Y114.929
G1 X133.318 Y116.016 E.04725
G1 X133.318 Y115.482
G1 X134.406 Y114.395 E.04725
G1 X134.406 Y113.862
G1 X133.318 Y114.949 E.04725
G1 X133.318 Y114.416
G1 X134.406 Y113.329 E.04725
G1 X134.406 Y112.795
G1 X133.318 Y113.883 E.04725
G1 X133.318 Y113.349
G1 X134.406 Y112.262 E.04725
G1 X134.406 Y111.729
G1 X133.318 Y112.816 E.04725
G1 X133.318 Y112.283
G1 X134.406 Y111.196 E.04725
G1 X134.406 Y110.662
G1 X133.318 Y111.75 E.04725
G1 X133.318 Y111.216
G1 X134.406 Y110.129 E.04725
G1 X134.406 Y109.596
G1 X133.318 Y110.683 E.04725
G1 X133.318 Y110.15
G1 X134.406 Y109.063 E.04725
G1 X134.406 Y108.529
G1 X133.318 Y109.617 E.04725
G1 X133.318 Y109.083
G1 X134.406 Y107.996 E.04725
G1 X134.406 Y107.463
G1 X133.318 Y108.55 E.04725
G1 X133.318 Y108.017
G1 X134.406 Y106.93 E.04725
G1 X134.01 Y106.792
G1 X133.318 Y107.484 E.03004
; WIPE_START
M204 S6000
G1 X134.01 Y106.792 E-.37148
G1 X134.406 Y106.93 E-.15926
G1 X133.979 Y107.356 E-.22926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.348 Y107.2 Z3.6 F42000
G1 X112.853 Y106.925 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.330834
G1 F12503.742
M204 S6000
G1 X104.171 Y106.925 E.20369
G1 X103.556 Y106.971 E.01448
G1 X103.136 Y107.054 E.01005
G2 X99.926 Y111.182 I1.04 J4.121 E.13213
G1 X99.926 Y144.818 E.78913
G1 X99.947 Y145.242 E.00996
G1 X100.038 Y145.788 E.013
G2 X104.183 Y149.075 I4.141 J-.965 E.13396
G1 X112.589 Y149.075 E.19722
; WIPE_START
M73 P80 R6
G1 X110.589 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.062 Y141.586 Z3.6 F42000
G1 X114.684 Y128.251 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X114.253 Y128.683 E.01874
G1 X114.018 Y128.383
G1 X114.684 Y127.718 E.02891
G1 X114.684 Y127.185
G1 X114.018 Y127.85 E.02891
G1 X113.653 Y127.683
G1 X114.684 Y126.652 E.0448
G1 X114.684 Y126.118
G1 X113.596 Y127.206 E.04725
G1 X113.596 Y126.672
G1 X114.684 Y125.585 E.04724
G1 X114.684 Y125.052
G1 X113.596 Y126.139 E.04724
G1 X113.596 Y125.606
G1 X114.684 Y124.519 E.04725
G1 X114.684 Y123.985
G1 X113.596 Y125.073 E.04725
G1 X113.596 Y124.539
G1 X114.684 Y123.452 E.04724
G1 X114.684 Y122.919
G1 X113.596 Y124.006 E.04724
G1 X113.596 Y123.473
G1 X114.684 Y122.386 E.04725
G1 X114.684 Y121.852
G1 X113.596 Y122.94 E.04725
G1 X113.596 Y122.406
G1 X114.684 Y121.319 E.04724
G1 X114.684 Y120.786
G1 X113.596 Y121.873 E.04724
G1 X113.596 Y121.34
G1 X114.684 Y120.253 E.04725
G1 X114.684 Y119.719
G1 X113.596 Y120.807 E.04725
G1 X113.596 Y120.273
G1 X114.684 Y119.186 E.04724
G1 X114.684 Y118.653
G1 X113.596 Y119.74 E.04724
G1 X113.596 Y119.207
G1 X114.684 Y118.12 E.04725
G1 X114.684 Y117.586
G1 X113.596 Y118.673 E.04724
G1 X113.596 Y118.14
G1 X114.684 Y117.053 E.04724
G1 X114.684 Y116.52
G1 X113.596 Y117.607 E.04724
G1 X113.596 Y117.074
G1 X114.684 Y115.987 E.04725
G1 X114.684 Y115.453
G1 X113.596 Y116.54 E.04725
G1 X113.596 Y116.007
G1 X114.684 Y114.92 E.04725
G1 X114.684 Y114.387
G1 X113.596 Y115.474 E.04725
G1 X113.596 Y114.941
G1 X114.684 Y113.853 E.04725
G1 X114.684 Y113.32
G1 X113.596 Y114.407 E.04725
G1 X113.596 Y113.874
G1 X114.684 Y112.787 E.04725
G1 X114.684 Y112.254
G1 X113.596 Y113.341 E.04725
G1 X113.596 Y112.808
G1 X114.684 Y111.72 E.04725
G1 X114.684 Y111.187
G1 X113.596 Y112.274 E.04725
G1 X113.596 Y111.741
G1 X114.684 Y110.654 E.04725
G1 X114.684 Y110.121
G1 X113.596 Y111.208 E.04725
G1 X113.596 Y110.675
G1 X114.684 Y109.587 E.04725
G1 X114.684 Y109.054
G1 X113.596 Y110.141 E.04725
G1 X113.596 Y109.608
G1 X114.684 Y108.521 E.04725
G1 X114.684 Y107.988
G1 X113.596 Y109.075 E.04725
G1 X113.596 Y108.542
G1 X114.684 Y107.454 E.04725
G1 X114.684 Y106.921
G1 X113.596 Y108.008 E.04725
G1 X113.596 Y107.475
G1 X114.354 Y106.717 E.03293
M204 S10000
G1 X114.703 Y106.751 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151057
G1 F15000
M204 S6000
G1 X114.513 Y106.751 E.00167
G1 X114.424 Y106.788 E.00085
; WIPE_START
G1 X114.513 Y106.751 E-.25627
G1 X114.703 Y106.751 E-.50373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.536 Y114.338 Z3.6 F42000
G1 X117.211 Y129.59 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.821 Y135.734 Z3.6 F42000
G1 X121.545 Y141.494 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.00428
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45967
G1 X121.513 Y141.545 E.00271
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.07577
G1 X121.791 Y141.145 E-.10927
G1 X121.982 Y140.94 E-.10656
G1 X122.317 Y140.658 E-.16656
G1 X122.559 Y140.501 E-.10933
G1 X122.815 Y140.37 E-.10929
G1 X123.018 Y140.29 E-.08322
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.903 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.578 Y143.179 E.00846
G3 X124.091 Y139.411 I-3.585 J-.179 E.5172
G1 X124.254 Y139.419 E.00502
G3 X127.578 Y142.822 I-.26 J3.58 E.15977
G1 X127.581 Y142.844 E.00068
M204 S10000
G1 X127.232 Y142.861 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355513
G1 F11516.575
M204 S6000
G1 X127.239 Y143 E.00354
G1 X127.222 Y143.322 E.00822
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00821
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00823
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.318 E.00821
G1 X126.02 Y145.531 E.00822
G1 X125.757 Y145.72 E.00822
G1 X125.478 Y145.881 E.00821
G1 X125.184 Y146.014 E.00822
G1 X124.878 Y146.117 E.00823
G1 X124.563 Y146.188 E.00821
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.598 Y146.212 E.00833
G1 X123.281 Y146.156 E.00822
G1 X122.97 Y146.069 E.00822
G1 X122.67 Y145.951 E.00822
G1 X122.383 Y145.804 E.00821
G1 X122.111 Y145.629 E.00823
G1 X121.859 Y145.428 E.00822
G1 X121.63 Y145.205 E.00814
G1 X121.42 Y144.955 E.00831
G1 X121.241 Y144.691 E.00813
G1 X121.016 Y144.254 E.01252
G1 X120.908 Y143.954 E.00812
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y142.996 E.00832
G1 X120.78 Y142.678 E.00812
G1 X120.828 Y142.358 E.00823
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.742 E.00823
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00823
G1 X121.741 Y140.683 E.00822
G1 X121.983 Y140.469 E.00822
G1 X122.245 Y140.28 E.00823
G1 X122.524 Y140.119 E.00821
G1 X122.818 Y139.986 E.00822
G1 X123.125 Y139.883 E.00823
G1 X123.439 Y139.812 E.00821
G1 X123.759 Y139.772 E.00823
G1 X124.078 Y139.764 E.00812
G1 X124.567 Y139.812 E.01253
G1 X124.878 Y139.883 E.00811
G1 X125.187 Y139.988 E.00833
G1 X125.478 Y140.119 E.00813
G1 X125.757 Y140.28 E.00821
G1 X126.02 Y140.469 E.00823
G1 X126.264 Y140.685 E.00832
G1 X126.481 Y140.919 E.00813
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.451 E.00822
G1 X126.984 Y141.742 E.00823
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.229 Y142.801 E.00315
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.575
G1 X127.239 Y143 E-.07567
G1 X127.222 Y143.322 E-.12262
G1 X127.174 Y143.642 E-.12269
G1 X127.095 Y143.954 E-.12268
G1 X126.984 Y144.257 E-.12255
G1 X126.844 Y144.548 E-.1227
G1 X126.747 Y144.708 E-.07109
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/53
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.6 I-.342 J-1.168 P1  F42000
G1 X113.409 Y148.616 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X113.099 Y148.616 E.01027
G1 X113.011 Y148.261 E.01215
G1 X113.011 Y148.009 E.00834
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00833
G1 X134.904 Y148.616 E.01212
G1 X113.469 Y148.616 E.71104
M204 S10000
G1 X112.849 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.781 Y149.023 E.00227
G1 X112.604 Y148.297 E.02478
G1 X112.603 Y147.611 E.02276
G1 X112.723 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.323 E.02388
G1 X135.223 Y149.023 E.02392
G1 X112.909 Y149.023 E.74019
M204 S250
G1 X112.305 Y148.735 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.592 J-.577 E.01309
G3 X112.214 Y147.652 I6.656 J-.316 E.02054
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.323 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02297
G1 X135.79 Y148.32 E.01891
G3 X135.698 Y148.735 I-1.706 J-.164 E.01309
G1 X143.828 Y148.735 E.24984
G2 X147.736 Y144.827 I-.005 J-3.913 E.18854
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.921 J.014 E.18843
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.265 E.63375
G1 X132.211 Y107.265 E.06213
G1 X132.211 Y106.585 E.02089
G1 X143.823 Y106.585 E.35681
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X144.823 Y149.304 I-4.607 J-.012 E.19059
G3 X143.823 Y149.415 I-1.016 J-4.591 E.03096
G1 X104.179 Y149.415 E1.21816
G3 X99.586 Y144.822 I0 J-4.593 E.22168
G1 X99.586 Y111.178 E1.03379
G3 X103.383 Y106.656 I4.591 J0 E.19707
G3 X104.179 Y106.585 I.959 J6.289 E.02458
G1 X115.791 Y106.585 E.35681
G1 X115.791 Y107.265 E.02089
G1 X113.769 Y107.265 E.06213
G1 X113.769 Y127.89 E.63375
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.014 J3.921 E.18843
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.913 J-.005 E.18854
G1 X112.245 Y148.735 E.24802
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15806
G1 X112.214 Y147.652 E-.25397
G1 X112.281 Y147.448 E-.08156
G1 X112.372 Y147.337 E-.05452
G1 X112.559 Y147.232 E-.08155
G1 X112.709 Y147.21 E-.05762
G1 X112.9 Y147.21 E-.07272
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


G1 X113.234 Y148.313 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.34968
M204 S10000
G1 X135.412 Y149.075 F42000
; LINE_WIDTH: 0.330794
G1 F12505.483
M204 S6000
G1 X143.831 Y149.075 E.19749
G1 X144.446 Y149.029 E.01447
G1 X144.855 Y148.948 E.00978
G1 X145.261 Y148.825 E.00995
G1 X145.829 Y148.573 E.01458
G1 X146.19 Y148.357 E.00987
G1 X146.68 Y147.974 E.01458
G1 X146.977 Y147.676 E.00987
G1 X147.36 Y147.186 E.01459
G1 X147.667 Y146.645 E.01459
G1 X147.829 Y146.253 E.00994
G1 X147.949 Y145.858 E.00969
G1 X148.029 Y145.452 E.00971
G1 X148.076 Y144.818 E.01492
G1 X148.071 Y110.963 E.79417
G1 X148.03 Y110.551 E.00971
G1 X147.949 Y110.146 E.0097
G1 X147.754 Y109.552 E.01467
G1 X147.471 Y108.99 E.01475
G1 X147.111 Y108.479 E.01467
G1 X146.678 Y108.024 E.01475
G1 X146.358 Y107.761 E.0097
G1 X146.014 Y107.532 E.0097
G1 X145.453 Y107.249 E.01475
G1 X144.859 Y107.052 E.01467
G1 X144.246 Y106.946 E.01458
G1 X143.819 Y106.925 E.01004
G1 X132.407 Y106.925 E.26769
; WIPE_START
G1 X134.407 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.775 Y106.925 Z3.8 F42000
G1 X115.595 Y106.925 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.330794
G1 F12505.473
M204 S6000
G1 X104.183 Y106.925 E.26769
G1 X103.756 Y106.946 E.01004
G1 X103.144 Y107.052 E.01458
G1 X102.55 Y107.248 E.01467
G1 X102.173 Y107.427 E.00979
G1 X101.895 Y107.59 E.00755
G1 X101.644 Y107.761 E.00712
G1 X101.322 Y108.026 E.00979
G1 X100.891 Y108.479 E.01467
G1 X100.531 Y108.99 E.01466
G1 X100.248 Y109.552 E.01475
G1 X100.053 Y110.146 E.01467
G1 X99.972 Y110.551 E.0097
G1 X99.931 Y110.963 E.00971
G1 X99.926 Y144.818 E.79417
M73 P81 R6
G1 X99.973 Y145.452 E.01492
G1 X100.054 Y145.858 E.00971
G1 X100.173 Y146.254 E.0097
G1 X100.336 Y146.645 E.00994
G1 X100.643 Y147.187 E.0146
G1 X101.025 Y147.676 E.01457
G1 X101.322 Y147.974 E.00988
G1 X101.812 Y148.357 E.01457
G1 X102.173 Y148.573 E.00987
G1 X102.741 Y148.825 E.01458
G1 X103.147 Y148.948 E.00995
G1 X103.556 Y149.029 E.00978
G1 X104.171 Y149.075 E.01447
G1 X112.591 Y149.075 E.19752
; WIPE_START
G1 X110.591 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.047 Y141.848 Z3.8 F42000
G1 X117.211 Y129.59 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.821 Y135.734 Z3.8 F42000
G1 X121.549 Y141.487 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.617 Y141.375 E.00403
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.467 Y141.62 I-.072 J2.884 E.45966
G1 X121.518 Y141.538 E.00296
; WIPE_START
M204 S6000
G1 X121.617 Y141.375 E-.07267
G1 X121.791 Y141.145 E-.10935
G1 X121.978 Y140.943 E-.10475
G1 X122.317 Y140.657 E-.16839
G1 X122.559 Y140.501 E-.1093
G1 X122.815 Y140.37 E-.10931
G1 X123.026 Y140.287 E-.08623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.911 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.575 Y143.178 E.00822
G3 X124.091 Y139.411 I-3.585 J-.179 E.51729
G1 X124.248 Y139.419 E.00483
G3 X127.575 Y142.822 I-.257 J3.58 E.15988
G1 X127.579 Y142.852 E.00092
M204 S10000
G1 X127.232 Y142.869 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355509
G1 F11516.728
M204 S6000
G1 X127.239 Y143 E.00334
G1 X127.222 Y143.322 E.00822
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00822
G1 X126.844 Y144.548 E.00823
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.318 E.00823
G1 X126.02 Y145.531 E.00822
G1 X125.758 Y145.72 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.564 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.598 Y146.212 E.00833
G1 X123.281 Y146.156 E.00822
G1 X122.97 Y146.069 E.00822
G1 X122.67 Y145.951 E.00822
G1 X122.383 Y145.804 E.00822
G1 X122.108 Y145.626 E.00833
G1 X121.859 Y145.427 E.00812
G1 X121.631 Y145.205 E.00812
G1 X121.324 Y144.821 E.01252
G1 X121.158 Y144.548 E.00812
G1 X121.016 Y144.254 E.00833
G1 X120.907 Y143.954 E.00811
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y142.996 E.00832
G1 X120.78 Y142.678 E.00812
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.742 E.00822
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00823
G1 X121.741 Y140.683 E.00822
G1 X121.982 Y140.469 E.00822
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00822
G1 X122.818 Y139.986 E.00823
G1 X123.124 Y139.884 E.00822
G1 X123.439 Y139.812 E.00822
G1 X123.759 Y139.772 E.00823
G1 X124.078 Y139.764 E.00812
G1 X124.567 Y139.812 E.01253
G1 X124.878 Y139.883 E.00812
G1 X125.187 Y139.988 E.00832
G1 X125.478 Y140.119 E.00813
G1 X125.758 Y140.28 E.00821
G1 X126.02 Y140.469 E.00822
G1 X126.264 Y140.685 E.00832
G1 X126.481 Y140.919 E.00812
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.743 E.00823
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.229 Y142.809 E.00335
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.728
G1 X127.239 Y143 E-.0727
G1 X127.222 Y143.322 E-.12268
G1 X127.174 Y143.642 E-.12268
G1 X127.095 Y143.954 E-.12261
G1 X126.984 Y144.257 E-.12258
G1 X126.844 Y144.548 E-.12271
G1 X126.743 Y144.715 E-.07404
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/53
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-.342 J-1.168 P1  F42000
G1 X113.408 Y148.616 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X113.099 Y148.616 E.01024
G1 X113.011 Y148.261 E.01213
G1 X113.011 Y148.009 E.00835
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00832
G1 X134.903 Y148.616 E.01213
G1 X113.468 Y148.616 E.71107
M204 S10000
G1 X112.848 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.78 Y149.023 E.00226
G1 X112.604 Y148.297 E.02478
G1 X112.603 Y147.611 E.02276
G1 X112.724 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.323 E.02388
G1 X135.222 Y149.023 E.02393
G1 X112.908 Y149.023 E.74019
M204 S250
G1 X112.305 Y148.735 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.604 J-.578 E.01309
G3 X112.214 Y147.652 I6.648 J-.316 E.02055
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.322 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02297
G1 X135.79 Y148.32 E.0189
G3 X135.697 Y148.735 I-1.695 J-.163 E.01309
G1 X143.828 Y148.735 E.24985
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.921 J.014 E.18843
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.265 E.63375
G1 X132.211 Y107.265 E.06213
G1 X132.211 Y106.585 E.02089
G1 X143.823 Y106.585 E.35681
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.604 J-.011 E.22154
G1 X104.179 Y149.415 E1.21816
G3 X101.683 Y148.677 I.005 J-4.61 E.08108
G3 X99.586 Y144.822 I2.499 J-3.857 E.14059
G1 X99.586 Y111.178 E1.03379
G3 X104.179 Y106.585 I4.594 J.001 E.22167
G1 X115.791 Y106.585 E.35681
G1 X115.791 Y107.265 E.02089
G1 X113.769 Y107.265 E.06213
G1 X113.769 Y127.89 E.63375
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.019 J3.926 E.18836
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.921 J-.014 E.18843
G1 X112.245 Y148.735 E.24801
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15805
G1 X112.214 Y147.652 E-.25401
G1 X112.281 Y147.448 E-.0815
G1 X112.372 Y147.337 E-.05457
G1 X112.559 Y147.232 E-.08149
G1 X112.709 Y147.21 E-.05766
G1 X112.9 Y147.21 E-.07272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
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


G1 X113.233 Y148.313 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.34968
M204 S10000
G1 X135.411 Y149.075 F42000
; LINE_WIDTH: 0.330811
G1 F12504.745
M204 S6000
G1 X143.819 Y149.075 E.19724
G1 X144.243 Y149.054 E.00996
G1 X144.6 Y149.003 E.00846
G2 X148.076 Y144.818 I-.771 J-4.177 E.13853
G1 X148.076 Y111.182 E.78907
G1 X148.056 Y110.758 E.00996
G1 X148.004 Y110.402 E.00846
G2 X143.819 Y106.925 I-4.177 J.771 E.13853
G1 X132.407 Y106.925 E.26771
; WIPE_START
M73 P81 R5
G1 X134.407 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.775 Y106.925 Z4 F42000
G1 X115.595 Y106.925 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.330818
G1 F12504.444
M204 S6000
G1 X104.168 Y106.925 E.26809
G1 X103.549 Y106.972 E.01456
G1 X103.144 Y107.052 E.0097
G1 X102.798 Y107.156 E.00847
G2 X99.926 Y111.182 I1.384 J4.024 E.12381
G1 X99.926 Y144.83 E.78937
G1 X99.972 Y145.445 E.01447
G1 X100.053 Y145.857 E.00985
G1 X100.248 Y146.448 E.0146
G1 X100.432 Y146.835 E.01004
G2 X104.183 Y149.075 I3.749 J-2.017 E.10765
G1 X112.591 Y149.075 E.19724
; WIPE_START
G1 X110.591 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.046 Y141.848 Z4 F42000
G1 X117.211 Y129.59 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.821 Y135.734 Z4 F42000
G1 X121.553 Y141.48 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.617 Y141.375 E.00378
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45967
G1 X121.522 Y141.531 E.00321
; WIPE_START
M204 S6000
G1 X121.617 Y141.375 E-.06958
G1 X121.791 Y141.145 E-.10933
G1 X121.987 Y140.935 E-.10926
G1 X122.202 Y140.744 E-.10932
G1 X122.436 Y140.577 E-.10925
G1 X122.83 Y140.364 E-.1702
G1 X123.033 Y140.284 E-.08306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.92 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.578 Y143.179 E.00796
G3 X123.911 Y139.411 I-3.583 J-.181 E.51135
G3 X124.242 Y139.419 I.09 J3.312 E.01015
G3 X127.578 Y142.822 I-.247 J3.579 E.16015
G1 X127.581 Y142.86 E.00118
M204 S10000
G1 X127.232 Y142.877 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355508
G1 F11516.764
M204 S6000
G1 X127.239 Y143 E.00313
G1 X127.222 Y143.322 E.00822
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.258 E.00822
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.264 Y145.315 E.00812
G1 X126.019 Y145.531 E.00833
G1 X125.758 Y145.72 E.00822
G1 X125.478 Y145.881 E.00821
G1 X125.187 Y146.012 E.00813
G1 X124.718 Y146.157 E.01252
G1 X124.404 Y146.212 E.00812
G1 X124.078 Y146.236 E.00833
G1 X123.759 Y146.228 E.00812
G1 X123.439 Y146.188 E.00823
G1 X123.124 Y146.116 E.00822
G1 X122.818 Y146.014 E.00822
G1 X122.528 Y145.882 E.00813
G1 X122.245 Y145.72 E.00832
G1 X121.983 Y145.531 E.00822
G1 X121.741 Y145.318 E.00822
G1 X121.521 Y145.081 E.00821
G1 X121.326 Y144.823 E.00824
G1 X121.158 Y144.548 E.00821
G1 X121.018 Y144.257 E.00823
G1 X120.907 Y143.954 E.00821
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00823
G1 X120.907 Y142.046 E.00821
G1 X121.018 Y141.742 E.00823
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00822
G1 X121.738 Y140.685 E.00811
G1 X121.983 Y140.469 E.00833
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00821
G1 X122.815 Y139.988 E.00813
G1 X123.125 Y139.883 E.00833
G1 X123.435 Y139.812 E.00811
G1 X123.924 Y139.764 E.01253
G1 X124.239 Y139.772 E.00802
G1 X124.563 Y139.812 E.00832
G1 X124.878 Y139.884 E.00822
G1 X125.184 Y139.986 E.00822
G1 X125.478 Y140.119 E.00823
G1 X125.757 Y140.28 E.00821
G1 X126.019 Y140.469 E.00822
G1 X126.262 Y140.683 E.00823
M73 P82 R5
G1 X126.481 Y140.919 E.00821
G1 X126.676 Y141.176 E.00823
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.743 E.00823
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.229 Y142.817 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.764
G1 X127.239 Y143 E-.06949
G1 X127.222 Y143.322 E-.12261
G1 X127.174 Y143.642 E-.1227
G1 X127.095 Y143.954 E-.12263
G1 X126.984 Y144.258 E-.12267
G1 X126.844 Y144.548 E-.1227
G1 X126.738 Y144.722 E-.0772
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/53
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4 I-.341 J-1.168 P1  F42000
G1 X113.403 Y148.616 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X113.098 Y148.616 E.01014
G1 X113.011 Y148.261 E.0121
G1 X113.011 Y148.009 E.00837
G1 X134.992 Y148.01 E.72915
G1 X134.991 Y148.261 E.00834
G1 X134.904 Y148.616 E.0121
G1 X113.463 Y148.616 E.71124
M204 S10000
G1 X112.846 Y149.023 F42000
G1 F5400
M204 S6000
G1 X112.778 Y149.023 E.00224
G1 X112.604 Y148.297 E.02476
G1 X112.603 Y147.611 E.02276
G1 X112.724 Y147.602 E.00401
G1 X135.399 Y147.603 E.75219
G1 X135.395 Y148.324 E.02391
G1 X135.224 Y149.023 E.02388
G1 X112.906 Y149.023 E.74033
M204 S250
G1 X112.304 Y148.735 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.636 J-.582 E.01309
G3 X112.214 Y147.652 I6.648 J-.316 E.02054
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.323 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02297
G1 X135.79 Y148.32 E.0189
G3 X135.698 Y148.735 I-1.728 J-.167 E.01309
G1 X143.828 Y148.735 E.24982
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.92 J.013 E.18844
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.265 E.63375
G1 X132.211 Y107.265 E.06213
G1 X132.211 Y106.585 E.02089
G1 X143.823 Y106.585 E.35681
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.604 J-.011 E.22154
G1 X104.179 Y149.415 E1.21816
G3 X99.586 Y144.822 I.011 J-4.604 E.22154
G1 X99.586 Y111.178 E1.03379
G3 X104.179 Y106.585 I4.604 J.011 E.22154
G1 X115.791 Y106.585 E.35681
G1 X115.791 Y107.265 E.02089
G1 X113.769 Y107.265 E.06213
G1 X113.769 Y127.89 E.63375
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.013 J3.92 E.18844
G1 X100.266 Y144.828 E1.03414
G2 X104.174 Y148.735 I3.921 J-.014 E.18841
G1 X112.244 Y148.735 E.24798
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15807
G1 X112.214 Y147.652 E-.25394
G1 X112.281 Y147.448 E-.08155
G1 X112.372 Y147.337 E-.05455
G1 X112.559 Y147.232 E-.08153
G1 X112.709 Y147.21 E-.05761
G1 X112.901 Y147.21 E-.07275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
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


G1 X113.233 Y148.313 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242186
G1 F15000
M204 S6000
G1 X134.769 Y148.313 E.3497
M204 S10000
G1 X135.413 Y149.075 F42000
; LINE_WIDTH: 0.330798
G1 F12505.318
M204 S6000
G1 X143.834 Y149.075 E.19755
G1 X144.45 Y149.029 E.01448
G1 X145.063 Y148.89 E.01475
G2 X148.076 Y144.818 I-1.235 J-4.065 E.12732
G1 X148.076 Y111.182 E.78903
G1 X148.056 Y110.758 E.00996
G1 X147.999 Y110.372 E.00916
G2 X143.819 Y106.925 I-4.172 J.802 E.13782
G1 X132.407 Y106.925 E.2677
; WIPE_START
G1 X134.407 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.775 Y106.925 Z4.2 F42000
G1 X115.595 Y106.925 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.33079
G1 F12505.643
M204 S6000
G1 X104.183 Y106.925 E.26769
G1 X103.549 Y106.972 E.01492
G2 X99.926 Y111.182 I.627 J4.204 E.14201
G1 X99.926 Y144.835 E.78943
G2 X104.183 Y149.075 I4.253 J-.013 E.15649
G1 X112.589 Y149.075 E.19718
; WIPE_START
G1 X110.589 Y149.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.045 Y141.848 Z4.2 F42000
G1 X117.211 Y129.59 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.734 Z4.2 F42000
G1 X121.572 Y141.448 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.701 Y141.258 E.00707
G3 X123.929 Y140.116 I2.3 J1.741 E.07957
G1 X124.073 Y140.116 E.00442
G3 X121.538 Y141.498 I-.072 J2.884 E.464
; WIPE_START
M204 S6000
G1 X121.701 Y141.258 E-.11026
G1 X121.886 Y141.038 E-.10933
G1 X122.092 Y140.837 E-.10934
G1 X122.317 Y140.657 E-.10929
G1 X122.559 Y140.501 E-.10929
G1 X122.815 Y140.37 E-.10928
G1 X123.067 Y140.271 E-.10322
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.928 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.577 Y143.178 E.0077
G3 X123.911 Y139.411 I-3.583 J-.181 E.51139
G3 X124.235 Y139.418 I.09 J3.25 E.00996
G3 X127.577 Y142.822 I-.242 J3.579 E.16031
G1 X127.581 Y142.868 E.00143
M204 S10000
G1 X127.233 Y142.885 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355508
G1 F11516.764
M204 S6000
G1 X127.239 Y143 E.00292
G1 X127.222 Y143.322 E.00822
G1 X127.174 Y143.641 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00821
G1 X126.844 Y144.549 E.00824
G1 X126.676 Y144.824 E.00821
G1 X126.481 Y145.081 E.00822
G1 X126.261 Y145.318 E.00823
G1 X126.02 Y145.531 E.00821
G1 X125.757 Y145.72 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00822
G1 X124.878 Y146.116 E.00822
G1 X124.563 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.435 Y146.188 E.01253
G1 X123.124 Y146.116 E.00813
G1 X122.815 Y146.012 E.00831
G1 X122.528 Y145.882 E.00803
G1 X122.245 Y145.72 E.00832
G1 X121.982 Y145.531 E.00823
G1 X121.738 Y145.315 E.00831
G1 X121.521 Y145.081 E.00812
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00822
G1 X121.018 Y144.257 E.00823
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.641 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00822
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00823
G1 X121.521 Y140.919 E.00822
G1 X121.741 Y140.682 E.00822
G1 X121.983 Y140.469 E.00822
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00821
G1 X122.818 Y139.986 E.00822
G1 X123.124 Y139.884 E.00823
G1 X123.439 Y139.812 E.00822
G1 X123.759 Y139.772 E.00823
G1 X124.078 Y139.764 E.00812
G1 X124.567 Y139.812 E.01253
G1 X124.878 Y139.884 E.00813
G1 X125.187 Y139.988 E.00831
G1 X125.478 Y140.119 E.00813
G1 X125.757 Y140.28 E.00821
G1 X126.02 Y140.469 E.00822
G1 X126.264 Y140.685 E.00832
G1 X126.481 Y140.919 E.00812
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.743 E.00823
G1 X127.095 Y142.046 E.00821
G1 X127.174 Y142.359 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.23 Y142.826 E.00378
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.764
G1 X127.239 Y143 E-.06636
G1 X127.222 Y143.322 E-.12262
G1 X127.174 Y143.641 E-.12266
G1 X127.095 Y143.954 E-.12266
G1 X126.984 Y144.257 E-.12253
G1 X126.844 Y144.549 E-.12291
G1 X126.734 Y144.729 E-.08026
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/53
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I-.404 J-1.148 P1  F42000
G1 X115.687 Y148.616 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.751 Y148.616 E.03104
G1 X114.85 Y148.009 E.02039
G1 X133.207 Y148.01 E.60893
G1 X133.283 Y148.616 E.02026
G1 X115.747 Y148.616 E.58171
; WIPE_START
G1 X114.751 Y148.616 E-.37835
G1 X114.85 Y148.009 E-.23359
G1 X115.24 Y148.009 E-.14806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.272 Y149.023 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X114.404 Y148.214 E.02718
G1 X113.192 Y147.807 E.04241
G1 X113.226 Y147.602 E.00688
G1 X134.649 Y147.603 E.71063
G1 X134.675 Y147.817 E.00715
G1 X133.626 Y148.084 E.03591
G1 X133.744 Y149.023 E.03139
G1 X114.332 Y149.023 E.64395
; WIPE_START
G1 X114.404 Y148.214 E-.3085
G1 X113.278 Y147.836 E-.4515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.305 Y148.735 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.32 I1.596 J-.578 E.0131
G3 X112.214 Y147.652 I6.635 J-.316 E.02055
G3 X112.709 Y147.21 I.492 J.053 E.02236
G1 X135.322 Y147.211 E.69485
G3 X135.791 Y147.705 I-.037 J.504 E.02297
G1 X135.79 Y148.32 E.0189
G3 X135.697 Y148.735 I-1.69 J-.163 E.0131
G1 X143.828 Y148.735 E.24986
G2 X147.736 Y144.827 I-.014 J-3.921 E.18843
G1 X147.736 Y111.173 E1.03412
G2 X143.828 Y107.265 I-3.921 J.014 E.18843
G1 X134.613 Y107.265 E.28316
G1 X134.613 Y127.89 E.63375
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.265 E.63375
G1 X132.211 Y107.265 E.06213
G1 X132.211 Y106.585 E.02089
G1 X143.823 Y106.585 E.35681
G3 X148.416 Y111.178 I-.011 J4.604 E.22154
G1 X148.416 Y144.822 E1.03379
G3 X143.823 Y149.415 I-4.604 J-.011 E.22154
G1 X104.179 Y149.415 E1.21816
G3 X99.586 Y144.822 I.011 J-4.604 E.22154
G1 X99.586 Y111.178 E1.03379
G3 X104.179 Y106.585 I4.604 J.011 E.22154
G1 X115.791 Y106.585 E.35681
G1 X115.791 Y107.265 E.02089
G1 X113.769 Y107.265 E.06213
G1 X113.769 Y127.89 E.63375
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.265 E.63375
G1 X104.174 Y107.265 E.28316
G2 X100.266 Y111.173 I.014 J3.921 E.18843
G1 X100.266 Y144.827 E1.03412
G2 X104.174 Y148.735 I3.921 J-.014 E.18843
G1 X112.245 Y148.735 E.24802
; WIPE_START
M204 S6000
G1 X112.212 Y148.32 E-.15811
G1 X112.214 Y147.652 E-.25398
G1 X112.281 Y147.448 E-.08147
G1 X112.372 Y147.337 E-.05458
G1 X112.559 Y147.232 E-.0815
G1 X112.709 Y147.21 E-.05764
G1 X112.9 Y147.21 E-.07272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
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


G1 X113.966 Y147.828 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119315
G1 F15000
M204 S6000
G1 X114.138 Y147.856 E.00109
; LINE_WIDTH: 0.164108
G1 X114.31 Y147.885 E.00172
; LINE_WIDTH: 0.208901
G1 X114.483 Y147.913 E.00236
; LINE_WIDTH: 0.253694
G1 X114.655 Y147.941 E.003
M204 S10000
G1 X115.007 Y148.313 F42000
; LINE_WIDTH: 0.242187
G1 F15000
M204 S6000
G1 X133.04 Y148.313 E.29281
M204 S10000
G1 X133.394 Y147.869 F42000
; LINE_WIDTH: 0.139699
G1 F15000
M204 S6000
G1 X133.549 Y147.849 E.00123
; LINE_WIDTH: 0.111184
G1 X133.704 Y147.83 E.00087
; WIPE_START
G1 X133.549 Y147.849 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.788 Y149.208 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X135.557 Y148.439 E.03339
G1 X135.583 Y147.879
G1 X134.255 Y149.208 E.05773
M73 P83 R5
G1 X133.962 Y148.968
G1 X134.954 Y147.975 E.04314
M204 S10000
G1 X135.602 Y147.886 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.210897
G1 F15000
M204 S6000
G1 X135.499 Y147.661 E.00339
; LINE_WIDTH: 0.25542
G1 X135.476 Y147.635 E.00061
; LINE_WIDTH: 0.289291
G1 F14612.11
G1 X135.445 Y147.614 E.00075
; LINE_WIDTH: 0.321572
G1 F12919.371
G1 X135.42 Y147.603 E.00062
; LINE_WIDTH: 0.35313
G1 F11605.05
G1 X135.388 Y147.594 E.00083
; LINE_WIDTH: 0.38767
G1 F10442.345
G2 X135.331 Y147.627 I-.017 J.037 E.00215
; LINE_WIDTH: 0.359895
G1 F11357.364
G1 X135.27 Y147.715 E.00276
; LINE_WIDTH: 0.321754
G1 F12910.909
G1 X135.209 Y147.803 E.00243
; LINE_WIDTH: 0.283613
G1 F14956.813
G1 X135.148 Y147.891 E.0021
; LINE_WIDTH: 0.244401
G1 F15000
G1 X135.082 Y147.98 E.00182
; LINE_WIDTH: 0.192974
G1 X135.021 Y147.98 E.00075
; LINE_WIDTH: 0.143076
G1 X134.959 Y147.98 E.0005
; WIPE_START
G1 X135.021 Y147.98 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.403 Y149.075 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.330797
G1 F12505.376
M204 S6000
G1 X143.831 Y149.075 E.17426
G1 X144.446 Y149.029 E.01447
G1 X144.859 Y148.948 E.00987
G1 X145.449 Y148.753 E.01459
G1 X145.833 Y148.571 E.00995
G1 X146.358 Y148.239 E.01459
G1 X146.829 Y147.833 E.01458
G1 X147.114 Y147.518 E.00995
G1 X147.472 Y147.01 E.01459
G1 X147.751 Y146.455 E.01458
G1 X147.893 Y146.058 E.00988
G1 X148.03 Y145.449 E.01466
G1 X148.076 Y144.818 E.01484
G1 X148.076 Y111.167 E.78939
G1 X148.056 Y110.758 E.00959
G1 X147.995 Y110.349 E.0097
G1 X147.829 Y109.747 E.01467
G1 X147.574 Y109.171 E.01476
G1 X147.242 Y108.646 E.01458
G1 X146.831 Y108.17 E.01475
G1 X146.358 Y107.761 E.01467
G1 X145.83 Y107.427 E.01466
G1 X145.255 Y107.172 E.01476
G1 X144.655 Y107.007 E.01458
G1 X144.031 Y106.93 E.01476
G1 X135.469 Y106.925 E.20085
; WIPE_START
G1 X137.469 Y106.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.377 Y106.925 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.33086
G1 F12502.604
M204 S6000
G1 X132.407 Y106.925 E.02276
; WIPE_START
G1 X133.377 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.745 Y106.925 Z4.4 F42000
G1 X115.595 Y106.925 Z4.4
G1 Z4
G1 E.8 F1800
G1 F12502.604
M204 S6000
G1 X114.625 Y106.925 E.02276
; WIPE_START
G1 X115.595 Y106.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.533 Y106.925 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.330626
G1 F12512.802
M204 S6000
G1 X104.168 Y106.925 E.19612
G1 X103.553 Y106.971 E.01446
G1 X102.943 Y107.108 E.01465
G1 X102.359 Y107.333 E.01466
G1 X101.812 Y107.643 E.01475
G1 X101.32 Y108.028 E.01465
G1 X101.027 Y108.321 E.0097
G1 X100.765 Y108.641 E.00969
G1 X100.428 Y109.171 E.01473
G1 X100.175 Y109.743 E.01467
G1 X100.008 Y110.346 E.01466
G1 X99.931 Y110.97 E.01475
G1 X99.926 Y144.818 E.79354
G1 X99.972 Y145.449 E.01483
G1 X100.109 Y146.058 E.01465
G1 X100.251 Y146.455 E.00987
G1 X100.531 Y147.01 E.01457
G1 X100.889 Y147.518 E.01459
G1 X101.173 Y147.833 E.00994
G1 X101.644 Y148.239 E.01458
G1 X102.17 Y148.571 E.01457
G1 X102.553 Y148.753 E.00994
G1 X103.143 Y148.948 E.01458
G1 X103.556 Y149.029 E.00986
G1 X104.171 Y149.075 E.01446
G1 X111.429 Y149.075 E.17015
G2 X111.688 Y149.219 I2.505 J-4.2 E.00695
M204 S10000
G1 X111.711 Y149.219 F42000
; LINE_WIDTH: 0.137212
G1 F15000
M204 S6000
G1 X111.114 Y148.931 E.0051
; WIPE_START
G1 X111.711 Y149.219 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.458 Y149.208 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X114.125 Y148.54 E.029
G1 X113.865 Y148.268
G1 X112.925 Y149.208 E.04084
G1 X112.588 Y149.012
G1 X113.466 Y148.133 E.03816
G1 X113.067 Y147.999
G1 X112.482 Y148.584 E.02542
G1 X112.419 Y148.114
G1 X112.876 Y147.656 E.01987
M204 S10000
G1 X112.788 Y147.383 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.236985
G1 F15000
M204 S6000
G2 X112.479 Y147.678 I.339 J.666 E.00685
; LINE_WIDTH: 0.184399
G1 X112.4 Y147.856 E.00224
M204 S10000
G1 X112.859 Y147.562 F42000
; LINE_WIDTH: 0.153911
G1 F15000
M204 S6000
G1 X112.796 Y147.505 E.00077
; LINE_WIDTH: 0.193526
G1 X112.732 Y147.448 E.00104
G1 X112.424 Y147.585 E.00414
; WIPE_START
G1 X112.732 Y147.448 E-.60691
G1 X112.796 Y147.505 E-.15309
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.408 Y148.06 Z4.4 F42000
G1 X136.302 Y149.219 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.217474
G1 F15000
M204 S6000
G1 X136.855 Y148.931 E.00887
; WIPE_START
G1 X136.302 Y149.219 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.981 Y143.748 Z4.4 F42000
G1 X117.211 Y129.59 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F6123.074
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.734 Z4.4 F42000
G1 X121.576 Y141.442 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.701 Y141.258 E.00684
G3 X123.929 Y140.116 I2.3 J1.741 E.07957
G1 X124.073 Y140.116 E.00442
G3 X121.542 Y141.491 I-.072 J2.884 E.46425
; WIPE_START
M204 S6000
G1 X121.701 Y141.258 E-.10733
G1 X121.886 Y141.038 E-.10928
G1 X122.092 Y140.837 E-.10931
G1 X122.317 Y140.657 E-.10936
G1 X122.559 Y140.501 E-.1092
G1 X122.814 Y140.37 E-.10928
G1 X123.075 Y140.268 E-.10625
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.936 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.575 Y143.178 E.00745
G3 X123.911 Y139.411 I-3.583 J-.181 E.51143
G3 X124.229 Y139.418 I.09 J3.186 E.00977
G3 X127.576 Y142.822 I-.237 J3.58 E.16046
G1 X127.581 Y142.876 E.00169
M204 S10000
G1 X127.233 Y142.894 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355507
G1 F11516.796
M204 S6000
G1 X127.239 Y143 E.00271
G1 X127.222 Y143.322 E.00822
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00821
G1 X126.844 Y144.549 E.00824
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.318 E.00822
G1 X126.02 Y145.531 E.00822
G1 X125.758 Y145.72 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.563 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.435 Y146.188 E.01253
G1 X123.124 Y146.116 E.00813
G1 X122.815 Y146.012 E.00832
G1 X122.528 Y145.882 E.00803
G1 X122.244 Y145.719 E.00831
G1 X121.983 Y145.531 E.00822
G1 X121.738 Y145.315 E.00832
G1 X121.521 Y145.081 E.00811
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00822
G1 X121.018 Y144.257 E.00823
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.359 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00822
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00823
G1 X121.741 Y140.682 E.00822
G1 X121.983 Y140.469 E.00823
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00821
G1 X122.818 Y139.986 E.00823
G1 X123.124 Y139.884 E.00822
G1 X123.439 Y139.812 E.00822
G1 X123.759 Y139.772 E.00823
G1 X124.078 Y139.764 E.00812
G1 X124.406 Y139.788 E.00839
G1 X124.718 Y139.843 E.00806
G1 X125.187 Y139.988 E.01252
G1 X125.478 Y140.119 E.00813
G1 X125.757 Y140.28 E.00821
G1 X126.02 Y140.469 E.00822
G1 X126.264 Y140.685 E.00832
G1 X126.481 Y140.919 E.00812
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.742 E.00822
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.23 Y142.834 E.00399
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.796
G1 X127.239 Y143 E-.0632
G1 X127.222 Y143.322 E-.12263
G1 X127.174 Y143.642 E-.12267
G1 X127.095 Y143.954 E-.12264
G1 X126.984 Y144.257 E-.12252
G1 X126.844 Y144.549 E-.12287
G1 X126.73 Y144.736 E-.08347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/53
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.4 I.965 J-.742 P1  F42000
G1 X113.769 Y127.89 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.51 E.62622
G1 X113.769 Y107.51 E.01168
G1 X113.769 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X113.389 Y127.89 E-.14619
G1 X113.389 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121 Y126.854 Z4.6 F42000
G1 X134.613 Y127.89 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.51 E.62622
G1 X134.613 Y107.51 E.01168
G1 X134.613 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X134.233 Y127.89 E-.14619
G1 X134.233 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.741 Y127.734 Z4.6 F42000
G1 X117.211 Y129.59 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
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


G1 X117.407 Y129.1 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F3948
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.734 Z4.6 F42000
G1 X121.566 Y141.459 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.00303
G3 X123.929 Y140.116 I2.383 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45966
G1 X121.535 Y141.51 E.00397
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.06023
G1 X121.791 Y141.146 E-.1092
G1 X121.987 Y140.935 E-.10931
G1 X122.202 Y140.744 E-.10928
G1 X122.41 Y140.594 E-.09762
G1 X122.815 Y140.37 E-.17557
G1 X123.057 Y140.275 E-.0988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.945 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.576 Y143.178 E.00719
G3 X123.911 Y139.411 I-3.585 J-.179 E.51181
G3 X124.223 Y139.418 I.09 J3.121 E.00958
G3 X127.576 Y142.822 I-.232 J3.582 E.16065
G1 X127.582 Y142.885 E.00195
M204 S10000
G1 X127.228 Y142.893 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355507
G1 F3948
M204 S6000
G1 X127.234 Y143.161 E.00682
G3 X126.354 Y145.223 I-3.233 J-.162 E.05831
G1 X126.02 Y145.531 E.01158
G1 X125.62 Y145.804 E.01233
G1 X125.184 Y146.014 E.01232
G1 X124.721 Y146.156 E.01233
G1 X124.243 Y146.228 E.01233
G1 X123.759 Y146.228 E.01232
G1 X123.281 Y146.156 E.01233
G1 X122.818 Y146.014 E.01232
G1 X122.38 Y145.802 E.0124
G1 X121.983 Y145.531 E.01225
G1 X121.628 Y145.202 E.01233
G1 X121.326 Y144.824 E.01232
G1 X121.084 Y144.404 E.01234
G1 X120.907 Y143.954 E.01232
G1 X120.8 Y143.482 E.01233
G1 X120.764 Y142.996 E.01242
G3 X127.222 Y142.682 I3.237 J.004 E.25085
G1 X127.226 Y142.833 E.00387
; WIPE_START
G1 F11516.819
G1 X127.234 Y143.161 E-.12458
G1 X127.202 Y143.486 E-.12414
G1 X127.096 Y143.951 E-.18097
G1 X126.983 Y144.261 E-.1255
G1 X126.766 Y144.685 E-.18093
G1 X126.73 Y144.737 E-.02388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.342 Y146.651 Z4.6 F42000
G1 X112.604 Y148.397 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P84 R5
G1 F3948
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75417
M204 S250
G1 X112.353 Y148.641 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.323 I.355 J-.348 E.01093
G1 X112.212 Y147.676 E.01988
G3 X112.68 Y147.211 I.505 J.04 E.02208
G1 X135.4 Y147.22 E.69811
G3 X135.791 Y147.705 I-.107 J.487 E.02069
G3 X135.782 Y148.392 I-3.726 J.295 E.02113
G3 X135.323 Y148.789 I-.486 J-.098 E.02008
G1 X112.677 Y148.789 E.69584
G3 X112.398 Y148.681 I.031 J-.496 E.00935
M204 S10000
G1 X112.807 Y148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430122
G1 F3948
M204 S6000
G1 X135.195 Y148 E.70639
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9297.489
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/53
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I.875 J-.846 P1  F42000
G1 X113.769 Y127.89 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.51 E.62622
G1 X113.769 Y107.51 E.01168
G1 X113.769 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X113.389 Y127.89 E-.14619
G1 X113.389 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121 Y126.854 Z4.8 F42000
G1 X134.613 Y127.89 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.51 E.62622
G1 X134.613 Y107.51 E.01168
G1 X134.613 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X134.233 Y127.89 E-.14619
G1 X134.233 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.741 Y127.734 Z4.8 F42000
G1 X117.211 Y129.59 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
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


G1 X117.407 Y129.1 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F3990
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.735 Z4.8 F42000
G1 X121.57 Y141.452 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.00277
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45966
G1 X121.539 Y141.503 E.00423
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.05702
G1 X121.791 Y141.145 E-.1093
G1 X121.987 Y140.935 E-.10925
G1 X122.202 Y140.744 E-.10934
G1 X122.436 Y140.576 E-.10928
G1 X122.815 Y140.37 E-.16387
G1 X123.064 Y140.272 E-.10195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y142.953 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.575 Y143.178 E.00693
G3 X123.911 Y139.411 I-3.585 J-.179 E.51183
G3 X124.217 Y139.417 I.09 J3.062 E.00939
G3 X127.575 Y142.822 I-.227 J3.582 E.16081
G1 X127.581 Y142.893 E.00221
M204 S10000
G1 X127.228 Y142.902 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.3555
G1 F3990
M204 S6000
G1 X127.234 Y143.161 E.00661
G3 X126.35 Y145.227 I-3.233 J-.162 E.05843
G1 X126.02 Y145.531 E.01145
G1 X125.62 Y145.804 E.01233
G1 X125.184 Y146.014 E.01231
G1 X124.721 Y146.156 E.01233
G1 X124.243 Y146.228 E.01233
G1 X123.759 Y146.228 E.01232
G1 X123.281 Y146.156 E.01233
G1 X122.818 Y146.014 E.01234
G1 X122.38 Y145.802 E.01239
G1 X121.982 Y145.531 E.01226
G1 X121.628 Y145.202 E.01231
G1 X121.326 Y144.824 E.01233
G1 X121.084 Y144.404 E.01233
G1 X120.907 Y143.954 E.01231
G1 X120.8 Y143.483 E.01232
G1 X120.764 Y143 E.01233
G3 X127.222 Y142.682 I3.237 J0 E.25094
G1 X127.227 Y142.842 E.00408
; WIPE_START
G1 F11517.052
G1 X127.234 Y143.161 E-.12136
G1 X127.202 Y143.486 E-.12414
G1 X127.096 Y143.951 E-.18096
G1 X126.983 Y144.261 E-.12553
G1 X126.766 Y144.685 E-.18092
G1 X126.726 Y144.744 E-.02709
; WIPE_END
M73 P84 R4
G1 E-.04 F1800
M204 S10000
G1 X119.336 Y146.655 Z4.8 F42000
G1 X112.604 Y148.397 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3990
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75417
M204 S250
G1 X112.353 Y148.641 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.323 I.355 J-.348 E.01093
G1 X112.212 Y147.676 E.01988
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.4 Y147.22 E.69813
G3 X135.791 Y147.705 I-.107 J.487 E.02069
G3 X135.782 Y148.392 I-3.731 J.295 E.02113
G3 X135.323 Y148.789 I-.486 J-.098 E.02009
G1 X112.677 Y148.789 E.69584
G3 X112.398 Y148.681 I.031 J-.496 E.00935
M204 S10000
G1 X112.807 Y148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430132
G1 F3990
M204 S6000
G1 X135.195 Y148 E.70641
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9297.242
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/53
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.8 I.875 J-.846 P1  F42000
G1 X113.769 Y127.89 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.51 E.62622
G1 X113.769 Y107.51 E.01168
G1 X113.769 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X113.389 Y127.89 E-.14619
G1 X113.389 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.999 Y126.864 Z5 F42000
G1 X134.233 Y127.89 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X134.233 Y107.51 E.62622
G1 X134.613 Y107.51 E.01168
G1 X134.613 Y127.89 E.62622
G1 X134.293 Y127.89 E.00983
; WIPE_START
M204 S6000
G1 X134.287 Y125.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.828 Y127.506 Z5 F42000
G1 X117.211 Y129.59 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
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


G1 X117.407 Y129.1 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F3961
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.735 Z5 F42000
G1 X121.575 Y141.445 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.00251
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45966
G1 X121.544 Y141.496 E.00449
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.05385
G1 X121.791 Y141.146 E-.10925
G1 X121.958 Y140.964 E-.09401
G1 X122.317 Y140.657 E-.17913
G1 X122.558 Y140.502 E-.10922
G1 X122.815 Y140.37 E-.10939
G1 X123.072 Y140.269 E-.10515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.588 Y142.939 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.583 Y143 E.00189
G3 X123.733 Y139.42 I-3.589 J0 E.51167
G3 X124.211 Y139.417 I.263 J3.859 E.01469
G3 X127.565 Y142.643 I-.217 J3.583 E.1556
G1 X127.583 Y142.879 E.00726
M204 S10000
G1 X127.234 Y142.87 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355504
G1 F3961
M204 S6000
G1 X127.222 Y143.322 E.01152
G3 X122.528 Y145.882 I-3.221 J-.323 E.16022
G1 X122.241 Y145.717 E.00841
G1 X121.856 Y145.425 E.01233
G1 X121.521 Y145.081 E.01222
G1 X121.239 Y144.688 E.01233
G1 X121.019 Y144.261 E.01223
G1 X120.906 Y143.951 E.00842
G1 X120.8 Y143.482 E.01224
G1 X120.764 Y143 E.01232
G3 X127.232 Y142.81 I3.237 J-.001 E.25426
; WIPE_START
G1 F11516.9
G1 X127.222 Y143.322 E-.19462
G1 X127.137 Y143.803 E-.18528
G1 X127.043 Y144.107 E-.12123
G1 X126.92 Y144.401 E-.12108
G1 X126.739 Y144.715 E-.1378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.353 Y146.639 Z5 F42000
G1 X112.604 Y148.397 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3961
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75417
M204 S250
G1 X112.353 Y148.641 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.323 I.355 J-.348 E.01093
G1 X112.212 Y147.676 E.01989
G3 X112.679 Y147.211 I.505 J.041 E.02205
G1 X135.4 Y147.22 E.69814
G3 X135.791 Y147.705 I-.107 J.487 E.02068
G3 X135.782 Y148.392 I-3.72 J.295 E.02113
G3 X135.323 Y148.789 I-.486 J-.098 E.02008
G1 X112.677 Y148.789 E.69585
G3 X112.398 Y148.681 I.031 J-.496 E.00933
M204 S10000
G1 X112.807 Y148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430132
G1 F3961
M204 S6000
G1 X135.195 Y148 E.70641
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9297.241
M73 P85 R4
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/53
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I1.093 J-.535 P1  F42000
G1 X113.389 Y107.51 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X113.769 Y107.51 E.01168
G1 X113.769 Y127.89 E.62622
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.57 E.62438
; WIPE_START
M204 S6000
G1 X113.769 Y107.51 E-.14619
G1 X113.769 Y109.125 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.442 Y114.232 Z5.2 F42000
G1 X134.613 Y127.89 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X134.233 Y127.89 E.01168
G1 X134.233 Y107.51 E.62622
G1 X134.613 Y107.51 E.01168
G1 X134.613 Y127.83 E.62438
; WIPE_START
M204 S6000
G1 X134.233 Y127.89 E-.14619
G1 X134.233 Y126.275 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.741 Y127.734 Z5.2 F42000
G1 X117.211 Y129.59 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
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


G1 X117.407 Y129.1 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F4082
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.735 Z5.2 F42000
G1 X121.579 Y141.437 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.00225
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45967
G1 X121.548 Y141.489 E.00474
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.05067
G1 X121.791 Y141.145 E-.10929
G1 X121.955 Y140.967 E-.09219
G1 X122.317 Y140.658 E-.18086
G1 X122.559 Y140.501 E-.10932
G1 X122.815 Y140.37 E-.10933
G1 X123.08 Y140.266 E-.10834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y142.95 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.582 Y143 E.00155
G3 X123.733 Y139.42 I-3.589 J0 E.51168
G3 X124.204 Y139.417 I.262 J3.849 E.0145
G3 X127.565 Y142.643 I-.211 J3.583 E.15577
G1 X127.584 Y142.89 E.0076
M204 S10000
G1 X127.233 Y142.881 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355503
G1 F4082
M204 S6000
G1 X127.222 Y143.322 E.01124
G3 X122.528 Y145.882 I-3.221 J-.323 E.16022
G1 X122.241 Y145.717 E.00841
G1 X121.856 Y145.425 E.01233
G1 X121.521 Y145.081 E.01223
G1 X121.239 Y144.688 E.01232
G1 X121.019 Y144.261 E.01223
G1 X120.906 Y143.951 E.00842
G1 X120.8 Y143.482 E.01224
G1 X120.764 Y143 E.01232
G3 X127.233 Y142.821 I3.237 J-.001 E.25454
; WIPE_START
G1 F11516.964
G1 X127.222 Y143.322 E-.19042
G1 X127.137 Y143.803 E-.18525
G1 X127.043 Y144.108 E-.12133
G1 X126.92 Y144.401 E-.121
G1 X126.733 Y144.725 E-.142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.346 Y146.645 Z5.2 F42000
G1 X112.604 Y148.397 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4082
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75417
M204 S250
G1 X112.353 Y148.641 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.323 I.354 J-.348 E.01094
G1 X112.212 Y147.676 E.01988
G3 X112.68 Y147.211 I.5 J.035 E.02213
G1 X135.4 Y147.221 E.69814
G3 X135.791 Y147.705 I-.107 J.487 E.02067
G3 X135.782 Y148.392 I-3.727 J.295 E.02113
G3 X135.325 Y148.789 I-.486 J-.098 E.02002
G1 X112.677 Y148.789 E.6959
G3 X112.398 Y148.682 I.031 J-.496 E.00933
M204 S10000
G1 X112.807 Y148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430152
G1 F4082
M204 S6000
G1 X135.195 Y148 E.70644
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9296.754
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/53
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.2 I1.093 J-.535 P1  F42000
G1 X113.389 Y107.51 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X113.769 Y107.51 E.01168
G1 X113.769 Y127.89 E.62622
G1 X113.389 Y127.89 E.01168
G1 X113.389 Y107.57 E.62438
; WIPE_START
M204 S6000
G1 X113.769 Y107.51 E-.14619
G1 X113.769 Y109.125 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.395 Y114.284 Z5.4 F42000
G1 X134.233 Y127.89 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X134.233 Y107.51 E.62622
G1 X134.613 Y107.51 E.01168
G1 X134.613 Y127.89 E.62622
G1 X134.293 Y127.89 E.00983
; WIPE_START
M204 S6000
G1 X134.287 Y125.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.828 Y127.506 Z5.4 F42000
G1 X117.211 Y129.59 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
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


G1 X117.407 Y129.1 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F4049
M204 S6000
G1 X130.595 Y129.1 E.63183
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.822 Y135.735 Z5.4 F42000
G1 X121.583 Y141.43 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.618 Y141.375 E.002
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45966
G1 X121.552 Y141.481 E.005
; WIPE_START
M204 S6000
G1 X121.618 Y141.375 E-.04748
G1 X121.791 Y141.145 E-.10929
G1 X121.952 Y140.97 E-.09041
G1 X122.317 Y140.658 E-.18261
G1 X122.558 Y140.502 E-.10929
G1 X122.815 Y140.37 E-.10938
G1 X123.082 Y140.265 E-.10928
G1 X123.088 Y140.264 E-.00226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y142.961 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X127.582 Y143 E.00122
G3 X123.733 Y139.42 I-3.589 J0 E.51169
G3 X124.202 Y139.417 I.262 J3.845 E.01442
G3 X127.564 Y142.643 I-.209 J3.583 E.15584
G1 X127.584 Y142.901 E.00794
M204 S10000
G1 X127.233 Y142.892 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355507
G1 F4049
M204 S6000
G1 X127.222 Y143.322 E.01096
G3 X122.528 Y145.882 I-3.221 J-.323 E.16022
G1 X122.241 Y145.717 E.00841
G1 X121.856 Y145.425 E.01232
G1 X121.521 Y145.081 E.01222
G1 X121.239 Y144.688 E.01233
G1 X121.019 Y144.261 E.01223
G1 X120.906 Y143.951 E.00842
G1 X120.8 Y143.483 E.01222
G1 X120.764 Y143 E.01233
G3 X127.234 Y142.832 I3.237 J-.001 E.25482
; WIPE_START
G1 F11516.822
G1 X127.222 Y143.322 E-.18629
G1 X127.137 Y143.803 E-.18525
G1 X127.043 Y144.108 E-.1213
G1 X126.92 Y144.401 E-.12101
G1 X126.728 Y144.734 E-.14615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.34 Y146.65 Z5.4 F42000
G1 X112.604 Y148.397 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4049
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.353 Y148.641 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.212 Y148.323 I.354 J-.348 E.01093
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.5 J.035 E.02213
G1 X135.4 Y147.221 E.69814
G3 X135.791 Y147.705 I-.107 J.487 E.02068
G3 X135.782 Y148.392 I-3.72 J.295 E.02114
G3 X135.325 Y148.789 I-.486 J-.098 E.02001
G1 X112.677 Y148.789 E.69591
G3 X112.398 Y148.682 I.031 J-.496 E.00933
M204 S10000
G1 X112.807 Y148 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430162
G1 F4049
M204 S6000
G1 X135.195 Y148 E.70646
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9296.511
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/53
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2285
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
M73 P86 R4
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2285
M204 S5000
G3 X112.212 Y148.323 I.354 J-.348 E.01094
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.504 J.039 E.02209
G1 X135.4 Y147.22 E.69813
G3 X135.791 Y147.705 I-.107 J.487 E.02068
G3 X135.782 Y148.393 I-3.711 J.295 E.02115
G3 X135.325 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.6959
G3 X112.398 Y148.682 I.031 J-.496 E.00932
; WIPE_START
G1 F3000
M204 S6000
G1 X112.253 Y148.496 E-.08958
G1 X112.212 Y148.323 E-.0676
G1 X112.212 Y147.676 E-.24596
G1 X112.258 Y147.492 E-.07222
G1 X112.372 Y147.337 E-.07303
G1 X112.492 Y147.257 E-.0548
G1 X112.68 Y147.211 E-.07331
G1 X112.899 Y147.211 E-.08351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
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


G1 X112.807 Y148 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430173
G1 F2285
M204 S6000
G1 X135.195 Y148 E.70648
; WIPE_START
G1 F9296.266
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.555 Y144.237 Z5.6 F42000
G1 X121.588 Y141.423 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2285
M204 S5000
G1 X121.618 Y141.375 E.00174
G3 X123.929 Y140.116 I2.383 J1.623 E.08398
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.621 I-.072 J2.882 E.45941
G1 X121.557 Y141.474 E.00525
; WIPE_START
G1 F3000
M204 S6000
G1 X121.618 Y141.375 E-.04435
G1 X121.886 Y141.038 E-.16387
G1 X122.092 Y140.837 E-.10922
G1 X122.317 Y140.658 E-.10933
G1 X122.559 Y140.501 E-.10932
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.10923
G1 X123.096 Y140.261 E-.00539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.59 Y142.972 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2285
M204 S5000
G1 X127.582 Y143 E.00089
G3 X123.733 Y139.42 I-3.589 J0 E.51169
G3 X124.196 Y139.416 I.262 J3.84 E.01423
G3 X127.564 Y142.643 I-.203 J3.583 E.15602
G1 X127.585 Y142.912 E.00828
M204 S10000
G1 X127.234 Y142.939 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355539
G1 F2285
M204 S6000
G1 X127.238 Y142.996 E.00147
G3 X126.151 Y145.42 I-3.237 J.004 E.06973
G1 X125.888 Y145.631 E.00859
G1 X125.475 Y145.882 E.01232
G1 X125.032 Y146.069 E.01224
G1 X124.559 Y146.189 E.01242
G1 X124.082 Y146.236 E.01223
G1 X123.598 Y146.212 E.01232
G1 X123.124 Y146.116 E.01232
G1 X122.67 Y145.951 E.01232
G1 X122.245 Y145.72 E.01233
G1 X121.859 Y145.428 E.01233
G1 X121.521 Y145.081 E.01233
G1 X121.241 Y144.691 E.01224
G1 X121.018 Y144.258 E.01242
G1 X120.865 Y143.802 E.01223
G1 X120.78 Y143.326 E.01233
G1 X120.764 Y142.996 E.00842
G3 X127.202 Y142.518 I3.237 J.004 E.24661
G1 X127.23 Y142.879 E.00922
; WIPE_START
G1 F11515.629
G1 X127.238 Y142.996 E-.04467
G1 X127.222 Y143.322 E-.12417
G1 X127.139 Y143.795 E-.18232
G1 X127.043 Y144.108 E-.12425
G1 X126.846 Y144.545 E-.18222
G1 X126.706 Y144.775 E-.10238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.659 Y138.303 Z5.6 F42000
G1 X117.211 Y129.59 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2285
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F2285
M204 S6000
G1 X130.595 Y129.1 E.63183
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/53
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.6 I-.937 J-.777 P1  F42000
G1 X112.604 Y148.397 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2291
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2291
M204 S5000
G3 X112.212 Y148.323 I.354 J-.348 E.01094
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.503 J.039 E.02209
G1 X135.4 Y147.221 E.69814
G3 X135.791 Y147.705 I-.107 J.486 E.02067
G3 X135.782 Y148.392 I-3.716 J.295 E.02114
G3 X135.325 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.6959
G3 X112.398 Y148.682 I.031 J-.496 E.00932
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.496 E-.08976
G1 X112.212 Y148.323 E-.06743
G1 X112.212 Y147.676 E-.24597
G1 X112.258 Y147.492 E-.07217
G1 X112.372 Y147.337 E-.07305
G1 X112.492 Y147.258 E-.05457
G1 X112.68 Y147.211 E-.07355
G1 X112.899 Y147.211 E-.08351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
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


G1 X112.807 Y148 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430183
G1 F2291
M204 S6000
G1 X135.195 Y148 E.7065
; WIPE_START
G1 F9296.022
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.557 Y144.233 Z5.8 F42000
G1 X121.592 Y141.416 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2291
M204 S5000
G1 X121.618 Y141.375 E.00148
G3 X123.929 Y140.116 I2.383 J1.623 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.621 I-.072 J2.882 E.45941
G1 X121.561 Y141.467 E.00552
; WIPE_START
G1 F3000
M204 S6000
G1 X121.618 Y141.375 E-.04112
G1 X121.943 Y140.979 E-.19465
G1 X122.317 Y140.658 E-.18744
G1 X122.559 Y140.501 E-.10935
G1 X122.815 Y140.37 E-.10932
G1 X123.082 Y140.265 E-.10928
G1 X123.105 Y140.259 E-.00884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.59 Y142.983 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2291
M204 S5000
G1 X127.582 Y143 E.00058
G3 X123.733 Y139.42 I-3.589 J0 E.5117
G3 X124.189 Y139.416 I.262 J3.835 E.01404
G3 X127.564 Y142.643 I-.197 J3.584 E.15621
G1 X127.586 Y142.923 E.00862
M204 S10000
G1 X127.236 Y142.941 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355537
G1 F2291
M204 S6000
G1 X127.239 Y143 E.00152
G1 X127.223 Y143.318 E.00812
G1 X127.138 Y143.799 E.01243
G1 X126.983 Y144.261 E.01242
G1 X126.844 Y144.548 E.00812
G1 X126.678 Y144.821 E.00812
G1 X126.375 Y145.202 E.01241
G1 X126.016 Y145.534 E.01244
G1 X125.758 Y145.72 E.00812
G1 X125.478 Y145.881 E.00821
G1 X125.028 Y146.07 E.01244
G1 X124.721 Y146.156 E.00812
G1 X124.404 Y146.212 E.00822
G1 X123.917 Y146.236 E.01242
G1 X123.598 Y146.212 E.00813
G1 X123.284 Y146.157 E.00812
G1 X122.818 Y146.014 E.01243
G1 X122.379 Y145.802 E.01242
G1 X122.111 Y145.629 E.00813
G1 X121.862 Y145.43 E.00812
G1 X121.519 Y145.078 E.01253
G1 X121.326 Y144.824 E.00812
G1 X121.16 Y144.552 E.00811
G1 X120.959 Y144.108 E.01242
G1 X120.864 Y143.799 E.00823
G1 X120.8 Y143.486 E.00812
G1 X120.764 Y142.996 E.01253
G3 X121.852 Y140.579 I3.237 J.004 E.06958
G1 X122.245 Y140.28 E.01256
G1 X122.673 Y140.047 E.01243
G1 X122.97 Y139.931 E.00813
G1 X123.277 Y139.845 E.00811
G1 X123.763 Y139.771 E.01253
G1 X124.082 Y139.764 E.00813
G1 X124.4 Y139.787 E.00812
G1 X124.878 Y139.883 E.01242
G1 X125.336 Y140.051 E.01243
G1 X125.62 Y140.196 E.00812
G1 X125.891 Y140.371 E.00822
G1 X126.143 Y140.573 E.00822
G1 X126.372 Y140.795 E.00812
G1 X126.676 Y141.176 E.01242
G1 X126.92 Y141.599 E.01242
G1 X127.043 Y141.892 E.00812
G1 X127.137 Y142.197 E.00813
G1 X127.223 Y142.682 E.01253
G1 X127.233 Y142.881 E.00507
; WIPE_START
G1 F11515.702
G1 X127.239 Y143 E-.04542
G1 X127.223 Y143.318 E-.12109
G1 X127.138 Y143.799 E-.18546
G1 X126.983 Y144.261 E-.18533
G1 X126.844 Y144.548 E-.12118
G1 X126.705 Y144.776 E-.10153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.659 Y138.305 Z5.8 F42000
G1 X117.211 Y129.59 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2291
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
M204 S10000
G1 X117.407 Y129.1 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.63086
G1 F2291
M204 S6000
G1 X130.595 Y129.1 E.63183
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6123.074
G1 X128.595 Y129.1 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/53
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.8 I-.937 J-.777 P1  F42000
M73 P87 R4
G1 X112.604 Y148.397 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02635
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G3 X112.212 Y148.323 I.354 J-.348 E.01094
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.4 Y147.221 E.69814
G3 X135.791 Y147.705 I-.107 J.487 E.02067
G3 X135.782 Y148.393 I-3.714 J.295 E.02115
G3 X135.324 Y148.789 I-.486 J-.099 E.02002
G1 X112.677 Y148.789 E.69589
G3 X112.398 Y148.682 I.031 J-.496 E.00932
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.495 E-.09004
G1 X112.212 Y148.323 E-.06714
G1 X112.212 Y147.676 E-.24596
G1 X112.257 Y147.493 E-.07168
G1 X112.372 Y147.337 E-.07356
G1 X112.493 Y147.257 E-.05485
G1 X112.68 Y147.211 E-.07326
G1 X112.899 Y147.211 E-.08351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
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


G1 X112.807 Y148 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430193
G1 F2541
M204 S6000
G1 X135.195 Y148 E.70652
; WIPE_START
G1 F9295.778
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.56 Y144.229 Z6 F42000
G1 X121.596 Y141.409 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G1 X121.618 Y141.375 E.00123
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.467 Y141.62 I-.072 J2.884 E.45966
G1 X121.565 Y141.46 E.00577
; WIPE_START
G1 F3000
M204 S6000
G1 X121.618 Y141.375 E-.038
G1 X121.94 Y140.983 E-.19285
G1 X122.317 Y140.657 E-.1893
G1 X122.559 Y140.501 E-.1093
G1 X122.815 Y140.37 E-.10928
G1 X123.082 Y140.265 E-.1093
G1 X123.113 Y140.257 E-.01196
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.59 Y143.016 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2541
M204 S5000
G1 X127.564 Y143.357 E.01049
G3 X123.733 Y139.42 I-3.571 J-.357 E.50073
G3 X124.183 Y139.416 I.262 J3.837 E.01384
G3 X127.581 Y142.959 I-.191 J3.584 E.1661
M204 S10000
G1 X127.238 Y142.984 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355562
G1 F2541
M204 S6000
G1 X127.238 Y142.996 E.0003
G3 X126.151 Y145.42 I-3.237 J.004 E.06975
G1 X125.888 Y145.631 E.00858
G1 X125.475 Y145.883 E.01232
G1 X125.032 Y146.069 E.01224
G1 X124.559 Y146.189 E.01242
G1 X124.082 Y146.236 E.01223
G1 X123.598 Y146.212 E.01232
G1 X123.124 Y146.116 E.01233
G1 X122.67 Y145.951 E.01232
G1 X122.245 Y145.72 E.01233
G1 X121.862 Y145.43 E.01223
G1 X121.524 Y145.084 E.01233
G1 X121.324 Y144.821 E.00842
G1 X121.084 Y144.404 E.01223
G1 X120.907 Y143.954 E.01232
G1 X120.8 Y143.482 E.01234
G1 X120.764 Y143 E.01232
G3 X127.202 Y142.518 I3.237 J.001 E.24673
G1 X127.233 Y142.925 E.01039
; WIPE_START
G1 F11514.799
G1 X127.238 Y142.996 E-.02723
G1 X127.222 Y143.322 E-.12415
G1 X127.173 Y143.645 E-.12416
G1 X127.043 Y144.108 E-.18244
G1 X126.846 Y144.545 E-.18231
G1 X126.682 Y144.814 E-.1197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.65 Y138.333 Z6 F42000
G1 X117.211 Y129.59 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G1 X117.211 Y128.61 E.03011
G1 X130.791 Y128.61 E.41728
G1 X130.791 Y129.59 E.03011
G1 X117.271 Y129.59 E.41543
; WIPE_START
G1 F3000
M204 S6000
G1 X117.211 Y128.61 E-.3731
G1 X118.229 Y128.61 E-.3869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.846 Y129.106 Z6 F42000
G1 X130.083 Y129.383 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F2541
M204 S2000
G1 X130.584 Y128.882 E.02174
G1 X130.115 Y128.817
G1 X129.55 Y129.383 E.02456
G1 X129.017 Y129.383
G1 X129.582 Y128.817 E.02456
G1 X129.049 Y128.817
G1 X128.484 Y129.383 E.02456
G1 X127.95 Y129.383
G1 X128.516 Y128.817 E.02456
G1 X127.982 Y128.817
G1 X127.417 Y129.383 E.02456
G1 X126.884 Y129.383
G1 X127.449 Y128.817 E.02456
G1 X126.916 Y128.817
G1 X126.351 Y129.383 E.02456
G1 X125.817 Y129.383
G1 X126.383 Y128.817 E.02456
G1 X125.849 Y128.817
G1 X125.284 Y129.383 E.02456
G1 X124.751 Y129.383
G1 X125.316 Y128.817 E.02456
G1 X124.783 Y128.817
G1 X124.218 Y129.383 E.02456
G1 X123.684 Y129.383
G1 X124.25 Y128.817 E.02456
G1 X123.716 Y128.817
G1 X123.151 Y129.383 E.02456
G1 X122.618 Y129.383
G1 X123.183 Y128.817 E.02456
G1 X122.65 Y128.817
G1 X122.085 Y129.383 E.02456
G1 X121.551 Y129.383
G1 X122.117 Y128.817 E.02456
G1 X121.583 Y128.817
G1 X121.018 Y129.383 E.02456
G1 X120.485 Y129.383
G1 X121.05 Y128.817 E.02456
G1 X120.517 Y128.817
G1 X119.952 Y129.383 E.02456
G1 X119.418 Y129.383
G1 X119.984 Y128.817 E.02456
G1 X119.45 Y128.817
G1 X118.885 Y129.383 E.02456
G1 X118.352 Y129.383
G1 X118.917 Y128.817 E.02456
G1 X118.384 Y128.817
G1 X117.819 Y129.383 E.02456
G1 X117.418 Y129.249
G1 X117.851 Y128.817 E.01878
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
M204 S6000
G1 X117.418 Y129.249 E-.23219
G1 X117.819 Y129.383 E-.16024
G1 X118.384 Y128.817 E-.30376
G1 X118.552 Y128.817 E-.06381
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/53
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6 I-1.164 J-.354 P1  F42000
G1 X112.604 Y148.397 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1836
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1836
M204 S5000
G3 X112.212 Y148.323 I.354 J-.349 E.01096
G1 X112.212 Y147.676 E.01989
G3 X112.679 Y147.211 I.503 J.038 E.02207
G1 X135.4 Y147.221 E.69816
G3 X135.791 Y147.705 I-.107 J.487 E.02067
G3 X135.782 Y148.393 I-3.704 J.295 E.02115
G3 X135.324 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.6959
G3 X112.398 Y148.682 I.031 J-.496 E.00931
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.495 E-.09022
G1 X112.212 Y148.323 E-.0671
G1 X112.212 Y147.676 E-.24594
G1 X112.258 Y147.492 E-.07215
G1 X112.372 Y147.337 E-.07307
G1 X112.492 Y147.258 E-.0546
G1 X112.679 Y147.211 E-.07325
G1 X112.899 Y147.211 E-.08367
; WIPE_END
M73 P87 R3
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


G1 X112.807 Y148 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430203
G1 F1836
M204 S6000
G1 X135.195 Y148 E.70653
; WIPE_START
G1 F9295.533
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.562 Y144.225 Z6.2 F42000
G1 X121.601 Y141.402 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1836
M204 S5000
G1 X121.617 Y141.375 E.00097
G3 X123.929 Y140.116 I2.384 J1.625 E.084
G1 X124.073 Y140.116 E.00442
G3 X121.467 Y141.62 I-.072 J2.884 E.45966
G1 X121.57 Y141.453 E.00602
; WIPE_START
G1 F3000
M204 S6000
G1 X121.617 Y141.375 E-.03481
G1 X121.791 Y141.145 E-.10935
G1 X121.987 Y140.935 E-.10927
G1 X122.202 Y140.744 E-.10933
G1 X122.436 Y140.577 E-.10924
G1 X122.815 Y140.37 E-.16394
G1 X123.082 Y140.265 E-.10925
G1 X123.12 Y140.255 E-.01482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.59 Y143.022 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1836
M204 S5000
G1 X127.562 Y143.356 E.01031
G3 X123.733 Y139.42 I-3.57 J-.358 E.50048
G3 X124.177 Y139.415 I.262 J3.84 E.01365
G3 X127.579 Y142.964 I-.185 J3.583 E.16643
M204 S10000
G1 X127.238 Y142.99 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355562
G1 F1836
M204 S6000
G1 X127.238 Y143 E.00026
G3 X124.414 Y146.211 I-3.237 J0 E.119
G1 X124.082 Y146.236 E.00848
G1 X123.759 Y146.228 E.00821
G1 X123.439 Y146.188 E.00823
G1 X123.121 Y146.115 E.00832
G1 X122.815 Y146.012 E.00822
G1 X122.386 Y145.806 E.01213
G1 X122.111 Y145.629 E.00833
G1 X121.859 Y145.427 E.00822
G1 X121.628 Y145.202 E.00822
G1 X121.418 Y144.952 E.00832
G1 X121.16 Y144.552 E.01212
G1 X121.019 Y144.261 E.00823
G1 X120.907 Y143.954 E.00832
G1 X120.828 Y143.642 E.00821
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y143 E.00822
G3 X127.201 Y142.518 I3.237 J0 E.24673
G1 X127.233 Y142.93 E.01054
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11514.788
G1 X127.238 Y143 E-.02667
G1 X127.202 Y143.482 E-.18381
G1 X127.095 Y143.954 E-.1839
G1 X126.918 Y144.405 E-.18394
G1 X126.679 Y144.819 E-.18168
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/53
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I-.3 J-1.179 P1  F42000
G1 X112.604 Y148.397 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G3 X112.212 Y148.323 I.354 J-.349 E.01096
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.503 J.038 E.0221
G1 X135.348 Y147.212 E.69654
G3 X135.791 Y147.705 I-.049 J.49 E.02234
G3 X135.782 Y148.393 I-3.694 J.295 E.02116
G3 X135.324 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.69589
G3 X112.399 Y148.682 I.031 J-.496 E.0093
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.495 E-.09061
G1 X112.212 Y148.323 E-.06682
G1 X112.212 Y147.676 E-.24594
G1 X112.258 Y147.492 E-.07212
G1 X112.372 Y147.337 E-.07312
G1 X112.535 Y147.239 E-.07226
G1 X112.68 Y147.211 E-.05589
G1 X112.899 Y147.211 E-.08325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
M73 P88 R3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X112.807 Y148 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430223
G1 F1825
M204 S6000
G1 X135.195 Y148 E.70657
; WIPE_START
G1 F9295.048
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.564 Y144.221 Z6.4 F42000
G1 X121.605 Y141.395 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G1 X121.617 Y141.375 E.00072
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.62 I-.072 J2.884 E.45967
G1 X121.574 Y141.446 E.00627
; WIPE_START
G1 F3000
M204 S6000
G1 X121.617 Y141.375 E-.03175
G1 X121.933 Y140.989 E-.1893
G1 X122.317 Y140.657 E-.1929
G1 X122.559 Y140.501 E-.10929
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.1093
G1 X123.128 Y140.252 E-.01814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.59 Y143.027 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1825
M204 S5000
G1 X127.562 Y143.356 E.01014
G3 X123.733 Y139.42 I-3.57 J-.358 E.50047
G3 X124.17 Y139.415 I.262 J3.85 E.01346
G3 X127.579 Y142.969 I-.178 J3.583 E.16678
M204 S10000
G1 X127.238 Y142.995 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355564
G1 F1825
M204 S6000
G1 X127.238 Y142.996 E.00003
G3 X126.15 Y145.421 I-3.237 J.004 E.06977
G1 X125.888 Y145.631 E.00856
G1 X125.475 Y145.882 E.01232
G1 X125.032 Y146.069 E.01224
G1 X124.559 Y146.189 E.01242
G1 X124.082 Y146.236 E.01223
G1 X123.598 Y146.212 E.01233
G1 X123.124 Y146.116 E.01232
G1 X122.67 Y145.951 E.01232
G1 X122.245 Y145.72 E.01234
G1 X121.862 Y145.43 E.01223
G1 X121.625 Y145.199 E.00842
G1 X121.324 Y144.82 E.01232
G1 X121.084 Y144.404 E.01223
G1 X120.907 Y143.954 E.01232
G1 X120.8 Y143.482 E.01233
G1 X120.764 Y143 E.01232
G3 X127.202 Y142.518 I3.237 J0 E.24679
G1 X127.234 Y142.935 E.01066
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11514.704
G1 X127.238 Y142.996 E-.02322
G1 X127.222 Y143.322 E-.12412
G1 X127.173 Y143.645 E-.1242
G1 X127.043 Y144.108 E-.18244
G1 X126.916 Y144.408 E-.124
G1 X126.677 Y144.823 E-.18201
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/53
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.4 I-.3 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G3 X112.212 Y148.323 I.354 J-.349 E.01096
G1 X112.212 Y147.676 E.01989
G3 X112.679 Y147.211 I.5 J.035 E.0221
G1 X135.348 Y147.212 E.69657
G3 X135.791 Y147.705 I-.049 J.49 E.02234
G3 X135.782 Y148.393 I-3.696 J.295 E.02116
G3 X135.324 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.69589
G3 X112.399 Y148.682 I.031 J-.496 E.0093
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.494 E-.09097
G1 X112.212 Y148.323 E-.0664
G1 X112.212 Y147.676 E-.24602
G1 X112.257 Y147.493 E-.0717
G1 X112.372 Y147.337 E-.07349
G1 X112.492 Y147.258 E-.0546
G1 X112.679 Y147.211 E-.0732
G1 X112.899 Y147.211 E-.08363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430224
G1 F1825
M204 S6000
G1 X135.195 Y148 E.70657
; WIPE_START
G1 F9295.042
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.567 Y144.216 Z6.6 F42000
G1 X121.612 Y141.388 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G1 X121.702 Y141.258 E.00485
G3 X123.929 Y140.116 I2.299 J1.74 E.07956
G1 X124.073 Y140.116 E.00442
G3 X121.54 Y141.496 I-.072 J2.882 E.46384
G1 X121.579 Y141.438 E.00214
; WIPE_START
G1 F3000
M204 S6000
G1 X121.702 Y141.258 E-.0828
G1 X121.886 Y141.038 E-.10927
G1 X122.092 Y140.837 E-.10926
G1 X122.317 Y140.658 E-.1093
G1 X122.559 Y140.501 E-.10933
G1 X122.815 Y140.37 E-.10932
G1 X123.082 Y140.265 E-.10932
G1 X123.137 Y140.25 E-.0214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y143.033 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1825
M204 S5000
G1 X127.562 Y143.356 E.00997
G3 X123.733 Y139.42 I-3.57 J-.358 E.50047
G3 X124.164 Y139.415 I.263 J3.862 E.01326
G3 X127.58 Y142.974 I-.172 J3.583 E.16713
M204 S10000
G1 X127.238 Y142.996 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355538
G1 F1825
M204 S6000
G3 X126.15 Y145.421 I-3.237 J.005 E.06977
G1 X125.888 Y145.631 E.00856
G1 X125.475 Y145.883 E.01232
G1 X125.032 Y146.069 E.01224
G1 X124.559 Y146.189 E.01242
G1 X124.082 Y146.236 E.01223
G1 X123.598 Y146.212 E.01233
G1 X123.124 Y146.116 E.01232
G1 X122.67 Y145.951 E.01232
G1 X122.245 Y145.72 E.01232
G1 X121.862 Y145.43 E.01223
G1 X121.524 Y145.084 E.01233
G1 X121.324 Y144.82 E.00842
G1 X121.084 Y144.404 E.01223
G1 X120.907 Y143.954 E.01232
G1 X120.8 Y143.482 E.01233
G1 X120.764 Y143 E.01232
G3 X127.237 Y142.936 I3.237 J.001 E.25741
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11515.658
G1 X127.222 Y143.322 E-.14689
G1 X127.173 Y143.645 E-.12416
G1 X127.043 Y144.107 E-.18237
G1 X126.916 Y144.408 E-.12411
G1 X126.676 Y144.824 E-.18244
G1 X126.676 Y144.824 E-.00003
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/53
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.6 I-.3 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.603 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G3 X112.212 Y148.323 I.353 J-.349 E.01097
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.503 J.038 E.02209
G1 X135.348 Y147.212 E.69654
G3 X135.791 Y147.705 I-.049 J.49 E.02234
G3 X135.782 Y148.393 I-3.689 J.295 E.02117
G3 X135.324 Y148.789 I-.486 J-.099 E.02001
G1 X112.677 Y148.789 E.69588
G3 X112.399 Y148.683 I.031 J-.496 E.00929
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.493 E-.09127
G1 X112.212 Y148.323 E-.06622
G1 X112.212 Y147.676 E-.24603
G1 X112.258 Y147.492 E-.07209
G1 X112.372 Y147.337 E-.07312
G1 X112.493 Y147.257 E-.05491
G1 X112.68 Y147.211 E-.07321
G1 X112.898 Y147.211 E-.08314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430244
G1 F1825
M204 S6000
G1 X135.195 Y148 E.70661
; WIPE_START
G1 F9294.559
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.569 Y144.213 Z6.8 F42000
G1 X121.613 Y141.381 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
M204 S5000
G1 X121.618 Y141.375 E.00023
G3 X123.929 Y140.116 I2.383 J1.623 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.468 Y141.621 I-.072 J2.882 E.45941
G1 X121.582 Y141.433 E.00676
; WIPE_START
G1 F3000
M204 S6000
G1 X121.618 Y141.375 E-.02566
G1 X121.926 Y140.996 E-.18569
G1 X122.317 Y140.658 E-.19646
G1 X122.559 Y140.501 E-.10934
G1 X122.815 Y140.37 E-.10931
M73 P89 R3
G1 X123.082 Y140.265 E-.1093
G1 X123.144 Y140.248 E-.02424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y143.038 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1825
M204 S5000
G1 X127.564 Y143.357 E.00981
G3 X123.733 Y139.42 I-3.572 J-.357 E.50077
G3 X124.158 Y139.415 I.263 J3.885 E.01307
G3 X127.582 Y142.979 I-.166 J3.585 E.16751
M204 S10000
G1 X127.231 Y142.97 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355526
G1 F1825
M204 S6000
G1 X127.222 Y143.322 E.00897
G1 X127.139 Y143.795 E.01222
G1 X127.042 Y144.111 E.00843
G1 X126.842 Y144.552 E.01232
G1 X126.582 Y144.955 E.01222
G1 X126.259 Y145.32 E.01243
G1 X125.891 Y145.629 E.01222
G1 X125.478 Y145.881 E.01232
G1 X125.032 Y146.069 E.01234
G1 X124.563 Y146.188 E.01232
G1 X124.082 Y146.236 E.01234
G1 X123.598 Y146.212 E.01232
G1 X123.124 Y146.116 E.01232
G1 X122.673 Y145.952 E.01223
G1 X122.248 Y145.722 E.01232
G1 X121.98 Y145.529 E.00842
G1 X121.628 Y145.202 E.01223
G1 X121.324 Y144.82 E.01242
G1 X121.084 Y144.404 E.01223
G1 X120.907 Y143.954 E.01232
G1 X120.8 Y143.483 E.01232
G1 X120.764 Y143 E.01233
G3 X124.239 Y139.771 I3.241 J.004 E.13556
G1 X124.721 Y139.844 E.01242
G1 X125.18 Y139.985 E.01223
G1 X125.616 Y140.194 E.01233
G1 X125.894 Y140.374 E.00842
G1 X126.262 Y140.683 E.01223
G1 X126.582 Y141.045 E.01232
G1 X126.844 Y141.451 E.01232
G1 X127.043 Y141.893 E.01233
G1 X127.174 Y142.359 E.01233
G1 X127.235 Y142.839 E.01233
G1 X127.233 Y142.91 E.00183
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.118
G1 X127.222 Y143.322 E-.15662
G1 X127.139 Y143.795 E-.18231
G1 X127.042 Y144.111 E-.1257
G1 X126.842 Y144.552 E-.18382
G1 X126.683 Y144.798 E-.11155
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/53
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.8 I-.301 J-1.179 P1  F42000
G1 X112.604 Y148.397 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1828
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.642 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X112.212 Y148.323 I.353 J-.349 E.01097
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.348 Y147.212 E.69654
G3 X135.791 Y147.705 I-.049 J.49 E.02234
G3 X135.782 Y148.393 I-3.683 J.295 E.02117
G3 X135.324 Y148.789 I-.486 J-.099 E.02
G1 X112.677 Y148.789 E.69589
G3 X112.399 Y148.682 I.031 J-.496 E.00929
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.492 E-.09169
G1 X112.212 Y148.323 E-.06581
G1 X112.212 Y147.676 E-.246
G1 X112.257 Y147.493 E-.07167
G1 X112.37 Y147.339 E-.07256
G1 X112.492 Y147.258 E-.05559
G1 X112.68 Y147.211 E-.07355
G1 X112.898 Y147.211 E-.08314
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


G1 X112.808 Y148 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430244
G1 F1828
M204 S6000
G1 X135.195 Y148 E.70661
; WIPE_START
G1 F9294.554
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.571 Y144.209 Z7 F42000
G1 X121.617 Y141.375 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.584 Y141.425 I-.072 J2.884 E.46666
; WIPE_START
G1 F3000
M204 S6000
G1 X121.886 Y141.038 E-.18661
G1 X122.092 Y140.837 E-.10932
G1 X122.317 Y140.658 E-.10925
G1 X122.559 Y140.501 E-.10934
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.1093
G1 X123.15 Y140.246 E-.02687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y143.044 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1828
M204 S5000
G1 X127.562 Y143.356 E.00964
G3 X123.733 Y139.42 I-3.57 J-.358 E.50046
G3 X124.156 Y139.414 I.256 J3.354 E.013
G3 X127.58 Y142.985 I-.163 J3.584 E.16772
M204 S10000
G1 X127.238 Y142.996 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355519
G1 F1828
M204 S6000
G3 X126.15 Y145.421 I-3.237 J.004 E.06978
G1 X125.888 Y145.631 E.00854
G1 X125.475 Y145.882 E.01232
G1 X125.032 Y146.069 E.01224
G1 X124.559 Y146.189 E.01241
G1 X124.082 Y146.236 E.01223
G1 X123.598 Y146.212 E.01232
G1 X123.124 Y146.116 E.01232
G1 X122.67 Y145.951 E.01232
G1 X122.245 Y145.72 E.01232
G1 X121.859 Y145.428 E.01232
G1 X121.521 Y145.081 E.01233
G1 X121.241 Y144.691 E.01223
G1 X121.019 Y144.261 E.01233
G1 X120.906 Y143.951 E.00842
G1 X120.8 Y143.482 E.01224
G1 X120.764 Y143 E.01232
G3 X127.238 Y142.936 I3.237 J0 E.25745
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.377
G1 X127.222 Y143.322 E-.14691
G1 X127.173 Y143.645 E-.12415
G1 X127.043 Y144.108 E-.18242
G1 X126.846 Y144.545 E-.18232
G1 X126.676 Y144.824 E-.1241
G1 X126.676 Y144.824 E-.00011
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/53
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I-.3 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1828
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.353 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X112.212 Y148.323 I.35 J-.346 E.011
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.348 Y147.212 E.69654
G3 X135.791 Y147.705 I-.049 J.49 E.02234
G3 X135.782 Y148.393 I-3.677 J.295 E.02117
G3 X135.324 Y148.789 I-.486 J-.099 E.02
G1 X112.677 Y148.789 E.69588
G3 X112.398 Y148.684 I.026 J-.491 E.00931
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.492 E-.09206
G1 X112.212 Y148.323 E-.06554
G1 X112.212 Y147.676 E-.24602
G1 X112.257 Y147.493 E-.0717
G1 X112.338 Y147.371 E-.05553
G1 X112.493 Y147.257 E-.07297
G1 X112.68 Y147.211 E-.07316
G1 X112.898 Y147.211 E-.08302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430254
G1 F1828
M204 S6000
G1 X135.195 Y148 E.70663
; WIPE_START
G1 F9294.311
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.571 Y144.209 Z7.2 F42000
G1 X121.617 Y141.375 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X123.929 Y140.116 I2.384 J1.625 E.08399
G1 X124.073 Y140.116 E.00442
G3 X121.584 Y141.425 I-.072 J2.884 E.46666
; WIPE_START
G1 F3000
M204 S6000
G1 X121.918 Y141.005 E-.20361
G1 X122.092 Y140.837 E-.09218
G1 X122.317 Y140.658 E-.10931
G1 X122.559 Y140.501 E-.10934
G1 X122.815 Y140.37 E-.10932
G1 X123.082 Y140.265 E-.1093
G1 X123.151 Y140.246 E-.02696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.589 Y143.049 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1828
M204 S5000
G1 X127.562 Y143.356 E.00947
G3 X123.733 Y139.42 I-3.57 J-.358 E.50046
G3 X124.149 Y139.414 I.257 J3.358 E.01281
G3 X127.58 Y142.99 I-.157 J3.584 E.16808
M204 S10000
G1 X127.238 Y143 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355505
G1 F1828
M204 S6000
G3 X125.627 Y145.8 I-3.237 J0 E.08615
G1 X125.329 Y145.953 E.00853
G1 X124.878 Y146.117 E.01223
G1 X124.408 Y146.212 E.01222
G1 X124.078 Y146.236 E.00843
G1 X123.598 Y146.212 E.01223
G1 X123.128 Y146.117 E.01222
G1 X122.815 Y146.012 E.00842
G1 X122.382 Y145.804 E.01223
G1 X121.986 Y145.534 E.01222
G1 X121.74 Y145.317 E.00833
G1 X121.423 Y144.958 E.01222
G1 X121.237 Y144.685 E.00842
G1 X121.018 Y144.257 E.01223
G1 X120.865 Y143.803 E.01222
G1 X120.799 Y143.479 E.00842
G1 X120.764 Y143 E.01223
G3 X127.238 Y142.94 I3.237 J0 E.25754
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.868
G1 X127.222 Y143.326 E-.1468
G1 X127.138 Y143.799 E-.18249
G1 X126.986 Y144.254 E-.18232
G1 X126.842 Y144.552 E-.12565
G1 X126.667 Y144.823 E-.12274
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/53
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
M73 P90 R3
G3 Z7.2 I-.3 J-1.179 P1  F42000
G1 X112.604 Y148.397 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1828
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X112.212 Y148.323 I.353 J-.349 E.01098
G1 X112.212 Y147.676 E.01989
G3 X112.679 Y147.211 I.502 J.037 E.02207
G1 X135.348 Y147.212 E.69658
G3 X135.791 Y147.705 I-.049 J.49 E.02233
G3 X135.782 Y148.394 I-3.672 J.295 E.02118
G3 X135.324 Y148.789 I-.486 J-.1 E.02
G1 X112.677 Y148.789 E.69588
G3 X112.399 Y148.683 I.031 J-.496 E.00928
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.496 E-.09011
G1 X112.212 Y148.323 E-.06755
G1 X112.212 Y147.676 E-.24597
G1 X112.258 Y147.492 E-.07201
G1 X112.372 Y147.337 E-.07319
G1 X112.492 Y147.258 E-.05458
G1 X112.679 Y147.211 E-.07316
G1 X112.898 Y147.211 E-.08345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430274
G1 F1828
M204 S6000
G1 X135.195 Y148 E.70666
; WIPE_START
G1 F9293.826
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.571 Y144.209 Z7.4 F42000
G1 X121.618 Y141.375 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G1 X121.914 Y141.008 E.01447
G3 X123.929 Y140.116 I2.087 J1.991 E.06949
G1 X124.073 Y140.116 E.00442
G3 X121.584 Y141.425 I-.072 J2.884 E.46667
; WIPE_START
G1 F3000
M204 S6000
G1 X121.914 Y141.008 E-.20168
G1 X122.092 Y140.837 E-.09397
G1 X122.317 Y140.657 E-.10937
G1 X122.559 Y140.501 E-.10923
G1 X122.815 Y140.37 E-.10935
G1 X123.082 Y140.265 E-.1093
G1 X123.151 Y140.246 E-.02709
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.588 Y143.054 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1828
M204 S5000
G1 X127.563 Y143.356 E.00932
G3 X123.733 Y139.42 I-3.57 J-.358 E.50045
G3 X124.143 Y139.414 I.257 J3.357 E.01261
G3 X127.581 Y142.995 I-.15 J3.584 E.16844
M204 S10000
G1 X127.231 Y143.004 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.3555
G1 F1828
M204 S6000
G1 X127.235 Y143.161 E.00401
G1 X127.173 Y143.645 E.01243
G1 X127.095 Y143.954 E.00811
G1 X126.984 Y144.257 E.00822
G1 X126.761 Y144.691 E.01243
G1 X126.582 Y144.955 E.00812
G1 X126.376 Y145.2 E.00815
G1 X126.017 Y145.533 E.01249
G1 X125.758 Y145.72 E.00813
G1 X125.482 Y145.879 E.00812
G1 X125.032 Y146.069 E.01243
G1 X124.559 Y146.189 E.01242
G1 X124.243 Y146.228 E.00812
G1 X123.924 Y146.236 E.00812
G1 X123.435 Y146.188 E.01253
G1 X123.124 Y146.116 E.00812
G1 X122.822 Y146.015 E.00812
G1 X122.382 Y145.804 E.01243
G1 X122.111 Y145.629 E.00822
G1 X121.862 Y145.43 E.00812
G1 X121.521 Y145.081 E.01243
G1 X121.237 Y144.685 E.01242
G1 X121.084 Y144.405 E.00812
G1 X120.959 Y144.107 E.00821
G1 X120.827 Y143.638 E.01242
G1 X120.78 Y143.322 E.00812
G1 X120.764 Y143 E.00822
G3 X121.655 Y140.77 I3.245 J.004 E.06267
G1 X121.859 Y140.573 E.00722
G1 X122.111 Y140.371 E.00822
G1 X122.524 Y140.119 E.01232
G1 X122.818 Y139.986 E.00823
G1 X123.12 Y139.885 E.00812
G1 X123.598 Y139.788 E.01242
G1 X124.132 Y139.766 E.01361
G1 X124.404 Y139.788 E.00694
G1 X124.721 Y139.844 E.00822
G1 X125.032 Y139.931 E.00822
G1 X125.329 Y140.048 E.00813
G1 X125.758 Y140.281 E.01243
G1 X126.146 Y140.575 E.01242
G1 X126.374 Y140.798 E.00812
G1 X126.582 Y141.045 E.00822
G1 X126.764 Y141.312 E.00822
G1 X126.916 Y141.592 E.00812
G1 X127.095 Y142.046 E.01242
G1 X127.174 Y142.359 E.00822
G1 X127.222 Y142.674 E.00813
G1 X127.229 Y142.944 E.00688
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11517.066
G1 X127.235 Y143.161 E-.08266
G1 X127.173 Y143.645 E-.18548
G1 X127.095 Y143.954 E-.12106
G1 X126.984 Y144.257 E-.1226
M73 P90 R2
G1 X126.761 Y144.691 E-.18545
G1 X126.668 Y144.828 E-.06274
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/53
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.4 I-.299 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1828
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G3 X112.212 Y148.323 I.353 J-.349 E.01098
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.348 Y147.212 E.69654
G3 X135.791 Y147.705 I-.049 J.49 E.02233
G3 X135.782 Y148.393 I-3.677 J.295 E.02117
G3 X135.324 Y148.789 I-.486 J-.099 E.02
G1 X112.677 Y148.789 E.69589
G3 X112.399 Y148.683 I.031 J-.496 E.00928
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.496 E-.09042
G1 X112.212 Y148.323 E-.06722
G1 X112.212 Y147.676 E-.246
G1 X112.257 Y147.493 E-.07169
G1 X112.372 Y147.337 E-.07349
G1 X112.492 Y147.258 E-.05455
G1 X112.68 Y147.211 E-.07361
G1 X112.898 Y147.211 E-.08301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430284
G1 F1828
M204 S6000
G1 X135.195 Y148 E.70668
; WIPE_START
G1 F9293.583
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.572 Y144.208 Z7.6 F42000
G1 X121.619 Y141.373 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G1 X121.911 Y141.012 E.01426
G3 X123.929 Y140.116 I2.09 J1.988 E.06964
G1 X124.073 Y140.116 E.00442
G3 X121.586 Y141.423 I-.072 J2.884 E.46674
; WIPE_START
G1 F3000
M204 S6000
G1 X121.911 Y141.012 E-.19911
G1 X122.092 Y140.837 E-.09582
G1 X122.317 Y140.657 E-.10929
G1 X122.559 Y140.501 E-.10933
G1 X122.815 Y140.37 E-.10927
G1 X123.082 Y140.265 E-.1093
G1 X123.153 Y140.245 E-.02787
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.588 Y143.059 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1828
M204 S5000
G1 X127.563 Y143.356 E.00916
G3 X123.733 Y139.42 I-3.57 J-.358 E.50042
G3 X124.137 Y139.413 I.257 J3.363 E.01242
G3 X127.581 Y143 I-.143 J3.585 E.1688
M204 S10000
G1 X127.238 Y143 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355518
G1 F1828
M204 S6000
G3 X124.411 Y146.211 I-3.237 J0 E.11906
G1 X124.082 Y146.236 E.00842
G1 X123.759 Y146.228 E.00821
G1 X123.439 Y146.188 E.00823
G1 X123.121 Y146.115 E.00831
G1 X122.815 Y146.012 E.00822
G1 X122.386 Y145.806 E.01213
G1 X122.111 Y145.629 E.00832
G1 X121.859 Y145.427 E.00822
G1 X121.628 Y145.202 E.00822
G1 X121.418 Y144.952 E.00832
G1 X121.236 Y144.685 E.00823
G1 X121.019 Y144.261 E.01212
G1 X120.907 Y143.954 E.00832
G1 X120.828 Y143.642 E.00821
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y143 E.00822
G3 X127.238 Y142.94 I3.237 J0 E.25755
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.391
G1 X127.202 Y143.482 E-.20644
G1 X127.095 Y143.954 E-.18403
G1 X126.918 Y144.405 E-.18387
G1 X126.678 Y144.821 E-.18242
G1 X126.673 Y144.827 E-.00324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/53
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.6 I-.299 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1828
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.353 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
M73 P91 R2
G3 X112.212 Y148.323 I.349 J-.346 E.01101
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.348 Y147.213 E.69655
G3 X135.791 Y147.705 I-.049 J.49 E.02233
G3 X135.782 Y148.394 I-3.665 J.295 E.02118
G3 X135.324 Y148.789 I-.486 J-.1 E.02
G1 X112.677 Y148.789 E.69588
G3 X112.398 Y148.684 I.026 J-.491 E.0093
; WIPE_START
G1 F3000
M204 S6000
G1 X112.254 Y148.499 E-.08905
G1 X112.212 Y148.323 E-.06868
G1 X112.212 Y147.676 E-.24604
G1 X112.258 Y147.491 E-.07267
G1 X112.372 Y147.337 E-.07252
G1 X112.492 Y147.257 E-.05469
G1 X112.68 Y147.211 E-.07348
G1 X112.898 Y147.211 E-.08287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430295
G1 F1828
M204 S6000
G1 X135.195 Y148 E.7067
; WIPE_START
G1 F9293.339
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.572 Y144.207 Z7.8 F42000
G1 X121.62 Y141.371 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1828
M204 S5000
G1 X121.907 Y141.015 E.01405
G3 X123.929 Y140.116 I2.094 J1.984 E.06978
G1 X124.073 Y140.116 E.00442
G3 X121.587 Y141.421 I-.072 J2.884 E.4668
; WIPE_START
G1 F3000
M204 S6000
G1 X121.907 Y141.015 E-.19653
G1 X122.092 Y140.837 E-.09754
G1 X122.317 Y140.657 E-.10934
G1 X122.559 Y140.501 E-.10931
G1 X122.815 Y140.37 E-.10929
G1 X123.082 Y140.265 E-.10932
G1 X123.155 Y140.245 E-.02868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.059 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F1828
M204 S5000
G1 X127.542 Y143.534 E.01466
G3 X123.733 Y139.42 I-3.547 J-.535 E.49492
G3 X124.131 Y139.413 I.258 J3.374 E.01224
G3 X127.582 Y142.999 I-.137 J3.585 E.16898
M204 S10000
G1 X127.238 Y143 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355508
G1 F1828
M204 S6000
G3 X124.411 Y146.211 I-3.237 J0 E.11906
G1 X124.082 Y146.236 E.00841
G1 X123.759 Y146.228 E.00821
G1 X123.439 Y146.188 E.00823
G1 X123.12 Y146.115 E.00832
G1 X122.815 Y146.012 E.00822
G1 X122.386 Y145.806 E.01212
G1 X122.111 Y145.629 E.00833
G1 X121.859 Y145.427 E.00822
G1 X121.628 Y145.202 E.00822
G1 X121.42 Y144.955 E.00822
G1 X121.238 Y144.688 E.00823
G1 X121.083 Y144.401 E.00831
G1 X120.958 Y144.104 E.00822
G1 X120.829 Y143.645 E.01213
G1 X120.78 Y143.322 E.00832
G1 X120.764 Y143 E.00822
G3 X127.238 Y142.94 I3.237 J0 E.25754
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.768
G1 X127.202 Y143.482 E-.20646
G1 X127.095 Y143.954 E-.18397
G1 X126.918 Y144.404 E-.18382
G1 X126.678 Y144.82 E-.18245
G1 X126.673 Y144.827 E-.00331
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/53
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.8 I-.299 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1826
M204 S6000
G1 X112.604 Y147.603 E.02635
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G3 X112.212 Y148.324 I.349 J-.346 E.01101
G1 X112.212 Y147.676 E.0199
G3 X112.677 Y147.211 I.5 J.035 E.02205
G1 X135.349 Y147.213 E.69663
G3 X135.791 Y147.705 I-.049 J.49 E.02233
G3 X135.782 Y148.394 I-3.664 J.295 E.02118
G3 X135.323 Y148.789 I-.486 J-.1 E.02001
G1 X112.677 Y148.789 E.69586
G3 X112.398 Y148.684 I.026 J-.491 E.0093
; WIPE_START
G1 F3000
M204 S6000
G1 X112.254 Y148.499 E-.08922
G1 X112.212 Y148.324 E-.06861
G1 X112.212 Y147.676 E-.24606
G1 X112.257 Y147.493 E-.07171
G1 X112.372 Y147.337 E-.07348
G1 X112.492 Y147.258 E-.05464
G1 X112.677 Y147.211 E-.07255
G1 X112.897 Y147.211 E-.08374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430315
G1 F1826
M204 S6000
G1 X135.195 Y148 E.70674
; WIPE_START
G1 F9292.856
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.575 Y144.202 Z8 F42000
G1 X121.626 Y141.364 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G1 X121.791 Y141.146 E.00841
G3 X123.929 Y140.116 I2.21 J1.854 E.07515
G1 X124.073 Y140.116 E.00442
G3 X121.592 Y141.413 I-.072 J2.884 E.46709
; WIPE_START
G1 F3000
M204 S6000
G1 X121.791 Y141.146 E-.12682
G1 X121.987 Y140.935 E-.10927
G1 X122.317 Y140.657 E-.16388
G1 X122.559 Y140.501 E-.10931
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.10932
G1 X123.164 Y140.242 E-.03209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.084 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F1826
M204 S5000
G1 X127.575 Y143.178 E.00292
G3 X123.911 Y139.411 I-3.585 J-.179 E.51179
G1 X124.125 Y139.413 E.00657
G3 X127.575 Y142.822 I-.135 J3.587 E.16363
G1 X127.584 Y143.024 E.00622
M204 S10000
G1 X127.238 Y143.007 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355503
G1 F1826
M204 S6000
G1 X127.222 Y143.322 E.00805
G1 X127.174 Y143.642 E.00823
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00822
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.258 Y145.32 E.00831
G1 X126.02 Y145.531 E.00812
G1 X125.758 Y145.72 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00822
G1 X124.878 Y146.116 E.00823
G1 X124.564 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.435 Y146.188 E.01253
G1 X123.124 Y146.117 E.00812
G1 X122.815 Y146.012 E.00832
G1 X122.524 Y145.881 E.00812
G1 X122.245 Y145.72 E.00822
G1 X121.983 Y145.531 E.00822
G1 X121.738 Y145.315 E.00832
G1 X121.521 Y145.081 E.00812
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00822
G1 X121.018 Y144.257 E.00823
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00821
G1 X121.158 Y141.451 E.00824
G1 X121.326 Y141.176 E.00821
G1 X121.521 Y140.919 E.00823
G1 X121.738 Y140.685 E.00812
G1 X121.982 Y140.469 E.00831
G1 X122.245 Y140.28 E.00823
G1 X122.524 Y140.119 E.00821
G1 X122.815 Y139.988 E.00812
M73 P92 R2
G1 X123.124 Y139.883 E.00833
G1 X123.437 Y139.812 E.00816
G1 X123.924 Y139.764 E.01248
G1 X124.243 Y139.772 E.00812
G1 X124.563 Y139.812 E.00823
G1 X124.878 Y139.883 E.00821
G1 X125.184 Y139.986 E.00822
G1 X125.478 Y140.119 E.00822
G1 X125.758 Y140.28 E.00822
G1 X126.02 Y140.469 E.00822
G1 X126.262 Y140.682 E.00822
G1 X126.481 Y140.919 E.00822
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.742 E.00822
G1 X127.095 Y142.046 E.00823
G1 X127.174 Y142.358 E.00821
G1 X127.222 Y142.678 E.00822
G1 X127.236 Y142.947 E.00687
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.951
G1 X127.222 Y143.322 E-.14274
G1 X127.174 Y143.642 E-.12271
G1 X127.095 Y143.954 E-.12261
G1 X126.984 Y144.257 E-.12258
G1 X126.844 Y144.548 E-.12269
G1 X126.676 Y144.824 E-.1227
G1 X126.67 Y144.832 E-.00397
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/53
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8 I-.299 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1826
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.354 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G3 X112.212 Y148.324 I.349 J-.346 E.01102
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.502 J.037 E.02211
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.394 I-3.651 J.295 E.02119
G3 X135.324 Y148.789 I-.486 J-.1 E.01999
G1 X112.677 Y148.789 E.69587
G3 X112.399 Y148.684 I.026 J-.491 E.00929
; WIPE_START
G1 F3000
M204 S6000
G1 X112.253 Y148.498 E-.08964
G1 X112.212 Y148.324 E-.06828
G1 X112.212 Y147.676 E-.24605
G1 X112.258 Y147.492 E-.0719
G1 X112.372 Y147.337 E-.07334
G1 X112.492 Y147.258 E-.05456
G1 X112.68 Y147.211 E-.07355
G1 X112.897 Y147.211 E-.08268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430305
G1 F1826
M204 S6000
G1 X135.195 Y148 E.70672
; WIPE_START
G1 F9293.093
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.574 Y144.204 Z8.2 F42000
G1 X121.626 Y141.367 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G1 X121.886 Y141.038 E.0129
G3 X123.929 Y140.116 I2.115 J1.962 E.07073
G1 X124.073 Y140.116 E.00442
G3 X121.59 Y141.415 I-.072 J2.884 E.46701
; WIPE_START
G1 F3000
M204 S6000
G1 X121.886 Y141.038 E-.1823
G1 X122.092 Y140.837 E-.10926
G1 X122.317 Y140.657 E-.1094
G1 X122.559 Y140.501 E-.10925
G1 X122.815 Y140.37 E-.10928
G1 X123.082 Y140.265 E-.10929
G1 X123.161 Y140.243 E-.03124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.091 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F1826
M204 S5000
G1 X127.576 Y143.178 E.00272
G3 X123.911 Y139.411 I-3.585 J-.179 E.51176
G1 X124.118 Y139.413 E.00638
G3 X127.576 Y142.822 I-.127 J3.587 E.16386
G1 X127.584 Y143.031 E.00643
M204 S10000
G1 X127.238 Y143.013 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355516
G1 F1826
M204 S6000
G1 X127.222 Y143.322 E.00788
G1 X127.174 Y143.642 E.00823
G1 X127.095 Y143.954 E.00821
G1 X126.984 Y144.257 E.00822
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00823
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.318 E.00822
G1 X126.02 Y145.531 E.00822
G1 X125.758 Y145.719 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.563 Y146.188 E.00821
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.598 Y146.212 E.00833
G1 X123.281 Y146.156 E.00821
G1 X122.97 Y146.069 E.00823
G1 X122.673 Y145.953 E.00812
G1 X122.382 Y145.804 E.00832
G1 X122.114 Y145.631 E.00813
G1 X121.738 Y145.315 E.01252
G1 X121.521 Y145.081 E.00813
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00823
G1 X121.018 Y144.258 E.00821
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00822
G1 X121.158 Y141.451 E.00823
G1 X121.327 Y141.176 E.00822
G1 X121.521 Y140.919 E.00822
G1 X121.738 Y140.685 E.00813
G1 X121.983 Y140.469 E.00831
G1 X122.244 Y140.281 E.00822
G1 X122.524 Y140.119 E.00822
G1 X122.815 Y139.988 E.00812
G1 X123.124 Y139.883 E.00833
G1 X123.435 Y139.812 E.00812
G1 X123.924 Y139.764 E.01253
G1 X124.243 Y139.772 E.00812
G1 X124.563 Y139.812 E.00823
G1 X124.878 Y139.883 E.00821
G1 X125.184 Y139.986 E.00823
G1 X125.478 Y140.119 E.00823
G1 X125.757 Y140.28 E.00821
G1 X126.02 Y140.469 E.00823
G1 X126.261 Y140.682 E.00821
G1 X126.481 Y140.919 E.00823
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00822
G1 X126.984 Y141.742 E.00822
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.359 E.00823
G1 X127.222 Y142.678 E.00822
G1 X127.236 Y142.953 E.00704
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.48
G1 X127.222 Y143.322 E-.14025
G1 X127.174 Y143.642 E-.12279
G1 X127.095 Y143.954 E-.12252
G1 X126.984 Y144.257 E-.1226
G1 X126.844 Y144.548 E-.12268
G1 X126.676 Y144.824 E-.12272
G1 X126.666 Y144.837 E-.00644
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/53
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.2 I-.299 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1826
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.355 Y148.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G3 X112.212 Y148.324 I.353 J-.35 E.01099
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.049 J.489 E.02233
G3 X135.782 Y148.394 I-3.658 J.295 E.02119
G3 X135.323 Y148.789 I-.486 J-.1 E.02001
G1 X112.677 Y148.789 E.69585
G3 X112.4 Y148.683 I.031 J-.496 E.00927
; WIPE_START
G1 F3000
M204 S6000
G1 X112.253 Y148.498 E-.08986
G1 X112.212 Y148.324 E-.06788
G1 X112.212 Y147.676 E-.24611
G1 X112.258 Y147.491 E-.0726
G1 X112.372 Y147.337 E-.07265
G1 X112.536 Y147.239 E-.07253
G1 X112.68 Y147.211 E-.05556
G1 X112.898 Y147.211 E-.08282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430325
G1 F1826
M204 S6000
G1 X135.195 Y148 E.70676
; WIPE_START
G1 F9292.606
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.575 Y144.203 Z8.4 F42000
G1 X121.627 Y141.365 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G1 X121.886 Y141.038 E.01284
G3 X123.929 Y140.116 I2.115 J1.962 E.07073
G1 X124.073 Y140.116 E.00442
G3 X121.591 Y141.414 I-.072 J2.884 E.46707
; WIPE_START
G1 F3000
M204 S6000
G1 X121.886 Y141.038 E-.1816
G1 X122.092 Y140.837 E-.10921
G1 X122.317 Y140.658 E-.1093
G1 X122.559 Y140.501 E-.10935
G1 X122.815 Y140.37 E-.10928
G1 X123.082 Y140.265 E-.10928
G1 X123.163 Y140.242 E-.03198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.097 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F1826
M204 S5000
G1 X127.578 Y143.178 E.00251
G3 X123.911 Y139.411 I-3.585 J-.179 E.51171
G1 X124.112 Y139.412 E.00618
G3 X127.578 Y142.822 I-.119 J3.587 E.1641
G1 X127.585 Y143.037 E.00664
M204 S10000
G1 X127.238 Y143.02 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355507
G1 F1826
M204 S6000
G1 X127.222 Y143.322 E.00771
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00821
G1 X126.844 Y144.548 E.00823
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.259 Y145.32 E.00832
G1 X126.02 Y145.531 E.00811
G1 X125.758 Y145.72 E.00823
G1 X125.478 Y145.881 E.00821
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.563 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.599 Y146.212 E.00832
G1 X123.281 Y146.156 E.00822
G1 X122.97 Y146.069 E.00822
G1 X122.673 Y145.953 E.00812
G1 X122.241 Y145.717 E.01254
G1 X121.982 Y145.531 E.00812
G1 X121.738 Y145.315 E.00832
G1 X121.521 Y145.081 E.00812
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00823
G1 X121.018 Y144.257 E.00823
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00822
G1 X121.158 Y141.452 E.00823
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00822
G1 X121.738 Y140.685 E.00812
G1 X121.983 Y140.469 E.00832
G1 X122.244 Y140.281 E.00821
G1 X122.524 Y140.119 E.00823
G1 X122.815 Y139.988 E.00812
G1 X123.124 Y139.884 E.00832
G1 X123.435 Y139.812 E.00812
G1 X123.924 Y139.764 E.01252
G1 X124.243 Y139.772 E.00812
G1 X124.564 Y139.812 E.00823
G1 X124.878 Y139.884 E.00822
G1 X125.184 Y139.986 E.00821
G1 X125.478 Y140.119 E.00823
G1 X125.758 Y140.28 E.00822
G1 X126.02 Y140.469 E.00822
G1 X126.262 Y140.682 E.00822
G1 X126.481 Y140.919 E.00821
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00823
G1 X126.984 Y141.742 E.00822
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00821
G1 X127.222 Y142.678 E.00822
G1 X127.237 Y142.96 E.00721
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P93 R2
G1 F11516.808
G1 X127.222 Y143.322 E-.13779
G1 X127.174 Y143.642 E-.12266
G1 X127.095 Y143.954 E-.12262
G1 X126.984 Y144.257 E-.12249
G1 X126.844 Y144.548 E-.12281
G1 X126.676 Y144.824 E-.12261
G1 X126.662 Y144.843 E-.00904
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/53
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.4 I-.298 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1826
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.355 Y148.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G3 X112.212 Y148.324 I.353 J-.35 E.011
G1 X112.212 Y147.676 E.0199
G3 X112.678 Y147.211 I.506 J.04 E.02203
G1 X135.349 Y147.213 E.6966
G3 X135.791 Y147.705 I-.049 J.489 E.02233
G3 X135.782 Y148.394 I-3.653 J.295 E.02119
G3 X135.323 Y148.789 I-.486 J-.1 E.02
G1 X112.677 Y148.789 E.69586
G3 X112.4 Y148.683 I.031 J-.496 E.00925
; WIPE_START
G1 F3000
M204 S6000
G1 X112.253 Y148.497 E-.09023
G1 X112.212 Y148.324 E-.0676
G1 X112.212 Y147.676 E-.24613
G1 X112.258 Y147.491 E-.07258
G1 X112.372 Y147.337 E-.07266
G1 X112.492 Y147.258 E-.05462
G1 X112.678 Y147.211 E-.07296
G1 X112.897 Y147.211 E-.08324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
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


G1 X112.808 Y148 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430345
G1 F1826
M204 S6000
G1 X135.195 Y148 E.70679
; WIPE_START
G1 F9292.124
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.575 Y144.203 Z8.6 F42000
G1 X121.626 Y141.364 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G1 X121.894 Y141.029 E.0132
G3 X123.929 Y140.116 I2.107 J1.971 E.07036
G1 X124.073 Y140.116 E.00442
G3 X121.592 Y141.414 I-.072 J2.884 E.46707
; WIPE_START
G1 F3000
M204 S6000
G1 X121.894 Y141.029 E-.18603
G1 X122.092 Y140.837 E-.10468
G1 X122.317 Y140.658 E-.10936
G1 X122.559 Y140.501 E-.10935
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.10925
G1 X123.163 Y140.242 E-.03203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.103 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F1826
M204 S5000
G1 X127.58 Y143.179 E.00232
G3 X123.911 Y139.411 I-3.585 J-.179 E.51166
G1 X124.106 Y139.412 E.00598
G3 X127.58 Y142.821 I-.111 J3.588 E.16435
G1 X127.585 Y143.043 E.00682
M204 S10000
G1 X127.237 Y143.026 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355515
G1 F1826
M204 S6000
G1 X127.222 Y143.322 E.00755
G1 X127.174 Y143.642 E.00823
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.258 E.00822
G1 X126.844 Y144.549 E.00823
G1 X126.676 Y144.824 E.00821
G1 X126.481 Y145.081 E.00822
G1 X126.261 Y145.318 E.00823
G1 X126.02 Y145.531 E.00822
G1 X125.758 Y145.719 E.00822
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00822
G1 X124.878 Y146.116 E.00823
G1 X124.564 Y146.188 E.00822
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.599 Y146.212 E.00832
G1 X123.285 Y146.157 E.00812
G1 X122.815 Y146.012 E.01252
G1 X122.524 Y145.881 E.00813
G1 X122.245 Y145.72 E.00822
G1 X121.983 Y145.531 E.00822
G1 X121.738 Y145.315 E.00831
G1 X121.521 Y145.081 E.00813
G1 X121.326 Y144.824 E.00823
G1 X121.158 Y144.548 E.00822
G1 X121.018 Y144.258 E.00821
G1 X120.907 Y143.954 E.00822
G1 X120.828 Y143.642 E.00822
G1 X120.78 Y143.322 E.00823
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.358 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.742 E.00822
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00823
G1 X121.521 Y140.919 E.00822
G1 X121.738 Y140.685 E.00813
G1 X121.983 Y140.469 E.00831
G1 X122.244 Y140.281 E.00821
G1 X122.524 Y140.119 E.00823
G1 X122.815 Y139.988 E.00812
G1 X123.124 Y139.883 E.00833
G1 X123.435 Y139.812 E.00812
G1 X123.924 Y139.764 E.01252
G1 X124.243 Y139.772 E.00812
G1 X124.563 Y139.812 E.00823
G1 X124.878 Y139.883 E.00821
G1 X125.184 Y139.986 E.00823
G1 X125.478 Y140.119 E.00823
G1 X125.757 Y140.28 E.00821
G1 X126.02 Y140.469 E.00822
G1 X126.262 Y140.682 E.00823
G1 X126.481 Y140.919 E.00822
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00823
G1 X126.984 Y141.742 E.00821
G1 X127.095 Y142.046 E.00823
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00822
G1 X127.237 Y142.966 E.00736
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.507
G1 X127.222 Y143.322 E-.13541
G1 X127.174 Y143.642 E-.12275
G1 X127.095 Y143.954 E-.1226
G1 X126.984 Y144.258 E-.12266
G1 X126.844 Y144.549 E-.12271
G1 X126.676 Y144.824 E-.12252
G1 X126.658 Y144.847 E-.01135
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/53
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.6 I-.298 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1823
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02636
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.355 Y148.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G3 X112.212 Y148.324 I.353 J-.35 E.011
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.394 I-3.654 J.295 E.0212
G3 X135.323 Y148.789 I-.486 J-.1 E.02
G1 X112.677 Y148.789 E.69585
G3 X112.4 Y148.683 I.031 J-.496 E.00926
; WIPE_START
G1 F3000
M204 S6000
G1 X112.253 Y148.497 E-.09032
G1 X112.212 Y148.324 E-.06752
G1 X112.212 Y147.676 E-.24613
G1 X112.258 Y147.491 E-.0726
G1 X112.372 Y147.337 E-.07265
G1 X112.493 Y147.257 E-.05516
G1 X112.68 Y147.211 E-.07297
G1 X112.897 Y147.211 E-.08266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430355
G1 F1823
M204 S6000
G1 X135.195 Y148 E.70681
; WIPE_START
G1 F9291.881
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.584 Y144.187 Z8.8 F42000
G1 X121.646 Y141.339 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G1 X121.701 Y141.258 E.00303
G3 X123.929 Y140.116 I2.3 J1.741 E.07957
G1 X124.073 Y140.116 E.00442
G3 X121.54 Y141.496 I-.072 J2.884 E.46409
G1 X121.612 Y141.389 E.00396
; WIPE_START
G1 F3000
M204 S6000
G1 X121.701 Y141.258 E-.06027
G1 X121.886 Y141.038 E-.10929
G1 X122.092 Y140.837 E-.10927
G1 X122.317 Y140.657 E-.10934
G1 X122.559 Y140.501 E-.10931
G1 X122.815 Y140.37 E-.10931
G1 X123.082 Y140.265 E-.10924
G1 X123.194 Y140.234 E-.04397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.11 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F1823
M204 S5000
G1 X127.582 Y143.179 E.00213
G3 X123.911 Y139.411 I-3.585 J-.179 E.51159
G1 X124.1 Y139.412 E.00579
G3 X127.582 Y142.821 I-.103 J3.588 E.1646
G1 X127.586 Y143.05 E.00702
M204 S10000
G1 X127.237 Y143.032 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355515
G1 F1823
M204 S6000
G1 X127.222 Y143.322 E.0074
G1 X127.174 Y143.642 E.00822
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.258 E.00822
G1 X126.844 Y144.548 E.00822
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00823
G1 X126.269 Y145.31 E.00794
G1 X125.888 Y145.631 E.0127
G1 X125.62 Y145.804 E.00813
G1 X125.329 Y145.952 E.00831
G1 X125.032 Y146.069 E.00813
G1 X124.721 Y146.156 E.00822
G1 X124.404 Y146.212 E.00822
G1 X124.078 Y146.236 E.00833
G1 X123.759 Y146.228 E.00812
G1 X123.439 Y146.188 E.00823
G1 X123.124 Y146.117 E.00821
G1 X122.818 Y146.014 E.00823
G1 X122.524 Y145.881 E.00822
G1 X122.245 Y145.72 E.00822
G1 X121.982 Y145.531 E.00823
G1 X121.741 Y145.318 E.00821
G1 X121.521 Y145.081 E.00823
G1 X121.326 Y144.824 E.00822
G1 X121.158 Y144.548 E.00822
G1 X121.018 Y144.258 E.00822
G1 X120.908 Y143.954 E.00821
G1 X120.828 Y143.641 E.00823
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y143 E.00822
G1 X120.78 Y142.678 E.00822
G1 X120.828 Y142.359 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.743 E.00821
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00823
G1 X121.521 Y140.919 E.00822
G1 X121.738 Y140.685 E.00813
G1 X121.983 Y140.469 E.00832
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00822
G1 X122.815 Y139.988 E.00812
G1 X123.124 Y139.883 E.00833
G1 X123.435 Y139.812 E.00812
M73 P93 R1
G1 X123.924 Y139.764 E.01253
G1 X124.243 Y139.772 E.00812
G1 X124.563 Y139.812 E.00822
G1 X124.878 Y139.883 E.00821
G1 X125.184 Y139.986 E.00823
G1 X125.478 Y140.119 E.00822
G1 X125.758 Y140.28 E.00822
G1 X126.02 Y140.469 E.00822
G1 X126.262 Y140.682 E.00822
G1 X126.481 Y140.919 E.00822
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.452 E.00823
G1 X126.984 Y141.742 E.00822
G1 X127.095 Y142.046 E.00823
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00823
G1 X127.237 Y142.972 E.00751
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11516.518
G1 X127.222 Y143.322 E-.13322
G1 X127.174 Y143.642 E-.12263
G1 X127.095 Y143.954 E-.12264
G1 X126.984 Y144.258 E-.12261
G1 X126.844 Y144.548 E-.12264
G1 X126.676 Y144.824 E-.12256
G1 X126.654 Y144.852 E-.01369
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/53
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.8 I-.298 J-1.18 P1  F42000
M73 P94 R1
G1 X112.604 Y148.397 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1826
M204 S6000
G1 X112.604 Y147.603 E.02635
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.355 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G3 X112.212 Y148.324 I.352 J-.35 E.01101
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.501 J.036 E.02211
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.49 E.02232
G3 X135.782 Y148.394 I-3.644 J.295 E.0212
G3 X135.323 Y148.789 I-.486 J-.1 E.02
G1 X112.677 Y148.789 E.69584
G3 X112.4 Y148.683 I.031 J-.496 E.00925
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.496 E-.09084
G1 X112.212 Y148.324 E-.06713
G1 X112.212 Y147.676 E-.24612
G1 X112.258 Y147.492 E-.07188
G1 X112.372 Y147.337 E-.07336
G1 X112.535 Y147.24 E-.07192
G1 X112.68 Y147.211 E-.05619
G1 X112.897 Y147.211 E-.08257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430366
G1 F1826
M204 S6000
G1 X135.195 Y148 E.70683
; WIPE_START
G1 F9291.637
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.576 Y144.2 Z9 F42000
G1 X121.628 Y141.361 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1826
M204 S5000
G1 X121.888 Y141.036 E.01278
G3 X123.929 Y140.116 I2.113 J1.964 E.07065
G1 X124.073 Y140.116 E.00443
G3 X121.594 Y141.41 I-.072 J2.884 E.46721
; WIPE_START
G1 F3000
M204 S6000
G1 X121.888 Y141.036 E-.18075
G1 X122.092 Y140.837 E-.10835
G1 X122.317 Y140.658 E-.10929
G1 X122.559 Y140.501 E-.10936
G1 X122.815 Y140.37 E-.10932
G1 X123.082 Y140.265 E-.10923
G1 X123.168 Y140.241 E-.0337
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.587 Y143.115 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F1826
M204 S5000
G1 X127.584 Y143.179 E.00195
G3 X123.912 Y139.411 I-3.585 J-.179 E.51152
G1 X124.094 Y139.411 E.0056
G3 X127.584 Y142.821 I-.094 J3.588 E.16487
G1 X127.586 Y143.055 E.00719
M204 S10000
G1 X127.237 Y143.038 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355514
G1 F1826
M204 S6000
G1 X127.222 Y143.322 E.00725
G1 X127.174 Y143.642 E.00823
G1 X127.095 Y143.954 E.00822
G1 X126.984 Y144.257 E.00821
G1 X126.844 Y144.548 E.00823
G1 X126.676 Y144.824 E.00822
G1 X126.481 Y145.081 E.00822
G1 X126.262 Y145.318 E.00822
G1 X126.02 Y145.531 E.00822
G1 X125.758 Y145.719 E.00821
G1 X125.478 Y145.881 E.00822
G1 X125.184 Y146.014 E.00823
G1 X124.878 Y146.116 E.00822
G1 X124.564 Y146.188 E.00821
G1 X124.243 Y146.228 E.00823
G1 X123.924 Y146.236 E.00812
G1 X123.599 Y146.212 E.00832
G1 X123.281 Y146.156 E.00823
G1 X122.97 Y146.069 E.00822
G1 X122.67 Y145.951 E.00822
G1 X122.382 Y145.804 E.00822
G1 X122.111 Y145.629 E.00823
G1 X121.859 Y145.427 E.00822
G1 X121.631 Y145.205 E.00811
G1 X121.324 Y144.821 E.01252
G1 X121.158 Y144.549 E.00812
G1 X121.016 Y144.254 E.00833
G1 X120.907 Y143.954 E.00812
G1 X120.828 Y143.641 E.00823
G1 X120.78 Y143.322 E.00822
G1 X120.764 Y142.996 E.00832
G1 X120.78 Y142.678 E.00812
G1 X120.828 Y142.359 E.00822
G1 X120.907 Y142.046 E.00822
G1 X121.018 Y141.742 E.00822
G1 X121.158 Y141.452 E.00822
G1 X121.326 Y141.176 E.00822
G1 X121.521 Y140.919 E.00822
G1 X121.741 Y140.682 E.00822
G1 X121.983 Y140.469 E.00822
G1 X122.245 Y140.28 E.00822
G1 X122.524 Y140.119 E.00821
G1 X122.818 Y139.986 E.00823
G1 X123.124 Y139.884 E.00822
G1 X123.439 Y139.812 E.00822
G1 X123.759 Y139.772 E.00822
G1 X124.078 Y139.764 E.00812
G1 X124.567 Y139.812 E.01252
G1 X124.878 Y139.883 E.00812
G1 X125.188 Y139.988 E.00833
G1 X125.478 Y140.119 E.00812
G1 X125.758 Y140.281 E.00822
G1 X126.02 Y140.469 E.00821
G1 X126.264 Y140.685 E.00832
G1 X126.481 Y140.919 E.00812
G1 X126.676 Y141.176 E.00822
G1 X126.844 Y141.451 E.00822
G1 X126.984 Y141.743 E.00823
G1 X127.095 Y142.046 E.00822
G1 X127.174 Y142.358 E.00822
G1 X127.222 Y142.678 E.00823
G1 X127.237 Y142.978 E.00766
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11516.555
G1 X127.222 Y143.322 E-.13096
G1 X127.174 Y143.642 E-.12271
G1 X127.095 Y143.954 E-.1226
G1 X126.984 Y144.257 E-.12253
G1 X126.844 Y144.548 E-.12276
G1 X126.676 Y144.824 E-.12265
G1 X126.651 Y144.857 E-.01579
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/53
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9 I-.297 J-1.18 P1  F42000
G1 X112.604 Y148.397 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.355 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.35 E.01101
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.395 I-3.636 J.295 E.02121
G3 X135.323 Y148.789 I-.486 J-.101 E.01999
G1 X112.677 Y148.789 E.69585
G3 X112.4 Y148.684 I.031 J-.496 E.00924
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.495 E-.09094
G1 X112.212 Y148.324 E-.06707
G1 X112.212 Y147.676 E-.2461
G1 X112.257 Y147.493 E-.07169
G1 X112.372 Y147.337 E-.07354
G1 X112.534 Y147.24 E-.07162
G1 X112.68 Y147.211 E-.05654
G1 X112.897 Y147.211 E-.08251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430376
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70685
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9291.393
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/53
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.2 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02635
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.35 E.01102
G1 X112.212 Y147.676 E.0199
G3 X112.68 Y147.211 I.499 J.035 E.02213
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.395 I-3.631 J.295 E.02122
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
G1 X112.677 Y148.789 E.69584
G3 X112.4 Y148.684 I.031 J-.496 E.00924
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.494 E-.09147
G1 X112.212 Y148.324 E-.06663
G1 X112.212 Y147.676 E-.24614
G1 X112.257 Y147.493 E-.07166
G1 X112.372 Y147.337 E-.0735
G1 X112.493 Y147.257 E-.0553
G1 X112.68 Y147.211 E-.0729
G1 X112.897 Y147.211 E-.08241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430386
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70687
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9291.149
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/53
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.4 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01103
G1 X112.212 Y147.676 E.01989
G3 X112.68 Y147.211 I.505 J.04 E.02208
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.395 I-3.633 J.295 E.02122
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
G1 X112.677 Y148.789 E.69584
G3 X112.401 Y148.684 I.031 J-.496 E.00923
; WIPE_START
G1 F3000
M204 S6000
G1 X112.252 Y148.494 E-.09154
G1 X112.212 Y148.324 E-.06667
G1 X112.212 Y147.676 E-.24599
G1 X112.257 Y147.493 E-.07172
G1 X112.338 Y147.371 E-.05555
G1 X112.494 Y147.257 E-.07336
G1 X112.68 Y147.211 E-.07277
G1 X112.896 Y147.211 E-.0824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430396
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70689
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9290.905
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/53
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.6 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01102
G1 X112.212 Y147.676 E.01991
G3 X112.68 Y147.211 I.5 J.035 E.02212
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.782 Y148.395 I-3.63 J.295 E.02122
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
M73 P95 R1
G1 X112.677 Y148.789 E.69584
G3 X112.401 Y148.684 I.031 J-.496 E.00923
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.494 E-.09188
G1 X112.212 Y148.324 E-.06626
G1 X112.212 Y147.676 E-.2462
G1 X112.257 Y147.493 E-.07172
G1 X112.372 Y147.337 E-.07344
G1 X112.492 Y147.258 E-.05462
G1 X112.68 Y147.211 E-.07356
G1 X112.896 Y147.211 E-.08232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430406
G1 F1200
M204 S6000
G1 X135.195 Y148 E.7069
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9290.66
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/53
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.8 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01102
G1 X112.212 Y147.676 E.01991
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.349 Y147.213 E.69656
G3 X135.791 Y147.705 I-.05 J.489 E.02232
G3 X135.782 Y148.395 I-3.617 J.295 E.02122
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
G1 X112.677 Y148.789 E.69583
G3 X112.401 Y148.684 I.03 J-.496 E.00923
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.493 E-.09231
G1 X112.212 Y148.324 E-.06581
G1 X112.212 Y147.676 E-.24621
G1 X112.258 Y147.491 E-.07262
G1 X112.372 Y147.337 E-.07259
G1 X112.494 Y147.256 E-.05544
G1 X112.68 Y147.211 E-.07275
G1 X112.896 Y147.211 E-.08228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430416
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70692
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9290.416
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/53
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01103
G1 X112.212 Y147.676 E.01991
G3 X112.677 Y147.211 I.5 J.035 E.02205
G1 X135.349 Y147.213 E.69664
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.782 Y148.395 I-3.621 J.295 E.02122
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
G1 X112.677 Y148.789 E.69583
G3 X112.401 Y148.684 I.03 J-.496 E.00922
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.493 E-.09245
G1 X112.212 Y148.324 E-.06573
G1 X112.212 Y147.676 E-.24624
G1 X112.257 Y147.493 E-.07173
G1 X112.372 Y147.337 E-.0735
G1 X112.492 Y147.257 E-.05462
G1 X112.677 Y147.211 E-.07261
G1 X112.896 Y147.211 E-.08313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


M73 P96 R1
G1 X112.808 Y148 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430427
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70694
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9290.171
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/53
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.2 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02635
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01104
G1 X112.212 Y147.676 E.01991
G3 X112.677 Y147.211 I.5 J.035 E.02205
G1 X135.349 Y147.213 E.69664
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.781 Y148.395 I-3.618 J.295 E.02123
G3 X135.323 Y148.789 I-.485 J-.101 E.01998
G1 X112.677 Y148.789 E.69584
G3 X112.401 Y148.684 I.031 J-.496 E.00921
; WIPE_START
G1 F3000
M204 S6000
G1 X112.251 Y148.492 E-.09274
G1 X112.212 Y148.324 E-.06557
G1 X112.212 Y147.676 E-.24618
G1 X112.257 Y147.493 E-.07165
G1 X112.371 Y147.339 E-.07267
G1 X112.492 Y147.258 E-.05551
G1 X112.677 Y147.211 E-.07259
G1 X112.896 Y147.211 E-.08308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430447
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70698
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9289.688
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/53
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.4 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02635
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.644 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.352 J-.351 E.01103
G1 X112.212 Y147.676 E.01991
G3 X112.68 Y147.211 I.505 J.04 E.02207
G1 X135.349 Y147.213 E.69657
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.782 Y148.395 I-3.615 J.295 E.02123
G3 X135.323 Y148.789 I-.485 J-.101 E.01999
G1 X112.677 Y148.789 E.69583
G3 X112.401 Y148.684 I.031 J-.496 E.00922
; WIPE_START
G1 F3000
M204 S6000
G1 X112.25 Y148.491 E-.09306
G1 X112.212 Y148.324 E-.06517
G1 X112.212 Y147.676 E-.24625
G1 X112.258 Y147.491 E-.07266
G1 X112.372 Y147.337 E-.07253
G1 X112.536 Y147.239 E-.07258
G1 X112.68 Y147.211 E-.05554
G1 X112.896 Y147.211 E-.08222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.6 F4000
            G39.3 S1
            G0 Z10.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430457
G1 F1200
M204 S6000
M73 P96 R0
G1 X135.195 Y148 E.707
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9289.444
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/53
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.6 I-.023 J-1.217 P1  F42000
G1 X112.604 Y148.397 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P97 R0
G1 F1200
M204 S6000
G1 X112.604 Y147.603 E.02634
G1 X135.399 Y147.602 E.75615
G1 X135.399 Y148.397 E.02637
G1 X112.664 Y148.397 E.75416
M204 S250
G1 X112.356 Y148.645 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X112.212 Y148.324 I.351 J-.351 E.01104
G1 X112.212 Y147.676 E.01991
G3 X112.68 Y147.211 I.499 J.034 E.02213
G1 X135.349 Y147.213 E.69657
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.788 Y148.348 I-6.523 J.295 E.01975
G3 X135.325 Y148.789 I-.505 J-.066 E.02126
G1 X112.677 Y148.789 E.6959
G3 X112.401 Y148.684 I.03 J-.496 E.00921
; WIPE_START
G1 F3000
M204 S6000
G1 X112.25 Y148.49 E-.0935
G1 X112.212 Y148.324 E-.06487
G1 X112.212 Y147.676 E-.24622
G1 X112.257 Y147.493 E-.07164
G1 X112.372 Y147.337 E-.07355
G1 X112.535 Y147.24 E-.07204
G1 X112.68 Y147.211 E-.05608
G1 X112.896 Y147.211 E-.0821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.8 F4000
            G39.3 S1
            G0 Z10.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.808 Y148 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430467
G1 F1200
M204 S6000
G1 X135.195 Y148 E.70702
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9289.198
G1 X133.195 Y148 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/53
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.8 I-.038 J-1.216 P1  F42000
G1 X112.356 Y148.645 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1523
M204 S5000
G3 X112.212 Y148.324 I.351 J-.351 E.01104
G1 X112.212 Y147.676 E.01991
G3 X112.68 Y147.211 I.499 J.034 E.02214
G1 X135.349 Y147.213 E.69657
G3 X135.791 Y147.705 I-.05 J.489 E.02231
G3 X135.788 Y148.348 I-6.506 J.295 E.01976
G3 X135.325 Y148.789 I-.498 J-.06 E.02132
G1 X112.68 Y148.789 E.69582
G3 X112.401 Y148.684 I.027 J-.496 E.00929
; WIPE_START
G1 F3000
M204 S6000
G1 X112.25 Y148.49 E-.09372
G1 X112.212 Y148.324 E-.06459
G1 X112.212 Y147.676 E-.24617
G1 X112.257 Y147.493 E-.07176
G1 X112.37 Y147.339 E-.07257
G1 X112.534 Y147.24 E-.07269
G1 X112.68 Y147.211 E-.05648
G1 X112.896 Y147.211 E-.08203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11 F4000
            G39.3 S1
            G0 Z11 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X135.584 Y148.115 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F1523
M204 S2000
G1 X134.888 Y147.42 E.03022
G1 X134.355 Y147.42
G1 X135.458 Y148.523 E.04794
G1 X134.984 Y148.582
G1 X133.822 Y147.42 E.05049
G1 X133.288 Y147.42
G1 X134.45 Y148.582 E.05049
G1 X133.917 Y148.582
G1 X132.755 Y147.42 E.05049
G1 X132.222 Y147.42
G1 X133.384 Y148.582 E.0505
G1 X132.851 Y148.582
G1 X131.689 Y147.42 E.0505
G1 X131.155 Y147.42
G1 X132.317 Y148.582 E.0505
G1 X131.784 Y148.582
G1 X130.622 Y147.42 E.0505
G1 X130.089 Y147.42
G1 X131.251 Y148.582 E.0505
G1 X130.718 Y148.582
G1 X129.555 Y147.42 E.05051
G1 X129.022 Y147.419
M73 P98 R0
G1 X130.184 Y148.582 E.05051
G1 X129.651 Y148.582
G1 X128.489 Y147.419 E.05051
G1 X127.955 Y147.419
G1 X129.118 Y148.582 E.05051
G1 X128.585 Y148.582
G1 X127.422 Y147.419 E.05051
G1 X126.889 Y147.419
G1 X128.051 Y148.582 E.05051
G1 X127.518 Y148.582
G1 X126.356 Y147.419 E.05052
G1 X125.822 Y147.419
G1 X126.985 Y148.582 E.05052
G1 X126.452 Y148.582
G1 X125.289 Y147.419 E.05052
G1 X124.756 Y147.419
G1 X125.918 Y148.582 E.05052
G1 X125.385 Y148.582
G1 X124.222 Y147.419 E.05052
G1 X123.689 Y147.419
G1 X124.852 Y148.582 E.05053
G1 X124.319 Y148.582
G1 X123.156 Y147.419 E.05053
G1 X122.622 Y147.419
G1 X123.785 Y148.582 E.05053
G1 X123.252 Y148.582
G1 X122.089 Y147.419 E.05053
G1 X121.556 Y147.419
G1 X122.719 Y148.582 E.05053
G1 X122.185 Y148.582
G1 X121.023 Y147.419 E.05053
G1 X120.489 Y147.419
G1 X121.652 Y148.582 E.05054
G1 X121.119 Y148.582
G1 X119.956 Y147.419 E.05054
G1 X119.423 Y147.419
G1 X120.586 Y148.582 E.05054
G1 X120.052 Y148.582
G1 X118.889 Y147.419 E.05054
G1 X118.356 Y147.419
G1 X119.519 Y148.582 E.05054
G1 X118.986 Y148.582
G1 X117.823 Y147.419 E.05055
G1 X117.289 Y147.419
G1 X118.453 Y148.582 E.05055
G1 X117.919 Y148.582
G1 X116.756 Y147.419 E.05055
G1 X116.223 Y147.418
G1 X117.386 Y148.582 E.05055
G1 X116.853 Y148.582
G1 X115.69 Y147.418 E.05055
G1 X115.156 Y147.418
G1 X116.32 Y148.582 E.05056
G1 X115.786 Y148.582
G1 X114.623 Y147.418 E.05056
G1 X114.09 Y147.418
G1 X115.253 Y148.582 E.05056
G1 X114.72 Y148.582
G1 X113.556 Y147.418 E.05056
G1 X113.023 Y147.418
G1 X114.187 Y148.582 E.05056
G1 X113.653 Y148.582
G1 X112.541 Y147.47 E.04832
G1 X112.419 Y147.881
G1 X113.12 Y148.582 E.03045
; WIPE_START
G1 F3000
M204 S6000
G1 X112.419 Y147.881 E-.37662
G1 X112.541 Y147.47 E-.16296
G1 X112.952 Y147.88 E-.22042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.584 Y147.842 Z11 F42000
G1 X135.603 Y147.766 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.227657
G1 F1523
M204 S6000
G2 X135.178 Y147.401 I-.753 J.446 E.00858
; WIPE_START
G1 F15000
G1 X135.411 Y147.535 E-.35896
G1 X135.603 Y147.766 E-.40104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.975 Y148.045 Z11 F42000
G1 X112.764 Y148.601 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.239118
G1 F1523
M204 S6000
G3 X112.4 Y148.238 I.735 J-1.099 E.00826
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X112.564 Y148.437 E-.37922
G1 X112.764 Y148.601 E-.38078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
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
G1 Z11 F900 ; lower z a little
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

    G1 Z110.6 F600
    G1 Z108.6

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

