; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 6m 41s; total estimated time: 13m 11s
; total layer number: 36
; total filament length [mm] : 441.02
; total filament volume [cm^3] : 1060.78
; total filament weight [g] : 1.32
; model label id: 47,58
; object max height: 7.20,2.80
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
; initial_layer_print_height = 0.2
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
; print_settings_id = AirGap Flip Vault A1 PLA
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
M73 P0 R13
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
M73 P1 R13
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
M73 P4 R12
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P6 R12
G1 X-48.2 F3000
M73 P8 R12
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
    G1 E10 F113.124
    M983 F1.8854 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P10 R11
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F1.8854 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
M73 P11 R11
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P12 R11
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F1.8854 H0.4
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
M73 P45 R7
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
M73 P46 R7
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
    G29 A1 X116.7 Y106.6 I22.6 J42.8
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
    G0 X128 E8  F271.497
    G0 X133 E.3742  F452.496
    G0 X138 E.3742  F1809.98
    G0 X143 E.3742  F452.496
    G0 X148 E.3742  F1809.98
    G0 X153 E.3742  F452.496
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
M73 P46 R6
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F271.497
    G0 X133 E.3742  F452.496
    G0 X138 E.3742  F1809.98
    G0 X143 E.3742  F452.496
    G0 X148 E.3742  F1809.98
    G0 X153 E.3742  F452.496
    G91
M73 P47 R6
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
; layer num/total_layer_count: 1/36
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.009 Y148.088 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X136.711 Y148.125 E.01119
G1 X119.29 Y148.125 E.64884
M73 P48 R6
G3 X117.975 Y146.811 I.014 J-1.33 E.07669
G1 X117.975 Y129.389 E.64887
G3 X119.289 Y128.075 I1.33 J.015 E.07667
G1 X136.71 Y128.075 E.64884
G3 X138.025 Y129.389 I-.014 J1.33 E.07669
G1 X138.025 Y146.81 E.64884
G3 X137.067 Y148.072 I-1.33 J-.014 E.06324
; WIPE_START
G1 X136.711 Y148.125 E-.1368
G1 X135.071 Y148.125 E-.6232
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.99 Y142.43 Z.6 F42000
G1 X117.683 Y128.634 Z.6
M73 P49 R6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X117.482 Y128.578 E.00775
G3 X117.554 Y127.913 I1.467 J-.177 E.02513
G3 X118.124 Y127.582 I.554 J.297 E.02583
G1 X118.478 Y127.582 E.01321
G1 X118.534 Y127.783 E.00776
G2 X117.711 Y128.581 I.888 J1.74 E.04337
; WIPE_START
G1 X117.482 Y128.578 E-.08688
G1 X117.488 Y128.126 E-.17202
G1 X117.554 Y127.913 E-.08447
G1 X117.638 Y127.792 E-.05582
G1 X117.813 Y127.654 E-.08504
G1 X117.952 Y127.601 E-.05648
G1 X118.124 Y127.582 E-.06549
G1 X118.478 Y127.582 E-.1348
G1 X118.492 Y127.63 E-.01899
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.114 Y128.016 Z.6 F42000
G1 X138.317 Y128.634 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1500
M204 S500
G2 X137.466 Y127.783 I-1.74 J.888 E.0456
G1 X137.522 Y127.582 E.00776
G3 X137.97 Y127.588 I.177 J3.708 E.0167
G3 X138.518 Y128.224 I-.085 J.628 E.03418
G1 X138.518 Y128.578 E.01321
G1 X138.375 Y128.618 E.00552
; WIPE_START
G1 X138.168 Y128.387 E-.11809
G1 X138.035 Y128.217 E-.08191
G1 X137.883 Y128.065 E-.08175
G1 X137.713 Y127.932 E-.08181
G1 X137.466 Y127.783 E-.10986
G1 X137.522 Y127.582 E-.07913
G1 X137.97 Y127.588 E-.17028
G1 X138.063 Y127.616 E-.03716
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.844 Y135.246 Z.6 F42000
G1 X137.466 Y148.417 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1500
M204 S500
G2 X138.317 Y147.566 I-.888 J-1.74 E.0456
G1 X138.518 Y147.622 E.00775
G3 X138.446 Y148.287 I-1.467 J.177 E.02513
G3 X137.876 Y148.618 I-.554 J-.297 E.02583
G1 X137.522 Y148.618 E.01321
G1 X137.482 Y148.475 E.00552
; WIPE_START
G1 X137.713 Y148.268 E-.11805
G1 X137.883 Y148.135 E-.08178
G1 X138.035 Y147.983 E-.08179
G1 X138.168 Y147.813 E-.08188
G1 X138.317 Y147.566 E-.10992
G1 X138.518 Y147.622 E-.07911
G1 X138.512 Y148.074 E-.17201
G1 X138.484 Y148.163 E-.03545
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.852 Y148.261 Z.6 F42000
G1 X118.534 Y148.417 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1500
M204 S500
G1 X118.478 Y148.618 E.00776
G3 X117.813 Y148.546 I-.177 J-1.467 E.02513
G3 X117.482 Y147.976 I.297 J-.554 E.02583
G1 X117.482 Y147.622 E.01321
G1 X117.683 Y147.566 E.00776
G1 X117.832 Y147.813 E.01077
G2 X118.481 Y148.389 I1.577 J-1.122 E.0326
M204 S6000
G1 X117.719 Y149.003 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X117.025 Y147.99 I.387 J-1.009 E.04864
G1 X117.025 Y128.21 E.73674
G3 X118.11 Y127.125 I1.082 J-.003 E.06352
G1 X138.024 Y127.133 E.74172
G3 X138.975 Y128.21 I-.149 J1.09 E.05831
G1 X138.975 Y147.99 E.73674
G3 X137.89 Y149.075 I-1.081 J.004 E.06353
G1 X118.11 Y149.075 E.73674
G3 X117.775 Y149.023 I-.004 J-1.081 E.01266
; WIPE_START
G1 X117.49 Y148.884 E-.12073
G1 X117.388 Y148.804 E-.04924
G1 X117.216 Y148.61 E-.09849
G1 X117.095 Y148.381 E-.09842
G1 X117.033 Y148.13 E-.09841
G1 X117.025 Y147.99 E-.05307
G1 X117.025 Y147.354 E-.24164
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 1 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


; object ids of this layer1 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.538 Y147.369 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.536793
G1 F1500
M204 S500
G3 X117.5 Y146.834 I4.854 J-.609 E.02159
M73 P50 R6
G1 X117.5 Y129.382 E.70233
G3 X117.538 Y128.831 I6.273 J.153 E.02223
M204 S6000
G1 X117.766 Y128.056 F42000
; LINE_WIDTH: 0.111811
G1 F1500
M204 S500
G3 X117.956 Y127.866 I.673 J.483 E.00152
M204 S6000
G1 X118.731 Y127.638 F42000
; LINE_WIDTH: 0.536782
G1 F1500
M204 S500
G3 X119.266 Y127.6 I.609 J4.853 E.02159
G1 X136.717 Y127.6 E.70228
G3 X137.269 Y127.638 I-.139 J6.085 E.02227
M204 S6000
G1 X138.044 Y127.866 F42000
; LINE_WIDTH: 0.11181
G1 F1500
M204 S500
G3 X138.234 Y128.056 I-.482 J.673 E.00152
M204 S6000
G1 X138.462 Y128.831 F42000
; LINE_WIDTH: 0.536782
G1 F1500
M204 S500
G3 X138.5 Y129.366 I-4.857 J.609 E.02159
G1 X138.5 Y146.817 E.70228
G3 X138.462 Y147.369 I-6.086 J-.139 E.02227
M204 S6000
G1 X138.234 Y148.144 F42000
; LINE_WIDTH: 0.111879
G1 F1500
M204 S500
G3 X138.044 Y148.334 I-.663 J-.473 E.00152
M204 S6000
G1 X137.269 Y148.562 F42000
; LINE_WIDTH: 0.536782
G1 F1500
M204 S500
G3 X136.718 Y148.6 I-.704 J-6.231 E.02223
G1 X119.268 Y148.6 E.70223
G3 X118.731 Y148.562 I.062 J-4.755 E.02168
M204 S6000
G1 X117.956 Y148.334 F42000
; LINE_WIDTH: 0.111878
G1 F1500
M204 S500
G3 X117.766 Y148.144 I.473 J-.664 E.00152
; OBJECT_ID: 47
; WIPE_START
G1 X117.956 Y148.334 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S6000
G1 X119.017 Y140.776 Z.6 F42000
G1 X121.649 Y122.016 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G3 X121.599 Y121.827 I.186 J-.151 E.00751
G1 X121.599 Y109.573 E.45639
G3 X121.873 Y109.299 I.237 J-.038 E.01687
G1 X134.138 Y109.3 E.4568
G3 X134.378 Y109.426 I.026 J.244 E.0107
G1 X134.401 Y109.573 E.00556
G1 X134.401 Y121.827 E.45639
G3 X134.127 Y122.101 I-.236 J.038 E.01687
G1 X121.873 Y122.101 E.45639
G3 X121.693 Y122.058 I-.038 J-.237 E.0071
M204 S6000
G1 X121.27 Y122.291 F42000
G1 F1500
M204 S500
G3 X121.142 Y121.863 I.595 J-.413 E.01695
G1 X121.142 Y109.537 E.45907
M73 P51 R6
G3 X121.409 Y108.971 I.739 J.002 E.0241
G3 X121.837 Y108.842 I.413 J.595 E.01695
G1 X134.174 Y108.843 E.45948
G3 X134.858 Y109.537 I.011 J.674 E.0406
G1 X134.858 Y121.863 E.45907
G3 X134.591 Y122.429 I-.739 J-.002 E.0241
G3 X134.163 Y122.558 I-.413 J-.595 E.01695
G1 X121.837 Y122.558 E.45907
G3 X121.311 Y122.336 I.002 J-.739 E.02186
M204 S6000
G1 X120.896 Y122.563 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X120.742 Y122.26 E.01267
G1 X120.684 Y121.899 E.01364
G1 X120.684 Y109.501 E.46175
G1 X120.742 Y109.14 E.01364
G1 X120.896 Y108.837 E.01267
G1 X121.137 Y108.596 E.01267
G1 X121.44 Y108.442 E.01267
G1 X121.801 Y108.384 E.01364
G1 X134.21 Y108.386 E.46216
G1 X134.56 Y108.442 E.01323
G1 X134.863 Y108.596 E.01267
G1 X135.104 Y108.837 E.01267
G1 X135.258 Y109.14 E.01267
G1 X135.316 Y109.501 E.01364
G1 X135.316 Y121.899 E.46175
G1 X135.258 Y122.26 E.01364
G1 X135.104 Y122.563 E.01267
G1 X134.863 Y122.804 E.01267
G1 X134.56 Y122.958 E.01267
G1 X134.199 Y123.016 E.01364
G1 X121.801 Y123.016 E.46175
G1 X121.44 Y122.958 E.01364
G1 X121.137 Y122.804 E.01267
G1 X120.939 Y122.606 E.01043
; WIPE_START
G1 X120.742 Y122.26 E-.15109
G1 X120.684 Y121.899 E-.13912
G1 X120.684 Y120.662 E-.46979
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.387 Y115.589 Z.6 F42000
G1 X133.249 Y109.483 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50626
G1 F2400
M204 S500
G1 X134.013 Y110.246 E.04077
G1 X134.013 Y110.902 E.02474
G1 X132.8 Y109.689 E.06477
G1 X132.144 Y109.689 E.02474
G1 X134.013 Y111.557 E.09977
G1 X134.013 Y112.212 E.02474
G1 X131.489 Y109.688 E.13476
G1 X130.834 Y109.688 E.02474
G1 X134.013 Y112.868 E.16975
G1 X134.013 Y113.523 E.02474
G1 X130.178 Y109.688 E.20475
G1 X129.523 Y109.688 E.02474
G1 X134.013 Y114.178 E.23974
G1 X134.013 Y114.833 E.02474
G1 X128.868 Y109.688 E.27473
G1 X128.212 Y109.688 E.02474
G1 X134.013 Y115.489 E.30972
G1 X134.013 Y116.144 E.02474
G1 X127.557 Y109.688 E.34472
G1 X126.902 Y109.688 E.02474
G1 X134.013 Y116.799 E.37971
G1 X134.013 Y117.454 E.02474
G1 X126.246 Y109.688 E.4147
G1 X125.591 Y109.688 E.02474
G1 X134.013 Y118.11 E.4497
G1 X134.013 Y118.765 E.02474
G1 X124.936 Y109.688 E.48469
G1 X124.28 Y109.687 E.02474
G1 X134.013 Y119.42 E.51968
G1 X134.013 Y120.075 E.02474
M73 P52 R6
G1 X123.625 Y109.687 E.55467
G1 X122.97 Y109.687 E.02474
G1 X134.013 Y120.731 E.58967
G1 X134.013 Y121.386 E.02474
G1 X122.314 Y109.687 E.62466
G1 X121.987 Y109.687 E.01235
G1 X121.987 Y110.015 E.01239
G1 X133.685 Y121.713 E.62459
G1 X133.029 Y121.713 E.02474
G1 X121.987 Y110.671 E.58961
G1 X121.987 Y111.326 E.02474
G1 X132.374 Y121.713 E.55462
G1 X131.719 Y121.713 E.02474
G1 X121.987 Y111.981 E.51963
G1 X121.987 Y112.636 E.02474
G1 X131.064 Y121.713 E.48464
G1 X130.408 Y121.713 E.02474
G1 X121.987 Y113.292 E.44965
G1 X121.987 Y113.947 E.02474
G1 X129.753 Y121.713 E.41467
G1 X129.098 Y121.713 E.02474
G1 X121.987 Y114.602 E.37968
G1 X121.987 Y115.257 E.02474
G1 X128.443 Y121.713 E.34469
G1 X127.787 Y121.713 E.02474
G1 X121.987 Y115.913 E.3097
G1 X121.987 Y116.568 E.02474
G1 X127.132 Y121.713 E.27471
G1 X126.477 Y121.713 E.02474
G1 X121.987 Y117.223 E.23973
G1 X121.987 Y117.879 E.02474
G1 X125.821 Y121.713 E.20474
G1 X125.166 Y121.713 E.02474
G1 X121.987 Y118.534 E.16975
G1 X121.987 Y119.189 E.02474
G1 X124.511 Y121.713 E.13476
G1 X123.856 Y121.713 E.02474
G1 X121.987 Y119.844 E.09977
G1 X121.987 Y120.5 E.02474
G1 X123.2 Y121.713 E.06479
G1 X122.545 Y121.713 E.02474
G1 X121.781 Y120.949 E.04078
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X122.545 Y121.713 E-.41043
G1 X123.2 Y121.713 E-.249
M73 P53 R6
G1 X123.013 Y121.526 E-.10057
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 2/36
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.079 J.564 P1  F42000
G1 X137.041 Y148.362 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01079
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.822 I.023 J-1.607 E.08209
G1 X117.698 Y129.382 E.57852
G3 X119.282 Y127.798 I1.607 J.023 E.08221
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.378 I-.025 J1.609 E.08207
G1 X138.302 Y146.818 E.57852
G3 X137.1 Y148.35 I-1.607 J-.023 E.0694
M204 S250
G1 X136.989 Y147.974 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.706 Y148.01 I-.294 J-1.178 E.00879
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.808 I.011 J-1.215 E.05791
G1 X118.09 Y129.394 E.53508
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.392 I-.013 J1.217 E.05789
G1 X137.91 Y146.806 E.53508
G3 X137.047 Y147.958 I-1.215 J-.011 E.04732
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.13104
G1 X135.051 Y148.01 E-.62896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.426 Y148.334 Z.8 F42000
G1 X117.814 Y148.743 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.292 J-.75 E.03239
G1 X117.302 Y128.222 E.65548
G3 X118.118 Y127.402 I.807 J-.013 E.04278
G1 X137.981 Y127.408 E.65888
G3 X138.698 Y128.222 I-.101 J.812 E.03933
G1 X138.698 Y147.978 E.65536
G3 X137.882 Y148.798 I-.807 J.013 E.04278
G1 X118.118 Y148.798 E.65559
G3 X117.871 Y148.763 I-.012 J-.804 E.00832
M204 S250
G1 X117.681 Y149.113 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.677 Y149.111 E.00014
G3 X116.91 Y147.994 I.429 J-1.117 E.04427
G1 X116.91 Y128.208 E.60797
G3 X118.106 Y127.01 I1.199 J.001 E.05775
G1 X138.026 Y127.018 E.61207
G3 X139.09 Y128.208 I-.155 J1.209 E.05347
G1 X139.09 Y147.992 E.60793
G3 X137.894 Y149.19 I-1.199 J-.001 E.05775
G1 X118.106 Y149.19 E.60801
G3 X117.957 Y149.181 I0 J-1.196 E.00461
G1 X117.739 Y149.127 E.00687
; WIPE_START
M204 S6000
G1 X117.677 Y149.111 E-.02441
G1 X117.424 Y148.979 E-.10844
G1 X117.311 Y148.891 E-.05454
G1 X117.121 Y148.676 E-.10899
G1 X116.988 Y148.422 E-.109
G1 X116.919 Y148.143 E-.10896
G1 X116.91 Y147.994 E-.05703
G1 X116.91 Y147.497 E-.18862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 2 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


