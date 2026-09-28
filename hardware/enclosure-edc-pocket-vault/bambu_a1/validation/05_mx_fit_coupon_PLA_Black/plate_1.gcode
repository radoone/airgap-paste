; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 4m 37s; total estimated time: 11m 10s
; total layer number: 7
; total filament length [mm] : 426.84
; total filament volume [cm^3] : 1026.68
; total filament weight [g] : 1.27
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.40
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
; print_settings_id = AirGap EDC Vault 05_mx_fit_coupon A1 0.4
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
M73 P0 R11
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
M73 P1 R11
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
M73 P7 R10
G1 X-48.2 F3000
M73 P9 R10
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
M73 P10 R10
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P13 R9
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
    
M73 P14 R9
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
M73 P53 R5
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
M73 P54 R5
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
M73 P55 R5
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
M73 P55 R4
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
    G29 A1 X98 Y117 I60 J22
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
; layer num/total_layer_count: 1/7
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X136.289 Y135.375 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P56 R4
G1 F1500
M204 S500
G1 X136.289 Y136.289 E.03405
G1 X119.711 Y136.289 E.61748
G1 X119.711 Y119.711 E.61748
G1 X136.289 Y119.711 E.61748
M73 P57 R4
G1 X136.289 Y135.315 E.58119
M204 S6000
G1 X135.832 Y135.375 F42000
G1 F1500
M204 S500
G1 X135.832 Y135.832 E.01702
G1 X120.168 Y135.832 E.58343
G1 X120.168 Y120.168 E.58343
M73 P58 R4
G1 X135.832 Y120.168 E.58343
G1 X135.832 Y135.315 E.56417
M204 S6000
G1 X135.375 Y135.375 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X120.625 Y135.375 E.54938
G1 X120.625 Y120.625 E.54938
G1 X135.375 Y120.625 E.54938
G1 X135.375 Y135.315 E.54715
; WIPE_START
G1 X133.375 Y135.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.573 Y130.364 Z.6 F42000
G1 X116.239 Y120.675 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X116.239 Y136.239 E.5797
G1 X99.761 Y136.239 E.61375
G1 X99.761 Y119.761 E.61375
G1 X116.239 Y119.761 E.61375
G1 X116.239 Y120.615 E.03181
M204 S6000
M73 P59 R4
G1 X115.782 Y120.675 F42000
G1 F1500
M204 S500
G1 X115.782 Y135.782 E.56268
G1 X100.218 Y135.782 E.5797
G1 X100.218 Y120.218 E.57971
G1 X115.782 Y120.218 E.5797
G1 X115.782 Y120.615 E.01479
M204 S6000
G1 X115.325 Y120.675 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X115.325 Y135.325 E.54566
G1 X100.675 Y135.325 E.54566
G1 X100.675 Y120.675 E.54566
G1 X115.265 Y120.675 E.54342
; WIPE_START
G1 X115.273 Y122.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.499 Y125.134 Z.6 F42000
G1 X155.425 Y136.339 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X139.661 Y136.339 E.58715
G1 X139.661 Y119.661 E.6212
M73 P60 R4
G1 X156.339 Y119.661 E.6212
G1 X156.339 Y136.339 E.6212
G1 X155.485 Y136.339 E.03181
M204 S6000
G1 X155.425 Y135.882 F42000
G1 F1500
M204 S500
G1 X140.118 Y135.882 E.57013
G1 X140.118 Y120.118 E.58715
G1 X155.882 Y120.118 E.58715
G1 X155.882 Y135.882 E.58715
G1 X155.485 Y135.882 E.01479
M204 S6000
G1 X155.425 Y135.425 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X140.575 Y135.425 E.55311
G1 X140.575 Y120.575 E.55311
G1 X155.425 Y120.575 E.55311
G1 X155.425 Y135.365 E.55087
; WIPE_START
M73 P61 R4
G1 X153.425 Y135.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.126 Y133.141 Z.6 F42000
G1 X99.267 Y118.812 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X99.277 Y118.769 E.00164
G3 X100.031 Y118.239 I.73 J.237 E.03681
G1 X100.496 Y118.239 E.01733
G1 X155.975 Y118.239 E2.06641
G3 X156.758 Y118.963 I.013 J.772 E.04384
G1 X156.757 Y137.064 E.67419
G3 X155.985 Y137.761 I-.765 J-.071 E.04259
G1 X100.031 Y137.761 E2.08407
G3 X99.239 Y136.969 I-.024 J-.768 E.04671
G1 X99.242 Y118.944 E.67137
G1 X99.256 Y118.871 E.00278
M204 S6000
G1 X98.823 Y118.717 F42000
G1 F1500
M204 S500
G1 X98.84 Y118.643 E.0028
G3 X100.019 Y117.782 I1.178 J.376 E.05819
G1 X100.496 Y117.782 E.01775
M73 P62 R4
G1 X155.987 Y117.782 E2.06683
G3 X157.216 Y118.94 I-.003 J1.234 E.06926
G1 X157.216 Y137.068 E.67519
G3 X155.99 Y138.218 I-1.233 J-.086 E.06882
G1 X100.019 Y138.218 E2.08469
G3 X98.782 Y136.981 I-.013 J-1.224 E.07261
G1 X98.784 Y118.931 E.67229
G1 X98.812 Y118.776 E.00588
M204 S6000
G1 X98.376 Y118.636 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X98.401 Y118.517 E.00452
G3 X100.008 Y117.325 I1.621 J.506 E.0797
G1 X100.496 Y117.325 E.01816
G1 X155.998 Y117.325 E2.06726
G3 X157.673 Y118.918 I-.019 J1.697 E.09468
G1 X157.673 Y137.086 E.67668
G3 X155.996 Y138.675 I-1.694 J-.108 E.09466
M73 P63 R4
G1 X100.008 Y138.675 E2.08532
G3 X98.325 Y136.992 I-.002 J-1.681 E.09851
G1 X98.327 Y118.914 E.67333
G1 X98.366 Y118.695 E.00829
; WIPE_START
G1 X98.401 Y118.517 E-.06889
G1 X98.485 Y118.286 E-.09352
G1 X98.657 Y117.999 E-.12698
G1 X98.816 Y117.816 E-.09215
G1 X99.066 Y117.61 E-.12322
G1 X99.214 Y117.521 E-.06554
G1 X99.436 Y117.423 E-.09205
G1 X99.685 Y117.361 E-.09766
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
M73 P64 R4
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


