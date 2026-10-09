; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 3m 59s; total estimated time: 10m 46s
; total layer number: 12
; total filament length [mm] : 205.98
; total filament volume [cm^3] : 495.43
; total filament weight [g] : 0.61
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.20
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
M73 P0 R10
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
M73 P1 R10
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
M73 P5 R10
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P7 R9
G1 X-48.2 F3000
M73 P9 R9
G1 X-28.5 F30000 ;wipe and shake
M73 P10 R9
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
M73 P14 R9
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
    
M73 P15 R9
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
M73 P16 R9
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
M73 P56 R4
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
M73 P57 R4
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
M73 P58 R4
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
    G29 A1 X101 Y104 I54 J48
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
; layer num/total_layer_count: 1/12
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X133.129 Y106.718 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P59 R4
G1 F1500
M204 S500
M73 P60 R4
G1 X122.871 Y106.718 E.2
G2 X122.882 Y105.32 I-54.237 J-1.104 E.02725
G1 X133.118 Y105.32 E.19959
G1 X133.119 Y105.954 E.01236
G1 X133.128 Y106.658 E.01373
M204 S6000
G1 X133.614 Y107.197 F42000
G1 F1500
M204 S500
G1 X132.645 Y107.196 E.0189
G2 X122.386 Y107.199 I-4.882 J1074.792 E.20002
G2 X122.403 Y104.842 I-91.45 J-1.841 E.04596
M73 P62 R4
G1 X133.597 Y104.842 E.21825
G1 X133.597 Y105.951 E.02163
G1 X133.613 Y107.137 E.02313
; WIPE_START
G1 X132.645 Y107.196 E-.36866
G1 X131.615 Y107.197 E-.39134
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.699 Y107.682 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
M73 P62 R3
G3 X138.75 Y107.014 I8.67 J.322 E.01307
M73 P63 R3
G1 X138.75 Y105.825 E.02318
G3 X140.411 Y105.725 I1.542 J11.781 E.03247
G1 X147.003 Y105.725 E.12854
G3 X153.275 Y111.997 I-.015 J6.287 E.19195
G1 X153.275 Y144.003 E.62405
G3 X147.003 Y150.275 I-6.287 J-.015 E.19196
G1 X108.997 Y150.275 E.74103
G3 X102.725 Y144.003 I.016 J-6.288 E.19195
G1 X102.725 Y111.997 E.62405
G3 X108.997 Y105.725 I6.287 J.015 E.19195
G1 X115.589 Y105.725 E.12854
G3 X117.25 Y105.825 I.118 J11.881 E.03247
G2 X117.301 Y107.682 I16.872 J.468 E.03624
G3 X117.98 Y107.689 I.193 J14.133 E.01324
G1 X121.886 Y107.68 E.07616
G3 X132.645 Y107.675 I5.876 J1123.338 E.20977
G2 X138.639 Y107.682 I4.02 J-829.964 E.11688
; WIPE_START
G1 X138.75 Y107.014 E-.2574
G1 X138.75 Y105.825 E-.45179
G1 X138.883 Y105.811 E-.05081
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.047 Y105.256 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X139.416 Y105.278 E.0123
G2 X138.876 Y105.331 I.861 J11.616 E.01059
G2 X138.896 Y104.842 I-7.025 J-.532 E.00954
G1 X146.991 Y104.842 E.15784
G3 X154.158 Y112.009 I-.005 J7.172 E.21946
G1 X154.158 Y143.991 E.62358
G3 X146.991 Y151.158 I-7.172 J-.005 E.21946
M73 P64 R3
G1 X109.009 Y151.158 E.74056
G3 X101.842 Y143.991 I.005 J-7.172 E.21946
G1 X101.842 Y112.009 E.62357
G3 X109.009 Y104.842 I7.172 J.005 E.21947
G1 X117.104 Y104.842 E.15783
G1 X117.107 Y105.018 E.00345
G1 X117.124 Y105.331 E.00609
G2 X115.591 Y105.247 I-1.401 J11.563 E.02997
G1 X108.992 Y105.246 E.12865
G2 X102.246 Y111.992 I.02 J6.766 E.20642
G1 X102.246 Y144.008 E.62423
G2 X108.992 Y150.754 I6.767 J-.021 E.20643
G1 X147.008 Y150.754 E.7412
G2 X153.754 Y144.008 I-.02 J-6.766 E.20644
G1 X153.754 Y111.992 E.62423
G2 X147.008 Y105.246 I-6.766 J.021 E.20642
G1 X140.409 Y105.247 E.12865
G1 X140.107 Y105.255 E.0059
; WIPE_START
G1 X139.416 Y105.278 E-.26253
G1 X138.876 Y105.331 E-.20634
G1 X138.896 Y104.842 E-.18592
G1 X139.173 Y104.842 E-.10521
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.35 Y107.129 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
M73 P65 R3
G1 F1500
M204 S500
G1 X138.35 Y105.956 E.02287
G2 X138.424 Y104.363 I-26.236 J-2.015 E.0311
G1 X146.996 Y104.363 E.16714
G3 X154.637 Y112.004 I-.011 J7.651 E.23392
G1 X154.637 Y143.996 E.62377
G3 X146.996 Y151.637 I-7.651 J-.011 E.23392
G1 X109.004 Y151.637 E.74076
G3 X101.363 Y143.996 I.011 J-7.651 E.23392
G1 X101.363 Y112.004 E.62377
G3 X109.004 Y104.363 I7.651 J.011 E.23392
G1 X117.576 Y104.363 E.16714
M73 P66 R3
G1 X117.577 Y104.518 E.00302
G2 X117.65 Y105.956 I17.346 J-.164 E.02809
G1 X117.65 Y107.129 E.02287
G2 X119.75 Y107.211 I1.683 J-16.235 E.041
G1 X121.907 Y107.211 E.04207
G2 X121.925 Y104.363 I-110.534 J-2.102 E.05552
G1 X134.075 Y104.363 E.2369
G2 X134.093 Y107.211 I110.556 J.746 E.05552
G2 X137.653 Y107.19 I1.303 J-82.586 E.06943
G1 X138.29 Y107.134 E.01247
; WIPE_START
G1 X138.35 Y105.956 E-.44823
G1 X138.405 Y105.138 E-.31177
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
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


G1 X138.476 Y107.4 F42000
G1 Z.1
M73 P67 R3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919664
G1 F1500
M204 S500
G1 X138.107 Y107.42 E.00106
; WIPE_START
G1 X138.476 Y107.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.935 Y106.5 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50644
G1 F2400
M204 S500
G1 X132.161 Y105.727 E.02161
G1 X131.476 Y105.727 E.01355
G1 X132.06 Y106.312 E.01634
G1 X131.374 Y106.312 E.01355
G1 X130.79 Y105.727 E.01633
G1 X130.104 Y105.727 E.01355
G1 X130.688 Y106.312 E.01633
G1 X130.002 Y106.311 E.01355
G1 X129.418 Y105.727 E.01633
G1 X128.732 Y105.727 E.01355
G1 X129.317 Y106.311 E.01633
G1 X128.631 Y106.311 E.01355
G1 X128.046 Y105.727 E.01633
M73 P68 R3
G1 X127.36 Y105.727 E.01355
G1 X127.945 Y106.311 E.01633
G1 X127.259 Y106.311 E.01355
G1 X126.674 Y105.727 E.01633
G1 X125.989 Y105.727 E.01355
G1 X126.573 Y106.311 E.01633
G1 X125.887 Y106.311 E.01355
G1 X125.303 Y105.727 E.01633
G1 X124.617 Y105.727 E.01355
G1 X125.201 Y106.311 E.01633
G1 X124.515 Y106.311 E.01355
G1 X123.931 Y105.727 E.01633
G1 X123.285 Y105.727 E.01276
G1 X123.285 Y105.767 E.00079
G1 X124.045 Y106.527 E.02123
; WIPE_START
G1 X123.285 Y105.767 E-.40834
G1 X123.285 Y105.727 E-.01513
G1 X123.931 Y105.727 E-.24539
G1 X124.101 Y105.897 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.893 Y107.42 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919761
G1 F1500
M204 S500
G1 X117.524 Y107.4 E.00106
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F1500
G1 X117.893 Y107.42 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/12
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.5 I.037 J1.216 P1  F42000
G1 X133.348 Y106.948 Z.5
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.652 Y106.948 E.18675
G1 X122.652 Y105.052 E.0331
G1 X133.348 Y105.052 E.18675
G1 X133.348 Y106.888 E.03206
M204 S10000
G1 X133.776 Y107.376 F42000
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y104.624 E.04807
G1 X133.776 Y104.624 E.20172
G1 X133.776 Y107.316 E.04702
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z.6 F42000
G1 X141.154 Y105.426 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.017 J6.585 E.18
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.588 J-.02 E.17998
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.016 J-6.174 E.15696
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.171 J.013 E.15698
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
M73 P69 R3
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y104.21 E.04709
G1 X134.19 Y104.21 E.20103
G1 X134.19 Y107.11 E.04709
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
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


