; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 22m 1s; total estimated time: 28m 49s
; total layer number: 95
; total filament length [mm] : 909.24
; total filament volume [cm^3] : 2186.97
; total filament weight [g] : 2.71
; model label id: 83,94,105,116
; object max height: 5.30,9.50,1.50,1.30
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 9.50
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
M73 P0 R28
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
M73 P1 R28
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P2 R28
G1 X-48.2 F3000
M73 P3 R27
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
M73 P4 R27
    G1 X-48.2 F3000
M73 P5 R27
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
M73 P6 R27
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
M73 P21 R22
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
    G29 A1 X102.2 Y103.8 I51.6 J48.4
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
; layer num/total_layer_count: 1/95
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.886 Y106.714 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P22 R22
G1 F1500
M204 S500
G1 X150.865 Y106.955 E.00471
G1 X150.885 Y107.04 E.0017
G2 X150.881 Y107.623 I5.237 J.325 E.01139
G3 X150.881 Y111.466 I-394.702 J1.865 E.07493
G1 X150.883 Y115.414 E.07696
G2 X150.886 Y121.085 I989.254 J2.4 E.11058
G3 X149.707 Y121.083 I.125 J-415.129 E.02298
G2 X141.913 Y121.084 I-3.85 J852.544 E.15196
G2 X136.523 Y121.086 I-2.289 J936.635 E.1051
G3 X136.516 Y111.294 I1830.421 J-6.133 E.19091
M73 P23 R22
G2 X136.514 Y106.724 I-548.798 J-2.04 E.0891
G3 X137.015 Y106.732 I.204 J2.96 E.00978
G3 X137.327 Y106.733 I.155 J.637 E.00615
G1 X137.44 Y106.716 E.00222
G2 X145.676 Y106.716 I4.173 J-1020.763 E.16059
G2 X150.826 Y106.714 I2.312 J-705.459 E.10041
M204 S6000
G1 X150.965 Y106.237 F42000
G1 F1500
M204 S500
G3 X151.362 Y106.768 I-.034 J.439 E.01462
G3 X151.349 Y107.518 I-182.336 J-2.642 E.01463
G3 X151.359 Y111.468 I-153.347 J2.367 E.07701
G1 X151.362 Y115.418 E.07703
G2 X151.365 Y121.111 I1063.175 J2.366 E.11099
G3 X150.917 Y121.564 I-.424 J.03 E.01404
G3 X149.747 Y121.562 I1.938 J-1115.001 E.02283
G2 X141.942 Y121.562 I-3.857 J819.368 E.15217
G3 X136.366 Y121.553 I-2.178 J-387.144 E.10872
G3 X136.047 Y121.179 I.073 J-.385 E.01037
G3 X136.038 Y111.294 I1492.652 J-6.357 E.19273
G3 X136.043 Y106.587 I512.176 J-1.816 E.09177
G3 X136.597 Y106.242 I.436 J.083 E.0143
G1 X136.635 Y106.243 E.00075
G2 X137.021 Y106.237 I.144 J-2.988 E.00752
G2 X137.403 Y106.237 I.194 J-2.583 E.00747
G2 X145.674 Y106.238 I4.193 J-1036.305 E.16126
G2 X150.905 Y106.237 I2.536 J-1165.374 E.102
M204 S6000
G1 X151.015 Y105.762 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X151.208 Y105.798 E.00382
G3 X151.841 Y106.784 I-.27 J.869 E.02481
M73 P23 R21
G2 X151.838 Y111.469 I403.593 J2.577 E.09134
G1 X151.841 Y115.422 E.07709
G2 X151.843 Y121.118 I1146.762 J2.324 E.11105
G3 X150.921 Y122.043 I-.901 J.024 E.02849
G2 X141.971 Y122.041 I-4.653 J682.668 E.17449
G3 X136.362 Y122.037 I-2.368 J-688.989 E.10936
G3 X135.566 Y121.125 I.09 J-.882 E.02598
G3 X135.559 Y111.293 I1849.945 J-6.306 E.1917
G3 X135.57 Y106.509 I228.371 J-1.879 E.09328
G3 X136.601 Y105.763 I.9 J.158 E.02745
G2 X145.672 Y105.759 I3.944 J-1348.384 E.17687
G2 X150.955 Y105.76 I2.776 J-1409.699 E.10301
; WIPE_START
G1 X151.208 Y105.798 E-.09701
G1 X151.364 Y105.861 E-.06413
G1 X151.537 Y105.979 E-.07948
G1 X151.643 Y106.09 E-.0582
G1 X151.741 Y106.24 E-.06841
G1 X151.812 Y106.423 E-.07445
G1 X151.84 Y106.598 E-.06722
G1 X151.841 Y106.784 E-.07073
G1 X151.84 Y107.259 E-.18039
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.692 Y107.923 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50474
G1 F2400
M204 S500
G1 X149.89 Y107.121 E.02233
G1 X149.207 Y107.122 E.01345
G1 X150.477 Y108.392 E.03535
G1 X150.477 Y109.075 E.01346
G1 X148.524 Y107.122 E.05438
G1 X147.841 Y107.123 E.01345
M73 P24 R21
G1 X150.477 Y109.759 E.0734
G1 X150.477 Y110.442 E.01346
G1 X147.158 Y107.123 E.09242
G1 X146.475 Y107.124 E.01345
G1 X150.477 Y111.126 E.11144
G1 X150.477 Y111.81 E.01346
G1 X145.792 Y107.124 E.13046
G1 X145.109 Y107.125 E.01345
G1 X150.477 Y112.493 E.14949
G1 X150.478 Y113.177 E.01346
G1 X144.426 Y107.125 E.16851
G1 X143.743 Y107.126 E.01345
G1 X150.478 Y113.86 E.18753
G1 X150.478 Y114.544 E.01346
G1 X143.06 Y107.126 E.20655
G1 X142.377 Y107.127 E.01345
G1 X150.478 Y115.228 E.22558
G1 X150.478 Y115.911 E.01346
G1 X141.694 Y107.127 E.2446
G1 X141.011 Y107.128 E.01345
G1 X150.478 Y116.595 E.26362
G1 X150.478 Y117.278 E.01346
G1 X140.329 Y107.128 E.28264
G1 X139.646 Y107.129 E.01345
G1 X150.479 Y117.962 E.30166
G1 X150.479 Y118.646 E.01346
G1 X138.963 Y107.129 E.32069
G1 X138.28 Y107.13 E.01345
G1 X150.479 Y119.329 E.33971
G1 X150.479 Y120.013 E.01346
G1 X137.597 Y107.13 E.35873
G1 X136.921 Y107.131 E.0133
G1 X150.456 Y120.673 E.37701
G2 X149.764 Y120.665 I-.64 J24.247 E.01362
G1 X136.921 Y107.822 E.35763
G1 X136.922 Y108.506 E.01347
G1 X149.081 Y120.665 E.3386
G1 X148.399 Y120.666 E.01344
G1 X136.922 Y109.19 E.31958
G1 X136.923 Y109.874 E.01347
G1 X147.716 Y120.667 E.30056
G1 X147.033 Y120.668 E.01344
G1 X136.923 Y110.558 E.28153
G1 X136.924 Y111.241 E.01347
G1 X146.351 Y120.668 E.26251
G1 X145.668 Y120.669 E.01344
G1 X136.924 Y111.925 E.24349
G1 X136.924 Y112.609 E.01347
G1 X144.985 Y120.67 E.22447
G1 X144.302 Y120.671 E.01344
G1 X136.925 Y113.293 E.20544
G1 X136.925 Y113.977 E.01347
G1 X143.62 Y120.671 E.18642
G1 X142.937 Y120.672 E.01344
G1 X136.926 Y114.661 E.1674
G1 X136.926 Y115.345 E.01347
G1 X142.254 Y120.673 E.14838
G1 X141.572 Y120.674 E.01344
G1 X136.926 Y116.029 E.12935
G1 X136.927 Y116.712 E.01347
G1 X140.889 Y120.674 E.11033
G1 X140.206 Y120.675 E.01344
G1 X136.927 Y117.396 E.09131
G1 X136.928 Y118.08 E.01347
G1 X139.523 Y120.676 E.07228
G1 X138.841 Y120.677 E.01344
G1 X136.928 Y118.764 E.05326
G1 X136.928 Y119.448 E.01347
G1 X138.158 Y120.677 E.03424
G1 X137.475 Y120.678 E.01344
G1 X136.713 Y119.916 E.02122
; OBJECT_ID: 105
; WIPE_START
G1 X137.475 Y120.678 E-.40944
G1 X138.158 Y120.677 E-.25944
G1 X137.988 Y120.508 E-.09113
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S6000
G1 X140.976 Y127.532 Z.5 F42000
G1 X149.032 Y146.475 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X149.032 Y147.432 E.01866
G1 X132.368 Y147.432 E.32491
G1 X132.368 Y130.768 E.32491
G1 X149.032 Y130.768 E.32491
G1 X149.032 Y146.415 E.30508
M204 S6000
G1 X148.554 Y146.475 F42000
G1 F1500
M204 S500
G1 X148.554 Y146.954 E.00933
G1 X132.846 Y146.954 E.30625
G1 X132.846 Y131.246 E.30625
G1 X148.554 Y131.246 E.30625
G1 X148.554 Y146.415 E.29575
M204 S6000
G1 X148.075 Y146.475 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X133.325 Y146.475 E.28759
G1 X133.325 Y131.725 E.28759
G1 X148.075 Y131.725 E.28759
G1 X148.075 Y146.415 E.28642
; WIPE_START
G1 X146.075 Y146.423 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.189 Y139.455 Z.5 F42000
G1 X151.418 Y134.468 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X151.418 Y138.932 E.08704
G1 X152.518 Y138.932 E.02145
G1 X152.518 Y150.375 E.2231
G3 X151.975 Y150.918 I-.522 J.021 E.01683
M73 P25 R21
G1 X129.392 Y150.918 E.4403
G3 X128.883 Y150.42 I.01 J-.519 E.01529
G1 X128.882 Y138.932 E.22399
G1 X129.982 Y138.932 E.02144
G1 X129.982 Y134.468 E.08704
G1 X128.882 Y134.468 E.02145
G1 X128.882 Y127.825 E.12951
G3 X129.37 Y127.283 I.521 J-.021 E.01574
G1 X130.768 Y127.283 E.02726
G1 X130.768 Y127.582 E.00584
G1 X135.232 Y127.582 E.08704
G1 X135.232 Y127.282 E.00585
G1 X146.168 Y127.282 E.21322
G1 X146.168 Y127.582 E.00585
G1 X150.632 Y127.582 E.08704
G1 X150.632 Y127.282 E.00585
G3 X152.008 Y127.282 I.677 J33.455 E.02683
G3 X152.517 Y127.77 I-.01 J.52 E.01509
G1 X152.518 Y134.468 E.1306
G1 X151.478 Y134.468 E.02027
M204 S6000
G1 X151.896 Y134.946 F42000
G1 F1500
M204 S500
G1 X151.896 Y138.454 E.06838
G1 X152.996 Y138.454 E.02145
G1 X152.996 Y150.384 E.23262
G3 X151.984 Y151.396 I-1 J.012 E.03111
G1 X129.409 Y151.396 E.44016
G3 X128.405 Y150.439 I.001 J-1.006 E.02985
G1 X128.404 Y138.454 E.23368
G1 X129.503 Y138.454 E.02145
G1 X129.503 Y134.946 E.06838
G1 X128.403 Y134.946 E.02145
G1 X128.403 Y127.816 E.13903
G3 X129.353 Y126.805 I1.001 J-.011 E.02988
G1 X131.246 Y126.804 E.03691
G1 X131.246 Y127.104 E.00584
G1 X134.753 Y127.104 E.06838
G1 X134.753 Y126.804 E.00585
G1 X146.646 Y126.804 E.23188
G1 X146.646 Y127.104 E.00585
G1 X150.154 Y127.104 E.06838
G1 X150.154 Y126.804 E.00585
G3 X152.031 Y126.804 I.919 J47.018 E.03662
G3 X152.995 Y127.753 I-.034 J.999 E.02896
G1 X152.996 Y134.946 E.14025
G1 X151.956 Y134.946 E.02027
M204 S6000
G1 X152.375 Y135.425 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X152.375 Y137.975 E.04972
G1 X153.475 Y137.975 E.02145
G1 X153.475 Y150.394 E.24213
G3 X151.994 Y151.875 I-1.478 J.003 E.0454
G1 X129.404 Y151.875 E.44044
G3 X127.926 Y150.458 I.008 J-1.487 E.04402
G1 X127.925 Y137.975 E.24338
G1 X129.025 Y137.975 E.02145
G1 X129.025 Y135.425 E.04972
G1 X127.925 Y135.425 E.02145
G1 X127.925 Y127.806 E.14854
G3 X129.339 Y126.326 I1.482 J.001 E.04405
G1 X131.725 Y126.325 E.04652
G1 X131.725 Y126.625 E.00585
G1 X134.275 Y126.625 E.04972
G1 X134.275 Y126.325 E.00585
G1 X147.125 Y126.325 E.25054
G1 X147.125 Y126.625 E.00585
G1 X149.675 Y126.625 E.04972
G1 X149.675 Y126.325 E.00585
G3 X152.055 Y126.326 I1.161 J60.32 E.04641
G3 X153.474 Y127.739 I-.058 J1.477 E.04288
G1 X153.475 Y135.425 E.14986
G1 X152.435 Y135.425 E.02028
; WIPE_START
G1 X152.388 Y137.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.333 Y129.792 Z.5 F42000
G1 X152.325 Y128.657 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50163
G1 F2400
M204 S500
G1 X151.357 Y127.689 E.02678
M73 P26 R21
G1 X151.039 Y127.689 E.00623
G1 X151.039 Y127.989 E.00587
G1 X150.978 Y127.989 E.00118
G1 X152.11 Y129.121 E.03131
G1 X152.11 Y129.8 E.01329
G1 X150.299 Y127.989 E.0501
G1 X149.62 Y127.989 E.01329
G1 X152.11 Y130.479 E.0689
G1 X152.11 Y131.158 E.01329
G1 X148.941 Y127.989 E.08769
G1 X148.262 Y127.989 E.01329
G1 X152.111 Y131.837 E.10648
G1 X152.111 Y132.516 E.01329
G1 X147.583 Y127.989 E.12527
G1 X146.904 Y127.989 E.01329
G1 X152.111 Y133.196 E.14406
G1 X152.111 Y133.875 E.01329
G1 X149.439 Y131.203 E.07393
G1 X149.439 Y131.882 E.01329
G1 X151.618 Y134.061 E.0603
G1 X151.011 Y134.061 E.01187
G1 X151.011 Y134.133 E.00141
G1 X149.439 Y132.561 E.0435
G1 X149.439 Y133.24 E.01329
G1 X151.011 Y134.812 E.0435
G1 X151.011 Y135.491 E.01329
G1 X149.439 Y133.919 E.0435
G1 X149.439 Y134.598 E.01329
G1 X151.011 Y136.17 E.0435
G1 X151.011 Y136.85 E.01329
G1 X149.439 Y135.277 E.0435
G1 X149.439 Y135.956 E.01329
G1 X151.011 Y137.529 E.0435
G1 X151.011 Y138.208 E.01329
G1 X149.439 Y136.635 E.0435
G1 X149.439 Y137.314 E.01329
G1 X151.011 Y138.887 E.0435
G1 X151.011 Y139.339 E.00884
G1 X151.463 Y139.339 E.00884
G1 X152.111 Y139.987 E.01793
G1 X152.111 Y140.666 E.01329
G1 X149.439 Y137.993 E.07394
G1 X149.439 Y138.672 E.01329
G1 X152.111 Y141.345 E.07394
G1 X152.111 Y142.024 E.01329
G1 X149.439 Y139.352 E.07394
G1 X149.439 Y140.031 E.01329
G1 X152.111 Y142.703 E.07394
G1 X152.111 Y143.382 E.01329
G1 X149.439 Y140.71 E.07394
G1 X149.439 Y141.389 E.01329
G1 X152.111 Y144.061 E.07394
G1 X152.111 Y144.74 E.01329
G1 X149.439 Y142.068 E.07394
G1 X149.439 Y142.747 E.01329
G1 X152.111 Y145.419 E.07394
G1 X152.111 Y146.098 E.01329
G1 X149.439 Y143.426 E.07394
G1 X149.439 Y144.105 E.01329
G1 X152.111 Y146.777 E.07394
G1 X152.111 Y147.456 E.01329
G1 X149.439 Y144.784 E.07394
G1 X149.439 Y145.463 E.01329
G1 X152.111 Y148.135 E.07394
G1 X152.111 Y148.815 E.01329
G1 X149.439 Y146.142 E.07394
G1 X149.439 Y146.821 E.01329
G1 X152.111 Y149.494 E.07394
G1 X152.111 Y150.173 E.01329
G1 X149.439 Y147.5 E.07394
G1 X149.439 Y147.839 E.00662
G1 X149.098 Y147.839 E.00666
G1 X151.771 Y150.511 E.07394
G1 X151.092 Y150.511 E.01329
G1 X148.419 Y147.839 E.07394
G1 X147.74 Y147.839 E.01329
G1 X150.413 Y150.511 E.07394
G1 X149.734 Y150.511 E.01329
G1 X147.061 Y147.839 E.07394
G1 X146.382 Y147.839 E.01329
G1 X149.054 Y150.511 E.07394
G1 X148.375 Y150.511 E.01329
G1 X145.703 Y147.839 E.07394
G1 X145.024 Y147.839 E.01329
G1 X147.696 Y150.511 E.07394
G1 X147.017 Y150.511 E.01329
G1 X144.345 Y147.839 E.07394
G1 X143.666 Y147.839 E.01329
G1 X146.338 Y150.511 E.07394
G1 X145.659 Y150.511 E.01329
G1 X142.987 Y147.839 E.07394
G1 X142.308 Y147.839 E.01329
G1 X144.98 Y150.511 E.07394
G1 X144.301 Y150.511 E.01329
G1 X141.629 Y147.839 E.07394
G1 X140.95 Y147.839 E.01329
G1 X143.622 Y150.511 E.07394
G1 X142.943 Y150.511 E.01329
G1 X140.271 Y147.839 E.07394
G1 X139.591 Y147.839 E.01329
G1 X142.264 Y150.511 E.07394
G1 X141.585 Y150.511 E.01329
G1 X138.912 Y147.839 E.07394
G1 X138.233 Y147.839 E.01329
G1 X140.906 Y150.511 E.07394
G1 X140.227 Y150.511 E.01329
G1 X137.554 Y147.839 E.07394
G1 X136.875 Y147.839 E.01329
G1 X139.548 Y150.511 E.07394
G1 X138.869 Y150.511 E.01329
G1 X136.196 Y147.839 E.07394
G1 X135.517 Y147.839 E.01329
G1 X138.189 Y150.511 E.07394
G1 X137.51 Y150.511 E.01329
G1 X134.838 Y147.839 E.07394
G1 X134.159 Y147.839 E.01329
G1 X136.831 Y150.511 E.07394
G1 X136.152 Y150.511 E.01329
G1 X133.48 Y147.839 E.07394
G1 X132.801 Y147.839 E.01329
G1 X135.689 Y150.727 E.0799
; WIPE_START
G1 X134.274 Y149.312 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.953 Y143.282 Z.5 F42000
G1 X148.813 Y130.576 Z.5
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X146.225 Y127.989 E.0716
G1 X145.761 Y127.989 E.00907
G1 X145.761 Y127.689 E.00587
G1 X145.246 Y127.689 E.01008
G1 X147.918 Y130.361 E.07394
G1 X147.239 Y130.361 E.01329
G1 X144.567 Y127.689 E.07394
G1 X143.888 Y127.689 E.01329
G1 X146.56 Y130.361 E.07394
G1 X145.881 Y130.361 E.01329
G1 X143.209 Y127.689 E.07394
G1 X142.53 Y127.689 E.01329
G1 X145.202 Y130.361 E.07394
G1 X144.523 Y130.361 E.01329
G1 X141.85 Y127.689 E.07394
G1 X141.171 Y127.689 E.01329
G1 X143.844 Y130.361 E.07394
G1 X143.165 Y130.361 E.01329
G1 X140.492 Y127.689 E.07394
G1 X139.813 Y127.689 E.01329
G1 X142.486 Y130.361 E.07394
G1 X141.807 Y130.361 E.01329
G1 X139.134 Y127.689 E.07394
G1 X138.455 Y127.689 E.01329
G1 X141.128 Y130.361 E.07394
G1 X140.448 Y130.361 E.01329
G1 X137.776 Y127.689 E.07394
G1 X137.097 Y127.689 E.01329
G1 X139.769 Y130.361 E.07394
G1 X139.09 Y130.361 E.01329
G1 X136.418 Y127.689 E.07394
G1 X135.739 Y127.689 E.01329
G1 X138.411 Y130.361 E.07394
G1 X137.732 Y130.361 E.01329
G1 X135.36 Y127.989 E.06564
G1 X134.681 Y127.989 E.01329
G1 X137.053 Y130.361 E.06564
G1 X136.374 Y130.361 E.01329
G1 X134.002 Y127.989 E.06564
G1 X133.323 Y127.989 E.01329
G1 X135.695 Y130.361 E.06564
G1 X135.016 Y130.361 E.01329
G1 X132.644 Y127.989 E.06564
G1 X131.965 Y127.989 E.01329
G1 X134.337 Y130.361 E.06564
G1 X133.658 Y130.361 E.01329
G1 X131.07 Y127.773 E.0716
; WIPE_START
G1 X132.484 Y129.188 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.092 Y127.474 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X132.979 Y130.361 E.07987
G1 X132.3 Y130.361 E.01329
G1 X129.629 Y127.69 E.0739
G2 X129.324 Y127.723 I-.104 J.459 E.0061
G2 X129.289 Y128.029 I.494 J.213 E.00611
G1 X131.961 Y130.702 E.07394
G1 X131.961 Y131.381 E.01329
G1 X129.289 Y128.708 E.07394
G1 X129.289 Y129.387 E.01329
G1 X131.961 Y132.06 E.07394
G1 X131.961 Y132.739 E.01329
G1 X129.289 Y130.066 E.07394
G1 X129.289 Y130.746 E.01329
G1 X131.961 Y133.418 E.07394
G1 X131.961 Y134.097 E.01329
G1 X129.289 Y131.425 E.07394
G1 X129.289 Y132.104 E.01329
G1 X131.961 Y134.776 E.07394
G1 X131.961 Y135.455 E.01329
G1 X129.289 Y132.783 E.07394
M73 P27 R21
G1 X129.289 Y133.462 E.01329
G1 X129.888 Y134.061 E.01658
G1 X130.389 Y134.061 E.00979
G1 X130.389 Y134.562 E.00979
G1 X131.961 Y136.134 E.0435
G1 X131.961 Y136.813 E.01329
G1 X130.389 Y135.241 E.0435
G1 X130.389 Y135.92 E.01329
G1 X131.961 Y137.492 E.0435
G1 X131.961 Y138.171 E.01329
G1 X130.389 Y136.599 E.0435
G1 X130.389 Y137.278 E.01329
G1 X131.961 Y138.85 E.0435
G1 X131.961 Y139.529 E.01329
G1 X130.389 Y137.957 E.0435
G1 X130.389 Y138.636 E.01329
G1 X131.961 Y140.209 E.0435
G1 X131.961 Y140.888 E.01329
G1 X130.389 Y139.315 E.0435
G1 X130.389 Y139.339 E.00046
G1 X129.733 Y139.339 E.01282
G1 X131.961 Y141.567 E.06164
G1 X131.961 Y142.246 E.01329
G1 X129.289 Y139.574 E.07393
G1 X129.289 Y140.253 E.01329
G1 X131.961 Y142.925 E.07393
G1 X131.961 Y143.604 E.01329
G1 X129.289 Y140.932 E.07393
G1 X129.289 Y141.611 E.01329
G1 X131.961 Y144.283 E.07393
G1 X131.961 Y144.962 E.01329
G1 X129.289 Y142.29 E.07392
G1 X129.289 Y142.969 E.01329
G1 X131.961 Y145.641 E.07392
M73 P27 R20
G1 X131.961 Y146.32 E.01329
G1 X129.289 Y143.648 E.07392
G1 X129.29 Y144.328 E.01329
G1 X132.176 Y147.215 E.07988
; WIPE_START
G1 X130.762 Y145.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.074 Y144.791 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F2400
M204 S500
G1 X134.794 Y150.511 E.15826
G1 X134.115 Y150.511 E.01329
G1 X129.29 Y145.686 E.13351
G1 X129.29 Y146.365 E.01329
G1 X133.436 Y150.511 E.11472
G1 X132.757 Y150.511 E.01329
G1 X129.29 Y147.044 E.09593
G1 X129.29 Y147.723 E.01329
G1 X132.078 Y150.511 E.07714
G1 X131.399 Y150.511 E.01329
G1 X129.29 Y148.402 E.05835
G1 X129.29 Y149.081 E.01329
G1 X130.72 Y150.511 E.03956
G1 X130.041 Y150.511 E.01329
G1 X129.29 Y149.761 E.02077
G1 X129.29 Y150.372 E.01196
G2 X129.314 Y150.463 I.153 J.009 E.00188
G1 X129.577 Y150.727 E.00728
; OBJECT_ID: 94
; WIPE_START
G1 X129.314 Y150.463 E-.14148
G1 X129.29 Y150.372 E-.03588
G1 X129.29 Y149.761 E-.23227
G1 X129.942 Y150.413 E-.35037
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S6000
G1 X122.311 Y150.278 Z.5 F42000
G1 X102.968 Y149.937 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X102.94 Y149.573 E.0071
G1 X102.94 Y131.498 E.35243
G3 X104.754 Y129.543 I1.829 J-.122 E.05822
G1 X122.973 Y129.541 E.35523
G3 X124.86 Y131.427 I.044 J1.843 E.05815
G1 X124.86 Y149.504 E.35246
G3 X122.973 Y151.46 I-1.832 J.121 E.05966
G1 X104.896 Y151.46 E.35246
G3 X102.977 Y149.995 I-.119 J-1.835 E.05135
; WIPE_START
G1 X102.94 Y149.573 E-.16105
G1 X102.94 Y147.997 E-.59896
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.416 Y140.38 Z.5 F42000
G1 X104.118 Y129.151 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X104.122 Y129.151 E.00008
G3 X104.527 Y129.076 I.616 J2.194 E.00805
G3 X105.495 Y129.062 I.721 J16.49 E.01886
G1 X122.796 Y129.062 E.33732
G3 X124.486 Y129.565 I.168 J2.529 E.03511
G3 X125.331 Y131.214 I-1.419 J1.769 E.03724
G1 X125.338 Y149.398 E.35454
G3 X124.835 Y151.086 I-2.544 J.16 E.03505
G3 X123.186 Y151.931 I-1.775 J-1.431 E.03722
G1 X105.002 Y151.938 E.35454
G3 X103.316 Y151.437 I-.16 J-2.545 E.035
G3 X102.469 Y149.786 I1.428 J-1.775 E.03727
G1 X102.462 Y131.602 E.35454
G3 X102.965 Y129.914 I2.536 J-.163 E.03505
G3 X103.735 Y129.299 I1.774 J1.43 E.01939
G1 X104.062 Y129.172 E.00683
; OBJECT_ID: 116
; WIPE_START
G1 X104.122 Y129.151 E-.02431
G1 X104.527 Y129.076 E-.15662
G1 X105.495 Y129.062 E-.36762
G1 X106.051 Y129.062 E-.21145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S6000
G1 X113.579 Y127.805 Z.5 F42000
G1 X124.914 Y125.913 Z.5
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X124.832 Y125.956 E.00181
G3 X123.694 Y121.459 I-.931 J-2.157 E.15849
G1 X123.874 Y121.45 E.00352
G3 X125.24 Y125.73 I.027 J2.349 E.11667
G1 X124.966 Y125.883 E.00612
; WIPE_START
G1 X124.832 Y125.956 E-.058
G1 X124.391 Y126.099 E-.17625
G1 X123.925 Y126.15 E-.17811
G1 X123.463 Y126.109 E-.17639
G1 X123.031 Y125.981 E-.17124
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.58 Y123.177 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X126.622 Y123.392 E.00425
G3 X123.877 Y121.05 I-2.719 J.408 E.26012
G1 X124.095 Y121.057 E.00426
G3 X126.567 Y123.119 I-.193 J2.743 E.06704
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F1500
G1 X126.622 Y123.392 E-.10561
G1 X126.65 Y123.716 E-.12374
G1 X126.648 Y123.937 E-.08392
G1 X126.592 Y124.37 E-.16603
G1 X126.506 Y124.684 E-.12369
G1 X126.381 Y124.99 E-.12564
G1 X126.341 Y125.062 E-.03137
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 2/95
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S193.8
; open powerlost recovery
M1003 S1
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.5 I.736 J.969 P1  F42000
G1 X150.969 Y106.358 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.244 Y106.679 I-.023 J.298 E.0082
G1 X151.243 Y110.765 E.07134
G2 X151.243 Y110.964 I1.428 J.099 E.00347
G1 X151.243 Y120.661 E.16932
G3 X151.239 Y121.196 I-172.314 J-1.081 E.00935
G3 X150.922 Y121.444 I-.298 J-.054 E.00769
G2 X145.672 Y121.443 I-2.846 J805.072 E.09166
G1 X136.431 Y121.442 E.16135
G3 X136.157 Y121.127 I.022 J-.296 E.00809
G1 X136.157 Y113.872 E.12668
G2 X136.157 Y113.614 I-2.045 J-.129 E.00451
G1 X136.156 Y106.68 E.12107
G3 X136.494 Y106.356 I.303 J-.022 E.00933
G2 X140.616 Y106.359 I2.969 J-1152.451 E.07196
G1 X150.909 Y106.358 E.17973
M204 S10000
G1 X151.001 Y105.93 F42000
G1 F6000
M204 S6000
G3 X151.673 Y106.671 I-.054 J.724 E.01925
G1 X151.671 Y110.773 E.07163
G2 X151.672 Y110.956 I1.315 J.091 E.0032
G1 X151.672 Y120.669 E.16959
G3 X151.658 Y121.29 I-2.921 J.244 E.01086
G3 X150.93 Y121.873 I-.713 J-.144 E.01767
G2 X145.675 Y121.871 I-2.854 J810.027 E.09176
G1 X136.47 Y121.873 E.16072
G3 X135.728 Y121.137 I-.013 J-.729 E.02033
G1 X135.728 Y113.867 E.12695
G2 X135.728 Y113.622 I-1.935 J-.122 E.00427
G1 X135.727 Y106.671 E.12137
G3 X136.488 Y105.928 I.728 J-.016 E.02082
G2 X140.616 Y105.931 I2.966 J-1135.431 E.07207
G1 X150.941 Y105.93 E.18029
M204 S250
G1 X151.065 Y105.522 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3060
M204 S5000
G1 X151.179 Y105.542 E.00187
G3 X151.427 Y105.619 I-.321 J1.467 E.00422
G1 F3120
G3 X151.638 Y105.748 I-.601 J1.228 E.00403
G1 F3060
G3 X151.872 Y105.989 I-.87 J1.078 E.00546
G1 F3120
G1 X151.929 Y106.074 E.00167
G1 F3060
G3 X152.086 Y106.663 I-1.133 J.618 E.00998
G1 X152.085 Y110.181 E.05713
G2 X152.085 Y120.077 I1028.022 J4.931 E.1607
M73 P28 R20
G1 X152.085 Y120.677 E.00974
G1 F3120
G2 X152.086 Y121.139 I5.033 J.223 E.0075
G1 F3060
G3 X151.98 Y121.628 I-1.18 J.001 E.00819
G1 F3120
G3 X151.853 Y121.837 I-.947 J-.432 E.00398
G1 F3060
G3 X151.611 Y122.072 I-1.078 J-.867 E.00549
G1 F3120
G1 X151.526 Y122.129 E.00166
G1 F3060
G3 X150.938 Y122.286 I-.613 J-1.111 E.00999
G1 X149.871 Y122.283 E.01732
G1 F3120
G1 X149.271 Y122.282 E.00974
G1 F3060
G3 X137.062 Y122.285 I-6.479 J-1581.907 E.19825
G3 X136.222 Y122.262 I-.309 J-4.141 E.01368
G3 X135.974 Y122.181 I.228 J-1.115 E.00424
G1 F3120
G1 X135.859 Y122.12 E.00212
G1 F3060
G3 X135.315 Y121.147 I.624 J-.988 E.01886
G1 X135.315 Y114.462 E.10856
G2 X135.315 Y113.631 I-31.297 J-.415 E.01349
G1 X135.314 Y107.263 E.10341
G3 X135.332 Y106.455 I4.211 J-.312 E.01314
G3 X135.48 Y106.059 I1.431 J.311 E.00689
G1 F3120
G3 X135.644 Y105.851 I.897 J.539 E.00431
G1 F3060
G3 X135.789 Y105.728 I.626 J.588 E.00309
G1 F3120
G1 X135.874 Y105.671 E.00167
G1 F3060
G3 X136.482 Y105.514 I.619 J1.139 E.0103
G1 X137.358 Y105.518 E.01422
G1 F3120
G1 X137.828 Y105.515 E.00764
G1 F3060
G1 X140.016 Y105.517 E.03552
G2 X141.216 Y105.517 I.739 J-507.042 E.01949
G1 X150.339 Y105.514 E.14814
G3 X151.005 Y105.517 I.303 J8.633 E.01082
; WIPE_START
M204 S6000
G1 X151.179 Y105.542 E-.06652
G1 X151.427 Y105.619 E-.09868
G1 X151.638 Y105.748 E-.09414
G1 X151.752 Y105.848 E-.05746
G1 X151.872 Y105.989 E-.07037
G1 X151.929 Y106.074 E-.03911
G1 X152.044 Y106.347 E-.11256
G1 X152.086 Y106.663 E-.12084
G1 X152.086 Y106.927 E-.10031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.172 Y121.272 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42104
G1 F15000
M204 S6000
G1 X150.892 Y120.552 E.01657
G1 X150.892 Y119.987 E.0092
G1 X149.787 Y121.092 E.02546
G1 X149.222 Y121.092 E.0092
G1 X150.892 Y119.422 E.03847
G1 X150.892 Y118.857 E.0092
G1 X148.657 Y121.092 E.05148
G1 X148.091 Y121.092 E.0092
G1 X150.892 Y118.292 E.06449
G1 X150.892 Y117.726 E.0092
G1 X147.526 Y121.092 E.0775
G1 X146.961 Y121.092 E.0092
G1 X150.892 Y117.161 E.09051
G1 X150.892 Y116.596 E.0092
G1 X146.396 Y121.092 E.10352
G1 X145.831 Y121.092 E.0092
G1 X150.892 Y116.031 E.11653
G1 X150.892 Y115.466 E.0092
G1 X145.266 Y121.092 E.12954
G1 X144.701 Y121.092 E.0092
G1 X150.892 Y114.901 E.14255
G1 X150.892 Y114.336 E.0092
G1 X144.136 Y121.092 E.15556
G1 X143.571 Y121.092 E.0092
G1 X150.892 Y113.771 E.16857
G1 X150.892 Y113.206 E.0092
G1 X143.006 Y121.092 E.18159
G1 X142.44 Y121.092 E.0092
G1 X150.892 Y112.641 E.1946
G1 X150.892 Y112.075 E.0092
G1 X141.875 Y121.093 E.20761
G1 X141.31 Y121.093 E.0092
G1 X150.892 Y111.51 E.22062
G1 X150.892 Y110.945 E.0092
G1 X140.745 Y121.093 E.23363
G1 X140.18 Y121.093 E.0092
G1 X150.892 Y110.38 E.24664
G1 X150.892 Y109.815 E.0092
G1 X139.615 Y121.093 E.25965
G1 X139.05 Y121.093 E.0092
G1 X150.892 Y109.25 E.27266
G1 X150.893 Y108.685 E.0092
G1 X138.485 Y121.093 E.28567
G1 X137.92 Y121.093 E.0092
G1 X150.893 Y108.12 E.29868
G1 X150.893 Y107.555 E.0092
G1 X137.355 Y121.093 E.31169
G1 X136.79 Y121.093 E.0092
G1 X150.893 Y106.99 E.3247
G1 X150.893 Y106.709 E.00456
G1 X150.608 Y106.709 E.00464
G1 X136.508 Y120.809 E.32462
G1 X136.508 Y120.244 E.0092
G1 X150.043 Y106.709 E.31161
G1 X149.478 Y106.709 E.0092
G1 X136.508 Y119.679 E.2986
G1 X136.508 Y119.113 E.0092
G1 X148.913 Y106.709 E.2856
G1 X148.348 Y106.709 E.0092
G1 X136.508 Y118.548 E.27259
G1 X136.508 Y117.983 E.0092
G1 X147.783 Y106.709 E.25958
G1 X147.218 Y106.709 E.0092
G1 X136.508 Y117.418 E.24657
G1 X136.508 Y116.853 E.0092
G1 X146.652 Y106.709 E.23356
G1 X146.087 Y106.709 E.0092
G1 X136.508 Y116.288 E.22056
G1 X136.508 Y115.723 E.0092
G1 X145.522 Y106.709 E.20755
G1 X144.957 Y106.709 E.0092
G1 X136.508 Y115.158 E.19454
G1 X136.508 Y114.593 E.0092
G1 X144.392 Y106.709 E.18153
G1 X143.827 Y106.709 E.0092
G1 X136.508 Y114.028 E.16852
G1 X136.508 Y113.463 E.0092
G1 X143.262 Y106.708 E.15552
G1 X142.697 Y106.708 E.0092
G1 X136.508 Y112.898 E.14251
G1 X136.508 Y112.333 E.0092
G1 X142.132 Y106.708 E.1295
G1 X141.567 Y106.708 E.0092
G1 X136.508 Y111.768 E.11649
G1 X136.508 Y111.203 E.0092
G1 X141.002 Y106.708 E.10348
G1 X140.437 Y106.708 E.0092
G1 X136.508 Y110.638 E.09047
G1 X136.508 Y110.073 E.0092
G1 X139.872 Y106.708 E.07747
G1 X139.307 Y106.708 E.0092
G1 X136.508 Y109.508 E.06446
G1 X136.508 Y108.942 E.0092
G1 X138.742 Y106.708 E.05145
G1 X138.177 Y106.708 E.0092
G1 X136.508 Y108.377 E.03844
G1 X136.508 Y107.812 E.0092
G1 X137.612 Y106.708 E.02543
G1 X137.047 Y106.708 E.0092
G1 X136.328 Y107.427 E.01655
; OBJECT_ID: 105
; WIPE_START
G1 X137.047 Y106.708 E-.38639
G1 X137.612 Y106.708 E-.21471
G1 X137.316 Y107.003 E-.15891
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X139.455 Y114.33 Z.6 F42000
G1 X148.802 Y146.36 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z.6 F42000
G1 X151.648 Y134.698 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.74 Y150.507 E.20612
G3 X151.979 Y151.148 I-.741 J-.108 E.019
G1 X129.42 Y151.148 E.39388
G3 X128.653 Y150.429 I-.017 J-.75 E.02034
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.752 J-.017 E.02017
G1 X130.998 Y127.053 E.02858
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G1 X151.98 Y127.052 E.02754
G3 X152.747 Y127.771 I.016 J.751 E.02033
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.0192
G1 X153.175 Y150.453 E.21265
G3 X151.987 Y151.576 I-1.178 J-.055 E.03154
G1 X129.412 Y151.576 E.39417
G3 X128.225 Y150.446 I-.007 J-1.181 E.03164
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.12771
G3 X129.348 Y126.625 I1.182 J-.007 E.03154
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.988 Y126.624 E.03517
G3 X153.175 Y127.754 I.006 J1.182 E.03163
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.588 Y150.469 E.20475
G3 X151.996 Y151.99 I-1.591 J-.072 E.03947
G1 X129.404 Y151.99 E.36684
G3 X127.811 Y150.462 I.003 J-1.597 E.03956
G1 X127.81 Y137.86 E.20464
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.597 J.003 E.03953
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.996 Y126.21 E.03955
G3 X153.589 Y127.738 I-.003 J1.598 E.03956
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z.6 F42000
G1 X132.384 Y149.175 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.731 I-327.061 J2.216 E.08563
G1 X150.013 Y147.416 E.1254
G1 X149.931 Y147.812 E.0066
G1 X149.72 Y148.121 E.0061
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y130.584 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.016 Y130.584 E.20813
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27008
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00247
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X136.139 Y130.584 E.06097
M204 S10000
G1 X136.199 Y130.186 F42000
G1 F15000
M204 S6000
G1 X149.016 Y130.186 E.20813
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27008
G1 X149.565 Y147.654 E.00394
M73 P29 R20
G3 X149.016 Y148.014 I-.588 J-.297 E.01115
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X136.139 Y130.186 E.06097
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07192
G1 X150.616 Y128.961 E.00916
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.319 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X151.234 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.824 E.1049
G2 X152.13 Y127.498 I-.483 J.075 E.00641
G2 X150.816 Y127.466 I-1.056 J16.415 E.02135
G3 X150.75 Y127.714 I-.312 J.05 E.00428
G1 X150.556 Y127.766 E.00327
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.393 Y127.467 E.01934
G1 X129.191 Y127.549 E.00354
G1 X129.074 Y127.792 E.00438
G1 X129.066 Y134.284 E.10541
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.916 E.07198
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18316
G1 X129.154 Y150.618 E.00388
G2 X129.498 Y150.734 I.353 J-.477 E.00598
G1 X151.956 Y150.734 E.36466
G1 X152.135 Y150.688 E.00302
G1 X152.274 Y150.557 E.00309
G1 X152.333 Y150.355 E.00342
G1 X152.334 Y139.116 E.1825
G1 X151.434 Y139.116 E.01462
G1 X151.275 Y139.037 E.00287
G1 X151.254 Y138.973 E.00109
M204 S10000
G1 X150.836 Y138.916 F42000
G1 F15000
M204 S6000
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.935 Y127.867 E.09774
G1 X151.082 Y127.865 E.01384
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00793
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01382
G2 X129.464 Y133.886 I710.45 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.916 E.07198
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.33 E.17562
G1 X151.933 Y150.335 E.36482
G1 X151.936 Y139.514 E.1757
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.00371
G1 X150.958 Y139.278 E.00514
G1 X150.855 Y138.973 E.00523
M204 S10000
G1 X150.431 Y138.916 F42000
; LINE_WIDTH: 0.421553
G1 F15000
M204 S6000
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.265 E.08514
G1 X151.304 Y128.264 E.00378
G1 X151.287 Y128.303 E.00069
G1 X150.616 Y128.563 E.01172
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.959 Y139.09 E.0751
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.536 Y149.937 E.35328
G1 X151.537 Y139.913 E.16342
G1 X151.06 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.434 Y138.976 E.00186
M204 S10000
G1 X150.411 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X150.411 Y147.417 E.12322
G3 X150.296 Y147.971 I-1.395 J0 E.00925
G1 X150.002 Y148.403 E.00849
G1 X149.57 Y148.697 E.00848
G3 X149.016 Y148.811 I-.554 J-1.28 E.00924
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.828 E.12322
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.137 Y149.539 E.33895
G1 X151.138 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.459 Y139.864 E.00924
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.350105
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09529
M204 S10000
G1 X150.761 Y147.723 F42000
; LINE_WIDTH: 0.394398
G1 F15000
M204 S6000
G1 X150.738 Y147.863 E.00215
; LINE_WIDTH: 0.431555
G1 X150.716 Y148.003 E.00237
; LINE_WIDTH: 0.485547
G1 X150.693 Y148.143 E.00268
G1 X150.308 Y148.709 E.01295
G1 X149.741 Y149.093 E.01294
; LINE_WIDTH: 0.468948
G1 X149.602 Y149.116 E.00258
; LINE_WIDTH: 0.432265
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.395582
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.432265
G1 X149.604 Y149.125 E.00237
; LINE_WIDTH: 0.48603
G1 X149.744 Y149.107 E.00268
G1 X150.705 Y149.107 E.01819
G1 X150.705 Y148.145 E.0182
; LINE_WIDTH: 0.468712
G1 X150.721 Y148.024 E.00222
; LINE_WIDTH: 0.431555
G1 X150.737 Y147.903 E.00204
; LINE_WIDTH: 0.394398
G1 X150.753 Y147.782 E.00185
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z.6 F42000
G1 X103.041 Y149.932 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00588
G1 X102.99 Y131.496 E.29354
G3 X104.752 Y129.596 I1.926 J.019 E.04616
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.427 I-.084 J1.918 E.04626
G1 X124.81 Y149.504 E.29354
G3 X122.973 Y151.409 I-1.911 J-.005 E.04746
G1 X104.896 Y151.41 E.29353
G3 X103.055 Y149.99 I.008 J-1.914 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16036
G1 X102.991 Y147.995 E-.59964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z.6 F42000
G1 X104.087 Y129.071 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.089 Y129.074 E.00005
G3 X104.514 Y129.012 I.529 J2.145 E.00698
G1 X123.284 Y129.012 E.30479
G1 X123.457 Y129.025 E.00282
G3 X125.39 Y131.204 I-.258 J2.176 E.05173
G1 X125.388 Y149.886 E.30336
G3 X123.198 Y151.99 I-2.193 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.114 E.30339
G3 X103.685 Y129.216 I2.206 J.104 E.03901
G1 X104.031 Y129.091 E.00597
M204 S10000
G1 X104.112 Y129.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251186
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00339
; LINE_WIDTH: 0.187257
G3 X104.633 Y129.309 I.311 J2.389 E.00115
G1 X122.983 Y129.302 E.12396
G1 X123.248 Y129.315 E.00179
; LINE_WIDTH: 0.240878
G3 X123.63 Y129.387 I-.174 J1.957 E.00348
G1 X123.679 Y129.402 E.00046
; LINE_WIDTH: 0.29885
G3 X124.902 Y130.475 I-.628 J1.948 E.0189
G1 X124.906 Y130.484 E.00012
; LINE_WIDTH: 0.263233
G3 X125.061 Y130.977 I-1.856 J.857 E.0051
; LINE_WIDTH: 0.188517
G3 X125.096 Y131.32 I-2.655 J.445 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.250324
G3 X125.013 Y150.23 I-2.262 J-.323 E.00281
G1 X124.971 Y150.36 E.00127
; LINE_WIDTH: 0.300492
G3 X123.925 Y151.502 I-1.905 J-.694 E.01806
G1 X123.916 Y151.506 E.00012
; LINE_WIDTH: 0.26301
G3 X123.423 Y151.662 I-.865 J-1.882 E.0051
G1 X123.419 Y151.663 E.00005
; LINE_WIDTH: 0.188502
G1 X122.979 Y151.699 E.003
G1 X104.892 Y151.699 E.1231
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247283
G3 X104.214 Y151.625 I.221 J-1.789 E.00239
G1 X104.09 Y151.588 E.00119
; LINE_WIDTH: 0.297813
G3 X102.898 Y150.525 I.646 J-1.926 E.01848
G1 X102.834 Y150.374 E.00185
; LINE_WIDTH: 0.255695
G3 X102.738 Y150.025 I2.072 J-.759 E.00345
G1 X102.737 Y150.015 E.0001
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.488 E.12291
; LINE_WIDTH: 0.196183
G1 X102.714 Y131.156 E.00237
; LINE_WIDTH: 0.23971
G3 X102.798 Y130.734 I2.419 J.261 E.00383
; LINE_WIDTH: 0.297108
G3 X103.496 Y129.728 I1.952 J.611 E.01396
G1 X103.767 Y129.553 E.00362
G1 X104.026 Y129.434 E.0032
; LINE_WIDTH: 0.251186
G1 X104.053 Y129.428 E.00026
; OBJECT_ID: 116
; WIPE_START
G1 X104.463 Y129.325 E-.16059
G1 X104.633 Y129.309 E-.06476
G1 X106.04 Y129.308 E-.53464
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.55 Y127.946 Z.6 F42000
G1 X124.87 Y125.892 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.816 Y125.917 E.00097
G3 X123.697 Y121.499 I-.916 J-2.119 E.12973
G1 X123.867 Y121.49 E.00276
G3 X125.216 Y125.694 I.033 J2.308 E.09553
G1 X124.922 Y125.862 E.00549
; WIPE_START
M204 S6000
G1 X124.816 Y125.917 E-.04551
G1 X124.38 Y126.06 E-.17412
G1 X124.018 Y126.107 E-.13873
G1 X123.558 Y126.085 E-.17509
G1 X123.212 Y126.005 E-.13515
G1 X122.99 Y125.91 E-.09141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.621 Y123.181 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.676 Y123.495 E.00519
G3 X123.887 Y121.011 I-2.771 J.302 E.21791
G1 X124.097 Y121.017 E.00342
G3 X126.609 Y123.122 I-.192 J2.781 E.05689
M204 S10000
G1 X126.376 Y123.192 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0874496
G1 F15000
M204 S6000
G1 X126.386 Y123.22 E.00008
G3 X121.354 Y123.877 I-2.484 J.576 E.02288
G1 X121.354 Y123.875 E.00001
G3 X121.354 Y123.678 I3.304 J-.085 E.00053
G1 X121.371 Y123.485 E.00052
G3 X126.3 Y122.931 I2.531 J.311 E.01832
G1 X126.36 Y123.134 E.00057
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.386 Y123.22 E-.03382
G1 X126.422 Y123.418 E-.07663
G1 X126.45 Y123.724 E-.11685
G1 X126.448 Y123.927 E-.07721
G1 X126.416 Y124.224 E-.11344
G1 X126.372 Y124.427 E-.07903
G1 X126.239 Y124.816 E-.1559
G1 X126.15 Y125.002 E-.07868
G1 X126.111 Y125.066 E-.02845
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 3/95
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.732 J.972 P1  F42000
G1 X151.02 Y106.297 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.311 Y106.655 I-.071 J.355 E.00874
G1 X151.307 Y121.197 E.25391
G3 X150.945 Y121.511 I-.361 J-.051 E.00913
G1 X136.381 Y121.504 E.2543
G3 X136.089 Y121.143 I.071 J-.355 E.00878
G1 X136.089 Y106.667 E.25275
G3 X136.48 Y106.289 I.365 J-.014 E.01072
G1 X143.94 Y106.289 E.13024
G1 X150.96 Y106.296 E.12257
M204 S10000
G1 X151.038 Y105.87 F42000
G1 F6000
M204 S6000
G1 X151.111 Y105.879 E.00128
G3 X151.739 Y106.647 I-.169 J.779 E.01871
G1 X151.74 Y121.14 E.25305
G3 X150.953 Y121.939 I-.798 J.001 E.02171
G1 X136.46 Y121.94 E.25305
G3 X135.661 Y121.151 I-.002 J-.797 E.02174
G1 X135.66 Y106.66 E.25302
G3 X136.472 Y105.86 I.792 J-.007 E.02219
G1 X143.941 Y105.861 E.13041
G1 X150.953 Y105.861 E.12243
G1 X150.978 Y105.863 E.00044
M204 S250
G1 X151.08 Y105.455 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.107 Y105.458 E.00045
G3 X151.652 Y105.673 I-.166 J1.221 E.0096
G1 X151.756 Y105.757 E.00218
G1 X151.84 Y105.84 E.00192
G1 X151.903 Y105.916 E.00161
G1 X151.961 Y105.998 E.00163
G1 X152.022 Y106.103 E.00197
G3 X152.153 Y106.64 I-1.202 J.578 E.00904
G1 X152.153 Y107.24 E.00974
G1 X152.153 Y120.547 E.21609
G3 X152.127 Y121.399 I-4.156 J.3 E.01386
G3 X151.927 Y121.852 I-1.518 J-.4 E.00807
G1 X151.843 Y121.956 E.00217
G1 X151.76 Y122.04 E.00192
G1 X151.684 Y122.103 E.00161
G1 X151.602 Y122.161 E.00163
G1 X151.497 Y122.222 E.00197
G1 X151.389 Y122.27 E.00192
G1 X151.285 Y122.306 E.00178
G3 X150.96 Y122.353 I-.386 J-1.52 E.00535
G1 X137.053 Y122.353 E.22583
G3 X136.202 Y122.327 I-.3 J-4.169 E.01384
G3 X135.75 Y122.129 I.399 J-1.519 E.00805
G1 X135.646 Y122.045 E.00217
G1 X135.562 Y121.962 E.00191
G1 X135.498 Y121.886 E.00162
G3 X135.247 Y121.159 I1.041 J-.766 E.01268
G1 X135.247 Y107.253 E.22581
G3 X135.263 Y106.456 I4.439 J-.31 E.01295
G3 X135.627 Y105.772 I1.207 J.204 E.01281
G1 X135.709 Y105.702 E.00176
G1 X135.798 Y105.639 E.00177
G1 X135.903 Y105.578 E.00196
G3 X136.464 Y105.447 I.558 J1.118 E.00944
G1 X143.942 Y105.447 E.12143
G1 X144.883 Y105.449 E.01529
G2 X145.552 Y105.447 I.314 J-6.809 E.01087
G1 X150.36 Y105.447 E.07807
G1 X150.96 Y105.447 E.00974
G1 X151.02 Y105.451 E.00097
; WIPE_START
M204 S6000
G1 X151.107 Y105.458 E-.03322
G1 X151.324 Y105.506 E-.08446
G1 X151.547 Y105.605 E-.09276
G1 X151.652 Y105.673 E-.04725
G1 X151.756 Y105.757 E-.05093
G1 X151.84 Y105.84 E-.04485
G1 X151.903 Y105.916 E-.03758
G1 X151.961 Y105.998 E-.03819
G1 X152.022 Y106.103 E-.04608
G1 X152.106 Y106.314 E-.08642
G1 X152.153 Y106.64 E-.12493
G1 X152.153 Y106.833 E-.07334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.139 Y107.401 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42372
G1 F15000
M204 S6000
G1 X150.378 Y106.641 E.01762
G1 X149.81 Y106.641 E.00932
G1 X150.959 Y107.79 E.02665
G1 X150.959 Y108.359 E.00932
G1 X149.241 Y106.641 E.03983
G1 X148.672 Y106.641 E.00932
G1 X150.959 Y108.928 E.05302
G1 X150.959 Y109.497 E.00932
G1 X148.103 Y106.641 E.0662
G1 X147.534 Y106.641 E.00932
G1 X150.959 Y110.066 E.07939
G1 X150.959 Y110.635 E.00932
G1 X146.965 Y106.641 E.09258
G1 X146.396 Y106.641 E.00932
G1 X150.959 Y111.204 E.10576
G1 X150.959 Y111.773 E.00932
G1 X145.827 Y106.641 E.11895
G1 X145.259 Y106.641 E.00932
G1 X150.959 Y112.342 E.13213
G1 X150.959 Y112.91 E.00932
G1 X144.69 Y106.641 E.14532
G1 X144.121 Y106.641 E.00932
G1 X150.959 Y113.479 E.1585
G1 X150.959 Y114.048 E.00932
G1 X143.552 Y106.641 E.17169
G1 X142.983 Y106.641 E.00932
G1 X150.959 Y114.617 E.18488
G1 X150.959 Y115.186 E.00932
G1 X142.414 Y106.641 E.19806
G1 X141.845 Y106.641 E.00932
G1 X150.959 Y115.755 E.21125
G1 X150.959 Y116.324 E.00932
G1 X141.276 Y106.641 E.22444
M73 P30 R20
G1 X140.707 Y106.641 E.00932
G1 X150.959 Y116.893 E.23762
G1 X150.959 Y117.462 E.00932
G1 X140.138 Y106.641 E.25081
G1 X139.57 Y106.641 E.00932
G1 X150.959 Y118.03 E.264
G1 X150.959 Y118.599 E.00932
G1 X139.001 Y106.641 E.27718
G1 X138.432 Y106.641 E.00932
G1 X150.959 Y119.168 E.29037
G1 X150.959 Y119.737 E.00932
G1 X137.863 Y106.641 E.30356
G1 X137.294 Y106.641 E.00932
G1 X150.959 Y120.306 E.31674
G1 X150.96 Y120.875 E.00932
G1 X136.725 Y106.64 E.32993
G2 X136.452 Y106.646 I-.112 J1.155 E.00449
G2 X136.44 Y106.925 I.684 J.167 E.0046
G1 X150.675 Y121.159 E.32993
G1 X150.106 Y121.159 E.00932
G1 X136.441 Y107.494 E.31674
G1 X136.441 Y108.063 E.00932
G1 X149.537 Y121.159 E.30356
G1 X148.968 Y121.159 E.00932
G1 X136.441 Y108.632 E.29037
G1 X136.441 Y109.2 E.00932
G1 X148.399 Y121.159 E.27719
G1 X147.831 Y121.159 E.00932
G1 X136.441 Y109.769 E.264
G1 X136.441 Y110.338 E.00932
G1 X147.262 Y121.159 E.25081
G1 X146.693 Y121.159 E.00932
G1 X136.441 Y110.907 E.23763
G1 X136.441 Y111.476 E.00932
G1 X146.124 Y121.159 E.22444
G1 X145.555 Y121.159 E.00932
G1 X136.441 Y112.045 E.21126
G1 X136.441 Y112.614 E.00932
G1 X144.986 Y121.159 E.19807
G1 X144.417 Y121.159 E.00932
G1 X136.441 Y113.183 E.18488
G1 X136.441 Y113.752 E.00932
G1 X143.848 Y121.159 E.1717
G1 X143.28 Y121.159 E.00932
G1 X136.441 Y114.321 E.15851
G1 X136.441 Y114.889 E.00932
G1 X142.711 Y121.159 E.14533
G1 X142.142 Y121.159 E.00932
G1 X136.441 Y115.458 E.13214
G1 X136.441 Y116.027 E.00932
G1 X141.573 Y121.159 E.11896
G1 X141.004 Y121.159 E.00932
G1 X136.441 Y116.596 E.10577
G1 X136.441 Y117.165 E.00932
G1 X140.435 Y121.159 E.09258
G1 X139.866 Y121.159 E.00932
G1 X136.441 Y117.734 E.0794
G1 X136.441 Y118.303 E.00932
G1 X139.297 Y121.159 E.06621
G1 X138.729 Y121.159 E.00932
G1 X136.441 Y118.872 E.05303
G1 X136.441 Y119.441 E.00932
G1 X138.16 Y121.159 E.03984
G1 X137.591 Y121.16 E.00932
G1 X136.441 Y120.01 E.02665
G1 X136.441 Y120.578 E.00932
G1 X137.201 Y121.339 E.01763
; OBJECT_ID: 105
; WIPE_START
G1 X136.441 Y120.578 E-.40865
G1 X136.441 Y120.01 E-.21618
G1 X136.692 Y120.261 E-.13517
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X139.905 Y127.185 Z.7 F42000
G1 X148.802 Y146.36 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z.7 F42000
G1 X151.648 Y134.698 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.746 Y150.44 E.20495
G1 X152.72 Y150.601 E.00284
G3 X151.979 Y151.148 I-.721 J-.201 E.01732
G1 X129.411 Y151.148 E.39405
G3 X128.653 Y150.429 I-.002 J-.756 E.02013
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.752 J-.016 E.02016
G1 X130.998 Y127.053 E.02858
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.019 Y127.053 I.793 J41.123 E.02823
G1 X152.107 Y127.06 E.00154
G3 X152.747 Y127.771 I-.11 J.743 E.0181
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.0192
G1 X153.174 Y150.457 E.21273
G3 X151.988 Y151.576 I-1.175 J-.057 E.03147
G1 X129.406 Y151.576 E.39428
G3 X128.225 Y150.446 I.005 J-1.188 E.03149
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.12771
G3 X129.348 Y126.625 I1.183 J-.006 E.03153
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G3 X152.04 Y126.624 I1.01 J52.672 E.03608
G3 X153.175 Y127.754 I-.052 J1.187 E.03068
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.588 Y150.474 E.20482
G3 X151.996 Y151.99 I-1.589 J-.075 E.03941
G1 X129.402 Y151.99 E.36688
G3 X127.811 Y150.462 I.012 J-1.604 E.03948
G1 X127.81 Y137.86 E.20464
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.598 J.004 E.03953
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G3 X152.06 Y126.211 I1.219 J63.424 E.0406
G3 X153.589 Y127.738 I-.075 J1.604 E.03847
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z.7 F42000
G1 X132.384 Y149.175 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
M73 P30 R19
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.137 Y149.539 E.33895
G1 X151.138 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01021
G1 X150.411 Y147.417 E.12322
G3 X150.296 Y147.971 I-1.394 J0 E.00925
G1 X150.002 Y148.403 E.00849
G1 X149.57 Y148.697 E.00848
G3 X149.016 Y148.811 I-.553 J-1.28 E.00924
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.731 I-327.052 J2.216 E.08563
G1 X150.013 Y147.417 E.1254
G1 X149.931 Y147.812 E.0066
G1 X149.72 Y148.121 E.0061
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y130.584 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.016 Y130.584 E.20813
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27008
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00247
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X136.139 Y130.584 E.06097
M204 S10000
G1 X136.199 Y130.186 F42000
G1 F15000
M204 S6000
G1 X149.016 Y130.186 E.20813
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27008
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01115
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X136.139 Y130.186 E.06097
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X151.234 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.888 E.10387
G1 X152.262 Y127.604 E.00475
G1 X152.096 Y127.486 E.0033
G2 X150.816 Y127.466 I-1.003 J22.998 E.0208
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.392 Y127.467 E.01936
G1 X129.189 Y127.551 E.00357
G1 X129.076 Y127.78 E.00416
G1 X129.066 Y134.284 E.10561
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.916 E.07198
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18316
G1 X129.152 Y150.613 E.0038
G1 X129.382 Y150.724 E.00414
G1 X129.476 Y150.734 E.00155
G1 X151.948 Y150.734 E.36488
G1 X152.133 Y150.698 E.00306
G1 X152.256 Y150.599 E.00256
G1 X152.332 Y150.309 E.00488
G1 X152.334 Y139.116 E.18175
G1 X151.434 Y139.116 E.01462
G1 X151.275 Y139.037 E.00287
G1 X151.254 Y138.973 E.00109
M204 S10000
G1 X150.836 Y138.916 F42000
G1 F15000
M204 S6000
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.935 Y127.888 E.09739
G2 X151.083 Y127.864 I-.703 J10.045 E.01384
G1 X151.02 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01383
G2 X129.464 Y133.886 I941.835 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.916 E.07198
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.334 E.17569
G1 X151.909 Y150.336 E.36443
G1 X151.934 Y150.309 E.0006
G1 X151.936 Y139.514 E.17528
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.00371
G1 X150.958 Y139.278 E.00514
G1 X150.855 Y138.973 E.00523
M204 S10000
G1 X150.431 Y138.916 F42000
; LINE_WIDTH: 0.421553
G1 F15000
M204 S6000
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.306 Y128.263 E.00376
G1 X151.289 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
M73 P31 R19
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.959 Y139.09 E.0751
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.535 Y149.937 E.35327
G1 X151.537 Y139.913 E.16342
G1 X151.06 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.434 Y138.976 E.00186
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.349982
G1 F15000
M204 S6000
G1 X150.763 Y147.663 E.09525
M204 S10000
G1 X150.761 Y147.723 F42000
; LINE_WIDTH: 0.394203
G1 F15000
M204 S6000
G1 X150.738 Y147.863 E.00215
; LINE_WIDTH: 0.43141
G1 X150.715 Y148.003 E.00237
; LINE_WIDTH: 0.485474
G1 X150.693 Y148.143 E.00268
G1 X150.307 Y148.709 E.01295
G1 X149.741 Y149.093 E.01293
; LINE_WIDTH: 0.46889
G1 X149.602 Y149.116 E.00258
; LINE_WIDTH: 0.43223
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39557
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.43223
G1 X149.604 Y149.125 E.00237
; LINE_WIDTH: 0.485961
G1 X149.744 Y149.107 E.00268
G1 X150.705 Y149.107 E.01818
G1 X150.705 Y148.145 E.0182
; LINE_WIDTH: 0.468617
G1 X150.721 Y148.024 E.00222
; LINE_WIDTH: 0.43141
G1 X150.737 Y147.903 E.00204
; LINE_WIDTH: 0.394203
G1 X150.753 Y147.782 E.00185
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z.7 F42000
G1 X103.041 Y149.932 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.926 J.019 E.04616
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.427 I-.091 J1.924 E.04622
G1 X124.81 Y149.504 E.29354
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.99 I.007 J-1.914 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15963
G1 X102.991 Y147.995 E-.60037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z.7 F42000
G1 X104.088 Y129.071 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.089 Y129.074 E.00005
G3 X104.512 Y129.012 I.529 J2.145 E.00695
G1 X123.283 Y129.012 E.30481
G1 X123.457 Y129.025 E.00283
G3 X125.39 Y131.204 I-.262 J2.179 E.05171
G1 X125.388 Y149.888 E.30339
G3 X123.198 Y151.99 I-2.193 J-.093 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.112 E.30342
G3 X103.685 Y129.216 I2.207 J.107 E.03897
G1 X104.031 Y129.091 E.00597
M204 S10000
G1 X104.13 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251379
G1 F15000
M204 S6000
G1 X104.201 Y129.378 E.0007
G1 X104.458 Y129.325 E.00245
; LINE_WIDTH: 0.187413
G3 X104.633 Y129.309 I.347 J2.826 E.00119
G1 X122.983 Y129.302 E.12407
G3 X123.323 Y129.323 I-.041 J3.312 E.0023
; LINE_WIDTH: 0.248979
G3 X123.747 Y129.425 I-.298 J2.179 E.00405
; LINE_WIDTH: 0.300247
G3 X124.86 Y130.392 I-.681 J1.908 E.01714
G1 X124.904 Y130.481 E.00113
; LINE_WIDTH: 0.263623
G3 X125.061 Y130.973 I-1.93 J.884 E.00511
; LINE_WIDTH: 0.188409
G1 X125.099 Y131.419 E.00304
G1 X125.099 Y149.508 E.12305
G1 X125.082 Y149.879 E.00252
; LINE_WIDTH: 0.24209
G3 X125.002 Y150.266 I-2.298 J-.274 E.00356
; LINE_WIDTH: 0.296847
G3 X123.779 Y151.564 I-1.937 J-.601 E.02072
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.25071
G3 X123.339 Y151.675 I-.686 J-1.863 E.00409
; LINE_WIDTH: 0.188222
G3 X123.195 Y151.69 I-.31 J-2.274 E.00098
G1 X104.892 Y151.699 E.12436
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.242105
G3 X104.303 Y151.647 I.275 J-2.408 E.00203
G1 X104.124 Y151.599 E.00167
; LINE_WIDTH: 0.29882
G3 X102.94 Y150.608 I.612 J-1.935 E.01789
G1 X102.896 Y150.519 E.00112
; LINE_WIDTH: 0.263391
G3 X102.739 Y150.027 I1.839 J-.857 E.00511
G1 X102.738 Y150.021 E.00006
; LINE_WIDTH: 0.188225
G3 X102.71 Y149.795 I2.461 J-.412 E.00155
G1 X102.701 Y131.489 E.12438
; LINE_WIDTH: 0.201414
G1 X102.724 Y131.063 E.00313
; LINE_WIDTH: 0.250014
G3 X102.827 Y130.647 I2.022 J.278 E.004
; LINE_WIDTH: 0.298647
G3 X103.498 Y129.727 I1.921 J.697 E.01302
G1 X103.767 Y129.553 E.00362
G1 X104.026 Y129.434 E.00322
; LINE_WIDTH: 0.251379
G1 X104.073 Y129.419 E.00046
; OBJECT_ID: 116
; WIPE_START
G1 X104.201 Y129.378 E-.05111
G1 X104.458 Y129.325 E-.09947
G1 X104.633 Y129.309 E-.06698
G1 X106.061 Y129.308 E-.54244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.571 Y127.948 Z.7 F42000
G1 X124.842 Y125.907 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.814 Y125.914 E.00046
G3 X123.697 Y121.499 I-.916 J-2.117 E.12968
G1 X123.86 Y121.491 E.00264
G3 X125.214 Y125.692 I.039 J2.306 E.09557
G1 X124.894 Y125.877 E.006
; WIPE_START
M204 S6000
G1 X124.814 Y125.914 E-.03335
G1 X124.381 Y126.06 E-.17372
G1 X123.925 Y126.11 E-.1743
G1 X123.468 Y126.069 E-.17447
G1 X123.029 Y125.939 E-.174
G1 X122.959 Y125.902 E-.03015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.619 Y123.194 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.646 Y123.273 E.00136
G3 X123.897 Y121.011 I-2.739 J.526 E.22181
G1 X124.098 Y121.017 E.00327
G3 X126.528 Y122.846 I-.19 J2.782 E.05223
G1 X126.604 Y123.136 E.00488
M204 S10000
G1 X126.379 Y123.2 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875187
G1 F15000
M204 S6000
G1 X126.385 Y123.224 E.00007
G3 X121.382 Y124.184 I-2.485 J.568 E.02203
G1 X121.353 Y123.875 E.00084
G3 X126.326 Y123.009 I2.547 J-.084 E.01964
G1 X126.363 Y123.142 E.00037
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.385 Y123.224 E-.03199
G1 X126.437 Y123.525 E-.1163
G1 X126.45 Y123.724 E-.07569
G1 X126.438 Y124.052 E-.12455
G1 X126.397 Y124.324 E-.10483
G1 X126.345 Y124.529 E-.08036
G1 X126.157 Y124.99 E-.18888
G1 X126.108 Y125.075 E-.0374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 4/95
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S196.35
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.7 I.734 J.971 P1  F42000
G1 X150.996 Y106.256 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.347 Y106.658 I-.044 J.393 E.01023
G1 X151.346 Y121.163 E.25326
G3 X150.942 Y121.547 I-.391 J-.007 E.01084
G1 X136.437 Y121.546 E.25326
G3 X136.053 Y121.133 I.007 J-.392 E.011
G1 X136.054 Y106.637 E.2531
G3 X136.437 Y106.254 I.393 J.01 E.01043
G1 X150.936 Y106.256 E.25317
M204 S10000
G1 X151.038 Y105.829 F42000
G1 F6000
M204 S6000
G3 X151.776 Y106.651 I-.091 J.824 E.02111
G1 X151.775 Y121.181 E.25369
G3 X150.949 Y121.976 I-.819 J-.025 E.02217
G1 X136.419 Y121.975 E.25369
G3 X135.624 Y121.144 I.025 J-.819 E.02226
G1 X135.625 Y106.619 E.2536
G3 X136.419 Y105.825 I.826 J.032 E.02156
G1 X150.978 Y105.829 E.25419
M204 S250
G1 X151.098 Y105.422 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.428 Y105.509 E.00555
G3 X151.707 Y105.665 I-.511 J1.238 E.0052
G1 X151.71 Y105.667 E.00006
G3 X152.189 Y106.644 I-.806 J1.001 E.01825
G1 X152.188 Y121.197 E.23631
G3 X151.935 Y121.907 I-1.259 J-.049 E.01243
G1 X151.933 Y121.91 E.00005
G3 X150.956 Y122.389 I-1.001 J-.806 E.01825
G1 X136.403 Y122.388 E.23631
G3 X135.695 Y122.137 I.042 J-1.239 E.01239
G1 X135.693 Y122.135 E.00005
G3 X135.211 Y121.154 I.784 J-.994 E.01836
G1 X135.212 Y106.603 E.23628
G3 X135.465 Y105.893 I1.259 J.049 E.01243
G1 X135.467 Y105.89 E.00006
G3 X136.403 Y105.412 I.981 J.765 E.01761
G1 X151.038 Y105.417 E.23765
; WIPE_START
M204 S6000
G1 X151.428 Y105.509 E-.15234
G1 X151.707 Y105.665 E-.1215
G1 X151.71 Y105.667 E-.00137
G1 X151.884 Y105.83 E-.09037
G1 X152.062 Y106.097 E-.12229
G1 X152.148 Y106.325 E-.09222
G1 X152.189 Y106.644 E-.12248
G1 X152.189 Y106.795 E-.05744
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.215 Y121.375 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42522
G1 F15000
M204 S6000
G1 X150.995 Y120.595 E.01815
G1 X150.995 Y120.024 E.00939
G1 X149.823 Y121.195 E.02726
G1 X149.252 Y121.195 E.00939
G1 X150.995 Y119.453 E.04054
G1 X150.995 Y118.882 E.00939
G1 X148.681 Y121.195 E.05383
G1 X148.11 Y121.195 E.00939
G1 X150.995 Y118.311 E.06711
G1 X150.995 Y117.74 E.00939
G1 X147.539 Y121.195 E.0804
G1 X146.968 Y121.195 E.00939
G1 X150.995 Y117.169 E.09368
G1 X150.995 Y116.598 E.00939
G1 X146.397 Y121.195 E.10696
G1 X145.826 Y121.195 E.00939
G1 X150.995 Y116.027 E.12025
G1 X150.995 Y115.456 E.00939
G1 X145.255 Y121.195 E.13353
G1 X144.684 Y121.195 E.00939
G1 X150.995 Y114.885 E.14682
G1 X150.995 Y114.313 E.00939
G1 X144.113 Y121.195 E.1601
G1 X143.542 Y121.195 E.00939
G1 X150.995 Y113.742 E.17339
G1 X150.995 Y113.171 E.00939
G1 X142.971 Y121.195 E.18667
G1 X142.4 Y121.195 E.00939
G1 X150.995 Y112.6 E.19995
G1 X150.995 Y112.029 E.00939
G1 X141.83 Y121.195 E.21324
G1 X141.259 Y121.195 E.00939
G1 X150.995 Y111.458 E.22652
G1 X150.995 Y110.887 E.00939
G1 X140.688 Y121.195 E.23981
G1 X140.117 Y121.195 E.00939
G1 X150.995 Y110.316 E.25309
G1 X150.995 Y109.745 E.00939
G1 X139.546 Y121.195 E.26637
G1 X138.975 Y121.195 E.00939
G1 X150.995 Y109.174 E.27966
G1 X150.995 Y108.603 E.00939
G1 X138.404 Y121.195 E.29294
G1 X137.833 Y121.195 E.00939
G1 X150.995 Y108.032 E.30623
G1 X150.995 Y107.461 E.00939
G1 X137.262 Y121.195 E.31951
G1 X136.691 Y121.195 E.00939
G1 X150.996 Y106.89 E.3328
G2 X150.984 Y106.626 I-.715 J-.101 E.00438
G2 X150.951 Y106.607 I-.038 J.03 E.00063
G1 X150.707 Y106.607 E.00402
G1 X136.404 Y120.91 E.33275
G1 X136.404 Y120.339 E.00939
G1 X150.136 Y106.607 E.31946
G1 X149.565 Y106.607 E.00939
G1 X136.405 Y119.768 E.30618
G1 X136.405 Y119.197 E.00939
G1 X148.994 Y106.607 E.2929
G1 X148.423 Y106.607 E.00939
G1 X136.405 Y118.626 E.27962
G1 X136.405 Y118.055 E.00939
G1 X147.853 Y106.607 E.26633
G1 X147.282 Y106.607 E.00939
G1 X136.405 Y117.484 E.25305
G1 X136.405 Y116.913 E.00939
G1 X146.711 Y106.607 E.23977
G1 X146.14 Y106.607 E.00939
G1 X136.405 Y116.342 E.22648
G1 X136.405 Y115.771 E.00939
G1 X145.569 Y106.607 E.2132
G1 X144.998 Y106.607 E.00939
G1 X136.405 Y115.2 E.19992
G1 X136.405 Y114.629 E.00939
G1 X144.427 Y106.606 E.18664
G1 X143.856 Y106.606 E.00939
G1 X136.405 Y114.058 E.17335
G1 X136.405 Y113.487 E.00939
G1 X143.285 Y106.606 E.16007
G1 X142.714 Y106.606 E.00939
G1 X136.405 Y112.916 E.14679
G1 X136.405 Y112.345 E.00939
G1 X142.143 Y106.606 E.1335
G1 X141.572 Y106.606 E.00939
G1 X136.405 Y111.774 E.12022
G1 X136.405 Y111.202 E.00939
G1 X141.002 Y106.606 E.10694
G1 X140.431 Y106.606 E.00939
G1 X136.405 Y110.631 E.09365
G1 X136.405 Y110.06 E.00939
G1 X139.86 Y106.606 E.08037
G1 X139.289 Y106.606 E.00939
G1 X136.405 Y109.489 E.06709
G1 X136.405 Y108.918 E.00939
G1 X138.718 Y106.606 E.05381
G1 X138.147 Y106.606 E.00939
G1 X136.405 Y108.347 E.04052
G1 X136.405 Y107.776 E.00939
G1 X137.576 Y106.605 E.02724
G1 X137.005 Y106.605 E.00939
G1 X136.226 Y107.385 E.01813
; OBJECT_ID: 105
; WIPE_START
G1 X137.005 Y106.605 E-.41878
G1 X137.576 Y106.605 E-.21695
G1 X137.345 Y106.837 E-.12427
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X139.47 Y114.167 Z.8 F42000
G1 X148.802 Y146.36 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z.8 F42000
G1 X151.648 Y134.698 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.74 Y150.507 E.20611
G3 X151.979 Y151.148 I-.744 J-.111 E.01898
G1 X129.421 Y151.148 E.39387
G3 X128.653 Y150.439 I-.013 J-.756 E.02014
G1 X128.652 Y138.702 E.20494
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
M73 P32 R19
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.756 J-.013 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G1 X151.979 Y127.052 E.02753
G3 X152.747 Y127.771 I.018 J.75 E.02035
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.0192
G1 X153.174 Y150.462 E.21281
G3 X151.988 Y151.576 I-1.179 J-.066 E.03136
G1 X129.412 Y151.576 E.39417
G3 X128.225 Y150.452 I-.003 J-1.186 E.0315
G1 X128.224 Y138.274 E.21264
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.1277
G3 X129.348 Y126.625 I1.187 J-.002 E.0315
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.988 Y126.624 E.03516
G3 X153.175 Y127.754 I.009 J1.179 E.03166
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.588 Y150.479 E.2049
G3 X151.996 Y151.99 I-1.594 J-.085 E.0393
G1 X129.404 Y151.99 E.36684
G3 X127.811 Y150.464 I.007 J-1.602 E.0395
G1 X127.81 Y137.86 E.20467
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12562
G3 X129.335 Y126.211 I1.603 J.008 E.03949
G1 X131.84 Y126.21 E.04067
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.996 Y126.21 E.03955
G3 X153.589 Y127.738 I.001 J1.593 E.03959
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.795 Y132.467 Z.8 F42000
G1 X144.732 Y130.631 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X146.446 Y130.631 E.02993
G3 X145.481 Y129.444 I1.211 J-1.971 E.02723
G1 X145.39 Y128.755 E.01215
G3 X146.166 Y127.719 I1.708 J.471 E.02314
G1 X146.031 Y127.719 E.00236
G1 X146.031 Y127.419 E.00524
G1 X144.274 Y127.419 E.03068
G1 X144.19 Y127.72 E.00547
G3 X143.115 Y128.755 I-3.535 J-2.596 E.02617
G1 X142.722 Y129.444 E.01386
G1 X142.631 Y130.134 E.01215
G2 X142.853 Y130.631 I.683 J-.006 E.00978
G1 X140.928 Y130.631 E.03359
G3 X139.963 Y129.444 I1.211 J-1.971 E.02723
G1 X139.872 Y128.755 E.01215
G1 X139.969 Y128.41 E.00625
G3 X140.994 Y127.419 I3.384 J2.473 E.02501
G1 X138.757 Y127.419 E.03906
G1 X138.672 Y127.72 E.00547
G3 X137.598 Y128.755 I-3.535 J-2.596 E.02617
G1 X137.204 Y129.444 E.01386
G1 X137.114 Y130.134 E.01215
G2 X137.335 Y130.631 I.683 J-.006 E.00978
G1 X135.411 Y130.631 E.03359
G3 X134.446 Y129.444 I1.211 J-1.971 E.02723
G1 X134.355 Y128.755 E.01215
G3 X135.131 Y127.719 I1.708 J.471 E.02314
G1 X133.155 Y127.719 E.03451
G3 X132.08 Y128.755 I-4.114 J-3.192 E.02616
G1 X131.687 Y129.444 E.01386
G1 X131.596 Y130.134 E.01215
G2 X132.231 Y131.047 I1.542 J-.395 E.01985
G1 X132.231 Y134.141 E.05401
G1 X132.08 Y134.272 E.0035
G1 X131.687 Y134.962 E.01386
G1 X131.596 Y135.652 E.01215
G2 X132.231 Y136.565 I1.542 J-.395 E.01985
G1 X132.231 Y139.658 E.05401
G1 X132.08 Y139.79 E.0035
G1 X131.687 Y140.479 E.01386
G1 X131.596 Y141.169 E.01215
G2 X132.231 Y142.083 I1.542 J-.395 E.01985
G1 X132.231 Y145.176 E.05401
G1 X132.08 Y145.307 E.0035
G1 X131.687 Y145.997 E.01386
G1 X131.596 Y146.687 E.01215
G1 X131.693 Y147.032 E.00625
G2 X132.767 Y148.066 I3.535 J-2.596 E.02617
G1 X133.16 Y148.756 E.01386
G1 X133.251 Y149.446 E.01215
G1 X133.155 Y149.79 E.00625
G3 X132.13 Y150.781 I-3.384 J-2.473 E.02501
G1 X134.367 Y150.781 E.03906
G1 X134.452 Y150.48 E.00546
G3 X135.526 Y149.446 I3.535 J2.596 E.02617
G1 X135.919 Y148.756 E.01386
G1 X136.01 Y148.066 E.01215
G2 X135.789 Y147.569 I-.683 J.006 E.00978
G1 X137.713 Y147.569 E.03359
G3 X138.678 Y148.756 I-1.212 J1.971 E.02723
G1 X138.769 Y149.446 E.01215
G1 X138.672 Y149.79 E.00625
G3 X137.648 Y150.781 I-3.384 J-2.473 E.02501
G1 X139.885 Y150.781 E.03906
G1 X139.969 Y150.48 E.00546
G3 X141.044 Y149.446 I3.535 J2.596 E.02617
G1 X141.437 Y148.756 E.01386
G1 X141.528 Y148.066 E.01215
G2 X141.306 Y147.569 I-.683 J.006 E.00978
G1 X143.23 Y147.569 E.03359
G3 X144.196 Y148.756 I-1.212 J1.971 E.02723
G1 X144.287 Y149.446 E.01215
G1 X144.19 Y149.79 E.00625
G3 X143.165 Y150.781 I-3.384 J-2.473 E.02501
G1 X145.402 Y150.781 E.03906
G1 X145.487 Y150.48 E.00546
G3 X146.561 Y149.446 I3.535 J2.597 E.02617
G1 X146.955 Y148.756 E.01386
G1 X147.045 Y148.066 E.01215
G2 X146.824 Y147.569 I-.683 J.006 E.00978
G1 X148.748 Y147.569 E.03359
G3 X149.713 Y148.756 I-1.211 J1.971 E.02723
G1 X149.804 Y149.446 E.01215
G1 X149.707 Y149.79 E.00625
G3 X148.683 Y150.781 I-3.384 J-2.473 E.02501
G1 X150.92 Y150.781 E.03906
G1 X151.004 Y150.48 E.00546
G3 X152.079 Y149.446 I3.535 J2.596 E.02617
G1 X152.379 Y148.919 E.01059
G1 X152.38 Y147.615 E.02276
G2 X151.392 Y146.687 I-3.184 J2.399 E.02379
G1 X150.998 Y145.997 E.01386
G1 X150.908 Y145.307 E.01215
G1 X151.004 Y144.963 E.00625
G3 X152.079 Y143.928 I3.535 J2.596 E.02617
G1 X152.38 Y143.399 E.01063
G1 X152.381 Y142.099 E.0227
G2 X151.392 Y141.169 I-3.189 J2.401 E.02382
G1 X150.998 Y140.479 E.01386
G1 X150.908 Y139.79 E.01215
G3 X151.322 Y139.069 I1.443 J.349 E.01472
G1 X151.281 Y139.069 E.00071
G1 X151.281 Y135.458 E.06303
G3 X150.908 Y134.272 I1.268 J-1.052 E.02227
G1 X151.004 Y133.927 E.00625
G3 X152.079 Y132.893 I3.535 J2.596 E.02617
G1 X152.381 Y132.363 E.01064
G1 X152.381 Y131.064 E.02269
G2 X151.392 Y130.134 I-3.188 J2.401 E.02382
G1 X150.998 Y129.444 E.01386
G1 X150.908 Y128.755 E.01215
G1 X151.004 Y128.41 E.00625
G3 X152.017 Y127.429 I3.349 J2.445 E.02474
G1 X150.769 Y127.419 E.02181
G1 X150.769 Y127.719 E.00524
G1 X149.708 Y127.719 E.01852
G3 X148.633 Y128.755 I-4.114 J-3.192 E.02616
G1 X148.24 Y129.444 E.01386
G1 X148.149 Y130.134 E.01215
G2 X148.37 Y130.631 I.683 J-.006 E.00978
G1 X149.169 Y130.631 E.01394
G1 X149.169 Y131.382 E.0131
G1 X149.32 Y131.513 E.00351
G1 X149.713 Y132.203 E.01386
G1 X149.804 Y132.893 E.01215
G3 X149.169 Y133.806 I-1.542 J-.395 E.01985
G1 X149.169 Y136.899 E.054
G1 X149.32 Y137.031 E.00351
G1 X149.713 Y137.721 E.01386
G1 X149.804 Y138.41 E.01215
G3 X149.169 Y139.324 I-1.542 J-.395 E.01985
G1 X149.169 Y142.417 E.054
G1 X149.32 Y142.549 E.00351
G1 X149.713 Y143.238 E.01386
G1 X149.804 Y143.928 E.01215
G3 X149.169 Y144.842 I-1.542 J-.395 E.01985
G1 X149.169 Y146.556 E.02993
; WIPE_START
G1 X149.169 Y144.842 E-.65138
G1 X149.365 Y144.634 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.878 Y146.116 Z.8 F42000
G1 X129.02 Y148.661 Z.8
G1 Z.4
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X129.02 Y150.375 E.02993
G3 X130.009 Y149.446 I3.187 J2.4 E.0238
G1 X130.402 Y148.756 E.01386
G1 X130.493 Y148.066 E.01215
G2 X130.114 Y147.377 I-.982 J.09 E.01413
G1 X129.321 Y146.687 E.01835
G1 X129.019 Y146.158 E.01064
G1 X129.019 Y144.858 E.02269
G3 X130.009 Y143.928 I3.19 J2.402 E.02382
G1 X130.402 Y143.238 E.01386
G1 X130.493 Y142.549 E.01215
G2 X130.114 Y141.859 I-.982 J.09 E.01413
G1 X129.321 Y141.169 E.01835
G1 X129.019 Y140.639 E.01066
G1 X129.019 Y139.341 E.02266
G3 X129.252 Y139.069 I.906 J.538 E.00629
G1 X130.119 Y139.069 E.01514
G1 X130.119 Y138.217 E.01486
G2 X130.396 Y136.686 I-1.46 J-1.055 E.0281
G1 X130.119 Y136.346 E.00766
G1 X130.119 Y134.331 E.03518
G1 X129.019 Y134.331 E.01921
G1 X129.019 Y133.824 E.00886
G3 X130.009 Y132.893 I3.193 J2.403 E.02384
G1 X130.402 Y132.203 E.01386
G1 X130.493 Y131.513 E.01215
G2 X130.114 Y130.824 I-.982 J.09 E.01413
G1 X129.321 Y130.134 E.01835
G1 X129.019 Y129.603 E.01067
G1 X129.019 Y128.306 E.02264
G3 X129.957 Y127.42 I3.038 J2.278 E.02266
G1 X130.631 Y127.419 E.01177
G1 X130.631 Y127.719 E.00523
G1 X131.372 Y127.719 E.01294
; OBJECT_ID: 94
; WIPE_START
G1 X130.631 Y127.719 E-.28156
G1 X130.631 Y127.419 E-.11372
G1 X129.957 Y127.42 E-.2561
G1 X129.742 Y127.607 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.886 Y132.503 Z.8 F42000
G1 X103.04 Y149.932 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.919 J.012 E.04738
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.911 J-.003 E.04746
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.99 I.005 J-1.911 E.0406
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15954
G1 X102.991 Y147.995 E-.60046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z.8 F42000
G1 X104.087 Y129.071 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00697
G1 X123.282 Y129.012 E.30479
G1 X123.457 Y129.025 E.00285
G3 X125.39 Y131.204 I-.263 J2.179 E.05171
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.30338
G3 X104.033 Y129.088 I2.207 J.104 E.04502
M204 S10000
G1 X104.114 Y129.411 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.250869
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00331
; LINE_WIDTH: 0.187958
G3 X104.64 Y129.308 I.348 J2.819 E.00125
G1 X122.983 Y129.302 E.12444
G1 X123.27 Y129.317 E.00195
; LINE_WIDTH: 0.243435
G3 X123.589 Y129.375 I-.179 J1.872 E.00293
G1 X123.705 Y129.41 E.0011
; LINE_WIDTH: 0.298721
G3 X124.936 Y130.551 I-.644 J1.93 E.01955
; LINE_WIDTH: 0.260108
G3 X125.06 Y130.973 I-2.066 J.839 E.00428
; LINE_WIDTH: 0.188509
G1 X125.099 Y131.417 E.00304
G1 X125.099 Y149.505 E.12311
G3 X125.077 Y149.925 I-4.27 J-.018 E.00286
; LINE_WIDTH: 0.249386
G3 X124.973 Y150.353 I-2.188 J-.302 E.0041
; LINE_WIDTH: 0.300339
G3 X124.043 Y151.442 I-1.91 J-.69 E.01663
G1 X123.913 Y151.508 E.00166
; LINE_WIDTH: 0.263483
G3 X123.427 Y151.661 I-.928 J-2.104 E.00503
; LINE_WIDTH: 0.188509
G1 X122.983 Y151.699 E.00303
G1 X104.892 Y151.699 E.12313
G3 X104.475 Y151.677 I-.003 J-3.809 E.00284
; LINE_WIDTH: 0.249576
G3 X104.044 Y151.572 I.26 J-2.015 E.00413
; LINE_WIDTH: 0.300396
G3 X102.94 Y150.609 I.693 J-1.908 E.01704
G1 X102.896 Y150.519 E.00113
; LINE_WIDTH: 0.263401
G3 X102.738 Y150.021 I1.841 J-.859 E.00517
; LINE_WIDTH: 0.188225
G1 X102.701 Y149.583 E.00298
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.196292
G1 X102.714 Y131.155 E.00238
; LINE_WIDTH: 0.239944
G3 X102.799 Y130.731 I1.956 J.17 E.00386
; LINE_WIDTH: 0.296933
G3 X104.04 Y129.43 I1.934 J.602 E.02091
; LINE_WIDTH: 0.250869
G1 X104.055 Y129.426 E.00014
; OBJECT_ID: 116
; WIPE_START
G1 X104.457 Y129.325 E-.15745
G1 X104.64 Y129.308 E-.06974
G1 X106.042 Y129.308 E-.53281
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.553 Y127.953 Z.8 F42000
G1 X124.812 Y125.923 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.38 Y126.059 E.00736
G3 X123.697 Y121.499 I-.483 J-2.259 E.12246
G1 X123.852 Y121.491 E.00252
G3 X124.866 Y125.897 I.046 J2.309 E.10233
; WIPE_START
M204 S6000
G1 X124.38 Y126.059 E-.19477
G1 X124.018 Y126.107 E-.13868
G1 X123.647 Y126.096 E-.14108
G1 X123.226 Y126.009 E-.1634
G1 X123.029 Y125.939 E-.07954
G1 X122.928 Y125.891 E-.04252
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.626 Y123.206 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.667 Y123.385 E.00299
G3 X123.907 Y121.011 I-2.758 J.415 E.22016
G1 X124.097 Y121.017 E.0031
G3 X126.621 Y123.146 I-.188 J2.783 E.05737
M204 S10000
G1 X126.384 Y123.217 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875682
G1 F15000
M204 S6000
G1 X126.385 Y123.22 E.00001
G3 X121.354 Y123.878 I-2.483 J.579 E.02293
G1 X121.354 Y123.875 E.00001
G3 X121.354 Y123.675 I3.341 J-.086 E.00054
G1 X121.365 Y123.544 E.00036
G3 X126.299 Y122.931 I2.537 J.255 E.0185
G1 X126.367 Y123.16 E.00064
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.385 Y123.22 E-.02385
G1 X126.423 Y123.422 E-.07815
G1 X126.45 Y123.722 E-.11439
G1 X126.448 Y123.926 E-.07747
G1 X126.389 Y124.36 E-.16652
G1 X126.241 Y124.815 E-.18191
G1 X126.09 Y125.086 E-.11771
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 5/95
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.734 J.97 P1  F42000
G1 X151.014 Y106.228 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.375 Y106.642 I-.046 J.404 E.01053
G1 X151.374 Y121.182 E.25387
G3 X150.95 Y121.575 I-.403 J-.009 E.01126
G1 X136.418 Y121.574 E.25374
G3 X136.025 Y121.149 I.009 J-.403 E.01128
G1 X136.026 Y106.618 E.25372
G3 X136.418 Y106.226 I.404 J.012 E.01068
G1 X150.954 Y106.228 E.2538
M204 S10000
G1 X151.056 Y105.801 F42000
G1 F6000
M204 S6000
G3 X151.804 Y106.635 I-.092 J.835 E.0214
G1 X151.803 Y121.199 E.25431
G3 X150.961 Y122.004 I-.831 J-.027 E.02253
G1 X136.401 Y122.003 E.25423
G3 X135.596 Y121.16 I.027 J-.831 E.02254
G1 X135.597 Y106.601 E.25422
G3 X136.4 Y105.797 I.838 J.034 E.0218
G1 X150.996 Y105.801 E.25484
M204 S250
G1 X151.108 Y105.391 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.335 Y105.439 E.00376
G3 X152.217 Y106.627 I-.376 J1.201 E.0257
G1 X152.216 Y121.216 E.2369
G3 X150.971 Y122.417 I-1.244 J-.044 E.03106
G1 X136.384 Y122.417 E.23687
G3 X135.183 Y121.171 I.044 J-1.244 E.03106
G1 X135.183 Y106.584 E.23687
G3 X136.384 Y105.384 I1.256 J.056 E.03025
G1 X151.048 Y105.389 E.23812
; WIPE_START
M204 S6000
G1 X151.335 Y105.439 E-.11054
G1 X151.563 Y105.53 E-.09347
G1 X151.732 Y105.64 E-.07666
G1 X151.91 Y105.806 E-.09241
G1 X152.03 Y105.968 E-.07648
G1 X152.138 Y106.187 E-.09288
G1 X152.201 Y106.422 E-.09267
G1 X152.217 Y106.627 E-.07813
G1 X152.217 Y106.75 E-.04677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.203 Y106.794 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42657
G1 F15000
M204 S6000
G1 X151.002 Y106.592 E.00469
G1 X150.96 Y106.579 E.00073
G1 X150.416 Y106.579 E.00898
G1 X151.024 Y107.187 E.01419
G1 X151.024 Y107.76 E.00946
M73 P33 R19
G1 X149.843 Y106.579 E.02757
G1 X149.27 Y106.579 E.00946
G1 X151.024 Y108.333 E.04094
G1 X151.024 Y108.906 E.00946
G1 X148.697 Y106.579 E.05431
G1 X148.124 Y106.579 E.00946
G1 X151.024 Y109.479 E.06769
G1 X151.024 Y110.051 E.00946
G1 X147.551 Y106.579 E.08106
G1 X146.978 Y106.579 E.00946
G1 X151.024 Y110.624 E.09444
G1 X151.024 Y111.197 E.00946
G1 X146.405 Y106.579 E.10781
G1 X145.832 Y106.578 E.00946
G1 X151.024 Y111.77 E.12119
G1 X151.023 Y112.343 E.00946
G1 X145.259 Y106.578 E.13456
G1 X144.686 Y106.578 E.00946
G1 X151.023 Y112.916 E.14793
G1 X151.023 Y113.489 E.00946
G1 X144.113 Y106.578 E.16131
G1 X143.54 Y106.578 E.00946
G1 X151.023 Y114.062 E.17468
G1 X151.023 Y114.634 E.00946
G1 X142.967 Y106.578 E.18806
G1 X142.394 Y106.578 E.00946
G1 X151.023 Y115.207 E.20143
G1 X151.023 Y115.78 E.00946
G1 X141.821 Y106.578 E.21481
G1 X141.248 Y106.578 E.00946
G1 X151.023 Y116.353 E.22818
G1 X151.023 Y116.926 E.00946
G1 X140.675 Y106.578 E.24156
G1 X140.102 Y106.578 E.00946
G1 X151.023 Y117.499 E.25493
G1 X151.023 Y118.072 E.00946
G1 X139.529 Y106.578 E.2683
G1 X138.956 Y106.577 E.00946
G1 X151.023 Y118.645 E.28168
G1 X151.023 Y119.218 E.00946
G1 X138.383 Y106.577 E.29505
G1 X137.81 Y106.577 E.00946
G1 X151.023 Y119.79 E.30843
G1 X151.023 Y120.363 E.00946
G1 X137.237 Y106.577 E.3218
G1 X136.664 Y106.577 E.00946
G1 X151.023 Y120.936 E.33518
G3 X151.01 Y121.197 I-.525 J.105 E.00435
G3 X150.923 Y121.224 I-.073 J-.08 E.00156
G1 X150.738 Y121.224 E.00306
G1 X136.377 Y106.863 E.33522
G1 X136.377 Y107.436 E.00946
G1 X150.165 Y121.224 E.32184
G1 X149.592 Y121.224 E.00946
G1 X136.377 Y108.009 E.30847
G1 X136.377 Y108.582 E.00946
G1 X149.019 Y121.224 E.2951
G1 X148.446 Y121.224 E.00946
G1 X136.377 Y109.155 E.28172
G1 X136.377 Y109.728 E.00946
G1 X147.873 Y121.224 E.26835
G1 X147.3 Y121.224 E.00946
G1 X136.377 Y110.3 E.25498
G1 X136.377 Y110.873 E.00946
G1 X146.727 Y121.224 E.2416
G1 X146.154 Y121.224 E.00946
G1 X136.377 Y111.446 E.22823
G1 X136.377 Y112.019 E.00946
G1 X145.581 Y121.224 E.21486
G1 X145.008 Y121.223 E.00946
G1 X136.377 Y112.592 E.20148
G1 X136.377 Y113.165 E.00946
G1 X144.435 Y121.223 E.18811
G1 X143.862 Y121.223 E.00946
G1 X136.377 Y113.738 E.17474
G1 X136.377 Y114.311 E.00946
G1 X143.289 Y121.223 E.16136
G1 X142.716 Y121.223 E.00946
G1 X136.377 Y114.883 E.14799
G1 X136.376 Y115.456 E.00946
G1 X142.144 Y121.223 E.13462
G1 X141.571 Y121.223 E.00946
G1 X136.376 Y116.029 E.12124
G1 X136.376 Y116.602 E.00946
G1 X140.998 Y121.223 E.10787
G1 X140.425 Y121.223 E.00946
G1 X136.376 Y117.175 E.0945
G1 X136.376 Y117.748 E.00946
G1 X139.852 Y121.223 E.08112
G1 X139.279 Y121.223 E.00946
G1 X136.376 Y118.321 E.06775
G1 X136.376 Y118.894 E.00946
G1 X138.706 Y121.223 E.05438
G1 X138.133 Y121.223 E.00946
G1 X136.376 Y119.466 E.041
G1 X136.376 Y120.039 E.00946
G1 X137.56 Y121.223 E.02763
G1 X136.987 Y121.223 E.00946
G1 X136.197 Y120.433 E.01844
; OBJECT_ID: 105
; WIPE_START
G1 X136.987 Y121.223 E-.42463
G1 X137.56 Y121.223 E-.21772
G1 X137.341 Y121.004 E-.11765
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X140.485 Y127.959 Z.9 F42000
G1 X148.802 Y146.36 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z.9 F42000
G1 X151.648 Y134.698 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.74 Y150.507 E.20612
G3 X151.979 Y151.148 I-.743 J-.11 E.01899
G1 X129.419 Y151.148 E.3939
G3 X128.653 Y150.429 I-.018 J-.748 E.02033
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.371 Y127.053 I.75 J-.018 E.02035
G1 X130.998 Y127.053 E.02841
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G1 X151.981 Y127.052 E.02756
G3 X152.747 Y127.771 I.014 J.752 E.0203
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.175 Y150.446 E.21254
G3 X151.988 Y151.576 I-1.177 J-.047 E.03166
G1 X129.411 Y151.576 E.39419
G3 X128.225 Y150.446 I-.011 J-1.177 E.03166
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.1277
G3 X129.354 Y126.625 I1.183 J-.006 E.03163
G1 X131.426 Y126.624 E.03619
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.989 Y126.624 E.03518
G3 X153.175 Y127.754 I.004 J1.183 E.03161
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.589 Y150.462 E.20464
G3 X151.996 Y151.99 I-1.59 J-.064 E.0396
G1 X129.404 Y151.99 E.36685
G3 X127.811 Y150.462 I-.003 J-1.591 E.0396
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.338 Y126.211 I1.599 J.005 E.03955
G1 X131.84 Y126.21 E.04063
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.996 Y126.21 E.03956
G3 X153.589 Y127.738 I-.005 J1.599 E.03955
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.901 Y134.331 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X151.281 Y134.331 E.01082
G1 X151.281 Y135.426 E.01911
G3 X150.862 Y133.927 I1.526 J-1.236 E.02794
G1 X151.125 Y133.582 E.00758
G1 X152.038 Y132.893 E.01997
G1 X152.381 Y132.381 E.01076
G1 X152.381 Y130.87 E.02638
G1 X151.433 Y130.134 E.02095
G1 X150.971 Y129.444 E.0145
G1 X150.811 Y128.755 E.01236
G3 X151.125 Y128.065 I.777 J-.063 E.01382
G1 X151.977 Y127.421 E.01864
G1 X150.769 Y127.419 E.0211
G1 X150.769 Y127.719 E.00523
G1 X149.85 Y127.719 E.01603
G1 X149.586 Y128.065 E.0076
G1 X148.674 Y128.755 E.01997
G1 X148.212 Y129.444 E.0145
G1 X148.052 Y130.134 E.01236
G2 X148.219 Y130.631 I.53 J.099 E.00957
G1 X146.573 Y130.631 E.02874
G3 X145.294 Y128.755 I1.295 J-2.258 E.04104
G3 X145.608 Y128.065 I.777 J-.063 E.01382
G1 X146.066 Y127.719 E.01003
G1 X146.031 Y127.419 E.00527
G1 X144.377 Y127.419 E.02889
G3 X144.069 Y128.065 I-.735 J.047 E.01305
G1 X143.156 Y128.755 E.01997
G1 X142.694 Y129.444 E.0145
G1 X142.535 Y130.134 E.01236
G2 X142.702 Y130.631 I.53 J.099 E.00957
G1 X141.056 Y130.631 E.02874
G3 X139.776 Y128.755 I1.295 J-2.258 E.04104
G3 X140.09 Y128.065 I.777 J-.063 E.01382
G1 X140.945 Y127.419 E.01871
G1 X138.859 Y127.419 E.03642
G3 X138.551 Y128.065 I-.734 J.047 E.01305
G1 X137.639 Y128.755 E.01997
G1 X137.177 Y129.444 E.0145
G1 X137.017 Y130.134 E.01236
G2 X137.184 Y130.631 I.53 J.099 E.00957
G1 X135.538 Y130.631 E.02874
G3 X134.258 Y128.755 I1.295 J-2.258 E.04104
G3 X134.572 Y128.065 I.777 J-.063 E.01382
G1 X135.031 Y127.719 E.01003
G1 X133.298 Y127.719 E.03026
G1 X133.034 Y128.065 E.0076
G1 X132.121 Y128.755 E.01997
G1 X131.659 Y129.444 E.0145
G1 X131.499 Y130.134 E.01236
G2 X132.231 Y131.139 I1.274 J-.158 E.02267
G1 X132.231 Y134.189 E.05324
G1 X131.659 Y134.962 E.01679
G1 X131.499 Y135.652 E.01236
G2 X132.231 Y136.657 I1.274 J-.158 E.02267
G1 X132.231 Y139.707 E.05324
G1 X131.659 Y140.479 E.01679
G1 X131.499 Y141.169 E.01236
G2 X132.231 Y142.175 I1.274 J-.158 E.02267
G1 X132.231 Y145.224 E.05324
G1 X131.659 Y145.997 E.01679
G1 X131.499 Y146.687 E.01236
G2 X131.814 Y147.377 I.777 J.063 E.01382
G1 X132.726 Y148.066 E.01997
G1 X133.188 Y148.756 E.0145
G1 X133.348 Y149.446 E.01236
G3 X133.034 Y150.135 I-.777 J.063 E.01382
G1 X132.179 Y150.781 E.01871
G1 X134.265 Y150.781 E.03642
G3 X134.572 Y150.135 I.734 J-.047 E.01305
G1 X135.485 Y149.446 E.01997
G1 X135.947 Y148.756 E.0145
G1 X136.107 Y148.066 E.01236
G2 X135.939 Y147.569 I-.531 J-.099 E.00957
G1 X137.585 Y147.569 E.02874
G3 X138.865 Y149.446 I-1.295 J2.258 E.04105
G3 X138.551 Y150.135 I-.777 J.063 E.01382
G1 X137.696 Y150.781 E.01871
G1 X139.782 Y150.781 E.03642
G3 X140.09 Y150.135 I.734 J-.047 E.01305
G1 X141.003 Y149.446 E.01997
G1 X141.465 Y148.756 E.0145
G1 X141.624 Y148.066 E.01236
G2 X141.457 Y147.569 I-.531 J-.099 E.00957
G1 X143.103 Y147.569 E.02874
G3 X144.383 Y149.446 I-1.295 J2.258 E.04105
G3 X144.069 Y150.135 I-.777 J.063 E.01382
G1 X143.214 Y150.781 E.01871
G1 X145.3 Y150.781 E.03642
G3 X145.608 Y150.135 I.734 J-.047 E.01305
G1 X146.52 Y149.446 E.01997
G1 X146.982 Y148.756 E.0145
G1 X147.142 Y148.066 E.01236
G2 X146.975 Y147.569 I-.531 J-.099 E.00957
G1 X148.621 Y147.569 E.02874
G3 X149.901 Y149.446 I-1.295 J2.258 E.04105
G3 X149.586 Y150.135 I-.777 J.063 E.01382
G1 X148.732 Y150.781 E.01871
G1 X150.818 Y150.781 E.03642
G3 X151.125 Y150.135 I.734 J-.047 E.01305
G1 X152.038 Y149.446 E.01997
G1 X152.38 Y148.935 E.01074
G1 X152.38 Y147.422 E.02641
G1 X151.433 Y146.687 E.02094
G1 X150.971 Y145.997 E.0145
G1 X150.811 Y145.307 E.01236
G3 X151.125 Y144.618 I.777 J-.063 E.01382
G1 X152.038 Y143.928 E.01997
G1 X152.381 Y143.416 E.01076
G1 X152.381 Y141.906 E.02638
G1 X151.433 Y141.169 E.02096
G1 X150.971 Y140.479 E.0145
G1 X150.811 Y139.79 E.01236
G3 X151.281 Y138.982 I1.088 J.093 E.01686
G1 X151.281 Y139.069 E.00151
G1 X152.381 Y139.069 E.0192
G1 X152.381 Y139.596 E.00922
; WIPE_START
G1 X152.381 Y139.069 E-.20058
G1 X151.281 Y139.069 E-.41794
G1 X151.281 Y138.982 E-.03285
G1 X151.089 Y139.194 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.169 Y133.144 Z.9 F42000
G1 Z.5
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X149.169 Y131.43 E.02993
M73 P34 R19
G1 X149.741 Y132.203 E.0168
G1 X149.901 Y132.893 E.01236
G3 X149.169 Y133.898 I-1.274 J-.158 E.02267
G1 X149.169 Y136.948 E.05324
G1 X149.741 Y137.721 E.0168
G1 X149.901 Y138.41 E.01236
G3 X149.169 Y139.416 I-1.274 J-.158 E.02267
G1 X149.169 Y142.465 E.05324
G1 X149.741 Y143.238 E.0168
G1 X149.901 Y143.928 E.01236
G3 X149.169 Y144.934 I-1.274 J-.158 E.02267
G1 X149.169 Y146.648 E.02993
; WIPE_START
G1 X149.169 Y144.934 E-.65138
G1 X149.397 Y144.761 E-.10862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.887 Y146.127 Z.9 F42000
G1 X129.02 Y148.467 Z.9
G1 Z.5
G1 E.8 F1800
G1 F16200
M204 S6000
G1 X129.02 Y150.181 E.02993
G1 X129.967 Y149.446 E.02094
G1 X130.43 Y148.756 E.0145
G1 X130.589 Y148.066 E.01236
G2 X130.275 Y147.377 I-.777 J-.063 E.01382
G1 X129.362 Y146.687 E.01997
G1 X129.019 Y146.175 E.01075
G1 X129.019 Y144.664 E.02638
G1 X129.967 Y143.928 E.02096
G1 X130.43 Y143.238 E.0145
G1 X130.589 Y142.549 E.01236
G2 X130.275 Y141.859 I-.777 J-.063 E.01382
G1 X129.362 Y141.169 E.01997
G1 X129.019 Y140.657 E.01077
G1 X129.019 Y139.069 E.02773
G1 X130.119 Y139.069 E.0192
G1 X130.119 Y138.185 E.01543
G2 X130.539 Y136.686 I-1.526 J-1.236 E.02794
G2 X130.119 Y136.223 I-1.045 J.526 E.01105
G1 X130.119 Y134.331 E.03303
G1 X129.019 Y134.331 E.01921
G1 X129.019 Y133.63 E.01225
G1 X129.967 Y132.893 E.02098
G1 X130.43 Y132.203 E.0145
G1 X130.589 Y131.513 E.01236
G2 X130.275 Y130.824 I-.777 J-.063 E.01382
G1 X129.362 Y130.134 E.01997
G1 X129.019 Y129.621 E.01078
G1 X129.019 Y128.112 E.02634
G1 X129.908 Y127.42 E.01969
G1 X130.631 Y127.419 E.01262
G1 X130.631 Y127.719 E.00522
G1 X131.323 Y127.719 E.01208
; OBJECT_ID: 94
; WIPE_START
G1 X130.631 Y127.719 E-.26295
G1 X130.631 Y127.419 E-.11372
G1 X129.908 Y127.42 E-.27471
G1 X129.683 Y127.595 E-.10862
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.834 Y132.499 Z.9 F42000
G1 X103.041 Y149.932 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.919 J.012 E.04738
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.006 E.04744
G1 X104.898 Y151.41 E.29353
G3 X103.054 Y149.99 I.003 J-1.911 E.04063
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15959
G1 X102.991 Y147.995 E-.60042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z.9 F42000
G1 X104.088 Y129.071 Z.9
M73 P34 R18
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.089 Y129.074 E.00005
G3 X104.512 Y129.012 I.529 J2.145 E.00695
G1 X123.281 Y129.012 E.30478
G1 X123.457 Y129.025 E.00287
G3 X125.39 Y131.204 I-.263 J2.179 E.05171
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.796 I.09 J-2.193 E.0545
G1 X102.412 Y131.114 E.30335
G3 X103.687 Y129.215 I2.207 J.104 E.03904
G1 X104.031 Y129.091 E.00594
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251382
G1 F15000
M204 S6000
G1 X104.201 Y129.378 E.0007
G1 X104.458 Y129.325 E.00245
; LINE_WIDTH: 0.18825
G3 X104.641 Y129.308 I.354 J2.889 E.00125
G1 X122.983 Y129.302 E.12465
G1 X123.415 Y129.337 E.00295
; LINE_WIDTH: 0.25452
G3 X123.75 Y129.426 I-.348 J1.977 E.00329
; LINE_WIDTH: 0.30026
G3 X124.901 Y130.474 I-.691 J1.916 E.01816
G1 X124.906 Y130.484 E.00012
; LINE_WIDTH: 0.263212
G3 X125.061 Y130.977 I-1.854 J.856 E.00511
; LINE_WIDTH: 0.188496
G3 X125.085 Y131.146 I-2.576 J.441 E.00116
G1 X125.099 Y131.417 E.00184
G1 X125.099 Y149.505 E.1231
G3 X125.076 Y149.929 I-4.224 J-.017 E.00289
; LINE_WIDTH: 0.249637
G3 X124.973 Y150.353 I-2.046 J-.272 E.00407
; LINE_WIDTH: 0.299601
G3 X123.848 Y151.536 I-1.917 J-.697 E.01903
; LINE_WIDTH: 0.260173
G3 X123.423 Y151.661 I-.841 J-2.071 E.00432
; LINE_WIDTH: 0.188496
G3 X123.254 Y151.685 I-.44 J-2.584 E.00117
G1 X122.983 Y151.699 E.00184
G1 X104.896 Y151.699 E.1231
G3 X104.471 Y151.676 I.019 J-4.273 E.0029
; LINE_WIDTH: 0.24942
G3 X104.05 Y151.574 I.249 J-1.946 E.00403
; LINE_WIDTH: 0.299634
G3 X102.898 Y150.526 I.684 J-1.908 E.01812
G1 X102.863 Y150.446 E.00099
; LINE_WIDTH: 0.25984
G3 X102.739 Y150.023 I2.033 J-.829 E.00429
; LINE_WIDTH: 0.188217
G3 X102.715 Y149.853 I2.542 J-.434 E.00116
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.205919
G3 X102.737 Y130.985 I3.442 J-.008 E.0038
; LINE_WIDTH: 0.254481
G3 X102.826 Y130.65 I1.945 J.339 E.00329
; LINE_WIDTH: 0.298619
G3 X103.875 Y129.498 I1.917 J.691 E.01806
G1 X104.026 Y129.434 E.00186
; LINE_WIDTH: 0.251382
G1 X104.073 Y129.419 E.00046
; OBJECT_ID: 116
; WIPE_START
G1 X104.201 Y129.378 E-.05111
G1 X104.458 Y129.325 E-.09939
G1 X104.641 Y129.308 E-.06987
G1 X106.061 Y129.308 E-.53964
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.572 Y127.954 Z.9 F42000
G1 X124.776 Y125.934 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.379 Y126.052 E.00674
G3 X123.697 Y121.499 I-.483 J-2.255 E.12231
G1 X123.844 Y121.491 E.0024
G3 X124.829 Y125.906 I.052 J2.306 E.1029
; WIPE_START
M204 S6000
G1 X124.379 Y126.052 E-.18
G1 X124.016 Y126.107 E-.13932
G1 X123.833 Y126.109 E-.06984
G1 X123.47 Y126.07 E-.13865
G1 X123.029 Y125.939 E-.17465
G1 X122.895 Y125.868 E-.05754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.629 Y123.22 Z.9 F42000
G1 Z.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.668 Y123.385 E.00275
G3 X123.917 Y121.011 I-2.758 J.415 E.22024
G1 X124.097 Y121.017 E.00293
G3 X126.624 Y123.16 I-.187 J2.782 E.05761
M204 S10000
G1 X126.379 Y123.232 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0874689
G1 F15000
M204 S6000
G1 X126.405 Y123.324 E.00026
G3 X121.353 Y123.88 I-2.504 J.476 E.02261
G1 X121.353 Y123.877 E.00001
G1 X121.355 Y123.676 E.00054
G3 X126.262 Y122.841 I2.546 J.125 E.01856
G1 X126.362 Y123.174 E.00094
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.405 Y123.324 E-.05927
G1 X126.45 Y123.83 E-.19298
G1 X126.396 Y124.331 E-.19139
G1 X126.242 Y124.811 E-.19156
G1 X126.083 Y125.098 E-.12479
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 6/95
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S193.8
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.9 I.735 J.97 P1  F42000
G1 X151.032 Y106.2 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.404 Y106.625 I-.047 J.416 E.01083
G1 X151.403 Y121.201 E.25449
G3 X150.967 Y121.604 I-.414 J-.011 E.01154
G1 X136.335 Y121.596 E.25549
G3 X135.996 Y121.166 I.076 J-.408 E.01044
G1 X135.997 Y106.599 E.25433
G3 X136.399 Y106.197 I.415 J.014 E.01093
G1 X150.972 Y106.2 E.25445
M204 S10000
G1 X151.074 Y105.773 F42000
G1 F6000
M204 S6000
G3 X151.832 Y106.618 I-.094 J.846 E.02169
G1 X151.831 Y121.219 E.25493
G3 X150.978 Y122.032 I-.842 J-.029 E.0228
G1 X136.382 Y122.031 E.25486
G3 X135.568 Y121.177 I.029 J-.842 E.02282
G1 X135.569 Y106.581 E.25484
G3 X136.381 Y105.769 I.849 J.036 E.02204
G1 X151.014 Y105.773 E.2555
M204 S250
G1 X151.103 Y105.361 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.115 Y105.361 E.00019
G3 X152.246 Y106.61 I-.14 J1.262 E.02992
G1 X152.245 Y121.236 E.23748
G3 X150.988 Y122.446 I-1.256 J-.046 E.03131
G1 X136.365 Y122.445 E.23746
G3 X135.154 Y121.188 I.046 J-1.256 E.03132
G1 X135.155 Y106.564 E.23746
G3 X136.364 Y105.355 I1.267 J.058 E.03047
G1 X151.043 Y105.361 E.23836
; WIPE_START
M204 S6000
G1 X151.115 Y105.361 E-.02734
G1 X151.356 Y105.408 E-.09332
G1 X151.586 Y105.504 E-.09445
G1 X151.756 Y105.614 E-.07717
G1 X151.935 Y105.782 E-.09334
G1 X152.056 Y105.945 E-.07704
G1 X152.165 Y106.165 E-.09317
G1 X152.229 Y106.403 E-.09366
G1 X152.246 Y106.61 E-.07922
G1 X152.246 Y106.693 E-.0313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.268 Y121.431 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42024
G1 F15000
M204 S6000
G1 X151.051 Y120.648 E.01801
G1 X151.051 Y120.084 E.00916
G1 X149.883 Y121.252 E.02684
G1 X149.319 Y121.252 E.00916
G1 X151.051 Y119.52 E.0398
G1 X151.051 Y118.956 E.00916
G1 X148.755 Y121.252 E.05276
G1 X148.191 Y121.252 E.00916
G1 X151.051 Y118.392 E.06572
G1 X151.051 Y117.828 E.00916
G1 X147.627 Y121.252 E.07868
G1 X147.063 Y121.252 E.00916
G1 X151.051 Y117.264 E.09164
G1 X151.051 Y116.7 E.00916
G1 X146.499 Y121.252 E.1046
G1 X145.935 Y121.252 E.00916
G1 X151.051 Y116.136 E.11755
G1 X151.052 Y115.572 E.00916
G1 X145.372 Y121.252 E.13051
G1 X144.808 Y121.252 E.00916
G1 X151.052 Y115.008 E.14347
G1 X151.052 Y114.444 E.00916
G1 X144.244 Y121.252 E.15643
G1 X143.68 Y121.252 E.00916
G1 X151.052 Y113.88 E.16939
G1 X151.052 Y113.316 E.00916
G1 X143.116 Y121.252 E.18235
G1 X142.552 Y121.252 E.00916
G1 X151.052 Y112.752 E.19531
G1 X151.052 Y112.188 E.00916
G1 X141.988 Y121.252 E.20826
G1 X141.424 Y121.251 E.00916
G1 X151.052 Y111.624 E.22122
G1 X151.052 Y111.06 E.00916
G1 X140.86 Y121.251 E.23418
G1 X140.296 Y121.251 E.00916
G1 X151.052 Y110.496 E.24714
G1 X151.052 Y109.932 E.00916
G1 X139.732 Y121.251 E.2601
G1 X139.168 Y121.251 E.00916
G1 X151.052 Y109.368 E.27306
G1 X151.052 Y108.804 E.00916
G1 X138.605 Y121.251 E.28602
G1 X138.041 Y121.251 E.00916
G1 X151.052 Y108.24 E.29897
G1 X151.052 Y107.676 E.00916
G1 X137.477 Y121.251 E.31193
G1 X136.913 Y121.251 E.00916
G1 X151.052 Y107.112 E.32489
G1 X151.052 Y106.655 E.00742
G2 X151.031 Y106.569 I-.121 J-.015 E.00147
G1 X136.372 Y121.228 E.33682
G3 X136.348 Y121.134 I.089 J-.073 E.00162
G1 X136.348 Y120.688 E.00725
G1 X150.485 Y106.551 E.32484
G1 X149.921 Y106.551 E.00916
G1 X136.348 Y120.124 E.31188
G1 X136.348 Y119.56 E.00916
G1 X149.357 Y106.551 E.29893
G1 X148.793 Y106.551 E.00916
G1 X136.348 Y118.996 E.28597
G1 X136.348 Y118.432 E.00916
G1 X148.23 Y106.551 E.27301
G1 X147.666 Y106.551 E.00916
G1 X136.348 Y117.868 E.26005
G1 X136.348 Y117.304 E.00916
G1 X147.102 Y106.55 E.2471
G1 X146.538 Y106.55 E.00916
G1 X136.348 Y116.74 E.23414
G1 X136.348 Y116.176 E.00916
G1 X145.974 Y106.55 E.22118
G1 X145.41 Y106.55 E.00916
G1 X136.348 Y115.612 E.20822
G1 X136.348 Y115.048 E.00916
G1 X144.846 Y106.55 E.19527
G1 X144.282 Y106.55 E.00916
G1 X136.348 Y114.484 E.18231
G1 X136.348 Y113.92 E.00916
G1 X143.719 Y106.55 E.16935
G1 X143.155 Y106.55 E.00916
G1 X136.348 Y113.356 E.15639
G1 X136.348 Y112.792 E.00916
G1 X142.591 Y106.55 E.14344
G1 X142.027 Y106.55 E.00916
G1 X136.348 Y112.228 E.13048
G1 X136.348 Y111.664 E.00916
G1 X141.463 Y106.55 E.11752
G1 X140.899 Y106.55 E.00916
G1 X136.349 Y111.1 E.10456
G1 X136.349 Y110.536 E.00916
G1 X140.335 Y106.549 E.09161
G1 X139.771 Y106.549 E.00916
G1 X136.349 Y109.972 E.07865
G1 X136.349 Y109.408 E.00916
G1 X139.208 Y106.549 E.06569
G1 X138.644 Y106.549 E.00916
G1 X136.349 Y108.844 E.05273
G1 X136.349 Y108.28 E.00916
G1 X138.08 Y106.549 E.03978
G1 X137.516 Y106.549 E.00916
G1 X136.349 Y107.716 E.02682
G1 X136.349 Y107.152 E.00916
G1 X137.131 Y106.37 E.01798
; OBJECT_ID: 105
; WIPE_START
G1 X136.349 Y107.152 E-.42053
G1 X136.349 Y107.716 E-.21432
G1 X136.582 Y107.483 E-.12515
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X138.87 Y114.764 Z1 F42000
G1 X148.802 Y146.36 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1 F42000
G1 X151.648 Y134.698 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.384 E.20397
G3 X151.979 Y151.148 I-.752 J.012 E.02114
G1 X129.419 Y151.148 E.39391
G3 X128.653 Y150.429 I-.009 J-.757 E.02026
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
M73 P35 R18
G3 X129.361 Y127.053 I.754 J-.015 E.02016
G1 X130.998 Y127.053 E.02858
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G1 X151.981 Y127.052 E.02757
G3 X152.747 Y127.771 I.006 J.761 E.02023
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.39 E.21156
G3 X151.987 Y151.576 I-1.182 J.004 E.03261
G1 X129.411 Y151.576 E.39419
G3 X128.225 Y150.446 I.001 J-1.189 E.03157
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.12771
G3 X129.348 Y126.625 I1.184 J-.005 E.03152
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.989 Y126.624 E.03519
G3 X153.175 Y127.754 I-.005 J1.193 E.03154
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.59 Y150.397 E.20357
G3 X151.996 Y151.99 I-1.597 J-.004 E.04063
G1 X129.404 Y151.99 E.36685
G3 X127.811 Y150.462 I.012 J-1.606 E.0395
G1 X127.81 Y137.86 E.20464
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.6 J.005 E.03952
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.996 Y126.21 E.03956
G3 X153.589 Y127.738 I-.016 J1.611 E.03948
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.453 Y134.604 Z1 F42000
G1 X129.075 Y127.782 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X129.066 Y134.284 E.10559
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.916 E.07198
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.397 E.18319
G1 X129.154 Y150.615 E.0038
G1 X129.377 Y150.724 E.00403
G1 X129.476 Y150.734 E.00162
G1 X151.958 Y150.734 E.36505
G1 X152.221 Y150.642 E.00454
G2 X152.334 Y150.304 I-.411 J-.325 E.00591
G1 X152.334 Y139.116 E.18167
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.822 E.10493
G1 X152.213 Y127.551 E.00482
G1 X151.904 Y127.467 E.00518
G1 X150.816 Y127.466 E.01768
G3 X150.751 Y127.714 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.396 Y127.467 E.0193
G1 X129.19 Y127.549 E.00359
G1 X129.102 Y127.728 E.00324
M204 S10000
G1 X145.85 Y128.062 F42000
G1 F12000
M204 S6000
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01383
G2 X129.464 Y133.886 I998.916 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.916 E.07198
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.334 E.1757
G1 X151.93 Y150.336 E.36477
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.891 E.09734
G2 X151.082 Y127.865 I-.711 J9.198 E.01385
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00794
G1 X146.184 Y128.164 E.07099
G1 X145.907 Y128.08 E.0047
M204 S10000
G1 X145.627 Y128.393 F42000
; LINE_WIDTH: 0.421565
G1 F12000
M204 S6000
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15839
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.959 Y139.09 E.0751
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.264 E.08515
G1 X151.305 Y128.264 E.00377
G1 X151.288 Y128.303 E.00069
G1 X150.616 Y128.563 E.01173
G1 X146.184 Y128.563 E.07226
G1 X145.684 Y128.41 E.00851
; WIPE_START
G1 X146.184 Y128.563 E-.19834
G1 X147.662 Y128.563 E-.56166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.203 Y136.176 Z1 F42000
G1 X149.016 Y147.616 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.784 E.27007
G1 X132.196 Y130.716 E.00112
G1 X132.293 Y130.606 E.00238
G1 X132.384 Y130.584 E.00151
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27007
G1 X149.157 Y147.557 E.00248
G1 X149.072 Y147.593 E.0015
M204 S10000
G1 X149.254 Y147.965 F42000
G1 F12000
M204 S6000
G1 X149.016 Y148.014 E.00394
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27007
G1 X149.565 Y147.654 E.00394
G1 X149.439 Y147.839 E.00364
G1 X149.303 Y147.931 E.00266
; WIPE_START
G1 X149.439 Y147.839 E-.06233
G1 X149.565 Y147.654 E-.08513
G1 X149.614 Y147.416 E-.09214
G1 X149.614 Y146.047 E-.52041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.824 Y141.074 Z1 F42000
G1 X131.447 Y130.443 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.42195
G1 F12000
M204 S6000
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.2714
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06038
G3 X150.013 Y139.732 I-327.131 J2.216 E.08563
G1 X150.013 Y147.416 E.1254
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.2714
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.1254
G3 X131.381 Y138.916 I10.144 J-.489 E.01331
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.437 Y130.502 E.00467
M204 S10000
G1 X145.404 Y128.723 F42000
; LINE_WIDTH: 0.423847
G1 F12000
M204 S6000
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15317
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.201 Y129.389 E.14759
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07192
G1 X150.616 Y128.961 E.00916
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.462 Y128.741 E.01241
M204 S10000
G1 X150.775 Y130.783 F42000
; Slow Down Start
; LINE_WIDTH: 0.34968
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X150.775 Y132.793 E.02688
; Slow Down End
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F12000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.319 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X151.139 Y140.254 F42000
; LINE_WIDTH: 0.41999
G1 F12000
M204 S6000
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.828 E.12322
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.314 E.14979
M204 S10000
G1 X150.775 Y140.547 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X150.764 Y147.663 E.09542
; Slow Down End
M204 S10000
G1 X149.323 Y149.162 F42000
; Slow Down Start
; LINE_WIDTH: 0.351064
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X149.016 Y149.175 E.00412
G1 X132.444 Y149.175 E.22256
; Slow Down End
M204 S10000
G1 X130.639 Y147.723 F42000
; Slow Down Start
; LINE_WIDTH: 0.350648
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09133
; Slow Down End
M204 S10000
G1 X130.707 Y148.142 F42000
; LINE_WIDTH: 0.468848
G1 F12000
M204 S6000
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.898 Y149.129 E.0044
; LINE_WIDTH: 0.418985
G1 X132.141 Y149.152 E.00395
; LINE_WIDTH: 0.373382
G1 X132.384 Y149.175 E.00349
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.483817
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.01289
G1 X130.741 Y148.192 E.01177
M204 S10000
G1 X130.625 Y132.853 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.625 Y130.844 E.02694
; Slow Down End
M204 S10000
G1 X131.377 Y129.352 F42000
; LINE_WIDTH: 0.40462
G1 F12000
M204 S6000
G1 X130.784 Y129.352 E.00927
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01347
; LINE_WIDTH: 0.39111
G1 X130.638 Y130.474 E.00467
; LINE_WIDTH: 0.373074
G1 X130.625 Y130.784 E.00445
G1 X130.706 Y130.173 E.00882
; LINE_WIDTH: 0.40462
G1 X130.993 Y129.664 E.00913
G1 X131.331 Y129.39 E.00679
M204 S10000
G1 X145.201 Y129.025 F42000
; Slow Down Start
; LINE_WIDTH: 0.35058
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X136.259 Y129.025 E.11992
; Slow Down End
; WIPE_START
G1 X138.259 Y129.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.934 Y135.714 Z1 F42000
G1 X149.323 Y149.162 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.39566
G1 F12000
M204 S6000
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.725 Y148.004 E.00259
; LINE_WIDTH: 0.43249
G1 X150.743 Y147.863 E.00238
; LINE_WIDTH: 0.395643
G1 X150.762 Y147.723 E.00216
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.622 Y149.113 E.00222
; LINE_WIDTH: 0.4325
G1 X149.502 Y149.132 E.00204
; LINE_WIDTH: 0.39566
G1 X149.382 Y149.152 E.00186
; OBJECT_ID: 94
; WIPE_START
G1 X149.502 Y149.132 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.871 Y149.264 Z1 F42000
G1 X103.041 Y149.932 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.013 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.99 I.005 J-1.911 E.04059
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.1597
G1 X102.991 Y147.995 E-.60031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1 F42000
G1 X104.088 Y129.071 Z1
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.089 Y129.074 E.00005
G3 X104.514 Y129.012 I.529 J2.145 E.00698
G1 X123.28 Y129.012 E.30472
G1 X123.457 Y129.025 E.00288
G3 X125.39 Y131.204 I-.263 J2.179 E.05171
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.193 E.05448
G1 X102.412 Y131.114 E.30337
G3 X103.685 Y129.216 I2.206 J.104 E.03901
G1 X104.031 Y129.091 E.00598
M204 S10000
G1 X104.129 Y129.402 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.250547
G1 F15000
M204 S6000
G1 X104.231 Y129.37 E.001
G3 X104.464 Y129.325 I.486 J1.885 E.00222
; LINE_WIDTH: 0.188049
G3 X104.642 Y129.308 I.317 J2.448 E.00121
G1 X122.983 Y129.302 E.12449
G3 X123.32 Y129.323 I-.041 J3.307 E.00229
; LINE_WIDTH: 0.248671
G3 X123.745 Y129.424 I-.291 J2.162 E.00405
; LINE_WIDTH: 0.30022
G3 X124.861 Y130.391 I-.683 J1.914 E.01716
G1 X124.904 Y130.481 E.00113
; LINE_WIDTH: 0.263564
G3 X125.061 Y130.973 I-1.932 J.884 E.00511
; LINE_WIDTH: 0.188527
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.508 E.12315
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.250352
G3 X125.013 Y150.23 I-2.266 J-.324 E.00281
G1 X124.971 Y150.36 E.00127
; LINE_WIDTH: 0.298754
G3 X123.779 Y151.564 I-1.906 J-.695 E.01975
; LINE_WIDTH: 0.252866
G3 X123.348 Y151.674 I-.733 J-1.964 E.0042
; LINE_WIDTH: 0.188338
M73 P36 R18
G1 X122.983 Y151.699 E.00248
G1 X104.892 Y151.699 E.12301
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.249754
G3 X104.046 Y151.573 I.262 J-1.997 E.00406
; LINE_WIDTH: 0.298421
G3 X102.898 Y150.526 I.695 J-1.916 E.01799
G1 X102.83 Y150.363 E.00199
; LINE_WIDTH: 0.249968
G3 X102.739 Y150.027 I2.102 J-.754 E.00324
G1 X102.724 Y149.926 E.00095
; LINE_WIDTH: 0.188009
G3 X102.71 Y149.794 I2.158 J-.285 E.0009
G1 X102.701 Y131.489 E.12422
; LINE_WIDTH: 0.197756
G1 X102.717 Y131.127 E.0026
; LINE_WIDTH: 0.242369
G3 X102.787 Y130.77 I2.21 J.25 E.00327
G1 X102.802 Y130.722 E.00045
; LINE_WIDTH: 0.29716
G3 X104.042 Y129.429 I1.941 J.621 E.02084
; LINE_WIDTH: 0.250547
G1 X104.071 Y129.42 E.00029
; OBJECT_ID: 116
; WIPE_START
G1 X104.231 Y129.37 E-.06336
G1 X104.464 Y129.325 E-.09023
G1 X104.642 Y129.308 E-.06795
G1 X106.059 Y129.308 E-.53846
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.57 Y127.956 Z1 F42000
G1 X124.739 Y125.946 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.383 Y126.06 E.00608
G3 X123.835 Y121.491 I-.474 J-2.26 E.12437
G1 X123.969 Y121.491 E.00219
G3 X124.818 Y125.923 I-.061 J2.309 E.10166
G1 X124.797 Y125.929 E.00036
; WIPE_START
M204 S6000
G1 X124.383 Y126.06 E-.16502
G1 X123.924 Y126.11 E-.17512
G1 X123.47 Y126.07 E-.17342
G1 X123.115 Y125.972 E-.13982
G1 X122.86 Y125.856 E-.10663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.63 Y123.233 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.683 Y123.495 E.00433
G3 X123.927 Y121.011 I-2.772 J.305 E.21861
G1 X124.097 Y121.017 E.00277
G3 X126.627 Y123.167 I-.186 J2.783 E.05775
G1 X126.628 Y123.173 E.0001
M204 S10000
G1 X126.383 Y123.245 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0873097
G1 F15000
M204 S6000
G1 X126.405 Y123.327 E.00023
G3 X121.445 Y124.48 I-2.505 J.47 E.0209
G1 X121.396 Y124.273 E.00057
G1 X121.353 Y123.875 E.00108
G3 X126.263 Y122.841 I2.548 J-.077 E.01906
G1 X126.366 Y123.188 E.00097
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.405 Y123.327 E-.05511
G1 X126.436 Y123.522 E-.07494
G1 X126.451 Y123.822 E-.11428
G1 X126.436 Y124.077 E-.09709
G1 X126.396 Y124.329 E-.0967
G1 X126.345 Y124.529 E-.07867
G1 X126.24 Y124.815 E-.11552
G1 X126.083 Y125.112 E-.12769
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 7/95
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.736 J.97 P1  F42000
G1 X151.05 Y106.171 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.432 Y106.609 I-.043 J.423 E.01116
G1 X151.424 Y121.285 E.25625
G3 X150.984 Y121.632 I-.423 J-.084 E.01065
G1 X136.315 Y121.624 E.25613
G3 X135.968 Y121.182 I.079 J-.419 E.01071
G1 X135.976 Y106.515 E.2561
G3 X136.38 Y106.169 I.416 J.078 E.01005
G1 X150.99 Y106.171 E.25509
M204 S10000
G1 X151.093 Y105.744 F42000
G1 F6000
M204 S6000
G3 X151.86 Y106.601 I-.095 J.858 E.02198
G1 X151.859 Y121.237 E.25556
G3 X150.995 Y122.06 I-.853 J-.031 E.02308
G1 X136.363 Y122.059 E.25548
G3 X135.54 Y121.194 I.031 J-.853 E.0231
G1 X135.541 Y106.563 E.25546
G3 X136.363 Y105.741 I.86 J.038 E.02228
G1 X151.033 Y105.744 E.25615
M204 S250
G1 X151.113 Y105.332 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.134 Y105.332 E.00034
G3 X152.274 Y106.594 I-.142 J1.274 E.03018
G1 X152.273 Y121.255 E.23807
G3 X151.005 Y122.474 I-1.267 J-.049 E.03156
G1 X136.345 Y122.473 E.23804
G3 X135.126 Y121.205 I.048 J-1.267 E.03157
G1 X135.127 Y106.545 E.23804
G3 X136.345 Y105.327 I1.279 J.061 E.03068
G1 X151.053 Y105.332 E.23882
; WIPE_START
M204 S6000
G1 X151.134 Y105.332 E-.03081
G1 X151.377 Y105.381 E-.0942
G1 X151.568 Y105.456 E-.07795
G1 X151.781 Y105.588 E-.09517
G1 X151.961 Y105.758 E-.09411
G1 X152.083 Y105.922 E-.07769
G1 X152.192 Y106.143 E-.09344
G1 X152.257 Y106.383 E-.09449
G1 X152.274 Y106.594 E-.08043
G1 X152.274 Y106.651 E-.0217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.26 Y107.314 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42157
G1 F15000
M204 S6000
G1 X150.468 Y106.523 E.01824
G1 X149.903 Y106.523 E.00923
G1 X151.08 Y107.7 E.02715
G1 X151.08 Y108.266 E.00922
G1 X149.337 Y106.523 E.0402
G1 X148.771 Y106.522 E.00923
G1 X151.08 Y108.832 E.05325
G1 X151.08 Y109.398 E.00922
G1 X148.205 Y106.522 E.06629
G1 X147.639 Y106.522 E.00923
G1 X151.08 Y109.964 E.07934
G1 X151.08 Y110.529 E.00922
G1 X147.073 Y106.522 E.09238
G1 X146.507 Y106.522 E.00923
G1 X151.08 Y111.095 E.10543
G1 X151.08 Y111.661 E.00922
G1 X145.941 Y106.522 E.11848
G1 X145.375 Y106.522 E.00923
G1 X151.08 Y112.227 E.13152
G1 X151.08 Y112.793 E.00922
G1 X144.809 Y106.522 E.14457
G1 X144.243 Y106.522 E.00923
G1 X151.08 Y113.358 E.15761
G1 X151.08 Y113.924 E.00922
G1 X143.677 Y106.522 E.17066
G1 X143.111 Y106.522 E.00923
G1 X151.08 Y114.49 E.18371
G1 X151.08 Y115.056 E.00922
G1 X142.546 Y106.522 E.19675
G1 X141.98 Y106.521 E.00923
G1 X151.08 Y115.622 E.2098
G1 X151.08 Y116.187 E.00922
G1 X141.414 Y106.521 E.22284
G1 X140.848 Y106.521 E.00923
G1 X151.08 Y116.753 E.23589
G1 X151.08 Y117.319 E.00922
G1 X140.282 Y106.521 E.24894
G1 X139.716 Y106.521 E.00923
G1 X151.08 Y117.885 E.26198
G1 X151.08 Y118.451 E.00922
G1 X139.15 Y106.521 E.27503
G1 X138.584 Y106.521 E.00923
G1 X151.079 Y119.016 E.28808
G1 X151.079 Y119.582 E.00922
G1 X138.018 Y106.521 E.30112
G1 X137.452 Y106.521 E.00923
G1 X151.079 Y120.148 E.31417
G1 X151.079 Y120.714 E.00922
G1 X136.886 Y106.521 E.32721
G1 X136.42 Y106.521 E.0076
G2 X136.346 Y106.546 I-.006 J.101 E.00131
G1 X151.052 Y121.252 E.33904
G3 X150.956 Y121.28 I-.078 J-.088 E.00168
G1 X150.514 Y121.28 E.0072
G1 X136.321 Y107.087 E.32723
G1 X136.321 Y107.653 E.00922
G1 X149.948 Y121.28 E.31418
G1 X149.382 Y121.28 E.00922
G1 X136.321 Y108.218 E.30114
G1 X136.32 Y108.784 E.00922
G1 X148.817 Y121.28 E.28809
G1 X148.251 Y121.28 E.00922
G1 X136.32 Y109.35 E.27505
G1 X136.32 Y109.916 E.00922
G1 X147.685 Y121.28 E.262
G1 X147.119 Y121.28 E.00923
G1 X136.32 Y110.482 E.24896
G1 X136.32 Y111.047 E.00922
G1 X146.553 Y121.28 E.23591
G1 X145.987 Y121.28 E.00922
G1 X136.32 Y111.613 E.22287
G1 X136.32 Y112.179 E.00922
G1 X145.421 Y121.28 E.20982
G1 X144.855 Y121.28 E.00922
G1 X136.32 Y112.745 E.19678
G1 X136.32 Y113.311 E.00922
G1 X144.29 Y121.28 E.18373
G1 X143.724 Y121.28 E.00922
G1 X136.32 Y113.876 E.17068
G1 X136.32 Y114.442 E.00922
G1 X143.158 Y121.28 E.15764
G1 X142.592 Y121.28 E.00922
G1 X136.32 Y115.008 E.14459
G1 X136.32 Y115.574 E.00922
G1 X142.026 Y121.28 E.13155
G1 X141.46 Y121.28 E.00923
G1 X136.32 Y116.14 E.1185
G1 X136.32 Y116.705 E.00922
G1 X140.894 Y121.28 E.10546
G1 X140.328 Y121.28 E.00922
G1 X136.32 Y117.271 E.09241
G1 X136.32 Y117.837 E.00922
G1 X139.762 Y121.28 E.07937
G1 X139.197 Y121.28 E.00922
G1 X136.32 Y118.403 E.06632
G1 X136.32 Y118.969 E.00922
G1 X138.631 Y121.28 E.05328
G1 X138.065 Y121.279 E.00923
G1 X136.32 Y119.534 E.04023
G1 X136.32 Y120.1 E.00922
G1 X137.499 Y121.279 E.02719
G1 X136.933 Y121.279 E.00922
G1 X136.14 Y120.487 E.01828
; OBJECT_ID: 105
; WIPE_START
G1 X136.933 Y121.279 E-.42605
G1 X137.499 Y121.279 E-.21503
G1 X137.278 Y121.058 E-.11891
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X140.441 Y128.004 Z1.1 F42000
G1 X148.802 Y146.36 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.1 F42000
G1 X151.648 Y134.698 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.383 E.20395
G3 X151.979 Y151.148 I-.751 J.015 E.02117
G1 X129.411 Y151.148 E.39404
G3 X128.653 Y150.429 I-.008 J-.75 E.02017
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.368 Y127.053 I.755 J-.013 E.02027
G1 X130.998 Y127.053 E.02845
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.019 Y127.053 I.793 J40.97 E.02823
G3 X152.747 Y127.771 I-.027 J.755 E.01961
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.39 E.21156
G3 X151.987 Y151.576 I-1.179 J.008 E.03265
G1 X129.406 Y151.576 E.39427
G3 X128.225 Y150.446 I-.003 J-1.179 E.03155
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.12771
G3 X129.353 Y126.625 I1.186 J-.002 E.03158
G1 X131.426 Y126.624 E.03621
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G3 X152.04 Y126.624 I1.01 J52.66 E.03608
G3 X153.175 Y127.754 I-.051 J1.187 E.03069
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
M73 P37 R18
G1 X153.59 Y150.397 E.20357
G3 X151.996 Y151.99 I-1.592 J.001 E.04066
G1 X129.402 Y151.99 E.36688
G3 X127.811 Y150.462 I.001 J-1.593 E.03955
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.337 Y126.211 I1.603 J.008 E.03952
G1 X131.84 Y126.21 E.04064
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G3 X152.06 Y126.211 I1.219 J63.434 E.0406
G3 X153.589 Y127.738 I-.075 J1.603 E.03848
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.1 F42000
G1 X132.384 Y149.175 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X132.184 Y147.416 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27007
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.207 Y147.472 E.0015
M204 S10000
G1 X131.786 Y147.416 F42000
G1 F15000
M204 S6000
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27007
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01116
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.798 Y147.475 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.131 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.306 Y128.263 E.00376
G1 X151.289 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.334 E.17569
G1 X151.916 Y150.336 E.36455
G1 X151.936 Y150.316 E.00045
G1 X151.936 Y139.514 E.1754
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.889 E.09737
G2 X151.083 Y127.864 I-.702 J9.42 E.01384
G1 X151.02 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01384
G2 X129.464 Y133.886 I1128.933 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.397 E.18319
G1 X129.147 Y150.606 E.00362
G2 X129.476 Y150.734 I.293 J-.262 E.00596
G1 X151.961 Y150.734 E.3651
G1 X152.214 Y150.644 E.00436
G1 X152.323 Y150.423 E.004
G1 X152.334 Y150.316 E.00174
G1 X152.334 Y139.116 E.18187
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.822 E.10494
G1 X152.259 Y127.609 E.00366
G1 X152.095 Y127.487 E.00332
G2 X150.816 Y127.466 I-1.001 J21.502 E.02078
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.401 Y127.467 E.01921
G1 X129.195 Y127.547 E.0036
G1 X129.083 Y127.72 E.00335
G1 X129.066 Y128.413 E.01125
G1 X129.066 Y134.284 E.09534
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09555
M204 S10000
G1 X150.762 Y147.723 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y149.116 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y148.024 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y147.903 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
M73 P37 R17
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.1 F42000
G1 X103.041 Y149.932 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00586
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.919 J.013 E.0462
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.084 J1.918 E.04624
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.006 E.04744
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.99 I.008 J-1.914 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15972
G1 X102.991 Y147.995 E-.60029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1.1 F42000
G1 X104.088 Y129.071 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.091 Y129.073 E.00006
G3 X104.514 Y129.012 I.527 J2.145 E.00695
G1 X123.279 Y129.012 E.30471
G1 X123.457 Y129.025 E.0029
G3 X125.39 Y131.204 I-.262 J2.179 E.05171
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.114 E.30338
G3 X103.687 Y129.215 I2.207 J.104 E.03905
G1 X104.032 Y129.091 E.00594
M204 S10000
G1 X104.11 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.250302
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00339
; LINE_WIDTH: 0.187431
G3 X104.633 Y129.309 I.309 J2.372 E.00115
G1 X122.983 Y129.302 E.12409
G3 X123.319 Y129.323 I-.04 J3.292 E.00228
; LINE_WIDTH: 0.248907
G3 X123.75 Y129.426 I-.293 J2.175 E.00411
; LINE_WIDTH: 0.300351
G3 X124.901 Y130.474 I-.692 J1.916 E.01816
; LINE_WIDTH: 0.263858
G3 X125.06 Y130.973 I-1.917 J.887 E.00518
; LINE_WIDTH: 0.188419
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.505 E.12304
G1 X125.083 Y149.873 E.00251
; LINE_WIDTH: 0.242242
G3 X125.013 Y150.23 I-2.198 J-.244 E.00327
G1 X124.999 Y150.275 E.00043
; LINE_WIDTH: 0.298922
G3 X123.926 Y151.502 I-1.951 J-.625 E.01895
; LINE_WIDTH: 0.263319
G3 X123.427 Y151.661 I-.873 J-1.872 E.00517
G1 X123.416 Y151.663 E.00012
; LINE_WIDTH: 0.188395
G1 X122.983 Y151.699 E.00295
G1 X104.892 Y151.699 E.12305
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.243643
G3 X104.214 Y151.625 I.191 J-1.924 E.00288
G1 X104.096 Y151.59 E.00112
; LINE_WIDTH: 0.299362
G3 X102.94 Y150.608 I.639 J-1.924 E.0176
G1 X102.893 Y150.514 E.00118
; LINE_WIDTH: 0.263114
G3 X102.777 Y150.195 I1.691 J-.797 E.00335
G1 X102.738 Y150.02 E.00176
; LINE_WIDTH: 0.188225
G3 X102.71 Y149.795 I2.428 J-.408 E.00155
G1 X102.701 Y131.489 E.12438
; LINE_WIDTH: 0.197756
G1 X102.717 Y131.127 E.0026
; LINE_WIDTH: 0.242403
G3 X102.787 Y130.77 I2.208 J.249 E.00327
G1 X102.802 Y130.721 E.00046
; LINE_WIDTH: 0.297072
G3 X104.043 Y129.428 I1.938 J.618 E.02084
; LINE_WIDTH: 0.250302
G1 X104.052 Y129.426 E.00009
; OBJECT_ID: 116
; WIPE_START
G1 X104.463 Y129.325 E-.16095
G1 X104.633 Y129.309 E-.06476
G1 X106.039 Y129.308 E-.5343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.552 Y127.961 Z1.1 F42000
G1 X124.701 Y125.961 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.34 Y126.062 E.0061
G3 X123.827 Y121.492 I-.431 J-2.265 E.12338
G1 X123.969 Y121.491 E.00231
G3 X124.768 Y125.936 I-.061 J2.305 E.10236
G1 X124.758 Y125.94 E.00017
; WIPE_START
M204 S6000
G1 X124.34 Y126.062 E-.16549
G1 X124.016 Y126.107 E-.12409
G1 X123.833 Y126.109 E-.06983
G1 X123.428 Y126.061 E-.1547
G1 X123.114 Y125.972 E-.12423
G1 X122.944 Y125.902 E-.06979
G1 X122.826 Y125.834 E-.05187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.635 Y123.249 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.651 Y123.273 E.00046
G3 X123.937 Y121.011 I-2.739 J.528 E.22246
G1 X124.097 Y121.017 E.0026
G3 X126.532 Y122.845 I-.185 J2.783 E.0523
G1 X126.62 Y123.191 E.00581
M204 S10000
G1 X126.379 Y123.24 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0874392
G1 F15000
M204 S6000
G1 X126.436 Y123.522 E.00077
G3 X121.39 Y124.236 I-2.535 J.271 E.02107
G1 X121.353 Y123.875 E.00097
G3 X126.345 Y123.068 I2.548 J-.082 E.01978
G1 X126.367 Y123.182 E.00031
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.436 Y123.522 E-.13197
G1 X126.448 Y123.927 E-.15396
G1 X126.415 Y124.227 E-.11482
G1 X126.361 Y124.471 E-.09503
G1 X126.202 Y124.901 E-.17415
G1 X126.079 Y125.104 E-.09008
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 8/95
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.1 I.736 J.969 P1  F42000
G1 X151.068 Y106.143 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.46 Y106.592 I-.049 J.438 E.01143
G1 X151.452 Y121.305 E.25688
G3 X151.001 Y121.66 I-.43 J-.082 E.01094
G1 X136.295 Y121.652 E.25677
G3 X135.94 Y121.199 I.082 J-.43 E.01098
G1 X135.948 Y106.495 E.25673
G3 X136.362 Y106.141 I.432 J.086 E.01025
G1 X151.008 Y106.143 E.25574
M204 S10000
G1 X151.111 Y105.716 F42000
G1 F6000
M204 S6000
G3 X151.889 Y106.584 I-.097 J.869 E.02227
G1 X151.888 Y121.256 E.25618
G3 X151.012 Y122.089 I-.865 J-.033 E.02336
G1 X136.344 Y122.088 E.25611
G3 X135.511 Y121.21 I.033 J-.865 E.02338
G1 X135.512 Y106.544 E.25608
G3 X136.344 Y105.712 I.871 J.04 E.02252
G1 X151.051 Y105.716 E.2568
M204 S250
G1 X151.123 Y105.304 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.153 Y105.304 E.00049
G3 X152.302 Y106.577 I-.144 J1.285 E.03044
G1 X152.301 Y121.274 E.23865
G3 X151.022 Y122.502 I-1.278 J-.051 E.03182
G1 X136.326 Y122.501 E.23863
G3 X135.098 Y121.222 I.051 J-1.278 E.03183
G1 X135.099 Y106.526 E.23862
G3 X136.326 Y105.299 I1.29 J.063 E.0309
G1 X151.063 Y105.304 E.23929
; WIPE_START
M204 S6000
G1 X151.153 Y105.304 E-.03423
G1 X151.398 Y105.353 E-.09505
G1 X151.59 Y105.429 E-.07849
G1 X151.805 Y105.563 E-.09604
G1 X151.987 Y105.734 E-.09499
G1 X152.11 Y105.9 E-.07841
G1 X152.219 Y106.121 E-.09367
G1 X152.284 Y106.363 E-.0953
G1 X152.302 Y106.577 E-.0816
G1 X152.302 Y106.609 E-.01222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.305 Y121.488 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42292
G1 F15000
M204 S6000
G1 X151.108 Y120.686 E.01856
G1 X151.108 Y120.118 E.00929
G1 X149.917 Y121.309 E.02754
G1 X149.349 Y121.309 E.00929
G1 X151.108 Y119.55 E.04067
G1 X151.108 Y118.982 E.00929
G1 X148.782 Y121.309 E.05381
G1 X148.214 Y121.309 E.00929
G1 X151.108 Y118.415 E.06694
G1 X151.108 Y117.847 E.00929
M73 P38 R17
G1 X147.646 Y121.308 E.08007
G1 X147.079 Y121.308 E.00929
G1 X151.108 Y117.279 E.09321
G1 X151.108 Y116.711 E.00929
G1 X146.511 Y121.308 E.10634
G1 X145.943 Y121.308 E.00929
G1 X151.108 Y116.143 E.11947
G1 X151.108 Y115.576 E.00929
G1 X145.375 Y121.308 E.13261
G1 X144.808 Y121.308 E.00929
G1 X151.108 Y115.008 E.14574
G1 X151.108 Y114.44 E.00929
G1 X144.24 Y121.308 E.15887
G1 X143.672 Y121.308 E.00929
G1 X151.108 Y113.872 E.17201
G1 X151.108 Y113.305 E.00929
G1 X143.105 Y121.308 E.18514
G1 X142.537 Y121.308 E.00929
G1 X151.108 Y112.737 E.19827
G1 X151.108 Y112.169 E.00929
G1 X141.969 Y121.308 E.21141
G1 X141.401 Y121.308 E.00929
G1 X151.108 Y111.601 E.22454
G1 X151.108 Y111.033 E.00929
G1 X140.834 Y121.308 E.23767
G1 X140.266 Y121.308 E.00929
G1 X151.108 Y110.466 E.25081
G1 X151.108 Y109.898 E.00929
G1 X139.698 Y121.308 E.26394
G1 X139.131 Y121.308 E.00929
G1 X151.109 Y109.33 E.27707
G1 X151.109 Y108.762 E.00929
G1 X138.563 Y121.308 E.29021
G1 X137.995 Y121.308 E.00929
G1 X151.109 Y108.194 E.30334
G1 X151.109 Y107.627 E.00929
G1 X137.428 Y121.308 E.31647
G1 X136.86 Y121.308 E.00929
G1 X151.109 Y107.059 E.32961
G1 X151.109 Y106.622 E.00714
G2 X151.078 Y106.522 I-.097 J-.025 E.00181
G1 X136.323 Y121.277 E.34132
G3 X136.291 Y121.17 I.097 J-.087 E.00188
G1 X136.291 Y120.741 E.00703
G1 X150.537 Y106.494 E.32955
G1 X149.97 Y106.494 E.00929
G1 X136.291 Y120.173 E.31641
G1 X136.291 Y119.605 E.00929
G1 X149.402 Y106.494 E.30328
G1 X148.834 Y106.494 E.00929
G1 X136.291 Y119.037 E.29015
G1 X136.291 Y118.469 E.00929
G1 X148.267 Y106.494 E.27702
G1 X147.699 Y106.494 E.00929
G1 X136.292 Y117.902 E.26388
G1 X136.292 Y117.334 E.00929
G1 X147.131 Y106.494 E.25075
G1 X146.564 Y106.494 E.00929
G1 X136.292 Y116.766 E.23762
G1 X136.292 Y116.198 E.00929
G1 X145.996 Y106.494 E.22449
G1 X145.428 Y106.494 E.00929
G1 X136.292 Y115.63 E.21135
G1 X136.292 Y115.063 E.00929
G1 X144.861 Y106.494 E.19822
G1 X144.293 Y106.494 E.00929
G1 X136.292 Y114.495 E.18509
G1 X136.292 Y113.927 E.00929
G1 X143.725 Y106.494 E.17195
G1 X143.158 Y106.493 E.00929
G1 X136.292 Y113.359 E.15882
G1 X136.292 Y112.791 E.00929
G1 X142.59 Y106.493 E.14569
G1 X142.022 Y106.493 E.00929
G1 X136.292 Y112.224 E.13256
G1 X136.292 Y111.656 E.00929
G1 X141.455 Y106.493 E.11942
G1 X140.887 Y106.493 E.00929
G1 X136.292 Y111.088 E.10629
G1 X136.292 Y110.52 E.00929
G1 X140.319 Y106.493 E.09316
G1 X139.752 Y106.493 E.00929
G1 X136.292 Y109.953 E.08003
G1 X136.292 Y109.385 E.00929
G1 X139.184 Y106.493 E.06689
G1 X138.616 Y106.493 E.00929
G1 X136.292 Y108.817 E.05376
G1 X136.292 Y108.249 E.00929
G1 X138.049 Y106.493 E.04063
G1 X137.481 Y106.493 E.00929
G1 X136.292 Y107.681 E.0275
G1 X136.292 Y107.114 E.00929
G1 X137.093 Y106.313 E.01851
; OBJECT_ID: 105
; WIPE_START
G1 X136.292 Y107.114 E-.43007
G1 X136.292 Y107.681 E-.21576
G1 X136.505 Y107.469 E-.11416
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X138.806 Y114.746 Z1.2 F42000
G1 X148.802 Y146.36 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.2 F42000
G1 X151.648 Y134.698 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.747 Y150.429 E.20476
G3 X151.979 Y151.148 I-.752 J-.034 E.02033
G1 X129.411 Y151.148 E.39404
G3 X128.653 Y150.429 I-.006 J-.753 E.02016
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.756 J-.013 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.019 Y127.053 I.793 J40.72 E.02823
G3 X152.747 Y127.771 I-.032 J.76 E.01958
G1 X152.748 Y134.698 E.12094
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.175 Y150.446 E.21253
G3 X151.987 Y151.576 I-1.181 J-.051 E.03164
G1 X129.406 Y151.576 E.39427
G3 X128.225 Y150.446 I.01 J-1.193 E.03146
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.813 E.1277
G3 X129.348 Y126.625 I1.187 J-.002 E.03151
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G3 X152.04 Y126.624 I1.01 J52.087 E.03608
G3 X153.175 Y127.754 I-.057 J1.192 E.03065
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.589 Y150.462 E.20463
G3 X151.996 Y151.99 I-1.594 J-.068 E.03957
G1 X129.402 Y151.99 E.36688
G3 X127.811 Y150.462 I.018 J-1.611 E.03945
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.603 J.008 E.0395
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G3 X152.06 Y126.211 I1.219 J63.257 E.0406
G3 X153.589 Y127.738 I-.081 J1.61 E.03844
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.2 F42000
G1 X132.384 Y149.175 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.138 Y149.539 E.33896
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01021
G1 X150.411 Y147.417 E.12322
G3 X150.296 Y147.971 I-1.394 J0 E.00925
G1 X150.002 Y148.403 E.00849
G1 X149.57 Y148.697 E.00848
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.08 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.0066
G1 X149.721 Y148.121 E.0061
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.536 Y149.937 E.35328
G1 X151.537 Y139.913 E.16342
G1 X151.06 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y134.484 E.0751
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.306 Y128.263 E.00376
G1 X151.289 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G2 X129.47 Y150.331 I1737.201 J4.487 E.17565
G1 X151.934 Y150.336 E.36477
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
M73 P39 R17
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G2 X151.933 Y127.866 I-1054.876 J-2.551 E.09774
G2 X151.083 Y127.864 I-.751 J147.977 E.0138
G1 X151.02 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.467 Y127.865 E.01381
G2 X129.464 Y133.886 I510.281 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18317
G1 X129.14 Y150.599 E.0035
G1 X129.3 Y150.712 E.00317
G1 X129.47 Y150.734 E.00279
G1 X151.961 Y150.734 E.3652
G1 X152.211 Y150.647 E.00429
G1 X152.326 Y150.424 E.00407
G1 X152.333 Y150.337 E.00143
G1 X152.334 Y139.116 E.1822
G1 X151.434 Y139.116 E.01462
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.804 E.10523
G1 X152.275 Y127.623 E.00308
G1 X152.094 Y127.487 E.00367
G2 X150.816 Y127.466 I-1 J21.641 E.02077
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.393 Y127.467 E.01934
G1 X129.197 Y127.546 E.00344
G1 X129.079 Y127.735 E.00363
G1 X129.066 Y134.284 E.10634
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X131.786 Y130.784 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y130.251 I.649 J.031 E.01059
G3 X132.384 Y130.186 I.271 J.533 E.00456
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27008
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01115
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.844 E.2691
M204 S10000
G1 X132.184 Y130.784 F42000
G1 F15000
M204 S6000
G1 X132.228 Y130.659 E.00215
G1 X132.349 Y130.587 E.00228
G1 X132.384 Y130.584 E.00056
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27008
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.844 E.2691
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09535
M204 S10000
G1 X150.761 Y147.723 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y147.863 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.709 E.01296
G1 X149.742 Y149.093 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y149.116 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y149.125 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y149.107 E.00268
G1 X150.705 Y149.107 E.01819
G1 X150.705 Y148.145 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y148.024 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y147.903 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.2 F42000
G1 X103.041 Y149.932 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.919 J.012 E.0462
G1 X122.975 Y129.591 E.29591
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04742
G1 X104.898 Y151.41 E.29354
G3 X103.054 Y149.99 I.003 J-1.911 E.04062
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15965
G1 X102.991 Y147.995 E-.60035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.376 Z1.2 F42000
G1 X104.089 Y129.072 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.521 J2.138 E.00695
G1 X123.278 Y129.012 E.30473
G1 X123.458 Y129.025 E.00292
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.09 J-2.193 E.0545
G1 X102.412 Y131.114 E.30335
G3 X104.031 Y129.087 I2.198 J.096 E.04505
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251309
G1 F15000
M204 S6000
G1 X104.202 Y129.378 E.00069
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.187668
G3 X104.633 Y129.309 I.339 J2.729 E.0012
G1 X122.983 Y129.302 E.12427
G1 X123.415 Y129.337 E.00293
; LINE_WIDTH: 0.254136
G3 X123.743 Y129.424 I-.338 J1.937 E.00323
; LINE_WIDTH: 0.300072
G3 X124.842 Y130.358 I-.68 J1.914 E.01673
G1 X124.908 Y130.487 E.00165
; LINE_WIDTH: 0.262826
G3 X125.062 Y130.978 I-1.946 J.881 E.00507
G1 X125.063 Y130.983 E.00005
; LINE_WIDTH: 0.188498
G3 X125.085 Y131.146 I-2.893 J.464 E.00112
G1 X125.099 Y131.417 E.00184
G1 X125.099 Y149.509 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.249755
G3 X124.973 Y150.353 I-2.188 J-.308 E.00405
; LINE_WIDTH: 0.298464
G3 X124.304 Y151.271 I-1.924 J-.7 E.01299
G1 X124.043 Y151.442 E.00352
G1 X123.767 Y151.568 E.00342
; LINE_WIDTH: 0.256068
G3 X123.423 Y151.661 I-.696 J-1.889 E.00341
; LINE_WIDTH: 0.188376
G3 X123.254 Y151.685 I-.441 J-2.588 E.00116
G1 X122.983 Y151.699 E.00184
G1 X104.894 Y151.699 E.12302
G1 X104.546 Y151.685 E.00237
; LINE_WIDTH: 0.241458
G3 X104.385 Y151.663 I.193 J-2.061 E.00146
G1 X104.117 Y151.597 E.00248
; LINE_WIDTH: 0.29738
G3 X102.898 Y150.526 I.622 J-1.937 E.01876
G1 X102.834 Y150.374 E.00185
; LINE_WIDTH: 0.25637
G3 X102.739 Y150.023 I1.878 J-.701 E.00348
; LINE_WIDTH: 0.188228
G3 X102.715 Y149.854 I2.581 J-.441 E.00116
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12295
; LINE_WIDTH: 0.196485
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.24062
G3 X102.801 Y130.724 I2.134 J.211 E.00389
; LINE_WIDTH: 0.297301
G3 X104.028 Y129.434 I1.935 J.612 E.02071
; LINE_WIDTH: 0.251309
G1 X104.074 Y129.419 E.00046
; OBJECT_ID: 116
; WIPE_START
G1 X104.202 Y129.378 E-.05097
G1 X104.457 Y129.325 E-.09906
G1 X104.633 Y129.309 E-.06718
G1 X106.061 Y129.308 E-.54278
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.575 Y127.964 Z1.2 F42000
G1 X124.664 Y125.98 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.646 Y125.987 E.00031
G3 X123.817 Y121.492 I-.739 J-2.188 E.12857
G1 X123.969 Y121.491 E.00246
G3 X124.904 Y125.882 I-.062 J2.308 E.10004
G1 X124.719 Y125.957 E.00323
; WIPE_START
M204 S6000
G1 X124.646 Y125.987 E-.03016
G1 X124.291 Y126.077 E-.13913
G1 X123.833 Y126.109 E-.17459
G1 X123.379 Y126.05 E-.17392
G1 X122.946 Y125.903 E-.17378
G1 X122.787 Y125.819 E-.06842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.639 Y123.264 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.651 Y123.273 E.00024
G3 X123.947 Y121.011 I-2.739 J.528 E.22263
G1 X124.097 Y121.017 E.00244
G3 X126.532 Y122.845 I-.185 J2.783 E.0523
G1 X126.624 Y123.206 E.00605
M204 S10000
G1 X126.381 Y123.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0876174
G1 F15000
M204 S6000
G1 X126.434 Y123.522 E.00073
G3 X121.382 Y124.184 I-2.534 J.269 E.02124
G1 X121.353 Y123.875 E.00084
G3 X126.341 Y123.059 I2.547 J-.084 E.01981
G1 X126.369 Y123.197 E.00038
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.434 Y123.522 E-.1259
G1 X126.451 Y123.729 E-.07868
G1 X126.441 Y124.03 E-.11476
G1 X126.355 Y124.492 E-.17857
G1 X126.278 Y124.722 E-.09182
G1 X126.154 Y124.993 E-.11353
G1 X126.077 Y125.121 E-.05674
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 9/95
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.736 J.969 P1  F42000
G1 X151.086 Y106.115 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.489 Y106.576 I-.05 J.45 E.01174
G1 X151.48 Y121.325 E.25752
G3 X151.018 Y121.689 I-.441 J-.085 E.01119
G1 X136.275 Y121.68 E.25741
G3 X135.911 Y121.215 I.085 J-.441 E.01125
G1 X135.92 Y106.475 E.25737
G3 X136.343 Y106.113 I.443 J.09 E.01048
G1 X151.026 Y106.115 E.25638
M204 S10000
G1 X151.13 Y105.688 F42000
G1 F6000
M204 S6000
G3 X151.917 Y106.568 I-.099 J.88 E.02256
G1 X151.916 Y121.275 E.2568
G3 X151.029 Y122.117 I-.876 J-.035 E.02363
G1 X136.325 Y122.116 E.25673
G3 X135.483 Y121.227 I.035 J-.876 E.02366
G1 X135.484 Y106.525 E.25671
G3 X136.325 Y105.684 I.883 J.042 E.02276
G1 X151.07 Y105.688 E.25745
M204 S250
G1 X151.133 Y105.276 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.172 Y105.276 E.00063
G3 X152.331 Y106.56 I-.146 J1.297 E.0307
G1 X152.329 Y121.293 E.23924
G3 X151.039 Y122.531 I-1.289 J-.053 E.03207
G1 X136.307 Y122.529 E.23922
G3 X135.069 Y121.238 I.053 J-1.289 E.03208
G1 X135.071 Y106.507 E.23921
G3 X136.307 Y105.271 I1.301 J.065 E.03112
G1 X151.073 Y105.276 E.23977
; WIPE_START
M204 S6000
G1 X151.172 Y105.276 E-.03753
G1 X151.419 Y105.326 E-.09597
G1 X151.613 Y105.402 E-.07909
G1 X151.829 Y105.537 E-.09695
G1 X152.013 Y105.71 E-.09583
G1 X152.136 Y105.877 E-.0788
G1 X152.246 Y106.098 E-.09403
G1 X152.312 Y106.343 E-.09622
G1 X152.331 Y106.56 E-.08279
G1 X152.331 Y106.567 E-.0028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.316 Y107.276 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42424
G1 F15000
M204 S6000
G1 X150.506 Y106.466 E.0188
G1 X149.937 Y106.466 E.00935
G1 X151.137 Y107.667 E.02786
G1 X151.137 Y108.236 E.00935
G1 X149.367 Y106.466 E.04108
G1 X148.797 Y106.466 E.00935
G1 X151.137 Y108.806 E.0543
G1 X151.137 Y109.375 E.00935
G1 X148.227 Y106.466 E.06752
G1 X147.658 Y106.466 E.00935
G1 X151.137 Y109.945 E.08074
G1 X151.137 Y110.514 E.00935
G1 X147.088 Y106.466 E.09396
G1 X146.518 Y106.466 E.00935
G1 X151.137 Y111.084 E.10718
G1 X151.137 Y111.654 E.00935
G1 X145.949 Y106.466 E.1204
G1 X145.379 Y106.466 E.00935
G1 X151.137 Y112.223 E.13362
G1 X151.136 Y112.793 E.00935
G1 X144.809 Y106.465 E.14684
G1 X144.24 Y106.465 E.00935
G1 X151.136 Y113.362 E.16006
G1 X151.136 Y113.932 E.00935
G1 X143.67 Y106.465 E.17328
G1 X143.1 Y106.465 E.00935
G1 X151.136 Y114.501 E.1865
G1 X151.136 Y115.071 E.00935
G1 X142.53 Y106.465 E.19973
G1 X141.961 Y106.465 E.00935
G1 X151.136 Y115.64 E.21295
G1 X151.136 Y116.21 E.00935
G1 X141.391 Y106.465 E.22617
G1 X140.821 Y106.465 E.00935
G1 X151.136 Y116.78 E.23939
G1 X151.136 Y117.349 E.00935
G1 X140.252 Y106.465 E.25261
G1 X139.682 Y106.465 E.00935
G1 X151.136 Y117.919 E.26583
G1 X151.136 Y118.488 E.00935
G1 X139.112 Y106.465 E.27905
G1 X138.543 Y106.465 E.00935
G1 X151.136 Y119.058 E.29227
G1 X151.136 Y119.627 E.00935
G1 X137.973 Y106.465 E.30549
G1 X137.403 Y106.464 E.00935
G1 X151.136 Y120.197 E.31871
G1 X151.136 Y120.767 E.00935
G1 X136.834 Y106.464 E.33193
G1 X136.383 Y106.464 E.00739
G2 X136.296 Y106.497 I-.005 J.12 E.00156
G1 X151.102 Y121.302 E.34361
G3 X150.989 Y121.337 I-.094 J-.103 E.002
G1 X150.567 Y121.337 E.00693
G1 X136.264 Y107.034 E.33194
G1 X136.264 Y107.604 E.00935
G1 X149.997 Y121.337 E.31872
G1 X149.428 Y121.337 E.00935
G1 X136.264 Y108.173 E.3055
G1 X136.264 Y108.743 E.00935
G1 X148.858 Y121.337 E.29228
G1 X148.288 Y121.337 E.00935
G1 X136.264 Y109.313 E.27906
G1 X136.264 Y109.882 E.00935
G1 X147.719 Y121.337 E.26584
G1 X147.149 Y121.337 E.00935
G1 X136.264 Y110.452 E.25262
G1 X136.264 Y111.021 E.00935
G1 X146.579 Y121.337 E.2394
G1 X146.01 Y121.337 E.00935
G1 X136.264 Y111.591 E.22618
G1 X136.264 Y112.16 E.00935
G1 X145.44 Y121.337 E.21296
G1 X144.87 Y121.336 E.00935
G1 X136.264 Y112.73 E.19974
G1 X136.264 Y113.299 E.00935
G1 X144.301 Y121.336 E.18652
G1 X143.731 Y121.336 E.00935
G1 X136.264 Y113.869 E.1733
G1 X136.264 Y114.439 E.00935
G1 X143.161 Y121.336 E.16008
G1 X142.592 Y121.336 E.00935
G1 X136.263 Y115.008 E.14686
G1 X136.263 Y115.578 E.00935
G1 X142.022 Y121.336 E.13364
G1 X141.452 Y121.336 E.00935
G1 X136.263 Y116.147 E.12042
M73 P40 R17
G1 X136.263 Y116.717 E.00935
G1 X140.883 Y121.336 E.1072
G1 X140.313 Y121.336 E.00935
G1 X136.263 Y117.286 E.09399
G1 X136.263 Y117.856 E.00935
G1 X139.743 Y121.336 E.08077
G1 X139.174 Y121.336 E.00935
G1 X136.263 Y118.426 E.06755
G1 X136.263 Y118.995 E.00935
G1 X138.604 Y121.336 E.05433
G1 X138.034 Y121.336 E.00935
G1 X136.263 Y119.565 E.04111
G1 X136.263 Y120.134 E.00935
G1 X137.465 Y121.336 E.02789
G1 X136.895 Y121.336 E.00935
G1 X136.084 Y120.525 E.01883
; OBJECT_ID: 105
; WIPE_START
G1 X136.895 Y121.336 E-.43597
G1 X137.465 Y121.336 E-.21647
G1 X137.264 Y121.136 E-.10756
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X140.439 Y128.077 Z1.3 F42000
G1 X148.802 Y146.36 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.3 F42000
G1 X151.648 Y134.698 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.747 Y150.429 E.20476
G3 X151.979 Y151.148 I-.756 J-.039 E.02029
G1 X129.417 Y151.148 E.39394
G3 X128.653 Y150.429 I-.014 J-.75 E.02028
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.754 J-.014 E.02015
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G1 X151.983 Y127.052 E.0276
G3 X152.747 Y127.771 I.009 J.756 E.02024
G1 X152.748 Y134.698 E.12094
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.175 Y150.446 E.21254
G3 X151.987 Y151.576 I-1.188 J-.059 E.03158
G1 X129.41 Y151.576 E.39421
G3 X128.225 Y150.446 I-.007 J-1.179 E.03161
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.813 E.1277
G3 X129.348 Y126.625 I1.185 J-.004 E.03152
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.99 Y126.624 E.03521
G3 X153.175 Y127.754 I0 J1.187 E.03156
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.589 Y150.462 E.20464
G3 X151.996 Y151.99 I-1.605 J-.079 E.0395
G1 X129.403 Y151.99 E.36686
G3 X127.811 Y150.462 I0 J-1.593 E.03958
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.601 J.006 E.03951
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.997 Y126.21 E.03957
G3 X153.589 Y127.738 I-.009 J1.603 E.03952
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.3 F42000
G1 X132.384 Y149.175 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.138 Y149.539 E.33896
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01021
G1 X150.411 Y147.417 E.12322
G3 X150.296 Y147.971 I-1.394 J0 E.00925
G1 X150.002 Y148.403 E.00849
G1 X149.57 Y148.697 E.00848
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.08 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.0066
G1 X149.721 Y148.121 E.0061
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.536 Y149.937 E.35328
G1 X151.537 Y139.913 E.16342
G1 X151.06 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y134.484 E.0751
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.264 E.08515
G1 X151.305 Y128.263 E.00377
G1 X151.288 Y128.302 E.00069
G1 X150.616 Y128.563 E.01174
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.335 E.1757
G1 X151.932 Y150.334 E.36481
G1 X151.936 Y139.514 E.17568
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.889 E.09737
G2 X151.082 Y127.865 I-.708 J9.728 E.01385
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00794
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01382
G2 X129.464 Y133.886 I678.289 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18317
G1 X129.152 Y150.612 E.00376
G1 X129.381 Y150.725 E.00415
G1 X129.474 Y150.734 E.00152
G1 X151.961 Y150.734 E.36513
G1 X152.218 Y150.641 E.00445
G1 X152.327 Y150.424 E.00394
G1 X152.333 Y150.334 E.00147
G1 X152.334 Y139.116 E.18216
G1 X151.434 Y139.116 E.01462
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.822 E.10494
G1 X152.259 Y127.61 E.00365
G1 X152.019 Y127.472 E.00449
G2 X150.816 Y127.466 I-.98 J69.79 E.01955
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.393 Y127.467 E.01934
G1 X129.179 Y127.56 E.00379
G1 X129.076 Y127.784 E.00402
G1 X129.066 Y134.284 E.10554
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X131.786 Y130.784 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27008
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01115
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.844 E.2691
M204 S10000
G1 X132.184 Y130.784 F42000
G1 F15000
M204 S6000
G1 X132.196 Y130.716 E.00112
G1 X132.293 Y130.606 E.00238
G1 X132.384 Y130.584 E.00151
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27008
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.844 E.2691
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09535
M204 S10000
G1 X150.761 Y147.723 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y147.863 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.709 E.01296
G1 X149.742 Y149.093 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y149.116 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y149.125 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y149.107 E.00268
G1 X150.705 Y149.107 E.01819
G1 X150.705 Y148.145 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y148.024 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y147.903 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.3 F42000
G1 X103.04 Y149.932 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00584
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.919 J.013 E.04616
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.911 J-.003 E.04746
G1 X104.898 Y151.41 E.29354
G3 X103.054 Y149.99 I.003 J-1.911 E.04064
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15937
G1 X102.991 Y147.994 E-.60063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1.3 F42000
G1 X104.089 Y129.074 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.529 J2.145 E.00695
G1 X123.277 Y129.012 E.30471
G1 X123.458 Y129.025 E.00294
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.193 E.05448
G1 X102.412 Y131.114 E.30338
G3 X104.031 Y129.089 I2.207 J.104 E.045
M204 S10000
G1 X104.132 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251611
G1 F15000
M204 S6000
G1 X104.202 Y129.378 E.00069
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.187678
G1 X104.892 Y129.301 E.00295
G1 X122.983 Y129.301 E.12252
G1 X123.415 Y129.337 E.00293
; LINE_WIDTH: 0.254124
G3 X123.743 Y129.423 I-.339 J1.943 E.00322
; LINE_WIDTH: 0.29933
G3 X124.861 Y130.392 I-.679 J1.913 E.01714
G1 X124.937 Y130.554 E.00202
; LINE_WIDTH: 0.259537
G3 X125.063 Y130.984 I-2.01 J.822 E.00436
; LINE_WIDTH: 0.188392
G3 X125.085 Y131.146 I-2.402 J.409 E.00112
G1 X125.099 Y131.417 E.00184
G1 X125.099 Y149.506 E.12303
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243871
M73 P41 R17
G3 X125.048 Y150.09 I-2.364 J-.269 E.00198
G1 X124.988 Y150.309 E.00207
; LINE_WIDTH: 0.297851
G3 X124.008 Y151.46 I-1.924 J-.645 E.01744
G1 X123.774 Y151.566 E.0029
; LINE_WIDTH: 0.256646
M73 P41 R16
G3 X123.427 Y151.661 I-.709 J-1.909 E.00345
; LINE_WIDTH: 0.188509
G1 X122.983 Y151.699 E.00303
G1 X104.896 Y151.699 E.12311
G3 X104.475 Y151.677 I.019 J-4.291 E.00287
; LINE_WIDTH: 0.249854
G3 X104.04 Y151.571 I.303 J-2.192 E.00418
; LINE_WIDTH: 0.298652
G3 X102.94 Y150.608 I.698 J-1.908 E.01689
G1 X102.834 Y150.374 E.0029
; LINE_WIDTH: 0.255852
G3 X102.776 Y150.194 I5.498 J-1.872 E.0018
G1 X102.737 Y150.016 E.00174
; LINE_WIDTH: 0.188213
G1 X102.701 Y149.583 E.00295
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.196227
G1 X102.714 Y131.155 E.00238
; LINE_WIDTH: 0.239721
G3 X102.798 Y130.733 I2.415 J.261 E.00383
; LINE_WIDTH: 0.297185
G3 X104.021 Y129.436 I1.936 J.601 E.02074
; LINE_WIDTH: 0.251611
G1 X104.074 Y129.419 E.00052
; OBJECT_ID: 116
; WIPE_START
G1 X104.202 Y129.378 E-.05092
G1 X104.457 Y129.325 E-.09903
G1 X104.892 Y129.301 E-.16543
G1 X106.062 Y129.301 E-.44462
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.576 Y127.961 Z1.3 F42000
G1 X124.626 Y125.99 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.267 Y126.08 E.00601
G3 X123.81 Y121.492 I-.362 J-2.281 E.12215
G1 X123.969 Y121.491 E.00258
G3 X124.684 Y125.973 I-.063 J2.308 E.10387
; WIPE_START
M204 S6000
G1 X124.267 Y126.08 E-.16341
G1 X123.833 Y126.109 E-.16559
G1 X123.378 Y126.05 E-.17433
G1 X123.005 Y125.929 E-.14889
G1 X122.752 Y125.8 E-.10779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.64 Y123.28 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.668 Y123.382 E.00172
G3 X123.957 Y121.011 I-2.757 J.417 E.22095
G1 X124.096 Y121.017 E.00226
G3 X126.627 Y123.167 I-.185 J2.783 E.05777
G1 X126.633 Y123.221 E.00087
M204 S10000
G1 X126.397 Y123.289 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875465
G1 F15000
M204 S6000
G1 X126.406 Y123.325 E.0001
G3 X121.353 Y123.879 I-2.504 J.477 E.02265
G1 X121.353 Y123.875 E.00001
G1 X121.355 Y123.677 E.00053
G3 X126.272 Y122.864 I2.546 J.125 E.01864
G1 X126.38 Y123.232 E.00103
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.406 Y123.325 E-.03679
G1 X126.45 Y123.83 E-.19262
G1 X126.438 Y124.052 E-.08455
G1 X126.396 Y124.325 E-.10483
G1 X126.317 Y124.617 E-.1149
G1 X126.242 Y124.811 E-.07912
G1 X126.105 Y125.083 E-.11559
G1 X126.06 Y125.153 E-.03161
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 10/95
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.3 I.737 J.968 P1  F42000
G1 X151.105 Y106.087 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.517 Y106.56 I-.052 J.461 E.01203
G1 X151.508 Y121.345 E.25815
G3 X151.034 Y121.717 I-.452 J-.088 E.01147
G1 X136.255 Y121.708 E.25804
G3 X135.883 Y121.231 I.088 J-.452 E.01152
G1 X135.892 Y106.455 E.258
G3 X136.324 Y106.085 I.454 J.092 E.01071
G1 X151.045 Y106.087 E.25702
M204 S10000
G1 X151.143 Y105.66 F42000
G1 F6000
M204 S6000
G1 X151.148 Y105.66 E.00009
G3 X151.945 Y106.551 I-.1 J.892 E.02285
G1 X151.944 Y121.294 E.25742
G3 X151.045 Y122.145 I-.887 J-.037 E.02391
G1 X136.306 Y122.144 E.25736
G3 X135.455 Y121.244 I.037 J-.887 E.02394
G1 X135.456 Y106.506 E.25733
G3 X136.306 Y105.656 I.894 J.044 E.023
G1 X151.083 Y105.66 E.25802
M204 S250
G1 X151.143 Y105.248 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.19 Y105.248 E.00076
G3 X152.359 Y106.543 I-.148 J1.308 E.03096
G1 X152.357 Y121.312 E.23982
G3 X151.056 Y122.559 I-1.301 J-.055 E.03233
G1 X136.288 Y122.557 E.2398
G3 X135.041 Y121.255 I.055 J-1.301 E.03234
G1 X135.043 Y106.488 E.23979
G3 X136.288 Y105.243 I1.313 J.067 E.03134
G1 X151.083 Y105.248 E.24025
; WIPE_START
M204 S6000
G1 X151.19 Y105.248 E-.04068
G1 X151.44 Y105.298 E-.09675
G1 X151.677 Y105.397 E-.09774
G1 X151.853 Y105.511 E-.07966
G1 X152.039 Y105.686 E-.09697
G1 X152.163 Y105.854 E-.07944
G1 X152.273 Y106.076 E-.09419
G1 X152.34 Y106.323 E-.097
G1 X152.357 Y106.526 E-.07757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.343 Y121.545 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42557
G1 F15000
M204 S6000
G1 X151.164 Y120.724 E.01912
G1 X151.164 Y120.152 E.00941
G1 X149.951 Y121.365 E.02825
G1 X149.379 Y121.365 E.00941
G1 X151.164 Y119.58 E.04156
G1 X151.164 Y119.009 E.00941
G1 X148.808 Y121.365 E.05487
G1 X148.236 Y121.365 E.00941
G1 X151.164 Y118.437 E.06817
G1 X151.164 Y117.866 E.00941
G1 X147.665 Y121.365 E.08148
G1 X147.093 Y121.365 E.00941
G1 X151.164 Y117.294 E.09479
G1 X151.164 Y116.723 E.00941
G1 X146.522 Y121.365 E.1081
G1 X145.951 Y121.365 E.00941
G1 X151.164 Y116.151 E.1214
G1 X151.164 Y115.58 E.00941
G1 X145.379 Y121.365 E.13471
G1 X144.808 Y121.365 E.00941
G1 X151.165 Y115.008 E.14802
G1 X151.165 Y114.436 E.00941
G1 X144.236 Y121.365 E.16132
G1 X143.665 Y121.365 E.00941
G1 X151.165 Y113.865 E.17463
G1 X151.165 Y113.293 E.00941
G1 X143.093 Y121.365 E.18794
G1 X142.522 Y121.365 E.00941
G1 X151.165 Y112.722 E.20125
G1 X151.165 Y112.15 E.00941
G1 X141.951 Y121.364 E.21455
G1 X141.379 Y121.364 E.00941
G1 X151.165 Y111.579 E.22786
G1 X151.165 Y111.007 E.00941
G1 X140.808 Y121.364 E.24117
G1 X140.236 Y121.364 E.00941
G1 X151.165 Y110.436 E.25448
G1 X151.165 Y109.864 E.00941
G1 X139.665 Y121.364 E.26778
G1 X139.093 Y121.364 E.00941
G1 X151.165 Y109.292 E.28109
G1 X151.165 Y108.721 E.00941
G1 X138.522 Y121.364 E.2944
G1 X137.95 Y121.364 E.00941
G1 X151.165 Y108.149 E.3077
G1 X151.165 Y107.578 E.00941
G1 X137.379 Y121.364 E.32101
G1 X136.808 Y121.364 E.00941
G1 X151.165 Y107.006 E.33432
G1 X151.165 Y106.59 E.00686
G2 X151.13 Y106.47 I-.15 J-.02 E.00211
G1 X136.272 Y121.328 E.34595
G3 X136.235 Y121.2 I.119 J-.105 E.00227
G1 X136.235 Y120.794 E.00668
G1 X150.59 Y106.438 E.33427
G1 X150.019 Y106.438 E.00941
G1 X136.235 Y120.222 E.32097
G1 X136.235 Y119.651 E.00941
G1 X149.448 Y106.438 E.30766
G1 X148.876 Y106.438 E.00941
G1 X136.235 Y119.079 E.29435
G1 X136.235 Y118.508 E.00941
G1 X148.305 Y106.438 E.28105
G1 X147.733 Y106.438 E.00941
G1 X136.235 Y117.936 E.26774
G1 X136.235 Y117.365 E.00941
G1 X147.162 Y106.438 E.25443
G1 X146.591 Y106.437 E.00941
G1 X136.235 Y116.793 E.24113
G1 X136.235 Y116.221 E.00941
G1 X146.019 Y106.437 E.22782
G1 X145.448 Y106.437 E.00941
G1 X136.235 Y115.65 E.21451
G1 X136.235 Y115.078 E.00941
G1 X144.876 Y106.437 E.20121
G1 X144.305 Y106.437 E.00941
G1 X136.235 Y114.507 E.1879
G1 X136.235 Y113.935 E.00941
G1 X143.733 Y106.437 E.17459
G1 X143.162 Y106.437 E.00941
G1 X136.235 Y113.364 E.16129
G1 X136.235 Y112.792 E.00941
G1 X142.591 Y106.437 E.14798
G1 X142.019 Y106.437 E.00941
G1 X136.236 Y112.221 E.13467
G1 X136.236 Y111.649 E.00941
G1 X141.448 Y106.437 E.12136
G1 X140.876 Y106.437 E.00941
G1 X136.236 Y111.077 E.10806
G1 X136.236 Y110.506 E.00941
G1 X140.305 Y106.437 E.09475
G1 X139.733 Y106.437 E.00941
G1 X136.236 Y109.934 E.08144
G1 X136.236 Y109.363 E.00941
G1 X139.162 Y106.436 E.06814
G1 X138.591 Y106.436 E.00941
G1 X136.236 Y108.791 E.05483
G1 X136.236 Y108.22 E.00941
G1 X138.019 Y106.436 E.04152
G1 X137.448 Y106.436 E.00941
G1 X136.236 Y107.648 E.02822
G1 X136.236 Y107.077 E.00941
G1 X137.056 Y106.257 E.01909
; OBJECT_ID: 105
; WIPE_START
G1 X136.236 Y107.077 E-.44049
G1 X136.236 Y107.648 E-.21719
G1 X136.426 Y107.458 E-.10231
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X138.74 Y114.731 Z1.4 F42000
G1 X148.802 Y146.36 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.4 F42000
G1 X151.648 Y134.698 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.381 E.20392
G3 X151.979 Y151.148 I-.758 J.009 E.02114
G1 X129.416 Y151.148 E.39395
G3 X128.653 Y150.429 I-.013 J-.75 E.02026
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.755 J-.014 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.026 Y127.053 I.791 J26.69 E.02836
G3 X152.747 Y127.771 I-.028 J.749 E.01952
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.389 E.21154
G3 X151.988 Y151.576 I-1.189 J-.001 E.03258
G1 X129.41 Y151.576 E.39422
G3 X128.225 Y150.446 I-.007 J-1.179 E.03161
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
M73 P42 R16
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.813 E.1277
G3 X129.348 Y126.625 I1.185 J-.004 E.03151
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.99 Y126.624 E.03521
G3 X153.175 Y127.754 I.007 J1.179 E.03161
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.59 Y150.396 E.20356
G3 X151.996 Y151.99 I-1.605 J-.011 E.04058
G1 X129.403 Y151.99 E.36686
G3 X127.811 Y150.462 I0 J-1.593 E.03957
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.601 J.007 E.03951
G1 X131.84 Y126.21 E.04067
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.997 Y126.21 E.03957
G3 X153.589 Y127.738 I0 J1.593 E.03957
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.4 F42000
G1 X132.384 Y149.175 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X132.184 Y147.416 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27007
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.207 Y147.472 E.0015
M204 S10000
G1 X131.786 Y147.416 F42000
G1 F15000
M204 S6000
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27007
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01116
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.798 Y147.475 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.131 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.264 E.08515
G1 X151.305 Y128.263 E.00376
G1 X151.288 Y128.302 E.00069
G1 X150.616 Y128.563 E.01174
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.33 E.17563
G1 X151.934 Y150.336 E.36484
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.889 E.09737
G2 X151.083 Y127.865 I-.707 J9.762 E.01384
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01383
G2 X129.464 Y133.886 I925.962 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18317
G1 X129.158 Y150.622 E.00395
G2 X129.496 Y150.734 I.352 J-.495 E.00587
G1 X151.96 Y150.734 E.36477
G1 X152.219 Y150.641 E.00447
G1 X152.323 Y150.43 E.00381
G1 X152.334 Y150.324 E.00174
G1 X152.334 Y139.116 E.182
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.821 E.10494
G1 X152.208 Y127.548 E.00488
G1 X151.9 Y127.467 E.00518
G1 X150.816 Y127.466 E.0176
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.395 Y127.467 E.01931
G1 X129.19 Y127.549 E.00359
G1 X129.076 Y127.78 E.00418
G1 X129.066 Y134.284 E.10562
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09555
M204 S10000
G1 X150.762 Y147.723 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y149.116 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y148.024 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y147.903 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.4 F42000
G1 X103.041 Y149.932 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.918 J.012 E.04739
G1 X122.975 Y129.591 E.29471
G3 X124.809 Y131.425 I-.084 J1.918 E.04624
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.913 J-.005 E.04745
G1 X104.896 Y151.41 E.29356
G3 X103.054 Y149.99 I.005 J-1.911 E.04059
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15968
G1 X102.991 Y147.995 E-.60032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1.4 F42000
G1 X104.089 Y129.074 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00695
G1 X123.276 Y129.012 E.3047
G1 X123.458 Y129.025 E.00295
G3 X125.39 Y131.204 I-.278 J2.193 E.05162
G1 X125.388 Y149.888 E.30339
G3 X123.196 Y151.99 I-2.193 J-.093 E.05447
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.193 E.05448
G1 X102.412 Y131.114 E.30337
G3 X104.031 Y129.089 I2.207 J.104 E.045
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251188
G1 F15000
M204 S6000
G1 X104.202 Y129.378 E.0007
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.188312
G3 X104.645 Y129.308 I.348 J2.821 E.00128
G1 X122.983 Y129.301 E.12466
G1 X123.416 Y129.337 E.00295
; LINE_WIDTH: 0.254586
G3 X123.75 Y129.426 I-.354 J1.996 E.00329
; LINE_WIDTH: 0.300253
G3 X124.902 Y130.475 I-.69 J1.914 E.01816
; LINE_WIDTH: 0.263792
G3 X125.061 Y130.974 I-2.049 J.928 E.00518
; LINE_WIDTH: 0.188509
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.504 E.12311
G3 X125.077 Y149.925 I-4.522 J-.024 E.00287
; LINE_WIDTH: 0.249129
G3 X124.974 Y150.349 I-2.201 J-.309 E.00406
; LINE_WIDTH: 0.300299
G3 X124.009 Y151.461 I-1.914 J-.688 E.01711
G1 X123.919 Y151.504 E.00113
; LINE_WIDTH: 0.263908
G3 X123.427 Y151.661 I-.884 J-1.93 E.00511
; LINE_WIDTH: 0.18851
G1 X122.983 Y151.699 E.00303
G1 X104.892 Y151.699 E.12313
G3 X104.475 Y151.677 I-.001 J-3.841 E.00284
; LINE_WIDTH: 0.249408
G3 X104.047 Y151.573 I.303 J-2.19 E.0041
; LINE_WIDTH: 0.300414
G3 X102.94 Y150.608 I.69 J-1.909 E.01708
G1 X102.895 Y150.519 E.00113
; LINE_WIDTH: 0.263236
G3 X102.777 Y150.195 I1.861 J-.864 E.00341
G1 X102.737 Y150.02 E.00177
; LINE_WIDTH: 0.188223
G1 X102.701 Y149.583 E.00298
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.196481
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240611
G3 X102.787 Y130.771 I2.174 J.217 E.00345
G1 X102.8 Y130.727 E.0004
; LINE_WIDTH: 0.297159
G3 X104.029 Y129.433 I1.939 J.611 E.02076
; LINE_WIDTH: 0.251188
G1 X104.073 Y129.419 E.00043
; OBJECT_ID: 116
; WIPE_START
G1 X104.202 Y129.378 E-.05126
G1 X104.457 Y129.325 E-.09907
G1 X104.645 Y129.308 E-.07172
G1 X106.061 Y129.308 E-.53795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.575 Y127.966 Z1.4 F42000
G1 X124.591 Y126 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.469 Y126.038 E.00208
G3 X123.802 Y121.492 I-.565 J-2.239 E.12541
G1 X123.969 Y121.491 E.00271
G3 X124.748 Y125.949 I-.065 J2.308 E.10271
G1 X124.648 Y125.981 E.00171
; WIPE_START
M204 S6000
G1 X124.469 Y126.038 E-.07149
G1 X124.275 Y126.08 E-.07538
G1 X123.833 Y126.109 E-.16849
G1 X123.466 Y126.069 E-.14028
G1 X123.012 Y125.932 E-.18005
G1 X122.72 Y125.784 E-.12431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.641 Y123.294 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.667 Y123.383 E.00149
G3 X123.967 Y121.011 I-2.758 J.417 E.22114
G1 X124.096 Y121.017 E.0021
G3 X126.598 Y123.058 I-.187 J2.783 E.05592
G1 X126.63 Y123.235 E.00292
M204 S10000
G1 X126.4 Y123.303 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0875105
G1 F15000
M204 S6000
G1 X126.405 Y123.326 E.00006
G3 X121.353 Y123.879 I-2.505 J.475 E.02263
G1 X121.353 Y123.875 E.00001
G1 X121.355 Y123.675 E.00054
G3 X126.263 Y122.842 I2.546 J.126 E.01857
G1 X126.383 Y123.246 E.00113
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.405 Y123.326 E-.0318
G1 X126.45 Y123.83 E-.19215
G1 X126.414 Y124.234 E-.15421
G1 X126.317 Y124.617 E-.15017
G1 X126.242 Y124.811 E-.07885
G1 X126.152 Y124.999 E-.07912
G1 X126.051 Y125.164 E-.0737
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 11/95
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.738 J.968 P1  F42000
G1 X151.123 Y106.058 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.545 Y106.543 I-.053 J.472 E.01233
G1 X151.545 Y121.261 E.25698
G3 X151.051 Y121.745 I-.472 J.012 E.01353
G1 X136.339 Y121.745 E.25689
G3 X135.855 Y121.248 I-.012 J-.472 E.01359
G1 X135.864 Y106.435 E.25864
G3 X136.305 Y106.056 I.465 J.096 E.01093
G1 X151.063 Y106.058 E.25767
M204 S10000
G1 X151.153 Y105.632 F42000
G1 F6000
M204 S6000
G1 X151.167 Y105.632 E.00023
G3 X151.974 Y106.535 I-.102 J.903 E.02314
G1 X151.973 Y121.273 E.25734
G3 X151.062 Y122.174 I-.9 J.001 E.02489
G1 X136.327 Y122.173 E.25728
G3 X135.426 Y121.26 I-.001 J-.9 E.02493
G1 X135.428 Y106.487 E.25795
G3 X136.287 Y105.628 I.905 J.046 E.02324
G1 X151.093 Y105.632 E.25853
M204 S250
G1 X151.154 Y105.22 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.209 Y105.22 E.0009
G3 X152.387 Y106.526 I-.15 J1.319 E.03122
G1 X152.387 Y121.284 E.23964
G3 X151.073 Y122.587 I-1.313 J-.01 E.03335
G1 X136.316 Y122.587 E.23962
G3 X135.013 Y121.272 I.01 J-1.313 E.03335
G1 X135.014 Y106.469 E.24038
G3 X136.269 Y105.214 I1.324 J.07 E.03156
G1 X151.094 Y105.22 E.24072
; WIPE_START
M204 S6000
G1 X151.209 Y105.22 E-.04393
G1 X151.461 Y105.27 E-.0976
G1 X151.658 Y105.348 E-.08033
G1 X151.877 Y105.485 E-.09851
G1 X152.065 Y105.662 E-.09771
G1 X152.19 Y105.831 E-.0801
G1 X152.3 Y106.054 E-.09455
G1 X152.368 Y106.303 E-.09784
G1 X152.384 Y106.485 E-.06943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.373 Y106.665 F42000
M73 P43 R16
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4269
G1 F15000
M204 S6000
G2 X151.118 Y106.421 I-1.028 J.817 E.00584
G1 X150.544 Y106.41 E.00949
G1 X151.194 Y107.059 E.01518
G1 X151.194 Y107.633 E.00947
G1 X149.971 Y106.41 E.02857
G1 X149.397 Y106.41 E.00947
G1 X151.194 Y108.206 E.04197
G1 X151.194 Y108.78 E.00947
G1 X148.824 Y106.41 E.05537
G1 X148.25 Y106.409 E.00947
G1 X151.194 Y109.353 E.06876
G1 X151.194 Y109.926 E.00947
G1 X147.677 Y106.409 E.08216
G1 X147.103 Y106.409 E.00947
G1 X151.194 Y110.5 E.09556
G1 X151.194 Y111.073 E.00947
G1 X146.53 Y106.409 E.10895
G1 X145.956 Y106.409 E.00947
G1 X151.194 Y111.646 E.12235
G1 X151.194 Y112.22 E.00947
G1 X145.383 Y106.409 E.13575
G1 X144.809 Y106.409 E.00947
G1 X151.194 Y112.793 E.14914
G1 X151.194 Y113.366 E.00947
G1 X144.236 Y106.409 E.16254
G1 X143.663 Y106.409 E.00947
G1 X151.194 Y113.94 E.17594
G1 X151.193 Y114.513 E.00947
G1 X143.089 Y106.409 E.18933
G1 X142.516 Y106.409 E.00947
G1 X151.193 Y115.087 E.20273
G1 X151.193 Y115.66 E.00947
G1 X141.942 Y106.409 E.21612
G1 X141.369 Y106.409 E.00947
G1 X151.193 Y116.233 E.22952
G1 X151.193 Y116.807 E.00947
G1 X140.795 Y106.409 E.24292
G1 X140.222 Y106.408 E.00947
G1 X151.193 Y117.38 E.25631
G1 X151.193 Y117.953 E.00947
G1 X139.648 Y106.408 E.26971
G1 X139.075 Y106.408 E.00947
G1 X151.193 Y118.527 E.28311
G1 X151.193 Y119.1 E.00947
G1 X138.501 Y106.408 E.2965
G1 X137.928 Y106.408 E.00947
G1 X151.193 Y119.674 E.3099
G1 X151.193 Y120.247 E.00947
G1 X137.355 Y106.408 E.3233
G1 X136.781 Y106.408 E.00947
G1 X151.193 Y120.82 E.33669
G1 X151.193 Y121.228 E.00673
G3 X151.152 Y121.352 I-.119 J.029 E.00228
G1 X136.247 Y106.447 E.34821
G2 X136.208 Y106.544 I.079 J.088 E.00179
G1 X136.208 Y106.981 E.00723
G1 X150.62 Y121.394 E.33669
G1 X150.047 Y121.394 E.00947
G1 X136.208 Y107.555 E.3233
G1 X136.208 Y108.128 E.00947
G1 X149.473 Y121.394 E.3099
G1 X148.9 Y121.394 E.00947
G1 X136.208 Y108.701 E.29651
G1 X136.208 Y109.275 E.00947
G1 X148.326 Y121.394 E.28311
G1 X147.753 Y121.394 E.00947
G1 X136.208 Y109.848 E.26972
G1 X136.207 Y110.421 E.00947
G1 X147.18 Y121.394 E.25633
G1 X146.606 Y121.394 E.00947
G1 X136.207 Y110.995 E.24293
G1 X136.207 Y111.568 E.00947
G1 X146.033 Y121.394 E.22954
G1 X145.459 Y121.394 E.00947
G1 X136.207 Y112.141 E.21615
G1 X136.207 Y112.715 E.00947
G1 X144.886 Y121.394 E.20275
G1 X144.313 Y121.394 E.00947
G1 X136.207 Y113.288 E.18936
G1 X136.207 Y113.861 E.00947
G1 X143.739 Y121.394 E.17596
G1 X143.166 Y121.394 E.00947
G1 X136.207 Y114.435 E.16257
G1 X136.207 Y115.008 E.00947
G1 X142.593 Y121.394 E.14918
G1 X142.019 Y121.393 E.00947
G1 X136.207 Y115.581 E.13578
G1 X136.207 Y116.155 E.00947
G1 X141.446 Y121.393 E.12239
G1 X140.872 Y121.393 E.00947
G1 X136.207 Y116.728 E.109
G1 X136.207 Y117.301 E.00947
G1 X140.299 Y121.393 E.0956
G1 X139.726 Y121.393 E.00947
G1 X136.207 Y117.875 E.08221
G1 X136.207 Y118.448 E.00947
G1 X139.152 Y121.393 E.06881
G1 X138.579 Y121.393 E.00947
G1 X136.207 Y119.021 E.05542
G1 X136.207 Y119.594 E.00947
G1 X138.005 Y121.393 E.04203
G1 X137.432 Y121.393 E.00947
G1 X136.206 Y120.168 E.02863
G1 X136.206 Y120.741 E.00947
G1 X137.038 Y121.573 E.01943
; OBJECT_ID: 105
; WIPE_START
G1 X136.206 Y120.741 E-.44691
G1 X136.206 Y120.168 E-.21786
G1 X136.384 Y120.345 E-.09523
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X139.672 Y127.233 Z1.5 F42000
G1 X148.802 Y146.36 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.5 F42000
G1 X151.648 Y134.698 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.381 E.20391
G3 X151.979 Y151.148 I-.749 J.018 E.02121
G1 X129.411 Y151.148 E.39404
G3 X128.653 Y150.429 I-.003 J-.756 E.02013
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.755 J-.014 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.019 Y127.053 I.793 J39.906 E.02823
G1 X152.107 Y127.06 E.00155
G3 X152.747 Y127.771 I-.112 J.744 E.01809
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.389 E.21153
G3 X151.987 Y151.576 I-1.178 J.01 E.03268
G1 X129.406 Y151.576 E.39427
G3 X128.225 Y150.446 I.004 J-1.187 E.03149
G1 X128.224 Y138.274 E.21254
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.12771
G3 X129.348 Y126.625 I1.186 J-.003 E.03151
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G3 X152.04 Y126.624 I1.01 J52.18 E.03608
G3 X153.175 Y127.754 I-.043 J1.178 E.03073
G1 X153.176 Y135.126 E.12873
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.59 Y150.396 E.20356
G3 X151.996 Y151.99 I-1.591 J.003 E.04068
G1 X129.402 Y151.99 E.36688
G3 X127.811 Y150.462 I.011 J-1.603 E.03949
G1 X127.81 Y137.86 E.20464
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12562
G3 X129.336 Y126.211 I1.602 J.007 E.0395
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G3 X152.06 Y126.211 I1.219 J63.393 E.0406
G3 X153.589 Y127.738 I-.065 J1.593 E.03853
G1 X153.59 Y135.54 E.1267
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.5 F42000
G1 X132.384 Y149.175 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X132.184 Y147.416 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27007
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.207 Y147.472 E.0015
M204 S10000
G1 X131.786 Y147.416 F42000
G1 F15000
M204 S6000
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27007
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01116
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.798 Y147.475 I.279 J-.567 E.01017
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
M73 P44 R16
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.131 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.306 Y128.263 E.00376
G1 X151.289 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.334 E.1757
G1 X151.934 Y150.336 E.36483
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.882 E.09749
G2 X151.083 Y127.864 I-.704 J13.391 E.01384
G1 X151.02 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.474 Y127.865 E.0137
G1 X129.464 Y133.886 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.397 E.18318
G1 X129.15 Y150.609 E.0037
G1 X129.389 Y150.726 E.00432
G1 X129.475 Y150.734 E.00142
G1 X151.96 Y150.734 E.36509
G1 X152.213 Y150.644 E.00437
G1 X152.326 Y150.409 E.00424
G1 X152.334 Y150.321 E.00144
G1 X152.334 Y139.116 E.18194
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.819 E.10498
G1 X152.234 Y127.579 E.00422
G1 X151.968 Y127.466 E.0047
G1 X150.816 Y127.466 E.01871
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.395 Y127.467 E.01931
G1 X129.181 Y127.554 E.00375
G1 X129.096 Y127.732 E.0032
G1 X129.066 Y128.413 E.01107
G1 X129.066 Y134.284 E.09534
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09555
M204 S10000
G1 X150.762 Y147.723 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y149.116 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y148.024 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y147.903 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.5 F42000
G1 X103.04 Y149.931 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00584
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.091 J1.924 E.04619
G1 X124.81 Y149.503 E.29354
G3 X122.975 Y151.409 I-1.913 J-.006 E.04744
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.99 I.005 J-1.911 E.0406
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15945
G1 X102.991 Y147.994 E-.60056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1.5 F42000
G1 X104.089 Y129.074 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.529 J2.145 E.00695
G1 X123.275 Y129.012 E.30468
G1 X123.458 Y129.025 E.00297
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.192 E.05448
G1 X102.412 Y131.114 E.30338
G3 X104.031 Y129.089 I2.207 J.104 E.045
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.2512
G1 F15000
M204 S6000
G1 X104.202 Y129.378 E.00069
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.188125
G3 X104.637 Y129.309 I.349 J2.831 E.00123
G1 X122.984 Y129.301 E.12458
G3 X123.325 Y129.324 I-.039 J3.229 E.00232
; LINE_WIDTH: 0.246929
G3 X123.594 Y129.377 I-.21 J1.764 E.00253
G1 X123.71 Y129.412 E.00111
; LINE_WIDTH: 0.297992
G3 X124.86 Y130.392 I-.645 J1.923 E.01745
G1 X124.962 Y130.617 E.00279
; LINE_WIDTH: 0.256545
G3 X125.061 Y130.973 I-1.925 J.724 E.00354
; LINE_WIDTH: 0.188509
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.505 E.12311
G3 X125.077 Y149.925 I-4.235 J-.017 E.00286
; LINE_WIDTH: 0.249393
G3 X124.973 Y150.353 I-2.188 J-.302 E.0041
; LINE_WIDTH: 0.300332
G3 X124.008 Y151.46 I-1.911 J-.692 E.01707
G1 X123.919 Y151.504 E.00112
; LINE_WIDTH: 0.263934
G3 X123.427 Y151.661 I-.844 J-1.805 E.00512
; LINE_WIDTH: 0.188509
G1 X122.983 Y151.699 E.00303
G1 X104.892 Y151.699 E.12313
G3 X104.475 Y151.677 I-.002 J-3.828 E.00284
; LINE_WIDTH: 0.249196
G3 X104.051 Y151.574 I.256 J-1.994 E.00406
; LINE_WIDTH: 0.300275
G3 X102.94 Y150.608 I.684 J-1.908 E.01712
G1 X102.896 Y150.519 E.00112
; LINE_WIDTH: 0.26316
G3 X102.776 Y150.194 I1.801 J-.845 E.00341
G1 X102.737 Y150.015 E.00181
; LINE_WIDTH: 0.188209
G1 X102.701 Y149.583 E.00294
G1 X102.701 Y131.489 E.12293
; LINE_WIDTH: 0.196106
G1 X102.714 Y131.158 E.00236
; LINE_WIDTH: 0.239871
G3 X102.798 Y130.733 I2.031 J.182 E.00386
; LINE_WIDTH: 0.297038
G3 X104.03 Y129.433 I1.936 J.601 E.02083
; LINE_WIDTH: 0.2512
G1 X104.074 Y129.419 E.00043
; OBJECT_ID: 116
; WIPE_START
G1 X104.202 Y129.378 E-.051
G1 X104.457 Y129.325 E-.09925
G1 X104.637 Y129.309 E-.06863
G1 X106.061 Y129.308 E-.54112
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.575 Y127.968 Z1.5 F42000
M73 P44 R15
G1 X124.557 Y126.009 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.282 Y126.077 E.0046
G3 X123.794 Y121.493 I-.38 J-2.278 E.12224
G1 X123.968 Y121.491 E.00283
G3 X124.644 Y125.986 I-.066 J2.308 E.10447
G1 X124.615 Y125.994 E.00048
; WIPE_START
M204 S6000
G1 X124.282 Y126.077 E-.1304
G1 X123.834 Y126.109 E-.17063
G1 X123.466 Y126.069 E-.14102
G1 X123.114 Y125.972 E-.13862
G1 X122.944 Y125.902 E-.06977
G1 X122.695 Y125.758 E-.10957
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.646 Y123.306 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.678 Y123.503 E.00324
G3 X123.977 Y121.011 I-2.771 J.294 E.21918
G1 X124.096 Y121.017 E.00194
G3 X126.639 Y123.247 I-.189 J2.781 E.05902
M204 S10000
G1 X126.393 Y123.279 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0874161
G1 F15000
M204 S6000
G1 X126.449 Y123.729 E.00122
G3 X121.359 Y123.983 I-2.548 J.064 E.02118
G1 X121.353 Y123.871 E.0003
G1 X121.355 Y123.678 E.00052
G3 X126.385 Y123.219 I2.546 J.114 E.01966
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X126.449 Y123.729 E-.19511
G1 X126.415 Y124.232 E-.19165
G1 X126.281 Y124.716 E-.19074
G1 X126.102 Y125.088 E-.15711
G1 X126.063 Y125.142 E-.02539
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 12/95
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.5 I.738 J.968 P1  F42000
G1 X151.141 Y106.03 Z1.5
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X151.573 Y106.527 I-.054 J.484 E.01263
G1 X151.573 Y121.28 E.25759
G3 X151.068 Y121.773 I-.484 J.01 E.01382
G1 X136.32 Y121.773 E.25751
G3 X135.827 Y121.264 I-.01 J-.484 E.01389
G1 X135.827 Y106.52 E.25744
G3 X136.286 Y106.028 I.485 J-.008 E.01299
G1 X151.081 Y106.03 E.25831
M204 S10000
G1 X151.164 Y105.603 F42000
G1 F6000
M204 S6000
G1 X151.185 Y105.603 E.00036
G3 X152.002 Y106.518 I-.104 J.915 E.02343
G1 X152.002 Y121.291 E.25795
G3 X151.079 Y122.202 I-.911 J-.001 E.02518
G1 X136.309 Y122.202 E.2579
G3 X135.398 Y121.277 I.001 J-.911 E.02522
G1 X135.398 Y106.509 E.25786
G3 X136.268 Y105.6 I.918 J.008 E.02419
G1 X151.104 Y105.603 E.25905
M204 S250
G1 X151.165 Y105.192 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.228 Y105.192 E.00103
G3 X152.415 Y106.509 I-.151 J1.331 E.03148
G1 X152.415 Y121.303 E.24022
G3 X151.09 Y122.615 I-1.325 J-.012 E.03361
G1 X136.297 Y122.615 E.2402
G3 X134.985 Y121.289 I.012 J-1.325 E.03362
G1 X134.985 Y106.497 E.24019
G3 X136.25 Y105.186 I1.336 J.024 E.03255
G1 X151.105 Y105.191 E.24122
; WIPE_START
M204 S6000
G1 X151.228 Y105.192 E-.04684
G1 X151.482 Y105.243 E-.09857
G1 X151.723 Y105.344 E-.09942
G1 X151.902 Y105.46 E-.08086
G1 X152.09 Y105.638 E-.09854
G1 X152.217 Y105.808 E-.08067
G1 X152.327 Y106.032 E-.09473
G1 X152.396 Y106.283 E-.09886
G1 X152.41 Y106.444 E-.06152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X150.396 Y121.601 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42071
G1 F15000
M204 S6000
G1 X151.222 Y120.776 E.01898
G1 X151.222 Y120.211 E.00918
G1 X150.011 Y121.422 E.02785
G1 X149.447 Y121.422 E.00918
G1 X151.222 Y119.647 E.04084
G1 X151.222 Y119.082 E.00918
G1 X148.882 Y121.422 E.05383
G1 X148.317 Y121.422 E.00918
G1 X151.222 Y118.517 E.06682
G1 X151.222 Y117.953 E.00918
G1 X147.753 Y121.422 E.0798
G1 X147.188 Y121.422 E.00918
G1 X151.222 Y117.388 E.09279
G1 X151.222 Y116.824 E.00918
G1 X146.623 Y121.422 E.10578
G1 X146.059 Y121.422 E.00918
G1 X151.222 Y116.259 E.11877
G1 X151.222 Y115.694 E.00918
G1 X145.494 Y121.422 E.13176
G1 X144.93 Y121.422 E.00918
G1 X151.222 Y115.13 E.14475
G1 X151.222 Y114.565 E.00918
G1 X144.365 Y121.422 E.15774
G1 X143.8 Y121.422 E.00918
G1 X151.222 Y114 E.17073
G1 X151.222 Y113.436 E.00918
G1 X143.236 Y121.422 E.18372
G1 X142.671 Y121.422 E.00918
G1 X151.222 Y112.871 E.19671
G1 X151.222 Y112.306 E.00918
G1 X142.107 Y121.422 E.2097
G1 X141.542 Y121.422 E.00918
G1 X151.222 Y111.742 E.22269
G1 X151.222 Y111.177 E.00918
G1 X140.977 Y121.422 E.23567
G1 X140.413 Y121.422 E.00918
G1 X151.222 Y110.613 E.24866
G1 X151.222 Y110.048 E.00918
G1 X139.848 Y121.422 E.26165
G1 X139.283 Y121.422 E.00918
G1 X151.222 Y109.483 E.27464
G1 X151.222 Y108.919 E.00918
G1 X138.719 Y121.422 E.28763
G1 X138.154 Y121.422 E.00918
G1 X151.222 Y108.354 E.30062
G1 X151.222 Y107.789 E.00918
G1 X137.59 Y121.422 E.31361
G1 X137.025 Y121.422 E.00918
G1 X151.222 Y107.225 E.3266
G1 X151.222 Y106.66 E.00918
G1 X136.46 Y121.422 E.33959
G3 X136.232 Y121.39 I-.05 J-.476 E.00379
G3 X136.178 Y121.139 I.308 J-.197 E.00425
G1 X150.936 Y106.382 E.3395
G1 X150.371 Y106.381 E.00918
G1 X136.178 Y120.575 E.32651
G1 X136.178 Y120.01 E.00918
G1 X149.807 Y106.381 E.31353
G1 X149.242 Y106.381 E.00918
G1 X136.178 Y119.445 E.30054
G1 X136.178 Y118.881 E.00918
G1 X148.678 Y106.381 E.28755
G1 X148.113 Y106.381 E.00918
G1 X136.178 Y118.316 E.27456
G1 X136.178 Y117.752 E.00918
G1 X147.549 Y106.381 E.26158
G1 X146.984 Y106.381 E.00918
G1 X136.178 Y117.187 E.24859
G1 X136.178 Y116.622 E.00918
M73 P45 R15
G1 X146.419 Y106.381 E.2356
G1 X145.855 Y106.381 E.00918
G1 X136.178 Y116.058 E.22261
G1 X136.178 Y115.493 E.00918
G1 X145.29 Y106.381 E.20963
G1 X144.726 Y106.381 E.00918
G1 X136.178 Y114.928 E.19664
G1 X136.178 Y114.364 E.00918
G1 X144.161 Y106.381 E.18365
G1 X143.597 Y106.381 E.00918
G1 X136.178 Y113.799 E.17066
G1 X136.178 Y113.235 E.00918
G1 X143.032 Y106.381 E.15767
G1 X142.468 Y106.38 E.00918
G1 X136.178 Y112.67 E.14469
G1 X136.178 Y112.105 E.00918
G1 X141.903 Y106.38 E.1317
G1 X141.338 Y106.38 E.00918
G1 X136.178 Y111.541 E.11871
G1 X136.178 Y110.976 E.00918
G1 X140.774 Y106.38 E.10572
G1 X140.209 Y106.38 E.00918
G1 X136.178 Y110.411 E.09274
G1 X136.178 Y109.847 E.00918
G1 X139.645 Y106.38 E.07975
G1 X139.08 Y106.38 E.00918
G1 X136.178 Y109.282 E.06676
G1 X136.178 Y108.717 E.00918
G1 X138.516 Y106.38 E.05377
G1 X137.951 Y106.38 E.00918
G1 X136.178 Y108.153 E.04078
G1 X136.178 Y107.588 E.00918
G1 X137.387 Y106.38 E.0278
G1 X136.822 Y106.38 E.00918
G1 X135.999 Y107.203 E.01894
; OBJECT_ID: 105
; WIPE_START
G1 X136.822 Y106.38 E-.44233
G1 X137.387 Y106.38 E-.21453
G1 X137.195 Y106.572 E-.10314
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X139.332 Y113.899 Z1.6 F42000
G1 X148.802 Y146.36 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.6 F42000
G1 X151.648 Y134.698 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.379 E.20388
G3 X151.979 Y151.148 I-.752 J.017 E.02122
G1 X129.415 Y151.148 E.39398
G3 X128.653 Y150.439 I-.011 J-.752 E.02006
G1 X128.652 Y138.702 E.20494
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.752 J-.017 E.02016
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.03 Y127.053 I.791 J29.797 E.02843
G1 X152.107 Y127.06 E.00134
G3 X152.747 Y127.771 I-.11 J.743 E.0181
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.388 E.21151
G3 X151.988 Y151.576 I-1.182 J.007 E.03266
G1 X129.409 Y151.576 E.39423
G3 X128.225 Y150.452 I-.008 J-1.177 E.0315
G1 X128.224 Y138.274 E.21264
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.1277
G3 X129.348 Y126.625 I1.182 J-.007 E.03154
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.991 Y126.624 E.03523
G3 X153.175 Y127.754 I.006 J1.179 E.03159
G1 X153.176 Y135.126 E.12873
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.59 Y150.396 E.20356
G3 X151.996 Y151.99 I-1.597 J-.003 E.04064
G1 X129.403 Y151.99 E.36686
G3 X127.811 Y150.465 I-.002 J-1.591 E.03955
G1 X127.81 Y137.86 E.20467
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.597 J.003 E.03953
G1 X131.84 Y126.21 E.04066
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.997 Y126.21 E.03957
G3 X153.589 Y127.738 I0 J1.593 E.03957
G1 X153.59 Y135.54 E.1267
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.486 Y144.902 Z1.6 F42000
G1 X149.323 Y149.162 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
M204 S10000
G1 X150.762 Y147.723 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y149.116 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y148.024 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y147.903 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y147.782 E.00186
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09555
M204 S10000
G1 X150.019 Y138.916 F42000
; LINE_WIDTH: 0.42194
G1 F15000
M204 S6000
G1 X150.013 Y147.416 E.1387
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.2714
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y140.547 E.11209
G3 X131.387 Y130.784 I1275.752 J-4.882 E.1593
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.2714
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G1 X150.019 Y138.856 E.07135
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
; WIPE_START
G1 X150.775 Y130.793 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.201 Y129.389 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.166 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.408 E.18336
G1 X129.155 Y150.615 E.00365
G1 X129.382 Y150.724 E.00409
G1 X129.481 Y150.734 E.00162
G1 X151.95 Y150.734 E.36484
G1 X152.139 Y150.696 E.00313
G1 X152.287 Y150.546 E.00343
G1 X152.334 Y150.306 E.00396
G1 X152.334 Y139.116 E.18171
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.82 E.10497
G1 X152.23 Y127.569 E.00441
G1 X152.024 Y127.473 E.00368
G2 X150.816 Y127.466 I-.969 J62.117 E.01963
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.393 Y127.467 E.01934
G1 X129.188 Y127.552 E.00361
G1 X129.074 Y127.791 E.00429
G1 X129.066 Y134.284 E.10544
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.564 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.334 E.17568
G1 X151.909 Y150.336 E.36443
G1 X151.936 Y150.306 E.00065
G1 X151.936 Y139.514 E.17524
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.884 E.09745
G2 X151.083 Y127.865 I-.708 J12.177 E.01384
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.466 Y127.865 E.01383
G2 X129.464 Y133.886 I742.452 J3.284 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.305 Y128.263 E.00376
G1 X151.288 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.786 Y140.547 F42000
G1 F15000
M204 S6000
G1 X131.786 Y130.784 E.15853
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27007
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01116
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y140.607 E.11057
M204 S10000
G1 X132.184 Y140.547 F42000
G1 F15000
M204 S6000
G1 X132.184 Y130.784 E.15853
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27007
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y140.607 E.11057
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
M73 P46 R15
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X132.384 Y149.175 F42000
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
; OBJECT_ID: 94
; WIPE_START
G1 X132.101 Y149.148 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.471 Y149.352 Z1.6 F42000
G1 X103.043 Y149.925 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.028 Y149.872 E.00089
G3 X102.991 Y149.575 I1.881 J-.381 E.00487
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.919 J.013 E.04616
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.425 I-.075 J1.91 E.0463
G1 X124.81 Y149.505 E.29358
G3 X122.975 Y151.409 I-1.919 J-.013 E.04737
G1 X104.896 Y151.41 E.29358
G3 X103.137 Y150.23 I.013 J-1.919 E.03642
G1 X103.06 Y149.983 E.00421
; WIPE_START
M204 S6000
G1 X103.028 Y149.872 E-.0437
G1 X102.991 Y149.575 E-.11379
G1 X102.991 Y147.99 E-.60251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.37 Z1.6 F42000
G1 X104.089 Y129.072 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.521 J2.138 E.00695
G1 X123.274 Y129.012 E.30466
G1 X123.458 Y129.025 E.00298
G3 X125.39 Y131.204 I-.262 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.087 J-2.19 E.05449
G1 X102.412 Y131.114 E.30338
G3 X104.031 Y129.087 I2.198 J.096 E.04504
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25134
G1 F15000
M204 S6000
G1 X104.203 Y129.378 E.00071
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.18771
G1 X104.892 Y129.301 E.00295
G1 X122.98 Y129.301 E.12252
G1 X123.416 Y129.337 E.00296
; LINE_WIDTH: 0.254638
G3 X123.595 Y129.377 I-1.544 J7.333 E.00175
G1 X123.75 Y129.426 E.00154
; LINE_WIDTH: 0.298711
G3 X124.964 Y130.622 I-.683 J1.908 E.01987
; LINE_WIDTH: 0.251826
G3 X125.022 Y130.801 I-3.523 J1.226 E.00177
G1 X125.074 Y131.053 E.00241
; LINE_WIDTH: 0.188251
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.509 E.12295
G1 X125.082 Y149.874 E.00248
; LINE_WIDTH: 0.243863
G3 X125.046 Y150.096 I-2.237 J-.246 E.00204
G1 X124.988 Y150.31 E.002
; LINE_WIDTH: 0.297817
G3 X123.926 Y151.502 I-1.932 J-.653 E.01847
G1 X123.77 Y151.567 E.0019
; LINE_WIDTH: 0.251805
G3 X123.599 Y151.622 I-.989 J-2.81 E.00169
G1 X123.348 Y151.674 E.0024
; LINE_WIDTH: 0.188341
G1 X122.983 Y151.699 E.00249
G1 X104.891 Y151.699 E.12302
G3 X104.477 Y151.677 I-.008 J-3.724 E.00282
; LINE_WIDTH: 0.249187
G3 X104.302 Y151.646 I.431 J-2.975 E.00164
G1 X104.049 Y151.574 E.00244
; LINE_WIDTH: 0.298518
G3 X102.898 Y150.525 I.691 J-1.915 E.01804
G1 X102.834 Y150.374 E.00186
; LINE_WIDTH: 0.251173
G3 X102.725 Y149.936 I1.87 J-.7 E.00423
; LINE_WIDTH: 0.18803
G3 X102.71 Y149.794 I2.33 J-.312 E.00097
G1 X102.701 Y131.489 E.12423
; LINE_WIDTH: 0.206003
G3 X102.737 Y130.984 I3.463 J-.008 E.0038
; LINE_WIDTH: 0.252235
G3 X102.777 Y130.805 I2.251 J.414 E.00173
G1 X102.812 Y130.691 E.00112
; LINE_WIDTH: 0.297844
G3 X103.874 Y129.498 I1.934 J.654 E.01848
G1 X104.026 Y129.434 E.00185
; LINE_WIDTH: 0.25134
G1 X104.074 Y129.419 E.00047
; OBJECT_ID: 116
; WIPE_START
G1 X104.203 Y129.378 E-.05143
G1 X104.457 Y129.325 E-.09882
G1 X104.892 Y129.301 E-.16544
G1 X106.061 Y129.301 E-.44431
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.576 Y127.966 Z1.6 F42000
G1 X124.523 Y126.02 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.471 Y126.037 E.00088
G3 X123.787 Y121.493 I-.571 J-2.238 E.12531
G1 X123.968 Y121.491 E.00295
G3 X124.902 Y125.88 I-.068 J2.308 E.09988
G1 X124.579 Y125.999 E.00559
; WIPE_START
M204 S6000
G1 X124.471 Y126.037 E-.04339
G1 X124.016 Y126.107 E-.17488
G1 X123.558 Y126.085 E-.1743
G1 X123.112 Y125.971 E-.17511
G1 X122.7 Y125.774 E-.17335
G1 X122.661 Y125.743 E-.01898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.647 Y123.317 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.661 Y123.388 E.00116
G3 X123.985 Y121.012 I-2.758 J.411 E.22143
G1 X124.208 Y121.027 E.00364
G3 X126.618 Y123.165 I-.306 J2.772 E.05578
G1 X126.636 Y123.258 E.00154
M204 S10000
G1 X126.4 Y123.303 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0873299
G1 F15000
M204 S6000
G1 X126.423 Y123.426 E.00033
G3 X121.419 Y124.383 I-2.522 J.374 E.02093
G1 X121.379 Y124.174 E.00057
G1 X121.353 Y123.875 E.00081
G3 X126.384 Y123.218 I2.549 J-.075 E.02012
G1 X126.389 Y123.245 E.00007
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X126.423 Y123.426 E-.07014
G1 X126.45 Y123.724 E-.11378
G1 X126.448 Y123.927 E-.07706
G1 X126.374 Y124.423 E-.19059
G1 X126.314 Y124.626 E-.08058
G1 X126.2 Y124.904 E-.11421
G1 X126.049 Y125.162 E-.11364
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 13/95
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S186.15
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.669 J1.017 P1  F42000
G1 X144.209 Y113.211 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G3 X143.666 Y113.038 I-.518 J.688 E.08431
G1 X143.751 Y113.04 E.00148
G3 X144.16 Y113.177 I-.059 J.859 E.00762
M204 S10000
G1 X144.478 Y112.872 F42000
G1 F6000
M204 S6000
G1 X144.645 Y113.028 E.00399
G3 X143.661 Y112.61 I-.952 J.871 E.12228
G1 X143.776 Y112.612 E.00201
G3 X144.428 Y112.839 I-.083 J1.287 E.0122
; WIPE_START
G1 X144.645 Y113.028 E-.10942
G1 X144.796 Y113.218 E-.09217
G1 X144.914 Y113.46 E-.10233
G1 X144.977 Y113.709 E-.09742
G1 X144.989 Y113.951 E-.09216
G1 X144.958 Y114.192 E-.09219
G1 X144.885 Y114.413 E-.08841
G1 X144.775 Y114.61 E-.08588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.056 Y108.291 Z1.7 F42000
G1 X151.175 Y105.163 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.247 Y105.163 E.00116
G3 X152.444 Y106.492 I-.153 J1.342 E.03174
G1 X152.443 Y121.321 E.24079
G3 X151.107 Y122.644 I-1.336 J-.013 E.03387
G1 X136.279 Y122.644 E.24077
G3 X134.956 Y121.306 I.013 J-1.336 E.03389
G1 X134.956 Y106.479 E.24076
G3 X136.23 Y105.158 I1.348 J.025 E.03278
G1 X151.115 Y105.163 E.24169
; WIPE_START
M204 S6000
G1 X151.247 Y105.163 E-.05001
G1 X151.503 Y105.215 E-.09939
G1 X151.702 Y105.294 E-.08155
G1 X151.926 Y105.434 E-.1002
G1 X152.116 Y105.613 E-.09927
G1 X152.243 Y105.786 E-.08143
G1 X152.355 Y106.01 E-.09511
G1 X152.424 Y106.262 E-.0995
G1 X152.436 Y106.403 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X152.214 Y106.352 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X151.248 Y105.385 E.02219
G1 X150.675 Y105.376
G1 X152.225 Y106.925 E.03559
G1 X152.225 Y107.489
G1 X150.111 Y105.376 E.04853
G1 X149.548 Y105.376
G1 X152.225 Y108.053 E.06147
G1 X152.225 Y108.616
G1 X148.984 Y105.376 E.07441
G1 X148.421 Y105.376
G1 X152.225 Y109.18 E.08735
G1 X152.225 Y109.743
G1 X147.857 Y105.376 E.10029
G1 X147.294 Y105.376
G1 X152.224 Y110.307 E.11323
G1 X152.224 Y110.871
G1 X146.73 Y105.376 E.12618
G1 X146.166 Y105.376
G1 X152.224 Y111.434 E.13912
G1 X152.224 Y111.998
G1 X145.603 Y105.376 E.15206
G1 X145.039 Y105.376
G1 X152.224 Y112.561 E.165
G1 X152.224 Y113.125
G1 X144.476 Y105.376 E.17794
G1 X143.912 Y105.376
G1 X152.224 Y113.689 E.19088
G1 X152.224 Y114.252
G1 X143.349 Y105.376 E.20382
G1 X142.785 Y105.377
G1 X152.224 Y114.816 E.21676
G1 X152.224 Y115.379
G1 X142.222 Y105.377 E.2297
G1 X141.658 Y105.377
G1 X152.224 Y115.943 E.24265
G1 X152.224 Y116.507
G1 X141.094 Y105.377 E.25559
G1 X140.531 Y105.377
G1 X152.224 Y117.07 E.26853
G1 X152.224 Y117.634
G1 X139.967 Y105.377 E.28147
G1 X139.404 Y105.377
G1 X152.224 Y118.197 E.29441
G1 X152.224 Y118.761
G1 X138.84 Y105.377 E.30735
G1 X138.277 Y105.377
G1 X152.224 Y119.325 E.32029
G1 X152.224 Y119.888
G1 X137.713 Y105.377 E.33323
G1 X137.15 Y105.377
G1 X144.253 Y112.48 E.16311
G1 X143.589 Y112.38
G1 X136.586 Y105.377 E.16081
G1 X136.049 Y105.403
G1 X143.132 Y112.486 E.16265
G1 X142.773 Y112.691
G1 X135.656 Y105.574 E.16343
G1 X135.374 Y105.856
G1 X142.49 Y112.972 E.1634
G1 X142.286 Y113.332
G1 X135.203 Y106.248 E.16266
G1 X135.176 Y106.785
G1 X142.18 Y113.789 E.16085
G1 X142.28 Y114.453
G1 X135.176 Y107.348 E.16314
; WIPE_START
M204 S6000
G1 X136.59 Y108.763 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.313 Y112.376 Z1.7 F42000
G1 X145.121 Y113.348 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X152.224 Y120.452 E.16312
G1 X152.224 Y121.015
G1 X145.22 Y114.011 E.16085
G1 X145.114 Y114.469
G1 X152.197 Y121.552 E.16266
G1 X152.026 Y121.944
G1 X144.909 Y114.828 E.16342
G1 X144.628 Y115.11
G1 X151.744 Y122.226 E.16342
G1 X151.352 Y122.397
G1 X144.268 Y115.314 E.16266
G1 X143.811 Y115.42
G1 X150.815 Y122.425 E.16085
G1 X150.252 Y122.425
G1 X143.147 Y115.32 E.16315
; WIPE_START
M204 S6000
G1 X144.561 Y116.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.67 Y122.405 Z1.7 F42000
G1 X149.688 Y122.425 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X135.176 Y107.912 E.33327
G1 X135.176 Y108.476
G1 X149.125 Y122.425 E.32032
M73 P47 R15
G1 X148.561 Y122.425
G1 X135.176 Y109.039 E.30738
G1 X135.176 Y109.603
G1 X147.997 Y122.425 E.29444
G1 X147.434 Y122.425
G1 X135.176 Y110.166 E.2815
G1 X135.176 Y110.73
G1 X146.87 Y122.425 E.26855
G1 X146.307 Y122.424
G1 X135.176 Y111.294 E.25561
G1 X135.176 Y111.857
G1 X145.743 Y122.424 E.24267
G1 X145.179 Y122.424
G1 X135.176 Y112.421 E.22973
G1 X135.176 Y112.984
G1 X144.616 Y122.424 E.21678
G1 X144.052 Y122.424
G1 X135.176 Y113.548 E.20384
G1 X135.176 Y114.112
G1 X143.488 Y122.424 E.1909
G1 X142.925 Y122.424
G1 X135.176 Y114.675 E.17796
G1 X135.176 Y115.239
G1 X142.361 Y122.424 E.16501
G1 X141.798 Y122.424
G1 X135.176 Y115.802 E.15207
G1 X135.175 Y116.366
G1 X141.234 Y122.424 E.13913
G1 X140.67 Y122.424
G1 X135.175 Y116.93 E.12618
G1 X135.175 Y117.493
G1 X140.107 Y122.424 E.11324
G1 X139.543 Y122.424
G1 X135.175 Y118.057 E.1003
G1 X135.175 Y118.62
G1 X138.98 Y122.424 E.08736
G1 X138.416 Y122.424
G1 X135.175 Y119.184 E.07441
G1 X135.175 Y119.747
G1 X137.852 Y122.424 E.06147
G1 X137.289 Y122.424
G1 X135.175 Y120.311 E.04853
G1 X135.175 Y120.875
G1 X136.725 Y122.424 E.03559
G1 X136.152 Y122.415
G1 X135.185 Y121.448 E.0222
M204 S10000
G1 X135.626 Y122.204 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.074282
G1 F15000
M204 S6000
G3 X135.402 Y121.979 I1.704 J-1.924 E.00068
; WIPE_START
G1 X135.626 Y122.204 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.471 Y114.573 Z1.7 F42000
G1 X135.297 Y106.061 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0790647
G1 F15000
M204 S6000
G1 X135.208 Y106.218 E.00042
; WIPE_START
G1 X135.297 Y106.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.929 Y105.952 Z1.7 F42000
G1 X151.998 Y105.822 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.0740274
G1 F15000
M204 S6000
G2 X151.771 Y105.596 I-2.67 J2.456 E.00069
; WIPE_START
G1 X151.998 Y105.822 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.849 Y111.456 Z1.7 F42000
G1 X145.108 Y113.361 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.180724
G1 F15000
M204 S6000
G1 X145.136 Y113.208 E.00101
G1 X145.031 Y113.068 E.00113
; LINE_WIDTH: 0.126283
G1 X144.742 Y112.752 E.00183
G1 X144.499 Y112.543 E.00137
; LINE_WIDTH: 0.182416
G1 X144.32 Y112.413 E.00145
; WIPE_START
G1 X144.499 Y112.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.733 Y115.498 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.092523
G1 F15000
M204 S6000
G1 X143.507 Y115.398 E.00072
M204 S10000
G1 X143.827 Y115.404 F42000
; LINE_WIDTH: 0.0916638
G1 F15000
M204 S6000
G1 X143.606 Y115.497 E.00069
M204 S10000
G1 X143.08 Y115.387 F42000
; LINE_WIDTH: 0.193148
G1 F15000
M204 S6000
G1 X142.951 Y115.295 E.00111
; LINE_WIDTH: 0.160862
G1 X142.845 Y115.212 E.00077
; LINE_WIDTH: 0.124229
G1 X142.622 Y115.013 E.00125
G1 X142.36 Y114.721 E.00165
; LINE_WIDTH: 0.175946
G1 X142.265 Y114.593 E.001
G1 X142.271 Y114.554 E.00025
; LINE_WIDTH: 0.140176
G1 X142.275 Y114.532 E.00011
; LINE_WIDTH: 0.103731
G1 X142.294 Y114.439 E.00032
M204 S10000
G1 X142.269 Y113.375 F42000
; LINE_WIDTH: 0.0763834
G1 F15000
M204 S6000
G1 X142.185 Y113.512 E.00036
; WIPE_START
G1 X142.269 Y113.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.921 Y114.274 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.106 Y114.078 E.00439
G1 X144.131 Y113.836 E.00395
G1 X144.03 Y113.604 E.00411
G1 X143.884 Y113.499 E.00291
G1 X143.628 Y113.464 E.0042
G1 X143.414 Y113.572 E.00389
G1 X143.27 Y113.8 E.00439
G1 X143.285 Y114.05 E.00407
G1 X143.442 Y114.25 E.00413
G1 X143.66 Y114.342 E.00384
G1 X143.863 Y114.289 E.0034
M204 S10000
G1 X143.733 Y113.856 F42000
; LINE_WIDTH: 0.4766
G1 F15000
M204 S6000
G2 X143.729 Y113.954 I-.028 J.048 E.00431
; OBJECT_ID: 105
; WIPE_START
G1 X143.676 Y113.954 E-.18211
G1 X143.647 Y113.905 E-.19264
G1 X143.676 Y113.856 E-.19265
G1 X143.733 Y113.856 E-.1926
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.909 Y121.397 Z1.7 F42000
G1 X148.802 Y146.36 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.7 F42000
G1 X151.648 Y134.698 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.0192
G1 X152.74 Y150.507 E.20612
G3 X151.979 Y151.148 I-.744 J-.111 E.01898
G1 X129.414 Y151.148 E.394
G3 X128.653 Y150.429 I-.013 J-.748 E.02024
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.756 J-.013 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.027 Y127.053 I.792 J32.552 E.02837
G1 X152.2 Y127.08 E.00307
G3 X152.747 Y127.771 I-.212 J.729 E.0164
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.175 Y150.446 E.21254
G3 X151.988 Y151.576 I-1.18 J-.051 E.03164
G1 X129.408 Y151.576 E.39424
G3 X128.225 Y150.446 I-.007 J-1.177 E.0316
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.812 E.1277
G3 X129.348 Y126.625 I1.187 J-.002 E.0315
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G1 X151.992 Y126.624 E.03524
G3 X153.175 Y127.754 I.007 J1.177 E.0316
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.589 Y150.462 E.20464
G3 X151.996 Y151.99 I-1.596 J-.069 E.03956
G1 X129.403 Y151.99 E.36686
G3 X127.811 Y150.462 I-.002 J-1.591 E.03959
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.603 J.008 E.03949
G1 X131.84 Y126.21 E.04067
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.997 Y126.21 E.03957
G3 X153.589 Y127.738 I.002 J1.591 E.03958
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.7 F42000
G1 X132.384 Y149.175 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
M73 P47 R14
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
M73 P48 R14
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.138 Y149.539 E.33896
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01021
G1 X150.411 Y147.417 E.12322
G3 X150.296 Y147.971 I-1.394 J0 E.00925
G1 X150.002 Y148.403 E.00849
G1 X149.57 Y148.697 E.00848
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.08 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.0066
G1 X149.721 Y148.121 E.0061
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.536 Y149.937 E.35328
G1 X151.537 Y139.913 E.16342
G1 X151.06 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y134.484 E.0751
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.305 Y128.263 E.00376
G1 X151.288 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.118 Y128.308 E.01162
G1 X130.101 Y128.268 E.00071
G1 X129.863 Y128.269 E.00388
G1 X129.863 Y133.487 E.08506
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.333 E.17568
G1 X151.934 Y150.336 E.36484
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.934 Y127.887 E.0974
G2 X151.083 Y127.865 I-.706 J10.495 E.01384
G1 X151.019 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.384 Y128.011 E.00694
G1 X130.321 Y127.868 E.00254
G1 X129.464 Y127.873 E.01391
G1 X129.464 Y133.886 E.09763
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.396 E.18317
G1 X129.142 Y150.6 E.00352
G1 X129.33 Y150.72 E.00363
G1 X129.471 Y150.734 E.00229
G1 X151.961 Y150.734 E.36519
G1 X152.213 Y150.646 E.00433
G1 X152.327 Y150.424 E.00404
G1 X152.333 Y150.338 E.00139
G1 X152.334 Y139.116 E.18223
G1 X151.434 Y139.116 E.01462
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.821 E.10495
G1 X152.206 Y127.547 E.00491
G1 X151.9 Y127.466 E.00513
G1 X150.816 Y127.466 E.01761
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.651 Y127.715 E.00231
G3 X130.584 Y127.468 I.243 J-.197 E.00426
G1 X129.337 Y127.475 E.02025
G1 X129.13 Y127.618 E.00408
G1 X129.066 Y127.873 E.00427
G1 X129.066 Y134.284 E.1041
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.302 E.00219
G1 X130.652 Y130.164 E.01341
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X131.786 Y130.784 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y147.416 E.27008
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01115
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.844 E.2691
M204 S10000
G1 X132.184 Y130.784 F42000
G1 F15000
M204 S6000
G1 X132.196 Y130.716 E.00112
G1 X132.293 Y130.606 E.00238
G1 X132.384 Y130.584 E.00151
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y147.416 E.27008
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.844 E.2691
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.761 E.00917
G1 X130.261 Y133.146 E.07189
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.350318
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09535
M204 S10000
G1 X150.761 Y147.723 F42000
; LINE_WIDTH: 0.394665
G1 F15000
M204 S6000
G1 X150.738 Y147.863 E.00216
; LINE_WIDTH: 0.431755
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.48565
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.709 E.01296
G1 X149.742 Y149.093 E.01294
; LINE_WIDTH: 0.469032
G1 X149.602 Y149.116 E.00258
; LINE_WIDTH: 0.432315
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.395599
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.432315
G1 X149.604 Y149.125 E.00237
; LINE_WIDTH: 0.486129
G1 X149.744 Y149.107 E.00268
G1 X150.705 Y149.107 E.01819
G1 X150.705 Y148.145 E.01821
; LINE_WIDTH: 0.468845
G1 X150.721 Y148.024 E.00222
; LINE_WIDTH: 0.431755
G1 X150.737 Y147.903 E.00204
; LINE_WIDTH: 0.394665
G1 X150.753 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.7 F42000
G1 X103.04 Y149.931 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00584
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.079 J1.913 E.04626
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.914 J-.005 E.04745
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.989 I.008 J-1.914 E.04059
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15932
G1 X102.991 Y147.994 E-.60068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.374 Z1.7 F42000
G1 X104.089 Y129.074 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00695
G1 X123.273 Y129.012 E.30465
G1 X123.458 Y129.025 E.003
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.192 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.797 I.09 J-2.193 E.05448
G1 X102.412 Y131.112 E.30341
G3 X104.031 Y129.089 I2.207 J.107 E.04496
M204 S10000
G1 X104.131 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251312
G1 F15000
M204 S6000
G1 X104.202 Y129.378 E.0007
G1 X104.457 Y129.325 E.00244
; LINE_WIDTH: 0.18772
G1 X104.892 Y129.301 E.00295
G1 X122.984 Y129.301 E.12256
G3 X123.41 Y129.336 I-.027 J2.99 E.0029
; LINE_WIDTH: 0.253616
G3 X123.739 Y129.422 I-.327 J1.915 E.00323
; LINE_WIDTH: 0.297997
G3 X124.862 Y130.395 I-.675 J1.914 E.01714
G1 X124.972 Y130.644 E.00306
; LINE_WIDTH: 0.251251
G3 X125.073 Y131.047 I-1.903 J.695 E.0039
; LINE_WIDTH: 0.188342
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.504 E.12298
G3 X125.076 Y149.929 I-4.219 J-.017 E.00289
; LINE_WIDTH: 0.249579
G3 X125.047 Y150.097 I-3.402 J-.507 E.00159
G1 X124.973 Y150.353 E.00247
; LINE_WIDTH: 0.300291
G3 X124.304 Y151.272 I-1.905 J-.685 E.01308
G1 X124.149 Y151.38 E.00214
G1 X123.91 Y151.509 E.0031
; LINE_WIDTH: 0.262717
G3 X123.595 Y151.623 I-.861 J-1.885 E.0033
G1 X123.421 Y151.662 E.00175
; LINE_WIDTH: 0.188409
G3 X123.195 Y151.69 I-.393 J-2.269 E.00155
G1 X104.892 Y151.699 E.1245
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.243352
G3 X104.302 Y151.646 I.28 J-2.44 E.00205
G1 X104.101 Y151.591 E.00189
; LINE_WIDTH: 0.297746
G3 X102.939 Y150.608 I.638 J-1.931 E.01756
G1 X102.834 Y150.374 E.00289
; LINE_WIDTH: 0.255458
G3 X102.776 Y150.194 I5.479 J-1.866 E.0018
G1 X102.736 Y150.009 E.00181
; LINE_WIDTH: 0.188209
G3 X102.71 Y149.794 I5.336 J-.739 E.00147
G1 X102.701 Y131.489 E.12436
; LINE_WIDTH: 0.196991
G1 X102.715 Y131.143 E.00247
; LINE_WIDTH: 0.242322
G3 X102.8 Y130.726 I2.42 J.276 E.00383
G1 X102.804 Y130.715 E.00011
; LINE_WIDTH: 0.297605
G3 X103.718 Y129.581 I1.932 J.62 E.01677
G1 X104.026 Y129.435 E.00384
; LINE_WIDTH: 0.251312
G1 X104.074 Y129.419 E.00047
; OBJECT_ID: 116
; WIPE_START
G1 X104.202 Y129.378 E-.05104
G1 X104.457 Y129.325 E-.09904
G1 X104.892 Y129.301 E-.16545
G1 X106.061 Y129.301 E-.44446
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; start printing object, unique label id: 116
M624 CAAAAAAAAAA=
M204 S10000
G1 X113.579 Y127.981 Z1.7 F42000
G1 X124.494 Y126.065 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X124.295 Y126.115 E.00333
G3 X123.839 Y121.453 I-.386 J-2.316 E.12494
G1 X123.97 Y121.453 E.00213
G3 X124.661 Y126.024 I-.062 J2.347 E.10633
G1 X124.552 Y126.05 E.00182
; WIPE_START
M204 S6000
G1 X124.295 Y126.115 E-.10067
G1 X123.923 Y126.148 E-.14202
G1 X123.461 Y126.107 E-.17628
G1 X123.012 Y125.973 E-.17785
G1 X122.633 Y125.772 E-.16319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.61 Y123.34 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X126.631 Y123.388 E.00086
G3 X123.939 Y121.049 I-2.72 J.412 E.21763
G1 X124.094 Y121.055 E.00253
G3 X126.511 Y122.901 I-.183 J2.745 E.05233
G1 X126.597 Y123.281 E.00632
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F3600
M204 S6000
G1 X126.631 Y123.388 E-.04266
G1 X126.646 Y123.609 E-.0841
G1 X126.642 Y124.047 E-.16637
G1 X126.594 Y124.37 E-.12422
G1 X126.539 Y124.585 E-.08425
G1 X126.353 Y125.048 E-.18977
G1 X126.258 Y125.202 E-.06864
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 116
M625
; layer num/total_layer_count: 14/95
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S196.35
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.7 I.757 J.953 P1  F42000
G1 X151.162 Y105.404 Z1.7
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X152.221 Y106.685 I-.254 J1.289 E.02922
G1 X152.221 Y121.115 E.23432
G3 X150.915 Y122.421 I-1.314 J-.008 E.03325
G1 X136.485 Y122.421 E.23432
G3 X135.179 Y121.115 I.008 J-1.314 E.03325
G1 X135.179 Y106.685 E.23432
G3 X136.485 Y105.379 I1.314 J.008 E.03325
G1 X150.915 Y105.379 E.23432
G3 X151.103 Y105.394 I-.008 J1.314 E.00306
; WIPE_START
M204 S6000
G1 X151.409 Y105.478 E-.12072
G1 X151.637 Y105.6 E-.0981
G1 X151.836 Y105.764 E-.09812
G1 X152 Y105.963 E-.09813
G1 X152.122 Y106.191 E-.09814
G1 X152.197 Y106.438 E-.09811
G1 X152.221 Y106.685 E-.09415
G1 X152.221 Y106.828 E-.05454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.737 Y105.329 Z1.8 F42000
G1 X143.758 Y105.132 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.265 Y105.135 E.1219
G3 X152.472 Y106.475 I-.155 J1.353 E.032
G1 X152.472 Y121.339 E.24136
G3 X151.124 Y122.672 I-1.347 J-.015 E.03414
G1 X136.261 Y122.672 E.24135
G3 X134.928 Y121.323 I.015 J-1.347 E.03415
G1 X134.928 Y106.461 E.24133
G3 X136.211 Y105.13 I1.359 J.027 E.03301
G1 X143.698 Y105.132 E.12157
; WIPE_START
M204 S6000
G1 X145.698 Y105.133 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.795 Y112.192 Z1.8 F42000
G1 X142.545 Y112.798 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.775 Y112.594 E.00536
G3 X143.658 Y112.303 I.92 J1.305 E.01647
G1 X143.794 Y112.306 E.00238
G3 X142.502 Y112.838 I-.1 J1.593 E.1499
M204 S10000
G1 X142.265 Y112.476 F42000
G1 F6000
M204 S6000
G1 X142.528 Y112.245 E.0061
G3 X143.654 Y111.874 I1.169 J1.654 E.02101
G1 X143.82 Y111.878 E.0029
G3 X142.219 Y112.514 I-.123 J2.022 E.19112
M204 S250
G1 X141.995 Y112.165 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.289 Y111.909 E.00634
G3 X143.649 Y111.461 I1.41 J1.99 E.0236
G1 X143.844 Y111.464 E.00316
G3 X141.924 Y112.227 I-.146 J2.435 E.21418
G1 X141.949 Y112.204 E.00055
; WIPE_START
M204 S6000
G1 X142.289 Y111.909 E-.17111
G1 X142.709 Y111.67 E-.18361
G1 X143.17 Y111.518 E-.18445
G1 X143.649 Y111.461 E-.18336
G1 X143.748 Y111.463 E-.03747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 14 start: 83,94,105
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer14 end: 83,94,105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X143.864 Y113.566 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.603 Y113.533 E.00426
G1 X143.418 Y113.647 E.00353
G1 X143.325 Y113.843 E.00352
G1 X143.395 Y114.125 E.00473
G1 X143.574 Y114.257 E.00361
G1 X143.792 Y114.268 E.00355
G1 X143.984 Y114.149 E.00367
G1 X144.076 Y113.948 E.00359
G1 X144.079 Y113.879 E.00113
G1 X143.997 Y113.664 E.00373
G1 X143.912 Y113.601 E.00172
M204 S10000
G1 X143.729 Y113.87 F42000
; LINE_WIDTH: 0.35916
G1 F15000
M204 S6000
G1 X143.666 Y113.907 E.00101
G1 X143.713 Y113.934 E.00076
M204 S10000
G1 X142.971 Y113.633 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.922 Y113.926 E.00482
G1 X143.038 Y114.312 E.00653
G1 X143.224 Y114.519 E.00452
G1 X143.501 Y114.656 E.00502
G1 X143.817 Y114.673 E.00513
G1 X144.106 Y114.567 E.005
G1 X144.332 Y114.359 E.005
G1 X144.461 Y114.079 E.00499
G1 X144.477 Y113.857 E.00362
G1 X144.392 Y113.548 E.0052
G1 X144.201 Y113.305 E.00502
G1 X144.036 Y113.197 E.00319
G1 X143.644 Y113.124 E.00648
G1 X143.37 Y113.196 E.0046
G1 X143.124 Y113.377 E.00496
M73 P49 R14
G1 X143.001 Y113.582 E.00387
M204 S10000
G1 X142.576 Y114.201 F42000
G1 F15000
M204 S6000
G1 X142.681 Y114.498 E.00512
G1 X142.979 Y114.836 E.00731
G1 X143.398 Y115.042 E.00759
G1 X143.873 Y115.069 E.00772
G1 X144.312 Y114.911 E.00758
G1 X144.656 Y114.595 E.00758
G1 X144.85 Y114.171 E.00757
G2 X144.81 Y113.494 I-1.296 J-.263 E.01115
G1 X144.566 Y113.096 E.00758
G1 X144.185 Y112.823 E.00761
G1 X143.762 Y112.721 E.00707
G1 X143.316 Y112.782 E.00731
G1 X142.913 Y113.019 E.00759
G1 X142.633 Y113.391 E.00756
G1 X142.519 Y113.861 E.00786
G1 X142.566 Y114.142 E.00462
; OBJECT_ID: 105
; WIPE_START
G1 X142.519 Y113.861 E-.10805
G1 X142.633 Y113.391 E-.18398
G1 X142.913 Y113.019 E-.1769
G1 X143.316 Y112.782 E-.17764
G1 X143.612 Y112.742 E-.11343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y120.285 Z1.8 F42000
G1 X148.802 Y146.36 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X148.802 Y147.202 E.0147
G1 X132.598 Y147.202 E.28293
G1 X132.598 Y130.998 E.28293
G1 X148.802 Y130.998 E.28293
G1 X148.802 Y146.3 E.26718
M204 S10000
G1 X148.374 Y146.36 F42000
G1 F6000
M204 S6000
G1 X148.374 Y146.774 E.00722
G1 X133.026 Y146.774 E.26796
G1 X133.026 Y131.426 E.26796
G1 X148.374 Y131.426 E.26796
G1 X148.374 Y146.3 E.2597
M204 S250
G1 X147.96 Y146.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.318 Y139.454 Z1.8 F42000
G1 X151.648 Y134.698 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X151.648 Y138.702 E.06991
G1 X152.748 Y138.702 E.01921
G1 X152.748 Y150.38 E.20389
G3 X151.979 Y151.148 I-.752 J.017 E.02122
G1 X129.413 Y151.148 E.39401
G3 X128.653 Y150.429 I-.012 J-.748 E.02022
G1 X128.652 Y138.702 E.20476
G1 X129.752 Y138.702 E.0192
G1 X129.752 Y134.698 E.06991
G1 X128.652 Y134.698 E.01921
G1 X128.652 Y127.821 E.12007
G3 X129.361 Y127.053 I.756 J-.013 E.02014
G1 X130.998 Y127.053 E.02859
G1 X130.998 Y127.352 E.00523
G1 X135.002 Y127.352 E.06991
G1 X135.002 Y127.052 E.00524
G1 X146.398 Y127.052 E.19898
G1 X146.398 Y127.352 E.00524
G1 X150.402 Y127.352 E.06991
G1 X150.402 Y127.052 E.00524
G3 X152.024 Y127.053 I.793 J34.944 E.02832
G3 X152.747 Y127.771 I-.026 J.749 E.01956
G1 X152.748 Y134.698 E.12095
G1 X151.708 Y134.698 E.01816
M204 S10000
G1 X152.076 Y135.126 F42000
G1 F6000
M204 S6000
G1 X152.076 Y138.274 E.05495
G1 X153.176 Y138.274 E.01921
G1 X153.176 Y150.388 E.21152
G3 X151.988 Y151.576 I-1.18 J.009 E.03267
G1 X129.408 Y151.576 E.39425
G3 X128.225 Y150.446 I-.007 J-1.177 E.03159
G1 X128.224 Y138.274 E.21253
G1 X129.323 Y138.274 E.01921
G1 X129.323 Y135.126 E.05495
G1 X128.223 Y135.126 E.01921
G1 X128.223 Y127.813 E.1277
G3 X129.348 Y126.625 I1.187 J-.003 E.0315
G1 X131.426 Y126.624 E.03629
G1 X131.426 Y126.924 E.00523
G1 X134.573 Y126.924 E.05495
G1 X134.573 Y126.624 E.00524
G1 X146.826 Y126.624 E.21394
G1 X146.826 Y126.924 E.00524
G1 X149.974 Y126.924 E.05495
G1 X149.974 Y126.624 E.00524
G3 X152.046 Y126.625 I1.009 J44.908 E.03619
G3 X153.175 Y127.754 I-.056 J1.185 E.03059
G1 X153.176 Y135.126 E.12872
G1 X152.136 Y135.126 E.01816
M204 S250
G1 X152.49 Y135.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.59 Y150.396 E.20356
G3 X151.996 Y151.99 I-1.593 J.001 E.04067
G1 X129.403 Y151.99 E.36687
G3 X127.811 Y150.462 I-.002 J-1.591 E.03958
G1 X127.81 Y137.86 E.20463
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.603 J.008 E.0395
G1 X131.84 Y126.21 E.04067
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.997 Y126.21 E.03958
G3 X153.589 Y127.738 I-.001 J1.594 E.03956
G1 X153.59 Y135.54 E.12669
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.892 Y141.361 Z1.8 F42000
G1 X132.384 Y149.175 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373382
G1 F15000
M204 S6000
G1 X132.142 Y149.148 E.00349
; LINE_WIDTH: 0.418985
G1 X131.9 Y149.121 E.00394
; LINE_WIDTH: 0.48395
G1 X131.658 Y149.093 E.00458
G1 X131.092 Y148.709 E.0129
G1 X130.707 Y148.142 E.01291
; LINE_WIDTH: 0.468848
G1 X130.684 Y148.002 E.00258
; LINE_WIDTH: 0.431765
G1 X130.662 Y147.863 E.00237
; LINE_WIDTH: 0.394682
G1 X130.639 Y147.723 E.00216
G1 X130.657 Y147.863 E.00216
; LINE_WIDTH: 0.431765
G1 X130.676 Y148.004 E.00237
; LINE_WIDTH: 0.486115
G1 X130.695 Y148.145 E.00269
G1 X130.695 Y149.107 E.01821
G1 X131.656 Y149.107 E.01819
; LINE_WIDTH: 0.464588
G1 X131.878 Y149.128 E.00404
; LINE_WIDTH: 0.418985
G1 X132.101 Y149.148 E.00362
; LINE_WIDTH: 0.373382
G1 X132.324 Y149.169 E.00321
M204 S10000
G1 X130.639 Y147.723 F42000
; LINE_WIDTH: 0.350438
G1 F15000
M204 S6000
G1 X130.625 Y147.416 E.00411
G1 X130.625 Y140.607 E.09127
M204 S10000
G1 X130.989 Y139.828 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.489 Y140.21 E.01021
G1 X130.261 Y140.254 E.00376
G1 X130.262 Y149.539 E.15077
G1 X151.139 Y149.539 E.33898
G1 X151.139 Y140.254 E.15077
G1 X150.911 Y140.21 E.00376
G1 X150.411 Y139.828 E.01022
G1 X150.411 Y147.416 E.12322
G3 X150.296 Y147.97 I-1.394 J0 E.00925
G1 X150.003 Y148.403 E.00849
G1 X149.57 Y148.696 E.00849
G3 X149.016 Y148.811 I-.554 J-1.28 E.00925
G1 X132.384 Y148.811 E.27007
G1 X131.83 Y148.697 E.00918
G1 X131.398 Y148.403 E.00848
G1 X131.104 Y147.971 E.00849
G3 X130.989 Y147.416 I1.279 J-.554 E.00926
G1 X130.989 Y139.888 E.12225
M204 S10000
G1 X131.381 Y138.916 F42000
; LINE_WIDTH: 0.421936
G1 F15000
M204 S6000
G3 X131.387 Y133.668 I327.135 J-2.216 E.08563
G1 X131.387 Y130.784 E.04707
G1 X131.447 Y130.443 E.00564
G1 X131.608 Y130.159 E.00532
G1 X131.933 Y129.895 E.00683
G3 X132.384 Y129.787 I.451 J.888 E.00764
G1 X149.016 Y129.787 E.27139
G1 X149.467 Y129.895 E.00756
G1 X149.792 Y130.158 E.00682
G1 X149.953 Y130.443 E.00533
G1 X150.013 Y130.784 E.00565
G2 X150.019 Y134.484 I230.489 J1.443 E.06037
G3 X150.013 Y139.732 I-327.131 J2.216 E.08563
G1 X150.013 Y147.416 E.12539
G1 X149.931 Y147.812 E.00659
G1 X149.721 Y148.121 E.00609
G1 X149.412 Y148.331 E.00609
G1 X149.016 Y148.413 E.00659
G1 X132.384 Y148.413 E.27139
G1 X131.988 Y148.331 E.00659
G1 X131.679 Y148.121 E.00609
G1 X131.469 Y147.812 E.0061
G1 X131.387 Y147.416 E.0066
G1 X131.387 Y139.732 E.12539
G3 X131.379 Y138.976 I9.388 J-.475 E.01233
M204 S10000
G1 X130.969 Y138.916 F42000
; LINE_WIDTH: 0.421556
G1 F15000
M204 S6000
G1 X130.959 Y139.09 E.00284
G1 X130.759 Y139.52 E.00772
G1 X130.34 Y139.84 E.00861
G1 X129.863 Y139.913 E.00786
G1 X129.864 Y149.937 E.16342
G1 X151.537 Y149.937 E.35331
G1 X151.537 Y139.913 E.16342
G1 X151.061 Y139.84 E.00786
G1 X150.641 Y139.52 E.00861
G1 X150.441 Y139.09 E.00772
G1 X150.431 Y138.916 E.00284
G1 X150.431 Y134.484 E.07226
G1 X150.641 Y133.88 E.01041
G1 X151.06 Y133.56 E.00861
G1 X151.537 Y133.487 E.00786
G1 X151.536 Y128.263 E.08516
G1 X151.305 Y128.263 E.00376
G1 X151.288 Y128.302 E.00069
G1 X150.616 Y128.563 E.01175
G1 X146.184 Y128.563 E.07226
G1 X145.627 Y128.393 E.00949
G1 X145.558 Y128.263 E.0024
G1 X135.842 Y128.263 E.15838
G1 X135.773 Y128.393 E.0024
G1 X135.388 Y128.548 E.00676
G1 X135.216 Y128.563 E.00282
G1 X130.784 Y128.563 E.07226
G1 X130.112 Y128.303 E.01173
G1 X130.095 Y128.264 E.00069
G1 X129.863 Y128.264 E.00379
G1 X129.863 Y133.487 E.08515
G1 X130.339 Y133.56 E.00786
G1 X130.759 Y133.88 E.00861
G1 X130.969 Y134.484 E.01042
G1 X130.969 Y138.856 E.07128
M204 S10000
G1 X130.564 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X130.442 Y139.278 E.0062
G1 X130.19 Y139.471 E.00514
G1 X129.966 Y139.514 E.0037
G1 X129.464 Y139.514 E.00815
G1 X129.465 Y150.335 E.1757
G1 X151.934 Y150.336 E.36483
G1 X151.936 Y139.514 E.17572
G1 X151.434 Y139.514 E.00815
G1 X151.21 Y139.471 E.0037
G1 X150.958 Y139.278 E.00514
G1 X150.836 Y138.916 E.0062
G1 X150.836 Y134.484 E.07198
G1 X150.958 Y134.122 E.0062
G1 X151.21 Y133.929 E.00514
G1 X151.434 Y133.886 E.00371
G1 X151.936 Y133.886 E.00815
G1 X151.935 Y127.875 E.0976
G2 X151.083 Y127.864 I-.711 J22.788 E.01383
G1 X151.02 Y128.008 E.00254
G1 X150.556 Y128.164 E.00795
G1 X146.184 Y128.164 E.07099
G1 X145.85 Y128.062 E.00567
G1 X145.744 Y127.864 E.00364
G1 X135.656 Y127.864 E.16382
G1 X135.55 Y128.062 E.00364
G1 X135.216 Y128.164 E.00567
G1 X130.784 Y128.164 E.07198
G1 X130.381 Y128.008 E.00701
G1 X130.318 Y127.865 E.00254
G1 X129.474 Y127.865 E.0137
G1 X129.464 Y133.886 E.09776
G1 X129.966 Y133.886 E.00815
G1 X130.19 Y133.929 E.0037
G1 X130.442 Y134.122 E.00514
G1 X130.564 Y134.484 E.0062
G1 X130.564 Y138.856 E.071
M204 S10000
G1 X130.166 Y138.916 F42000
G1 F15000
M204 S6000
G1 X130.125 Y139.037 E.00207
G1 X129.966 Y139.116 E.00287
G1 X129.066 Y139.116 E.01462
G1 X129.067 Y150.397 E.18318
G1 X129.148 Y150.607 E.00367
G1 X129.309 Y150.714 E.00314
G1 X129.474 Y150.734 E.0027
G1 X151.961 Y150.734 E.36512
G1 X152.211 Y150.646 E.00431
G1 X152.321 Y150.467 E.00341
G1 X152.334 Y150.33 E.00222
G1 X152.334 Y139.116 E.1821
G1 X151.434 Y139.116 E.01463
G1 X151.275 Y139.037 E.00287
G1 X151.234 Y138.916 E.00207
G1 X151.234 Y134.484 E.07198
G1 X151.275 Y134.363 E.00207
G1 X151.434 Y134.284 E.00287
G1 X152.334 Y134.284 E.01462
G1 X152.333 Y127.811 E.10511
G1 X152.251 Y127.608 E.00356
G1 X152.116 Y127.516 E.00266
G1 X151.898 Y127.466 E.00363
G1 X150.816 Y127.466 E.01758
G3 X150.751 Y127.713 I-.313 J.05 E.00428
G1 X150.556 Y127.766 E.00328
G1 X146.184 Y127.766 E.07099
G1 X146.072 Y127.732 E.00189
G1 X145.984 Y127.566 E.00304
G1 X145.984 Y127.466 E.00164
G1 X135.416 Y127.466 E.17161
G1 X135.416 Y127.566 E.00164
G1 X135.328 Y127.732 E.00304
G1 X135.216 Y127.766 E.00189
G1 X130.784 Y127.766 E.07198
G1 X130.649 Y127.714 E.00234
G3 X130.584 Y127.466 I.247 J-.197 E.00427
G1 X129.407 Y127.467 E.01912
G2 X129.118 Y127.639 I.011 J.347 E.0057
G1 X129.066 Y127.912 E.00452
G1 X129.066 Y134.284 E.10348
G1 X129.966 Y134.284 E.01463
G1 X130.125 Y134.363 E.00287
G1 X130.166 Y134.484 E.00207
G1 X130.166 Y138.856 E.071
M204 S10000
G1 X130.625 Y132.853 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X130.625 Y130.844 E.02694
M204 S10000
G1 X130.625 Y130.784 F42000
; LINE_WIDTH: 0.36409
G1 F15000
M204 S6000
G1 X130.665 Y130.478 E.0043
; LINE_WIDTH: 0.403226
G1 X130.706 Y130.173 E.00479
G1 X130.993 Y129.664 E.0091
G1 X131.377 Y129.352 E.0077
G1 X130.784 Y129.352 E.00923
G1 X130.652 Y129.301 E.0022
G1 X130.652 Y130.164 E.01342
; LINE_WIDTH: 0.39111
G1 X130.64 Y130.444 E.00422
; LINE_WIDTH: 0.36409
G1 X130.628 Y130.724 E.00391
M204 S10000
G1 X136.199 Y129.025 F42000
; LINE_WIDTH: 0.35058
G1 F15000
M204 S6000
G1 X145.141 Y129.025 E.11992
M204 S10000
G1 X145.201 Y129.389 F42000
; LINE_WIDTH: 0.423854
G1 F15000
M204 S6000
G3 X149.016 Y129.382 I2.399 J257.423 E.06255
G1 X149.648 Y129.54 E.01067
G1 X150.102 Y129.908 E.0096
G1 X150.327 Y130.306 E.00749
G1 X150.411 Y130.784 E.00794
G1 X150.411 Y133.572 E.04572
G1 X150.911 Y133.19 E.01031
G1 X151.138 Y133.146 E.0038
G1 X151.138 Y128.759 E.07193
G1 X150.616 Y128.961 E.00917
G3 X146.184 Y128.968 I-4.175 J-1194.195 E.07267
G1 X145.404 Y128.723 E.01339
G1 X145.371 Y128.661 E.00115
G1 X136.029 Y128.661 E.15318
G1 X135.995 Y128.723 E.00115
G1 X135.46 Y128.953 E.00956
G1 X135.216 Y128.968 E.004
G3 X130.784 Y128.961 I-.264 J-1188.589 E.07267
G1 X130.261 Y128.759 E.00919
G1 X130.261 Y133.146 E.07193
G1 X130.489 Y133.19 E.0038
G1 X130.989 Y133.572 E.01032
G1 X130.989 Y130.784 E.04572
G1 X131.073 Y130.307 E.00794
G1 X131.297 Y129.909 E.00749
G1 X131.752 Y129.54 E.0096
G1 X132.14 Y129.397 E.00678
G1 X132.384 Y129.382 E.004
G3 X136.199 Y129.389 I1.416 J257.431 E.06255
G1 X145.141 Y129.389 E.14661
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.34987
G1 F15000
M204 S6000
G1 X150.775 Y132.793 E.0269
M204 S10000
G1 X150.775 Y130.783 F42000
; LINE_WIDTH: 0.363325
G1 F15000
M204 S6000
G1 X150.761 Y130.473 E.00432
; LINE_WIDTH: 0.402841
G3 X150.747 Y129.301 I13.32 J-.744 E.01822
G1 X150.556 Y129.352 E.00308
G1 X150.022 Y129.352 E.00829
G1 X150.407 Y129.663 E.00769
G1 X150.694 Y130.173 E.00909
; LINE_WIDTH: 0.390615
G1 X150.73 Y130.448 E.00418
; LINE_WIDTH: 0.363325
G1 X150.767 Y130.724 E.00387
M204 S10000
G1 X149.216 Y138.916 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X149.216 Y147.416 E.13802
G1 X149.157 Y147.557 E.00248
G1 X149.016 Y147.616 E.00248
G1 X132.384 Y147.616 E.27007
G1 X132.243 Y147.557 E.00248
G1 X132.184 Y147.416 E.00248
G1 X132.184 Y130.784 E.27007
G1 X132.228 Y130.659 E.00215
G1 X132.384 Y130.584 E.00279
G1 X149.016 Y130.584 E.27007
G1 X149.171 Y130.659 E.00279
G1 X149.216 Y130.784 E.00215
G1 X149.216 Y138.856 E.13108
M204 S10000
G1 X149.614 Y138.916 F42000
G1 F15000
M204 S6000
G1 X149.614 Y147.416 E.13802
G1 X149.565 Y147.654 E.00394
G3 X149.016 Y148.014 I-.588 J-.297 E.01116
G1 X132.384 Y148.014 E.27007
G1 X132.146 Y147.965 E.00393
G3 X131.786 Y147.416 I.297 J-.588 E.01116
G1 X131.786 Y130.784 E.27007
G3 X132.113 Y130.251 I.649 J.031 E.01059
G1 X132.384 Y130.186 E.00452
G1 X149.016 Y130.186 E.27007
G1 X149.287 Y130.251 E.00452
G1 X149.482 Y130.409 E.00407
G3 X149.614 Y130.784 I-.465 J.375 E.00658
G1 X149.614 Y138.856 E.13108
M204 S10000
G1 X150.775 Y140.547 F42000
; LINE_WIDTH: 0.351041
G1 F15000
M204 S6000
G1 X150.764 Y147.663 E.09555
M204 S10000
G1 X150.762 Y147.723 F42000
; LINE_WIDTH: 0.395643
G1 F15000
M204 S6000
G1 X150.739 Y147.862 E.00216
; LINE_WIDTH: 0.43249
G1 X150.716 Y148.002 E.00237
; LINE_WIDTH: 0.486033
G1 X150.693 Y148.142 E.00268
G1 X150.308 Y148.708 E.01296
G1 X149.742 Y149.093 E.01296
; LINE_WIDTH: 0.46934
G1 X149.602 Y149.116 E.00259
; LINE_WIDTH: 0.4325
G1 X149.462 Y149.139 E.00237
; LINE_WIDTH: 0.39566
G1 X149.323 Y149.162 E.00216
G1 X149.463 Y149.143 E.00216
; LINE_WIDTH: 0.4325
G1 X149.604 Y149.125 E.00238
; LINE_WIDTH: 0.486494
G1 X149.745 Y149.106 E.00269
G1 X150.706 Y149.106 E.01822
G1 X150.706 Y148.145 E.01822
; LINE_WIDTH: 0.469337
G1 X150.722 Y148.024 E.00223
; LINE_WIDTH: 0.43249
G1 X150.738 Y147.903 E.00204
; LINE_WIDTH: 0.395643
G1 X150.754 Y147.782 E.00186
M204 S10000
G1 X149.323 Y149.162 F42000
; LINE_WIDTH: 0.350822
G1 F15000
M204 S6000
G1 X149.016 Y149.175 E.00411
G1 X132.444 Y149.175 E.2224
; OBJECT_ID: 94
; WIPE_START
G1 X134.444 Y149.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X126.813 Y149.359 Z1.8 F42000
G1 X103.041 Y149.932 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.577 E.00582
G1 X102.99 Y131.496 E.2936
G3 X104.75 Y129.596 I1.919 J.013 E.04617
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.423 I-.091 J1.925 E.04616
G1 X124.81 Y149.502 E.29357
G3 X122.977 Y151.409 I-1.914 J-.006 E.04741
G1 X104.896 Y151.41 E.2936
G3 X103.054 Y149.99 I.008 J-1.914 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.577 E-.15872
G1 X102.991 Y147.995 E-.60128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z1.8 F42000
G1 X104.089 Y129.072 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.521 J2.138 E.00695
G1 X123.272 Y129.012 E.30463
G1 X123.458 Y129.025 E.00302
G3 X125.39 Y131.204 I-.262 J2.179 E.05171
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.09 J-2.192 E.0545
G1 X102.412 Y131.114 E.30336
G3 X104.031 Y129.087 I2.198 J.096 E.04504
M204 S10000
G1 X104.114 Y129.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252174
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00333
; LINE_WIDTH: 0.187732
G1 X104.892 Y129.301 E.00295
G1 X122.984 Y129.301 E.12256
G3 X123.41 Y129.336 I-.027 J2.992 E.0029
; LINE_WIDTH: 0.25611
G3 X123.601 Y129.378 I-1.154 J5.629 E.00187
G1 X123.773 Y129.435 E.00173
; LINE_WIDTH: 0.299074
G3 X124.899 Y130.469 I-.715 J1.909 E.01772
G1 X124.966 Y130.626 E.00193
; LINE_WIDTH: 0.255909
G3 X125.062 Y130.978 I-1.974 J.727 E.00348
; LINE_WIDTH: 0.188512
G3 X125.099 Y131.405 I-2.878 J.469 E.00292
G1 X125.099 Y149.504 E.12319
G3 X125.077 Y149.925 I-4.292 J-.019 E.00287
; LINE_WIDTH: 0.249385
G3 X124.973 Y150.353 I-2.189 J-.302 E.0041
; LINE_WIDTH: 0.298625
G3 X123.931 Y151.499 I-1.91 J-.69 E.01795
G1 X123.769 Y151.568 E.00199
; LINE_WIDTH: 0.256041
M73 P50 R14
G3 X123.422 Y151.662 I-.813 J-2.316 E.00343
; LINE_WIDTH: 0.188527
G3 X122.995 Y151.699 I-.47 J-2.899 E.00292
G1 X104.892 Y151.699 E.12322
G3 X104.467 Y151.676 I0 J-3.85 E.0029
; LINE_WIDTH: 0.25029
G3 X104.052 Y151.575 I.245 J-1.912 E.00399
; LINE_WIDTH: 0.300486
G3 X102.901 Y150.531 I.693 J-1.92 E.01812
G1 X102.896 Y150.519 E.00014
; LINE_WIDTH: 0.263665
G3 X102.739 Y150.022 I2.01 J-.909 E.00516
; LINE_WIDTH: 0.188241
G3 X102.701 Y149.595 I2.878 J-.469 E.00292
G1 X102.701 Y131.489 E.12304
; LINE_WIDTH: 0.196474
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.24051
G3 X102.737 Y130.985 I2.101 J.194 E.00149
G1 X102.801 Y130.724 E.0024
; LINE_WIDTH: 0.297551
G3 X104.022 Y129.436 I1.938 J.615 E.02065
; LINE_WIDTH: 0.252174
G1 X104.056 Y129.428 E.00033
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15744
G1 X104.892 Y129.301 E-.16546
G1 X106.042 Y129.301 E-.4371
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 15/95
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S183.6
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I.57 J1.075 P1  F42000
G1 X151.174 Y105.382 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.243 Y106.675 I-.257 J1.301 E.02949
G1 X152.243 Y121.125 E.23464
G3 X150.925 Y122.443 I-1.326 J-.008 E.03356
G1 X136.475 Y122.443 E.23464
G3 X135.157 Y121.125 I.008 J-1.326 E.03356
G1 X135.157 Y106.675 E.23464
G3 X136.475 Y105.357 I1.326 J.008 E.03356
G1 X150.925 Y105.357 E.23464
G3 X151.115 Y105.372 I-.008 J1.326 E.00309
; WIPE_START
M204 S6000
G1 X151.423 Y105.457 E-.12164
G1 X151.653 Y105.58 E-.099
G1 X151.855 Y105.745 E-.09903
G1 X152.02 Y105.947 E-.09904
G1 X152.143 Y106.177 E-.09901
G1 X152.218 Y106.426 E-.09904
G1 X152.243 Y106.675 E-.09507
G1 X152.243 Y106.802 E-.04817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.759 Y105.304 Z1.9 F42000
G1 X143.759 Y105.104 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.284 Y105.107 E.1222
G3 X152.498 Y106.392 I-.142 J1.35 E.03127
G1 X152.5 Y121.358 E.24301
G3 X151.141 Y122.7 I-1.359 J-.017 E.0344
G1 X136.242 Y122.7 E.24193
G3 X134.9 Y121.34 I.017 J-1.359 E.03442
G1 X134.9 Y106.442 E.24191
G3 X136.192 Y105.102 I1.371 J.028 E.03323
G1 X143.699 Y105.104 E.12189
; WIPE_START
M204 S6000
G1 X145.699 Y105.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.805 Y112.168 Z1.9 F42000
G1 X142.548 Y112.795 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.726 Y112.629 E.00424
G3 X143.658 Y112.303 I.968 J1.27 E.01753
G1 X143.792 Y112.306 E.00234
G3 X142.504 Y112.834 I-.098 J1.594 E.15001
M204 S10000
G1 X142.262 Y112.478 F42000
G1 F6000
M204 S6000
G1 X142.465 Y112.291 E.00483
G3 X143.654 Y111.874 I1.231 J1.609 E.02236
G1 X143.817 Y111.877 E.00286
G3 X142.216 Y112.516 I-.121 J2.022 E.19109
M204 S250
G1 X141.985 Y112.172 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.214 Y111.964 E.00502
G3 X143.65 Y111.461 I1.484 J1.935 E.02512
G1 X143.842 Y111.464 E.00312
G3 X141.923 Y112.226 I-.144 J2.435 E.21422
G1 X141.94 Y112.211 E.00037
; WIPE_START
M204 S6000
G1 X142.214 Y111.964 E-.14023
G1 X142.452 Y111.803 E-.10917
G1 X142.707 Y111.671 E-.10909
G1 X143.169 Y111.519 E-.18474
G1 X143.65 Y111.461 E-.18403
G1 X143.736 Y111.462 E-.03275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 15 start: 83,94,105
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer15 end: 83,94,105
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X143.873 Y113.569 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.6 Y113.535 E.00446
G1 X143.421 Y113.643 E.0034
G1 X143.325 Y113.844 E.00362
G1 X143.395 Y114.125 E.00471
G1 X143.572 Y114.257 E.00359
G1 X143.793 Y114.268 E.0036
G1 X143.987 Y114.148 E.0037
G1 X144.076 Y113.948 E.00356
G1 X144.079 Y113.881 E.00107
G1 X143.999 Y113.667 E.00372
G1 X143.92 Y113.605 E.00162
M204 S10000
G1 X143.728 Y113.871 F42000
; LINE_WIDTH: 0.36074
G1 F15000
M204 S6000
G1 X143.664 Y113.908 E.00102
G1 X143.712 Y113.935 E.00077
M204 S10000
G1 X144.436 Y114.149 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.477 Y113.859 E.00474
G1 X144.393 Y113.548 E.00523
G1 X144.221 Y113.323 E.00461
G1 X144.04 Y113.199 E.00356
G1 X143.645 Y113.124 E.00652
G1 X143.367 Y113.198 E.00467
G1 X143.127 Y113.374 E.00484
G1 X142.967 Y113.64 E.00505
G1 X142.922 Y113.845 E.0034
G1 X143 Y114.238 E.0065
G1 X143.164 Y114.464 E.00454
G1 X143.434 Y114.631 E.00515
G1 X143.742 Y114.676 E.00505
G1 X144.029 Y114.605 E.0048
G1 X144.282 Y114.415 E.00514
G1 X144.406 Y114.201 E.00402
M204 S10000
G1 X144.875 Y113.837 F42000
G1 F15000
M204 S6000
G1 X144.806 Y113.486 E.00582
G1 X144.566 Y113.096 E.00744
G1 X144.189 Y112.825 E.00753
G1 X143.762 Y112.721 E.00714
G1 X143.309 Y112.785 E.00743
G1 X142.906 Y113.025 E.0076
G1 X142.626 Y113.407 E.0077
G1 X142.52 Y113.846 E.00733
G1 X142.581 Y114.276 E.00706
G1 X142.803 Y114.669 E.00733
G1 X143.187 Y114.965 E.00787
G1 X143.62 Y115.079 E.00728
G1 X144.091 Y115.015 E.00771
G1 X144.493 Y114.776 E.0076
G1 X144.767 Y114.409 E.00743
G1 X144.881 Y113.946 E.00774
G1 X144.878 Y113.897 E.0008
; OBJECT_ID: 105
; WIPE_START
G1 X144.881 Y113.946 E-.01863
G1 X144.767 Y114.409 E-.18123
G1 X144.493 Y114.776 E-.17384
G1 X144.091 Y115.015 E-.17777
G1 X143.62 Y115.079 E-.18045
G1 X143.549 Y115.06 E-.02807
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 105
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.614 Y122.618 Z1.9 F42000
G1 X147.96 Y146.36 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X133.44 Y146.36 E.23578
G1 X133.44 Y131.84 E.23578
G1 X147.96 Y131.84 E.23578
G1 X147.96 Y146.3 E.2348
; WIPE_START
M204 S6000
G1 X145.96 Y146.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.918 Y139.782 Z1.9 F42000
G1 X152.49 Y135.54 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X152.49 Y137.86 E.03767
G1 X153.59 Y137.86 E.01786
G1 X153.589 Y150.463 E.20464
G3 X151.996 Y151.99 I-1.592 J-.066 E.03958
G1 X129.404 Y151.99 E.36684
G3 X127.811 Y150.462 I-.001 J-1.593 E.03959
G1 X127.81 Y137.86 E.20464
G1 X128.91 Y137.86 E.01786
G1 X128.91 Y135.54 E.03767
G1 X127.81 Y135.54 E.01786
G1 X127.81 Y127.804 E.12561
G3 X129.336 Y126.211 I1.603 J.008 E.03949
G1 X131.84 Y126.21 E.04067
G1 X131.84 Y126.51 E.00487
G1 X134.16 Y126.51 E.03767
G1 X134.16 Y126.21 E.00487
G1 X147.24 Y126.21 E.21239
G1 X147.24 Y126.51 E.00487
G1 X149.56 Y126.51 E.03767
G1 X149.56 Y126.21 E.00487
G1 X151.996 Y126.21 E.03955
G3 X153.589 Y127.738 I.001 J1.593 E.03959
G1 X153.59 Y135.54 E.1267
G1 X152.55 Y135.54 E.01689
; WIPE_START
M204 S6000
G1 X152.498 Y137.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.179 Y129.937 Z1.9 F42000
G1 X153.369 Y127.816 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X151.982 Y126.429 E.03185
G1 X151.419 Y126.429
G1 X153.37 Y128.38 E.0448
G1 X153.37 Y128.944
G1 X150.855 Y126.429 E.05774
G1 X150.292 Y126.429
G1 X153.37 Y129.507 E.07069
G1 X153.37 Y130.071
G1 X149.779 Y126.48 E.08246
G1 X149.464 Y126.729
G1 X153.37 Y130.635 E.08969
G1 X153.37 Y131.198
G1 X148.901 Y126.729 E.10263
G1 X148.337 Y126.729
G1 X153.37 Y131.762 E.11558
G1 X153.37 Y132.326
G1 X147.774 Y126.729 E.12852
G1 X147.21 Y126.729
G1 X153.37 Y132.89 E.14147
G1 X153.37 Y133.453
G1 X146.346 Y126.429 E.1613
G1 X145.783 Y126.429
G1 X153.371 Y134.017 E.17425
G1 X153.371 Y134.581
G1 X145.219 Y126.429 E.18719
G1 X144.655 Y126.429
G1 X153.371 Y135.144 E.20014
G1 X152.984 Y135.321
G1 X144.092 Y126.429 E.20419
G1 X143.528 Y126.429
G1 X152.42 Y135.321 E.20419
G1 X152.271 Y135.735
G1 X148.179 Y131.644 E.09396
G1 X148.179 Y132.207
G1 X152.271 Y136.299 E.09396
G1 X152.271 Y136.863
G1 X148.179 Y132.771 E.09396
G1 X148.179 Y133.334
G1 X152.271 Y137.426 E.09396
G1 X152.271 Y137.99
G1 X148.179 Y133.898 E.09396
; WIPE_START
M204 S6000
G1 X149.593 Y135.312 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.156 Y131.621 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X142.965 Y126.429 E.11922
G1 X142.401 Y126.429
G1 X147.593 Y131.621 E.11922
G1 X147.029 Y131.621
G1 X141.837 Y126.429 E.11922
G1 X141.274 Y126.429
G1 X146.465 Y131.621 E.11922
G1 X145.902 Y131.621
G1 X140.71 Y126.429 E.11922
G1 X140.147 Y126.429
G1 X145.338 Y131.621 E.11922
G1 X144.775 Y131.621
G1 X139.583 Y126.429 E.11922
G1 X139.019 Y126.429
G1 X144.211 Y131.621 E.11922
G1 X143.647 Y131.621
G1 X138.456 Y126.429 E.11922
G1 X137.892 Y126.429
G1 X143.084 Y131.621 E.11922
G1 X142.52 Y131.621
G1 X137.329 Y126.429 E.11922
G1 X136.765 Y126.429
G1 X141.957 Y131.621 E.11922
G1 X141.393 Y131.621
G1 X136.201 Y126.429 E.11922
G1 X135.638 Y126.429
G1 X140.829 Y131.621 E.11922
G1 X140.266 Y131.621
G1 X135.074 Y126.429 E.11922
G1 X134.511 Y126.429
G1 X139.702 Y131.621 E.11922
G1 X139.139 Y131.621
G1 X134.247 Y126.729 E.11233
G1 X133.683 Y126.729
G1 X138.575 Y131.621 E.11233
G1 X138.011 Y131.621
G1 X133.12 Y126.729 E.11233
G1 X132.556 Y126.729
G1 X137.448 Y131.621 E.11233
G1 X136.884 Y131.621
G1 X131.993 Y126.729 E.11233
G1 X131.129 Y126.43
G1 X136.321 Y131.621 E.11921
G1 X135.757 Y131.621
G1 X130.566 Y126.43 E.1192
G1 X130.003 Y126.43
M73 P51 R14
G1 X135.193 Y131.621 E.1192
G1 X134.63 Y131.621
G1 X129.439 Y126.431 E.11919
G1 X128.956 Y126.51
G1 X134.066 Y131.621 E.11736
G1 X133.503 Y131.621
G1 X128.589 Y126.707 E.11284
G1 X128.302 Y126.984
G1 X133.221 Y131.903 E.11294
G1 X133.221 Y132.466
G1 X128.108 Y127.353 E.11742
G1 X128.029 Y127.838
G1 X133.221 Y133.03 E.11922
G1 X133.221 Y133.593
G1 X128.029 Y128.402 E.11922
G1 X128.029 Y128.965
G1 X133.221 Y134.157 E.11922
G1 X133.221 Y134.721
G1 X128.029 Y129.529 E.11922
G1 X128.029 Y130.093
G1 X133.221 Y135.284 E.11922
G1 X133.221 Y135.848
G1 X128.029 Y130.656 E.11922
G1 X128.029 Y131.22
G1 X133.221 Y136.412 E.11922
G1 X133.221 Y136.975
G1 X128.029 Y131.783 E.11922
G1 X128.029 Y132.347
G1 X133.221 Y137.539 E.11922
G1 X133.221 Y138.102
G1 X128.029 Y132.911 E.11922
G1 X128.029 Y133.474
G1 X133.221 Y138.666 E.11922
G1 X133.221 Y139.23
G1 X128.029 Y134.038 E.11922
G1 X128.029 Y134.602
G1 X128.748 Y135.321 E.01652
G1 X129.129 Y135.702
G1 X133.221 Y139.793 E.09396
G1 X133.221 Y140.357
G1 X129.129 Y136.265 E.09396
G1 X129.129 Y136.829
G1 X133.221 Y140.92 E.09396
G1 X133.221 Y141.484
G1 X129.129 Y137.392 E.09396
G1 X129.129 Y137.956
G1 X133.221 Y142.048 E.09396
G1 X133.221 Y142.611
G1 X128.689 Y138.079 E.10407
G1 X128.125 Y138.079
G1 X133.221 Y143.175 E.11702
G1 X133.221 Y143.738
G1 X128.029 Y138.547 E.11922
G1 X128.029 Y139.111
G1 X133.221 Y144.302 E.11922
G1 X133.221 Y144.866
G1 X128.029 Y139.674 E.11922
G1 X128.029 Y140.238
G1 X133.221 Y145.429 E.11921
G1 X133.221 Y145.993
G1 X128.029 Y140.802 E.11921
G1 X128.03 Y141.365
G1 X133.221 Y146.556 E.11921
; WIPE_START
M204 S6000
G1 X131.807 Y145.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.045 Y142.721 Z1.9 F42000
G1 X152.924 Y138.079 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X153.371 Y138.526 E.01026
G1 X153.371 Y139.09
G1 X152.36 Y138.079 E.0232
; WIPE_START
M204 S6000
G1 X153.371 Y139.09 E-.543
G1 X153.371 Y138.526 E-.21415
G1 X153.365 Y138.521 E-.00286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.179 Y134.462 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X153.371 Y139.653 E.11922
G1 X153.371 Y140.217
G1 X148.179 Y135.025 E.11921
G1 X148.179 Y135.589
G1 X153.37 Y140.78 E.11921
G1 X153.37 Y141.344
M73 P51 R13
G1 X148.179 Y136.153 E.11921
G1 X148.179 Y136.716
G1 X153.37 Y141.907 E.11921
G1 X153.37 Y142.471
G1 X148.179 Y137.28 E.11921
G1 X148.179 Y137.843
G1 X153.37 Y143.034 E.11921
G1 X153.37 Y143.598
G1 X148.179 Y138.407 E.11921
G1 X148.179 Y138.971
G1 X153.37 Y144.162 E.1192
G1 X153.37 Y144.725
G1 X148.179 Y139.534 E.1192
G1 X148.179 Y140.098
G1 X153.37 Y145.289 E.1192
G1 X153.37 Y145.852
G1 X148.179 Y140.661 E.1192
G1 X148.179 Y141.225
G1 X153.37 Y146.416 E.1192
G1 X153.37 Y146.979
G1 X148.179 Y141.789 E.1192
G1 X148.179 Y142.352
G1 X153.37 Y147.543 E.1192
G1 X153.37 Y148.106
G1 X148.179 Y142.916 E.11919
G1 X148.179 Y143.479
G1 X153.37 Y148.67 E.11919
G1 X153.37 Y149.233
G1 X148.179 Y144.043 E.11919
G1 X148.179 Y144.607
G1 X153.369 Y149.797 E.11919
G1 X153.369 Y150.36
G1 X148.179 Y145.17 E.11919
G1 X148.179 Y145.734
G1 X153.293 Y150.848 E.11743
G1 X153.097 Y151.216
G1 X148.179 Y146.297 E.11294
G1 X147.897 Y146.579
G1 X152.814 Y151.496 E.11292
G1 X152.441 Y151.686
G1 X147.334 Y146.579 E.11728
G1 X146.77 Y146.579
G1 X151.962 Y151.771 E.11922
G1 X151.398 Y151.771
G1 X146.206 Y146.579 E.11922
G1 X145.643 Y146.579
G1 X150.835 Y151.771 E.11922
G1 X150.271 Y151.771
G1 X145.079 Y146.579 E.11922
G1 X144.516 Y146.579
G1 X149.707 Y151.771 E.11922
G1 X149.144 Y151.771
G1 X143.952 Y146.579 E.11922
G1 X143.388 Y146.579
G1 X148.58 Y151.771 E.11922
G1 X148.016 Y151.771
G1 X142.825 Y146.579 E.11922
G1 X142.261 Y146.579
G1 X147.453 Y151.771 E.11922
G1 X146.889 Y151.771
G1 X141.698 Y146.579 E.11922
G1 X141.134 Y146.579
G1 X146.326 Y151.771 E.11922
G1 X145.762 Y151.771
G1 X140.57 Y146.579 E.11922
G1 X140.007 Y146.579
G1 X145.198 Y151.771 E.11922
G1 X144.635 Y151.771
G1 X139.443 Y146.579 E.11922
G1 X138.88 Y146.579
G1 X144.071 Y151.771 E.11922
G1 X143.508 Y151.771
G1 X138.316 Y146.579 E.11922
G1 X137.752 Y146.579
G1 X142.944 Y151.771 E.11922
G1 X142.38 Y151.771
G1 X137.189 Y146.579 E.11922
G1 X136.625 Y146.579
G1 X141.817 Y151.771 E.11922
G1 X141.253 Y151.771
G1 X136.062 Y146.579 E.11922
G1 X135.498 Y146.579
G1 X140.69 Y151.771 E.11922
G1 X140.126 Y151.771
G1 X134.934 Y146.579 E.11922
G1 X134.371 Y146.579
G1 X139.562 Y151.771 E.11922
G1 X138.999 Y151.771
G1 X133.807 Y146.579 E.11922
G1 X133.244 Y146.579
G1 X138.435 Y151.771 E.11922
G1 X137.872 Y151.771
G1 X128.03 Y141.929 E.22601
G1 X128.03 Y142.493
G1 X137.308 Y151.771 E.21307
G1 X136.744 Y151.771
G1 X128.03 Y143.056 E.20012
G1 X128.03 Y143.62
G1 X136.181 Y151.771 E.18718
G1 X135.617 Y151.771
G1 X128.03 Y144.184 E.17423
G1 X128.03 Y144.747
G1 X135.054 Y151.771 E.16129
G1 X134.49 Y151.771
G1 X128.03 Y145.311 E.14835
G1 X128.03 Y145.875
G1 X133.926 Y151.771 E.1354
G1 X133.363 Y151.771
G1 X128.03 Y146.438 E.12246
G1 X128.03 Y147.002
G1 X132.799 Y151.771 E.10951
G1 X132.235 Y151.771
G1 X128.03 Y147.566 E.09657
G1 X128.03 Y148.129
G1 X131.672 Y151.771 E.08363
G1 X131.108 Y151.771
G1 X128.03 Y148.693 E.07068
M73 P52 R13
G1 X128.03 Y149.257
G1 X130.545 Y151.771 E.05774
G1 X129.981 Y151.771
G1 X128.03 Y149.82 E.04479
G1 X128.031 Y150.384
G1 X129.417 Y151.771 E.03185
; WIPE_START
M204 S6000
G1 X128.031 Y150.384 E-.74534
G1 X128.031 Y150.345 E-.01466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.84 Y144.419 Z1.9 F42000
G1 X147.136 Y126.803 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133149
G1 F15000
M204 S6000
G1 X147.041 Y126.764 E.00047
G1 X146.686 Y126.409 E.00228
; WIPE_START
G1 X147.041 Y126.764 E-.63084
G1 X147.136 Y126.803 E-.12916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.341 Y127.45 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.197069
G1 F15000
M204 S6000
G1 X153.104 Y127.129 E.00285
; LINE_WIDTH: 0.240251
G2 X152.676 Y126.701 I-2.25 J1.817 E.00541
; LINE_WIDTH: 0.2038
G1 X152.515 Y126.583 E.00148
; LINE_WIDTH: 0.171914
G1 X152.354 Y126.466 E.00122
; WIPE_START
G1 X152.515 Y126.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.328 Y127.469 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0764927
G1 F15000
M204 S6000
G1 X153.015 Y126.856 E.00154
; WIPE_START
G1 X153.328 Y127.469 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.813 Y132.746 Z1.9 F42000
G1 X128.381 Y151.337 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0757753
G1 F15000
M204 S6000
G1 X128.072 Y150.731 E.00151
; WIPE_START
G1 X128.381 Y151.337 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.063 Y151.734 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.129637
G1 F15000
M204 S6000
G1 X128.936 Y151.648 E.00068
; LINE_WIDTH: 0.170515
G1 X128.808 Y151.563 E.00093
; LINE_WIDTH: 0.214269
G1 X128.652 Y151.44 E.00156
; LINE_WIDTH: 0.227712
G3 X128.064 Y150.78 I2.484 J-2.806 E.00745
; OBJECT_ID: 94
; WIPE_START
G1 X128.432 Y151.229 E-.49874
G1 X128.652 Y151.44 E-.26126
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 105
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X121.033 Y150.991 Z1.9 F42000
G1 X103.039 Y149.931 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00584
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.925 J.018 E.04613
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.425 I-.078 J1.913 E.04629
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.914 J-.006 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.989 I.006 J-1.912 E.0406
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15923
G1 X102.991 Y147.994 E-.60077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.374 Z1.9 F42000
G1 X104.089 Y129.074 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00695
G1 X123.271 Y129.012 E.30462
G1 X123.458 Y129.025 E.00303
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.05451
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.795 I.09 J-2.193 E.05451
G1 X102.412 Y131.114 E.30334
G3 X104.031 Y129.089 I2.207 J.104 E.045
M204 S10000
G1 X104.114 Y129.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252184
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00333
; LINE_WIDTH: 0.187738
G1 X104.892 Y129.301 E.00295
G1 X122.979 Y129.301 E.12254
G1 X123.415 Y129.337 E.00296
; LINE_WIDTH: 0.253849
G3 X123.738 Y129.422 I-.333 J1.915 E.00317
; LINE_WIDTH: 0.299501
G3 X124.899 Y130.469 I-.674 J1.914 E.01818
G1 X124.939 Y130.56 E.00112
; LINE_WIDTH: 0.258675
G3 X125.064 Y130.993 I-1.957 J.8 E.00437
; LINE_WIDTH: 0.188479
G3 X125.09 Y131.21 I-2.546 J.416 E.00149
G1 X125.099 Y149.505 E.1245
G3 X125.076 Y149.93 I-4.143 J-.014 E.00289
; LINE_WIDTH: 0.250043
G3 X124.975 Y150.348 I-2.009 J-.264 E.00401
; LINE_WIDTH: 0.298666
G3 X123.931 Y151.499 I-1.913 J-.685 E.01801
G1 X123.774 Y151.566 E.00193
; LINE_WIDTH: 0.253005
G3 X123.355 Y151.673 I-.719 J-1.935 E.00408
; LINE_WIDTH: 0.188369
G1 X122.983 Y151.699 E.00253
G1 X104.892 Y151.699 E.12303
G1 X104.462 Y151.675 E.00293
; LINE_WIDTH: 0.248514
G3 X104.236 Y151.631 I.521 J-3.312 E.00213
G1 X104.091 Y151.588 E.0014
; LINE_WIDTH: 0.298209
G3 X102.901 Y150.531 I.65 J-1.93 E.01844
G1 X102.834 Y150.374 E.00192
; LINE_WIDTH: 0.25556
G3 X102.736 Y150.007 I1.894 J-.706 E.00363
; LINE_WIDTH: 0.188197
G3 X102.71 Y149.789 I2.54 J-.413 E.00149
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.197101
G1 X102.715 Y131.141 E.00249
; LINE_WIDTH: 0.241386
G3 X102.787 Y130.77 I2.234 J.238 E.00339
G1 X102.798 Y130.733 E.00035
; LINE_WIDTH: 0.297114
G3 X104.021 Y129.436 I1.936 J.601 E.02073
; LINE_WIDTH: 0.252184
G1 X104.056 Y129.428 E.00033
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15735
G1 X104.892 Y129.301 E-.16552
G1 X106.042 Y129.301 E-.43713
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 16/95
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S201.45
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.9 I.57 J1.075 P1  F42000
G1 X151.186 Y105.36 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.265 Y106.665 I-.259 J1.313 E.02977
G1 X152.265 Y121.135 E.23496
G3 X150.935 Y122.465 I-1.338 J-.008 E.03387
G1 X136.465 Y122.465 E.23496
G3 X135.135 Y121.135 I.008 J-1.338 E.03387
G1 X135.135 Y106.665 E.23496
G3 X136.465 Y105.335 I1.338 J.008 E.03387
G1 X150.935 Y105.335 E.23496
G3 X151.127 Y105.35 I-.008 J1.338 E.00313
; WIPE_START
M204 S6000
G1 X151.438 Y105.436 E-.12256
G1 X151.67 Y105.56 E-.0999
G1 X151.873 Y105.727 E-.09996
G1 X152.04 Y105.93 E-.09993
G1 X152.164 Y106.162 E-.09992
G1 X152.24 Y106.414 E-.09994
G1 X152.265 Y106.665 E-.09597
G1 X152.265 Y106.775 E-.04181
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.78 Y105.279 Z2 F42000
G1 X143.759 Y105.075 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.303 Y105.079 E.1225
G3 X152.527 Y106.373 I-.144 J1.362 E.03149
G1 X152.528 Y121.377 E.24363
G3 X151.158 Y122.729 I-1.37 J-.018 E.03466
G1 X136.223 Y122.728 E.2425
G3 X134.871 Y121.357 I.018 J-1.37 E.03468
G1 X134.872 Y106.423 E.24249
G3 X136.223 Y105.072 I1.37 J.018 E.03435
G1 X143.699 Y105.075 E.12139
; WIPE_START
M204 S6000
G1 X145.699 Y105.076 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.816 Y112.143 Z2 F42000
G1 X142.55 Y112.794 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.723 Y112.631 E.00415
G3 X143.658 Y112.303 I.97 J1.268 E.0176
G1 X143.79 Y112.306 E.0023
G3 X142.505 Y112.833 I-.096 J1.594 E.15007
M204 S10000
G1 X142.263 Y112.477 F42000
G1 F6000
M204 S6000
G1 X142.462 Y112.293 E.00475
G3 X143.654 Y111.874 I1.233 J1.606 E.02242
G1 X143.815 Y111.877 E.00281
G3 X142.217 Y112.515 I-.12 J2.022 E.19114
M204 S250
G1 X141.986 Y112.171 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.211 Y111.966 E.00494
G3 X143.649 Y111.461 I1.487 J1.933 E.02518
G1 X143.839 Y111.464 E.00308
G3 X141.922 Y112.227 I-.142 J2.435 E.21423
G1 X141.941 Y112.211 E.00041
; WIPE_START
M204 S6000
G1 X142.211 Y111.966 E-.13852
G1 X142.452 Y111.803 E-.11052
G1 X142.705 Y111.673 E-.10819
G1 X142.893 Y111.597 E-.07713
G1 X143.171 Y111.518 E-.10966
G1 X143.649 Y111.461 E-.18319
G1 X143.736 Y111.462 E-.03279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 16 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer16 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X142.78 Y114.613 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.986 Y114.84 E.00497
G1 X143.397 Y115.042 E.00745
G1 X143.872 Y115.069 E.00773
G1 X144.305 Y114.916 E.00745
G1 X144.655 Y114.596 E.00771
G1 X144.851 Y114.171 E.0076
G2 X144.807 Y113.487 I-1.301 J-.26 E.01125
G1 X144.56 Y113.09 E.00758
G1 X144.186 Y112.824 E.00745
G1 X143.76 Y112.721 E.00713
G1 X143.317 Y112.782 E.00725
G1 X142.907 Y113.024 E.00773
G1 X142.63 Y113.399 E.00757
G1 X142.519 Y113.862 E.00773
G1 X142.596 Y114.321 E.00756
G1 X142.748 Y114.563 E.00464
M204 S10000
G1 X143.731 Y113.87 F42000
; LINE_WIDTH: 0.35664
G1 F15000
M204 S6000
G1 X143.668 Y113.906 E.00099
G1 X143.715 Y113.933 E.00074
M204 S10000
G1 X143.872 Y113.568 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.605 Y113.533 E.00437
G1 X143.418 Y113.648 E.00358
G1 X143.323 Y113.856 E.00371
G1 X143.358 Y114.064 E.00343
G1 X143.577 Y114.259 E.00476
G1 X143.793 Y114.268 E.0035
G1 X143.987 Y114.147 E.00371
G1 X144.076 Y113.949 E.00351
G1 X144.078 Y113.875 E.00121
G1 X143.995 Y113.662 E.00371
G1 X143.919 Y113.604 E.00155
M204 S10000
G1 X143.966 Y113.181 F42000
G1 F15000
M204 S6000
G1 X143.59 Y113.127 E.00616
G1 X143.299 Y113.229 E.00502
G1 X143.072 Y113.436 E.00498
G1 X142.939 Y113.722 E.00512
G1 X142.929 Y114.029 E.00498
G1 X143.026 Y114.291 E.00455
G1 X143.312 Y114.574 E.00653
G1 X143.574 Y114.668 E.00452
G1 X143.889 Y114.655 E.00512
G1 X144.162 Y114.525 E.00491
G1 X144.37 Y114.295 E.00503
G1 X144.471 Y114.003 E.00502
G1 X144.476 Y113.852 E.00246
G1 X144.391 Y113.545 E.00516
G1 X144.193 Y113.298 E.00514
G1 X144.019 Y113.208 E.00318
; OBJECT_ID: 94
; WIPE_START
G1 X144.193 Y113.298 E-.07448
G1 X144.391 Y113.545 E-.12032
G1 X144.476 Y113.852 E-.1208
G1 X144.471 Y114.003 E-.0575
G1 X144.37 Y114.295 E-.11751
G1 X144.162 Y114.525 E-.11779
G1 X143.889 Y114.655 E-.11493
G1 X143.792 Y114.658 E-.03668
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.022 Y119.654 Z2 F42000
G1 X103.041 Y149.932 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00589
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.925 J.018 E.04613
G1 X122.976 Y129.591 E.29595
G3 X124.809 Y131.427 I-.08 J1.913 E.04628
G1 X124.81 Y149.504 E.29354
G3 X122.973 Y151.409 I-1.914 J-.008 E.04744
G1 X104.898 Y151.41 E.2935
G3 X103.057 Y149.99 I.016 J-1.925 E.04054
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16044
G1 X102.991 Y147.995 E-.59956
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.376 Z2 F42000
G1 X104.089 Y129.072 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.521 J2.138 E.00695
G1 X123.27 Y129.012 E.3046
G1 X123.458 Y129.025 E.00305
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.192 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.09 J-2.193 E.0545
G1 X102.412 Y131.115 E.30334
G3 X104.031 Y129.087 I2.198 J.095 E.04505
M204 S10000
G1 X104.114 Y129.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252162
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00333
; LINE_WIDTH: 0.187753
G1 X104.892 Y129.301 E.00295
G1 X122.984 Y129.301 E.12258
G3 X123.411 Y129.336 I-.027 J2.984 E.0029
; LINE_WIDTH: 0.256132
G3 X123.603 Y129.379 I-1.143 J5.568 E.00188
G1 X123.773 Y129.435 E.00172
; LINE_WIDTH: 0.299478
G3 X124.902 Y130.474 I-.715 J1.909 E.01781
G1 X124.963 Y130.618 E.00177
; LINE_WIDTH: 0.256729
G3 X125.061 Y130.977 I-2.178 J.793 E.00357
; LINE_WIDTH: 0.188517
G3 X125.096 Y131.319 I-2.664 J.446 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.250011
G3 X125.046 Y150.098 I-2.946 J-.438 E.00154
G1 X124.973 Y150.353 E.00248
; LINE_WIDTH: 0.300463
G3 X123.926 Y151.501 I-1.906 J-.687 E.01813
; LINE_WIDTH: 0.263729
G3 X123.595 Y151.623 I-.858 J-1.817 E.00349
G1 X123.423 Y151.662 E.00174
; LINE_WIDTH: 0.1887
G1 X122.979 Y151.699 E.00304
G1 X104.896 Y151.699 E.12322
G3 X104.384 Y151.663 I-.03 J-3.238 E.0035
; LINE_WIDTH: 0.251915
G3 X104.198 Y151.621 I1.128 J-5.376 E.0018
M73 P53 R13
G1 X104.104 Y151.592 E.00092
; LINE_WIDTH: 0.298709
G3 X102.898 Y150.526 I.636 J-1.935 E.01868
G1 X102.863 Y150.446 E.00099
; LINE_WIDTH: 0.259762
G3 X102.739 Y150.023 I2.067 J-.84 E.00429
; LINE_WIDTH: 0.188228
G3 X102.704 Y149.681 I2.662 J-.445 E.00234
G1 X102.701 Y131.489 E.12361
; LINE_WIDTH: 0.197702
G1 X102.717 Y131.127 E.0026
; LINE_WIDTH: 0.242535
G3 X102.787 Y130.77 I2.2 J.246 E.00328
G1 X102.804 Y130.715 E.00052
; LINE_WIDTH: 0.297642
G3 X104.022 Y129.436 I1.932 J.62 E.02056
; LINE_WIDTH: 0.252162
G1 X104.056 Y129.428 E.00033
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15732
G1 X104.892 Y129.301 E-.16555
G1 X106.042 Y129.301 E-.43714
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 17/95
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2 I.57 J1.075 P1  F42000
G1 X151.198 Y105.339 Z2
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.287 Y106.655 I-.261 J1.325 E.03004
G1 X152.287 Y121.145 E.23527
G3 X150.945 Y122.487 I-1.35 J-.008 E.03418
G1 X136.455 Y122.487 E.23527
G3 X135.113 Y121.145 I.008 J-1.35 E.03418
G1 X135.113 Y106.655 E.23527
G3 X136.455 Y105.313 I1.35 J.008 E.03418
G1 X150.945 Y105.313 E.23527
G3 X151.139 Y105.328 I-.008 J1.35 E.00317
; WIPE_START
M204 S6000
G1 X151.452 Y105.415 E-.12348
G1 X151.686 Y105.54 E-.10082
G1 X151.891 Y105.709 E-.10086
G1 X152.06 Y105.914 E-.10084
G1 X152.185 Y106.148 E-.10084
G1 X152.262 Y106.402 E-.10084
G1 X152.287 Y106.655 E-.09688
G1 X152.287 Y106.749 E-.03544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.802 Y105.255 Z2.1 F42000
G1 X143.759 Y105.047 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.322 Y105.051 E.1228
G3 X152.555 Y106.354 I-.146 J1.373 E.03171
G1 X152.557 Y121.395 E.24424
G3 X151.175 Y122.757 I-1.382 J-.02 E.03493
G1 X136.205 Y122.757 E.24307
G3 X134.843 Y121.377 I.031 J-1.393 E.03482
G1 X134.843 Y106.405 E.24311
G3 X136.205 Y105.043 I1.381 J.019 E.0346
G1 X143.699 Y105.047 E.12169
; WIPE_START
M204 S6000
G1 X145.699 Y105.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.826 Y112.119 Z2.1 F42000
G1 X142.552 Y112.793 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.729 Y112.626 E.00424
G3 X143.658 Y112.303 I.964 J1.273 E.01747
G1 X143.788 Y112.305 E.00226
G3 X142.506 Y112.831 I-.095 J1.594 E.15014
M204 S10000
G1 X142.265 Y112.476 F42000
G1 F6000
M204 S6000
G1 X142.469 Y112.287 E.00485
G3 X143.654 Y111.874 I1.226 J1.612 E.02228
G1 X143.813 Y111.877 E.00278
G3 X142.217 Y112.514 I-.118 J2.022 E.1912
G1 X142.218 Y112.513 E.00002
M204 S250
G1 X141.988 Y112.17 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.217 Y111.96 E.00505
G3 X143.649 Y111.461 I1.479 J1.939 E.02504
G1 X143.837 Y111.464 E.00304
G3 X141.916 Y112.232 I-.14 J2.435 E.21415
G1 X141.943 Y112.209 E.00056
; WIPE_START
M204 S6000
G1 X142.217 Y111.96 E-.14103
G1 X142.452 Y111.803 E-.10721
G1 X142.702 Y111.674 E-.10716
G1 X142.891 Y111.598 E-.07733
G1 X143.169 Y111.519 E-.10964
G1 X143.649 Y111.461 E-.18398
G1 X143.738 Y111.462 E-.03367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 17 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer17 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X142.576 Y114.201 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.681 Y114.498 E.00512
G1 X142.978 Y114.835 E.00729
G1 X143.399 Y115.043 E.00762
G1 X143.864 Y115.07 E.00757
G1 X144.305 Y114.915 E.00759
G1 X144.646 Y114.609 E.00744
G1 X144.812 Y114.281 E.00598
G1 X144.881 Y113.946 E.00555
G2 X144.81 Y113.493 I-1.739 J.041 E.00746
G1 X144.56 Y113.09 E.00771
G1 X144.186 Y112.824 E.00745
G1 X143.758 Y112.721 E.00715
G1 X143.309 Y112.785 E.00736
G1 X142.907 Y113.024 E.00761
G1 X142.626 Y113.407 E.00771
G1 X142.519 Y113.861 E.00757
G1 X142.566 Y114.142 E.00463
M204 S10000
G1 X143.729 Y113.871 F42000
; LINE_WIDTH: 0.35918
G1 F15000
M204 S6000
G1 X143.666 Y113.907 E.00101
G1 X143.714 Y113.935 E.00076
M204 S10000
G1 X143.877 Y113.569 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.601 Y113.534 E.00452
G1 X143.421 Y113.643 E.0034
G1 X143.326 Y113.84 E.00356
G1 X143.394 Y114.124 E.00476
G1 X143.574 Y114.257 E.00362
G1 X143.791 Y114.268 E.00354
G1 X143.98 Y114.156 E.00355
G1 X144.076 Y113.948 E.00373
G1 X144.079 Y113.878 E.00114
G1 X144.005 Y113.676 E.00349
G1 X143.923 Y113.608 E.00174
M204 S10000
G1 X144.216 Y113.319 F42000
G1 F15000
M204 S6000
G1 X144.039 Y113.198 E.00348
G1 X143.644 Y113.124 E.00652
G1 X143.367 Y113.198 E.00466
G1 X143.127 Y113.374 E.00483
G1 X142.961 Y113.656 E.00532
G1 X142.922 Y113.926 E.00442
G1 X143.038 Y114.311 E.00653
G1 X143.222 Y114.518 E.00449
G1 X143.502 Y114.656 E.00507
G1 X143.809 Y114.673 E.005
G1 X144.1 Y114.571 E.00501
G1 X144.325 Y114.37 E.0049
G1 X144.461 Y114.078 E.00523
G1 X144.477 Y113.856 E.00362
G1 X144.399 Y113.56 E.00496
G1 X144.252 Y113.367 E.00394
; OBJECT_ID: 94
; WIPE_START
G1 X144.399 Y113.56 E-.09227
G1 X144.477 Y113.856 E-.11616
G1 X144.461 Y114.078 E-.08461
G1 X144.325 Y114.37 E-.12229
G1 X144.1 Y114.571 E-.11465
G1 X143.809 Y114.673 E-.11719
G1 X143.513 Y114.656 E-.11283
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.759 Y119.671 Z2.1 F42000
G1 X103.04 Y149.931 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.991 Y149.575 I1.863 J-.435 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.928 J.021 E.04611
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.09 J1.923 E.04619
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.912 J-.004 E.04745
G1 X104.895 Y151.41 E.29358
G3 X103.054 Y149.99 I.008 J-1.913 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15929
G1 X102.991 Y147.994 E-.60072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z2.1 F42000
G1 X104.089 Y129.074 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.529 J2.145 E.00695
G1 X123.269 Y129.012 E.30458
G1 X123.458 Y129.025 E.00307
G3 X125.39 Y131.204 I-.259 J2.176 E.05172
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.795 I.09 J-2.193 E.05451
G1 X102.412 Y131.115 E.30333
G3 X104.031 Y129.089 I2.207 J.104 E.04501
M204 S10000
G1 X104.129 Y129.407 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.254711
G1 F15000
M204 S6000
G1 X104.307 Y129.352 E.00177
G1 X104.458 Y129.326 E.00145
; LINE_WIDTH: 0.187453
G1 X104.892 Y129.301 E.00294
G1 X122.984 Y129.301 E.12236
G1 X123.258 Y129.317 E.00186
; LINE_WIDTH: 0.241449
G1 X123.674 Y129.401 E.00381
; LINE_WIDTH: 0.29693
G3 X124.97 Y130.639 I-.607 J1.932 E.02083
; LINE_WIDTH: 0.252094
G3 X125.074 Y131.049 I-1.854 J.689 E.00399
; LINE_WIDTH: 0.188201
G1 X125.099 Y131.417 E.00251
G1 X125.099 Y149.505 E.12289
G1 X125.085 Y149.849 E.00233
; LINE_WIDTH: 0.24045
G3 X125.064 Y150.012 I-1.92 J-.17 E.00147
G1 X125.001 Y150.271 E.00237
; LINE_WIDTH: 0.297087
G3 X123.931 Y151.499 I-1.937 J-.607 E.01883
G1 X123.763 Y151.57 E.00205
; LINE_WIDTH: 0.25258
G3 X123.357 Y151.673 I-.708 J-1.941 E.00395
; LINE_WIDTH: 0.188273
G1 X122.983 Y151.699 E.00254
G1 X104.891 Y151.699 E.12297
G1 X104.526 Y151.682 E.00248
; LINE_WIDTH: 0.245532
G3 X104.064 Y151.579 I.231 J-2.116 E.00434
; LINE_WIDTH: 0.298256
G3 X102.898 Y150.525 I.679 J-1.924 E.01819
G1 X102.834 Y150.374 E.00185
; LINE_WIDTH: 0.25548
G3 X102.735 Y150.005 I1.892 J-.705 E.00364
; LINE_WIDTH: 0.188192
G3 X102.71 Y149.789 I2.457 J-.4 E.00148
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.197687
G1 X102.717 Y131.128 E.00259
; LINE_WIDTH: 0.242825
G3 X102.805 Y130.713 I2.134 J.236 E.00383
; LINE_WIDTH: 0.298523
G3 X103.872 Y129.5 I1.927 J.62 E.01876
G1 X103.975 Y129.454 E.00127
; LINE_WIDTH: 0.254711
G1 X104.072 Y129.424 E.00097
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.307 Y129.352 E-.0935
G1 X104.458 Y129.326 E-.05798
G1 X104.892 Y129.301 E-.16525
G1 X106.058 Y129.301 E-.44327
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 18/95
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.1 I.571 J1.075 P1  F42000
G1 X151.21 Y105.317 Z2.1
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.309 Y106.646 I-.264 J1.337 E.03031
G1 X152.309 Y121.154 E.23559
G3 X150.954 Y122.509 I-1.362 J-.008 E.0345
G1 X136.446 Y122.509 E.23559
G3 X135.091 Y121.154 I.008 J-1.362 E.0345
G1 X135.091 Y106.646 E.23559
G3 X136.446 Y105.291 I1.362 J.008 E.0345
G1 X150.954 Y105.291 E.23559
G3 X151.151 Y105.307 I-.008 J1.362 E.00321
; WIPE_START
M204 S6000
G1 X151.467 Y105.394 E-.12439
G1 X151.703 Y105.52 E-.10173
G1 X151.91 Y105.69 E-.10176
G1 X152.08 Y105.897 E-.10176
G1 X152.206 Y106.133 E-.10174
G1 X152.284 Y106.39 E-.10175
G1 X152.309 Y106.646 E-.09779
G1 X152.309 Y106.722 E-.02907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.823 Y105.231 Z2.2 F42000
G1 X143.759 Y105.019 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.341 Y105.022 E.1231
G3 X152.583 Y106.335 I-.147 J1.384 E.03194
G1 X152.585 Y121.413 E.24484
G3 X151.191 Y122.785 I-1.393 J-.021 E.03519
G1 X136.187 Y122.785 E.24365
G3 X134.815 Y121.394 I.033 J-1.405 E.03507
G1 X134.815 Y106.387 E.24369
G3 X136.187 Y105.015 I1.393 J.021 E.03484
G1 X143.699 Y105.019 E.12199
; WIPE_START
M204 S6000
G1 X145.699 Y105.02 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.834 Y112.094 Z2.2 F42000
G1 X142.552 Y112.792 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.723 Y112.631 E.0041
G3 X143.658 Y112.303 I.969 J1.269 E.0176
G1 X143.786 Y112.305 E.00223
G3 X142.507 Y112.83 I-.093 J1.594 E.15019
M204 S10000
G1 X142.265 Y112.475 F42000
G1 F6000
M204 S6000
G1 X142.462 Y112.292 E.00469
G3 X143.654 Y111.874 I1.232 J1.607 E.02242
G1 X143.81 Y111.877 E.00273
G3 X142.218 Y112.512 I-.116 J2.022 E.19128
M204 S250
G1 X141.988 Y112.169 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.21 Y111.965 E.0049
G3 X143.649 Y111.461 I1.486 J1.934 E.02519
G1 X143.834 Y111.464 E.003
G3 X141.922 Y112.225 I-.138 J2.435 E.21433
G1 X141.943 Y112.208 E.00043
; WIPE_START
M204 S6000
G1 X142.21 Y111.965 E-.1374
G1 X142.452 Y111.803 E-.11055
G1 X142.7 Y111.675 E-.1062
G1 X142.893 Y111.597 E-.079
G1 X143.16 Y111.521 E-.10527
G1 X143.362 Y111.484 E-.07815
G1 X143.649 Y111.461 E-.10969
G1 X143.738 Y111.462 E-.03375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 18 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer18 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X144.875 Y113.835 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.806 Y113.485 E.0058
G1 X144.56 Y113.09 E.00754
G1 X144.187 Y112.824 E.00745
G1 X143.756 Y112.721 E.00719
G1 X143.318 Y112.782 E.00719
G1 X142.907 Y113.024 E.00775
G1 X142.626 Y113.407 E.00771
G1 X142.519 Y113.862 E.00759
G1 X142.593 Y114.313 E.00742
G1 X142.83 Y114.699 E.00736
G1 X143.184 Y114.963 E.00717
G1 X143.629 Y115.079 E.00747
G1 X144.09 Y115.015 E.00755
G1 X144.493 Y114.776 E.0076
G1 X144.774 Y114.393 E.00772
G1 X144.881 Y113.946 E.00746
G1 X144.878 Y113.895 E.00082
M204 S10000
G1 X143.873 Y113.568 F42000
G1 F15000
M204 S6000
G1 X143.605 Y113.533 E.00439
G1 X143.421 Y113.643 E.00347
G1 X143.324 Y113.854 E.00378
G1 X143.355 Y114.056 E.00332
G1 X143.569 Y114.255 E.00475
G1 X143.792 Y114.268 E.00363
G1 X143.981 Y114.154 E.00357
G1 X144.076 Y113.949 E.00367
G1 X144.079 Y113.881 E.00111
G1 X144.006 Y113.677 E.00351
G1 X143.919 Y113.606 E.00181
M204 S10000
G1 X143.732 Y113.87 F42000
; LINE_WIDTH: 0.35422
M73 P54 R13
G1 F15000
M204 S6000
G1 X143.67 Y113.906 E.00098
G1 X143.716 Y113.932 E.00073
M204 S10000
G1 X143.171 Y114.456 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.5 Y114.655 E.00623
G1 X143.814 Y114.673 E.00511
G1 X144.1 Y114.571 E.00492
G1 X144.328 Y114.365 E.005
G1 X144.461 Y114.078 E.00513
G1 X144.477 Y113.858 E.00358
G1 X144.4 Y113.56 E.005
G1 X144.218 Y113.32 E.00488
G1 X144.039 Y113.199 E.00351
G1 X143.643 Y113.124 E.00655
G1 X143.367 Y113.198 E.00462
G1 X143.127 Y113.374 E.00484
G1 X142.964 Y113.65 E.00522
G1 X142.925 Y113.96 E.00507
G1 X143.015 Y114.269 E.00522
G1 X143.133 Y114.41 E.00299
; OBJECT_ID: 94
; WIPE_START
G1 X143.015 Y114.269 E-.06986
G1 X142.925 Y113.96 E-.12226
G1 X142.964 Y113.65 E-.11871
G1 X143.127 Y113.374 E-.12213
G1 X143.367 Y113.198 E-.1132
G1 X143.643 Y113.124 E-.10823
G1 X143.916 Y113.175 E-.1056
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.24 Y118.279 Z2.2 F42000
G1 X103.041 Y149.932 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00589
G1 X102.99 Y131.496 E.29353
G3 X104.825 Y129.591 I1.911 J.005 E.04743
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.091 J1.925 E.04619
G1 X124.81 Y149.505 E.29357
G3 X122.975 Y151.409 I-1.914 J-.008 E.0474
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.99 I.007 J-1.914 E.04057
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16054
G1 X102.991 Y147.995 E-.59946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.376 Z2.2 F42000
G1 X104.089 Y129.074 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00695
G1 X123.268 Y129.011 E.30457
G1 X123.458 Y129.025 E.00308
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.796 I.09 J-2.192 E.0545
G1 X102.412 Y131.114 E.30335
G3 X104.031 Y129.089 I2.207 J.104 E.045
M204 S10000
G1 X104.114 Y129.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252115
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00333
; LINE_WIDTH: 0.18839
G3 X104.637 Y129.309 I.346 J2.79 E.00123
G1 X122.983 Y129.301 E.12478
G1 X123.415 Y129.337 E.00295
; LINE_WIDTH: 0.253697
G3 X123.735 Y129.421 I-.332 J1.909 E.00314
; LINE_WIDTH: 0.298276
G3 X124.899 Y130.469 I-.671 J1.915 E.01813
G1 X124.968 Y130.631 E.00198
; LINE_WIDTH: 0.252736
G3 X125.073 Y131.047 I-2.312 J.809 E.00405
; LINE_WIDTH: 0.188366
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.509 E.12303
G3 X125.077 Y149.923 I-3.727 J.008 E.00282
G1 X125.076 Y149.932 E.00006
; LINE_WIDTH: 0.250945
G3 X124.967 Y150.371 I-2.149 J-.301 E.00424
; LINE_WIDTH: 0.300674
G3 X123.905 Y151.511 I-1.9 J-.706 E.01818
; LINE_WIDTH: 0.263043
G3 X123.423 Y151.661 I-.874 J-1.947 E.00499
; LINE_WIDTH: 0.18851
G3 X123.254 Y151.685 I-.446 J-2.634 E.00116
G1 X122.983 Y151.699 E.00185
G1 X104.892 Y151.699 E.12313
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.250834
G3 X104.029 Y151.567 I.31 J-2.195 E.00425
; LINE_WIDTH: 0.300974
G3 X102.901 Y150.531 I.716 J-1.912 E.01788
G1 X102.896 Y150.519 E.00014
; LINE_WIDTH: 0.263135
G3 X102.777 Y150.195 I1.853 J-.863 E.00341
G1 X102.736 Y150.015 E.00181
; LINE_WIDTH: 0.188211
G3 X102.704 Y149.681 I3.048 J-.468 E.00229
G1 X102.701 Y131.489 E.1236
; LINE_WIDTH: 0.19628
G1 X102.714 Y131.154 E.00238
; LINE_WIDTH: 0.240141
G3 X102.798 Y130.732 I2.049 J.189 E.00384
; LINE_WIDTH: 0.297143
G3 X104.022 Y129.436 I1.935 J.601 E.02073
; LINE_WIDTH: 0.252115
G1 X104.056 Y129.428 E.00033
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15745
G1 X104.637 Y129.309 E-.06876
G1 X106.042 Y129.308 E-.53379
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 19/95
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I.571 J1.075 P1  F42000
G1 X151.222 Y105.295 Z2.2
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.331 Y106.636 I-.266 J1.349 E.03058
G1 X152.331 Y121.164 E.23591
G3 X150.964 Y122.531 I-1.375 J-.008 E.03481
G1 X136.436 Y122.531 E.23591
G3 X135.069 Y121.164 I.008 J-1.375 E.03481
G1 X135.069 Y106.636 E.23591
G3 X136.436 Y105.269 I1.375 J.008 E.03481
G1 X150.964 Y105.269 E.23591
G3 X151.163 Y105.285 I-.008 J1.375 E.00325
; WIPE_START
M204 S6000
G1 X151.481 Y105.373 E-.12529
G1 X151.719 Y105.501 E-.10265
G1 X151.928 Y105.672 E-.10264
G1 X152.099 Y105.881 E-.10269
G1 X152.227 Y106.119 E-.10264
G1 X152.305 Y106.378 E-.10267
G1 X152.331 Y106.636 E-.0987
G1 X152.331 Y106.696 E-.02272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.845 Y105.206 Z2.3 F42000
G1 X143.76 Y104.991 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.359 Y104.994 E.1234
G3 X152.611 Y106.316 I-.149 J1.395 E.03216
G1 X152.613 Y121.432 E.24546
G3 X151.209 Y122.814 I-1.404 J-.023 E.03546
G1 X136.168 Y122.813 E.24423
G3 X134.786 Y121.411 I.035 J-1.416 E.03534
G1 X134.787 Y106.368 E.24426
G3 X136.168 Y104.987 I1.404 J.023 E.03508
G1 X143.7 Y104.991 E.1223
; WIPE_START
M204 S6000
G1 X145.7 Y104.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.845 Y112.07 Z2.3 F42000
G1 X142.554 Y112.791 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.734 Y112.626 E.00426
G3 X143.659 Y112.303 I.963 J1.273 E.01739
G1 X143.794 Y112.305 E.00237
G3 X142.51 Y112.831 I-.097 J1.593 E.15005
M204 S10000
G1 X142.268 Y112.474 F42000
G1 F6000
M204 S6000
G1 X142.473 Y112.286 E.00487
G3 X143.654 Y111.874 I1.224 J1.613 E.0222
G1 X143.814 Y111.877 E.0028
G3 X142.215 Y112.519 I-.118 J2.021 E.19102
G1 X142.222 Y112.513 E.00015
M204 S250
G1 X141.991 Y112.169 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X142.222 Y111.957 E.00508
G3 X143.65 Y111.461 I1.475 J1.941 E.02496
G1 X143.834 Y111.464 E.00299
G3 X141.913 Y112.236 I-.137 J2.434 E.21401
G1 X141.945 Y112.208 E.00069
; WIPE_START
M204 S6000
G1 X142.222 Y111.957 E-.14173
G1 X142.452 Y111.803 E-.10532
G1 X142.698 Y111.676 E-.10523
G1 X142.893 Y111.597 E-.08001
G1 X143.157 Y111.522 E-.10427
G1 X143.362 Y111.484 E-.07919
G1 X143.65 Y111.461 E-.10964
G1 X143.741 Y111.462 E-.03462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 19 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer19 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X142.575 Y114.201 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X142.752 Y114.596 E.00702
G1 X142.978 Y114.835 E.00534
G1 X143.398 Y115.042 E.0076
G1 X143.872 Y115.069 E.00772
G1 X144.306 Y114.915 E.00747
G1 X144.651 Y114.603 E.00756
G1 X144.851 Y114.17 E.00774
G1 X144.874 Y113.835 E.00545
G1 X144.806 Y113.485 E.00579
G1 X144.561 Y113.09 E.00755
G1 X144.178 Y112.82 E.00761
G1 X143.764 Y112.721 E.00692
G1 X143.318 Y112.782 E.00731
G1 X142.907 Y113.024 E.00776
G1 X142.626 Y113.407 E.0077
G1 X142.519 Y113.863 E.00761
G1 X142.565 Y114.142 E.0046
M204 S10000
G1 X143.729 Y113.869 F42000
; LINE_WIDTH: 0.3607
G1 F15000
M204 S6000
G1 X143.665 Y113.906 E.00102
G1 X143.714 Y113.934 E.00077
M204 S10000
G1 X143.864 Y113.564 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X143.606 Y113.532 E.00422
G1 X143.421 Y113.643 E.00349
G1 X143.325 Y113.841 E.00358
G1 X143.392 Y114.122 E.00469
G1 X143.57 Y114.256 E.00362
G1 X143.793 Y114.268 E.00361
G1 X143.98 Y114.155 E.00356
G1 X144.076 Y113.949 E.00368
G1 X144.079 Y113.881 E.00112
G1 X143.997 Y113.664 E.00376
G1 X143.912 Y113.6 E.00173
M204 S10000
G1 X144.217 Y113.32 F42000
G1 F15000
M204 S6000
G1 X144.031 Y113.194 E.00364
G1 X143.646 Y113.124 E.00636
G1 X143.368 Y113.197 E.00466
G1 X143.127 Y113.374 E.00485
G1 X142.961 Y113.657 E.00534
G1 X142.922 Y113.928 E.00444
G1 X143.035 Y114.306 E.00641
G1 X143.223 Y114.518 E.0046
G1 X143.5 Y114.655 E.00502
G1 X143.815 Y114.673 E.00513
G1 X144.102 Y114.57 E.00494
G1 X144.328 Y114.364 E.00497
G1 X144.461 Y114.078 E.00512
G1 X144.477 Y113.858 E.00358
G1 X144.396 Y113.554 E.00511
G1 X144.253 Y113.368 E.00381
; OBJECT_ID: 94
; WIPE_START
G1 X144.396 Y113.554 E-.08909
G1 X144.477 Y113.858 E-.11959
G1 X144.461 Y114.078 E-.08389
G1 X144.328 Y114.364 E-.1199
G1 X144.102 Y114.57 E-.11632
G1 X143.815 Y114.673 E-.11557
G1 X143.512 Y114.656 E-.11564
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.758 Y119.671 Z2.3 F42000
G1 X103.041 Y149.932 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00585
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.924 J.018 E.04735
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.924 J-.016 E.04737
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.99 I.008 J-1.914 E.04058
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15949
G1 X102.991 Y147.995 E-.60051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z2.3 F42000
G1 X104.088 Y129.073 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.524 J2.139 E.00696
G1 X123.267 Y129.011 E.30455
G1 X123.458 Y129.025 E.0031
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.05451
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.796 I.09 J-2.193 E.0545
G1 X102.412 Y131.112 E.30339
G3 X104.03 Y129.088 I2.2 J.1 E.045
M204 S10000
G1 X104.147 Y129.395 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.263523
G1 F15000
M204 S6000
G1 X104.163 Y129.39 E.00017
G3 X104.373 Y129.339 I.603 J2.038 E.00213
; LINE_WIDTH: 0.188592
G3 X104.637 Y129.309 I.338 J1.759 E.00181
G1 X122.983 Y129.301 E.12493
G1 X123.415 Y129.337 E.00295
; LINE_WIDTH: 0.253658
G3 X123.735 Y129.421 I-.331 J1.907 E.00313
; LINE_WIDTH: 0.30039
G3 X124.876 Y130.422 I-.672 J1.916 E.01768
G1 X124.904 Y130.48 E.00074
; LINE_WIDTH: 0.262761
G3 X125.06 Y130.968 I-2.119 J.946 E.00504
G1 X125.063 Y130.985 E.00017
; LINE_WIDTH: 0.18849
G3 X125.085 Y131.146 I-2.437 J.403 E.0011
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.505 E.1231
G3 X125.076 Y149.93 I-4.179 J-.015 E.00289
; LINE_WIDTH: 0.250121
G3 X124.975 Y150.348 I-2.033 J-.27 E.00401
; LINE_WIDTH: 0.29837
G3 X124.159 Y151.374 I-1.934 J-.701 E.01505
G1 X123.763 Y151.57 E.00499
; LINE_WIDTH: 0.255886
G3 X123.423 Y151.661 I-.69 J-1.882 E.00336
; LINE_WIDTH: 0.188511
G3 X123.254 Y151.685 I-.438 J-2.567 E.00116
G1 X122.983 Y151.699 E.00185
G1 X104.892 Y151.699 E.12313
G3 X104.475 Y151.676 I-.001 J-3.843 E.00285
G1 X104.469 Y151.676 E.00004
; LINE_WIDTH: 0.250908
G3 X104.028 Y151.566 I.324 J-2.25 E.00426
; LINE_WIDTH: 0.299195
G3 X102.898 Y150.526 I.72 J-1.915 E.01782
G1 X102.834 Y150.374 E.00187
; LINE_WIDTH: 0.255703
G3 X102.777 Y150.195 I5.575 J-1.896 E.0018
G1 X102.736 Y150.015 E.00176
; LINE_WIDTH: 0.188211
G3 X102.715 Y149.854 I2.713 J-.435 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.198063
G1 X102.718 Y131.121 E.00265
; LINE_WIDTH: 0.243463
G3 X102.806 Y130.708 I2.404 J.301 E.00382
; LINE_WIDTH: 0.29912
G3 X103.791 Y129.539 I1.931 J.627 E.01773
G1 X103.88 Y129.496 E.00112
; LINE_WIDTH: 0.263523
G1 X104.09 Y129.417 E.00221
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.163 Y129.39 E-.02944
G1 X104.373 Y129.339 E-.08198
G1 X104.637 Y129.309 E-.10104
G1 X106.078 Y129.308 E-.54754
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 20/95
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.3 I.572 J1.074 P1  F42000
G1 X151.235 Y105.274 Z2.3
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.353 Y106.626 I-.269 J1.36 E.03086
G1 X152.353 Y121.174 E.23622
G3 X150.974 Y122.553 I-1.387 J-.008 E.03512
M73 P54 R12
G1 X136.426 Y122.553 E.23622
G3 X135.047 Y121.174 I.008 J-1.387 E.03512
G1 X135.047 Y106.626 E.23622
G3 X136.426 Y105.247 I1.387 J.008 E.03512
G1 X150.974 Y105.247 E.23622
G3 X151.175 Y105.263 I-.008 J1.387 E.00329
; WIPE_START
M204 S6000
G1 X151.495 Y105.352 E-.1262
G1 X151.736 Y105.481 E-.10355
G1 X151.946 Y105.654 E-.10358
G1 X152.119 Y105.864 E-.10358
G1 X152.248 Y106.105 E-.10355
G1 X152.327 Y106.365 E-.10357
G1 X152.353 Y106.626 E-.09961
G1 X152.353 Y106.669 E-.01636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.866 Y105.182 Z2.4 F42000
G1 X143.76 Y104.962 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.378 Y104.966 E.1237
G3 X152.639 Y106.297 I-.151 J1.406 E.03239
G1 X152.641 Y121.451 E.24607
M73 P55 R12
G3 X151.225 Y122.842 I-1.415 J-.024 E.03572
G1 X136.149 Y122.841 E.24481
G3 X134.758 Y121.428 I.037 J-1.428 E.0356
G1 X134.759 Y106.349 E.24484
G3 X136.149 Y104.959 I1.415 J.024 E.03531
G1 X143.7 Y104.962 E.12261
; WIPE_START
M204 S6000
G1 X145.7 Y104.963 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.858 Y112.047 Z2.4 F42000
G1 X142.563 Y112.781 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X142.588 Y112.751 E.00069
G3 X143.659 Y112.303 I1.109 J1.146 E.02074
G1 X143.792 Y112.305 E.00233
G3 X142.413 Y112.951 I-.096 J1.592 E.14722
G1 X142.524 Y112.826 E.0029
M204 S10000
G1 X142.241 Y112.501 F42000
G1 F6000
M204 S6000
G1 X142.285 Y112.448 E.0012
G3 X143.654 Y111.874 I1.412 J1.449 E.02654
G1 X143.812 Y111.877 E.00276
G3 X142.069 Y112.696 I-.116 J2.019 E.18686
G1 X142.201 Y112.546 E.0035
M204 S250
G1 X141.947 Y112.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.992 Y112.155 E.0011
G3 X143.65 Y111.461 I1.704 J1.741 E.02988
G1 X143.831 Y111.464 E.00295
G3 X141.858 Y112.298 I-.135 J2.432 E.21251
G1 X141.905 Y112.249 E.00111
; WIPE_START
M204 S6000
G1 X141.992 Y112.155 E-.04854
G1 X142.371 Y111.854 E-.18408
G1 X142.8 Y111.632 E-.18353
G1 X143.266 Y111.499 E-.18405
G1 X143.65 Y111.461 E-.14642
G1 X143.685 Y111.461 E-.01339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 20 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer20 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X144.873 Y113.821 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.81 Y113.494 E.00541
G1 X144.556 Y113.085 E.00782
G1 X144.195 Y112.828 E.00719
G1 X143.762 Y112.721 E.00725
G1 X143.308 Y112.785 E.00744
G1 X142.907 Y113.023 E.00759
G1 X142.625 Y113.408 E.00774
G1 X142.519 Y113.853 E.00743
G1 X142.593 Y114.315 E.00759
G1 X142.836 Y114.705 E.00747
G1 X143.193 Y114.967 E.00718
G1 X143.629 Y115.079 E.00731
G1 X144.091 Y115.015 E.00757
G1 X144.492 Y114.777 E.00758
G1 X144.774 Y114.393 E.00775
G1 X144.881 Y113.956 E.0073
G1 X144.876 Y113.881 E.00121
M204 S10000
G1 X143.886 Y113.572 F42000
G1 F15000
M204 S6000
G1 X143.601 Y113.533 E.00468
G1 X143.418 Y113.647 E.00348
G1 X143.324 Y113.851 E.00365
G1 X143.355 Y114.059 E.00341
G1 X143.574 Y114.257 E.00479
G1 X143.791 Y114.268 E.00354
G1 X143.983 Y114.152 E.00364
G1 X144.075 Y113.957 E.0035
G1 X144.077 Y113.867 E.00146
G1 X144.005 Y113.677 E.0033
G1 X143.931 Y113.612 E.0016
M204 S10000
G1 X143.733 Y113.87 F42000
; LINE_WIDTH: 0.35402
G1 F15000
M204 S6000
G1 X143.67 Y113.906 E.00098
G1 X143.717 Y113.933 E.00073
M204 S10000
G1 X144.042 Y114.598 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X144.279 Y114.418 E.00484
G1 X144.436 Y114.154 E.00499
G1 X144.475 Y113.844 E.00506
G1 X144.4 Y113.561 E.00475
G1 X144.213 Y113.316 E.00501
G1 X144.046 Y113.201 E.00329
G1 X143.64 Y113.125 E.00671
G1 X143.366 Y113.198 E.00462
G1 X143.122 Y113.38 E.00493
G1 X142.964 Y113.646 E.00502
G1 X142.924 Y113.952 E.00502
G1 X143.007 Y114.254 E.00508
G1 X143.118 Y114.418 E.00321
G1 X143.454 Y114.638 E.00653
G1 X143.736 Y114.676 E.00462
G1 X143.984 Y114.613 E.00415
; OBJECT_ID: 94
; WIPE_START
G1 X143.736 Y114.676 E-.09714
G1 X143.454 Y114.638 E-.10806
G1 X143.118 Y114.418 E-.1529
G1 X143.007 Y114.254 E-.07502
G1 X142.924 Y113.952 E-.11898
G1 X142.964 Y113.646 E-.11748
G1 X143.086 Y113.441 E-.09043
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.444 Y118.582 Z2.4 F42000
G1 X103.039 Y149.931 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X103.039 Y149.929 E.00003
G3 X102.991 Y149.575 I1.862 J-.43 E.00581
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.918 J.011 E.04617
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.098 J1.932 E.04616
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.915 J-.007 E.04744
G1 X104.896 Y151.41 E.29357
G3 X103.166 Y150.301 I.005 J-1.911 E.03522
G1 X103.059 Y149.988 E.00538
; WIPE_START
M204 S6000
G1 X103.039 Y149.929 E-.02358
G1 X102.991 Y149.575 E-.13583
G1 X102.991 Y147.994 E-.60059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.375 Z2.4 F42000
G1 X104.089 Y129.074 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00695
G1 X123.266 Y129.011 E.30453
G1 X123.458 Y129.025 E.00312
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.512 Y151.988 E.30339
G3 X102.41 Y149.796 I.092 J-2.192 E.05447
G1 X102.412 Y131.115 E.30334
G3 X104.031 Y129.089 I2.207 J.104 E.04501
M204 S10000
G1 X104.113 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251276
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.00333
; LINE_WIDTH: 0.187791
G1 X104.892 Y129.301 E.00295
G1 X122.983 Y129.301 E.1226
G1 X123.416 Y129.337 E.00295
; LINE_WIDTH: 0.255601
G3 X123.606 Y129.38 I-1.361 J6.459 E.00185
G1 X123.756 Y129.429 E.00151
; LINE_WIDTH: 0.298899
G3 X124.969 Y130.637 I-.699 J1.914 E.01997
; LINE_WIDTH: 0.251492
G3 X125.074 Y131.049 I-1.903 J.701 E.00399
; LINE_WIDTH: 0.188243
G1 X125.099 Y131.417 E.00251
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243912
G3 X125.025 Y150.186 I-1.882 J-.184 E.00288
G1 X124.988 Y150.309 E.00117
; LINE_WIDTH: 0.298139
G3 X123.931 Y151.499 I-1.934 J-.654 E.01843
G1 X123.774 Y151.566 E.00193
; LINE_WIDTH: 0.252044
G3 X123.597 Y151.623 I-1.947 J-5.73 E.00174
G1 X123.348 Y151.674 E.00239
; LINE_WIDTH: 0.188328
G1 X122.983 Y151.699 E.00249
G1 X104.892 Y151.699 E.123
G3 X104.475 Y151.677 I.002 J-4.024 E.00284
; LINE_WIDTH: 0.249045
G3 X104.049 Y151.574 I.302 J-2.173 E.00407
; LINE_WIDTH: 0.299752
G3 X102.864 Y150.448 I.684 J-1.906 E.01907
; LINE_WIDTH: 0.258875
G3 X102.776 Y150.194 I1.815 J-.771 E.00261
G1 X102.734 Y150.003 E.00189
; LINE_WIDTH: 0.188191
G3 X102.71 Y149.79 I3.109 J-.466 E.00146
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.189292
G1 X102.704 Y131.33 E.00108
; LINE_WIDTH: 0.215374
G3 X102.742 Y130.962 I2.201 J.039 E.00293
; LINE_WIDTH: 0.257203
G3 X102.787 Y130.77 I2.48 J.484 E.00189
G1 X102.835 Y130.626 E.00146
; LINE_WIDTH: 0.29928
G3 X103.869 Y129.501 I1.905 J.712 E.01774
G1 X104.026 Y129.434 E.00193
; LINE_WIDTH: 0.251276
G1 X104.055 Y129.427 E.00028
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15777
G1 X104.892 Y129.301 E-.16543
G1 X106.041 Y129.301 E-.4368
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 21/95
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.572 J1.074 P1  F42000
G1 X151.247 Y105.252 Z2.4
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.375 Y106.616 I-.271 J1.372 E.03113
G1 X152.375 Y121.184 E.23654
G3 X150.984 Y122.575 I-1.399 J-.008 E.03543
G1 X136.416 Y122.575 E.23654
G3 X135.025 Y121.184 I.008 J-1.399 E.03543
G1 X135.025 Y106.616 E.23654
G3 X136.416 Y105.225 I1.399 J.008 E.03543
G1 X150.984 Y105.225 E.23654
G3 X151.188 Y105.241 I-.008 J1.399 E.00333
; WIPE_START
M204 S6000
G1 X151.51 Y105.331 E-.12711
G1 X151.752 Y105.461 E-.10447
G1 X151.965 Y105.635 E-.10447
G1 X152.139 Y105.848 E-.10451
G1 X152.269 Y106.09 E-.10445
G1 X152.349 Y106.353 E-.10448
G1 X152.375 Y106.616 E-.10051
G1 X152.375 Y106.643 E-.01
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.888 Y105.158 Z2.5 F42000
G1 X143.76 Y104.934 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.397 Y104.938 E.124
G3 X152.67 Y106.355 I-.166 J1.43 E.03381
G1 X152.67 Y121.469 E.24542
G3 X151.242 Y122.87 I-1.427 J-.026 E.03599
G1 X136.131 Y122.87 E.24538
G3 X134.73 Y121.443 I.038 J-1.439 E.0359
G1 X134.73 Y106.331 E.24539
G3 X136.131 Y104.93 I1.426 J.025 E.03556
G1 X143.7 Y104.934 E.12291
; WIPE_START
M204 S6000
G1 X145.7 Y104.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.196 Y111.715 Z2.5 F42000
G1 X141.93 Y112.229 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.991 Y112.156 E.00154
G3 X143.65 Y111.461 I1.705 J1.742 E.02991
G1 X143.829 Y111.464 E.00291
G3 X141.737 Y112.447 I-.133 J2.434 E.2096
G1 X141.89 Y112.273 E.00377
; WIPE_START
M204 S6000
G1 X141.991 Y112.156 E-.05876
G1 X142.289 Y111.909 E-.14718
G1 X142.454 Y111.802 E-.07455
G1 X142.8 Y111.632 E-.14674
G1 X143.17 Y111.518 E-.14708
G1 X143.65 Y111.461 E-.18339
G1 X143.656 Y111.461 E-.0023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 21 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer21 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.77 Y113.434 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X144.166 Y111.83 E.03684
G1 X143.602 Y111.83
G1 X145.77 Y113.998 E.04978
G1 X145.807 Y114.598
G1 X143.001 Y111.792 E.06444
G1 X142.611 Y111.965
G1 X145.635 Y114.989 E.06944
G1 X145.404 Y115.322
G1 X142.277 Y112.195 E.0718
G1 X141.996 Y112.478
G1 X145.123 Y115.605 E.0718
G1 X144.788 Y115.834
G1 X141.766 Y112.812 E.06939
G1 X141.593 Y113.202
G1 X144.398 Y116.008 E.06443
G1 X143.797 Y115.97
G1 X141.63 Y113.803 E.04978
G1 X141.63 Y114.366
G1 X143.234 Y115.97 E.03684
; WIPE_START
M204 S6000
G1 X141.82 Y114.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.789 Y113.145 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0694856
G1 F15000
M204 S6000
G1 X145.776 Y113.124 E.00005
; LINE_WIDTH: 0.086872
G1 X145.726 Y113.05 E.00024
; LINE_WIDTH: 0.121247
G1 X145.676 Y112.976 E.00036
; LINE_WIDTH: 0.152202
G1 X145.623 Y112.903 E.00048
; LINE_WIDTH: 0.191012
G2 X145.521 Y112.767 I-2.324 J1.644 E.00118
; LINE_WIDTH: 0.23661
G2 X145.356 Y112.572 I-3.354 J2.666 E.00224
; LINE_WIDTH: 0.260308
G2 X144.932 Y112.161 I-3.768 J3.459 E.00575
; LINE_WIDTH: 0.220512
G1 X144.797 Y112.051 E.00142
; LINE_WIDTH: 0.189165
G1 X144.72 Y111.993 E.00066
; LINE_WIDTH: 0.162736
G1 X144.591 Y111.9 E.00092
; LINE_WIDTH: 0.136165
G1 X144.461 Y111.808 E.00074
; WIPE_START
G1 X144.591 Y111.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.94 Y115.991 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.134735
G1 F15000
M204 S6000
G1 X142.743 Y115.853 E.00111
; LINE_WIDTH: 0.165112
G1 X142.67 Y115.799 E.00053
; LINE_WIDTH: 0.201177
G3 X142.537 Y115.697 I1.631 J-2.261 E.00122
; LINE_WIDTH: 0.255766
G3 X141.991 Y115.169 I3.014 J-3.66 E.00726
; LINE_WIDTH: 0.22976
G1 X141.879 Y115.033 E.00149
; LINE_WIDTH: 0.190025
G1 X141.774 Y114.895 E.00119
; LINE_WIDTH: 0.15124
G1 X141.691 Y114.777 E.00077
; LINE_WIDTH: 0.120045
G1 X141.608 Y114.658 E.00058
; OBJECT_ID: 94
; WIPE_START
G1 X141.691 Y114.777 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X136.045 Y119.912 Z2.5 F42000
G1 X103.041 Y149.932 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00586
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.918 J.011 E.04617
G1 X122.976 Y129.591 E.29595
G3 X124.809 Y131.425 I-.099 J1.931 E.04614
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.911 J-.004 E.04745
G1 X104.898 Y151.41 E.29353
G3 X103.056 Y149.99 I.01 J-1.919 E.04057
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15979
G1 X102.991 Y147.995 E-.60021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.376 Z2.5 F42000
G1 X104.089 Y129.071 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00693
G1 X123.265 Y129.011 E.30452
G1 X123.458 Y129.025 E.00313
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.19 J-.088 E.05452
G1 X104.512 Y151.988 E.30339
G3 X102.41 Y149.797 I.092 J-2.192 E.05445
G1 X102.412 Y131.115 E.30336
G3 X104.034 Y129.088 I2.207 J.104 E.04505
M204 S10000
G1 X104.115 Y129.411 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251215
G1 F15000
M204 S6000
G1 X104.457 Y129.325 E.0033
; LINE_WIDTH: 0.187804
M73 P56 R12
G1 X104.892 Y129.301 E.00295
G1 X122.985 Y129.301 E.12262
G3 X123.411 Y129.336 I-.026 J2.963 E.0029
; LINE_WIDTH: 0.255253
G3 X123.607 Y129.38 I-1.095 J5.332 E.00191
G1 X123.756 Y129.429 E.00149
; LINE_WIDTH: 0.299883
G3 X124.936 Y130.554 I-.691 J1.907 E.01903
; LINE_WIDTH: 0.259739
G3 X125.06 Y130.966 I-1.993 J.824 E.00419
G1 X125.062 Y130.979 E.00012
; LINE_WIDTH: 0.188407
G1 X125.099 Y131.417 E.00299
G1 X125.099 Y149.506 E.12304
G1 X125.083 Y149.874 E.00251
; LINE_WIDTH: 0.241547
G3 X125.002 Y150.266 I-2.131 J-.233 E.0036
; LINE_WIDTH: 0.298096
G3 X123.986 Y151.472 I-1.936 J-.601 E.01826
G1 X123.837 Y151.54 E.00184
; LINE_WIDTH: 0.260011
G3 X123.427 Y151.661 I-.749 J-1.786 E.00416
; LINE_WIDTH: 0.188525
G1 X122.983 Y151.699 E.00304
G1 X104.896 Y151.699 E.12312
G3 X104.468 Y151.676 I.025 J-4.516 E.00292
; LINE_WIDTH: 0.250193
G3 X104.048 Y151.574 I.36 J-2.373 E.00403
; LINE_WIDTH: 0.300583
G3 X102.901 Y150.531 I.692 J-1.914 E.01809
G1 X102.896 Y150.519 E.00014
; LINE_WIDTH: 0.263372
G3 X102.738 Y150.023 I1.853 J-.861 E.00514
G1 X102.737 Y150.02 E.00004
; LINE_WIDTH: 0.188223
G3 X102.715 Y149.854 I3.011 J-.489 E.00114
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.202425
G1 X102.728 Y131.042 E.0033
; LINE_WIDTH: 0.252595
G3 X102.787 Y130.77 I1.937 J.274 E.00262
G1 X102.835 Y130.627 E.00143
; LINE_WIDTH: 0.298999
G3 X104.039 Y129.43 I1.896 J.703 E.0198
; LINE_WIDTH: 0.251215
G1 X104.056 Y129.426 E.00017
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.457 Y129.325 E-.15688
G1 X104.892 Y129.301 E-.16552
G1 X106.043 Y129.301 E-.4376
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 22/95
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.5 I.572 J1.074 P1  F42000
G1 X151.259 Y105.23 Z2.5
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.397 Y106.607 I-.273 J1.384 E.0314
G1 X152.397 Y121.193 E.23686
G3 X150.993 Y122.597 I-1.411 J-.008 E.03574
G1 X136.407 Y122.597 E.23686
G3 X135.003 Y121.193 I.008 J-1.411 E.03574
G1 X135.003 Y106.607 E.23686
G3 X136.407 Y105.203 I1.411 J.008 E.03574
G1 X150.993 Y105.203 E.23686
G3 X151.2 Y105.22 I-.008 J1.411 E.00337
; WIPE_START
M204 S6000
G1 X151.524 Y105.31 E-.12803
G1 X151.769 Y105.441 E-.10535
G1 X151.983 Y105.617 E-.1054
G1 X152.159 Y105.831 E-.1054
G1 X152.29 Y106.076 E-.10536
G1 X152.37 Y106.341 E-.10539
G1 X152.397 Y106.607 E-.10142
G1 X152.397 Y106.616 E-.00365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.91 Y105.133 Z2.6 F42000
G1 X143.761 Y104.906 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.416 Y104.91 E.1243
G3 X152.698 Y106.338 I-.168 J1.441 E.03407
G1 X152.698 Y121.488 E.24599
G3 X151.259 Y122.899 I-1.438 J-.027 E.03625
G1 X136.112 Y122.898 E.24596
G3 X134.701 Y121.46 I.04 J-1.45 E.03616
G1 X134.702 Y106.312 E.24597
G3 X136.112 Y104.902 I1.437 J.027 E.03579
G1 X143.701 Y104.906 E.12322
; WIPE_START
M204 S6000
G1 X145.701 Y104.907 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.158 Y112.103 Z2.6 F42000
G1 X142.83 Y113.03 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.621 I2.306 J.896 E.03329
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53541
G1 X141.628 Y112.612 E-.17705
G1 X141.704 Y112.513 E-.04754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.512 Y111.6 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02633
G3 X143.826 Y111.464 I.811 J2.319 E.01544
G3 X144.455 Y111.582 I-.212 J2.862 E.01041
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59445
G1 X143.314 Y111.495 E-.16555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.621 E.02288
G1 X144.601 Y111.632 E.00053
G3 X145.979 Y113.03 I-.938 J2.304 E.03277
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.621 E-.53585
G1 X144.601 Y111.632 E-.01241
G1 X145.032 Y111.856 E-.18447
G1 X145.088 Y111.901 E-.02728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.017 Y113.135 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X146 Y114.711 I-2.312 J.763 E.02606
G1 X146 Y113.096 E.02622
; WIPE_START
M204 S6000
G1 X146.109 Y113.513 E-.16367
G1 X146.138 Y113.999 E-.18519
G1 X146.091 Y114.384 E-.14724
G1 X146 Y114.711 E-.12905
G1 X146 Y114.356 E-.13485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.846 E.00133
G3 X144.57 Y116.179 I-2.268 J-.967 E.03198
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53541
G1 X145.949 Y114.846 E-.03105
G1 X145.717 Y115.272 E-.18421
G1 X145.702 Y115.291 E-.00933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.02638
G3 X142.943 Y116.219 I-.81 J-2.378 E.02589
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.59569
G1 X144.231 Y116.282 E-.11077
G1 X144.091 Y116.298 E-.05354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.422 Y114.77 I.859 J-2.267 E.03331
G1 X142.77 Y114.77 E.02188
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.623 Y116.089 E-.08564
G1 X142.386 Y115.956 E-.10326
G1 X142.309 Y115.902 E-.03572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.416 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.377 J.484 E.00552
G1 X141.4 Y114.711 E.02633
G3 X141.298 Y113.475 I2.287 J-.811 E.02036
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.1517
G1 X141.4 Y114.69 E-.6083
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.854 Z2.6 F42000
G1 X103.04 Y149.931 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.04 Y149.927 E.00006
G3 X102.991 Y149.575 I1.868 J-.436 E.00578
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.425 I-.087 J1.923 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.973 Y151.409 I-1.914 J-.007 E.04744
G1 X104.896 Y151.41 E.29354
G3 X103.137 Y150.23 I.012 J-1.919 E.03643
G1 X103.058 Y149.988 E.00413
; WIPE_START
M204 S6000
G1 X103.04 Y149.927 E-.02409
G1 X102.991 Y149.575 E-.13511
G1 X102.991 Y147.994 E-.60081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.433 Y140.374 Z2.6 F42000
G1 X104.089 Y129.074 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.53 J2.145 E.00696
G1 X123.264 Y129.011 E.3045
G1 X123.458 Y129.025 E.00315
G3 X125.39 Y131.204 I-.259 J2.176 E.05172
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.087 J-2.189 E.05451
G1 X102.412 Y131.114 E.30337
G3 X104.031 Y129.089 I2.207 J.104 E.045
; WIPE_START
M204 S6000
G1 X104.512 Y129.012 E-.18523
G1 X106.025 Y129.012 E-.57478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 22 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer22 end: 83,94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.025 Y129.301 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188015
G1 F15000
M204 S6000
G1 X122.979 Y129.301 E.11505
G1 X123.416 Y129.337 E.00298
; LINE_WIDTH: 0.256468
G3 X123.608 Y129.38 I-1.345 J6.381 E.00188
G1 X123.773 Y129.435 E.00167
; LINE_WIDTH: 0.300004
G3 X124.936 Y130.554 I-.701 J1.892 E.01883
; LINE_WIDTH: 0.259746
G3 X125.06 Y130.965 I-1.99 J.823 E.00418
G1 X125.062 Y130.979 E.00013
; LINE_WIDTH: 0.188507
G1 X125.099 Y131.417 E.00299
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.249926
G3 X124.972 Y150.357 I-2.198 J-.31 E.00409
; LINE_WIDTH: 0.299787
G3 X123.985 Y151.472 I-1.916 J-.701 E.0173
G1 X123.837 Y151.54 E.00184
; LINE_WIDTH: 0.259783
G3 X123.423 Y151.661 I-.752 J-1.794 E.0042
; LINE_WIDTH: 0.188523
G3 X123.081 Y151.696 I-.449 J-2.709 E.00235
G1 X104.892 Y151.699 E.12381
G1 X104.462 Y151.675 E.00293
; LINE_WIDTH: 0.250858
G3 X104.047 Y151.573 I.253 J-1.932 E.004
; LINE_WIDTH: 0.299518
G3 X102.898 Y150.525 I.686 J-1.907 E.01808
G1 X102.86 Y150.437 E.00109
; LINE_WIDTH: 0.258499
G3 X102.734 Y150.001 I2.028 J-.819 E.00439
; LINE_WIDTH: 0.188187
G3 X102.71 Y149.793 I4.833 J-.669 E.00142
G1 X102.701 Y131.489 E.12434
; LINE_WIDTH: 0.197481
G1 X102.716 Y131.135 E.00254
; LINE_WIDTH: 0.242139
G3 X102.8 Y130.727 I2.161 J.232 E.00376
; LINE_WIDTH: 0.299121
G3 X103.875 Y129.499 I1.942 J.615 E.019
; LINE_WIDTH: 0.263747
G3 X104.373 Y129.339 I.896 J1.945 E.00518
; LINE_WIDTH: 0.188015
G3 X104.521 Y129.318 I.585 J3.493 E.00102
G1 X104.892 Y129.301 E.00252
G1 X105.965 Y129.301 E.00728
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.965 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 23/95
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I.592 J1.063 P1  F42000
G1 X151.271 Y105.208 Z2.6
G1 Z2.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.419 Y106.597 I-.276 J1.396 E.03167
G1 X152.419 Y121.203 E.23717
G3 X151.003 Y122.619 I-1.423 J-.008 E.03605
G1 X136.397 Y122.619 E.23717
G3 X134.981 Y121.203 I.008 J-1.423 E.03605
G1 X134.981 Y106.597 E.23717
G3 X136.397 Y105.181 I1.423 J.008 E.03605
G1 X151.003 Y105.181 E.23717
G3 X151.212 Y105.198 I-.008 J1.423 E.00341
; WIPE_START
M204 S6000
G1 X151.539 Y105.289 E-.12892
G1 X151.785 Y105.421 E-.10628
G1 X152.002 Y105.598 E-.10629
G1 X152.179 Y105.815 E-.10632
G1 X152.311 Y106.061 E-.10627
G1 X152.392 Y106.329 E-.1063
G1 X152.418 Y106.59 E-.09962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.93 Y105.109 Z2.7 F42000
G1 X143.761 Y104.878 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.434 Y104.882 E.1246
G3 X152.727 Y106.321 I-.169 J1.452 E.03433
G1 X152.726 Y121.506 E.24657
G3 X151.276 Y122.927 I-1.45 J-.029 E.03651
G1 X136.094 Y122.926 E.24653
G3 X134.673 Y121.477 I.042 J-1.462 E.03642
G1 X134.674 Y106.294 E.24654
G3 X136.094 Y104.874 I1.449 J.029 E.03603
G1 X143.701 Y104.878 E.12352
; WIPE_START
M204 S6000
G1 X145.701 Y104.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.165 Y112.078 Z2.7 F42000
G1 X142.83 Y113.03 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.423 Y113.03 E.02285
G3 X142.83 Y111.621 I2.276 J.866 E.03332
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.423 Y113.03 E-.53532
G1 X141.532 Y112.781 E-.10328
G1 X141.682 Y112.529 E-.11159
G1 X141.698 Y112.509 E-.00981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.512 Y111.6 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.889 Y111.599 E.02635
G3 X143.824 Y111.464 I.88 J2.784 E.0154
G3 X144.455 Y111.582 I-.208 J2.854 E.01045
; WIPE_START
M204 S6000
G1 X142.889 Y111.599 E-.59495
G1 X143.311 Y111.496 E-.16505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.621 E.02288
G1 X144.601 Y111.632 E.00053
G3 X145.979 Y113.03 I-.916 J2.281 E.03278
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.621 E-.53584
G1 X144.601 Y111.632 E-.01246
G1 X144.844 Y111.745 E-.10196
G1 X145.09 Y111.897 E-.10974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.046 Y113.23 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X146 Y114.71 I-2.337 J.668 E.02444
G1 X146 Y113.09 E.0263
G1 X146.027 Y113.173 E.00141
; WIPE_START
M204 S6000
G1 X146.125 Y113.631 E-.17827
G1 X146.138 Y113.999 E-.13976
G1 X146.091 Y114.384 E-.14727
G1 X146 Y114.71 E-.12869
G1 X146 Y114.273 E-.16601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.909 Y114.936 E.00292
G3 X144.57 Y116.179 I-2.244 J-1.074 E.03039
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.909 Y114.936 E-.06826
G1 X145.699 Y115.288 E-.1559
; WIPE_END
M73 P57 R12
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.336 E.02588
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59511
G1 X144.133 Y116.301 E-.14796
G1 X144.088 Y116.306 E-.01693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.422 Y114.77 I.892 J-2.3 E.03328
G1 X142.77 Y114.77 E.02188
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53546
G1 X142.624 Y116.09 E-.08523
G1 X142.371 Y115.947 E-.11023
G1 X142.312 Y115.899 E-.02908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.312 Y113.417 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.09 I2.434 J.484 E.0055
G1 X141.4 Y114.711 E.02631
G3 X141.301 Y113.476 I2.345 J-.81 E.02034
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.09 E-.15123
G1 X141.4 Y114.692 E-.60877
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.856 Z2.7 F42000
G1 X103.04 Y149.931 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.04 Y149.926 E.00008
G3 X102.991 Y149.575 I1.873 J-.44 E.00577
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.915 J.009 E.04622
G1 X122.973 Y129.591 E.29586
G3 X124.809 Y131.425 I-.097 J1.933 E.04618
G1 X124.81 Y149.505 E.29358
G3 X122.975 Y151.409 I-1.924 J-.018 E.04734
G1 X104.896 Y151.41 E.29357
G3 X103.139 Y150.23 I.017 J-1.924 E.0364
G1 X103.059 Y149.988 E.00413
; WIPE_START
M204 S6000
G1 X103.04 Y149.926 E-.02438
G1 X102.991 Y149.575 E-.13487
G1 X102.991 Y147.994 E-.60075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.374 Z2.7 F42000
G1 X104.09 Y129.071 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00693
G1 X123.263 Y129.011 E.30448
G1 X123.458 Y129.025 E.00317
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.797 I.09 J-2.192 E.05449
G1 X102.412 Y131.114 E.30337
G3 X104.034 Y129.088 I2.207 J.104 E.04505
; WIPE_START
M204 S6000
G1 X104.512 Y129.012 E-.18402
G1 X106.028 Y129.012 E-.57599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 23 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer23 end: 83,94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.028 Y129.308 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187818
G1 F15000
M204 S6000
G1 X122.979 Y129.301 E.11489
G1 X123.415 Y129.337 E.00296
; LINE_WIDTH: 0.253496
G3 X123.732 Y129.42 I-.327 J1.891 E.0031
; LINE_WIDTH: 0.300343
G3 X124.901 Y130.474 I-.669 J1.918 E.01838
; LINE_WIDTH: 0.263482
G3 X125.06 Y130.965 I-1.881 J.878 E.00509
G1 X125.062 Y130.979 E.00014
; LINE_WIDTH: 0.188225
G1 X125.099 Y131.417 E.00299
G1 X125.099 Y149.513 E.12296
; LINE_WIDTH: 0.206747
G3 X125.077 Y149.92 I-4.574 J-.041 E.00307
G1 X125.063 Y150.02 E.00077
; LINE_WIDTH: 0.25621
G3 X124.966 Y150.374 I-2.012 J-.361 E.00351
; LINE_WIDTH: 0.301085
G3 X123.926 Y151.502 I-1.913 J-.72 E.01792
G1 X123.916 Y151.506 E.00012
; LINE_WIDTH: 0.263324
G3 X123.595 Y151.623 I-.877 J-1.907 E.00338
G1 X123.427 Y151.661 E.00169
; LINE_WIDTH: 0.188533
G3 X123.195 Y151.69 I-.395 J-2.204 E.0016
G1 X104.892 Y151.699 E.12459
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.249822
G3 X104.05 Y151.574 I.276 J-2.035 E.00398
; LINE_WIDTH: 0.299715
G3 X102.899 Y150.525 I.689 J-1.913 E.01812
G1 X102.86 Y150.437 E.0011
; LINE_WIDTH: 0.258289
G3 X102.734 Y150 I2.009 J-.813 E.00439
; LINE_WIDTH: 0.188186
G3 X102.71 Y149.793 I4.8 J-.664 E.00142
G1 X102.701 Y131.489 E.12434
; LINE_WIDTH: 0.196317
G1 X102.714 Y131.153 E.00239
; LINE_WIDTH: 0.240181
G3 X102.798 Y130.732 I2.075 J.195 E.00383
; LINE_WIDTH: 0.297461
G3 X104.021 Y129.437 I1.935 J.601 E.02075
; LINE_WIDTH: 0.252093
G3 X104.457 Y129.325 I.804 J2.237 E.00423
; LINE_WIDTH: 0.187818
G3 X104.633 Y129.309 I.342 J2.75 E.0012
G1 X105.968 Y129.308 E.00905
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.968 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 24/95
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.7 I.592 J1.063 P1  F42000
G1 X151.283 Y105.187 Z2.7
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.44 Y106.587 I-.278 J1.408 E.03194
G1 X152.44 Y121.213 E.23749
G3 X151.013 Y122.64 I-1.436 J-.008 E.03636
G1 X136.387 Y122.64 E.23749
G3 X134.959 Y121.213 I.008 J-1.436 E.03636
G1 X134.959 Y106.587 E.23749
G3 X136.387 Y105.16 I1.436 J.008 E.03636
G1 X151.013 Y105.16 E.23749
G3 X151.224 Y105.176 I-.008 J1.436 E.00344
; WIPE_START
M204 S6000
G1 X151.553 Y105.268 E-.12983
G1 X151.802 Y105.401 E-.10718
G1 X152.02 Y105.58 E-.10722
G1 X152.199 Y105.798 E-.10721
G1 X152.332 Y106.047 E-.10719
G1 X152.414 Y106.317 E-.1072
G1 X152.438 Y106.563 E-.09417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.95 Y105.084 Z2.8 F42000
G1 X143.761 Y104.849 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.453 Y104.853 E.1249
G3 X152.755 Y106.305 I-.171 J1.463 E.03459
G1 X152.754 Y121.524 E.24714
G3 X151.293 Y122.955 I-1.461 J-.031 E.03678
G1 X136.076 Y122.954 E.24711
G3 X134.645 Y121.494 I.043 J-1.473 E.03669
G1 X134.646 Y106.276 E.24711
G3 X136.076 Y104.846 I1.461 J.03 E.03627
G1 X143.701 Y104.849 E.12383
; WIPE_START
M204 S6000
G1 X145.701 Y104.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.173 Y112.052 Z2.8 F42000
G1 X142.83 Y113.03 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.283 J.873 E.03333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53584
G1 X141.532 Y112.781 E-.1036
G1 X141.682 Y112.529 E-.11154
G1 X141.697 Y112.51 E-.00902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.821 Y111.463 I.879 J2.788 E.01533
G3 X144.456 Y111.582 I-.208 J2.881 E.01051
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59498
G1 X143.313 Y111.496 E-.16502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-.993 J2.23 E.0312
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04957
G1 X145.092 Y111.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.046 Y113.231 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X146 Y114.712 I-2.345 J.668 E.02445
G1 X146 Y113.09 E.02633
G1 X146.028 Y113.174 E.00143
; WIPE_START
M204 S6000
G1 X146.125 Y113.634 E-.17873
G1 X146.138 Y113.999 E-.13883
G1 X146.091 Y114.384 E-.14725
G1 X146 Y114.712 E-.12942
G1 X146 Y114.276 E-.16577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.909 Y114.935 E.00291
G3 X144.57 Y116.178 I-2.204 J-1.033 E.03041
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.909 Y114.935 E-.06817
G1 X145.699 Y115.288 E-.156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.268 Y116.297 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X142.886 Y116.2 I.433 J-2.493 E.00639
G1 X144.508 Y116.202 E.02632
G3 X143.327 Y116.307 I-.807 J-2.398 E.01943
; WIPE_START
M204 S6000
G1 X142.886 Y116.2 E-.17215
G1 X144.433 Y116.202 E-.58785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.867 J-2.277 E.03332
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.625 Y116.09 E-.08486
G1 X142.371 Y115.947 E-.11056
G1 X142.311 Y115.899 E-.0292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.33 Y113.325 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.39 J.575 E.00402
G1 X141.4 Y114.712 E.02636
G3 X141.317 Y113.384 I2.32 J-.812 E.02188
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.11674
G1 X141.4 Y114.712 E-.61694
G1 X141.381 Y114.645 E-.02633
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.765 Y119.814 Z2.8 F42000
G1 X103.041 Y149.932 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00589
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.976 Y129.591 E.29594
G3 X124.809 Y131.427 I-.079 J1.912 E.04628
G1 X124.81 Y149.504 E.29354
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.898 Y151.41 E.29354
G3 X103.055 Y149.991 I.007 J-1.915 E.04059
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16054
G1 X102.991 Y147.995 E-.59947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z2.8 F42000
G1 X104.09 Y129.071 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00692
G1 X123.262 Y129.011 E.30447
G1 X123.458 Y129.025 E.00318
G3 X125.39 Y131.204 I-.263 J2.179 E.0517
G1 X125.388 Y149.888 E.30339
G3 X123.198 Y151.99 I-2.193 J-.093 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.797 I.09 J-2.192 E.05449
G1 X102.412 Y131.115 E.30336
G3 X104.034 Y129.088 I2.207 J.104 E.04506
; WIPE_START
M204 S6000
G1 X104.512 Y129.012 E-.18401
G1 X106.028 Y129.012 E-.57599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 24 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer24 end: 83,94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.028 Y129.301 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187714
G1 F15000
M204 S6000
G1 X122.984 Y129.301 E.11486
G1 X123.251 Y129.316 E.00181
; LINE_WIDTH: 0.241088
G1 X123.422 Y129.338 E.00154
G1 X123.676 Y129.401 E.00235
; LINE_WIDTH: 0.298778
G3 X124.86 Y130.391 I-.613 J1.936 E.01789
G1 X124.905 Y130.48 E.00112
; LINE_WIDTH: 0.263498
G3 X125.059 Y130.963 I-1.93 J.885 E.00502
G1 X125.062 Y130.977 E.00013
; LINE_WIDTH: 0.188421
G3 X125.096 Y131.32 I-2.859 J.461 E.00235
G1 X125.099 Y149.508 E.12373
G1 X125.083 Y149.879 E.00252
; LINE_WIDTH: 0.242712
G1 X124.997 Y150.283 E.00372
; LINE_WIDTH: 0.297385
G3 X124.008 Y151.46 I-1.947 J-.631 E.01772
G1 X123.774 Y151.566 E.00289
; LINE_WIDTH: 0.251144
G3 X123.336 Y151.675 I-.699 J-1.866 E.00423
; LINE_WIDTH: 0.188502
G3 X123.195 Y151.69 I-.3 J-2.208 E.00096
G1 X104.896 Y151.699 E.12454
G3 X104.385 Y151.663 I-.03 J-3.235 E.00349
; LINE_WIDTH: 0.255627
G1 X104.026 Y151.565 E.00355
; LINE_WIDTH: 0.299162
G3 X102.832 Y150.369 I.723 J-1.916 E.01972
; LINE_WIDTH: 0.255662
G3 X102.738 Y150.023 I2.412 J-.843 E.00342
G1 X102.737 Y150.019 E.00004
; LINE_WIDTH: 0.188222
G3 X102.715 Y149.85 I3.104 J-.501 E.00116
G1 X102.701 Y149.579 E.00184
G1 X102.701 Y131.489 E.12292
; LINE_WIDTH: 0.196472
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240512
G3 X102.787 Y130.77 I2.204 J.222 E.00346
G1 X102.8 Y130.727 E.0004
; LINE_WIDTH: 0.29909
G3 X103.874 Y129.499 I1.942 J.615 E.01899
; LINE_WIDTH: 0.263534
G3 X104.377 Y129.339 I.897 J1.948 E.00521
; LINE_WIDTH: 0.187714
G3 X104.521 Y129.318 I.421 J2.392 E.00099
G1 X104.892 Y129.301 E.00251
G1 X105.968 Y129.301 E.00729
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.968 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 25/95
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I.592 J1.063 P1  F42000
G1 X151.295 Y105.165 Z2.8
G1 Z2.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.462 Y106.577 I-.28 J1.42 E.03222
G1 X152.462 Y121.223 E.23781
G3 X151.023 Y122.662 I-1.448 J-.008 E.03667
G1 X136.377 Y122.662 E.23781
G3 X134.938 Y121.223 I.008 J-1.448 E.03667
G1 X134.938 Y106.577 E.23781
G3 X136.377 Y105.138 I1.448 J.008 E.03667
G1 X151.023 Y105.138 E.23781
G3 X151.236 Y105.155 I-.008 J1.448 E.00348
; WIPE_START
M204 S6000
G1 X151.568 Y105.247 E-.13074
G1 X151.818 Y105.381 E-.10809
G1 X152.038 Y105.562 E-.10814
G1 X152.219 Y105.782 E-.1081
G1 X152.353 Y106.032 E-.1081
G1 X152.436 Y106.305 E-.10812
G1 X152.458 Y106.537 E-.08872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.97 Y105.06 Z2.9 F42000
G1 X143.762 Y104.821 Z2.9
G1 Z2.5
G1 E.8 F1800
M73 P58 R12
G1 F3600
M204 S5000
G1 X151.472 Y104.825 E.1252
G3 X152.783 Y106.287 I-.173 J1.474 E.03485
G1 X152.783 Y121.543 E.24772
G3 X151.31 Y122.983 I-1.472 J-.032 E.03704
G1 X136.057 Y122.983 E.24768
G3 X134.617 Y121.511 I.033 J-1.473 E.03703
G1 X134.617 Y106.257 E.24769
G3 X136.057 Y104.817 I1.472 J.032 E.03651
G1 X143.702 Y104.821 E.12414
; WIPE_START
M204 S6000
G1 X145.702 Y104.822 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.181 Y112.026 Z2.9 F42000
G1 X142.83 Y113.03 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.621 I2.307 J.897 E.03329
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53544
G1 X141.532 Y112.781 E-.10343
G1 X141.682 Y112.529 E-.11153
G1 X141.698 Y112.509 E-.0096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.819 Y111.463 I.879 J2.791 E.01529
G3 X144.456 Y111.583 I-.32 J3.464 E.01055
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59482
G1 X143.313 Y111.495 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.015 J2.25 E.03118
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04963
G1 X145.092 Y111.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.038 Y113.204 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X146 Y114.711 I-2.378 J.694 E.02488
G1 X146 Y113.09 E.02633
G1 X146.019 Y113.147 E.00098
; WIPE_START
M204 S6000
G1 X146.125 Y113.636 E-.19035
G1 X146.138 Y113.999 E-.13786
G1 X146.091 Y114.384 E-.14728
G1 X146 Y114.711 E-.12916
G1 X146 Y114.302 E-.15536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.847 E.00133
G3 X144.57 Y116.179 I-2.28 J-.979 E.03197
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53544
G1 X145.949 Y114.847 E-.03111
G1 X145.82 Y115.108 E-.11065
G1 X145.701 Y115.29 E-.08281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.078 Y116.258 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X142.886 Y116.2 I.622 J-2.393 E.00326
G1 X144.509 Y116.202 E.02635
G3 X143.137 Y116.273 I-.809 J-2.336 E.02261
; WIPE_START
M204 S6000
G1 X142.886 Y116.2 E-.09911
G1 X144.509 Y116.202 E-.61671
G1 X144.397 Y116.234 E-.04419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.891 J-2.3 E.03329
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53548
G1 X142.623 Y116.089 E-.08572
G1 X142.37 Y115.946 E-.1103
G1 X142.312 Y115.899 E-.0285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.416 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.385 J.485 E.00552
G1 X141.4 Y114.713 E.02637
G3 X141.298 Y113.475 I2.294 J-.812 E.0204
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.1518
G1 X141.4 Y114.689 E-.60821
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.853 Z2.9 F42000
G1 X103.043 Y149.926 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.027 Y149.873 E.00091
G3 X102.991 Y149.575 I1.876 J-.376 E.00487
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.919 J.012 E.04738
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.089 J1.924 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.136 Y150.232 I.007 J-1.913 E.03644
G1 X103.06 Y149.984 E.00421
; WIPE_START
M204 S6000
G1 X103.027 Y149.873 E-.04403
G1 X102.991 Y149.575 E-.11394
G1 X102.991 Y147.991 E-.60203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.371 Z2.9 F42000
G1 X104.09 Y129.071 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00692
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05309
G1 X125.388 Y149.888 E.30339
G3 X123.198 Y151.99 I-2.198 J-.098 E.0544
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.795 I.096 J-2.198 E.05448
G1 X102.412 Y131.112 E.30338
G3 X104.032 Y129.085 I2.189 J.089 E.04509
; WIPE_START
M204 S6000
G1 X104.512 Y129.012 E-.18461
G1 X106.026 Y129.012 E-.57539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 25 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer25 end: 83,94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.026 Y129.308 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188328
G1 F15000
M204 S6000
G1 X122.979 Y129.301 E.11526
G1 X123.35 Y129.327 E.00252
; LINE_WIDTH: 0.248984
G3 X123.61 Y129.381 I-.224 J1.708 E.00247
G1 X123.709 Y129.413 E.00097
; LINE_WIDTH: 0.297916
G3 X124.969 Y130.638 I-.648 J1.927 E.02047
; LINE_WIDTH: 0.251437
G3 X125.074 Y131.05 I-1.902 J.701 E.00399
; LINE_WIDTH: 0.188353
G1 X125.099 Y131.417 E.0025
M73 P58 R11
G1 X125.099 Y149.508 E.12302
G1 X125.075 Y149.936 E.00292
; LINE_WIDTH: 0.250513
G3 X124.975 Y150.348 I-1.998 J-.268 E.00396
; LINE_WIDTH: 0.298628
G3 X123.931 Y151.499 I-1.919 J-.692 E.018
G1 X123.763 Y151.57 E.00206
; LINE_WIDTH: 0.250228
G3 X123.595 Y151.623 I-.95 J-2.683 E.00164
G1 X123.331 Y151.676 E.00251
; LINE_WIDTH: 0.188321
G3 X123.195 Y151.69 I-.295 J-2.201 E.00093
G1 X104.892 Y151.699 E.12444
G1 X104.462 Y151.675 E.00293
; LINE_WIDTH: 0.248511
G3 X104.24 Y151.632 I.513 J-3.278 E.00209
G1 X104.091 Y151.588 E.00145
; LINE_WIDTH: 0.297994
G3 X102.834 Y150.374 I.645 J-1.924 E.02035
; LINE_WIDTH: 0.253331
G3 X102.755 Y150.108 I2.335 J-.84 E.00262
G1 X102.73 Y149.97 E.00133
; LINE_WIDTH: 0.188093
G1 X102.701 Y149.583 E.00263
G1 X102.701 Y131.489 E.12285
; LINE_WIDTH: 0.197978
G1 X102.717 Y131.122 E.00264
; LINE_WIDTH: 0.242888
G3 X102.787 Y130.77 I2.124 J.236 E.00324
G1 X102.804 Y130.716 E.00051
; LINE_WIDTH: 0.297662
G3 X104.022 Y129.437 I1.935 J.622 E.02056
; LINE_WIDTH: 0.25208
G3 X104.457 Y129.325 I.804 J2.237 E.00423
; LINE_WIDTH: 0.188328
G3 X104.637 Y129.309 I.348 J2.798 E.00123
G1 X105.966 Y129.308 E.00904
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.966 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 26/95
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.9 I.593 J1.063 P1  F42000
G1 X151.307 Y105.143 Z2.9
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.484 Y106.568 I-.283 J1.432 E.03249
G1 X152.484 Y121.232 E.23812
G3 X151.032 Y122.684 I-1.46 J-.008 E.03698
G1 X136.368 Y122.684 E.23812
G3 X134.916 Y121.232 I.008 J-1.46 E.03698
G1 X134.916 Y106.568 E.23812
G3 X136.368 Y105.116 I1.46 J.008 E.03698
G1 X151.032 Y105.116 E.23812
G3 X151.248 Y105.133 I-.008 J1.46 E.00352
; WIPE_START
M204 S6000
G1 X151.582 Y105.226 E-.13165
G1 X151.835 Y105.361 E-.10899
G1 X152.057 Y105.543 E-.10903
G1 X152.239 Y105.765 E-.10902
G1 X152.374 Y106.018 E-.10903
G1 X152.457 Y106.293 E-.10902
G1 X152.479 Y106.511 E-.08327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.99 Y105.035 Z3 F42000
G1 X143.762 Y104.793 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.491 Y104.797 E.1255
G3 X152.812 Y106.271 I-.175 J1.485 E.03511
G1 X152.811 Y121.562 E.24829
G3 X151.327 Y123.012 I-1.484 J-.034 E.0373
G1 X136.038 Y123.011 E.24826
G3 X134.588 Y121.528 I.047 J-1.496 E.03721
G1 X134.589 Y106.238 E.24827
G3 X136.038 Y104.789 I1.483 J.034 E.03675
G1 X143.702 Y104.793 E.12444
; WIPE_START
M204 S6000
G1 X145.702 Y104.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.189 Y112.001 Z3 F42000
G1 X142.83 Y113.03 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.622 I2.3 J.892 E.03328
G1 X142.83 Y112.97 E.02189
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53545
G1 X141.628 Y112.612 E-.17715
G1 X141.704 Y112.513 E-.0474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.89 Y111.598 E.02636
G3 X143.816 Y111.463 I.856 J2.624 E.01526
G3 X144.456 Y111.583 I-.276 J3.257 E.01059
; WIPE_START
M204 S6000
G1 X142.89 Y111.598 E-.59498
G1 X143.312 Y111.496 E-.16502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.015 J2.251 E.03119
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04954
G1 X145.092 Y111.898 E-.17508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.017 Y113.135 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X146 Y114.711 I-2.314 J.763 E.02607
G1 X146 Y113.096 E.02623
; WIPE_START
M204 S6000
G1 X146.109 Y113.513 E-.16367
G1 X146.138 Y113.999 E-.18514
G1 X146.091 Y114.384 E-.14724
G1 X146 Y114.711 E-.12925
G1 X146 Y114.357 E-.1347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.846 E.00133
G3 X144.57 Y116.178 I-2.279 J-.981 E.03196
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53545
G1 X145.949 Y114.846 E-.03105
G1 X145.806 Y115.131 E-.12108
G1 X145.701 Y115.291 E-.07243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.268 Y116.298 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X142.886 Y116.2 I.432 J-2.474 E.00641
G1 X144.507 Y116.202 E.02633
G3 X143.327 Y116.308 I-.807 J-2.379 E.01942
; WIPE_START
M204 S6000
G1 X142.886 Y116.2 E-.17252
G1 X144.432 Y116.202 E-.58748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.866 J-2.276 E.03332
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53548
G1 X142.624 Y116.09 E-.0853
G1 X142.345 Y115.929 E-.1221
G1 X142.31 Y115.901 E-.01711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.31 Y113.417 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.401 J.483 E.00553
G1 X141.4 Y114.71 E.02632
G3 X141.299 Y113.475 I2.311 J-.811 E.02033
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.15188
G1 X141.4 Y114.689 E-.60812
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.853 Z3 F42000
G1 X103.04 Y149.931 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.039 Y149.924 E.00011
G3 X102.991 Y149.575 I1.869 J-.433 E.00573
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.917 J.011 E.04739
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.1 J1.933 E.04614
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.917 J-.009 E.04742
G1 X104.898 Y151.41 E.29354
G3 X103.137 Y150.23 I.01 J-1.919 E.03646
G1 X103.058 Y149.988 E.00414
; WIPE_START
M204 S6000
G1 X103.039 Y149.924 E-.02522
G1 X102.991 Y149.575 E-.13394
G1 X102.991 Y147.994 E-.60084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.374 Z3 F42000
G1 X104.09 Y129.07 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00692
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05309
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.192 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.096 J-2.198 E.05443
G1 X102.412 Y131.112 E.30342
G3 X104.032 Y129.085 I2.189 J.089 E.04509
; WIPE_START
M204 S6000
G1 X104.512 Y129.012 E-.18456
G1 X106.027 Y129.012 E-.57545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 26 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer26 end: 83,94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.027 Y129.308 F42000
M73 P59 R11
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188337
G1 F15000
M204 S6000
G1 X122.983 Y129.301 E.11529
G1 X123.35 Y129.327 E.0025
; LINE_WIDTH: 0.249822
G3 X123.729 Y129.419 I-.351 J2.272 E.00364
; LINE_WIDTH: 0.298757
G3 X124.965 Y130.623 I-.685 J1.939 E.02012
; LINE_WIDTH: 0.254819
G3 X125.066 Y131.002 I-1.949 J.723 E.00373
; LINE_WIDTH: 0.188171
G3 X125.09 Y131.21 I-2.191 J.362 E.00142
G1 X125.098 Y149.589 E.12483
; LINE_WIDTH: 0.209487
G3 X125.077 Y149.925 I-3.31 J-.045 E.00258
G1 X125.062 Y150.02 E.00074
; LINE_WIDTH: 0.256244
G3 X124.966 Y150.374 I-2.004 J-.359 E.00351
; LINE_WIDTH: 0.300842
G3 X123.899 Y151.513 I-1.909 J-.717 E.01823
; LINE_WIDTH: 0.261291
G3 X123.597 Y151.623 I-.815 J-1.779 E.00314
G1 X123.401 Y151.665 E.00196
; LINE_WIDTH: 0.188451
G3 X123.195 Y151.69 I-.38 J-2.308 E.00142
G1 X104.896 Y151.699 E.1245
G3 X104.475 Y151.677 I.019 J-4.285 E.00287
; LINE_WIDTH: 0.249399
G3 X104.047 Y151.573 I.303 J-2.19 E.0041
; LINE_WIDTH: 0.298515
G3 X103.129 Y150.903 I.692 J-1.913 E.013
G1 X102.962 Y150.651 E.00341
G1 X102.832 Y150.369 E.00351
; LINE_WIDTH: 0.254693
G3 X102.734 Y149.998 I2.294 J-.807 E.00365
; LINE_WIDTH: 0.188178
G3 X102.71 Y149.795 I5.176 J-.706 E.00139
G1 X102.701 Y131.489 E.12435
; LINE_WIDTH: 0.202441
G3 X102.728 Y131.043 I3.6 J-.003 E.00329
; LINE_WIDTH: 0.252568
G3 X102.787 Y130.77 I2.085 J.305 E.00263
G1 X102.835 Y130.627 E.00143
; LINE_WIDTH: 0.299342
G3 X104.021 Y129.437 I1.894 J.702 E.01962
; LINE_WIDTH: 0.252208
G3 X104.286 Y129.357 I.945 J2.654 E.0026
G1 X104.457 Y129.325 E.00164
; LINE_WIDTH: 0.188337
G3 X104.637 Y129.309 I.348 J2.815 E.00123
G1 X105.967 Y129.308 E.00904
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.967 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 27/95
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3 I.593 J1.063 P1  F42000
G1 X151.319 Y105.122 Z3
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.506 Y106.558 I-.285 J1.444 E.03276
G1 X152.506 Y121.242 E.23844
G3 X151.042 Y122.706 I-1.472 J-.008 E.03729
G1 X136.358 Y122.706 E.23844
G3 X134.894 Y121.242 I.008 J-1.472 E.03729
G1 X134.894 Y106.558 E.23844
G3 X136.358 Y105.094 I1.472 J.008 E.03729
G1 X151.042 Y105.094 E.23844
G3 X151.26 Y105.111 I-.008 J1.472 E.00356
; WIPE_START
M204 S6000
G1 X151.596 Y105.205 E-.13255
G1 X151.851 Y105.341 E-.10991
G1 X152.075 Y105.525 E-.10994
G1 X152.259 Y105.749 E-.10994
G1 X152.395 Y106.004 E-.10991
G1 X152.479 Y106.28 E-.10993
G1 X152.499 Y106.484 E-.07782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.01 Y105.01 Z3.1 F42000
G1 X143.763 Y104.765 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.51 Y104.769 E.1258
G3 X152.84 Y106.254 I-.177 J1.497 E.03537
G1 X152.839 Y121.58 E.24886
G3 X151.344 Y123.04 I-1.495 J-.035 E.03757
G1 X136.02 Y123.039 E.24883
G3 X134.56 Y121.545 I.048 J-1.508 E.03748
G1 X134.561 Y106.22 E.24884
G3 X136.02 Y104.761 I1.494 J.035 E.037
G1 X143.703 Y104.765 E.12475
; WIPE_START
M204 S6000
G1 X145.703 Y104.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 27 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer27 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X152.095 Y105.24 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0761021
G1 F15000
M204 S6000
G3 X152.182 Y105.311 I-.725 J.976 E.00025
M204 S10000
G1 X152.272 Y105.398 F42000
; LINE_WIDTH: 0.0759673
G1 F15000
M204 S6000
G3 X152.353 Y105.495 I-1.059 J.961 E.00028
; WIPE_START
G1 X152.272 Y105.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.318 Y113.03 Z3.1 F42000
G1 X152.374 Y122.279 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0758056
G1 F15000
M204 S6000
G3 X152.265 Y122.41 I-1.731 J-1.324 E.00038
M204 S10000
G1 X152.21 Y122.465 F42000
; LINE_WIDTH: 0.0758073
G1 F15000
M204 S6000
G3 X152.079 Y122.574 I-1.452 J-1.618 E.00038
; WIPE_START
G1 X152.21 Y122.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.578 Y122.509 Z3.1 F42000
G1 X135.309 Y122.563 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0759419
G1 F15000
M204 S6000
G3 X135.213 Y122.485 I.746 J-1.02 E.00027
M204 S10000
G1 X135.125 Y122.399 F42000
; LINE_WIDTH: 0.075935
G1 F15000
M204 S6000
G3 X135.047 Y122.305 I.908 J-.836 E.00027
; WIPE_START
G1 X135.125 Y122.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.08 Y114.767 Z3.1 F42000
G1 X135.026 Y105.521 Z3.1
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.0758056
G1 F15000
M204 S6000
G3 X135.135 Y105.39 I1.731 J1.324 E.00038
M204 S10000
G1 X135.19 Y105.335 F42000
; LINE_WIDTH: 0.0758073
G1 F15000
M204 S6000
G3 X135.321 Y105.226 I1.452 J1.618 E.00038
; WIPE_START
G1 X135.19 Y105.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.567 Y110.751 Z3.1 F42000
G1 X142.83 Y113.03 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.278 J.869 E.03333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.628 Y112.612 E-.17733
G1 X141.699 Y112.511 E-.04683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.813 Y111.463 I.88 J2.794 E.0152
G3 X144.456 Y111.583 I-.31 J3.446 E.01063
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59478
G1 X143.313 Y111.495 E-.16522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.006 J2.243 E.03119
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04956
G1 X145.092 Y111.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.231 E.0024
G3 X146 Y114.71 I-2.337 J.667 E.02442
G1 X146 Y113.15 E.02532
; WIPE_START
M204 S6000
G1 X146.046 Y113.231 E-.03527
G1 X146.122 Y113.608 E-.1461
G1 X146.138 Y113.999 E-.14888
G1 X146.091 Y114.384 E-.14729
G1 X146 Y114.71 E-.12862
G1 X146 Y114.305 E-.15383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.977 Y114.77 E.02285
G1 X145.949 Y114.847 E.00133
G3 X144.57 Y116.179 I-2.271 J-.971 E.03197
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.977 Y114.77 E-.53532
G1 X145.949 Y114.847 E-.03123
G1 X145.718 Y115.272 E-.18382
G1 X145.701 Y115.291 E-.00963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.336 E.02588
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59513
G1 X144.133 Y116.301 E-.14796
G1 X144.088 Y116.306 E-.01691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.423 Y114.77 I.922 J-2.329 E.03324
G1 X142.77 Y114.77 E.02188
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.5355
G1 X142.624 Y116.09 E-.08524
G1 X142.343 Y115.927 E-.12314
G1 X142.31 Y115.901 E-.01612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.331 Y113.326 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.425 J.574 E.00401
G1 X141.4 Y114.71 E.02633
G3 X141.318 Y113.384 I2.356 J-.811 E.02183
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.11656
G1 X141.4 Y114.71 E-.61608
G1 X141.381 Y114.64 E-.02736
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.765 Y119.81 Z3.1 F42000
G1 X103.041 Y149.933 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00589
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.917 J.011 E.04618
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.427 I-.076 J1.91 E.04631
G1 X124.81 Y149.502 E.2935
G3 X122.975 Y151.409 I-1.934 J-.025 E.04732
G1 X104.896 Y151.41 E.29356
G3 X103.055 Y149.991 I.008 J-1.914 E.04057
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16057
G1 X102.991 Y147.996 E-.59943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z3.1 F42000
G1 X104.09 Y129.07 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00695
G1 X123.373 Y129.017 E.30622
G3 X125.39 Y131.204 I-.183 J2.193 E.05306
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.198 J-.096 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.09 J-2.193 E.0545
G1 X102.412 Y131.113 E.30337
G3 X104.033 Y129.086 I2.194 J.093 E.04508
M204 S10000
G1 X104.111 Y129.41 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.250062
G1 F15000
M204 S6000
G1 X104.459 Y129.326 E.00333
; LINE_WIDTH: 0.187717
G1 X104.892 Y129.301 E.00294
G1 X122.983 Y129.301 E.12255
G1 X123.35 Y129.327 E.00249
; LINE_WIDTH: 0.24979
G3 X123.728 Y129.419 I-.352 J2.272 E.00363
; LINE_WIDTH: 0.299999
G3 X124.899 Y130.47 I-.663 J1.917 E.01834
G1 X124.905 Y130.481 E.00014
; LINE_WIDTH: 0.263468
G3 X125.059 Y130.961 I-1.925 J.881 E.00498
G1 X125.062 Y130.977 E.00016
; LINE_WIDTH: 0.1885
G3 X125.096 Y131.32 I-2.841 J.459 E.00235
G1 X125.099 Y149.504 E.12376
G3 X125.077 Y149.925 I-4.283 J-.019 E.00287
; LINE_WIDTH: 0.249369
G3 X124.973 Y150.353 I-2.189 J-.302 E.00409
; LINE_WIDTH: 0.298746
G3 X124.304 Y151.272 I-1.93 J-.703 E.01302
G1 X124.043 Y151.442 E.00352
G1 X123.774 Y151.566 E.00335
; LINE_WIDTH: 0.251131
G3 X123.336 Y151.675 I-.699 J-1.868 E.00423
; LINE_WIDTH: 0.188305
G3 X123.195 Y151.69 I-.301 J-2.213 E.00096
G1 X104.892 Y151.699 E.12442
G3 X104.475 Y151.677 I.004 J-3.945 E.00284
; LINE_WIDTH: 0.249398
G3 X104.047 Y151.573 I.303 J-2.19 E.0041
; LINE_WIDTH: 0.298761
G3 X102.901 Y150.53 I.691 J-1.911 E.01796
G1 X102.834 Y150.374 E.00192
; LINE_WIDTH: 0.256364
G3 X102.739 Y150.023 I1.88 J-.701 E.00348
; LINE_WIDTH: 0.188227
G3 X102.704 Y149.68 I2.664 J-.445 E.00234
G1 X102.701 Y131.489 E.12361
; LINE_WIDTH: 0.203243
G1 X102.729 Y131.034 E.00337
; LINE_WIDTH: 0.252865
G3 X102.8 Y130.727 I1.9 J.277 E.00298
G1 X102.835 Y130.627 E.001
; LINE_WIDTH: 0.298681
G3 X104.053 Y129.425 I1.894 J.701 E.01995
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.459 Y129.326 E-.15879
G1 X104.892 Y129.301 E-.16476
G1 X106.04 Y129.301 E-.43645
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 28/95
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.1 I.574 J1.073 P1  F42000
G1 X151.332 Y105.1 Z3.1
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.528 Y106.548 I-.288 J1.456 E.03303
G1 X152.528 Y121.252 E.23876
G3 X151.052 Y122.728 I-1.484 J-.008 E.03761
G1 X136.348 Y122.728 E.23876
G3 X134.872 Y121.252 I.008 J-1.484 E.03761
G1 X134.872 Y106.548 E.23876
G3 X136.348 Y105.072 I1.484 J.008 E.03761
G1 X151.052 Y105.072 E.23876
G3 X151.273 Y105.089 I-.008 J1.484 E.0036
; WIPE_START
M204 S6000
G1 X151.611 Y105.184 E-.13347
G1 X151.868 Y105.321 E-.11082
G1 X152.094 Y105.506 E-.11084
G1 X152.279 Y105.732 E-.11084
G1 X152.416 Y105.989 E-.11083
G1 X152.501 Y106.268 E-.11085
G1 X152.519 Y106.458 E-.07235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.03 Y104.986 Z3.2 F42000
G1 X143.763 Y104.737 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.528 Y104.741 E.12609
G3 X152.868 Y106.237 I-.178 J1.508 E.03563
G1 X152.868 Y121.598 E.24944
G3 X151.361 Y123.068 I-1.513 J-.043 E.03779
G1 X136.002 Y123.068 E.24941
G3 X134.532 Y121.562 I.037 J-1.507 E.03783
G1 X134.532 Y106.202 E.24941
M73 P60 R11
G3 X136.002 Y104.732 I1.513 J.043 E.03719
G1 X143.703 Y104.737 E.12505
; WIPE_START
M204 S6000
G1 X145.703 Y104.738 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 28 start: 83,94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer28 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X152.02 Y105.146 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0822966
G1 F15000
M204 S6000
G3 X152.454 Y105.579 I-.761 J1.195 E.00153
; WIPE_START
G1 X152.259 Y105.337 E-.38324
G1 X152.02 Y105.146 E-.37676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.215 Y112.776 Z3.2 F42000
G1 X152.455 Y122.22 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0822202
G1 F15000
M204 S6000
G3 X152.021 Y122.654 I-1.221 J-.787 E.00153
; WIPE_START
G1 X152.259 Y122.463 E-.37528
G1 X152.455 Y122.22 E-.38472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.825 Y122.415 Z3.2 F42000
G1 X135.384 Y122.657 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.081994
G1 F15000
M204 S6000
G3 X134.946 Y122.221 I.78 J-1.22 E.00154
; WIPE_START
G1 X135.141 Y122.463 E-.38026
G1 X135.384 Y122.657 E-.37974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.188 Y115.027 Z3.2 F42000
G1 X134.945 Y105.58 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0824151
G1 F15000
M204 S6000
G3 X135.379 Y105.146 I1.261 J.827 E.00154
; WIPE_START
G1 X135.141 Y105.337 E-.37528
G1 X134.945 Y105.58 E-.38472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.493 Y110.822 Z3.2 F42000
G1 X142.83 Y113.03 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.621 I2.275 J.865 E.03332
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53548
G1 X141.627 Y112.612 E-.1768
G1 X141.698 Y112.509 E-.04773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.811 Y111.463 I.81 J2.315 E.01519
G3 X144.456 Y111.583 I-.305 J3.436 E.01067
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59477
G1 X143.313 Y111.495 E-.16523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.689 Y111.67 E.00208
G3 X145.979 Y113.03 I-.99 J2.23 E.03124
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.689 Y111.67 E-.04877
G1 X145.092 Y111.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.135 E.00083
G3 X146 Y114.712 I-2.315 J.763 E.02607
G1 X146 Y113.147 E.02541
; WIPE_START
M204 S6000
G1 X146.017 Y113.135 E-.00784
G1 X146.109 Y113.512 E-.14751
G1 X146.138 Y113.999 E-.1853
G1 X146.092 Y114.384 E-.14722
G1 X146 Y114.712 E-.1294
G1 X146 Y114.336 E-.14273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.251 J-.949 E.032
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53548
G1 X145.949 Y114.846 E-.03097
G1 X145.718 Y115.272 E-.18407
G1 X145.702 Y115.291 E-.00948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.336 E.02588
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59511
G1 X144.229 Y116.282 E-.11056
G1 X144.087 Y116.299 E-.05433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.422 Y114.77 I.923 J-2.331 E.03325
G1 X142.77 Y114.77 E.02189
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53551
G1 X142.624 Y116.09 E-.0853
G1 X142.341 Y115.926 E-.12408
G1 X142.31 Y115.901 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.416 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.383 J.484 E.00553
G1 X141.4 Y114.712 E.02636
G3 X141.298 Y113.475 I2.292 J-.812 E.02037
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.15205
G1 X141.4 Y114.688 E-.60795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.78 Y119.852 Z3.2 F42000
G1 X103.041 Y149.933 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.0059
G1 X102.99 Y131.496 E.29353
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.976 Y129.591 E.29595
G3 X124.809 Y131.425 I-.08 J1.913 E.04625
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.919 J-.011 E.0474
G1 X104.898 Y151.41 E.29353
G3 X103.054 Y149.991 I.003 J-1.911 E.04061
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16075
G1 X102.991 Y147.996 E-.59925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z3.2 F42000
G1 X104.09 Y129.07 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00695
G1 X123.373 Y129.017 E.30622
G3 X125.39 Y131.204 I-.178 J2.188 E.05309
G1 X125.388 Y149.888 E.30339
G3 X123.196 Y151.99 I-2.198 J-.098 E.05443
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.193 E.05449
G1 X102.412 Y131.112 E.3034
G3 X104.032 Y129.085 I2.19 J.09 E.04509
M204 S10000
G1 X104.111 Y129.41 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.249999
G1 F15000
M204 S6000
G1 X104.459 Y129.326 E.00334
; LINE_WIDTH: 0.187742
G1 X104.892 Y129.301 E.00294
G1 X122.985 Y129.301 E.12258
G3 X123.35 Y129.327 I-.025 J2.953 E.00248
; LINE_WIDTH: 0.249779
G3 X123.728 Y129.418 I-.336 J2.216 E.00362
; LINE_WIDTH: 0.297951
G3 X124.969 Y130.638 I-.658 J1.912 E.02026
; LINE_WIDTH: 0.25157
G3 X125.073 Y131.047 I-1.895 J.7 E.00397
; LINE_WIDTH: 0.188346
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.506 E.123
G3 X125.077 Y149.929 I-4.39 J-.019 E.00288
; LINE_WIDTH: 0.250831
G3 X124.966 Y150.374 I-2.042 J-.274 E.00429
; LINE_WIDTH: 0.299087
G3 X123.779 Y151.564 I-1.906 J-.714 E.0196
; LINE_WIDTH: 0.252298
G3 X123.597 Y151.623 I-1.784 J-5.196 E.0018
G1 X123.348 Y151.674 E.00239
; LINE_WIDTH: 0.188325
G1 X122.983 Y151.699 E.00249
G1 X104.896 Y151.699 E.12297
G3 X104.475 Y151.677 I.019 J-4.286 E.00286
; LINE_WIDTH: 0.249205
G3 X104.05 Y151.574 I.301 J-2.183 E.00406
; LINE_WIDTH: 0.300398
G3 X102.898 Y150.526 I.685 J-1.91 E.01817
G1 X102.894 Y150.516 E.00012
; LINE_WIDTH: 0.263054
G3 X102.777 Y150.195 I1.932 J-.885 E.00337
G1 X102.737 Y150.019 E.00177
; LINE_WIDTH: 0.188222
G3 X102.715 Y149.85 I3.138 J-.505 E.00116
G1 X102.701 Y149.579 E.00184
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.196303
G1 X102.714 Y131.153 E.00239
; LINE_WIDTH: 0.240637
G3 X102.799 Y130.732 I2.199 J.219 E.00384
G1 X102.801 Y130.724 E.00007
; LINE_WIDTH: 0.296755
G3 X104.021 Y129.437 I1.932 J.609 E.0206
G1 X104.053 Y129.425 E.00038
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.459 Y129.326 E-.15891
G1 X104.892 Y129.301 E-.1647
G1 X106.04 Y129.301 E-.4364
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 29/95
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.574 J1.073 P1  F42000
G1 X151.344 Y105.078 Z3.2
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X152.55 Y106.538 I-.29 J1.468 E.03331
G1 X152.55 Y121.262 E.23907
G3 X151.062 Y122.75 I-1.496 J-.008 E.03792
G1 X136.338 Y122.75 E.23907
G3 X134.85 Y121.262 I.008 J-1.496 E.03792
G1 X134.85 Y106.538 E.23907
G3 X136.338 Y105.05 I1.496 J.008 E.03792
G1 X151.062 Y105.05 E.23907
G3 X151.285 Y105.068 I-.008 J1.496 E.00364
; WIPE_START
M204 S6000
G1 X151.625 Y105.163 E-.13438
G1 X151.885 Y105.302 E-.11174
G1 X152.112 Y105.488 E-.11175
G1 X152.298 Y105.715 E-.11174
G1 X152.437 Y105.975 E-.11174
G1 X152.522 Y106.256 E-.11175
G1 X152.54 Y106.431 E-.06692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.05 Y104.961 Z3.3 F42000
G1 X143.763 Y104.708 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.547 Y104.713 E.12639
G3 X152.897 Y106.22 I-.167 J1.508 E.03596
G1 X152.896 Y121.617 E.25002
G3 X151.378 Y123.097 I-1.517 J-.038 E.0381
G1 X135.983 Y123.096 E.24998
G3 X134.503 Y121.578 I.051 J-1.53 E.03801
G1 X134.504 Y106.183 E.24999
G3 X135.983 Y104.704 I1.517 J.038 E.03747
G1 X143.703 Y104.708 E.12536
; WIPE_START
M204 S6000
G1 X145.703 Y104.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 29 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer29 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.938 Y105.066 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0876948
G1 F15000
M204 S6000
G3 X152.492 Y105.583 I-.715 J1.322 E.00207
G1 X152.518 Y105.631 E.00015
; WIPE_START
G1 X152.492 Y105.583 E-.05057
G1 X152.271 Y105.307 E-.32769
G1 X152.09 Y105.159 E-.21639
G1 X151.938 Y105.066 E-.16534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.212 Y112.693 Z3.3 F42000
G1 X152.551 Y122.106 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0873507
G1 F15000
M204 S6000
G3 X151.97 Y122.718 I-1.265 J-.621 E.0023
; WIPE_START
G1 X152.285 Y122.48 E-.3508
G1 X152.468 Y122.254 E-.25892
G1 X152.551 Y122.106 E-.15027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.924 Y122.387 Z3.3 F42000
G1 X135.463 Y122.735 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0876207
G1 F15000
M204 S6000
G1 X135.382 Y122.693 E.00024
G3 X134.881 Y122.168 I.803 J-1.269 E.00198
; WIPE_START
G1 X135.116 Y122.48 E-.36085
G1 X135.382 Y122.693 E-.31552
G1 X135.463 Y122.735 E-.08362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.188 Y115.107 Z3.3 F42000
G1 X134.849 Y105.694 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.0872075
G1 F15000
M204 S6000
G3 X135.383 Y105.108 I1.379 J.72 E.00215
G1 X135.43 Y105.082 E.00014
; WIPE_START
G1 X135.383 Y105.108 E-.04803
G1 X135.115 Y105.32 E-.30313
G1 X134.932 Y105.546 E-.25869
G1 X134.849 Y105.694 E-.15014
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.468 Y110.859 Z3.3 F42000
G1 X142.83 Y113.03 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.622 I2.288 J.881 E.03329
G1 X142.83 Y112.97 E.02188
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53549
G1 X141.629 Y112.611 E-.17757
G1 X141.7 Y112.51 E-.04694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.893 Y111.597 E.02632
G3 X143.808 Y111.463 I.808 J2.315 E.01512
G3 X144.456 Y111.583 I-.299 J3.423 E.01071
; WIPE_START
M204 S6000
G1 X142.893 Y111.597 E-.59405
G1 X143.317 Y111.494 E-.16596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.047 J2.282 E.03117
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04953
G1 X145.092 Y111.898 E-.17509
; WIPE_END
M73 P61 R11
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.135 E.00083
G3 X146 Y114.711 I-2.39 J.762 E.02603
G1 X146 Y113.147 E.0254
; WIPE_START
M204 S6000
G1 X146.017 Y113.135 E-.00783
G1 X146.109 Y113.513 E-.14757
G1 X146.138 Y113.999 E-.18519
G1 X146.091 Y114.384 E-.14724
G1 X146 Y114.711 E-.12927
G1 X146 Y114.335 E-.14291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.0029
G3 X144.57 Y116.178 I-2.217 J-1.045 E.03041
G1 X144.57 Y114.83 E.02188
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.91 Y114.934 E-.06779
G1 X145.699 Y115.288 E-.15638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.507 Y116.203 E.02632
G3 X142.943 Y116.219 I-.807 J-2.337 E.02584
; WIPE_START
M204 S6000
G1 X144.507 Y116.203 E-.59436
G1 X144.083 Y116.305 E-.16564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.422 Y114.77 I.868 J-2.275 E.03331
G1 X142.77 Y114.77 E.02189
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53553
G1 X142.622 Y116.089 E-.08578
G1 X142.37 Y115.946 E-.11025
G1 X142.31 Y115.901 E-.02844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.416 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.383 J.484 E.00553
G1 X141.4 Y114.712 E.02636
G3 X141.298 Y113.475 I2.293 J-.812 E.02037
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.15207
G1 X141.4 Y114.688 E-.60794
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.78 Y119.852 Z3.3 F42000
G1 X103.041 Y149.933 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.00589
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.924 J.017 E.04613
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.427 I-.082 J1.918 E.04629
G1 X124.81 Y149.504 E.29354
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.991 I.012 J-1.918 E.04054
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16056
G1 X102.991 Y147.996 E-.59945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z3.3 F42000
G1 X104.091 Y129.071 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X104.512 Y129.012 I.514 J2.134 E.00692
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05309
G1 X125.388 Y149.888 E.30339
G3 X123.198 Y151.99 I-2.192 J-.092 E.05444
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.797 I.088 J-2.191 E.0545
G1 X102.412 Y131.112 E.3034
G3 X104.033 Y129.086 I2.193 J.093 E.04508
M204 S10000
G1 X104.134 Y129.4 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25197
G1 F15000
M204 S6000
G1 X104.203 Y129.378 E.00069
G1 X104.457 Y129.326 E.00243
; LINE_WIDTH: 0.18757
G1 X104.892 Y129.301 E.00295
G1 X122.979 Y129.301 E.12241
G1 X123.25 Y129.314 E.00183
; LINE_WIDTH: 0.241124
G3 X123.415 Y129.336 I-.36 J3.34 E.00149
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.298653
G3 X124.861 Y130.393 I-.612 J1.935 E.0179
G1 X124.912 Y130.497 E.00131
; LINE_WIDTH: 0.26267
G3 X125.058 Y130.959 I-1.953 J.872 E.00478
G1 X125.062 Y130.977 E.00018
; LINE_WIDTH: 0.188518
G3 X125.096 Y131.319 I-2.836 J.459 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.075 Y149.934 E.0029
; LINE_WIDTH: 0.250082
G3 X124.972 Y150.356 I-2.082 J-.285 E.00406
; LINE_WIDTH: 0.29897
G3 X123.93 Y151.499 I-1.917 J-.7 E.01794
G1 X123.774 Y151.566 E.00192
; LINE_WIDTH: 0.251118
G3 X123.336 Y151.675 I-.699 J-1.866 E.00423
; LINE_WIDTH: 0.18832
G3 X123.195 Y151.69 I-.301 J-2.213 E.00096
G1 X104.892 Y151.699 E.12444
G1 X104.467 Y151.675 E.00289
; LINE_WIDTH: 0.24996
G3 X104.045 Y151.572 I.304 J-2.161 E.00405
; LINE_WIDTH: 0.299798
G3 X102.864 Y150.449 I.688 J-1.905 E.01902
; LINE_WIDTH: 0.259698
G3 X102.738 Y150.024 I2.044 J-.84 E.0043
G1 X102.737 Y150.015 E.00009
; LINE_WIDTH: 0.18821
G3 X102.715 Y149.85 I3.089 J-.494 E.00113
G1 X102.701 Y149.579 E.00184
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.19787
G1 X102.716 Y131.129 E.00258
; LINE_WIDTH: 0.242389
G3 X102.787 Y130.77 I2.216 J.248 E.0033
G1 X102.8 Y130.727 E.00041
; LINE_WIDTH: 0.297583
G3 X104.021 Y129.436 I1.935 J.608 E.02069
; LINE_WIDTH: 0.25197
G1 X104.077 Y129.418 E.00054
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.203 Y129.378 E-.05065
G1 X104.457 Y129.326 E-.09816
G1 X104.892 Y129.301 E-.16568
G1 X106.064 Y129.301 E-.44552
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 30/95
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.3 I.574 J1.073 P1  F42000
G1 X151.357 Y105.056 Z3.3
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.64 Y105.142 E.0048
G3 X152.572 Y106.529 I-.576 J1.394 E.02876
G1 X152.572 Y121.271 E.23939
G3 X151.071 Y122.772 I-1.509 J-.008 E.03823
G1 X136.329 Y122.772 E.23939
G3 X134.828 Y121.271 I.008 J-1.509 E.03823
G1 X134.828 Y106.529 E.23939
G3 X136.329 Y105.028 I1.509 J.008 E.03823
G1 X151.071 Y105.028 E.23939
G3 X151.298 Y105.046 I-.008 J1.509 E.00369
; WIPE_START
M204 S6000
G1 X151.64 Y105.142 E-.1349
G1 X151.901 Y105.282 E-.11262
G1 X152.13 Y105.47 E-.11267
G1 X152.318 Y105.699 E-.11267
G1 X152.458 Y105.96 E-.11263
G1 X152.544 Y106.244 E-.11266
G1 X152.56 Y106.406 E-.06186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.07 Y104.937 Z3.4 F42000
G1 X143.764 Y104.68 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.566 Y104.684 E.12669
G3 X152.925 Y106.203 I-.169 J1.519 E.03622
G1 X152.924 Y121.636 E.2506
G3 X151.395 Y123.125 I-1.528 J-.04 E.03837
G1 X135.964 Y123.124 E.25056
G3 X134.475 Y121.595 I.041 J-1.529 E.03835
G1 X134.476 Y106.164 E.25057
G3 X135.964 Y104.676 I1.528 J.039 E.03771
G1 X143.704 Y104.68 E.12567
; WIPE_START
M204 S6000
G1 X145.704 Y104.681 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 30 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer30 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.837 Y104.985 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0925379
G1 F15000
M204 S6000
G3 X152.616 Y105.763 I-.546 J1.326 E.00327
M204 S10000
G1 X152.615 Y122.037 F42000
; LINE_WIDTH: 0.0925858
G1 F15000
M204 S6000
G3 X151.834 Y122.817 I-1.339 J-.56 E.00328
M204 S10000
G1 X135.563 Y122.816 F42000
; LINE_WIDTH: 0.0924829
G1 F15000
M204 S6000
G3 X134.783 Y122.034 I.556 J-1.335 E.00328
M204 S10000
G1 X134.785 Y105.763 F42000
; LINE_WIDTH: 0.0925855
G1 F15000
M204 S6000
G3 X135.566 Y104.983 I1.339 J.56 E.00328
; WIPE_START
G1 X135.338 Y105.101 E-.17194
G1 X135.099 Y105.293 E-.20654
G1 X134.884 Y105.563 E-.23156
G1 X134.785 Y105.763 E-.14996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.449 Y110.879 Z3.4 F42000
G1 X142.83 Y113.03 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.311 J.901 E.0333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.608 Y112.645 E-.16276
G1 X141.698 Y112.51 E-.06141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.806 Y111.463 I.882 J2.803 E.01508
G3 X144.456 Y111.583 I-.295 J3.417 E.01075
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.5948
G1 X143.313 Y111.495 E-.1652
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.017 J2.253 E.03118
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04957
G1 X145.092 Y111.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.034 Y113.192 E.00175
G3 X146 Y114.711 I-2.327 J.708 E.0251
G1 X146 Y113.149 E.02536
; WIPE_START
M204 S6000
G1 X146.034 Y113.192 E-.02075
G1 X146.126 Y113.649 E-.17734
G1 X146.138 Y113.999 E-.13301
G1 X146.091 Y114.384 E-.14723
G1 X146 Y114.711 E-.12926
G1 X146 Y114.31 E-.15242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.178 I-2.205 J-1.031 E.03044
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.91 Y114.934 E-.06743
G1 X145.699 Y115.288 E-.15674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.202 E.02634
G3 X142.943 Y116.219 I-.808 J-2.38 E.02584
; WIPE_START
M204 S6000
G1 X144.508 Y116.202 E-.59477
G1 X144.133 Y116.301 E-.14743
G1 X144.086 Y116.306 E-.0178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.179 E.02288
G3 X141.421 Y114.77 I.903 J-2.313 E.0333
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.179 E-.53596
G1 X142.535 Y116.044 E-.12331
G1 X142.31 Y115.904 E-.10074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.331 Y113.325 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.403 J.575 E.004
G1 X141.4 Y114.711 E.02634
G3 X141.318 Y113.384 I2.334 J-.811 E.02186
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.11641
G1 X141.4 Y114.711 E-.6164
G1 X141.382 Y114.641 E-.02719
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.766 Y119.81 Z3.4 F42000
G1 X103.043 Y149.927 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.027 Y149.872 E.00093
G3 X102.991 Y149.575 I1.875 J-.374 E.00487
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.913 J.007 E.04623
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.099 J1.933 E.04615
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.012 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.136 Y150.231 I.006 J-1.912 E.03646
G1 X103.061 Y149.984 E.00418
; WIPE_START
M204 S6000
G1 X103.027 Y149.872 E-.04446
G1 X102.991 Y149.575 E-.11377
G1 X102.991 Y147.991 E-.60177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.372 Z3.4 F42000
G1 X104.09 Y129.07 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.091 Y129.071 E.00001
G3 X104.512 Y129.012 I.513 J2.133 E.00691
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05309
G1 X125.388 Y149.886 E.30336
G3 X123.198 Y151.99 I-2.198 J-.096 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.09 J-2.192 E.05447
G1 X102.412 Y131.112 E.30342
G3 X103.764 Y129.177 I2.192 J.092 E.04047
G1 X104.033 Y129.089 E.00461
M204 S10000
G1 X104.116 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25219
G1 F15000
M204 S6000
G1 X104.456 Y129.325 E.0033
; LINE_WIDTH: 0.187659
G3 X104.633 Y129.309 I.34 J2.729 E.0012
G1 X122.983 Y129.301 E.12426
G3 X123.3 Y129.32 I-.047 J3.461 E.00215
; LINE_WIDTH: 0.246784
G3 X123.726 Y129.418 I-.277 J2.185 E.00402
; LINE_WIDTH: 0.298327
G3 X124.968 Y130.633 I-.665 J1.922 E.02025
; LINE_WIDTH: 0.251684
G3 X125.022 Y130.803 I-1.947 J.721 E.00168
G1 X125.074 Y131.05 E.00236
; LINE_WIDTH: 0.188342
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.508 E.12301
M73 P61 R10
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.247184
G3 X125.025 Y150.186 I-1.793 J-.221 E.00239
G1 X124.989 Y150.308 E.00117
; LINE_WIDTH: 0.297837
G3 X124.087 Y151.417 I-1.936 J-.653 E.01644
G1 X123.763 Y151.57 E.00404
; LINE_WIDTH: 0.25024
G3 X123.427 Y151.661 I-.755 J-2.105 E.00324
G1 X123.331 Y151.676 E.00091
; LINE_WIDTH: 0.188315
G3 X123.195 Y151.69 I-.294 J-2.193 E.00093
G1 X104.892 Y151.699 E.12443
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.247532
G3 X104.304 Y151.647 I.437 J-2.937 E.00151
G1 X104.09 Y151.588 E.00204
; LINE_WIDTH: 0.29804
G3 X102.831 Y150.362 I.648 J-1.926 E.02049
; LINE_WIDTH: 0.250432
G3 X102.725 Y149.935 I1.98 J-.717 E.00411
; LINE_WIDTH: 0.188029
G3 X102.71 Y149.795 I2.221 J-.301 E.00096
G1 X102.701 Y131.489 E.12424
; LINE_WIDTH: 0.196471
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240808
G3 X102.737 Y130.985 I1.878 J.171 E.00149
G1 X102.801 Y130.724 E.00241
; LINE_WIDTH: 0.297347
G3 X103.876 Y129.497 I1.948 J.623 E.01885
G1 X104.021 Y129.437 E.00177
; LINE_WIDTH: 0.25219
G1 X104.058 Y129.427 E.00036
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.456 Y129.325 E-.15621
G1 X104.633 Y129.309 E-.06748
G1 X106.045 Y129.308 E-.53632
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 31/95
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I.575 J1.073 P1  F42000
G1 X151.369 Y105.034 Z3.4
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.654 Y105.121 E.00483
G3 X152.594 Y106.519 I-.581 J1.406 E.02899
G1 X152.594 Y121.281 E.23971
G3 X151.081 Y122.794 I-1.521 J-.008 E.03854
G1 X136.319 Y122.794 E.23971
G3 X134.806 Y121.281 I.008 J-1.521 E.03854
G1 X134.806 Y106.519 E.23971
G3 X136.319 Y105.006 I1.521 J.008 E.03854
G1 X151.081 Y105.006 E.23971
G3 X151.31 Y105.024 I-.008 J1.521 E.00374
; WIPE_START
M204 S6000
G1 X151.654 Y105.121 E-.13568
G1 X151.918 Y105.262 E-.11354
G1 X152.149 Y105.451 E-.11359
G1 X152.338 Y105.682 E-.11354
G1 X152.479 Y105.946 E-.11357
G1 X152.566 Y106.232 E-.11355
G1 X152.58 Y106.38 E-.05653
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.09 Y104.912 Z3.5 F42000
G1 X143.764 Y104.652 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
M73 P62 R10
G1 X151.585 Y104.656 E.12699
G3 X152.953 Y106.186 I-.171 J1.53 E.03648
G1 X152.952 Y121.654 E.25117
G3 X151.412 Y123.153 I-1.54 J-.041 E.03863
G1 X135.946 Y123.152 E.25114
G3 X134.447 Y121.612 I.055 J-1.553 E.03854
G1 X134.448 Y106.146 E.25114
G3 X135.946 Y104.648 I1.539 J.041 E.03795
G1 X143.704 Y104.652 E.12598
; WIPE_START
M204 S6000
G1 X145.704 Y104.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 31 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer31 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.799 Y104.936 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0992745
G1 F15000
M204 S6000
G3 X152.663 Y105.8 I-.512 J1.376 E.004
M204 S10000
G1 X152.664 Y121.999 F42000
; LINE_WIDTH: 0.0993078
G1 F15000
M204 S6000
G3 X151.798 Y122.865 I-1.394 J-.528 E.004
M204 S10000
G1 X135.601 Y122.864 F42000
; LINE_WIDTH: 0.0992495
G1 F15000
M204 S6000
G3 X134.735 Y121.998 I.526 J-1.391 E.004
M204 S10000
G1 X134.736 Y105.801 F42000
; LINE_WIDTH: 0.0993067
G1 F15000
M204 S6000
G3 X135.602 Y104.935 I1.394 J.528 E.004
; WIPE_START
G1 X135.344 Y105.061 E-.17293
G1 X135.077 Y105.271 E-.20481
G1 X134.861 Y105.544 E-.20989
G1 X134.736 Y105.801 E-.17237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.428 Y110.885 Z3.5 F42000
G1 X142.83 Y113.03 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.278 J.869 E.03333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.532 Y112.781 E-.10371
G1 X141.682 Y112.528 E-.11159
G1 X141.697 Y112.51 E-.00886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.803 Y111.463 I.882 J2.806 E.01504
G3 X144.456 Y111.583 I-.29 J3.41 E.0108
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59479
G1 X143.313 Y111.495 E-.16521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.008 J2.245 E.0312
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04953
G1 X145.092 Y111.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.034 Y113.189 E.00171
G3 X146 Y114.713 I-2.333 J.711 E.02517
G1 X146 Y113.149 E.02539
; WIPE_START
M204 S6000
G1 X146.034 Y113.189 E-.01988
G1 X146.109 Y113.514 E-.12687
G1 X146.138 Y113.999 E-.18446
G1 X146.092 Y114.384 E-.14716
G1 X146 Y114.713 E-.12996
G1 X146 Y114.314 E-.15167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.909 Y114.935 E.00291
G3 X144.57 Y116.179 I-2.211 J-1.038 E.03042
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.909 Y114.935 E-.06821
G1 X145.699 Y115.288 E-.15596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.379 E.02586
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59509
G1 X144.133 Y116.301 E-.14797
G1 X144.088 Y116.306 E-.01694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.888 J-2.298 E.0333
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53554
G1 X142.623 Y116.089 E-.08578
G1 X142.37 Y115.946 E-.11023
G1 X142.312 Y115.899 E-.02845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.331 Y113.326 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.087 I2.433 J.573 E.00404
G1 X141.4 Y114.711 E.02637
G3 X141.318 Y113.385 I2.364 J-.812 E.02184
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.087 E-.11729
G1 X141.4 Y114.711 E-.61708
G1 X141.383 Y114.646 E-.02563
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.767 Y119.814 Z3.5 F42000
G1 X103.04 Y149.93 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.038 Y149.921 E.00016
G3 X102.991 Y149.575 I1.87 J-.429 E.00567
G1 X102.99 Y131.496 E.29357
G3 X104.749 Y129.596 I1.914 J.008 E.04617
G1 X122.976 Y129.591 E.29597
G3 X124.809 Y131.425 I-.079 J1.912 E.04625
G1 X124.81 Y149.504 E.29357
G3 X122.973 Y151.409 I-1.914 J-.008 E.04744
G1 X104.895 Y151.41 E.29355
G3 X103.137 Y150.23 I.013 J-1.919 E.03641
G1 X103.059 Y149.987 E.00414
; WIPE_START
M204 S6000
G1 X103.038 Y149.921 E-.02658
G1 X102.991 Y149.575 E-.13246
G1 X102.991 Y147.994 E-.60095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.374 Z3.5 F42000
G1 X104.091 Y129.07 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00691
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.512 Y151.988 E.30339
G3 X102.41 Y149.796 I.096 J-2.196 E.05445
G1 X102.412 Y131.114 E.30335
G3 X104.034 Y129.087 I2.199 J.096 E.0451
M204 S10000
G1 X104.141 Y129.396 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.253927
G1 F15000
M204 S6000
G1 X104.163 Y129.389 E.00022
G3 X104.456 Y129.326 I.561 J1.9 E.00284
; LINE_WIDTH: 0.187795
G3 X104.719 Y129.304 I.3 J2.066 E.00179
G1 X122.985 Y129.301 E.12379
G3 X123.35 Y129.327 I-.024 J2.94 E.00249
; LINE_WIDTH: 0.25283
G3 X123.615 Y129.382 I-.199 J1.62 E.00255
G1 X123.774 Y129.435 E.00158
; LINE_WIDTH: 0.298676
G3 X124.97 Y130.639 I-.713 J1.904 E.01978
; LINE_WIDTH: 0.252074
G3 X125.074 Y131.05 I-1.852 J.687 E.00399
; LINE_WIDTH: 0.188342
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.508 E.12301
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.249766
G3 X124.973 Y150.353 I-2.192 J-.309 E.00405
; LINE_WIDTH: 0.298513
G3 X123.926 Y151.502 I-1.908 J-.689 E.018
G1 X123.769 Y151.568 E.00192
; LINE_WIDTH: 0.256088
G3 X123.423 Y151.662 I-.818 J-2.329 E.00343
; LINE_WIDTH: 0.188517
G3 X123.08 Y151.696 I-.451 J-2.731 E.00235
G1 X104.89 Y151.699 E.12381
G3 X104.475 Y151.677 I-.001 J-3.944 E.00283
; LINE_WIDTH: 0.249561
G3 X104.134 Y151.602 I.293 J-2.143 E.00325
G1 X104.04 Y151.571 E.00092
; LINE_WIDTH: 0.298875
G3 X102.898 Y150.526 I.693 J-1.904 E.01795
G1 X102.834 Y150.374 E.00186
; LINE_WIDTH: 0.254784
G3 X102.733 Y149.994 I1.944 J-.722 E.00375
; LINE_WIDTH: 0.188166
G3 X102.71 Y149.79 I2.823 J-.422 E.00139
G1 X102.701 Y131.489 E.12431
; LINE_WIDTH: 0.197752
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.243707
G3 X102.81 Y130.699 I2.265 J.266 E.00397
; LINE_WIDTH: 0.298183
G3 X103.873 Y129.499 I1.931 J.641 E.01857
G1 X103.986 Y129.45 E.00139
; LINE_WIDTH: 0.253927
G1 X104.085 Y129.416 E.00099
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.163 Y129.389 E-.03172
G1 X104.456 Y129.326 E-.11379
G1 X104.719 Y129.304 E-.10037
G1 X106.072 Y129.304 E-.51412
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 32/95
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.5 I.575 J1.073 P1  F42000
G1 X151.382 Y105.013 Z3.5
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.668 Y105.1 E.00487
G3 X152.616 Y106.509 I-.585 J1.417 E.02922
G1 X152.616 Y121.291 E.24003
G3 X151.091 Y122.816 I-1.533 J-.008 E.03885
G1 X136.309 Y122.816 E.24003
G3 X134.784 Y121.291 I.008 J-1.533 E.03885
G1 X134.784 Y106.509 E.24003
G3 X136.309 Y104.984 I1.533 J.008 E.03885
G1 X151.091 Y104.984 E.24003
G3 X151.323 Y105.003 I-.008 J1.533 E.00378
; WIPE_START
M204 S6000
G1 X151.668 Y105.1 E-.13648
G1 X151.934 Y105.242 E-.11443
G1 X152.167 Y105.433 E-.1145
G1 X152.358 Y105.666 E-.11446
G1 X152.5 Y105.931 E-.11445
G1 X152.588 Y106.22 E-.11449
G1 X152.601 Y106.354 E-.05119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.111 Y104.887 Z3.6 F42000
G1 X143.765 Y104.624 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.604 Y104.628 E.12729
G3 X152.982 Y106.169 I-.173 J1.541 E.03674
G1 X152.981 Y121.672 E.25174
G3 X151.429 Y123.182 I-1.551 J-.042 E.0389
G1 X135.928 Y123.181 E.25171
G3 X134.418 Y121.629 I.056 J-1.565 E.0388
G1 X134.419 Y106.128 E.25172
G3 X135.928 Y104.619 I1.55 J.042 E.03819
G1 X143.705 Y104.624 E.12628
; WIPE_START
M204 S6000
G1 X145.705 Y104.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 32 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer32 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.777 Y104.896 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106166
G1 F15000
M204 S6000
G3 X152.706 Y105.825 I-.487 J1.416 E.00469
M204 S10000
G1 X152.704 Y121.977 F42000
; LINE_WIDTH: 0.106385
G1 F15000
M204 S6000
G3 X151.777 Y122.904 I-1.422 J-.496 E.00469
M204 S10000
G1 X135.623 Y122.904 F42000
; LINE_WIDTH: 0.106203
G1 F15000
M204 S6000
G3 X134.696 Y121.977 I.488 J-1.415 E.00468
M204 S10000
G1 X134.696 Y105.823 F42000
; LINE_WIDTH: 0.10613
G1 F15000
M204 S6000
G3 X135.623 Y104.896 I1.422 J.496 E.00468
; WIPE_START
G1 X135.324 Y105.038 E-.18533
G1 X135.049 Y105.256 E-.19722
G1 X134.837 Y105.524 E-.19209
G1 X134.696 Y105.823 E-.18537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.409 Y110.885 Z3.6 F42000
G1 X142.83 Y113.03 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.622 I2.273 J.866 E.03332
G1 X142.83 Y112.97 E.02189
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.629 Y112.611 E-.17777
G1 X141.701 Y112.513 E-.04639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.508 Y111.6 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.892 Y111.598 E.02624
G3 X143.801 Y111.463 I.808 J2.314 E.015
G3 X144.451 Y111.581 I-.12 J2.512 E.01077
; WIPE_START
M204 S6000
G1 X142.892 Y111.598 E-.59253
G1 X143.321 Y111.493 E-.16747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02287
G1 X144.602 Y111.633 E.00055
G3 X145.979 Y113.03 I-.911 J2.275 E.03277
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53565
G1 X144.602 Y111.633 E-.01285
G1 X145.031 Y111.855 E-.18384
G1 X145.088 Y111.901 E-.02766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.135 E.00084
G3 X146 Y114.712 I-2.318 J.763 E.02607
G1 X146 Y113.147 E.02542
; WIPE_START
M204 S6000
G1 X146.017 Y113.135 E-.00781
G1 X146.122 Y113.608 E-.18377
G1 X146.138 Y113.999 E-.1489
G1 X146.092 Y114.384 E-.14717
G1 X146 Y114.712 E-.12967
G1 X146 Y114.337 E-.14269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.846 E.00133
G3 X144.57 Y116.179 I-2.317 J-1.018 E.03194
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53553
G1 X145.949 Y114.846 E-.0311
G1 X145.846 Y115.06 E-.09006
G1 X145.7 Y115.29 E-.10332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.6 F42000
G1 Z3.2
M73 P63 R10
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02636
G3 X142.943 Y116.219 I-.809 J-2.338 E.02588
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59531
G1 X144.229 Y116.282 E-.11056
G1 X144.088 Y116.299 E-.05414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.179 E.02288
G3 X141.421 Y114.77 I.871 J-2.28 E.03333
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.179 E-.53596
G1 X142.454 Y115.998 E-.15864
G1 X142.312 Y115.901 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.417 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.376 J.483 E.00553
G1 X141.4 Y114.71 E.02632
G3 X141.298 Y113.475 I2.285 J-.81 E.02034
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.15192
G1 X141.4 Y114.689 E-.60808
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.78 Y119.853 Z3.6 F42000
G1 X103.041 Y149.933 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.926 J.019 E.04612
G1 X122.976 Y129.591 E.29596
G3 X124.809 Y131.425 I-.09 J1.922 E.04619
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.925 J-.018 E.04736
G1 X104.896 Y151.41 E.29357
G3 X103.054 Y149.991 I.006 J-1.912 E.04057
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15997
G1 X102.991 Y147.996 E-.60003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z3.6 F42000
G1 X104.091 Y129.07 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.091 Y129.07 E.00001
G3 X104.512 Y129.012 I.512 J2.132 E.00691
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.184 J2.193 E.05305
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.104 J-2.206 E.05438
G1 X102.412 Y131.112 E.30342
G3 X103.683 Y129.212 I2.191 J.09 E.03906
G1 X104.034 Y129.09 E.00603
M204 S10000
G1 X104.149 Y129.395 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.263596
G1 F15000
M204 S6000
G1 X104.169 Y129.388 E.0002
G3 X104.377 Y129.338 I.604 J2.062 E.00211
; LINE_WIDTH: 0.187793
G3 X104.521 Y129.318 I.428 J2.442 E.00099
G1 X104.892 Y129.301 E.00252
G1 X122.985 Y129.301 E.12262
G1 X123.249 Y129.315 E.00179
; LINE_WIDTH: 0.241399
G3 X123.41 Y129.336 I-.328 J3.271 E.00146
G1 X123.676 Y129.401 E.00245
; LINE_WIDTH: 0.298892
G3 X124.86 Y130.391 I-.617 J1.94 E.0179
G1 X124.908 Y130.487 E.00121
; LINE_WIDTH: 0.26304
G3 X125.058 Y130.956 I-1.928 J.874 E.00486
G1 X125.062 Y130.979 E.00023
; LINE_WIDTH: 0.188501
G1 X125.099 Y131.417 E.00299
G1 X125.099 Y149.506 E.12311
G3 X125.076 Y149.928 I-4.125 J-.012 E.00288
; LINE_WIDTH: 0.247115
G3 X125.052 Y150.071 I-2.95 J-.427 E.00133
G1 X124.988 Y150.31 E.00227
; LINE_WIDTH: 0.298031
G3 X123.774 Y151.566 I-1.931 J-.651 E.02035
; LINE_WIDTH: 0.256559
G3 X123.427 Y151.661 I-.707 J-1.899 E.00345
; LINE_WIDTH: 0.188512
G1 X122.983 Y151.699 E.00304
G1 X104.892 Y151.699 E.12313
G3 X104.474 Y151.676 I.001 J-3.871 E.00285
; LINE_WIDTH: 0.249365
G3 X104.048 Y151.574 I.303 J-2.186 E.00407
; LINE_WIDTH: 0.29974
G3 X102.924 Y150.577 I.694 J-1.916 E.01745
G1 X102.86 Y150.437 E.00174
; LINE_WIDTH: 0.25946
G3 X102.738 Y150.023 I2.137 J-.856 E.00419
G1 X102.737 Y150.02 E.00003
; LINE_WIDTH: 0.188224
G1 X102.701 Y149.583 E.00298
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.198034
G1 X102.717 Y131.127 E.0026
; LINE_WIDTH: 0.242485
G3 X102.787 Y130.77 I2.205 J.249 E.00328
G1 X102.8 Y130.727 E.00041
; LINE_WIDTH: 0.29915
G3 X103.875 Y129.499 I1.943 J.615 E.019
; LINE_WIDTH: 0.263596
G1 X104.093 Y129.416 E.0023
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.169 Y129.388 E-.03067
G1 X104.377 Y129.338 E-.08123
G1 X104.521 Y129.318 E-.05539
G1 X104.892 Y129.301 E-.14103
G1 X106.08 Y129.301 E-.45168
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 33/95
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I.575 J1.072 P1  F42000
G1 X151.394 Y104.991 Z3.6
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.683 Y105.079 E.0049
G3 X152.638 Y106.499 I-.59 J1.428 E.02946
G1 X152.638 Y121.301 E.24034
G3 X151.101 Y122.838 I-1.545 J-.008 E.03916
G1 X136.299 Y122.838 E.24034
G3 X134.762 Y121.301 I.008 J-1.545 E.03916
G1 X134.762 Y106.499 E.24034
G3 X136.299 Y104.962 I1.545 J.008 E.03916
G1 X151.101 Y104.962 E.24034
G3 X151.335 Y104.981 I-.008 J1.545 E.00383
; WIPE_START
M204 S6000
G1 X151.683 Y105.079 E-.13726
G1 X151.951 Y105.222 E-.11535
G1 X152.185 Y105.415 E-.11539
G1 X152.378 Y105.649 E-.11538
G1 X152.521 Y105.917 E-.11539
G1 X152.609 Y106.208 E-.11537
G1 X152.621 Y106.328 E-.04587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.131 Y104.863 Z3.7 F42000
G1 X143.765 Y104.595 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.622 Y104.6 E.12759
G3 X153.01 Y106.152 I-.175 J1.552 E.037
G1 X153.009 Y121.691 E.25233
G3 X151.446 Y123.21 I-1.57 J-.052 E.03911
G1 X135.909 Y123.209 E.25229
G3 X134.39 Y121.646 I.041 J-1.559 E.03917
G1 X134.391 Y106.109 E.25229
G3 X135.909 Y104.591 I1.57 J.052 E.03838
G1 X143.705 Y104.595 E.12659
; WIPE_START
M204 S6000
G1 X145.705 Y104.597 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 33 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer33 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.76 Y104.858 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0834027
G1 F15000
M204 S6000
G1 X151.85 Y104.894 E.00024
; LINE_WIDTH: 0.121447
G3 X152.566 Y105.475 I-.612 J1.485 E.00381
; LINE_WIDTH: 0.100979
G3 X152.744 Y105.844 I-1.656 J1.024 E.00133
M204 S10000
G1 X152.742 Y121.96 F42000
; LINE_WIDTH: 0.102043
G1 F15000
M204 S6000
G3 X152.561 Y122.331 I-1.896 J-.691 E.00136
; LINE_WIDTH: 0.121574
G3 X151.851 Y122.906 I-1.284 J-.862 E.00378
; LINE_WIDTH: 0.0834787
G1 X151.76 Y122.942 E.00025
M204 S10000
G1 X135.64 Y122.941 F42000
; LINE_WIDTH: 0.101982
G1 F15000
M204 S6000
G3 X135.269 Y122.762 I.696 J-1.908 E.00135
; LINE_WIDTH: 0.121302
G3 X134.695 Y122.052 I.872 J-1.294 E.00377
; LINE_WIDTH: 0.0835963
G1 X134.658 Y121.96 E.00025
M204 S10000
G1 X134.658 Y105.84 F42000
; LINE_WIDTH: 0.0833887
G1 F15000
M204 S6000
G1 X134.694 Y105.75 E.00024
; LINE_WIDTH: 0.121494
G3 X135.275 Y105.034 I1.488 J.614 E.00381
; LINE_WIDTH: 0.101054
G3 X135.64 Y104.858 I1.013 J1.638 E.00132
; WIPE_START
G1 X135.275 Y105.034 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.517 Y110.582 Z3.7 F42000
G1 X142.83 Y113.03 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.341 J.932 E.03326
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53584
G1 X141.628 Y112.611 E-.17745
G1 X141.703 Y112.514 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.798 Y111.463 I.81 J2.315 E.01499
G3 X144.456 Y111.583 I-.281 J3.393 E.01088
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59482
G1 X143.313 Y111.495 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.689 Y111.67 E.00208
G3 X145.979 Y113.03 I-.99 J2.23 E.03124
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.689 Y111.67 E-.04877
G1 X145.092 Y111.898 E-.17585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.032 Y113.184 E.00163
G3 X146 Y114.712 I-2.387 J.714 E.02523
G1 X146 Y113.149 E.02539
; WIPE_START
M204 S6000
G1 X146.032 Y113.184 E-.01814
G1 X146.109 Y113.514 E-.12878
G1 X146.138 Y113.999 E-.18449
G1 X146.092 Y114.383 E-.14713
G1 X146 Y114.712 E-.12979
G1 X146 Y114.313 E-.15168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02286
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.285 J-.984 E.03197
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53555
G1 X145.949 Y114.846 E-.03096
G1 X145.845 Y115.062 E-.09113
G1 X145.7 Y115.29 E-.10236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.336 E.02588
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59515
G1 X144.229 Y116.282 E-.11057
G1 X144.088 Y116.299 E-.05428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.422 Y114.77 I.875 J-2.283 E.0333
G1 X142.77 Y114.77 E.02189
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53557
G1 X142.622 Y116.089 E-.08613
G1 X142.37 Y115.945 E-.11009
G1 X142.312 Y115.899 E-.02821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.417 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.384 J.484 E.00553
G1 X141.4 Y114.712 E.02636
G1 X141.398 Y114.708 E.00008
G3 X141.298 Y113.476 I2.295 J-.807 E.0203
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.15193
G1 X141.4 Y114.689 E-.60808
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.853 Z3.7 F42000
G1 X103.043 Y149.926 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.027 Y149.873 E.0009
G3 X102.991 Y149.575 I1.876 J-.376 E.00488
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.917 J.011 E.04621
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.084 J1.918 E.04624
G1 X124.81 Y149.502 E.29353
G3 X122.973 Y151.409 I-1.915 J-.007 E.04747
G1 X104.896 Y151.41 E.29353
G3 X103.136 Y150.23 I.007 J-1.914 E.03646
G1 X103.06 Y149.983 E.0042
; WIPE_START
M204 S6000
G1 X103.027 Y149.873 E-.0438
G1 X102.991 Y149.575 E-.11399
G1 X102.991 Y147.99 E-.60221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.37 Z3.7 F42000
G1 X104.091 Y129.07 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.0069
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.192 J-.089 E.05447
G1 X104.512 Y151.988 E.30342
G3 X102.41 Y149.798 I.098 J-2.198 E.0544
G1 X102.412 Y131.112 E.30342
G3 X104.034 Y129.087 I2.199 J.098 E.04506
M204 S10000
G1 X104.13 Y129.404 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252152
G1 F15000
M204 S6000
G1 X104.286 Y129.357 E.00154
G1 X104.458 Y129.325 E.00164
; LINE_WIDTH: 0.187786
G3 X104.633 Y129.309 I.348 J2.829 E.0012
G1 X122.983 Y129.301 E.12435
G1 X123.35 Y129.327 E.0025
; LINE_WIDTH: 0.249559
G3 X123.724 Y129.417 I-.352 J2.271 E.00357
; LINE_WIDTH: 0.29787
G3 X124.969 Y130.637 I-.661 J1.92 E.0203
; LINE_WIDTH: 0.251438
G3 X125.074 Y131.05 I-1.904 J.701 E.00399
; LINE_WIDTH: 0.188241
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243632
G3 X125.025 Y150.186 I-1.882 J-.184 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.299797
G3 X123.978 Y151.475 I-1.935 J-.649 E.01799
G1 X123.919 Y151.505 E.00075
; LINE_WIDTH: 0.263066
G3 X123.425 Y151.662 I-.904 J-1.985 E.00511
G1 X123.415 Y151.663 E.0001
; LINE_WIDTH: 0.188483
G1 X122.979 Y151.699 E.00298
G1 X104.893 Y151.699 E.12308
G3 X104.475 Y151.677 I.011 J-4.215 E.00285
; LINE_WIDTH: 0.249309
G3 X104.047 Y151.573 I.31 J-2.208 E.0041
; LINE_WIDTH: 0.298427
G3 X102.831 Y150.362 I.685 J-1.904 E.02
; LINE_WIDTH: 0.250492
G3 X102.725 Y149.937 I1.951 J-.71 E.0041
; LINE_WIDTH: 0.188032
G3 X102.71 Y149.795 I2.225 J-.303 E.00097
G1 X102.701 Y131.489 E.12424
; LINE_WIDTH: 0.205614
G3 X102.737 Y130.989 I3.354 J-.012 E.00376
; LINE_WIDTH: 0.255596
G1 X102.835 Y130.627 E.00358
; LINE_WIDTH: 0.29946
G3 X104.022 Y129.437 I1.896 J.704 E.01962
; LINE_WIDTH: 0.252152
G1 X104.072 Y129.421 E.0005
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.286 Y129.357 E-.08497
G1 X104.458 Y129.325 E-.0662
G1 X104.633 Y129.309 E-.06701
G1 X106.059 Y129.308 E-.54182
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 34/95
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.7 I.576 J1.072 P1  F42000
G1 X151.407 Y104.97 Z3.7
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.697 Y105.058 E.00493
G3 X152.66 Y106.49 I-.595 J1.439 E.02969
G1 X152.66 Y121.31 E.24066
G3 X151.11 Y122.86 I-1.557 J-.008 E.03947
G1 X136.29 Y122.86 E.24066
G3 X134.74 Y121.31 I.008 J-1.557 E.03947
G1 X134.74 Y106.49 E.24066
G3 X136.29 Y104.94 I1.557 J.008 E.03947
G1 X151.11 Y104.94 E.24066
G3 X151.348 Y104.959 I-.008 J1.557 E.00387
; WIPE_START
M204 S6000
G1 X151.697 Y105.058 E-.13806
G1 X151.967 Y105.202 E-.11626
G1 X152.204 Y105.396 E-.1163
G1 X152.398 Y105.633 E-.1163
G1 X152.542 Y105.903 E-.11627
G1 X152.631 Y106.195 E-.1163
G1 X152.641 Y106.302 E-.04052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.151 Y104.838 Z3.8 F42000
G1 X143.765 Y104.567 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.641 Y104.572 E.12789
G3 X153.038 Y106.135 I-.177 J1.563 E.03725
G1 X153.037 Y121.709 E.2529
G3 X151.463 Y123.238 I-1.573 J-.045 E.03943
M73 P64 R10
G1 X135.891 Y123.237 E.25286
G3 X134.362 Y121.663 I.042 J-1.571 E.03944
G1 X134.363 Y106.091 E.25287
G3 X135.891 Y104.563 I1.573 J.045 E.03868
G1 X143.705 Y104.567 E.12689
; WIPE_START
M204 S6000
G1 X145.705 Y104.568 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 34 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer34 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.707 Y104.818 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.084422
G1 F15000
M204 S6000
G1 X151.869 Y104.871 E.00044
; LINE_WIDTH: 0.13044
G3 X152.609 Y105.486 I-.578 J1.447 E.00434
; LINE_WIDTH: 0.102463
G3 X152.76 Y105.809 I-2.148 J1.201 E.00118
G1 X152.784 Y105.901 E.00031
M204 S10000
G1 X152.782 Y121.907 F42000
; LINE_WIDTH: 0.103349
G1 F15000
M204 S6000
G1 X152.76 Y121.991 E.00029
G3 X152.609 Y122.314 I-2.251 J-.853 E.00119
; LINE_WIDTH: 0.130656
G3 X151.87 Y122.929 I-1.33 J-.848 E.00435
; LINE_WIDTH: 0.0844929
G1 X151.707 Y122.982 E.00044
M204 S10000
G1 X135.693 Y122.982 F42000
; LINE_WIDTH: 0.103349
G1 F15000
M204 S6000
G1 X135.609 Y122.96 E.00029
G3 X135.285 Y122.81 I.854 J-2.253 E.00119
; LINE_WIDTH: 0.13047
G3 X134.671 Y122.071 I.813 J-1.3 E.00434
; LINE_WIDTH: 0.0842818
G1 X134.615 Y121.899 E.00046
M204 S10000
G1 X134.618 Y105.893 F42000
; LINE_WIDTH: 0.0844231
G1 F15000
M204 S6000
G1 X134.671 Y105.731 E.00044
; LINE_WIDTH: 0.130534
G3 X135.286 Y104.991 I1.445 J.576 E.00435
; LINE_WIDTH: 0.10315
G3 X135.609 Y104.84 I1.115 J1.963 E.00119
G1 X135.693 Y104.818 E.00029
; WIPE_START
G1 X135.609 Y104.84 E-.14814
G1 X135.286 Y104.991 E-.61186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.509 Y110.556 Z3.8 F42000
G1 X142.83 Y113.03 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02286
G3 X142.83 Y111.622 I2.33 J.923 E.03325
G1 X142.83 Y112.97 E.02188
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53556
G1 X141.629 Y112.611 E-.17764
G1 X141.704 Y112.513 E-.0468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.893 Y111.597 E.02632
G3 X143.796 Y111.462 I.883 J2.818 E.01488
G3 X144.456 Y111.583 I-.276 J3.382 E.01092
; WIPE_START
M204 S6000
G1 X142.893 Y111.597 E-.59401
G1 X143.317 Y111.494 E-.166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.023 J2.259 E.03118
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04956
G1 X145.092 Y111.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.136 E.00084
G3 X146 Y114.711 I-2.389 J.762 E.02602
G1 X146 Y113.147 E.0254
; WIPE_START
M204 S6000
G1 X146.017 Y113.136 E-.0078
G1 X146.122 Y113.608 E-.18379
G1 X146.138 Y113.999 E-.14888
G1 X146.092 Y114.384 E-.14716
G1 X146 Y114.711 E-.1292
G1 X146 Y114.334 E-.14318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.909 Y114.936 E.00292
G3 X144.57 Y116.178 I-2.24 J-1.073 E.03037
G1 X144.57 Y114.83 E.02188
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.909 Y114.936 E-.0683
G1 X145.699 Y115.288 E-.15587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.507 Y116.203 E.02632
G3 X142.943 Y116.219 I-.807 J-2.379 E.02582
; WIPE_START
M204 S6000
G1 X144.507 Y116.203 E-.59425
G1 X144.083 Y116.306 E-.16575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.87 J-2.279 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08511
G1 X142.369 Y115.945 E-.1116
G1 X142.311 Y115.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.33 Y113.323 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.087 I2.364 J.576 E.004
G1 X141.4 Y114.711 E.02636
G3 X141.316 Y113.382 I2.294 J-.812 E.0219
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.087 E-.11637
G1 X141.4 Y114.711 E-.61699
G1 X141.383 Y114.643 E-.02663
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.766 Y119.812 Z3.8 F42000
G1 X103.04 Y149.93 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.038 Y149.918 E.0002
G3 X102.991 Y149.575 I1.871 J-.427 E.00563
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.973 Y151.409 I-1.921 J-.013 E.04743
G1 X104.896 Y151.41 E.29353
G3 X103.137 Y150.23 I.012 J-1.919 E.03643
G1 X103.059 Y149.987 E.00414
; WIPE_START
M204 S6000
G1 X103.038 Y149.918 E-.02741
G1 X102.991 Y149.575 E-.13159
G1 X102.991 Y147.994 E-.601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.374 Z3.8 F42000
G1 X104.091 Y129.07 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.0069
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.184 J2.193 E.05305
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.198 J-.096 E.05447
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05448
G1 X102.412 Y131.112 E.30342
G3 X104.034 Y129.086 I2.195 J.095 E.04509
M204 S10000
G1 X104.15 Y129.394 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.263235
G1 F15000
M204 S6000
G1 X104.169 Y129.388 E.0002
G3 X104.377 Y129.338 I.609 J2.084 E.00211
; LINE_WIDTH: 0.187988
G3 X104.521 Y129.318 I.428 J2.447 E.00099
G1 X104.892 Y129.301 E.00252
G1 X122.983 Y129.301 E.12275
G1 X123.35 Y129.327 E.0025
; LINE_WIDTH: 0.250951
G3 X123.749 Y129.426 I-.354 J2.283 E.00385
; LINE_WIDTH: 0.29959
G3 X124.899 Y130.47 I-.684 J1.908 E.01807
G1 X124.937 Y130.555 E.00106
; LINE_WIDTH: 0.258187
G3 X125.067 Y131.009 I-2.018 J.824 E.00456
; LINE_WIDTH: 0.188432
G3 X125.09 Y131.21 I-2.47 J.384 E.00138
G1 X125.099 Y149.504 E.12446
G3 X125.077 Y149.925 I-4.285 J-.019 E.00287
; LINE_WIDTH: 0.247861
G3 X125.025 Y150.186 I-1.831 J-.223 E.00245
G1 X124.981 Y150.33 E.00139
; LINE_WIDTH: 0.298402
G3 X123.93 Y151.5 I-1.919 J-.667 E.01823
G1 X123.774 Y151.566 E.00191
; LINE_WIDTH: 0.256313
G3 X123.423 Y151.662 I-.708 J-1.901 E.00348
; LINE_WIDTH: 0.188507
G3 X123.08 Y151.696 I-.45 J-2.729 E.00235
G1 X104.893 Y151.699 E.12379
G3 X104.471 Y151.676 I.007 J-4.035 E.00287
; LINE_WIDTH: 0.249432
G3 X104.051 Y151.574 I.254 J-1.965 E.00403
; LINE_WIDTH: 0.299531
G3 X102.898 Y150.526 I.69 J-1.916 E.01812
G1 X102.863 Y150.445 E.00099
; LINE_WIDTH: 0.258068
G3 X102.733 Y149.991 I2.074 J-.84 E.00456
; LINE_WIDTH: 0.18816
G3 X102.71 Y149.795 I4.878 J-.663 E.00134
G1 X102.701 Y131.489 E.12434
; LINE_WIDTH: 0.197968
G1 X102.717 Y131.123 E.00263
; LINE_WIDTH: 0.243963
G3 X102.77 Y130.832 I2.184 J.243 E.00268
G1 X102.81 Y130.697 E.00128
; LINE_WIDTH: 0.29973
G3 X103.824 Y129.523 I1.93 J.643 E.01803
G1 X103.881 Y129.495 E.00072
; LINE_WIDTH: 0.263235
G1 X104.094 Y129.415 E.00224
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.169 Y129.388 E-.0304
G1 X104.377 Y129.338 E-.08124
G1 X104.521 Y129.318 E-.05536
G1 X104.892 Y129.301 E-.14105
G1 X106.081 Y129.301 E-.45195
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 35/95
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.576 J1.072 P1  F42000
G1 X151.419 Y104.948 Z3.8
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.712 Y105.037 E.00497
G3 X152.682 Y106.48 I-.599 J1.451 E.02992
G1 X152.682 Y121.32 E.24098
G3 X151.12 Y122.882 I-1.57 J-.008 E.03978
G1 X136.28 Y122.882 E.24098
G3 X134.718 Y121.32 I.008 J-1.57 E.03978
G1 X134.718 Y106.48 E.24098
G3 X136.28 Y104.918 I1.57 J.008 E.03978
G1 X151.12 Y104.918 E.24098
G3 X151.36 Y104.938 I-.008 J1.57 E.00391
; WIPE_START
M204 S6000
G1 X151.712 Y105.037 E-.13887
G1 X151.984 Y105.182 E-.11717
G1 X152.222 Y105.378 E-.11719
G1 X152.418 Y105.616 E-.11721
G1 X152.563 Y105.888 E-.11721
G1 X152.653 Y106.183 E-.11718
G1 X152.662 Y106.275 E-.03518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.171 Y104.813 Z3.9 F42000
G1 X143.766 Y104.539 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.662 Y104.544 E.12822
G3 X153.066 Y106.118 I-.193 J1.586 E.03742
G1 X153.065 Y121.728 E.25347
G3 X151.48 Y123.266 I-1.593 J-.055 E.03964
G1 X135.872 Y123.265 E.25344
G3 X134.334 Y121.68 I.048 J-1.586 E.03968
G1 X134.335 Y106.072 E.25344
G3 X135.872 Y104.535 I1.592 J.055 E.03886
G1 X143.706 Y104.539 E.1272
; WIPE_START
M204 S6000
G1 X145.706 Y104.54 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 35 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer35 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.653 Y104.777 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881928
G1 F15000
M204 S6000
G3 X151.801 Y104.813 I-.295 J1.501 E.00041
G1 X151.889 Y104.847 E.00026
; LINE_WIDTH: 0.13725
G3 X152.734 Y105.667 I-.533 J1.395 E.00571
; LINE_WIDTH: 0.0923307
G3 X152.785 Y105.793 I-1.898 J.857 E.00039
G1 X152.824 Y105.95 E.00047
M204 S10000
G1 X152.823 Y121.853 F42000
; LINE_WIDTH: 0.088564
G1 F15000
M204 S6000
G3 X152.753 Y122.089 I-.96 J-.159 E.00067
; LINE_WIDTH: 0.136255
G3 X151.889 Y122.953 I-1.415 J-.551 E.00588
; LINE_WIDTH: 0.0886035
G1 X151.801 Y122.987 E.00026
G3 X151.653 Y123.023 I-.448 J-1.519 E.00042
M204 S10000
G1 X135.747 Y123.023 F42000
; LINE_WIDTH: 0.0885098
G1 F15000
M204 S6000
G3 X135.511 Y122.953 I.159 J-.961 E.00067
; LINE_WIDTH: 0.136264
G3 X134.648 Y122.091 I.546 J-1.41 E.00588
; LINE_WIDTH: 0.0882839
G1 X134.613 Y122.001 E.00026
G3 X134.576 Y121.848 I1.603 J-.471 E.00043
M204 S10000
G1 X134.577 Y105.947 F42000
; LINE_WIDTH: 0.088564
G1 F15000
M204 S6000
G3 X134.613 Y105.799 I1.577 J.306 E.00042
G1 X134.647 Y105.711 E.00026
; LINE_WIDTH: 0.138139
G3 X135.417 Y104.889 I1.407 J.546 E.00549
; LINE_WIDTH: 0.0968368
G3 X135.747 Y104.777 I.518 J.982 E.00107
; WIPE_START
G1 X135.599 Y104.813 E-.3308
G1 X135.417 Y104.889 E-.4292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.556 Y110.532 Z3.9 F42000
G1 X142.83 Y113.03 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.622 I2.331 J.923 E.03325
G1 X142.83 Y112.97 E.02188
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53558
G1 X141.628 Y112.611 E-.17738
G1 X141.704 Y112.513 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.893 Y111.597 E.02632
G3 X143.793 Y111.462 I.807 J2.314 E.01487
G3 X144.456 Y111.582 I-.169 J2.839 E.01097
; WIPE_START
M204 S6000
G1 X142.893 Y111.597 E-.59416
G1 X143.317 Y111.494 E-.16584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.69 Y111.67 E.0021
G3 X145.979 Y113.03 I-1.008 J2.247 E.03122
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.69 Y111.67 E-.04908
G1 X145.092 Y111.898 E-.17554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.135 E.00083
G3 X146 Y114.71 I-2.456 J.761 E.02598
G1 X146 Y113.147 E.02538
; WIPE_START
M204 S6000
G1 X146.017 Y113.135 E-.00782
G1 X146.109 Y113.512 E-.14738
G1 X146.138 Y113.997 E-.18454
G1 X146.109 Y114.285 E-.10996
G1 X146 Y114.71 E-.16669
G1 X146 Y114.332 E-.14362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.977 Y114.77 E.02285
G1 X145.949 Y114.845 E.0013
G3 X144.57 Y116.178 I-2.247 J-.944 E.03202
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.977 Y114.77 E-.53532
G1 X145.949 Y114.845 E-.03037
G1 X145.719 Y115.271 E-.18399
M73 P65 R10
G1 X145.701 Y115.291 E-.01032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.416 Y116.232 E.00158
G3 X142.943 Y116.219 I-.716 J-2.338 E.0243
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59481
G1 X144.416 Y116.232 E-.03702
G1 X144.087 Y116.306 E-.12817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.895 J-2.304 E.03328
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.583 Y116.069 E-.10259
G1 X142.308 Y115.902 E-.12202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.332 Y113.324 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.087 I2.438 J.576 E.004
G1 X141.4 Y114.713 E.0264
G3 X141.318 Y113.382 I2.37 J-.813 E.02191
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.087 E-.1164
G1 X141.4 Y114.713 E-.61787
G1 X141.382 Y114.648 E-.02574
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.766 Y119.816 Z3.9 F42000
G1 X103.041 Y149.932 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00586
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.932 J.025 E.04609
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.092 J1.925 E.04619
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.012 E.04738
G1 X104.898 Y151.41 E.29353
G3 X103.055 Y149.99 I.008 J-1.917 E.04059
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15979
G1 X102.991 Y147.995 E-.60021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z3.9 F42000
G1 X104.091 Y129.07 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00693
G1 X123.373 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.053
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.512 Y151.988 E.30339
G3 X102.41 Y149.797 I.091 J-2.191 E.05447
G1 X102.412 Y131.112 E.3034
G3 X104.034 Y129.086 I2.195 J.095 E.04509
M204 S10000
G1 X104.111 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.24966
G1 F15000
M204 S6000
G1 X104.459 Y129.326 E.00333
; LINE_WIDTH: 0.187611
G1 X104.892 Y129.301 E.00293
G1 X122.983 Y129.301 E.12247
G1 X123.246 Y129.314 E.00178
; LINE_WIDTH: 0.241218
G3 X123.415 Y129.336 I-.337 J3.211 E.00152
G1 X123.683 Y129.403 E.00247
; LINE_WIDTH: 0.299375
G3 X124.819 Y130.318 I-.629 J1.945 E.01689
G1 X124.902 Y130.474 E.002
; LINE_WIDTH: 0.263527
G3 X125.057 Y130.954 I-1.885 J.877 E.00498
G1 X125.062 Y130.977 E.00023
; LINE_WIDTH: 0.188512
G3 X125.085 Y131.146 I-2.807 J.464 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.249705
G3 X124.973 Y150.352 I-2.185 J-.308 E.00404
; LINE_WIDTH: 0.300542
G3 X123.926 Y151.502 I-1.909 J-.688 E.01815
G1 X123.916 Y151.506 E.00012
; LINE_WIDTH: 0.263646
G3 X123.427 Y151.661 I-.91 J-2.033 E.00507
; LINE_WIDTH: 0.188428
G1 X122.983 Y151.699 E.00303
G1 X104.894 Y151.699 E.12306
G1 X104.521 Y151.682 E.00254
; LINE_WIDTH: 0.242677
G3 X104.218 Y151.626 I.221 J-2.036 E.00278
G1 X104.117 Y151.597 E.00095
; LINE_WIDTH: 0.299398
G3 X102.899 Y150.525 I.636 J-1.952 E.01889
; LINE_WIDTH: 0.263303
G3 X102.777 Y150.195 I1.743 J-.83 E.00348
G1 X102.737 Y150.015 E.00182
; LINE_WIDTH: 0.18821
G3 X102.715 Y149.854 I3.036 J-.485 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12293
; LINE_WIDTH: 0.189333
G1 X102.704 Y131.328 E.0011
; LINE_WIDTH: 0.216255
G1 X102.744 Y130.953 E.003
; LINE_WIDTH: 0.257729
G3 X102.787 Y130.77 I2.104 J.404 E.00181
G1 X102.835 Y130.627 E.00146
; LINE_WIDTH: 0.298582
G3 X104.054 Y129.425 I1.895 J.702 E.01995
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.459 Y129.326 E-.15867
G1 X104.892 Y129.301 E-.16465
G1 X106.041 Y129.301 E-.43668
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 36/95
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.9 I.576 J1.072 P1  F42000
G1 X151.431 Y104.926 Z3.9
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.726 Y105.016 E.005
G3 X152.704 Y106.47 I-.604 J1.462 E.03016
G1 X152.704 Y121.33 E.24129
G3 X151.13 Y122.904 I-1.582 J-.008 E.04009
G1 X136.27 Y122.904 E.24129
G3 X134.696 Y121.33 I.008 J-1.582 E.04009
G1 X134.696 Y106.47 E.24129
G3 X136.27 Y104.896 I1.582 J.008 E.04009
G1 X151.13 Y104.896 E.24129
G3 X151.372 Y104.916 I-.008 J1.582 E.00395
; WIPE_START
M204 S6000
G1 X151.726 Y105.016 E-.13971
G1 X152 Y105.162 E-.11809
G1 X152.241 Y105.359 E-.11809
G1 X152.438 Y105.6 E-.11813
G1 X152.584 Y105.874 E-.11808
G1 X152.674 Y106.171 E-.11812
G1 X152.682 Y106.249 E-.02979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.191 Y104.789 Z4 F42000
G1 X143.766 Y104.511 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.681 Y104.516 E.12852
G3 X153.095 Y106.101 I-.195 J1.597 E.03768
G1 X153.094 Y121.747 E.25405
G3 X151.497 Y123.295 I-1.604 J-.057 E.0399
G1 X135.853 Y123.294 E.25402
M73 P65 R9
G3 X134.305 Y121.697 I.057 J-1.604 E.0399
G1 X134.306 Y106.054 E.25402
G3 X135.853 Y104.506 I1.604 J.057 E.0391
G1 X143.706 Y104.511 E.12751
; WIPE_START
M204 S6000
G1 X145.706 Y104.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 36 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer36 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.621 Y104.743 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0927183
G1 F15000
M204 S6000
G3 X151.817 Y104.788 I-.766 J3.764 E.00058
G1 X151.908 Y104.824 E.00029
; LINE_WIDTH: 0.149141
G3 X152.638 Y105.419 I-.628 J1.515 E.00497
; LINE_WIDTH: 0.130763
G3 X152.796 Y105.74 I-1.6 J.988 E.0016
; LINE_WIDTH: 0.0891976
G3 X152.856 Y105.974 I-1.706 J.563 E.00067
M204 S10000
G1 X152.857 Y121.821 F42000
; LINE_WIDTH: 0.0927531
G1 F15000
M204 S6000
G3 X152.776 Y122.108 I-1.052 J-.142 E.00087
; LINE_WIDTH: 0.145631
G3 X151.91 Y122.976 I-1.413 J-.546 E.00638
; LINE_WIDTH: 0.0928847
G1 X151.816 Y123.011 E.00029
G3 X151.622 Y123.057 I-.58 J-2.046 E.00058
M204 S10000
G1 X135.779 Y123.057 F42000
; LINE_WIDTH: 0.092692
G1 F15000
M204 S6000
G3 X135.492 Y122.976 I.142 J-1.053 E.00087
; LINE_WIDTH: 0.145647
G3 X134.625 Y122.11 I.545 J-1.414 E.00638
; LINE_WIDTH: 0.0935102
G1 X134.584 Y122.002 E.00034
G3 X134.543 Y121.821 I2.029 J-.552 E.00055
M204 S10000
G1 X134.543 Y105.979 F42000
; LINE_WIDTH: 0.0928707
G1 F15000
M204 S6000
G3 X134.589 Y105.784 I1.667 J.289 E.00059
G1 X134.624 Y105.691 E.00029
; LINE_WIDTH: 0.145633
G3 X135.491 Y104.824 I1.413 J.546 E.00639
; LINE_WIDTH: 0.0928276
G3 X135.779 Y104.743 I.431 J.973 E.00087
; WIPE_START
G1 X135.491 Y104.824 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.579 Y110.513 Z4 F42000
G1 X142.83 Y113.03 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.423 Y113.03 E.02285
G3 X142.83 Y111.621 I2.319 J.908 E.03327
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.423 Y113.03 E-.53532
G1 X141.601 Y112.658 E-.15676
G1 X141.699 Y112.509 E-.06792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.89 Y111.598 E.02637
G3 X143.791 Y111.462 I.887 J2.822 E.01485
G3 X144.456 Y111.583 I-.268 J3.372 E.011
; WIPE_START
M204 S6000
G1 X142.89 Y111.598 E-.59517
G1 X143.311 Y111.496 E-.16484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.031 J2.266 E.03117
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04956
G1 X145.092 Y111.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.03 Y113.177 E.00151
G3 X146 Y114.713 I-2.329 J.723 E.02538
G1 X146 Y113.149 E.0254
; WIPE_START
M204 S6000
G1 X146.03 Y113.177 E-.01566
G1 X146.109 Y113.514 E-.1316
G1 X146.138 Y113.999 E-.18453
G1 X146.092 Y114.383 E-.14706
G1 X146 Y114.713 E-.13007
G1 X146 Y114.315 E-.15108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.927 Y114.895 E.0022
G3 X144.57 Y116.178 I-2.259 J-1.03 E.03109
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53589
G1 X145.927 Y114.895 E-.05146
G1 X145.717 Y115.273 E-.16409
G1 X145.703 Y115.29 E-.00857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.415 Y116.233 E.0016
G3 X142.943 Y116.219 I-.715 J-2.339 E.02428
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59482
G1 X144.415 Y116.233 E-.03754
G1 X144.087 Y116.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.877 J-2.287 E.03331
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08508
G1 X142.368 Y115.945 E-.11169
G1 X142.31 Y115.9 E-.02785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.417 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.09 I2.375 J.484 E.00551
G1 X141.4 Y114.711 E.02632
G3 X141.298 Y113.476 I2.285 J-.81 E.02036
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.09 E-.1515
G1 X141.4 Y114.692 E-.6085
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.779 Y119.855 Z4 F42000
G1 X103.04 Y149.93 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.037 Y149.917 E.00022
G3 X102.991 Y149.575 I1.869 J-.423 E.00561
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.097 J1.93 E.04616
G1 X124.81 Y149.502 E.29354
G3 X122.973 Y151.409 I-1.933 J-.025 E.04735
G1 X104.898 Y151.41 E.2935
G3 X103.137 Y150.23 I.008 J-1.916 E.03648
G1 X103.059 Y149.987 E.00414
; WIPE_START
M204 S6000
G1 X103.037 Y149.917 E-.02803
G1 X102.991 Y149.575 E-.13103
G1 X102.991 Y147.994 E-.60094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.374 Z4 F42000
G1 X104.092 Y129.07 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00693
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.797 I.097 J-2.199 E.05445
G1 X102.412 Y131.114 E.30336
G3 X104.034 Y129.086 I2.198 J.096 E.0451
M204 S10000
G1 X104.147 Y129.395 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261855
G1 F15000
M204 S6000
G1 X104.165 Y129.389 E.00019
G3 X104.374 Y129.338 I.639 J2.164 E.00211
G1 X104.385 Y129.337 E.00011
; LINE_WIDTH: 0.187785
G3 X104.55 Y129.315 I.359 J2.077 E.00113
G1 X104.892 Y129.301 E.00232
G1 X122.983 Y129.301 E.1226
G1 X123.245 Y129.314 E.00178
; LINE_WIDTH: 0.241146
G3 X123.415 Y129.336 I-.608 J5.288 E.00154
G1 X123.683 Y129.403 E.00247
; LINE_WIDTH: 0.29755
G3 X124.861 Y130.393 I-.62 J1.934 E.01776
G1 X124.968 Y130.631 E.00293
; LINE_WIDTH: 0.251889
G3 X125.074 Y131.05 I-1.984 J.725 E.00406
; LINE_WIDTH: 0.18833
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.504 E.12298
G3 X125.077 Y149.925 I-4.293 J-.019 E.00286
; LINE_WIDTH: 0.249342
G3 X124.973 Y150.353 I-2.188 J-.302 E.00409
; LINE_WIDTH: 0.300255
G3 X124.007 Y151.462 I-1.926 J-.703 E.01709
G1 X123.891 Y151.517 E.00145
; LINE_WIDTH: 0.262046
G3 X123.595 Y151.623 I-.801 J-1.763 E.00309
G1 X123.42 Y151.663 E.00175
; LINE_WIDTH: 0.188406
G1 X122.979 Y151.699 E.00301
G1 X104.894 Y151.699 E.12302
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243954
G3 X104.213 Y151.625 I.217 J-2.063 E.00289
G1 X104.09 Y151.588 E.00116
; LINE_WIDTH: 0.298653
G3 X102.938 Y150.607 I.647 J-1.926 E.01751
G1 X102.859 Y150.436 E.00212
; LINE_WIDTH: 0.25792
G3 X102.733 Y149.99 I1.899 J-.779 E.00449
; LINE_WIDTH: 0.188157
G3 X102.71 Y149.792 I4.092 J-.568 E.00135
G1 X102.701 Y131.489 E.12431
; LINE_WIDTH: 0.198097
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242855
G3 X102.8 Y130.727 I2.254 J.261 E.00368
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.299006
G3 X103.635 Y129.63 I1.935 J.62 E.01578
G1 X103.908 Y129.483 E.00351
; LINE_WIDTH: 0.261855
G1 X104.091 Y129.416 E.0019
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.165 Y129.389 E-.03005
G1 X104.374 Y129.338 E-.08175
G1 X104.385 Y129.337 E-.00409
G1 X104.55 Y129.315 E-.06328
G1 X104.892 Y129.301 E-.12997
G1 X106.078 Y129.301 E-.45087
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 37/95
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.576 J1.072 P1  F42000
G1 X151.444 Y104.905 Z4
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.741 Y104.995 E.00504
G3 X152.726 Y106.46 I-.609 J1.473 E.03039
G1 X152.726 Y121.34 E.24161
G3 X151.14 Y122.926 I-1.594 J-.008 E.0404
G1 X136.26 Y122.926 E.24161
G3 X134.674 Y121.34 I.008 J-1.594 E.0404
G1 X134.674 Y106.46 E.24161
G3 X136.26 Y104.874 I1.594 J.008 E.0404
G1 X151.14 Y104.874 E.24161
G3 X151.385 Y104.894 I-.008 J1.594 E.004
; WIPE_START
M204 S6000
G1 X151.741 Y104.995 E-.14054
G1 X152.017 Y105.142 E-.11898
G1 X152.259 Y105.341 E-.11903
G1 X152.458 Y105.583 E-.11902
G1 X152.605 Y105.859 E-.11899
G1 X152.696 Y106.159 E-.11902
G1 X152.702 Y106.223 E-.02442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.211 Y104.764 Z4.1 F42000
G1 X143.767 Y104.483 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
M73 P66 R9
G1 X151.7 Y104.487 E.12882
G3 X153.123 Y106.084 I-.197 J1.608 E.03794
G1 X153.122 Y121.765 E.25462
G3 X151.514 Y123.323 I-1.615 J-.058 E.04016
G1 X135.835 Y123.322 E.25459
G3 X134.277 Y121.714 I.058 J-1.615 E.04016
G1 X134.278 Y106.035 E.2546
G3 X135.835 Y104.478 I1.615 J.058 E.03933
G1 X143.707 Y104.483 E.12782
; WIPE_START
M204 S6000
G1 X145.707 Y104.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 37 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer37 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.603 Y104.712 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.080434
G1 F15000
M204 S6000
G1 X151.673 Y104.725 E.00017
; LINE_WIDTH: 0.103367
G3 X151.832 Y104.763 I-.316 J1.669 E.00055
G1 X151.928 Y104.801 E.00034
; LINE_WIDTH: 0.1584
G3 X152.66 Y105.397 I-.634 J1.524 E.00534
; LINE_WIDTH: 0.139753
G3 X152.82 Y105.721 I-1.577 J.981 E.00174
; LINE_WIDTH: 0.0943791
G3 X152.889 Y105.998 I-1.802 J.597 E.00085
M204 S10000
G1 X152.888 Y121.803 F42000
; LINE_WIDTH: 0.0915567
G1 F15000
M204 S6000
G3 X152.834 Y122.04 I-3.545 J-.679 E.00069
; LINE_WIDTH: 0.135403
G3 X152.68 Y122.373 I-2.274 J-.855 E.0017
; LINE_WIDTH: 0.158049
G3 X151.928 Y122.999 I-1.369 J-.878 E.00553
; LINE_WIDTH: 0.103587
G1 X151.832 Y123.037 E.00034
G3 X151.676 Y123.075 I-.462 J-1.578 E.00054
; LINE_WIDTH: 0.0806305
G1 X151.607 Y123.087 E.00017
M204 S10000
G1 X135.797 Y123.088 F42000
; LINE_WIDTH: 0.0915519
G1 F15000
M204 S6000
G3 X135.56 Y123.034 I.687 J-3.581 E.00069
; LINE_WIDTH: 0.135406
G3 X135.227 Y122.88 I.855 J-2.274 E.0017
; LINE_WIDTH: 0.158075
G3 X134.601 Y122.129 I.878 J-1.369 E.00553
; LINE_WIDTH: 0.107232
G1 X134.535 Y121.922 E.00076
; LINE_WIDTH: 0.0840766
G1 X134.513 Y121.806 E.0003
M204 S10000
G1 X134.512 Y105.997 F42000
; LINE_WIDTH: 0.080434
G1 F15000
M204 S6000
G1 X134.525 Y105.927 E.00017
; LINE_WIDTH: 0.103361
G3 X134.563 Y105.768 I1.669 J.316 E.00055
G1 X134.601 Y105.672 E.00034
; LINE_WIDTH: 0.158222
G3 X135.227 Y104.92 I1.473 J.591 E.00554
; LINE_WIDTH: 0.135298
G3 X135.56 Y104.766 I1.144 J2.024 E.0017
; LINE_WIDTH: 0.0915653
G3 X135.797 Y104.712 I.92 J3.509 E.00069
; WIPE_START
G1 X135.56 Y104.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.601 Y110.496 Z4.1 F42000
G1 X142.83 Y113.03 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.622 I2.303 J.896 E.03328
G1 X142.83 Y112.97 E.02188
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.628 Y112.612 E-.17706
G1 X141.703 Y112.514 E-.04711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.893 Y111.597 E.02632
G3 X143.788 Y111.462 I.808 J2.315 E.01479
G3 X144.456 Y111.582 I-.201 J3.038 E.01105
; WIPE_START
M204 S6000
G1 X142.893 Y111.597 E-.59415
G1 X143.317 Y111.494 E-.16586
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-.995 J2.232 E.03121
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04963
G1 X145.092 Y111.898 E-.17499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.029 Y113.175 E.00147
G3 X146 Y114.712 I-2.326 J.725 E.02541
G1 X146 Y113.149 E.02539
; WIPE_START
M204 S6000
G1 X146.029 Y113.175 E-.01484
G1 X146.109 Y113.514 E-.13233
G1 X146.138 Y113.999 E-.18475
G1 X146.092 Y114.383 E-.14701
G1 X146 Y114.712 E-.1299
G1 X146 Y114.315 E-.15117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.178 I-2.26 J-.96 E.03199
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53561
G1 X145.949 Y114.846 E-.03087
G1 X145.717 Y115.272 E-.18448
G1 X145.702 Y115.291 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.417 Y116.232 E.00157
G3 X142.943 Y116.219 I-.716 J-2.366 E.0243
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59476
G1 X144.417 Y116.232 E-.03681
G1 X144.087 Y116.306 E-.12843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.863 J-2.272 E.03332
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08504
G1 X142.369 Y115.945 E-.11167
G1 X142.311 Y115.899 E-.02791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.332 Y113.325 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.426 J.575 E.00399
G1 X141.4 Y114.711 E.02634
G3 X141.318 Y113.384 I2.358 J-.811 E.02186
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.11612
G1 X141.4 Y114.711 E-.61638
G1 X141.382 Y114.641 E-.0275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.766 Y119.81 Z4.1 F42000
G1 X103.04 Y149.931 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.037 Y149.916 E.00025
G3 X102.991 Y149.575 I1.871 J-.425 E.00559
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.926 J.019 E.04612
G1 X122.976 Y129.591 E.29595
G3 X124.809 Y131.425 I-.089 J1.922 E.04619
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.912 J-.006 E.04742
G1 X104.898 Y151.41 E.29354
G3 X103.085 Y150.089 I.01 J-1.919 E.03891
G1 X103.056 Y149.989 E.00169
; WIPE_START
M204 S6000
G1 X103.037 Y149.916 E-.02853
G1 X102.991 Y149.575 E-.13071
G1 X102.991 Y147.994 E-.60076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.375 Z4.1 F42000
G1 X104.092 Y129.07 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00693
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.089 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.797 I.096 J-2.198 E.05445
G1 X102.412 Y131.114 E.30337
G3 X104.034 Y129.086 I2.198 J.096 E.04511
M204 S10000
G1 X104.112 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.249557
G1 F15000
M204 S6000
G1 X104.459 Y129.326 E.00332
; LINE_WIDTH: 0.187627
G1 X104.892 Y129.301 E.00293
G1 X122.985 Y129.301 E.1225
G1 X123.244 Y129.315 E.00176
; LINE_WIDTH: 0.240748
G3 X123.63 Y129.387 I-.187 J2.067 E.00351
G1 X123.67 Y129.399 E.00037
; LINE_WIDTH: 0.29689
G3 X124.97 Y130.639 I-.604 J1.934 E.02089
; LINE_WIDTH: 0.252031
G3 X125.074 Y131.05 I-1.864 J.689 E.00399
; LINE_WIDTH: 0.188543
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.508 E.12316
G3 X125.063 Y150.019 I-3.439 J.012 E.00349
; LINE_WIDTH: 0.252357
G3 X125.025 Y150.186 I-2.052 J-.371 E.00161
G1 X124.989 Y150.308 E.0012
; LINE_WIDTH: 0.298038
G3 X123.779 Y151.564 I-1.924 J-.643 E.02031
; LINE_WIDTH: 0.252471
G3 X123.341 Y151.675 I-.745 J-2.019 E.00426
; LINE_WIDTH: 0.188314
G1 X122.983 Y151.699 E.00244
G1 X104.896 Y151.699 E.12296
G3 X104.475 Y151.677 I.019 J-4.299 E.00286
; LINE_WIDTH: 0.24918
G3 X104.051 Y151.574 I.301 J-2.181 E.00406
; LINE_WIDTH: 0.298454
G3 X102.898 Y150.526 I.689 J-1.915 E.01805
G1 X102.832 Y150.369 E.00192
; LINE_WIDTH: 0.254172
G3 X102.733 Y149.989 I2.197 J-.779 E.00373
; LINE_WIDTH: 0.188154
G3 X102.71 Y149.792 I4.046 J-.561 E.00134
G1 X102.701 Y131.489 E.12431
; LINE_WIDTH: 0.196472
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240425
G3 X102.8 Y130.727 I2.125 J.208 E.00385
; LINE_WIDTH: 0.296775
G3 X104.021 Y129.437 I1.931 J.604 E.02064
G1 X104.054 Y129.425 E.00039
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.459 Y129.326 E-.15852
G1 X104.892 Y129.301 E-.16468
G1 X106.041 Y129.301 E-.43679
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 38/95
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.1 I.576 J1.072 P1  F42000
G1 X151.456 Y104.883 Z4.1
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.755 Y104.974 E.00508
G3 X152.748 Y106.451 I-.613 J1.484 E.03062
G1 X152.748 Y121.349 E.24193
G3 X151.149 Y122.948 I-1.606 J-.008 E.04072
G1 X136.251 Y122.948 E.24193
G3 X134.652 Y121.349 I.008 J-1.606 E.04072
G1 X134.652 Y106.451 E.24193
G3 X136.251 Y104.852 I1.606 J.008 E.04072
G1 X151.149 Y104.852 E.24193
G3 X151.397 Y104.873 I-.008 J1.606 E.00404
; WIPE_START
M204 S6000
G1 X151.755 Y104.974 E-.14141
G1 X152.033 Y105.122 E-.11989
G1 X152.277 Y105.323 E-.11991
G1 X152.478 Y105.567 E-.11995
G1 X152.626 Y105.845 E-.11989
G1 X152.718 Y106.147 E-.11994
G1 X152.723 Y106.197 E-.019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.231 Y104.739 Z4.2 F42000
G1 X143.767 Y104.454 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.718 Y104.459 E.12912
G3 X153.151 Y106.067 I-.199 J1.619 E.03819
G1 X153.15 Y121.783 E.2552
G3 X151.531 Y123.351 I-1.627 J-.06 E.04043
G1 X135.817 Y123.35 E.25517
G3 X134.249 Y121.731 I.06 J-1.627 E.04043
G1 X134.25 Y106.017 E.25517
G3 X135.817 Y104.45 I1.627 J.06 E.03958
G1 X143.707 Y104.454 E.12812
; WIPE_START
M204 S6000
G1 X145.707 Y104.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 38 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer38 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.585 Y104.681 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0845066
G1 F15000
M204 S6000
G1 X151.691 Y104.701 E.00028
; LINE_WIDTH: 0.11182
G1 X151.948 Y104.777 E.00098
; LINE_WIDTH: 0.167401
G3 X152.703 Y105.408 I-.598 J1.484 E.00595
; LINE_WIDTH: 0.143986
G3 X152.859 Y105.743 I-2.29 J1.271 E.00185
; LINE_WIDTH: 0.0964829
G3 X152.919 Y106.017 I-2.755 J.746 E.00086
M204 S10000
G1 X152.919 Y121.786 F42000
; LINE_WIDTH: 0.0965698
G1 F15000
M204 S6000
G3 X152.859 Y122.056 I-3.454 J-.621 E.00085
; LINE_WIDTH: 0.144079
G3 X152.703 Y122.392 I-2.284 J-.857 E.00185
; LINE_WIDTH: 0.167259
G3 X151.948 Y123.023 I-1.378 J-.883 E.00594
; LINE_WIDTH: 0.112051
G1 X151.694 Y123.099 E.00098
; LINE_WIDTH: 0.0847221
G1 X151.591 Y123.117 E.00027
M204 S10000
G1 X135.814 Y123.119 F42000
; LINE_WIDTH: 0.0965609
G1 F15000
M204 S6000
G3 X135.544 Y123.059 I.62 J-3.453 E.00085
; LINE_WIDTH: 0.144079
G3 X135.208 Y122.903 I.857 J-2.285 E.00185
; LINE_WIDTH: 0.167278
G3 X134.578 Y122.149 I.883 J-1.378 E.00593
; LINE_WIDTH: 0.112111
G1 X134.536 Y122.041 E.00042
G3 X134.5 Y121.888 I2.323 J-.628 E.00058
; LINE_WIDTH: 0.0840542
G1 X134.483 Y121.79 E.00025
M204 S10000
G1 X134.481 Y106.014 F42000
; LINE_WIDTH: 0.0845047
G1 F15000
M204 S6000
G1 X134.501 Y105.909 E.00028
; LINE_WIDTH: 0.11182
G1 X134.577 Y105.652 E.00098
; LINE_WIDTH: 0.167315
G3 X135.208 Y104.897 I1.539 J.643 E.00594
; LINE_WIDTH: 0.143542
G3 X135.544 Y104.742 I1.18 J2.12 E.00184
; LINE_WIDTH: 0.0967685
G3 X135.814 Y104.681 I.865 J3.232 E.00085
; WIPE_START
G1 X135.544 Y104.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.583 Y110.474 Z4.2 F42000
G1 X142.83 Y113.03 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.29 J.881 E.03332
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.532 Y112.78 E-.10375
G1 X141.682 Y112.528 E-.11172
G1 X141.697 Y112.51 E-.0087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.785 Y111.462 I.888 J2.833 E.01475
G3 X144.456 Y111.583 I-.259 J3.355 E.01108
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59482
G1 X143.313 Y111.495 E-.16518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.008 J2.244 E.03119
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04957
G1 X145.092 Y111.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.136 E.00084
G3 X146 Y114.712 I-2.394 J.762 E.02604
G1 X146 Y113.147 E.02542
; WIPE_START
M204 S6000
G1 X146.017 Y113.136 E-.00778
G1 X146.109 Y113.512 E-.14718
G1 X146.138 Y113.999 E-.18538
G1 X146.092 Y114.383 E-.14707
G1 X146 Y114.712 E-.12977
G1 X146 Y114.336 E-.14282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.286 J-.985 E.03198
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53563
G1 X145.949 Y114.846 E-.03089
G1 X145.839 Y115.073 E-.09608
G1 X145.701 Y115.289 E-.09739
; WIPE_END
M73 P67 R9
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.218 I-.809 J-2.445 E.02583
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59499
G1 X144.087 Y116.305 E-.16501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.875 J-2.285 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08507
G1 X142.369 Y115.945 E-.11157
G1 X142.31 Y115.901 E-.02799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.331 Y113.325 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.089 I2.39 J.576 E.00399
G1 X141.4 Y114.713 E.02637
G3 X141.317 Y113.383 I2.321 J-.812 E.02191
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.089 E-.11613
G1 X141.4 Y114.713 E-.61706
G1 X141.381 Y114.645 E-.02681
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.765 Y119.814 Z4.2 F42000
G1 X103.041 Y149.933 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.0059
G1 X102.99 Y131.496 E.29353
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.082 J1.918 E.04626
G1 X124.81 Y149.503 E.29355
G3 X122.975 Y151.409 I-1.919 J-.011 E.0474
G1 X104.896 Y151.41 E.29357
G3 X103.057 Y149.991 I.019 J-1.925 E.04049
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16072
G1 X102.991 Y147.996 E-.59929
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z4.2 F42000
G1 X104.092 Y129.07 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00692
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.177 J2.187 E.05309
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.193 J-.09 E.0545
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.797 I.09 J-2.193 E.05449
G1 X102.412 Y131.112 E.3034
G3 X104.034 Y129.086 I2.195 J.095 E.04509
M204 S10000
G1 X104.111 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.249274
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00336
; LINE_WIDTH: 0.188427
G3 X104.637 Y129.309 I.316 J2.43 E.00119
G1 X122.979 Y129.301 E.12478
G1 X123.351 Y129.327 E.00253
; LINE_WIDTH: 0.249353
G3 X123.72 Y129.416 I-.353 J2.274 E.00353
; LINE_WIDTH: 0.300148
G3 X124.899 Y130.47 I-.658 J1.923 E.01845
; LINE_WIDTH: 0.263265
G3 X125.062 Y130.977 I-1.861 J.878 E.00526
G1 X125.064 Y130.985 E.00008
; LINE_WIDTH: 0.18849
G3 X125.085 Y131.146 I-2.712 J.435 E.00111
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.506 E.12311
G3 X125.076 Y149.929 I-4.088 J-.011 E.00288
; LINE_WIDTH: 0.249644
G3 X124.973 Y150.353 I-2.054 J-.274 E.00407
; LINE_WIDTH: 0.30054
G3 X123.93 Y151.5 I-1.909 J-.689 E.01808
G1 X123.919 Y151.505 E.00014
; LINE_WIDTH: 0.263778
G3 X123.427 Y151.661 I-.912 J-2.027 E.00511
; LINE_WIDTH: 0.188524
G1 X122.983 Y151.699 E.00303
G1 X104.892 Y151.699 E.12314
G1 X104.467 Y151.675 E.0029
; LINE_WIDTH: 0.249918
G3 X104.047 Y151.573 I.301 J-2.148 E.00403
; LINE_WIDTH: 0.300589
G3 X102.9 Y150.53 I.691 J-1.911 E.01808
G1 X102.895 Y150.519 E.00014
; LINE_WIDTH: 0.263167
G3 X102.738 Y150.023 I1.889 J-.87 E.00514
G1 X102.737 Y150.019 E.00004
; LINE_WIDTH: 0.18822
G3 X102.715 Y149.85 I3.171 J-.507 E.00116
G1 X102.701 Y149.579 E.00184
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.196097
G1 X102.714 Y131.158 E.00236
; LINE_WIDTH: 0.237755
G3 X102.737 Y130.989 I1.775 J.152 E.0015
G1 X102.787 Y130.77 E.00198
; LINE_WIDTH: 0.296203
G3 X104.022 Y129.437 I1.943 J.56 E.02109
G1 X104.054 Y129.425 E.00038
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.16012
G1 X104.637 Y129.309 E-.06649
G1 X106.041 Y129.308 E-.5334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 39/95
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.577 J1.072 P1  F42000
G1 X151.468 Y104.861 Z4.2
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.769 Y104.953 E.00511
G3 X152.77 Y106.441 I-.618 J1.496 E.03086
G1 X152.77 Y121.359 E.24224
G3 X151.159 Y122.97 I-1.618 J-.008 E.04103
G1 X136.241 Y122.97 E.24224
G3 X134.63 Y121.359 I.008 J-1.618 E.04103
G1 X134.63 Y106.441 E.24224
G3 X136.241 Y104.83 I1.618 J.008 E.04103
G1 X151.159 Y104.83 E.24224
G3 X151.409 Y104.851 I-.008 J1.618 E.00408
; WIPE_START
M204 S6000
G1 X151.769 Y104.953 E-.1423
G1 X152.05 Y105.103 E-.1208
G1 X152.296 Y105.304 E-.12084
G1 X152.497 Y105.55 E-.12084
G1 X152.647 Y105.831 E-.12081
G1 X152.74 Y106.135 E-.12083
G1 X152.743 Y106.17 E-.01358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.251 Y104.714 Z4.3 F42000
G1 X143.767 Y104.426 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.737 Y104.431 E.12942
G3 X153.18 Y106.05 I-.2 J1.63 E.03846
G1 X153.179 Y121.802 E.25578
G3 X151.548 Y123.38 I-1.638 J-.062 E.04069
G1 X135.798 Y123.379 E.25574
G3 X134.22 Y121.748 I.062 J-1.638 E.04069
G1 X134.221 Y105.998 E.25575
G3 X135.798 Y104.421 I1.638 J.062 E.03981
G1 X143.707 Y104.426 E.12843
; WIPE_START
M204 S6000
G1 X145.707 Y104.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 39 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer39 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.568 Y104.65 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0885605
G1 F15000
M204 S6000
G1 X151.709 Y104.677 E.00039
; LINE_WIDTH: 0.120278
G1 X151.967 Y104.754 E.00108
; LINE_WIDTH: 0.176644
G3 X152.726 Y105.389 I-.604 J1.493 E.00636
; LINE_WIDTH: 0.152526
G3 X152.883 Y105.728 I-2.149 J1.199 E.002
; LINE_WIDTH: 0.10081
G3 X152.948 Y106.03 I-4.932 J1.224 E.001
M204 S10000
G1 X152.95 Y121.768 F42000
; LINE_WIDTH: 0.101507
G1 F15000
M204 S6000
G3 X152.883 Y122.072 I-3.362 J-.576 E.00102
; LINE_WIDTH: 0.152502
G3 X152.726 Y122.412 I-2.211 J-.814 E.002
; LINE_WIDTH: 0.176482
G3 X151.967 Y123.046 I-1.387 J-.888 E.00635
; LINE_WIDTH: 0.120522
G1 X151.713 Y123.123 E.00107
; LINE_WIDTH: 0.0887922
G1 X151.575 Y123.147 E.00038
M204 S10000
G1 X135.832 Y123.15 F42000
; LINE_WIDTH: 0.101331
G1 F15000
M204 S6000
G3 X135.527 Y123.084 I.58 J-3.42 E.00102
; LINE_WIDTH: 0.152732
G3 X135.188 Y122.927 I.857 J-2.292 E.002
; LINE_WIDTH: 0.176502
G3 X134.554 Y122.168 I.887 J-1.386 E.00634
; LINE_WIDTH: 0.119877
G1 X134.476 Y121.906 E.0011
; LINE_WIDTH: 0.0881291
G1 X134.453 Y121.775 E.00036
M204 S10000
G1 X134.45 Y106.032 F42000
; LINE_WIDTH: 0.088596
G1 F15000
M204 S6000
G1 X134.477 Y105.89 E.0004
; LINE_WIDTH: 0.120277
G3 X134.514 Y105.737 I1.563 J.3 E.00064
G1 X134.554 Y105.632 E.00045
; LINE_WIDTH: 0.17659
G3 X135.188 Y104.873 I1.549 J.649 E.00635
; LINE_WIDTH: 0.152191
G3 X135.528 Y104.717 I1.187 J2.136 E.00199
; LINE_WIDTH: 0.101507
G3 X135.832 Y104.65 I.881 J3.295 E.00102
; WIPE_START
G1 X135.528 Y104.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.565 Y110.451 Z4.3 F42000
G1 X142.83 Y113.03 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.308 J.899 E.03329
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53565
G1 X141.532 Y112.78 E-.10376
G1 X141.682 Y112.528 E-.11155
G1 X141.698 Y112.51 E-.00904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.783 Y111.462 I.889 J2.837 E.01471
G3 X144.456 Y111.582 I-.19 J3.005 E.01113
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59487
G1 X143.313 Y111.496 E-.16513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.689 Y111.67 E.00208
G3 X145.979 Y113.03 I-1.063 J2.299 E.03118
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.689 Y111.67 E-.04878
G1 X145.092 Y111.898 E-.17584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.089 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.028 Y113.17 E.00139
G3 X146 Y114.712 I-2.355 J.729 E.02548
G1 X146 Y113.149 E.02539
; WIPE_START
M204 S6000
G1 X146.028 Y113.17 E-.01324
G1 X146.109 Y113.514 E-.13445
G1 X146.138 Y113.997 E-.18381
G1 X146.092 Y114.382 E-.14741
G1 X146 Y114.712 E-.13015
G1 X146 Y114.315 E-.15095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.178 I-2.26 J-.96 E.03199
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53565
G1 X145.949 Y114.846 E-.03089
G1 X145.718 Y115.271 E-.18368
G1 X145.702 Y115.29 E-.00977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.416 Y116.232 E.00158
G3 X142.943 Y116.219 I-.715 J-2.388 E.02428
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59477
G1 X144.416 Y116.232 E-.03705
G1 X144.087 Y116.306 E-.12818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.875 J-2.285 E.0333
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.537 Y116.045 E-.1224
G1 X142.368 Y115.944 E-.07451
G1 X142.309 Y115.902 E-.0277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.309 Y113.417 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.38 J.482 E.00555
G1 X141.4 Y114.71 E.02634
G3 X141.298 Y113.476 I2.288 J-.811 E.02033
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.15241
G1 X141.4 Y114.687 E-.60759
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.78 Y119.851 Z4.3 F42000
G1 X103.041 Y149.933 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.919 J.012 E.04738
G1 X122.976 Y129.591 E.29474
G3 X124.809 Y131.425 I-.08 J1.913 E.04624
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.895 Y151.41 E.29359
G3 X103.055 Y149.991 I.009 J-1.914 E.04054
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.16003
G1 X102.991 Y147.996 E-.59997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.377 Z4.3 F42000
G1 X104.092 Y129.07 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00692
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.192 J2.201 E.053
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.797 I.087 J-2.189 E.05451
G1 X102.412 Y131.114 E.30337
G3 X104.034 Y129.085 I2.189 J.087 E.04516
M204 S10000
G1 X104.111 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.249236
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00336
; LINE_WIDTH: 0.188254
G3 X104.637 Y129.309 I.315 J2.422 E.00119
G1 X122.985 Y129.301 E.12469
G1 X123.242 Y129.315 E.00175
; LINE_WIDTH: 0.240961
G3 X123.411 Y129.336 I-.328 J3.307 E.00152
G1 X123.676 Y129.401 E.00244
; LINE_WIDTH: 0.298865
G3 X124.67 Y130.095 I-.613 J1.936 E.01391
G1 X124.901 Y130.474 E.00502
; LINE_WIDTH: 0.263554
G3 X125.023 Y130.805 I-2.274 J1.022 E.00348
G1 X125.062 Y130.977 E.00173
; LINE_WIDTH: 0.188512
G3 X125.085 Y131.146 I-2.801 J.464 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12314
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246986
G3 X125.025 Y150.186 I-1.79 J-.221 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.297787
G3 X124.083 Y151.419 I-1.933 J-.647 E.01653
G1 X123.774 Y151.566 E.00385
; LINE_WIDTH: 0.251202
G3 X123.335 Y151.676 I-.708 J-1.894 E.00424
; LINE_WIDTH: 0.188229
G1 X122.983 Y151.699 E.0024
G1 X104.89 Y151.699 E.12294
G1 X104.526 Y151.682 E.00247
; LINE_WIDTH: 0.243733
G3 X104.212 Y151.625 I.177 J-1.854 E.0029
G1 X104.096 Y151.589 E.0011
; LINE_WIDTH: 0.299647
G3 X102.899 Y150.526 I.638 J-1.924 E.01865
; LINE_WIDTH: 0.2634
G3 X102.738 Y150.023 I1.984 J-.912 E.00521
G1 X102.737 Y150.015 E.00008
; LINE_WIDTH: 0.188211
G3 X102.715 Y149.854 I3.059 J-.488 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.196347
G1 X102.715 Y131.153 E.0024
; LINE_WIDTH: 0.240273
G3 X102.8 Y130.727 I2.314 J.243 E.00387
; LINE_WIDTH: 0.296774
G3 X104.054 Y129.425 I1.937 J.61 E.02102
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.16025
G1 X104.637 Y129.309 E-.06642
G1 X106.041 Y129.308 E-.53333
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 40/95
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.3 I.577 J1.071 P1  F42000
G1 X151.48 Y104.84 Z4.3
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.784 Y104.932 E.00515
G3 X152.792 Y106.431 I-.623 J1.507 E.03109
G1 X152.792 Y121.369 E.24256
G3 X151.169 Y122.992 I-1.631 J-.008 E.04134
G1 X136.231 Y122.992 E.24256
G3 X134.608 Y121.369 I.008 J-1.631 E.04134
G1 X134.608 Y106.431 E.24256
G3 X136.231 Y104.808 I1.631 J.008 E.04134
G1 X151.169 Y104.808 E.24256
G3 X151.421 Y104.829 I-.008 J1.631 E.00412
; WIPE_START
M204 S6000
G1 X151.784 Y104.932 E-.14319
G1 X152.066 Y105.083 E-.12176
G1 X152.314 Y105.286 E-.12172
G1 X152.517 Y105.534 E-.12174
G1 X152.668 Y105.816 E-.12172
G1 X152.761 Y106.123 E-.12175
G1 X152.763 Y106.144 E-.00812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.271 Y104.69 Z4.4 F42000
G1 X143.768 Y104.398 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.756 Y104.403 E.12971
G3 X153.208 Y106.033 I-.202 J1.642 E.03872
G1 X153.207 Y121.821 E.25635
G3 X151.567 Y123.408 I-1.639 J-.052 E.04099
G1 X135.78 Y123.407 E.25635
G3 X134.192 Y121.765 I.063 J-1.649 E.04096
G1 X134.193 Y105.979 E.25632
G3 X135.779 Y104.393 I1.65 J.063 E.04005
G1 X143.708 Y104.398 E.12874
; WIPE_START
M204 S6000
G1 X145.708 Y104.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 40 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128.816 F18000 ; move to safe pos
M73 P68 R9
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer40 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.558 Y104.623 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0912562
G1 F15000
M204 S6000
G3 X151.728 Y104.652 I-.325 J2.382 E.00049
; LINE_WIDTH: 0.128733
G1 X151.987 Y104.73 E.00118
; LINE_WIDTH: 0.183163
G3 X152.849 Y105.567 I-.555 J1.436 E.00813
; LINE_WIDTH: 0.137094
G3 X152.908 Y105.711 I-1.396 J.648 E.00073
G1 X152.936 Y105.821 E.00053
; LINE_WIDTH: 0.0970898
G3 X152.978 Y106.043 I-3.068 J.687 E.0007
M204 S10000
G1 X152.977 Y121.758 F42000
; LINE_WIDTH: 0.101338
G1 F15000
M204 S6000
G3 X152.924 Y122.033 I-3.204 J-.478 E.00091
; LINE_WIDTH: 0.146604
G1 X152.908 Y122.089 E.0003
G3 X152.823 Y122.29 I-2.065 J-.747 E.00111
; LINE_WIDTH: 0.184067
G3 X151.986 Y123.07 I-1.394 J-.657 E.00776
; LINE_WIDTH: 0.128493
G1 X151.725 Y123.148 E.00119
; LINE_WIDTH: 0.0921849
G1 X151.557 Y123.178 E.00049
M204 S10000
G1 X135.842 Y123.177 F42000
; LINE_WIDTH: 0.101326
G1 F15000
M204 S6000
G3 X135.568 Y123.124 I.48 J-3.211 E.00091
; LINE_WIDTH: 0.14654
G1 X135.511 Y123.108 E.0003
G3 X135.31 Y123.023 I.749 J-2.07 E.00111
; LINE_WIDTH: 0.184088
G3 X134.531 Y122.187 I.657 J-1.394 E.00776
; LINE_WIDTH: 0.128411
G1 X134.452 Y121.925 E.00119
; LINE_WIDTH: 0.0922933
G1 X134.423 Y121.759 E.00049
M204 S10000
G1 X134.423 Y106.042 F42000
; LINE_WIDTH: 0.0912956
G1 F15000
M204 S6000
G3 X134.452 Y105.872 I2.403 J.329 E.00049
; LINE_WIDTH: 0.12875
G3 X134.489 Y105.721 I1.54 J.295 E.00068
G1 X134.531 Y105.613 E.00051
; LINE_WIDTH: 0.185762
G3 X135.169 Y104.85 I1.514 J.619 E.00677
G1 X135.182 Y104.843 E.0001
; LINE_WIDTH: 0.155283
G3 X135.511 Y104.692 I1.322 J2.462 E.00197
G1 X135.567 Y104.676 E.00032
; LINE_WIDTH: 0.101331
G3 X135.842 Y104.623 I.754 J3.156 E.00091
; WIPE_START
G1 X135.567 Y104.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.575 Y110.436 Z4.4 F42000
G1 X142.83 Y113.03 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.319 J.91 E.03328
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53567
G1 X141.595 Y112.667 E-.15307
G1 X141.698 Y112.51 E-.07127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.78 Y111.462 I.81 J2.316 E.0147
G3 X144.456 Y111.582 I-.184 J2.99 E.01117
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59496
G1 X143.313 Y111.495 E-.16504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.006 J2.243 E.0312
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04953
G1 X145.092 Y111.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.088 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.027 Y113.167 E.00135
G3 X146 Y114.712 I-2.322 J.732 E.02552
G1 X146 Y113.148 E.02539
; WIPE_START
M204 S6000
G1 X146.027 Y113.167 E-.01248
G1 X146.109 Y113.514 E-.13543
G1 X146.138 Y113.999 E-.18459
G1 X146.092 Y114.383 E-.147
G1 X146 Y114.712 E-.1297
G1 X146 Y114.315 E-.15081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.317 J-1.017 E.03194
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53567
G1 X145.949 Y114.846 E-.03097
G1 X145.771 Y115.189 E-.14681
G1 X145.703 Y115.29 E-.04655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.02638
G3 X142.943 Y116.219 I-.811 J-2.377 E.02589
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.59581
G1 X144.103 Y116.306 E-.16027
G1 X144.092 Y116.307 E-.00392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.872 J-2.281 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08501
G1 X142.369 Y115.945 E-.11155
G1 X142.31 Y115.901 E-.02805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.332 Y113.324 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X141.4 Y113.088 I2.43 J.576 E.00399
G1 X141.4 Y114.712 E.02636
G3 X141.319 Y113.383 I2.362 J-.812 E.02189
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y113.088 E-.11609
G1 X141.4 Y114.712 E-.6169
G1 X141.382 Y114.643 E-.02701
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.767 Y119.812 Z4.4 F42000
G1 X103.041 Y149.933 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.916 J.01 E.04739
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.074 J1.91 E.04631
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.916 J-.01 E.0474
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.991 I.011 J-1.917 E.04054
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.15995
G1 X102.991 Y147.996 E-.60005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.434 Y140.376 Z4.4 F42000
G1 X104.092 Y129.07 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00689
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.192 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.198 J-.096 E.05446
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.112 E.30342
G3 X104.034 Y129.085 I2.192 J.092 E.04511
M204 S10000
G1 X104.118 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252107
G1 F15000
M204 S6000
G1 X104.456 Y129.325 E.00328
; LINE_WIDTH: 0.188464
G3 X104.637 Y129.309 I.346 J2.777 E.00124
G1 X122.979 Y129.301 E.1248
G1 X123.351 Y129.327 E.00253
; LINE_WIDTH: 0.249284
G3 X123.718 Y129.415 I-.352 J2.272 E.00351
; LINE_WIDTH: 0.29982
G3 X124.9 Y130.47 I-.653 J1.92 E.01846
G1 X124.905 Y130.481 E.00014
; LINE_WIDTH: 0.263495
G3 X125.023 Y130.806 I-2.168 J.971 E.00341
G1 X125.062 Y130.977 E.00173
; LINE_WIDTH: 0.188511
G3 X125.085 Y131.146 I-2.812 J.466 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.247161
G3 X125.025 Y150.186 I-1.791 J-.221 E.00239
G1 X124.989 Y150.308 E.00117
; LINE_WIDTH: 0.29822
G3 X123.779 Y151.564 I-1.923 J-.642 E.02033
; LINE_WIDTH: 0.251547
G3 X123.337 Y151.675 I-.713 J-1.895 E.00428
; LINE_WIDTH: 0.188322
G1 X122.983 Y151.699 E.00241
G1 X104.892 Y151.699 E.123
G1 X104.467 Y151.675 E.00289
; LINE_WIDTH: 0.247453
G3 X104.213 Y151.625 I.284 J-2.095 E.00239
G1 X104.09 Y151.588 E.00118
; LINE_WIDTH: 0.299697
G3 X102.924 Y150.578 I.645 J-1.922 E.01794
G1 X102.895 Y150.519 E.00075
; LINE_WIDTH: 0.262982
G3 X102.777 Y150.195 I1.758 J-.827 E.00339
G1 X102.737 Y150.015 E.00182
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.583 E.00294
G1 X102.701 Y131.489 E.12293
; LINE_WIDTH: 0.20558
G3 X102.737 Y130.989 I3.333 J-.012 E.00376
; LINE_WIDTH: 0.25559
G1 X102.835 Y130.627 E.00358
; LINE_WIDTH: 0.29935
G3 X103.876 Y129.497 I1.925 J.73 E.01782
G1 X104.022 Y129.437 E.00178
; LINE_WIDTH: 0.252107
G1 X104.06 Y129.427 E.00037
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.456 Y129.325 E-.15535
G1 X104.637 Y129.309 E-.06919
G1 X106.046 Y129.308 E-.53547
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 41/95
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.577 J1.071 P1  F42000
G1 X151.492 Y104.818 Z4.4
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.798 Y104.911 E.00519
G3 X152.814 Y106.421 I-.627 J1.518 E.03132
G1 X152.814 Y121.379 E.24288
G3 X151.179 Y123.014 I-1.643 J-.008 E.04165
G1 X136.221 Y123.014 E.24288
G3 X134.586 Y121.379 I.008 J-1.643 E.04165
G1 X134.586 Y106.421 E.24288
G3 X136.221 Y104.786 I1.643 J.008 E.04165
G1 X151.179 Y104.786 E.24288
G3 X151.433 Y104.807 I-.008 J1.643 E.00415
; WIPE_START
M204 S6000
G1 X151.798 Y104.911 E-.14414
G1 X152.083 Y105.063 E-.12262
G1 X152.332 Y105.268 E-.12266
G1 X152.537 Y105.517 E-.12265
G1 X152.689 Y105.802 E-.12266
G1 X152.783 Y106.111 E-.12263
G1 X152.784 Y106.117 E-.00265
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.291 Y104.665 Z4.5 F42000
G1 X143.768 Y104.37 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.775 Y104.375 E.13002
G3 X153.236 Y106.016 I-.192 J1.642 E.03904
G1 X153.235 Y121.839 E.25693
G3 X151.584 Y123.436 I-1.65 J-.054 E.04126
G1 X135.761 Y123.435 E.25693
G3 X134.164 Y121.782 I.065 J-1.661 E.04122
G1 X134.165 Y105.961 E.25689
G3 X135.761 Y104.365 I1.661 J.065 E.0403
G1 X143.708 Y104.37 E.12904
; WIPE_START
M204 S6000
G1 X145.708 Y104.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 41 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer41 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.548 Y104.595 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961115
G1 F15000
M204 S6000
G3 X151.746 Y104.628 I-.371 J2.779 E.00061
; LINE_WIDTH: 0.137227
G1 X152.006 Y104.707 E.00128
; LINE_WIDTH: 0.195413
G3 X152.747 Y105.31 I-.651 J1.555 E.00686
; LINE_WIDTH: 0.175965
G3 X152.914 Y105.645 I-1.446 J.932 E.00236
; LINE_WIDTH: 0.12731
G3 X152.984 Y105.917 I-1.598 J.556 E.00121
; LINE_WIDTH: 0.089785
G1 X153.006 Y106.055 E.00039
M204 S10000
G1 X153.005 Y121.748 F42000
; LINE_WIDTH: 0.096156
G1 F15000
M204 S6000
G3 X152.972 Y121.946 I-2.766 J-.368 E.00061
; LINE_WIDTH: 0.137237
G3 X152.893 Y122.207 I-1.139 J-.204 E.00129
; LINE_WIDTH: 0.191544
G3 X152.007 Y123.092 I-1.454 J-.568 E.00893
; LINE_WIDTH: 0.137002
G1 X151.894 Y123.136 E.00057
G3 X151.742 Y123.173 I-.445 J-1.507 E.00074
; LINE_WIDTH: 0.0962998
G3 X151.545 Y123.206 I-.669 J-3.307 E.00061
M204 S10000
G1 X135.852 Y123.205 F42000
; LINE_WIDTH: 0.0835509
G1 F15000
M204 S6000
G1 X135.77 Y123.193 E.00021
; LINE_WIDTH: 0.118361
G3 X135.494 Y123.133 I.446 J-2.704 E.00111
; LINE_WIDTH: 0.170054
G3 X135.15 Y122.973 I.862 J-2.315 E.0023
; LINE_WIDTH: 0.194938
G3 X134.508 Y122.207 I.897 J-1.404 E.00717
; LINE_WIDTH: 0.1378
G1 X134.463 Y122.095 E.00057
G3 X134.428 Y121.945 I2.295 J-.621 E.00073
; LINE_WIDTH: 0.0959467
G1 X134.393 Y121.745 E.00062
M204 S10000
G1 X134.395 Y106.052 F42000
; LINE_WIDTH: 0.096156
G1 F15000
M204 S6000
G3 X134.428 Y105.854 I2.766 J.368 E.00061
; LINE_WIDTH: 0.137237
G3 X134.464 Y105.706 I1.499 J.285 E.00072
G1 X134.507 Y105.593 E.00057
; LINE_WIDTH: 0.191306
M73 P68 R8
G3 X135.394 Y104.707 I1.463 J.577 E.00892
; LINE_WIDTH: 0.137222
G3 X135.654 Y104.628 I.464 J1.06 E.00128
; LINE_WIDTH: 0.0961624
G3 X135.851 Y104.595 I.569 J2.748 E.00061
; WIPE_START
G1 X135.654 Y104.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.611 Y110.432 Z4.5 F42000
G1 X142.83 Y113.03 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.309 J.899 E.03329
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53569
G1 X141.532 Y112.78 E-.10373
G1 X141.682 Y112.528 E-.11163
G1 X141.697 Y112.51 E-.00895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.778 Y111.462 I.81 J2.317 E.01466
G3 X144.456 Y111.583 I-.247 J3.342 E.0112
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59475
G1 X143.314 Y111.495 E-.16525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.033 J2.268 E.03118
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04956
G1 X145.092 Y111.898 E-.17506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.136 E.00084
G3 X146 Y114.712 I-2.392 J.762 E.02603
G1 X146 Y113.147 E.02541
; WIPE_START
M204 S6000
G1 X146.017 Y113.136 E-.00777
G1 X146.122 Y113.608 E-.18363
G1 X146.138 Y113.999 E-.14887
G1 X146.092 Y114.383 E-.14694
G1 X146 Y114.712 E-.12969
G1 X146 Y114.335 E-.1431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.318 J-1.018 E.03195
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53569
G1 X145.949 Y114.846 E-.03082
G1 X145.835 Y115.08 E-.09908
G1 X145.701 Y115.289 E-.09441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.5 F42000
M73 P69 R8
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.51 Y116.202 E.02637
G3 X142.943 Y116.219 I-.81 J-2.35 E.02589
; WIPE_START
M204 S6000
G1 X144.51 Y116.202 E-.59543
G1 X144.089 Y116.304 E-.16457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.895 J-2.306 E.03329
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08495
G1 X142.369 Y115.945 E-.11153
G1 X142.31 Y115.901 E-.02814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.088 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.713 E.02638
G3 X141.381 Y113.145 I2.324 J-.812 E.02592
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.713 E-.5959
G1 X141.308 Y114.38 E-.13119
G1 X141.298 Y114.294 E-.03291
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.713 Y119.497 Z4.5 F42000
G1 X103.041 Y149.93 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.036 Y149.913 E.00029
G3 X102.991 Y149.575 I1.868 J-.417 E.00554
G1 X102.99 Y131.496 E.29357
G3 X104.784 Y129.594 I1.91 J.005 E.04675
G1 X122.975 Y129.591 E.29539
G3 X124.809 Y131.425 I-.076 J1.91 E.04628
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.005 E.04744
G1 X104.896 Y151.41 E.29356
G3 X103.136 Y150.231 I.007 J-1.914 E.03646
G1 X103.059 Y149.987 E.00415
; WIPE_START
M204 S6000
G1 X103.036 Y149.913 E-.02949
G1 X102.991 Y149.575 E-.12957
G1 X102.991 Y147.994 E-.60094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.374 Z4.5 F42000
G1 X104.092 Y129.07 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00688
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.192 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.195 J-.093 E.05448
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.1 J-2.202 E.05441
G1 X102.412 Y131.114 E.30339
G3 X104.034 Y129.085 I2.192 J.089 E.04515
M204 S10000
G1 X104.118 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251847
G1 F15000
M204 S6000
G1 X104.456 Y129.325 E.00328
; LINE_WIDTH: 0.187668
G3 X104.636 Y129.309 I.341 J2.724 E.00122
G1 X122.983 Y129.301 E.12425
G1 X123.24 Y129.314 E.00175
; LINE_WIDTH: 0.240415
G1 X123.417 Y129.337 E.00159
G1 X123.676 Y129.401 E.00238
; LINE_WIDTH: 0.297047
G3 X124.969 Y130.638 I-.608 J1.93 E.02081
; LINE_WIDTH: 0.251384
G3 X125.023 Y130.804 I-1.903 J.702 E.00164
G1 X125.074 Y131.051 E.00236
; LINE_WIDTH: 0.188239
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243831
G3 X125.025 Y150.186 I-1.884 J-.184 E.00288
G1 X124.989 Y150.308 E.00115
; LINE_WIDTH: 0.299094
G3 X124.007 Y151.462 I-1.927 J-.645 E.01757
G1 X123.888 Y151.519 E.00149
; LINE_WIDTH: 0.261989
G3 X123.423 Y151.661 I-.883 J-2.05 E.00477
; LINE_WIDTH: 0.18841
G3 X123.254 Y151.685 I-.441 J-2.589 E.00116
G1 X122.983 Y151.699 E.00185
G1 X104.893 Y151.699 E.12305
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243629
G3 X104.214 Y151.625 I.184 J-1.884 E.00288
G1 X104.095 Y151.59 E.00112
; LINE_WIDTH: 0.29792
G3 X102.833 Y150.371 I.642 J-1.928 E.02044
; LINE_WIDTH: 0.254079
G3 X102.732 Y149.985 I2.181 J-.777 E.00378
; LINE_WIDTH: 0.188145
G3 X102.71 Y149.795 I4.59 J-.622 E.0013
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.19815
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242809
G3 X102.8 Y130.727 I2.239 J.258 E.00368
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.297589
G3 X103.633 Y129.632 I1.949 J.631 E.01566
G1 X104.026 Y129.435 E.00495
; LINE_WIDTH: 0.251847
G1 X104.06 Y129.427 E.00032
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.456 Y129.325 E-.15539
G1 X104.636 Y129.309 E-.06864
G1 X106.046 Y129.308 E-.53598
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 42/95
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.5 I.578 J1.071 P1  F42000
G1 X151.504 Y104.796 Z4.5
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.813 Y104.89 E.00523
G3 X152.836 Y106.412 I-.632 J1.53 E.03156
G1 X152.836 Y121.388 E.24319
G3 X151.188 Y123.036 I-1.655 J-.008 E.04196
G1 X136.212 Y123.036 E.24319
G3 X134.564 Y121.388 I.008 J-1.655 E.04196
G1 X134.564 Y106.412 E.24319
G3 X136.212 Y104.764 I1.655 J.008 E.04196
G1 X151.188 Y104.764 E.24319
G3 X151.445 Y104.786 I-.008 J1.655 E.00419
; WIPE_START
M204 S6000
G1 X151.813 Y104.89 E-.14511
G1 X152.099 Y105.043 E-.12352
G1 X152.351 Y105.249 E-.12357
G1 X152.557 Y105.501 E-.12357
G1 X152.71 Y105.787 E-.12353
G1 X152.803 Y106.091 E-.12071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.309 Y104.64 Z4.6 F42000
G1 X143.768 Y104.342 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.794 Y104.347 E.13031
G3 X153.265 Y105.999 I-.194 J1.653 E.0393
G1 X153.263 Y121.857 E.2575
G3 X151.601 Y123.465 I-1.662 J-.055 E.04153
G1 X135.743 Y123.463 E.2575
G3 X134.135 Y121.799 I.066 J-1.672 E.04149
G1 X134.137 Y105.943 E.25747
G3 X135.743 Y104.337 I1.672 J.066 E.04054
G1 X143.708 Y104.342 E.12935
; WIPE_START
M204 S6000
G1 X145.708 Y104.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 42 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer42 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.539 Y104.566 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0877149
G1 F15000
M204 S6000
G1 X151.648 Y104.583 E.0003
; LINE_WIDTH: 0.113068
G1 X151.764 Y104.604 E.00044
; LINE_WIDTH: 0.145695
G1 X152.026 Y104.684 E.00138
; LINE_WIDTH: 0.204656
G3 X152.771 Y105.293 I-.657 J1.566 E.00728
; LINE_WIDTH: 0.184752
G3 X152.937 Y105.626 I-1.491 J.952 E.00248
; LINE_WIDTH: 0.135691
G3 X153.008 Y105.898 I-1.56 J.549 E.00131
; LINE_WIDTH: 0.0939969
G1 X153.035 Y106.065 E.0005
M204 S10000
G1 X153.034 Y121.739 F42000
; LINE_WIDTH: 0.0877119
G1 F15000
M204 S6000
G1 X153.017 Y121.848 E.0003
; LINE_WIDTH: 0.126823
G3 X152.957 Y122.121 I-3.078 J-.539 E.0012
; LINE_WIDTH: 0.178446
G3 X152.797 Y122.47 I-2.23 J-.814 E.00245
; LINE_WIDTH: 0.2041
G3 X152.025 Y123.116 I-1.412 J-.901 E.00761
; LINE_WIDTH: 0.145335
G1 X151.76 Y123.197 E.0014
; LINE_WIDTH: 0.120008
G1 X151.707 Y123.207 E.00022
; LINE_WIDTH: 0.0946268
G1 X151.535 Y123.235 E.00052
M204 S10000
G1 X135.861 Y123.234 F42000
; LINE_WIDTH: 0.087709
G1 F15000
M204 S6000
G1 X135.752 Y123.217 E.0003
; LINE_WIDTH: 0.1265
G3 X135.478 Y123.158 I.619 J-3.493 E.0012
; LINE_WIDTH: 0.178732
G3 X135.13 Y122.997 I.861 J-2.319 E.00246
; LINE_WIDTH: 0.204451
G3 X134.484 Y122.227 I.888 J-1.401 E.00761
; LINE_WIDTH: 0.146352
G1 X134.439 Y122.11 E.00064
G3 X134.404 Y121.965 I2.238 J-.606 E.00076
; LINE_WIDTH: 0.11314
G1 X134.385 Y121.85 E.00043
; LINE_WIDTH: 0.0872487
G1 X134.365 Y121.735 E.00031
M204 S10000
G1 X134.366 Y106.061 F42000
; LINE_WIDTH: 0.0877119
G1 F15000
M204 S6000
G1 X134.383 Y105.952 E.0003
; LINE_WIDTH: 0.113105
G1 X134.404 Y105.835 E.00044
; LINE_WIDTH: 0.145733
G3 X134.439 Y105.69 I1.481 J.281 E.00076
G1 X134.484 Y105.574 E.00063
; LINE_WIDTH: 0.204371
G3 X135.13 Y104.804 I1.531 J.629 E.00761
; LINE_WIDTH: 0.177822
G3 X135.479 Y104.643 I1.862 J3.583 E.00244
; LINE_WIDTH: 0.126824
G3 X135.752 Y104.583 I.812 J3.016 E.0012
; LINE_WIDTH: 0.0877225
G1 X135.861 Y104.566 E.0003
; WIPE_START
G1 X135.752 Y104.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.654 Y110.433 Z4.6 F42000
G1 X142.83 Y113.03 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.277 J.868 E.03333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53571
G1 X141.627 Y112.613 E-.17683
G1 X141.697 Y112.509 E-.04747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.775 Y111.462 I.81 J2.317 E.01462
G3 X144.456 Y111.583 I-.243 J3.334 E.01125
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59487
G1 X143.313 Y111.495 E-.16513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-.993 J2.23 E.03121
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04953
G1 X145.092 Y111.898 E-.17509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.025 Y113.163 E.00127
G3 X146 Y114.712 I-2.32 J.737 E.0256
G1 X146 Y113.148 E.02538
; WIPE_START
M204 S6000
G1 X146.025 Y113.163 E-.01106
G1 X146.109 Y113.514 E-.13727
G1 X146.138 Y113.999 E-.18466
G1 X146.092 Y114.383 E-.14697
G1 X146 Y114.712 E-.1296
G1 X146 Y114.316 E-.15044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.179 I-2.265 J-.962 E.032
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53571
G1 X145.949 Y114.846 E-.0308
G1 X145.785 Y115.166 E-.13685
G1 X145.702 Y115.29 E-.05663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.378 E.02586
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59507
G1 X144.088 Y116.305 E-.16494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.863 J-2.272 E.03332
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08501
G1 X142.369 Y115.945 E-.11151
G1 X142.311 Y115.899 E-.0281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.088 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.712 E.02636
G3 X141.381 Y113.145 I2.292 J-.812 E.0259
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.712 E-.59534
G1 X141.292 Y114.292 E-.16466
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.708 Y119.495 Z4.6 F42000
G1 X103.043 Y149.926 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.027 Y149.872 E.0009
G3 X102.991 Y149.575 I1.876 J-.376 E.00487
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.926 J.019 E.04612
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.898 Y151.41 E.29353
G3 X103.136 Y150.231 I.005 J-1.914 E.03649
G1 X103.06 Y149.983 E.0042
; WIPE_START
M204 S6000
G1 X103.027 Y149.872 E-.04396
G1 X102.991 Y149.575 E-.11391
G1 X102.991 Y147.99 E-.60213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.371 Z4.6 F42000
G1 X104.092 Y129.07 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00688
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.192 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.195 J-.093 E.05448
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.112 E.30339
G3 X104.035 Y129.085 I2.192 J.091 E.04512
M204 S10000
G1 X104.118 Y129.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.252098
G1 F15000
M204 S6000
G1 X104.456 Y129.325 E.00328
; LINE_WIDTH: 0.187687
G1 X104.892 Y129.301 E.00296
G1 X122.983 Y129.301 E.12253
G1 X123.248 Y129.314 E.0018
; LINE_WIDTH: 0.240978
G3 X123.415 Y129.336 I-.59 J5.119 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.297056
G3 X124.969 Y130.638 I-.614 J1.937 E.0208
; LINE_WIDTH: 0.251373
G3 X125.074 Y131.051 I-1.904 J.701 E.004
; LINE_WIDTH: 0.188241
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.508 E.12293
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.243918
G3 X125.025 Y150.186 I-1.93 J-.193 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.298197
G3 X123.926 Y151.502 I-1.924 J-.638 E.01857
G1 X123.811 Y151.551 E.0014
; LINE_WIDTH: 0.254214
G1 X123.599 Y151.622 E.00213
G1 X123.352 Y151.673 E.00239
; LINE_WIDTH: 0.188203
G1 X122.983 Y151.699 E.00251
G1 X104.894 Y151.699 E.12289
G1 X104.552 Y151.685 E.00233
; LINE_WIDTH: 0.240506
G3 X104.218 Y151.626 I.168 J-1.926 E.00303
G1 X104.124 Y151.599 E.00088
; LINE_WIDTH: 0.297306
G3 X102.898 Y150.526 I.625 J-1.95 E.01883
G1 X102.834 Y150.374 E.00185
; LINE_WIDTH: 0.252302
G3 X102.727 Y149.953 I2.01 J-.738 E.0041
; LINE_WIDTH: 0.18806
G1 X102.701 Y149.583 E.00252
G1 X102.701 Y131.489 E.12282
; LINE_WIDTH: 0.198363
G1 X102.717 Y131.123 E.00264
; LINE_WIDTH: 0.242384
G3 X102.799 Y130.73 I2.19 J.252 E.00362
G1 X102.802 Y130.721 E.00009
; LINE_WIDTH: 0.297409
G3 X103.876 Y129.497 I1.937 J.617 E.01884
G1 X104.021 Y129.437 E.00177
; LINE_WIDTH: 0.252098
G1 X104.06 Y129.427 E.00038
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.456 Y129.325 E-.15526
G1 X104.892 Y129.301 E-.16584
G1 X106.047 Y129.301 E-.43891
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 43/95
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I.578 J1.071 P1  F42000
G1 X151.516 Y104.774 Z4.6
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.827 Y104.869 E.00528
G3 X152.858 Y106.402 I-.637 J1.541 E.03179
G1 X152.858 Y121.398 E.24351
G3 X151.198 Y123.058 I-1.667 J-.008 E.04227
G1 X136.202 Y123.058 E.24351
G3 X134.542 Y121.398 I.008 J-1.667 E.04227
G1 X134.542 Y106.402 E.24351
G3 X136.202 Y104.742 I1.667 J.008 E.04227
G1 X151.198 Y104.742 E.24351
G3 X151.457 Y104.764 I-.008 J1.667 E.00423
; WIPE_START
M204 S6000
G1 X151.827 Y104.869 E-.14608
G1 X152.116 Y105.023 E-.12448
G1 X152.369 Y105.231 E-.12445
G1 X152.577 Y105.484 E-.12445
G1 X152.731 Y105.773 E-.12448
G1 X152.82 Y106.065 E-.11606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.327 Y104.615 Z4.7 F42000
G1 X143.769 Y104.313 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.813 Y104.318 E.13061
G3 X153.293 Y105.982 I-.195 J1.664 E.03956
G1 X153.292 Y121.876 E.25808
G3 X151.618 Y123.493 I-1.673 J-.057 E.04179
G1 X135.724 Y123.492 E.25808
G3 X134.107 Y121.818 I.057 J-1.673 E.04179
G1 X134.108 Y105.924 E.25808
G3 X135.724 Y104.308 I1.684 J.068 E.04078
G1 X143.709 Y104.313 E.12965
; WIPE_START
M204 S6000
G1 X145.709 Y104.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 43 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer43 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.522 Y104.541 F42000
M73 P70 R8
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881251
G1 F15000
M204 S6000
G1 X151.667 Y104.559 E.00039
; LINE_WIDTH: 0.121269
G1 X151.782 Y104.58 E.00048
; LINE_WIDTH: 0.154208
G1 X152.045 Y104.66 E.00149
; LINE_WIDTH: 0.213898
G3 X152.791 Y105.268 I-.661 J1.573 E.00765
; LINE_WIDTH: 0.193979
G3 X152.961 Y105.606 I-1.424 J.927 E.00267
; LINE_WIDTH: 0.144112
G3 X153.032 Y105.879 I-1.528 J.543 E.00141
; LINE_WIDTH: 0.0937113
G1 X153.06 Y106.09 E.00063
M204 S10000
G1 X153.059 Y121.722 F42000
; LINE_WIDTH: 0.0881199
G1 F15000
M204 S6000
G1 X153.041 Y121.867 E.0004
; LINE_WIDTH: 0.134888
G3 X152.981 Y122.138 I-3.005 J-.523 E.00128
; LINE_WIDTH: 0.186348
G3 X152.829 Y122.474 I-3.397 J-1.333 E.00248
; LINE_WIDTH: 0.213151
G1 X152.82 Y122.489 E.00014
G3 X152.045 Y123.14 I-1.421 J-.906 E.00803
; LINE_WIDTH: 0.153916
G1 X151.779 Y123.221 E.0015
; LINE_WIDTH: 0.113603
G1 X151.613 Y123.25 E.00064
; LINE_WIDTH: 0.0811838
G1 X151.51 Y123.26 E.00025
M204 S10000
G1 X135.878 Y123.259 F42000
; LINE_WIDTH: 0.0881296
G1 F15000
M204 S6000
G1 X135.733 Y123.241 E.0004
; LINE_WIDTH: 0.134892
G3 X135.462 Y123.181 I.526 J-3.016 E.00128
; LINE_WIDTH: 0.18702
G3 X135.111 Y123.02 I.766 J-2.126 E.00261
; LINE_WIDTH: 0.213361
G3 X134.461 Y122.246 I.901 J-1.417 E.00803
; LINE_WIDTH: 0.154286
G1 X134.414 Y122.126 E.0007
G3 X134.379 Y121.976 I2.315 J-.624 E.00083
; LINE_WIDTH: 0.113261
G1 X134.35 Y121.813 E.00062
; LINE_WIDTH: 0.0811848
G1 X134.34 Y121.71 E.00025
M204 S10000
G1 X134.341 Y106.078 F42000
; LINE_WIDTH: 0.0881199
G1 F15000
M204 S6000
G1 X134.359 Y105.933 E.0004
; LINE_WIDTH: 0.121322
G1 X134.38 Y105.817 E.00048
; LINE_WIDTH: 0.154254
G3 X134.414 Y105.674 I1.455 J.275 E.00079
G1 X134.461 Y105.554 E.0007
; LINE_WIDTH: 0.213602
G3 X135.111 Y104.78 I1.54 J.634 E.00804
; LINE_WIDTH: 0.186465
G3 X135.462 Y104.619 I1.84 J3.535 E.0026
; LINE_WIDTH: 0.134887
G3 X135.733 Y104.559 I.795 J2.95 E.00128
; LINE_WIDTH: 0.0881274
G1 X135.878 Y104.541 E.00039
; WIPE_START
G1 X135.733 Y104.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.635 Y110.409 Z4.7 F42000
G1 X142.83 Y113.03 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.311 J.901 E.0333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53584
G1 X141.627 Y112.613 E-.17687
G1 X141.703 Y112.514 E-.04729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.773 Y111.462 I.894 J2.856 E.01455
G3 X144.456 Y111.582 I-.144 J2.823 E.0113
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.595
G1 X143.313 Y111.496 E-.165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00211
G3 X145.979 Y113.03 I-1.029 J2.265 E.03118
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53537
G1 X144.691 Y111.67 E-.04933
G1 X145.092 Y111.898 E-.1753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00239
G3 X146 Y114.711 I-2.343 J.669 E.02446
G1 X146 Y113.15 E.02535
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03498
G1 X146.13 Y113.682 E-.17471
G1 X146.138 Y113.999 E-.12053
G1 X146.092 Y114.383 E-.14693
G1 X146 Y114.711 E-.12959
G1 X146 Y114.308 E-.15327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.178 I-2.282 J-.982 E.03197
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53573
G1 X145.949 Y114.846 E-.03083
G1 X145.821 Y115.107 E-.11061
G1 X145.702 Y115.289 E-.08283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.415 Y116.233 E.00161
G3 X142.943 Y116.219 I-.714 J-2.339 E.02428
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.5948
G1 X144.415 Y116.233 E-.03758
G1 X144.087 Y116.304 E-.12762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.895 J-2.304 E.03328
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53537
G1 X142.601 Y116.078 E-.09488
G1 X142.308 Y115.902 E-.12975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02631
G3 X141.381 Y113.146 I2.283 J-.81 E.02585
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59419
G1 X141.291 Y114.287 E-.16581
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.707 Y119.491 Z4.7 F42000
G1 X103.041 Y149.933 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.079 J1.913 E.04626
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.919 J-.01 E.04741
G1 X104.898 Y151.41 E.29354
G3 X103.054 Y149.991 I.003 J-1.911 E.04061
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.16
G1 X102.991 Y147.996 E-.6
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z4.7 F42000
G1 X104.093 Y129.07 Z4.7
G1 Z4.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00688
G1 X123.373 Y129.017 E.30626
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.195 J-.093 E.05448
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.093 J-2.195 E.05445
G1 X102.412 Y131.114 E.30339
G3 X104.035 Y129.085 I2.191 J.089 E.04515
M204 S10000
G1 X104.111 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.248333
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00334
; LINE_WIDTH: 0.188476
G3 X104.637 Y129.309 I.284 J2.051 E.00119
G1 X122.983 Y129.301 E.12484
G1 X123.351 Y129.327 E.00251
; LINE_WIDTH: 0.250964
G3 X123.749 Y129.426 I-.355 J2.285 E.00385
; LINE_WIDTH: 0.300483
G3 X124.876 Y130.423 I-.682 J1.906 E.01753
G1 X124.905 Y130.481 E.00073
; LINE_WIDTH: 0.263207
G3 X125.023 Y130.805 I-1.967 J.901 E.0034
G1 X125.062 Y130.977 E.00173
; LINE_WIDTH: 0.188412
G3 X125.085 Y131.146 I-2.752 J.458 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.506 E.12305
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243626
G3 X125.047 Y150.097 I-2.436 J-.279 E.00204
G1 X124.99 Y150.305 E.00195
; LINE_WIDTH: 0.297762
G3 X123.77 Y151.567 I-1.935 J-.649 E.02043
; LINE_WIDTH: 0.251828
G3 X123.596 Y151.623 I-.893 J-2.511 E.00172
G1 X123.348 Y151.674 E.00238
; LINE_WIDTH: 0.188236
G1 X122.983 Y151.699 E.00248
G1 X104.894 Y151.699 E.12292
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243627
G3 X104.214 Y151.625 I.184 J-1.887 E.00288
G1 X104.095 Y151.59 E.00112
; LINE_WIDTH: 0.299774
G3 X102.9 Y150.53 I.642 J-1.928 E.01862
G1 X102.895 Y150.519 E.00014
; LINE_WIDTH: 0.263059
G3 X102.738 Y150.026 I2.003 J-.909 E.00511
G1 X102.737 Y150.015 E.00011
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.583 E.00294
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.198179
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242777
G3 X102.8 Y130.728 I2.233 J.256 E.00368
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.296763
G3 X104.054 Y129.425 I1.935 J.622 E.02089
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.1602
G1 X104.637 Y129.309 E-.06638
G1 X106.041 Y129.308 E-.53343
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 44/95
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.7 I.578 J1.071 P1  F42000
G1 X151.528 Y104.752 Z4.7
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.842 Y104.848 E.00532
G3 X152.879 Y106.392 I-.641 J1.552 E.03202
G1 X152.879 Y121.408 E.24383
G3 X151.208 Y123.08 I-1.679 J-.008 E.04258
G1 X136.192 Y123.08 E.24383
G3 X134.52 Y121.408 I.008 J-1.679 E.04258
G1 X134.52 Y106.392 E.24383
G3 X136.192 Y104.72 I1.679 J.008 E.04258
G1 X151.208 Y104.72 E.24383
G3 X151.469 Y104.742 I-.008 J1.679 E.00426
; WIPE_START
M204 S6000
G1 X151.842 Y104.848 E-.14712
G1 X152.133 Y105.003 E-.12535
G1 X152.388 Y105.212 E-.12538
G1 X152.597 Y105.467 E-.12536
G1 X152.752 Y105.758 E-.12537
G1 X152.838 Y106.039 E-.11142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.344 Y104.59 Z4.8 F42000
G1 X143.769 Y104.285 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.833 Y104.29 E.13095
G3 X153.321 Y105.966 I-.199 J1.675 E.03979
G1 X153.32 Y121.894 E.25865
G3 X151.634 Y123.521 I-1.684 J-.058 E.04205
G1 X135.706 Y123.52 E.25865
G3 X134.079 Y121.835 I.058 J-1.684 E.04205
G1 X134.08 Y105.906 E.25865
G3 X135.706 Y104.28 I1.695 J.069 E.04101
G1 X143.709 Y104.285 E.12996
; WIPE_START
M204 S6000
G1 X145.709 Y104.286 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 44 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer44 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.468 Y104.513 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0899344
G1 F15000
M204 S6000
G1 X151.685 Y104.534 E.00061
; LINE_WIDTH: 0.129886
G1 X151.804 Y104.557 E.00054
; LINE_WIDTH: 0.162967
G1 X152.065 Y104.637 E.00157
; LINE_WIDTH: 0.219979
G3 X152.942 Y105.488 I-.573 J1.469 E.01015
; LINE_WIDTH: 0.171664
G3 X153.006 Y105.646 I-1.537 J.711 E.00104
G1 X153.033 Y105.746 E.00064
; LINE_WIDTH: 0.128259
G3 X153.074 Y105.97 I-3.029 J.683 E.00099
; LINE_WIDTH: 0.0841401
G1 X153.089 Y106.145 E.00045
M204 S10000
G1 X153.087 Y121.668 F42000
; LINE_WIDTH: 0.0898782
G1 F15000
M204 S6000
G1 X153.066 Y121.885 E.00061
; LINE_WIDTH: 0.142707
G3 X153.006 Y122.158 I-2.834 J-.479 E.00138
; LINE_WIDTH: 0.196241
G3 X152.843 Y122.508 I-2.213 J-.813 E.00276
; LINE_WIDTH: 0.222558
G3 X152.064 Y123.163 I-1.426 J-.906 E.00847
; LINE_WIDTH: 0.162649
G1 X151.801 Y123.244 E.00158
; LINE_WIDTH: 0.121981
G1 X151.629 Y123.275 E.00072
; LINE_WIDTH: 0.0841066
G1 X151.455 Y123.289 E.00045
M204 S10000
G1 X135.932 Y123.287 F42000
; LINE_WIDTH: 0.0899279
G1 F15000
M204 S6000
G1 X135.715 Y123.266 E.00061
; LINE_WIDTH: 0.142561
G3 X135.445 Y123.207 I.788 J-4.271 E.00136
; LINE_WIDTH: 0.196047
G3 X135.091 Y123.044 I.869 J-2.347 E.00278
; LINE_WIDTH: 0.222724
G3 X134.437 Y122.265 I.882 J-1.405 E.00848
; LINE_WIDTH: 0.162816
G1 X134.389 Y122.141 E.00076
G3 X134.355 Y121.995 I2.275 J-.613 E.00086
; LINE_WIDTH: 0.121318
G1 X134.325 Y121.829 E.00068
; LINE_WIDTH: 0.0841087
G1 X134.311 Y121.655 E.00045
M204 S10000
G1 X134.313 Y106.132 F42000
; LINE_WIDTH: 0.0898782
G1 F15000
M204 S6000
G1 X134.334 Y105.915 E.00061
; LINE_WIDTH: 0.133551
G1 X134.367 Y105.75 E.00077
; LINE_WIDTH: 0.166932
G1 X134.437 Y105.535 E.00134
; LINE_WIDTH: 0.222779
G3 X135.092 Y104.757 I1.533 J.625 E.00848
; LINE_WIDTH: 0.195709
G3 X135.442 Y104.594 I1.984 J3.82 E.00274
; LINE_WIDTH: 0.142706
G3 X135.715 Y104.534 I.749 J2.758 E.00138
; LINE_WIDTH: 0.0898877
G1 X135.932 Y104.513 E.00061
; WIPE_START
G1 X135.715 Y104.534 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.616 Y110.386 Z4.8 F42000
G1 X142.83 Y113.03 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.338 J.93 E.03326
G1 X142.83 Y112.97 E.0219
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53584
G1 X141.532 Y112.78 E-.10396
G1 X141.682 Y112.528 E-.11154
G1 X141.697 Y112.51 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02634
G3 X143.77 Y111.461 I.81 J2.318 E.01452
G3 X144.456 Y111.583 I-.235 J3.324 E.01133
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59461
G1 X143.314 Y111.495 E-.16539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.01 J2.247 E.03119
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04957
G1 X145.092 Y111.898 E-.17505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.136 E.00085
G3 X146 Y114.711 I-2.391 J.761 E.02602
G1 X146 Y113.147 E.0254
; WIPE_START
M204 S6000
G1 X146.017 Y113.136 E-.00775
G1 X146.109 Y113.512 E-.14699
G1 X146.138 Y113.999 E-.18545
G1 X146.092 Y114.383 E-.14688
G1 X146 Y114.711 E-.12958
G1 X146 Y114.334 E-.14335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02287
G1 X145.949 Y114.846 E.00132
G3 X144.57 Y116.178 I-2.251 J-.949 E.032
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53575
G1 X145.949 Y114.846 E-.03084
G1 X145.718 Y115.271 E-.18377
M73 P71 R8
G1 X145.702 Y115.29 E-.00964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.417 Y116.232 E.00158
G3 X142.943 Y116.219 I-.716 J-2.338 E.02431
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.5948
G1 X144.417 Y116.232 E-.03692
G1 X144.087 Y116.306 E-.12828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.873 J-2.282 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08487
G1 X142.308 Y115.902 E-.13975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.713 E.02635
G3 X141.381 Y113.147 I2.318 J-.811 E.02589
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.713 E-.59519
G1 X141.308 Y114.38 E-.13127
G1 X141.297 Y114.293 E-.03354
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.713 Y119.495 Z4.8 F42000
G1 X103.041 Y149.933 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.0059
G1 X102.99 Y131.496 E.29354
G3 X104.786 Y129.594 I1.912 J.006 E.04678
G1 X122.973 Y129.591 E.29532
G3 X124.809 Y131.427 I-.085 J1.921 E.04628
G1 X124.81 Y149.504 E.29354
G3 X122.973 Y151.409 I-1.914 J-.007 E.04744
G1 X104.898 Y151.41 E.2935
G3 X103.057 Y149.991 I.016 J-1.925 E.04052
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.16074
G1 X102.991 Y147.996 E-.59926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.376 Z4.8 F42000
G1 X104.093 Y129.07 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00691
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.192 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.198 Y151.99 I-2.198 J-.096 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.089 J-2.191 E.0545
G1 X102.412 Y131.112 E.3034
G3 X104.035 Y129.085 I2.191 J.091 E.04512
M204 S10000
G1 X104.112 Y129.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.248979
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00335
; LINE_WIDTH: 0.187874
G3 X104.636 Y129.309 I.316 J2.425 E.00118
G1 X122.979 Y129.301 E.12437
G1 X123.351 Y129.327 E.00253
; LINE_WIDTH: 0.248738
G3 X123.586 Y129.375 I-.221 J1.692 E.00223
G1 X123.71 Y129.412 E.0012
; LINE_WIDTH: 0.299488
G3 X124.895 Y130.461 I-.642 J1.92 E.01842
G1 X124.906 Y130.483 E.00029
; LINE_WIDTH: 0.263305
G3 X125.023 Y130.805 I-1.918 J.879 E.00338
G1 X125.062 Y130.977 E.00173
; LINE_WIDTH: 0.188511
G3 X125.096 Y131.32 I-2.774 J.454 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.24698
G3 X125.025 Y150.186 I-1.794 J-.222 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.299103
G3 X124.006 Y151.462 I-1.927 J-.64 E.01761
G1 X123.885 Y151.519 E.00151
; LINE_WIDTH: 0.260962
G3 X123.425 Y151.662 I-.872 J-1.999 E.00471
G1 X123.415 Y151.663 E.0001
; LINE_WIDTH: 0.188481
G1 X122.979 Y151.699 E.00298
G1 X104.896 Y151.699 E.12306
G3 X104.475 Y151.677 I.019 J-4.299 E.00287
; LINE_WIDTH: 0.246739
G3 X104.212 Y151.625 I.222 J-1.825 E.00247
G1 X104.096 Y151.589 E.00112
; LINE_WIDTH: 0.299657
G3 X102.899 Y150.526 I.638 J-1.923 E.01866
; LINE_WIDTH: 0.263393
G3 X102.738 Y150.024 I1.989 J-.914 E.0052
G1 X102.737 Y150.015 E.00009
; LINE_WIDTH: 0.18821
G3 X102.715 Y149.85 I3.142 J-.499 E.00113
G1 X102.701 Y149.579 E.00184
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.196467
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240217
G3 X102.774 Y130.818 I2.065 J.198 E.00301
G1 X102.801 Y130.724 E.00088
; LINE_WIDTH: 0.296529
G3 X104.054 Y129.425 I1.929 J.607 E.02096
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.15998
G1 X104.636 Y129.309 E-.06597
G1 X106.041 Y129.308 E-.53405
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 45/95
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.578 J1.071 P1  F42000
G1 X151.54 Y104.731 Z4.8
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.856 Y104.827 E.00537
G3 X152.901 Y106.382 I-.646 J1.563 E.03226
G1 X152.901 Y121.418 E.24414
G3 X151.218 Y123.101 I-1.692 J-.008 E.04289
G1 X136.182 Y123.101 E.24414
G3 X134.499 Y121.418 I.008 J-1.692 E.04289
G1 X134.499 Y106.382 E.24414
G3 X136.182 Y104.699 I1.692 J.008 E.04289
G1 X151.218 Y104.699 E.24414
G3 X151.481 Y104.72 I-.008 J1.692 E.00429
; WIPE_START
M204 S6000
G1 X151.856 Y104.827 E-.14818
G1 X152.149 Y104.983 E-.12627
G1 X152.406 Y105.194 E-.12626
G1 X152.617 Y105.451 E-.12631
G1 X152.773 Y105.744 E-.12626
G1 X152.855 Y106.013 E-.10672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.361 Y104.565 Z4.9 F42000
G1 X143.77 Y104.257 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.85 Y104.262 E.13121
G3 X153.349 Y105.948 I-.199 J1.686 E.04007
G1 X153.348 Y121.913 E.25923
G3 X151.652 Y123.549 I-1.696 J-.06 E.04231
G1 X135.687 Y123.548 E.25923
G3 X134.051 Y121.852 I.06 J-1.696 E.04231
G1 X134.052 Y105.887 E.25923
G3 X135.687 Y104.252 I1.706 J.071 E.04125
G1 X143.71 Y104.257 E.13027
; WIPE_START
M204 S6000
G1 X145.709 Y104.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 45 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer45 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.414 Y104.484 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0926612
G1 F15000
M204 S6000
G1 X151.703 Y104.51 E.00084
; LINE_WIDTH: 0.137669
G1 X151.819 Y104.532 E.00056
; LINE_WIDTH: 0.171196
G3 X151.971 Y104.569 I-.298 J1.564 E.00095
G1 X152.084 Y104.614 E.00074
; LINE_WIDTH: 0.232008
G3 X152.867 Y105.272 I-.611 J1.52 E.00892
; LINE_WIDTH: 0.204952
G3 X153.028 Y105.62 I-2.969 J1.591 E.00286
; LINE_WIDTH: 0.156835
G3 X153.08 Y105.842 I-2.283 J.653 E.00126
; LINE_WIDTH: 0.123605
G1 X153.099 Y105.953 E.00047
; LINE_WIDTH: 0.087439
G1 X153.117 Y106.199 E.00066
M204 S10000
G1 X153.116 Y121.613 F42000
; LINE_WIDTH: 0.0926532
G1 F15000
M204 S6000
G1 X153.09 Y121.903 E.00084
; LINE_WIDTH: 0.150869
G3 X153.03 Y122.174 I-3.797 J-.692 E.00146
; LINE_WIDTH: 0.205018
G3 X152.867 Y122.528 I-2.343 J-.868 E.00292
; LINE_WIDTH: 0.23176
G3 X152.084 Y123.187 I-1.438 J-.915 E.00891
; LINE_WIDTH: 0.170887
G1 X151.971 Y123.231 E.00074
G3 X151.816 Y123.269 I-.456 J-1.547 E.00097
; LINE_WIDTH: 0.129622
G1 X151.646 Y123.299 E.00076
; LINE_WIDTH: 0.0874043
G1 X151.401 Y123.317 E.00066
M204 S10000
G1 X135.987 Y123.316 F42000
; LINE_WIDTH: 0.0926511
G1 F15000
M204 S6000
G1 X135.697 Y123.29 E.00084
; LINE_WIDTH: 0.150859
G3 X135.426 Y123.23 I.695 J-3.815 E.00146
; LINE_WIDTH: 0.204989
G3 X135.072 Y123.067 I.869 J-2.346 E.00292
; LINE_WIDTH: 0.231941
G3 X134.414 Y122.284 I.886 J-1.414 E.00891
; LINE_WIDTH: 0.171411
G1 X134.364 Y122.157 E.00083
G3 X134.331 Y122.015 I2.243 J-.604 E.00089
; LINE_WIDTH: 0.129467
G1 X134.301 Y121.846 E.00075
; LINE_WIDTH: 0.0874043
G1 X134.283 Y121.601 E.00066
M204 S10000
G1 X134.284 Y106.187 F42000
; LINE_WIDTH: 0.0926532
G1 F15000
M204 S6000
G1 X134.31 Y105.897 E.00084
; LINE_WIDTH: 0.137659
G1 X134.332 Y105.781 E.00056
; LINE_WIDTH: 0.171189
G3 X134.369 Y105.629 I1.564 J.298 E.00095
G1 X134.414 Y105.516 E.00074
; LINE_WIDTH: 0.232034
G3 X135.072 Y104.733 I1.547 J.633 E.00892
; LINE_WIDTH: 0.205078
G3 X135.426 Y104.57 I1.22 J2.179 E.00292
; LINE_WIDTH: 0.150872
G3 X135.697 Y104.51 I.964 J3.747 E.00146
; LINE_WIDTH: 0.0926651
G1 X135.986 Y104.484 E.00084
; WIPE_START
G1 X135.697 Y104.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.596 Y110.362 Z4.9 F42000
G1 X142.83 Y113.03 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02287
G3 X142.83 Y111.621 I2.31 J.9 E.03329
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53578
G1 X141.589 Y112.678 E-.14829
G1 X141.698 Y112.51 E-.07593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.509 Y111.6 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02628
G3 X143.768 Y111.461 I.811 J2.32 E.01449
G3 X144.452 Y111.582 I-.129 J2.739 E.01131
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59325
G1 X143.317 Y111.494 E-.16676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02287
G1 X144.602 Y111.633 E.00055
G3 X145.979 Y113.03 I-.933 J2.297 E.03275
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53569
G1 X144.602 Y111.633 E-.01277
G1 X144.864 Y111.756 E-.10991
G1 X145.091 Y111.897 E-.10164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.088 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.023 Y113.155 E.00116
G3 X146 Y114.71 I-2.314 J.743 E.0257
G1 X146 Y113.148 E.02537
; WIPE_START
M204 S6000
G1 X146.023 Y113.155 E-.00922
G1 X146.109 Y113.514 E-.14014
G1 X146.138 Y113.999 E-.18467
G1 X146.092 Y114.383 E-.14687
G1 X146 Y114.71 E-.12924
G1 X146 Y114.316 E-.14986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.179 I-2.227 J-1.052 E.03043
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.91 Y114.934 E-.06751
G1 X145.699 Y115.288 E-.15666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.02638
G3 X142.943 Y116.219 I-.811 J-2.377 E.02589
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.59578
G1 X144.115 Y116.304 E-.15545
G1 X144.092 Y116.306 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.865 J-2.275 E.03332
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.536 Y116.045 E-.12248
G1 X142.368 Y115.944 E-.07445
G1 X142.309 Y115.901 E-.02769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.089 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.712 E.02636
G3 X141.381 Y113.146 I2.361 J-.812 E.02587
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.712 E-.5952
G1 X141.292 Y114.292 E-.1648
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.708 Y119.495 Z4.9 F42000
G1 X103.041 Y149.93 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.035 Y149.91 E.00033
G3 X102.991 Y149.575 I1.866 J-.411 E.0055
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.93 J.023 E.04731
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.076 J1.912 E.0463
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.911 J-.003 E.04746
G1 X104.896 Y151.41 E.29357
G3 X103.136 Y150.231 I.005 J-1.911 E.03646
G1 X103.059 Y149.987 E.00415
; WIPE_START
M204 S6000
G1 X103.035 Y149.91 E-.03063
G1 X102.991 Y149.575 E-.12851
G1 X102.991 Y147.994 E-.60086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.374 Z4.9 F42000
G1 X104.093 Y129.07 Z4.9
G1 Z4.5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.00691
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.174 J2.184 E.0531
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.191 J-.089 E.05448
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.089 J-2.191 E.05448
G1 X102.412 Y131.114 E.30339
G3 X104.035 Y129.085 I2.191 J.089 E.04516
M204 S10000
G1 X104.112 Y129.408 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.248949
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00335
; LINE_WIDTH: 0.188319
G3 X104.637 Y129.309 I.317 J2.439 E.00119
G1 X122.979 Y129.301 E.1247
G1 X123.25 Y129.315 E.00184
; LINE_WIDTH: 0.241065
G3 X123.415 Y129.336 I-.332 J3.148 E.00149
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.296925
G3 X124.969 Y130.637 I-.616 J1.939 E.02079
; LINE_WIDTH: 0.250823
G3 X125.021 Y130.802 I-1.939 J.703 E.00161
G1 X125.074 Y131.049 E.00236
; LINE_WIDTH: 0.188338
G1 X125.099 Y131.417 E.00251
G1 X125.099 Y149.504 E.12298
G3 X125.076 Y149.928 I-4.285 J-.019 E.00288
; LINE_WIDTH: 0.249569
G3 X124.973 Y150.353 I-2.139 J-.293 E.00408
; LINE_WIDTH: 0.298583
G3 X124.005 Y151.463 I-1.912 J-.691 E.01701
G1 X123.774 Y151.566 E.00286
; LINE_WIDTH: 0.251179
G3 X123.337 Y151.675 I-.715 J-1.935 E.00422
; LINE_WIDTH: 0.188319
G3 X123.195 Y151.69 I-.304 J-2.236 E.00097
G1 X104.892 Y151.699 E.12443
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247168
G3 X104.214 Y151.625 I.222 J-1.795 E.00239
G1 X104.092 Y151.589 E.00117
; LINE_WIDTH: 0.29786
G3 X102.834 Y150.374 I.646 J-1.928 E.02036
; LINE_WIDTH: 0.254051
G3 X102.732 Y149.982 I2.17 J-.777 E.00384
; LINE_WIDTH: 0.188137
G3 X102.71 Y149.795 I4.427 J-.599 E.00128
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.196476
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240509
G3 X102.799 Y130.73 I2.07 J.197 E.00383
; LINE_WIDTH: 0.29659
G3 X104.054 Y129.425 I1.939 J.608 E.02104
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.15991
G1 X104.637 Y129.309 E-.06651
G1 X106.041 Y129.308 E-.53358
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 46/95
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4.9 I.579 J1.071 P1  F42000
G1 X151.547 Y104.708 Z4.9
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.55 Y104.709 E.00005
G3 X152.923 Y106.373 I-.33 J1.671 E.03793
G1 X152.923 Y121.427 E.24446
G3 X151.227 Y123.123 I-1.704 J-.008 E.04321
G1 X136.173 Y123.123 E.24446
G3 X134.477 Y121.427 I.008 J-1.704 E.04321
G1 X134.477 Y106.373 E.24446
G3 X136.173 Y104.677 I1.704 J.008 E.04321
G1 X151.227 Y104.677 E.24446
G1 X151.488 Y104.702 E.00424
; WIPE_START
M204 S6000
G1 X151.55 Y104.709 E-.02387
G1 X151.87 Y104.806 E-.12717
G1 X152.166 Y104.963 E-.12717
G1 X152.424 Y105.176 E-.12721
G1 X152.637 Y105.434 E-.12718
G1 X152.794 Y105.73 E-.12717
G1 X152.871 Y105.982 E-.10022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.376 Y104.538 Z5 F42000
G1 X143.77 Y104.229 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.869 Y104.234 E.13151
G3 X153.378 Y105.931 I-.201 J1.698 E.04033
G1 X153.376 Y121.932 E.25981
G3 X151.669 Y123.578 I-1.707 J-.062 E.04258
G1 X135.668 Y123.576 E.25981
G3 X134.022 Y121.869 I.062 J-1.707 E.04258
G1 X134.024 Y105.868 E.25981
G3 X135.668 Y104.224 I1.718 J.073 E.04149
G1 X143.71 Y104.229 E.13058
; WIPE_START
M204 S6000
G1 X145.71 Y104.23 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 46 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer46 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.359 Y104.456 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0856995
G1 F15000
M204 S6000
G1 X151.594 Y104.468 E.00062
; LINE_WIDTH: 0.114134
G1 X151.722 Y104.486 E.00049
; LINE_WIDTH: 0.145881
G1 X151.837 Y104.508 E.00059
; LINE_WIDTH: 0.179699
G3 X151.987 Y104.544 I-.293 J1.535 E.001
G1 X152.104 Y104.59 E.00081
; LINE_WIDTH: 0.241222
M73 P72 R8
G3 X152.89 Y105.253 I-.616 J1.529 E.00936
; LINE_WIDTH: 0.213889
G3 X153.051 Y105.6 I-2.941 J1.579 E.003
; LINE_WIDTH: 0.165196
G3 X153.104 Y105.823 I-2.073 J.608 E.00134
; LINE_WIDTH: 0.131707
G1 X153.123 Y105.936 E.00051
; LINE_WIDTH: 0.0908519
G1 X153.145 Y106.254 E.0009
M204 S10000
G1 X153.144 Y121.559 F42000
; LINE_WIDTH: 0.0860315
G1 F15000
M204 S6000
G1 X153.132 Y121.802 E.00064
; LINE_WIDTH: 0.115208
G1 X153.114 Y121.922 E.00046
; LINE_WIDTH: 0.159488
G3 X153.052 Y122.197 I-3.026 J-.532 E.00159
; LINE_WIDTH: 0.214175
G3 X152.89 Y122.547 I-2.213 J-.815 E.00303
; LINE_WIDTH: 0.240998
G3 X152.103 Y123.21 I-1.443 J-.915 E.00935
; LINE_WIDTH: 0.179403
G1 X151.987 Y123.256 E.0008
G3 X151.834 Y123.293 I-.45 J-1.522 E.00101
; LINE_WIDTH: 0.137635
G1 X151.663 Y123.323 E.00082
; LINE_WIDTH: 0.090818
G1 X151.346 Y123.345 E.0009
M204 S10000
G1 X136.041 Y123.344 F42000
; LINE_WIDTH: 0.0860315
G1 F15000
M204 S6000
G1 X135.798 Y123.332 E.00064
; LINE_WIDTH: 0.115208
G1 X135.678 Y123.314 E.00046
; LINE_WIDTH: 0.159168
G3 X135.406 Y123.254 I.626 J-3.472 E.00156
; LINE_WIDTH: 0.213936
G3 X135.053 Y123.09 I.869 J-2.346 E.00306
; LINE_WIDTH: 0.24117
G3 X134.39 Y122.304 I.891 J-1.422 E.00936
; LINE_WIDTH: 0.184241
G1 X134.319 Y122.088 E.00151
; LINE_WIDTH: 0.157371
G1 X134.296 Y121.981 E.00061
; LINE_WIDTH: 0.123833
G3 X134.268 Y121.802 I4.684 J-.846 E.00076
; LINE_WIDTH: 0.0866887
G1 X134.255 Y121.546 E.00068
M204 S10000
G1 X134.256 Y106.241 F42000
; LINE_WIDTH: 0.0856974
G1 F15000
M204 S6000
G1 X134.268 Y106.006 E.00062
; LINE_WIDTH: 0.114142
G1 X134.286 Y105.878 E.00049
; LINE_WIDTH: 0.145878
G1 X134.308 Y105.763 E.00059
; LINE_WIDTH: 0.179696
G3 X134.344 Y105.613 I1.535 J.293 E.001
G1 X134.39 Y105.496 E.00081
; LINE_WIDTH: 0.241254
G3 X135.053 Y104.71 I1.555 J.637 E.00936
; LINE_WIDTH: 0.214032
G3 X135.406 Y104.546 I1.219 J2.175 E.00306
; LINE_WIDTH: 0.159197
G3 X135.678 Y104.486 I.89 J3.377 E.00156
; LINE_WIDTH: 0.115195
G1 X135.798 Y104.468 E.00046
; LINE_WIDTH: 0.0860253
G1 X136.041 Y104.456 E.00064
; WIPE_START
G1 X135.798 Y104.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.642 Y110.366 Z5 F42000
G1 X142.83 Y113.03 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02287
G3 X142.83 Y111.621 I2.31 J.9 E.0333
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.5358
G1 X141.579 Y112.694 E-.14108
G1 X141.682 Y112.528 E-.07437
G1 X141.697 Y112.51 E-.00875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.89 Y111.598 E.02636
G3 X143.765 Y111.461 I.898 J2.87 E.01444
G3 X144.456 Y111.583 I-.228 J3.317 E.01141
; WIPE_START
M204 S6000
G1 X142.89 Y111.598 E-.59509
G1 X143.312 Y111.496 E-.16491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.689 Y111.67 E.00209
G3 X145.979 Y113.03 I-.991 J2.23 E.03124
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.689 Y111.67 E-.04881
G1 X145.092 Y111.898 E-.17581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00238
G3 X146 Y114.711 I-2.341 J.669 E.02445
G1 X146 Y113.15 E.02534
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03489
G1 X146.13 Y113.689 E-.17762
M73 P72 R7
G1 X146.138 Y113.999 E-.1177
G1 X146.092 Y114.383 E-.14687
G1 X146 Y114.711 E-.12947
G1 X146 Y114.307 E-.15345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02287
G1 X145.949 Y114.845 E.00131
G3 X144.57 Y116.179 I-2.251 J-.948 E.03202
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.5358
G1 X145.949 Y114.845 E-.03072
G1 X145.82 Y115.108 E-.11119
G1 X145.702 Y115.289 E-.08228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.887 Y116.2 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.02637
G3 X142.944 Y116.219 I-.81 J-2.332 E.0259
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.59555
G1 X144.118 Y116.304 E-.15452
G1 X144.092 Y116.306 E-.00993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.894 J-2.304 E.03329
G1 X142.77 Y114.77 E.02191
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53549
G1 X142.537 Y116.045 E-.12241
G1 X142.368 Y115.944 E-.07454
G1 X142.312 Y115.899 E-.02757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.089 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.713 E.02637
G3 X141.381 Y113.146 I2.329 J-.812 E.0259
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.713 E-.59559
G1 X141.293 Y114.294 E-.16441
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.708 Y119.497 Z5 F42000
G1 X103.041 Y149.933 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.091 J1.924 E.04619
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.898 Y151.41 E.29354
G3 X103.054 Y149.992 I.003 J-1.911 E.04061
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.16004
G1 X102.991 Y147.996 E-.59996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z5 F42000
G1 X104.093 Y129.07 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.0069
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.174 J2.184 E.0531
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.195 J-.093 E.05445
G1 X104.512 Y151.988 E.30342
G3 X102.41 Y149.798 I.091 J-2.191 E.05444
G1 X102.412 Y131.114 E.30339
G3 X104.036 Y129.086 I2.198 J.096 E.04512
M204 S10000
G1 X104.135 Y129.399 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25051
G1 F15000
M204 S6000
G1 X104.204 Y129.378 E.00068
G1 X104.465 Y129.325 E.00248
; LINE_WIDTH: 0.188504
G3 X104.637 Y129.309 I.316 J2.449 E.00118
G1 X122.983 Y129.301 E.12486
G1 X123.351 Y129.327 E.00251
; LINE_WIDTH: 0.250992
G3 X123.75 Y129.426 I-.355 J2.283 E.00385
; LINE_WIDTH: 0.300035
G3 X124.902 Y130.474 I-.688 J1.913 E.01815
G1 X124.906 Y130.484 E.00012
; LINE_WIDTH: 0.263377
G3 X125.023 Y130.805 I-2.182 J.974 E.00338
G1 X125.062 Y130.977 E.00173
; LINE_WIDTH: 0.188412
G3 X125.085 Y131.146 I-2.757 J.459 E.00116
G1 X125.099 Y131.417 E.00184
G1 X125.099 Y149.508 E.12306
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.243625
G3 X125.025 Y150.186 I-1.906 J-.189 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.297927
G3 X123.779 Y151.564 I-1.928 J-.642 E.02034
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.250489
G3 X123.335 Y151.675 I-.685 J-1.859 E.00412
; LINE_WIDTH: 0.188306
G3 X123.195 Y151.69 I-.301 J-2.222 E.00095
G1 X104.896 Y151.699 E.1244
G3 X104.475 Y151.677 I.025 J-4.537 E.00286
; LINE_WIDTH: 0.249244
G3 X104.048 Y151.573 I.309 J-2.203 E.00409
; LINE_WIDTH: 0.300811
G3 X102.9 Y150.529 I.69 J-1.911 E.01812
G1 X102.895 Y150.518 E.00014
; LINE_WIDTH: 0.262939
G3 X102.778 Y150.201 I1.744 J-.821 E.00334
G1 X102.737 Y150.015 E.00187
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.583 E.00294
G1 X102.701 Y131.489 E.12293
; LINE_WIDTH: 0.197764
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242403
G3 X102.8 Y130.728 I2.126 J.234 E.00367
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.297449
G3 X104.021 Y129.436 I1.948 J.633 E.02055
G1 X104.037 Y129.43 E.00019
; LINE_WIDTH: 0.25051
G1 X104.077 Y129.418 E.00039
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.204 Y129.378 E-.05048
G1 X104.465 Y129.325 E-.10117
G1 X104.637 Y129.309 E-.06572
G1 X106.065 Y129.308 E-.54263
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 47/95
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5 I.579 J1.07 P1  F42000
G1 X151.558 Y104.686 Z5
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.562 Y104.687 E.00008
G3 X152.945 Y106.363 I-.333 J1.683 E.0382
G1 X152.945 Y121.437 E.24478
G3 X151.237 Y123.145 I-1.716 J-.008 E.04352
G1 X136.163 Y123.145 E.24478
G3 X134.455 Y121.437 I.008 J-1.716 E.04352
G1 X134.455 Y106.363 E.24478
G3 X136.163 Y104.655 I1.716 J.008 E.04352
G1 X151.237 Y104.655 E.24478
G1 X151.498 Y104.68 E.00425
; WIPE_START
M204 S6000
G1 X151.562 Y104.687 E-.02455
G1 X151.885 Y104.785 E-.12807
G1 X152.182 Y104.943 E-.12809
G1 X152.443 Y105.157 E-.12809
G1 X152.657 Y105.418 E-.12808
G1 X152.815 Y105.715 E-.12813
G1 X152.888 Y105.954 E-.09498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.393 Y104.513 Z5.1 F42000
G1 X143.77 Y104.2 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.888 Y104.206 E.13181
G3 X153.406 Y105.914 I-.203 J1.709 E.04059
G1 X153.405 Y121.95 E.26039
G3 X151.686 Y123.606 I-1.718 J-.064 E.04284
G1 X135.65 Y123.605 E.26039
G3 X133.994 Y121.886 I.064 J-1.718 E.04284
G1 X133.995 Y105.85 E.26039
G3 X135.65 Y104.195 I1.729 J.075 E.04172
G1 X143.71 Y104.2 E.13088
; WIPE_START
M204 S6000
G1 X145.71 Y104.202 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 47 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer47 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.305 Y104.428 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0889752
G1 F15000
M204 S6000
G1 X151.607 Y104.443 E.00083
; LINE_WIDTH: 0.1215
G1 X151.74 Y104.462 E.00055
; LINE_WIDTH: 0.154043
G1 X151.855 Y104.483 E.00063
; LINE_WIDTH: 0.188205
G3 X152.003 Y104.52 I-.29 J1.517 E.00104
G1 X152.123 Y104.567 E.00088
; LINE_WIDTH: 0.250444
G3 X152.913 Y105.233 I-.621 J1.537 E.00981
; LINE_WIDTH: 0.222839
G3 X153.075 Y105.581 I-2.914 J1.567 E.00314
; LINE_WIDTH: 0.173544
G3 X153.128 Y105.805 I-1.926 J.578 E.00143
; LINE_WIDTH: 0.13977
G1 X153.148 Y105.919 E.00056
; LINE_WIDTH: 0.0942955
G3 X153.174 Y106.308 I-2.037 J.332 E.00116
M204 S10000
G1 X153.172 Y121.504 F42000
; LINE_WIDTH: 0.0893544
G1 F15000
M204 S6000
G3 X153.157 Y121.815 I-3.09 J0 E.00086
; LINE_WIDTH: 0.122665
G1 X153.138 Y121.94 E.00052
; LINE_WIDTH: 0.167473
G3 X153.077 Y122.213 I-3.18 J-.566 E.00167
; LINE_WIDTH: 0.222897
G3 X152.914 Y122.567 I-2.347 J-.87 E.0032
; LINE_WIDTH: 0.250238
G3 X152.123 Y123.233 I-1.455 J-.924 E.00979
; LINE_WIDTH: 0.19732
G3 X151.967 Y123.291 I-.432 J-.924 E.0012
; LINE_WIDTH: 0.169231
G1 X151.799 Y123.328 E.00104
; LINE_WIDTH: 0.140206
G1 X151.681 Y123.348 E.00058
; LINE_WIDTH: 0.094295
G1 X151.615 Y123.357 E.0002
G3 X151.292 Y123.374 I-.324 J-3.223 E.00096
M204 S10000
G1 X136.096 Y123.372 F42000
; LINE_WIDTH: 0.0893544
G1 F15000
M204 S6000
G3 X135.785 Y123.357 I0 J-3.09 E.00086
; LINE_WIDTH: 0.122674
G1 X135.66 Y123.338 E.00052
; LINE_WIDTH: 0.166665
G3 X135.397 Y123.28 I.55 J-3.14 E.0016
; LINE_WIDTH: 0.212588
G1 X135.383 Y123.276 E.00011
G3 X135.173 Y123.187 I.996 J-2.641 E.00178
; LINE_WIDTH: 0.248394
G3 X134.367 Y122.323 I.69 J-1.452 E.01119
; LINE_WIDTH: 0.192863
G1 X134.295 Y122.107 E.00159
; LINE_WIDTH: 0.16563
G1 X134.272 Y122 E.00064
; LINE_WIDTH: 0.140304
G1 X134.252 Y121.881 E.00058
; LINE_WIDTH: 0.094296
G1 X134.243 Y121.815 E.0002
G3 X134.226 Y121.492 I3.223 J-.324 E.00096
M204 S10000
G1 X134.228 Y106.296 F42000
; LINE_WIDTH: 0.0889833
G1 F15000
M204 S6000
G1 X134.243 Y105.993 E.00083
; LINE_WIDTH: 0.121506
G1 X134.262 Y105.86 E.00055
; LINE_WIDTH: 0.15404
G1 X134.283 Y105.745 E.00063
; LINE_WIDTH: 0.188207
G3 X134.319 Y105.597 I1.516 J.29 E.00104
G1 X134.367 Y105.477 E.00088
; LINE_WIDTH: 0.250369
G3 X135.026 Y104.69 I1.625 J.693 E.00971
G1 X135.033 Y104.686 E.00007
; LINE_WIDTH: 0.222521
G3 X135.387 Y104.523 I2.055 J3.991 E.00319
; LINE_WIDTH: 0.167485
G3 X135.66 Y104.462 I.836 J3.103 E.00167
; LINE_WIDTH: 0.122659
G1 X135.785 Y104.443 E.00052
; LINE_WIDTH: 0.0893528
G3 X136.095 Y104.428 I.314 J3.147 E.00086
; WIPE_START
G1 X135.785 Y104.443 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.626 Y110.344 Z5.1 F42000
G1 X142.83 Y113.03 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.622 I2.271 J.864 E.03332
G1 X142.83 Y112.97 E.02188
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.579 Y112.694 E-.14104
G1 X141.682 Y112.528 E-.07441
G1 X141.697 Y112.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.763 Y111.461 I.899 J2.876 E.01438
G3 X144.456 Y111.582 I-.146 J2.89 E.01146
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59492
G1 X143.313 Y111.496 E-.16508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.006 J2.243 E.03119
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04962
G1 X145.092 Y111.898 E-.175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.087 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.017 Y113.136 E.00085
G3 X146 Y114.711 I-2.389 J.761 E.02601
G1 X146 Y113.147 E.02539
; WIPE_START
M204 S6000
G1 X146.017 Y113.136 E-.00775
G1 X146.122 Y113.607 E-.18348
G1 X146.138 Y113.999 E-.14892
G1 X146.092 Y114.383 E-.14678
G1 X146 Y114.711 E-.12951
G1 X146 Y114.333 E-.14356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.1 F42000
G1 Z4.7
M73 P73 R7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.949 Y114.845 E.00131
G3 X144.57 Y116.178 I-2.255 J-.955 E.032
G1 X144.57 Y114.83 E.02188
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.949 Y114.845 E-.03075
G1 X145.764 Y115.201 E-.15257
G1 X145.699 Y115.288 E-.04085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.341 E.02587
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59507
G1 X144.087 Y116.304 E-.16493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.894 J-2.304 E.03328
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.624 Y116.09 E-.08494
G1 X142.369 Y115.945 E-.11152
G1 X142.31 Y115.901 E-.02816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.089 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02632
G3 X141.381 Y113.146 I2.354 J-.81 E.02583
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59427
G1 X141.291 Y114.287 E-.16573
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.707 Y119.491 Z5.1 F42000
G1 X103.041 Y149.93 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.035 Y149.909 E.00036
G3 X102.991 Y149.575 I1.871 J-.415 E.00547
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.913 J-.006 E.04742
G1 X104.896 Y151.41 E.29357
G3 X103.137 Y150.23 I.01 J-1.917 E.03644
G1 X103.059 Y149.987 E.00415
; WIPE_START
M204 S6000
G1 X103.035 Y149.909 E-.03117
G1 X102.991 Y149.575 E-.1278
G1 X102.991 Y147.993 E-.60104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.374 Z5.1 F42000
G1 X104.093 Y129.07 Z5.1
G1 Z4.7
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.514 Y129.012 E.0069
G1 X123.373 Y129.017 E.30624
G3 X125.39 Y131.204 I-.174 J2.184 E.0531
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.189 J-.087 E.05449
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.096 J-2.198 E.05443
G1 X102.412 Y131.114 E.30339
G3 X104.036 Y129.086 I2.198 J.096 E.04512
M204 S10000
G1 X104.112 Y129.408 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.248837
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00334
; LINE_WIDTH: 0.188338
G3 X104.637 Y129.309 I.317 J2.434 E.00119
G1 X122.983 Y129.301 E.12474
G1 X123.248 Y129.314 E.00181
; LINE_WIDTH: 0.240963
G3 X123.415 Y129.336 I-.581 J5.063 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.297027
G3 X124.969 Y130.638 I-.612 J1.934 E.0208
; LINE_WIDTH: 0.25139
G3 X125.074 Y131.051 I-1.904 J.701 E.004
; LINE_WIDTH: 0.188241
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12294
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.241655
G3 X125.026 Y150.186 I-1.971 J-.202 E.00285
G1 X125.001 Y150.269 E.00078
; LINE_WIDTH: 0.298682
G3 X124.082 Y151.419 I-1.94 J-.607 E.01701
G1 X123.916 Y151.507 E.00212
; LINE_WIDTH: 0.263123
G3 X123.595 Y151.623 I-.889 J-1.944 E.00337
G1 X123.42 Y151.663 E.00176
; LINE_WIDTH: 0.188506
G1 X122.983 Y151.699 E.00299
G1 X104.892 Y151.699 E.12313
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247181
G3 X104.214 Y151.625 I.222 J-1.797 E.00239
G1 X104.092 Y151.589 E.00117
; LINE_WIDTH: 0.298098
G3 X102.836 Y150.379 I.646 J-1.928 E.02031
; LINE_WIDTH: 0.254391
G3 X102.739 Y150.025 I1.961 J-.728 E.00348
G1 X102.731 Y149.98 E.00043
; LINE_WIDTH: 0.188133
G3 X102.71 Y149.795 I4.37 J-.591 E.00126
G1 X102.701 Y131.489 E.12432
; LINE_WIDTH: 0.189333
G1 X102.704 Y131.328 E.0011
; LINE_WIDTH: 0.21492
G1 X102.739 Y130.977 E.00278
; LINE_WIDTH: 0.255416
G3 X102.8 Y130.728 I2.374 J.453 E.00244
G1 X102.834 Y130.63 E.00099
; LINE_WIDTH: 0.298329
G3 X104.054 Y129.425 I1.898 J.701 E.01998
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.15983
G1 X104.637 Y129.309 E-.0665
G1 X106.042 Y129.308 E-.53368
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 48/95
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.1 I.579 J1.07 P1  F42000
G1 X151.568 Y104.664 Z5.1
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.574 Y104.665 E.00011
G3 X152.967 Y106.353 I-.335 J1.695 E.03848
G1 X152.967 Y121.447 E.24509
G3 X151.247 Y123.167 I-1.728 J-.008 E.04383
G1 X136.153 Y123.167 E.24509
G3 X134.433 Y121.447 I.008 J-1.728 E.04383
G1 X134.433 Y106.353 E.24509
G3 X136.153 Y104.633 I1.728 J.008 E.04383
G1 X151.247 Y104.633 E.24509
G1 X151.508 Y104.658 E.00426
; WIPE_START
M204 S6000
G1 X151.574 Y104.665 E-.0253
G1 X151.899 Y104.764 E-.12899
G1 X152.199 Y104.924 E-.12898
G1 X152.461 Y105.139 E-.12902
G1 X152.676 Y105.401 E-.12901
G1 X152.836 Y105.701 E-.12898
G1 X152.905 Y105.927 E-.08971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.41 Y104.487 Z5.2 F42000
G1 X143.771 Y104.172 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.907 Y104.178 E.13212
G3 X153.434 Y105.898 I-.205 J1.72 E.04085
G1 X153.433 Y121.968 E.26096
G3 X151.702 Y123.634 I-1.73 J-.065 E.04311
G1 X135.632 Y123.633 E.26096
G3 X133.966 Y121.902 I.065 J-1.73 E.04311
G1 X133.967 Y105.832 E.26096
G3 X135.632 Y104.167 I1.741 J.076 E.04197
G1 X143.711 Y104.172 E.13118
; WIPE_START
M204 S6000
G1 X145.71 Y104.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 48 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer48 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X151.25 Y104.399 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0922618
G1 F15000
M204 S6000
G1 X151.619 Y104.418 E.00107
; LINE_WIDTH: 0.128818
G1 X151.758 Y104.438 E.00061
; LINE_WIDTH: 0.173382
G3 X152.003 Y104.49 I-.42 J2.564 E.00155
; LINE_WIDTH: 0.208876
G1 X152.143 Y104.544 E.00114
; LINE_WIDTH: 0.259682
G3 X152.937 Y105.214 I-.626 J1.546 E.01026
; LINE_WIDTH: 0.231745
G3 X153.098 Y105.561 I-2.884 J1.553 E.00328
; LINE_WIDTH: 0.181917
G3 X153.152 Y105.786 I-1.796 J.551 E.00151
; LINE_WIDTH: 0.14783
G1 X153.172 Y105.903 E.00061
; LINE_WIDTH: 0.122454
G1 X153.182 Y105.972 E.00029
; LINE_WIDTH: 0.093369
G3 X153.202 Y106.363 I-4.042 J.399 E.00115
M204 S10000
G1 X153.201 Y121.45 F42000
; LINE_WIDTH: 0.0926667
G1 F15000
M204 S6000
G3 X153.182 Y121.828 I-3.896 J-.007 E.0011
; LINE_WIDTH: 0.130064
G1 X153.162 Y121.958 E.00058
; LINE_WIDTH: 0.174637
G3 X153.105 Y122.22 I-3.239 J-.571 E.00167
; LINE_WIDTH: 0.221233
G1 X153.101 Y122.233 E.00011
G3 X153.01 Y122.447 I-2.707 J-1.022 E.00189
; LINE_WIDTH: 0.257898
G3 X152.143 Y123.256 I-1.47 J-.705 E.01169
; LINE_WIDTH: 0.208876
G1 X152.003 Y123.31 E.00114
; LINE_WIDTH: 0.179235
G3 X151.819 Y123.352 I-.626 J-2.335 E.00122
; LINE_WIDTH: 0.148467
G1 X151.697 Y123.372 E.00064
; LINE_WIDTH: 0.121192
G1 X151.619 Y123.383 E.00032
; LINE_WIDTH: 0.0929545
G1 X151.237 Y123.402 E.00112
M204 S10000
G1 X136.15 Y123.401 F42000
; LINE_WIDTH: 0.0926667
G1 F15000
M204 S6000
G3 X135.772 Y123.382 I.007 J-3.896 E.0011
; LINE_WIDTH: 0.130061
G1 X135.642 Y123.362 E.00058
; LINE_WIDTH: 0.174636
G3 X135.38 Y123.305 I.572 J-3.241 E.00167
; LINE_WIDTH: 0.221202
G1 X135.367 Y123.301 E.00011
G3 X135.154 Y123.21 I1.019 J-2.702 E.00189
; LINE_WIDTH: 0.257587
G3 X134.343 Y122.342 I.694 J-1.461 E.01169
; LINE_WIDTH: 0.201458
G1 X134.271 Y122.126 E.00168
; LINE_WIDTH: 0.173874
G1 X134.248 Y122.018 E.00068
; LINE_WIDTH: 0.148347
G1 X134.228 Y121.897 E.00063
; LINE_WIDTH: 0.121201
G1 X134.217 Y121.819 E.00032
; LINE_WIDTH: 0.0929545
G1 X134.198 Y121.437 E.00112
M204 S10000
G1 X134.199 Y106.35 F42000
; LINE_WIDTH: 0.0922597
G1 F15000
M204 S6000
G1 X134.218 Y105.981 E.00107
; LINE_WIDTH: 0.128813
G1 X134.238 Y105.842 E.00061
; LINE_WIDTH: 0.173381
G3 X134.29 Y105.597 I2.562 J.42 E.00155
; LINE_WIDTH: 0.208876
G1 X134.344 Y105.457 E.00114
; LINE_WIDTH: 0.257885
G3 X135.154 Y104.59 I1.516 J.604 E.0117
; LINE_WIDTH: 0.221225
G3 X135.367 Y104.499 I1.242 J2.634 E.00189
G1 X135.38 Y104.495 E.00011
; LINE_WIDTH: 0.174638
G3 X135.642 Y104.438 I.834 J3.186 E.00167
; LINE_WIDTH: 0.130075
G1 X135.772 Y104.418 E.00058
; LINE_WIDTH: 0.0926783
G3 X136.15 Y104.399 I.384 J3.87 E.0011
; WIPE_START
G1 X135.772 Y104.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.61 Y110.322 Z5.2 F42000
G1 X142.83 Y113.03 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.621 I2.29 J.881 E.03332
G1 X142.83 Y112.97 E.02191
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.532 Y112.78 E-.10407
G1 X141.683 Y112.528 E-.11147
G1 X141.697 Y112.51 E-.00862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.889 Y111.599 E.02639
G3 X143.76 Y111.461 I.858 J2.596 E.01439
G3 X144.456 Y111.582 I-.141 J2.879 E.0115
; WIPE_START
M204 S6000
G1 X142.889 Y111.599 E-.59581
G1 X143.308 Y111.496 E-.1642
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-.993 J2.23 E.0312
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04965
G1 X145.092 Y111.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.091 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.049 Y113.243 E.0026
G3 X146 Y114.713 I-2.438 J.654 E.02423
G1 X146 Y113.151 E.02537
; WIPE_START
M204 S6000
G1 X146.049 Y113.243 E-.03977
G1 X146.131 Y113.695 E-.17431
G1 X146.138 Y113.999 E-.11576
G1 X146.111 Y114.273 E-.10449
G1 X146 Y114.713 E-.17256
G1 X146 Y114.31 E-.1531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.00289
G3 X144.57 Y116.179 I-2.225 J-1.05 E.03043
G1 X144.57 Y114.83 E.02191
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.91 Y114.934 E-.06753
G1 X145.699 Y115.288 E-.15664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.892 Y116.2 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.0263
G3 X142.949 Y116.219 I-.808 J-2.371 E.0258
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.59379
G1 X144.133 Y116.301 E-.14873
G1 X144.087 Y116.305 E-.01749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02287
G3 X141.421 Y114.77 I.878 J-2.288 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53565
G1 X142.624 Y116.09 E-.085
G1 X142.369 Y115.945 E-.11145
G1 X142.312 Y115.899 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.709 E.02629
G3 X141.381 Y113.147 I2.308 J-.81 E.02583
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.709 E-.59381
G1 X141.308 Y114.38 E-.12993
G1 X141.296 Y114.285 E-.03626
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.712 Y119.488 Z5.2 F42000
G1 X103.041 Y149.929 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.03 Y149.873 E.00093
G3 X102.991 Y149.575 I1.893 J-.397 E.00489
G1 X102.99 Y131.496 E.29357
G3 X104.789 Y129.593 I1.913 J.007 E.04682
G1 X122.975 Y129.591 E.2953
G3 X124.809 Y131.425 I-.081 J1.915 E.04625
G1 X124.81 Y149.503 E.29356
G3 X122.975 Y151.409 I-1.919 J-.012 E.04739
G1 X104.897 Y151.41 E.29355
G3 X103.076 Y150.052 I.026 J-1.934 E.03942
G1 X103.058 Y149.987 E.0011
; WIPE_START
M204 S6000
G1 X103.03 Y149.873 E-.04446
G1 X102.991 Y149.575 E-.1143
G1 X102.991 Y147.993 E-.60124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.373 Z5.2 F42000
G1 X104.093 Y129.07 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00686
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.193 J2.201 E.053
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.191 J-.089 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.30339
G3 X104.035 Y129.085 I2.191 J.089 E.04517
M204 S10000
G1 X104.133 Y129.401 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251475
G1 F15000
M204 S6000
G1 X104.249 Y129.367 E.00114
G3 X104.46 Y129.326 I.503 J2.038 E.00202
; LINE_WIDTH: 0.187922
G3 X104.636 Y129.309 I.288 J2.064 E.0012
G1 X122.983 Y129.301 E.12443
G1 X123.351 Y129.327 E.0025
; LINE_WIDTH: 0.250972
G3 X123.749 Y129.426 I-.363 J2.31 E.00384
; LINE_WIDTH: 0.29867
G3 X124.969 Y130.636 I-.689 J1.914 E.02004
; LINE_WIDTH: 0.252332
G3 X125.073 Y131.047 I-1.911 J.704 E.004
; LINE_WIDTH: 0.188246
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.507 E.12293
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.243636
G3 X125.055 Y150.058 I-2.521 J-.288 E.00169
G1 X124.99 Y150.305 E.00231
; LINE_WIDTH: 0.297551
G3 X123.76 Y151.57 I-1.926 J-.641 E.02053
; LINE_WIDTH: 0.251685
G3 X123.34 Y151.675 I-.739 J-2.071 E.00406
; LINE_WIDTH: 0.188224
G1 X122.983 Y151.699 E.00243
G1 X104.893 Y151.699 E.12291
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.244311
G3 X104.259 Y151.637 I.289 J-2.482 E.00246
G1 X104.095 Y151.589 E.00155
; LINE_WIDTH: 0.297636
G3 X102.83 Y150.36 I.639 J-1.925 E.02054
; LINE_WIDTH: 0.251634
G3 X102.725 Y149.94 I2.122 J-.749 E.00406
; LINE_WIDTH: 0.188038
G3 X102.71 Y149.795 I2.836 J-.37 E.00099
G1 X102.701 Y131.489 E.12425
; LINE_WIDTH: 0.198199
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242721
G3 X102.8 Y130.728 I2.219 J.252 E.00367
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.297062
G3 X104.04 Y129.43 I1.944 J.63 E.02075
; LINE_WIDTH: 0.251475
G1 X104.075 Y129.419 E.00035
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.249 Y129.367 E-.06885
G1 X104.46 Y129.326 E-.08176
G1 X104.636 Y129.309 E-.06726
G1 X106.063 Y129.308 E-.54212
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 49/95
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.58 J1.07 P1  F42000
G1 X151.578 Y104.642 Z5.2
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.586 Y104.644 E.00014
G3 X152.989 Y106.343 I-.338 J1.707 E.03875
G1 X152.989 Y121.457 E.24541
G3 X151.257 Y123.189 I-1.74 J-.008 E.04414
G1 X136.143 Y123.189 E.24541
G3 X134.411 Y121.457 I.008 J-1.74 E.04414
G1 X134.411 Y106.343 E.24541
G3 X136.143 Y104.611 I1.74 J.008 E.04414
G1 X151.257 Y104.611 E.24541
G1 X151.518 Y104.636 E.00427
; WIPE_START
M204 S6000
G1 X151.586 Y104.644 E-.02612
G1 X151.914 Y104.742 E-.12989
G1 X152.215 Y104.904 E-.12991
G1 X152.479 Y105.121 E-.12992
G1 X152.696 Y105.385 E-.12992
G1 X152.858 Y105.686 E-.1299
G1 X152.922 Y105.899 E-.08435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.426 Y104.461 Z5.3 F42000
G1 X143.771 Y104.144 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.926 Y104.149 E.13242
G3 X153.463 Y105.881 I-.206 J1.731 E.04111
G1 X153.461 Y121.987 E.26154
G3 X151.719 Y123.663 I-1.741 J-.067 E.04337
G1 X135.613 Y123.661 E.26154
G3 X133.937 Y121.919 I.067 J-1.741 E.04337
G1 X133.939 Y105.813 E.26154
G3 X135.613 Y104.139 I1.752 J.078 E.04221
G1 X143.711 Y104.144 E.13149
; WIPE_START
M204 S6000
G1 X145.711 Y104.145 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 49 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer49 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.711 Y104.375 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0807507
G1 F15000
M204 S6000
G1 X151.267 Y104.375 E.01342
G1 X151.632 Y104.393 E.00088
; LINE_WIDTH: 0.136225
G1 X151.776 Y104.414 E.00068
; LINE_WIDTH: 0.181382
G3 X152.019 Y104.466 I-.415 J2.532 E.00162
; LINE_WIDTH: 0.217219
G3 X152.161 Y104.52 I-.273 J.928 E.00122
; LINE_WIDTH: 0.26597
G3 X153.058 Y105.387 I-.596 J1.512 E.01275
; LINE_WIDTH: 0.224532
G3 X153.129 Y105.564 I-1.722 J.794 E.00158
; LINE_WIDTH: 0.188064
G3 X153.176 Y105.767 I-1.897 J.552 E.00141
; LINE_WIDTH: 0.155915
G1 X153.196 Y105.886 E.00066
; LINE_WIDTH: 0.129727
M73 P74 R7
G1 X153.207 Y105.959 E.00033
; LINE_WIDTH: 0.0814524
G3 X153.226 Y106.33 I-3.695 J.372 E.00091
G1 X153.225 Y121.467 E.037
G1 X153.207 Y121.832 E.00089
; LINE_WIDTH: 0.136219
G1 X153.186 Y121.976 E.00068
; LINE_WIDTH: 0.181381
G3 X153.134 Y122.219 I-2.53 J-.414 E.00162
; LINE_WIDTH: 0.217326
G3 X153.08 Y122.362 I-.934 J-.274 E.00123
; LINE_WIDTH: 0.264747
G3 X152.162 Y123.28 I-1.529 J-.611 E.01322
; LINE_WIDTH: 0.218313
G1 X152.036 Y123.329 E.00109
; LINE_WIDTH: 0.193172
G1 X151.889 Y123.365 E.00106
; LINE_WIDTH: 0.161674
G1 X151.714 Y123.396 E.00102
; LINE_WIDTH: 0.129647
G1 X151.641 Y123.407 E.00032
; LINE_WIDTH: 0.0814524
G3 X151.27 Y123.426 I-.372 J-3.695 E.00091
G1 X136.133 Y123.425 E.037
G1 X135.768 Y123.407 E.00089
; LINE_WIDTH: 0.136219
G1 X135.624 Y123.386 E.00068
; LINE_WIDTH: 0.181377
G3 X135.381 Y123.334 I.415 J-2.534 E.00162
; LINE_WIDTH: 0.217305
G3 X135.238 Y123.28 I.272 J-.928 E.00122
; LINE_WIDTH: 0.268919
G3 X134.44 Y122.605 I.662 J-1.592 E.0107
; LINE_WIDTH: 0.240409
G3 X134.277 Y122.255 I3.65 J-1.909 E.00344
; LINE_WIDTH: 0.195007
G3 X134.235 Y122.091 I1.707 J-.527 E.0012
; LINE_WIDTH: 0.161798
G1 X134.204 Y121.914 E.00103
; LINE_WIDTH: 0.129647
G1 X134.193 Y121.841 E.00032
; LINE_WIDTH: 0.0810688
G3 X134.174 Y121.47 I3.695 J-.372 E.0009
G1 X134.175 Y106.33 E.03677
; LINE_WIDTH: 0.0978716
G1 X134.193 Y105.968 E.00113
; LINE_WIDTH: 0.136219
G1 X134.214 Y105.824 E.00068
; LINE_WIDTH: 0.181381
G3 X134.265 Y105.581 I2.53 J.414 E.00162
; LINE_WIDTH: 0.217326
G3 X134.32 Y105.438 I.934 J.274 E.00123
; LINE_WIDTH: 0.264725
G3 X135.238 Y104.52 I1.529 J.611 E.01323
; LINE_WIDTH: 0.219345
G3 X135.364 Y104.47 I.554 J1.222 E.00109
; LINE_WIDTH: 0.182693
G3 X135.624 Y104.414 I.815 J3.099 E.00175
; LINE_WIDTH: 0.137569
G1 X135.759 Y104.394 E.00065
; LINE_WIDTH: 0.0807507
G3 X136.13 Y104.375 I.375 J3.754 E.0009
G1 X145.651 Y104.375 E.023
; WIPE_START
G1 X147.651 Y104.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.937 Y111.043 Z5.3 F42000
G1 X142.83 Y113.03 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.336 J.927 E.03326
G1 X142.83 Y112.97 E.0219
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53559
G1 X141.627 Y112.613 E-.17677
G1 X141.698 Y112.509 E-.04764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.508 Y111.6 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02626
G3 X143.944 Y111.472 I.854 J2.681 E.01732
G3 X144.451 Y111.583 I-.607 J3.995 E.00843
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.5926
G1 X143.319 Y111.494 E-.16741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02287
G1 X144.602 Y111.633 E.00055
G3 X145.979 Y113.03 I-.916 J2.279 E.03277
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53565
G1 X144.602 Y111.633 E-.01286
G1 X144.785 Y111.715 E-.07638
G1 X145.091 Y111.897 E-.1351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00239
G3 X146 Y114.71 I-2.426 J.666 E.02442
G1 X146 Y113.15 E.02534
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03489
G1 X146.131 Y113.697 E-.1805
G1 X146.138 Y113.999 E-.11483
G1 X146.111 Y114.275 E-.10543
G1 X146 Y114.71 E-.17067
G1 X146 Y114.306 E-.15368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.178 I-2.276 J-1.107 E.03038
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53559
G1 X145.91 Y114.934 E-.06748
G1 X145.699 Y115.289 E-.15693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.417 Y116.232 E.00157
G3 X142.943 Y116.219 I-.716 J-2.342 E.02431
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59479
G1 X144.417 Y116.232 E-.03685
G1 X144.087 Y116.306 E-.12836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.874 J-2.284 E.03331
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.615 Y116.085 E-.08911
G1 X142.308 Y115.902 E-.13552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02631
G3 X141.381 Y113.146 I2.317 J-.81 E.02584
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59418
G1 X141.291 Y114.287 E-.16582
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.708 Y119.491 Z5.3 F42000
G1 X103.041 Y149.933 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00588
G1 X102.99 Y131.496 E.29357
G3 X104.749 Y129.596 I1.914 J.008 E.04617
G1 X122.975 Y129.591 E.29596
G3 X124.809 Y131.425 I-.076 J1.91 E.04628
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.012 J-1.919 E.04052
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.16024
G1 X102.991 Y147.997 E-.59977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z5.3 F42000
G1 X104.093 Y129.07 Z5.3
G1 Z4.9
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00686
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.179 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.191 J-.089 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.114 E.30335
G3 X104.036 Y129.085 I2.196 J.093 E.04515
M204 S10000
G1 X104.121 Y129.402 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243217
G1 F15000
M204 S6000
G3 X104.508 Y129.319 I.703 J2.337 E.00358
; LINE_WIDTH: 0.187851
G1 X104.892 Y129.301 E.0026
G1 X122.983 Y129.301 E.12265
G1 X123.351 Y129.327 E.0025
; LINE_WIDTH: 0.251
G3 X123.749 Y129.426 I-.354 J2.28 E.00384
; LINE_WIDTH: 0.298225
G3 X124.97 Y130.64 I-.683 J1.907 E.02006
; LINE_WIDTH: 0.251866
G3 X125.074 Y131.052 I-1.868 J.689 E.004
; LINE_WIDTH: 0.188341
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12301
G1 X125.075 Y149.933 E.0029
; LINE_WIDTH: 0.247148
G3 X125.055 Y150.057 I-1.557 J-.195 E.00115
G1 X124.99 Y150.305 E.00235
; LINE_WIDTH: 0.298027
G3 X123.779 Y151.564 I-1.926 J-.64 E.02035
; LINE_WIDTH: 0.252413
G3 X123.34 Y151.675 I-.764 J-2.096 E.00426
; LINE_WIDTH: 0.188332
G1 X122.983 Y151.699 E.00244
G1 X104.892 Y151.699 E.123
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.247428
G3 X104.303 Y151.647 I.435 J-2.926 E.00151
G1 X104.092 Y151.589 E.00202
; LINE_WIDTH: 0.29959
G3 X102.899 Y150.525 I.644 J-1.925 E.01862
; LINE_WIDTH: 0.26336
G3 X102.738 Y150.025 I2.056 J-.935 E.0052
G1 X102.737 Y150.017 E.00008
; LINE_WIDTH: 0.188216
G3 X102.719 Y149.89 I2.138 J-.357 E.00087
G1 X102.701 Y149.583 E.00209
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.198208
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.244295
G3 X102.81 Y130.695 I2.201 J.249 E.00401
; LINE_WIDTH: 0.29627
G3 X104.064 Y129.421 I1.935 J.65 E.02072
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.508 Y129.319 E-.17308
G1 X104.892 Y129.301 E-.14595
G1 X106.052 Y129.301 E-.44097
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 50/95
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.3 I.58 J1.07 P1  F42000
G1 X151.588 Y104.62 Z5.3
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.599 Y104.622 E.00018
G3 X153.011 Y106.334 I-.34 J1.719 E.03902
G1 X153.011 Y121.466 E.24573
G3 X151.266 Y123.211 I-1.753 J-.008 E.04445
G1 X136.134 Y123.211 E.24573
G3 X134.389 Y121.466 I.008 J-1.753 E.04445
G1 X134.389 Y106.334 E.24573
G3 X136.134 Y104.589 I1.753 J.008 E.04445
G1 X151.266 Y104.589 E.24573
G1 X151.528 Y104.615 E.00427
; WIPE_START
M204 S6000
G1 X151.599 Y104.622 E-.02701
G1 X151.928 Y104.721 E-.1308
G1 X152.232 Y104.884 E-.13083
G1 X152.498 Y105.102 E-.13081
G1 X152.716 Y105.368 E-.13082
G1 X152.879 Y105.672 E-.13082
G1 X152.939 Y105.871 E-.0789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.442 Y104.436 Z5.4 F42000
G1 X143.771 Y104.116 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.944 Y104.121 E.13272
G3 X153.491 Y105.864 I-.208 J1.742 E.04137
G1 X153.49 Y122.006 E.26211
G3 X151.736 Y123.691 I-1.752 J-.068 E.04363
G1 X135.594 Y123.69 E.26211
G3 X133.909 Y121.936 I.068 J-1.752 E.04364
G1 X133.91 Y105.794 E.26211
G3 X135.594 Y104.11 I1.764 J.08 E.04244
G1 X143.711 Y104.116 E.1318
; WIPE_START
M204 S6000
G1 X145.711 Y104.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 50 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer50 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.711 Y104.35 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0870822
G1 F15000
M204 S6000
G1 X151.277 Y104.35 E.01488
G1 X151.644 Y104.368 E.00098
; LINE_WIDTH: 0.143589
G1 X151.795 Y104.389 E.00076
; LINE_WIDTH: 0.189341
G3 X152.035 Y104.441 I-.411 J2.505 E.00168
; LINE_WIDTH: 0.225763
G3 X152.182 Y104.497 I-.288 J.979 E.00131
; LINE_WIDTH: 0.275188
G3 X153.081 Y105.367 I-.601 J1.521 E.01328
; LINE_WIDTH: 0.233153
G3 X153.153 Y105.548 I-1.761 J.811 E.00168
; LINE_WIDTH: 0.196159
G3 X153.2 Y105.748 I-1.839 J.537 E.00147
; LINE_WIDTH: 0.163955
G1 X153.221 Y105.869 E.00071
; LINE_WIDTH: 0.136993
G1 X153.232 Y105.946 E.00036
; LINE_WIDTH: 0.0878026
G3 X153.251 Y106.32 I-3.844 J.382 E.00101
G1 X153.25 Y121.477 E.04097
G1 X153.232 Y121.844 E.00099
; LINE_WIDTH: 0.143589
G1 X153.211 Y121.995 E.00076
; LINE_WIDTH: 0.189354
G3 X153.159 Y122.235 I-2.506 J-.411 E.00168
; LINE_WIDTH: 0.225758
G3 X153.103 Y122.382 I-.984 J-.29 E.00131
; LINE_WIDTH: 0.276355
G3 X152.29 Y123.255 I-1.533 J-.613 E.01268
; LINE_WIDTH: 0.23816
G3 X152.052 Y123.354 I-1.139 J-2.394 E.00227
; LINE_WIDTH: 0.201226
G1 X151.908 Y123.389 E.00109
; LINE_WIDTH: 0.169655
G1 X151.73 Y123.421 E.00109
; LINE_WIDTH: 0.136913
G1 X151.654 Y123.432 E.00036
; LINE_WIDTH: 0.0878026
G3 X151.28 Y123.451 I-.382 J-3.844 E.00101
G1 X136.123 Y123.45 E.04097
G1 X135.756 Y123.432 E.00099
; LINE_WIDTH: 0.143584
G1 X135.605 Y123.411 E.00076
; LINE_WIDTH: 0.189342
G3 X135.365 Y123.359 I.412 J-2.512 E.00168
; LINE_WIDTH: 0.225755
G3 X135.218 Y123.303 I.29 J-.984 E.00131
; LINE_WIDTH: 0.278055
G3 X134.416 Y122.625 I.656 J-1.59 E.01116
; LINE_WIDTH: 0.249589
G3 X134.254 Y122.275 I3.889 J-2.012 E.00359
; LINE_WIDTH: 0.198937
G3 X134.2 Y122.056 I1.667 J-.524 E.00163
; LINE_WIDTH: 0.1645
G1 X134.179 Y121.931 E.00074
; LINE_WIDTH: 0.136993
G1 X134.168 Y121.854 E.00036
; LINE_WIDTH: 0.0874148
G3 X134.149 Y121.48 I3.844 J-.382 E.00101
G1 X134.15 Y106.32 E.04074
; LINE_WIDTH: 0.104319
G1 X134.168 Y105.956 E.00123
; LINE_WIDTH: 0.143589
G1 X134.189 Y105.805 E.00076
; LINE_WIDTH: 0.189341
G3 X134.241 Y105.565 I2.504 J.411 E.00168
; LINE_WIDTH: 0.225757
G3 X134.297 Y105.418 I.978 J.288 E.00131
; LINE_WIDTH: 0.273883
G3 X135.219 Y104.496 I1.537 J.615 E.01378
; LINE_WIDTH: 0.227878
G3 X135.348 Y104.446 I.573 J1.27 E.00116
; LINE_WIDTH: 0.190719
G3 X135.605 Y104.389 I.799 J3.03 E.00182
; LINE_WIDTH: 0.145022
G1 X135.746 Y104.369 E.00072
; LINE_WIDTH: 0.0870822
G3 X136.12 Y104.35 I.38 J3.818 E.001
G1 X145.651 Y104.35 E.02548
; WIPE_START
G1 X147.651 Y104.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.945 Y111.022 Z5.4 F42000
G1 X142.83 Y113.03 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.621 I2.335 J.925 E.03326
G1 X142.83 Y112.97 E.0219
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.53565
G1 X141.629 Y112.611 E-.17764
G1 X141.698 Y112.509 E-.04671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.891 Y111.598 E.02635
G3 X143.944 Y111.472 I.854 J2.68 E.01733
G3 X144.457 Y111.581 I-.26 J2.493 E.00852
; WIPE_START
M204 S6000
G1 X142.891 Y111.598 E-.59505
G1 X143.313 Y111.496 E-.16495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.67 E.00212
G3 X145.979 Y113.03 I-1.034 J2.269 E.03117
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.67 E-.04951
G1 X145.092 Y111.898 E-.17511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00238
G3 X146 Y114.71 I-2.426 J.666 E.02442
G1 X146 Y113.15 E.02533
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03487
G1 X146.132 Y113.708 E-.18487
G1 X146.138 Y113.999 E-.11048
G1 X146.11 Y114.278 E-.10641
G1 X146 Y114.71 E-.16966
G1 X146 Y114.306 E-.15371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.978 Y114.77 E.02287
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.179 I-2.248 J-1.075 E.03041
G1 X144.57 Y114.83 E.0219
; WIPE_START
M204 S6000
G1 X145.978 Y114.77 E-.53564
G1 X145.91 Y114.934 E-.06749
G1 X145.699 Y115.289 E-.15687
; WIPE_END
M73 P75 R7
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.511 Y116.201 E.02638
G3 X142.943 Y116.219 I-.811 J-2.378 E.02589
; WIPE_START
M204 S6000
G1 X144.511 Y116.201 E-.5958
G1 X144.125 Y116.302 E-.15142
G1 X144.092 Y116.305 E-.01279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.863 J-2.273 E.03332
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53543
G1 X142.452 Y115.997 E-.15917
G1 X142.308 Y115.903 E-.0654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02631
G3 X141.381 Y113.146 I2.315 J-.81 E.02584
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59416
G1 X141.291 Y114.287 E-.16584
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.707 Y119.491 Z5.4 F42000
G1 X103.041 Y149.93 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.035 Y149.906 E.00039
G3 X102.991 Y149.575 I1.873 J-.415 E.00543
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.919 J.013 E.0462
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.084 J1.918 E.04624
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.919 J-.01 E.04742
G1 X104.896 Y151.41 E.29357
G3 X103.138 Y150.23 I.012 J-1.919 E.03642
G1 X103.059 Y149.987 E.00415
; WIPE_START
M204 S6000
G1 X103.035 Y149.906 E-.03201
G1 X102.991 Y149.575 E-.12701
G1 X102.991 Y147.993 E-.60098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.374 Z5.4 F42000
G1 X104.094 Y129.07 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00686
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.181 J2.19 E.05306
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.192 J-.09 E.05447
G1 X104.512 Y151.988 E.30342
G3 X102.41 Y149.796 I.089 J-2.189 E.05449
G1 X102.412 Y131.114 E.30335
G3 X104.036 Y129.085 I2.196 J.093 E.04515
M204 S10000
G1 X104.112 Y129.408 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.248004
G1 F15000
M204 S6000
G1 X104.463 Y129.325 E.00333
; LINE_WIDTH: 0.187936
G3 X104.633 Y129.309 I.281 J2.043 E.00116
G1 X122.983 Y129.301 E.12446
G1 X123.351 Y129.327 E.0025
; LINE_WIDTH: 0.248883
G1 X123.71 Y129.413 E.00342
; LINE_WIDTH: 0.297606
G3 X124.969 Y130.638 I-.641 J1.918 E.02044
; LINE_WIDTH: 0.251283
G3 X125.023 Y130.804 I-1.87 J.693 E.00164
G1 X125.074 Y131.052 E.00237
; LINE_WIDTH: 0.188236
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243794
G3 X125.025 Y150.186 I-1.885 J-.184 E.00288
G1 X124.989 Y150.308 E.00115
; LINE_WIDTH: 0.297691
G3 X123.779 Y151.564 I-1.935 J-.653 E.02028
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.25048
G3 X123.334 Y151.675 I-.686 J-1.861 E.00412
; LINE_WIDTH: 0.188308
G3 X123.195 Y151.69 I-.301 J-2.228 E.00096
G1 X104.892 Y151.699 E.12442
G3 X104.473 Y151.676 I0 J-3.834 E.00285
; LINE_WIDTH: 0.24906
G3 X104.044 Y151.572 I.349 J-2.374 E.0041
; LINE_WIDTH: 0.298839
G3 X102.835 Y150.375 I.695 J-1.912 E.01984
; LINE_WIDTH: 0.25417
G3 X102.738 Y150.02 I1.967 J-.727 E.0035
G1 X102.73 Y149.978 E.00041
; LINE_WIDTH: 0.188125
G1 X102.701 Y149.583 E.00269
G1 X102.701 Y131.489 E.12287
; LINE_WIDTH: 0.19665
G1 X102.715 Y131.147 E.00244
; LINE_WIDTH: 0.241534
G3 X102.798 Y130.734 I2.113 J.21 E.00378
G1 X102.801 Y130.723 E.0001
; LINE_WIDTH: 0.296441
G3 X104.055 Y129.425 I1.938 J.616 E.02095
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.463 Y129.325 E-.15973
G1 X104.633 Y129.309 E-.06493
G1 X106.042 Y129.308 E-.53534
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 51/95
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.58 J1.07 P1  F42000
G1 X151.597 Y104.598 Z5.4
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.611 Y104.6 E.00022
G3 X153.033 Y106.324 I-.342 J1.731 E.03929
G1 X153.033 Y121.476 E.24604
G3 X151.276 Y123.233 I-1.765 J-.008 E.04476
G1 X136.124 Y123.233 E.24604
G3 X134.367 Y121.476 I.008 J-1.765 E.04476
G1 X134.367 Y106.324 E.24604
G3 X136.124 Y104.567 I1.765 J.008 E.04476
G1 X151.276 Y104.567 E.24604
G1 X151.537 Y104.593 E.00426
; WIPE_START
M204 S6000
G1 X151.611 Y104.6 E-.02799
G1 X151.943 Y104.7 E-.13171
G1 X152.248 Y104.864 E-.13172
G1 X152.516 Y105.084 E-.13173
G1 X152.736 Y105.352 E-.13175
G1 X152.9 Y105.657 E-.13171
G1 X152.956 Y105.842 E-.07339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.459 Y104.41 Z5.5 F42000
G1 X143.771 Y104.088 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.963 Y104.093 E.13302
G3 X153.519 Y105.847 I-.207 J1.75 E.04165
G1 X153.518 Y122.024 E.26268
G3 X151.753 Y123.719 I-1.764 J-.07 E.0439
G1 X135.576 Y123.718 E.26268
G3 X133.881 Y121.953 I.07 J-1.764 E.0439
G1 X133.882 Y105.776 E.26268
G3 X135.576 Y104.082 I1.775 J.081 E.04269
G1 X143.711 Y104.088 E.1321
; WIPE_START
M204 S6000
G1 X145.711 Y104.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 51 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer51 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.711 Y104.325 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.093414
G1 F15000
M204 S6000
G1 X151.286 Y104.325 E.01634
G1 X151.657 Y104.343 E.00109
; LINE_WIDTH: 0.15092
G1 X151.813 Y104.365 E.00083
; LINE_WIDTH: 0.197266
G3 X152.05 Y104.416 I-.407 J2.481 E.00174
; LINE_WIDTH: 0.234187
G3 X152.201 Y104.473 I-.305 J1.032 E.0014
; LINE_WIDTH: 0.284394
G3 X153.104 Y105.347 I-.616 J1.54 E.0138
; LINE_WIDTH: 0.241716
G3 X153.178 Y105.532 I-1.793 J.825 E.00178
; LINE_WIDTH: 0.204247
G3 X153.224 Y105.73 I-1.779 J.522 E.00152
; LINE_WIDTH: 0.172026
G1 X153.245 Y105.852 E.00076
; LINE_WIDTH: 0.144269
G1 X153.257 Y105.933 E.00041
; LINE_WIDTH: 0.0941532
G3 X153.276 Y106.31 I-3.837 J.383 E.00112
G1 X153.275 Y121.486 E.04495
G1 X153.257 Y121.857 E.0011
; LINE_WIDTH: 0.150927
G1 X153.235 Y122.013 E.00083
; LINE_WIDTH: 0.197261
G3 X153.184 Y122.25 I-2.484 J-.407 E.00174
; LINE_WIDTH: 0.234187
G3 X153.127 Y122.401 I-1.032 J-.305 E.0014
; LINE_WIDTH: 0.285519
G3 X152.307 Y123.279 I-1.541 J-.617 E.01322
; LINE_WIDTH: 0.246569
G3 X152.069 Y123.379 I-1.149 J-2.42 E.00237
; LINE_WIDTH: 0.20927
G1 X151.926 Y123.414 E.00113
; LINE_WIDTH: 0.177618
G1 X151.747 Y123.445 E.00115
; LINE_WIDTH: 0.144189
G1 X151.667 Y123.457 E.0004
; LINE_WIDTH: 0.0941532
G3 X151.29 Y123.476 I-.383 J-3.837 E.00112
G1 X136.114 Y123.476 E.04495
G1 X135.743 Y123.457 E.0011
; LINE_WIDTH: 0.150935
G1 X135.587 Y123.435 E.00083
; LINE_WIDTH: 0.197274
G3 X135.35 Y123.384 I.408 J-2.486 E.00174
; LINE_WIDTH: 0.234152
G3 X135.199 Y123.327 I.306 J-1.033 E.0014
; LINE_WIDTH: 0.287397
G3 X134.393 Y122.644 I.661 J-1.598 E.01163
; LINE_WIDTH: 0.259023
G3 X134.23 Y122.294 I2.133 J-1.201 E.00374
; LINE_WIDTH: 0.207324
G3 X134.176 Y122.074 I1.584 J-.508 E.00172
; LINE_WIDTH: 0.17256
G1 X134.155 Y121.948 E.00079
; LINE_WIDTH: 0.144279
G1 X134.143 Y121.867 E.00041
; LINE_WIDTH: 0.0937608
G3 X134.124 Y121.49 I3.837 J-.383 E.00111
G1 X134.125 Y106.31 E.04472
; LINE_WIDTH: 0.110776
G1 X134.143 Y105.943 E.00134
; LINE_WIDTH: 0.150927
G1 X134.165 Y105.787 E.00083
; LINE_WIDTH: 0.197261
G3 X134.216 Y105.55 I2.484 J.407 E.00174
; LINE_WIDTH: 0.234187
G3 X134.273 Y105.399 I1.032 J.305 E.0014
; LINE_WIDTH: 0.283063
G3 X135.2 Y104.473 I1.545 J.62 E.01434
; LINE_WIDTH: 0.236446
G3 X135.331 Y104.421 I.582 J1.291 E.00124
; LINE_WIDTH: 0.198707
G3 X135.587 Y104.365 I.783 J2.956 E.00189
; LINE_WIDTH: 0.152466
G1 X135.733 Y104.344 E.00079
; LINE_WIDTH: 0.093414
G3 X136.11 Y104.325 I.381 J3.803 E.00111
G1 X145.651 Y104.325 E.02797
; WIPE_START
G1 X147.651 Y104.325 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.954 Y111.001 Z5.5 F42000
G1 X142.83 Y113.03 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.422 Y113.03 E.02287
G3 X142.83 Y111.622 I2.272 J.864 E.03332
G1 X142.83 Y112.97 E.02189
; WIPE_START
M204 S6000
G1 X141.422 Y113.03 E-.5357
G1 X141.579 Y112.694 E-.14093
G1 X141.683 Y112.527 E-.07465
G1 X141.697 Y112.51 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.892 Y111.6 E.02633
G3 X143.944 Y111.472 I.851 J2.611 E.01732
G3 X144.457 Y111.581 I-.318 J2.756 E.00852
; WIPE_START
M204 S6000
G1 X142.892 Y111.6 E-.59462
G1 X143.171 Y111.518 E-.11023
G1 X143.313 Y111.492 E-.05515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.008 J2.245 E.0312
G1 X144.63 Y113.03 E.02191
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53542
G1 X144.691 Y111.671 E-.0496
G1 X145.091 Y111.898 E-.17498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00238
G3 X146 Y114.71 I-2.424 J.666 E.02441
G1 X146 Y113.15 E.02533
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03488
G1 X146.132 Y113.702 E-.18243
G1 X146.138 Y113.999 E-.11292
G1 X146.11 Y114.28 E-.10737
G1 X146 Y114.71 E-.16853
G1 X146 Y114.305 E-.15387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.178 I-2.219 J-1.047 E.03042
G1 X144.57 Y114.83 E.02188
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53583
G1 X145.91 Y114.934 E-.06745
G1 X145.699 Y115.288 E-.15672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.509 Y116.202 E.02635
G3 X142.943 Y116.219 I-.809 J-2.307 E.02589
; WIPE_START
M204 S6000
G1 X144.509 Y116.202 E-.59513
G1 X144.128 Y116.302 E-.14977
M73 P75 R6
G1 X144.088 Y116.305 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.863 J-2.272 E.03332
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.458 Y116 E-.15679
G1 X142.308 Y115.903 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02631
G3 X141.381 Y113.147 I2.31 J-.81 E.02584
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.5941
G1 X141.308 Y114.38 E-.13018
G1 X141.297 Y114.287 E-.03572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.713 Y119.49 Z5.5 F42000
G1 X103.041 Y149.933 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.573 E.0059
G1 X102.99 Y131.496 E.29354
G3 X104.791 Y129.593 I1.925 J.019 E.04679
G1 X122.973 Y129.591 E.29523
G3 X124.809 Y131.427 I-.082 J1.918 E.0463
G1 X124.81 Y149.504 E.29354
G3 X122.973 Y151.409 I-1.911 J-.005 E.04746
G1 X104.897 Y151.41 E.29352
G3 X103.056 Y149.991 I.012 J-1.919 E.04054
; WIPE_START
M204 S6000
G1 X102.991 Y149.573 E-.1607
G1 X102.991 Y147.996 E-.59931
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.376 Z5.5 F42000
G1 X104.094 Y129.07 Z5.5
G1 Z5.1
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00686
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.175 J2.184 E.0531
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.198 J-.096 E.05443
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.093 J-2.195 E.05448
G1 X102.412 Y131.114 E.30335
G3 X104.036 Y129.085 I2.193 J.09 E.04517
M204 S10000
G1 X104.117 Y129.404 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.263814
G1 F15000
M204 S6000
G1 X104.373 Y129.339 E.00261
; LINE_WIDTH: 0.187958
G3 X104.636 Y129.309 I.383 J2.147 E.0018
G1 X122.979 Y129.301 E.12443
G1 X123.25 Y129.315 E.00184
; LINE_WIDTH: 0.241037
G3 X123.415 Y129.336 I-.327 J3.124 E.00149
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.297959
G3 X124.86 Y130.391 I-.608 J1.93 E.01784
G1 X124.936 Y130.553 E.00202
; LINE_WIDTH: 0.259892
G3 X125.061 Y130.977 I-2.014 J.824 E.0043
; LINE_WIDTH: 0.188517
G3 X125.096 Y131.32 I-2.663 J.445 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.247248
G3 X125.012 Y150.233 I-2.17 J-.307 E.00281
G1 X124.99 Y150.305 E.00069
; LINE_WIDTH: 0.298228
G3 X124.009 Y151.461 I-1.929 J-.642 E.01752
G1 X123.805 Y151.553 E.00253
; LINE_WIDTH: 0.257069
G3 X123.425 Y151.662 I-.768 J-1.969 E.00379
G1 X123.415 Y151.663 E.0001
; LINE_WIDTH: 0.188393
G1 X122.979 Y151.699 E.00297
G1 X104.893 Y151.699 E.12301
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.241919
G3 X104.134 Y151.602 I.234 J-2.131 E.00361
G1 X104.127 Y151.6 E.00006
; LINE_WIDTH: 0.298683
G3 X102.938 Y150.606 I.61 J-1.938 E.01795
G1 X102.878 Y150.48 E.00158
; LINE_WIDTH: 0.261192
G3 X102.738 Y150.023 I2.027 J-.872 E.00467
G1 X102.736 Y150.015 E.00008
; LINE_WIDTH: 0.18821
G3 X102.704 Y149.68 I2.671 J-.43 E.00229
G1 X102.701 Y131.489 E.12359
; LINE_WIDTH: 0.197753
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.244
G3 X102.81 Y130.695 I2.125 J.233 E.004
; LINE_WIDTH: 0.299561
G3 X103.791 Y129.54 I1.932 J.646 E.0176
G1 X103.881 Y129.496 E.00113
; LINE_WIDTH: 0.263814
G3 X104.06 Y129.423 I.855 J1.832 E.00191
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.373 Y129.339 E-.12306
G1 X104.636 Y129.309 E-.10072
G1 X106.047 Y129.308 E-.53622
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 52/95
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.5 I.581 J1.07 P1  F42000
G1 X151.607 Y104.576 Z5.5
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.623 Y104.579 E.00027
G3 X153.055 Y106.314 I-.345 J1.743 E.03956
G1 X153.055 Y121.486 E.24636
G3 X151.286 Y123.255 I-1.777 J-.008 E.04507
G1 X136.114 Y123.255 E.24636
G3 X134.345 Y121.486 I.008 J-1.777 E.04507
G1 X134.345 Y106.314 E.24636
G3 X136.114 Y104.545 I1.777 J.008 E.04507
G1 X151.286 Y104.545 E.24636
G1 X151.547 Y104.571 E.00426
; WIPE_START
M204 S6000
G1 X151.623 Y104.579 E-.02905
G1 X151.957 Y104.679 E-.13261
G1 X152.265 Y104.844 E-.13265
G1 X152.535 Y105.065 E-.13264
G1 X152.756 Y105.335 E-.13265
G1 X152.921 Y105.643 E-.13257
G1 X152.972 Y105.814 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.475 Y104.384 Z5.6 F42000
G1 X143.772 Y104.059 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X151.984 Y104.065 E.13335
G3 X153.548 Y105.83 I-.214 J1.764 E.04186
G1 X153.546 Y122.042 E.26326
G3 X151.77 Y123.748 I-1.775 J-.071 E.04417
G1 X135.558 Y123.746 E.26326
G3 X133.852 Y121.97 I.071 J-1.775 E.04416
G1 X133.854 Y105.758 E.26326
G3 X135.558 Y104.054 I1.786 J.083 E.04293
G1 X143.712 Y104.059 E.13241
; WIPE_START
M204 S6000
G1 X145.712 Y104.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 52 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer52 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.712 Y104.299 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0997466
G1 F15000
M204 S6000
G1 X151.296 Y104.299 E.01781
G1 X151.669 Y104.318 E.00119
; LINE_WIDTH: 0.158308
G1 X151.831 Y104.341 E.00091
; LINE_WIDTH: 0.205303
G3 X152.066 Y104.391 I-.38 J2.348 E.0018
; LINE_WIDTH: 0.242571
G3 X152.221 Y104.45 I-.345 J1.148 E.0015
; LINE_WIDTH: 0.293605
G3 X153.127 Y105.328 I-.621 J1.549 E.01434
; LINE_WIDTH: 0.250307
M73 P76 R6
G3 X153.203 Y105.515 I-1.831 J.842 E.00189
; LINE_WIDTH: 0.212399
G3 X153.249 Y105.711 I-1.713 J.506 E.00157
; LINE_WIDTH: 0.180115
G1 X153.269 Y105.835 E.00082
; LINE_WIDTH: 0.151584
G1 X153.282 Y105.919 E.00045
; LINE_WIDTH: 0.100504
G3 X153.301 Y106.3 I-3.829 J.385 E.00123
G1 X153.301 Y121.496 E.04894
G1 X153.282 Y121.869 E.0012
; LINE_WIDTH: 0.158308
G1 X153.259 Y122.031 E.00091
; LINE_WIDTH: 0.205293
G3 X153.209 Y122.266 I-2.347 J-.38 E.0018
; LINE_WIDTH: 0.242563
G3 X153.15 Y122.421 I-1.148 J-.346 E.0015
; LINE_WIDTH: 0.29665
G3 X152.464 Y123.231 I-1.607 J-.665 E.01209
; LINE_WIDTH: 0.267957
G3 X152.114 Y123.393 I-1.197 J-2.125 E.00388
; LINE_WIDTH: 0.215751
G3 X151.893 Y123.448 I-.495 J-1.52 E.0018
; LINE_WIDTH: 0.180645
G1 X151.765 Y123.47 E.00085
; LINE_WIDTH: 0.151574
G1 X151.681 Y123.482 E.00045
; LINE_WIDTH: 0.100504
G3 X151.3 Y123.501 I-.385 J-3.829 E.00123
G1 X136.104 Y123.501 E.04894
G1 X135.731 Y123.482 E.0012
; LINE_WIDTH: 0.158318
G1 X135.569 Y123.459 E.00091
; LINE_WIDTH: 0.205248
G3 X135.334 Y123.409 I.403 J-2.459 E.0018
; LINE_WIDTH: 0.242614
G3 X135.179 Y123.35 I.32 J-1.078 E.0015
; LINE_WIDTH: 0.296635
G3 X134.369 Y122.664 I.666 J-1.607 E.0121
; LINE_WIDTH: 0.267975
G3 X134.207 Y122.314 I2.12 J-1.195 E.00388
; LINE_WIDTH: 0.215734
G3 X134.152 Y122.093 I1.515 J-.494 E.0018
; LINE_WIDTH: 0.180657
G1 X134.131 Y121.965 E.00084
; LINE_WIDTH: 0.151604
G1 X134.118 Y121.881 E.00045
; LINE_WIDTH: 0.100107
G3 X134.099 Y121.5 I3.829 J-.385 E.00122
G1 X134.099 Y106.3 E.04871
; LINE_WIDTH: 0.117224
G1 X134.118 Y105.931 E.00144
; LINE_WIDTH: 0.158308
G1 X134.141 Y105.769 E.00091
; LINE_WIDTH: 0.205298
G3 X134.191 Y105.534 I2.351 J.381 E.0018
; LINE_WIDTH: 0.242556
G3 X134.25 Y105.379 I1.15 J.346 E.0015
; LINE_WIDTH: 0.292261
G3 X135.18 Y104.45 I1.553 J.624 E.01491
; LINE_WIDTH: 0.244943
G3 X135.315 Y104.397 I.619 J1.386 E.00132
; LINE_WIDTH: 0.206803
G3 X135.569 Y104.341 I.732 J2.721 E.00196
; LINE_WIDTH: 0.159952
G1 X135.72 Y104.319 E.00086
; LINE_WIDTH: 0.0997466
G3 X136.1 Y104.3 I.383 J3.797 E.00122
G1 X145.652 Y104.299 E.03047
; WIPE_START
G1 X147.652 Y104.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.962 Y110.981 Z5.6 F42000
G1 X142.83 Y113.03 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.423 Y113.03 E.02285
G3 X142.83 Y111.622 I2.333 J.924 E.03324
G1 X142.83 Y112.97 E.02189
; WIPE_START
M204 S6000
G1 X141.423 Y113.03 E-.53526
G1 X141.534 Y112.778 E-.1048
G1 X141.683 Y112.528 E-.11051
G1 X141.698 Y112.509 E-.00943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.892 Y111.6 E.02634
G3 X143.944 Y111.472 I.809 J2.268 E.01736
G3 X144.457 Y111.581 I-.257 J2.479 E.00852
; WIPE_START
M204 S6000
G1 X142.892 Y111.6 E-.59479
G1 X143.078 Y111.541 E-.07423
G1 X143.312 Y111.493 E-.09098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.065 J2.299 E.03114
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.04955
G1 X145.091 Y111.899 E-.17507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.047 Y113.233 E.00244
G3 X146 Y114.71 I-2.506 J.659 E.02432
G1 X146 Y113.15 E.02532
; WIPE_START
M204 S6000
G1 X146.047 Y113.233 E-.03622
G1 X146.132 Y113.704 E-.18191
G1 X146.138 Y113.997 E-.1112
G1 X146.109 Y114.288 E-.11118
G1 X146 Y114.71 E-.16545
G1 X146 Y114.304 E-.15404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.977 Y114.77 E.02285
G1 X145.949 Y114.847 E.00133
G3 X144.57 Y116.178 I-2.261 J-.961 E.03197
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.977 Y114.77 E-.53532
G1 X145.949 Y114.847 E-.03116
G1 X145.717 Y115.272 E-.18406
G1 X145.701 Y115.291 E-.00945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.886 Y116.2 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.415 Y116.233 E.00161
G3 X142.943 Y116.219 I-.714 J-2.371 E.02427
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.59478
G1 X144.415 Y116.233 E-.03761
G1 X144.134 Y116.301 E-.10968
G1 X144.087 Y116.305 E-.01793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.875 J-2.285 E.0333
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.621 Y116.088 E-.0863
G1 X142.308 Y115.902 E-.13832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.02629
G3 X141.381 Y113.147 I2.306 J-.81 E.02583
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59376
G1 X141.308 Y114.38 E-.13011
G1 X141.296 Y114.286 E-.03613
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.712 Y119.489 Z5.6 F42000
G1 X103.043 Y149.927 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X103.027 Y149.872 E.00094
G3 X102.991 Y149.575 I1.879 J-.379 E.00486
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.916 J.01 E.04618
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.425 I-.089 J1.924 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.916 J-.007 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.137 Y150.23 I.011 J-1.917 E.03644
G1 X103.061 Y149.985 E.00417
; WIPE_START
M204 S6000
G1 X103.027 Y149.872 E-.04471
G1 X102.991 Y149.575 E-.11368
G1 X102.991 Y147.992 E-.60162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.372 Z5.6 F42000
G1 X104.097 Y129.072 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.136 Y129.06 E.00066
G3 X104.514 Y129.012 I.466 J2.143 E.00619
G1 X123.373 Y129.017 E.30624
G3 X125.39 Y131.204 I-.181 J2.19 E.05306
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.195 J-.093 E.05449
G1 X104.512 Y151.988 E.30339
G3 X102.41 Y149.798 I.095 J-2.195 E.05442
G1 X102.412 Y131.114 E.30339
G3 X103.764 Y129.177 I2.191 J.088 E.04052
G1 X104.04 Y129.09 E.0047
M204 S10000
G1 X104.108 Y129.407 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.244596
G1 F15000
M204 S6000
G1 X104.526 Y129.317 E.00388
; LINE_WIDTH: 0.187834
G1 X104.892 Y129.301 E.00248
G1 X122.979 Y129.301 E.12261
G1 X123.351 Y129.327 E.00253
; LINE_WIDTH: 0.252858
G3 X123.63 Y129.386 I-.239 J1.799 E.00269
G1 X123.773 Y129.435 E.00143
; LINE_WIDTH: 0.299025
G3 X124.967 Y130.63 I-.706 J1.899 E.0197
; LINE_WIDTH: 0.251942
G3 X125.023 Y130.804 I-2.485 J.886 E.00172
G1 X125.074 Y131.051 E.00236
; LINE_WIDTH: 0.188328
G1 X125.099 Y131.417 E.0025
G1 X125.099 Y149.504 E.12297
G3 X125.077 Y149.925 I-4.297 J-.019 E.00286
; LINE_WIDTH: 0.246774
G3 X125.025 Y150.188 I-1.819 J-.221 E.00247
G1 X124.989 Y150.305 E.00112
; LINE_WIDTH: 0.299928
G3 X123.925 Y151.501 I-1.921 J-.636 E.01868
; LINE_WIDTH: 0.264192
G3 X123.427 Y151.661 I-.877 J-1.889 E.00519
; LINE_WIDTH: 0.18852
G1 X122.983 Y151.699 E.00303
G1 X104.892 Y151.699 E.12314
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.249662
G3 X104.047 Y151.573 I.29 J-2.117 E.00405
; LINE_WIDTH: 0.298831
G3 X102.834 Y150.372 I.689 J-1.909 E.01991
; LINE_WIDTH: 0.250871
G1 X102.775 Y150.187 E.00181
G1 X102.725 Y149.935 E.00241
; LINE_WIDTH: 0.188027
G3 X102.71 Y149.795 I2.212 J-.3 E.00095
G1 X102.701 Y131.489 E.12424
; LINE_WIDTH: 0.198245
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.24268
G3 X102.8 Y130.728 I2.209 J.25 E.00367
G1 X102.803 Y130.717 E.0001
; LINE_WIDTH: 0.296762
G3 X104.052 Y129.425 I1.945 J.63 E.02087
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X104.526 Y129.317 E-.18499
G1 X104.892 Y129.301 E-.13909
G1 X106.039 Y129.301 E-.43592
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 53/95
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 83
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.581 J1.069 P1  F42000
G1 X151.616 Y104.554 Z5.6
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X151.635 Y104.557 E.00032
G3 X153.077 Y106.304 I-.347 J1.755 E.03984
G1 X153.077 Y121.496 E.24668
G3 X151.296 Y123.277 I-1.789 J-.008 E.04538
G1 X136.104 Y123.277 E.24668
G3 X134.323 Y121.496 I.008 J-1.789 E.04538
G1 X134.323 Y106.304 E.24668
G3 X136.104 Y104.523 I1.789 J.008 E.04538
G1 X151.296 Y104.523 E.24668
G1 X151.556 Y104.549 E.00425
; WIPE_START
M204 S6000
G1 X151.635 Y104.557 E-.03019
G1 X151.971 Y104.658 E-.13354
G1 X152.281 Y104.824 E-.13353
G1 X152.553 Y105.047 E-.13356
G1 X152.776 Y105.319 E-.13356
G1 X152.942 Y105.629 E-.13353
G1 X152.989 Y105.785 E-.06209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.491 Y104.358 Z5.7 F42000
G1 X143.772 Y104.031 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X152.001 Y104.037 E.13362
G3 X153.576 Y105.813 I-.214 J1.776 E.04215
G1 X153.574 Y122.061 E.26384
G3 X151.787 Y123.776 I-1.787 J-.073 E.04443
G1 X135.539 Y123.774 E.26384
G3 X133.824 Y121.987 I.073 J-1.787 E.04443
G1 X133.826 Y105.739 E.26384
G3 X135.539 Y104.026 I1.798 J.084 E.04317
G1 X143.712 Y104.031 E.13271
; WIPE_START
M204 S6000
G1 X145.712 Y104.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 83
M625
; object ids of layer 53 start: 83,94
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer53 end: 83,94
M625
; start printing object, unique label id: 83
M624 AQAAAAAAAAA=
G1 X145.712 Y104.274 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106078
G1 F15000
M204 S6000
G1 X151.306 Y104.274 E.01929
G1 X151.682 Y104.293 E.0013
; LINE_WIDTH: 0.165692
G1 X151.849 Y104.317 E.001
; LINE_WIDTH: 0.213227
G3 X152.081 Y104.367 I-.399 J2.43 E.00185
; LINE_WIDTH: 0.251063
G3 X152.24 Y104.427 I-.338 J1.134 E.00159
; LINE_WIDTH: 0.302798
G3 X153.15 Y105.307 I-.626 J1.557 E.01489
; LINE_WIDTH: 0.259207
G3 X153.228 Y105.499 I-2.381 J1.076 E.002
; LINE_WIDTH: 0.220377
G1 X153.272 Y105.689 E.00159
; LINE_WIDTH: 0.188574
G1 X153.294 Y105.818 E.00089
; LINE_WIDTH: 0.158865
G1 X153.307 Y105.906 E.0005
; LINE_WIDTH: 0.106863
G3 X153.326 Y106.29 I-3.875 J.388 E.00134
G1 X153.326 Y121.506 E.05295
G1 X153.307 Y121.882 E.00131
; LINE_WIDTH: 0.165688
G1 X153.283 Y122.049 E.001
; LINE_WIDTH: 0.213233
G3 X153.233 Y122.281 I-2.434 J-.399 E.00185
; LINE_WIDTH: 0.251062
G3 X153.173 Y122.44 I-1.129 J-.336 E.00159
; LINE_WIDTH: 0.3028
G3 X152.293 Y123.35 I-1.557 J-.626 E.01489
; LINE_WIDTH: 0.259338
G3 X152.101 Y123.428 I-1.081 J-2.389 E.002
; LINE_WIDTH: 0.220367
G1 X151.911 Y123.472 E.00159
; LINE_WIDTH: 0.188575
G1 X151.782 Y123.494 E.00089
; LINE_WIDTH: 0.158865
G1 X151.694 Y123.507 E.0005
; LINE_WIDTH: 0.106844
G3 X151.31 Y123.526 I-.388 J-3.875 E.00134
G1 X136.094 Y123.526 E.05293
G1 X135.718 Y123.507 E.00131
; LINE_WIDTH: 0.165696
G1 X135.551 Y123.483 E.001
; LINE_WIDTH: 0.213215
G3 X135.319 Y123.433 I.402 J-2.447 E.00185
; LINE_WIDTH: 0.251052
G3 X135.16 Y123.373 I.336 J-1.128 E.00159
; LINE_WIDTH: 0.305814
G3 X134.346 Y122.683 I.666 J-1.608 E.01256
; LINE_WIDTH: 0.276162
G3 X134.184 Y122.333 I2.739 J-1.487 E.00401
; LINE_WIDTH: 0.227231
G3 X134.138 Y122.163 I1.003 J-.359 E.00148
; LINE_WIDTH: 0.194961
G3 X134.106 Y121.982 I3.057 J-.634 E.0013
; LINE_WIDTH: 0.158865
G1 X134.093 Y121.894 E.0005
; LINE_WIDTH: 0.125556
G3 X134.074 Y121.51 I3.875 J-.388 E.00163
G1 X134.074 Y121.506 E.00002
; LINE_WIDTH: 0.106398
G1 X134.074 Y106.294 E.05264
G1 X134.093 Y105.918 E.0013
; LINE_WIDTH: 0.165688
G1 X134.117 Y105.751 E.001
; LINE_WIDTH: 0.213226
G3 X134.167 Y105.519 I2.427 J.398 E.00185
; LINE_WIDTH: 0.25106
G3 X134.227 Y105.36 I1.133 J.338 E.00159
; LINE_WIDTH: 0.302824
G3 X135.106 Y104.45 I1.557 J.625 E.01487
; LINE_WIDTH: 0.25856
G3 X135.299 Y104.372 I.745 J1.569 E.00201
; LINE_WIDTH: 0.214733
G3 X135.551 Y104.317 I.746 J2.786 E.00203
; LINE_WIDTH: 0.167393
G1 X135.707 Y104.294 E.00094
; LINE_WIDTH: 0.106078
G3 X136.09 Y104.274 I.387 J3.853 E.00132
G1 X145.652 Y104.274 E.03297
; WIPE_START
G1 X147.652 Y104.274 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.97 Y110.96 Z5.7 F42000
G1 X142.83 Y113.03 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X141.421 Y113.03 E.02288
G3 X142.83 Y111.622 I2.274 J.866 E.03332
G1 X142.83 Y112.97 E.02189
; WIPE_START
M204 S6000
G1 X141.421 Y113.03 E-.53583
G1 X141.58 Y112.693 E-.14148
G1 X141.683 Y112.528 E-.07404
G1 X141.697 Y112.51 E-.00865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.514 Y111.6 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.892 Y111.6 E.02634
G3 X143.944 Y111.472 I.851 J2.617 E.01732
G3 X144.457 Y111.581 I-.316 J2.743 E.00852
; WIPE_START
M204 S6000
G1 X142.892 Y111.6 E-.59472
G1 X143.171 Y111.518 E-.11044
G1 X143.313 Y111.493 E-.05484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y113.03 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.57 Y111.622 E.02286
G1 X144.691 Y111.671 E.00212
G3 X145.979 Y113.03 I-1.066 J2.299 E.03114
G1 X144.63 Y113.03 E.0219
; WIPE_START
M204 S6000
G1 X144.57 Y111.622 E-.53538
G1 X144.691 Y111.671 E-.0496
G1 X145.091 Y111.899 E-.17502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y113.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X146.046 Y113.23 E.00238
G3 X146 Y114.71 I-2.337 J.668 E.02444
G1 X146 Y113.15 E.02533
; WIPE_START
M204 S6000
G1 X146.046 Y113.23 E-.03487
G1 X146.122 Y113.61 E-.14729
G1 X146.138 Y113.999 E-.14812
G1 X146.109 Y114.285 E-.10923
G1 X146 Y114.71 E-.1667
G1 X146 Y114.305 E-.15379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.57 Y114.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X145.979 Y114.77 E.02288
G1 X145.91 Y114.934 E.00288
G3 X144.57 Y116.178 I-2.244 J-1.072 E.03041
G1 X144.57 Y114.83 E.02189
; WIPE_START
M204 S6000
G1 X145.979 Y114.77 E-.53581
G1 X145.91 Y114.934 E-.06745
G1 X145.699 Y115.288 E-.15673
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P77 R6
G1 X142.886 Y116.2 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X144.508 Y116.2 E.02634
G1 X144.415 Y116.233 E.00161
G3 X142.943 Y116.219 I-.714 J-2.372 E.02427
; WIPE_START
M204 S6000
G1 X144.508 Y116.2 E-.5948
G1 X144.415 Y116.233 E-.03756
G1 X144.087 Y116.306 E-.12764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.83 Y114.77 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X142.83 Y116.178 E.02286
G3 X141.421 Y114.77 I.875 J-2.285 E.0333
G1 X142.77 Y114.77 E.0219
; WIPE_START
M204 S6000
G1 X142.83 Y116.178 E-.53538
G1 X142.623 Y116.09 E-.08532
G1 X142.308 Y115.902 E-.1393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.4 Y113.09 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X141.4 Y114.71 E.0263
G3 X141.381 Y113.147 I2.309 J-.81 E.02583
; OBJECT_ID: 94
; WIPE_START
M204 S6000
G1 X141.4 Y114.71 E-.59399
G1 X141.291 Y114.287 E-.16601
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 83
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G1 X135.707 Y119.49 Z5.7 F42000
G1 X103.041 Y149.933 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X102.991 Y149.575 E.00587
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.973 Y129.591 E.29469
G3 X124.809 Y131.425 I-.082 J1.918 E.04626
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.991 I.013 J-1.919 E.04052
; WIPE_START
M204 S6000
G1 X102.991 Y149.575 E-.16009
G1 X102.991 Y147.996 E-.59991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z5.7 F42000
G1 X104.094 Y129.07 Z5.7
G1 Z5.3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X104.512 Y129.012 E.00685
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.184 J2.193 E.05304
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.191 J-.089 E.05451
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.093 J-2.195 E.05448
G1 X102.412 Y131.114 E.30336
G3 X104.037 Y129.086 I2.198 J.096 E.04514
M204 S10000
G1 X104.118 Y129.404 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.264107
G1 F15000
M204 S6000
G1 X104.373 Y129.339 E.0026
; LINE_WIDTH: 0.188601
G3 X104.637 Y129.309 I.385 J2.163 E.00181
G1 X122.979 Y129.301 E.12491
G1 X123.25 Y129.315 E.00185
; LINE_WIDTH: 0.24081
G3 X123.582 Y129.374 I-.171 J1.928 E.00302
G1 X123.676 Y129.401 E.00088
; LINE_WIDTH: 0.29712
G3 X124.902 Y130.474 I-.611 J1.934 E.01883
G1 X124.968 Y130.631 E.00191
; LINE_WIDTH: 0.256055
G3 X125.062 Y130.977 I-2.342 J.822 E.00343
; LINE_WIDTH: 0.188511
G3 X125.085 Y131.146 I-2.711 J.454 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.249771
G3 X124.973 Y150.353 I-1.997 J-.262 E.00405
; LINE_WIDTH: 0.299614
G3 X123.925 Y151.501 I-1.917 J-.697 E.01807
G1 X123.837 Y151.541 E.0011
; LINE_WIDTH: 0.25787
G3 X123.386 Y151.668 I-.79 J-1.932 E.00452
; LINE_WIDTH: 0.188332
G3 X123.19 Y151.69 I-.362 J-2.322 E.00135
G1 X104.892 Y151.699 E.12441
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.241803
G3 X104.303 Y151.647 I.317 J-2.638 E.00203
G1 X104.124 Y151.599 E.00167
; LINE_WIDTH: 0.297388
G3 X102.982 Y150.686 I.62 J-1.945 E.01681
G1 X102.833 Y150.371 E.00392
; LINE_WIDTH: 0.255421
G3 X102.738 Y150.023 I1.988 J-.732 E.00344
G1 X102.736 Y150.015 E.00008
; LINE_WIDTH: 0.188211
G3 X102.715 Y149.854 I3.05 J-.484 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.198254
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.244315
G3 X102.81 Y130.695 I2.183 J.246 E.00401
; LINE_WIDTH: 0.299656
G3 X103.875 Y129.499 I1.92 J.636 E.01867
; LINE_WIDTH: 0.264107
G3 X104.06 Y129.423 I.868 J1.858 E.00199
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X104.373 Y129.339 E-.12284
G1 X104.637 Y129.309 E-.10113
G1 X106.048 Y129.308 E-.53603
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 54/95
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.7 I-1.204 J-.176 P1  F42000
G1 X103.041 Y149.934 Z5.7
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00586
G1 X102.99 Y131.496 E.29359
G3 X104.751 Y129.596 I1.914 J.008 E.04621
G1 X122.975 Y129.591 E.29592
G3 X124.809 Y131.424 I-.091 J1.925 E.04617
G1 X124.81 Y149.504 E.29359
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.007 J-1.913 E.04056
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15978
G1 X102.991 Y147.997 E-.60022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z5.8 F42000
G1 X104.094 Y129.07 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.00685
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.188 J2.197 E.05302
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.05451
G1 X104.514 Y151.988 E.30337
G3 X102.41 Y149.796 I.087 J-2.189 E.05453
G1 X102.412 Y131.114 E.30335
G3 X104.036 Y129.084 I2.189 J.087 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18294
G1 X106.031 Y129.012 E-.57706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 54 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer54 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.031 Y129.31 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187982
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11501
G1 X123.351 Y129.327 E.0025
; LINE_WIDTH: 0.249179
G3 X123.633 Y129.388 I-.242 J1.788 E.00268
G1 X123.71 Y129.412 E.00074
; LINE_WIDTH: 0.299967
G3 X124.901 Y130.475 I-.649 J1.927 E.01862
; LINE_WIDTH: 0.263481
G3 X125.063 Y130.979 I-1.834 J.864 E.00524
; LINE_WIDTH: 0.188522
G3 X125.09 Y131.199 I-3.393 J.527 E.00151
G1 X125.099 Y149.508 E.12462
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246992
G3 X125.025 Y150.186 I-1.792 J-.221 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.299888
G3 X123.928 Y151.5 I-1.929 J-.644 E.01864
; LINE_WIDTH: 0.263733
G3 X123.427 Y151.661 I-.896 J-1.929 E.00521
G1 X123.419 Y151.663 E.00008
; LINE_WIDTH: 0.188503
G1 X122.983 Y151.699 E.00298
G1 X104.892 Y151.699 E.12313
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.246994
G3 X104.214 Y151.625 I.222 J-1.798 E.00239
G1 X104.095 Y151.59 E.00114
; LINE_WIDTH: 0.299702
G3 X102.898 Y150.525 I.644 J-1.929 E.01866
; LINE_WIDTH: 0.26364
G3 X102.737 Y150.02 I1.963 J-.903 E.00524
; LINE_WIDTH: 0.188241
G3 X102.71 Y149.801 I3.225 J-.507 E.0015
G1 X102.701 Y131.489 E.12444
; LINE_WIDTH: 0.198249
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242657
G3 X102.8 Y130.728 I2.199 J.248 E.00367
G1 X102.803 Y130.718 E.0001
; LINE_WIDTH: 0.29769
G3 X104.022 Y129.437 I1.94 J.626 E.02058
; LINE_WIDTH: 0.252075
G3 X104.287 Y129.356 I.816 J2.216 E.00261
G1 X104.458 Y129.325 E.00163
; LINE_WIDTH: 0.187982
G3 X104.601 Y129.311 I.324 J2.603 E.00098
G1 X105.971 Y129.31 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.971 Y129.309 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 55/95
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.929 Z5.8
G1 Z5.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X103.035 Y149.902 E.00045
G3 X102.991 Y149.575 I1.877 J-.414 E.00537
G1 X102.99 Y131.496 E.29357
G3 X104.794 Y129.593 I1.913 J.007 E.04691
G1 X122.977 Y129.591 E.29524
G3 X124.809 Y131.425 I-.081 J1.913 E.04624
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.896 Y151.41 E.29357
G3 X103.138 Y150.23 I.015 J-1.922 E.03641
G1 X103.06 Y149.987 E.00415
; WIPE_START
G1 F3600
M204 S6000
G1 X103.035 Y149.902 E-.03342
G1 X102.991 Y149.575 E-.12554
G1 X102.991 Y147.993 E-.60105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.374 Z5.9 F42000
G1 X104.094 Y129.07 Z5.9
G1 Z5.5
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00688
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.193 J2.201 E.053
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.191 J-.088 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.796 I.094 J-2.196 E.05447
G1 X102.412 Y131.114 E.30336
G3 X104.037 Y129.086 I2.198 J.096 E.04515
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18367
G1 X106.031 Y129.012 E-.57633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 55 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer55 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.031 Y129.308 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187993
G1 F2548
M204 S6000
G1 X122.986 Y129.301 E.11504
G1 X123.351 Y129.327 E.00248
; LINE_WIDTH: 0.248675
G1 X123.706 Y129.411 E.00338
; LINE_WIDTH: 0.297604
G3 X124.969 Y130.638 I-.638 J1.921 E.02049
; LINE_WIDTH: 0.251303
G3 X125.023 Y130.804 I-2.214 J.8 E.00164
G1 X125.074 Y131.052 E.00237
; LINE_WIDTH: 0.188237
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.508 E.12293
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.243922
G3 X125.025 Y150.186 I-1.928 J-.193 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.299809
G3 X124.085 Y151.418 I-1.936 J-.649 E.01662
G1 X123.917 Y151.506 E.00216
; LINE_WIDTH: 0.263064
G3 X123.427 Y151.661 I-.867 J-1.892 E.00506
G1 X123.419 Y151.663 E.00008
; LINE_WIDTH: 0.188503
G1 X122.983 Y151.699 E.00298
G1 X104.892 Y151.699 E.12313
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.246985
G3 X104.214 Y151.625 I.222 J-1.795 E.00239
G1 X104.095 Y151.59 E.00114
; LINE_WIDTH: 0.298274
G3 X102.836 Y150.379 I.637 J-1.922 E.02037
; LINE_WIDTH: 0.254102
G3 X102.739 Y150.023 I1.953 J-.726 E.0035
G1 X102.73 Y149.974 E.00048
; LINE_WIDTH: 0.188116
G3 X102.71 Y149.791 I3.108 J-.435 E.00125
G1 X102.701 Y131.489 E.12428
; LINE_WIDTH: 0.198267
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242649
G3 X102.8 Y130.728 I2.198 J.247 E.00367
G1 X102.803 Y130.718 E.0001
; LINE_WIDTH: 0.296763
G3 X104.085 Y129.414 I1.933 J.62 E.02128
; LINE_WIDTH: 0.248424
G3 X104.463 Y129.325 I.624 J1.795 E.0036
; LINE_WIDTH: 0.187993
G3 X104.636 Y129.309 I.317 J2.439 E.00118
G1 X105.971 Y129.308 E.00906
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.971 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 56/95
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.9 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z5.9
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00591
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.919 J.013 E.04616
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.079 J1.913 E.04626
G1 X124.81 Y149.504 E.29356
G3 X122.975 Y151.409 I-1.919 J-.012 E.04739
G1 X104.898 Y151.41 E.29354
G3 X103.056 Y149.992 I.013 J-1.921 E.04053
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16099
G1 X102.991 Y147.997 E-.59901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z6 F42000
G1 X104.095 Y129.07 Z6
G1 Z5.6
M73 P78 R6
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.513 Y129.012 E.00687
G1 X123.373 Y129.017 E.30625
G3 X125.39 Y131.204 I-.178 J2.188 E.05308
G1 X125.388 Y149.886 E.30336
G3 X123.198 Y151.99 I-2.189 J-.087 E.05449
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.096 J-2.198 E.05444
G1 X102.412 Y131.114 E.30339
G3 X104.036 Y129.085 I2.192 J.089 E.04518
; WIPE_START
G1 F3600
M204 S6000
G1 X104.513 Y129.012 E-.18332
G1 X106.031 Y129.012 E-.57668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 56 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer56 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.031 Y129.301 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188176
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11515
G1 X123.351 Y129.327 E.0025
; LINE_WIDTH: 0.248761
G3 X123.586 Y129.375 I-.221 J1.692 E.00222
G1 X123.71 Y129.412 E.0012
; LINE_WIDTH: 0.297992
G3 X124.967 Y130.63 I-.644 J1.923 E.02039
; LINE_WIDTH: 0.251792
G3 X125.022 Y130.801 I-2.489 J.886 E.00169
G1 X125.074 Y131.053 E.00241
; LINE_WIDTH: 0.188194
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.507 E.12289
G1 X125.085 Y149.848 E.00232
; LINE_WIDTH: 0.240515
G3 X125.026 Y150.182 I-1.926 J-.168 E.00303
G1 X124.999 Y150.276 E.00088
; LINE_WIDTH: 0.297486
G3 X123.776 Y151.565 I-1.934 J-.611 E.02068
; LINE_WIDTH: 0.253808
G3 X123.599 Y151.622 I-1.984 J-5.827 E.00176
G1 X123.376 Y151.669 E.00216
; LINE_WIDTH: 0.188292
G3 X123.163 Y151.692 I-.65 J-5.033 E.00145
G1 X104.894 Y151.699 E.12418
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.24383
G3 X104.333 Y151.653 I.28 J-2.452 E.00177
G1 X104.092 Y151.589 E.00226
; LINE_WIDTH: 0.299724
G3 X102.899 Y150.525 I.645 J-1.926 E.01862
; LINE_WIDTH: 0.263376
G3 X102.738 Y150.026 I1.987 J-.913 E.00519
G1 X102.737 Y150.015 E.00011
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.196466
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240606
G3 X102.774 Y130.818 I1.95 J.174 E.00301
G1 X102.801 Y130.724 E.00088
; LINE_WIDTH: 0.298699
G3 X103.921 Y129.477 I1.938 J.615 E.01951
; LINE_WIDTH: 0.261074
G3 X104.287 Y129.357 I.898 J2.109 E.00376
G1 X104.383 Y129.337 E.00096
; LINE_WIDTH: 0.188176
G1 X104.892 Y129.301 E.00347
G1 X105.971 Y129.301 E.00733
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.971 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 57/95
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6
G1 Z5.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00592
G1 X102.99 Y131.496 E.29353
G3 X104.752 Y129.596 I1.922 J.015 E.04618
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.077 J1.911 E.04628
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.911 J-.003 E.04746
G1 X104.897 Y151.41 E.29355
G3 X103.056 Y149.992 I.011 J-1.919 E.04053
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16108
G1 X102.991 Y147.997 E-.59892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z6.1 F42000
G1 X104.095 Y129.07 Z6.1
G1 Z5.7
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.00684
G1 X123.373 Y129.017 E.30627
G3 X125.39 Y131.204 I-.193 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.3034
G3 X104.037 Y129.084 I2.192 J.09 E.04518
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18279
G1 X106.031 Y129.012 E-.57721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 57 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer57 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.031 Y129.308 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187998
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11502
G1 X123.351 Y129.327 E.00251
; LINE_WIDTH: 0.248579
G1 X123.705 Y129.411 E.00336
; LINE_WIDTH: 0.299437
G3 X124.862 Y130.394 I-.645 J1.931 E.01762
G1 X124.912 Y130.497 E.00129
; LINE_WIDTH: 0.262877
G3 X125.061 Y130.973 I-1.903 J.856 E.00492
; LINE_WIDTH: 0.18851
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.504 E.12311
G3 X125.077 Y149.925 I-4.358 J-.021 E.00287
; LINE_WIDTH: 0.24939
G3 X124.973 Y150.353 I-2.085 J-.278 E.0041
; LINE_WIDTH: 0.298592
G3 X124.083 Y151.419 I-1.909 J-.69 E.016
G1 X123.774 Y151.566 E.00386
; LINE_WIDTH: 0.251098
G3 X123.334 Y151.676 I-.704 J-1.882 E.00425
; LINE_WIDTH: 0.188212
G1 X122.983 Y151.699 E.00239
G1 X104.894 Y151.699 E.1229
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243634
G3 X104.303 Y151.647 I.278 J-2.428 E.00204
G1 X104.095 Y151.59 E.00195
; LINE_WIDTH: 0.299635
G3 X102.898 Y150.523 I.645 J-1.93 E.01869
; LINE_WIDTH: 0.2632
G3 X102.738 Y150.026 I1.957 J-.901 E.00516
G1 X102.737 Y150.015 E.00011
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.204821
G3 X102.733 Y131.006 I3.514 J-.006 E.00362
; LINE_WIDTH: 0.25317
G3 X102.826 Y130.651 I2.231 J.39 E.00347
; LINE_WIDTH: 0.297748
G3 X104.087 Y129.413 I1.918 J.693 E.02057
; LINE_WIDTH: 0.248257
G3 X104.463 Y129.325 I.651 J1.929 E.00358
; LINE_WIDTH: 0.187998
G3 X104.633 Y129.309 I.286 J2.098 E.00116
G1 X105.971 Y129.308 E.00908
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.971 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 58/95
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.1 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.1
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00591
G1 X102.99 Y131.496 E.29353
G3 X104.825 Y129.591 I1.929 J.022 E.04732
G1 X122.975 Y129.591 E.29471
G3 X124.809 Y131.425 I-.087 J1.921 E.04622
G1 X124.81 Y149.504 E.29356
G3 X122.975 Y151.409 I-1.925 J-.018 E.04735
G1 X104.897 Y151.41 E.29355
G3 X103.055 Y149.992 I.005 J-1.912 E.04057
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16108
G1 X102.991 Y147.997 E-.59892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.435 Y140.377 Z6.2 F42000
G1 X104.095 Y129.07 Z6.2
G1 Z5.8
G1 E.8 F1800
M73 P79 R6
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00688
G1 X123.373 Y129.017 E.30623
G3 X125.39 Y131.204 I-.193 J2.201 E.053
G1 X125.388 Y149.886 E.30336
G3 X123.198 Y151.99 I-2.196 J-.095 E.05444
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.114 E.3034
G3 X104.037 Y129.084 I2.191 J.089 E.04518
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18354
G1 X106.031 Y129.012 E-.57646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 58 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer58 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.031 Y129.308 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188833
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.1156
G1 X123.351 Y129.327 E.00252
; LINE_WIDTH: 0.251013
G3 X123.75 Y129.426 I-.355 J2.283 E.00384
; LINE_WIDTH: 0.300638
G3 X124.902 Y130.474 I-.692 J1.917 E.01818
; LINE_WIDTH: 0.264047
G3 X125.061 Y130.973 I-1.89 J.878 E.00519
; LINE_WIDTH: 0.188511
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.507 E.12313
G3 X125.077 Y149.925 I-4.052 J-.008 E.00285
; LINE_WIDTH: 0.249193
G3 X124.974 Y150.35 I-2.072 J-.275 E.00406
; LINE_WIDTH: 0.298505
G3 X124.085 Y151.418 I-1.919 J-.693 E.01601
G1 X123.763 Y151.57 E.00403
; LINE_WIDTH: 0.25024
G3 X123.595 Y151.623 I-1.53 J-4.529 E.00164
G1 X123.331 Y151.676 E.00251
; LINE_WIDTH: 0.188165
G3 X123.195 Y151.69 I-.295 J-2.199 E.00093
G1 X104.894 Y151.699 E.12431
G1 X104.552 Y151.685 E.00233
; LINE_WIDTH: 0.240515
G3 X104.218 Y151.626 I.169 J-1.929 E.00303
G1 X104.124 Y151.599 E.00088
; LINE_WIDTH: 0.29923
G3 X102.9 Y150.528 I.62 J-1.944 E.01892
G1 X102.895 Y150.518 E.00013
; LINE_WIDTH: 0.263057
G3 X102.738 Y150.023 I1.901 J-.876 E.00512
G1 X102.737 Y150.015 E.00008
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.205266
G3 X102.719 Y131.105 I5.645 J.079 E.00287
M73 P79 R5
G1 X102.734 Y131.005 E.00076
; LINE_WIDTH: 0.254784
G3 X102.8 Y130.728 I1.725 J.261 E.00271
G1 X102.835 Y130.627 E.00102
; LINE_WIDTH: 0.301423
G3 X103.872 Y129.5 I1.906 J.714 E.0179
; LINE_WIDTH: 0.264124
G3 X104.373 Y129.339 I.906 J1.953 E.00522
; LINE_WIDTH: 0.188833
G3 X104.637 Y129.309 I.452 J2.794 E.00182
G1 X105.971 Y129.308 E.0091
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.971 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 59/95
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.2
G1 Z5.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.825 Y129.591 I1.914 J.008 E.04741
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.089 J1.924 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.919 J-.01 E.04742
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.008 J-1.914 E.04055
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15999
G1 X102.991 Y147.997 E-.60001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.3 F42000
G1 X104.095 Y129.07 Z6.3
G1 Z5.9
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00687
G1 X123.373 Y129.017 E.30624
G3 X125.39 Y131.204 I-.184 J2.193 E.05304
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.196 J-.094 E.05444
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.092 J-2.195 E.05446
G1 X102.412 Y131.114 E.3034
G3 X104.037 Y129.084 I2.189 J.087 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18349
G1 X106.031 Y129.012 E-.57651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 59 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer59 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.308 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18864
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11544
G1 X123.351 Y129.327 E.00254
; LINE_WIDTH: 0.248484
G1 X123.703 Y129.41 E.00334
; LINE_WIDTH: 0.299354
G3 X124.902 Y130.474 I-.647 J1.936 E.01865
; LINE_WIDTH: 0.26406
G3 X125.061 Y130.973 I-1.892 J.879 E.00519
; LINE_WIDTH: 0.188421
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.506 E.12305
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.24364
G3 X125.025 Y150.186 I-1.884 J-.184 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.297865
G3 X124.304 Y151.271 I-1.926 J-.639 E.01355
G1 X124.033 Y151.447 E.00363
G1 X123.769 Y151.568 E.00328
; LINE_WIDTH: 0.25092
G3 X123.337 Y151.675 I-.712 J-1.943 E.00417
; LINE_WIDTH: 0.188327
G3 X123.195 Y151.69 I-.303 J-2.226 E.00097
G1 X104.892 Y151.699 E.12444
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.247245
G3 X104.304 Y151.647 I.434 J-2.925 E.00151
G1 X104.095 Y151.59 E.00199
; LINE_WIDTH: 0.299478
G3 X102.899 Y150.526 I.644 J-1.929 E.01864
; LINE_WIDTH: 0.263678
G3 X102.738 Y150.025 I1.986 J-.913 E.0052
G1 X102.737 Y150.02 E.00005
; LINE_WIDTH: 0.18824
G3 X102.71 Y149.797 I6.353 J-.891 E.00153
G1 X102.701 Y131.489 E.12441
; LINE_WIDTH: 0.198355
G1 X102.717 Y131.125 E.00262
; LINE_WIDTH: 0.242922
G3 X102.8 Y130.728 I2.203 J.25 E.00366
G1 X102.803 Y130.718 E.0001
; LINE_WIDTH: 0.296666
G3 X104.088 Y129.413 I1.932 J.617 E.02132
; LINE_WIDTH: 0.248246
G3 X104.463 Y129.325 I.622 J1.807 E.00356
; LINE_WIDTH: 0.18864
G3 X104.637 Y129.309 I.316 J2.425 E.00119
G1 X105.972 Y129.308 E.00909
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 60/95
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.3 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.3
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.752 Y129.596 I1.93 J.022 E.04614
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.099 J1.933 E.04615
G1 X124.81 Y149.504 E.29357
G3 X122.976 Y151.409 I-1.926 J-.02 E.04732
G1 X104.896 Y151.41 E.29358
G3 X103.058 Y149.991 I.022 J-1.929 E.04046
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15981
G1 X102.991 Y147.996 E-.60019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.4 F42000
G1 X104.095 Y129.07 Z6.4
G1 Z6
M73 P80 R5
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00687
G1 X123.373 Y129.017 E.30624
G3 X125.39 Y131.204 I-.179 J2.188 E.05308
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.091 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.096 J-2.198 E.05446
G1 X102.412 Y131.112 E.30339
G3 X104.038 Y129.086 I2.198 J.098 E.04512
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.1833
G1 X106.032 Y129.012 E-.5767
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 60 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer60 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.308 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188029
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11504
G1 X123.351 Y129.327 E.00251
; LINE_WIDTH: 0.248448
G1 X123.702 Y129.41 E.00334
; LINE_WIDTH: 0.297732
G3 X124.97 Y130.64 I-.638 J1.926 E.02058
; LINE_WIDTH: 0.251843
G3 X125.074 Y131.053 I-1.893 J.695 E.004
; LINE_WIDTH: 0.188237
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.508 E.12293
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.241002
G1 X125.004 Y150.258 E.0035
; LINE_WIDTH: 0.298836
G3 X124.085 Y151.418 I-1.944 J-.596 E.01712
G1 X123.925 Y151.502 E.00204
; LINE_WIDTH: 0.263659
G3 X123.42 Y151.663 I-.903 J-1.96 E.00524
; LINE_WIDTH: 0.188522
G3 X123.196 Y151.69 I-1.019 J-7.399 E.00154
G1 X104.892 Y151.699 E.12459
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247176
G3 X104.214 Y151.625 I.221 J-1.793 E.00239
G1 X104.092 Y151.589 E.00117
; LINE_WIDTH: 0.298956
G3 X102.913 Y150.556 I.649 J-1.93 E.01819
G1 X102.86 Y150.437 E.00148
; LINE_WIDTH: 0.259385
G3 X102.738 Y150.023 I2.233 J-.883 E.00419
G1 X102.737 Y150.02 E.00002
; LINE_WIDTH: 0.188241
G3 X102.71 Y149.796 I4.647 J-.678 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.198599
G1 X102.718 Y131.121 E.00265
; LINE_WIDTH: 0.24307
G3 X102.8 Y130.728 I2.492 J.316 E.00363
G1 X102.803 Y130.718 E.0001
; LINE_WIDTH: 0.296816
G3 X104.089 Y129.413 I1.933 J.618 E.02134
; LINE_WIDTH: 0.2482
G3 X104.463 Y129.325 I.624 J1.819 E.00355
; LINE_WIDTH: 0.188029
G3 X104.633 Y129.309 I.312 J2.399 E.00116
G1 X105.972 Y129.308 E.00909
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 61/95
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.4
G1 Z6.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.799 Y129.593 I1.921 J.015 E.04694
G1 X122.976 Y129.591 E.29517
G3 X124.809 Y131.425 I-.086 J1.918 E.04621
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.012 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.008 J-1.914 E.04055
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15994
G1 X102.991 Y147.997 E-.60006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.5 F42000
G1 X104.095 Y129.07 Z6.5
G1 Z6.1
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00687
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.176 J2.186 E.05309
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.198 J-.096 E.05447
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.089 J-2.192 E.05447
G1 X102.412 Y131.114 E.30339
G3 X104.037 Y129.084 I2.19 J.088 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18338
G1 X106.032 Y129.012 E-.57662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 61 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer61 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.308 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188049
G1 F2548
M204 S6000
G1 X122.986 Y129.301 E.11508
G1 X123.351 Y129.327 E.00249
; LINE_WIDTH: 0.248432
G1 X123.702 Y129.41 E.00333
; LINE_WIDTH: 0.299799
G3 X124.818 Y130.315 I-.643 J1.934 E.01666
G1 X124.902 Y130.474 E.00204
; LINE_WIDTH: 0.264133
G3 X125.061 Y130.973 I-1.838 J.861 E.00519
; LINE_WIDTH: 0.188525
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.508 E.12314
G1 X125.075 Y149.933 E.0029
; LINE_WIDTH: 0.247427
G3 X125.025 Y150.187 I-2.039 J-.272 E.00239
G1 X124.988 Y150.31 E.00118
; LINE_WIDTH: 0.297856
G3 X124.083 Y151.419 I-1.931 J-.651 E.01648
G1 X123.774 Y151.566 E.00385
; LINE_WIDTH: 0.254792
G3 X123.42 Y151.662 I-.737 J-2.004 E.00349
G1 X123.393 Y151.667 E.00026
; LINE_WIDTH: 0.188444
G3 X123.19 Y151.69 I-.419 J-2.792 E.00139
G1 X104.892 Y151.699 E.12449
G3 X104.472 Y151.676 I.003 J-3.901 E.00286
; LINE_WIDTH: 0.246957
G3 X104.211 Y151.625 I.222 J-1.814 E.00245
G1 X104.096 Y151.589 E.00111
; LINE_WIDTH: 0.29972
G3 X102.899 Y150.526 I.637 J-1.923 E.01866
; LINE_WIDTH: 0.263673
G3 X102.738 Y150.022 I1.985 J-.912 E.00523
G1 X102.737 Y150.02 E.00001
; LINE_WIDTH: 0.18824
G3 X102.71 Y149.795 I6.347 J-.889 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.196474
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.240385
G3 X102.8 Y130.728 I2.122 J.208 E.00385
; LINE_WIDTH: 0.297353
G3 X104.021 Y129.436 I1.933 J.605 E.02069
G1 X104.037 Y129.43 E.00019
; LINE_WIDTH: 0.250465
G3 X104.347 Y129.344 I.729 J2.019 E.003
G1 X104.466 Y129.325 E.00112
; LINE_WIDTH: 0.188049
G3 X104.636 Y129.309 I.312 J2.416 E.00116
G1 X105.972 Y129.308 E.00906
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 62/95
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.5 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.5
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.8 Y129.593 I1.912 J.006 E.04701
G1 X122.977 Y129.591 E.29516
G3 X124.809 Y131.425 I-.081 J1.913 E.04624
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.912 J-.006 E.04742
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.005 J-1.911 E.04056
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.1604
G1 X102.991 Y147.997 E-.59961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.6 F42000
G1 X104.095 Y129.07 Z6.6
G1 Z6.2
G1 E.8 F1800
M73 P81 R5
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00687
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.179 J2.188 E.05307
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.05451
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.096 J-2.198 E.05443
G1 X102.412 Y131.114 E.30339
G3 X104.037 Y129.084 I2.19 J.088 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18332
G1 X106.032 Y129.012 E-.57668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 62 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer62 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.308 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188065
G1 F2548
M204 S6000
G1 X122.986 Y129.301 E.11509
G1 X123.352 Y129.327 E.00249
; LINE_WIDTH: 0.252898
G3 X123.63 Y129.387 I-.215 J1.686 E.00269
G1 X123.774 Y129.435 E.00143
; LINE_WIDTH: 0.300184
G3 X124.902 Y130.474 I-.709 J1.901 E.01786
G1 X124.936 Y130.554 E.00098
; LINE_WIDTH: 0.259855
G3 X125.062 Y130.977 I-2.03 J.83 E.00429
; LINE_WIDTH: 0.18851
G3 X125.085 Y131.146 I-2.687 J.452 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246995
G3 X125.025 Y150.186 I-1.794 J-.222 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.298121
G3 X124.085 Y151.418 I-1.936 J-.649 E.01652
G1 X123.774 Y151.566 E.00388
; LINE_WIDTH: 0.252291
G3 X123.427 Y151.661 I-.757 J-2.066 E.00338
G1 X123.353 Y151.673 E.00071
; LINE_WIDTH: 0.188354
G1 X122.983 Y151.699 E.00252
G1 X104.892 Y151.699 E.12302
G1 X104.466 Y151.675 E.0029
; LINE_WIDTH: 0.247398
G3 X104.328 Y151.652 I.43 J-2.926 E.00129
G1 X104.092 Y151.589 E.00225
; LINE_WIDTH: 0.299489
G3 X102.94 Y150.608 I.643 J-1.924 E.01756
G1 X102.896 Y150.52 E.00112
; LINE_WIDTH: 0.263135
G3 X102.738 Y150.023 I1.952 J-.894 E.00514
G1 X102.737 Y150.015 E.00008
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.583 E.00295
G1 X102.701 Y131.489 E.12293
; LINE_WIDTH: 0.196595
G1 X102.715 Y131.148 E.00244
; LINE_WIDTH: 0.241463
G3 X102.798 Y130.735 I2.071 J.2 E.00378
G1 X102.801 Y130.724 E.0001
; LINE_WIDTH: 0.296558
G3 X104.091 Y129.412 I1.932 J.61 E.0214
; LINE_WIDTH: 0.248099
G3 X104.463 Y129.325 I.617 J1.799 E.00354
; LINE_WIDTH: 0.188065
G3 X104.637 Y129.309 I.316 J2.429 E.00118
G1 X105.972 Y129.308 E.00907
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.972 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 63/95
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.6
G1 Z6.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00588
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.919 J.013 E.04616
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.919 J-.01 E.04741
G1 X104.898 Y151.41 E.29354
G3 X103.055 Y149.992 I.005 J-1.914 E.04058
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16032
G1 X102.991 Y147.997 E-.59968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.7 F42000
G1 X104.096 Y129.07 Z6.7
G1 Z6.3
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.00683
G1 X123.374 Y129.017 E.30628
G3 X125.39 Y131.204 I-.179 J2.188 E.05307
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.0545
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.30339
G3 X104.037 Y129.084 I2.193 J.091 E.04519
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18241
G1 X106.032 Y129.012 E-.57759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 63 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer63 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.301 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188257
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.1152
G1 X123.352 Y129.327 E.00251
; LINE_WIDTH: 0.248337
G1 X123.7 Y129.409 E.00331
; LINE_WIDTH: 0.299316
G3 X124.768 Y130.233 I-.645 J1.941 E.01556
G1 X124.906 Y130.483 E.00324
; LINE_WIDTH: 0.2635
G3 X125.062 Y130.977 I-2.045 J.916 E.00511
; LINE_WIDTH: 0.188499
G3 X125.085 Y131.146 I-2.665 J.449 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.504 E.1231
G3 X125.077 Y149.925 I-4.294 J-.019 E.00287
; LINE_WIDTH: 0.249378
G3 X124.974 Y150.351 I-2.209 J-.306 E.00408
; LINE_WIDTH: 0.300455
G3 X124.303 Y151.271 I-1.932 J-.704 E.01311
G1 X124.155 Y151.376 E.00206
G1 X123.913 Y151.508 E.00313
; LINE_WIDTH: 0.263214
G3 X123.441 Y151.658 I-.931 J-2.104 E.00489
G1 X123.423 Y151.662 E.00018
; LINE_WIDTH: 0.188412
G3 X123.254 Y151.685 I-.47 J-2.86 E.00116
G1 X122.983 Y151.699 E.00184
G1 X104.894 Y151.699 E.12305
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.241855
G3 X104.218 Y151.626 I.183 J-1.879 E.00281
G1 X104.124 Y151.599 E.00088
; LINE_WIDTH: 0.298662
G3 X102.938 Y150.606 I.613 J-1.936 E.01792
G1 X102.882 Y150.489 E.00146
; LINE_WIDTH: 0.261488
G3 X102.738 Y150.023 I2.035 J-.883 E.00478
G1 X102.737 Y150.015 E.00008
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.583 E.00294
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.196476
G1 X102.715 Y131.15 E.00242
; LINE_WIDTH: 0.24061
G3 X102.774 Y130.818 I1.948 J.174 E.00301
G1 X102.801 Y130.724 E.00088
; LINE_WIDTH: 0.298696
G3 X103.927 Y129.475 I1.936 J.613 E.01958
; LINE_WIDTH: 0.261504
G3 X104.1 Y129.408 I.695 J1.552 E.00182
G1 X104.377 Y129.338 E.00279
; LINE_WIDTH: 0.188257
G3 X104.55 Y129.315 I.892 J5.876 E.00119
G1 X104.892 Y129.301 E.00232
G1 X105.972 Y129.301 E.00734
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 64/95
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.7 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.7
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00592
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.913 J.007 E.0462
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.078 J1.912 E.04627
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.916 J-.01 E.0474
G1 X104.897 Y151.41 E.29355
G3 X103.056 Y149.992 I.01 J-1.917 E.04054
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16109
M73 P82 R5
G1 X102.991 Y147.997 E-.59891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.8 F42000
G1 X104.096 Y129.07 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00686
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.184 J2.193 E.05304
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.192 J-.089 E.05449
G1 X104.514 Y151.988 E.30337
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.30339
G3 X104.037 Y129.084 I2.189 J.087 E.04522
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18317
G1 X106.032 Y129.012 E-.57684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 64 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer64 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.301 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187887
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11494
G1 X123.248 Y129.315 E.0018
; LINE_WIDTH: 0.2406
G3 X123.63 Y129.387 I-.167 J1.922 E.00347
G1 X123.67 Y129.399 E.00038
; LINE_WIDTH: 0.29723
G3 X124.968 Y130.631 I-.612 J1.944 E.02081
; LINE_WIDTH: 0.251767
G3 X125.023 Y130.805 I-2.736 J.963 E.00171
G1 X125.074 Y131.052 E.00237
; LINE_WIDTH: 0.188337
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.508 E.12301
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.24699
G3 X125.025 Y150.186 I-1.794 J-.222 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.297958
G3 X123.774 Y151.566 I-1.93 J-.644 E.0204
; LINE_WIDTH: 0.251043
G3 X123.45 Y151.656 I-.82 J-2.311 E.00314
G1 X123.334 Y151.676 E.00111
; LINE_WIDTH: 0.188212
G1 X122.983 Y151.699 E.00239
G1 X104.894 Y151.699 E.1229
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.242153
G3 X104.17 Y151.613 I.241 J-2.181 E.00326
G1 X104.127 Y151.6 E.00041
; LINE_WIDTH: 0.297307
G3 X102.834 Y150.374 I.614 J-1.942 E.02073
; LINE_WIDTH: 0.255699
G3 X102.738 Y150.026 I2.076 J-.76 E.00345
G1 X102.737 Y150.015 E.0001
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.198319
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242553
G3 X102.8 Y130.728 I2.174 J.242 E.00367
G1 X102.803 Y130.718 E.00009
; LINE_WIDTH: 0.297568
G3 X104.035 Y129.432 I1.936 J.621 E.02075
; LINE_WIDTH: 0.25099
G3 X104.349 Y129.343 I.724 J1.975 E.00306
G1 X104.462 Y129.325 E.00107
; LINE_WIDTH: 0.187887
G1 X104.892 Y129.301 E.00292
G1 X105.972 Y129.301 E.00732
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 65/95
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.8
G1 Z6.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.825 Y129.591 I1.928 J.021 E.04733
G1 X122.975 Y129.591 E.29471
G3 X124.809 Y131.425 I-.079 J1.913 E.04627
G1 X124.81 Y149.502 E.29353
G3 X122.976 Y151.409 I-1.924 J-.015 E.04737
G1 X104.897 Y151.41 E.29356
G3 X103.054 Y149.992 I.004 J-1.911 E.04059
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15991
G1 X102.991 Y147.996 E-.60009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z6.9 F42000
G1 X104.096 Y129.07 Z6.9
G1 Z6.5
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00685
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.179 J2.188 E.05307
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.198 J-.096 E.05444
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.096 J-2.198 E.05443
G1 X102.412 Y131.114 E.30339
G3 X104.038 Y129.084 I2.192 J.089 E.04521
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18302
G1 X106.032 Y129.012 E-.57698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 65 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer65 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.033 Y129.308 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188702
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.1155
G1 X123.352 Y129.327 E.00252
; LINE_WIDTH: 0.249458
G3 X123.586 Y129.375 I-.223 J1.697 E.00222
G1 X123.724 Y129.417 E.00134
; LINE_WIDTH: 0.299962
G3 X124.9 Y130.472 I-.656 J1.915 E.01842
G1 X124.905 Y130.482 E.00013
; LINE_WIDTH: 0.26374
G3 X125.061 Y130.973 I-2.086 J.929 E.00509
; LINE_WIDTH: 0.188517
G1 X125.099 Y131.417 E.00304
G1 X125.099 Y149.504 E.12311
G3 X125.076 Y149.929 I-4.276 J-.019 E.0029
; LINE_WIDTH: 0.247172
M73 P82 R4
G3 X125.047 Y150.097 I-2.946 J-.432 E.00156
G1 X124.988 Y150.31 E.00203
; LINE_WIDTH: 0.298127
G3 X123.769 Y151.568 I-1.926 J-.647 E.02042
; LINE_WIDTH: 0.25572
G3 X123.42 Y151.663 I-.841 J-2.4 E.00345
; LINE_WIDTH: 0.188423
G3 X123.195 Y151.69 I-1.007 J-7.33 E.00155
G1 X104.894 Y151.699 E.12449
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243647
G3 X104.326 Y151.651 I.277 J-2.43 E.00184
G1 X104.095 Y151.59 E.00216
; LINE_WIDTH: 0.299626
G3 X102.899 Y150.528 I.648 J-1.934 E.01862
G1 X102.895 Y150.518 E.00013
; LINE_WIDTH: 0.263232
G3 X102.738 Y150.025 I2.05 J-.922 E.0051
G1 X102.737 Y150.02 E.00005
; LINE_WIDTH: 0.18824
G3 X102.71 Y149.795 I6.285 J-.88 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.198341
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242534
G3 X102.8 Y130.728 I2.168 J.241 E.00366
G1 X102.803 Y130.719 E.00009
; LINE_WIDTH: 0.296815
G3 X104.093 Y129.411 I1.931 J.616 E.02139
; LINE_WIDTH: 0.247947
G3 X104.463 Y129.325 I.62 J1.822 E.00351
; LINE_WIDTH: 0.188702
G3 X104.637 Y129.309 I.316 J2.427 E.00119
G1 X105.973 Y129.308 E.0091
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.973 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 66/95
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.9 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z6.9
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.977 Y129.591 E.29475
G3 X124.809 Y131.425 I-.086 J1.918 E.0462
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.912 J-.006 E.04742
G1 X104.894 Y151.41 E.2936
G3 X103.056 Y149.992 I.016 J-1.921 E.04048
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.16001
G1 X102.991 Y147.997 E-.6
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z7 F42000
G1 X104.096 Y129.07 Z7
G1 Z6.6
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.00682
G1 X123.374 Y129.017 E.30628
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
M73 P83 R4
G3 X123.196 Y151.99 I-2.198 J-.096 E.05447
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.092 J-2.194 E.05446
G1 X102.412 Y131.114 E.30339
G3 X104.038 Y129.084 I2.191 J.088 E.04522
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18226
G1 X106.032 Y129.012 E-.57774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 66 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer66 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.032 Y129.308 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188933
G1 F2548
M204 S6000
G1 X122.986 Y129.301 E.11569
G1 X123.352 Y129.327 E.0025
; LINE_WIDTH: 0.251037
G3 X123.749 Y129.426 I-.349 J2.259 E.00384
; LINE_WIDTH: 0.298249
G3 X124.971 Y130.641 I-.688 J1.913 E.02006
; LINE_WIDTH: 0.251886
G3 X125.074 Y131.052 I-1.928 J.704 E.00398
; LINE_WIDTH: 0.188338
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12301
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246986
G3 X125.025 Y150.186 I-1.794 J-.221 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.299401
G3 X123.926 Y151.502 I-1.934 J-.648 E.01864
G1 X123.916 Y151.506 E.00012
; LINE_WIDTH: 0.263537
G3 X123.423 Y151.661 I-.905 J-2.012 E.00511
; LINE_WIDTH: 0.188511
G3 X123.254 Y151.685 I-.438 J-2.567 E.00116
G1 X122.983 Y151.699 E.00185
G1 X104.889 Y151.699 E.12316
G3 X104.477 Y151.677 I-.011 J-3.621 E.0028
; LINE_WIDTH: 0.246855
G3 X104.211 Y151.625 I.222 J-1.834 E.0025
G1 X104.092 Y151.588 E.00114
; LINE_WIDTH: 0.299599
G3 X102.898 Y150.526 I.643 J-1.926 E.01861
G1 X102.892 Y150.513 E.00016
; LINE_WIDTH: 0.262936
G3 X102.738 Y150.025 I2.138 J-.942 E.00504
G1 X102.737 Y150.02 E.00005
; LINE_WIDTH: 0.18824
G3 X102.71 Y149.795 I6.327 J-.885 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.198344
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242529
G3 X102.8 Y130.728 I2.167 J.24 E.00366
G1 X102.803 Y130.719 E.00009
; LINE_WIDTH: 0.299171
G3 X103.791 Y129.54 I1.944 J.627 E.01785
G1 X103.881 Y129.496 E.00112
; LINE_WIDTH: 0.263619
G3 X104.373 Y129.339 I.882 J1.92 E.00511
; LINE_WIDTH: 0.188933
G3 X104.637 Y129.309 I.336 J1.737 E.00182
G1 X105.972 Y129.308 E.00911
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.972 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 67/95
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7
G1 Z6.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.752 Y129.596 I1.926 J.019 E.04616
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.921 J-.014 E.04737
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.014 J-1.921 E.0405
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.16003
G1 X102.991 Y147.997 E-.59997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z7.1 F42000
G1 X104.096 Y129.069 Z7.1
G1 Z6.7
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.00682
G1 X123.374 Y129.017 E.30628
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.888 E.30339
G3 X123.196 Y151.99 I-2.198 J-.098 E.05443
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.096 J-2.198 E.05443
G1 X102.412 Y131.114 E.30339
G3 X104.038 Y129.084 I2.193 J.091 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18215
G1 X106.033 Y129.012 E-.57785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 67 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer67 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.033 Y129.308 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187917
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11496
G1 X123.249 Y129.315 E.0018
; LINE_WIDTH: 0.240908
G3 X123.415 Y129.336 I-.545 J4.832 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.298899
G3 X124.768 Y130.233 I-.608 J1.931 E.01583
G1 X124.906 Y130.484 E.00324
; LINE_WIDTH: 0.263716
G3 X125.061 Y130.973 I-2.035 J.911 E.00508
; LINE_WIDTH: 0.18855
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.508 E.12316
G1 X125.074 Y149.942 E.00296
; LINE_WIDTH: 0.250246
G3 X124.974 Y150.349 I-2.136 J-.308 E.00391
; LINE_WIDTH: 0.30055
G3 X123.926 Y151.501 I-1.911 J-.687 E.01818
; LINE_WIDTH: 0.263761
G3 X123.595 Y151.623 I-.859 J-1.821 E.00349
G1 X123.421 Y151.662 E.00176
; LINE_WIDTH: 0.188503
G1 X122.983 Y151.699 E.00299
G1 X104.892 Y151.699 E.12313
G3 X104.471 Y151.676 I-.004 J-3.778 E.00287
; LINE_WIDTH: 0.249645
G3 X104.047 Y151.573 I.274 J-2.053 E.00407
; LINE_WIDTH: 0.300819
G3 X102.899 Y150.526 I.691 J-1.91 E.01815
; LINE_WIDTH: 0.263609
G3 X102.738 Y150.025 I2.02 J-.923 E.0052
G1 X102.737 Y150.02 E.00005
; LINE_WIDTH: 0.188239
G3 X102.71 Y149.795 I6.338 J-.885 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.19836
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242393
G3 X102.799 Y130.73 I2.162 J.24 E.00365
G1 X102.802 Y130.721 E.00009
; LINE_WIDTH: 0.296412
G3 X104.095 Y129.411 I1.937 J.618 E.0214
; LINE_WIDTH: 0.24782
G3 X104.463 Y129.325 I.647 J1.948 E.00349
; LINE_WIDTH: 0.187917
G3 X104.633 Y129.309 I.289 J2.138 E.00116
G1 X105.973 Y129.308 E.00909
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.973 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 68/95
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.1 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.1
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00592
G1 X102.99 Y131.496 E.29354
G3 X104.75 Y129.596 I1.915 J.009 E.04619
G1 X122.973 Y129.591 E.2959
G3 X124.809 Y131.425 I-.077 J1.913 E.0463
G1 X124.81 Y149.504 E.29357
G3 X122.976 Y151.409 I-1.928 J-.021 E.04731
G1 X104.896 Y151.41 E.29358
G3 X103.056 Y149.992 I.012 J-1.919 E.04051
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16113
G1 X102.991 Y147.997 E-.59888
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.378 Z7.2 F42000
G1 X104.096 Y129.07 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00685
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.194 J-.092 E.05447
G1 X104.514 Y151.988 E.30337
G3 X102.41 Y149.798 I.088 J-2.19 E.05448
G1 X102.412 Y131.114 E.30339
G3 X104.039 Y129.085 I2.198 J.096 E.04518
; WIPE_START
G1 F3600
M204 S6000
M73 P84 R4
G1 X104.514 Y129.012 E-.18286
G1 X106.033 Y129.012 E-.57714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 68 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer68 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.033 Y129.301 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18829
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11519
G1 X123.352 Y129.327 E.00254
; LINE_WIDTH: 0.251041
G3 X123.749 Y129.426 I-.357 J2.286 E.00383
; LINE_WIDTH: 0.299549
G3 X124.886 Y130.441 I-.688 J1.913 E.01769
G1 X124.938 Y130.558 E.00145
; LINE_WIDTH: 0.259665
G3 X125.061 Y130.977 I-1.996 J.816 E.00425
; LINE_WIDTH: 0.18851
G3 X125.085 Y131.146 I-2.662 J.449 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12313
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246989
G3 X125.025 Y150.186 I-1.794 J-.221 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.298864
G3 X123.978 Y151.476 I-1.923 J-.639 E.01794
G1 X123.836 Y151.54 E.00176
; LINE_WIDTH: 0.259369
G3 X123.595 Y151.623 I-.704 J-1.659 E.00248
G1 X123.42 Y151.663 E.00174
; LINE_WIDTH: 0.18838
G3 X123.193 Y151.69 I-.892 J-6.414 E.00156
G1 X104.892 Y151.699 E.12446
G1 X104.552 Y151.685 E.00231
; LINE_WIDTH: 0.240696
G3 X104.385 Y151.663 I.176 J-1.983 E.0015
G1 X104.124 Y151.599 E.0024
; LINE_WIDTH: 0.298179
G3 X102.924 Y150.578 I.619 J-1.943 E.01823
G1 X102.86 Y150.437 E.00176
; LINE_WIDTH: 0.258917
G3 X102.738 Y150.026 I2.235 J-.883 E.00415
G1 X102.737 Y150.015 E.0001
; LINE_WIDTH: 0.18821
G1 X102.701 Y149.579 E.00297
G1 X102.701 Y131.489 E.12291
; LINE_WIDTH: 0.197755
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.242311
G3 X102.8 Y130.729 I2.123 J.233 E.00366
G1 X102.803 Y130.719 E.00009
; LINE_WIDTH: 0.298931
G3 X103.931 Y129.473 I1.94 J.624 E.01958
; LINE_WIDTH: 0.260734
G3 X104.377 Y129.338 I.826 J1.916 E.00455
G1 X104.385 Y129.337 E.00008
; LINE_WIDTH: 0.18829
G3 X104.55 Y129.315 I.363 J2.104 E.00113
G1 X104.892 Y129.301 E.00232
G1 X105.973 Y129.301 E.00735
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.973 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 69/95
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.2
G1 Z6.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.752 Y129.596 I1.935 J.027 E.0461
G1 X122.973 Y129.591 E.29587
G3 X124.809 Y131.425 I-.089 J1.924 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.012 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.008 J-1.914 E.04055
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.16
G1 X102.991 Y147.997 E-.6
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z7.3 F42000
G1 X104.097 Y129.07 Z7.3
G1 Z6.9
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00685
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.196 J2.204 E.05298
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.192 J-.09 E.05451
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.092 J-2.194 E.05449
G1 X102.412 Y131.114 E.30335
G3 X104.039 Y129.085 I2.198 J.096 E.04518
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.1828
G1 X106.033 Y129.012 E-.5772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 69 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer69 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.033 Y129.308 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187929
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11494
G1 X123.242 Y129.314 E.00179
; LINE_WIDTH: 0.240171
G3 X123.582 Y129.374 I-.157 J1.887 E.00308
G1 X123.676 Y129.401 E.00088
; LINE_WIDTH: 0.297087
G3 X124.967 Y130.631 I-.617 J1.942 E.02072
; LINE_WIDTH: 0.251831
G3 X125.023 Y130.805 I-2.534 J.9 E.00172
G1 X125.074 Y131.052 E.00237
; LINE_WIDTH: 0.188345
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12301
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.24753
G3 X125.047 Y150.097 I-2.95 J-.439 E.00151
G1 X124.988 Y150.31 E.00204
; LINE_WIDTH: 0.298007
G3 X123.774 Y151.566 I-1.929 J-.65 E.02035
; LINE_WIDTH: 0.252177
G3 X123.351 Y151.674 I-.729 J-1.978 E.00411
; LINE_WIDTH: 0.188343
G1 X122.983 Y151.699 E.00251
G1 X104.892 Y151.699 E.12301
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247069
G3 X104.211 Y151.625 I.222 J-1.8 E.00242
G1 X104.097 Y151.589 E.00109
; LINE_WIDTH: 0.29952
G3 X102.899 Y150.526 I.633 J-1.92 E.01867
; LINE_WIDTH: 0.263564
G3 X102.737 Y150.02 I1.958 J-.905 E.00525
; LINE_WIDTH: 0.188239
G3 X102.71 Y149.79 I4.582 J-.669 E.00157
G1 X102.701 Y131.489 E.12436
; LINE_WIDTH: 0.197767
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.2422
G3 X102.799 Y130.73 I2.144 J.237 E.00365
G1 X102.802 Y130.721 E.00009
; LINE_WIDTH: 0.296495
G3 X104.096 Y129.41 I1.937 J.619 E.02142
; LINE_WIDTH: 0.247758
G3 X104.463 Y129.325 I.608 J1.785 E.00348
; LINE_WIDTH: 0.187929
G3 X104.633 Y129.309 I.312 J2.401 E.00116
G1 X105.973 Y129.308 E.00909
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.973 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 70/95
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.3 I-1.184 J-.283 P1  F42000
G1 X103.042 Y149.929 Z7.3
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X103.032 Y149.891 E.00064
G3 X102.991 Y149.575 I1.881 J-.405 E.00518
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.005 E.04744
G1 X104.898 Y151.41 E.29354
G3 X103.139 Y150.23 I.015 J-1.924 E.03643
G1 X103.06 Y149.986 E.00415
; WIPE_START
G1 F3600
M204 S6000
G1 X103.032 Y149.891 E-.03771
G1 X102.991 Y149.575 E-.12103
G1 X102.991 Y147.993 E-.60126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.438 Y140.373 Z7.4 F42000
G1 X104.101 Y129.077 Z7.4
G1 Z7
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.239 Y129.042 E.00231
G3 X104.514 Y129.012 I.38 J2.176 E.00451
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.196 J2.204 E.05298
G1 X125.388 Y149.886 E.30335
M73 P85 R4
G3 X123.197 Y151.99 I-2.192 J-.09 E.05449
G1 X104.514 Y151.988 E.30337
G3 X102.41 Y149.796 I.092 J-2.194 E.05449
G1 X102.412 Y131.114 E.30335
G3 X103.846 Y129.149 I2.207 J.104 E.04185
G1 X104.043 Y129.093 E.00332
; WIPE_START
G1 F3600
M204 S6000
G1 X104.239 Y129.042 E-.07675
G1 X104.514 Y129.012 E-.1054
G1 X106.035 Y129.012 E-.57785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 70 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer70 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.308 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188762
G1 F2547
M204 S6000
G1 X122.983 Y129.301 E.11553
G1 X123.352 Y129.327 E.00252
; LINE_WIDTH: 0.248041
G1 X123.694 Y129.407 E.00325
; LINE_WIDTH: 0.299168
G3 X124.902 Y130.474 I-.635 J1.935 E.01875
; LINE_WIDTH: 0.26407
G3 X125.061 Y130.973 I-1.887 J.876 E.00518
; LINE_WIDTH: 0.188512
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.504 E.12311
G3 X125.076 Y149.926 I-4.285 J-.019 E.00288
; LINE_WIDTH: 0.247016
G3 X125.025 Y150.187 I-1.991 J-.257 E.00244
G1 X124.988 Y150.31 E.00118
; LINE_WIDTH: 0.297838
G3 X124.081 Y151.42 I-1.922 J-.644 E.0165
G1 X123.774 Y151.566 E.00383
; LINE_WIDTH: 0.251023
G3 X123.446 Y151.658 I-.741 J-2.016 E.00319
G1 X123.333 Y151.676 E.00107
; LINE_WIDTH: 0.188307
G1 X122.983 Y151.699 E.00238
G1 X104.896 Y151.699 E.12296
G3 X104.472 Y151.676 I.019 J-4.277 E.00289
; LINE_WIDTH: 0.247034
G3 X104.322 Y151.65 I.427 J-2.936 E.0014
G1 X104.096 Y151.589 E.00215
; LINE_WIDTH: 0.298015
G3 X102.899 Y150.528 I.648 J-1.936 E.01852
G1 X102.834 Y150.374 E.00188
; LINE_WIDTH: 0.25331
G3 X102.728 Y149.961 I1.979 J-.731 E.00403
; LINE_WIDTH: 0.188083
G1 X102.701 Y149.583 E.00257
G1 X102.701 Y131.489 E.12284
; LINE_WIDTH: 0.205954
G3 X102.737 Y130.985 I3.461 J-.008 E.0038
; LINE_WIDTH: 0.254459
G3 X102.826 Y130.651 I1.957 J.343 E.00329
; LINE_WIDTH: 0.297474
G3 X104.097 Y129.41 I1.911 J.687 E.02068
; LINE_WIDTH: 0.247702
G3 X104.463 Y129.325 I.607 J1.784 E.00347
; LINE_WIDTH: 0.188762
G3 X104.637 Y129.309 I.318 J2.447 E.00119
G1 X105.975 Y129.308 E.00912
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.975 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 71/95
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.4
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00587
G1 X102.99 Y131.496 E.29358
G3 X104.75 Y129.596 I1.929 J.021 E.04611
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.427 I-.099 J1.933 E.04618
G1 X124.81 Y149.504 E.29354
G3 X122.973 Y151.409 I-1.911 J-.005 E.04746
G1 X104.897 Y151.41 E.29352
G3 X103.056 Y149.992 I.01 J-1.917 E.04055
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.15994
G1 X102.991 Y147.997 E-.60007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.377 Z7.5 F42000
G1 X104.097 Y129.069 Z7.5
G1 Z7.1
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.515 Y129.012 E.00685
G1 X123.374 Y129.017 E.30623
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.204 J-.102 E.05441
G1 X104.514 Y151.988 E.30337
G3 X102.41 Y149.796 I.092 J-2.194 E.05449
G1 X102.412 Y131.114 E.30335
G3 X104.04 Y129.086 I2.206 J.104 E.04514
; WIPE_START
G1 F3600
M204 S6000
G1 X104.515 Y129.012 E-.1827
G1 X106.034 Y129.012 E-.5773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 71 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer71 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.301 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188346
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11525
G1 X123.352 Y129.327 E.00251
; LINE_WIDTH: 0.251041
G3 X123.75 Y129.426 I-.356 J2.284 E.00384
; LINE_WIDTH: 0.299777
G3 X124.884 Y130.439 I-.702 J1.929 E.01767
G1 X124.938 Y130.558 E.00148
; LINE_WIDTH: 0.259678
G3 X125.061 Y130.977 I-2 J.817 E.00425
; LINE_WIDTH: 0.18851
G3 X125.096 Y131.32 I-2.706 J.449 E.00235
G1 X125.099 Y149.508 E.1238
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.246978
G3 X125.025 Y150.186 I-1.79 J-.221 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.298301
G3 X123.791 Y151.558 I-1.922 J-.637 E.02022
; LINE_WIDTH: 0.256637
G3 X123.595 Y151.623 I-1.519 J-4.273 E.00199
G1 X123.42 Y151.663 E.00172
; LINE_WIDTH: 0.188404
G3 X123.25 Y151.685 I-.498 J-3.075 E.00116
G1 X122.979 Y151.699 E.00184
G1 X104.894 Y151.699 E.12301
G1 X104.526 Y151.683 E.00251
; LINE_WIDTH: 0.243621
G3 X104.214 Y151.625 I.184 J-1.884 E.00288
G1 X104.095 Y151.59 E.00112
; LINE_WIDTH: 0.299639
G3 X102.899 Y150.525 I.637 J-1.922 E.01866
; LINE_WIDTH: 0.263634
G3 X102.777 Y150.195 I1.808 J-.855 E.00348
G1 X102.737 Y150.02 E.00177
; LINE_WIDTH: 0.188239
G3 X102.71 Y149.79 I3.389 J-.525 E.00158
G1 X102.701 Y131.489 E.12436
; LINE_WIDTH: 0.198382
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.241971
G3 X102.8 Y130.729 I2.154 J.237 E.00365
; LINE_WIDTH: 0.2977
G3 X103.874 Y129.498 I1.935 J.605 E.01893
G1 X104.008 Y129.441 E.00164
; LINE_WIDTH: 0.256908
G3 X104.205 Y129.377 I1.526 J4.297 E.00199
G1 X104.377 Y129.338 E.00169
; LINE_WIDTH: 0.188346
G3 X104.55 Y129.315 I.359 J1.982 E.00119
G1 X104.892 Y129.301 E.00233
G1 X105.974 Y129.301 E.00736
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 72/95
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.5 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.93 Z7.5
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X103.031 Y149.89 E.00068
G3 X102.991 Y149.575 I1.876 J-.397 E.00516
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.927 J.021 E.04733
G1 X122.977 Y129.591 E.29475
G3 X124.809 Y131.425 I-.081 J1.913 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.934 J-.025 E.04732
G1 X104.896 Y151.41 E.29357
G3 X103.084 Y150.088 I.011 J-1.917 E.03889
G1 X103.057 Y149.988 E.00168
; WIPE_START
G1 F3600
M204 S6000
G1 X103.031 Y149.89 E-.03876
G1 X102.991 Y149.575 E-.12057
G1 X102.991 Y147.994 E-.60067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.375 Z7.6 F42000
G1 X104.097 Y129.072 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.512 Y129.012 E.00682
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
M73 P86 R4
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.515 Y151.988 E.30334
G3 X102.41 Y149.798 I.086 J-2.189 E.0545
G1 X102.412 Y131.114 E.30339
G3 X104.039 Y129.087 I2.207 J.104 E.04512
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18216
G1 X106.033 Y129.012 E-.57784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 72 start: 94
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
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer72 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.033 Y129.308 F42000
G1 Z7.2
M73 P86 R3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188812
G1 F2547
M204 S6000
G1 X122.987 Y129.301 E.1156
G1 X123.352 Y129.327 E.0025
; LINE_WIDTH: 0.252915
G3 X123.63 Y129.387 I-.22 J1.702 E.00268
G1 X123.773 Y129.435 E.00143
; LINE_WIDTH: 0.298916
G3 X124.967 Y130.631 I-.717 J1.911 E.01969
; LINE_WIDTH: 0.251908
G3 X125.058 Y130.956 I-2.458 J.856 E.00317
G1 X125.073 Y131.047 E.00087
; LINE_WIDTH: 0.188247
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243657
G3 X125.025 Y150.186 I-1.997 J-.205 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.298008
G3 X123.778 Y151.564 I-1.933 J-.647 E.02035
; LINE_WIDTH: 0.252435
G3 X123.595 Y151.623 I-1.466 J-4.232 E.00181
G1 X123.351 Y151.674 E.00235
; LINE_WIDTH: 0.188346
G1 X122.983 Y151.699 E.00251
G1 X104.892 Y151.699 E.12301
G3 X104.467 Y151.675 I0 J-3.799 E.00289
; LINE_WIDTH: 0.249963
G3 X104.17 Y151.613 I.297 J-2.164 E.00283
G1 X104.043 Y151.572 E.00124
; LINE_WIDTH: 0.298833
G3 X102.94 Y150.609 I.713 J-1.93 E.01692
G1 X102.835 Y150.375 E.0029
; LINE_WIDTH: 0.253132
G3 X102.728 Y149.959 I1.919 J-.713 E.00405
; LINE_WIDTH: 0.188082
G3 X102.71 Y149.795 I3.496 J-.465 E.00112
G1 X102.701 Y131.489 E.12428
; LINE_WIDTH: 0.198396
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.241962
G3 X102.799 Y130.729 I2.152 J.237 E.00365
; LINE_WIDTH: 0.297496
G3 X103.878 Y129.496 I1.935 J.605 E.01896
G1 X104.024 Y129.436 E.00178
; LINE_WIDTH: 0.251755
G3 X104.289 Y129.356 I.714 J1.885 E.0026
G1 X104.458 Y129.325 E.00161
; LINE_WIDTH: 0.188812
G3 X104.637 Y129.309 I.354 J2.893 E.00123
G1 X105.973 Y129.308 E.00911
; CHANGE_LAYER
; Z_HEIGHT: 7.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.973 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 73/95
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.6
G1 Z7.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.576 E.00588
G1 X102.99 Y131.496 E.29358
G3 X104.825 Y129.591 I1.915 J.009 E.0474
G1 X122.977 Y129.591 E.29475
G3 X124.809 Y131.424 I-.082 J1.914 E.04622
G1 X124.81 Y149.504 E.29358
G3 X122.975 Y151.409 I-1.934 J-.027 E.04729
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.013 J-1.919 E.04051
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.16019
G1 X102.991 Y147.997 E-.59981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.378 Z7.7 F42000
G1 X104.097 Y129.069 Z7.7
G1 Z7.3
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00684
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.112 E.30342
G3 X104.039 Y129.085 I2.198 J.098 E.04515
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.1826
G1 X106.034 Y129.012 E-.5774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 73 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer73 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.308 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18901
G1 F2548
M204 S6000
G1 X122.987 Y129.301 E.11573
G1 X123.352 Y129.327 E.0025
; LINE_WIDTH: 0.25106
G3 X123.749 Y129.426 I-.35 J2.264 E.00384
; LINE_WIDTH: 0.299612
G3 X124.902 Y130.474 I-.697 J1.923 E.01811
G1 X124.936 Y130.554 E.00098
; LINE_WIDTH: 0.25968
G3 X125.062 Y130.98 I-2.026 J.828 E.00432
; LINE_WIDTH: 0.188531
G3 X125.09 Y131.21 I-3.039 J.491 E.00158
G1 X125.099 Y149.508 E.12456
G1 X125.075 Y149.938 E.00293
; LINE_WIDTH: 0.248532
G3 X125.031 Y150.164 I-3.299 J-.517 E.00213
G1 X124.988 Y150.31 E.0014
; LINE_WIDTH: 0.29993
G3 X123.926 Y151.501 I-1.942 J-.662 E.0186
; LINE_WIDTH: 0.263408
G3 X123.595 Y151.623 I-.853 J-1.804 E.00348
G1 X123.415 Y151.663 E.00181
; LINE_WIDTH: 0.188394
G1 X122.983 Y151.699 E.00295
G1 X104.892 Y151.699 E.12305
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.243606
G3 X104.319 Y151.65 I.301 J-2.552 E.0019
G1 X104.096 Y151.59 E.00209
; LINE_WIDTH: 0.299498
G3 X102.899 Y150.526 I.649 J-1.936 E.01864
; LINE_WIDTH: 0.263704
G3 X102.737 Y150.021 I1.984 J-.912 E.00524
; LINE_WIDTH: 0.188242
G3 X102.71 Y149.795 I7.08 J-.974 E.00155
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.198058
G1 X102.718 Y131.121 E.00265
; LINE_WIDTH: 0.242825
G3 X102.774 Y130.818 I2.019 J.22 E.00278
G1 X102.804 Y130.717 E.00095
; LINE_WIDTH: 0.299218
G3 X103.874 Y129.499 I1.94 J.626 E.01888
; LINE_WIDTH: 0.264041
G3 X104.373 Y129.339 I.91 J1.981 E.00519
; LINE_WIDTH: 0.18901
G3 X104.637 Y129.309 I.455 J2.818 E.00182
G1 X105.974 Y129.308 E.00912
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 74/95
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.7 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.7
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00588
G1 X102.99 Y131.496 E.29358
G3 X104.752 Y129.596 I1.926 J.019 E.04616
G1 X122.973 Y129.591 E.29586
G3 X124.809 Y131.425 I-.076 J1.912 E.0463
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.919 J-.012 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.012 J-1.919 E.04051
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16021
G1 X102.991 Y147.997 E-.5998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.436 Y140.378 Z7.8 F42000
G1 X104.097 Y129.07 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.0068
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.088 J-2.19 E.05452
G1 X102.412 Y131.114 E.30336
G3 X104.039 Y129.085 I2.198 J.096 E.04519
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18185
M73 P87 R3
G1 X106.034 Y129.012 E-.57815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 74 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer74 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.308 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188005
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11498
G1 X123.242 Y129.314 E.00179
; LINE_WIDTH: 0.238748
G3 X123.415 Y129.336 I-.53 J4.786 E.00154
G1 X123.645 Y129.391 E.00209
; LINE_WIDTH: 0.298256
G3 X124.901 Y130.474 I-.585 J1.948 E.01926
; LINE_WIDTH: 0.264104
G3 X125.061 Y130.973 I-1.799 J.85 E.00519
; LINE_WIDTH: 0.188527
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.508 E.12315
G1 X125.075 Y149.935 E.00291
; LINE_WIDTH: 0.247536
G3 X125.047 Y150.096 I-2.953 J-.439 E.00151
G1 X124.988 Y150.31 E.00204
; LINE_WIDTH: 0.29796
G3 X123.849 Y151.535 I-1.924 J-.646 E.01943
G1 X123.773 Y151.566 E.00092
; LINE_WIDTH: 0.251992
G3 X123.599 Y151.622 I-1.537 J-4.476 E.00172
G1 X123.348 Y151.674 E.00241
; LINE_WIDTH: 0.188337
G1 X122.983 Y151.699 E.00249
G1 X104.892 Y151.699 E.123
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.247162
G3 X104.211 Y151.625 I.222 J-1.796 E.00242
G1 X104.096 Y151.589 E.00111
; LINE_WIDTH: 0.298055
G3 X102.898 Y150.526 I.65 J-1.938 E.01854
G1 X102.835 Y150.374 E.00186
; LINE_WIDTH: 0.255443
G3 X102.737 Y150.02 I2.084 J-.763 E.00351
G1 X102.735 Y150.01 E.0001
; LINE_WIDTH: 0.188213
G3 X102.71 Y149.79 I3.72 J-.549 E.00151
G1 X102.701 Y131.489 E.12434
; LINE_WIDTH: 0.189293
G1 X102.704 Y131.33 E.00108
; LINE_WIDTH: 0.214065
G3 X102.738 Y130.98 I2.354 J.049 E.00277
; LINE_WIDTH: 0.253061
G3 X102.798 Y130.735 I3.738 J.784 E.00238
G1 X102.812 Y130.69 E.00044
; LINE_WIDTH: 0.297963
G3 X103.877 Y129.497 I1.931 J.651 E.01852
G1 X104.027 Y129.435 E.00182
; LINE_WIDTH: 0.251744
G3 X104.289 Y129.356 I.743 J1.983 E.00257
G1 X104.457 Y129.325 E.00161
; LINE_WIDTH: 0.188005
G3 X104.633 Y129.309 I.344 J2.788 E.0012
G1 X105.974 Y129.308 E.0091
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 75/95
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I-1.184 J-.283 P1  F42000
G1 X103.042 Y149.928 Z7.8
G1 Z7.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X103.031 Y149.887 E.00069
G3 X102.991 Y149.575 I1.877 J-.396 E.00512
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.922 J.016 E.04614
G1 X122.975 Y129.591 E.29594
G3 X124.809 Y131.425 I-.099 J1.933 E.04615
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.919 J-.01 E.04742
G1 X104.897 Y151.41 E.29354
G3 X103.138 Y150.23 I.011 J-1.919 E.03644
G1 X103.06 Y149.986 E.00417
; WIPE_START
G1 F3600
M204 S6000
G1 X103.031 Y149.887 E-.03903
G1 X102.991 Y149.575 E-.11968
G1 X102.991 Y147.993 E-.60129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.373 Z7.9 F42000
G1 X104.097 Y129.069 Z7.9
G1 Z7.5
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.512 Y129.012 E.0068
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.195 J2.203 E.05298
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.798 I.092 J-2.194 E.05446
G1 X102.412 Y131.112 E.30342
G3 X104.039 Y129.085 I2.198 J.098 E.04516
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.1818
G1 X106.034 Y129.012 E-.5782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 75 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer75 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.301 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188162
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11512
G1 X123.248 Y129.315 E.00181
; LINE_WIDTH: 0.240893
G3 X123.415 Y129.336 I-.53 J4.733 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.297377
G3 X124.969 Y130.636 I-.612 J1.934 E.02081
; LINE_WIDTH: 0.251382
G3 X125.022 Y130.801 I-2.172 J.787 E.00163
G1 X125.074 Y131.052 E.0024
; LINE_WIDTH: 0.188237
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243648
G3 X125.025 Y150.186 I-1.977 J-.201 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.297929
G3 X124.082 Y151.42 I-1.924 J-.639 E.01656
G1 X123.774 Y151.566 E.00384
; LINE_WIDTH: 0.25229
G3 X123.353 Y151.673 I-.712 J-1.906 E.00409
; LINE_WIDTH: 0.188247
G1 X122.983 Y151.699 E.00252
G1 X104.895 Y151.699 E.12292
G1 X104.526 Y151.683 E.0025
; LINE_WIDTH: 0.243635
G3 X104.317 Y151.649 I.278 J-2.432 E.00192
G1 X104.095 Y151.59 E.00208
; LINE_WIDTH: 0.298169
G3 X102.837 Y150.38 I.638 J-1.923 E.02035
; LINE_WIDTH: 0.253139
G3 X102.728 Y149.957 I1.937 J-.723 E.00413
; LINE_WIDTH: 0.188076
G3 X102.71 Y149.795 I3.391 J-.451 E.00111
G1 X102.701 Y131.489 E.12427
; LINE_WIDTH: 0.20232
G3 X102.721 Y131.091 I5.604 J.08 E.00293
G1 X102.725 Y131.057 E.00025
; LINE_WIDTH: 0.251701
G3 X102.799 Y130.729 I1.948 J.266 E.00316
G1 X102.835 Y130.627 E.00102
; LINE_WIDTH: 0.300612
G3 X103.936 Y129.471 I1.9 J.708 E.01866
; LINE_WIDTH: 0.259415
G3 X104.288 Y129.356 I.881 J2.107 E.00359
G1 X104.398 Y129.335 E.00108
; LINE_WIDTH: 0.188162
G3 X104.521 Y129.318 I.347 J1.996 E.00085
G1 X104.892 Y129.301 E.00252
G1 X105.974 Y129.301 E.00735
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 76/95
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.9 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z7.9
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.915 J.008 E.0474
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.504 E.29357
G3 X122.976 Y151.409 I-1.933 J-.026 E.04728
G1 X104.896 Y151.41 E.29358
G3 X103.055 Y149.992 I.008 J-1.914 E.04054
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16045
G1 X102.991 Y147.997 E-.59955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8 F42000
G1 X104.097 Y129.069 Z8
G1 Z7.6
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.512 Y129.012 E.0068
G1 X123.374 Y129.017 E.30628
G3 X125.39 Y131.204 I-.195 J2.203 E.05298
G1 X125.388 Y149.886 E.30336
M73 P88 R3
G3 X123.198 Y151.99 I-2.192 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.088 J-2.19 E.05452
G1 X102.412 Y131.114 E.30336
G3 X104.04 Y129.086 I2.207 J.104 E.04515
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18153
G1 X106.034 Y129.012 E-.57847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 76 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer76 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.308 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188838
G1 F2547
M204 S6000
G1 X122.983 Y129.301 E.11558
G1 X123.352 Y129.327 E.00252
; LINE_WIDTH: 0.251055
G3 X123.749 Y129.426 I-.356 J2.284 E.00383
; LINE_WIDTH: 0.300489
G3 X124.901 Y130.473 I-.689 J1.914 E.01815
G1 X124.905 Y130.483 E.00012
; LINE_WIDTH: 0.263502
G3 X125.061 Y130.977 I-2.012 J.907 E.00513
; LINE_WIDTH: 0.18871
G3 X125.085 Y131.146 I-2.574 J.439 E.00116
G1 X125.099 Y131.417 E.00185
G1 X125.099 Y149.508 E.12328
G3 X125.063 Y150.019 I-3.438 J.012 E.00349
; LINE_WIDTH: 0.252453
G3 X125.025 Y150.186 I-2.076 J-.376 E.00161
G1 X124.988 Y150.31 E.00122
; LINE_WIDTH: 0.298353
G3 X123.928 Y151.501 I-1.946 J-.664 E.01848
G1 X123.787 Y151.56 E.00172
; LINE_WIDTH: 0.256499
G3 X123.424 Y151.662 I-.755 J-1.996 E.00362
G1 X123.42 Y151.663 E.00004
; LINE_WIDTH: 0.188528
G3 X123.195 Y151.69 I-.864 J-6.204 E.00154
G1 X104.892 Y151.699 E.12459
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.247248
G3 X104.303 Y151.647 I.435 J-2.927 E.00151
G1 X104.095 Y151.59 E.00199
; LINE_WIDTH: 0.299524
G3 X102.899 Y150.528 I.655 J-1.942 E.01862
G1 X102.887 Y150.5 E.00034
; LINE_WIDTH: 0.262114
G3 X102.738 Y150.023 I2.156 J-.934 E.00491
G1 X102.736 Y150.015 E.00008
; LINE_WIDTH: 0.188211
G3 X102.715 Y149.854 I2.911 J-.462 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.19654
G1 X102.715 Y131.149 E.00243
; LINE_WIDTH: 0.24136
G3 X102.797 Y130.735 I2.018 J.189 E.00378
G1 X102.801 Y130.724 E.0001
; LINE_WIDTH: 0.296358
G3 X104.102 Y129.409 I1.94 J.617 E.02152
; LINE_WIDTH: 0.247541
G3 X104.289 Y129.356 I.736 J2.264 E.00179
G1 X104.457 Y129.325 E.00157
; LINE_WIDTH: 0.188838
G3 X104.637 Y129.309 I.35 J2.84 E.00123
G1 X105.974 Y129.308 E.00912
; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 77/95
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X102.991 Y149.575 E.00588
G1 X102.99 Y131.496 E.29357
G3 X104.814 Y129.592 I1.911 J.005 E.04725
G1 X122.975 Y129.591 E.2949
G3 X124.809 Y131.425 I-.076 J1.91 E.04627
G1 X124.81 Y149.506 E.2936
G3 X122.975 Y151.409 I-1.911 J-.007 E.0474
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.993 I.005 J-1.911 E.04055
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16039
G1 X102.991 Y147.997 E-.59961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.438 Y140.378 Z8.1 F42000
G1 X104.1 Y129.074 Z8.1
G1 Z7.7
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.171 Y129.054 E.0012
G3 X104.514 Y129.012 I.439 J2.156 E.00562
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.195 J2.203 E.05298
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.189 J-.087 E.05449
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.091 J-2.194 E.05449
G1 X102.412 Y131.114 E.30335
G3 X103.765 Y129.179 I2.198 J.096 E.04048
G1 X104.043 Y129.092 E.00473
; WIPE_START
G1 F3600
M204 S6000
G1 X104.171 Y129.054 E-.05076
G1 X104.514 Y129.012 E-.13148
G1 X106.035 Y129.012 E-.57776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 77 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer77 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.308 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.189207
G1 F2547
M204 S6000
G1 X122.983 Y129.301 E.11583
G1 X123.261 Y129.316 E.0019
; LINE_WIDTH: 0.241659
G3 X123.415 Y129.336 I-.267 J2.624 E.00139
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.29801
G3 X124.882 Y130.433 I-.613 J1.935 E.01837
G1 X124.938 Y130.558 E.00155
; LINE_WIDTH: 0.259422
G3 X125.062 Y130.981 I-2.019 J.822 E.00427
; LINE_WIDTH: 0.188433
G3 X125.09 Y131.21 I-3.008 J.486 E.00158
G1 X125.099 Y149.512 E.12451
G1 X125.083 Y149.874 E.00247
; LINE_WIDTH: 0.240242
G1 X125.009 Y150.243 E.00335
; LINE_WIDTH: 0.296591
G3 X123.779 Y151.564 I-1.941 J-.574 E.02097
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.250353
G3 X123.44 Y151.659 I-.744 J-2.067 E.00313
G1 X123.332 Y151.676 E.00102
; LINE_WIDTH: 0.188211
G3 X123.195 Y151.69 I-.297 J-2.204 E.00094
G1 X104.892 Y151.699 E.12435
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.243591
G3 X104.214 Y151.625 I.194 J-1.93 E.00288
G1 X104.096 Y151.59 E.00112
; LINE_WIDTH: 0.29956
G3 X102.899 Y150.526 I.638 J-1.923 E.01866
G1 X102.894 Y150.516 E.00012
; LINE_WIDTH: 0.263344
G3 X102.738 Y150.019 I2.003 J-.904 E.00515
; LINE_WIDTH: 0.188235
G3 X102.71 Y149.79 I3.001 J-.485 E.00157
G1 X102.701 Y131.489 E.12436
; LINE_WIDTH: 0.198428
G1 X102.718 Y131.126 E.00262
; LINE_WIDTH: 0.241911
G3 X102.799 Y130.729 I2.139 J.234 E.00365
; LINE_WIDTH: 0.299062
G3 X103.874 Y129.498 I1.936 J.606 E.01902
; LINE_WIDTH: 0.264588
G3 X104.205 Y129.377 I.933 J2.025 E.00349
G1 X104.366 Y129.34 E.00164
; LINE_WIDTH: 0.189207
G3 X104.637 Y129.309 I.404 J2.287 E.00187
G1 X105.975 Y129.308 E.00915
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.975 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 78/95
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.1 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.1
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X102.991 Y149.576 E.00588
G1 X102.99 Y131.496 E.29358
G3 X104.75 Y129.596 I1.928 J.021 E.04611
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.424 I-.099 J1.933 E.04614
G1 X124.81 Y149.504 E.29358
G3 X122.975 Y151.409 I-1.934 J-.027 E.04729
G1 X104.897 Y151.41 E.29355
G3 X103.055 Y149.992 I.006 J-1.914 E.04057
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.576 E-.16011
G1 X102.991 Y147.997 E-.59989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.377 Z8.2 F42000
G1 X104.098 Y129.069 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.515 Y129.012 E.00683
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.189 J-.087 E.05449
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.796 I.092 J-2.194 E.05449
G1 X102.412 Y131.114 E.30335
G3 X104.04 Y129.085 I2.198 J.096 E.0452
; WIPE_START
M73 P89 R3
G1 F3600
M204 S6000
G1 X104.515 Y129.012 E-.18242
G1 X106.034 Y129.012 E-.57758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 78 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer78 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.301 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188254
G1 F2547
M204 S6000
G1 X122.983 Y129.301 E.11518
G1 X123.26 Y129.316 E.00189
; LINE_WIDTH: 0.241615
G3 X123.415 Y129.336 I-.267 J2.636 E.0014
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.298227
G3 X124.902 Y130.474 I-.611 J1.933 E.0189
G1 X124.936 Y130.553 E.00097
; LINE_WIDTH: 0.259682
G3 X125.062 Y130.98 I-2.023 J.828 E.00433
; LINE_WIDTH: 0.188516
G3 X125.09 Y131.21 I-3.02 J.487 E.00158
G1 X125.099 Y149.508 E.12454
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.247487
G3 X125.024 Y150.189 I-1.8 J-.222 E.00243
G1 X124.987 Y150.309 E.00116
; LINE_WIDTH: 0.298907
G3 X123.926 Y151.501 I-1.928 J-.648 E.01854
G1 X123.837 Y151.54 E.0011
; LINE_WIDTH: 0.258769
G3 X123.426 Y151.661 I-.882 J-2.239 E.00415
G1 X123.407 Y151.665 E.00018
; LINE_WIDTH: 0.188483
G3 X123.195 Y151.69 I-.765 J-5.566 E.00146
G1 X104.895 Y151.699 E.12453
G3 X104.471 Y151.676 I.016 J-4.205 E.00289
; LINE_WIDTH: 0.247061
G3 X104.304 Y151.647 I.431 J-2.941 E.00156
G1 X104.096 Y151.589 E.00198
; LINE_WIDTH: 0.29789
G3 X102.898 Y150.526 I.635 J-1.921 E.01854
G1 X102.834 Y150.374 E.00185
; LINE_WIDTH: 0.256151
G3 X102.738 Y150.02 I1.9 J-.708 E.00352
; LINE_WIDTH: 0.188235
G3 X102.71 Y149.79 I3.02 J-.487 E.00157
G1 X102.701 Y131.489 E.12436
; LINE_WIDTH: 0.198427
G1 X102.718 Y131.126 E.00262
; LINE_WIDTH: 0.242426
G3 X102.799 Y130.729 I2.138 J.234 E.00366
G1 X102.802 Y130.719 E.00009
; LINE_WIDTH: 0.299368
G3 X103.874 Y129.499 I1.94 J.623 E.01892
; LINE_WIDTH: 0.263852
G3 X104.205 Y129.377 I.853 J1.803 E.00349
G1 X104.377 Y129.338 E.00174
; LINE_WIDTH: 0.188254
G3 X104.55 Y129.315 I.366 J2.04 E.00119
G1 X104.892 Y129.301 E.00233
G1 X105.974 Y129.301 E.00736
; CHANGE_LAYER
; Z_HEIGHT: 7.9
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.974 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 79/95
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.2
G1 Z7.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.738 Y129.597 I1.915 J.008 E.04599
G1 X122.973 Y129.591 E.2961
G3 X124.809 Y131.425 I-.089 J1.924 E.04623
G1 X124.81 Y149.506 E.2936
G3 X122.975 Y151.409 I-1.914 J-.01 E.04738
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.012 J-1.919 E.04051
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16042
G1 X102.991 Y147.997 E-.59958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8.3 F42000
G1 X104.098 Y129.069 Z8.3
G1 Z7.9
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.515 Y129.012 E.00683
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30336
G3 X102.41 Y149.798 I.092 J-2.194 E.05446
G1 X102.412 Y131.114 E.30339
G3 X104.04 Y129.085 I2.198 J.096 E.0452
; WIPE_START
G1 F3600
M204 S6000
G1 X104.515 Y129.012 E-.18246
G1 X106.034 Y129.012 E-.57754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 79 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer79 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.034 Y129.305 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188435
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11528
G1 X123.352 Y129.327 E.00254
; LINE_WIDTH: 0.251066
G3 X123.75 Y129.426 I-.357 J2.284 E.00383
; LINE_WIDTH: 0.300154
G3 X124.902 Y130.474 I-.698 J1.924 E.01815
G1 X124.906 Y130.484 E.00012
; LINE_WIDTH: 0.263639
M73 P89 R2
G3 X125.061 Y130.973 I-2.096 J.93 E.00507
; LINE_WIDTH: 0.188437
G1 X125.099 Y131.417 E.00303
G1 X125.099 Y149.512 E.1231
G1 X125.083 Y149.874 E.00246
; LINE_WIDTH: 0.243934
G3 X125.025 Y150.186 I-1.871 J-.181 E.00288
G1 X124.988 Y150.31 E.00117
; LINE_WIDTH: 0.299744
G3 X123.926 Y151.501 I-1.926 J-.647 E.0186
; LINE_WIDTH: 0.263747
G3 X123.595 Y151.623 I-.857 J-1.815 E.00349
G1 X123.421 Y151.662 E.00176
; LINE_WIDTH: 0.188508
G1 X122.983 Y151.699 E.00299
G1 X104.892 Y151.699 E.12313
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.246988
G3 X104.214 Y151.625 I.222 J-1.797 E.00239
G1 X104.095 Y151.59 E.00114
; LINE_WIDTH: 0.299409
G3 X102.898 Y150.526 I.647 J-1.934 E.01864
G1 X102.894 Y150.517 E.00012
; LINE_WIDTH: 0.263048
G3 X102.738 Y150.026 I2.06 J-.922 E.00508
G1 X102.737 Y150.02 E.00006
; LINE_WIDTH: 0.188238
G3 X102.71 Y149.795 I6.212 J-.864 E.00154
G1 X102.701 Y131.489 E.12439
; LINE_WIDTH: 0.198434
G1 X102.718 Y131.126 E.00261
; LINE_WIDTH: 0.243699
G3 X102.753 Y130.905 I2.595 J.303 E.00203
G1 X102.81 Y130.695 E.00196
; LINE_WIDTH: 0.298831
G3 X103.874 Y129.498 I1.927 J.641 E.0186
G1 X103.96 Y129.461 E.00106
; LINE_WIDTH: 0.259622
G3 X104.205 Y129.377 I.76 J1.814 E.00252
G1 X104.379 Y129.338 E.00173
; LINE_WIDTH: 0.188435
G3 X104.707 Y129.305 I.415 J2.484 E.00225
G1 X105.975 Y129.305 E.00862
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F15000
G1 X107.975 Y129.304 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 80/95
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.3 I-1.184 J-.283 P1  F42000
G1 X103.042 Y149.928 Z8.3
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X103.031 Y149.883 E.00074
G3 X102.991 Y149.575 I1.884 J-.398 E.00505
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.914 J.008 E.04618
G1 X122.973 Y129.591 E.29591
G3 X124.809 Y131.425 I-.082 J1.918 E.04626
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.139 Y150.229 I.019 J-1.925 E.03639
G1 X103.061 Y149.985 E.00417
; WIPE_START
G1 F3600
M204 S6000
G1 X103.031 Y149.883 E-.04021
G1 X102.991 Y149.575 E-.1181
G1 X102.991 Y147.992 E-.60169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.372 Z8.4 F42000
G1 X104.098 Y129.07 Z8.4
G1 Z8
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.514 Y129.012 E.00682
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.114 E.30339
G3 X104.04 Y129.085 I2.198 J.096 E.04521
; WIPE_START
G1 F3600
M204 S6000
M73 P90 R2
G1 X104.514 Y129.012 E-.18227
G1 X106.035 Y129.012 E-.57773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 80 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer80 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.301 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188429
G1 F2547
M204 S6000
G1 X122.979 Y129.301 E.11527
G3 X123.242 Y129.314 I-.061 J3.8 E.00179
G1 X123.352 Y129.327 E.00075
; LINE_WIDTH: 0.251067
G3 X123.75 Y129.426 I-.356 J2.282 E.00384
; LINE_WIDTH: 0.298263
G3 X124.969 Y130.638 I-.689 J1.913 E.02002
; LINE_WIDTH: 0.251303
G3 X125.059 Y130.963 I-1.835 J.679 E.00316
G1 X125.074 Y131.052 E.00085
; LINE_WIDTH: 0.188337
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12301
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.24727
G3 X125.025 Y150.186 I-1.794 J-.221 E.00239
G1 X124.988 Y150.31 E.00119
; LINE_WIDTH: 0.29769
G3 X123.774 Y151.566 I-1.929 J-.65 E.02032
G1 X123.763 Y151.57 E.00013
; LINE_WIDTH: 0.250244
G3 X123.427 Y151.661 I-.842 J-2.437 E.00324
G1 X123.331 Y151.676 E.00091
; LINE_WIDTH: 0.188207
G3 X123.194 Y151.69 I-.305 J-2.308 E.00093
G1 X104.892 Y151.699 E.12434
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.242035
G3 X104.313 Y151.649 I.315 J-2.625 E.00194
G1 X104.124 Y151.599 E.00176
; LINE_WIDTH: 0.297265
G3 X102.898 Y150.526 I.62 J-1.945 E.01883
G1 X102.835 Y150.374 E.00185
; LINE_WIDTH: 0.252758
G3 X102.727 Y149.953 I1.912 J-.711 E.00411
; LINE_WIDTH: 0.188066
G3 X102.71 Y149.795 I3.188 J-.423 E.00108
G1 X102.701 Y131.489 E.12426
; LINE_WIDTH: 0.198439
G1 X102.718 Y131.126 E.00261
; LINE_WIDTH: 0.243991
G3 X102.753 Y130.905 I2.563 J.298 E.00204
G1 X102.812 Y130.69 E.00202
; LINE_WIDTH: 0.299269
G3 X103.94 Y129.469 I1.93 J.652 E.01938
; LINE_WIDTH: 0.26037
G3 X104.287 Y129.357 I.777 J1.805 E.00356
G1 X104.382 Y129.337 E.00095
; LINE_WIDTH: 0.188429
G1 X104.892 Y129.301 E.00347
G1 X105.975 Y129.301 E.00737
; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.975 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 81/95
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.4
G1 Z8.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.92 J.013 E.04619
G1 X122.973 Y129.591 E.29586
G3 X124.809 Y131.425 I-.083 J1.919 E.04626
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.92 J-.011 E.0474
G1 X104.896 Y151.41 E.29357
G3 X103.056 Y149.992 I.012 J-1.919 E.04051
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16037
G1 X102.991 Y147.997 E-.59963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8.5 F42000
G1 X104.098 Y129.069 Z8.5
G1 Z8.1
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00682
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.195 J2.202 E.05298
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.798 I.091 J-2.194 E.05446
G1 X102.412 Y131.114 E.30339
G3 X104.041 Y129.086 I2.206 J.103 E.04517
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.1821
G1 X106.035 Y129.012 E-.5779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 81 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer81 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.308 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188242
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11514
G3 X123.242 Y129.314 I-.06 J3.793 E.00179
G1 X123.352 Y129.327 E.00075
; LINE_WIDTH: 0.25106
G3 X123.749 Y129.426 I-.357 J2.285 E.00383
; LINE_WIDTH: 0.300217
G3 X124.902 Y130.474 I-.691 J1.916 E.01816
G1 X124.906 Y130.484 E.00012
; LINE_WIDTH: 0.263645
G3 X125.061 Y130.973 I-2.04 J.912 E.00507
; LINE_WIDTH: 0.18838
G1 X125.099 Y131.416 E.00303
G1 X125.099 Y149.506 E.12303
G1 X125.085 Y149.848 E.00233
; LINE_WIDTH: 0.240502
G3 X125.026 Y150.182 I-1.927 J-.168 E.00303
G1 X124.999 Y150.276 E.00088
; LINE_WIDTH: 0.298506
G3 X123.857 Y151.532 I-1.935 J-.612 E.01976
; LINE_WIDTH: 0.260092
G3 X123.595 Y151.623 I-.777 J-1.805 E.0027
G1 X123.42 Y151.663 E.00174
; LINE_WIDTH: 0.188515
G3 X123.193 Y151.69 I-.426 J-2.576 E.00155
G1 X104.892 Y151.699 E.12457
G1 X104.465 Y151.675 E.00291
; LINE_WIDTH: 0.247531
G3 X104.303 Y151.647 I.435 J-2.927 E.00151
G1 X104.09 Y151.588 E.00204
; LINE_WIDTH: 0.299523
G3 X102.981 Y150.683 I.653 J-1.932 E.01657
G1 X102.894 Y150.516 E.00214
; LINE_WIDTH: 0.263054
G3 X102.738 Y150.026 I2.057 J-.921 E.00508
G1 X102.737 Y150.02 E.00006
; LINE_WIDTH: 0.188238
G3 X102.71 Y149.795 I6.211 J-.863 E.00154
G1 X102.701 Y131.489 E.1244
; LINE_WIDTH: 0.205948
G3 X102.737 Y130.985 I3.455 J-.008 E.0038
; LINE_WIDTH: 0.253911
G3 X102.823 Y130.659 I2.313 J.439 E.00319
; LINE_WIDTH: 0.298155
G3 X103.943 Y129.468 I1.908 J.672 E.01898
G1 X104.042 Y129.429 E.0012
; LINE_WIDTH: 0.25
G3 X104.373 Y129.339 I.746 J2.089 E.00319
G1 X104.469 Y129.324 E.00091
; LINE_WIDTH: 0.188242
G3 X104.633 Y129.309 I.307 J2.406 E.00112
G1 X105.975 Y129.308 E.00912
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.975 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 82/95
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.5 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.5
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.818 Y129.592 I1.925 J.018 E.04722
G1 X122.973 Y129.591 E.29481
G3 X124.809 Y131.425 I-.089 J1.924 E.04622
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.913 J-.007 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.992 I.007 J-1.914 E.04054
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16038
G1 X102.991 Y147.997 E-.59962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8.6 F42000
G1 X104.098 Y129.069 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00682
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.206 J-.104 E.05439
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.798 I.087 J-2.189 E.05449
G1 X102.412 Y131.114 E.30339
G3 X104.04 Y129.085 I2.198 J.095 E.04521
; WIPE_START
G1 F3600
M204 S6000
M73 P91 R2
G1 X104.514 Y129.012 E-.18222
G1 X106.035 Y129.012 E-.57778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 82 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer82 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.308 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.189111
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11574
G3 X123.242 Y129.314 I-.061 J3.779 E.0018
; LINE_WIDTH: 0.239697
G3 X123.638 Y129.389 I-.161 J1.93 E.00359
G1 X123.662 Y129.397 E.00022
; LINE_WIDTH: 0.298495
G3 X124.901 Y130.474 I-.61 J1.953 E.01907
; LINE_WIDTH: 0.264101
G3 X125.061 Y130.973 I-1.811 J.853 E.00519
; LINE_WIDTH: 0.188422
G1 X125.099 Y131.416 E.00303
G1 X125.099 Y149.508 E.12307
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.241796
G1 X124.999 Y150.276 E.00369
; LINE_WIDTH: 0.297209
G3 X123.926 Y151.502 I-1.943 J-.619 E.01883
G1 X123.774 Y151.566 E.00185
; LINE_WIDTH: 0.251318
G3 X123.338 Y151.675 I-.749 J-2.066 E.00422
; LINE_WIDTH: 0.188221
G3 X123.194 Y151.69 I-.352 J-2.694 E.00098
G1 X104.892 Y151.699 E.12435
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.24218
G3 X104.312 Y151.648 I.307 J-2.587 E.00195
G1 X104.117 Y151.597 E.00181
; LINE_WIDTH: 0.297307
G3 X102.981 Y150.682 I.618 J-1.932 E.01677
G1 X102.83 Y150.363 E.00397
; LINE_WIDTH: 0.250256
G3 X102.777 Y150.195 I5.96 J-1.993 E.00164
G1 X102.724 Y149.931 E.00251
; LINE_WIDTH: 0.188021
G3 X102.71 Y149.795 I2.201 J-.296 E.00093
G1 X102.701 Y131.489 E.12423
; LINE_WIDTH: 0.197722
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.242353
G3 X102.799 Y130.729 I2.158 J.239 E.00365
G1 X102.802 Y130.72 E.00009
; LINE_WIDTH: 0.299075
G3 X103.874 Y129.498 I1.938 J.619 E.01891
; LINE_WIDTH: 0.263958
G3 X104.373 Y129.339 I.924 J2.033 E.00519
; LINE_WIDTH: 0.189111
G3 X104.637 Y129.309 I.46 J2.873 E.00182
G1 X105.975 Y129.308 E.00914
; CHANGE_LAYER
; Z_HEIGHT: 8.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.975 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 83/95
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I-1.184 J-.283 P1  F42000
G1 X103.043 Y149.928 Z8.6
G1 Z8.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X103.028 Y149.879 E.00082
G3 X102.991 Y149.575 I1.875 J-.383 E.00498
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.973 Y129.591 E.29469
G3 X124.809 Y131.425 I-.089 J1.924 E.04622
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.007 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.136 Y150.231 I.008 J-1.914 E.03645
G1 X103.061 Y149.985 E.00417
; WIPE_START
G1 F3600
M204 S6000
G1 X103.028 Y149.879 E-.04206
G1 X102.991 Y149.575 E-.11648
G1 X102.991 Y147.992 E-.60146
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.373 Z8.7 F42000
G1 X104.098 Y129.069 Z8.7
G1 Z8.3
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.514 Y129.012 E.00682
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.114 E.30335
G3 X104.04 Y129.084 I2.192 J.09 E.04525
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18223
G1 X106.035 Y129.012 E-.57777
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 83 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer83 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.308 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188911
G1 F2547
M204 S6000
G1 X122.979 Y129.301 E.1156
G1 X123.242 Y129.314 E.0018
; LINE_WIDTH: 0.239844
G3 X123.411 Y129.336 I-.288 J2.924 E.00151
G1 X123.663 Y129.397 E.00231
; LINE_WIDTH: 0.298348
G3 X124.898 Y130.467 I-.609 J1.95 E.01897
G1 X124.912 Y130.496 E.00036
; LINE_WIDTH: 0.263157
G3 X125.059 Y130.965 I-1.964 J.874 E.00485
G1 X125.06 Y130.971 E.00006
; LINE_WIDTH: 0.188526
G1 X125.099 Y131.417 E.00304
G1 X125.099 Y149.508 E.12315
G1 X125.076 Y149.932 E.00289
; LINE_WIDTH: 0.247036
G3 X125.025 Y150.186 I-1.872 J-.238 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.29946
G3 X124.304 Y151.271 I-1.936 J-.648 E.01362
G1 X124.155 Y151.376 E.00206
G1 X123.923 Y151.502 E.00299
; LINE_WIDTH: 0.263445
G3 X123.594 Y151.624 I-.856 J-1.818 E.00346
G1 X123.416 Y151.663 E.0018
; LINE_WIDTH: 0.188396
G1 X122.983 Y151.699 E.00295
G1 X104.892 Y151.699 E.12305
G1 X104.526 Y151.683 E.00249
; LINE_WIDTH: 0.243994
G3 X104.214 Y151.625 I.187 J-1.901 E.00288
G1 X104.095 Y151.59 E.00113
; LINE_WIDTH: 0.297861
G3 X102.836 Y150.378 I.643 J-1.929 E.02034
; LINE_WIDTH: 0.252532
G3 X102.778 Y150.199 I4.047 J-1.399 E.00178
G1 X102.727 Y149.953 E.00236
; LINE_WIDTH: 0.188062
G1 X102.701 Y149.583 E.00252
G1 X102.701 Y131.489 E.12283
; LINE_WIDTH: 0.197752
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.243587
G1 X102.81 Y130.695 E.00399
; LINE_WIDTH: 0.299612
G3 X103.868 Y129.502 I1.927 J.642 E.01857
; LINE_WIDTH: 0.264498
G3 X104.205 Y129.377 I.86 J1.8 E.00357
G1 X104.371 Y129.339 E.00169
; LINE_WIDTH: 0.188911
G3 X104.637 Y129.309 I.467 J2.897 E.00183
G1 X105.975 Y129.308 E.00913
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.975 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 84/95
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.7 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.935 Z8.7
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.926 J.019 E.04613
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.091 J1.924 E.0462
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.008 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.993 I.007 J-1.914 E.04053
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16062
G1 X102.991 Y147.998 E-.59938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8.8 F42000
G1 X104.099 Y129.069 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00681
G1 X123.374 Y129.017 E.30625
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.091 J-2.193 E.0545
G1 X102.412 Y131.114 E.30335
G3 X104.041 Y129.085 I2.198 J.096 E.04522
; WIPE_START
M73 P92 R2
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18206
G1 X106.035 Y129.012 E-.57794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 84 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer84 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.301 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188285
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.1152
G1 X123.248 Y129.315 E.00181
; LINE_WIDTH: 0.240891
G3 X123.415 Y129.336 I-.525 J4.714 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.297089
G3 X124.969 Y130.637 I-.608 J1.93 E.0208
; LINE_WIDTH: 0.251333
G3 X125.022 Y130.801 I-2.164 J.784 E.00162
G1 X125.074 Y131.052 E.0024
; LINE_WIDTH: 0.188338
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.508 E.12301
G1 X125.076 Y149.931 E.00288
; LINE_WIDTH: 0.247014
G3 X125.025 Y150.186 I-1.86 J-.235 E.00239
G1 X124.99 Y150.305 E.00114
; LINE_WIDTH: 0.297651
G3 X123.763 Y151.57 I-1.922 J-.637 E.02052
; LINE_WIDTH: 0.2502
G3 X123.427 Y151.661 I-.748 J-2.074 E.00324
G1 X123.331 Y151.676 E.00091
; LINE_WIDTH: 0.188308
G3 X123.194 Y151.69 I-.305 J-2.297 E.00094
G1 X104.892 Y151.699 E.12442
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.246981
G3 X104.214 Y151.625 I.222 J-1.795 E.00239
G1 X104.095 Y151.59 E.00114
; LINE_WIDTH: 0.299448
G3 X103.032 Y150.767 I.647 J-1.935 E.01551
G1 X102.897 Y150.522 E.00317
; LINE_WIDTH: 0.264098
G3 X102.739 Y150.027 I1.992 J-.907 E.00515
; LINE_WIDTH: 0.188239
G1 X102.701 Y149.584 E.00302
G1 X102.701 Y131.489 E.12296
; LINE_WIDTH: 0.205703
G3 X102.736 Y130.989 I3.452 J-.008 E.00376
; LINE_WIDTH: 0.251405
G1 X102.81 Y130.695 E.00284
; LINE_WIDTH: 0.29956
G3 X103.874 Y129.499 I1.926 J.641 E.01864
; LINE_WIDTH: 0.263313
G3 X104.287 Y129.357 I.838 J1.763 E.00431
G1 X104.383 Y129.337 E.00097
; LINE_WIDTH: 0.188285
G3 X104.55 Y129.315 I.365 J2.1 E.00115
G1 X104.892 Y129.301 E.00232
G1 X105.975 Y129.301 E.00736
; CHANGE_LAYER
; Z_HEIGHT: 8.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.975 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 85/95
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.8 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.8
G1 Z8.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.752 Y129.596 I1.926 J.019 E.04615
G1 X122.975 Y129.591 E.2959
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.005 E.04744
G1 X104.898 Y151.41 E.29355
G3 X103.055 Y149.992 I.006 J-1.914 E.04057
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16036
G1 X102.991 Y147.997 E-.59964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z8.9 F42000
G1 X104.099 Y129.069 Z8.9
G1 Z8.5
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00681
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.09 E.05448
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.114 E.30335
G3 X104.041 Y129.085 I2.198 J.096 E.04522
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18202
G1 X106.035 Y129.012 E-.57798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 85 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.9 F4000
            G39.3 S1
            G0 Z8.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer85 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.035 Y129.309 F42000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188307
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11521
G1 X123.254 Y129.315 E.00185
; LINE_WIDTH: 0.241565
G3 X123.415 Y129.336 I-.278 J2.759 E.00145
G1 X123.682 Y129.403 E.00247
; LINE_WIDTH: 0.298937
G3 X124.902 Y130.474 I-.62 J1.936 E.01888
; LINE_WIDTH: 0.264086
G3 X125.061 Y130.973 I-1.817 J.854 E.00519
; LINE_WIDTH: 0.188421
G1 X125.099 Y131.416 E.00303
G1 X125.099 Y149.506 E.12306
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243627
G3 X125.025 Y150.186 I-1.881 J-.183 E.00288
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.297633
G3 X123.779 Y151.564 I-1.923 J-.638 E.02032
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.250257
G3 X123.427 Y151.661 I-.753 J-2.097 E.00324
G1 X123.331 Y151.676 E.00091
; LINE_WIDTH: 0.188207
G3 X123.194 Y151.69 I-.302 J-2.267 E.00093
G1 X104.895 Y151.699 E.12432
G1 X104.526 Y151.683 E.00251
; LINE_WIDTH: 0.24183
G3 X104.218 Y151.626 I.184 J-1.882 E.00282
G1 X104.124 Y151.599 E.00088
; LINE_WIDTH: 0.29894
G3 X102.899 Y150.525 I.625 J-1.949 E.01894
; LINE_WIDTH: 0.264176
G3 X102.739 Y150.027 I1.931 J-.891 E.00519
; LINE_WIDTH: 0.188239
G1 X102.701 Y149.584 E.00302
G1 X102.701 Y131.489 E.12296
; LINE_WIDTH: 0.19775
G1 X102.717 Y131.126 E.0026
; LINE_WIDTH: 0.24222
G3 X102.799 Y130.729 I2.12 J.232 E.00365
G1 X102.802 Y130.72 E.00009
; LINE_WIDTH: 0.299004
G3 X103.875 Y129.499 I1.935 J.617 E.01891
; LINE_WIDTH: 0.263676
G3 X104.205 Y129.377 I.849 J1.79 E.00348
G1 X104.379 Y129.338 E.00176
; LINE_WIDTH: 0.188307
G3 X104.627 Y129.309 I.39 J2.307 E.0017
G1 X105.975 Y129.309 E.00917
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.975 Y129.308 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 86/95
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.9 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.934 Z8.9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.975 Y129.591 E.29472
G3 X124.809 Y131.425 I-.091 J1.924 E.04619
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.005 E.04744
G1 X104.898 Y151.41 E.29354
G3 X103.055 Y149.993 I.005 J-1.914 E.04057
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16039
G1 X102.991 Y147.997 E-.59961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z9 F42000
G1 X104.099 Y129.069 Z9
G1 Z8.6
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00681
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.189 J-.087 E.0545
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05453
G1 X102.412 Y131.114 E.30335
G3 X104.041 Y129.085 I2.198 J.096 E.04522
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18199
G1 X106.035 Y129.012 E-.57801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 86 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
M73 P93 R2
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer86 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.308 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188924
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11563
G1 X123.352 Y129.327 E.00253
; LINE_WIDTH: 0.251057
G3 X123.749 Y129.426 I-.358 J2.288 E.00383
; LINE_WIDTH: 0.300368
G3 X124.901 Y130.474 I-.683 J1.907 E.01817
; LINE_WIDTH: 0.263895
G3 X125.061 Y130.973 I-2.043 J.927 E.00518
; LINE_WIDTH: 0.188421
G1 X125.099 Y131.416 E.00303
G1 X125.099 Y149.506 E.12306
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.241813
M73 P93 R1
G3 X125.047 Y150.096 I-2.41 J-.275 E.00203
G1 X124.999 Y150.276 E.00167
; LINE_WIDTH: 0.297169
G3 X123.779 Y151.564 I-1.937 J-.613 E.02063
G1 X123.763 Y151.57 E.00019
; LINE_WIDTH: 0.250265
G3 X123.427 Y151.661 I-.754 J-2.101 E.00324
G1 X123.331 Y151.676 E.00091
; LINE_WIDTH: 0.188303
G3 X123.194 Y151.69 I-.299 J-2.237 E.00093
G1 X104.896 Y151.699 E.12439
G3 X104.472 Y151.676 I.017 J-4.24 E.00289
; LINE_WIDTH: 0.249892
G3 X104.17 Y151.613 I.31 J-2.234 E.00287
G1 X104.04 Y151.571 E.00127
; LINE_WIDTH: 0.300553
G3 X102.899 Y150.525 I.711 J-1.922 E.01805
; LINE_WIDTH: 0.26417
G3 X102.739 Y150.027 I1.93 J-.891 E.00519
; LINE_WIDTH: 0.188238
G1 X102.701 Y149.584 E.00302
G1 X102.701 Y131.489 E.12296
; LINE_WIDTH: 0.205706
G3 X102.736 Y130.989 I3.456 J-.008 E.00376
; LINE_WIDTH: 0.251389
G1 X102.81 Y130.695 E.00284
; LINE_WIDTH: 0.296371
G3 X104.116 Y129.404 I1.928 J.644 E.02135
; LINE_WIDTH: 0.24654
G3 X104.463 Y129.325 I.63 J1.979 E.00327
; LINE_WIDTH: 0.188924
G3 X104.637 Y129.309 I.315 J2.403 E.00119
G1 X105.976 Y129.308 E.00913
; CHANGE_LAYER
; Z_HEIGHT: 8.7
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.976 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 87/95
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.935 Z9
G1 Z8.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.0059
G1 X102.99 Y131.496 E.29357
G3 X104.821 Y129.592 I1.925 J.019 E.04728
G1 X122.975 Y129.591 E.29478
G3 X124.809 Y131.425 I-.084 J1.918 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.914 J-.005 E.04745
G1 X104.898 Y151.41 E.29354
G3 X103.055 Y149.993 I.006 J-1.914 E.04056
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16072
G1 X102.991 Y147.998 E-.59928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z9.1 F42000
G1 X104.099 Y129.069 Z9.1
G1 Z8.7
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.00681
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.197 Y151.99 I-2.189 J-.087 E.0545
G1 X104.512 Y151.988 E.30341
G3 X102.41 Y149.796 I.089 J-2.189 E.0545
G1 X102.412 Y131.112 E.30339
G3 X104.041 Y129.085 I2.198 J.098 E.04518
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18193
G1 X106.036 Y129.012 E-.57807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 87 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.1
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.1 F4000
            G39.3 S1
            G0 Z9.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer87 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.308 F42000
G1 Z8.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188857
G1 F2548
M204 S6000
G1 X122.983 Y129.301 E.11559
G1 X123.253 Y129.315 E.00184
; LINE_WIDTH: 0.241371
G3 X123.415 Y129.336 I-.495 J4.441 E.00147
G1 X123.68 Y129.403 E.00245
; LINE_WIDTH: 0.297125
G3 X124.969 Y130.637 I-.618 J1.935 E.02076
; LINE_WIDTH: 0.251303
G3 X125.022 Y130.802 I-2.197 J.793 E.00161
G1 X125.074 Y131.052 E.0024
; LINE_WIDTH: 0.188325
G1 X125.099 Y131.417 E.00249
G1 X125.099 Y149.504 E.12297
G3 X125.077 Y149.925 I-4.299 J-.019 E.00286
; LINE_WIDTH: 0.246934
G1 X124.988 Y150.31 E.00363
; LINE_WIDTH: 0.298862
G3 X123.849 Y151.535 I-1.924 J-.646 E.0195
; LINE_WIDTH: 0.25937
G3 X123.425 Y151.662 I-.849 J-2.073 E.0043
G1 X123.415 Y151.663 E.00009
; LINE_WIDTH: 0.188491
G1 X122.983 Y151.699 E.00295
G1 X104.895 Y151.699 E.1231
G3 X104.471 Y151.677 I.022 J-4.458 E.00289
; LINE_WIDTH: 0.249544
G3 X104.047 Y151.573 I.268 J-2.017 E.00407
; LINE_WIDTH: 0.300444
G3 X102.899 Y150.526 I.697 J-1.917 E.01812
; LINE_WIDTH: 0.263429
G3 X102.789 Y150.236 I2.07 J-.952 E.00306
G1 X102.737 Y150.016 E.00223
; LINE_WIDTH: 0.188213
G3 X102.716 Y149.858 I2.727 J-.437 E.00108
G1 X102.701 Y149.583 E.00187
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.201898
G1 X102.726 Y131.057 E.00318
; LINE_WIDTH: 0.250138
G3 X102.827 Y130.647 I1.998 J.275 E.00395
; LINE_WIDTH: 0.297422
G3 X103.871 Y129.5 I1.909 J.69 E.01789
G1 X104.096 Y129.41 E.00273
; LINE_WIDTH: 0.247757
G3 X104.463 Y129.325 I.714 J2.253 E.00348
; LINE_WIDTH: 0.188857
G3 X104.637 Y129.309 I.314 J2.392 E.00119
G1 X105.976 Y129.308 E.00913
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.976 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 88/95
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.1 I-1.184 J-.283 P1  F42000
G1 X103.043 Y149.927 Z9.1
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X103.027 Y149.873 E.00092
G3 X102.991 Y149.575 I1.876 J-.376 E.00488
G1 X102.99 Y131.496 E.29357
G3 X104.75 Y129.596 I1.926 J.019 E.04613
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.09 J1.924 E.0462
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.911 J-.005 E.04743
G1 X104.898 Y151.41 E.29354
G3 X103.136 Y150.231 I.006 J-1.914 E.03648
G1 X103.061 Y149.984 E.00418
; WIPE_START
G1 F3600
M204 S6000
G1 X103.027 Y149.873 E-.04428
G1 X102.991 Y149.575 E-.11397
G1 X102.991 Y147.991 E-.60175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.372 Z9.2 F42000
G1 X104.099 Y129.069 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.512 Y129.012 E.00677
G1 X123.374 Y129.017 E.30627
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.888 E.30339
G3 X123.197 Y151.99 I-2.189 J-.089 E.05446
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.112 E.30339
G3 X104.041 Y129.085 I2.198 J.098 E.04519
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18113
G1 X106.036 Y129.012 E-.57887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 88 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer88 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.301 F42000
M73 P94 R1
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188503
G1 F2547
M204 S6000
G1 X122.983 Y129.301 E.11534
G1 X123.352 Y129.327 E.00252
; LINE_WIDTH: 0.248695
G3 X123.586 Y129.375 I-.22 J1.68 E.00221
G1 X123.708 Y129.412 E.00118
; LINE_WIDTH: 0.299519
G3 X124.902 Y130.474 I-.645 J1.926 E.0186
; LINE_WIDTH: 0.263289
G3 X125.06 Y130.969 I-1.856 J.868 E.00514
G1 X125.063 Y130.985 E.00015
; LINE_WIDTH: 0.188403
G1 X125.099 Y131.417 E.00295
G1 X125.099 Y149.508 E.12305
G1 X125.082 Y149.879 E.00252
; LINE_WIDTH: 0.24254
G3 X125.002 Y150.266 I-2.319 J-.278 E.00357
G1 X124.999 Y150.275 E.00009
; LINE_WIDTH: 0.297133
G3 X124.085 Y151.418 I-1.933 J-.61 E.01681
G1 X123.763 Y151.57 E.004
; LINE_WIDTH: 0.25058
G3 X123.337 Y151.675 I-.719 J-1.992 E.0041
; LINE_WIDTH: 0.188218
G3 X123.194 Y151.69 I-.306 J-2.257 E.00097
G1 X104.895 Y151.699 E.12433
G1 X104.526 Y151.683 E.00251
; LINE_WIDTH: 0.243627
G3 X104.214 Y151.625 I.185 J-1.888 E.00288
G1 X104.095 Y151.59 E.00112
; LINE_WIDTH: 0.297778
G3 X102.982 Y150.685 I.643 J-1.929 E.0165
G1 X102.834 Y150.374 E.00388
; LINE_WIDTH: 0.252269
G3 X102.778 Y150.199 I4.322 J-1.48 E.00173
G1 X102.727 Y149.953 E.00236
; LINE_WIDTH: 0.18806
G1 X102.701 Y149.583 E.00251
G1 X102.701 Y131.489 E.12282
; LINE_WIDTH: 0.198025
G1 X102.718 Y131.121 E.00265
; LINE_WIDTH: 0.242795
G3 X102.799 Y130.73 I2.333 J.281 E.00361
G1 X102.802 Y130.721 E.00009
; LINE_WIDTH: 0.298164
G3 X103.358 Y129.846 I1.976 J.642 E.0118
G1 X103.638 Y129.629 E.004
G1 X103.952 Y129.464 E.004
; LINE_WIDTH: 0.259516
G3 X104.287 Y129.357 I.779 J1.861 E.00341
G1 X104.383 Y129.338 E.00095
; LINE_WIDTH: 0.188503
G3 X104.522 Y129.317 I.402 J2.277 E.00095
G1 X104.892 Y129.301 E.00252
G1 X105.976 Y129.301 E.00738
; CHANGE_LAYER
; Z_HEIGHT: 8.9
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.976 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 89/95
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.2 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.935 Z9.2
G1 Z8.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29357
G3 X104.825 Y129.591 I1.919 J.012 E.04738
G1 X122.973 Y129.591 E.29469
G3 X124.809 Y131.425 I-.082 J1.918 E.04626
G1 X124.81 Y149.502 E.29354
G3 X122.975 Y151.409 I-1.914 J-.005 E.04744
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.993 I.008 J-1.914 E.04053
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16062
G1 X102.991 Y147.998 E-.59938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.438 Y140.378 Z9.3 F42000
G1 X104.101 Y129.074 Z9.3
G1 Z8.9
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.171 Y129.054 E.00117
G3 X104.514 Y129.012 I.439 J2.156 E.00562
G1 X123.374 Y129.017 E.30624
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.189 J-.087 E.05449
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.114 E.30335
G3 X103.765 Y129.178 I2.198 J.096 E.04048
G1 X104.044 Y129.091 E.00475
; WIPE_START
G1 F3600
M204 S6000
G1 X104.171 Y129.054 E-.05025
G1 X104.514 Y129.012 E-.13139
G1 X106.036 Y129.012 E-.57836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 89 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.3
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.3 F4000
            G39.3 S1
            G0 Z9.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer89 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.308 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188945
G1 F2548
M204 S6000
G1 X122.979 Y129.301 E.11562
G3 X123.24 Y129.314 I-.059 J3.713 E.00178
G1 X123.352 Y129.327 E.00077
; LINE_WIDTH: 0.246759
G3 X123.582 Y129.374 I-.217 J1.662 E.00215
G1 X123.677 Y129.401 E.00091
; LINE_WIDTH: 0.297102
G3 X124.969 Y130.637 I-.61 J1.931 E.0208
; LINE_WIDTH: 0.251261
G3 X125.022 Y130.801 I-2.179 J.787 E.00161
G1 X125.074 Y131.052 E.0024
; LINE_WIDTH: 0.188236
G1 X125.099 Y131.417 E.00248
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.243631
G3 X125.025 Y150.186 I-1.899 J-.187 E.00287
G1 X124.99 Y150.305 E.00112
; LINE_WIDTH: 0.297783
G3 X124.083 Y151.419 I-1.92 J-.636 E.01654
G1 X123.774 Y151.566 E.00385
; LINE_WIDTH: 0.255582
G3 X123.425 Y151.662 I-.755 J-2.059 E.00345
G1 X123.413 Y151.664 E.00012
; LINE_WIDTH: 0.188487
G1 X122.984 Y151.699 E.00293
G1 X104.892 Y151.699 E.12312
G1 X104.469 Y151.676 E.00288
; LINE_WIDTH: 0.249744
G3 X104.047 Y151.573 I.307 J-2.184 E.00405
; LINE_WIDTH: 0.299677
G3 X102.866 Y150.451 I.697 J-1.916 E.019
; LINE_WIDTH: 0.259527
G3 X102.777 Y150.195 I1.808 J-.771 E.00263
G1 X102.736 Y150.015 E.00178
; LINE_WIDTH: 0.188212
G3 X102.715 Y149.854 I2.722 J-.436 E.00111
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.489 E.12294
; LINE_WIDTH: 0.197783
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.243797
G3 X102.775 Y130.814 I1.922 J.193 E.00288
G1 X102.81 Y130.695 E.00112
; LINE_WIDTH: 0.296284
G3 X104.119 Y129.403 I1.927 J.641 E.02137
; LINE_WIDTH: 0.246402
G3 X104.463 Y129.325 I.631 J1.993 E.00324
; LINE_WIDTH: 0.188945
G3 X104.637 Y129.309 I.315 J2.411 E.00119
G1 X105.976 Y129.308 E.00914
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.976 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 90/95
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.3 I-1.184 J-.283 P1  F42000
G1 X103.048 Y149.935 Z9.3
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X102.991 Y149.575 E.00592
G1 X102.99 Y131.496 E.29357
G3 X104.824 Y129.591 I1.925 J.019 E.04732
G1 X122.973 Y129.591 E.29471
G3 X124.809 Y131.425 I-.088 J1.924 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.914 J-.005 E.04745
G1 X104.898 Y151.41 E.29353
G3 X103.062 Y150.016 I.005 J-1.914 E.04017
G1 X103.058 Y149.994 E.00036
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16134
G1 X102.991 Y147.999 E-.59866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.38 Z9.4 F42000
G1 X104.099 Y129.069 Z9.4
G1 Z9
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.512 Y129.012 E.00677
G1 X123.374 Y129.017 E.30628
G3 X125.39 Y131.204 I-.193 J2.201 E.05299
G1 X125.388 Y149.886 E.30336
G3 X123.196 Y151.99 I-2.189 J-.087 E.05452
G1 X104.514 Y151.988 E.30335
G3 X102.41 Y149.796 I.091 J-2.193 E.0545
M73 P95 R1
G1 X102.412 Y131.114 E.30335
G3 X104.041 Y129.085 I2.198 J.096 E.04522
; WIPE_START
G1 F3600
M204 S6000
G1 X104.512 Y129.012 E-.18105
G1 X106.036 Y129.012 E-.57895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 90 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer90 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.308 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.189021
G1 F2547
M204 S6000
G1 X122.979 Y129.301 E.11567
G3 X123.242 Y129.314 I-.058 J3.7 E.0018
G1 X123.352 Y129.327 E.00076
; LINE_WIDTH: 0.251096
G3 X123.75 Y129.426 I-.357 J2.287 E.00384
; LINE_WIDTH: 0.298366
G3 X124.968 Y130.634 I-.683 J1.907 E.01998
; LINE_WIDTH: 0.251744
G3 X125.073 Y131.047 I-2.082 J.751 E.00401
; LINE_WIDTH: 0.188247
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.506 E.12292
G1 X125.083 Y149.874 E.0025
; LINE_WIDTH: 0.24247
G3 X125.026 Y150.182 I-1.811 J-.173 E.00282
G1 X124.997 Y150.283 E.00095
; LINE_WIDTH: 0.297386
G3 X123.926 Y151.502 I-1.937 J-.622 E.01876
G1 X123.774 Y151.566 E.00186
; LINE_WIDTH: 0.256602
G3 X123.427 Y151.661 I-.702 J-1.885 E.00345
; LINE_WIDTH: 0.188508
G1 X122.983 Y151.699 E.00303
G1 X104.896 Y151.699 E.12311
G3 X104.475 Y151.677 I.019 J-4.28 E.00287
; LINE_WIDTH: 0.249403
G3 X104.047 Y151.573 I.303 J-2.19 E.0041
; LINE_WIDTH: 0.29867
G3 X102.898 Y150.526 I.693 J-1.913 E.01801
G1 X102.834 Y150.374 E.00186
; LINE_WIDTH: 0.25219
G3 X102.778 Y150.198 I4.443 J-1.519 E.00173
G1 X102.726 Y149.951 E.00238
; LINE_WIDTH: 0.188057
G1 X102.701 Y149.583 E.0025
G1 X102.701 Y131.489 E.12282
; LINE_WIDTH: 0.197792
G1 X102.717 Y131.126 E.00261
; LINE_WIDTH: 0.242671
G3 X102.774 Y130.818 I1.835 J.18 E.00283
G1 X102.803 Y130.717 E.00095
; LINE_WIDTH: 0.297335
G3 X103.87 Y129.5 I1.937 J.622 E.01871
G1 X104.026 Y129.435 E.0019
; LINE_WIDTH: 0.25167
G3 X104.29 Y129.356 I.743 J1.999 E.00259
G1 X104.456 Y129.325 E.00158
; LINE_WIDTH: 0.189021
G3 X104.637 Y129.309 I.343 J2.734 E.00124
G1 X105.976 Y129.308 E.00914
; CHANGE_LAYER
; Z_HEIGHT: 9.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.976 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 91/95
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.4 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.935 Z9.4
G1 Z9.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.575 E.00589
G1 X102.99 Y131.496 E.29358
G3 X104.75 Y129.596 I1.914 J.008 E.04619
G1 X122.975 Y129.591 E.29593
G3 X124.809 Y131.425 I-.084 J1.918 E.04622
G1 X124.81 Y149.504 E.29357
G3 X122.975 Y151.409 I-1.914 J-.007 E.04741
G1 X104.896 Y151.41 E.29357
G3 X103.055 Y149.993 I.007 J-1.914 E.04054
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.575 E-.16062
G1 X102.991 Y147.998 E-.59938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z9.5 F42000
G1 X104.099 Y129.069 Z9.5
G1 Z9.1
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.0068
G1 X123.287 Y129.012 E.30483
G3 X125.39 Y131.204 I-.105 J2.205 E.0544
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.09 E.05447
G1 X104.514 Y151.988 E.30338
G3 X102.41 Y149.796 I.087 J-2.189 E.05452
G1 X102.412 Y131.114 E.30335
G3 X104.042 Y129.084 I2.198 J.096 E.04523
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18171
G1 X106.036 Y129.012 E-.5783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 91 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.5
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.5 F4000
            G39.3 S1
            G0 Z9.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer91 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.301 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187425
G1 F2548
M204 S6000
G1 X122.983 Y129.302 E.1146
G1 X123.248 Y129.315 E.00179
; LINE_WIDTH: 0.240754
G3 X123.415 Y129.337 I-.181 J2.025 E.0015
G1 X123.676 Y129.401 E.00241
; LINE_WIDTH: 0.298125
G3 X124.935 Y130.551 I-.616 J1.939 E.01984
; LINE_WIDTH: 0.260002
G3 X125.061 Y130.977 I-2.087 J.849 E.00432
; LINE_WIDTH: 0.18841
G3 X125.085 Y131.146 I-2.574 J.439 E.00116
G1 X125.099 Y131.417 E.00184
G1 X125.099 Y149.508 E.12306
G1 X125.083 Y149.874 E.00249
; LINE_WIDTH: 0.241819
G3 X125.047 Y150.097 I-2.635 J-.317 E.00203
G1 X124.999 Y150.277 E.00167
; LINE_WIDTH: 0.297305
G3 X123.926 Y151.502 I-1.95 J-.625 E.01882
G1 X123.774 Y151.566 E.00186
; LINE_WIDTH: 0.255687
G3 X123.425 Y151.662 I-.758 J-2.069 E.00346
G1 X123.415 Y151.663 E.0001
; LINE_WIDTH: 0.188481
G1 X122.983 Y151.699 E.00295
G1 X104.892 Y151.699 E.12311
G3 X104.475 Y151.677 I-.005 J-3.786 E.00284
; LINE_WIDTH: 0.249379
G3 X104.047 Y151.573 I.303 J-2.189 E.0041
; LINE_WIDTH: 0.300436
G3 X102.899 Y150.526 I.697 J-1.917 E.01812
; LINE_WIDTH: 0.263384
G3 X102.738 Y150.023 I1.982 J-.912 E.00521
G1 X102.736 Y150.015 E.00008
; LINE_WIDTH: 0.18821
G3 X102.715 Y149.854 I2.689 J-.431 E.0011
G1 X102.701 Y149.583 E.00184
G1 X102.701 Y131.488 E.12294
; LINE_WIDTH: 0.205935
G3 X102.737 Y130.985 I3.458 J-.008 E.00379
; LINE_WIDTH: 0.252217
G3 X102.775 Y130.814 I6.176 J1.282 E.00165
G1 X102.812 Y130.69 E.00122
; LINE_WIDTH: 0.298779
G3 X103.795 Y129.537 I1.926 J.647 E.01754
G1 X103.955 Y129.462 E.002
; LINE_WIDTH: 0.259718
G3 X104.117 Y129.403 I.951 J2.363 E.00167
G1 X104.379 Y129.338 E.00262
; LINE_WIDTH: 0.187425
G3 X104.55 Y129.315 I.37 J2.118 E.00117
G1 X104.892 Y129.301 E.00232
G1 X105.976 Y129.301 E.00733
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.976 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 92/95
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.5 I-1.184 J-.283 P1  F42000
G1 X103.041 Y149.935 Z9.5
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2548
M204 S5000
G1 X102.991 Y149.573 E.00593
G1 X102.99 Y131.496 E.29353
G3 X104.825 Y129.591 I1.925 J.019 E.04734
G1 X122.973 Y129.591 E.29468
G3 X124.809 Y131.425 I-.088 J1.924 E.04623
G1 X124.81 Y149.502 E.29353
G3 X122.975 Y151.409 I-1.911 J-.003 E.04746
G1 X104.898 Y151.41 E.29353
G3 X103.055 Y149.993 I.003 J-1.911 E.04058
; WIPE_START
G1 F3600
M204 S6000
G1 X102.991 Y149.573 E-.16154
G1 X102.991 Y147.998 E-.59846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.437 Y140.378 Z9.6 F42000
G1 X104.099 Y129.069 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F2548
M204 S5000
G1 X104.514 Y129.012 E.0068
G1 X123.286 Y129.012 E.30481
G1 X123.459 Y129.025 E.00283
G3 X125.39 Y131.204 I-.265 J2.179 E.05167
G1 X125.388 Y149.886 E.30335
G3 X123.198 Y151.99 I-2.193 J-.09 E.05447
G1 X104.514 Y151.988 E.30339
G3 X102.41 Y149.798 I.09 J-2.193 E.05447
G1 X102.412 Y131.114 E.30339
G3 X104.042 Y129.084 I2.198 J.096 E.04523
; WIPE_START
G1 F3600
M204 S6000
G1 X104.514 Y129.012 E-.18172
G1 X106.036 Y129.012 E-.57828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 92 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y128.816 F18000 ; move to safe pos
M73 P96 R1
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer92 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.036 Y129.308 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188409
G1 F2548
M204 S6000
G1 X122.979 Y129.302 E.11525
G3 X123.415 Y129.337 I-.053 J3.392 E.00298
; LINE_WIDTH: 0.254473
G3 X123.75 Y129.426 I-.448 J2.353 E.00329
; LINE_WIDTH: 0.298297
G3 X124.969 Y130.638 I-.683 J1.907 E.02003
; LINE_WIDTH: 0.251568
G3 X125.073 Y131.047 I-1.906 J.702 E.00397
; LINE_WIDTH: 0.188344
G1 X125.099 Y131.417 E.00252
G1 X125.099 Y149.504 E.12298
G3 X125.076 Y149.929 I-4.279 J-.019 E.00289
; LINE_WIDTH: 0.249649
G3 X124.973 Y150.353 I-2.053 J-.274 E.00407
; LINE_WIDTH: 0.298575
G3 X123.926 Y151.502 I-1.914 J-.694 E.018
G1 X123.774 Y151.566 E.00187
; LINE_WIDTH: 0.251173
G3 X123.337 Y151.675 I-.7 J-1.87 E.00422
; LINE_WIDTH: 0.188315
G3 X123.195 Y151.69 I-.304 J-2.239 E.00097
G1 X104.896 Y151.699 E.12441
G3 X104.471 Y151.676 I.019 J-4.279 E.00289
; LINE_WIDTH: 0.249642
G3 X104.047 Y151.573 I.274 J-2.054 E.00407
; LINE_WIDTH: 0.300458
G3 X102.898 Y150.526 I.694 J-1.914 E.01813
; LINE_WIDTH: 0.263543
G3 X102.777 Y150.195 I1.851 J-.869 E.00348
G1 X102.737 Y150.02 E.00177
; LINE_WIDTH: 0.188223
G1 X102.701 Y149.579 E.00301
G1 X102.701 Y131.489 E.12292
; LINE_WIDTH: 0.205719
G3 X102.736 Y130.989 I3.453 J-.008 E.00376
; LINE_WIDTH: 0.254487
G3 X102.787 Y130.77 I2.79 J.534 E.00213
G1 X102.829 Y130.64 E.00129
; LINE_WIDTH: 0.300607
G3 X103.874 Y129.499 I1.904 J.693 E.01806
; LINE_WIDTH: 0.26403
G3 X104.373 Y129.339 I.912 J1.985 E.00519
; LINE_WIDTH: 0.188409
G3 X104.637 Y129.309 I.463 J2.902 E.00181
G1 X105.976 Y129.308 E.00911
; CHANGE_LAYER
; Z_HEIGHT: 9.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X107.976 Y129.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 93/95
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.6 I-1.183 J-.284 P1  F42000
G1 X103.027 Y149.937 Z9.6
G1 Z9.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2547
M204 S5000
G1 X102.977 Y149.573 E.00596
G1 X102.975 Y131.496 E.29354
G3 X104.749 Y129.581 I1.941 J.019 E.04648
G1 X122.976 Y129.577 E.29598
G3 X124.823 Y131.427 I-.08 J1.927 E.04664
G1 X124.825 Y149.504 E.29354
G3 X122.973 Y151.423 I-1.928 J-.008 E.04781
G1 X104.896 Y151.425 E.29354
G3 X103.041 Y149.995 I.008 J-1.928 E.04087
; WIPE_START
G1 F3600
M204 S6000
G1 X102.977 Y149.573 E-.1622
G1 X102.977 Y148 E-.5978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.43 Y140.381 Z9.7 F42000
G1 X104.102 Y129.084 Z9.7
G1 Z9.3
G1 E.8 F1800
G1 F2547
M204 S5000
G1 X104.515 Y129.026 E.00677
G1 X123.372 Y129.032 E.30621
G3 X125.375 Y131.204 I-.191 J2.186 E.05265
G1 X125.374 Y149.885 E.30335
G3 X123.196 Y151.975 I-2.183 J-.095 E.0541
G1 X104.515 Y151.974 E.30335
G3 X102.425 Y149.796 I.095 J-2.183 E.0541
G1 X102.426 Y131.115 E.30335
G3 X104.043 Y129.097 I2.174 J.086 E.04495
; WIPE_START
G1 F3600
M204 S6000
G1 X104.515 Y129.026 E-.18108
G1 X106.038 Y129.027 E-.57892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 93 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.7
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.7 F4000
            G39.3 S1
            G0 Z9.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer93 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X106.038 Y129.301 F42000
G1 Z9.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.158522
G1 F2547
M204 S6000
G1 X122.985 Y129.301 E.09464
G3 X123.35 Y129.327 I-.023 J2.905 E.00204
; LINE_WIDTH: 0.219611
G3 X123.636 Y129.389 I-.196 J1.591 E.00237
G1 X123.704 Y129.411 E.00058
; LINE_WIDTH: 0.27042
G3 X124.876 Y130.422 I-.638 J1.923 E.0161
M73 P96 R0
G1 X124.904 Y130.48 E.00066
; LINE_WIDTH: 0.234109
G3 X125.061 Y130.977 I-1.861 J.862 E.00453
; LINE_WIDTH: 0.159067
G3 X125.096 Y131.32 I-2.658 J.444 E.00193
G1 X125.099 Y149.508 E.10197
G1 X125.086 Y149.844 E.00188
; LINE_WIDTH: 0.210663
G3 X125.002 Y150.267 I-2.049 J-.186 E.00333
; LINE_WIDTH: 0.26939
G3 X123.933 Y151.498 I-1.946 J-.61 E.01695
G1 X123.917 Y151.506 E.00018
; LINE_WIDTH: 0.233995
G3 X123.423 Y151.661 I-.842 J-1.81 E.0045
; LINE_WIDTH: 0.159067
G3 X123.08 Y151.696 I-.444 J-2.658 E.00193
G1 X104.892 Y151.699 E.10197
G1 X104.556 Y151.686 E.00188
; LINE_WIDTH: 0.210663
G3 X104.133 Y151.602 I.186 J-2.049 E.00333
; LINE_WIDTH: 0.26939
G3 X102.902 Y150.533 I.61 J-1.946 E.01695
G1 X102.894 Y150.517 E.00018
; LINE_WIDTH: 0.233998
G3 X102.739 Y150.023 I1.81 J-.842 E.0045
; LINE_WIDTH: 0.158927
G3 X102.704 Y149.68 I2.658 J-.444 E.00193
G1 X102.701 Y131.489 E.10188
; LINE_WIDTH: 0.167152
G1 X102.715 Y131.15 E.00201
; LINE_WIDTH: 0.211326
G3 X102.8 Y130.728 I2.005 J.184 E.00334
; LINE_WIDTH: 0.267798
G3 X104.04 Y129.43 I1.943 J.615 E.01866
; LINE_WIDTH: 0.222578
G3 X104.456 Y129.326 I.732 J2.051 E.00352
; LINE_WIDTH: 0.158522
G1 X104.892 Y129.301 E.00244
G1 X105.978 Y129.301 E.00607
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F15000
G1 X107.978 Y129.301 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 94/95
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.7 I-1.183 J-.286 P1  F42000
G1 X102.981 Y149.949 Z9.7
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1849
M204 S5000
G1 X102.974 Y149.923 E.00044
G3 X102.929 Y149.577 I1.93 J-.427 E.00567
G1 X102.927 Y131.496 E.29361
G3 X104.745 Y129.533 I1.983 J.013 E.04768
G1 X122.979 Y129.529 E.29608
G3 X124.871 Y131.423 I-.08 J1.973 E.04778
G1 X124.873 Y149.502 E.29357
G3 X122.977 Y151.471 I-1.977 J-.006 E.04901
G1 X104.898 Y151.473 E.29357
G3 X103.078 Y150.255 I.006 J-1.977 E.03769
G1 X103 Y150.007 E.00423
; WIPE_START
G1 F3600
M204 S6000
G1 X102.974 Y149.923 E-.03318
G1 X102.929 Y149.577 E-.13253
G1 X102.928 Y148.013 E-.5943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.404 Y140.396 Z9.8 F42000
G1 X104.108 Y129.131 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F1849
M204 S5000
G1 X104.515 Y129.075 E.00666
G1 X123.368 Y129.08 E.30614
G3 X125.327 Y131.204 I-.172 J2.124 E.05157
G1 X125.325 Y149.883 E.30331
G3 X123.198 Y151.927 I-2.135 J-.093 E.05287
G1 X104.517 Y151.925 E.30335
G3 X102.473 Y149.798 I.093 J-2.135 E.05287
G1 X102.475 Y131.117 E.30335
G3 X104.05 Y129.146 I2.128 J.086 E.04385
; WIPE_START
G1 F3600
M204 S6000
G1 X104.515 Y129.075 E-.17849
M73 P97 R0
G1 X106.045 Y129.075 E-.58151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 94 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer94 end: 94
M625
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
G1 X104.681 Y129.307 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100433
G1 F1849
M204 S6000
G1 X104.455 Y129.325 E.00073
G2 X104.249 Y129.365 I.863 J4.989 E.00067
; LINE_WIDTH: 0.151941
G1 X104.233 Y129.37 E.00009
G2 X103.716 Y129.581 I.539 J2.053 E.00297
; LINE_WIDTH: 0.174518
G2 X102.802 Y130.72 I1.022 J1.757 E.00932
; LINE_WIDTH: 0.117351
G1 X102.8 Y130.725 E.00002
G2 X102.717 Y131.126 I2.062 J.637 E.0016
; LINE_WIDTH: 0.0840756
G1 X102.707 Y131.286 E.00041
M204 S10000
G1 X102.706 Y149.71 F42000
; LINE_WIDTH: 0.0892028
G1 F1849
M204 S6000
G2 X102.73 Y149.975 I3.134 J-.158 E.00073
; LINE_WIDTH: 0.127279
G2 X102.828 Y150.356 I2.253 J-.375 E.0017
; LINE_WIDTH: 0.175442
G2 X103.57 Y151.325 I1.914 J-.696 E.00778
G1 X103.837 Y151.483 E.00195
; LINE_WIDTH: 0.143255
G2 X104.092 Y151.589 I.933 J-1.888 E.00137
G1 X104.31 Y151.648 E.00112
; LINE_WIDTH: 0.0972354
G1 X104.668 Y151.694 E.00111
M204 S10000
G1 X123.11 Y151.694 F42000
; LINE_WIDTH: 0.0892028
G1 F1849
M204 S6000
G2 X123.375 Y151.67 I-.158 J-3.134 E.00073
; LINE_WIDTH: 0.127279
G2 X123.756 Y151.572 I-.375 J-2.253 E.0017
; LINE_WIDTH: 0.175443
G2 X124.725 Y150.83 I-.696 J-1.914 E.00778
G1 X124.883 Y150.563 E.00195
; LINE_WIDTH: 0.143255
G2 X124.989 Y150.308 I-1.884 J-.932 E.00137
G1 X125.048 Y150.09 E.00112
; LINE_WIDTH: 0.0972354
G1 X125.094 Y149.732 E.00111
M204 S10000
G1 X125.094 Y131.29 F42000
; LINE_WIDTH: 0.0934112
G1 F1849
M204 S6000
G1 X125.092 Y131.237 E.00015
G2 X125.055 Y130.944 I-1.858 J.087 E.00087
; LINE_WIDTH: 0.141796
G1 X125.024 Y130.81 E.00067
G2 X124.883 Y130.436 I-2.109 J.586 E.00196
; LINE_WIDTH: 0.173448
G2 X123.673 Y129.4 I-1.825 J.906 E.01013
; LINE_WIDTH: 0.114509
G2 X123.236 Y129.314 I-.618 J1.988 E.00169
; LINE_WIDTH: 0.0803165
G1 X123.104 Y129.306 E.00032
; CHANGE_LAYER
; Z_HEIGHT: 9.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X123.236 Y129.314 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 94
M625
; layer num/total_layer_count: 95/95
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 94
; start printing object, unique label id: 94
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.8 I-.866 J-.855 P1  F42000
G1 X102.874 Y149.957 Z9.8
G1 Z9.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1650
M204 S5000
G1 X102.822 Y149.58 E.00619
G1 X102.82 Y131.496 E.29365
G3 X104.739 Y129.426 I2.097 J.02 E.05026
G1 X122.982 Y129.422 E.29624
G3 X124.978 Y131.42 I-.091 J2.087 E.05037
G1 X124.98 Y149.502 E.29361
G3 X122.98 Y151.578 I-2.083 J-.005 E.0517
G1 X104.898 Y151.58 E.29361
G3 X102.886 Y150.016 I.005 J-2.083 E.04453
; WIPE_START
G1 F3600
M204 S6000
G1 X102.822 Y149.58 E-.16757
G1 X102.822 Y148.021 E-.59244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.352 Y140.407 Z9.9 F42000
G1 X104.129 Y129.237 Z9.9
G1 Z9.5
G1 E.8 F1800
G1 F1650
M204 S5000
G3 X104.521 Y129.182 I.479 J1.971 E.00643
G1 X123.36 Y129.186 E.30592
G3 X125.22 Y131.204 I-.169 J2.022 E.04894
G1 X125.218 Y149.879 E.30325
G3 X123.198 Y151.82 I-2.02 J-.081 E.05026
G1 X104.521 Y151.818 E.30328
G3 X102.58 Y149.798 I.081 J-2.02 E.05026
G1 X102.582 Y131.121 E.30328
G3 X104.071 Y129.252 I2.027 J.087 E.0415
; WIPE_START
G1 F3600
M204 S6000
G1 X104.521 Y129.182 E-.17283
G1 X106.066 Y129.182 E-.58717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 94
M625
; object ids of layer 95 start: 94
M624 AgAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.9
G1 X0 Y128.816 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.9 F4000
            G39.3 S1
            G0 Z9.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer95 end: 94
M625
; close powerlost recovery
M1003 S0
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
G1 Z9.9 F900 ; lower z a little
G1 X0 Y128.816 F18000 ; move to safe pos
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

    G1 Z109.5 F600
    G1 Z107.5

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