G1 X99.501 Y119.532 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106386
G1 F1500
M204 S500
M73 P64 R3
G1 X99.5 Y136.468 E.08758
; WIPE_START
G1 X99.5 Y134.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X106.88 Y132.522 Z.6 F42000
G1 X156.349 Y119.478 Z.6
M73 P65 R3
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50031
G1 F2400
M204 S500
G1 X155.498 Y118.628 E.04481
G1 X154.852 Y118.628 E.02411
G1 X155.496 Y119.272 E.03397
G1 X154.849 Y119.272 E.02411
G1 X154.205 Y118.628 E.03397
G1 X153.558 Y118.628 E.02411
G1 X154.202 Y119.272 E.03397
G1 X153.556 Y119.272 E.02411
G1 X152.911 Y118.628 E.03397
G1 X152.264 Y118.628 E.02411
G1 X152.909 Y119.272 E.03397
G1 X152.262 Y119.272 E.02411
G1 X151.617 Y118.628 E.03397
G1 X150.97 Y118.628 E.02411
G1 X151.615 Y119.272 E.03397
G1 X150.968 Y119.272 E.02411
G1 X150.324 Y118.628 E.03397
G1 X149.677 Y118.628 E.02411
G1 X150.321 Y119.272 E.03397
G1 X149.674 Y119.272 E.02411
G1 X149.03 Y118.628 E.03397
G1 X148.383 Y118.628 E.02411
G1 X149.028 Y119.272 E.03397
G1 X148.381 Y119.272 E.02411
G1 X147.736 Y118.628 E.03397
G1 X147.089 Y118.628 E.02411
G1 X147.734 Y119.272 E.03397
G1 X147.087 Y119.272 E.02411
G1 X146.443 Y118.628 E.03398
G1 X145.796 Y118.628 E.02411
G1 X146.44 Y119.272 E.03398
G1 X145.793 Y119.272 E.02411
G1 X145.149 Y118.628 E.03398
G1 X144.502 Y118.628 E.02411
G1 X145.147 Y119.272 E.03398
G1 X144.5 Y119.272 E.02411
G1 X143.855 Y118.628 E.03398
G1 X143.208 Y118.628 E.02411
G1 X143.853 Y119.272 E.03398
G1 X143.206 Y119.272 E.02411
G1 X142.561 Y118.628 E.03398
G1 X141.915 Y118.628 E.02411
G1 X142.559 Y119.272 E.03398
G1 X141.912 Y119.272 E.02411
G1 X141.268 Y118.628 E.03398
G1 X140.621 Y118.628 E.02411
G1 X141.265 Y119.272 E.03398
G1 X140.619 Y119.272 E.02411
G1 X139.974 Y118.628 E.03398
G1 X139.327 Y118.628 E.02411
G1 X139.972 Y119.272 E.03398
G1 X139.325 Y119.272 E.02411
G1 X138.68 Y118.628 E.03398
G1 X138.034 Y118.628 E.02411
G1 X139.272 Y119.867 E.0653
G1 X139.272 Y120.513 E.02411
G1 X137.387 Y118.628 E.09939
G1 X136.74 Y118.628 E.02411
G1 X139.272 Y121.16 E.13349
G1 X139.272 Y121.807 E.02411
G1 X136.093 Y118.628 E.16759
G1 X135.446 Y118.628 E.02411
G1 X136.141 Y119.322 E.03661
G1 X136.678 Y119.322 E.02001
G1 X136.678 Y119.859 E.02001
G1 X139.272 Y122.454 E.13677
G1 X139.272 Y123.101 E.02411
G1 X136.678 Y120.506 E.13677
G1 X136.678 Y121.153 E.02411
G1 X139.272 Y123.748 E.13677
G1 X139.272 Y124.395 E.02411
G1 X136.678 Y121.8 E.13677
G1 X136.678 Y122.447 E.02411
G1 X139.272 Y125.041 E.13677
G1 X139.272 Y125.688 E.02411
G1 X136.678 Y123.094 E.13677
G1 X136.678 Y123.74 E.02411
G1 X139.272 Y126.335 E.13677
G1 X139.272 Y126.982 E.02411
G1 X136.678 Y124.387 E.13677
G1 X136.678 Y125.034 E.02411
G1 X139.272 Y127.629 E.13677
M73 P66 R3
G1 X139.272 Y128.276 E.02411
G1 X136.678 Y125.681 E.13677
G1 X136.678 Y126.328 E.02411
G1 X139.272 Y128.922 E.13677
G1 X139.272 Y129.569 E.02411
G1 X136.678 Y126.975 E.13677
G1 X136.678 Y127.621 E.02411
G1 X139.272 Y130.216 E.13677
G1 X139.272 Y130.863 E.02411
G1 X136.678 Y128.268 E.13677
G1 X136.678 Y128.915 E.02411
G1 X139.272 Y131.51 E.13677
G1 X139.272 Y132.157 E.02411
G1 X136.678 Y129.562 E.13677
G1 X136.678 Y130.209 E.02411
G1 X139.272 Y132.804 E.13677
G1 X139.272 Y133.45 E.02411
G1 X136.678 Y130.856 E.13677
G1 X136.678 Y131.503 E.02411
G1 X139.272 Y134.097 E.13677
G1 X139.272 Y134.744 E.02411
G1 X136.678 Y132.149 E.13677
G1 X136.678 Y132.796 E.02411
G1 X139.272 Y135.391 E.13677
G1 X139.272 Y136.038 E.02411
G1 X136.472 Y133.237 E.14761
; WIPE_START
G1 X137.886 Y134.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.451 Y135.662 Z.6 F42000
G1 X156.551 Y137.145 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X156.133 Y136.728 E.02201
G1 X155.487 Y136.728 E.02411
G1 X156.105 Y137.346 E.03261
G3 X155.961 Y137.372 I-.114 J-.219 E.00554
G1 X155.484 Y137.372 E.01777
G1 X154.84 Y136.728 E.03398
G1 X154.193 Y136.728 E.02411
G1 X154.838 Y137.372 E.03398
G1 X154.191 Y137.372 E.02411
G1 X153.546 Y136.728 E.03398
G1 X152.899 Y136.728 E.02411
G1 X153.544 Y137.372 E.03398
G1 X152.897 Y137.372 E.02411
G1 X152.252 Y136.728 E.03398
G1 X151.605 Y136.728 E.02411
G1 X152.25 Y137.372 E.03398
G1 X151.603 Y137.372 E.02411
G1 X150.959 Y136.728 E.03398
G1 X150.312 Y136.728 E.02411
G1 X150.956 Y137.372 E.03398
G1 X150.31 Y137.372 E.02411
G1 X149.665 Y136.728 E.03398
G1 X149.018 Y136.728 E.02411
G1 X149.663 Y137.372 E.03398
G1 X149.016 Y137.372 E.02411
G1 X148.371 Y136.728 E.03398
G1 X147.724 Y136.728 E.02411
G1 X148.369 Y137.372 E.03398
G1 X147.722 Y137.372 E.02411
G1 X147.078 Y136.728 E.03398
G1 X146.431 Y136.728 E.02411
G1 X147.075 Y137.372 E.03398
G1 X146.429 Y137.372 E.02411
G1 X145.784 Y136.728 E.03398
G1 X145.137 Y136.728 E.02411
G1 X145.782 Y137.372 E.03398
G1 X145.135 Y137.372 E.02411
G1 X144.49 Y136.728 E.03398
G1 X143.843 Y136.728 E.02411
G1 X144.488 Y137.372 E.03398
G1 X143.841 Y137.372 E.02411
G1 X143.196 Y136.728 E.03398
G1 X142.55 Y136.728 E.02411
G1 X143.194 Y137.372 E.03398
G1 X142.547 Y137.372 E.02411
G1 X141.903 Y136.728 E.03398
G1 X141.256 Y136.728 E.02411
G1 X141.901 Y137.372 E.03398
G1 X141.254 Y137.372 E.02411
G1 X140.609 Y136.728 E.03398
G1 X139.962 Y136.728 E.02411
G1 X140.607 Y137.372 E.03398
G1 X139.96 Y137.372 E.02411
G1 X136.678 Y134.09 E.17302
G1 X136.678 Y134.737 E.02411
G1 X139.313 Y137.372 E.13892
G1 X138.666 Y137.372 E.02411
G1 X136.678 Y135.384 E.10483
G1 X136.678 Y136.03 E.02411
G1 X138.02 Y137.372 E.07073
G1 X137.373 Y137.372 E.02411
G1 X136.678 Y136.677 E.03664
G1 X136.031 Y136.678 E.0241
G1 X136.726 Y137.372 E.03662
G1 X136.079 Y137.372 E.02411
G1 X135.384 Y136.678 E.03662
G1 X134.737 Y136.678 E.02411
G1 X135.432 Y137.372 E.03662
G1 X134.785 Y137.372 E.02411
G1 X134.091 Y136.678 E.03662
M73 P67 R3
G1 X133.444 Y136.678 E.02411
G1 X134.138 Y137.372 E.03662
G1 X133.492 Y137.372 E.02411
G1 X132.797 Y136.678 E.03662
G1 X132.15 Y136.678 E.02411
G1 X132.845 Y137.372 E.03662
G1 X132.198 Y137.372 E.02411
G1 X131.503 Y136.678 E.03662
G1 X130.856 Y136.678 E.02411
G1 X131.551 Y137.372 E.03662
G1 X130.904 Y137.372 E.02411
G1 X130.21 Y136.678 E.03662
G1 X129.563 Y136.678 E.02411
G1 X130.257 Y137.372 E.03662
G1 X129.611 Y137.372 E.02411
G1 X128.916 Y136.678 E.03662
G1 X128.269 Y136.678 E.02411
G1 X128.964 Y137.372 E.03662
G1 X128.317 Y137.372 E.02411
G1 X127.622 Y136.678 E.03662
G1 X126.975 Y136.678 E.02411
G1 X127.67 Y137.372 E.03662
G1 X127.023 Y137.372 E.02411
G1 X126.328 Y136.678 E.03662
G1 X125.682 Y136.678 E.02411
G1 X126.376 Y137.372 E.03662
G1 X125.729 Y137.372 E.02411
G1 X125.035 Y136.678 E.03662
G1 X124.388 Y136.678 E.02411
G1 X125.083 Y137.372 E.03662
G1 X124.436 Y137.372 E.02411
G1 X123.741 Y136.678 E.03662
G1 X123.094 Y136.678 E.02411
G1 X123.789 Y137.372 E.03662
G1 X123.142 Y137.372 E.02411
G1 X122.447 Y136.678 E.03662
G1 X121.8 Y136.678 E.02411
G1 X122.495 Y137.372 E.03662
G1 X121.848 Y137.372 E.02411
G1 X121.154 Y136.678 E.03662
G1 X120.507 Y136.678 E.02411
G1 X121.407 Y137.578 E.04746
; WIPE_START
G1 X120.507 Y136.678 E-.48387
G1 X121.154 Y136.678 E-.2458
G1 X121.21 Y136.734 E-.03033
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.126 Y130.896 Z.6 F42000
G1 X135.7 Y119.528 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X134.799 Y118.628 E.04745
G1 X134.152 Y118.628 E.02411
G1 X134.847 Y119.322 E.03661
G1 X134.2 Y119.322 E.02411
G1 X133.506 Y118.628 E.03661
G1 X132.859 Y118.628 E.02411
G1 X133.553 Y119.322 E.03661
G1 X132.906 Y119.322 E.02411
G1 X132.212 Y118.628 E.03661
G1 X131.565 Y118.628 E.02411
G1 X132.26 Y119.322 E.03661
G1 X131.613 Y119.322 E.02411
G1 X130.918 Y118.628 E.03661
G1 X130.271 Y118.628 E.02411
G1 X130.966 Y119.322 E.03661
G1 X130.319 Y119.322 E.02411
G1 X129.624 Y118.628 E.03661
G1 X128.978 Y118.628 E.02411
G1 X129.672 Y119.322 E.03661
G1 X129.025 Y119.322 E.02411
G1 X128.331 Y118.628 E.03661
G1 X127.684 Y118.628 E.02411
G1 X128.379 Y119.322 E.03661
G1 X127.732 Y119.322 E.02411
G1 X127.037 Y118.628 E.03661
G1 X126.39 Y118.628 E.02411
G1 X127.085 Y119.322 E.03661
G1 X126.438 Y119.322 E.02411
G1 X125.743 Y118.628 E.03661
G1 X125.097 Y118.628 E.02411
G1 X125.791 Y119.322 E.03661
G1 X125.144 Y119.322 E.02411
G1 X124.45 Y118.628 E.03661
G1 X123.803 Y118.628 E.02411
G1 X124.497 Y119.322 E.03661
G1 X123.851 Y119.322 E.02411
G1 X123.156 Y118.628 E.03661
G1 X122.509 Y118.628 E.02411
G1 X123.204 Y119.322 E.03661
G1 X122.557 Y119.322 E.02411
G1 X121.862 Y118.628 E.03661
G1 X121.215 Y118.628 E.02411
G1 X121.91 Y119.322 E.03661
G1 X121.263 Y119.322 E.02411
G1 X120.569 Y118.628 E.03661
G1 X119.922 Y118.628 E.02411
G1 X120.616 Y119.322 E.03661
G1 X119.97 Y119.322 E.02411
G1 X119.275 Y118.628 E.03661
G1 X118.628 Y118.628 E.02411
G1 X119.323 Y119.322 E.03661
G1 X119.322 Y119.969 E.0241
G1 X117.981 Y118.628 E.07069
G1 X117.334 Y118.628 E.02411
G1 X119.322 Y120.616 E.10479
G1 X119.322 Y121.263 E.02411
G1 X116.687 Y118.628 E.13888
G1 X116.041 Y118.628 E.02411
G1 X119.322 Y121.909 E.17298
G1 X119.322 Y122.556 E.02411
G1 X116.628 Y119.862 E.14204
G1 X116.628 Y119.372 E.01823
G1 X116.138 Y119.372 E.01823
G1 X115.394 Y118.628 E.03925
G1 X114.747 Y118.628 E.02411
G1 X115.492 Y119.372 E.03925
G1 X114.845 Y119.372 E.02411
G1 X114.1 Y118.628 E.03925
G1 X113.453 Y118.628 E.02411
G1 X114.198 Y119.372 E.03925
G1 X113.551 Y119.372 E.02411
G1 X112.806 Y118.628 E.03925
G1 X112.16 Y118.628 E.02411
G1 X112.904 Y119.372 E.03925
G1 X112.257 Y119.372 E.02411
G1 X111.513 Y118.628 E.03925
G1 X110.866 Y118.628 E.02411
G1 X111.611 Y119.372 E.03925
G1 X110.964 Y119.372 E.02411
G1 X110.219 Y118.628 E.03925
G1 X109.572 Y118.628 E.02411
G1 X110.317 Y119.372 E.03925
M73 P68 R3
G1 X109.67 Y119.372 E.02411
G1 X108.925 Y118.628 E.03925
G1 X108.278 Y118.628 E.02411
G1 X109.023 Y119.372 E.03925
G1 X108.376 Y119.372 E.02411
G1 X107.632 Y118.628 E.03925
G1 X106.985 Y118.628 E.02411
G1 X107.729 Y119.372 E.03925
G1 X107.083 Y119.372 E.02411
G1 X106.338 Y118.628 E.03925
G1 X105.691 Y118.628 E.02411
G1 X106.436 Y119.372 E.03925
G1 X105.789 Y119.372 E.02411
G1 X105.044 Y118.628 E.03925
G1 X104.397 Y118.628 E.02411
G1 X105.142 Y119.372 E.03925
G1 X104.495 Y119.372 E.02411
G1 X103.751 Y118.628 E.03925
G1 X103.104 Y118.628 E.02411
G1 X103.848 Y119.372 E.03925
G1 X103.201 Y119.372 E.02411
G1 X102.457 Y118.628 E.03925
G1 X101.81 Y118.628 E.02411
G1 X102.555 Y119.372 E.03925
G1 X101.908 Y119.372 E.02411
G1 X101.163 Y118.628 E.03925
G1 X100.516 Y118.628 E.02411
G1 X101.261 Y119.372 E.03925
G1 X100.614 Y119.372 E.02411
G1 X99.897 Y118.655 E.03781
G2 X99.63 Y119.035 I.101 J.354 E.01872
G1 X100.173 Y119.578 E.02862
; WIPE_START
G1 X99.63 Y119.035 E-.29176
G1 X99.649 Y118.89 E-.05572
G1 X99.716 Y118.766 E-.05329
G1 X99.821 Y118.677 E-.05245
G1 X99.897 Y118.655 E-.0299
G1 X100.412 Y119.17 E-.27689
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.025 Y119.709 Z.6 F42000
G1 X116.422 Y120.303 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X119.322 Y123.203 E.15288
G1 X119.322 Y123.85 E.02411
G1 X116.628 Y121.155 E.14204
G1 X116.628 Y121.802 E.02411
G1 X119.322 Y124.497 E.14204
G1 X119.322 Y125.144 E.02411
G1 X116.628 Y122.449 E.14204
G1 X116.628 Y123.096 E.02411
G1 X119.322 Y125.79 E.14204
G1 X119.322 Y126.437 E.02411
G1 X116.628 Y123.743 E.14204
G1 X116.628 Y124.389 E.02411
G1 X119.322 Y127.084 E.14204
G1 X119.322 Y127.731 E.02411
G1 X116.628 Y125.036 E.14204
G1 X116.628 Y125.683 E.02411
G1 X119.322 Y128.378 E.14204
G1 X119.322 Y129.025 E.02411
G1 X116.628 Y126.33 E.14204
G1 X116.628 Y126.977 E.02411
G1 X119.322 Y129.672 E.14204
G1 X119.322 Y130.318 E.02411
G1 X116.628 Y127.624 E.14204
G1 X116.628 Y128.271 E.02411
G1 X119.322 Y130.965 E.14204
G1 X119.322 Y131.612 E.02411
G1 X116.628 Y128.917 E.14204
G1 X116.628 Y129.564 E.02411
G1 X119.322 Y132.259 E.14204
G1 X119.322 Y132.906 E.02411
G1 X116.628 Y130.211 E.14204
G1 X116.628 Y130.858 E.02411
G1 X119.322 Y133.553 E.14204
G1 X119.322 Y134.199 E.02411
G1 X116.628 Y131.505 E.14204
G1 X116.628 Y132.152 E.02411
G1 X119.322 Y134.846 E.14204
G1 X119.322 Y135.493 E.02411
G1 X116.628 Y132.798 E.14204
G1 X116.628 Y133.445 E.02411
G1 X119.322 Y136.14 E.14204
G1 X119.322 Y136.678 E.02004
G1 X119.86 Y136.678 E.02004
G1 X120.555 Y137.372 E.03662
G1 X119.908 Y137.372 E.02411
G1 X116.628 Y134.092 E.1729
G1 X116.628 Y134.739 E.02411
G1 X119.261 Y137.372 E.1388
G1 X118.614 Y137.372 E.02411
G1 X116.628 Y135.386 E.10471
G1 X116.628 Y136.033 E.02411
G1 X117.967 Y137.372 E.07061
G1 X117.32 Y137.372 E.02411
G1 X116.576 Y136.628 E.03925
G1 X115.929 Y136.628 E.02411
G1 X116.674 Y137.372 E.03925
G1 X116.027 Y137.372 E.02411
G1 X115.282 Y136.628 E.03925
M73 P69 R3
G1 X114.635 Y136.628 E.02411
G1 X115.38 Y137.372 E.03925
G1 X114.733 Y137.372 E.02411
G1 X113.988 Y136.628 E.03925
G1 X113.341 Y136.628 E.02411
G1 X114.086 Y137.372 E.03925
G1 X113.439 Y137.372 E.02411
G1 X112.695 Y136.628 E.03925
G1 X112.048 Y136.628 E.02411
G1 X112.792 Y137.372 E.03925
G1 X112.146 Y137.372 E.02411
G1 X111.401 Y136.628 E.03925
G1 X110.754 Y136.628 E.02411
G1 X111.499 Y137.372 E.03925
G1 X110.852 Y137.372 E.02411
G1 X110.107 Y136.628 E.03925
G1 X109.46 Y136.628 E.02411
G1 X110.205 Y137.372 E.03925
G1 X109.558 Y137.372 E.02411
G1 X108.814 Y136.628 E.03925
G1 X108.167 Y136.628 E.02411
G1 X108.911 Y137.372 E.03925
G1 X108.265 Y137.372 E.02411
G1 X107.52 Y136.628 E.03925
G1 X106.873 Y136.628 E.02411
G1 X107.618 Y137.372 E.03925
G1 X106.971 Y137.372 E.02411
G1 X106.226 Y136.628 E.03925
G1 X105.579 Y136.628 E.02411
G1 X106.324 Y137.372 E.03925
G1 X105.677 Y137.372 E.02411
G1 X104.932 Y136.628 E.03925
G1 X104.286 Y136.628 E.02411
G1 X105.03 Y137.372 E.03925
G1 X104.383 Y137.372 E.02411
G1 X103.639 Y136.628 E.03925
G1 X102.992 Y136.628 E.02411
G1 X103.737 Y137.372 E.03925
G1 X103.09 Y137.372 E.02411
G1 X102.345 Y136.628 E.03925
G1 X101.698 Y136.628 E.02411
G1 X102.443 Y137.372 E.03925
G1 X101.796 Y137.372 E.02411
G1 X101.051 Y136.628 E.03925
G1 X100.405 Y136.628 E.02411
G1 X101.149 Y137.372 E.03925
G1 X100.502 Y137.372 E.02411
G1 X99.942 Y136.812 E.02955
G1 X99.942 Y136.856 E.00165
G1 X99.628 Y136.856 E.01171
G2 X99.775 Y137.292 I.582 J.046 E.01763
G1 X100.061 Y137.578 E.01508
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X99.775 Y137.292 E-.15374
G1 X99.699 Y137.208 E-.04315
G1 X99.643 Y137.081 E-.05266
G1 X99.628 Y136.856 E-.08575
G1 X99.942 Y136.856 E-.11938
G1 X99.942 Y136.812 E-.01685
G1 X100.479 Y137.349 E-.28848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/7
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S193.8
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.071 J1.215 P1  F42000
G1 X136.059 Y135.26 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X136.059 Y136.059 E.02651
G1 X119.941 Y136.059 E.53467
G1 X119.941 Y119.941 E.53467
G1 X136.059 Y119.941 E.53467
G1 X136.059 Y135.2 E.50617
M204 S10000
G1 X135.652 Y135.26 F42000
G1 F5400
M204 S6000
G1 X135.652 Y135.652 E.01301
G1 X120.348 Y135.652 E.50767
G1 X120.348 Y120.348 E.50767
G1 X135.652 Y120.348 E.50767
G1 X135.652 Y135.2 E.49267
M204 S250
G1 X135.26 Y135.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y130.289 Z.8 F42000
G1 X115.21 Y119.991 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.009 Y119.991 E.02651
G1 X116.009 Y136.009 E.53136
G1 X99.991 Y136.009 E.53136
G1 X99.991 Y119.991 E.53136
G1 X115.15 Y119.991 E.50286
M204 S10000
G1 X115.602 Y120.79 F42000
G1 F5400
M204 S6000
G1 X115.602 Y135.602 E.49134
G1 X100.398 Y135.602 E.50435
G1 X100.398 Y120.398 E.50435
G1 X115.602 Y120.398 E.50435
G1 X115.602 Y120.73 E.01102
M204 S250
G1 X115.21 Y120.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
M73 P70 R3
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.457 Y125.022 Z.8 F42000
G1 X156.109 Y135.31 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X156.109 Y136.109 E.02651
G1 X139.891 Y136.109 E.53799
G1 X139.891 Y119.891 E.53799
G1 X156.109 Y119.891 E.53799
G1 X156.109 Y135.25 E.50949
M204 S10000
G1 X155.702 Y135.31 F42000
G1 F5400
M204 S6000
G1 X155.702 Y135.702 E.01301
G1 X140.298 Y135.702 E.51098
G1 X140.298 Y120.298 E.51098
G1 X155.702 Y120.298 E.51098
G1 X155.702 Y135.25 E.49599
M204 S250
G1 X155.31 Y135.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.007 Y133.04 Z.8 F42000
G1 X99.038 Y118.772 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X100.025 Y118.009 I.97 J.235 E.0447
G1 X155.993 Y118.01 E1.85657
G3 X156.988 Y118.951 I-.007 J1.004 E.05002
G1 X156.988 Y137.057 E.60059
G3 X155.975 Y137.991 I-.996 J-.064 E.05046
G1 X100.017 Y137.991 E1.85624
G3 X99.009 Y136.975 I-.009 J-.999 E.05291
G1 X99.012 Y118.95 E.59792
G3 X99.026 Y118.831 I.996 J.056 E.00399
M204 S10000
G1 X98.644 Y118.668 F42000
G1 F5400
M204 S6000
G3 X100.015 Y117.602 I1.366 J.341 E.06208
G1 X156.004 Y117.603 E1.85726
G3 X157.396 Y118.931 I-.022 J1.416 E.07017
G1 X157.396 Y137.073 E.6018
G3 X155.985 Y138.398 I-1.406 J-.084 E.07076
G1 X100.01 Y138.398 E1.85679
G3 X98.602 Y136.985 I0 J-1.408 E.07353
M73 P71 R3
G1 X98.604 Y118.931 E.5989
G3 X98.631 Y118.727 I1.405 J.079 E.00683
M204 S250
G1 X98.26 Y118.591 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X98.265 Y118.568 E.00071
G3 X100.005 Y117.21 I1.747 J.444 E.073
G1 X156.014 Y117.21 E1.72099
G3 X157.788 Y118.912 I-.036 J1.813 E.08298
G1 X157.788 Y137.09 E.55854
G3 X155.995 Y138.79 I-1.8 J-.102 E.08365
G1 X100.004 Y138.79 E1.72045
G3 X98.21 Y136.995 I.008 J-1.802 E.08652
G1 X98.212 Y118.912 E.55563
G1 X98.251 Y118.65 E.00814
; WIPE_START
M204 S6000
G1 X98.265 Y118.568 E-.03151
G1 X98.383 Y118.233 E-.1352
G1 X98.562 Y117.934 E-.13234
G1 X98.733 Y117.736 E-.09924
G1 X99.003 Y117.513 E-.13325
G1 X99.159 Y117.42 E-.06872
G1 X99.397 Y117.315 E-.09914
G1 X99.552 Y117.276 E-.0606
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