G1 X138.55 Y105.633 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
M73 P70 R3
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.934 Y106.534 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.934 Y105.466 E.01736
G1 X123.066 Y105.466 E.16025
G1 X123.066 Y106.534 E.01736
G1 X132.874 Y106.534 E.15927
M204 S10000
G1 X132.568 Y106.168 F42000
; LINE_WIDTH: 0.35661
G1 F15000
M204 S6000
G1 X132.568 Y105.832 E.00458
G1 X123.432 Y105.832 E.12474
G1 X123.432 Y106.168 E.00458
G1 X132.508 Y106.168 E.12392
; WIPE_START
G1 X130.508 Y106.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.071 Y105.142 Z.6 F42000
G1 X138.938 Y105.025 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395789
G1 F15000
M204 S6000
G1 X146.99 Y105.025 E.12281
G3 X153.953 Y111.446 I.007 J6.979 E.15878
G1 X153.975 Y112.01 E.0086
G1 X153.975 Y143.99 E.48774
G3 X147.519 Y150.955 I-6.974 J.01 E.15933
G1 X146.99 Y150.975 E.00808
G1 X109.01 Y150.975 E.57925
G3 X102.047 Y144.554 I-.007 J-6.979 E.15878
G1 X102.025 Y143.99 E.0086
G1 X102.025 Y112.01 E.48774
G3 X107.667 Y105.154 I6.978 J-.007 E.14678
G1 X108.449 Y105.047 E.01204
G1 X108.992 Y105.025 E.00828
G1 X117.062 Y105.025 E.12309
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.017 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/12
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.046 J1.216 P1  F42000
G1 X133.348 Y106.948 Z.6
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.652 Y106.948 E.18675
G1 X122.652 Y105.052 E.0331
G1 X133.348 Y105.052 E.18675
G1 X133.348 Y106.888 E.03206
M204 S10000
G1 X133.776 Y107.376 F42000
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y104.624 E.04807
G1 X133.776 Y104.624 E.20172
G1 X133.776 Y107.316 E.04702
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z.7 F42000
G1 X141.154 Y105.426 Z.7
G1 Z.3
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.992 I.018 J6.585 E.17996
G1 X102.426 Y144.006 E.55897
M73 P71 R3
G2 X108.994 Y150.574 I6.586 J-.018 E.17999
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.008 I-.018 J-6.586 E.17996
G1 X153.574 Y111.994 E.55897
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.003 E.51969
G3 X147.002 Y150.16 I-6.171 J-.014 E.15696
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.013 J-6.171 E.15697
G1 X102.84 Y111.997 E.51969
G3 X108.998 Y105.84 I6.171 J.014 E.15696
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y104.21 E.04709
G1 X134.19 Y104.21 E.20103
G1 X134.19 Y107.11 E.04709
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.7
M73 P72 R3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
G1 X138.55 Y105.633 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
M73 P72 R2
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.934 Y106.534 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.934 Y105.466 E.01736
G1 X123.066 Y105.466 E.16025
G1 X123.066 Y106.534 E.01736
G1 X132.874 Y106.534 E.15927
M204 S10000
G1 X132.568 Y106.168 F42000
; LINE_WIDTH: 0.35661
G1 F15000
M204 S6000
G1 X132.568 Y105.832 E.00458
G1 X123.432 Y105.832 E.12474
G1 X123.432 Y106.168 E.00458
G1 X132.508 Y106.168 E.12392
; WIPE_START
M73 P73 R2
G1 X130.508 Y106.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.071 Y105.142 Z.7 F42000
G1 X138.938 Y105.025 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395777
G1 F15000
M204 S6000
G1 X146.99 Y105.025 E.1228
G3 X149.411 Y105.455 I-.004 J7.043 E.03769
G1 X150.17 Y105.787 E.01263
G1 X150.644 Y106.053 E.00829
G1 X151.1 Y106.357 E.00836
G1 X151.737 Y106.881 E.01258
G1 X152.122 Y107.265 E.00829
G1 X152.478 Y107.682 E.00836
G1 X152.799 Y108.125 E.00835
G1 X153.084 Y108.589 E.0083
G1 X153.444 Y109.331 E.01258
G1 X153.634 Y109.845 E.00835
G1 X153.781 Y110.368 E.0083
G1 X153.927 Y111.181 E.01259
G1 X153.975 Y112.01 E.01267
G1 X153.975 Y143.99 E.48772
G3 X147.498 Y150.956 I-6.974 J.011 E.15964
G1 X146.99 Y150.975 E.00775
G1 X109.01 Y150.975 E.57923
G3 X102.047 Y144.555 I-.006 J-6.98 E.15875
G1 X102.025 Y143.99 E.00862
G1 X102.025 Y112.01 E.48772
G3 X107.688 Y105.15 I6.978 J-.007 E.14709
G1 X108.449 Y105.047 E.01172
G1 X108.992 Y105.025 E.00828
G1 X117.062 Y105.025 E.12308
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.017 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/12
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I.046 J1.216 P1  F42000
G1 X133.348 Y106.948 Z.7
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.652 Y106.948 E.18675
G1 X122.652 Y105.052 E.0331
G1 X133.348 Y105.052 E.18675
G1 X133.348 Y106.888 E.03206
M204 S10000
G1 X133.776 Y107.376 F42000
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y104.624 E.04807
G1 X133.776 Y104.624 E.20172
G1 X133.776 Y107.316 E.04702
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z.8 F42000
G1 X141.154 Y105.426 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.991 I.018 J6.586 E.17994
G1 X102.426 Y144.006 E.55899
G2 X108.994 Y150.574 I6.586 J-.018 E.17999
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.009 I-.018 J-6.586 E.17994
G1 X153.574 Y111.994 E.55899
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.003 E.5197
G3 X147.002 Y150.16 I-6.171 J-.014 E.15696
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.014 J-6.171 E.15697
G1 X102.84 Y111.997 E.5197
G3 X108.998 Y105.84 I6.171 J.014 E.15696
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
M73 P74 R2
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y104.21 E.04709
G1 X134.19 Y104.21 E.20103
G1 X134.19 Y107.11 E.04709
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
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


G1 X138.55 Y105.633 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.934 Y106.534 Z.8 F42000
M73 P75 R2
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.934 Y105.466 E.01736
G1 X123.066 Y105.466 E.16025
G1 X123.066 Y106.534 E.01736
G1 X132.874 Y106.534 E.15927
M204 S10000
G1 X132.568 Y106.168 F42000
; LINE_WIDTH: 0.35661
G1 F15000
M204 S6000
G1 X132.568 Y105.832 E.00458
G1 X123.432 Y105.832 E.12474
G1 X123.432 Y106.168 E.00458
G1 X132.508 Y106.168 E.12392
; WIPE_START
G1 X130.508 Y106.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.071 Y105.142 Z.8 F42000
G1 X138.938 Y105.025 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395798
G1 F15000
M204 S6000
G1 X146.99 Y105.025 E.12281
G3 X153.925 Y111.171 I.01 J6.975 E.15459
G1 X153.975 Y112.01 E.01282
G1 X153.975 Y143.99 E.48775
G3 X148.1 Y150.888 I-6.979 J.007 E.1504
G1 X147.548 Y150.953 E.00848
G1 X146.99 Y150.975 E.00851
G1 X109.01 Y150.975 E.57926
G3 X102.074 Y144.829 I-.007 J-6.978 E.15457
G1 X102.025 Y143.99 E.01282
G1 X102.025 Y112.01 E.48775
G3 X107.708 Y105.147 I6.977 J-.007 E.14741
G1 X108.449 Y105.047 E.01141
G1 X108.992 Y105.025 E.00828
G1 X117.062 Y105.025 E.12309
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.017 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/12
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I.046 J1.216 P1  F42000
G1 X133.348 Y106.948 Z.8
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.652 Y106.948 E.18675
G1 X122.652 Y105.052 E.0331
G1 X133.348 Y105.052 E.18675
G1 X133.348 Y106.888 E.03206
M204 S10000
G1 X133.776 Y107.376 F42000
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y104.624 E.04807
G1 X133.776 Y104.624 E.20172
G1 X133.776 Y107.316 E.04702
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z.9 F42000
G1 X141.154 Y105.426 Z.9
G1 Z.5
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.38 J.003 E.20251
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.018 J6.586 E.17999
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.576 J-.009 E.18006
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P76 R2
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.005 J-6.163 E.15703
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.171 J.013 E.15697
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.794 J-.002 E.19874
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.002 J-7.794 E.19874
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.794 J.002 E.19874
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y104.21 E.04709
G1 X134.19 Y104.21 E.20103
G1 X134.19 Y107.11 E.04709
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
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


