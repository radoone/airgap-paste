; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 5m 18s; total estimated time: 12m 5s
; total layer number: 77
; total filament length [mm] : 53.92
; total filament volume [cm^3] : 129.69
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
M73 P0 R12
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
M73 P0 R11
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
M73 P1 R11
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
M73 P4 R11
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P6 R11
G1 X-48.2 F3000
M73 P8 R11
G1 X-28.5 F30000 ;wipe and shake
M73 P9 R10
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
M73 P14 R10
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
M73 P50 R5
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
M73 P51 R5
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
    G29 A1 X121.543 Y120.272 I12.9139 J14.7564
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
M73 P52 R5
G1 E-.8 F1800
; layer num/total_layer_count: 1/77
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X122.756 Y126.535 F42000
M204 S6000
G1 Z.4
G1 Z.1
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
M73 P53 R5
G1 F1500
M204 S500
G1 X123.178 Y126.138 E.0113
G1 X123.658 Y125.814 E.0113
G1 X124.207 Y125.561 E.01177
G1 X124.761 Y125.393 E.01129
G1 X125.534 Y125.311 E.01515
G1 X127.512 Y125.311 E.03856
M73 P54 R5
G1 X128.089 Y125.358 E.0113
G1 X128.089 Y126.25 E.0174
G1 X128.146 Y126.44 E.00386
G1 X128.273 Y126.571 E.00357
M73 P55 R5
G1 X128.479 Y126.639 E.00422
G1 X130.37 Y126.639 E.03687
G1 X130.433 Y126.707 E.00181
G1 X130.758 Y127.188 E.01133
G1 X130.971 Y127.636 E.00967
G1 X131.178 Y128.291 E.0134
G1 X131.26 Y129.063 E.01513
M73 P56 R5
G1 X131.26 Y131.04 E.03856
G1 X131.213 Y131.628 E.01149
G1 X131.073 Y132.193 E.01136
G1 X130.915 Y132.589 E.00831
G1 X130.639 Y133.105 E.01141
G1 X130.286 Y133.565 E.0113
G1 X129.865 Y133.962 E.0113
G1 X129.383 Y134.287 E.01133
G1 X128.935 Y134.5 E.00967
G1 X128.28 Y134.707 E.0134
G1 X127.509 Y134.789 E.01513
G1 X125.531 Y134.789 E.03856
G1 X124.944 Y134.741 E.01149
G1 X124.378 Y134.602 E.01136
G1 X123.982 Y134.444 E.00831
G1 X123.467 Y134.167 E.01141
G1 X123.007 Y133.815 E.0113
G1 X122.609 Y133.393 E.0113
G1 X122.284 Y132.912 E.01133
G1 X122.071 Y132.464 E.00967
G1 X121.865 Y131.809 E.0134
G1 X121.782 Y131.037 E.01512
G1 X121.782 Y129.06 E.03856
G1 X121.83 Y128.472 E.01149
G1 X121.97 Y127.907 E.01136
G1 X122.127 Y127.511 E.00831
G1 X122.404 Y126.995 E.01141
G1 X122.72 Y126.583 E.01013
M204 S6000
G1 X123.101 Y126.875 F42000
G1 F1500
M204 S500
G1 X123.121 Y126.849 E.00064
G1 X123.469 Y126.521 E.00933
G1 X123.884 Y126.239 E.00978
G1 X124.368 Y126.014 E.0104
G1 X124.87 Y125.863 E.01022
G1 X125.552 Y125.79 E.01337
G1 X127.467 Y125.79 E.03735
G1 X127.574 Y125.837 E.00228
G1 X127.611 Y125.933 E.002
G1 X127.611 Y126.24 E.00597
G1 X127.634 Y126.397 E.0031
G1 X127.683 Y126.56 E.00332
G1 X127.813 Y126.784 E.00506
G1 X127.916 Y126.891 E.00289
G1 X128.14 Y127.031 E.00514
G1 X128.318 Y127.09 E.00366
G1 X128.49 Y127.118 E.00341
G1 X130.057 Y127.118 E.03055
G1 X130.176 Y127.181 E.00263
G1 X130.346 Y127.436 E.00597
G1 X130.528 Y127.821 E.0083
G1 X130.703 Y128.376 E.01135
G1 X130.781 Y129.081 E.01382
G1 X130.781 Y131.027 E.03794
G1 X130.736 Y131.562 E.01047
G1 X130.612 Y132.056 E.00993
G1 X130.477 Y132.394 E.00711
G1 X130.241 Y132.834 E.00974
G1 X129.922 Y133.251 E.01023
G1 X129.555 Y133.594 E.00978
G1 X129.154 Y133.864 E.00943
G1 X128.75 Y134.056 E.00872
G1 X128.167 Y134.237 E.0119
G1 X127.475 Y134.31 E.01357
G1 X125.545 Y134.31 E.03765
G1 X125.01 Y134.265 E.01047
G1 X124.516 Y134.141 E.00993
G1 X124.177 Y134.006 E.00711
G1 X123.737 Y133.769 E.00974
G1 X123.32 Y133.45 E.01023
G1 X122.978 Y133.084 E.00978
G1 X122.707 Y132.683 E.00943
G1 X122.515 Y132.279 E.00872
G1 X122.334 Y131.696 E.0119
G1 X122.261 Y131.004 E.01356
G1 X122.261 Y129.073 E.03765
G1 X122.307 Y128.538 E.01046
G1 X122.43 Y128.044 E.00993
G1 X122.566 Y127.706 E.00711
G1 X122.802 Y127.266 E.00974
G1 X123.065 Y126.923 E.00843
M204 S6000
G1 X123.446 Y127.215 F42000
G1 F1500
M204 S500
G1 X123.486 Y127.163 E.00127
G1 X123.779 Y126.889 E.00783
G1 X124.112 Y126.663 E.00783
G1 X124.529 Y126.467 E.00899
G1 X124.978 Y126.333 E.00914
G1 X125.57 Y126.27 E.0116
G1 X127.007 Y126.268 E.02803
G1 X127.114 Y126.316 E.00228
G1 X127.273 Y126.806 E.01004
G1 X127.476 Y127.123 E.00734
G1 X127.67 Y127.301 E.00514
G1 X128.001 Y127.489 E.00743
G1 X128.249 Y127.563 E.00504
G1 X128.5 Y127.596 E.00493
G1 X129.803 Y127.599 E.02542
G1 X129.933 Y127.682 E.00299
G1 X130.084 Y128.005 E.00696
G1 X130.228 Y128.462 E.00934
G1 X130.302 Y129.115 E.01282
G1 X130.302 Y131.013 E.037
G1 X130.263 Y131.471 E.00898
G1 X130.153 Y131.917 E.00895
G1 X130.039 Y132.198 E.00592
G1 X129.843 Y132.564 E.00809
G1 X129.557 Y132.937 E.00916
G1 X129.246 Y133.225 E.00826
G1 X128.906 Y133.452 E.00798
G1 X128.566 Y133.613 E.00734
G1 X128.056 Y133.768 E.01039
G1 X127.443 Y133.832 E.01203
G1 X125.559 Y133.831 E.03673
G1 X125.1 Y133.792 E.00898
G1 X124.654 Y133.681 E.00895
G1 X124.373 Y133.567 E.00592
G1 X124.007 Y133.372 E.00809
G1 X123.635 Y133.086 E.00916
G1 X123.347 Y132.775 E.00826
G1 X123.119 Y132.435 E.00798
G1 X122.959 Y132.095 E.00734
G1 X122.803 Y131.585 E.01039
G1 X122.739 Y130.972 E.01203
G1 X122.74 Y129.087 E.03674
G1 X122.779 Y128.629 E.00898
G1 X122.89 Y128.183 E.00895
G1 X123.004 Y127.902 E.00592
G1 X123.2 Y127.536 E.00809
G1 X123.409 Y127.262 E.00672
M204 S6000
G1 X123.791 Y127.555 F42000
G1 F1500
M204 S500
G1 X123.85 Y127.477 E.0019
G1 X124.088 Y127.257 E.00632
G1 X124.34 Y127.086 E.00594
G1 X124.69 Y126.919 E.00756
G1 X125.086 Y126.803 E.00804
G1 X125.603 Y126.748 E.01015
G1 X126.646 Y126.747 E.02033
G1 X126.783 Y126.847 E.0033
G1 X126.85 Y127.02 E.00363
G1 X126.853 Y127.137 E.00228
G1 X126.721 Y127.225 E.0031
G1 X125.559 Y127.225 E.02265
G1 X124.931 Y127.344 E.01247
G1 X124.695 Y127.449 E.00503
G1 X124.397 Y127.64 E.00689
G1 X124.29 Y127.731 E.00274
G1 X124.123 Y127.912 E.00481
G1 X123.942 Y128.182 E.00633
G1 X123.786 Y128.552 E.00783
G1 X123.696 Y129.083 E.0105
G1 X123.696 Y131.014 E.03765
G1 X123.785 Y131.533 E.01027
G1 X123.922 Y131.879 E.00725
G1 X124.112 Y132.174 E.00683
G1 X124.2 Y132.279 E.00268
G1 X124.486 Y132.522 E.00732
G1 X124.92 Y132.752 E.00957
G1 X125.145 Y132.819 E.00457
G1 X125.472 Y132.87 E.00646
G1 X127.598 Y132.864 E.04146
G1 X128.111 Y132.756 E.0102
G1 X128.348 Y132.651 E.00506
G1 X128.645 Y132.46 E.00689
G1 X128.915 Y132.192 E.00741
G1 X129.17 Y131.773 E.00956
G1 X129.291 Y131.424 E.00721
G1 X129.341 Y131.099 E.00641
G1 X129.346 Y129.086 E.03925
G1 X129.258 Y128.565 E.0103
G1 X129.149 Y128.27 E.00613
G1 X129.157 Y128.153 E.00228
G1 X129.291 Y128.077 E.003
G1 X129.51 Y128.088 E.00428
G1 X129.64 Y128.188 E.0032
G1 X129.759 Y128.575 E.00791
G1 X129.823 Y129.134 E.01096
G1 X129.823 Y130.998 E.03635
G1 X129.791 Y131.381 E.0075
G1 X129.699 Y131.759 E.00757
G1 X129.601 Y132.002 E.0051
G1 X129.432 Y132.313 E.0069
G1 X129.21 Y132.604 E.00714
G1 X128.957 Y132.84 E.00674
G1 X128.679 Y133.029 E.00655
G1 X128.403 Y133.161 E.00597
G1 X127.974 Y133.293 E.00875
G1 X127.41 Y133.353 E.01105
G1 X125.585 Y133.352 E.03559
G1 X125.19 Y133.319 E.00773
G1 X124.812 Y133.227 E.00757
G1 X124.57 Y133.13 E.0051
G1 X124.258 Y132.961 E.0069
G1 X123.968 Y132.738 E.00714
G1 X123.731 Y132.486 E.00674
G1 X123.543 Y132.208 E.00655
G1 X123.411 Y131.931 E.00597
G1 X123.279 Y131.503 E.00875
G1 X123.218 Y130.939 E.01105
G1 X123.219 Y129.114 E.03559
G1 X123.252 Y128.718 E.00773
G1 X123.344 Y128.341 E.00757
G1 X123.441 Y128.098 E.0051
G1 X123.598 Y127.807 E.00645
G1 X123.754 Y127.602 E.00502
M204 S6000
G1 X124.468 Y128.244 F42000
G1 F1500
M204 S500
G1 X124.649 Y128.048 E.0052
G1 X124.963 Y127.845 E.00729
G1 X125.115 Y127.785 E.00319
G1 X125.545 Y127.704 E.00853
G1 X127.498 Y127.704 E.03808
G1 X127.839 Y127.758 E.00673
G1 X128.123 Y127.87 E.00595
G1 X128.434 Y128.085 E.00737
G1 X128.606 Y128.286 E.00515
G1 X128.725 Y128.489 E.00459
G1 X128.786 Y128.644 E.00325
G1 X128.868 Y129.074 E.00853
G1 X128.868 Y131.029 E.03812
G1 X128.835 Y131.28 E.00493
G1 X128.76 Y131.527 E.00504
G1 X128.572 Y131.858 E.00743
G1 X128.394 Y132.052 E.00514
G1 X128.079 Y132.255 E.00729
G1 X127.927 Y132.315 E.00319
G1 X127.497 Y132.396 E.00853
G1 X125.542 Y132.396 E.03812
G1 X125.292 Y132.363 E.00493
G1 X125.044 Y132.289 E.00504
G1 X124.713 Y132.101 E.00743
G1 X124.519 Y131.922 E.00514
G1 X124.317 Y131.608 E.00729
G1 X124.257 Y131.456 E.00319
G1 X124.175 Y131.026 E.00853
G1 X124.175 Y129.073 E.03808
G1 X124.23 Y128.732 E.00673
G1 X124.342 Y128.445 E.00601
G1 X124.436 Y128.295 E.00345
M204 S6000
G1 X124.842 Y128.55 F42000
G1 F1500
M204 S500
G1 X124.88 Y128.488 E.00142
G1 X124.987 Y128.385 E.00289
G1 X125.211 Y128.254 E.00506
G1 X125.532 Y128.182 E.00641
G1 X127.51 Y128.182 E.03857
G1 X127.682 Y128.21 E.0034
G1 X127.86 Y128.269 E.00366
G1 X128.084 Y128.409 E.00514
G1 X128.187 Y128.516 E.00289
G1 X128.317 Y128.74 E.00506
G1 X128.389 Y129.06 E.00641
G1 X128.389 Y131.038 E.03857
G1 X128.361 Y131.211 E.00341
G1 X128.303 Y131.389 E.00366
G1 X128.162 Y131.612 E.00514
G1 X128.055 Y131.715 E.00289
G1 X127.831 Y131.846 E.00506
G1 X127.511 Y131.918 E.00641
G1 X125.533 Y131.918 E.03857
G1 X125.36 Y131.89 E.00341
G1 X125.182 Y131.831 E.00366
G1 X124.959 Y131.691 E.00514
G1 X124.856 Y131.584 E.00289
G1 X124.725 Y131.36 E.00506
G1 X124.654 Y131.04 E.00641
G1 X124.654 Y129.061 E.03857
G1 X124.681 Y128.889 E.0034
G1 X124.74 Y128.711 E.00366
G1 X124.81 Y128.6 E.00255
M204 S6000
G1 X125.2 Y128.844 F42000
G1 F1500
M204 S500
G1 X125.332 Y128.717 E.00357
G1 X125.521 Y128.661 E.00386
G1 X127.521 Y128.661 E.03899
G1 X127.727 Y128.729 E.00422
G1 X127.854 Y128.86 E.00357
G1 X127.911 Y129.05 E.00386
G1 X127.911 Y131.05 E.03899
G1 X127.843 Y131.256 E.00422
G1 X127.711 Y131.383 E.00357
G1 X127.521 Y131.439 E.00386
M73 P57 R5
G1 X125.521 Y131.439 E.03899
G1 X125.316 Y131.371 E.00422
G1 X125.189 Y131.24 E.00357
G1 X125.132 Y131.05 E.00386
G1 X125.132 Y129.05 E.03899
G1 X125.181 Y128.901 E.00305
; WIPE_START
G1 X125.332 Y128.717 E-.09038
G1 X125.521 Y128.661 E-.07518
G1 X127.086 Y128.661 E-.59444
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.271 Y130.8 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X125.771 Y130.8 E.02925
G1 X125.771 Y129.3 E.02925
G1 X127.271 Y129.3 E.02925
G1 X127.271 Y130.74 E.02808
M204 S6000
G1 X126.793 Y130.321 F42000
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X126.25 Y130.321 E.01059
G1 X126.25 Y129.778 E.01059
G1 X126.793 Y129.778 E.01059
G1 X126.793 Y130.261 E.00942
; OBJECT_ID: 58
; WIPE_START
G1 X126.25 Y130.321 E-.20758
G1 X126.25 Y129.778 E-.20633
G1 X126.793 Y129.778 E-.20632
G1 X126.793 Y130.146 E-.13978
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S6000
G1 X131.739 Y129.749 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S500
G1 X131.737 Y129.025 E.01413
G1 X131.642 Y128.173 E.01671
G1 X131.452 Y127.55 E.0127
G1 X131.184 Y126.969 E.01247
G1 X130.816 Y126.419 E.0129
G1 X130.868 Y126.25 E.00345
G1 X130.868 Y124.25 E.03899
G1 X130.811 Y124.06 E.00386
G1 X130.684 Y123.929 E.00357
G1 X130.479 Y123.861 E.00422
G1 X128.479 Y123.861 E.03899
G1 X128.391 Y123.877 E.00174
G1 X128.289 Y123.917 E.00214
G1 X128.157 Y124.044 E.00357
G1 X128.109 Y124.154 E.00234
G1 X128.089 Y124.25 E.0019
G1 X128.089 Y124.878 E.01224
G1 X127.521 Y124.832 E.01111
G1 X125.521 Y124.832 E.03899
G1 X124.74 Y124.915 E.01532
G1 X124.74 Y124.26 E.01277
G1 X124.787 Y123.672 E.01149
G1 X124.927 Y123.107 E.01136
G1 X125.085 Y122.711 E.00831
G1 X125.361 Y122.195 E.01141
G1 X125.714 Y121.735 E.0113
G1 X126.135 Y121.338 E.0113
G1 X126.617 Y121.013 E.01133
G1 X127.065 Y120.8 E.00967
G1 X127.72 Y120.593 E.0134
G1 X128.491 Y120.511 E.01512
G1 X130.469 Y120.511 E.03856
G1 X131.056 Y120.559 E.01149
G1 X131.623 Y120.699 E.01138
G1 X131.91 Y120.809 E.006
G1 X132.535 Y121.134 E.01372
G1 X132.993 Y121.485 E.01127
G1 X133.391 Y121.907 E.0113
G1 X133.715 Y122.387 E.0113
G1 X133.968 Y122.935 E.01177
G1 X134.135 Y123.49 E.01129
G1 X134.218 Y124.263 E.01516
G1 X134.218 Y126.24 E.03856
G1 X134.17 Y126.828 E.01149
G1 X134.03 Y127.393 E.01136
G1 X133.873 Y127.789 E.00831
G1 X133.596 Y128.305 E.01141
G1 X133.244 Y128.765 E.0113
G1 X132.822 Y129.162 E.0113
G1 X132.341 Y129.487 E.01133
G1 X131.892 Y129.7 E.00968
G1 X131.796 Y129.731 E.00197
M204 S6000
G1 X132.297 Y128.882 F42000
G1 F1500
M204 S500
G1 X132.189 Y128.76 E.00316
G1 X132.096 Y128.021 E.01453
G1 X131.912 Y127.419 E.01228
G1 X131.623 Y126.778 E.01372
G1 X131.362 Y126.375 E.00935
G1 X131.339 Y126.297 E.00159
G1 X131.346 Y124.26 E.03971
G1 X131.275 Y123.94 E.0064
G1 X131.144 Y123.716 E.00506
G1 X131.041 Y123.609 E.00289
G1 X130.818 Y123.469 E.00514
G1 X130.64 Y123.41 E.00366
G1 X130.468 Y123.382 E.0034
G1 X128.384 Y123.393 E.04062
G1 X128.122 Y123.47 E.00533
G1 X127.947 Y123.583 E.00406
G1 X127.835 Y123.69 E.00302
G1 X127.713 Y123.866 E.00418
G1 X127.676 Y123.95 E.00179
G1 X127.612 Y124.242 E.00581
G1 X127.542 Y124.336 E.00228
G1 X127.472 Y124.354 E.0014
G1 X125.368 Y124.367 E.04104
G1 X125.26 Y124.32 E.00228
G1 X125.224 Y124.212 E.00222
G1 X125.264 Y123.738 E.00926
G1 X125.382 Y123.263 E.00955
G1 X125.523 Y122.906 E.00749
G1 X125.759 Y122.466 E.00974
G1 X126.078 Y122.049 E.01023
G1 X126.445 Y121.706 E.00978
G1 X126.846 Y121.436 E.00943
G1 X127.25 Y121.244 E.00872
G1 X127.833 Y121.063 E.0119
G1 X128.524 Y120.99 E.01356
G1 X130.456 Y120.99 E.03765
G1 X130.99 Y121.035 E.01046
G1 X131.487 Y121.159 E.00999
G1 X131.721 Y121.25 E.00488
G1 X132.266 Y121.533 E.01198
G1 X132.663 Y121.834 E.00971
G1 X133.008 Y122.198 E.00978
G1 X133.29 Y122.613 E.00978
G1 X133.515 Y123.096 E.0104
G1 X133.66 Y123.572 E.0097
G1 X133.739 Y124.296 E.01419
G1 X133.739 Y126.215 E.03742
G1 X133.693 Y126.762 E.01069
G1 X133.57 Y127.256 E.00993
G1 X133.434 Y127.594 E.00711
G1 X133.198 Y128.034 E.00974
G1 X132.879 Y128.451 E.01023
G1 X132.531 Y128.779 E.00933
G1 X132.412 Y128.861 E.00281
G1 X132.356 Y128.871 E.00111
; WIPE_START
G1 X132.189 Y128.76 E-.076
G1 X132.096 Y128.021 E-.28317
G1 X131.912 Y127.419 E-.23927
G1 X131.737 Y127.031 E-.16156
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.572 Y127.838 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X132.518 Y127.764 E.00179
G1 X132.345 Y127.214 E.01123
G1 X132.063 Y126.589 E.01336
G1 X131.84 Y126.233 E.0082
G1 X131.818 Y126.156 E.00155
G1 X131.825 Y124.276 E.03667
G1 X131.743 Y123.844 E.00857
G1 X131.683 Y123.692 E.00319
G1 X131.481 Y123.378 E.00729
G1 X131.285 Y123.197 E.0052
G1 X131.084 Y123.071 E.00462
G1 X130.797 Y122.959 E.00601
G1 X130.453 Y122.904 E.00678
G1 X128.392 Y122.914 E.0402
G1 X128.239 Y122.937 E.00301
G1 X127.996 Y123.008 E.00493
G1 X127.857 Y123.072 E.00298
G1 X127.609 Y123.244 E.00589
G1 X127.436 Y123.426 E.00489
G1 X127.327 Y123.583 E.00374
G1 X127.225 Y123.796 E.0046
G1 X127.096 Y123.878 E.00297
G1 X125.905 Y123.885 E.02323
G1 X125.798 Y123.838 E.00228
G1 X125.765 Y123.707 E.00263
G1 X125.842 Y123.4 E.00616
G1 X125.962 Y123.101 E.00629
G1 X126.17 Y122.717 E.00852
G1 X126.443 Y122.363 E.00871
G1 X126.753 Y122.075 E.00826
G1 X127.094 Y121.848 E.00798
G1 X127.434 Y121.687 E.00734
G1 X127.944 Y121.532 E.01039
G1 X128.557 Y121.468 E.01203
G1 X130.429 Y121.469 E.0365
G1 X130.9 Y121.508 E.00921
G1 X131.333 Y121.614 E.0087
G1 X131.53 Y121.69 E.00411
G1 X132.019 Y121.946 E.01076
G1 X132.35 Y122.2 E.00814
G1 X132.641 Y122.509 E.00826
G1 X132.877 Y122.86 E.00826
G1 X133.07 Y123.278 E.00896
G1 X133.191 Y123.682 E.00824
G1 X133.26 Y124.314 E.01239
G1 X133.26 Y126.201 E.03679
G1 X133.221 Y126.672 E.0092
G1 X133.11 Y127.117 E.00895
G1 X132.995 Y127.4 E.00595
G1 X132.781 Y127.79 E.00868
G1 X132.687 Y127.86 E.00228
G1 X132.631 Y127.849 E.00112
; WIPE_START
G1 X132.518 Y127.764 E-.05391
G1 X132.345 Y127.214 E-.21894
G1 X132.063 Y126.589 E-.26047
G1 X131.84 Y126.233 E-.1598
G1 X131.818 Y126.156 E-.03021
G1 X131.819 Y126.06 E-.03666
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.609 Y126.468 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F1500
M204 S500
G1 X132.503 Y126.4 E.00246
G1 X132.318 Y126.095 E.00695
G1 X132.297 Y126.02 E.00151
G1 X132.303 Y124.291 E.03371
G1 X132.184 Y123.659 E.01253
G1 X132.08 Y123.423 E.00503
G1 X131.888 Y123.126 E.00689
G1 X131.798 Y123.019 E.00274
G1 X131.616 Y122.852 E.00481
G1 X131.346 Y122.671 E.00633
G1 X130.866 Y122.485 E.01005
G1 X130.441 Y122.425 E.00837
G1 X128.397 Y122.436 E.03984
G1 X128.176 Y122.463 E.00434
G1 X127.87 Y122.547 E.00619
G1 X127.576 Y122.685 E.00633
G1 X127.255 Y122.923 E.0078
G1 X127.038 Y123.16 E.00626
G1 X126.918 Y123.338 E.00419
G1 X126.8 Y123.401 E.00261
G1 X126.585 Y123.402 E.0042
G1 X126.477 Y123.355 E.00228
G1 X126.457 Y123.19 E.00324
G1 X126.579 Y122.969 E.00492
G1 X126.806 Y122.679 E.00718
G1 X127.06 Y122.446 E.00674
G1 X127.34 Y122.261 E.00653
G1 X127.617 Y122.132 E.00595
G1 X128.053 Y122.002 E.00888
G1 X128.575 Y121.947 E.01023
G1 X130.403 Y121.947 E.03566
G1 X130.812 Y121.981 E.00799
G1 X131.18 Y122.069 E.0074
G1 X131.746 Y122.344 E.01226
G1 X132.036 Y122.565 E.00711
G1 X132.272 Y122.818 E.00675
G1 X132.464 Y123.106 E.00675
G1 X132.617 Y123.438 E.00712
G1 X132.716 Y123.765 E.00667
G1 X132.78 Y124.332 E.01113
G1 X132.769 Y126.326 E.03888
G1 X132.721 Y126.433 E.00228
G1 X132.666 Y126.45 E.00111
; WIPE_START
G1 X132.503 Y126.4 E-.06496
G1 X132.318 Y126.095 E-.13547
G1 X132.297 Y126.02 E-.02949
G1 X132.302 Y124.625 E-.53008
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.229 Y126 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X128.729 Y126 E.02925
G1 X128.729 Y124.5 E.02925
G1 X130.229 Y124.5 E.02925
G1 X130.229 Y125.94 E.02808
M204 S6000
G1 X129.75 Y125.521 F42000
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X129.207 Y125.521 E.01059
G1 X129.207 Y124.979 E.01059
G1 X129.75 Y124.979 E.01059
G1 X129.75 Y125.461 E.00942
; WIPE_START
G1 X129.207 Y125.521 E-.20758
G1 X129.207 Y124.979 E-.20632
G1 X129.75 Y124.979 E-.20632
G1 X129.75 Y125.346 E-.13978
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X126.94 Y130.426 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.187 Y130.426 E.01315
G1 X126.187 Y129.673 E.01315
M73 P58 R5
G1 X126.94 Y129.673 E.01315
G1 X126.94 Y130.366 E.0121
M204 S250
G1 X127.354 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.352 Y130.84 E.00003
G1 X125.774 Y130.84 E.02563
G1 X125.774 Y129.26 E.02566
G1 X127.352 Y129.26 E.02563
G1 X127.354 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.352 Y130.84 E-.02281
G1 X125.774 Y130.84 E-.5998
G1 X125.774 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.813 Y125.626 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.06 Y125.626 E.01315
G1 X129.06 Y124.874 E.01315
G1 X129.813 Y124.874 E.01315
G1 X129.813 Y125.566 E.0121
M204 S250
G1 X130.226 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.648 Y126.04 E.02563
G1 X128.648 Y124.46 E.02566
G1 X130.226 Y124.46 E.02563
G1 X130.226 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.648 Y126.04 E-.60023
G1 X128.648 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X126.983 Y130.426 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.23 Y130.426 E.01315
G1 X126.23 Y129.673 E.01315
G1 X126.983 Y129.673 E.01315
G1 X126.983 Y130.366 E.0121
M204 S250
G1 X127.396 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.395 Y130.84 E.00003
G1 X125.816 Y130.84 E.02563
G1 X125.816 Y129.26 E.02566
G1 X127.395 Y129.26 E.02563
G1 X127.396 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.395 Y130.84 E-.02281
G1 X125.816 Y130.84 E-.5998
G1 X125.816 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.77 Y125.626 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P58 R4
G1 X129.017 Y125.626 E.01315
G1 X129.017 Y124.874 E.01315
G1 X129.77 Y124.874 E.01315
G1 X129.77 Y125.566 E.0121
M204 S250
G1 X130.184 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.605 Y126.04 E.02563
G1 X128.605 Y124.46 E.02566
G1 X130.184 Y124.46 E.02563
G1 X130.184 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.605 Y126.04 E-.60023
G1 X128.605 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.026 Y130.426 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.273 Y130.426 E.01315
G1 X126.273 Y129.673 E.01315
G1 X127.026 Y129.673 E.01315
M73 P59 R4
G1 X127.026 Y130.366 E.0121
M204 S250
G1 X127.439 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.437 Y130.84 E.00003
G1 X125.859 Y130.84 E.02563
G1 X125.859 Y129.26 E.02566
G1 X127.437 Y129.26 E.02563
G1 X127.439 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.437 Y130.84 E-.02281
G1 X125.859 Y130.84 E-.5998
G1 X125.859 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.727 Y125.626 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.974 Y125.626 E.01315
G1 X128.974 Y124.874 E.01315
G1 X129.727 Y124.874 E.01315
G1 X129.727 Y125.566 E.0121
M204 S250
G1 X130.141 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.563 Y126.04 E.02563
G1 X128.563 Y124.46 E.02566
G1 X130.141 Y124.46 E.02563
G1 X130.141 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.563 Y126.04 E-.60023
G1 X128.563 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.068 Y130.426 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.315 Y130.426 E.01315
G1 X126.315 Y129.673 E.01315
G1 X127.068 Y129.673 E.01315
G1 X127.068 Y130.366 E.0121
M204 S250
G1 X127.482 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.48 Y130.84 E.00003
G1 X125.902 Y130.84 E.02563
G1 X125.902 Y129.26 E.02566
G1 X127.48 Y129.26 E.02563
G1 X127.482 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.48 Y130.84 E-.02281
G1 X125.902 Y130.84 E-.5998
G1 X125.902 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.685 Y125.626 Z.9 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.932 Y125.626 E.01315
G1 X128.932 Y124.874 E.01315
G1 X129.685 Y124.874 E.01315
G1 X129.685 Y125.566 E.0121
M204 S250
M73 P60 R4
G1 X130.098 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.52 Y126.04 E.02563
G1 X128.52 Y124.46 E.02566
G1 X130.098 Y124.46 E.02563
G1 X130.098 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.52 Y126.04 E-.60023
G1 X128.52 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.111 Y130.426 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.358 Y130.426 E.01315
G1 X126.358 Y129.673 E.01315
G1 X127.111 Y129.673 E.01315
G1 X127.111 Y130.366 E.0121
M204 S250
G1 X127.524 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.523 Y130.84 E.00003
G1 X125.944 Y130.84 E.02563
G1 X125.944 Y129.26 E.02566
G1 X127.523 Y129.26 E.02563
G1 X127.524 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.523 Y130.84 E-.02281
G1 X125.944 Y130.84 E-.5998
G1 X125.944 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.642 Y125.626 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.889 Y125.626 E.01315
G1 X128.889 Y124.874 E.01315
G1 X129.642 Y124.874 E.01315
G1 X129.642 Y125.566 E.0121
M204 S250
G1 X130.056 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.477 Y126.04 E.02563
G1 X128.477 Y124.46 E.02566
G1 X130.056 Y124.46 E.02563
G1 X130.056 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.477 Y126.04 E-.60023
G1 X128.477 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.153 Y130.426 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.4 Y130.426 E.01315
G1 X126.4 Y129.673 E.01315
G1 X127.153 Y129.673 E.01315
G1 X127.153 Y130.366 E.0121
M204 S250
G1 X127.567 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.565 Y130.84 E.00003
G1 X125.987 Y130.84 E.02563
G1 X125.987 Y129.26 E.02566
G1 X127.565 Y129.26 E.02563
G1 X127.567 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.565 Y130.84 E-.02281
G1 X125.987 Y130.84 E-.5998
G1 X125.987 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.6 Y125.626 Z1.1 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.847 Y125.626 E.01315
G1 X128.847 Y124.874 E.01315
G1 X129.6 Y124.874 E.01315
G1 X129.6 Y125.566 E.0121
M204 S250
G1 X130.013 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.435 Y126.04 E.02563
G1 X128.435 Y124.46 E.02566
M73 P61 R4
G1 X130.013 Y124.46 E.02563
G1 X130.013 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.435 Y126.04 E-.60023
G1 X128.435 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.196 Y130.426 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.443 Y130.426 E.01315
G1 X126.443 Y129.673 E.01315
G1 X127.196 Y129.673 E.01315
G1 X127.196 Y130.366 E.0121
M204 S250
G1 X127.609 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.608 Y130.84 E.00003
G1 X126.029 Y130.84 E.02563
G1 X126.029 Y129.26 E.02566
G1 X127.608 Y129.26 E.02563
G1 X127.609 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.608 Y130.84 E-.02281
G1 X126.029 Y130.84 E-.5998
G1 X126.029 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.557 Y125.626 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.804 Y125.626 E.01315
G1 X128.804 Y124.874 E.01315
G1 X129.557 Y124.874 E.01315
G1 X129.557 Y125.566 E.0121
M204 S250
G1 X129.971 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.392 Y126.04 E.02563
G1 X128.392 Y124.46 E.02566
G1 X129.971 Y124.46 E.02563
G1 X129.971 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.392 Y126.04 E-.60023
G1 X128.392 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.238 Y130.426 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.486 Y130.426 E.01315
G1 X126.486 Y129.673 E.01315
G1 X127.238 Y129.673 E.01315
G1 X127.238 Y130.366 E.0121
M204 S250
G1 X127.652 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.65 Y130.84 E.00003
G1 X126.072 Y130.84 E.02563
G1 X126.072 Y129.26 E.02566
G1 X127.65 Y129.26 E.02563
G1 X127.652 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.65 Y130.84 E-.02281
G1 X126.072 Y130.84 E-.5998
G1 X126.072 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.514 Y125.626 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.761 Y125.626 E.01315
G1 X128.761 Y124.874 E.01315
G1 X129.514 Y124.874 E.01315
G1 X129.514 Y125.566 E.0121
M204 S250
G1 X129.928 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.35 Y126.04 E.02563
G1 X128.35 Y124.46 E.02566
G1 X129.928 Y124.46 E.02563
G1 X129.928 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.35 Y126.04 E-.60023
M73 P62 R4
G1 X128.35 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.281 Y130.426 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.528 Y130.426 E.01315
G1 X126.528 Y129.673 E.01315
G1 X127.281 Y129.673 E.01315
G1 X127.281 Y130.366 E.0121
M204 S250
G1 X127.695 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.693 Y130.84 E.00003
G1 X126.115 Y130.84 E.02563
G1 X126.115 Y129.26 E.02566
G1 X127.693 Y129.26 E.02563
G1 X127.695 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.693 Y130.84 E-.02281
G1 X126.115 Y130.84 E-.5998
G1 X126.115 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.472 Y125.626 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.719 Y125.626 E.01315
G1 X128.719 Y124.874 E.01315
G1 X129.472 Y124.874 E.01315
G1 X129.472 Y125.566 E.0121
M204 S250
G1 X129.885 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.307 Y126.04 E.02563
G1 X128.307 Y124.46 E.02566
G1 X129.885 Y124.46 E.02563
G1 X129.885 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.307 Y126.04 E-.60023
G1 X128.307 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.324 Y130.426 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.571 Y130.426 E.01315
G1 X126.571 Y129.673 E.01315
G1 X127.324 Y129.673 E.01315
G1 X127.324 Y130.366 E.0121
M204 S250
G1 X127.737 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.736 Y130.84 E.00003
G1 X126.157 Y130.84 E.02563
G1 X126.157 Y129.26 E.02566
G1 X127.736 Y129.26 E.02563
G1 X127.737 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.736 Y130.84 E-.02281
G1 X126.157 Y130.84 E-.5998
G1 X126.157 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.429 Y125.626 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.676 Y125.626 E.01315
G1 X128.676 Y124.874 E.01315
G1 X129.429 Y124.874 E.01315
G1 X129.429 Y125.566 E.0121
M204 S250
G1 X129.843 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.264 Y126.04 E.02563
G1 X128.264 Y124.46 E.02566
G1 X129.843 Y124.46 E.02563
G1 X129.843 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.264 Y126.04 E-.60023
G1 X128.264 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M73 P63 R4
G1 X127.366 Y130.426 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.613 Y130.426 E.01315
G1 X126.613 Y129.673 E.01315
G1 X127.366 Y129.673 E.01315
G1 X127.366 Y130.366 E.0121
M204 S250
G1 X127.78 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.778 Y130.84 E.00003
G1 X126.2 Y130.84 E.02563
G1 X126.2 Y129.26 E.02566
G1 X127.778 Y129.26 E.02563
G1 X127.78 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.778 Y130.84 E-.02281
G1 X126.2 Y130.84 E-.5998
G1 X126.2 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.387 Y125.626 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.634 Y125.626 E.01315
G1 X128.634 Y124.874 E.01315
G1 X129.387 Y124.874 E.01315
G1 X129.387 Y125.566 E.0121
M204 S250
G1 X129.8 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.222 Y126.04 E.02563
G1 X128.222 Y124.46 E.02566
G1 X129.8 Y124.46 E.02563
G1 X129.8 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.222 Y126.04 E-.60023
G1 X128.222 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.409 Y130.426 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.656 Y130.426 E.01315
G1 X126.656 Y129.673 E.01315
G1 X127.409 Y129.673 E.01315
G1 X127.409 Y130.366 E.0121
M204 S250
G1 X127.822 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.821 Y130.84 E.00003
G1 X126.242 Y130.84 E.02563
G1 X126.242 Y129.26 E.02566
G1 X127.821 Y129.26 E.02563
G1 X127.822 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.821 Y130.84 E-.02281
G1 X126.242 Y130.84 E-.5998
G1 X126.242 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.344 Y125.626 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.591 Y125.626 E.01315
G1 X128.591 Y124.874 E.01315
G1 X129.344 Y124.874 E.01315
G1 X129.344 Y125.566 E.0121
M204 S250
G1 X129.758 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.179 Y126.04 E.02563
G1 X128.179 Y124.46 E.02566
G1 X129.758 Y124.46 E.02563
G1 X129.758 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.179 Y126.04 E-.60023
G1 X128.179 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
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
G1 Z1.7
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.451 Y130.426 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P64 R4
G1 X126.699 Y130.426 E.01315
G1 X126.699 Y129.673 E.01315
G1 X127.451 Y129.673 E.01315
G1 X127.451 Y130.366 E.0121
M204 S250
G1 X127.865 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.863 Y130.84 E.00003
G1 X126.285 Y130.84 E.02563
G1 X126.285 Y129.26 E.02566
G1 X127.863 Y129.26 E.02563
G1 X127.865 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.863 Y130.84 E-.02281
G1 X126.285 Y130.84 E-.5998
G1 X126.285 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.301 Y125.626 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.549 Y125.626 E.01315
G1 X128.549 Y124.874 E.01315
G1 X129.301 Y124.874 E.01315
G1 X129.301 Y125.566 E.0121
M204 S250
G1 X129.715 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.137 Y126.04 E.02563
G1 X128.137 Y124.46 E.02566
G1 X129.715 Y124.46 E.02563
G1 X129.715 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.137 Y126.04 E-.60023
G1 X128.137 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.494 Y130.426 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.741 Y130.426 E.01315
G1 X126.741 Y129.673 E.01315
G1 X127.494 Y129.673 E.01315
G1 X127.494 Y130.366 E.0121
M204 S250
G1 X127.908 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.906 Y130.84 E.00003
G1 X126.328 Y130.84 E.02563
G1 X126.328 Y129.26 E.02566
G1 X127.906 Y129.26 E.02563
G1 X127.908 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.906 Y130.84 E-.02281
G1 X126.328 Y130.84 E-.5998
G1 X126.328 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.259 Y125.626 Z1.9 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.506 Y125.626 E.01315
G1 X128.506 Y124.874 E.01315
G1 X129.259 Y124.874 E.01315
G1 X129.259 Y125.566 E.0121
M204 S250
G1 X129.672 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.094 Y126.04 E.02563
G1 X128.094 Y124.46 E.02566
G1 X129.672 Y124.46 E.02563
G1 X129.672 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.094 Y126.04 E-.60023
G1 X128.094 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.537 Y130.426 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.784 Y130.426 E.01315
G1 X126.784 Y129.673 E.01315
G1 X127.537 Y129.673 E.01315
G1 X127.537 Y130.366 E.0121
M204 S250
M73 P65 R4
G1 X127.95 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.949 Y130.84 E.00003
G1 X126.37 Y130.84 E.02563
G1 X126.37 Y129.26 E.02566
G1 X127.949 Y129.26 E.02563
G1 X127.95 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.949 Y130.84 E-.02281
G1 X126.37 Y130.84 E-.5998
G1 X126.37 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.216 Y125.626 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.463 Y125.626 E.01315
G1 X128.463 Y124.874 E.01315
G1 X129.216 Y124.874 E.01315
G1 X129.216 Y125.566 E.0121
M204 S250
G1 X129.63 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.051 Y126.04 E.02563
G1 X128.051 Y124.46 E.02566
G1 X129.63 Y124.46 E.02563
G1 X129.63 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.051 Y126.04 E-.60023
G1 X128.051 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.579 Y130.426 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.826 Y130.426 E.01315
G1 X126.826 Y129.673 E.01315
G1 X127.579 Y129.673 E.01315
G1 X127.579 Y130.366 E.0121
M204 S250
G1 X127.993 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.991 Y130.84 E.00003
G1 X126.413 Y130.84 E.02563
G1 X126.413 Y129.26 E.02566
G1 X127.991 Y129.26 E.02563
G1 X127.993 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.991 Y130.84 E-.02281
G1 X126.413 Y130.84 E-.5998
G1 X126.413 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.174 Y125.626 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.421 Y125.626 E.01315
G1 X128.421 Y124.874 E.01315
G1 X129.174 Y124.874 E.01315
G1 X129.174 Y125.566 E.0121
M204 S250
G1 X129.587 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.009 Y126.04 E.02563
G1 X128.009 Y124.46 E.02566
G1 X129.587 Y124.46 E.02563
G1 X129.587 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X128.009 Y126.04 E-.60023
G1 X128.009 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.622 Y130.426 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.869 Y130.426 E.01315
G1 X126.869 Y129.673 E.01315
G1 X127.622 Y129.673 E.01315
G1 X127.622 Y130.366 E.0121
M204 S250
G1 X128.035 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.034 Y130.84 E.00003
G1 X126.455 Y130.84 E.02563
M73 P66 R4
G1 X126.455 Y129.26 E.02566
G1 X128.034 Y129.26 E.02563
G1 X128.035 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.034 Y130.84 E-.02281
G1 X126.455 Y130.84 E-.5998
G1 X126.455 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.131 Y125.627 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.378 Y125.627 E.01315
G1 X128.378 Y124.874 E.01315
G1 X129.131 Y124.874 E.01315
G1 X129.131 Y125.567 E.0121
M204 S250
G1 X129.545 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.966 Y126.04 E.02563
G1 X127.966 Y124.46 E.02566
G1 X129.545 Y124.46 E.02563
G1 X129.545 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.966 Y126.04 E-.60023
G1 X127.966 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.664 Y130.426 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.911 Y130.426 E.01315
G1 X126.911 Y129.673 E.01315
G1 X127.664 Y129.673 E.01315
G1 X127.664 Y130.366 E.0121
M204 S250
G1 X128.078 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.076 Y130.84 E.00003
G1 X126.498 Y130.84 E.02563
G1 X126.498 Y129.26 E.02566
G1 X128.076 Y129.26 E.02563
G1 X128.078 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.076 Y130.84 E-.02281
G1 X126.498 Y130.84 E-.5998
G1 X126.498 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.089 Y125.627 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.336 Y125.627 E.01315
G1 X128.336 Y124.874 E.01315
G1 X129.089 Y124.874 E.01315
G1 X129.089 Y125.567 E.0121
M204 S250
G1 X129.502 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.924 Y126.04 E.02563
G1 X127.924 Y124.46 E.02566
G1 X129.502 Y124.46 E.02563
G1 X129.502 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.924 Y126.04 E-.60023
G1 X127.924 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.707 Y130.426 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.954 Y130.426 E.01315
G1 X126.954 Y129.673 E.01315
G1 X127.707 Y129.673 E.01315
G1 X127.707 Y130.366 E.0121
M204 S250
G1 X128.121 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.119 Y130.84 E.00003
G1 X126.541 Y130.84 E.02563
G1 X126.541 Y129.26 E.02566
G1 X128.119 Y129.26 E.02563
G1 X128.12 Y130.78 E.02468
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
M73 P67 R3
G1 X128.119 Y130.84 E-.02281
G1 X126.541 Y130.84 E-.5998
G1 X126.541 Y130.478 E-.1374
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.046 Y125.627 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.293 Y125.627 E.01315
G1 X128.293 Y124.874 E.01315
G1 X129.046 Y124.874 E.01315
G1 X129.046 Y125.567 E.0121
M204 S250
G1 X129.459 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.881 Y126.04 E.02563
G1 X127.881 Y124.46 E.02566
G1 X129.459 Y124.46 E.02563
G1 X129.459 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.881 Y126.04 E-.60023
G1 X127.881 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.75 Y130.426 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.997 Y130.426 E.01315
G1 X126.997 Y129.673 E.01315
G1 X127.75 Y129.673 E.01315
G1 X127.75 Y130.366 E.0121
M204 S250
G1 X128.162 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.583 Y130.84 E.02563
G1 X126.583 Y129.26 E.02566
G1 X128.162 Y129.26 E.02563
G1 X128.163 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.583 Y130.84 E-.60079
G1 X126.583 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.003 Y125.627 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.25 Y125.627 E.01315
G1 X128.25 Y124.874 E.01315
G1 X129.003 Y124.874 E.01315
G1 X129.003 Y125.567 E.0121
M204 S250
G1 X129.417 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.838 Y126.04 E.02563
G1 X127.838 Y124.46 E.02566
G1 X129.417 Y124.46 E.02563
G1 X129.417 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.838 Y126.04 E-.60023
G1 X127.838 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.792 Y130.426 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.039 Y130.426 E.01315
G1 X127.039 Y129.673 E.01315
G1 X127.792 Y129.673 E.01315
G1 X127.792 Y130.366 E.0121
M204 S250
G1 X128.204 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.626 Y130.84 E.02563
G1 X126.626 Y129.26 E.02566
G1 X128.204 Y129.26 E.02563
G1 X128.206 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.626 Y130.84 E-.60079
G1 X126.626 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.961 Y125.627 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.208 Y125.627 E.01315
G1 X128.208 Y124.874 E.01315
M73 P68 R3
G1 X128.961 Y124.874 E.01315
G1 X128.961 Y125.567 E.0121
M204 S250
G1 X129.374 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.796 Y126.04 E.02563
G1 X127.796 Y124.46 E.02566
G1 X129.374 Y124.46 E.02563
G1 X129.374 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.796 Y126.04 E-.60023
G1 X127.796 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.835 Y130.426 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.082 Y130.426 E.01315
G1 X127.082 Y129.673 E.01315
G1 X127.835 Y129.673 E.01315
G1 X127.835 Y130.366 E.0121
M204 S250
G1 X128.247 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.668 Y130.84 E.02563
G1 X126.668 Y129.26 E.02566
G1 X128.247 Y129.26 E.02563
G1 X128.248 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.668 Y130.84 E-.60079
G1 X126.668 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.918 Y125.627 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.165 Y125.627 E.01315
G1 X128.165 Y124.874 E.01315
G1 X128.918 Y124.874 E.01315
G1 X128.918 Y125.567 E.0121
M204 S250
G1 X129.332 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.753 Y126.04 E.02563
G1 X127.753 Y124.46 E.02566
G1 X129.332 Y124.46 E.02563
G1 X129.332 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.753 Y126.04 E-.60023
G1 X127.753 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.877 Y130.426 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.124 Y130.426 E.01315
G1 X127.124 Y129.673 E.01315
G1 X127.877 Y129.673 E.01315
G1 X127.877 Y130.366 E.0121
M204 S250
G1 X128.289 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.711 Y130.84 E.02563
G1 X126.711 Y129.26 E.02566
G1 X128.289 Y129.26 E.02563
G1 X128.291 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.711 Y130.84 E-.60079
G1 X126.711 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.876 Y125.627 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.123 Y125.627 E.01315
G1 X128.123 Y124.874 E.01315
G1 X128.876 Y124.874 E.01315
G1 X128.876 Y125.567 E.0121
M204 S250
G1 X129.289 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.711 Y126.04 E.02563
G1 X127.711 Y124.46 E.02566
G1 X129.289 Y124.46 E.02563
M73 P69 R3
G1 X129.289 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.711 Y126.04 E-.60023
G1 X127.711 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.92 Y130.426 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.167 Y130.426 E.01315
G1 X127.167 Y129.673 E.01315
G1 X127.92 Y129.673 E.01315
G1 X127.92 Y130.366 E.0121
M204 S250
G1 X128.332 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.754 Y130.84 E.02563
G1 X126.754 Y129.26 E.02566
G1 X128.332 Y129.26 E.02563
G1 X128.333 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.754 Y130.84 E-.60079
G1 X126.754 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.833 Y125.627 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.08 Y125.627 E.01315
G1 X128.08 Y124.874 E.01315
G1 X128.833 Y124.874 E.01315
G1 X128.833 Y125.567 E.0121
M204 S250
G1 X129.246 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.668 Y126.04 E.02563
G1 X127.668 Y124.46 E.02566
G1 X129.246 Y124.46 E.02563
G1 X129.246 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.668 Y126.04 E-.60023
G1 X127.668 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X127.963 Y130.426 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.21 Y130.426 E.01315
G1 X127.21 Y129.673 E.01315
G1 X127.963 Y129.673 E.01315
G1 X127.963 Y130.366 E.0121
M204 S250
G1 X128.375 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.796 Y130.84 E.02563
G1 X126.796 Y129.26 E.02566
G1 X128.375 Y129.26 E.02563
G1 X128.376 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.796 Y130.84 E-.60079
G1 X126.796 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.79 Y125.627 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.037 Y125.627 E.01315
G1 X128.037 Y124.874 E.01315
G1 X128.79 Y124.874 E.01315
G1 X128.79 Y125.567 E.0121
M204 S250
G1 X129.204 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.625 Y126.04 E.02563
G1 X127.625 Y124.46 E.02566
G1 X129.204 Y124.46 E.02563
G1 X129.204 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.625 Y126.04 E-.60023
G1 X127.625 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P70 R3
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.005 Y130.426 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.252 Y130.426 E.01315
G1 X127.252 Y129.673 E.01315
G1 X128.005 Y129.673 E.01315
G1 X128.005 Y130.366 E.0121
M204 S250
G1 X128.417 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.839 Y130.84 E.02563
G1 X126.839 Y129.26 E.02566
G1 X128.417 Y129.26 E.02563
G1 X128.419 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.839 Y130.84 E-.60079
G1 X126.839 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.748 Y125.627 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.995 Y125.627 E.01315
G1 X127.995 Y124.874 E.01315
G1 X128.748 Y124.874 E.01315
G1 X128.748 Y125.567 E.0121
M204 S250
G1 X129.161 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.583 Y126.04 E.02563
G1 X127.583 Y124.46 E.02566
G1 X129.161 Y124.46 E.02563
G1 X129.161 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.583 Y126.04 E-.60023
G1 X127.583 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.048 Y130.426 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.295 Y130.426 E.01315
G1 X127.295 Y129.673 E.01315
G1 X128.048 Y129.673 E.01315
G1 X128.048 Y130.366 E.0121
M204 S250
G1 X128.46 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.881 Y130.84 E.02563
G1 X126.881 Y129.26 E.02566
G1 X128.46 Y129.26 E.02563
G1 X128.461 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.881 Y130.84 E-.60079
G1 X126.881 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.705 Y125.627 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.952 Y125.627 E.01315
G1 X127.952 Y124.874 E.01315
G1 X128.705 Y124.874 E.01315
G1 X128.705 Y125.567 E.0121
M204 S250
G1 X129.119 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.54 Y126.04 E.02563
G1 X127.54 Y124.46 E.02566
G1 X129.119 Y124.46 E.02563
G1 X129.119 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.54 Y126.04 E-.60023
G1 X127.54 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.09 Y130.426 F42000
M73 P71 R3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.337 Y130.426 E.01315
G1 X127.337 Y129.673 E.01315
G1 X128.09 Y129.673 E.01315
G1 X128.09 Y130.366 E.0121
M204 S250
G1 X128.502 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.924 Y130.84 E.02563
G1 X126.924 Y129.26 E.02566
G1 X128.502 Y129.26 E.02563
G1 X128.504 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.924 Y130.84 E-.60079
G1 X126.924 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.663 Y125.627 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.91 Y125.627 E.01315
G1 X127.91 Y124.874 E.01315
G1 X128.663 Y124.874 E.01315
G1 X128.663 Y125.567 E.0121
M204 S250
G1 X129.076 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.498 Y126.04 E.02563
G1 X127.498 Y124.46 E.02566
G1 X129.076 Y124.46 E.02563
G1 X129.076 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.498 Y126.04 E-.60023
G1 X127.498 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.133 Y130.426 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.38 Y130.426 E.01315
G1 X127.38 Y129.673 E.01315
G1 X128.133 Y129.673 E.01315
G1 X128.133 Y130.366 E.0121
M204 S250
G1 X128.545 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.966 Y130.84 E.02563
G1 X126.966 Y129.26 E.02566
G1 X128.545 Y129.26 E.02563
G1 X128.546 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X126.966 Y130.84 E-.60079
G1 X126.966 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.62 Y125.627 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.867 Y125.627 E.01315
G1 X127.867 Y124.874 E.01315
G1 X128.62 Y124.874 E.01315
G1 X128.62 Y125.567 E.0121
M204 S250
G1 X129.034 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.455 Y126.04 E.02563
G1 X127.455 Y124.46 E.02566
G1 X129.034 Y124.46 E.02563
G1 X129.034 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.455 Y126.04 E-.60023
G1 X127.455 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.176 Y130.426 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.423 Y130.426 E.01315
G1 X127.423 Y129.673 E.01315
G1 X128.176 Y129.673 E.01315
M73 P72 R3
G1 X128.176 Y130.366 E.0121
M204 S250
G1 X128.587 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.009 Y130.84 E.02563
G1 X127.009 Y129.26 E.02566
G1 X128.587 Y129.26 E.02563
G1 X128.589 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.009 Y130.84 E-.60079
G1 X127.009 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.577 Y125.627 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.824 Y125.627 E.01315
G1 X127.824 Y124.874 E.01315
G1 X128.577 Y124.874 E.01315
G1 X128.577 Y125.567 E.0121
M204 S250
G1 X128.991 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.413 Y126.04 E.02563
G1 X127.413 Y124.46 E.02566
G1 X128.991 Y124.46 E.02563
G1 X128.991 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.413 Y126.04 E-.60023
G1 X127.413 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.218 Y130.426 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.465 Y130.426 E.01315
G1 X127.465 Y129.673 E.01315
G1 X128.218 Y129.673 E.01315
G1 X128.218 Y130.366 E.0121
M204 S250
G1 X128.63 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.052 Y130.84 E.02563
G1 X127.052 Y129.26 E.02566
G1 X128.63 Y129.26 E.02563
G1 X128.632 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.052 Y130.84 E-.60079
G1 X127.052 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.535 Y125.627 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.782 Y125.627 E.01315
G1 X127.782 Y124.874 E.01315
G1 X128.535 Y124.874 E.01315
G1 X128.535 Y125.567 E.0121
M204 S250
G1 X128.948 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.37 Y126.04 E.02563
G1 X127.37 Y124.46 E.02566
G1 X128.948 Y124.46 E.02563
G1 X128.948 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.37 Y126.04 E-.60023
G1 X127.37 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.261 Y130.426 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.508 Y130.426 E.01315
G1 X127.508 Y129.673 E.01315
G1 X128.261 Y129.673 E.01315
G1 X128.261 Y130.366 E.0121
M204 S250
G1 X128.673 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.094 Y130.84 E.02563
G1 X127.094 Y129.26 E.02566
M73 P73 R3
G1 X128.673 Y129.26 E.02563
G1 X128.674 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.094 Y130.84 E-.60079
G1 X127.094 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.492 Y125.627 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.739 Y125.627 E.01315
G1 X127.739 Y124.874 E.01315
G1 X128.492 Y124.874 E.01315
G1 X128.492 Y125.567 E.0121
M204 S250
G1 X128.906 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.327 Y126.04 E.02563
G1 X127.327 Y124.46 E.02566
G1 X128.906 Y124.46 E.02563
G1 X128.906 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.327 Y126.04 E-.60023
G1 X127.327 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.303 Y130.426 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.55 Y130.426 E.01315
G1 X127.55 Y129.673 E.01315
G1 X128.303 Y129.673 E.01315
G1 X128.303 Y130.366 E.0121
M204 S250
G1 X128.715 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.137 Y130.84 E.02563
G1 X127.137 Y129.26 E.02566
G1 X128.715 Y129.26 E.02563
G1 X128.717 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.137 Y130.84 E-.60079
G1 X127.137 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.45 Y125.627 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.697 Y125.627 E.01315
G1 X127.697 Y124.874 E.01315
G1 X128.45 Y124.874 E.01315
G1 X128.45 Y125.567 E.0121
M204 S250
G1 X128.863 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.285 Y126.04 E.02563
G1 X127.285 Y124.46 E.02566
G1 X128.863 Y124.46 E.02563
G1 X128.863 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.285 Y126.04 E-.60023
G1 X127.285 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.346 Y130.426 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.593 Y130.426 E.01315
G1 X127.593 Y129.673 E.01315
G1 X128.346 Y129.673 E.01315
G1 X128.346 Y130.366 E.0121
M204 S250
G1 X128.758 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.179 Y130.84 E.02563
G1 X127.179 Y129.26 E.02566
G1 X128.758 Y129.26 E.02563
G1 X128.759 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.179 Y130.84 E-.60079
G1 X127.179 Y130.421 E-.15921
; WIPE_END
M73 P74 R3
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.407 Y125.627 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.654 Y125.627 E.01315
G1 X127.654 Y124.874 E.01315
G1 X128.407 Y124.874 E.01315
G1 X128.407 Y125.567 E.0121
M204 S250
G1 X128.821 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.242 Y126.04 E.02563
G1 X127.242 Y124.46 E.02566
G1 X128.821 Y124.46 E.02563
G1 X128.821 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.242 Y126.04 E-.60023
G1 X127.242 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.389 Y130.426 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.636 Y130.426 E.01315
G1 X127.636 Y129.673 E.01315
G1 X128.389 Y129.673 E.01315
G1 X128.389 Y130.366 E.0121
M204 S250
G1 X128.8 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.222 Y130.84 E.02563
G1 X127.222 Y129.26 E.02566
G1 X128.8 Y129.26 E.02563
G1 X128.802 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.222 Y130.84 E-.60079
G1 X127.222 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.364 Y125.627 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.611 Y125.627 E.01315
G1 X127.611 Y124.874 E.01315
G1 X128.364 Y124.874 E.01315
G1 X128.364 Y125.567 E.0121
M204 S250
G1 X128.778 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.2 Y126.04 E.02563
G1 X127.2 Y124.46 E.02566
G1 X128.778 Y124.46 E.02563
G1 X128.778 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.2 Y126.04 E-.60023
G1 X127.2 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.431 Y130.426 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.678 Y130.426 E.01315
G1 X127.678 Y129.673 E.01315
G1 X128.431 Y129.673 E.01315
G1 X128.431 Y130.366 E.0121
M204 S250
G1 X128.843 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.265 Y130.84 E.02563
G1 X127.265 Y129.26 E.02566
G1 X128.843 Y129.26 E.02563
G1 X128.845 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.265 Y130.84 E-.60079
G1 X127.265 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.322 Y125.627 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P75 R3
G1 X127.569 Y125.627 E.01315
G1 X127.569 Y124.874 E.01315
G1 X128.322 Y124.874 E.01315
G1 X128.322 Y125.567 E.0121
M204 S250
G1 X128.735 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.157 Y126.04 E.02563
G1 X127.157 Y124.46 E.02566
G1 X128.735 Y124.46 E.02563
G1 X128.735 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.157 Y126.04 E-.60023
G1 X127.157 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.474 Y130.426 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.721 Y130.426 E.01315
G1 X127.721 Y129.673 E.01315
G1 X128.474 Y129.673 E.01315
M73 P75 R2
G1 X128.474 Y130.366 E.0121
M204 S250
G1 X128.886 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.307 Y130.84 E.02563
G1 X127.307 Y129.26 E.02566
G1 X128.886 Y129.26 E.02563
G1 X128.887 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.307 Y130.84 E-.60079
G1 X127.307 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.279 Y125.627 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.526 Y125.627 E.01315
G1 X127.526 Y124.874 E.01315
G1 X128.279 Y124.874 E.01315
G1 X128.279 Y125.567 E.0121
M204 S250
G1 X128.693 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.114 Y126.04 E.02563
G1 X127.114 Y124.46 E.02566
G1 X128.693 Y124.46 E.02563
G1 X128.693 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.114 Y126.04 E-.60023
G1 X127.114 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.516 Y130.426 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.763 Y130.426 E.01315
G1 X127.763 Y129.673 E.01315
G1 X128.516 Y129.673 E.01315
G1 X128.516 Y130.366 E.0121
M204 S250
G1 X128.928 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.35 Y130.84 E.02563
G1 X127.35 Y129.26 E.02566
G1 X128.928 Y129.26 E.02563
G1 X128.93 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.35 Y130.84 E-.60079
G1 X127.35 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.237 Y125.627 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.484 Y125.627 E.01315
G1 X127.484 Y124.874 E.01315
G1 X128.237 Y124.874 E.01315
G1 X128.237 Y125.567 E.0121
M204 S250
G1 X128.65 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P76 R2
G1 X127.072 Y126.04 E.02563
G1 X127.072 Y124.46 E.02566
G1 X128.65 Y124.46 E.02563
G1 X128.65 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.072 Y126.04 E-.60023
G1 X127.072 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.559 Y130.426 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.806 Y130.426 E.01315
G1 X127.806 Y129.673 E.01315
G1 X128.559 Y129.673 E.01315
G1 X128.559 Y130.366 E.0121
M204 S250
G1 X128.971 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.392 Y130.84 E.02563
G1 X127.392 Y129.26 E.02566
G1 X128.971 Y129.26 E.02563
G1 X128.972 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.392 Y130.84 E-.60079
G1 X127.392 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.194 Y125.627 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.441 Y125.627 E.01315
G1 X127.441 Y124.874 E.01315
G1 X128.194 Y124.874 E.01315
G1 X128.194 Y125.567 E.0121
M204 S250
G1 X128.608 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.029 Y126.04 E.02563
G1 X127.029 Y124.46 E.02566
G1 X128.608 Y124.46 E.02563
G1 X128.608 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X127.029 Y126.04 E-.60023
G1 X127.029 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.601 Y130.426 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.849 Y130.426 E.01315
G1 X127.849 Y129.673 E.01315
G1 X128.601 Y129.673 E.01315
G1 X128.601 Y130.366 E.0121
M204 S250
G1 X129.013 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.435 Y130.84 E.02563
G1 X127.435 Y129.26 E.02566
G1 X129.013 Y129.26 E.02563
G1 X129.015 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.435 Y130.84 E-.60079
G1 X127.435 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.151 Y125.627 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.399 Y125.627 E.01315
G1 X127.399 Y124.874 E.01315
G1 X128.151 Y124.874 E.01315
G1 X128.151 Y125.567 E.0121
M204 S250
G1 X128.565 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.987 Y126.04 E.02563
G1 X126.987 Y124.46 E.02566
G1 X128.565 Y124.46 E.02563
G1 X128.565 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.987 Y126.04 E-.60023
G1 X126.987 Y125.62 E-.15977
; WIPE_END
M73 P77 R2
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.644 Y130.426 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.891 Y130.426 E.01315
G1 X127.891 Y129.673 E.01315
G1 X128.644 Y129.673 E.01315
G1 X128.644 Y130.366 E.0121
M204 S250
G1 X129.056 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.478 Y130.84 E.02563
G1 X127.478 Y129.26 E.02566
G1 X129.056 Y129.26 E.02563
G1 X129.058 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.478 Y130.84 E-.60079
G1 X127.478 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.109 Y125.627 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.356 Y125.627 E.01315
G1 X127.356 Y124.874 E.01315
G1 X128.109 Y124.874 E.01315
G1 X128.109 Y125.567 E.0121
M204 S250
G1 X128.522 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.944 Y126.04 E.02563
G1 X126.944 Y124.46 E.02566
G1 X128.522 Y124.46 E.02563
G1 X128.522 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.944 Y126.04 E-.60023
G1 X126.944 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.687 Y130.426 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.934 Y130.426 E.01315
G1 X127.934 Y129.673 E.01315
G1 X128.687 Y129.673 E.01315
G1 X128.687 Y130.366 E.0121
M204 S250
G1 X129.099 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.52 Y130.84 E.02563
G1 X127.52 Y129.26 E.02566
G1 X129.099 Y129.26 E.02563
G1 X129.1 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.52 Y130.84 E-.60079
G1 X127.52 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.066 Y125.627 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.313 Y125.627 E.01315
G1 X127.313 Y124.874 E.01315
G1 X128.066 Y124.874 E.01315
G1 X128.066 Y125.567 E.0121
M204 S250
G1 X128.48 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.901 Y126.04 E.02563
G1 X126.901 Y124.46 E.02566
G1 X128.48 Y124.46 E.02563
G1 X128.48 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.901 Y126.04 E-.60023
G1 X126.901 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M73 P78 R2
G1 X128.729 Y130.426 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.976 Y130.426 E.01315
G1 X127.976 Y129.673 E.01315
G1 X128.729 Y129.673 E.01315
G1 X128.729 Y130.366 E.0121
M204 S250
G1 X129.141 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.563 Y130.84 E.02563
G1 X127.563 Y129.26 E.02566
G1 X129.141 Y129.26 E.02563
G1 X129.143 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.563 Y130.84 E-.60079
G1 X127.563 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.024 Y125.627 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.271 Y125.627 E.01315
G1 X127.271 Y124.874 E.01315
G1 X128.024 Y124.874 E.01315
G1 X128.024 Y125.567 E.0121
M204 S250
G1 X128.437 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.859 Y126.04 E.02563
G1 X126.859 Y124.46 E.02566
G1 X128.437 Y124.46 E.02563
G1 X128.437 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.859 Y126.04 E-.60023
G1 X126.859 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.772 Y130.426 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.019 Y130.426 E.01315
G1 X128.019 Y129.673 E.01315
G1 X128.772 Y129.673 E.01315
G1 X128.772 Y130.366 E.0121
M204 S250
G1 X129.184 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.605 Y130.84 E.02563
G1 X127.605 Y129.26 E.02566
G1 X129.184 Y129.26 E.02563
G1 X129.185 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.605 Y130.84 E-.60079
G1 X127.605 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.981 Y125.627 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.228 Y125.627 E.01315
G1 X127.228 Y124.874 E.01315
G1 X127.981 Y124.874 E.01315
G1 X127.981 Y125.567 E.0121
M204 S250
G1 X128.395 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.816 Y126.04 E.02563
G1 X126.816 Y124.46 E.02566
G1 X128.395 Y124.46 E.02563
G1 X128.395 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.816 Y126.04 E-.60023
G1 X126.816 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.814 Y130.426 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.061 Y130.426 E.01315
G1 X128.061 Y129.673 E.01315
G1 X128.814 Y129.673 E.01315
M73 P79 R2
G1 X128.814 Y130.366 E.0121
M204 S250
G1 X129.226 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.648 Y130.84 E.02563
G1 X127.648 Y129.26 E.02566
G1 X129.226 Y129.26 E.02563
G1 X129.228 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.648 Y130.84 E-.60079
G1 X127.648 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.939 Y125.627 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.186 Y125.627 E.01315
G1 X127.186 Y124.874 E.01315
G1 X127.939 Y124.874 E.01315
G1 X127.939 Y125.567 E.0121
M204 S250
G1 X128.352 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.774 Y126.04 E.02563
G1 X126.774 Y124.46 E.02566
G1 X128.352 Y124.46 E.02563
G1 X128.352 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.774 Y126.04 E-.60023
G1 X126.774 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.857 Y130.426 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.104 Y130.426 E.01315
G1 X128.104 Y129.673 E.01315
G1 X128.857 Y129.673 E.01315
G1 X128.857 Y130.366 E.0121
M204 S250
G1 X129.269 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.691 Y130.84 E.02563
G1 X127.691 Y129.26 E.02566
G1 X129.269 Y129.26 E.02563
G1 X129.271 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.691 Y130.84 E-.60079
G1 X127.691 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.896 Y125.627 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.143 Y125.627 E.01315
G1 X127.143 Y124.874 E.01315
G1 X127.896 Y124.874 E.01315
G1 X127.896 Y125.567 E.0121
M204 S250
G1 X128.309 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.731 Y126.04 E.02563
G1 X126.731 Y124.46 E.02566
G1 X128.309 Y124.46 E.02563
G1 X128.309 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.731 Y126.04 E-.60023
G1 X126.731 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.9 Y130.426 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.147 Y130.426 E.01315
G1 X128.147 Y129.673 E.01315
G1 X128.9 Y129.673 E.01315
G1 X128.9 Y130.366 E.0121
M204 S250
G1 X129.312 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.733 Y130.84 E.02563
G1 X127.733 Y129.26 E.02566
G1 X129.312 Y129.26 E.02563
M73 P80 R2
G1 X129.313 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.733 Y130.84 E-.60079
G1 X127.733 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.853 Y125.627 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.1 Y125.627 E.01315
G1 X127.1 Y124.874 E.01315
G1 X127.853 Y124.874 E.01315
G1 X127.853 Y125.567 E.0121
M204 S250
G1 X128.267 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.688 Y126.04 E.02563
G1 X126.688 Y124.46 E.02566
G1 X128.267 Y124.46 E.02563
G1 X128.267 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.688 Y126.04 E-.60023
G1 X126.688 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.942 Y130.426 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.189 Y130.426 E.01315
G1 X128.189 Y129.673 E.01315
G1 X128.942 Y129.673 E.01315
G1 X128.942 Y130.366 E.0121
M204 S250
G1 X129.354 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.776 Y130.84 E.02563
G1 X127.776 Y129.26 E.02566
G1 X129.354 Y129.26 E.02563
G1 X129.356 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.776 Y130.84 E-.60079
G1 X127.776 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.811 Y125.627 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.058 Y125.627 E.01315
G1 X127.058 Y124.874 E.01315
G1 X127.811 Y124.874 E.01315
G1 X127.811 Y125.567 E.0121
M204 S250
G1 X128.224 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.646 Y126.04 E.02563
G1 X126.646 Y124.46 E.02566
G1 X128.224 Y124.46 E.02563
G1 X128.224 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.646 Y126.04 E-.60023
G1 X126.646 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X128.985 Y130.426 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.232 Y130.426 E.01315
G1 X128.232 Y129.673 E.01315
G1 X128.985 Y129.673 E.01315
G1 X128.985 Y130.366 E.0121
M204 S250
G1 X129.397 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.818 Y130.84 E.02563
G1 X127.818 Y129.26 E.02566
G1 X129.397 Y129.26 E.02563
G1 X129.398 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.818 Y130.84 E-.60079
G1 X127.818 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.768 Y125.627 Z5.4 F42000
G1 Z5
M73 P81 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X127.015 Y125.627 E.01315
G1 X127.015 Y124.874 E.01315
G1 X127.768 Y124.874 E.01315
G1 X127.768 Y125.567 E.0121
M204 S250
G1 X128.182 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.603 Y126.04 E.02563
G1 X126.603 Y124.46 E.02566
G1 X128.182 Y124.46 E.02563
G1 X128.182 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.603 Y126.04 E-.60023
G1 X126.603 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.027 Y130.426 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.274 Y130.426 E.01315
G1 X128.274 Y129.673 E.01315
G1 X129.027 Y129.673 E.01315
G1 X129.027 Y130.366 E.0121
M204 S250
G1 X129.439 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.861 Y130.84 E.02563
G1 X127.861 Y129.26 E.02566
G1 X129.439 Y129.26 E.02563
G1 X129.441 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.861 Y130.84 E-.60079
G1 X127.861 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.726 Y125.627 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.973 Y125.627 E.01315
G1 X126.973 Y124.874 E.01315
G1 X127.726 Y124.874 E.01315
G1 X127.726 Y125.567 E.0121
M204 S250
G1 X128.139 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.561 Y126.04 E.02563
G1 X126.561 Y124.46 E.02566
G1 X128.139 Y124.46 E.02563
G1 X128.139 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.561 Y126.04 E-.60023
G1 X126.561 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.07 Y130.426 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.317 Y130.426 E.01315
G1 X128.317 Y129.673 E.01315
G1 X129.07 Y129.673 E.01315
G1 X129.07 Y130.366 E.0121
M204 S250
G1 X129.482 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.904 Y130.84 E.02563
G1 X127.904 Y129.26 E.02566
G1 X129.482 Y129.26 E.02563
G1 X129.483 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.904 Y130.84 E-.60079
G1 X127.904 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.683 Y125.627 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.93 Y125.627 E.01315
G1 X126.93 Y124.874 E.01315
G1 X127.683 Y124.874 E.01315
M73 P82 R2
G1 X127.683 Y125.567 E.0121
M204 S250
G1 X128.096 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.518 Y126.04 E.02563
G1 X126.518 Y124.46 E.02566
G1 X128.096 Y124.46 E.02563
G1 X128.096 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.518 Y126.04 E-.60023
G1 X126.518 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.113 Y130.426 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.36 Y130.426 E.01315
G1 X128.36 Y129.673 E.01315
G1 X129.113 Y129.673 E.01315
G1 X129.113 Y130.366 E.0121
M204 S250
G1 X129.525 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.946 Y130.84 E.02563
G1 X127.946 Y129.26 E.02566
G1 X129.525 Y129.26 E.02563
G1 X129.526 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.946 Y130.84 E-.60079
G1 X127.946 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.64 Y125.627 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.887 Y125.627 E.01315
G1 X126.887 Y124.874 E.01315
G1 X127.64 Y124.874 E.01315
G1 X127.64 Y125.567 E.0121
M204 S250
G1 X128.054 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.475 Y126.04 E.02563
G1 X126.475 Y124.46 E.02566
G1 X128.054 Y124.46 E.02563
G1 X128.054 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.475 Y126.04 E-.60023
G1 X126.475 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.155 Y130.426 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.402 Y130.426 E.01315
G1 X128.402 Y129.673 E.01315
G1 X129.155 Y129.673 E.01315
G1 X129.155 Y130.366 E.0121
M204 S250
G1 X129.567 Y130.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.989 Y130.84 E.02563
G1 X127.989 Y129.26 E.02566
G1 X129.567 Y129.26 E.02563
G1 X129.569 Y130.782 E.02471
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.989 Y130.84 E-.60079
G1 X127.989 Y130.421 E-.15921
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.598 Y125.627 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.845 Y125.627 E.01315
G1 X126.845 Y124.874 E.01315
G1 X127.598 Y124.874 E.01315
G1 X127.598 Y125.567 E.0121
M204 S250
G1 X128.011 Y126.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.433 Y126.04 E.02563
M73 P83 R2
G1 X126.433 Y124.46 E.02566
G1 X128.011 Y124.46 E.02563
G1 X128.011 Y125.98 E.02468
; WIPE_START
G1 F3600
M204 S6000
G1 X126.433 Y126.04 E-.60023
G1 X126.433 Y125.62 E-.15977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.192 Y130.443 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.421 Y130.443 E.01345
G1 X128.421 Y129.672 E.01345
G1 X129.192 Y129.672 E.01345
G1 X129.192 Y130.383 E.0124
M204 S250
G1 X129.605 Y130.856 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.008 Y130.856 E.02594
G1 X128.008 Y129.259 E.02594
G1 X129.605 Y129.259 E.02594
G1 X129.605 Y130.796 E.02496
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.008 Y130.856 E-.60744
G1 X128.008 Y130.455 E-.15256
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.579 Y125.643 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.808 Y125.643 E.01345
G1 X126.808 Y124.872 E.01345
G1 X127.579 Y124.872 E.01345
G1 X127.579 Y125.583 E.0124
M204 S250
G1 X127.992 Y126.056 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.395 Y126.056 E.02594
G1 X126.395 Y124.459 E.02594
G1 X127.992 Y124.459 E.02594
G1 X127.992 Y125.996 E.02496
; WIPE_START
G1 F3600
M204 S6000
G1 X126.395 Y126.056 E-.60744
G1 X126.395 Y125.655 E-.15256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
M73 P83 R1
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.222 Y130.475 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.417 Y130.475 E.01406
G1 X128.417 Y129.67 E.01406
G1 X129.222 Y129.67 E.01406
G1 X129.222 Y130.415 E.01301
M204 S250
G1 X129.636 Y130.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.003 Y130.889 E.0265
G1 X128.003 Y129.257 E.0265
G1 X129.636 Y129.257 E.0265
G1 X129.636 Y130.829 E.02553
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.003 Y130.889 E-.62065
G1 X128.003 Y130.522 E-.13935
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.583 Y125.675 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.778 Y125.675 E.01406
G1 X126.778 Y124.87 E.01406
G1 X127.583 Y124.87 E.01406
G1 X127.583 Y125.615 E.01301
M204 S250
G1 X127.997 Y126.089 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.364 Y126.089 E.0265
G1 X126.364 Y124.457 E.0265
G1 X127.997 Y124.457 E.0265
G1 X127.997 Y126.029 E.02553
; WIPE_START
G1 F3600
M204 S6000
G1 X126.364 Y126.089 E-.62065
M73 P84 R1
G1 X126.364 Y125.722 E-.13935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.253 Y130.508 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.413 Y130.508 E.01467
G1 X128.413 Y129.668 E.01467
G1 X129.253 Y129.668 E.01467
G1 X129.253 Y130.448 E.01362
M204 S250
G1 X129.666 Y130.922 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.999 Y130.922 E.02707
G1 X127.999 Y129.255 E.02707
G1 X129.666 Y129.255 E.02707
G1 X129.666 Y130.862 E.02609
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.999 Y130.922 E-.63386
G1 X127.999 Y130.59 E-.12614
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.587 Y125.708 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.747 Y125.708 E.01467
G1 X126.747 Y124.868 E.01467
G1 X127.587 Y124.868 E.01467
G1 X127.587 Y125.648 E.01362
M204 S250
G1 X128.001 Y126.122 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.334 Y126.122 E.02707
G1 X126.334 Y124.455 E.02707
G1 X128.001 Y124.455 E.02707
G1 X128.001 Y126.062 E.02609
; WIPE_START
G1 F3600
M204 S6000
G1 X126.334 Y126.122 E-.63386
G1 X126.334 Y125.79 E-.12614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.283 Y130.541 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.408 Y130.541 E.01527
G1 X128.408 Y129.666 E.01527
G1 X129.283 Y129.666 E.01527
G1 X129.283 Y130.481 E.01422
M204 S250
G1 X129.697 Y130.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.995 Y130.954 E.02763
G1 X127.995 Y129.252 E.02763
G1 X129.697 Y129.252 E.02763
G1 X129.697 Y130.894 E.02666
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.995 Y130.954 E-.64707
G1 X127.995 Y130.657 E-.11293
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.592 Y125.741 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.717 Y125.741 E.01527
G1 X126.717 Y124.866 E.01527
G1 X127.592 Y124.866 E.01527
G1 X127.592 Y125.681 E.01422
M204 S250
G1 X128.005 Y126.154 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.303 Y126.154 E.02763
G1 X126.303 Y124.452 E.02763
G1 X128.005 Y124.452 E.02763
G1 X128.005 Y126.094 E.02666
; WIPE_START
G1 F3600
M204 S6000
G1 X126.303 Y126.154 E-.64707
G1 X126.303 Y125.857 E-.11293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
M73 P85 R1
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.313 Y130.573 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.404 Y130.573 E.01588
G1 X128.404 Y129.664 E.01588
G1 X129.313 Y129.664 E.01588
G1 X129.313 Y130.513 E.01483
M204 S250
G1 X129.727 Y130.987 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.99 Y130.987 E.0282
G1 X127.99 Y129.25 E.0282
G1 X129.727 Y129.25 E.0282
G1 X129.727 Y130.927 E.02722
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.99 Y130.987 E-.66028
G1 X127.99 Y130.724 E-.09972
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.596 Y125.773 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.687 Y125.773 E.01588
G1 X126.687 Y124.864 E.01588
G1 X127.596 Y124.864 E.01588
G1 X127.596 Y125.713 E.01483
M204 S250
G1 X128.01 Y126.187 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.273 Y126.187 E.0282
G1 X126.273 Y124.45 E.0282
G1 X128.01 Y124.45 E.0282
G1 X128.01 Y126.127 E.02722
; WIPE_START
G1 F3600
M204 S6000
G1 X126.273 Y126.187 E-.66028
G1 X126.273 Y125.924 E-.09972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.344 Y130.606 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.4 Y130.606 E.01649
G1 X128.4 Y129.662 E.01649
G1 X129.344 Y129.662 E.01649
G1 X129.344 Y130.546 E.01544
M204 S250
G1 X129.757 Y131.019 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.986 Y131.019 E.02876
G1 X127.986 Y129.248 E.02876
G1 X129.757 Y129.248 E.02876
G1 X129.757 Y130.959 E.02779
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.986 Y131.019 E-.67349
G1 X127.986 Y130.792 E-.08651
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.6 Y125.806 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.656 Y125.806 E.01649
G1 X126.656 Y124.862 E.01649
G1 X127.6 Y124.862 E.01649
G1 X127.6 Y125.746 E.01544
M204 S250
G1 X128.014 Y126.219 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.243 Y126.219 E.02876
G1 X126.243 Y124.448 E.02876
G1 X128.014 Y124.448 E.02876
G1 X128.014 Y126.159 E.02779
; WIPE_START
G1 F3600
M204 S6000
G1 X126.243 Y126.219 E-.67349
G1 X126.243 Y125.992 E-.08651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.374 Y130.638 F42000
G1 Z6.1
M73 P86 R1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.395 Y130.638 E.01709
G1 X128.395 Y129.659 E.01709
G1 X129.374 Y129.659 E.01709
G1 X129.374 Y130.578 E.01605
M204 S250
G1 X129.788 Y131.052 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.982 Y131.052 E.02933
G1 X127.982 Y129.246 E.02933
G1 X129.788 Y129.246 E.02933
G1 X129.788 Y130.992 E.02835
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.982 Y131.052 E-.6867
G1 X127.982 Y130.859 E-.0733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.605 Y125.838 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.626 Y125.838 E.01709
G1 X126.626 Y124.859 E.01709
G1 X127.605 Y124.859 E.01709
G1 X127.605 Y125.778 E.01605
M204 S250
G1 X128.018 Y126.252 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.212 Y126.252 E.02933
G1 X126.212 Y124.446 E.02933
G1 X128.018 Y124.446 E.02933
G1 X128.018 Y126.192 E.02835
; WIPE_START
G1 F3600
M204 S6000
G1 X126.212 Y126.252 E-.6867
G1 X126.212 Y126.059 E-.0733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.405 Y130.671 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.391 Y130.671 E.0177
G1 X128.391 Y129.657 E.0177
G1 X129.405 Y129.657 E.0177
G1 X129.405 Y130.611 E.01665
M204 S250
G1 X129.818 Y131.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.977 Y131.085 E.02989
G1 X127.977 Y129.244 E.02989
G1 X129.818 Y129.244 E.02989
G1 X129.818 Y131.025 E.02892
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.977 Y131.085 E-.69991
G1 X127.977 Y130.926 E-.06009
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.609 Y125.871 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.595 Y125.871 E.0177
G1 X126.595 Y124.857 E.0177
G1 X127.609 Y124.857 E.0177
G1 X127.609 Y125.811 E.01665
M204 S250
G1 X128.023 Y126.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.182 Y126.285 E.02989
G1 X126.182 Y124.444 E.02989
G1 X128.023 Y124.444 E.02989
G1 X128.023 Y126.225 E.02892
; WIPE_START
G1 F3600
M204 S6000
G1 X126.182 Y126.285 E-.69991
G1 X126.182 Y126.126 E-.06009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.435 Y130.704 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P87 R1
G1 X128.387 Y130.704 E.01831
G1 X128.387 Y129.655 E.01831
G1 X129.435 Y129.655 E.01831
G1 X129.435 Y130.644 E.01726
M204 S250
G1 X129.849 Y131.117 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.973 Y131.117 E.03046
G1 X127.973 Y129.241 E.03046
G1 X129.849 Y129.241 E.03046
G1 X129.849 Y131.057 E.02948
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.973 Y131.117 E-.71312
G1 X127.973 Y130.994 E-.04688
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.613 Y125.904 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.565 Y125.904 E.01831
G1 X126.565 Y124.855 E.01831
G1 X127.613 Y124.855 E.01831
G1 X127.613 Y125.844 E.01726
M204 S250
G1 X128.027 Y126.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.151 Y126.317 E.03046
G1 X126.151 Y124.442 E.03046
G1 X128.027 Y124.442 E.03046
G1 X128.027 Y126.257 E.02948
; WIPE_START
G1 F3600
M204 S6000
G1 X126.151 Y126.317 E-.71312
G1 X126.151 Y126.194 E-.04688
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.466 Y130.736 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.382 Y130.736 E.01892
G1 X128.382 Y129.653 E.01892
G1 X129.466 Y129.653 E.01892
G1 X129.466 Y130.676 E.01787
M204 S250
G1 X129.879 Y131.15 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.969 Y131.15 E.03102
G1 X127.969 Y129.239 E.03102
G1 X129.879 Y129.239 E.03102
G1 X129.879 Y131.09 E.03005
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.969 Y131.15 E-.72633
G1 X127.969 Y131.061 E-.03367
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.618 Y125.936 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.534 Y125.936 E.01892
G1 X126.534 Y124.853 E.01892
G1 X127.618 Y124.853 E.01892
G1 X127.618 Y125.876 E.01787
M204 S250
G1 X128.031 Y126.35 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.121 Y126.35 E.03102
G1 X126.121 Y124.439 E.03102
G1 X128.031 Y124.439 E.03102
G1 X128.031 Y126.29 E.03005
; WIPE_START
G1 F3600
M204 S6000
G1 X126.121 Y126.35 E-.72633
G1 X126.121 Y126.261 E-.03367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.068 Y130.34 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P88 R1
G1 F1200
M204 S6000
G1 X128.806 Y130.34 E.00456
G1 X128.806 Y130.079 E.00456
G1 X129.068 Y130.079 E.00456
G1 X129.068 Y130.28 E.00351
M204 S10000
G1 X129.496 Y130.769 F42000
G1 F1200
M204 S6000
G1 X128.378 Y130.769 E.01952
G1 X128.378 Y129.651 E.01952
G1 X129.496 Y129.651 E.01952
G1 X129.496 Y130.709 E.01848
M204 S250
G1 X129.91 Y131.182 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.964 Y131.182 E.03159
G1 X127.964 Y129.237 E.03159
G1 X129.91 Y129.237 E.03159
G1 X129.91 Y131.122 E.03061
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.964 Y131.182 E-.73954
G1 X127.964 Y131.129 E-.02046
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.194 Y125.54 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.932 Y125.54 E.00456
G1 X126.932 Y125.279 E.00456
G1 X127.194 Y125.279 E.00456
G1 X127.194 Y125.48 E.00351
M204 S10000
G1 X127.622 Y125.969 F42000
G1 F1200
M204 S6000
G1 X126.504 Y125.969 E.01952
G1 X126.504 Y124.851 E.01952
G1 X127.622 Y124.851 E.01952
G1 X127.622 Y125.909 E.01848
M204 S250
G1 X128.036 Y126.382 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.09 Y126.382 E.03159
G1 X126.09 Y124.437 E.03159
G1 X128.036 Y124.437 E.03159
G1 X128.036 Y126.322 E.03061
; WIPE_START
G1 F3600
M204 S6000
G1 X126.09 Y126.382 E-.73954
G1 X126.09 Y126.329 E-.02046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.098 Y130.373 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.802 Y130.373 E.00517
G1 X128.802 Y130.077 E.00517
G1 X129.098 Y130.077 E.00517
G1 X129.098 Y130.313 E.00412
M204 S10000
G1 X129.526 Y130.801 F42000
G1 F1200
M204 S6000
G1 X128.374 Y130.801 E.02013
G1 X128.374 Y129.648 E.02013
G1 X129.526 Y129.648 E.02013
G1 X129.526 Y130.741 E.01908
M204 S250
G1 X129.94 Y131.215 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.96 Y131.215 E.03215
G1 X127.96 Y129.235 E.03215
G1 X129.94 Y129.235 E.03215
G1 X129.94 Y131.155 E.03118
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.96 Y131.215 E-.75275
G1 X127.96 Y131.196 E-.00725
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.198 Y125.573 Z7 F42000
M73 P89 R1
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.902 Y125.573 E.00517
G1 X126.902 Y125.277 E.00517
G1 X127.198 Y125.277 E.00517
G1 X127.198 Y125.513 E.00412
M204 S10000
G1 X127.626 Y126.002 F42000
G1 F1200
M204 S6000
G1 X126.474 Y126.002 E.02013
G1 X126.474 Y124.849 E.02013
G1 X127.626 Y124.849 E.02013
G1 X127.626 Y125.942 E.01908
M204 S250
G1 X128.04 Y126.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.06 Y126.415 E.03215
G1 X126.06 Y124.435 E.03215
G1 X128.04 Y124.435 E.03215
G1 X128.04 Y126.355 E.03118
; WIPE_START
G1 F3600
M204 S6000
G1 X126.06 Y126.415 E-.75275
G1 X126.06 Y126.396 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.128 Y130.406 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.798 Y130.406 E.00577
G1 X128.798 Y130.075 E.00577
G1 X129.128 Y130.075 E.00577
G1 X129.128 Y130.346 E.00473
M204 S10000
G1 X129.557 Y130.834 F42000
G1 F1200
M204 S6000
G1 X128.369 Y130.834 E.02074
G1 X128.369 Y129.646 E.02074
G1 X129.557 Y129.646 E.02074
G1 X129.557 Y130.774 E.01969
M204 S250
G1 X129.97 Y131.248 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.956 Y131.248 E.03272
G1 X127.956 Y129.233 E.03272
G1 X129.97 Y129.233 E.03272
G1 X129.97 Y131.188 E.03174
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X127.971 Y131.247 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.202 Y125.606 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.872 Y125.606 E.00577
G1 X126.872 Y125.275 E.00577
G1 X127.202 Y125.275 E.00577
G1 X127.202 Y125.546 E.00473
M204 S10000
G1 X127.631 Y126.034 F42000
G1 F1200
M204 S6000
G1 X126.443 Y126.034 E.02074
G1 X126.443 Y124.846 E.02074
G1 X127.631 Y124.846 E.02074
G1 X127.631 Y125.974 E.01969
M204 S250
G1 X128.044 Y126.448 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.03 Y126.448 E.03272
G1 X126.03 Y124.433 E.03272
G1 X128.044 Y124.433 E.03272
G1 X128.044 Y126.388 E.03174
; WIPE_START
G1 F3600
M204 S6000
G1 X126.045 Y126.447 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.159 Y130.438 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.793 Y130.438 E.00638
M73 P90 R1
G1 X128.793 Y130.073 E.00638
G1 X129.159 Y130.073 E.00638
G1 X129.159 Y130.378 E.00533
M204 S10000
G1 X129.587 Y130.867 F42000
G1 F1200
M204 S6000
G1 X128.365 Y130.867 E.02135
G1 X128.365 Y129.644 E.02135
G1 X129.587 Y129.644 E.02135
G1 X129.587 Y130.807 E.0203
M204 S250
G1 X130.001 Y131.28 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.951 Y131.28 E.03328
G1 X127.951 Y129.231 E.03328
G1 X130.001 Y129.231 E.03328
G1 X130.001 Y131.22 E.03231
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.002 Y131.279 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.207 Y125.638 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.841 Y125.638 E.00638
G1 X126.841 Y125.273 E.00638
G1 X127.207 Y125.273 E.00638
G1 X127.207 Y125.578 E.00533
M204 S10000
G1 X127.635 Y126.067 F42000
G1 F1200
M204 S6000
G1 X126.413 Y126.067 E.02135
G1 X126.413 Y124.844 E.02135
G1 X127.635 Y124.844 E.02135
G1 X127.635 Y126.007 E.0203
M204 S250
G1 X128.049 Y126.48 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.999 Y126.48 E.03328
G1 X125.999 Y124.431 E.03328
G1 X128.049 Y124.431 E.03328
G1 X128.049 Y126.42 E.03231
; WIPE_START
G1 F3600
M204 S6000
G1 X126.05 Y126.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.189 Y130.471 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.789 Y130.471 E.00699
G1 X128.789 Y130.07 E.00699
G1 X129.189 Y130.07 E.00699
G1 X129.189 Y130.411 E.00594
M204 S10000
G1 X129.618 Y130.899 F42000
G1 F1200
M204 S6000
G1 X128.36 Y130.899 E.02195
G1 X128.36 Y129.642 E.02195
G1 X129.618 Y129.642 E.02195
G1 X129.618 Y130.839 E.02091
M204 S250
G1 X130.031 Y131.313 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.947 Y131.313 E.03385
G1 X127.947 Y129.228 E.03385
G1 X130.031 Y129.228 E.03385
G1 X130.031 Y131.253 E.03287
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.032 Y131.31 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.211 Y125.671 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.811 Y125.671 E.00699
G1 X126.811 Y125.271 E.00699
G1 X127.211 Y125.271 E.00699
G1 X127.211 Y125.611 E.00594
M204 S10000
G1 X127.64 Y126.099 F42000
G1 F1200
M204 S6000
G1 X126.382 Y126.099 E.02195
G1 X126.382 Y124.842 E.02195
G1 X127.64 Y124.842 E.02195
G1 X127.64 Y126.039 E.02091
M204 S250
G1 X128.053 Y126.513 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.969 Y126.513 E.03385
G1 X125.969 Y124.428 E.03385
G1 X128.053 Y124.428 E.03385
G1 X128.053 Y126.453 E.03287
; WIPE_START
G1 F3600
M204 S6000
G1 X126.054 Y126.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
M73 P91 R1
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.22 Y130.503 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.785 Y130.503 E.0076
G1 X128.785 Y130.068 E.0076
G1 X129.22 Y130.068 E.0076
G1 X129.22 Y130.443 E.00655
M204 S10000
G1 X129.648 Y130.932 F42000
G1 F1200
M204 S6000
G1 X128.356 Y130.932 E.02256
G1 X128.356 Y129.64 E.02256
G1 X129.648 Y129.64 E.02256
G1 X129.648 Y130.872 E.02151
M204 S250
G1 X130.062 Y131.345 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.943 Y131.345 E.03441
G1 X127.943 Y129.226 E.03441
G1 X130.062 Y129.226 E.03441
G1 X130.062 Y131.285 E.03344
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.063 Y131.342 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.215 Y125.703 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.78 Y125.703 E.0076
G1 X126.78 Y125.268 E.0076
G1 X127.215 Y125.268 E.0076
G1 X127.215 Y125.643 E.00655
M204 S10000
G1 X127.644 Y126.132 F42000
G1 F1200
M204 S6000
G1 X126.352 Y126.132 E.02256
G1 X126.352 Y124.84 E.02256
G1 X127.644 Y124.84 E.02256
G1 X127.644 Y126.072 E.02151
M204 S250
G1 X128.057 Y126.545 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.938 Y126.545 E.03441
G1 X125.938 Y124.426 E.03441
G1 X128.057 Y124.426 E.03441
G1 X128.057 Y126.485 E.03344
; WIPE_START
G1 F3600
M204 S6000
G1 X126.058 Y126.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.25 Y130.536 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.78 Y130.536 E.0082
G1 X128.78 Y130.066 E.0082
G1 X129.25 Y130.066 E.0082
G1 X129.25 Y130.476 E.00716
M204 S10000
G1 X129.679 Y130.965 F42000
G1 F1200
M204 S6000
G1 X128.352 Y130.965 E.02317
G1 X128.352 Y129.638 E.02317
G1 X129.679 Y129.638 E.02317
G1 X129.679 Y130.905 E.02212
M204 S250
G1 X130.092 Y131.378 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.938 Y131.378 E.03498
G1 X127.938 Y129.224 E.03498
G1 X130.092 Y129.224 E.03498
G1 X130.092 Y131.318 E.034
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.093 Y131.374 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.22 Y125.736 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.75 Y125.736 E.0082
G1 X126.75 Y125.266 E.0082
G1 X127.22 Y125.266 E.0082
G1 X127.22 Y125.676 E.00716
M204 S10000
G1 X127.648 Y126.165 F42000
G1 F1200
M204 S6000
G1 X126.321 Y126.165 E.02317
G1 X126.321 Y124.838 E.02317
M73 P91 R0
G1 X127.648 Y124.838 E.02317
G1 X127.648 Y126.105 E.02212
M204 S250
G1 X128.062 Y126.578 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.908 Y126.578 E.03498
G1 X125.908 Y124.424 E.03498
G1 X128.062 Y124.424 E.03498
G1 X128.062 Y126.518 E.034
; WIPE_START
G1 F3600
M204 S6000
G1 X126.063 Y126.574 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.281 Y130.569 F42000
G1 Z7.2
M73 P92 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.776 Y130.569 E.00881
G1 X128.776 Y130.064 E.00881
G1 X129.281 Y130.064 E.00881
G1 X129.281 Y130.509 E.00776
M204 S10000
G1 X129.709 Y130.997 F42000
G1 F1200
M204 S6000
G1 X128.347 Y130.997 E.02377
G1 X128.347 Y129.635 E.02378
G1 X129.709 Y129.635 E.02377
G1 X129.709 Y130.937 E.02273
M204 S250
G1 X130.123 Y131.411 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.934 Y131.411 E.03554
G1 X127.934 Y129.222 E.03554
G1 X130.123 Y129.222 E.03554
G1 X130.123 Y131.351 E.03457
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.123 Y131.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.224 Y125.769 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.719 Y125.769 E.00881
G1 X126.719 Y125.264 E.00881
G1 X127.224 Y125.264 E.00881
G1 X127.224 Y125.709 E.00776
M204 S10000
G1 X127.653 Y126.197 F42000
G1 F1200
M204 S6000
G1 X126.291 Y126.197 E.02377
G1 X126.291 Y124.835 E.02378
G1 X127.653 Y124.835 E.02377
G1 X127.653 Y126.137 E.02273
M204 S250
G1 X128.066 Y126.611 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.877 Y126.611 E.03554
G1 X125.877 Y124.422 E.03554
G1 X128.066 Y124.422 E.03554
G1 X128.066 Y126.551 E.03457
; WIPE_START
G1 F3600
M204 S6000
G1 X126.067 Y126.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.311 Y130.601 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.772 Y130.601 E.00942
G1 X128.772 Y130.062 E.00942
G1 X129.311 Y130.062 E.00942
G1 X129.311 Y130.541 E.00837
M204 S10000
G1 X129.74 Y131.03 F42000
G1 F1200
M204 S6000
G1 X128.343 Y131.03 E.02438
G1 X128.343 Y129.633 E.02438
G1 X129.74 Y129.633 E.02438
G1 X129.74 Y130.97 E.02333
M204 S250
G1 X130.153 Y131.443 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.93 Y131.443 E.0361
G1 X127.93 Y129.22 E.03611
G1 X130.153 Y129.22 E.0361
G1 X130.153 Y131.383 E.03513
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.154 Y131.437 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.228 Y125.801 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.689 Y125.801 E.00942
G1 X126.689 Y125.262 E.00942
G1 X127.228 Y125.262 E.00942
G1 X127.228 Y125.741 E.00837
M204 S10000
G1 X127.657 Y126.23 F42000
G1 F1200
M204 S6000
G1 X126.26 Y126.23 E.02438
G1 X126.26 Y124.833 E.02438
G1 X127.657 Y124.833 E.02438
G1 X127.657 Y126.17 E.02333
M204 S250
G1 X128.07 Y126.643 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.847 Y126.643 E.0361
G1 X125.847 Y124.42 E.03611
G1 X128.07 Y124.42 E.0361
G1 X128.07 Y126.583 E.03513
; WIPE_START
G1 F3600
M204 S6000
G1 X126.071 Y126.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
M73 P93 R0
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.341 Y130.634 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.767 Y130.634 E.01003
G1 X128.767 Y130.06 E.01003
G1 X129.341 Y130.06 E.01003
G1 X129.341 Y130.574 E.00898
M204 S10000
G1 X129.77 Y131.062 F42000
G1 F1200
M204 S6000
G1 X128.339 Y131.062 E.02499
G1 X128.339 Y129.631 E.02499
G1 X129.77 Y129.631 E.02499
G1 X129.77 Y131.002 E.02394
M204 S250
G1 X130.183 Y131.476 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.925 Y131.476 E.03667
G1 X127.925 Y129.218 E.03667
G1 X130.183 Y129.218 E.03667
G1 X130.183 Y131.416 E.0357
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.184 Y131.469 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.233 Y125.834 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.659 Y125.834 E.01003
G1 X126.659 Y125.26 E.01003
G1 X127.233 Y125.26 E.01003
G1 X127.233 Y125.774 E.00898
M204 S10000
G1 X127.661 Y126.262 F42000
G1 F1200
M204 S6000
G1 X126.23 Y126.262 E.02499
G1 X126.23 Y124.831 E.02499
G1 X127.661 Y124.831 E.02499
G1 X127.661 Y126.202 E.02394
M204 S250
G1 X128.075 Y126.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.817 Y126.676 E.03667
G1 X125.817 Y124.418 E.03667
G1 X128.075 Y124.418 E.03667
G1 X128.075 Y126.616 E.0357
; WIPE_START
G1 F3600
M204 S6000
G1 X126.075 Y126.669 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.372 Y130.666 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.763 Y130.666 E.01063
G1 X128.763 Y130.057 E.01063
G1 X129.372 Y130.057 E.01063
G1 X129.372 Y130.606 E.00959
M204 S10000
G1 X129.8 Y131.095 F42000
G1 F1200
M204 S6000
G1 X128.334 Y131.095 E.0256
G1 X128.334 Y129.629 E.0256
G1 X129.8 Y129.629 E.0256
G1 X129.8 Y131.035 E.02455
M204 S250
G1 X130.214 Y131.508 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.921 Y131.508 E.03723
G1 X127.921 Y129.215 E.03723
G1 X130.214 Y129.215 E.03723
G1 X130.214 Y131.448 E.03626
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.215 Y131.501 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
M73 P94 R0
G1 X127.237 Y125.866 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.628 Y125.866 E.01063
G1 X126.628 Y125.257 E.01063
G1 X127.237 Y125.257 E.01063
G1 X127.237 Y125.806 E.00959
M204 S10000
G1 X127.666 Y126.295 F42000
G1 F1200
M204 S6000
G1 X126.2 Y126.295 E.0256
G1 X126.2 Y124.829 E.0256
G1 X127.666 Y124.829 E.0256
G1 X127.666 Y126.235 E.02455
M204 S250
G1 X128.079 Y126.709 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.786 Y126.709 E.03723
G1 X125.786 Y124.415 E.03723
G1 X128.079 Y124.415 E.03723
G1 X128.079 Y126.649 E.03626
; WIPE_START
G1 F3600
M204 S6000
G1 X126.08 Y126.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X129.402 Y130.699 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.759 Y130.699 E.01124
G1 X128.759 Y130.055 E.01124
G1 X129.402 Y130.055 E.01124
G1 X129.402 Y130.639 E.01019
M204 S10000
G1 X129.831 Y131.128 F42000
G1 F1200
M204 S6000
G1 X128.33 Y131.128 E.0262
G1 X128.33 Y129.627 E.0262
G1 X129.831 Y129.627 E.0262
G1 X129.831 Y131.068 E.02516
M204 S250
G1 X130.244 Y131.541 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X127.917 Y131.541 E.0378
G1 X127.917 Y129.213 E.0378
G1 X130.244 Y129.213 E.0378
G1 X130.244 Y131.481 E.03683
; OBJECT_ID: 58
; WIPE_START
G1 F3600
M204 S6000
G1 X128.245 Y131.533 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.241 Y125.899 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X126.598 Y125.899 E.01124
G1 X126.598 Y125.255 E.01124
G1 X127.241 Y125.255 E.01124
G1 X127.241 Y125.839 E.01019
M204 S10000
G1 X127.67 Y126.328 F42000
G1 F1200
M204 S6000
G1 X126.169 Y126.328 E.0262
G1 X126.169 Y124.827 E.0262
G1 X127.67 Y124.827 E.0262
G1 X127.67 Y126.268 E.02516
M204 S250
G1 X128.083 Y126.741 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X125.756 Y126.741 E.0378
G1 X125.756 Y124.413 E.0378
G1 X128.083 Y124.413 E.0378
G1 X128.083 Y126.681 E.03683
; WIPE_START
G1 F3600
M204 S6000
G1 X126.084 Y126.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X130.275 Y131.574 F42000
G1 Z7.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X127.912 Y131.574 E.03836
G1 X127.912 Y129.211 E.03836
G1 X130.275 Y129.211 E.03836
G1 X130.275 Y131.514 E.03739
; WIPE_START
G1 F3600
M204 S6000
G1 X128.275 Y131.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 47
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
M73 P95 R0
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
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X130.056 Y129.919 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X129.566 Y129.43 E.01123
G1 X129.003 Y129.43
G1 X130.056 Y130.483 E.02418
G1 X130.056 Y131.047
G1 X128.439 Y129.43 E.03712
G1 X128.131 Y129.686
G1 X129.8 Y131.354 E.03832
G1 X129.236 Y131.354
G1 X128.131 Y130.25 E.02537
G1 X128.131 Y130.813
G1 X128.673 Y131.354 E.01243
; OBJECT_ID: 58
; WIPE_START
G1 F3000
M204 S6000
G1 X128.131 Y130.813 E-.2909
G1 X128.131 Y130.25 E-.21417
G1 X128.606 Y130.724 E-.25493
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X128.088 Y126.774 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1200
M204 S5000
G1 X125.725 Y126.774 E.03836
G1 X125.725 Y124.411 E.03836
G1 X128.088 Y124.411 E.03836
G1 X128.088 Y126.714 E.03739
; WIPE_START
G1 F3600
M204 S6000
G1 X126.088 Y126.765 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.312 Y124.63 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X127.869 Y125.187 E.01278
G1 X127.869 Y125.751
G1 X126.748 Y124.63 E.02573
G1 X126.185 Y124.63
G1 X127.869 Y126.314 E.03867
G1 X127.545 Y126.555
G1 X125.944 Y124.953 E.03677
G1 X125.944 Y125.517
G1 X126.982 Y126.555 E.02382
G1 X126.418 Y126.555
G1 X125.944 Y126.081 E.01088
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F3000
M204 S6000
G1 X126.418 Y126.555 E-.25464
G1 X126.982 Y126.555 E-.21417
G1 X126.44 Y126.013 E-.29119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 58
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