G1 X99.501 Y119.787 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.616382
G1 F6277.666
M204 S6000
G1 X99.5 Y136.213 E.76755
M204 S10000
G1 X137.205 Y136.263 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X137.017 Y136.828 E.01832
G1 X136.99 Y136.845 E.00096
G1 X138.922 Y136.845 E.05936
M73 P72 R3
G1 X138.745 Y136.313 E.01723
G1 X138.745 Y119.687 E.51084
G1 X138.922 Y119.156 E.01722
G1 X136.985 Y119.156 E.05952
G1 X137.205 Y119.737 E.01912
G1 X137.205 Y136.203 E.50592
M204 S10000
G1 X137.582 Y136.263 F42000
G1 F9547.299
M204 S6000
G1 X137.514 Y136.468 E.00664
G1 X138.419 Y136.468 E.02781
G1 X138.368 Y136.313 E.00502
G1 X138.368 Y119.687 E.51084
G1 X138.419 Y119.533 E.00501
G1 X137.514 Y119.533 E.0278
G1 X137.582 Y119.737 E.00663
G1 X137.582 Y136.203 E.50592
M204 S10000
G1 X137.975 Y119.925 F42000
; LINE_WIDTH: 0.45103
G1 F8821.151
M204 S6000
G1 X137.975 Y136.015 E.53508
M204 S10000
G1 X136.451 Y119.925 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X136.451 Y136.263 E.50199
G1 X136.413 Y136.376 E.00366
G1 X136.263 Y136.451 E.00518
G1 X119.737 Y136.451 E.50776
G1 X119.586 Y136.376 E.00518
G1 X119.549 Y136.263 E.00366
G1 X119.549 Y119.737 E.50776
G1 X119.586 Y119.624 E.00366
G1 X119.737 Y119.549 E.00518
G1 X136.263 Y119.549 E.50776
G1 X136.413 Y119.624 E.00518
G1 X136.444 Y119.866 E.00748
M204 S10000
G1 X136.263 Y118.783 F42000
; LINE_WIDTH: 0.438725
G1 F9095.388
M204 S6000
G1 X119.737 Y118.782 E.53299
G2 X116.213 Y118.795 I-1.227 J151.267 E.11368
G1 X100.541 Y118.795 E.50546
; LINE_WIDTH: 0.43623
G1 F9153.085
G1 X100.372 Y118.778 E.00544
; LINE_WIDTH: 0.40233
G1 F10016.416
G1 X100.203 Y118.762 E.00497
; LINE_WIDTH: 0.355318
G1 F11523.776
G1 X100.034 Y118.745 E.00432
G1 X99.802 Y118.852 E.0065
G1 X99.746 Y119.053 E.0053
G1 X100.105 Y119.058 E.00914
; LINE_WIDTH: 0.38079
G1 F10654.985
G1 X100.254 Y119.105 E.00431
; LINE_WIDTH: 0.435896
G1 F9160.868
G1 X100.404 Y119.152 E.00501
G1 X100.427 Y119.205 E.00186
G1 X116.213 Y119.205 E.5055
G1 X116.665 Y119.448 E.01644
G1 X116.778 Y119.787 E.01146
G1 X116.778 Y136.213 E.52598
G1 X116.665 Y136.552 E.01146
; LINE_WIDTH: 0.452851
G1 F8781.967
G1 X116.314 Y136.789 E.01416
G1 X116.213 Y136.795 E.00338
G1 X100.426 Y136.795 E.52734
G1 X100.402 Y136.848 E.00194
; LINE_WIDTH: 0.434914
G1 F9183.83
G1 X100.259 Y136.88 E.00471
; LINE_WIDTH: 0.39838
G1 F10127.722
G1 X100.115 Y136.912 E.00427
; LINE_WIDTH: 0.347133
G1 F11833.818
G3 X99.748 Y136.944 I-.255 J-.812 E.0092
G1 X99.816 Y137.168 E.00581
G1 X99.949 Y137.243 E.00379
; LINE_WIDTH: 0.361847
G1 F11287.861
G1 X100.146 Y137.23 E.00513
; LINE_WIDTH: 0.39838
G1 F10127.722
G1 X100.343 Y137.218 E.00571
; LINE_WIDTH: 0.421181
G1 F9517.241
G1 X100.54 Y137.205 E.00608
G1 X116.213 Y137.205 E.48308
G2 X119.737 Y137.218 I2.297 J-150.668 E.10865
G1 X136.263 Y137.218 E.50937
G3 X139.687 Y137.23 I-.725 J667.696 E.10556
G1 X155.949 Y137.23 E.50124
G1 X156.178 Y137.13 E.00772
G1 X156.208 Y137.073 E.00196
G1 X155.965 Y137.06 E.00751
G1 X155.703 Y136.92 E.00915
G1 X155.682 Y136.87 E.00167
G1 X139.687 Y136.87 E.49301
G1 X139.235 Y136.652 E.01548
G1 X139.122 Y136.313 E.01103
G1 X139.122 Y119.687 E.51245
G1 X139.235 Y119.348 E.01103
G1 X139.591 Y119.136 E.01277
; LINE_WIDTH: 0.404453
G1 F9957.614
G1 X155.682 Y119.13 E.47406
G1 X155.703 Y119.081 E.00159
G3 X156.192 Y118.896 I.529 J.662 E.01564
G1 X156.071 Y118.798 E.00459
G1 X155.579 Y118.77 E.01451
G1 X139.687 Y118.77 E.46818
G3 X136.323 Y118.782 I-3.887 J-609.459 E.09913
M204 S10000
G1 X119.172 Y119.737 F42000
; LINE_WIDTH: 0.424034
G1 F9446.014
M204 S6000
G1 X119.285 Y119.398 E.01111
G1 X119.638 Y119.173 E.01301
G1 X119.737 Y119.168 E.00308
G1 X136.263 Y119.168 E.51321
G1 X136.715 Y119.398 E.01577
G1 X136.828 Y119.737 E.01111
G1 X136.828 Y136.263 E.51321
G1 X136.715 Y136.602 E.01111
G1 X136.362 Y136.827 E.01301
G1 X136.263 Y136.832 E.00308
G1 X119.737 Y136.832 E.51321
G1 X119.285 Y136.602 E.01577
G1 X119.172 Y136.263 E.01111
G1 X119.172 Y119.797 E.51135
M204 S10000
G1 X118.795 Y119.737 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X118.983 Y119.172 E.01832
G1 X119.01 Y119.155 E.00095
G1 X116.834 Y119.155 E.06684
G1 X116.967 Y119.222 E.00455
G1 X117.155 Y119.787 E.01832
G1 X117.155 Y136.213 E.50469
G1 X116.967 Y136.778 E.01832
G1 X116.859 Y136.845 E.0039
G1 X119.016 Y136.845 E.06629
G1 X118.795 Y136.263 E.01913
G1 X118.795 Y119.797 E.50592
M204 S10000
G1 X118.418 Y119.737 F42000
G1 F9547.299
M204 S6000
G1 X118.486 Y119.533 E.00663
G1 X117.447 Y119.533 E.03191
G1 X117.532 Y119.787 E.00825
G1 X117.532 Y136.213 E.50469
G1 X117.447 Y136.468 E.00826
G1 X118.486 Y136.468 E.03191
G1 X118.418 Y136.263 E.00664
G1 X118.418 Y119.797 E.50592
M204 S10000
G1 X116.401 Y119.975 F42000
G1 F9547.299
M204 S6000
G1 X116.401 Y136.213 E.49892
G1 X116.363 Y136.326 E.00366
G1 X116.213 Y136.401 E.00518
G1 X100.2 Y136.401 E.492
M73 P73 R3
G1 X100.138 Y136.556 E.00512
G1 X99.936 Y136.605 E.00639
G1 X99.404 Y136.605 E.01635
G1 X99.44 Y137.145 E.01664
G1 X99.529 Y137.36 E.00717
G1 X99.752 Y137.531 E.00863
G1 X100.081 Y137.599 E.01031
G1 X155.962 Y137.599 E1.71702
G1 X156.292 Y137.497 E.01062
G1 X156.476 Y137.355 E.00714
G1 X156.591 Y137.045 E.01015
G2 X156.596 Y136.705 I-1.684 J-.199 E.01049
G1 X156.088 Y136.705 E.01563
G1 X155.958 Y136.653 E.0043
G1 X155.884 Y136.501 E.00517
G1 X139.687 Y136.501 E.49767
G1 X139.537 Y136.426 E.00518
G1 X139.499 Y136.313 E.00366
G1 X139.499 Y119.687 E.51084
G1 X139.537 Y119.574 E.00366
G1 X139.687 Y119.499 E.00518
G1 X155.899 Y119.499 E.49813
G1 X155.958 Y119.347 E.00499
G1 X156.13 Y119.295 E.00554
G1 X156.596 Y119.295 E.01432
G1 X156.588 Y118.957 E.01039
G1 X156.494 Y118.685 E.00885
G1 X156.3 Y118.501 E.00821
G1 X156.008 Y118.41 E.00939
G1 X100.039 Y118.401 E1.71975
G1 X99.726 Y118.493 E.01
G1 X99.524 Y118.646 E.0078
G1 X99.411 Y118.953 E.01005
G1 X99.404 Y119.395 E.01359
G1 X100.013 Y119.395 E.01873
G1 X100.139 Y119.444 E.00416
G1 X100.216 Y119.599 E.00531
G1 X116.213 Y119.599 E.49151
G1 X116.363 Y119.674 E.00518
G1 X116.394 Y119.916 E.00748
M204 S10000
G1 X117.975 Y136.025 F42000
; LINE_WIDTH: 0.55104
G1 F7084.941
M204 S6000
G1 X117.975 Y120.035 E.66207
; WIPE_START
G1 X117.975 Y122.035 E-.76
; WIPE_END
M73 P73 R2
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y121.571 Z.8 F42000
G1 X156.549 Y119.687 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51517
G1 F7623.081
M204 S6000
G1 X156.549 Y136.313 E.63978
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7623.081
G1 X156.549 Y134.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/7
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I-.056 J-1.216 P1  F42000
G1 X136.059 Y135.26 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X136.059 Y136.059 E.02651
G1 X119.941 Y136.059 E.53467
G1 X119.941 Y119.941 E.53467
G1 X136.059 Y119.941 E.53467
G1 X136.059 Y135.2 E.50617
M204 S10000
G1 X135.652 Y135.26 F42000
G1 F5400
M204 S6000
G1 X135.652 Y135.652 E.01301
G1 X120.348 Y135.652 E.50767
G1 X120.348 Y120.348 E.50767
G1 X135.652 Y120.348 E.50767
G1 X135.652 Y135.2 E.49267
M204 S250
G1 X135.26 Y135.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y130.289 Z1 F42000
G1 X115.21 Y119.991 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.009 Y119.991 E.02651
G1 X116.009 Y136.009 E.53136
G1 X99.991 Y136.009 E.53136
G1 X99.991 Y119.991 E.53136
G1 X115.15 Y119.991 E.50286
M204 S10000
G1 X115.602 Y120.79 F42000
G1 F5400
M204 S6000
G1 X115.602 Y135.602 E.49134
G1 X100.398 Y135.602 E.50435
G1 X100.398 Y120.398 E.50435
G1 X115.602 Y120.398 E.50435
G1 X115.602 Y120.73 E.01102
M204 S250
G1 X115.21 Y120.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.457 Y125.022 Z1 F42000
G1 X156.109 Y135.31 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P74 R2
G1 F5400
M204 S6000
G1 X156.109 Y136.109 E.02651
G1 X139.891 Y136.109 E.53799
G1 X139.891 Y119.891 E.53799
G1 X156.109 Y119.891 E.53799
G1 X156.109 Y135.25 E.50949
M204 S10000
G1 X155.702 Y135.31 F42000
G1 F5400
M204 S6000
G1 X155.702 Y135.702 E.01301
G1 X140.298 Y135.702 E.51098
G1 X140.298 Y120.298 E.51098
G1 X155.702 Y120.298 E.51098
G1 X155.702 Y135.25 E.49599
M204 S250
G1 X155.31 Y135.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.009 Y133.033 Z1 F42000
G1 X99.051 Y118.724 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X100.025 Y118.009 I.957 J.282 E.04307
G1 X156.005 Y118.01 E1.85697
G3 X156.988 Y118.951 I-.014 J.999 E.04969
G1 X156.988 Y137.049 E.60031
G3 X155.975 Y137.991 I-.991 J-.05 E.0508
G1 X100.013 Y137.991 E1.85637
G3 X99.009 Y136.975 I-.005 J-.999 E.05277
G1 X99.012 Y118.949 E.59796
G3 X99.035 Y118.782 I.996 J.058 E.00559
M204 S10000
G1 X98.644 Y118.682 F42000
G1 F5400
M204 S6000
G1 X98.731 Y118.422 E.0091
G3 X100.015 Y117.602 I1.279 J.588 E.05341
G1 X156.016 Y117.603 E1.85767
G3 X157.396 Y118.931 I-.028 J1.41 E.06984
G1 X157.396 Y137.069 E.60164
G3 X155.985 Y138.398 I-1.399 J-.072 E.071
G1 X100.008 Y138.398 E1.85686
G3 X98.602 Y136.985 I.002 J-1.408 E.07346
G1 X98.604 Y118.93 E.59892
G3 X98.628 Y118.74 I1.405 J.08 E.00635
M204 S250
G1 X98.273 Y118.563 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X98.373 Y118.262 E.00974
G3 X100.005 Y117.21 I1.639 J.751 E.06301
G1 X156.027 Y117.211 E1.72138
G3 X157.788 Y118.912 I-.042 J1.805 E.08267
M73 P75 R2
G1 X157.788 Y137.088 E.55849
G3 X155.995 Y138.79 I-1.793 J-.093 E.08379
G1 X100.003 Y138.79 E1.72047
G3 X98.21 Y136.995 I.009 J-1.802 E.08649
G1 X98.212 Y118.912 E.55564
G3 X98.246 Y118.652 I1.8 J.101 E.00806
G1 X98.256 Y118.62 E.00102
; WIPE_START
M204 S6000
G1 X98.373 Y118.262 E-.14321
G1 X98.564 Y117.932 E-.14484
G1 X98.796 Y117.676 E-.13146
G1 X99.004 Y117.513 E-.10009
G1 X99.159 Y117.42 E-.06872
G1 X99.397 Y117.315 E-.09907
G1 X99.582 Y117.267 E-.07261
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
G1 X99.501 Y119.787 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.616382
G1 F6277.666
M204 S6000
G1 X99.5 Y136.213 E.76755
M204 S10000
G1 X137.205 Y136.263 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X137.017 Y136.828 E.01832
G1 X136.99 Y136.845 E.00096
G1 X138.922 Y136.845 E.05936
G1 X138.745 Y136.313 E.01723
G1 X138.745 Y119.687 E.51084
G1 X138.922 Y119.156 E.01721
G1 X136.985 Y119.156 E.05951
G1 X137.205 Y119.737 E.01911
G1 X137.205 Y136.203 E.50592
M204 S10000
G1 X137.582 Y136.263 F42000
G1 F9547.299
M204 S6000
G1 X137.514 Y136.468 E.00664
G1 X138.419 Y136.468 E.02781
G1 X138.368 Y136.313 E.00502
G1 X138.368 Y119.687 E.51084
G1 X138.419 Y119.533 E.005
M73 P76 R2
G1 X137.514 Y119.533 E.0278
G1 X137.582 Y119.737 E.00662
G1 X137.582 Y136.203 E.50592
M204 S10000
G1 X137.975 Y119.926 F42000
; LINE_WIDTH: 0.45102
G1 F8821.367
M204 S6000
G1 X137.975 Y136.015 E.53506
M204 S10000
G1 X136.451 Y119.926 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X136.451 Y136.263 E.50198
G1 X136.413 Y136.376 E.00366
G1 X136.263 Y136.451 E.00518
G1 X119.737 Y136.451 E.50776
G1 X119.586 Y136.376 E.00518
G1 X119.549 Y136.263 E.00366
G1 X119.549 Y119.737 E.50776
G1 X119.586 Y119.624 E.00366
G1 X119.737 Y119.549 E.00518
G1 X136.263 Y119.549 E.50776
G1 X136.413 Y119.624 E.00518
G1 X136.444 Y119.866 E.00749
M204 S10000
G1 X136.263 Y118.783 F42000
; LINE_WIDTH: 0.438676
G1 F9096.518
M204 S6000
G1 X119.737 Y118.783 E.53293
G2 X116.213 Y118.795 I-1.227 J151.562 E.11367
G1 X100.541 Y118.795 E.50539
; LINE_WIDTH: 0.43614
G1 F9155.18
G1 X100.369 Y118.778 E.00552
; LINE_WIDTH: 0.40206
G1 F10023.946
G1 X100.198 Y118.762 E.00505
; LINE_WIDTH: 0.355032
G1 F11534.328
G1 X100.026 Y118.746 E.00439
G1 X99.837 Y118.831 E.00528
G1 X99.746 Y119.042 E.00584
G1 X100.105 Y119.058 E.00914
; LINE_WIDTH: 0.38079
G1 F10654.985
G1 X100.254 Y119.105 E.00431
; LINE_WIDTH: 0.435884
G1 F9161.151
G1 X100.404 Y119.152 E.00501
G1 X100.427 Y119.205 E.00186
G1 X116.213 Y119.205 E.50548
G1 X116.665 Y119.448 E.01644
G1 X116.778 Y119.787 E.01145
G1 X116.778 Y136.213 E.52597
G1 X116.665 Y136.552 E.01145
; LINE_WIDTH: 0.452851
G1 F8781.967
G1 X116.314 Y136.789 E.01416
G1 X116.213 Y136.795 E.00338
G1 X100.426 Y136.795 E.52734
G1 X100.402 Y136.848 E.00194
; LINE_WIDTH: 0.478038
G1 F8273.627
G1 X100.308 Y136.91 E.00403
; LINE_WIDTH: 0.527753
G1 F7425.244
G1 X100.213 Y136.973 E.00449
; LINE_WIDTH: 0.577468
G1 F6734.668
G1 X100.118 Y137.035 E.00495
; LINE_WIDTH: 0.627183
G1 F6161.614
G1 X100.023 Y137.098 E.00541
G1 X100.152 Y137.125 E.00628
; LINE_WIDTH: 0.577468
G1 F6734.668
G1 X100.282 Y137.151 E.00575
; LINE_WIDTH: 0.527753
G1 F7425.244
G1 X100.411 Y137.178 E.00521
; LINE_WIDTH: 0.453393
G1 F8770.379
G1 X100.54 Y137.205 E.00441
G1 X116.213 Y137.205 E.52422
; LINE_WIDTH: 0.414448
G1 F9689.733
G2 X119.737 Y137.218 I2.297 J-150.668 E.10671
G1 X136.263 Y137.218 E.5003
G3 X139.687 Y137.23 I-.725 J667.696 E.10368
G1 X155.947 Y137.23 E.49225
G1 X156.174 Y137.135 E.00745
G1 X156.208 Y137.073 E.00213
G1 X155.963 Y137.059 E.00744
G1 X155.703 Y136.92 E.00892
G1 X155.682 Y136.87 E.00164
G1 X139.687 Y136.87 E.48423
G1 X139.235 Y136.652 E.0152
G1 X139.122 Y136.313 E.01083
G1 X139.122 Y119.687 E.50333
G1 X139.235 Y119.348 E.01083
G1 X139.591 Y119.136 E.01254
; LINE_WIDTH: 0.404332
G1 F9960.941
G1 X155.682 Y119.13 E.4739
G1 X155.703 Y119.081 E.00159
G3 X156.192 Y118.895 I.542 J.689 E.01563
G1 X156.069 Y118.796 E.00464
G1 X155.579 Y118.77 E.01444
G1 X139.687 Y118.77 E.46802
G3 X136.323 Y118.782 I-3.828 J-594.07 E.09909
M204 S10000
G1 X119.172 Y119.737 F42000
; LINE_WIDTH: 0.424014
G1 F9446.5
M204 S6000
G1 X119.285 Y119.398 E.01111
G1 X119.638 Y119.173 E.01301
G1 X119.737 Y119.168 E.00308
G1 X136.263 Y119.168 E.51318
G1 X136.715 Y119.398 E.01577
G1 X136.828 Y119.737 E.01111
G1 X136.828 Y136.263 E.51318
G1 X136.715 Y136.602 E.01111
G1 X136.362 Y136.827 E.01301
G1 X136.263 Y136.832 E.00308
G1 X119.737 Y136.832 E.51318
G1 X119.285 Y136.602 E.01577
G1 X119.172 Y136.263 E.01111
G1 X119.172 Y119.797 E.51132
M204 S10000
G1 X118.795 Y119.737 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X118.983 Y119.172 E.01832
G1 X119.009 Y119.156 E.00095
G1 X116.834 Y119.156 E.06683
G1 X116.967 Y119.222 E.00455
G1 X117.155 Y119.787 E.01832
G1 X117.155 Y136.213 E.50469
G1 X116.967 Y136.778 E.01832
G1 X116.859 Y136.845 E.0039
G1 X119.016 Y136.845 E.06629
G1 X118.795 Y136.263 E.01913
G1 X118.795 Y119.797 E.50592
M204 S10000
G1 X118.418 Y119.737 F42000
G1 F9547.299
M204 S6000
G1 X118.486 Y119.533 E.00663
G1 X117.448 Y119.533 E.0319
G1 X117.532 Y119.787 E.00825
M73 P77 R2
G1 X117.532 Y136.213 E.50469
G1 X117.447 Y136.468 E.00826
G1 X118.486 Y136.468 E.03191
G1 X118.418 Y136.263 E.00664
G1 X118.418 Y119.797 E.50592
M204 S10000
G1 X116.401 Y119.975 F42000
G1 F9547.299
M204 S6000
G1 X116.401 Y136.213 E.49892
G1 X116.363 Y136.326 E.00366
G1 X116.213 Y136.401 E.00518
G1 X100.2 Y136.401 E.492
G1 X100.138 Y136.556 E.00512
G1 X99.933 Y136.605 E.0065
G1 X99.404 Y136.605 E.01623
G1 X99.442 Y137.155 E.01693
G1 X99.589 Y137.42 E.00932
G1 X99.812 Y137.563 E.00815
G1 X100.54 Y137.599 E.02241
G1 X155.96 Y137.599 E1.70287
G1 X156.28 Y137.505 E.01024
G1 X156.477 Y137.353 E.00764
G1 X156.591 Y137.037 E.01033
G2 X156.596 Y136.705 I-1.695 J-.193 E.01023
G1 X156.088 Y136.705 E.01563
G1 X155.958 Y136.653 E.0043
G1 X155.884 Y136.501 E.00517
G1 X139.687 Y136.501 E.49767
G1 X139.537 Y136.426 E.00518
G1 X139.499 Y136.313 E.00366
G1 X139.499 Y119.687 E.51084
G1 X139.537 Y119.574 E.00366
G1 X139.687 Y119.499 E.00518
G1 X155.899 Y119.499 E.49813
G1 X155.958 Y119.347 E.00499
G1 X156.133 Y119.295 E.00563
G1 X156.596 Y119.295 E.01424
G1 X156.588 Y118.957 E.01039
G1 X156.495 Y118.685 E.00885
G1 X156.299 Y118.501 E.00826
G1 X156.02 Y118.411 E.00898
G1 X100.04 Y118.401 E1.72009
G1 X99.754 Y118.48 E.00911
G2 X99.479 Y118.717 I.38 J.717 E.01125
G2 X99.404 Y119.395 I1.417 J.502 E.02116
G1 X100.013 Y119.395 E.01873
G1 X100.139 Y119.444 E.00416
G1 X100.216 Y119.599 E.00531
G1 X116.213 Y119.599 E.49151
G1 X116.363 Y119.674 E.00518
G1 X116.394 Y119.916 E.00748
M204 S10000
G1 X117.975 Y136.025 F42000
; LINE_WIDTH: 0.55104
G1 F7084.941
M204 S6000
G1 X117.975 Y120.035 E.66206
; WIPE_START
G1 X117.975 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y121.572 Z1 F42000
G1 X156.549 Y119.687 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51517
G1 F7623.081
M204 S6000
G1 X156.549 Y136.313 E.63978
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7623.081
G1 X156.549 Y134.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/7
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I-.056 J-1.216 P1  F42000
G1 X136.059 Y135.26 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X136.059 Y136.059 E.02651
G1 X119.941 Y136.059 E.53467
G1 X119.941 Y119.941 E.53467
G1 X136.059 Y119.941 E.53467
G1 X136.059 Y135.2 E.50617
M204 S10000
G1 X135.652 Y135.26 F42000
G1 F5400
M204 S6000
G1 X135.652 Y135.652 E.01301
G1 X120.348 Y135.652 E.50767
G1 X120.348 Y120.348 E.50767
G1 X135.652 Y120.348 E.50767
G1 X135.652 Y135.2 E.49267
M204 S250
G1 X135.26 Y135.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y130.289 Z1.2 F42000
G1 X115.21 Y119.991 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.009 Y119.991 E.02651
G1 X116.009 Y136.009 E.53136
G1 X99.991 Y136.009 E.53136
G1 X99.991 Y119.991 E.53136
G1 X115.15 Y119.991 E.50286
M204 S10000
G1 X115.602 Y120.79 F42000
G1 F5400
M204 S6000
G1 X115.602 Y135.602 E.49134
G1 X100.398 Y135.602 E.50435
G1 X100.398 Y120.398 E.50435
G1 X115.602 Y120.398 E.50435
G1 X115.602 Y120.73 E.01102
M204 S250
G1 X115.21 Y120.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.457 Y125.022 Z1.2 F42000
M73 P78 R2
G1 X156.109 Y135.31 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X156.109 Y136.109 E.02651
G1 X139.891 Y136.109 E.53799
G1 X139.891 Y119.891 E.53799
G1 X156.109 Y119.891 E.53799
G1 X156.109 Y135.25 E.50949
M204 S10000
G1 X155.702 Y135.31 F42000
G1 F5400
M204 S6000
G1 X155.702 Y135.702 E.01301
G1 X140.298 Y135.702 E.51098
G1 X140.298 Y120.298 E.51098
G1 X155.702 Y120.298 E.51098
G1 X155.702 Y135.25 E.49599
M204 S250
G1 X155.31 Y135.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.008 Y133.038 Z1.2 F42000
G1 X99.044 Y118.757 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X99.082 Y118.633 E.00431
G3 X100.025 Y118.009 I.925 J.373 E.03987
G1 X156.017 Y118.01 E1.85736
G3 X156.988 Y118.951 I-.022 J.995 E.04933
G1 X156.988 Y137.061 E.60072
G3 X155.975 Y137.991 I-.992 J-.063 E.05039
G1 X100.013 Y137.991 E1.85637
G3 X99.009 Y136.975 I-.01 J-.994 E.05284
G1 X99.012 Y118.948 E.598
G3 X99.028 Y118.815 I.996 J.059 E.00443
M204 S10000
G1 X98.654 Y118.646 F42000
G1 F5400
M204 S6000
G1 X98.709 Y118.473 E.00603
G3 X100.015 Y117.602 I1.301 J.537 E.05525
G1 X156.029 Y117.603 E1.85807
G3 X157.396 Y118.931 I-.037 J1.406 E.06947
G1 X157.396 Y137.076 E.60189
G3 X155.985 Y138.398 I-1.4 J-.08 E.07076
G1 X100.008 Y138.398 E1.85687
G3 X98.602 Y136.985 I-.004 J-1.402 E.07354
G1 X98.604 Y118.929 E.59894
G3 X98.63 Y118.73 I1.405 J.081 E.00667
G1 X98.638 Y118.704 E.0009
M204 S250
G1 X98.28 Y118.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X98.349 Y118.319 E.00696
G3 X100.005 Y117.21 I1.664 J.694 E.06491
G1 X156.04 Y117.211 E1.72178
G3 X157.788 Y118.912 I-.051 J1.801 E.08232
G1 X157.788 Y137.09 E.55856
G3 X155.995 Y138.79 I-1.793 J-.096 E.08372
M73 P79 R2
G1 X100.003 Y138.79 E1.72047
G3 X98.21 Y136.995 I.002 J-1.795 E.08658
G1 X98.212 Y118.911 E.55565
G3 X98.246 Y118.652 I1.8 J.101 E.00805
G1 X98.263 Y118.592 E.00191
; WIPE_START
M204 S6000
G1 X98.349 Y118.319 E-.10892
G1 X98.463 Y118.082 E-.09994
G1 X98.564 Y117.932 E-.06868
G1 X98.796 Y117.676 E-.13142
G1 X99.045 Y117.487 E-.11884
G1 X99.397 Y117.315 E-.14873
G1 X99.61 Y117.259 E-.08348
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