G1 X138.55 Y105.633 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
M73 P77 R2
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.934 Y106.534 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X132.934 Y105.466 E.01736
G1 X123.066 Y105.466 E.16025
G1 X123.066 Y106.534 E.01736
G1 X132.874 Y106.534 E.15927
M204 S10000
G1 X132.568 Y106.168 F42000
; LINE_WIDTH: 0.35661
G1 F15000
M204 S6000
G1 X132.568 Y105.832 E.00458
G1 X123.432 Y105.832 E.12474
G1 X123.432 Y106.168 E.00458
G1 X132.508 Y106.168 E.12392
; WIPE_START
G1 X130.508 Y106.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.071 Y105.142 Z.9 F42000
G1 X138.938 Y105.025 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395801
G1 F15000
M204 S6000
G1 X146.99 Y105.025 E.12281
G3 X153.574 Y109.671 I.007 J6.978 E.13102
G1 X153.782 Y110.371 E.01114
G1 X153.889 Y110.909 E.00836
G1 X153.953 Y111.452 E.00834
G1 X153.975 Y111.992 E.00823
G1 X153.97 Y144.274 E.49236
G1 X153.926 Y144.824 E.00842
G1 X153.782 Y145.628 E.01247
G1 X153.545 Y146.411 E.01247
G1 X153.334 Y146.921 E.00841
G1 X152.949 Y147.641 E.01246
G1 X152.643 Y148.1 E.00841
G1 X152.301 Y148.533 E.00841
G1 X151.735 Y149.122 E.01247
G1 X151.315 Y149.48 E.00841
G1 X150.647 Y149.945 E.01242
M73 P78 R2
G1 X150.167 Y150.215 E.0084
G1 X149.669 Y150.444 E.00836
G1 X149.152 Y150.635 E.0084
G1 X148.364 Y150.84 E.01241
G1 X147.82 Y150.927 E.00841
G1 X147.273 Y150.97 E.00836
G1 X109.01 Y150.975 E.58359
G3 X102.075 Y144.83 I-.006 J-6.979 E.15455
G1 X102.025 Y143.99 E.01283
G1 X102.025 Y112.01 E.48776
G3 X107.899 Y105.113 I6.979 J-.006 E.15038
G1 X108.452 Y105.047 E.0085
G1 X109.01 Y105.025 E.00851
G1 X117.062 Y105.025 E.12281
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.017 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/12
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.9 I.007 J1.217 P1  F42000
G1 X133.776 Y107.376 Z.9
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y107.008 E.00643
G1 X133.776 Y107.008 E.20172
G1 X133.776 Y107.316 E.00538
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z1 F42000
G1 X141.154 Y105.426 Z1
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I-.003 J-7.38 E.20251
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.018 J6.586 E.17999
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.576 J-.009 E.18006
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.014 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.005 J-6.163 E.15703
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.171 J.014 E.15697
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X107.614 Y151.664 I.022 J-7.966 E.02267
G3 X101.21 Y143.998 I1.388 J-7.667 E.17607
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y104.21 E.04709
G1 X134.19 Y104.21 E.20103
G1 X134.19 Y107.11 E.04709
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
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
M73 P79 R2
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X138.55 Y105.633 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.163 Y106.774 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X133.971 Y105.966 E.01855
G1 X133.971 Y105.403
G1 X132.599 Y106.774 E.03149
G1 X132.036 Y106.774
G1 X133.971 Y104.839 E.04444
G1 X133.817 Y104.429
G1 X131.472 Y106.774 E.05385
G1 X130.909 Y106.774
G1 X133.254 Y104.429 E.05385
G1 X132.69 Y104.429
G1 X130.345 Y106.774 E.05385
G1 X129.781 Y106.774
G1 X132.126 Y104.429 E.05385
G1 X131.563 Y104.429
G1 X129.218 Y106.774 E.05385
M73 P80 R2
G1 X128.654 Y106.774
G1 X130.999 Y104.429 E.05385
G1 X130.436 Y104.429
G1 X128.09 Y106.774 E.05385
G1 X127.527 Y106.774
G1 X129.872 Y104.429 E.05385
G1 X129.308 Y104.429
G1 X126.963 Y106.774 E.05385
G1 X126.4 Y106.774
G1 X128.745 Y104.429 E.05385
G1 X128.181 Y104.429
G1 X125.836 Y106.774 E.05385
G1 X125.272 Y106.774
G1 X127.617 Y104.429 E.05385
G1 X127.054 Y104.429
G1 X124.709 Y106.774 E.05385
G1 X124.145 Y106.774
G1 X126.49 Y104.429 E.05385
G1 X125.927 Y104.429
G1 X123.582 Y106.774 E.05385
G1 X123.018 Y106.774
G1 X125.363 Y104.429 E.05385
G1 X124.799 Y104.429
G1 X122.454 Y106.774 E.05385
G1 X122.029 Y106.636
G1 X124.236 Y104.429 E.05067
G1 X123.672 Y104.429
G1 X122.029 Y106.072 E.03773
G1 X122.029 Y105.509
G1 X123.109 Y104.429 E.02479
G1 X122.545 Y104.429
G1 X122.029 Y104.945 E.01185
; WIPE_START
M204 S6000
G1 X122.545 Y104.429 E-.27721
G1 X123.109 Y104.429 E-.21417
G1 X122.609 Y104.929 E-.26862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.017 Y107.45 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X117.417 Y107.45 E.04994
M204 S10000
G1 X117.583 Y107.583 F42000
; LINE_WIDTH: 0.1378
G1 F15000
M204 S6000
G1 X117.517 Y107.45 E.00071
; LINE_WIDTH: 0.0892913
G1 X117.45 Y107.317 E.00041
G1 X117.45 Y105.633 E.00465
M204 S10000
G1 X117.062 Y105.025 F42000
; LINE_WIDTH: 0.395773
G1 F15000
M204 S6000
G1 X108.727 Y105.03 E.12713
G1 X108.18 Y105.073 E.00836
G1 X107.764 Y105.137 E.00642
G1 X107.371 Y105.218 E.00612
G1 X106.845 Y105.366 E.00835
G1 X106.08 Y105.666 E.01253
G1 X105.356 Y106.053 E.01252
G1 X104.682 Y106.522 E.01252
G1 X104.068 Y107.068 E.01253
G1 X103.522 Y107.682 E.01252
G1 X103.053 Y108.356 E.01253
G1 X102.666 Y109.08 E.01252
G1 X102.366 Y109.845 E.01253
G1 X102.218 Y110.371 E.00835
G1 X102.111 Y110.909 E.00836
G1 X102.047 Y111.453 E.00834
G1 X102.025 Y112.01 E.00851
G1 X102.03 Y144.27 E.49199
G1 X102.111 Y145.095 E.01264
G1 X102.218 Y145.628 E.0083
G1 X102.366 Y146.155 E.00835
G1 X102.556 Y146.669 E.00835
G1 X102.784 Y147.163 E.0083
G1 X103.2 Y147.875 E.01258
G1 X103.696 Y148.53 E.01253
G1 X104.263 Y149.119 E.01247
G1 X104.685 Y149.48 E.00847
G1 X105.359 Y149.949 E.01253
G1 X106.079 Y150.334 E.01246
G1 X106.845 Y150.634 E.01254
G1 X107.639 Y150.841 E.01252
G1 X108.453 Y150.953 E.01252
G1 X109.01 Y150.975 E.00851
G1 X146.99 Y150.975 E.57922
G1 X147.551 Y150.953 E.00856
G1 X148.361 Y150.841 E.01247
G1 X148.893 Y150.713 E.00835
G1 X149.414 Y150.544 E.00836
G1 X149.92 Y150.334 E.00835
G1 X150.408 Y150.085 E.00836
G1 X150.875 Y149.799 E.00835
G1 X151.318 Y149.477 E.00835
G1 X151.735 Y149.122 E.00835
G1 X152.122 Y148.735 E.00836
G1 X152.477 Y148.318 E.00835
G1 X152.799 Y147.875 E.00836
G1 X153.086 Y147.408 E.00835
G1 X153.334 Y146.92 E.00835
G1 X153.544 Y146.415 E.00835
G1 X153.713 Y145.893 E.00837
G1 X153.841 Y145.361 E.00835
G1 X153.926 Y144.824 E.00829
G1 X153.975 Y143.99 E.01274
G1 X153.975 Y112.01 E.48772
G1 X153.953 Y111.449 E.00856
G1 X153.841 Y110.639 E.01247
G1 X153.632 Y109.841 E.01258
G1 X153.444 Y109.331 E.00829
G1 X153.216 Y108.837 E.0083
G1 X152.799 Y108.125 E.01258
G1 X152.304 Y107.47 E.01253
G1 X151.732 Y106.876 E.01257
G1 X151.318 Y106.523 E.0083
G1 X150.878 Y106.203 E.0083
G1 X150.166 Y105.785 E.01258
G1 X149.414 Y105.456 E.01252
G1 X148.893 Y105.287 E.00836
G1 X148.361 Y105.159 E.00835
G1 X147.82 Y105.073 E.00835
G1 X147.274 Y105.03 E.00836
G1 X138.938 Y105.025 E.12713
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X140.938 Y105.026 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/12
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I-.379 J-1.156 P1  F42000
G1 X133.776 Y107.376 Z1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y106.274 E.01926
G1 X133.776 Y106.274 E.20172
G1 X133.776 Y107.316 E.01821
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z1.1 F42000
G1 X141.154 Y105.426 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I.003 J7.38 E.20251
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.38 J.003 E.20251
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I-.003 J-7.38 E.20251
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.018 J6.586 E.17999
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.586 J-.018 E.17999
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.576 J.009 E.18006
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.005 J6.163 E.15703
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.014 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.013 J-6.171 E.15697
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.171 J.013 E.15697
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
M73 P81 R2
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.002 J7.794 E.19874
G1 X154.79 Y143.998 E.51955
G3 X154.664 Y145.386 I-7.966 J-.023 E.02267
G3 X146.998 Y151.79 I-7.68 J-1.403 E.176
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.002 J-7.794 E.19874
G1 X101.21 Y112.002 E.51955
G3 X101.336 Y110.614 I7.966 J.022 E.02267
G3 X102.123 Y108.344 I7.667 J1.387 E.03916
G3 X109.002 Y104.21 I6.881 J3.66 E.1369
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X134.19 Y105.86 E.20103
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.1
M73 P81 R1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X138.55 Y105.633 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
M204 S10000
M73 P82 R1
G1 X133.562 Y106.825 F42000
; LINE_WIDTH: 0.69588
G1 F10675.84
M204 S6000
G1 X122.438 Y106.825 E.30568
M204 S10000
G1 X122.017 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X117.417 Y107.45 E.04994
M204 S10000
G1 X117.583 Y107.583 F42000
; LINE_WIDTH: 0.1378
G1 F15000
M204 S6000
G1 X117.517 Y107.45 E.00071
; LINE_WIDTH: 0.0892913
G1 X117.45 Y107.317 E.00041
G1 X117.45 Y105.633 E.00465
M204 S10000
G1 X117.062 Y105.025 F42000
; LINE_WIDTH: 0.395773
G1 F15000
M204 S6000
G1 X108.727 Y105.03 E.12713
G1 X108.18 Y105.073 E.00836
G1 X107.639 Y105.159 E.00835
G1 X107.107 Y105.287 E.00835
G1 X106.586 Y105.456 E.00835
G1 X105.83 Y105.787 E.01258
G1 X105.356 Y106.053 E.00829
G1 X104.903 Y106.355 E.0083
G1 X104.265 Y106.878 E.01258
G1 X103.696 Y107.47 E.01252
G1 X103.2 Y108.125 E.01253
G1 X102.784 Y108.837 E.01257
G1 X102.556 Y109.331 E.0083
G1 X102.368 Y109.841 E.00829
G1 X102.159 Y110.639 E.01258
G1 X102.047 Y111.449 E.01247
G1 X102.025 Y112.01 E.00856
G1 X102.025 Y143.99 E.48772
G1 X102.074 Y144.824 E.01274
G1 X102.159 Y145.361 E.00829
G1 X102.287 Y145.893 E.00835
G1 X102.456 Y146.414 E.00836
G1 X102.666 Y146.92 E.00835
G1 X102.914 Y147.408 E.00835
G1 X103.2 Y147.875 E.00834
G1 X103.523 Y148.318 E.00836
G1 X103.878 Y148.735 E.00835
G1 X104.265 Y149.122 E.00835
G1 X104.682 Y149.477 E.00835
G1 X105.125 Y149.799 E.00836
G1 X105.592 Y150.086 E.00835
G1 X106.08 Y150.334 E.00835
G1 X106.585 Y150.544 E.00835
G1 X107.107 Y150.713 E.00836
G1 X107.639 Y150.841 E.00835
G1 X108.449 Y150.953 E.01247
G1 X109.01 Y150.975 E.00856
G1 X146.99 Y150.975 E.57922
G1 X147.547 Y150.953 E.00851
G1 X148.361 Y150.841 E.01252
G1 X149.155 Y150.634 E.01252
G1 X149.92 Y150.334 E.01253
G1 X150.641 Y149.949 E.01247
G1 X151.315 Y149.48 E.01252
G1 X151.737 Y149.119 E.00847
G1 X152.304 Y148.53 E.01247
G1 X152.799 Y147.875 E.01252
G1 X153.086 Y147.408 E.00835
G1 X153.333 Y146.923 E.0083
G1 X153.634 Y146.155 E.01259
G1 X153.782 Y145.628 E.00834
G1 X153.889 Y145.095 E.0083
G1 X153.97 Y144.27 E.01264
G1 X153.975 Y112.01 E.49199
G1 X153.953 Y111.452 E.00851
G1 X153.889 Y110.909 E.00834
G1 X153.782 Y110.371 E.00836
G1 X153.634 Y109.845 E.00835
G1 X153.334 Y109.08 E.01253
G1 X152.947 Y108.356 E.01252
G1 X152.478 Y107.682 E.01253
G1 X151.932 Y107.068 E.01253
G1 X151.318 Y106.523 E.01252
G1 X150.644 Y106.053 E.01253
G1 X149.92 Y105.666 E.01252
G1 X149.155 Y105.366 E.01253
G1 X148.628 Y105.218 E.00835
G1 X148.095 Y105.111 E.0083
G1 X147.274 Y105.03 E.01258
G1 X138.938 Y105.025 E.12713
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X140.938 Y105.026 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/12
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.1 I-.379 J-1.156 P1  F42000
M73 P83 R1
G1 X133.776 Y107.376 Z1.1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.20172
G1 X122.224 Y106.274 E.01926
G1 X133.776 Y106.274 E.20172
G1 X133.776 Y107.316 E.01821
; WIPE_START
G1 X131.777 Y107.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.257 Y105.811 Z1.2 F42000
G1 X141.154 Y105.426 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I.003 J7.38 E.20251
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.38 J.003 E.20251
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.38 J-.003 E.20251
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.009 J6.576 E.18006
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.586 J-.018 E.17999
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.576 J.009 E.18006
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.005 J6.163 E.15703
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.013 J-6.171 E.15697
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.163 J.005 E.15703
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.002 J7.794 E.19874
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X134.19 Y105.86 E.20103
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
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


