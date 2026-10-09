; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 5m 20s; total estimated time: 12m 7s
; total layer number: 77
; total filament length [mm] : 55.13
; total filament volume [cm^3] : 132.61
; total filament weight [g] : 0.16
; model label id: 47,58
; object max height: 7.70,7.70
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 7.70
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
; brim_type = outer_only
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
; different_settings_to_system = enable_prime_tower;;
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
; enable_prime_tower = 0
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
; filament_colour = #DCDDDD
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
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
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
M73 P0 R12
M201 X12000 Y12000 Z1500 E5000
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
M73 P1 R12
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
M73 P1 R11
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
M73 P4 R11
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P6 R11
G1 X-48.2 F3000
M73 P8 R11
G1 X-28.5 F30000 ;wipe and shake
M73 P9 R11
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
M73 P9 R10
    G1 X-48.2 F3000
M73 P12 R10
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
    
M73 P13 R10
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

M73 P14 R10
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
M73 P50 R6
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
M73 P50 R5
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
M73 P51 R5
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
    G29 A1 X113.043 Y122.672 I29.9139 J9.95648
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
; layer num/total_layer_count: 1/77
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X134.214 Y124.135 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
M73 P53 R5
G1 F1500
M204 S500
G1 X134.635 Y123.738 E.0113
G1 X135.116 Y123.414 E.0113
G1 X135.664 Y123.161 E.01177
G1 X136.219 Y122.994 E.01129
G1 X136.991 Y122.911 E.01515
G1 X138.969 Y122.911 E.03856
G1 X139.556 Y122.959 E.01149
G1 X140.122 Y123.098 E.01136
G1 X140.518 Y123.256 E.00831
G1 X141.033 Y123.533 E.01141
M73 P55 R5
G1 X141.493 Y123.885 E.0113
G1 X141.891 Y124.307 E.0113
G1 X142.216 Y124.788 E.01133
G1 X142.429 Y125.236 E.00967
G1 X142.635 Y125.891 E.0134
G1 X142.718 Y126.663 E.01513
G1 X142.718 Y128.64 E.03856
G1 X142.67 Y129.228 E.01149
G1 X142.53 Y129.793 E.01136
G1 X142.373 Y130.189 E.00831
G1 X142.096 Y130.705 E.01141
G1 X141.744 Y131.165 E.0113
G1 X141.322 Y131.562 E.0113
G1 X140.841 Y131.887 E.01133
G1 X140.393 Y132.1 E.00967
G1 X139.737 Y132.307 E.0134
G1 X138.966 Y132.389 E.01513
G1 X136.988 Y132.389 E.03856
G1 X136.401 Y132.341 E.01149
G1 X135.836 Y132.202 E.01136
G1 X135.44 Y132.044 E.00831
G1 X134.924 Y131.767 E.01141
G1 X134.464 Y131.415 E.0113
M73 P56 R5
G1 X134.067 Y130.993 E.0113
G1 X133.742 Y130.512 E.01133
G1 X133.529 Y130.064 E.00967
G1 X133.322 Y129.409 E.0134
G1 X133.24 Y128.637 E.01512
G1 X133.24 Y126.66 E.03856
G1 X133.287 Y126.072 E.01149
G1 X133.427 Y125.507 E.01136
G1 X133.585 Y125.111 E.00831
G1 X133.861 Y124.595 E.01141
G1 X134.177 Y124.183 E.01013
M204 S6000
G1 X134.558 Y124.475 F42000
G1 F1500
M204 S500
G1 X134.578 Y124.449 E.00064
G1 X134.927 Y124.121 E.00933
G1 X135.342 Y123.839 E.00978
G1 X135.825 Y123.614 E.0104
G1 X136.327 Y123.463 E.01022
G1 X137.009 Y123.39 E.01337
G1 X138.956 Y123.39 E.03795
G1 X139.467 Y123.431 E.01001
G1 X139.966 Y123.553 E.01
G1 X140.323 Y123.694 E.00749
G1 X140.763 Y123.93 E.00974
G1 X141.162 Y124.234 E.00978
G1 X141.508 Y124.598 E.00978
G1 X141.804 Y125.036 E.0103
G1 X141.985 Y125.421 E.0083
G1 X142.16 Y125.976 E.01135
G1 X142.238 Y126.681 E.01382
G1 X142.239 Y128.627 E.03794
G1 X142.193 Y129.162 E.01047
G1 X142.07 Y129.656 E.00993
G1 X141.934 Y129.994 E.00711
G1 X141.698 Y130.434 E.00974
G1 X141.379 Y130.851 E.01023
G1 X141.012 Y131.194 E.00978
G1 X140.612 Y131.464 E.00943
G1 X140.208 Y131.656 E.00872
G1 X139.625 Y131.837 E.0119
G1 X138.933 Y131.91 E.01357
G1 X137.002 Y131.91 E.03765
G1 X136.467 Y131.865 E.01047
G1 X135.973 Y131.741 E.00993
G1 X135.635 Y131.606 E.00711
G1 X135.194 Y131.37 E.00974
G1 X134.778 Y131.05 E.01023
G1 X134.435 Y130.684 E.00978
G1 X134.164 Y130.283 E.00943
G1 X133.972 Y129.879 E.00872
G1 X133.791 Y129.296 E.0119
G1 X133.718 Y128.604 E.01356
G1 X133.719 Y126.673 E.03765
G1 X133.764 Y126.138 E.01046
G1 X133.887 Y125.644 E.00993
G1 X134.023 Y125.306 E.00711
G1 X134.259 Y124.866 E.00974
G1 X134.522 Y124.523 E.00843
M204 S6000
G1 X134.902 Y124.814 F42000
G1 F1500
M204 S500
G1 X134.928 Y124.78 E.00082
G1 X135.219 Y124.503 E.00784
G1 X135.589 Y124.251 E.00872
G1 X136.006 Y124.059 E.00894
G1 X136.435 Y123.933 E.00874
G1 X137.027 Y123.87 E.0116
G1 X138.942 Y123.869 E.03733
G1 X139.38 Y123.904 E.00856
G1 X139.81 Y124.008 E.00864
G1 X140.128 Y124.133 E.00666
G1 X140.513 Y124.341 E.00853
G1 X140.833 Y124.585 E.00784
G1 X141.125 Y124.89 E.00825
G1 X141.38 Y125.264 E.00882
G1 X141.534 Y125.587 E.00698
G1 X141.691 Y126.089 E.01026
G1 X141.759 Y126.699 E.01197
G1 X141.76 Y128.6 E.03707
G1 X141.717 Y129.094 E.00966
G1 X141.616 Y129.498 E.00812
G1 X141.503 Y129.784 E.00599
G1 X141.288 Y130.183 E.00885
G1 X141.031 Y130.519 E.00824
G1 X140.722 Y130.81 E.00828
G1 X140.382 Y131.042 E.008
G1 X140.043 Y131.205 E.00736
G1 X139.541 Y131.362 E.01024
G1 X138.9 Y131.432 E.01257
G1 X137.016 Y131.431 E.03673
G1 X136.535 Y131.388 E.00943
G1 X136.13 Y131.287 E.00812
G1 X135.845 Y131.174 E.00599
G1 X135.445 Y130.959 E.00885
G1 X135.11 Y130.702 E.00824
G1 X134.818 Y130.393 E.00828
G1 X134.587 Y130.054 E.008
G1 X134.424 Y129.714 E.00736
G1 X134.266 Y129.213 E.01024
G1 X134.197 Y128.572 E.01257
G1 X134.198 Y126.687 E.03674
G1 X134.24 Y126.206 E.00942
G1 X134.341 Y125.802 E.00812
G1 X134.454 Y125.516 E.00599
G1 X134.67 Y125.117 E.00885
G1 X134.865 Y124.861 E.00627
M204 S6000
G1 X135.245 Y125.152 F42000
G1 F1500
M204 S500
G1 X135.278 Y125.11 E.00104
G1 X135.512 Y124.885 E.00634
G1 X135.836 Y124.664 E.00764
G1 X136.184 Y124.505 E.00746
G1 X136.542 Y124.403 E.00725
G1 X137.045 Y124.349 E.00987
G1 X138.929 Y124.348 E.03672
G1 X139.293 Y124.378 E.00713
G1 X139.656 Y124.463 E.00727
G1 X139.933 Y124.572 E.0058
G1 X140.261 Y124.751 E.00729
G1 X140.521 Y124.951 E.00639
G1 X140.744 Y125.184 E.00629
G1 X140.958 Y125.494 E.00735
G1 X141.083 Y125.753 E.00561
G1 X141.222 Y126.202 E.00916
G1 X141.28 Y126.718 E.01013
G1 X141.282 Y128.574 E.03618
G1 X141.241 Y129.026 E.00885
G1 X141.162 Y129.342 E.00636
G1 X141.071 Y129.574 E.00485
G1 X140.878 Y129.932 E.00794
G1 X140.666 Y130.205 E.00675
G1 X140.429 Y130.429 E.00634
G1 X140.152 Y130.62 E.00657
G1 X139.876 Y130.754 E.00599
G1 X139.456 Y130.887 E.00858
G1 X138.867 Y130.953 E.01157
G1 X137.044 Y130.952 E.03554
G1 X136.603 Y130.912 E.00862
G1 X136.286 Y130.833 E.00637
G1 X136.055 Y130.743 E.00485
G1 X135.697 Y130.549 E.00794
G1 X135.423 Y130.337 E.00675
G1 X135.2 Y130.1 E.00634
G1 X135.009 Y129.823 E.00657
G1 X134.874 Y129.547 E.00599
G1 X134.741 Y129.128 E.00858
G1 X134.675 Y128.538 E.01157
G1 X134.676 Y126.715 E.03555
G1 X134.716 Y126.275 E.00862
G1 X134.796 Y125.958 E.00637
G1 X134.886 Y125.726 E.00485
G1 X135.08 Y125.368 E.00794
G1 X135.209 Y125.2 E.00414
M204 S6000
G1 X135.581 Y125.523 F42000
G1 F1500
M204 S500
G1 X135.749 Y125.329 E.005
G1 X135.855 Y125.24 E.0027
G1 X136.152 Y125.049 E.00689
G1 X136.388 Y124.944 E.00503
G1 X137.016 Y124.825 E.01247
G1 X138.946 Y124.825 E.03762
G1 X139.476 Y124.915 E.01048
G1 X139.865 Y125.084 E.00827
G1 X140.157 Y125.286 E.00692
G1 X140.419 Y125.565 E.00747
G1 X140.63 Y125.922 E.00809
G1 X140.715 Y126.164 E.00499
G1 X140.804 Y126.686 E.01033
G1 X140.804 Y128.619 E.03769
G1 X140.748 Y129.025 E.00798
G1 X140.628 Y129.373 E.00719
G1 X140.372 Y129.792 E.00956
G1 X140.104 Y130.059 E.00738
G1 X139.703 Y130.303 E.00916
G1 X139.465 Y130.386 E.00491
G1 X138.943 Y130.475 E.01033
G1 X137.009 Y130.475 E.03769
G1 X136.604 Y130.419 E.00798
G1 X136.255 Y130.299 E.00719
G1 X135.836 Y130.044 E.00956
G1 X135.57 Y129.775 E.00738
G1 X135.325 Y129.374 E.00916
G1 X135.243 Y129.136 E.00491
G1 X135.154 Y128.614 E.01033
G1 X135.154 Y126.683 E.03765
G1 X135.244 Y126.15 E.01053
G1 X135.35 Y125.881 E.00564
G1 X135.516 Y125.597 E.00642
G1 X135.541 Y125.568 E.00074
M204 S6000
G1 X135.926 Y125.844 F42000
G1 F1500
M204 S500
G1 X136.106 Y125.648 E.0052
G1 X136.421 Y125.445 E.00729
G1 X136.573 Y125.385 E.00319
G1 X137.003 Y125.304 E.00853
G1 X138.956 Y125.304 E.03808
G1 X139.297 Y125.359 E.00673
G1 X139.581 Y125.47 E.00595
G1 X139.892 Y125.685 E.00737
G1 X140.064 Y125.886 E.00515
G1 X140.182 Y126.089 E.00459
G1 X140.243 Y126.244 E.00325
G1 X140.325 Y126.674 E.00853
G1 X140.325 Y128.629 E.03812
G1 X140.292 Y128.88 E.00493
G1 X140.218 Y129.127 E.00504
G1 X140.029 Y129.458 E.00743
G1 X139.851 Y129.652 E.00514
G1 X139.537 Y129.855 E.00729
G1 X139.385 Y129.915 E.00319
G1 X138.955 Y129.996 E.00853
G1 X137 Y129.996 E.03812
G1 X136.749 Y129.963 E.00493
G1 X136.501 Y129.889 E.00504
G1 X136.17 Y129.701 E.00743
G1 X135.976 Y129.522 E.00514
G1 X135.774 Y129.208 E.00729
G1 X135.714 Y129.056 E.00319
G1 X135.632 Y128.626 E.00853
G1 X135.632 Y126.673 E.03808
G1 X135.687 Y126.332 E.00673
G1 X135.8 Y126.045 E.00601
G1 X135.894 Y125.895 E.00345
M204 S6000
G1 X136.299 Y126.15 F42000
G1 F1500
M204 S500
G1 X136.338 Y126.088 E.00142
G1 X136.445 Y125.985 E.00289
G1 X136.669 Y125.854 E.00506
G1 X136.989 Y125.782 E.00641
G1 X138.967 Y125.782 E.03857
G1 X139.14 Y125.81 E.0034
G1 X139.318 Y125.869 E.00366
G1 X139.541 Y126.009 E.00514
G1 X139.644 Y126.116 E.00289
G1 X139.775 Y126.34 E.00506
G1 X139.846 Y126.66 E.00641
G1 X139.846 Y128.639 E.03857
G1 X139.819 Y128.811 E.00341
G1 X139.76 Y128.989 E.00366
G1 X139.62 Y129.212 E.00514
G1 X139.513 Y129.315 E.00289
G1 X139.289 Y129.446 E.00506
G1 X138.968 Y129.518 E.00641
G1 X136.99 Y129.518 E.03857
G1 X136.818 Y129.49 E.00341
G1 X136.64 Y129.431 E.00366
G1 X136.416 Y129.291 E.00514
G1 X136.313 Y129.184 E.00289
G1 X136.183 Y128.96 E.00506
G1 X136.111 Y128.64 E.00641
G1 X136.111 Y126.661 E.03857
G1 X136.139 Y126.489 E.0034
G1 X136.197 Y126.311 E.00366
G1 X136.267 Y126.2 E.00255
M204 S6000
G1 X136.657 Y126.444 F42000
G1 F1500
M204 S500
G1 X136.789 Y126.317 E.00357
G1 X136.979 Y126.261 E.00386
G1 X138.979 Y126.261 E.03899
G1 X139.184 Y126.329 E.00422
G1 X139.311 Y126.46 E.00357
G1 X139.368 Y126.65 E.00386
G1 X139.368 Y128.65 E.03899
G1 X139.3 Y128.856 E.00422
G1 X139.168 Y128.983 E.00357
G1 X138.979 Y129.039 E.00386
G1 X136.979 Y129.039 E.03899
G1 X136.773 Y128.971 E.00422
G1 X136.646 Y128.84 E.00357
G1 X136.589 Y128.65 E.00386
G1 X136.589 Y126.65 E.03899
G1 X136.638 Y126.501 E.00305
; WIPE_START
G1 X136.789 Y126.317 E-.09038
G1 X136.979 Y126.261 E-.07518
G1 X138.543 Y126.261 E-.59444
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.729 Y128.4 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X137.229 Y128.4 E.02925
G1 X137.229 Y126.9 E.02925
G1 X138.729 Y126.9 E.02925
G1 X138.729 Y128.34 E.02808
M204 S6000
G1 X138.25 Y127.921 F42000
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X137.707 Y127.921 E.01059
G1 X137.707 Y127.379 E.01059
G1 X138.25 Y127.379 E.01059
G1 X138.25 Y127.861 E.00942
; OBJECT_ID: 47
; WIPE_START
G1 X137.707 Y127.921 E-.20758
G1 X137.707 Y127.379 E-.20633
G1 X138.25 Y127.379 E-.20632
G1 X138.25 Y127.746 E-.13978
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S6000
G1 X130.618 Y127.803 Z.5 F42000
G1 X122.76 Y127.861 Z.5
G1 Z.1
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S500
G1 X122.76 Y128.64 E.01519
G1 X122.713 Y129.228 E.01149
G1 X122.573 Y129.793 E.01136
G1 X122.415 Y130.189 E.00831
G1 X122.139 Y130.705 E.01141
G1 X121.786 Y131.165 E.0113
G1 X121.365 Y131.562 E.0113
G1 X120.883 Y131.887 E.01133
G1 X120.435 Y132.1 E.00967
G1 X119.78 Y132.307 E.0134
G1 X119.009 Y132.389 E.01513
G1 X117.031 Y132.389 E.03856
M73 P57 R5
G1 X116.444 Y132.341 E.01149
G1 X115.878 Y132.202 E.01136
G1 X115.482 Y132.044 E.00831
G1 X114.967 Y131.767 E.01141
G1 X114.507 Y131.415 E.0113
G1 X114.109 Y130.993 E.0113
G1 X113.784 Y130.512 E.01133
G1 X113.571 Y130.064 E.00967
G1 X113.365 Y129.409 E.0134
G1 X113.282 Y128.637 E.01512
G1 X113.282 Y126.66 E.03856
G1 X113.33 Y126.072 E.01149
G1 X113.47 Y125.507 E.01136
G1 X113.627 Y125.111 E.00831
G1 X113.904 Y124.595 E.01141
G1 X114.256 Y124.135 E.0113
G1 X114.678 Y123.738 E.0113
G1 X115.158 Y123.414 E.0113
G1 X115.707 Y123.161 E.01177
G1 X116.261 Y122.994 E.01129
G1 X117.034 Y122.911 E.01515
G1 X119.012 Y122.911 E.03856
G1 X119.599 Y122.959 E.01149
G1 X120.164 Y123.098 E.01136
G1 X120.56 Y123.256 E.00831
G1 X121.076 Y123.533 E.01141
G1 X121.536 Y123.885 E.0113
G1 X121.933 Y124.307 E.0113
G1 X122.258 Y124.788 E.01133
G1 X122.471 Y125.236 E.00967
G1 X122.678 Y125.891 E.0134
G1 X122.76 Y126.663 E.01513
G1 X122.76 Y127.801 E.0222
M204 S6000
G1 X122.281 Y127.802 F42000
G1 F1500
M204 S500
G1 X122.281 Y128.627 E.01609
G1 X122.236 Y129.162 E.01047
G1 X122.112 Y129.656 E.00993
G1 X121.977 Y129.994 E.00711
G1 X121.741 Y130.434 E.00974
G1 X121.422 Y130.851 E.01023
G1 X121.055 Y131.194 E.00978
G1 X120.654 Y131.464 E.00943
G1 X120.25 Y131.656 E.00872
G1 X119.667 Y131.837 E.0119
G1 X118.975 Y131.91 E.01357
G1 X117.045 Y131.91 E.03765
G1 X116.51 Y131.865 E.01047
G1 X116.016 Y131.741 E.00993
G1 X115.677 Y131.606 E.00711
G1 X115.237 Y131.37 E.00974
G1 X114.82 Y131.05 E.01023
G1 X114.478 Y130.684 E.00978
G1 X114.207 Y130.283 E.00943
G1 X114.015 Y129.879 E.00872
G1 X113.834 Y129.296 E.0119
G1 X113.761 Y128.604 E.01356
G1 X113.761 Y126.673 E.03765
G1 X113.807 Y126.138 E.01046
G1 X113.93 Y125.644 E.00993
G1 X114.066 Y125.306 E.00711
G1 X114.302 Y124.866 E.00974
G1 X114.621 Y124.449 E.01023
G1 X114.969 Y124.121 E.00933
G1 X115.384 Y123.839 E.00978
G1 X115.868 Y123.614 E.0104
G1 X116.37 Y123.463 E.01022
G1 X117.052 Y123.39 E.01337
G1 X118.998 Y123.39 E.03795
G1 X119.51 Y123.431 E.01001
G1 X120.008 Y123.553 E.01
G1 X120.365 Y123.694 E.00749
G1 X120.806 Y123.93 E.00974
G1 X121.205 Y124.234 E.00978
G1 X121.55 Y124.598 E.00978
G1 X121.846 Y125.036 E.0103
G1 X122.028 Y125.421 E.0083
G1 X122.203 Y125.976 E.01135
G1 X122.281 Y126.681 E.01382
G1 X122.281 Y127.742 E.02069
M204 S6000
G1 X121.802 Y127.742 F42000
G1 F1500
M204 S500
G1 X121.803 Y128.6 E.01674
G1 X121.76 Y129.094 E.00966
G1 X121.659 Y129.498 E.00812
G1 X121.546 Y129.784 E.00599
G1 X121.33 Y130.183 E.00885
G1 X121.073 Y130.519 E.00824
G1 X120.764 Y130.81 E.00828
G1 X120.425 Y131.042 E.008
G1 X120.085 Y131.205 E.00736
G1 X119.584 Y131.362 E.01024
G1 X118.943 Y131.432 E.01257
G1 X117.059 Y131.431 E.03673
G1 X116.577 Y131.388 E.00943
G1 X116.173 Y131.287 E.00812
G1 X115.887 Y131.174 E.00599
G1 X115.488 Y130.959 E.00885
G1 X115.152 Y130.702 E.00824
G1 X114.861 Y130.393 E.00828
G1 X114.63 Y130.054 E.008
G1 X114.466 Y129.714 E.00736
G1 X114.309 Y129.213 E.01024
G1 X114.239 Y128.572 E.01257
G1 X114.24 Y126.687 E.03674
G1 X114.283 Y126.206 E.00942
G1 X114.384 Y125.802 E.00812
G1 X114.497 Y125.516 E.00599
G1 X114.712 Y125.117 E.00885
G1 X114.97 Y124.78 E.00827
G1 X115.262 Y124.503 E.00784
G1 X115.632 Y124.251 E.00872
G1 X116.048 Y124.059 E.00894
G1 X116.478 Y123.933 E.00874
G1 X117.07 Y123.87 E.0116
G1 X118.985 Y123.869 E.03733
G1 X119.422 Y123.904 E.00856
G1 X119.853 Y124.008 E.00864
G1 X120.17 Y124.133 E.00666
G1 X120.555 Y124.341 E.00853
G1 X120.875 Y124.585 E.00784
G1 X121.168 Y124.89 E.00825
G1 X121.423 Y125.264 E.00882
G1 X121.577 Y125.587 E.00698
G1 X121.734 Y126.089 E.01026
G1 X121.802 Y126.699 E.01197
G1 X121.802 Y127.682 E.01916
M204 S6000
G1 X121.323 Y127.682 F42000
G1 F1500
M204 S500
G1 X121.324 Y128.574 E.01738
G1 X121.284 Y129.026 E.00885
G1 X121.204 Y129.342 E.00636
G1 X121.114 Y129.574 E.00485
G1 X120.92 Y129.932 E.00794
G1 X120.708 Y130.205 E.00675
G1 X120.472 Y130.429 E.00634
G1 X120.194 Y130.62 E.00657
G1 X119.918 Y130.754 E.00599
G1 X119.499 Y130.887 E.00858
G1 X118.909 Y130.953 E.01157
G1 X117.086 Y130.952 E.03554
G1 X116.646 Y130.912 E.00862
G1 X116.329 Y130.833 E.00637
G1 X116.097 Y130.743 E.00485
G1 X115.739 Y130.549 E.00794
G1 X115.466 Y130.337 E.00675
G1 X115.243 Y130.1 E.00634
G1 X115.051 Y129.823 E.00657
G1 X114.917 Y129.547 E.00599
G1 X114.784 Y129.128 E.00858
G1 X114.718 Y128.538 E.01157
G1 X114.719 Y126.715 E.03555
G1 X114.759 Y126.275 E.00862
G1 X114.838 Y125.958 E.00637
G1 X114.929 Y125.726 E.00485
G1 X115.122 Y125.368 E.00794
G1 X115.32 Y125.11 E.00634
G1 X115.555 Y124.885 E.00634
G1 X115.879 Y124.664 E.00764
G1 X116.227 Y124.505 E.00746
G1 X116.584 Y124.403 E.00725
G1 X117.088 Y124.349 E.00987
G1 X118.971 Y124.348 E.03672
G1 X119.336 Y124.378 E.00713
G1 X119.699 Y124.463 E.00727
G1 X119.976 Y124.572 E.0058
G1 X120.304 Y124.751 E.00729
G1 X120.564 Y124.951 E.00639
G1 X120.787 Y125.184 E.00629
G1 X121.001 Y125.494 E.00735
G1 X121.126 Y125.753 E.00561
G1 X121.265 Y126.202 E.00916
G1 X121.322 Y126.718 E.01013
G1 X121.323 Y127.622 E.01763
M204 S6000
G1 X120.846 Y127.622 F42000
G1 F1500
M204 S500
G1 X120.846 Y128.619 E.01944
G1 X120.79 Y129.025 E.00798
G1 X120.67 Y129.373 E.00719
G1 X120.415 Y129.792 E.00956
G1 X120.146 Y130.059 E.00738
G1 X119.745 Y130.303 E.00916
G1 X119.508 Y130.386 E.00491
G1 X118.985 Y130.475 E.01033
G1 X117.052 Y130.475 E.03769
G1 X116.646 Y130.419 E.00798
G1 X116.298 Y130.299 E.00719
G1 X115.879 Y130.044 E.00956
G1 X115.613 Y129.775 E.00738
G1 X115.368 Y129.374 E.00916
G1 X115.285 Y129.136 E.00491
G1 X115.196 Y128.614 E.01033
G1 X115.196 Y126.683 E.03765
G1 X115.287 Y126.15 E.01053
G1 X115.392 Y125.881 E.00564
G1 X115.559 Y125.597 E.00642
G1 X115.792 Y125.329 E.00691
G1 X115.897 Y125.24 E.0027
G1 X116.195 Y125.049 E.00689
G1 X116.431 Y124.944 E.00503
G1 X117.059 Y124.825 E.01247
G1 X118.988 Y124.825 E.03762
G1 X119.518 Y124.915 E.01048
G1 X119.907 Y125.084 E.00827
G1 X120.199 Y125.286 E.00692
G1 X120.462 Y125.565 E.00747
G1 X120.673 Y125.922 E.00809
G1 X120.757 Y126.164 E.00499
G1 X120.846 Y126.686 E.01033
G1 X120.846 Y127.562 E.01709
M204 S6000
G1 X120.368 Y127.562 F42000
G1 F1500
M204 S500
G1 X120.368 Y128.629 E.0208
G1 X120.335 Y128.88 E.00493
G1 X120.26 Y129.127 E.00504
G1 X120.072 Y129.458 E.00743
G1 X119.894 Y129.652 E.00514
G1 X119.579 Y129.855 E.00729
G1 X119.427 Y129.915 E.00319
G1 X118.997 Y129.996 E.00853
G1 X117.042 Y129.996 E.03812
G1 X116.792 Y129.963 E.00493
G1 X116.544 Y129.889 E.00504
G1 X116.213 Y129.701 E.00743
G1 X116.019 Y129.522 E.00514
G1 X115.817 Y129.208 E.00729
G1 X115.757 Y129.056 E.00319
G1 X115.675 Y128.626 E.00853
G1 X115.675 Y126.673 E.03808
G1 X115.73 Y126.332 E.00673
G1 X115.842 Y126.045 E.00601
G1 X115.968 Y125.844 E.00462
G1 X116.149 Y125.648 E.0052
G1 X116.463 Y125.445 E.00729
G1 X116.615 Y125.385 E.00319
G1 X117.045 Y125.304 E.00853
G1 X118.998 Y125.304 E.03808
G1 X119.339 Y125.359 E.00673
G1 X119.623 Y125.47 E.00595
G1 X119.934 Y125.685 E.00737
G1 X120.106 Y125.886 E.00515
G1 X120.225 Y126.089 E.00459
G1 X120.286 Y126.244 E.00325
G1 X120.368 Y126.674 E.00853
G1 X120.368 Y127.502 E.01615
M204 S6000
G1 X119.889 Y127.502 F42000
G1 F1500
M204 S500
G1 X119.889 Y128.639 E.02215
G1 X119.861 Y128.811 E.00341
G1 X119.803 Y128.989 E.00366
G1 X119.662 Y129.212 E.00514
G1 X119.555 Y129.315 E.00289
G1 X119.331 Y129.446 E.00506
G1 X119.011 Y129.518 E.00641
G1 X117.033 Y129.518 E.03857
G1 X116.86 Y129.49 E.00341
G1 X116.682 Y129.431 E.00366
G1 X116.459 Y129.291 E.00514
G1 X116.356 Y129.184 E.00289
G1 X116.225 Y128.96 E.00506
G1 X116.154 Y128.64 E.00641
G1 X116.154 Y126.661 E.03857
G1 X116.181 Y126.489 E.0034
G1 X116.24 Y126.311 E.00366
G1 X116.38 Y126.088 E.00514
G1 X116.487 Y125.985 E.00289
G1 X116.711 Y125.854 E.00506
G1 X117.032 Y125.782 E.00641
G1 X119.01 Y125.782 E.03857
G1 X119.182 Y125.81 E.0034
G1 X119.36 Y125.869 E.00366
G1 X119.584 Y126.009 E.00514
G1 X119.687 Y126.116 E.00289
G1 X119.817 Y126.34 E.00506
G1 X119.889 Y126.66 E.00641
G1 X119.889 Y127.442 E.01525
M204 S6000
G1 X119.411 Y127.442 F42000
G1 F1500
M204 S500
G1 X119.411 Y128.65 E.02355
G1 X119.343 Y128.856 E.00422
G1 X119.211 Y128.983 E.00357
G1 X119.021 Y129.039 E.00386
G1 X117.021 Y129.039 E.03899
G1 X116.816 Y128.971 E.00422
G1 X116.689 Y128.84 E.00357
G1 X116.632 Y128.65 E.00386
G1 X116.632 Y126.65 E.03899
G1 X116.7 Y126.444 E.00422
G1 X116.832 Y126.317 E.00357
G1 X117.021 Y126.261 E.00386
G1 X119.021 Y126.261 E.03899
G1 X119.227 Y126.329 E.00422
G1 X119.354 Y126.46 E.00357
G1 X119.411 Y126.65 E.00386
G1 X119.411 Y127.382 E.01428
; WIPE_START
G1 X119.411 Y128.65 E-.4817
G1 X119.343 Y128.856 E-.08225
G1 X119.211 Y128.983 E-.06958
G1 X119.021 Y129.039 E-.07518
G1 X118.886 Y129.039 E-.05128
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.771 Y128.4 Z.5 F42000
M73 P58 R5
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X117.271 Y128.4 E.02925
G1 X117.271 Y126.9 E.02925
G1 X118.771 Y126.9 E.02925
G1 X118.771 Y128.34 E.02808
M204 S6000
G1 X118.293 Y127.921 F42000
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X117.75 Y127.921 E.01059
G1 X117.75 Y127.379 E.01059
G1 X118.293 Y127.379 E.01059
G1 X118.293 Y127.861 E.00942
; WIPE_START
G1 X117.75 Y127.921 E-.20758
G1 X117.75 Y127.379 E-.20632
G1 X118.293 Y127.379 E-.20632
G1 X118.293 Y127.746 E-.13978
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z0.5
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 2/77
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S204
; open powerlost recovery
M1003 S1
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.313 Y128.026 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.56 Y128.026 E.01315
G1 X137.56 Y127.274 E.01315
G1 X138.313 Y127.274 E.01315
G1 X138.313 Y127.966 E.0121
M204 S250
G1 X138.726 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.148 Y128.44 E.02563
G1 X137.148 Y126.86 E.02566
G1 X138.726 Y126.86 E.02563
G1 X138.726 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X137.148 Y128.44 E-.60023
G1 X137.148 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.515 Y128.022 Z.6 F42000
G1 X118.44 Y128.026 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.687 Y128.026 E.01315
G1 X117.687 Y127.274 E.01315
G1 X118.44 Y127.274 E.01315
G1 X118.44 Y127.966 E.0121
M204 S250
G1 X118.854 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.852 Y128.44 E.00003
G1 X117.274 Y128.44 E.02563
G1 X117.274 Y126.86 E.02566
G1 X118.852 Y126.86 E.02563
G1 X118.854 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X118.852 Y128.44 E-.02281
G1 X117.274 Y128.44 E-.5998
G1 X117.274 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z0.6
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 3/77
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.27 Y128.026 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.517 Y128.026 E.01315
G1 X137.517 Y127.274 E.01315
G1 X138.27 Y127.274 E.01315
G1 X138.27 Y127.966 E.0121
M204 S250
G1 X138.684 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.105 Y128.44 E.02563
G1 X137.105 Y126.86 E.02566
G1 X138.684 Y126.86 E.02563
G1 X138.684 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X137.105 Y128.44 E-.60023
G1 X137.105 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.473 Y128.022 Z.7 F42000
G1 X118.483 Y128.026 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.73 Y128.026 E.01315
M73 P58 R4
G1 X117.73 Y127.274 E.01315
G1 X118.483 Y127.274 E.01315
G1 X118.483 Y127.966 E.0121
M204 S250
G1 X118.896 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.895 Y128.44 E.00003
G1 X117.316 Y128.44 E.02563
M73 P59 R4
G1 X117.316 Y126.86 E.02566
G1 X118.895 Y126.86 E.02563
G1 X118.896 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X118.895 Y128.44 E-.02281
G1 X117.316 Y128.44 E-.5998
G1 X117.316 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z0.7
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
; object ids of this layer3 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 4/77
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.227 Y128.026 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.474 Y128.026 E.01315
G1 X137.474 Y127.274 E.01315
G1 X138.227 Y127.274 E.01315
G1 X138.227 Y127.966 E.0121
M204 S250
G1 X138.641 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.063 Y128.44 E.02563
G1 X137.063 Y126.86 E.02566
G1 X138.641 Y126.86 E.02563
G1 X138.641 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X137.063 Y128.44 E-.60023
G1 X137.063 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.43 Y128.022 Z.8 F42000
G1 X118.526 Y128.026 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.773 Y128.026 E.01315
G1 X117.773 Y127.274 E.01315
G1 X118.526 Y127.274 E.01315
G1 X118.526 Y127.966 E.0121
M204 S250
G1 X118.939 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.937 Y128.44 E.00003
G1 X117.359 Y128.44 E.02563
G1 X117.359 Y126.86 E.02566
G1 X118.937 Y126.86 E.02563
G1 X118.939 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X118.937 Y128.44 E-.02281
G1 X117.359 Y128.44 E-.5998
G1 X117.359 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z0.8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer4 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 5/77
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.185 Y128.026 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.432 Y128.026 E.01315
G1 X137.432 Y127.274 E.01315
G1 X138.185 Y127.274 E.01315
G1 X138.185 Y127.966 E.0121
M204 S250
G1 X138.598 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X137.02 Y128.44 E.02563
G1 X137.02 Y126.86 E.02566
G1 X138.598 Y126.86 E.02563
G1 X138.598 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X137.02 Y128.44 E-.60023
G1 X137.02 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.387 Y128.022 Z.9 F42000
G1 X118.568 Y128.026 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.815 Y128.026 E.01315
G1 X117.815 Y127.274 E.01315
G1 X118.568 Y127.274 E.01315
G1 X118.568 Y127.966 E.0121
M204 S250
M73 P60 R4
G1 X118.982 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.98 Y128.44 E.00003
G1 X117.402 Y128.44 E.02563
G1 X117.402 Y126.86 E.02566
G1 X118.98 Y126.86 E.02563
G1 X118.982 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X118.98 Y128.44 E-.02281
G1 X117.402 Y128.44 E-.5998
G1 X117.402 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z0.9
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer5 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 6/77
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.142 Y128.026 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.389 Y128.026 E.01315
G1 X137.389 Y127.274 E.01315
G1 X138.142 Y127.274 E.01315
G1 X138.142 Y127.966 E.0121
M204 S250
G1 X138.556 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.977 Y128.44 E.02563
G1 X136.977 Y126.86 E.02566
G1 X138.556 Y126.86 E.02563
G1 X138.556 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.977 Y128.44 E-.60023
G1 X136.977 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.345 Y128.022 Z1 F42000
G1 X118.611 Y128.026 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.858 Y128.026 E.01315
G1 X117.858 Y127.274 E.01315
G1 X118.611 Y127.274 E.01315
G1 X118.611 Y127.966 E.0121
M204 S250
G1 X119.024 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.023 Y128.44 E.00003
G1 X117.444 Y128.44 E.02563
G1 X117.444 Y126.86 E.02566
G1 X119.023 Y126.86 E.02563
G1 X119.024 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.023 Y128.44 E-.02281
G1 X117.444 Y128.44 E-.5998
G1 X117.444 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer6 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 7/77
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.1 Y128.026 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.347 Y128.026 E.01315
G1 X137.347 Y127.274 E.01315
G1 X138.1 Y127.274 E.01315
G1 X138.1 Y127.966 E.0121
M204 S250
G1 X138.513 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.935 Y128.44 E.02563
G1 X136.935 Y126.86 E.02566
G1 X138.513 Y126.86 E.02563
G1 X138.513 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.935 Y128.44 E-.60023
G1 X136.935 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.302 Y128.022 Z1.1 F42000
G1 X118.653 Y128.026 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.9 Y128.026 E.01315
G1 X117.9 Y127.274 E.01315
G1 X118.653 Y127.274 E.01315
G1 X118.653 Y127.966 E.0121
M204 S250
G1 X119.067 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.065 Y128.44 E.00003
G1 X117.487 Y128.44 E.02563
M73 P61 R4
G1 X117.487 Y126.86 E.02566
G1 X119.065 Y126.86 E.02563
G1 X119.067 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.065 Y128.44 E-.02281
G1 X117.487 Y128.44 E-.5998
G1 X117.487 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer7 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 8/77
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.057 Y128.026 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.304 Y128.026 E.01315
G1 X137.304 Y127.274 E.01315
G1 X138.057 Y127.274 E.01315
G1 X138.057 Y127.966 E.0121
M204 S250
G1 X138.471 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.892 Y128.44 E.02563
G1 X136.892 Y126.86 E.02566
G1 X138.471 Y126.86 E.02563
G1 X138.471 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.892 Y128.44 E-.60023
G1 X136.892 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.26 Y128.022 Z1.2 F42000
G1 X118.696 Y128.026 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.943 Y128.026 E.01315
G1 X117.943 Y127.274 E.01315
G1 X118.696 Y127.274 E.01315
G1 X118.696 Y127.966 E.0121
M204 S250
G1 X119.109 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.108 Y128.44 E.00003
G1 X117.529 Y128.44 E.02563
G1 X117.529 Y126.86 E.02566
G1 X119.108 Y126.86 E.02563
G1 X119.109 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.108 Y128.44 E-.02281
G1 X117.529 Y128.44 E-.5998
G1 X117.529 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.2
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer8 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 9/77
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X138.014 Y128.026 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.261 Y128.026 E.01315
G1 X137.261 Y127.274 E.01315
G1 X138.014 Y127.274 E.01315
G1 X138.014 Y127.966 E.0121
M204 S250
G1 X138.428 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.85 Y128.44 E.02563
G1 X136.85 Y126.86 E.02566
G1 X138.428 Y126.86 E.02563
G1 X138.428 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.85 Y128.44 E-.60023
G1 X136.85 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.217 Y128.022 Z1.3 F42000
G1 X118.738 Y128.026 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X117.986 Y128.026 E.01315
G1 X117.986 Y127.274 E.01315
G1 X118.738 Y127.274 E.01315
G1 X118.738 Y127.966 E.0121
M204 S250
G1 X119.152 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.15 Y128.44 E.00003
G1 X117.572 Y128.44 E.02563
G1 X117.572 Y126.86 E.02566
G1 X119.15 Y126.86 E.02563
G1 X119.152 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
M73 P62 R4
G1 X119.15 Y128.44 E-.02281
G1 X117.572 Y128.44 E-.5998
G1 X117.572 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.3
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer9 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 10/77
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.972 Y128.026 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.219 Y128.026 E.01315
G1 X137.219 Y127.274 E.01315
G1 X137.972 Y127.274 E.01315
G1 X137.972 Y127.966 E.0121
M204 S250
G1 X138.385 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.807 Y128.44 E.02563
G1 X136.807 Y126.86 E.02566
G1 X138.385 Y126.86 E.02563
G1 X138.385 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.807 Y128.44 E-.60023
G1 X136.807 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.174 Y128.022 Z1.4 F42000
G1 X118.781 Y128.026 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.028 Y128.026 E.01315
G1 X118.028 Y127.274 E.01315
G1 X118.781 Y127.274 E.01315
G1 X118.781 Y127.966 E.0121
M204 S250
G1 X119.195 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.193 Y128.44 E.00003
G1 X117.615 Y128.44 E.02563
G1 X117.615 Y126.86 E.02566
G1 X119.193 Y126.86 E.02563
G1 X119.195 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.193 Y128.44 E-.02281
G1 X117.615 Y128.44 E-.5998
G1 X117.615 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.4
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer10 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 11/77
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.929 Y128.026 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.176 Y128.026 E.01315
G1 X137.176 Y127.274 E.01315
G1 X137.929 Y127.274 E.01315
G1 X137.929 Y127.966 E.0121
M204 S250
G1 X138.343 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.764 Y128.44 E.02563
G1 X136.764 Y126.86 E.02566
G1 X138.343 Y126.86 E.02563
G1 X138.343 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.764 Y128.44 E-.60023
G1 X136.764 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.132 Y128.022 Z1.5 F42000
G1 X118.824 Y128.026 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.071 Y128.026 E.01315
G1 X118.071 Y127.274 E.01315
G1 X118.824 Y127.274 E.01315
G1 X118.824 Y127.966 E.0121
M204 S250
G1 X119.237 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.236 Y128.44 E.00003
G1 X117.657 Y128.44 E.02563
G1 X117.657 Y126.86 E.02566
G1 X119.236 Y126.86 E.02563
G1 X119.237 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.236 Y128.44 E-.02281
G1 X117.657 Y128.44 E-.5998
G1 X117.657 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P63 R4
G3 Z1.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.5
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer11 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 12/77
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.887 Y128.026 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.134 Y128.026 E.01315
G1 X137.134 Y127.274 E.01315
G1 X137.887 Y127.274 E.01315
G1 X137.887 Y127.966 E.0121
M204 S250
G1 X138.3 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.722 Y128.44 E.02563
G1 X136.722 Y126.86 E.02566
G1 X138.3 Y126.86 E.02563
G1 X138.3 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.722 Y128.44 E-.60023
G1 X136.722 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.089 Y128.023 Z1.6 F42000
G1 X118.866 Y128.026 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.113 Y128.026 E.01315
G1 X118.113 Y127.274 E.01315
G1 X118.866 Y127.274 E.01315
G1 X118.866 Y127.966 E.0121
M204 S250
G1 X119.28 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.278 Y128.44 E.00003
G1 X117.7 Y128.44 E.02563
G1 X117.7 Y126.86 E.02566
G1 X119.278 Y126.86 E.02563
G1 X119.28 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.278 Y128.44 E-.02281
G1 X117.7 Y128.44 E-.5998
G1 X117.7 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.6
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer12 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 13/77
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.844 Y128.026 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.091 Y128.026 E.01315
G1 X137.091 Y127.274 E.01315
G1 X137.844 Y127.274 E.01315
G1 X137.844 Y127.966 E.0121
M204 S250
G1 X138.258 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.679 Y128.44 E.02563
G1 X136.679 Y126.86 E.02566
G1 X138.258 Y126.86 E.02563
G1 X138.258 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.679 Y128.44 E-.60023
G1 X136.679 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.047 Y128.023 Z1.7 F42000
G1 X118.909 Y128.026 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.156 Y128.026 E.01315
G1 X118.156 Y127.274 E.01315
G1 X118.909 Y127.274 E.01315
G1 X118.909 Y127.966 E.0121
M204 S250
G1 X119.322 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.321 Y128.44 E.00003
G1 X117.742 Y128.44 E.02563
G1 X117.742 Y126.86 E.02566
G1 X119.321 Y126.86 E.02563
G1 X119.322 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.321 Y128.44 E-.02281
G1 X117.742 Y128.44 E-.5998
G1 X117.742 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.7
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P64 R4
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer13 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 14/77
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.801 Y128.026 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.049 Y128.026 E.01315
G1 X137.049 Y127.274 E.01315
G1 X137.801 Y127.274 E.01315
G1 X137.801 Y127.966 E.0121
M204 S250
G1 X138.215 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.637 Y128.44 E.02563
G1 X136.637 Y126.86 E.02566
G1 X138.215 Y126.86 E.02563
G1 X138.215 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.637 Y128.44 E-.60023
G1 X136.637 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.004 Y128.023 Z1.8 F42000
G1 X118.951 Y128.026 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.199 Y128.026 E.01315
G1 X118.199 Y127.274 E.01315
G1 X118.951 Y127.274 E.01315
G1 X118.951 Y127.966 E.0121
M204 S250
G1 X119.365 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.363 Y128.44 E.00003
G1 X117.785 Y128.44 E.02563
G1 X117.785 Y126.86 E.02566
G1 X119.363 Y126.86 E.02563
G1 X119.365 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.363 Y128.44 E-.02281
G1 X117.785 Y128.44 E-.5998
G1 X117.785 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
G1 Z1.8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer14 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 15/77
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.759 Y128.026 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X137.006 Y128.026 E.01315
G1 X137.006 Y127.274 E.01315
G1 X137.759 Y127.274 E.01315
G1 X137.759 Y127.966 E.0121
M204 S250
G1 X138.172 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.594 Y128.44 E.02563
G1 X136.594 Y126.86 E.02566
G1 X138.172 Y126.86 E.02563
G1 X138.172 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.594 Y128.44 E-.60023
G1 X136.594 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.962 Y128.023 Z1.9 F42000
G1 X118.994 Y128.026 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.241 Y128.026 E.01315
G1 X118.241 Y127.274 E.01315
G1 X118.994 Y127.274 E.01315
G1 X118.994 Y127.966 E.0121
M204 S250
G1 X119.408 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.406 Y128.44 E.00003
G1 X117.828 Y128.44 E.02563
G1 X117.828 Y126.86 E.02566
G1 X119.406 Y126.86 E.02563
G1 X119.408 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.406 Y128.44 E-.02281
G1 X117.828 Y128.44 E-.5998
G1 X117.828 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 15 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer15 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 16/77
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.716 Y128.026 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P65 R4
G1 F1200
M204 S6000
G1 X136.963 Y128.026 E.01315
G1 X136.963 Y127.274 E.01315
G1 X137.716 Y127.274 E.01315
G1 X137.716 Y127.966 E.0121
M204 S250
G1 X138.13 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.551 Y128.44 E.02563
G1 X136.551 Y126.86 E.02566
G1 X138.13 Y126.86 E.02563
G1 X138.13 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.551 Y128.44 E-.60023
G1 X136.551 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.919 Y128.023 Z2 F42000
G1 X119.037 Y128.026 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.284 Y128.026 E.01315
G1 X118.284 Y127.274 E.01315
G1 X119.037 Y127.274 E.01315
G1 X119.037 Y127.966 E.0121
M204 S250
G1 X119.45 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.449 Y128.44 E.00003
G1 X117.87 Y128.44 E.02563
G1 X117.87 Y126.86 E.02566
G1 X119.449 Y126.86 E.02563
G1 X119.45 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.449 Y128.44 E-.02281
G1 X117.87 Y128.44 E-.5998
G1 X117.87 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 16 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer16 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 17/77
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.674 Y128.026 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.921 Y128.026 E.01315
G1 X136.921 Y127.274 E.01315
G1 X137.674 Y127.274 E.01315
G1 X137.674 Y127.966 E.0121
M204 S250
G1 X138.087 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.509 Y128.44 E.02563
G1 X136.509 Y126.86 E.02566
G1 X138.087 Y126.86 E.02563
G1 X138.087 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.509 Y128.44 E-.60023
G1 X136.509 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.876 Y128.023 Z2.1 F42000
G1 X119.079 Y128.026 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.326 Y128.026 E.01315
G1 X118.326 Y127.274 E.01315
G1 X119.079 Y127.274 E.01315
G1 X119.079 Y127.966 E.0121
M204 S250
G1 X119.493 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.491 Y128.44 E.00003
G1 X117.913 Y128.44 E.02563
G1 X117.913 Y126.86 E.02566
G1 X119.491 Y126.86 E.02563
G1 X119.493 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.491 Y128.44 E-.02281
G1 X117.913 Y128.44 E-.5998
G1 X117.913 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 17 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer17 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 18/77
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.631 Y128.026 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.878 Y128.026 E.01315
G1 X136.878 Y127.274 E.01315
G1 X137.631 Y127.274 E.01315
G1 X137.631 Y127.966 E.0121
M204 S250
M73 P66 R4
G1 X138.045 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.466 Y128.44 E.02563
G1 X136.466 Y126.86 E.02566
G1 X138.045 Y126.86 E.02563
G1 X138.045 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.466 Y128.44 E-.60023
G1 X136.466 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.834 Y128.023 Z2.2 F42000
G1 X119.122 Y128.026 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.369 Y128.026 E.01315
G1 X118.369 Y127.274 E.01315
G1 X119.122 Y127.274 E.01315
G1 X119.122 Y127.966 E.0121
M204 S250
G1 X119.535 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.534 Y128.44 E.00003
G1 X117.955 Y128.44 E.02563
G1 X117.955 Y126.86 E.02566
G1 X119.534 Y126.86 E.02563
G1 X119.535 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.534 Y128.44 E-.02281
G1 X117.955 Y128.44 E-.5998
G1 X117.955 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 18 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer18 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 19/77
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.589 Y128.026 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.836 Y128.026 E.01315
G1 X136.836 Y127.274 E.01315
G1 X137.589 Y127.274 E.01315
G1 X137.589 Y127.966 E.0121
M204 S250
G1 X138.002 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.424 Y128.44 E.02563
G1 X136.424 Y126.86 E.02566
G1 X138.002 Y126.86 E.02563
G1 X138.002 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.424 Y128.44 E-.60023
G1 X136.424 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.791 Y128.023 Z2.3 F42000
G1 X119.164 Y128.026 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.411 Y128.026 E.01315
G1 X118.411 Y127.274 E.01315
G1 X119.164 Y127.274 E.01315
G1 X119.164 Y127.966 E.0121
M204 S250
G1 X119.578 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.576 Y128.44 E.00003
G1 X117.998 Y128.44 E.02563
G1 X117.998 Y126.86 E.02566
G1 X119.576 Y126.86 E.02563
G1 X119.578 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.576 Y128.44 E-.02281
G1 X117.998 Y128.44 E-.5998
G1 X117.998 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 19 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer19 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 20/77
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.546 Y128.026 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.793 Y128.026 E.01315
G1 X136.793 Y127.274 E.01315
G1 X137.546 Y127.274 E.01315
G1 X137.546 Y127.966 E.0121
M204 S250
G1 X137.959 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.381 Y128.44 E.02563
G1 X136.381 Y126.86 E.02566
M73 P67 R4
G1 X137.959 Y126.86 E.02563
G1 X137.959 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
M73 P67 R3
G1 X136.381 Y128.44 E-.60023
G1 X136.381 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.749 Y128.023 Z2.4 F42000
G1 X119.207 Y128.026 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.454 Y128.026 E.01315
G1 X118.454 Y127.274 E.01315
G1 X119.207 Y127.274 E.01315
G1 X119.207 Y127.966 E.0121
M204 S250
G1 X119.621 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.619 Y128.44 E.00003
G1 X118.041 Y128.44 E.02563
G1 X118.041 Y126.86 E.02566
G1 X119.619 Y126.86 E.02563
G1 X119.62 Y128.38 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X119.619 Y128.44 E-.02281
G1 X118.041 Y128.44 E-.5998
G1 X118.041 Y128.078 E-.1374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 20 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer20 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 21/77
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.503 Y128.026 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.75 Y128.026 E.01315
G1 X136.75 Y127.274 E.01315
G1 X137.503 Y127.274 E.01315
G1 X137.503 Y127.966 E.0121
M204 S250
G1 X137.917 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.338 Y128.44 E.02563
G1 X136.338 Y126.86 E.02566
G1 X137.917 Y126.86 E.02563
G1 X137.917 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.338 Y128.44 E-.60023
G1 X136.338 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.706 Y128.023 Z2.5 F42000
G1 X119.25 Y128.026 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.497 Y128.026 E.01315
G1 X118.497 Y127.274 E.01315
G1 X119.25 Y127.274 E.01315
G1 X119.25 Y127.966 E.0121
M204 S250
G1 X119.662 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.083 Y128.44 E.02563
G1 X118.083 Y126.86 E.02566
G1 X119.662 Y126.86 E.02563
G1 X119.663 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.083 Y128.44 E-.60079
G1 X118.083 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 21 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer21 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 22/77
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.461 Y128.026 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.708 Y128.026 E.01315
G1 X136.708 Y127.274 E.01315
G1 X137.461 Y127.274 E.01315
G1 X137.461 Y127.966 E.0121
M204 S250
G1 X137.874 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.296 Y128.44 E.02563
G1 X136.296 Y126.86 E.02566
G1 X137.874 Y126.86 E.02563
G1 X137.874 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.296 Y128.44 E-.60023
G1 X136.296 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
M73 P68 R3
G1 X128.663 Y128.023 Z2.6 F42000
G1 X119.292 Y128.026 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.539 Y128.026 E.01315
G1 X118.539 Y127.274 E.01315
G1 X119.292 Y127.274 E.01315
G1 X119.292 Y127.966 E.0121
M204 S250
G1 X119.704 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.126 Y128.44 E.02563
G1 X118.126 Y126.86 E.02566
G1 X119.704 Y126.86 E.02563
G1 X119.706 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.126 Y128.44 E-.60079
G1 X118.126 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 22 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer22 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 23/77
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.418 Y128.026 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.665 Y128.026 E.01315
G1 X136.665 Y127.274 E.01315
G1 X137.418 Y127.274 E.01315
G1 X137.418 Y127.966 E.0121
M204 S250
G1 X137.832 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.253 Y128.44 E.02563
G1 X136.253 Y126.86 E.02566
G1 X137.832 Y126.86 E.02563
G1 X137.832 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.253 Y128.44 E-.60023
G1 X136.253 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.621 Y128.023 Z2.7 F42000
G1 X119.335 Y128.026 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.582 Y128.026 E.01315
G1 X118.582 Y127.274 E.01315
G1 X119.335 Y127.274 E.01315
G1 X119.335 Y127.966 E.0121
M204 S250
G1 X119.747 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.168 Y128.44 E.02563
G1 X118.168 Y126.86 E.02566
G1 X119.747 Y126.86 E.02563
G1 X119.748 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.168 Y128.44 E-.60079
G1 X118.168 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 23 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer23 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 24/77
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.376 Y128.026 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.623 Y128.026 E.01315
G1 X136.623 Y127.274 E.01315
G1 X137.376 Y127.274 E.01315
G1 X137.376 Y127.966 E.0121
M204 S250
G1 X137.789 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.211 Y128.44 E.02563
G1 X136.211 Y126.86 E.02566
G1 X137.789 Y126.86 E.02563
G1 X137.789 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.211 Y128.44 E-.60023
G1 X136.211 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.578 Y128.023 Z2.8 F42000
G1 X119.377 Y128.026 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P69 R3
G1 F1200
M204 S6000
G1 X118.624 Y128.026 E.01315
G1 X118.624 Y127.274 E.01315
G1 X119.377 Y127.274 E.01315
G1 X119.377 Y127.966 E.0121
M204 S250
G1 X119.789 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.211 Y128.44 E.02563
G1 X118.211 Y126.86 E.02566
G1 X119.789 Y126.86 E.02563
G1 X119.791 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.211 Y128.44 E-.60079
G1 X118.211 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 24 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer24 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 25/77
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.333 Y128.026 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.58 Y128.026 E.01315
G1 X136.58 Y127.274 E.01315
G1 X137.333 Y127.274 E.01315
G1 X137.333 Y127.966 E.0121
M204 S250
G1 X137.746 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.168 Y128.44 E.02563
G1 X136.168 Y126.86 E.02566
G1 X137.746 Y126.86 E.02563
G1 X137.746 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.168 Y128.44 E-.60023
G1 X136.168 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.536 Y128.023 Z2.9 F42000
G1 X119.42 Y128.026 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.667 Y128.026 E.01315
G1 X118.667 Y127.274 E.01315
G1 X119.42 Y127.274 E.01315
G1 X119.42 Y127.966 E.0121
M204 S250
G1 X119.832 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.254 Y128.44 E.02563
G1 X118.254 Y126.86 E.02566
G1 X119.832 Y126.86 E.02563
G1 X119.833 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.254 Y128.44 E-.60079
G1 X118.254 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 25 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer25 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 26/77
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.29 Y128.026 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.537 Y128.026 E.01315
G1 X136.537 Y127.274 E.01315
G1 X137.29 Y127.274 E.01315
G1 X137.29 Y127.966 E.0121
M204 S250
G1 X137.704 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.125 Y128.44 E.02563
G1 X136.125 Y126.86 E.02566
G1 X137.704 Y126.86 E.02563
G1 X137.704 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.125 Y128.44 E-.60023
G1 X136.125 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.493 Y128.023 Z3 F42000
G1 X119.463 Y128.026 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.71 Y128.026 E.01315
G1 X118.71 Y127.274 E.01315
G1 X119.463 Y127.274 E.01315
M73 P70 R3
G1 X119.463 Y127.966 E.0121
M204 S250
G1 X119.875 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.296 Y128.44 E.02563
G1 X118.296 Y126.86 E.02566
G1 X119.875 Y126.86 E.02563
G1 X119.876 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.296 Y128.44 E-.60079
G1 X118.296 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 26 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer26 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 27/77
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.248 Y128.026 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.495 Y128.026 E.01315
G1 X136.495 Y127.274 E.01315
G1 X137.248 Y127.274 E.01315
G1 X137.248 Y127.966 E.0121
M204 S250
G1 X137.661 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.083 Y128.44 E.02563
G1 X136.083 Y126.86 E.02566
G1 X137.661 Y126.86 E.02563
G1 X137.661 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.083 Y128.44 E-.60023
G1 X136.083 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.45 Y128.023 Z3.1 F42000
G1 X119.505 Y128.026 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.752 Y128.026 E.01315
G1 X118.752 Y127.274 E.01315
G1 X119.505 Y127.274 E.01315
G1 X119.505 Y127.966 E.0121
M204 S250
G1 X119.917 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.339 Y128.44 E.02563
G1 X118.339 Y126.86 E.02566
G1 X119.917 Y126.86 E.02563
G1 X119.919 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.339 Y128.44 E-.60079
G1 X118.339 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 27 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer27 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 28/77
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.205 Y128.026 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.452 Y128.026 E.01315
G1 X136.452 Y127.274 E.01315
G1 X137.205 Y127.274 E.01315
G1 X137.205 Y127.966 E.0121
M204 S250
G1 X137.619 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X136.04 Y128.44 E.02563
G1 X136.04 Y126.86 E.02566
G1 X137.619 Y126.86 E.02563
G1 X137.619 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X136.04 Y128.44 E-.60023
G1 X136.04 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.408 Y128.023 Z3.2 F42000
G1 X119.548 Y128.026 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.795 Y128.026 E.01315
G1 X118.795 Y127.274 E.01315
G1 X119.548 Y127.274 E.01315
G1 X119.548 Y127.966 E.0121
M204 S250
G1 X119.96 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.381 Y128.44 E.02563
M73 P71 R3
G1 X118.381 Y126.86 E.02566
G1 X119.96 Y126.86 E.02563
G1 X119.961 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.381 Y128.44 E-.60079
G1 X118.381 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 28 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer28 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 29/77
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.163 Y128.026 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.41 Y128.026 E.01315
G1 X136.41 Y127.274 E.01315
G1 X137.163 Y127.274 E.01315
G1 X137.163 Y127.966 E.0121
M204 S250
G1 X137.576 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.998 Y128.44 E.02563
G1 X135.998 Y126.86 E.02566
G1 X137.576 Y126.86 E.02563
G1 X137.576 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.998 Y128.44 E-.60023
G1 X135.998 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.365 Y128.023 Z3.3 F42000
G1 X119.59 Y128.026 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.837 Y128.026 E.01315
G1 X118.837 Y127.274 E.01315
G1 X119.59 Y127.274 E.01315
G1 X119.59 Y127.966 E.0121
M204 S250
G1 X120.002 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.424 Y128.44 E.02563
G1 X118.424 Y126.86 E.02566
G1 X120.002 Y126.86 E.02563
G1 X120.004 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.424 Y128.44 E-.60079
G1 X118.424 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 29 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer29 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 30/77
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.12 Y128.026 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.367 Y128.026 E.01315
G1 X136.367 Y127.274 E.01315
G1 X137.12 Y127.274 E.01315
G1 X137.12 Y127.966 E.0121
M204 S250
G1 X137.534 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.955 Y128.44 E.02563
G1 X135.955 Y126.86 E.02566
G1 X137.534 Y126.86 E.02563
G1 X137.534 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.955 Y128.44 E-.60023
G1 X135.955 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.323 Y128.023 Z3.4 F42000
G1 X119.633 Y128.026 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.88 Y128.026 E.01315
G1 X118.88 Y127.274 E.01315
G1 X119.633 Y127.274 E.01315
G1 X119.633 Y127.966 E.0121
M204 S250
G1 X120.045 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.466 Y128.44 E.02563
G1 X118.466 Y126.86 E.02566
G1 X120.045 Y126.86 E.02563
G1 X120.046 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.466 Y128.44 E-.60079
G1 X118.466 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P72 R3
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 30 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer30 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 31/77
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.077 Y128.026 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.324 Y128.026 E.01315
G1 X136.324 Y127.274 E.01315
G1 X137.077 Y127.274 E.01315
G1 X137.077 Y127.966 E.0121
M204 S250
G1 X137.491 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.913 Y128.44 E.02563
G1 X135.913 Y126.86 E.02566
G1 X137.491 Y126.86 E.02563
G1 X137.491 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.913 Y128.44 E-.60023
G1 X135.913 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.28 Y128.023 Z3.5 F42000
G1 X119.676 Y128.026 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.923 Y128.026 E.01315
G1 X118.923 Y127.274 E.01315
G1 X119.676 Y127.274 E.01315
G1 X119.676 Y127.966 E.0121
M204 S250
G1 X120.087 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.509 Y128.44 E.02563
G1 X118.509 Y126.86 E.02566
G1 X120.087 Y126.86 E.02563
G1 X120.089 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.509 Y128.44 E-.60079
G1 X118.509 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 31 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer31 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 32/77
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X137.035 Y128.026 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.282 Y128.026 E.01315
G1 X136.282 Y127.274 E.01315
G1 X137.035 Y127.274 E.01315
G1 X137.035 Y127.966 E.0121
M204 S250
G1 X137.448 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.87 Y128.44 E.02563
G1 X135.87 Y126.86 E.02566
G1 X137.448 Y126.86 E.02563
G1 X137.448 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.87 Y128.44 E-.60023
G1 X135.87 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.237 Y128.023 Z3.6 F42000
G1 X119.718 Y128.026 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X118.965 Y128.026 E.01315
G1 X118.965 Y127.274 E.01315
G1 X119.718 Y127.274 E.01315
G1 X119.718 Y127.966 E.0121
M204 S250
G1 X120.13 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.552 Y128.44 E.02563
G1 X118.552 Y126.86 E.02566
G1 X120.13 Y126.86 E.02563
G1 X120.132 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.552 Y128.44 E-.60079
G1 X118.552 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 32 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P73 R3
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer32 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 33/77
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.992 Y128.026 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.239 Y128.026 E.01315
G1 X136.239 Y127.274 E.01315
G1 X136.992 Y127.274 E.01315
G1 X136.992 Y127.966 E.0121
M204 S250
G1 X137.406 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.827 Y128.44 E.02563
G1 X135.827 Y126.86 E.02566
G1 X137.406 Y126.86 E.02563
G1 X137.406 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.827 Y128.44 E-.60023
G1 X135.827 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.195 Y128.023 Z3.7 F42000
G1 X119.761 Y128.026 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.008 Y128.026 E.01315
G1 X119.008 Y127.274 E.01315
G1 X119.761 Y127.274 E.01315
G1 X119.761 Y127.966 E.0121
M204 S250
G1 X120.173 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.594 Y128.44 E.02563
G1 X118.594 Y126.86 E.02566
G1 X120.173 Y126.86 E.02563
G1 X120.174 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.594 Y128.44 E-.60079
G1 X118.594 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 33 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer33 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 34/77
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.95 Y128.026 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.197 Y128.026 E.01315
G1 X136.197 Y127.274 E.01315
G1 X136.95 Y127.274 E.01315
G1 X136.95 Y127.966 E.0121
M204 S250
G1 X137.363 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.785 Y128.44 E.02563
G1 X135.785 Y126.86 E.02566
G1 X137.363 Y126.86 E.02563
G1 X137.363 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.785 Y128.44 E-.60023
G1 X135.785 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.152 Y128.023 Z3.8 F42000
G1 X119.803 Y128.026 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.05 Y128.026 E.01315
G1 X119.05 Y127.274 E.01315
G1 X119.803 Y127.274 E.01315
G1 X119.803 Y127.966 E.0121
M204 S250
G1 X120.215 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.637 Y128.44 E.02563
G1 X118.637 Y126.86 E.02566
G1 X120.215 Y126.86 E.02563
G1 X120.217 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.637 Y128.44 E-.60079
G1 X118.637 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 34 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer34 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 35/77
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.907 Y128.026 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P74 R3
G1 F1200
M204 S6000
G1 X136.154 Y128.026 E.01315
G1 X136.154 Y127.274 E.01315
G1 X136.907 Y127.274 E.01315
G1 X136.907 Y127.966 E.0121
M204 S250
G1 X137.321 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.742 Y128.44 E.02563
G1 X135.742 Y126.86 E.02566
G1 X137.321 Y126.86 E.02563
G1 X137.321 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.742 Y128.44 E-.60023
G1 X135.742 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.11 Y128.023 Z3.9 F42000
G1 X119.846 Y128.026 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.093 Y128.026 E.01315
G1 X119.093 Y127.274 E.01315
G1 X119.846 Y127.274 E.01315
G1 X119.846 Y127.966 E.0121
M204 S250
G1 X120.258 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.679 Y128.44 E.02563
G1 X118.679 Y126.86 E.02566
G1 X120.258 Y126.86 E.02563
G1 X120.259 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.679 Y128.44 E-.60079
G1 X118.679 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 35 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer35 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 36/77
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.864 Y128.026 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.111 Y128.026 E.01315
G1 X136.111 Y127.274 E.01315
G1 X136.864 Y127.274 E.01315
G1 X136.864 Y127.966 E.0121
M204 S250
G1 X137.278 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.7 Y128.44 E.02563
G1 X135.7 Y126.86 E.02566
G1 X137.278 Y126.86 E.02563
G1 X137.278 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.7 Y128.44 E-.60023
G1 X135.7 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.067 Y128.023 Z4 F42000
G1 X119.889 Y128.026 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.136 Y128.026 E.01315
G1 X119.136 Y127.274 E.01315
G1 X119.889 Y127.274 E.01315
G1 X119.889 Y127.966 E.0121
M204 S250
G1 X120.3 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.722 Y128.44 E.02563
G1 X118.722 Y126.86 E.02566
G1 X120.3 Y126.86 E.02563
G1 X120.302 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.722 Y128.44 E-.60079
G1 X118.722 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 36 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer36 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 37/77
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.822 Y128.026 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.069 Y128.026 E.01315
G1 X136.069 Y127.274 E.01315
G1 X136.822 Y127.274 E.01315
M73 P75 R3
G1 X136.822 Y127.966 E.0121
M204 S250
G1 X137.235 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.657 Y128.44 E.02563
G1 X135.657 Y126.86 E.02566
G1 X137.235 Y126.86 E.02563
G1 X137.235 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.657 Y128.44 E-.60023
G1 X135.657 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.024 Y128.023 Z4.1 F42000
G1 X119.931 Y128.026 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.178 Y128.026 E.01315
G1 X119.178 Y127.274 E.01315
G1 X119.931 Y127.274 E.01315
G1 X119.931 Y127.966 E.0121
M204 S250
G1 X120.343 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.765 Y128.44 E.02563
G1 X118.765 Y126.86 E.02566
G1 X120.343 Y126.86 E.02563
G1 X120.345 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.765 Y128.44 E-.60079
G1 X118.765 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 37 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer37 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 38/77
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.779 Y128.026 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X136.026 Y128.026 E.01315
M73 P75 R2
G1 X136.026 Y127.274 E.01315
G1 X136.779 Y127.274 E.01315
G1 X136.779 Y127.966 E.0121
M204 S250
G1 X137.193 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.614 Y128.44 E.02563
G1 X135.614 Y126.86 E.02566
G1 X137.193 Y126.86 E.02563
G1 X137.193 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.614 Y128.44 E-.60023
G1 X135.614 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.982 Y128.023 Z4.2 F42000
G1 X119.974 Y128.026 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.221 Y128.026 E.01315
G1 X119.221 Y127.274 E.01315
G1 X119.974 Y127.274 E.01315
G1 X119.974 Y127.966 E.0121
M204 S250
G1 X120.386 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.807 Y128.44 E.02563
G1 X118.807 Y126.86 E.02566
G1 X120.386 Y126.86 E.02563
G1 X120.387 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.807 Y128.44 E-.60079
G1 X118.807 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 38 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer38 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 39/77
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.737 Y128.026 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.984 Y128.026 E.01315
G1 X135.984 Y127.274 E.01315
G1 X136.737 Y127.274 E.01315
G1 X136.737 Y127.966 E.0121
M204 S250
G1 X137.15 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.572 Y128.44 E.02563
G1 X135.572 Y126.86 E.02566
M73 P76 R2
G1 X137.15 Y126.86 E.02563
G1 X137.15 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.572 Y128.44 E-.60023
G1 X135.572 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.939 Y128.023 Z4.3 F42000
G1 X120.016 Y128.026 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.263 Y128.026 E.01315
G1 X119.263 Y127.274 E.01315
G1 X120.016 Y127.274 E.01315
G1 X120.016 Y127.966 E.0121
M204 S250
G1 X120.428 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.85 Y128.44 E.02563
G1 X118.85 Y126.86 E.02566
G1 X120.428 Y126.86 E.02563
G1 X120.43 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.85 Y128.44 E-.60079
G1 X118.85 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 39 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer39 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 40/77
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.694 Y128.026 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.941 Y128.026 E.01315
G1 X135.941 Y127.274 E.01315
G1 X136.694 Y127.274 E.01315
G1 X136.694 Y127.966 E.0121
M204 S250
G1 X137.108 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.529 Y128.44 E.02563
G1 X135.529 Y126.86 E.02566
G1 X137.108 Y126.86 E.02563
G1 X137.108 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.529 Y128.44 E-.60023
G1 X135.529 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.897 Y128.023 Z4.4 F42000
G1 X120.059 Y128.026 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.306 Y128.026 E.01315
G1 X119.306 Y127.274 E.01315
G1 X120.059 Y127.274 E.01315
G1 X120.059 Y127.966 E.0121
M204 S250
G1 X120.471 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.892 Y128.44 E.02563
G1 X118.892 Y126.86 E.02566
G1 X120.471 Y126.86 E.02563
G1 X120.472 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.892 Y128.44 E-.60079
G1 X118.892 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 40 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer40 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 41/77
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.651 Y128.026 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.899 Y128.026 E.01315
G1 X135.899 Y127.274 E.01315
G1 X136.651 Y127.274 E.01315
G1 X136.651 Y127.966 E.0121
M204 S250
G1 X137.065 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.487 Y128.44 E.02563
G1 X135.487 Y126.86 E.02566
G1 X137.065 Y126.86 E.02563
G1 X137.065 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.487 Y128.44 E-.60023
G1 X135.487 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.854 Y128.023 Z4.5 F42000
M73 P77 R2
G1 X120.101 Y128.026 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.349 Y128.026 E.01315
G1 X119.349 Y127.274 E.01315
G1 X120.101 Y127.274 E.01315
G1 X120.101 Y127.966 E.0121
M204 S250
G1 X120.513 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.935 Y128.44 E.02563
G1 X118.935 Y126.86 E.02566
G1 X120.513 Y126.86 E.02563
G1 X120.515 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.935 Y128.44 E-.60079
G1 X118.935 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 41 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer41 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 42/77
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.609 Y128.026 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.856 Y128.026 E.01315
G1 X135.856 Y127.274 E.01315
G1 X136.609 Y127.274 E.01315
G1 X136.609 Y127.966 E.0121
M204 S250
G1 X137.022 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.444 Y128.44 E.02563
G1 X135.444 Y126.86 E.02566
G1 X137.022 Y126.86 E.02563
G1 X137.022 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.444 Y128.44 E-.60023
G1 X135.444 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.812 Y128.023 Z4.6 F42000
G1 X120.144 Y128.026 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.391 Y128.026 E.01315
G1 X119.391 Y127.274 E.01315
G1 X120.144 Y127.274 E.01315
G1 X120.144 Y127.966 E.0121
M204 S250
G1 X120.556 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.978 Y128.44 E.02563
G1 X118.978 Y126.86 E.02566
G1 X120.556 Y126.86 E.02563
G1 X120.558 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X118.978 Y128.44 E-.60079
G1 X118.978 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 42 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer42 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 43/77
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.566 Y128.026 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.813 Y128.026 E.01315
G1 X135.813 Y127.274 E.01315
G1 X136.566 Y127.274 E.01315
G1 X136.566 Y127.966 E.0121
M204 S250
G1 X136.98 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.401 Y128.44 E.02563
G1 X135.401 Y126.86 E.02566
G1 X136.98 Y126.86 E.02563
G1 X136.98 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.401 Y128.44 E-.60023
G1 X135.401 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.769 Y128.023 Z4.7 F42000
G1 X120.187 Y128.026 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.434 Y128.026 E.01315
G1 X119.434 Y127.274 E.01315
M73 P78 R2
G1 X120.187 Y127.274 E.01315
G1 X120.187 Y127.966 E.0121
M204 S250
G1 X120.599 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.02 Y128.44 E.02563
G1 X119.02 Y126.86 E.02566
G1 X120.599 Y126.86 E.02563
G1 X120.6 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.02 Y128.44 E-.60079
G1 X119.02 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 43 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer43 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 44/77
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.524 Y128.026 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.771 Y128.026 E.01315
G1 X135.771 Y127.274 E.01315
G1 X136.524 Y127.274 E.01315
G1 X136.524 Y127.966 E.0121
M204 S250
G1 X136.937 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.359 Y128.44 E.02563
G1 X135.359 Y126.86 E.02566
G1 X136.937 Y126.86 E.02563
G1 X136.937 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.359 Y128.44 E-.60023
G1 X135.359 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.726 Y128.023 Z4.8 F42000
G1 X120.229 Y128.026 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.476 Y128.026 E.01315
G1 X119.476 Y127.274 E.01315
G1 X120.229 Y127.274 E.01315
G1 X120.229 Y127.966 E.0121
M204 S250
G1 X120.641 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.063 Y128.44 E.02563
G1 X119.063 Y126.86 E.02566
G1 X120.641 Y126.86 E.02563
G1 X120.643 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.063 Y128.44 E-.60079
G1 X119.063 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 44 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer44 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 45/77
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.481 Y128.026 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.728 Y128.026 E.01315
G1 X135.728 Y127.274 E.01315
G1 X136.481 Y127.274 E.01315
G1 X136.481 Y127.966 E.0121
M204 S250
G1 X136.895 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.316 Y128.44 E.02563
G1 X135.316 Y126.86 E.02566
G1 X136.895 Y126.86 E.02563
G1 X136.895 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.316 Y128.44 E-.60023
G1 X135.316 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.684 Y128.023 Z4.9 F42000
G1 X120.272 Y128.026 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.519 Y128.026 E.01315
G1 X119.519 Y127.274 E.01315
G1 X120.272 Y127.274 E.01315
G1 X120.272 Y127.966 E.0121
M204 S250
G1 X120.684 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.105 Y128.44 E.02563
G1 X119.105 Y126.86 E.02566
M73 P79 R2
G1 X120.684 Y126.86 E.02563
G1 X120.685 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.105 Y128.44 E-.60079
G1 X119.105 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 45 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer45 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 46/77
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.439 Y128.026 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.686 Y128.026 E.01315
G1 X135.686 Y127.274 E.01315
G1 X136.439 Y127.274 E.01315
G1 X136.439 Y127.966 E.0121
M204 S250
G1 X136.852 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.274 Y128.44 E.02563
G1 X135.274 Y126.86 E.02566
G1 X136.852 Y126.86 E.02563
G1 X136.852 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.274 Y128.44 E-.60023
G1 X135.274 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.641 Y128.023 Z5 F42000
G1 X120.314 Y128.026 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.561 Y128.026 E.01315
G1 X119.561 Y127.274 E.01315
G1 X120.314 Y127.274 E.01315
G1 X120.314 Y127.966 E.0121
M204 S250
G1 X120.726 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.148 Y128.44 E.02563
G1 X119.148 Y126.86 E.02566
G1 X120.726 Y126.86 E.02563
G1 X120.728 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.148 Y128.44 E-.60079
G1 X119.148 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 46 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer46 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 47/77
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.396 Y128.026 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.643 Y128.026 E.01315
G1 X135.643 Y127.274 E.01315
G1 X136.396 Y127.274 E.01315
G1 X136.396 Y127.966 E.0121
M204 S250
G1 X136.809 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.231 Y128.44 E.02563
G1 X135.231 Y126.86 E.02566
G1 X136.809 Y126.86 E.02563
G1 X136.809 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.231 Y128.44 E-.60023
G1 X135.231 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.599 Y128.023 Z5.1 F42000
G1 X120.357 Y128.026 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.604 Y128.026 E.01315
G1 X119.604 Y127.274 E.01315
G1 X120.357 Y127.274 E.01315
G1 X120.357 Y127.966 E.0121
M204 S250
G1 X120.769 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.191 Y128.44 E.02563
G1 X119.191 Y126.86 E.02566
G1 X120.769 Y126.86 E.02563
G1 X120.771 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.191 Y128.44 E-.60079
G1 X119.191 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 47 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P80 R2
G1 Z5.1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer47 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 48/77
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.353 Y128.026 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.6 Y128.026 E.01315
G1 X135.6 Y127.274 E.01315
G1 X136.353 Y127.274 E.01315
G1 X136.353 Y127.966 E.0121
M204 S250
G1 X136.767 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.188 Y128.44 E.02563
G1 X135.188 Y126.86 E.02566
G1 X136.767 Y126.86 E.02563
G1 X136.767 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.188 Y128.44 E-.60023
G1 X135.188 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.556 Y128.023 Z5.2 F42000
G1 X120.4 Y128.026 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.647 Y128.026 E.01315
G1 X119.647 Y127.274 E.01315
G1 X120.4 Y127.274 E.01315
G1 X120.4 Y127.966 E.0121
M204 S250
G1 X120.812 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.233 Y128.44 E.02563
G1 X119.233 Y126.86 E.02566
G1 X120.812 Y126.86 E.02563
G1 X120.813 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.233 Y128.44 E-.60079
G1 X119.233 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 48 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer48 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 49/77
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.311 Y128.026 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.558 Y128.026 E.01315
G1 X135.558 Y127.274 E.01315
G1 X136.311 Y127.274 E.01315
G1 X136.311 Y127.966 E.0121
M204 S250
G1 X136.724 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.146 Y128.44 E.02563
G1 X135.146 Y126.86 E.02566
G1 X136.724 Y126.86 E.02563
G1 X136.724 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.146 Y128.44 E-.60023
G1 X135.146 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.513 Y128.023 Z5.3 F42000
G1 X120.442 Y128.026 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.689 Y128.026 E.01315
G1 X119.689 Y127.274 E.01315
G1 X120.442 Y127.274 E.01315
G1 X120.442 Y127.966 E.0121
M204 S250
G1 X120.854 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.276 Y128.44 E.02563
G1 X119.276 Y126.86 E.02566
G1 X120.854 Y126.86 E.02563
G1 X120.856 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.276 Y128.44 E-.60079
G1 X119.276 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 49 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer49 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 50/77
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.268 Y128.026 F42000
M73 P81 R2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.515 Y128.026 E.01315
G1 X135.515 Y127.274 E.01315
G1 X136.268 Y127.274 E.01315
G1 X136.268 Y127.966 E.0121
M204 S250
G1 X136.682 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.103 Y128.44 E.02563
G1 X135.103 Y126.86 E.02566
G1 X136.682 Y126.86 E.02563
G1 X136.682 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.103 Y128.44 E-.60023
G1 X135.103 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.471 Y128.023 Z5.4 F42000
G1 X120.485 Y128.026 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.732 Y128.026 E.01315
G1 X119.732 Y127.274 E.01315
G1 X120.485 Y127.274 E.01315
G1 X120.485 Y127.966 E.0121
M204 S250
G1 X120.897 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.318 Y128.44 E.02563
G1 X119.318 Y126.86 E.02566
G1 X120.897 Y126.86 E.02563
G1 X120.898 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.318 Y128.44 E-.60079
G1 X119.318 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 50 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer50 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 51/77
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.226 Y128.026 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.473 Y128.026 E.01315
G1 X135.473 Y127.274 E.01315
G1 X136.226 Y127.274 E.01315
G1 X136.226 Y127.966 E.0121
M204 S250
G1 X136.639 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.061 Y128.44 E.02563
G1 X135.061 Y126.86 E.02566
G1 X136.639 Y126.86 E.02563
G1 X136.639 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.061 Y128.44 E-.60023
G1 X135.061 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.428 Y128.023 Z5.5 F42000
G1 X120.527 Y128.026 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.774 Y128.026 E.01315
G1 X119.774 Y127.274 E.01315
G1 X120.527 Y127.274 E.01315
G1 X120.527 Y127.966 E.0121
M204 S250
G1 X120.939 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.361 Y128.44 E.02563
G1 X119.361 Y126.86 E.02566
G1 X120.939 Y126.86 E.02563
G1 X120.941 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.361 Y128.44 E-.60079
G1 X119.361 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 51 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer51 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 52/77
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.183 Y128.026 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.43 Y128.026 E.01315
G1 X135.43 Y127.274 E.01315
M73 P82 R2
G1 X136.183 Y127.274 E.01315
G1 X136.183 Y127.966 E.0121
M204 S250
G1 X136.596 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.018 Y128.44 E.02563
G1 X135.018 Y126.86 E.02566
G1 X136.596 Y126.86 E.02563
G1 X136.596 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X135.018 Y128.44 E-.60023
G1 X135.018 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.386 Y128.023 Z5.6 F42000
G1 X120.57 Y128.026 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.817 Y128.026 E.01315
G1 X119.817 Y127.274 E.01315
G1 X120.57 Y127.274 E.01315
G1 X120.57 Y127.966 E.0121
M204 S250
G1 X120.982 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.404 Y128.44 E.02563
G1 X119.404 Y126.86 E.02566
G1 X120.982 Y126.86 E.02563
G1 X120.983 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.404 Y128.44 E-.60079
G1 X119.404 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 52 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer52 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 53/77
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.14 Y128.026 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.387 Y128.026 E.01315
G1 X135.387 Y127.274 E.01315
G1 X136.14 Y127.274 E.01315
G1 X136.14 Y127.966 E.0121
M204 S250
G1 X136.554 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.975 Y128.44 E.02563
G1 X134.975 Y126.86 E.02566
G1 X136.554 Y126.86 E.02563
G1 X136.554 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.975 Y128.44 E-.60023
G1 X134.975 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.343 Y128.023 Z5.7 F42000
G1 X120.613 Y128.026 Z5.7
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.86 Y128.026 E.01315
G1 X119.86 Y127.274 E.01315
G1 X120.613 Y127.274 E.01315
G1 X120.613 Y127.966 E.0121
M204 S250
G1 X121.025 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.446 Y128.44 E.02563
G1 X119.446 Y126.86 E.02566
G1 X121.025 Y126.86 E.02563
G1 X121.026 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.446 Y128.44 E-.60079
G1 X119.446 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 53 start: 47,58
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
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer53 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 54/77
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.098 Y128.026 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.345 Y128.026 E.01315
G1 X135.345 Y127.274 E.01315
G1 X136.098 Y127.274 E.01315
G1 X136.098 Y127.966 E.0121
M204 S250
G1 X136.511 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.933 Y128.44 E.02563
G1 X134.933 Y126.86 E.02566
M73 P83 R2
G1 X136.511 Y126.86 E.02563
G1 X136.511 Y128.38 E.02468
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.933 Y128.44 E-.60023
G1 X134.933 Y128.02 E-.15977
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.3 Y128.023 Z5.8 F42000
G1 X120.655 Y128.026 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.902 Y128.026 E.01315
G1 X119.902 Y127.274 E.01315
G1 X120.655 Y127.274 E.01315
G1 X120.655 Y127.966 E.0121
M204 S250
G1 X121.067 Y128.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.489 Y128.44 E.02563
G1 X119.489 Y126.86 E.02566
G1 X121.067 Y126.86 E.02563
G1 X121.069 Y128.382 E.02471
; WIPE_START
G1 F3600
M204 S6000
G1 X119.489 Y128.44 E-.60079
G1 X119.489 Y128.021 E-.15921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 54 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer54 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 55/77
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.079 Y128.043 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.308 Y128.043 E.01345
G1 X135.308 Y127.272 E.01345
G1 X136.079 Y127.272 E.01345
G1 X136.079 Y127.983 E.0124
M204 S250
G1 X136.492 Y128.456 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.895 Y128.456 E.02594
G1 X134.895 Y126.859 E.02594
G1 X136.492 Y126.859 E.02594
G1 X136.492 Y128.396 E.02496
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.895 Y128.456 E-.60744
G1 X134.895 Y128.055 E-.15256
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.262 Y128.048 Z5.9 F42000
G1 X120.692 Y128.043 Z5.9
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.921 Y128.043 E.01345
G1 X119.921 Y127.272 E.01345
G1 X120.692 Y127.272 E.01345
G1 X120.692 Y127.983 E.0124
M204 S250
G1 X121.105 Y128.456 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.508 Y128.456 E.02594
M73 P83 R1
G1 X119.508 Y126.859 E.02594
G1 X121.105 Y126.859 E.02594
G1 X121.105 Y128.396 E.02496
; WIPE_START
G1 F3600
M204 S6000
G1 X119.508 Y128.456 E-.60744
G1 X119.508 Y128.055 E-.15256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 55 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.9
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer55 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 56/77
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.083 Y128.075 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.278 Y128.075 E.01406
G1 X135.278 Y127.27 E.01406
G1 X136.083 Y127.27 E.01406
G1 X136.083 Y128.015 E.01301
M204 S250
G1 X136.497 Y128.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.864 Y128.489 E.0265
G1 X134.864 Y126.857 E.0265
G1 X136.497 Y126.857 E.0265
G1 X136.497 Y128.429 E.02553
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.864 Y128.489 E-.62065
G1 X134.864 Y128.122 E-.13935
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.232 Y128.097 Z6 F42000
G1 X120.722 Y128.075 Z6
M73 P84 R1
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.917 Y128.075 E.01406
G1 X119.917 Y127.27 E.01406
G1 X120.722 Y127.27 E.01406
G1 X120.722 Y128.015 E.01301
M204 S250
G1 X121.136 Y128.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.503 Y128.489 E.0265
G1 X119.503 Y126.857 E.0265
G1 X121.136 Y126.857 E.0265
G1 X121.136 Y128.429 E.02553
; WIPE_START
G1 F3600
M204 S6000
G1 X119.503 Y128.489 E-.62065
G1 X119.503 Y128.122 E-.13935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 56 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer56 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 57/77
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.087 Y128.108 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.247 Y128.108 E.01467
G1 X135.247 Y127.268 E.01467
G1 X136.087 Y127.268 E.01467
G1 X136.087 Y128.048 E.01362
M204 S250
G1 X136.501 Y128.522 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.834 Y128.522 E.02707
G1 X134.834 Y126.855 E.02707
G1 X136.501 Y126.855 E.02707
G1 X136.501 Y128.462 E.02609
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.834 Y128.522 E-.63386
G1 X134.834 Y128.19 E-.12614
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.202 Y128.145 Z6.1 F42000
G1 X120.753 Y128.108 Z6.1
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.913 Y128.108 E.01467
G1 X119.913 Y127.268 E.01467
G1 X120.753 Y127.268 E.01467
G1 X120.753 Y128.048 E.01362
M204 S250
G1 X121.166 Y128.522 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.499 Y128.522 E.02707
G1 X119.499 Y126.855 E.02707
G1 X121.166 Y126.855 E.02707
G1 X121.166 Y128.462 E.02609
; WIPE_START
G1 F3600
M204 S6000
G1 X119.499 Y128.522 E-.63386
G1 X119.499 Y128.19 E-.12614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 57 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer57 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 58/77
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.092 Y128.141 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.217 Y128.141 E.01527
G1 X135.217 Y127.266 E.01527
G1 X136.092 Y127.266 E.01527
G1 X136.092 Y128.081 E.01422
M204 S250
G1 X136.505 Y128.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.803 Y128.554 E.02763
G1 X134.803 Y126.852 E.02763
G1 X136.505 Y126.852 E.02763
G1 X136.505 Y128.494 E.02666
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.803 Y128.554 E-.64707
G1 X134.803 Y128.257 E-.11293
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.171 Y128.194 Z6.2 F42000
G1 X120.783 Y128.141 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.908 Y128.141 E.01527
G1 X119.908 Y127.266 E.01527
G1 X120.783 Y127.266 E.01527
M73 P85 R1
G1 X120.783 Y128.081 E.01422
M204 S250
G1 X121.197 Y128.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.495 Y128.554 E.02763
G1 X119.495 Y126.852 E.02763
G1 X121.197 Y126.852 E.02763
G1 X121.197 Y128.494 E.02666
; WIPE_START
G1 F3600
M204 S6000
G1 X119.495 Y128.554 E-.64707
G1 X119.495 Y128.257 E-.11293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 58 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer58 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 59/77
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.096 Y128.173 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.187 Y128.173 E.01588
G1 X135.187 Y127.264 E.01588
G1 X136.096 Y127.264 E.01588
G1 X136.096 Y128.113 E.01483
M204 S250
G1 X136.51 Y128.587 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.773 Y128.587 E.0282
G1 X134.773 Y126.85 E.0282
G1 X136.51 Y126.85 E.0282
G1 X136.51 Y128.527 E.02722
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.773 Y128.587 E-.66028
G1 X134.773 Y128.324 E-.09972
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.141 Y128.242 Z6.3 F42000
G1 X120.813 Y128.173 Z6.3
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.904 Y128.173 E.01588
G1 X119.904 Y127.264 E.01588
G1 X120.813 Y127.264 E.01588
G1 X120.813 Y128.113 E.01483
M204 S250
G1 X121.227 Y128.587 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.49 Y128.587 E.0282
G1 X119.49 Y126.85 E.0282
G1 X121.227 Y126.85 E.0282
G1 X121.227 Y128.527 E.02722
; WIPE_START
G1 F3600
M204 S6000
G1 X119.49 Y128.587 E-.66028
G1 X119.49 Y128.324 E-.09972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 59 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.3
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer59 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 60/77
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.1 Y128.206 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.156 Y128.206 E.01649
G1 X135.156 Y127.262 E.01649
G1 X136.1 Y127.262 E.01649
G1 X136.1 Y128.146 E.01544
M204 S250
G1 X136.514 Y128.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.743 Y128.619 E.02876
G1 X134.743 Y126.848 E.02876
G1 X136.514 Y126.848 E.02876
G1 X136.514 Y128.559 E.02779
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.743 Y128.619 E-.67349
G1 X134.743 Y128.392 E-.08651
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.111 Y128.29 Z6.4 F42000
G1 X120.844 Y128.206 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.9 Y128.206 E.01649
G1 X119.9 Y127.262 E.01649
G1 X120.844 Y127.262 E.01649
G1 X120.844 Y128.146 E.01544
M204 S250
G1 X121.257 Y128.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.486 Y128.619 E.02876
M73 P86 R1
G1 X119.486 Y126.848 E.02876
G1 X121.257 Y126.848 E.02876
G1 X121.257 Y128.559 E.02779
; WIPE_START
G1 F3600
M204 S6000
G1 X119.486 Y128.619 E-.67349
G1 X119.486 Y128.392 E-.08651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 60 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer60 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 61/77
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.105 Y128.238 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.126 Y128.238 E.01709
G1 X135.126 Y127.259 E.01709
G1 X136.105 Y127.259 E.01709
G1 X136.105 Y128.178 E.01605
M204 S250
G1 X136.518 Y128.652 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.712 Y128.652 E.02933
G1 X134.712 Y126.846 E.02933
G1 X136.518 Y126.846 E.02933
G1 X136.518 Y128.592 E.02835
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.712 Y128.652 E-.6867
G1 X134.712 Y128.459 E-.0733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.081 Y128.337 Z6.5 F42000
G1 X120.874 Y128.238 Z6.5
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.895 Y128.238 E.01709
G1 X119.895 Y127.259 E.01709
G1 X120.874 Y127.259 E.01709
G1 X120.874 Y128.178 E.01605
M204 S250
G1 X121.288 Y128.652 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.482 Y128.652 E.02933
G1 X119.482 Y126.846 E.02933
G1 X121.288 Y126.846 E.02933
G1 X121.288 Y128.592 E.02835
; WIPE_START
G1 F3600
M204 S6000
G1 X119.482 Y128.652 E-.6867
G1 X119.482 Y128.459 E-.0733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 61 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.5
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer61 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 62/77
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.109 Y128.271 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.095 Y128.271 E.0177
G1 X135.095 Y127.257 E.0177
G1 X136.109 Y127.257 E.0177
G1 X136.109 Y128.211 E.01665
M204 S250
G1 X136.523 Y128.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.682 Y128.685 E.02989
G1 X134.682 Y126.844 E.02989
G1 X136.523 Y126.844 E.02989
G1 X136.523 Y128.625 E.02892
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.682 Y128.685 E-.69991
G1 X134.682 Y128.526 E-.06009
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.051 Y128.385 Z6.6 F42000
G1 X120.905 Y128.271 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.891 Y128.271 E.0177
G1 X119.891 Y127.257 E.0177
G1 X120.905 Y127.257 E.0177
G1 X120.905 Y128.211 E.01665
M204 S250
G1 X121.318 Y128.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.477 Y128.685 E.02989
G1 X119.477 Y126.844 E.02989
M73 P87 R1
G1 X121.318 Y126.844 E.02989
G1 X121.318 Y128.625 E.02892
; WIPE_START
G1 F3600
M204 S6000
G1 X119.477 Y128.685 E-.69991
G1 X119.477 Y128.526 E-.06009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 62 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer62 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 63/77
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.113 Y128.304 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.065 Y128.304 E.01831
G1 X135.065 Y127.255 E.01831
G1 X136.113 Y127.255 E.01831
G1 X136.113 Y128.244 E.01726
M204 S250
G1 X136.527 Y128.717 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.651 Y128.717 E.03046
G1 X134.651 Y126.842 E.03046
G1 X136.527 Y126.842 E.03046
G1 X136.527 Y128.657 E.02948
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.651 Y128.717 E-.71312
G1 X134.651 Y128.594 E-.04688
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.021 Y128.432 Z6.7 F42000
G1 X120.935 Y128.304 Z6.7
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.887 Y128.304 E.01831
G1 X119.887 Y127.255 E.01831
G1 X120.935 Y127.255 E.01831
G1 X120.935 Y128.244 E.01726
M204 S250
G1 X121.349 Y128.717 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.473 Y128.717 E.03046
G1 X119.473 Y126.842 E.03046
G1 X121.349 Y126.842 E.03046
G1 X121.349 Y128.657 E.02948
; WIPE_START
G1 F3600
M204 S6000
G1 X119.473 Y128.717 E-.71312
G1 X119.473 Y128.594 E-.04688
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 63 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.7
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer63 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 64/77
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.118 Y128.336 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.034 Y128.336 E.01892
G1 X135.034 Y127.253 E.01892
G1 X136.118 Y127.253 E.01892
G1 X136.118 Y128.276 E.01787
M204 S250
G1 X136.531 Y128.75 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.621 Y128.75 E.03102
G1 X134.621 Y126.839 E.03102
G1 X136.531 Y126.839 E.03102
G1 X136.531 Y128.69 E.03005
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.621 Y128.75 E-.72633
G1 X134.621 Y128.661 E-.03367
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.991 Y128.48 Z6.8 F42000
G1 X120.966 Y128.336 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X119.882 Y128.336 E.01892
G1 X119.882 Y127.253 E.01892
G1 X120.966 Y127.253 E.01892
G1 X120.966 Y128.276 E.01787
M204 S250
G1 X121.379 Y128.75 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P88 R1
G1 X119.469 Y128.75 E.03102
G1 X119.469 Y126.839 E.03102
G1 X121.379 Y126.839 E.03102
G1 X121.379 Y128.69 E.03005
; WIPE_START
G1 F3600
M204 S6000
G1 X119.469 Y128.75 E-.72633
G1 X119.469 Y128.661 E-.03367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 64 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer64 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 65/77
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.694 Y127.94 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.432 Y127.94 E.00456
G1 X135.432 Y127.679 E.00456
G1 X135.694 Y127.679 E.00456
G1 X135.694 Y127.88 E.00351
M204 S10000
G1 X136.122 Y128.369 F42000
G1 F1200
M204 S6000
G1 X135.004 Y128.369 E.01952
G1 X135.004 Y127.251 E.01952
G1 X136.122 Y127.251 E.01952
G1 X136.122 Y128.309 E.01848
M204 S250
G1 X136.536 Y128.782 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.59 Y128.782 E.03159
G1 X134.59 Y126.837 E.03159
G1 X136.536 Y126.837 E.03159
G1 X136.536 Y128.722 E.03061
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.59 Y128.782 E-.73954
G1 X134.59 Y128.729 E-.02046
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.97 Y128.3 Z6.9 F42000
G1 X120.568 Y127.94 Z6.9
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.306 Y127.94 E.00456
G1 X120.306 Y127.679 E.00456
G1 X120.568 Y127.679 E.00456
G1 X120.568 Y127.88 E.00351
M204 S10000
G1 X120.996 Y128.369 F42000
G1 F1200
M204 S6000
G1 X119.878 Y128.369 E.01952
G1 X119.878 Y127.251 E.01952
G1 X120.996 Y127.251 E.01952
G1 X120.996 Y128.309 E.01848
M204 S250
G1 X121.41 Y128.782 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.464 Y128.782 E.03159
G1 X119.464 Y126.837 E.03159
G1 X121.41 Y126.837 E.03159
G1 X121.41 Y128.722 E.03061
; WIPE_START
G1 F3600
M204 S6000
G1 X119.464 Y128.782 E-.73954
G1 X119.464 Y128.729 E-.02046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 65 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.9
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer65 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 66/77
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.698 Y127.973 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.402 Y127.973 E.00517
G1 X135.402 Y127.677 E.00517
G1 X135.698 Y127.677 E.00517
G1 X135.698 Y127.913 E.00412
M204 S10000
G1 X136.126 Y128.401 F42000
G1 F1200
M204 S6000
G1 X134.974 Y128.401 E.02013
G1 X134.974 Y127.249 E.02013
G1 X136.126 Y127.249 E.02013
G1 X136.126 Y128.341 E.01908
M204 S250
G1 X136.54 Y128.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P89 R1
G1 X134.56 Y128.815 E.03215
G1 X134.56 Y126.835 E.03215
G1 X136.54 Y126.835 E.03215
G1 X136.54 Y128.755 E.03118
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.56 Y128.815 E-.75275
G1 X134.56 Y128.796 E-.00725
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.941 Y128.347 Z7 F42000
G1 X120.598 Y127.973 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.302 Y127.973 E.00517
G1 X120.302 Y127.677 E.00517
G1 X120.598 Y127.677 E.00517
G1 X120.598 Y127.913 E.00412
M204 S10000
G1 X121.026 Y128.401 F42000
G1 F1200
M204 S6000
G1 X119.874 Y128.401 E.02013
G1 X119.874 Y127.249 E.02013
G1 X121.026 Y127.249 E.02013
G1 X121.026 Y128.341 E.01908
M204 S250
G1 X121.44 Y128.815 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.46 Y128.815 E.03215
G1 X119.46 Y126.835 E.03215
G1 X121.44 Y126.835 E.03215
G1 X121.44 Y128.755 E.03118
; WIPE_START
G1 F3600
M204 S6000
G1 X119.46 Y128.815 E-.75275
G1 X119.46 Y128.796 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 66 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer66 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 67/77
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.702 Y128.006 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.372 Y128.006 E.00577
G1 X135.372 Y127.675 E.00577
G1 X135.702 Y127.675 E.00577
G1 X135.702 Y127.946 E.00473
M204 S10000
G1 X136.131 Y128.434 F42000
G1 F1200
M204 S6000
G1 X134.943 Y128.434 E.02074
G1 X134.943 Y127.246 E.02074
G1 X136.131 Y127.246 E.02074
G1 X136.131 Y128.374 E.01969
M204 S250
G1 X136.544 Y128.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.53 Y128.848 E.03272
G1 X134.53 Y126.833 E.03272
G1 X136.544 Y126.833 E.03272
G1 X136.544 Y128.788 E.03174
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.545 Y128.847 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.927 Y128.386 Z7.1 F42000
G1 X120.628 Y128.006 Z7.1
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.298 Y128.006 E.00577
G1 X120.298 Y127.675 E.00577
G1 X120.628 Y127.675 E.00577
G1 X120.628 Y127.946 E.00473
M204 S10000
G1 X121.057 Y128.434 F42000
G1 F1200
M204 S6000
G1 X119.869 Y128.434 E.02074
G1 X119.869 Y127.246 E.02074
G1 X121.057 Y127.246 E.02074
G1 X121.057 Y128.374 E.01969
M204 S250
G1 X121.47 Y128.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.456 Y128.848 E.03272
G1 X119.456 Y126.833 E.03272
G1 X121.47 Y126.833 E.03272
M73 P90 R1
G1 X121.47 Y128.788 E.03174
; WIPE_START
G1 F3600
M204 S6000
G1 X119.471 Y128.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 67 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer67 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 68/77
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.707 Y128.038 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.341 Y128.038 E.00638
G1 X135.341 Y127.673 E.00638
G1 X135.707 Y127.673 E.00638
G1 X135.707 Y127.978 E.00533
M204 S10000
G1 X136.135 Y128.467 F42000
G1 F1200
M204 S6000
G1 X134.913 Y128.467 E.02135
G1 X134.913 Y127.244 E.02135
G1 X136.135 Y127.244 E.02135
G1 X136.135 Y128.407 E.0203
M204 S250
G1 X136.549 Y128.88 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.499 Y128.88 E.03328
G1 X134.499 Y126.831 E.03328
G1 X136.549 Y126.831 E.03328
G1 X136.549 Y128.82 E.03231
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.55 Y128.879 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.931 Y128.418 Z7.2 F42000
G1 X120.659 Y128.038 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.293 Y128.038 E.00638
G1 X120.293 Y127.673 E.00638
G1 X120.659 Y127.673 E.00638
G1 X120.659 Y127.978 E.00533
M204 S10000
G1 X121.087 Y128.467 F42000
G1 F1200
M204 S6000
G1 X119.865 Y128.467 E.02135
G1 X119.865 Y127.244 E.02135
G1 X121.087 Y127.244 E.02135
G1 X121.087 Y128.407 E.0203
M204 S250
G1 X121.501 Y128.88 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.451 Y128.88 E.03328
G1 X119.451 Y126.831 E.03328
G1 X121.501 Y126.831 E.03328
G1 X121.501 Y128.82 E.03231
; WIPE_START
G1 F3600
M204 S6000
G1 X119.502 Y128.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 68 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer68 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 69/77
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.711 Y128.071 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.311 Y128.071 E.00699
G1 X135.311 Y127.671 E.00699
G1 X135.711 Y127.671 E.00699
G1 X135.711 Y128.011 E.00594
M204 S10000
G1 X136.14 Y128.499 F42000
G1 F1200
M204 S6000
G1 X134.882 Y128.499 E.02195
G1 X134.882 Y127.242 E.02195
G1 X136.14 Y127.242 E.02195
G1 X136.14 Y128.439 E.02091
M204 S250
G1 X136.553 Y128.913 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.469 Y128.913 E.03385
G1 X134.469 Y126.828 E.03385
G1 X136.553 Y126.828 E.03385
G1 X136.553 Y128.853 E.03287
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.554 Y128.91 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.935 Y128.449 Z7.3 F42000
G1 X120.689 Y128.071 Z7.3
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.289 Y128.071 E.00699
G1 X120.289 Y127.671 E.00699
G1 X120.689 Y127.671 E.00699
G1 X120.689 Y128.011 E.00594
M204 S10000
G1 X121.118 Y128.499 F42000
G1 F1200
M204 S6000
G1 X119.86 Y128.499 E.02195
G1 X119.86 Y127.242 E.02195
G1 X121.118 Y127.242 E.02195
G1 X121.118 Y128.439 E.02091
M204 S250
G1 X121.531 Y128.913 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.447 Y128.913 E.03385
G1 X119.447 Y126.828 E.03385
G1 X121.531 Y126.828 E.03385
G1 X121.531 Y128.853 E.03287
; WIPE_START
G1 F3600
M204 S6000
G1 X119.532 Y128.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P91 R1
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 69 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.3
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer69 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 70/77
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.715 Y128.103 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.28 Y128.103 E.0076
G1 X135.28 Y127.668 E.0076
G1 X135.715 Y127.668 E.0076
G1 X135.715 Y128.043 E.00655
M204 S10000
G1 X136.144 Y128.532 F42000
G1 F1200
M204 S6000
G1 X134.852 Y128.532 E.02256
G1 X134.852 Y127.24 E.02256
G1 X136.144 Y127.24 E.02256
G1 X136.144 Y128.472 E.02151
M204 S250
G1 X136.557 Y128.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.438 Y128.945 E.03441
G1 X134.438 Y126.826 E.03441
G1 X136.557 Y126.826 E.03441
G1 X136.557 Y128.885 E.03344
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.558 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.94 Y128.48 Z7.4 F42000
G1 X120.72 Y128.103 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.285 Y128.103 E.0076
G1 X120.285 Y127.668 E.0076
G1 X120.72 Y127.668 E.0076
G1 X120.72 Y128.043 E.00655
M204 S10000
G1 X121.148 Y128.532 F42000
G1 F1200
M204 S6000
G1 X119.856 Y128.532 E.02256
G1 X119.856 Y127.24 E.02256
G1 X121.148 Y127.24 E.02256
G1 X121.148 Y128.472 E.02151
M204 S250
G1 X121.562 Y128.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.443 Y128.945 E.03441
G1 X119.443 Y126.826 E.03441
G1 X121.562 Y126.826 E.03441
G1 X121.562 Y128.885 E.03344
; WIPE_START
G1 F3600
M204 S6000
G1 X119.563 Y128.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 70 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer70 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 71/77
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.72 Y128.136 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.25 Y128.136 E.0082
G1 X135.25 Y127.666 E.0082
G1 X135.72 Y127.666 E.0082
G1 X135.72 Y128.076 E.00716
M204 S10000
G1 X136.148 Y128.565 F42000
G1 F1200
M204 S6000
G1 X134.821 Y128.565 E.02317
G1 X134.821 Y127.238 E.02317
G1 X136.148 Y127.238 E.02317
G1 X136.148 Y128.505 E.02212
M204 S250
G1 X136.562 Y128.978 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.408 Y128.978 E.03498
G1 X134.408 Y126.824 E.03498
G1 X136.562 Y126.824 E.03498
G1 X136.562 Y128.918 E.034
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.563 Y128.974 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.944 Y128.512 Z7.5 F42000
G1 X120.75 Y128.136 Z7.5
M73 P91 R0
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.28 Y128.136 E.0082
G1 X120.28 Y127.666 E.0082
G1 X120.75 Y127.666 E.0082
G1 X120.75 Y128.076 E.00716
M204 S10000
G1 X121.179 Y128.565 F42000
G1 F1200
M204 S6000
G1 X119.852 Y128.565 E.02317
G1 X119.852 Y127.238 E.02317
G1 X121.179 Y127.238 E.02317
G1 X121.179 Y128.505 E.02212
M204 S250
G1 X121.592 Y128.978 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.438 Y128.978 E.03498
G1 X119.438 Y126.824 E.03498
G1 X121.592 Y126.824 E.03498
G1 X121.592 Y128.918 E.034
; WIPE_START
G1 F3600
M204 S6000
G1 X119.593 Y128.974 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 71 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.5
G1 X0 Y127.65 F18000 ; move to safe pos
M73 P92 R0
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer71 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 72/77
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.724 Y128.169 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.219 Y128.169 E.00881
G1 X135.219 Y127.664 E.00881
G1 X135.724 Y127.664 E.00881
G1 X135.724 Y128.109 E.00776
M204 S10000
G1 X136.153 Y128.597 F42000
G1 F1200
M204 S6000
G1 X134.791 Y128.597 E.02377
G1 X134.791 Y127.235 E.02378
G1 X136.153 Y127.235 E.02377
G1 X136.153 Y128.537 E.02273
M204 S250
G1 X136.566 Y129.011 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.377 Y129.011 E.03554
G1 X134.377 Y126.822 E.03554
G1 X136.566 Y126.822 E.03554
G1 X136.566 Y128.951 E.03457
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.567 Y129.005 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.948 Y128.543 Z7.6 F42000
G1 X120.781 Y128.169 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.276 Y128.169 E.00881
G1 X120.276 Y127.664 E.00881
G1 X120.781 Y127.664 E.00881
G1 X120.781 Y128.109 E.00776
M204 S10000
G1 X121.209 Y128.597 F42000
G1 F1200
M204 S6000
G1 X119.847 Y128.597 E.02377
G1 X119.847 Y127.235 E.02378
G1 X121.209 Y127.235 E.02377
G1 X121.209 Y128.537 E.02273
M204 S250
G1 X121.623 Y129.011 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.434 Y129.011 E.03554
G1 X119.434 Y126.822 E.03554
G1 X121.623 Y126.822 E.03554
G1 X121.623 Y128.951 E.03457
; WIPE_START
G1 F3600
M204 S6000
G1 X119.623 Y129.005 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 72 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer72 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.3
; LAYER_HEIGHT: 0.1
; layer num/total_layer_count: 73/77
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.728 Y128.201 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.189 Y128.201 E.00942
G1 X135.189 Y127.662 E.00942
G1 X135.728 Y127.662 E.00942
G1 X135.728 Y128.141 E.00837
M204 S10000
G1 X136.157 Y128.63 F42000
G1 F1200
M204 S6000
G1 X134.76 Y128.63 E.02438
G1 X134.76 Y127.233 E.02438
G1 X136.157 Y127.233 E.02438
G1 X136.157 Y128.57 E.02333
M204 S250
G1 X136.57 Y129.043 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.347 Y129.043 E.0361
G1 X134.347 Y126.82 E.03611
G1 X136.57 Y126.82 E.0361
G1 X136.57 Y128.983 E.03513
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.571 Y129.037 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.953 Y128.574 Z7.7 F42000
G1 X120.811 Y128.201 Z7.7
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.272 Y128.201 E.00942
G1 X120.272 Y127.662 E.00942
G1 X120.811 Y127.662 E.00942
G1 X120.811 Y128.141 E.00837
M204 S10000
G1 X121.24 Y128.63 F42000
G1 F1200
M204 S6000
G1 X119.843 Y128.63 E.02438
G1 X119.843 Y127.233 E.02438
G1 X121.24 Y127.233 E.02438
G1 X121.24 Y128.57 E.02333
M204 S250
G1 X121.653 Y129.043 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P93 R0
G1 F1200
M204 S5000
G1 X119.43 Y129.043 E.0361
G1 X119.43 Y126.82 E.03611
G1 X121.653 Y126.82 E.0361
G1 X121.653 Y128.983 E.03513
; WIPE_START
G1 F3600
M204 S6000
G1 X119.654 Y129.037 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 73 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.7
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer73 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 74/77
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.733 Y128.234 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.159 Y128.234 E.01003
G1 X135.159 Y127.66 E.01003
G1 X135.733 Y127.66 E.01003
G1 X135.733 Y128.174 E.00898
M204 S10000
G1 X136.161 Y128.662 F42000
G1 F1200
M204 S6000
G1 X134.73 Y128.662 E.02499
G1 X134.73 Y127.231 E.02499
G1 X136.161 Y127.231 E.02499
G1 X136.161 Y128.602 E.02394
M204 S250
G1 X136.575 Y129.076 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.317 Y129.076 E.03667
G1 X134.317 Y126.818 E.03667
G1 X136.575 Y126.818 E.03667
G1 X136.575 Y129.016 E.0357
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.575 Y129.069 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.957 Y128.606 Z7.8 F42000
G1 X120.841 Y128.234 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.267 Y128.234 E.01003
G1 X120.267 Y127.66 E.01003
G1 X120.841 Y127.66 E.01003
G1 X120.841 Y128.174 E.00898
M204 S10000
G1 X121.27 Y128.662 F42000
G1 F1200
M204 S6000
G1 X119.839 Y128.662 E.02499
G1 X119.839 Y127.231 E.02499
G1 X121.27 Y127.231 E.02499
G1 X121.27 Y128.602 E.02394
M204 S250
G1 X121.683 Y129.076 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.425 Y129.076 E.03667
G1 X119.425 Y126.818 E.03667
G1 X121.683 Y126.818 E.03667
G1 X121.683 Y129.016 E.0357
; WIPE_START
G1 F3600
M204 S6000
G1 X119.684 Y129.069 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 74 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer74 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 75/77
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.737 Y128.266 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.128 Y128.266 E.01063
G1 X135.128 Y127.657 E.01063
G1 X135.737 Y127.657 E.01063
G1 X135.737 Y128.206 E.00959
M204 S10000
G1 X136.166 Y128.695 F42000
G1 F1200
M204 S6000
G1 X134.7 Y128.695 E.0256
M73 P94 R0
G1 X134.7 Y127.229 E.0256
G1 X136.166 Y127.229 E.0256
G1 X136.166 Y128.635 E.02455
M204 S250
G1 X136.579 Y129.108 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.286 Y129.108 E.03723
G1 X134.286 Y126.815 E.03723
G1 X136.579 Y126.815 E.03723
G1 X136.579 Y129.048 E.03626
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.58 Y129.101 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.961 Y128.637 Z7.9 F42000
G1 X120.872 Y128.266 Z7.9
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.263 Y128.266 E.01063
G1 X120.263 Y127.657 E.01063
G1 X120.872 Y127.657 E.01063
G1 X120.872 Y128.206 E.00959
M204 S10000
G1 X121.3 Y128.695 F42000
G1 F1200
M204 S6000
G1 X119.834 Y128.695 E.0256
G1 X119.834 Y127.229 E.0256
G1 X121.3 Y127.229 E.0256
G1 X121.3 Y128.635 E.02455
M204 S250
G1 X121.714 Y129.108 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.421 Y129.108 E.03723
G1 X119.421 Y126.815 E.03723
G1 X121.714 Y126.815 E.03723
G1 X121.714 Y129.048 E.03626
; WIPE_START
G1 F3600
M204 S6000
G1 X119.715 Y129.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 75 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.9
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer75 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 76/77
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.741 Y128.299 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X135.098 Y128.299 E.01124
G1 X135.098 Y127.655 E.01124
G1 X135.741 Y127.655 E.01124
G1 X135.741 Y128.239 E.01019
M204 S10000
G1 X136.17 Y128.728 F42000
G1 F1200
M204 S6000
G1 X134.669 Y128.728 E.0262
G1 X134.669 Y127.227 E.0262
G1 X136.17 Y127.227 E.0262
G1 X136.17 Y128.668 E.02516
M204 S250
G1 X136.583 Y129.141 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X134.256 Y129.141 E.0378
G1 X134.256 Y126.813 E.0378
G1 X136.583 Y126.813 E.0378
G1 X136.583 Y129.081 E.03683
; OBJECT_ID: 47
; WIPE_START
G1 F3600
M204 S6000
G1 X134.584 Y129.133 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.966 Y128.668 Z8 F42000
G1 X120.902 Y128.299 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X120.259 Y128.299 E.01124
G1 X120.259 Y127.655 E.01124
G1 X120.902 Y127.655 E.01124
G1 X120.902 Y128.239 E.01019
M204 S10000
G1 X121.331 Y128.728 F42000
G1 F1200
M204 S6000
G1 X119.83 Y128.728 E.0262
G1 X119.83 Y127.227 E.0262
G1 X121.331 Y127.227 E.0262
G1 X121.331 Y128.668 E.02516
M204 S250
G1 X121.744 Y129.141 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X119.417 Y129.141 E.0378
G1 X119.417 Y126.813 E.0378
G1 X121.744 Y126.813 E.0378
G1 X121.744 Y129.081 E.03683
; WIPE_START
G1 F3600
M204 S6000
G1 X119.745 Y129.133 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
M625
; object ids of layer 76 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer76 end: 47,58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.0999999
; layer num/total_layer_count: 77/77
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X136.588 Y129.174 F42000
G1 Z7.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X134.225 Y129.174 E.03836
G1 X134.225 Y126.811 E.03836
G1 X136.588 Y126.811 E.03836
G1 X136.588 Y129.114 E.03739
; WIPE_START
G1 F3600
M204 S6000
M73 P95 R0
G1 X134.588 Y129.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
M625
; object ids of layer 77 start: 47,58
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.1
G1 X0 Y127.65 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer77 end: 47,58
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G1 X135.812 Y127.03 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X136.369 Y127.587 E.01278
G1 X136.369 Y128.151
G1 X135.248 Y127.03 E.02573
G1 X134.685 Y127.03
G1 X136.369 Y128.714 E.03867
G1 X136.045 Y128.955
G1 X134.444 Y127.353 E.03677
G1 X134.444 Y127.917
G1 X135.482 Y128.955 E.02382
G1 X134.918 Y128.955
G1 X134.444 Y128.481 E.01088
; OBJECT_ID: 47
; WIPE_START
G1 F3000
M204 S6000
G1 X134.918 Y128.955 E-.25464
G1 X135.482 Y128.955 E-.21417
G1 X134.94 Y128.413 E-.29119
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.32 Y128.853 Z8.1 F42000
G1 X121.775 Y129.174 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1200
M204 S5000
G1 X119.412 Y129.174 E.03836
G1 X119.412 Y126.811 E.03836
G1 X121.775 Y126.811 E.03836
G1 X121.775 Y129.114 E.03739
; WIPE_START
G1 F3600
M204 S6000
G1 X119.775 Y129.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.556 Y127.519 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X121.066 Y127.03 E.01123
G1 X120.503 Y127.03
G1 X121.556 Y128.083 E.02418
G1 X121.556 Y128.647
G1 X119.939 Y127.03 E.03712
G1 X119.631 Y127.286
G1 X121.3 Y128.955 E.03832
G1 X120.736 Y128.955
G1 X119.631 Y127.85 E.02537
G1 X119.631 Y128.413
G1 X120.173 Y128.955 E.01243
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3000
M204 S6000
G1 X119.631 Y128.413 E-.2909
G1 X119.631 Y127.85 E-.21417
G1 X120.106 Y128.324 E-.25493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
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
G1 Z8.1 F900 ; lower z a little
G1 X0 Y127.65 F18000 ; move to safe pos
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

    G1 Z107.7 F600
    G1 Z105.7

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