G1 X99.501 Y119.787 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.616382
G1 F6277.666
M204 S6000
G1 X99.5 Y136.213 E.76755
M204 S10000
G1 X137.205 Y136.263 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X137.017 Y136.828 E.01832
G1 X136.99 Y136.845 E.00096
G1 X138.922 Y136.845 E.05936
G1 X138.745 Y136.313 E.01723
G1 X138.745 Y119.687 E.51084
G1 X138.922 Y119.156 E.01721
G1 X136.986 Y119.156 E.05949
G1 X137.205 Y119.737 E.01909
G1 X137.205 Y136.203 E.50592
M204 S10000
G1 X137.582 Y136.263 F42000
G1 F9547.299
M204 S6000
G1 X137.514 Y136.468 E.00664
G1 X138.419 Y136.468 E.02781
G1 X138.368 Y136.313 E.00502
G1 X138.368 Y119.687 E.51084
G1 X138.419 Y119.533 E.00499
G1 X137.514 Y119.533 E.0278
M73 P80 R2
G1 X137.582 Y119.737 E.00661
G1 X137.582 Y136.203 E.50592
M204 S10000
G1 X137.975 Y119.926 F42000
; LINE_WIDTH: 0.45102
G1 F8821.367
M204 S6000
G1 X137.975 Y136.015 E.53505
M204 S10000
G1 X136.263 Y119.549 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X136.413 Y119.624 E.00518
G1 X136.451 Y119.737 E.00366
G1 X136.451 Y136.263 E.50776
G1 X136.413 Y136.376 E.00366
G1 X136.263 Y136.451 E.00518
G1 X119.737 Y136.451 E.50776
G1 X119.586 Y136.376 E.00518
G1 X119.549 Y136.263 E.00366
G1 X119.549 Y119.737 E.50776
G1 X119.586 Y119.624 E.00366
G1 X119.737 Y119.549 E.00518
G1 X136.203 Y119.549 E.50592
M204 S10000
G1 X136.263 Y118.783 F42000
; LINE_WIDTH: 0.438625
G1 F9097.698
M204 S6000
G1 X119.737 Y118.783 E.53286
G2 X116.213 Y118.795 I-1.225 J152.081 E.11366
G1 X100.541 Y118.795 E.50533
; LINE_WIDTH: 0.436075
G1 F9156.694
G1 X100.368 Y118.779 E.00557
; LINE_WIDTH: 0.401885
G1 F10028.833
G1 X100.195 Y118.762 E.00508
; LINE_WIDTH: 0.354716
G1 F11546.019
G1 X100.022 Y118.746 E.00442
G1 X99.805 Y118.848 E.00609
G1 X99.746 Y119.053 E.00543
G1 X100.105 Y119.058 E.00913
; LINE_WIDTH: 0.380788
G1 F10655.064
G1 X100.254 Y119.105 E.00431
; LINE_WIDTH: 0.43587
G1 F9161.489
G1 X100.404 Y119.152 E.00501
G1 X100.427 Y119.205 E.00186
G1 X116.213 Y119.205 E.50546
G1 X116.665 Y119.448 E.01644
G1 X116.778 Y119.787 E.01145
G1 X116.778 Y136.213 E.52595
G1 X116.665 Y136.552 E.01145
; LINE_WIDTH: 0.452851
G1 F8781.967
G1 X116.314 Y136.789 E.01416
G1 X116.213 Y136.795 E.00338
G1 X100.426 Y136.795 E.52734
G1 X100.402 Y136.848 E.00194
; LINE_WIDTH: 0.478145
G1 F8271.584
G1 X100.308 Y136.91 E.00401
; LINE_WIDTH: 0.528075
G1 F7420.309
G1 X100.214 Y136.973 E.00447
; LINE_WIDTH: 0.578005
G1 F6727.904
G1 X100.12 Y137.036 E.00493
; LINE_WIDTH: 0.627935
G1 F6153.688
G1 X100.026 Y137.098 E.00539
G1 X100.154 Y137.125 E.00626
; LINE_WIDTH: 0.578005
G1 F6727.904
G1 X100.283 Y137.152 E.00572
; LINE_WIDTH: 0.528075
G1 F7420.309
G1 X100.412 Y137.178 E.00519
; LINE_WIDTH: 0.453393
G1 F8770.383
G1 X100.54 Y137.205 E.00439
G1 X116.213 Y137.205 E.52422
; LINE_WIDTH: 0.414448
G1 F9689.719
G2 X119.737 Y137.218 I2.297 J-150.668 E.10671
G1 X136.263 Y137.218 E.5003
G3 X139.687 Y137.23 I-.725 J667.696 E.10368
G1 X155.945 Y137.23 E.49219
G1 X156.154 Y137.155 E.00672
G1 X156.205 Y137.076 E.00283
G1 X155.961 Y137.059 E.0074
G1 X155.703 Y136.92 E.00887
G1 X155.682 Y136.87 E.00164
G1 X139.687 Y136.87 E.48423
G1 X139.235 Y136.652 E.0152
G1 X139.122 Y136.313 E.01083
G1 X139.122 Y119.687 E.50333
G1 X139.235 Y119.348 E.01083
G1 X139.591 Y119.136 E.01254
; LINE_WIDTH: 0.404202
G1 F9964.538
G1 X155.682 Y119.13 E.47373
G1 X155.703 Y119.081 E.00159
G1 X155.96 Y118.942 E.00859
G1 X156.194 Y118.897 E.007
G1 X156.067 Y118.795 E.00479
G1 X155.579 Y118.771 E.01437
G1 X139.687 Y118.77 E.46786
G3 X136.323 Y118.783 I-3.783 J-581.856 E.09906
M204 S10000
G1 X119.172 Y119.737 F42000
; LINE_WIDTH: 0.423994
G1 F9446.987
M204 S6000
G1 X119.285 Y119.398 E.01111
G1 X119.638 Y119.173 E.01301
G1 X119.737 Y119.168 E.00308
G1 X136.263 Y119.168 E.51316
G1 X136.715 Y119.398 E.01576
G1 X136.828 Y119.737 E.01111
G1 X136.828 Y136.263 E.51316
G1 X136.715 Y136.602 E.01111
G1 X136.362 Y136.827 E.01301
G1 X136.263 Y136.832 E.00308
G1 X119.737 Y136.832 E.51316
G1 X119.285 Y136.602 E.01577
G1 X119.172 Y136.263 E.01111
G1 X119.172 Y119.797 E.51129
M204 S10000
G1 X118.795 Y119.737 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X118.983 Y119.172 E.01832
G1 X119.009 Y119.156 E.00094
G1 X116.835 Y119.156 E.06682
G1 X116.967 Y119.222 E.00454
G1 X117.155 Y119.787 E.01832
G1 X117.155 Y136.213 E.50469
G1 X116.967 Y136.778 E.01832
G1 X116.859 Y136.845 E.0039
G1 X119.016 Y136.845 E.06629
G1 X118.795 Y136.263 E.01913
G1 X118.795 Y119.797 E.50592
M204 S10000
G1 X118.418 Y119.737 F42000
G1 F9547.299
M204 S6000
G1 X118.486 Y119.533 E.00663
G1 X117.448 Y119.533 E.0319
G1 X117.532 Y119.787 E.00825
G1 X117.532 Y136.213 E.50469
G1 X117.447 Y136.468 E.00826
G1 X118.486 Y136.468 E.03191
G1 X118.418 Y136.263 E.00664
G1 X118.418 Y119.797 E.50592
M204 S10000
G1 X116.401 Y119.975 F42000
G1 F9547.299
M204 S6000
G1 X116.401 Y136.213 E.49891
G1 X116.363 Y136.326 E.00366
G1 X116.213 Y136.401 E.00518
G1 X100.2 Y136.401 E.492
G1 X100.138 Y136.556 E.00512
G1 X99.933 Y136.605 E.00647
G1 X99.405 Y136.605 E.01625
G1 X99.414 Y137.092 E.01497
G1 X99.529 Y137.359 E.00895
G1 X99.745 Y137.529 E.00843
G1 X100.073 Y137.599 E.01032
G1 X155.96 Y137.599 E1.71719
G1 X156.255 Y137.516 E.00942
G2 X156.596 Y136.991 I-.277 J-.554 E.0202
G1 X156.596 Y136.705 E.00878
G1 X156.088 Y136.705 E.01563
G1 X155.958 Y136.653 E.0043
G1 X155.884 Y136.501 E.00517
G1 X139.687 Y136.501 E.49767
G1 X139.537 Y136.426 E.00518
G1 X139.499 Y136.313 E.00366
G1 X139.499 Y119.687 E.51084
M73 P81 R2
G1 X139.537 Y119.574 E.00366
G1 X139.687 Y119.499 E.00518
G1 X155.899 Y119.499 E.49813
G1 X155.957 Y119.347 E.00499
G1 X156.136 Y119.295 E.00572
G1 X156.596 Y119.295 E.01414
G1 X156.588 Y118.957 E.0104
G1 X156.495 Y118.685 E.00884
G1 X156.297 Y118.5 E.00832
G1 X155.987 Y118.402 E.01
G1 X100.04 Y118.401 E1.71903
G2 X99.579 Y118.59 I.078 J.851 E.01556
G1 X99.44 Y118.801 E.00776
G2 X99.404 Y119.395 I1.778 J.408 E.01837
G1 X100.019 Y119.395 E.01891
G1 X100.139 Y119.444 E.004
G1 X100.216 Y119.599 E.00531
G1 X116.213 Y119.599 E.49151
G1 X116.363 Y119.674 E.00518
G1 X116.394 Y119.916 E.00748
M204 S10000
G1 X117.975 Y136.025 F42000
; LINE_WIDTH: 0.55104
G1 F7084.941
M204 S6000
G1 X117.975 Y120.035 E.66206
; WIPE_START
G1 X117.975 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y121.572 Z1.2 F42000
G1 X156.549 Y119.687 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51517
G1 F7623.081
M204 S6000
G1 X156.549 Y136.313 E.63978
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7623.081
G1 X156.549 Y134.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/7
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I-.056 J-1.216 P1  F42000
G1 X136.059 Y135.26 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X136.059 Y136.059 E.02651
G1 X119.941 Y136.059 E.53467
G1 X119.941 Y119.941 E.53467
G1 X136.059 Y119.941 E.53467
G1 X136.059 Y135.2 E.50617
M204 S10000
G1 X135.652 Y135.26 F42000
G1 F5400
M204 S6000
G1 X135.652 Y135.652 E.01301
G1 X120.348 Y135.652 E.50767
G1 X120.348 Y120.348 E.50767
G1 X135.652 Y120.348 E.50767
G1 X135.652 Y135.2 E.49267
M204 S250
G1 X135.26 Y135.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y130.289 Z1.4 F42000
G1 X115.21 Y119.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.009 Y119.991 E.02651
G1 X116.009 Y136.009 E.53136
G1 X99.991 Y136.009 E.53136
G1 X99.991 Y119.991 E.53136
G1 X115.15 Y119.991 E.50286
M204 S10000
G1 X115.602 Y120.79 F42000
G1 F5400
M204 S6000
G1 X115.602 Y135.602 E.49134
G1 X100.398 Y135.602 E.50435
G1 X100.398 Y120.398 E.50435
G1 X115.602 Y120.398 E.50435
G1 X115.602 Y120.73 E.01102
M204 S250
G1 X115.21 Y120.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.457 Y125.022 Z1.4 F42000
G1 X156.109 Y135.31 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X156.109 Y136.109 E.02651
G1 X139.891 Y136.109 E.53799
G1 X139.891 Y119.891 E.53799
G1 X156.109 Y119.891 E.53799
G1 X156.109 Y135.25 E.50949
M204 S10000
G1 X155.702 Y135.31 F42000
G1 F5400
M204 S6000
G1 X155.702 Y135.702 E.01301
G1 X140.298 Y135.702 E.51098
M73 P82 R2
G1 X140.298 Y120.298 E.51098
G1 X155.702 Y120.298 E.51098
G1 X155.702 Y135.25 E.49599
M204 S250
G1 X155.31 Y135.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P82 R1
G1 X146.008 Y133.036 Z1.4 F42000
G1 X99.047 Y118.744 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X100.025 Y118.009 I.969 J.271 E.04362
G1 X156.029 Y118.011 E1.85775
G3 X156.988 Y118.951 I-.042 J1.003 E.04885
G1 X156.988 Y137.052 E.60042
G3 X155.975 Y137.991 I-.996 J-.058 E.05063
G1 X100.013 Y137.991 E1.85637
G3 X99.009 Y136.975 I-.005 J-.999 E.05277
G1 X99.012 Y118.951 E.59788
G3 X99.032 Y118.802 I1.004 J.064 E.005
M204 S10000
G1 X98.654 Y118.636 F42000
G1 F5400
M204 S6000
G3 X100.015 Y117.602 I1.365 J.383 E.06085
G1 X156.041 Y117.604 E1.85848
G3 X157.396 Y118.931 I-.059 J1.415 E.06895
G1 X157.396 Y137.07 E.6017
G3 X155.985 Y138.398 I-1.405 J-.08 E.07086
G1 X100.008 Y138.398 E1.85687
G3 X98.602 Y136.985 I.002 J-1.408 E.07346
G1 X98.604 Y118.931 E.59887
G3 X98.64 Y118.694 I1.415 J.088 E.00796
M204 S250
G1 X98.285 Y118.498 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X98.389 Y118.235 E.00869
G3 X100.005 Y117.21 I1.633 J.788 E.06195
G1 X156.053 Y117.211 E1.72217
G3 X157.788 Y118.912 I-.075 J1.812 E.08181
G1 X157.788 Y137.088 E.55851
G3 X155.995 Y138.79 I-1.8 J-.101 E.08369
G1 X100.003 Y138.79 E1.72047
G3 X98.21 Y136.995 I.009 J-1.802 E.08649
G1 X98.212 Y118.912 E.55562
G3 X98.27 Y118.556 I1.81 J.111 E.0111
; WIPE_START
M204 S6000
G1 X98.389 Y118.235 E-.13005
G1 X98.564 Y117.932 E-.13308
G1 X98.734 Y117.734 E-.09912
G1 X99.035 Y117.493 E-.14637
M73 P83 R1
G1 X99.399 Y117.314 E-.15442
G1 X99.645 Y117.246 E-.09697
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