G1 X138.55 Y105.633 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
M73 P84 R1
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
M204 S10000
G1 X133.562 Y106.825 F42000
; LINE_WIDTH: 0.69588
G1 F10675.84
M204 S6000
G1 X122.438 Y106.825 E.30568
M204 S10000
G1 X122.017 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X117.417 Y107.45 E.04994
M204 S10000
G1 X117.583 Y107.583 F42000
; LINE_WIDTH: 0.1378
G1 F15000
M204 S6000
G1 X117.517 Y107.45 E.00071
; LINE_WIDTH: 0.0892913
G1 X117.45 Y107.317 E.00041
G1 X117.45 Y105.633 E.00465
M204 S10000
G1 X117.062 Y105.025 F42000
; LINE_WIDTH: 0.395793
G1 F15000
M204 S6000
G1 X109.01 Y105.025 E.12281
G1 X108.17 Y105.075 E.01283
G2 X102.025 Y112.01 I.83 J6.925 E.15457
G1 X102.025 Y143.99 E.48775
G1 X102.047 Y144.548 E.00851
G1 X102.098 Y145.001 E.00696
G2 X109.01 Y150.975 I6.901 J-.999 E.15193
G1 X146.99 Y150.975 E.57925
G1 X147.82 Y150.927 E.01268
G1 X148.54 Y150.802 E.01115
G2 X153.975 Y143.99 I-1.542 J-6.805 E.14355
G1 X153.975 Y111.992 E.48803
G1 X153.927 Y111.184 E.01235
M73 P85 R1
G1 X153.842 Y110.643 E.00835
G1 X153.713 Y110.107 E.00841
G1 X153.544 Y109.585 E.00836
G1 X153.215 Y108.833 E.01252
G1 X152.799 Y108.125 E.01253
G1 X152.304 Y107.47 E.01252
G1 X151.737 Y106.881 E.01246
G1 X151.315 Y106.52 E.00847
G1 X150.641 Y106.051 E.01253
G1 X149.92 Y105.666 E.01246
G1 X149.155 Y105.366 E.01254
G1 X148.628 Y105.218 E.00834
G1 X148.095 Y105.111 E.0083
G1 X147.274 Y105.03 E.01258
G1 X138.938 Y105.025 E.12714
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X140.938 Y105.026 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/12
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I-1.071 J.577 P1  F42000
G1 X141.154 Y105.426 Z1.2
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.991 Y104.624 E.14436
G3 X154.376 Y112.006 I-.005 J7.391 E.20247
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.023 J6.59 E.17996
G1 X102.426 Y144.006 E.55894
G2 X108.991 Y150.574 I6.586 J-.018 E.17994
G1 X147.006 Y150.574 E.66375
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.997 Y150.16 E.61713
G3 X102.84 Y144.002 I.014 J-6.171 E.15696
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.176 J.018 E.15694
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.997 Y104.21 E.14106
G3 X154.79 Y112.002 I-.012 J7.805 E.19868
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X134.19 Y105.86 E.20103
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
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


G1 X138.55 Y105.633 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
M73 P86 R1
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; LINE_WIDTH: 0.312522
G1 X133.926 Y107.425 E.00074
; LINE_WIDTH: 0.361686
G1 X133.869 Y107.401 E.00086
; LINE_WIDTH: 0.41085
G1 X133.812 Y107.376 E.00099
; LINE_WIDTH: 0.480961
G1 X133.754 Y107.352 E.00117
G3 X133.753 Y106.067 I16.995 J-.66 E.02406
M204 S10000
G1 X133.495 Y106.724 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X132.85 Y106.079 E.01481
G1 X132.287 Y106.079
G1 X133.495 Y107.288 E.02775
G1 X133.215 Y107.571
G1 X131.723 Y106.079 E.03425
G1 X131.16 Y106.079
G1 X132.651 Y107.571 E.03425
G1 X131.997 Y107.48
G1 X130.596 Y106.079 E.03217
G1 X130.032 Y106.079
G1 X131.433 Y107.48 E.03217
G1 X130.87 Y107.48
G1 X129.469 Y106.079 E.03217
G1 X128.905 Y106.079
G1 X130.306 Y107.48 E.03217
G1 X129.743 Y107.48
G1 X128.342 Y106.079 E.03217
G1 X127.778 Y106.079
G1 X129.179 Y107.48 E.03217
G1 X128.615 Y107.48
M73 P87 R1
G1 X127.214 Y106.079 E.03217
G1 X126.651 Y106.079
G1 X128.052 Y107.48 E.03217
G1 X127.488 Y107.48
G1 X126.087 Y106.079 E.03217
G1 X125.524 Y106.079
G1 X126.925 Y107.48 E.03217
G1 X126.361 Y107.48
G1 X124.96 Y106.079 E.03217
G1 X124.396 Y106.079
G1 X125.797 Y107.48 E.03217
G1 X125.234 Y107.48
G1 X123.833 Y106.079 E.03217
G1 X123.269 Y106.079
G1 X124.67 Y107.48 E.03217
G1 X124.107 Y107.48
G1 X122.706 Y106.079 E.03217
G1 X122.505 Y106.442
G1 X123.634 Y107.571 E.02592
G1 X123.07 Y107.571
G1 X122.505 Y107.006 E.01298
M204 S10000
G1 X122.247 Y106.067 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.481976
G1 F15000
M204 S6000
G3 X122.246 Y107.352 I-16.997 J.625 E.02411
; LINE_WIDTH: 0.46
G1 X122.188 Y107.376 E.00111
; LINE_WIDTH: 0.41084
G1 X122.131 Y107.401 E.00099
; LINE_WIDTH: 0.36168
G1 X122.074 Y107.425 E.00086
; LINE_WIDTH: 0.288269
G1 X122.017 Y107.45 E.00068
G1 X117.417 Y107.45 E.05001
M204 S10000
G1 X117.583 Y107.583 F42000
; LINE_WIDTH: 0.1378
G1 F15000
M204 S6000
G1 X117.517 Y107.45 E.00071
; LINE_WIDTH: 0.0892913
G1 X117.45 Y107.317 E.00041
G1 X117.45 Y105.633 E.00465
M204 S10000
G1 X117.062 Y105.025 F42000
; LINE_WIDTH: 0.395792
G1 F15000
M204 S6000
G1 X109.01 Y105.025 E.12281
G1 X108.171 Y105.074 E.01282
G2 X102.025 Y112.01 I.829 J6.926 E.15459
G1 X102.03 Y144.27 E.49202
G1 X102.111 Y145.091 E.01258
G1 X102.287 Y145.893 E.01252
G1 X102.556 Y146.669 E.01253
G1 X102.882 Y147.347 E.01147
G2 X109.01 Y150.975 I6.122 J-3.351 E.11399
G1 X146.99 Y150.975 E.57925
G1 X147.829 Y150.925 E.01282
G2 X153.975 Y143.99 I-.833 J-6.929 E.15457
G1 X153.97 Y111.73 E.49202
G1 X153.889 Y110.909 E.01258
G1 X153.713 Y110.107 E.01252
G1 X153.444 Y109.331 E.01253
G1 X153.119 Y108.653 E.01146
G2 X146.986 Y105.025 I-6.123 J3.351 E.11406
G1 X138.938 Y105.025 E.12274
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X140.938 Y105.025 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/12
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.3 I-.158 J-1.207 P1  F42000
G1 X123.005 Y107.376 Z1.3
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.01365
G1 X122.224 Y106.274 E.01926
G1 X123.005 Y106.274 E.01365
G1 X123.005 Y107.316 E.01821
; WIPE_START
G1 X122.224 Y107.376 E-.298
G1 X122.224 Y106.274 E-.41912
G1 X122.336 Y106.274 E-.04288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.961 Y105.93 Z1.4 F42000
G1 X141.154 Y105.426 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.992 Y104.624 E.14437
G3 X154.376 Y112.006 I-.006 J7.391 E.20246
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.393 J-.01 E.20241
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.393 J.01 E.20241
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.021 J6.589 E.17997
G1 X102.426 Y144.006 E.55894
G2 X108.992 Y150.574 I6.586 J-.018 E.17996
G1 X147.006 Y150.574 E.66373
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.014 E.15697
G1 X108.997 Y150.16 E.61712
G3 X102.84 Y144.002 I.014 J-6.171 E.15696
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.175 J.017 E.15695
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
; WIPE_START
M204 S6000
G1 X138.79 Y105.84 E-.74135
G1 X138.839 Y105.84 E-.01865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.776 Y107.376 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X132.995 Y107.376 E.01365
G1 X132.995 Y106.274 E.01926
G1 X133.776 Y106.274 E.01365
G1 X133.776 Y107.316 E.01821
; WIPE_START
M73 P88 R1
G1 X132.995 Y107.376 E-.298
G1 X132.995 Y106.274 E-.41912
G1 X133.107 Y106.274 E-.04288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.31 Y107.11 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.997 Y104.21 E.14106
G3 X154.79 Y112.002 I-.012 J7.805 E.19867
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.807 J-.015 E.19864
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.807 J.015 E.19864
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X123.419 Y105.86 E.02613
G1 X123.419 Y107.71 E.03004
G1 X132.581 Y107.71 E.14877
G1 X132.581 Y105.86 E.03004
G1 X134.19 Y105.86 E.02613
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
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


