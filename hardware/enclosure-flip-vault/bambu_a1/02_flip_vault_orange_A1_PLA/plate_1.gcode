; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 8m 14s; total estimated time: 14m 43s
; total layer number: 36
; total filament length [mm] : 603.53
; total filament volume [cm^3] : 1451.67
; total filament weight [g] : 1.80
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
M73 P0 R14
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
M73 P1 R14
G1 E5 F200
M104 S220
G92 E0
M73 P3 R14
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P5 R13
G1 X-48.2 F3000
M73 P7 R13
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
M73 P9 R13
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
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P10 R13
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

M73 P11 R13
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
M73 P40 R8
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
M73 P41 R8
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
M73 P42 R8
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
G3 X117.975 Y146.811 I.014 J-1.33 E.07669
G1 X117.975 Y129.389 E.64887
M73 P43 R8
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
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
M73 P44 R8
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
M73 P45 R8
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
G1 X121.987 Y141.853 Z.6 F42000
G1 X134.333 Y122 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G3 X134.115 Y122.082 I-.18 J-.146 E.00908
G1 X121.885 Y122.082 E.45551
G3 X121.618 Y121.815 I-.038 J-.229 E.01642
G1 X121.618 Y109.585 E.45551
G3 X121.885 Y109.318 I.229 J-.038 E.01642
G1 X122.285 Y109.318 E.01489
G1 X134.123 Y109.32 E.44095
G3 X134.359 Y109.44 I.028 J.236 E.01044
G1 X134.382 Y109.585 E.00547
G1 X134.382 Y121.815 E.45551
G3 X134.364 Y121.949 I-.229 J.038 E.00511
M204 S6000
G1 X134.705 Y122.271 F42000
G1 F1500
M204 S500
G3 X134.575 Y122.411 I-.596 J-.421 E.00716
G3 X134.151 Y122.539 I-.408 J-.589 E.01677
G1 X121.849 Y122.539 E.45819
G3 X121.289 Y122.275 I.001 J-.73 E.02383
G3 X121.161 Y121.851 I.589 J-.408 E.01677
G1 X121.161 Y109.549 E.45819
G3 X121.425 Y108.989 I.73 J.001 E.02383
G3 X121.849 Y108.861 I.408 J.589 E.01676
G1 X122.285 Y108.861 E.01623
G1 X134.159 Y108.863 E.44229
G3 X134.839 Y109.549 I.013 J.666 E.04023
G1 X134.839 Y121.851 E.45819
G3 X134.738 Y122.22 I-.73 J-.001 E.01443
M204 S6000
G1 X135.086 Y122.547 F42000
; FEATURE: Outer wall
M73 P45 R7
G1 F1500
M204 S500
G1 X134.847 Y122.786 E.01258
G1 X134.546 Y122.939 E.01258
G1 X134.187 Y122.996 E.01354
G1 X121.813 Y122.996 E.46087
G1 X121.454 Y122.939 E.01355
G1 X121.153 Y122.786 E.01258
G1 X120.914 Y122.547 E.01258
G1 X120.761 Y122.246 E.01258
G1 X120.704 Y121.887 E.01354
G1 X120.704 Y109.513 E.46087
G1 X120.761 Y109.154 E.01355
G1 X120.914 Y108.853 E.01258
G1 X121.153 Y108.614 E.01258
M73 P46 R7
G1 X121.454 Y108.461 E.01258
G3 X122.285 Y108.404 I.595 J2.592 E.03115
G1 X134.195 Y108.406 E.44362
G1 X134.546 Y108.461 E.01322
G1 X134.847 Y108.614 E.01258
G1 X135.086 Y108.853 E.01258
G1 X135.239 Y109.154 E.01258
G1 X135.296 Y109.513 E.01354
G1 X135.296 Y121.887 E.46087
G1 X135.239 Y122.246 E.01355
G1 X135.113 Y122.493 E.01034
; WIPE_START
G1 X134.847 Y122.786 E-.15016
G1 X134.546 Y122.939 E-.12832
G1 X134.187 Y122.996 E-.13818
G1 X133.283 Y122.996 E-.34335
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.256 Y115.363 Z.6 F42000
G1 X133.235 Y109.502 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50488
G1 F2400
M204 S500
G1 X133.993 Y110.261 E.04037
G1 X133.993 Y110.914 E.02459
G1 X132.787 Y109.708 E.0642
G1 X132.134 Y109.708 E.0246
G1 X133.993 Y111.567 E.09899
G1 X133.993 Y112.221 E.02459
G1 X131.48 Y109.708 E.13377
G1 X130.827 Y109.708 E.0246
G1 X133.993 Y112.874 E.16855
G1 X133.993 Y113.527 E.02459
G1 X130.174 Y109.708 E.20334
G1 X129.52 Y109.708 E.0246
G1 X133.993 Y114.181 E.23812
G1 X133.993 Y114.834 E.02459
G1 X128.867 Y109.708 E.2729
G1 X128.214 Y109.708 E.0246
G1 X133.993 Y115.487 E.30769
G1 X133.993 Y116.141 E.02459
G1 X127.56 Y109.707 E.34247
G1 X126.907 Y109.707 E.0246
G1 X133.993 Y116.794 E.37726
G1 X133.993 Y117.447 E.02459
G1 X126.253 Y109.707 E.41204
G1 X125.6 Y109.707 E.0246
G1 X133.993 Y118.1 E.44682
G1 X133.993 Y118.754 E.02459
G1 X124.947 Y109.707 E.48161
G1 X124.293 Y109.707 E.0246
G1 X133.993 Y119.407 E.51639
G1 X133.993 Y120.06 E.02459
G1 X123.64 Y109.707 E.55117
G1 X122.986 Y109.707 E.0246
G1 X133.993 Y120.714 E.58596
G1 X133.993 Y121.367 E.02459
G1 X122.333 Y109.707 E.62074
G1 X122.007 Y109.707 E.01228
G1 X122.007 Y110.034 E.01231
G1 X133.666 Y121.693 E.6207
G1 X133.013 Y121.693 E.02459
G1 X122.007 Y110.687 E.58592
G1 X122.007 Y111.341 E.02459
G1 X132.359 Y121.693 E.55114
G1 X131.706 Y121.693 E.02459
G1 X122.007 Y111.994 E.51636
G1 X122.007 Y112.647 E.02459
G1 X131.053 Y121.693 E.48158
G1 X130.4 Y121.693 E.02459
G1 X122.007 Y113.3 E.4468
G1 X122.007 Y113.954 E.02459
G1 X129.746 Y121.693 E.41202
G1 X129.093 Y121.693 E.02459
G1 X122.007 Y114.607 E.37724
G1 X122.007 Y115.26 E.02459
G1 X128.44 Y121.693 E.34246
G1 X127.786 Y121.693 E.02459
G1 X122.007 Y115.914 E.30768
M73 P47 R7
G1 X122.007 Y116.567 E.02459
G1 X127.133 Y121.693 E.2729
G1 X126.48 Y121.693 E.02459
G1 X122.007 Y117.22 E.23812
G1 X122.007 Y117.874 E.02459
G1 X125.826 Y121.693 E.20334
G1 X125.173 Y121.693 E.02459
G1 X122.007 Y118.527 E.16856
G1 X122.007 Y119.18 E.02459
G1 X124.52 Y121.693 E.13378
G1 X123.866 Y121.693 E.02459
G1 X122.007 Y119.834 E.099
G1 X122.007 Y120.487 E.02459
G1 X123.213 Y121.693 E.06422
G1 X122.56 Y121.693 E.02459
G1 X121.801 Y120.935 E.04039
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X122.56 Y121.693 E-.40772
G1 X123.213 Y121.693 E-.24826
G1 X123.02 Y121.5 E-.10402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 2/36
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.079 J.563 P1  F42000
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
M73 P48 R7
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
G1 X137.317 Y139.844 Z.8 F42000
G1 X134.559 Y122.171 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.158 Y122.353 I-.37 J-.282 E.01523
G1 X121.842 Y122.353 E.40855
G3 X121.347 Y121.858 I-.031 J-.464 E.02631
G1 X121.347 Y109.542 E.40854
G3 X121.842 Y109.047 I.464 J-.031 E.02631
G1 X134.158 Y109.047 E.40855
G1 X134.362 Y109.079 E.00686
G3 X134.653 Y109.542 I-.173 J.432 E.01939
G1 X134.653 Y121.858 E.40855
G3 X134.593 Y122.121 I-.464 J.031 E.00908
M204 S10000
G1 X134.89 Y122.411 F42000
G1 F6000
M204 S6000
G3 X134.489 Y122.713 I-.726 J-.547 E.01685
G1 X134.19 Y122.76 E.01006
G1 X121.81 Y122.76 E.41067
G1 X121.51 Y122.713 E.01006
G3 X120.987 Y122.189 I.325 J-.849 E.0253
G1 X120.94 Y121.89 E.01006
G1 X120.94 Y109.51 E.41067
G1 X120.987 Y109.211 E.01006
G3 X121.511 Y108.687 I.849 J.325 E.0253
G1 X121.81 Y108.64 E.01006
G1 X134.19 Y108.64 E.41067
G1 X134.489 Y108.687 E.01006
G3 X135.013 Y109.211 I-.325 J.849 E.0253
G1 X135.06 Y109.51 E.01006
G1 X135.06 Y121.89 E.41067
G1 X135.013 Y122.19 E.01006
G3 X134.925 Y122.362 I-.849 J-.325 E.00646
M204 S250
G1 X135.218 Y122.651 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X134.95 Y122.918 E.01164
G1 X134.612 Y123.091 E.01165
G1 X134.221 Y123.153 E.01217
G1 X121.779 Y123.153 E.3823
G1 X121.388 Y123.091 E.01217
G1 X121.05 Y122.918 E.01165
G1 X120.782 Y122.65 E.01166
G1 X120.609 Y122.312 E.01165
G1 X120.547 Y121.921 E.01217
G1 X120.547 Y109.479 E.3823
G1 X120.609 Y109.088 E.01217
G1 X120.782 Y108.75 E.01165
G1 X121.05 Y108.482 E.01166
G1 X121.388 Y108.309 E.01165
G1 X121.779 Y108.248 E.01217
G1 X134.221 Y108.248 E.3823
G1 X134.23 Y108.249 E.00029
G1 X134.612 Y108.309 E.01188
G1 X134.95 Y108.482 E.01165
G1 X135.218 Y108.75 E.01166
G1 X135.391 Y109.088 E.01165
G1 X135.453 Y109.479 E.01217
G1 X135.453 Y121.921 E.3823
G1 X135.391 Y122.312 E.01217
G1 X135.245 Y122.597 E.00983
; WIPE_START
M204 S6000
G1 X134.95 Y122.918 E-.16576
G1 X134.612 Y123.091 E-.14413
G1 X134.221 Y123.153 E-.15052
G1 X133.433 Y123.153 E-.29959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.076 Y122.19 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42103
G1 F9521.039
M204 S6000
G1 X134.292 Y121.975 E.00938
G2 X134.32 Y121.832 I-.205 J-.115 E.00456
G1 X134.32 Y121.411 E.01295
G1 X133.711 Y122.02 E.02653
G1 X133.177 Y122.02 E.01648
G1 X134.32 Y120.877 E.04983
G1 X134.32 Y120.342 E.01648
G1 X132.642 Y122.02 E.07313
G1 X132.107 Y122.02 E.01648
G1 X134.32 Y119.807 E.09643
G1 X134.32 Y119.272 E.01648
G1 X131.572 Y122.02 E.11973
G1 X131.038 Y122.02 E.01648
G1 X134.32 Y118.738 E.14303
G1 X134.32 Y118.203 E.01648
G1 X130.503 Y122.02 E.16633
G1 X129.968 Y122.02 E.01648
G1 X134.32 Y117.668 E.18963
G1 X134.32 Y117.134 E.01648
G1 X129.434 Y122.02 E.21293
G1 X128.899 Y122.02 E.01648
G1 X134.32 Y116.599 E.23623
G1 X134.32 Y116.064 E.01648
G1 X128.364 Y122.02 E.25953
G1 X127.829 Y122.02 E.01648
G1 X134.32 Y115.529 E.28283
G1 X134.32 Y114.995 E.01648
G1 X127.295 Y122.02 E.30613
G1 X126.76 Y122.02 E.01648
G1 X134.32 Y114.46 E.32943
G1 X134.32 Y113.925 E.01648
G1 X126.225 Y122.02 E.35273
G1 X125.69 Y122.02 E.01648
G1 X134.32 Y113.39 E.37603
G1 X134.32 Y112.856 E.01648
G1 X125.156 Y122.02 E.39933
G1 X124.621 Y122.02 E.01648
G1 X134.32 Y112.321 E.42263
G1 X134.32 Y111.786 E.01648
G1 X124.086 Y122.02 E.44593
G1 X123.551 Y122.02 E.01648
G1 X134.32 Y111.252 E.46923
G1 X134.32 Y110.717 E.01648
G1 X123.017 Y122.02 E.49253
G1 X122.482 Y122.02 E.01648
G1 X134.32 Y110.182 E.51583
G1 X134.32 Y109.647 E.01648
G1 X121.947 Y122.02 E.53913
G3 X121.709 Y121.976 I-.025 J-.533 E.00753
M73 P49 R7
G3 X121.68 Y121.753 I.665 J-.201 E.00697
G1 X134.053 Y109.38 E.53913
G1 X133.518 Y109.38 E.01648
G1 X121.68 Y121.218 E.51583
G1 X121.68 Y120.683 E.01648
G1 X132.983 Y109.38 E.49253
G1 X132.449 Y109.38 E.01648
G1 X121.68 Y120.149 E.46923
G1 X121.68 Y119.614 E.01648
G1 X131.914 Y109.38 E.44593
G1 X131.379 Y109.38 E.01648
G1 X121.68 Y119.079 E.42263
G1 X121.68 Y118.544 E.01648
G1 X130.844 Y109.38 E.39933
G1 X130.31 Y109.38 E.01648
G1 X121.68 Y118.01 E.37603
G1 X121.68 Y117.475 E.01648
G1 X129.775 Y109.38 E.35273
G1 X129.24 Y109.38 E.01648
G1 X121.68 Y116.94 E.32943
G1 X121.68 Y116.406 E.01648
G1 X128.706 Y109.38 E.30613
G1 X128.171 Y109.38 E.01648
G1 X121.68 Y115.871 E.28283
G1 X121.68 Y115.336 E.01648
G1 X127.636 Y109.38 E.25953
G1 X127.101 Y109.38 E.01648
G1 X121.68 Y114.801 E.23623
G1 X121.68 Y114.267 E.01648
G1 X126.567 Y109.38 E.21293
G1 X126.032 Y109.38 E.01648
G1 X121.68 Y113.732 E.18963
G1 X121.68 Y113.197 E.01648
G1 X125.497 Y109.38 E.16633
G1 X124.962 Y109.38 E.01648
G1 X121.68 Y112.662 E.14303
G1 X121.68 Y112.128 E.01648
G1 X124.428 Y109.38 E.11973
G1 X123.893 Y109.38 E.01648
G1 X121.68 Y111.593 E.09643
G1 X121.68 Y111.058 E.01648
G1 X123.358 Y109.38 E.07313
G1 X122.824 Y109.38 E.01648
G1 X121.68 Y110.524 E.04983
G1 X121.68 Y109.989 E.01648
G1 X122.289 Y109.38 E.02653
G1 X121.868 Y109.38 E.01296
G2 X121.726 Y109.408 I-.028 J.233 E.00455
G1 X121.51 Y109.624 E.00939
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9521.039
G1 X121.726 Y109.408 E-.11582
G1 X121.868 Y109.38 E-.05517
G1 X122.289 Y109.38 E-.15986
G1 X121.68 Y109.989 E-.32722
G1 X121.68 Y110.257 E-.10194
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 3/36
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S198.9
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-1.128 J.457 P1  F42000
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
M73 P50 R7
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
G1 X137.327 Y139.839 Z1 F42000
G1 X134.598 Y122.206 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.183 Y122.395 I-.384 J-.292 E.01575
G1 X121.817 Y122.395 E.4102
G3 X121.305 Y121.883 I-.031 J-.481 E.02718
G1 X121.305 Y109.517 E.4102
G3 X121.817 Y109.005 I.481 J-.031 E.02718
G1 X134.183 Y109.005 E.4102
G1 X134.392 Y109.038 E.00703
G3 X134.695 Y109.517 I-.178 J.448 E.02009
G1 X134.695 Y121.883 E.4102
G3 X134.631 Y122.156 I-.481 J.031 E.00943
M204 S10000
G1 X134.928 Y122.446 F42000
G1 F6000
M204 S6000
G3 X134.52 Y122.754 I-.74 J-.558 E.0172
G1 X134.215 Y122.802 E.01023
G1 X121.785 Y122.802 E.41233
G1 X121.48 Y122.754 E.01023
G3 X120.946 Y122.22 I.332 J-.866 E.02581
G1 X120.898 Y121.915 E.01023
G1 X120.898 Y109.485 E.41233
G1 X120.946 Y109.18 E.01023
G3 X121.48 Y108.646 I.866 J.332 E.02581
G1 X121.785 Y108.598 E.01023
G1 X134.215 Y108.598 E.41233
G1 X134.52 Y108.646 E.01023
G3 X135.054 Y109.18 I-.332 J.866 E.02581
G1 X135.102 Y109.485 E.01023
G1 X135.102 Y121.915 E.41233
G1 X135.054 Y122.22 E.01023
G3 X134.963 Y122.397 I-.866 J-.332 E.00663
M204 S250
G1 X135.257 Y122.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X134.985 Y122.957 E.01182
G1 X134.642 Y123.131 E.01182
G1 X134.246 Y123.194 E.01233
G1 X121.754 Y123.194 E.38384
G1 X121.358 Y123.131 E.01233
G1 X121.015 Y122.957 E.01181
G1 X120.743 Y122.685 E.01182
G1 X120.569 Y122.342 E.01182
G1 X120.506 Y121.946 E.01233
G1 X120.506 Y109.454 E.38384
G1 X120.569 Y109.058 E.01233
G1 X120.743 Y108.715 E.01181
G1 X121.015 Y108.443 E.01182
G1 X121.358 Y108.269 E.01182
G1 X121.754 Y108.206 E.01233
G1 X134.246 Y108.206 E.38384
G1 X134.273 Y108.21 E.00083
G1 X134.642 Y108.269 E.0115
G1 X134.985 Y108.443 E.01181
G1 X135.257 Y108.715 E.01182
G1 X135.431 Y109.058 E.01182
G1 X135.494 Y109.454 E.01233
G1 X135.494 Y121.946 E.38384
G1 X135.431 Y122.342 E.01233
G1 X135.284 Y122.631 E.00997
; WIPE_START
M204 S6000
G1 X134.985 Y122.957 E-.16796
G1 X134.642 Y123.131 E-.14612
G1 X134.246 Y123.194 E-.1525
G1 X133.474 Y123.194 E-.29342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.066 Y115.585 Z1 F42000
G1 X134.531 Y109.594 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42319
G1 F9466.957
M204 S6000
G1 X134.306 Y109.368 E.00987
G2 X134.157 Y109.338 I-.121 J.215 E.0048
G1 X133.738 Y109.338 E.01297
G1 X134.362 Y109.962 E.02732
G1 X134.362 Y110.499 E.01666
G1 X133.201 Y109.338 E.05089
G1 X132.663 Y109.338 E.01666
G1 X134.362 Y111.037 E.07445
G1 X134.362 Y111.575 E.01666
G1 X132.125 Y109.338 E.09802
G1 X131.587 Y109.338 E.01666
G1 X134.362 Y112.113 E.12159
G1 X134.362 Y112.651 E.01666
G1 X131.049 Y109.338 E.14515
G1 X130.512 Y109.338 E.01666
G1 X134.362 Y113.188 E.16872
G1 X134.362 Y113.726 E.01666
G1 X129.974 Y109.338 E.19229
G1 X129.436 Y109.338 E.01666
G1 X134.362 Y114.264 E.21585
G1 X134.362 Y114.802 E.01666
G1 X128.898 Y109.338 E.23942
G1 X128.361 Y109.338 E.01666
G1 X134.362 Y115.339 E.26299
G1 X134.362 Y115.877 E.01666
G1 X127.823 Y109.338 E.28656
G1 X127.285 Y109.338 E.01666
G1 X134.362 Y116.415 E.31012
G1 X134.362 Y116.953 E.01666
G1 X126.747 Y109.338 E.33369
G1 X126.209 Y109.338 E.01666
G1 X134.362 Y117.491 E.35726
G1 X134.362 Y118.028 E.01666
G1 X125.672 Y109.338 E.38082
G1 X125.134 Y109.338 E.01666
G1 X134.362 Y118.566 E.40439
G1 X134.362 Y119.104 E.01666
G1 X124.596 Y109.338 E.42796
G1 X124.058 Y109.338 E.01666
G1 X134.362 Y119.642 E.45152
G1 X134.362 Y120.18 E.01666
G1 X123.521 Y109.338 E.47509
G1 X122.983 Y109.338 E.01666
G1 X134.362 Y120.717 E.49866
G1 X134.362 Y121.255 E.01666
G1 X122.445 Y109.338 E.52223
G1 X121.907 Y109.338 E.01666
G1 X134.362 Y121.793 E.54579
G3 X134.311 Y122.029 I-.525 J.011 E.00756
G3 X134.093 Y122.062 I-.207 J-.642 E.00686
G1 X121.638 Y109.607 E.5458
G1 X121.638 Y110.145 E.01666
G1 X133.555 Y122.062 E.52223
G1 X133.017 Y122.062 E.01666
G1 X121.638 Y110.683 E.49866
G1 X121.638 Y111.22 E.01666
G1 X132.48 Y122.062 E.4751
G1 X131.942 Y122.062 E.01666
G1 X121.638 Y111.758 E.45153
G1 X121.638 Y112.296 E.01666
G1 X131.404 Y122.062 E.42796
G1 X130.866 Y122.062 E.01666
G1 X121.638 Y112.834 E.40439
G1 X121.638 Y113.372 E.01666
G1 X130.328 Y122.062 E.38083
G1 X129.791 Y122.062 E.01666
G1 X121.638 Y113.909 E.35726
G1 X121.638 Y114.447 E.01666
G1 X129.253 Y122.062 E.33369
G1 X128.715 Y122.062 E.01666
M73 P51 R7
G1 X121.638 Y114.985 E.31013
G1 X121.638 Y115.523 E.01666
G1 X128.177 Y122.062 E.28656
G1 X127.64 Y122.062 E.01666
G1 X121.638 Y116.06 E.26299
G1 X121.638 Y116.598 E.01666
G1 X127.102 Y122.062 E.23943
G1 X126.564 Y122.062 E.01666
G1 X121.638 Y117.136 E.21586
G1 X121.638 Y117.674 E.01666
G1 X126.026 Y122.062 E.19229
G1 X125.488 Y122.062 E.01666
G1 X121.638 Y118.212 E.16872
G1 X121.638 Y118.749 E.01666
G1 X124.951 Y122.062 E.14516
G1 X124.413 Y122.062 E.01666
G1 X121.638 Y119.287 E.12159
G1 X121.638 Y119.825 E.01666
G1 X123.875 Y122.062 E.09802
G1 X123.337 Y122.062 E.01666
G1 X121.638 Y120.363 E.07446
G1 X121.638 Y120.901 E.01666
G1 X122.799 Y122.062 E.05089
G1 X122.262 Y122.062 E.01666
G1 X121.638 Y121.438 E.02732
G1 X121.638 Y121.857 E.01297
G2 X121.668 Y122.006 I.245 J.028 E.0048
G1 X121.894 Y122.231 E.00988
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9466.957
G1 X121.668 Y122.006 E-.12113
G1 X121.638 Y121.857 E-.05785
G1 X121.638 Y121.438 E-.15903
G1 X122.262 Y122.062 E-.33507
G1 X122.49 Y122.062 E-.08692
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
G3 Z1 I-1.065 J.589 P1  F42000
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
M73 P52 R7
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
G1 X137.337 Y139.837 Z1.2 F42000
G1 X134.636 Y122.241 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.208 Y122.437 I-.397 J-.302 E.01627
G1 X121.792 Y122.437 E.41186
G3 X121.263 Y121.908 I-.031 J-.498 E.02804
G1 X121.263 Y109.492 E.41186
G3 X121.792 Y108.963 I.498 J-.031 E.02804
G1 X134.208 Y108.963 E.41186
G1 X134.422 Y108.997 E.0072
G3 X134.737 Y109.492 I-.183 J.464 E.02078
G1 X134.737 Y121.908 E.41186
G3 X134.67 Y122.191 I-.498 J.031 E.00978
M204 S10000
G1 X134.967 Y122.481 F42000
G1 F6000
M204 S6000
G3 X134.55 Y122.795 I-.755 J-.569 E.01754
G1 X134.24 Y122.844 E.0104
G1 X121.76 Y122.844 E.41399
G1 X121.45 Y122.795 E.0104
G3 X120.905 Y122.25 I.338 J-.883 E.02633
G1 X120.856 Y121.94 E.0104
G1 X120.856 Y109.46 E.41399
G1 X120.905 Y109.15 E.0104
G3 X121.45 Y108.605 I.883 J.338 E.02633
G1 X121.76 Y108.556 E.0104
G1 X134.253 Y108.558 E.41443
G1 X134.55 Y108.605 E.00996
G3 X135.095 Y109.15 I-.338 J.883 E.02633
G1 X135.144 Y109.46 E.0104
G1 X135.144 Y121.94 E.41399
G1 X135.095 Y122.25 E.0104
G3 X135.001 Y122.432 I-.883 J-.338 E.0068
M204 S250
G1 X135.294 Y122.721 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.02 Y122.995 E.01194
G1 X134.672 Y123.172 E.01198
G1 X134.271 Y123.236 E.01249
G1 X121.729 Y123.236 E.38538
G1 X121.328 Y123.172 E.01249
G1 X120.98 Y122.995 E.01198
G1 X120.705 Y122.72 E.01198
G1 X120.528 Y122.372 E.01198
G1 X120.464 Y121.971 E.01249
G1 X120.464 Y109.429 E.38538
G1 X120.528 Y109.028 E.01249
G1 X120.705 Y108.68 E.01198
G1 X120.98 Y108.405 E.01198
G1 X121.328 Y108.228 E.01198
G1 X121.729 Y108.164 E.01249
G1 X134.271 Y108.164 E.38538
G1 X134.315 Y108.171 E.00136
G1 X134.672 Y108.228 E.01113
G1 X135.02 Y108.405 E.01198
G1 X135.295 Y108.68 E.01198
G1 X135.472 Y109.028 E.01198
G1 X135.536 Y109.429 E.01249
G1 X135.536 Y121.971 E.38538
G1 X135.472 Y122.372 E.01249
G1 X135.322 Y122.667 E.01017
; WIPE_START
M204 S6000
G1 X135.02 Y122.995 E-.16947
G1 X134.672 Y123.172 E-.1481
G1 X134.271 Y123.236 E-.15449
G1 X133.513 Y123.236 E-.28795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.875 Y121.712 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X132.26 Y121.753 E.05359
G3 X131.604 Y121.364 I.609 J-1.777 E.0255
G2 X130.216 Y121.753 I-.12 J2.237 E.04866
G1 X127.019 Y121.753 E.10606
G3 X126.362 Y121.364 I.609 J-1.777 E.0255
G2 X124.975 Y121.753 I-.12 J2.237 E.04866
G1 X121.947 Y121.753 E.10044
G1 X121.947 Y120.534 E.04045
G1 X122.104 Y120.546 E.00521
G2 X123.414 Y119.904 I-.217 J-2.1 E.04942
G1 X124.069 Y118.982 E.03752
G3 X124.724 Y118.716 I.546 J.402 E.02469
G3 X126.035 Y119.358 I-.217 J2.1 E.04942
G1 X126.69 Y120.28 E.03752
G2 X127.345 Y120.546 I.545 J-.402 E.02469
G2 X128.655 Y119.904 I-.217 J-2.1 E.04942
G1 X129.31 Y118.982 E.03752
G3 X129.966 Y118.716 I.546 J.402 E.02469
G3 X131.276 Y119.358 I-.217 J2.1 E.04942
G1 X131.931 Y120.28 E.03752
G2 X132.586 Y120.546 I.545 J-.402 E.02469
G2 X134.053 Y119.685 I-.423 J-2.399 E.05764
G1 X134.053 Y117.913 E.05877
G1 X133.897 Y117.926 E.0052
G3 X132.586 Y117.284 I.217 J-2.1 E.04942
G1 X131.931 Y116.362 E.03752
G2 X131.276 Y116.095 I-.545 J.402 E.02469
G2 X129.966 Y116.737 I.217 J2.1 E.04942
G1 X129.31 Y117.659 E.03752
G3 X128.655 Y117.926 I-.545 J-.402 E.02469
G3 X127.345 Y117.284 I.217 J-2.1 E.04942
G1 X126.69 Y116.362 E.03752
G2 X126.035 Y116.095 I-.545 J.402 E.02469
M73 P52 R6
G2 X124.724 Y116.737 I.217 J2.1 E.04942
G1 X124.069 Y117.659 E.03752
G3 X123.414 Y117.926 I-.545 J-.402 E.02469
G3 X121.947 Y117.064 I.423 J-2.398 E.05766
G1 X121.947 Y115.292 E.05876
G1 X122.104 Y115.305 E.00521
G2 X123.414 Y114.663 I-.217 J-2.1 E.04942
G1 X124.069 Y113.741 E.03752
G3 X124.724 Y113.474 I.545 J.402 E.02469
G3 X126.035 Y114.117 I-.217 J2.1 E.04942
G1 X126.69 Y115.038 E.03752
G2 X127.345 Y115.305 I.546 J-.402 E.02469
G2 X128.655 Y114.663 I-.217 J-2.1 E.04942
G1 X129.31 Y113.741 E.03752
G3 X129.966 Y113.474 I.545 J.402 E.02469
G3 X131.276 Y114.117 I-.217 J2.1 E.04942
G1 X131.931 Y115.038 E.03752
G2 X132.586 Y115.305 I.546 J-.402 E.02469
G2 X134.053 Y114.443 I-.423 J-2.398 E.05764
G1 X134.053 Y112.672 E.05877
G1 X133.897 Y112.684 E.0052
G3 X132.586 Y112.042 I.217 J-2.1 E.04942
G1 X131.931 Y111.121 E.03752
G2 X131.276 Y110.854 I-.545 J.402 E.02469
G2 X129.966 Y111.496 I.217 J2.1 E.04942
G1 X129.31 Y112.418 E.03752
G3 X128.655 Y112.684 I-.545 J-.402 E.02469
G3 X127.345 Y112.042 I.217 J-2.1 E.04942
G1 X126.69 Y111.121 E.03752
G2 X126.035 Y110.854 I-.545 J.402 E.02469
G2 X124.724 Y111.496 I.217 J2.1 E.04942
G1 X124.069 Y112.418 E.03752
G3 X123.414 Y112.684 I-.545 J-.402 E.02469
G3 X121.947 Y111.822 I.423 J-2.398 E.05766
G1 X121.947 Y110.371 E.04815
G1 X121.989 Y110.054 E.01059
G1 X122.104 Y110.064 E.00383
G2 X123.096 Y109.647 I-.069 J-1.556 E.03646
G1 X126.583 Y109.647 E.11567
G2 X127.345 Y110.064 I.768 J-.499 E.03001
G2 X128.338 Y109.647 I-.069 J-1.556 E.03646
G1 X131.825 Y109.647 E.11567
G2 X132.586 Y110.064 I.768 J-.499 E.03001
G2 X133.579 Y109.647 I-.069 J-1.556 E.03646
G1 X134.053 Y109.647 E.01572
G1 X134.053 Y110.802 E.03829
M204 S10000
G1 X122.692 Y109.326 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X122.9 Y109.305 E.00581
G1 X134.175 Y109.305 E.31236
G1 X134.363 Y109.366 E.00548
G1 X134.395 Y109.519 E.00432
G1 X134.395 Y121.15 E.32225
G1 X134.381 Y121.275 E.00348
M204 S10000
G1 X121.626 Y110.081 F42000
G1 F10588.235
M204 S6000
G1 X121.605 Y110.266 E.00514
G1 X121.605 Y121.881 E.32181
G1 X121.656 Y122.057 E.00507
G1 X121.825 Y122.095 E.0048
G1 X133.122 Y122.095 E.31298
G1 X133.271 Y122.08 E.00414
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X133.122 Y122.095 E-.05685
G1 X131.272 Y122.095 E-.70316
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
G3 Z1.2 I-1.188 J.265 P1  F42000
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
M73 P53 R6
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
G1 X137.346 Y139.836 Z1.4 F42000
G1 X134.674 Y122.275 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.579 Y122.379 I-.459 J-.327 E.00469
G3 X134.233 Y122.478 I-.326 J-.483 E.01213
G1 X121.767 Y122.478 E.41352
G3 X121.321 Y122.279 I-.016 J-.563 E.01677
G3 X121.222 Y121.933 I.483 J-.326 E.01213
G1 X121.222 Y109.467 E.41352
G3 X121.421 Y109.021 I.563 J-.016 E.01677
G3 X121.767 Y108.922 I.326 J.483 E.01213
G1 X134.233 Y108.922 E.41352
G1 X134.453 Y108.956 E.00738
G3 X134.744 Y109.247 I-.181 J.472 E.01406
G1 X134.778 Y109.467 E.00737
G1 X134.778 Y121.933 E.41352
G3 X134.706 Y122.225 I-.563 J.016 E.01009
M204 S10000
G1 X135.005 Y122.516 F42000
G1 F6000
M204 S6000
G3 X134.58 Y122.836 I-.77 J-.58 E.01789
G1 X134.265 Y122.885 E.01057
G1 X121.735 Y122.885 E.41565
G1 X121.42 Y122.836 E.01057
G3 X120.864 Y122.28 I.345 J-.9 E.02685
G1 X120.815 Y121.965 E.01057
G1 X120.815 Y109.435 E.41565
G1 X120.864 Y109.12 E.01057
G3 X121.42 Y108.564 I.9 J.345 E.02685
G1 X121.735 Y108.515 E.01057
G1 X134.296 Y108.519 E.41666
G3 X135.136 Y109.12 I.007 J.878 E.03662
G1 X135.185 Y109.435 E.01058
G1 X135.185 Y121.965 E.41565
G1 X135.136 Y122.28 E.01057
G3 X135.04 Y122.467 I-.9 J-.345 E.00698
M204 S250
G1 X135.335 Y122.753 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.334 Y122.755 E.00007
G1 X135.055 Y123.034 E.01214
G1 X134.703 Y123.213 E.01214
G1 X134.296 Y123.278 E.01265
G1 X121.704 Y123.278 E.38691
G1 X121.297 Y123.213 E.01265
G1 X120.945 Y123.034 E.01214
G1 X120.666 Y122.755 E.01214
G1 X120.487 Y122.403 E.01214
G1 X120.422 Y121.996 E.01265
G1 X120.422 Y109.404 E.38691
G1 X120.487 Y108.997 E.01265
G1 X120.666 Y108.646 E.01214
G1 X120.945 Y108.366 E.01214
G1 X121.297 Y108.187 E.01214
G1 X121.704 Y108.123 E.01265
G1 X134.296 Y108.123 E.38691
G1 X134.357 Y108.132 E.0019
G1 X134.703 Y108.187 E.01076
G1 X135.055 Y108.366 E.01214
G1 X135.334 Y108.646 E.01214
G1 X135.513 Y108.997 E.01214
G1 X135.578 Y109.404 E.01265
G1 X135.578 Y121.996 E.38691
G1 X135.513 Y122.403 E.01265
G1 X135.362 Y122.699 E.01022
; WIPE_START
M204 S6000
G1 X135.334 Y122.755 E-.02365
G1 X135.055 Y123.034 E-.15009
G1 X134.703 Y123.213 E-.15009
G1 X134.296 Y123.278 E-.15646
G1 X133.56 Y123.278 E-.27971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.88 Y122.311 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40608
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X134.409 Y121.225 E.09894
G1 X134.409 Y120.666 E.02952
G1 X132.378 Y122.109 E.13146
G1 X131.591 Y122.109 E.04155
G1 X134.409 Y120.106 E.18243
G1 X134.409 Y119.546 E.02952
G1 X130.803 Y122.109 E.2334
G1 X130.016 Y122.109 E.04155
G1 X134.409 Y118.987 E.28437
G1 X134.409 Y118.427 E.02952
G1 X129.229 Y122.109 E.33533
G1 X128.441 Y122.109 E.04155
G1 X134.409 Y117.868 E.3863
G1 X134.409 Y117.308 E.02952
G1 X127.654 Y122.109 E.43727
G1 X126.867 Y122.109 E.04155
G1 X134.409 Y116.749 E.48824
G1 X134.409 Y116.189 E.02952
G1 X126.079 Y122.109 E.53921
G1 X125.292 Y122.109 E.04155
G1 X134.409 Y115.63 E.59017
G1 X134.409 Y115.07 E.02952
G1 X124.505 Y122.109 E.64114
G1 X123.717 Y122.109 E.04155
G1 X134.409 Y114.511 E.69211
G1 X134.409 Y113.951 E.02952
G1 X122.93 Y122.109 E.74308
G1 X122.143 Y122.109 E.04155
G1 X134.409 Y113.392 E.79405
G1 X134.409 Y112.832 E.02952
G1 X121.597 Y121.937 E.8294
G1 X121.591 Y121.381 E.02933
G1 X134.409 Y112.273 E.82974
G1 X134.409 Y111.713 E.02952
G1 X121.591 Y120.822 E.82974
G1 X121.591 Y120.262 E.02952
M73 P54 R6
G1 X134.409 Y111.154 E.82974
G1 X134.409 Y110.594 E.02952
G1 X121.591 Y119.703 E.82974
G1 X121.591 Y119.143 E.02952
G1 X134.409 Y110.035 E.82974
G1 X134.406 Y109.477 E.02941
G1 X121.591 Y118.584 E.82955
G1 X121.591 Y118.024 E.02952
G1 X133.88 Y109.291 E.79551
G1 X133.093 Y109.291 E.04155
G1 X121.591 Y117.465 E.74455
G1 X121.591 Y116.905 E.02952
G1 X132.305 Y109.291 E.69358
G1 X131.518 Y109.291 E.04155
G1 X121.591 Y116.346 E.64261
G1 X121.591 Y115.786 E.02952
G1 X130.731 Y109.291 E.59164
G1 X129.943 Y109.291 E.04155
G1 X121.591 Y115.227 E.54067
G1 X121.591 Y114.667 E.02952
G1 X129.156 Y109.291 E.48971
G1 X128.369 Y109.291 E.04155
G1 X121.591 Y114.108 E.43874
G1 X121.591 Y113.548 E.02952
G1 X127.581 Y109.291 E.38777
G1 X126.794 Y109.291 E.04155
G1 X121.591 Y112.989 E.3368
G1 X121.591 Y112.429 E.02952
G1 X126.007 Y109.291 E.28583
G1 X125.219 Y109.291 E.04155
G1 X121.591 Y111.87 E.23486
G1 X121.591 Y111.31 E.02952
G1 X124.432 Y109.291 E.18389
G1 X123.645 Y109.291 E.04155
G1 X121.591 Y110.751 E.13293
G1 X121.591 Y110.191 E.02952
G1 X123.142 Y109.089 E.1004
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X121.591 Y110.191 E-.72304
G1 X121.591 Y110.288 E-.03696
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
G3 Z1.4 I-1.128 J.458 P1  F42000
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
M73 P55 R6
G3 X116.91 Y147.994 I.693 J-.995 E.03535
G1 X116.91 Y128.206 E.60801
G3 X118.106 Y127.01 I1.212 J.016 E.05754
G1 X137.987 Y127.016 E.61089
G3 X139.09 Y128.206 I-.108 J1.206 E.05465
G1 X139.09 Y147.994 E.60801
G3 X138.924 Y148.601 I-1.37 J-.048 E.01952
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


; object ids of this layer6 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
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
G1 X137.356 Y139.835 Z1.6 F42000
G1 X134.713 Y122.31 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.614 Y122.418 I-.474 J-.337 E.00486
G3 X134.258 Y122.52 I-.335 J-.496 E.01248
G1 X121.742 Y122.52 E.41518
G3 X121.282 Y122.314 I-.015 J-.582 E.01728
G3 X121.18 Y121.958 I.496 J-.335 E.01248
G1 X121.18 Y109.442 E.41518
G3 X121.386 Y108.982 I.582 J-.015 E.01728
G3 X121.742 Y108.88 I.335 J.496 E.01248
G1 X134.274 Y108.883 E.41571
G3 X134.784 Y109.217 I.025 J.519 E.02164
G1 X134.82 Y109.442 E.00755
G1 X134.82 Y121.958 E.41518
G3 X134.745 Y122.259 I-.582 J.015 E.01043
M204 S10000
G1 X135.043 Y122.55 F42000
G1 F6000
M204 S6000
G3 X134.61 Y122.876 I-.785 J-.592 E.01823
G1 X134.29 Y122.927 E.01075
G1 X121.71 Y122.927 E.4173
G1 X121.39 Y122.876 E.01075
G3 X120.824 Y122.31 I.352 J-.918 E.02736
G1 X120.773 Y121.99 E.01075
G1 X120.773 Y109.41 E.4173
G1 X120.824 Y109.09 E.01075
G3 X121.39 Y108.524 I.918 J.352 E.02736
G1 X121.71 Y108.473 E.01075
G1 X134.338 Y108.48 E.41889
G3 X135.176 Y109.09 I0 J.882 E.03676
G1 X135.227 Y109.41 E.01075
G1 X135.227 Y121.99 E.4173
G1 X135.176 Y122.31 E.01075
G3 X135.078 Y122.501 I-.918 J-.352 E.00715
M204 S250
G1 X135.374 Y122.785 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.372 Y122.789 E.00014
G1 X135.089 Y123.072 E.0123
G1 X134.733 Y123.254 E.0123
G1 X134.321 Y123.319 E.01281
G1 X121.679 Y123.319 E.38845
G1 X121.267 Y123.254 E.01281
G1 X120.911 Y123.072 E.0123
G1 X120.628 Y122.789 E.0123
G1 X120.446 Y122.433 E.0123
G1 X120.381 Y122.021 E.01281
G1 X120.381 Y109.379 E.38845
G1 X120.446 Y108.967 E.01281
G1 X120.628 Y108.611 E.0123
G1 X120.911 Y108.328 E.0123
G1 X121.267 Y108.146 E.0123
G1 X121.679 Y108.081 E.01281
G1 X134.321 Y108.081 E.38845
G1 X134.399 Y108.093 E.00243
G1 X134.733 Y108.146 E.01038
G1 X135.089 Y108.328 E.0123
G1 X135.372 Y108.611 E.0123
G1 X135.554 Y108.967 E.0123
G1 X135.619 Y109.379 E.01281
G1 X135.619 Y122.021 E.38845
G1 X135.554 Y122.433 E.01281
G1 X135.402 Y122.732 E.01031
; WIPE_START
M204 S6000
G1 X135.372 Y122.789 E-.02452
G1 X135.089 Y123.072 E-.15206
G1 X134.733 Y123.254 E-.15207
G1 X134.321 Y123.319 E-.15845
G1 X133.603 Y123.319 E-.27291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.202 Y122.356 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42177
G1 F9502.441
M204 S6000
G1 X134.446 Y122.113 E.01064
G2 X134.487 Y121.932 I-.258 J-.153 E.00582
G1 X134.487 Y121.536 E.01221
G1 X133.836 Y122.187 E.0284
G1 X133.3 Y122.187 E.01654
G1 X134.487 Y121 E.05179
G1 X134.487 Y120.465 E.01654
G1 X132.765 Y122.187 E.07518
G1 X132.229 Y122.187 E.01654
M73 P56 R6
G1 X134.487 Y119.929 E.09858
G1 X134.487 Y119.393 E.01654
G1 X131.693 Y122.187 E.12197
G1 X131.157 Y122.187 E.01654
G1 X134.487 Y118.857 E.14536
G1 X134.487 Y118.322 E.01654
G1 X130.622 Y122.187 E.16875
G1 X130.086 Y122.187 E.01654
G1 X134.487 Y117.786 E.19214
G1 X134.487 Y117.25 E.01654
G1 X129.55 Y122.187 E.21553
G1 X129.014 Y122.187 E.01654
G1 X134.487 Y116.714 E.23892
G1 X134.487 Y116.178 E.01654
G1 X128.478 Y122.187 E.26232
G1 X127.943 Y122.187 E.01654
G1 X134.487 Y115.643 E.28571
G1 X134.487 Y115.107 E.01654
G1 X127.407 Y122.187 E.3091
G1 X126.871 Y122.187 E.01654
G1 X134.487 Y114.571 E.33249
G1 X134.487 Y114.035 E.01654
G1 X126.335 Y122.187 E.35588
G1 X125.8 Y122.187 E.01654
G1 X134.487 Y113.5 E.37927
G1 X134.487 Y112.964 E.01654
G1 X125.264 Y122.187 E.40266
G1 X124.728 Y122.187 E.01654
G1 X134.487 Y112.428 E.42605
G1 X134.487 Y111.892 E.01654
G1 X124.192 Y122.187 E.44945
G1 X123.656 Y122.187 E.01654
G1 X134.487 Y111.357 E.47284
G1 X134.487 Y110.821 E.01654
G1 X123.121 Y122.187 E.49623
G1 X122.585 Y122.187 E.01654
G1 X134.487 Y110.285 E.51962
G1 X134.487 Y109.749 E.01654
G1 X122.049 Y122.187 E.54301
G3 X121.585 Y122.145 I-.145 J-.984 E.01454
G1 X121.57 Y122.13 E.00064
G1 X134.43 Y109.27 E.56146
G2 X134.248 Y109.216 I-.15 J.172 E.00606
G1 X133.949 Y109.216 E.00923
G1 X121.513 Y121.651 E.54292
G1 X121.513 Y121.115 E.01654
G1 X133.413 Y109.216 E.51953
G1 X132.877 Y109.215 E.01654
G1 X121.513 Y120.58 E.49615
G1 X121.513 Y120.044 E.01654
G1 X132.342 Y109.215 E.47276
G1 X131.806 Y109.215 E.01654
G1 X121.513 Y119.508 E.44937
G1 X121.513 Y118.972 E.01654
G1 X131.27 Y109.215 E.42599
G1 X130.735 Y109.215 E.01654
G1 X121.513 Y118.437 E.4026
G1 X121.513 Y117.901 E.01654
G1 X130.199 Y109.215 E.37921
G1 X129.663 Y109.215 E.01654
G1 X121.513 Y117.365 E.35583
G1 X121.513 Y116.829 E.01654
G1 X129.128 Y109.215 E.33244
G1 X128.592 Y109.215 E.01654
G1 X121.513 Y116.293 E.30905
G1 X121.513 Y115.758 E.01654
G1 X128.056 Y109.215 E.28567
G1 X127.521 Y109.214 E.01654
G1 X121.513 Y115.222 E.26228
G1 X121.513 Y114.686 E.01654
G1 X126.985 Y109.214 E.23889
G1 X126.449 Y109.214 E.01654
G1 X121.513 Y114.15 E.21551
G1 X121.513 Y113.615 E.01654
G1 X125.914 Y109.214 E.19212
G1 X125.378 Y109.214 E.01654
G1 X121.513 Y113.079 E.16873
G1 X121.513 Y112.543 E.01654
G1 X124.842 Y109.214 E.14535
G1 X124.307 Y109.214 E.01654
G1 X121.513 Y112.007 E.12196
G1 X121.513 Y111.471 E.01654
G1 X123.771 Y109.214 E.09857
G1 X123.235 Y109.214 E.01654
G1 X121.513 Y110.936 E.07519
G1 X121.513 Y110.4 E.01654
G1 X122.7 Y109.213 E.0518
G1 X122.164 Y109.213 E.01654
G1 X121.513 Y109.864 E.02841
G3 X121.536 Y109.322 I1.724 J-.198 E.01683
G1 X121.798 Y109.044 E.01179
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9502.441
G1 X121.536 Y109.322 E-.14507
G1 X121.513 Y109.468 E-.05639
G1 X121.513 Y109.864 E-.15048
G1 X122.164 Y109.213 E-.34976
G1 X122.317 Y109.213 E-.0583
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
G3 Z1.6 I-1.139 J.428 P1  F42000
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


; object ids of this layer7 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X117.506 Y147.571 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472265
M73 P57 R6
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
G1 X137.366 Y139.833 Z1.8 F42000
G1 X134.751 Y122.345 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.649 Y122.456 I-.489 J-.348 E.00503
G3 X134.283 Y122.562 I-.345 J-.51 E.01283
G1 X121.717 Y122.562 E.41684
G3 X121.244 Y122.349 I-.014 J-.6 E.0178
G3 X121.138 Y121.983 I.51 J-.345 E.01283
G1 X121.138 Y109.417 E.41684
G3 X121.351 Y108.944 I.6 J-.014 E.0178
G3 X121.717 Y108.838 I.345 J.51 E.01283
G1 X134.316 Y108.844 E.41794
G3 X134.825 Y109.187 I.018 J.522 E.02178
G1 X134.862 Y109.417 E.00772
G1 X134.862 Y121.983 E.41684
G3 X134.783 Y122.294 I-.6 J.014 E.01078
M204 S10000
G1 X135.082 Y122.585 F42000
G1 F6000
M204 S6000
G3 X134.64 Y122.917 I-.8 J-.603 E.01857
G1 X134.315 Y122.969 E.01092
G1 X121.685 Y122.969 E.41896
G1 X121.36 Y122.917 E.01092
G3 X120.783 Y122.34 I.358 J-.935 E.02788
G1 X120.731 Y122.015 E.01092
G1 X120.731 Y109.385 E.41896
G1 X120.783 Y109.06 E.01092
G3 X121.36 Y108.483 I.935 J.358 E.02788
G1 X121.685 Y108.431 E.01092
G1 X134.38 Y108.442 E.42111
G3 X135.217 Y109.06 I-.013 J.894 E.03685
G1 X135.269 Y109.385 E.01092
G1 X135.269 Y122.015 E.41896
G1 X135.217 Y122.34 E.01092
G3 X135.116 Y122.536 I-.935 J-.358 E.00732
M204 S250
G1 X135.413 Y122.819 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.411 Y122.824 E.00017
G1 X135.124 Y123.111 E.01246
G1 X134.763 Y123.295 E.01246
G1 X134.346 Y123.361 E.01297
G1 X121.654 Y123.361 E.38999
G1 X121.237 Y123.295 E.01297
G1 X120.876 Y123.111 E.01246
G1 X120.589 Y122.824 E.01246
G1 X120.405 Y122.463 E.01246
G1 X120.339 Y122.046 E.01297
G1 X120.339 Y109.354 E.38999
G1 X120.405 Y108.937 E.01297
G1 X120.589 Y108.576 E.01246
G1 X120.876 Y108.289 E.01246
G1 X121.237 Y108.105 E.01246
G1 X121.654 Y108.039 E.01297
G1 X134.346 Y108.039 E.38999
G1 X134.441 Y108.054 E.00296
G1 X134.763 Y108.105 E.01001
G1 X135.124 Y108.289 E.01246
G1 X135.411 Y108.576 E.01246
G1 X135.595 Y108.937 E.01246
G1 X135.661 Y109.354 E.01297
G1 X135.661 Y122.046 E.38999
G1 X135.595 Y122.463 E.01297
G1 X135.441 Y122.766 E.01044
; WIPE_START
M204 S6000
G1 X135.411 Y122.824 E-.02494
G1 X135.124 Y123.111 E-.15406
G1 X134.763 Y123.295 E-.15404
G1 X134.346 Y123.361 E-.16044
G1 X133.645 Y123.361 E-.26653
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.222 Y115.75 Z1.8 F42000
G1 X134.698 Y109.468 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42389
G1 F9449.563
M204 S6000
G1 X134.444 Y109.214 E.01114
G2 X134.29 Y109.177 I-.134 J.219 E.00502
G1 X133.868 Y109.177 E.01308
G1 X134.528 Y109.837 E.02898
G1 X134.528 Y110.375 E.01673
G1 X133.329 Y109.176 E.05264
G1 X132.79 Y109.176 E.01673
G1 X134.528 Y110.914 E.0763
G1 X134.528 Y111.453 E.01673
G1 X132.251 Y109.176 E.09997
G1 X131.712 Y109.176 E.01673
G1 X134.528 Y111.992 E.12363
G1 X134.528 Y112.531 E.01673
G1 X131.173 Y109.176 E.1473
G1 X130.634 Y109.175 E.01673
G1 X134.528 Y113.069 E.17096
G1 X134.528 Y113.608 E.01673
G1 X130.095 Y109.175 E.19462
G1 X129.556 Y109.175 E.01673
G1 X134.528 Y114.147 E.21829
G1 X134.528 Y114.686 E.01673
G1 X129.017 Y109.175 E.24195
G1 X128.478 Y109.174 E.01673
G1 X134.528 Y115.224 E.26561
G1 X134.528 Y115.763 E.01673
G1 X127.939 Y109.174 E.28928
G1 X127.4 Y109.174 E.01673
G1 X134.528 Y116.302 E.31294
G1 X134.528 Y116.841 E.01673
G1 X126.861 Y109.174 E.3366
G1 X126.322 Y109.173 E.01673
G1 X134.528 Y117.379 E.36027
G1 X134.528 Y117.918 E.01673
G1 X125.783 Y109.173 E.38393
G1 X125.244 Y109.173 E.01673
G1 X134.528 Y118.457 E.4076
G1 X134.528 Y118.996 E.01673
G1 X124.705 Y109.173 E.43126
G1 X124.166 Y109.173 E.01673
G1 X134.528 Y119.535 E.45492
G1 X134.528 Y120.073 E.01673
G1 X123.627 Y109.172 E.47859
G1 X123.088 Y109.172 E.01673
G1 X134.528 Y120.612 E.50225
G1 X134.528 Y121.151 E.01673
G1 X122.549 Y109.172 E.52591
G1 X122.01 Y109.172 E.01673
G1 X134.528 Y121.69 E.54958
G3 X134.483 Y122.15 I-.962 J.138 E.01451
G1 X134.467 Y122.167 E.00072
G1 X121.533 Y109.233 E.56782
G2 X121.472 Y109.443 I.198 J.172 E.00701
G1 X121.472 Y109.71 E.00829
G1 X133.99 Y122.228 E.54959
G1 X133.451 Y122.228 E.01673
G1 X121.472 Y110.249 E.52593
G1 X121.472 Y110.788 E.01673
G1 X132.912 Y122.228 E.50228
G1 X132.373 Y122.228 E.01673
G1 X121.472 Y111.327 E.47862
G1 X121.472 Y111.865 E.01673
G1 X131.835 Y122.228 E.45497
G1 X131.296 Y122.228 E.01673
G1 X121.472 Y112.404 E.43132
G1 X121.472 Y112.943 E.01673
G1 X130.757 Y122.228 E.40766
G1 X130.218 Y122.228 E.01673
G1 X121.472 Y113.482 E.38401
G1 X121.472 Y114.021 E.01673
G1 X129.68 Y122.228 E.36036
G1 X129.141 Y122.228 E.01673
G1 X121.472 Y114.559 E.3367
M73 P58 R6
G1 X121.472 Y115.098 E.01673
G1 X128.602 Y122.228 E.31305
G1 X128.063 Y122.228 E.01673
G1 X121.472 Y115.637 E.28939
G1 X121.472 Y116.176 E.01673
G1 X127.524 Y122.228 E.26574
G1 X126.986 Y122.228 E.01673
G1 X121.472 Y116.714 E.24209
G1 X121.472 Y117.253 E.01673
G1 X126.447 Y122.228 E.21843
G1 X125.908 Y122.228 E.01673
G1 X121.472 Y117.792 E.19478
G1 X121.472 Y118.331 E.01673
G1 X125.369 Y122.228 E.17112
G1 X124.831 Y122.228 E.01673
G1 X121.472 Y118.869 E.14747
G1 X121.472 Y119.408 E.01673
G1 X124.292 Y122.228 E.12382
G1 X123.753 Y122.228 E.01673
G1 X121.472 Y119.947 E.10016
G1 X121.472 Y120.486 E.01673
G1 X123.214 Y122.228 E.07651
G1 X122.675 Y122.228 E.01673
G1 X121.472 Y121.025 E.05286
G1 X121.472 Y121.563 E.01673
G1 X122.137 Y122.228 E.0292
G3 X121.591 Y122.204 I-.197 J-1.734 E.01701
G1 X121.302 Y121.932 E.01233
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9449.563
G1 X121.591 Y122.204 E-.15096
G1 X121.743 Y122.228 E-.05841
G1 X122.137 Y122.228 E-.14951
G1 X121.472 Y121.563 E-.35744
G1 X121.472 Y121.448 E-.04368
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
G3 Z1.8 I-1.053 J.609 P1  F42000
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
M73 P59 R6
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
G1 X137.376 Y139.832 Z2 F42000
G1 X134.789 Y122.38 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X134.683 Y122.495 I-.504 J-.358 E.00521
G3 X134.308 Y122.603 I-.355 J-.523 E.01318
G1 X121.692 Y122.603 E.4185
G3 X121.205 Y122.383 I-.013 J-.618 E.01832
G3 X121.097 Y122.008 I.523 J-.355 E.01318
G1 X121.097 Y109.392 E.4185
G3 X121.317 Y108.905 I.618 J-.013 E.01832
G3 X121.692 Y108.797 I.355 J.523 E.01318
G1 X134.358 Y108.805 E.42017
G3 X134.866 Y109.157 I.011 J.526 E.02192
G1 X134.903 Y109.392 E.00789
G1 X134.903 Y122.008 E.4185
G3 X134.822 Y122.329 I-.618 J.013 E.01112
M204 S10000
G1 X135.12 Y122.62 F42000
G1 F6000
M204 S6000
G3 X134.67 Y122.958 I-.815 J-.614 E.01892
G1 X134.34 Y123.01 E.01109
G1 X121.66 Y123.01 E.42062
G1 X121.33 Y122.958 E.0111
G3 X120.742 Y122.37 I.365 J-.953 E.0284
G1 X120.69 Y122.04 E.01109
G1 X120.69 Y109.36 E.42062
G1 X120.742 Y109.03 E.0111
G3 X121.33 Y108.442 I.953 J.365 E.0284
G1 X121.66 Y108.39 E.01109
G1 X134.34 Y108.39 E.42062
G1 X134.422 Y108.403 E.00275
G1 X134.67 Y108.442 E.00834
G3 X135.258 Y109.03 I-.365 J.953 E.0284
G1 X135.31 Y109.36 E.01109
G1 X135.31 Y122.04 E.42062
G1 X135.258 Y122.37 E.0111
G3 X135.155 Y122.571 I-.953 J-.365 E.00749
M204 S250
G1 X135.452 Y122.853 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.449 Y122.859 E.0002
M73 P59 R5
G1 X135.159 Y123.149 E.01262
G1 X134.793 Y123.336 E.01262
G1 X134.371 Y123.403 E.01313
G1 X121.629 Y123.403 E.39152
G1 X121.207 Y123.336 E.01313
G1 X120.841 Y123.149 E.01262
G1 X120.551 Y122.859 E.01262
G1 X120.364 Y122.493 E.01262
G1 X120.297 Y122.071 E.01313
G1 X120.297 Y109.329 E.39152
G1 X120.364 Y108.907 E.01313
G1 X120.551 Y108.541 E.01262
G1 X120.841 Y108.251 E.01262
G1 X121.207 Y108.064 E.01262
G1 X121.629 Y107.998 E.01313
G1 X134.371 Y107.998 E.39152
G1 X134.483 Y108.015 E.0035
G1 X134.793 Y108.064 E.00963
G1 X135.159 Y108.251 E.01262
G1 X135.449 Y108.541 E.01262
G1 X135.636 Y108.907 E.01262
G1 X135.703 Y109.329 E.01313
G1 X135.703 Y122.071 E.39152
G1 X135.636 Y122.493 E.01313
G1 X135.479 Y122.8 E.01058
; WIPE_START
M204 S6000
G1 X135.449 Y122.859 E-.02523
G1 X135.159 Y123.149 E-.15604
G1 X134.793 Y123.336 E-.15602
G1 X134.371 Y123.403 E-.16242
G1 X133.686 Y123.403 E-.2603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.263 Y122.44 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426
G1 F9397.514
M204 S6000
G1 X134.526 Y122.176 E.01164
G2 X134.57 Y121.982 I-.277 J-.165 E.00632
G1 X134.57 Y121.59 E.01222
G1 X133.89 Y122.27 E.03
G1 X133.349 Y122.27 E.01691
G1 X134.57 Y121.049 E.05392
G1 X134.57 Y120.507 E.01691
G1 X132.807 Y122.27 E.07784
G1 X132.265 Y122.27 E.01691
G1 X134.57 Y119.965 E.10175
G1 X134.57 Y119.423 E.01691
G1 X131.723 Y122.27 E.12567
G1 X131.182 Y122.27 E.01691
G1 X134.57 Y118.882 E.14959
G1 X134.57 Y118.34 E.01691
G1 X130.64 Y122.27 E.1735
G1 X130.098 Y122.27 E.01691
G1 X134.57 Y117.798 E.19742
G1 X134.57 Y117.256 E.01691
G1 X129.556 Y122.27 E.22134
G1 X129.015 Y122.27 E.01691
G1 X134.57 Y116.715 E.24525
G1 X134.57 Y116.173 E.01691
G1 X128.473 Y122.27 E.26917
G1 X127.931 Y122.27 E.01691
G1 X134.57 Y115.631 E.29309
G1 X134.57 Y115.089 E.01691
G1 X127.389 Y122.27 E.317
G1 X126.848 Y122.27 E.01691
G1 X134.57 Y114.548 E.34092
G1 X134.57 Y114.006 E.01691
G1 X126.306 Y122.27 E.36483
G1 X125.764 Y122.27 E.01691
G1 X134.57 Y113.464 E.38875
G1 X134.57 Y112.922 E.01691
G1 X125.222 Y122.27 E.41267
G1 X124.681 Y122.27 E.01691
G1 X134.57 Y112.381 E.43658
G1 X134.57 Y111.839 E.01691
G1 X124.139 Y122.27 E.4605
G1 X123.597 Y122.27 E.01691
G1 X134.57 Y111.297 E.48442
G1 X134.57 Y110.755 E.01691
G1 X123.055 Y122.27 E.50833
G1 X122.514 Y122.27 E.01691
G1 X134.57 Y110.214 E.53225
G1 X134.57 Y109.672 E.01691
G1 X121.972 Y122.27 E.55617
G3 X121.515 Y122.222 I-.131 J-.944 E.01448
G1 X121.497 Y122.203 E.00081
G1 X134.503 Y109.197 E.5742
G2 X134.332 Y109.138 I-.153 J.167 E.00582
G1 X134.021 Y109.138 E.00972
G1 X121.43 Y121.729 E.55584
G1 X121.43 Y121.187 E.01691
G1 X133.479 Y109.137 E.53194
G1 X132.938 Y109.137 E.0169
G1 X121.43 Y120.645 E.50804
G1 X121.43 Y120.103 E.01691
G1 X132.397 Y109.137 E.48414
G1 X131.855 Y109.136 E.0169
G1 X121.43 Y119.562 E.46023
G1 X121.43 Y119.02 E.01691
G1 X131.314 Y109.136 E.43633
G1 X130.772 Y109.136 E.0169
G1 X121.43 Y118.478 E.41243
G1 X121.43 Y117.936 E.01691
G1 X130.231 Y109.135 E.38853
G1 X129.689 Y109.135 E.0169
G1 X121.43 Y117.394 E.36463
G1 X121.43 Y116.853 E.01691
G1 X129.148 Y109.135 E.34073
G1 X128.607 Y109.134 E.0169
G1 X121.43 Y116.311 E.31683
G1 X121.43 Y115.769 E.01691
G1 X128.065 Y109.134 E.29292
G1 X127.524 Y109.134 E.0169
G1 X121.43 Y115.227 E.26902
G1 X121.43 Y114.686 E.01691
G1 X126.982 Y109.133 E.24512
G1 X126.441 Y109.133 E.0169
G1 X121.43 Y114.144 E.22122
G1 X121.43 Y113.602 E.01691
G1 X125.9 Y109.133 E.19732
G1 X125.358 Y109.132 E.0169
G1 X121.43 Y113.06 E.17342
G1 X121.43 Y112.519 E.01691
G1 X124.817 Y109.132 E.14952
G1 X124.275 Y109.132 E.0169
G1 X121.43 Y111.977 E.12561
G1 X121.43 Y111.435 E.01691
G1 X123.734 Y109.131 E.10171
G1 X123.192 Y109.131 E.0169
G1 X121.43 Y110.893 E.07781
G1 X121.43 Y110.352 E.01691
G1 X122.651 Y109.131 E.05391
G1 X122.11 Y109.13 E.0169
G1 X121.43 Y109.81 E.03001
G3 X121.455 Y109.261 I1.744 J-.196 E.01721
G1 X121.738 Y108.96 E.0129
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9397.514
G1 X121.455 Y109.261 E-.15701
G1 X121.43 Y109.418 E-.06039
G1 X121.43 Y109.81 E-.14884
G1 X122.11 Y109.13 E-.36529
G1 X122.185 Y109.13 E-.02848
; WIPE_END
M73 P60 R5
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
G3 Z2 I-1.138 J.431 P1  F42000
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
M73 P61 R5
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
G1 X136.193 Y140.104 Z2.2 F42000
G1 X128.754 Y116.58 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X127.964 Y114.533 I-.756 J-.884 E.14737
G1 X128.103 Y114.537 E.00462
G3 X128.798 Y116.54 I-.105 J1.158 E.08845
M204 S10000
G1 X129.162 Y116.759 F42000
G1 F6000
M204 S6000
G3 X127.951 Y114.125 I-1.164 J-1.06 E.20599
G1 X128.14 Y114.131 E.00627
G3 X129.201 Y116.714 I-.143 J1.568 E.11388
; WIPE_START
G1 X129.025 Y116.896 E-.09643
G1 X128.87 Y117.013 E-.07368
G1 X128.524 Y117.186 E-.14715
G1 X128.145 Y117.269 E-.14711
G1 X127.951 Y117.275 E-.07376
G1 X127.569 Y117.215 E-.14714
G1 X127.386 Y117.151 E-.07369
G1 X127.384 Y117.15 E-.00105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.266 Y110.723 Z2.2 F42000
G1 X121.865 Y108.535 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.541 Y108.7 E.01204
G1 X121 Y109.241 E.02539
G1 X120.835 Y109.565 E.01205
G1 X120.648 Y109.52 E.00639
G3 X120.701 Y108.999 I1.669 J-.092 E.01742
G3 X121.299 Y108.401 I.946 J.348 E.02897
G3 X121.82 Y108.348 I.428 J1.616 E.01742
G1 X121.851 Y108.477 E.0044
; WIPE_START
G1 X121.541 Y108.7 E-.14494
G1 X121 Y109.241 E-.29088
G1 X120.835 Y109.565 E-.13804
G1 X120.648 Y109.52 E-.07315
G1 X120.648 Y109.335 E-.07022
G1 X120.665 Y109.224 E-.04275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.296 Y109.403 Z2.2 F42000
G1 X135.165 Y109.565 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X135 Y109.241 E.01204
G1 X134.459 Y108.7 E.02539
G1 X134.135 Y108.535 E.01205
G1 X134.18 Y108.348 E.00639
G3 X134.464 Y108.364 I.092 J.904 E.00947
G1 X134.701 Y108.401 E.00794
G3 X135.299 Y108.999 I-.372 J.97 E.02891
G3 X135.352 Y109.52 I-1.616 J.428 E.01742
G1 X135.223 Y109.551 E.0044
; WIPE_START
G1 X135 Y109.241 E-.14494
G1 X134.459 Y108.7 E-.29089
G1 X134.135 Y108.535 E-.13804
G1 X134.18 Y108.348 E-.07315
G1 X134.464 Y108.364 E-.10808
G1 X134.477 Y108.366 E-.0049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.842 Y115.989 Z2.2 F42000
G1 X135.161 Y122.656 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.701 Y122.999 I-.808 J-.603 E.0193
G3 X134.18 Y123.052 I-.428 J-1.616 E.01742
G1 X134.135 Y122.865 E.00639
G1 X134.459 Y122.7 E.01204
G1 X135 Y122.159 E.02539
G1 X135.165 Y121.835 E.01205
G1 X135.352 Y121.88 E.00639
G3 X135.299 Y122.401 I-1.669 J.092 E.01742
G3 X135.195 Y122.607 I-.946 J-.348 E.00768
; WIPE_START
G1 X134.96 Y122.867 E-.13298
G1 X134.701 Y122.999 E-.1108
G1 X134.365 Y123.052 E-.12908
G1 X134.18 Y123.052 E-.07025
G1 X134.135 Y122.865 E-.07316
G1 X134.459 Y122.7 E-.13791
G1 X134.656 Y122.503 E-.10582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.026 Y122.719 Z2.2 F42000
G1 X121.865 Y122.865 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.82 Y123.052 E.00639
G3 X121.299 Y122.999 I-.092 J-1.669 E.01742
G3 X120.701 Y122.401 I.348 J-.946 E.02897
G3 X120.648 Y121.88 I1.616 J-.428 E.01742
G1 X120.835 Y121.835 E.00639
G1 X121 Y122.159 E.01204
G1 X121.541 Y122.7 E.02539
G1 X121.811 Y122.838 E.01006
; WIPE_START
G1 X121.82 Y123.052 E-.08155
G1 X121.635 Y123.052 E-.07022
G1 X121.299 Y122.999 E-.12909
G1 X121.04 Y122.867 E-.1108
G1 X120.833 Y122.66 E-.11083
G1 X120.701 Y122.401 E-.1108
G1 X120.648 Y122.065 E-.12909
G1 X120.648 Y122.019 E-.01762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.267 Y122.465 Z2.2 F42000
G1 X135.491 Y122.888 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.488 Y122.894 E.00021
G1 X135.194 Y123.188 E.01278
G1 X134.823 Y123.377 E.01278
G1 X134.396 Y123.444 E.01329
G1 X121.604 Y123.444 E.39306
G1 X121.177 Y123.377 E.01329
G1 X120.806 Y123.188 E.01278
G1 X120.512 Y122.894 E.01278
G1 X120.324 Y122.523 E.01278
G1 X120.256 Y122.096 E.01329
G1 X120.256 Y109.304 E.39306
G1 X120.324 Y108.877 E.01329
G1 X120.512 Y108.506 E.01278
G1 X120.806 Y108.212 E.01278
G1 X121.177 Y108.024 E.01278
G1 X121.604 Y107.956 E.01329
G1 X134.396 Y107.956 E.39306
G1 X134.526 Y107.976 E.00403
G1 X134.823 Y108.024 E.00926
G1 X135.194 Y108.212 E.01278
G1 X135.488 Y108.506 E.01278
G1 X135.676 Y108.877 E.01278
G1 X135.744 Y109.304 E.01329
G1 X135.744 Y122.096 E.39306
G1 X135.676 Y122.523 E.01329
G1 X135.518 Y122.834 E.01072
M204 S10000
G1 X135.01 Y122.469 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106205
G1 F15000
M204 S6000
G3 X134.768 Y122.71 I-1.159 J-.918 E.00177
M204 S10000
G1 X133.913 Y122.779 F42000
; LINE_WIDTH: 0.39906
G1 F10108.402
M204 S6000
G1 X133.843 Y122.914 E.00441
; LINE_WIDTH: 0.428527
G1 F9335.939
G1 X133.773 Y123.049 E.00478
G1 X133.746 Y123.052 E.00087
; LINE_WIDTH: 0.410328
G1 F9798.371
G1 X133.439 Y123.077 E.00922
; LINE_WIDTH: 0.361984
G1 F11283.003
G1 X133.132 Y123.101 E.00801
; LINE_WIDTH: 0.336004
G1 F12283.164
G1 X122.868 Y123.101 E.24511
; LINE_WIDTH: 0.361986
G1 F11282.951
G1 X122.561 Y123.077 E.00801
; LINE_WIDTH: 0.410317
G1 F9798.683
G1 X122.254 Y123.052 E.00922
; LINE_WIDTH: 0.414955
G1 F9676.51
G1 X122.227 Y123.049 E.00084
G1 X122.087 Y122.779 E.00922
M204 S10000
G1 X121.231 Y122.71 F42000
; LINE_WIDTH: 0.106207
G1 F15000
M204 S6000
G3 X120.99 Y122.468 I.918 J-1.159 E.00177
M204 S10000
G1 X120.921 Y121.613 F42000
; LINE_WIDTH: 0.415008
G1 F9675.138
M204 S6000
G1 X120.651 Y121.473 E.00922
G1 X120.648 Y121.446 E.00084
; LINE_WIDTH: 0.410328
G1 F9798.371
G1 X120.623 Y121.139 E.00922
; LINE_WIDTH: 0.361984
G1 F11283.003
G1 X120.599 Y120.832 E.00801
; LINE_WIDTH: 0.336004
G1 F12283.164
G1 X120.599 Y110.568 E.24512
; LINE_WIDTH: 0.361986
G1 F11282.951
G1 X120.623 Y110.261 E.00801
; LINE_WIDTH: 0.410317
G1 F9798.683
G1 X120.648 Y109.954 E.00922
; LINE_WIDTH: 0.428483
G1 F9336.999
G1 X120.651 Y109.927 E.00087
G1 X120.786 Y109.857 E.00478
; LINE_WIDTH: 0.398967
G1 F10111.029
G1 X120.921 Y109.787 E.00441
M204 S10000
G1 X120.99 Y108.931 F42000
; LINE_WIDTH: 0.106205
G1 F15000
M204 S6000
G3 X121.232 Y108.69 I1.159 J.918 E.00177
M204 S10000
G1 X122.087 Y108.621 F42000
; LINE_WIDTH: 0.415022
G1 F9674.77
M204 S6000
G1 X122.227 Y108.351 E.00922
G1 X122.254 Y108.348 E.00084
; LINE_WIDTH: 0.410328
G1 F9798.371
G1 X122.561 Y108.323 E.00922
; LINE_WIDTH: 0.361984
G1 F11283.003
G1 X122.868 Y108.299 E.00801
; LINE_WIDTH: 0.336004
G1 F12283.164
G1 X133.132 Y108.299 E.24511
; LINE_WIDTH: 0.361986
G1 F11282.951
G1 X133.439 Y108.323 E.00801
; LINE_WIDTH: 0.410317
G1 F9798.683
G1 X133.746 Y108.348 E.00922
; LINE_WIDTH: 0.428483
G1 F9336.999
G1 X133.773 Y108.351 E.00087
G1 X133.843 Y108.486 E.00478
; LINE_WIDTH: 0.398967
G1 F10111.029
G1 X133.913 Y108.621 E.00441
M204 S10000
G1 X134.769 Y108.69 F42000
; LINE_WIDTH: 0.106201
G1 F15000
M204 S6000
G3 X135.01 Y108.932 I-.918 J1.16 E.00177
M204 S10000
G1 X135.079 Y109.787 F42000
; LINE_WIDTH: 0.39904
G1 F10108.956
M204 S6000
G1 X135.214 Y109.857 E.00441
; LINE_WIDTH: 0.428518
G1 F9336.16
G1 X135.349 Y109.927 E.00478
G1 X135.352 Y109.954 E.00087
; LINE_WIDTH: 0.410328
G1 F9798.371
G1 X135.377 Y110.261 E.00922
; LINE_WIDTH: 0.361984
G1 F11283.003
G1 X135.401 Y110.568 E.00801
; LINE_WIDTH: 0.336004
G1 F12283.164
G1 X135.401 Y120.832 E.24512
; LINE_WIDTH: 0.361986
G1 F11282.951
G1 X135.377 Y121.139 E.00801
; LINE_WIDTH: 0.410317
G1 F9798.683
G1 X135.352 Y121.446 E.00922
; LINE_WIDTH: 0.414955
G1 F9676.51
G1 X135.349 Y121.473 E.00084
G1 X135.079 Y121.613 E.00922
; WIPE_START
G1 X135.349 Y121.473 E-.69665
G1 X135.352 Y121.446 E-.06335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.377 Y116.697 Z2.2 F42000
G1 X127.456 Y115.17 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.344 Y115.295 E.00516
G1 X127.242 Y115.56 E.00871
G1 X127.243 Y115.847 E.00883
G1 X127.402 Y116.18 E.01134
G1 X127.704 Y116.413 E.01172
G1 X127.981 Y116.471 E.00871
G1 X128.342 Y116.386 E.0114
G1 X128.633 Y116.142 E.01166
G1 X128.761 Y115.794 E.01138
G1 X128.718 Y115.416 E.01168
G1 X128.57 Y115.181 E.00855
G1 X128.349 Y115.012 E.00855
G1 X127.963 Y114.934 E.01209
G1 X127.699 Y114.988 E.00829
G1 X127.504 Y115.134 E.00748
M204 S10000
G1 X127.645 Y115.563 F42000
G1 F9547.299
M204 S6000
G1 X127.619 Y115.775 E.00657
G1 X127.716 Y115.969 E.00667
G1 X127.922 Y116.073 E.00708
G1 X128.145 Y116.063 E.00686
G1 X128.318 Y115.922 E.00687
G1 X128.387 Y115.748 E.00575
G1 X128.361 Y115.557 E.00592
G1 X128.176 Y115.354 E.00842
G1 X127.94 Y115.312 E.00737
G1 X127.775 Y115.38 E.0055
G1 X127.679 Y115.514 E.00503
M204 S10000
G1 X128.024 Y115.658 F42000
; LINE_WIDTH: 0.4275
G1 F9360.861
M204 S6000
G1 X127.952 Y115.7 E.00261
G1 X128.014 Y115.736 E.00224
; WIPE_START
G1 X127.952 Y115.7 E-.35067
G1 X128.024 Y115.658 E-.40933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.162 Y111.121 Z2.2 F42000
G1 X135.192 Y110.36 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X133.34 Y108.508 E.08047
G1 X132.77 Y108.471
G1 X135.229 Y110.93 E.10686
G1 X135.229 Y111.464
G1 X132.236 Y108.471 E.13003
G1 X131.703 Y108.471
G1 X135.229 Y111.997 E.1532
G1 X135.229 Y112.53
G1 X131.17 Y108.471 E.17637
G1 X130.637 Y108.471
G1 X135.229 Y113.063 E.19955
G1 X135.229 Y113.597
G1 X130.103 Y108.471 E.22272
G1 X129.57 Y108.471
G1 X135.229 Y114.13 E.24589
G1 X135.229 Y114.663
G1 X129.037 Y108.471 E.26906
G1 X128.504 Y108.471
G1 X135.229 Y115.196 E.29224
G1 X135.229 Y115.73
G1 X127.97 Y108.471 E.31541
G1 X127.437 Y108.471
G1 X135.229 Y116.263 E.33858
G1 X135.229 Y116.796
G1 X126.904 Y108.471 E.36175
G1 X126.371 Y108.471
G1 X135.229 Y117.329 E.38493
G1 X135.229 Y117.863
G1 X125.837 Y108.471 E.4081
G1 X125.304 Y108.471
G1 X135.229 Y118.396 E.43127
G1 X135.229 Y118.929
G1 X124.771 Y108.471 E.45444
G1 X124.237 Y108.471
G1 X135.229 Y119.463 E.47762
G1 X135.229 Y119.996
G1 X123.704 Y108.471 E.50079
G1 X123.171 Y108.471
G1 X128.781 Y114.081 E.24378
G1 X128.073 Y113.906
G1 X122.673 Y108.506 E.23466
G1 X122.231 Y108.598
G1 X127.586 Y113.953 E.2327
G1 X127.195 Y114.095
G1 X121.878 Y108.778 E.23107
G1 X121.561 Y108.995
G1 X126.871 Y114.304 E.23072
G1 X126.602 Y114.569
G1 X121.295 Y109.261 E.23064
G1 X121.078 Y109.578
G1 X126.395 Y114.895 E.23105
G1 X126.253 Y115.286
G1 X120.898 Y109.931 E.23271
G1 X120.806 Y110.373
G1 X126.205 Y115.771 E.2346
G1 X126.383 Y116.483
G1 X120.771 Y110.871 E.24384
; WIPE_START
M204 S6000
G1 X122.186 Y112.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.381 Y114.832 Z2.2 F42000
G1 X129.615 Y114.915 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X135.229 Y120.529 E.24395
G1 X135.194 Y121.027
G1 X129.794 Y115.627 E.23466
G1 X129.748 Y116.115
G1 X135.102 Y121.469 E.23264
G1 X134.922 Y121.822
G1 X129.605 Y116.505 E.23103
G1 X129.396 Y116.829
G1 X134.705 Y122.139 E.23074
G1 X134.439 Y122.405
G1 X129.13 Y117.096 E.23071
G1 X128.807 Y117.307
G1 X134.122 Y122.622 E.23097
M73 P62 R5
G1 X133.769 Y122.802
G1 X128.415 Y117.448 E.23265
G1 X127.93 Y117.496
G1 X133.327 Y122.894 E.23455
G1 X132.829 Y122.929
G1 X127.214 Y117.314 E.24399
; WIPE_START
M204 S6000
G1 X128.628 Y118.728 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.296 Y122.929 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X120.771 Y111.404 E.50078
G1 X120.771 Y111.938
G1 X131.762 Y122.929 E.47761
G1 X131.229 Y122.929
G1 X120.771 Y112.471 E.45444
G1 X120.771 Y113.004
G1 X130.696 Y122.929 E.43127
G1 X130.163 Y122.929
G1 X120.771 Y113.537 E.40809
G1 X120.771 Y114.071
G1 X129.629 Y122.929 E.38492
G1 X129.096 Y122.929
G1 X120.771 Y114.604 E.36175
G1 X120.771 Y115.137
G1 X128.563 Y122.929 E.33858
G1 X128.03 Y122.929
G1 X120.771 Y115.67 E.3154
G1 X120.771 Y116.204
G1 X127.496 Y122.929 E.29223
G1 X126.963 Y122.929
G1 X120.771 Y116.737 E.26906
G1 X120.771 Y117.27
G1 X126.43 Y122.929 E.24589
G1 X125.897 Y122.929
G1 X120.771 Y117.803 E.22271
G1 X120.771 Y118.337
G1 X125.363 Y122.929 E.19954
G1 X124.83 Y122.929
G1 X120.771 Y118.87 E.17637
G1 X120.771 Y119.403
G1 X124.297 Y122.929 E.15319
G1 X123.764 Y122.929
G1 X120.771 Y119.937 E.13002
G1 X120.771 Y120.47
G1 X123.23 Y122.929 E.10685
G1 X122.66 Y122.892
G1 X120.808 Y121.04 E.08046
; WIPE_START
M204 S6000
G1 X122.223 Y122.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.722 Y117.161 Z2.2 F42000
G1 X135.141 Y110.021 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0901076
G1 F15000
M204 S6000
G1 X135.128 Y109.995 E.00011
; LINE_WIDTH: 0.113488
G1 X135.047 Y109.884 E.00079
; LINE_WIDTH: 0.156334
G1 X134.967 Y109.773 E.00127
; LINE_WIDTH: 0.199181
G1 X134.886 Y109.663 E.00174
; LINE_WIDTH: 0.242027
G1 X134.806 Y109.552 E.00222
; LINE_WIDTH: 0.302666
G1 F13859.7
G1 X134.725 Y109.441 E.0029
G1 X134.259 Y108.975 E.01395
; LINE_WIDTH: 0.285001
G1 F14871.061
G1 X134.148 Y108.894 E.0027
; LINE_WIDTH: 0.242142
G1 F15000
G1 X134.038 Y108.814 E.00222
; LINE_WIDTH: 0.199283
G1 X133.927 Y108.733 E.00175
; LINE_WIDTH: 0.156424
G1 X133.816 Y108.653 E.00127
; LINE_WIDTH: 0.109472
G2 X133.679 Y108.559 I-.362 J.382 E.0009
; WIPE_START
G1 X133.816 Y108.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.011 Y114.583 Z2.2 F42000
G1 X122.321 Y122.841 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0901137
G1 F15000
M204 S6000
G1 X122.295 Y122.828 E.00011
; LINE_WIDTH: 0.113475
G1 X122.184 Y122.747 E.00079
; LINE_WIDTH: 0.156332
G1 X122.073 Y122.667 E.00127
; LINE_WIDTH: 0.199189
G1 X121.962 Y122.586 E.00174
; LINE_WIDTH: 0.242046
G1 X121.851 Y122.506 E.00222
; LINE_WIDTH: 0.3026
G1 F13863.249
G1 X121.741 Y122.425 E.0029
G1 X121.275 Y121.959 E.01395
; LINE_WIDTH: 0.284773
M73 P63 R5
G1 F14885.092
G1 X121.194 Y121.848 E.0027
; LINE_WIDTH: 0.241924
G1 F15000
G1 X121.113 Y121.737 E.00222
; LINE_WIDTH: 0.199074
G1 X121.033 Y121.627 E.00174
; LINE_WIDTH: 0.156225
G1 X120.952 Y121.516 E.00126
; LINE_WIDTH: 0.109329
G3 X120.859 Y121.379 I.382 J-.362 E.0009
; WIPE_START
G1 X120.952 Y121.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.024 Y116.891 Z2.2 F42000
G1 X129.604 Y114.926 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.157473
G1 F15000
M204 S6000
G1 X129.619 Y114.827 E.00094
; LINE_WIDTH: 0.176669
G1 X129.621 Y114.804 E.00024
; LINE_WIDTH: 0.197099
G1 X129.624 Y114.782 E.00028
G1 X129.504 Y114.631 E.00243
; LINE_WIDTH: 0.16162
G1 X129.196 Y114.309 E.00431
G1 X129.019 Y114.154 E.00227
; LINE_WIDTH: 0.20379
G1 X128.843 Y114.019 E.00291
; WIPE_START
G1 X129.019 Y114.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.673 Y116.307 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.100222
G1 F15000
M204 S6000
G1 X129.686 Y116.372 E.00031
G1 X129.627 Y116.457 E.00048
; WIPE_START
G1 X129.686 Y116.372 E-.46237
G1 X129.673 Y116.307 E-.29763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.858 Y117.567 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.122453
G1 F15000
M204 S6000
G1 X127.647 Y117.46 E.00154
M204 S10000
G1 X127.153 Y117.375 F42000
; LINE_WIDTH: 0.197846
G1 F15000
M204 S6000
G1 X126.894 Y117.173 E.00415
; LINE_WIDTH: 0.163358
G1 X126.718 Y117.01 E.00235
G1 X126.424 Y116.681 E.00433
; LINE_WIDTH: 0.212065
G1 X126.322 Y116.544 E.00236
M204 S10000
G1 X126.248 Y115.315 F42000
; LINE_WIDTH: 0.102502
G1 F15000
M204 S6000
G2 X126.167 Y115.466 I2.303 J1.338 E.00084
; WIPE_START
G1 X126.248 Y115.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.829 Y113.929 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.142989
G1 F15000
M204 S6000
G1 X127.719 Y113.892 E.00094
G1 X127.611 Y113.948 E.001
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.719 Y113.892 E-.39026
G1 X127.829 Y113.929 E-.36974
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
G3 Z2.2 I-1.176 J.314 P1  F42000
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
G1 X137.53 Y139.81 Z2.4 F42000
G1 X133.613 Y109.077 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X134.03 Y109.29 E.01555
G1 X134.41 Y109.67 E.01783
G1 X134.654 Y110.149 E.01783
G1 X134.731 Y110.633 E.01625
G1 X134.731 Y120.767 E.33619
G1 X134.655 Y121.251 E.01625
G1 X134.41 Y121.73 E.01784
G1 X134.03 Y122.11 E.01783
M73 P64 R5
G1 X133.551 Y122.355 E.01783
G1 X133.067 Y122.431 E.01625
G1 X122.933 Y122.431 E.33619
G1 X122.449 Y122.355 E.01625
G1 X121.97 Y122.11 E.01784
G1 X121.59 Y121.73 E.01783
G1 X121.345 Y121.251 E.01783
G1 X121.269 Y120.767 E.01625
G1 X121.269 Y110.633 E.33619
G1 X121.345 Y110.149 E.01625
G1 X121.59 Y109.67 E.01784
G1 X121.97 Y109.29 E.01783
G1 X122.449 Y109.046 E.01783
G1 X122.933 Y108.969 E.01625
G1 X133.067 Y108.969 E.33619
G1 X133.551 Y109.045 E.01625
G1 X133.559 Y109.05 E.0003
M204 S250
G1 X133.435 Y109.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.797 Y109.611 E.01249
G1 X134.089 Y109.903 E.0127
G1 X134.277 Y110.272 E.01271
G1 X134.339 Y110.664 E.01219
G1 X134.339 Y120.737 E.30952
G1 X134.277 Y121.129 E.0122
G1 X134.089 Y121.497 E.01271
G1 X133.797 Y121.789 E.0127
G1 X133.428 Y121.977 E.01271
G1 X133.037 Y122.039 E.01219
G1 X122.963 Y122.039 E.30952
G1 X122.571 Y121.977 E.0122
G1 X122.203 Y121.789 E.01271
G1 X121.911 Y121.497 E.0127
G1 X121.723 Y121.128 E.01271
G1 X121.661 Y120.737 E.01219
G1 X121.661 Y110.664 E.30952
G1 X121.723 Y110.271 E.0122
G1 X121.911 Y109.903 E.01271
G1 X122.203 Y109.611 E.0127
G1 X122.572 Y109.423 E.01271
G1 X122.963 Y109.361 E.01219
G1 X133.036 Y109.361 E.30952
G1 X133.376 Y109.415 E.01057
; WIPE_START
M204 S6000
G1 X133.797 Y109.611 E-.17641
G1 X134.089 Y109.903 E-.15705
G1 X134.277 Y110.272 E-.15713
G1 X134.339 Y110.664 E-.1508
G1 X134.339 Y110.976 E-.11861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.81 Y109.726 Z2.4 F42000
G1 X121.837 Y108.901 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.728 Y108.956 E.00407
G1 X121.256 Y109.427 E.0221
G1 X121.2 Y109.537 E.00408
G1 X121.013 Y109.492 E.00639
G3 X121.128 Y108.947 I.992 J-.075 E.01872
G3 X121.642 Y108.713 I.502 J.421 E.01935
G1 X121.792 Y108.713 E.00497
G1 X121.823 Y108.842 E.0044
; WIPE_START
G1 X121.728 Y108.956 E-.05644
G1 X121.256 Y109.427 E-.25322
G1 X121.2 Y109.537 E-.04671
G1 X121.013 Y109.492 E-.07316
G1 X121.013 Y109.342 E-.05694
G1 X121.052 Y109.097 E-.09438
G1 X121.128 Y108.947 E-.06379
G1 X121.247 Y108.828 E-.06381
G1 X121.368 Y108.767 E-.05157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.988 Y109.204 Z2.4 F42000
G1 X134.799 Y109.537 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X134.744 Y109.428 E.00407
G1 X134.273 Y108.956 E.0221
G1 X134.163 Y108.901 E.00408
G1 X134.208 Y108.713 E.00639
G3 X134.443 Y108.727 I.075 J.747 E.00782
G3 X134.948 Y109.097 I-.004 J.535 E.02219
G3 X134.987 Y109.492 I-1.228 J.32 E.01323
G1 X134.858 Y109.523 E.0044
; WIPE_START
G1 X134.744 Y109.428 E-.05644
G1 X134.273 Y108.956 E-.25322
G1 X134.163 Y108.901 E-.04671
G1 X134.208 Y108.713 E-.07316
G1 X134.443 Y108.727 E-.08927
G1 X134.603 Y108.752 E-.06179
G1 X134.753 Y108.828 E-.06379
G1 X134.872 Y108.947 E-.06381
G1 X134.934 Y109.069 E-.05182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.898 Y116.701 Z2.4 F42000
G1 X134.872 Y122.453 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.358 Y122.687 I-.502 J-.421 E.01935
G1 X134.208 Y122.687 E.00497
G1 X134.163 Y122.5 E.00639
G1 X134.272 Y122.444 E.00407
G1 X134.744 Y121.973 E.0221
G1 X134.8 Y121.863 E.00408
G1 X134.987 Y121.908 E.00639
G3 X134.898 Y122.399 I-.992 J.075 E.01673
; WIPE_START
G1 X134.753 Y122.572 E-.08573
G1 X134.603 Y122.648 E-.06378
G1 X134.358 Y122.687 E-.09438
G1 X134.208 Y122.687 E-.05695
G1 X134.163 Y122.5 E-.07316
G1 X134.272 Y122.444 E-.04658
G1 X134.744 Y121.973 E-.25322
G1 X134.8 Y121.863 E-.04671
G1 X134.901 Y121.888 E-.03951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.268 Y121.874 Z2.4 F42000
G1 X121.2 Y121.863 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.256 Y121.972 E.00407
G1 X121.727 Y122.444 E.0221
G1 X121.837 Y122.5 E.00408
G1 X121.792 Y122.687 E.00639
G3 X121.247 Y122.572 I-.075 J-.992 E.01872
G3 X121.013 Y122.058 I.421 J-.502 E.01935
G1 X121.013 Y121.908 E.00497
G1 X121.142 Y121.877 E.0044
; WIPE_START
G1 X121.256 Y121.972 E-.05644
G1 X121.727 Y122.444 E-.25322
G1 X121.837 Y122.5 E-.04671
G1 X121.792 Y122.687 E-.07316
G1 X121.642 Y122.687 E-.05694
G1 X121.397 Y122.648 E-.09438
G1 X121.247 Y122.572 E-.06379
G1 X121.128 Y122.453 E-.06381
G1 X121.067 Y122.332 E-.05157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.697 Y122.525 Z2.4 F42000
G1 X135.197 Y122.689 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.731 Y123.04 I-.844 J-.636 E.01961
G1 X134.39 Y123.094 E.01144
G1 X121.61 Y123.094 E.42394
G1 X121.269 Y123.04 E.01144
G3 X120.66 Y122.431 I.378 J-.987 E.02943
G1 X120.606 Y122.09 E.01144
G1 X120.606 Y109.31 E.42394
G1 X120.66 Y108.969 E.01144
G3 X121.269 Y108.36 I.987 J.378 E.02943
G1 X121.61 Y108.306 E.01144
G1 X134.39 Y108.306 E.42394
G1 X134.506 Y108.325 E.00391
G1 X134.731 Y108.36 E.00753
G3 X135.34 Y108.969 I-.378 J.987 E.02943
G1 X135.394 Y109.31 E.01144
G1 X135.394 Y122.09 E.42394
G1 X135.34 Y122.431 E.01144
G3 X135.231 Y122.64 I-.987 J-.378 E.00784
M204 S250
G1 X135.529 Y122.922 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.526 Y122.929 E.00021
G1 X135.228 Y123.226 E.01294
G1 X134.853 Y123.417 E.01294
G1 X134.421 Y123.486 E.01345
G1 X121.579 Y123.486 E.39459
G1 X121.147 Y123.417 E.01345
G1 X120.772 Y123.226 E.01294
G1 X120.474 Y122.929 E.01294
G1 X120.283 Y122.553 E.01294
G1 X120.214 Y122.121 E.01345
G1 X120.214 Y109.279 E.39459
G1 X120.283 Y108.847 E.01345
G1 X120.474 Y108.472 E.01294
G1 X120.772 Y108.174 E.01294
G1 X121.147 Y107.983 E.01294
G1 X121.579 Y107.914 E.01345
G1 X134.421 Y107.914 E.39459
G1 X134.568 Y107.937 E.00457
G1 X134.853 Y107.983 E.00889
G1 X135.228 Y108.174 E.01294
G1 X135.526 Y108.472 E.01294
G1 X135.717 Y108.847 E.01294
G1 X135.786 Y109.279 E.01345
G1 X135.786 Y122.121 E.39459
G1 X135.717 Y122.553 E.01345
G1 X135.557 Y122.869 E.01088
; WIPE_START
M204 S6000
G1 X135.526 Y122.929 E-.02546
G1 X135.228 Y123.226 E-.16
G1 X134.853 Y123.417 E-.15998
G1 X134.421 Y123.486 E-.16638
G1 X133.768 Y123.486 E-.24819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.963 Y121.693 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.39349
G1 F10268.987
M204 S6000
G1 X135.019 Y121.342 E.01017
; LINE_WIDTH: 0.36357
G1 F11227.204
G1 X135.04 Y121.073 E.00705
; LINE_WIDTH: 0.29905
G1 F14055.394
G2 X135.062 Y120.783 I-3.67 J-.424 E.00606
G1 X135.062 Y110.597 E.21261
; LINE_WIDTH: 0.321232
G1 F12935.16
G1 X135.04 Y110.327 E.00612
; LINE_WIDTH: 0.363597
G1 F11226.246
G1 X135.019 Y110.058 E.00705
; LINE_WIDTH: 0.393526
G1 F10267.934
G1 X134.963 Y109.707 E.01017
M204 S10000
G1 X133.993 Y108.737 F42000
; LINE_WIDTH: 0.39349
G1 F10268.987
M204 S6000
G1 X133.642 Y108.681 E.01017
; LINE_WIDTH: 0.36357
G1 F11227.204
G1 X133.373 Y108.66 E.00705
; LINE_WIDTH: 0.29905
G1 F14055.394
G2 X133.083 Y108.638 I-.424 J3.67 E.00606
G1 X122.897 Y108.638 E.21261
; LINE_WIDTH: 0.321232
G1 F12935.16
G1 X122.627 Y108.66 E.00612
; LINE_WIDTH: 0.363597
G1 F11226.246
G1 X122.358 Y108.681 E.00705
; LINE_WIDTH: 0.393526
G1 F10267.934
G1 X122.007 Y108.737 E.01017
M204 S10000
G1 X121.037 Y109.707 F42000
; LINE_WIDTH: 0.39349
G1 F10268.987
M204 S6000
G1 X120.981 Y110.058 E.01017
; LINE_WIDTH: 0.36357
G1 F11227.204
G1 X120.959 Y110.327 E.00705
; LINE_WIDTH: 0.29905
G1 F14055.394
G2 X120.938 Y110.617 I3.67 J.424 E.00606
G1 X120.938 Y120.803 E.21261
; LINE_WIDTH: 0.321232
G1 F12935.16
G1 X120.96 Y121.073 E.00612
; LINE_WIDTH: 0.363597
G1 F11226.246
G1 X120.981 Y121.342 E.00705
; LINE_WIDTH: 0.393526
G1 F10267.934
G1 X121.037 Y121.693 E.01017
M204 S10000
G1 X122.007 Y122.663 F42000
; LINE_WIDTH: 0.39349
G1 F10268.987
M204 S6000
G1 X122.358 Y122.719 E.01017
; LINE_WIDTH: 0.36357
G1 F11227.204
G1 X122.627 Y122.741 E.00705
; LINE_WIDTH: 0.321217
G1 F12935.839
G1 X122.897 Y122.762 E.00612
; LINE_WIDTH: 0.29905
G1 F14055.381
G1 X133.083 Y122.762 E.21261
G2 X133.373 Y122.741 I-.135 J-3.684 E.00605
; LINE_WIDTH: 0.363597
G1 F11226.246
G1 X133.642 Y122.719 E.00705
; LINE_WIDTH: 0.393526
G1 F10267.934
G1 X133.993 Y122.663 E.01017
; WIPE_START
G1 X133.642 Y122.719 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.739 Y116.869 Z2.4 F42000
G1 X126.653 Y114.379 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.684 Y114.343 E.00159
G3 X127.942 Y113.812 I1.313 J1.356 E.04633
G1 X128.169 Y113.819 E.00754
G3 X126.527 Y114.515 I-.172 J1.88 E.33183
G1 X126.612 Y114.423 E.00414
M204 S10000
G1 X126.352 Y114.105 F42000
G1 F6000
M204 S6000
G1 X126.4 Y114.05 E.00243
G3 X127.929 Y113.404 I1.597 J1.648 E.05634
G1 X128.206 Y113.413 E.00919
G3 X126.209 Y114.259 I-.209 J2.286 E.40345
G1 X126.311 Y114.149 E.00497
M204 S250
G1 X126.062 Y113.841 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.127 Y113.768 E.00299
G3 X127.917 Y113.012 I1.87 J1.93 E.06111
G1 X128.242 Y113.022 E.00998
G3 X125.903 Y114.013 I-.245 J2.677 E.43764
G1 X126.021 Y113.885 E.00535
; WIPE_START
M204 S6000
G1 X126.127 Y113.768 E-.05979
G1 X126.379 Y113.554 E-.12587
G1 X126.655 Y113.371 E-.12584
G1 X126.952 Y113.223 E-.12586
G1 X127.264 Y113.113 E-.12584
G1 X127.587 Y113.042 E-.12582
G1 X127.773 Y113.025 E-.07098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.352 Y115.695 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.29 Y115.495 E.00645
G1 X128.117 Y115.368 E.00658
G1 X127.967 Y115.343 E.0047
G1 X127.755 Y115.447 E.00725
G1 X127.652 Y115.632 E.0065
G1 X127.681 Y115.849 E.00676
G1 X127.824 Y116.008 E.00656
G1 X128.033 Y116.051 E.00655
G1 X128.231 Y115.97 E.00659
G1 X128.345 Y115.755 E.00748
M204 S10000
G1 X128.729 Y115.694 F42000
G1 F9547.299
M204 S6000
G1 X128.686 Y115.435 E.00809
G1 X128.478 Y115.142 E.01103
G1 X128.158 Y114.982 E.01099
G1 X127.9 Y114.97 E.00795
G1 X127.557 Y115.113 E.01141
G1 X127.332 Y115.394 E.01106
G1 X127.266 Y115.746 E.01101
G1 X127.375 Y116.087 E.011
G1 X127.633 Y116.337 E.01104
G1 X127.977 Y116.435 E.01099
G1 X128.328 Y116.358 E.01102
G1 X128.6 Y116.125 E.01102
G1 X128.729 Y115.791 E.01099
G1 X128.729 Y115.754 E.00114
M204 S10000
G1 X129.106 Y115.694 F42000
G1 F9547.299
M204 S6000
G1 X129.04 Y115.297 E.01234
G1 X128.818 Y114.954 E.01256
G1 X128.497 Y114.702 E.01255
G1 X128.102 Y114.598 E.01254
G1 X127.797 Y114.607 E.00939
G1 X127.447 Y114.742 E.01152
G1 X127.131 Y115.001 E.01254
G1 X126.946 Y115.363 E.0125
G1 X126.887 Y115.769 E.01261
G1 X126.996 Y116.165 E.0126
G1 X127.221 Y116.497 E.01234
G1 X127.569 Y116.719 E.01271
G1 X127.966 Y116.815 E.01252
G1 X128.368 Y116.744 E.01255
G1 X128.726 Y116.547 E.01255
G1 X128.975 Y116.223 E.01258
G1 X129.106 Y115.838 E.01249
G1 X129.106 Y115.754 E.00259
M204 S10000
G1 X129.483 Y115.693 F42000
G1 F9547.299
M204 S6000
G2 X128.137 Y114.223 I-1.483 J.007 E.06716
G1 X127.776 Y114.221 E.01109
G2 X129.484 Y115.884 I.226 J1.476 E.20349
G1 X129.483 Y115.753 E.00404
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X129.484 Y115.884 E-.04992
G1 X129.394 Y116.24 E-.13947
G1 X129.22 Y116.564 E-.13969
G1 X128.973 Y116.835 E-.13957
G1 X128.666 Y117.038 E-.13968
G1 X128.32 Y117.16 E-.1396
G1 X128.288 Y117.163 E-.01208
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 11/36
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S198.9
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-1.172 J.329 P1  F42000
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
M73 P65 R5
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
G1 X137.539 Y139.809 Z2.6 F42000
G1 X133.656 Y109.018 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X134.081 Y109.235 E.01583
G1 X134.465 Y109.619 E.01803
G1 X134.712 Y110.103 E.01802
G1 X134.789 Y110.593 E.01644
G1 X134.789 Y120.807 E.33884
G1 X134.712 Y121.297 E.01644
G1 X134.465 Y121.781 E.01802
G1 X134.081 Y122.165 E.01803
G1 X133.597 Y122.412 E.01802
G1 X133.107 Y122.489 E.01644
G1 X122.893 Y122.489 E.33884
G1 X122.403 Y122.412 E.01644
G1 X121.919 Y122.165 E.01802
G1 X121.535 Y121.781 E.01803
G1 X121.288 Y121.297 E.01802
G1 X121.211 Y120.807 E.01644
G1 X121.211 Y110.593 E.33884
G1 X121.288 Y110.103 E.01644
G1 X121.535 Y109.619 E.01802
G1 X121.919 Y109.235 E.01803
G1 X122.403 Y108.988 E.01802
G1 X122.893 Y108.911 E.01644
G1 X133.107 Y108.911 E.33884
G1 X133.597 Y108.988 E.01644
G1 X133.602 Y108.991 E.00021
M204 S250
G1 X133.478 Y109.368 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.848 Y109.556 E.01275
G1 X134.144 Y109.852 E.01288
G1 X134.334 Y110.226 E.01288
G1 X134.397 Y110.624 E.01237
G1 X134.397 Y120.777 E.31197
G1 X134.334 Y121.174 E.01237
G1 X134.144 Y121.548 E.01288
G1 X133.848 Y121.844 E.01288
G1 X133.474 Y122.034 E.01288
G1 X133.077 Y122.097 E.01237
G1 X122.923 Y122.097 E.31197
G1 X122.526 Y122.034 E.01237
G1 X122.152 Y121.844 E.01288
G1 X121.856 Y121.548 E.01288
G1 X121.666 Y121.174 E.01288
G1 X121.603 Y120.777 E.01237
G1 X121.603 Y110.624 E.31197
G1 X121.666 Y110.226 E.01237
G1 X121.856 Y109.852 E.01288
G1 X122.152 Y109.556 E.01288
G1 X122.526 Y109.366 E.01288
G1 X122.923 Y109.303 E.01237
G1 X133.077 Y109.303 E.31197
G1 X133.419 Y109.357 E.01065
; WIPE_START
M204 S6000
G1 X133.848 Y109.556 E-.17957
G1 X134.144 Y109.852 E-.15932
G1 X134.334 Y110.226 E-.15928
G1 X134.397 Y110.624 E-.15295
G1 X134.397 Y110.91 E-.10888
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.864 Y109.686 Z2.6 F42000
G1 X121.764 Y108.857 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.677 Y108.901 E.00325
G1 X121.201 Y109.377 E.02231
G1 X121.157 Y109.464 E.00326
G1 X120.958 Y109.4 E.00692
G1 X121.011 Y109.067 E.0112
G3 X121.367 Y108.711 I.605 J.25 E.0171
G1 X121.7 Y108.659 E.01119
G1 X121.746 Y108.8 E.00493
; WIPE_START
G1 X121.677 Y108.901 E-.04661
G1 X121.201 Y109.377 E-.25552
G1 X121.157 Y109.464 E-.0373
G1 X120.958 Y109.4 E-.07926
G1 X121.011 Y109.067 E-.12825
G1 X121.09 Y108.912 E-.06576
G1 X121.212 Y108.79 E-.06578
G1 X121.367 Y108.711 E-.06578
G1 X121.407 Y108.705 E-.01574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.028 Y109.136 Z2.6 F42000
G1 X134.843 Y109.464 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X134.799 Y109.377 E.00325
G1 X134.323 Y108.901 E.02231
G1 X134.236 Y108.857 E.00326
G1 X134.3 Y108.659 E.00692
G1 X134.485 Y108.688 E.00621
G3 X134.989 Y109.067 I-.017 J.547 E.02228
G1 X135.041 Y109.4 E.01119
G1 X134.9 Y109.446 E.00493
; WIPE_START
G1 X134.799 Y109.377 E-.04661
G1 X134.323 Y108.901 E-.25553
G1 X134.236 Y108.857 E-.03729
G1 X134.3 Y108.659 E-.07925
G1 X134.485 Y108.688 E-.07109
G1 X134.633 Y108.711 E-.05716
G1 X134.788 Y108.79 E-.06577
G1 X134.91 Y108.912 E-.0658
G1 X134.989 Y109.067 E-.06577
G1 X134.995 Y109.107 E-.01574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.943 Y116.74 Z2.6 F42000
G1 X134.903 Y122.482 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.633 Y122.689 I-.519 J-.399 E.01139
G1 X134.3 Y122.741 E.01119
G1 X134.236 Y122.543 E.00692
G1 X134.323 Y122.499 E.00325
G1 X134.799 Y122.023 E.02231
G1 X134.843 Y121.936 E.00326
G1 X135.041 Y122 E.00692
G1 X134.989 Y122.334 E.0112
G3 X134.937 Y122.433 I-.605 J-.25 E.00372
; WIPE_START
G1 X134.788 Y122.61 E-.0881
G1 X134.633 Y122.689 E-.06578
G1 X134.3 Y122.741 E-.12823
G1 X134.236 Y122.543 E-.07926
G1 X134.323 Y122.499 E-.03725
G1 X134.799 Y122.023 E-.25552
G1 X134.843 Y121.936 E-.0373
G1 X135.015 Y121.991 E-.06856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.382 Y121.961 Z2.6 F42000
M73 P66 R5
G1 X121.157 Y121.936 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.201 Y122.023 E.00325
G1 X121.677 Y122.499 E.0223
G1 X121.764 Y122.543 E.00326
G1 X121.7 Y122.742 E.00692
G1 X121.367 Y122.689 E.0112
G3 X121.011 Y122.334 I.25 J-.605 E.0171
G1 X120.959 Y122 E.0112
G1 X121.1 Y121.954 E.00493
; WIPE_START
G1 X121.201 Y122.023 E-.04664
G1 X121.677 Y122.499 E-.25549
G1 X121.764 Y122.543 E-.03729
G1 X121.7 Y122.742 E-.07927
G1 X121.367 Y122.689 E-.12825
G1 X121.212 Y122.61 E-.06576
G1 X121.09 Y122.488 E-.06579
G1 X121.011 Y122.334 E-.06576
G1 X121.005 Y122.293 E-.01575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.634 Y122.523 Z2.6 F42000
G1 X135.234 Y122.723 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.761 Y123.081 I-.871 J-.66 E.01993
G1 X134.415 Y123.135 E.01161
G1 X121.585 Y123.135 E.4256
G1 X121.239 Y123.081 E.01161
G3 X120.619 Y122.461 I.398 J-1.018 E.02992
G1 X120.565 Y122.115 E.01162
G1 X120.565 Y109.285 E.4256
G1 X120.619 Y108.939 E.01161
G3 X121.239 Y108.319 I1.018 J.398 E.02992
G1 X121.585 Y108.265 E.01161
G1 X134.415 Y108.265 E.4256
G1 X134.549 Y108.286 E.00448
G1 X134.761 Y108.319 E.00713
G3 X135.381 Y108.939 I-.385 J1.005 E.02995
G1 X135.435 Y109.285 E.01161
G1 X135.435 Y122.115 E.4256
G1 X135.381 Y122.461 E.01161
G3 X135.269 Y122.674 I-1.018 J-.398 E.008
M204 S250
G1 X135.568 Y122.957 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.565 Y122.963 E.00021
G1 X135.263 Y123.265 E.0131
G1 X134.884 Y123.458 E.0131
G1 X134.446 Y123.528 E.01361
G1 X121.554 Y123.528 E.39613
G1 X121.116 Y123.458 E.01361
G1 X120.737 Y123.265 E.0131
G1 X120.435 Y122.963 E.0131
G1 X120.242 Y122.584 E.0131
G1 X120.172 Y122.146 E.01361
G1 X120.172 Y109.254 E.39613
G1 X120.242 Y108.817 E.01361
G1 X120.435 Y108.437 E.0131
G1 X120.737 Y108.135 E.0131
G1 X121.116 Y107.942 E.0131
G1 X121.554 Y107.873 E.01361
G1 X134.446 Y107.873 E.39613
G1 X134.61 Y107.898 E.0051
G1 X134.884 Y107.942 E.00851
G1 X135.263 Y108.135 E.0131
G1 X135.565 Y108.437 E.0131
G1 X135.758 Y108.817 E.0131
G1 X135.828 Y109.254 E.01361
M73 P66 R4
G1 X135.828 Y122.146 E.39613
G1 X135.758 Y122.584 E.01361
G1 X135.595 Y122.904 E.01104
; WIPE_START
M204 S6000
G1 X135.565 Y122.963 E-.02541
G1 X135.263 Y123.265 E-.16199
G1 X134.884 Y123.458 E-.16196
G1 X134.446 Y123.528 E-.16836
G1 X133.808 Y123.528 E-.24228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.007 Y121.775 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.377356
G1 F10764.389
M204 S6000
G1 X135.069 Y121.386 E.01073
; LINE_WIDTH: 0.347637
G1 F11814.249
G1 X135.09 Y121.114 E.00677
; LINE_WIDTH: 0.282544
G1 F15000
G2 X135.112 Y120.823 I-3.74 J-.431 E.00569
G1 X135.112 Y110.558 E.20045
; LINE_WIDTH: 0.304821
G1 F13745.683
G1 X135.09 Y110.286 E.00582
; LINE_WIDTH: 0.347621
G1 F11814.894
G1 X135.069 Y110.014 E.00677
; LINE_WIDTH: 0.377368
G1 F10764.01
G1 X135.007 Y109.625 E.01073
; WIPE_START
G1 X135.069 Y110.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.075 Y108.693 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.377356
G1 F10764.389
M204 S6000
G1 X133.686 Y108.631 E.01073
; LINE_WIDTH: 0.347637
G1 F11814.249
G1 X133.414 Y108.61 E.00677
; LINE_WIDTH: 0.282544
G1 F15000
G2 X133.123 Y108.588 I-.431 J3.74 E.00569
G1 X122.858 Y108.588 E.20045
; LINE_WIDTH: 0.304821
G1 F13745.683
G1 X122.586 Y108.61 E.00582
; LINE_WIDTH: 0.347621
G1 F11814.894
G1 X122.314 Y108.631 E.00677
; LINE_WIDTH: 0.377368
G1 F10764.01
G1 X121.925 Y108.693 E.01073
; WIPE_START
G1 X122.314 Y108.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.993 Y109.625 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.377356
G1 F10764.389
M204 S6000
G1 X120.931 Y110.014 E.01073
; LINE_WIDTH: 0.347637
G1 F11814.249
G1 X120.91 Y110.286 E.00677
; LINE_WIDTH: 0.282544
G1 F15000
G2 X120.888 Y110.577 I3.74 J.431 E.00569
G1 X120.888 Y120.842 E.20045
; LINE_WIDTH: 0.304821
G1 F13745.683
G1 X120.91 Y121.114 E.00582
; LINE_WIDTH: 0.347621
G1 F11814.894
G1 X120.931 Y121.386 E.00677
; LINE_WIDTH: 0.377358
G1 F10764.328
G1 X120.993 Y121.775 E.01073
; WIPE_START
G1 X120.931 Y121.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.925 Y122.707 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.377356
G1 F10764.389
M204 S6000
G1 X122.314 Y122.769 E.01073
; LINE_WIDTH: 0.347637
G1 F11814.249
G1 X122.586 Y122.79 E.00677
; LINE_WIDTH: 0.304839
G1 F13744.71
G1 X122.858 Y122.812 E.00582
; LINE_WIDTH: 0.282544
G1 F15000
G1 X133.123 Y122.812 E.20045
G2 X133.414 Y122.79 I-.141 J-3.765 E.00569
; LINE_WIDTH: 0.347621
G1 F11814.894
G1 X133.686 Y122.769 E.00677
; LINE_WIDTH: 0.377368
G1 F10764.01
G1 X134.075 Y122.707 E.01073
; WIPE_START
G1 X133.686 Y122.769 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.729 Y116.965 Z2.6 F42000
G1 X126.062 Y113.841 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.126 Y113.768 E.00301
G3 X127.587 Y113.042 I1.869 J1.93 E.05093
G3 X128.229 Y113.021 I.405 J2.582 E.01978
G3 X125.903 Y114.012 I-.234 J2.677 E.43783
G1 X126.021 Y113.885 E.00533
; WIPE_START
M204 S6000
G1 X126.126 Y113.768 E-.05996
G1 X126.379 Y113.554 E-.12587
G1 X126.639 Y113.381 E-.11857
G1 X126.952 Y113.223 E-.1333
G1 X127.264 Y113.113 E-.12562
G1 X127.587 Y113.042 E-.1258
G1 X127.773 Y113.025 E-.07088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.505 Y113.272 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X130.425 Y115.192 E.08345
G1 X130.477 Y115.777
G1 X127.919 Y113.22 E.11114
G1 X127.451 Y113.284
G1 X130.417 Y116.251 E.1289
G1 X130.288 Y116.655
G1 X127.044 Y113.411 E.14096
G1 X126.694 Y113.594
G1 X130.105 Y117.005 E.14824
G1 X129.879 Y117.313
G1 X126.387 Y113.82 E.15178
G1 X126.119 Y114.086
G1 X129.616 Y117.583 E.15196
G1 X129.306 Y117.806
G1 X125.891 Y114.391 E.14839
G1 X125.713 Y114.746
G1 X128.953 Y117.986 E.1408
G1 X128.552 Y118.118
G1 X125.584 Y115.15 E.12897
G1 X125.523 Y115.623
G1 X128.076 Y118.176 E.11095
G1 X127.491 Y118.124
G1 X125.573 Y116.206 E.08337
; WIPE_START
M204 S6000
G1 X126.987 Y117.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.147 Y117.92 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107392
G1 F15000
M204 S6000
G1 X129.086 Y117.908 E.00032
G1 X128.997 Y117.968 E.00057
; WIPE_START
G1 X129.086 Y117.908 E-.4841
G1 X129.147 Y117.92 E-.2759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.311 Y117.379 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.272915
G1 F15000
M204 S6000
G2 X126.139 Y117.197 I-1.685 J1.418 E.00468
; LINE_WIDTH: 0.254423
G1 X126.044 Y117.084 E.00256
; LINE_WIDTH: 0.229313
G1 X125.948 Y116.971 E.00225
; LINE_WIDTH: 0.194672
G1 X125.822 Y116.801 E.00262
; LINE_WIDTH: 0.150488
G1 X125.695 Y116.631 E.00186
M204 S10000
G1 X127.078 Y118.003 F42000
; LINE_WIDTH: 0.094131
G1 F15000
M204 S6000
G1 X127.036 Y117.977 E.00021
; LINE_WIDTH: 0.124658
G1 X126.912 Y117.887 E.00102
; LINE_WIDTH: 0.17376
G1 X126.789 Y117.798 E.00163
; LINE_WIDTH: 0.213135
G1 X126.674 Y117.705 E.00206
; LINE_WIDTH: 0.242746
G1 X126.559 Y117.611 E.00241
; LINE_WIDTH: 0.268579
G1 X126.331 Y117.398 E.00573
; LINE_WIDTH: 0.259039
G1 X126.317 Y117.414 E.00037
; LINE_WIDTH: 0.217282
G1 X126.303 Y117.43 E.0003
; LINE_WIDTH: 0.172956
G1 X126.288 Y117.451 E.00028
; LINE_WIDTH: 0.126063
G1 X126.272 Y117.471 E.00018
; LINE_WIDTH: 0.07917
G1 X126.256 Y117.492 E.00008
; WIPE_START
G1 X126.272 Y117.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.302 Y114.776 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.110532
G1 F15000
M204 S6000
G1 X130.223 Y114.662 E.00076
; LINE_WIDTH: 0.155245
G1 X130.144 Y114.549 E.00126
; LINE_WIDTH: 0.194842
G1 X130.051 Y114.432 E.00185
; LINE_WIDTH: 0.229365
G1 X129.958 Y114.314 E.00228
; LINE_WIDTH: 0.263984
G2 X129.329 Y113.695 I-4.07 J3.505 E.01592
; LINE_WIDTH: 0.213286
G1 X129.209 Y113.603 E.00209
; LINE_WIDTH: 0.173955
G1 X129.09 Y113.511 E.00161
; LINE_WIDTH: 0.137759
G1 X129.009 Y113.457 E.00076
; LINE_WIDTH: 0.104696
G1 X128.928 Y113.402 E.00049
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.009 Y113.457 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 12/36
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-1.186 J.275 P1  F42000
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
M73 P67 R4
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
G1 X137.549 Y139.808 Z2.8 F42000
G1 X133.699 Y108.96 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X134.132 Y109.18 E.01611
G1 X134.52 Y109.568 E.01822
G1 X134.769 Y110.058 E.01821
G1 X134.848 Y110.553 E.01662
G1 X134.848 Y120.847 E.34149
G1 X134.769 Y121.342 E.01662
G1 X134.52 Y121.832 E.01821
G1 X134.132 Y122.22 E.01821
G1 X133.642 Y122.469 E.01821
G1 X133.147 Y122.548 E.01662
G1 X122.853 Y122.548 E.34149
G1 X122.358 Y122.469 E.01662
G1 X121.868 Y122.22 E.01821
G1 X121.48 Y121.832 E.01821
G1 X121.231 Y121.342 E.01821
G1 X121.152 Y120.847 E.01662
G1 X121.152 Y110.553 E.34149
G1 X121.231 Y110.058 E.01663
G1 X121.48 Y109.568 E.01821
G1 X121.868 Y109.18 E.01821
G1 X122.358 Y108.931 E.01822
G1 X122.853 Y108.852 E.01662
G1 X133.147 Y108.852 E.34149
G1 X133.642 Y108.931 E.01663
G1 X133.645 Y108.932 E.00011
M204 S250
G1 X133.521 Y109.309 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.898 Y109.501 E.01301
G1 X134.199 Y109.802 E.01306
G1 X134.392 Y110.18 E.01306
G1 X134.455 Y110.584 E.01254
G1 X134.455 Y120.817 E.31443
G1 X134.392 Y121.22 E.01254
G1 X134.199 Y121.598 E.01306
G1 X133.898 Y121.899 E.01306
G1 X133.52 Y122.092 E.01306
G1 X133.117 Y122.155 E.01254
G1 X122.883 Y122.155 E.31443
G1 X122.48 Y122.092 E.01254
G1 X122.102 Y121.899 E.01306
G1 X121.801 Y121.598 E.01306
G1 X121.608 Y121.22 E.01306
G1 X121.545 Y120.817 E.01254
G1 X121.545 Y110.584 E.31443
G1 X121.608 Y110.18 E.01254
G1 X121.801 Y109.802 E.01305
G1 X122.102 Y109.501 E.01305
G1 X122.48 Y109.308 E.01306
G1 X122.883 Y109.245 E.01254
G1 X133.117 Y109.245 E.31443
G1 X133.462 Y109.299 E.01074
; WIPE_START
M204 S6000
G1 X133.898 Y109.501 E-.18279
G1 X134.199 Y109.802 E-.16146
G1 X134.392 Y110.18 E-.16146
G1 X134.455 Y110.584 E-.15511
G1 X134.455 Y110.845 E-.09918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.92 Y109.63 Z2.8 F42000
G1 X121.687 Y108.786 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.086 Y109.387 E.02821
G1 X120.928 Y109.307 E.00589
G1 X120.97 Y109.036 E.00907
G3 X121.336 Y108.67 I.593 J.227 E.01768
G1 X121.607 Y108.628 E.00908
G1 X121.66 Y108.732 E.0039
; WIPE_START
G1 X121.086 Y109.387 E-.33095
G1 X120.928 Y109.307 E-.06743
G1 X120.97 Y109.036 E-.10394
G1 X121.051 Y108.877 E-.06779
G1 X121.177 Y108.751 E-.06774
G1 X121.336 Y108.67 E-.06777
G1 X121.478 Y108.648 E-.05438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.099 Y109.067 Z2.8 F42000
G1 X134.914 Y109.387 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X134.313 Y108.786 E.02821
G1 X134.393 Y108.628 E.00589
G1 X134.527 Y108.649 E.00449
G3 X135.03 Y109.036 I-.03 J.559 E.02238
G1 X135.072 Y109.307 E.00908
G1 X134.968 Y109.36 E.0039
; WIPE_START
G1 X134.313 Y108.786 E-.33096
G1 X134.393 Y108.628 E-.06742
G1 X134.527 Y108.649 E-.05141
G1 X134.664 Y108.67 E-.05255
G1 X134.823 Y108.751 E-.06778
G1 X134.949 Y108.878 E-.06776
G1 X135.03 Y109.036 E-.06774
G1 X135.052 Y109.178 E-.05438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.99 Y116.81 Z2.8 F42000
G1 X134.944 Y122.519 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.664 Y122.73 I-.507 J-.382 E.01178
G1 X134.393 Y122.772 E.00908
G1 X134.313 Y122.614 E.00589
G1 X134.914 Y122.013 E.02821
G1 X135.072 Y122.093 E.00589
G1 X135.03 Y122.364 E.00907
G3 X134.977 Y122.469 I-.593 J-.227 E.00391
; WIPE_START
G1 X134.823 Y122.649 E-.09006
G1 X134.664 Y122.73 E-.06777
G1 X134.393 Y122.772 E-.10396
G1 X134.313 Y122.614 E-.06743
G1 X134.914 Y122.013 E-.3232
G1 X135.072 Y122.093 E-.06742
G1 X135.056 Y122.198 E-.04015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.424 Y122.097 Z2.8 F42000
G1 X121.086 Y122.013 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.687 Y122.614 E.02821
G1 X121.607 Y122.772 E.00589
G1 X121.336 Y122.73 E.00907
G3 X120.97 Y122.364 I.227 J-.593 E.01768
G1 X120.928 Y122.093 E.00908
G1 X121.032 Y122.04 E.0039
; WIPE_START
G1 X121.687 Y122.614 E-.33096
G1 X121.607 Y122.772 E-.06743
G1 X121.336 Y122.73 E-.10396
G1 X121.177 Y122.649 E-.06777
G1 X121.051 Y122.523 E-.06776
G1 X120.97 Y122.364 E-.06774
G1 X120.948 Y122.222 E-.05438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.575 Y122.511 Z2.8 F42000
G1 X135.282 Y122.765 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X135.065 Y122.982 E.01019
G1 X134.791 Y123.122 E.01019
G1 X134.44 Y123.177 E.01179
G1 X121.56 Y123.177 E.42726
G1 X121.209 Y123.122 E.01179
G1 X120.935 Y122.982 E.01019
G1 X120.718 Y122.765 E.01019
G1 X120.578 Y122.491 E.01019
G1 X120.523 Y122.14 E.01179
G1 X120.523 Y109.26 E.42726
G1 X120.578 Y108.909 E.01179
G1 X120.718 Y108.635 E.01019
G1 X120.935 Y108.418 E.01019
G1 X121.209 Y108.279 E.01019
G1 X121.56 Y108.223 E.01179
G1 X134.44 Y108.223 E.42726
G1 X134.591 Y108.247 E.00506
G1 X134.791 Y108.278 E.00672
G1 X135.065 Y108.418 E.01019
G1 X135.282 Y108.635 E.01019
G1 X135.422 Y108.909 E.01019
G1 X135.477 Y109.26 E.01179
G1 X135.477 Y122.14 E.42726
G1 X135.422 Y122.491 E.01179
G1 X135.309 Y122.711 E.0082
M204 S250
G1 X135.606 Y122.992 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.603 Y122.998 E.0002
G1 X135.298 Y123.303 E.01326
G1 X134.914 Y123.499 E.01326
G1 X134.471 Y123.569 E.01377
G1 X121.529 Y123.569 E.39767
G1 X121.086 Y123.499 E.01377
G1 X120.702 Y123.303 E.01326
G1 X120.397 Y122.998 E.01326
G1 X120.201 Y122.614 E.01326
G1 X120.131 Y122.171 E.01377
G1 X120.131 Y109.229 E.39767
G1 X120.201 Y108.786 E.01377
G1 X120.397 Y108.402 E.01326
G1 X120.702 Y108.097 E.01326
G1 X121.086 Y107.901 E.01326
G1 X121.529 Y107.831 E.01377
G1 X134.471 Y107.831 E.39767
G1 X134.652 Y107.86 E.00564
G1 X134.914 Y107.901 E.00814
G1 X135.298 Y108.097 E.01326
G1 X135.603 Y108.402 E.01326
G1 X135.799 Y108.786 E.01326
G1 X135.869 Y109.229 E.01377
G1 X135.869 Y122.171 E.39767
G1 X135.799 Y122.614 E.01377
G1 X135.633 Y122.939 E.01121
; WIPE_START
M204 S6000
G1 X135.603 Y122.998 E-.02528
G1 X135.298 Y123.303 E-.16396
G1 X134.914 Y123.499 E-.16394
M73 P68 R4
G1 X134.471 Y123.569 E-.17035
G1 X133.849 Y123.569 E-.23647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.051 Y121.854 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.361236
G1 F11309.523
M204 S6000
G1 X135.118 Y121.43 E.01113
; LINE_WIDTH: 0.331682
G1 F12467.029
G1 X135.14 Y121.156 E.00648
; LINE_WIDTH: 0.266038
G1 F15000
G2 X135.162 Y120.863 I-3.718 J-.431 E.00533
G1 X135.162 Y110.519 E.18807
; LINE_WIDTH: 0.288437
G1 F14662.949
G1 X135.14 Y110.244 E.00551
; LINE_WIDTH: 0.331679
G1 F12467.147
G1 X135.118 Y109.97 E.00648
; LINE_WIDTH: 0.361241
G1 F11309.335
G1 X135.051 Y109.546 E.01113
M204 S10000
G1 X134.154 Y108.649 F42000
; LINE_WIDTH: 0.36126
G1 F11308.691
M204 S6000
G1 X133.73 Y108.582 E.01113
; LINE_WIDTH: 0.331694
G1 F12466.504
G1 X133.456 Y108.56 E.00648
; LINE_WIDTH: 0.266029
G1 F15000
G2 X133.163 Y108.538 I-.426 J3.661 E.00533
G1 X122.819 Y108.538 E.18806
; LINE_WIDTH: 0.288445
G1 F14662.508
G1 X122.544 Y108.56 E.00551
; LINE_WIDTH: 0.331695
G1 F12466.465
G1 X122.27 Y108.582 E.00648
; LINE_WIDTH: 0.361253
G1 F11308.929
G1 X121.846 Y108.649 E.01113
M204 S10000
G1 X120.949 Y109.546 F42000
; LINE_WIDTH: 0.361232
G1 F11309.678
M204 S6000
G1 X120.882 Y109.97 E.01113
; LINE_WIDTH: 0.331682
G1 F12467.029
G1 X120.86 Y110.244 E.00648
; LINE_WIDTH: 0.266039
G1 F15000
G2 X120.838 Y110.537 I3.719 J.431 E.00533
G1 X120.838 Y120.881 E.18807
; LINE_WIDTH: 0.288437
G1 F14662.949
G1 X120.86 Y121.156 E.00551
; LINE_WIDTH: 0.331679
G1 F12467.147
G1 X120.882 Y121.43 E.00648
; LINE_WIDTH: 0.361231
G1 F11309.69
G1 X120.949 Y121.854 E.01113
M204 S10000
G1 X121.846 Y122.751 F42000
; LINE_WIDTH: 0.361236
G1 F11309.523
M204 S6000
G1 X122.27 Y122.818 E.01113
; LINE_WIDTH: 0.331682
G1 F12467.029
G1 X122.544 Y122.84 E.00648
; LINE_WIDTH: 0.288441
G1 F14662.724
G1 X122.819 Y122.862 E.00551
; LINE_WIDTH: 0.266038
G1 F15000
G1 X133.163 Y122.862 E.18807
G2 X133.456 Y122.84 I-.139 J-3.741 E.00533
; LINE_WIDTH: 0.331679
G1 F12467.147
G1 X133.73 Y122.818 E.00648
; LINE_WIDTH: 0.361231
G1 F11309.69
G1 X134.154 Y122.751 E.01113
; WIPE_START
G1 X133.73 Y122.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.84 Y116.959 Z2.8 F42000
G1 X126.723 Y114.423 Z2.8
G1 Z2.4
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
G1 X129.277 Y113.792 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02115
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 X129.494 Y113.956 E-.09156
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13182
G1 X129.277 Y114.423 E-.24234
G1 X129.277 Y113.931 E-.18684
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
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13183
G1 X129.494 Y117.444 E-.10743
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.285 J-2.993 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16103
G1 X126.062 Y116.977 E-.1912
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.165 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.318 Y115.886 I-.895 J2.533 E.35526
G3 X128.228 Y113.021 I2.69 J-.177 E.14235
G3 X128.837 Y113.146 I-.23 J2.677 E.01913
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.1485
G1 X129.486 Y113.458 E-.12585
G1 X129.75 Y113.658 E-.12584
G1 X129.988 Y113.888 E-.12583
G1 X130.195 Y114.146 E-.12585
G1 X130.345 Y114.388 E-.10813
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
G3 Z2.8 I-1.194 J.235 P1  F42000
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
G3 X117.892 Y127.645 I19.853 J5.889 E.03501
M204 S10000
G1 X138.108 Y127.645 F42000
; LINE_WIDTH: 0.390663
G1 F10352.487
M204 S6000
M73 P69 R4
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
G1 X137.537 Y139.805 Z3 F42000
G1 X133.624 Y108.864 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X133.688 Y108.874 E.00213
G1 X134.182 Y109.125 E.0184
G1 X134.575 Y109.518 E.0184
G1 X134.826 Y110.012 E.0184
G1 X134.906 Y110.513 E.01681
G1 X134.906 Y120.887 E.34415
G1 X134.826 Y121.388 E.01681
G1 X134.575 Y121.882 E.0184
G1 X134.182 Y122.275 E.0184
G1 X133.688 Y122.526 E.0184
G1 X133.187 Y122.606 E.01681
G1 X122.813 Y122.606 E.34415
G1 X122.312 Y122.526 E.01681
G1 X121.818 Y122.275 E.0184
G1 X121.425 Y121.882 E.0184
G1 X121.174 Y121.388 E.0184
G1 X121.094 Y120.887 E.01681
G1 X121.094 Y110.513 E.34415
G1 X121.174 Y110.012 E.01681
G1 X121.425 Y109.518 E.0184
G1 X121.818 Y109.125 E.0184
G1 X122.312 Y108.874 E.0184
G1 X122.813 Y108.794 E.01681
G1 X133.187 Y108.794 E.34415
G1 X133.565 Y108.854 E.01269
M204 S250
G1 X133.563 Y109.251 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.565 Y109.251 E.00007
G1 X133.949 Y109.447 E.01323
G1 X134.253 Y109.751 E.01323
G1 X134.449 Y110.135 E.01323
G1 X134.514 Y110.544 E.01272
G1 X134.514 Y120.857 E.31689
G1 X134.449 Y121.265 E.01272
G1 X134.253 Y121.649 E.01323
G1 X133.949 Y121.953 E.01323
G1 X133.565 Y122.149 E.01323
G1 X133.157 Y122.214 E.01272
G1 X122.843 Y122.214 E.31689
G1 X122.435 Y122.149 E.01272
G1 X122.051 Y121.953 E.01323
G1 X121.747 Y121.649 E.01323
G1 X121.551 Y121.265 E.01323
G1 X121.486 Y120.857 E.01272
G1 X121.486 Y110.544 E.31689
G1 X121.551 Y110.135 E.01272
G1 X121.747 Y109.751 E.01323
G1 X122.051 Y109.447 E.01323
G1 X122.435 Y109.251 E.01323
G1 X122.843 Y109.186 E.01272
G1 X133.157 Y109.186 E.31689
G1 X133.504 Y109.241 E.01081
; WIPE_START
M204 S6000
G1 X133.565 Y109.251 E-.02365
G1 X133.949 Y109.447 E-.16361
G1 X134.253 Y109.751 E-.16363
G1 X134.449 Y110.135 E-.16361
G1 X134.514 Y110.544 E-.15727
G1 X134.514 Y110.776 E-.08822
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.973 Y109.592 Z3 F42000
G1 X121.616 Y108.751 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.051 Y109.316 E.02649
G1 X120.893 Y109.236 E.00589
G3 X121.536 Y108.593 I.632 J-.011 E.03362
G1 X121.589 Y108.698 E.0039
; WIPE_START
G1 X121.051 Y109.316 E-.31129
G1 X120.893 Y109.236 E-.06743
G1 X120.93 Y109.006 E-.08823
G1 X121.013 Y108.843 E-.06974
G1 X121.143 Y108.713 E-.06976
G1 X121.306 Y108.63 E-.06973
G1 X121.524 Y108.595 E-.08383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.146 Y109.004 Z3 F42000
G1 X134.949 Y109.316 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X134.384 Y108.751 E.02649
G1 X134.464 Y108.593 E.00589
G1 X134.569 Y108.61 E.00352
G3 X135.107 Y109.236 I-.071 J.605 E.03006
G1 X135.002 Y109.289 E.0039
; WIPE_START
G1 X134.384 Y108.751 E-.3113
G1 X134.464 Y108.593 E-.06743
G1 X134.569 Y108.61 E-.04029
G1 X134.694 Y108.63 E-.04796
G1 X134.857 Y108.713 E-.06972
G1 X134.987 Y108.843 E-.06975
G1 X135.07 Y109.006 E-.06975
G1 X135.105 Y109.224 E-.0838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.034 Y116.856 Z3 F42000
G1 X134.981 Y122.553 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.464 Y122.807 I-.506 J-.378 E.01983
G1 X134.384 Y122.649 E.00589
G1 X134.949 Y122.084 E.02649
G1 X135.107 Y122.164 E.00589
G3 X135.015 Y122.503 I-.632 J.011 E.0118
; WIPE_START
G1 X134.857 Y122.687 E-.09203
G1 X134.694 Y122.77 E-.06973
G1 X134.464 Y122.807 E-.08823
G1 X134.384 Y122.649 E-.06743
G1 X134.949 Y122.084 E-.30349
G1 X135.107 Y122.164 E-.06743
G1 X135.077 Y122.351 E-.07166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.446 Y122.206 Z3 F42000
G1 X121.051 Y122.084 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.616 Y122.649 E.02649
G1 X121.536 Y122.807 E.00589
G3 X120.893 Y122.164 I-.011 J-.632 E.03362
G1 X120.998 Y122.111 E.0039
; WIPE_START
G1 X121.616 Y122.649 E-.31129
G1 X121.536 Y122.807 E-.06743
G1 X121.306 Y122.77 E-.08823
G1 X121.143 Y122.687 E-.06974
G1 X121.013 Y122.557 E-.06977
G1 X120.93 Y122.394 E-.06971
G1 X120.895 Y122.176 E-.08384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.52 Y122.506 Z3 F42000
G1 X135.321 Y122.8 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X135.1 Y123.021 E.01037
G1 X134.821 Y123.162 E.01036
G1 X134.465 Y123.219 E.01196
G1 X121.535 Y123.219 E.42892
G1 X121.179 Y123.162 E.01196
G1 X120.9 Y123.021 E.01036
G1 X120.679 Y122.8 E.01037
G1 X120.538 Y122.521 E.01036
G1 X120.481 Y122.165 E.01196
G1 X120.481 Y109.235 E.42892
G1 X120.538 Y108.879 E.01196
G1 X120.679 Y108.6 E.01036
G1 X120.9 Y108.379 E.01037
G1 X121.179 Y108.238 E.01036
G1 X121.535 Y108.181 E.01196
G1 X134.465 Y108.181 E.42892
G1 X134.633 Y108.208 E.00563
G1 X134.821 Y108.238 E.00632
G1 X135.1 Y108.379 E.01036
G1 X135.321 Y108.6 E.01037
G1 X135.462 Y108.879 E.01037
G1 X135.519 Y109.235 E.01196
G1 X135.519 Y122.165 E.42892
G1 X135.462 Y122.521 E.01196
G1 X135.348 Y122.746 E.00837
M204 S250
G1 X135.644 Y123.028 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.642 Y123.033 E.00018
G1 X135.333 Y123.342 E.01342
G1 X134.944 Y123.54 E.01342
G1 X134.496 Y123.611 E.01393
G1 X121.504 Y123.611 E.3992
G1 X121.056 Y123.54 E.01393
G1 X120.667 Y123.342 E.01342
G1 X120.358 Y123.033 E.01342
G1 X120.16 Y122.644 E.01342
G1 X120.089 Y122.196 E.01393
G1 X120.089 Y109.204 E.3992
G1 X120.16 Y108.756 E.01393
G1 X120.358 Y108.367 E.01342
G1 X120.667 Y108.058 E.01342
G1 X121.056 Y107.86 E.01342
G1 X121.504 Y107.789 E.01393
G1 X134.496 Y107.789 E.3992
G1 X134.694 Y107.821 E.00617
G1 X134.944 Y107.86 E.00776
G1 X135.333 Y108.058 E.01342
G1 X135.642 Y108.367 E.01342
G1 X135.84 Y108.756 E.01342
G1 X135.911 Y109.204 E.01393
G1 X135.911 Y122.196 E.3992
G1 X135.84 Y122.644 E.01393
G1 X135.672 Y122.974 E.01139
; WIPE_START
M204 S6000
G1 X135.642 Y123.033 E-.02507
G1 X135.333 Y123.342 E-.16595
G1 X134.944 Y123.54 E-.16593
G1 X134.496 Y123.611 E-.17231
G1 X133.889 Y123.611 E-.23074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.095 Y121.93 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.345116
G1 F11912.817
M204 S6000
G1 X135.168 Y121.475 E.01136
; LINE_WIDTH: 0.315737
G1 F13195.69
G1 X135.19 Y121.197 E.00619
; LINE_WIDTH: 0.249513
G1 F15000
G2 X135.212 Y120.903 I-3.686 J-.43 E.00496
G1 X135.212 Y110.48 E.17547
; LINE_WIDTH: 0.272041
G1 X135.19 Y110.203 E.0052
; LINE_WIDTH: 0.315734
G1 F13195.825
G1 X135.168 Y109.925 E.00619
; LINE_WIDTH: 0.345115
G1 F11912.868
G1 X135.095 Y109.47 E.01136
M204 S10000
G1 X134.23 Y108.605 F42000
; LINE_WIDTH: 0.345116
G1 F11912.817
M204 S6000
G1 X133.775 Y108.532 E.01135
; LINE_WIDTH: 0.315737
G1 F13195.69
G1 X133.497 Y108.51 E.00619
; LINE_WIDTH: 0.249513
G1 F15000
G2 X133.203 Y108.488 I-.43 J3.686 E.00496
G1 X122.78 Y108.488 E.17547
; LINE_WIDTH: 0.272041
G1 X122.503 Y108.51 E.0052
; LINE_WIDTH: 0.315734
G1 F13195.825
G1 X122.225 Y108.532 E.00619
; LINE_WIDTH: 0.345115
G1 F11912.868
G1 X121.77 Y108.605 E.01136
M204 S10000
G1 X120.905 Y109.47 F42000
; LINE_WIDTH: 0.345116
G1 F11912.817
M204 S6000
G1 X120.832 Y109.925 E.01136
; LINE_WIDTH: 0.315737
G1 F13195.69
G1 X120.81 Y110.203 E.00619
; LINE_WIDTH: 0.249513
G1 F15000
G2 X120.788 Y110.497 I3.686 J.43 E.00496
G1 X120.788 Y120.92 E.17547
; LINE_WIDTH: 0.272041
G1 X120.81 Y121.197 E.0052
; LINE_WIDTH: 0.315734
G1 F13195.825
G1 X120.832 Y121.475 E.00619
; LINE_WIDTH: 0.345115
G1 F11912.868
G1 X120.905 Y121.93 E.01136
M204 S10000
G1 X121.77 Y122.795 F42000
; LINE_WIDTH: 0.345116
G1 F11912.817
M204 S6000
G1 X122.225 Y122.868 E.01136
; LINE_WIDTH: 0.315737
G1 F13195.69
G1 X122.503 Y122.89 E.00619
; LINE_WIDTH: 0.272032
G1 F15000
G1 X122.78 Y122.912 E.0052
; LINE_WIDTH: 0.249513
G1 X133.203 Y122.912 E.17547
G2 X133.497 Y122.89 I-.136 J-3.706 E.00496
; LINE_WIDTH: 0.315734
G1 F13195.825
G1 X133.775 Y122.868 E.00619
; LINE_WIDTH: 0.345115
G1 F11912.868
G1 X134.23 Y122.795 E.01136
; WIPE_START
G1 X133.775 Y122.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.883 Y117.009 Z3 F42000
G1 X126.723 Y114.423 Z3
G1 Z2.6
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
G1 X129.277 Y113.792 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.677 J1.933 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10747
G1 X129.915 Y114.423 E-.13182
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3 F42000
G1 Z2.6
M73 P70 R4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02115
G1 X129.697 Y117.248 E.01152
G1 X129.69 Y117.254 E.00031
G3 X129.277 Y117.608 I-1.639 J-1.494 E.01811
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.248 E-.13194
G1 X129.69 Y117.254 E-.00352
G1 X129.494 Y117.444 E-.1038
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01406
G1 X126.062 Y116.977 E.01669
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19117
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.166 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X129.964 Y117.535 I-.898 J2.536 E.16367
G3 X128.215 Y113.021 I-1.962 J-1.836 E.33347
G3 X128.836 Y113.147 I-.22 J2.681 E.01953
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14848
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10815
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 14/36
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S196.35
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-1.194 J.236 P1  F42000
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
M73 P71 R4
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
G1 X135.543 Y120.456 Z3.2 F42000
G1 X133.666 Y108.806 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X133.734 Y108.816 E.00227
G1 X134.233 Y109.071 E.01859
G1 X134.629 Y109.467 E.01859
G1 X134.884 Y109.966 E.01859
G1 X134.964 Y110.473 E.017
M73 P72 R4
G1 X134.964 Y120.927 E.3468
G1 X134.884 Y121.434 E.017
G1 X134.629 Y121.933 E.01859
G1 X134.233 Y122.329 E.01859
G1 X133.734 Y122.584 E.01859
G1 X133.227 Y122.664 E.017
G1 X122.773 Y122.664 E.3468
G1 X122.266 Y122.584 E.017
G1 X121.767 Y122.329 E.01859
G1 X121.371 Y121.933 E.01859
G1 X121.116 Y121.434 E.01859
G1 X121.036 Y120.927 E.017
G1 X121.036 Y110.473 E.3468
G1 X121.116 Y109.966 E.017
G1 X121.371 Y109.467 E.01859
G1 X121.767 Y109.071 E.01859
G1 X122.266 Y108.816 E.01859
G1 X122.773 Y108.736 E.017
G1 X133.227 Y108.736 E.3468
G1 X133.607 Y108.796 E.01274
M204 S250
G1 X133.605 Y109.193 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.611 Y109.194 E.00019
G1 X134 Y109.392 E.01341
G1 X134.308 Y109.7 E.01341
G1 X134.506 Y110.089 E.0134
G1 X134.572 Y110.503 E.01289
G1 X134.572 Y120.897 E.31935
G1 X134.506 Y121.311 E.01289
G1 X134.308 Y121.7 E.01341
G1 X134 Y122.008 E.01341
G1 X133.611 Y122.206 E.0134
G1 X133.197 Y122.272 E.01289
G1 X122.803 Y122.272 E.31935
G1 X122.389 Y122.206 E.01289
G1 X122 Y122.008 E.01341
G1 X121.692 Y121.7 E.01341
G1 X121.494 Y121.311 E.0134
G1 X121.428 Y120.897 E.01289
G1 X121.428 Y110.504 E.31935
G1 X121.494 Y110.089 E.01289
G1 X121.692 Y109.7 E.01341
G1 X122 Y109.392 E.01341
G1 X122.389 Y109.194 E.0134
G1 X122.803 Y109.128 E.01289
G1 X133.197 Y109.128 E.31935
G1 X133.545 Y109.183 E.01086
; WIPE_START
M204 S6000
G1 X133.611 Y109.194 E-.02517
G1 X134 Y109.392 E-.16579
G1 X134.308 Y109.7 E-.16579
G1 X134.506 Y110.089 E-.16578
G1 X134.572 Y110.503 E-.15943
G1 X134.572 Y110.709 E-.07806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.027 Y109.555 Z3.2 F42000
G1 X121.545 Y108.717 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X121.017 Y109.245 E.02477
G1 X120.859 Y109.165 E.00589
G3 X121.465 Y108.559 I.623 J.017 E.03133
G1 X121.518 Y108.664 E.0039
; WIPE_START
G1 X121.017 Y109.245 E-.29166
G1 X120.859 Y109.165 E-.06742
G1 X120.889 Y108.976 E-.0725
G1 X120.974 Y108.808 E-.07173
G1 X121.108 Y108.674 E-.07172
G1 X121.276 Y108.589 E-.07173
G1 X121.465 Y108.559 E-.0725
G1 X121.513 Y108.654 E-.04072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.138 Y108.989 Z3.2 F42000
G1 X134.983 Y109.245 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X134.455 Y108.717 E.02478
G1 X134.535 Y108.559 E.00589
G1 X134.724 Y108.589 E.00633
G3 X135.141 Y109.165 I-.188 J.575 E.02521
G1 X135.036 Y109.218 E.0039
; WIPE_START
G1 X134.455 Y108.717 E-.29167
G1 X134.535 Y108.559 E-.06743
G1 X134.724 Y108.589 E-.07251
G1 X134.892 Y108.674 E-.07173
G1 X135.026 Y108.808 E-.07172
G1 X135.111 Y108.976 E-.07173
G1 X135.141 Y109.165 E-.0725
G1 X135.046 Y109.213 E-.04071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.031 Y116.846 Z3.2 F42000
G1 X135.02 Y122.588 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G3 X134.535 Y122.841 I-.502 J-.37 E.01877
G1 X134.455 Y122.683 E.00589
G1 X134.983 Y122.155 E.02477
G1 X135.141 Y122.235 E.00589
G3 X135.053 Y122.538 I-.623 J-.017 E.01056
; WIPE_START
G1 X134.892 Y122.726 E-.09396
G1 X134.724 Y122.811 E-.07173
G1 X134.535 Y122.841 E-.0725
G1 X134.455 Y122.683 E-.06742
G1 X134.983 Y122.155 E-.28381
G1 X135.141 Y122.235 E-.06742
G1 X135.111 Y122.424 E-.0725
G1 X135.075 Y122.496 E-.03064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.444 Y122.311 Z3.2 F42000
G1 X121.017 Y122.155 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X121.545 Y122.683 E.02477
G1 X121.465 Y122.841 E.00589
G3 X120.859 Y122.235 I.017 J-.623 E.03133
G1 X120.964 Y122.182 E.0039
; WIPE_START
G1 X121.545 Y122.683 E-.29166
G1 X121.465 Y122.841 E-.06742
G1 X121.276 Y122.811 E-.0725
G1 X121.108 Y122.726 E-.07173
G1 X120.974 Y122.592 E-.07172
G1 X120.889 Y122.424 E-.07173
G1 X120.859 Y122.235 E-.0725
G1 X120.954 Y122.187 E-.04072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.579 Y122.53 Z3.2 F42000
G1 X135.359 Y122.834 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X135.134 Y123.059 E.01054
G1 X134.851 Y123.203 E.01054
G1 X134.49 Y123.26 E.01213
G1 X121.51 Y123.26 E.43058
G1 X121.149 Y123.203 E.01213
G1 X120.866 Y123.059 E.01054
G1 X120.641 Y122.834 E.01054
G1 X120.497 Y122.551 E.01054
G1 X120.44 Y122.19 E.01213
G1 X120.44 Y109.21 E.43058
G1 X120.497 Y108.849 E.01213
G1 X120.641 Y108.566 E.01054
G1 X120.866 Y108.341 E.01054
G1 X121.149 Y108.197 E.01054
G1 X121.51 Y108.14 E.01213
G1 X134.49 Y108.14 E.43058
G1 X134.675 Y108.169 E.00621
G1 X134.851 Y108.197 E.00592
G1 X135.134 Y108.341 E.01054
G1 X135.359 Y108.566 E.01054
G1 X135.503 Y108.849 E.01054
G1 X135.56 Y109.21 E.01213
G1 X135.56 Y122.19 E.43058
G1 X135.503 Y122.551 E.01213
G1 X135.386 Y122.781 E.00855
M204 S250
G1 X135.683 Y123.063 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.68 Y123.068 E.00016
G1 X135.368 Y123.38 E.01358
G1 X134.974 Y123.581 E.01358
G1 X134.521 Y123.653 E.01409
G1 X121.479 Y123.653 E.40074
G1 X121.026 Y123.581 E.01409
G1 X120.632 Y123.38 E.01358
G1 X120.32 Y123.068 E.01358
G1 X120.119 Y122.674 E.01358
G1 X120.047 Y122.221 E.01409
G1 X120.047 Y109.179 E.40074
G1 X120.119 Y108.726 E.01409
G1 X120.32 Y108.332 E.01358
G1 X120.632 Y108.02 E.01358
G1 X121.026 Y107.819 E.01358
G1 X121.479 Y107.748 E.01409
G1 X134.521 Y107.748 E.40074
G1 X134.736 Y107.782 E.0067
G1 X134.974 Y107.819 E.00739
G1 X135.368 Y108.02 E.01358
G1 X135.68 Y108.332 E.01358
G1 X135.881 Y108.726 E.01358
G1 X135.953 Y109.179 E.01409
G1 X135.953 Y122.221 E.40074
G1 X135.881 Y122.674 E.01409
G1 X135.71 Y123.01 E.01157
; WIPE_START
M204 S6000
G1 X135.68 Y123.068 E-.0248
G1 X135.368 Y123.38 E-.16792
G1 X134.974 Y123.581 E-.16793
G1 X134.521 Y123.653 E-.17429
G1 X133.929 Y123.653 E-.22507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.14 Y122.006 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.328977
G1 F12584.932
M204 S6000
G1 X135.217 Y121.519 E.0115
; LINE_WIDTH: 0.299787
G1 F14015.077
G1 X135.24 Y121.239 E.00589
; LINE_WIDTH: 0.233008
G1 F15000
G2 X135.262 Y120.943 I-3.773 J-.438 E.00459
G1 X135.262 Y110.442 E.16267
; LINE_WIDTH: 0.255635
G1 X135.24 Y110.161 E.00488
; LINE_WIDTH: 0.299772
G1 F14015.873
G1 X135.217 Y109.881 E.00589
; LINE_WIDTH: 0.328978
G1 F12584.884
G1 X135.14 Y109.394 E.0115
; WIPE_START
G1 X135.217 Y109.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.306 Y108.56 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.328977
G1 F12584.932
M204 S6000
G1 X133.819 Y108.483 E.0115
; LINE_WIDTH: 0.299787
G1 F14015.077
G1 X133.539 Y108.461 E.00589
; LINE_WIDTH: 0.233008
G1 F15000
G2 X133.243 Y108.438 I-.438 J3.773 E.00459
G1 X122.742 Y108.438 E.16267
; LINE_WIDTH: 0.255635
G1 X122.461 Y108.461 E.00488
; LINE_WIDTH: 0.299772
G1 F14015.873
G1 X122.181 Y108.483 E.00589
; LINE_WIDTH: 0.328978
G1 F12584.884
G1 X121.694 Y108.56 E.0115
; WIPE_START
G1 X122.181 Y108.483 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.86 Y109.394 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.328977
G1 F12584.932
M204 S6000
G1 X120.783 Y109.881 E.0115
; LINE_WIDTH: 0.299787
G1 F14015.077
G1 X120.76 Y110.161 E.00589
; LINE_WIDTH: 0.233008
G1 F15000
G2 X120.738 Y110.457 I3.773 J.438 E.00459
G1 X120.738 Y120.958 E.16267
; LINE_WIDTH: 0.255635
G1 X120.76 Y121.239 E.00488
; LINE_WIDTH: 0.299772
G1 F14015.873
G1 X120.783 Y121.519 E.00589
; LINE_WIDTH: 0.328978
G1 F12584.884
G1 X120.86 Y122.006 E.0115
; WIPE_START
G1 X120.783 Y121.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.694 Y122.84 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.328977
G1 F12584.932
M204 S6000
G1 X122.181 Y122.917 E.0115
; LINE_WIDTH: 0.299787
G1 F14015.077
G1 X122.461 Y122.94 E.00589
; LINE_WIDTH: 0.255649
G1 F15000
G1 X122.742 Y122.962 E.00488
; LINE_WIDTH: 0.233007
G1 X133.243 Y122.962 E.16267
G2 X133.539 Y122.94 I-.143 J-3.796 E.00459
; LINE_WIDTH: 0.299772
G1 F14015.873
G1 X133.819 Y122.917 E.00589
; LINE_WIDTH: 0.328978
G1 F12584.884
G1 X134.306 Y122.84 E.0115
; WIPE_START
G1 X133.819 Y122.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.926 Y117.06 Z3.2 F42000
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
G1 X129.277 Y113.792 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 X129.494 Y113.956 E-.09157
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.0115
G3 X129.277 Y117.608 I-1.671 J-1.52 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13179
G1 X129.494 Y117.444 E-.1075
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01405
G1 X126.062 Y116.977 E.01669
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16101
G1 X126.062 Y116.977 E-.19121
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.264 Y113.113 I-.9 J2.532 E.46794
G3 X128.202 Y113.02 I.756 J2.858 E.02908
G3 X128.836 Y113.148 I-.209 J2.679 E.01992
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14847
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12586
G1 X130.195 Y114.146 E-.12579
G1 X130.345 Y114.388 E-.10818
G1 X130.345 Y114.388 E-.00002
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
G3 Z3.2 I1.045 J.623 P1  F42000
G1 X133.709 Y108.748 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3895
M204 S6000
G1 X133.779 Y108.759 E.00236
G1 X134.284 Y109.016 E.01878
G1 X134.684 Y109.416 E.01878
G1 X134.941 Y109.921 E.01878
G1 X135.022 Y110.433 E.01719
G1 X135.022 Y120.967 E.34946
G1 X134.941 Y121.479 E.01719
G1 X134.684 Y121.984 E.01878
G1 X134.284 Y122.384 E.01878
G1 X133.779 Y122.641 E.01878
G1 X133.267 Y122.722 E.01719
G1 X122.733 Y122.722 E.34946
G1 X122.221 Y122.641 E.01719
G1 X121.716 Y122.384 E.01878
G1 X121.316 Y121.984 E.01878
G1 X121.059 Y121.479 E.01878
G1 X120.978 Y120.967 E.01719
G1 X120.978 Y110.433 E.34946
G1 X121.059 Y109.921 E.01719
G1 X121.316 Y109.416 E.01878
G1 X121.455 Y109.277 E.00653
G1 X121.716 Y109.016 E.01226
G1 X122.221 Y108.759 E.01878
G1 X122.733 Y108.678 E.01719
G1 X133.267 Y108.678 E.34946
G1 X133.65 Y108.739 E.01284
M204 S250
G1 X133.648 Y109.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.657 Y109.137 E.00027
G1 X134.05 Y109.337 E.01358
G1 X134.363 Y109.65 E.01358
G1 X134.563 Y110.043 E.01358
M73 P72 R3
G1 X134.63 Y110.464 E.01307
G1 X134.63 Y120.937 E.32181
G1 X134.563 Y121.357 E.01307
G1 X134.363 Y121.75 E.01358
G1 X134.05 Y122.063 E.01358
G1 X133.657 Y122.263 E.01358
G1 X133.237 Y122.33 E.01307
G1 X122.763 Y122.33 E.32181
G1 X122.343 Y122.263 E.01307
G1 X121.95 Y122.063 E.01358
G1 X121.637 Y121.75 E.01358
G1 X121.437 Y121.357 E.01358
G1 X121.37 Y120.937 E.01307
G1 X121.37 Y110.463 E.32181
G1 X121.437 Y110.043 E.01307
G1 X121.637 Y109.65 E.01358
G1 X121.732 Y109.554 E.00414
G1 X121.95 Y109.337 E.00944
G1 X122.343 Y109.137 E.01358
G1 X122.763 Y109.07 E.01307
G1 X133.237 Y109.07 E.32181
G1 X133.588 Y109.126 E.01095
; WIPE_START
M204 S6000
G1 X133.657 Y109.137 E-.02618
G1 X134.05 Y109.337 E-.16795
G1 X134.363 Y109.65 E-.16795
G1 X134.563 Y110.043 E-.16795
G1 X134.63 Y110.464 E-.16159
G1 X134.63 Y110.643 E-.06838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.081 Y109.518 Z3.4 F42000
M73 P73 R3
G1 X121.474 Y108.683 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3895
M204 S6000
G1 X120.983 Y109.174 E.02306
G1 X120.825 Y109.094 E.00589
G3 X121.394 Y108.525 I.62 J.051 E.02904
G1 X121.447 Y108.629 E.0039
; WIPE_START
G1 F6000
G1 X120.983 Y109.174 E-.28763
G1 X120.825 Y109.094 E-.07129
G1 X120.848 Y108.946 E-.06007
G1 X120.936 Y108.773 E-.07792
G1 X121.073 Y108.636 E-.07794
G1 X121.246 Y108.548 E-.07792
G1 X121.394 Y108.525 E-.06005
G1 X121.447 Y108.629 E-.04719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.073 Y108.935 Z3.4 F42000
G1 X135.017 Y109.174 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G1 X134.526 Y108.683 E.02306
G1 X134.606 Y108.525 E.00589
G1 X134.754 Y108.548 E.00496
G3 X135.175 Y109.094 I-.186 J.58 E.02431
G1 X135.071 Y109.147 E.0039
; WIPE_START
G1 F6000
G1 X134.526 Y108.683 E-.28763
G1 X134.606 Y108.525 E-.07129
G1 X134.754 Y108.548 E-.06005
G1 X134.927 Y108.636 E-.07792
G1 X135.064 Y108.773 E-.07794
G1 X135.152 Y108.946 E-.07792
G1 X135.175 Y109.094 E-.06005
G1 X135.071 Y109.147 E-.04719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.064 Y116.779 Z3.4 F42000
G1 X135.058 Y122.622 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G3 X134.606 Y122.876 I-.502 J-.367 E.01771
G1 X134.526 Y122.717 E.00589
G1 X135.017 Y122.226 E.02306
G1 X135.175 Y122.306 E.00589
G3 X135.091 Y122.572 I-.62 J-.051 E.00933
; WIPE_START
G1 F6000
G1 X134.927 Y122.764 E-.09948
G1 X134.754 Y122.852 E-.07644
G1 X134.606 Y122.876 E-.05891
G1 X134.526 Y122.717 E-.06993
G1 X135.017 Y122.226 E-.27395
G1 X135.175 Y122.306 E-.06993
G1 X135.152 Y122.454 E-.05891
G1 X135.091 Y122.572 E-.05244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.461 Y122.385 Z3.4 F42000
G1 X120.983 Y122.226 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G1 X121.474 Y122.717 E.02306
G1 X121.394 Y122.876 E.00589
G3 X120.824 Y122.306 I.051 J-.62 E.02903
G1 X120.929 Y122.253 E.0039
; WIPE_START
G1 F6000
G1 X121.474 Y122.717 E-.28763
G1 X121.394 Y122.876 E-.07129
G1 X121.246 Y122.852 E-.06005
G1 X121.073 Y122.764 E-.07792
G1 X120.936 Y122.627 E-.07794
G1 X120.848 Y122.454 E-.07792
G1 X120.824 Y122.306 E-.06005
G1 X120.929 Y122.253 E-.04719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.555 Y122.578 Z3.4 F42000
G1 X135.397 Y122.869 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G1 X135.169 Y123.098 E.01071
G1 X134.881 Y123.244 E.01071
G1 X134.515 Y123.302 E.01231
G1 X121.485 Y123.302 E.43223
G1 X121.119 Y123.244 E.01231
G1 X120.831 Y123.098 E.01071
G1 X120.602 Y122.869 E.01071
G1 X120.456 Y122.581 E.01071
G1 X120.398 Y122.215 E.01231
G1 X120.398 Y109.185 E.43223
G1 X120.456 Y108.819 E.01231
G1 X120.602 Y108.531 E.01071
G1 X120.831 Y108.303 E.01071
G1 X121.119 Y108.156 E.01071
G1 X121.485 Y108.098 E.01231
G1 X134.515 Y108.098 E.43223
G1 X134.717 Y108.13 E.00679
G1 X134.881 Y108.156 E.00552
G1 X135.169 Y108.303 E.01071
G1 X135.397 Y108.531 E.01071
G1 X135.544 Y108.819 E.01071
G1 X135.602 Y109.185 E.01231
G1 X135.602 Y122.215 E.43223
G1 X135.544 Y122.581 E.01231
G1 X135.425 Y122.816 E.00872
M204 S250
G1 X135.721 Y123.099 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.719 Y123.102 E.00014
G1 X135.402 Y123.419 E.01374
G1 X135.004 Y123.622 E.01374
G1 X134.546 Y123.694 E.01425
G1 X121.454 Y123.694 E.40228
G1 X120.996 Y123.622 E.01425
G1 X120.598 Y123.419 E.01374
G1 X120.281 Y123.102 E.01374
G1 X120.078 Y122.704 E.01374
G1 X120.006 Y122.246 E.01425
G1 X120.006 Y109.154 E.40228
G1 X120.078 Y108.696 E.01425
G1 X120.281 Y108.298 E.01374
G1 X120.598 Y107.981 E.01374
G1 X120.996 Y107.778 E.01374
G1 X121.454 Y107.706 E.01425
G1 X134.546 Y107.706 E.40228
G1 X134.779 Y107.743 E.00724
G1 X135.004 Y107.778 E.00702
G1 X135.402 Y107.981 E.01374
G1 X135.719 Y108.298 E.01374
G1 X135.922 Y108.696 E.01374
G1 X135.994 Y109.154 E.01425
G1 X135.994 Y122.246 E.40228
G1 X135.922 Y122.704 E.01425
G1 X135.748 Y123.045 E.01176
; WIPE_START
M204 S6000
G1 X135.719 Y123.102 E-.02447
G1 X135.402 Y123.419 E-.16991
G1 X135.004 Y123.622 E-.16989
G1 X134.546 Y123.694 E-.17629
G1 X133.968 Y123.694 E-.21945
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


; object ids of this layer15 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X133.863 Y122.967 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.283846
G1 F3895
M204 S6000
G1 X133.58 Y122.989 E.00558
; LINE_WIDTH: 0.216502
G3 X133.283 Y123.012 I-.442 J-3.801 E.00421
G1 X122.703 Y123.012 E.14966
; LINE_WIDTH: 0.239251
G1 X122.42 Y122.989 E.00455
; LINE_WIDTH: 0.283831
G1 X122.137 Y122.967 E.00558
; LINE_WIDTH: 0.312852
G1 X121.618 Y122.884 E.01156
M204 S10000
G1 X120.601 Y121.672 F42000
; LINE_WIDTH: 0.140558
G1 F3895
M204 S6000
G1 X120.822 Y121.815 E.00209
; LINE_WIDTH: 0.113461
G1 X121.042 Y121.957 E.00151
; LINE_WIDTH: 0.0984129
G1 X121.064 Y121.987 E.00017
M204 S10000
G1 X120.816 Y122.082 F42000
; LINE_WIDTH: 0.312851
G1 F3895
M204 S6000
G1 X120.733 Y121.563 E.01156
; LINE_WIDTH: 0.283846
G1 X120.711 Y121.28 E.00558
; LINE_WIDTH: 0.239257
G1 X120.688 Y120.997 E.00455
; LINE_WIDTH: 0.216502
G1 X120.688 Y110.417 E.14966
G3 X120.711 Y110.12 I3.827 J.145 E.00421
; LINE_WIDTH: 0.283831
G1 X120.733 Y109.837 E.00558
; LINE_WIDTH: 0.312852
G1 X120.816 Y109.318 E.01156
M204 S10000
G1 X121.064 Y109.413 F42000
; LINE_WIDTH: 0.0983831
G1 F3895
M204 S6000
G1 X121.042 Y109.443 E.00016
; LINE_WIDTH: 0.113364
G1 X120.822 Y109.586 E.00151
; LINE_WIDTH: 0.140426
G1 X120.601 Y109.728 E.00209
M204 S10000
G1 X122.028 Y108.301 F42000
; LINE_WIDTH: 0.140531
G1 F3895
M204 S6000
G1 X121.886 Y108.522 E.00209
; LINE_WIDTH: 0.111601
G1 X121.713 Y108.764 E.00166
M204 S10000
G1 X121.618 Y108.516 F42000
; LINE_WIDTH: 0.312851
G1 F3895
M204 S6000
G1 X122.137 Y108.433 E.01156
; LINE_WIDTH: 0.283846
G1 X122.42 Y108.411 E.00558
; LINE_WIDTH: 0.239257
G1 X122.703 Y108.388 E.00455
; LINE_WIDTH: 0.216502
G1 X133.283 Y108.388 E.14966
G3 X133.58 Y108.411 I-.145 J3.827 E.00421
; LINE_WIDTH: 0.283831
G1 X133.863 Y108.433 E.00558
; LINE_WIDTH: 0.312848
G1 X134.382 Y108.516 E.01156
M204 S10000
G1 X134.287 Y108.764 F42000
; LINE_WIDTH: 0.111616
G1 F3895
M204 S6000
G1 X134.115 Y108.522 E.00166
; LINE_WIDTH: 0.140552
G1 X133.972 Y108.301 E.00209
M204 S10000
G1 X135.399 Y109.728 F42000
; LINE_WIDTH: 0.140558
G1 F3895
M204 S6000
G1 X135.178 Y109.586 E.00209
; LINE_WIDTH: 0.111623
G1 X134.936 Y109.413 E.00166
M204 S10000
G1 X135.184 Y109.318 F42000
; LINE_WIDTH: 0.312851
G1 F3895
M204 S6000
G1 X135.267 Y109.837 E.01156
; LINE_WIDTH: 0.283846
G1 X135.289 Y110.12 E.00558
; LINE_WIDTH: 0.239257
G1 X135.312 Y110.403 E.00455
; LINE_WIDTH: 0.216502
G1 X135.312 Y120.983 E.14966
G3 X135.289 Y121.28 I-3.827 J-.145 E.00421
; LINE_WIDTH: 0.283831
G1 X135.267 Y121.563 E.00558
; LINE_WIDTH: 0.312848
G1 X135.184 Y122.082 E.01156
M204 S10000
G1 X134.936 Y121.987 F42000
; LINE_WIDTH: 0.111616
G1 F3895
M204 S6000
G1 X135.178 Y121.815 E.00166
; LINE_WIDTH: 0.140552
G1 X135.399 Y121.672 E.00209
M204 S10000
G1 X134.382 Y122.884 F42000
; LINE_WIDTH: 0.312851
G1 F3895
M204 S6000
G1 X133.863 Y122.967 E.01156
; WIPE_START
G1 F13336.755
G1 X134.382 Y122.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.26 Y117.226 Z3.4 F42000
G1 X126.723 Y114.423 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3895
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
G1 X129.277 Y113.792 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3895
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09157
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.67 J-1.519 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10745
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3895
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.283 J-2.991 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16106
G1 X126.062 Y116.977 E-.19116
M73 P74 R3
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.166 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.748 Y114.235 I-.893 J2.534 E.40865
G3 X128.188 Y113.02 I2.271 J1.502 E.08774
G3 X128.836 Y113.147 I-.188 J2.68 E.02033
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14848
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12586
G1 X130.195 Y114.146 E-.12579
G1 X130.338 Y114.377 E-.10316
G1 X130.344 Y114.389 E-.00503
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
G3 Z3.4 I1.044 J.625 P1  F42000
G1 X133.753 Y108.69 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3945
M204 S6000
G1 X133.825 Y108.702 E.00241
G1 X134.334 Y108.961 E.01897
G1 X134.739 Y109.366 E.01897
G1 X134.998 Y109.875 E.01897
G1 X135.08 Y110.393 E.01738
G1 X135.08 Y121.007 E.35211
G1 X134.998 Y121.525 E.01738
G1 X134.739 Y122.034 E.01897
G1 X134.334 Y122.439 E.01897
G1 X133.825 Y122.698 E.01897
G1 X133.307 Y122.78 E.01738
G1 X122.693 Y122.78 E.35211
G1 X122.175 Y122.698 E.01738
G1 X121.666 Y122.439 E.01897
G1 X121.261 Y122.034 E.01897
G1 X121.002 Y121.525 E.01897
G1 X120.92 Y121.007 E.01738
G1 X120.92 Y110.393 E.35211
G1 X121.002 Y109.875 E.01738
G1 X121.261 Y109.366 E.01897
G1 X121.666 Y108.961 E.01897
G1 X122.175 Y108.702 E.01897
G1 X122.693 Y108.62 E.01738
G1 X133.307 Y108.62 E.35211
G1 X133.694 Y108.681 E.01298
M204 S250
G1 X133.692 Y109.078 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.702 Y109.079 E.00032
G1 X134.101 Y109.282 E.01375
G1 X134.418 Y109.599 E.01376
G1 X134.621 Y109.998 E.01375
G1 X134.688 Y110.423 E.01324
G1 X134.688 Y120.977 E.32427
G1 X134.621 Y121.402 E.01324
G1 X134.418 Y121.801 E.01375
G1 X134.101 Y122.118 E.01376
G1 X133.702 Y122.321 E.01375
G1 X133.277 Y122.388 E.01324
G1 X122.723 Y122.388 E.32427
G1 X122.298 Y122.321 E.01324
G1 X121.899 Y122.118 E.01375
G1 X121.582 Y121.801 E.01376
G1 X121.379 Y121.402 E.01375
G1 X121.312 Y120.977 E.01324
G1 X121.312 Y110.423 E.32427
G1 X121.379 Y109.998 E.01324
G1 X121.582 Y109.599 E.01375
G1 X121.899 Y109.282 E.01376
G1 X122.298 Y109.079 E.01375
G1 X122.723 Y109.012 E.01324
G1 X133.277 Y109.012 E.32427
G1 X133.633 Y109.068 E.01108
; WIPE_START
M204 S6000
G1 X133.702 Y109.079 E-.02676
G1 X134.101 Y109.282 E-.1701
G1 X134.418 Y109.599 E-.17012
G1 X134.621 Y109.998 E-.1701
G1 X134.688 Y110.423 E-.16376
G1 X134.688 Y110.579 E-.05917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.136 Y109.474 Z3.6 F42000
G1 X121.414 Y108.637 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3945
M204 S6000
G1 X120.937 Y109.114 E.02237
G1 X120.768 Y108.991 E.00692
G1 X120.897 Y108.738 E.00942
G1 X121.038 Y108.597 E.00661
G1 X121.291 Y108.469 E.00942
G1 X121.379 Y108.589 E.00493
; WIPE_START
G1 F6000
G1 X120.937 Y109.114 E-.28802
G1 X120.768 Y108.991 E-.08754
G1 X120.897 Y108.738 E-.11923
G1 X121.038 Y108.597 E-.0836
G1 X121.291 Y108.469 E-.11923
G1 X121.379 Y108.589 E-.06236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.006 Y108.882 Z3.6 F42000
G1 X135.063 Y109.114 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X134.586 Y108.637 E.02237
G1 X134.709 Y108.468 E.00692
G1 X134.962 Y108.597 E.00942
G1 X135.103 Y108.738 E.00661
G1 X135.231 Y108.991 E.00942
G1 X135.111 Y109.079 E.00493
; WIPE_START
G1 F6000
G1 X134.586 Y108.637 E-.28803
G1 X134.709 Y108.468 E-.08754
G1 X134.962 Y108.597 E-.11924
G1 X135.103 Y108.738 E-.0836
G1 X135.231 Y108.991 E-.11923
G1 X135.111 Y109.079 E-.06236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.106 Y116.711 Z3.6 F42000
G1 X135.103 Y122.662 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X134.962 Y122.803 E.00661
G1 X134.709 Y122.932 E.00942
G1 X134.586 Y122.763 E.00692
G1 X135.063 Y122.286 E.02237
G1 X135.232 Y122.409 E.00692
G1 X135.13 Y122.608 E.00743
; WIPE_START
G1 F6000
G1 X134.962 Y122.803 E-.10517
G1 X134.709 Y122.932 E-.11629
G1 X134.586 Y122.763 E-.08539
G1 X135.063 Y122.286 E-.27603
G1 X135.232 Y122.409 E-.08539
G1 X135.13 Y122.608 E-.09173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.499 Y122.435 Z3.6 F42000
G1 X120.937 Y122.286 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X121.414 Y122.763 E.02237
G1 X121.291 Y122.932 E.00692
G1 X121.038 Y122.803 E.00942
G1 X120.897 Y122.662 E.00661
G1 X120.768 Y122.409 E.00942
G1 X120.889 Y122.321 E.00493
; WIPE_START
G1 F6000
G1 X121.414 Y122.763 E-.28802
G1 X121.291 Y122.932 E-.08754
G1 X121.038 Y122.803 E-.11923
G1 X120.897 Y122.662 E-.0836
G1 X120.768 Y122.409 E-.11923
G1 X120.889 Y122.321 E-.06236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.515 Y122.627 Z3.6 F42000
G1 X135.436 Y122.904 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X135.204 Y123.136 E.01089
G1 X134.912 Y123.285 E.01088
G1 X134.54 Y123.344 E.01248
G1 X121.46 Y123.344 E.43389
G1 X121.088 Y123.285 E.01248
G1 X120.796 Y123.136 E.01088
G1 X120.564 Y122.904 E.01089
G1 X120.415 Y122.612 E.01088
G1 X120.356 Y122.24 E.01248
G1 X120.356 Y109.16 E.43389
G1 X120.415 Y108.788 E.01248
G1 X120.564 Y108.496 E.01088
G1 X120.796 Y108.264 E.01089
G1 X121.088 Y108.115 E.01088
G1 X121.46 Y108.056 E.01248
G1 X134.54 Y108.056 E.43389
G1 X134.759 Y108.091 E.00736
G1 X134.912 Y108.115 E.00511
G1 X135.204 Y108.264 E.01088
G1 X135.436 Y108.496 E.01089
G1 X135.585 Y108.788 E.01088
G1 X135.644 Y109.16 E.01248
G1 X135.644 Y122.24 E.43389
G1 X135.585 Y122.612 E.01248
G1 X135.463 Y122.85 E.00889
M204 S250
G1 X135.759 Y123.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.757 Y123.137 E.00011
G1 X135.437 Y123.457 E.0139
G1 X135.034 Y123.662 E.0139
G1 X134.571 Y123.736 E.01441
G1 X121.429 Y123.736 E.40381
G1 X120.966 Y123.662 E.01441
G1 X120.563 Y123.457 E.0139
G1 X120.243 Y123.137 E.0139
G1 X120.038 Y122.734 E.0139
G1 X119.964 Y122.271 E.01441
G1 X119.964 Y109.129 E.40381
G1 X120.038 Y108.666 E.01441
G1 X120.243 Y108.263 E.0139
G1 X120.563 Y107.943 E.0139
G1 X120.966 Y107.738 E.0139
G1 X121.429 Y107.664 E.01441
G1 X134.571 Y107.664 E.40381
G1 X134.821 Y107.704 E.00777
G1 X135.034 Y107.738 E.00664
G1 X135.437 Y107.943 E.0139
G1 X135.757 Y108.263 E.0139
G1 X135.962 Y108.666 E.0139
G1 X136.036 Y109.129 E.01441
G1 X136.036 Y122.271 E.40381
G1 X135.962 Y122.734 E.01441
G1 X135.786 Y123.081 E.01195
; WIPE_START
M204 S6000
G1 X135.757 Y123.137 E-.02411
G1 X135.437 Y123.457 E-.17189
G1 X135.034 Y123.662 E-.17188
G1 X134.571 Y123.736 E-.17826
G1 X134.008 Y123.736 E-.21387
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


; object ids of this layer16 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.061 Y123.14 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164006
G1 F3945
M204 S6000
G1 X134.179 Y122.93 E.00238
; LINE_WIDTH: 0.123955
G1 X134.297 Y122.72 E.00159
; LINE_WIDTH: 0.100432
G1 X134.337 Y122.691 E.00023
M204 S10000
G1 X134.455 Y122.929 F42000
; LINE_WIDTH: 0.296734
G1 F3945
M204 S6000
G1 X133.908 Y123.017 E.01146
; LINE_WIDTH: 0.2679
G1 X133.622 Y123.039 E.00526
; LINE_WIDTH: 0.199987
G3 X133.323 Y123.062 I-.446 J-3.835 E.00383
G1 X122.664 Y123.062 E.13642
; LINE_WIDTH: 0.222857
G1 X122.378 Y123.039 E.00421
; LINE_WIDTH: 0.267891
G1 X122.092 Y123.017 E.00526
; LINE_WIDTH: 0.296746
G1 X121.545 Y122.929 E.01146
M204 S10000
G1 X121.663 Y122.691 F42000
; LINE_WIDTH: 0.119965
G1 F3945
M204 S6000
G1 X121.703 Y122.72 E.00031
G1 X121.821 Y122.93 E.00151
; LINE_WIDTH: 0.16402
G1 X121.939 Y123.14 E.00238
M204 S10000
G1 X120.56 Y121.761 F42000
; LINE_WIDTH: 0.164006
G1 F3945
M204 S6000
G1 X120.77 Y121.879 E.00238
; LINE_WIDTH: 0.123955
G1 X120.98 Y121.997 E.00159
; LINE_WIDTH: 0.100432
G1 X121.009 Y122.037 E.00023
M204 S10000
G1 X120.771 Y122.155 F42000
; LINE_WIDTH: 0.296734
G1 F3945
M204 S6000
G1 X120.684 Y121.608 E.01146
; LINE_WIDTH: 0.2679
G1 X120.661 Y121.322 E.00526
; LINE_WIDTH: 0.222858
G1 X120.638 Y121.036 E.00421
; LINE_WIDTH: 0.199987
G1 X120.638 Y110.377 E.13642
G3 X120.661 Y110.078 I3.858 J.147 E.00383
; LINE_WIDTH: 0.267891
G1 X120.684 Y109.792 E.00526
; LINE_WIDTH: 0.296746
G1 X120.771 Y109.245 E.01146
M204 S10000
G1 X121.009 Y109.363 F42000
; LINE_WIDTH: 0.100428
G1 F3945
M204 S6000
G1 X120.98 Y109.403 E.00023
; LINE_WIDTH: 0.123969
G1 X120.77 Y109.521 E.00159
; LINE_WIDTH: 0.16402
G1 X120.56 Y109.639 E.00238
M204 S10000
G1 X121.939 Y108.26 F42000
; LINE_WIDTH: 0.16402
G1 F3945
M204 S6000
G1 X121.821 Y108.47 E.00238
; LINE_WIDTH: 0.119959
G1 X121.703 Y108.68 E.00151
G1 X121.663 Y108.709 E.00031
M204 S10000
G1 X121.545 Y108.471 F42000
; LINE_WIDTH: 0.296734
G1 F3945
M204 S6000
G1 X122.092 Y108.384 E.01146
; LINE_WIDTH: 0.2679
G1 X122.378 Y108.361 E.00526
; LINE_WIDTH: 0.222858
G1 X122.664 Y108.338 E.00421
; LINE_WIDTH: 0.199987
G1 X133.323 Y108.338 E.13642
G3 X133.622 Y108.361 I-.147 J3.858 E.00383
; LINE_WIDTH: 0.267891
M73 P75 R3
G1 X133.908 Y108.384 E.00526
; LINE_WIDTH: 0.296746
G1 X134.455 Y108.471 E.01146
M204 S10000
G1 X134.337 Y108.709 F42000
; LINE_WIDTH: 0.119962
G1 F3945
M204 S6000
G1 X134.297 Y108.68 E.00031
G1 X134.179 Y108.47 E.00151
; LINE_WIDTH: 0.164026
G1 X134.061 Y108.26 E.00238
M204 S10000
G1 X135.44 Y109.639 F42000
; LINE_WIDTH: 0.164006
G1 F3945
M204 S6000
G1 X135.23 Y109.521 E.00238
; LINE_WIDTH: 0.119955
G1 X135.02 Y109.403 E.00151
G1 X134.991 Y109.363 E.00031
M204 S10000
G1 X135.229 Y109.245 F42000
; LINE_WIDTH: 0.296734
G1 F3945
M204 S6000
G1 X135.316 Y109.792 E.01146
; LINE_WIDTH: 0.2679
G1 X135.339 Y110.078 E.00526
; LINE_WIDTH: 0.222858
G1 X135.362 Y110.364 E.00421
; LINE_WIDTH: 0.199987
G1 X135.362 Y121.023 E.13642
G3 X135.339 Y121.322 I-3.858 J-.147 E.00383
; LINE_WIDTH: 0.267891
G1 X135.316 Y121.608 E.00526
; LINE_WIDTH: 0.296746
G1 X135.229 Y122.155 E.01146
M204 S10000
G1 X134.991 Y122.037 F42000
; LINE_WIDTH: 0.119965
G1 F3945
M204 S6000
G1 X135.02 Y121.997 E.00031
G1 X135.23 Y121.879 E.00151
; LINE_WIDTH: 0.16402
G1 X135.44 Y121.761 E.00238
; WIPE_START
G1 F15000
G1 X135.23 Y121.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.49 Y116.848 Z3.6 F42000
G1 X126.723 Y114.423 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3945
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
G1 X129.277 Y113.792 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3945
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10744
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24234
G1 X129.277 Y113.931 E-.18683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.0115
G3 X129.277 Y117.608 I-1.667 J-1.516 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13178
G1 X129.494 Y117.444 E-.10751
G1 X129.277 Y117.608 E-.10344
G1 X129.277 Y117.151 E-.17384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3945
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.439 J-3.15 E.03076
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16106
G1 X126.062 Y116.977 E-.19117
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.516 Y118.342 I-.894 J2.533 E.2462
G3 X128.175 Y113.02 I.486 J-2.642 E.24964
G3 X128.836 Y113.148 I-.176 J2.68 E.02073
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14847
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12581
G1 X130.195 Y114.146 E-.12591
G1 X130.345 Y114.388 E-.10812
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
G3 Z3.6 I1.044 J.626 P1  F42000
G1 X133.798 Y108.633 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3867
M204 S6000
G1 X133.87 Y108.644 E.00242
G1 X134.385 Y108.907 E.01916
G1 X134.793 Y109.315 E.01916
G1 X135.056 Y109.83 E.01916
G1 X135.138 Y110.353 E.01757
G1 X135.138 Y121.047 E.35476
G1 X135.056 Y121.57 E.01757
G1 X134.793 Y122.085 E.01916
G1 X134.385 Y122.493 E.01916
G1 X133.87 Y122.756 E.01916
G1 X133.347 Y122.838 E.01757
G1 X122.653 Y122.838 E.35476
G1 X122.13 Y122.756 E.01757
G1 X121.615 Y122.493 E.01916
G1 X121.207 Y122.085 E.01916
G1 X120.944 Y121.57 E.01916
G1 X120.862 Y121.047 E.01757
G1 X120.862 Y110.353 E.35476
G1 X120.944 Y109.83 E.01757
G1 X121.207 Y109.315 E.01916
G1 X121.615 Y108.907 E.01916
G1 X122.13 Y108.644 E.01916
G1 X122.653 Y108.562 E.01757
G1 X133.347 Y108.562 E.35476
G1 X133.739 Y108.624 E.01316
M204 S250
G1 X133.737 Y109.02 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.748 Y109.022 E.00033
G1 X134.152 Y109.228 E.01393
G1 X134.472 Y109.548 E.01393
G1 X134.678 Y109.952 E.01393
G1 X134.746 Y110.384 E.01342
G1 X134.746 Y121.017 E.32672
G1 X134.678 Y121.448 E.01342
G1 X134.472 Y121.852 E.01393
G1 X134.152 Y122.172 E.01393
G1 X133.748 Y122.378 E.01393
G1 X133.317 Y122.446 E.01342
G1 X122.683 Y122.446 E.32672
G1 X122.252 Y122.378 E.01342
G1 X121.848 Y122.172 E.01393
G1 X121.528 Y121.852 E.01393
G1 X121.322 Y121.448 E.01393
G1 X121.254 Y121.017 E.01342
G1 X121.254 Y110.384 E.32672
G1 X121.322 Y109.952 E.01342
G1 X121.528 Y109.548 E.01393
G1 X121.848 Y109.228 E.01393
G1 X122.252 Y109.022 E.01393
G1 X122.683 Y108.954 E.01342
G1 X133.317 Y108.954 E.32672
G1 X133.678 Y109.011 E.01124
; WIPE_START
M204 S6000
G1 X133.748 Y109.022 E-.02692
G1 X134.152 Y109.228 E-.17227
G1 X134.472 Y109.548 E-.17227
G1 X134.678 Y109.952 E-.17226
G1 X134.746 Y110.384 E-.16593
G1 X134.746 Y110.516 E-.05035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.188 Y109.456 Z3.8 F42000
G1 X121.314 Y108.632 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3867
M204 S6000
G1 X120.932 Y109.014 E.0179
G1 X120.763 Y108.891 E.00692
G3 X121.191 Y108.463 I.688 J.26 E.02068
G1 X121.279 Y108.584 E.00493
; WIPE_START
G1 F6000
G1 X120.932 Y109.014 E-.27344
G1 X120.763 Y108.891 E-.10327
G1 X120.859 Y108.704 E-.10427
G1 X121.004 Y108.559 E-.10119
G1 X121.191 Y108.463 E-.10427
G1 X121.279 Y108.584 E-.07356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.907 Y108.822 Z3.8 F42000
G1 X135.068 Y109.014 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G1 X134.686 Y108.632 E.01791
G1 X134.809 Y108.463 E.00692
G1 X134.996 Y108.559 E.00699
G3 X135.237 Y108.891 I-.391 J.536 E.01382
G1 X135.116 Y108.979 E.00493
; WIPE_START
G1 F6000
G1 X134.686 Y108.632 E-.27345
G1 X134.809 Y108.463 E-.10326
G1 X134.996 Y108.559 E-.10429
G1 X135.141 Y108.704 E-.10118
G1 X135.237 Y108.891 E-.10427
G1 X135.116 Y108.979 E-.07356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.127 Y116.611 Z3.8 F42000
G1 X135.135 Y122.692 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G3 X134.809 Y122.937 I-.587 J-.444 E.01371
G1 X134.686 Y122.768 E.00692
G1 X135.068 Y122.386 E.0179
G1 X135.237 Y122.509 E.00692
G3 X135.17 Y122.643 I-.688 J-.26 E.00498
; WIPE_START
G1 F6000
G1 X134.996 Y122.841 E-.12647
G1 X134.809 Y122.937 E-.10128
G1 X134.686 Y122.768 E-.1003
G1 X135.068 Y122.386 E-.25954
G1 X135.237 Y122.509 E-.1003
G1 X135.17 Y122.643 E-.07212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.538 Y122.505 Z3.8 F42000
G1 X120.932 Y122.386 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G1 X121.314 Y122.768 E.0179
G1 X121.191 Y122.937 E.00692
G3 X120.763 Y122.509 I.26 J-.688 E.02068
G1 X120.884 Y122.422 E.00493
; WIPE_START
G1 F6000
G1 X121.314 Y122.768 E-.27344
G1 X121.191 Y122.937 E-.10327
G1 X121.004 Y122.841 E-.10427
G1 X120.859 Y122.697 E-.10119
G1 X120.763 Y122.509 E-.10427
G1 X120.884 Y122.422 E-.07356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.511 Y122.692 Z3.8 F42000
G1 X135.474 Y122.939 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G1 X135.239 Y123.174 E.01106
G1 X134.942 Y123.326 E.01106
G1 X134.565 Y123.385 E.01265
G1 X121.435 Y123.385 E.43555
G1 X121.058 Y123.326 E.01265
G1 X120.761 Y123.174 E.01106
G1 X120.526 Y122.939 E.01106
G1 X120.374 Y122.642 E.01106
G1 X120.315 Y122.265 E.01265
G1 X120.315 Y109.135 E.43555
G1 X120.374 Y108.758 E.01265
G1 X120.526 Y108.461 E.01106
G1 X120.761 Y108.226 E.01106
G1 X121.058 Y108.074 E.01106
G1 X121.435 Y108.015 E.01265
G1 X134.565 Y108.015 E.43555
G1 X134.802 Y108.052 E.00794
G1 X134.942 Y108.074 E.00471
G1 X135.239 Y108.226 E.01106
G1 X135.474 Y108.461 E.01106
G1 X135.626 Y108.758 E.01106
G1 X135.685 Y109.135 E.01265
G1 X135.685 Y122.265 E.43555
G1 X135.626 Y122.642 E.01265
G1 X135.502 Y122.885 E.00907
M204 S250
G1 X135.797 Y123.17 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.796 Y123.172 E.00007
G1 X135.472 Y123.496 E.01406
G1 X135.064 Y123.703 E.01406
G1 X134.596 Y123.778 E.01457
G1 X121.404 Y123.778 E.40535
G1 X120.936 Y123.703 E.01457
G1 X120.528 Y123.496 E.01406
G1 X120.204 Y123.172 E.01406
G1 X119.997 Y122.764 E.01406
G1 X119.922 Y122.296 E.01457
G1 X119.922 Y109.104 E.40535
G1 X119.997 Y108.636 E.01457
G1 X120.204 Y108.228 E.01406
G1 X120.528 Y107.904 E.01406
G1 X120.936 Y107.697 E.01406
G1 X121.404 Y107.623 E.01457
G1 X134.596 Y107.623 E.40535
G1 X134.863 Y107.665 E.00831
G1 X135.064 Y107.697 E.00627
G1 X135.472 Y107.904 E.01406
G1 X135.796 Y108.228 E.01406
G1 X136.003 Y108.636 E.01406
G1 X136.078 Y109.104 E.01457
G1 X136.078 Y122.296 E.40535
G1 X136.003 Y122.764 E.01457
G1 X135.824 Y123.116 E.01214
; WIPE_START
M204 S6000
G1 X135.796 Y123.172 E-.02371
G1 X135.472 Y123.496 E-.17387
G1 X135.064 Y123.703 E-.17386
G1 X134.596 Y123.778 E-.18024
G1 X134.048 Y123.778 E-.20832
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


; object ids of this layer17 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X133.952 Y123.066 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280617
G1 F3867
M204 S6000
G1 X134.579 Y122.966 E.01229
M204 S10000
G1 X133.952 Y123.066 F42000
; LINE_WIDTH: 0.251958
G1 F3867
M204 S6000
G1 X133.663 Y123.089 E.00494
; LINE_WIDTH: 0.183481
G3 X133.363 Y123.112 I-.443 J-3.78 E.00345
G1 X122.626 Y123.112 E.12299
; LINE_WIDTH: 0.206464
G1 X122.337 Y123.089 E.00386
; LINE_WIDTH: 0.251951
G1 X122.048 Y123.066 E.00494
; LINE_WIDTH: 0.280626
G1 X121.421 Y122.966 E.01229
M204 S10000
G1 X120.734 Y122.279 F42000
; LINE_WIDTH: 0.280617
G1 F3867
M204 S6000
G1 X120.634 Y121.652 E.01229
; LINE_WIDTH: 0.251958
G1 X120.611 Y121.363 E.00494
; LINE_WIDTH: 0.206475
G1 X120.588 Y121.074 E.00386
; LINE_WIDTH: 0.183481
G1 X120.588 Y110.337 E.12299
G3 X120.611 Y110.037 I3.803 J.143 E.00345
; LINE_WIDTH: 0.251951
G1 X120.634 Y109.748 E.00494
; LINE_WIDTH: 0.280626
G1 X120.734 Y109.121 E.01229
M204 S10000
G1 X121.421 Y108.434 F42000
; LINE_WIDTH: 0.280617
G1 F3867
M204 S6000
G1 X122.048 Y108.334 E.01229
; LINE_WIDTH: 0.251958
G1 X122.337 Y108.311 E.00494
; LINE_WIDTH: 0.206475
G1 X122.626 Y108.289 E.00386
; LINE_WIDTH: 0.183481
G1 X133.363 Y108.288 E.12299
G3 X133.663 Y108.311 I-.143 J3.806 E.00345
; LINE_WIDTH: 0.251951
G1 X133.952 Y108.334 E.00494
; LINE_WIDTH: 0.280607
G1 X134.578 Y108.434 E.01228
M204 S10000
G1 X135.266 Y109.121 F42000
; LINE_WIDTH: 0.280617
G1 F3867
M204 S6000
G1 X135.366 Y109.748 E.01228
; LINE_WIDTH: 0.251958
G1 X135.389 Y110.037 E.00494
; LINE_WIDTH: 0.206475
G1 X135.412 Y110.326 E.00386
; LINE_WIDTH: 0.183481
G1 X135.412 Y121.063 E.12299
M73 P76 R3
G3 X135.389 Y121.363 I-3.803 J-.143 E.00345
; LINE_WIDTH: 0.251951
G1 X135.366 Y121.652 E.00494
; LINE_WIDTH: 0.280626
G1 X135.266 Y122.279 E.01229
; WIPE_START
G1 F15000
G1 X135.366 Y121.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.512 Y116.755 Z3.8 F42000
G1 X126.723 Y114.423 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3867
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.946 J2.346 E.03077
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
G1 X129.277 Y113.792 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3867
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.653 Y117.291 E.00206
G3 X129.277 Y117.608 I-1.47 J-1.358 E.01636
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13184
G1 X129.653 Y117.291 E-.02355
G1 X129.494 Y117.444 E-.08387
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3867
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.479 J-3.191 E.03076
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19119
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.503 Y118.339 I-.894 J2.533 E.24657
G3 X128.162 Y113.019 I.495 J-2.64 E.24898
G3 X128.836 Y113.148 I-.163 J2.681 E.02114
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14846
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12582
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10817
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
G3 Z3.8 I1.043 J.628 P1  F42000
G1 X133.844 Y108.576 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3882
M204 S6000
G1 X133.916 Y108.587 E.00241
G1 X134.436 Y108.852 E.01935
G1 X134.848 Y109.264 E.01935
G1 X135.113 Y109.784 E.01935
G1 X135.197 Y110.313 E.01776
G1 X135.197 Y121.087 E.35742
G1 X135.113 Y121.616 E.01776
G1 X134.848 Y122.136 E.01935
G1 X134.436 Y122.548 E.01935
G1 X133.916 Y122.813 E.01935
G1 X133.387 Y122.897 E.01776
G1 X122.613 Y122.897 E.35742
G1 X122.084 Y122.813 E.01776
G1 X121.564 Y122.548 E.01935
G1 X121.152 Y122.136 E.01935
G1 X120.887 Y121.616 E.01935
G1 X120.803 Y121.087 E.01776
G1 X120.803 Y110.313 E.35742
G1 X120.887 Y109.784 E.01776
G1 X121.152 Y109.264 E.01934
G1 X121.33 Y109.086 E.00836
G1 X121.564 Y108.852 E.01099
G1 X122.084 Y108.587 E.01935
G1 X122.613 Y108.503 E.01776
G1 X133.387 Y108.503 E.35742
G1 X133.785 Y108.566 E.01336
M204 S250
G1 X133.783 Y108.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.793 Y108.965 E.00032
G1 X134.202 Y109.173 E.0141
G1 X134.527 Y109.498 E.01411
G1 X134.735 Y109.907 E.0141
G1 X134.805 Y110.344 E.01359
G1 X134.805 Y121.057 E.32918
G1 X134.735 Y121.493 E.01359
G1 X134.527 Y121.902 E.0141
G1 X134.202 Y122.227 E.01411
G1 X133.793 Y122.435 E.0141
G1 X133.357 Y122.505 E.01359
G1 X122.643 Y122.505 E.32918
G1 X122.207 Y122.435 E.01359
G1 X121.798 Y122.227 E.0141
G1 X121.473 Y121.902 E.01411
G1 X121.265 Y121.493 E.0141
G1 X121.195 Y121.057 E.01359
G1 X121.195 Y110.344 E.32918
G1 X121.265 Y109.907 E.01359
G1 X121.473 Y109.498 E.0141
G1 X121.607 Y109.363 E.00584
G1 X121.798 Y109.173 E.00827
G1 X122.207 Y108.965 E.0141
G1 X122.643 Y108.895 E.01359
G1 X133.357 Y108.895 E.32918
G1 X133.724 Y108.954 E.01143
; WIPE_START
M204 S6000
G1 X133.793 Y108.965 E-.02676
G1 X134.202 Y109.173 E-.17443
G1 X134.527 Y109.498 E-.17444
G1 X134.735 Y109.907 E-.17443
G1 X134.805 Y110.344 E-.16808
G1 X134.805 Y110.454 E-.04187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.24 Y109.437 Z4 F42000
G1 X121.214 Y108.627 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3882
M204 S6000
G1 X120.927 Y108.914 E.01345
G1 X120.758 Y108.791 E.00692
G3 X121.091 Y108.458 I.613 J.281 E.01595
G1 X121.178 Y108.578 E.00493
; WIPE_START
G1 F6000
G1 X120.927 Y108.914 E-.25266
G1 X120.758 Y108.791 E-.1258
G1 X120.82 Y108.669 E-.08273
G1 X120.969 Y108.521 E-.12643
G1 X121.091 Y108.458 E-.08273
G1 X121.178 Y108.578 E-.08964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.809 Y108.762 Z4 F42000
G1 X135.073 Y108.914 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G1 X134.786 Y108.627 E.01344
G1 X134.909 Y108.458 E.00692
G1 X135.031 Y108.52 E.00455
G3 X135.242 Y108.791 I-.311 J.459 E.01156
G1 X135.122 Y108.878 E.00493
; WIPE_START
G1 F6000
G1 X134.786 Y108.627 E-.25265
G1 X134.909 Y108.458 E-.12581
G1 X135.031 Y108.52 E-.08273
G1 X135.18 Y108.669 E-.12646
G1 X135.242 Y108.791 E-.08273
G1 X135.122 Y108.878 E-.08962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.15 Y116.511 Z4 F42000
G1 X135.173 Y122.726 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G3 X134.909 Y122.942 I-.544 J-.398 E.01142
G1 X134.786 Y122.773 E.00692
G1 X135.073 Y122.486 E.01344
G1 X135.242 Y122.609 E.00692
G3 X135.206 Y122.676 I-.613 J-.28 E.00253
; WIPE_START
G1 F6000
G1 X135.031 Y122.88 E-.15623
G1 X134.909 Y122.942 E-.07995
G1 X134.786 Y122.773 E-.12158
G1 X135.073 Y122.486 E-.23624
G1 X135.242 Y122.609 E-.12158
G1 X135.206 Y122.676 E-.04442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.574 Y122.575 Z4 F42000
G1 X120.927 Y122.486 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G1 X121.214 Y122.773 E.01344
G1 X121.091 Y122.942 E.00692
G3 X120.758 Y122.609 I.28 J-.613 E.01594
G1 X120.878 Y122.522 E.00493
; WIPE_START
G1 F6000
G1 X121.214 Y122.773 E-.25265
G1 X121.091 Y122.942 E-.12581
G1 X120.969 Y122.88 E-.08273
G1 X120.82 Y122.731 E-.12646
G1 X120.758 Y122.609 E-.08273
G1 X120.878 Y122.522 E-.08962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.507 Y122.757 Z4 F42000
G1 X135.513 Y122.974 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G1 X135.274 Y123.213 E.01123
G1 X134.972 Y123.367 E.01123
G1 X134.59 Y123.427 E.01283
G1 X121.41 Y123.427 E.43721
G1 X121.028 Y123.367 E.01283
G1 X120.726 Y123.213 E.01123
G1 X120.487 Y122.974 E.01123
G1 X120.333 Y122.672 E.01123
G1 X120.273 Y122.29 E.01283
G1 X120.273 Y109.11 E.43721
G1 X120.333 Y108.728 E.01283
G1 X120.487 Y108.426 E.01123
G1 X120.726 Y108.187 E.01123
G1 X121.028 Y108.033 E.01123
G1 X121.41 Y107.973 E.01283
G1 X134.59 Y107.973 E.43721
G1 X134.844 Y108.013 E.00852
G1 X134.972 Y108.033 E.00431
G1 X135.274 Y108.187 E.01123
G1 X135.513 Y108.426 E.01123
G1 X135.667 Y108.728 E.01123
G1 X135.727 Y109.11 E.01283
G1 X135.727 Y122.29 E.43721
G1 X135.667 Y122.672 E.01283
G1 X135.54 Y122.92 E.00924
M204 S250
G1 X135.835 Y123.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.834 Y123.207 E.00004
G1 X135.507 Y123.534 E.01422
G1 X135.095 Y123.744 E.01422
G1 X134.621 Y123.819 E.01474
G1 X121.379 Y123.819 E.40688
G1 X120.905 Y123.744 E.01474
G1 X120.493 Y123.534 E.01422
G1 X120.166 Y123.207 E.01422
G1 X119.956 Y122.795 E.01422
G1 X119.881 Y122.321 E.01474
G1 X119.881 Y109.079 E.40688
G1 X119.956 Y108.605 E.01474
G1 X120.166 Y108.193 E.01422
G1 X120.493 Y107.866 E.01422
G1 X120.905 Y107.656 E.01422
G1 X121.379 Y107.581 E.01474
G1 X134.621 Y107.581 E.40688
G1 X134.905 Y107.626 E.00884
G1 X135.095 Y107.656 E.0059
G1 X135.507 Y107.866 E.01422
G1 X135.834 Y108.193 E.01422
G1 X136.044 Y108.605 E.01422
G1 X136.119 Y109.079 E.01474
G1 X136.119 Y122.321 E.40688
G1 X136.044 Y122.795 E.01474
G1 X135.862 Y123.152 E.01233
; WIPE_START
M204 S6000
G1 X135.834 Y123.207 E-.0233
G1 X135.507 Y123.534 E-.17585
G1 X135.095 Y123.744 E-.17583
G1 X134.621 Y123.819 E-.18223
G1 X134.087 Y123.819 E-.20278
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
M73 P77 R3
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


; object ids of this layer18 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X133.997 Y123.116 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.264512
G1 F3882
M204 S6000
G1 X134.702 Y123.003 E.0129
M204 S10000
G1 X133.997 Y123.116 F42000
; LINE_WIDTH: 0.236028
G1 F3882
M204 S6000
G1 X133.705 Y123.139 E.00461
; LINE_WIDTH: 0.166966
G3 X133.403 Y123.162 I-.446 J-3.801 E.00306
G1 X122.587 Y123.162 E.10933
; LINE_WIDTH: 0.190071
G1 X122.295 Y123.139 E.00351
; LINE_WIDTH: 0.236013
G1 X122.003 Y123.116 E.00461
; LINE_WIDTH: 0.264516
G1 X121.298 Y123.003 E.0129
M204 S10000
G1 X120.697 Y122.402 F42000
; LINE_WIDTH: 0.264512
G1 F3882
M204 S6000
G1 X120.584 Y121.697 E.0129
; LINE_WIDTH: 0.236028
G1 X120.561 Y121.405 E.00461
; LINE_WIDTH: 0.190084
G1 X120.539 Y121.113 E.00351
; LINE_WIDTH: 0.166966
G1 X120.538 Y110.297 E.10933
G3 X120.561 Y109.995 I3.825 J.145 E.00306
; LINE_WIDTH: 0.236013
G1 X120.584 Y109.703 E.00461
; LINE_WIDTH: 0.264516
G1 X120.697 Y108.998 E.0129
M204 S10000
G1 X121.298 Y108.397 F42000
; LINE_WIDTH: 0.264512
G1 F3882
M204 S6000
G1 X122.003 Y108.284 E.0129
; LINE_WIDTH: 0.236028
G1 X122.295 Y108.262 E.00461
; LINE_WIDTH: 0.190084
G1 X122.587 Y108.239 E.00351
; LINE_WIDTH: 0.166966
G1 X133.403 Y108.238 E.10933
G3 X133.705 Y108.262 I-.145 J3.825 E.00306
; LINE_WIDTH: 0.236013
G1 X133.997 Y108.284 E.00461
; LINE_WIDTH: 0.264516
G1 X134.702 Y108.397 E.0129
M204 S10000
G1 X135.303 Y108.998 F42000
; LINE_WIDTH: 0.264512
G1 F3882
M204 S6000
G1 X135.416 Y109.703 E.0129
; LINE_WIDTH: 0.236028
G1 X135.439 Y109.995 E.00461
; LINE_WIDTH: 0.190084
G1 X135.461 Y110.287 E.00351
; LINE_WIDTH: 0.166966
G1 X135.462 Y121.103 E.10933
G3 X135.439 Y121.405 I-3.825 J-.145 E.00306
; LINE_WIDTH: 0.236013
G1 X135.416 Y121.697 E.00461
; LINE_WIDTH: 0.264516
G1 X135.303 Y122.402 E.0129
; WIPE_START
G1 F15000
G1 X135.416 Y121.697 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.562 Y116.799 Z4 F42000
G1 X126.723 Y114.423 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3882
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
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
G1 X129.277 Y113.792 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3882
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13178
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.643 Y117.3 E.0025
G3 X129.277 Y117.608 I-1.432 J-1.328 E.01592
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13184
G1 X129.643 Y117.3 E-.02861
G1 X129.494 Y117.444 E-.07884
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3882
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.516 J-3.228 E.03075
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16106
G1 X126.062 Y116.977 E-.19115
G1 X126.485 Y116.977 E-.16068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X129.916 Y117.581 I-.893 J2.533 E.1657
G3 X127.49 Y118.337 I-1.916 J-1.881 E.08132
G3 X128.149 Y113.019 I.511 J-2.636 E.24799
G3 X128.836 Y113.148 I-.149 J2.681 E.02154
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14846
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12579
G1 X130.345 Y114.388 E-.10821
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
G3 Z4 I1.042 J.629 P1  F42000
G1 X133.891 Y108.519 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3744
M204 S6000
G1 X133.962 Y108.53 E.00237
G1 X134.486 Y108.797 E.01953
G1 X134.903 Y109.214 E.01954
G1 X135.17 Y109.738 E.01953
G1 X135.255 Y110.273 E.01795
G1 X135.255 Y121.127 E.36007
G1 X135.17 Y121.662 E.01795
G1 X134.903 Y122.186 E.01953
G1 X134.486 Y122.603 E.01954
G1 X133.962 Y122.87 E.01953
G1 X133.427 Y122.955 E.01795
G1 X122.573 Y122.955 E.36007
G1 X122.038 Y122.87 E.01795
G1 X121.514 Y122.603 E.01953
G1 X121.097 Y122.186 E.01954
G1 X120.83 Y121.662 E.01953
G1 X120.745 Y121.127 E.01795
G1 X120.745 Y110.273 E.36007
G1 X120.83 Y109.738 E.01795
G1 X121.097 Y109.214 E.01953
G1 X121.514 Y108.797 E.01953
G1 X122.038 Y108.53 E.01954
G1 X122.573 Y108.445 E.01794
G1 X133.427 Y108.445 E.36007
G1 X133.832 Y108.509 E.01359
M204 S250
G1 X133.83 Y108.906 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.839 Y108.907 E.00028
G1 X134.253 Y109.118 E.01428
G1 X134.582 Y109.447 E.01428
G1 X134.793 Y109.861 E.01428
G1 X134.863 Y110.303 E.01377
G1 X134.863 Y121.097 E.33164
G1 X134.793 Y121.539 E.01377
G1 X134.582 Y121.953 E.01428
G1 X134.253 Y122.282 E.01428
G1 X133.839 Y122.493 E.01428
G1 X133.397 Y122.563 E.01377
G1 X122.603 Y122.563 E.33164
G1 X122.161 Y122.493 E.01377
G1 X121.747 Y122.282 E.01428
G1 X121.418 Y121.953 E.01428
G1 X121.207 Y121.539 E.01428
G1 X121.137 Y121.097 E.01377
G1 X121.137 Y110.304 E.33164
G1 X121.207 Y109.861 E.01377
G1 X121.418 Y109.447 E.01428
G1 X121.747 Y109.118 E.01428
G1 X122.161 Y108.907 E.01428
G1 X122.603 Y108.837 E.01377
G1 X133.397 Y108.837 E.33164
G1 X133.771 Y108.897 E.01164
; WIPE_START
M204 S6000
G1 X133.839 Y108.907 E-.02632
G1 X134.253 Y109.118 E-.17659
G1 X134.582 Y109.447 E-.1766
G1 X134.793 Y109.861 E-.17659
G1 X134.863 Y110.303 E-.17024
G1 X134.863 Y110.392 E-.03367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.279 Y118.013 Z4.2 F42000
G1 X135.551 Y123.008 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3744
M204 S6000
G1 X135.308 Y123.251 E.0114
G1 X135.002 Y123.407 E.0114
G1 X134.615 Y123.469 E.013
G1 X121.385 Y123.469 E.43887
G1 X120.998 Y123.407 E.013
G1 X120.692 Y123.251 E.0114
G1 X120.449 Y123.008 E.0114
G1 X120.293 Y122.702 E.0114
G1 X120.231 Y122.315 E.013
G1 X120.231 Y109.085 E.43887
G1 X120.293 Y108.698 E.013
G1 X120.449 Y108.392 E.0114
G1 X120.692 Y108.149 E.0114
G1 X120.998 Y107.993 E.0114
G1 X121.385 Y107.931 E.013
G1 X134.615 Y107.931 E.43887
G1 X134.886 Y107.974 E.0091
G1 X135.002 Y107.993 E.0039
G1 X135.308 Y108.149 E.0114
G1 X135.551 Y108.392 E.0114
G1 X135.707 Y108.698 E.0114
G1 X135.769 Y109.085 E.013
G1 X135.769 Y122.315 E.43887
G1 X135.707 Y122.702 E.013
G1 X135.579 Y122.955 E.00941
M204 S250
G1 X135.872 Y123.242 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.542 Y123.573 E.01437
G1 X135.125 Y123.785 E.01438
G1 X134.646 Y123.861 E.0149
G1 X121.354 Y123.861 E.40842
G1 X120.875 Y123.785 E.01489
G1 X120.458 Y123.573 E.01438
G1 X120.127 Y123.242 E.01438
G1 X119.915 Y122.825 E.01438
G1 X119.839 Y122.346 E.0149
G1 X119.839 Y109.054 E.40842
G1 X119.915 Y108.575 E.01489
M73 P78 R3
G1 X120.127 Y108.158 E.01438
G1 X120.458 Y107.827 E.01438
G1 X120.875 Y107.615 E.01438
G1 X121.354 Y107.539 E.0149
G1 X134.646 Y107.539 E.40842
G1 X134.947 Y107.587 E.00937
G1 X135.125 Y107.615 E.00552
G1 X135.542 Y107.827 E.01438
G1 X135.873 Y108.158 E.01438
G1 X136.085 Y108.575 E.01438
G1 X136.161 Y109.054 E.01489
G1 X136.161 Y122.346 E.40842
G1 X136.085 Y122.825 E.01489
G1 X135.9 Y123.189 E.01255
; WIPE_START
M204 S6000
G1 X135.542 Y123.573 E-.19947
G1 X135.125 Y123.785 E-.17782
G1 X134.646 Y123.861 E-.18421
G1 X134.124 Y123.861 E-.1985
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


; object ids of this layer19 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X133.882 Y123.265 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520411
G1 F3744
M204 S6000
G1 X134.721 Y122.993 E.03434
; LINE_WIDTH: 0.563087
G1 X135.495 Y122.671 E.03553
M204 S10000
G1 X135.565 Y122.094 F42000
; LINE_WIDTH: 0.632052
G1 F3744
M204 S6000
G1 X135.345 Y122.396 E.01796
; LINE_WIDTH: 0.665847
G3 X134.999 Y122.826 I-1.528 J-.879 E.02811
; LINE_WIDTH: 0.661134
G1 X134.696 Y123.045 E.01884
; LINE_WIDTH: 0.632045
G1 X134.394 Y123.265 E.01796
M204 S10000
G1 X134.073 Y123.16 F42000
; LINE_WIDTH: 0.248364
G1 F3744
M204 S6000
G1 X134.041 Y123.165 E.00054
; LINE_WIDTH: 0.220051
G1 X133.746 Y123.188 E.00427
; LINE_WIDTH: 0.15045
G1 X133.443 Y123.212 E.00266
G1 X122.548 Y123.211 E.09547
; LINE_WIDTH: 0.173672
G1 X122.254 Y123.188 E.00315
; LINE_WIDTH: 0.220055
G1 X121.959 Y123.165 E.00427
; LINE_WIDTH: 0.248366
G1 X121.927 Y123.16 E.00054
M204 S10000
G1 X122.118 Y123.265 F42000
; LINE_WIDTH: 0.520404
G1 F3744
M204 S6000
G1 X121.279 Y122.993 E.03434
; LINE_WIDTH: 0.563085
G1 X120.505 Y122.671 E.03553
M204 S10000
G1 X120.435 Y122.094 F42000
; LINE_WIDTH: 0.632045
G1 F3744
M204 S6000
G1 X120.655 Y122.396 E.01796
; LINE_WIDTH: 0.661134
G1 X120.874 Y122.699 E.01884
; LINE_WIDTH: 0.665847
G2 X121.304 Y123.045 I1.308 J-1.181 E.02811
; LINE_WIDTH: 0.632052
G1 X121.606 Y123.265 E.01796
M204 S10000
G1 X121.029 Y123.195 F42000
; LINE_WIDTH: 0.563087
G1 F3744
M204 S6000
G1 X120.707 Y122.421 E.03553
; LINE_WIDTH: 0.520411
G1 X120.435 Y121.582 E.03434
M204 S10000
G1 X120.54 Y121.773 F42000
; LINE_WIDTH: 0.248364
G1 F3744
M204 S6000
G1 X120.535 Y121.741 E.00054
; LINE_WIDTH: 0.220051
G1 X120.512 Y121.446 E.00427
; LINE_WIDTH: 0.173673
G1 X120.489 Y121.152 E.00315
; LINE_WIDTH: 0.15045
G1 X120.488 Y110.257 E.09547
G1 X120.512 Y109.954 E.00266
; LINE_WIDTH: 0.220055
G1 X120.535 Y109.659 E.00427
; LINE_WIDTH: 0.248366
G1 X120.54 Y109.627 E.00054
M204 S10000
G1 X120.435 Y109.818 F42000
; LINE_WIDTH: 0.520404
G1 F3744
M204 S6000
G1 X120.707 Y108.979 E.03434
; LINE_WIDTH: 0.563092
G1 X121.029 Y108.205 E.03553
M204 S10000
G1 X121.606 Y108.135 F42000
; LINE_WIDTH: 0.632049
G1 F3744
M204 S6000
G1 X121.304 Y108.355 E.01796
; LINE_WIDTH: 0.665851
G2 X120.874 Y108.701 I.879 J1.529 E.02811
; LINE_WIDTH: 0.661142
G1 X120.655 Y109.004 E.01884
; LINE_WIDTH: 0.632053
G1 X120.435 Y109.306 E.01796
M204 S10000
G1 X120.505 Y108.73 F42000
; LINE_WIDTH: 0.563127
G1 F3744
M204 S6000
G1 X121.279 Y108.408 E.03553
; LINE_WIDTH: 0.520431
G1 X122.118 Y108.135 E.03434
M204 S10000
G1 X121.927 Y108.24 F42000
; LINE_WIDTH: 0.248354
G1 F3744
M204 S6000
G1 X121.959 Y108.235 E.00054
; LINE_WIDTH: 0.220051
G1 X122.254 Y108.212 E.00427
; LINE_WIDTH: 0.173673
G1 X122.548 Y108.189 E.00315
; LINE_WIDTH: 0.15045
G1 X133.443 Y108.188 E.09547
G1 X133.746 Y108.212 E.00266
; LINE_WIDTH: 0.220055
G1 X134.041 Y108.235 E.00427
; LINE_WIDTH: 0.248366
G1 X134.073 Y108.24 E.00054
M204 S10000
G1 X133.882 Y108.135 F42000
; LINE_WIDTH: 0.520414
G1 F3744
M204 S6000
G1 X134.721 Y108.407 E.03434
; LINE_WIDTH: 0.563098
G1 X134.798 Y108.44 E.00355
; LINE_WIDTH: 0.600121
G1 X134.848 Y108.465 E.00255
; LINE_WIDTH: 0.632032
G1 X134.924 Y108.52 E.00446
; LINE_WIDTH: 0.661132
G1 X134.999 Y108.574 E.00468
; LINE_WIDTH: 0.665845
G3 X135.345 Y109.004 I-1.182 J1.308 E.02811
; LINE_WIDTH: 0.632046
G1 X135.565 Y109.306 E.01796
M204 S10000
G1 X134.971 Y108.205 F42000
; LINE_WIDTH: 0.563085
G1 F3744
M204 S6000
G1 X135.293 Y108.979 E.03553
; LINE_WIDTH: 0.52041
G1 X135.565 Y109.818 E.03434
M204 S10000
G1 X135.46 Y109.627 F42000
; LINE_WIDTH: 0.248364
G1 F3744
M204 S6000
G1 X135.465 Y109.659 E.00054
; LINE_WIDTH: 0.220051
G1 X135.488 Y109.954 E.00427
; LINE_WIDTH: 0.173673
G1 X135.511 Y110.248 E.00315
; LINE_WIDTH: 0.15045
G1 X135.512 Y121.143 E.09547
G1 X135.488 Y121.446 E.00266
; LINE_WIDTH: 0.220055
G1 X135.465 Y121.741 E.00427
; LINE_WIDTH: 0.248366
G1 X135.46 Y121.773 E.00054
M204 S10000
G1 X135.565 Y121.582 F42000
; LINE_WIDTH: 0.520404
G1 F3744
M204 S6000
G1 X135.293 Y122.421 E.03434
; LINE_WIDTH: 0.563085
G1 X134.971 Y123.195 E.03553
; WIPE_START
G1 F6920.889
G1 X135.293 Y122.421 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.713 Y117.213 Z4.2 F42000
G1 X126.723 Y114.423 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3744
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.948 J2.347 E.03077
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
G1 X129.277 Y113.792 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3744
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02115
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.10748
G1 X129.915 Y114.423 E-.1318
G1 X129.277 Y114.423 E-.24234
G1 X129.277 Y113.931 E-.18686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3744
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.669 J-1.519 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10745
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3744
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.991 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16103
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X128.575 Y118.327 I-.895 J2.534 E.21349
G1 X128.36 Y118.361 E.00671
G3 X128.136 Y113.018 I-.359 J-2.661 E.27441
G3 X128.835 Y113.149 I-.139 J2.684 E.02194
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14845
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.1258
G1 X130.345 Y114.388 E-.1082
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 20/36
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I1.041 J.631 P1  F42000
G1 X133.939 Y108.462 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3594
M204 S6000
G1 X134.007 Y108.473 E.00231
G1 X134.537 Y108.742 E.01972
G1 X134.958 Y109.163 E.01972
G1 X135.227 Y109.693 E.01972
G1 X135.313 Y110.233 E.01813
G1 X135.313 Y121.167 E.36272
G1 X135.227 Y121.707 E.01813
G1 X134.958 Y122.237 E.01972
G1 X134.537 Y122.658 E.01972
G1 X134.007 Y122.927 E.01972
G1 X133.467 Y123.013 E.01813
G1 X122.533 Y123.013 E.36272
G1 X121.993 Y122.927 E.01813
G1 X121.463 Y122.658 E.01972
G1 X121.042 Y122.237 E.01972
G1 X120.773 Y121.707 E.01972
G1 X120.687 Y121.167 E.01813
G1 X120.687 Y110.233 E.36272
G1 X120.773 Y109.693 E.01813
G1 X121.042 Y109.163 E.01972
G1 X121.463 Y108.742 E.01972
G1 X121.993 Y108.473 E.01972
G1 X122.533 Y108.387 E.01813
G1 X133.467 Y108.387 E.36272
G1 X133.879 Y108.452 E.01384
M204 S250
G1 X133.877 Y108.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3594
M204 S5000
G1 X133.885 Y108.85 E.00023
G1 X134.304 Y109.064 E.01445
G1 X134.636 Y109.396 E.01445
G1 X134.85 Y109.815 E.01445
G1 X134.921 Y110.264 E.01394
G1 X134.921 Y121.137 E.3341
G1 X134.85 Y121.585 E.01394
G1 X134.636 Y122.004 E.01445
G1 X134.304 Y122.336 E.01445
G1 X133.885 Y122.55 E.01445
G1 X133.437 Y122.621 E.01394
G1 X122.563 Y122.621 E.3341
G1 X122.115 Y122.55 E.01394
G1 X121.696 Y122.336 E.01445
G1 X121.364 Y122.004 E.01445
G1 X121.15 Y121.585 E.01445
G1 X121.079 Y121.137 E.01394
G1 X121.079 Y110.263 E.3341
G1 X121.15 Y109.815 E.01394
G1 X121.364 Y109.396 E.01445
G1 X121.696 Y109.064 E.01445
G1 X122.115 Y108.85 E.01445
G1 X122.563 Y108.779 E.01394
G1 X133.437 Y108.779 E.3341
G1 X133.818 Y108.84 E.01187
; WIPE_START
G1 F3600
M204 S6000
G1 X133.885 Y108.85 E-.02565
G1 X134.304 Y109.064 E-.17875
G1 X134.636 Y109.396 E-.17876
G1 X134.85 Y109.815 E-.17875
G1 X134.921 Y110.264 E-.1724
G1 X134.921 Y110.331 E-.02569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.322 Y117.953 Z4.4 F42000
G1 X135.59 Y123.043 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3594
M204 S6000
G1 X135.343 Y123.29 E.01158
G1 X135.032 Y123.448 E.01158
G1 X134.64 Y123.51 E.01317
G1 X121.36 Y123.51 E.44052
G1 X120.968 Y123.448 E.01317
G1 X120.657 Y123.29 E.01157
G1 X120.41 Y123.043 E.01158
G1 X120.252 Y122.732 E.01158
G1 X120.19 Y122.34 E.01317
G1 X120.19 Y109.06 E.44052
G1 X120.252 Y108.668 E.01317
G1 X120.41 Y108.357 E.01157
G1 X120.657 Y108.11 E.01158
M73 P79 R3
G1 X120.968 Y107.952 E.01158
G1 X121.36 Y107.89 E.01317
G1 X134.64 Y107.89 E.44053
G1 X134.928 Y107.935 E.00967
G1 X135.032 Y107.952 E.0035
G1 X135.343 Y108.11 E.01158
G1 X135.59 Y108.357 E.01158
G1 X135.748 Y108.668 E.01158
G1 X135.81 Y109.06 E.01317
G1 X135.81 Y122.34 E.44052
G1 X135.748 Y122.732 E.01317
G1 X135.617 Y122.99 E.00958
M204 S250
G1 X135.911 Y123.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3594
M204 S5000
G1 X135.576 Y123.611 E.01453
G1 X135.155 Y123.826 E.01454
G1 X134.671 Y123.903 E.01506
G1 X121.329 Y123.903 E.40996
G1 X120.845 Y123.826 E.01506
G1 X120.424 Y123.611 E.01454
G1 X120.089 Y123.276 E.01454
G1 X119.874 Y122.855 E.01454
G1 X119.797 Y122.371 E.01506
G1 X119.797 Y109.029 E.40996
G1 X119.874 Y108.545 E.01506
G1 X120.089 Y108.124 E.01454
G1 X120.424 Y107.789 E.01454
G1 X120.845 Y107.574 E.01454
G1 X121.329 Y107.498 E.01506
G1 X134.671 Y107.498 E.40996
G1 X134.989 Y107.548 E.00991
G1 X135.155 Y107.574 E.00515
G1 X135.576 Y107.789 E.01454
G1 X135.911 Y108.124 E.01454
G1 X136.126 Y108.545 E.01454
G1 X136.203 Y109.029 E.01506
G1 X136.203 Y122.371 E.40996
G1 X136.126 Y122.855 E.01506
G1 X135.938 Y123.223 E.0127
; WIPE_START
G1 F3600
M204 S6000
G1 X135.576 Y123.611 E-.20155
G1 X135.155 Y123.826 E-.1798
G1 X134.671 Y123.903 E-.18619
G1 X134.164 Y123.903 E-.19246
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


; object ids of this layer20 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X133.945 Y123.307 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.486428
G1 F3594
M204 S6000
G1 X134.356 Y123.173 E.01564
; LINE_WIDTH: 0.512889
G1 X134.768 Y123.04 E.01657
; LINE_WIDTH: 0.545073
G1 X134.842 Y123.009 E.0033
; LINE_WIDTH: 0.577992
G1 X134.883 Y122.988 E.00197
; LINE_WIDTH: 0.607182
G1 X134.962 Y122.931 E.00449
; LINE_WIDTH: 0.637709
G1 X135.041 Y122.873 E.00473
; LINE_WIDTH: 0.647753
G2 X135.231 Y122.662 I-.573 J-.706 E.01408
; LINE_WIDTH: 0.607184
G1 X135.288 Y122.583 E.00449
; LINE_WIDTH: 0.577988
G1 X135.308 Y122.542 E.00197
; LINE_WIDTH: 0.545079
G1 X135.34 Y122.468 E.0033
; LINE_WIDTH: 0.512891
G1 X135.473 Y122.056 E.01657
; LINE_WIDTH: 0.48643
G1 X135.607 Y121.645 E.01564
M204 S10000
G1 X135.51 Y121.815 F42000
; LINE_WIDTH: 0.232246
G1 F3594
M204 S6000
G1 X135.515 Y121.785 E.00046
; LINE_WIDTH: 0.204115
G1 X135.538 Y121.488 E.00392
; LINE_WIDTH: 0.133945
G1 X135.562 Y121.183 E.00227
G1 X135.561 Y110.21 E.0814
; LINE_WIDTH: 0.157289
G1 X135.538 Y109.912 E.00278
; LINE_WIDTH: 0.20411
G1 X135.515 Y109.615 E.00392
; LINE_WIDTH: 0.232247
G1 X135.51 Y109.585 E.00046
M204 S10000
G1 X135.607 Y109.755 F42000
; LINE_WIDTH: 0.486428
G1 F3594
M204 S6000
G1 X135.473 Y109.344 E.01564
; LINE_WIDTH: 0.512887
G1 X135.339 Y108.932 E.01657
; LINE_WIDTH: 0.545072
G1 X135.308 Y108.858 E.0033
; LINE_WIDTH: 0.57799
G1 X135.288 Y108.817 E.00197
; LINE_WIDTH: 0.607181
G1 X135.231 Y108.738 E.00449
; LINE_WIDTH: 0.647753
G2 X135.04 Y108.527 I-.763 J.494 E.01409
; LINE_WIDTH: 0.637706
G1 X134.962 Y108.469 E.00473
; LINE_WIDTH: 0.601132
G2 X134.855 Y108.398 I-.279 J.301 E.00587
; LINE_WIDTH: 0.548487
G1 X134.768 Y108.361 E.00389
; LINE_WIDTH: 0.512896
G1 X134.356 Y108.227 E.01657
; LINE_WIDTH: 0.486446
G1 X133.945 Y108.093 E.01564
M204 S10000
G1 X134.115 Y108.19 F42000
; LINE_WIDTH: 0.232246
G1 F3594
M204 S6000
G1 X134.085 Y108.185 E.00046
; LINE_WIDTH: 0.204115
G1 X133.788 Y108.162 E.00392
; LINE_WIDTH: 0.133945
G1 X133.483 Y108.138 E.00227
G1 X122.51 Y108.139 E.0814
; LINE_WIDTH: 0.157289
G1 X122.212 Y108.162 E.00278
; LINE_WIDTH: 0.20411
G1 X121.915 Y108.185 E.00392
; LINE_WIDTH: 0.232247
G1 X121.885 Y108.19 E.00046
M204 S10000
G1 X122.055 Y108.093 F42000
; LINE_WIDTH: 0.48642
G1 F3594
M204 S6000
G1 X121.644 Y108.227 E.01564
; LINE_WIDTH: 0.512877
G1 X121.232 Y108.361 E.01657
; LINE_WIDTH: 0.54507
G1 X121.158 Y108.392 E.00331
; LINE_WIDTH: 0.577985
G1 X121.117 Y108.412 E.00197
; LINE_WIDTH: 0.607186
G1 X121.038 Y108.469 E.00449
; LINE_WIDTH: 0.647756
G2 X120.827 Y108.66 I.494 J.764 E.01409
; LINE_WIDTH: 0.637735
G1 X120.769 Y108.738 E.00473
; LINE_WIDTH: 0.607211
G1 X120.712 Y108.817 E.00449
; LINE_WIDTH: 0.578013
G1 X120.692 Y108.858 E.00197
; LINE_WIDTH: 0.545113
G1 X120.661 Y108.932 E.0033
; LINE_WIDTH: 0.51291
G1 X120.527 Y109.344 E.01657
; LINE_WIDTH: 0.486449
G1 X120.393 Y109.755 E.01564
M204 S10000
G1 X120.49 Y109.585 F42000
; LINE_WIDTH: 0.232227
G1 F3594
M204 S6000
M73 P79 R2
G1 X120.485 Y109.615 E.00046
; LINE_WIDTH: 0.2041
G1 X120.462 Y109.912 E.00392
; LINE_WIDTH: 0.133945
G1 X120.438 Y110.217 E.00227
G1 X120.439 Y121.19 E.0814
; LINE_WIDTH: 0.157289
G1 X120.462 Y121.488 E.00278
; LINE_WIDTH: 0.20411
G1 X120.485 Y121.785 E.00392
; LINE_WIDTH: 0.232247
G1 X120.49 Y121.815 E.00046
M204 S10000
G1 X120.393 Y121.645 F42000
; LINE_WIDTH: 0.486428
G1 F3594
M204 S6000
G1 X120.527 Y122.056 E.01564
; LINE_WIDTH: 0.512889
G1 X120.66 Y122.468 E.01657
; LINE_WIDTH: 0.545073
G1 X120.692 Y122.542 E.0033
; LINE_WIDTH: 0.577992
G1 X120.712 Y122.583 E.00197
; LINE_WIDTH: 0.607182
G1 X120.769 Y122.662 E.00449
; LINE_WIDTH: 0.637709
G1 X120.827 Y122.741 E.00473
; LINE_WIDTH: 0.647753
G2 X121.038 Y122.931 I.706 J-.573 E.01408
; LINE_WIDTH: 0.607184
G1 X121.117 Y122.988 E.00449
; LINE_WIDTH: 0.577988
G1 X121.158 Y123.009 E.00197
; LINE_WIDTH: 0.545079
G1 X121.232 Y123.04 E.0033
; LINE_WIDTH: 0.512891
G1 X121.644 Y123.173 E.01657
; LINE_WIDTH: 0.48643
G1 X122.055 Y123.307 E.01564
M204 S10000
G1 X121.885 Y123.21 F42000
; LINE_WIDTH: 0.232246
G1 F3594
M204 S6000
G1 X121.915 Y123.215 E.00046
; LINE_WIDTH: 0.204115
G1 X122.212 Y123.238 E.00392
; LINE_WIDTH: 0.157279
G1 X122.51 Y123.261 E.00278
; LINE_WIDTH: 0.133945
G1 X133.483 Y123.262 E.0814
G1 X133.788 Y123.238 E.00227
; LINE_WIDTH: 0.20411
G1 X134.085 Y123.215 E.00392
; LINE_WIDTH: 0.232247
G1 X134.115 Y123.21 E.00046
; WIPE_START
G1 F15000
G1 X134.085 Y123.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.185 Y117.363 Z4.4 F42000
G1 X126.723 Y114.423 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3594
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3594
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
G1 X129.277 Y113.792 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3594
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10745
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3594
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.624 Y117.318 E.00337
G3 X129.277 Y117.608 I-1.347 J-1.259 E.01505
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.624 Y117.318 E-.03864
G1 X129.494 Y117.444 E-.06883
G1 X129.277 Y117.608 E-.10345
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3594
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.991 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.17 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3594
M204 S5000
G3 X126.655 Y113.371 I-.9 J2.531 E.44751
G3 X128.122 Y113.018 I1.351 J2.394 E.04697
G3 X128.835 Y113.151 I-.131 J2.683 E.02234
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14844
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12582
G1 X130.195 Y114.146 E-.12585
G1 X130.345 Y114.388 E-.10819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 21/36
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I1.04 J.633 P1  F42000
G1 X133.986 Y108.405 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3620
M204 S6000
G1 X134.053 Y108.415 E.00224
G1 X134.588 Y108.688 E.01991
G1 X135.012 Y109.112 E.01991
G1 X135.285 Y109.647 E.01991
G1 X135.371 Y110.193 E.01832
G1 X135.371 Y121.207 E.36538
G1 X135.285 Y121.753 E.01832
G1 X135.012 Y122.288 E.01991
G1 X134.588 Y122.712 E.01991
G1 X134.053 Y122.985 E.01991
G1 X133.507 Y123.071 E.01832
G1 X122.493 Y123.071 E.36538
G1 X121.947 Y122.985 E.01832
G1 X121.412 Y122.712 E.01991
G1 X120.988 Y122.288 E.01991
G1 X120.715 Y121.753 E.01991
G1 X120.629 Y121.207 E.01832
G1 X120.629 Y110.193 E.36538
G1 X120.715 Y109.647 E.01832
G1 X120.988 Y109.112 E.01991
G1 X121.412 Y108.688 E.01991
G1 X121.947 Y108.415 E.01991
G1 X122.493 Y108.329 E.01832
G1 X133.507 Y108.329 E.36538
G1 X133.927 Y108.395 E.0141
M204 S250
G1 X133.925 Y108.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.93 Y108.793 E.00016
G1 X134.354 Y109.009 E.01463
G1 X134.691 Y109.346 E.01463
G1 X134.907 Y109.77 E.01463
G1 X134.979 Y110.223 E.01412
G1 X134.979 Y121.177 E.33656
G1 X134.907 Y121.63 E.01412
G1 X134.691 Y122.054 E.01463
G1 X134.354 Y122.391 E.01463
G1 X133.93 Y122.607 E.01463
G1 X133.477 Y122.679 E.01412
G1 X122.523 Y122.679 E.33656
G1 X122.07 Y122.607 E.01412
G1 X121.646 Y122.391 E.01463
G1 X121.309 Y122.054 E.01463
G1 X121.093 Y121.63 E.01463
G1 X121.021 Y121.177 E.01412
G1 X121.021 Y110.223 E.33656
G1 X121.093 Y109.77 E.01412
G1 X121.309 Y109.346 E.01463
M73 P80 R2
G1 X121.646 Y109.009 E.01463
G1 X122.07 Y108.793 E.01463
G1 X122.523 Y108.721 E.01412
G1 X133.477 Y108.721 E.33656
G1 X133.866 Y108.783 E.01211
; WIPE_START
M204 S6000
G1 X133.93 Y108.793 E-.02481
G1 X134.354 Y109.009 E-.18091
G1 X134.691 Y109.346 E-.18093
G1 X134.907 Y109.77 E-.1809
G1 X134.979 Y110.223 E-.17456
G1 X134.979 Y110.271 E-.01789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.366 Y117.893 Z4.6 F42000
G1 X135.628 Y123.078 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3620
M204 S6000
G1 X135.378 Y123.328 E.01175
G1 X135.062 Y123.489 E.01175
G1 X134.665 Y123.552 E.01335
G1 X121.335 Y123.552 E.44218
G1 X120.938 Y123.489 E.01334
G1 X120.622 Y123.328 E.01175
G1 X120.372 Y123.078 E.01175
G1 X120.211 Y122.762 E.01175
G1 X120.148 Y122.365 E.01335
G1 X120.148 Y109.035 E.44218
G1 X120.211 Y108.638 E.01334
G1 X120.372 Y108.322 E.01175
G1 X120.622 Y108.072 E.01175
G1 X120.938 Y107.911 E.01175
G1 X121.335 Y107.848 E.01335
G1 X134.665 Y107.848 E.44218
G1 X134.97 Y107.896 E.01025
G1 X135.062 Y107.911 E.00309
G1 X135.378 Y108.072 E.01175
G1 X135.628 Y108.322 E.01175
G1 X135.789 Y108.638 E.01175
G1 X135.852 Y109.035 E.01334
G1 X135.852 Y122.365 E.44218
G1 X135.789 Y122.762 E.01334
G1 X135.656 Y123.024 E.00976
M204 S250
G1 X135.95 Y123.311 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.611 Y123.65 E.0147
G1 X135.185 Y123.867 E.0147
G1 X134.696 Y123.944 E.01522
G1 X121.304 Y123.944 E.41149
G1 X120.815 Y123.867 E.01522
G1 X120.389 Y123.65 E.0147
G1 X120.05 Y123.311 E.0147
G1 X119.833 Y122.885 E.0147
G1 X119.756 Y122.396 E.01522
G1 X119.756 Y109.004 E.41149
G1 X119.833 Y108.515 E.01522
G1 X120.05 Y108.089 E.0147
G1 X120.389 Y107.75 E.0147
G1 X120.815 Y107.533 E.0147
G1 X121.304 Y107.456 E.01522
G1 X134.696 Y107.456 E.41149
G1 X135.032 Y107.509 E.01044
G1 X135.185 Y107.533 E.00477
G1 X135.611 Y107.75 E.0147
G1 X135.95 Y108.089 E.0147
G1 X136.167 Y108.515 E.0147
G1 X136.244 Y109.004 E.01522
G1 X136.244 Y122.396 E.41149
G1 X136.167 Y122.885 E.01522
G1 X135.977 Y123.258 E.01286
; WIPE_START
M204 S6000
G1 X135.611 Y123.65 E-.20359
G1 X135.185 Y123.867 E-.18179
G1 X134.696 Y123.944 E-.18817
G1 X134.205 Y123.944 E-.18644
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


; object ids of this layer21 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.008 Y123.349 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463961
G1 F3620
M204 S6000
G1 X134.411 Y123.218 E.01455
; LINE_WIDTH: 0.493836
G1 X134.815 Y123.087 E.01558
; LINE_WIDTH: 0.527054
G1 X134.887 Y123.057 E.00307
; LINE_WIDTH: 0.555854
G1 X134.917 Y123.041 E.00142
; LINE_WIDTH: 0.582329
G1 X134.999 Y122.981 E.00449
; LINE_WIDTH: 0.614291
G1 X135.082 Y122.921 E.00476
; LINE_WIDTH: 0.624799
G2 X135.281 Y122.699 I-.6 J-.739 E.01418
; LINE_WIDTH: 0.582309
G1 X135.341 Y122.617 E.00449
; LINE_WIDTH: 0.555846
G1 X135.357 Y122.587 E.00142
; LINE_WIDTH: 0.527073
G1 X135.386 Y122.515 E.00307
; LINE_WIDTH: 0.493852
G1 X135.518 Y122.111 E.01558
; LINE_WIDTH: 0.463963
G1 X135.649 Y121.708 E.01455
M204 S10000
G1 X135.56 Y121.857 F42000
; LINE_WIDTH: 0.216112
G1 F3620
M204 S6000
G1 X135.564 Y121.83 E.00039
; LINE_WIDTH: 0.188165
G1 X135.588 Y121.529 E.00357
; LINE_WIDTH: 0.11744
G1 X135.612 Y121.223 E.00186
G1 X135.611 Y110.171 E.06712
; LINE_WIDTH: 0.140893
G1 X135.588 Y109.871 E.0024
; LINE_WIDTH: 0.188165
G1 X135.564 Y109.57 E.00357
; LINE_WIDTH: 0.21613
G1 X135.56 Y109.543 E.00039
M204 S10000
G1 X135.649 Y109.692 F42000
; LINE_WIDTH: 0.463971
G1 F3620
M204 S6000
G1 X135.518 Y109.289 E.01455
; LINE_WIDTH: 0.493847
G1 X135.386 Y108.885 E.01558
; LINE_WIDTH: 0.527059
G1 X135.357 Y108.813 E.00307
; LINE_WIDTH: 0.555858
G1 X135.341 Y108.783 E.00142
; LINE_WIDTH: 0.582336
G1 X135.281 Y108.701 E.00449
; LINE_WIDTH: 0.62481
G2 X135.082 Y108.479 I-.799 J.517 E.01419
; LINE_WIDTH: 0.614283
G1 X134.999 Y108.419 E.00476
; LINE_WIDTH: 0.578562
G2 X134.898 Y108.349 I-.27 J.285 E.00537
; LINE_WIDTH: 0.530355
G1 X134.815 Y108.314 E.00362
; LINE_WIDTH: 0.493862
G1 X134.411 Y108.182 E.01558
; LINE_WIDTH: 0.463993
G1 X134.008 Y108.051 E.01455
M204 S10000
G1 X134.157 Y108.14 F42000
; LINE_WIDTH: 0.216112
G1 F3620
M204 S6000
G1 X134.13 Y108.136 E.00039
; LINE_WIDTH: 0.188165
G1 X133.829 Y108.112 E.00357
; LINE_WIDTH: 0.11744
G1 X133.523 Y108.088 E.00186
G1 X122.471 Y108.089 E.06712
; LINE_WIDTH: 0.140893
G1 X122.17 Y108.112 E.0024
; LINE_WIDTH: 0.188165
G1 X121.87 Y108.136 E.00357
; LINE_WIDTH: 0.21613
G1 X121.843 Y108.14 E.00039
M204 S10000
G1 X121.992 Y108.051 F42000
; LINE_WIDTH: 0.463961
G1 F3620
M204 S6000
G1 X121.589 Y108.182 E.01455
; LINE_WIDTH: 0.493836
G1 X121.185 Y108.314 E.01558
; LINE_WIDTH: 0.527054
G1 X121.113 Y108.343 E.00307
; LINE_WIDTH: 0.555854
G1 X121.083 Y108.359 E.00142
; LINE_WIDTH: 0.582329
G1 X121.001 Y108.419 E.00449
; LINE_WIDTH: 0.624801
G2 X120.779 Y108.618 I.518 J.799 E.01418
; LINE_WIDTH: 0.614287
G1 X120.719 Y108.701 E.00476
; LINE_WIDTH: 0.582309
G1 X120.659 Y108.783 E.00449
; LINE_WIDTH: 0.555846
G1 X120.643 Y108.813 E.00142
; LINE_WIDTH: 0.527073
G1 X120.614 Y108.885 E.00307
; LINE_WIDTH: 0.493852
G1 X120.482 Y109.289 E.01558
; LINE_WIDTH: 0.463963
G1 X120.351 Y109.692 E.01455
M204 S10000
G1 X120.44 Y109.543 F42000
; LINE_WIDTH: 0.216112
G1 F3620
M204 S6000
G1 X120.436 Y109.57 E.00039
; LINE_WIDTH: 0.188165
G1 X120.412 Y109.871 E.00357
; LINE_WIDTH: 0.11744
G1 X120.388 Y110.177 E.00186
G1 X120.389 Y121.229 E.06712
; LINE_WIDTH: 0.140893
G1 X120.412 Y121.53 E.0024
; LINE_WIDTH: 0.188165
G1 X120.436 Y121.83 E.00357
; LINE_WIDTH: 0.21613
G1 X120.44 Y121.857 E.00039
M204 S10000
G1 X120.351 Y121.708 F42000
; LINE_WIDTH: 0.463961
G1 F3620
M204 S6000
G1 X120.482 Y122.111 E.01455
; LINE_WIDTH: 0.493836
G1 X120.613 Y122.515 E.01558
; LINE_WIDTH: 0.527054
G1 X120.643 Y122.587 E.00307
; LINE_WIDTH: 0.555854
G1 X120.659 Y122.617 E.00142
; LINE_WIDTH: 0.582329
G1 X120.719 Y122.699 E.00449
; LINE_WIDTH: 0.614291
G1 X120.779 Y122.782 E.00476
; LINE_WIDTH: 0.624799
G2 X121.001 Y122.981 I.739 J-.6 E.01418
; LINE_WIDTH: 0.582309
G1 X121.083 Y123.041 E.00449
; LINE_WIDTH: 0.555846
G1 X121.113 Y123.057 E.00142
; LINE_WIDTH: 0.527073
G1 X121.185 Y123.087 E.00307
; LINE_WIDTH: 0.493852
G1 X121.589 Y123.218 E.01558
; LINE_WIDTH: 0.463963
G1 X121.992 Y123.349 E.01455
M204 S10000
G1 X121.843 Y123.26 F42000
; LINE_WIDTH: 0.216112
G1 F3620
M204 S6000
G1 X121.87 Y123.264 E.00039
; LINE_WIDTH: 0.188165
G1 X122.171 Y123.288 E.00357
; LINE_WIDTH: 0.140895
G1 X122.471 Y123.311 E.0024
; LINE_WIDTH: 0.11744
G1 X133.523 Y123.312 E.06712
G1 X133.829 Y123.288 E.00186
; LINE_WIDTH: 0.188165
G1 X134.13 Y123.264 E.00357
; LINE_WIDTH: 0.21613
G1 X134.157 Y123.26 E.00039
; WIPE_START
G1 F15000
G1 X134.13 Y123.264 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.228 Y117.414 Z4.6 F42000
G1 X126.723 Y114.423 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3620
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
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
G1 X129.277 Y113.792 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3620
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13179
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3620
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.0115
G1 X129.615 Y117.327 E.00381
G3 X129.277 Y117.608 I-1.303 J-1.223 E.01461
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13179
G1 X129.615 Y117.327 E-.04369
G1 X129.494 Y117.444 E-.06381
G1 X129.277 Y117.608 E-.10344
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3620
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.642 J-3.357 E.03075
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19119
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.891 Y113.17 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X126.655 Y113.371 I-.9 J2.532 E.44762
G3 X128.109 Y113.018 I1.351 J2.392 E.04656
G3 X128.835 Y113.151 I-.118 J2.685 E.02274
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14843
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
M73 P81 R2
G1 X130.195 Y114.146 E-.12579
G1 X130.345 Y114.388 E-.10823
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 22/36
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I1.039 J.634 P1  F42000
G1 X134.034 Y108.348 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3651
M204 S6000
G1 X134.099 Y108.358 E.00215
G1 X134.638 Y108.633 E.0201
G1 X135.067 Y109.062 E.0201
G1 X135.342 Y109.601 E.0201
G1 X135.429 Y110.153 E.01851
G1 X135.429 Y121.247 E.36803
G1 X135.342 Y121.799 E.01851
G1 X135.067 Y122.338 E.0201
G1 X134.638 Y122.767 E.0201
G1 X134.099 Y123.042 E.0201
G1 X133.547 Y123.129 E.01851
G1 X122.453 Y123.129 E.36803
G1 X121.901 Y123.042 E.01851
G1 X121.362 Y122.767 E.0201
G1 X120.933 Y122.338 E.0201
G1 X120.658 Y121.799 E.0201
G1 X120.571 Y121.247 E.01851
G1 X120.571 Y110.153 E.36803
G1 X120.658 Y109.601 E.01851
G1 X120.933 Y109.062 E.0201
G1 X121.362 Y108.633 E.0201
G1 X121.901 Y108.358 E.0201
G1 X122.453 Y108.271 E.01851
G1 X133.547 Y108.271 E.36803
G1 X133.975 Y108.338 E.01437
M204 S250
G1 X133.973 Y108.735 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.976 Y108.736 E.00009
G1 X134.405 Y108.954 E.0148
G1 X134.746 Y109.295 E.0148
G1 X134.965 Y109.724 E.0148
G1 X135.037 Y110.184 E.01429
G1 X135.037 Y121.217 E.33901
G1 X134.965 Y121.676 E.01429
G1 X134.746 Y122.105 E.0148
G1 X134.405 Y122.446 E.0148
G1 X133.976 Y122.665 E.0148
G1 X133.517 Y122.737 E.01429
G1 X122.483 Y122.737 E.33901
G1 X122.024 Y122.665 E.01429
G1 X121.595 Y122.446 E.0148
G1 X121.254 Y122.105 E.0148
G1 X121.035 Y121.676 E.0148
G1 X120.963 Y121.217 E.01429
G1 X120.963 Y110.184 E.33901
G1 X121.035 Y109.724 E.01429
G1 X121.254 Y109.295 E.0148
G1 X121.595 Y108.954 E.0148
G1 X122.024 Y108.736 E.0148
G1 X122.483 Y108.663 E.01429
G1 X133.517 Y108.663 E.33901
G1 X133.914 Y108.726 E.01236
; WIPE_START
M204 S6000
G1 X133.976 Y108.736 E-.02386
G1 X134.405 Y108.954 E-.18307
G1 X134.746 Y109.295 E-.18309
G1 X134.965 Y109.724 E-.18306
G1 X135.037 Y110.184 E-.17673
G1 X135.037 Y110.21 E-.01018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.409 Y117.834 Z4.8 F42000
G1 X135.667 Y123.113 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3651
M204 S6000
G1 X135.413 Y123.367 E.01192
G1 X135.092 Y123.53 E.01192
G1 X134.69 Y123.594 E.01352
G1 X121.31 Y123.594 E.44384
G1 X120.907 Y123.53 E.01352
G1 X120.587 Y123.367 E.01192
G1 X120.333 Y123.113 E.01192
G1 X120.17 Y122.792 E.01192
G1 X120.106 Y122.39 E.01352
G1 X120.106 Y109.01 E.44384
G1 X120.17 Y108.608 E.01352
G1 X120.333 Y108.287 E.01192
G1 X120.587 Y108.033 E.01192
G1 X120.908 Y107.87 E.01192
G1 X121.31 Y107.806 E.01352
G1 X134.69 Y107.806 E.44384
G1 X135.012 Y107.857 E.01083
G1 X135.092 Y107.87 E.00269
G1 X135.413 Y108.033 E.01192
G1 X135.667 Y108.287 E.01192
G1 X135.83 Y108.608 E.01192
G1 X135.894 Y109.01 E.01352
G1 X135.894 Y122.39 E.44384
G1 X135.83 Y122.793 E.01352
G1 X135.694 Y123.059 E.00993
M204 S250
G1 X135.988 Y123.346 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X135.646 Y123.688 E.01486
G1 X135.215 Y123.908 E.01486
G1 X134.721 Y123.986 E.01538
G1 X121.279 Y123.986 E.41303
G1 X120.785 Y123.908 E.01538
G1 X120.354 Y123.688 E.01486
G1 X120.012 Y123.346 E.01486
G1 X119.792 Y122.915 E.01486
G1 X119.714 Y122.421 E.01538
G1 X119.714 Y108.979 E.41303
G1 X119.792 Y108.485 E.01538
G1 X120.012 Y108.054 E.01486
G1 X120.354 Y107.712 E.01486
G1 X120.785 Y107.492 E.01486
G1 X121.279 Y107.414 E.01538
G1 X134.721 Y107.414 E.41303
G1 X135.074 Y107.47 E.01098
G1 X135.215 Y107.492 E.0044
G1 X135.646 Y107.712 E.01486
G1 X135.988 Y108.054 E.01486
G1 X136.208 Y108.485 E.01486
G1 X136.286 Y108.979 E.01538
G1 X136.286 Y122.421 E.41303
G1 X136.208 Y122.915 E.01538
G1 X136.015 Y123.293 E.01302
; WIPE_START
M204 S6000
G1 X135.646 Y123.688 E-.20557
G1 X135.215 Y123.908 E-.18378
G1 X134.721 Y123.986 E-.19015
G1 X134.246 Y123.986 E-.1805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
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
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.071 Y123.39 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.441504
G1 F3651
M204 S6000
G1 X134.466 Y123.262 E.01349
; LINE_WIDTH: 0.474808
G1 X134.861 Y123.133 E.01462
; LINE_WIDTH: 0.509057
G1 X134.931 Y123.105 E.00285
; LINE_WIDTH: 0.553287
G2 X135.037 Y123.032 I-.177 J-.373 E.0054
; LINE_WIDTH: 0.590863
G1 X135.124 Y122.969 E.00476
; LINE_WIDTH: 0.601846
G2 X135.332 Y122.737 I-.627 J-.772 E.01424
; LINE_WIDTH: 0.557475
G1 X135.394 Y122.651 E.00447
; LINE_WIDTH: 0.514818
G2 X135.433 Y122.561 I-.562 J-.299 E.00376
; LINE_WIDTH: 0.474811
G1 X135.562 Y122.166 E.01462
; LINE_WIDTH: 0.44151
G1 X135.69 Y121.771 E.01349
M204 S10000
G1 X135.61 Y121.899 F42000
; LINE_WIDTH: 0.199992
G1 F3651
M204 S6000
G1 X135.614 Y121.874 E.00032
; LINE_WIDTH: 0.172225
G1 X135.638 Y121.571 E.0032
; LINE_WIDTH: 0.100924
G1 X135.662 Y121.263 E.00146
G1 X135.661 Y110.132 E.05261
; LINE_WIDTH: 0.124492
G1 X135.638 Y109.829 E.00202
; LINE_WIDTH: 0.172218
G1 X135.614 Y109.526 E.0032
; LINE_WIDTH: 0.200003
G1 X135.61 Y109.501 E.00032
M204 S10000
G1 X135.69 Y109.629 F42000
; LINE_WIDTH: 0.441508
G1 F3651
M204 S6000
G1 X135.562 Y109.234 E.01349
; LINE_WIDTH: 0.474803
G1 X135.433 Y108.839 E.01462
; LINE_WIDTH: 0.514821
G2 X135.394 Y108.749 I-.603 J.21 E.00376
; LINE_WIDTH: 0.557474
G1 X135.332 Y108.663 E.00447
; LINE_WIDTH: 0.601843
G2 X135.124 Y108.431 I-.835 J.541 E.01424
; LINE_WIDTH: 0.590855
G1 X135.037 Y108.368 E.00477
; LINE_WIDTH: 0.553277
G2 X134.931 Y108.295 I-.296 J.317 E.0054
; LINE_WIDTH: 0.509084
G1 X134.861 Y108.267 E.00285
; LINE_WIDTH: 0.474816
G1 X134.466 Y108.138 E.01462
; LINE_WIDTH: 0.441526
G1 X134.071 Y108.01 E.01349
M204 S10000
G1 X134.199 Y108.09 F42000
; LINE_WIDTH: 0.199992
G1 F3651
M204 S6000
G1 X134.174 Y108.086 E.00032
; LINE_WIDTH: 0.172225
G1 X133.871 Y108.062 E.0032
; LINE_WIDTH: 0.100924
G1 X133.563 Y108.038 E.00146
G1 X122.432 Y108.039 E.05261
; LINE_WIDTH: 0.124492
G1 X122.129 Y108.062 E.00202
; LINE_WIDTH: 0.172218
G1 X121.826 Y108.086 E.0032
; LINE_WIDTH: 0.200003
G1 X121.801 Y108.09 E.00032
M204 S10000
G1 X121.929 Y108.01 F42000
; LINE_WIDTH: 0.441504
G1 F3651
M204 S6000
G1 X121.534 Y108.138 E.01349
; LINE_WIDTH: 0.474808
G1 X121.139 Y108.267 E.01462
; LINE_WIDTH: 0.514818
G2 X121.049 Y108.306 I.209 J.599 E.00376
; LINE_WIDTH: 0.557474
G1 X120.963 Y108.368 E.00447
; LINE_WIDTH: 0.601848
G2 X120.731 Y108.576 I.541 J.835 E.01424
; LINE_WIDTH: 0.590855
G1 X120.668 Y108.663 E.00476
; LINE_WIDTH: 0.553291
G2 X120.595 Y108.769 I.3 J.284 E.0054
; LINE_WIDTH: 0.50906
G1 X120.567 Y108.839 E.00285
; LINE_WIDTH: 0.474811
G1 X120.438 Y109.234 E.01462
; LINE_WIDTH: 0.44151
G1 X120.31 Y109.629 E.01349
M204 S10000
G1 X120.39 Y109.501 F42000
; LINE_WIDTH: 0.199992
G1 F3651
M204 S6000
G1 X120.386 Y109.526 E.00032
; LINE_WIDTH: 0.172225
G1 X120.362 Y109.829 E.0032
; LINE_WIDTH: 0.100924
G1 X120.338 Y110.137 E.00146
G1 X120.339 Y121.268 E.05261
; LINE_WIDTH: 0.124492
G1 X120.362 Y121.571 E.00202
; LINE_WIDTH: 0.172218
G1 X120.386 Y121.874 E.0032
; LINE_WIDTH: 0.200003
G1 X120.39 Y121.899 E.00032
M204 S10000
G1 X120.31 Y121.771 F42000
; LINE_WIDTH: 0.441508
G1 F3651
M204 S6000
G1 X120.438 Y122.166 E.01349
; LINE_WIDTH: 0.474803
G1 X120.567 Y122.561 E.01462
; LINE_WIDTH: 0.509072
G1 X120.595 Y122.631 E.00285
; LINE_WIDTH: 0.553287
G2 X120.668 Y122.737 I.372 J-.177 E.0054
; LINE_WIDTH: 0.590853
G1 X120.731 Y122.824 E.00476
; LINE_WIDTH: 0.601845
G2 X120.963 Y123.032 I.772 J-.627 E.01424
; LINE_WIDTH: 0.557475
G1 X121.049 Y123.094 E.00447
; LINE_WIDTH: 0.514818
G2 X121.139 Y123.134 I.299 J-.562 E.00376
; LINE_WIDTH: 0.474811
G1 X121.534 Y123.262 E.01462
; LINE_WIDTH: 0.44151
G1 X121.929 Y123.39 E.01349
M204 S10000
G1 X121.801 Y123.31 F42000
; LINE_WIDTH: 0.199992
G1 F3651
M204 S6000
G1 X121.826 Y123.314 E.00032
; LINE_WIDTH: 0.172225
G1 X122.129 Y123.338 E.0032
; LINE_WIDTH: 0.124502
G1 X122.432 Y123.361 E.00202
; LINE_WIDTH: 0.100924
G1 X133.563 Y123.362 E.05261
G1 X133.871 Y123.338 E.00146
; LINE_WIDTH: 0.172218
G1 X134.174 Y123.314 E.0032
; LINE_WIDTH: 0.200003
G1 X134.199 Y123.31 E.00032
; WIPE_START
G1 F15000
G1 X134.174 Y123.314 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.272 Y117.464 Z4.8 F42000
G1 X126.723 Y114.423 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3651
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
G1 X129.277 Y113.792 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3651
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13178
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18684
; WIPE_END
M73 P82 R2
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3651
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.605 Y117.337 E.00425
G3 X129.277 Y117.608 I-1.263 J-1.192 E.01417
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13184
G1 X129.605 Y117.337 E-.04867
G1 X129.494 Y117.444 E-.05878
G1 X129.277 Y117.608 E-.10345
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3651
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.992 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16102
G1 X126.062 Y116.977 E-.1912
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.166 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X129.878 Y117.618 I-.885 J2.531 E.1675
G3 X128.096 Y113.017 I-1.882 J-1.917 E.32639
G3 X128.836 Y113.147 I-.088 J2.68 E.02317
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14848
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12582
G1 X130.345 Y114.388 E-.10816
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 23/36
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I1.038 J.636 P1  F42000
G1 X134.083 Y108.291 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3160
M204 S6000
G1 X134.144 Y108.301 E.00207
G1 X134.689 Y108.578 E.02029
G1 X135.122 Y109.011 E.02029
G1 X135.399 Y109.556 E.02029
G1 X135.488 Y110.113 E.0187
G1 X135.488 Y121.287 E.37069
G1 X135.399 Y121.844 E.0187
G1 X135.122 Y122.389 E.02029
G1 X134.689 Y122.822 E.02029
G1 X134.144 Y123.099 E.02029
G1 X133.587 Y123.188 E.0187
G1 X122.413 Y123.188 E.37069
G1 X121.856 Y123.099 E.0187
G1 X121.311 Y122.822 E.02029
G1 X120.878 Y122.389 E.02029
G1 X120.601 Y121.844 E.02029
G1 X120.512 Y121.287 E.0187
G1 X120.512 Y110.113 E.37069
G1 X120.601 Y109.556 E.0187
G1 X120.878 Y109.011 E.02029
G1 X121.311 Y108.578 E.02029
G1 X121.856 Y108.301 E.02029
G1 X122.413 Y108.212 E.0187
G1 X133.587 Y108.212 E.37069
G1 X134.023 Y108.282 E.01465
M204 S250
G1 X134.021 Y108.678 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3160
M204 S5000
G1 X134.456 Y108.899 E.01498
G1 X134.801 Y109.244 E.01498
G1 X135.022 Y109.679 E.01498
G1 X135.095 Y110.144 E.01447
G1 X135.095 Y121.257 E.34147
G1 X135.022 Y121.721 E.01447
G1 X134.801 Y122.156 E.01498
G1 X134.456 Y122.501 E.01498
G1 X134.021 Y122.722 E.01498
G1 X133.557 Y122.795 E.01447
G1 X122.443 Y122.795 E.34147
G1 X121.979 Y122.722 E.01447
G1 X121.544 Y122.501 E.01498
G1 X121.199 Y122.156 E.01498
G1 X120.978 Y121.722 E.01498
G1 X120.905 Y121.257 E.01447
G1 X120.905 Y110.143 E.34147
G1 X120.978 Y109.679 E.01447
G1 X121.199 Y109.244 E.01498
G1 X121.544 Y108.899 E.01498
G1 X121.979 Y108.678 E.01498
G1 X122.443 Y108.605 E.01447
G1 X133.557 Y108.605 E.34147
G1 X133.962 Y108.669 E.01262
; WIPE_START
G1 F3600
M204 S6000
G1 X134.456 Y108.899 E-.20703
G1 X134.801 Y109.244 E-.18525
G1 X135.022 Y109.679 E-.18522
G1 X135.095 Y110.144 E-.1789
G1 X135.095 Y110.153 E-.00359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.453 Y117.777 Z5 F42000
G1 X135.705 Y123.148 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3160
M204 S6000
G1 X135.448 Y123.405 E.01209
G1 X135.123 Y123.571 E.01209
G1 X134.715 Y123.635 E.01369
G1 X121.285 Y123.635 E.4455
G1 X120.877 Y123.571 E.01369
G1 X120.552 Y123.405 E.0121
G1 X120.295 Y123.148 E.01209
G1 X120.129 Y122.823 E.01209
G1 X120.065 Y122.415 E.01369
G1 X120.065 Y108.985 E.4455
G1 X120.129 Y108.577 E.01369
G1 X120.295 Y108.252 E.0121
G1 X120.552 Y107.995 E.01209
G1 X120.877 Y107.829 E.01209
G1 X121.285 Y107.765 E.01369
G1 X134.715 Y107.765 E.4455
G1 X135.055 Y107.818 E.0114
G1 X135.123 Y107.829 E.00228
G1 X135.448 Y107.995 E.0121
G1 X135.705 Y108.252 E.01209
G1 X135.871 Y108.577 E.01209
G1 X135.935 Y108.985 E.01369
G1 X135.935 Y122.415 E.4455
G1 X135.871 Y122.823 E.01369
G1 X135.733 Y123.094 E.01011
M204 S250
G1 X136.026 Y123.381 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3160
M204 S5000
G1 X135.681 Y123.727 E.01502
G1 X135.245 Y123.948 E.01502
G1 X134.746 Y124.028 E.01554
G1 X121.254 Y124.028 E.41457
G1 X120.755 Y123.948 E.01554
G1 X120.319 Y123.727 E.01502
G1 X119.973 Y123.381 E.01502
G1 X119.752 Y122.945 E.01502
G1 X119.672 Y122.446 E.01554
G1 X119.672 Y108.954 E.41457
G1 X119.752 Y108.455 E.01554
G1 X119.974 Y108.019 E.01502
G1 X120.319 Y107.674 E.01502
G1 X120.755 Y107.452 E.01502
G1 X121.254 Y107.373 E.01554
G1 X134.746 Y107.373 E.41457
G1 X135.116 Y107.431 E.01151
G1 X135.245 Y107.452 E.00402
G1 X135.681 Y107.674 E.01502
G1 X136.027 Y108.019 E.01502
G1 X136.248 Y108.455 E.01502
G1 X136.328 Y108.954 E.01554
G1 X136.328 Y122.446 E.41457
G1 X136.248 Y122.945 E.01554
G1 X136.054 Y123.327 E.01318
; WIPE_START
G1 F3600
M204 S6000
G1 X135.681 Y123.727 E-.20756
G1 X135.245 Y123.948 E-.18574
G1 X134.746 Y124.028 E-.19213
G1 X134.287 Y124.028 E-.17457
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


; object ids of this layer23 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.134 Y123.432 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.419053
G1 F3160
M204 S6000
G1 X134.521 Y123.306 E.01247
; LINE_WIDTH: 0.455768
G1 X134.908 Y123.181 E.01369
; LINE_WIDTH: 0.491059
G1 X134.975 Y123.153 E.00263
; LINE_WIDTH: 0.530615
G2 X135.075 Y123.082 I-.174 J-.354 E.0049
; LINE_WIDTH: 0.567434
G1 X135.165 Y123.017 E.00476
; LINE_WIDTH: 0.578894
G2 X135.382 Y122.775 I-.654 J-.805 E.01424
; LINE_WIDTH: 0.532609
G1 X135.448 Y122.685 E.00444
; LINE_WIDTH: 0.493924
G1 X135.48 Y122.608 E.00308
; LINE_WIDTH: 0.455777
G1 X135.606 Y122.221 E.01369
; LINE_WIDTH: 0.41906
G1 X135.732 Y121.834 E.01247
M204 S10000
G1 X135.732 Y109.566 F42000
; LINE_WIDTH: 0.419047
G1 F3160
M204 S6000
G1 X135.606 Y109.179 E.01247
; LINE_WIDTH: 0.455767
G1 X135.48 Y108.792 E.01369
; LINE_WIDTH: 0.493927
G1 X135.447 Y108.715 E.00308
; LINE_WIDTH: 0.53262
G1 X135.382 Y108.625 E.00444
; LINE_WIDTH: 0.578897
G2 X135.165 Y108.383 I-.871 J.564 E.01424
; LINE_WIDTH: 0.567433
G1 X135.075 Y108.318 E.00476
; LINE_WIDTH: 0.517508
G1 X134.985 Y108.252 E.00431
G1 X135.059 Y108.025 E.00924
M204 S10000
G1 X135.649 Y108.591 F42000
; LINE_WIDTH: 0.50981
G1 F3160
M204 S6000
G1 X134.908 Y108.22 E.03155
; LINE_WIDTH: 0.455777
G1 X134.521 Y108.094 E.01369
; LINE_WIDTH: 0.41906
G1 X134.134 Y107.968 E.01247
M204 S10000
G1 X121.866 Y107.968 F42000
; LINE_WIDTH: 0.419053
G1 F3160
M204 S6000
G1 X121.479 Y108.094 E.01247
; LINE_WIDTH: 0.455768
G1 X121.092 Y108.22 E.01369
; LINE_WIDTH: 0.493924
G1 X121.015 Y108.253 E.00308
; LINE_WIDTH: 0.532609
G1 X120.925 Y108.318 E.00444
; LINE_WIDTH: 0.578895
G2 X120.683 Y108.535 I.564 J.871 E.01424
; LINE_WIDTH: 0.567434
G1 X120.618 Y108.625 E.00476
; LINE_WIDTH: 0.530618
G2 X120.547 Y108.725 I.282 J.274 E.0049
; LINE_WIDTH: 0.491067
G1 X120.52 Y108.792 E.00263
; LINE_WIDTH: 0.455777
G1 X120.394 Y109.179 E.01369
; LINE_WIDTH: 0.41906
G1 X120.268 Y109.566 E.01247
M204 S10000
G1 X120.268 Y121.834 F42000
; LINE_WIDTH: 0.419047
G1 F3160
M204 S6000
G1 X120.394 Y122.221 E.01247
; LINE_WIDTH: 0.455767
G1 X120.52 Y122.608 E.01369
; LINE_WIDTH: 0.49106
G1 X120.547 Y122.675 E.00263
; LINE_WIDTH: 0.530623
G2 X120.618 Y122.775 I.353 J-.174 E.0049
; LINE_WIDTH: 0.567439
G1 X120.683 Y122.865 E.00476
; LINE_WIDTH: 0.578894
G2 X120.925 Y123.082 I.805 J-.654 E.01424
; LINE_WIDTH: 0.532609
G1 X121.015 Y123.148 E.00444
; LINE_WIDTH: 0.493924
G1 X121.092 Y123.181 E.00308
; LINE_WIDTH: 0.455777
G1 X121.479 Y123.306 E.01369
; LINE_WIDTH: 0.41906
G1 X121.866 Y123.432 E.01247
; WIPE_START
G1 F9570.923
G1 X121.479 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.359 Y116.734 Z5 F42000
G1 X126.723 Y114.423 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3160
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P83 R2
G1 F3160
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
G1 X129.277 Y113.792 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3160
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3160
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.596 Y117.346 E.00469
G3 X129.277 Y117.608 I-1.22 J-1.157 E.01373
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.596 Y117.346 E-.05373
G1 X129.277 Y117.608 E-.15691
G1 X129.277 Y117.15 E-.17413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3160
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.992 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16102
G1 X126.062 Y116.977 E-.1912
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3160
M204 S5000
G3 X127.426 Y118.322 I-.888 J2.534 E.2493
G3 X128.083 Y113.017 I.574 J-2.622 E.2439
G3 X128.836 Y113.148 I-.078 J2.684 E.02357
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14847
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12582
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10817
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 24/36
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5 I1.026 J.654 P1  F42000
G1 X134.246 Y108.272 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3163
M204 S6000
G1 X134.74 Y108.524 E.01838
G1 X135.176 Y108.96 E.02048
G1 X135.457 Y109.51 E.02048
G1 X135.546 Y110.073 E.01889
G1 X135.546 Y121.327 E.37334
G1 X135.457 Y121.89 E.01889
G1 X135.176 Y122.44 E.02048
G1 X134.74 Y122.876 E.02048
G1 X134.19 Y123.157 E.02048
G1 X133.627 Y123.246 E.01889
G1 X122.373 Y123.246 E.37334
G1 X121.81 Y123.157 E.01889
G1 X121.26 Y122.876 E.02048
G1 X120.824 Y122.44 E.02048
G1 X120.543 Y121.89 E.02048
G1 X120.454 Y121.327 E.01889
G1 X120.454 Y110.073 E.37334
G1 X120.543 Y109.51 E.01889
G1 X120.824 Y108.96 E.02048
G1 X121.26 Y108.524 E.02048
G1 X121.81 Y108.243 E.02048
G1 X122.373 Y108.154 E.01889
G1 X133.627 Y108.154 E.37334
G1 X134.19 Y108.243 E.01889
G1 X134.193 Y108.245 E.0001
M204 S250
G1 X134.068 Y108.621 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3163
M204 S5000
G1 X134.506 Y108.845 E.01512
G1 X134.855 Y109.194 E.01515
G1 X135.079 Y109.633 E.01515
G1 X135.154 Y110.103 E.01464
G1 X135.154 Y121.297 E.34393
G1 X135.079 Y121.767 E.01464
G1 X134.855 Y122.207 E.01515
G1 X134.506 Y122.555 E.01515
G1 X134.067 Y122.779 E.01515
G1 X133.597 Y122.854 E.01464
G1 X122.403 Y122.854 E.34393
G1 X121.933 Y122.779 E.01464
G1 X121.493 Y122.555 E.01515
G1 X121.145 Y122.207 E.01515
G1 X120.921 Y121.767 E.01515
G1 X120.846 Y121.297 E.01464
G1 X120.846 Y110.104 E.34393
G1 X120.921 Y109.633 E.01464
G1 X121.145 Y109.194 E.01515
G1 X121.493 Y108.845 E.01515
G1 X121.933 Y108.621 E.01515
G1 X122.403 Y108.546 E.01464
G1 X133.597 Y108.546 E.34393
G1 X134.009 Y108.612 E.01283
; WIPE_START
G1 F3600
M204 S6000
G1 X134.506 Y108.845 E-.20883
G1 X134.855 Y109.194 E-.18741
G1 X135.079 Y109.633 E-.18739
G1 X135.152 Y110.091 E-.17637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.497 Y117.716 Z5.2 F42000
G1 X135.744 Y123.182 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3163
M204 S6000
G1 X135.482 Y123.444 E.01227
G1 X135.153 Y123.612 E.01227
G1 X134.74 Y123.677 E.01386
G1 X121.26 Y123.677 E.44716
G1 X120.847 Y123.612 E.01386
G1 X120.518 Y123.444 E.01227
G1 X120.256 Y123.182 E.01227
G1 X120.088 Y122.853 E.01227
G1 X120.023 Y122.44 E.01386
G1 X120.023 Y108.96 E.44716
G1 X120.088 Y108.547 E.01386
G1 X120.256 Y108.218 E.01227
G1 X120.518 Y107.956 E.01227
G1 X120.847 Y107.788 E.01227
G1 X121.26 Y107.723 E.01386
G1 X134.74 Y107.723 E.44716
G1 X135.097 Y107.779 E.01198
G1 X135.153 Y107.788 E.00188
G1 X135.482 Y107.956 E.01227
G1 X135.744 Y108.218 E.01227
G1 X135.912 Y108.547 E.01227
G1 X135.977 Y108.96 E.01386
G1 X135.977 Y122.44 E.44716
G1 X135.912 Y122.853 E.01386
G1 X135.771 Y123.129 E.01028
M204 S250
G1 X136.065 Y123.416 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3163
M204 S5000
G1 X135.716 Y123.765 E.01518
G1 X135.275 Y123.989 E.01518
G1 X134.771 Y124.069 E.0157
G1 X121.229 Y124.069 E.4161
G1 X120.725 Y123.989 E.0157
G1 X120.284 Y123.765 E.01518
G1 X119.935 Y123.416 E.01518
G1 X119.711 Y122.975 E.01518
G1 X119.631 Y122.471 E.0157
G1 X119.631 Y108.929 E.4161
G1 X119.711 Y108.425 E.0157
G1 X119.935 Y107.984 E.01518
G1 X120.284 Y107.635 E.01518
G1 X120.725 Y107.411 E.01518
G1 X121.229 Y107.331 E.0157
G1 X134.771 Y107.331 E.4161
G1 X135.158 Y107.392 E.01204
G1 X135.275 Y107.411 E.00365
G1 X135.716 Y107.635 E.01518
G1 X136.065 Y107.984 E.01518
G1 X136.289 Y108.425 E.01518
G1 X136.369 Y108.929 E.0157
G1 X136.369 Y122.471 E.4161
G1 X136.289 Y122.975 E.0157
G1 X136.092 Y123.362 E.01334
; WIPE_START
G1 F3600
M204 S6000
G1 X135.716 Y123.765 E-.20954
G1 X135.275 Y123.989 E-.18774
G1 X134.771 Y124.069 E-.19411
G1 X134.327 Y124.069 E-.16862
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


; object ids of this layer24 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.197 Y123.474 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.396607
G1 F3163
M204 S6000
G1 X134.576 Y123.351 E.01148
; LINE_WIDTH: 0.436743
G1 X134.955 Y123.228 E.01278
; LINE_WIDTH: 0.473071
G1 X135.019 Y123.201 E.00243
; LINE_WIDTH: 0.507674
G1 X135.113 Y123.133 E.00441
; LINE_WIDTH: 0.544005
G1 X135.207 Y123.065 E.00473
; LINE_WIDTH: 0.555935
G2 X135.433 Y122.813 I-.681 J-.839 E.01419
; LINE_WIDTH: 0.507755
G1 X135.501 Y122.719 E.00439
; LINE_WIDTH: 0.473181
G1 X135.527 Y122.655 E.00244
; LINE_WIDTH: 0.436743
G1 X135.651 Y122.276 E.01278
; LINE_WIDTH: 0.396608
G1 X135.774 Y121.897 E.01148
M204 S10000
G1 X135.774 Y109.502 F42000
; LINE_WIDTH: 0.396595
G1 F3163
M204 S6000
G1 X135.651 Y109.124 E.01148
; LINE_WIDTH: 0.436735
G1 X135.527 Y108.745 E.01278
; LINE_WIDTH: 0.473167
G1 X135.501 Y108.681 E.00244
; LINE_WIDTH: 0.507745
G1 X135.433 Y108.587 E.00439
; LINE_WIDTH: 0.555938
G2 X135.207 Y108.336 I-.906 J.587 E.01419
; LINE_WIDTH: 0.544011
G1 X135.113 Y108.267 E.00473
; LINE_WIDTH: 0.507671
G1 X135.019 Y108.199 E.00441
; LINE_WIDTH: 0.473079
G1 X134.955 Y108.173 E.00242
; LINE_WIDTH: 0.436763
G1 X134.576 Y108.049 E.01278
; LINE_WIDTH: 0.396615
G1 X134.197 Y107.926 E.01148
M204 S10000
G1 X121.803 Y107.926 F42000
; LINE_WIDTH: 0.396633
G1 F3163
M204 S6000
G1 X121.424 Y108.049 E.01148
; LINE_WIDTH: 0.436783
G1 X121.045 Y108.173 E.01278
; LINE_WIDTH: 0.473228
G1 X120.981 Y108.199 E.00244
; LINE_WIDTH: 0.507779
G1 X120.887 Y108.267 E.00439
; LINE_WIDTH: 0.555948
G2 X120.636 Y108.493 I.587 J.907 E.01419
; LINE_WIDTH: 0.544019
G1 X120.567 Y108.587 E.00473
; LINE_WIDTH: 0.50768
G1 X120.499 Y108.681 E.00441
; LINE_WIDTH: 0.473058
G1 X120.473 Y108.745 E.00243
; LINE_WIDTH: 0.436738
G1 X120.349 Y109.124 E.01278
; LINE_WIDTH: 0.396593
G1 X120.226 Y109.503 E.01148
M204 S10000
G1 X120.226 Y121.897 F42000
; LINE_WIDTH: 0.3966
G1 F3163
M204 S6000
G1 X120.349 Y122.276 E.01148
; LINE_WIDTH: 0.436741
G1 X120.473 Y122.655 E.01278
; LINE_WIDTH: 0.473062
G1 X120.499 Y122.719 E.00242
; LINE_WIDTH: 0.507662
G1 X120.567 Y122.813 E.00441
; LINE_WIDTH: 0.543995
G1 X120.636 Y122.907 E.00473
; LINE_WIDTH: 0.555934
G2 X120.887 Y123.133 I.838 J-.681 E.01419
; LINE_WIDTH: 0.507755
G1 X120.981 Y123.201 E.00439
; LINE_WIDTH: 0.473181
G1 X121.045 Y123.227 E.00244
; LINE_WIDTH: 0.436743
G1 X121.424 Y123.351 E.01278
; LINE_WIDTH: 0.396608
G1 X121.803 Y123.474 E.01148
; WIPE_START
G1 F10178.472
G1 X121.424 Y123.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.32 Y116.787 Z5.2 F42000
G1 X126.723 Y114.423 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3163
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3163
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
M73 P84 R2
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
G1 X129.277 Y113.792 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3163
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24234
G1 X129.277 Y113.931 E-.18685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3163
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.586 Y117.355 E.00513
G3 X129.277 Y117.608 I-1.18 J-1.125 E.0133
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13184
G1 X129.586 Y117.355 E-.05872
G1 X129.277 Y117.608 E-.15194
G1 X129.277 Y117.15 E-.17407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3163
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.766 J-3.483 E.03074
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3163
M204 S5000
G3 X127.413 Y118.32 I-.892 J2.532 E.24938
G3 X128.069 Y113.016 I.582 J-2.62 E.24338
G3 X128.835 Y113.149 I-.069 J2.684 E.02397
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14846
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12582
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10818
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 25/36
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I1.025 J.656 P1  F42000
G1 X134.293 Y108.215 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3178
M204 S6000
G1 X134.791 Y108.469 E.01854
G1 X135.231 Y108.909 E.02067
G1 X135.514 Y109.465 E.02067
G1 X135.604 Y110.033 E.01908
G1 X135.604 Y121.367 E.37599
G1 X135.514 Y121.935 E.01908
G1 X135.231 Y122.491 E.02067
G1 X134.791 Y122.931 E.02067
G1 X134.235 Y123.214 E.02067
G1 X133.667 Y123.304 E.01908
G1 X122.333 Y123.304 E.37599
G1 X121.765 Y123.214 E.01908
G1 X121.209 Y122.931 E.02067
G1 X120.769 Y122.491 E.02067
G1 X120.486 Y121.935 E.02067
G1 X120.396 Y121.367 E.01908
G1 X120.396 Y110.033 E.37599
G1 X120.486 Y109.465 E.01908
G1 X120.769 Y108.909 E.02067
G1 X121.209 Y108.469 E.02067
G1 X121.765 Y108.186 E.02067
G1 X122.333 Y108.096 E.01908
G1 X133.667 Y108.096 E.37599
G1 X134.235 Y108.186 E.01908
G1 X134.239 Y108.188 E.00014
M204 S250
G1 X134.115 Y108.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3178
M204 S5000
G1 X134.557 Y108.79 E.01527
G1 X134.91 Y109.143 E.01533
G1 X135.136 Y109.587 E.01533
G1 X135.212 Y110.064 E.01481
G1 X135.212 Y121.337 E.34639
G1 X135.136 Y121.813 E.01481
G1 X134.91 Y122.257 E.01533
G1 X134.557 Y122.61 E.01533
G1 X134.113 Y122.836 E.01533
G1 X133.637 Y122.912 E.01481
G1 X122.363 Y122.912 E.34639
G1 X121.887 Y122.836 E.01481
G1 X121.443 Y122.61 E.01533
G1 X121.09 Y122.257 E.01533
G1 X120.864 Y121.813 E.01533
G1 X120.788 Y121.337 E.01481
G1 X120.788 Y110.064 E.34639
G1 X120.864 Y109.587 E.01481
G1 X121.09 Y109.143 E.01533
G1 X121.443 Y108.79 E.01533
G1 X121.887 Y108.564 E.01533
G1 X122.363 Y108.488 E.01481
G1 X133.637 Y108.488 E.34639
G1 X134.055 Y108.555 E.01303
; WIPE_START
G1 F3600
M204 S6000
G1 X134.557 Y108.79 E-.21062
G1 X134.91 Y109.143 E-.18956
G1 X135.136 Y109.587 E-.18956
G1 X135.206 Y110.03 E-.17026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.539 Y117.655 Z5.4 F42000
G1 X135.782 Y123.217 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3178
M204 S6000
G1 X135.517 Y123.482 E.01244
G1 X135.183 Y123.653 E.01244
G1 X134.765 Y123.719 E.01403
G1 X121.235 Y123.719 E.44882
G1 X120.817 Y123.653 E.01403
G1 X120.483 Y123.482 E.01244
G1 X120.218 Y123.217 E.01244
G1 X120.047 Y122.883 E.01244
G1 X119.981 Y122.465 E.01403
G1 X119.981 Y108.935 E.44882
G1 X120.047 Y108.517 E.01403
G1 X120.218 Y108.183 E.01244
G1 X120.483 Y107.918 E.01244
G1 X120.817 Y107.747 E.01244
G1 X121.235 Y107.681 E.01403
G1 X134.765 Y107.681 E.44882
G1 X135.139 Y107.74 E.01256
G1 X135.183 Y107.747 E.00148
G1 X135.517 Y107.918 E.01244
G1 X135.782 Y108.183 E.01244
G1 X135.953 Y108.517 E.01244
G1 X136.019 Y108.935 E.01403
G1 X136.019 Y122.465 E.44882
G1 X135.953 Y122.883 E.01403
G1 X135.81 Y123.164 E.01045
M204 S250
G1 X136.103 Y123.45 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3178
M204 S5000
G1 X135.75 Y123.803 E.01534
G1 X135.306 Y124.03 E.01534
G1 X134.796 Y124.111 E.01586
G1 X121.204 Y124.111 E.41764
G1 X120.694 Y124.03 E.01586
G1 X120.25 Y123.803 E.01534
G1 X119.897 Y123.45 E.01534
G1 X119.67 Y123.006 E.01534
G1 X119.589 Y122.496 E.01586
G1 X119.589 Y108.904 E.41764
G1 X119.67 Y108.394 E.01586
G1 X119.897 Y107.95 E.01534
G1 X120.25 Y107.597 E.01534
G1 X120.694 Y107.37 E.01534
G1 X121.204 Y107.289 E.01586
G1 X134.796 Y107.289 E.41764
G1 X135.2 Y107.353 E.01258
G1 X135.306 Y107.37 E.00328
G1 X135.75 Y107.597 E.01534
G1 X136.103 Y107.95 E.01534
G1 X136.33 Y108.394 E.01534
G1 X136.411 Y108.904 E.01586
G1 X136.411 Y122.496 E.41764
G1 X136.33 Y123.006 E.01586
G1 X136.131 Y123.397 E.0135
; WIPE_START
G1 F3600
M204 S6000
G1 X135.75 Y123.803 E-.21151
G1 X135.306 Y124.03 E-.18972
G1 X134.796 Y124.111 E-.19609
G1 X134.368 Y124.111 E-.16268
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


; object ids of this layer25 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.261 Y123.515 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.374159
G1 F3178
M204 S6000
G1 X134.631 Y123.395 E.01052
; LINE_WIDTH: 0.417726
G1 X135.002 Y123.274 E.0119
; LINE_WIDTH: 0.451896
G1 X135.053 Y123.254 E.00185
; LINE_WIDTH: 0.483688
G1 X135.155 Y123.18 E.00451
; LINE_WIDTH: 0.52137
G1 X135.248 Y123.112 E.0045
; LINE_WIDTH: 0.53342
G2 X135.48 Y122.855 I-.696 J-.86 E.01389
; LINE_WIDTH: 0.485284
G1 X135.548 Y122.762 E.00416
; LINE_WIDTH: 0.454062
G2 X135.574 Y122.702 I-.112 J-.086 E.00222
; LINE_WIDTH: 0.417718
G1 X135.695 Y122.331 E.0119
; LINE_WIDTH: 0.374147
G1 X135.815 Y121.961 E.01052
M204 S10000
G1 X135.815 Y109.439 F42000
; LINE_WIDTH: 0.37416
G1 F3178
M204 S6000
G1 X135.695 Y109.069 E.01052
; LINE_WIDTH: 0.41773
G1 X135.574 Y108.698 E.0119
; LINE_WIDTH: 0.454063
G2 X135.548 Y108.638 I-.139 J.026 E.00222
; LINE_WIDTH: 0.485307
G1 X135.48 Y108.545 E.00416
; LINE_WIDTH: 0.533422
G2 X135.248 Y108.288 I-.928 J.603 E.0139
; LINE_WIDTH: 0.521382
G1 X135.155 Y108.22 E.0045
; LINE_WIDTH: 0.483702
G1 X135.053 Y108.146 E.00451
; LINE_WIDTH: 0.4519
G1 X135.002 Y108.126 E.00185
; LINE_WIDTH: 0.417743
G1 X134.631 Y108.005 E.0119
; LINE_WIDTH: 0.374169
G1 X134.261 Y107.885 E.01052
M204 S10000
G1 X121.739 Y107.885 F42000
; LINE_WIDTH: 0.374159
G1 F3178
M204 S6000
G1 X121.369 Y108.005 E.01052
; LINE_WIDTH: 0.417726
G1 X120.998 Y108.126 E.0119
; LINE_WIDTH: 0.454059
G2 X120.938 Y108.152 I.026 J.139 E.00222
; LINE_WIDTH: 0.485284
G1 X120.845 Y108.22 E.00416
; LINE_WIDTH: 0.53342
G2 X120.588 Y108.452 I.603 J.928 E.0139
; LINE_WIDTH: 0.521367
G1 X120.52 Y108.545 E.0045
; LINE_WIDTH: 0.483689
G1 X120.446 Y108.647 E.00451
; LINE_WIDTH: 0.4519
G1 X120.426 Y108.698 E.00185
; LINE_WIDTH: 0.417718
G1 X120.305 Y109.069 E.0119
; LINE_WIDTH: 0.374147
G1 X120.185 Y109.439 E.01052
M204 S10000
G1 X120.185 Y121.961 F42000
; LINE_WIDTH: 0.374159
G1 F3178
M204 S6000
G1 X120.305 Y122.331 E.01052
; LINE_WIDTH: 0.417726
G1 X120.426 Y122.702 E.0119
; LINE_WIDTH: 0.451896
G1 X120.446 Y122.753 E.00185
; LINE_WIDTH: 0.483688
G1 X120.52 Y122.855 E.00451
; LINE_WIDTH: 0.52137
M73 P85 R2
G1 X120.588 Y122.948 E.0045
; LINE_WIDTH: 0.53342
G2 X120.845 Y123.18 I.86 J-.696 E.01389
; LINE_WIDTH: 0.485284
G1 X120.938 Y123.248 E.00416
; LINE_WIDTH: 0.454062
G2 X120.998 Y123.274 I.086 J-.112 E.00222
; LINE_WIDTH: 0.417718
G1 X121.369 Y123.395 E.0119
; LINE_WIDTH: 0.374147
G1 X121.739 Y123.515 E.01052
; WIPE_START
G1 F10868.698
G1 X121.369 Y123.395 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.28 Y116.841 Z5.4 F42000
G1 X126.723 Y114.423 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3178
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3178
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
G1 X129.277 Y113.792 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3178
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.10745
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3178
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.577 Y117.364 E.00557
G3 X129.277 Y117.608 I-1.136 J-1.09 E.01286
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13182
G1 X129.577 Y117.364 E-.06378
G1 X129.277 Y117.608 E-.14691
G1 X129.277 Y117.15 E-.17409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3178
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.808 J-3.526 E.03074
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16103
G1 X126.062 Y116.977 E-.19119
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3178
M204 S5000
G3 X127.4 Y118.317 I-.891 J2.533 E.2499
G3 X128.056 Y113.016 I.595 J-2.617 E.24257
G3 X128.836 Y113.148 I-.055 J2.684 E.02438
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14844
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 26/36
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I1.025 J.657 P1  F42000
G1 X134.339 Y108.158 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
M204 S6000
G1 X134.841 Y108.414 E.0187
G1 X135.286 Y108.859 E.02085
G1 X135.571 Y109.419 E.02086
G1 X135.662 Y109.993 E.01927
G1 X135.662 Y121.407 E.37865
G1 X135.571 Y121.981 E.01927
G1 X135.286 Y122.541 E.02086
G1 X134.841 Y122.986 E.02086
G1 X134.281 Y123.271 E.02086
G1 X133.707 Y123.362 E.01927
G1 X122.293 Y123.362 E.37865
G1 X121.719 Y123.271 E.01927
G1 X121.159 Y122.986 E.02086
G1 X120.714 Y122.541 E.02086
G1 X120.429 Y121.981 E.02086
G1 X120.338 Y121.407 E.01927
G1 X120.338 Y109.993 E.37865
G1 X120.429 Y109.419 E.01927
G1 X120.714 Y108.859 E.02086
G1 X120.997 Y108.576 E.01325
G1 X121.159 Y108.414 E.0076
G1 X121.719 Y108.129 E.02086
G1 X122.293 Y108.038 E.01927
G1 X133.707 Y108.038 E.37865
G1 X134.281 Y108.129 E.01927
G1 X134.285 Y108.131 E.00017
M204 S250
G1 X134.161 Y108.508 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
M204 S5000
G1 X134.608 Y108.735 E.01541
G1 X134.965 Y109.092 E.0155
G1 X135.194 Y109.542 E.0155
G1 X135.27 Y110.023 E.01499
G1 X135.27 Y121.377 E.34885
G1 X135.194 Y121.858 E.01499
G1 X134.965 Y122.308 E.0155
G1 X134.608 Y122.665 E.0155
G1 X134.158 Y122.894 E.0155
G1 X133.677 Y122.97 E.01499
G1 X122.323 Y122.97 E.34885
G1 X121.842 Y122.894 E.01499
G1 X121.392 Y122.665 E.0155
G1 X121.035 Y122.308 E.0155
G1 X120.806 Y121.858 E.0155
G1 X120.73 Y121.377 E.01499
G1 X120.73 Y110.023 E.34885
G1 X120.806 Y109.542 E.01499
G1 X121.035 Y109.092 E.0155
G1 X121.274 Y108.854 E.01037
G1 X121.392 Y108.735 E.00513
G1 X121.842 Y108.506 E.0155
G1 X122.323 Y108.43 E.01499
G1 X133.677 Y108.43 E.34885
G1 X134.102 Y108.497 E.01324
; WIPE_START
G1 F3600
M204 S6000
G1 X134.608 Y108.735 E-.21245
G1 X134.965 Y109.092 E-.19172
G1 X135.194 Y109.542 E-.19172
G1 X135.261 Y109.968 E-.1641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.582 Y117.594 Z5.6 F42000
G1 X135.821 Y123.252 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
M204 S6000
G1 X135.552 Y123.521 E.01261
G1 X135.213 Y123.693 E.01261
G1 X134.79 Y123.76 E.01421
G1 X121.21 Y123.76 E.45048
G1 X120.787 Y123.693 E.01421
G1 X120.448 Y123.521 E.01261
G1 X120.179 Y123.252 E.01261
G1 X120.007 Y122.913 E.01261
G1 X119.94 Y122.49 E.01421
G1 X119.94 Y108.91 E.45048
G1 X120.007 Y108.487 E.01421
G1 X120.179 Y108.148 E.01261
G1 X120.448 Y107.879 E.01261
G1 X120.787 Y107.707 E.01261
G1 X121.21 Y107.64 E.01421
G1 X134.79 Y107.64 E.45048
G1 X135.181 Y107.702 E.01313
G1 X135.552 Y107.879 E.01364
G1 X135.821 Y108.148 E.01261
G1 X135.993 Y108.487 E.01261
G1 X136.06 Y108.91 E.01421
G1 X136.06 Y122.49 E.45048
G1 X135.993 Y122.913 E.01421
G1 X135.848 Y123.198 E.01062
M204 S250
G1 X136.142 Y123.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
M204 S5000
G1 X135.785 Y123.842 E.0155
G1 X135.336 Y124.071 E.0155
G1 X134.821 Y124.153 E.01602
G1 X121.179 Y124.153 E.41918
G1 X120.664 Y124.071 E.01602
G1 X120.215 Y123.842 E.0155
G1 X119.858 Y123.485 E.0155
G1 X119.629 Y123.036 E.0155
G1 X119.547 Y122.521 E.01602
G1 X119.547 Y108.879 E.41918
G1 X119.629 Y108.364 E.01602
G1 X119.858 Y107.915 E.0155
G1 X120.215 Y107.558 E.0155
G1 X120.664 Y107.329 E.0155
G1 X121.179 Y107.248 E.01602
G1 X134.821 Y107.248 E.41918
G1 X135.242 Y107.314 E.01311
G1 X135.336 Y107.329 E.0029
G1 X135.785 Y107.558 E.0155
G1 X136.142 Y107.915 E.0155
G1 X136.371 Y108.364 E.0155
G1 X136.453 Y108.879 E.01602
G1 X136.453 Y122.521 E.41918
G1 X136.371 Y123.036 E.01602
G1 X136.169 Y123.432 E.01366
; WIPE_START
G1 F3600
M204 S6000
G1 X135.785 Y123.842 E-.2135
G1 X135.336 Y124.071 E-.19169
G1 X134.821 Y124.153 E-.19809
G1 X134.408 Y124.153 E-.15673
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


; object ids of this layer26 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.324 Y123.557 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35168
G1 F3192
M204 S6000
G1 X134.686 Y123.439 E.00959
; LINE_WIDTH: 0.398661
G1 X135.048 Y123.321 E.01104
; LINE_WIDTH: 0.430887
G1 X135.087 Y123.306 E.00132
; LINE_WIDTH: 0.459807
G1 X135.197 Y123.227 E.00459
; LINE_WIDTH: 0.498796
G1 X135.29 Y123.16 E.00425
; LINE_WIDTH: 0.510954
G2 X135.527 Y122.897 I-.711 J-.881 E.01357
; LINE_WIDTH: 0.462989
G1 X135.595 Y122.805 E.00392
; LINE_WIDTH: 0.43471
G2 X135.621 Y122.748 I-.104 J-.084 E.002
; LINE_WIDTH: 0.398704
G1 X135.739 Y122.386 E.01105
; LINE_WIDTH: 0.351702
G1 X135.857 Y122.024 E.00959
M204 S10000
G1 X135.857 Y109.376 F42000
; LINE_WIDTH: 0.351695
G1 F3192
M204 S6000
G1 X135.739 Y109.014 E.00959
; LINE_WIDTH: 0.398688
G1 X135.621 Y108.652 E.01105
; LINE_WIDTH: 0.434699
G2 X135.595 Y108.595 I-.131 J.028 E.002
; LINE_WIDTH: 0.462981
G1 X135.527 Y108.503 E.00392
; LINE_WIDTH: 0.51094
G2 X135.29 Y108.24 I-.949 J.619 E.01357
; LINE_WIDTH: 0.498811
G1 X135.197 Y108.173 E.00425
; LINE_WIDTH: 0.459807
G1 X135.087 Y108.094 E.0046
; LINE_WIDTH: 0.430909
G1 X135.048 Y108.079 E.00132
; LINE_WIDTH: 0.398696
M73 P86 R2
G1 X134.686 Y107.961 E.01105
; LINE_WIDTH: 0.351698
G1 X134.324 Y107.843 E.00959
M204 S10000
G1 X121.676 Y107.843 F42000
; LINE_WIDTH: 0.351683
G1 F3192
M204 S6000
G1 X121.314 Y107.961 E.00958
; LINE_WIDTH: 0.39866
G1 X120.952 Y108.079 E.01104
; LINE_WIDTH: 0.434674
G2 X120.896 Y108.105 I.028 J.131 E.002
; LINE_WIDTH: 0.462984
G1 X120.803 Y108.173 E.00392
; LINE_WIDTH: 0.51096
G2 X120.54 Y108.41 I.618 J.948 E.01357
; LINE_WIDTH: 0.498821
G1 X120.473 Y108.503 E.00425
; LINE_WIDTH: 0.459814
G1 X120.394 Y108.613 E.0046
; LINE_WIDTH: 0.430901
G1 X120.379 Y108.652 E.00132
; LINE_WIDTH: 0.398683
G1 X120.261 Y109.014 E.01104
; LINE_WIDTH: 0.351695
G1 X120.143 Y109.376 E.00959
M204 S10000
G1 X120.143 Y122.024 F42000
; LINE_WIDTH: 0.35168
G1 F3192
M204 S6000
G1 X120.261 Y122.386 E.00959
; LINE_WIDTH: 0.398661
G1 X120.379 Y122.748 E.01104
; LINE_WIDTH: 0.430887
G1 X120.394 Y122.787 E.00132
; LINE_WIDTH: 0.459807
G1 X120.473 Y122.897 E.00459
; LINE_WIDTH: 0.498796
G1 X120.54 Y122.99 E.00425
; LINE_WIDTH: 0.510954
G2 X120.803 Y123.227 I.881 J-.711 E.01357
; LINE_WIDTH: 0.462989
G1 X120.895 Y123.295 E.00392
; LINE_WIDTH: 0.43471
G2 X120.952 Y123.321 I.084 J-.104 E.002
; LINE_WIDTH: 0.398704
G1 X121.314 Y123.439 E.01105
; LINE_WIDTH: 0.351702
G1 X121.676 Y123.557 E.00959
; WIPE_START
G1 F11658.719
G1 X121.314 Y123.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y116.894 Z5.6 F42000
G1 X126.723 Y114.423 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
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
M73 P86 R1
G1 F3600
M204 S6000
G1 X127.115 Y113.365 E-.55147
G1 X127.664 Y113.365 E-.20853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y113.792 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13179
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3192
M204 S6000
G1 X129.915 Y116.977 E.02115
G1 X129.697 Y117.247 E.01151
G1 X129.567 Y117.373 E.006
G3 X129.277 Y117.608 I-1.093 J-1.054 E.01242
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.2434
G1 X129.697 Y117.247 E-.13183
G1 X129.567 Y117.373 E-.06878
G1 X129.277 Y117.608 E-.14189
G1 X129.277 Y117.15 E-.1741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3192
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.991 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.891 Y113.17 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
M204 S5000
G3 X126.655 Y113.371 I-.9 J2.532 E.44762
G3 X128.043 Y113.016 I1.353 J2.398 E.04453
G3 X128.835 Y113.151 I-.052 J2.687 E.02477
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14843
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12579
G1 X130.345 Y114.388 E-.10823
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 27/36
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I1.024 J.658 P1  F42000
G1 X134.385 Y108.101 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3206
M204 S6000
G1 X134.892 Y108.36 E.01886
G1 X135.34 Y108.808 E.02104
G1 X135.628 Y109.373 E.02104
G1 X135.72 Y109.953 E.01946
G1 X135.72 Y121.447 E.3813
G1 X135.628 Y122.027 E.01946
G1 X135.34 Y122.592 E.02104
G1 X134.892 Y123.041 E.02104
G1 X134.327 Y123.329 E.02104
G1 X133.747 Y123.42 E.01946
G1 X122.253 Y123.42 E.3813
G1 X121.673 Y123.329 E.01946
G1 X121.108 Y123.041 E.02104
G1 X120.66 Y122.592 E.02104
G1 X120.372 Y122.027 E.02104
G1 X120.28 Y121.447 E.01946
G1 X120.28 Y109.953 E.3813
G1 X120.372 Y109.373 E.01946
G1 X120.66 Y108.808 E.02104
G1 X121.108 Y108.36 E.02104
G1 X121.673 Y108.072 E.02104
G1 X122.253 Y107.98 E.01946
G1 X133.747 Y107.98 E.3813
G1 X134.327 Y108.072 E.01946
G1 X134.332 Y108.074 E.00019
M204 S250
G1 X134.207 Y108.451 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3206
M204 S5000
G1 X134.659 Y108.681 E.01557
G1 X135.019 Y109.041 E.01568
G1 X135.251 Y109.496 E.01568
G1 X135.328 Y109.984 E.01516
G1 X135.328 Y121.417 E.3513
G1 X135.251 Y121.904 E.01516
G1 X135.019 Y122.359 E.01568
G1 X134.659 Y122.719 E.01568
G1 X134.204 Y122.951 E.01568
G1 X133.717 Y123.028 E.01516
G1 X122.283 Y123.028 E.3513
G1 X121.796 Y122.951 E.01516
G1 X121.341 Y122.719 E.01568
G1 X120.981 Y122.359 E.01568
G1 X120.749 Y121.904 E.01568
G1 X120.672 Y121.417 E.01516
G1 X120.672 Y109.984 E.3513
G1 X120.749 Y109.496 E.01516
G1 X120.981 Y109.041 E.01568
G1 X121.341 Y108.681 E.01568
G1 X121.796 Y108.449 E.01568
G1 X122.283 Y108.372 E.01516
G1 X133.717 Y108.372 E.3513
G1 X134.148 Y108.44 E.01343
; WIPE_START
G1 F3600
M204 S6000
G1 X134.659 Y108.681 E-.21435
G1 X135.019 Y109.041 E-.19388
G1 X135.251 Y109.496 E-.19389
G1 X135.316 Y109.906 E-.15788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.626 Y117.533 Z5.8 F42000
G1 X135.859 Y123.287 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3206
M204 S6000
G1 X135.587 Y123.559 E.01279
G1 X135.244 Y123.734 E.01277
G1 X134.815 Y123.802 E.0144
G1 X121.185 Y123.802 E.45214
G1 X120.757 Y123.734 E.01438
G1 X120.413 Y123.559 E.01279
G1 X120.141 Y123.287 E.01279
G1 X119.966 Y122.944 E.01277
G1 X119.898 Y122.515 E.0144
G1 X119.898 Y108.885 E.45214
G1 X119.966 Y108.457 E.01438
G1 X120.141 Y108.113 E.01279
G1 X120.413 Y107.841 E.01279
G1 X120.756 Y107.666 E.01277
G1 X121.185 Y107.598 E.0144
G1 X134.815 Y107.598 E.45214
G1 X135.223 Y107.663 E.01371
G1 X135.587 Y107.841 E.01342
G1 X135.859 Y108.113 E.01279
G1 X136.034 Y108.457 E.01279
G1 X136.102 Y108.885 E.01438
G1 X136.102 Y122.515 E.45213
G1 X136.034 Y122.943 E.01438
G1 X135.887 Y123.233 E.0108
M204 S250
G1 X136.18 Y123.52 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3206
M204 S5000
G1 X135.82 Y123.88 E.01566
G1 X135.366 Y124.112 E.01566
G1 X134.846 Y124.194 E.01618
G1 X121.154 Y124.194 E.42071
G1 X120.634 Y124.112 E.01618
G1 X120.18 Y123.88 E.01566
G1 X119.82 Y123.52 E.01566
G1 X119.588 Y123.066 E.01566
G1 X119.506 Y122.546 E.01618
G1 X119.506 Y108.854 E.42071
G1 X119.588 Y108.334 E.01618
G1 X119.82 Y107.88 E.01566
G1 X120.18 Y107.52 E.01566
G1 X120.634 Y107.288 E.01566
G1 X121.154 Y107.206 E.01618
G1 X134.846 Y107.206 E.42071
G1 X135.285 Y107.275 E.01365
G1 X135.366 Y107.288 E.00253
G1 X135.82 Y107.52 E.01566
G1 X136.18 Y107.88 E.01566
G1 X136.412 Y108.334 E.01566
G1 X136.494 Y108.854 E.01618
G1 X136.494 Y122.546 E.42071
G1 X136.412 Y123.066 E.01618
G1 X136.208 Y123.467 E.01382
; WIPE_START
G1 F3600
M204 S6000
G1 X135.82 Y123.88 E-.21547
G1 X135.366 Y124.112 E-.19368
G1 X134.846 Y124.194 E-.20006
G1 X134.449 Y124.194 E-.15079
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


; object ids of this layer27 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M73 P87 R1
G1 X134.387 Y123.599 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.320837
G1 F3206
M204 S6000
G1 X134.623 Y123.522 E.00562
; LINE_WIDTH: 0.35444
G1 X134.859 Y123.445 E.0063
; LINE_WIDTH: 0.388042
G1 X135.095 Y123.368 E.00698
; LINE_WIDTH: 0.410213
G1 X135.121 Y123.359 E.00083
; LINE_WIDTH: 0.436001
G2 X135.239 Y123.275 I-.959 J-1.47 E.00465
; LINE_WIDTH: 0.476208
G1 X135.331 Y123.208 E.00402
; LINE_WIDTH: 0.488434
G2 X135.575 Y122.939 I-.726 J-.902 E.01321
; LINE_WIDTH: 0.440622
G1 X135.642 Y122.847 E.00369
; LINE_WIDTH: 0.41921
G1 X135.659 Y122.821 E.00096
; LINE_WIDTH: 0.390272
G2 X135.745 Y122.559 I-3.458 J-1.283 E.00781
; LINE_WIDTH: 0.354432
G1 X135.822 Y122.323 E.0063
; LINE_WIDTH: 0.320825
G1 X135.899 Y122.087 E.00562
M204 S10000
G1 X135.899 Y109.313 F42000
; LINE_WIDTH: 0.320837
G1 F3206
M204 S6000
G1 X135.822 Y109.077 E.00562
; LINE_WIDTH: 0.35444
G1 X135.745 Y108.841 E.0063
; LINE_WIDTH: 0.390274
G2 X135.659 Y108.579 I-3.545 J1.021 E.00781
; LINE_WIDTH: 0.419205
G1 X135.642 Y108.553 E.00096
; LINE_WIDTH: 0.440625
G1 X135.575 Y108.461 E.00369
; LINE_WIDTH: 0.488432
G2 X135.331 Y108.192 I-.969 J.634 E.01321
; LINE_WIDTH: 0.476215
G1 X135.239 Y108.125 E.00402
; LINE_WIDTH: 0.435995
G2 X135.121 Y108.041 I-1.076 J1.384 E.00465
; LINE_WIDTH: 0.410217
G1 X135.095 Y108.032 E.00083
; LINE_WIDTH: 0.388043
G1 X134.859 Y107.955 E.00698
; LINE_WIDTH: 0.354442
G1 X134.623 Y107.878 E.0063
; LINE_WIDTH: 0.320842
G1 X134.387 Y107.801 E.00562
M204 S10000
G1 X121.613 Y107.801 F42000
; LINE_WIDTH: 0.320837
G1 F3206
M204 S6000
G1 X121.377 Y107.878 E.00562
; LINE_WIDTH: 0.35444
G1 X121.141 Y107.955 E.0063
; LINE_WIDTH: 0.390274
G2 X120.879 Y108.041 I1.021 J3.545 E.00781
; LINE_WIDTH: 0.419203
G1 X120.853 Y108.058 E.00096
; LINE_WIDTH: 0.440626
G1 X120.761 Y108.125 E.00369
; LINE_WIDTH: 0.488432
G2 X120.492 Y108.369 I.634 J.969 E.01321
; LINE_WIDTH: 0.476217
G1 X120.425 Y108.461 E.00402
; LINE_WIDTH: 0.436
G2 X120.341 Y108.579 I1.39 J1.08 E.00465
; LINE_WIDTH: 0.410224
G1 X120.332 Y108.605 E.00083
; LINE_WIDTH: 0.388043
G1 X120.255 Y108.841 E.00698
; LINE_WIDTH: 0.354442
G1 X120.178 Y109.077 E.0063
; LINE_WIDTH: 0.320842
G1 X120.101 Y109.313 E.00562
M204 S10000
G1 X120.101 Y122.087 F42000
; LINE_WIDTH: 0.320837
G1 F3206
M204 S6000
G1 X120.178 Y122.323 E.00562
; LINE_WIDTH: 0.35444
G1 X120.255 Y122.559 E.0063
; LINE_WIDTH: 0.388042
G1 X120.332 Y122.795 E.00698
; LINE_WIDTH: 0.410213
G1 X120.341 Y122.821 E.00083
; LINE_WIDTH: 0.436001
G2 X120.425 Y122.939 I1.47 J-.959 E.00465
; LINE_WIDTH: 0.476208
G1 X120.492 Y123.031 E.00402
; LINE_WIDTH: 0.488435
G2 X120.761 Y123.275 I.902 J-.725 E.01321
; LINE_WIDTH: 0.440626
G1 X120.853 Y123.342 E.00369
; LINE_WIDTH: 0.41921
G1 X120.879 Y123.359 E.00096
; LINE_WIDTH: 0.390275
G2 X121.141 Y123.445 I1.289 J-3.477 E.00781
; LINE_WIDTH: 0.354442
G1 X121.377 Y123.522 E.0063
; LINE_WIDTH: 0.320842
G1 X121.613 Y123.599 E.00562
; WIPE_START
G1 F12953.299
G1 X121.377 Y123.522 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.243 Y116.941 Z5.8 F42000
G1 X126.723 Y114.423 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3206
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.945 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3206
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
G1 X129.277 Y113.792 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3206
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13179
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F3206
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.558 Y117.383 E.00645
G3 X129.277 Y117.608 I-1.053 J-1.022 E.01198
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.558 Y117.383 E-.07384
G1 X129.277 Y117.608 E-.13691
G1 X129.277 Y117.15 E-.17401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F3206
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.889 J-3.609 E.03074
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.17 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3206
M204 S5000
G3 X126.655 Y113.371 I-.9 J2.532 E.44764
G3 X128.03 Y113.015 I1.355 J2.402 E.04412
G3 X128.835 Y113.151 I-.038 J2.687 E.02518
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14844
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12579
G1 X130.345 Y114.388 E-.10823
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 28/36
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I1.023 J.659 P1  F42000
G1 X134.431 Y108.044 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
M204 S6000
G1 X134.943 Y108.305 E.01904
G1 X135.395 Y108.757 E.02123
G1 X135.686 Y109.328 E.02123
G1 X135.778 Y109.913 E.01964
G1 X135.778 Y121.487 E.38395
G1 X135.686 Y122.072 E.01964
G1 X135.395 Y122.643 E.02123
G1 X134.943 Y123.095 E.02123
G1 X134.372 Y123.386 E.02123
G1 X133.787 Y123.478 E.01964
G1 X122.213 Y123.478 E.38395
G1 X121.628 Y123.386 E.01964
G1 X121.057 Y123.095 E.02123
G1 X120.605 Y122.643 E.02123
G1 X120.314 Y122.072 E.02123
G1 X120.222 Y121.487 E.01964
G1 X120.222 Y109.913 E.38395
G1 X120.314 Y109.328 E.01964
G1 X120.605 Y108.757 E.02123
G1 X120.913 Y108.449 E.01448
G1 X121.057 Y108.305 E.00676
G1 X121.628 Y108.014 E.02123
G1 X122.213 Y107.922 E.01964
G1 X133.787 Y107.922 E.38395
G1 X134.372 Y108.014 E.01964
G1 X134.378 Y108.017 E.00021
M204 S250
G1 X134.253 Y108.394 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
M204 S5000
G1 X134.709 Y108.626 E.01573
G1 X135.074 Y108.991 E.01585
G1 X135.308 Y109.45 E.01585
G1 X135.386 Y109.944 E.01534
G1 X135.386 Y121.457 E.35376
G1 X135.308 Y121.95 E.01534
G1 X135.074 Y122.409 E.01585
G1 X134.709 Y122.774 E.01585
G1 X134.25 Y123.008 E.01585
G1 X133.757 Y123.086 E.01534
G1 X122.243 Y123.086 E.35376
G1 X121.75 Y123.008 E.01534
G1 X121.291 Y122.774 E.01585
G1 X120.926 Y122.409 E.01585
G1 X120.692 Y121.95 E.01585
G1 X120.614 Y121.457 E.01534
G1 X120.614 Y109.944 E.35376
G1 X120.692 Y109.45 E.01534
G1 X120.926 Y108.991 E.01585
G1 X121.191 Y108.726 E.0115
G1 X121.291 Y108.626 E.00435
G1 X121.75 Y108.392 E.01585
G1 X122.243 Y108.314 E.01534
G1 X133.757 Y108.314 E.35376
G1 X134.194 Y108.383 E.01362
; WIPE_START
G1 F3600
M204 S6000
G1 X134.709 Y108.626 E-.21635
G1 X135.074 Y108.991 E-.19605
G1 X135.308 Y109.45 E-.19604
G1 X135.371 Y109.844 E-.15156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.669 Y117.471 Z6 F42000
G1 X135.898 Y123.322 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
M204 S6000
G1 X135.622 Y123.598 E.01296
G1 X135.273 Y123.775 E.01296
G1 X134.84 Y123.844 E.01455
G1 X121.16 Y123.844 E.45379
G1 X120.727 Y123.775 E.01455
G1 X120.378 Y123.598 E.01296
G1 X120.102 Y123.322 E.01296
G1 X119.925 Y122.973 E.01296
G1 X119.856 Y122.54 E.01455
G1 X119.856 Y108.86 E.45379
G1 X119.925 Y108.427 E.01455
G1 X120.102 Y108.079 E.01296
G1 X120.378 Y107.802 E.01296
G1 X120.727 Y107.625 E.01296
G1 X121.16 Y107.556 E.01455
G1 X134.84 Y107.556 E.45379
G1 X135.273 Y107.625 E.01455
G1 X135.622 Y107.802 E.01296
G1 X135.898 Y108.079 E.01296
G1 X136.075 Y108.427 E.01296
G1 X136.144 Y108.86 E.01455
G1 X136.144 Y122.54 E.45379
G1 X136.075 Y122.973 E.01455
G1 X135.925 Y123.268 E.01097
M204 S250
G1 X136.219 Y123.555 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
M204 S5000
G1 X135.855 Y123.919 E.01582
G1 X135.396 Y124.153 E.01582
G1 X134.871 Y124.236 E.01634
G1 X121.129 Y124.236 E.42225
G1 X120.604 Y124.153 E.01634
G1 X120.145 Y123.919 E.01582
G1 X119.781 Y123.555 E.01582
G1 X119.547 Y123.096 E.01582
G1 X119.464 Y122.571 E.01634
G1 X119.464 Y108.829 E.42225
M73 P88 R1
G1 X119.547 Y108.304 E.01634
G1 X119.781 Y107.845 E.01582
G1 X120.145 Y107.481 E.01582
G1 X120.604 Y107.247 E.01582
G1 X121.129 Y107.164 E.01634
G1 X134.871 Y107.164 E.42225
G1 X135.327 Y107.236 E.01418
G1 X135.396 Y107.247 E.00216
G1 X135.855 Y107.481 E.01582
G1 X136.219 Y107.845 E.01582
G1 X136.453 Y108.304 E.01582
G1 X136.536 Y108.829 E.01634
G1 X136.536 Y122.571 E.42225
G1 X136.453 Y123.096 E.01634
G1 X136.246 Y123.501 E.01398
; WIPE_START
G1 F3600
M204 S6000
G1 X135.855 Y123.919 E-.21746
G1 X135.396 Y124.153 E-.19566
G1 X134.871 Y124.236 E-.20205
G1 X134.49 Y124.236 E-.14484
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


; object ids of this layer28 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.45 Y123.64 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297814
G1 F3221
M204 S6000
G1 X134.681 Y123.565 E.00504
; LINE_WIDTH: 0.333703
G1 X134.911 Y123.49 E.00575
; LINE_WIDTH: 0.369592
G1 X135.142 Y123.415 E.00646
; LINE_WIDTH: 0.410571
G2 X135.282 Y123.322 I-.253 J-.529 E.00505
; LINE_WIDTH: 0.453631
G1 X135.373 Y123.256 E.00378
; LINE_WIDTH: 0.465914
G2 X135.622 Y122.982 I-.74 J-.923 E.01282
; LINE_WIDTH: 0.418283
G1 X135.688 Y122.89 E.00345
; LINE_WIDTH: 0.374295
G2 X135.715 Y122.842 I-.087 J-.08 E.00151
G1 X135.79 Y122.611 E.00655
; LINE_WIDTH: 0.333688
G1 X135.865 Y122.381 E.00575
; LINE_WIDTH: 0.297802
G1 X135.94 Y122.15 E.00504
M204 S10000
G1 X135.94 Y109.25 F42000
; LINE_WIDTH: 0.297814
G1 F3221
M204 S6000
G1 X135.865 Y109.019 E.00504
; LINE_WIDTH: 0.333702
G1 X135.79 Y108.789 E.00575
; LINE_WIDTH: 0.374306
G1 X135.715 Y108.558 E.00655
G2 X135.688 Y108.51 I-.114 J.032 E.00151
; LINE_WIDTH: 0.418274
G1 X135.622 Y108.418 E.00345
; LINE_WIDTH: 0.465915
G2 X135.373 Y108.144 I-.989 J.649 E.01282
; LINE_WIDTH: 0.453631
G1 X135.282 Y108.078 E.00378
; LINE_WIDTH: 0.41057
G2 X135.142 Y107.985 I-.394 J.437 E.00505
; LINE_WIDTH: 0.369592
G1 X134.911 Y107.91 E.00646
; LINE_WIDTH: 0.333707
G1 X134.681 Y107.835 E.00575
; LINE_WIDTH: 0.297822
G1 X134.45 Y107.76 E.00504
M204 S10000
G1 X121.55 Y107.76 F42000
; LINE_WIDTH: 0.297815
G1 F3221
M204 S6000
G1 X121.319 Y107.835 E.00504
; LINE_WIDTH: 0.333694
G1 X121.089 Y107.91 E.00575
; LINE_WIDTH: 0.374292
G1 X120.858 Y107.985 E.00655
G2 X120.81 Y108.012 I.032 J.114 E.00151
; LINE_WIDTH: 0.418302
G1 X120.718 Y108.078 E.00346
; LINE_WIDTH: 0.465938
G2 X120.444 Y108.327 I.649 J.989 E.01282
; LINE_WIDTH: 0.453645
G1 X120.378 Y108.418 E.00378
; LINE_WIDTH: 0.410582
G2 X120.285 Y108.558 I.437 J.393 E.00505
; LINE_WIDTH: 0.3696
G1 X120.21 Y108.789 E.00646
; LINE_WIDTH: 0.333713
G1 X120.135 Y109.019 E.00575
; LINE_WIDTH: 0.297826
G1 X120.06 Y109.25 E.00504
M204 S10000
G1 X120.06 Y122.15 F42000
; LINE_WIDTH: 0.297814
G1 F3221
M204 S6000
G1 X120.135 Y122.381 E.00504
; LINE_WIDTH: 0.333703
G1 X120.21 Y122.611 E.00575
; LINE_WIDTH: 0.369592
G1 X120.285 Y122.842 E.00646
; LINE_WIDTH: 0.410571
G2 X120.378 Y122.982 I.529 J-.253 E.00505
; LINE_WIDTH: 0.453631
G1 X120.444 Y123.073 E.00378
; LINE_WIDTH: 0.465914
G2 X120.718 Y123.322 I.923 J-.74 E.01282
; LINE_WIDTH: 0.418282
G1 X120.81 Y123.388 E.00345
; LINE_WIDTH: 0.37431
G2 X120.858 Y123.415 I.08 J-.087 E.00151
G1 X121.089 Y123.49 E.00655
; LINE_WIDTH: 0.333707
G1 X121.319 Y123.565 E.00575
; LINE_WIDTH: 0.297822
G1 X121.55 Y123.64 E.00504
; WIPE_START
G1 F14123.113
G1 X121.319 Y123.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.203 Y116.995 Z6 F42000
G1 X126.723 Y114.423 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
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
G1 X129.277 Y113.792 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.10752
G1 X129.915 Y114.423 E-.13177
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F3221
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.669 J-1.518 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.247 E-.13183
G1 X129.494 Y117.444 E-.10744
G1 X129.277 Y117.608 E-.10347
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F3221
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.925 J-3.645 E.03074
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16105
G1 X126.062 Y116.977 E-.19116
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
M204 S5000
G3 X130.248 Y114.231 I-.896 J2.538 E.05386
G3 X128.017 Y113.015 I-2.248 J1.469 E.43712
G3 X128.836 Y113.149 I-.02 J2.691 E.0256
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14845
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12584
G1 X130.248 Y114.231 E-.16339
G1 X130.248 Y114.231 E-.00001
G1 X130.345 Y114.389 E-.0706
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 29/36
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6 I1.022 J.66 P1  F42000
G1 X134.477 Y107.987 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X134.993 Y108.25 E.01922
G1 X135.45 Y108.707 E.02142
G1 X135.743 Y109.282 E.02142
G1 X135.837 Y109.873 E.01983
G1 X135.837 Y121.527 E.38661
G1 X135.743 Y122.118 E.01983
G1 X135.45 Y122.693 E.02142
G1 X134.993 Y123.15 E.02142
G1 X134.418 Y123.443 E.02142
G1 X133.827 Y123.537 E.01983
G1 X122.173 Y123.537 E.38661
G1 X121.582 Y123.443 E.01983
G1 X121.007 Y123.15 E.02142
G1 X120.55 Y122.693 E.02142
G1 X120.257 Y122.118 E.02142
G1 X120.163 Y121.527 E.01983
G1 X120.163 Y109.873 E.38661
G1 X120.257 Y109.282 E.01983
G1 X120.55 Y108.707 E.02142
G1 X121.007 Y108.25 E.02142
G1 X121.582 Y107.957 E.02142
G1 X122.173 Y107.863 E.01983
G1 X133.827 Y107.863 E.38661
G1 X134.418 Y107.957 E.01983
G1 X134.424 Y107.96 E.00021
M204 S250
G1 X134.299 Y108.336 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G1 X134.76 Y108.571 E.0159
G1 X135.129 Y108.94 E.01603
G1 X135.366 Y109.405 E.01603
G1 X135.445 Y109.904 E.01551
G1 X135.445 Y121.497 E.35622
G1 X135.366 Y121.995 E.01551
G1 X135.129 Y122.46 E.01603
G1 X134.76 Y122.829 E.01603
G1 X134.295 Y123.066 E.01603
G1 X133.797 Y123.145 E.01551
G1 X122.203 Y123.145 E.35622
G1 X121.705 Y123.066 E.01551
G1 X121.24 Y122.829 E.01603
G1 X120.871 Y122.46 E.01603
G1 X120.634 Y121.995 E.01603
G1 X120.555 Y121.497 E.01551
G1 X120.555 Y109.904 E.35622
G1 X120.634 Y109.405 E.01551
G1 X120.871 Y108.94 E.01603
G1 X121.24 Y108.571 E.01603
G1 X121.705 Y108.334 E.01603
G1 X122.203 Y108.255 E.01551
G1 X133.797 Y108.255 E.35622
G1 X134.24 Y108.326 E.0138
; WIPE_START
G1 F3600
M204 S6000
G1 X134.76 Y108.571 E-.21844
G1 X135.129 Y108.94 E-.19821
G1 X135.366 Y109.405 E-.19821
G1 X135.425 Y109.782 E-.14515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.712 Y117.409 Z6.2 F42000
G1 X135.936 Y123.356 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X135.656 Y123.636 E.01313
G1 X135.304 Y123.816 E.01313
G1 X134.865 Y123.885 E.01473
G1 X121.135 Y123.885 E.45545
G1 X120.696 Y123.816 E.01473
G1 X120.344 Y123.636 E.01313
G1 X120.064 Y123.356 E.01313
G1 X119.884 Y123.004 E.01313
G1 X119.815 Y122.565 E.01473
G1 X119.815 Y108.835 E.45545
G1 X119.884 Y108.396 E.01473
G1 X120.064 Y108.044 E.01313
G1 X120.344 Y107.764 E.01313
G1 X120.696 Y107.584 E.01313
G1 X121.135 Y107.515 E.01473
M73 P89 R1
G1 X134.865 Y107.515 E.45545
G1 X135.304 Y107.584 E.01473
G1 X135.656 Y107.764 E.01313
G1 X135.936 Y108.044 E.01313
G1 X136.116 Y108.396 E.01313
G1 X136.185 Y108.835 E.01473
G1 X136.185 Y122.565 E.45545
G1 X136.116 Y123.004 E.01473
G1 X135.963 Y123.303 E.01114
M204 S250
G1 X136.257 Y123.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G1 X135.89 Y123.957 E.01598
G1 X135.426 Y124.194 E.01598
G1 X134.896 Y124.278 E.0165
G1 X121.104 Y124.278 E.42379
G1 X120.574 Y124.194 E.0165
G1 X120.11 Y123.957 E.01598
G1 X119.743 Y123.59 E.01598
G1 X119.506 Y123.126 E.01598
G1 X119.422 Y122.596 E.0165
G1 X119.422 Y108.804 E.42379
G1 X119.506 Y108.274 E.0165
G1 X119.743 Y107.81 E.01598
G1 X120.11 Y107.443 E.01598
G1 X120.574 Y107.207 E.01598
G1 X121.104 Y107.123 E.0165
G1 X134.896 Y107.123 E.42379
G1 X135.369 Y107.197 E.01471
G1 X135.426 Y107.206 E.00178
G1 X135.89 Y107.443 E.01598
G1 X136.257 Y107.81 E.01598
G1 X136.494 Y108.274 E.01598
G1 X136.578 Y108.804 E.0165
G1 X136.578 Y122.596 E.42379
G1 X136.494 Y123.126 E.0165
G1 X136.285 Y123.536 E.01414
; WIPE_START
G1 F3600
M204 S6000
G1 X135.89 Y123.957 E-.21944
G1 X135.426 Y124.194 E-.19763
G1 X134.896 Y124.278 E-.20403
G1 X134.53 Y124.278 E-.1389
; WIPE_END
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


; object ids of this layer29 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.513 Y123.682 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274785
G1 F3235
M204 S6000
G1 X134.738 Y123.609 E.00447
; LINE_WIDTH: 0.312951
G1 X134.964 Y123.536 E.00521
; LINE_WIDTH: 0.351117
G1 X135.189 Y123.462 E.00595
; LINE_WIDTH: 0.389094
G2 X135.324 Y123.369 I-.528 J-.91 E.00463
; LINE_WIDTH: 0.431052
G1 X135.414 Y123.303 E.00355
; LINE_WIDTH: 0.443405
G2 X135.669 Y123.024 I-.755 J-.944 E.0124
; LINE_WIDTH: 0.395958
G1 X135.735 Y122.933 E.00323
; LINE_WIDTH: 0.355287
G1 X135.836 Y122.664 E.00732
; LINE_WIDTH: 0.312945
G1 X135.909 Y122.438 E.00521
; LINE_WIDTH: 0.274781
G1 X135.982 Y122.213 E.00447
M204 S10000
G1 X135.982 Y109.187 F42000
; LINE_WIDTH: 0.274785
G1 F3235
M204 S6000
G1 X135.909 Y108.962 E.00447
; LINE_WIDTH: 0.312951
G1 X135.836 Y108.737 E.00521
; LINE_WIDTH: 0.355292
G2 X135.735 Y108.467 I-.61 J.074 E.00739
; LINE_WIDTH: 0.395951
G1 X135.669 Y108.376 E.00323
; LINE_WIDTH: 0.443407
G2 X135.414 Y108.097 I-1.01 J.664 E.0124
; LINE_WIDTH: 0.431044
G1 X135.324 Y108.031 E.00355
; LINE_WIDTH: 0.389094
G2 X135.189 Y107.938 I-.804 J1.022 E.00463
; LINE_WIDTH: 0.351117
G1 X134.963 Y107.864 E.00595
; LINE_WIDTH: 0.31295
G1 X134.738 Y107.791 E.00521
; LINE_WIDTH: 0.274783
G1 X134.513 Y107.718 E.00447
M204 S10000
G1 X121.487 Y107.718 F42000
; LINE_WIDTH: 0.274785
G1 F3235
M204 S6000
G1 X121.262 Y107.791 E.00447
; LINE_WIDTH: 0.312951
G1 X121.036 Y107.864 E.00521
; LINE_WIDTH: 0.355292
G2 X120.767 Y107.965 I.074 J.61 E.00739
; LINE_WIDTH: 0.395951
G1 X120.676 Y108.031 E.00323
; LINE_WIDTH: 0.443407
G2 X120.397 Y108.286 I.664 J1.01 E.0124
; LINE_WIDTH: 0.431044
G1 X120.331 Y108.376 E.00355
; LINE_WIDTH: 0.389096
G2 X120.238 Y108.511 I1.02 J.803 E.00463
; LINE_WIDTH: 0.351109
G1 X120.164 Y108.737 E.00595
; LINE_WIDTH: 0.312945
G1 X120.091 Y108.962 E.00521
; LINE_WIDTH: 0.274781
G1 X120.018 Y109.187 E.00447
M204 S10000
G1 X120.018 Y122.213 F42000
; LINE_WIDTH: 0.274785
G1 F3235
M204 S6000
G1 X120.091 Y122.438 E.00447
; LINE_WIDTH: 0.312951
G1 X120.164 Y122.664 E.00521
; LINE_WIDTH: 0.351117
G1 X120.238 Y122.889 E.00595
; LINE_WIDTH: 0.389094
G2 X120.331 Y123.024 I.91 J-.528 E.00463
; LINE_WIDTH: 0.431052
G1 X120.397 Y123.114 E.00355
; LINE_WIDTH: 0.443405
G2 X120.676 Y123.369 I.944 J-.755 E.0124
; LINE_WIDTH: 0.395958
G1 X120.767 Y123.435 E.00323
; LINE_WIDTH: 0.355287
G1 X121.036 Y123.536 E.00732
; LINE_WIDTH: 0.312945
G1 X121.262 Y123.609 E.00521
; LINE_WIDTH: 0.274781
G1 X121.487 Y123.682 E.00447
; WIPE_START
G1 F15000
G1 X121.262 Y123.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.162 Y117.048 Z6.2 F42000
G1 X126.723 Y114.423 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.343 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
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
G1 X129.277 Y113.792 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09153
G1 X129.697 Y114.153 E-.10745
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3235
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.664 J-1.513 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10747
G1 X129.277 Y117.608 E-.10345
G1 X129.277 Y117.151 E-.17384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F3235
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.975 J-3.697 E.03074
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.1912
G1 X126.485 Y116.977 E-.16065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.169 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G3 X126.655 Y113.371 I-.9 J2.531 E.44733
G3 X128.003 Y113.014 I1.36 J2.415 E.04331
G3 X128.835 Y113.15 I-.011 J2.686 E.026
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14843
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12583
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.1082
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 30/36
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I1.022 J.661 P1  F42000
G1 X134.522 Y107.93 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X135.044 Y108.195 E.01942
G1 X135.505 Y108.656 E.02161
G1 X135.8 Y109.237 E.02161
G1 X135.895 Y109.833 E.02002
G1 X135.895 Y121.567 E.38926
G1 X135.8 Y122.163 E.02002
G1 X135.505 Y122.744 E.02161
G1 X135.044 Y123.205 E.02161
G1 X134.463 Y123.5 E.02161
G1 X133.867 Y123.595 E.02002
G1 X122.133 Y123.595 E.38926
G1 X121.537 Y123.5 E.02002
G1 X120.956 Y123.205 E.02161
G1 X120.495 Y122.744 E.02161
G1 X120.2 Y122.163 E.02161
G1 X120.105 Y121.567 E.02002
G1 X120.105 Y109.833 E.38926
G1 X120.2 Y109.237 E.02002
G1 X120.495 Y108.656 E.02161
G1 X120.956 Y108.195 E.02161
G1 X121.537 Y107.9 E.02161
G1 X122.133 Y107.805 E.02002
G1 X133.867 Y107.805 E.38926
G1 X134.463 Y107.9 E.02002
G1 X134.469 Y107.902 E.00021
M204 S250
G1 X134.344 Y108.279 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G1 X134.811 Y108.517 E.01608
G1 X135.183 Y108.889 E.0162
G1 X135.423 Y109.359 E.0162
G1 X135.503 Y109.864 E.01569
G1 X135.503 Y121.537 E.35868
G1 X135.423 Y122.041 E.01569
M73 P90 R1
G1 X135.183 Y122.511 E.0162
G1 X134.811 Y122.883 E.0162
G1 X134.341 Y123.123 E.0162
G1 X133.837 Y123.203 E.01569
G1 X122.163 Y123.203 E.35868
G1 X121.659 Y123.123 E.01569
G1 X121.189 Y122.883 E.0162
G1 X120.817 Y122.511 E.0162
G1 X120.577 Y122.041 E.0162
G1 X120.497 Y121.537 E.01569
G1 X120.497 Y109.864 E.35868
G1 X120.577 Y109.359 E.01569
G1 X120.817 Y108.889 E.0162
G1 X121.189 Y108.517 E.0162
G1 X121.659 Y108.277 E.0162
G1 X122.163 Y108.197 E.01569
G1 X133.837 Y108.197 E.35868
G1 X134.286 Y108.268 E.01397
; WIPE_START
G1 F3600
M204 S6000
G1 X134.811 Y108.517 E-.22067
G1 X135.183 Y108.889 E-.20037
G1 X135.423 Y109.359 E-.20037
G1 X135.48 Y109.719 E-.13859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.756 Y117.347 Z6.4 F42000
G1 X135.975 Y123.391 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X135.691 Y123.675 E.0133
G1 X135.334 Y123.857 E.01331
G1 X134.89 Y123.927 E.0149
G1 X121.11 Y123.927 E.45711
G1 X120.666 Y123.857 E.0149
G1 X120.309 Y123.675 E.01331
G1 X120.025 Y123.391 E.0133
G1 X119.843 Y123.034 E.01331
G1 X119.773 Y122.59 E.0149
G1 X119.773 Y108.81 E.45711
G1 X119.843 Y108.366 E.0149
G1 X120.025 Y108.009 E.01331
G1 X120.309 Y107.725 E.0133
G1 X120.666 Y107.543 E.01331
G1 X121.11 Y107.473 E.0149
G1 X134.89 Y107.473 E.45711
G1 X135.334 Y107.543 E.0149
G1 X135.691 Y107.725 E.01331
G1 X135.975 Y108.009 E.01331
G1 X136.157 Y108.366 E.01331
G1 X136.227 Y108.81 E.0149
G1 X136.227 Y122.59 E.45711
G1 X136.157 Y123.034 E.0149
G1 X136.002 Y123.338 E.01132
M204 S250
G1 X136.296 Y123.624 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G1 X135.924 Y123.996 E.01614
G1 X135.456 Y124.234 E.01614
G1 X134.921 Y124.319 E.01666
G1 X121.079 Y124.319 E.42532
G1 X120.544 Y124.234 E.01666
G1 X120.076 Y123.996 E.01614
G1 X119.704 Y123.624 E.01614
G1 X119.466 Y123.156 E.01614
G1 X119.381 Y122.621 E.01666
G1 X119.381 Y108.779 E.42532
G1 X119.466 Y108.244 E.01666
G1 X119.704 Y107.776 E.01614
G1 X120.076 Y107.404 E.01614
G1 X120.544 Y107.166 E.01614
G1 X121.079 Y107.081 E.01666
G1 X134.921 Y107.081 E.42532
G1 X135.411 Y107.158 E.01525
G1 X135.456 Y107.166 E.00141
G1 X135.924 Y107.404 E.01614
G1 X136.296 Y107.776 E.01614
G1 X136.534 Y108.244 E.01614
G1 X136.619 Y108.779 E.01666
G1 X136.619 Y122.621 E.42532
G1 X136.534 Y123.156 E.01666
G1 X136.323 Y123.571 E.0143
; WIPE_START
G1 F3600
M204 S6000
G1 X135.924 Y123.996 E-.22141
G1 X135.456 Y124.234 E-.19962
G1 X134.921 Y124.319 E-.20601
G1 X134.571 Y124.319 E-.13296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
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


; object ids of this layer30 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.576 Y123.724 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.251018
G1 F3250
M204 S6000
G1 X134.792 Y123.654 E.00384
; LINE_WIDTH: 0.290017
G1 X135.007 Y123.584 E.00456
; LINE_WIDTH: 0.329017
G1 X135.222 Y123.514 E.00528
; LINE_WIDTH: 0.365665
G2 X135.366 Y123.417 I-.452 J-.823 E.00457
; LINE_WIDTH: 0.408438
G1 X135.456 Y123.351 E.00332
; LINE_WIDTH: 0.420858
G2 X135.717 Y123.066 I-.77 J-.965 E.01195
; LINE_WIDTH: 0.373611
G1 X135.782 Y122.976 E.003
; LINE_WIDTH: 0.333869
G2 X135.884 Y122.707 I-.546 J-.36 E.00687
; LINE_WIDTH: 0.290018
G1 X135.954 Y122.492 E.00456
; LINE_WIDTH: 0.251019
G1 X136.024 Y122.276 E.00384
M204 S10000
G1 X136.024 Y109.124 F42000
; LINE_WIDTH: 0.25101
G1 F3250
M204 S6000
G1 X135.954 Y108.908 E.00384
; LINE_WIDTH: 0.290012
G1 X135.884 Y108.693 E.00456
; LINE_WIDTH: 0.333868
G2 X135.782 Y108.424 I-.647 J.091 E.00687
; LINE_WIDTH: 0.373595
G1 X135.717 Y108.334 E.003
; LINE_WIDTH: 0.42086
G2 X135.456 Y108.049 I-1.031 J.68 E.01195
; LINE_WIDTH: 0.408444
G1 X135.366 Y107.983 E.00332
; LINE_WIDTH: 0.365674
G2 X135.222 Y107.886 I-.596 J.727 E.00457
; LINE_WIDTH: 0.32902
G1 X135.007 Y107.816 E.00528
; LINE_WIDTH: 0.290028
G1 X134.792 Y107.746 E.00456
; LINE_WIDTH: 0.251036
G1 X134.576 Y107.676 E.00384
M204 S10000
G1 X121.424 Y107.676 F42000
; LINE_WIDTH: 0.251018
G1 F3250
M204 S6000
G1 X121.208 Y107.746 E.00384
; LINE_WIDTH: 0.290017
G1 X120.993 Y107.816 E.00456
; LINE_WIDTH: 0.333871
G2 X120.724 Y107.918 I.091 J.647 E.00687
; LINE_WIDTH: 0.373592
G1 X120.634 Y107.983 E.003
; LINE_WIDTH: 0.420855
G2 X120.349 Y108.244 I.68 J1.03 E.01195
; LINE_WIDTH: 0.408444
G1 X120.283 Y108.334 E.00332
; LINE_WIDTH: 0.365676
G2 X120.186 Y108.478 I.727 J.596 E.00457
; LINE_WIDTH: 0.329017
G1 X120.116 Y108.693 E.00528
; LINE_WIDTH: 0.290018
G1 X120.046 Y108.908 E.00456
; LINE_WIDTH: 0.251019
G1 X119.976 Y109.124 E.00384
M204 S10000
G1 X119.976 Y122.276 F42000
; LINE_WIDTH: 0.251018
G1 F3250
M204 S6000
G1 X120.046 Y122.492 E.00384
; LINE_WIDTH: 0.290017
G1 X120.116 Y122.707 E.00456
; LINE_WIDTH: 0.329017
G1 X120.186 Y122.922 E.00528
; LINE_WIDTH: 0.365665
G2 X120.283 Y123.066 I.823 J-.452 E.00457
; LINE_WIDTH: 0.408438
G1 X120.349 Y123.156 E.00332
; LINE_WIDTH: 0.420858
G2 X120.634 Y123.417 I.965 J-.77 E.01195
; LINE_WIDTH: 0.373611
G1 X120.724 Y123.482 E.003
; LINE_WIDTH: 0.333869
G2 X120.993 Y123.584 I.36 J-.546 E.00687
; LINE_WIDTH: 0.290018
G1 X121.208 Y123.654 E.00456
; LINE_WIDTH: 0.251019
G1 X121.424 Y123.724 E.00384
; WIPE_START
G1 F15000
G1 X121.208 Y123.654 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.123 Y117.101 Z6.4 F42000
G1 X126.723 Y114.423 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.947 J2.346 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
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
G1 X129.277 Y113.792 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.676 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10743
G1 X129.915 Y114.423 E-.13183
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F3250
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.529 Y117.41 E.00776
G3 X129.277 Y117.608 I-.927 J-.921 E.01067
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.529 Y117.41 E-.08892
G1 X129.277 Y117.608 E-.12189
G1 X129.277 Y117.151 E-.17395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F3250
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.285 J-2.992 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.169 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P91 R1
G1 F3250
M204 S5000
G3 X126.952 Y113.223 I-.901 J2.532 E.45778
G3 X127.99 Y113.014 I1.027 J2.417 E.03278
G3 X128.835 Y113.15 I.001 J2.687 E.02641
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14845
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12582
G1 X130.195 Y114.146 E-.12584
G1 X130.345 Y114.388 E-.10819
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 31/36
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I1.021 J.662 P1  F42000
G1 X134.568 Y107.872 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
M204 S6000
G1 X135.095 Y108.141 E.01962
G1 X135.559 Y108.605 E.0218
G1 X135.858 Y109.191 E.0218
G1 X135.953 Y109.793 E.02021
G1 X135.953 Y121.607 E.39192
G1 X135.858 Y122.209 E.02021
G1 X135.559 Y122.795 E.0218
G1 X135.095 Y123.259 E.0218
G1 X134.509 Y123.558 E.0218
G1 X133.907 Y123.653 E.02021
G1 X122.093 Y123.653 E.39192
G1 X121.491 Y123.558 E.02021
G1 X120.905 Y123.259 E.0218
G1 X120.441 Y122.795 E.0218
G1 X120.142 Y122.209 E.0218
G1 X120.047 Y121.607 E.02021
G1 X120.047 Y109.793 E.39192
G1 X120.142 Y109.191 E.02021
G1 X120.441 Y108.605 E.0218
G1 X120.788 Y108.258 E.01631
G1 X120.905 Y108.141 E.00549
G1 X121.491 Y107.842 E.0218
G1 X122.093 Y107.747 E.02021
G1 X133.907 Y107.747 E.39192
G1 X134.509 Y107.842 E.02021
G1 X134.514 Y107.845 E.00019
M204 S250
G1 X134.39 Y108.221 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
M204 S5000
G1 X134.861 Y108.462 E.01627
G1 X135.238 Y108.839 E.01638
G1 X135.48 Y109.314 E.01638
G1 X135.561 Y109.823 E.01586
G1 X135.561 Y121.577 E.36114
G1 X135.48 Y122.086 E.01586
G1 X135.238 Y122.561 E.01638
G1 X134.861 Y122.938 E.01638
G1 X134.386 Y123.18 E.01638
G1 X133.877 Y123.261 E.01586
G1 X122.123 Y123.261 E.36114
G1 X121.614 Y123.18 E.01586
G1 X121.139 Y122.938 E.01638
G1 X120.762 Y122.561 E.01638
G1 X120.52 Y122.086 E.01638
G1 X120.439 Y121.577 E.01586
G1 X120.439 Y109.823 E.36114
G1 X120.52 Y109.314 E.01586
G1 X120.762 Y108.839 E.01638
G1 X121.066 Y108.535 E.0132
G1 X121.139 Y108.462 E.00318
G1 X121.614 Y108.22 E.01638
G1 X122.123 Y108.139 E.01586
G1 X133.877 Y108.139 E.36114
G1 X134.331 Y108.211 E.01413
; WIPE_START
G1 F3600
M204 S6000
G1 X134.861 Y108.462 E-.22304
G1 X135.238 Y108.839 E-.20254
G1 X135.48 Y109.314 E-.20253
G1 X135.534 Y109.656 E-.13189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.8 Y117.284 Z6.6 F42000
G1 X136.013 Y123.426 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
M204 S6000
G1 X135.726 Y123.713 E.01348
G1 X135.364 Y123.898 E.01348
G1 X134.915 Y123.969 E.01507
G1 X121.085 Y123.969 E.45877
G1 X120.636 Y123.898 E.01507
G1 X120.274 Y123.713 E.01348
G1 X119.987 Y123.426 E.01348
G1 X119.802 Y123.064 E.01348
G1 X119.731 Y122.615 E.01507
G1 X119.731 Y108.785 E.45877
G1 X119.802 Y108.336 E.01507
G1 X119.987 Y107.974 E.01348
G1 X120.274 Y107.687 E.01348
G1 X120.636 Y107.502 E.01348
G1 X121.085 Y107.431 E.01507
G1 X134.915 Y107.431 E.45877
G1 X135.364 Y107.502 E.01507
G1 X135.726 Y107.687 E.01348
G1 X136.013 Y107.974 E.01348
G1 X136.198 Y108.336 E.01348
G1 X136.269 Y108.785 E.01507
G1 X136.269 Y122.615 E.45877
G1 X136.198 Y123.064 E.01507
G1 X136.04 Y123.372 E.01149
M204 S250
G1 X136.334 Y123.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
M204 S5000
G1 X135.959 Y124.034 E.0163
G1 X135.487 Y124.275 E.0163
G1 X134.946 Y124.361 E.01682
G1 X121.054 Y124.361 E.42686
G1 X120.514 Y124.275 E.01682
G1 X120.041 Y124.034 E.0163
G1 X119.666 Y123.659 E.0163
G1 X119.425 Y123.187 E.0163
G1 X119.339 Y122.646 E.01682
G1 X119.339 Y108.754 E.42686
G1 X119.425 Y108.214 E.01682
G1 X119.666 Y107.741 E.0163
G1 X120.041 Y107.366 E.0163
G1 X120.513 Y107.125 E.0163
G1 X121.054 Y107.039 E.01682
G1 X134.946 Y107.039 E.42686
G1 X135.453 Y107.12 E.01578
G1 X135.486 Y107.125 E.00103
G1 X135.959 Y107.366 E.0163
G1 X136.334 Y107.741 E.0163
G1 X136.575 Y108.214 E.0163
G1 X136.661 Y108.754 E.01682
G1 X136.661 Y122.646 E.42686
G1 X136.575 Y123.187 E.01682
G1 X136.362 Y123.606 E.01446
; WIPE_START
G1 F3600
M204 S6000
G1 X135.959 Y124.034 E-.22339
G1 X135.487 Y124.275 E-.20161
G1 X134.946 Y124.361 E-.20798
G1 X134.612 Y124.361 E-.12703
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


; object ids of this layer31 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.641 Y123.765 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.227266
G1 F3264
M204 S6000
G1 X134.846 Y123.698 E.00324
; LINE_WIDTH: 0.267101
G1 X135.051 Y123.632 E.00394
; LINE_WIDTH: 0.306936
G1 X135.256 Y123.565 E.00463
; LINE_WIDTH: 0.342461
G2 X135.408 Y123.464 I-.389 J-.752 E.00447
; LINE_WIDTH: 0.385865
G1 X135.498 Y123.399 E.00309
; LINE_WIDTH: 0.398324
G2 X135.764 Y123.108 I-.784 J-.986 E.01147
; LINE_WIDTH: 0.351271
G1 X135.829 Y123.019 E.00278
; LINE_WIDTH: 0.312508
G2 X135.932 Y122.751 I-.582 J-.377 E.00635
; LINE_WIDTH: 0.2671
G1 X135.998 Y122.546 E.00394
; LINE_WIDTH: 0.227273
G1 X136.065 Y122.341 E.00324
M204 S10000
G1 X136.065 Y109.059 F42000
; LINE_WIDTH: 0.227266
G1 F3264
M204 S6000
G1 X135.998 Y108.854 E.00324
; LINE_WIDTH: 0.267101
G1 X135.932 Y108.649 E.00394
; LINE_WIDTH: 0.312513
G2 X135.829 Y108.381 I-.685 J.109 E.00635
; LINE_WIDTH: 0.351265
G1 X135.764 Y108.292 E.00278
; LINE_WIDTH: 0.398324
G2 X135.498 Y108.001 I-1.051 J.695 E.01147
; LINE_WIDTH: 0.385866
G1 X135.408 Y107.936 E.00309
; LINE_WIDTH: 0.342464
G2 X135.256 Y107.835 I-.542 J.651 E.00447
; LINE_WIDTH: 0.306926
G1 X135.051 Y107.768 E.00463
; LINE_WIDTH: 0.2671
G1 X134.846 Y107.702 E.00394
; LINE_WIDTH: 0.227273
G1 X134.641 Y107.635 E.00324
M204 S10000
G1 X121.359 Y107.635 F42000
; LINE_WIDTH: 0.227261
G1 F3264
M204 S6000
G1 X121.154 Y107.702 E.00324
; LINE_WIDTH: 0.267098
G1 X120.949 Y107.768 E.00394
; LINE_WIDTH: 0.312509
G2 X120.681 Y107.871 I.109 J.685 E.00635
; LINE_WIDTH: 0.351268
G1 X120.592 Y107.936 E.00278
; LINE_WIDTH: 0.398335
G2 X120.301 Y108.202 I.695 J1.051 E.01147
; LINE_WIDTH: 0.385877
G1 X120.236 Y108.292 E.00309
; LINE_WIDTH: 0.342471
G2 X120.135 Y108.444 I.651 J.542 E.00447
; LINE_WIDTH: 0.306927
G1 X120.068 Y108.649 E.00463
; LINE_WIDTH: 0.2671
G1 X120.002 Y108.854 E.00394
; LINE_WIDTH: 0.227273
G1 X119.935 Y109.059 E.00324
M204 S10000
G1 X119.935 Y122.341 F42000
; LINE_WIDTH: 0.227266
G1 F3264
M204 S6000
G1 X120.002 Y122.546 E.00324
; LINE_WIDTH: 0.267101
G1 X120.068 Y122.751 E.00394
; LINE_WIDTH: 0.306936
G1 X120.135 Y122.956 E.00463
; LINE_WIDTH: 0.342461
G2 X120.236 Y123.108 I.752 J-.389 E.00447
; LINE_WIDTH: 0.385865
G1 X120.301 Y123.198 E.00309
; LINE_WIDTH: 0.398324
G2 X120.592 Y123.464 I.986 J-.784 E.01147
; LINE_WIDTH: 0.351271
G1 X120.681 Y123.529 E.00278
; LINE_WIDTH: 0.312508
G2 X120.949 Y123.632 I.377 J-.582 E.00635
; LINE_WIDTH: 0.2671
G1 X121.154 Y123.698 E.00394
; LINE_WIDTH: 0.227273
G1 X121.359 Y123.765 E.00324
; WIPE_START
G1 F15000
G1 X121.154 Y123.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.083 Y117.155 Z6.6 F42000
G1 X126.723 Y114.423 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
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
G1 X129.277 Y113.792 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P92 R1
G1 F3264
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09154
G1 X129.697 Y114.153 E-.1075
G1 X129.915 Y114.423 E-.13179
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F3264
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.666 J-1.516 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13184
G1 X129.494 Y117.444 E-.10742
G1 X129.277 Y117.608 E-.10346
G1 X129.277 Y117.151 E-.17387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F3264
M204 S6000
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01405
G1 X126.062 Y116.977 E.01669
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16098
G1 X126.062 Y116.977 E-.19124
G1 X126.485 Y116.977 E-.16068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.169 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
M204 S5000
G3 X126.952 Y113.223 I-.9 J2.531 E.45758
G3 X127.977 Y113.014 I1.029 J2.423 E.03237
G3 X128.835 Y113.149 I.015 J2.686 E.02682
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14842
G1 X129.486 Y113.458 E-.12592
G1 X129.75 Y113.658 E-.12579
G1 X129.988 Y113.888 E-.12586
G1 X130.195 Y114.146 E-.12581
G1 X130.345 Y114.388 E-.1082
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 32/36
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I1.021 J.663 P1  F42000
G1 X134.612 Y107.814 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3278
M204 S6000
G1 X135.145 Y108.086 E.01985
G1 X135.614 Y108.555 E.02199
G1 X135.915 Y109.145 E.02199
G1 X136.011 Y109.753 E.0204
G1 X136.011 Y121.647 E.39457
G1 X135.915 Y122.255 E.0204
G1 X135.614 Y122.845 E.02199
G1 X135.145 Y123.314 E.02199
G1 X134.555 Y123.615 E.02199
G1 X133.947 Y123.711 E.0204
G1 X122.053 Y123.711 E.39457
G1 X121.445 Y123.615 E.0204
G1 X120.855 Y123.314 E.02199
G1 X120.386 Y122.845 E.02199
G1 X120.085 Y122.255 E.02199
G1 X119.989 Y121.647 E.0204
G1 X119.989 Y109.753 E.39457
G1 X120.085 Y109.145 E.0204
G1 X120.386 Y108.555 E.02199
G1 X120.855 Y108.086 E.02199
G1 X121.445 Y107.785 E.02199
G1 X122.053 Y107.689 E.0204
G1 X133.947 Y107.689 E.39457
G1 X134.555 Y107.785 E.0204
G1 X134.559 Y107.787 E.00015
M204 S250
G1 X134.434 Y108.164 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
M204 S5000
G1 X134.912 Y108.407 E.01648
G1 X135.293 Y108.788 E.01655
G1 X135.537 Y109.268 E.01655
G1 X135.619 Y109.784 E.01604
G1 X135.619 Y121.617 E.3636
G1 X135.537 Y122.132 E.01604
G1 X135.293 Y122.612 E.01655
G1 X134.912 Y122.993 E.01655
G1 X134.432 Y123.237 E.01655
G1 X133.917 Y123.319 E.01604
G1 X122.083 Y123.319 E.3636
G1 X121.568 Y123.237 E.01604
G1 X121.088 Y122.993 E.01655
G1 X120.707 Y122.612 E.01655
G1 X120.463 Y122.132 E.01655
G1 X120.381 Y121.617 E.01604
G1 X120.381 Y109.784 E.3636
G1 X120.463 Y109.268 E.01604
G1 X120.707 Y108.788 E.01655
G1 X121.088 Y108.407 E.01655
G1 X121.568 Y108.163 E.01655
G1 X122.083 Y108.081 E.01604
G1 X133.917 Y108.081 E.3636
G1 X134.375 Y108.154 E.01427
; WIPE_START
G1 F3600
M204 S6000
G1 X134.912 Y108.407 E-.22561
G1 X135.293 Y108.788 E-.2047
G1 X135.537 Y109.268 E-.20469
G1 X135.589 Y109.593 E-.12501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.843 Y117.221 Z6.8 F42000
G1 X136.052 Y123.461 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3278
M204 S6000
G1 X135.761 Y123.752 E.01365
G1 X135.394 Y123.939 E.01365
G1 X134.94 Y124.01 E.01525
G1 X121.06 Y124.01 E.46043
G1 X120.606 Y123.939 E.01525
G1 X120.239 Y123.752 E.01365
G1 X119.948 Y123.461 E.01365
G1 X119.761 Y123.094 E.01365
G1 X119.69 Y122.64 E.01525
G1 X119.69 Y108.76 E.46043
G1 X119.761 Y108.306 E.01525
G1 X119.948 Y107.939 E.01365
G1 X120.239 Y107.648 E.01365
G1 X120.606 Y107.461 E.01365
G1 X121.06 Y107.39 E.01525
G1 X134.94 Y107.39 E.46043
G1 X135.394 Y107.461 E.01524
G1 X135.761 Y107.648 E.01365
G1 X136.052 Y107.939 E.01365
G1 X136.239 Y108.306 E.01365
G1 X136.31 Y108.76 E.01525
G1 X136.31 Y122.64 E.46043
G1 X136.239 Y123.094 E.01525
G1 X136.079 Y123.407 E.01166
M204 S250
G1 X136.373 Y123.694 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
M204 S5000
G1 X135.994 Y124.073 E.01646
G1 X135.517 Y124.316 E.01646
G1 X134.971 Y124.403 E.01698
G1 X121.029 Y124.403 E.42839
G1 X120.483 Y124.316 E.01698
G1 X120.006 Y124.073 E.01646
G1 X119.627 Y123.694 E.01646
G1 X119.384 Y123.217 E.01646
G1 X119.297 Y122.671 E.01698
G1 X119.297 Y108.729 E.42839
G1 X119.384 Y108.183 E.01698
G1 X119.627 Y107.706 E.01646
G1 X120.006 Y107.327 E.01646
G1 X120.483 Y107.084 E.01646
G1 X121.029 Y106.998 E.01698
G1 X134.971 Y106.998 E.42839
G1 X135.495 Y107.081 E.01632
G1 X135.517 Y107.084 E.00066
G1 X135.994 Y107.327 E.01646
G1 X136.373 Y107.706 E.01646
G1 X136.616 Y108.183 E.01646
G1 X136.703 Y108.729 E.01698
G1 X136.703 Y122.671 E.42839
G1 X136.616 Y123.217 E.01698
G1 X136.4 Y123.641 E.01462
; WIPE_START
G1 F3600
M204 S6000
G1 X135.994 Y124.073 E-.22537
G1 X135.517 Y124.316 E-.20358
G1 X134.971 Y124.403 E-.20998
G1 X134.652 Y124.403 E-.12107
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


; object ids of this layer32 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.716 Y123.802 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20352
G1 F3278
M204 S6000
G1 X134.907 Y123.74 E.00263
; LINE_WIDTH: 0.24418
G1 X135.098 Y123.678 E.00329
; LINE_WIDTH: 0.284839
G1 X135.289 Y123.616 E.00396
; LINE_WIDTH: 0.319432
G2 X135.45 Y123.511 I-.362 J-.732 E.00434
; LINE_WIDTH: 0.363288
G1 X135.539 Y123.447 E.00287
; LINE_WIDTH: 0.37579
G2 X135.811 Y123.15 I-.799 J-1.007 E.01096
; LINE_WIDTH: 0.328941
G1 X135.876 Y123.062 E.00256
; LINE_WIDTH: 0.29127
G2 X135.978 Y122.798 I-.614 J-.391 E.00575
; LINE_WIDTH: 0.244187
G1 X136.04 Y122.607 E.00329
; LINE_WIDTH: 0.203529
G1 X136.102 Y122.416 E.00263
M204 S10000
G1 X136.102 Y108.984 F42000
; LINE_WIDTH: 0.203516
G1 F3278
M204 S6000
G1 X136.04 Y108.793 E.00263
; LINE_WIDTH: 0.244185
G1 X135.978 Y108.602 E.00329
; LINE_WIDTH: 0.291275
G2 X135.876 Y108.338 I-.717 J.128 E.00575
; LINE_WIDTH: 0.328937
G1 X135.811 Y108.25 E.00256
; LINE_WIDTH: 0.375786
G2 X135.539 Y107.953 I-1.072 J.711 E.01096
; LINE_WIDTH: 0.363283
G1 X135.45 Y107.889 E.00287
; LINE_WIDTH: 0.319423
G2 X135.289 Y107.784 I-.524 J.627 E.00434
; LINE_WIDTH: 0.284853
G1 X135.098 Y107.722 E.00396
; LINE_WIDTH: 0.244192
G1 X134.907 Y107.66 E.00329
; LINE_WIDTH: 0.203531
G1 X134.716 Y107.598 E.00263
M204 S10000
G1 X121.284 Y107.598 F42000
; LINE_WIDTH: 0.20352
G1 F3278
M204 S6000
G1 X121.093 Y107.66 E.00263
; LINE_WIDTH: 0.24418
G1 X120.902 Y107.722 E.00329
; LINE_WIDTH: 0.291263
G2 X120.638 Y107.824 I.127 J.716 E.00575
; LINE_WIDTH: 0.328938
G1 X120.55 Y107.889 E.00256
; LINE_WIDTH: 0.375788
G2 X120.253 Y108.161 I.711 J1.072 E.01096
; LINE_WIDTH: 0.363283
G1 X120.189 Y108.25 E.00287
; LINE_WIDTH: 0.319431
G2 X120.084 Y108.411 I.626 J.523 E.00434
; LINE_WIDTH: 0.284842
G1 X120.022 Y108.602 E.00396
; LINE_WIDTH: 0.244177
G1 X119.96 Y108.793 E.00329
; LINE_WIDTH: 0.203513
G1 X119.898 Y108.984 E.00263
M204 S10000
G1 X119.898 Y122.416 F42000
; LINE_WIDTH: 0.20352
G1 F3278
M204 S6000
G1 X119.96 Y122.607 E.00263
; LINE_WIDTH: 0.24418
G1 X120.022 Y122.798 E.00329
; LINE_WIDTH: 0.284839
G1 X120.084 Y122.989 E.00396
; LINE_WIDTH: 0.319432
G2 X120.189 Y123.15 I.732 J-.362 E.00434
; LINE_WIDTH: 0.363288
G1 X120.253 Y123.239 E.00287
; LINE_WIDTH: 0.37579
G2 X120.55 Y123.511 I1.007 J-.799 E.01096
; LINE_WIDTH: 0.328941
G1 X120.638 Y123.576 E.00256
; LINE_WIDTH: 0.29127
G2 X120.902 Y123.678 I.391 J-.614 E.00575
; LINE_WIDTH: 0.244187
G1 X121.093 Y123.74 E.00329
; LINE_WIDTH: 0.203529
G1 X121.284 Y123.802 E.00263
; WIPE_START
G1 F15000
G1 X121.093 Y123.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.04 Y117.208 Z6.8 F42000
G1 X126.723 Y114.423 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3278
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.944 J2.344 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
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
G1 X129.277 Y113.792 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3278
M204 S6000
M73 P93 R1
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.93 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09157
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13185
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F3278
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G1 X129.51 Y117.429 E.00864
G3 X129.277 Y117.608 I-.841 J-.851 E.00979
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24342
G1 X129.697 Y117.247 E-.13183
G1 X129.51 Y117.429 E-.09895
G1 X129.277 Y117.608 E-.1119
G1 X129.277 Y117.151 E-.17389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F3278
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.991 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y113.167 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
M204 S5000
G3 X129.783 Y117.71 I-.896 J2.535 E.17138
G3 X127.964 Y113.013 I-1.783 J-2.01 E.3182
G3 X128.836 Y113.147 I.033 J2.688 E.02724
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14849
G1 X129.486 Y113.458 E-.12586
G1 X129.75 Y113.658 E-.12581
G1 X129.988 Y113.888 E-.12582
G1 X130.22 Y114.186 E-.14344
G1 X130.345 Y114.388 E-.09058
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 33/36
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I1.02 J.663 P1  F42000
G1 X134.656 Y107.756 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3292
M204 S6000
G1 X135.196 Y108.031 E.02009
G1 X135.669 Y108.504 E.02218
G1 X135.972 Y109.1 E.02218
G1 X136.069 Y109.713 E.02059
G1 X136.069 Y121.687 E.39722
M73 P93 R0
G1 X135.972 Y122.3 E.02059
G1 X135.669 Y122.896 E.02218
G1 X135.196 Y123.369 E.02218
G1 X134.6 Y123.672 E.02218
G1 X133.987 Y123.769 E.02059
G1 X122.013 Y123.769 E.39722
G1 X121.4 Y123.672 E.02059
G1 X120.804 Y123.369 E.02218
G1 X120.331 Y122.896 E.02218
G1 X120.028 Y122.3 E.02218
G1 X119.931 Y121.687 E.02059
G1 X119.931 Y109.713 E.39722
G1 X120.028 Y109.1 E.02059
G1 X120.331 Y108.504 E.02218
G1 X120.804 Y108.031 E.02218
G1 X121.4 Y107.728 E.02218
G1 X122.013 Y107.631 E.02058
G1 X133.987 Y107.631 E.39722
G1 X134.6 Y107.728 E.02059
G1 X134.603 Y107.729 E.00009
M204 S250
G1 X134.478 Y108.106 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3292
M204 S5000
G1 X134.963 Y108.352 E.0167
G1 X135.348 Y108.737 E.01673
G1 X135.595 Y109.222 E.01673
G1 X135.677 Y109.744 E.01621
G1 X135.677 Y121.657 E.36605
G1 X135.595 Y122.178 E.01621
G1 X135.348 Y122.663 E.01673
G1 X134.963 Y123.048 E.01673
G1 X134.478 Y123.295 E.01673
G1 X133.957 Y123.377 E.01621
G1 X122.043 Y123.377 E.36605
G1 X121.522 Y123.295 E.01621
G1 X121.037 Y123.048 E.01673
G1 X120.652 Y122.663 E.01673
G1 X120.405 Y122.178 E.01673
G1 X120.323 Y121.657 E.01621
G1 X120.323 Y109.744 E.36605
G1 X120.405 Y109.222 E.01621
G1 X120.652 Y108.737 E.01673
G1 X121.037 Y108.352 E.01673
G1 X121.522 Y108.105 E.01673
G1 X122.043 Y108.023 E.01621
G1 X133.957 Y108.023 E.36605
G1 X134.419 Y108.096 E.01439
; WIPE_START
G1 F3600
M204 S6000
G1 X134.963 Y108.352 E-.22836
G1 X135.348 Y108.737 E-.20686
G1 X135.595 Y109.222 E-.20685
G1 X135.643 Y109.529 E-.11793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.887 Y117.157 Z7 F42000
G1 X136.09 Y123.496 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3292
M204 S6000
G1 X135.795 Y123.79 E.01382
G1 X135.424 Y123.979 E.01382
G1 X134.965 Y124.052 E.01542
G1 X121.035 Y124.052 E.46209
G1 X120.576 Y123.979 E.01542
G1 X120.205 Y123.79 E.01383
G1 X119.91 Y123.496 E.01382
G1 X119.721 Y123.124 E.01382
G1 X119.648 Y122.665 E.01542
G1 X119.648 Y108.735 E.46209
G1 X119.721 Y108.276 E.01542
G1 X119.91 Y107.905 E.01383
G1 X120.204 Y107.61 E.01382
G1 X120.576 Y107.421 E.01382
G1 X121.035 Y107.348 E.01542
G1 X134.965 Y107.348 E.46209
G1 X135.424 Y107.421 E.01542
G1 X135.795 Y107.61 E.01383
G1 X136.09 Y107.905 E.01382
G1 X136.279 Y108.276 E.01382
G1 X136.352 Y108.735 E.01542
G1 X136.352 Y122.665 E.46209
G1 X136.279 Y123.124 E.01542
G1 X136.117 Y123.442 E.01184
M204 S250
G1 X136.411 Y123.729 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3292
M204 S5000
G1 X136.029 Y124.111 E.01662
G1 X135.547 Y124.357 E.01662
G1 X134.996 Y124.444 E.01714
G1 X121.004 Y124.444 E.42993
G1 X120.453 Y124.357 E.01714
G1 X119.971 Y124.111 E.01662
G1 X119.589 Y123.729 E.01662
G1 X119.343 Y123.247 E.01662
G1 X119.256 Y122.696 E.01714
G1 X119.256 Y108.704 E.42993
G1 X119.343 Y108.153 E.01714
G1 X119.589 Y107.671 E.01662
G1 X119.971 Y107.289 E.01662
G1 X120.453 Y107.043 E.01662
G1 X121.004 Y106.956 E.01714
G1 X134.996 Y106.956 E.42993
G1 X135.538 Y107.042 E.01685
G1 X136.029 Y107.289 E.0169
G1 X136.411 Y107.671 E.01662
G1 X136.657 Y108.153 E.01662
G1 X136.744 Y108.704 E.01714
G1 X136.744 Y122.696 E.42993
G1 X136.657 Y123.247 E.01714
G1 X136.439 Y123.675 E.01478
; WIPE_START
G1 F3600
M204 S6000
G1 X136.029 Y124.111 E-.22735
G1 X135.547 Y124.357 E-.20556
G1 X134.996 Y124.444 E-.21196
G1 X134.693 Y124.444 E-.11513
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


; object ids of this layer33 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.792 Y123.84 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.179763
G1 F3292
M204 S6000
G1 X134.969 Y123.783 E.00208
; LINE_WIDTH: 0.221268
G1 X135.146 Y123.725 E.00271
; LINE_WIDTH: 0.262772
G1 X135.323 Y123.668 E.00333
; LINE_WIDTH: 0.296537
G2 X135.493 Y123.559 I-.349 J-.73 E.00418
; LINE_WIDTH: 0.340703
G1 X135.581 Y123.495 E.00265
; LINE_WIDTH: 0.353229
G2 X135.859 Y123.193 I-.814 J-1.028 E.01042
; LINE_WIDTH: 0.306587
G1 X135.923 Y123.104 E.00234
; LINE_WIDTH: 0.27008
G2 X136.025 Y122.846 I-.648 J-.406 E.00518
; LINE_WIDTH: 0.221256
G1 X136.083 Y122.669 E.0027
; LINE_WIDTH: 0.179766
G1 X136.14 Y122.492 E.00208
M204 S10000
G1 X136.14 Y108.908 F42000
; LINE_WIDTH: 0.17976
G1 F3292
M204 S6000
G1 X136.083 Y108.731 E.00208
; LINE_WIDTH: 0.221258
G1 X136.025 Y108.554 E.00271
; LINE_WIDTH: 0.27009
G2 X135.923 Y108.296 I-.75 J.148 E.00518
; LINE_WIDTH: 0.306597
G1 X135.859 Y108.208 E.00234
; LINE_WIDTH: 0.353236
G2 X135.581 Y107.905 I-1.092 J.726 E.01042
; LINE_WIDTH: 0.340692
G1 X135.493 Y107.841 E.00265
; LINE_WIDTH: 0.296512
G2 X135.323 Y107.732 I-.519 J.621 E.00418
; LINE_WIDTH: 0.262753
G1 X135.146 Y107.675 E.00333
; LINE_WIDTH: 0.22126
G1 X134.969 Y107.617 E.0027
; LINE_WIDTH: 0.179767
G1 X134.792 Y107.56 E.00208
M204 S10000
G1 X121.208 Y107.56 F42000
; LINE_WIDTH: 0.17978
G1 F3292
M204 S6000
G1 X121.031 Y107.617 E.00208
; LINE_WIDTH: 0.221278
G1 X120.854 Y107.675 E.00271
; LINE_WIDTH: 0.270102
G2 X120.596 Y107.777 I.147 J.75 E.00518
; LINE_WIDTH: 0.306598
G1 X120.507 Y107.841 E.00234
; LINE_WIDTH: 0.353234
G2 X120.205 Y108.119 I.726 J1.093 E.01042
; LINE_WIDTH: 0.340697
G1 X120.141 Y108.208 E.00265
; LINE_WIDTH: 0.296519
G2 X120.032 Y108.377 I.621 J.518 E.00418
; LINE_WIDTH: 0.262746
G1 X119.975 Y108.554 E.00333
; LINE_WIDTH: 0.221256
G1 X119.917 Y108.731 E.0027
; LINE_WIDTH: 0.179766
G1 X119.86 Y108.908 E.00208
M204 S10000
G1 X119.86 Y122.492 F42000
; LINE_WIDTH: 0.179763
G1 F3292
M204 S6000
G1 X119.917 Y122.669 E.00208
; LINE_WIDTH: 0.221268
G1 X119.975 Y122.846 E.00271
; LINE_WIDTH: 0.262772
G1 X120.032 Y123.023 E.00333
; LINE_WIDTH: 0.296537
G2 X120.141 Y123.193 I.73 J-.349 E.00418
; LINE_WIDTH: 0.340703
G1 X120.206 Y123.281 E.00265
; LINE_WIDTH: 0.353229
G2 X120.507 Y123.559 I1.028 J-.814 E.01042
; LINE_WIDTH: 0.306587
G1 X120.596 Y123.623 E.00234
; LINE_WIDTH: 0.27008
G2 X120.854 Y123.725 I.406 J-.648 E.00518
; LINE_WIDTH: 0.221256
G1 X121.031 Y123.783 E.0027
; LINE_WIDTH: 0.179766
G1 X121.208 Y123.84 E.00208
; WIPE_START
G1 F15000
G1 X121.031 Y123.783 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.997 Y117.261 Z7 F42000
G1 X126.723 Y114.423 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3292
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.947 J2.346 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3292
M204 S5000
G1 X127.115 Y113.365 E.04455
G1 X128.885 Y113.365 E.05439
G1 X128.885 Y114.815 E.04455
G1 X130.335 Y114.815 E.04455
G1 X130.335 Y116.585 E.05439
G1 X128.885 Y116.585 E.04455
G1 X128.885 Y118.035 E.04455
G1 X127.115 Y118.035 E.05439
M73 P94 R0
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
G1 X129.277 Y113.792 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3292
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.674 J1.93 E.0209
G1 X129.277 Y114.423 E.02115
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.1074
G1 X129.915 Y114.423 E-.13186
G1 X129.277 Y114.423 E-.24234
G1 X129.277 Y113.931 E-.18686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F3292
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.0115
G3 X129.277 Y117.608 I-1.668 J-1.517 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13179
G1 X129.494 Y117.444 E-.10751
G1 X129.277 Y117.608 E-.10344
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F3292
M204 S6000
G1 X126.723 Y117.625 E.02148
G1 X126.401 Y117.349 E.01406
G1 X126.062 Y116.977 E.01669
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16108
G1 X126.062 Y116.977 E-.19115
G1 X126.485 Y116.977 E-.16066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3292
M204 S5000
G3 X127.264 Y113.113 I-.9 J2.531 E.46774
G3 X127.95 Y113.013 I.83 J3.28 E.02136
G3 X128.836 Y113.148 I.042 J2.686 E.02765
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14846
G1 X129.486 Y113.458 E-.12584
G1 X129.75 Y113.658 E-.12587
G1 X129.988 Y113.888 E-.12579
G1 X130.213 Y114.174 E-.13845
G1 X130.345 Y114.388 E-.09559
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 34/36
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z7 I1.03 J.648 P1  F42000
G1 X134.581 Y107.66 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
M204 S6000
G1 X134.646 Y107.67 E.00218
G1 X135.247 Y107.977 E.02236
G1 X135.723 Y108.453 E.02237
G1 X136.03 Y109.054 E.02236
G1 X136.128 Y109.673 E.02078
G1 X136.128 Y121.727 E.39988
G1 X136.03 Y122.346 E.02078
G1 X135.723 Y122.947 E.02236
G1 X135.247 Y123.423 E.02237
G1 X134.646 Y123.73 E.02236
G1 X134.027 Y123.828 E.02078
G1 X121.973 Y123.828 E.39988
G1 X121.354 Y123.73 E.02078
G1 X120.753 Y123.423 E.02236
G1 X120.277 Y122.947 E.02237
G1 X119.97 Y122.346 E.02236
G1 X119.872 Y121.727 E.02078
G1 X119.872 Y109.673 E.39988
G1 X119.97 Y109.054 E.02078
G1 X120.277 Y108.453 E.02236
G1 X120.753 Y107.977 E.02237
G1 X121.354 Y107.67 E.02236
G1 X121.973 Y107.572 E.02078
G1 X134.027 Y107.572 E.39988
G1 X134.522 Y107.651 E.01661
M204 S250
G1 X134.52 Y108.047 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
M204 S5000
G1 X134.523 Y108.048 E.00011
G1 X135.013 Y108.298 E.0169
G1 X135.402 Y108.687 E.0169
G1 X135.652 Y109.177 E.0169
G1 X135.735 Y109.704 E.01639
G1 X135.735 Y121.697 E.36851
G1 X135.652 Y122.223 E.01639
G1 X135.402 Y122.713 E.0169
G1 X135.013 Y123.102 E.0169
G1 X134.523 Y123.352 E.0169
G1 X133.997 Y123.435 E.01639
G1 X122.003 Y123.435 E.36851
G1 X121.477 Y123.352 E.01639
G1 X120.987 Y123.102 E.0169
G1 X120.598 Y122.713 E.0169
G1 X120.348 Y122.223 E.0169
G1 X120.265 Y121.697 E.01639
G1 X120.265 Y109.703 E.36851
G1 X120.348 Y109.177 E.01639
G1 X120.598 Y108.687 E.0169
G1 X120.987 Y108.298 E.0169
G1 X121.477 Y108.048 E.0169
G1 X122.003 Y107.965 E.01639
G1 X133.997 Y107.965 E.36851
G1 X134.461 Y108.038 E.01443
; WIPE_START
G1 F3600
M204 S6000
G1 X134.523 Y108.048 E-.02415
G1 X135.013 Y108.298 E-.209
G1 X135.402 Y108.687 E-.20902
G1 X135.652 Y109.177 E-.20901
G1 X135.697 Y109.46 E-.10881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.931 Y117.088 Z7.2 F42000
G1 X136.129 Y123.53 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
M204 S6000
G1 X135.83 Y123.829 E.014
G1 X135.454 Y124.02 E.014
G1 X134.99 Y124.094 E.01559
G1 X121.01 Y124.094 E.46375
G1 X120.546 Y124.02 E.01559
G1 X120.17 Y123.829 E.014
G1 X119.871 Y123.53 E.014
G1 X119.68 Y123.154 E.014
G1 X119.606 Y122.69 E.01559
G1 X119.606 Y108.71 E.46375
G1 X119.68 Y108.246 E.01559
G1 X119.871 Y107.87 E.014
G1 X120.17 Y107.571 E.014
G1 X120.546 Y107.38 E.014
G1 X121.01 Y107.306 E.01559
G1 X134.99 Y107.306 E.46375
G1 X135.454 Y107.38 E.01559
G1 X135.83 Y107.571 E.014
G1 X136.129 Y107.87 E.014
G1 X136.32 Y108.246 E.014
G1 X136.394 Y108.71 E.01559
G1 X136.394 Y122.69 E.46375
G1 X136.32 Y123.154 E.01559
G1 X136.156 Y123.477 E.01201
M204 S250
G1 X136.451 Y123.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
M204 S5000
G1 X136.45 Y123.764 E.00009
G1 X136.064 Y124.15 E.01678
G1 X135.577 Y124.398 E.01678
G1 X135.021 Y124.486 E.0173
G1 X120.979 Y124.486 E.43147
G1 X120.423 Y124.398 E.0173
G1 X119.936 Y124.15 E.01678
G1 X119.55 Y123.764 E.01678
G1 X119.302 Y123.277 E.01678
G1 X119.214 Y122.721 E.0173
G1 X119.214 Y108.679 E.43147
G1 X119.302 Y108.123 E.0173
G1 X119.55 Y107.636 E.01678
G1 X119.936 Y107.25 E.01678
G1 X120.423 Y107.002 E.01678
G1 X120.979 Y106.914 E.0173
G1 X135.021 Y106.914 E.43147
G1 X135.577 Y107.002 E.0173
G1 X136.064 Y107.25 E.01678
G1 X136.45 Y107.636 E.01678
G1 X136.698 Y108.123 E.01678
G1 X136.786 Y108.679 E.0173
G1 X136.786 Y122.721 E.43147
G1 X136.698 Y123.277 E.0173
G1 X136.478 Y123.708 E.01485
; WIPE_START
G1 F3600
M204 S6000
G1 X136.45 Y123.764 E-.02388
G1 X136.064 Y124.15 E-.20754
G1 X135.577 Y124.398 E-.20754
G1 X135.021 Y124.486 E-.21393
G1 X134.739 Y124.486 E-.10711
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


; object ids of this layer34 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.867 Y123.878 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.156008
G1 F3305
M204 S6000
G1 X135.03 Y123.825 E.00158
; LINE_WIDTH: 0.198333
G1 X135.193 Y123.772 E.00217
; LINE_WIDTH: 0.240659
G1 X135.356 Y123.719 E.00276
; LINE_WIDTH: 0.273746
G2 X135.535 Y123.606 I-.342 J-.737 E.00398
; LINE_WIDTH: 0.3181
G1 X135.622 Y123.542 E.00243
; LINE_WIDTH: 0.330668
G2 X135.906 Y123.235 I-.829 J-1.049 E.00985
; LINE_WIDTH: 0.284244
G1 X135.97 Y123.147 E.00213
; LINE_WIDTH: 0.248963
G2 X136.072 Y122.893 I-.685 J-.424 E.00462
; LINE_WIDTH: 0.198328
G1 X136.125 Y122.73 E.00217
; LINE_WIDTH: 0.156004
G1 X136.178 Y122.567 E.00158
M204 S10000
G1 X136.178 Y108.833 F42000
; LINE_WIDTH: 0.156022
G1 F3305
M204 S6000
G1 X136.125 Y108.67 E.00158
; LINE_WIDTH: 0.198341
G1 X136.072 Y108.507 E.00217
; LINE_WIDTH: 0.248971
G2 X135.969 Y108.253 I-.787 J.17 E.00462
; LINE_WIDTH: 0.284235
G1 X135.906 Y108.165 E.00213
; LINE_WIDTH: 0.330665
G2 X135.622 Y107.858 I-1.112 J.741 E.00985
; LINE_WIDTH: 0.318099
G1 X135.535 Y107.794 E.00243
; LINE_WIDTH: 0.273735
G2 X135.356 Y107.681 I-.52 J.624 E.00398
; LINE_WIDTH: 0.240653
G1 X135.193 Y107.628 E.00276
; LINE_WIDTH: 0.198328
G1 X135.03 Y107.575 E.00217
; LINE_WIDTH: 0.156004
G1 X134.867 Y107.522 E.00158
M204 S10000
G1 X121.133 Y107.522 F42000
; LINE_WIDTH: 0.156008
G1 F3305
M204 S6000
G1 X120.97 Y107.575 E.00158
; LINE_WIDTH: 0.198333
G1 X120.807 Y107.628 E.00217
; LINE_WIDTH: 0.248971
G2 X120.553 Y107.731 I.17 J.788 E.00462
; LINE_WIDTH: 0.284252
G1 X120.465 Y107.794 E.00213
; LINE_WIDTH: 0.330669
G2 X120.158 Y108.078 I.741 J1.112 E.00985
; LINE_WIDTH: 0.318099
G1 X120.094 Y108.165 E.00243
; LINE_WIDTH: 0.273735
G2 X119.981 Y108.344 I.624 J.52 E.00398
; LINE_WIDTH: 0.240653
G1 X119.928 Y108.507 E.00276
; LINE_WIDTH: 0.198328
G1 X119.875 Y108.67 E.00217
; LINE_WIDTH: 0.156004
G1 X119.822 Y108.833 E.00158
M204 S10000
G1 X119.822 Y122.567 F42000
; LINE_WIDTH: 0.156008
G1 F3305
M204 S6000
G1 X119.875 Y122.73 E.00158
; LINE_WIDTH: 0.198333
G1 X119.928 Y122.893 E.00217
; LINE_WIDTH: 0.240659
G1 X119.981 Y123.056 E.00276
; LINE_WIDTH: 0.273746
G2 X120.094 Y123.235 I.737 J-.342 E.00398
; LINE_WIDTH: 0.3181
G1 X120.158 Y123.322 E.00243
; LINE_WIDTH: 0.330668
G2 X120.465 Y123.606 I1.049 J-.829 E.00985
; LINE_WIDTH: 0.284244
G1 X120.553 Y123.67 E.00213
; LINE_WIDTH: 0.248963
M73 P95 R0
G2 X120.807 Y123.772 I.424 J-.685 E.00462
; LINE_WIDTH: 0.198328
G1 X120.97 Y123.825 E.00217
; LINE_WIDTH: 0.156004
G1 X121.133 Y123.878 E.00158
; WIPE_START
G1 F15000
G1 X120.97 Y123.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.954 Y117.315 Z7.2 F42000
G1 X126.723 Y114.423 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.775 I2.946 J2.345 E.03077
G1 X126.723 Y114.363 E.01949
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
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
G1 X129.277 Y113.792 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.675 J1.931 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09156
G1 X129.697 Y114.153 E-.10742
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24235
G1 X129.277 Y113.931 E-.18683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F3305
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.667 J-1.516 E.01842
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24343
G1 X129.697 Y117.247 E-.13182
G1 X129.494 Y117.444 E-.10749
G1 X129.277 Y117.608 E-.10344
G1 X129.277 Y117.151 E-.17383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F3305
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.284 J-2.992 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24711
G1 X126.401 Y117.349 E-.16101
G1 X126.062 Y116.977 E-.19121
G1 X126.485 Y116.977 E-.16068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y113.168 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
M204 S5000
G3 X127.587 Y113.042 I-.901 J2.531 E.47809
G3 X127.937 Y113.012 I.296 J1.397 E.01082
G3 X128.836 Y113.148 I.054 J2.687 E.02806
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.199 Y113.292 E-.14852
G1 X129.486 Y113.458 E-.1258
G1 X129.75 Y113.658 E-.12584
G1 X129.988 Y113.888 E-.12584
G1 X130.206 Y114.163 E-.13342
G1 X130.345 Y114.388 E-.10058
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 35/36
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I1.03 J.649 P1  F42000
G1 X134.62 Y107.602 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3319
M204 S6000
G1 X134.692 Y107.613 E.00241
G1 X135.297 Y107.922 E.02256
G1 X135.778 Y108.403 E.02255
G1 X136.087 Y109.008 E.02255
G1 X136.186 Y109.633 E.02096
G1 X136.186 Y121.767 E.40253
G1 X136.087 Y122.392 E.02096
G1 X135.778 Y122.998 E.02256
G1 X135.297 Y123.478 E.02255
G1 X134.692 Y123.787 E.02255
G1 X134.067 Y123.886 E.02096
G1 X121.933 Y123.886 E.40253
G1 X121.308 Y123.787 E.02096
G1 X120.703 Y123.478 E.02256
G1 X120.222 Y122.997 E.02255
G1 X119.913 Y122.392 E.02255
G1 X119.814 Y121.767 E.02096
G1 X119.814 Y109.633 E.40253
G1 X119.913 Y109.008 E.02096
G1 X120.222 Y108.403 E.02256
G1 X120.703 Y107.922 E.02255
G1 X121.308 Y107.613 E.02255
G1 X121.933 Y107.514 E.02096
G1 X134.067 Y107.514 E.40253
G1 X134.56 Y107.592 E.01656
M204 S250
G1 X134.558 Y107.989 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
M204 S5000
G1 X134.569 Y107.991 E.00033
G1 X135.064 Y108.243 E.01708
G1 X135.457 Y108.636 E.01707
G1 X135.709 Y109.131 E.01708
G1 X135.794 Y109.664 E.01656
G1 X135.794 Y121.737 E.37097
G1 X135.709 Y122.269 E.01656
G1 X135.457 Y122.764 E.01708
G1 X135.064 Y123.157 E.01707
G1 X134.569 Y123.409 E.01708
G1 X134.037 Y123.494 E.01656
G1 X121.963 Y123.494 E.37097
G1 X121.431 Y123.409 E.01656
G1 X120.936 Y123.157 E.01708
G1 X120.543 Y122.764 E.01707
G1 X120.291 Y122.269 E.01708
G1 X120.206 Y121.737 E.01656
G1 X120.206 Y109.664 E.37097
G1 X120.291 Y109.131 E.01656
G1 X120.543 Y108.636 E.01708
G1 X120.936 Y108.243 E.01707
G1 X121.431 Y107.991 E.01708
G1 X121.963 Y107.906 E.01656
G1 X134.037 Y107.906 E.37097
G1 X134.499 Y107.98 E.01439
; WIPE_START
G1 F3600
M204 S6000
G1 X134.569 Y107.991 E-.02685
G1 X135.064 Y108.243 E-.21119
G1 X135.457 Y108.636 E-.21116
G1 X135.709 Y109.131 E-.21117
G1 X135.75 Y109.39 E-.09962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.975 Y117.019 Z7.4 F42000
G1 X136.167 Y123.565 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3319
M204 S6000
G1 X135.865 Y123.867 E.01417
G1 X135.484 Y124.061 E.01417
G1 X135.015 Y124.135 E.01576
G1 X120.985 Y124.135 E.46541
G1 X120.516 Y124.061 E.01576
G1 X120.135 Y123.867 E.01417
G1 X119.833 Y123.565 E.01417
G1 X119.639 Y123.184 E.01417
G1 X119.565 Y122.715 E.01576
G1 X119.565 Y108.685 E.46541
G1 X119.639 Y108.216 E.01576
G1 X119.833 Y107.835 E.01417
G1 X120.135 Y107.533 E.01417
G1 X120.516 Y107.339 E.01417
G1 X120.985 Y107.265 E.01576
G1 X135.015 Y107.265 E.46541
G1 X135.484 Y107.339 E.01576
G1 X135.865 Y107.533 E.01417
G1 X136.167 Y107.835 E.01417
G1 X136.361 Y108.216 E.01417
G1 X136.435 Y108.685 E.01576
G1 X136.435 Y122.715 E.46541
G1 X136.361 Y123.184 E.01576
G1 X136.194 Y123.512 E.01218
M204 S250
G1 X136.491 Y123.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
M204 S5000
G1 X136.488 Y123.798 E.00017
G1 X136.098 Y124.188 E.01694
G1 X135.607 Y124.439 E.01694
G1 X135.046 Y124.528 E.01746
G1 X120.954 Y124.528 E.433
G1 X120.393 Y124.439 E.01746
G1 X119.902 Y124.188 E.01694
G1 X119.512 Y123.798 E.01694
G1 X119.261 Y123.307 E.01694
G1 X119.172 Y122.746 E.01746
G1 X119.172 Y108.654 E.433
G1 X119.261 Y108.093 E.01746
G1 X119.512 Y107.602 E.01694
G1 X119.902 Y107.212 E.01694
G1 X120.393 Y106.961 E.01694
G1 X120.954 Y106.873 E.01746
G1 X135.046 Y106.873 E.433
G1 X135.607 Y106.961 E.01746
G1 X136.098 Y107.212 E.01694
G1 X136.488 Y107.602 E.01694
G1 X136.739 Y108.093 E.01694
G1 X136.828 Y108.654 E.01746
G1 X136.828 Y122.746 E.433
G1 X136.739 Y123.307 E.01746
G1 X136.518 Y123.74 E.01493
; WIPE_START
G1 F3600
M204 S6000
G1 X136.488 Y123.798 E-.02495
G1 X136.098 Y124.188 E-.20953
G1 X135.607 Y124.439 E-.20954
G1 X135.046 Y124.528 E-.2159
G1 X134.783 Y124.528 E-.10009
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


; object ids of this layer35 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X134.941 Y123.911 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103796
G1 F3319
M204 S6000
G1 X134.996 Y123.898 E.00028
; LINE_WIDTH: 0.132262
G1 X135.128 Y123.855 E.001
; LINE_WIDTH: 0.17542
G1 X135.259 Y123.813 E.00149
; LINE_WIDTH: 0.218578
G1 X135.39 Y123.77 E.00197
; LINE_WIDTH: 0.251078
G2 X135.577 Y123.653 I-.339 J-.75 E.00375
; LINE_WIDTH: 0.295513
G1 X135.664 Y123.59 E.00221
; LINE_WIDTH: 0.308116
G2 X135.953 Y123.277 I-.844 J-1.07 E.00925
; LINE_WIDTH: 0.261964
G1 X136.016 Y123.19 E.00192
; LINE_WIDTH: 0.228701
G2 X136.113 Y122.959 I-.692 J-.424 E.00381
; LINE_WIDTH: 0.175448
G1 X136.155 Y122.828 E.00149
; LINE_WIDTH: 0.13227
G1 X136.198 Y122.696 E.001
; LINE_WIDTH: 0.103793
G1 X136.211 Y122.641 E.00028
M204 S10000
G1 X136.211 Y108.759 F42000
; LINE_WIDTH: 0.103796
G1 F3319
M204 S6000
G1 X136.198 Y108.704 E.00028
; LINE_WIDTH: 0.132262
G1 X136.155 Y108.572 E.001
; LINE_WIDTH: 0.17542
G1 X136.113 Y108.441 E.00149
; LINE_WIDTH: 0.228642
G2 X136.016 Y108.21 I-.788 J.193 E.00381
; LINE_WIDTH: 0.261911
G1 X135.953 Y108.123 E.00192
; LINE_WIDTH: 0.308105
G2 X135.664 Y107.81 I-1.133 J.757 E.00925
; LINE_WIDTH: 0.295544
G1 X135.577 Y107.747 E.00221
; LINE_WIDTH: 0.251123
G2 X135.39 Y107.63 I-.526 J.633 E.00375
; LINE_WIDTH: 0.218626
G1 X135.259 Y107.587 E.00198
; LINE_WIDTH: 0.175448
G1 X135.128 Y107.545 E.00149
; LINE_WIDTH: 0.13227
G1 X134.996 Y107.502 E.001
; LINE_WIDTH: 0.103793
G1 X134.941 Y107.489 E.00028
M204 S10000
G1 X121.059 Y107.489 F42000
; LINE_WIDTH: 0.103796
M73 P96 R0
G1 F3319
M204 S6000
G1 X121.004 Y107.502 E.00028
; LINE_WIDTH: 0.132262
G1 X120.872 Y107.545 E.001
; LINE_WIDTH: 0.17542
G1 X120.741 Y107.587 E.00149
; LINE_WIDTH: 0.228642
G2 X120.51 Y107.684 I.193 J.788 E.00381
; LINE_WIDTH: 0.261911
G1 X120.423 Y107.747 E.00192
; LINE_WIDTH: 0.308105
G2 X120.11 Y108.036 I.757 J1.133 E.00925
; LINE_WIDTH: 0.295544
G1 X120.047 Y108.123 E.00221
; LINE_WIDTH: 0.251123
G2 X119.93 Y108.31 I.633 J.526 E.00375
; LINE_WIDTH: 0.218626
G1 X119.887 Y108.441 E.00198
; LINE_WIDTH: 0.175448
G1 X119.845 Y108.573 E.00149
; LINE_WIDTH: 0.13227
G1 X119.802 Y108.704 E.001
; LINE_WIDTH: 0.103793
G1 X119.789 Y108.759 E.00028
M204 S10000
G1 X119.789 Y122.641 F42000
; LINE_WIDTH: 0.103796
G1 F3319
M204 S6000
G1 X119.802 Y122.696 E.00028
; LINE_WIDTH: 0.132262
G1 X119.845 Y122.828 E.001
; LINE_WIDTH: 0.17542
G1 X119.887 Y122.959 E.00149
; LINE_WIDTH: 0.218578
G1 X119.93 Y123.09 E.00197
; LINE_WIDTH: 0.251078
G2 X120.047 Y123.277 I.75 J-.339 E.00375
; LINE_WIDTH: 0.295513
G1 X120.11 Y123.364 E.00221
; LINE_WIDTH: 0.308116
G2 X120.423 Y123.653 I1.07 J-.844 E.00925
; LINE_WIDTH: 0.261964
G1 X120.51 Y123.716 E.00192
; LINE_WIDTH: 0.228704
G2 X120.741 Y123.813 I.424 J-.692 E.00381
; LINE_WIDTH: 0.17546
G1 X120.872 Y123.855 E.00149
; LINE_WIDTH: 0.132287
G1 X121.004 Y123.898 E.001
; LINE_WIDTH: 0.103802
G1 X121.059 Y123.911 E.00028
; WIPE_START
G1 F15000
G1 X121.004 Y123.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.948 Y117.364 Z7.4 F42000
G1 X126.723 Y114.423 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3319
M204 S6000
G1 X126.062 Y114.423 E.02192
G3 X126.723 Y113.779 I2.798 J2.211 E.03068
G1 X126.723 Y114.363 E.01936
M204 S250
G1 X127.115 Y114.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
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
G1 X129.277 Y113.792 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3319
M204 S6000
G1 X129.494 Y113.956 E.00903
G3 X129.915 Y114.423 I-1.677 J1.932 E.0209
G1 X129.277 Y114.423 E.02116
G1 X129.277 Y113.852 E.01895
; WIPE_START
G1 F6000
G1 X129.494 Y113.956 E-.09155
G1 X129.697 Y114.153 E-.10746
G1 X129.915 Y114.423 E-.13184
G1 X129.277 Y114.423 E-.24236
G1 X129.277 Y113.931 E-.18679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.277 Y116.977 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F3319
M204 S6000
G1 X129.915 Y116.977 E.02116
G1 X129.697 Y117.247 E.01151
G3 X129.277 Y117.608 I-1.669 J-1.518 E.01843
G1 X129.277 Y117.037 E.01895
; WIPE_START
G1 F6000
G1 X129.915 Y116.977 E-.24341
G1 X129.697 Y117.247 E-.1318
G1 X129.494 Y117.444 E-.10745
G1 X129.277 Y117.608 E-.10349
G1 X129.277 Y117.151 E-.17385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.723 Y116.977 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F3319
M204 S6000
G1 X126.723 Y117.625 E.02148
G3 X126.062 Y116.977 I2.285 J-2.992 E.03077
G1 X126.663 Y116.977 E.01993
; WIPE_START
G1 F6000
G1 X126.723 Y117.625 E-.24712
G1 X126.401 Y117.349 E-.16104
G1 X126.062 Y116.977 E-.19118
G1 X126.485 Y116.977 E-.16065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.894 Y113.163 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
M204 S5000
G3 X127.587 Y113.042 I-.894 J2.534 E.47802
G3 X128.248 Y113.022 I.418 J2.811 E.02038
G3 X128.837 Y113.144 I-.248 J2.676 E.01852
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3600
M204 S6000
G1 X129.198 Y113.292 E-.14827
G1 X129.501 Y113.469 E-.13332
G1 X129.75 Y113.658 E-.11856
G1 X129.988 Y113.888 E-.12584
G1 X130.195 Y114.146 E-.12583
G1 X130.345 Y114.388 E-.10818
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 36/36
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I1.017 J.669 P1  F42000
G1 X134.595 Y107.93 Z7.4
G1 Z7.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X134.615 Y107.933 E.0006
G1 X135.115 Y108.188 E.01725
G1 X135.512 Y108.585 E.01725
G1 X135.767 Y109.085 E.01725
G1 X135.852 Y109.623 E.01674
G1 X135.852 Y121.777 E.37343
G1 X135.767 Y122.315 E.01674
G1 X135.512 Y122.815 E.01725
G1 X135.115 Y123.212 E.01725
G1 X134.615 Y123.467 E.01725
G1 X134.077 Y123.552 E.01674
G1 X121.923 Y123.552 E.37343
G1 X121.385 Y123.467 E.01674
G1 X120.885 Y123.212 E.01725
G1 X120.488 Y122.815 E.01725
G1 X120.233 Y122.315 E.01725
G1 X120.148 Y121.777 E.01674
G1 X120.148 Y109.624 E.37343
G1 X120.233 Y109.086 E.01674
G1 X120.488 Y108.585 E.01725
G1 X120.885 Y108.188 E.01725
G1 X121.385 Y107.933 E.01725
G1 X121.923 Y107.848 E.01674
G1 X134.077 Y107.848 E.37343
G1 X134.536 Y107.921 E.01429
; WIPE_START
M204 S6000
G1 X134.615 Y107.933 E-.03023
G1 X135.115 Y108.188 E-.21335
G1 X135.512 Y108.585 E-.21334
G1 X135.767 Y109.085 E-.21333
G1 X135.804 Y109.319 E-.08976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.186 Y116.942 Z7.6 F42000
G1 X136.531 Y123.825 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X136.527 Y123.833 E.00028
G1 X136.133 Y124.227 E.0171
G1 X135.637 Y124.479 E.0171
G1 X135.071 Y124.569 E.01762
G1 X120.929 Y124.569 E.43454
G1 X120.363 Y124.48 E.01762
G1 X119.867 Y124.227 E.0171
G1 X119.473 Y123.833 E.0171
G1 X119.221 Y123.337 E.0171
G1 X119.131 Y122.771 E.01762
G1 X119.131 Y108.629 E.43454
G1 X119.221 Y108.063 E.01762
G1 X119.473 Y107.567 E.0171
G1 X119.867 Y107.173 E.0171
G1 X120.363 Y106.921 E.0171
G1 X120.929 Y106.831 E.01762
G1 X135.071 Y106.831 E.43454
G1 X135.632 Y106.92 E.01744
G1 X136.133 Y107.173 E.01728
G1 X136.527 Y107.567 E.01709
G1 X136.779 Y108.063 E.0171
G1 X136.869 Y108.629 E.01762
G1 X136.869 Y122.771 E.43454
G1 X136.779 Y123.337 E.01762
G1 X136.558 Y123.772 E.01498
; WIPE_START
M204 S6000
G1 X136.527 Y123.833 E-.02623
G1 X136.133 Y124.227 E-.2115
G1 X135.637 Y124.479 E-.21151
G1 X135.071 Y124.569 E-.21788
G1 X134.827 Y124.569 E-.09287
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


; object ids of this layer36 end: 47
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X135.072 Y124.359 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X136.659 Y122.772 E.06897
G1 X136.662 Y122.236
G1 X134.536 Y124.362 E.09238
G1 X134.075 Y124.29
G1 X134.718 Y123.647 E.02793
; WIPE_START
M204 S6000
G1 X134.075 Y124.29 E-.34541
G1 X134.536 Y124.362 E-.1773
G1 X134.978 Y123.92 E-.23729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.947 Y122.418 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X136.59 Y121.775 E.02793
; WIPE_START
M204 S6000
G1 X135.947 Y122.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.206 Y123.398 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109832
G1 F3832
M204 S6000
G1 X135.063 Y123.502 E.00096
; LINE_WIDTH: 0.153174
G1 X134.921 Y123.605 E.00158
; LINE_WIDTH: 0.196515
G1 X134.779 Y123.708 E.0022
; WIPE_START
G1 F15000
G1 X134.921 Y123.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.62 Y123.139 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.200054
G1 F3832
M204 S6000
G1 X136.499 Y123.305 E.00263
; LINE_WIDTH: 0.249076
G1 X136.379 Y123.472 E.00345
; LINE_WIDTH: 0.314958
G1 X136.258 Y123.638 E.00455
G1 X135.938 Y123.958 E.01003
; LINE_WIDTH: 0.298104
G1 X135.772 Y124.079 E.00427
; LINE_WIDTH: 0.249086
G1 X135.605 Y124.199 E.00345
; LINE_WIDTH: 0.200068
G1 X135.439 Y124.32 E.00263
; WIPE_START
G1 F15000
G1 X135.605 Y124.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.008 Y122.479 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.196513
G1 F3832
M204 S6000
G1 X135.905 Y122.621 E.0022
; LINE_WIDTH: 0.153177
G1 X135.802 Y122.763 E.00158
; LINE_WIDTH: 0.10984
G1 X135.698 Y122.906 E.00096
; WIPE_START
G1 F15000
G1 X135.802 Y122.763 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.36 Y121.568 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.66821
G1 F3832
M204 S6000
G1 X136.36 Y109.832 E.59795
M204 S10000
G1 X136.662 Y108.905 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X136.046 Y109.521 E.02678
G1 X135.973 Y109.06
M73 P97 R0
G1 X136.624 Y108.409 E.02832
G1 X136.51 Y107.99
G1 X135.802 Y108.698 E.03076
G1 X135.593 Y108.373
G1 X136.317 Y107.65 E.03144
G1 X136.05 Y107.383
G1 X135.327 Y108.107 E.03144
G1 X135.002 Y107.898
G1 X135.709 Y107.191 E.03072
G1 X135.291 Y107.076
G1 X134.639 Y107.727 E.02832
G1 X134.179 Y107.654
G1 X134.795 Y107.038 E.02678
M204 S10000
G1 X133.868 Y107.34 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.66821
G1 F3832
M204 S6000
G1 X122.132 Y107.34 E.59795
; WIPE_START
G1 F5757.329
G1 X124.132 Y107.34 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.639 Y109.832 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3832
M204 S6000
G1 X119.639 Y121.568 E.59795
; WIPE_START
G1 F5757.329
G1 X119.639 Y119.568 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.205 Y124.362 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X121.821 Y123.746 E.02678
G1 X121.36 Y123.673
G1 X120.709 Y124.324 E.02832
G1 X120.29 Y124.21
G1 X120.998 Y123.502 E.03076
G1 X120.673 Y123.293
G1 X119.95 Y124.017 E.03144
G1 X119.683 Y123.75
G1 X120.407 Y123.027 E.03144
G1 X120.198 Y122.702
G1 X119.49 Y123.41 E.03076
G1 X119.376 Y122.991
G1 X120.027 Y122.339 E.02832
G1 X119.954 Y121.879
G1 X119.338 Y122.495 E.02678
; WIPE_START
M204 S6000
G1 X119.954 Y121.879 E-.33118
G1 X120.027 Y122.339 E-.17711
G1 X119.559 Y122.808 E-.25171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.132 Y124.061 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.66821
G1 F3832
M204 S6000
G1 X133.868 Y124.061 E.59795
; WIPE_START
G1 F5757.329
G1 X131.868 Y124.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y118.282 Z7.6 F42000
G1 X119.41 Y109.625 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X120.053 Y108.982 E.02794
; WIPE_START
M204 S6000
G1 X119.41 Y109.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.282 Y107.753 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X121.925 Y107.11 E.02794
G1 X121.464 Y107.038
G1 X119.338 Y109.164 E.09237
G1 X119.341 Y108.628
G1 X120.928 Y107.041 E.06896
; WIPE_START
M204 S6000
G1 X119.514 Y108.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.302 Y108.494 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10984
G1 F3832
M204 S6000
G1 X120.198 Y108.636 E.00096
; LINE_WIDTH: 0.153177
G1 X120.095 Y108.778 E.00158
; LINE_WIDTH: 0.196513
G1 X119.992 Y108.921 E.0022
; WIPE_START
G1 F15000
G1 X120.095 Y108.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.561 Y107.08 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.199971
G1 F3832
M204 S6000
G1 X120.394 Y107.201 E.00263
; LINE_WIDTH: 0.248991
G1 X120.228 Y107.321 E.00345
; LINE_WIDTH: 0.314869
G1 X120.062 Y107.442 E.00455
G1 X119.742 Y107.762 E.01003
; LINE_WIDTH: 0.298001
G1 X119.621 Y107.928 E.00427
; LINE_WIDTH: 0.248982
G1 X119.501 Y108.094 E.00345
; LINE_WIDTH: 0.199963
G1 X119.38 Y108.261 E.00263
; WIPE_START
G1 F15000
G1 X119.501 Y108.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.221 Y107.692 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.196515
G1 F3832
M204 S6000
G1 X121.078 Y107.795 E.0022
; LINE_WIDTH: 0.153174
G1 X120.936 Y107.898 E.00158
; LINE_WIDTH: 0.109832
G1 X120.794 Y108.002 E.00096
; WIPE_START
G1 F15000
G1 X120.936 Y107.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.021 Y113.59 Z7.6 F42000
G1 X127.115 Y114.815 Z7.6
G1 Z7.2
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
G1 X128.894 Y113.163 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X127.923 Y113.012 I-.891 J2.536 E.48857
G1 X128.248 Y113.022 E.00998
G3 X128.837 Y113.143 I-.245 J2.677 E.01852
; WIPE_START
M204 S6000
G1 X129.199 Y113.292 E-.14852
G1 X129.486 Y113.458 E-.12587
G1 X129.75 Y113.658 E-.12588
G1 X129.988 Y113.888 E-.12578
G1 X130.195 Y114.146 E-.12589
G1 X130.345 Y114.388 E-.10806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.881 Y114.086 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X129.359 Y114.608 E.02267
G1 X129.092 Y114.341
G1 X129.616 Y113.817 E.02277
; WIPE_START
M204 S6000
G1 X129.092 Y114.341 E-.30346
G1 X129.359 Y114.608 E-.1544
G1 X129.881 Y114.086 E-.30213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.908 Y113.859 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X126.159 Y114.608 E.03251
; WIPE_START
M204 S6000
G1 X126.908 Y113.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.926 Y113.828 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23982
G1 F3832
M204 S6000
G1 X126.816 Y113.624 E.00371
G2 X126.558 Y113.79 I.141 J.503 E.005
; LINE_WIDTH: 0.271508
G2 X126.139 Y114.203 I3.134 J3.601 E.01095
; LINE_WIDTH: 0.241498
G2 X125.949 Y114.43 I1.624 J1.549 E.0048
G1 X125.926 Y114.517 E.00146
G1 X126.129 Y114.626 E.00374
; WIPE_START
G1 F15000
G1 X125.926 Y114.517 E-.28405
G1 X125.949 Y114.43 E-.1111
G1 X126.139 Y114.203 E-.36484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.387 Y117.58 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X126.908 Y117.059 E.02263
G1 X126.641 Y116.792
G1 X126.119 Y117.314 E.02267
; WIPE_START
M204 S6000
G1 X126.641 Y116.792 E-.30281
G1 X126.908 Y117.059 E-.1548
G1 X126.387 Y117.58 E-.30239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.84 Y116.792 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X129.092 Y117.54 E.03251
; WIPE_START
M204 S6000
G1 X129.84 Y116.792 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.871 Y116.774 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.238584
G1 F3832
M204 S6000
G1 X130.075 Y116.883 E.00368
G3 X129.958 Y117.086 I-.371 J-.078 E.00379
; LINE_WIDTH: 0.26399
G3 X129.329 Y117.705 I-4.068 J-3.502 E.01592
; LINE_WIDTH: 0.238841
G3 X129.182 Y117.774 I-.178 J-.191 E.00262
G1 X129.074 Y117.57 E.00368
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X129.182 Y117.774 E-.44699
G1 X129.329 Y117.705 E-.31301
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