G1 X99.501 Y119.787 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.616382
G1 F6277.666
M204 S6000
G1 X99.5 Y136.213 E.76755
M204 S10000
G1 X137.205 Y136.263 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X137.017 Y136.828 E.01832
G1 X136.99 Y136.845 E.00096
G1 X138.922 Y136.845 E.05936
G1 X138.745 Y136.313 E.01723
G1 X138.745 Y119.687 E.51084
G1 X138.922 Y119.156 E.0172
G1 X136.986 Y119.156 E.05948
G1 X137.205 Y119.737 E.01908
G1 X137.205 Y136.203 E.50592
M204 S10000
G1 X137.582 Y136.263 F42000
G1 F9547.299
M204 S6000
G1 X137.514 Y136.468 E.00664
G1 X138.419 Y136.468 E.02781
G1 X138.368 Y136.313 E.00502
G1 X138.368 Y119.687 E.51084
G1 X138.419 Y119.533 E.00499
G1 X137.514 Y119.533 E.02779
G1 X137.582 Y119.737 E.00661
G1 X137.582 Y136.203 E.50592
M204 S10000
G1 X137.975 Y119.926 F42000
; LINE_WIDTH: 0.45103
G1 F8821.151
M204 S6000
G1 X137.975 Y136.015 E.53505
M204 S10000
M73 P84 R1
G1 X136.263 Y119.549 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X136.413 Y119.624 E.00518
G1 X136.451 Y119.737 E.00366
G1 X136.451 Y136.263 E.50776
G1 X136.413 Y136.376 E.00366
G1 X136.263 Y136.451 E.00518
G1 X119.737 Y136.451 E.50776
G1 X119.586 Y136.376 E.00518
G1 X119.549 Y136.263 E.00366
G1 X119.549 Y119.737 E.50776
G1 X119.586 Y119.624 E.00366
G1 X119.737 Y119.549 E.00518
G1 X136.203 Y119.549 E.50592
M204 S10000
G1 X136.263 Y118.783 F42000
; LINE_WIDTH: 0.438578
G1 F9098.776
M204 S6000
G1 X119.737 Y118.783 E.53279
G2 X116.213 Y118.795 I-1.225 J152.379 E.11364
G1 X100.541 Y118.795 E.50527
; LINE_WIDTH: 0.435849
G1 F9161.977
G1 X100.362 Y118.779 E.00576
; LINE_WIDTH: 0.401205
G1 F10047.867
G1 X100.183 Y118.764 E.00525
; LINE_WIDTH: 0.353884
G1 F11576.912
G1 X100.004 Y118.748 E.00456
G1 X99.836 Y118.828 E.00471
G1 X99.745 Y119.042 E.0059
G1 X100.105 Y119.058 E.00913
; LINE_WIDTH: 0.380788
G1 F10655.064
G1 X100.254 Y119.105 E.00431
; LINE_WIDTH: 0.43586
G1 F9161.715
G1 X100.404 Y119.152 E.00501
G1 X100.427 Y119.205 E.00186
G1 X116.213 Y119.205 E.50545
G1 X116.665 Y119.448 E.01644
G1 X116.778 Y119.787 E.01145
G1 X116.778 Y136.213 E.52593
G1 X116.665 Y136.552 E.01145
; LINE_WIDTH: 0.452851
G1 F8781.967
G1 X116.314 Y136.789 E.01416
G1 X116.213 Y136.795 E.00338
G1 X100.426 Y136.795 E.52734
G1 X100.402 Y136.848 E.00194
; LINE_WIDTH: 0.473192
G1 F8366.801
G1 X100.328 Y136.898 E.00314
; LINE_WIDTH: 0.513216
G1 F7654.753
G1 X100.254 Y136.948 E.00344
; LINE_WIDTH: 0.55324
G1 F7054.397
G1 X100.179 Y136.998 E.00373
; LINE_WIDTH: 0.593264
G1 F6541.363
G1 X100.105 Y137.048 E.00402
; LINE_WIDTH: 0.633288
G1 F6097.892
G1 X100.031 Y137.098 E.00431
G1 X100.133 Y137.12 E.00501
; LINE_WIDTH: 0.593264
G1 F6541.363
G1 X100.234 Y137.141 E.00467
; LINE_WIDTH: 0.55324
G1 F7054.397
G1 X100.336 Y137.162 E.00433
; LINE_WIDTH: 0.513216
G1 F7654.753
G1 X100.438 Y137.184 E.00399
; LINE_WIDTH: 0.453317
G1 F8771.993
G1 X100.54 Y137.205 E.00348
G1 X116.213 Y137.205 E.52413
; LINE_WIDTH: 0.414448
G1 F9689.722
G2 X119.737 Y137.218 I2.297 J-150.668 E.10671
G1 X136.263 Y137.218 E.5003
G3 X139.687 Y137.23 I-.725 J667.696 E.10368
G1 X155.939 Y137.23 E.49203
G1 X156.156 Y137.154 E.00695
G1 X156.204 Y137.077 E.00276
G1 X155.956 Y137.058 E.00753
G1 X155.703 Y136.92 E.00872
G1 X155.682 Y136.87 E.00164
G1 X139.687 Y136.87 E.48423
G1 X139.235 Y136.652 E.0152
G1 X139.122 Y136.313 E.01083
G1 X139.122 Y119.687 E.50333
G1 X139.235 Y119.348 E.01083
G1 X139.591 Y119.136 E.01254
; LINE_WIDTH: 0.404076
G1 F9968.014
G1 X155.682 Y119.13 E.47357
G1 X155.703 Y119.081 E.00159
G1 X156.057 Y118.928 E.01134
G1 X156.201 Y118.914 E.00425
G1 X156.067 Y118.794 E.00527
G1 X155.579 Y118.771 E.01438
G1 X139.687 Y118.771 E.46769
G3 X136.323 Y118.783 I-3.744 J-571.272 E.09902
M204 S10000
G1 X119.172 Y119.737 F42000
; LINE_WIDTH: 0.423975
G1 F9447.474
M204 S6000
G1 X119.285 Y119.398 E.01111
G1 X119.638 Y119.173 E.01301
G1 X119.737 Y119.168 E.00308
G1 X136.263 Y119.168 E.51313
G1 X136.715 Y119.398 E.01576
G1 X136.828 Y119.737 E.01111
G1 X136.828 Y136.263 E.51313
G1 X136.715 Y136.602 E.01111
G1 X136.362 Y136.827 E.01301
G1 X136.263 Y136.832 E.00308
G1 X119.737 Y136.832 E.51313
G1 X119.285 Y136.602 E.01577
G1 X119.172 Y136.263 E.01111
G1 X119.172 Y119.797 E.51127
M204 S10000
G1 X118.795 Y119.737 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X118.983 Y119.172 E.01832
G1 X119.009 Y119.156 E.00093
G1 X116.835 Y119.156 E.06681
G1 X116.967 Y119.222 E.00453
G1 X117.155 Y119.787 E.01832
G1 X117.155 Y136.213 E.50469
G1 X116.967 Y136.778 E.01832
G1 X116.859 Y136.845 E.0039
G1 X119.016 Y136.845 E.06629
G1 X118.795 Y136.263 E.01913
G1 X118.795 Y119.797 E.50592
M204 S10000
G1 X118.418 Y119.737 F42000
G1 F9547.299
M204 S6000
G1 X118.486 Y119.533 E.00662
G1 X117.448 Y119.533 E.0319
G1 X117.532 Y119.787 E.00824
G1 X117.532 Y136.213 E.50469
G1 X117.447 Y136.468 E.00826
G1 X118.486 Y136.468 E.03191
G1 X118.418 Y136.263 E.00664
G1 X118.418 Y119.797 E.50592
M204 S10000
G1 X116.401 Y119.975 F42000
G1 F9547.299
M204 S6000
G1 X116.401 Y136.213 E.49891
G1 X116.363 Y136.326 E.00366
G1 X116.213 Y136.401 E.00518
G1 X100.2 Y136.401 E.492
G1 X100.138 Y136.556 E.00512
G1 X99.919 Y136.605 E.00691
G1 X99.406 Y136.605 E.01576
G1 X99.419 Y137.126 E.01602
G1 X99.547 Y137.369 E.00845
G1 X99.748 Y137.523 E.0078
G1 X100.042 Y137.599 E.0093
G1 X155.957 Y137.599 E1.71807
G1 X156.181 Y137.552 E.00703
G1 X156.437 Y137.395 E.00924
G2 X156.596 Y136.984 I-.416 J-.398 E.01388
G1 X156.596 Y136.705 E.0086
G1 X156.088 Y136.705 E.01563
G1 X155.958 Y136.653 E.0043
G1 X155.884 Y136.501 E.00517
G1 X139.687 Y136.501 E.49767
G1 X139.537 Y136.426 E.00518
G1 X139.499 Y136.313 E.00366
G1 X139.499 Y119.687 E.51084
G1 X139.537 Y119.574 E.00366
G1 X139.687 Y119.499 E.00518
G1 X155.899 Y119.499 E.49813
G1 X155.957 Y119.347 E.00499
G1 X156.123 Y119.295 E.00532
G1 X156.596 Y119.295 E.01455
G1 X156.561 Y118.834 E.01422
G1 X156.42 Y118.581 E.00889
G1 X156.144 Y118.434 E.0096
G1 X155.579 Y118.403 E.01739
G1 X100.043 Y118.401 E1.70643
G2 X99.647 Y118.524 I.091 J.994 E.01283
G1 X99.477 Y118.72 E.00797
G2 X99.404 Y119.395 I1.44 J.499 E.02105
G1 X100.014 Y119.395 E.01877
G1 X100.139 Y119.444 E.00413
G1 X100.216 Y119.599 E.00531
G1 X116.213 Y119.599 E.49151
G1 X116.363 Y119.674 E.00518
G1 X116.394 Y119.916 E.00749
M204 S10000
G1 X117.975 Y136.025 F42000
; LINE_WIDTH: 0.55104
M73 P85 R1
G1 F7084.941
M204 S6000
G1 X117.975 Y120.035 E.66205
; WIPE_START
G1 X117.975 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y121.572 Z1.4 F42000
G1 X156.549 Y119.687 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51517
G1 F7623.081
M204 S6000
G1 X156.549 Y136.313 E.63978
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7623.081
G1 X156.549 Y134.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/7
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-.056 J-1.216 P1  F42000
G1 X136.059 Y135.26 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X136.059 Y136.059 E.02651
G1 X119.941 Y136.059 E.53467
G1 X119.941 Y119.941 E.53467
G1 X136.059 Y119.941 E.53467
G1 X136.059 Y135.2 E.50617
M204 S10000
G1 X135.652 Y135.26 F42000
G1 F5400
M204 S6000
G1 X135.652 Y135.652 E.01301
G1 X120.348 Y135.652 E.50767
G1 X120.348 Y120.348 E.50767
G1 X135.652 Y120.348 E.50767
G1 X135.652 Y135.2 E.49267
M204 S250
G1 X135.26 Y135.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y130.289 Z1.6 F42000
G1 X115.21 Y119.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.009 Y119.991 E.02651
G1 X116.009 Y136.009 E.53136
G1 X99.991 Y136.009 E.53136
G1 X99.991 Y119.991 E.53136
G1 X115.15 Y119.991 E.50286
M204 S10000
G1 X115.602 Y120.79 F42000
G1 F5400
M204 S6000
G1 X115.602 Y135.602 E.49134
G1 X100.398 Y135.602 E.50435
G1 X100.398 Y120.398 E.50435
G1 X115.602 Y120.398 E.50435
G1 X115.602 Y120.73 E.01102
M204 S250
G1 X115.21 Y120.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.457 Y125.022 Z1.6 F42000
G1 X156.109 Y135.31 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X156.109 Y136.109 E.02651
G1 X139.891 Y136.109 E.53799
G1 X139.891 Y119.891 E.53799
G1 X156.109 Y119.891 E.53799
G1 X156.109 Y135.25 E.50949
M204 S10000
G1 X155.702 Y135.31 F42000
G1 F5400
M204 S6000
G1 X155.702 Y135.702 E.01301
G1 X140.298 Y135.702 E.51098
G1 X140.298 Y120.298 E.51098
G1 X155.702 Y120.298 E.51098
G1 X155.702 Y135.25 E.49599
M204 S250
G1 X155.31 Y135.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
M73 P86 R1
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.01 Y133.03 Z1.6 F42000
G1 X99.059 Y118.702 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X100.025 Y118.009 I.957 J.314 E.04216
G1 X156.04 Y118.011 E1.85812
G3 X156.988 Y118.951 I-.054 J1.002 E.04848
G1 X156.988 Y137.051 E.60038
G3 X155.975 Y137.991 I-1.004 J-.066 E.05055
G1 X100.023 Y137.991 E1.85603
G3 X99.009 Y136.975 I-.013 J-1.001 E.05308
G1 X99.012 Y118.944 E.59811
G3 X99.042 Y118.759 I1.005 J.072 E.00624
M204 S10000
G1 X98.669 Y118.588 F42000
G1 F5400
M204 S6000
G3 X100.015 Y117.602 I1.351 J.431 E.05919
G1 X156.053 Y117.604 E1.85888
G3 X157.396 Y118.931 I-.071 J1.415 E.06856
G1 X157.396 Y137.07 E.60168
G3 X155.985 Y138.398 I-1.415 J-.089 E.07076
G1 X100.014 Y138.398 E1.85667
G3 X98.602 Y136.985 I-.001 J-1.41 E.07362
G1 X98.604 Y118.927 E.59901
G3 X98.652 Y118.646 I1.415 J.093 E.00948
M204 S250
G1 X98.293 Y118.465 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X98.389 Y118.235 E.00766
G3 X100.005 Y117.21 I1.633 J.788 E.06195
G1 X156.065 Y117.212 E1.72256
G3 X157.788 Y118.912 I-.088 J1.812 E.08142
G1 X157.788 Y137.088 E.5585
G3 X155.995 Y138.79 I-1.81 J-.112 E.08357
G1 X100.005 Y138.79 E1.7204
G3 X98.21 Y136.995 I.01 J-1.805 E.08652
G1 X98.212 Y118.911 E.55567
G3 X98.279 Y118.523 I1.81 J.113 E.0121
; WIPE_START
M204 S6000
G1 X98.389 Y118.235 E-.11718
G1 X98.564 Y117.932 E-.13301
G1 X98.735 Y117.734 E-.09924
G1 X99.003 Y117.513 E-.13231
G1 X99.317 Y117.345 E-.1353
G1 X99.673 Y117.241 E-.14068
G1 X99.679 Y117.24 E-.00227
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