G1 X138.55 Y105.633 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
; WIPE_START
G1 X135.983 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.938 Y105.025 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.395784
G1 F15000
M204 S6000
G1 X146.987 Y105.025 E.12276
G3 X153.109 Y108.635 I.009 J6.98 E.11373
M73 P89 R1
G1 X153.444 Y109.331 E.01178
G1 X153.713 Y110.107 E.01253
G1 X153.889 Y110.909 E.01252
G1 X153.97 Y111.727 E.01253
G1 X153.975 Y143.99 E.49206
G3 X148.901 Y150.711 I-6.975 J.01 E.13789
G1 X148.361 Y150.841 E.00847
G1 X147.824 Y150.926 E.00829
G1 X146.99 Y150.975 E.01274
G1 X109.01 Y150.975 E.57924
G3 X102.891 Y147.365 I-.006 J-6.98 E.11368
G1 X102.556 Y146.669 E.01178
G1 X102.287 Y145.893 E.01253
G1 X102.111 Y145.091 E.01252
G1 X102.03 Y144.273 E.01253
G1 X102.025 Y112.01 E.49206
G3 X108.173 Y105.074 I6.975 J-.01 E.1546
G1 X109.01 Y105.025 E.0128
G1 X117.062 Y105.025 E.1228
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X120.017 Y107.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/12
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.033 J1.217 P1  F42000
G1 X122.708 Y107.376 Z1.4
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.224 Y107.376 E.00846
G1 X122.224 Y106.274 E.01926
G1 X122.708 Y106.274 E.00846
G1 X122.708 Y107.316 E.01821
; WIPE_START
G1 X122.224 Y107.376 E-.18549
G1 X122.224 Y106.274 E-.41912
G1 X122.632 Y106.274 E-.15539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.257 Y105.925 Z1.5 F42000
G1 X141.154 Y105.426 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X138.724 Y105.426 E.04243
G1 X138.724 Y104.624 E.01402
G1 X146.994 Y104.624 E.1444
G3 X154.376 Y112.006 I-.008 J7.391 E.20243
G1 X154.376 Y143.994 E.55851
G3 X146.994 Y151.376 I-7.391 J-.008 E.20243
G1 X109.006 Y151.376 E.66327
G3 X101.624 Y143.994 I.008 J-7.391 E.20243
G1 X101.624 Y112.006 E.55851
G3 X109.006 Y104.624 I7.391 J.008 E.20243
G1 X117.276 Y104.624 E.1444
G1 X117.276 Y105.426 E.01402
G1 X108.994 Y105.426 E.14461
G2 X102.426 Y111.994 I.02 J6.588 E.17998
G1 X102.426 Y144.006 E.55894
G2 X108.994 Y150.574 I6.586 J-.018 E.17999
G1 X147.006 Y150.574 E.6637
G2 X153.574 Y144.006 I-.018 J-6.586 E.17999
G1 X153.574 Y111.994 E.55894
G2 X147.006 Y105.426 I-6.586 J.018 E.17999
G1 X141.214 Y105.426 E.10114
; WIPE_START
G1 X139.214 Y105.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.79 Y107.79 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.013 J-6.171 E.15697
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.174 J.016 E.15696
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
; WIPE_START
M204 S6000
M73 P90 R1
G1 X138.79 Y105.84 E-.74135
G1 X138.839 Y105.84 E-.01865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.776 Y107.376 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X133.292 Y107.376 E.00846
G1 X133.292 Y106.274 E.01926
G1 X133.776 Y106.274 E.00846
G1 X133.776 Y107.316 E.01821
; WIPE_START
G1 X133.292 Y107.376 E-.18549
G1 X133.292 Y106.274 E-.41912
G1 X133.701 Y106.274 E-.15539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.31 Y107.11 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.31 Y104.21 E.04709
G1 X146.998 Y104.21 E.14107
G3 X154.79 Y112.002 I-.013 J7.805 E.19866
G1 X154.79 Y143.998 E.51955
G3 X146.998 Y151.79 I-7.805 J-.013 E.19866
G1 X109.002 Y151.79 E.61698
G3 X101.21 Y143.998 I.013 J-7.805 E.19866
G1 X101.21 Y112.002 E.51955
G3 X109.002 Y104.21 I7.805 J.013 E.19866
G1 X117.69 Y104.21 E.14107
G1 X117.69 Y107.11 E.04709
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X123.121 Y105.86 E.0213
G1 X123.121 Y107.71 E.03004
G1 X132.879 Y107.71 E.15843
G1 X132.879 Y105.86 E.03004
M73 P90 R0
G1 X134.19 Y105.86 E.0213
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.291 Y105.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P91 R0
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


G1 X138.55 Y105.633 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
M204 S10000
G1 X133.534 Y107.162 F42000
; LINE_WIDTH: 0.0773602
G1 F15000
M204 S6000
G1 X133.534 Y106.488 E.00154
; WIPE_START
G1 X133.534 Y107.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.938 Y105.025 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.395788
G1 F15000
M204 S6000
G1 X146.99 Y105.025 E.12281
G3 X153.345 Y109.106 I.006 J6.98 E.12171
G1 X153.634 Y109.845 E.0121
G1 X153.84 Y110.636 E.01246
G1 X153.927 Y111.184 E.00846
G1 X153.975 Y111.988 E.01229
G1 X153.975 Y143.99 E.48808
G3 X147.554 Y150.953 I-6.979 J.007 E.15878
G1 X146.99 Y150.975 E.0086
G1 X109.01 Y150.975 E.57925
G3 X102.107 Y145.063 I-.01 J-6.974 E.15098
G1 X102.047 Y144.548 E.00791
G1 X102.025 Y143.99 E.00851
G1 X102.025 Y112.01 E.48774
G3 X108.174 Y105.074 I6.975 J-.01 E.15463
G1 X109.01 Y105.025 E.01277
G1 X117.062 Y105.025 E.12281
M204 S10000
G1 X117.45 Y105.633 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00465
G1 X117.517 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.417 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X122.017 Y107.45 E.04994
M204 S10000
G1 X122.466 Y107.162 F42000
; LINE_WIDTH: 0.0773602
M73 P92 R0
G1 F15000
M204 S6000
G1 X122.466 Y106.488 E.00154
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F15000
G1 X122.466 Y107.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/12
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S191.25
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.5 I-.047 J1.216 P1  F42000
G1 X138.79 Y107.79 Z1.5
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X138.79 Y105.84 E.03166
G1 X147.002 Y105.84 E.13335
G3 X153.16 Y111.998 I-.013 J6.171 E.15697
G1 X153.16 Y144.002 E.51968
G3 X147.002 Y150.16 I-6.171 J-.013 E.15697
G1 X108.998 Y150.16 E.61711
G3 X102.84 Y144.002 I.013 J-6.171 E.15697
G1 X102.84 Y111.998 E.51968
G3 X108.998 Y105.84 I6.172 J.014 E.15697
G1 X117.21 Y105.84 E.13335
G1 X117.21 Y107.79 E.03166
G1 X138.73 Y107.79 E.34944
M204 S250
G1 X138.31 Y107.11 F42000
G1 F3600
M204 S5000
G1 X138.31 Y104.248 E.04647
G1 X146.998 Y104.248 E.14107
G3 X154.752 Y112.002 I-.013 J7.766 E.19769
G1 X154.752 Y143.998 E.51955
G3 X146.998 Y151.752 I-7.756 J-.002 E.19776
G1 X109.002 Y151.752 E.61698
G3 X101.248 Y143.998 I.002 J-7.756 E.19776
G1 X101.248 Y112.002 E.51955
G3 X109.002 Y104.248 I7.756 J.002 E.19776
G1 X117.69 Y104.248 E.14107
G1 X117.69 Y107.11 E.04647
G1 X121.81 Y107.11 E.0669
G1 X121.81 Y105.86 E.0203
G1 X122.925 Y105.86 E.01811
G1 X122.925 Y107.71 E.03004
G1 X133.075 Y107.71 E.1648
G1 X133.075 Y105.86 E.03004
G1 X134.19 Y105.86 E.01811
G1 X134.19 Y107.11 E.0203
G1 X138.25 Y107.11 E.06593
; WIPE_START
M204 S6000
G1 X138.292 Y105.11 E-.76
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


