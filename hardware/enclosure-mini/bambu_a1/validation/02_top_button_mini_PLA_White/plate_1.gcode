; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 13m 50s; total estimated time: 20m 24s
; total layer number: 32
; total filament length [mm] : 1754.60
; total filament volume [cm^3] : 4220.31
; total filament weight [g] : 5.32
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 6.40
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
; bottom_shell_layers = 6
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
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #FFFFFF
; filament_cooling_before_tower = 0
; filament_cost = 19.99
; filament_density = 1.26
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
; filament_ids = GFA00
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
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
; filament_prime_volume = 30
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
; filament_settings_id = "Bambu PLA Basic @BBL A1"
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
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
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
; print_settings_id = AirGap Mini v3 02_top_button_mini A1 0.4
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
; support_interface_top_layers = 3
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
; top_shell_layers = 8
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
M73 P0 R20
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


    M620.1 E F523.843 T220
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
M73 P2 R19
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R19
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
    G1 E10 F94.2699
    M983 F1.57117 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P7 R18
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
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
M73 P8 R18
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
M73 P29 R14
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
M73 P30 R14
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
    G29 A1 X108.5 Y108.506 I39 J38.9879
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
; layer num/total_layer_count: 1/32
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X112.086 Y118.276 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
M73 P31 R14
G1 F1500
M204 S500
G1 X112.087 Y118.275 E.00005
G3 X127.535 Y109.356 I15.913 J9.723 E.69277
G1 X128.465 Y109.356 E.03463
G3 X111.622 Y119.081 I-.465 J18.643 E3.60212
G1 X112.056 Y118.328 E.03237
; WIPE_START
G1 X112.087 Y118.275 E-.02327
G1 X112.591 Y117.494 E-.35332
G1 X113.133 Y116.739 E-.35331
G1 X113.183 Y116.677 E-.0301
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P31 R13
G1 X117.292 Y123.109 Z.6 F42000
G1 X132.216 Y146.473 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1500
M204 S500
M73 P32 R13
G3 X116.938 Y112.614 I-4.225 J-18.47 E1.93616
G3 X128.896 Y109.077 I11.046 J15.362 E.47332
G3 X132.275 Y146.459 I-.905 J18.925 E2.0224
; WIPE_START
G1 X131.29 Y146.662 E-.38196
G1 X130.356 Y146.803 E-.35894
G1 X130.306 Y146.808 E-.0191
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


; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 2/32
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G1 X112.121 Y118.296 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.536 Y109.396 I15.879 J9.703 E.5703
G1 X128.464 Y109.396 E.02851
G3 X112.09 Y118.347 I-.464 J18.603 E2.99206
M204 S250
G1 X111.559 Y118.508 F42000
G1 F3000
M204 S5000
G1 X111.793 Y118.096 E.01456
G3 X118.505 Y111.554 I16.198 J9.906 E.291
G3 X129.137 Y109.049 I9.479 J16.418 E.34047
G3 X111.319 Y118.916 I-1.146 J18.953 E3.00519
G1 X111.529 Y118.56 E.01271
; WIPE_START
M204 S6000
G1 X111.793 Y118.096 E-.20282
G1 X112.31 Y117.303 E-.35973
G1 X112.613 Y116.881 E-.19745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.792 Y121.362 Z.8 F42000
G1 X127.098 Y127.385 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
M73 P33 R13
G3 X127.961 Y126.91 I.9 J.615 E.03391
G1 X128.085 Y126.913 E.00411
G3 X127.065 Y127.435 I-.087 J1.087 E.18723
M106 S201.45
M204 S250
G1 X126.761 Y127.155 F42000
M106 S255
G1 F600
M204 S5000
G3 X127.956 Y126.503 I1.236 J.845 E.04687
G1 X128.109 Y126.507 E.00508
G3 X126.728 Y127.205 I-.111 J1.493 E.25816
M106 S201.45
M204 S250
G1 X126.437 Y126.934 F42000
M106 S255
G1 F600
M204 S5000
G3 X127.95 Y126.111 I1.56 J1.066 E.05935
G1 X128.132 Y126.115 E.00601
G3 X126.404 Y126.984 I-.135 J1.885 E.32648
M106 S201.45
; WIPE_START
M204 S6000
G1 X126.615 Y126.714 E-.13006
G1 X126.897 Y126.466 E-.14289
G1 X127.223 Y126.277 E-.14317
G1 X127.579 Y126.157 E-.14295
G1 X127.95 Y126.111 E-.14207
G1 X128.105 Y126.114 E-.05885
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


G1 X127.952 Y127.076 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4954
M106 S255
G1 F3000
M204 S6000
G1 X128.724 Y127.788 E.03872
G3 X128.667 Y128.35 I-.72 J.211 E.02138
G1 X127.598 Y127.365 E.05362
G2 X127.306 Y127.711 I.313 J.559 E.01707
G1 X128.345 Y128.669 E.05212
G3 X127.7 Y128.69 I-.345 J-.677 E.02458
G1 X127.085 Y128.123 E.03085
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X127.7 Y128.69 E-.31799
G1 X127.795 Y128.727 E-.03893
G1 X127.944 Y128.754 E-.05726
G1 X128.094 Y128.75 E-.05713
G1 X128.241 Y128.716 E-.05716
G1 X128.345 Y128.669 E-.04352
G1 X127.981 Y128.334 E-.18801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/32
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I.651 J-1.028 P1  F42000
G1 X112.121 Y118.296 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
M204 S5000
G3 X127.536 Y109.396 I15.879 J9.702 E.5703
M73 P34 R13
G1 X128.464 Y109.396 E.02851
G3 X112.089 Y118.348 I-.464 J18.603 E2.99205
; WIPE_START
G1 F3000
M204 S6000
G1 X112.624 Y117.517 E-.37536
G1 X113.165 Y116.763 E-.35267
G1 X113.218 Y116.697 E-.03197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.321 Y123.133 Z1 F42000
G1 X132.225 Y146.511 Z1
G1 Z.6
G1 E.8 F1800
G1 F2840
M204 S5000
G3 X116.16 Y113.153 I-4.233 J-18.509 E1.57151
G3 X128.946 Y109.04 I11.846 J14.892 E.4218
G3 X132.283 Y146.498 I-.954 J18.963 E1.6705
; WIPE_START
G1 F3000
M204 S6000
G1 X131.298 Y146.701 E-.38257
G1 X130.361 Y146.843 E-.35975
G1 X130.315 Y146.847 E-.01769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.801 Y139.232 Z1 F42000
G1 X129.018 Y127.629 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
M204 S6000
G3 X127.963 Y126.91 I-1.025 J.371 E.18198
G1 X128.065 Y126.912 E.00337
G3 X128.996 Y127.573 I-.072 J1.088 E.03988
M204 S10000
G1 X129.401 Y127.49 F42000
G1 F2840
M204 S6000
G3 X127.957 Y126.503 I-1.408 J.51 E.25013
G1 X128.086 Y126.505 E.00429
G3 X129.379 Y127.434 I-.093 J1.494 E.05567
M204 S250
G1 X129.769 Y127.356 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
M204 S5000
G3 X127.951 Y126.111 I-1.776 J.644 E.29251
G1 X128.107 Y126.114 E.00479
G3 X129.748 Y127.3 I-.114 J1.886 E.06566
; WIPE_START
G1 F3000
M204 S6000
G1 X129.869 Y127.718 E-.1655
G1 X129.888 Y128.094 E-.143
G1 X129.852 Y128.374 E-.10736
G1 X129.741 Y128.734 E-.14308
G1 X129.562 Y129.064 E-.1429
G1 X129.463 Y129.182 E-.05816
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
G1 X128.672 Y127.898 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2840
M204 S6000
G1 X128.652 Y127.763 E.00422
G1 X128.508 Y127.528 E.00844
G1 X128.284 Y127.367 E.0085
G1 X128.043 Y127.308 E.00762
G1 X127.78 Y127.342 E.00816
G1 X127.541 Y127.48 E.00847
G1 X127.375 Y127.699 E.00845
G1 X127.307 Y127.966 E.00845
G1 X127.348 Y128.237 E.00845
G1 X127.492 Y128.472 E.00845
G1 X127.707 Y128.629 E.00817
G1 X127.947 Y128.692 E.00763
G1 X128.221 Y128.658 E.00849
G1 X128.459 Y128.52 E.00844
G1 X128.625 Y128.301 E.00845
G1 X128.693 Y128.034 E.00845
G1 X128.681 Y127.958 E.00238
M204 S10000
G1 X128.243 Y127.963 F42000
; LINE_WIDTH: 0.53424
G1 F2840
M204 S6000
G1 X128.184 Y127.83 E.00585
G1 X128.019 Y127.749 E.00736
G1 X127.834 Y127.812 E.00781
G1 X127.75 Y127.988 E.0078
G1 X127.817 Y128.172 E.00786
G1 X127.976 Y128.251 E.00711
G1 X128.166 Y128.188 E.00799
G1 X128.246 Y128.022 E.00739
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12822.6
G1 X128.166 Y128.188 E-.09496
G1 X127.976 Y128.251 E-.10268
G1 X127.817 Y128.172 E-.09127
G1 X127.75 Y127.988 E-.10092
G1 X127.834 Y127.812 E-.10015
G1 X128.019 Y127.749 E-.10029
G1 X128.184 Y127.83 E-.09456
G1 X128.243 Y127.963 E-.07517
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/32
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I.626 J-1.044 P1  F42000
G1 X112.121 Y118.297 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2807
M204 S5000
G3 X127.536 Y109.396 I15.879 J9.7 E.57029
G1 X128.464 Y109.396 E.02851
G3 X112.09 Y118.348 I-.464 J18.601 E2.99174
; WIPE_START
G1 F3000
M204 S6000
G1 X112.624 Y117.517 E-.37536
G1 X113.165 Y116.763 E-.35263
G1 X113.218 Y116.697 E-.03201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.24 Y123.184 Z1.2 F42000
G1 X131.762 Y146.608 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F2807
M204 S5000
G1 X131.297 Y146.699 E.01455
G3 X118.505 Y111.554 I-3.306 J-18.697 E1.62975
G3 X128.755 Y109.03 I9.478 J16.415 E.3287
G3 X132.225 Y146.511 I-.764 J18.972 E1.6782
G1 X131.82 Y146.595 E.0127
; WIPE_START
G1 F3000
M204 S6000
G1 X131.297 Y146.699 E-.20272
G1 X130.361 Y146.843 E-.35973
G1 X129.844 Y146.894 E-.19756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.516 Y139.269 Z1.2 F42000
G1 X129.015 Y127.63 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2807
M204 S6000
G3 X127.966 Y126.91 I-1.025 J.37 E.18209
G1 X128.044 Y126.911 E.00259
G3 X128.994 Y127.574 I-.054 J1.089 E.0405
M204 S10000
M73 P35 R13
G1 X129.398 Y127.491 F42000
G1 F2807
M204 S6000
G3 X127.959 Y126.503 I-1.408 J.509 E.25019
G1 X128.063 Y126.504 E.00348
G3 X129.377 Y127.435 I-.073 J1.495 E.05638
M204 S250
G1 X129.767 Y127.357 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2807
M204 S5000
G3 X127.951 Y126.111 I-1.777 J.643 E.29252
G1 X128.082 Y126.112 E.00401
G3 X129.746 Y127.301 I-.091 J1.887 E.06639
; WIPE_START
G1 F3000
M204 S6000
G1 X129.869 Y127.718 E-.16548
G1 X129.888 Y128.094 E-.14297
G1 X129.852 Y128.375 E-.10738
G1 X129.741 Y128.734 E-.14304
G1 X129.561 Y129.065 E-.14299
G1 X129.463 Y129.182 E-.05814
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


G1 X128.672 Y127.898 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2807
M204 S6000
G1 X128.652 Y127.763 E.00422
G1 X128.508 Y127.528 E.00845
G1 X128.285 Y127.367 E.00845
G1 X128.026 Y127.307 E.00816
G1 X127.78 Y127.342 E.00763
G1 X127.541 Y127.48 E.00849
G1 X127.375 Y127.699 E.00845
G1 X127.307 Y127.966 E.00846
G1 X127.348 Y128.237 E.00845
G1 X127.491 Y128.472 E.00843
G1 X127.715 Y128.632 E.00845
G1 X127.983 Y128.693 E.00845
G1 X128.248 Y128.647 E.00828
G1 X128.488 Y128.494 E.00876
G1 X128.624 Y128.304 E.00718
G1 X128.693 Y128.034 E.00853
G1 X128.681 Y127.958 E.00239
M204 S10000
G1 X128.243 Y127.963 F42000
; LINE_WIDTH: 0.53389
G1 F2807
M204 S6000
G1 X128.184 Y127.829 E.00586
G1 X128.006 Y127.748 E.0078
G1 X127.834 Y127.812 E.00735
G1 X127.749 Y127.988 E.00781
G1 X127.816 Y128.171 E.00779
G1 X127.995 Y128.251 E.00784
G1 X128.184 Y128.173 E.00819
G1 X128.247 Y128.022 E.00656
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12831.741
G1 X128.184 Y128.173 E-.08421
G1 X127.995 Y128.251 E-.10511
G1 X127.816 Y128.171 E-.10065
G1 X127.749 Y127.988 E-.09998
G1 X127.834 Y127.812 E-.10023
G1 X128.006 Y127.748 E-.09443
G1 X128.184 Y127.829 E-.10019
G1 X128.243 Y127.963 E-.0752
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/32
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I.626 J-1.044 P1  F42000
G1 X112.121 Y118.297 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2807
M204 S5000
G3 X127.536 Y109.396 I15.879 J9.7 E.5703
G1 X128.464 Y109.396 E.02851
G3 X112.09 Y118.348 I-.464 J18.601 E2.99174
; WIPE_START
G1 F3000
M204 S6000
G1 X112.624 Y117.517 E-.37534
G1 X113.165 Y116.763 E-.35267
G1 X113.218 Y116.697 E-.03199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.24 Y123.184 Z1.4 F42000
G1 X131.762 Y146.608 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2807
M204 S5000
G1 X131.297 Y146.697 E.01455
G3 X123.774 Y109.486 I-3.305 J-18.698 E1.80432
G3 X128.564 Y109.02 I4.21 J18.44 E.14827
G3 X132.225 Y146.509 I-.572 J18.979 E1.68418
G1 X131.82 Y146.595 E.0127
; WIPE_START
G1 F3000
M204 S6000
G1 X131.297 Y146.697 E-.2027
G1 X130.361 Y146.843 E-.35971
G1 X129.844 Y146.894 E-.19759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.514 Y139.269 Z1.4 F42000
G1 X129.009 Y127.59 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2807
M204 S6000
G1 X129.059 Y127.786 E.0067
G3 X127.97 Y126.91 I-1.069 J.214 E.17685
G1 X128.024 Y126.91 E.00179
G3 X128.979 Y127.54 I-.033 J1.09 E.03994
M204 S10000
G1 X129.4 Y127.49 F42000
G1 F2807
M204 S6000
G3 X127.961 Y126.503 I-1.408 J.509 E.25025
G1 X128.041 Y126.503 E.00265
G3 X129.379 Y127.434 I-.049 J1.496 E.05717
M204 S250
G1 X129.77 Y127.356 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2807
M204 S5000
G3 X127.952 Y126.111 I-1.776 J.644 E.2925
G1 X128.057 Y126.111 E.00321
G3 X129.749 Y127.3 I-.063 J1.888 E.06722
; WIPE_START
G1 F3000
M204 S6000
G1 X129.869 Y127.718 E-.1656
G1 X129.888 Y128.094 E-.14292
G1 X129.831 Y128.466 E-.14301
G1 X129.707 Y128.811 E-.13933
M73 P36 R13
G1 X129.561 Y129.065 E-.11106
G1 X129.463 Y129.182 E-.05807
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


G1 X128.665 Y127.858 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2807
M204 S6000
G1 X128.639 Y127.731 E.00401
G1 X128.484 Y127.503 E.00845
G1 X128.251 Y127.353 E.00852
G1 X128.019 Y127.306 E.00727
G1 X127.747 Y127.354 E.00851
G1 X127.516 Y127.503 E.00845
G1 X127.361 Y127.731 E.00845
G1 X127.306 Y128 E.00844
G1 X127.362 Y128.274 E.0086
G1 X127.489 Y128.47 E.00719
G1 X127.715 Y128.632 E.00853
G1 X127.983 Y128.693 E.00845
G1 X128.253 Y128.646 E.00844
G1 X128.488 Y128.494 E.0086
G1 X128.621 Y128.308 E.00702
G1 X128.693 Y127.995 E.00985
G1 X128.677 Y127.917 E.00244
M204 S10000
G1 X128.241 Y127.944 F42000
; LINE_WIDTH: 0.531505
G1 F2807
M204 S6000
G1 X128.176 Y127.82 E.00561
G1 X128.014 Y127.747 E.00707
G1 X127.824 Y127.82 E.00811
G1 X127.748 Y128 E.00778
G1 X127.808 Y128.166 E.00705
G1 X127.994 Y128.252 E.00814
G1 X128.184 Y128.175 E.00818
G1 X128.245 Y128.003 E.00728
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12894.385
G1 X128.184 Y128.175 E-.09342
M73 P36 R12
G1 X127.994 Y128.252 E-.10496
G1 X127.808 Y128.166 E-.10449
G1 X127.748 Y128 E-.0905
G1 X127.824 Y127.82 E-.09991
G1 X128.014 Y127.747 E-.10404
G1 X128.176 Y127.82 E-.09072
G1 X128.241 Y127.944 E-.07196
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/32
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S158.1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.625 J-1.044 P1  F42000
G1 X112.219 Y118.356 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3240
M204 S6000
G3 X126.618 Y109.561 I15.775 J9.642 E.58121
G3 X129.346 Y109.559 I1.377 J20.617 E.09055
G3 X112.188 Y118.407 I-1.352 J18.439 E3.1797
M204 S10000
G1 X111.871 Y118.143 F42000
G1 F5400
M204 S6000
G3 X126.588 Y109.155 I16.122 J9.855 E.59403
G3 X129.366 Y109.153 I1.407 J21.035 E.09224
G3 X111.839 Y118.195 I-1.374 J18.846 E3.25003
M204 S250
G1 X111.536 Y117.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F840
M204 S5000
G1 X111.537 Y117.939 E.00029
G3 X125.601 Y108.86 I16.456 J10.058 E.53208
G3 X129.386 Y108.761 I2.39 J19.053 E.11652
G3 X111.056 Y118.773 I-1.393 J19.236 E3.0454
G1 X111.506 Y118.001 E.02746
M106 S158.1
; WIPE_START
M204 S6000
G1 X111.537 Y117.939 E-.0261
G1 X112.062 Y117.134 E-.36543
G1 X112.623 Y116.353 E-.36551
G1 X112.628 Y116.347 E-.00296
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


G1 X132.273 Y110.182 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42106
M106 S255
G1 F3000
M204 S6000
G1 X129.309 Y109.891 E.09178
G2 X126.059 Y109.952 I-1.299 J17.434 E.10031
G1 X133.412 Y110.674 E.22768
G3 X134.869 Y111.197 I-5.654 J18.032 E.04769
G1 X124.533 Y110.182 E.32001
G2 X123.371 Y110.448 I2.081 J11.769 E.03675
G1 X135.953 Y111.683 E.38958
G3 X136.851 Y112.152 I-4.242 J9.231 E.03121
G1 X122.398 Y110.732 E.44749
G2 X121.554 Y111.03 I2.554 J8.601 E.02758
G1 X137.622 Y112.607 E.49747
G3 X138.3 Y113.054 I-4.133 J7.021 E.02505
G1 X120.802 Y111.336 E.54177
G2 X120.119 Y111.649 I2.793 J7.003 E.02317
G1 X138.911 Y113.494 E.58183
G3 X139.469 Y113.928 I-4.073 J5.802 E.0218
G1 X119.488 Y111.967 E.61863
M73 P37 R12
G2 X118.9 Y112.289 I2.946 J6.084 E.02069
G1 X139.982 Y114.359 E.65274
G3 X140.443 Y114.784 I-4.037 J4.844 E.01935
G1 X118.364 Y112.616 E.68361
G2 X117.857 Y112.946 I3.058 J5.246 E.01864
G1 X140.878 Y115.207 E.71275
G1 X141.288 Y115.627 E.01809
G1 X117.373 Y113.279 E.74044
G1 X116.929 Y113.615 E.01717
G1 X141.657 Y116.043 E.76563
G3 X142.012 Y116.458 I-3.977 J3.764 E.01683
G1 X116.502 Y113.953 E.78985
G1 X116.096 Y114.293 E.01631
G1 X142.341 Y116.87 E.81258
G3 X142.649 Y117.28 I-3.958 J3.292 E.01581
G1 X115.716 Y114.636 E.83388
G1 X115.346 Y114.979 E.01557
G1 X142.943 Y117.689 E.85444
G3 X143.211 Y118.096 I-3.943 J2.897 E.01501
G1 X115.006 Y115.326 E.87329
G2 X114.67 Y115.673 I3.317 J3.551 E.01489
G1 X143.473 Y118.501 E.89182
G3 X143.708 Y118.904 I-3.916 J2.551 E.01438
G1 X114.361 Y116.023 E.90864
G2 X114.056 Y116.373 I3.353 J3.232 E.01431
G1 X143.941 Y119.307 E.92529
G3 X144.146 Y119.707 I-3.944 J2.281 E.01387
G1 X113.775 Y116.725 E.94036
G2 X113.497 Y117.078 I3.4 J2.966 E.01384
G1 X144.352 Y120.107 E.95532
G3 X144.532 Y120.505 I-3.882 J2 E.01346
G1 X113.242 Y117.433 E.9688
G2 X112.988 Y117.788 I3.446 J2.735 E.01346
G1 X144.711 Y120.903 E.98222
G3 X144.869 Y121.298 I-3.882 J1.778 E.01312
G1 X112.757 Y118.145 E.99425
G1 X112.526 Y118.502 E.01311
G1 X145.024 Y121.693 E1.0062
G3 X145.162 Y122.087 I-3.869 J1.575 E.01285
G1 X112.317 Y118.862 E1.01695
G1 X112.109 Y119.221 E.01279
G1 X145.294 Y122.48 E1.02747
G3 X145.413 Y122.871 I-3.863 J1.392 E.01262
G1 X111.918 Y119.582 E1.03709
G1 X111.732 Y119.944 E.01253
G1 X145.523 Y123.262 E1.04623
M73 P38 R12
G3 X145.626 Y123.652 I-3.855 J1.224 E.01243
G1 X111.557 Y120.307 E1.05482
G1 X111.393 Y120.671 E.0123
G1 X145.715 Y124.041 E1.06265
G3 X145.802 Y124.429 I-3.827 J1.064 E.01228
G1 X111.234 Y121.035 E1.07028
G1 X111.09 Y121.401 E.01211
G1 X145.87 Y124.816 E1.07684
G1 X145.938 Y125.203 E.0121
G1 X110.947 Y121.767 E1.0834
G2 X110.822 Y122.134 I3.627 J1.436 E.01197
G1 X145.991 Y125.588 E1.0889
G1 X146.039 Y125.972 E.01195
G1 X110.698 Y122.502 E1.09422
G2 X110.587 Y122.871 I3.648 J1.306 E.01188
G1 X146.079 Y126.356 E1.09891
G1 X146.108 Y126.739 E.01183
G1 X110.483 Y123.241 E1.10302
G2 X110.383 Y123.611 I3.658 J1.18 E.01182
G1 X146.135 Y127.122 E1.10694
G1 X146.145 Y127.503 E.01174
G1 X110.299 Y123.983 E1.10986
G1 X110.214 Y124.354 E.01175
G1 X146.154 Y127.883 E1.11279
G3 X146.151 Y128.263 I-3.796 J.153 E.0117
G1 X110.145 Y124.728 E1.11479
G1 X110.08 Y125.101 E.01169
G1 X146.141 Y128.642 E1.11653
G3 X146.126 Y129.021 I-3.8 J.037 E.01168
G1 X110.023 Y125.476 E1.11782
G1 X109.976 Y125.851 E.01166
G1 X146.098 Y129.398 E1.1184
G1 X146.069 Y129.775 E.01165
G1 X109.93 Y126.226 E1.11893
G1 X109.902 Y126.604 E.01165
G1 X146.024 Y130.15 E1.1184
G1 X145.977 Y130.526 E.01166
G1 X109.874 Y126.981 E1.11782
M73 P39 R12
G2 X109.859 Y127.359 I3.777 J.341 E.01168
G1 X145.92 Y130.9 E1.11653
G1 X145.854 Y131.274 E.01169
G1 X109.849 Y127.738 E1.11478
G2 X109.846 Y128.118 I3.803 J.226 E.0117
G1 X145.786 Y131.647 E1.11277
G1 X145.701 Y132.019 E.01175
G1 X109.855 Y128.499 E1.10985
G1 X109.865 Y128.88 E.01174
G1 X145.616 Y132.39 E1.10693
G3 X145.517 Y132.76 I-3.758 J-.81 E.01182
G1 X109.892 Y129.262 E1.10301
G1 X109.921 Y129.645 E.01183
G1 X145.413 Y133.13 E1.0989
G3 X145.301 Y133.499 I-3.761 J-.939 E.01189
G1 X109.961 Y130.029 E1.0942
G1 X110.009 Y130.414 E.01195
G1 X145.177 Y133.867 E1.08888
G3 X145.053 Y134.235 I-3.729 J-1.062 E.01197
G1 X110.062 Y130.799 E1.08337
G1 X110.13 Y131.185 E.0121
G1 X144.909 Y134.6 E1.07682
G1 X144.765 Y134.966 E.01211
G1 X110.198 Y131.572 E1.07026
G2 X110.286 Y131.961 I3.955 J-.685 E.01228
G1 X144.606 Y135.331 E1.06262
G1 X144.442 Y135.694 E.0123
G1 X110.374 Y132.349 E1.05479
G2 X110.477 Y132.739 I3.955 J-.834 E.01243
G1 X144.267 Y136.057 E1.0462
G1 X144.082 Y136.419 E.01253
G1 X110.587 Y133.13 E1.03706
G2 X110.707 Y133.522 I3.983 J-1.001 E.01262
G1 X143.89 Y136.78 E1.02743
M73 P40 R12
G1 X143.683 Y137.14 E.01279
G1 X110.839 Y133.915 E1.01691
G2 X110.976 Y134.308 I4.015 J-1.185 E.01285
G1 X143.473 Y137.499 E1.00616
G1 X143.242 Y137.856 E.01311
G1 X111.131 Y134.703 E.99421
G2 X111.289 Y135.099 I4.034 J-1.381 E.01313
G1 X143.012 Y138.214 E.98218
G3 X142.757 Y138.569 I-3.693 J-2.376 E.01346
G1 X111.469 Y135.496 E.96875
G2 X111.649 Y135.894 I4.057 J-1.601 E.01346
G1 X142.502 Y138.924 E.95527
G3 X142.224 Y139.276 I-3.663 J-2.603 E.01384
G1 X111.854 Y136.294 E.94031
G2 X112.06 Y136.694 I4.095 J-1.854 E.01387
G1 X141.943 Y139.629 E.92523
G3 X141.638 Y139.979 I-3.654 J-2.878 E.01432
G1 X112.293 Y137.097 E.90858
G2 X112.528 Y137.5 I4.156 J-2.152 E.01438
G1 X141.329 Y140.328 E.89175
G3 X140.993 Y140.675 I-3.652 J-3.204 E.0149
G1 X112.79 Y137.906 E.87323
G2 X113.058 Y138.312 I4.205 J-2.488 E.01501
G1 X140.653 Y141.022 E.85437
G1 X140.282 Y141.365 E.01557
G1 X113.352 Y138.721 E.83381
G2 X113.66 Y139.131 I4.264 J-2.882 E.01581
G1 X139.902 Y141.708 E.8125
G1 X139.497 Y142.048 E.01631
G1 X113.989 Y139.543 E.78977
G2 X114.344 Y139.958 I4.332 J-3.35 E.01684
G1 X139.07 Y142.386 E.76554
G1 X138.626 Y142.723 E.01717
G1 X114.714 Y140.375 E.74035
M73 P41 R12
G1 X115.124 Y140.795 E.01809
G1 X138.141 Y143.055 E.71266
G3 X137.634 Y143.385 I-3.561 J-4.912 E.01865
G1 X115.558 Y141.217 E.68351
G2 X116.02 Y141.643 I4.491 J-4.412 E.01935
G1 X137.098 Y143.712 E.65262
G3 X136.509 Y144.035 I-3.521 J-5.74 E.0207
G1 X116.533 Y142.073 E.61851
M73 P41 R11
G2 X117.091 Y142.508 I4.63 J-5.369 E.02181
G1 X135.879 Y144.353 E.5817
G3 X135.195 Y144.665 I-3.472 J-6.685 E.02318
G1 X117.702 Y142.948 E.54161
G2 X118.381 Y143.394 I4.81 J-6.575 E.02506
G1 X134.443 Y144.972 E.4973
G3 X133.598 Y145.269 I-3.399 J-8.312 E.02759
G1 X119.152 Y143.85 E.44729
G2 X120.05 Y144.318 I5.141 J-8.768 E.03122
G1 X132.625 Y145.553 E.38936
G3 X131.463 Y145.819 I-3.24 J-11.499 E.03677
G1 X121.136 Y144.805 E.31974
G2 X122.594 Y145.328 I7.114 J-17.537 E.04775
G1 X129.934 Y146.049 E.22727
G3 X126.663 Y146.107 I-1.951 J-17.515 E.10095
G1 X123.735 Y145.82 E.09066
M106 S158.1
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X125.726 Y146.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/32
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I1.094 J-.534 P1  F42000
G1 X112.218 Y118.356 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X122.111 Y110.472 I15.773 J9.644 E.42826
G3 X129.225 Y109.553 I5.875 J17.483 E.23947
G3 X112.187 Y118.407 I-1.233 J18.447 E3.18366
M204 S10000
G1 X111.871 Y118.143 F42000
G1 F5400
M204 S6000
G3 X121.981 Y110.086 I16.12 J9.857 E.43769
G3 X129.245 Y109.147 I6.004 J17.865 E.24452
G3 X111.84 Y118.195 I-1.254 J18.853 E3.25397
M204 S250
M73 P42 R11
G1 X111.544 Y117.936 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.059 Y117.131 E.02936
G3 X120.953 Y110.043 I15.933 J10.869 E.35473
G3 X129.265 Y108.755 I7.066 J18.13 E.26051
G3 X111.509 Y117.984 I-1.273 J19.245 E3.07726
; WIPE_START
M204 S6000
G1 X112.059 Y117.131 E-.38537
G1 X112.623 Y116.353 E-.36543
G1 X112.638 Y116.334 E-.00919
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


G1 X113.391 Y139.066 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42115
G1 F15000
M204 S6000
G1 X115.339 Y141.014 E.0849
G2 X118.035 Y143.175 I12.442 J-12.76 E.10664
G1 X112.833 Y137.973 E.22673
G3 X112.028 Y136.633 I19.299 J-12.505 E.04818
G1 X119.356 Y143.961 E.31942
G2 X120.432 Y144.502 I5.954 J-10.504 E.03712
G1 X111.504 Y135.574 E.38916
G3 X111.108 Y134.643 I9.111 J-4.425 E.03119
G1 X121.367 Y144.902 E.44717
G1 X122.208 Y145.208 E.02758
G1 X110.8 Y133.801 E.49723
G3 X110.563 Y133.028 I8.945 J-3.173 E.02491
G1 X122.982 Y145.448 E.54133
G2 X123.707 Y145.638 I2.265 J-7.163 E.02311
G1 X110.361 Y132.292 E.58171
G1 X110.203 Y131.599 E.02191
G1 X124.394 Y145.79 E.61855
G2 X125.051 Y145.912 I1.555 J-6.526 E.02061
G1 X110.088 Y130.949 E.65219
G3 X109.998 Y130.324 I6.225 J-1.223 E.01949
G1 X125.681 Y146.007 E.6836
G2 X126.279 Y146.07 I.93 J-5.967 E.01853
G1 X109.926 Y129.717 E.71277
G1 X109.883 Y129.139 E.01787
G1 X126.861 Y146.117 E.74004
G1 X127.424 Y146.145 E.01737
G1 X109.857 Y128.578 E.7657
G1 X109.844 Y128.03 E.01691
G1 X127.965 Y146.152 E.78988
G2 X128.498 Y146.149 I.244 J-5.351 E.01642
G1 X109.855 Y127.507 E.81259
G3 X109.873 Y126.99 I5.185 J-.077 E.01594
G1 X129.007 Y146.124 E.83401
G2 X129.51 Y146.091 I-.077 J-5.051 E.01552
G1 X109.911 Y126.492 E.85427
G3 X109.957 Y126.003 I4.925 J.218 E.01514
G1 X129.996 Y146.042 E.87345
G2 X130.472 Y145.984 I-.348 J-4.801 E.0148
G1 X110.016 Y125.528 E.89162
G3 X110.086 Y125.063 I4.691 J.469 E.0145
G1 X130.937 Y145.914 E.90883
G2 X131.391 Y145.833 I-.582 J-4.595 E.01422
G1 X110.166 Y124.608 E.92513
G3 X110.257 Y124.164 I4.492 J.686 E.01398
G1 X131.836 Y145.743 E.94057
G2 X132.271 Y145.643 I-.783 J-4.402 E.01376
G1 X110.357 Y123.729 E.95519
G3 X110.465 Y123.303 I4.327 J.878 E.01356
G1 X132.697 Y145.535 E.96904
G2 X133.115 Y145.418 I-.964 J-4.244 E.01338
G1 X110.583 Y122.885 E.98213
G3 X110.708 Y122.475 I4.176 J1.047 E.01322
G1 X133.524 Y145.292 E.99451
G2 X133.927 Y145.159 I-1.122 J-4.1 E.01307
G1 X110.842 Y122.075 E1.0062
G3 X110.981 Y121.679 I4.028 J1.195 E.01293
G1 X134.319 Y145.017 E1.01722
G2 X134.708 Y144.871 I-1.274 J-3.989 E.01281
G1 X111.132 Y121.295 E1.02761
G3 X111.284 Y120.912 I3.923 J1.339 E.0127
G1 X135.084 Y144.712 E1.03737
G1 X135.46 Y144.553 E.01259
G1 X111.451 Y120.544 E1.04653
G1 X111.617 Y120.175 E.01246
G1 X135.822 Y144.38 E1.05503
M73 P43 R11
G1 X136.183 Y144.206 E.01235
G1 X111.796 Y119.819 E1.06296
G1 X111.977 Y119.466 E.01225
G1 X136.533 Y144.022 E1.07033
G1 X136.88 Y143.833 E.01215
G1 X112.167 Y119.12 E1.07716
G1 X112.363 Y118.781 E.01207
G1 X137.22 Y143.638 E1.08345
G1 X137.552 Y143.435 E.01199
G1 X112.562 Y118.446 E1.08923
G1 X112.772 Y118.121 E.01192
G1 X137.882 Y143.231 E1.09449
G1 X138.2 Y143.014 E.01186
G1 X112.982 Y117.796 E1.0992
G3 X113.205 Y117.484 I3.22 J2.061 E.01182
G1 X138.519 Y142.797 E1.10336
G2 X138.826 Y142.57 I-2.121 J-3.198 E.01179
G1 X113.429 Y117.173 E1.10703
G3 X113.66 Y116.869 I3.156 J2.166 E.01177
G1 X139.131 Y142.34 E1.11021
G2 X139.43 Y142.104 I-2.207 J-3.111 E.01174
G1 X113.897 Y116.571 E1.11291
G3 X114.137 Y116.276 I3.081 J2.259 E.01172
G1 X139.721 Y141.86 E1.11513
G1 X140.012 Y141.616 E.0117
G1 X114.388 Y115.992 E1.11688
G1 X114.639 Y115.708 E.01168
G1 X140.289 Y141.359 E1.11805
G1 X140.567 Y141.101 E.01167
G1 X114.9 Y115.435 E1.11875
G1 X115.164 Y115.164 E.01166
G1 X140.836 Y140.836 E1.11898
G1 X141.1 Y140.565 E.01166
G1 X115.434 Y114.898 E1.11875
G1 X115.711 Y114.641 E.01167
G1 X141.362 Y140.292 E1.11805
G1 X141.612 Y140.008 E.01168
G1 X115.989 Y114.384 E1.11688
G1 X116.279 Y114.14 E.0117
G1 X141.863 Y139.723 E1.11513
G2 X142.103 Y139.428 I-2.842 J-2.554 E.01172
G1 X116.57 Y113.896 E1.11291
G3 X116.87 Y113.66 I2.507 J2.878 E.01174
G1 X142.34 Y139.131 E1.1102
G2 X142.572 Y138.827 I-2.929 J-2.473 E.01177
G1 X117.174 Y113.429 E1.10702
G3 X117.482 Y113.202 I2.429 J2.971 E.01179
G1 X142.795 Y138.516 E1.10335
G2 X143.018 Y138.204 I-3.008 J-2.381 E.01182
G1 X117.8 Y112.986 E1.0992
G1 X118.118 Y112.769 E.01186
G1 X143.228 Y137.879 E1.09448
G1 X143.438 Y137.554 E.01192
G1 X118.448 Y112.564 E1.08922
G1 X118.78 Y112.362 E.01199
G1 X143.637 Y137.218 E1.08345
G1 X143.833 Y136.879 E.01207
G1 X119.121 Y112.167 E1.07715
G1 X119.467 Y111.978 E.01215
G1 X144.023 Y136.534 E1.07032
G1 X144.204 Y136.18 E.01225
G1 X119.817 Y111.794 E1.06295
G1 X120.179 Y111.62 E.01235
G1 X144.383 Y135.825 E1.05502
G1 X144.55 Y135.456 E.01246
G1 X120.54 Y111.446 E1.04652
G1 X120.916 Y111.288 E.01259
G1 X144.716 Y135.087 E1.03737
G2 X144.868 Y134.705 I-3.743 J-1.71 E.0127
G1 X121.292 Y111.129 E1.0276
G3 X121.681 Y110.983 I1.656 J3.826 E.01281
G1 X145.019 Y134.321 E1.01721
G2 X145.158 Y133.925 I-3.892 J-1.591 E.01293
G1 X122.074 Y110.841 E1.00619
G3 X122.476 Y110.708 I1.527 J3.974 E.01307
G1 X145.293 Y133.525 E.9945
G2 X145.417 Y133.114 I-4.051 J-1.457 E.01322
G1 X122.885 Y110.582 E.98212
G3 X123.303 Y110.465 I1.383 J4.133 E.01338
G1 X145.535 Y132.697 E.96903
G2 X145.644 Y132.271 I-4.217 J-1.303 E.01356
G1 X123.729 Y110.357 E.95518
G3 X124.164 Y110.257 I1.22 J4.309 E.01376
G1 X145.743 Y131.835 E.94056
G2 X145.834 Y131.391 I-4.405 J-1.13 E.01398
G1 X124.609 Y110.167 E.92512
G3 X125.063 Y110.086 I1.036 J4.514 E.01422
G1 X145.914 Y130.936 E.90881
G2 X145.984 Y130.472 I-4.625 J-.934 E.0145
G1 X125.528 Y110.016 E.8916
G3 X126.005 Y109.957 I.824 J4.742 E.0148
G1 X146.043 Y129.996 E.87344
G2 X146.089 Y129.507 I-4.872 J-.706 E.01514
G1 X126.491 Y109.909 E.85425
G3 X126.993 Y109.876 I.579 J5.013 E.01552
G1 X146.127 Y129.01 E.83399
G2 X146.145 Y128.493 I-5.167 J-.44 E.01594
G1 X127.503 Y109.851 E.81257
G3 X128.035 Y109.848 I.289 J5.352 E.01642
G1 X146.156 Y127.97 E.78986
G1 X146.143 Y127.421 E.01691
G1 X128.576 Y109.855 E.76568
G1 X129.139 Y109.883 E.01737
G1 X146.117 Y126.861 E.74002
G1 X146.074 Y126.282 E.01787
G1 X129.726 Y109.934 E.71256
G3 X130.319 Y109.993 I-.214 J5.21 E.01839
G1 X146.002 Y125.676 E.68358
G2 X145.911 Y125.05 I-6.317 J.597 E.0195
G1 X130.949 Y110.088 E.65217
G3 X131.606 Y110.21 I-.899 J6.656 E.02062
G1 X145.797 Y124.401 E.61852
G1 X145.639 Y123.708 E.02191
G1 X132.294 Y110.362 E.58168
G3 X133.018 Y110.553 I-1.541 J7.357 E.02311
G1 X145.443 Y122.977 E.54156
G2 X145.2 Y122.199 I-7.921 J2.051 E.02515
G1 X133.793 Y110.792 E.49719
G1 X134.634 Y111.098 E.02758
G1 X144.892 Y121.356 E.44713
G2 X144.496 Y120.425 I-9.507 J3.495 E.03119
G1 X135.569 Y111.498 E.38911
G3 X136.645 Y112.039 I-4.878 J11.044 E.03712
G1 X143.972 Y119.366 E.31937
G2 X143.166 Y118.026 I-20.14 J11.189 E.04819
G1 X137.967 Y112.826 E.22664
G3 X140.667 Y114.991 I-9.771 J14.951 E.10683
G1 X142.607 Y116.932 E.08458
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X141.193 Y115.518 E-.76
; WIPE_END
M73 P44 R11
G1 E-.04 F1800
; layer num/total_layer_count: 8/32
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I-.119 J-1.211 P1  F42000
G1 X112.219 Y118.357 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X118.755 Y111.987 I15.773 J9.645 E.3059
G3 X129.103 Y109.547 I9.23 J15.985 E.35775
G3 X112.188 Y118.408 I-1.112 J18.454 E3.1877
M204 S10000
G1 X111.872 Y118.144 F42000
G1 F5400
M204 S6000
G3 X118.551 Y111.634 I16.12 J9.858 E.31263
G3 X129.124 Y109.141 I9.433 J16.336 E.3655
G3 X111.841 Y118.195 I-1.132 J18.861 E3.25808
M204 S250
G1 X111.538 Y117.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X111.537 Y117.939 E.00018
G3 X118.355 Y111.294 I16.454 J10.062 E.2956
G3 X129.143 Y108.749 I9.629 J16.676 E.34548
G3 X111.056 Y118.773 I-1.152 J19.252 E3.05298
G1 X111.508 Y117.997 E.02759
; WIPE_START
M204 S6000
G1 X111.537 Y117.939 E-.02458
G1 X112.062 Y117.134 E-.36548
G1 X112.623 Y116.353 E-.36539
G1 X112.631 Y116.343 E-.00455
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


G1 X116.904 Y113.421 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42115
G1 F15000
M204 S6000
G1 X115.273 Y115.052 E.0711
G2 X112.833 Y118.027 I13.035 J13.18 E.11882
G1 X118.034 Y112.826 E.22673
G3 X119.356 Y112.039 I11.091 J17.125 E.04743
G1 X112.028 Y119.367 E.31942
G2 X111.504 Y120.426 I10.355 J5.785 E.03644
G1 X120.432 Y111.498 E.38916
G3 X121.366 Y111.098 I4.467 J9.147 E.03134
G1 X111.108 Y121.357 E.44716
G2 X110.8 Y122.199 I8.284 J3.501 E.02765
G1 X122.208 Y110.792 E.49723
G3 X122.982 Y110.552 I2.777 J7.613 E.02499
G1 X110.557 Y122.978 E.54159
G2 X110.361 Y123.708 I7.218 J2.323 E.02331
G1 X123.707 Y110.362 E.58171
G3 X124.394 Y110.21 I1.867 J6.803 E.0217
G1 X110.203 Y124.401 E.61855
G1 X110.088 Y125.051 E.02033
G1 X125.051 Y110.088 E.65219
G1 X125.681 Y109.993 E.01963
G1 X109.998 Y125.676 E.6836
G2 X109.926 Y126.283 I6.032 J1.018 E.01882
G1 X126.279 Y109.93 E.71277
G3 X126.861 Y109.883 I.766 J5.812 E.01801
G1 X109.883 Y126.861 E.74004
G2 X109.857 Y127.422 I5.602 J.538 E.0173
G1 X127.424 Y109.855 E.7657
G3 X127.965 Y109.848 I.332 J5.423 E.01668
G1 X109.844 Y127.97 E.78988
G2 X109.855 Y128.493 I5.266 J.145 E.01614
G1 X128.498 Y109.851 E.81259
G1 X129.007 Y109.876 E.01572
G1 X109.873 Y129.01 E.834
G1 X109.911 Y129.508 E.01538
G1 X129.501 Y109.917 E.85391
G1 X129.993 Y109.96 E.01521
G1 X109.957 Y129.997 E.87332
G1 X110.016 Y130.472 E.01476
G1 X130.472 Y110.016 E.89162
G1 X130.937 Y110.086 E.01449
G1 X110.086 Y130.937 E.90883
G1 X110.166 Y131.391 E.01423
G1 X131.391 Y110.167 E.92513
G1 X131.836 Y110.257 E.01399
G1 X110.257 Y131.836 E.94057
G1 X110.357 Y132.271 E.01377
G1 X132.271 Y110.357 E.95519
G1 X132.697 Y110.465 E.01356
G1 X110.465 Y132.697 E.96904
G1 X110.583 Y133.115 E.01337
G1 X133.115 Y110.582 E.98213
G1 X133.524 Y110.708 E.01319
G1 X110.708 Y133.525 E.99451
G1 X110.842 Y133.925 E.01302
G1 X133.927 Y110.841 E1.0062
G1 X134.319 Y110.983 E.01286
G1 X110.981 Y134.321 E1.01722
G1 X111.132 Y134.705 E.01272
G1 X134.708 Y111.129 E1.02761
G1 X135.084 Y111.288 E.01259
G1 X111.284 Y135.088 E1.03737
G1 X111.451 Y135.456 E.01246
G1 X135.46 Y111.446 E1.04653
G3 X135.822 Y111.62 I-1.587 J3.767 E.01236
G1 X111.617 Y135.825 E1.05503
G2 X111.796 Y136.181 I3.652 J-1.616 E.01228
G1 X136.183 Y111.794 E1.06296
G3 X136.533 Y111.978 I-1.674 J3.604 E.01221
G1 X111.977 Y136.534 E1.07033
G2 X112.167 Y136.88 I3.549 J-1.725 E.01215
G1 X136.88 Y112.167 E1.07716
G3 X137.22 Y112.362 I-1.779 J3.504 E.01209
G1 X112.363 Y137.219 E1.08345
M73 P45 R11
G2 X112.562 Y137.554 I3.457 J-1.83 E.01203
G1 X137.552 Y112.565 E1.08922
G3 X137.882 Y112.769 I-1.88 J3.412 E.01198
G1 X112.772 Y137.879 E1.09449
G1 X112.982 Y138.204 E.01192
G1 X138.2 Y112.986 E1.0992
G1 X138.519 Y113.203 E.01186
G1 X113.205 Y138.516 E1.10336
G1 X113.429 Y138.827 E.01181
G1 X138.826 Y113.43 E1.10702
G1 X139.131 Y113.66 E.01177
G1 X113.66 Y139.131 E1.11021
G1 X113.897 Y139.428 E.01173
G1 X139.43 Y113.896 E1.11291
G1 X139.721 Y114.14 E.0117
G1 X114.137 Y139.724 E1.11513
G1 X114.388 Y140.008 E.01168
G1 X140.012 Y114.384 E1.11688
G1 X140.289 Y114.641 E.01167
G1 X114.639 Y140.292 E1.11805
G2 X114.9 Y140.565 I2.874 J-2.485 E.01167
G1 X140.567 Y114.899 E1.11875
G3 X140.836 Y115.164 I-2.526 J2.834 E.01166
G1 X115.164 Y140.836 E1.11898
G2 X115.434 Y141.102 I2.792 J-2.565 E.01166
G1 X141.1 Y115.435 E1.11875
G3 X141.362 Y115.708 I-2.608 J2.753 E.01167
G1 X115.711 Y141.359 E1.11805
G1 X115.989 Y141.616 E.01167
G1 X141.612 Y115.992 E1.11688
G1 X141.863 Y116.277 E.01168
G1 X116.279 Y141.86 E1.11513
G1 X116.57 Y142.104 E.0117
G1 X142.103 Y116.572 E1.11291
G1 X142.34 Y116.869 E.01173
G1 X116.87 Y142.34 E1.1102
G1 X117.174 Y142.571 E.01177
G1 X142.572 Y117.173 E1.10702
G1 X142.795 Y117.484 E.01181
G1 X117.482 Y142.798 E1.10336
G1 X117.8 Y143.014 E.01186
G1 X143.018 Y117.796 E1.0992
G1 X143.228 Y118.121 E.01192
G1 X118.118 Y143.231 E1.09448
G2 X118.448 Y143.436 I2.215 J-3.216 E.01198
G1 X143.438 Y118.446 E1.08922
G3 X143.637 Y118.782 I-3.261 J2.167 E.01203
G1 X118.78 Y143.638 E1.08345
G2 X119.121 Y143.833 I2.121 J-3.312 E.01209
G1 X143.833 Y119.121 E1.07715
G3 X144.023 Y119.466 I-3.361 J2.071 E.01215
G1 X119.467 Y144.022 E1.07032
G2 X119.817 Y144.206 I2.023 J-3.418 E.01221
G1 X144.204 Y119.82 E1.06295
G3 X144.383 Y120.175 I-3.484 J1.977 E.01228
G1 X120.178 Y144.38 E1.05502
G2 X120.54 Y144.554 I1.893 J-3.478 E.01236
G1 X144.55 Y120.544 E1.04652
G1 X144.716 Y120.913 E.01246
G1 X120.916 Y144.712 E1.03737
G1 X121.292 Y144.871 E.01259
G1 X144.868 Y121.295 E1.0276
G1 X145.019 Y121.679 E.01272
G1 X121.681 Y145.017 E1.01721
G1 X122.074 Y145.159 E.01286
G1 X145.158 Y122.075 E1.00619
G1 X145.293 Y122.475 E.01302
G1 X122.476 Y145.292 E.9945
G1 X122.885 Y145.418 E.01319
G1 X145.417 Y122.886 E.98212
G1 X145.535 Y123.303 E.01337
G1 X123.303 Y145.535 E.96903
G1 X123.729 Y145.643 E.01356
G1 X145.644 Y123.729 E.95518
G1 X145.743 Y124.165 E.01377
G1 X124.164 Y145.743 E.94056
G1 X124.609 Y145.833 E.01399
G1 X145.834 Y124.609 E.92512
G1 X145.914 Y125.064 E.01423
G1 X125.063 Y145.914 E.90881
G1 X125.528 Y145.984 E.01449
G1 X145.984 Y125.528 E.8916
G1 X146.043 Y126.004 E.01476
G1 X126.005 Y146.043 E.87344
G1 X126.491 Y146.091 E.01506
G1 X146.089 Y126.493 E.85425
G1 X146.127 Y126.99 E.01538
G1 X126.993 Y146.124 E.83399
G1 X127.503 Y146.149 E.01572
G1 X146.145 Y127.507 E.81257
G3 X146.156 Y128.03 I-5.221 J.377 E.01614
G1 X128.035 Y146.152 E.78986
G2 X128.576 Y146.145 I.209 J-5.43 E.01668
G1 X146.143 Y128.579 E.76568
G3 X146.117 Y129.139 I-5.629 J.023 E.0173
G1 X129.139 Y146.117 E.74002
G2 X129.721 Y146.07 I-.183 J-5.85 E.01801
G1 X146.074 Y129.718 E.71275
G3 X146.002 Y130.324 I-6.107 J-.412 E.01883
G1 X130.319 Y146.007 E.68358
G1 X130.949 Y145.912 E.01963
G1 X145.911 Y130.95 E.65217
G1 X145.797 Y131.599 E.02033
G1 X131.606 Y145.79 E.61852
G2 X132.293 Y145.638 I-1.18 J-6.954 E.0217
G1 X145.639 Y132.292 E.58168
G3 X145.443 Y133.023 I-7.411 J-1.592 E.02331
G1 X133.018 Y145.447 E.54156
G2 X133.793 Y145.208 I-2.03 J-7.939 E.02499
G1 X145.2 Y133.801 E.49719
G3 X144.892 Y134.644 I-8.595 J-2.66 E.02765
G1 X134.634 Y144.902 E.44713
G2 X135.569 Y144.502 I-3.538 J-9.56 E.03136
G1 X144.496 Y135.575 E.38911
G3 X143.972 Y136.634 I-10.883 J-4.728 E.03645
G1 X136.645 Y143.961 E.31937
G2 X137.967 Y143.174 I-9.75 J-17.878 E.04744
G1 X143.166 Y137.974 E.22664
G3 X141.31 Y140.35 I-14.778 J-9.633 E.09304
G3 X139.097 Y142.578 I-90.356 J-87.529 E.0968
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X140.507 Y141.159 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/32
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2 I.764 J-.947 P1  F42000
G1 X112.22 Y118.357 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X117.206 Y112.987 I15.772 J9.645 E.24471
G3 X128.982 Y109.541 I10.779 J14.992 E.41489
G3 X112.189 Y118.408 I-.99 J18.461 E3.19172
M204 S10000
G1 X111.872 Y118.144 F42000
M73 P46 R11
G1 F5400
M204 S6000
G3 X116.969 Y112.656 I16.119 J9.858 E.2501
G3 X129.002 Y109.135 I11.016 J15.322 E.42398
G3 X111.841 Y118.196 I-1.011 J18.868 E3.26214
M204 S250
G1 X111.539 Y117.944 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X111.538 Y117.94 E.00012
G3 X116.74 Y112.338 I16.454 J10.063 E.23647
G3 X129.022 Y108.743 I11.245 J15.64 E.40085
G3 X111.056 Y118.773 I-1.03 J19.259 E3.05675
G1 X111.509 Y117.995 E.02765
; WIPE_START
M204 S6000
G1 X111.538 Y117.94 E-.02381
G1 X112.062 Y117.134 E-.36547
G1 X112.623 Y116.353 E-.36539
G1 X112.632 Y116.342 E-.00532
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


G1 X113.391 Y139.066 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42115
M73 P46 R10
G1 F15000
M204 S6000
G1 X115.339 Y141.014 E.08489
G2 X118.034 Y143.174 I12.443 J-12.762 E.10665
G1 X112.833 Y137.973 E.22673
G3 X112.028 Y136.633 I19.279 J-12.493 E.04818
G1 X119.356 Y143.961 E.31942
G2 X120.432 Y144.502 I5.956 J-10.507 E.03712
G1 X111.504 Y135.574 E.38916
G3 X111.108 Y134.643 I9.127 J-4.432 E.03119
G1 X121.367 Y144.902 E.44717
G1 X122.208 Y145.208 E.02758
G1 X110.8 Y133.801 E.49723
G3 X110.557 Y133.022 I7.674 J-2.828 E.02515
G1 X122.982 Y145.448 E.54159
G2 X123.707 Y145.638 I2.266 J-7.166 E.02311
G1 X110.361 Y132.292 E.58171
G1 X110.203 Y131.599 E.02191
G1 X124.394 Y145.79 E.61855
G2 X125.051 Y145.912 I1.555 J-6.529 E.02061
G1 X110.088 Y130.949 E.65219
G3 X109.998 Y130.324 I6.228 J-1.223 E.0195
G1 X125.681 Y146.007 E.6836
G2 X126.279 Y146.07 I.931 J-5.97 E.01853
G1 X109.926 Y129.717 E.71277
G1 X109.883 Y129.139 E.01787
G1 X126.861 Y146.117 E.74004
G1 X127.424 Y146.145 E.01737
G1 X109.857 Y128.578 E.7657
G1 X109.844 Y128.03 E.01691
G1 X127.965 Y146.152 E.78988
G2 X128.498 Y146.149 I.244 J-5.35 E.01642
G1 X109.855 Y127.507 E.81259
G3 X109.873 Y126.99 I5.183 J-.077 E.01594
G1 X129.007 Y146.124 E.83401
G2 X129.509 Y146.091 I-.077 J-5.049 E.01552
G1 X109.911 Y126.492 E.85427
G3 X109.957 Y126.003 I4.924 J.218 E.01514
G1 X129.996 Y146.042 E.87345
G2 X130.472 Y145.984 I-.348 J-4.799 E.0148
G1 X110.016 Y125.528 E.89162
G3 X110.086 Y125.063 I4.694 J.469 E.0145
G1 X130.937 Y145.914 E.90883
G2 X131.391 Y145.833 I-.582 J-4.594 E.01422
G1 X110.166 Y124.608 E.92513
G3 X110.257 Y124.164 I4.49 J.685 E.01398
G1 X131.836 Y145.743 E.94057
G2 X132.271 Y145.643 I-.784 J-4.405 E.01376
G1 X110.357 Y123.729 E.95519
G3 X110.465 Y123.303 I4.324 J.877 E.01356
G1 X132.697 Y145.535 E.96904
G2 X133.115 Y145.418 I-.965 J-4.25 E.01338
G1 X110.583 Y122.885 E.98213
G3 X110.708 Y122.475 I4.173 J1.046 E.01322
G1 X133.524 Y145.292 E.99451
G2 X133.927 Y145.159 I-1.121 J-4.095 E.01307
G1 X110.842 Y122.075 E1.0062
G3 X110.981 Y121.679 I4.035 J1.197 E.01293
G1 X134.319 Y145.017 E1.01722
G2 X134.708 Y144.871 I-1.268 J-3.972 E.01281
G1 X111.132 Y121.295 E1.02761
G3 X111.284 Y120.912 I3.906 J1.332 E.0127
G1 X135.084 Y144.712 E1.03737
G1 X135.46 Y144.553 E.01259
G1 X111.451 Y120.544 E1.04653
G1 X111.617 Y120.175 E.01246
G1 X135.822 Y144.38 E1.05503
G1 X136.183 Y144.206 E.01235
G1 X111.796 Y119.819 E1.06296
G1 X111.977 Y119.466 E.01225
G1 X136.533 Y144.022 E1.07033
G1 X136.88 Y143.833 E.01215
G1 X112.167 Y119.12 E1.07716
G1 X112.363 Y118.781 E.01207
G1 X137.22 Y143.638 E1.08345
G1 X137.552 Y143.435 E.01199
G1 X112.562 Y118.446 E1.08922
G1 X112.772 Y118.121 E.01192
G1 X137.882 Y143.231 E1.09449
G1 X138.2 Y143.014 E.01186
G1 X112.982 Y117.796 E1.0992
G3 X113.205 Y117.484 I3.238 J2.074 E.01182
G1 X138.518 Y142.797 E1.10336
M73 P47 R10
G2 X138.826 Y142.57 I-2.116 J-3.191 E.01179
G1 X113.429 Y117.173 E1.10703
G3 X113.66 Y116.869 I3.157 J2.167 E.01177
G1 X139.131 Y142.34 E1.11021
G2 X139.43 Y142.104 I-2.207 J-3.112 E.01174
G1 X113.897 Y116.571 E1.11291
G3 X114.137 Y116.276 I3.071 J2.251 E.01172
G1 X139.721 Y141.86 E1.11513
G1 X140.012 Y141.616 E.0117
G1 X114.388 Y115.992 E1.11688
G1 X114.639 Y115.708 E.01168
G1 X140.289 Y141.359 E1.11805
G1 X140.567 Y141.101 E.01167
G1 X114.9 Y115.435 E1.11875
G1 X115.164 Y115.164 E.01166
G1 X140.836 Y140.836 E1.11898
G1 X141.1 Y140.565 E.01166
G1 X115.434 Y114.898 E1.11875
G1 X115.711 Y114.641 E.01167
G1 X141.362 Y140.292 E1.11805
G1 X141.612 Y140.008 E.01168
G1 X115.989 Y114.384 E1.11688
G1 X116.279 Y114.14 E.0117
G1 X141.863 Y139.723 E1.11513
G2 X142.103 Y139.428 I-2.835 J-2.549 E.01172
G1 X116.57 Y113.896 E1.11291
G3 X116.87 Y113.66 I2.508 J2.879 E.01174
G1 X142.34 Y139.131 E1.1102
G2 X142.572 Y138.827 I-2.927 J-2.471 E.01177
G1 X117.174 Y113.429 E1.10702
G3 X117.482 Y113.202 I2.431 J2.974 E.01179
G1 X142.795 Y138.516 E1.10336
G2 X143.018 Y138.204 I-3.024 J-2.392 E.01182
G1 X117.8 Y112.986 E1.0992
G1 X118.118 Y112.769 E.01186
G1 X143.228 Y137.879 E1.09448
G1 X143.438 Y137.554 E.01192
G1 X118.448 Y112.564 E1.08922
G1 X118.78 Y112.362 E.01199
G1 X143.637 Y137.218 E1.08345
G1 X143.833 Y136.879 E.01207
G1 X119.121 Y112.167 E1.07715
G1 X119.467 Y111.978 E.01215
G1 X144.023 Y136.534 E1.07032
G1 X144.204 Y136.18 E.01225
G1 X119.817 Y111.794 E1.06295
G1 X120.178 Y111.62 E.01235
G1 X144.383 Y135.825 E1.05502
G1 X144.55 Y135.456 E.01246
G1 X120.54 Y111.446 E1.04652
G1 X120.916 Y111.288 E.01259
G1 X144.716 Y135.087 E1.03737
G2 X144.868 Y134.705 I-3.752 J-1.714 E.0127
G1 X121.292 Y111.129 E1.0276
G3 X121.681 Y110.983 I1.659 J3.833 E.01281
G1 X145.019 Y134.321 E1.01721
G2 X145.158 Y133.925 I-3.887 J-1.59 E.01293
G1 X122.074 Y110.841 E1.00619
G3 X122.476 Y110.708 I1.525 J3.968 E.01307
G1 X145.293 Y133.525 E.9945
G2 X145.417 Y133.114 I-4.049 J-1.456 E.01322
G1 X122.885 Y110.582 E.98212
G3 X123.303 Y110.465 I1.381 J4.128 E.01338
G1 X145.535 Y132.697 E.96903
G2 X145.644 Y132.271 I-4.215 J-1.303 E.01356
G1 X123.729 Y110.357 E.95518
G3 X124.164 Y110.257 I1.217 J4.3 E.01376
G1 X145.743 Y131.835 E.94056
G2 X145.834 Y131.391 I-4.406 J-1.131 E.01398
G1 X124.609 Y110.167 E.92512
G3 X125.063 Y110.086 I1.037 J4.52 E.01422
G1 X145.914 Y130.936 E.90881
G2 X145.984 Y130.472 I-4.626 J-.934 E.0145
G1 X125.528 Y110.016 E.8916
G3 X126.005 Y109.957 I.824 J4.743 E.0148
G1 X146.043 Y129.996 E.87344
G2 X146.089 Y129.507 I-4.873 J-.706 E.01514
G1 X126.491 Y109.909 E.85425
G3 X126.993 Y109.876 I.579 J5.01 E.01552
G1 X146.127 Y129.01 E.83399
G2 X146.145 Y128.493 I-5.168 J-.44 E.01594
G1 X127.503 Y109.851 E.81257
G3 X128.035 Y109.848 I.289 J5.353 E.01642
G1 X146.156 Y127.97 E.78986
G1 X146.143 Y127.421 E.01691
G1 X128.576 Y109.855 E.76568
G1 X129.139 Y109.883 E.01737
G1 X146.117 Y126.861 E.74002
G1 X146.074 Y126.282 E.01787
G1 X129.721 Y109.93 E.71275
G3 X130.319 Y109.993 I-.33 J6.008 E.01854
G1 X146.002 Y125.676 E.68358
G2 X145.911 Y125.05 I-6.318 J.598 E.0195
G1 X130.949 Y110.088 E.65217
G3 X131.606 Y110.21 I-.9 J6.658 E.02062
G1 X145.797 Y124.401 E.61852
G1 X145.639 Y123.708 E.02191
G1 X132.294 Y110.362 E.58168
G3 X133.018 Y110.553 I-1.54 J7.353 E.02311
G1 X145.443 Y122.977 E.54156
G2 X145.2 Y122.199 I-7.92 J2.051 E.02515
G1 X133.793 Y110.792 E.49719
G1 X134.634 Y111.098 E.02758
G1 X144.892 Y121.356 E.44713
G2 X144.496 Y120.425 I-9.522 J3.501 E.03119
G1 X135.569 Y111.498 E.38911
G3 X136.645 Y112.039 I-4.879 J11.046 E.03712
G1 X143.972 Y119.366 E.31937
G2 X143.166 Y118.026 I-20.128 J11.182 E.04819
G1 X137.967 Y112.826 E.22664
G3 X140.667 Y114.991 I-9.77 J14.95 E.10683
G1 X142.607 Y116.932 E.08459
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X141.193 Y115.518 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/32
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-.119 J-1.211 P1  F42000
G1 X112.22 Y118.357 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X117.206 Y112.987 I15.772 J9.645 E.24472
G3 X128.861 Y109.535 I10.778 J14.992 E.41085
G3 X112.188 Y118.408 I-.869 J18.467 E3.19574
M204 S10000
G1 X111.872 Y118.144 F42000
G1 F5400
M204 S6000
G3 X116.969 Y112.656 I16.119 J9.858 E.2501
G3 X128.881 Y109.129 I11.016 J15.322 E.41995
G3 X111.841 Y118.196 I-.889 J18.874 E3.26612
M204 S250
G1 X111.541 Y117.941 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.06 Y117.132 E.02954
G3 X115.973 Y112.919 I15.932 J10.87 E.17735
M73 P48 R10
G3 X128.901 Y108.737 I12.033 J15.128 E.4266
G3 X111.508 Y117.989 I-.909 J19.265 E3.0883
; WIPE_START
M204 S6000
G1 X112.06 Y117.132 E-.38737
G1 X112.623 Y116.353 E-.36537
G1 X112.635 Y116.338 E-.00725
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


G1 X116.904 Y113.421 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42115
G1 F15000
M204 S6000
G1 X115.274 Y115.051 E.07107
G2 X112.833 Y118.027 I13.03 J13.177 E.11884
G1 X118.034 Y112.826 E.22673
G3 X119.356 Y112.039 I11.088 J17.121 E.04743
G1 X112.028 Y119.367 E.31943
G2 X111.504 Y120.426 I10.362 J5.789 E.03644
G1 X120.432 Y111.498 E.38916
G3 X121.366 Y111.098 I4.468 J9.148 E.03134
G1 X111.108 Y121.357 E.44716
G2 X110.8 Y122.199 I8.284 J3.501 E.02765
G1 X122.208 Y110.792 E.49723
G3 X122.982 Y110.552 I2.777 J7.613 E.02499
G1 X110.557 Y122.978 E.54159
G2 X110.361 Y123.708 I7.218 J2.323 E.02331
G1 X123.707 Y110.362 E.58171
G3 X124.394 Y110.21 I1.865 J6.794 E.0217
G1 X110.203 Y124.401 E.61855
G1 X110.088 Y125.051 E.02033
G1 X125.051 Y110.088 E.65219
G1 X125.681 Y109.993 E.01963
G1 X109.998 Y125.676 E.6836
G2 X109.926 Y126.283 I6.032 J1.018 E.01882
G1 X126.279 Y109.93 E.71277
G3 X126.861 Y109.883 I.765 J5.81 E.01801
G1 X109.883 Y126.861 E.74004
G2 X109.857 Y127.422 I5.602 J.538 E.0173
G1 X127.424 Y109.855 E.7657
G3 X127.965 Y109.848 I.332 J5.423 E.01668
G1 X109.844 Y127.97 E.78988
G2 X109.855 Y128.493 I5.266 J.145 E.01614
G1 X128.498 Y109.851 E.81259
G1 X129.007 Y109.876 E.01572
G1 X109.873 Y129.01 E.834
G1 X109.911 Y129.508 E.01538
G1 X129.51 Y109.909 E.85427
G1 X129.996 Y109.958 E.01506
G1 X109.957 Y129.997 E.87345
G1 X110.016 Y130.472 E.01476
G1 X130.472 Y110.016 E.89162
G1 X130.937 Y110.086 E.01449
G1 X110.086 Y130.937 E.90883
G1 X110.166 Y131.391 E.01423
G1 X131.391 Y110.167 E.92513
G1 X131.836 Y110.257 E.01399
G1 X110.257 Y131.836 E.94057
G1 X110.357 Y132.271 E.01377
G1 X132.271 Y110.357 E.95519
G1 X132.697 Y110.465 E.01356
G1 X110.465 Y132.697 E.96904
G1 X110.583 Y133.115 E.01337
G1 X133.115 Y110.582 E.98213
G1 X133.524 Y110.708 E.01319
G1 X110.708 Y133.525 E.99451
G1 X110.842 Y133.925 E.01302
G1 X133.927 Y110.841 E1.0062
G1 X134.319 Y110.983 E.01286
G1 X110.981 Y134.321 E1.01722
G1 X111.132 Y134.705 E.01272
G1 X134.708 Y111.129 E1.02761
G1 X135.084 Y111.288 E.01259
G1 X111.284 Y135.088 E1.03737
G1 X111.451 Y135.456 E.01246
G1 X135.46 Y111.446 E1.04653
G3 X135.822 Y111.62 I-1.547 J3.684 E.01236
G1 X111.617 Y135.825 E1.05503
G2 X111.796 Y136.181 I3.667 J-1.623 E.01228
G1 X136.183 Y111.794 E1.06296
G3 X136.533 Y111.978 I-1.672 J3.601 E.01221
G1 X111.977 Y136.534 E1.07033
G2 X112.167 Y136.88 I3.554 J-1.728 E.01215
G1 X136.88 Y112.167 E1.07716
G3 X137.22 Y112.362 I-1.779 J3.504 E.01209
G1 X112.363 Y137.219 E1.08345
G2 X112.562 Y137.554 I3.458 J-1.831 E.01203
G1 X137.552 Y112.565 E1.08922
G3 X137.882 Y112.769 I-1.88 J3.412 E.01198
G1 X112.772 Y137.879 E1.09449
G1 X112.982 Y138.204 E.01192
G1 X138.2 Y112.986 E1.0992
G1 X138.519 Y113.203 E.01186
G1 X113.205 Y138.516 E1.10336
G1 X113.429 Y138.827 E.01181
G1 X138.826 Y113.43 E1.10702
G1 X139.131 Y113.66 E.01177
G1 X113.66 Y139.131 E1.11021
G1 X113.897 Y139.428 E.01173
G1 X139.43 Y113.896 E1.11291
G1 X139.721 Y114.14 E.0117
G1 X114.137 Y139.724 E1.11513
M73 P49 R10
G1 X114.388 Y140.008 E.01168
G1 X140.012 Y114.384 E1.11688
G1 X140.289 Y114.641 E.01167
G1 X114.639 Y140.292 E1.11805
G2 X114.9 Y140.565 I2.874 J-2.485 E.01167
G1 X140.567 Y114.899 E1.11875
G3 X140.836 Y115.164 I-2.526 J2.834 E.01166
G1 X115.164 Y140.836 E1.11898
G2 X115.434 Y141.102 I2.792 J-2.565 E.01166
G1 X141.1 Y115.435 E1.11875
G3 X141.362 Y115.708 I-2.607 J2.753 E.01167
G1 X115.711 Y141.359 E1.11805
G1 X115.989 Y141.616 E.01167
G1 X141.612 Y115.992 E1.11688
G1 X141.863 Y116.277 E.01168
G1 X116.279 Y141.86 E1.11513
G1 X116.57 Y142.104 E.0117
G1 X142.103 Y116.572 E1.11291
G1 X142.34 Y116.869 E.01173
G1 X116.87 Y142.34 E1.1102
G1 X117.174 Y142.571 E.01177
G1 X142.572 Y117.173 E1.10702
G1 X142.795 Y117.484 E.01181
G1 X117.482 Y142.798 E1.10336
G1 X117.8 Y143.014 E.01186
G1 X143.018 Y117.796 E1.0992
G1 X143.228 Y118.121 E.01192
G1 X118.118 Y143.231 E1.09448
G2 X118.448 Y143.436 I2.215 J-3.216 E.01198
G1 X143.438 Y118.446 E1.08922
G3 X143.637 Y118.782 I-3.261 J2.167 E.01203
G1 X118.78 Y143.638 E1.08345
G2 X119.121 Y143.833 I2.121 J-3.312 E.01209
G1 X143.833 Y119.121 E1.07715
G3 X144.023 Y119.466 I-3.362 J2.072 E.01215
G1 X119.467 Y144.022 E1.07032
G2 X119.817 Y144.206 I2.023 J-3.418 E.01221
G1 X144.204 Y119.82 E1.06295
G3 X144.383 Y120.175 I-3.481 J1.975 E.01228
G1 X120.178 Y144.38 E1.05502
G2 X120.54 Y144.554 I1.893 J-3.478 E.01236
G1 X144.55 Y120.544 E1.04652
G1 X144.716 Y120.913 E.01246
G1 X120.916 Y144.712 E1.03737
G1 X121.292 Y144.871 E.01259
G1 X144.868 Y121.295 E1.0276
G1 X145.019 Y121.679 E.01272
G1 X121.681 Y145.017 E1.01721
G1 X122.074 Y145.159 E.01286
G1 X145.158 Y122.075 E1.00619
G1 X145.293 Y122.475 E.01302
G1 X122.476 Y145.292 E.9945
G1 X122.885 Y145.418 E.01319
G1 X145.417 Y122.886 E.98212
G1 X145.535 Y123.303 E.01337
G1 X123.303 Y145.535 E.96903
G1 X123.729 Y145.643 E.01356
G1 X145.644 Y123.729 E.95518
G1 X145.743 Y124.165 E.01377
G1 X124.164 Y145.743 E.94056
G1 X124.609 Y145.833 E.01399
G1 X145.834 Y124.609 E.92512
G1 X145.914 Y125.064 E.01423
G1 X125.063 Y145.914 E.90881
G1 X125.528 Y145.984 E.01449
G1 X145.984 Y125.528 E.8916
G1 X146.043 Y126.004 E.01476
G1 X126.005 Y146.043 E.87344
G1 X126.491 Y146.091 E.01506
G1 X146.089 Y126.493 E.85425
G1 X146.127 Y126.99 E.01538
G1 X126.993 Y146.124 E.83399
G1 X127.503 Y146.149 E.01572
G1 X146.145 Y127.507 E.81257
G3 X146.156 Y128.03 I-5.221 J.377 E.01614
G1 X128.035 Y146.152 E.78986
G2 X128.576 Y146.145 I.209 J-5.43 E.01668
G1 X146.143 Y128.579 E.76568
G3 X146.117 Y129.139 I-5.629 J.023 E.0173
G1 X129.139 Y146.117 E.74002
G2 X129.721 Y146.07 I-.183 J-5.85 E.01801
G1 X146.074 Y129.718 E.71275
G3 X146.002 Y130.324 I-6.107 J-.412 E.01883
G1 X130.319 Y146.007 E.68358
G1 X130.949 Y145.912 E.01963
G1 X145.911 Y130.95 E.65217
G1 X145.797 Y131.599 E.02033
G1 X131.606 Y145.79 E.61852
G2 X132.293 Y145.638 I-1.18 J-6.954 E.0217
G1 X145.639 Y132.292 E.58168
G3 X145.443 Y133.023 I-7.411 J-1.592 E.02331
G1 X133.018 Y145.447 E.54156
G2 X133.793 Y145.208 I-2.03 J-7.939 E.02499
G1 X145.2 Y133.801 E.49719
G3 X144.892 Y134.644 I-8.595 J-2.66 E.02765
G1 X134.634 Y144.902 E.44713
G2 X135.569 Y144.502 I-3.538 J-9.56 E.03136
G1 X144.496 Y135.575 E.38911
G3 X143.972 Y136.634 I-10.886 J-4.729 E.03644
G1 X136.645 Y143.961 E.31937
G2 X137.967 Y143.174 I-9.75 J-17.878 E.04744
G1 X143.166 Y137.974 E.22664
G3 X141.31 Y140.35 I-14.776 J-9.631 E.09303
G3 X139.097 Y142.578 I-90.408 J-87.58 E.0968
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X140.507 Y141.159 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/32
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.4 I.764 J-.947 P1  F42000
G1 X112.219 Y118.356 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X118.755 Y111.987 I15.772 J9.645 E.3059
G3 X128.739 Y109.529 I9.228 J15.982 E.34566
G3 X112.188 Y118.408 I-.748 J18.473 E3.19978
M204 S10000
G1 X111.872 Y118.144 F42000
G1 F5400
M204 S6000
G3 X117.747 Y112.125 I16.12 J9.858 E.28136
G3 X128.76 Y109.123 I10.263 J15.944 E.38461
G3 X111.841 Y118.196 I-.768 J18.879 E3.27017
M204 S250
G1 X111.537 Y117.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X117.534 Y111.796 I16.454 J10.062 E.26603
G3 X128.779 Y108.731 I10.476 J16.274 E.36377
G3 X111.506 Y117.991 I-.787 J19.271 E3.09196
; WIPE_START
M204 S6000
G1 X112.062 Y117.134 E-.38826
G1 X112.623 Y116.353 E-.36539
G1 X112.634 Y116.34 E-.00635
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


M73 P50 R10
G1 X113.391 Y139.066 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42115
G1 F15000
M204 S6000
G1 X115.339 Y141.014 E.0849
G2 X118.034 Y143.174 I12.442 J-12.761 E.10664
G1 X112.833 Y137.973 E.22673
G3 X112.028 Y136.633 I19.279 J-12.493 E.04818
G1 X119.356 Y143.961 E.31942
G2 X120.432 Y144.502 I5.956 J-10.508 E.03712
G1 X111.504 Y135.574 E.38916
G3 X111.108 Y134.643 I9.127 J-4.432 E.03119
G1 X121.367 Y144.902 E.44717
G1 X122.208 Y145.208 E.02758
G1 X110.8 Y133.801 E.49723
G3 X110.557 Y133.022 I7.674 J-2.828 E.02515
G1 X122.982 Y145.448 E.54159
G2 X123.707 Y145.638 I2.269 J-7.179 E.02311
G1 X110.361 Y132.292 E.58171
G1 X110.203 Y131.599 E.02191
G1 X124.394 Y145.79 E.61855
G2 X125.051 Y145.912 I1.555 J-6.529 E.02061
G1 X110.088 Y130.949 E.65219
G3 X109.998 Y130.324 I6.228 J-1.223 E.0195
G1 X125.681 Y146.007 E.6836
G2 X126.279 Y146.07 I.931 J-5.97 E.01853
G1 X109.926 Y129.717 E.71277
G1 X109.883 Y129.139 E.01787
G1 X126.861 Y146.117 E.74004
G1 X127.424 Y146.145 E.01737
G1 X109.857 Y128.578 E.7657
G1 X109.844 Y128.03 E.01691
G1 X127.965 Y146.152 E.78988
G2 X128.498 Y146.149 I.244 J-5.35 E.01642
G1 X109.855 Y127.507 E.81259
G3 X109.873 Y126.99 I5.183 J-.077 E.01594
G1 X129.007 Y146.124 E.83401
G2 X129.509 Y146.091 I-.077 J-5.049 E.01552
G1 X109.911 Y126.492 E.85427
G3 X109.957 Y126.003 I4.924 J.218 E.01514
G1 X129.996 Y146.042 E.87345
G2 X130.472 Y145.984 I-.348 J-4.799 E.0148
G1 X110.016 Y125.528 E.89162
G3 X110.086 Y125.063 I4.694 J.469 E.0145
G1 X130.937 Y145.914 E.90883
G2 X131.391 Y145.833 I-.582 J-4.594 E.01422
G1 X110.166 Y124.608 E.92513
G3 X110.257 Y124.164 I4.49 J.685 E.01398
G1 X131.836 Y145.743 E.94057
G2 X132.271 Y145.643 I-.784 J-4.405 E.01376
G1 X110.357 Y123.729 E.95519
G3 X110.465 Y123.303 I4.324 J.877 E.01356
G1 X132.697 Y145.535 E.96904
G2 X133.115 Y145.418 I-.965 J-4.25 E.01338
G1 X110.583 Y122.885 E.98213
G3 X110.708 Y122.475 I4.173 J1.046 E.01322
G1 X133.524 Y145.292 E.99451
G2 X133.927 Y145.159 I-1.121 J-4.095 E.01307
G1 X110.842 Y122.075 E1.0062
G3 X110.981 Y121.679 I4.035 J1.197 E.01293
G1 X134.319 Y145.017 E1.01722
G2 X134.708 Y144.871 I-1.268 J-3.972 E.01281
G1 X111.132 Y121.295 E1.02761
G3 X111.284 Y120.912 I3.89 J1.326 E.0127
G1 X135.084 Y144.712 E1.03737
G1 X135.46 Y144.554 E.01259
G1 X111.451 Y120.544 E1.04653
G1 X111.617 Y120.175 E.01246
G1 X135.822 Y144.38 E1.05503
G1 X136.183 Y144.206 E.01235
G1 X111.796 Y119.819 E1.06296
G1 X111.977 Y119.466 E.01225
G1 X136.533 Y144.022 E1.07033
G1 X136.88 Y143.833 E.01215
G1 X112.167 Y119.12 E1.07716
G1 X112.363 Y118.781 E.01207
G1 X137.22 Y143.638 E1.08345
G1 X137.552 Y143.435 E.01199
G1 X112.562 Y118.446 E1.08923
G1 X112.772 Y118.121 E.01192
G1 X137.882 Y143.231 E1.09449
G1 X138.2 Y143.014 E.01186
G1 X112.982 Y117.796 E1.0992
G3 X113.205 Y117.484 I3.238 J2.074 E.01182
G1 X138.518 Y142.797 E1.10336
G2 X138.826 Y142.57 I-2.122 J-3.198 E.01179
G1 X113.429 Y117.173 E1.10702
G3 X113.66 Y116.869 I3.157 J2.167 E.01177
G1 X139.131 Y142.34 E1.11021
G2 X139.429 Y142.103 I-1.778 J-2.543 E.01174
G1 X113.897 Y116.571 E1.11285
G3 X114.137 Y116.276 I3.071 J2.251 E.01172
G1 X139.716 Y141.856 E1.11494
G1 X140.004 Y141.609 E.01169
G1 X114.388 Y115.992 E1.11655
G1 X114.639 Y115.708 E.01168
G1 X140.289 Y141.359 E1.11805
G1 X140.567 Y141.101 E.01167
G1 X114.9 Y115.435 E1.11875
G1 X115.164 Y115.164 E.01166
G1 X140.836 Y140.836 E1.11898
M73 P51 R10
G1 X141.1 Y140.565 E.01166
G1 X115.434 Y114.898 E1.11875
G1 X115.711 Y114.641 E.01167
G1 X141.362 Y140.292 E1.11805
M73 P51 R9
G1 X141.612 Y140.008 E.01168
G1 X115.989 Y114.384 E1.11688
G1 X116.279 Y114.14 E.0117
G1 X141.863 Y139.723 E1.11513
G2 X142.103 Y139.428 I-2.838 J-2.551 E.01172
G1 X116.57 Y113.896 E1.11291
G3 X116.87 Y113.66 I2.51 J2.881 E.01174
G1 X142.34 Y139.131 E1.1102
G2 X142.572 Y138.827 I-2.927 J-2.471 E.01177
G1 X117.174 Y113.429 E1.10702
G3 X117.482 Y113.202 I2.423 J2.963 E.01179
G1 X142.795 Y138.516 E1.10336
G2 X143.018 Y138.204 I-3.024 J-2.392 E.01182
G1 X117.8 Y112.986 E1.0992
G1 X118.118 Y112.769 E.01186
G1 X143.228 Y137.879 E1.09448
G1 X143.438 Y137.554 E.01192
G1 X118.448 Y112.564 E1.08922
G1 X118.78 Y112.362 E.01199
G1 X143.637 Y137.218 E1.08345
G1 X143.833 Y136.879 E.01207
G1 X119.121 Y112.167 E1.07715
G1 X119.467 Y111.978 E.01215
G1 X144.023 Y136.534 E1.07032
G1 X144.204 Y136.18 E.01225
G1 X119.817 Y111.794 E1.06295
G1 X120.178 Y111.62 E.01235
G1 X144.383 Y135.825 E1.05502
G1 X144.55 Y135.456 E.01246
G1 X120.54 Y111.446 E1.04652
G1 X120.916 Y111.288 E.01259
G1 X144.716 Y135.087 E1.03737
G2 X144.868 Y134.705 I-3.752 J-1.714 E.0127
G1 X121.292 Y111.129 E1.0276
G3 X121.681 Y110.983 I1.659 J3.833 E.01281
G1 X145.019 Y134.321 E1.01721
G2 X145.158 Y133.925 I-3.896 J-1.593 E.01293
G1 X122.074 Y110.841 E1.00619
G3 X122.476 Y110.708 I1.525 J3.968 E.01307
G1 X145.293 Y133.525 E.9945
G2 X145.417 Y133.114 I-4.049 J-1.456 E.01322
G1 X122.885 Y110.582 E.98212
G3 X123.303 Y110.465 I1.383 J4.132 E.01338
G1 X145.535 Y132.697 E.96903
G2 X145.644 Y132.271 I-4.216 J-1.303 E.01356
G1 X123.729 Y110.357 E.95518
G3 X124.164 Y110.257 I1.219 J4.307 E.01376
G1 X145.743 Y131.835 E.94056
G2 X145.834 Y131.391 I-4.406 J-1.131 E.01398
G1 X124.609 Y110.167 E.92512
G3 X125.063 Y110.086 I1.036 J4.516 E.01422
G1 X145.914 Y130.936 E.90881
G2 X145.984 Y130.472 I-4.626 J-.934 E.0145
G1 X125.528 Y110.016 E.8916
G3 X126.005 Y109.957 I.824 J4.738 E.0148
G1 X146.043 Y129.996 E.87344
G2 X146.089 Y129.507 I-4.873 J-.706 E.01514
G1 X126.491 Y109.909 E.85425
G3 X126.993 Y109.876 I.579 J5.015 E.01552
G1 X146.127 Y129.01 E.83399
G2 X146.145 Y128.493 I-5.168 J-.44 E.01594
G1 X127.503 Y109.851 E.81257
G3 X128.041 Y109.854 I.24 J4.385 E.01661
G1 X146.156 Y127.97 E.7896
G1 X146.143 Y127.421 E.01691
G1 X128.582 Y109.861 E.76542
G3 X129.139 Y109.883 I-.011 J7.283 E.01719
G1 X146.117 Y126.861 E.74002
G1 X146.074 Y126.282 E.01787
G1 X129.721 Y109.93 E.71275
G3 X130.319 Y109.993 I-.33 J6.008 E.01854
G1 X146.002 Y125.676 E.68358
G2 X145.911 Y125.05 I-6.318 J.598 E.0195
G1 X130.949 Y110.088 E.65217
G3 X131.606 Y110.21 I-.9 J6.658 E.02062
G1 X145.797 Y124.401 E.61852
G1 X145.639 Y123.708 E.02191
G1 X132.294 Y110.363 E.58168
G3 X133.018 Y110.553 I-1.542 J7.361 E.02311
G1 X145.443 Y122.977 E.54156
G2 X145.2 Y122.199 I-7.92 J2.051 E.02515
G1 X133.793 Y110.792 E.49719
G1 X134.634 Y111.098 E.02759
G1 X144.892 Y121.356 E.44713
G2 X144.496 Y120.425 I-9.522 J3.501 E.03119
G1 X135.569 Y111.498 E.38911
G3 X136.645 Y112.039 I-4.883 J11.054 E.03712
G1 X143.972 Y119.366 E.31937
G2 X143.166 Y118.026 I-20.128 J11.182 E.04819
G1 X137.967 Y112.826 E.22664
G3 X140.667 Y114.991 I-9.771 J14.951 E.10683
G1 X142.607 Y116.932 E.08459
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X141.193 Y115.518 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/32
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I-.119 J-1.211 P1  F42000
G1 X112.219 Y118.356 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X121.245 Y110.788 I15.773 J9.643 E.39766
G3 X128.618 Y109.523 I6.78 J17.406 E.24984
G3 X112.188 Y118.407 I-.626 J18.476 E3.20362
M204 S10000
G1 X111.871 Y118.144 F42000
G1 F5400
M204 S6000
G3 X121.096 Y110.409 I16.12 J9.857 E.40643
G3 X128.638 Y109.116 I6.929 J17.787 E.25556
G3 X111.84 Y118.195 I-.647 J18.884 E3.27422
M204 S250
G1 X111.537 Y117.939 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.066 Y110.417 I16.455 J10.061 E.35472
G3 X128.658 Y108.725 I7.919 J17.547 E.27144
G3 X111.506 Y117.991 I-.666 J19.276 E3.09573
; WIPE_START
M204 S6000
G1 X112.062 Y117.134 E-.38822
G1 X112.623 Y116.353 E-.36548
G1 X112.634 Y116.34 E-.0063
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


G1 X122.208 Y113.688 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X120.734 Y114.378 I6.129 J15.008 E.05401
G3 X119.74 Y115.552 I-3.62 J-2.057 E.05132
G2 X119.628 Y117.19 I1.469 J.924 E.05673
G2 X120.536 Y118.173 I9.775 J-8.127 E.04442
G3 X120.649 Y119.811 I-1.469 J.924 E.05673
G3 X119.74 Y120.793 I-9.77 J-8.123 E.04442
G2 X119.628 Y122.431 I1.469 J.924 E.05673
G2 X120.536 Y123.414 I9.776 J-8.128 E.04442
M73 P52 R9
G3 X120.649 Y125.052 I-1.469 J.924 E.05673
G3 X119.74 Y126.035 I-9.768 J-8.121 E.04442
G2 X119.628 Y127.673 I1.469 J.924 E.05673
G2 X120.536 Y128.655 I9.775 J-8.127 E.04442
G3 X120.649 Y130.293 I-1.469 J.924 E.05673
G3 X119.74 Y131.276 I-9.77 J-8.123 E.04442
G2 X119.628 Y132.914 I1.469 J.924 E.05673
G2 X120.536 Y133.897 I9.776 J-8.128 E.04442
G3 X120.649 Y135.535 I-1.469 J.924 E.05673
G3 X119.74 Y136.517 I-9.768 J-8.121 E.04442
G2 X119.628 Y138.155 I1.469 J.924 E.05673
G2 X120.536 Y139.138 I9.775 J-8.127 E.04442
G3 X120.649 Y140.776 I-1.469 J.924 E.05673
G3 X120.171 Y141.308 I-5.284 J-4.262 E.02374
G2 X122.092 Y142.263 I13.12 J-23.982 E.07117
G3 X122.53 Y141.103 I1.276 J-.18 E.0429
G1 X123.157 Y140.448 E.03008
G2 X123.27 Y138.81 I-1.469 J-.924 E.05673
G2 X122.361 Y137.828 I-9.773 J8.125 E.04442
G3 X122.248 Y136.19 I1.469 J-.924 E.05673
G3 X123.157 Y135.207 I9.773 J8.125 E.04442
G2 X123.27 Y133.569 I-1.469 J-.924 E.05673
G2 X122.361 Y132.586 I-9.772 J8.124 E.04442
G3 X122.248 Y130.948 I1.469 J-.924 E.05673
G3 X123.157 Y129.966 I9.772 J8.124 E.04442
G2 X123.27 Y128.328 I-1.469 J-.924 E.05673
G2 X122.361 Y127.345 I-9.772 J8.124 E.04442
G3 X122.248 Y125.707 I1.469 J-.924 E.05673
G3 X123.157 Y124.724 I9.773 J8.125 E.04442
G2 X123.27 Y123.086 I-1.469 J-.924 E.05673
G2 X122.361 Y122.104 I-9.769 J8.122 E.04442
G3 X122.248 Y120.466 I1.469 J-.924 E.05673
G3 X123.157 Y119.483 I9.772 J8.124 E.04442
G2 X123.27 Y117.845 I-1.469 J-.924 E.05673
G2 X122.361 Y116.862 I-9.772 J8.124 E.04442
G3 X122.248 Y115.225 I1.469 J-.924 E.05673
G3 X123.157 Y114.242 I9.773 J8.125 E.04442
G1 X123.429 Y113.587 E.02353
G1 X123.422 Y113.256 E.01096
G3 X125.603 Y112.749 I6.545 J23.193 E.0743
G1 X125.778 Y112.931 E.00837
G3 X125.89 Y114.569 I-1.469 J.924 E.05673
G3 X124.982 Y115.552 I-9.772 J-8.124 E.04442
G2 X124.869 Y117.19 I1.469 J.924 E.05673
G2 X125.778 Y118.173 I9.772 J-8.124 E.04442
G3 X125.89 Y119.811 I-1.469 J.924 E.05673
G3 X124.982 Y120.793 I-9.772 J-8.124 E.04442
G2 X124.869 Y122.431 I1.469 J.924 E.05673
G2 X125.778 Y123.414 I9.773 J-8.125 E.04442
G3 X125.89 Y125.052 I-1.469 J.924 E.05673
G3 X124.982 Y126.035 I-9.769 J-8.122 E.04442
G2 X124.869 Y127.673 I1.469 J.924 E.05673
G2 X125.778 Y128.655 I9.772 J-8.124 E.04442
G3 X125.89 Y130.293 I-1.469 J.924 E.05673
G3 X124.982 Y131.276 I-9.772 J-8.124 E.04442
G2 X124.869 Y132.914 I1.469 J.924 E.05673
G2 X125.778 Y133.897 I9.773 J-8.125 E.04442
G3 X125.89 Y135.535 I-1.469 J.924 E.05673
G3 X124.982 Y136.517 I-9.769 J-8.122 E.04442
G2 X124.869 Y138.155 I1.469 J.924 E.05673
G2 X125.778 Y139.138 I9.772 J-8.124 E.04442
G3 X125.89 Y140.776 I-1.469 J.924 E.05673
G3 X124.982 Y141.759 I-9.772 J-8.124 E.04442
G2 X124.732 Y143.09 I1.34 J.94 E.04631
G2 X126.338 Y143.349 I3.372 J-15.795 E.054
M204 S10000
G1 X112.637 Y126.437 F42000
G1 F15476.087
M204 S6000
G2 X112.559 Y128.063 I100.66 J5.669 E.05399
G1 X112.787 Y128.328 E.0116
G3 X112.685 Y129.941 I-1.566 J.71 E.05582
G2 X114.872 Y136.128 I16.004 J-2.177 E.2192
G2 X115.408 Y135.535 I-5.355 J-5.377 E.02653
G2 X115.295 Y133.897 I-1.582 J-.714 E.05673
G3 X114.386 Y132.914 I8.863 J-9.107 E.04442
G3 X114.499 Y131.276 I1.582 J-.714 E.05673
G2 X115.408 Y130.293 I-8.863 J-9.107 E.04442
G2 X115.295 Y128.655 I-1.582 J-.714 E.05673
G3 X114.386 Y127.673 I8.861 J-9.106 E.04442
G3 X114.499 Y126.035 I1.582 J-.714 E.05673
G2 X115.408 Y125.052 I-8.86 J-9.104 E.04442
G2 X115.295 Y123.414 I-1.582 J-.714 E.05673
G3 X114.386 Y122.431 I8.863 J-9.107 E.04442
G3 X114.499 Y120.793 I1.582 J-.714 E.05673
G2 X115.554 Y119.483 I-2.343 J-2.966 E.05627
G1 X115.566 Y118.848 E.02108
G3 X117.208 Y116.955 I18.591 J14.463 E.08315
G3 X118.028 Y117.845 I-8.035 J8.226 E.04018
G3 X117.916 Y119.483 I-1.582 J.714 E.05673
G2 X117.007 Y120.466 I8.861 J9.106 E.04442
G2 X117.12 Y122.104 I1.582 J.714 E.05673
G3 X118.028 Y123.086 I-8.863 J9.107 E.04442
G3 X117.916 Y124.724 I-1.582 J.714 E.05673
G2 X117.007 Y125.707 I8.863 J9.107 E.04442
G2 X117.12 Y127.345 I1.582 J.714 E.05673
G3 X118.028 Y128.328 I-8.866 J9.11 E.04442
G3 X117.916 Y129.966 I-1.582 J.714 E.05673
G2 X117.007 Y130.948 I8.861 J9.106 E.04442
G2 X117.12 Y132.586 I1.582 J.714 E.05673
G3 X118.028 Y133.569 I-8.866 J9.11 E.04442
G3 X117.916 Y135.207 I-1.582 J.714 E.05673
G2 X117.007 Y136.19 I8.863 J9.107 E.04442
G2 X117.12 Y137.828 I1.582 J.714 E.05673
G3 X118.174 Y139.138 I-2.343 J2.966 E.05627
G1 X118.149 Y139.887 E.02485
G3 X116.952 Y138.783 I9.917 J-11.954 E.054
M204 S10000
G1 X115.332 Y138.708 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X116.436 Y139.893 I12.672 J-10.701 E3.15227
G3 X115.371 Y138.753 I10.911 J-11.253 E.04793
M204 S10000
G1 X115.614 Y138.459 F42000
G1 F15000
M204 S6000
G3 X116.692 Y139.617 I12.389 J-10.451 E3.08066
G3 X115.654 Y138.504 I10.644 J-10.968 E.04678
M204 S10000
G1 X115.897 Y138.209 F42000
G1 F15000
M204 S6000
G3 X116.948 Y139.34 I12.107 J-10.202 E3.00905
G3 X115.937 Y138.254 I10.385 J-10.689 E.04562
M204 S10000
G1 X128.575 Y111.046 F42000
; LINE_WIDTH: 0.420451
G1 F15000
M204 S6000
G2 X133.432 Y111.927 I-.566 J16.953 E3.12636
G2 X128.634 Y111.049 I-5.405 J15.984 E.15058
M204 S10000
G1 X128.593 Y110.669 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G2 X133.561 Y111.573 I-.585 J17.33 E3.19189
G2 X128.653 Y110.672 I-5.534 J16.34 E.15386
M204 S10000
G1 X128.612 Y110.293 F42000
G1 F15000
M204 S6000
G2 X133.69 Y111.219 I-.604 J17.706 E3.26119
G2 X128.672 Y110.296 I-5.664 J16.696 E.15733
M204 S10000
G1 X128.631 Y109.916 F42000
G1 F15000
M204 S6000
G2 X133.819 Y110.864 I-.623 J18.083 E3.3305
G2 X128.691 Y109.919 I-5.793 J17.05 E.1608
M204 S10000
G1 X126.852 Y112.6 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X128.511 Y112.604 I.814 J7.207 E.05516
G1 X128.657 Y112.931 E.0119
G3 X128.398 Y114.242 I-1.623 J.36 E.04559
G2 X127.343 Y115.552 I2.343 J2.966 E.05627
G2 X127.602 Y116.862 I1.623 J.36 E.04559
G3 X128.657 Y118.173 I-2.343 J2.966 E.05627
G3 X128.398 Y119.483 I-1.623 J.36 E.04559
G2 X127.343 Y120.793 I2.343 J2.966 E.05627
G2 X127.602 Y122.104 I1.623 J.36 E.04559
G3 X128.657 Y123.414 I-2.343 J2.966 E.05627
G3 X128.398 Y124.724 I-1.623 J.36 E.04559
G2 X127.343 Y126.035 I2.343 J2.966 E.05627
G2 X127.602 Y127.345 I1.623 J.36 E.04559
G3 X128.657 Y128.655 I-2.343 J2.966 E.05627
G3 X128.398 Y129.966 I-1.623 J.36 E.04559
G2 X127.343 Y131.276 I2.343 J2.966 E.05627
G2 X127.602 Y132.586 I1.623 J.36 E.04559
G3 X128.657 Y133.897 I-2.342 J2.965 E.05627
G3 X128.398 Y135.207 I-1.623 J.36 E.04559
G2 X127.343 Y136.517 I2.343 J2.966 E.05627
G2 X127.602 Y137.828 I1.623 J.36 E.04559
G3 X128.657 Y139.138 I-2.343 J2.966 E.05627
G3 X128.398 Y140.448 I-1.623 J.36 E.04559
G2 X127.343 Y141.759 I2.343 J2.966 E.05627
G2 X127.955 Y143.438 I1.889 J.263 E.0617
G2 X130.067 Y143.301 I-.705 J-27.179 E.07023
G1 X129.964 Y143.069 E.00842
G3 X130.223 Y141.759 I1.623 J-.36 E.04559
G2 X131.278 Y140.448 I-2.343 J-2.966 E.05627
G2 X131.019 Y139.138 I-1.623 J-.36 E.04559
G3 X129.964 Y137.828 I2.342 J-2.965 E.05627
G3 X130.223 Y136.517 I1.623 J-.36 E.04559
G2 X131.278 Y135.207 I-2.343 J-2.966 E.05627
G2 X131.019 Y133.897 I-1.623 J-.36 E.04559
G3 X129.964 Y132.586 I2.343 J-2.966 E.05627
M73 P53 R9
G3 X130.223 Y131.276 I1.623 J-.36 E.04559
G2 X131.278 Y129.966 I-2.343 J-2.966 E.05627
G2 X131.019 Y128.655 I-1.623 J-.36 E.04559
G3 X129.964 Y127.345 I2.343 J-2.966 E.05627
G3 X130.223 Y126.035 I1.623 J-.36 E.04559
G2 X131.278 Y124.724 I-2.342 J-2.965 E.05627
G2 X131.019 Y123.414 I-1.623 J-.36 E.04559
G3 X129.964 Y122.104 I2.343 J-2.966 E.05627
G3 X130.223 Y120.793 I1.623 J-.36 E.04559
G2 X131.278 Y119.483 I-2.343 J-2.966 E.05627
G2 X131.019 Y118.173 I-1.623 J-.36 E.04559
G3 X129.964 Y116.862 I2.343 J-2.966 E.05627
G3 X130.223 Y115.552 I1.623 J-.36 E.04559
G2 X131.278 Y114.242 I-2.342 J-2.965 E.05627
G2 X130.934 Y112.843 I-2.012 J-.248 E.04884
G3 X133.858 Y113.716 I-2.972 J15.286 E.10137
G1 X133.64 Y114.242 E.01889
G2 X132.585 Y115.552 I2.343 J2.966 E.05627
G2 X132.843 Y116.862 I1.623 J.36 E.04559
G3 X133.898 Y118.173 I-2.343 J2.966 E.05627
G3 X133.64 Y119.483 I-1.623 J.36 E.04559
G2 X132.585 Y120.793 I2.343 J2.966 E.05627
G2 X132.843 Y122.104 I1.623 J.36 E.04559
G3 X133.898 Y123.414 I-2.343 J2.966 E.05627
G3 X133.64 Y124.724 I-1.623 J.36 E.04559
G2 X132.585 Y126.035 I2.343 J2.966 E.05627
G2 X132.843 Y127.345 I1.623 J.36 E.04559
G3 X133.898 Y128.655 I-2.343 J2.966 E.05627
G3 X133.64 Y129.966 I-1.623 J.36 E.04559
G2 X132.585 Y131.276 I2.343 J2.966 E.05627
G2 X132.843 Y132.586 I1.623 J.36 E.04559
G3 X133.898 Y133.897 I-2.343 J2.966 E.05627
G3 X133.64 Y135.207 I-1.623 J.36 E.04559
G2 X132.585 Y136.517 I2.343 J2.966 E.05627
G2 X132.843 Y137.828 I1.623 J.36 E.04559
G3 X133.898 Y139.138 I-2.343 J2.966 E.05627
G3 X133.64 Y140.448 I-1.623 J.36 E.04559
G2 X132.585 Y141.759 I2.343 J2.966 E.05627
G1 X132.572 Y142.414 E.02174
G1 X132.694 Y142.708 E.01056
G2 X136.091 Y141.103 I-3.786 J-12.417 E.12507
G2 X136.532 Y139.793 I-.922 J-1.04 E.048
G1 X136.26 Y139.138 E.02353
G3 X135.205 Y137.828 I2.342 J-2.965 E.05627
G3 X135.464 Y136.517 I1.623 J-.36 E.04559
G2 X136.519 Y135.207 I-2.343 J-2.966 E.05627
G2 X136.26 Y133.897 I-1.623 J-.36 E.04559
G3 X135.205 Y132.586 I2.343 J-2.966 E.05627
G3 X135.464 Y131.276 I1.623 J-.36 E.04559
G2 X136.519 Y129.966 I-2.343 J-2.966 E.05627
G2 X136.26 Y128.655 I-1.623 J-.36 E.04559
G3 X135.205 Y127.345 I2.343 J-2.966 E.05627
G3 X135.464 Y126.035 I1.623 J-.36 E.04559
G2 X136.519 Y124.724 I-2.343 J-2.966 E.05627
G2 X136.26 Y123.414 I-1.623 J-.36 E.04559
G3 X135.205 Y122.104 I2.343 J-2.966 E.05627
G3 X135.464 Y120.793 I1.623 J-.36 E.04559
G2 X136.519 Y119.483 I-2.343 J-2.966 E.05627
G2 X136.26 Y118.173 I-1.623 J-.36 E.04559
G3 X135.205 Y116.862 I2.343 J-2.966 E.05627
G3 X135.464 Y115.552 I1.623 J-.36 E.04559
G2 X136.116 Y114.868 I-6.158 J-6.519 E.03138
G3 X137.815 Y116.083 I-14.614 J22.219 E.06932
G1 X137.813 Y116.207 E.00411
G1 X138.085 Y116.862 E.02353
G3 X139.14 Y118.173 I-2.343 J2.966 E.05627
G3 X138.881 Y119.483 I-1.623 J.36 E.04559
G2 X137.826 Y120.793 I2.342 J2.965 E.05627
G2 X138.085 Y122.104 I1.623 J.36 E.04559
G3 X139.14 Y123.414 I-2.343 J2.966 E.05627
G3 X138.881 Y124.724 I-1.623 J.36 E.04559
G2 X137.826 Y126.035 I2.343 J2.966 E.05627
G2 X138.085 Y127.345 I1.623 J.36 E.04559
G3 X139.14 Y128.655 I-2.343 J2.966 E.05627
G3 X138.881 Y129.966 I-1.623 J.36 E.04559
G2 X137.826 Y131.276 I2.342 J2.965 E.05627
G2 X138.085 Y132.586 I1.623 J.36 E.04559
G3 X139.14 Y133.897 I-2.343 J2.966 E.05627
G3 X138.881 Y135.207 I-1.623 J.36 E.04559
G2 X137.826 Y136.517 I2.343 J2.966 E.05627
G2 X138.085 Y137.828 I1.623 J.36 E.04559
G3 X139.002 Y138.83 I-6.861 J7.201 E.0451
G2 X140.453 Y137.125 I-17.816 J-16.634 E.07429
G3 X141.218 Y135.982 I1.857 J.414 E.04668
G2 X141.765 Y134.991 I-9.658 J-5.974 E.03756
G1 X141.773 Y134.552 E.01456
G1 X141.501 Y133.897 E.02353
G3 X140.447 Y132.586 I2.342 J-2.965 E.05627
G3 X140.705 Y131.276 I1.623 J-.36 E.04559
G2 X141.76 Y129.966 I-2.343 J-2.966 E.05627
G2 X141.501 Y128.655 I-1.623 J-.36 E.04559
G3 X140.447 Y127.345 I2.342 J-2.965 E.05627
G3 X140.705 Y126.035 I1.623 J-.36 E.04559
G2 X141.76 Y124.724 I-2.342 J-2.965 E.05627
G2 X141.501 Y123.414 I-1.623 J-.36 E.04559
G3 X140.447 Y122.104 I2.342 J-2.965 E.05627
G3 X140.705 Y120.793 I1.623 J-.36 E.04559
G1 X141.304 Y120.168 E.02873
G3 X143.262 Y125.651 I-14.219 J8.168 E.19416
G2 X143.054 Y126.69 I1.126 J.765 E.0361
G1 X143.326 Y127.345 E.02353
G1 X143.429 Y127.453 E.00494
G3 X143.4 Y129.08 I-15.788 J.535 E.054
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X143.429 Y127.453 E-.61837
G1 X143.326 Y127.345 E-.0566
G1 X143.24 Y127.138 E-.08503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/32
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S181.05
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.8 I.304 J-1.178 P1  F42000
G1 X114.453 Y119.721 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X127.604 Y112.135 I13.539 J8.277 E.52515
G3 X129.151 Y112.172 I.396 J15.515 E.05135
G3 X114.422 Y119.772 I-1.16 J15.826 E2.72889
M204 S10000
G1 X114.105 Y119.509 F42000
G1 F5400
M204 S6000
G3 X127.594 Y111.727 I13.886 J8.489 E.53863
G3 X129.181 Y111.766 I.406 J15.917 E.05268
G3 X114.074 Y119.56 I-1.19 J16.232 E2.79895
; WIPE_START
G1 X114.551 Y118.831 E-.33113
G1 X115.025 Y118.171 E-.30853
G1 X115.222 Y117.924 E-.12033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.536 Y117.939 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X125.601 Y108.86 I16.456 J10.059 E.53211
G3 X128.536 Y108.719 I2.382 J18.979 E.09038
G3 X111.504 Y117.99 I-.545 J19.279 E3.0993
; WIPE_START
M204 S6000
G1 X112.062 Y117.134 E-.38824
G1 X112.623 Y116.353 E-.36548
G1 X112.634 Y116.34 E-.00628
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


G1 X122.018 Y113.682 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X120.551 Y114.387 I5.998 J14.35 E.054
G3 X119.637 Y115.552 I-35.731 J-27.125 E.04913
G2 X120.118 Y117.518 I1.63 J.643 E.07155
G1 X120.64 Y118.173 E.02779
G3 X120.159 Y120.138 I-1.63 J.643 E.07156
G1 X119.637 Y120.793 E.02779
G2 X120.118 Y122.759 I1.63 J.643 E.07155
G1 X120.64 Y123.414 E.02779
G3 X120.159 Y125.38 I-1.63 J.643 E.07156
G1 X119.637 Y126.035 E.02779
G2 X120.118 Y128 I1.63 J.643 E.07155
G1 X120.64 Y128.655 E.02779
G3 X120.159 Y130.621 I-1.63 J.643 E.07156
G1 X119.637 Y131.276 E.02779
G2 X120.118 Y133.241 I1.63 J.643 E.07155
G1 X120.64 Y133.897 E.02779
G3 X120.159 Y135.862 I-1.63 J.643 E.07156
G1 X119.637 Y136.517 E.02779
G2 X120.118 Y138.483 I1.63 J.643 E.07155
G1 X120.64 Y139.138 E.02779
G3 X120.159 Y141.103 I-1.63 J.643 E.07156
G1 X120.003 Y141.298 E.00827
G3 X118.13 Y139.975 I12.977 J-20.347 E.07612
G1 X118.173 Y139.793 E.00618
G1 X118.043 Y139.138 E.02216
G2 X117.016 Y137.828 I-40.193 J30.447 E.05523
G3 X117.497 Y135.862 I1.63 J-.643 E.07155
G1 X118.019 Y135.207 E.02779
G2 X117.538 Y133.241 I-1.63 J-.643 E.07156
G1 X117.016 Y132.586 E.02779
G3 X117.497 Y130.621 I1.63 J-.643 E.07156
G1 X118.019 Y129.966 E.02779
G2 X117.538 Y128 I-1.63 J-.643 E.07156
G1 X117.016 Y127.345 E.02779
G3 X117.497 Y125.38 I1.63 J-.643 E.07156
G1 X118.019 Y124.724 E.02779
G2 X117.538 Y122.759 I-1.63 J-.643 E.07156
G1 X117.016 Y122.104 E.02779
G3 X117.497 Y120.138 I1.63 J-.643 E.07156
G1 X118.019 Y119.483 E.02779
G2 X117.538 Y117.518 I-1.63 J-.643 E.07156
G1 X117.093 Y116.959 E.02369
G2 X115.535 Y118.755 I18.133 J17.299 E.0789
G1 X115.422 Y119.483 E.02443
G3 X114.395 Y120.793 I-40.152 J-30.415 E.05523
G2 X114.876 Y122.759 I1.63 J.643 E.07156
G1 X115.399 Y123.414 E.02779
G3 X114.918 Y125.38 I-1.63 J.643 E.07156
G1 X114.395 Y126.035 E.02779
G2 X114.876 Y128 I1.63 J.643 E.07156
G1 X115.399 Y128.655 E.02779
G3 X114.918 Y130.621 I-1.63 J.643 E.07156
G1 X114.395 Y131.276 E.02779
G2 X114.876 Y133.241 I1.63 J.643 E.07156
G1 X115.399 Y133.897 E.02779
G3 X114.918 Y135.862 I-1.63 J.643 E.07156
G1 X114.746 Y136.078 E.00914
G3 X112.632 Y130.157 I13.39 J-8.119 E.20998
G1 X112.778 Y129.966 E.00798
G2 X112.484 Y128.243 I-1.335 J-.659 E.06195
G3 X112.543 Y126.617 I16.356 J-.222 E.054
M204 S10000
G1 X123.65 Y142.897 F42000
G1 F15476.087
M204 S6000
G3 X122.115 Y142.359 I4.674 J-15.793 E.054
G1 X122.233 Y141.759 E.02029
G1 X122.738 Y141.103 E.02744
G2 X123.284 Y139.138 I-1.159 J-1.381 E.07193
G1 X122.78 Y138.483 E.02744
G3 X122.233 Y136.517 I1.159 J-1.381 E.07193
G1 X122.738 Y135.862 E.02744
G2 X123.284 Y133.897 I-1.159 J-1.381 E.07193
G1 X122.78 Y133.241 E.02744
G3 X122.233 Y131.276 I1.159 J-1.381 E.07193
G1 X122.738 Y130.621 E.02744
M73 P54 R9
G2 X123.284 Y128.655 I-1.159 J-1.381 E.07193
G1 X122.78 Y128 E.02744
G3 X122.233 Y126.035 I1.159 J-1.381 E.07193
G1 X122.738 Y125.38 E.02744
G2 X123.284 Y123.414 I-1.159 J-1.381 E.07193
G1 X122.78 Y122.759 E.02744
G3 X122.233 Y120.793 I1.159 J-1.381 E.07193
G1 X122.738 Y120.138 E.02744
G2 X123.284 Y118.173 I-1.159 J-1.381 E.07193
G1 X122.78 Y117.518 E.02744
G3 X122.233 Y115.552 I1.159 J-1.381 E.07193
G3 X123.26 Y114.242 I40.216 J30.465 E.05523
G1 X123.414 Y113.587 E.02232
G1 X123.337 Y113.2 E.01309
G3 X125.664 Y112.66 I6.298 J21.857 E.07928
G3 X125.905 Y114.242 I-1.098 J.976 E.05614
G1 X125.4 Y114.897 E.02744
G2 X124.854 Y116.862 I1.159 J1.381 E.07193
G1 X125.359 Y117.518 E.02744
G3 X125.905 Y119.483 I-1.159 J1.381 E.07193
G1 X125.4 Y120.138 E.02744
G2 X124.854 Y122.104 I1.159 J1.381 E.07193
G1 X125.359 Y122.759 E.02744
G3 X125.905 Y124.724 I-1.159 J1.381 E.07193
G1 X125.4 Y125.38 E.02744
G2 X124.854 Y127.345 I1.159 J1.381 E.07193
G1 X125.359 Y128 E.02744
G3 X125.905 Y129.966 I-1.159 J1.381 E.07193
G1 X125.4 Y130.621 E.02744
G2 X124.854 Y132.586 I1.159 J1.381 E.07193
G1 X125.359 Y133.241 E.02744
G3 X125.905 Y135.207 I-1.159 J1.381 E.07193
G1 X125.4 Y135.862 E.02744
G2 X124.854 Y137.828 I1.159 J1.381 E.07193
G1 X125.359 Y138.483 E.02744
G3 X125.905 Y140.448 I-1.159 J1.381 E.07193
G1 X125.4 Y141.103 E.02744
G2 X124.854 Y143.069 I1.159 J1.381 E.07193
G1 X124.969 Y143.218 E.00626
G2 X127.856 Y143.517 I3.043 J-15.304 E.09641
G3 X127.475 Y141.759 I1.199 J-1.181 E.06298
G1 X127.98 Y141.103 E.02744
G2 X128.526 Y139.138 I-1.159 J-1.381 E.07193
G1 X128.021 Y138.483 E.02744
G3 X127.475 Y136.517 I1.159 J-1.381 E.07193
G1 X127.98 Y135.862 E.02744
G2 X128.526 Y133.897 I-1.159 J-1.381 E.07193
G1 X128.021 Y133.241 E.02744
G3 X127.475 Y131.276 I1.159 J-1.381 E.07193
G1 X127.98 Y130.621 E.02744
G2 X128.526 Y128.655 I-1.159 J-1.381 E.07193
G1 X128.021 Y128 E.02744
G3 X127.475 Y126.035 I1.159 J-1.381 E.07193
G1 X127.98 Y125.38 E.02744
G2 X128.526 Y123.414 I-1.159 J-1.381 E.07193
G1 X128.021 Y122.759 E.02744
G3 X127.475 Y120.793 I1.159 J-1.381 E.07193
G1 X127.98 Y120.138 E.02744
G2 X128.526 Y118.173 I-1.159 J-1.381 E.07193
G1 X128.021 Y117.518 E.02744
G3 X127.475 Y115.552 I1.159 J-1.381 E.07193
G1 X127.98 Y114.897 E.02744
G2 X128.526 Y112.931 I-1.159 J-1.381 E.07193
G1 X128.18 Y112.483 E.01879
G3 X130.998 Y112.775 I-.224 J15.897 E.09409
G3 X131.146 Y114.242 I-1.45 J.888 E.05059
G1 X130.641 Y114.897 E.02744
G2 X130.095 Y116.862 I1.159 J1.381 E.07193
G1 X130.6 Y117.518 E.02744
G3 X131.146 Y119.483 I-1.159 J1.381 E.07193
G1 X130.641 Y120.138 E.02744
G2 X130.095 Y122.104 I1.159 J1.381 E.07193
G1 X130.6 Y122.759 E.02744
G3 X131.146 Y124.724 I-1.159 J1.381 E.07193
G1 X130.641 Y125.38 E.02744
G2 X130.095 Y127.345 I1.159 J1.381 E.07193
G1 X130.6 Y128 E.02744
G3 X131.146 Y129.966 I-1.159 J1.381 E.07193
G1 X130.641 Y130.621 E.02744
G2 X130.095 Y132.586 I1.159 J1.381 E.07193
G1 X130.6 Y133.241 E.02744
G3 X131.146 Y135.207 I-1.159 J1.381 E.07193
G1 X130.641 Y135.862 E.02744
G2 X130.095 Y137.828 I1.159 J1.381 E.07193
G1 X130.6 Y138.483 E.02744
G3 X131.146 Y140.448 I-1.159 J1.381 E.07193
G1 X130.641 Y141.103 E.02744
G2 X130.095 Y143.069 I1.159 J1.381 E.07193
G1 X130.308 Y143.345 E.01154
G2 X132.676 Y142.796 I-3.864 J-22.075 E.08067
G1 X132.586 Y142.414 E.01303
G1 X132.716 Y141.759 E.02216
G1 X133.221 Y141.103 E.02744
G2 X133.767 Y139.138 I-1.159 J-1.381 E.07193
G1 X133.262 Y138.483 E.02744
G3 X132.716 Y136.517 I1.159 J-1.381 E.07193
G1 X133.221 Y135.862 E.02744
G2 X133.767 Y133.897 I-1.159 J-1.381 E.07193
G1 X133.262 Y133.241 E.02744
G3 X132.716 Y131.276 I1.159 J-1.381 E.07193
G1 X133.221 Y130.621 E.02744
G2 X133.767 Y128.655 I-1.159 J-1.381 E.07193
G1 X133.262 Y128 E.02744
G3 X132.716 Y126.035 I1.159 J-1.381 E.07193
G1 X133.221 Y125.38 E.02744
G2 X133.767 Y123.414 I-1.159 J-1.381 E.07193
G1 X133.262 Y122.759 E.02744
G3 X132.716 Y120.793 I1.159 J-1.381 E.07193
G1 X133.221 Y120.138 E.02744
G2 X133.767 Y118.173 I-1.159 J-1.381 E.07193
G1 X133.262 Y117.518 E.02744
G3 X132.716 Y115.552 I1.159 J-1.381 E.07193
G3 X133.743 Y114.242 I40.17 J30.429 E.05523
G1 X133.884 Y113.641 E.02047
G2 X132.348 Y113.103 I-6.209 J15.258 E.05401
; WIPE_START
G1 X133.884 Y113.641 E-.61841
G1 X133.799 Y114.004 E-.1416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.998 Y116.538 Z3 F42000
G1 X143.986 Y117.589 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X138.395 Y111.999 E.24295
; WIPE_START
M204 S6000
G1 X139.809 Y113.413 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X137.093 Y111.23 Z3 F42000
G1 Z2.6
G1 E.8 F1800
M204 S2000
G1 X144.782 Y118.919 E.33412
G1 X145.31 Y119.98
G1 X136.017 Y110.687 E.40382
G1 X135.078 Y110.281
G1 X145.713 Y120.917 E.46216
G1 X146.03 Y121.767
G1 X134.23 Y109.967 E.51279
G1 X133.446 Y109.717
G1 X146.285 Y122.555 E.55791
G1 X146.494 Y123.297
G1 X140.834 Y117.637 E.24595
M204 S10000
G1 X142.106 Y119.443 F42000
G1 F1800
M204 S2000
G1 X146.651 Y123.988 E.1975
G1 X146.78 Y124.65
G1 X142.756 Y120.626 E.17488
G1 X143.215 Y121.619
G1 X146.886 Y125.289 E.15951
G1 X146.962 Y125.899
G1 X143.548 Y122.484 E.14838
G1 X143.806 Y123.276
G1 X147.017 Y126.486 E.1395
G1 X147.059 Y127.062
G1 X144.009 Y124.012 E.13254
G1 X144.167 Y124.703
G1 X147.073 Y127.609 E.12628
G1 X147.079 Y128.148
G1 X144.283 Y125.352 E.12151
G1 X144.37 Y125.973
G1 X147.066 Y128.668 E.11715
G1 X147.042 Y129.178
G1 X144.434 Y126.57 E.11332
G1 X144.477 Y127.146
G1 X147.005 Y129.674 E.10982
G1 X146.955 Y130.158
G1 X144.493 Y127.695 E.10702
G1 X144.494 Y128.23
G1 X146.896 Y130.632 E.10436
G1 X146.825 Y131.094
G1 X144.481 Y128.75 E.10185
G1 X144.448 Y129.25
G1 X146.745 Y131.548 E.09985
G1 X146.656 Y131.992
G1 X144.406 Y129.741 E.09779
G1 X144.346 Y130.215
G1 X146.557 Y132.426 E.09606
G1 X146.452 Y132.854
G1 X144.277 Y130.679 E.0945
G1 X144.197 Y131.132
G1 X146.335 Y133.27 E.09288
G1 X146.215 Y133.683
G1 X144.104 Y131.572 E.09174
G1 X144.005 Y132.007
G1 X146.081 Y134.083 E.09022
G1 X145.947 Y134.482
G1 X143.89 Y132.425 E.08936
G1 X143.773 Y132.842
G1 X145.798 Y134.867 E.088
G1 X145.648 Y135.25
G1 X143.64 Y133.242 E.08725
G1 X143.506 Y133.641
G1 X145.489 Y135.624 E.08616
G1 X145.323 Y135.991
G1 X143.356 Y134.024 E.08548
G1 X143.205 Y134.407
G1 X145.154 Y136.355 E.08467
G1 X144.973 Y136.708
G1 X143.04 Y134.774 E.08402
G1 X142.874 Y135.142
G1 X144.792 Y137.06 E.08337
G1 X144.6 Y137.401
G1 X142.694 Y135.495 E.08283
G1 X142.513 Y135.848
G1 X144.405 Y137.739 E.0822
G1 X144.204 Y138.072
G1 X142.32 Y136.187 E.08189
G1 X142.125 Y136.525
G1 X143.995 Y138.396 E.08128
G1 X143.786 Y138.72
G1 X141.919 Y136.853 E.08114
G1 X141.709 Y137.177
G1 X143.564 Y139.031 E.0806
G1 X143.341 Y139.342
G1 X141.491 Y137.492 E.08038
G1 X141.268 Y137.802
G1 X143.112 Y139.646 E.08013
G1 X142.876 Y139.943
G1 X141.039 Y138.106 E.07983
G1 X140.802 Y138.403
G1 X142.639 Y140.24 E.07983
G1 X142.39 Y140.524
G1 X140.561 Y138.695 E.07948
G1 X140.311 Y138.978
G1 X142.14 Y140.807 E.07948
G1 X141.885 Y141.085
G1 X140.06 Y139.26 E.07933
G1 X139.796 Y139.53
G1 X141.622 Y141.355 E.07933
G1 X141.359 Y141.625
G1 X139.533 Y139.8 E.07933
G1 X139.257 Y140.057
G1 X141.084 Y141.884 E.07938
G1 X140.807 Y142.14
G1 X138.98 Y140.314 E.07938
G1 X138.693 Y140.56
G1 X140.526 Y142.392 E.07963
G1 X140.236 Y142.636
G1 X138.403 Y140.803 E.07963
G1 X138.105 Y141.038
G1 X139.946 Y142.879 E.07998
G1 X139.645 Y143.111
G1 X137.802 Y141.268 E.08008
G1 X137.493 Y141.492
G1 X139.341 Y143.341 E.08034
G1 X139.033 Y143.566
G1 X137.175 Y141.708 E.08073
G1 X136.854 Y141.92
G1 X138.716 Y143.782 E.08091
G1 X138.399 Y143.998
G1 X136.523 Y142.123 E.08151
G1 X136.19 Y142.322
G1 X138.07 Y144.203 E.08171
G1 X137.739 Y144.405
G1 X135.845 Y142.51 E.08233
G1 X135.498 Y142.697
G1 X137.402 Y144.601 E.08275
G1 X137.057 Y144.79
G1 X135.138 Y142.871 E.08339
G1 X134.778 Y143.043
G1 X136.712 Y144.978 E.08404
G1 X136.352 Y145.151
G1 X134.403 Y143.202 E.08472
G1 X134.028 Y143.36
G1 X135.992 Y145.324 E.08538
M73 P55 R9
G1 X135.623 Y145.489
G1 X133.637 Y143.502 E.08633
G1 X133.245 Y143.644
G1 X135.248 Y145.647 E.08703
G1 X134.869 Y145.801
G1 X132.838 Y143.77 E.08826
G1 X132.429 Y143.894
G1 X134.478 Y145.943 E.08905
G1 X134.087 Y146.085
G1 X132.004 Y144.002 E.09054
G1 X131.574 Y144.106
G1 X133.68 Y146.211 E.09149
G1 X133.272 Y146.337
G1 X131.131 Y144.196 E.09305
G1 X130.679 Y144.277
G1 X132.852 Y146.45 E.0944
G1 X132.427 Y146.558
G1 X130.216 Y144.347 E.09607
G1 X129.739 Y144.403
G1 X131.991 Y146.656 E.09787
G1 X131.547 Y146.745
G1 X129.254 Y144.452 E.09966
G1 X128.747 Y144.478
G1 X131.094 Y146.826 E.102
G1 X130.631 Y146.895
G1 X128.231 Y144.495 E.10431
G1 X127.697 Y144.495
G1 X130.158 Y146.956 E.10694
G1 X129.673 Y147.004
G1 X127.142 Y144.473 E.11001
G1 X126.57 Y144.434
G1 X129.177 Y147.042 E.1133
G1 X128.669 Y147.067
G1 X125.978 Y144.375 E.11697
G1 X125.351 Y144.282
G1 X128.146 Y147.077 E.12143
G1 X127.613 Y147.077
G1 X124.697 Y144.161 E.1267
G1 X124.008 Y144.005
G1 X127.056 Y147.053 E.13247
G1 X126.49 Y147.021
G1 X123.274 Y143.804 E.13978
G1 X122.481 Y143.545
G1 X125.898 Y146.961 E.14846
G1 X125.286 Y146.883
G1 X121.61 Y143.207 E.15974
G1 X120.627 Y142.758
G1 X124.656 Y146.786 E.17508
G1 X123.988 Y146.651
G1 X119.431 Y142.095 E.198
M204 S10000
G1 X117.658 Y140.855 F42000
G1 F1800
M204 S2000
G1 X123.289 Y146.486 E.2447
; WIPE_START
M204 S6000
G1 X121.875 Y145.071 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X125.554 Y138.384 Z3 F42000
G1 X138.341 Y115.145 Z3
G1 Z2.6
G1 E.8 F1800
M204 S2000
G1 X132.711 Y109.514 E.24467
G1 X132.012 Y109.349
G1 X136.568 Y113.905 E.198
M204 S10000
G1 X135.372 Y113.242 F42000
G1 F1800
M204 S2000
G1 X131.344 Y109.213 E.17507
G1 X130.714 Y109.117
G1 X134.39 Y112.793 E.15973
G1 X133.519 Y112.455
G1 X130.102 Y109.039 E.14846
G1 X129.51 Y108.979
G1 X132.726 Y112.196 E.13978
G1 X131.992 Y111.995
G1 X128.944 Y108.947 E.13247
G1 X128.387 Y108.923
G1 X131.303 Y111.839 E.1267
G1 X130.648 Y111.718
G1 X127.854 Y108.923 E.12143
G1 X127.33 Y108.933
G1 X130.022 Y111.625 E.11698
G1 X129.431 Y111.567
G1 X126.823 Y108.958 E.11336
G1 X126.326 Y108.996
G1 X128.858 Y111.527 E.11001
G1 X128.303 Y111.505
G1 X125.842 Y109.044 E.10693
G1 X125.369 Y109.105
G1 X127.769 Y111.505 E.10431
G1 X127.253 Y111.522
G1 X124.905 Y109.174 E.102
G1 X124.452 Y109.255
G1 X126.746 Y111.548 E.09966
G1 X126.261 Y111.597
G1 X124.009 Y109.344 E.09787
G1 X123.573 Y109.442
G1 X125.784 Y111.653 E.09607
G1 X125.321 Y111.723
G1 X123.148 Y109.55 E.0944
G1 X122.728 Y109.663
G1 X124.869 Y111.804 E.09305
G1 X124.425 Y111.894
G1 X122.32 Y109.789 E.09149
G1 X121.913 Y109.915
G1 X123.996 Y111.998 E.09053
G1 X123.571 Y112.106
G1 X121.522 Y110.057 E.08905
G1 X121.131 Y110.199
G1 X123.162 Y112.23 E.08826
G1 X122.755 Y112.356
G1 X120.752 Y110.353 E.08703
G1 X120.377 Y110.511
G1 X122.363 Y112.498 E.08633
G1 X121.972 Y112.64
G1 X120.008 Y110.676 E.08538
G1 X119.648 Y110.849
G1 X121.597 Y112.798 E.08471
G1 X121.222 Y112.957
G1 X119.288 Y111.023 E.08404
G1 X118.943 Y111.211
G1 X120.862 Y113.13 E.08339
G1 X120.502 Y113.303
G1 X118.597 Y111.399 E.08275
G1 X118.261 Y111.595
G1 X120.155 Y113.49 E.08233
G1 X119.81 Y113.678
G1 X117.93 Y111.797 E.08171
G1 X117.601 Y112.002
G1 X119.477 Y113.877 E.08151
G1 X119.146 Y114.08
G1 X117.284 Y112.218 E.08091
G1 X116.967 Y112.434
G1 X118.824 Y114.292 E.08073
G1 X118.507 Y114.508
G1 X116.659 Y112.659 E.08034
G1 X116.355 Y112.889
G1 X118.198 Y114.732 E.08008
G1 X117.895 Y114.962
G1 X116.054 Y113.121 E.07998
G1 X115.764 Y113.364
G1 X117.596 Y115.197 E.07963
G1 X117.307 Y115.44
G1 X115.474 Y113.608 E.07963
G1 X115.193 Y113.86
G1 X117.02 Y115.687 E.07938
G1 X116.743 Y115.943
G1 X114.916 Y114.116 E.07938
G1 X114.641 Y114.375
G1 X116.467 Y116.2 E.07933
G1 X116.204 Y116.47
G1 X114.378 Y114.645 E.07933
G1 X114.115 Y114.915
G1 X115.94 Y116.74 E.07933
G1 X115.689 Y117.022
G1 X113.86 Y115.193 E.07948
G1 X113.61 Y115.476
G1 X115.439 Y117.305 E.07948
G1 X115.198 Y117.598
G1 X113.361 Y115.761 E.07983
G1 X113.124 Y116.057
G1 X114.961 Y117.894 E.07983
M73 P55 R8
G1 X114.732 Y118.198
G1 X112.888 Y116.354 E.08013
G1 X112.659 Y116.658
G1 X114.509 Y118.508 E.08038
G1 X114.291 Y118.823
G1 X112.436 Y116.969 E.0806
G1 X112.214 Y117.28
G1 X114.081 Y119.147 E.08114
G1 X113.875 Y119.475
G1 X112.005 Y117.604 E.08128
G1 X111.796 Y117.928
G1 X113.68 Y119.813 E.08189
G1 X113.487 Y120.153
G1 X111.595 Y118.261 E.0822
M73 P56 R8
G1 X111.4 Y118.599
G1 X113.306 Y120.505 E.08283
G1 X113.126 Y120.858
G1 X111.207 Y118.94 E.08337
G1 X111.027 Y119.292
G1 X112.96 Y121.226 E.08402
G1 X112.795 Y121.593
G1 X110.846 Y119.645 E.08467
G1 X110.677 Y120.009
G1 X112.644 Y121.976 E.08548
G1 X112.494 Y122.359
G1 X110.511 Y120.377 E.08616
G1 X110.352 Y120.751
G1 X112.36 Y122.758 E.08725
G1 X112.227 Y123.159
G1 X110.202 Y121.134 E.088
G1 X110.053 Y121.518
G1 X112.11 Y123.575 E.08936
G1 X111.995 Y123.994
G1 X109.919 Y121.917 E.09022
G1 X109.785 Y122.317
G1 X111.896 Y124.428 E.09174
G1 X111.803 Y124.868
G1 X109.665 Y122.73 E.09288
G1 X109.548 Y123.146
G1 X111.723 Y125.321 E.0945
G1 X111.654 Y125.785
G1 X109.443 Y123.574 E.09606
G1 X109.344 Y124.009
G1 X111.594 Y126.259 E.09779
G1 X111.552 Y126.75
G1 X109.255 Y124.453 E.09985
G1 X109.175 Y124.906
G1 X111.519 Y127.25 E.10185
G1 X111.506 Y127.77
G1 X109.104 Y125.368 E.10436
G1 X109.045 Y125.842
G1 X111.507 Y128.305 E.10702
G1 X111.523 Y128.854
G1 X108.995 Y126.326 E.10982
G1 X108.958 Y126.822
G1 X111.566 Y129.43 E.11332
G1 X111.63 Y130.028
G1 X108.934 Y127.332 E.11715
G1 X108.921 Y127.852
G1 X111.717 Y130.648 E.12151
G1 X111.833 Y131.297
G1 X108.927 Y128.391 E.12629
G1 X108.941 Y128.938
G1 X111.991 Y131.988 E.13255
G1 X112.194 Y132.724
G1 X108.983 Y129.514 E.1395
G1 X109.038 Y130.101
G1 X112.452 Y133.516 E.14838
G1 X112.785 Y134.382
G1 X109.114 Y130.711 E.15951
G1 X109.22 Y131.35
G1 X113.244 Y135.375 E.17488
M204 S10000
G1 X113.894 Y136.557 F42000
G1 F1800
M204 S2000
G1 X109.349 Y132.012 E.19751
G1 X109.506 Y132.703
G1 X115.173 Y138.37 E.24627
; WIPE_START
M204 S6000
G1 X113.759 Y136.956 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X109.715 Y133.445 Z3 F42000
G1 Z2.6
G1 E.8 F1800
M204 S2000
G1 X122.553 Y146.283 E.5579
G1 X121.77 Y146.033
G1 X109.97 Y134.233 E.51278
G1 X110.287 Y135.083
G1 X120.922 Y145.719 E.46215
G1 X119.983 Y145.312
G1 X110.69 Y136.02 E.4038
G1 X111.218 Y137.081
G1 X118.907 Y144.77 E.33411
; WIPE_START
M204 S6000
G1 X117.493 Y143.356 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X117.605 Y144.001 Z3 F42000
G1 Z2.6
G1 E.8 F1800
M204 S2000
G1 X112.015 Y138.411 E.24292
; WIPE_START
M204 S6000
G1 X113.429 Y139.825 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X110.752 Y135.958 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192517
G1 F15000
M204 S6000
G1 X110.665 Y135.832 E.00186
; LINE_WIDTH: 0.150781
G1 X110.579 Y135.707 E.00134
; LINE_WIDTH: 0.109044
G1 X110.492 Y135.582 E.00082
; WIPE_START
G1 X110.579 Y135.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.909 Y131.616 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0999489
G1 F15000
M204 S6000
G1 X111.886 Y131.575 E.00022
G1 X111.886 Y131.443 E.00061
M204 S10000
G1 X112.304 Y133.081 F42000
; LINE_WIDTH: 0.187611
G1 F15000
M204 S6000
G3 X112.13 Y132.788 I12.123 J-7.436 E.00402
M204 S10000
G1 X112.98 Y134.817 F42000
; LINE_WIDTH: 0.108831
G1 F15000
M204 S6000
G1 X112.894 Y134.693 E.00081
; LINE_WIDTH: 0.150142
G1 X112.808 Y134.568 E.00132
; LINE_WIDTH: 0.191452
G1 X112.722 Y134.444 E.00183
M204 S10000
G1 X113.496 Y135.865 F42000
; LINE_WIDTH: 0.109884
G1 F15000
M204 S6000
G1 X113.391 Y135.722 E.00097
; LINE_WIDTH: 0.153302
G1 X113.287 Y135.579 E.00159
; LINE_WIDTH: 0.19672
G1 X113.183 Y135.436 E.00222
M204 S10000
G1 X114.314 Y137.215 F42000
; LINE_WIDTH: 0.11115
G1 F15000
M204 S6000
G1 X114.153 Y137.016 E.00142
; LINE_WIDTH: 0.157128
G1 X113.993 Y136.818 E.00238
; LINE_WIDTH: 0.203105
G1 X113.832 Y136.619 E.00334
; WIPE_START
G1 X113.993 Y136.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.075 Y138.35 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.205324
G1 F15000
M204 S6000
G1 X111.908 Y138.143 E.00352
; LINE_WIDTH: 0.158884
G1 X111.741 Y137.936 E.00252
; LINE_WIDTH: 0.11192
G1 X111.616 Y137.774 E.00115
; WIPE_START
G1 X111.741 Y137.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.598 Y140.915 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.227168
G1 F15000
M204 S6000
G1 X117.323 Y140.663 E.00559
; LINE_WIDTH: 0.198901
G1 X117.047 Y140.409 E.00477
; LINE_WIDTH: 0.164203
G1 X115.873 Y139.25 E.0163
; LINE_WIDTH: 0.188965
G1 X115.331 Y138.674 E.00941
; LINE_WIDTH: 0.22629
G1 X115.113 Y138.43 E.00488
; WIPE_START
G1 X115.331 Y138.674 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.603 Y143.295 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.108846
G1 F15000
M204 S6000
G1 X116.367 Y143.09 E.00168
; LINE_WIDTH: 0.150202
G1 X116.13 Y142.884 E.00274
; LINE_WIDTH: 0.191588
G1 X115.781 Y142.563 E.00575
; LINE_WIDTH: 0.232976
G1 X115.431 Y142.243 E.00735
; LINE_WIDTH: 0.277279
G3 X114.083 Y140.912 I26.015 J-27.689 E.03617
; LINE_WIDTH: 0.262531
G1 X113.759 Y140.567 E.00848
; LINE_WIDTH: 0.233011
G1 X113.435 Y140.222 E.00734
; LINE_WIDTH: 0.200477
G1 X113.223 Y139.985 E.00407
; LINE_WIDTH: 0.164913
G1 X113.012 Y139.749 E.00315
; LINE_WIDTH: 0.129348
G1 X112.801 Y139.513 E.00223
; LINE_WIDTH: 0.0998715
G1 X112.693 Y139.385 E.00078
; WIPE_START
G1 X112.801 Y139.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.222 Y144.38 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.111521
G1 F15000
M204 S6000
G1 X118.036 Y144.234 E.00132
; LINE_WIDTH: 0.158236
G1 X117.85 Y144.087 E.00222
; LINE_WIDTH: 0.20495
G1 X117.665 Y143.941 E.00312
; WIPE_START
G1 X117.85 Y144.087 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.417 Y145.04 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.107394
G1 F15000
M204 S6000
G1 X119.305 Y144.96 E.00072
; LINE_WIDTH: 0.150215
G1 X119.136 Y144.835 E.00184
; LINE_WIDTH: 0.197375
G1 X118.968 Y144.709 E.00264
; WIPE_START
G1 X119.136 Y144.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.284 Y144.35 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.124198
G1 F15000
M204 S6000
G1 X125.056 Y144.232 E.0017
M204 S10000
G1 X120.566 Y142.819 F42000
; LINE_WIDTH: 0.206121
G1 F15000
M204 S6000
G1 X120.445 Y142.733 E.00197
; LINE_WIDTH: 0.177738
G1 X120.338 Y142.654 E.00146
; LINE_WIDTH: 0.14191
G1 X120.232 Y142.574 E.00107
; LINE_WIDTH: 0.106082
G1 X120.125 Y142.495 E.00068
M204 S10000
G1 X119.371 Y142.156 F42000
; LINE_WIDTH: 0.205946
G1 F15000
M204 S6000
G1 X119.201 Y142.022 E.00287
; LINE_WIDTH: 0.165593
G1 X119.029 Y141.887 E.00218
; LINE_WIDTH: 0.130965
G1 X118.903 Y141.782 E.00118
; LINE_WIDTH: 0.102433
G1 X118.777 Y141.678 E.0008
; WIPE_START
G1 X118.903 Y141.782 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.139 Y135.433 Z3 F42000
G1 X137.223 Y114.322 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.102409
G1 F15000
M204 S6000
G1 X137.097 Y114.218 E.00079
; LINE_WIDTH: 0.131116
G1 X136.969 Y114.111 E.0012
; LINE_WIDTH: 0.165758
G1 X136.799 Y113.978 E.00216
; LINE_WIDTH: 0.205923
G1 X136.629 Y113.844 E.00287
M204 S10000
G1 X135.874 Y113.505 F42000
; LINE_WIDTH: 0.106065
G1 F15000
M204 S6000
G1 X135.768 Y113.426 E.00068
; LINE_WIDTH: 0.141858
G1 X135.662 Y113.346 E.00107
; LINE_WIDTH: 0.178175
G1 X135.552 Y113.265 E.00151
; LINE_WIDTH: 0.206346
G1 X135.434 Y113.181 E.00193
M204 S10000
G1 X134.806 Y112.97 F42000
; LINE_WIDTH: 0.109657
G1 F15000
M204 S6000
G1 X134.688 Y112.89 E.00078
; LINE_WIDTH: 0.150231
G1 X134.57 Y112.81 E.00125
; LINE_WIDTH: 0.190806
G1 X134.452 Y112.731 E.00172
; WIPE_START
G1 X134.57 Y112.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.032 Y111.291 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.197382
G1 F15000
M204 S6000
G1 X136.863 Y111.165 E.00264
; LINE_WIDTH: 0.150235
G1 X136.695 Y111.04 E.00184
; LINE_WIDTH: 0.107408
G1 X136.583 Y110.96 E.00072
; WIPE_START
G1 X136.695 Y111.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P57 R8
G1 X138.335 Y112.059 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.204938
G1 F15000
M204 S6000
G1 X138.149 Y111.912 E.00312
; LINE_WIDTH: 0.158228
G1 X137.964 Y111.766 E.00222
; LINE_WIDTH: 0.111518
G1 X137.778 Y111.62 E.00132
; WIPE_START
G1 X137.964 Y111.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.308 Y116.615 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0999355
G1 F15000
M204 S6000
G1 X143.199 Y116.487 E.00078
; LINE_WIDTH: 0.129468
G1 X142.988 Y116.251 E.00224
; LINE_WIDTH: 0.165018
G1 X142.776 Y116.015 E.00315
; LINE_WIDTH: 0.200569
G1 X142.565 Y115.778 E.00407
; LINE_WIDTH: 0.233107
G1 X142.241 Y115.433 E.00734
; LINE_WIDTH: 0.274422
G2 X140.569 Y113.757 I-29.627 J27.881 E.04466
; LINE_WIDTH: 0.233062
G1 X140.219 Y113.437 E.00735
; LINE_WIDTH: 0.191674
G1 X139.87 Y113.116 E.00575
; LINE_WIDTH: 0.150276
G1 X139.633 Y112.91 E.00274
; LINE_WIDTH: 0.10887
G1 X139.397 Y112.704 E.00168
; WIPE_START
G1 X139.633 Y112.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.894 Y117.577 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.227059
G1 F15000
M204 S6000
G1 X140.69 Y117.349 E.00459
; LINE_WIDTH: 0.202624
G1 X140.409 Y117.049 E.00535
; LINE_WIDTH: 0.166706
G1 X139.547 Y116.163 E.01247
G1 X138.951 Y115.588 E.00835
; LINE_WIDTH: 0.198932
G1 X138.676 Y115.336 E.00474
; LINE_WIDTH: 0.227115
G1 X138.401 Y115.085 E.00559
M204 S10000
G1 X142.168 Y119.381 F42000
; LINE_WIDTH: 0.203078
G1 F15000
M204 S6000
G1 X142.007 Y119.183 E.00333
; LINE_WIDTH: 0.157112
G1 X141.847 Y118.984 E.00238
; LINE_WIDTH: 0.111145
G1 X141.686 Y118.785 E.00142
M204 S10000
G1 X142.817 Y120.564 F42000
; LINE_WIDTH: 0.19674
G1 F15000
M204 S6000
G1 X142.713 Y120.421 E.00222
; LINE_WIDTH: 0.153314
G1 X142.609 Y120.278 E.00159
; LINE_WIDTH: 0.109888
G1 X142.504 Y120.135 E.00097
M204 S10000
G1 X143.611 Y122.421 F42000
; LINE_WIDTH: 0.196633
G1 F15000
M204 S6000
G2 X143.406 Y122.096 I-14.701 J9.054 E.00482
M204 S10000
G1 X144.504 Y126.5 F42000
; LINE_WIDTH: 0.111102
G1 F15000
M204 S6000
G2 X144.407 Y126.298 I-9.764 J4.565 E.00124
; WIPE_START
G1 X144.504 Y126.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.508 Y120.419 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.109044
G1 F15000
M204 S6000
G1 X145.421 Y120.293 E.00082
; LINE_WIDTH: 0.150781
G1 X145.335 Y120.168 E.00134
; LINE_WIDTH: 0.192517
G1 X145.248 Y120.042 E.00186
; WIPE_START
G1 X145.335 Y120.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.384 Y118.227 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.111951
G1 F15000
M204 S6000
G1 X144.259 Y118.064 E.00115
; LINE_WIDTH: 0.141725
G1 X144.224 Y118.02 E.00046
; LINE_WIDTH: 0.167936
G1 X144.074 Y117.835 E.00242
; LINE_WIDTH: 0.208342
G1 X143.925 Y117.65 E.0032
; WIPE_START
G1 X144.074 Y117.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.668 Y125.457 Z3 F42000
G1 X143.46 Y129.338 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X143.515 Y127.712 I-15.935 J-1.347 E.054
G3 X143.199 Y126.035 I1.233 J-1.101 E.05949
G1 X143.365 Y125.819 E.00905
G2 X141.27 Y119.949 I-15.497 J2.224 E.20812
G1 X141.124 Y120.138 E.00791
G2 X140.578 Y122.104 I1.159 J1.381 E.07193
G1 X141.083 Y122.759 E.02744
G3 X141.629 Y124.724 I-1.159 J1.381 E.07193
G1 X141.124 Y125.38 E.02744
G2 X140.578 Y127.345 I1.159 J1.381 E.07193
G1 X141.083 Y128 E.02744
G3 X141.629 Y129.966 I-1.159 J1.381 E.07193
G1 X141.124 Y130.621 E.02744
G2 X140.578 Y132.586 I1.159 J1.381 E.07193
G1 X141.083 Y133.241 E.02744
G3 X141.629 Y135.207 I-1.159 J1.381 E.07193
G3 X140.602 Y136.517 I-40.158 J-30.42 E.05523
G1 X140.463 Y137.247 E.02465
G3 X138.922 Y139.026 I-19.805 J-15.604 E.07809
G1 X138.503 Y138.483 E.02274
G3 X137.957 Y136.517 I1.159 J-1.381 E.07193
G1 X138.462 Y135.862 E.02744
G2 X139.008 Y133.897 I-1.159 J-1.381 E.07193
G1 X138.503 Y133.241 E.02744
G3 X137.957 Y131.276 I1.159 J-1.381 E.07193
G1 X138.462 Y130.621 E.02744
G2 X139.008 Y128.655 I-1.159 J-1.381 E.07193
G1 X138.503 Y128 E.02744
G3 X137.957 Y126.035 I1.159 J-1.381 E.07193
G1 X138.462 Y125.38 E.02744
G2 X139.008 Y123.414 I-1.159 J-1.381 E.07193
G1 X138.503 Y122.759 E.02744
G3 X137.957 Y120.793 I1.159 J-1.381 E.07193
G1 X138.462 Y120.138 E.02744
G2 X139.008 Y118.173 I-1.159 J-1.381 E.07193
G2 X137.981 Y116.862 I-40.152 J30.415 E.05523
G1 X137.828 Y116.207 E.02232
G1 X137.864 Y116.021 E.0063
G2 X136.022 Y114.717 I-15.062 J19.328 E.07492
G1 X135.883 Y114.897 E.00754
G2 X135.337 Y116.862 I1.159 J1.381 E.07193
G1 X135.841 Y117.518 E.02744
G3 X136.388 Y119.483 I-1.159 J1.381 E.07193
G1 X135.883 Y120.138 E.02744
G2 X135.337 Y122.104 I1.159 J1.381 E.07193
G1 X135.841 Y122.759 E.02744
G3 X136.388 Y124.724 I-1.159 J1.381 E.07193
G1 X135.883 Y125.38 E.02744
G2 X135.337 Y127.345 I1.159 J1.381 E.07193
G1 X135.841 Y128 E.02744
G3 X136.388 Y129.966 I-1.159 J1.381 E.07193
G1 X135.883 Y130.621 E.02744
G2 X135.337 Y132.586 I1.159 J1.381 E.07193
G1 X135.841 Y133.241 E.02744
G3 X136.388 Y135.207 I-1.159 J1.381 E.07193
G1 X135.883 Y135.862 E.02744
G2 X135.337 Y137.828 I1.159 J1.381 E.07193
G1 X135.841 Y138.483 E.02744
G3 X136.388 Y140.448 I-1.159 J1.381 E.07193
G3 X135.499 Y141.585 I-34.889 J-26.36 E.04788
G3 X134.035 Y142.296 I-7.535 J-13.665 E.054
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.499 Y141.585 E-.61836
G1 X135.728 Y141.292 E-.14164
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/32
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I.284 J-1.183 P1  F42000
G1 X113.426 Y135.937 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X127.586 Y111.415 I14.565 J-7.939 E1.12552
G3 X129.204 Y111.454 I.414 J16.227 E.05371
G3 X113.455 Y135.989 I-1.213 J16.544 E2.27621
M204 S10000
G1 X113.069 Y136.131 F42000
G1 F5400
M204 S6000
G3 X127.576 Y111.008 I14.923 J-8.134 E1.15313
G3 X129.234 Y111.048 I.424 J16.629 E.05504
G3 X113.097 Y136.184 I-1.243 J16.95 E2.33208
M204 S250
G1 X112.724 Y136.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.566 Y110.615 I15.267 J-8.321 E1.09278
G3 X129.263 Y110.657 I.433 J17.019 E.05217
G3 X112.753 Y136.371 I-1.272 J17.341 E2.21007
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35228
G1 X111.976 Y134.755 E-.3295
G1 X111.9 Y134.563 E-.07823
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


G1 X112.606 Y126.832 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X112.569 Y128.459 I15.461 J1.171 E.054
G1 X112.694 Y128.655 E.00774
G3 X112.904 Y129.966 I-1.371 J.891 E.04532
G1 X112.745 Y130.293 E.01207
G2 X114.713 Y135.862 I14.961 J-2.154 E.1972
G1 X114.713 Y135.862 E.00001
G2 X115.524 Y133.897 I-1.203 J-1.646 E.0742
G2 X114.479 Y132.586 I-3.961 J2.088 E.05593
G1 X114.232 Y131.931 E.02322
G3 X114.713 Y130.621 I1.449 J-.211 E.04826
G2 X115.524 Y128.655 I-1.203 J-1.646 E.0742
G2 X114.479 Y127.345 I-3.961 J2.088 E.05593
G1 X114.232 Y126.69 E.02322
G3 X114.713 Y125.38 I1.449 J-.211 E.04826
G2 X115.524 Y123.414 I-1.203 J-1.646 E.0742
G2 X114.479 Y122.104 I-3.961 J2.088 E.05593
G1 X114.232 Y121.449 E.02322
G3 X114.713 Y120.138 I1.943 J-.03 E.04736
G1 X115.315 Y119.483 E.02951
G1 X115.541 Y118.883 E.02127
G3 X117.025 Y117.142 I18.901 J14.61 E.07592
G2 X117.936 Y118.173 I7.48 J-5.688 E.04566
G1 X118.182 Y118.828 E.02323
G3 X117.701 Y120.138 I-1.449 J.211 E.04826
G2 X116.89 Y122.104 I1.203 J1.646 E.0742
G2 X117.936 Y123.414 I3.962 J-2.088 E.05593
G1 X118.182 Y124.069 E.02322
G3 X117.701 Y125.38 I-1.449 J.211 E.04826
G2 X116.89 Y127.345 I1.203 J1.646 E.0742
G2 X117.936 Y128.655 I3.962 J-2.088 E.05593
G1 X118.182 Y129.311 E.02322
G3 X117.701 Y130.621 I-1.449 J.211 E.04826
G2 X116.89 Y132.586 I1.203 J1.646 E.0742
G2 X117.936 Y133.897 I3.962 J-2.088 E.05593
G1 X118.182 Y134.552 E.02322
G3 X117.701 Y135.862 I-1.449 J.211 E.04826
G2 X116.89 Y137.828 I1.203 J1.646 E.07419
G2 X117.936 Y139.138 I3.961 J-2.088 E.05593
G1 X118.182 Y139.793 E.02322
G1 X118.176 Y139.909 E.00386
G2 X119.913 Y141.151 I15.773 J-20.241 E.07086
G3 X120.556 Y140.448 I13.781 J11.967 E.03158
G1 X120.803 Y139.793 E.02322
G2 X120.322 Y138.483 I-1.449 J-.211 E.04826
G3 X119.511 Y136.517 I1.203 J-1.646 E.07419
G3 X120.556 Y135.207 I3.961 J2.088 E.05593
G1 X120.803 Y134.552 E.02322
G2 X120.322 Y133.241 I-1.449 J-.211 E.04826
G3 X119.511 Y131.276 I1.203 J-1.646 E.07419
G3 X120.556 Y129.966 I3.961 J2.088 E.05593
G1 X120.803 Y129.311 E.02322
G2 X120.322 Y128 I-1.449 J-.211 E.04826
G3 X119.511 Y126.035 I1.203 J-1.646 E.07419
G3 X120.556 Y124.724 I3.961 J2.088 E.05593
G1 X120.803 Y124.069 E.02322
G2 X120.322 Y122.759 I-1.449 J-.211 E.04826
G3 X119.511 Y120.793 I1.203 J-1.646 E.07419
G3 X120.556 Y119.483 I3.961 J2.088 E.05593
G1 X120.803 Y118.828 E.02322
G2 X120.322 Y117.518 I-1.449 J-.211 E.04826
G3 X119.511 Y115.552 I1.203 J-1.646 E.07419
G3 X120.107 Y114.731 I2.546 J1.221 E.03382
G3 X123.312 Y113.29 I9.031 J15.804 E.11676
G1 X123.424 Y113.587 E.0105
G1 X123.386 Y114.242 E.02177
G3 X122.341 Y115.552 I-3.961 J-2.088 E.05593
G1 X122.094 Y116.207 E.02322
G2 X122.575 Y117.518 I1.449 J.211 E.04826
G3 X123.386 Y119.483 I-1.203 J1.646 E.0742
G3 X122.341 Y120.793 I-3.961 J-2.088 E.05593
G1 X122.094 Y121.449 E.02322
G2 X122.575 Y122.759 I1.449 J.211 E.04826
G3 X123.386 Y124.724 I-1.203 J1.646 E.0742
G3 X122.341 Y126.035 I-3.961 J-2.088 E.05593
G1 X122.094 Y126.69 E.02322
G2 X122.575 Y128 I1.449 J.211 E.04826
G3 X123.386 Y129.966 I-1.203 J1.646 E.0742
G3 X122.341 Y131.276 I-3.961 J-2.088 E.05593
G1 X122.094 Y131.931 E.02322
G2 X122.575 Y133.241 I1.449 J.211 E.04826
G3 X123.386 Y135.207 I-1.203 J1.646 E.0742
G3 X122.341 Y136.517 I-3.961 J-2.088 E.05593
G1 X122.094 Y137.172 E.02322
G2 X122.575 Y138.483 I1.45 J.211 E.04826
G3 X123.386 Y140.448 I-1.203 J1.646 E.0742
G3 X122.341 Y141.759 I-3.961 J-2.088 E.05593
G1 X122.143 Y142.284 E.01864
G2 X125.037 Y143.151 I5.888 J-14.397 E.10038
G1 X124.715 Y142.414 E.0267
G3 X125.196 Y141.103 I1.449 J-.211 E.04826
G2 X126.007 Y139.138 I-1.203 J-1.646 E.0742
G2 X124.962 Y137.828 I-3.961 J2.088 E.05593
G1 X124.715 Y137.172 E.02322
G3 X125.196 Y135.862 I1.449 J-.211 E.04826
G2 X126.007 Y133.897 I-1.203 J-1.646 E.0742
G2 X124.962 Y132.586 I-3.961 J2.088 E.05593
G1 X124.715 Y131.931 E.02322
G3 X125.196 Y130.621 I1.449 J-.211 E.04826
G2 X126.007 Y128.655 I-1.203 J-1.646 E.0742
G2 X124.962 Y127.345 I-3.961 J2.088 E.05593
G1 X124.715 Y126.69 E.02322
G3 X125.196 Y125.38 I1.449 J-.211 E.04826
G2 X126.007 Y123.414 I-1.203 J-1.646 E.0742
G2 X124.962 Y122.104 I-3.961 J2.088 E.05593
G1 X124.715 Y121.449 E.02322
G3 X125.196 Y120.138 I1.449 J-.211 E.04826
G2 X126.007 Y118.173 I-1.203 J-1.646 E.0742
G2 X124.962 Y116.862 I-3.961 J2.088 E.05593
G1 X124.715 Y116.207 E.02322
G3 X125.196 Y114.897 I1.449 J-.211 E.04826
G2 X126.007 Y112.931 I-1.203 J-1.646 E.0742
G1 X125.897 Y112.705 E.00835
G3 X128.079 Y112.562 I2.762 J25.509 E.07255
G3 X128.665 Y113.587 I-.98 J1.241 E.04012
G3 X128.184 Y114.897 I-1.449 J.211 E.04826
G2 X127.373 Y116.862 I1.203 J1.646 E.0742
G2 X128.418 Y118.173 I3.962 J-2.088 E.05593
G1 X128.665 Y118.828 E.02323
G3 X128.184 Y120.138 I-1.449 J.211 E.04826
G2 X127.373 Y122.104 I1.203 J1.646 E.0742
G2 X128.418 Y123.414 I3.962 J-2.088 E.05593
G1 X128.665 Y124.069 E.02322
G3 X128.184 Y125.38 I-1.449 J.211 E.04826
G2 X127.373 Y127.345 I1.203 J1.646 E.0742
G2 X128.418 Y128.655 I3.962 J-2.088 E.05593
G1 X128.665 Y129.311 E.02322
G3 X128.184 Y130.621 I-1.449 J.211 E.04826
G2 X127.373 Y132.586 I1.203 J1.646 E.0742
G2 X128.418 Y133.897 I3.962 J-2.088 E.05593
G1 X128.665 Y134.552 E.02322
G3 X128.184 Y135.862 I-1.449 J.211 E.04826
G2 X127.373 Y137.828 I1.203 J1.646 E.07419
G2 X128.418 Y139.138 I3.961 J-2.088 E.05593
G1 X128.665 Y139.793 E.02322
G3 X128.184 Y141.103 I-1.449 J.211 E.04826
G2 X127.373 Y143.069 I1.203 J1.646 E.0742
G1 X127.531 Y143.397 E.01207
G2 X129.192 Y143.396 I.827 J-6.696 E.05524
M204 S10000
G1 X133.842 Y142.291 F42000
G1 F15476.087
M204 S6000
G2 X135.313 Y141.596 I-6.009 J-14.628 E.054
G3 X136.28 Y140.448 I4.469 J2.784 E.04994
G2 X136.331 Y138.81 I-1.503 J-.867 E.05661
M73 P58 R8
G2 X135.444 Y137.828 I-19.264 J16.497 E.04392
G3 X135.393 Y136.19 I1.503 J-.867 E.05661
G3 X136.28 Y135.207 I19.264 J16.497 E.04392
G2 X136.331 Y133.569 I-1.503 J-.867 E.05661
G2 X135.444 Y132.586 I-19.259 J16.492 E.04392
G3 X135.393 Y130.948 I1.503 J-.867 E.05661
G3 X136.28 Y129.966 I19.259 J16.492 E.04392
G2 X136.331 Y128.328 I-1.503 J-.867 E.05661
G2 X135.444 Y127.345 I-19.259 J16.492 E.04392
G3 X135.393 Y125.707 I1.503 J-.867 E.05661
G3 X136.28 Y124.724 I19.264 J16.497 E.04392
G2 X136.331 Y123.086 I-1.503 J-.867 E.05661
G2 X135.444 Y122.104 I-19.248 J16.482 E.04392
G3 X135.393 Y120.466 I1.503 J-.867 E.05661
G3 X136.28 Y119.483 I19.259 J16.492 E.04392
G2 X136.331 Y117.845 I-1.503 J-.867 E.05661
G2 X135.444 Y116.862 I-19.259 J16.492 E.04392
G3 X135.393 Y115.225 I1.503 J-.867 E.05661
G3 X135.853 Y114.707 I10.148 J8.554 E.02298
G2 X133.898 Y113.733 I-12.663 J22.97 E.07248
G3 X133.425 Y114.897 I-1.358 J.126 E.04332
G1 X132.823 Y115.552 E.02951
G2 X132.772 Y117.19 I1.503 J.867 E.05661
G2 X133.659 Y118.173 I19.259 J-16.492 E.04392
G3 X133.711 Y119.811 I-1.503 J.867 E.05661
G3 X132.823 Y120.793 I-19.259 J-16.492 E.04392
G2 X132.772 Y122.431 I1.503 J.867 E.05661
G2 X133.659 Y123.414 I19.264 J-16.497 E.04392
G3 X133.711 Y125.052 I-1.503 J.867 E.05661
G3 X132.823 Y126.035 I-19.248 J-16.482 E.04392
G2 X132.772 Y127.673 I1.503 J.867 E.05661
G2 X133.659 Y128.655 I19.259 J-16.492 E.04392
G3 X133.711 Y130.293 I-1.503 J.867 E.05661
G3 X132.823 Y131.276 I-19.259 J-16.492 E.04392
G2 X132.772 Y132.914 I1.503 J.867 E.05661
G2 X133.659 Y133.897 I19.264 J-16.497 E.04392
G3 X133.711 Y135.535 I-1.503 J.867 E.05661
G3 X132.823 Y136.517 I-19.248 J-16.482 E.04392
G2 X132.772 Y138.155 I1.503 J.867 E.05661
G2 X133.659 Y139.138 I19.259 J-16.492 E.04392
G3 X133.711 Y140.776 I-1.503 J.867 E.05661
G3 X132.823 Y141.759 I-19.259 J-16.492 E.04392
G1 X132.577 Y142.414 E.02322
G1 X132.595 Y142.738 E.01078
G3 X130.373 Y143.255 I-6.438 J-22.668 E.0757
G1 X130.203 Y143.069 E.00836
G3 X130.152 Y141.431 I1.503 J-.867 E.05661
G3 X131.039 Y140.448 I19.271 J16.503 E.04392
G2 X131.09 Y138.81 I-1.503 J-.867 E.05661
G2 X130.203 Y137.828 I-19.283 J16.514 E.04392
G3 X130.152 Y136.19 I1.503 J-.867 E.05661
G3 X131.039 Y135.207 I19.277 J16.508 E.04392
G2 X131.09 Y133.569 I-1.503 J-.867 E.05661
G2 X130.203 Y132.586 I-19.277 J16.509 E.04392
G3 X130.152 Y130.948 I1.503 J-.867 E.05661
G3 X131.039 Y129.966 I19.271 J16.503 E.04392
G2 X131.09 Y128.328 I-1.503 J-.867 E.05661
G2 X130.203 Y127.345 I-19.277 J16.509 E.04392
G3 X130.152 Y125.707 I1.503 J-.867 E.05661
G3 X131.039 Y124.724 I19.277 J16.508 E.04392
G2 X131.09 Y123.086 I-1.503 J-.867 E.05661
G2 X130.203 Y122.104 I-19.266 J16.499 E.04392
G3 X130.152 Y120.466 I1.503 J-.867 E.05661
G3 X131.039 Y119.483 I19.271 J16.503 E.04392
G2 X131.09 Y117.845 I-1.503 J-.867 E.05661
G2 X130.203 Y116.862 I-19.277 J16.509 E.04392
G3 X130.152 Y115.225 I1.503 J-.867 E.05661
G3 X131.039 Y114.242 I19.277 J16.508 E.04392
G2 X131.235 Y112.904 I-1.342 J-.88 E.0463
G2 X129.628 Y112.649 I-3.243 J15.238 E.054
M204 S10000
G1 X139.049 Y117.218 F42000
G1 F15476.087
M204 S6000
G2 X137.853 Y116.115 I-11.117 J10.852 E.054
G1 X137.856 Y116.862 E.0248
G2 X138.901 Y118.173 I3.961 J-2.088 E.05593
G3 X138.952 Y119.811 I-1.503 J.867 E.05661
G3 X138.065 Y120.793 I-19.259 J-16.492 E.04392
G2 X138.014 Y122.431 I1.503 J.867 E.05661
G2 X138.901 Y123.414 I19.264 J-16.497 E.04392
G3 X138.952 Y125.052 I-1.503 J.867 E.05661
G3 X138.065 Y126.035 I-19.248 J-16.482 E.04392
G2 X138.014 Y127.673 I1.503 J.867 E.05661
G2 X138.901 Y128.655 I19.259 J-16.492 E.04392
G3 X138.952 Y130.293 I-1.503 J.867 E.05661
G3 X138.065 Y131.276 I-19.259 J-16.492 E.04392
G2 X138.014 Y132.914 I1.503 J.867 E.05661
G2 X138.901 Y133.897 I19.264 J-16.497 E.04392
G3 X138.952 Y135.535 I-1.503 J.867 E.05661
G3 X138.065 Y136.517 I-19.248 J-16.482 E.04392
G2 X138.014 Y138.155 I1.503 J.867 E.05661
G2 X138.804 Y139.033 I17.198 J-14.696 E.03918
G2 X140.44 Y137.143 I-16.826 J-16.22 E.08296
G3 X140.92 Y135.862 I1.43 J-.195 E.04726
G1 X141.521 Y135.207 E.02951
G2 X141.573 Y133.569 I-1.503 J-.867 E.05661
G2 X140.685 Y132.586 I-19.271 J16.503 E.04392
G3 X140.634 Y130.948 I1.503 J-.867 E.05661
G3 X141.521 Y129.966 I19.277 J16.509 E.04392
G2 X141.573 Y128.328 I-1.503 J-.867 E.05661
G2 X140.685 Y127.345 I-19.271 J16.503 E.04392
G3 X140.634 Y125.707 I1.503 J-.867 E.05661
G3 X141.521 Y124.724 I19.283 J16.514 E.04392
G2 X141.573 Y123.086 I-1.503 J-.867 E.05661
G2 X140.685 Y122.104 I-19.26 J16.494 E.04392
G3 X140.634 Y120.466 I1.503 J-.867 E.05661
G3 X141.143 Y119.895 I11.193 J9.465 E.02537
G3 X143.306 Y126.035 I-13.077 J8.058 E.21758
G2 X143.255 Y127.673 I1.503 J.867 E.05661
G3 X143.443 Y128 I-.104 J.277 E.01358
G3 X143.368 Y129.511 I-15.169 J.007 E.05019
M204 S10000
G1 X144.202 Y128.005 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413181
G1 F12000
M204 S6000
G2 X144.181 Y128.82 I-16.199 J-.008 E3.0463
G1 X144.2 Y128.065 E.02279
M204 S10000
G1 X115.378 Y137.555 F42000
; LINE_WIDTH: 0.413213
G1 F12000
M204 S6000
G3 X116.396 Y138.769 I12.622 J-9.553 E2.95333
G3 X115.415 Y137.602 I11.672 J-10.806 E.04601
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X115.896 Y138.203 E-.29251
G1 X116.396 Y138.769 E-.28685
G1 X116.728 Y139.109 E-.18064
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/32
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.2 I.843 J-.877 P1  F42000
G1 X113.426 Y135.936 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X125.119 Y111.661 I14.566 J-7.937 E1.04311
G3 X129.155 Y111.452 I2.903 J16.92 E.13438
G3 X113.455 Y135.989 I-1.163 J16.548 E2.27794
M204 S10000
G1 X113.068 Y136.131 F42000
G1 F5400
M204 S6000
G3 X125.048 Y111.26 I14.924 J-8.132 E1.06874
G3 X129.176 Y111.045 I2.974 J17.327 E.13741
G3 X113.096 Y136.184 I-1.184 J16.954 E2.33414
M204 S250
G1 X112.725 Y136.318 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X124.13 Y111.046 I15.267 J-8.32 E.98609
G3 X129.195 Y110.653 I3.857 J16.892 E.15666
G3 X112.754 Y136.371 I-1.203 J17.345 E2.21217
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35224
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.0783
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


G1 X113.478 Y122.751 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X113.008 Y124.309 I17.163 J6.029 E.05401
G3 X112.809 Y125.249 I-.892 J.302 E.03344
G2 X112.572 Y128.593 I15.321 J2.766 E.11144
G1 X112.603 Y128.655 E.0023
G3 X113.062 Y129.966 I-1.378 J1.218 E.04723
G3 X112.771 Y130.537 I-.803 J-.049 E.02186
G2 X114.632 Y135.722 I16.147 J-2.868 E.18362
G2 X115.683 Y133.897 I-1.248 J-1.933 E.07256
G1 X115.59 Y133.569 E.01129
G2 X114.57 Y132.586 I-3.367 J2.474 E.04722
G3 X114.111 Y131.276 I1.378 J-1.218 E.04723
G1 X114.203 Y130.948 E.01129
G3 X115.224 Y129.966 I3.367 J2.474 E.04722
G2 X115.683 Y128.655 I-1.378 J-1.218 E.04723
G1 X115.59 Y128.328 E.01129
G2 X114.57 Y127.345 I-3.367 J2.474 E.04722
G3 X114.111 Y126.035 I1.378 J-1.218 E.04723
G1 X114.203 Y125.707 E.01129
G3 X115.224 Y124.724 I3.367 J2.475 E.04722
G2 X115.683 Y123.414 I-1.377 J-1.218 E.04723
G1 X115.59 Y123.086 E.01129
G2 X114.57 Y122.104 I-3.367 J2.474 E.04722
G1 X114.197 Y121.449 E.02501
G1 X114.159 Y121.158 E.00971
G1 X114.438 Y120.615 E.02027
G3 X115.224 Y119.483 I2.841 J1.134 E.04609
G3 X116.894 Y117.276 I8.059 J4.366 E.09217
G2 X117.844 Y118.173 I3.081 J-2.313 E.04354
G3 X118.303 Y119.483 I-1.378 J1.218 E.04723
G1 X118.211 Y119.811 E.01129
G3 X117.191 Y120.793 I-3.367 J-2.475 E.04722
G2 X116.732 Y122.104 I1.378 J1.218 E.04723
G1 X116.824 Y122.431 E.01129
G2 X117.844 Y123.414 I3.367 J-2.474 E.04722
G3 X118.303 Y124.724 I-1.378 J1.218 E.04723
G1 X118.211 Y125.052 E.01129
G3 X117.191 Y126.035 I-3.367 J-2.474 E.04722
G2 X116.732 Y127.345 I1.378 J1.218 E.04723
G1 X116.824 Y127.673 E.01129
G2 X117.844 Y128.655 I3.367 J-2.474 E.04722
G3 X118.303 Y129.966 I-1.378 J1.218 E.04723
G1 X118.211 Y130.293 E.01129
G3 X117.191 Y131.276 I-3.367 J-2.475 E.04722
G2 X116.732 Y132.586 I1.378 J1.218 E.04723
G1 X116.824 Y132.914 E.01129
G2 X117.844 Y133.897 I3.367 J-2.474 E.04722
G3 X118.303 Y135.207 I-1.378 J1.218 E.04723
G1 X118.211 Y135.535 E.01129
G3 X117.191 Y136.517 I-3.367 J-2.474 E.04722
G2 X116.732 Y137.828 I1.378 J1.218 E.04723
G1 X116.824 Y138.155 E.01129
G2 X117.844 Y139.138 I3.367 J-2.474 E.04722
G1 X118.217 Y139.793 E.02501
G1 X118.24 Y139.963 E.00568
G2 X119.763 Y141.059 I21.116 J-27.747 E.06227
G1 X120.465 Y140.448 E.03085
G2 X120.924 Y139.138 I-1.378 J-1.218 E.04723
G1 X120.832 Y138.81 E.01129
G2 X119.811 Y137.828 I-3.367 J2.474 E.04722
G3 X119.352 Y136.517 I1.378 J-1.218 E.04723
G1 X119.445 Y136.19 E.01129
G3 X120.465 Y135.207 I3.367 J2.475 E.04722
G2 X120.924 Y133.897 I-1.378 J-1.218 E.04723
G1 X120.832 Y133.569 E.01129
G2 X119.811 Y132.586 I-3.367 J2.474 E.04722
G3 X119.352 Y131.276 I1.378 J-1.218 E.04723
G1 X119.445 Y130.948 E.01129
G3 X120.465 Y129.966 I3.367 J2.474 E.04722
G2 X120.924 Y128.655 I-1.378 J-1.218 E.04723
G1 X120.832 Y128.328 E.01129
G2 X119.811 Y127.345 I-3.367 J2.474 E.04722
G3 X119.352 Y126.035 I1.378 J-1.218 E.04723
G1 X119.445 Y125.707 E.01129
G3 X120.465 Y124.724 I3.367 J2.475 E.04722
G2 X120.924 Y123.414 I-1.378 J-1.218 E.04723
G1 X120.832 Y123.086 E.01129
G2 X119.811 Y122.104 I-3.367 J2.474 E.04722
G3 X119.352 Y120.793 I1.378 J-1.218 E.04723
G1 X119.445 Y120.466 E.01129
M73 P59 R8
G3 X120.465 Y119.483 I3.367 J2.474 E.04722
G2 X120.924 Y118.173 I-1.378 J-1.218 E.04723
G1 X120.832 Y117.845 E.01129
G2 X119.811 Y116.862 I-3.367 J2.474 E.04722
G3 X119.352 Y115.552 I1.378 J-1.218 E.04723
G3 X119.585 Y115.053 I.691 J.018 E.01879
G3 X123.293 Y113.296 I8.524 J13.202 E.13651
G1 X123.459 Y113.587 E.01109
G1 X123.545 Y114.242 E.02192
G1 X123.452 Y114.569 E.01129
G3 X122.432 Y115.552 I-3.367 J-2.474 E.04722
G2 X121.973 Y116.862 I1.377 J1.218 E.04723
G1 X122.065 Y117.19 E.01129
G2 X123.086 Y118.173 I3.367 J-2.474 E.04722
G3 X123.545 Y119.483 I-1.378 J1.218 E.04723
G1 X123.452 Y119.811 E.01129
G3 X122.432 Y120.793 I-3.367 J-2.474 E.04722
G2 X121.973 Y122.104 I1.377 J1.218 E.04723
G1 X122.065 Y122.431 E.01129
G2 X123.086 Y123.414 I3.367 J-2.475 E.04722
G3 X123.545 Y124.724 I-1.378 J1.218 E.04723
G1 X123.452 Y125.052 E.01129
G3 X122.432 Y126.035 I-3.367 J-2.474 E.04722
G2 X121.973 Y127.345 I1.377 J1.218 E.04723
G1 X122.065 Y127.673 E.01129
G2 X123.086 Y128.655 I3.367 J-2.474 E.04722
G3 X123.545 Y129.966 I-1.378 J1.218 E.04723
G1 X123.452 Y130.293 E.01129
G3 X122.432 Y131.276 I-3.367 J-2.474 E.04722
G2 X121.973 Y132.586 I1.377 J1.218 E.04723
G1 X122.065 Y132.914 E.01129
G2 X123.086 Y133.897 I3.367 J-2.475 E.04722
G3 X123.545 Y135.207 I-1.378 J1.218 E.04723
G1 X123.452 Y135.535 E.01129
G3 X122.432 Y136.517 I-3.367 J-2.474 E.04722
G2 X121.973 Y137.828 I1.377 J1.218 E.04723
G1 X122.065 Y138.155 E.01129
G2 X123.086 Y139.138 I3.367 J-2.474 E.04722
G3 X123.545 Y140.448 I-1.378 J1.218 E.04723
G1 X123.452 Y140.776 E.01129
G3 X122.432 Y141.759 I-3.367 J-2.474 E.04722
G1 X122.135 Y142.281 E.01994
G2 X125.181 Y143.18 I5.938 J-14.507 E.10553
G3 X124.594 Y141.759 I1.647 J-1.512 E.05208
G1 X124.686 Y141.431 E.01129
G3 X125.706 Y140.448 I3.367 J2.474 E.04722
G2 X126.165 Y139.138 I-1.377 J-1.218 E.04723
G1 X126.073 Y138.81 E.01129
G2 X125.053 Y137.828 I-3.367 J2.475 E.04722
G3 X124.594 Y136.517 I1.378 J-1.218 E.04723
G1 X124.686 Y136.19 E.01129
G3 X125.706 Y135.207 I3.367 J2.475 E.04722
G2 X126.165 Y133.897 I-1.377 J-1.218 E.04723
G1 X126.073 Y133.569 E.01129
G2 X125.053 Y132.586 I-3.367 J2.474 E.04722
G3 X124.594 Y131.276 I1.378 J-1.218 E.04723
G1 X124.686 Y130.948 E.01129
G3 X125.706 Y129.966 I3.367 J2.474 E.04722
G2 X126.165 Y128.655 I-1.377 J-1.218 E.04723
G1 X126.073 Y128.328 E.01129
G2 X125.053 Y127.345 I-3.367 J2.474 E.04722
G3 X124.594 Y126.035 I1.378 J-1.218 E.04723
G1 X124.686 Y125.707 E.01129
G3 X125.706 Y124.724 I3.367 J2.475 E.04722
G2 X126.165 Y123.414 I-1.377 J-1.218 E.04723
G1 X126.073 Y123.086 E.01129
G2 X125.053 Y122.104 I-3.367 J2.474 E.04722
G3 X124.594 Y120.793 I1.378 J-1.218 E.04723
G1 X124.686 Y120.466 E.01129
G3 X125.706 Y119.483 I3.367 J2.474 E.04722
G2 X126.165 Y118.173 I-1.377 J-1.218 E.04723
G1 X126.073 Y117.845 E.01129
G2 X125.053 Y116.862 I-3.367 J2.474 E.04722
G3 X124.594 Y115.552 I1.378 J-1.218 E.04723
G1 X124.686 Y115.225 E.01129
G3 X125.706 Y114.242 I3.367 J2.475 E.04722
G2 X126.165 Y112.931 I-1.377 J-1.218 E.04723
G1 X126.093 Y112.676 E.00881
G3 X127.902 Y112.562 I1.949 J16.561 E.06016
G3 X128.786 Y114.242 I-1.3 J1.756 E.06512
G1 X128.694 Y114.569 E.01129
G3 X127.673 Y115.552 I-3.367 J-2.474 E.04722
G2 X127.214 Y116.862 I1.378 J1.218 E.04723
G1 X127.307 Y117.19 E.01129
G2 X128.327 Y118.173 I3.367 J-2.474 E.04722
G3 X128.786 Y119.483 I-1.378 J1.218 E.04723
G1 X128.694 Y119.811 E.01129
G3 X127.673 Y120.793 I-3.367 J-2.474 E.04722
G2 X127.214 Y122.104 I1.378 J1.218 E.04723
G1 X127.307 Y122.431 E.01129
G2 X128.327 Y123.414 I3.367 J-2.474 E.04722
G3 X128.786 Y124.724 I-1.378 J1.218 E.04723
G1 X128.694 Y125.052 E.01129
G3 X127.673 Y126.035 I-3.367 J-2.474 E.04722
G2 X127.214 Y127.345 I1.378 J1.218 E.04723
G1 X127.307 Y127.673 E.01129
G2 X128.327 Y128.655 I3.367 J-2.474 E.04722
G3 X128.786 Y129.966 I-1.378 J1.218 E.04723
G1 X128.694 Y130.293 E.01129
G3 X127.673 Y131.276 I-3.367 J-2.474 E.04722
G2 X127.214 Y132.586 I1.378 J1.218 E.04723
G1 X127.307 Y132.914 E.01129
G2 X128.327 Y133.897 I3.367 J-2.474 E.04722
G3 X128.786 Y135.207 I-1.378 J1.218 E.04723
G1 X128.694 Y135.535 E.01129
G3 X127.673 Y136.517 I-3.367 J-2.474 E.04722
G2 X127.214 Y137.828 I1.378 J1.218 E.04723
G1 X127.307 Y138.155 E.01129
G2 X128.327 Y139.138 I3.367 J-2.474 E.04722
G3 X128.786 Y140.448 I-1.378 J1.218 E.04723
G1 X128.694 Y140.776 E.01129
G3 X127.673 Y141.759 I-3.367 J-2.474 E.04722
G2 X127.214 Y143.069 I1.378 J1.218 E.04723
G1 X127.307 Y143.397 E.01129
G2 X128.956 Y143.409 I.903 J-10.08 E.05478
M204 S10000
G1 X136.491 Y140.895 F42000
G1 F15476.087
M204 S6000
G3 X135.088 Y141.719 I-9.728 J-14.972 E.05401
G3 X135.436 Y141.103 I.883 J.093 E.02413
G1 X136.189 Y140.448 E.03311
G2 X136.556 Y138.81 I-1.407 J-1.175 E.05783
G2 X135.535 Y137.828 I-3.367 J2.475 E.04722
G3 X135.169 Y136.19 I1.407 J-1.175 E.05783
G3 X136.189 Y135.207 I3.367 J2.475 E.04722
G2 X136.556 Y133.569 I-1.407 J-1.175 E.05783
G2 X135.535 Y132.586 I-3.367 J2.474 E.04722
G3 X135.169 Y130.948 I1.407 J-1.175 E.05783
G3 X136.189 Y129.966 I3.367 J2.474 E.04722
G2 X136.556 Y128.328 I-1.407 J-1.175 E.05783
G2 X135.535 Y127.345 I-3.367 J2.474 E.04722
G3 X135.169 Y125.707 I1.407 J-1.175 E.05783
G3 X136.189 Y124.724 I3.367 J2.475 E.04722
G2 X136.556 Y123.086 I-1.407 J-1.175 E.05783
G2 X135.535 Y122.104 I-3.367 J2.474 E.04722
G3 X135.169 Y120.466 I1.407 J-1.175 E.05783
G3 X136.189 Y119.483 I3.367 J2.474 E.04722
G2 X136.556 Y117.845 I-1.407 J-1.175 E.05783
G2 X135.535 Y116.862 I-3.367 J2.474 E.04722
G3 X135.169 Y115.225 I1.407 J-1.175 E.05783
G3 X135.736 Y114.635 I1.996 J1.356 E.02727
G2 X133.964 Y113.761 I-16.452 J31.097 E.06557
G3 X133.668 Y114.897 I-.989 J.349 E.04134
G1 X132.915 Y115.552 E.03311
G2 X132.548 Y117.19 I1.407 J1.175 E.05783
G2 X133.568 Y118.173 I3.367 J-2.474 E.04722
G3 X133.935 Y119.811 I-1.407 J1.175 E.05783
G3 X132.915 Y120.793 I-3.367 J-2.474 E.04722
G2 X132.548 Y122.431 I1.407 J1.175 E.05783
G2 X133.568 Y123.414 I3.367 J-2.475 E.04722
G3 X133.935 Y125.052 I-1.407 J1.175 E.05783
G3 X132.915 Y126.035 I-3.367 J-2.474 E.04722
G2 X132.548 Y127.673 I1.407 J1.175 E.05783
G2 X133.568 Y128.655 I3.367 J-2.474 E.04722
G3 X133.935 Y130.293 I-1.407 J1.175 E.05783
G3 X132.915 Y131.276 I-3.367 J-2.474 E.04722
G2 X132.548 Y132.914 I1.407 J1.175 E.05783
G2 X133.568 Y133.897 I3.367 J-2.475 E.04722
G3 X133.935 Y135.535 I-1.407 J1.175 E.05783
G3 X132.915 Y136.517 I-3.367 J-2.474 E.04722
G2 X132.548 Y138.155 I1.407 J1.175 E.05783
G2 X133.568 Y139.138 I3.367 J-2.474 E.04722
G3 X133.935 Y140.776 I-1.407 J1.175 E.05783
G3 X132.915 Y141.759 I-3.367 J-2.474 E.04722
G1 X132.542 Y142.414 E.02501
G1 X132.495 Y142.769 E.01189
G3 X130.488 Y143.237 I-7.248 J-26.54 E.0684
G1 X130.294 Y143.069 E.00851
G3 X129.927 Y141.431 I1.407 J-1.175 E.05783
G3 X130.948 Y140.448 I3.367 J2.475 E.04722
G2 X131.314 Y138.81 I-1.407 J-1.175 E.05783
G2 X130.294 Y137.828 I-3.367 J2.474 E.04722
G3 X129.927 Y136.19 I1.407 J-1.175 E.05783
G3 X130.948 Y135.207 I3.367 J2.475 E.04722
G2 X131.314 Y133.569 I-1.407 J-1.175 E.05783
G2 X130.294 Y132.586 I-3.367 J2.474 E.04722
G3 X129.927 Y130.948 I1.407 J-1.175 E.05783
G3 X130.948 Y129.966 I3.367 J2.475 E.04722
G2 X131.314 Y128.328 I-1.407 J-1.175 E.05783
G2 X130.294 Y127.345 I-3.367 J2.474 E.04722
G3 X129.927 Y125.707 I1.407 J-1.175 E.05783
G3 X130.948 Y124.724 I3.367 J2.475 E.04722
G2 X131.314 Y123.086 I-1.407 J-1.175 E.05783
G2 X130.294 Y122.104 I-3.367 J2.474 E.04722
G3 X129.927 Y120.466 I1.407 J-1.175 E.05783
G3 X130.948 Y119.483 I3.367 J2.475 E.04722
G2 X131.314 Y117.845 I-1.407 J-1.175 E.05783
G2 X130.294 Y116.862 I-3.367 J2.474 E.04722
G3 X129.927 Y115.225 I1.407 J-1.175 E.05783
G3 X130.948 Y114.242 I3.367 J2.475 E.04722
G2 X131.406 Y112.938 I-1.37 J-1.214 E.047
G2 X129.801 Y112.666 I-3.811 J17.568 E.05401
M204 S10000
G1 X139.038 Y117.207 F42000
G1 F15476.087
M204 S6000
G2 X137.841 Y116.105 I-11.13 J10.888 E.054
G1 X137.697 Y116.862 E.02557
G2 X138.057 Y117.518 I.934 J-.086 E.0255
G1 X138.81 Y118.173 E.03311
G3 X139.176 Y119.811 I-1.407 J1.175 E.05783
G3 X138.156 Y120.793 I-3.367 J-2.474 E.04722
G2 X137.789 Y122.431 I1.407 J1.175 E.05783
G2 X138.81 Y123.414 I3.367 J-2.475 E.04722
G3 X139.176 Y125.052 I-1.407 J1.175 E.05783
G3 X138.156 Y126.035 I-3.367 J-2.474 E.04722
G2 X137.789 Y127.673 I1.407 J1.175 E.05783
G2 X138.81 Y128.655 I3.367 J-2.474 E.04722
G3 X139.176 Y130.293 I-1.407 J1.175 E.05783
G3 X138.156 Y131.276 I-3.367 J-2.474 E.04722
G2 X137.789 Y132.914 I1.407 J1.175 E.05783
G2 X138.81 Y133.897 I3.367 J-2.475 E.04722
G3 X139.176 Y135.535 I-1.407 J1.175 E.05783
G3 X138.156 Y136.517 I-3.367 J-2.474 E.04722
G2 X137.789 Y138.155 I1.407 J1.175 E.05783
G2 X138.749 Y139.086 I3.185 J-2.326 E.04457
G2 X140.404 Y137.172 I-13.399 J-13.256 E.08396
G1 X140.318 Y136.517 E.02192
G3 X140.677 Y135.862 I.934 J.086 E.0255
G1 X141.43 Y135.207 E.03311
G2 X141.797 Y133.569 I-1.407 J-1.175 E.05783
G2 X140.777 Y132.586 I-3.367 J2.475 E.04722
G3 X140.41 Y130.948 I1.407 J-1.175 E.05783
G3 X141.43 Y129.966 I3.367 J2.474 E.04722
G2 X141.797 Y128.328 I-1.407 J-1.175 E.05783
G2 X140.777 Y127.345 I-3.367 J2.475 E.04722
G3 X140.41 Y125.707 I1.407 J-1.175 E.05783
G3 X141.43 Y124.724 I3.367 J2.474 E.04722
G2 X141.797 Y123.086 I-1.407 J-1.175 E.05783
G2 X140.777 Y122.104 I-3.367 J2.474 E.04722
G3 X140.41 Y120.466 I1.407 J-1.175 E.05783
G3 X141.076 Y119.791 I2.294 J1.599 E.0316
G3 X143.328 Y126.157 I-13.692 J8.424 E.22567
G2 X143.031 Y127.673 I1.389 J1.059 E.05306
G2 X143.439 Y128.137 I2.171 J-1.498 E.02056
G3 X143.338 Y129.761 I-16.452 J-.211 E.054
M204 S10000
G1 X144.202 Y128.005 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413179
G1 F12000
M204 S6000
G2 X144.181 Y128.82 I-16.199 J-.008 E3.04628
G1 X144.2 Y128.065 E.02279
M204 S10000
G1 X115.378 Y137.555 F42000
; LINE_WIDTH: 0.413159
G1 F12000
M204 S6000
G3 X116.4 Y138.773 I12.622 J-9.555 E2.95281
G3 X115.415 Y137.602 I11.708 J-10.846 E.04618
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X115.9 Y138.207 E-.29452
G1 X116.4 Y138.773 E-.28712
G1 X116.728 Y139.109 E-.17836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/32
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I.843 J-.878 P1  F42000
G1 X113.425 Y135.937 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X122.716 Y112.273 I14.566 J-7.937 E.96078
G3 X129.082 Y111.448 I5.27 J15.682 E.2143
G3 X113.454 Y135.99 I-1.091 J16.552 E2.28035
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X122.586 Y111.887 I14.924 J-8.132 E.98437
G3 X129.103 Y111.041 I5.398 J16.064 E.21935
G3 X113.096 Y136.185 I-1.111 J16.959 E2.33656
M204 S250
G1 X112.723 Y136.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.462 Y111.516 I15.268 J-8.319 E.93287
G3 X129.122 Y110.65 I5.522 J16.432 E.20769
G3 X112.752 Y136.372 I-1.131 J17.35 E2.21447
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35233
G1 X111.976 Y134.755 E-.32946
G1 X111.9 Y134.563 E-.07821
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


G1 X113.549 Y122.563 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X113.056 Y124.114 I16.216 J6.013 E.05401
G3 X113.296 Y125.052 I-1.623 J.914 E.03248
G3 X112.735 Y125.669 I-1.116 J-.452 E.02823
G2 X112.575 Y128.722 I16.15 J2.376 E.10156
G3 X113.271 Y129.966 I-1.47 J1.638 E.04814
G3 X112.824 Y130.839 I-.831 J.126 E.03472
G2 X114.546 Y135.573 I16.332 J-3.259 E.16777
G2 X115.891 Y133.897 I-1.168 J-2.315 E.07352
G2 X115.718 Y133.241 I-.546 J-.206 E.02399
G1 X114.65 Y132.586 E.04156
G3 X113.902 Y131.276 I1.541 J-1.748 E.05097
G3 X114.076 Y130.621 I.546 J-.206 E.02399
G1 X115.144 Y129.966 E.04156
G2 X115.891 Y128.655 I-1.541 J-1.748 E.05097
G2 X115.718 Y128 I-.546 J-.206 E.02399
G1 X114.65 Y127.345 E.04156
G3 X113.902 Y126.035 I1.541 J-1.748 E.05097
G3 X114.076 Y125.38 I.546 J-.206 E.02399
G1 X115.144 Y124.724 E.04156
G2 X115.891 Y123.414 I-1.54 J-1.748 E.05097
G2 X115.718 Y122.759 I-.546 J-.206 E.02399
G1 X114.65 Y122.104 E.04156
G1 X114.133 Y121.449 E.02769
G1 X114.083 Y121.307 E.00498
G3 X115.109 Y119.504 I29.371 J15.523 E.06883
G1 X115.661 Y118.828 E.02894
G1 X115.733 Y118.621 E.00727
G3 X116.682 Y117.494 I17.752 J13.974 E.04888
G1 X117.764 Y118.173 E.04237
G3 X118.512 Y119.483 I-1.541 J1.748 E.05097
G3 X118.339 Y120.138 I-.546 J.206 E.02399
G1 X117.271 Y120.793 E.04156
G2 X116.523 Y122.104 I1.541 J1.748 E.05097
G2 X116.696 Y122.759 I.546 J.206 E.02399
G1 X117.764 Y123.414 E.04156
G3 X118.512 Y124.724 I-1.54 J1.748 E.05097
G3 X118.339 Y125.38 I-.546 J.206 E.02399
G1 X117.271 Y126.035 E.04156
G2 X116.523 Y127.345 I1.541 J1.748 E.05097
G2 X116.696 Y128 I.546 J.206 E.02399
G1 X117.764 Y128.655 E.04156
G3 X118.512 Y129.966 I-1.54 J1.748 E.05097
G3 X118.339 Y130.621 I-.546 J.206 E.02399
G1 X117.271 Y131.276 E.04156
G2 X116.523 Y132.586 I1.541 J1.748 E.05097
G2 X116.696 Y133.241 I.546 J.206 E.02399
M73 P60 R8
G1 X117.764 Y133.897 E.04156
G3 X118.512 Y135.207 I-1.54 J1.748 E.05097
G3 X118.339 Y135.862 I-.546 J.206 E.02399
G1 X117.271 Y136.517 E.04156
G2 X116.523 Y137.828 I1.541 J1.748 E.05097
G2 X116.696 Y138.483 I.546 J.206 E.02399
G1 X117.764 Y139.138 E.04156
G1 X118.281 Y139.793 E.02769
G1 X118.383 Y140.082 E.01017
G2 X119.579 Y140.943 I9.223 J-11.551 E.04888
G2 X121.133 Y139.138 I-1.085 J-2.506 E.08176
G2 X120.959 Y138.483 I-.546 J-.206 E.02399
G1 X119.892 Y137.828 E.04156
G3 X119.144 Y136.517 I1.54 J-1.748 E.05097
G3 X119.317 Y135.862 I.546 J-.206 E.02399
G1 X120.385 Y135.207 E.04156
G2 X121.133 Y133.897 I-1.541 J-1.748 E.05097
G2 X120.959 Y133.241 I-.546 J-.206 E.02399
G1 X119.892 Y132.586 E.04156
G3 X119.144 Y131.276 I1.54 J-1.748 E.05097
G3 X119.317 Y130.621 I.546 J-.206 E.02399
G1 X120.385 Y129.966 E.04156
G2 X121.133 Y128.655 I-1.541 J-1.748 E.05097
G2 X120.959 Y128 I-.546 J-.206 E.02399
G1 X119.892 Y127.345 E.04156
G3 X119.144 Y126.035 I1.541 J-1.748 E.05097
G3 X119.317 Y125.38 I.546 J-.206 E.02399
G1 X120.385 Y124.724 E.04156
G2 X121.133 Y123.414 I-1.541 J-1.748 E.05097
G2 X120.959 Y122.759 I-.546 J-.206 E.02399
G1 X119.892 Y122.104 E.04156
G3 X119.144 Y120.793 I1.54 J-1.748 E.05097
G3 X119.317 Y120.138 I.546 J-.206 E.02399
G1 X120.385 Y119.483 E.04156
G2 X121.133 Y118.173 I-1.541 J-1.748 E.05097
G2 X120.959 Y117.518 I-.546 J-.206 E.02399
G1 X119.892 Y116.862 E.04156
G3 X119.129 Y115.363 I1.837 J-1.877 E.05679
G3 X123.293 Y113.296 I8.915 J12.73 E.15479
G3 X123.753 Y114.242 I-1.152 J1.145 E.03552
G3 X123.58 Y114.897 I-.546 J.206 E.02399
G1 X122.512 Y115.552 E.04156
G2 X121.764 Y116.862 I1.54 J1.748 E.05097
G2 X121.938 Y117.518 I.546 J.206 E.02399
G1 X123.006 Y118.173 E.04156
G3 X123.753 Y119.483 I-1.541 J1.748 E.05097
G3 X123.58 Y120.138 I-.546 J.206 E.02399
G1 X122.512 Y120.793 E.04156
G2 X121.764 Y122.104 I1.541 J1.748 E.05097
G2 X121.938 Y122.759 I.546 J.206 E.02399
G1 X123.006 Y123.414 E.04156
G3 X123.753 Y124.724 I-1.54 J1.748 E.05097
G3 X123.58 Y125.38 I-.546 J.206 E.02399
G1 X122.512 Y126.035 E.04156
G2 X121.764 Y127.345 I1.54 J1.748 E.05097
G2 X121.938 Y128 I.546 J.206 E.02399
G1 X123.006 Y128.655 E.04156
G3 X123.753 Y129.966 I-1.54 J1.748 E.05097
G3 X123.58 Y130.621 I-.546 J.206 E.02399
G1 X122.512 Y131.276 E.04156
G2 X121.764 Y132.586 I1.541 J1.748 E.05097
G2 X121.938 Y133.241 I.546 J.206 E.02399
G1 X123.006 Y133.897 E.04156
G3 X123.753 Y135.207 I-1.54 J1.748 E.05097
G3 X123.58 Y135.862 I-.546 J.206 E.02399
G1 X122.512 Y136.517 E.04156
G2 X121.764 Y137.828 I1.54 J1.748 E.05097
G2 X121.938 Y138.483 I.546 J.206 E.02399
G1 X123.006 Y139.138 E.04156
G3 X123.753 Y140.448 I-1.54 J1.748 E.05097
G3 X123.58 Y141.103 I-.546 J.206 E.02399
G1 X122.512 Y141.759 E.04156
G1 X122.109 Y142.27 E.02161
G2 X125.373 Y143.216 I6.824 J-17.436 E.1129
G3 X124.385 Y141.759 I1.515 J-2.091 E.05961
G3 X124.558 Y141.103 I.546 J-.206 E.02399
G1 X125.626 Y140.448 E.04156
G2 X126.374 Y139.138 I-1.541 J-1.748 E.05097
G2 X126.201 Y138.483 I-.546 J-.206 E.02399
G1 X125.133 Y137.828 E.04156
G3 X124.385 Y136.517 I1.54 J-1.748 E.05097
G3 X124.558 Y135.862 I.546 J-.206 E.02399
G1 X125.626 Y135.207 E.04156
G2 X126.374 Y133.897 I-1.54 J-1.748 E.05097
G2 X126.201 Y133.241 I-.546 J-.206 E.02399
G1 X125.133 Y132.586 E.04156
G3 X124.385 Y131.276 I1.54 J-1.748 E.05097
G3 X124.558 Y130.621 I.546 J-.206 E.02399
G1 X125.626 Y129.966 E.04156
G2 X126.374 Y128.655 I-1.541 J-1.748 E.05097
G2 X126.201 Y128 I-.546 J-.206 E.02399
G1 X125.133 Y127.345 E.04156
G3 X124.385 Y126.035 I1.541 J-1.748 E.05097
G3 X124.558 Y125.38 I.546 J-.206 E.02399
G1 X125.626 Y124.724 E.04156
G2 X126.374 Y123.414 I-1.54 J-1.748 E.05097
G2 X126.201 Y122.759 I-.546 J-.206 E.02399
G1 X125.133 Y122.104 E.04156
G3 X124.385 Y120.793 I1.54 J-1.748 E.05097
G3 X124.558 Y120.138 I.546 J-.206 E.02399
G1 X125.626 Y119.483 E.04156
G2 X126.374 Y118.173 I-1.54 J-1.748 E.05097
G2 X126.201 Y117.518 I-.546 J-.206 E.02399
G1 X125.133 Y116.862 E.04156
G3 X124.385 Y115.552 I1.541 J-1.748 E.05097
G3 X124.558 Y114.897 I.546 J-.206 E.02399
G1 X125.626 Y114.242 E.04156
G2 X126.396 Y112.646 I-1.787 J-1.845 E.06001
G3 X127.615 Y112.562 I1.445 J12.173 E.04055
G3 X128.995 Y114.242 I-.832 J2.09 E.07525
G3 X128.821 Y114.897 I-.546 J.206 E.02399
G1 X127.754 Y115.552 E.04156
G2 X127.006 Y116.862 I1.541 J1.748 E.05097
G2 X127.179 Y117.518 I.546 J.206 E.02399
G1 X128.247 Y118.173 E.04156
G3 X128.995 Y119.483 I-1.541 J1.748 E.05097
G3 X128.821 Y120.138 I-.546 J.206 E.02399
G1 X127.754 Y120.793 E.04156
G2 X127.006 Y122.104 I1.541 J1.748 E.05097
G2 X127.179 Y122.759 I.546 J.206 E.02399
G1 X128.247 Y123.414 E.04156
G3 X128.995 Y124.724 I-1.54 J1.748 E.05097
G3 X128.821 Y125.38 I-.546 J.206 E.02399
G1 X127.754 Y126.035 E.04156
G2 X127.006 Y127.345 I1.541 J1.748 E.05097
G2 X127.179 Y128 I.546 J.206 E.02399
G1 X128.247 Y128.655 E.04156
G3 X128.995 Y129.966 I-1.54 J1.748 E.05097
G3 X128.821 Y130.621 I-.546 J.206 E.02399
G1 X127.754 Y131.276 E.04156
G2 X127.006 Y132.586 I1.541 J1.748 E.05097
G2 X127.179 Y133.241 I.546 J.206 E.02399
G1 X128.247 Y133.897 E.04156
G3 X128.995 Y135.207 I-1.54 J1.748 E.05097
G3 X128.821 Y135.862 I-.546 J.206 E.02399
G1 X127.754 Y136.517 E.04156
G2 X127.006 Y137.828 I1.541 J1.748 E.05097
G2 X127.179 Y138.483 I.546 J.206 E.02399
G1 X128.247 Y139.138 E.04156
G3 X128.995 Y140.448 I-1.54 J1.748 E.05097
G3 X128.821 Y141.103 I-.546 J.206 E.02399
G1 X127.754 Y141.759 E.04156
G2 X126.981 Y143.397 I1.783 J1.842 E.0614
G2 X128.614 Y143.426 I1.286 J-25.598 E.0542
M204 S10000
G1 X136.305 Y141.017 F42000
G1 F15476.087
M204 S6000
G3 X134.888 Y141.817 I-9.145 J-14.53 E.05401
G3 X135.041 Y141.103 I.716 J-.22 E.0253
G1 X136.109 Y140.448 E.04156
G2 X136.881 Y138.81 I-1.782 J-1.842 E.0614
G1 X136.683 Y138.483 E.0127
G1 X135.616 Y137.828 E.04156
G3 X134.843 Y136.19 I1.782 J-1.842 E.0614
G1 X135.041 Y135.862 E.0127
G1 X136.109 Y135.207 E.04156
G2 X136.881 Y133.569 I-1.782 J-1.842 E.0614
G1 X136.683 Y133.241 E.0127
G1 X135.616 Y132.586 E.04156
G3 X134.843 Y130.948 I1.782 J-1.842 E.0614
G1 X135.041 Y130.621 E.0127
G1 X136.109 Y129.966 E.04156
G2 X136.881 Y128.328 I-1.782 J-1.842 E.0614
G1 X136.683 Y128 E.0127
G1 X135.616 Y127.345 E.04156
G3 X134.843 Y125.707 I1.782 J-1.842 E.0614
G1 X135.041 Y125.38 E.0127
G1 X136.109 Y124.724 E.04156
G2 X136.881 Y123.086 I-1.782 J-1.842 E.0614
G1 X136.683 Y122.759 E.0127
G1 X135.616 Y122.104 E.04156
G3 X134.843 Y120.466 I1.782 J-1.842 E.0614
G1 X135.041 Y120.138 E.0127
G1 X136.109 Y119.483 E.04156
G2 X136.881 Y117.845 I-1.782 J-1.842 E.0614
G1 X136.683 Y117.518 E.0127
G1 X135.616 Y116.862 E.04156
G3 X134.843 Y115.225 I1.782 J-1.842 E.0614
G1 X135.041 Y114.897 E.0127
G1 X135.595 Y114.557 E.02155
G2 X134.084 Y113.811 I-7.887 J14.067 E.0559
G3 X134.063 Y114.897 I-.754 J.528 E.03852
G1 X132.995 Y115.552 E.04156
G2 X132.222 Y117.19 I1.782 J1.842 E.0614
G1 X132.42 Y117.518 E.0127
G1 X133.488 Y118.173 E.04156
G3 X134.261 Y119.811 I-1.783 J1.842 E.0614
G1 X134.063 Y120.138 E.0127
G1 X132.995 Y120.793 E.04156
G2 X132.222 Y122.431 I1.782 J1.842 E.0614
G1 X132.42 Y122.759 E.0127
G1 X133.488 Y123.414 E.04156
G3 X134.261 Y125.052 I-1.782 J1.842 E.0614
G1 X134.063 Y125.38 E.0127
G1 X132.995 Y126.035 E.04156
G2 X132.222 Y127.673 I1.782 J1.842 E.0614
G1 X132.42 Y128 E.0127
G1 X133.488 Y128.655 E.04156
G3 X134.261 Y130.293 I-1.782 J1.842 E.0614
G1 X134.063 Y130.621 E.0127
G1 X132.995 Y131.276 E.04156
G2 X132.222 Y132.914 I1.782 J1.842 E.0614
G1 X132.42 Y133.241 E.0127
G1 X133.488 Y133.897 E.04156
G3 X134.261 Y135.535 I-1.782 J1.842 E.0614
G1 X134.063 Y135.862 E.0127
G1 X132.995 Y136.517 E.04156
G2 X132.222 Y138.155 I1.782 J1.842 E.0614
G1 X132.42 Y138.483 E.0127
G1 X133.488 Y139.138 E.04156
G3 X134.261 Y140.776 I-1.782 J1.842 E.0614
G1 X134.063 Y141.103 E.0127
G1 X132.995 Y141.759 E.04156
G1 X132.478 Y142.414 E.02769
G1 X132.335 Y142.818 E.01423
G3 X130.617 Y143.218 I-11.546 J-45.78 E.05852
G1 X130.374 Y143.069 E.00944
G3 X129.601 Y141.431 I1.782 J-1.842 E.0614
G1 X129.8 Y141.103 E.0127
G1 X130.867 Y140.448 E.04156
G2 X131.64 Y138.81 I-1.782 J-1.842 E.0614
G1 X131.442 Y138.483 E.0127
G1 X130.374 Y137.828 E.04156
G3 X129.601 Y136.19 I1.782 J-1.842 E.0614
G1 X129.8 Y135.862 E.0127
G1 X130.867 Y135.207 E.04156
G2 X131.64 Y133.569 I-1.782 J-1.842 E.0614
G1 X131.442 Y133.241 E.0127
G1 X130.374 Y132.586 E.04156
G3 X129.601 Y130.948 I1.782 J-1.842 E.0614
G1 X129.8 Y130.621 E.0127
G1 X130.867 Y129.966 E.04156
G2 X131.64 Y128.328 I-1.782 J-1.842 E.0614
G1 X131.442 Y128 E.0127
G1 X130.374 Y127.345 E.04156
G3 X129.601 Y125.707 I1.782 J-1.842 E.0614
G1 X129.8 Y125.38 E.0127
G1 X130.867 Y124.724 E.04156
G2 X131.64 Y123.086 I-1.782 J-1.842 E.0614
G1 X131.442 Y122.759 E.0127
G1 X130.374 Y122.104 E.04156
G3 X129.601 Y120.466 I1.782 J-1.842 E.0614
G1 X129.8 Y120.138 E.0127
G1 X130.867 Y119.483 E.04156
G2 X131.64 Y117.845 I-1.782 J-1.842 E.0614
G1 X131.442 Y117.518 E.0127
G1 X130.374 Y116.862 E.04156
G3 X129.601 Y115.225 I1.782 J-1.842 E.0614
G1 X129.8 Y114.897 E.0127
G1 X130.867 Y114.242 E.04156
G2 X131.596 Y112.985 I-1.471 J-1.693 E.04907
G2 X129.996 Y112.689 I-3.955 J16.871 E.05401
M204 S10000
G1 X139.016 Y117.184 F42000
G1 F15476.087
M204 S6000
G2 X137.816 Y116.084 I-11.187 J10.996 E.054
G1 X137.719 Y116.207 E.00521
G2 X137.463 Y117.19 I1.699 J.966 E.03407
G1 X137.662 Y117.518 E.0127
G1 X138.729 Y118.173 E.04156
G3 X139.502 Y119.811 I-1.782 J1.842 E.0614
G1 X139.304 Y120.138 E.0127
G1 X138.236 Y120.793 E.04156
G2 X137.463 Y122.431 I1.782 J1.842 E.0614
G1 X137.662 Y122.759 E.0127
G1 X138.729 Y123.414 E.04156
G3 X139.502 Y125.052 I-1.782 J1.842 E.0614
G1 X139.304 Y125.38 E.0127
G1 X138.236 Y126.035 E.04156
G2 X137.463 Y127.673 I1.782 J1.842 E.0614
G1 X137.662 Y128 E.0127
G1 X138.729 Y128.655 E.04156
G3 X139.502 Y130.293 I-1.782 J1.842 E.0614
G1 X139.304 Y130.621 E.0127
G1 X138.236 Y131.276 E.04156
G2 X137.463 Y132.914 I1.782 J1.842 E.0614
G1 X137.662 Y133.241 E.0127
G1 X138.729 Y133.897 E.04156
G3 X139.502 Y135.535 I-1.782 J1.842 E.0614
G1 X139.304 Y135.862 E.0127
G1 X138.236 Y136.517 E.04156
G2 X137.463 Y138.155 I1.782 J1.842 E.0614
G1 X137.662 Y138.483 E.0127
G1 X138.708 Y139.125 E.04071
G2 X140.381 Y137.225 I-11.272 J-11.619 E.08406
G1 X140.34 Y137.172 E.00223
G3 X140.084 Y136.19 I1.699 J-.966 E.03407
G1 X140.282 Y135.862 E.0127
G1 X141.35 Y135.207 E.04156
G2 X142.123 Y133.569 I-1.782 J-1.842 E.0614
G1 X141.925 Y133.241 E.0127
G1 X140.857 Y132.586 E.04156
G3 X140.084 Y130.948 I1.782 J-1.842 E.0614
G1 X140.282 Y130.621 E.0127
G1 X141.35 Y129.966 E.04156
G2 X142.123 Y128.328 I-1.782 J-1.842 E.0614
G1 X141.925 Y128 E.0127
G1 X140.857 Y127.345 E.04156
G3 X140.084 Y125.707 I1.782 J-1.842 E.0614
G1 X140.282 Y125.38 E.0127
G1 X141.35 Y124.724 E.04156
G2 X142.123 Y123.086 I-1.782 J-1.842 E.0614
G1 X141.925 Y122.759 E.0127
G1 X140.857 Y122.104 E.04156
G3 X140.084 Y120.466 I1.782 J-1.842 E.0614
G1 X140.282 Y120.138 E.0127
G1 X141.011 Y119.691 E.02837
G3 X143.335 Y126.215 I-13.578 J8.512 E.23157
G2 X142.705 Y127.673 I1.761 J1.627 E.05368
G1 X142.903 Y128 E.0127
G1 X143.435 Y128.326 E.02069
G3 X143.314 Y129.949 I-15.469 J-.33 E.054
M204 S10000
G1 X144.202 Y128.005 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413168
G1 F12000
M204 S6000
G2 X144.181 Y128.82 I-16.199 J-.008 E3.04619
G1 X144.2 Y128.065 E.02279
M204 S10000
G1 X115.378 Y137.555 F42000
; LINE_WIDTH: 0.413159
G1 F12000
M204 S6000
G3 X116.4 Y138.773 I12.621 J-9.554 E2.95269
G3 X115.415 Y137.602 I11.709 J-10.847 E.04618
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X115.9 Y138.207 E-.29452
G1 X116.4 Y138.773 E-.28713
G1 X116.728 Y139.109 E-.17836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/32
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.6 I.843 J-.878 P1  F42000
G1 X113.425 Y135.937 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X121.177 Y112.878 I14.567 J-7.936 E.90587
G3 X129.009 Y111.444 I6.808 J15.087 E.26676
G3 X113.454 Y135.99 I-1.018 J16.557 E2.28275
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X121.009 Y112.506 I14.924 J-8.131 E.92811
G3 X129.03 Y111.038 I6.975 J15.457 E.27316
G3 X113.096 Y136.184 I-1.038 J16.964 E2.339
M204 S250
G1 X112.723 Y136.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.848 Y112.149 I15.268 J-8.318 E.87955
G3 X129.049 Y110.646 I7.136 J15.812 E.25873
G3 X112.751 Y136.372 I-1.058 J17.355 E2.21675
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35226
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.07828
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


G1 X113.755 Y133.959 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X114.461 Y135.425 I90.744 J-42.814 E.05399
G1 X114.897 Y135.297 E.01508
G1 X115.552 Y134.817 E.02694
G1 X116.207 Y133.858 E.03853
G1 X116.535 Y133.627 E.01329
G3 X118.173 Y134.287 I.049 J2.243 E.0602
G1 X118.828 Y135.246 E.03853
G1 X119.155 Y135.477 E.01329
G2 X120.793 Y134.817 I.049 J-2.243 E.0602
G1 X121.449 Y133.858 E.03853
G1 X121.776 Y133.627 E.01329
G3 X123.414 Y134.287 I.049 J2.243 E.0602
G1 X124.069 Y135.246 E.03853
G1 X124.397 Y135.477 E.01329
G2 X126.035 Y134.817 I.049 J-2.243 E.0602
G1 X126.69 Y133.858 E.03853
G1 X127.017 Y133.627 E.01329
G3 X128.655 Y134.287 I.049 J2.243 E.0602
G1 X129.311 Y135.246 E.03853
G1 X129.638 Y135.477 E.01329
G2 X131.276 Y134.817 I.049 J-2.243 E.0602
G1 X131.931 Y133.858 E.03853
G1 X132.259 Y133.627 E.01329
G3 X133.897 Y134.287 I.049 J2.243 E.0602
G1 X134.552 Y135.246 E.03853
G1 X134.879 Y135.477 E.01329
G2 X136.517 Y134.817 I.049 J-2.243 E.0602
G1 X137.172 Y133.858 E.03853
G1 X137.5 Y133.627 E.01329
G3 X139.138 Y134.287 I.049 J2.243 E.0602
G1 X139.793 Y135.246 E.03853
M73 P60 R7
G1 X140.121 Y135.477 E.01329
G2 X141.759 Y134.817 I.049 J-2.243 E.0602
G2 X142.653 Y132.861 I-7.194 J-4.471 E.07152
M204 S10000
G1 X143.28 Y130.227 F42000
G1 F15476.087
M204 S6000
G3 X142.962 Y131.823 I-101.653 J-19.413 E.05399
G1 X142.414 Y132.625 E.03222
G3 X141.759 Y132.869 I-.517 J-.385 E.02451
M73 P61 R7
G3 X140.448 Y132.196 I.277 J-2.152 E.04985
G1 X139.793 Y131.237 E.03853
G2 X139.138 Y130.993 I-.517 J.385 E.02452
G2 X137.828 Y131.666 I.277 J2.152 E.04985
G1 X137.172 Y132.625 E.03853
G3 X136.517 Y132.869 I-.517 J-.385 E.02451
G3 X135.207 Y132.196 I.277 J-2.152 E.04985
G1 X134.552 Y131.237 E.03853
G2 X133.897 Y130.993 I-.517 J.385 E.02452
G2 X132.586 Y131.666 I.277 J2.152 E.04985
G1 X131.931 Y132.625 E.03853
G3 X131.276 Y132.869 I-.517 J-.385 E.02452
G3 X129.966 Y132.196 I.277 J-2.152 E.04985
G1 X129.311 Y131.237 E.03853
G2 X128.655 Y130.993 I-.517 J.385 E.02452
G2 X127.345 Y131.666 I.277 J2.152 E.04985
G1 X126.69 Y132.625 E.03853
G3 X126.035 Y132.869 I-.517 J-.385 E.02451
G3 X124.724 Y132.196 I.277 J-2.152 E.04985
G1 X124.069 Y131.237 E.03853
G2 X123.414 Y130.993 I-.517 J.385 E.02452
G2 X122.104 Y131.666 I.277 J2.152 E.04985
G1 X121.449 Y132.625 E.03853
G3 X120.793 Y132.869 I-.517 J-.385 E.02452
G3 X119.483 Y132.196 I.277 J-2.152 E.04985
G1 X118.828 Y131.237 E.03853
G2 X118.173 Y130.993 I-.517 J.385 E.02451
G2 X116.862 Y131.666 I.277 J2.152 E.04985
G1 X116.207 Y132.625 E.03853
G3 X115.552 Y132.869 I-.517 J-.385 E.02451
G3 X114.242 Y132.196 I.277 J-2.152 E.04985
G1 X113.587 Y131.237 E.03853
G2 X112.856 Y131.015 I-.561 J.534 E.0265
G3 X112.578 Y128.786 I16.841 J-3.232 E.07457
G1 X112.931 Y129.045 E.01455
G1 X113.587 Y130.004 E.03853
G2 X114.242 Y130.249 I.517 J-.385 E.02452
G2 X115.552 Y129.576 I-.277 J-2.152 E.04985
G1 X116.207 Y128.617 E.03853
G3 X116.862 Y128.372 I.517 J.385 E.02452
G3 X118.173 Y129.045 I-.277 J2.152 E.04985
G1 X118.828 Y130.004 E.03853
G2 X119.483 Y130.249 I.517 J-.385 E.02452
G2 X120.793 Y129.576 I-.277 J-2.152 E.04985
G1 X121.449 Y128.617 E.03853
G3 X122.104 Y128.372 I.517 J.385 E.02451
G3 X123.414 Y129.045 I-.277 J2.152 E.04985
G1 X124.069 Y130.004 E.03853
G2 X124.724 Y130.249 I.517 J-.385 E.02452
G2 X126.035 Y129.576 I-.277 J-2.152 E.04985
G1 X126.69 Y128.617 E.03853
G3 X127.345 Y128.372 I.517 J.385 E.02452
G3 X128.655 Y129.045 I-.277 J2.152 E.04985
G1 X129.311 Y130.004 E.03853
G2 X129.966 Y130.249 I.517 J-.385 E.02452
G2 X131.276 Y129.576 I-.277 J-2.152 E.04985
G1 X131.931 Y128.617 E.03853
G3 X132.586 Y128.372 I.517 J.385 E.02451
G3 X133.897 Y129.045 I-.277 J2.152 E.04985
G1 X134.552 Y130.004 E.03853
G2 X135.207 Y130.249 I.517 J-.385 E.02452
G2 X136.517 Y129.576 I-.277 J-2.152 E.04985
G1 X137.172 Y128.617 E.03853
G3 X137.828 Y128.372 I.517 J.385 E.02451
G3 X139.138 Y129.045 I-.277 J2.152 E.04985
G1 X139.793 Y130.004 E.03853
G2 X140.448 Y130.249 I.517 J-.385 E.02452
G2 X141.759 Y129.576 I-.277 J-2.152 E.04985
G1 X142.414 Y128.617 E.03853
G3 X143.431 Y128.479 I.601 J.617 E.03647
G2 X143.337 Y126.228 I-24.361 J-.108 E.07474
G1 X143.069 Y126.425 E.01101
G1 X142.414 Y127.384 E.03853
G3 X141.759 Y127.628 I-.517 J-.385 E.02451
G3 X140.448 Y126.955 I.277 J-2.152 E.04985
G1 X139.793 Y125.996 E.03853
G2 X139.138 Y125.752 I-.517 J.385 E.02451
G2 X137.828 Y126.425 I.277 J2.152 E.04985
G1 X137.172 Y127.384 E.03853
G3 X136.517 Y127.628 I-.517 J-.385 E.02452
G3 X135.207 Y126.955 I.277 J-2.152 E.04985
G1 X134.552 Y125.996 E.03853
G2 X133.897 Y125.752 I-.517 J.385 E.02451
G2 X132.586 Y126.425 I.277 J2.152 E.04985
G1 X131.931 Y127.384 E.03853
G3 X131.276 Y127.628 I-.517 J-.385 E.02452
G3 X129.966 Y126.955 I.277 J-2.152 E.04985
G1 X129.311 Y125.996 E.03853
G2 X128.655 Y125.752 I-.517 J.385 E.02451
G2 X127.345 Y126.425 I.277 J2.152 E.04985
G1 X126.69 Y127.384 E.03853
G3 X126.035 Y127.628 I-.517 J-.385 E.02452
G3 X124.724 Y126.955 I.277 J-2.152 E.04985
G1 X124.069 Y125.996 E.03853
G2 X123.414 Y125.752 I-.517 J.385 E.02451
G2 X122.104 Y126.425 I.277 J2.152 E.04985
G1 X121.449 Y127.384 E.03853
G3 X120.793 Y127.628 I-.517 J-.385 E.02452
G3 X119.483 Y126.955 I.277 J-2.152 E.04985
G1 X118.828 Y125.996 E.03853
G2 X118.173 Y125.752 I-.517 J.385 E.02451
G2 X116.862 Y126.425 I.277 J2.152 E.04985
G1 X116.207 Y127.384 E.03853
G3 X115.552 Y127.628 I-.517 J-.385 E.02452
G3 X114.242 Y126.955 I.277 J-2.152 E.04985
G1 X113.587 Y125.996 E.03853
G2 X112.715 Y125.815 I-.568 J.548 E.03136
G3 X113.081 Y124.024 I38.114 J6.859 E.06067
G1 X113.587 Y124.763 E.02971
G2 X114.242 Y125.007 I.517 J-.385 E.02451
G2 X115.552 Y124.334 I-.277 J-2.152 E.04985
G1 X116.207 Y123.375 E.03853
G3 X116.862 Y123.131 I.517 J.385 E.02452
G3 X118.173 Y123.804 I-.277 J2.152 E.04985
G1 X118.828 Y124.763 E.03853
G2 X119.483 Y125.007 I.517 J-.385 E.02451
G2 X120.793 Y124.334 I-.277 J-2.152 E.04985
G1 X121.449 Y123.375 E.03853
G3 X122.104 Y123.131 I.517 J.385 E.02451
G3 X123.414 Y123.804 I-.277 J2.152 E.04985
G1 X124.069 Y124.763 E.03853
G2 X124.724 Y125.007 I.517 J-.385 E.02451
G2 X126.035 Y124.334 I-.277 J-2.152 E.04985
G1 X126.69 Y123.375 E.03853
G3 X127.345 Y123.131 I.517 J.385 E.02452
G3 X128.655 Y123.804 I-.277 J2.152 E.04985
G1 X129.311 Y124.763 E.03853
G2 X129.966 Y125.007 I.517 J-.385 E.02451
G2 X131.276 Y124.334 I-.277 J-2.152 E.04985
G1 X131.931 Y123.375 E.03853
G3 X132.586 Y123.131 I.517 J.385 E.02451
G3 X133.897 Y123.804 I-.277 J2.152 E.04985
G1 X134.552 Y124.763 E.03853
G2 X135.207 Y125.007 I.517 J-.385 E.02451
G2 X136.517 Y124.334 I-.277 J-2.152 E.04985
G1 X137.172 Y123.375 E.03853
G3 X137.828 Y123.131 I.517 J.385 E.02451
G3 X139.138 Y123.804 I-.277 J2.152 E.04985
G1 X139.793 Y124.763 E.03853
G2 X140.448 Y125.007 I.517 J-.385 E.02452
G2 X141.759 Y124.334 I-.277 J-2.152 E.04985
G1 X142.414 Y123.375 E.03853
G1 X142.671 Y123.194 E.01045
G2 X142.313 Y122.213 I-10.008 J3.098 E.03464
G3 X141.759 Y122.387 I-.412 J-.343 E.02037
G3 X140.448 Y121.714 I.277 J-2.152 E.04985
G1 X139.793 Y120.755 E.03853
G2 X139.138 Y120.51 I-.517 J.385 E.02452
G2 X137.828 Y121.183 I.277 J2.152 E.04985
G1 X137.172 Y122.142 E.03853
G3 X136.517 Y122.387 I-.517 J-.385 E.02451
G3 X135.207 Y121.714 I.277 J-2.152 E.04985
G1 X134.552 Y120.755 E.03853
G2 X133.897 Y120.51 I-.517 J.385 E.02452
G2 X132.586 Y121.183 I.277 J2.152 E.04985
G1 X131.931 Y122.142 E.03853
G3 X131.276 Y122.387 I-.517 J-.385 E.02452
G3 X129.966 Y121.714 I.277 J-2.152 E.04985
G1 X129.311 Y120.755 E.03853
G2 X128.655 Y120.51 I-.517 J.385 E.02452
G2 X127.345 Y121.183 I.277 J2.152 E.04985
G1 X126.69 Y122.142 E.03853
G3 X126.035 Y122.387 I-.517 J-.385 E.02451
G3 X124.724 Y121.714 I.277 J-2.152 E.04985
G1 X124.069 Y120.755 E.03853
G2 X123.414 Y120.51 I-.517 J.385 E.02452
G2 X122.104 Y121.183 I.277 J2.152 E.04985
G1 X121.449 Y122.142 E.03853
G3 X120.793 Y122.387 I-.517 J-.385 E.02452
G3 X119.483 Y121.714 I.277 J-2.152 E.04985
G1 X118.828 Y120.755 E.03853
G2 X118.173 Y120.51 I-.517 J.385 E.02451
G2 X116.862 Y121.183 I.277 J2.152 E.04985
G1 X116.207 Y122.142 E.03853
G3 X115.552 Y122.387 I-.517 J-.385 E.02451
G3 X114.036 Y121.412 I.469 J-2.397 E.06124
G3 X115.216 Y119.34 I22.811 J11.613 E.07913
G1 X115.552 Y119.093 E.01384
G1 X116.207 Y118.134 E.03853
G3 X116.862 Y117.89 I.517 J.385 E.02452
G3 X118.173 Y118.563 I-.277 J2.152 E.04985
G1 X118.828 Y119.522 E.03853
G2 X119.483 Y119.766 I.517 J-.385 E.02451
G2 X120.793 Y119.093 I-.277 J-2.152 E.04985
G1 X121.449 Y118.134 E.03853
G3 X122.104 Y117.89 I.517 J.385 E.02452
G3 X123.414 Y118.563 I-.277 J2.152 E.04985
G1 X124.069 Y119.522 E.03853
G2 X124.724 Y119.766 I.517 J-.385 E.02451
G2 X126.035 Y119.093 I-.277 J-2.152 E.04985
G1 X126.69 Y118.134 E.03853
G3 X127.345 Y117.89 I.517 J.385 E.02452
G3 X128.655 Y118.563 I-.277 J2.152 E.04985
G1 X129.311 Y119.522 E.03853
G2 X129.966 Y119.766 I.517 J-.385 E.02451
G2 X131.276 Y119.093 I-.277 J-2.152 E.04985
G1 X131.931 Y118.134 E.03853
G3 X132.586 Y117.89 I.517 J.385 E.02452
G3 X133.897 Y118.563 I-.277 J2.152 E.04985
G1 X134.552 Y119.522 E.03853
G2 X135.207 Y119.766 I.517 J-.385 E.02451
G2 X136.517 Y119.093 I-.277 J-2.152 E.04985
G1 X137.172 Y118.134 E.03853
G3 X137.828 Y117.89 I.517 J.385 E.02452
G3 X139.138 Y118.563 I-.277 J2.152 E.04985
G1 X139.793 Y119.522 E.03853
G2 X140.448 Y119.766 I.517 J-.385 E.02452
G1 X140.962 Y119.615 E.01777
G2 X140.008 Y118.297 I-13.056 J8.449 E.054
M204 S10000
G1 X144.202 Y128.005 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413158
G1 F12000
M204 S6000
G2 X144.181 Y128.82 I-16.199 J-.008 E3.04611
G1 X144.2 Y128.065 E.02278
M204 S10000
G1 X118.753 Y115.15 F42000
; LINE_WIDTH: 0.413129
G1 F12000
M204 S6000
G3 X118.124 Y115.627 I9.245 J12.848 E2.9765
G1 X118.705 Y115.186 E.022
M204 S10000
G1 X120.218 Y114.663 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X118.858 Y115.558 I8.874 J14.97 E.05401
G1 X119.483 Y116.472 E.03674
G2 X120.793 Y117.145 I1.588 J-1.479 E.04985
G2 X121.449 Y116.901 I.138 J-.63 E.02452
G1 X122.104 Y115.942 E.03853
G3 X123.414 Y115.269 I1.588 J1.479 E.04985
G3 X124.069 Y115.513 I.138 J.63 E.02451
G1 X124.724 Y116.472 E.03853
G2 X126.035 Y117.145 I1.588 J-1.479 E.04985
G2 X126.69 Y116.901 I.138 J-.63 E.02452
G1 X127.345 Y115.942 E.03853
G3 X128.655 Y115.269 I1.588 J1.479 E.04985
G3 X129.311 Y115.513 I.138 J.63 E.02451
G1 X129.966 Y116.472 E.03853
G2 X131.276 Y117.145 I1.588 J-1.479 E.04985
G2 X131.931 Y116.901 I.138 J-.63 E.02452
G1 X132.586 Y115.942 E.03853
G3 X133.897 Y115.269 I1.588 J1.479 E.04985
G3 X134.552 Y115.513 I.138 J.63 E.02451
G1 X135.207 Y116.472 E.03853
G2 X136.517 Y117.145 I1.588 J-1.479 E.04985
G2 X137.172 Y116.901 I.138 J-.63 E.02452
G1 X137.762 Y116.038 E.03466
G2 X135.42 Y114.462 I-9.866 J12.129 E.09377
G1 X135.207 Y114.525 E.00736
G3 X134.291 Y113.898 I-.008 J-.972 E.03919
G2 X131.828 Y113.044 I-8.361 J20.132 E.08653
G3 X129.966 Y114.525 I-2.434 J-1.15 E.08174
G3 X129.311 Y114.28 I-.138 J-.63 E.02451
G1 X128.655 Y113.321 E.03853
G2 X127.345 Y112.648 I-1.588 J1.479 E.04985
G2 X126.69 Y112.893 I-.138 J.63 E.02452
G1 X126.035 Y113.852 E.03853
G3 X124.724 Y114.525 I-1.588 J-1.479 E.04985
G3 X124.069 Y114.28 I-.138 J-.63 E.02452
G1 X123.354 Y113.277 E.04087
G2 X121.83 Y113.848 I4.825 J15.222 E.054
M204 S10000
G1 X120.574 Y141.535 F42000
G1 F15476.087
M204 S6000
G2 X122.04 Y142.241 I7.443 J-13.57 E.054
G3 X123.414 Y141.476 I1.968 J1.916 E.05291
G3 X124.069 Y141.72 I.138 J.629 E.02452
G1 X124.724 Y142.679 E.03853
G2 X126.362 Y143.339 I1.628 J-1.679 E.06006
G1 X126.69 Y143.108 E.01329
G1 X127.345 Y142.149 E.03853
G3 X128.655 Y141.476 I1.588 J1.479 E.04985
G3 X129.311 Y141.72 I.138 J.629 E.02452
G1 X129.966 Y142.679 E.03853
G1 X130.744 Y143.195 E.03099
G2 X132.078 Y142.892 I-2.37 J-13.51 E.04541
G3 X133.897 Y141.476 I2.369 J1.165 E.07912
G3 X134.685 Y141.915 I.037 J.861 E.03153
G2 X138.655 Y139.174 I-6.715 J-13.966 E.16068
G1 X138.483 Y139.048 E.00707
G1 X137.828 Y138.855 E.02265
G2 X137.172 Y139.099 I-.138 J.63 E.02451
G1 X136.517 Y140.058 E.03853
G3 X135.207 Y140.731 I-1.588 J-1.479 E.04985
G3 X134.552 Y140.487 I-.138 J-.63 E.02452
G1 X133.897 Y139.528 E.03853
G2 X132.586 Y138.855 I-1.588 J1.479 E.04985
G2 X131.931 Y139.099 I-.138 J.63 E.02451
G1 X131.276 Y140.058 E.03853
G3 X129.966 Y140.731 I-1.588 J-1.479 E.04985
G3 X129.311 Y140.487 I-.138 J-.63 E.02451
G1 X128.655 Y139.528 E.03853
G2 X127.345 Y138.855 I-1.588 J1.479 E.04985
G2 X126.69 Y139.099 I-.138 J.63 E.02452
G1 X126.035 Y140.058 E.03853
G3 X124.724 Y140.731 I-1.588 J-1.479 E.04985
G3 X124.069 Y140.487 I-.138 J-.63 E.02452
G1 X123.414 Y139.528 E.03853
G2 X122.104 Y138.855 I-1.588 J1.479 E.04985
G2 X121.449 Y139.099 I-.138 J.63 E.02451
G1 X120.793 Y140.058 E.03853
G3 X119.483 Y140.731 I-1.588 J-1.479 E.04985
G3 X118.732 Y140.346 I.135 J-1.19 E.02861
G1 X118.173 Y139.528 E.03288
G1 X117.518 Y139.048 E.02694
G1 X117.087 Y138.921 E.0149
G3 X116.154 Y137.904 I13.118 J-12.961 E.04579
G1 X116.862 Y136.907 E.04055
G3 X118.173 Y136.234 I1.588 J1.479 E.04985
G3 X118.828 Y136.479 I.138 J.63 E.02451
G1 X119.483 Y137.438 E.03853
G2 X120.793 Y138.111 I1.588 J-1.479 E.04985
G2 X121.449 Y137.866 I.138 J-.63 E.02452
G1 X122.104 Y136.907 E.03853
G3 X123.414 Y136.234 I1.588 J1.479 E.04985
G3 X124.069 Y136.479 I.138 J.63 E.02451
G1 X124.724 Y137.438 E.03853
G2 X126.035 Y138.111 I1.588 J-1.479 E.04985
G2 X126.69 Y137.866 I.138 J-.63 E.02452
G1 X127.345 Y136.907 E.03853
G3 X128.655 Y136.234 I1.588 J1.479 E.04985
G3 X129.311 Y136.479 I.138 J.63 E.02451
G1 X129.966 Y137.438 E.03853
G2 X131.276 Y138.111 I1.588 J-1.479 E.04985
G2 X131.931 Y137.866 I.138 J-.63 E.02452
G1 X132.586 Y136.907 E.03853
G3 X133.897 Y136.234 I1.588 J1.479 E.04985
G3 X134.552 Y136.479 I.138 J.63 E.02451
G1 X135.207 Y137.438 E.03853
G2 X136.517 Y138.111 I1.588 J-1.479 E.04985
G2 X137.172 Y137.866 I.138 J-.63 E.02452
G1 X137.828 Y136.907 E.03853
G3 X139.138 Y136.234 I1.588 J1.479 E.04985
G3 X139.793 Y136.479 I.138 J.63 E.02451
G1 X140.341 Y137.281 E.03223
G3 X139.296 Y138.529 I-77.117 J-63.534 E.05399
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X140.341 Y137.281 E-.61848
G1 X140.131 Y136.973 E-.14152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/32
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I.047 J-1.216 P1  F42000
G1 X113.424 Y135.937 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X120.431 Y113.237 I14.567 J-7.936 E.87842
G3 X128.936 Y111.441 I7.576 J14.841 E.29173
G3 X113.453 Y135.99 I-.945 J16.561 E2.28515
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X119.501 Y113.28 I14.925 J-8.13 E.87184
G3 X128.957 Y111.034 I8.483 J14.693 E.32696
G3 X113.096 Y136.184 I-.965 J16.968 E2.34145
M204 S250
G1 X112.722 Y136.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X119.305 Y112.94 I15.269 J-8.318 E.82623
G3 X128.976 Y110.643 I8.679 J15.032 E.30977
G3 X112.751 Y136.372 I-.985 J17.359 E2.21906
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35226
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.07827
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


G1 X113.696 Y133.809 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X114.386 Y135.283 I15.503 J-6.357 E.05401
G1 X114.897 Y135.241 E.01702
G1 X115.552 Y134.899 E.0245
G3 X116.535 Y133.919 I4.225 J3.251 E.04619
G1 X116.862 Y133.808 E.01147
G3 X118.173 Y134.204 I.183 J1.762 E.04662
G2 X119.155 Y135.185 I4.226 J-3.252 E.04619
G1 X119.483 Y135.295 E.01147
G2 X120.793 Y134.899 I.183 J-1.762 E.04662
G3 X121.776 Y133.919 I4.225 J3.251 E.04619
G1 X122.104 Y133.808 E.01147
G3 X123.414 Y134.204 I.183 J1.762 E.04662
G2 X124.397 Y135.185 I4.226 J-3.252 E.04619
G1 X124.724 Y135.295 E.01147
G2 X126.035 Y134.899 I.183 J-1.762 E.04662
G3 X127.017 Y133.919 I4.225 J3.251 E.04619
G1 X127.345 Y133.808 E.01147
G3 X128.655 Y134.204 I.183 J1.762 E.04662
G2 X129.638 Y135.185 I4.226 J-3.252 E.04619
G1 X129.966 Y135.295 E.01147
G2 X131.276 Y134.899 I.183 J-1.762 E.04662
G3 X132.259 Y133.919 I4.225 J3.251 E.04619
G1 X132.586 Y133.808 E.01147
G3 X133.897 Y134.204 I.183 J1.762 E.04662
G2 X134.879 Y135.185 I4.226 J-3.252 E.04619
G1 X135.207 Y135.295 E.01147
G2 X136.517 Y134.899 I.183 J-1.762 E.04662
G3 X137.5 Y133.919 I4.225 J3.251 E.04619
G1 X137.828 Y133.808 E.01147
G3 X139.138 Y134.204 I.183 J1.762 E.04662
G2 X140.121 Y135.185 I4.226 J-3.252 E.04619
G1 X140.448 Y135.295 E.01147
G2 X141.877 Y134.772 I.028 J-2.135 E.0516
M73 P62 R7
G3 X140.29 Y137.349 I-14.595 J-7.208 E.10054
G2 X139.138 Y136.429 I-1.921 J1.224 E.04981
G2 X137.828 Y136.825 I-.183 J1.762 E.04662
G3 X136.845 Y137.806 I-4.225 J-3.251 E.04619
G1 X136.517 Y137.916 E.01147
G3 X135.207 Y137.52 I-.183 J-1.762 E.04662
G2 X134.224 Y136.539 I-4.226 J3.252 E.04619
G1 X133.897 Y136.429 E.01147
G2 X132.586 Y136.825 I-.183 J1.762 E.04662
G3 X131.604 Y137.806 I-4.225 J-3.251 E.04619
G1 X131.276 Y137.916 E.01147
G3 X129.966 Y137.52 I-.183 J-1.762 E.04662
G2 X128.983 Y136.539 I-4.226 J3.252 E.04619
G1 X128.655 Y136.429 E.01147
G2 X127.345 Y136.825 I-.183 J1.762 E.04662
G3 X126.362 Y137.806 I-4.225 J-3.251 E.04619
G1 X126.035 Y137.916 E.01147
G3 X124.724 Y137.52 I-.183 J-1.762 E.04662
G2 X123.742 Y136.539 I-4.226 J3.252 E.04619
G1 X123.414 Y136.429 E.01147
G2 X122.104 Y136.825 I-.183 J1.762 E.04662
G3 X121.121 Y137.806 I-4.225 J-3.251 E.04619
G1 X120.793 Y137.916 E.01147
G3 X119.483 Y137.52 I-.183 J-1.762 E.04662
G2 X118.5 Y136.539 I-4.226 J3.252 E.04619
G1 X118.173 Y136.429 E.01147
G2 X116.862 Y136.825 I-.183 J1.762 E.04662
G3 X115.997 Y137.708 I-3.794 J-2.853 E.04112
G2 X117.246 Y139.082 I27.834 J-24.047 E.0616
G1 X117.518 Y139.104 E.00903
G1 X118.173 Y139.445 E.0245
G2 X119.155 Y140.426 I4.225 J-3.251 E.04619
G1 X119.483 Y140.537 E.01147
G2 X120.793 Y140.141 I.183 J-1.762 E.04662
G3 X121.776 Y139.16 I4.225 J3.251 E.04619
G1 X122.104 Y139.05 E.01147
G3 X123.414 Y139.445 I.183 J1.762 E.04662
G2 X124.397 Y140.426 I4.225 J-3.251 E.04619
G1 X124.724 Y140.537 E.01147
G2 X126.035 Y140.141 I.183 J-1.762 E.04662
G3 X127.017 Y139.16 I4.225 J3.251 E.04619
G1 X127.345 Y139.05 E.01147
G3 X128.655 Y139.445 I.183 J1.762 E.04662
G2 X129.638 Y140.426 I4.225 J-3.251 E.04619
G1 X129.966 Y140.537 E.01147
G2 X131.276 Y140.141 I.183 J-1.762 E.04662
G3 X132.259 Y139.16 I4.225 J3.251 E.04619
G1 X132.586 Y139.05 E.01147
G3 X133.897 Y139.445 I.183 J1.762 E.04662
G2 X134.879 Y140.426 I4.225 J-3.251 E.04619
G1 X135.207 Y140.537 E.01147
G2 X136.517 Y140.141 I.183 J-1.762 E.04662
G3 X137.5 Y139.16 I4.225 J3.251 E.04619
G1 X137.828 Y139.05 E.01147
G1 X138.483 Y139.104 E.02181
G1 X138.641 Y139.186 E.00591
G3 X134.496 Y142.006 I-10.703 J-11.275 E.16703
G2 X133.897 Y141.67 I-.735 J.608 E.02331
G2 X132.586 Y142.066 I-.183 J1.762 E.04662
G3 X131.663 Y142.998 I-4.009 J-3.052 E.04365
G3 X130.621 Y143.103 I-.76 J-2.328 E.035
G1 X129.966 Y142.761 E.0245
G2 X128.983 Y141.781 I-4.225 J3.251 E.04619
G1 X128.655 Y141.67 E.01147
G2 X127.345 Y142.066 I-.183 J1.762 E.04662
G3 X126.362 Y143.047 I-4.225 J-3.251 E.04619
G1 X126.035 Y143.157 E.01147
G3 X124.724 Y142.761 I-.183 J-1.762 E.04662
G2 X123.742 Y141.781 I-4.225 J3.251 E.04619
G1 X123.414 Y141.67 E.01147
G2 X121.969 Y142.211 I-.033 J2.109 E.05238
G3 X120.507 Y141.498 I6.105 J-14.374 E.054
M204 S10000
G1 X143.301 Y130.059 F42000
G1 F15476.087
M204 S6000
G3 X143 Y131.658 I-16.117 J-2.202 E.05401
G3 X142.086 Y132.564 I-3.906 J-3.025 E.0428
G1 X141.759 Y132.675 E.01147
G3 X140.448 Y132.279 I-.183 J-1.762 E.04662
G2 X139.466 Y131.298 I-4.225 J3.251 E.04619
G1 X139.138 Y131.188 E.01147
G2 X137.828 Y131.584 I-.183 J1.762 E.04662
G3 X136.845 Y132.564 I-4.225 J-3.251 E.04619
G1 X136.517 Y132.675 E.01147
G3 X135.207 Y132.279 I-.183 J-1.762 E.04662
G2 X134.224 Y131.298 I-4.225 J3.251 E.04619
G1 X133.897 Y131.188 E.01147
G2 X132.586 Y131.584 I-.183 J1.762 E.04662
G3 X131.604 Y132.564 I-4.225 J-3.251 E.04619
G1 X131.276 Y132.675 E.01147
G3 X129.966 Y132.279 I-.183 J-1.762 E.04662
G2 X128.983 Y131.298 I-4.225 J3.251 E.04619
G1 X128.655 Y131.188 E.01147
G2 X127.345 Y131.584 I-.183 J1.762 E.04662
G3 X126.362 Y132.564 I-4.225 J-3.251 E.04619
G1 X126.035 Y132.675 E.01147
G3 X124.724 Y132.279 I-.183 J-1.762 E.04662
G2 X123.742 Y131.298 I-4.225 J3.251 E.04619
G1 X123.414 Y131.188 E.01147
G2 X122.104 Y131.584 I-.183 J1.762 E.04662
G3 X121.121 Y132.564 I-4.225 J-3.251 E.04619
G1 X120.793 Y132.675 E.01147
G3 X119.483 Y132.279 I-.183 J-1.762 E.04662
G2 X118.5 Y131.298 I-4.225 J3.251 E.04619
G1 X118.173 Y131.188 E.01147
G2 X116.862 Y131.584 I-.183 J1.762 E.04662
G3 X115.88 Y132.564 I-4.225 J-3.251 E.04619
G1 X115.552 Y132.675 E.01147
G3 X114.242 Y132.279 I-.183 J-1.762 E.04662
G2 X113.259 Y131.298 I-4.225 J3.251 E.04619
G2 X112.893 Y131.191 I-.307 J.368 E.013
G3 X112.577 Y128.778 I24.813 J-4.48 E.08074
G1 X112.931 Y128.963 E.01325
G2 X113.914 Y129.944 I4.225 J-3.251 E.04619
G1 X114.242 Y130.054 E.01147
G2 X115.552 Y129.658 I.183 J-1.762 E.04662
G3 X116.535 Y128.677 I4.225 J3.251 E.04619
G1 X116.862 Y128.567 E.01147
G3 X118.173 Y128.963 I.183 J1.762 E.04662
G2 X119.155 Y129.944 I4.225 J-3.251 E.04619
G1 X119.483 Y130.054 E.01147
G2 X120.793 Y129.658 I.183 J-1.762 E.04662
G3 X121.776 Y128.677 I4.225 J3.251 E.04619
G1 X122.104 Y128.567 E.01147
G3 X123.414 Y128.963 I.183 J1.762 E.04662
G2 X124.397 Y129.944 I4.225 J-3.251 E.04619
G1 X124.724 Y130.054 E.01147
G2 X126.035 Y129.658 I.183 J-1.762 E.04662
G3 X127.017 Y128.677 I4.225 J3.251 E.04619
G1 X127.345 Y128.567 E.01147
G3 X128.655 Y128.963 I.183 J1.762 E.04662
G2 X129.638 Y129.944 I4.225 J-3.251 E.04619
G1 X129.966 Y130.054 E.01147
G2 X131.276 Y129.658 I.183 J-1.762 E.04662
G3 X132.259 Y128.677 I4.225 J3.251 E.04619
G1 X132.586 Y128.567 E.01147
G3 X133.897 Y128.963 I.183 J1.762 E.04662
G2 X134.879 Y129.944 I4.225 J-3.251 E.04619
G1 X135.207 Y130.054 E.01147
G2 X136.517 Y129.658 I.183 J-1.762 E.04662
G3 X137.5 Y128.677 I4.225 J3.251 E.04619
G1 X137.828 Y128.567 E.01147
G3 X139.138 Y128.963 I.183 J1.762 E.04662
G2 X140.121 Y129.944 I4.225 J-3.251 E.04619
G1 X140.448 Y130.054 E.01147
G2 X141.759 Y129.658 I.183 J-1.762 E.04662
G3 X142.741 Y128.677 I4.225 J3.251 E.04619
G3 X143.428 Y128.597 I.436 J.752 E.02357
G2 X143.334 Y126.204 I-23.219 J-.284 E.07946
G1 X143.069 Y126.342 E.0099
G3 X142.086 Y127.323 I-4.225 J-3.251 E.04619
G1 X141.759 Y127.433 E.01147
G3 X140.448 Y127.037 I-.183 J-1.762 E.04662
G2 X139.466 Y126.057 I-4.226 J3.252 E.04619
G1 X139.138 Y125.946 E.01147
G2 X137.828 Y126.342 I-.183 J1.762 E.04662
G3 X136.845 Y127.323 I-4.225 J-3.251 E.04619
G1 X136.517 Y127.433 E.01147
G3 X135.207 Y127.037 I-.183 J-1.762 E.04662
G2 X134.224 Y126.057 I-4.226 J3.252 E.04619
G1 X133.897 Y125.946 E.01147
G2 X132.586 Y126.342 I-.183 J1.762 E.04662
G3 X131.604 Y127.323 I-4.225 J-3.251 E.04619
G1 X131.276 Y127.433 E.01147
G3 X129.966 Y127.037 I-.183 J-1.762 E.04662
G2 X128.983 Y126.057 I-4.226 J3.252 E.04619
G1 X128.655 Y125.946 E.01147
G2 X127.345 Y126.342 I-.183 J1.762 E.04662
G3 X126.362 Y127.323 I-4.225 J-3.251 E.04619
G1 X126.035 Y127.433 E.01147
G3 X124.724 Y127.037 I-.183 J-1.762 E.04662
G2 X123.742 Y126.057 I-4.226 J3.252 E.04619
G1 X123.414 Y125.946 E.01147
G2 X122.104 Y126.342 I-.183 J1.762 E.04662
G3 X121.121 Y127.323 I-4.225 J-3.251 E.04619
G1 X120.793 Y127.433 E.01147
G3 X119.483 Y127.037 I-.183 J-1.762 E.04662
G2 X118.5 Y126.057 I-4.225 J3.251 E.04619
G1 X118.173 Y125.946 E.01147
G2 X116.862 Y126.342 I-.183 J1.762 E.04662
G3 X115.88 Y127.323 I-4.225 J-3.251 E.04619
G1 X115.552 Y127.433 E.01147
G3 X114.242 Y127.037 I-.183 J-1.762 E.04662
G2 X113.259 Y126.057 I-4.226 J3.252 E.04619
G2 X112.696 Y125.966 I-.386 J.604 E.01944
G3 X113.112 Y123.916 I26.12 J4.227 E.06938
G2 X114.242 Y124.813 I1.88 J-1.209 E.04872
G2 X115.552 Y124.417 I.183 J-1.762 E.04662
G3 X116.535 Y123.436 I4.225 J3.251 E.04619
G1 X116.862 Y123.326 E.01147
G3 X118.173 Y123.722 I.183 J1.762 E.04662
G2 X119.155 Y124.702 I4.225 J-3.251 E.04619
G1 X119.483 Y124.813 E.01147
G2 X120.793 Y124.417 I.183 J-1.762 E.04662
G3 X121.776 Y123.436 I4.225 J3.251 E.04619
G1 X122.104 Y123.326 E.01147
G3 X123.414 Y123.722 I.183 J1.762 E.04662
G2 X124.397 Y124.702 I4.225 J-3.251 E.04619
G1 X124.724 Y124.813 E.01147
G2 X126.035 Y124.417 I.183 J-1.762 E.04662
G3 X127.017 Y123.436 I4.225 J3.251 E.04619
G1 X127.345 Y123.326 E.01147
G3 X128.655 Y123.722 I.183 J1.762 E.04662
G2 X129.638 Y124.702 I4.225 J-3.251 E.04619
G1 X129.966 Y124.813 E.01147
G2 X131.276 Y124.417 I.183 J-1.762 E.04662
G3 X132.259 Y123.436 I4.225 J3.251 E.04619
G1 X132.586 Y123.326 E.01147
G3 X133.897 Y123.722 I.183 J1.762 E.04662
G2 X134.879 Y124.702 I4.225 J-3.251 E.04619
G1 X135.207 Y124.813 E.01147
G2 X136.517 Y124.417 I.183 J-1.762 E.04662
G3 X137.5 Y123.436 I4.225 J3.251 E.04619
G1 X137.828 Y123.326 E.01147
G3 X139.138 Y123.722 I.183 J1.762 E.04662
G2 X140.121 Y124.702 I4.225 J-3.251 E.04619
G1 X140.448 Y124.813 E.01147
G2 X141.759 Y124.417 I.183 J-1.762 E.04662
G3 X142.751 Y123.433 I4.443 J3.49 E.04649
G2 X142.217 Y121.973 I-20.109 J6.532 E.05158
G3 X141.759 Y122.192 I-.513 J-.484 E.01725
G3 X140.448 Y121.796 I-.183 J-1.762 E.04662
G2 X139.466 Y120.815 I-4.225 J3.251 E.04619
G1 X139.138 Y120.705 E.01147
G2 X137.828 Y121.101 I-.183 J1.762 E.04662
G3 X136.845 Y122.082 I-4.226 J-3.252 E.04619
G1 X136.517 Y122.192 E.01147
G3 X135.207 Y121.796 I-.183 J-1.762 E.04662
G2 X134.224 Y120.815 I-4.225 J3.251 E.04619
G1 X133.897 Y120.705 E.01147
G2 X132.586 Y121.101 I-.183 J1.762 E.04662
G3 X131.604 Y122.082 I-4.226 J-3.252 E.04619
G1 X131.276 Y122.192 E.01147
G3 X129.966 Y121.796 I-.183 J-1.762 E.04662
G2 X128.983 Y120.815 I-4.225 J3.251 E.04619
G1 X128.655 Y120.705 E.01147
G2 X127.345 Y121.101 I-.183 J1.762 E.04662
G3 X126.362 Y122.082 I-4.226 J-3.252 E.04619
G1 X126.035 Y122.192 E.01147
G3 X124.724 Y121.796 I-.183 J-1.762 E.04662
G2 X123.742 Y120.815 I-4.225 J3.251 E.04619
G1 X123.414 Y120.705 E.01147
G2 X122.104 Y121.101 I-.183 J1.762 E.04662
G3 X121.121 Y122.082 I-4.226 J-3.252 E.04619
G1 X120.793 Y122.192 E.01147
G3 X119.483 Y121.796 I-.183 J-1.762 E.04662
G2 X118.5 Y120.815 I-4.225 J3.251 E.04619
G1 X118.173 Y120.705 E.01147
G2 X116.862 Y121.101 I-.183 J1.762 E.04662
G3 X115.88 Y122.082 I-4.226 J-3.252 E.04619
G1 X115.552 Y122.192 E.01147
G3 X113.987 Y121.521 I-.047 J-2.05 E.05826
G3 X115.205 Y119.356 I20.765 J10.261 E.08242
G1 X115.552 Y119.176 E.01298
G3 X116.535 Y118.195 I4.225 J3.251 E.04619
G1 X116.862 Y118.084 E.01147
G3 X118.173 Y118.48 I.183 J1.762 E.04662
G2 X119.155 Y119.461 I4.225 J-3.251 E.04619
G1 X119.483 Y119.572 E.01147
G2 X120.793 Y119.176 I.183 J-1.762 E.04662
G3 X121.776 Y118.195 I4.225 J3.251 E.04619
G1 X122.104 Y118.084 E.01147
G3 X123.414 Y118.48 I.183 J1.762 E.04662
G2 X124.397 Y119.461 I4.225 J-3.251 E.04619
G1 X124.724 Y119.572 E.01147
G2 X126.035 Y119.176 I.183 J-1.762 E.04662
G3 X127.017 Y118.195 I4.225 J3.251 E.04619
G1 X127.345 Y118.084 E.01147
G3 X128.655 Y118.48 I.183 J1.762 E.04662
G2 X129.638 Y119.461 I4.225 J-3.251 E.04619
G1 X129.966 Y119.572 E.01147
G2 X131.276 Y119.176 I.183 J-1.762 E.04662
G3 X132.259 Y118.195 I4.225 J3.251 E.04619
G1 X132.586 Y118.084 E.01147
G3 X133.897 Y118.48 I.183 J1.762 E.04662
G2 X134.879 Y119.461 I4.225 J-3.251 E.04619
G1 X135.207 Y119.572 E.01147
G2 X136.517 Y119.176 I.183 J-1.762 E.04662
G3 X137.5 Y118.195 I4.225 J3.251 E.04619
G1 X137.828 Y118.084 E.01147
G3 X139.138 Y118.48 I.183 J1.762 E.04662
G2 X140.121 Y119.461 I4.225 J-3.251 E.04619
G2 X140.909 Y119.533 I.477 J-.874 E.02701
G2 X139.947 Y118.221 I-13.379 J8.802 E.054
M204 S10000
G1 X144.202 Y128.005 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413199
G1 F12000
M204 S6000
G2 X144.181 Y128.82 I-16.199 J-.008 E3.04645
G1 X144.2 Y128.065 E.02279
M204 S10000
G1 X122.964 Y143.009 F42000
; LINE_WIDTH: 0.41318
G1 F12000
M204 S6000
G3 X123.719 Y143.241 I5.036 J-15.006 E2.97688
G1 X123.022 Y143.027 E.02201
M204 S10000
G1 X120.006 Y114.793 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X118.661 Y115.708 I8.023 J13.249 E.054
G3 X119.483 Y116.555 I-2.814 J3.554 E.03928
G2 X120.793 Y116.951 I1.128 J-1.366 E.04662
G1 X121.121 Y116.84 E.01147
G2 X122.104 Y115.86 I-3.243 J-4.232 E.04619
G3 X123.414 Y115.464 I1.128 J1.366 E.04662
G1 X123.742 Y115.574 E.01147
G3 X124.724 Y116.555 I-3.243 J4.232 E.04619
G2 X126.035 Y116.951 I1.128 J-1.366 E.04662
G1 X126.362 Y116.84 E.01147
G2 X127.345 Y115.86 I-3.243 J-4.232 E.04619
G3 X128.655 Y115.464 I1.128 J1.366 E.04662
G1 X128.983 Y115.574 E.01147
G3 X129.966 Y116.555 I-3.243 J4.232 E.04619
G2 X131.276 Y116.951 I1.128 J-1.366 E.04662
G1 X131.604 Y116.84 E.01147
G2 X132.586 Y115.86 I-3.243 J-4.232 E.04619
G3 X133.897 Y115.464 I1.128 J1.366 E.04662
G1 X134.224 Y115.574 E.01147
G3 X135.207 Y116.555 I-3.243 J4.232 E.04619
G2 X136.517 Y116.951 I1.128 J-1.366 E.04662
G1 X136.845 Y116.84 E.01147
G2 X137.706 Y115.991 I-2.802 J-3.702 E.04022
G2 X132.074 Y113.107 I-9.758 J12.112 E.21136
G2 X131.276 Y113.934 I2.752 J3.454 E.03824
G3 X129.966 Y114.33 I-1.128 J-1.366 E.04662
G1 X129.638 Y114.22 E.01147
G3 X128.655 Y113.239 I3.242 J-4.232 E.04619
G2 X127.345 Y112.843 I-1.128 J1.366 E.04662
G1 X127.017 Y112.954 E.01147
G2 X126.035 Y113.934 I3.243 J4.233 E.04619
G3 X124.724 Y114.33 I-1.128 J-1.366 E.04662
G1 X124.397 Y114.22 E.01147
G3 X123.428 Y113.255 I3.19 J-4.169 E.04548
G2 X121.902 Y113.817 I4.623 J14.894 E.054
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X123.428 Y113.255 E-.61836
G1 X123.692 Y113.518 E-.14164
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/32
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S193.8
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4 I-1.106 J-.507 P1  F42000
G1 X113.425 Y135.937 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X119.705 Y113.632 I14.567 J-7.935 E.85098
G3 X128.863 Y111.437 I8.279 J14.338 E.31678
G3 X113.453 Y135.99 I-.872 J16.565 E2.2876
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X119.501 Y113.28 I14.924 J-8.13 E.87186
G3 X128.884 Y111.03 I8.482 J14.691 E.32453
G3 X113.096 Y136.185 I-.893 J16.972 E2.34382
M204 S250
G1 X112.723 Y136.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X118.565 Y113.392 I15.269 J-8.317 E.79957
G3 X128.903 Y110.639 I9.44 J14.663 E.33411
G3 X112.752 Y136.372 I-.911 J17.363 E2.22129
; WIPE_START
M204 S6000
M73 P63 R7
G1 X112.332 Y135.545 E-.35233
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.07821
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


G1 X112.834 Y132.883 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X112.562 Y132.993 E.00971
G1 X112.531 Y132.942 E.00197
G2 X112.967 Y134.141 I12.235 J-3.77 E.04233
G2 X114.242 Y135.146 I5.346 J-5.468 E.05395
G1 X114.897 Y135.212 E.02184
G1 X115.146 Y135.129 E.00872
G1 X116.431 Y137.108 E.07828
G3 X115.552 Y137.767 I-3.524 J-3.79 E.03651
G1 X115.06 Y137.816 E.0164
G2 X116.494 Y139.458 I13.878 J-10.674 E.07236
G2 X116.799 Y139.243 I-1.321 J-2.195 E.0124
G1 X117.518 Y139.133 E.02411
G1 X117.809 Y139.23 E.01019
G2 X118.855 Y140.455 I2.546 J-1.114 E.05422
M204 S10000
G1 X121.388 Y138.702 F42000
G1 F15476.087
M204 S6000
G1 X121.219 Y138.845 E.00733
G1 X120.254 Y137.821 E.04669
G1 X120.793 Y137.767 E.01798
G1 X121.449 Y137.305 E.02659
G3 X123.414 Y136.578 I1.557 J1.189 E.07335
G1 X124.069 Y137.04 E.02659
G2 X126.035 Y137.767 I1.557 J-1.189 E.07335
G1 X126.69 Y137.305 E.02659
G3 X128.655 Y136.578 I1.557 J1.189 E.07335
G1 X129.311 Y137.04 E.02659
G2 X131.276 Y137.767 I1.557 J-1.189 E.07335
G2 X132.222 Y137.05 I-2.885 J-4.789 E.03944
G1 X131.875 Y136.516 E.0211
G3 X133.804 Y135.905 I1.871 J2.554 E.06832
G1 X135.028 Y136.933 E.05301
G1 X135.788 Y137.333 E.02849
G2 X136.909 Y136.947 I.267 J-1.046 E.04167
G3 X137.842 Y136.139 I2.511 J1.956 E.04119
G1 X137.121 Y134.464 E.06047
G3 X135.207 Y135.146 I-1.504 J-1.194 E.07102
G1 X134.552 Y134.684 E.02659
G2 X132.586 Y133.957 I-1.557 J1.189 E.07335
G1 X131.931 Y134.419 E.02659
G3 X129.966 Y135.146 I-1.557 J-1.189 E.07335
G1 X129.311 Y134.684 E.02659
G2 X127.345 Y133.957 I-1.557 J1.189 E.07335
G1 X126.69 Y134.419 E.02659
G3 X124.724 Y135.146 I-1.557 J-1.189 E.07335
G1 X124.069 Y134.684 E.02659
G2 X122.104 Y133.957 I-1.557 J1.189 E.07335
G1 X121.449 Y134.419 E.02659
G3 X119.483 Y135.146 I-1.557 J-1.189 E.07335
G1 X118.828 Y134.684 E.02659
G2 X116.862 Y133.957 I-1.557 J1.189 E.07335
G1 X116.417 Y134.272 E.01809
G1 X115.712 Y133.186 E.04295
G1 X116.662 Y132.996 E.03213
G1 X116.104 Y132.137 E.03398
G1 X116.207 Y132.064 E.0042
G3 X118.173 Y131.337 I1.557 J1.189 E.07335
G1 X118.828 Y131.799 E.02659
G2 X120.793 Y132.525 I1.557 J-1.189 E.07335
G1 X121.449 Y132.064 E.02659
G3 X123.414 Y131.337 I1.557 J1.189 E.07335
G1 X124.069 Y131.799 E.02659
G2 X126.035 Y132.525 I1.557 J-1.189 E.07335
G1 X126.69 Y132.064 E.02659
G3 X128.655 Y131.337 I1.557 J1.189 E.07335
G1 X129.311 Y131.799 E.02659
G2 X131.276 Y132.525 I1.557 J-1.189 E.07335
G1 X131.931 Y132.064 E.02659
G3 X133.897 Y131.337 I1.557 J1.189 E.07335
G1 X134.552 Y131.799 E.02659
G2 X136.517 Y132.525 I1.557 J-1.189 E.07335
G2 X137.546 Y131.736 I-3.184 J-5.213 E.04309
G1 X137.316 Y131.199 E.01938
G3 X138.348 Y130.695 I2.199 J3.198 E.03824
G1 X139.311 Y130.615 E.03203
G1 X138.707 Y129.686 E.03676
G1 X139.335 Y129.041 E.02984
G2 X137.828 Y128.716 I-1.091 J1.4 E.05293
G1 X137.172 Y129.178 E.02659
G3 X135.207 Y129.905 I-1.557 J-1.189 E.07335
G1 X134.552 Y129.443 E.02659
G2 X132.586 Y128.716 I-1.557 J1.189 E.07335
G1 X131.931 Y129.178 E.02659
G3 X129.966 Y129.905 I-1.557 J-1.189 E.07335
G1 X129.311 Y129.443 E.02659
G2 X127.345 Y128.716 I-1.557 J1.189 E.07335
G1 X126.69 Y129.178 E.02659
G3 X124.724 Y129.905 I-1.557 J-1.189 E.07335
G1 X124.069 Y129.443 E.02659
G2 X122.104 Y128.716 I-1.557 J1.189 E.07335
G1 X121.449 Y129.178 E.02659
G3 X119.483 Y129.905 I-1.557 J-1.189 E.07335
G1 X118.828 Y129.443 E.02659
G2 X116.862 Y128.716 I-1.557 J1.189 E.07335
G2 X116.173 Y129.208 I1.959 J3.476 E.02815
G1 X115.706 Y127.928 E.04518
G1 X116.715 Y127.875 E.03352
G1 X116.247 Y126.788 E.03925
G3 X118.173 Y126.096 I1.516 J1.193 E.07157
G1 X118.828 Y126.557 E.02659
G2 X120.793 Y127.284 I1.557 J-1.189 E.07335
G1 X121.449 Y126.822 E.02659
G3 X123.414 Y126.096 I1.557 J1.189 E.07335
G1 X124.069 Y126.557 E.02659
G2 X126.035 Y127.284 I1.557 J-1.189 E.07335
G1 X126.69 Y126.822 E.02659
G3 X128.655 Y126.096 I1.557 J1.189 E.07335
G1 X129.311 Y126.557 E.02659
G2 X131.276 Y127.284 I1.557 J-1.189 E.07335
G1 X131.931 Y126.822 E.02659
G3 X133.897 Y126.096 I1.557 J1.189 E.07335
G1 X134.552 Y126.557 E.02659
G2 X136.517 Y127.284 I1.557 J-1.189 E.07335
G1 X137.172 Y126.822 E.02659
G3 X139.138 Y126.096 I1.557 J1.189 E.07335
G1 X139.267 Y126.186 E.00524
G1 X139.857 Y125.672 E.02597
G1 X138.907 Y124.209 E.05785
G1 X139.826 Y124.225 E.03049
G1 X139.793 Y124.202 E.00133
G2 X137.828 Y123.475 I-1.557 J1.189 E.07335
G1 X137.172 Y123.937 E.02659
G3 X135.207 Y124.664 I-1.557 J-1.189 E.07335
G1 X134.552 Y124.202 E.02659
G2 X132.586 Y123.475 I-1.557 J1.189 E.07335
G1 X131.931 Y123.937 E.02659
G3 X129.966 Y124.664 I-1.557 J-1.189 E.07335
G1 X129.311 Y124.202 E.02659
G2 X127.345 Y123.475 I-1.557 J1.189 E.07335
G1 X126.69 Y123.937 E.02659
G3 X124.724 Y124.664 I-1.557 J-1.189 E.07335
G1 X124.069 Y124.202 E.02659
G2 X122.104 Y123.475 I-1.557 J1.189 E.07335
G1 X121.449 Y123.937 E.02659
G3 X119.483 Y124.664 I-1.557 J-1.189 E.07335
G1 X118.828 Y124.202 E.02659
G2 X116.862 Y123.475 I-1.557 J1.189 E.07335
G1 X116.772 Y123.539 E.00368
G1 X116.432 Y122.396 E.03956
G2 X116.748 Y122.096 I-1.637 J-2.039 E.01447
M204 S10000
G1 X113.442 Y120.84 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G3 X116.04 Y117.037 I14.251 J6.947 E.12806
M204 S10000
G1 X118.356 Y114.956 F42000
G1 F15000
M204 S6000
G3 X119.461 Y114.209 I10.101 J13.756 E.03694
M204 S10000
G1 X121.486 Y113.141 F42000
G1 F15000
M204 S6000
G3 X122.768 Y112.643 I5.34 J11.854 E.03811
M204 S10000
G1 X125.924 Y111.908 F42000
G1 F15000
M204 S6000
G3 X127.741 Y111.782 I2.195 J18.511 E.05049
M204 S10000
G1 X130.844 Y112.025 F42000
G1 F15000
M204 S6000
G3 X132.581 Y112.436 I-3.278 J17.711 E.04947
G2 X133.658 Y112.878 I2.571 J-4.727 E.03231
G1 X133.93 Y112.899 E.00758
G3 X138.793 Y115.884 I-5.824 J14.941 E.15891
M204 S10000
G1 X130.233 Y111.763 F42000
G1 F15000
M204 S6000
G1 X130.169 Y111.799 E.00204
G1 X130.218 Y111.828 E.00155
M204 S10000
G1 X136.705 Y114.739 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X138.017 Y115.702 I-9.794 J14.734 E.05401
G2 X137.724 Y115.855 I.036 J.424 E.01127
G1 X139.671 Y118.854 E.1186
G1 X139.793 Y118.961 E.00536
G2 X141.703 Y119.289 I1.173 J-1.108 E.06896
G3 X142.774 Y121.265 I-23.048 J13.777 E.07458
G3 X141.758 Y122.043 I-4.154 J-4.37 E.04254
G1 X142.796 Y123.667 E.06393
G3 X143.199 Y123.462 I.383 J.254 E.01566
G3 X143.583 Y125.043 I-16.58 J4.867 E.05401
M204 S10000
G1 X143.683 Y123.844 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G3 X144.201 Y128.9 I-15.888 J4.183 E.14139
G1 X144.097 Y129.085 E.00587
G1 X144.14 Y129.619 E.01484
G3 X143.041 Y134.08 I-15.604 J-1.478 E.12777
M204 S10000
G1 X140.818 Y137.944 F42000
G1 F15000
M204 S6000
G2 X142.213 Y135.828 I-13.371 J-10.333 E.07029
M204 S10000
G1 X134.254 Y142.969 F42000
G1 F15000
M204 S6000
G1 X135.4 Y142.442 E.03494
G2 X138.961 Y139.957 I-7.282 J-14.225 E.12068
M204 S10000
G1 X130.63 Y144.006 F42000
G1 F15000
M204 S6000
G2 X133.159 Y143.386 I-2.745 J-16.64 E.07222
M204 S10000
G1 X125.193 Y143.978 F42000
G1 F15000
M204 S6000
G2 X127.249 Y144.205 I2.813 J-16.022 E.05737
M204 S10000
G1 X117.499 Y140.366 F42000
G1 F15000
M204 S6000
G2 X123.618 Y143.625 I10.472 J-12.289 E.19359
M204 S10000
G1 X117.38 Y136.113 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40351
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X120.371 Y140.719 E.28614
G1 X121.775 Y142.108 E.10288
G1 X121.819 Y142.117 E.00232
G1 X118.105 Y136.396 E.35536
G1 X119.361 Y137.499 E.0871
G1 X122.37 Y142.133 E.28789
G1 X122.764 Y141.907 E.02366
G1 X121.1 Y139.343 E.15926
G1 X121.187 Y139.436 E.00663
G1 X121.518 Y139.154 E.02263
G1 X124.474 Y143.707 E.28284
G1 X124.721 Y143.77 E.01329
G1 X124.521 Y143.122 E.03532
G1 X124.642 Y143.133 E.00631
G1 X121.941 Y138.973 E.2584
G1 X122.028 Y138.953 E.00464
G1 X122.509 Y139.015 E.02529
G1 X125.213 Y143.18 E.25874
G1 X125.785 Y143.228 E.02989
G1 X123.583 Y139.837 E.21069
G1 X124.493 Y140.405 E.05591
G1 X126.313 Y143.209 E.17415
G1 X126.684 Y143.09 E.02027
G1 X126.924 Y143.317 E.01723
G1 X125.02 Y140.384 E.18218
G1 X125.147 Y140.373 E.00662
G1 X125.462 Y140.233 E.01801
G1 X127.968 Y144.092 E.23972
G2 X128.505 Y144.086 I.214 J-5.631 E.02801
G1 X125.859 Y140.012 E.25314
G2 X126.207 Y139.714 I-.372 J-.787 E.02412
G1 X129.029 Y144.06 E.26998
G1 X129.195 Y144.052 E.00864
G2 X129.542 Y144.018 I-.434 J-6.166 E.01819
G1 X126.527 Y139.375 E.28843
G3 X126.876 Y139.08 I.948 J.767 E.02396
G1 X130.05 Y143.967 E.30361
G1 X130.217 Y143.95 E.00872
G1 X129.985 Y143.033 E.04927
G1 X127.344 Y138.968 E.25258
G1 X127.925 Y139.103 E.03105
G1 X128.035 Y139.199 E.00763
G1 X130.499 Y142.992 E.23565
G1 X131.028 Y143.223 E.03009
G1 X131.183 Y143.214 E.0081
G1 X129.209 Y140.173 E.18894
G1 X129.904 Y140.41 E.03827
G1 X131.67 Y143.131 E.16901
G1 X131.831 Y143.079 E.00881
G1 X132.047 Y142.878 E.01535
G1 X130.41 Y140.357 E.15658
G1 X130.506 Y140.346 E.00504
G1 X130.833 Y140.176 E.0192
G1 X132.369 Y142.541 E.14693
G1 X132.579 Y142.313 E.01617
G1 X132.99 Y142.666 E.02822
G1 X131.21 Y139.924 E.17034
G2 X131.546 Y139.609 I-.674 J-1.056 E.02414
G1 X133.765 Y143.026 E.21227
G1 X133.861 Y142.991 E.00532
G1 X133.53 Y141.832 E.0628
G1 X131.871 Y139.277 E.15873
M73 P64 R7
G1 X131.983 Y139.167 E.00814
G1 X132.242 Y139.015 E.01567
G1 X134.063 Y141.82 E.17423
G1 X134.668 Y141.919 E.03193
G1 X132.755 Y138.972 E.18306
G1 X133.287 Y138.959 E.02775
G1 X135.174 Y141.865 E.1805
G2 X135.576 Y141.651 I-3.184 J-6.475 E.02372
G1 X133.82 Y138.946 E.16801
G1 X133.962 Y138.943 E.00743
G1 X132.492 Y136.679 E.14067
G1 X132.788 Y136.525 E.01738
G1 X135.97 Y141.425 E.30441
G2 X136.358 Y141.19 I-6.793 J-11.673 E.02364
G1 X133.225 Y136.365 E.29974
G1 X133.655 Y136.34 E.02248
G1 X133.862 Y136.513 E.01404
G1 X136.39 Y140.407 E.24189
G1 X136.398 Y140.222 E.00967
G1 X136.944 Y140.427 E.03038
G1 X134.97 Y137.387 E.18884
G1 X135.665 Y137.753 E.04095
G1 X135.753 Y137.761 E.00461
G1 X137.473 Y140.409 E.16455
G2 X137.83 Y140.127 I-5.109 J-6.815 E.02374
G1 X136.325 Y137.808 E.14401
G1 X136.749 Y137.628 E.02399
G1 X138.181 Y139.834 E.13707
G1 X138.376 Y139.302 E.02953
G1 X137.106 Y137.346 E.12151
G2 X137.431 Y137.014 I-1.694 J-1.979 E.02425
G1 X139.025 Y139.468 E.15245
G1 X139.186 Y139.578 E.01016
G1 X139.457 Y139.3 E.02022
G1 X137.763 Y136.692 E.16204
G1 X137.834 Y136.626 E.00502
G1 X138.153 Y136.46 E.01877
G1 X139.781 Y138.967 E.15576
G1 X139.795 Y138.954 E.001
G2 X140.093 Y138.615 I-6.58 J-6.118 E.02352
G1 X137.961 Y135.331 E.20402
G1 X137.288 Y133.769 E.0886
G1 X137.479 Y133.757 E.00997
G1 X140.402 Y138.258 E.27961
G1 X140.468 Y138.174 E.00554
G1 X140.349 Y137.524 E.03447
G1 X140.41 Y137.438 E.0055
G1 X137.997 Y133.722 E.23085
G1 X138.515 Y133.687 E.02706
G1 X140.694 Y137.042 E.20843
G2 X140.969 Y136.633 I-9.443 J-6.635 E.0257
G1 X138.442 Y132.742 E.24172
G1 X137.861 Y131.382 E.07708
G1 X138.035 Y131.282 E.01048
G1 X141.183 Y136.13 E.30115
G1 X141.18 Y135.292 E.04366
G1 X138.468 Y131.116 E.25943
G1 X138.981 Y131.073 E.02682
G1 X141.415 Y134.822 E.23292
G1 X142.307 Y135.365 E.05441
G1 X139.494 Y131.03 E.26928
G1 X140.006 Y130.987 E.02682
G1 X142.543 Y134.894 E.24269
G1 X142.736 Y134.468 E.02435
G1 X142.629 Y134.193 E.01537
G1 X139.613 Y129.549 E.28849
G1 X140.291 Y129.965 E.04142
G1 X140.371 Y129.883 E.00599
G1 X142.198 Y132.696 E.17477
G2 X142.542 Y132.393 I-1.266 J-1.786 E.02393
G1 X140.696 Y129.55 E.17664
G1 X141.02 Y129.217 E.02422
G1 X142.854 Y132.041 E.17541
G1 X143.053 Y131.704 E.02039
G1 X143.083 Y131.56 E.00763
G1 X139.711 Y126.368 E.32257
G1 X140.056 Y126.067 E.02387
G1 X143.208 Y130.92 E.30152
G1 X143.275 Y130.517 E.0213
G1 X143.096 Y129.916 E.03266
G1 X140.401 Y125.765 E.25785
G1 X140.419 Y125.75 E.00122
G1 X139.705 Y124.652 E.06824
G1 X140.224 Y124.661 E.02704
G1 X142.895 Y128.773 E.25546
G1 X143.358 Y128.72 E.0243
G1 X143.367 Y128.667 E.00283
G1 X140.771 Y124.67 E.24829
G1 X141.318 Y124.679 E.0285
G1 X143.244 Y127.645 E.18423
G1 X142.953 Y126.654 E.05383
G1 X143.086 Y126.57 E.0082
G1 X135.164 Y114.369 E.75795
G1 X135.627 Y114.631 E.02773
G1 X136.313 Y115.305 E.0501
G1 X143.476 Y126.327 E.68486
G1 X142.072 Y124.165 E.13429
G1 X142.448 Y123.921 E.02333
G1 X137.261 Y115.933 E.49625
M106 S193.8
M204 S10000
G1 X137.451 Y118.724 F42000
M106 S255
G1 F3000
M204 S6000
G1 X134.242 Y113.783 E.30698
G1 X134.153 Y113.841 E.00553
G1 X133.584 Y113.602 E.03215
G1 X137.013 Y118.882 E.32798
G2 X136.694 Y119.224 I5.496 J5.428 E.02437
G1 X132.864 Y113.325 E.36647
G2 X132.177 Y113.1 I-2.631 J6.862 E.03768
G1 X136.316 Y119.474 E.39602
G1 X135.931 Y119.665 E.0224
G1 X133.303 Y115.617 E.25142
G1 X133.281 Y115.633 E.00139
G1 X131.706 Y113.208 E.15065
G1 X131.559 Y113.275 E.00842
G1 X130.577 Y112.301 E.07205
G1 X132.909 Y115.893 E.22309
G1 X132.537 Y116.153 E.02364
G1 X129.849 Y112.014 E.25715
G1 X129.272 Y111.957 E.03023
G1 X132.219 Y116.496 E.282
G3 X131.905 Y116.812 I-4.331 J-3.996 E.02319
G1 X131.89 Y116.822 E.00097
G1 X128.709 Y111.924 E.30426
G1 X128.238 Y111.9 E.02462
G1 X128.302 Y112.13 E.01243
G1 X131.474 Y117.014 E.30341
G1 X131.177 Y117.031 E.01547
G1 X130.883 Y116.936 E.01614
G1 X128.174 Y112.765 E.25911
G1 X127.635 Y112.767 E.02809
G1 X129.863 Y116.198 E.21312
G1 X129.299 Y115.697 E.0393
G1 X128.964 Y115.647 E.01765
G1 X127.096 Y112.77 E.17875
G1 X127.075 Y112.77 E.00111
G1 X126.694 Y112.983 E.02275
G1 X128.41 Y115.627 E.16421
G1 X128.05 Y115.688 E.01901
G1 X127.945 Y115.743 E.00621
G1 X125.599 Y112.13 E.22443
G1 X125.56 Y112.094 E.00274
G2 X125.197 Y112.15 I.87 J6.95 E.01914
G1 X125.086 Y112.172 E.00593
G1 X127.548 Y115.964 E.23558
G1 X127.198 Y116.258 E.02381
G1 X124.608 Y112.269 E.24784
G2 X124.138 Y112.378 I.9 J4.917 E.02513
G1 X126.879 Y116.6 E.26228
G1 X126.594 Y116.87 E.02048
G1 X126.534 Y116.901 E.0035
G1 X123.674 Y112.497 E.27361
G2 X123.223 Y112.634 I1.334 J5.194 E.0246
G1 X126.077 Y117.03 E.27312
G1 X125.824 Y117.023 E.01322
G1 X125.424 Y116.857 E.02254
G1 X123.052 Y113.204 E.22694
G2 X122.611 Y113.357 I4.359 J13.26 E.02434
G1 X124.815 Y116.753 E.21091
G1 X124.512 Y117.118 E.02474
G1 X122.175 Y113.519 E.22357
G1 X121.75 Y113.698 E.024
G1 X125.569 Y119.578 E.36531
G3 X125.068 Y119.639 I-.35 J-.78 E.02669
G1 X121.067 Y113.478 E.38275
G2 X120.655 Y113.677 I4.072 J8.97 E.02382
G1 X122.177 Y116.02 E.14557
G1 X121.859 Y116.364 E.02438
G1 X120.256 Y113.894 E.1534
G1 X119.891 Y114.093 E.02166
G1 X119.899 Y114.178 E.00442
G1 X121.538 Y116.702 E.15681
G1 X121.285 Y116.926 E.01762
G1 X121.171 Y116.969 E.00636
G1 X119.734 Y114.756 E.13749
G2 X119.352 Y115 I2.93 J4.999 E.02364
G1 X120.735 Y117.13 E.13234
G1 X120.689 Y117.147 E.00254
G1 X121.187 Y118.659 E.0829
G1 X118.979 Y115.258 E.21125
G1 X118.61 Y115.523 E.02366
G1 X120.99 Y119.188 E.22766
G1 X120.734 Y119.402 E.01739
G1 X120.625 Y119.459 E.0064
G1 X117.987 Y115.397 E.2523
G2 X117.637 Y115.69 I3.216 J4.214 E.0238
G1 X120.188 Y119.618 E.24405
G1 X119.702 Y119.704 E.02567
G1 X117.289 Y115.987 E.2309
G1 X116.951 Y116.3 E.02398
G1 X119.217 Y119.789 E.21677
G1 X118.881 Y119.849 E.01779
G1 X119.903 Y121.423 E.09778
G1 X119.797 Y121.514 E.00732
G1 X116.62 Y116.622 E.30395
G1 X116.43 Y116.816 E.01415
G1 X116.609 Y117.438 E.03371
G1 X119.037 Y121.178 E.23232
G1 X118.729 Y120.906 E.0214
G1 X118.293 Y120.864 E.02284
G1 X116.478 Y118.07 E.17357
G2 X116.115 Y118.343 I.403 J.917 E.02389
G1 X117.775 Y120.9 E.15888
G2 X117.333 Y121.051 I.056 J.885 E.02466
G1 X115.791 Y118.677 E.14748
G3 X115.452 Y118.987 I-.901 J-.648 E.02412
G1 X116.949 Y121.293 E.1433
G2 X116.614 Y121.609 I1.526 J1.957 E.02405
G1 X115.11 Y119.294 E.14385
G2 X114.827 Y119.691 I1.294 J1.221 E.02548
G1 X116.291 Y121.944 E.13999
G1 X115.951 Y122.255 E.02395
G1 X114.569 Y120.125 E.13229
G2 X114.322 Y120.578 I5.571 J3.331 E.02687
G1 X116.397 Y123.783 E.19897
G2 X116.068 Y124.099 I1.694 J2.098 E.02381
G1 X114.252 Y121.304 E.17367
G1 X114.248 Y121.9 E.03109
G1 X113.967 Y121.697 E.01809
G1 X115.743 Y124.432 E.16996
G3 X115.378 Y124.703 I-.703 J-.567 E.02393
G1 X113.287 Y121.482 E.20006
G2 X113.165 Y121.754 I5.263 J2.53 E.01553
G1 X113.074 Y121.987 E.013
G1 X114.974 Y124.913 E.18182
G1 X116.035 Y127.38 E.13989
G1 X112.87 Y122.506 E.30275
G1 X112.781 Y122.773 E.01469
G1 X113.014 Y123.56 E.04276
G1 X115.576 Y127.506 E.24513
G1 X115.104 Y127.531 E.02462
G1 X115.172 Y127.716 E.01027
G1 X112.949 Y124.292 E.21272
G1 X112.93 Y124.373 E.00431
G1 X113.019 Y124.728 E.01909
G1 X112.783 Y124.87 E.01433
G1 X115.843 Y129.583 E.29276
G1 X115.653 Y129.789 E.0146
G1 X115.494 Y129.877 E.0095
G1 X112.395 Y125.105 E.29645
G1 X112.144 Y125.257 E.01528
G1 X112.103 Y125.488 E.01225
G1 X115.076 Y130.067 E.28442
G1 X114.64 Y130.229 E.02421
G1 X112.011 Y126.179 E.25157
G1 X111.971 Y126.56 E.01997
G1 X113.426 Y128.801 E.13922
G1 X113.248 Y128.917 E.01108
G1 X115.733 Y132.744 E.23775
G1 X115.254 Y132.84 E.02543
G1 X112.868 Y129.164 E.22835
G1 X112.664 Y129.296 E.01266
G1 X112.714 Y129.76 E.02429
G1 X119.768 Y140.623 E.67483
G1 X119.721 Y140.624 E.00244
G1 X118.631 Y139.705 E.07432
G1 X112.577 Y130.382 E.57913
M106 S193.8
M204 S10000
G1 X112.302 Y130.283 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
M73 P65 R7
G1 F15476.087
M204 S6000
G3 X112.152 Y128.663 I18.24 J-2.511 E.05401
G3 X112.67 Y128.781 I.127 J.637 E.01818
G1 X112.209 Y129.08 E.01823
G1 X112.325 Y130.153 E.03579
M204 S10000
G1 X111.807 Y127.014 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G2 X112.196 Y131.662 I15.74 J1.022 E.1297
M204 S10000
G1 X112.503 Y123.192 F42000
G1 F15000
M204 S6000
G2 X112.094 Y124.785 I21.948 J6.479 E.04559
M204 S10000
G1 X136.395 Y119.913 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X135.778 Y120.217 E.0228
G1 X135.266 Y119.428 E.03121
G1 X134.552 Y118.961 E.02832
G2 X132.586 Y118.234 I-1.557 J1.189 E.07335
G1 X131.931 Y118.695 E.02659
G3 X129.966 Y119.422 I-1.557 J-1.189 E.07335
G1 X129.311 Y118.961 E.02659
G2 X127.345 Y118.234 I-1.557 J1.189 E.07335
G2 X126.035 Y119.27 I4.2 J6.656 E.05553
G1 X126.344 Y119.813 E.02072
G3 X124.399 Y120.044 I-1.348 J-3.033 E.06596
G1 X123.296 Y118.346 E.06716
G2 X122.104 Y118.234 I-.722 J1.273 E.04093
G1 X121.612 Y118.58 E.01996
G1 X121.753 Y119.009 E.01498
G3 X120.525 Y119.994 I-2.656 J-2.053 E.05273
G1 X119.593 Y120.158 E.03137
G1 X120.466 Y121.503 E.05317
G1 X119.868 Y122.019 E.0262
G1 X120.138 Y122.109 E.00945
G1 X120.793 Y122.043 E.02184
G1 X121.449 Y121.581 E.02659
G3 X123.414 Y120.854 I1.557 J1.189 E.07335
G1 X124.069 Y121.316 E.02659
G2 X126.035 Y122.043 I1.557 J-1.189 E.07335
G1 X126.69 Y121.581 E.02659
G3 X128.655 Y120.854 I1.557 J1.189 E.07335
G1 X129.311 Y121.316 E.02659
G2 X131.276 Y122.043 I1.557 J-1.189 E.07335
G1 X131.931 Y121.581 E.02659
G3 X133.897 Y120.854 I1.557 J1.189 E.07335
G1 X134.552 Y121.316 E.02659
G2 X136.517 Y122.043 I1.557 J-1.189 E.07335
G2 X137.828 Y121.006 I-4.201 J-6.657 E.05553
G1 X138.329 Y120.84 E.01752
G1 X138.084 Y120.463 E.01491
G1 X138.461 Y120.218 E.01493
G1 X138.064 Y119.606 E.02418
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X138.461 Y120.218 E-.277
G1 X138.084 Y120.463 E-.171
G1 X138.329 Y120.84 E-.17076
G1 X137.976 Y120.957 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/32
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I-.634 J-1.039 P1  F42000
G1 X113.424 Y135.937 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X119.705 Y113.632 I14.567 J-7.935 E.85098
G3 X128.79 Y111.433 I8.279 J14.337 E.31436
G3 X113.453 Y135.99 I-.799 J16.569 E2.29002
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X118.778 Y113.721 I14.924 J-8.13 E.84372
G3 X128.81 Y111.027 I9.227 J14.332 E.35016
G3 X113.096 Y136.184 I-.819 J16.975 E2.34628
M204 S250
G1 X112.723 Y136.32 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X118.565 Y113.392 I15.269 J-8.317 E.79958
G3 X128.83 Y110.635 I9.44 J14.663 E.33186
G3 X112.752 Y136.372 I-.839 J17.367 E2.22353
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35233
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.0782
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


G1 X113.585 Y135.474 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X112.909 Y133.994 I14.526 J-7.524 E.054
G1 X113.381 Y134.33 E.01921
G1 X115.431 Y137.681 E.13031
G1 X115.04 Y137.789 E.01346
G2 X116.085 Y139.037 I18.017 J-14.019 E.05401
M204 S10000
G1 X119.402 Y139.796 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41211
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X121.19 Y142.719 E.18623
G2 X121.927 Y143.038 I6.497 J-14 E.04364
G1 X120.3 Y140.378 E.16945
G1 X120.432 Y140.373 E.00721
G1 X120.383 Y140.415 E.0035
G1 X121.6 Y141.618 E.09299
G1 X122.631 Y143.302 E.10731
G2 X123.307 Y143.522 I4.801 J-13.618 E.03865
G1 X122.317 Y141.904 E.10309
G1 X122.718 Y141.674 E.02512
G1 X123.961 Y143.705 E.12939
G2 X124.595 Y143.855 I1.824 J-6.266 E.03543
G1 X123.98 Y142.851 E.06397
G1 X124.551 Y142.899 E.03114
G1 X125.212 Y143.979 E.06878
G1 X125.809 Y144.069 E.0328
G1 X125.122 Y142.947 E.07147
G1 X125.693 Y142.995 E.03114
G1 X126.391 Y144.136 E.07271
G2 X126.963 Y144.184 I.77 J-5.696 E.03118
G1 X126.236 Y142.997 E.07565
G1 X126.689 Y142.851 E.02584
G1 X127.522 Y144.212 E.08669
G2 X128.066 Y144.216 I.309 J-5.438 E.02958
G1 X127.472 Y143.246 E.06181
M106 S196.35
M204 S10000
G1 X129.32 Y142.15 F42000
; LINE_WIDTH: 0.40978
M106 S255
G1 F3000
M204 S6000
G1 X130.469 Y144.027 E.11826
G2 X130.958 Y143.946 I-.567 J-4.939 E.02667
G1 X130.125 Y142.584 E.08579
G1 X130.86 Y142.904 E.04307
G1 X131.438 Y143.849 E.05952
G2 X131.909 Y143.738 I-.874 J-4.769 E.02602
G1 X131.439 Y142.969 E.04841
G1 X131.714 Y142.88 E.01556
G1 X131.847 Y142.756 E.00977
G1 X132.375 Y143.619 E.05437
G2 X132.829 Y143.48 I-1.167 J-4.62 E.02552
G1 X132.178 Y142.416 E.06704
G1 X132.502 Y142.065 E.02567
M73 P65 R6
G1 X133.279 Y143.335 E.07999
G1 X133.72 Y143.174 E.02521
G1 X132.827 Y141.715 E.09197
G1 X133.088 Y141.432 E.02065
G1 X133.205 Y141.452 E.00638
G1 X134.154 Y143.003 E.09774
G1 X134.583 Y142.823 E.02499
G1 X133.804 Y141.549 E.0802
G1 X134.403 Y141.647 E.03261
G1 X135.002 Y142.626 E.06167
G1 X135.036 Y142.61 E.00202
G2 X135.418 Y142.425 I-1.66 J-3.912 E.02282
G1 X134.98 Y141.71 E.04503
G2 X135.389 Y141.497 I-3.173 J-6.565 E.02477
G1 X135.822 Y142.205 E.04461
G2 X136.223 Y141.979 I-2.063 J-4.131 E.02473
G1 X135.789 Y141.27 E.04467
G1 X136.138 Y141.064 E.02177
G1 X136.142 Y140.966 E.00529
G1 X136.615 Y141.739 E.0487
G2 X137.001 Y141.489 I-2.314 J-3.995 E.02472
G1 X136.176 Y140.14 E.08497
G1 X136.186 Y139.901 E.01285
G1 X136.683 Y140.088 E.02855
G1 X137.382 Y141.23 E.07191
G2 X137.753 Y140.955 I-5.739 J-8.146 E.0248
G1 X137.319 Y140.247 E.04461
G1 X137.681 Y139.958 E.0249
G1 X138.121 Y140.676 E.04525
G1 X138.477 Y140.377 E.02498
G1 X138.02 Y139.63 E.04703
G1 X138.219 Y139.075 E.03172
G1 X138.83 Y140.073 E.06287
G1 X139.173 Y139.754 E.0252
G1 X138.433 Y138.544 E.07619
M106 S196.35
M204 S10000
G1 X139.942 Y137.357 F42000
; LINE_WIDTH: 0.41233
M106 S255
G1 F3000
M204 S6000
G1 X140.522 Y138.306 E.06051
G1 X140.829 Y137.921 E.02676
G1 X140.349 Y137.137 E.05
G2 X140.638 Y136.723 I-6.565 J-4.878 E.02747
G1 X141.126 Y137.521 E.05093
G2 X141.418 Y137.112 I-3.946 J-3.128 E.02734
G1 X140.918 Y136.295 E.05214
G1 X140.958 Y136.233 E.00403
G1 X140.955 Y135.47 E.04151
G1 X141.697 Y136.682 E.0773
G2 X141.968 Y136.239 I-4.304 J-2.938 E.02826
G1 X140.952 Y134.578 E.10593
G1 X140.95 Y134.275 E.01647
G1 X141.521 Y134.623 E.03636
G1 X142.231 Y135.783 E.07399
G2 X142.479 Y135.302 I-4.698 J-2.729 E.02943
G1 X141.918 Y134.385 E.05848
G1 X142.276 Y134.085 E.02543
G1 X142.718 Y134.808 E.04608
G1 X142.948 Y134.298 E.03044
G1 X141.929 Y132.632 E.10624
G1 X142.282 Y132.323 E.02553
G1 X143.16 Y133.758 E.09155
G2 X143.36 Y133.199 I-6.106 J-2.497 E.03232
M73 P66 R6
G1 X142.615 Y131.982 E.0776
G1 X142.84 Y131.621 E.02313
G1 X142.864 Y131.504 E.00654
G1 X143.546 Y132.618 E.07106
G1 X143.717 Y132.011 E.03429
G1 X142.994 Y130.83 E.07531
G1 X143.044 Y130.531 E.01648
G1 X142.753 Y129.549 E.05575
G1 X143.864 Y131.366 E.11591
G2 X143.992 Y130.689 I-6.715 J-1.613 E.03753
G1 X142.695 Y128.569 E.13521
G1 X143.202 Y128.511 E.02776
G1 X144.095 Y129.972 E.09316
G1 X144.114 Y129.821 E.00829
G1 X143.889 Y128.89 E.05213
G1 X143.967 Y128.876 E.00427
G1 X142.821 Y127.003 E.11941
G1 X142.689 Y126.553 E.02553
G1 X142.977 Y126.373 E.0185
G1 X144.211 Y128.389 E.12862
G2 X144.208 Y127.499 I-8.92 J-.417 E.04846
G1 X135.824 Y113.796 E.87398
G2 X135.032 Y113.388 I-4.482 J7.726 E.04847
G1 X136.528 Y115.834 E.15597
G1 X135.491 Y114.812 E.07922
G1 X135.293 Y114.701 E.01234
G1 X134.284 Y113.051 E.10521
G2 X133.899 Y112.891 I-1.805 J3.781 E.0227
G1 X133.762 Y113.064 E.01203
G1 X133.747 Y113.059 E.00087
G1 X134.714 Y114.639 E.1008
G1 X134.595 Y114.716 E.00767
G1 X134.197 Y114.103 E.03976
G1 X133.721 Y113.904 E.02807
G1 X133.069 Y112.837 E.068
G1 X132.915 Y112.787 E.00882
G1 X132.423 Y112.395 E.03422
G2 X132.224 Y112.342 I-.624 J1.969 E.01121
G1 X133.003 Y113.615 E.08117
G2 X132.316 Y113.378 I-2.75 J6.862 E.03954
G1 X131.583 Y112.181 E.07639
G1 X130.965 Y112.056 E.03433
G1 X131.796 Y113.414 E.08665
G1 X131.511 Y113.544 E.01704
G1 X131.06 Y113.097 E.03456
G1 X130.23 Y111.74 E.08655
M106 S196.35
M204 S10000
G1 X128.718 Y113.19 F42000
; LINE_WIDTH: 0.45339
M106 S255
G1 F3000
M204 S6000
G1 X127.858 Y111.784 E.10843
G2 X127.278 Y111.8 I-.131 J5.823 E.03821
G1 X128.006 Y112.991 E.09183
G1 X127.418 Y112.993 E.03872
G1 X126.707 Y111.833 E.08952
G1 X126.151 Y111.888 E.03676
G1 X126.906 Y113.122 E.09516
G1 X126.557 Y113.318 E.0263
G1 X126.279 Y113.062 E.02489
G1 X125.491 Y111.774 E.09926
M106 S196.35
M204 S10000
G1 X123.637 Y113.454 F42000
; LINE_WIDTH: 0.40447
M106 S255
G1 F3000
M204 S6000
G1 X123.082 Y112.547 E.05566
G2 X122.64 Y112.695 I1.255 J4.511 E.02443
G1 X123.089 Y113.429 E.0451
G2 X122.65 Y113.583 I4.337 J13.133 E.02434
G1 X122.204 Y112.853 E.04477
G2 X121.777 Y113.026 I1.517 J4.371 E.02413
G1 X122.217 Y113.745 E.04416
G1 X121.794 Y113.924 E.02406
G1 X121.263 Y113.057 E.0532
M106 S196.35
M204 S10000
G1 X120.296 Y114.908 F42000
; LINE_WIDTH: 0.43943
M106 S255
G1 F3000
M204 S6000
G1 X119.76 Y114.032 E.06348
G1 X119.342 Y114.287 E.03024
G1 X119.775 Y114.995 E.0513
G2 X119.365 Y115.263 I3.218 J5.371 E.03026
G1 X118.933 Y114.556 E.05122
G2 X118.528 Y114.832 I2.531 J4.143 E.03029
G1 X118.964 Y115.546 E.05168
G1 X118.617 Y115.796 E.02644
G1 X118.506 Y115.734 E.00788
G1 X118.03 Y114.956 E.05636
M106 S196.35
M204 S10000
G1 X117.136 Y118.165 F42000
; LINE_WIDTH: 0.42182
M106 S255
G1 F3000
M204 S6000
G1 X116.289 Y116.782 E.09231
G2 X115.956 Y117.141 I3.815 J3.884 E.0279
G1 X116.629 Y118.242 E.07346
G2 X116.25 Y118.526 I.42 J.956 E.02722
G1 X115.629 Y117.511 E.06772
G2 X115.314 Y117.9 I3.742 J3.357 E.02851
G1 X115.912 Y118.878 E.06528
G3 X115.551 Y119.192 I-.923 J-.696 E.02744
G1 X115.004 Y118.298 E.05971
G1 X114.705 Y118.713 E.02915
G1 X115.205 Y119.531 E.05459
G1 X114.92 Y119.968 E.02973
G1 X114.416 Y119.144 E.05499
G2 X114.133 Y119.587 I17.274 J11.348 E.02988
G1 X114.652 Y120.434 E.05656
G1 X114.482 Y120.758 E.02082
G1 X114.479 Y121.056 E.017
G1 X113.865 Y120.052 E.06706
G2 X113.606 Y120.533 I4.693 J2.837 E.03111
G1 X114.473 Y121.949 E.09457
G1 X114.47 Y122.339 E.02219
G1 X113.91 Y121.933 E.03939
G1 X113.23 Y120.822 E.07417
M106 S196.35
M204 S10000
G1 X113.477 Y123.915 F42000
; LINE_WIDTH: 0.41211
M106 S255
G1 F3000
M204 S6000
G1 X112.743 Y122.715 E.07646
G1 X112.67 Y122.714 E.00397
G1 X112.503 Y123.209 E.0284
G1 X113.176 Y124.309 E.07006
G1 X113.161 Y124.371 E.00349
G1 X113.277 Y124.835 E.02598
G1 X113.043 Y124.977 E.01489
G1 X112.332 Y123.815 E.07401
G2 X112.178 Y124.448 I6.257 J1.86 E.03544
G1 X112.647 Y125.216 E.04889
G1 X112.252 Y125.455 E.02511
G1 X111.883 Y124.852 E.03837
M106 S196.35
M204 S10000
G1 X111.67 Y126.274 F42000
M106 S255
G1 F3000
M204 S6000
G1 X113.499 Y129.264 E.19051
M106 S196.35
M204 S10000
G1 X114.847 Y129.696 F42000
M106 S255
G1 F3000
M204 S6000
G1 X116.355 Y132.16 E.15699
G1 X116.655 Y131.896 E.02172
G1 X116.533 Y131.565 E.01917
G1 X115.396 Y129.708 E.11834
G1 X115.628 Y129.622 E.01344
G1 X115.247 Y128.579 E.06031
G1 X115.91 Y129.663 E.06902
G1 X116.266 Y129.358 E.02543
G1 X115.013 Y127.311 E.13046
G1 X115.538 Y127.283 E.02855
G1 X116.427 Y128.736 E.09257
G1 X115.926 Y127.242 E.0856
G1 X116.013 Y127.175 E.00598
G1 X114.959 Y125.452 E.1098
G1 X114.683 Y124.811 E.03792
G1 X115.006 Y124.643 E.01979
G1 X116.382 Y126.892 E.14329
G2 X116.735 Y126.584 I-2.188 J-2.872 E.02549
G1 X115.415 Y124.426 E.13753
G2 X115.758 Y124.102 I-1.626 J-2.071 E.02569
G1 X117.131 Y126.346 E.14297
G3 X117.424 Y126.234 I.412 J.641 E.01716
G1 X117.109 Y125.425 E.04721
G1 X116.084 Y123.75 E.10673
G1 X116.136 Y123.694 E.00411
G1 X115.705 Y122.244 E.08218
G1 X116.56 Y123.642 E.08902
G1 X117.07 Y123.59 E.02787
G1 X116.025 Y121.882 E.10884
G2 X116.363 Y121.549 I-1.82 J-2.185 E.02582
G1 X117.581 Y123.539 E.12678
G1 X117.722 Y123.525 E.00772
G1 X118.207 Y123.677 E.02763
G1 X116.7 Y121.215 E.1569
G1 X116.933 Y121.006 E.017
G1 X117.07 Y120.934 E.00842
G1 X119.124 Y124.29 E.21381
G1 X119.502 Y124.594 E.02635
G1 X119.953 Y124.76 E.02615
G1 X117.488 Y120.732 E.25665
G1 X117.967 Y120.628 E.0266
G1 X120.46 Y124.703 E.25961
M106 S196.35
M204 S10000
G1 X117.251 Y124.605 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X117.841 Y126.123 E.05401
G1 X118.173 Y126.215 E.01143
G1 X118.828 Y126.759 E.02825
G2 X120.793 Y127.165 I1.26 J-1.14 E.07122
G1 X121.449 Y126.621 E.02825
G3 X123.414 Y126.215 I1.26 J1.14 E.07122
G1 X124.069 Y126.759 E.02825
G2 X126.035 Y127.165 I1.26 J-1.14 E.07122
G1 X126.69 Y126.621 E.02825
G3 X128.655 Y126.215 I1.26 J1.14 E.07122
G1 X129.311 Y126.759 E.02825
G2 X131.276 Y127.165 I1.26 J-1.14 E.07122
G1 X131.931 Y126.621 E.02825
G3 X133.897 Y126.215 I1.26 J1.14 E.07122
G1 X134.552 Y126.759 E.02825
G2 X136.517 Y127.165 I1.26 J-1.14 E.07122
G1 X137.172 Y126.621 E.02825
G3 X139.138 Y126.215 I1.26 J1.14 E.07122
G2 X140.448 Y127.245 I9.935 J-11.296 E.05531
G1 X140.539 Y127.259 E.00303
G3 X140.435 Y129.774 I-12.887 J.728 E.08365
G1 X139.793 Y129.241 E.02767
G2 X137.828 Y128.836 I-1.26 J1.14 E.07122
G1 X137.172 Y129.38 E.02825
G3 X135.207 Y129.785 I-1.26 J-1.14 E.07122
G1 X134.552 Y129.241 E.02825
G2 X132.586 Y128.836 I-1.26 J1.14 E.07122
G1 X131.931 Y129.38 E.02825
G3 X129.966 Y129.785 I-1.26 J-1.14 E.07122
G1 X129.311 Y129.241 E.02825
G2 X127.345 Y128.836 I-1.26 J1.14 E.07122
G1 X126.69 Y129.38 E.02825
G3 X124.724 Y129.785 I-1.26 J-1.14 E.07122
G1 X124.069 Y129.241 E.02825
G2 X122.104 Y128.836 I-1.26 J1.14 E.07122
G1 X121.449 Y129.38 E.02825
G3 X119.483 Y129.785 I-1.26 J-1.14 E.07122
G1 X118.828 Y129.241 E.02825
G2 X116.908 Y128.823 I-1.25 J1.121 E.06963
G1 X117.07 Y129.307 E.01694
G2 X116.354 Y129.847 I2.507 J4.073 E.02978
G1 X116.917 Y131.368 E.0538
G3 X118.173 Y131.456 I.531 J1.432 E.04305
G1 X118.828 Y132 E.02825
G2 X120.793 Y132.406 I1.26 J-1.14 E.07122
G1 X121.449 Y131.862 E.02825
G3 X123.414 Y131.456 I1.26 J1.14 E.07122
G1 X124.069 Y132 E.02825
G2 X126.035 Y132.406 I1.26 J-1.14 E.07122
G1 X126.69 Y131.862 E.02825
G3 X128.655 Y131.456 I1.26 J1.14 E.07122
G1 X129.311 Y132 E.02825
G2 X131.276 Y132.406 I1.26 J-1.14 E.07122
G1 X131.931 Y131.862 E.02825
G3 X133.897 Y131.456 I1.26 J1.14 E.07122
G1 X134.552 Y132 E.02825
G2 X136.517 Y132.406 I1.26 J-1.14 E.07122
G1 X137.172 Y131.862 E.02825
G3 X139.138 Y131.456 I1.26 J1.14 E.07122
G2 X139.882 Y132.067 I5.875 J-6.407 E.03195
G3 X139.046 Y133.983 I-17.082 J-6.317 E.0694
G2 X137.828 Y134.077 I-.505 J1.393 E.04178
G1 X137.172 Y134.621 E.02825
G3 X135.207 Y135.027 I-1.26 J-1.14 E.07122
G1 X134.552 Y134.483 E.02825
G2 X132.586 Y134.077 I-1.26 J1.14 E.07122
G1 X131.931 Y134.621 E.02825
G3 X129.966 Y135.027 I-1.26 J-1.14 E.07122
G1 X129.311 Y134.483 E.02825
G2 X127.345 Y134.077 I-1.26 J1.14 E.07122
G1 X126.69 Y134.621 E.02825
G3 X124.724 Y135.027 I-1.26 J-1.14 E.07122
G1 X124.069 Y134.483 E.02825
G2 X122.104 Y134.077 I-1.26 J1.14 E.07122
G1 X121.449 Y134.621 E.02825
G3 X119.483 Y135.027 I-1.26 J-1.14 E.07122
G1 X119.104 Y134.712 E.01635
G1 X118.353 Y133.484 E.04774
G1 X118.192 Y133.583 E.00627
M204 S10000
G1 X120.636 Y139.883 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.559517
G1 F12000
M204 S6000
G2 X120.124 Y139.347 I-9.646 J8.701 E.03123
; LINE_WIDTH: 0.543549
G1 X120.05 Y139.233 E.00552
; LINE_WIDTH: 0.494125
G1 X119.977 Y139.119 E.00498
; LINE_WIDTH: 0.420758
G1 X119.904 Y139.005 E.00417
G1 X118.878 Y137.917 E.04605
G1 X118.621 Y137.69 E.01056
G1 X118.275 Y137.988 E.01405
G1 X119.11 Y139.274 E.04721
G1 X119.41 Y139.527 E.01208
; LINE_WIDTH: 0.444702
G1 X119.528 Y139.594 E.00443
; LINE_WIDTH: 0.494125
G1 X119.645 Y139.661 E.00498
; LINE_WIDTH: 0.557716
G3 X119.968 Y139.907 I-.442 J.913 E.01717
G1 X120.576 Y139.885 E.0255
M204 S10000
G1 X119.397 Y139.02 F42000
; LINE_WIDTH: 0.40434
G1 F12000
M204 S6000
G1 X119.598 Y139.211 E.00816
M204 S10000
G1 X122.56 Y116.246 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G3 X125.827 Y140.77 I5.439 J11.755 E1.48981
G1 X125.337 Y140.988 E.01648
G1 X124.543 Y141.065 E.02451
G1 X124.313 Y141.046 E.00706
; LINE_WIDTH: 0.438663
G1 X123.989 Y140.865 E.01197
; LINE_WIDTH: 0.476008
G1 X123.665 Y140.685 E.0131
; LINE_WIDTH: 0.511265
G1 X123.474 Y140.585 E.00823
; LINE_WIDTH: 0.509874
G1 X123.332 Y140.469 E.00697
; LINE_WIDTH: 0.47392
G1 X123.19 Y140.352 E.00644
; LINE_WIDTH: 0.420607
G2 X122.26 Y139.627 I-12.415 J14.972 E.03632
G1 X122.012 Y139.612 E.00765
G1 X121.859 Y139.702 E.00545
G3 X120.989 Y140.433 I-18.19 J-20.783 E.03497
G1 X122.114 Y141.544 E.04867
G1 X122.994 Y141.038 E.03126
; LINE_WIDTH: 0.437967
G1 X123.068 Y141.024 E.00243
; LINE_WIDTH: 0.47392
G1 X123.143 Y141.01 E.00265
; LINE_WIDTH: 0.509874
G1 X123.217 Y140.996 E.00287
G1 X123.361 Y141.238 E.01071
; LINE_WIDTH: 0.47392
G1 X123.506 Y141.479 E.00989
; LINE_WIDTH: 0.420054
G2 X124.123 Y142.448 I13.401 J-7.85 E.03531
G1 X126.082 Y142.612 E.06043
G1 X126.741 Y142.4 E.02128
G1 X126.841 Y142.396 E.00306
G3 X127.823 Y143.287 I-9.373 J11.319 E.04076
G2 X129.373 Y143.219 I.277 J-11.374 E.04771
G1 X129.065 Y142.003 E.03854
G1 X129.068 Y141.901 E.00313
G1 X129.197 Y141.775 E.00554
G1 X129.323 Y141.784 E.00389
G1 X131.144 Y142.577 E.06102
G1 X131.499 Y142.515 E.01109
G2 X132.699 Y141.244 I-39.312 J-38.304 E.0537
G1 X132.716 Y141.066 E.00549
G1 X132.809 Y140.992 E.00366
G3 X134.865 Y141.304 I-3.317 J28.84 E.06392
G2 X135.734 Y140.822 I-5.072 J-10.18 E.03055
G1 X135.785 Y139.574 E.0384
G1 X135.867 Y139.426 E.0052
G1 X136.04 Y139.405 E.00534
G1 X137.176 Y139.832 E.03728
G1 X137.646 Y139.449 E.01863
G1 X138.052 Y138.314 E.03706
G3 X138.354 Y138.234 I.186 J.095 E.01083
G1 X138.964 Y138.652 E.02275
G2 X139.746 Y137.783 I-15.961 J-15.145 E.03594
G1 X139.696 Y137.347 E.01349
G2 X140.544 Y136.111 I-19.608 J-14.362 E.04608
G1 X140.535 Y133.875 E.06872
G1 X140.552 Y133.796 E.00246
G1 X140.647 Y133.702 E.00412
G1 X140.822 Y133.713 E.00538
G1 X141.549 Y134.155 E.02615
G1 X141.836 Y133.915 E.01152
G1 X141.376 Y132.73 E.03905
G1 X141.374 Y132.603 E.0039
G2 X142.313 Y131.7 I-13.812 J-15.302 E.04006
G1 X142.448 Y131.472 E.00816
G1 X142.62 Y130.556 E.02864
G1 X141.997 Y128.454 E.06735
G1 X142.02 Y128.297 E.00488
G1 X142.156 Y128.213 E.00492
G1 X142.726 Y128.149 E.01763
G1 X142.244 Y126.506 E.05263
G1 X142.259 Y126.363 E.00441
G1 X142.587 Y126.129 E.01237
G1 X141.292 Y124.135 E.07308
G1 X141.261 Y124.032 E.0033
G1 X141.347 Y123.874 E.00552
G1 X141.566 Y123.732 E.00804
G1 X139.304 Y120.248 E.12767
G1 X139.016 Y119.723 E.01839
G1 X137.952 Y117.984 E.06266
G1 X137.849 Y117.983 E.00316
G3 X137.153 Y116.935 I23.759 J-16.529 E.03868
G1 X137.031 Y116.909 E.00383
G1 X135.24 Y115.145 E.07725
G1 X134.947 Y114.98 E.01032
G1 X134.593 Y115.205 E.0129
G1 X134.447 Y115.197 E.00448
G3 X133.92 Y114.435 I8.633 J-6.54 E.02849
G2 X132.078 Y113.74 I-6.106 J13.391 E.06056
G1 X131.542 Y113.985 E.01811
G1 X131.375 Y113.98 E.00514
G3 X130.254 Y112.88 I62.417 J-64.732 E.04827
G2 X129.145 Y112.761 I-2.421 J17.343 E.03428
G1 X129.258 Y113.261 E.01574
G1 X129.176 Y113.371 E.00422
G1 X128.764 Y113.401 E.01271
G1 X127.243 Y113.408 E.04674
G1 X126.616 Y113.759 E.02209
G1 X126.473 Y113.775 E.00442
G3 X125.51 Y112.916 I14.8 J-17.559 E.03966
G2 X123.888 Y113.278 I4.519 J24.078 E.05108
G1 X123.862 Y113.563 E.0088
G1 X123.771 Y113.631 E.00349
G1 X122.449 Y114.096 E.04307
G1 X121.727 Y114.401 E.02409
G1 X121.566 Y114.394 E.00494
G1 X121.328 Y114.246 E.00863
G2 X120.585 Y114.632 I6.9 J14.207 E.02572
G1 X120.591 Y114.933 E.00926
G1 X120.44 Y115.068 E.00622
G2 X118.739 Y116.217 I10.349 J17.157 E.06313
G1 X118.632 Y116.25 E.00342
G1 X118.366 Y116.129 E.009
G2 X117.2 Y117.185 I7.739 J9.711 E.04836
G1 X117.451 Y118.056 E.02788
G1 X117.411 Y118.233 E.00558
G1 X116.722 Y118.67 E.02507
G2 X115.959 Y119.41 I11.95 J13.095 E.03267
G1 X115.619 Y119.68 E.01334
G2 X114.894 Y120.863 I8.835 J6.228 E.04267
; LINE_WIDTH: 0.410415
G1 X114.877 Y121.943 E.03234
; LINE_WIDTH: 0.385582
G2 X114.88 Y122.779 I3.34 J.404 E.02339
; LINE_WIDTH: 0.41999
G1 X114.765 Y122.951 E.00636
G1 X114.608 Y122.946 E.00483
G1 X113.796 Y122.361 E.03076
G1 X113.533 Y123.066 E.0231
G1 X113.72 Y123.695 E.02016
G1 X113.607 Y124.282 E.01838
G1 X113.608 Y124.454 E.00528
; LINE_WIDTH: 0.436195
G1 X113.682 Y124.684 E.00774
; LINE_WIDTH: 0.460798
G1 X113.755 Y124.914 E.00822
G1 X113.634 Y125.103 E.00765
; LINE_WIDTH: 0.41999
G1 X112.911 Y125.539 E.02593
G2 X112.776 Y126.625 I26.702 J3.882 E.03362
G1 X113.419 Y127.616 E.03632
; LINE_WIDTH: 0.443442
G1 X113.701 Y128.009 E.01577
; LINE_WIDTH: 0.490345
G1 X113.984 Y128.401 E.01762
; LINE_WIDTH: 0.537249
G1 X114.266 Y128.793 E.01946
; LINE_WIDTH: 0.577098
G1 F11793.833
G1 X114.294 Y128.916 E.00549
; LINE_WIDTH: 0.625364
G1 F10816.498
G1 X114.321 Y129.039 E.00598
G1 X114.208 Y129.178 E.00853
G1 X113.779 Y129.457 E.02425
G1 X113.907 Y129.71 E.01346
G1 X114.967 Y129.316 E.05367
; LINE_WIDTH: 0.609218
G1 F11124.895
G1 X114.882 Y129.036 E.01352
; LINE_WIDTH: 0.568606
G1 F11984.348
G2 X114.726 Y128.563 I-3.719 J.964 E.02133
; LINE_WIDTH: 0.537249
G1 F12000
G1 X114.583 Y128.102 E.01946
; LINE_WIDTH: 0.490345
G1 X114.44 Y127.64 E.01761
; LINE_WIDTH: 0.423646
G1 X114.296 Y127.179 E.01499
G1 X114.36 Y126.963 E.00698
G1 X114.463 Y126.926 E.00339
G1 X115.096 Y126.892 E.01965
G1 X115.095 Y126.812 E.00249
G1 X114.475 Y125.372 E.04864
; LINE_WIDTH: 0.436195
G1 X114.333 Y125.084 E.0103
; LINE_WIDTH: 0.462168
G1 X114.191 Y124.796 E.01098
G1 X114.246 Y124.591 E.00723
; LINE_WIDTH: 0.419425
G2 X115.225 Y124.04 I-22.623 J-41.334 E.03446
G1 X115.673 Y123.586 E.01957
G3 X115.325 Y122.405 I56.351 J-17.22 E.03776
G1 X115.239 Y122.385 E.00273
; LINE_WIDTH: 0.398715
G1 X115.202 Y122.302 E.00263
; LINE_WIDTH: 0.375319
G1 X115.166 Y122.219 E.00246
G1 X115.202 Y122.088 E.00368
; LINE_WIDTH: 0.419049
G2 X116.24 Y121.073 I-7.515 J-8.729 E.04452
G1 X116.666 Y120.69 E.01757
G1 X117.274 Y120.362 E.02116
G1 X117.596 Y120.286 E.01014
G3 X122.506 Y116.272 I10.343 J7.643 E.1964
M204 S10000
G1 X142.207 Y130.71 F42000
; LINE_WIDTH: 0.414619
G1 F12000
M204 S6000
G1 X142.233 Y130.576 E.00415
G3 X141.668 Y128.637 I58.905 J-18.199 E.06117
G1 X141.634 Y128.387 E.00762
G1 X141.705 Y128.09 E.00925
G1 X141.917 Y127.899 E.00865
G1 X142.238 Y127.825 E.00999
G1 X142.05 Y127.185 E.02019
; LINE_WIDTH: 0.438189
G1 X141.977 Y126.999 E.00644
; LINE_WIDTH: 0.474585
G1 X141.903 Y126.813 E.00703
; LINE_WIDTH: 0.518421
G3 X141.806 Y126.53 I1.032 J-.516 E.01163
; LINE_WIDTH: 0.517865
G1 X141.846 Y126.415 E.00474
; LINE_WIDTH: 0.478715
G1 X141.887 Y126.3 E.00434
; LINE_WIDTH: 0.421181
G1 X141.927 Y126.184 E.00377
G1 X142.072 Y126.03 E.00653
G1 X141.158 Y124.622 E.05172
; LINE_WIDTH: 0.442935
G1 X141.065 Y124.517 E.00458
; LINE_WIDTH: 0.488825
G1 X140.971 Y124.412 E.00511
; LINE_WIDTH: 0.534715
G1 X140.878 Y124.307 E.00564
G1 X140.893 Y124.446 E.00557
; LINE_WIDTH: 0.488825
G1 X140.908 Y124.584 E.00505
; LINE_WIDTH: 0.422206
G1 X140.923 Y124.722 E.0043
G3 X141.18 Y125.997 I-12.926 J3.278 E.04022
; LINE_WIDTH: 0.439565
G1 X141.225 Y126.195 E.00657
; LINE_WIDTH: 0.478715
G1 X141.27 Y126.394 E.00722
; LINE_WIDTH: 0.517865
G1 X141.315 Y126.592 E.00787
G1 X141.315 Y126.834 E.00938
; LINE_WIDTH: 0.478715
G1 X141.315 Y127.077 E.00861
; LINE_WIDTH: 0.425219
G2 X141.332 Y127.984 I16.837 J.134 E.02826
; LINE_WIDTH: 0.413578
G2 X141.267 Y129.311 I34.12 J2.326 E.04014
G3 X140.744 Y131.914 I-16.268 J-1.914 E.08029
; LINE_WIDTH: 0.43831
G1 X140.575 Y132.479 E.019
; LINE_WIDTH: 0.473854
G1 X140.502 Y132.716 E.0087
; LINE_WIDTH: 0.5083
G1 X140.429 Y132.953 E.00939
; LINE_WIDTH: 0.55444
G3 X140.153 Y133.617 I-2.411 J-.611 E.03007
G1 X140.465 Y133.293 E.01872
G1 X140.724 Y133.238 E.01103
G1 X141.153 Y133.391 E.01899
G1 X140.958 Y132.888 E.02248
; LINE_WIDTH: 0.541755
G1 X140.973 Y132.752 E.00558
; LINE_WIDTH: 0.505325
G1 X140.987 Y132.615 E.00518
; LINE_WIDTH: 0.468895
G1 X141.002 Y132.478 E.00477
; LINE_WIDTH: 0.422416
G1 X141.212 Y132.209 E.01057
G1 X141.827 Y131.67 E.0253
G1 X142.09 Y131.337 E.01311
G1 X142.196 Y130.769 E.01786
M204 S10000
G1 X141.836 Y130.64 F42000
; LINE_WIDTH: 0.424335
G1 F12000
M204 S6000
G2 X141.594 Y129.75 I-12.962 J3.051 E.02868
G3 X141.196 Y131.717 I-14.365 J-1.883 E.06242
G1 X141.686 Y131.261 E.02081
G2 X141.825 Y130.699 I-3.81 J-1.24 E.018
M204 S10000
G1 X141.756 Y127.489 F42000
; LINE_WIDTH: 0.48164
G1 F12000
M204 S6000
G2 X141.751 Y127.584 I-.027 J.046 E.00788
M204 S10000
G1 X141.605 Y125.952 F42000
; LINE_WIDTH: 0.45642
G1 F12000
M204 S6000
G2 X141.597 Y126.041 I-.026 J.043 E.00681
M204 S10000
G1 X140.813 Y124.063 F42000
; LINE_WIDTH: 0.56105
G1 F12000
M204 S6000
G1 X140.862 Y124.249 E.00815
M204 S10000
G1 X140.813 Y124.063 F42000
; LINE_WIDTH: 0.542724
G1 F12000
M204 S6000
G1 X140.864 Y123.95 E.00505
; LINE_WIDTH: 0.49929
G1 X140.916 Y123.837 E.00461
; LINE_WIDTH: 0.438119
G3 X141.05 Y123.641 I.333 J.084 E.00781
G1 X140.812 Y123.276 E.01402
; LINE_WIDTH: 0.455453
G1 X140.708 Y123.154 E.00539
; LINE_WIDTH: 0.498078
G1 X140.603 Y123.033 E.00595
; LINE_WIDTH: 0.540703
G1 X140.499 Y122.911 E.00651
; LINE_WIDTH: 0.583328
G1 F11657.87
G1 X140.395 Y122.789 E.00707
; LINE_WIDTH: 0.61241
G1 F11062.531
G1 X140.37 Y122.765 E.00159
; LINE_WIDTH: 0.596925
G1 F11371.74
G1 X140.41 Y122.93 E.00763
; LINE_WIDTH: 0.550415
G1 F12000
G1 X140.449 Y123.094 E.00698
; LINE_WIDTH: 0.503905
G1 X140.489 Y123.258 E.00634
; LINE_WIDTH: 0.457395
G1 X140.529 Y123.422 E.0057
; LINE_WIDTH: 0.454105
G1 X140.615 Y123.618 E.00716
; LINE_WIDTH: 0.494035
G1 X140.701 Y123.813 E.00785
; LINE_WIDTH: 0.533965
G1 X140.787 Y124.008 E.00855
M204 S10000
G1 X138.097 Y119.143 F42000
; LINE_WIDTH: 0.60491
G1 F11210.165
M204 S6000
G1 X138.28 Y119.4 E.01445
; LINE_WIDTH: 0.56089
G1 F12000
G1 X138.463 Y119.657 E.01332
; LINE_WIDTH: 0.51687
G1 X138.647 Y119.914 E.01218
; LINE_WIDTH: 0.47585
G1 X138.817 Y120.183 E.01125
; LINE_WIDTH: 0.428781
G3 X139.714 Y121.602 I-60.53 J39.273 E.05278
; LINE_WIDTH: 0.46897
G1 X139.882 Y121.89 E.01157
; LINE_WIDTH: 0.50259
G1 X140.049 Y122.178 E.01248
; LINE_WIDTH: 0.536197
G1 X140.146 Y122.356 E.00816
; LINE_WIDTH: 0.56979
G1 F11957.409
G1 X140.244 Y122.535 E.00872
; LINE_WIDTH: 0.603384
G1 F11240.7
G1 X140.341 Y122.713 E.00927
M204 S10000
G1 X138.097 Y119.143 F42000
; LINE_WIDTH: 0.605527
G1 F11197.876
M204 S6000
G1 X138.081 Y119.075 E.0032
; LINE_WIDTH: 0.56274
G1 F12000
G1 X138.065 Y119.007 E.00296
; LINE_WIDTH: 0.519954
G1 X138.048 Y118.94 E.00271
; LINE_WIDTH: 0.477167
G1 X138.032 Y118.872 E.00247
; LINE_WIDTH: 0.43438
G1 X138.015 Y118.804 E.00223
; LINE_WIDTH: 0.399902
G1 X137.999 Y118.736 E.00203
G1 X137.691 Y118.327 E.01489
G1 X137.489 Y118.136 E.0081
; LINE_WIDTH: 0.426498
G1 X137.333 Y117.926 E.00816
; LINE_WIDTH: 0.458853
G1 X137.178 Y117.716 E.00885
; LINE_WIDTH: 0.49017
G1 X137.028 Y117.514 E.00917
; LINE_WIDTH: 0.528747
G2 X136.655 Y117.149 I-.765 J.408 E.02098
G1 X136.206 Y116.698 E.02518
; LINE_WIDTH: 0.505715
G1 X136.156 Y116.625 E.00335
; LINE_WIDTH: 0.471425
G1 X136.106 Y116.551 E.00311
; LINE_WIDTH: 0.420797
G1 X136.056 Y116.478 E.00274
G1 X135.011 Y115.449 E.04515
G1 X134.961 Y115.421 E.00176
G1 X134.72 Y115.559 E.00856
; LINE_WIDTH: 0.441045
G1 X134.579 Y115.577 E.00461
; LINE_WIDTH: 0.483155
G1 X134.438 Y115.594 E.00509
; LINE_WIDTH: 0.525265
G1 X134.297 Y115.612 E.00558
G1 X134.202 Y115.497 E.00588
; LINE_WIDTH: 0.483155
G1 X134.106 Y115.382 E.00537
; LINE_WIDTH: 0.421788
G1 X134.01 Y115.267 E.00462
G1 X133.667 Y114.738 E.01946
G2 X132.098 Y114.145 I-5.205 J11.407 E.05182
G1 X131.626 Y114.356 E.01596
G1 X131.324 Y114.362 E.00931
G1 X131.065 Y114.215 E.00918
G1 X130.076 Y113.235 E.04301
G1 X129.621 Y113.181 E.01414
G1 X129.599 Y113.426 E.00759
G1 X129.405 Y113.671 E.00965
G1 X129.078 Y113.777 E.0106
G1 X127.342 Y113.784 E.05361
G1 X126.844 Y114.088 E.01801
; LINE_WIDTH: 0.479885
G1 X126.768 Y114.14 E.00326
; LINE_WIDTH: 0.514615
G1 X126.693 Y114.192 E.00352
; LINE_WIDTH: 0.540735
G1 X126.381 Y114.207 E.01269
; LINE_WIDTH: 0.527907
G1 X126.254 Y114.098 E.00663
; LINE_WIDTH: 0.48474
G1 X126.127 Y113.988 E.00604
; LINE_WIDTH: 0.420119
G3 X125.389 Y113.317 I10.073 J-11.809 E.03067
G2 X124.228 Y113.578 I1.725 J10.359 E.03659
G1 X124.169 Y113.782 E.00653
G1 X123.897 Y113.987 E.01046
G1 X122.585 Y114.448 E.04273
G1 X121.873 Y114.748 E.02374
G1 X121.601 Y114.79 E.00848
G1 X121.305 Y114.676 E.00976
G1 X120.978 Y114.847 E.01134
G1 X120.937 Y115.081 E.00731
G1 X120.695 Y115.353 E.01119
G2 X118.963 Y116.521 I10.501 J17.439 E.06423
G1 X118.631 Y116.627 E.01071
G1 X118.423 Y116.573 E.00661
G2 X117.626 Y117.3 I8.707 J10.348 E.03317
G1 X117.813 Y117.952 E.02086
G1 X117.835 Y118.117 E.00511
G1 X117.693 Y118.483 E.01208
G3 X116.833 Y119.06 I-15.208 J-21.742 E.03184
G1 X116.32 Y119.602 E.02294
G1 X115.909 Y119.922 E.01601
G2 X115.316 Y120.881 I4.816 J3.64 E.03471
G1 X115.27 Y121.017 E.0044
G1 X115.266 Y121.505 E.01499
G2 X116.036 Y120.749 I-4.938 J-5.796 E.03318
G1 X116.426 Y120.398 E.01613
G1 X117.1 Y120.028 E.02363
G1 X117.38 Y119.941 E.00902
G3 X125.669 Y114.874 I10.652 J8.111 E.30558
; LINE_WIDTH: 0.439139
G1 X125.885 Y114.821 E.00718
; LINE_WIDTH: 0.477435
G1 X126.101 Y114.769 E.00788
; LINE_WIDTH: 0.507784
G1 X126.318 Y114.717 E.00843
G1 X126.985 Y114.679 E.02533
; LINE_WIDTH: 0.461548
G1 X127.32 Y114.676 E.01143
; LINE_WIDTH: 0.420723
G1 X127.655 Y114.673 E.01031
G3 X133.468 Y115.841 I.311 J13.492 E.18404
; LINE_WIDTH: 0.44086
G1 X133.658 Y115.909 E.00655
; LINE_WIDTH: 0.4826
G1 X133.849 Y115.978 E.00724
; LINE_WIDTH: 0.52434
G1 X134.039 Y116.046 E.00792
G1 X134.243 Y116.179 E.00957
; LINE_WIDTH: 0.4826
G1 X134.447 Y116.313 E.00874
; LINE_WIDTH: 0.423742
G3 X135.59 Y117.044 I-23.809 J38.465 E.04212
; LINE_WIDTH: 0.444607
G1 X135.709 Y117.098 E.00426
; LINE_WIDTH: 0.49384
G1 X135.827 Y117.152 E.00478
; LINE_WIDTH: 0.548949
G1 X135.946 Y117.206 E.00537
G1 X136.358 Y117.541 E.02188
; LINE_WIDTH: 0.519963
G1 X136.593 Y117.756 E.0124
; LINE_WIDTH: 0.493708
G1 X136.829 Y117.971 E.01172
; LINE_WIDTH: 0.463015
G1 X137.019 Y118.171 E.00945
; LINE_WIDTH: 0.427885
G1 X137.21 Y118.37 E.00866
; LINE_WIDTH: 0.39026
G1 X137.742 Y118.936 E.02198
; LINE_WIDTH: 0.391594
G1 X137.793 Y118.965 E.00166
; LINE_WIDTH: 0.43438
G1 X137.843 Y118.995 E.00187
; LINE_WIDTH: 0.477167
G1 X137.894 Y119.024 E.00207
; LINE_WIDTH: 0.519954
G1 X137.944 Y119.054 E.00227
; LINE_WIDTH: 0.56274
G1 X137.995 Y119.083 E.00248
; LINE_WIDTH: 0.605527
G1 F11197.876
G1 X138.046 Y119.113 E.00268
M204 S10000
G1 X134.891 Y116.019 F42000
; LINE_WIDTH: 0.625868
G1 F10807.149
M204 S6000
G1 X135.027 Y116.124 E.00818
; LINE_WIDTH: 0.586283
G1 F11594.47
G1 X135.162 Y116.23 E.00762
; LINE_WIDTH: 0.546698
G1 F12000
G1 X135.298 Y116.336 E.00706
; LINE_WIDTH: 0.507113
G1 X135.434 Y116.442 E.00651
; LINE_WIDTH: 0.465965
G1 X135.593 Y116.572 E.00707
; LINE_WIDTH: 0.423255
G1 X135.751 Y116.702 E.00636
M204 S10000
G1 X133.824 Y115.604 F42000
; LINE_WIDTH: 0.404491
G1 F12000
M204 S6000
G1 X133.45 Y115.08 E.01897
G1 X133.369 Y115.012 E.00311
G2 X132.118 Y114.546 I-6.638 J15.91 E.03936
G1 X131.687 Y114.722 E.01373
G1 X131.393 Y114.738 E.00865
G3 X133.77 Y115.578 I-3.318 J13.175 E.07437
M204 S10000
G1 X131.068 Y114.654 F42000
; LINE_WIDTH: 0.38986
G1 F12000
M204 S6000
G1 X131.335 Y114.723 E.00781
M204 S10000
G1 X130.762 Y114.521 F42000
; LINE_WIDTH: 0.546781
G1 F12000
M204 S6000
G3 X129.929 Y113.715 I25.513 J-27.17 E.0476
G3 X129.612 Y114.067 I-.707 J-.318 E.01978
; LINE_WIDTH: 0.570165
G1 F11948.904
G1 X129.389 Y114.158 E.01036
; LINE_WIDTH: 0.591698
G1 F11480.052
G1 X129.166 Y114.25 E.01078
G1 X129.674 Y114.327 E.02301
; LINE_WIDTH: 0.549342
G1 F12000
G3 X130.704 Y114.508 I-.583 J6.335 E.04317
M204 S10000
G1 X127.46 Y114.233 F42000
; LINE_WIDTH: 0.566674
G1 F12000
M204 S6000
G3 X128.767 Y114.236 I.604 J21.831 E.0558
; LINE_WIDTH: 0.60023
G1 F11304.301
G1 X129.106 Y114.247 E.01537
M204 S10000
G1 X126.127 Y114.422 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X125.887 Y114.287 E.00846
G1 X125.275 Y113.724 E.02555
G2 X124.506 Y113.895 I1.122 J6.862 E.0242
G1 X124.475 Y114.002 E.00342
; LINE_WIDTH: 0.43843
G1 X124.286 Y114.177 E.00833
; LINE_WIDTH: 0.484223
G1 X124.096 Y114.353 E.00929
G2 X121.921 Y115.172 I9.215 J27.788 E.0836
; LINE_WIDTH: 0.478528
G1 X121.684 Y115.159 E.00842
; LINE_WIDTH: 0.427512
G3 X121.324 Y115.107 I-.082 J-.701 E.01153
G1 X121.23 Y115.337 E.0078
; LINE_WIDTH: 0.43794
G1 X121.074 Y115.518 E.00769
; LINE_WIDTH: 0.487529
G1 X120.918 Y115.7 E.00866
G2 X119.125 Y116.912 I13.533 J21.957 E.07845
; LINE_WIDTH: 0.480013
G1 X118.878 Y116.958 E.00896
; LINE_WIDTH: 0.42298
G1 X118.63 Y117.004 E.00779
G1 X118.528 Y116.977 E.00329
G1 X118.051 Y117.415 E.02003
G1 X118.212 Y118.075 E.02104
; LINE_WIDTH: 0.406208
G1 X118.098 Y118.378 E.00956
; LINE_WIDTH: 0.387793
G1 X117.985 Y118.68 E.00907
G1 X118.41 Y118.204 E.01792
; LINE_WIDTH: 0.41999
G1 X118.797 Y117.843 E.01627
; LINE_WIDTH: 0.439998
G1 X119.092 Y117.564 E.01313
; LINE_WIDTH: 0.486934
G1 X119.386 Y117.285 E.01469
G3 X121.105 Y116.111 I10.93 J14.156 E.07537
; LINE_WIDTH: 0.472738
G1 X121.403 Y115.968 E.01157
; LINE_WIDTH: 0.448659
G2 X122.217 Y115.535 I-2.941 J-6.51 E.0305
; LINE_WIDTH: 0.485255
G3 X124.174 Y114.801 I6.928 J15.498 E.07537
; LINE_WIDTH: 0.473083
G1 X124.544 Y114.722 E.01326
; LINE_WIDTH: 0.424303
G3 X126.068 Y114.432 I5.158 J22.903 E.04822
M204 S10000
G1 X124.811 Y114.243 F42000
; LINE_WIDTH: 0.4932
G1 F12000
M204 S6000
G1 X125.091 Y114.184 E.01049
M204 S10000
G1 X121.553 Y115.48 F42000
; LINE_WIDTH: 0.36964
G1 F12000
M204 S6000
G1 X121.492 Y115.516 E.00188
G1 X121.537 Y115.542 E.00137
M204 S10000
G1 X118.517 Y117.541 F42000
; LINE_WIDTH: 0.49169
G1 F12000
M204 S6000
G1 X118.604 Y117.459 E.0044
M204 S10000
G1 X117.096 Y119.5 F42000
; LINE_WIDTH: 0.63479
G1 F10644.23
M204 S6000
G1 X117.223 Y119.381 E.00843
; LINE_WIDTH: 0.58513
G1 F11619.115
G1 X117.351 Y119.261 E.00772
; LINE_WIDTH: 0.53547
G1 F12000
G1 X117.478 Y119.142 E.00701
; LINE_WIDTH: 0.485967
G1 X117.633 Y119.003 E.00753
; LINE_WIDTH: 0.43662
G1 X117.789 Y118.863 E.00669
; LINE_WIDTH: 0.387274
G1 X117.944 Y118.724 E.00586
M204 S10000
G1 X116.072 Y120.258 F42000
; LINE_WIDTH: 0.359125
G1 F12000
M204 S6000
G1 X116.386 Y120.002 E.01045
M204 S10000
G1 X115.111 Y123.022 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X114.912 Y123.298 E.01046
G1 X114.773 Y123.337 E.00445
G1 X114.441 Y123.285 E.01033
G1 X113.976 Y122.957 E.01747
G1 X113.938 Y123.104 E.00466
G1 X114.081 Y123.588 E.01548
M73 P67 R6
G1 X114.09 Y123.878 E.00893
G1 X113.983 Y124.33 E.01426
G3 X114.949 Y123.781 I3.506 J5.046 E.03417
G1 X115.25 Y123.488 E.01292
G1 X115.129 Y123.079 E.01309
M204 S10000
G1 X114.465 Y123.62 F42000
; LINE_WIDTH: 0.35636
G1 F12000
M204 S6000
G1 X114.406 Y123.654 E.00173
G1 X114.447 Y123.678 E.0012
M204 S10000
G1 X113.965 Y125.143 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X113.829 Y125.425 E.00963
G1 X113.253 Y125.773 E.02067
G1 X113.166 Y126.533 E.02351
G1 X114.293 Y128.271 E.06366
G1 X113.942 Y127.308 E.0315
G1 X114.049 Y126.74 E.01776
G1 X114.135 Y126.661 E.00359
G1 X114.443 Y126.55 E.01007
G1 X114.568 Y126.543 E.00386
G1 X113.989 Y125.198 E.04498
M204 S10000
G1 X113.855 Y125.858 F42000
; LINE_WIDTH: 0.43414
G1 F12000
M204 S6000
G1 X113.613 Y126.005 E.00902
G1 X113.585 Y126.473 E.01497
G1 X113.723 Y126.686 E.0081
G1 X113.761 Y126.486 E.00649
G3 X114.046 Y126.302 I.362 J.248 E.01112
G1 X113.879 Y125.913 E.0135
M204 S10000
G1 X122.97 Y140.649 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G2 X122.104 Y139.989 I-40.409 J52.102 E.03346
G1 X121.552 Y140.459 E.02226
G1 X122.175 Y141.074 E.02691
G1 X122.806 Y140.711 E.02239
G1 X122.914 Y140.671 E.00352
M204 S10000
G1 X122.119 Y140.48 F42000
; LINE_WIDTH: 0.44328
G1 F12000
M204 S6000
G1 X122.193 Y140.544 E.0032
M204 S10000
G1 X129.078 Y141.351 F42000
; LINE_WIDTH: 0.526249
G1 F12000
M204 S6000
G1 X128.835 Y141.343 E.00958
; LINE_WIDTH: 0.483745
G1 X128.592 Y141.335 E.00874
; LINE_WIDTH: 0.421399
G3 X127.025 Y141.296 I.245 J-41.202 E.04834
G3 X125.879 Y141.159 I.801 J-11.548 E.0356
G1 X125.311 Y141.379 E.0188
G1 X124.971 Y141.407 E.01051
; LINE_WIDTH: 0.443315
G1 X124.803 Y141.445 E.00563
; LINE_WIDTH: 0.489965
G1 X124.635 Y141.482 E.00628
; LINE_WIDTH: 0.557363
G1 X124.466 Y141.52 E.00723
G1 X124.077 Y141.425 E.01681
G1 X123.933 Y141.335 E.0071
G1 X124.378 Y142.021 E.03427
; LINE_WIDTH: 0.563105
G1 X124.58 Y142.035 E.00858
; LINE_WIDTH: 0.54189
G1 X124.71 Y142.07 E.00549
; LINE_WIDTH: 0.49313
G1 X124.841 Y142.106 E.00496
; LINE_WIDTH: 0.420585
G1 X124.971 Y142.141 E.00416
G1 X126.038 Y142.23 E.03296
G1 X126.626 Y142.041 E.019
G1 X126.924 Y142.028 E.00919
G1 X127.265 Y142.242 E.01239
G1 X127.973 Y142.91 E.02993
G1 X128.897 Y142.874 E.02845
G1 X128.7 Y142.095 E.0247
G1 X128.708 Y141.79 E.00941
; LINE_WIDTH: 0.43803
G1 X128.813 Y141.653 E.00557
; LINE_WIDTH: 0.47411
G1 X128.919 Y141.516 E.00608
; LINE_WIDTH: 0.510202
G1 X129.025 Y141.379 E.00659
M204 S10000
G1 X128.274 Y141.762 F42000
; LINE_WIDTH: 0.53311
G1 F12000
M204 S6000
G1 X127.684 Y141.762 E.02359
; LINE_WIDTH: 0.512225
G1 X127.458 Y141.73 E.00872
; LINE_WIDTH: 0.470455
G1 X127.232 Y141.698 E.00794
; LINE_WIDTH: 0.428685
G1 X127.007 Y141.666 E.00717
G1 X127.166 Y141.729 E.00538
; LINE_WIDTH: 0.470455
G1 X127.325 Y141.791 E.00596
; LINE_WIDTH: 0.531276
G1 X127.485 Y141.853 E.00681
G1 X128.145 Y142.476 E.03612
G1 X128.349 Y142.476 E.00811
G1 X128.25 Y141.997 E.01947
G1 X128.268 Y141.821 E.00703
M204 S10000
G1 X126.73 Y141.643 F42000
; LINE_WIDTH: 0.41059
G1 F12000
M204 S6000
G1 X126.947 Y141.661 E.00653
M204 S10000
G1 X126.73 Y141.643 F42000
; LINE_WIDTH: 0.392258
G1 F12000
M204 S6000
G1 X126.003 Y141.537 E.02091
G1 X125.885 Y141.546 E.00338
; LINE_WIDTH: 0.39767
G1 X125.616 Y141.66 E.00844
; LINE_WIDTH: 0.425065
G1 X125.347 Y141.774 E.0091
G1 X125.939 Y141.865 E.01864
; LINE_WIDTH: 0.384849
G2 X126.672 Y141.66 I-2.427 J-10.115 E.02122
M204 S10000
G1 X125.002 Y141.774 F42000
; LINE_WIDTH: 0.41648
G1 F12000
M204 S6000
G1 X125.144 Y141.774 E.00434
; LINE_WIDTH: 0.4452
G1 X125.287 Y141.774 E.00467
M204 S10000
G1 X132.552 Y140.611 F42000
; LINE_WIDTH: 0.558582
G1 F12000
M204 S6000
G1 X132.408 Y140.638 E.00615
; LINE_WIDTH: 0.518984
G1 X132.264 Y140.666 E.00568
; LINE_WIDTH: 0.479387
G1 X132.12 Y140.694 E.00521
; LINE_WIDTH: 0.421147
G1 X131.976 Y140.721 E.00451
G3 X129.674 Y141.226 I-4.168 J-13.499 E.07273
; LINE_WIDTH: 0.439665
G1 X129.511 Y141.263 E.00539
; LINE_WIDTH: 0.479015
G1 X129.348 Y141.299 E.00592
; LINE_WIDTH: 0.518365
G1 X129.186 Y141.335 E.00646
G1 X129.531 Y141.478 E.01446
; LINE_WIDTH: 0.479015
G1 X129.876 Y141.621 E.01326
; LINE_WIDTH: 0.424134
G3 X131.212 Y142.195 I-14.889 J36.47 E.0452
G1 X131.331 Y142.157 E.00388
G2 X132.324 Y141.094 I-68.067 J-64.61 E.04517
G1 X132.398 Y140.824 E.00872
; LINE_WIDTH: 0.48433
G1 X132.437 Y140.769 E.00243
; LINE_WIDTH: 0.52195
G1 X132.477 Y140.714 E.00264
; LINE_WIDTH: 0.55957
G1 X132.516 Y140.66 E.00284
M204 S10000
G1 X131.712 Y141.198 F42000
; LINE_WIDTH: 0.42295
G1 F12000
M204 S6000
G3 X130.51 Y141.476 I-3.522 J-12.481 E.03823
G1 X131.183 Y141.77 E.02275
G1 X131.671 Y141.242 E.02226
M204 S10000
G1 X135.517 Y139.113 F42000
; LINE_WIDTH: 0.574979
G1 F11840.799
M204 S6000
G1 X135.393 Y139.167 E.00588
; LINE_WIDTH: 0.530697
G1 F12000
G1 X135.268 Y139.221 E.00539
; LINE_WIDTH: 0.486414
G1 X135.144 Y139.276 E.0049
; LINE_WIDTH: 0.424027
G1 X135.02 Y139.33 E.00421
G3 X132.942 Y140.393 I-9.814 J-16.617 E.07253
; LINE_WIDTH: 0.46386
G1 X132.846 Y140.451 E.00385
; LINE_WIDTH: 0.50578
G1 X132.75 Y140.51 E.00423
; LINE_WIDTH: 0.5477
G1 X132.655 Y140.568 E.00461
; LINE_WIDTH: 0.543882
G1 X132.949 Y140.614 E.01216
; LINE_WIDTH: 0.494325
G1 X133.243 Y140.659 E.01095
; LINE_WIDTH: 0.42225
G3 X134.8 Y140.911 I-14.343 J93.622 E.04876
G1 X135.366 Y140.601 E.01993
G1 X135.408 Y139.558 E.03227
; LINE_WIDTH: 0.4342
G1 X135.418 Y139.454 E.00336
; LINE_WIDTH: 0.46262
G1 X135.427 Y139.349 E.0036
; LINE_WIDTH: 0.496879
G1 X135.45 Y139.289 E.00237
; LINE_WIDTH: 0.536975
G1 X135.473 Y139.229 E.00258
; LINE_WIDTH: 0.577072
G1 F11794.403
G1 X135.496 Y139.169 E.00279
M204 S10000
G1 X134.986 Y139.832 F42000
; LINE_WIDTH: 0.4873
G1 F12000
M204 S6000
G3 X133.992 Y140.363 I-5.376 J-8.863 E.04084
G1 X134.73 Y140.484 E.02708
G1 X134.965 Y140.359 E.00962
G1 X134.984 Y139.892 E.01693
M204 S10000
G1 X140.113 Y133.718 F42000
; LINE_WIDTH: 0.527982
G1 F12000
M204 S6000
G1 X139.981 Y133.932 E.00997
; LINE_WIDTH: 0.484785
G1 X139.848 Y134.147 E.00908
; LINE_WIDTH: 0.421514
G3 X139.035 Y135.481 I-33.987 J-19.821 E.0482
G3 X137.784 Y137.056 I-12.152 J-8.365 E.06209
; LINE_WIDTH: 0.444834
G1 X137.654 Y137.225 E.00698
; LINE_WIDTH: 0.49452
G1 X137.524 Y137.394 E.00785
; LINE_WIDTH: 0.544207
G1 X137.395 Y137.563 E.00871
G1 X137.208 Y137.704 E.00956
; LINE_WIDTH: 0.49452
G1 X137.021 Y137.844 E.00861
; LINE_WIDTH: 0.433237
G2 X135.809 Y138.833 I41.646 J52.275 E.04973
; LINE_WIDTH: 0.485235
G1 X135.742 Y138.904 E.00352
; LINE_WIDTH: 0.526045
G1 X135.675 Y138.974 E.00384
; LINE_WIDTH: 0.566855
G1 X135.608 Y139.045 E.00417
G1 X135.699 Y139.03 E.00394
; LINE_WIDTH: 0.526045
G1 X135.79 Y139.016 E.00363
; LINE_WIDTH: 0.485235
G1 X135.881 Y139.001 E.00333
; LINE_WIDTH: 0.422468
G1 X136.172 Y139.052 E.00915
G1 X137.105 Y139.402 E.03082
G1 X137.326 Y139.223 E.0088
G1 X137.697 Y138.187 E.03404
; LINE_WIDTH: 0.438888
G1 X137.706 Y138.132 E.00178
; LINE_WIDTH: 0.476683
G1 X137.716 Y138.078 E.00195
; LINE_WIDTH: 0.514478
G1 X137.725 Y138.024 E.00212
; LINE_WIDTH: 0.552273
G1 X137.735 Y137.969 E.00229
G1 X137.837 Y137.931 E.00454
; LINE_WIDTH: 0.514478
G1 X137.94 Y137.894 E.0042
; LINE_WIDTH: 0.476683
G1 X138.043 Y137.856 E.00386
; LINE_WIDTH: 0.420398
G1 X138.145 Y137.818 E.00336
G1 X138.405 Y137.84 E.00803
G1 X138.896 Y138.148 E.01781
G1 X138.934 Y138.143 E.00119
G1 X139.343 Y137.672 E.01918
G1 X139.317 Y137.306 E.01128
G1 X139.412 Y137.086 E.00738
G2 X140.167 Y135.998 I-13.516 J-10.178 E.04075
G1 X140.161 Y134.468 E.04706
; LINE_WIDTH: 0.439
G1 X140.14 Y134.172 E.00957
; LINE_WIDTH: 0.47702
G1 X140.12 Y133.876 E.01049
; LINE_WIDTH: 0.509418
G1 X140.118 Y133.827 E.00188
; LINE_WIDTH: 0.536193
G1 X140.116 Y133.778 E.00198
M204 S10000
G1 X139.761 Y135.088 F42000
; LINE_WIDTH: 0.474437
G1 F12000
M204 S6000
G3 X138.638 Y136.7 I-14.965 J-9.232 E.0691
; LINE_WIDTH: 0.509643
G1 X138.379 Y137.025 E.01585
; LINE_WIDTH: 0.555333
G3 X138.099 Y137.373 I-2.447 J-1.682 E.01867
G1 X138.544 Y137.415 E.01868
G1 X138.858 Y137.549 E.01424
G1 X138.878 Y137.22 E.01379
; LINE_WIDTH: 0.540988
G1 X138.979 Y137.033 E.00859
; LINE_WIDTH: 0.485229
G1 X139.08 Y136.847 E.00763
G1 X139.514 Y136.251 E.02658
; LINE_WIDTH: 0.470434
G1 X139.765 Y135.878 E.01566
G1 X139.762 Y135.148 E.02543
M204 S10000
G1 X137.33 Y138.055 F42000
; LINE_WIDTH: 0.43861
G1 F12000
M204 S6000
G3 X136.503 Y138.764 I-13.038 J-14.391 E.03511
G1 X137.012 Y138.955 E.01752
G2 X137.311 Y138.112 I-42.766 J-15.641 E.02882
M204 S10000
G1 X137.032 Y136.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X135.83 Y137.824 I-20 J-20.696 E.05398
G1 X135.207 Y137.727 E.02092
G1 X134.552 Y137.242 E.02705
G2 X132.586 Y136.618 I-1.454 J1.172 E.07247
G1 X131.931 Y137.103 E.02705
G3 X129.966 Y137.727 I-1.454 J-1.172 E.07247
G1 X129.311 Y137.242 E.02705
G2 X127.345 Y136.618 I-1.454 J1.172 E.07247
G2 X126.035 Y137.647 I8.624 J12.325 E.05531
G1 X125.38 Y137.829 E.02255
G1 X125.216 Y137.804 E.00548
G1 X126.543 Y139.971 E.0843
G1 X126.69 Y139.862 E.00608
G3 X128.655 Y139.238 I1.454 J1.172 E.07247
G3 X129.966 Y140.268 I-8.627 J12.328 E.05531
G2 X130.796 Y140.248 I.395 J-.827 E.02858
G2 X132.586 Y139.318 I-.318 J-2.802 E.06844
G1 X133.241 Y139.137 E.02255
G1 X133.679 Y139.205 E.01468
G2 X135.078 Y138.374 I-12.499 J-22.66 E.05398
M204 S10000
G1 X126.21 Y140.297 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41211
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X124.338 Y137.239 E.19483
G1 X124.228 Y137.307 E.00703
G1 X123.49 Y136.737 E.05066
G1 X125.711 Y140.368 E.23133
G1 X125.286 Y140.558 E.02533
G1 X122.755 Y136.422 E.2635
G1 X122.676 Y136.411 E.00436
G1 X122.263 Y136.503 E.02298
G1 X124.788 Y140.629 E.26288
G1 X124.469 Y140.656 E.01736
G1 X124.134 Y140.446 E.02149
G1 X122.096 Y137.115 E.21222
G1 X121.703 Y137.359 E.02511
G1 X123.229 Y139.853 E.1589
G1 X122.424 Y139.231 E.05526
G1 X122.297 Y139.215 E.00696
G1 X121.31 Y137.602 E.10278
G1 X121.291 Y137.614 E.00122
G1 X121.063 Y137.363 E.01838
G1 X120.755 Y137.581 E.0205
G1 X121.772 Y139.243 E.10591
G1 X121.412 Y139.54 E.02536
G1 X118.102 Y134.131 E.34462
G1 X117.395 Y133.826 E.04189
G1 X117.38 Y133.835 E.00097
G1 X120.676 Y139.222 E.34322
G1 X119.14 Y137.596 E.12154
G1 X114.513 Y130.036 E.48173
G1 X114.072 Y130.2 E.02559
G1 X118.424 Y137.313 E.45322
G1 X118.07 Y137.619 E.02545
G1 X111.795 Y127.364 E.65336
G2 X111.785 Y128.233 I8.698 J.535 E.04725
G1 X120.412 Y142.332 E.8983
G3 X119.581 Y141.859 I4.329 J-8.57 E.05201
G1 X111.828 Y129.188 E.80727
G2 X111.94 Y130.258 I10.782 J-.594 E.05846
G1 X118.679 Y141.271 E.70171
G3 X117.661 Y140.493 I10.218 J-14.42 E.06965
G1 X111.859 Y131.011 E.60416
M106 S196.35
M204 S10000
G1 X133.501 Y116.71 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G2 X131.996 Y116.09 I-11.66 J26.168 E.05398
G1 X131.931 Y116.138 E.00268
G3 X129.966 Y116.762 I-1.454 J-1.172 E.07247
G1 X129.311 Y116.277 E.02705
G2 X127.345 Y115.653 I-1.454 J1.172 E.07247
G1 X126.69 Y116.138 E.02705
G3 X124.724 Y116.762 I-1.454 J-1.172 E.07247
G3 X123.893 Y116.13 I5.28 J-7.812 E.03466
G2 X119.183 Y119.053 I4.416 J12.371 E.18528
G2 X120.793 Y119.383 I1.101 J-1.282 E.05695
G1 X121.449 Y118.897 E.02705
G3 X123.414 Y118.273 I1.454 J1.172 E.07247
G1 X124.069 Y118.759 E.02705
G2 X126.035 Y119.383 I1.454 J-1.172 E.07247
G1 X126.69 Y118.897 E.02705
G3 X128.655 Y118.273 I1.454 J1.172 E.07247
G1 X129.311 Y118.759 E.02705
G2 X131.276 Y119.383 I1.454 J-1.172 E.07247
G1 X131.931 Y118.897 E.02705
G3 X133.897 Y118.273 I1.454 J1.172 E.07247
G1 X134.552 Y118.759 E.02705
G2 X136.517 Y119.383 I1.454 J-1.172 E.07247
G1 X136.878 Y119.115 E.01488
G3 X138.305 Y120.82 I-12.288 J11.744 E.07379
G1 X137.828 Y120.894 E.01604
G1 X137.172 Y121.379 E.02705
G3 X135.207 Y122.003 I-1.454 J-1.172 E.07247
G1 X134.552 Y121.518 E.02705
G2 X132.586 Y120.894 I-1.454 J1.172 E.07247
G1 X131.931 Y121.379 E.02705
G3 X129.966 Y122.003 I-1.454 J-1.172 E.07247
G1 X129.311 Y121.518 E.02705
G2 X127.345 Y120.894 I-1.454 J1.172 E.07247
G1 X126.69 Y121.379 E.02705
G3 X124.724 Y122.003 I-1.454 J-1.172 E.07247
G1 X124.069 Y121.518 E.02705
G2 X122.104 Y120.894 I-1.454 J1.172 E.07247
G1 X121.449 Y121.379 E.02705
G3 X119.483 Y122.003 I-1.454 J-1.172 E.07247
G1 X119.244 Y121.826 E.00988
G1 X119.163 Y121.875 E.00314
G1 X120.829 Y124.598 E.10587
G1 X121.449 Y124.138 E.02559
G3 X123.414 Y123.515 I1.454 J1.172 E.07247
G1 X124.069 Y124 E.02705
G2 X126.035 Y124.624 I1.454 J-1.172 E.07247
G1 X126.69 Y124.138 E.02705
G3 X128.655 Y123.515 I1.454 J1.172 E.07247
G1 X129.311 Y124 E.02705
G2 X131.276 Y124.624 I1.454 J-1.172 E.07247
G1 X131.931 Y124.138 E.02705
G3 X133.897 Y123.515 I1.454 J1.172 E.07247
G1 X134.552 Y124 E.02705
G2 X136.517 Y124.624 I1.454 J-1.172 E.07247
G1 X137.172 Y124.138 E.02705
G3 X139.138 Y123.515 I1.454 J1.172 E.07247
G3 X139.948 Y124.129 I-5.129 J7.608 E.03374
G2 X139.349 Y122.616 I-12.644 J4.134 E.05401
M204 S10000
G1 X142.556 Y120.801 F42000
G1 F15476.087
M204 S6000
G2 X141.762 Y119.38 I-15.889 J7.946 E.054
G1 X141.411 Y119.437 E.0118
G1 X140.561 Y118.048 E.05401
M204 S10000
G1 X136.439 Y113.916 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41233
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X144.15 Y126.518 E.8038
G2 X144.007 Y125.399 I-19.992 J1.983 E.0614
G1 X137.602 Y114.931 E.66769
G3 X138.663 Y115.779 I-7.976 J11.062 E.07397
G1 X144.067 Y124.61 E.56326
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X143.023 Y122.905 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/32
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.4 I-.49 J-1.114 P1  F42000
G1 X113.424 Y135.938 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X120.431 Y113.237 I14.567 J-7.936 E.87845
G3 X128.717 Y111.43 I7.577 J14.843 E.28445
G3 X113.453 Y135.99 I-.726 J16.572 E2.29244
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X119.501 Y113.279 I14.924 J-8.13 E.87185
G3 X128.737 Y111.023 I8.482 J14.69 E.31967
G3 X113.096 Y136.185 I-.746 J16.979 E2.34871
M204 S250
G1 X112.722 Y136.32 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X119.305 Y112.94 I15.269 J-8.318 E.82624
G3 X128.757 Y110.632 I8.678 J15.03 E.30302
G3 X112.751 Y136.372 I-.766 J17.37 E2.22578
; WIPE_START
M204 S6000
G1 X112.332 Y135.545 E-.35233
G1 X111.976 Y134.755 E-.32947
G1 X111.9 Y134.563 E-.0782
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


G1 X118.593 Y133.214 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.187 Y133.269 E.0136
G1 X118.965 Y132.332 E.04041
G3 X118.173 Y131.556 I4.144 J-5.025 E.03685
G2 X116.535 Y131.369 I-.993 J1.437 E.05695
G2 X116.035 Y131.821 I2.391 J3.151 E.02237
G3 X115.598 Y129.986 I19.704 J-5.666 E.06259
G2 X116.207 Y129.595 I-.28 J-1.108 E.02445
G1 X116.862 Y128.935 E.03084
G3 X118.5 Y128.748 I.993 J1.437 E.05695
G3 X119.124 Y129.324 I-3.055 J3.933 E.02818
G1 X118.568 Y129.994 E.02887
G1 X119.267 Y130.285 E.02515
M204 S10000
G1 X123.518 Y132.034 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40869
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X132.665 Y121.02 E.76519
G1 X131.509 Y121.859 E.07633
G1 X131.347 Y121.889 E.00879
G1 X123.295 Y131.585 E.67365
G1 X122.988 Y131.33 E.02132
G1 X122.882 Y131.457 E.00881
G1 X122.818 Y131.44 E.00353
G1 X130.665 Y121.992 E.65645
G1 X130.141 Y121.905 E.02841
G1 X126.672 Y126.082 E.29019
M106 S196.35
M204 S10000
G1 X126.39 Y126.422 F42000
M106 S255
G1 F3000
M204 S6000
G1 X122.038 Y131.662 E.3641
M106 S196.35
M204 S10000
G1 X120.856 Y132.367 F42000
M106 S255
G1 F3000
M204 S6000
G1 X129.766 Y121.638 E.74544
G3 X129.4 Y121.361 I11.49 J-15.563 E.02454
G1 X120.084 Y132.578 E.77935
G1 X119.412 Y132.67 E.03627
G1 X129.046 Y121.07 E.80593
G1 X128.651 Y120.827 E.02476
G1 X120.94 Y130.112 E.64507
G1 X120.395 Y130.051 E.02935
G1 X128.127 Y120.74 E.64689
G1 X127.709 Y120.798 E.02257
G1 X127.139 Y121.212 E.03764
G1 X119.849 Y129.99 E.6099
G3 X119.361 Y129.86 I-.021 J-.902 E.02737
G1 X125.959 Y121.915 E.55196
G1 X125.464 Y121.999 E.0268
G1 X125.315 Y121.972 E.0081
G1 X122.331 Y125.566 E.24967
G1 X121.728 Y125.573 E.03221
M73 P68 R6
G1 X124.946 Y121.699 E.26916
M106 S196.35
M204 S10000
G1 X122.265 Y116.823 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G3 X123.759 Y116.179 I12.097 J26.003 E.05398
G2 X124.397 Y116.769 I3.774 J-3.438 E.02887
G2 X126.035 Y116.583 I.645 J-1.624 E.05695
G3 X127.017 Y115.645 I5.976 J5.28 E.04511
G3 X128.655 Y115.832 I.644 J1.624 E.05695
G1 X129.311 Y116.491 E.03084
G2 X129.966 Y116.901 I.94 J-.776 E.02607
G2 X131.82 Y116.035 I.148 J-2.101 E.07086
G3 X133.334 Y116.629 I-7.847 J22.233 E.05398
M204 S10000
G1 X134.004 Y121.562 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40869
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X130.212 Y126.127 E.31716
G1 X129.745 Y125.971 E.02631
G1 X133.994 Y120.855 E.35543
G1 X133.503 Y120.729 E.0271
G1 X124.005 Y132.165 E.79461
G2 X124.372 Y132.442 I10.589 J-13.673 E.02454
G1 X129.294 Y126.515 E.4118
G1 X129.653 Y126.8 E.02452
G1 X125.103 Y132.279 E.38066
G1 X125.295 Y132.593 E.01968
G1 X125.471 Y132.554 E.00964
G1 X133.024 Y123.459 E.6319
G1 X133.274 Y123.666 E.01736
G1 X132.537 Y124.554 E.06165
G1 X132.537 Y124.763 E.0112
G1 X126.765 Y131.713 E.48286
G1 X127.136 Y131.446 E.02441
G1 X127.618 Y131.404 E.02588
G1 X132.042 Y126.077 E.37011
G1 X132.329 Y126.45 E.02513
G1 X128.164 Y131.465 E.34845
G1 X128.42 Y131.536 E.01422
G1 X128.597 Y131.662 E.01158
G1 X133.296 Y126.004 E.39315
G1 X133.33 Y125.988 E.002
G1 X133.771 Y126.037 E.02371
G1 X133.84 Y126.066 E.00402
G1 X128.963 Y131.939 E.40805
G2 X129.322 Y132.225 I2.908 J-3.287 E.02453
G1 X134.255 Y126.285 E.41271
G2 X134.611 Y126.575 I6.303 J-7.374 E.02452
G1 X129.7 Y132.487 E.41082
G1 X129.861 Y132.589 E.01018
G1 X130.171 Y132.638 E.0168
G1 X134.974 Y126.855 E.4018
G1 X135.218 Y127.036 E.01624
G1 X135.376 Y127.088 E.0089
G1 X130.874 Y132.51 E.37669
G1 X130.939 Y132.494 E.0036
G1 X132.288 Y131.525 E.0888
G1 X135.873 Y127.208 E.29991
G1 X136.488 Y127.186 E.03287
G1 X132.81 Y131.615 E.3077
M106 S196.35
M204 S10000
G1 X142.925 Y133.444 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G3 X142.311 Y134.898 I-22.054 J-8.452 E.05233
G1 X142.288 Y134.943 E.00168
G2 X142.986 Y134.26 I-3.646 J-4.425 E.03242
G2 X143.894 Y131.332 I-20.241 J-7.883 E.10177
G2 X143.549 Y131.25 I-.269 J.359 E.01211
G2 X143.867 Y128.786 I-16.934 J-3.443 E.08246
G1 X143.871 Y128.63 E.0052
G1 X144.227 Y128.621 E.01179
G2 X144.139 Y126.204 I-26.237 J-.259 E.08026
G1 X143.759 Y126.029 E.01387
G2 X143.262 Y123.605 I-14.383 J1.687 E.08218
G1 X143.589 Y123.454 E.01193
G3 X143.965 Y125.038 I-16.152 J4.679 E.054
M204 S10000
G1 X142.981 Y122.721 F42000
G1 F15476.087
M204 S6000
G1 X142.93 Y122.571 E.00526
G2 X142.363 Y121.216 I-21.64 J8.267 E.04875
G2 X142.634 Y120.952 I-1.217 J-1.522 E.01255
G2 X141.834 Y119.491 I-19.433 J9.687 E.05527
G3 X141.425 Y119.513 I-.23 J-.465 E.01395
G2 X137.822 Y115.516 I-13.274 J8.343 E.17939
G1 X138.397 Y115.528 E.01906
G2 X136.62 Y114.239 I-17.431 J22.155 E.07283
G1 X136.517 Y114.28 E.00367
G1 X135.948 Y114.244 E.01892
G2 X134.98 Y113.734 I-12.228 J22.012 E.0363
G2 X133.897 Y112.893 I-2.098 J1.586 E.04602
G1 X133.242 Y112.909 E.02174
G3 X133.055 Y112.939 I-.114 J-.114 E.00671
G2 X123.065 Y112.902 I-5.051 J15.131 E.33705
G1 X122.759 Y112.909 E.01015
G1 X122.038 Y113.278 E.02687
G2 X120.072 Y114.233 I6.539 J15.958 E.07255
G1 X119.682 Y114.054 E.01421
G2 X117.571 Y115.555 I12.407 J19.689 E.08597
G1 X117.928 Y115.719 E.01302
G2 X114.653 Y119.393 I10.103 J12.304 E.16392
G1 X114.327 Y119.243 E.0119
G2 X113.193 Y121.337 I21.294 J12.883 E.07902
G1 X113.461 Y121.606 E.01261
G1 X113.363 Y121.824 E.00793
G2 X112.801 Y123.379 I19.039 J7.751 E.05485
G1 X112.43 Y123.388 E.01233
G2 X111.886 Y126.003 I22.059 J5.952 E.08864
G1 X112.243 Y126.012 E.01184
G1 X112.193 Y126.413 E.01341
G2 X112.13 Y128.701 I17.49 J1.62 E.07597
G1 X111.782 Y128.861 E.01273
G2 X112.087 Y131.249 I30.768 J-2.717 E.07989
G3 X112.473 Y131.345 I.083 J.495 E.01356
G2 X113.304 Y134.028 I14.77 J-3.106 E.09333
G2 X112.857 Y133.86 I-.637 J1.018 E.01596
G2 X115.037 Y137.785 I16.929 J-6.835 E.14931
G1 X115.368 Y137.633 E.01208
G2 X116.925 Y139.389 I12.432 J-9.45 E.07792
G2 X116.659 Y139.627 I.738 J1.09 E.01187
G2 X120.953 Y142.628 I11.432 J-11.785 E.17453
G1 X121.218 Y142.362 E.01246
G1 X121.461 Y142.479 E.00896
G2 X134.395 Y142.54 I6.535 J-14.519 E.44179
G2 X134.68 Y142.805 I1.811 J-1.664 E.01293
G2 X139.609 Y139.353 I-7.314 J-15.686 E.20063
G2 X139.297 Y139.164 I-.439 J.372 E.0123
G2 X140.448 Y137.866 I-11.949 J-11.76 E.05757
G1 X140.909 Y137.855 E.0153
G2 X141.831 Y136.513 I-16.725 J-12.478 E.05401
M204 S10000
G1 X140.31 Y137.407 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G2 X139.826 Y138.009 I-12.309 J-9.406 E2.96707
G1 X140.273 Y137.454 E.02191
M204 S10000
G1 X143.099 Y127.271 F42000
G1 F12000
M204 S6000
G2 X143.095 Y128.81 I-15.098 J.722 E2.87077
G2 X143.101 Y127.331 I-14.818 J-.802 E.04546
M204 S10000
G1 X142.722 Y127.281 F42000
G1 F12000
M204 S6000
G2 X142.719 Y128.782 I-14.721 J.712 E2.79914
G2 X142.724 Y127.341 I-14.436 J-.774 E.0443
M204 S10000
G1 X142.37 Y127.289 F42000
; LINE_WIDTH: 0.369917
G1 F12000
M204 S6000
G2 X142.368 Y128.755 I-14.369 J.704 E2.36944
G2 X142.372 Y127.349 I-14.089 J-.747 E.03748
M204 S10000
G1 X118.956 Y137.275 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G3 X128.961 Y115.092 I9.039 J-9.271 E.97215
G3 X119 Y137.316 I-.962 J12.913 E1.52613
M204 S10000
G1 X118.691 Y137.544 F42000
G1 F12000
M204 S6000
G3 X128.992 Y114.717 I9.304 J-9.539 E1.00048
G3 X118.735 Y137.585 I-.993 J13.289 E1.57057
M204 S10000
G1 X118.427 Y137.813 F42000
G1 F12000
M204 S6000
G3 X129.023 Y114.341 I9.569 J-9.808 E1.02882
G3 X118.471 Y137.854 I-1.024 J13.665 E1.61501
M204 S10000
G1 X118.18 Y138.064 F42000
; LINE_WIDTH: 0.36979
G1 F12000
M204 S6000
G3 X119.26 Y139.014 I9.815 J-10.066 E2.31451
G3 X118.224 Y138.105 I8.59 J-10.835 E.03673
M204 S10000
G1 X121.032 Y138.449 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G2 X122.441 Y139.262 I12.49 J-20.02 E.05398
G1 X122.759 Y139.116 E.01161
G1 X123.414 Y139.1 E.02174
G3 X124.667 Y140.111 I-1.209 J2.78 E.05406
G2 X126.183 Y140.427 I3.44 J-12.713 E.05141
G2 X127.345 Y139.418 I-1.659 J-3.082 E.05146
G3 X128.983 Y139.231 I.993 J1.437 E.05695
G3 X129.966 Y140.169 I-4.994 J6.218 E.04511
G2 X130.796 Y140.248 I.469 J-.529 E.0296
G2 X132.154 Y139.853 I-3.249 J-13.709 E.04693
G3 X133.876 Y139.1 I1.574 J1.255 E.06487
G1 X134.034 Y139.015 E.00594
G2 X135.794 Y137.851 I-8.952 J-15.461 E.07002
G3 X134.552 Y137.457 I-.293 J-1.228 E.04542
G1 X133.897 Y136.797 E.03084
G2 X132.259 Y136.61 I-.993 J1.437 E.05695
G2 X131.276 Y137.548 I4.994 J6.218 E.04511
G3 X129.638 Y137.735 I-.993 J-1.437 E.05695
G3 X128.655 Y136.797 I4.993 J-6.217 E.04511
G2 X127.017 Y136.61 I-.993 J1.437 E.05695
G2 X126.035 Y137.548 I4.993 J6.218 E.04511
G3 X124.397 Y137.735 I-.993 J-1.437 E.05695
G3 X123.414 Y136.797 I4.994 J-6.218 E.04511
G2 X121.776 Y136.61 I-.993 J1.437 E.05695
G2 X120.793 Y137.548 I4.994 J6.218 E.04511
G1 X120.179 Y137.831 E.02244
M73 P69 R6
G3 X117.022 Y134.103 I8.431 J-10.341 E.16297
G3 X118.828 Y134.268 I.81 J1.106 E.06574
G1 X119.483 Y134.927 E.03084
G2 X121.121 Y135.114 I.993 J-1.437 E.05695
G2 X122.104 Y134.176 I-4.993 J-6.218 E.04511
G3 X123.742 Y133.99 I.993 J1.437 E.05695
G3 X124.724 Y134.927 I-4.994 J6.218 E.04511
G2 X126.362 Y135.114 I.993 J-1.437 E.05695
G2 X127.345 Y134.176 I-4.994 J-6.218 E.04511
G3 X128.983 Y133.99 I.993 J1.437 E.05695
G3 X129.966 Y134.927 I-4.994 J6.219 E.04511
G2 X131.604 Y135.114 I.993 J-1.437 E.05695
G2 X132.586 Y134.176 I-4.993 J-6.218 E.04511
G3 X134.224 Y133.99 I.993 J1.437 E.05695
G3 X135.207 Y134.927 I-4.994 J6.218 E.04511
G2 X136.845 Y135.114 I.993 J-1.437 E.05695
G2 X137.828 Y134.176 I-4.993 J-6.218 E.04511
G3 X139.109 Y133.859 I1.009 J1.328 E.04503
G2 X139.793 Y132.215 I-4.717 J-2.927 E.05931
G1 X139.138 Y131.556 E.03084
G2 X137.5 Y131.369 I-.993 J1.437 E.05695
G2 X136.517 Y132.307 I4.994 J6.218 E.04511
G3 X134.879 Y132.493 I-.993 J-1.437 E.05695
G3 X133.897 Y131.556 I4.993 J-6.218 E.04511
G1 X133.553 Y131.397 E.01255
G1 X135.08 Y129.558 E.0793
G1 X135.207 Y129.686 E.00596
G2 X136.845 Y129.873 I.993 J-1.437 E.05695
G2 X137.828 Y128.935 I-4.992 J-6.217 E.04511
G3 X139.466 Y128.748 I.993 J1.437 E.05695
G3 X140.446 Y129.684 I-4.981 J6.203 E.04501
G2 X140.547 Y127.381 I-16.873 J-1.896 E.07652
G3 X139.793 Y126.974 I.141 J-1.164 E.0291
G1 X139.138 Y126.314 E.03084
G2 X137.5 Y126.128 I-.993 J1.437 E.05695
G2 X136.836 Y126.745 I3.276 J4.194 E.03011
G1 X135.811 Y126.781 E.03402
G3 X135.267 Y126.538 I.1 J-.954 E.02011
M204 S10000
G1 X140.291 Y125.412 F42000
G1 F15476.087
M204 S6000
G2 X140.005 Y124.297 I-11.314 J2.313 E.03819
G2 X139.466 Y123.507 I-.994 J.099 E.03309
G2 X137.828 Y123.694 I-.644 J1.624 E.05695
G3 X136.845 Y124.631 I-5.976 J-5.28 E.04511
G3 X135.207 Y124.445 I-.644 J-1.624 E.05695
G1 X134.552 Y123.785 E.03084
G2 X133.897 Y123.376 I-.94 J.776 E.02607
G3 X133.378 Y123.196 I-.156 J-.387 E.01987
G1 X134.303 Y121.483 E.06458
G2 X134.879 Y122.011 I3.378 J-3.106 E.02596
G2 X136.517 Y121.824 I.644 J-1.624 E.05695
G1 X137.172 Y121.164 E.03084
G3 X138.267 Y120.766 I.895 J.758 E.04043
G2 X137.009 Y119.25 I-14.638 J10.864 E.06536
G1 X136.845 Y119.39 E.00716
G3 X135.207 Y119.203 I-.644 J-1.624 E.05695
G2 X134.224 Y118.266 I-5.975 J5.279 E.04511
G2 X132.586 Y118.452 I-.644 J1.624 E.05695
G3 X131.604 Y119.39 I-5.975 J-5.279 E.04511
G3 X129.966 Y119.203 I-.645 J-1.624 E.05695
G2 X128.983 Y118.266 I-5.975 J5.28 E.04511
G2 X127.345 Y118.452 I-.644 J1.624 E.05695
G3 X126.362 Y119.39 I-5.975 J-5.28 E.04511
G3 X124.724 Y119.203 I-.644 J-1.624 E.05695
G2 X123.742 Y118.266 I-5.975 J5.279 E.04511
G2 X122.104 Y118.452 I-.644 J1.624 E.05695
G3 X121.121 Y119.39 I-5.975 J-5.279 E.04511
G3 X119.483 Y119.203 I-.645 J-1.624 E.05695
G1 X119.259 Y118.978 E.01054
G2 X117.677 Y120.845 I9.179 J9.387 E.0813
G1 X118.173 Y121.073 E.01812
G2 X119.155 Y122.011 I5.977 J-5.281 E.04511
G2 X120.793 Y121.824 I.644 J-1.624 E.05695
G3 X121.776 Y120.886 I5.977 J5.281 E.04511
G3 X123.414 Y121.073 I.644 J1.624 E.05695
G2 X124.237 Y121.875 I5.102 J-4.412 E.03816
G1 X122.982 Y123.386 E.06517
G1 X122.759 Y123.392 E.0074
G1 X122.104 Y123.694 E.02393
G3 X121.121 Y124.631 I-5.976 J-5.28 E.04511
G3 X119.483 Y124.445 I-.645 J-1.624 E.05695
G2 X118.5 Y123.507 I-5.975 J5.279 E.04511
G2 X116.862 Y123.694 I-.644 J1.624 E.05695
G3 X115.908 Y124.607 I-5.821 J-5.127 E.04387
G2 X115.473 Y127.102 I12.104 J3.395 E.08413
G2 X116.535 Y126.128 I-32.854 J-36.878 E.04779
G3 X118.173 Y126.314 I.644 J1.624 E.05695
G2 X119.155 Y127.252 I5.977 J-5.281 E.04511
G2 X120.793 Y127.065 I.644 J-1.624 E.05695
G2 X121.884 Y126 I-105.229 J-108.861 E.05059
G1 X120.8 Y126.014 E.03598
G1 X121.042 Y125.722 E.01258
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X120.8 Y126.014 E-.14411
G1 X121.884 Y126 E-.41216
G1 X121.501 Y126.374 E-.20373
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/32
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
M106 S186.15
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-.93 J-.785 P1  F42000
G1 X113.424 Y135.937 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X121.177 Y112.878 I14.567 J-7.936 E.9059
G3 X128.644 Y111.426 I6.806 J15.083 E.25462
G3 X113.453 Y135.99 I-.653 J16.575 E2.29488
M204 S10000
G1 X113.067 Y136.132 F42000
G1 F5400
M204 S6000
G3 X120.245 Y112.874 I14.924 J-8.13 E.89996
G3 X128.664 Y111.02 I7.766 J15.218 E.2891
G3 X113.096 Y136.184 I-.673 J16.982 E2.35115
M204 S250
G1 X112.728 Y136.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.722 Y136.319 E.00018
G3 X120.066 Y112.525 I15.269 J-8.318 E.85288
G3 X128.684 Y110.628 I7.945 J15.568 E.2741
G3 X113.156 Y137.071 I-.693 J17.374 E2.20325
G1 X112.757 Y136.369 E.0248
; WIPE_START
M204 S6000
G1 X112.722 Y136.319 E-.02307
G1 X112.332 Y135.545 E-.32949
G1 X111.976 Y134.755 E-.32947
G1 X111.901 Y134.564 E-.07798
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


G1 X115.279 Y132.26 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40388
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X119.086 Y137.753 E.34886
G1 X119.249 Y137.904 E.01159
G2 X120.344 Y138.771 I10.824 J-12.543 E.07294
G1 X115.228 Y131.389 E.46883
G1 X115.194 Y131.27 E.00648
G3 X114.977 Y130.23 I18.56 J-4.426 E.05546
G1 X121.343 Y139.416 E.58341
G1 X121.385 Y139.442 E.00255
G2 X122.216 Y139.88 I9.864 J-17.726 E.04906
G1 X114.843 Y129.24 E.67567
G3 X114.793 Y128.37 I8.865 J-.954 E.04551
G1 X123.017 Y140.238 E.75368
G1 X123.164 Y140.3 E.00833
G2 X123.764 Y140.519 I4.648 J-11.813 E.03332
G1 X114.794 Y127.575 E.82199
G1 X114.837 Y126.841 E.0384
G1 X124.465 Y140.734 E.88231
G2 X125.133 Y140.9 I2.097 J-7.001 E.03591
G1 X114.915 Y126.157 E.93633
G1 X114.93 Y126.038 E.00626
G3 X115.022 Y125.514 I9.752 J1.443 E.02776
G1 X125.772 Y141.026 E.98513
G2 X126.387 Y141.117 I1.379 J-7.178 E.03249
G1 X115.154 Y124.907 E1.02946
G1 X115.19 Y124.746 E.00864
G3 X115.307 Y124.331 I9.062 J2.318 E.02248
G1 X126.981 Y141.177 E1.06981
G1 X127.005 Y141.179 E.00129
G2 X127.554 Y141.207 I.863 J-11.638 E.02867
G1 X115.479 Y123.782 E1.10657
G3 X115.667 Y123.258 I5.509 J1.686 E.02911
G1 X119.918 Y129.391 E.3895
G1 X120.219 Y129.029 E.02459
G1 X115.871 Y122.755 E.39841
G1 X116.089 Y122.273 E.02764
G1 X120.52 Y128.666 E.40604
G1 X120.821 Y128.304 E.02459
G1 X116.323 Y121.814 E.41213
G1 X116.389 Y121.687 E.00748
G3 X116.57 Y121.373 I6.278 J3.407 E.01891
G1 X121.122 Y127.941 E.41715
G1 X121.423 Y127.579 E.02459
G1 X116.827 Y120.947 E.42119
G3 X117.094 Y120.535 I5.135 J3.042 E.02561
G1 X121.724 Y127.216 E.4243
G1 X122.025 Y126.854 E.02459
G1 X117.375 Y120.144 E.42612
G1 X117.46 Y120.026 E.0076
G3 X117.666 Y119.767 I5.165 J3.898 E.01727
G1 X122.326 Y126.491 E.42704
G1 X122.536 Y126.238 E.01719
G1 X122.701 Y126.236 E.0086
G1 X117.965 Y119.402 E.43398
G1 X118.275 Y119.052 E.0244
G1 X123.275 Y126.267 E.45822
G1 X123.966 Y126.468 E.03759
G1 X123.153 Y125.294 E.07454
G1 X123.845 Y125.496 E.03759
M73 P70 R6
G1 X124.146 Y125.93 E.02759
G1 X124.052 Y126.253 E.01754
G1 X124.554 Y126.519 E.02967
G1 X124.81 Y126.889 E.02349
M106 S186.15
M204 S10000
G1 X125.042 Y126.426 F42000
M106 S255
G1 F3000
M204 S6000
G1 X125.254 Y126.732 E.01942
G1 X125.85 Y126.795 E.03127
G1 X125.463 Y126.237 E.03546
G1 X125.764 Y125.874 E.02459
G1 X126.445 Y126.858 E.06247
G1 X126.89 Y126.905 E.02333
G1 X126.99 Y126.846 E.00603
G1 X126.065 Y125.512 E.08476
G1 X126.176 Y125.377 E.00912
G1 X126.524 Y125.377 E.01814
G1 X127.383 Y126.617 E.0787
G1 X127.597 Y126.491 E.01295
G1 X128.007 Y126.721 E.02454
G1 X127.261 Y125.645 E.06833
G1 X127.654 Y125.415 E.02376
G1 X128.909 Y127.225 E.11496
G1 X129.179 Y127.377 E.01619
G1 X129.352 Y127.068 E.01846
G1 X128.189 Y125.39 E.10655
G1 X128.473 Y125.31 E.01536
G1 X128.75 Y125.402 E.01526
G1 X130.019 Y127.234 E.11631
G1 X130.32 Y126.871 E.02459
G1 X129.468 Y125.641 E.07809
G1 X130.019 Y125.825 E.03032
G1 X130.089 Y125.741 E.00572
G1 X130.621 Y126.509 E.04877
G1 X130.922 Y126.146 E.02459
G1 X130.39 Y125.378 E.04877
G1 X130.543 Y125.194 E.01253
G1 X131.182 Y125.724 E.04331
G1 X131.343 Y125.956 E.01478
M106 S186.15
M204 S10000
G1 X131.527 Y125.425 F42000
M106 S255
G1 F3000
M204 S6000
G1 X132.391 Y126.671 E.07914
G1 X132.809 Y126.478 E.02405
G1 X131.948 Y125.236 E.07888
G1 X132.249 Y124.873 E.02459
G1 X133.226 Y126.284 E.08959
G1 X133.367 Y126.219 E.00811
G1 X133.714 Y126.257 E.01819
G1 X133.779 Y126.285 E.00369
G1 X132.427 Y124.334 E.12388
G1 X132.728 Y123.971 E.02459
G1 X135.223 Y127.571 E.22863
M106 S186.15
M204 S10000
G1 X126.957 Y130.784 F42000
M106 S255
G1 F3000
M204 S6000
G1 X126.186 Y129.67 E.07071
M106 S186.15
M204 S10000
G1 X122.503 Y130.329 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41394
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X122.605 Y130.206 E.00483
M204 S10000
G1 X124.8 Y128.629 F42000
; LINE_WIDTH: 0.44383
G1 F15000
M204 S6000
G1 X124.429 Y128.589 E.01221
; LINE_WIDTH: 0.424313
G1 X124.118 Y128.492 E.01012
; LINE_WIDTH: 0.377363
G2 X123.326 Y128.26 I-4.175 J12.793 E.02248
G1 X123.158 Y128.463 E.00716
G1 X123.381 Y128.603 E.00716
G1 X124.021 Y128.817 E.01839
; LINE_WIDTH: 0.39823
G1 X124.182 Y128.905 E.00532
; LINE_WIDTH: 0.440409
G3 X124.434 Y129.07 I-.299 J.736 E.00981
G1 X124.762 Y128.675 E.01662
M204 S10000
G1 X125.836 Y128.347 F42000
; LINE_WIDTH: 0.41999
M73 P70 R5
G1 F15000
M204 S6000
G1 X124.471 Y128.203 E.04217
G3 X123.202 Y127.855 I4.481 J-18.82 E.04044
G1 X122.592 Y128.589 E.02935
G1 X123.059 Y128.789 E.01561
G1 X123.247 Y128.997 E.0086
G1 X123.619 Y129.041 E.01153
G1 X124.05 Y129.258 E.01481
G1 X124.485 Y129.617 E.01734
G1 X125.215 Y128.738 E.03512
G1 X125.785 Y128.379 E.0207
M204 S10000
G1 X128.309 Y127.363 F42000
G1 F15000
M204 S6000
G1 X127.601 Y126.968 E.0249
G1 X127.035 Y127.299 E.02016
G1 X126.92 Y127.324 E.00361
G1 X124.594 Y127.078 E.07186
G3 X123.092 Y126.645 I49.857 J-175.508 E.04804
G1 X122.732 Y126.649 E.01105
G1 X120.437 Y129.413 E.11039
G1 X122.231 Y129.613 E.05546
G1 X122.369 Y129.699 E.005
G1 X122.394 Y129.841 E.00441
G3 X121.901 Y130.468 I-9.322 J-6.825 E.02454
G1 X122.096 Y130.787 E.0115
G1 X122.541 Y130.709 E.01389
G1 X122.65 Y130.737 E.00345
G1 X123.106 Y130.188 E.02193
G1 X123.276 Y130.121 E.00562
G1 X123.371 Y130.163 E.0032
G1 X124.632 Y131.21 E.05036
G1 X126.085 Y129.461 E.06988
G1 X126.25 Y129.394 E.00547
G1 X126.351 Y129.436 E.00336
G1 X127.389 Y130.299 E.04148
G1 X127.454 Y130.408 E.0039
G1 X127.414 Y130.564 E.00496
G1 X127.22 Y130.798 E.00932
G1 X127.894 Y130.74 E.02077
G3 X128.731 Y130.974 I-1.516 J7.04 E.02674
G2 X130.095 Y131.98 I12.668 J-15.748 E.05207
G1 X130.333 Y131.986 E.00733
G1 X130.666 Y131.904 E.01053
G1 X132.136 Y130.848 E.05563
G1 X132.678 Y130.781 E.01677
G1 X135.162 Y127.789 E.11949
G3 X133.876 Y126.799 I11.217 J-15.894 E.04989
G1 X133.609 Y126.662 E.00923
G1 X133.436 Y126.642 E.00534
G1 X132.272 Y127.182 E.03943
G1 X132.132 Y127.189 E.00431
G1 X132.043 Y127.126 E.00335
G1 X131.371 Y126.253 E.03386
G1 X130.121 Y127.758 E.06013
G1 X130.01 Y127.82 E.00391
G1 X129.861 Y127.782 E.00471
G1 X129.56 Y127.543 E.01181
G1 X129.402 Y127.813 E.00963
G1 X129.247 Y127.87 E.00509
G1 X128.361 Y127.392 E.03092
M204 S10000
G1 X128.124 Y127.692 F42000
; LINE_WIDTH: 0.419904
G1 F15000
M204 S6000
G1 X127.605 Y127.402 E.01827
G1 X127.173 Y127.652 E.01535
G1 X126.88 Y127.699 E.00909
G1 X124.553 Y127.453 E.07189
G3 X123.041 Y127.022 I17.645 J-64.823 E.04831
G1 X122.911 Y127.024 E.00397
G1 X121.174 Y129.116 E.08353
G1 X122.273 Y129.238 E.03396
G1 X122.606 Y129.396 E.01131
G1 X122.687 Y129.497 E.00399
G1 X122.762 Y129.921 E.01323
G1 X122.643 Y130.16 E.0082
G1 X122.817 Y129.948 E.00842
G1 X123.197 Y129.745 E.01323
G3 X123.612 Y129.873 I.054 J.563 E.01371
G1 X124.583 Y130.679 E.03877
G1 X125.795 Y129.22 E.05828
G1 X126.092 Y129.033 E.01077
G1 X126.386 Y129.037 E.00904
G1 X126.592 Y129.146 E.00715
G1 X127.63 Y130.009 E.04147
G1 X127.785 Y130.212 E.00785
G1 X127.816 Y130.368 E.00489
G1 X128.061 Y130.383 E.00755
G1 X128.77 Y130.579 E.0226
G1 X128.96 Y130.674 E.00653
G2 X130.239 Y131.62 I11.916 J-14.768 E.04889
G1 X130.57 Y131.508 E.01075
G1 X131.916 Y130.541 E.05091
G1 X132.101 Y130.454 E.00627
G1 X132.49 Y130.416 E.01203
G1 X134.618 Y127.855 E.10228
G3 X133.639 Y127.092 I8.747 J-12.227 E.03812
G1 X133.491 Y127.033 E.00492
G1 X132.431 Y127.524 E.03589
G1 X132.01 Y127.546 E.01294
G1 X131.745 Y127.356 E.01003
G1 X131.36 Y126.856 E.01937
G1 X130.414 Y127.996 E.04549
G1 X130.224 Y128.144 E.00739
G1 X129.912 Y128.196 E.00972
G1 X129.652 Y128.089 E.00865
G1 X129.408 Y128.23 E.00865
G1 X129.115 Y128.228 E.009
G1 X128.177 Y127.721 E.03274
M204 S10000
G1 X127.61 Y127.836 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X127.328 Y127.995 E.00994
; LINE_WIDTH: 0.433708
G1 X127.083 Y128.048 E.00798
; LINE_WIDTH: 0.461143
G1 X126.838 Y128.101 E.00854
; LINE_WIDTH: 0.49396
G1 F13967.719
G1 X126.504 Y128.085 E.01228
; LINE_WIDTH: 0.53216
G1 F12877.116
G1 X126.171 Y128.069 E.01332
; LINE_WIDTH: 0.529382
G1 F12950.66
G1 X125.801 Y128.008 E.01487
; LINE_WIDTH: 0.485625
G1 F14230.695
G1 X125.431 Y127.947 E.01353
; LINE_WIDTH: 0.420911
G1 F15000
G2 X124.512 Y127.828 I-1.476 J7.797 E.02855
G3 X123.07 Y127.424 I6.668 J-26.554 E.04614
G1 X121.911 Y128.819 E.05585
G1 X122.315 Y128.863 E.0125
G1 X122.816 Y129.078 E.01681
G1 X123.005 Y129.294 E.00884
G1 X123.031 Y129.439 E.00451
G1 X123.161 Y129.37 E.00451
G1 X123.514 Y129.403 E.01093
G1 X123.853 Y129.583 E.01183
G1 X124.534 Y130.148 E.02726
G1 X125.505 Y128.979 E.04682
; LINE_WIDTH: 0.433933
G1 X125.749 Y128.81 E.00946
; LINE_WIDTH: 0.461818
G1 X125.993 Y128.64 E.01013
; LINE_WIDTH: 0.494635
G1 F13946.846
G1 X126.077 Y128.608 E.00332
; LINE_WIDTH: 0.547376
G1 F12488.709
G1 X126.161 Y128.575 E.00371
G1 X126.508 Y128.612 E.01432
; LINE_WIDTH: 0.529382
G1 F12950.66
G1 X126.73 Y128.788 E.01122
; LINE_WIDTH: 0.485625
G1 F14230.695
G1 X126.952 Y128.963 E.01021
; LINE_WIDTH: 0.420361
G1 F15000
G3 X127.871 Y129.719 I-15.825 J20.206 E.03661
G1 X128.162 Y130.019 E.01286
G1 X128.872 Y130.216 E.02266
G1 X129.189 Y130.374 E.01089
G1 X130.009 Y131 E.03173
G1 X130.343 Y131.207 E.01209
G1 X131.696 Y130.235 E.05123
G1 X132.004 Y130.09 E.01046
G1 X132.303 Y130.051 E.00928
G1 X134.073 Y127.92 E.0852
G1 X133.484 Y127.451 E.02315
G1 X132.589 Y127.866 E.03034
G1 X131.975 Y127.928 E.01899
G1 X131.888 Y127.903 E.00277
G1 X131.446 Y127.586 E.01674
G1 X131.349 Y127.46 E.00489
G1 X130.704 Y128.237 E.03104
G1 X130.482 Y128.432 E.0091
G1 X130.135 Y128.564 E.01142
G1 X129.76 Y128.551 E.01152
G1 X129.681 Y128.512 E.00272
G1 X129.503 Y128.595 E.00604
G1 X129.17 Y128.621 E.01026
G1 X128.806 Y128.506 E.01174
G1 X127.662 Y127.866 E.04031
M204 S10000
G1 X127.756 Y128.351 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X127.606 Y128.275 E.00516
G1 X127.109 Y128.445 E.01614
G1 X126.891 Y128.448 E.00668
G3 X128.112 Y129.429 I-12.139 J16.356 E.04813
G1 X128.338 Y129.677 E.0103
G1 X128.974 Y129.853 E.02028
G1 X129.417 Y130.074 E.01523
G2 X130.321 Y130.758 I8.62 J-10.461 E.03484
G1 X131.476 Y129.929 E.04369
G1 X131.907 Y129.725 E.01463
G1 X132.113 Y129.691 E.00641
G1 X133.535 Y127.978 E.06843
G1 X133.43 Y127.892 E.00417
G1 X132.748 Y128.208 E.0231
G1 X131.888 Y128.295 E.02656
G1 X131.766 Y128.26 E.00388
G1 X131.395 Y127.994 E.01402
G1 X130.994 Y128.477 E.0193
G1 X130.683 Y128.751 E.01273
G1 X130.197 Y128.936 E.01598
G2 X129.131 Y128.996 I.321 J15.259 E.0328
G1 X128.761 Y128.902 E.01174
G1 X127.809 Y128.379 E.03336
M204 S10000
G1 X128.596 Y129.301 F42000
; LINE_WIDTH: 0.53466
G1 F12811.649
M204 S6000
G1 X129.034 Y129.417 E.01817
M204 S10000
G1 X129.092 Y129.432 F42000
; LINE_WIDTH: 0.521232
G1 F13171.328
M204 S6000
G1 X129.265 Y129.538 E.00791
; LINE_WIDTH: 0.480735
G1 F14389.639
G1 X129.438 Y129.643 E.00724
; LINE_WIDTH: 0.420571
G1 F15000
G3 X130.324 Y130.292 I-7.087 J10.61 E.03379
G1 X131.256 Y129.622 E.03531
G1 X131.694 Y129.396 E.01515
G1 X131.91 Y129.344 E.00686
G1 X132.539 Y128.588 E.03026
G1 X131.801 Y128.662 E.02283
G3 X131.471 Y128.493 I.074 J-.548 E.01161
G1 X131.086 Y128.92 E.01772
G1 X130.716 Y129.163 E.01361
G1 X130.259 Y129.308 E.01474
G1 X129.735 Y129.311 E.01614
; LINE_WIDTH: 0.440239
G1 X129.54 Y129.348 E.00641
; LINE_WIDTH: 0.480735
G1 F14389.639
G1 X129.346 Y129.384 E.00706
; LINE_WIDTH: 0.521232
G1 F13171.328
G1 X129.151 Y129.421 E.00772
M204 S10000
G1 X130.332 Y129.743 F42000
; LINE_WIDTH: 0.524828
G1 F13073.049
M204 S6000
G1 X130.466 Y129.676 E.00587
; LINE_WIDTH: 0.477683
G1 F14490.67
G1 X130.599 Y129.609 E.00529
; LINE_WIDTH: 0.430538
G1 F15000
G1 X130.733 Y129.542 E.00472
; LINE_WIDTH: 0.364803
G1 X130.866 Y129.475 E.00392
G1 X131.312 Y129.183 E.01397
; LINE_WIDTH: 0.378344
G1 X131.379 Y129.138 E.0022
; LINE_WIDTH: 0.41631
G1 X131.445 Y129.093 E.00245
; LINE_WIDTH: 0.454277
G1 X131.512 Y129.048 E.0027
M204 S10000
G1 X125.556 Y123.852 F42000
; LINE_WIDTH: 0.56898
G1 F11975.821
M204 S6000
G1 X126.071 Y123.763 E.02241
; LINE_WIDTH: 0.57697
G1 F11796.649
G1 X126.242 Y123.748 E.00749
; LINE_WIDTH: 0.61091
G1 F11091.745
G1 X126.414 Y123.734 E.00797
M204 S10000
G1 X127.085 Y125.269 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X127.93 Y124.775 E.03008
G1 X128.106 Y124.767 E.00539
G1 X128.248 Y124.944 E.00697
G1 X128.537 Y124.896 E.00903
G1 X129.881 Y125.343 E.04353
G1 X130.369 Y124.756 E.02345
G1 X130.517 Y124.688 E.00502
G1 X130.634 Y124.732 E.00384
G1 X131.341 Y125.319 E.02823
G1 X131.899 Y124.647 E.02682
G1 X131.93 Y124.288 E.01109
G1 X132.375 Y123.75 E.02146
G1 X132.085 Y123.474 E.01229
G1 X132.097 Y123.322 E.00469
G1 X132.628 Y122.338 E.03434
G1 X132.314 Y122.064 E.01282
G1 X131.801 Y122.436 E.01948
G1 X130.831 Y122.633 E.03042
G1 X130.669 Y122.64 E.00498
G1 X129.912 Y122.515 E.02359
G3 X128.681 Y121.596 I6.817 J-10.409 E.04722
G1 X128.335 Y121.402 E.01218
G2 X127.955 Y121.409 I-.175 J.962 E.01176
G1 X126.526 Y122.447 E.05427
G3 X125.428 Y122.642 I-2.331 J-9.948 E.03429
G1 X125.045 Y122.572 E.01195
G1 X123.144 Y124.861 E.09142
G1 X124.57 Y125.276 E.04563
G1 X124.699 Y125.509 E.00819
G1 X124.543 Y126.045 E.01714
G1 X124.919 Y126.244 E.01307
G1 X125.926 Y125.032 E.04843
G1 X126.071 Y124.964 E.00492
G1 X126.739 Y124.964 E.02054
G1 X126.883 Y125.03 E.00487
G1 X127.046 Y125.223 E.00776
M204 S10000
G1 X127.167 Y124.784 F42000
; LINE_WIDTH: 0.419989
G1 F15000
M204 S6000
G1 X127.74 Y124.449 E.02039
G1 X128.072 Y124.374 E.01046
G1 X128.31 Y124.449 E.00768
G1 X128.398 Y124.522 E.00352
G1 X128.657 Y124.538 E.00796
G1 X129.756 Y124.904 E.03561
G1 X130.079 Y124.515 E.01552
G1 X130.192 Y124.412 E.00473
G1 X130.524 Y124.311 E.01065
G1 X130.799 Y124.389 E.00878
G1 X131.292 Y124.788 E.01948
G1 X131.522 Y124.511 E.01105
G1 X131.544 Y124.235 E.0085
G3 X131.857 Y123.783 I1.234 J.52 E.01704
G1 X131.712 Y123.538 E.00875
G1 X131.765 Y123.143 E.01226
G1 X131.97 Y122.764 E.01324
G1 X131.574 Y122.88 E.01268
G1 X130.837 Y123.016 E.02305
G1 X130.608 Y123.012 E.00703
G1 X129.85 Y122.887 E.02359
G1 X129.579 Y122.764 E.00914
G3 X128.447 Y121.891 I13.075 J-18.14 E.04393
G1 X128.198 Y121.756 E.00871
G1 X128.058 Y121.8 E.00452
G1 X126.748 Y122.752 E.04976
G1 X126.51 Y122.852 E.00793
G1 X125.556 Y123.014 E.02972
G1 X125.195 Y122.983 E.01116
G1 X123.802 Y124.66 E.06698
G1 X124.784 Y124.958 E.03154
G1 X125.024 Y125.527 E.01899
G1 X125.636 Y124.791 E.02942
G1 X125.916 Y124.608 E.0103
G3 X126.888 Y124.607 I.495 J5.609 E.02988
G1 X127.116 Y124.752 E.00832
M204 S10000
G1 X127.159 Y124.352 F42000
; LINE_WIDTH: 0.419988
G1 F15000
M204 S6000
G1 X127.602 Y124.095 E.01574
G1 X128.103 Y123.998 E.01568
G3 X129.631 Y124.465 I-7.754 J28.096 E.04909
G1 X129.978 Y124.101 E.01545
; LINE_WIDTH: 0.44211
G1 X130.241 Y123.996 E.00922
; LINE_WIDTH: 0.48635
G1 F14207.429
G1 X130.504 Y123.89 E.01024
; LINE_WIDTH: 0.522228
G1 F13143.963
G1 X130.708 Y123.917 E.00803
; LINE_WIDTH: 0.55993
G1 F12185.451
G1 X130.912 Y123.944 E.00866
G1 X131.127 Y124.072 E.01057
G1 X131.305 Y123.745 E.01568
G1 X131.274 Y123.638 E.00468
M73 P71 R5
G1 X131.309 Y123.385 E.01077
G1 X130.916 Y123.45 E.01675
; LINE_WIDTH: 0.528795
G1 F12966.298
G1 X130.539 Y123.427 E.01496
; LINE_WIDTH: 0.48635
G1 F14207.429
G1 X130.164 Y123.343 E.01389
; LINE_WIDTH: 0.42084
G1 F15000
G3 X129.381 Y123.086 I.316 J-2.285 E.02552
G3 X128.213 Y122.187 I13.578 J-18.845 E.04541
G1 X128.168 Y122.186 E.00139
G1 X126.97 Y123.057 E.04562
G1 X126.626 Y123.213 E.01162
G3 X125.525 Y123.397 I-7.896 J-43.97 E.03438
G1 X125.349 Y123.387 E.00543
G1 X124.459 Y124.458 E.04288
G1 X124.962 Y124.625 E.0163
G1 X125.07 Y124.882 E.00858
G1 X125.369 Y124.523 E.01438
G1 X125.814 Y124.245 E.01616
G1 X126.071 Y124.21 E.00799
G1 X126.739 Y124.21 E.02059
G1 X126.987 Y124.243 E.00769
G1 X127.108 Y124.32 E.00443
M204 S10000
G1 X127.15 Y123.898 F42000
; LINE_WIDTH: 0.441433
G1 F15000
M204 S6000
G1 X127.423 Y123.738 E.01025
G1 X128.134 Y123.622 E.0234
G1 X128.589 Y123.737 E.01526
; LINE_WIDTH: 0.44631
G1 X128.763 Y123.769 E.0058
; LINE_WIDTH: 0.455568
G1 X128.936 Y123.802 E.00593
G1 X129.502 Y124.011 E.02028
G1 X129.756 Y123.781 E.01154
G1 X130.03 Y123.694 E.00965
G1 X129.508 Y123.589 E.01789
G1 X129.113 Y123.394 E.01483
; LINE_WIDTH: 0.464368
G1 F14948.481
G1 X128.886 Y123.207 E.01007
; LINE_WIDTH: 0.436883
G1 F15000
G2 X128.181 Y122.643 I-14.962 J17.966 E.02901
G1 X127.204 Y123.38 E.03928
G1 X127.047 Y123.475 E.0059
; LINE_WIDTH: 0.439495
G1 X126.933 Y123.503 E.00379
; LINE_WIDTH: 0.399805
G1 X126.819 Y123.53 E.00341
; LINE_WIDTH: 0.404752
G1 X126.75 Y123.57 E.00235
; LINE_WIDTH: 0.454336
G1 X126.681 Y123.609 E.00267
; LINE_WIDTH: 0.50392
G1 F13665.943
G1 X126.612 Y123.649 E.003
; LINE_WIDTH: 0.553504
G1 F12338.812
G1 X126.543 Y123.689 E.00332
; LINE_WIDTH: 0.603088
G1 F11246.627
G1 X126.473 Y123.729 E.00364
; LINE_WIDTH: 0.604689
G1 F11214.575
G1 X126.562 Y123.754 E.00424
; LINE_WIDTH: 0.558307
G1 F12223.824
G1 X126.651 Y123.78 E.00389
; LINE_WIDTH: 0.511925
G1 F13432.693
G1 X126.74 Y123.806 E.00354
; LINE_WIDTH: 0.465543
G1 F14906.901
G1 X126.829 Y123.831 E.00319
; LINE_WIDTH: 0.424692
G1 F15000
G2 X127.091 Y123.86 I.184 J-.471 E.00828
; LINE_WIDTH: 0.45934
G1 X127.099 Y123.865 E.00035
M204 S10000
G1 X128.2 Y123.135 F42000
; LINE_WIDTH: 0.53572
G1 F12784.091
M204 S6000
G2 X128.201 Y123.241 I-.025 J.053 E.00951
M204 S10000
G1 X128.44 Y114.596 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40388
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X140.564 Y132.091 E1.11101
G1 X140.627 Y131.903 E.01034
G2 X140.731 Y131.535 I-6.976 J-2.169 E.01997
G1 X129.166 Y114.847 E1.05984
G3 X129.757 Y114.903 I-.145 J4.643 E.03103
G1 X140.879 Y130.951 E1.01918
G2 X141.005 Y130.336 I-6.244 J-1.597 E.0328
G1 X130.377 Y115.001 E.9739
G3 X131.023 Y115.135 I-1.096 J6.864 E.03444
G1 X141.105 Y129.684 E.92394
G2 X141.176 Y128.989 I-7.075 J-1.07 E.03647
G1 X131.699 Y115.314 E.86847
G3 X132.411 Y115.545 I-2.018 J7.44 E.0391
G1 X141.211 Y128.243 E.80641
G1 X141.217 Y128.008 E.01228
G2 X141.203 Y127.434 I-11.816 J.001 E.02993
G1 X133.167 Y115.84 E.73635
G3 X133.979 Y116.215 I-3.424 J8.483 E.04671
G1 X141.133 Y126.536 E.65551
G2 X140.979 Y125.518 I-10.442 J1.056 E.0538
G1 X134.883 Y116.722 E.55859
G3 X135.924 Y117.427 I-6.937 J11.361 E.06565
G1 X140.683 Y124.294 E.43609
G1 X140.631 Y124.111 E.00991
G2 X140.054 Y122.59 I-12.808 J3.99 E.08498
G1 X136.763 Y117.841 E.30161
M106 S186.15
M204 S10000
G1 X118.478 Y118.549 F42000
M106 S255
G1 F3000
M204 S6000
G1 X122.741 Y124.7 E.3906
G1 X123.042 Y124.337 E.02459
G1 X118.925 Y118.396 E.37728
G3 X119.261 Y118.085 I6.584 J6.771 E.02391
G1 X123.343 Y123.975 E.37404
G1 X123.644 Y123.612 E.02459
G1 X119.61 Y117.792 E.36964
G1 X119.967 Y117.51 E.02374
G1 X123.945 Y123.25 E.36454
G1 X124.246 Y122.887 E.02459
G1 X120.331 Y117.238 E.3588
G1 X120.706 Y116.982 E.02369
G1 X124.547 Y122.525 E.35202
G1 X124.848 Y122.162 E.02459
G1 X121.089 Y116.739 E.34444
G3 X121.398 Y116.55 I4.321 J6.739 E.0189
G1 X121.48 Y116.506 E.00486
G1 X125.443 Y122.224 E.36316
G1 X125.942 Y122.147 E.02633
G1 X121.881 Y116.287 E.3721
G3 X122.292 Y116.084 I2.357 J4.241 E.02396
G1 X126.407 Y122.022 E.37712
G1 X126.775 Y121.755 E.0237
G1 X122.711 Y115.891 E.37241
G1 X123.138 Y115.711 E.02421
G1 X127.142 Y121.488 E.3669
G1 X127.509 Y121.221 E.0237
G1 X123.578 Y115.549 E.36024
G1 X124.026 Y115.399 E.02467
G1 X127.906 Y120.998 E.35558
G1 X128.252 Y120.95 E.01822
G1 X128.467 Y121.01 E.01163
G1 X124.483 Y115.261 E.36507
G1 X124.953 Y115.142 E.02528
G1 X129.524 Y121.737 E.41888
G2 X130.033 Y122.116 I16.33 J-21.447 E.0331
G1 X130.377 Y122.172 E.01823
G1 X125.434 Y115.039 E.45303
G1 X125.925 Y114.951 E.02605
G1 X130.943 Y122.192 E.45987
G1 X131.433 Y122.102 E.02599
G1 X126.427 Y114.879 E.45872
G1 X126.943 Y114.827 E.02709
G1 X131.842 Y121.895 E.44889
G1 X132.209 Y121.629 E.0237
G1 X127.475 Y114.797 E.43386
G3 X128.024 Y114.793 I.31 J4.377 E.02868
G1 X140.38 Y132.622 E1.13228
G1 X140.18 Y133.13 E.02852
G1 X132.924 Y122.661 E.66492
G1 X132.682 Y123.108 E.02657
G1 X139.963 Y133.613 E.66714
G3 X139.732 Y134.078 I-4.955 J-2.171 E.02706
G1 X135.522 Y128.003 E.38578
G1 X135.221 Y128.366 E.02459
G1 X139.49 Y134.525 E.39115
G3 X139.274 Y134.898 I-8.125 J-4.451 E.02251
G1 X139.236 Y134.956 E.0036
G1 X134.92 Y128.728 E.39552
G1 X134.619 Y129.09 E.02459
G1 X138.97 Y135.368 E.39869
G3 X138.691 Y135.763 I-4.328 J-2.755 E.02524
G1 X134.318 Y129.453 E.40076
G1 X134.017 Y129.815 E.02459
G1 X138.404 Y136.145 E.402
G3 X138.12 Y136.501 I-7.597 J-5.778 E.02376
G1 X138.108 Y136.515 E.00096
G1 X133.716 Y130.178 E.40244
G1 X133.415 Y130.54 E.02459
G1 X137.798 Y136.865 E.40168
G3 X137.48 Y137.203 I-3.655 J-3.122 E.02423
G1 X133.114 Y130.903 E.40012
G1 X132.883 Y131.181 E.01886
G1 X132.761 Y131.189 E.00642
G1 X137.155 Y137.53 E.40267
G1 X136.818 Y137.842 E.02393
G1 X132.262 Y131.267 E.41758
G1 X131.893 Y131.531 E.02369
G1 X136.472 Y138.139 E.41963
G3 X136.234 Y138.338 I-4.122 J-4.683 E.0162
G1 X136.119 Y138.426 E.00757
G1 X131.524 Y131.796 E.42101
G1 X131.156 Y132.061 E.0237
G1 X135.756 Y138.7 E.42162
G3 X135.383 Y138.958 I-3.001 J-3.949 E.0237
G1 X130.772 Y132.304 E.42258
G1 X130.3 Y132.421 E.02534
G1 X135.002 Y139.205 E.43087
G1 X134.614 Y139.442 E.02373
G1 X129.521 Y132.093 E.46674
G2 X128.519 Y131.33 I-16.336 J20.43 E.06576
G1 X128.422 Y131.303 E.00525
G1 X134.214 Y139.661 E.53078
G1 X133.806 Y139.869 E.02391
G1 X127.774 Y131.165 E.55276
G1 X127.252 Y131.21 E.02731
G1 X133.39 Y140.066 E.56246
G1 X132.963 Y140.246 E.02421
G1 X126.004 Y130.206 E.63767
G1 X125.703 Y130.568 E.02459
G1 X132.526 Y140.413 E.62524
G3 X132.202 Y140.531 I-2.593 J-6.642 E.01799
G1 X132.081 Y140.568 E.0066
G1 X125.402 Y130.931 E.61205
G1 X125.101 Y131.293 E.02459
G1 X131.626 Y140.708 E.59795
G3 X131.158 Y140.83 I-1.582 J-5.124 E.02524
G1 X124.8 Y131.655 E.58265
G1 X124.686 Y131.793 E.00931
G1 X123.878 Y131.122 E.05484
G1 X130.681 Y140.938 E.62341
G3 X130.288 Y141.017 I-1.957 J-8.709 E.02092
G1 X130.193 Y141.031 E.00499
G1 X123.118 Y130.821 E.64842
G1 X122.817 Y131.184 E.02459
G1 X129.693 Y141.107 E.63019
G3 X129.179 Y141.161 I-.846 J-5.58 E.02703
G1 X122.258 Y131.175 E.63418
G1 X121.898 Y131.256 E.01928
G1 X121.393 Y130.432 E.05043
G1 X121.584 Y130.202 E.01557
G1 X121.4 Y129.936 E.01687
G1 X120.802 Y129.87 E.03143
G1 X128.651 Y141.197 E.71933
G3 X128.322 Y141.213 I-.504 J-6.944 E.01719
G1 X128.11 Y141.213 E.01107
G1 X120.05 Y129.582 E.73861
M106 S186.15
M204 S10000
G1 X134.61 Y142.787 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S6000
G2 X133.864 Y143.098 I-6.608 J-14.786 E3.10184
G1 X134.554 Y142.81 E.02298
M204 S10000
G1 X139.564 Y138.796 F42000
G1 F12000
M204 S6000
G2 X139.012 Y139.359 I-11.563 J-10.794 E3.02961
G1 X139.522 Y138.838 E.0224
M204 S10000
G1 X143.444 Y128.013 F42000
G1 F12000
M204 S6000
G2 X143.265 Y130.339 I-15.441 J-.017 E2.90926
G2 X143.442 Y128.073 I-19.58 J-2.671 E.06988
M204 S10000
G1 X143.085 Y128.004 F42000
; LINE_WIDTH: 0.384707
G1 F12000
M204 S6000
G2 X141.627 Y121.55 I-15.129 J.024 E.18578
; LINE_WIDTH: 0.410593
G1 X141.423 Y121.179 E.01269
; LINE_WIDTH: 0.439558
G1 X141.22 Y120.807 E.0137
; LINE_WIDTH: 0.482742
M73 P72 R5
G2 X139.527 Y118.333 I-17.273 J10 E.10753
; LINE_WIDTH: 0.443635
G1 X139.047 Y117.756 E.02451
; LINE_WIDTH: 0.384458
G2 X131.386 Y113.301 I-10.919 J9.962 E.25051
G2 X114.012 Y133.636 I-3.385 J14.698 E.91518
; LINE_WIDTH: 0.402613
G1 X114.226 Y134.08 E.01445
; LINE_WIDTH: 0.440198
G1 X114.441 Y134.524 E.01596
; LINE_WIDTH: 0.483425
G1 X114.804 Y135.179 E.02688
; LINE_WIDTH: 0.536469
G2 X116.493 Y137.649 I17.229 J-9.972 E.12044
; LINE_WIDTH: 0.49751
G1 X116.972 Y138.225 E.02777
; LINE_WIDTH: 0.460423
G1 X117.223 Y138.505 E.01279
; LINE_WIDTH: 0.429468
G1 X117.474 Y138.784 E.01184
; LINE_WIDTH: 0.384496
G2 X143.083 Y128.064 I10.538 J-10.773 E.98226
M204 S10000
G1 X114.971 Y123.997 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G3 X128.574 Y114.387 I13.023 J4.002 E.55057
G3 X137.53 Y118.261 I-.543 J13.544 E.3067
G1 X138.24 Y119.243 E.03722
G1 X140.401 Y122.361 E.11658
G3 X118.977 Y138.204 I-12.394 J5.646 E1.13957
G1 X118.687 Y137.907 E.01277
G1 X115.385 Y133.142 E.1781
G3 X114.955 Y124.055 I12.55 J-5.148 E.28508
M204 S10000
G1 X114.608 Y123.895 F42000
G1 F12000
M204 S6000
G3 X128.58 Y114.01 I13.386 J4.104 E.56577
G3 X137.788 Y117.987 I-.549 J13.921 E.31528
G1 X138.129 Y118.42 E.01692
G1 X140.711 Y122.146 E.13931
G1 X141.154 Y123.186 E.03471
G3 X118.731 Y138.489 I-13.15 J4.812 E1.13818
G1 X118.444 Y138.217 E.01215
G1 X115.074 Y133.355 E.18179
G3 X114.592 Y123.953 I12.731 J-5.365 E.29518
M204 S10000
G1 X114.245 Y123.793 F42000
G1 F12000
M204 S6000
G3 X128.585 Y113.633 I13.749 J4.206 E.58097
G3 X138.249 Y117.932 I-.536 J14.217 E.33297
G1 X141.021 Y121.931 E.14953
G3 X142.218 Y125.823 I-11.693 J5.727 E.12561
G3 X118.484 Y138.774 I-14.214 J2.175 E1.0808
G1 X118.134 Y138.432 E.01505
G1 X114.762 Y133.567 E.18189
G3 X113.782 Y130.177 I11.576 J-5.183 E.10877
G3 X114.229 Y123.851 I14.373 J-2.163 E.19645
M204 S10000
G1 X113.899 Y123.696 F42000
; LINE_WIDTH: 0.384515
G1 F12000
M204 S6000
G3 X138.294 Y117.451 I14.1 J4.31 E.84013
G1 X138.749 Y117.99 E.01964
; LINE_WIDTH: 0.443635
G1 X139.189 Y118.585 E.02417
; LINE_WIDTH: 0.482737
G3 X140.868 Y121.018 I-64.057 J46.008 E.10595
; LINE_WIDTH: 0.42951
G1 X141.269 Y121.641 E.02335
; LINE_WIDTH: 0.384145
G3 X142.075 Y123.612 I-10.356 J5.381 E.05929
G3 X118.248 Y139.048 I-14.071 J4.387 E1.06407
G1 X117.831 Y138.642 E.01618
; LINE_WIDTH: 0.419928
G1 X117.572 Y138.3 E.01318
; LINE_WIDTH: 0.457243
G1 X117.312 Y137.958 E.01449
; LINE_WIDTH: 0.49751
G1 X116.875 Y137.365 E.02733
; LINE_WIDTH: 0.536464
G3 X115.202 Y134.941 I63.817 J-45.835 E.11845
; LINE_WIDTH: 0.483425
G1 X114.801 Y134.32 E.02651
; LINE_WIDTH: 0.44452
G1 X114.633 Y134.051 E.01038
; LINE_WIDTH: 0.385418
G1 X114.464 Y133.783 E.00885
G3 X113.335 Y129.511 I12.168 J-5.502 E.12389
G3 X113.883 Y123.754 I14.646 J-1.509 E.16245
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X113.702 Y124.404 E-.25656
G1 X113.541 Y125.122 E-.27946
G1 X113.44 Y125.703 E-.22398
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/32
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.8 I-1.217 J-.002 P1  F42000
G1 X113.425 Y135.937 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X122.716 Y112.273 I14.566 J-7.937 E.96081
G3 X128.571 Y111.422 I5.267 J15.673 E.19732
G3 X113.453 Y135.99 I-.58 J16.578 E2.29731
M204 S10000
G1 X113.068 Y136.132 F42000
G1 F5400
M204 S6000
G3 X121.79 Y112.177 I14.924 J-8.131 E.95622
G3 X128.591 Y111.016 I6.23 J15.99 E.23046
G3 X113.096 Y136.185 I-.6 J16.985 E2.35359
M204 S250
G1 X112.728 Y136.316 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.327 Y135.548 E.02663
G3 X121.647 Y111.812 I15.664 J-7.547 E.87954
G3 X128.611 Y110.624 I6.373 J16.356 E.21858
G3 X112.749 Y136.367 I-.62 J17.377 E2.23046
; WIPE_START
M204 S6000
G1 X112.327 Y135.548 E-.35023
G1 X111.976 Y134.755 E-.32953
G1 X111.898 Y134.558 E-.08025
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


G1 X114.842 Y137.83 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F15000
M204 S6000
G1 X116.664 Y139.652 E.07937
G2 X119.239 Y141.693 I11.854 J-12.315 E.10137
G1 X114.318 Y136.772 E.21437
G3 X113.582 Y135.501 I13.847 J-8.87 E.04526
G1 X120.505 Y142.424 E.3016
G2 X121.522 Y142.906 I9.522 J-18.771 E.03466
G1 X113.092 Y134.477 E.36722
G3 X112.731 Y133.581 I8.793 J-4.065 E.02976
G1 X122.411 Y143.261 E.42169
G2 X123.217 Y143.532 I3.123 J-7.942 E.02621
G1 X112.461 Y132.776 E.46861
G1 X112.251 Y132.032 E.02381
G1 X123.962 Y143.743 E.51017
G2 X124.66 Y143.906 I1.981 J-6.901 E.02208
G1 X112.092 Y131.338 E.54752
G3 X111.97 Y130.681 I6.506 J-1.547 E.02057
G1 X125.321 Y144.032 E.58161
G1 X125.95 Y144.127 E.01961
G1 X111.878 Y130.055 E.61303
G3 X111.811 Y129.453 I5.993 J-.973 E.01866
G1 X126.546 Y144.188 E.6419
G2 X127.121 Y144.228 I.696 J-5.745 E.01778
G1 X111.768 Y128.875 E.66885
G3 X111.751 Y128.324 I5.52 J-.446 E.01701
G1 X127.679 Y144.252 E.69391
G1 X128.214 Y144.252 E.01647
G1 X111.748 Y127.786 E.71732
G1 X111.761 Y127.265 E.01607
G1 X128.732 Y144.236 E.73933
G2 X129.24 Y144.209 I-.012 J-5.092 E.01568
G1 X111.795 Y126.764 E.75999
G3 X111.837 Y126.272 I4.947 J.178 E.01522
G1 X129.726 Y144.161 E.77932
G2 X130.204 Y144.104 I-.332 J-4.807 E.01482
G1 X111.897 Y125.797 E.79753
G3 X111.967 Y125.333 I4.686 J.476 E.01446
G1 X130.668 Y144.033 E.81469
G2 X131.12 Y143.95 I-.608 J-4.561 E.01414
G1 X112.048 Y124.878 E.83086
G3 X112.143 Y124.439 I4.451 J.733 E.01386
G1 X131.564 Y143.86 E.84609
G2 X131.993 Y143.754 I-.848 J-4.335 E.0136
G1 X112.242 Y124.003 E.86042
G3 X112.359 Y123.586 I4.272 J.969 E.01337
G1 X132.418 Y143.645 E.87387
G1 X132.827 Y143.519 E.01317
G1 X112.478 Y123.17 E.88649
G1 X112.612 Y122.77 E.013
G1 X133.233 Y143.39 E.89833
G1 X133.625 Y143.248 E.01285
G1 X112.75 Y122.372 E.90942
M73 P73 R5
G1 X112.9 Y121.989 E.01271
G1 X134.014 Y143.102 E.9198
G1 X134.39 Y142.944 E.01257
G1 X113.054 Y121.608 E.92947
G1 X113.22 Y121.239 E.01245
G1 X134.763 Y142.782 E.93848
G1 X135.124 Y142.608 E.01234
G1 X113.39 Y120.874 E.94682
G1 X113.571 Y120.521 E.01223
G1 X135.482 Y142.431 E.95453
G1 X135.828 Y142.243 E.01214
G1 X113.754 Y120.17 E.96161
G1 X113.95 Y119.831 E.01206
G1 X136.172 Y142.053 E.96808
G1 X136.504 Y141.85 E.01198
G1 X114.147 Y119.493 E.97396
G1 X114.357 Y119.168 E.01191
G1 X136.835 Y141.646 E.97924
G1 X137.153 Y141.43 E.01185
G1 X114.567 Y118.843 E.98395
G1 X114.79 Y118.532 E.0118
G1 X137.471 Y141.213 E.98806
G2 X137.776 Y140.983 I-2.156 J-3.182 E.01177
G1 X115.014 Y118.221 E.99161
G3 X115.249 Y117.922 I3.112 J2.209 E.01173
G1 X138.08 Y140.753 E.9946
G2 X138.373 Y140.511 I-2.271 J-3.056 E.0117
G1 X115.487 Y117.625 E.99704
G3 X115.734 Y117.337 I3.006 J2.336 E.01168
G1 X138.664 Y140.268 E.99893
G2 X138.946 Y140.015 I-2.391 J-2.944 E.01167
G1 X115.984 Y117.054 E1.00028
G3 X116.243 Y116.778 I2.895 J2.456 E.01166
G1 X139.223 Y139.757 E1.00109
G2 X139.493 Y139.493 I-2.513 J-2.838 E.01165
G1 X116.507 Y116.507 E1.00136
G3 X116.777 Y116.243 I2.784 J2.574 E.01165
G1 X139.757 Y139.222 E1.00109
G2 X140.016 Y138.946 I-2.638 J-2.733 E.01166
G1 X117.055 Y115.985 E1.00028
G3 X117.336 Y115.732 I2.671 J2.689 E.01167
G1 X140.266 Y138.662 E.99893
G2 X140.514 Y138.375 I-2.753 J-2.618 E.01168
G1 X117.627 Y115.488 E.99704
G3 X117.92 Y115.247 I2.566 J2.818 E.0117
G1 X140.751 Y138.077 E.9946
G2 X140.986 Y137.778 I-2.866 J-2.499 E.01173
G1 X118.224 Y115.016 E.99161
G3 X118.529 Y114.787 I2.468 J2.961 E.01177
G1 X141.21 Y137.467 E.98806
G1 X141.433 Y137.156 E.0118
G1 X118.847 Y114.57 E.98395
G1 X119.165 Y114.353 E.01185
G1 X141.643 Y136.831 E.97924
G1 X141.853 Y136.507 E.01191
G1 X119.496 Y114.15 E.97395
G1 X119.828 Y113.947 E.01198
G1 X142.05 Y136.169 E.96808
G1 X142.246 Y135.83 E.01206
G1 X120.172 Y113.757 E.9616
G1 X120.519 Y113.568 E.01214
G1 X142.429 Y135.479 E.95452
G1 X142.61 Y135.126 E.01223
G1 X120.877 Y113.392 E.94681
G1 X121.238 Y113.218 E.01234
G1 X142.78 Y134.76 E.93847
G1 X142.946 Y134.392 E.01245
G1 X121.61 Y113.056 E.92947
G1 X121.986 Y112.898 E.01257
G1 X143.1 Y134.011 E.91979
G1 X143.25 Y133.627 E.01271
G1 X122.375 Y112.752 E.90941
G1 X122.767 Y112.609 E.01285
G1 X143.388 Y133.23 E.89832
G1 X143.522 Y132.83 E.013
G1 X123.174 Y112.481 E.88648
G1 X123.582 Y112.355 E.01317
G1 X143.641 Y132.414 E.87386
G2 X143.758 Y131.996 I-4.154 J-1.386 E.01337
G1 X124.008 Y112.246 E.86041
G3 X124.436 Y112.14 I1.276 J4.229 E.0136
G1 X143.857 Y131.561 E.84608
G2 X143.952 Y131.121 I-4.354 J-1.172 E.01386
G1 X124.881 Y112.05 E.83085
G3 X125.332 Y111.966 I1.06 J4.483 E.01414
G1 X144.033 Y130.667 E.81468
G2 X144.103 Y130.203 I-4.616 J-.94 E.01446
G1 X125.797 Y111.896 E.79751
G3 X126.274 Y111.839 I.81 J4.753 E.01482
G1 X144.163 Y129.728 E.7793
G2 X144.205 Y129.236 I-4.91 J-.671 E.01523
G1 X126.76 Y111.791 E.75998
G3 X127.268 Y111.764 I.52 J5.073 E.01568
G1 X144.239 Y128.735 E.73932
G1 X144.252 Y128.213 E.01607
G1 X127.788 Y111.749 E.71723
G1 X128.327 Y111.754 E.0166
G1 X144.249 Y127.676 E.69363
G2 X144.232 Y127.124 I-5.544 J-.105 E.01701
G1 X128.879 Y111.772 E.66883
G3 X129.455 Y111.812 I-.121 J5.786 E.01778
G1 X144.189 Y126.546 E.64188
G2 X144.122 Y125.945 I-6.064 J.372 E.01866
G1 X130.05 Y111.873 E.613
G1 X130.68 Y111.968 E.01961
G1 X144.03 Y125.318 E.58158
G2 X143.908 Y124.662 I-6.633 J.891 E.02057
G1 X131.341 Y112.094 E.54749
G3 X132.039 Y112.258 I-1.283 J7.061 E.02208
G1 X143.749 Y123.968 E.51014
G1 X143.539 Y123.224 E.02381
G1 X132.783 Y112.468 E.46858
G3 X133.589 Y112.739 I-2.316 J8.211 E.02621
G1 X143.268 Y122.418 E.42165
G2 X142.907 Y121.522 I-9.149 J3.168 E.02976
G1 X134.479 Y113.094 E.36718
M73 P74 R5
G3 X135.496 Y113.576 I-8.479 J19.193 E.03467
G1 X142.417 Y120.498 E.30155
G2 X141.681 Y119.227 I-14.594 J7.607 E.04527
G1 X136.762 Y114.308 E.21429
G3 X139.342 Y116.353 I-9.291 J14.37 E.10157
G1 X141.157 Y118.168 E.07907
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X139.743 Y116.754 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/32
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I-.717 J-.983 P1  F42000
G1 X113.425 Y135.937 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X125.119 Y111.661 I14.565 J-7.938 E1.04318
G3 X128.498 Y111.419 I2.932 J17.182 E.11255
G3 X113.454 Y135.99 I-.507 J16.58 E2.29962
M204 S10000
G1 X113.068 Y136.132 F42000
G1 F5400
M204 S6000
G3 X124.217 Y111.428 I14.924 J-8.132 E1.04061
G3 X128.518 Y111.012 I3.767 J16.496 E.14373
G3 X113.097 Y136.184 I-.527 J16.988 E2.356
M204 S250
G1 X112.728 Y136.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.723 Y136.319 E.00016
G3 X124.13 Y111.046 I15.267 J-8.32 E.98616
G3 X128.538 Y110.621 I3.853 J16.87 E.13644
G3 X113.157 Y137.07 I-.547 J17.379 E2.20761
G1 X112.758 Y136.369 E.02479
; WIPE_START
M204 S6000
G1 X112.723 Y136.319 E-.0231
G1 X112.332 Y135.545 E-.32959
G1 X111.976 Y134.755 E-.32946
G1 X111.901 Y134.564 E-.07786
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


G1 X118.157 Y114.854 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F15000
M204 S6000
G1 X116.605 Y116.407 E.06763
G2 X114.318 Y119.228 I11.624 J11.758 E.1121
G1 X119.239 Y114.307 E.21437
G3 X120.505 Y113.576 I7.962 J12.318 E.04507
G1 X113.582 Y120.499 E.3016
G2 X113.092 Y121.523 I10.023 J5.421 E.03499
G1 X121.522 Y113.094 E.36723
G3 X122.411 Y112.739 I3.998 J8.733 E.0295
G1 X112.731 Y122.419 E.42169
G2 X112.461 Y123.224 I87.867 J30.003 E.02618
G1 X123.217 Y112.468 E.46861
G3 X123.962 Y112.257 I2.48 J7.367 E.02385
G1 X112.251 Y123.968 E.51017
G2 X112.092 Y124.662 I6.882 J1.947 E.02195
G1 X124.66 Y112.094 E.54752
G3 X125.321 Y111.968 I1.597 J6.57 E.02073
G1 X111.97 Y125.319 E.58161
G2 X111.878 Y125.945 I6.23 J1.232 E.01951
G1 X125.95 Y111.873 E.61303
G3 X126.546 Y111.812 I.907 J5.917 E.01845
G1 X111.811 Y126.547 E.6419
G1 X111.768 Y127.125 E.01785
G1 X127.121 Y111.771 E.66885
G3 X127.679 Y111.748 I.492 J5.105 E.01721
G1 X111.751 Y127.676 E.69389
G2 X111.748 Y128.214 I5.371 J.296 E.01656
G1 X128.211 Y111.751 E.71719
G3 X128.732 Y111.764 I.113 J5.758 E.01607
G1 X111.761 Y128.735 E.73933
G2 X111.795 Y129.236 I5.041 J-.088 E.01547
G1 X129.24 Y111.791 E.75999
G1 X129.726 Y111.839 E.01505
G1 X111.837 Y129.728 E.77932
G1 X111.897 Y130.203 E.01475
G1 X130.204 Y111.896 E.79753
G1 X130.668 Y111.966 E.01447
G1 X111.967 Y130.667 E.81469
G1 X112.048 Y131.122 E.01422
G1 X131.12 Y112.05 E.83086
G1 X131.564 Y112.14 E.01398
G1 X112.143 Y131.561 E.84609
G1 X112.242 Y131.997 E.01375
G1 X131.993 Y112.246 E.86042
G3 X132.418 Y112.355 I-.892 J4.357 E.01354
G1 X112.359 Y132.414 E.87387
G2 X112.478 Y132.83 I4.214 J-.982 E.01332
G1 X132.827 Y112.481 E.88649
G3 X133.233 Y112.609 I-1.084 J4.139 E.01313
G1 X112.612 Y133.23 E.89833
G2 X112.75 Y133.628 I4.053 J-1.178 E.01295
G1 X133.625 Y112.752 E.90942
G3 X134.014 Y112.898 I-1.266 J3.969 E.0128
G1 X112.9 Y134.011 E.9198
G2 X113.054 Y134.392 I3.887 J-1.35 E.01265
G1 X134.39 Y113.056 E.92947
G3 X134.763 Y113.218 I-1.434 J3.815 E.01253
G1 X113.22 Y134.761 E.93848
G2 X113.39 Y135.126 I3.737 J-1.51 E.01241
G1 X135.124 Y113.392 E.94682
G3 X135.482 Y113.569 I-1.595 J3.687 E.0123
G1 X113.571 Y135.479 E.95453
G2 X113.754 Y135.83 I3.611 J-1.665 E.01221
G1 X135.828 Y113.757 E.96161
G3 X136.172 Y113.947 I-1.728 J3.532 E.01212
M73 P75 R5
G1 X113.95 Y136.169 E.96808
G2 X114.147 Y136.507 I3.482 J-1.805 E.01205
G1 X136.504 Y114.15 E.97396
G3 X136.835 Y114.354 I-1.87 J3.415 E.01198
G1 X114.357 Y136.832 E.97924
G1 X114.567 Y137.157 E.01191
G1 X137.153 Y114.57 E.98395
G1 X137.471 Y114.787 E.01185
G1 X114.79 Y137.468 E.98806
G1 X115.014 Y137.779 E.0118
G1 X137.776 Y115.017 E.99161
G1 X138.08 Y115.247 E.01176
G1 X115.249 Y138.078 E.9946
G1 X115.487 Y138.375 E.01172
G1 X138.373 Y115.489 E.99704
G1 X138.664 Y115.732 E.01169
G1 X115.734 Y138.662 E.99893
G1 X115.984 Y138.946 E.01167
G1 X138.946 Y115.985 E1.00028
G1 X139.223 Y116.243 E.01165
G1 X116.243 Y139.222 E1.00109
G1 X116.507 Y139.493 E.01165
G1 X139.493 Y116.507 E1.00136
G1 X139.757 Y116.778 E.01165
G1 X116.777 Y139.757 E1.00109
G1 X117.055 Y140.015 E.01165
G1 X140.016 Y117.054 E1.00028
G1 X140.266 Y117.338 E.01167
G1 X117.336 Y140.268 E.99893
G1 X117.627 Y140.512 E.01169
G1 X140.514 Y117.625 E.99704
G1 X140.751 Y117.923 E.01172
G1 X117.92 Y140.753 E.9946
G1 X118.224 Y140.983 E.01176
G1 X140.986 Y118.222 E.99161
G1 X141.21 Y118.533 E.0118
G1 X118.529 Y141.213 E.98806
G1 X118.847 Y141.43 E.01185
G1 X141.433 Y118.844 E.98395
G1 X141.643 Y119.169 E.01191
G1 X119.165 Y141.647 E.97924
G2 X119.496 Y141.85 I2.199 J-3.208 E.01198
G1 X141.853 Y119.493 E.97395
G3 X142.05 Y119.831 I-3.288 J2.144 E.01205
G1 X119.828 Y142.053 E.96808
G2 X120.172 Y142.243 I2.08 J-3.355 E.01212
G1 X142.246 Y120.17 E.9616
G3 X142.429 Y120.521 I-3.428 J2.016 E.01221
G1 X120.519 Y142.432 E.95452
G2 X120.877 Y142.608 I1.952 J-3.509 E.0123
G1 X142.61 Y120.874 E.94681
G3 X142.78 Y121.24 I-3.58 J1.881 E.01241
G1 X121.238 Y142.782 E.93847
G2 X121.61 Y142.944 I1.805 J-3.651 E.01253
G1 X142.946 Y121.608 E.92947
G3 X143.1 Y121.989 I-3.724 J1.727 E.01265
G1 X121.986 Y143.102 E.91979
G2 X122.375 Y143.248 I1.65 J-3.808 E.0128
G1 X143.25 Y122.373 E.90941
G3 X143.388 Y122.77 I-3.916 J1.575 E.01296
G1 X122.767 Y143.391 E.89832
G2 X123.174 Y143.519 I1.488 J-4.003 E.01313
G1 X143.522 Y123.17 E.88648
G3 X143.641 Y123.586 I-4.099 J1.399 E.01332
G1 X123.582 Y143.645 E.87386
G2 X124.008 Y143.754 I1.3 J-4.182 E.01354
G1 X143.758 Y124.004 E.86041
G1 X143.857 Y124.439 E.01375
G1 X124.436 Y143.86 E.84608
G1 X124.881 Y143.95 E.01398
G1 X143.952 Y124.879 E.83085
G1 X144.033 Y125.333 E.01422
G1 X125.332 Y144.034 E.81468
G1 X125.797 Y144.104 E.01447
G1 X144.103 Y125.797 E.79751
G1 X144.163 Y126.272 E.01475
G1 X126.274 Y144.161 E.7793
G1 X126.76 Y144.209 E.01505
G1 X144.205 Y126.764 E.75998
G3 X144.239 Y127.265 I-5.009 J.589 E.01547
G1 X127.268 Y144.236 E.73932
G2 X127.787 Y144.252 I.422 J-5.186 E.01598
G1 X144.252 Y127.787 E.7173
M73 P75 R4
G3 X144.249 Y128.324 I-5.377 J.241 E.01656
G1 X128.321 Y144.252 E.69389
G2 X128.879 Y144.228 I.042 J-5.605 E.01722
G1 X144.232 Y128.876 E.66883
G1 X144.189 Y129.454 E.01785
G1 X129.455 Y144.188 E.64188
G2 X130.05 Y144.127 I-.314 J-6 E.01845
G1 X144.122 Y130.055 E.613
G3 X144.03 Y130.682 I-6.323 J-.606 E.01951
G1 X130.68 Y144.032 E.58158
G2 X131.341 Y143.906 I-.936 J-6.692 E.02073
G1 X143.908 Y131.338 E.54749
G3 X143.749 Y132.032 I-7.016 J-1.247 E.02195
G1 X132.039 Y143.742 E.51014
G2 X132.783 Y143.532 I-1.735 J-7.575 E.02385
G1 X143.539 Y132.776 E.46858
G3 X143.268 Y133.582 I-88.501 J-29.327 E.02619
G1 X133.589 Y143.261 E.42165
G2 X134.479 Y142.906 I-3.112 J-9.095 E.02951
G1 X142.907 Y134.478 E.36718
G3 X142.417 Y135.502 I-10.515 J-4.398 E.03499
G1 X135.496 Y142.424 E.30154
G2 X136.762 Y141.692 I-6.696 J-13.05 E.04507
G1 X141.681 Y136.773 E.21429
G3 X139.918 Y139.057 I-13.36 J-8.49 E.08902
G3 X137.844 Y141.144 I-84.603 J-81.977 E.09062
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X139.254 Y139.725 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/32
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.2 I.177 J-1.204 P1  F42000
G1 X113.426 Y135.937 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X126.76 Y111.456 I14.566 J-7.938 E1.09807
G3 X128.449 Y111.416 I1.224 J16.245 E.05606
G3 X113.454 Y135.99 I-.458 J16.582 E2.30137
M204 S10000
G1 X113.068 Y136.132 F42000
G1 F5400
M204 S6000
G3 X126.73 Y111.05 I14.924 J-8.133 E1.12502
G3 X128.46 Y111.009 I1.254 J16.637 E.05742
G3 X113.097 Y136.184 I-.468 J16.989 E2.35793
M204 S250
G1 X112.727 Y136.316 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.328 Y135.547 E.02662
G3 X126.701 Y110.659 I15.664 J-7.549 E1.03948
G3 X128.47 Y110.617 I1.284 J17.021 E.0544
G3 X112.75 Y136.368 I-.478 J17.381 E2.23474
; WIPE_START
M204 S6000
G1 X112.328 Y135.547 E-.35053
G1 X111.976 Y134.755 E-.32965
G1 X111.899 Y134.559 E-.07981
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


G1 X114.842 Y137.83 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F15000
M204 S6000
G1 X116.664 Y139.652 E.07937
G2 X119.239 Y141.693 I11.851 J-12.311 E.10137
G1 X114.318 Y136.772 E.21437
G3 X113.582 Y135.501 I13.85 J-8.872 E.04526
G1 X120.505 Y142.424 E.30161
M73 P76 R4
G2 X121.522 Y142.906 I9.514 J-18.754 E.03466
G1 X113.093 Y134.477 E.36722
G3 X112.731 Y133.581 I8.782 J-4.06 E.02976
G1 X122.411 Y143.261 E.42169
G2 X123.217 Y143.532 I3.123 J-7.942 E.02621
G1 X112.461 Y132.776 E.46861
G1 X112.251 Y132.032 E.02381
G1 X123.962 Y143.742 E.51017
G2 X124.66 Y143.906 I1.982 J-6.903 E.02208
G1 X112.092 Y131.338 E.54752
G3 X111.97 Y130.681 I6.507 J-1.547 E.02057
G1 X125.32 Y144.032 E.58161
G1 X125.95 Y144.127 E.01961
G1 X111.878 Y130.055 E.61303
G3 X111.811 Y129.453 I5.994 J-.973 E.01866
G1 X126.546 Y144.188 E.6419
G2 X127.121 Y144.228 I.696 J-5.745 E.01778
G1 X111.768 Y128.875 E.66885
G3 X111.751 Y128.324 I5.522 J-.446 E.01701
G1 X127.679 Y144.252 E.69391
G1 X128.214 Y144.252 E.01647
G1 X111.748 Y127.786 E.71732
G1 X111.761 Y127.265 E.01607
G1 X128.732 Y144.236 E.73933
G2 X129.24 Y144.209 I-.012 J-5.09 E.01568
G1 X111.795 Y126.764 E.75999
G3 X111.837 Y126.272 I4.95 J.179 E.01522
G1 X129.726 Y144.161 E.77932
G2 X130.204 Y144.104 I-.332 J-4.813 E.01482
G1 X111.897 Y125.797 E.79753
G3 X111.967 Y125.333 I4.686 J.476 E.01446
G1 X130.668 Y144.034 E.81469
G2 X131.12 Y143.95 I-.61 J-4.569 E.01414
G1 X112.048 Y124.878 E.83086
G3 X112.143 Y124.439 I4.451 J.734 E.01386
G1 X131.564 Y143.86 E.84609
G2 X131.993 Y143.754 I-.845 J-4.324 E.0136
G1 X112.242 Y124.003 E.86042
G3 X112.359 Y123.586 I4.264 J.966 E.01337
G1 X132.418 Y143.645 E.87387
G1 X132.827 Y143.519 E.01317
G1 X112.478 Y123.17 E.88649
G1 X112.612 Y122.77 E.013
G1 X133.233 Y143.39 E.89833
G1 X133.625 Y143.248 E.01285
G1 X112.75 Y122.372 E.90942
G1 X112.9 Y121.989 E.01271
G1 X134.014 Y143.102 E.9198
G1 X134.39 Y142.944 E.01257
G1 X113.054 Y121.608 E.92947
G1 X113.22 Y121.239 E.01245
G1 X134.763 Y142.782 E.93847
G1 X135.124 Y142.608 E.01234
G1 X113.39 Y120.874 E.94682
G1 X113.571 Y120.521 E.01223
G1 X135.482 Y142.431 E.95453
G1 X135.828 Y142.243 E.01214
G1 X113.754 Y120.17 E.96161
G1 X113.95 Y119.831 E.01206
G1 X136.172 Y142.053 E.96808
G1 X136.504 Y141.85 E.01198
G1 X114.147 Y119.493 E.97396
G1 X114.357 Y119.168 E.01191
G1 X136.835 Y141.646 E.97924
G1 X137.153 Y141.43 E.01185
G1 X114.567 Y118.843 E.98395
G1 X114.79 Y118.532 E.0118
G1 X137.471 Y141.213 E.98806
G2 X137.776 Y140.983 I-2.152 J-3.176 E.01177
G1 X115.014 Y118.221 E.99161
G3 X115.249 Y117.922 I3.114 J2.21 E.01173
G1 X138.08 Y140.753 E.9946
G2 X138.373 Y140.511 I-2.271 J-3.057 E.0117
G1 X115.487 Y117.625 E.99704
G3 X115.734 Y117.338 I3.004 J2.334 E.01168
G1 X138.664 Y140.268 E.99893
G2 X138.946 Y140.015 I-2.396 J-2.95 E.01167
G1 X115.984 Y117.054 E1.00028
G3 X116.243 Y116.778 I2.889 J2.451 E.01166
G1 X139.223 Y139.757 E1.00109
G2 X139.493 Y139.493 I-2.513 J-2.838 E.01165
G1 X116.507 Y116.507 E1.00136
G3 X116.777 Y116.243 I2.784 J2.574 E.01165
G1 X139.757 Y139.222 E1.00109
G2 X140.016 Y138.946 I-2.638 J-2.733 E.01166
G1 X117.055 Y115.985 E1.00028
G3 X117.336 Y115.732 I2.676 J2.695 E.01167
G1 X140.266 Y138.662 E.99893
G2 X140.514 Y138.375 I-2.751 J-2.616 E.01168
G1 X117.627 Y115.488 E.99704
G3 X117.92 Y115.247 I2.561 J2.812 E.0117
G1 X140.751 Y138.077 E.9946
G2 X140.986 Y137.778 I-2.87 J-2.503 E.01173
G1 X118.224 Y115.016 E.99161
G3 X118.529 Y114.787 I2.465 J2.958 E.01177
G1 X141.21 Y137.467 E.98806
G1 X141.433 Y137.156 E.0118
G1 X118.847 Y114.57 E.98395
G1 X119.165 Y114.353 E.01185
G1 X141.643 Y136.831 E.97924
G1 X141.853 Y136.507 E.01191
G1 X119.496 Y114.15 E.97395
G1 X119.828 Y113.947 E.01198
G1 X142.05 Y136.169 E.96808
G1 X142.246 Y135.83 E.01206
G1 X120.172 Y113.757 E.9616
G1 X120.519 Y113.568 E.01214
G1 X142.429 Y135.479 E.95452
G1 X142.61 Y135.126 E.01223
G1 X120.877 Y113.392 E.94681
G1 X121.238 Y113.218 E.01234
G1 X142.78 Y134.76 E.93847
G1 X142.946 Y134.392 E.01245
M73 P77 R4
G1 X121.61 Y113.056 E.92947
G1 X121.987 Y112.898 E.01257
G1 X143.1 Y134.011 E.91979
G1 X143.25 Y133.627 E.01271
G1 X122.375 Y112.752 E.90941
G1 X122.767 Y112.609 E.01285
G1 X143.388 Y133.23 E.89832
G1 X143.522 Y132.83 E.013
G1 X123.174 Y112.481 E.88648
G1 X123.582 Y112.355 E.01317
G1 X143.641 Y132.414 E.87386
G2 X143.758 Y131.996 I-4.12 J-1.376 E.01337
G1 X124.008 Y112.246 E.86041
G3 X124.436 Y112.14 I1.277 J4.233 E.0136
G1 X143.857 Y131.561 E.84608
G2 X143.952 Y131.121 I-4.361 J-1.174 E.01386
G1 X124.881 Y112.05 E.83085
G3 X125.332 Y111.966 I1.061 J4.488 E.01414
G1 X144.033 Y130.667 E.81468
G2 X144.103 Y130.203 I-4.616 J-.94 E.01446
G1 X125.797 Y111.896 E.79751
G3 X126.274 Y111.839 I.81 J4.756 E.01482
G1 X144.163 Y129.728 E.7793
G2 X144.205 Y129.236 I-4.911 J-.671 E.01523
G1 X126.76 Y111.791 E.75998
G3 X127.268 Y111.764 I.522 J5.112 E.01568
G1 X144.239 Y128.735 E.73932
G1 X144.252 Y128.213 E.01607
G1 X127.787 Y111.748 E.71728
G1 X128.323 Y111.749 E.0165
G1 X144.249 Y127.676 E.69383
G2 X144.232 Y127.124 I-5.544 J-.105 E.01701
G1 X128.879 Y111.772 E.66883
G3 X129.455 Y111.812 I-.12 J5.782 E.01778
G1 X144.189 Y126.546 E.64188
G2 X144.122 Y125.945 I-6.064 J.372 E.01866
G1 X130.05 Y111.873 E.613
G1 X130.68 Y111.968 E.01961
G1 X144.03 Y125.318 E.58158
G2 X143.908 Y124.662 I-6.639 J.893 E.02058
G1 X131.341 Y112.094 E.54749
G3 X132.039 Y112.258 I-1.283 J7.063 E.02208
G1 X143.749 Y123.968 E.51014
G1 X143.539 Y123.224 E.02381
G1 X132.783 Y112.468 E.46858
G3 X133.589 Y112.739 I-2.32 J8.221 E.02621
G1 X143.268 Y122.418 E.42165
G2 X142.907 Y121.522 I-9.149 J3.168 E.02976
G1 X134.479 Y113.094 E.36718
G3 X135.496 Y113.576 I-8.491 J19.218 E.03467
G1 X142.417 Y120.498 E.30155
G2 X141.681 Y119.227 I-14.592 J7.606 E.04527
G1 X136.762 Y114.308 E.21429
G3 X139.342 Y116.353 I-9.29 J14.368 E.10158
G1 X141.157 Y118.168 E.07907
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X139.743 Y116.754 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/32
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
M106 S173.4
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-.717 J-.984 P1  F42000
G1 X113.375 Y135.964 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X119.677 Y113.583 I14.616 J-7.962 E.85387
G3 X128.721 Y111.373 I8.307 J14.387 E.31305
G3 X113.404 Y136.017 I-.73 J16.628 E2.30022
M204 S10000
G1 X113.017 Y136.159 F42000
G1 F5400
M204 S6000
G3 X119.473 Y113.231 I14.974 J-8.157 E.87475
G3 X128.742 Y110.967 I8.51 J14.739 E.32079
G3 X113.046 Y136.212 I-.75 J17.035 E2.35645
M204 S250
G1 X112.677 Y136.342 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.276 Y135.572 E.02666
G3 X119.277 Y112.891 I15.715 J-7.57 E.80218
G3 X128.761 Y110.575 I8.706 J15.078 E.30406
G3 X112.699 Y136.393 I-.77 J17.427 E2.23315
; WIPE_START
M204 S6000
G1 X112.276 Y135.572 E-.35095
G1 X111.924 Y134.777 E-.3306
G1 X111.848 Y134.585 E-.07845
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


G1 X121.065 Y118.21 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42441
G1 F15000
M204 S6000
G1 X119.622 Y119.653 E.06344
G2 X117.801 Y122.013 I8.042 J8.086 E.09291
G1 X122.018 Y117.797 E.18537
G3 X123.138 Y117.216 I4.42 J7.156 E.03925
G1 X117.223 Y123.131 E.26003
G2 X116.856 Y124.038 I12.212 J5.474 E.03042
G1 X124.035 Y116.859 E.31561
G3 X124.829 Y116.605 I5.295 J15.176 E.0259
G1 X116.609 Y124.825 E.36138
G2 X116.431 Y125.541 I7.093 J2.134 E.02296
G1 X125.54 Y116.432 E.40045
G3 X126.2 Y116.312 I1.536 J6.552 E.02086
G1 X116.309 Y126.203 E.43486
G2 X116.23 Y126.822 I6.165 J1.104 E.01939
G1 X126.818 Y116.234 E.4655
G3 X127.402 Y116.19 I.734 J5.829 E.0182
G1 X116.186 Y127.405 E.49309
G2 X116.172 Y127.959 I5.526 J.417 E.01722
G1 X127.956 Y116.174 E.51809
G3 X128.486 Y116.184 I.169 J5.312 E.01648
G1 X116.183 Y128.487 E.5409
G2 X116.216 Y128.994 I5.092 J-.076 E.01579
G1 X128.995 Y116.215 E.56181
G3 X129.485 Y116.265 I-.25 J4.895 E.01531
G1 X116.268 Y129.482 E.58106
G2 X116.336 Y129.953 I4.754 J-.453 E.0148
G1 X129.953 Y116.335 E.59866
G3 X130.407 Y116.422 I-.639 J4.58 E.01435
G1 X116.42 Y130.408 E.6149
G1 X116.52 Y130.848 E.01401
G1 X130.846 Y116.522 E.62981
G3 X131.273 Y116.634 I-.911 J4.323 E.01373
G1 X116.636 Y131.272 E.6435
G2 X116.763 Y131.684 I4.195 J-1.064 E.01343
G1 X131.685 Y116.761 E.65605
G3 X132.084 Y116.902 I-1.214 J4.079 E.01315
G1 X116.9 Y132.086 E.66755
G1 X117.052 Y132.474 E.01294
G1 X132.473 Y117.052 E.67797
G1 X132.853 Y117.212 E.0128
G1 X117.215 Y132.85 E.6875
G2 X117.386 Y133.219 I3.779 J-1.536 E.01263
G1 X133.218 Y117.387 E.69599
G3 X133.574 Y117.57 I-1.659 J3.673 E.01246
G1 X117.569 Y133.575 E.70363
G2 X117.763 Y133.921 I3.554 J-1.77 E.01232
G1 X133.923 Y117.761 E.71044
G1 X134.258 Y117.965 E.0122
G1 X117.965 Y134.259 E.71631
G1 X118.176 Y134.587 E.01213
G1 X134.586 Y118.177 E.7214
G1 X134.906 Y118.396 E.01207
M73 P78 R4
G1 X118.399 Y134.904 E.72572
G2 X118.628 Y135.214 I3.223 J-2.136 E.012
G1 X135.213 Y118.629 E.72915
G3 X135.514 Y118.868 I-2.245 J3.132 E.01194
G1 X118.867 Y135.514 E.73185
G2 X119.116 Y135.805 I3.04 J-2.352 E.0119
G1 X135.807 Y119.114 E.7338
G3 X136.088 Y119.372 I-2.441 J2.931 E.01187
G1 X119.371 Y136.089 E.73493
G1 X119.637 Y136.363 E.01186
G1 X136.363 Y119.637 E.73529
G1 X136.629 Y119.91 E.01186
G1 X119.912 Y136.627 E.73493
G2 X120.193 Y136.886 I2.735 J-2.686 E.01187
G1 X136.884 Y120.195 E.7338
G3 X137.133 Y120.486 I-2.786 J2.638 E.0119
G1 X120.486 Y137.132 E.73185
G2 X120.787 Y137.371 I2.547 J-2.895 E.01194
G1 X137.372 Y120.786 E.72916
G3 X137.601 Y121.096 I-2.993 J2.446 E.012
G1 X121.094 Y137.604 E.72572
G1 X121.414 Y137.823 E.01207
G1 X137.824 Y121.413 E.7214
G1 X138.035 Y121.741 E.01213
G1 X121.742 Y138.035 E.71631
G1 X122.077 Y138.239 E.0122
G1 X138.237 Y122.079 E.71044
G3 X138.431 Y122.425 I-3.359 J2.115 E.01232
G1 X122.426 Y138.43 E.70364
G2 X122.782 Y138.613 I2.009 J-3.477 E.01246
G1 X138.614 Y122.781 E.696
G3 X138.785 Y123.149 I-3.605 J1.902 E.01263
G1 X123.147 Y138.788 E.6875
G1 X123.526 Y138.948 E.0128
G1 X138.948 Y123.526 E.67798
G1 X139.1 Y123.914 E.01294
G1 X123.916 Y139.098 E.66755
G2 X124.314 Y139.239 I1.611 J-3.933 E.01315
G1 X139.237 Y124.316 E.65606
G3 X139.364 Y124.728 I-4.07 J1.478 E.01342
G1 X124.727 Y139.366 E.64351
G2 X125.154 Y139.478 I1.339 J-4.214 E.01373
G1 X139.48 Y125.152 E.62981
G1 X139.58 Y125.592 E.01401
G1 X125.593 Y139.578 E.6149
G2 X126.046 Y139.665 I1.092 J-4.492 E.01435
G1 X139.664 Y126.047 E.59866
G3 X139.732 Y126.518 I-4.682 J.923 E.0148
G1 X126.515 Y139.735 E.58107
G2 X127.005 Y139.785 I.745 J-4.898 E.01531
G1 X139.784 Y127.006 E.56182
G3 X139.817 Y127.512 I-5.052 J.582 E.01579
G1 X127.514 Y139.816 E.5409
G2 X128.043 Y139.826 I.361 J-5.296 E.01648
G1 X139.828 Y128.041 E.5181
G3 X139.814 Y128.594 I-5.53 J.137 E.01722
G1 X128.598 Y139.81 E.49309
G2 X129.182 Y139.766 I-.149 J-5.868 E.0182
G1 X139.771 Y129.178 E.46552
G3 X139.691 Y129.796 I-58.809 J-7.218 E.01939
G1 X129.8 Y139.688 E.43486
G2 X130.46 Y139.568 I-.875 J-6.673 E.02086
G1 X139.569 Y130.459 E.40046
G3 X139.391 Y131.175 I-7.276 J-1.418 E.02296
G1 X131.171 Y139.395 E.36139
G2 X131.965 Y139.142 I-4.558 J-15.606 E.0259
G1 X139.144 Y131.962 E.31563
G3 X138.777 Y132.869 I-12.532 J-4.548 E.03042
G1 X132.862 Y138.784 E.26004
G2 X133.982 Y138.204 I-3.288 J-7.715 E.03925
G1 X138.199 Y133.986 E.1854
G3 X136.672 Y136.046 I-10.457 J-6.158 E.07984
G3 X134.935 Y137.79 I-70.915 J-68.883 E.07653
; WIPE_START
G1 X136.346 Y136.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.038 Y137.625 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X137.625 Y141.038 E.14831
M204 S10000
G1 X136.077 Y142.054 F42000
G1 F1800
M204 S2000
G1 X142.042 Y136.088 E.25924
M204 S10000
G1 X142.638 Y134.958 F42000
G1 F1800
M204 S2000
G1 X134.965 Y142.632 E.33345
G1 X134.012 Y143.052
G1 X143.047 Y134.017 E.39261
G1 X143.357 Y133.173
G1 X133.167 Y143.364 E.44282
G1 X132.395 Y143.602
G1 X143.596 Y132.401 E.48672
G1 X143.781 Y131.683
G1 X131.678 Y143.785 E.52592
G1 X131.005 Y143.925
G1 X143.925 Y131.006 E.56141
G1 X144.036 Y130.362
G1 X130.366 Y144.031 E.59401
G1 X129.754 Y144.11
G1 X144.112 Y129.752 E.62394
G1 X144.163 Y129.168
G1 X129.164 Y144.167 E.65178
G1 X128.603 Y144.195
G1 X135.021 Y137.777 E.2789
M204 S10000
G1 X133.627 Y138.637 F42000
G1 F1800
M204 S2000
G1 X128.059 Y144.205 E.24195
G1 X127.529 Y144.202
G1 X132.62 Y139.111 E.22123
G1 X131.768 Y139.43
G1 X127.022 Y144.176 E.20624
G1 X126.526 Y144.138
G1 X131.015 Y139.649 E.19508
G1 X130.325 Y139.806
G1 X126.041 Y144.09 E.18614
G1 X125.575 Y144.023
G1 X129.683 Y139.915 E.17849
G1 X129.08 Y139.985
G1 X125.115 Y143.95 E.17228
G1 X124.672 Y143.86
G1 X128.509 Y140.022 E.16676
G1 X127.965 Y140.033
G1 X124.235 Y143.763 E.1621
G1 X123.81 Y143.655
G1 X127.445 Y140.02 E.15795
G1 X126.944 Y139.987
G1 X123.394 Y143.538 E.15427
G1 X122.987 Y143.412
G1 X126.462 Y139.937 E.151
G1 X125.998 Y139.867
M73 P79 R4
G1 X122.59 Y143.276 E.14812
G1 X122.199 Y143.133
G1 X125.551 Y139.781 E.14567
G1 X125.116 Y139.683
G1 X121.819 Y142.98 E.14329
G1 X121.443 Y142.822
G1 X124.693 Y139.572 E.14122
G1 X124.286 Y139.447
G1 X121.079 Y142.653 E.13934
G1 X120.719 Y142.48
G1 X123.89 Y139.309 E.13778
G1 X123.503 Y139.163
G1 X120.369 Y142.296 E.13618
G1 X120.024 Y142.108
G1 X123.128 Y139.004 E.13488
G1 X122.765 Y138.834
G1 X119.688 Y141.911 E.13372
G1 X119.357 Y141.709
G1 X122.409 Y138.657 E.13264
G1 X122.064 Y138.469
G1 X119.033 Y141.499 E.1317
G1 X118.716 Y141.283
G1 X121.729 Y138.27 E.13094
G1 X121.401 Y138.065
G1 X118.405 Y141.061 E.13021
G1 X118.102 Y140.831
G1 X121.084 Y137.848 E.12962
G1 X120.776 Y137.623
G1 X117.802 Y140.597 E.12923
G1 X117.512 Y140.354
G1 X120.474 Y137.393 E.12868
G1 X120.184 Y137.149
G1 X117.225 Y140.108 E.12858
G1 X116.948 Y139.852
G1 X119.9 Y136.899 E.12828
G1 X119.624 Y136.643
G1 X116.672 Y139.594 E.12825
G1 X116.409 Y139.324
G1 X119.359 Y136.374 E.1282
G1 X119.1 Y136.1
G1 X116.146 Y139.055 E.12838
G1 X115.894 Y138.773
G1 X118.85 Y135.817 E.12844
G1 X118.61 Y135.524
G1 X115.644 Y138.489 E.12886
G1 X115.404 Y138.196
G1 X118.375 Y135.225 E.12908
G1 X118.152 Y134.915
G1 X115.168 Y137.899 E.12967
G1 X114.94 Y137.594
G1 X117.937 Y134.597 E.13024
G1 X117.727 Y134.273
G1 X114.716 Y137.284 E.13084
G1 X114.5 Y136.967
G1 X117.532 Y133.935 E.13174
G1 X117.344 Y133.59
G1 X114.291 Y136.643 E.13265
G1 X114.088 Y136.313
G1 X117.163 Y133.238 E.13364
G1 X116.997 Y132.871
G1 X113.893 Y135.975 E.13489
G1 X113.702 Y135.632
G1 X116.838 Y132.496 E.13627
G1 X116.688 Y132.113
G1 X113.522 Y135.279 E.1376
G1 X113.345 Y134.922
G1 X116.554 Y131.714 E.13943
G1 X116.43 Y131.305
G1 X113.18 Y134.555 E.14124
G1 X113.018 Y134.183
G1 X116.316 Y130.885 E.14331
G1 X116.217 Y130.451
G1 X112.868 Y133.8 E.14553
G1 X112.723 Y133.412
G1 X116.134 Y130 E.14823
G1 X116.065 Y129.536
G1 X112.589 Y133.012 E.15107
G1 X112.462 Y132.606
G1 X116.012 Y129.056 E.15429
G1 X115.977 Y128.558
G1 X112.345 Y132.19 E.15785
G1 X112.238 Y131.764
G1 X115.964 Y128.037 E.16195
G1 X115.976 Y127.492
G1 X112.138 Y131.33 E.16676
G1 X112.053 Y130.882
G1 X116.014 Y126.921 E.17212
G1 X116.084 Y126.318
G1 X111.974 Y130.428 E.1786
G1 X111.913 Y129.955
G1 X116.191 Y125.678 E.18588
G1 X116.347 Y124.988
G1 X111.86 Y129.475 E.19499
G1 X111.823 Y128.979
G1 X116.573 Y124.229 E.20641
G1 X116.885 Y123.383
G1 X111.802 Y128.467 E.22091
G1 X111.791 Y127.944
G1 X117.363 Y122.373 E.24211
M204 S10000
G1 X118.239 Y120.963 F42000
G1 F1800
M204 S2000
M73 P80 R4
G1 X111.805 Y127.397 E.27959
; WIPE_START
M204 S6000
G1 X113.219 Y125.983 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X120.825 Y126.626 Z5.6 F42000
G1 X144.195 Y128.603 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S2000
G1 X137.761 Y135.036 E.27958
M204 S10000
G1 X138.637 Y133.627 F42000
G1 F1800
M204 S2000
G1 X144.209 Y128.056 E.2421
G1 X144.198 Y127.533
G1 X139.115 Y132.616 E.22091
G1 X139.427 Y131.771
G1 X144.177 Y127.021 E.20641
G1 X144.14 Y126.525
G1 X139.653 Y131.012 E.19498
G1 X139.809 Y130.322
G1 X144.087 Y126.045 E.18588
G1 X144.026 Y125.572
G1 X139.916 Y129.682 E.1786
G1 X139.986 Y129.079
G1 X143.947 Y125.118 E.17212
G1 X143.862 Y124.67
G1 X140.024 Y128.508 E.16676
G1 X140.036 Y127.963
G1 X143.762 Y124.236 E.16195
G1 X143.655 Y123.81
G1 X140.023 Y127.442 E.15785
G1 X139.988 Y126.944
G1 X143.538 Y123.394 E.15429
G1 X143.411 Y122.987
G1 X139.935 Y126.464 E.15107
G1 X139.866 Y125.999
G1 X143.277 Y122.588 E.14823
G1 X143.132 Y122.2
G1 X139.783 Y125.549 E.14553
G1 X139.684 Y125.115
G1 X142.982 Y121.817 E.14331
G1 X142.82 Y121.445
G1 X139.57 Y124.695 E.14124
G1 X139.446 Y124.286
G1 X142.655 Y121.078 E.13943
G1 X142.478 Y120.721
G1 X139.312 Y123.887 E.1376
G1 X139.162 Y123.504
G1 X142.298 Y120.368 E.13627
G1 X142.107 Y120.025
G1 X139.003 Y123.129 E.13489
G1 X138.837 Y122.762
G1 X141.912 Y119.687 E.13364
G1 X141.709 Y119.357
G1 X138.656 Y122.41 E.13265
G1 X138.468 Y122.065
G1 X141.499 Y119.033 E.13174
G1 X141.283 Y118.716
G1 X138.273 Y121.727 E.13084
G1 X138.063 Y121.403
G1 X141.06 Y118.406 E.13024
G1 X140.832 Y118.101
M73 P80 R3
G1 X137.848 Y121.085 E.12968
G1 X137.625 Y120.774
G1 X140.596 Y117.804 E.12908
G1 X140.356 Y117.511
G1 X137.39 Y120.476 E.12886
G1 X137.15 Y120.183
G1 X140.106 Y117.227 E.12844
G1 X139.854 Y116.945
G1 X136.9 Y119.9 E.12838
G1 X136.641 Y119.626
G1 X139.591 Y116.675 E.1282
G1 X139.328 Y116.406
G1 X136.376 Y119.357 E.12825
G1 X136.1 Y119.1
G1 X139.052 Y116.148 E.12828
G1 X138.775 Y115.892
G1 X135.816 Y118.851 E.12858
G1 X135.526 Y118.607
G1 X138.487 Y115.646 E.12868
G1 X138.198 Y115.403
G1 X135.224 Y118.377 E.12923
G1 X134.916 Y118.151
G1 X137.898 Y115.169 E.12962
G1 X137.595 Y114.939
G1 X134.598 Y117.935 E.13021
G1 X134.27 Y117.73
G1 X137.284 Y114.717 E.13094
G1 X136.967 Y114.501
G1 X133.936 Y117.531 E.1317
G1 X133.591 Y117.343
G1 X136.643 Y114.291 E.13264
G1 X136.312 Y114.088
G1 X133.235 Y117.166 E.13372
G1 X132.872 Y116.995
G1 X135.976 Y113.892 E.13488
G1 X135.631 Y113.704
G1 X132.497 Y116.837 E.13618
G1 X132.11 Y116.691
G1 X135.281 Y113.52 E.13778
G1 X134.921 Y113.347
G1 X131.714 Y116.553 E.13934
G1 X131.307 Y116.428
G1 X134.556 Y113.178 E.14122
G1 X134.181 Y113.02
G1 X130.884 Y116.317 E.1433
G1 X130.449 Y116.219
G1 X133.801 Y112.867 E.14567
G1 X133.41 Y112.724
G1 X130.002 Y116.133 E.14812
G1 X129.538 Y116.063
G1 X133.013 Y112.588 E.151
G1 X132.606 Y112.462
G1 X129.056 Y116.013 E.15428
G1 X128.555 Y115.98
G1 X132.19 Y112.345 E.15795
G1 X131.765 Y112.237
G1 X128.035 Y115.967 E.1621
G1 X127.491 Y115.978
G1 X131.328 Y112.14 E.16676
G1 X130.885 Y112.05
G1 X126.92 Y116.015 E.17228
G1 X126.317 Y116.085
G1 X130.424 Y111.977 E.17849
G1 X129.958 Y111.91
G1 X125.675 Y116.194 E.18614
M73 P81 R3
G1 X124.984 Y116.351
G1 X129.474 Y111.862 E.19509
G1 X128.978 Y111.824
G1 X124.232 Y116.57 E.20624
G1 X123.379 Y116.889
G1 X128.47 Y111.798 E.22123
G1 X127.94 Y111.795
G1 X122.372 Y117.363 E.24196
M204 S10000
G1 X120.979 Y118.223 F42000
G1 F1800
M204 S2000
G1 X127.397 Y111.805 E.27891
G1 X126.836 Y111.833
G1 X111.837 Y126.832 E.65177
G1 X111.888 Y126.248
G1 X126.246 Y111.89 E.62393
G1 X125.634 Y111.969
G1 X111.964 Y125.638 E.59401
G1 X112.075 Y124.994
G1 X124.994 Y112.075 E.5614
G1 X124.321 Y112.215
G1 X112.219 Y124.317 E.52591
G1 X112.404 Y123.598
G1 X123.605 Y112.398 E.48671
G1 X122.833 Y112.636
G1 X112.643 Y122.826 E.44281
G1 X112.953 Y121.983
G1 X121.988 Y112.949 E.39259
G1 X121.035 Y113.368
G1 X113.362 Y121.041 E.33344
M204 S10000
G1 X113.958 Y119.912 F42000
G1 F1800
M204 S2000
G1 X119.923 Y113.947 E.25922
M204 S10000
G1 X118.374 Y114.962 F42000
G1 F1800
M204 S2000
G1 X114.962 Y118.374 E.14828
M204 S10000
G1 X115.022 Y118.435 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.214222
G1 F15000
M204 S6000
G1 X114.837 Y118.653 E.00399
; LINE_WIDTH: 0.175557
G1 X114.652 Y118.871 E.00309
; LINE_WIDTH: 0.13917
G1 X114.541 Y119.007 E.00138
; LINE_WIDTH: 0.105102
G1 X114.431 Y119.144 E.00089
M204 S10000
G1 X114.019 Y119.973 F42000
; LINE_WIDTH: 0.206645
G1 F15000
M204 S6000
G1 X113.913 Y120.111 E.00232
; LINE_WIDTH: 0.173103
G1 X113.807 Y120.249 E.00184
; LINE_WIDTH: 0.139248
G1 X113.735 Y120.348 E.00097
; LINE_WIDTH: 0.105119
G1 X113.662 Y120.447 E.00062
M204 S10000
G1 X113.424 Y121.103 F42000
; LINE_WIDTH: 0.192508
G1 F15000
M204 S6000
G1 X113.337 Y121.229 E.00186
; LINE_WIDTH: 0.150772
G1 X113.25 Y121.354 E.00134
; LINE_WIDTH: 0.109037
G1 X113.164 Y121.48 E.00082
; WIPE_START
G1 X113.25 Y121.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.621 Y128.609 Z5.6 F42000
G1 X116.214 Y130.424 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.0980232
G1 F15000
M204 S6000
G1 X116.131 Y130.271 E.00078
M204 S10000
G1 X116.066 Y129.515 F42000
; LINE_WIDTH: 0.0980574
G1 F15000
M204 S6000
G1 X116.049 Y129.48 E.00018
G1 X116.049 Y129.286 E.00087
M204 S10000
G1 X117.077 Y122.951 F42000
; LINE_WIDTH: 0.108575
G1 F15000
M204 S6000
G1 X116.992 Y123.074 E.0008
; LINE_WIDTH: 0.149392
G1 X116.907 Y123.197 E.0013
; LINE_WIDTH: 0.190209
G1 X116.822 Y123.32 E.00179
M204 S10000
G1 X117.667 Y121.83 F42000
; LINE_WIDTH: 0.108086
G1 F15000
M204 S6000
G1 X117.569 Y121.957 E.00085
; LINE_WIDTH: 0.147933
G1 X117.472 Y122.084 E.00137
; LINE_WIDTH: 0.188303
G1 X117.372 Y122.215 E.00195
; LINE_WIDTH: 0.213664
G1 X117.301 Y122.311 E.00166
M204 S10000
G1 X120.918 Y118.163 F42000
; LINE_WIDTH: 0.218752
G1 F15000
M204 S6000
G1 X120.694 Y118.359 E.00427
; LINE_WIDTH: 0.184375
G1 X120.467 Y118.557 E.00347
; LINE_WIDTH: 0.15402
G1 X120.246 Y118.759 E.00271
; LINE_WIDTH: 0.109138
G1 X119.591 Y119.379 E.00487
G1 X118.757 Y120.246 E.00649
; LINE_WIDTH: 0.154181
G1 X118.557 Y120.469 E.00272
; LINE_WIDTH: 0.188046
G1 X118.354 Y120.696 E.00359
; LINE_WIDTH: 0.219388
G1 X118.179 Y120.903 E.0039
M204 S10000
G1 X122.311 Y117.302 F42000
; LINE_WIDTH: 0.197055
G1 F15000
M204 S6000
G1 X122.141 Y117.429 E.00267
; LINE_WIDTH: 0.149019
G1 X121.97 Y117.557 E.00185
; LINE_WIDTH: 0.106487
G1 X121.83 Y117.667 E.00092
M204 S10000
G1 X123.317 Y116.827 F42000
; LINE_WIDTH: 0.187306
G1 F15000
M204 S6000
G1 X123.18 Y116.92 E.00194
; LINE_WIDTH: 0.139988
G1 X123.041 Y117.013 E.00132
; LINE_WIDTH: 0.102107
G1 X122.955 Y117.074 E.00051
M204 S10000
G1 X124.918 Y116.284 F42000
; LINE_WIDTH: 0.123827
G1 F15000
M204 S6000
M73 P82 R3
G1 X124.65 Y116.442 E.00205
; WIPE_START
G1 X124.918 Y116.284 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.083 Y113.656 Z5.6 F42000
G1 X133.971 Y112.963 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.0922375
G1 F15000
M204 S6000
G1 X133.839 Y112.879 E.00063
M204 S10000
G1 X129.662 Y111.94 F42000
; LINE_WIDTH: 0.155698
G1 F15000
M204 S6000
G1 X129.453 Y111.841 E.00212
M204 S10000
G1 X122.374 Y112.796 F42000
; LINE_WIDTH: 0.209384
G1 F15000
M204 S6000
G1 X122.05 Y113.011 E.00528
M204 S10000
G1 X120.447 Y113.662 F42000
; LINE_WIDTH: 0.110305
G1 F15000
M204 S6000
G1 X120.293 Y113.777 E.00106
; LINE_WIDTH: 0.154592
G1 X120.139 Y113.892 E.00175
; LINE_WIDTH: 0.198878
G1 X119.984 Y114.008 E.00245
M204 S10000
G1 X119.153 Y114.421 F42000
; LINE_WIDTH: 0.109618
G1 F15000
M204 S6000
G1 X118.97 Y114.572 E.00129
; LINE_WIDTH: 0.152505
G1 X118.787 Y114.724 E.00212
; LINE_WIDTH: 0.195391
G1 X118.605 Y114.875 E.00295
; LINE_WIDTH: 0.226091
G1 X118.434 Y115.023 E.00336
; WIPE_START
G1 X118.605 Y114.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.534 Y119.682 Z5.6 F42000
G1 X142.837 Y134.52 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.109039
G1 F15000
M204 S6000
G1 X142.75 Y134.646 E.00082
; LINE_WIDTH: 0.150779
G1 X142.663 Y134.771 E.00134
; LINE_WIDTH: 0.19252
G1 X142.576 Y134.896 E.00186
M204 S10000
G1 X142.338 Y135.553 F42000
; LINE_WIDTH: 0.104765
G1 F15000
M204 S6000
G1 X142.267 Y135.65 E.00061
; LINE_WIDTH: 0.138155
G1 X142.196 Y135.747 E.00093
; LINE_WIDTH: 0.171977
G1 X142.089 Y135.887 E.00185
; LINE_WIDTH: 0.206243
G1 X141.981 Y136.027 E.00235
M204 S10000
G1 X141.569 Y136.856 F42000
; LINE_WIDTH: 0.105125
G1 F15000
M204 S6000
G1 X141.459 Y136.992 E.00089
; LINE_WIDTH: 0.139234
G1 X141.348 Y137.129 E.00138
; LINE_WIDTH: 0.175612
G1 X141.163 Y137.347 E.00309
; LINE_WIDTH: 0.21424
G1 X140.978 Y137.565 E.00399
; WIPE_START
G1 X141.163 Y137.347 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.821 Y135.097 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.219139
G1 F15000
M204 S6000
G1 X137.643 Y135.307 E.00396
; LINE_WIDTH: 0.187722
G1 X137.443 Y135.531 E.00354
; LINE_WIDTH: 0.153932
G1 X137.241 Y135.756 E.00274
; LINE_WIDTH: 0.105884
G1 X136.409 Y136.62 E.00616
G1 X135.975 Y137.038 E.00309
; LINE_WIDTH: 0.127792
G1 X135.754 Y137.241 E.00207
; LINE_WIDTH: 0.154072
G1 X135.531 Y137.445 E.00274
; LINE_WIDTH: 0.184475
G1 X135.306 Y137.641 E.00344
; LINE_WIDTH: 0.218711
G1 X135.081 Y137.837 E.00427
M204 S10000
G1 X138.699 Y133.689 F42000
; LINE_WIDTH: 0.21339
G1 F15000
M204 S6000
G1 X138.625 Y133.789 E.00173
; LINE_WIDTH: 0.18764
G1 X138.528 Y133.916 E.00189
; LINE_WIDTH: 0.147849
G1 X138.431 Y134.043 E.00137
; LINE_WIDTH: 0.108058
G1 X138.333 Y134.17 E.00085
M204 S10000
G1 X139.178 Y132.679 F42000
; LINE_WIDTH: 0.190221
G1 F15000
M204 S6000
G1 X139.093 Y132.802 E.00179
; LINE_WIDTH: 0.149399
G1 X139.008 Y132.925 E.0013
; LINE_WIDTH: 0.108577
G1 X138.923 Y133.048 E.0008
M204 S10000
G1 X139.87 Y125.729 F42000
; LINE_WIDTH: 0.0979419
G1 F15000
M204 S6000
G1 X139.786 Y125.576 E.00078
M204 S10000
G1 X134.17 Y138.333 F42000
; LINE_WIDTH: 0.10676
G1 F15000
M204 S6000
G1 X134.028 Y138.444 E.00094
; LINE_WIDTH: 0.14934
G1 X133.858 Y138.571 E.00184
; LINE_WIDTH: 0.197083
G1 X133.688 Y138.698 E.00266
M204 S10000
G1 X133.045 Y138.926 F42000
; LINE_WIDTH: 0.102246
G1 F15000
M204 S6000
G1 X132.958 Y138.988 E.00052
; LINE_WIDTH: 0.140073
G1 X132.82 Y139.08 E.00131
; LINE_WIDTH: 0.187244
G1 X132.683 Y139.173 E.00195
M204 S10000
G1 X131.35 Y139.558 F42000
; LINE_WIDTH: 0.124501
G1 F15000
M204 S6000
G1 X131.082 Y139.716 E.00206
; WIPE_START
G1 X131.35 Y139.558 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.95 Y142.989 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.209433
G1 F15000
M204 S6000
G1 X133.626 Y143.205 E.00528
M204 S10000
G1 X136.015 Y141.992 F42000
; LINE_WIDTH: 0.198877
G1 F15000
M204 S6000
G1 X135.861 Y142.108 E.00245
; LINE_WIDTH: 0.15459
G1 X135.707 Y142.223 E.00175
; LINE_WIDTH: 0.110304
G1 X135.553 Y142.338 E.00106
M204 S10000
G1 X137.565 Y140.978 F42000
; LINE_WIDTH: 0.225913
G1 F15000
M204 S6000
G1 X137.393 Y141.126 E.00338
; LINE_WIDTH: 0.195097
G1 X137.211 Y141.277 E.00294
; LINE_WIDTH: 0.152323
G1 X137.029 Y141.428 E.00211
; LINE_WIDTH: 0.109548
G1 X136.847 Y141.579 E.00129
M204 S10000
G1 X143.837 Y131.984 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G2 X139.406 Y139.693 I-15.841 J-3.977 E2.59363
G2 X143.821 Y132.042 I-11.462 J-11.713 E.2478
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X143.608 Y132.817 E-.30516
G1 X143.35 Y133.587 E-.30868
G1 X143.209 Y133.945 E-.14617
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/32
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
M106 S193.8
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.6 I1.198 J-.214 P1  F42000
G1 X140.616 Y119.423 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X141.017 Y120.045 E.02457
G3 X127.62 Y112.749 I-13.017 J7.952 E2.6493
G1 X128.38 Y112.749 E.02523
G3 X140.582 Y119.373 I-.38 J15.249 E.47815
M204 S10000
G1 X140.263 Y119.627 F42000
G1 F5400
M204 S6000
G1 X140.268 Y119.636 E.00032
G3 X127.63 Y113.156 I-12.268 J8.362 E2.60315
G1 X128.37 Y113.156 E.02456
G3 X139.836 Y119.035 I-.37 J14.842 E.44212
G1 X140.228 Y119.579 E.02224
M204 S250
G1 X139.944 Y119.857 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.64 Y113.548 I-11.944 J8.141 E2.34762
G1 X128.36 Y113.548 E.02215
G3 X139.91 Y119.807 I-.36 J14.45 E.41902
; WIPE_START
M204 S6000
G1 X140.336 Y120.462 E-.29665
G1 X140.696 Y121.086 E-.27405
G1 X140.923 Y121.53 E-.1893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.163 Y125.072 Z5.8 F42000
G1 X113.314 Y135.997 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X119.642 Y113.524 I14.677 J-7.995 E.85741
G3 X128.801 Y111.309 I8.341 J14.446 E.31688
G3 X113.343 Y136.05 I-.81 J16.694 E2.30721
M204 S10000
G1 X112.957 Y136.192 F42000
G1 F5400
M204 S6000
G3 X118.71 Y113.616 I15.035 J-8.189 E.84994
G3 X128.821 Y110.902 I9.295 J14.438 E.35289
G3 X112.986 Y136.244 I-.829 J17.1 E2.36348
M204 S250
G1 X112.62 Y136.38 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.612 Y136.379 E.00023
G3 X118.497 Y113.287 I15.379 J-8.377 E.80534
G3 X128.841 Y110.51 I9.508 J14.769 E.33439
G3 X113.049 Y137.136 I-.849 J17.492 E2.21445
G1 X112.65 Y136.432 E.02487
; WIPE_START
M204 S6000
G1 X112.612 Y136.379 E-.02462
G1 X112.219 Y135.6 E-.33185
G1 X111.86 Y134.804 E-.33184
G1 X111.791 Y134.628 E-.07169
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


G1 X138.766 Y115.83 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569056
G1 F11974.109
M204 S6000
G2 X139.359 Y116.382 I-10.765 J12.169 E4.3419
G1 X138.81 Y115.871 E.03214
; WIPE_START
G1 X139.359 Y116.382 E-.28491
G1 X139.924 Y116.962 E-.30777
G1 X140.215 Y117.293 E-.16732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.699 Y124.91 Z5.8 F42000
G1 X141.416 Y136.198 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.569135
G1 F11972.294
M204 S6000
G3 X141.808 Y135.519 I-13.413 J-8.198 E4.20176
G1 X141.446 Y136.146 E.03106
; WIPE_START
G1 X141.808 Y135.519 E-.27522
G1 X142.166 Y134.822 E-.29789
G1 X142.368 Y134.373 E-.18689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.77 Y133.652 Z5.8 F42000
G1 X115.58 Y131.831 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X123.863 Y115.686 I12.411 J-3.83 E.6664
G3 X128.763 Y115.035 I4.121 J12.262 E.165
G3 X115.598 Y131.888 I-.773 J12.965 E1.87374
M204 S10000
G1 X115.199 Y131.952 F42000
G1 F5400
M204 S6000
G1 X115.19 Y131.951 E.00028
G3 X123.733 Y115.3 I12.8 J-3.95 E.68729
G3 X128.784 Y114.629 I4.25 J12.646 E.17006
G3 X115.403 Y132.585 I-.793 J13.372 E1.9125
G1 X115.217 Y132.009 E.02007
M204 S250
G1 X114.827 Y132.077 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X114.816 Y132.067 E.00046
G3 X122.962 Y115.163 I13.175 J-4.065 E.6341
G3 X128.803 Y114.237 I5.045 J12.937 E.18313
G3 X115.036 Y132.719 I-.812 J13.764 E1.82353
G1 X114.845 Y132.134 E.01889
; WIPE_START
M204 S6000
G1 X114.816 Y132.067 E-.02795
G1 X114.636 Y131.403 E-.2614
G1 X114.483 Y130.732 E-.26122
G1 X114.388 Y130.19 E-.20943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.949 Y136.309 Z5.8 F42000
G1 X120.525 Y138.424 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X119.146 Y137.044 E.06007
G3 X117.15 Y134.514 I8.739 J-8.945 E.09947
G1 X121.482 Y138.846 E.18858
G2 X122.627 Y139.457 I6.702 J-11.183 E.03998
G1 X116.542 Y133.372 E.26492
G3 X116.153 Y132.448 I9.04 J-4.353 E.03086
G1 X123.55 Y139.846 E.32207
G2 X124.357 Y140.118 I3.127 J-7.94 E.0262
G1 X115.88 Y131.641 E.36906
M73 P83 R3
G3 X115.686 Y130.913 I7.192 J-2.303 E.0232
G1 X125.089 Y140.316 E.40937
G2 X125.765 Y140.457 I1.751 J-6.676 E.02127
G1 X115.546 Y130.239 E.44489
G3 X115.449 Y129.607 I6.276 J-1.288 E.01967
G1 X126.396 Y140.555 E.4766
G2 X126.992 Y140.616 I.908 J-5.922 E.01843
G1 X115.387 Y129.011 E.50523
G3 X115.354 Y128.444 I5.673 J-.616 E.01751
G1 X127.557 Y140.647 E.5313
G2 X128.098 Y140.653 I.334 J-5.414 E.01665
G1 X115.345 Y127.901 E.55521
G1 X115.358 Y127.379 E.01605
G1 X128.617 Y140.638 E.57725
G2 X129.118 Y140.605 I-.087 J-5.034 E.01545
G1 X115.395 Y126.882 E.59744
G3 X115.448 Y126.401 I4.843 J.291 E.01491
G1 X129.602 Y140.555 E.61622
G1 X130.066 Y140.485 E.01445
G1 X115.516 Y125.934 E.63349
G3 X115.596 Y125.48 I4.6 J.583 E.01419
G1 X130.516 Y140.401 E.64957
G2 X130.955 Y140.305 I-.74 J-4.435 E.01382
G1 X115.696 Y125.045 E.66434
G3 X115.806 Y124.621 I4.307 J.894 E.01349
G1 X131.381 Y140.196 E.67808
G2 X131.791 Y140.072 I-1.035 J-4.163 E.0132
G1 X115.926 Y124.207 E.69071
G1 X116.06 Y123.807 E.01299
G1 X132.192 Y139.939 E.70234
G1 X132.584 Y139.797 E.01283
G1 X116.205 Y123.418 E.71308
G3 X116.358 Y123.036 I3.89 J1.333 E.01266
G1 X132.962 Y139.64 E.72287
G2 X133.332 Y139.476 I-1.454 J-3.79 E.01248
G1 X116.524 Y122.668 E.73177
G3 X116.699 Y122.308 I3.692 J1.57 E.01231
G1 X133.693 Y139.303 E.73987
G2 X134.042 Y139.118 I-1.675 J-3.583 E.01217
G1 X116.88 Y121.955 E.74719
G3 X117.075 Y121.616 I3.526 J1.805 E.01205
G1 X134.385 Y138.927 E.75365
G1 X134.717 Y138.724 E.01196
G1 X117.275 Y121.283 E.75935
G1 X117.485 Y120.958 E.0119
G1 X135.041 Y138.514 E.76433
G1 X135.359 Y138.297 E.01184
G1 X117.705 Y120.643 E.76859
G3 X117.929 Y120.334 I3.221 J2.099 E.01178
G1 X135.664 Y138.068 E.77211
G2 X135.965 Y137.835 I-2.198 J-3.138 E.01173
G1 X118.166 Y120.036 E.77487
G3 X118.409 Y119.745 I3.045 J2.287 E.01168
G1 X136.255 Y137.591 E.77696
G2 X136.538 Y137.339 I-2.38 J-2.959 E.01166
G1 X118.66 Y119.461 E.77836
G3 X118.92 Y119.187 I2.874 J2.474 E.01164
G1 X136.815 Y137.082 E.77908
G2 X137.08 Y136.813 I-2.567 J-2.79 E.01164
G1 X119.185 Y118.918 E.77908
G1 X119.462 Y118.661 E.01164
G1 X137.34 Y136.539 E.77836
G1 X137.591 Y136.255 E.01165
G1 X119.745 Y118.409 E.77696
G1 X120.035 Y118.165 E.01167
G1 X137.833 Y135.964 E.77487
G1 X138.071 Y135.666 E.0117
G1 X120.336 Y117.932 E.77211
G3 X120.641 Y117.703 I2.442 J2.938 E.01175
G1 X138.295 Y135.357 E.76859
G2 X138.515 Y135.042 I-3.043 J-2.36 E.01182
G1 X120.959 Y117.486 E.76433
G3 X121.283 Y117.276 I2.27 J3.143 E.0119
G1 X138.724 Y134.717 E.75935
G2 X138.925 Y134.384 I-3.241 J-2.176 E.01199
G1 X121.615 Y117.073 E.75365
G3 X121.958 Y116.882 I2.085 J3.349 E.0121
G1 X139.12 Y134.045 E.74719
G1 X139.301 Y133.692 E.01222
G1 X122.307 Y116.697 E.73987
G1 X122.668 Y116.524 E.01232
G1 X139.476 Y133.332 E.73177
G1 X139.642 Y132.964 E.01243
G1 X123.038 Y116.36 E.72287
G3 X123.416 Y116.203 I1.76 J3.704 E.01259
G1 X139.795 Y132.582 E.71308
G2 X139.94 Y132.193 I-3.831 J-1.65 E.01279
G1 X123.808 Y116.061 E.70234
G3 X124.209 Y115.928 I1.532 J3.957 E.01302
G1 X140.074 Y131.793 E.69072
G2 X140.194 Y131.379 I-4.088 J-1.408 E.01328
G1 X124.619 Y115.804 E.67808
G1 X125.045 Y115.695 E.01353
G1 X140.304 Y130.955 E.66434
G1 X140.404 Y130.52 E.01374
G1 X125.483 Y115.599 E.64958
G3 X125.934 Y115.515 I1.069 J4.471 E.0141
G1 X140.484 Y130.066 E.63349
G2 X140.552 Y129.599 I-4.653 J-.913 E.01452
G1 X126.398 Y115.445 E.61622
G3 X126.882 Y115.395 I.744 J4.843 E.015
G1 X140.605 Y129.118 E.59745
G2 X140.642 Y128.621 I-4.898 J-.612 E.01536
G1 X127.383 Y115.362 E.57725
G3 X127.902 Y115.347 I.41 J5.195 E.016
G1 X140.655 Y128.099 E.55521
G2 X140.646 Y127.557 I-5.439 J-.185 E.01672
G1 X128.443 Y115.353 E.5313
G3 X129.016 Y115.392 I-.231 J7.618 E.0177
G1 X140.613 Y126.989 E.5049
G2 X140.551 Y126.393 I-6.009 J.325 E.01847
G1 X129.604 Y115.445 E.4766
G3 X130.235 Y115.543 I-.656 J6.367 E.01967
G1 X140.454 Y125.761 E.44489
M73 P84 R3
G2 X140.314 Y125.087 I-6.814 J1.062 E.0212
G1 X130.911 Y115.684 E.40938
G3 X131.643 Y115.882 I-1.618 J7.435 E.02337
G1 X140.12 Y124.359 E.36906
G2 X139.847 Y123.552 I-15.833 J4.906 E.02624
G1 X132.449 Y116.154 E.32207
G3 X133.373 Y116.543 I-4.806 J12.692 E.03086
G1 X139.458 Y122.628 E.26493
G2 X138.85 Y121.486 I-12.714 J6.035 E.03985
G1 X134.518 Y117.154 E.18859
G3 X136.831 Y118.932 I-6.686 J11.087 E.08999
G1 X138.408 Y120.51 E.06868
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.994 Y119.096 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/32
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
M106 S183.6
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.8 I-.157 J1.207 P1  F42000
G1 X140.982 Y119.615 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X141.19 Y119.94 E.01278
G3 X127.615 Y112.546 I-13.19 J8.058 E2.68459
G1 X128.385 Y112.546 E.02556
G3 X140.772 Y119.292 I-.385 J15.452 E.48586
G1 X140.949 Y119.565 E.01079
M204 S10000
G1 X140.64 Y119.836 F42000
G1 F5400
M204 S6000
G1 X140.843 Y120.152 E.01245
G3 X127.625 Y112.953 I-12.843 J7.846 E2.61387
G1 X128.375 Y112.953 E.02489
G3 X140.436 Y119.521 I-.375 J15.045 E.47306
G1 X140.607 Y119.786 E.01046
M204 S250
G1 X140.311 Y120.049 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.508 Y120.356 E.01123
G3 X127.635 Y113.345 I-12.508 J7.641 E2.35815
G1 X128.365 Y113.345 E.02246
G3 X140.112 Y119.742 I-.365 J14.653 E.42678
G1 X140.278 Y119.998 E.00938
; WIPE_START
M204 S6000
G1 X140.508 Y120.356 E-.16165
G1 X140.875 Y120.989 E-.27789
G1 X141.208 Y121.639 E-.27768
G1 X141.254 Y121.742 E-.04278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.456 Y125.211 Z6 F42000
G1 X113.299 Y136.006 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X126.75 Y111.311 I14.694 J-8.007 E1.10762
G3 X128.447 Y111.271 I1.397 J23.2 E.05633
G3 X113.328 Y136.058 I-.454 J16.728 E2.32185
M204 S10000
G1 X112.942 Y136.2 F42000
G1 F5400
M204 S6000
G3 X125.868 Y110.99 I15.052 J-8.201 E1.10615
G3 X128.467 Y110.864 I2.12 J16.893 E.08639
G3 X112.971 Y136.253 I-.473 J17.135 E2.37811
M204 S250
G1 X112.598 Y136.382 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.197 Y135.61 E.02672
G3 X125.819 Y110.601 I15.795 J-7.611 E1.02125
G3 X128.487 Y110.473 I2.166 J17.255 E.08213
G3 X112.622 Y136.435 I-.494 J17.526 E2.25318
; WIPE_START
M204 S6000
G1 X112.197 Y135.61 E-.35259
G1 X111.842 Y134.811 E-.33221
G1 X111.769 Y134.627 E-.0752
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


G1 X128.441 Y111.692 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47752
G1 F14496.083
M204 S6000
G2 X129.235 Y111.732 I-.433 J16.307 E3.60168
G1 X128.501 Y111.695 E.02603
; WIPE_START
G1 X129.235 Y111.732 E-.27935
G1 X130.045 Y111.814 E-.30913
G1 X130.491 Y111.882 E-.17153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.466 Y118.398 Z6 F42000
G1 X143.176 Y132.676 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.477536
G1 F14495.568
M204 S6000
G3 X143.39 Y131.913 I-15.173 J-4.682 E3.50528
G1 X143.192 Y132.618 E.02593
; WIPE_START
G1 X143.39 Y131.913 E-.27826
G1 X143.566 Y131.142 E-.30066
G1 X143.649 Y130.672 E-.18108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.023 Y130.987 Z6 F42000
G1 X115.58 Y131.831 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X123.254 Y115.907 I12.411 J-3.83 E.6449
G3 X128.609 Y115.028 I4.751 J12.181 E.18132
G3 X115.597 Y131.888 I-.618 J12.974 E1.87889
M204 S10000
G1 X115.19 Y131.951 F42000
G1 F5400
M204 S6000
G3 X123.105 Y115.528 I12.8 J-3.95 E.66512
G3 X128.629 Y114.621 I4.9 J12.563 E.18704
G3 X115.208 Y132.008 I-.639 J13.38 E1.9378
M204 S250
G1 X114.816 Y132.067 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.328 Y115.43 I13.175 J-4.065 E.61298
G3 X128.648 Y114.23 I5.655 J12.53 E.19952
G3 X114.834 Y132.124 I-.657 J13.772 E1.84764
; WIPE_START
M204 S6000
G1 X114.636 Y131.403 E-.28418
G1 X114.483 Y130.732 E-.26122
G1 X114.385 Y130.176 E-.21461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.369 Y130.212 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X121.56 Y124.022 E.26951
G1 X121.56 Y123.488 E.01645
G1 X115.448 Y129.599 E.26607
G3 X115.395 Y129.118 I4.793 J-.773 E.01491
G1 X121.843 Y122.67 E.28072
M204 S10000
G1 X123.125 Y121.388 F42000
G1 F15000
M204 S6000
G1 X129.11 Y115.403 E.26057
G3 X129.602 Y115.445 I-.064 J3.641 E.01522
G1 X123.942 Y121.105 E.24641
G1 X124.187 Y121.117 E.00755
G1 X124.422 Y121.16 E.00735
G1 X130.066 Y115.515 E.24574
G3 X130.516 Y115.599 I-.62 J4.558 E.0141
M73 P85 R3
G1 X125.001 Y121.115 E.24015
G3 X125.487 Y121.105 I.306 J3.077 E.01499
G1 X125.542 Y121.108 E.0017
G1 X130.955 Y115.695 E.23565
G1 X131.381 Y115.804 E.01353
G1 X125.996 Y121.188 E.23441
G2 X126.215 Y121.182 I.105 J-.16 E.00717
G1 X126.607 Y121.111 E.01227
G1 X131.791 Y115.928 E.22568
G3 X132.192 Y116.061 I-1.13 J4.09 E.01302
G1 X127.145 Y121.108 E.21977
G2 X127.365 Y121.13 I.498 J-3.987 E.00682
G1 X127.701 Y121.086 E.01044
G1 X132.584 Y116.203 E.21259
M73 P85 R2
G3 X132.962 Y116.36 I-1.39 J3.878 E.01259
G1 X128.242 Y121.079 E.20546
G1 X128.71 Y121.146 E.01454
G1 X133.332 Y116.524 E.20125
G1 X133.693 Y116.697 E.01232
G1 X129.236 Y121.154 E.19402
G3 X129.819 Y121.105 I.467 J2.073 E.01807
G1 X134.042 Y116.882 E.18384
G3 X134.385 Y117.073 I-1.744 J3.543 E.0121
G1 X130.304 Y121.155 E.17771
G1 X130.37 Y121.169 E.00209
G1 X130.624 Y121.12 E.00797
G1 X130.888 Y121.105 E.00813
G1 X134.717 Y117.276 E.16671
G3 X135.041 Y117.486 I-1.947 J3.355 E.0119
G1 X131.422 Y121.105 E.15756
G1 X131.956 Y121.105 E.01645
G1 X135.359 Y117.703 E.14813
G3 X135.664 Y117.932 I-2.129 J3.157 E.01175
G1 X132.483 Y121.113 E.1385
G1 X132.926 Y121.204 E.01393
G1 X135.965 Y118.165 E.13228
G1 X136.255 Y118.409 E.01167
G1 X133.308 Y121.357 E.12832
G1 X133.645 Y121.554 E.01202
G1 X136.538 Y118.661 E.12596
G1 X136.815 Y118.918 E.01164
G1 X133.93 Y121.803 E.12562
G1 X134.154 Y122.113 E.01178
G1 X137.08 Y119.187 E.12738
G3 X137.34 Y119.461 I-2.611 J2.746 E.01164
G1 X134.326 Y122.475 E.13123
G1 X134.405 Y122.677 E.00668
G1 X134.458 Y122.878 E.00639
G1 X137.591 Y119.745 E.13641
G3 X137.834 Y120.036 I-2.796 J2.574 E.01168
G1 X134.506 Y123.364 E.14487
G1 X134.502 Y123.624 E.00801
G1 X134.448 Y123.956 E.01037
G1 X138.071 Y120.334 E.15772
G3 X138.295 Y120.643 I-2.995 J2.407 E.01178
G1 X134.389 Y124.549 E.17004
G1 X134.438 Y124.785 E.00743
G1 X134.459 Y125.013 E.00705
G1 X138.515 Y120.958 E.17656
G1 X138.724 Y121.283 E.0119
G1 X134.431 Y125.576 E.18692
G1 X134.387 Y125.782 E.0065
G1 X134.562 Y125.98 E.00811
G1 X138.925 Y121.616 E.18998
G3 X139.12 Y121.955 I-3.246 J2.095 E.01205
G1 X134.768 Y126.308 E.18949
G1 X134.818 Y126.419 E.00376
G1 X135.078 Y126.532 E.00872
G1 X139.301 Y122.308 E.18387
G3 X139.476 Y122.668 I-3.516 J1.928 E.01231
G1 X135.414 Y126.73 E.17686
G1 X135.71 Y126.969 E.0117
G1 X139.642 Y123.036 E.17121
G3 X139.795 Y123.418 I-3.746 J1.719 E.01266
G1 X135.968 Y127.245 E.16662
G1 X136.19 Y127.557 E.01179
G1 X139.94 Y123.807 E.16324
G1 X140.074 Y124.207 E.01299
G1 X136.374 Y127.907 E.16108
G1 X136.515 Y128.3 E.01286
G1 X140.194 Y124.621 E.16017
G3 X140.304 Y125.045 I-4.196 J1.318 E.01349
G1 X136.607 Y128.743 E.16099
G1 X136.628 Y129.256 E.01581
G1 X140.404 Y125.48 E.16439
G3 X140.484 Y125.934 I-4.534 J1.039 E.01419
G1 X136.267 Y130.152 E.18363
M204 S10000
G1 X136.211 Y130.188 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1800
M204 S2000
G1 X134.813 Y131.586 E.06075
G1 X134.089 Y131.776
G1 X136.4 Y129.465 E.10042
G1 X136.416 Y128.916
G1 X133.52 Y131.812 E.12583
G1 X132.987 Y131.812
G1 X136.343 Y128.456 E.14585
G1 X136.212 Y128.053
G1 X132.457 Y131.809 E.16319
G1 X132.012 Y131.72
G1 X136.034 Y127.698 E.17477
G1 X135.814 Y127.385
G1 X131.394 Y131.805 E.19208
G1 X130.855 Y131.811
G1 X135.556 Y127.109 E.20431
G1 X135.257 Y126.875
G1 X130.399 Y131.733 E.2111
G1 X130.009 Y131.59
G1 X134.915 Y126.684 E.21317
G1 X134.609 Y126.457
G1 X129.264 Y131.802 E.23229
G1 X128.678 Y131.855
G1 X134.41 Y126.123 E.24907
G1 X134.151 Y125.848
G1 X128.178 Y131.821 E.25955
G1 X127.737 Y131.729
G1 X134.252 Y125.214 E.28313
G1 X134.214 Y124.719
G1 X127.337 Y131.596 E.29884
G1 X126.621 Y131.779
G1 X134.177 Y124.222 E.32837
G1 X134.297 Y123.569
G1 X126.054 Y131.812 E.3582
M73 P86 R2
G1 X125.521 Y131.812
G1 X134.28 Y123.053 E.38063
G1 X134.167 Y122.633
G1 X124.988 Y131.812 E.39888
G1 X124.457 Y131.81
G1 X134.002 Y122.264 E.4148
G1 X133.783 Y121.95
G1 X123.927 Y131.806 E.42826
G1 X123.488 Y131.712
G1 X133.496 Y121.704 E.43491
G1 X133.151 Y121.516
G1 X122.865 Y131.802 E.44699
G1 X122.322 Y131.812
G1 X132.762 Y121.372 E.45367
G1 X132.288 Y121.312
G1 X121.861 Y131.739 E.45308
G1 X121.469 Y131.598
G1 X131.755 Y121.312 E.44697
G1 X131.221 Y121.312
G1 X121.138 Y131.395 E.43816
G1 X120.872 Y131.128
G1 X130.678 Y121.323 E.4261
G1 X130.134 Y121.333
G1 X120.647 Y130.821 E.41229
G1 X120.476 Y130.458
G1 X129.622 Y121.312 E.39744
G1 X128.967 Y121.434
G1 X120.328 Y130.073 E.37541
G1 X120.18 Y129.688
G1 X128.544 Y121.324 E.36346
G1 X128.055 Y121.279
G1 X120.032 Y129.303 E.34867
G1 X119.884 Y128.917
G1 X127.481 Y121.32 E.33016
G1 X126.955 Y121.312
G1 X119.736 Y128.532 E.31373
G1 X119.588 Y128.147
G1 X126.38 Y121.355 E.29514
G1 X125.84 Y121.361
G1 X119.47 Y127.731 E.27681
G1 X119.46 Y127.208
G1 X121.283 Y125.385 E.07922
G1 X121.767 Y124.901
G1 X125.356 Y121.312 E.15595
G1 X124.763 Y121.372
G1 X121.767 Y124.368 E.13018
G1 X121.767 Y123.835
G1 X124.262 Y121.339 E.10844
G1 X123.756 Y121.312
G1 X121.767 Y123.301 E.08643
G1 X121.896 Y122.639
G1 X123.093 Y121.442 E.05202
; WIPE_START
M204 S6000
G1 X121.896 Y122.639 E-.64334
G1 X121.837 Y122.94 E-.11666
; WIPE_END
G1 E-.04
M204 S10000
G1 X127.077 Y128.489 Z6 F42000
G1 X129.941 Y131.522 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.194032
G1 F15000
M204 S6000
G1 X129.65 Y131.718 E.00432
; WIPE_START
G1 X129.941 Y131.522 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.613 Y127.255 Z6 F42000
G1 X120.922 Y125.441 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.19017
G1 F15000
M204 S6000
G1 X120.672 Y125.614 E.00365
; LINE_WIDTH: 0.224263
G1 X120.576 Y125.684 E.00176
; LINE_WIDTH: 0.259982
G1 X120.48 Y125.755 E.00211
; LINE_WIDTH: 0.295702
G1 X120.384 Y125.826 E.00245
; LINE_WIDTH: 0.339745
G2 X120.19 Y125.988 I2.058 J2.666 E.00612
; LINE_WIDTH: 0.360538
G2 X119.823 Y126.374 I2.129 J2.389 E.01382
; LINE_WIDTH: 0.31515
G1 X119.757 Y126.463 E.00243
; LINE_WIDTH: 0.283054
G1 X119.488 Y126.854 E.00931
M204 S10000
G1 X122.401 Y121.836 F42000
; LINE_WIDTH: 0.0885859
G1 F15000
M204 S6000
G2 X122.291 Y121.946 I1.649 J1.759 E.00058
; WIPE_START
G1 X122.401 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.688 Y124.107 Z6 F42000
G1 X134.237 Y125.525 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.18978
G1 F15000
M204 S6000
G1 X134.129 Y125.715 E.00262
G1 X134.162 Y125.838 E.00152
M204 S10000
G1 X135.076 Y126.789 F42000
; LINE_WIDTH: 0.0985421
G1 F15000
M204 S6000
G1 X134.964 Y126.707 E.00063
M204 S10000
G1 X136.342 Y129.824 F42000
; LINE_WIDTH: 0.199103
G1 F15000
M204 S6000
G1 X136.149 Y130.126 E.00456
M204 S10000
G1 X135.474 Y138.424 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G2 X137.696 Y136.136 I-28.987 J-30.371 E.09819
G2 X138.85 Y134.514 I-9.505 J-7.984 E.06135
G1 X134.518 Y138.846 E.18859
G3 X133.373 Y139.457 I-6.704 J-11.187 E.03998
G1 X139.458 Y133.372 E.26492
G2 X139.847 Y132.448 I-9.05 J-4.358 E.03086
G1 X132.449 Y139.846 E.32207
G3 X131.643 Y140.118 I-3.128 J-7.942 E.0262
G1 X140.12 Y131.641 E.36906
G2 X140.314 Y130.913 I-7.196 J-2.304 E.0232
M73 P87 R2
G1 X130.911 Y140.316 E.40938
G3 X130.235 Y140.457 I-1.752 J-6.683 E.02127
G1 X140.454 Y130.239 E.44489
G2 X140.551 Y129.607 I-6.285 J-1.29 E.01967
G1 X129.604 Y140.555 E.4766
G3 X129.008 Y140.616 I-.907 J-5.912 E.01843
G1 X140.613 Y129.011 E.50523
G2 X140.646 Y128.443 I-5.674 J-.616 E.01751
G1 X128.443 Y140.647 E.5313
G3 X127.902 Y140.653 I-.334 J-5.411 E.01665
G1 X140.655 Y127.901 E.55521
G1 X140.642 Y127.379 E.01605
G1 X127.383 Y140.638 E.57725
G3 X126.882 Y140.605 I.087 J-5.038 E.01545
G1 X140.605 Y126.882 E.59745
G2 X140.552 Y126.401 I-4.847 J.292 E.01491
G1 X126.398 Y140.555 E.61622
G1 X125.934 Y140.485 E.01445
G1 X134.517 Y131.901 E.37371
G1 X134.249 Y131.963 E.00846
G1 X133.877 Y132.007 E.01154
G1 X125.483 Y140.401 E.36543
G3 X125.045 Y140.305 I.739 J-4.43 E.01382
G1 X133.331 Y132.019 E.36072
G1 X132.796 Y132.019 E.01645
G1 X124.619 Y140.196 E.356
G3 X124.209 Y140.072 I1.039 J-4.176 E.0132
G1 X132.284 Y131.997 E.35158
G1 X131.909 Y131.904 E.01189
G1 X131.814 Y131.933 E.00309
G1 X123.808 Y139.939 E.34856
G1 X123.416 Y139.797 E.01283
G1 X131.193 Y132.019 E.33861
G3 X130.676 Y132.003 I-.171 J-2.77 E.01597
G1 X123.038 Y139.64 E.3325
G3 X122.668 Y139.476 I1.453 J-3.788 E.01248
G1 X130.243 Y131.901 E.32979
G1 X129.984 Y131.808 E.00846
G1 X129.7 Y131.91 E.0093
G1 X122.307 Y139.303 E.32185
G3 X121.958 Y139.118 I1.679 J-3.591 E.01217
G1 X129.034 Y132.042 E.30806
G1 X128.485 Y132.056 E.01689
G1 X121.615 Y138.927 E.29914
G1 X121.283 Y138.724 E.01196
G1 X128.004 Y132.003 E.29261
G1 X127.575 Y131.898 E.0136
G1 X120.959 Y138.514 E.28804
G1 X120.641 Y138.297 E.01184
G1 X127.023 Y131.915 E.27786
G1 X126.71 Y131.976 E.00983
G1 X126.396 Y132.008 E.00971
G1 X120.336 Y138.068 E.26384
G3 X120.035 Y137.835 I2.193 J-3.131 E.01173
G1 X125.851 Y132.019 E.25318
G1 X125.316 Y132.019 E.01645
G1 X119.745 Y137.591 E.24257
G3 X119.462 Y137.339 I2.378 J-2.956 E.01166
G1 X124.793 Y132.009 E.23208
G1 X124.674 Y131.991 E.00369
G1 X124.248 Y132.019 E.01316
G1 X119.185 Y137.082 E.22042
G3 X118.92 Y136.813 I2.563 J-2.785 E.01164
G1 X123.744 Y131.989 E.21
G1 X123.383 Y131.895 E.01147
G1 X123.269 Y131.93 E.00368
G1 X118.66 Y136.539 E.20067
G1 X118.409 Y136.255 E.01165
G1 X122.645 Y132.019 E.18442
G3 X122.126 Y132.004 I-.175 J-2.866 E.01601
G1 X118.166 Y135.964 E.17239
G1 X117.929 Y135.666 E.0117
G1 X121.692 Y131.903 E.16383
G1 X121.31 Y131.752 E.01267
G1 X117.705 Y135.357 E.15695
G3 X117.485 Y135.042 I3.037 J-2.355 E.01182
G1 X120.987 Y131.54 E.15248
G1 X120.721 Y131.272 E.01163
G1 X117.276 Y134.717 E.15002
G3 X117.075 Y134.384 I3.25 J-2.182 E.01199
G1 X120.493 Y130.966 E.14879
G1 X120.312 Y130.612 E.01223
G1 X116.88 Y134.045 E.14945
G1 X116.699 Y133.692 E.01222
G1 X120.164 Y130.226 E.15088
G1 X120.016 Y129.84 E.01273
G1 X116.524 Y133.332 E.15203
G1 X116.358 Y132.964 E.01243
G1 X119.868 Y129.454 E.15281
G1 X119.719 Y129.068 E.01273
G1 X116.205 Y132.582 E.15299
G3 X116.06 Y132.193 I3.829 J-1.649 E.01279
G1 X119.571 Y128.682 E.15286
G1 X119.423 Y128.296 E.01273
G1 X115.926 Y131.793 E.15225
G3 X115.806 Y131.379 I4.083 J-1.407 E.01328
G1 X119.289 Y127.895 E.15164
G1 X119.272 Y127.813 E.00259
G3 X119.237 Y127.413 I2.202 J-.397 E.01237
G1 X115.696 Y130.955 E.15418
G1 X115.596 Y130.52 E.01374
G1 X119.304 Y126.812 E.16141
G1 X119.352 Y126.629 E.00584
G3 X120.227 Y125.542 I1.75 J.513 E.04407
G3 X120.86 Y125.256 I1.307 J2.044 E.02146
G1 X121.56 Y124.556 E.03045
G1 X121.56 Y125.091 E.01645
G1 X121.304 Y125.346 E.01112
M204 S10000
G1 X117.592 Y120.51 F42000
G1 F15000
M204 S6000
G1 X119.168 Y118.933 E.06862
G3 X121.482 Y117.154 I8.998 J9.307 E.09003
G1 X117.15 Y121.486 E.18858
G2 X116.542 Y122.628 I12.095 J7.171 E.03986
G1 X122.627 Y116.543 E.26492
G3 X123.55 Y116.154 I5.725 J12.293 E.03086
G1 X116.153 Y123.552 E.32207
G2 X115.88 Y124.359 I15.576 J5.719 E.02624
G1 X124.357 Y115.882 E.36906
G3 X125.089 Y115.684 I2.353 J7.248 E.02337
G1 X115.686 Y125.087 E.40937
G2 X115.546 Y125.761 I6.679 J1.737 E.02121
G1 X125.765 Y115.543 E.44489
G3 X126.396 Y115.445 I1.294 J6.312 E.01967
G1 X115.449 Y126.393 E.4766
G2 X115.387 Y126.989 I5.945 J.921 E.01847
G1 X126.992 Y115.384 E.50523
G3 X127.557 Y115.353 I.598 J5.658 E.01745
G1 X115.354 Y127.556 E.5313
G2 X115.345 Y128.099 I5.429 J.357 E.01672
G1 X128.091 Y115.353 E.55493
G3 X128.616 Y115.363 I.191 J3.933 E.01617
G1 X115.199 Y128.779 E.58412
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X116.614 Y127.365 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/32
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S158.1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6 I-.318 J1.175 P1  F42000
G1 X122.529 Y128.967 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X122.378 Y128.562 E.01183
G1 X122.681 Y128.562 E.00828
G1 X122.603 Y128.769 E.00605
G1 X122.55 Y128.911 E.00413
; WIPE_START
M204 S6000
G1 X122.378 Y128.562 E-.27787
G1 X122.681 Y128.562 E-.21622
G1 X122.603 Y128.769 E-.15807
G1 X122.55 Y128.911 E-.10784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.511 Y128.954 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X126.026 Y128.954 E.01582
G3 X126.371 Y129.035 I.044 J.587 E.01108
G3 X126.202 Y129.356 I-.142 J.13 E.01448
G3 X125.511 Y129.362 I-.403 J-5.877 E.02127
G1 X125.511 Y129.014 E.01072
; WIPE_START
M204 S6000
G1 X126.026 Y128.954 E-.19698
G1 X126.285 Y128.985 E-.09925
G1 X126.371 Y129.035 E-.03801
G1 X126.418 Y129.136 E-.04214
G1 X126.399 Y129.256 E-.04604
G1 X126.318 Y129.327 E-.04089
G1 X126.202 Y129.356 E-.04529
G1 X125.541 Y129.362 E-.25139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.087 Y124.466 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X126.02 Y124.287 E.00522
G1 X126.153 Y124.287 E.00365
G1 X126.11 Y124.402 E.00335
G1 X126.107 Y124.41 E.00023
; WIPE_START
M204 S6000
G1 X126.02 Y124.287 E-.27568
G1 X126.153 Y124.287 E-.24451
G1 X126.11 Y124.402 E-.22449
G1 X126.107 Y124.41 E-.01532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.205 Y124.536 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X124.618 Y124.544 I.151 J3.258 E.01271
G3 X124.634 Y124.829 I.02 J.142 E.01463
G3 X124.205 Y124.833 I-.279 J-8.087 E.01318
G1 X124.205 Y124.596 E.00726
; WIPE_START
M204 S6000
G1 X124.618 Y124.544 E-.20453
G1 X124.739 Y124.58 E-.06192
G1 X124.776 Y124.693 E-.05795
G1 X124.739 Y124.799 E-.05545
G1 X124.634 Y124.829 E-.05363
G1 X124.205 Y124.833 E-.21048
G1 X124.205 Y124.596 E-.11604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.648 Y128.688 Z6.2 F42000
G1 X131.086 Y128.967 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X130.935 Y128.562 E.01183
G1 X131.238 Y128.562 E.00828
G1 X131.159 Y128.769 E.00605
G1 X131.107 Y128.911 E.00413
; WIPE_START
M204 S6000
G1 X130.935 Y128.562 E-.27786
G1 X131.238 Y128.562 E-.21623
G1 X131.159 Y128.769 E-.15807
G1 X131.107 Y128.911 E-.10784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.791 Y128.914 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X133.875 Y128.972 I-.204 J.394 E.00314
G3 X133.682 Y129.339 I-.19 J.135 E.01576
G3 X133.09 Y129.344 I-.378 J-11.135 E.01818
G1 X133.09 Y128.868 E.01461
G1 X133.531 Y128.868 E.01355
G3 X133.736 Y128.891 I.055 J.44 E.0064
; WIPE_START
M204 S6000
G1 X133.875 Y128.972 E-.06109
G1 X133.909 Y129.112 E-.05505
G1 X133.884 Y129.233 E-.04689
G1 X133.805 Y129.317 E-.04385
G1 X133.682 Y129.339 E-.04752
G1 X133.09 Y129.344 E-.22484
G1 X133.09 Y128.868 E-.18069
G1 X133.353 Y128.868 E-.10005
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


G1 X133.286 Y129.106 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121535
G1 F15000
M204 S6000
G3 X133.711 Y129.114 I.142 J3.743 E.00272
; WIPE_START
G1 X133.286 Y129.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.454 Y128.83 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X129.254 Y128.831 E.02459
G3 X129.091 Y129.225 I-1.325 J-.318 E.01315
G3 X128.486 Y129.383 I-.439 J-.445 E.02011
G3 X127.985 Y128.849 I.103 J-.6 E.02415
G3 X128.162 Y127.991 I.925 J-.257 E.02797
G3 X128.715 Y127.812 I.512 J.639 E.01825
G3 X129.191 Y127.97 I-.069 J1.003 E.01556
G1 X129.191 Y128.117 E.00451
G1 X128.454 Y128.117 E.02263
G1 X128.454 Y128.77 E.02008
; WIPE_START
M204 S6000
G1 X129.254 Y128.831 E-.30493
G1 X129.091 Y129.225 E-.16201
G1 X128.982 Y129.322 E-.0554
G1 X128.812 Y129.384 E-.06865
G1 X128.665 Y129.398 E-.05618
G1 X128.486 Y129.383 E-.06809
G1 X128.375 Y129.345 E-.04474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.255 Y124.604 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X128.222 Y124.749 E.00454
G1 X128.175 Y124.821 E.00265
G3 X127.72 Y124.806 I-.213 J-.441 E.01453
G1 X127.715 Y124.761 E.00139
G3 X128.196 Y124.616 I1.183 J3.066 E.01544
M204 S250
G1 X128.293 Y123.841 F42000
G1 F3000
M204 S5000
G1 X128.289 Y123.849 E.00028
G3 X128.076 Y123.943 I-.326 J-.454 E.00721
G2 X127.609 Y124.068 I.391 J2.386 E.01489
G3 X127.743 Y123.752 I.359 J-.034 E.01099
G3 X128.116 Y123.697 I.266 J.514 E.01181
G3 X128.279 Y123.786 I.023 J.153 E.00612
; WIPE_START
M204 S6000
G1 X128.289 Y123.849 E-.02837
G1 X128.234 Y123.889 E-.03013
G1 X128.076 Y123.943 E-.07403
G1 X127.609 Y124.068 E-.21438
G1 X127.651 Y123.858 E-.0951
G1 X127.689 Y123.794 E-.03316
G1 X127.743 Y123.752 E-.02995
G1 X127.889 Y123.7 E-.06892
G1 X128.116 Y123.697 E-.10052
G1 X128.254 Y123.748 E-.06517
G1 X128.279 Y123.786 E-.02027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.326 Y128.832 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X129.949 Y129.002 E.01985
G1 X129.865 Y129.293 E.0093
G3 X129.471 Y129.871 I-1.039 J-.285 E.02189
G3 X127.799 Y129.862 I-.828 J-1.37 E.05405
G3 X127.198 Y128.582 I.963 J-1.233 E.04508
G3 X128.5 Y127.1 I1.412 J-.072 E.0671
G3 X129.756 Y127.453 I.147 J1.888 E.04089
G1 X129.633 Y127.134 E.01049
G1 X130.438 Y127.134 E.02473
G1 X130.713 Y127.893 E.0248
G1 X131.469 Y127.893 E.02324
G1 X131.762 Y127.134 E.02498
G1 X133.09 Y127.134 E.04081
G1 X133.09 Y128.153 E.03131
M73 P88 R2
G3 X133.855 Y128.176 I.249 J4.354 E.02354
G3 X134.606 Y128.752 I-.1 J.908 E.03059
G3 X133.745 Y130.052 I-.858 J.366 E.05669
G3 X132.338 Y130.059 I-.828 J-23.133 E.04324
G1 X132.338 Y127.764 E.07052
G1 X131.399 Y130.059 E.0762
G1 X130.757 Y130.059 E.01974
G1 X129.935 Y127.92 E.07041
G1 X129.935 Y128.833 E.02803
G1 X129.386 Y128.832 E.01688
; WIPE_START
M204 S6000
G1 X129.949 Y129.002 E-.22356
G1 X129.865 Y129.293 E-.11504
G1 X129.804 Y129.454 E-.06513
G1 X129.716 Y129.616 E-.07012
G1 X129.603 Y129.758 E-.06893
G1 X129.471 Y129.871 E-.06621
G1 X129.302 Y129.969 E-.07416
G1 X129.113 Y130.04 E-.07684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.824 Y128.238 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3000
M204 S5000
G2 X125.922 Y128.19 I-.088 J-.303 E.00337
G1 X125.956 Y128.159 E.00142
G2 X126.645 Y127.134 I-7.087 J-5.509 E.03798
G1 X127.561 Y127.134 E.02814
G1 X126.917 Y128.141 E.03674
G3 X126.717 Y128.401 I-1.883 J-1.241 E.01008
G3 X127.114 Y129.522 I-.391 J.769 E.04031
G3 X126.207 Y130.057 I-.834 J-.378 E.03446
G3 X124.759 Y130.059 I-.787 J-37.16 E.04449
G1 X124.759 Y127.134 E.08989
G1 X125.511 Y127.134 E.02309
G1 X125.511 Y128.246 E.03419
G1 X125.682 Y128.246 E.00527
G2 X125.765 Y128.25 I.053 J-.312 E.00254
; WIPE_START
M204 S6000
G1 X125.922 Y128.19 E-.06379
G1 X125.956 Y128.159 E-.01757
G1 X126.128 Y127.938 E-.10669
G1 X126.645 Y127.134 E-.36303
G1 X127.195 Y127.134 E-.20892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.838 Y127.626 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X122.842 Y130.059 E.08077
G1 X122.2 Y130.059 E.01974
G1 X121.076 Y127.134 E.09629
G1 X121.881 Y127.134 E.02473
G1 X122.156 Y127.893 E.0248
G1 X122.913 Y127.893 E.02324
G1 X123.205 Y127.134 E.02499
G1 X124.59 Y127.134 E.04255
G1 X124.59 Y130.059 E.08989
G1 X123.838 Y130.059 E.02309
G1 X123.838 Y127.686 E.07291
; WIPE_START
M204 S6000
G1 X123.064 Y129.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.008 Y133.727 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X121.178 Y133.781 E.00591
G1 X121.178 Y136.619 E.09411
G1 X121.008 Y136.673 E.00591
G3 X120.973 Y133.776 I2.005 J-1.473 E.10259
; WIPE_START
G1 X121.178 Y133.781 E-.07777
G1 X121.178 Y135.577 E-.68223
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.138 Y129.776 Z6.2 F42000
G1 X131.316 Y123.722 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.316 Y123.984 E.00806
G1 X132.424 Y123.984 E.03407
G1 X132.424 Y124.639 E.02013
G1 X131.316 Y124.639 E.03407
G1 X131.316 Y124.833 E.00596
G1 X132.5 Y124.833 E.03638
G1 X132.5 Y125.489 E.02017
G1 X128.764 Y125.489 E.11478
G1 X128.764 Y125.166 E.00993
G3 X128.62 Y125.32 I-.547 J-.366 E.0065
G3 X127.542 Y125.456 I-.677 J-1.021 E.0346
G3 X127.411 Y124.151 I.209 J-.68 E.05127
G1 X126.937 Y124.11 E.01463
G1 X126.939 Y124.089 E.00064
G1 X126.366 Y125.489 E.04649
G1 X125.795 Y125.489 E.01755
G1 X125.467 Y124.635 E.02812
G3 X124.829 Y125.467 I-.761 J.077 E.0355
G3 X123.52 Y125.489 I-.825 J-10.028 E.04026
G1 X123.52 Y123.065 E.07449
G1 X124.205 Y123.065 E.02105
G1 X124.205 Y123.88 E.02505
G1 X124.59 Y123.881 E.01183
G3 X125.288 Y124.171 I.059 J.844 E.02408
G1 X124.864 Y123.065 E.0364
G1 X125.598 Y123.065 E.02257
G1 X125.818 Y123.672 E.01984
G1 X126.365 Y123.672 E.0168
G1 X126.599 Y123.065 E.01999
G1 X127.358 Y123.065 E.02333
G1 X127.284 Y123.244 E.00596
G3 X127.933 Y123.033 I.646 J.879 E.02131
G3 X128.444 Y123.107 I.062 J1.373 E.01596
G3 X128.56 Y124.493 I-.226 J.717 E.05462
G1 X128.935 Y124.522 E.01155
G1 X128.9 Y124.833 E.00962
G1 X129.424 Y124.833 E.01611
G1 X129.424 Y123.065 E.05432
G1 X130.11 Y123.065 E.02106
G1 X130.11 Y124.833 E.05432
G1 X130.63 Y124.833 E.016
G1 X130.63 Y123.065 E.05432
G1 X132.546 Y123.065 E.05886
G1 X132.546 Y123.722 E.02017
G1 X131.376 Y123.722 E.03597
; WIPE_START
M204 S6000
G1 X131.316 Y123.984 E-.10223
G1 X132.424 Y123.984 E-.42134
G1 X132.424 Y124.606 E-.23644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.397 Y127.584 Z6.2 F42000
G1 X114.816 Y132.067 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X124.265 Y114.725 I13.175 J-4.066 E.67641
G3 X128.493 Y114.222 I3.753 J13.503 E.13135
G3 X114.834 Y132.124 I-.503 J13.779 E1.85233
; WIPE_START
M204 S6000
G1 X114.636 Y131.403 E-.28418
G1 X114.483 Y130.732 E-.26129
G1 X114.385 Y130.176 E-.21452
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.867 Y134.207 Z6.2 F42000
G1 X120.953 Y134.261 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111881
G1 F15000
M204 S6000
G1 X120.935 Y134.354 E.00053
; LINE_WIDTH: 0.143482
G1 X120.916 Y134.447 E.00078
; LINE_WIDTH: 0.176944
G1 X120.899 Y134.555 E.0012
; LINE_WIDTH: 0.209584
G1 X120.884 Y134.664 E.0015
; LINE_WIDTH: 0.236627
G1 X120.872 Y134.772 E.0017
; LINE_WIDTH: 0.27932
G2 X120.862 Y135.52 I4.377 J.429 E.01444
; LINE_WIDTH: 0.247369
G2 X120.884 Y135.736 I4.35 J-.324 E.0036
; LINE_WIDTH: 0.209595
G1 X120.899 Y135.845 E.0015
; LINE_WIDTH: 0.176956
G1 X120.916 Y135.953 E.0012
; LINE_WIDTH: 0.143525
G1 X120.935 Y136.046 E.00078
; LINE_WIDTH: 0.111895
G1 X120.953 Y136.139 E.00053
; WIPE_START
G1 X120.935 Y136.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.499 Y129.351 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.259717
G1 F15000
M204 S6000
G1 X123.529 Y129.197 E.00278
; LINE_WIDTH: 0.213204
G1 X123.559 Y129.042 E.00218
; LINE_WIDTH: 0.16669
G1 X123.59 Y128.888 E.00159
; LINE_WIDTH: 0.120177
G1 X123.62 Y128.734 E.00099
; WIPE_START
G1 X123.59 Y128.888 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.236 Y128.928 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.126368
G1 F15000
M204 S6000
G3 X128.236 Y128.262 I2.044 J-.332 E.00455
M204 S10000
G1 X128.269 Y129.036 F42000
; LINE_WIDTH: 0.123437
G1 F15000
M204 S6000
G1 X128.674 Y129.201 E.00287
M204 S10000
G1 X128.811 Y129.102 F42000
; LINE_WIDTH: 0.207869
G1 F15000
M204 S6000
G3 X128.454 Y129.098 I-.164 J-1.117 E.00481
; LINE_WIDTH: 0.176968
G1 X128.288 Y129.06 E.00186
M204 S10000
G1 X128.811 Y129.102 F42000
; LINE_WIDTH: 0.175435
G1 F15000
M204 S6000
G1 X128.885 Y129.081 E.00084
; LINE_WIDTH: 0.129004
G1 X128.967 Y129.034 E.00067
; WIPE_START
G1 X128.885 Y129.081 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.999 Y129.489 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.259712
G1 F15000
M204 S6000
G1 X132.03 Y129.334 E.00278
; LINE_WIDTH: 0.2132
G1 X132.06 Y129.18 E.00218
; LINE_WIDTH: 0.166688
G1 X132.09 Y129.026 E.00159
; LINE_WIDTH: 0.120176
G1 X132.121 Y128.871 E.00099
; WIPE_START
G1 X132.09 Y129.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.37 Y124.637 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.17148
G1 F15000
M204 S6000
G1 X130.37 Y122.884 E.01836
; WIPE_START
G1 X130.37 Y124.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.116 Y123.252 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.195295
G1 F15000
M204 S6000
G3 X129.164 Y123.479 I-3.185 J.794 E.00288
; LINE_WIDTH: 0.159463
G1 X129.176 Y123.547 E.00065
; LINE_WIDTH: 0.117392
G1 X129.199 Y123.838 E.00177
G1 X129.18 Y124.114 E.00168
; LINE_WIDTH: 0.152747
G1 X129.167 Y124.191 E.0007
; LINE_WIDTH: 0.179273
G1 X129.154 Y124.261 E.00079
; LINE_WIDTH: 0.173159
G1 X129.174 Y124.308 E.00055
; LINE_WIDTH: 0.135297
G1 X129.19 Y124.346 E.00031
; LINE_WIDTH: 0.132444
G1 X129.174 Y124.637 E.00213
; WIPE_START
G1 X129.19 Y124.346 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.283 Y118.661 Z6.2 F42000
G1 X135.846 Y116.916 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X139.077 Y120.146 E.14039
; WIPE_START
M204 S6000
G1 X137.663 Y118.732 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X139.957 Y121.56 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X134.447 Y116.05 E.23942
G1 X133.409 Y115.545
G1 X140.457 Y122.593 E.30627
G1 X140.803 Y123.472
G1 X132.53 Y115.199 E.3595
G1 X131.742 Y114.945
G1 X141.051 Y124.254 E.40453
G1 X141.236 Y124.972
G1 X131.022 Y114.758 E.44385
G1 X130.354 Y114.623
G1 X141.372 Y125.641 E.47876
G1 X141.468 Y126.27
G1 X129.726 Y114.529 E.51022
G1 X129.132 Y114.467
G1 X141.531 Y126.867 E.53883
G1 X141.568 Y127.437
G1 X128.564 Y114.433 E.5651
G1 X128.02 Y114.422
G1 X141.582 Y127.984 E.58935
G1 X141.57 Y128.505
G1 X127.495 Y114.43 E.61163
G1 X126.987 Y114.455
G1 X141.541 Y129.009 E.63243
G1 X141.497 Y129.498
G1 X126.502 Y114.504 E.65159
G1 X126.03 Y114.565
G1 X141.437 Y129.972 E.66951
G1 X141.36 Y130.428
G1 X125.57 Y114.638 E.68613
G1 X125.126 Y114.728
G1 X141.272 Y130.873 E.70159
G1 X141.173 Y131.307
G1 X132.753 Y122.888 E.36585
G1 X132.753 Y123.421
G1 X141.057 Y131.725 E.36084
G1 X140.935 Y132.136
G1 X132.728 Y123.929 E.35663
G1 X132.632 Y124.366
G1 X140.8 Y132.535 E.35497
G1 X140.655 Y132.922
G1 X132.707 Y124.975 E.34537
G1 X132.707 Y125.508
G1 X140.503 Y133.304 E.33878
G1 X140.337 Y133.672
G1 X132.362 Y125.697 E.34655
G1 X131.829 Y125.697
G1 X133.059 Y126.926 E.05344
G1 X132.526 Y126.926
G1 X131.296 Y125.697 E.05344
G1 X130.763 Y125.697
G1 X131.992 Y126.926 E.05344
G1 X131.575 Y127.042
G1 X130.229 Y125.697 E.05846
G1 X129.696 Y125.697
G1 X131.427 Y127.427 E.07519
G1 X131.151 Y127.685
G1 X130.692 Y127.226 E.01996
G1 X130.393 Y126.926
G1 X129.163 Y125.697 E.05344
G1 X128.63 Y125.697
G1 X129.859 Y126.926 E.05344
G1 X129.326 Y126.926
G1 X128.12 Y125.72 E.05241
G1 X127.536 Y125.669
G1 X128.753 Y126.887 E.05289
G1 X128.262 Y126.929
G1 X126.657 Y125.324 E.06972
G1 X126.497 Y125.697
G1 X127.726 Y126.926 E.05344
G1 X127.193 Y126.926
G1 X125.963 Y125.697 E.05344
G1 X125.256 Y125.523
G1 X126.66 Y126.926 E.06101
G1 X126.374 Y127.174
G1 X124.871 Y125.671 E.06532
G1 X124.364 Y125.697
G1 X125.593 Y126.926 E.05344
G1 X125.06 Y126.926
G1 X123.83 Y125.697 E.05344
; WIPE_START
M204 S6000
G1 X125.06 Y126.926 E-.66084
G1 X125.321 Y126.926 E-.09916
; WIPE_END
G1 E-.04
M204 S10000
G1 X125.718 Y127.051 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X126.166 Y127.5 E.01948
; WIPE_START
M204 S6000
G1 X125.718 Y127.051 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X123.631 Y129.763 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
M73 P89 R2
G1 X123.316 Y129.449 E.01366
; WIPE_START
M204 S6000
G1 X123.631 Y129.763 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X131.263 Y129.84 Z6.2 F42000
G1 X131.711 Y129.845 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X132.131 Y130.265 E.01825
; WIPE_START
M204 S6000
G1 X131.711 Y129.845 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X132.723 Y122.858 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X124.695 Y114.83 E.34884
G1 X124.272 Y114.94
G1 X132.19 Y122.858 E.34405
G1 X131.656 Y122.858
G1 X123.865 Y115.066 E.33859
G1 X123.466 Y115.201
G1 X131.123 Y122.858 E.33274
G1 X130.59 Y122.858
G1 X123.075 Y115.343 E.32656
G1 X122.698 Y115.499
G1 X130.057 Y122.858 E.31975
G1 X129.523 Y122.858
G1 X122.327 Y115.661 E.31272
G1 X121.967 Y115.835
G1 X129.217 Y123.085 E.31505
G1 X128.509 Y122.91
G1 X121.615 Y116.016 E.29956
G1 X121.27 Y116.204
G1 X127.894 Y122.828 E.28785
G1 X127.39 Y122.858
G1 X120.936 Y116.404 E.28046
G1 X120.606 Y116.607
G1 X126.857 Y122.858 E.27162
G1 X126.419 Y122.953
G1 X120.289 Y116.823 E.26639
G1 X119.977 Y117.044
G1 X126.271 Y123.338 E.27354
G1 X125.257 Y122.858
G1 X119.673 Y117.273 E.24266
G1 X119.377 Y117.511
G1 X124.724 Y122.858 E.23236
G1 X124.191 Y122.858
G1 X119.087 Y117.754 E.22179
G1 X118.807 Y118.007
G1 X123.658 Y122.858 E.21078
G1 X123.312 Y123.046
G1 X118.53 Y118.264 E.2078
G1 X118.266 Y118.533
G1 X123.312 Y123.579 E.21927
G1 X123.312 Y124.112
G1 X118.005 Y118.805 E.23062
G1 X117.755 Y119.088
G1 X123.312 Y124.645 E.24149
G1 X123.312 Y125.179
G1 X117.51 Y119.376 E.25214
G1 X117.273 Y119.673
G1 X124.527 Y126.926 E.3152
G1 X123.993 Y126.926
G1 X117.045 Y119.977 E.30197
G1 X116.821 Y120.288
G1 X123.46 Y126.926 E.28849
G1 X123.025 Y127.024
G1 X116.61 Y120.609 E.27878
G1 X116.401 Y120.934
G1 X122.877 Y127.409 E.2814
G1 X122.619 Y127.685
G1 X122.121 Y127.187 E.02165
G1 X121.86 Y126.926
G1 X116.206 Y121.272 E.24572
G1 X116.015 Y121.614
G1 X121.327 Y126.926 E.23084
G1 X120.794 Y126.926
G1 X115.834 Y121.967 E.21552
G1 X115.663 Y122.328
G1 X121.095 Y127.761 E.23606
G1 X121.427 Y128.626
G1 X115.497 Y122.696 E.25771
G1 X115.345 Y123.078
G1 X121.76 Y129.492 E.27874
; WIPE_START
M204 S6000
G1 X120.346 Y128.078 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X127.959 Y127.541 Z6.2 F42000
G1 X133.297 Y127.165 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X134.187 Y128.055 E.03866
G1 X134.791 Y128.659
G1 X140.166 Y134.033 E.23354
G1 X139.985 Y134.386
G1 X134.867 Y129.268 E.22238
G1 X134.744 Y129.679
M73 P90 R2
G1 X139.794 Y134.728 E.21944
G1 X139.599 Y135.066
G1 X134.513 Y129.98 E.22103
G1 X134.176 Y130.177
G1 X139.39 Y135.391 E.22658
G1 X139.178 Y135.712
G1 X133.726 Y130.26 E.23694
G1 X133.199 Y130.267
G1 X138.955 Y136.023 E.25012
G1 X138.727 Y136.327
G1 X132.666 Y130.267 E.26335
G1 X132.133 Y130.267
G1 X138.49 Y136.624 E.27625
G1 X138.245 Y136.912
G1 X131.556 Y130.223 E.29066
M73 P90 R1
G1 X131.066 Y130.267
G1 X137.995 Y137.195 E.30108
G1 X137.734 Y137.467
G1 X129.927 Y129.661 E.33922
G1 X129.69 Y129.956
G1 X137.47 Y137.736 E.33807
G1 X137.193 Y137.993
G1 X129.367 Y130.166 E.3401
G1 X128.954 Y130.287
G1 X136.913 Y138.246 E.34587
G1 X136.623 Y138.49
G1 X128.43 Y130.296 E.35603
; WIPE_START
M204 S6000
G1 X129.844 Y131.711 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X127.284 Y129.683 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X136.327 Y138.727 E.39297
G1 X136.023 Y138.956
G1 X127.046 Y129.979 E.39011
G1 X126.714 Y130.18
G1 X135.711 Y139.177 E.39095
G1 X135.394 Y139.393
G1 X126.261 Y130.261 E.39685
G1 X125.734 Y130.267
G1 X135.064 Y139.596 E.40542
G1 X134.73 Y139.796
G1 X125.201 Y130.267 E.4141
G1 X124.667 Y130.267
G1 X134.385 Y139.984 E.42227
G1 X134.033 Y140.165
G1 X124.134 Y130.267 E.43015
G1 X123.161 Y129.827
G1 X133.673 Y140.339 E.45678
G1 X133.302 Y140.501
G1 X123.006 Y130.206 E.44737
G1 X122.534 Y130.267
G1 X132.925 Y140.657 E.45152
G1 X132.534 Y140.799
G1 X115.199 Y123.465 E.75326
G1 X115.065 Y123.864
G1 X132.135 Y140.934 E.74177
G1 X131.728 Y141.06
G1 X114.943 Y124.275 E.72939
G1 X114.827 Y124.693
G1 X131.305 Y141.17 E.71602
G1 X130.873 Y141.272
G1 X114.728 Y125.127 E.70158
G1 X114.64 Y125.572
G1 X130.43 Y141.362 E.68613
G1 X129.97 Y141.435
G1 X114.563 Y126.028 E.66951
G1 X114.503 Y126.502
G1 X121.194 Y133.193 E.29076
G1 X120.932 Y133.464
G1 X114.459 Y126.991 E.28128
G1 X114.43 Y127.495
G1 X120.708 Y133.773 E.27282
G1 X120.525 Y134.123
G1 X114.418 Y128.016 E.26537
G1 X114.432 Y128.563
G1 X120.388 Y134.519 E.25882
G1 X120.31 Y134.975
G1 X114.469 Y129.133 E.25384
G1 X114.532 Y129.73
G1 X120.319 Y135.517 E.25147
G1 X120.508 Y136.239
G1 X114.628 Y130.359 E.2555
; WIPE_START
M204 S6000
M73 P91 R1
G1 X116.043 Y131.774 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X121.4 Y133.399 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X129.498 Y141.496 E.35187
G1 X129.013 Y141.545
G1 X121.4 Y133.932 E.3308
G1 X121.4 Y134.465
G1 X128.505 Y141.57 E.30873
G1 X127.98 Y141.578
G1 X121.521 Y135.119 E.28067
G1 X121.4 Y135.532
G1 X127.436 Y141.567 E.26226
G1 X126.868 Y141.533
G1 X121.4 Y136.065 E.2376
G1 X121.4 Y136.598
G1 X126.274 Y141.471 E.21176
G1 X125.646 Y141.377
G1 X121.4 Y137.132 E.18447
; WIPE_START
M204 S6000
G1 X122.815 Y138.546 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X124.978 Y141.242 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X114.764 Y131.028 E.44384
G1 X114.949 Y131.746
G1 X124.257 Y141.055 E.40452
G1 X123.47 Y140.801
G1 X115.197 Y132.528 E.35949
G1 X115.544 Y133.408
G1 X122.591 Y140.455 E.30625
G1 X121.553 Y139.95
G1 X116.043 Y134.441 E.2394
; WIPE_START
M204 S6000
G1 X117.458 Y135.855 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X116.923 Y135.854 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
M204 S2000
G1 X120.153 Y139.084 E.14035
; WIPE_START
M204 S6000
G1 X118.739 Y137.67 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X123.592 Y131.779 Z6.2 F42000
G1 X135.786 Y116.976 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.209188
G1 F15000
M204 S6000
G1 X135.569 Y116.797 E.00381
; LINE_WIDTH: 0.165433
G1 X135.352 Y116.617 E.00281
; LINE_WIDTH: 0.1297
G1 X135.251 Y116.537 E.00091
; LINE_WIDTH: 0.102009
G1 X135.15 Y116.458 E.00062
; WIPE_START
G1 X135.251 Y116.537 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.346 Y115.607 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.190397
M73 P92 R1
G1 F15000
M204 S6000
G1 X133.228 Y115.527 E.00171
; LINE_WIDTH: 0.149502
G1 X133.11 Y115.448 E.00124
; LINE_WIDTH: 0.108608
G1 X132.992 Y115.368 E.00076
; WIPE_START
G1 X133.11 Y115.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.01 Y121.126 Z6.2 F42000
G1 X116.105 Y134.379 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.196736
G1 F15000
M204 S6000
G1 X116.001 Y134.236 E.00222
; LINE_WIDTH: 0.153312
G1 X115.896 Y134.093 E.00159
; LINE_WIDTH: 0.109887
G1 X115.792 Y133.95 E.00097
; WIPE_START
G1 X115.896 Y134.093 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.984 Y135.794 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.222276
G1 F15000
M204 S6000
G1 X116.831 Y135.614 E.00344
; LINE_WIDTH: 0.190509
G1 X116.705 Y135.458 E.00242
; LINE_WIDTH: 0.14957
G1 X116.579 Y135.302 E.00175
; LINE_WIDTH: 0.108631
G1 X116.452 Y135.145 E.00108
; WIPE_START
G1 X116.579 Y135.302 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.327 Y134.958 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.127705
G1 F15000
M204 S6000
G1 X120.235 Y135.166 E.00157
; WIPE_START
G1 X120.327 Y134.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.628 Y135.013 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.097236
G1 F15000
M204 S6000
G1 X121.382 Y134.726 E.00167
; WIPE_START
G1 X121.628 Y135.013 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.802 Y136.771 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.104227
G1 F15000
M204 S6000
G1 X120.672 Y136.612 E.00102
; LINE_WIDTH: 0.143098
G1 X120.589 Y136.503 E.00111
; LINE_WIDTH: 0.182919
G1 X120.508 Y136.391 E.00159
; LINE_WIDTH: 0.208848
G1 X120.446 Y136.301 E.00147
; WIPE_START
G1 X120.508 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.85 Y139.542 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.101984
G1 F15000
M204 S6000
G1 X120.749 Y139.463 E.00062
; LINE_WIDTH: 0.129626
G1 X120.648 Y139.383 E.00091
; LINE_WIDTH: 0.165346
G1 X120.431 Y139.203 E.00281
; LINE_WIDTH: 0.209159
G1 X120.214 Y139.024 E.00382
; WIPE_START
G1 X120.431 Y139.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.008 Y140.632 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.108609
G1 F15000
M204 S6000
G1 X122.89 Y140.552 E.00076
; LINE_WIDTH: 0.149503
G1 X122.772 Y140.473 E.00124
; LINE_WIDTH: 0.190397
G1 X122.653 Y140.393 E.00171
; WIPE_START
G1 X122.772 Y140.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.018 Y134.929 Z6.2 F42000
G1 X140.208 Y122.05 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.109885
G1 F15000
M204 S6000
G1 X140.104 Y121.907 E.00097
; LINE_WIDTH: 0.153304
G1 X140 Y121.764 E.00159
; LINE_WIDTH: 0.196723
G1 X139.895 Y121.621 E.00222
M204 S10000
G1 X139.548 Y120.855 F42000
; LINE_WIDTH: 0.108646
G1 F15000
M204 S6000
G1 X139.421 Y120.699 E.00108
; LINE_WIDTH: 0.149615
G1 X139.295 Y120.542 E.00175
; LINE_WIDTH: 0.190583
G1 X139.169 Y120.386 E.00242
; LINE_WIDTH: 0.22233
G1 X139.016 Y120.207 E.00343
; WIPE_START
G1 X139.169 Y120.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.718 Y122.041 Z6.2 F42000
G1 X128.146 Y122.835 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.113147
G1 F15000
M204 S6000
G2 X127.968 Y122.754 I-1.429 J2.896 E.00112
; WIPE_START
G1 X128.146 Y122.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.47 Y125.735 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.191429
G1 F15000
M204 S6000
G1 X127.374 Y125.668 E.00142
; LINE_WIDTH: 0.163913
G1 X127.271 Y125.596 E.00124
; LINE_WIDTH: 0.127691
G1 X127.068 Y125.415 E.00188
G1 X126.957 Y125.291 E.00116
; LINE_WIDTH: 0.149474
G1 X126.899 Y125.215 E.00082
; LINE_WIDTH: 0.182352
G2 X126.814 Y125.111 I-.443 J.276 E.00153
; LINE_WIDTH: 0.191632
G1 X126.747 Y125.165 E.00104
; LINE_WIDTH: 0.15615
G1 X126.68 Y125.219 E.00079
; WIPE_START
G1 X126.747 Y125.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.368 Y127.095 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.102525
G1 F15000
M204 S6000
G2 X133.173 Y126.812 I-.438 J.094 E.00171
; WIPE_START
G1 X133.306 Y126.945 E-.40841
G1 X133.368 Y127.095 E-.35159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.813 Y127.961 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.245397
G1 F15000
M204 S6000
G1 X133.279 Y127.732 E.00959
M204 S10000
G1 X133.811 Y127.965 F42000
; LINE_WIDTH: 0.135366
G1 F15000
M204 S6000
G1 X133.279 Y127.719 E.00442
; WIPE_START
G1 X133.811 Y127.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.36 Y130.366 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.139798
G1 F15000
M204 S6000
M73 P93 R1
G1 X128.119 Y130.233 E.00218
; WIPE_START
G1 X128.36 Y130.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.337 Y127.377 Z6.2 F42000
G1 X120.896 Y127.19 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.114215
G1 F15000
M204 S6000
G3 X120.684 Y127.037 I.078 J-.333 E.00156
; WIPE_START
G1 X120.794 Y127.147 E-.44552
G1 X120.896 Y127.19 E-.31448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.722 Y127.048 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.162068
G1 F15000
M204 S6000
G1 X125.759 Y126.918 E.00131
G1 X125.727 Y126.886 E.00044
G1 X125.597 Y126.923 E.00131
M204 S10000
G1 X126.112 Y127.582 F42000
; LINE_WIDTH: 0.0949269
G1 F15000
M204 S6000
G1 X126.054 Y127.654 E.00039
; LINE_WIDTH: 0.123938
G1 X125.908 Y127.716 E.00104
; LINE_WIDTH: 0.167696
G1 X125.763 Y127.778 E.00161
; WIPE_START
G1 X125.908 Y127.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.883 Y127.009 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.130424
G1 F15000
M204 S6000
G1 X127.952 Y126.951 E.00064
G1 X127.831 Y126.822 E.00126
; WIPE_START
G1 X127.952 Y126.951 E-.50335
G1 X127.883 Y127.009 E-.25665
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.954 Y126.821 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.13389
G1 F15000
M204 S6000
G1 X128.739 Y126.9 E.0017
; WIPE_START
G1 X128.954 Y126.821 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.315 Y134.276 Z6.2 F42000
G1 X125.292 Y143.471 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X125.274 Y143.463 E.00068
G3 X127.609 Y112.299 I2.726 J-15.465 E1.53263
G1 X128.391 Y112.299 E.02597
G3 X126.048 Y143.579 I-.391 J15.699 E1.68846
G1 X125.352 Y143.479 E.02332
M204 S10000
G1 X125.353 Y143.068 F42000
G1 F5400
M204 S6000
G1 X125.344 Y143.062 E.00036
G3 X127.619 Y112.706 I2.656 J-15.064 E1.4929
G1 X128.381 Y112.706 E.0253
G3 X126.098 Y143.176 I-.381 J15.292 E1.64469
G1 X125.413 Y143.077 E.02298
M204 S250
G1 X125.412 Y142.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.628 Y113.098 I2.588 J-14.678 E1.34743
G1 X128.372 Y113.098 E.02284
G3 X125.471 Y142.686 I-.372 J14.9 E1.50542
; WIPE_START
M204 S6000
G1 X124.683 Y142.533 E-.30529
G1 X123.963 Y142.35 E-.28239
G1 X123.529 Y142.216 E-.17233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.012 Y138.244 Z6.2 F42000
G1 X113.32 Y135.994 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X120.377 Y113.13 I14.672 J-7.993 E.88472
G3 X128.988 Y111.324 I7.632 J14.952 E.29531
G3 X113.349 Y136.047 I-.996 J16.678 E2.30017
M204 S10000
G1 X112.962 Y136.189 F42000
G1 F5400
M204 S6000
G3 X120.191 Y112.768 I15.029 J-8.187 E.90628
G3 X129.008 Y110.917 I7.818 J15.316 E.30238
G3 X112.991 Y136.242 I-1.017 J17.084 E2.35639
M204 S250
G1 X112.621 Y136.37 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.219 Y135.6 E.02669
G3 X120.012 Y112.419 I15.772 J-7.598 E.8319
G3 X129.027 Y110.526 I7.997 J15.667 E.2864
G3 X112.643 Y136.423 I-1.036 J17.476 E2.23312
; WIPE_START
M204 S6000
G1 X112.219 Y135.6 E-.35175
G1 X111.866 Y134.801 E-.33179
G1 X111.792 Y134.614 E-.07646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.776 Y135.769 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63922
G1 F10565.163
M204 S6000
G1 X113.766 Y135.751 E.00096
G1 X113.397 Y135.032 E.03927
G1 X113.062 Y134.289 E.03962
G1 X112.769 Y133.543 E.03892
G1 X112.512 Y132.778 E.03926
G1 X112.293 Y131.999 E.03928
G1 X112.113 Y131.212 E.03926
G1 X111.973 Y130.416 E.03926
G1 X111.873 Y129.614 E.03929
G1 X111.812 Y128.808 E.03925
G1 X111.792 Y127.993 E.03963
G1 X111.812 Y127.192 E.03891
G1 X111.873 Y126.386 E.03925
G1 X111.973 Y125.584 E.03929
G1 X112.113 Y124.788 E.03926
G1 X112.293 Y124.001 E.03926
G1 X112.512 Y123.222 E.03928
G1 X112.769 Y122.457 E.03926
G1 X113.065 Y121.704 E.03927
G1 X113.397 Y120.968 E.03926
G1 X113.766 Y120.249 E.03927
G1 X114.17 Y119.548 E.03929
G1 X114.608 Y118.87 E.03925
G1 X115.08 Y118.213 E.03928
G1 X115.584 Y117.582 E.03925
G1 X116.119 Y116.976 E.03928
G1 X116.683 Y116.397 E.03927
G1 X117.275 Y115.848 E.03926
G1 X117.895 Y115.328 E.03928
G1 X118.539 Y114.84 E.03927
G1 X119.206 Y114.385 E.03926
G1 X119.896 Y113.963 E.0393
G1 X120.606 Y113.577 E.03924
G1 X121.334 Y113.226 E.03928
G1 X122.079 Y112.912 E.03928
G1 X122.838 Y112.636 E.03925
G1 X123.61 Y112.398 E.03929
G1 X124.393 Y112.198 E.03925
G1 X125.185 Y112.038 E.03927
G1 X125.985 Y111.918 E.03927
G1 X126.789 Y111.837 E.03928
G1 X127.596 Y111.797 E.03927
G1 X128.396 Y111.797 E.03889
G1 X129.211 Y111.837 E.03963
G1 X130.015 Y111.918 E.03928
G1 X130.815 Y112.038 E.03927
G1 X131.6 Y112.197 E.03892
G1 X132.389 Y112.398 E.03959
G1 X133.155 Y112.634 E.03891
G1 X133.928 Y112.915 E.04001
G1 X134.666 Y113.226 E.0389
G1 X135.394 Y113.577 E.03928
G1 X136.104 Y113.963 E.03924
G1 X136.794 Y114.385 E.0393
G1 X137.461 Y114.84 E.03926
G1 X138.105 Y115.328 E.03927
G1 X138.725 Y115.848 E.03928
G1 X139.322 Y116.402 E.03962
G1 X139.881 Y116.976 E.03891
G1 X140.416 Y117.582 E.03928
G1 X140.92 Y118.213 E.03925
G1 X141.392 Y118.87 E.03927
G1 X141.83 Y119.549 E.03928
G1 X142.234 Y120.248 E.03927
G1 X142.603 Y120.968 E.03927
G1 X142.935 Y121.704 E.03926
G1 X143.23 Y122.456 E.03926
G1 X143.488 Y123.223 E.03927
G1 X143.707 Y124.001 E.03928
G1 X143.887 Y124.788 E.03926
G1 X144.027 Y125.584 E.03926
G1 X144.127 Y126.386 E.03929
G1 X144.188 Y127.192 E.03925
G1 X144.208 Y128 E.03927
G1 X144.188 Y128.808 E.03927
G1 X144.127 Y129.614 E.03925
G1 X144.027 Y130.416 E.03929
G1 X143.887 Y131.212 E.03926
G1 X143.707 Y131.999 E.03926
G1 X143.488 Y132.777 E.03928
G1 X143.23 Y133.544 E.03927
G1 X142.935 Y134.296 E.03926
G1 X142.603 Y135.032 E.03928
G1 X142.234 Y135.751 E.03926
G1 X141.83 Y136.452 E.03929
G1 X141.392 Y137.13 E.03926
G1 X140.92 Y137.786 E.03927
G1 X140.416 Y138.418 E.03927
G1 X139.881 Y139.024 E.03925
G1 X139.317 Y139.603 E.03929
G1 X138.725 Y140.152 E.03925
G1 X138.105 Y140.672 E.03928
G1 X137.461 Y141.16 E.03926
G1 X136.793 Y141.615 E.03928
G1 X136.104 Y142.036 E.03926
G1 X135.394 Y142.423 E.03927
G1 X134.666 Y142.774 E.03927
G1 X133.921 Y143.088 E.03928
G1 X133.162 Y143.364 E.03924
G1 X132.389 Y143.602 E.0393
G1 X131.607 Y143.802 E.03924
G1 X130.815 Y143.962 E.03927
G1 X130.015 Y144.082 E.03927
G1 X129.211 Y144.163 E.03928
G1 X128.404 Y144.203 E.03927
G1 X127.604 Y144.203 E.03889
G1 X126.789 Y144.163 E.03963
G1 X125.985 Y144.082 E.03928
G1 X125.185 Y143.962 E.03927
G1 X124.393 Y143.802 E.03927
G1 X123.611 Y143.602 E.03924
G1 X122.838 Y143.364 E.0393
G1 X122.079 Y143.088 E.03924
G1 X121.334 Y142.774 E.03928
G1 X120.606 Y142.423 E.03928
G1 X119.896 Y142.037 E.03924
G1 X119.206 Y141.615 E.0393
G1 X118.539 Y141.16 E.03926
G1 X117.895 Y140.672 E.03927
G1 X117.275 Y140.152 E.03928
G1 X116.683 Y139.603 E.03926
G1 X116.124 Y139.03 E.0389
G1 X115.579 Y138.412 E.04001
G1 X115.08 Y137.787 E.03889
G1 X114.604 Y137.124 E.03964
G1 X114.17 Y136.451 E.03891
G1 X113.806 Y135.821 E.03539
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10565.163
G1 X113.766 Y135.751 E-.03031
G1 X113.397 Y135.032 E-.30713
G1 X113.062 Y134.289 E-.30982
G1 X112.954 Y134.013 E-.11275
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/32
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I1.193 J-.241 P1  F42000
G1 X112.689 Y132.702 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X112.48 Y131.952 E.02585
G3 X127.601 Y111.988 I15.52 J-3.953 E.95376
G1 X128.399 Y111.988 E.02649
G3 X112.708 Y132.759 I-.399 J16.01 E2.32993
M204 S10000
G1 X113.081 Y132.592 F42000
G1 F5400
M204 S6000
G1 X112.875 Y131.851 E.02551
G3 X127.611 Y112.395 I15.125 J-3.853 E.92952
G1 X128.389 Y112.395 E.02581
G3 X113.1 Y132.649 I-.389 J15.603 E2.27033
M204 S250
G1 X113.46 Y132.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X127.621 Y112.787 I14.54 J-4.486 E.8627
G1 X128.379 Y112.787 E.02331
G3 X113.478 Y132.542 I-.379 J15.212 E2.04986
; WIPE_START
M204 S6000
G1 X113.253 Y131.755 E-.31114
G1 X113.084 Y131.015 E-.28825
G1 X113.011 Y130.599 E-.16061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.387 Y135.958 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X119.683 Y113.595 I14.605 J-7.956 E.8532
G3 X128.892 Y111.395 I8.3 J14.374 E.31849
G3 X113.415 Y136.011 I-.901 J16.607 E2.2927
M204 S10000
G1 X113.029 Y136.153 F42000
G1 F5400
M204 S6000
G3 X119.48 Y113.242 I14.962 J-8.151 E.87409
G3 X128.912 Y110.989 I8.503 J14.727 E.32623
G3 X113.058 Y136.205 I-.921 J17.013 E2.34893
M204 S250
G1 X112.691 Y136.34 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X112.685 Y136.34 E.00019
G3 X118.542 Y113.356 I15.307 J-8.338 E.80156
G3 X128.932 Y110.597 I9.464 J14.7 E.33576
G3 X113.12 Y137.093 I-.94 J17.405 E2.20114
G1 X112.721 Y136.392 E.02479
; WIPE_START
M204 S6000
G1 X112.685 Y136.34 E-.02394
G1 X112.293 Y135.564 E-.33037
G1 X111.936 Y134.772 E-.33029
G1 X111.863 Y134.587 E-.07541
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
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X112.894 Y134.182 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.252632
G1 F15000
M204 S6000
G1 X112.659 Y133.583 E.011
G1 X112.4 Y132.812 E.01391
G1 X112.179 Y132.028 E.01391
G1 X111.998 Y131.235 E.01391
G1 X111.857 Y130.433 E.01391
G1 X111.756 Y129.625 E.01392
G1 X111.695 Y128.814 E.01391
G1 X111.675 Y127.997 E.01396
G1 X111.695 Y127.186 E.01387
G1 X111.756 Y126.375 E.01391
G1 X111.857 Y125.567 E.01392
G1 X111.998 Y124.765 E.01391
G1 X112.179 Y123.972 E.01391
G1 X112.4 Y123.188 E.01391
G1 X112.659 Y122.417 E.01391
G1 X112.957 Y121.659 E.01391
G1 X113.291 Y120.917 E.01391
G1 X113.663 Y120.192 E.01391
G1 X114.07 Y119.487 E.01391
G1 X114.511 Y118.804 E.01391
G1 X114.987 Y118.143 E.01391
M73 P94 R1
G1 X115.494 Y117.507 E.0139
G1 X116.033 Y116.896 E.01392
G1 X116.601 Y116.313 E.01391
G1 X117.198 Y115.76 E.01391
G1 X117.821 Y115.236 E.01391
G1 X118.47 Y114.745 E.01391
G1 X119.143 Y114.286 E.01391
G1 X119.838 Y113.862 E.01392
G1 X120.552 Y113.473 E.0139
G1 X121.286 Y113.119 E.01392
G1 X122.036 Y112.803 E.01391
G1 X122.801 Y112.525 E.0139
G1 X123.579 Y112.285 E.01391
G1 X124.367 Y112.084 E.0139
G1 X125.165 Y111.923 E.01391
G1 X125.97 Y111.801 E.01391
G1 X126.78 Y111.72 E.01392
G1 X127.593 Y111.68 E.01391
G1 X128.404 Y111.68 E.01386
G1 X129.22 Y111.72 E.01395
G1 X130.03 Y111.801 E.01392
G1 X130.835 Y111.923 E.01391
G1 X131.633 Y112.084 E.01391
G1 X132.421 Y112.285 E.0139
G1 X133.199 Y112.525 E.01391
G1 X133.964 Y112.803 E.01391
G1 X134.712 Y113.118 E.01386
G1 X135.448 Y113.473 E.01396
G1 X136.162 Y113.862 E.0139
G1 X136.857 Y114.286 E.01392
G1 X137.528 Y114.743 E.01386
G1 X138.181 Y115.238 E.014
G1 X138.802 Y115.76 E.01387
G1 X139.401 Y116.315 E.01395
G1 X139.967 Y116.896 E.01386
G1 X140.506 Y117.506 E.01392
G1 X141.013 Y118.143 E.0139
G1 X141.489 Y118.804 E.01391
G1 X141.93 Y119.487 E.01391
G1 X142.337 Y120.192 E.01391
G1 X142.709 Y120.917 E.01391
G1 X143.043 Y121.659 E.01391
G1 X143.341 Y122.417 E.01391
G1 X143.6 Y123.188 E.01391
G1 X143.821 Y123.972 E.01391
G1 X144.002 Y124.765 E.01391
G1 X144.143 Y125.567 E.01391
G1 X144.244 Y126.375 E.01392
G1 X144.305 Y127.186 E.01391
G1 X144.325 Y128 E.01391
G1 X144.305 Y128.814 E.01391
G1 X144.244 Y129.625 E.01391
G1 X144.143 Y130.433 E.01392
G1 X144.002 Y131.235 E.01391
G1 X143.821 Y132.028 E.01391
G1 X143.6 Y132.812 E.01391
G1 X143.341 Y133.583 E.01391
G1 X143.043 Y134.341 E.01391
G1 X142.709 Y135.083 E.01391
G1 X142.337 Y135.808 E.01391
G1 X141.93 Y136.513 E.01391
G1 X141.489 Y137.196 E.01391
G1 X141.013 Y137.857 E.01391
G1 X140.506 Y138.493 E.0139
G1 X139.967 Y139.104 E.01392
G1 X139.399 Y139.687 E.01391
G1 X138.802 Y140.24 E.01391
G1 X138.179 Y140.764 E.01391
G1 X137.53 Y141.255 E.01391
G1 X136.857 Y141.714 E.01391
G1 X136.162 Y142.138 E.01392
G1 X135.448 Y142.527 E.0139
G1 X134.714 Y142.881 E.01391
G1 X133.964 Y143.197 E.01391
G1 X133.199 Y143.475 E.01391
G1 X132.421 Y143.715 E.01391
G1 X131.633 Y143.916 E.0139
G1 X130.835 Y144.077 E.01391
G1 X130.03 Y144.199 E.01391
G1 X129.22 Y144.28 E.01392
G1 X128.407 Y144.32 E.01391
G1 X127.596 Y144.32 E.01386
G1 X126.78 Y144.28 E.01395
G1 X125.97 Y144.199 E.01392
G1 X125.165 Y144.077 E.01391
G1 X124.367 Y143.916 E.01391
G1 X123.579 Y143.715 E.0139
G1 X122.801 Y143.475 E.01391
G1 X122.036 Y143.197 E.01391
G1 X121.286 Y142.881 E.01391
G1 X120.552 Y142.527 E.01391
G1 X119.838 Y142.138 E.0139
G1 X119.143 Y141.714 E.01391
G1 X118.47 Y141.255 E.01391
G1 X117.821 Y140.764 E.01391
G1 X117.198 Y140.24 E.01391
G1 X116.601 Y139.687 E.01391
G1 X116.035 Y139.106 E.01386
G1 X115.492 Y138.492 E.014
G1 X114.987 Y137.857 E.01386
G1 X114.51 Y137.194 E.01395
G1 X114.07 Y136.513 E.01387
G1 X113.663 Y135.808 E.01391
G1 X113.291 Y135.083 E.01391
G1 X112.956 Y134.339 E.01395
G1 X112.916 Y134.238 E.00185
; WIPE_START
G1 X112.659 Y133.583 E-.26729
G1 X112.4 Y132.812 E-.30926
G1 X112.269 Y132.347 E-.18345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.9 Y132.214 Z6.4 F42000
G1 X122.29 Y132.173 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X122.29 Y138.227 I.714 J3.027 E.25597
G1 X122.29 Y138.718 E.01507
G3 X122.29 Y131.682 I.714 J-3.518 E.30234
G1 X122.29 Y132.113 E.01323
M204 S10000
G1 X122.094 Y131.975 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130591
G1 F15000
M204 S6000
G1 X121.605 Y132.155 E.00372
G1 X121.168 Y132.395 E.00356
G1 X120.913 Y132.58 E.00225
G1 X120.663 Y132.8 E.00237
G1 X120.33 Y133.177 E.00359
G1 X120.058 Y133.598 E.00358
G1 X119.85 Y134.06 E.00362
G1 X119.753 Y134.378 E.00237
G1 X119.688 Y134.699 E.00234
G1 X119.65 Y135.2 E.00359
G1 X119.688 Y135.701 E.00359
G1 X119.753 Y136.022 E.00234
G1 X119.85 Y136.34 E.00237
G1 X120.054 Y136.795 E.00356
G1 X120.33 Y137.223 E.00364
G1 X120.664 Y137.601 E.0036
G1 X120.9 Y137.81 E.00225
G1 X121.168 Y138.005 E.00237
G1 X121.605 Y138.245 E.00356
G1 X122.094 Y138.425 E.00372
; WIPE_START
G1 X121.605 Y138.245 E-.19807
G1 X121.168 Y138.005 E-.18937
G1 X120.9 Y137.81 E-.12611
G1 X120.664 Y137.601 E-.11991
G1 X120.443 Y137.351 E-.12653
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.937 Y133.286 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.29 Y133.129 I1.063 J1.914 E.01188
G1 X122.29 Y133.646 E.01589
G2 X122.29 Y136.754 I.711 J1.554 E.11989
G1 X122.29 Y137.271 E.01589
G3 X121.885 Y133.316 I.71 J-2.071 E.15318
M204 S10000
G1 X122.094 Y133.474 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.131107
G1 F15000
M204 S6000
G2 X122.094 Y136.926 I.906 J1.726 E.03047
; WIPE_START
G1 X121.89 Y136.803 E-.09065
G1 X121.665 Y136.621 E-.10993
G1 X121.498 Y136.443 E-.09267
G1 X121.331 Y136.209 E-.10935
G1 X121.2 Y135.95 E-.10999
G1 X121.122 Y135.724 E-.09106
G1 X121.071 Y135.485 E-.09287
G1 X121.059 Y135.318 E-.0635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.705 Y135.18 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.705 Y135.171 E.00032
G3 X123.022 Y134.904 I.296 J.029 E.01524
G1 X123.161 Y134.95 E.00487
G1 X123.261 Y135.058 E.00486
G1 X123.291 Y135.141 E.00294
G1 X123.296 Y135.229 E.00293
G1 X123.246 Y135.367 E.00487
G3 X122.709 Y135.259 I-.245 J-.167 E.02309
G1 X122.708 Y135.24 E.00063
M204 S250
G1 X122.311 Y135.2 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.983 Y134.51 I.689 J0 E.03276
G1 X123.052 Y134.512 E.00211
G3 X122.313 Y135.26 I-.052 J.687 E.09637
; WIPE_START
M204 S6000
G1 X122.341 Y134.997 E-.10057
G1 X122.394 Y134.87 E-.05225
G1 X122.47 Y134.759 E-.05116
G1 X122.597 Y134.64 E-.06618
G1 X122.716 Y134.571 E-.05218
G1 X122.846 Y134.528 E-.05218
G1 X122.983 Y134.51 E-.05222
G1 X123.052 Y134.512 E-.02611
G1 X123.187 Y134.536 E-.05218
G1 X123.315 Y134.586 E-.05221
G1 X123.43 Y134.661 E-.05222
G1 X123.528 Y134.757 E-.05216
G1 X123.606 Y134.87 E-.05217
G1 X123.653 Y134.982 E-.0462
; WIPE_END
M73 P95 R1
G1 E-.04 F1800
M204 S10000
G1 X129.307 Y135.2 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.802 Y135.584 E.02104
G1 X128.802 Y134.816 E.0255
G1 X129.259 Y135.164 E.01905
M204 S250
G1 X129.953 Y135.2 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X128.41 Y136.376 E.05962
G1 X128.41 Y135.59 E.02415
G1 X126.71 Y135.59 E.05224
G1 X126.71 Y134.81 E.02397
G1 X128.41 Y134.81 E.05224
G1 X128.41 Y134.024 E.02415
G1 X129.906 Y135.164 E.05778
; WIPE_START
M204 S6000
G1 X128.41 Y136.376 E-.73164
G1 X128.41 Y136.301 E-.02836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.606 Y135.2 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43086
G1 F15000
M204 S6000
G1 X126.906 Y135.2 E.05374
; WIPE_START
G1 X128.606 Y135.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.24 Y133.84 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X132.76 Y133.84 E.04671
G1 X132.76 Y136.56 E.08358
G1 X131.24 Y136.56 E.04671
G1 X131.24 Y133.9 E.08173
; WIPE_START
M204 S6000
G1 X132.76 Y133.84 E-.57805
G1 X132.76 Y134.319 E-.18195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.152 Y133.902 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X133.598 Y133.902 E.01479
G1 X133.598 Y136.498 E.08611
G1 X133.152 Y136.498 E.01479
G1 X133.152 Y133.962 E.08412
; WIPE_START
G1 X133.598 Y133.902 E-.17096
G1 X133.598 Y135.452 E-.58904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.81 Y133.51 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.99 Y133.51 E.09771
G1 X133.99 Y136.89 E.10386
G1 X130.81 Y136.89 E.09771
G1 X130.81 Y133.57 E.10201
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
M204 S6000
G1 X132.81 Y133.532 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/32
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
M106 S191.25
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.4 I.057 J-1.216 P1  F42000
G1 X113.052 Y132.611 Z6.4
G1 Z6.2
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X127.61 Y112.358 I14.948 J-4.613 E.887
G1 X128.39 Y112.358 E.02397
G3 X113.069 Y132.668 I-.39 J15.639 E2.10753
; WIPE_START
M204 S6000
G1 X112.837 Y131.861 E-.31928
G1 X112.664 Y131.1 E-.29636
G1 X112.598 Y130.726 E-.14435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.811 Y136.271 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X122.494 Y111.611 I15.18 J-8.271 E.92748
G3 X129.114 Y110.75 I5.49 J16.337 E.20643
G3 X112.84 Y136.324 I-1.123 J17.25 E2.20176
; WIPE_START
M204 S6000
G1 X112.423 Y135.502 E-.35036
G1 X112.068 Y134.716 E-.32757
G1 X111.989 Y134.515 E-.08207
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


G1 X142.127 Y118.397 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Top surface
M204 S2000
G1 X137.621 Y113.891 E.19577
M204 S10000
G1 X136.238 Y113.041 F42000
G1 F1800
M204 S2000
G1 X142.968 Y119.771 E.29245
G1 X143.505 Y120.841
G1 X135.155 Y112.492 E.36283
; WIPE_START
M204 S6000
G1 X136.569 Y113.906 E-.76
; WIPE_END
G1 E-.04
M204 S10000
M73 P95 R0
G1 X137.267 Y115.136 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
M204 S2000
G1 X134.222 Y112.092 E.13231
G1 X133.388 Y111.791
G1 X135.795 Y114.198 E.10459
G1 X134.698 Y113.634
G1 X132.618 Y111.554 E.0904
G1 X131.902 Y111.372
G1 X133.761 Y113.23 E.08077
G1 X132.933 Y112.935
G1 X131.227 Y111.23 E.07411
G1 X130.583 Y111.12
G1 X132.171 Y112.707 E.06899
G1 X131.46 Y112.53
G1 X129.965 Y111.034 E.06498
G1 X129.372 Y110.975
G1 X130.792 Y112.395 E.06168
G1 X130.162 Y112.298
G1 X128.806 Y110.942 E.05891
G1 X128.254 Y110.923
G1 X129.558 Y112.228 E.05669
G1 X128.977 Y112.18
G1 X127.721 Y110.923 E.05462
G1 X127.206 Y110.941
G1 X128.416 Y112.152 E.0526
G1 X127.882 Y112.151
G1 X126.699 Y110.968 E.0514
G1 X126.214 Y111.016
G1 X127.361 Y112.163 E.04982
G1 X126.853 Y112.188
G1 X125.736 Y111.071 E.04854
G1 X125.273 Y111.141
G1 X126.366 Y112.235 E.04753
G1 X125.888 Y112.29
G1 X124.819 Y111.221 E.04647
G1 X124.375 Y111.31
G1 X125.425 Y112.36 E.04561
G1 X124.974 Y112.442
G1 X123.943 Y111.411 E.04479
G1 X123.518 Y111.519
G1 X124.53 Y112.532 E.04399
G1 X124.103 Y112.638
G1 X123.104 Y111.639 E.04338
G1 X122.697 Y111.765
G1 X123.679 Y112.747 E.04267
G1 X123.271 Y112.873
G1 X122.3 Y111.902 E.04219
G1 X121.909 Y112.044
G1 X122.867 Y113.002 E.04163
G1 X122.476 Y113.144
G1 X121.528 Y112.196 E.0412
G1 X121.153 Y112.354
G1 X122.09 Y113.291 E.04073
G1 X121.715 Y113.45
G1 X120.786 Y112.52 E.04038
G1 X120.426 Y112.694
G1 X121.346 Y113.613 E.03997
G1 X120.986 Y113.787
G1 X120.072 Y112.873 E.03972
G1 X119.726 Y113.061
G1 X120.631 Y113.966 E.03933
G1 X120.286 Y114.154
G1 X119.384 Y113.252 E.03919
G1 X119.053 Y113.454
G1 X119.946 Y114.347 E.03881
G1 X119.615 Y114.55
G1 X118.723 Y113.657 E.03879
G1 X118.406 Y113.873
G1 X119.289 Y114.757 E.0384
G1 X118.972 Y114.973
G1 X118.089 Y114.089 E.0384
G1 X117.783 Y114.316
G1 X118.659 Y115.193 E.03808
G1 X118.356 Y115.423
G1 X117.479 Y114.546 E.03808
G1 X117.183 Y114.784
G1 X118.055 Y115.655 E.03787
G1 X117.765 Y115.899
G1 X116.893 Y115.027 E.03787
G1 X116.608 Y115.275
G1 X117.477 Y116.144 E.03775
G1 X117.2 Y116.4
G1 X116.331 Y115.531 E.03775
G1 X116.055 Y115.789
G1 X116.924 Y116.657 E.03773
G1 X116.66 Y116.927
G1 X115.792 Y116.059 E.03773
G1 X115.529 Y116.329
G1 X116.397 Y117.197 E.03773
G1 X116.146 Y117.479
G1 X115.276 Y116.609 E.0378
G1 X115.026 Y116.893
G1 X115.896 Y117.763 E.0378
G1 X115.657 Y118.057
G1 X114.784 Y117.183 E.03797
G1 X114.547 Y117.48
G1 X115.421 Y118.354 E.03797
G1 X115.194 Y118.661
G1 X114.315 Y117.781 E.03823
G1 X114.092 Y118.091
G1 X114.971 Y118.971 E.03823
G1 X114.758 Y119.29
G1 X113.87 Y118.402 E.03859
G1 X113.66 Y118.726
G1 X114.548 Y119.614 E.03859
G1 X114.348 Y119.947
G1 X113.451 Y119.05 E.03898
G1 X113.254 Y119.387
G1 X114.153 Y120.285 E.03906
G1 X113.967 Y120.632
G1 X113.059 Y119.725 E.03944
G1 X112.874 Y120.073
G1 X113.786 Y120.985 E.03964
M73 P96 R0
G1 X113.614 Y121.347
G1 X112.693 Y120.425 E.04003
G1 X112.52 Y120.786
G1 X113.448 Y121.714 E.04033
G1 X113.293 Y122.092
G1 X112.354 Y121.153 E.04077
G1 X112.195 Y121.527
G1 X113.142 Y122.475 E.04116
G1 X113.004 Y122.869
G1 X112.045 Y121.91 E.04168
G1 X111.9 Y122.299
G1 X112.87 Y123.268 E.04213
G1 X112.75 Y123.682
G1 X111.766 Y122.698 E.04276
G1 X111.638 Y123.103
G1 X112.634 Y124.099 E.04327
G1 X112.535 Y124.533
G1 X111.521 Y123.519 E.04406
G1 X111.41 Y123.942
G1 X112.44 Y124.972 E.04476
G1 X112.36 Y125.425
G1 X111.311 Y124.376 E.0456
G1 X111.221 Y124.819
G1 X112.291 Y125.89 E.04653
G1 X112.232 Y126.363
G1 X111.141 Y125.272 E.04742
G1 X111.073 Y125.738
G1 X112.192 Y126.857 E.04863
G1 X112.162 Y127.36
G1 X111.014 Y126.212 E.0499
G1 X110.972 Y126.704
G1 X112.149 Y127.88 E.05113
G1 X112.156 Y128.421
G1 X110.938 Y127.202 E.05296
G1 X110.925 Y127.722
G1 X112.18 Y128.977 E.05453
G1 X112.223 Y129.554
G1 X110.924 Y128.255 E.05644
G1 X110.938 Y128.802
G1 X112.298 Y130.162 E.0591
G1 X112.4 Y130.797
G1 X110.978 Y129.376 E.06176
G1 X111.036 Y129.967
G1 X112.534 Y131.465 E.0651
G1 X112.71 Y132.174
G1 X111.114 Y130.578 E.06934
G1 X111.228 Y131.226
G1 X112.939 Y132.936 E.07431
G1 X113.238 Y133.768
G1 X111.375 Y131.906 E.08093
G1 X111.561 Y132.625
G1 X113.634 Y134.698 E.09009
G1 X114.201 Y135.798
G1 X111.797 Y133.394 E.10447
G1 X112.1 Y134.23
G1 X115.157 Y137.287 E.13282
; WIPE_START
M204 S6000
G1 X113.742 Y135.873 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X120.191 Y131.79 Z6.6 F42000
G1 X140.844 Y118.713 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S2000
G1 X143.9 Y121.77 E.13281
G1 X144.203 Y122.606
G1 X141.799 Y120.202 E.10446
G1 X142.366 Y121.302
G1 X144.439 Y123.375 E.09009
G1 X144.625 Y124.094
G1 X142.762 Y122.232 E.08093
G1 X143.062 Y123.064
G1 X144.772 Y124.775 E.07431
G1 X144.886 Y125.422
G1 X143.29 Y123.826 E.06933
G1 X143.466 Y124.535
G1 X144.964 Y126.033 E.0651
G1 X145.022 Y126.624
G1 X143.6 Y125.203 E.06176
G1 X143.702 Y125.838
G1 X145.062 Y127.198 E.0591
G1 X145.076 Y127.745
G1 X143.777 Y126.446 E.05644
G1 X143.82 Y127.023
G1 X145.075 Y128.278 E.05453
G1 X145.062 Y128.798
G1 X143.844 Y127.579 E.05296
G1 X143.851 Y128.12
G1 X145.028 Y129.297 E.05113
G1 X144.986 Y129.789
G1 X143.838 Y128.64 E.0499
G1 X143.808 Y129.143
G1 X144.927 Y130.262 E.04863
G1 X144.859 Y130.728
G1 X143.768 Y129.637 E.04742
G1 X143.709 Y130.111
G1 X144.779 Y131.181 E.04653
G1 X144.689 Y131.624
G1 X143.64 Y130.575 E.0456
G1 X143.56 Y131.028
G1 X144.59 Y132.058 E.04476
G1 X144.479 Y132.481
G1 X143.465 Y131.467 E.04406
G1 X143.366 Y131.901
G1 X144.362 Y132.897 E.04327
G1 X144.234 Y133.302
G1 X143.25 Y132.318 E.04276
G1 X143.13 Y132.732
G1 X144.1 Y133.701 E.04213
G1 X143.955 Y134.09
G1 X142.996 Y133.131 E.04167
G1 X142.857 Y133.526
G1 X143.805 Y134.473 E.04116
G1 X143.645 Y134.847
G1 X142.707 Y133.909 E.04077
G1 X142.551 Y134.286
G1 X143.48 Y135.214 E.04033
G1 X143.307 Y135.575
G1 X142.386 Y134.654 E.04003
G1 X142.214 Y135.015
G1 X143.126 Y135.927 E.03964
G1 X142.941 Y136.275
G1 X142.033 Y135.368 E.03944
G1 X141.847 Y135.715
G1 X142.746 Y136.613 E.03906
G1 X142.549 Y136.95
G1 X141.652 Y136.053 E.03898
G1 X141.451 Y136.386
G1 X142.339 Y137.274 E.03859
G1 X142.13 Y137.598
G1 X141.242 Y136.71 E.03859
G1 X141.029 Y137.029
G1 X141.908 Y137.909 E.03823
G1 X141.685 Y138.219
G1 X140.806 Y137.339 E.03823
G1 X140.579 Y137.646
G1 X141.453 Y138.52 E.03797
G1 X141.216 Y138.817
G1 X140.343 Y137.943 E.03796
G1 X140.104 Y138.237
G1 X140.974 Y139.107 E.0378
G1 X140.724 Y139.391
G1 X139.854 Y138.521 E.0378
G1 X139.603 Y138.803
G1 X140.471 Y139.671 E.03773
G1 X140.208 Y139.941
G1 X139.34 Y139.073 E.03773
G1 X139.076 Y139.343
G1 X139.944 Y140.211 E.03773
G1 X139.669 Y140.469
G1 X138.8 Y139.6 E.03775
G1 X138.523 Y139.857
G1 X139.392 Y140.725 E.03775
G1 X139.106 Y140.973
G1 X138.235 Y140.101 E.03787
G1 X137.945 Y140.345
G1 X138.816 Y141.216 E.03787
G1 X138.521 Y141.454
G1 X137.644 Y140.577 E.03808
G1 X137.341 Y140.807
G1 X138.217 Y141.684 E.03808
G1 X137.911 Y141.911
G1 X137.028 Y141.027 E.0384
G1 X136.711 Y141.243
G1 X137.594 Y142.127 E.0384
G1 X137.277 Y142.343
G1 X136.384 Y141.45 E.03879
G1 X136.053 Y141.653
G1 X136.947 Y142.546 E.03881
G1 X136.616 Y142.748
G1 X135.714 Y141.846 E.03919
G1 X135.368 Y142.034
G1 X136.274 Y142.939 E.03933
G1 X135.928 Y143.127
G1 X135.014 Y142.213 E.03972
G1 X134.654 Y142.387
G1 X135.574 Y143.306 E.03997
G1 X135.214 Y143.48
G1 X134.285 Y142.55 E.04038
G1 X133.91 Y142.709
G1 X134.847 Y143.646 E.04073
G1 X134.472 Y143.804
G1 X133.524 Y142.856 E.0412
G1 X133.133 Y142.998
G1 X134.091 Y143.956 E.04163
G1 X133.7 Y144.098
G1 X132.729 Y143.127 E.04219
G1 X132.321 Y143.253
G1 X133.303 Y144.235 E.04267
G1 X132.896 Y144.361
G1 X131.897 Y143.362 E.04338
G1 X131.47 Y143.468
G1 X132.482 Y144.481 E.04399
G1 X132.057 Y144.589
G1 X131.026 Y143.558 E.04479
G1 X130.575 Y143.64
G1 X131.625 Y144.69 E.04561
G1 X131.181 Y144.779
G1 X130.112 Y143.71 E.04647
G1 X129.633 Y143.765
G1 X130.727 Y144.859 E.04753
G1 X130.264 Y144.929
G1 X129.147 Y143.812 E.04854
G1 X128.639 Y143.837
G1 X129.786 Y144.984 E.04982
G1 X129.301 Y145.032
G1 X128.118 Y143.849 E.0514
G1 X127.584 Y143.848
G1 X128.794 Y145.059 E.0526
G1 X128.279 Y145.077
G1 X127.022 Y143.82 E.05462
G1 X126.441 Y143.772
G1 X127.746 Y145.077 E.05669
G1 X127.194 Y145.058
G1 X125.838 Y143.702 E.05891
G1 X125.208 Y143.605
G1 X126.627 Y145.025 E.06169
G1 X126.035 Y144.966
G1 X124.539 Y143.47 E.06498
G1 X123.829 Y143.293
G1 X125.416 Y144.88 E.06899
G1 X124.773 Y144.77
G1 X123.067 Y143.064 E.07411
G1 X122.239 Y142.769
G1 X124.098 Y144.628 E.08077
G1 X123.382 Y144.446
G1 X121.302 Y142.366 E.09041
G1 X120.205 Y141.802
G1 X122.612 Y144.209 E.10459
G1 X121.778 Y143.908
G1 X118.733 Y140.863 E.13233
; WIPE_START
M204 S6000
G1 X120.147 Y142.277 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X120.845 Y143.508 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
M204 S2000
G1 X112.495 Y135.159 E.36282
G1 X113.032 Y136.229
G1 X119.762 Y142.959 E.29243
M204 S10000
G1 X118.378 Y142.108 F42000
G1 F1800
M204 S2000
G1 X113.874 Y137.604 E.19574
; WIPE_START
M204 S6000
G1 X115.288 Y139.018 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X122.525 Y136.593 Z6.6 F42000
G1 X143.847 Y129.45 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0987564
G1 F15000
M204 S6000
G1 X143.767 Y129.616 E.00084
; WIPE_START
G1 X143.847 Y129.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.712 Y121.818 Z6.6 F42000
G1 X143.703 Y121.28 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.107928
G1 F15000
M204 S6000
G1 X143.628 Y121.171 E.0007
; LINE_WIDTH: 0.1491
G1 X143.535 Y121.037 E.00141
; LINE_WIDTH: 0.191951
G1 X143.443 Y120.903 E.00197
; WIPE_START
G1 X143.535 Y121.037 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.86 Y120.141 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.204706
G1 F15000
M204 S6000
G1 X141.754 Y120.003 E.0023
; LINE_WIDTH: 0.167123
G1 X141.648 Y119.864 E.00176
; LINE_WIDTH: 0.129357
G1 X141.54 Y119.725 E.00124
; LINE_WIDTH: 0.0992536
G1 X141.46 Y119.626 E.00059
; WIPE_START
G1 X141.54 Y119.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.556 Y119.064 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.111556
G1 F15000
M204 S6000
G1 X142.392 Y118.862 E.00145
; LINE_WIDTH: 0.158346
G1 X142.229 Y118.659 E.00244
; LINE_WIDTH: 0.205136
G1 X142.066 Y118.457 E.00343
; WIPE_START
G1 X142.229 Y118.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.904 Y118.653 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.213666
G1 F15000
M204 S6000
G1 X140.682 Y118.392 E.00477
; LINE_WIDTH: 0.171474
G1 X140.418 Y118.097 E.00415
; LINE_WIDTH: 0.127011
G1 X140.153 Y117.801 E.00272
; LINE_WIDTH: 0.0964663
G1 X139.955 Y117.59 E.00126
; WIPE_START
G1 X140.153 Y117.801 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.224 Y117.197 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0994947
G1 F15000
M204 S6000
G1 X141.074 Y117.029 E.00104
; LINE_WIDTH: 0.124087
G1 X140.783 Y116.72 E.00281
; LINE_WIDTH: 0.161178
G2 X139.282 Y115.215 I-26.614 J25.047 E.02048
; LINE_WIDTH: 0.129029
G1 X139.044 Y114.997 E.00227
; LINE_WIDTH: 0.101784
G1 X138.805 Y114.778 E.00155
; WIPE_START
G1 X139.044 Y114.997 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.396 Y116.03 Z6.6 F42000
M73 P97 R0
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.102186
G1 F15000
M204 S6000
G1 X138.151 Y115.806 E.00161
; LINE_WIDTH: 0.130339
G1 X137.904 Y115.579 E.00239
; LINE_WIDTH: 0.167435
G1 X137.615 Y115.328 E.00388
; LINE_WIDTH: 0.213231
G1 X137.327 Y115.076 E.00531
; WIPE_START
G1 X137.615 Y115.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.382 Y114.546 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.108354
G1 F15000
M204 S6000
G1 X136.241 Y114.436 E.00095
; LINE_WIDTH: 0.148738
G1 X136.101 Y114.326 E.00154
; LINE_WIDTH: 0.189599
G1 X135.958 Y114.213 E.00218
; LINE_WIDTH: 0.215684
G1 X135.856 Y114.137 E.00179
; WIPE_START
G1 X135.958 Y114.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.561 Y113.952 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.216216
G1 F15000
M204 S6000
G1 X137.402 Y113.82 E.00291
; LINE_WIDTH: 0.186517
G1 X137.243 Y113.689 E.00241
; LINE_WIDTH: 0.150788
G1 X137.095 Y113.572 E.00165
; LINE_WIDTH: 0.109038
G1 X136.948 Y113.456 E.00101
M204 S10000
G1 X136.177 Y113.102 F42000
; LINE_WIDTH: 0.202082
G1 F15000
M204 S6000
G1 X136.047 Y113.005 E.0021
; LINE_WIDTH: 0.164335
G1 X135.917 Y112.908 E.0016
; LINE_WIDTH: 0.126587
G1 X135.787 Y112.811 E.0011
; LINE_WIDTH: 0.0979411
G1 X135.721 Y112.764 E.00036
M204 S10000
G1 X135.093 Y112.553 F42000
; LINE_WIDTH: 0.211349
G1 F15000
M204 S6000
G1 X135 Y112.487 E.00158
; LINE_WIDTH: 0.187003
G1 X134.908 Y112.425 E.0013
; LINE_WIDTH: 0.147466
G1 X134.816 Y112.364 E.00094
; LINE_WIDTH: 0.107929
G1 X134.725 Y112.302 E.00059
; WIPE_START
G1 X134.816 Y112.364 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.175 Y113.404 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.108368
G1 F15000
M204 S6000
G1 X134.058 Y113.325 E.00075
; LINE_WIDTH: 0.148781
G1 X133.941 Y113.246 E.00122
; LINE_WIDTH: 0.189195
G1 X133.824 Y113.168 E.00168
; WIPE_START
G1 X133.941 Y113.246 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.515 Y112.806 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.193133
G1 F15000
M204 S6000
G2 X132.235 Y112.643 I-5.425 J8.978 E.00397
; WIPE_START
G1 X132.515 Y112.806 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y112.886 Z6.6 F42000
G1 X123.038 Y112.906 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.098435
G1 F15000
M204 S6000
G1 X122.905 Y112.989 E.00071
; WIPE_START
G1 X123.038 Y112.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.264 Y118.861 Z6.6 F42000
G1 X112.233 Y126.384 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0986901
G1 F15000
M204 S6000
G2 X112.154 Y126.552 I4.51 J2.231 E.00084
; WIPE_START
G1 X112.233 Y126.384 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.517 Y134.011 Z6.6 F42000
G1 X112.557 Y135.097 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.192512
G1 F15000
M204 S6000
G1 X112.471 Y134.971 E.00186
; LINE_WIDTH: 0.150777
G1 X112.384 Y134.846 E.00134
; LINE_WIDTH: 0.109042
G1 X112.297 Y134.72 E.00082
; WIPE_START
G1 X112.384 Y134.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.54 Y136.375 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.109104
G1 F15000
M204 S6000
G1 X114.403 Y136.201 E.00119
; LINE_WIDTH: 0.156926
G1 X114.272 Y136.03 E.002
; LINE_WIDTH: 0.201305
G1 X114.14 Y135.859 E.00278
; WIPE_START
G1 X114.272 Y136.03 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.934 Y137.543 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.205137
G1 F15000
M204 S6000
G1 X113.771 Y137.341 E.00343
; LINE_WIDTH: 0.158346
G1 X113.608 Y137.139 E.00244
; LINE_WIDTH: 0.111556
G1 X113.444 Y136.937 E.00145
; WIPE_START
G1 X113.608 Y137.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.046 Y138.411 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0965602
G1 F15000
M204 S6000
G1 X115.845 Y138.198 E.00128
; LINE_WIDTH: 0.127196
G1 X115.582 Y137.903 E.00272
; LINE_WIDTH: 0.171786
G1 X115.316 Y137.605 E.00419
; LINE_WIDTH: 0.213932
G1 X115.096 Y137.347 E.00472
; WIPE_START
G1 X115.316 Y137.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.194 Y141.221 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.101763
G1 F15000
M204 S6000
G1 X116.956 Y141.003 E.00155
; LINE_WIDTH: 0.128965
G1 X116.718 Y140.785 E.00227
; LINE_WIDTH: 0.163747
G3 X115.508 Y139.59 I23.338 J-24.84 E.01674
; LINE_WIDTH: 0.150481
G1 X115.217 Y139.28 E.00373
; LINE_WIDTH: 0.115527
G3 X114.777 Y138.803 I9.316 J-9.044 E.00384
; WIPE_START
G1 X115.217 Y139.28 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.673 Y140.923 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.213267
G1 F15000
M204 S6000
G1 X118.385 Y140.672 E.00531
; LINE_WIDTH: 0.167362
G1 X118.094 Y140.419 E.0039
; LINE_WIDTH: 0.130317
G1 X117.849 Y140.194 E.00237
; LINE_WIDTH: 0.102214
G1 X117.603 Y139.969 E.00161
; WIPE_START
G1 X117.849 Y140.194 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.144 Y141.863 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.215564
G1 F15000
M204 S6000
G1 X120.039 Y141.785 E.00184
; LINE_WIDTH: 0.189228
G1 X119.899 Y141.674 E.00213
; LINE_WIDTH: 0.148803
G1 X119.758 Y141.564 E.00154
; LINE_WIDTH: 0.108377
G1 X119.618 Y141.453 E.00095
; WIPE_START
G1 X119.758 Y141.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.052 Y142.544 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.109017
G1 F15000
M204 S6000
G1 X118.904 Y142.427 E.00101
; LINE_WIDTH: 0.150724
G1 X118.757 Y142.311 E.00165
; LINE_WIDTH: 0.186455
G1 X118.598 Y142.18 E.00242
; LINE_WIDTH: 0.216195
G1 X118.439 Y142.048 E.00292
M204 S10000
G1 X120.279 Y143.236 F42000
; LINE_WIDTH: 0.0979008
G1 F15000
M204 S6000
G1 X120.213 Y143.189 E.00036
; LINE_WIDTH: 0.126511
G1 X120.083 Y143.092 E.0011
; LINE_WIDTH: 0.164284
G1 X119.953 Y142.995 E.0016
; LINE_WIDTH: 0.202057
G1 X119.823 Y142.898 E.0021
M204 S10000
G1 X121.275 Y143.698 F42000
; LINE_WIDTH: 0.107913
G1 F15000
M204 S6000
G1 X121.183 Y143.636 E.00058
; LINE_WIDTH: 0.147417
G1 X121.092 Y143.575 E.00094
; LINE_WIDTH: 0.199373
G3 X120.906 Y143.446 I2.474 J-3.776 E.00288
; WIPE_START
G1 X121.092 Y143.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.176 Y142.832 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.189195
G1 F15000
M204 S6000
G1 X122.059 Y142.754 E.00168
; LINE_WIDTH: 0.148781
G1 X121.942 Y142.675 E.00122
; LINE_WIDTH: 0.108368
G1 X121.825 Y142.596 E.00075
; WIPE_START
G1 X121.942 Y142.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.764 Y143.357 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.193207
G1 F15000
M204 S6000
G3 X123.484 Y143.194 I5.175 J-9.22 E.00397
; WIPE_START
G1 X123.764 Y143.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.392 Y143.074 Z6.6 F42000
G1 X133.095 Y143.011 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0983613
G1 F15000
M204 S6000
G1 X132.962 Y143.094 E.00071
; WIPE_START
G1 X133.095 Y143.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.706 Y137.605 Z6.6 F42000
G1 X122.29 Y132.173 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X122.29 Y138.227 I.714 J3.027 E.25597
G1 X122.29 Y138.718 E.01507
G3 X122.29 Y131.682 I.71 J-3.518 E.30252
G1 X122.29 Y132.113 E.01323
M204 S10000
G1 X122.094 Y131.975 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130632
G1 F15000
M204 S6000
G1 X121.627 Y132.145 E.00356
G1 X121.31 Y132.308 E.00255
G2 X122.094 Y138.425 I1.692 J2.892 E.05599
; WIPE_START
G1 X121.625 Y138.254 E-.18985
G1 X121.184 Y138.015 E-.19043
G1 X120.786 Y137.714 E-.18969
G1 X120.493 Y137.42 E-.15767
G1 X120.441 Y137.353 E-.03236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.29 Y133.129 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.29 Y133.646 E.01587
G2 X122.29 Y136.754 I.712 J1.554 E.11992
G1 X122.29 Y137.271 E.01587
G3 X122.234 Y133.149 I.713 J-2.071 E.16496
M204 S10000
G1 X122.09 Y133.427 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130428
G1 F15000
M204 S6000
G3 X121.939 Y133.565 I-.197 J-.063 E.00152
G1 X121.762 Y133.694 E.00157
G2 X122.094 Y136.926 I1.241 J1.506 E.02738
; WIPE_START
G1 X121.89 Y136.802 E-.09068
G1 X121.7 Y136.653 E-.092
G1 X121.413 Y136.331 E-.16388
G1 X121.308 Y136.168 E-.07363
G1 X121.184 Y135.91 E-.10859
G1 X121.109 Y135.671 E-.09523
G1 X121.065 Y135.437 E-.09042
G1 X121.058 Y135.318 E-.04557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.703 Y135.185 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X122.732 Y135.071 E.00391
G1 X122.803 Y134.977 E.00391
G1 X122.905 Y134.918 E.00391
G1 X123.018 Y134.903 E.00376
G1 X123.122 Y134.929 E.00357
G1 X123.218 Y134.998 E.00391
G1 X123.279 Y135.098 E.0039
G1 X123.297 Y135.215 E.00391
G1 X123.268 Y135.329 E.0039
G1 X123.197 Y135.423 E.00391
G1 X123.095 Y135.482 E.00391
G1 X122.978 Y135.496 E.0039
G1 X122.864 Y135.464 E.00391
G1 X122.772 Y135.391 E.0039
G1 X122.716 Y135.287 E.00391
G1 X122.711 Y135.245 E.00143
M204 S250
G1 X122.31 Y135.235 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X122.983 Y134.51 I.688 J-.036 E.03393
G1 X123.038 Y134.511 E.00169
G3 X122.315 Y135.295 I-.04 J.688 E.09562
; WIPE_START
M204 S6000
G1 X122.318 Y135.097 E-.07514
G1 X122.352 Y134.964 E-.05225
G1 X122.411 Y134.84 E-.05215
G1 X122.494 Y134.731 E-.0522
G1 X122.597 Y134.64 E-.05218
G1 X122.716 Y134.571 E-.05217
G1 X122.846 Y134.528 E-.0522
G1 X122.983 Y134.51 E-.05249
G1 X123.038 Y134.511 E-.02085
G1 X123.284 Y134.571 E-.096
G1 X123.403 Y134.64 E-.05217
G1 X123.506 Y134.731 E-.0522
G1 X123.589 Y134.84 E-.05218
G1 X123.641 Y134.949 E-.04583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.307 Y135.2 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X128.802 Y135.584 E.02104
G1 X128.802 Y134.816 E.0255
G1 X129.259 Y135.164 E.01905
M204 S250
G1 X129.953 Y135.2 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X128.41 Y136.376 E.05962
G1 X128.41 Y135.59 E.02415
G1 X126.71 Y135.59 E.05224
G1 X126.71 Y134.81 E.02397
G1 X128.41 Y134.81 E.05224
G1 X128.41 Y134.024 E.02415
G1 X129.906 Y135.164 E.05778
; WIPE_START
M204 S6000
G1 X128.41 Y136.376 E-.73164
G1 X128.41 Y136.301 E-.02836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.606 Y135.2 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43086
G1 F15000
M204 S6000
G1 X126.906 Y135.2 E.05374
; WIPE_START
G1 X128.606 Y135.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.24 Y133.84 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X132.76 Y133.84 E.04671
G1 X132.76 Y136.56 E.08358
G1 X131.24 Y136.56 E.04671
G1 X131.24 Y133.9 E.08173
; WIPE_START
M204 S6000
G1 X132.76 Y133.84 E-.57805
G1 X132.76 Y134.319 E-.18195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.152 Y133.902 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X133.598 Y133.902 E.01479
G1 X133.598 Y136.498 E.08611
G1 X133.152 Y136.498 E.01479
G1 X133.152 Y133.962 E.08412
; WIPE_START
G1 X133.598 Y133.902 E-.17096
G1 X133.598 Y135.452 E-.58904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.81 Y133.51 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.99 Y133.51 E.09771
G1 X133.99 Y136.89 E.10386
G1 X130.81 Y136.89 E.09771
G1 X130.81 Y133.57 E.10201
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
M204 S6000
G1 X132.81 Y133.532 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/32
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.6 I-.152 J-1.207 P1  F42000
G1 X113.328 Y135.99 Z6.6
G1 Z6.4
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X127.583 Y111.295 I14.672 J-7.992 E1.04967
G1 X128.417 Y111.295 E.0256
G3 X113.357 Y136.042 I-.417 J16.702 E2.14851
; WIPE_START
M204 S6000
G1 X112.945 Y135.25 E-.33928
G1 X112.602 Y134.491 E-.31659
G1 X112.502 Y134.236 E-.10412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.755 Y133.024 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X111.745 Y133.014 E.00045
G3 X122.584 Y111.881 I16.245 J-5.014 E.80793
G3 X129.089 Y111.034 I5.399 J16.066 E.20283
G3 X112.016 Y133.818 I-1.098 J16.966 E2.24559
G1 X111.774 Y133.081 E.02382
; WIPE_START
M204 S6000
G1 X111.745 Y133.014 E-.02787
G1 X111.521 Y132.196 E-.3223
G1 X111.333 Y131.37 E-.32207
G1 X111.293 Y131.142 E-.08776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.892 Y131.854 Z6.8 F42000
G1 X122.29 Y132.173 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F3000
M204 S5000
G2 X122.29 Y138.227 I.714 J3.027 E.25597
G1 X122.29 Y138.718 E.01507
G3 X122.29 Y131.682 I.714 J-3.518 E.30234
G1 X122.29 Y132.113 E.01323
; WIPE_START
M204 S6000
G1 X122.013 Y132.251 E-.11773
G1 X121.724 Y132.364 E-.11795
G1 X121.315 Y132.586 E-.1767
G1 X120.944 Y132.867 E-.17682
G1 X120.722 Y133.083 E-.11796
G1 X120.632 Y133.19 E-.05284
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


G1 X122.094 Y131.975 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130562
G1 F15000
M204 S6000
G1 X121.603 Y132.156 E.00374
G1 X121.168 Y132.395 E.00355
G1 X120.913 Y132.58 E.00225
G1 X120.663 Y132.8 E.00237
G1 X120.33 Y133.177 E.00359
G1 X120.058 Y133.598 E.00358
G1 X119.849 Y134.062 E.00363
G1 X119.753 Y134.378 E.00236
G1 X119.688 Y134.699 E.00234
G1 X119.65 Y135.2 E.00359
G1 X119.687 Y135.699 E.00357
G1 X119.8 Y136.189 E.0036
G1 X119.983 Y136.656 E.00358
G1 X120.137 Y136.939 E.0023
G1 X120.322 Y137.212 E.00236
G1 X120.664 Y137.601 E.00369
G1 X120.9 Y137.81 E.00225
G1 X121.159 Y137.998 E.00229
G1 X121.605 Y138.245 E.00364
G1 X122.094 Y138.425 E.00372
; WIPE_START
G1 X121.605 Y138.245 E-.19814
G1 X121.159 Y137.998 E-.19377
G1 X120.9 Y137.81 E-.12162
G1 X120.664 Y137.601 E-.11991
G1 X120.444 Y137.351 E-.12655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.29 Y133.129 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.29 Y133.645 E.01584
G2 X122.29 Y136.755 I.713 J1.555 E.11997
G1 X122.29 Y137.271 E.01584
G3 X122.234 Y133.149 I.71 J-2.071 E.16506
M204 S10000
G1 X122.094 Y133.474 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130919
G1 F15000
M204 S6000
G1 X121.97 Y133.545 E.00102
G2 X122.094 Y136.926 I1.03 J1.656 E.02938
; WIPE_START
G1 X121.844 Y136.77 E-.1121
G1 X121.626 Y136.584 E-.10892
G1 X121.47 Y136.408 E-.08946
G1 X121.328 Y136.204 E-.09437
G1 X121.22 Y135.996 E-.08903
G1 X121.122 Y135.724 E-.10964
G1 X121.072 Y135.489 E-.09141
G1 X121.057 Y135.318 E-.06507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.309 Y135.166 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
M73 P98 R0
G3 X122.985 Y134.51 I.689 J.034 E.03182
G1 X123.022 Y134.511 E.00116
G3 X122.309 Y135.226 I-.025 J.689 E.09826
M204 S10000
G1 X122.776 Y135.624 F42000
; FEATURE: Top surface
G1 F1800
M204 S2000
G1 X123.424 Y134.976 E.02815
G1 X123.128 Y134.738
G1 X122.538 Y135.328 E.02564
M204 S10000
G1 X123.495 Y135.237 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.196988
G1 F15000
M204 S6000
G3 X123.029 Y135.697 I-1.249 J-.8 E.00828
M204 S10000
G1 X122.816 Y134.757 F42000
; LINE_WIDTH: 0.10553
G1 F15000
M204 S6000
G2 X122.555 Y135.02 I.521 J.78 E.0019
M204 S10000
G1 X122.644 Y135.489 F42000
; LINE_WIDTH: 0.106157
G1 F15000
M204 S6000
G3 X122.547 Y135.363 I.581 J-.547 E.00082
; WIPE_START
G1 X122.644 Y135.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.953 Y135.2 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X128.41 Y136.376 E.05962
G1 X128.41 Y135.59 E.02415
G1 X126.71 Y135.59 E.05224
G1 X126.71 Y134.81 E.02397
G1 X128.41 Y134.81 E.05224
G1 X128.41 Y134.024 E.02415
G1 X129.906 Y135.164 E.05778
M204 S10000
G1 X129.301 Y134.964 F42000
; FEATURE: Top surface
G1 F1800
M204 S2000
G1 X128.813 Y135.452 E.02121
M204 S10000
G1 X129.553 Y135.132 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.223632
G1 F15000
M204 S6000
G1 X129.27 Y135.379 E.00553
; LINE_WIDTH: 0.184763
G1 X128.988 Y135.626 E.00434
G1 X128.878 Y135.657 E.00131
; LINE_WIDTH: 0.239603
G1 X128.878 Y135.654 E.00005
; LINE_WIDTH: 0.224364
G1 X128.855 Y135.562 E.0014
; LINE_WIDTH: 0.197748
G1 X128.832 Y135.47 E.0012
M204 S10000
G1 X129.067 Y134.932 F42000
; LINE_WIDTH: 0.269974
G1 F15000
M204 S6000
G1 X128.599 Y134.513 E.01162
M204 S10000
G1 X128.606 Y135.2 F42000
; LINE_WIDTH: 0.43086
G1 F15000
M204 S6000
G1 X126.906 Y135.2 E.05374
; WIPE_START
G1 X128.606 Y135.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.24 Y133.84 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X132.76 Y133.84 E.04671
G1 X132.76 Y136.56 E.08358
G1 X131.24 Y136.56 E.04671
G1 X131.24 Y133.9 E.08173
M204 S250
G1 X130.81 Y133.51 F42000
G1 F3000
M204 S5000
G1 X133.99 Y133.51 E.09771
G1 X133.99 Y136.89 E.10386
G1 X130.81 Y136.89 E.09771
G1 X130.81 Y133.57 E.10201
; WIPE_START
M204 S6000
G1 X132.81 Y133.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.783 Y135.815 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Top surface
M204 S2000
G1 X132.967 Y136.631 E.03543
G1 X132.967 Y136.097
G1 X133.783 Y135.282 E.03543
G1 X133.783 Y134.749
G1 X132.967 Y135.564 E.03543
G1 X132.967 Y135.031
G1 X133.783 Y134.216 E.03543
G1 X133.748 Y133.717
G1 X132.967 Y134.498 E.0339
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F1800
M204 S6000
G1 X133.748 Y133.717 E-.41929
G1 X133.783 Y134.216 E-.18979
G1 X133.502 Y134.496 E-.15092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
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
G1 Z6.8 F900 ; lower z a little
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

    G1 Z106.4 F600
    G1 Z104.4

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