M73 P87 R1
G1 X99.501 Y119.787 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.616382
G1 F6277.666
M204 S6000
G1 X99.5 Y136.213 E.76755
M204 S10000
G1 X137.205 Y136.263 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X137.017 Y136.828 E.01832
G1 X136.99 Y136.845 E.00096
G1 X138.922 Y136.845 E.05936
G1 X138.745 Y136.313 E.01723
G1 X138.745 Y119.687 E.51084
G1 X138.922 Y119.157 E.01719
G1 X136.986 Y119.156 E.05946
G1 X137.205 Y119.737 E.01907
G1 X137.205 Y136.203 E.50592
M204 S10000
G1 X137.582 Y136.263 F42000
G1 F9547.299
M204 S6000
G1 X137.514 Y136.468 E.00664
G1 X138.419 Y136.468 E.02781
G1 X138.368 Y136.313 E.00502
G1 X138.368 Y119.687 E.51084
G1 X138.419 Y119.534 E.00498
G1 X137.514 Y119.534 E.02779
G1 X137.582 Y119.737 E.0066
G1 X137.582 Y136.203 E.50592
M204 S10000
G1 X137.975 Y119.926 F42000
; LINE_WIDTH: 0.45102
G1 F8821.367
M204 S6000
G1 X137.975 Y136.015 E.53503
M204 S10000
G1 X136.451 Y119.926 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X136.451 Y136.263 E.50196
M73 P88 R1
G1 X136.413 Y136.376 E.00366
G1 X136.263 Y136.451 E.00518
G1 X119.737 Y136.451 E.50776
G1 X119.586 Y136.376 E.00518
G1 X119.549 Y136.263 E.00366
G1 X119.549 Y119.737 E.50776
G1 X119.586 Y119.624 E.00366
G1 X119.737 Y119.549 E.00518
G1 X136.263 Y119.549 E.50776
G1 X136.413 Y119.624 E.00518
G1 X136.444 Y119.867 E.00751
M204 S10000
G1 X136.263 Y118.783 F42000
; LINE_WIDTH: 0.438526
G1 F9099.961
M204 S6000
G1 X119.737 Y118.783 E.53273
G2 X116.213 Y118.795 I-1.224 J152.753 E.11363
G1 X100.541 Y118.795 E.5052
; LINE_WIDTH: 0.435925
G1 F9160.188
G1 X100.364 Y118.779 E.0057
; LINE_WIDTH: 0.401435
G1 F10041.421
G1 X100.187 Y118.763 E.0052
; LINE_WIDTH: 0.354214
G1 F11564.629
G1 X100.01 Y118.747 E.00451
G1 X99.835 Y118.83 E.00489
G1 X99.746 Y119.037 E.00574
G1 X100.105 Y119.058 E.00914
; LINE_WIDTH: 0.380788
G1 F10655.064
G1 X100.254 Y119.105 E.00431
; LINE_WIDTH: 0.435848
G1 F9161.997
G1 X100.404 Y119.152 E.00501
G1 X100.427 Y119.205 E.00186
G1 X116.213 Y119.205 E.50543
G1 X116.665 Y119.448 E.01644
G1 X116.778 Y119.787 E.01145
G1 X116.778 Y136.213 E.52592
G1 X116.665 Y136.552 E.01145
; LINE_WIDTH: 0.452851
G1 F8781.967
G1 X116.314 Y136.789 E.01416
G1 X116.213 Y136.795 E.00338
G1 X100.426 Y136.795 E.52734
G1 X100.402 Y136.848 E.00194
; LINE_WIDTH: 0.4351
G1 F9179.458
G1 X100.261 Y136.88 E.00465
; LINE_WIDTH: 0.39894
G1 F10111.791
G1 X100.119 Y136.912 E.00422
; LINE_WIDTH: 0.348223
G1 F11791.567
G3 X99.753 Y136.944 I-.254 J-.794 E.00922
G1 X99.781 Y137.104 E.00404
G1 X99.944 Y137.243 E.00535
; LINE_WIDTH: 0.36278
G1 F11254.925
G1 X100.143 Y137.23 E.00518
; LINE_WIDTH: 0.39894
G1 F10111.791
G1 X100.342 Y137.218 E.00577
; LINE_WIDTH: 0.421185
G1 F9517.158
G1 X100.54 Y137.205 E.00613
G1 X116.213 Y137.205 E.48309
G2 X119.737 Y137.218 I2.297 J-150.668 E.10865
G1 X136.263 Y137.218 E.50937
G3 X139.687 Y137.23 I-.725 J667.696 E.10556
G1 X155.941 Y137.23 E.50101
G1 X156.139 Y137.161 E.00644
G1 X156.197 Y137.073 E.00324
G1 X155.958 Y137.058 E.00737
G1 X155.703 Y136.92 E.00893
G1 X155.682 Y136.87 E.00167
G1 X139.687 Y136.87 E.49301
G1 X139.235 Y136.652 E.01548
G1 X139.122 Y136.313 E.01103
G1 X139.122 Y119.687 E.51246
G1 X139.235 Y119.348 E.01103
G1 X139.591 Y119.136 E.01276
; LINE_WIDTH: 0.403945
G1 F9971.625
G1 X155.682 Y119.131 E.47339
G1 X155.703 Y119.081 E.00159
G1 X156.055 Y118.928 E.01128
G1 X156.203 Y118.925 E.00436
G1 X156.066 Y118.793 E.0056
G1 X155.579 Y118.771 E.01432
G1 X139.687 Y118.771 E.46753
G3 X136.323 Y118.783 I-3.691 J-557.73 E.09899
M204 S10000
G1 X119.172 Y119.737 F42000
; LINE_WIDTH: 0.423954
G1 F9447.991
M204 S6000
G1 X119.285 Y119.398 E.01111
G1 X119.638 Y119.173 E.013
G1 X119.737 Y119.168 E.00308
G1 X136.263 Y119.168 E.5131
G1 X136.715 Y119.398 E.01576
G1 X136.828 Y119.737 E.01111
G1 X136.828 Y136.263 E.5131
G1 X136.715 Y136.602 E.01111
G1 X136.362 Y136.827 E.01301
G1 X136.263 Y136.832 E.00308
G1 X119.737 Y136.832 E.5131
G1 X119.285 Y136.602 E.01576
G1 X119.172 Y136.263 E.01111
G1 X119.172 Y119.797 E.51124
M204 S10000
G1 X118.795 Y119.737 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X118.983 Y119.172 E.01832
G1 X119.009 Y119.156 E.00093
G1 X116.835 Y119.156 E.0668
G1 X116.967 Y119.222 E.00453
G1 X117.155 Y119.787 E.01832
G1 X117.155 Y136.213 E.50469
G1 X116.967 Y136.778 E.01832
G1 X116.859 Y136.845 E.0039
G1 X119.016 Y136.845 E.06629
G1 X118.795 Y136.263 E.01913
G1 X118.795 Y119.797 E.50592
M204 S10000
G1 X118.418 Y119.737 F42000
G1 F9547.299
M204 S6000
G1 X118.486 Y119.533 E.00662
G1 X117.448 Y119.533 E.0319
G1 X117.532 Y119.787 E.00824
G1 X117.532 Y136.213 E.50469
G1 X117.447 Y136.468 E.00826
G1 X118.486 Y136.468 E.03191
G1 X118.418 Y136.263 E.00664
G1 X118.418 Y119.797 E.50592
M204 S10000
G1 X116.401 Y119.976 F42000
G1 F9547.299
M204 S6000
G1 X116.401 Y136.213 E.49891
G1 X116.363 Y136.326 E.00366
G1 X116.213 Y136.401 E.00518
G1 X100.2 Y136.401 E.492
G1 X100.138 Y136.556 E.00512
G1 X99.977 Y136.605 E.00519
G1 X99.405 Y136.605 E.01755
G1 X99.417 Y137.116 E.01571
G1 X99.53 Y137.333 E.00752
G1 X99.764 Y137.539 E.00959
G1 X100.076 Y137.599 E.00976
G1 X155.958 Y137.599 E1.71704
G2 X156.356 Y137.474 I-.084 J-.962 E.01293
G1 X156.523 Y137.28 E.00785
G2 X156.596 Y136.705 I-1.171 J-.442 E.01799
G1 X156.088 Y136.705 E.01563
G1 X155.958 Y136.653 E.0043
G1 X155.884 Y136.501 E.00517
G1 X139.687 Y136.501 E.49767
G1 X139.537 Y136.426 E.00518
G1 X139.499 Y136.313 E.00366
G1 X139.499 Y119.687 E.51084
G1 X139.537 Y119.574 E.00366
G1 X139.687 Y119.499 E.00518
G1 X155.899 Y119.499 E.49813
G1 X155.957 Y119.347 E.00499
G1 X156.12 Y119.295 E.00523
G1 X156.596 Y119.295 E.01465
G1 X156.565 Y118.845 E.01388
G1 X156.419 Y118.581 E.00927
G1 X156.145 Y118.433 E.00956
G1 X155.579 Y118.403 E.01741
G1 X100.042 Y118.401 E1.70646
G2 X99.647 Y118.525 I.106 J1.031 E.01281
G1 X99.477 Y118.72 E.00796
G2 X99.404 Y119.395 I1.42 J.496 E.02104
G1 X100.016 Y119.395 E.01881
G1 X100.139 Y119.444 E.00408
G1 X100.216 Y119.599 E.00531
G1 X116.213 Y119.599 E.49151
G1 X116.363 Y119.674 E.00518
G1 X116.394 Y119.916 E.00749
M204 S10000
G1 X117.975 Y136.025 F42000
; LINE_WIDTH: 0.55104
G1 F7084.941
M204 S6000
G1 X117.975 Y120.036 E.66205
; WIPE_START
G1 X117.975 Y122.036 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y121.572 Z1.6 F42000
G1 X156.549 Y119.687 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51517
G1 F7623.081
M204 S6000
G1 X156.549 Y136.313 E.63978
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7623.081
G1 X156.549 Y134.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/7
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S175.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I-.054 J-1.216 P1  F42000
G1 X135.26 Y135.26 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X120.74 Y135.26 E.44616
G1 X120.74 Y120.74 E.44616
G1 X135.26 Y120.74 E.44616
G1 X135.26 Y135.2 E.44432
; WIPE_START
M204 S6000
G1 X133.26 Y135.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P89 R1
G1 X127.297 Y130.445 Z1.8 F42000
G1 X115.21 Y120.79 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X115.21 Y135.21 E.44309
G1 X100.79 Y135.21 E.44309
G1 X100.79 Y120.79 E.44309
G1 X115.15 Y120.79 E.44124
; WIPE_START
M204 S6000
G1 X115.158 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.445 Y125.062 Z1.8 F42000
G1 X155.31 Y135.31 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X140.69 Y135.31 E.44923
G1 X140.69 Y120.69 E.44923
G1 X155.31 Y120.69 E.44923
G1 X155.31 Y135.25 E.44739
; WIPE_START
M204 S6000
G1 X153.31 Y135.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.011 Y133.026 Z1.8 F42000
G1 X98.31 Y118.435 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X98.351 Y118.32 E.00377
G3 X100.005 Y117.21 I1.671 J.703 E.06482
G1 X156.078 Y117.212 E1.72295
G3 X157.788 Y118.912 I-.101 J1.812 E.08103
G1 X157.788 Y137.088 E.55849
G3 X155.995 Y138.79 I-1.809 J-.11 E.0836
G1 X100.003 Y138.79 E1.72047
G3 X98.21 Y136.995 I.011 J-1.804 E.08647
G1 X98.212 Y118.91 E.55568
G3 X98.247 Y118.651 I1.809 J.112 E.00803
G1 X98.293 Y118.493 E.00507
; WIPE_START
M204 S6000
G1 X98.351 Y118.32 E-.06938
G1 X98.513 Y118.004 E-.13507
G1 X98.735 Y117.734 E-.13247
G1 X99.004 Y117.513 E-.13232
G1 X99.159 Y117.42 E-.06866
G1 X99.397 Y117.315 E-.09903
G1 X99.66 Y117.243 E-.10376
G1 X99.711 Y117.238 E-.01932
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