G1 X138.55 Y105.633 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X138.55 Y107.317 E.00465
G1 X138.483 Y107.45 E.00041
; LINE_WIDTH: 0.1378
G1 X138.417 Y107.583 E.00071
M204 S10000
G1 X138.583 Y107.45 F42000
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X133.983 Y107.45 E.04994
M204 S10000
G1 X133.294 Y107.207 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X133.971 Y106.53 E.01555
G1 X133.858 Y106.079
G1 X133.294 Y106.643 E.01296
M204 S10000
G1 X133.784 Y107.416 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.287804
G1 F15000
M204 S6000
G1 X133.398 Y107.467 E.00423
; LINE_WIDTH: 0.254814
G1 X133.336 Y107.359 E.00118
; LINE_WIDTH: 0.224921
G1 X133.274 Y107.251 E.00103
M204 S10000
G1 X133.991 Y106.855 F42000
; LINE_WIDTH: 0.110973
G1 F15000
M204 S6000
G1 X133.274 Y107.572 E.0037
; WIPE_START
G1 X133.991 Y106.855 E-.76
; WIPE_END
M73 P93 R0
G1 E-.04 F1800
M204 S10000
G1 X126.36 Y107.011 Z1.6 F42000
G1 X122.706 Y107.086 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X122.236 Y107.556 E.0108
G1 X122.142 Y107.087
G1 X122.706 Y106.522 E.01296
G1 X122.586 Y106.079
G1 X122.029 Y106.636 E.01278
M204 S10000
G1 X122.017 Y107.45 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28794
G1 F15000
M204 S6000
G1 X117.417 Y107.45 E.04994
M204 S10000
G1 X117.517 Y107.45 F42000
; LINE_WIDTH: 0.1378
G1 F15000
M204 S6000
G1 X117.583 Y107.583 E.00071
M204 S10000
G1 X117.517 Y107.45 F42000
; LINE_WIDTH: 0.0892913
G1 F15000
M204 S6000
G1 X117.45 Y107.317 E.00041
G1 X117.45 Y105.633 E.00465
; WIPE_START
G1 X117.45 Y107.317 E-.69821
G1 X117.517 Y107.45 E-.06179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.573 Y113.168 Z1.6 F42000
G1 X153.372 Y147.998 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X150.985 Y150.386 E.05482
; WIPE_START
M204 S6000
G1 X152.399 Y148.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.834 Y150.973 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X153.963 Y146.843 E.09483
G1 X154.254 Y145.989
G1 X148.977 Y151.266 E.12118
G1 X148.258 Y151.421
G1 X150.11 Y149.57 E.04251
G1 X149.094 Y150.022
G1 X147.614 Y151.501 E.03398
G1 X147.026 Y151.527
G1 X148.318 Y150.234 E.02969
G1 X147.645 Y150.343
G1 X146.462 Y151.527 E.02717
G1 X145.898 Y151.527
G1 X147.051 Y150.374 E.02646
G1 X146.487 Y150.375
G1 X145.335 Y151.527 E.02645
G1 X144.771 Y151.527
G1 X145.923 Y150.375 E.02645
G1 X145.359 Y150.375
G1 X144.208 Y151.527 E.02645
G1 X143.644 Y151.527
G1 X144.796 Y150.375 E.02645
G1 X144.232 Y150.375
G1 X143.08 Y151.527 E.02645
G1 X142.517 Y151.527
G1 X143.668 Y150.375 E.02645
G1 X143.105 Y150.375
G1 X141.953 Y151.527 E.02645
G1 X141.39 Y151.527
G1 X142.541 Y150.375 E.02644
G1 X141.977 Y150.375
G1 X140.826 Y151.527 E.02644
G1 X140.262 Y151.527
G1 X141.414 Y150.375 E.02644
G1 X140.85 Y150.375
G1 X139.699 Y151.527 E.02644
G1 X139.135 Y151.527
G1 X140.286 Y150.375 E.02644
G1 X139.723 Y150.375
G1 X138.572 Y151.527 E.02644
G1 X138.008 Y151.527
G1 X139.159 Y150.375 E.02643
G1 X138.595 Y150.376
G1 X137.444 Y151.527 E.02643
G1 X136.881 Y151.527
G1 X138.032 Y150.376 E.02643
G1 X137.468 Y150.376
G1 X136.317 Y151.527 E.02643
G1 X135.754 Y151.527
G1 X136.904 Y150.376 E.02643
G1 X136.341 Y150.376
G1 X135.19 Y151.527 E.02643
G1 X134.626 Y151.527
G1 X135.777 Y150.376 E.02642
G1 X135.213 Y150.376
G1 X134.063 Y151.527 E.02642
G1 X133.499 Y151.527
G1 X134.65 Y150.376 E.02642
G1 X134.086 Y150.376
G1 X132.935 Y151.527 E.02642
G1 X132.372 Y151.527
G1 X133.522 Y150.376 E.02642
G1 X132.959 Y150.376
G1 X131.808 Y151.527 E.02642
G1 X131.245 Y151.527
G1 X132.395 Y150.376 E.02641
G1 X131.831 Y150.376
G1 X130.681 Y151.527 E.02641
G1 X130.117 Y151.527
G1 X131.268 Y150.376 E.02641
G1 X130.704 Y150.377
G1 X129.554 Y151.527 E.02641
G1 X128.99 Y151.527
G1 X130.14 Y150.377 E.02641
G1 X129.577 Y150.377
G1 X128.427 Y151.527 E.02641
G1 X127.863 Y151.527
M73 P94 R0
G1 X129.013 Y150.377 E.02641
G1 X128.449 Y150.377
G1 X127.299 Y151.527 E.0264
G1 X126.736 Y151.527
G1 X127.886 Y150.377 E.0264
G1 X127.322 Y150.377
G1 X126.172 Y151.527 E.0264
G1 X125.609 Y151.527
G1 X126.758 Y150.377 E.0264
G1 X126.195 Y150.377
G1 X125.045 Y151.527 E.0264
G1 X124.481 Y151.527
G1 X125.631 Y150.377 E.0264
G1 X125.067 Y150.377
G1 X123.918 Y151.527 E.02639
G1 X123.354 Y151.527
G1 X124.503 Y150.377 E.02639
G1 X123.94 Y150.377
G1 X122.791 Y151.527 E.02639
G1 X122.227 Y151.527
G1 X123.376 Y150.377 E.02639
G1 X122.812 Y150.377
G1 X121.663 Y151.527 E.02639
G1 X121.1 Y151.527
G1 X122.249 Y150.378 E.02639
G1 X121.685 Y150.378
G1 X120.536 Y151.527 E.02638
G1 X119.973 Y151.527
G1 X121.121 Y150.378 E.02638
G1 X120.558 Y150.378
G1 X119.409 Y151.527 E.02638
G1 X118.845 Y151.527
G1 X119.994 Y150.378 E.02638
G1 X119.43 Y150.378
G1 X118.282 Y151.527 E.02638
G1 X117.718 Y151.527
G1 X118.867 Y150.378 E.02638
G1 X118.303 Y150.378
G1 X117.154 Y151.527 E.02638
G1 X116.591 Y151.527
G1 X117.739 Y150.378 E.02637
G1 X117.176 Y150.378
G1 X116.027 Y151.527 E.02637
G1 X115.464 Y151.527
G1 X116.612 Y150.378 E.02637
G1 X116.048 Y150.378
G1 X114.9 Y151.527 E.02637
G1 X114.336 Y151.527
G1 X115.485 Y150.378 E.02637
G1 X114.921 Y150.378
G1 X113.773 Y151.527 E.02637
G1 X113.209 Y151.527
G1 X114.357 Y150.379 E.02636
G1 X113.794 Y150.379
G1 X112.646 Y151.527 E.02636
G1 X112.082 Y151.527
G1 X113.23 Y150.379 E.02636
G1 X112.666 Y150.379
G1 X111.518 Y151.527 E.02636
G1 X110.955 Y151.527
G1 X112.103 Y150.379 E.02636
G1 X111.539 Y150.379
G1 X110.391 Y151.527 E.02636
G1 X109.828 Y151.527
G1 X110.975 Y150.379 E.02635
G1 X110.412 Y150.379
G1 X109.264 Y151.527 E.02635
G1 X108.701 Y151.526
G1 X109.848 Y150.379 E.02634
G1 X109.284 Y150.379
G1 X108.188 Y151.475 E.02518
G1 X107.687 Y151.413
G1 X108.736 Y150.364 E.02408
G1 X108.208 Y150.328
G1 X107.219 Y151.317 E.0227
G1 X106.787 Y151.186
G1 X107.724 Y150.249 E.02152
G1 X107.277 Y150.132
G1 X106.358 Y151.051 E.02111
G1 X105.966 Y150.88
G1 X106.846 Y150 E.02021
G1 X106.444 Y149.838
G1 X105.574 Y150.708 E.01996
G1 X105.219 Y150.499
G1 X106.064 Y149.654 E.01941
G1 X105.7 Y149.454
G1 X104.864 Y150.291 E.01922
G1 X104.536 Y150.055
G1 X105.358 Y149.233 E.01888
G1 X105.033 Y148.994
G1 X104.215 Y149.813 E.01879
G1 X103.918 Y149.546
G1 X104.734 Y148.729 E.01875
G1 X104.441 Y148.459
G1 X103.627 Y149.273 E.0187
G1 X103.362 Y148.975
G1 X104.17 Y148.166 E.01857
G1 X103.92 Y147.853
G1 X103.097 Y148.676 E.01891
G1 X102.858 Y148.351
G1 X103.687 Y147.522 E.01904
G1 X103.474 Y147.172
G1 X102.632 Y148.014 E.01933
G1 X102.419 Y147.663
G1 X103.278 Y146.804 E.01972
G1 X103.105 Y146.413
G1 X102.229 Y147.29 E.02013
G1 X102.055 Y146.9
G1 X102.947 Y146.008 E.02048
G1 X102.82 Y145.571
G1 X101.897 Y146.495 E.02121
G1 X101.758 Y146.069
G1 X102.721 Y145.106 E.02211
G1 X102.66 Y144.604
G1 X101.648 Y145.616 E.02325
G1 X101.56 Y145.14
G1 X102.626 Y144.075 E.02446
G1 X102.625 Y143.511
G1 X101.5 Y144.637 E.02584
G1 X101.473 Y144.1
G1 X102.625 Y142.948 E.02645
G1 X102.625 Y142.384
G1 X101.473 Y143.536 E.02645
G1 X101.473 Y142.973
G1 X102.625 Y141.821 E.02645
G1 X102.625 Y141.257
G1 X101.473 Y142.409 E.02646
G1 X101.473 Y141.846
G1 X102.625 Y140.694 E.02646
G1 X102.625 Y140.13
G1 X101.473 Y141.282 E.02646
G1 X101.473 Y140.719
G1 X102.625 Y139.567 E.02646
G1 X102.625 Y139.003
G1 X101.473 Y140.155 E.02646
G1 X101.473 Y139.592
G1 X102.625 Y138.44 E.02646
G1 X102.625 Y137.876
G1 X101.472 Y139.028 E.02646
G1 X101.472 Y138.465
G1 X102.625 Y137.313 E.02646
G1 X102.624 Y136.749
G1 X101.472 Y137.901 E.02646
G1 X101.472 Y137.338
G1 X102.624 Y136.186 E.02646
G1 X102.624 Y135.622
G1 X101.472 Y136.774 E.02646
G1 X101.472 Y136.211
G1 X102.624 Y135.059 E.02646
G1 X102.624 Y134.495
G1 X101.472 Y135.647 E.02646
G1 X101.472 Y135.084
G1 X102.624 Y133.931 E.02646
G1 X102.624 Y133.368
G1 X101.472 Y134.52 E.02646
G1 X101.471 Y133.957
G1 X102.624 Y132.804 E.02646
G1 X102.624 Y132.241
G1 X101.471 Y133.393 E.02646
G1 X101.471 Y132.83
G1 X102.624 Y131.677 E.02646
G1 X102.624 Y131.114
G1 X101.471 Y132.266 E.02646
G1 X101.471 Y131.703
G1 X102.624 Y130.55 E.02647
G1 X102.623 Y129.987
G1 X101.471 Y131.139 E.02647
G1 X101.471 Y130.576
G1 X102.623 Y129.423 E.02647
G1 X102.623 Y128.86
G1 X101.471 Y130.012 E.02647
G1 X101.471 Y129.449
G1 X102.623 Y128.296 E.02647
G1 X102.623 Y127.733
G1 X101.471 Y128.885 E.02647
G1 X101.47 Y128.322
G1 X102.623 Y127.169 E.02647
G1 X102.623 Y126.606
G1 X101.47 Y127.758 E.02647
G1 X101.47 Y127.195
G1 X102.623 Y126.042 E.02647
G1 X102.623 Y125.479
G1 X101.47 Y126.631 E.02647
G1 X101.47 Y126.068
G1 X102.623 Y124.915 E.02647
M73 P95 R0
G1 X102.623 Y124.352
G1 X101.47 Y125.504 E.02647
G1 X101.47 Y124.941
G1 X102.623 Y123.788 E.02647
G1 X102.622 Y123.225
G1 X101.47 Y124.377 E.02647
G1 X101.47 Y123.814
G1 X102.622 Y122.661 E.02647
G1 X102.622 Y122.097
G1 X101.469 Y123.25 E.02647
G1 X101.469 Y122.687
G1 X102.622 Y121.534 E.02647
G1 X102.622 Y120.97
G1 X101.469 Y122.123 E.02647
G1 X101.469 Y121.56
G1 X102.622 Y120.407 E.02647
G1 X102.622 Y119.843
G1 X101.469 Y120.996 E.02647
G1 X101.469 Y120.433
G1 X102.622 Y119.28 E.02648
G1 X102.622 Y118.716
G1 X101.469 Y119.869 E.02648
G1 X101.469 Y119.306
G1 X102.622 Y118.153 E.02648
G1 X102.622 Y117.589
G1 X101.469 Y118.742 E.02648
G1 X101.469 Y118.179
G1 X102.622 Y117.026 E.02648
G1 X102.621 Y116.462
G1 X101.468 Y117.615 E.02648
G1 X101.468 Y117.052
G1 X102.621 Y115.899 E.02648
G1 X102.621 Y115.335
G1 X101.468 Y116.488 E.02648
G1 X101.468 Y115.925
G1 X102.621 Y114.772 E.02648
G1 X102.621 Y114.208
G1 X101.468 Y115.361 E.02648
G1 X101.468 Y114.798
G1 X102.621 Y113.645 E.02648
G1 X102.621 Y113.081
G1 X101.468 Y114.234 E.02648
G1 X101.468 Y113.671
G1 X102.621 Y112.518 E.02648
G1 X102.623 Y111.952
G1 X101.468 Y113.107 E.02654
G1 X101.467 Y112.544
G1 X102.659 Y111.353 E.02735
G1 X102.759 Y110.688
G1 X101.468 Y111.979 E.02964
G1 X101.493 Y111.391
G1 X102.99 Y109.894 E.03437
G1 X103.442 Y108.878
G1 X101.576 Y110.745 E.04287
; WIPE_START
M204 S6000
G1 X102.99 Y109.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.363 Y107.356 Z1.6 F42000
G1 X116.845 Y105.621 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X117.471 Y104.995 E.01438
G1 X117.434 Y104.467
G1 X116.281 Y105.621 E.02649
G1 X115.717 Y105.621
G1 X116.871 Y104.467 E.02649
G1 X116.307 Y104.467
G1 X115.154 Y105.621 E.02649
G1 X114.59 Y105.621
G1 X115.744 Y104.467 E.02649
G1 X115.18 Y104.467
G1 X114.027 Y105.621 E.02649
G1 X113.463 Y105.621
G1 X114.616 Y104.467 E.02649
G1 X114.053 Y104.467
G1 X112.899 Y105.621 E.02649
G1 X112.336 Y105.621
G1 X113.489 Y104.467 E.02649
G1 X112.925 Y104.467
G1 X111.772 Y105.621 E.02649
G1 X111.208 Y105.621
G1 X112.362 Y104.467 E.02649
G1 X111.798 Y104.467
G1 X110.645 Y105.621 E.02649
G1 X110.081 Y105.621
G1 X111.235 Y104.467 E.02649
G1 X110.671 Y104.467
G1 X109.518 Y105.621 E.02649
G1 X108.952 Y105.623
G1 X110.107 Y104.467 E.02654
G1 X109.544 Y104.467
G1 X108.353 Y105.659 E.02735
G1 X107.688 Y105.759
G1 X108.978 Y104.469 E.02963
G1 X108.38 Y104.504
G1 X106.906 Y105.978 E.03383
G1 X105.878 Y106.442
G1 X107.732 Y104.588 E.04257
G1 X107.018 Y104.739
G1 X101.746 Y110.011 E.12107
G1 X102.037 Y109.156
G1 X106.173 Y105.021 E.09497
; WIPE_START
M204 S6000
G1 X104.758 Y106.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.015 Y105.615 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X102.602 Y108.027 E.0554
; WIPE_START
M204 S6000
G1 X104.017 Y106.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.878 Y111.502 Z1.6 F42000
G1 X152.57 Y147.11 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X154.424 Y145.255 E.04259
G1 X154.494 Y144.622
G1 X153.011 Y146.105 E.03407
G1 X153.241 Y145.311
G1 X154.527 Y144.026 E.02953
G1 X154.527 Y143.462
G1 X153.341 Y144.647 E.02722
G1 X153.377 Y144.048
G1 X154.527 Y142.898 E.0264
G1 X154.527 Y142.335
G1 X153.379 Y143.482 E.02635
G1 X153.379 Y142.919
G1 X154.527 Y141.771 E.02635
G1 X154.527 Y141.208
G1 X153.379 Y142.355 E.02635
G1 X153.379 Y141.792
G1 X154.527 Y140.644 E.02636
G1 X154.527 Y140.08
G1 X153.379 Y141.228 E.02636
G1 X153.379 Y140.665
G1 X154.527 Y139.517 E.02636
G1 X154.527 Y138.953
G1 X153.379 Y140.101 E.02636
G1 X153.379 Y139.538
G1 X154.527 Y138.39 E.02636
G1 X154.527 Y137.826
G1 X153.378 Y138.974 E.02637
G1 X153.378 Y138.411
G1 X154.527 Y137.262 E.02637
G1 X154.527 Y136.699
G1 X153.378 Y137.847 E.02637
G1 X153.378 Y137.284
G1 X154.527 Y136.135 E.02637
G1 X154.527 Y135.572
G1 X153.378 Y136.72 E.02637
G1 X153.378 Y136.156
G1 X154.527 Y135.008 E.02637
G1 X154.527 Y134.444
G1 X153.378 Y135.593 E.02638
G1 X153.378 Y135.029
G1 X154.527 Y133.881 E.02638
G1 X154.527 Y133.317
G1 X153.378 Y134.466 E.02638
G1 X153.378 Y133.902
G1 X154.527 Y132.754 E.02638
G1 X154.527 Y132.19
G1 X153.378 Y133.339 E.02638
G1 X153.378 Y132.775
G1 X154.527 Y131.626 E.02639
G1 X154.527 Y131.063
G1 X153.377 Y132.212 E.02639
G1 X153.377 Y131.648
G1 X154.527 Y130.499 E.02639
M73 P96 R0
G1 X154.527 Y129.935
G1 X153.377 Y131.085 E.02639
G1 X153.377 Y130.521
G1 X154.527 Y129.372 E.02639
G1 X154.527 Y128.808
G1 X153.377 Y129.958 E.0264
G1 X153.377 Y129.394
G1 X154.527 Y128.245 E.0264
G1 X154.527 Y127.681
G1 X153.377 Y128.831 E.0264
G1 X153.377 Y128.267
G1 X154.527 Y127.117 E.0264
G1 X154.527 Y126.554
G1 X153.377 Y127.704 E.0264
G1 X153.377 Y127.14
G1 X154.527 Y125.99 E.02641
G1 X154.527 Y125.427
G1 X153.377 Y126.577 E.02641
G1 X153.377 Y126.013
G1 X154.527 Y124.863 E.02641
G1 X154.527 Y124.299
G1 X153.376 Y125.45 E.02641
G1 X153.376 Y124.886
G1 X154.527 Y123.736 E.02641
G1 X154.527 Y123.172
G1 X153.376 Y124.322 E.02641
G1 X153.376 Y123.759
G1 X154.527 Y122.609 E.02642
G1 X154.527 Y122.045
G1 X153.376 Y123.195 E.02642
G1 X153.376 Y122.632
G1 X154.527 Y121.481 E.02642
G1 X154.527 Y120.918
G1 X153.376 Y122.068 E.02642
G1 X153.376 Y121.505
G1 X154.527 Y120.354 E.02642
G1 X154.527 Y119.791
G1 X153.376 Y120.941 E.02643
G1 X153.376 Y120.378
G1 X154.527 Y119.227 E.02643
G1 X154.527 Y118.663
G1 X153.376 Y119.814 E.02643
G1 X153.376 Y119.251
G1 X154.527 Y118.1 E.02643
G1 X154.527 Y117.536
G1 X153.375 Y118.687 E.02643
G1 X153.375 Y118.124
G1 X154.527 Y116.973 E.02644
G1 X154.527 Y116.409
G1 X153.375 Y117.56 E.02644
G1 X153.375 Y116.997
G1 X154.527 Y115.845 E.02644
G1 X154.527 Y115.282
G1 X153.375 Y116.433 E.02644
G1 X153.375 Y115.87
G1 X154.527 Y114.718 E.02644
G1 X154.527 Y114.155
G1 X153.375 Y115.306 E.02645
G1 X153.375 Y114.743
G1 X154.527 Y113.591 E.02645
G1 X154.527 Y113.027
G1 X153.375 Y114.179 E.02645
G1 X153.375 Y113.616
G1 X154.527 Y112.464 E.02645
G1 X154.527 Y111.9
G1 X153.375 Y113.052 E.02645
G1 X153.375 Y112.488
G1 X154.5 Y111.363 E.02584
G1 X154.44 Y110.86
G1 X153.374 Y111.925 E.02446
G1 X153.34 Y111.396
G1 X154.352 Y110.383 E.02325
G1 X154.242 Y109.931
G1 X153.279 Y110.893 E.0221
G1 X153.18 Y110.429
G1 X154.103 Y109.505 E.02121
G1 X153.945 Y109.1
G1 X153.053 Y109.992 E.02048
G1 X152.895 Y109.587
G1 X153.771 Y108.71 E.02013
G1 X153.581 Y108.337
G1 X152.724 Y109.194 E.01967
G1 X152.53 Y108.824
G1 X153.368 Y107.986 E.01924
G1 X153.142 Y107.649
G1 X152.315 Y108.475 E.01898
G1 X152.075 Y108.152
G1 X152.903 Y107.324 E.01902
G1 X152.638 Y107.025
G1 X151.83 Y107.834 E.01857
G1 X151.559 Y107.541
G1 X152.373 Y106.727 E.0187
G1 X152.08 Y106.456
G1 X151.27 Y107.266 E.01861
G1 X150.964 Y107.008
G1 X151.782 Y106.191 E.01878
G1 X151.463 Y105.946
G1 X150.642 Y106.767 E.01886
G1 X150.302 Y106.544
G1 X151.131 Y105.714 E.01905
G1 X150.785 Y105.497
G1 X149.934 Y106.347 E.01952
G1 X149.556 Y106.162
G1 X150.417 Y105.301 E.01977
G1 X150.039 Y105.115
G1 X149.151 Y106.003 E.02039
G1 X148.727 Y105.864
G1 X149.634 Y104.957 E.02084
G1 X149.219 Y104.808
G1 X148.27 Y105.757 E.0218
G1 X147.792 Y105.672
G1 X148.772 Y104.692 E.02252
G1 X148.31 Y104.59
G1 X147.273 Y105.627 E.02381
G1 X146.711 Y105.625
G1 X147.815 Y104.522 E.02534
G1 X147.294 Y104.479
G1 X146.148 Y105.625 E.02631
G1 X145.585 Y105.625
G1 X146.742 Y104.467 E.02657
G1 X146.178 Y104.467
G1 X145.021 Y105.624 E.02657
G1 X144.458 Y105.624
G1 X145.615 Y104.467 E.02656
G1 X145.051 Y104.467
G1 X143.895 Y105.624 E.02655
G1 X143.332 Y105.623
G1 X144.487 Y104.467 E.02654
G1 X143.924 Y104.467
G1 X142.768 Y105.623 E.02654
G1 X142.205 Y105.623
G1 X143.36 Y104.467 E.02653
G1 X142.797 Y104.467
G1 X141.642 Y105.622 E.02652
G1 X141.078 Y105.622
G1 X142.233 Y104.467 E.02652
G1 X141.669 Y104.467
G1 X140.515 Y105.622 E.02651
G1 X139.952 Y105.621
G1 X141.106 Y104.467 E.0265
G1 X140.542 Y104.467
G1 X139.388 Y105.621 E.02649
G1 X138.825 Y105.621
G1 X139.979 Y104.467 E.02649
G1 X139.415 Y104.467
G1 X138.529 Y105.353 E.02034
; WIPE_START
M204 S6000
G1 X139.415 Y104.467 E-.47602
G1 X139.979 Y104.467 E-.21417
G1 X139.849 Y104.597 E-.06981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.164 Y111.87 Z1.6 F42000
G1 X153.084 Y146.179 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0846991
G1 F15000
M204 S6000
G3 X152.862 Y146.507 I-5.875 J-3.74 E.00102
M204 S10000
G1 X152.634 Y147.174 F42000
; LINE_WIDTH: 0.191315
G1 F15000
M204 S6000
G1 X152.482 Y147.368 E.00171
; LINE_WIDTH: 0.144372
G1 X152.326 Y147.565 E.00126
; LINE_WIDTH: 0.107826
G1 X152.195 Y147.715 E.0007
; LINE_WIDTH: 0.0821309
G1 X152.065 Y147.865 E.00049
; WIPE_START
G1 X152.195 Y147.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.723 Y147.393 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0703693
G1 F15000
M204 S6000
G1 X153.707 Y147.417 E.00006
; LINE_WIDTH: 0.0950536
G1 X153.574 Y147.589 E.00065
; LINE_WIDTH: 0.142233
G1 X153.441 Y147.762 E.00107
; LINE_WIDTH: 0.189412
G1 X153.308 Y147.934 E.00149
; WIPE_START
G1 X153.441 Y147.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.834 Y149.096 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0822772
G1 F15000
M204 S6000
G1 X150.698 Y149.212 E.00044
; LINE_WIDTH: 0.108547
G1 X150.56 Y149.33 E.00065
; LINE_WIDTH: 0.145159
G1 X150.367 Y149.482 E.00124
; LINE_WIDTH: 0.191428
G1 X150.174 Y149.634 E.0017
; WIPE_START
M73 P97 R0
G1 X150.367 Y149.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.92 Y150.321 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.201119
G1 F15000
M204 S6000
G1 X150.789 Y150.425 E.00123
; LINE_WIDTH: 0.17312
G1 X150.657 Y150.529 E.00104
; LINE_WIDTH: 0.136664
G1 X150.531 Y150.621 E.00073
; LINE_WIDTH: 0.0917471
G1 X150.405 Y150.712 E.00045
M204 S10000
G1 X149.768 Y150.907 F42000
; LINE_WIDTH: 0.174523
G1 F15000
M204 S6000
G1 X149.427 Y151.135 E.00256
; WIPE_START
G1 X149.768 Y150.907 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.356 Y150.35 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.105225
G1 F15000
M204 S6000
G1 X147.127 Y150.451 E.00086
; WIPE_START
G1 X147.356 Y150.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.768 Y149.531 Z1.6 F42000
G1 X102.813 Y145.539 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0822419
G1 F15000
M204 S6000
G3 X102.725 Y145.384 I3.874 J-2.305 E.00044
; WIPE_START
G1 X102.813 Y145.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.783 Y137.906 Z1.6 F42000
G1 X102.666 Y108.09 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.190427
G1 F15000
M204 S6000
G1 X102.542 Y108.254 E.00141
; LINE_WIDTH: 0.14313
G1 X102.418 Y108.417 E.00102
; LINE_WIDTH: 0.0958328
G1 X102.295 Y108.581 E.00062
; LINE_WIDTH: 0.0707312
G1 X102.277 Y108.607 E.00006
; WIPE_START
G1 X102.295 Y108.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.915 Y108.154 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.086892
G1 F15000
M204 S6000
G1 X103.782 Y108.313 E.00055
; LINE_WIDTH: 0.122106
G1 X103.649 Y108.473 E.00085
; LINE_WIDTH: 0.157975
G1 X103.511 Y108.638 E.0012
; LINE_WIDTH: 0.193791
G1 X103.378 Y108.814 E.00155
; WIPE_START
G1 X103.511 Y108.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.814 Y106.378 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.193598
G1 F15000
M204 S6000
G1 X105.634 Y106.513 E.00158
; LINE_WIDTH: 0.151091
G1 X105.44 Y106.673 E.00133
; LINE_WIDTH: 0.101431
G1 X105.243 Y106.835 E.00083
; LINE_WIDTH: 0.0729374
G1 X105.17 Y106.901 E.00021
; WIPE_START
G1 X105.243 Y106.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.582 Y105.301 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.09187
G1 F15000
M204 S6000
G1 X105.462 Y105.387 E.00042
; LINE_WIDTH: 0.137032
G1 X105.341 Y105.472 E.0007
; LINE_WIDTH: 0.173481
G1 X105.21 Y105.576 E.00103
; LINE_WIDTH: 0.201241
G1 X105.079 Y105.679 E.00122
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X105.21 Y105.576 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
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
G1 Z1.6 F900 ; lower z a little
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

    G1 Z101.2 F600
    G1 Z99.2

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