; object ids of this layer2 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472276
G1 F8384.655
M204 S6000
G1 X117.739 Y148.089 E.01986
; LINE_WIDTH: 0.514965
G1 F7626.398
G2 X117.934 Y148.317 I.549 J-.273 E.01166
G1 X117.96 Y148.334 E.0012
; LINE_WIDTH: 0.471644
G1 F8397.017
G2 X118.529 Y148.594 I2.372 J-4.426 E.02188
M204 S10000
G1 X118.718 Y148.594 F42000
; LINE_WIDTH: 0.39065
G1 F10352.871
M204 S6000
G3 X117.545 Y148.208 I5.908 J-19.903 E.03502
M204 S10000
G1 X117.892 Y148.554 F42000
; LINE_WIDTH: 0.390697
G1 F10351.485
M204 S6000
G3 X117.506 Y147.381 I19.313 J-7.015 E.03501
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390623
G1 F10353.673
M204 S6000
G3 X118.719 Y127.606 I6.989 J19.248 E.03504
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474288
G1 F8345.557
M204 S6000
G2 X117.96 Y127.866 I1.341 J3.678 E.02203
; LINE_WIDTH: 0.514807
G1 F7628.959
M73 P54 R6
G1 X117.877 Y127.93 E.004
G2 X117.739 Y128.111 I.354 J.415 E.00884
; LINE_WIDTH: 0.475477
G1 F8322.617
G1 X117.506 Y128.629 E.02001
M204 S10000
G1 X117.506 Y128.814 F42000
; LINE_WIDTH: 0.398873
G1 F10113.711
M204 S6000
G3 X117.892 Y127.645 I21.863 J6.583 E.03574
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.389575
G1 F10384.977
M204 S6000
G3 X138.494 Y128.819 I-19.3 J7.009 E.03492
M204 S10000
G1 X138.494 Y128.628 F42000
; LINE_WIDTH: 0.478861
G1 F8258.012
M204 S6000
G2 X138.231 Y128.056 I-3.508 J1.265 E.02242
G1 X138.214 Y128.03 E.00111
; LINE_WIDTH: 0.500969
G1 F7859.421
G1 X138.19 Y128 E.00142
G2 X138.024 Y127.857 I-.526 J.443 E.0082
G1 X137.545 Y127.606 E.0202
M204 S10000
G1 X137.28 Y127.606 F42000
; LINE_WIDTH: 0.390626
G1 F10353.595
M204 S6000
G3 X138.455 Y127.992 I-5.77 J19.504 E.03505
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390623
G1 F10353.661
M204 S6000
G3 X137.281 Y148.594 I-6.959 J-19.153 E.03504
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472303
G1 F8384.139
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.515528
G1 F7617.316
G2 X138.19 Y148.2 I-.268 J-.541 E.01
G1 X138.217 Y148.166 E.00167
; LINE_WIDTH: 0.478608
G1 F8262.795
G1 X138.234 Y148.14 E.0011
G2 X138.494 Y147.571 I-3.409 J-1.906 E.02224
M204 S10000
G1 X138.494 Y147.385 F42000
; LINE_WIDTH: 0.39891
G1 F10112.662
M204 S6000
G3 X138.107 Y148.555 I-21.506 J-6.466 E.03575
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.385 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.203 Y141.073 Z.8 F42000
G1 X121.386 Y122.22 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X121.288 Y121.894 I.389 J-.296 E.01157
G1 X121.288 Y109.507 E.4109
G3 X121.806 Y108.988 I.488 J-.031 E.02754
G1 X134.194 Y108.988 E.4109
G1 X134.405 Y109.021 E.00709
G3 X134.712 Y109.507 I-.18 J.454 E.02038
G1 X134.712 Y121.893 E.4109
G3 X134.193 Y122.413 I-.488 J.031 E.02754
G1 X121.807 Y122.413 E.4109
G3 X121.425 Y122.266 I-.031 J-.488 E.01397
M204 S10000
G1 X121.056 Y122.461 F42000
G1 F6000
M204 S6000
G3 X120.929 Y122.232 I.747 J-.563 E.00869
G1 X120.88 Y121.926 E.0103
G1 X120.88 Y109.474 E.41302
G1 X120.929 Y109.168 E.0103
G3 X121.468 Y108.629 I.873 J.334 E.02603
G1 X121.774 Y108.58 E.0103
G1 X134.226 Y108.58 E.41303
G1 X134.532 Y108.629 E.0103
G3 X135.071 Y109.168 I-.334 J.873 E.02603
G1 X135.12 Y109.474 E.0103
G1 X135.12 Y121.926 E.41302
G1 X135.071 Y122.232 E.0103
G3 X134.532 Y122.771 I-.873 J-.334 E.02603
G1 X134.226 Y122.82 E.0103
G1 X121.774 Y122.82 E.41302
G1 X121.468 Y122.771 E.0103
G3 X121.093 Y122.507 I.334 J-.873 E.01535
M204 S250
G1 X120.729 Y122.701 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3360
M204 S5000
G1 X120.727 Y122.699 E.00007
G1 F3420
G1 X120.551 Y122.355 E.01188
G1 F3540
G1 X120.488 Y121.956 E.0124
G1 F3600
G1 X120.488 Y109.444 E.38448
G1 F3540
G1 X120.551 Y109.045 E.0124
G1 F3420
G1 X120.727 Y108.701 E.01188
G1 F3360
G1 X121.001 Y108.427 E.01188
G1 F3420
G1 X121.345 Y108.252 E.01188
G1 F3540
G1 X121.744 Y108.188 E.0124
G1 F3600
G1 X134.256 Y108.188 E.38448
G1 F3540
G1 X134.29 Y108.194 E.00105
G1 X134.655 Y108.252 E.01135
G1 F3420
G1 X134.999 Y108.427 E.01188
G1 F3360
G1 X135.273 Y108.701 E.01188
G1 F3420
G1 X135.448 Y109.045 E.01188
G1 F3540
G1 X135.512 Y109.444 E.0124
G1 F3600
G1 X135.512 Y121.956 E.38448
G1 F3540
G1 X135.449 Y122.355 E.0124
G1 F3420
G1 X135.273 Y122.7 E.01188
G1 F3360
G1 X134.999 Y122.973 E.01188
G1 F3420
G1 X134.655 Y123.149 E.01188
G1 F3540
G1 X134.256 Y123.212 E.0124
G1 F3600
G1 X121.744 Y123.212 E.38448
M73 P54 R5
G1 F3540
G1 X121.345 Y123.149 E.0124
G1 F3420
G1 X121.001 Y122.973 E.01188
G1 F3360
G1 X120.771 Y122.743 E.00997
; WIPE_START
M204 S6000
G1 X120.727 Y122.699 E-.02365
G1 X120.551 Y122.355 E-.14693
G1 X120.488 Y121.956 E-.15334
G1 X120.488 Y120.809 E-.43609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.14 Y113.204 Z.8 F42000
G1 X121.451 Y109.581 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42409
G1 F9444.604
M204 S6000
G1 X121.681 Y109.351 E.01011
G3 X121.833 Y109.321 I.122 J.218 E.00488
G1 X122.251 Y109.321 E.01298
G1 X121.621 Y109.951 E.02767
G1 X121.621 Y110.49 E.01674
G1 X122.79 Y109.321 E.05135
G1 X123.329 Y109.321 E.01674
G1 X121.621 Y111.029 E.07503
G1 X121.621 Y111.568 E.01674
G1 X123.868 Y109.321 E.09871
G1 X124.407 Y109.321 E.01674
G1 X121.621 Y112.107 E.12238
G1 X121.621 Y112.646 E.01674
G1 X124.946 Y109.321 E.14606
G1 X125.485 Y109.321 E.01674
G1 X121.621 Y113.185 E.16974
G1 X121.621 Y113.724 E.01674
G1 X126.024 Y109.321 E.19342
G1 X126.563 Y109.321 E.01674
G1 X121.621 Y114.263 E.2171
G1 X121.621 Y114.802 E.01674
G1 X127.102 Y109.321 E.24078
G1 X127.641 Y109.321 E.01674
G1 X121.621 Y115.341 E.26446
G1 X121.621 Y115.88 E.01674
G1 X128.18 Y109.321 E.28813
G1 X128.719 Y109.321 E.01674
G1 X121.621 Y116.419 E.31181
G1 X121.621 Y116.958 E.01674
G1 X129.258 Y109.321 E.33549
G1 X129.797 Y109.321 E.01674
G1 X121.621 Y117.497 E.35917
G1 X121.621 Y118.037 E.01674
G1 X130.337 Y109.321 E.38285
G1 X130.876 Y109.321 E.01674
G1 X121.621 Y118.576 E.40653
G1 X121.621 Y119.115 E.01674
G1 X131.415 Y109.321 E.43021
G1 X131.954 Y109.321 E.01674
G1 X121.621 Y119.654 E.45389
G1 X121.621 Y120.193 E.01674
G1 X132.493 Y109.321 E.47756
G1 X133.032 Y109.321 E.01674
G1 X121.621 Y120.732 E.50124
G1 X121.621 Y121.271 E.01674
G1 X133.571 Y109.321 E.52492
G1 X134.11 Y109.321 E.01674
G1 X121.621 Y121.81 E.5486
G2 X121.655 Y122.026 I.67 J.005 E.00681
G2 X121.89 Y122.079 I.207 J-.365 E.00762
G1 X134.379 Y109.591 E.54858
G1 X134.379 Y110.13 E.01674
G1 X122.43 Y122.079 E.5249
G1 X122.969 Y122.079 E.01674
G1 X134.379 Y110.669 E.50123
G1 X134.379 Y111.208 E.01674
G1 X123.508 Y122.079 E.47755
G1 X124.047 Y122.079 E.01674
G1 X134.379 Y111.747 E.45387
G1 X134.379 Y112.286 E.01674
G1 X124.586 Y122.079 E.43019
G1 X125.125 Y122.079 E.01674
G1 X134.379 Y112.825 E.40651
G1 X134.379 Y113.364 E.01674
G1 X125.664 Y122.079 E.38283
G1 X126.203 Y122.079 E.01674
G1 X134.379 Y113.903 E.35915
G1 X134.379 Y114.442 E.01674
G1 X126.742 Y122.079 E.33548
G1 X127.281 Y122.079 E.01674
G1 X134.379 Y114.981 E.3118
G1 X134.379 Y115.52 E.01674
G1 X127.82 Y122.079 E.28812
G1 X128.359 Y122.079 E.01674
G1 X134.379 Y116.059 E.26444
G1 X134.379 Y116.598 E.01674
G1 X128.898 Y122.079 E.24076
G1 X129.437 Y122.079 E.01674
G1 X134.379 Y117.137 E.21708
G1 X134.379 Y117.676 E.01674
M73 P55 R5
G1 X129.976 Y122.079 E.1934
G1 X130.515 Y122.079 E.01674
G1 X134.379 Y118.215 E.16972
G1 X134.379 Y118.754 E.01674
G1 X131.054 Y122.079 E.14605
G1 X131.593 Y122.079 E.01674
G1 X134.379 Y119.294 E.12237
G1 X134.379 Y119.833 E.01674
G1 X132.133 Y122.079 E.09869
G1 X132.672 Y122.079 E.01674
G1 X134.379 Y120.372 E.07501
G1 X134.379 Y120.911 E.01674
G1 X133.211 Y122.079 E.05133
G1 X133.75 Y122.079 E.01674
G1 X134.379 Y121.45 E.02765
G1 X134.379 Y121.867 E.01297
G3 X134.348 Y122.02 I-.25 J.029 E.00491
G1 X134.119 Y122.249 E.01007
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9444.604
G1 X134.348 Y122.02 E-.12326
G1 X134.379 Y121.867 E-.05907
G1 X134.379 Y121.45 E-.15864
G1 X133.75 Y122.079 E-.33831
G1 X133.537 Y122.079 E-.08073
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 3/36
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-1.206 J.165 P1  F42000
G1 X137.126 Y148.341 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.083 Y148.355 E.00149
G3 X136.724 Y148.402 I-.388 J-1.56 E.01205
G1 X119.282 Y148.402 E.57858
G3 X117.698 Y146.824 I.023 J-1.607 E.08202
G1 X117.698 Y129.376 E.57877
G3 X119.276 Y127.798 I1.607 J.029 E.08184
G1 X136.718 Y127.798 E.57858
G3 X138.302 Y129.376 I-.023 J1.607 E.08202
G1 X138.302 Y146.818 E.57858
G3 X137.444 Y148.217 I-1.607 J-.023 E.05714
G1 X137.182 Y148.319 E.00932
M204 S250
G1 X136.989 Y147.974 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.708 Y148.01 I-.294 J-1.179 E.00873
G1 X119.294 Y148.01 E.53511
G3 X118.09 Y146.808 I.011 J-1.215 E.05789
G1 X118.09 Y129.392 E.53517
G3 X119.292 Y128.19 I1.214 J.013 E.05783
G1 X136.706 Y128.19 E.53511
G3 X137.91 Y129.392 I-.011 J1.215 E.05789
G1 X137.91 Y146.806 E.53511
G3 X137.047 Y147.958 I-1.215 J-.011 E.04733
; WIPE_START
M204 S6000
G1 X136.708 Y148.01 E-.13025
G1 X135.051 Y148.01 E-.62975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.426 Y148.335 Z1 F42000
G1 X117.818 Y148.744 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.996 Y127.409 E.65938
G3 X138.698 Y128.218 I-.115 J.809 E.03876
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.675 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.429 Y148.972 E.00868
G3 X116.91 Y147.994 I.693 J-.995 E.03535
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X138.025 Y127.018 E.61204
G3 X139.09 Y128.206 I-.149 J1.205 E.05351
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.212 J-.016 E.05754
G1 X118.106 Y149.19 E.60801
G3 X117.73 Y149.125 I.016 J-1.212 E.01178
; WIPE_START
M204 S6000
G1 X117.429 Y148.972 E-.12841
G1 X117.311 Y148.89 E-.05446
G1 X117.121 Y148.676 E-.10904
G1 X116.988 Y148.422 E-.10894
G1 X116.919 Y148.143 E-.10898
G1 X116.91 Y147.994 E-.05703
G1 X116.91 Y147.485 E-.19315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 3 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; object ids of this layer3 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.47229
G1 F8384.39
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514972
G1 F7626.284
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.0012
; LINE_WIDTH: 0.474288
G1 F8345.555
G2 X118.529 Y148.594 I1.91 J-3.419 E.02202
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390681
G1 F10351.954
M204 S6000
G3 X117.545 Y148.208 I5.823 J-19.654 E.03504
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390659
G1 F10352.596
M204 S6000
G3 X117.506 Y147.382 I19.495 J-7.077 E.03502
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390685
G1 F10351.82
M204 S6000
G3 X118.718 Y127.606 I7.153 J19.723 E.03501
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474315
G1 F8345.03
M204 S6000
G2 X117.96 Y127.866 I1.346 J3.688 E.02202
; LINE_WIDTH: 0.515728
G1 F7614.09
M73 P56 R5
G1 X117.934 Y127.883 E.0012
G2 X117.74 Y128.111 I.344 J.49 E.01166
; LINE_WIDTH: 0.473899
G1 F8353.089
G1 X117.506 Y128.618 E.01961
M204 S10000
G1 X117.506 Y128.809 F42000
; LINE_WIDTH: 0.394819
G1 F10230.21
M204 S6000
G3 X117.899 Y127.643 I17.083 J5.114 E.0353
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390648
G1 F10352.931
M204 S6000
G3 X138.494 Y128.819 I-19.275 J6.999 E.03504
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.47428
G1 F8345.714
M204 S6000
G2 X138.234 Y128.06 I-3.693 J1.349 E.02201
; LINE_WIDTH: 0.514961
G1 F7626.455
G1 X138.217 Y128.034 E.0012
G2 X137.989 Y127.839 I-.501 J.354 E.01166
; LINE_WIDTH: 0.472278
G1 F8384.622
G1 X137.471 Y127.606 E.01986
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.390684
G1 F10351.866
M204 S6000
G3 X138.455 Y127.992 I-5.84 J19.709 E.03504
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.39065
G1 F10352.861
M204 S6000
G3 X137.281 Y148.594 I-7 J-19.274 E.03503
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472294
G1 F8384.315
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514978
G1 F7626.195
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.0012
; LINE_WIDTH: 0.474276
G1 F8345.776
G2 X138.494 Y147.571 I-3.435 J-1.918 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390632
G1 F10353.411
M204 S6000
G3 X138.108 Y148.555 I-20.155 J-5.993 E.035
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.181 Y141.085 Z1 F42000
G1 X121.307 Y122.292 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X121.206 Y121.942 I.488 J-.329 E.01226
G1 X121.206 Y109.458 E.41413
G3 X121.408 Y109.007 I.57 J-.016 E.01696
G3 X121.758 Y108.906 I.329 J.488 E.01226
G1 X134.242 Y108.906 E.41413
G1 X134.464 Y108.942 E.00743
G3 X134.758 Y109.236 I-.183 J.478 E.01425
G1 X134.794 Y109.458 E.00744
G1 X134.794 Y121.942 E.41413
G3 X134.592 Y122.393 I-.57 J.016 E.01696
G3 X134.242 Y122.494 I-.329 J-.488 E.01226
G1 X121.758 Y122.494 E.41413
G3 X121.348 Y122.335 I-.016 J-.57 E.01496
M204 S10000
G1 X120.981 Y122.528 F42000
G1 F6000
M204 S6000
G3 X120.85 Y122.291 I.775 J-.584 E.00902
G1 X120.799 Y121.974 E.01064
G1 X120.799 Y109.426 E.41625
G1 X120.85 Y109.109 E.01064
G3 X121.409 Y108.55 I.907 J.347 E.02703
G1 X121.726 Y108.499 E.01064
G1 X134.311 Y108.505 E.41747
G3 X135.15 Y109.109 I.004 J.88 E.03667
G1 X135.201 Y109.426 E.01064
G1 X135.201 Y121.974 E.41625
G1 X135.15 Y122.291 E.01064
G3 X134.591 Y122.85 I-.907 J-.347 E.02703
G1 X134.274 Y122.901 E.01064
G1 X121.726 Y122.901 E.41625
G1 X121.409 Y122.85 E.01064
G3 X121.018 Y122.575 I.347 J-.907 E.01602
M204 S250
G1 X120.65 Y122.764 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X120.472 Y122.414 E.01208
G1 F3540
G1 X120.407 Y122.005 E.01271
G1 F3600
G1 X120.407 Y109.395 E.38747
G1 F3540
G1 X120.472 Y108.986 E.01271
G1 F3420
G1 X120.652 Y108.633 E.01219
G1 F3360
G1 X120.933 Y108.352 E.0122
G1 F3420
G1 X121.286 Y108.172 E.01219
G1 F3540
G1 X121.695 Y108.107 E.01271
G1 F3600
G1 X134.305 Y108.107 E.38747
G1 F3540
G1 X134.372 Y108.118 E.00209
G1 X134.714 Y108.172 E.01062
G1 F3420
G1 X135.067 Y108.352 E.01219
G1 F3360
G1 X135.348 Y108.633 E.01219
G1 F3420
G1 X135.528 Y108.986 E.01219
G1 F3540
G1 X135.593 Y109.395 E.01271
G1 F3600
G1 X135.593 Y122.005 E.38747
G1 F3540
G1 X135.528 Y122.414 E.01271
G1 F3420
G1 X135.348 Y122.767 E.01219
G1 F3360
G1 X135.067 Y123.048 E.0122
G1 F3420
G1 X134.714 Y123.228 E.01219
G1 F3540
G1 X134.305 Y123.293 E.01271
G1 F3600
G1 X121.695 Y123.293 E.38747
G1 F3540
G1 X121.286 Y123.228 E.01271
G1 F3420
G1 X120.933 Y123.048 E.01219
G1 F3360
G1 X120.692 Y122.807 E.01046
; WIPE_START
M204 S6000
G1 X120.472 Y122.414 E-.17129
G1 X120.407 Y122.005 E-.15719
G1 X120.407 Y120.869 E-.43152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.37 Y121.883 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42043
G1 F9536.17
M204 S6000
G1 X121.641 Y122.138 E.01143
G2 X122.181 Y122.16 I.342 J-1.695 E.01671
G1 X121.54 Y121.519 E.02791
G1 X121.54 Y120.985 E.01642
G1 X122.715 Y122.16 E.05113
G1 X123.249 Y122.16 E.01642
G1 X121.54 Y120.451 E.07436
G1 X121.54 Y119.917 E.01642
G1 X123.783 Y122.16 E.09759
G1 X124.317 Y122.16 E.01642
G1 X121.54 Y119.383 E.12081
G1 X121.54 Y118.849 E.01642
G1 X124.851 Y122.16 E.14404
G1 X125.384 Y122.16 E.01642
G1 X121.54 Y118.316 E.16726
G1 X121.54 Y117.782 E.01642
G1 X125.918 Y122.16 E.19049
G1 X126.452 Y122.16 E.01642
G1 X121.54 Y117.248 E.21372
G1 X121.54 Y116.714 E.01642
G1 X126.986 Y122.16 E.23694
G1 X127.52 Y122.16 E.01642
G1 X121.54 Y116.18 E.26017
G1 X121.54 Y115.646 E.01642
G1 X128.054 Y122.16 E.28339
G1 X128.588 Y122.16 E.01642
G1 X121.54 Y115.112 E.30662
G1 X121.54 Y114.578 E.01642
G1 X129.122 Y122.16 E.32985
G1 X129.655 Y122.16 E.01642
G1 X121.54 Y114.045 E.35307
G1 X121.54 Y113.511 E.01642
G1 X130.189 Y122.16 E.3763
G1 X130.723 Y122.16 E.01642
G1 X121.54 Y112.977 E.39953
G1 X121.54 Y112.443 E.01642
G1 X131.257 Y122.16 E.42275
G1 X131.791 Y122.16 E.01642
G1 X121.54 Y111.909 E.44598
G1 X121.54 Y111.375 E.01642
G1 X132.325 Y122.16 E.4692
G1 X132.859 Y122.16 E.01642
G1 X121.54 Y110.841 E.49243
G1 X121.54 Y110.307 E.01642
G1 X133.393 Y122.16 E.51566
G1 X133.927 Y122.16 E.01642
G1 X121.54 Y109.773 E.53888
G1 X121.54 Y109.484 E.0089
G3 X121.593 Y109.293 I.232 J-.038 E.0063
G1 X134.407 Y122.107 E.55745
G1 X134.42 Y122.093 E.00059
G2 X134.46 Y121.626 I-.962 J-.318 E.01455
G1 X122.074 Y109.24 E.53887
G1 X122.608 Y109.24 E.01642
G1 X134.46 Y121.092 E.51565
G1 X134.46 Y120.559 E.01642
G1 X123.141 Y109.24 E.49242
G1 X123.675 Y109.24 E.01642
G1 X134.46 Y120.025 E.4692
G1 X134.46 Y119.491 E.01642
G1 X124.209 Y109.24 E.44597
G1 X124.743 Y109.24 E.01642
G1 X134.46 Y118.957 E.42274
G1 X134.46 Y118.423 E.01642
G1 X125.277 Y109.24 E.39952
G1 X125.811 Y109.24 E.01642
G1 X134.46 Y117.889 E.37629
G1 X134.46 Y117.355 E.01642
G1 X126.345 Y109.24 E.35307
G1 X126.879 Y109.24 E.01642
G1 X134.46 Y116.821 E.32984
M73 P57 R5
G1 X134.46 Y116.288 E.01642
G1 X127.412 Y109.24 E.30661
G1 X127.946 Y109.24 E.01642
G1 X134.46 Y115.754 E.28339
G1 X134.46 Y115.22 E.01642
G1 X128.48 Y109.24 E.26016
G1 X129.014 Y109.24 E.01642
G1 X134.46 Y114.686 E.23693
G1 X134.46 Y114.152 E.01642
G1 X129.548 Y109.24 E.21371
G1 X130.082 Y109.24 E.01642
G1 X134.46 Y113.618 E.19048
G1 X134.46 Y113.084 E.01642
G1 X130.616 Y109.24 E.16726
G1 X131.15 Y109.24 E.01642
G1 X134.46 Y112.55 E.14403
G1 X134.46 Y112.017 E.01642
G1 X131.683 Y109.24 E.1208
G1 X132.217 Y109.24 E.01642
G1 X134.46 Y111.483 E.09758
G1 X134.46 Y110.949 E.01642
G1 X132.751 Y109.24 E.07435
G1 X133.285 Y109.24 E.01642
G1 X134.46 Y110.415 E.05113
G1 X134.46 Y109.881 E.01642
G1 X133.819 Y109.24 E.0279
G1 X134.216 Y109.24 E.01221
G3 X134.393 Y109.279 I.027 J.291 E.00566
G1 X134.63 Y109.517 E.01033
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9536.17
G1 X134.393 Y109.279 E-.12762
G1 X134.216 Y109.24 E-.06874
G1 X133.819 Y109.24 E-.15086
G1 X134.46 Y109.881 E-.34464
G1 X134.46 Y110.06 E-.06815
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 4/36
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-1.214 J.082 P1  F42000
G1 X137.04 Y148.362 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01076
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.045 J-1.629 E.08192
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.629 J.045 E.08192
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.045 J1.629 E.08192
G1 X138.302 Y146.818 E.5784
G3 X137.098 Y148.346 I-1.629 J-.045 E.06916
M204 S250
G1 X136.989 Y147.974 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.706 Y148.01 I-.294 J-1.179 E.00879
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.011 J1.215 E.05795
G1 X137.91 Y146.806 E.53504
G3 X137.047 Y147.958 I-1.215 J-.011 E.04732
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.13105
G1 X135.051 Y148.01 E-.62896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.426 Y148.335 Z1.2 F42000
G1 X117.818 Y148.744 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.996 Y127.409 E.65938
G3 X138.698 Y128.218 I-.115 J.809 E.03876
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.675 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.429 Y148.972 E.00869
G3 X116.91 Y147.994 I.693 J-.995 E.03535
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.201 J.004 E.05769
G1 X138.012 Y127.017 E.61165
G3 X139.09 Y128.206 I-.116 J1.188 E.05408
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.196 J0 E.05775
G1 X118.106 Y149.19 E.60801
G3 X117.731 Y149.125 I.016 J-1.212 E.01177
; WIPE_START
M204 S6000
G1 X117.429 Y148.972 E-.12849
G1 X117.311 Y148.891 E-.05446
G1 X117.121 Y148.676 E-.109
G1 X116.988 Y148.422 E-.10898
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.486 E-.19307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 4 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer4 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472289
G1 F8384.405
M204 S6000
G1 X117.739 Y148.089 E.01986
; LINE_WIDTH: 0.514984
G1 F7626.097
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474287
G1 F8345.573
G2 X118.529 Y148.594 I1.907 J-3.41 E.02202
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390712
G1 F10351.024
M204 S6000
G3 X117.545 Y148.208 I5.875 J-19.806 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390674
M73 P58 R5
G1 F10352.168
M204 S6000
G3 X117.506 Y147.381 I19.175 J-6.966 E.03504
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390627
G1 F10353.543
M204 S6000
G3 X118.719 Y127.606 I6.986 J19.238 E.03504
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474303
G1 F8345.25
M204 S6000
G2 X117.96 Y127.866 I1.345 J3.687 E.02202
; LINE_WIDTH: 0.514981
G1 F7626.138
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.354 J.501 E.01165
; LINE_WIDTH: 0.472312
G1 F8383.955
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390674
G1 F10352.166
M204 S6000
G3 X117.892 Y127.645 I19.718 J5.844 E.03504
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390668
G1 F10352.343
M204 S6000
G3 X138.494 Y128.819 I-19.299 J7.011 E.03503
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.47432
G1 F8344.923
M204 S6000
G2 X138.234 Y128.06 I-3.69 J1.347 E.02203
; LINE_WIDTH: 0.514986
G1 F7626.051
G1 X138.217 Y128.034 E.00119
G2 X137.989 Y127.839 I-.501 J.353 E.01166
; LINE_WIDTH: 0.472272
G1 F8384.726
G1 X137.471 Y127.606 E.01987
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.39071
G1 F10351.084
M204 S6000
G3 X138.455 Y127.992 I-5.844 J19.717 E.03504
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390643
G1 F10353.085
M204 S6000
G3 X137.282 Y148.594 I-7.098 J-19.568 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472256
G1 F8385.052
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514978
G1 F7626.19
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.0012
; LINE_WIDTH: 0.474324
G1 F8344.852
G2 X138.494 Y147.571 I-3.421 J-1.912 E.02203
M204 S10000
G1 X138.494 Y147.381 F42000
; LINE_WIDTH: 0.390551
G1 F10355.827
M204 S6000
G3 X138.108 Y148.555 I-19.804 J-5.874 E.03502
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.381 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.16 Y141.099 Z1.2 F42000
G1 X121.232 Y122.359 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X121.125 Y121.991 I.514 J-.348 E.01294
G1 X121.125 Y109.409 E.41735
G3 X121.341 Y108.932 I.606 J-.014 E.01796
G3 X121.709 Y108.825 I.348 J.514 E.01294
G1 X134.329 Y108.831 E.41864
G3 X134.838 Y109.178 I.016 J.523 E.02182
G1 X134.875 Y109.409 E.00777
G1 X134.875 Y121.991 E.41735
G3 X134.659 Y122.468 I-.606 J.014 E.01796
G3 X134.291 Y122.575 I-.348 J-.514 E.01294
G1 X121.709 Y122.575 E.41735
G3 X121.273 Y122.403 I-.014 J-.606 E.01597
M204 S10000
G1 X120.906 Y122.596 F42000
G1 F6000
M204 S6000
G3 X120.77 Y122.35 I.804 J-.606 E.00936
G1 X120.718 Y122.023 E.01098
G1 X120.718 Y109.377 E.41948
G1 X120.77 Y109.05 E.01097
G3 X121.35 Y108.47 I.941 J.36 E.02804
G1 X121.677 Y108.418 E.01098
G1 X134.393 Y108.429 E.42181
G3 X135.23 Y109.05 I-.017 J.897 E.03688
G1 X135.282 Y109.377 E.01098
G1 X135.282 Y122.023 E.41948
G1 X135.23 Y122.35 E.01097
G3 X134.65 Y122.93 I-.941 J-.36 E.02804
G1 X134.323 Y122.982 E.01098
G1 X121.677 Y122.982 E.41948
G1 X121.35 Y122.93 E.01097
G3 X120.944 Y122.642 I.36 J-.941 E.01669
M204 S250
G1 X120.574 Y122.828 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X120.393 Y122.472 E.01228
G1 F3540
G1 X120.326 Y122.054 E.01302
G1 F3600
G1 X120.326 Y109.346 E.39046
G1 F3540
G1 X120.392 Y108.928 E.01302
G1 F3420
G1 X120.577 Y108.565 E.01251
G1 F3360
G1 X120.865 Y108.277 E.01251
G1 F3420
G1 X121.228 Y108.093 E.01251
G1 F3540
G1 X121.646 Y108.026 E.01302
G1 F3600
G1 X134.354 Y108.026 E.39046
G1 F3540
G1 X134.454 Y108.042 E.00313
G1 X134.772 Y108.093 E.00989
G1 F3420
G1 X135.135 Y108.277 E.01251
G1 F3360
G1 X135.423 Y108.565 E.01251
G1 F3420
G1 X135.607 Y108.928 E.01251
G1 F3540
G1 X135.674 Y109.346 E.01302
G1 F3600
G1 X135.674 Y122.054 E.39046
G1 F3540
G1 X135.607 Y122.472 E.01302
G1 F3420
G1 X135.423 Y122.835 E.01251
G1 F3360
G1 X135.135 Y123.123 E.01251
G1 F3420
G1 X134.772 Y123.308 E.01251
G1 F3540
G1 X134.354 Y123.374 E.01302
G1 F3600
G1 X121.646 Y123.374 E.39046
G1 F3540
G1 X121.228 Y123.308 E.01302
G1 F3420
G1 X120.865 Y123.123 E.01251
G1 F3360
G1 X120.614 Y122.872 E.01089
; WIPE_START
M204 S6000
G1 X120.393 Y122.472 E-.17378
G1 X120.326 Y122.054 E-.16105
G1 X120.326 Y120.935 E-.42517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.718 Y116.272 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X123.718 Y117.901 E.05401
G1 X123.414 Y117.926 E.01013
G3 X121.77 Y116.814 I.422 J-2.395 E.06782
G1 X121.776 Y115.278 E.05095
G2 X123.414 Y114.663 I.129 J-2.145 E.05977
G1 X123.718 Y114.235 E.01742
G1 X123.718 Y115.863 E.05401
M204 S10000
G1 X125.895 Y117.269 F42000
G1 F8843.478
M204 S6000
G1 X124.981 Y117.269 E.03033
G1 X124.981 Y116.555 E.02369
G3 X125.573 Y116.22 I.752 J.637 E.02306
G1 X125.573 Y114.964 E.04164
G1 X125.814 Y114.723 E.01131
G1 X126.466 Y114.723 E.02161
G1 X126.045 Y114.131 E.02412
G1 X126.19 Y114.131 E.00481
G1 X126.431 Y113.89 E.01131
G1 X126.431 Y112.747 E.0379
M204 S10000
G1 X128.144 Y113.273 F42000
G1 F8843.478
M204 S6000
G1 X128.736 Y113.273 E.01961
G1 X128.977 Y113.514 E.01131
G1 X128.977 Y114.211 E.0231
G3 X129.569 Y113.552 I1.286 J.56 E.02991
G2 X129.81 Y114.131 I.41 J.169 E.02311
G1 X131.019 Y114.131 E.0401
G1 X131.019 Y116.165 E.06746
G2 X130.186 Y116.677 I.194 J1.25 E.03333
G2 X129.966 Y116.737 I-.067 J.185 E.00807
G1 X129.31 Y117.659 E.03752
G1 X128.736 Y118.127 E.02458
G1 X127.427 Y118.127 E.0434
M204 S10000
G1 X128.64 Y116.433 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.782 Y116.305 E.00586
G3 X130.023 Y116.285 I.955 J20.835 E.03816
G2 X130.035 Y115.135 I-29.25 J-.867 E.03533
G2 X128.866 Y115.115 I-.877 J17.425 E.03593
G1 X128.732 Y115.06 E.00443
G1 X128.605 Y114.919 E.00586
G3 X128.585 Y113.677 I20.835 J-.955 E.03816
G2 X127.427 Y113.665 I-.871 J29.456 E.03558
G2 X127.415 Y114.834 I29.735 J.877 E.03592
G1 X127.36 Y114.968 E.00443
G1 X127.218 Y115.095 E.00586
G3 X125.977 Y115.115 I-.955 J-20.846 E.03816
G2 X125.965 Y116.273 I29.456 J.871 E.03558
G2 X127.134 Y116.285 I.877 J-29.735 E.03592
G1 X127.267 Y116.34 E.00443
G1 X127.395 Y116.482 E.00586
G3 X127.415 Y117.723 I-20.846 J.955 E.03816
G2 X128.573 Y117.735 I.871 J-29.456 E.03558
G2 X128.585 Y116.566 I-29.735 J-.877 E.03592
G1 X128.617 Y116.488 E.00259
M204 S10000
G1 X128.466 Y116.073 F42000
; LINE_WIDTH: 0.434747
G1 F9187.739
M204 S6000
G1 X128.612 Y115.965 E.0058
G1 X128.866 Y115.898 E.00839
G1 X129.648 Y115.898 E.02498
G1 X129.648 Y115.502 E.01265
G1 X128.866 Y115.502 E.02498
G1 X128.612 Y115.435 E.00839
G3 X128.265 Y115.088 I.55 J-.896 E.01579
G1 X128.198 Y114.834 E.00839
G1 X128.198 Y114.052 E.02498
G1 X127.802 Y114.052 E.01265
G1 X127.802 Y114.834 E.02498
G1 X127.735 Y115.088 E.00839
G1 X127.534 Y115.327 E.00995
G1 X127.387 Y115.433 E.00579
G1 X127.134 Y115.502 E.00838
G1 X126.352 Y115.502 E.02498
G1 X126.352 Y115.898 E.01265
G1 X127.134 Y115.898 E.02498
G1 X127.387 Y115.967 E.00838
G1 X127.627 Y116.166 E.00994
G1 X127.733 Y116.313 E.00579
G1 X127.802 Y116.566 E.00838
G1 X127.802 Y117.348 E.02498
G1 X128.198 Y117.348 E.01265
G1 X128.198 Y116.566 E.02498
G1 X128.267 Y116.313 E.00838
G1 X128.428 Y116.119 E.00802
M204 S10000
G1 X128.189 Y115.797 F42000
; LINE_WIDTH: 0.44775
G1 F8892.621
M204 S6000
G1 X128.324 Y115.7 E.00546
G3 X128 Y115.376 I.47 J-.794 E.01527
G3 X127.676 Y115.7 I-.794 J-.47 E.01527
G3 X128 Y116.024 I-.47 J.794 E.01527
G1 X128.151 Y115.843 E.00777
M204 S10000
G1 X130.488 Y118.188 F42000
; LINE_WIDTH: 0.55447
G1 F7037.435
M204 S6000
G1 X130.565 Y118.163 E.0034
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.643 Y118.139 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.531
G1 X130.721 Y118.114 E.00307
G1 X131.484 Y118.078 E.02882
; LINE_WIDTH: 0.557675
G1 F6993.618
G1 X131.814 Y118.064 E.01384
; LINE_WIDTH: 0.54692
G1 F7142.857
G1 X131.838 Y117.759 E.01256
; LINE_WIDTH: 0.49828
G1 F7905.833
G1 X131.863 Y117.455 E.01135
; LINE_WIDTH: 0.470755
G1 F8414.456
G1 X131.864 Y114.02 E.11974
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X131.848 Y113.792 E.00828
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.831 Y113.564 E.00891
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X131.814 Y113.336 E.00953
G1 X131.586 Y113.319 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.358 Y113.302 E.00891
; LINE_WIDTH: 0.476725
G1 F8298.66
G2 X130.721 Y113.286 I-.433 J4.326 E.02255
; LINE_WIDTH: 0.48747
G1 F8098.077
G1 X130.643 Y113.261 E.00295
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.565 Y113.237 E.00317
; LINE_WIDTH: 0.55447
G1 F7037.435
G1 X130.488 Y113.212 E.0034
G1 X130.463 Y113.135 E.0034
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.439 Y113.057 E.00317
; LINE_WIDTH: 0.505499
G1 F7782.454
G1 X130.414 Y112.979 E.00307
G1 X130.378 Y112.216 E.02882
; LINE_WIDTH: 0.55768
G1 F6993.551
G1 X130.364 Y111.886 E.01384
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X130.136 Y111.869 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X129.908 Y111.852 E.00891
; LINE_WIDTH: 0.471788
G1 F8394.206
G1 X129.68 Y111.836 E.00799
G1 X126.32 Y111.836 E.11743
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X126.092 Y111.852 E.00828
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.864 Y111.869 E.00891
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X125.636 Y111.886 E.00953
G1 X125.619 Y112.114 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.602 Y112.342 E.00891
; LINE_WIDTH: 0.477465
G1 F8284.526
G2 X125.584 Y113.016 I4.818 J.469 E.02391
; LINE_WIDTH: 0.49828
G1 F7905.833
G1 X125.548 Y113.114 E.00387
; LINE_WIDTH: 0.54692
G1 F7142.857
G1 X125.512 Y113.212 E.00428
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X125.435 Y113.237 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.357 Y113.261 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.526
G1 X125.279 Y113.286 E.00307
G1 X124.515 Y113.322 E.02882
; LINE_WIDTH: 0.557675
G1 F6993.618
G1 X124.186 Y113.336 E.01384
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X124.169 Y113.564 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.152 Y113.792 E.00891
; LINE_WIDTH: 0.471788
G1 F8394.206
G1 X124.136 Y114.02 E.00799
G1 X124.136 Y117.38 E.11743
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X124.152 Y117.608 E.00828
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.169 Y117.836 E.00891
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X124.186 Y118.064 E.00953
G1 X124.414 Y118.081 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.642 Y118.098 E.00891
; LINE_WIDTH: 0.476725
G1 F8298.66
G2 X125.279 Y118.114 I.433 J-4.326 E.02255
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X125.357 Y118.139 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.435 Y118.163 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X125.512 Y118.188 E.0034
G1 X125.537 Y118.265 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.561 Y118.343 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.526
G1 X125.586 Y118.421 E.00307
G1 X125.622 Y119.185 E.02882
; LINE_WIDTH: 0.557675
G1 F6993.618
G1 X125.636 Y119.514 E.01384
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X125.864 Y119.531 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X126.092 Y119.548 E.00891
; LINE_WIDTH: 0.471788
G1 F8394.206
G1 X126.32 Y119.564 E.00799
G1 X129.68 Y119.564 E.11743
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X129.908 Y119.548 E.00828
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X130.136 Y119.531 E.00891
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X130.364 Y119.514 E.00953
; LINE_WIDTH: 0.54692
G1 F7142.857
G1 X130.388 Y119.209 E.01256
; LINE_WIDTH: 0.49828
G1 F7905.833
G1 X130.413 Y118.905 E.01135
; LINE_WIDTH: 0.47234
G1 F8383.4
G1 X130.414 Y118.421 E.01693
; LINE_WIDTH: 0.48747
G1 F8098.077
G1 X130.433 Y118.362 E.00223
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.451 Y118.304 E.00239
; LINE_WIDTH: 0.55447
G1 F7037.435
G1 X130.47 Y118.245 E.00256
M204 S10000
G1 X125.963 Y117.737 F42000
; LINE_WIDTH: 0.554487
G1 F7037.207
M204 S6000
G1 X125.735 Y117.72 E.00953
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X125.507 Y117.703 E.00891
; LINE_WIDTH: 0.476725
G1 F8298.66
G2 X124.87 Y117.687 I-.433 J4.329 E.02255
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X124.792 Y117.662 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.715 Y117.638 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X124.637 Y117.613 E.0034
G1 X124.612 Y117.535 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.588 Y117.458 E.00317
; LINE_WIDTH: 0.471117
G1 F8407.355
G1 X124.563 Y117.38 E.00284
G1 X124.563 Y114.02 E.11725
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X124.588 Y113.942 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.612 Y113.865 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X124.637 Y113.787 E.0034
G1 X124.715 Y113.762 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X124.792 Y113.738 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.524
G1 X124.87 Y113.713 E.00307
G1 X125.634 Y113.677 E.02882
; LINE_WIDTH: 0.5685
G1 F6849.575
G3 X125.963 Y113.663 I.198 J.789 E.01423
; LINE_WIDTH: 0.54692
G1 F7142.857
G1 X125.987 Y113.358 E.01256
; LINE_WIDTH: 0.49828
G1 F7905.833
G1 X126.012 Y113.054 E.01135
; LINE_WIDTH: 0.47234
G1 F8383.4
G1 X126.013 Y112.57 E.01693
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X126.038 Y112.492 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X126.062 Y112.415 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X126.087 Y112.337 E.0034
G1 X126.165 Y112.312 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X126.242 Y112.288 E.00317
; LINE_WIDTH: 0.471117
G1 F8407.355
G1 X126.32 Y112.263 E.00284
G1 X129.68 Y112.263 E.11725
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X129.758 Y112.288 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X129.835 Y112.312 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X129.913 Y112.337 E.0034
G1 X129.938 Y112.415 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X129.962 Y112.492 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.524
G1 X129.987 Y112.57 E.00307
G1 X130.023 Y113.334 E.02882
; LINE_WIDTH: 0.557665
G1 F6993.754
G1 X130.037 Y113.663 E.01384
; LINE_WIDTH: 0.55447
G1 F7037.435
G1 X130.265 Y113.68 E.00953
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.493 Y113.697 E.00891
; LINE_WIDTH: 0.476724
G1 F8298.683
G2 X131.13 Y113.713 I.433 J-4.329 E.02255
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X131.208 Y113.738 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.285 Y113.762 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X131.363 Y113.787 E.0034
G1 X131.388 Y113.865 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.412 Y113.942 E.00317
; LINE_WIDTH: 0.471117
G1 F8407.355
G1 X131.437 Y114.02 E.00284
G1 X131.437 Y117.38 E.11725
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X131.412 Y117.458 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.388 Y117.535 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X131.363 Y117.613 E.0034
G1 X131.285 Y117.638 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X131.208 Y117.662 E.00317
; LINE_WIDTH: 0.505495
G1 F7782.524
G1 X131.13 Y117.687 E.00307
G1 X130.366 Y117.723 E.02882
; LINE_WIDTH: 0.557665
G1 F6993.754
G1 X130.037 Y117.737 E.01384
; LINE_WIDTH: 0.55447
G1 F7037.435
G1 X130.02 Y117.965 E.00953
; LINE_WIDTH: 0.52097
G1 F7530.593
G1 X130.003 Y118.193 E.00891
; LINE_WIDTH: 0.477464
G1 F8284.548
G2 X129.985 Y118.867 I4.821 J.469 E.02391
; LINE_WIDTH: 0.49828
G1 F7905.833
G1 X129.949 Y118.965 E.00387
; LINE_WIDTH: 0.54692
G1 F7142.857
G1 X129.913 Y119.063 E.00428
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X129.835 Y119.088 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X129.758 Y119.112 E.00317
; LINE_WIDTH: 0.471117
G1 F8407.355
G1 X129.68 Y119.137 E.00284
M73 P59 R5
G1 X126.32 Y119.137 E.11725
; LINE_WIDTH: 0.487474
G1 F8098.016
G1 X126.242 Y119.112 E.00295
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X126.165 Y119.088 E.00317
; LINE_WIDTH: 0.554487
G1 F7037.207
G1 X126.087 Y119.063 E.0034
G1 X126.062 Y118.985 E.0034
; LINE_WIDTH: 0.52098
G1 F7530.436
G1 X126.038 Y118.908 E.00317
; LINE_WIDTH: 0.5055
G1 F7782.447
G1 X126.013 Y118.83 E.00307
G1 X125.977 Y118.066 E.02882
; LINE_WIDTH: 0.55768
G1 F6993.551
G1 X125.966 Y117.797 E.01132
M204 S10000
G1 X133.792 Y121.93 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X132.164 Y121.93 E.05401
G2 X131.276 Y121.336 I-.923 J.419 E.03731
G2 X130.034 Y121.93 I.185 J1.984 E.04663
G1 X126.922 Y121.93 E.10321
G2 X126.035 Y121.336 I-.923 J.419 E.03731
G2 X124.792 Y121.93 I.185 J1.984 E.04663
G1 X121.77 Y121.93 E.10026
G1 X121.776 Y120.519 E.0468
G2 X123.414 Y119.904 I.129 J-2.145 E.05977
G1 X124.069 Y118.982 E.03752
G3 X125.168 Y118.836 I.646 J.651 E.0395
G1 X125.168 Y119.741 E.03001
G1 X125.409 Y119.982 E.01131
G1 X126.478 Y119.982 E.03545
G2 X127.345 Y120.546 I.896 J-.428 E.0361
G2 X128.546 Y119.982 I-.166 J-1.914 E.04496
G1 X130.591 Y119.982 E.06782
G1 X130.832 Y119.741 E.01131
G1 X130.832 Y119.043 E.02315
G1 X131.276 Y119.358 E.01807
G1 X131.931 Y120.28 E.03752
G2 X132.586 Y120.546 I.545 J-.402 E.02469
G2 X134.23 Y119.435 I-.422 J-2.395 E.06781
G1 X134.224 Y117.899 E.05096
G3 X132.586 Y117.284 I-.129 J-2.145 E.05977
G1 X132.282 Y116.855 E.01744
G1 X132.282 Y115.28 E.05225
G1 X132.586 Y115.305 E.01014
G2 X134.23 Y114.194 I-.422 J-2.395 E.06781
G1 X134.224 Y112.657 E.05096
G3 X132.586 Y112.042 I-.129 J-2.145 E.05977
G1 X131.931 Y111.121 E.03752
G2 X131.276 Y110.854 I-.545 J.402 E.02469
G2 X130.075 Y111.418 I.166 J1.913 E.04494
G1 X126.901 Y111.418 E.10527
G2 X126.035 Y110.854 I-.896 J.428 E.03609
G2 X124.724 Y111.496 I.217 J2.1 E.04942
G1 X124.069 Y112.418 E.03752
G3 X123.414 Y112.684 I-.545 J-.402 E.02469
G3 X121.77 Y111.573 I.422 J-2.395 E.06782
G1 X121.776 Y110.037 E.05095
G2 X123.344 Y109.471 I.135 J-2.083 E.05688
G1 X126.46 Y109.474 E.10337
G2 X127.345 Y110.064 I.919 J-.42 E.03714
G2 X128.579 Y109.476 I-.181 J-1.969 E.04629
G1 X131.705 Y109.479 E.10369
G2 X132.586 Y110.064 I.915 J-.421 E.03695
G2 X133.814 Y109.481 I-.178 J-1.958 E.04602
G1 X134.23 Y109.481 E.01382
G1 X134.23 Y110.693 E.04019
M204 S10000
G1 X134.552 Y121.959 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X134.552 Y109.435 E.347
G1 X134.497 Y109.217 E.00621
G1 X134.296 Y109.156 E.00581
G1 X121.735 Y109.148 E.34804
G1 X121.509 Y109.212 E.00649
G1 X121.448 Y109.441 E.00657
G1 X121.448 Y121.965 E.347
G1 X121.512 Y122.191 E.00649
G1 X121.741 Y122.252 E.00657
G1 X134.265 Y122.252 E.347
G1 X134.477 Y122.2 E.00603
G1 X134.54 Y122.018 E.00534
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X134.477 Y122.2 E-.07328
G1 X134.265 Y122.252 E-.0827
G1 X132.676 Y122.252 E-.60402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 5/36
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S196.35
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-1.2 J.205 P1  F42000
G1 X137.126 Y148.34 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.083 Y148.355 E.0015
G3 X136.718 Y148.402 I-.388 J-1.56 E.01224
G1 X119.282 Y148.402 E.5784
G3 X118.297 Y148.047 I.088 J-1.789 E.03523
G3 X117.698 Y146.818 I1.1 J-1.297 E.04668
G1 X117.698 Y129.382 E.57839
G3 X119.282 Y127.798 I1.618 J.034 E.08207
G1 X136.718 Y127.798 E.5784
G3 X137.703 Y128.153 I-.088 J1.789 E.03523
G3 X138.302 Y129.382 I-1.1 J1.297 E.04668
G1 X138.302 Y146.818 E.57839
G3 X137.444 Y148.217 I-1.607 J-.023 E.05714
G1 X137.182 Y148.319 E.00931
M204 S250
G1 X136.989 Y147.971 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.706 Y148.01 I-.31 J-1.192 E.00877
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.018 J-1.222 E.05786
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.212 J.009 E.05798
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.018 J1.222 E.05786
G1 X137.91 Y146.806 E.53504
G3 X137.046 Y147.954 I-1.231 J-.028 E.04713
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.13086
G1 X135.051 Y148.01 E-.62914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y148.335 Z1.4 F42000
G1 X117.818 Y148.744 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.815 J-.001 E.04255
G1 X137.976 Y127.408 E.65872
G3 X138.698 Y128.218 I-.08 J.798 E.03954
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.68 Y149.113 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.679 Y149.111 E.00007
G3 X116.91 Y147.994 I.428 J-1.117 E.04431
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X138 Y127.016 E.61127
G3 X139.09 Y128.206 I-.103 J1.189 E.05446
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.196 J0 E.05775
G1 X118.106 Y149.19 E.60801
G3 X117.957 Y149.181 I0 J-1.196 E.00461
G1 X117.738 Y149.127 E.00691
; WIPE_START
M204 S6000
G1 X117.679 Y149.111 E-.02353
G1 X117.547 Y149.053 E-.05456
G1 X117.311 Y148.89 E-.10897
G1 X117.121 Y148.676 E-.109
G1 X116.988 Y148.422 E-.10896
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.496 E-.18899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 5 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer5 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.572 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472274
G1 F8384.705
M204 S6000
G1 X117.739 Y148.089 E.01986
; LINE_WIDTH: 0.514968
G1 F7626.349
G2 X117.934 Y148.317 I.548 J-.273 E.01165
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474296
G1 F8345.402
G2 X118.529 Y148.594 I1.92 J-3.439 E.02203
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.39062
G1 F10353.75
M204 S6000
G3 X117.545 Y148.208 I5.874 J-19.81 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390708
G1 F10351.142
M204 S6000
G3 X117.506 Y147.382 I19.556 J-7.095 E.03502
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390668
G1 F10352.348
M204 S6000
G3 X118.718 Y127.606 I7.14 J19.696 E.03501
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.4743
G1 F8345.309
M204 S6000
G2 X117.96 Y127.866 I1.34 J3.677 E.02203
; LINE_WIDTH: 0.514978
G1 F7626.187
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.353 J.5 E.01165
; LINE_WIDTH: 0.472292
G1 F8384.348
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390651
G1 F10352.845
M204 S6000
M73 P60 R5
G3 X117.892 Y127.645 I19.471 J5.763 E.03504
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390686
G1 F10351.788
M204 S6000
G3 X138.494 Y128.818 I-19.757 J7.163 E.035
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474298
G1 F8345.353
M204 S6000
G2 X138.234 Y128.06 I-3.666 J1.336 E.02202
; LINE_WIDTH: 0.501147
G1 F7856.378
G1 X138.217 Y128.034 E.00116
G2 X138.029 Y127.86 I-.577 J.433 E.00961
G1 X137.545 Y127.606 E.02042
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.390621
G1 F10353.747
M204 S6000
G3 X138.455 Y127.992 I-5.872 J19.804 E.03503
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390647
G1 F10352.969
M204 S6000
G3 X137.282 Y148.594 I-7.08 J-19.514 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472283
G1 F8384.515
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514967
G1 F7626.358
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.474288
G1 F8345.555
G2 X138.494 Y147.571 I-3.421 J-1.912 E.02203
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.39065
G1 F10352.87
M204 S6000
G3 X138.108 Y148.555 I-20.002 J-5.942 E.03501
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.14 Y141.114 Z1.4 F42000
G1 X121.157 Y122.427 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X121.044 Y122.039 I.54 J-.367 E.01361
G1 X121.044 Y109.361 E.42058
G3 X121.273 Y108.857 I.642 J-.012 E.01897
G3 X121.661 Y108.744 I.367 J.54 E.01361
G1 X134.411 Y108.756 E.42297
G3 X134.917 Y109.119 I.003 J.53 E.02209
G1 X134.956 Y109.361 E.00811
G1 X134.956 Y122.039 E.42058
G3 X134.727 Y122.543 I-.642 J.012 E.01897
G3 X134.339 Y122.656 I-.367 J-.54 E.01361
G1 X121.661 Y122.656 E.42058
G3 X121.198 Y122.471 I-.012 J-.642 E.01698
M204 S10000
G1 X120.83 Y122.664 F42000
G1 F6000
M204 S6000
G3 X120.691 Y122.408 I.816 J-.61 E.00971
G1 X120.637 Y122.071 E.01131
G1 X120.637 Y109.329 E.42271
G1 X120.691 Y108.992 E.01131
G3 X121.292 Y108.391 I.955 J.354 E.02909
G1 X121.629 Y108.337 E.01131
G1 X134.371 Y108.337 E.42271
G1 X134.475 Y108.354 E.00348
G1 X134.708 Y108.391 E.00783
G3 X135.309 Y108.992 I-.373 J.974 E.02905
G1 X135.363 Y109.329 E.01131
G1 X135.363 Y122.071 E.42271
G1 X135.309 Y122.408 E.01131
G3 X134.708 Y123.009 I-.955 J-.354 E.02909
G1 X134.371 Y123.063 E.01131
G1 X121.629 Y123.063 E.42271
G1 X121.292 Y123.009 E.01131
G3 X120.867 Y122.711 I.354 J-.955 E.01739
M204 S250
G1 X120.499 Y122.895 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X120.313 Y122.531 E.01256
G1 F3540
G1 X120.245 Y122.102 E.01333
G1 F3600
G1 X120.245 Y109.298 E.39345
G1 F3540
G1 X120.313 Y108.869 E.01333
G1 F3420
G1 X120.502 Y108.497 E.01282
G1 F3360
G1 X120.797 Y108.202 E.01282
G1 F3420
G1 X121.169 Y108.013 E.01282
G1 F3540
G1 X121.598 Y107.945 E.01333
G1 F3600
G1 X134.402 Y107.945 E.39345
G1 F3540
G1 X134.536 Y107.966 E.00417
G1 X134.831 Y108.013 E.00916
G1 F3420
G1 X135.203 Y108.202 E.01282
G1 F3360
G1 X135.498 Y108.497 E.01282
G1 F3420
G1 X135.687 Y108.869 E.01282
G1 F3540
G1 X135.755 Y109.298 E.01333
G1 F3600
G1 X135.755 Y122.102 E.39345
G1 F3540
G1 X135.687 Y122.531 E.01333
G1 F3420
G1 X135.498 Y122.903 E.01282
G1 F3360
G1 X135.203 Y123.198 E.01282
G1 F3420
G1 X134.831 Y123.387 E.01282
G1 F3540
G1 X134.402 Y123.455 E.01333
G1 F3600
G1 X121.598 Y123.455 E.39345
G1 F3540
G1 X121.169 Y123.387 E.01333
G1 F3420
G1 X120.797 Y123.198 E.01282
G1 F3360
G1 X120.539 Y122.939 E.01124
; WIPE_START
M204 S6000
G1 X120.313 Y122.531 E-.17724
G1 X120.245 Y122.102 E-.16491
G1 X120.245 Y121.003 E-.41786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.211 Y121.97 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41087
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X121.507 Y122.247 E.02191
G2 X121.69 Y122.286 I.151 J-.262 E.01024
G1 X122.222 Y122.286 E.02875
G1 X121.414 Y121.528 E.05985
G1 X121.414 Y120.896 E.03414
G1 X122.895 Y122.286 E.10974
G1 X123.569 Y122.286 E.03638
G1 X121.414 Y120.264 E.15963
G1 X121.414 Y119.632 E.03414
G1 X124.242 Y122.286 E.20953
G1 X124.916 Y122.286 E.03638
G1 X121.414 Y119 E.25942
G1 X121.414 Y118.368 E.03414
G1 X125.59 Y122.286 E.30931
G1 X126.263 Y122.286 E.03638
G1 X121.414 Y117.736 E.35921
G1 X121.414 Y117.104 E.03414
G1 X126.937 Y122.286 E.4091
G1 X127.61 Y122.286 E.03638
G1 X121.414 Y116.472 E.459
G1 X121.414 Y115.84 E.03414
G1 X128.284 Y122.286 E.50889
G1 X128.957 Y122.286 E.03638
G1 X121.414 Y115.208 E.55878
G1 X121.414 Y114.576 E.03414
G1 X129.631 Y122.286 E.60868
G1 X130.304 Y122.286 E.03638
G1 X121.414 Y113.944 E.65857
G1 X121.414 Y113.312 E.03414
G1 X130.978 Y122.286 E.70847
G1 X131.651 Y122.286 E.03638
G1 X121.414 Y112.68 E.75836
G1 X121.414 Y112.048 E.03414
G1 X125.64 Y116.014 E.31307
G1 X125.64 Y115.511 E.02715
G1 X125.673 Y115.413 E.0056
G1 X121.414 Y111.416 E.31553
G1 X121.414 Y110.784 E.03414
G1 X125.836 Y114.933 E.32755
G1 X125.855 Y114.877 E.0032
G1 X126.355 Y114.805 E.02728
G1 X126.353 Y114.787 E.00096
G1 X121.414 Y110.152 E.36589
G1 X121.414 Y109.52 E.03414
G1 X126.371 Y114.171 E.3672
G1 X126.55 Y113.707 E.02688
G1 X121.66 Y109.119 E.36223
G1 X121.69 Y109.114 E.00163
G1 X122.329 Y109.115 E.03453
G1 X126.728 Y113.243 E.3259
G1 X126.894 Y112.811 E.02496
G1 X128.71 Y114.515 E.13451
G1 X128.739 Y114.497 E.00183
G1 X123.003 Y109.115 E.42488
G1 X123.677 Y109.116 E.03642
G1 X128.908 Y114.024 E.38746
G1 X128.626 Y113.128 E.05072
G1 X124.351 Y109.116 E.31668
G1 X125.025 Y109.117 E.03642
G1 X130.141 Y113.917 E.37893
G1 X130.953 Y114.36 E.04996
G1 X130.953 Y114.679 E.01722
G1 X134.586 Y118.088 E.26916
G1 X134.586 Y118.72 E.03414
G1 X130.953 Y115.31 E.26916
G1 X130.953 Y115.609 E.0161
G1 X130.786 Y115.786 E.01315
G1 X134.586 Y119.352 E.2815
G1 X134.586 Y119.984 E.03414
G1 X130.471 Y116.122 E.30486
G1 X130.155 Y116.458 E.0249
G1 X134.586 Y120.616 E.32822
G1 X134.586 Y121.248 E.03414
G1 X129.77 Y116.729 E.35673
G1 X129.495 Y117.103 E.02507
M73 P61 R5
G1 X134.586 Y121.88 E.37712
G3 X134.54 Y122.207 I-.772 J.059 E.01799
G3 X134.34 Y122.281 I-.172 J-.157 E.01196
G1 X129.224 Y117.48 E.37904
G1 X128.865 Y117.776 E.0251
G1 X133.672 Y122.286 E.35609
G1 X132.998 Y122.286 E.03638
G1 X128.462 Y118.03 E.33601
G1 X128.386 Y118.078 E.00489
G1 X127.84 Y118.078 E.02948
G1 X132.541 Y122.489 E.34822
M106 S196.35
M204 S10000
G1 X126.781 Y114.984 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F9547.299
M204 S6000
G1 X126.731 Y115.126 E.00461
G1 X126.62 Y115.184 E.00385
G1 X126.165 Y115.25 E.01413
G1 X126.054 Y115.653 E.01284
G1 X126.054 Y116.392 E.02272
G1 X127.41 Y117.664 E.05712
G1 X128.267 Y117.664 E.02636
G2 X128.927 Y117.188 I-1.993 J-3.46 E.02504
G1 X129.439 Y116.468 E.02714
G1 X129.853 Y116.176 E.01559
G1 X130.539 Y115.445 E.03079
G1 X130.539 Y114.605 E.0258
G1 X129.314 Y113.937 E.04289
G1 X129.45 Y114.372 E.01403
G1 X129.383 Y114.58 E.0067
G3 X128.681 Y114.986 I-2.019 J-2.677 E.025
G1 X128.553 Y114.935 E.00422
G1 X127.059 Y113.533 E.06295
G1 X126.739 Y114.366 E.02742
G1 X126.777 Y114.924 E.01719
M204 S10000
G1 X127.158 Y114.959 F42000
G1 F9547.299
M204 S6000
G1 X127.007 Y115.383 E.01383
G1 X126.774 Y115.533 E.00853
G1 X126.448 Y115.59 E.01015
G1 X126.431 Y116.229 E.01964
G1 X127.559 Y117.287 E.04752
G1 X128.159 Y117.287 E.01845
G1 X128.649 Y116.929 E.01864
G1 X129.132 Y116.25 E.0256
G2 X130.162 Y115.296 I-3.375 J-4.678 E.04326
G1 X130.162 Y114.829 E.01434
G1 X129.736 Y114.597 E.0149
G1 X129.69 Y114.808 E.00665
G1 X129.105 Y115.201 E.02165
G1 X128.774 Y115.356 E.01122
G1 X128.407 Y115.292 E.01146
G3 X127.21 Y114.192 I28.858 J-32.604 E.04995
G1 X127.123 Y114.456 E.00854
G1 X127.153 Y114.899 E.01363
M204 S10000
G1 X129.087 Y115.712 F42000
; LINE_WIDTH: 0.52517
G1 F7465.008
M204 S6000
G1 X129.28 Y115.592 E.00892
M204 S10000
G1 X129.087 Y115.712 F42000
; LINE_WIDTH: 0.515499
G1 F7617.785
M204 S6000
G1 X128.95 Y115.722 E.0053
; LINE_WIDTH: 0.477295
G1 F8287.77
G1 X128.813 Y115.731 E.00487
; LINE_WIDTH: 0.420451
G1 F9535.64
G1 X128.675 Y115.741 E.00423
G1 X128.166 Y115.587 E.01638
G1 X127.516 Y114.996 E.02703
G1 X127.357 Y115.55 E.01775
G1 X127.283 Y115.64 E.00356
G1 X126.808 Y115.911 E.01684
G1 X126.808 Y116.066 E.00475
G1 X127.708 Y116.91 E.03797
G1 X128.051 Y116.91 E.01057
G1 X128.371 Y116.67 E.01229
G1 X128.824 Y116.031 E.0241
; LINE_WIDTH: 0.439092
G1 F9086.969
G1 X128.899 Y115.94 E.00381
; LINE_WIDTH: 0.477295
G1 F8287.77
G1 X128.974 Y115.85 E.00417
; LINE_WIDTH: 0.515499
G1 F7617.785
G1 X129.049 Y115.759 E.00454
M204 S10000
G1 X128.285 Y116.061 F42000
; LINE_WIDTH: 0.502116
G1 F7839.794
M204 S6000
G1 X127.938 Y115.935 E.01383
G1 X127.706 Y115.741 E.01129
G1 X127.586 Y115.921 E.00811
G1 X127.392 Y116.047 E.00864
G2 X127.902 Y116.488 I2.565 J-2.453 E.0253
G1 X128.074 Y116.358 E.00807
G1 X128.251 Y116.11 E.01138
M204 S10000
G1 X125.484 Y108.915 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41087
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X134.586 Y117.456 E.67429
G1 X134.586 Y116.824 E.03414
G1 X126.374 Y109.118 E.60834
G1 X127.048 Y109.119 E.03642
G1 X134.586 Y116.192 E.5584
G1 X134.586 Y115.56 E.03414
G1 X127.722 Y109.119 E.50846
G1 X128.396 Y109.12 E.03642
G1 X134.586 Y114.928 E.45852
G1 X134.586 Y114.296 E.03414
G1 X129.07 Y109.121 E.40858
G1 X129.745 Y109.121 E.03642
G1 X134.586 Y113.664 E.35864
G1 X134.586 Y113.032 E.03414
G1 X130.419 Y109.122 E.30869
G1 X131.093 Y109.122 E.03642
G1 X134.586 Y112.4 E.25875
G1 X134.586 Y111.768 E.03414
G1 X131.767 Y109.123 E.20881
G1 X132.441 Y109.124 E.03642
G1 X134.586 Y111.136 E.15887
G1 X134.586 Y110.504 E.03414
G1 X133.116 Y109.124 E.10893
G1 X133.79 Y109.125 E.03642
G1 X134.586 Y109.872 E.05899
G1 X134.586 Y109.39 E.02605
G2 X134.544 Y109.201 I-.312 J-.03 E.01064
G1 X134.248 Y108.923 E.02194
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X134.544 Y109.201 E-.15435
G1 X134.586 Y109.39 E-.07359
G1 X134.586 Y109.872 E-.18326
G1 X133.917 Y109.244 E-.3488
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 6/36
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S198.9
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-1.213 J.097 P1  F42000
G1 X137.039 Y148.362 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01071
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.023 J-1.607 E.08221
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.618 J.035 E.08206
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.035 J1.618 E.08206
G1 X138.302 Y146.818 E.5784
G3 X137.096 Y148.347 I-1.629 J-.045 E.0692
M204 S250
G1 X136.989 Y147.971 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.706 Y148.01 I-.31 J-1.192 E.00877
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.223 J.019 E.05785
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.019 J1.223 E.05785
G1 X137.91 Y146.806 E.53504
G3 X137.046 Y147.954 I-1.231 J-.028 E.04713
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.13087
G1 X135.051 Y148.01 E-.62913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y148.334 Z1.6 F42000
G1 X117.819 Y148.742 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.298 J-.758 E.03238
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.815 J-.001 E.04255
G1 X137.964 Y127.407 E.65831
G3 X138.698 Y128.218 I-.079 J.809 E.03982
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.805 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.875 Y148.761 I-.001 J-.815 E.00818
M204 S250
G1 X117.676 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.429 Y148.972 E.00872
G3 X116.91 Y147.994 I.693 J-.995 E.03535
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X137.987 Y127.016 E.61089
G3 X139.09 Y128.206 I-.108 J1.206 E.05465
G1 X139.09 Y147.994 E.60801
G3 X138.924 Y148.601 I-1.37 J-.048 E.01952
M73 P62 R5
G3 X137.894 Y149.19 I-1.031 J-.608 E.03817
G1 X118.106 Y149.19 E.60801
G3 X117.731 Y149.125 I.016 J-1.212 E.01176
; WIPE_START
M204 S6000
G1 X117.429 Y148.972 E-.1286
G1 X117.21 Y148.789 E-.10868
G1 X117.047 Y148.553 E-.10898
G1 X116.988 Y148.422 E-.05456
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.057
G1 X116.91 Y147.485 E-.19317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 6 start: 47,58
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer6 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M73 P62 R4
G1 X117.506 Y147.571 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472285
G1 F8384.485
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514984
G1 F7626.086
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474314
G1 F8345.037
G2 X118.529 Y148.594 I1.909 J-3.414 E.02203
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390676
G1 F10352.108
M204 S6000
G3 X117.545 Y148.208 I5.865 J-19.774 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390671
G1 F10352.242
M204 S6000
G3 X117.506 Y147.381 I19.515 J-7.078 E.03503
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390651
G1 F10352.842
M204 S6000
G3 X118.719 Y127.606 I6.973 J19.187 E.03504
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474321
G1 F8344.909
M204 S6000
G2 X117.96 Y127.866 I1.335 J3.666 E.02203
; LINE_WIDTH: 0.514968
G1 F7626.352
G1 X117.934 Y127.883 E.00119
G2 X117.739 Y128.111 I.353 J.5 E.01166
; LINE_WIDTH: 0.472261
G1 F8384.953
G1 X117.506 Y128.628 E.01985
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390633
G1 F10353.385
M204 S6000
G3 X117.892 Y127.645 I19.762 J5.86 E.03503
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390676
G1 F10352.082
M204 S6000
G3 X138.494 Y128.819 I-19.465 J7.062 E.03503
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474294
G1 F8345.442
M204 S6000
G2 X138.234 Y128.06 I-3.698 J1.351 E.02202
; LINE_WIDTH: 0.50136
G1 F7852.725
G1 X138.217 Y128.034 E.00116
G2 X138.029 Y127.86 I-.577 J.433 E.00962
G1 X137.545 Y127.606 E.02042
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.390678
G1 F10352.033
M204 S6000
G3 X138.455 Y127.992 I-5.848 J19.718 E.03503
M204 S10000
G1 X138.455 Y148.207 F42000
; LINE_WIDTH: 0.390683
G1 F10351.876
M204 S6000
G3 X137.281 Y148.594 I-6.956 J-19.13 E.03504
M204 S10000
G1 X137.472 Y148.594 F42000
; LINE_WIDTH: 0.472267
G1 F8384.841
M204 S6000
G1 X137.989 Y148.361 E.01986
; LINE_WIDTH: 0.514978
G1 F7626.185
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.0012
; LINE_WIDTH: 0.474292
G1 F8345.464
G2 X138.494 Y147.571 I-3.421 J-1.912 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390669
G1 F10352.302
M204 S6000
G3 X138.108 Y148.555 I-20.082 J-5.97 E.03501
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.119 Y141.128 Z1.6 F42000
G1 X121.082 Y122.495 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.003 Y122.34 E.00578
G1 X120.963 Y122.088 E.00845
G1 X120.963 Y109.312 E.42381
G3 X121.205 Y108.782 I.677 J-.011 E.01998
G1 X121.36 Y108.703 E.00578
G1 X121.612 Y108.663 E.00845
G1 X134.388 Y108.663 E.42381
G1 X134.493 Y108.68 E.00354
G3 X134.997 Y109.06 I-.02 J.549 E.0223
G1 X135.037 Y109.312 E.00845
G1 X135.037 Y122.088 E.42381
G3 X134.795 Y122.618 I-.677 J.011 E.01997
G1 X134.64 Y122.697 E.00578
G1 X134.388 Y122.737 E.00845
G1 X121.612 Y122.737 E.42381
G3 X121.123 Y122.539 I-.011 J-.677 E.01798
M204 S10000
G1 X120.749 Y122.737 F42000
G1 F6000
M204 S6000
G3 X120.611 Y122.467 I.784 J-.569 E.01009
G1 X120.556 Y122.12 E.01165
G1 X120.556 Y109.28 E.42593
G1 X120.611 Y108.933 E.01165
G3 X121.233 Y108.311 I.921 J.299 E.03029
G1 X121.58 Y108.256 E.01165
G1 X134.42 Y108.256 E.42593
G1 X134.557 Y108.278 E.0046
G1 X134.767 Y108.311 E.00705
G3 X135.389 Y108.933 I-.386 J1.008 E.03005
G1 X135.444 Y109.28 E.01165
G1 X135.444 Y122.12 E.42593
G1 X135.389 Y122.467 E.01165
G3 X134.767 Y123.089 I-.921 J-.299 E.03029
G1 X134.42 Y123.144 E.01165
G1 X121.58 Y123.144 E.42593
G1 X121.233 Y123.089 E.01165
G3 X120.785 Y122.784 I.299 J-.921 E.01821
M204 S250
G1 X120.424 Y122.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X120.234 Y122.59 E.01287
G1 F3540
G1 X120.164 Y122.151 E.01365
G1 F3600
G1 X120.164 Y109.249 E.39644
G1 F3540
G1 X120.234 Y108.81 E.01365
G1 F3420
G1 X120.427 Y108.43 E.01313
G1 F3360
G1 X120.73 Y108.128 E.01313
G1 F3420
G1 X121.11 Y107.934 E.01313
G1 F3540
G1 X121.549 Y107.864 E.01365
G1 F3600
G1 X134.451 Y107.864 E.39644
G1 F3540
G1 X134.618 Y107.891 E.00521
G1 X134.89 Y107.934 E.00844
G1 F3420
G1 X135.27 Y108.128 E.01313
G1 F3360
G1 X135.572 Y108.43 E.01313
G1 F3420
G1 X135.766 Y108.81 E.01313
G1 F3540
G1 X135.836 Y109.249 E.01365
G1 F3600
G1 X135.836 Y122.151 E.39644
G1 F3540
G1 X135.766 Y122.59 E.01365
G1 F3420
G1 X135.572 Y122.97 E.01313
G1 F3360
G1 X135.27 Y123.273 E.01313
G1 F3420
G1 X134.89 Y123.466 E.01313
G1 F3540
G1 X134.451 Y123.536 E.01365
G1 F3600
G1 X121.549 Y123.536 E.39644
G1 F3540
G1 X121.11 Y123.466 E.01365
G1 F3420
G1 X120.73 Y123.273 E.01313
G1 F3360
M73 P63 R4
G1 X120.464 Y123.007 E.01154
; WIPE_START
M204 S6000
G1 X120.234 Y122.59 E-.18112
G1 X120.164 Y122.151 E-.16876
G1 X120.164 Y121.072 E-.41012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.788 Y113.465 Z1.6 F42000
G1 X121.127 Y109.336 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42498
G1 F9422.604
M204 S6000
G1 X121.411 Y109.051 E.01252
G1 X121.465 Y109.024 E.00187
G3 X122.006 Y108.996 I.358 J1.696 E.01695
G1 X121.296 Y109.706 E.03125
G1 X121.296 Y110.247 E.01682
G1 X122.547 Y108.996 E.05504
G1 X123.087 Y108.996 E.01682
G1 X121.296 Y110.787 E.07883
G1 X121.296 Y111.327 E.01682
G1 X123.627 Y108.996 E.10262
G1 X124.168 Y108.996 E.01682
G1 X121.296 Y111.868 E.12641
G1 X121.296 Y112.408 E.01682
G1 X124.708 Y108.996 E.1502
G1 X125.248 Y108.996 E.01682
G1 X121.296 Y112.948 E.17399
G1 X121.296 Y113.488 E.01682
G1 X125.788 Y108.996 E.19778
G1 X126.329 Y108.996 E.01682
G1 X121.296 Y114.029 E.22157
G1 X121.296 Y114.569 E.01682
G1 X126.869 Y108.996 E.24536
G1 X127.409 Y108.996 E.01682
G1 X121.296 Y115.109 E.26915
G1 X121.296 Y115.65 E.01682
G1 X127.95 Y108.996 E.29294
G1 X128.49 Y108.996 E.01682
G1 X121.296 Y116.19 E.31672
G1 X121.296 Y116.73 E.01682
G1 X129.03 Y108.996 E.34051
G1 X129.571 Y108.996 E.01682
G1 X121.296 Y117.271 E.3643
G1 X121.296 Y117.811 E.01682
G1 X130.111 Y108.996 E.38809
G1 X130.651 Y108.996 E.01682
G1 X121.296 Y118.351 E.41188
G1 X121.296 Y118.892 E.01682
G1 X131.192 Y108.996 E.43567
G1 X131.732 Y108.996 E.01682
G1 X121.296 Y119.432 E.45946
G1 X121.296 Y119.972 E.01682
G1 X132.272 Y108.996 E.48325
G1 X132.813 Y108.996 E.01682
G1 X121.296 Y120.513 E.50704
G1 X121.296 Y121.053 E.01682
G1 X133.353 Y108.996 E.53083
G1 X133.893 Y108.996 E.01682
G1 X121.296 Y121.593 E.55462
G1 X121.306 Y122.124 E.01652
G1 X134.424 Y109.006 E.57755
G3 X134.694 Y109.276 I0 J.27 E.01321
G1 X121.576 Y122.394 E.57754
G1 X122.107 Y122.404 E.01652
G1 X134.704 Y109.807 E.55461
G1 X134.704 Y110.347 E.01682
G1 X122.647 Y122.404 E.53082
G1 X123.188 Y122.404 E.01682
G1 X134.704 Y110.888 E.50703
G1 X134.704 Y111.428 E.01682
G1 X123.728 Y122.404 E.48324
G1 X124.268 Y122.404 E.01682
G1 X134.704 Y111.968 E.45945
G1 X134.704 Y112.509 E.01682
G1 X124.809 Y122.404 E.43566
G1 X125.349 Y122.404 E.01682
G1 X134.704 Y113.049 E.41187
G1 X134.704 Y113.589 E.01682
G1 X125.889 Y122.404 E.38809
G1 X126.43 Y122.404 E.01682
G1 X134.704 Y114.13 E.3643
G1 X134.704 Y114.67 E.01682
G1 X126.97 Y122.404 E.34051
G1 X127.51 Y122.404 E.01682
G1 X134.704 Y115.21 E.31672
G1 X134.704 Y115.75 E.01682
G1 X128.05 Y122.404 E.29293
G1 X128.591 Y122.404 E.01682
G1 X134.704 Y116.291 E.26914
G1 X134.704 Y116.831 E.01682
G1 X129.131 Y122.404 E.24535
G1 X129.671 Y122.404 E.01682
G1 X134.704 Y117.371 E.22156
G1 X134.704 Y117.912 E.01682
G1 X130.212 Y122.404 E.19777
G1 X130.752 Y122.404 E.01682
G1 X134.704 Y118.452 E.17398
G1 X134.704 Y118.992 E.01682
G1 X131.292 Y122.404 E.15019
G1 X131.833 Y122.404 E.01682
G1 X134.704 Y119.533 E.1264
G1 X134.704 Y120.073 E.01682
G1 X132.373 Y122.404 E.10261
G1 X132.913 Y122.404 E.01682
G1 X134.704 Y120.613 E.07882
G1 X134.704 Y121.154 E.01682
G1 X133.454 Y122.404 E.05503
G1 X133.994 Y122.404 E.01682
G1 X134.704 Y121.694 E.03125
G1 X134.704 Y122.062 E.01146
G3 X134.649 Y122.289 I-.377 J.029 E.0074
G1 X134.365 Y122.573 E.01251
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9422.604
G1 X134.649 Y122.289 E-.15269
G1 X134.676 Y122.235 E-.02293
G1 X134.704 Y122.062 E-.06675
G1 X134.704 Y121.694 E-.13982
G1 X134.001 Y122.397 E-.37781
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 7/36
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-1.209 J.141 P1  F42000
G1 X137.038 Y148.362 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01069
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.023 J-1.607 E.08221
G1 X117.698 Y129.382 E.57839
G3 X119.282 Y127.798 I1.607 J.023 E.08221
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.023 J1.607 E.08221
G1 X138.302 Y146.818 E.5784
G3 X137.096 Y148.347 I-1.629 J-.045 E.06923
M204 S250
G1 X136.989 Y147.971 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X136.706 Y148.01 I-.31 J-1.192 E.00877
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.028 J-1.231 E.05775
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.028 J1.231 E.05775
G1 X137.91 Y146.806 E.53504
G3 X137.046 Y147.954 I-1.231 J-.028 E.04713
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.13086
G1 X135.051 Y148.01 E-.62914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y148.334 Z1.8 F42000
G1 X117.819 Y148.741 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.298 J-.758 E.03238
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.815 J-.001 E.04255
G1 X137.951 Y127.406 E.65789
G3 X138.698 Y128.218 I-.065 J.81 E.04023
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.815 J.001 E.04255
G1 X118.118 Y148.798 E.65559
G3 X117.875 Y148.761 I-.001 J-.815 E.00818
M204 S250
G1 X117.679 Y149.113 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.68 Y149.107 E.00016
G3 X116.91 Y147.994 I.445 J-1.131 E.04413
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X137.975 Y127.015 E.6105
G3 X139.09 Y128.206 I-.095 J1.207 E.05503
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.212 J-.016 E.05754
G1 X118.106 Y149.19 E.60801
G3 X117.883 Y149.167 I-.019 J-.932 E.00692
M73 P64 R4
G1 X117.737 Y149.128 E.00464
; WIPE_START
M204 S6000
G1 X117.68 Y149.107 E-.02304
G1 X117.547 Y149.053 E-.05453
G1 X117.311 Y148.89 E-.10895
G1 X117.21 Y148.789 E-.05461
G1 X117.121 Y148.676 E-.05461
G1 X116.988 Y148.422 E-.10896
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.495 E-.1893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 7 start: 47,58
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer7 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472265
G1 F8384.876
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.51496
G1 F7626.485
G2 X117.934 Y148.317 I.549 J-.273 E.01166
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474313
G1 F8345.075
G2 X118.529 Y148.594 I1.909 J-3.414 E.02203
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390676
G1 F10352.09
M204 S6000
G3 X117.545 Y148.208 I5.841 J-19.699 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390705
G1 F10351.248
M204 S6000
G3 X117.506 Y147.382 I19.403 J-7.047 E.03502
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390666
G1 F10352.409
M204 S6000
G3 X118.719 Y127.606 I7.083 J19.531 E.03502
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474284
G1 F8345.621
M204 S6000
G2 X117.96 Y127.866 I1.352 J3.701 E.02202
; LINE_WIDTH: 0.51499
G1 F7625.986
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.354 J.501 E.01165
; LINE_WIDTH: 0.472276
G1 F8384.657
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390656
G1 F10352.686
M204 S6000
G3 X117.893 Y127.645 I19.513 J5.78 E.03504
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390652
G1 F10352.812
M204 S6000
G3 X138.494 Y128.819 I-19.278 J7.002 E.03503
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474281
G1 F8345.679
M204 S6000
G2 X138.234 Y128.06 I-3.695 J1.35 E.02202
; LINE_WIDTH: 0.514968
G1 F7626.345
G1 X138.217 Y128.034 E.00119
G2 X137.989 Y127.839 I-.5 J.353 E.01165
; LINE_WIDTH: 0.456032
G1 F8714.345
G2 X137.383 Y127.606 I-2.242 J4.925 E.02187
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.390685
G1 F10351.835
M204 S6000
G3 X138.455 Y127.992 I-5.861 J19.764 E.03503
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390704
G1 F10351.261
M204 S6000
G3 X137.282 Y148.594 I-7.063 J-19.456 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.47227
G1 F8384.78
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514967
G1 F7626.364
G2 X138.217 Y148.166 I-.273 J-.549 E.01166
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.47427
G1 F8345.895
G2 X138.494 Y147.571 I-3.417 J-1.91 E.02203
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390672
G1 F10352.21
M204 S6000
G3 X138.108 Y148.555 I-20.053 J-5.959 E.03501
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.1 Y141.142 Z1.8 F42000
G1 X121.012 Y122.559 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X120.924 Y122.398 I.524 J-.395 E.0061
G1 X120.882 Y122.137 E.00878
G1 X120.882 Y109.263 E.42704
G1 X120.924 Y109.002 E.00878
G3 X121.302 Y108.624 I.613 J.235 E.01827
G1 X121.563 Y108.582 E.00878
G1 X134.437 Y108.582 E.42703
G1 X134.575 Y108.604 E.00466
G3 X135.076 Y109.002 I-.047 J.573 E.0225
G1 X135.118 Y109.263 E.00878
G1 X135.118 Y122.137 E.42704
G1 X135.076 Y122.398 E.00878
G3 X134.698 Y122.776 I-.613 J-.235 E.01827
G1 X134.437 Y122.818 E.00878
G1 X121.563 Y122.818 E.42704
G1 X121.302 Y122.776 E.00878
G3 X121.051 Y122.605 I.235 J-.613 E.01018
M204 S10000
G1 X120.674 Y122.805 F42000
G1 F6000
M204 S6000
G1 X120.532 Y122.526 E.01039
G1 X120.475 Y122.169 E.01199
G1 X120.475 Y109.231 E.42916
G1 X120.532 Y108.874 E.01199
G1 X120.674 Y108.595 E.01039
G1 X120.895 Y108.374 E.01039
G1 X121.174 Y108.232 E.01039
G1 X121.531 Y108.175 E.01199
G1 X134.469 Y108.175 E.42916
G1 X134.639 Y108.202 E.00572
G1 X134.826 Y108.232 E.00626
G1 X135.105 Y108.374 E.01039
G1 X135.326 Y108.595 E.01039
G1 X135.468 Y108.874 E.01039
G1 X135.525 Y109.231 E.01199
G1 X135.525 Y122.169 E.42916
G1 X135.468 Y122.526 E.01199
G1 X135.326 Y122.805 E.01039
G1 X135.105 Y123.026 E.01039
G1 X134.826 Y123.168 E.01039
G1 X134.469 Y123.225 E.01199
G1 X121.531 Y123.225 E.42916
G1 X121.174 Y123.168 E.01199
G1 X120.895 Y123.026 E.01039
G1 X120.716 Y122.847 E.0084
M204 S250
G1 X120.349 Y123.031 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X120.154 Y122.648 E.01321
G1 F3540
G1 X120.083 Y122.2 E.01396
G1 F3600
G1 X120.083 Y109.2 E.39943
G1 F3540
G1 X120.154 Y108.752 E.01396
G1 F3420
G1 X120.353 Y108.362 E.01344
G1 F3360
G1 X120.662 Y108.053 E.01344
G1 F3420
G1 X121.052 Y107.854 E.01344
G1 F3540
G1 X121.5 Y107.783 E.01396
G1 F3600
G1 X134.5 Y107.783 E.39943
G1 F3540
G1 X134.7 Y107.815 E.00625
G1 X134.948 Y107.854 E.00771
G1 F3420
G1 X135.338 Y108.053 E.01344
G1 F3360
G1 X135.647 Y108.362 E.01344
G1 F3420
G1 X135.846 Y108.752 E.01344
G1 F3540
G1 X135.917 Y109.2 E.01396
G1 F3600
G1 X135.917 Y122.2 E.39943
G1 F3540
G1 X135.846 Y122.648 E.01396
G1 F3420
G1 X135.647 Y123.038 E.01344
G1 F3360
G1 X135.338 Y123.347 E.01344
G1 F3420
G1 X134.948 Y123.546 E.01344
G1 F3540
G1 X134.5 Y123.617 E.01396
G1 F3600
M73 P65 R4
G1 X121.5 Y123.617 E.39943
G1 F3540
G1 X121.052 Y123.546 E.01396
G1 F3420
G1 X120.662 Y123.347 E.01344
G1 F3360
G1 X120.39 Y123.075 E.01183
; WIPE_START
M204 S6000
G1 X120.154 Y122.648 E-.18533
G1 X120.083 Y122.2 E-.17261
G1 X120.083 Y121.142 E-.40206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.046 Y122.129 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42144
G1 F9510.725
M204 S6000
G1 X121.339 Y122.421 E.01275
G1 X121.406 Y122.456 E.00233
G2 X121.937 Y122.485 I.357 J-1.663 E.01648
G1 X121.215 Y121.763 E.0315
G1 X121.215 Y121.227 E.01651
G1 X122.473 Y122.485 E.05485
G1 X123.008 Y122.485 E.01651
G1 X121.215 Y120.692 E.0782
G1 X121.215 Y120.157 E.01651
G1 X123.543 Y122.485 E.10155
G1 X124.079 Y122.485 E.01651
G1 X121.215 Y119.621 E.1249
G1 X121.215 Y119.086 E.01651
G1 X124.614 Y122.485 E.14825
G1 X125.149 Y122.485 E.01651
G1 X121.215 Y118.551 E.1716
G1 X121.215 Y118.015 E.01651
G1 X125.685 Y122.485 E.19495
G1 X126.22 Y122.485 E.01651
G1 X121.215 Y117.48 E.2183
G1 X121.215 Y116.945 E.01651
G1 X126.755 Y122.485 E.24165
G1 X127.29 Y122.485 E.01651
G1 X121.215 Y116.41 E.265
G1 X121.215 Y115.874 E.01651
G1 X127.826 Y122.485 E.28835
G1 X128.361 Y122.485 E.01651
G1 X121.215 Y115.339 E.3117
G1 X121.215 Y114.804 E.01651
G1 X128.896 Y122.485 E.33505
G1 X129.432 Y122.485 E.01651
G1 X121.215 Y114.268 E.3584
G1 X121.215 Y113.733 E.01651
G1 X129.967 Y122.485 E.38176
G1 X130.502 Y122.485 E.01651
G1 X121.215 Y113.198 E.40511
G1 X121.215 Y112.662 E.01651
G1 X131.038 Y122.485 E.42846
G1 X131.573 Y122.485 E.01651
G1 X121.215 Y112.127 E.45181
G1 X121.215 Y111.592 E.01651
G1 X132.108 Y122.485 E.47516
G1 X132.644 Y122.485 E.01651
G1 X121.215 Y111.056 E.49851
G1 X121.215 Y110.521 E.01651
G1 X133.179 Y122.485 E.52186
G1 X133.714 Y122.485 E.01651
G1 X121.215 Y109.986 E.54521
G1 X121.215 Y109.451 E.01651
G1 X134.249 Y122.485 E.56856
G1 X134.411 Y122.485 E.00497
G2 X134.692 Y122.392 I.036 J-.364 E.00941
G1 X121.308 Y109.008 E.58382
G1 X121.336 Y108.98 E.00121
G3 X121.751 Y108.915 I.338 J.802 E.01308
G1 X134.785 Y121.949 E.56855
G1 X134.785 Y121.414 E.01651
G1 X122.286 Y108.915 E.54519
G1 X122.821 Y108.915 E.01651
G1 X134.785 Y120.879 E.52184
G1 X134.785 Y120.343 E.01651
G1 X123.357 Y108.915 E.49849
G1 X123.892 Y108.915 E.01651
G1 X134.785 Y119.808 E.47514
G1 X134.785 Y119.273 E.01651
G1 X124.427 Y108.915 E.45179
G1 X124.963 Y108.915 E.01651
G1 X134.785 Y118.737 E.42844
G1 X134.785 Y118.202 E.01651
G1 X125.498 Y108.915 E.40509
G1 X126.033 Y108.915 E.01651
G1 X134.785 Y117.667 E.38174
G1 X134.785 Y117.131 E.01651
G1 X126.569 Y108.915 E.35839
G1 X127.104 Y108.915 E.01651
G1 X134.785 Y116.596 E.33504
G1 X134.785 Y116.061 E.01651
G1 X127.639 Y108.915 E.31169
G1 X128.175 Y108.915 E.01651
G1 X134.785 Y115.525 E.28834
G1 X134.785 Y114.99 E.01651
G1 X128.71 Y108.915 E.26499
G1 X129.245 Y108.915 E.01651
G1 X134.785 Y114.455 E.24164
G1 X134.785 Y113.92 E.01651
G1 X129.78 Y108.915 E.21829
G1 X130.316 Y108.915 E.01651
G1 X134.785 Y113.384 E.19494
G1 X134.785 Y112.849 E.01651
G1 X130.851 Y108.915 E.17159
G1 X131.386 Y108.915 E.01651
G1 X134.785 Y112.314 E.14823
G1 X134.785 Y111.778 E.01651
G1 X131.922 Y108.915 E.12488
G1 X132.457 Y108.915 E.01651
G1 X134.785 Y111.243 E.10153
G1 X134.785 Y110.708 E.01651
G1 X132.992 Y108.915 E.07818
G1 X133.528 Y108.915 E.01651
G1 X134.785 Y110.172 E.05483
G1 X134.785 Y109.637 E.01651
G1 X134.063 Y108.915 E.03148
G1 X134.41 Y108.915 E.01072
G3 X134.662 Y108.979 I-.021 J.61 E.00806
G1 X134.953 Y109.271 E.01272
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9510.725
G1 X134.662 Y108.979 E-.15668
G1 X134.594 Y108.944 E-.02895
G1 X134.41 Y108.915 E-.07062
G1 X134.063 Y108.915 E-.13206
G1 X134.755 Y109.607 E-.37169
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 8/36
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-1.215 J.072 P1  F42000
G1 X137.037 Y148.362 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01066
G1 X119.282 Y148.402 E.57839
G3 X117.698 Y146.818 I.045 J-1.629 E.08192
G1 X117.698 Y129.382 E.57839
G3 X119.282 Y127.798 I1.607 J.023 E.08221
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.023 J1.607 E.08221
G1 X138.302 Y146.818 E.57839
G3 X137.095 Y148.347 I-1.629 J-.045 E.06925
M204 S250
G1 X136.989 Y147.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00875
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.028 J-1.231 E.05775
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.231 J.028 E.05775
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.028 J1.231 E.05775
G1 X137.91 Y146.806 E.53504
G3 X137.042 Y147.956 I-1.231 J-.028 E.04727
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12914
G1 X135.046 Y148.01 E-.63086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.421 Y148.334 Z2 F42000
G1 X117.819 Y148.741 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.298 J-.758 E.03238
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.815 J-.001 E.04255
G1 X137.939 Y127.406 E.65748
G3 X138.698 Y128.218 I-.053 J.81 E.04064
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.815 J.001 E.04255
G1 X118.118 Y148.798 E.65559
G3 X117.875 Y148.761 I-.001 J-.815 E.00818
M204 S250
G1 X117.677 Y149.112 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.429 Y148.972 E.00875
G3 X116.91 Y147.994 I.693 J-.995 E.03535
G1 X116.91 Y128.206 E.60801
G3 X116.934 Y127.977 I.958 J-.017 E.00711
G3 X118.106 Y127.01 I1.19 J.249 E.05045
G1 X137.962 Y127.014 E.61012
G3 X139.066 Y127.977 I-.083 J1.21 E.04832
G3 X139.09 Y128.206 I-.934 J.213 E.00711
G1 X139.09 Y147.994 E.60801
G3 X139.066 Y148.223 I-.958 J.017 E.00711
G3 X137.894 Y149.19 I-1.19 J-.249 E.05045
G1 X118.106 Y149.19 E.60801
M73 P66 R4
G3 X117.731 Y149.125 I.016 J-1.212 E.01176
; WIPE_START
M204 S6000
G1 X117.429 Y148.972 E-.12861
G1 X117.311 Y148.89 E-.05451
G1 X117.121 Y148.676 E-.10899
G1 X116.988 Y148.422 E-.10898
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.486 E-.19292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 8 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer8 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472277
G1 F8384.634
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514971
G1 F7626.3
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.0012
; LINE_WIDTH: 0.474281
G1 F8345.688
G2 X118.529 Y148.594 I1.909 J-3.414 E.02202
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390682
G1 F10351.91
M204 S6000
G3 X117.545 Y148.208 I5.857 J-19.752 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390657
G1 F10352.675
M204 S6000
G3 X117.506 Y147.382 I19.717 J-7.147 E.03501
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390661
G1 F10352.553
M204 S6000
G3 X118.719 Y127.606 I6.981 J19.214 E.03504
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474272
G1 F8345.858
M204 S6000
G2 X117.96 Y127.866 I1.346 J3.687 E.02202
; LINE_WIDTH: 0.514971
G1 F7626.307
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.354 J.501 E.01165
; LINE_WIDTH: 0.472304
G1 F8384.12
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.818 F42000
; LINE_WIDTH: 0.390666
G1 F10352.381
M204 S6000
G3 X117.892 Y127.645 I19.945 J5.92 E.03502
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.381652
G1 F10627.887
M204 S6000
G3 X137.87 Y127.79 I-2.802 J9.954 E.01703
; LINE_WIDTH: 0.426677
G1 F9380.956
G1 X137.914 Y127.807 E.00148
; LINE_WIDTH: 0.46331
G1 F8563.492
G1 X137.989 Y127.839 E.00278
; LINE_WIDTH: 0.514965
G1 F7626.397
G3 X138.217 Y128.034 I-.273 J.549 E.01165
G1 X138.234 Y128.06 E.0012
; LINE_WIDTH: 0.474278
G1 F8345.743
G3 X138.494 Y128.629 I-3.419 J1.91 E.02203
M204 S10000
G1 X138.494 Y128.818 F42000
; LINE_WIDTH: 0.390676
G1 F10352.1
M204 S6000
G2 X138.108 Y127.645 I-19.873 J5.898 E.03502
; WIPE_START
G1 X138.494 Y128.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.479 Y136.451 Z2 F42000
G1 X138.455 Y148.208 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.390667
G1 F10352.379
M204 S6000
G3 X137.282 Y148.594 I-7.066 J-19.467 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472314
G1 F8383.915
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514988
G1 F7626.021
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.474275
G1 F8345.801
G2 X138.494 Y147.571 I-3.432 J-1.917 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390666
G1 F10352.404
M204 S6000
G3 X138.108 Y148.555 I-20.043 J-5.955 E.03501
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X135.136 Y140.528 Z2 F42000
G1 X124.146 Y118.104 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X124.146 Y113.296 E.1595
G1 X125.596 Y113.296 E.0481
G1 X125.596 Y111.846 E.0481
G1 X130.404 Y111.846 E.1595
G1 X130.404 Y113.296 E.0481
G1 X131.854 Y113.296 E.0481
G1 X131.854 Y118.104 E.1595
G1 X130.404 Y118.104 E.0481
G1 X130.404 Y119.554 E.0481
G1 X125.596 Y119.554 E.1595
G1 X125.596 Y118.104 E.0481
G1 X124.206 Y118.104 E.04611
M204 S10000
G1 X124.553 Y117.697 F42000
G1 F6000
M204 S6000
G1 X124.553 Y113.703 E.13249
G1 X126.003 Y113.703 E.0481
G1 X126.003 Y112.253 E.0481
G1 X129.997 Y112.253 E.13249
G1 X129.997 Y113.703 E.0481
G1 X131.447 Y113.703 E.0481
G1 X131.447 Y117.697 E.13249
G1 X129.997 Y117.697 E.0481
G1 X129.997 Y119.147 E.0481
G1 X126.003 Y119.147 E.13249
G1 X126.003 Y117.697 E.0481
G1 X124.613 Y117.697 E.04611
; WIPE_START
G1 X124.583 Y115.697 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.029 Y122.452 Z2 F42000
G1 X120.938 Y122.626 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X120.844 Y122.457 I.553 J-.417 E.00643
G1 X120.801 Y122.185 E.00912
G1 X120.801 Y109.215 E.43026
G1 X120.844 Y108.943 E.00912
G3 X121.243 Y108.544 I.647 J.248 E.01928
G1 X121.515 Y108.501 E.00912
G1 X134.485 Y108.501 E.43026
G1 X134.658 Y108.528 E.00578
G3 X135.156 Y108.943 I-.076 J.598 E.02271
G1 X135.199 Y109.215 E.00912
G1 X135.199 Y122.185 E.43026
G1 X135.156 Y122.457 E.00912
G3 X134.757 Y122.856 I-.647 J-.248 E.01928
G1 X134.485 Y122.899 E.00912
G1 X121.515 Y122.899 E.43026
G1 X121.243 Y122.856 E.00912
G3 X120.976 Y122.672 I.248 J-.647 E.01085
M204 S10000
G1 X120.599 Y122.872 F42000
G1 F6000
M204 S6000
G1 X120.452 Y122.584 E.01073
G1 X120.394 Y122.217 E.01232
G1 X120.394 Y109.183 E.43239
G1 X120.452 Y108.816 E.01232
G1 X120.599 Y108.528 E.01073
G1 X120.828 Y108.299 E.01073
G1 X121.116 Y108.152 E.01073
G1 X121.483 Y108.094 E.01232
G1 X134.517 Y108.094 E.43239
G1 X134.721 Y108.126 E.00685
G1 X134.884 Y108.152 E.00548
G1 X135.172 Y108.299 E.01073
G1 X135.401 Y108.528 E.01073
G1 X135.548 Y108.816 E.01073
G1 X135.606 Y109.183 E.01232
G1 X135.606 Y122.217 E.43239
G1 X135.548 Y122.584 E.01232
G1 X135.401 Y122.872 E.01073
G1 X135.172 Y123.101 E.01073
G1 X134.884 Y123.248 E.01073
G1 X134.517 Y123.306 E.01232
G1 X121.483 Y123.306 E.43239
G1 X121.116 Y123.248 E.01232
G1 X120.828 Y123.101 E.01073
G1 X120.641 Y122.915 E.00874
M204 S250
G1 X120.275 Y123.101 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P67 R4
G1 F3420
M204 S5000
G1 X120.075 Y122.707 E.01358
G1 F3540
G1 X120.002 Y122.248 E.01427
G1 F3600
G1 X120.002 Y109.152 E.40242
G1 F3540
G1 X120.075 Y108.693 E.01427
G1 F3420
G1 X120.278 Y108.294 E.01375
G1 F3360
G1 X120.594 Y107.978 E.01375
G1 F3420
G1 X120.993 Y107.775 E.01375
G1 F3540
G1 X121.452 Y107.702 E.01427
G1 F3600
G1 X134.548 Y107.702 E.40242
G1 F3540
G1 X134.783 Y107.739 E.00729
G1 X135.007 Y107.775 E.00698
G1 F3420
G1 X135.406 Y107.978 E.01375
G1 F3360
G1 X135.722 Y108.294 E.01375
G1 F3420
G1 X135.925 Y108.693 E.01375
G1 F3540
G1 X135.998 Y109.152 E.01427
G1 F3600
G1 X135.998 Y122.248 E.40242
G1 F3540
G1 X135.925 Y122.707 E.01427
G1 F3420
G1 X135.722 Y123.106 E.01375
G1 F3360
G1 X135.406 Y123.422 E.01375
G1 F3420
G1 X135.007 Y123.625 E.01375
G1 F3540
G1 X134.548 Y123.698 E.01427
G1 F3600
G1 X121.452 Y123.698 E.40242
G1 F3540
G1 X120.993 Y123.625 E.01427
G1 F3420
G1 X120.594 Y123.422 E.01375
G1 F3360
G1 X120.316 Y123.144 E.01209
; WIPE_START
M204 S6000
G1 X120.075 Y122.707 E-.18979
G1 X120.002 Y122.248 E-.17648
G1 X120.002 Y121.212 E-.39374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.348 Y119.142 Z2 F42000
G1 X129.775 Y118.458 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X129.308 Y118.925 E.02027
G1 X128.775 Y118.925
G1 X129.775 Y117.925 E.04344
G1 X130.758 Y117.475
G1 X131.225 Y117.008 E.02027
G1 X131.225 Y116.475
G1 X130.225 Y117.475 E.04344
M204 S10000
G1 X131.225 Y115.942 F42000
G1 F3000
M204 S2000
G1 X128.242 Y118.925 E.12962
G1 X127.708 Y118.925
G1 X131.225 Y115.408 E.1528
G1 X131.225 Y114.875
G1 X127.175 Y118.925 E.17597
G1 X126.642 Y118.925
G1 X131.225 Y114.342 E.19914
G1 X131.108 Y113.925
G1 X126.225 Y118.808 E.21215
G1 X126.225 Y118.274
G1 X130.574 Y113.925 E.18898
G1 X130.041 Y113.925
G1 X126.225 Y117.741 E.16581
G1 X125.959 Y117.475
G1 X129.775 Y113.659 E.16581
G1 X129.775 Y113.126
G1 X125.426 Y117.475 E.18898
G1 X124.892 Y117.475
G1 X129.775 Y112.592 E.21216
G1 X129.358 Y112.475
G1 X124.775 Y117.058 E.19913
G1 X124.775 Y116.525
G1 X128.825 Y112.475 E.17596
G1 X128.292 Y112.475
G1 X124.775 Y115.992 E.15279
G1 X124.775 Y115.458
G1 X127.758 Y112.476 E.12962
G1 X127.225 Y112.476
G1 X126.225 Y113.475 E.04343
G1 X126.225 Y112.942
G1 X126.692 Y112.476 E.02026
; WIPE_START
M204 S6000
G1 X126.225 Y112.942 E-.25058
G1 X126.225 Y113.475 E-.20264
G1 X126.796 Y112.904 E-.30679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.775 Y113.925 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X124.775 Y114.925 E.04344
G1 X124.775 Y114.392
G1 X125.242 Y113.926 E.02026
; WIPE_START
M204 S6000
G1 X124.775 Y114.392 E-.25058
G1 X124.775 Y114.925 E-.20264
G1 X125.346 Y114.354 E-.30679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y110.42 Z2 F42000
G1 X134.424 Y108.893 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X121.545 Y108.893 E.39572
G1 X121.317 Y108.946 E.00721
G1 X121.208 Y109.15 E.00709
G1 X121.193 Y109.276 E.00389
G1 X121.193 Y122.155 E.39572
G1 X121.246 Y122.383 E.00721
G1 X121.45 Y122.492 E.00708
G1 X121.576 Y122.507 E.00389
G1 X134.455 Y122.507 E.39572
G1 X134.683 Y122.454 E.00721
G1 X134.792 Y122.25 E.00708
G1 X134.807 Y122.124 E.00389
G1 X134.807 Y109.276 E.3948
G1 X134.754 Y109.017 E.00812
G1 X134.55 Y108.908 E.00708
G1 X134.484 Y108.9 E.00205
M204 S10000
G1 X134.424 Y109.27 F42000
G1 F9547.299
M204 S6000
G1 X121.575 Y109.27 E.39482
G1 X121.57 Y122.125 E.39499
G1 X134.425 Y122.13 E.39499
G1 X134.43 Y109.328 E.39336
M204 S10000
G1 X132.599 Y111.101 F42000
; LINE_WIDTH: 0.4057
G1 F9923.369
M204 S6000
G1 X132.929 Y111.252 E.01072
G1 X132.929 Y110.771 E.0142
G1 X132.448 Y110.771 E.0142
G1 X132.574 Y111.047 E.00895
M204 S10000
G1 X132.283 Y111.417 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.578 Y111.477 E.00926
G1 X133.107 Y111.759 E.01841
G1 X133.299 Y111.991 E.00925
G1 X133.299 Y110.401 E.04885
G1 X131.709 Y110.401 E.04885
G1 X131.941 Y110.593 E.00925
G1 X132.223 Y111.122 E.01841
G1 X132.271 Y111.358 E.00741
M204 S10000
G1 X133.695 Y113.092 F42000
; LINE_WIDTH: 0.399459
G1 F10097.086
M204 S6000
G1 X133.676 Y112.379 E.02073
G1 X133.676 Y110.024 E.06842
G1 X131.321 Y110.024 E.06842
G1 X130.608 Y110.005 E.02073
G1 X125.392 Y110.005 E.15152
G1 X124.679 Y110.024 E.02073
G1 X122.324 Y110.024 E.06842
G1 X122.324 Y112.379 E.06842
G1 X122.305 Y113.092 E.02073
G1 X122.305 Y118.308 E.15152
G1 X122.324 Y119.021 E.02073
G1 X122.324 Y121.376 E.06842
G1 X124.679 Y121.376 E.06842
G1 X125.392 Y121.395 E.02073
G1 X130.608 Y121.395 E.15152
G1 X131.321 Y121.376 E.02073
G1 X133.676 Y121.376 E.06842
G1 X133.676 Y119.021 E.06842
G1 X133.695 Y118.308 E.02073
G1 X133.695 Y113.152 E.14978
M204 S10000
G1 X132.283 Y119.983 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.223 Y120.278 E.00926
G1 X131.941 Y120.807 E.01841
G1 X131.709 Y120.999 E.00925
G1 X133.299 Y120.999 E.04885
G1 X133.299 Y119.409 E.04885
G1 X133.107 Y119.641 E.00925
G1 X132.578 Y119.923 E.01841
G1 X132.342 Y119.971 E.00741
M204 S10000
G1 X132.599 Y120.299 F42000
; LINE_WIDTH: 0.4057
G1 F9923.369
M204 S6000
G1 X132.448 Y120.629 E.01072
G1 X132.929 Y120.629 E.0142
G1 X132.929 Y120.148 E.0142
G1 X132.653 Y120.274 E.00895
M204 S10000
G1 X121.947 Y121.753 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X134.053 Y121.753 E.37196
G1 X134.053 Y109.647 E.37196
G1 X121.947 Y109.647 E.37196
G1 X121.947 Y121.693 E.37012
M204 S10000
G1 X123.401 Y120.299 F42000
; LINE_WIDTH: 0.40569
G1 F9923.643
M204 S6000
G1 X123.071 Y120.148 E.01072
G1 X123.071 Y120.629 E.0142
G1 X123.552 Y120.629 E.0142
G1 X123.426 Y120.353 E.00895
M204 S10000
G1 X123.717 Y119.983 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X123.422 Y119.923 E.00926
G1 X122.893 Y119.641 E.01841
G1 X122.701 Y119.409 E.00925
G1 X122.701 Y120.999 E.04885
G1 X124.291 Y120.999 E.04885
G1 X124.059 Y120.807 E.00925
G1 X123.777 Y120.278 E.01841
G1 X123.729 Y120.042 E.00741
M204 S10000
G1 X124.073 Y119.627 F42000
; LINE_WIDTH: 0.395897
G1 F10198.976
M204 S6000
G1 X123.693 Y119.604 E.01093
G1 X123.537 Y119.564 E.00463
G1 X123.126 Y119.345 E.0134
G1 X122.77 Y118.913 E.01611
G1 X122.656 Y118.533 E.01139
G1 X122.642 Y118.308 E.0065
G1 X122.642 Y113.092 E.15001
G1 X122.77 Y112.487 E.01779
G1 X123.126 Y112.055 E.01611
G1 X123.537 Y111.836 E.0134
G1 X123.942 Y111.773 E.01179
G1 X124.073 Y111.773 E.00375
G1 X124.096 Y111.393 E.01093
G1 X124.136 Y111.238 E.00463
G1 X124.355 Y110.826 E.0134
G1 X124.787 Y110.47 E.01611
G1 X125.167 Y110.356 E.01139
G1 X125.392 Y110.342 E.0065
G1 X130.608 Y110.342 E.15001
G1 X131.213 Y110.47 E.01779
G1 X131.645 Y110.826 E.01611
G1 X131.864 Y111.238 E.0134
G1 X131.927 Y111.642 E.01179
G1 X131.927 Y111.773 E.00375
G1 X132.307 Y111.796 E.01093
G1 X132.462 Y111.836 E.00463
G1 X132.874 Y112.055 E.0134
G1 X133.23 Y112.487 E.01611
G1 X133.358 Y113.092 E.01779
G1 X133.358 Y118.308 E.15001
G1 X133.344 Y118.533 E.0065
G1 X133.23 Y118.913 E.01139
G1 X132.874 Y119.345 E.01611
G1 X132.462 Y119.564 E.0134
G1 X132.058 Y119.627 E.01179
G1 X131.927 Y119.627 E.00375
G1 X131.904 Y120.007 E.01093
G1 X131.864 Y120.163 E.00463
G1 X131.645 Y120.574 E.0134
G1 X131.213 Y120.93 E.01611
G1 X130.833 Y121.044 E.01139
G1 X130.608 Y121.058 E.0065
G1 X125.392 Y121.058 E.15001
G1 X124.787 Y120.93 E.01779
G1 X124.355 Y120.574 E.01611
G1 X124.136 Y120.163 E.0134
G1 X124.073 Y119.687 E.01379
M204 S10000
G1 X124.45 Y119.25 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X123.942 Y119.25 E.01559
G1 X123.653 Y119.205 E.009
M73 P68 R4
G1 X123.359 Y119.048 E.01023
G1 X123.105 Y118.74 E.01229
G1 X123 Y118.308 E.01367
G1 X123 Y113.092 E.16025
G1 X123.105 Y112.66 E.01367
G1 X123.359 Y112.352 E.01229
G1 X123.765 Y112.167 E.01368
G1 X124.45 Y112.15 E.02106
G1 X124.45 Y111.642 E.01559
G1 X124.495 Y111.353 E.009
G1 X124.652 Y111.059 E.01023
G1 X124.96 Y110.805 E.01229
G1 X125.392 Y110.7 E.01367
G1 X130.608 Y110.7 E.16025
G1 X131.04 Y110.805 E.01367
G1 X131.348 Y111.059 E.01229
G1 X131.533 Y111.465 E.01368
G1 X131.55 Y112.15 E.02106
G1 X132.058 Y112.15 E.01559
G1 X132.347 Y112.195 E.009
G1 X132.641 Y112.352 E.01023
G1 X132.895 Y112.66 E.01229
G1 X133 Y113.092 E.01367
G1 X133 Y118.308 E.16025
G1 X132.895 Y118.74 E.01367
G1 X132.641 Y119.048 E.01229
G1 X132.235 Y119.233 E.01368
G1 X131.55 Y119.25 E.02106
G1 X131.55 Y119.758 E.01559
G1 X131.505 Y120.047 E.009
G1 X131.348 Y120.341 E.01023
G1 X131.04 Y120.595 E.01229
G1 X130.608 Y120.7 E.01367
G1 X125.392 Y120.7 E.16025
G1 X124.96 Y120.595 E.01367
G1 X124.652 Y120.341 E.01229
G1 X124.467 Y119.935 E.01368
G1 X124.451 Y119.31 E.01922
M204 S10000
G1 X124.827 Y118.873 F42000
G1 F9547.299
M204 S6000
G1 X123.942 Y118.873 E.02717
G3 X123.44 Y118.567 I.036 J-.624 E.01883
G1 X123.377 Y118.308 E.0082
G1 X123.377 Y113.092 E.16025
G1 X123.44 Y112.833 E.0082
G1 X123.593 Y112.648 E.00738
G1 X123.836 Y112.537 E.00821
G1 X124.827 Y112.527 E.03046
G1 X124.827 Y111.642 E.02717
G3 X125.133 Y111.14 I.624 J.036 E.01883
G1 X125.392 Y111.077 E.0082
G1 X130.608 Y111.077 E.16025
G1 X130.867 Y111.14 E.0082
G1 X131.052 Y111.293 E.00738
G1 X131.163 Y111.536 E.00821
G1 X131.173 Y112.527 E.03046
G1 X132.058 Y112.527 E.02717
G3 X132.56 Y112.833 I-.036 J.624 E.01883
G1 X132.623 Y113.092 E.0082
G1 X132.623 Y118.308 E.16025
G1 X132.56 Y118.567 E.0082
G1 X132.407 Y118.752 E.00738
G1 X132.164 Y118.863 E.00821
G1 X131.173 Y118.873 E.03046
G1 X131.173 Y119.758 E.02717
G3 X130.867 Y120.26 I-.624 J-.036 E.01883
G1 X130.608 Y120.323 E.0082
G1 X125.392 Y120.323 E.16025
G1 X125.133 Y120.26 E.0082
G1 X124.948 Y120.107 E.00738
G1 X124.837 Y119.864 E.00821
G1 X124.827 Y118.933 E.02861
M204 S10000
G1 X125.204 Y118.496 F42000
G1 F9547.299
M204 S6000
G1 X123.942 Y118.496 E.03876
G1 X123.826 Y118.456 E.00379
G1 X123.754 Y118.308 E.00506
G1 X123.754 Y113.092 E.16025
G1 X123.826 Y112.944 E.00506
G1 X123.942 Y112.904 E.00379
G1 X125.204 Y112.904 E.03876
G1 X125.204 Y111.642 E.03876
G1 X125.244 Y111.526 E.00379
G1 X125.392 Y111.454 E.00506
G1 X130.608 Y111.454 E.16025
G1 X130.756 Y111.526 E.00506
G1 X130.796 Y111.642 E.00379
G1 X130.796 Y112.904 E.03876
G1 X132.058 Y112.904 E.03876
G1 X132.174 Y112.944 E.00379
G1 X132.246 Y113.092 E.00506
G1 X132.246 Y118.308 E.16025
G1 X132.174 Y118.456 E.00506
G1 X132.058 Y118.496 E.00379
G1 X130.796 Y118.496 E.03876
G1 X130.796 Y119.758 E.03876
G1 X130.756 Y119.874 E.00379
G1 X130.608 Y119.946 E.00506
G1 X125.392 Y119.946 E.16025
G1 X125.244 Y119.874 E.00506
G1 X125.204 Y119.758 E.00379
G1 X125.204 Y118.556 E.03692
; WIPE_START
G1 X125.204 Y119.758 E-.45656
G1 X125.244 Y119.874 E-.04689
G1 X125.392 Y119.946 E-.06259
G1 X125.903 Y119.946 E-.19397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.008 Y112.553 Z2 F42000
G1 X123.717 Y111.417 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9547.299
M204 S6000
G1 X123.777 Y111.122 E.00926
G1 X124.059 Y110.593 E.01841
G1 X124.291 Y110.401 E.00925
G1 X122.701 Y110.401 E.04885
G1 X122.701 Y111.991 E.04885
G1 X122.893 Y111.759 E.00925
G1 X123.422 Y111.477 E.01841
G1 X123.658 Y111.429 E.00742
M204 S10000
G1 X123.401 Y111.101 F42000
; LINE_WIDTH: 0.40569
G1 F9923.643
M204 S6000
G1 X123.552 Y110.771 E.01072
G1 X123.071 Y110.771 E.0142
G1 X123.071 Y111.252 E.0142
G1 X123.347 Y111.126 E.00895
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9923.643
G1 X123.071 Y111.252 E-.14149
G1 X123.071 Y110.771 E-.22449
G1 X123.552 Y110.771 E-.22449
G1 X123.401 Y111.101 E-.16953
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 9/36
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S193.8
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-1.143 J.418 P1  F42000
G1 X137.036 Y148.362 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01064
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.023 J-1.607 E.08221
G1 X117.698 Y129.382 E.5784
G3 X118.05 Y128.401 I1.79 J.089 E.03508
G3 X119.282 Y127.798 I1.299 J1.095 E.04683
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.023 J1.607 E.08221
G1 X138.302 Y146.818 E.5784
G3 X137.095 Y148.349 I-1.618 J-.034 E.06941
M204 S250
G1 X136.988 Y147.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00873
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.222 J.019 E.05786
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.011 J1.215 E.05795
G1 X137.91 Y146.806 E.53504
G3 X137.044 Y147.957 I-1.222 J-.019 E.04732
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12981
G1 X135.048 Y148.01 E-.63019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.422 Y148.335 Z2.2 F42000
G1 X117.818 Y148.744 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.805 J-.012 E.0427
G1 X137.926 Y127.405 E.65706
G3 X138.698 Y128.218 I-.04 J.811 E.04106
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.815 J.001 E.04255
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.678 Y149.112 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X117.425 Y148.977 E.00879
G3 X116.91 Y147.994 I.681 J-.984 E.03549
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.209 J.012 E.05759
G1 X137.95 Y127.013 E.60973
G3 X139.09 Y128.206 I-.07 J1.208 E.0558
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.212 J-.016 E.05754
G1 X118.106 Y149.19 E.60801
G3 X117.734 Y149.13 I0 J-1.196 E.01165
; WIPE_START
M204 S6000
G1 X117.425 Y148.977 E-.13079
G1 X117.311 Y148.89 E-.05455
G1 X117.121 Y148.676 E-.10901
G1 X116.988 Y148.422 E-.10895
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.492 E-.1907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 9 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer9 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.47228
G1 F8384.57
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514968
G1 F7626.341
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474323
G1 F8344.875
G2 X118.529 Y148.594 I1.916 J-3.428 E.02202
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.390638
G1 F10353.217
M204 S6000
G3 X117.545 Y148.208 I5.863 J-19.772 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390647
G1 F10352.967
M204 S6000
G3 X117.506 Y147.382 I19.721 J-7.148 E.03501
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390678
G1 F10352.033
M204 S6000
G3 X118.719 Y127.606 I6.998 J19.267 E.03504
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474304
G1 F8345.235
M204 S6000
G2 X117.96 Y127.866 I1.344 J3.685 E.02202
; LINE_WIDTH: 0.514988
G1 F7626.027
G1 X117.934 Y127.883 E.00119
G2 X117.739 Y128.111 I.353 J.5 E.01165
; LINE_WIDTH: 0.472298
G1 F8384.235
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390625
G1 F10353.621
M204 S6000
G3 X117.892 Y127.645 I19.732 J5.852 E.03502
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390663
G1 F10352.499
M204 S6000
G3 X138.494 Y128.818 I-19.643 J7.127 E.03501
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474313
G1 F8345.062
M204 S6000
G2 X138.234 Y128.06 I-3.674 J1.34 E.02202
; LINE_WIDTH: 0.514963
M73 P69 R4
G1 F7626.431
G1 X138.217 Y128.034 E.0012
G2 X137.989 Y127.839 I-.501 J.353 E.01166
; LINE_WIDTH: 0.450473
G1 F8833.211
G2 X137.384 Y127.606 I-2.226 J4.891 E.02152
M204 S10000
G1 X137.281 Y127.606 F42000
; LINE_WIDTH: 0.378126
G1 F10739.68
M204 S6000
G1 X138.446 Y127.971 E.03333
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390678
G1 F10352.033
M204 S6000
G3 X137.281 Y148.594 I-7 J-19.276 E.03504
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472299
G1 F8384.203
M204 S6000
G1 X137.989 Y148.361 E.01986
; LINE_WIDTH: 0.514976
G1 F7626.217
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.474301
G1 F8345.304
G2 X138.494 Y147.571 I-3.421 J-1.912 E.02203
M204 S10000
G1 X138.494 Y147.381 F42000
; LINE_WIDTH: 0.390602
G1 F10354.302
M204 S6000
G3 X138.108 Y148.555 I-19.781 J-5.866 E.03502
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.381 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X135.977 Y140.176 Z2.2 F42000
G1 X127.115 Y114.815 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.041 Y119.439 Z2.2 F42000
G1 X120.201 Y123.17 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3420
M204 S5000
G1 X119.995 Y122.766 E.01395
G1 F3540
G1 X119.921 Y122.297 E.01458
G1 F3600
G1 X119.921 Y109.103 E.40541
G1 F3540
G1 X119.995 Y108.634 E.01458
G1 F3420
G1 X120.203 Y108.227 E.01407
G1 F3360
G1 X120.527 Y107.903 E.01407
G1 F3420
G1 X120.934 Y107.695 E.01406
G1 F3540
G1 X121.403 Y107.621 E.01458
G1 F3600
G1 X134.597 Y107.621 E.40541
G1 F3540
G1 X134.865 Y107.663 E.00833
G1 X135.066 Y107.695 E.00625
G1 F3420
G1 X135.473 Y107.903 E.01407
G1 F3360
G1 X135.797 Y108.227 E.01406
G1 F3420
G1 X136.005 Y108.634 E.01407
G1 F3540
G1 X136.079 Y109.103 E.01458
G1 F3600
G1 X136.079 Y122.297 E.40541
G1 F3540
G1 X136.005 Y122.766 E.01458
G1 F3420
G1 X135.797 Y123.174 E.01407
G1 F3360
G1 X135.473 Y123.497 E.01407
G1 F3420
G1 X135.066 Y123.705 E.01406
G1 F3540
G1 X134.597 Y123.779 E.01458
G1 F3600
G1 X121.403 Y123.779 E.40541
G1 F3540
G1 X120.934 Y123.705 E.01458
G1 F3420
G1 X120.527 Y123.497 E.01407
G1 F3360
G1 X120.243 Y123.213 E.01233
; WIPE_START
M204 S6000
G1 X119.995 Y122.766 E-.19443
G1 X119.921 Y122.297 E-.18033
G1 X119.921 Y121.283 E-.38525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.595 Y116.178 Z2.2 F42000
G1 X134.833 Y107.868 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X135.832 Y108.867 E.04342
G1 X135.872 Y109.441
G1 X134.259 Y107.828 E.07006
G1 X133.726 Y107.828
G1 X135.872 Y109.974 E.09324
G1 X135.872 Y110.507
G1 X133.193 Y107.828 E.11641
G1 X132.66 Y107.828
G1 X135.872 Y111.04 E.13958
G1 X135.872 Y111.574
G1 X132.126 Y107.828 E.16276
G1 X131.593 Y107.828
G1 X135.872 Y112.107 E.18593
G1 X135.872 Y112.64
G1 X131.06 Y107.828 E.2091
G1 X130.527 Y107.828
G1 X135.872 Y113.173 E.23227
G1 X135.872 Y113.707
G1 X129.993 Y107.828 E.25545
G1 X129.46 Y107.828
G1 X135.872 Y114.24 E.27862
G1 X135.872 Y114.773
G1 X128.927 Y107.828 E.30179
G1 X128.394 Y107.828
G1 X135.872 Y115.306 E.32496
G1 X135.872 Y115.84
G1 X127.86 Y107.828 E.34814
G1 X127.327 Y107.828
G1 X135.872 Y116.373 E.37131
G1 X135.872 Y116.906
G1 X126.794 Y107.828 E.39448
G1 X126.261 Y107.828
G1 X135.872 Y117.439 E.41765
G1 X135.872 Y117.973
G1 X125.727 Y107.828 E.44083
G1 X125.194 Y107.828
G1 X135.872 Y118.506 E.464
G1 X135.872 Y119.039
G1 X124.661 Y107.828 E.48717
G1 X124.128 Y107.828
G1 X135.872 Y119.572 E.51034
G1 X135.872 Y120.106
G1 X130.542 Y114.776 E.23159
G1 X130.542 Y115.31
G1 X135.872 Y120.639 E.23159
G1 X135.872 Y121.172
G1 X130.542 Y115.843 E.23159
G1 X130.542 Y116.376
G1 X135.872 Y121.705 E.23159
G1 X135.872 Y122.239
G1 X130.425 Y116.792 E.23667
G1 X129.892 Y116.792
G1 X135.804 Y122.704 E.25688
G1 X135.622 Y123.055
G1 X129.395 Y116.829 E.27057
M73 P69 R3
G1 X129.13 Y117.096
G1 X135.355 Y123.322 E.27054
G1 X135.004 Y123.504
G1 X129.092 Y117.592 E.25688
G1 X129.092 Y118.126
G1 X134.539 Y123.572 E.23666
G1 X134.005 Y123.572
G1 X128.676 Y118.242 E.23159
G1 X128.143 Y118.242
G1 X133.472 Y123.572 E.23159
G1 X132.939 Y123.572
G1 X127.609 Y118.242 E.23159
G1 X127.076 Y118.242
G1 X132.406 Y123.572 E.23159
; WIPE_START
M204 S6000
G1 X130.991 Y122.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.374 Y114.608 Z2.2 F42000
G1 Z1.8
M73 P70 R3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X129.092 Y113.326 E.05568
G1 X129.092 Y113.86
G1 X129.84 Y114.608 E.03251
M204 S10000
G1 X128.924 Y113.158 F42000
G1 F3000
M204 S2000
G1 X123.594 Y107.828 E.23159
G1 X123.061 Y107.828
G1 X128.39 Y113.158 E.23159
G1 X127.857 Y113.158
G1 X122.528 Y107.828 E.23159
G1 X121.995 Y107.828
G1 X127.324 Y113.158 E.23159
G1 X126.908 Y113.275
G1 X121.461 Y107.828 E.23667
G1 X120.996 Y107.896
G1 X126.908 Y113.808 E.25688
G1 X126.871 Y114.304
G1 X120.645 Y108.078 E.27055
G1 X120.378 Y108.345
G1 X126.602 Y114.569 E.27047
G1 X126.108 Y114.608
G1 X120.196 Y108.696 E.25688
G1 X120.128 Y109.161
G1 X125.574 Y114.608 E.23666
G1 X125.458 Y115.024
G1 X120.128 Y109.695 E.23159
G1 X120.128 Y110.228
G1 X125.458 Y115.557 E.23159
G1 X125.458 Y116.091
G1 X120.128 Y110.761 E.23159
G1 X120.128 Y111.294
G1 X125.458 Y116.624 E.23159
G1 X126.159 Y116.792
G1 X126.908 Y117.541 E.03251
G1 X126.908 Y118.074
G1 X125.626 Y116.792 E.05568
; WIPE_START
M204 S6000
G1 X126.908 Y118.074 E-.68865
G1 X126.908 Y117.886 E-.07136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y112.8 Z2.2 F42000
G1 X120.128 Y111.828 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X131.872 Y123.572 E.51034
G1 X131.339 Y123.572
G1 X120.128 Y112.361 E.48717
G1 X120.128 Y112.894
G1 X130.806 Y123.572 E.46399
G1 X130.273 Y123.572
G1 X120.128 Y113.427 E.44082
G1 X120.128 Y113.961
G1 X129.739 Y123.572 E.41765
G1 X129.206 Y123.572
G1 X120.128 Y114.494 E.39448
G1 X120.128 Y115.027
G1 X128.673 Y123.572 E.3713
G1 X128.14 Y123.572
G1 X120.128 Y115.561 E.34813
G1 X120.128 Y116.094
G1 X127.606 Y123.572 E.32496
G1 X127.073 Y123.572
G1 X120.128 Y116.627 E.30179
G1 X120.128 Y117.16
G1 X126.54 Y123.572 E.27861
G1 X126.006 Y123.572
G1 X120.128 Y117.694 E.25544
G1 X120.128 Y118.227
G1 X125.473 Y123.572 E.23227
G1 X124.94 Y123.572
G1 X120.128 Y118.76 E.2091
G1 X120.128 Y119.293
G1 X124.407 Y123.572 E.18592
G1 X123.873 Y123.572
G1 X120.128 Y119.827 E.16275
G1 X120.128 Y120.36
G1 X123.34 Y123.572 E.13958
G1 X122.807 Y123.572
G1 X120.128 Y120.893 E.1164
G1 X120.128 Y121.426
G1 X122.274 Y123.572 E.09323
G1 X121.74 Y123.572
G1 X120.128 Y121.96 E.07006
G1 X120.168 Y122.533
G1 X121.167 Y123.532 E.04342
; WIPE_START
M204 S6000
M73 P71 R3
G1 X120.168 Y122.533 E-.53692
G1 X120.128 Y121.96 E-.21834
G1 X120.137 Y121.968 E-.00474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.879 Y116.94 Z2.2 F42000
G1 X135.647 Y108.388 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0937653
G1 F15000
M204 S6000
G1 X135.312 Y108.054 E.00196
; WIPE_START
G1 X135.647 Y108.388 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.249 Y113.785 Z2.2 F42000
G1 X120.688 Y123.346 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0936904
G1 F15000
M204 S6000
G1 X120.354 Y123.012 E.00196
; WIPE_START
G1 X120.688 Y123.346 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.113 Y117.978 Z2.2 F42000
G1 X129.5 Y114.626 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.156167
G1 F15000
M204 S6000
G1 X129.352 Y114.463 E.00204
G1 X129.074 Y114.202 E.00352
; WIPE_START
G1 X129.352 Y114.463 E-.4818
G1 X129.5 Y114.626 E-.2782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.926 Y117.203 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.155414
G1 F15000
M204 S6000
G1 X126.493 Y116.774 E.00559
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X126.926 Y117.203 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 10/36
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S201.45
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-1.158 J.376 P1  F42000
G1 X137.036 Y148.363 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01062
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.045 J-1.629 E.08192
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.629 J.045 E.08192
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.045 J1.629 E.08192
G1 X138.302 Y146.818 E.5784
G3 X137.094 Y148.35 I-1.617 J-.033 E.06945
M204 S250
G1 X136.988 Y147.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00871
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.231 J.028 E.05775
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.011 J1.215 E.05795
G1 X137.91 Y146.806 E.53504
G3 X137.044 Y147.957 I-1.221 J-.018 E.04734
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12974
G1 X135.048 Y148.01 E-.63026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.422 Y148.334 Z2.4 F42000
G1 X117.819 Y148.741 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.298 J-.758 E.03238
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.914 Y127.404 E.65665
G3 X138.698 Y128.218 I-.028 J.812 E.04148
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.815 J.001 E.04255
G1 X118.118 Y148.798 E.65559
G3 X117.875 Y148.761 I-.001 J-.815 E.00818
M204 S250
G1 X117.68 Y149.106 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X116.938 Y148.248 I.444 J-1.134 E.03627
G3 X116.91 Y147.994 I1.034 J-.243 E.00788
G1 X116.91 Y128.206 E.60801
G3 X117.852 Y127.038 I1.194 J-.001 E.04986
G3 X118.106 Y127.01 I.243 J1.034 E.00788
G1 X137.937 Y127.013 E.60935
G3 X139.062 Y127.952 I-.059 J1.213 E.04833
G3 X139.09 Y128.206 I-1.034 J.243 E.00788
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.212 J-.016 E.05754
G1 X118.106 Y149.19 E.60801
G3 X117.737 Y149.127 I.018 J-1.218 E.01157
; WIPE_START
M204 S6000
G1 X117.424 Y148.979 E-.13138
G1 X117.311 Y148.89 E-.05456
G1 X117.121 Y148.676 E-.10898
G1 X117.047 Y148.553 E-.05463
G1 X116.938 Y148.248 E-.12295
G1 X116.938 Y148.248 E0
G1 X116.91 Y147.994 E-.09723
G1 X116.91 Y147.493 E-.19025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 10 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P72 R3
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer10 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472269
G1 F8384.804
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514956
G1 F7626.539
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.0012
; LINE_WIDTH: 0.474288
G1 F8345.557
G2 X118.529 Y148.594 I1.911 J-3.42 E.02202
M204 S10000
G1 X118.719 Y148.594 F42000
; LINE_WIDTH: 0.39066
G1 F10352.582
M204 S6000
G3 X117.545 Y148.208 I5.83 J-19.671 E.03503
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390633
G1 F10353.386
M204 S6000
G3 X117.506 Y147.381 I19.232 J-6.987 E.03503
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390646
G1 F10352.981
M204 S6000
G3 X118.718 Y127.606 I7.079 J19.51 E.03502
M204 S10000
G1 X118.529 Y127.606 F42000
; LINE_WIDTH: 0.474293
G1 F8345.462
M204 S6000
G2 X117.96 Y127.866 I1.347 J3.69 E.02202
; LINE_WIDTH: 0.514963
G1 F7626.436
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.354 J.501 E.01166
; LINE_WIDTH: 0.472254
G1 F8385.096
G1 X117.506 Y128.629 E.01986
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390643
G1 F10353.071
M204 S6000
G3 X117.892 Y127.645 I19.869 J5.894 E.03502
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390615
G1 F10353.905
M204 S6000
G3 X138.494 Y128.819 I-19.267 J7.001 E.03503
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474286
G1 F8345.578
M204 S6000
G2 X138.234 Y128.06 I-3.682 J1.342 E.02203
; LINE_WIDTH: 0.514968
G1 F7626.344
G1 X138.217 Y128.034 E.00119
G2 X137.989 Y127.839 I-.501 J.354 E.01165
; LINE_WIDTH: 0.472283
G1 F8384.528
G1 X137.473 Y127.606 E.01981
M204 S10000
G1 X137.282 Y127.606 F42000
; LINE_WIDTH: 0.378871
G1 F10715.872
M204 S6000
G1 X138.446 Y127.97 E.03339
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390647
G1 F10352.973
M204 S6000
G3 X137.282 Y148.594 I-7.064 J-19.46 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472291
G1 F8384.363
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514985
G1 F7626.076
G2 X138.217 Y148.166 I-.273 J-.549 E.01165
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.474296
G1 F8345.4
G2 X138.494 Y147.571 I-3.434 J-1.919 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390598
G1 F10354.429
M204 S6000
G3 X138.107 Y148.555 I-19.719 J-5.851 E.03502
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.02 Y141.198 Z2.4 F42000
G1 X120.661 Y122.738 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X120.468 Y122.358 E.01308
G1 X120.404 Y121.955 E.01256
G1 X120.404 Y109.445 E.38437
G1 X120.468 Y109.042 E.01256
G1 X120.661 Y108.662 E.01308
G1 X120.962 Y108.361 E.01308
G1 X121.342 Y108.168 E.01308
G1 X121.745 Y108.104 E.01256
G1 X134.255 Y108.104 E.38437
G1 X134.658 Y108.168 E.01256
G1 X135.038 Y108.361 E.01308
G1 X135.339 Y108.662 E.01308
G1 X135.532 Y109.042 E.01308
G1 X135.596 Y109.445 E.01256
G1 X135.596 Y121.955 E.38437
G1 X135.532 Y122.358 E.01256
G1 X135.339 Y122.738 E.01308
G1 X135.038 Y123.039 E.01308
G1 X134.658 Y123.232 E.01308
G1 X134.255 Y123.296 E.01256
G1 X121.745 Y123.296 E.38437
G1 X121.342 Y123.232 E.01256
G1 X120.962 Y123.039 E.01308
G1 X120.704 Y122.78 E.01123
M204 S250
G1 X120.127 Y123.24 F42000
G1 F3420
M204 S5000
G1 X119.916 Y122.824 E.01434
G1 F3540
G1 X119.84 Y122.346 E.01489
G1 F3600
G1 X119.84 Y109.054 E.4084
G1 F3540
G1 X119.916 Y108.576 E.01489
G1 F3420
G1 X120.128 Y108.159 E.01438
G1 F3360
G1 X120.459 Y107.828 E.01438
G1 F3420
G1 X120.876 Y107.616 E.01438
G1 F3540
G1 X121.354 Y107.54 E.01489
G1 F3600
G1 X134.646 Y107.54 E.4084
G1 F3540
G1 X134.947 Y107.587 E.00937
G1 X135.124 Y107.616 E.00553
G1 F3420
G1 X135.541 Y107.828 E.01438
G1 F3360
G1 X135.872 Y108.159 E.01438
G1 F3420
G1 X136.084 Y108.576 E.01438
G1 F3540
G1 X136.16 Y109.054 E.01489
G1 F3600
G1 X136.16 Y122.346 E.4084
G1 F3540
G1 X136.084 Y122.824 E.01489
G1 F3420
G1 X135.872 Y123.241 E.01438
G1 F3360
G1 X135.541 Y123.572 E.01438
G1 F3420
G1 X135.124 Y123.784 E.01438
G1 F3540
G1 X134.646 Y123.86 E.01489
G1 F3600
G1 X121.354 Y123.86 E.4084
G1 F3540
G1 X120.876 Y123.784 E.01489
G1 F3420
G1 X120.459 Y123.572 E.01438
G1 F3360
G1 X120.169 Y123.283 E.01257
M204 S10000
G1 X120.442 Y123.024 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.371674
G1 F10950.445
M204 S6000
G1 X120.388 Y122.967 E.0021
; LINE_WIDTH: 0.349176
G1 F11754.887
G3 X120.215 Y122.593 I1.694 J-1.009 E.0103
; LINE_WIDTH: 0.295196
G1 F14270.088
G1 X120.176 Y122.473 E.00261
; LINE_WIDTH: 0.262991
G1 F15000
G3 X120.136 Y122.152 I1.79 J-.387 E.00579
; LINE_WIDTH: 0.229784
G1 X120.123 Y121.984 E.00258
; LINE_WIDTH: 0.215422
G1 X120.123 Y109.416 E.17665
; LINE_WIDTH: 0.229765
G1 X120.136 Y109.248 E.00258
; LINE_WIDTH: 0.256333
G1 X120.149 Y109.079 E.00294
; LINE_WIDTH: 0.281549
G3 X120.215 Y108.807 I1.021 J.104 E.00546
; LINE_WIDTH: 0.334941
G1 F12327.906
G1 X120.254 Y108.686 E.00302
; LINE_WIDTH: 0.371674
G1 F10950.445
G3 X120.733 Y108.088 I1.216 J.482 E.02082
; LINE_WIDTH: 0.349176
G1 F11754.887
G3 X121.107 Y107.915 I1.009 J1.694 E.0103
; LINE_WIDTH: 0.295196
G1 F14270.088
G1 X121.227 Y107.876 E.00261
; LINE_WIDTH: 0.262991
G1 F15000
G3 X121.548 Y107.836 I.387 J1.79 E.00579
; LINE_WIDTH: 0.229784
G1 X121.716 Y107.823 E.00258
; LINE_WIDTH: 0.215612
G1 X134.27 Y107.822 E.17666
G1 X134.452 Y107.836 E.00257
; LINE_WIDTH: 0.256339
G1 X134.621 Y107.849 E.00294
; LINE_WIDTH: 0.281734
G3 X134.895 Y107.916 I-.105 J1.025 E.00549
; LINE_WIDTH: 0.335162
G1 F12318.584
G1 X135.014 Y107.954 E.00299
; LINE_WIDTH: 0.371668
G1 F10950.638
G3 X135.612 Y108.433 I-.482 J1.216 E.02082
; LINE_WIDTH: 0.349171
G1 F11755.076
G3 X135.785 Y108.807 I-1.696 J1.01 E.0103
; LINE_WIDTH: 0.295197
G1 F14270.075
G1 X135.824 Y108.928 E.00261
; LINE_WIDTH: 0.26299
G1 F15000
G3 X135.864 Y109.248 I-1.79 J.387 E.00579
; LINE_WIDTH: 0.229784
G1 X135.877 Y109.416 E.00258
; LINE_WIDTH: 0.215612
G1 X135.878 Y121.97 E.17666
G1 X135.864 Y122.152 E.00257
; LINE_WIDTH: 0.256333
G1 X135.851 Y122.321 E.00294
; LINE_WIDTH: 0.281549
G3 X135.785 Y122.593 I-1.021 J-.104 E.00546
; LINE_WIDTH: 0.334941
G1 F12327.906
G1 X135.746 Y122.714 E.00302
; LINE_WIDTH: 0.371674
G1 F10950.445
G3 X135.267 Y123.312 I-1.216 J-.482 E.02082
; LINE_WIDTH: 0.349176
G1 F11754.887
G3 X134.893 Y123.485 I-1.009 J-1.694 E.0103
; LINE_WIDTH: 0.295196
G1 F14270.088
G1 X134.773 Y123.524 E.00261
; LINE_WIDTH: 0.262991
G1 F15000
G3 X134.452 Y123.564 I-.387 J-1.79 E.00579
; LINE_WIDTH: 0.229784
G1 X134.284 Y123.577 E.00258
; LINE_WIDTH: 0.215612
G1 X121.73 Y123.578 E.17666
G1 X121.548 Y123.564 E.00257
; LINE_WIDTH: 0.256333
G1 X121.379 Y123.551 E.00294
; LINE_WIDTH: 0.281549
G3 X121.107 Y123.485 I.104 J-1.021 E.00546
; LINE_WIDTH: 0.334941
G1 F12327.906
G1 X120.986 Y123.446 E.00302
; LINE_WIDTH: 0.371674
G1 F10950.445
G3 X120.677 Y123.271 I.482 J-1.216 E.00952
G1 X120.483 Y123.068 E.00754
; WIPE_START
G1 X120.388 Y122.967 E-.05253
G1 X120.254 Y122.714 E-.10875
G1 X120.215 Y122.593 E-.04828
G1 X120.176 Y122.473 E-.04827
M73 P73 R3
G1 X120.136 Y122.152 E-.12259
G1 X120.123 Y121.984 E-.06433
G1 X120.123 Y121.154 E-.31525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.466 Y115.704 Z2.4 F42000
G1 X126.723 Y114.423 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.946 J2.345 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.677 J1.932 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 X129.277 Y113.792 E-.24096
G1 X129.494 Y113.956 E-.10349
G1 X129.697 Y114.153 E-.10746
G1 X129.915 Y114.423 E-.13182
G1 X129.451 Y114.423 E-.17628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.671 J-1.52 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13183
G1 X129.494 Y117.444 E-.10743
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.445 Y116.513 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.93 Y113.012 I2.561 J-.814 E.1528
G1 X128.248 Y113.022 E.00979
G3 X125.464 Y116.57 I-.242 J2.677 E.35449
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.355 Y116.182 E-.15332
G1 X125.315 Y115.866 E-.12107
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12585
G1 X125.54 Y114.619 E-.1081
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 11/36
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-1.152 J.392 P1  F42000
G1 X137.035 Y148.363 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01059
G1 X119.282 Y148.402 E.5784
G3 X117.698 Y146.818 I.045 J-1.629 E.08192
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.607 J.023 E.08221
G1 X136.718 Y127.798 E.5784
G3 X138.302 Y129.382 I-.045 J1.629 E.08192
G1 X138.302 Y146.818 E.5784
G3 X137.094 Y148.352 I-1.607 J-.023 E.0696
M204 S250
G1 X136.987 Y147.976 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00869
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.028 J-1.231 E.05775
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.028 J1.231 E.05775
G1 X137.91 Y146.806 E.53504
G3 X137.044 Y147.959 I-1.215 J-.011 E.04741
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12992
G1 X135.048 Y148.01 E-.63009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.423 Y148.335 Z2.6 F42000
G1 X117.818 Y148.744 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.919 Y127.404 E.65684
G3 X138.698 Y128.218 I-.022 J.801 E.04144
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.679 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X116.91 Y147.994 I.428 J-1.117 E.04431
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X137.931 Y127.012 E.60916
G3 X139.09 Y128.206 I-.051 J1.209 E.05638
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.196 J0 E.05775
G1 X118.106 Y149.19 E.60801
G3 X117.735 Y149.131 I0 J-1.196 E.0116
; WIPE_START
M204 S6000
G1 X117.424 Y148.979 E-.1315
G1 X117.311 Y148.89 E-.05458
G1 X117.121 Y148.676 E-.10896
G1 X116.988 Y148.422 E-.10899
G1 X116.919 Y148.143 E-.109
G1 X116.91 Y147.994 E-.057
G1 X116.91 Y147.494 E-.18998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 11 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer11 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472301
G1 F8384.173
M204 S6000
G1 X117.739 Y148.089 E.01987
; LINE_WIDTH: 0.514977
G1 F7626.199
G2 X117.934 Y148.317 I.549 J-.273 E.01165
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474285
G1 F8345.601
G2 X118.529 Y148.594 I1.913 J-3.424 E.02202
M204 S10000
G1 X118.718 Y148.594 F42000
; LINE_WIDTH: 0.390655
G1 F10352.711
M204 S6000
G3 X117.545 Y148.208 I5.944 J-20.009 E.03501
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.3907
G1 F10351.395
M204 S6000
G3 X117.506 Y147.382 I19.436 J-7.056 E.03503
M204 S10000
G1 X117.545 Y127.992 F42000
; LINE_WIDTH: 0.390694
G1 F10351.563
M204 S6000
G3 X118.719 Y127.606 I7.017 J19.33 E.03503
M204 S10000
G1 X118.528 Y127.606 F42000
; LINE_WIDTH: 0.474306
G1 F8345.198
M204 S6000
G2 X117.96 Y127.866 I1.338 J3.67 E.02201
; LINE_WIDTH: 0.514968
G1 F7626.349
G1 X117.934 Y127.883 E.0012
G2 X117.739 Y128.111 I.354 J.501 E.01165
; LINE_WIDTH: 0.472296
G1 F8384.261
G1 X117.506 Y128.629 E.01987
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390671
G1 F10352.232
M204 S6000
G3 X117.892 Y127.645 I19.768 J5.863 E.03503
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.39066
G1 F10352.56
M204 S6000
G3 X138.494 Y128.818 I-19.565 J7.097 E.03502
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474305
G1 F8345.221
M204 S6000
G2 X138.234 Y128.06 I-3.673 J1.339 E.02202
; LINE_WIDTH: 0.514961
G1 F7626.465
G1 X138.217 Y128.034 E.0012
G2 X137.989 Y127.839 I-.501 J.354 E.01165
; LINE_WIDTH: 0.450341
G1 F8836.066
G2 X137.388 Y127.608 I-2.202 J4.835 E.02138
M204 S10000
M73 P74 R3
G1 X137.285 Y127.608 F42000
; LINE_WIDTH: 0.377885
G1 F10747.411
M204 S6000
G1 X138.445 Y127.97 E.03319
M204 S10000
G1 X138.455 Y148.208 F42000
; LINE_WIDTH: 0.390706
G1 F10351.207
M204 S6000
G3 X137.282 Y148.594 I-7.096 J-19.55 E.03502
M204 S10000
G1 X137.471 Y148.594 F42000
; LINE_WIDTH: 0.472273
G1 F8384.707
M204 S6000
G1 X137.989 Y148.361 E.01987
; LINE_WIDTH: 0.514965
G1 F7626.402
G2 X138.217 Y148.166 I-.273 J-.549 E.01166
G1 X138.234 Y148.14 E.0012
; LINE_WIDTH: 0.474272
G1 F8345.858
G2 X138.494 Y147.571 I-3.433 J-1.917 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.390703
G1 F10351.301
M204 S6000
G3 X138.108 Y148.555 I-19.902 J-5.908 E.03502
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X134 Y141.213 Z2.6 F42000
G1 X120.584 Y122.803 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X120.385 Y122.411 E.0135
G1 X120.319 Y121.993 E.01302
G1 X120.319 Y109.407 E.38671
G1 X120.385 Y108.989 E.01302
G1 X120.585 Y108.596 E.01353
G1 X120.896 Y108.285 E.01353
G1 X121.289 Y108.085 E.01353
G1 X121.707 Y108.019 E.01302
G1 X134.293 Y108.019 E.38671
G1 X134.711 Y108.085 E.01302
G1 X135.104 Y108.285 E.01353
G1 X135.415 Y108.596 E.01354
G1 X135.615 Y108.989 E.01353
G1 X135.681 Y109.407 E.01302
G1 X135.681 Y121.993 E.38671
G1 X135.615 Y122.411 E.01302
G1 X135.415 Y122.804 E.01353
G1 X135.104 Y123.115 E.01354
G1 X134.711 Y123.315 E.01353
G1 X134.293 Y123.381 E.01302
G1 X121.707 Y123.381 E.38671
G1 X121.289 Y123.315 E.01302
G1 X120.896 Y123.115 E.01353
G1 X120.627 Y122.845 E.01172
M204 S250
G1 X120.053 Y123.309 F42000
G1 F3360
M204 S5000
G1 X120.053 Y123.309 E.00001
G1 F3420
G1 X119.836 Y122.883 E.01469
G1 F3540
G1 X119.759 Y122.394 E.01521
G1 F3600
G1 X119.759 Y109.006 E.41139
G1 F3540
G1 X119.836 Y108.517 E.01521
G1 F3420
G1 X120.053 Y108.091 E.01469
G1 F3360
G1 X120.391 Y107.753 E.01469
G1 F3420
G1 X120.817 Y107.536 E.01469
G1 F3540
G1 X121.306 Y107.459 E.01521
G1 F3600
G1 X134.694 Y107.459 E.41139
G1 F3540
G1 X135.029 Y107.512 E.01041
G1 X135.183 Y107.536 E.0048
G1 F3420
G1 X135.609 Y107.753 E.01469
G1 F3360
G1 X135.947 Y108.091 E.01469
G1 F3420
G1 X136.164 Y108.517 E.01469
G1 F3540
G1 X136.241 Y109.006 E.0152
G1 F3600
G1 X136.241 Y122.394 E.41139
G1 F3540
G1 X136.164 Y122.883 E.01521
G1 F3420
G1 X135.947 Y123.309 E.01469
G1 F3360
G1 X135.609 Y123.647 E.01469
G1 F3420
G1 X135.183 Y123.864 E.01469
G1 F3540
G1 X134.694 Y123.941 E.01521
G1 F3600
G1 X121.306 Y123.941 E.41139
G1 F3540
G1 X120.817 Y123.864 E.01521
G1 F3420
G1 X120.391 Y123.647 E.01469
G1 F3360
G1 X120.096 Y123.352 E.01283
M204 S10000
G1 X120.368 Y123.093 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.371266
G1 F10964.051
M204 S6000
G1 X120.312 Y123.033 E.0022
; LINE_WIDTH: 0.348182
G1 F11793.147
G3 X120.134 Y122.649 I1.755 J-1.042 E.01055
; LINE_WIDTH: 0.292741
G1 F14410.365
G1 X120.094 Y122.525 E.00266
; LINE_WIDTH: 0.259779
G1 F15000
G3 X120.053 Y122.196 I1.857 J-.399 E.00587
; LINE_WIDTH: 0.22554
G1 X120.039 Y122.021 E.0026
; LINE_WIDTH: 0.210781
G1 X120.039 Y109.379 E.17293
; LINE_WIDTH: 0.225544
G1 X120.053 Y109.204 E.0026
; LINE_WIDTH: 0.252991
G1 X120.067 Y109.03 E.00299
; LINE_WIDTH: 0.278871
G3 X120.134 Y108.751 I1.04 J.105 E.00553
; LINE_WIDTH: 0.333588
G1 F12385.265
G1 X120.175 Y108.627 E.00309
; LINE_WIDTH: 0.371273
G1 F10963.812
G3 X120.667 Y108.012 I1.265 J.507 E.02139
; LINE_WIDTH: 0.348197
G1 F11792.583
G3 X121.051 Y107.834 I1.043 J1.756 E.01055
; LINE_WIDTH: 0.292752
G1 F14409.687
G1 X121.175 Y107.794 E.00266
; LINE_WIDTH: 0.259779
G1 F15000
G3 X121.504 Y107.753 I.399 J1.858 E.00587
; LINE_WIDTH: 0.22554
G1 X121.679 Y107.739 E.0026
; LINE_WIDTH: 0.210983
G1 X134.308 Y107.739 E.17296
G1 X134.496 Y107.753 E.00258
; LINE_WIDTH: 0.252991
G1 X134.67 Y107.767 E.00299
; LINE_WIDTH: 0.267344
G3 X134.825 Y107.794 I-.095 J.989 E.00288
; LINE_WIDTH: 0.297262
G1 F14154.196
G1 X134.976 Y107.843 E.0033
; LINE_WIDTH: 0.338095
G1 F12196.188
G1 X135.073 Y107.875 E.00245
; LINE_WIDTH: 0.371268
G1 F10963.998
G3 X135.688 Y108.367 I-.507 J1.265 E.02139
; LINE_WIDTH: 0.348183
G1 F11793.116
G3 X135.866 Y108.751 I-1.756 J1.043 E.01055
; LINE_WIDTH: 0.29274
G1 F14410.408
G1 X135.906 Y108.875 E.00266
; LINE_WIDTH: 0.259779
G1 F15000
G3 X135.947 Y109.204 I-1.857 J.399 E.00587
; LINE_WIDTH: 0.22554
G1 X135.961 Y109.379 E.0026
; LINE_WIDTH: 0.210983
G1 X135.961 Y122.008 E.17296
G1 X135.947 Y122.196 E.00258
; LINE_WIDTH: 0.252991
G1 X135.933 Y122.37 E.00299
; LINE_WIDTH: 0.278871
G3 X135.866 Y122.649 I-1.04 J-.105 E.00553
; LINE_WIDTH: 0.333588
G1 F12385.265
G1 X135.825 Y122.773 E.00309
; LINE_WIDTH: 0.371266
G1 F10964.051
G3 X135.333 Y123.388 I-1.265 J-.507 E.02139
; LINE_WIDTH: 0.348182
G1 F11793.147
G3 X134.949 Y123.566 I-1.042 J-1.755 E.01055
; LINE_WIDTH: 0.292741
G1 F14410.365
G1 X134.825 Y123.606 E.00266
; LINE_WIDTH: 0.259779
G1 F15000
G3 X134.496 Y123.647 I-.399 J-1.857 E.00587
; LINE_WIDTH: 0.22554
G1 X134.321 Y123.661 E.0026
; LINE_WIDTH: 0.210983
G1 X121.692 Y123.661 E.17296
G1 X121.504 Y123.647 E.00258
; LINE_WIDTH: 0.252991
G1 X121.33 Y123.633 E.00299
; LINE_WIDTH: 0.278871
G3 X121.051 Y123.566 I.105 J-1.04 E.00553
; LINE_WIDTH: 0.333588
G1 F12385.265
G1 X120.927 Y123.525 E.00309
; LINE_WIDTH: 0.371266
G1 F10964.051
G3 X120.61 Y123.346 I.507 J-1.265 E.00978
G1 X120.41 Y123.136 E.00776
; WIPE_START
G1 X120.312 Y123.033 E-.05409
G1 X120.175 Y122.773 E-.11171
G1 X120.134 Y122.649 E-.04961
G1 X120.094 Y122.525 E-.04961
G1 X120.053 Y122.196 E-.126
G1 X120.039 Y122.021 E-.06644
G1 X120.039 Y121.225 E-.30255
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.388 Y115.781 Z2.6 F42000
G1 X126.723 Y114.423 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.943 J2.342 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 X129.277 Y113.792 E-.24092
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13185
G1 X129.451 Y114.423 E-.17635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.667 J-1.516 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.247 E-.13184
G1 X129.494 Y117.444 E-.1074
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.992 E.02878
M204 S250
G1 X125.439 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.721 Y114.273 I2.559 J-.817 E.07163
G3 X127.93 Y113.012 I2.301 J1.465 E.08132
G3 X125.458 Y116.571 I.068 J2.686 E.36375
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14851
G1 X125.315 Y115.866 E-.12584
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12581
G1 X125.54 Y114.619 E-.10817
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 12/36
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-1.151 J.394 P1  F42000
G1 X137.095 Y148.351 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.061 Y148.36 E.00117
G3 X136.718 Y148.402 I-.369 J-1.567 E.01149
G1 X119.282 Y148.402 E.57839
G3 X117.698 Y146.818 I.023 J-1.607 E.08221
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.609 J.026 E.08218
G1 X136.718 Y127.798 E.57839
G3 X138.302 Y129.382 I-.023 J1.607 E.08221
G1 X138.302 Y146.818 E.5784
G3 X137.263 Y148.298 I-1.609 J-.026 E.06368
G1 X137.152 Y148.333 E.00385
M204 S250
G1 X136.984 Y147.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.97 Y147.978 E.00045
G3 X136.706 Y148.01 I-.277 J-1.185 E.00819
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.217 J.013 E.05792
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.011 J1.215 E.05795
G1 X137.91 Y146.806 E.53504
G3 X137.127 Y147.93 I-1.217 J-.013 E.0447
G1 X137.042 Y147.957 E.00274
; WIPE_START
M204 S6000
G1 X136.97 Y147.978 E-.02832
G1 X136.706 Y148.01 E-.10102
G1 X135.047 Y148.01 E-.63066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.421 Y148.335 Z2.8 F42000
G1 X117.818 Y148.744 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.907 Y127.404 E.65642
G3 X138.698 Y128.218 I-.011 J.802 E.04186
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.118 Y148.798 E.65559
G3 X117.874 Y148.764 I-.012 J-.804 E.0082
M204 S250
G1 X117.679 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X116.91 Y147.994 I.428 J-1.117 E.04431
G1 X116.91 Y128.206 E.60801
G3 X116.943 Y127.927 I1.166 J-.005 E.00865
G3 X118.106 Y127.01 I1.164 J.279 E.0491
G1 X137.919 Y127.012 E.60877
G3 X139.09 Y128.206 I-.039 J1.21 E.05676
G1 X139.09 Y147.994 E.60801
G3 X139.057 Y148.273 I-1.166 J.005 E.00865
G3 X137.894 Y149.19 I-1.183 J-.304 E.04892
G1 X118.106 Y149.19 E.60801
G3 X117.735 Y149.131 I0 J-1.196 E.0116
; WIPE_START
M204 S6000
G1 X117.547 Y149.053 E-.07729
M73 P75 R3
G1 X117.311 Y148.89 E-.10898
G1 X117.121 Y148.676 E-.10898
G1 X116.988 Y148.422 E-.10898
G1 X116.919 Y148.143 E-.109
G1 X116.91 Y147.994 E-.057
G1 X116.91 Y147.494 E-.18978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 12 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer12 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.572 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472287
G1 F8384.445
M204 S6000
G1 X117.739 Y148.089 E.01986
; LINE_WIDTH: 0.514977
G1 F7626.211
G2 X117.934 Y148.317 I.549 J-.273 E.01166
G1 X117.96 Y148.334 E.00119
; LINE_WIDTH: 0.474314
G1 F8345.054
G2 X118.528 Y148.594 I1.914 J-3.423 E.02201
M204 S10000
G1 X118.718 Y148.594 F42000
; LINE_WIDTH: 0.39069
G1 F10351.681
M204 S6000
G3 X117.545 Y148.208 I5.924 J-19.942 E.03501
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390696
G1 F10351.504
M204 S6000
G3 X117.506 Y147.382 I19.51 J-7.08 E.03502
M204 S10000
G1 X117.556 Y127.966 F42000
; LINE_WIDTH: 0.365803
G1 F11149.564
M204 S6000
G1 X118.728 Y127.606 E.03225
M204 S10000
G1 X118.54 Y127.606 F42000
; LINE_WIDTH: 0.476097
G1 F8310.7
M204 S6000
G2 X117.963 Y127.864 I1.404 J3.906 E.02234
G1 X117.934 Y127.883 E.00122
; LINE_WIDTH: 0.516548
G1 F7600.903
G1 X117.933 Y127.884 E.00004
G2 X117.739 Y128.111 I.39 J.53 E.01164
; LINE_WIDTH: 0.472282
G1 F8384.54
G1 X117.506 Y128.629 E.01986
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390702
G1 F10351.332
M204 S6000
G3 X117.892 Y127.645 I19.7 J5.842 E.03503
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390697
G1 F10351.465
M204 S6000
G3 X138.494 Y128.819 I-19.316 J7.017 E.03503
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474279
G1 F8345.72
M204 S6000
G2 X138.234 Y128.06 I-3.674 J1.34 E.02202
; LINE_WIDTH: 0.514975
G1 F7626.237
G1 X138.217 Y128.034 E.0012
G2 X137.989 Y127.839 I-.501 J.354 E.01165
; LINE_WIDTH: 0.472274
G1 F8384.694
G1 X137.475 Y127.607 E.01973
M204 S10000
G1 X137.283 Y127.607 F42000
; LINE_WIDTH: 0.378773
G1 F10719.001
M204 S6000
G1 X138.445 Y127.969 E.03331
M204 S10000
G1 X138.444 Y148.234 F42000
; LINE_WIDTH: 0.365808
G1 F11149.396
M204 S6000
G1 X137.272 Y148.594 E.03226
M204 S10000
G1 X137.46 Y148.594 F42000
; LINE_WIDTH: 0.472692
G1 F8376.533
M204 S6000
G1 X137.989 Y148.361 E.02024
; LINE_WIDTH: 0.515557
G1 F7616.849
G2 X138.216 Y148.166 I-.259 J-.529 E.01166
G1 X138.233 Y148.14 E.0012
; LINE_WIDTH: 0.474304
G1 F8345.243
G2 X138.494 Y147.571 I-3.21 J-1.819 E.02202
M204 S10000
G1 X138.494 Y147.382 F42000
; LINE_WIDTH: 0.3907
G1 F10351.385
M204 S6000
G3 X138.107 Y148.555 I-19.747 J-5.86 E.03502
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.382 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.979 Y141.228 Z2.8 F42000
G1 X120.507 Y122.867 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X120.301 Y122.464 E.0139
G1 X120.233 Y122.031 E.01348
G1 X120.233 Y109.369 E.38906
G1 X120.301 Y108.936 E.01348
G1 X120.508 Y108.53 E.01399
G1 X120.83 Y108.208 E.01399
G1 X121.236 Y108.002 E.01399
G1 X121.669 Y107.933 E.01348
G1 X134.331 Y107.933 E.38906
G1 X134.764 Y108.002 E.01348
G1 X135.17 Y108.208 E.01399
G1 X135.492 Y108.53 E.01399
G1 X135.699 Y108.936 E.01399
G1 X135.767 Y109.369 E.01348
G1 X135.767 Y122.031 E.38906
G1 X135.699 Y122.464 E.01348
G1 X135.492 Y122.87 E.01399
G1 X135.17 Y123.192 E.01399
G1 X134.764 Y123.399 E.01399
G1 X134.331 Y123.467 E.01348
G1 X121.669 Y123.467 E.38906
G1 X121.236 Y123.399 E.01348
G1 X120.83 Y123.192 E.01399
G1 X120.549 Y122.91 E.01224
M204 S250
G1 X119.978 Y123.377 F42000
G1 F3420
M204 S5000
G1 X119.757 Y122.942 E.015
G1 F3540
G1 X119.678 Y122.443 E.01552
G1 F3600
G1 X119.678 Y108.957 E.41438
G1 F3540
G1 X119.757 Y108.458 E.01552
G1 F3420
G1 X119.978 Y108.023 E.015
G1 F3360
G1 X120.323 Y107.678 E.015
G1 F3420
G1 X120.758 Y107.457 E.015
G1 F3540
G1 X121.257 Y107.378 E.01552
G1 F3600
G1 X134.743 Y107.378 E.41438
G1 F3540
G1 X135.111 Y107.436 E.01145
G1 X135.242 Y107.457 E.00407
G1 F3420
G1 X135.677 Y107.678 E.015
G1 F3360
G1 X136.022 Y108.023 E.015
G1 F3420
G1 X136.243 Y108.458 E.015
G1 F3540
G1 X136.322 Y108.957 E.01552
G1 F3600
G1 X136.322 Y122.443 E.41438
G1 F3540
G1 X136.243 Y122.942 E.01552
G1 F3420
G1 X136.022 Y123.377 E.015
G1 F3360
G1 X135.677 Y123.722 E.015
G1 F3420
G1 X135.242 Y123.943 E.015
G1 F3540
G1 X134.743 Y124.022 E.01552
G1 F3600
M73 P76 R3
G1 X121.257 Y124.022 E.41438
G1 F3540
G1 X120.758 Y123.943 E.01552
G1 F3420
G1 X120.323 Y123.722 E.015
G1 F3360
G1 X120.021 Y123.419 E.01316
M204 S10000
G1 X120.293 Y123.16 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370853
G1 F10977.87
M204 S6000
G1 X120.235 Y123.099 E.00226
; LINE_WIDTH: 0.347189
G1 F11831.639
G3 X120.053 Y122.704 I1.818 J-1.077 E.01079
; LINE_WIDTH: 0.290302
G1 F14552.426
G1 X120.012 Y122.577 E.0027
; LINE_WIDTH: 0.256582
G1 F15000
G3 X119.97 Y122.239 I1.926 J-.411 E.00594
; LINE_WIDTH: 0.221318
G1 X119.956 Y122.059 E.00262
; LINE_WIDTH: 0.206151
G1 X119.956 Y109.341 E.16917
; LINE_WIDTH: 0.221318
G1 X119.97 Y109.161 E.00262
; LINE_WIDTH: 0.249633
G1 X119.984 Y108.981 E.00304
; LINE_WIDTH: 0.276181
G3 X120.053 Y108.696 I1.06 J.106 E.0056
; LINE_WIDTH: 0.332236
G1 F12443.176
G1 X120.095 Y108.568 E.00316
; LINE_WIDTH: 0.370853
G1 F10977.87
G3 X120.278 Y108.242 I1.337 J.537 E.01005
G1 X120.601 Y107.935 E.01189
; LINE_WIDTH: 0.347189
G1 F11831.639
G3 X120.996 Y107.753 I1.077 J1.818 E.01079
; LINE_WIDTH: 0.290302
G1 F14552.426
G1 X121.123 Y107.712 E.0027
; LINE_WIDTH: 0.256582
G1 F15000
G3 X121.461 Y107.67 I.411 J1.926 E.00594
; LINE_WIDTH: 0.221318
G1 X121.641 Y107.656 E.00262
; LINE_WIDTH: 0.206363
G1 X134.346 Y107.655 E.16922
G1 X134.539 Y107.67 E.00257
; LINE_WIDTH: 0.249631
G1 X134.719 Y107.684 E.00304
; LINE_WIDTH: 0.271764
G3 X134.967 Y107.741 I-.086 J.943 E.00477
; LINE_WIDTH: 0.313981
G1 F13281.151
G1 X135.058 Y107.771 E.0021
; LINE_WIDTH: 0.341028
G1 F12076.157
G1 X135.132 Y107.795 E.00189
; LINE_WIDTH: 0.370852
G1 F10977.893
G3 X135.458 Y107.978 I-.537 J1.336 E.01005
G1 X135.765 Y108.301 E.01189
; LINE_WIDTH: 0.347191
G1 F11831.573
G3 X135.947 Y108.696 I-1.817 J1.077 E.01079
; LINE_WIDTH: 0.290302
G1 F14552.416
G1 X135.988 Y108.823 E.0027
; LINE_WIDTH: 0.256581
G1 F15000
G3 X136.03 Y109.161 I-1.926 J.411 E.00594
; LINE_WIDTH: 0.221318
G1 X136.044 Y109.341 E.00262
; LINE_WIDTH: 0.206363
G1 X136.045 Y122.046 E.16922
G1 X136.03 Y122.239 E.00257
; LINE_WIDTH: 0.249631
G1 X136.016 Y122.419 E.00304
; LINE_WIDTH: 0.276174
G3 X135.947 Y122.704 I-1.06 J-.106 E.0056
; LINE_WIDTH: 0.332227
G1 F12443.546
G1 X135.905 Y122.832 E.00316
; LINE_WIDTH: 0.370853
G1 F10977.87
G3 X135.722 Y123.158 I-1.336 J-.537 E.01005
G1 X135.399 Y123.465 E.01189
; LINE_WIDTH: 0.347189
G1 F11831.639
G3 X135.004 Y123.647 I-1.077 J-1.818 E.01079
; LINE_WIDTH: 0.290302
G1 F14552.426
G1 X134.877 Y123.688 E.0027
; LINE_WIDTH: 0.256582
G1 F15000
G3 X134.539 Y123.73 I-.411 J-1.926 E.00594
; LINE_WIDTH: 0.221318
G1 X134.359 Y123.744 E.00262
; LINE_WIDTH: 0.206363
G1 X121.654 Y123.745 E.16922
G1 X121.461 Y123.73 E.00257
; LINE_WIDTH: 0.249633
G1 X121.281 Y123.716 E.00304
; LINE_WIDTH: 0.276181
G3 X120.996 Y123.647 I.106 J-1.06 E.0056
; LINE_WIDTH: 0.332236
G1 F12443.176
G1 X120.868 Y123.605 E.00316
; LINE_WIDTH: 0.370853
G1 F10977.87
G3 X120.542 Y123.422 I.537 J-1.337 E.01005
G1 X120.335 Y123.204 E.00803
; WIPE_START
G1 X120.235 Y123.099 E-.05488
G1 X120.095 Y122.832 E-.11471
G1 X120.053 Y122.704 E-.05094
G1 X120.012 Y122.577 E-.05093
G1 X119.97 Y122.239 E-.12939
G1 X119.956 Y122.059 E-.06854
G1 X119.956 Y121.294 E-.29062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.311 Y115.856 Z2.8 F42000
G1 X126.723 Y114.423 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.343 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 X129.277 Y113.792 E-.24094
G1 X129.494 Y113.956 E-.10345
G1 X129.697 Y114.153 E-.10746
G1 X129.915 Y114.423 E-.13182
G1 X129.451 Y114.423 E-.17632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.666 J-1.515 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10742
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.285 J-2.993 E.02878
M204 S250
G1 X125.434 Y116.516 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.264 Y113.113 I2.561 J-.817 E.1325
G3 X127.943 Y113.012 I.847 J3.375 E.02113
G3 X125.452 Y116.573 I.051 J2.687 E.36339
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14863
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10801
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 13/36
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-1.152 J.392 P1  F42000
G1 X137.034 Y148.363 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X136.718 Y148.402 E.01055
G1 X119.279 Y148.402 E.57848
G3 X117.698 Y146.818 I.026 J-1.607 E.08213
G1 X117.698 Y129.382 E.5784
G3 X119.282 Y127.798 I1.607 J.023 E.08221
G1 X136.721 Y127.798 E.57848
G3 X138.302 Y129.382 I-.026 J1.607 E.08213
G1 X138.302 Y146.818 E.5784
G3 X137.093 Y148.352 I-1.607 J-.023 E.06964
M204 S250
G1 X136.986 Y147.976 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00865
G1 X119.293 Y148.01 E.53507
G3 X118.09 Y146.806 I.012 J-1.215 E.05793
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.707 Y128.19 E.53507
G3 X137.91 Y129.394 I-.012 J1.215 E.05793
G1 X137.91 Y146.806 E.53504
G3 X137.043 Y147.959 I-1.215 J-.011 E.04745
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12945
G1 X135.047 Y148.01 E-.63056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.421 Y148.335 Z3 F42000
G1 X117.818 Y148.744 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X117.302 Y147.982 I.289 J-.751 E.03251
G1 X117.302 Y128.218 E.65559
G3 X118.118 Y127.402 I.804 J-.012 E.0427
G1 X137.894 Y127.403 E.65601
G3 X138.698 Y128.218 I.001 J.803 E.04228
G1 X138.698 Y147.982 E.65559
G3 X137.882 Y148.798 I-.804 J.012 E.0427
G1 X118.121 Y148.798 E.65551
G3 X117.874 Y148.764 I-.014 J-.804 E.00828
M204 S250
G1 X117.679 Y149.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X116.91 Y147.994 I.428 J-1.117 E.04431
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.196 J0 E.05775
G1 X137.906 Y127.011 E.60839
G3 X139.09 Y128.206 I-.011 J1.195 E.05736
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.196 J0 E.05775
G1 X118.107 Y149.19 E.60798
G3 X117.735 Y149.131 I-.001 J-1.196 E.01163
; WIPE_START
M204 S6000
G1 X117.424 Y148.979 E-.1315
G1 X117.311 Y148.89 E-.05458
G1 X117.121 Y148.676 E-.10896
G1 X116.988 Y148.423 E-.10865
G1 X116.919 Y148.143 E-.10934
G1 X116.91 Y147.994 E-.05701
G1 X116.91 Y147.494 E-.18997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 13 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer13 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470306
G1 F8423.303
M204 S6000
G1 X117.735 Y148.082 E.01949
; LINE_WIDTH: 0.514697
G1 F7630.73
G2 X117.934 Y148.317 I.548 J-.261 E.01196
; LINE_WIDTH: 0.477684
G1 F8280.352
G1 X117.96 Y148.334 E.0011
G2 X118.528 Y148.594 I1.918 J-3.432 E.02218
M204 S10000
G1 X118.718 Y148.594 F42000
; LINE_WIDTH: 0.389897
G1 F10375.341
M204 S6000
G3 X117.545 Y148.208 I5.921 J-19.932 E.03492
M204 S10000
G1 X117.892 Y148.555 F42000
; LINE_WIDTH: 0.390644
G1 F10353.055
M204 S6000
G3 X117.506 Y147.382 I19.48 J-7.07 E.03502
M204 S10000
G1 X117.544 Y127.995 F42000
; LINE_WIDTH: 0.392488
G1 F10298.447
M204 S6000
G3 X118.714 Y127.606 I6.773 J18.385 E.03511
M204 S10000
G1 X118.524 Y127.606 F42000
; LINE_WIDTH: 0.474086
G1 F8349.466
M204 S6000
G2 X117.948 Y127.874 I1.347 J3.639 E.02236
; LINE_WIDTH: 0.51446
G1 F7634.572
G1 X117.9 Y127.91 E.0023
G2 X117.735 Y128.118 I.375 J.465 E.01029
; LINE_WIDTH: 0.470296
G1 F8423.508
G1 X117.506 Y128.629 E.01949
M204 S10000
G1 X117.506 Y128.819 F42000
; LINE_WIDTH: 0.390685
G1 F10351.832
M204 S6000
M73 P77 R3
G3 X117.892 Y127.645 I19.853 J5.889 E.03501
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390663
G1 F10352.487
M204 S6000
G3 X138.494 Y128.819 I-19.272 J6.999 E.03504
M204 S10000
G1 X138.494 Y128.629 F42000
; LINE_WIDTH: 0.474296
G1 F8345.39
M204 S6000
G2 X138.234 Y128.06 I-3.681 J1.342 E.02202
; LINE_WIDTH: 0.514955
G1 F7626.559
G1 X138.217 Y128.034 E.0012
G2 X137.989 Y127.839 I-.501 J.354 E.01166
; LINE_WIDTH: 0.472285
G1 F8384.488
G1 X137.473 Y127.606 E.0198
M204 S10000
G1 X137.282 Y127.606 F42000
; LINE_WIDTH: 0.39215
G1 F10308.417
M204 S6000
G3 X138.455 Y127.993 I-5.812 J19.609 E.03516
M204 S10000
G1 X138.444 Y148.233 F42000
; LINE_WIDTH: 0.372958
G1 F10907.845
M204 S6000
G1 X137.277 Y148.594 E.03287
M204 S10000
G1 X137.465 Y148.594 F42000
; LINE_WIDTH: 0.472534
G1 F8379.614
M204 S6000
M73 P77 R2
G1 X137.989 Y148.361 E.02006
; LINE_WIDTH: 0.514922
G1 F7627.092
G2 X138.217 Y148.166 I-.273 J-.549 E.01166
G1 X138.234 Y148.14 E.00119
; LINE_WIDTH: 0.47258
G1 F8378.718
G2 X138.494 Y147.571 I-4.031 J-2.191 E.02193
M204 S10000
G1 X138.494 Y147.378 F42000
; LINE_WIDTH: 0.388815
G1 F10407.805
M204 S6000
G3 X138.108 Y148.555 I-18.537 J-5.436 E.03494
; OBJECT_ID: 47
; WIPE_START
G1 X138.494 Y147.378 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.958 Y141.239 Z3 F42000
G1 X120.43 Y122.934 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X120.218 Y122.517 E.01437
G1 X120.147 Y122.069 E.01394
G1 X120.147 Y109.331 E.3914
G1 X120.218 Y108.883 E.01394
G1 X120.432 Y108.464 E.01445
G1 X120.764 Y108.132 E.01445
G1 X121.183 Y107.918 E.01445
G1 X121.631 Y107.847 E.01394
G1 X134.369 Y107.847 E.3914
G1 X134.817 Y107.918 E.01394
G1 X135.236 Y108.132 E.01445
G1 X135.568 Y108.464 E.01445
G1 X135.782 Y108.883 E.01445
G1 X135.853 Y109.331 E.01394
G1 X135.853 Y122.069 E.3914
G1 X135.782 Y122.517 E.01394
G1 X135.568 Y122.936 E.01445
G1 X135.236 Y123.268 E.01445
G1 X134.817 Y123.482 E.01445
G1 X134.369 Y123.553 E.01394
G1 X121.631 Y123.553 E.3914
G1 X121.183 Y123.482 E.01394
G1 X120.764 Y123.268 E.01445
G1 X120.472 Y122.977 E.01269
M204 S250
G1 X119.903 Y123.444 F42000
G1 F3420
M204 S5000
G1 X119.677 Y123 E.01531
G1 F3540
G1 X119.596 Y122.492 E.01583
G1 F3600
G1 X119.596 Y108.908 E.41737
G1 F3540
G1 X119.677 Y108.4 E.01583
G1 F3420
G1 X119.903 Y107.956 E.01531
G1 F3360
G1 X120.256 Y107.603 E.01531
G1 F3420
G1 X120.7 Y107.377 E.01531
G1 F3540
G1 X121.208 Y107.296 E.01583
G1 F3600
G1 X134.792 Y107.296 E.41737
G1 F3540
G1 X135.193 Y107.36 E.01248
G1 X135.3 Y107.377 E.00334
G1 F3420
G1 X135.744 Y107.603 E.01531
G1 F3360
G1 X136.097 Y107.956 E.01531
G1 F3420
G1 X136.323 Y108.4 E.01531
G1 F3540
G1 X136.404 Y108.908 E.01583
G1 F3600
G1 X136.404 Y122.492 E.41737
G1 F3540
G1 X136.323 Y123 E.01583
G1 F3420
G1 X136.097 Y123.444 E.01531
G1 F3360
G1 X135.744 Y123.797 E.01531
G1 F3420
G1 X135.3 Y124.023 E.01531
G1 F3540
G1 X134.792 Y124.104 E.01583
G1 F3600
G1 X121.208 Y124.104 E.41737
G1 F3540
G1 X120.7 Y124.023 E.01583
G1 F3420
G1 X120.256 Y123.797 E.01531
G1 F3360
G1 X119.946 Y123.487 E.01347
M204 S10000
G1 X120.205 Y123.228 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.36967
G1 F11017.603
M204 S6000
G1 X120.204 Y123.226 E.00005
G3 X120.133 Y123.123 I.626 J-.502 E.00333
; LINE_WIDTH: 0.344966
G1 F11918.716
G3 X119.972 Y122.76 I1.066 J-.689 E.00981
; LINE_WIDTH: 0.287845
G1 F14698.382
G1 X119.93 Y122.629 E.00275
; LINE_WIDTH: 0.253372
G1 F15000
G3 X119.887 Y122.282 I1.996 J-.423 E.006
; LINE_WIDTH: 0.217079
G1 X119.872 Y122.097 E.00264
; LINE_WIDTH: 0.201511
G1 X119.872 Y109.303 E.16533
; LINE_WIDTH: 0.217087
G1 X119.887 Y109.118 E.00264
; LINE_WIDTH: 0.246259
G1 X119.901 Y108.933 E.00308
; LINE_WIDTH: 0.273484
G3 X119.972 Y108.64 I1.079 J.107 E.00567
; LINE_WIDTH: 0.330884
G1 F12501.595
G1 X120.015 Y108.509 E.00323
; LINE_WIDTH: 0.369671
G1 F11017.562
G3 X120.204 Y108.174 I1.366 J.547 E.01028
G1 X120.474 Y107.904 E.01018
G3 X120.577 Y107.833 I.501 J.625 E.00333
; LINE_WIDTH: 0.344969
G1 F11918.597
G3 X120.94 Y107.672 I.689 J1.066 E.00981
; LINE_WIDTH: 0.287845
G1 F14698.382
G1 X121.071 Y107.63 E.00275
; LINE_WIDTH: 0.253372
G1 F15000
G3 X121.418 Y107.587 I.423 J1.996 E.006
; LINE_WIDTH: 0.217079
G1 X121.603 Y107.572 E.00264
; LINE_WIDTH: 0.201734
G1 X134.384 Y107.572 E.1654
G1 X134.582 Y107.587 E.00257
; LINE_WIDTH: 0.246262
G1 X134.767 Y107.601 E.00308
; LINE_WIDTH: 0.270378
G3 X135.034 Y107.664 I-.093 J.996 E.00509
; LINE_WIDTH: 0.318238
G1 F13075.805
G1 X135.139 Y107.698 E.00248
; LINE_WIDTH: 0.368208
G1 F11067.135
G3 X135.526 Y107.904 I-.929 J2.218 E.01163
G1 X135.796 Y108.174 E.01013
G3 X135.867 Y108.277 I-.626 J.502 E.00332
; LINE_WIDTH: 0.344965
G1 F11918.779
G3 X136.028 Y108.64 I-1.066 J.689 E.00981
; LINE_WIDTH: 0.287845
G1 F14698.382
G1 X136.07 Y108.771 E.00275
; LINE_WIDTH: 0.25337
G1 F15000
G3 X136.113 Y109.118 I-1.996 J.423 E.006
; LINE_WIDTH: 0.217079
G1 X136.128 Y109.303 E.00264
; LINE_WIDTH: 0.201734
G1 X136.128 Y122.084 E.1654
G1 X136.113 Y122.282 E.00257
; LINE_WIDTH: 0.246259
G1 X136.099 Y122.467 E.00308
; LINE_WIDTH: 0.273484
G3 X136.028 Y122.76 I-1.079 J-.107 E.00567
; LINE_WIDTH: 0.330884
G1 F12501.595
G1 X135.985 Y122.891 E.00323
; LINE_WIDTH: 0.36967
G1 F11017.603
G3 X135.796 Y123.226 I-1.366 J-.547 E.01028
G1 X135.526 Y123.496 E.01018
G3 X135.423 Y123.567 I-.502 J-.626 E.00333
; LINE_WIDTH: 0.344966
G1 F11918.716
G3 X135.06 Y123.728 I-.689 J-1.066 E.00981
; LINE_WIDTH: 0.287845
G1 F14698.382
G1 X134.929 Y123.77 E.00275
; LINE_WIDTH: 0.253372
G1 F15000
G3 X134.582 Y123.813 I-.423 J-1.996 E.006
; LINE_WIDTH: 0.217079
G1 X134.397 Y123.828 E.00264
; LINE_WIDTH: 0.201734
G1 X121.616 Y123.828 E.1654
G1 X121.418 Y123.813 E.00257
; LINE_WIDTH: 0.246259
G1 X121.233 Y123.799 E.00308
; LINE_WIDTH: 0.273484
G3 X120.94 Y123.728 I.107 J-1.079 E.00567
; LINE_WIDTH: 0.330884
G1 F12501.595
G1 X120.809 Y123.685 E.00323
; LINE_WIDTH: 0.36967
G1 F11017.603
G3 X120.474 Y123.496 I.547 J-1.366 E.01028
G1 X120.247 Y123.27 E.00853
; WIPE_START
G1 X120.204 Y123.226 E-.02353
G1 X120.133 Y123.123 E-.04754
G1 X120.015 Y122.891 E-.09904
G1 X119.972 Y122.76 E-.05228
G1 X119.93 Y122.629 E-.05227
G1 X119.887 Y122.282 E-.13277
G1 X119.872 Y122.097 E-.07065
G1 X119.872 Y121.355 E-.28191
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.237 Y115.926 Z3 F42000
G1 X126.723 Y114.423 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.947 J2.346 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.673 J1.929 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 X129.277 Y113.792 E-.24092
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.505 Y117.434 E.00889
G3 X129.277 Y117.608 I-.819 J-.834 E.00954
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.247 E-.13181
G1 X129.505 Y117.434 E-.10184
G1 X129.277 Y117.608 E-.10905
G1 X129.277 Y117.151 E-.17388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.283 J-2.991 E.02878
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.264 Y113.113 I2.561 J-.817 E.13259
G3 X127.956 Y113.013 I.819 J3.215 E.02153
G3 X125.45 Y116.574 I.036 J2.688 E.36296
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14869
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12584
G1 X125.437 Y114.885 E-.12585
G1 X125.54 Y114.62 E-.10795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 14/36
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S198.9
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-1.151 J.395 P1  F42000
G1 X136.985 Y147.976 Z3
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X136.706 Y148.01 E.00863
G1 X119.294 Y148.01 E.53504
G3 X118.09 Y146.806 I.011 J-1.215 E.05795
G1 X118.09 Y129.394 E.53504
G3 X119.294 Y128.19 I1.215 J.011 E.05795
G1 X136.706 Y128.19 E.53504
G3 X137.91 Y129.394 I-.011 J1.215 E.05795
G1 X137.91 Y146.806 E.53504
G3 X137.043 Y147.959 I-1.215 J-.011 E.04746
; WIPE_START
M204 S6000
G1 X136.706 Y148.01 E-.12932
G1 X135.047 Y148.01 E-.63069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.429 Y148.493 Z3.2 F42000
G1 X117.679 Y149.111 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X116.91 Y147.994 I.428 J-1.117 E.04431
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.196 J0 E.05775
G1 X138.043 Y127.019 E.61261
G3 X139.09 Y128.206 I-.17 J1.205 E.05295
G1 X139.09 Y147.994 E.60801
G3 X137.894 Y149.19 I-1.196 J0 E.05775
G1 X118.106 Y149.19 E.60801
M73 P78 R2
G3 X117.735 Y149.131 I0 J-1.196 E.0116
; WIPE_START
M204 S6000
G1 X117.547 Y149.053 E-.07727
G1 X117.311 Y148.89 E-.10894
G1 X117.121 Y148.676 E-.10903
G1 X116.988 Y148.422 E-.10895
G1 X116.919 Y148.143 E-.10901
G1 X116.91 Y147.994 E-.05699
G1 X116.91 Y147.494 E-.1898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 14 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer14 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.883 Y147.748 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X137.648 Y148.983 E.05366
G1 X137.114 Y148.983
G1 X138.883 Y147.214 E.07684
G1 X138.883 Y146.681
G1 X136.581 Y148.983 E.10001
G1 X136.826 Y148.204
G1 X136.048 Y148.983 E.03383
G1 X135.515 Y148.983
G1 X136.28 Y148.217 E.03325
G1 X135.747 Y148.217
G1 X134.981 Y148.983 E.03325
G1 X134.448 Y148.983
G1 X135.213 Y148.217 E.03325
G1 X134.68 Y148.217
G1 X133.915 Y148.983 E.03325
G1 X133.382 Y148.983
G1 X134.147 Y148.217 E.03325
G1 X133.614 Y148.217
G1 X132.848 Y148.983 E.03325
G1 X132.315 Y148.983
G1 X133.08 Y148.217 E.03325
G1 X132.547 Y148.217
G1 X131.782 Y148.983 E.03325
G1 X131.249 Y148.983
G1 X132.014 Y148.217 E.03325
G1 X131.481 Y148.217
G1 X130.715 Y148.983 E.03325
G1 X130.182 Y148.983
G1 X130.947 Y148.217 E.03325
G1 X130.414 Y148.217
G1 X129.649 Y148.983 E.03325
G1 X129.116 Y148.983
G1 X129.881 Y148.217 E.03325
G1 X129.348 Y148.217
G1 X128.582 Y148.983 E.03325
G1 X128.049 Y148.983
G1 X128.814 Y148.217 E.03325
G1 X128.281 Y148.217
G1 X127.516 Y148.983 E.03325
G1 X126.983 Y148.983
G1 X127.748 Y148.217 E.03325
G1 X127.215 Y148.217
G1 X126.449 Y148.983 E.03325
G1 X125.916 Y148.983
G1 X126.681 Y148.217 E.03325
G1 X126.148 Y148.217
G1 X125.383 Y148.983 E.03325
G1 X124.85 Y148.983
G1 X125.615 Y148.217 E.03325
G1 X125.082 Y148.217
G1 X124.316 Y148.983 E.03325
G1 X123.783 Y148.983
G1 X124.548 Y148.217 E.03325
G1 X124.015 Y148.217
G1 X123.25 Y148.983 E.03325
G1 X122.716 Y148.983
G1 X123.482 Y148.217 E.03325
G1 X122.948 Y148.217
G1 X122.183 Y148.983 E.03325
G1 X121.65 Y148.983
G1 X122.415 Y148.217 E.03325
G1 X121.882 Y148.217
G1 X121.117 Y148.983 E.03325
G1 X120.583 Y148.983
G1 X121.349 Y148.217 E.03325
G1 X120.815 Y148.217
G1 X120.05 Y148.983 E.03325
G1 X119.517 Y148.983
G1 X120.282 Y148.217 E.03325
G1 X119.749 Y148.217
G1 X118.984 Y148.983 E.03325
G1 X118.45 Y148.983
G1 X119.223 Y148.21 E.03356
G1 X118.787 Y148.112
G1 X117.937 Y148.963 E.03694
G1 X117.558 Y148.809
G1 X118.445 Y147.922 E.03855
G1 X118.178 Y147.655
G1 X117.287 Y148.546 E.03872
G1 X117.137 Y148.163
G1 X117.981 Y147.319 E.03667
G1 X117.89 Y146.877
G1 X117.117 Y147.649 E.03356
G1 X117.117 Y147.116
G1 X117.883 Y146.351 E.03325
G1 X117.883 Y145.818
G1 X117.117 Y146.583 E.03325
G1 X117.117 Y146.05
G1 X117.883 Y145.284 E.03325
G1 X117.883 Y144.751
G1 X117.117 Y145.516 E.03325
G1 X117.117 Y144.983
G1 X117.883 Y144.218 E.03325
G1 X117.883 Y143.685
G1 X117.117 Y144.45 E.03325
G1 X117.117 Y143.917
G1 X117.883 Y143.151 E.03325
G1 X117.883 Y142.618
G1 X117.117 Y143.383 E.03325
G1 X117.117 Y142.85
G1 X117.883 Y142.085 E.03325
G1 X117.883 Y141.552
G1 X117.117 Y142.317 E.03325
G1 X117.117 Y141.784
G1 X117.883 Y141.018 E.03325
G1 X117.883 Y140.485
G1 X117.117 Y141.25 E.03325
G1 X117.117 Y140.717
G1 X117.883 Y139.952 E.03325
G1 X117.883 Y139.419
G1 X117.117 Y140.184 E.03325
G1 X117.117 Y139.651
G1 X117.883 Y138.885 E.03325
G1 X117.883 Y138.352
G1 X117.117 Y139.117 E.03325
G1 X117.117 Y138.584
M73 P79 R2
G1 X117.883 Y137.819 E.03325
G1 X117.883 Y137.286
G1 X117.117 Y138.051 E.03325
G1 X117.117 Y137.518
G1 X117.883 Y136.752 E.03325
G1 X117.883 Y136.219
G1 X117.117 Y136.984 E.03325
G1 X117.117 Y136.451
G1 X117.883 Y135.686 E.03325
G1 X117.883 Y135.152
G1 X117.117 Y135.918 E.03325
G1 X117.117 Y135.384
G1 X117.883 Y134.619 E.03325
G1 X117.883 Y134.086
G1 X117.117 Y134.851 E.03325
G1 X117.117 Y134.318
G1 X117.883 Y133.553 E.03325
G1 X117.883 Y133.019
G1 X117.117 Y133.785 E.03325
G1 X117.117 Y133.251
G1 X117.883 Y132.486 E.03325
G1 X117.883 Y131.953
G1 X117.117 Y132.718 E.03325
G1 X117.117 Y132.185
G1 X117.883 Y131.42 E.03325
G1 X117.883 Y130.886
G1 X117.117 Y131.652 E.03325
G1 X117.117 Y131.118
G1 X117.883 Y130.353 E.03325
G1 X117.883 Y129.82
G1 X117.117 Y130.585 E.03325
G1 X117.117 Y130.052
G1 X117.896 Y129.273 E.03383
; WIPE_START
M204 S6000
G1 X117.117 Y130.052 E-.41834
G1 X117.117 Y130.585 E-.20264
G1 X117.376 Y130.326 E-.13902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.334 Y135.097 Z3.2 F42000
G1 X138.104 Y146.926 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X138.883 Y146.148 E.03383
G1 X138.883 Y145.615
G1 X138.117 Y146.38 E.03325
G1 X138.117 Y145.847
G1 X138.883 Y145.081 E.03325
G1 X138.883 Y144.548
G1 X138.117 Y145.313 E.03325
G1 X138.117 Y144.78
G1 X138.883 Y144.015 E.03325
G1 X138.883 Y143.482
G1 X138.117 Y144.247 E.03325
G1 X138.117 Y143.714
G1 X138.883 Y142.948 E.03325
G1 X138.883 Y142.415
G1 X138.117 Y143.18 E.03325
G1 X138.117 Y142.647
G1 X138.883 Y141.882 E.03325
G1 X138.883 Y141.349
G1 X138.117 Y142.114 E.03325
G1 X138.117 Y141.581
G1 X138.883 Y140.815 E.03325
G1 X138.883 Y140.282
G1 X138.117 Y141.047 E.03325
G1 X138.117 Y140.514
G1 X138.883 Y139.749 E.03325
G1 X138.883 Y139.216
G1 X138.117 Y139.981 E.03325
G1 X138.117 Y139.448
G1 X138.883 Y138.682 E.03325
G1 X138.883 Y138.149
G1 X138.117 Y138.914 E.03325
G1 X138.117 Y138.381
G1 X138.883 Y137.616 E.03325
G1 X138.883 Y137.083
G1 X138.117 Y137.848 E.03325
G1 X138.117 Y137.315
G1 X138.883 Y136.549 E.03325
G1 X138.883 Y136.016
G1 X138.117 Y136.781 E.03325
G1 X138.117 Y136.248
G1 X138.883 Y135.483 E.03325
G1 X138.883 Y134.95
G1 X138.117 Y135.715 E.03325
G1 X138.117 Y135.182
G1 X138.883 Y134.416 E.03325
G1 X138.883 Y133.883
G1 X138.117 Y134.648 E.03325
G1 X138.117 Y134.115
G1 X138.883 Y133.35 E.03325
G1 X138.883 Y132.817
G1 X138.117 Y133.582 E.03325
G1 X138.117 Y133.049
G1 X138.883 Y132.283 E.03325
G1 X138.883 Y131.75
G1 X138.117 Y132.515 E.03325
G1 X138.117 Y131.982
G1 X138.883 Y131.217 E.03325
G1 X138.883 Y130.683
G1 X138.117 Y131.449 E.03325
G1 X138.117 Y130.915
G1 X138.883 Y130.15 E.03325
G1 X138.883 Y129.617
G1 X138.117 Y130.382 E.03325
G1 X138.117 Y129.849
G1 X138.883 Y129.084 E.03325
G1 X138.883 Y128.55
G1 X138.11 Y129.323 E.03356
G1 X138.019 Y128.881
G1 X138.863 Y128.037 E.03667
G1 X138.709 Y127.658
G1 X137.822 Y128.545 E.03855
G1 X137.555 Y128.278
G1 X138.448 Y127.386 E.03878
G1 X138.066 Y127.234
G1 X137.213 Y128.088 E.03709
G1 X136.777 Y127.99
G1 X137.541 Y127.226 E.03318
G1 X137.008 Y127.226
G1 X136.251 Y127.983 E.03288
G1 X135.718 Y127.983
G1 X136.475 Y127.226 E.03289
G1 X135.942 Y127.225
G1 X135.184 Y127.983 E.0329
G1 X134.651 Y127.983
G1 X135.409 Y127.225 E.03291
G1 X134.876 Y127.225
G1 X134.118 Y127.983 E.03292
G1 X133.585 Y127.983
G1 X134.342 Y127.225 E.03293
G1 X133.809 Y127.225
G1 X133.051 Y127.983 E.03294
G1 X132.518 Y127.983
G1 X133.276 Y127.224 E.03295
G1 X132.743 Y127.224
G1 X131.985 Y127.983 E.03297
G1 X131.452 Y127.983
G1 X132.21 Y127.224 E.03298
G1 X131.677 Y127.224
G1 X130.918 Y127.983 E.03299
G1 X130.385 Y127.983
G1 X131.144 Y127.223 E.033
G1 X130.611 Y127.223
G1 X129.852 Y127.983 E.03301
G1 X129.319 Y127.983
G1 X130.078 Y127.223 E.03302
G1 X129.545 Y127.223
G1 X128.785 Y127.983 E.03303
G1 X128.252 Y127.983
G1 X129.012 Y127.222 E.03304
G1 X128.479 Y127.222
G1 X127.719 Y127.983 E.03305
G1 X127.186 Y127.983
G1 X127.946 Y127.222 E.03306
G1 X127.413 Y127.222
G1 X126.652 Y127.983 E.03307
G1 X126.119 Y127.983
G1 X126.88 Y127.221 E.03308
G1 X126.347 Y127.221
G1 X125.586 Y127.983 E.03309
G1 X125.052 Y127.983
G1 X125.814 Y127.221 E.0331
G1 X125.281 Y127.221
G1 X124.519 Y127.983 E.03311
G1 X123.986 Y127.983
G1 X124.748 Y127.22 E.03312
G1 X124.215 Y127.22
G1 X123.453 Y127.983 E.03313
G1 X122.919 Y127.983
G1 X123.682 Y127.22 E.03314
G1 X123.149 Y127.22
G1 X122.386 Y127.983 E.03315
G1 X121.853 Y127.983
G1 X122.616 Y127.219 E.03316
G1 X122.083 Y127.219
G1 X121.32 Y127.983 E.03318
G1 X120.786 Y127.983
G1 X121.55 Y127.219 E.03319
G1 X121.017 Y127.219
G1 X120.253 Y127.983 E.0332
G1 X119.72 Y127.983
G1 X120.484 Y127.218 E.03321
G1 X119.951 Y127.218
G1 X119.173 Y127.996 E.03379
G1 X119.418 Y127.218
G1 X117.117 Y129.519 E.09998
G1 X117.117 Y128.985
G1 X118.885 Y127.218 E.07681
G1 X118.352 Y127.217
G1 X117.117 Y128.452 E.05365
; WIPE_START
M204 S6000
G1 X118.352 Y127.217 E-.66351
G1 X118.606 Y127.218 E-.09649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.657 Y127.245 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104182
G1 F15000
M204 S6000
G1 X119.483 Y127.218 E.00088
; WIPE_START
G1 X119.657 Y127.245 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.004 Y127.205 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.274202
G1 F15000
M204 S6000
G1 X117.808 Y127.349 E.00458
; LINE_WIDTH: 0.316054
G1 F13180.349
G2 X117.322 Y127.802 I1.102 J1.669 E.01486
; LINE_WIDTH: 0.279188
G1 F15000
G1 X117.104 Y128.118 E.00738
; WIPE_START
G1 X117.322 Y127.802 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.952 Y128.968 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.121228
G1 F15000
M204 S6000
G1 X117.822 Y129.199 E.00169
; WIPE_START
G1 X117.952 Y128.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.926 Y136.601 Z3.2 F42000
G1 X117.891 Y146.857 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0989328
G1 F15000
M204 S6000
G3 X117.813 Y146.687 I2.817 J-1.396 E.00085
; WIPE_START
G1 X117.891 Y146.857 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.413 Y148.287 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0990256
G1 F15000
M204 S6000
G3 X119.243 Y148.209 I1.173 J-2.784 E.00085
; WIPE_START
G1 X119.413 Y148.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.039 Y148.597 Z3.2 F42000
G1 X136.516 Y148.982 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.104243
G1 F15000
M204 S6000
G1 X136.342 Y148.955 E.00088
; WIPE_START
G1 X136.516 Y148.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.896 Y148.082 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.279287
G1 F15000
M204 S6000
G1 X138.678 Y148.398 E.00738
; LINE_WIDTH: 0.321734
G1 F12911.856
G3 X138.388 Y148.707 I-1.42 J-1.041 E.00966
; LINE_WIDTH: 0.306423
G1 F13662.103
G1 X138.192 Y148.851 E.00522
; LINE_WIDTH: 0.274316
G1 F15000
G1 X137.996 Y148.995 E.00458
; WIPE_START
G1 X138.192 Y148.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.178 Y147 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.121137
G1 F15000
M204 S6000
G1 X138.048 Y147.232 E.00169
; WIPE_START
G1 X138.178 Y147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.182 Y139.368 Z3.2 F42000
G1 X138.187 Y129.513 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0990216
G1 F15000
M204 S6000
G2 X138.109 Y129.343 I-2.781 J1.172 E.00085
; WIPE_START
G1 X138.187 Y129.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P80 R2
G1 X136.757 Y127.991 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0989266
G1 F15000
M204 S6000
G2 X136.587 Y127.913 I-1.398 J2.822 E.00085
; OBJECT_ID: 47
; WIPE_START
G1 X136.757 Y127.991 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.454 Y125.769 Z3.2 F42000
G1 X120.355 Y123.001 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X120.135 Y122.57 E.01488
G1 X120.061 Y122.107 E.01439
G1 X120.061 Y109.293 E.39374
G1 X120.135 Y108.83 E.01439
G1 X120.355 Y108.398 E.01491
G1 X120.698 Y108.055 E.01491
G1 X121.13 Y107.835 E.01491
G1 X121.593 Y107.761 E.01439
G1 X134.407 Y107.761 E.39374
G1 X134.87 Y107.835 E.01439
G1 X135.302 Y108.055 E.01491
G1 X135.645 Y108.398 E.01491
G1 X135.865 Y108.83 E.01491
G1 X135.939 Y109.293 E.01439
G1 X135.939 Y122.107 E.39374
G1 X135.865 Y122.57 E.01439
G1 X135.645 Y123.002 E.01491
G1 X135.302 Y123.345 E.01491
G1 X134.87 Y123.565 E.01491
G1 X134.407 Y123.639 E.01439
G1 X121.593 Y123.639 E.39374
G1 X121.13 Y123.565 E.01439
G1 X120.698 Y123.345 E.01491
G1 X120.397 Y123.044 E.01309
M204 S250
G1 X119.828 Y123.512 F42000
G1 F3420
M204 S5000
G1 X119.598 Y123.059 E.01562
G1 F3540
G1 X119.515 Y122.54 E.01614
G1 F3600
G1 X119.515 Y108.86 E.42036
G1 F3540
G1 X119.598 Y108.341 E.01614
G1 F3420
G1 X119.828 Y107.888 E.01562
G1 F3360
G1 X120.188 Y107.528 E.01562
G1 F3420
G1 X120.641 Y107.298 E.01562
G1 F3540
G1 X121.16 Y107.215 E.01614
G1 F3600
G1 X134.84 Y107.215 E.42036
G1 F3540
G1 X135.275 Y107.284 E.01352
G1 X135.359 Y107.298 E.00262
G1 F3420
G1 X135.812 Y107.528 E.01562
G1 F3360
G1 X136.172 Y107.888 E.01562
G1 F3420
G1 X136.402 Y108.341 E.01562
G1 F3540
G1 X136.485 Y108.86 E.01614
G1 F3600
G1 X136.485 Y122.54 E.42036
G1 F3540
G1 X136.402 Y123.059 E.01614
G1 F3420
G1 X136.172 Y123.512 E.01562
G1 F3360
G1 X135.812 Y123.872 E.01562
G1 F3420
G1 X135.359 Y124.102 E.01562
G1 F3540
G1 X134.84 Y124.185 E.01614
G1 F3600
G1 X121.16 Y124.185 E.42036
G1 F3540
G1 X120.641 Y124.102 E.01614
G1 F3420
G1 X120.188 Y123.872 E.01562
G1 F3360
G1 X119.871 Y123.554 E.01378
M204 S10000
G1 X120.129 Y123.294 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.369259
G1 F11031.498
M204 S6000
G3 X120.057 Y123.189 I.635 J-.51 E.00339
; LINE_WIDTH: 0.343996
G1 F11957.136
G3 X119.891 Y122.815 I1.096 J-.709 E.01006
; LINE_WIDTH: 0.285403
G1 F14846.427
G1 X119.848 Y122.681 E.00279
; LINE_WIDTH: 0.25018
G1 F15000
G3 X119.804 Y122.325 I2.064 J-.435 E.00606
; LINE_WIDTH: 0.212871
G1 X119.789 Y122.135 E.00265
; LINE_WIDTH: 0.196891
G1 X119.789 Y109.265 E.16146
; LINE_WIDTH: 0.212865
G1 X119.804 Y109.075 E.00265
; LINE_WIDTH: 0.242914
G1 X119.819 Y108.884 E.00312
; LINE_WIDTH: 0.270795
G3 X119.891 Y108.585 I1.1 J.108 E.00573
; LINE_WIDTH: 0.329525
G1 F12560.875
G1 X119.935 Y108.451 E.00329
; LINE_WIDTH: 0.369259
G1 F11031.498
G3 X120.129 Y108.106 I1.396 J.558 E.01054
G1 X120.406 Y107.829 E.01043
G3 X120.511 Y107.757 I.51 J.635 E.00339
; LINE_WIDTH: 0.343996
G1 F11957.136
G3 X120.885 Y107.591 I.709 J1.096 E.01006
; LINE_WIDTH: 0.285403
G1 F14846.427
G1 X121.019 Y107.548 E.00279
; LINE_WIDTH: 0.25018
G1 F15000
G3 X121.375 Y107.504 I.435 J2.064 E.00606
; LINE_WIDTH: 0.212871
G1 X121.565 Y107.489 E.00265
; LINE_WIDTH: 0.197125
G1 X134.422 Y107.488 E.16156
G1 X134.625 Y107.504 E.00256
; LINE_WIDTH: 0.242917
G1 X134.816 Y107.519 E.00312
; LINE_WIDTH: 0.26904
G3 X135.101 Y107.587 I-.1 J1.053 E.00541
; LINE_WIDTH: 0.32248
G1 F12877.394
G1 X135.221 Y107.626 E.00287
; LINE_WIDTH: 0.368549
G1 F11055.538
G3 X135.594 Y107.829 I-1.17 J2.596 E.01128
G1 X135.871 Y108.106 E.01041
G3 X135.943 Y108.211 I-.637 J.511 E.00338
; LINE_WIDTH: 0.343994
G1 F11957.221
G3 X136.109 Y108.585 I-1.096 J.709 E.01006
; LINE_WIDTH: 0.285403
G1 F14846.427
G1 X136.152 Y108.719 E.00279
; LINE_WIDTH: 0.25018
G1 F15000
G3 X136.196 Y109.075 I-2.064 J.435 E.00606
; LINE_WIDTH: 0.212871
G1 X136.211 Y109.265 E.00265
; LINE_WIDTH: 0.197125
G1 X136.212 Y122.122 E.16156
G1 X136.196 Y122.325 E.00256
; LINE_WIDTH: 0.242914
G1 X136.181 Y122.516 E.00312
; LINE_WIDTH: 0.270795
G3 X136.109 Y122.815 I-1.1 J-.108 E.00573
; LINE_WIDTH: 0.329525
G1 F12560.875
G1 X136.065 Y122.949 E.00329
; LINE_WIDTH: 0.369259
G1 F11031.498
G3 X135.871 Y123.294 I-1.396 J-.558 E.01054
G1 X135.594 Y123.571 E.01043
G3 X135.489 Y123.643 I-.51 J-.635 E.00339
; LINE_WIDTH: 0.343996
G1 F11957.136
G3 X135.115 Y123.809 I-.709 J-1.096 E.01006
; LINE_WIDTH: 0.285403
G1 F14846.427
G1 X134.981 Y123.852 E.00279
; LINE_WIDTH: 0.25018
G1 F15000
G3 X134.625 Y123.896 I-.435 J-2.064 E.00606
; LINE_WIDTH: 0.212871
G1 X134.435 Y123.911 E.00265
; LINE_WIDTH: 0.197125
G1 X121.578 Y123.912 E.16156
G1 X121.375 Y123.896 E.00256
; LINE_WIDTH: 0.242914
G1 X121.184 Y123.881 E.00312
; LINE_WIDTH: 0.270795
G3 X120.885 Y123.809 I.108 J-1.1 E.00573
; LINE_WIDTH: 0.329525
G1 F12560.875
G1 X120.751 Y123.765 E.00329
; LINE_WIDTH: 0.369259
G1 F11031.498
G3 X120.406 Y123.571 I.558 J-1.396 E.01054
G1 X120.171 Y123.336 E.00884
; WIPE_START
G1 X120.057 Y123.189 E-.07093
G1 X119.935 Y122.949 E-.10207
G1 X119.891 Y122.815 E-.05361
G1 X119.848 Y122.681 E-.05361
G1 X119.804 Y122.325 E-.13617
G1 X119.789 Y122.135 E-.07275
G1 X119.789 Y121.422 E-.27087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.161 Y116 Z3.2 F42000
G1 X126.723 Y114.423 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 X129.277 Y113.792 E-.24096
G1 X129.494 Y113.956 E-.10349
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.514 Y117.425 E.00846
G3 X129.277 Y117.608 I-.861 J-.868 E.00997
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.1318
G1 X129.514 Y117.425 E-.09692
G1 X129.277 Y117.608 E-.11394
G1 X129.277 Y117.151 E-.17391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.442 Y116.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.969 Y113.013 I2.561 J-.814 E.15407
G3 X127.537 Y118.347 I.031 J2.687 E.27463
G3 X125.46 Y116.571 I.466 J-2.646 E.08806
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.35 Y116.143 E-.16806
G1 X125.315 Y115.866 E-.1061
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12586
G1 X125.437 Y114.885 E-.12583
G1 X125.54 Y114.619 E-.10833
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 15/36
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S201.45
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-1.033 J-.643 P1  F42000
G1 X120.278 Y123.068 Z3.2
G1 Z3
G1 E.8 F1800
G1 F2446
M204 S5000
G1 X120.051 Y122.622 E.01537
G1 X119.976 Y122.145 E.01485
G1 X119.976 Y109.255 E.39608
G1 X120.051 Y108.778 E.01485
G1 X120.278 Y108.332 E.01536
G1 X120.511 Y108.099 E.01011
G1 X120.632 Y107.978 E.00525
G1 X121.078 Y107.751 E.01537
G1 X121.555 Y107.676 E.01485
G1 X134.445 Y107.676 E.39608
G1 X134.922 Y107.751 E.01485
G1 X135.368 Y107.978 E.01536
G1 X135.722 Y108.332 E.01537
G1 X135.949 Y108.778 E.01537
G1 X136.024 Y109.255 E.01485
G1 X136.024 Y122.145 E.39608
G1 X135.949 Y122.623 E.01485
G1 X135.722 Y123.068 E.01536
G1 X135.368 Y123.422 E.01537
G1 X134.922 Y123.649 E.01537
G1 X134.445 Y123.724 E.01485
G1 X121.555 Y123.724 E.39608
G1 X121.077 Y123.649 E.01485
G1 X120.632 Y123.422 E.01536
G1 X120.321 Y123.11 E.01352
M204 S250
G1 X119.754 Y123.58 F42000
G1 F2446
M204 S5000
G1 X119.518 Y123.118 E.01593
G1 X119.434 Y122.589 E.01645
G1 X119.434 Y108.811 E.42335
G1 X119.518 Y108.282 E.01645
G1 X119.754 Y107.82 E.01594
G1 X120.12 Y107.454 E.01594
G1 X120.582 Y107.218 E.01593
G1 X121.111 Y107.134 E.01645
G1 X134.889 Y107.134 E.42335
G1 X135.357 Y107.208 E.01456
G1 X135.418 Y107.218 E.00189
G1 X135.88 Y107.454 E.01594
G1 X136.246 Y107.82 E.01594
G1 X136.482 Y108.282 E.01593
G1 X136.566 Y108.811 E.01645
G1 X136.566 Y122.589 E.42335
G1 X136.482 Y123.118 E.01645
G1 X136.246 Y123.58 E.01594
G1 X135.88 Y123.947 E.01594
G1 X135.418 Y124.182 E.01593
G1 X134.889 Y124.266 E.01645
G1 X121.111 Y124.266 E.42335
G1 X120.582 Y124.182 E.01645
G1 X120.12 Y123.946 E.01594
G1 X119.796 Y123.622 E.01409
; WIPE_START
G1 F3360
M204 S6000
G1 X119.518 Y123.118 E-.21886
G1 X119.434 Y122.589 E-.20346
G1 X119.434 Y121.7 E-.33768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 15 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer15 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X119.705 Y121.7 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192251
G1 F2446
M204 S6000
G1 X119.705 Y109.228 E.15177
; LINE_WIDTH: 0.208637
G1 X119.721 Y109.031 E.00266
; LINE_WIDTH: 0.23955
G1 X119.736 Y108.835 E.00316
; LINE_WIDTH: 0.255542
G3 X119.766 Y108.667 I1.077 J.101 E.00296
; LINE_WIDTH: 0.282954
G1 X119.81 Y108.529 E.00283
; LINE_WIDTH: 0.328182
G1 X119.855 Y108.392 E.00336
; LINE_WIDTH: 0.368856
G1 X119.981 Y108.145 E.00735
G3 X120.445 Y107.681 I1.72 J1.256 E.01753
; LINE_WIDTH: 0.343035
G3 X120.829 Y107.51 I.729 J1.126 E.01031
; LINE_WIDTH: 0.282951
G1 X120.967 Y107.466 E.00283
; LINE_WIDTH: 0.246982
G3 X121.331 Y107.421 I.447 J2.136 E.00611
; LINE_WIDTH: 0.208635
G1 X121.528 Y107.405 E.00266
; LINE_WIDTH: 0.192497
G1 X134.46 Y107.405 E.15763
G1 X134.669 Y107.421 E.00254
; LINE_WIDTH: 0.239552
M73 P81 R2
G1 X134.865 Y107.436 E.00316
; LINE_WIDTH: 0.267748
G3 X135.168 Y107.509 I-.108 J1.11 E.00572
; LINE_WIDTH: 0.326746
G1 X135.302 Y107.553 E.00327
; LINE_WIDTH: 0.368731
G3 X135.662 Y107.754 I-1.284 J2.723 E.01093
G1 X135.946 Y108.038 E.01069
G3 X136.019 Y108.145 I-.647 J.52 E.00344
; LINE_WIDTH: 0.343035
G3 X136.19 Y108.529 I-1.126 J.729 E.01031
; LINE_WIDTH: 0.282951
G1 X136.234 Y108.667 E.00283
; LINE_WIDTH: 0.246982
G3 X136.279 Y109.031 I-2.136 J.447 E.00611
; LINE_WIDTH: 0.208635
G1 X136.295 Y109.228 E.00266
; LINE_WIDTH: 0.192497
G1 X136.295 Y122.161 E.15763
G1 X136.279 Y122.369 E.00254
; LINE_WIDTH: 0.23955
G1 X136.264 Y122.565 E.00316
; LINE_WIDTH: 0.255542
G3 X136.234 Y122.733 I-1.077 J-.101 E.00296
; LINE_WIDTH: 0.282954
G1 X136.19 Y122.871 E.00283
; LINE_WIDTH: 0.328182
G1 X136.145 Y123.008 E.00336
; LINE_WIDTH: 0.368853
G3 X135.946 Y123.362 I-1.425 J-.568 E.0108
G1 X135.662 Y123.646 E.01069
G3 X135.555 Y123.719 I-.52 J-.647 E.00345
; LINE_WIDTH: 0.343035
G3 X135.171 Y123.89 I-.729 J-1.126 E.01031
; LINE_WIDTH: 0.282951
G1 X135.033 Y123.934 E.00283
; LINE_WIDTH: 0.246982
G3 X134.669 Y123.979 I-.447 J-2.136 E.00611
; LINE_WIDTH: 0.208635
G1 X134.472 Y123.995 E.00266
; LINE_WIDTH: 0.192497
G1 X121.539 Y123.995 E.15763
G1 X121.331 Y123.979 E.00254
; LINE_WIDTH: 0.23955
G1 X121.135 Y123.964 E.00316
; LINE_WIDTH: 0.255542
G3 X120.967 Y123.934 I.101 J-1.077 E.00296
; LINE_WIDTH: 0.282954
G1 X120.829 Y123.89 E.00283
; LINE_WIDTH: 0.328182
G1 X120.692 Y123.845 E.00336
; LINE_WIDTH: 0.368853
G3 X120.338 Y123.646 I.568 J-1.425 E.0108
G1 X120.054 Y123.362 E.01069
G3 X119.981 Y123.255 I.647 J-.52 E.00345
; LINE_WIDTH: 0.343035
G3 X119.81 Y122.871 I1.126 J-.729 E.01031
; LINE_WIDTH: 0.282951
G1 X119.766 Y122.733 E.00283
; LINE_WIDTH: 0.246982
G3 X119.721 Y122.369 I2.136 J-.447 E.00611
; LINE_WIDTH: 0.208635
G1 X119.705 Y122.172 E.00266
; LINE_WIDTH: 0.192251
G1 X119.705 Y121.76 E.00501
; WIPE_START
G1 F15000
G1 X119.705 Y119.76 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.78 Y115.14 Z3.4 F42000
G1 X126.723 Y114.423 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2446
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2446
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2446
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.93 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24092
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10746
G1 X129.915 Y114.423 E-.13181
G1 X129.451 Y114.423 E-.17635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2446
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.524 Y117.416 E.00803
G3 X129.277 Y117.608 I-.903 J-.902 E.0104
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.1318
G1 X129.524 Y117.416 E-.092
G1 X129.277 Y117.608 E-.11884
G1 X129.277 Y117.151 E-.17394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2446
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.992 E.02878
M204 S250
G1 X125.432 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2446
M204 S5000
G3 X126.952 Y113.223 I2.56 J-.816 E.12236
G3 X127.982 Y113.014 I1.029 J2.421 E.03253
G3 X125.451 Y116.574 I.01 J2.687 E.36205
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.348 Y116.13 E-.17321
G1 X125.315 Y115.866 E-.10116
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10813
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 16/36
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-1.031 J-.646 P1  F42000
G1 X120.202 Y123.134 Z3.4
G1 Z3.2
G1 E.8 F1800
G1 F2466
M204 S5000
G1 X119.968 Y122.675 E.01582
G1 X119.89 Y122.183 E.01531
G1 X119.89 Y109.217 E.39842
G1 X119.968 Y108.725 E.01531
G1 X120.202 Y108.266 E.01582
G1 X120.566 Y107.902 E.01582
G1 X121.025 Y107.668 E.01582
G1 X121.517 Y107.59 E.01531
G1 X134.483 Y107.59 E.39842
G1 X134.975 Y107.668 E.01531
G1 X135.434 Y107.902 E.01582
G1 X135.798 Y108.266 E.01582
G1 X136.032 Y108.725 E.01582
G1 X136.11 Y109.217 E.01531
G1 X136.11 Y122.183 E.39842
G1 X136.032 Y122.675 E.01531
G1 X135.798 Y123.134 E.01582
G1 X135.434 Y123.498 E.01582
G1 X134.975 Y123.732 E.01582
G1 X134.483 Y123.81 E.01531
G1 X121.517 Y123.81 E.39842
G1 X121.025 Y123.732 E.01531
G1 X120.566 Y123.498 E.01582
G1 X120.244 Y123.177 E.01398
M204 S250
G1 X119.679 Y123.647 F42000
G1 F2466
M204 S5000
G1 X119.439 Y123.176 E.01625
G1 X119.353 Y122.637 E.01676
G1 X119.353 Y108.763 E.42634
G1 X119.439 Y108.224 E.01676
G1 X119.679 Y107.753 E.01625
G1 X120.053 Y107.379 E.01625
G1 X120.524 Y107.139 E.01625
G1 X121.063 Y107.053 E.01676
G1 X134.937 Y107.053 E.42634
G1 X135.439 Y107.133 E.0156
G1 X135.476 Y107.139 E.00116
G1 X135.947 Y107.379 E.01625
G1 X136.321 Y107.753 E.01625
G1 X136.561 Y108.224 E.01625
G1 X136.647 Y108.763 E.01676
G1 X136.647 Y122.637 E.42634
G1 X136.561 Y123.176 E.01676
G1 X136.321 Y123.647 E.01625
G1 X135.947 Y124.021 E.01625
G1 X135.476 Y124.261 E.01625
G1 X134.937 Y124.347 E.01676
G1 X121.063 Y124.347 E.42634
G1 X120.524 Y124.261 E.01676
G1 X120.053 Y124.021 E.01625
G1 X119.721 Y123.69 E.0144
; WIPE_START
G1 F3360
M204 S6000
G1 X119.439 Y123.176 E-.22272
G1 X119.353 Y122.637 E-.20733
G1 X119.353 Y121.769 E-.32996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 16 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
M73 P82 R2
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer16 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X119.622 Y121.769 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187621
G1 F2466
M204 S6000
G1 X119.622 Y109.19 E.14832
; LINE_WIDTH: 0.204413
G1 X119.638 Y108.988 E.00267
; LINE_WIDTH: 0.236197
G1 X119.654 Y108.786 E.00319
; LINE_WIDTH: 0.252587
G3 X119.684 Y108.615 I1.095 J.102 E.00298
; LINE_WIDTH: 0.280502
G1 X119.729 Y108.474 E.00287
; LINE_WIDTH: 0.32682
G1 X119.775 Y108.333 E.00343
; LINE_WIDTH: 0.368439
G3 X119.979 Y107.971 I1.454 J.579 E.01106
G1 X120.271 Y107.679 E.01095
G3 X120.379 Y107.604 I.53 J.659 E.0035
; LINE_WIDTH: 0.342053
G3 X120.774 Y107.429 I.749 J1.157 E.01056
; LINE_WIDTH: 0.280495
G1 X120.915 Y107.384 E.00287
; LINE_WIDTH: 0.243772
G3 X121.288 Y107.338 I.46 J2.206 E.00616
; LINE_WIDTH: 0.204405
G1 X121.49 Y107.322 E.00266
; LINE_WIDTH: 0.187878
G1 X134.499 Y107.322 E.15366
G1 X134.712 Y107.338 E.00253
; LINE_WIDTH: 0.2362
G1 X134.914 Y107.354 E.00319
; LINE_WIDTH: 0.25258
G3 X135.085 Y107.384 I-.103 J1.1 E.00298
; LINE_WIDTH: 0.28
G1 X135.223 Y107.428 E.0028
; LINE_WIDTH: 0.325331
G1 X135.361 Y107.473 E.00333
; LINE_WIDTH: 0.367857
G3 X135.73 Y107.679 I-.583 J1.478 E.01122
G1 X136.021 Y107.971 E.01092
G3 X136.096 Y108.08 I-.66 J.531 E.0035
; LINE_WIDTH: 0.342048
G3 X136.271 Y108.474 I-1.157 J.749 E.01056
; LINE_WIDTH: 0.280489
G1 X136.316 Y108.615 E.00287
; LINE_WIDTH: 0.24377
G3 X136.362 Y108.988 I-2.206 J.46 E.00616
; LINE_WIDTH: 0.204405
G1 X136.378 Y109.19 E.00266
; LINE_WIDTH: 0.187878
G1 X136.378 Y122.199 E.15366
G1 X136.362 Y122.412 E.00253
; LINE_WIDTH: 0.236197
G1 X136.346 Y122.614 E.00319
; LINE_WIDTH: 0.252587
G3 X136.316 Y122.785 I-1.095 J-.102 E.00298
; LINE_WIDTH: 0.280502
G1 X136.271 Y122.926 E.00287
; LINE_WIDTH: 0.32682
G1 X136.225 Y123.067 E.00343
; LINE_WIDTH: 0.368439
G3 X136.021 Y123.429 I-1.454 J-.579 E.01106
G1 X135.729 Y123.721 E.01095
G3 X135.62 Y123.796 I-.53 J-.659 E.0035
; LINE_WIDTH: 0.342053
G3 X135.226 Y123.971 I-.749 J-1.157 E.01056
; LINE_WIDTH: 0.280495
G1 X135.085 Y124.016 E.00287
; LINE_WIDTH: 0.243772
G3 X134.712 Y124.062 I-.46 J-2.206 E.00616
; LINE_WIDTH: 0.204405
G1 X134.51 Y124.078 E.00266
; LINE_WIDTH: 0.187878
G1 X121.501 Y124.078 E.15366
G1 X121.288 Y124.062 E.00253
; LINE_WIDTH: 0.236197
G1 X121.086 Y124.046 E.00319
; LINE_WIDTH: 0.252587
G3 X120.915 Y124.016 I.102 J-1.095 E.00298
; LINE_WIDTH: 0.280502
G1 X120.774 Y123.971 E.00287
; LINE_WIDTH: 0.32682
G1 X120.633 Y123.925 E.00343
; LINE_WIDTH: 0.368439
G3 X120.271 Y123.721 I.579 J-1.454 E.01106
G1 X119.979 Y123.429 E.01095
G3 X119.904 Y123.321 I.659 J-.53 E.0035
; LINE_WIDTH: 0.342053
G3 X119.729 Y122.926 I1.157 J-.749 E.01056
; LINE_WIDTH: 0.280495
G1 X119.684 Y122.785 E.00287
; LINE_WIDTH: 0.243772
G3 X119.638 Y122.412 I2.206 J-.46 E.00616
; LINE_WIDTH: 0.204405
G1 X119.622 Y122.21 E.00266
; LINE_WIDTH: 0.187621
G1 X119.622 Y121.829 E.00449
; WIPE_START
G1 F15000
G1 X119.622 Y119.829 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.695 Y115.206 Z3.6 F42000
G1 X126.723 Y114.423 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2466
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2466
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2466
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2466
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.0115
G1 X129.533 Y117.407 E.0076
G3 X129.277 Y117.608 I-.942 J-.933 E.01083
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13178
G1 X129.533 Y117.407 E-.08709
G1 X129.277 Y117.608 E-.12375
G1 X129.277 Y117.15 E-.17397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F2466
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.285 J-2.993 E.02878
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2466
M204 S5000
G3 X126.952 Y113.223 I2.56 J-.816 E.12239
G3 X127.995 Y113.014 I1.026 J2.415 E.03293
G3 X125.45 Y116.574 I-.004 J2.687 E.36163
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.347 Y116.117 E-.17814
G1 X125.315 Y115.866 E-.09623
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10812
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 17/36
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-1.029 J-.649 P1  F42000
G1 X120.125 Y123.2 Z3.6
G1 Z3.4
G1 E.8 F1800
G1 F2484
M204 S5000
G1 X119.885 Y122.728 E.01628
G1 X119.804 Y122.221 E.01577
G1 X119.804 Y109.179 E.40076
G1 X119.885 Y108.672 E.01577
G1 X120.125 Y108.2 E.01628
G1 X120.5 Y107.825 E.01628
G1 X120.972 Y107.585 E.01628
G1 X121.479 Y107.504 E.01577
G1 X134.521 Y107.504 E.40076
G1 X135.028 Y107.585 E.01577
G1 X135.5 Y107.825 E.01628
G1 X135.875 Y108.2 E.01628
G1 X136.115 Y108.672 E.01628
G1 X136.196 Y109.179 E.01577
G1 X136.196 Y122.221 E.40076
G1 X136.115 Y122.728 E.01577
G1 X135.875 Y123.2 E.01628
G1 X135.5 Y123.575 E.01628
M73 P83 R2
G1 X135.028 Y123.815 E.01628
G1 X134.521 Y123.896 E.01577
G1 X121.479 Y123.896 E.40076
G1 X120.972 Y123.815 E.01577
G1 X120.5 Y123.575 E.01628
G1 X120.168 Y123.243 E.01444
M204 S250
G1 X119.604 Y123.715 F42000
G1 F2484
M204 S5000
G1 X119.359 Y123.235 E.01656
G1 X119.272 Y122.686 E.01708
G1 X119.272 Y108.714 E.42933
G1 X119.359 Y108.165 E.01708
G1 X119.604 Y107.685 E.01656
G1 X119.985 Y107.304 E.01656
G1 X120.465 Y107.059 E.01656
G1 X121.014 Y106.972 E.01708
G1 X134.986 Y106.972 E.42933
G1 X135.521 Y107.057 E.01664
G1 X136.015 Y107.304 E.01697
G1 X136.396 Y107.685 E.01656
G1 X136.641 Y108.165 E.01656
G1 X136.728 Y108.714 E.01708
G1 X136.728 Y122.686 E.42933
G1 X136.641 Y123.235 E.01708
G1 X136.396 Y123.715 E.01656
G1 X136.015 Y124.096 E.01656
G1 X135.535 Y124.341 E.01656
G1 X134.986 Y124.428 E.01708
G1 X121.014 Y124.428 E.42933
G1 X120.465 Y124.341 E.01708
G1 X119.985 Y124.096 E.01656
G1 X119.646 Y123.758 E.01472
; WIPE_START
G1 F3360
M204 S6000
G1 X119.359 Y123.235 E-.22659
G1 X119.272 Y122.686 E-.21117
G1 X119.272 Y121.838 E-.32224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 17 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer17 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X119.539 Y121.838 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182991
G1 F2484
M204 S6000
G1 X119.539 Y109.152 E.1448
; LINE_WIDTH: 0.200182
G1 X119.555 Y108.945 E.00267
; LINE_WIDTH: 0.232824
G1 X119.571 Y108.737 E.00322
; LINE_WIDTH: 0.249636
G3 X119.602 Y108.563 I1.117 J.104 E.00299
; LINE_WIDTH: 0.278043
G1 X119.648 Y108.418 E.0029
; LINE_WIDTH: 0.325461
G1 X119.695 Y108.274 E.00349
; LINE_WIDTH: 0.368038
G3 X119.904 Y107.903 I1.485 J.59 E.01132
G1 X120.203 Y107.604 E.0112
G3 X120.314 Y107.528 I.541 J.672 E.00356
; LINE_WIDTH: 0.341084
G3 X120.718 Y107.348 I.77 J1.188 E.01081
; LINE_WIDTH: 0.278052
G1 X120.863 Y107.302 E.0029
; LINE_WIDTH: 0.240576
G3 X121.245 Y107.255 I.472 J2.278 E.00621
; LINE_WIDTH: 0.200183
G1 X121.452 Y107.239 E.00267
; LINE_WIDTH: 0.18326
G1 X134.537 Y107.238 E.14963
G1 X134.755 Y107.255 E.00251
; LINE_WIDTH: 0.232827
G1 X134.963 Y107.271 E.00322
; LINE_WIDTH: 0.249636
G3 X135.137 Y107.302 I-.104 J1.117 E.00299
; LINE_WIDTH: 0.278041
G1 X135.282 Y107.348 E.0029
; LINE_WIDTH: 0.325461
G1 X135.426 Y107.395 E.00349
; LINE_WIDTH: 0.368039
G3 X135.797 Y107.604 I-.59 J1.485 E.01132
G1 X136.096 Y107.903 E.0112
G3 X136.172 Y108.014 I-.672 J.541 E.00356
; LINE_WIDTH: 0.341086
G3 X136.352 Y108.418 I-1.188 J.77 E.01081
; LINE_WIDTH: 0.278051
G1 X136.398 Y108.563 E.0029
; LINE_WIDTH: 0.240575
G3 X136.445 Y108.945 I-2.278 J.472 E.00621
; LINE_WIDTH: 0.200183
G1 X136.461 Y109.152 E.00267
; LINE_WIDTH: 0.18326
G1 X136.462 Y122.237 E.14963
G1 X136.445 Y122.455 E.00251
; LINE_WIDTH: 0.232824
G1 X136.429 Y122.663 E.00322
; LINE_WIDTH: 0.249636
G3 X136.398 Y122.837 I-1.117 J-.104 E.00299
; LINE_WIDTH: 0.278043
G1 X136.352 Y122.982 E.0029
; LINE_WIDTH: 0.325461
G1 X136.305 Y123.126 E.00349
; LINE_WIDTH: 0.368038
G3 X136.096 Y123.497 I-1.485 J-.59 E.01132
G1 X135.797 Y123.796 E.0112
G3 X135.686 Y123.872 I-.541 J-.672 E.00356
; LINE_WIDTH: 0.341084
G3 X135.282 Y124.052 I-.77 J-1.188 E.01081
; LINE_WIDTH: 0.278052
G1 X135.137 Y124.098 E.0029
; LINE_WIDTH: 0.240576
G3 X134.755 Y124.145 I-.472 J-2.278 E.00621
; LINE_WIDTH: 0.200183
G1 X134.548 Y124.161 E.00267
; LINE_WIDTH: 0.18326
G1 X121.463 Y124.162 E.14963
G1 X121.245 Y124.145 E.00251
; LINE_WIDTH: 0.232824
G1 X121.037 Y124.129 E.00322
; LINE_WIDTH: 0.249636
G3 X120.863 Y124.098 I.104 J-1.117 E.00299
; LINE_WIDTH: 0.278043
G1 X120.718 Y124.052 E.0029
; LINE_WIDTH: 0.325461
G1 X120.574 Y124.005 E.00349
; LINE_WIDTH: 0.368038
G3 X120.203 Y123.796 I.59 J-1.485 E.01132
G1 X119.904 Y123.497 E.0112
G3 X119.828 Y123.386 I.672 J-.541 E.00356
; LINE_WIDTH: 0.341084
G3 X119.648 Y122.982 I1.188 J-.77 E.01081
; LINE_WIDTH: 0.278052
G1 X119.602 Y122.837 E.0029
; LINE_WIDTH: 0.240576
G3 X119.555 Y122.455 I2.278 J-.472 E.00621
; LINE_WIDTH: 0.200183
G1 X119.539 Y122.248 E.00267
; LINE_WIDTH: 0.182991
G1 X119.539 Y121.898 E.00399
; WIPE_START
G1 F15000
G1 X119.539 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.609 Y115.272 Z3.8 F42000
G1 X126.723 Y114.423 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2484
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2484
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2484
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10344
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13178
G1 X129.451 Y114.423 E-.17637
; WIPE_END
M73 P84 R2
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2484
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.542 Y117.398 E.00717
G3 X129.277 Y117.608 I-.986 J-.969 E.01126
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.1318
G1 X129.542 Y117.398 E-.08211
G1 X129.277 Y117.608 E-.12869
G1 X129.277 Y117.151 E-.17397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2484
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.101 Y117.023 I2.955 J-3.676 E.02875
M204 S250
G1 X125.442 Y116.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2484
M204 S5000
G3 X128.008 Y113.014 I2.559 J-.814 E.15524
G3 X127.499 Y118.338 I-.009 J2.685 E.27442
G3 X125.461 Y116.571 I.503 J-2.638 E.08685
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.345 Y116.104 E-.18275
G1 X125.315 Y115.866 E-.09129
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12586
G1 X125.437 Y114.885 E-.12583
G1 X125.54 Y114.619 E-.10845
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 18/36
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-1.027 J-.652 P1  F42000
G1 X120.048 Y123.266 Z3.8
G1 Z3.6
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X119.801 Y122.781 E.01674
G1 X119.719 Y122.259 E.01623
G1 X119.719 Y109.141 E.4031
G1 X119.801 Y108.619 E.01623
G1 X120.048 Y108.134 E.01674
G1 X120.434 Y107.749 E.01674
G1 X120.919 Y107.501 E.01674
G1 X121.441 Y107.419 E.01623
G1 X134.559 Y107.419 E.4031
G1 X135.081 Y107.501 E.01623
G1 X135.566 Y107.749 E.01674
G1 X135.952 Y108.134 E.01674
G1 X136.199 Y108.619 E.01674
G1 X136.281 Y109.141 E.01623
G1 X136.281 Y122.259 E.4031
G1 X136.199 Y122.781 E.01623
G1 X135.952 Y123.266 E.01674
G1 X135.566 Y123.652 E.01674
G1 X135.081 Y123.899 E.01674
G1 X134.559 Y123.981 E.01623
G1 X121.441 Y123.981 E.4031
G1 X120.919 Y123.899 E.01623
G1 X120.434 Y123.652 E.01674
G1 X120.091 Y123.309 E.0149
M204 S250
G1 X119.528 Y123.781 F42000
G1 F2500
M204 S5000
G1 X119.28 Y123.294 E.01682
G1 X119.191 Y122.735 E.01739
G1 X119.191 Y108.665 E.43232
G1 X119.28 Y108.106 E.01739
G1 X119.529 Y107.617 E.01687
G1 X119.917 Y107.229 E.01687
G1 X120.406 Y106.98 E.01687
G1 X120.965 Y106.891 E.01739
G1 X135.035 Y106.891 E.43232
G1 X135.594 Y106.98 E.01739
G1 X136.083 Y107.229 E.01687
G1 X136.471 Y107.617 E.01687
G1 X136.72 Y108.106 E.01687
G1 X136.809 Y108.665 E.01739
G1 X136.809 Y122.735 E.43232
G1 X136.72 Y123.294 E.01739
G1 X136.471 Y123.783 E.01687
G1 X136.083 Y124.171 E.01687
G1 X135.594 Y124.42 E.01687
G1 X135.035 Y124.509 E.01739
G1 X120.965 Y124.509 E.43232
G1 X120.406 Y124.42 E.01739
G1 X119.917 Y124.171 E.01687
G1 X119.57 Y123.824 E.01508
; WIPE_START
G1 F3360
M204 S6000
G1 X119.28 Y123.294 E-.22983
G1 X119.191 Y122.735 E-.21502
G1 X119.191 Y121.905 E-.31515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 18 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer18 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X119.455 Y121.905 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.178351
G1 F2500
M204 S6000
G1 X119.455 Y109.115 E.14116
; LINE_WIDTH: 0.195945
G1 X119.472 Y108.902 E.00266
; LINE_WIDTH: 0.229473
G1 X119.489 Y108.689 E.00325
; LINE_WIDTH: 0.246681
G3 X119.52 Y108.51 I1.144 J.106 E.00301
; LINE_WIDTH: 0.275593
G1 X119.567 Y108.363 E.00294
; LINE_WIDTH: 0.324121
G1 X119.615 Y108.215 E.00355
; LINE_WIDTH: 0.36763
G3 X119.829 Y107.835 I1.515 J.6 E.01157
G1 X120.135 Y107.529 E.01146
G3 X120.248 Y107.452 I.55 J.683 E.00361
; LINE_WIDTH: 0.340105
G3 X120.663 Y107.268 I.79 J1.219 E.01105
; LINE_WIDTH: 0.275582
G1 X120.81 Y107.22 E.00294
; LINE_WIDTH: 0.237363
G3 X121.202 Y107.172 I.484 J2.349 E.00625
; LINE_WIDTH: 0.195954
G1 X121.415 Y107.155 E.00266
; LINE_WIDTH: 0.178632
G1 X134.575 Y107.155 E.14554
G1 X134.798 Y107.172 E.00248
; LINE_WIDTH: 0.229461
G1 X135.011 Y107.189 E.00325
; LINE_WIDTH: 0.246696
G3 X135.19 Y107.22 I-.105 J1.138 E.00301
; LINE_WIDTH: 0.275598
G1 X135.337 Y107.268 E.00294
; LINE_WIDTH: 0.324122
G1 X135.485 Y107.315 E.00355
; LINE_WIDTH: 0.367628
G3 X135.865 Y107.529 I-.601 J1.515 E.01158
G1 X136.171 Y107.835 E.01146
G3 X136.248 Y107.948 I-.683 J.55 E.00361
; LINE_WIDTH: 0.340105
G3 X136.432 Y108.363 I-1.219 J.79 E.01105
; LINE_WIDTH: 0.275582
G1 X136.48 Y108.51 E.00294
; LINE_WIDTH: 0.237363
G3 X136.528 Y108.902 I-2.349 J.484 E.00625
; LINE_WIDTH: 0.195954
G1 X136.545 Y109.115 E.00266
; LINE_WIDTH: 0.178632
G1 X136.545 Y122.275 E.14554
G1 X136.528 Y122.498 E.00248
; LINE_WIDTH: 0.229473
G1 X136.511 Y122.711 E.00325
; LINE_WIDTH: 0.246681
G3 X136.48 Y122.89 I-1.144 J-.106 E.00301
; LINE_WIDTH: 0.275593
G1 X136.432 Y123.037 E.00294
; LINE_WIDTH: 0.324121
G1 X136.385 Y123.185 E.00355
; LINE_WIDTH: 0.367629
G3 X136.171 Y123.565 I-1.515 J-.6 E.01157
G1 X135.865 Y123.871 E.01146
G3 X135.752 Y123.948 I-.55 J-.682 E.00361
; LINE_WIDTH: 0.340115
G3 X135.337 Y124.133 I-.789 J-1.218 E.01105
; LINE_WIDTH: 0.275595
G1 X135.19 Y124.18 E.00294
; LINE_WIDTH: 0.237377
G3 X134.798 Y124.228 I-.484 J-2.349 E.00625
; LINE_WIDTH: 0.195959
G1 X134.585 Y124.245 E.00266
; LINE_WIDTH: 0.178632
G1 X121.425 Y124.245 E.14554
G1 X121.202 Y124.228 E.00248
; LINE_WIDTH: 0.229468
G1 X120.989 Y124.211 E.00325
; LINE_WIDTH: 0.246697
G3 X120.81 Y124.18 I.105 J-1.138 E.00301
; LINE_WIDTH: 0.275606
G1 X120.663 Y124.133 E.00294
; LINE_WIDTH: 0.324128
G1 X120.515 Y124.085 E.00355
; LINE_WIDTH: 0.367628
G3 X120.135 Y123.871 I.6 J-1.515 E.01157
G1 X119.829 Y123.565 E.01146
G3 X119.752 Y123.452 I.683 J-.55 E.00361
; LINE_WIDTH: 0.340105
G3 X119.567 Y123.037 I1.219 J-.79 E.01105
; LINE_WIDTH: 0.275582
G1 X119.52 Y122.89 E.00294
; LINE_WIDTH: 0.237363
G3 X119.472 Y122.498 I2.349 J-.484 E.00625
; LINE_WIDTH: 0.195954
G1 X119.455 Y122.285 E.00266
; LINE_WIDTH: 0.178351
M73 P84 R1
G1 X119.455 Y121.965 E.00353
; WIPE_START
G1 F15000
G1 X119.455 Y119.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y115.337 Z4 F42000
G1 X126.723 Y114.423 Z4
G1 Z3.6
M73 P85 R1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2500
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.552 Y117.389 E.00673
G3 X129.277 Y117.608 I-1.026 J-1.002 E.01169
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.552 Y117.389 E-.07715
G1 X129.277 Y117.608 E-.1336
G1 X129.277 Y117.15 E-.17401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F2500
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.44 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G3 X128.021 Y113.015 I2.558 J-.815 E.15573
G3 X127.486 Y118.336 I-.022 J2.685 E.27441
G3 X125.459 Y116.571 I.512 J-2.636 E.08648
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14853
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10812
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 19/36
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I-1.025 J-.656 P1  F42000
G1 X119.97 Y123.329 Z4
G1 Z3.8
G1 E.8 F1800
G1 F2518
M204 S5000
G1 X119.718 Y122.834 E.01708
G1 X119.633 Y122.297 E.01668
G1 X119.633 Y109.103 E.40544
G1 X119.718 Y108.566 E.01668
G1 X119.972 Y108.068 E.0172
G1 X120.368 Y107.672 E.0172
G1 X120.866 Y107.418 E.0172
G1 X121.403 Y107.333 E.01668
G1 X134.597 Y107.333 E.40544
G1 X135.134 Y107.418 E.01668
G1 X135.632 Y107.672 E.0172
G1 X136.028 Y108.068 E.0172
G1 X136.282 Y108.566 E.0172
G1 X136.367 Y109.103 E.01668
G1 X136.367 Y122.297 E.40544
G1 X136.282 Y122.834 E.01668
G1 X136.028 Y123.332 E.0172
G1 X135.632 Y123.728 E.0172
G1 X135.134 Y123.982 E.0172
G1 X134.597 Y124.067 E.01668
G1 X121.403 Y124.067 E.40544
G1 X120.866 Y123.982 E.01668
G1 X120.368 Y123.728 E.0172
G1 X120.012 Y123.372 E.01546
M204 S250
G1 X119.451 Y123.844 F42000
G1 F2518
M204 S5000
G1 X119.2 Y123.352 E.01695
G1 X119.11 Y122.783 E.0177
G1 X119.11 Y108.617 E.43531
G1 X119.2 Y108.048 E.0177
G1 X119.454 Y107.549 E.01718
G1 X119.849 Y107.154 E.01718
G1 X120.348 Y106.9 E.01718
G1 X120.917 Y106.81 E.0177
G1 X135.083 Y106.81 E.43531
G1 X135.652 Y106.9 E.0177
G1 X136.151 Y107.154 E.01718
G1 X136.546 Y107.549 E.01718
G1 X136.8 Y108.048 E.01718
G1 X136.89 Y108.617 E.0177
G1 X136.89 Y122.783 E.43531
G1 X136.8 Y123.352 E.0177
G1 X136.546 Y123.851 E.01718
G1 X136.151 Y124.246 E.01718
G1 X135.652 Y124.5 E.01718
G1 X135.083 Y124.59 E.0177
G1 X120.917 Y124.59 E.43531
G1 X120.348 Y124.5 E.0177
G1 X119.849 Y124.246 E.01718
G1 X119.491 Y123.888 E.01557
; WIPE_START
G1 F3360
M204 S6000
G1 X119.2 Y123.352 E-.23154
G1 X119.11 Y122.783 E-.21888
G1 X119.11 Y121.969 E-.30958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 19 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer19 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X119.372 Y121.969 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.173721
G1 F2518
M204 S6000
G1 X119.372 Y109.077 E.13741
; LINE_WIDTH: 0.191733
G1 X119.389 Y108.858 E.00266
; LINE_WIDTH: 0.226117
G1 X119.406 Y108.64 E.00327
; LINE_WIDTH: 0.243758
G3 X119.438 Y108.458 I1.16 J.107 E.00302
; LINE_WIDTH: 0.273149
G1 X119.487 Y108.308 E.00298
; LINE_WIDTH: 0.322761
G1 X119.536 Y108.157 E.00362
; LINE_WIDTH: 0.36723
G3 X119.754 Y107.767 I1.544 J.611 E.01183
G1 X120.067 Y107.454 E.01171
G3 X120.182 Y107.376 I.56 J.694 E.00367
; LINE_WIDTH: 0.339149
G3 X120.607 Y107.187 I.81 J1.25 E.01129
; LINE_WIDTH: 0.273157
G1 X120.758 Y107.138 E.00298
; LINE_WIDTH: 0.234175
G3 X121.158 Y107.089 I.497 J2.423 E.00629
; LINE_WIDTH: 0.191722
G1 X121.377 Y107.072 E.00266
; LINE_WIDTH: 0.174014
G1 X134.613 Y107.071 E.14139
G1 X134.842 Y107.089 E.00245
; LINE_WIDTH: 0.226117
G1 X135.06 Y107.106 E.00327
; LINE_WIDTH: 0.243758
G3 X135.242 Y107.138 I-.107 J1.16 E.00302
; LINE_WIDTH: 0.273149
G1 X135.393 Y107.187 E.00298
; LINE_WIDTH: 0.322761
G1 X135.543 Y107.236 E.00362
; LINE_WIDTH: 0.36723
G3 X135.933 Y107.454 I-.611 J1.544 E.01183
G1 X136.246 Y107.767 E.01171
G3 X136.324 Y107.882 I-.694 J.56 E.00367
; LINE_WIDTH: 0.339149
G3 X136.513 Y108.308 I-1.25 J.81 E.01129
; LINE_WIDTH: 0.273157
G1 X136.562 Y108.458 E.00298
; LINE_WIDTH: 0.234175
G3 X136.611 Y108.858 I-2.423 J.497 E.00629
; LINE_WIDTH: 0.191722
G1 X136.628 Y109.077 E.00266
; LINE_WIDTH: 0.174014
G1 X136.629 Y122.313 E.14139
G1 X136.611 Y122.542 E.00245
; LINE_WIDTH: 0.226117
G1 X136.594 Y122.76 E.00327
; LINE_WIDTH: 0.243758
G3 X136.562 Y122.942 I-1.16 J-.107 E.00302
; LINE_WIDTH: 0.273149
G1 X136.513 Y123.093 E.00298
; LINE_WIDTH: 0.322761
G1 X136.464 Y123.243 E.00362
; LINE_WIDTH: 0.36723
G3 X136.246 Y123.633 I-1.544 J-.611 E.01183
G1 X135.933 Y123.946 E.01171
G3 X135.818 Y124.024 I-.56 J-.694 E.00367
; LINE_WIDTH: 0.339149
G3 X135.393 Y124.213 I-.81 J-1.25 E.01129
; LINE_WIDTH: 0.273157
G1 X135.242 Y124.262 E.00298
; LINE_WIDTH: 0.234175
G3 X134.842 Y124.311 I-.497 J-2.423 E.00629
; LINE_WIDTH: 0.191722
G1 X134.623 Y124.328 E.00266
; LINE_WIDTH: 0.174014
G1 X121.387 Y124.329 E.14139
G1 X121.158 Y124.311 E.00245
; LINE_WIDTH: 0.226117
G1 X120.94 Y124.294 E.00327
; LINE_WIDTH: 0.243758
G3 X120.758 Y124.262 I.107 J-1.16 E.00302
; LINE_WIDTH: 0.273149
G1 X120.607 Y124.213 E.00298
; LINE_WIDTH: 0.322761
G1 X120.457 Y124.164 E.00362
; LINE_WIDTH: 0.36723
G3 X120.067 Y123.946 I.611 J-1.544 E.01183
G1 X119.754 Y123.633 E.01171
G3 X119.676 Y123.518 I.694 J-.56 E.00367
; LINE_WIDTH: 0.339149
G3 X119.487 Y123.093 I1.25 J-.81 E.01129
; LINE_WIDTH: 0.273157
G1 X119.438 Y122.942 E.00298
; LINE_WIDTH: 0.234175
G3 X119.389 Y122.542 I2.423 J-.497 E.00629
; LINE_WIDTH: 0.191722
G1 X119.372 Y122.323 E.00266
; LINE_WIDTH: 0.173721
G1 X119.372 Y122.029 E.00314
; WIPE_START
M73 P86 R1
G1 F15000
G1 X119.372 Y120.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.441 Y115.401 Z4.2 F42000
G1 X126.723 Y114.423 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2518
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2518
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2518
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10344
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13178
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2518
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.561 Y117.38 E.0063
G3 X129.277 Y117.608 I-1.065 J-1.032 E.01212
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.561 Y117.38 E-.07222
G1 X129.277 Y117.608 E-.1385
G1 X129.277 Y117.15 E-.17403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2518
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01406
G1 X126.103 Y117.021 E.0147
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2518
M204 S5000
G3 X126.655 Y113.371 I2.56 J-.816 E.11217
G3 X128.034 Y113.015 I1.354 J2.4 E.04425
G3 X125.45 Y116.574 I-.043 J2.686 E.36042
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14868
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10797
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 20/36
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S204
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.2 J1.2 P1  F42000
G1 X126.723 Y114.423 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.57 Y117.371 E.00587
G3 X129.277 Y117.608 I-1.106 J-1.064 E.01255
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.57 Y117.371 E-.06728
G1 X129.277 Y117.608 E-.14341
G1 X129.277 Y117.15 E-.17407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.101 Y117.023 I2.836 J-3.555 E.02875
M204 S250
G1 X125.442 Y116.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X128.047 Y113.016 I2.558 J-.814 E.15642
G3 X127.461 Y118.33 I-.043 J2.685 E.27473
G3 X125.461 Y116.571 I.54 J-2.63 E.08564
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14849
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12586
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 20 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer20 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 21/36
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.58 Y117.362 E.00545
G3 X129.277 Y117.608 I-1.147 J-1.098 E.01298
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.1318
G1 X129.58 Y117.362 E-.06239
G1 X129.277 Y117.608 E-.14831
G1 X129.277 Y117.15 E-.17408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z4.6 F42000
G1 Z4.2
M73 P87 R1
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.442 Y116.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X128.06 Y113.016 I2.558 J-.814 E.15682
G3 X127.448 Y118.327 I-.055 J2.684 E.27472
G3 X125.461 Y116.571 I.552 J-2.627 E.08524
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14849
G1 X125.339 Y116.052 E-.05429
G1 X125.315 Y115.866 E-.07156
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 21 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer21 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 22/36
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.589 Y117.353 E.00501
G3 X129.277 Y117.608 I-1.19 J-1.132 E.01341
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.589 Y117.353 E-.05742
G1 X129.277 Y117.608 E-.15325
G1 X129.277 Y117.15 E-.1741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.101 Y117.023 I2.749 J-3.466 E.02875
M204 S250
G1 X125.437 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X128.073 Y113.016 I2.557 J-.816 E.15743
G3 X129.862 Y117.634 I-.065 J2.681 E.19393
G3 X127.435 Y118.324 I-1.862 J-1.934 E.0807
G3 X125.456 Y116.572 I.559 J-2.625 E.08492
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14856
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P88 R1
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 22 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer22 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 23/36
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.598 Y117.344 E.00459
G3 X129.277 Y117.608 I-1.233 J-1.167 E.01384
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.1318
G1 X129.598 Y117.344 E-.05253
G1 X129.277 Y117.608 E-.15816
G1 X129.277 Y117.15 E-.17408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.439 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.514 Y113.464 I2.561 J-.812 E.10665
G3 X128.086 Y113.017 I1.452 J2.119 E.05109
G3 X125.458 Y116.572 I-.085 J2.686 E.35926
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14853
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 23 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer23 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 24/36
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.607 Y117.334 E.00415
G3 X129.277 Y117.608 I-1.27 J-1.196 E.01427
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.247 E-.13185
G1 X129.607 Y117.334 E-.04753
G1 X129.494 Y117.444 E-.05988
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.101 Y117.023 I2.674 J-3.389 E.02876
M204 S250
M73 P89 R1
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.655 Y113.371 I2.56 J-.815 E.11219
G3 X128.099 Y113.017 I1.351 J2.392 E.04625
G3 X125.449 Y116.574 I-.108 J2.685 E.35849
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14869
G1 X125.315 Y115.866 E-.12584
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 24 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer24 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 25/36
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.617 Y117.325 E.00372
G3 X129.277 Y117.608 I-1.312 J-1.23 E.0147
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.617 Y117.325 E-.04264
G1 X129.494 Y117.444 E-.06485
G1 X129.277 Y117.608 E-.10344
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.655 Y113.371 I2.561 J-.815 E.11218
G3 X128.112 Y113.018 I1.351 J2.393 E.04664
G3 X125.45 Y116.574 I-.12 J2.684 E.35811
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14869
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 25 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer25 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 26/36
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P90 R1
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.666 J-1.515 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13183
G1 X129.494 Y117.444 E-.10743
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.023 I2.591 J-3.305 E.02876
M204 S250
G1 X125.432 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.655 Y113.371 I2.56 J-.815 E.11216
G3 X128.125 Y113.018 I1.352 J2.394 E.04704
G3 X125.45 Y116.574 I-.133 J2.683 E.35765
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14865
G1 X125.315 Y115.866 E-.12584
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 26 start: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer26 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 27/36
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.343 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.671 J-1.52 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13184
G1 X129.494 Y117.444 E-.10743
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.023 I2.549 J-3.262 E.02876
M204 S250
G1 X125.432 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.655 Y113.371 I2.56 J-.816 E.11215
G3 X128.138 Y113.018 I1.353 J2.397 E.04744
G3 X125.451 Y116.574 I-.146 J2.683 E.35722
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14866
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
M73 P91 R1
G1 X125.356 Y115.206 E-.12585
G1 X125.41 Y114.992 E-.08388
G1 X125.541 Y114.62 E-.14994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 27 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer27 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 28/36
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.671 J-1.52 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10745
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.023 I2.511 J-3.223 E.02877
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.952 Y113.223 I2.56 J-.816 E.12239
G3 X128.151 Y113.019 I1.03 J2.425 E.03772
G3 X125.449 Y116.574 I-.16 J2.682 E.35684
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14868
G1 X125.327 Y115.962 E-.08883
G1 X125.315 Y115.534 E-.16262
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.619 E-.10818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 28 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer28 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 29/36
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
M73 P92 R1
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24094
G1 X129.494 Y113.956 E-.10347
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.451 Y114.423 E-.17632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.654 Y117.289 E.002
G3 X129.277 Y117.608 I-1.475 J-1.362 E.01642
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.1318
G1 X129.654 Y117.289 E-.02292
G1 X129.494 Y117.444 E-.08454
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.952 Y113.223 I2.56 J-.816 E.12237
G3 X128.164 Y113.019 I1.032 J2.43 E.03812
G3 X125.45 Y116.574 I-.172 J2.682 E.3565
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14868
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10797
; WIPE_END
M73 P92 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 29 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer29 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 30/36
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24094
G1 X129.494 Y113.956 E-.10345
G1 X129.697 Y114.153 E-.10747
G1 X129.915 Y114.423 E-.13182
G1 X129.451 Y114.423 E-.17632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.663 Y117.28 E.00157
G3 X129.277 Y117.608 I-1.52 J-1.399 E.01686
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.1318
G1 X129.663 Y117.28 E-.01798
G1 X129.494 Y117.444 E-.08954
G1 X129.277 Y117.608 E-.10343
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.992 E.02878
M204 S250
G1 X125.433 Y116.516 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X126.952 Y113.223 I2.559 J-.817 E.12232
G3 X128.177 Y113.02 I1.034 J2.436 E.03852
G3 X125.452 Y116.573 I-.184 J2.68 E.35594
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14863
G1 X125.324 Y115.936 E-.09869
G1 X125.315 Y115.534 E-.1528
G1 X125.356 Y115.206 E-.12585
G1 X125.42 Y114.954 E-.09868
G1 X125.541 Y114.619 E-.13535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P93 R0
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 30 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer30 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 31/36
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.93 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.10741
G1 X129.915 Y114.423 E-.13185
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.669 J-1.519 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13181
G1 X129.494 Y117.444 E-.10746
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01406
G1 X126.103 Y117.021 E.0147
M204 S250
G1 X125.431 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.264 Y113.113 I2.56 J-.817 E.13258
G3 X128.19 Y113.02 I.753 J2.844 E.02871
G3 X125.45 Y116.574 I-.198 J2.68 E.35566
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14868
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.10796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 31 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer31 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 32/36
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
M73 P94 R0
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10344
G1 X129.697 Y114.153 E-.10748
G1 X129.915 Y114.423 E-.13181
G1 X129.451 Y114.423 E-.17636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.67 J-1.519 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13181
G1 X129.494 Y117.444 E-.10748
G1 X129.277 Y117.608 E-.10345
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01406
G1 X126.103 Y117.021 E.0147
M204 S250
G1 X125.433 Y116.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.264 Y113.113 I2.56 J-.817 E.13253
G3 X128.203 Y113.02 I.756 J2.86 E.02911
G3 X125.452 Y116.574 I-.21 J2.679 E.35532
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14864
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12584
G1 X125.54 Y114.62 E-.108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 32 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer32 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 33/36
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.337 Y114.423 E.01916
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24091
G1 X129.494 Y113.956 E-.10346
G1 X129.697 Y114.153 E-.1074
G1 X129.915 Y114.423 E-.13186
G1 X129.451 Y114.423 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.671 J-1.52 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13184
G1 X129.494 Y117.444 E-.10743
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.992 E.02878
M204 S250
G1 X125.433 Y116.516 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.587 Y113.042 I2.559 J-.818 E.14274
G3 X128.216 Y113.021 I.4 J2.527 E.01937
G3 X125.452 Y116.573 I-.223 J2.677 E.35475
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14863
G1 X125.315 Y115.866 E-.12584
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.429 Y114.916 E-.11347
G1 X125.54 Y114.62 E-.1204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 33 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer33 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 34/36
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P95 R0
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.677 J1.932 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24096
G1 X129.494 Y113.956 E-.10349
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13184
G1 X129.451 Y114.423 E-.17628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.666 J-1.515 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13186
G1 X129.494 Y117.444 E-.10741
G1 X129.277 Y117.608 E-.10348
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.992 E.02878
M204 S250
G1 X125.437 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.587 Y113.042 I2.559 J-.818 E.14262
G3 X128.229 Y113.021 I.405 J2.579 E.01976
G3 X125.456 Y116.572 I-.233 J2.676 E.35439
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14853
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12582
G1 X125.356 Y115.206 E-.12585
G1 X125.437 Y114.885 E-.12581
G1 X125.54 Y114.619 E-.10814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 34 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer34 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 35/36
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.723 Y114.423 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.779 I2.801 J2.214 E.03069
G1 X126.723 Y114.363 E.01936
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y114.423 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.277 Y113.792 E.02094
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.337 Y114.423 E.01917
; WIPE_START
G1 F6000
G1 X129.277 Y113.792 E-.24094
G1 X129.494 Y113.956 E-.10349
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13182
M73 P96 R0
G1 X129.451 Y114.423 E-.17632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.667 J-1.516 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13183
G1 X129.494 Y117.444 E-.10746
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y116.977 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X126.723 Y116.977 E.02192
G1 X126.723 Y117.625 E.02148
G3 X126.1 Y117.024 I2.284 J-2.991 E.02878
M204 S250
G1 X125.436 Y116.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.587 Y113.042 I2.56 J-.817 E.14261
G3 X128.229 Y113.021 I.406 J2.583 E.01979
G3 X125.455 Y116.572 I-.234 J2.677 E.35449
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14833
G1 X125.318 Y115.884 E-.11868
G1 X125.316 Y115.534 E-.13319
G1 X125.356 Y115.206 E-.12557
G1 X125.432 Y114.903 E-.11871
G1 X125.54 Y114.619 E-.11553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 35 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer35 end: 47
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 36/36
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.115 Y114.815 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
G1 X127.115 Y116.585 E.04455
G1 X125.665 Y116.585 E.04455
G1 X125.665 Y114.815 E.05439
G1 X127.055 Y114.815 E.04271
; WIPE_START
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.436 Y116.516 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S5000
G3 X127.917 Y113.012 I2.561 J-.817 E.1528
G1 X128.242 Y113.022 E.00999
G3 X125.455 Y116.573 I-.245 J2.677 E.35431
; WIPE_START
G1 F3600
M204 S6000
G1 X125.356 Y116.194 E-.14861
G1 X125.315 Y115.866 E-.12585
G1 X125.315 Y115.534 E-.12581
G1 X125.356 Y115.206 E-.12585
G1 X125.435 Y114.891 E-.12344
G1 X125.54 Y114.62 E-.11044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 36 start: 47
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y128.73 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer36 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.908 Y113.859 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X126.159 Y114.608 E.03251
; WIPE_START
G1 F3000
M204 S6000
G1 X126.908 Y113.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.926 Y113.828 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.239627
G1 F1200
M204 S6000
G1 X126.816 Y113.624 E.00371
G2 X126.562 Y113.787 I.139 J.496 E.0049
; LINE_WIDTH: 0.27116
G2 X126.139 Y114.203 I3.1 J3.577 E.01104
; LINE_WIDTH: 0.241496
G2 X125.949 Y114.43 I1.618 J1.543 E.0048
G1 X125.926 Y114.517 E.00146
G1 X126.129 Y114.626 E.00374
; WIPE_START
G1 F15000
G1 X125.926 Y114.517 E-.28407
G1 X125.949 Y114.43 E-.11097
G1 X126.139 Y114.203 E-.36495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.387 Y117.58 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X126.908 Y117.059 E.02262
G1 X126.641 Y116.792
G1 X126.119 Y117.314 E.02266
; WIPE_START
G1 F3000
M204 S6000
G1 X126.641 Y116.792 E-.30288
G1 X126.908 Y117.059 E-.15483
G1 X126.387 Y117.58 E-.30229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.84 Y116.792 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X129.092 Y117.54 E.03251
; WIPE_START
G1 F3000
M204 S6000
G1 X129.84 Y116.792 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.871 Y116.774 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.238586
G1 F1200
M204 S6000
G1 X130.075 Y116.883 E.00368
G3 X129.958 Y117.085 I-.37 J-.078 E.00379
; LINE_WIDTH: 0.26384
M73 P97 R0
G3 X129.329 Y117.705 I-4.068 J-3.502 E.01592
; LINE_WIDTH: 0.238841
G3 X129.182 Y117.774 I-.178 J-.19 E.00262
G1 X129.074 Y117.57 E.00368
; WIPE_START
G1 F15000
G1 X129.182 Y117.774 E-.44714
G1 X129.329 Y117.705 E-.31286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.881 Y114.086 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X129.359 Y114.608 E.02266
G1 X129.092 Y114.341
G1 X129.616 Y113.817 E.02277
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3000
M204 S6000
G1 X129.092 Y114.341 E-.3035
G1 X129.359 Y114.608 E-.15442
G1 X129.881 Y114.086 E-.30208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 X0 Y128.73 F18000 ; move to safe pos
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