G1 X156.083 Y117.422 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X157.579 Y118.918 E.06501
G1 X157.58 Y119.452
G1 X155.547 Y117.419 E.08834
G1 X155.014 Y117.419
G1 X157.58 Y119.986 E.11151
G1 X157.58 Y120.519
G1 X154.481 Y117.419 E.13469
G1 X153.947 Y117.419
M73 P90 R1
G1 X157.58 Y121.052 E.15786
G1 X157.58 Y121.585
G1 X153.414 Y117.419 E.18103
G1 X152.881 Y117.419
G1 X157.58 Y122.119 E.20421
G1 X157.58 Y122.652
G1 X155.517 Y120.589 E.08964
G1 X155.517 Y121.122
G1 X157.58 Y123.185 E.08964
G1 X157.58 Y123.718
G1 X155.517 Y121.656 E.08964
G1 X155.517 Y122.189
G1 X157.58 Y124.252 E.08964
G1 X157.58 Y124.785
G1 X155.517 Y122.722 E.08964
G1 X155.517 Y123.255
G1 X157.58 Y125.318 E.08964
G1 X157.58 Y125.851
G1 X155.517 Y123.789 E.08964
G1 X155.517 Y124.322
G1 X157.58 Y126.385 E.08964
G1 X157.58 Y126.918
G1 X155.517 Y124.855 E.08964
G1 X155.517 Y125.388
G1 X157.58 Y127.451 E.08964
G1 X157.58 Y127.984
G1 X155.517 Y125.922 E.08964
G1 X155.517 Y126.455
G1 X157.58 Y128.518 E.08964
G1 X157.58 Y129.051
G1 X155.517 Y126.988 E.08964
G1 X155.517 Y127.521
G1 X157.58 Y129.584 E.08964
G1 X157.58 Y130.118
G1 X155.517 Y128.055 E.08964
G1 X155.517 Y128.588
G1 X157.58 Y130.651 E.08964
G1 X157.58 Y131.184
G1 X155.517 Y129.121 E.08964
G1 X155.517 Y129.654
G1 X157.58 Y131.717 E.08964
G1 X157.58 Y132.251
G1 X155.517 Y130.188 E.08964
G1 X155.517 Y130.721
G1 X157.58 Y132.784 E.08964
G1 X157.58 Y133.317
G1 X155.517 Y131.254 E.08964
G1 X155.517 Y131.787
G1 X157.58 Y133.85 E.08964
G1 X157.58 Y134.384
G1 X155.517 Y132.321 E.08964
G1 X155.517 Y132.854
G1 X157.58 Y134.917 E.08964
G1 X157.58 Y135.45
G1 X155.517 Y133.387 E.08964
G1 X155.517 Y133.921
G1 X157.58 Y135.983 E.08964
G1 X157.58 Y136.517
G1 X155.517 Y134.454 E.08964
G1 X155.517 Y134.987
G1 X157.58 Y137.05 E.08964
G1 X157.498 Y137.501
G1 X155.514 Y135.517 E.0862
G1 X154.981 Y135.517
G1 X157.323 Y137.859 E.10177
G1 X157.081 Y138.151
G1 X154.448 Y135.517 E.11443
G1 X153.915 Y135.517
G1 X156.774 Y138.377 E.12426
M73 P91 R1
G1 X156.392 Y138.528
G1 X153.381 Y135.517 E.13082
G1 X152.848 Y135.517
G1 X155.913 Y138.583 E.1332
G1 X155.38 Y138.583
G1 X152.315 Y135.517 E.1332
G1 X151.782 Y135.517
G1 X154.847 Y138.583 E.1332
G1 X154.314 Y138.583
G1 X151.248 Y135.517 E.1332
G1 X150.715 Y135.517
G1 X153.78 Y138.583 E.1332
G1 X153.247 Y138.583
G1 X150.182 Y135.517 E.1332
G1 X149.649 Y135.517
G1 X152.714 Y138.583 E.1332
G1 X152.181 Y138.583
G1 X149.115 Y135.517 E.1332
G1 X148.582 Y135.517
M73 P91 R0
G1 X151.647 Y138.583 E.1332
G1 X151.114 Y138.583
G1 X148.049 Y135.517 E.1332
G1 X147.516 Y135.517
G1 X150.581 Y138.583 E.1332
G1 X150.048 Y138.583
G1 X146.982 Y135.517 E.1332
G1 X146.449 Y135.517
G1 X149.514 Y138.583 E.1332
G1 X148.981 Y138.583
G1 X145.916 Y135.517 E.1332
G1 X145.383 Y135.517
G1 X148.448 Y138.583 E.1332
G1 X147.915 Y138.583
G1 X144.849 Y135.517 E.1332
G1 X144.316 Y135.517
G1 X147.381 Y138.583 E.1332
G1 X146.848 Y138.583
G1 X143.783 Y135.517 E.1332
G1 X143.25 Y135.517
G1 X146.315 Y138.583 E.1332
G1 X145.782 Y138.583
G1 X142.716 Y135.517 E.1332
G1 X142.183 Y135.517
G1 X145.248 Y138.583 E.1332
G1 X144.715 Y138.583
G1 X141.65 Y135.517 E.1332
G1 X141.117 Y135.517
G1 X144.182 Y138.583 E.1332
G1 X143.649 Y138.583
G1 X140.583 Y135.517 E.1332
; WIPE_START
M204 S6000
G1 X141.997 Y136.932 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.821 Y131.016 Z1.8 F42000
G1 X155.411 Y120.483 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X152.348 Y117.419 E.13312
G1 X151.814 Y117.419
G1 X154.878 Y120.483 E.13312
G1 X154.344 Y120.483
G1 X151.281 Y117.419 E.13312
G1 X150.748 Y117.419
G1 X153.811 Y120.483 E.13312
G1 X153.278 Y120.483
G1 X150.215 Y117.419 E.13312
G1 X149.681 Y117.419
G1 X152.745 Y120.483 E.13312
G1 X152.211 Y120.483
G1 X149.148 Y117.419 E.13312
G1 X148.615 Y117.419
G1 X151.678 Y120.483 E.13312
G1 X151.145 Y120.483
G1 X148.081 Y117.419 E.13312
G1 X147.548 Y117.419
G1 X150.612 Y120.483 E.13312
G1 X150.078 Y120.483
G1 X147.015 Y117.419 E.13312
G1 X146.482 Y117.419
G1 X149.545 Y120.483 E.13312
G1 X149.012 Y120.483
G1 X145.948 Y117.419 E.13313
G1 X145.415 Y117.419
G1 X148.479 Y120.483 E.13313
G1 X147.945 Y120.483
G1 X144.882 Y117.419 E.13313
G1 X144.348 Y117.419
G1 X147.412 Y120.483 E.13313
G1 X146.879 Y120.483
G1 X143.815 Y117.419 E.13313
G1 X143.282 Y117.419
G1 X146.346 Y120.483 E.13313
G1 X145.812 Y120.483
G1 X142.749 Y117.419 E.13313
G1 X142.215 Y117.419
G1 X145.279 Y120.483 E.13313
G1 X144.746 Y120.483
G1 X141.682 Y117.419 E.13313
G1 X141.149 Y117.419
G1 X144.213 Y120.483 E.13313
G1 X143.679 Y120.483
G1 X140.616 Y117.419 E.13313
G1 X140.082 Y117.419
G1 X143.146 Y120.483 E.13313
G1 X142.613 Y120.483
G1 X139.549 Y117.419 E.13314
G1 X139.016 Y117.419
G1 X142.079 Y120.483 E.13314
G1 X141.546 Y120.483
G1 X138.482 Y117.419 E.13314
G1 X137.949 Y117.419
G1 X141.013 Y120.483 E.13314
G1 X140.483 Y120.486
G1 X137.416 Y117.419 E.13327
G1 X136.883 Y117.419
G1 X140.483 Y121.019 E.15644
G1 X140.483 Y121.552
G1 X136.349 Y117.419 E.17961
M73 P92 R0
G1 X135.816 Y117.419
G1 X140.483 Y122.085 E.20279
G1 X140.483 Y122.619
G1 X135.283 Y117.419 E.22596
G1 X134.749 Y117.419
G1 X140.483 Y123.152 E.24913
G1 X140.483 Y123.685
G1 X134.216 Y117.419 E.27231
G1 X133.683 Y117.419
G1 X140.483 Y124.218 E.29548
G1 X140.483 Y124.752
G1 X133.15 Y117.419 E.31865
G1 X132.616 Y117.419
G1 X140.483 Y125.285 E.34183
G1 X140.483 Y125.818
G1 X135.467 Y120.803 E.21794
G1 X135.467 Y121.336
G1 X140.483 Y126.351 E.21794
G1 X140.483 Y126.885
G1 X135.467 Y121.869 E.21794
G1 X135.467 Y122.403
G1 X140.483 Y127.418 E.21794
G1 X140.483 Y127.951
G1 X135.467 Y122.936 E.21794
G1 X135.467 Y123.469
G1 X140.483 Y128.484 E.21794
G1 X140.483 Y129.018
G1 X135.467 Y124.002 E.21794
G1 X135.467 Y124.536
G1 X140.483 Y129.551 E.21794
G1 X140.483 Y130.084
G1 X135.467 Y125.069 E.21794
G1 X135.467 Y125.602
G1 X140.483 Y130.617 E.21794
G1 X140.483 Y131.151
G1 X135.467 Y126.135 E.21794
G1 X135.467 Y126.669
G1 X140.483 Y131.684 E.21794
G1 X140.483 Y132.217
G1 X135.467 Y127.202 E.21794
G1 X135.467 Y127.735
G1 X140.483 Y132.75 E.21794
G1 X140.483 Y133.284
G1 X135.467 Y128.268 E.21794
G1 X135.467 Y128.802
G1 X140.483 Y133.817 E.21794
G1 X140.483 Y134.35
G1 X135.467 Y129.335 E.21794
G1 X135.467 Y129.868
G1 X140.483 Y134.883 E.21794
G1 X140.483 Y135.417
G1 X135.467 Y130.401 E.21794
G1 X135.467 Y130.935
G1 X143.115 Y138.583 E.33234
G1 X142.582 Y138.583
G1 X135.467 Y131.468 E.30916
G1 X135.467 Y132.001
G1 X142.049 Y138.583 E.28599
G1 X141.515 Y138.583
G1 X135.467 Y132.535 E.26282
G1 X135.467 Y133.068
G1 X140.982 Y138.583 E.23965
G1 X140.449 Y138.583
G1 X135.467 Y133.601 E.21647
G1 X135.467 Y134.134
G1 X139.916 Y138.583 E.1933
G1 X139.382 Y138.583
G1 X135.467 Y134.668 E.17013
G1 X135.467 Y135.201
G1 X138.849 Y138.583 E.14696
G1 X138.316 Y138.583
G1 X135.201 Y135.467 E.13537
G1 X134.667 Y135.467
G1 X137.783 Y138.583 E.13537
G1 X137.249 Y138.583
G1 X134.134 Y135.467 E.13537
G1 X133.601 Y135.467
G1 X136.716 Y138.583 E.13537
G1 X136.183 Y138.583
G1 X133.068 Y135.467 E.13537
G1 X132.534 Y135.467
G1 X135.65 Y138.583 E.13537
M73 P93 R0
G1 X135.116 Y138.583
G1 X132.001 Y135.467 E.13537
G1 X131.468 Y135.467
G1 X134.583 Y138.583 E.13537
G1 X134.05 Y138.583
G1 X130.935 Y135.467 E.13537
G1 X130.401 Y135.467
G1 X133.517 Y138.583 E.13537
G1 X132.983 Y138.583
G1 X129.868 Y135.467 E.13537
G1 X129.335 Y135.467
G1 X132.45 Y138.583 E.13537
G1 X131.917 Y138.583
G1 X128.802 Y135.467 E.13537
G1 X128.268 Y135.467
G1 X131.384 Y138.583 E.13537
G1 X130.85 Y138.583
G1 X127.735 Y135.467 E.13537
G1 X127.202 Y135.467
G1 X130.317 Y138.583 E.13537
G1 X129.784 Y138.583
G1 X126.669 Y135.467 E.13537
G1 X126.135 Y135.467
G1 X129.251 Y138.583 E.13537
G1 X128.717 Y138.583
G1 X125.602 Y135.467 E.13537
G1 X125.069 Y135.467
G1 X128.184 Y138.583 E.13537
G1 X127.651 Y138.583
G1 X124.536 Y135.467 E.13537
G1 X124.002 Y135.467
G1 X127.118 Y138.583 E.13537
G1 X126.584 Y138.583
G1 X123.469 Y135.467 E.13537
G1 X122.936 Y135.467
G1 X126.051 Y138.583 E.13537
G1 X125.518 Y138.583
G1 X122.403 Y135.467 E.13537
G1 X121.869 Y135.467
G1 X124.984 Y138.583 E.13537
G1 X124.451 Y138.583
G1 X121.336 Y135.467 E.13537
G1 X120.803 Y135.467
G1 X123.918 Y138.583 E.13537
; WIPE_START
M204 S6000
G1 X122.504 Y137.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.134 Y131.101 Z1.8 F42000
G1 X135.197 Y120.533 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X132.083 Y117.419 E.13532
G1 X131.55 Y117.419
G1 X134.664 Y120.533 E.13532
G1 X134.131 Y120.533
G1 X131.017 Y117.419 E.13532
G1 X130.483 Y117.419
G1 X133.597 Y120.533 E.13532
G1 X133.064 Y120.533
G1 X129.95 Y117.418 E.13532
G1 X129.417 Y117.418
G1 X132.531 Y120.533 E.13532
G1 X131.998 Y120.533
G1 X128.883 Y117.418 E.13533
G1 X128.35 Y117.418
G1 X131.464 Y120.533 E.13533
G1 X130.931 Y120.533
G1 X127.817 Y117.418 E.13533
G1 X127.284 Y117.418
G1 X130.398 Y120.533 E.13533
G1 X129.865 Y120.533
G1 X126.75 Y117.418 E.13533
G1 X126.217 Y117.418
G1 X129.331 Y120.533 E.13533
G1 X128.798 Y120.533
G1 X125.684 Y117.418 E.13533
G1 X125.15 Y117.418
G1 X128.265 Y120.533 E.13533
G1 X127.732 Y120.533
G1 X124.617 Y117.418 E.13533
G1 X124.084 Y117.418
G1 X127.198 Y120.533 E.13533
G1 X126.665 Y120.533
G1 X123.551 Y117.418 E.13533
G1 X123.017 Y117.418
G1 X126.132 Y120.533 E.13534
G1 X125.598 Y120.533
G1 X122.484 Y117.418 E.13534
G1 X121.951 Y117.418
G1 X125.065 Y120.533 E.13534
G1 X124.532 Y120.533
G1 X121.418 Y117.418 E.13534
G1 X120.884 Y117.418
G1 X123.999 Y120.533 E.13534
G1 X123.465 Y120.533
G1 X120.351 Y117.418 E.13534
M73 P94 R0
G1 X119.818 Y117.418
G1 X122.932 Y120.533 E.13534
G1 X122.399 Y120.533
G1 X119.284 Y117.418 E.13534
G1 X118.751 Y117.418
G1 X121.866 Y120.533 E.13534
G1 X121.332 Y120.533
G1 X118.218 Y117.418 E.13534
G1 X117.685 Y117.418
G1 X120.799 Y120.533 E.13534
G1 X120.533 Y120.799
G1 X117.151 Y117.418 E.14693
G1 X116.618 Y117.418
G1 X120.533 Y121.333 E.17011
G1 X120.533 Y121.866
G1 X116.085 Y117.418 E.19328
G1 X115.551 Y117.418
G1 X120.533 Y122.399 E.21645
G1 X120.533 Y122.932
G1 X115.018 Y117.418 E.23963
G1 X114.485 Y117.418
G1 X120.533 Y123.466 E.2628
G1 X120.533 Y123.999
G1 X113.952 Y117.418 E.28597
G1 X113.418 Y117.418
G1 X120.533 Y124.532 E.30915
G1 X120.533 Y125.065
G1 X112.885 Y117.418 E.33232
G1 X112.352 Y117.418
G1 X120.533 Y125.599 E.3555
G1 X120.533 Y126.132
G1 X115.417 Y121.017 E.22228
G1 X115.417 Y121.55
G1 X120.533 Y126.665 E.22228
G1 X120.533 Y127.198
G1 X115.417 Y122.083 E.22228
G1 X115.417 Y122.616
G1 X120.533 Y127.732 E.22228
G1 X120.533 Y128.265
G1 X115.417 Y123.15 E.22228
G1 X115.417 Y123.683
G1 X120.533 Y128.798 E.22228
G1 X120.533 Y129.331
G1 X115.417 Y124.216 E.22228
G1 X115.417 Y124.749
G1 X120.533 Y129.865 E.22228
G1 X120.533 Y130.398
G1 X115.417 Y125.283 E.22228
G1 X115.417 Y125.816
G1 X120.533 Y130.931 E.22228
G1 X120.533 Y131.464
G1 X115.417 Y126.349 E.22228
G1 X115.417 Y126.882
G1 X120.533 Y131.998 E.22228
G1 X120.533 Y132.531
G1 X115.417 Y127.416 E.22228
G1 X115.417 Y127.949
G1 X120.533 Y133.064 E.22228
G1 X120.533 Y133.597
G1 X115.417 Y128.482 E.22228
G1 X115.417 Y129.015
G1 X120.533 Y134.131 E.22228
G1 X120.533 Y134.664
G1 X115.417 Y129.549 E.22228
G1 X115.417 Y130.082
G1 X120.533 Y135.197 E.22228
; WIPE_START
M204 S6000
G1 X119.118 Y133.783 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.385 Y138.583 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X115.417 Y130.615 E.34622
G1 X115.417 Y131.149
G1 X122.851 Y138.583 E.32305
G1 X122.318 Y138.583
G1 X115.417 Y131.682 E.29987
G1 X115.417 Y132.215
G1 X121.785 Y138.583 E.2767
G1 X121.252 Y138.583
G1 X115.417 Y132.748 E.25353
G1 X115.417 Y133.282
G1 X120.718 Y138.583 E.23036
G1 X120.185 Y138.583
G1 X115.417 Y133.815 E.20718
G1 X115.417 Y134.348
M73 P95 R0
G1 X119.652 Y138.583 E.18401
G1 X119.119 Y138.583
G1 X115.417 Y134.881 E.16084
G1 X115.417 Y135.415
G1 X118.585 Y138.583 E.13767
G1 X118.052 Y138.583
G1 X114.887 Y135.417 E.13755
G1 X114.354 Y135.417
G1 X117.519 Y138.583 E.13755
G1 X116.986 Y138.583
G1 X113.82 Y135.417 E.13755
G1 X113.287 Y135.417
G1 X116.452 Y138.583 E.13755
G1 X115.919 Y138.583
G1 X112.754 Y135.417 E.13755
G1 X112.221 Y135.417
G1 X115.386 Y138.583 E.13755
G1 X114.853 Y138.583
G1 X111.687 Y135.417 E.13755
G1 X111.154 Y135.417
G1 X114.319 Y138.583 E.13755
G1 X113.786 Y138.583
G1 X110.621 Y135.417 E.13755
G1 X110.088 Y135.417
G1 X113.253 Y138.583 E.13755
G1 X112.72 Y138.583
G1 X109.554 Y135.417 E.13755
G1 X109.021 Y135.417
G1 X112.186 Y138.583 E.13755
G1 X111.653 Y138.583
G1 X108.488 Y135.417 E.13755
G1 X107.955 Y135.417
G1 X111.12 Y138.583 E.13755
G1 X110.587 Y138.583
G1 X107.421 Y135.417 E.13755
G1 X106.888 Y135.417
G1 X110.053 Y138.583 E.13755
G1 X109.52 Y138.583
G1 X106.355 Y135.417 E.13755
G1 X105.822 Y135.417
G1 X108.987 Y138.583 E.13755
G1 X108.454 Y138.583
G1 X105.288 Y135.417 E.13755
G1 X104.755 Y135.417
G1 X107.92 Y138.583 E.13755
G1 X107.387 Y138.583
G1 X104.222 Y135.417 E.13755
G1 X103.688 Y135.417
G1 X106.854 Y138.583 E.13755
G1 X106.32 Y138.583
G1 X103.155 Y135.417 E.13755
G1 X102.622 Y135.417
G1 X105.787 Y138.583 E.13755
G1 X105.254 Y138.583
G1 X102.089 Y135.417 E.13755
G1 X101.555 Y135.417
G1 X104.721 Y138.583 E.13755
G1 X104.187 Y138.583
G1 X101.022 Y135.417 E.13755
; WIPE_START
M204 S6000
G1 X102.436 Y136.832 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.101 Y130.79 Z1.8 F42000
G1 X114.983 Y120.583 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X111.819 Y117.418 E.13753
G1 X111.285 Y117.418
G1 X114.45 Y120.583 E.13753
G1 X113.917 Y120.583
G1 X110.752 Y117.418 E.13753
G1 X110.219 Y117.418
G1 X113.384 Y120.583 E.13753
G1 X112.85 Y120.583
G1 X109.685 Y117.418 E.13753
G1 X109.152 Y117.418
G1 X112.317 Y120.583 E.13753
G1 X111.784 Y120.583
G1 X108.619 Y117.418 E.13753
G1 X108.086 Y117.418
G1 X111.251 Y120.583 E.13753
G1 X110.717 Y120.583
G1 X107.552 Y117.418 E.13753
G1 X107.019 Y117.418
G1 X110.184 Y120.583 E.13753
G1 X109.651 Y120.583
G1 X106.486 Y117.418 E.13754
G1 X105.952 Y117.418
G1 X109.118 Y120.583 E.13754
M73 P96 R0
G1 X108.584 Y120.583
G1 X105.419 Y117.418 E.13754
G1 X104.886 Y117.418
G1 X108.051 Y120.583 E.13754
G1 X107.518 Y120.583
G1 X104.353 Y117.418 E.13754
G1 X103.819 Y117.418
G1 X106.984 Y120.583 E.13754
G1 X106.451 Y120.583
G1 X103.286 Y117.417 E.13754
G1 X102.753 Y117.417
G1 X105.918 Y120.583 E.13754
G1 X105.385 Y120.583
G1 X102.22 Y117.417 E.13754
G1 X101.686 Y117.417
G1 X104.851 Y120.583 E.13754
G1 X104.318 Y120.583
G1 X101.153 Y117.417 E.13754
G1 X100.62 Y117.417
G1 X103.785 Y120.583 E.13754
G1 X103.252 Y120.583
G1 X100.086 Y117.417 E.13755
G1 X99.608 Y117.472
G1 X102.718 Y120.583 E.13516
G1 X102.185 Y120.583
G1 X99.226 Y117.623 E.1286
G1 X98.919 Y117.849
G1 X101.652 Y120.583 E.11877
G1 X101.119 Y120.583
G1 X98.677 Y118.141 E.10611
G1 X98.502 Y118.499
G1 X100.585 Y120.583 E.09055
G1 X100.583 Y121.113
G1 X98.42 Y118.95 E.09399
G1 X98.42 Y119.483
G1 X100.583 Y121.646 E.09399
G1 X100.583 Y122.18
G1 X98.42 Y120.017 E.09399
G1 X98.42 Y120.55
G1 X100.583 Y122.713 E.09399
G1 X100.583 Y123.246
G1 X98.419 Y121.083 E.094
G1 X98.419 Y121.616
G1 X100.583 Y123.779 E.094
G1 X100.583 Y124.313
G1 X98.419 Y122.149 E.094
G1 X98.419 Y122.683
G1 X100.583 Y124.846 E.09401
G1 X100.583 Y125.379
G1 X98.419 Y123.216 E.09401
G1 X98.419 Y123.749
G1 X100.583 Y125.912 E.09401
G1 X100.583 Y126.446
G1 X98.419 Y124.282 E.09402
G1 X98.419 Y124.815
G1 X100.583 Y126.979 E.09402
G1 X100.583 Y127.512
G1 X98.419 Y125.348 E.09402
G1 X98.419 Y125.882
G1 X100.583 Y128.045 E.09403
G1 X100.583 Y128.579
G1 X98.419 Y126.415 E.09403
G1 X98.419 Y126.948
G1 X100.583 Y129.112 E.09403
G1 X100.583 Y129.645
G1 X98.419 Y127.481 E.09403
G1 X98.419 Y128.014
G1 X100.583 Y130.178 E.09404
G1 X100.583 Y130.712
G1 X98.418 Y128.548 E.09404
G1 X98.418 Y129.081
G1 X100.583 Y131.245 E.09404
G1 X100.583 Y131.778
G1 X98.418 Y129.614 E.09405
G1 X98.418 Y130.147
G1 X100.583 Y132.311 E.09405
G1 X100.583 Y132.845
G1 X98.418 Y130.68 E.09405
G1 X98.418 Y131.214
G1 X100.583 Y133.378 E.09406
G1 X100.583 Y133.911
G1 X98.418 Y131.747 E.09406
G1 X98.418 Y132.28
G1 X100.583 Y134.445 E.09406
G1 X100.583 Y134.978
G1 X98.418 Y132.813 E.09407
G1 X98.418 Y133.346
G1 X103.654 Y138.583 E.22754
G1 X103.121 Y138.583
G1 X98.418 Y133.879 E.20438
G1 X98.418 Y134.413
G1 X102.588 Y138.583 E.18121
G1 X102.054 Y138.583
G1 X98.418 Y134.946 E.15804
G1 X98.418 Y135.479
G1 X101.521 Y138.583 E.13487
G1 X100.988 Y138.583
G1 X98.417 Y136.012 E.1117
G1 X98.417 Y136.545
G1 X100.455 Y138.583 E.08853
G1 X99.914 Y138.576
G1 X98.427 Y137.088 E.06462
; WIPE_START
M204 S6000
G1 X99.841 Y138.503 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.24 Y130.881 Z1.8 F42000
G1 X100.778 Y120.601 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101472
G1 F15000
M204 S6000
G1 X100.801 Y120.572 E.00018
G1 X100.687 Y120.481 E.0007
; WIPE_START
G1 X100.801 Y120.572 E-.60584
G1 X100.778 Y120.601 E-.15416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.105 Y126.067 Z1.8 F42000
G1 X115.316 Y135.515 Z1.8
M73 P97 R0
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.100261
G1 F15000
M204 S6000
G1 X115.203 Y135.427 E.00067
G1 X115.225 Y135.399 E.00017
; WIPE_START
G1 X115.203 Y135.427 E-.15142
G1 X115.316 Y135.515 E-.60858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.949 Y135.497 Z1.8 F42000
G1 X155.615 Y135.417 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.100228
G1 F15000
M204 S6000
G1 X155.527 Y135.303 E.00067
G1 X155.499 Y135.325 E.00017
; WIPE_START
G1 X155.527 Y135.303 E-.15129
G1 X155.615 Y135.417 E-.60871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.151 Y130.088 Z1.8 F42000
G1 X140.501 Y120.678 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.101492
G1 F15000
M204 S6000
G1 X140.472 Y120.701 E.00018
G1 X140.381 Y120.587 E.0007
; WIPE_START
G1 X140.472 Y120.701 E-.60584
G1 X140.501 Y120.678 E-.15416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.076 Y119.735 Z1.8 F42000
G1 X157.533 Y118.559 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.186374
G1 F15000
M204 S6000
G1 X157.389 Y118.364 E.00284
; LINE_WIDTH: 0.229273
G1 X157.244 Y118.169 E.00368
; LINE_WIDTH: 0.265082
G2 X156.831 Y117.756 I-2.303 J1.89 E.01059
; LINE_WIDTH: 0.228665
G1 X156.639 Y117.614 E.00361
; LINE_WIDTH: 0.184517
G1 X156.448 Y117.472 E.00275
; WIPE_START
G1 X156.639 Y117.614 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.473 Y120.24 Z1.8 F42000
G1 X99.553 Y138.536 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.205632
G1 F15000
M204 S6000
G1 X99.361 Y138.39 E.00319
; LINE_WIDTH: 0.235939
G1 X99.17 Y138.245 E.00378
; LINE_WIDTH: 0.269928
G3 X98.848 Y137.938 I1.863 J-2.274 E.00822
; LINE_WIDTH: 0.257374
G1 X98.755 Y137.825 E.00257
; LINE_WIDTH: 0.22823
G1 X98.662 Y137.711 E.00222
; LINE_WIDTH: 0.193179
G1 X98.568 Y137.574 E.00203
; LINE_WIDTH: 0.152215
G1 X98.474 Y137.437 E.00148
; WIPE_START
G1 X98.568 Y137.574 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.573 Y138.524 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0907118
G1 F15000
M204 S6000
G1 X98.89 Y138.149 E.00303
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X99.573 Y138.524 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
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
G1 Z1.8 F900 ; lower z a little
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

    G1 Z101.4 F600
    G1 Z99.4

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

