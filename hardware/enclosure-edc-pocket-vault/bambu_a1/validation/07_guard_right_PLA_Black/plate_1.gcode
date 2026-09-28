; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 4m 49s; total estimated time: 11m 23s
; total layer number: 35
; total filament length [mm] : 322.09
; total filament volume [cm^3] : 774.72
; total filament weight [g] : 0.96
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 7.00
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
; print_settings_id = AirGap EDC Vault 07_guard_right A1 0.4
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
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
M73 P10 R10
    G1 X-48.2 F3000
M73 P12 R9
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
M73 P13 R9
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
M73 P52 R5
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
M73 P53 R5
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
M73 P54 R5
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
    G29 A1 X123.5 Y115.5 I9 J25
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
; layer num/total_layer_count: 1/35
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X130.667 Y139.187 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P55 R5
G1 F1500
M204 S500
G3 X130.285 Y139.261 I-.371 J-.891 E.01462
G1 X125.715 Y139.261 E.17018
G3 X124.739 Y138.285 I-.011 J-.965 E.0573
G1 X124.739 Y117.715 E.76613
M73 P56 R5
G3 X125.715 Y116.739 I.965 J-.012 E.05731
G1 X130.345 Y116.741 E.17245
M73 P56 R4
G3 X131.261 Y117.715 I-.046 J.961 E.05507
G1 X131.261 Y138.285 E.76612
G3 X130.722 Y139.162 I-.965 J.012 E.04045
M204 S6000
G1 X130.842 Y139.609 F42000
M73 P57 R4
G1 F1500
M204 S500
G3 X130.29 Y139.718 I-.547 J-1.313 E.0211
G1 X125.71 Y139.718 E.17059
G3 X124.282 Y138.29 I-.005 J-1.423 E.08363
G1 X124.282 Y117.71 E.76653
G3 X125.71 Y116.282 I1.423 J-.005 E.08362
G1 X130.368 Y116.284 E.17348
G3 X131.718 Y117.71 I-.069 J1.418 E.08078
G1 X131.718 Y138.29 E.76653
G3 X130.897 Y139.584 I-1.423 J.005 E.06029
M204 S6000
G1 X131.017 Y140.031 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X130.296 Y140.175 I-.723 J-1.736 E.02758
G1 X125.704 Y140.175 E.171
G3 X123.825 Y138.296 I.001 J-1.881 E.10994
G1 X123.825 Y117.704 E.76694
G3 X125.704 Y115.825 I1.881 J.001 E.10994
G1 X130.39 Y115.827 E.17451
G3 X132.175 Y117.704 I-.091 J1.874 E.10649
G1 X132.175 Y138.296 E.76694
G3 X131.072 Y140.007 I-1.881 J-.001 E.08013
; WIPE_START
G1 X130.666 Y140.139 E-.16229
G1 X130.296 Y140.175 E-.14131
G1 X129.094 Y140.175 E-.4564
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


M73 P58 R4
G1 X130.328 Y116.923 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50524
G1 F2400
M204 S500
G3 X130.774 Y117.383 I-2.111 J2.496 E.02418
G3 X130.871 Y117.677 I-.577 J.353 E.01175
G1 X130.871 Y118.121 E.01672
G1 X129.88 Y117.13 E.05278
G1 X129.228 Y117.131 E.02458
G1 X130.871 Y118.775 E.08755
G1 X130.871 Y119.428 E.02463
G1 X128.575 Y117.133 E.12232
G1 X127.923 Y117.134 E.02458
G1 X130.871 Y120.082 E.15709
G1 X130.871 Y120.736 E.02463
G1 X127.27 Y117.135 E.19186
G1 X126.617 Y117.136 E.02458
G1 X130.871 Y121.39 E.22662
G1 X130.871 Y122.044 E.02463
G1 X125.965 Y117.138 E.26139
G1 X125.617 Y117.138 E.0131
G2 X125.399 Y117.226 I.035 J.403 E.00898
G1 X130.871 Y122.698 E.29154
G1 X130.871 Y123.352 E.02463
G1 X125.138 Y117.619 E.30544
G2 X125.128 Y118.262 I3.449 J.379 E.02427
M73 P59 R4
G1 X130.871 Y124.005 E.30601
G1 X130.871 Y124.659 E.02463
G1 X125.128 Y118.916 E.30601
G1 X125.128 Y119.57 E.02463
G1 X130.871 Y125.313 E.30601
G1 X130.871 Y125.967 E.02463
G1 X125.128 Y120.223 E.30601
G1 X125.128 Y120.877 E.02463
G1 X130.871 Y126.621 E.30601
G1 X130.872 Y127.275 E.02463
G1 X125.128 Y121.531 E.30601
G1 X125.128 Y122.185 E.02463
G1 X130.872 Y127.929 E.30601
G1 X130.872 Y128.583 E.02463
G1 X125.128 Y122.839 E.30601
G1 X125.128 Y123.493 E.02463
G1 X130.872 Y129.236 E.30601
G1 X130.872 Y129.89 E.02463
G1 X125.128 Y124.147 E.30601
G1 X125.128 Y124.801 E.02463
G1 X130.872 Y130.544 E.30601
G1 X130.872 Y131.198 E.02463
G1 X125.128 Y125.454 E.30601
G1 X125.128 Y126.108 E.02463
G1 X130.872 Y131.852 E.30601
G1 X130.872 Y132.506 E.02463
G1 X125.128 Y126.762 E.30601
G1 X125.128 Y127.416 E.02463
G1 X130.872 Y133.16 E.30601
G1 X130.872 Y133.813 E.02463
G1 X125.128 Y128.07 E.30601
G1 X125.128 Y128.724 E.02463
G1 X130.872 Y134.467 E.30601
G1 X130.872 Y135.121 E.02463
G1 X125.129 Y129.378 E.30601
G1 X125.129 Y130.031 E.02463
G1 X130.872 Y135.775 E.30601
G1 X130.872 Y136.429 E.02463
G1 X125.129 Y130.685 E.30601
G1 X125.129 Y131.339 E.02463
G1 X130.872 Y137.083 E.30601
G1 X130.872 Y137.737 E.02463
G1 X125.129 Y131.993 E.30601
G1 X125.129 Y132.647 E.02463
G1 X130.862 Y138.38 E.30545
G3 X130.603 Y138.775 I-.518 J-.058 E.01846
G1 X125.129 Y133.301 E.29164
G1 X125.129 Y133.955 E.02463
G1 X130.036 Y138.862 E.26146
G1 X129.384 Y138.864 E.02457
G1 X125.129 Y134.609 E.22671
G1 X125.129 Y135.262 E.02463
G1 X128.732 Y138.865 E.19195
G1 X128.08 Y138.867 E.02457
G1 X125.129 Y135.916 E.1572
G1 X125.129 Y136.57 E.02463
G1 X127.427 Y138.868 E.12244
G1 X126.775 Y138.87 E.02457
M73 P60 R4
G1 X125.129 Y137.224 E.08769
G1 X125.129 Y137.878 E.02463
G1 X126.123 Y138.871 E.05293
G3 X125.597 Y138.86 I-.201 J-2.761 E.01983
G3 X125.338 Y138.74 I.108 J-.577 E.01087
G1 X124.923 Y138.326 E.02207
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X125.338 Y138.74 E-.22264
G1 X125.424 Y138.798 E-.03919
G1 X125.597 Y138.86 E-.07011
G1 X126.123 Y138.871 E-.1997
G1 X125.698 Y138.446 E-.22837
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/35
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-.225 J1.196 P1  F42000
G1 X130.757 Y139.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.461 J-1.103 E.01598
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.008 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06283
G1 X130.364 Y116.512 E.15431
G3 X131.491 Y117.713 I-.065 J1.19 E.06031
G1 X131.491 Y138.287 E.68249
G3 X130.811 Y139.374 I-1.195 J.008 E.04487
M204 S10000
G1 X130.912 Y139.774 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.617 J-1.48 E.0211
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.379 Y116.104 E.15495
G3 X131.898 Y117.708 I-.08 J1.597 E.08088
G1 X131.898 Y138.292 E.68282
G3 X130.967 Y139.75 I-1.603 J.003 E.06062
M204 S250
G1 X131.068 Y140.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.061 Y140.137 E.00021
G3 X130.297 Y140.29 I-.767 J-1.843 E.0241
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.393 Y115.712 E.14411
G3 X132.29 Y117.703 I-.094 J1.989 E.09327
G1 X132.29 Y138.297 E.6328
G3 X131.405 Y139.952 I-1.996 J-.003 E.06005
G1 X131.121 Y140.106 E.00993
; WIPE_START
M204 S6000
G1 X131.061 Y140.137 E-.02532
G1 X130.688 Y140.252 E-.14837
G1 X130.297 Y140.29 E-.14929
G1 X129.147 Y140.29 E-.43702
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


G1 X130.504 Y139.303 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42577
G1 F6769
M204 S6000
G2 X130.989 Y138.809 I-3.07 J-3.493 E.02161
G2 X131.158 Y138.109 I-.833 J-.572 E.02299
G1 X130.109 Y139.158 E.04628
G1 X129.567 Y139.158 E.01689
G1 X131.158 Y137.567 E.07017
G1 X131.158 Y137.026 E.01689
G1 X129.026 Y139.158 E.09405
G1 X128.484 Y139.158 E.01689
G1 X131.157 Y136.484 E.11794
G1 X131.157 Y135.943 E.01689
G1 X127.943 Y139.158 E.14182
G1 X127.401 Y139.158 E.01689
G1 X131.157 Y135.402 E.16571
G1 X131.157 Y134.86 E.01689
G1 X126.86 Y139.158 E.1896
G1 X126.319 Y139.158 E.01689
G1 X131.157 Y134.319 E.21348
G1 X131.157 Y133.778 E.01689
G1 X125.777 Y139.158 E.23737
M73 P61 R4
G3 X125.327 Y139.066 I-.024 J-1.032 E.01444
G1 X131.157 Y133.236 E.25721
G1 X131.157 Y132.695 E.01689
G1 X125.027 Y138.825 E.27048
G3 X124.861 Y138.449 I.55 J-.466 E.013
G1 X131.157 Y132.153 E.27777
G1 X131.157 Y131.612 E.01689
G1 X124.844 Y137.925 E.27853
G1 X124.844 Y137.384 E.01689
G1 X131.157 Y131.071 E.27853
G1 X131.157 Y130.529 E.01689
G1 X124.844 Y136.842 E.27853
G1 X124.844 Y136.301 E.01689
G1 X131.157 Y129.988 E.27853
G1 X131.157 Y129.446 E.01689
G1 X124.844 Y135.759 E.27853
G1 X124.844 Y135.218 E.01689
G1 X131.157 Y128.905 E.27853
G1 X131.157 Y128.364 E.01689
G1 X124.844 Y134.677 E.27853
G1 X124.844 Y134.135 E.01689
G1 X131.157 Y127.822 E.27853
G1 X131.157 Y127.281 E.01689
G1 X124.844 Y133.594 E.27853
G1 X124.844 Y133.052 E.01689
G1 X131.157 Y126.74 E.27853
G1 X131.157 Y126.198 E.01689
G1 X124.844 Y132.511 E.27853
G1 X124.844 Y131.97 E.01689
G1 X131.157 Y125.657 E.27853
G1 X131.157 Y125.115 E.01689
G1 X124.844 Y131.428 E.27853
G1 X124.844 Y130.887 E.01689
G1 X131.156 Y124.574 E.27853
G1 X131.156 Y124.033 E.01689
G1 X124.843 Y130.346 E.27853
G1 X124.843 Y129.804 E.01689
G1 X131.156 Y123.491 E.27853
G1 X131.156 Y122.95 E.01689
G1 X124.843 Y129.263 E.27853
G1 X124.843 Y128.721 E.01689
G1 X131.156 Y122.408 E.27853
G1 X131.156 Y121.867 E.01689
G1 X124.843 Y128.18 E.27853
G1 X124.843 Y127.639 E.01689
G1 X131.156 Y121.326 E.27853
G1 X131.156 Y120.784 E.01689
G1 X124.843 Y127.097 E.27853
G1 X124.843 Y126.556 E.01689
G1 X131.156 Y120.243 E.27853
G1 X131.156 Y119.702 E.01689
G1 X124.843 Y126.014 E.27853
G1 X124.843 Y125.473 E.01689
G1 X131.156 Y119.16 E.27853
G1 X131.156 Y118.619 E.01689
G1 X124.843 Y124.932 E.27853
G1 X124.843 Y124.39 E.01689
G1 X131.156 Y118.077 E.27853
G2 X131.139 Y117.553 I-1.777 J-.205 E.01643
G1 X124.843 Y123.849 E.27778
G1 X124.843 Y123.308 E.01689
G1 X130.973 Y117.178 E.27044
G2 X130.676 Y116.933 I-.648 J.482 E.01211
G1 X124.843 Y122.766 E.25737
G1 X124.843 Y122.225 E.01689
G1 X130.223 Y116.845 E.23737
G1 X129.682 Y116.844 E.01688
G1 X124.843 Y121.683 E.21349
G1 X124.843 Y121.142 E.01689
G1 X129.141 Y116.844 E.18962
G1 X128.599 Y116.844 E.01688
G1 X124.843 Y120.601 E.16575
G1 X124.843 Y120.059 E.01689
G1 X128.058 Y116.844 E.14187
G1 X127.517 Y116.843 E.01688
G1 X124.843 Y119.518 E.118
G1 X124.842 Y118.976 E.01689
G1 X126.976 Y116.843 E.09413
G1 X126.435 Y116.843 E.01688
G1 X124.842 Y118.435 E.07025
G1 X124.842 Y117.894 E.01689
G1 X125.894 Y116.842 E.04638
G2 X125.145 Y117.05 I-.109 J1.061 E.02481
G1 X124.693 Y117.501 E.01991
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9403.16
G1 X125.145 Y117.05 E-.24254
G1 X125.334 Y116.926 E-.08596
G1 X125.452 Y116.88 E-.0479
G1 X125.574 Y116.853 E-.04763
G1 X125.894 Y116.842 E-.12159
G1 X125.495 Y117.241 E-.21438
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/35
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I-1.184 J.281 P1  F42000
G1 X130.757 Y139.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.463 J-1.104 E.01601
G1 X125.713 Y139.491 E.15175
G3 X124.509 Y138.287 I-.009 J-1.195 E.06284
G1 X124.509 Y117.712 E.68251
G3 X125.712 Y116.509 I1.2 J-.003 E.06274
M73 P62 R4
G1 X130.36 Y116.511 E.15418
G3 X131.491 Y117.713 I-.064 J1.192 E.0604
G1 X131.491 Y138.287 E.6825
G3 X130.812 Y139.373 I-1.197 J.007 E.04481
M204 S10000
G1 X130.912 Y139.774 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.618 J-1.48 E.02111
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.707 E.68284
G3 X125.708 Y116.102 I1.609 J.004 E.0836
G1 X130.374 Y116.104 E.1548
G3 X131.898 Y117.708 I-.079 J1.601 E.08098
G1 X131.898 Y138.292 E.68282
G3 X130.967 Y139.75 I-1.604 J.002 E.0606
M204 S250
G1 X131.067 Y140.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.061 Y140.137 E.00019
G3 X130.297 Y140.29 I-.767 J-1.843 E.0241
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.63281
G3 X125.703 Y115.71 I2.003 J.01 E.09605
G1 X130.388 Y115.712 E.14396
G3 X132.29 Y117.703 I-.094 J1.994 E.09336
G1 X132.29 Y138.297 E.6328
G3 X131.396 Y139.958 I-1.996 J-.003 E.06036
G1 X131.12 Y140.107 E.00964
; WIPE_START
M204 S6000
G1 X131.061 Y140.137 E-.02511
G1 X130.688 Y140.252 E-.1483
G1 X130.297 Y140.29 E-.14935
G1 X129.146 Y140.29 E-.43724
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
G1 X125.502 Y139.307 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42576
G1 F6731
M204 S6000
G1 X125.049 Y138.854 E.01996
G3 X124.844 Y138.108 I.745 J-.606 E.02486
G1 X125.894 Y139.158 E.04632
G1 X126.435 Y139.158 E.01689
G1 X124.844 Y137.566 E.07021
G1 X124.844 Y137.025 E.01689
G1 X126.977 Y139.158 E.0941
G1 X127.518 Y139.158 E.01689
G1 X124.844 Y136.483 E.11798
G1 X124.844 Y135.942 E.01689
G1 X128.06 Y139.158 E.14187
G1 X128.601 Y139.158 E.01689
G1 X124.844 Y135.4 E.16576
G1 X124.844 Y134.859 E.01689
G1 X129.142 Y139.158 E.18965
G1 X129.684 Y139.158 E.01689
G1 X124.844 Y134.317 E.21354
G1 X124.844 Y133.776 E.01689
G1 X130.225 Y139.158 E.23743
G2 X130.673 Y139.069 I.015 J-1.104 E.01434
G1 X124.844 Y133.235 E.2573
G1 X124.844 Y132.693 E.01689
G1 X130.975 Y138.824 E.2705
G2 X131.141 Y138.449 I-.677 J-.524 E.01293
G1 X124.844 Y132.152 E.27783
G1 X124.844 Y131.61 E.01689
G1 X131.158 Y137.924 E.27857
M73 P63 R4
G1 X131.158 Y137.383 E.01689
G1 X124.844 Y131.069 E.27857
G1 X124.843 Y130.527 E.01689
G1 X131.157 Y136.841 E.27857
G1 X131.157 Y136.3 E.01689
G1 X124.843 Y129.986 E.27857
G1 X124.843 Y129.444 E.01689
G1 X131.157 Y135.758 E.27857
G1 X131.157 Y135.217 E.01689
G1 X124.843 Y128.903 E.27857
G1 X124.843 Y128.361 E.01689
G1 X131.157 Y134.675 E.27857
G1 X131.157 Y134.134 E.01689
G1 X124.843 Y127.82 E.27857
G1 X124.843 Y127.278 E.01689
G1 X131.157 Y133.592 E.27857
G1 X131.157 Y133.051 E.01689
G1 X124.843 Y126.737 E.27857
G1 X124.843 Y126.196 E.01689
G1 X131.157 Y132.51 E.27857
G1 X131.157 Y131.968 E.01689
G1 X124.843 Y125.654 E.27857
G1 X124.843 Y125.113 E.01689
G1 X131.157 Y131.427 E.27857
G1 X131.157 Y130.885 E.01689
G1 X124.843 Y124.571 E.27857
G1 X124.843 Y124.03 E.01689
G1 X131.157 Y130.344 E.27857
G1 X131.157 Y129.802 E.01689
G1 X124.843 Y123.488 E.27857
G1 X124.843 Y122.947 E.01689
G1 X131.157 Y129.261 E.27857
G1 X131.157 Y128.719 E.01689
G1 X124.843 Y122.405 E.27857
G1 X124.843 Y121.864 E.01689
G1 X131.157 Y128.178 E.27857
G1 X131.157 Y127.636 E.01689
G1 X124.843 Y121.322 E.27857
G1 X124.843 Y120.781 E.01689
G1 X131.157 Y127.095 E.27857
G1 X131.157 Y126.553 E.01689
G1 X124.843 Y120.239 E.27857
G1 X124.843 Y119.698 E.01689
G1 X131.157 Y126.012 E.27857
G1 X131.157 Y125.471 E.01689
G1 X124.843 Y119.157 E.27857
G1 X124.842 Y118.615 E.01689
G1 X131.156 Y124.929 E.27857
G1 X131.156 Y124.388 E.01689
G1 X124.842 Y118.074 E.27857
G3 X124.859 Y117.549 I2.8 J-.173 E.0164
G1 X131.156 Y123.846 E.27782
G1 X131.156 Y123.305 E.01689
G1 X125.027 Y117.175 E.27044
G3 X125.324 Y116.931 I.987 J.903 E.01204
G1 X131.156 Y122.763 E.2573
G1 X131.156 Y122.222 E.01689
G1 X125.777 Y116.842 E.23733
G1 X126.319 Y116.843 E.0169
G1 X131.156 Y121.68 E.21343
G1 X131.156 Y121.139 E.01689
G1 X126.86 Y116.843 E.18953
G1 X127.402 Y116.843 E.0169
G1 X131.156 Y120.597 E.16563
G1 X131.156 Y120.056 E.01689
G1 X127.944 Y116.843 E.14173
G1 X128.485 Y116.844 E.0169
G1 X131.156 Y119.514 E.11783
G1 X131.156 Y118.973 E.01689
G1 X129.027 Y116.844 E.09393
G1 X129.569 Y116.844 E.0169
G1 X131.156 Y118.432 E.07003
G1 X131.156 Y117.89 E.01689
G1 X130.11 Y116.845 E.04613
G3 X130.775 Y116.989 I.114 J1.08 E.02159
G3 X131.302 Y117.495 I-2.304 J2.924 E.02282
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9403.405
G1 X130.775 Y116.989 E-.27756
G1 X130.625 Y116.909 E-.06456
G1 X130.463 Y116.86 E-.0643
G1 X130.11 Y116.845 E-.13429
G1 X130.518 Y117.253 E-.21929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/35
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I-1.217 J.01 P1  F42000
G1 X130.709 Y139.415 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X130.69 Y139.424 E.00071
G3 X130.287 Y139.491 I-.395 J-1.128 E.01362
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.197 J-.007 E.06281
G1 X130.356 Y116.511 E.15403
G3 X131.491 Y117.713 I-.059 J1.192 E.06055
G1 X131.491 Y138.287 E.68249
G3 X130.96 Y139.289 I-1.195 J.008 E.03919
G1 X130.763 Y139.388 E.0073
M204 S10000
G1 X130.933 Y139.763 F42000
G1 F5400
M204 S6000
G1 X130.694 Y139.847 E.0084
G3 X130.292 Y139.898 I-.399 J-1.553 E.01348
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.604 J-.002 E.0837
G1 X130.37 Y116.104 E.15465
G3 X131.898 Y117.708 I-.074 J1.6 E.08114
G1 X131.898 Y138.292 E.68282
G3 X130.988 Y139.74 I-1.603 J.003 E.05983
M204 S250
G1 X131.065 Y140.13 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.785 Y140.229 E.0091
G3 X130.297 Y140.29 I-.491 J-1.935 E.01516
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.383 Y115.712 E.1438
G3 X132.29 Y117.703 I-.088 J1.994 E.09351
G1 X132.29 Y138.297 E.6328
G3 X131.137 Y140.103 I-1.996 J-.003 E.0695
G1 X131.121 Y140.109 E.00053
; WIPE_START
M204 S6000
G1 X130.785 Y140.229 E-.13532
G1 X130.494 Y140.28 E-.11226
G1 X130.297 Y140.29 E-.07508
G1 X129.146 Y140.29 E-.43735
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


G1 X130.505 Y139.303 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42577
G1 F6742
M204 S6000
G2 X130.988 Y138.81 I-3.051 J-3.476 E.02155
G2 X131.158 Y138.108 I-.833 J-.573 E.02303
G1 X130.108 Y139.158 E.04629
G1 X129.567 Y139.158 E.01689
G1 X131.158 Y137.567 E.07017
G1 X131.158 Y137.026 E.01689
G1 X129.026 Y139.158 E.09406
G1 X128.484 Y139.158 E.01689
M73 P64 R4
G1 X131.157 Y136.484 E.11794
G1 X131.157 Y135.943 E.01689
G1 X127.943 Y139.158 E.14183
G1 X127.401 Y139.158 E.01689
G1 X131.157 Y135.402 E.16572
G1 X131.157 Y134.86 E.01689
G1 X126.86 Y139.158 E.1896
G1 X126.318 Y139.158 E.01689
G1 X131.157 Y134.319 E.21349
G1 X131.157 Y133.777 E.01689
G1 X125.777 Y139.158 E.23737
G3 X125.325 Y139.068 I-.024 J-1.063 E.01449
G1 X131.157 Y133.236 E.25731
G1 X131.157 Y132.695 E.01689
G1 X125.027 Y138.825 E.27048
G3 X124.862 Y138.448 I.544 J-.462 E.01301
G1 X131.157 Y132.153 E.27774
G1 X131.157 Y131.612 E.01689
G1 X124.844 Y137.925 E.27853
G1 X124.844 Y137.383 E.01689
G1 X131.157 Y131.07 E.27853
G1 X131.157 Y130.529 E.01689
G1 X124.844 Y136.842 E.27853
G1 X124.844 Y136.301 E.01689
G1 X131.157 Y129.988 E.27853
G1 X131.157 Y129.446 E.01689
G1 X124.844 Y135.759 E.27853
G1 X124.844 Y135.218 E.01689
G1 X131.157 Y128.905 E.27853
G1 X131.157 Y128.364 E.01689
G1 X124.844 Y134.676 E.27853
G1 X124.844 Y134.135 E.01689
G1 X131.157 Y127.822 E.27853
G1 X131.157 Y127.281 E.01689
G1 X124.844 Y133.594 E.27853
G1 X124.844 Y133.052 E.01689
G1 X131.157 Y126.739 E.27853
G1 X131.157 Y126.198 E.01689
G1 X124.844 Y132.511 E.27853
G1 X124.844 Y131.97 E.01689
G1 X131.157 Y125.657 E.27853
G1 X131.157 Y125.115 E.01689
G1 X124.844 Y131.428 E.27853
G1 X124.844 Y130.887 E.01689
G1 X131.156 Y124.574 E.27853
G1 X131.156 Y124.032 E.01689
G1 X124.843 Y130.345 E.27853
G1 X124.843 Y129.804 E.01689
G1 X131.156 Y123.491 E.27853
G1 X131.156 Y122.95 E.01689
G1 X124.843 Y129.263 E.27853
G1 X124.843 Y128.721 E.01689
G1 X131.156 Y122.408 E.27853
G1 X131.156 Y121.867 E.01689
G1 X124.843 Y128.18 E.27853
G1 X124.843 Y127.638 E.01689
G1 X131.156 Y121.326 E.27853
G1 X131.156 Y120.784 E.01689
G1 X124.843 Y127.097 E.27853
G1 X124.843 Y126.556 E.01689
G1 X131.156 Y120.243 E.27853
G1 X131.156 Y119.701 E.01689
G1 X124.843 Y126.014 E.27853
G1 X124.843 Y125.473 E.01689
G1 X131.156 Y119.16 E.27853
G1 X131.156 Y118.619 E.01689
G1 X124.843 Y124.932 E.27853
G1 X124.843 Y124.39 E.01689
G1 X131.156 Y118.077 E.27853
G2 X131.142 Y117.55 I-2.145 J-.207 E.0165
G1 X124.843 Y123.849 E.27791
G1 X124.843 Y123.307 E.01689
G1 X130.973 Y117.178 E.27044
G2 X130.674 Y116.934 I-.682 J.532 E.01211
G1 X124.843 Y122.766 E.25729
G1 X124.843 Y122.225 E.01689
G1 X130.223 Y116.845 E.23737
G1 X129.682 Y116.844 E.01688
G1 X124.843 Y121.683 E.2135
G1 X124.843 Y121.142 E.01689
G1 X129.141 Y116.844 E.18962
G1 X128.599 Y116.844 E.01688
G1 X124.843 Y120.6 E.16575
G1 X124.843 Y120.059 E.01689
G1 X128.058 Y116.843 E.14187
M73 P64 R3
G1 X127.517 Y116.843 E.01688
G1 X124.843 Y119.518 E.118
G1 X124.842 Y118.976 E.01689
G1 X126.976 Y116.843 E.09412
G1 X126.435 Y116.843 E.01688
G1 X124.842 Y118.435 E.07025
M73 P65 R3
G1 X124.842 Y117.894 E.01689
G1 X125.893 Y116.842 E.04637
G2 X125.143 Y117.052 I-.108 J1.063 E.02488
G1 X124.694 Y117.501 E.01983
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9403.16
G1 X125.143 Y117.052 E-.24152
G1 X125.335 Y116.926 E-.08723
G1 X125.452 Y116.88 E-.04762
G1 X125.574 Y116.853 E-.04762
G1 X125.893 Y116.842 E-.12144
G1 X125.494 Y117.242 E-.21457
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/35
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I-1.184 J.281 P1  F42000
G1 X130.755 Y139.399 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.461 J-1.104 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.01 J-1.194 E.06286
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.193 J-.011 E.06287
G1 X130.352 Y116.511 E.15389
G3 X131.491 Y117.713 I-.055 J1.193 E.06069
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.374 I-1.196 J.007 E.04491
M204 S10000
G1 X130.911 Y139.774 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.617 J-1.481 E.02106
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.005 J-1.601 E.08374
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.6 J-.006 E.08376
G1 X130.365 Y116.104 E.15449
G3 X131.898 Y117.708 I-.069 J1.601 E.08129
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.75 I-1.605 J.001 E.06064
M204 S250
G1 X131.066 Y140.136 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.061 Y140.136 E.00017
G3 X130.297 Y140.29 I-.768 J-1.844 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I0 J-1.993 E.09619
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.992 J-.001 E.0962
G1 X130.378 Y115.712 E.14365
G3 X132.29 Y117.703 I-.083 J1.994 E.09366
G1 X132.29 Y138.297 E.6328
G3 X131.388 Y139.963 I-1.998 J-.005 E.06064
G1 X131.119 Y140.107 E.00938
; WIPE_START
M204 S6000
G1 X131.061 Y140.136 E-.02477
G1 X130.688 Y140.252 E-.14807
G1 X130.297 Y140.29 E-.14941
G1 X129.145 Y140.29 E-.43776
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


G1 X125.507 Y139.307 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42569
G1 F6732
M204 S6000
G1 X125.029 Y138.829 E.02109
G3 X124.844 Y138.103 I.788 J-.587 E.02398
G1 X125.899 Y139.158 E.04653
G1 X126.44 Y139.158 E.01688
G1 X124.844 Y137.561 E.07041
G1 X124.844 Y137.02 E.01689
G1 X126.982 Y139.158 E.09429
G1 X127.523 Y139.158 E.01688
G1 X124.844 Y136.479 E.11817
G1 X124.844 Y135.937 E.01689
G1 X128.064 Y139.158 E.14205
G1 X128.606 Y139.158 E.01688
G1 X124.844 Y135.396 E.16593
G1 X124.844 Y134.855 E.01689
G1 X129.147 Y139.158 E.18981
G1 X129.688 Y139.158 E.01688
G1 X124.844 Y134.313 E.21369
G1 X124.844 Y133.772 E.01689
G1 X130.23 Y139.158 E.23757
G2 X130.679 Y139.065 I-.053 J-1.4 E.01437
G1 X124.844 Y133.23 E.25739
G1 X124.844 Y132.689 E.01689
G1 X130.977 Y138.823 E.27057
G2 X131.141 Y138.445 I-.724 J-.538 E.01295
G1 X124.844 Y132.148 E.27779
G1 X124.844 Y131.606 E.01689
G1 X131.158 Y137.92 E.27852
G1 X131.158 Y137.379 E.01689
G1 X124.844 Y131.065 E.27852
G1 X124.843 Y130.524 E.01689
M73 P66 R3
G1 X131.157 Y136.838 E.27852
G1 X131.157 Y136.296 E.01689
G1 X124.843 Y129.982 E.27852
G1 X124.843 Y129.441 E.01689
G1 X131.157 Y135.755 E.27852
G1 X131.157 Y135.214 E.01689
G1 X124.843 Y128.9 E.27852
G1 X124.843 Y128.358 E.01689
G1 X131.157 Y134.672 E.27852
G1 X131.157 Y134.131 E.01689
G1 X124.843 Y127.817 E.27852
G1 X124.843 Y127.275 E.01689
G1 X131.157 Y133.589 E.27852
G1 X131.157 Y133.048 E.01689
G1 X124.843 Y126.734 E.27852
G1 X124.843 Y126.193 E.01689
G1 X131.157 Y132.507 E.27852
G1 X131.157 Y131.965 E.01689
G1 X124.843 Y125.651 E.27852
G1 X124.843 Y125.11 E.01689
G1 X131.157 Y131.424 E.27852
G1 X131.157 Y130.883 E.01689
G1 X124.843 Y124.569 E.27852
G1 X124.843 Y124.027 E.01689
G1 X131.157 Y130.341 E.27852
G1 X131.157 Y129.8 E.01689
G1 X124.843 Y123.486 E.27852
G1 X124.843 Y122.945 E.01689
G1 X131.157 Y129.259 E.27852
G1 X131.157 Y128.717 E.01689
G1 X124.843 Y122.403 E.27852
G1 X124.843 Y121.862 E.01689
G1 X131.157 Y128.176 E.27852
G1 X131.157 Y127.634 E.01689
G1 X124.843 Y121.32 E.27852
G1 X124.843 Y120.779 E.01689
G1 X131.157 Y127.093 E.27852
G1 X131.157 Y126.552 E.01689
G1 X124.843 Y120.238 E.27852
G1 X124.843 Y119.696 E.01689
G1 X131.157 Y126.01 E.27852
G1 X131.157 Y125.469 E.01689
G1 X124.843 Y119.155 E.27852
G1 X124.842 Y118.614 E.01689
G1 X131.156 Y124.928 E.27852
G1 X131.156 Y124.386 E.01689
G1 X124.842 Y118.072 E.27852
G3 X124.859 Y117.548 I2.817 J-.172 E.01639
G1 X131.156 Y123.845 E.27777
G1 X131.156 Y123.304 E.01689
G1 X125.026 Y117.173 E.27041
G3 X125.325 Y116.931 I1.072 J1.016 E.01204
G1 X131.156 Y122.762 E.25722
G1 X131.156 Y122.221 E.01689
G1 X125.778 Y116.842 E.23724
G1 X126.319 Y116.843 E.01689
G1 X131.156 Y121.679 E.21335
G1 X131.156 Y121.138 E.01689
G1 X126.861 Y116.843 E.18946
G1 X127.403 Y116.843 E.01689
G1 X131.156 Y120.597 E.16557
G1 X131.156 Y120.055 E.01689
G1 X127.944 Y116.843 E.14168
G1 X128.486 Y116.844 E.01689
G1 X131.156 Y119.514 E.11779
G1 X131.156 Y118.973 E.01689
G1 X129.027 Y116.844 E.0939
G1 X129.569 Y116.844 E.01689
G1 X131.156 Y118.431 E.07001
G1 X131.156 Y117.89 E.01689
G1 X130.11 Y116.844 E.04612
G3 X130.776 Y116.989 I.11 J1.096 E.02158
G3 X131.304 Y117.497 I-2.318 J2.94 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9405.126
G1 X130.776 Y116.989 E-.27882
G1 X130.627 Y116.909 E-.06388
G1 X130.464 Y116.86 E-.06478
G1 X130.11 Y116.844 E-.13457
G1 X130.516 Y117.25 E-.21796
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/35
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-1.217 J.013 P1  F42000
G1 X130.755 Y139.399 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2563
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.009 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.008 E.06283
G1 X130.347 Y116.511 E.15375
G3 X131.491 Y117.713 I-.05 J1.193 E.06084
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.195 J.008 E.04492
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F2563
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.36 Y116.104 E.15434
G3 X131.898 Y117.708 I-.064 J1.601 E.08144
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06065
M204 S250
G1 X131.066 Y140.136 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2563
M204 S5000
G1 X131.061 Y140.137 E.00015
G3 X130.297 Y140.29 I-.767 J-1.843 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.373 Y115.712 E.1435
G3 X132.29 Y117.703 I-.078 J1.994 E.09381
G1 X132.29 Y138.297 E.6328
G3 X131.404 Y139.953 I-1.996 J-.003 E.06007
G1 X131.119 Y140.108 E.00998
; WIPE_START
G1 F3000
M204 S6000
G1 X131.061 Y140.137 E-.02456
G1 X130.878 Y140.204 E-.07427
G1 X130.616 Y140.264 E-.10203
G1 X130.297 Y140.29 E-.12151
G1 X129.145 Y140.29 E-.43763
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


G1 X131.139 Y138.306 F42000
G1 Z1.2
M73 P67 R3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2563
M204 S6000
G2 X131.142 Y136.678 I-8.57 J-.831 E.05409
G2 X129.966 Y136.592 I-.684 J1.264 E.04034
G1 X129.31 Y137.061 E.02674
G3 X127.345 Y137.753 I-1.521 J-1.184 E.07303
G3 X126.035 Y136.72 I5.127 J-7.846 E.05544
G1 X125.379 Y136.514 E.02278
G1 X124.859 Y136.576 E.01738
G1 X124.859 Y134.057 E.08356
G3 X126.035 Y133.971 I.683 J1.263 E.0403
G1 X126.69 Y134.441 E.02674
G2 X128.655 Y135.133 I1.521 J-1.184 E.07303
G2 X129.966 Y134.099 I-5.127 J-7.846 E.05544
G1 X130.621 Y133.893 E.02278
G1 X131.142 Y133.955 E.01742
G1 X131.142 Y131.436 E.08356
G2 X129.966 Y131.35 I-.684 J1.264 E.04032
G1 X129.31 Y131.82 E.02674
G3 X127.345 Y132.512 I-1.521 J-1.184 E.07303
G3 X126.035 Y131.478 I5.127 J-7.846 E.05544
G1 X125.379 Y131.272 E.02278
G1 X124.859 Y131.334 E.0174
G1 X124.858 Y128.815 E.08356
G3 X126.035 Y128.73 I.683 J1.264 E.04031
G1 X126.69 Y129.199 E.02674
G2 X128.655 Y129.891 I1.521 J-1.184 E.07303
G2 X129.966 Y128.858 I-5.125 J-7.844 E.05544
G1 X130.621 Y128.652 E.02278
G1 X131.142 Y128.714 E.01741
G1 X131.142 Y126.195 E.08356
G2 X129.966 Y126.109 I-.683 J1.263 E.04031
G1 X129.31 Y126.579 E.02674
G3 X127.345 Y127.271 I-1.521 J-1.184 E.07303
G3 X126.035 Y126.237 I5.125 J-7.844 E.05544
G1 X125.379 Y126.031 E.02278
G1 X124.858 Y126.093 E.01741
G1 X124.858 Y123.574 E.08355
G3 X126.035 Y123.488 I.684 J1.264 E.04033
G1 X126.69 Y123.958 E.02674
G2 X128.655 Y124.65 I1.521 J-1.184 E.07303
G2 X129.966 Y123.616 I-5.127 J-7.846 E.05544
G1 X130.621 Y123.41 E.02278
G1 X131.141 Y123.472 E.01739
G1 X131.141 Y120.953 E.08356
G2 X129.966 Y120.868 I-.683 J1.263 E.04029
G1 X129.31 Y121.337 E.02674
G3 X127.345 Y122.029 I-1.521 J-1.184 E.07303
G3 X126.035 Y120.996 I5.127 J-7.846 E.05544
G1 X125.379 Y120.79 E.02278
G1 X124.858 Y120.852 E.01743
G1 X124.857 Y118.333 E.08355
G3 X126.035 Y118.247 I.684 J1.264 E.04034
G1 X126.69 Y118.717 E.02674
G2 X128.655 Y119.409 I1.521 J-1.184 E.07303
G2 X129.966 Y118.375 I-5.127 J-7.846 E.05544
G1 X130.621 Y118.169 E.02278
G1 X131.141 Y118.231 E.01738
G1 X131.141 Y117.668 E.01869
G2 X130.518 Y116.892 I-.839 J.035 E.03532
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.767 Y117.001 E-.1033
G1 X130.973 Y117.196 E-.10766
G1 X131.141 Y117.668 E-.19035
G1 X131.141 Y118.231 E-.21409
G1 X130.763 Y118.186 E-.1446
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/35
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I-1.217 J-.001 P1  F42000
G1 X130.754 Y139.397 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2559
M204 S6000
G3 X130.287 Y139.491 I-.465 J-1.108 E.01591
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.194 J-.009 E.06284
G1 X130.343 Y116.511 E.1536
G3 X131.491 Y117.713 I-.046 J1.193 E.06098
G1 X131.491 Y138.287 E.68249
G3 X130.809 Y139.373 I-1.201 J.002 E.04486
M204 S10000
G1 X130.91 Y139.773 F42000
G1 F2559
M204 S6000
G3 X130.292 Y139.898 I-.622 J-1.485 E.02104
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
M73 P68 R3
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.601 J-.004 E.08373
G1 X130.356 Y116.104 E.15418
G3 X131.898 Y117.708 I-.06 J1.601 E.0816
G1 X131.898 Y138.292 E.68282
G3 X130.965 Y139.749 I-1.61 J-.004 E.06058
M204 S250
G1 X131.065 Y140.137 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2559
M204 S5000
G1 X131.06 Y140.135 E.00017
G3 X130.297 Y140.29 I-.773 J-1.848 E.02407
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.993 J.001 E.09618
G1 X130.368 Y115.712 E.14334
G3 X132.29 Y117.703 I-.073 J1.994 E.09397
G1 X132.29 Y138.297 E.6328
G3 X131.236 Y140.051 I-2.004 J-.011 E.06598
G1 X131.118 Y140.11 E.00404
; WIPE_START
G1 F3000
M204 S6000
G1 X131.06 Y140.135 E-.02422
G1 X130.878 Y140.204 E-.07413
G1 X130.621 Y140.263 E-.10017
G1 X130.297 Y140.29 E-.12335
G1 X129.144 Y140.29 E-.43813
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


G1 X124.859 Y138.297 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2559
M204 S6000
G1 X124.859 Y136.669 E.05401
G3 X126.035 Y136.605 I.659 J1.27 E.04025
G1 X126.69 Y137.082 E.02689
G2 X128.655 Y137.74 I1.487 J-1.178 E.07274
G2 X129.966 Y136.709 I-6.475 J-9.574 E.05536
G1 X130.621 Y136.515 E.02266
G1 X131.142 Y136.587 E.01747
G1 X131.142 Y134.049 E.08419
G2 X129.966 Y133.984 I-.66 J1.271 E.04029
G1 X129.31 Y134.462 E.02689
G3 X127.345 Y135.119 I-1.487 J-1.178 E.07274
G3 X126.035 Y134.088 I6.473 J-9.572 E.05536
G1 X125.379 Y133.894 E.02266
G1 X124.859 Y133.966 E.01743
G1 X124.859 Y131.428 E.08419
G3 X126.035 Y131.364 I.659 J1.27 E.04026
G1 X126.69 Y131.841 E.02689
G2 X128.655 Y132.499 I1.487 J-1.178 E.07274
G2 X129.966 Y131.467 I-6.475 J-9.574 E.05536
G1 X130.621 Y131.274 E.02266
G1 X131.142 Y131.345 E.01746
G1 X131.142 Y128.807 E.08419
G2 X129.966 Y128.743 I-.659 J1.271 E.04027
G1 X129.31 Y129.22 E.02689
G3 X127.345 Y129.878 I-1.487 J-1.178 E.07274
G3 X126.035 Y128.847 I6.475 J-9.574 E.05536
G1 X125.379 Y128.653 E.02266
G1 X124.858 Y128.724 E.01745
G1 X124.858 Y126.186 E.08419
G3 X126.035 Y126.122 I.659 J1.271 E.04028
M73 P69 R3
G1 X126.69 Y126.6 E.02689
G2 X128.655 Y127.257 I1.487 J-1.178 E.07274
G2 X129.966 Y126.226 I-6.475 J-9.574 E.05536
G1 X130.621 Y126.032 E.02266
G1 X131.142 Y126.104 E.01744
G1 X131.141 Y123.566 E.0842
G2 X129.966 Y123.502 I-.659 J1.27 E.04026
G1 X129.31 Y123.979 E.02689
G3 X127.345 Y124.637 I-1.487 J-1.178 E.07274
G3 X126.035 Y123.605 I6.475 J-9.574 E.05536
G1 X125.379 Y123.412 E.02266
G1 X124.858 Y123.483 E.01746
G1 X124.858 Y120.945 E.08419
G3 X126.035 Y120.881 I.66 J1.271 E.04029
G1 X126.69 Y121.358 E.02689
G2 X128.655 Y122.016 I1.487 J-1.178 E.07274
G2 X129.966 Y120.985 I-6.475 J-9.575 E.05536
G1 X130.621 Y120.791 E.02266
G1 X131.141 Y120.862 E.01743
G1 X131.141 Y118.324 E.0842
G2 X129.966 Y118.26 I-.658 J1.27 E.04024
G1 X129.31 Y118.738 E.02689
G3 X127.345 Y119.396 I-1.487 J-1.178 E.07274
G3 X126.035 Y118.364 I6.475 J-9.574 E.05536
G1 X125.379 Y118.17 E.02266
G1 X124.857 Y118.242 E.01748
G1 X124.857 Y117.729 E.01701
G3 X125.472 Y116.899 I.86 J-.006 E.03675
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X125.232 Y117.001 E-.09911
G1 X125.046 Y117.171 E-.09579
G1 X124.907 Y117.421 E-.10868
G1 X124.857 Y117.729 E-.11869
G1 X124.857 Y118.242 E-.19491
G1 X125.23 Y118.191 E-.14281
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/35
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I-1.178 J.307 P1  F42000
G1 X130.755 Y139.399 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2689
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.196 J-.008 E.06282
G1 X130.338 Y116.511 E.15345
G3 X131.491 Y117.713 I-.041 J1.193 E.06113
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.195 J.008 E.04492
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F2689
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02106
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.351 Y116.104 E.15402
G3 X131.898 Y117.708 I-.055 J1.601 E.08175
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06066
M204 S250
G1 X131.065 Y140.137 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2689
M204 S5000
G1 X131.061 Y140.137 E.00011
G3 X130.297 Y140.29 I-.767 J-1.843 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.995 J.002 E.09616
G1 X130.363 Y115.712 E.14319
G3 X132.29 Y117.703 I-.068 J1.994 E.09412
G1 X132.29 Y138.297 E.6328
G3 X131.376 Y139.971 I-1.996 J-.003 E.06111
G1 X131.118 Y140.109 E.00899
; WIPE_START
G1 F3000
M204 S6000
G1 X131.061 Y140.137 E-.02401
G1 X130.878 Y140.204 E-.07419
G1 X130.626 Y140.262 E-.09834
G1 X130.297 Y140.29 E-.12525
G1 X129.144 Y140.29 E-.43821
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


G1 X131.143 Y137.769 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2689
M204 S6000
G3 X130.895 Y138.895 I-1.242 J.317 E.03967
G3 X130.519 Y139.108 I-.727 J-.845 E.01441
G1 X125.729 Y139.143 E.1589
G3 X124.859 Y138.332 I.005 J-.878 E.04334
G1 X124.859 Y136.742 E.05275
G3 X126.69 Y136.864 I.847 J1.095 E.06653
G1 X127.345 Y137.538 E.0312
G2 X128.983 Y137.758 I1.024 J-1.426 E.05707
G2 X129.966 Y136.806 I-4.256 J-5.381 E.04544
G1 X130.621 Y136.492 E.02411
G1 X131.142 Y136.469 E.01732
G1 X131.142 Y134.122 E.07786
G2 X129.31 Y134.243 I-.847 J1.096 E.06657
G1 X128.655 Y134.918 E.0312
G3 X127.017 Y135.137 I-1.024 J-1.426 E.05707
G3 X126.035 Y134.186 I4.256 J-5.381 E.04544
G1 X125.379 Y133.871 E.02411
G1 X124.859 Y133.848 E.01729
G1 X124.859 Y131.501 E.07787
G3 X126.69 Y131.622 I.847 J1.095 E.06655
G1 X127.345 Y132.297 E.0312
G2 X128.983 Y132.516 I1.024 J-1.426 E.05707
G2 X129.966 Y131.565 I-4.255 J-5.38 E.04544
G1 X130.621 Y131.25 E.02411
G1 X131.142 Y131.227 E.01731
G1 X131.142 Y128.88 E.07786
G2 X129.31 Y129.002 I-.847 J1.095 E.06656
G1 X128.655 Y129.677 E.0312
M73 P70 R3
G3 X127.017 Y129.896 I-1.024 J-1.426 E.05707
G3 X126.035 Y128.944 I4.256 J-5.381 E.04544
G1 X125.379 Y128.63 E.02411
G1 X124.858 Y128.607 E.0173
G1 X124.858 Y126.26 E.07786
G3 X126.69 Y126.381 I.847 J1.096 E.06656
G1 X127.345 Y127.056 E.0312
G2 X128.983 Y127.275 I1.024 J-1.426 E.05707
G2 X129.966 Y126.324 I-4.256 J-5.381 E.04544
G1 X130.621 Y126.009 E.02411
G1 X131.142 Y125.986 E.01729
G1 X131.141 Y123.639 E.07787
G2 X129.31 Y123.76 I-.847 J1.095 E.06654
G1 X128.655 Y124.435 E.0312
G3 X127.017 Y124.654 I-1.024 J-1.426 E.05707
G3 X126.035 Y123.703 I4.256 J-5.381 E.04544
G1 X125.379 Y123.388 E.02411
G1 X124.858 Y123.365 E.01732
G1 X124.858 Y121.018 E.07785
G3 X126.69 Y121.14 I.848 J1.096 E.06658
G1 X127.345 Y121.815 E.0312
G2 X128.983 Y122.034 I1.024 J-1.426 E.05707
G2 X129.966 Y121.083 I-4.255 J-5.38 E.04544
G1 X130.621 Y120.768 E.02411
G1 X131.141 Y120.745 E.01728
G1 X131.141 Y118.397 E.07788
G2 X129.31 Y118.519 I-.846 J1.095 E.06653
G1 X128.655 Y119.194 E.0312
G3 X127.017 Y119.413 I-1.024 J-1.426 E.05707
G3 X126.035 Y118.462 I4.256 J-5.381 E.04544
G1 X125.379 Y118.147 E.02411
G1 X124.857 Y118.124 E.01733
G3 X125.725 Y116.857 I.97 J-.266 E.05794
G1 X127.938 Y116.858 E.07341
G1 X128.655 Y116.917 E.02388
G1 X128.809 Y116.859 E.00545
G3 X130.436 Y116.872 I.752 J7.36 E.0541
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X128.809 Y116.859 E-.61851
G1 X128.655 Y116.917 E-.06246
G1 X128.448 Y116.9 E-.07903
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/35
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2 I-1.211 J.123 P1  F42000
G1 X130.735 Y139.405 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2718
M204 S6000
G3 X130.287 Y139.491 I-.446 J-1.116 E.01522
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06284
G1 X130.334 Y116.511 E.1533
G3 X131.491 Y117.713 I-.034 J1.19 E.06131
G1 X131.491 Y138.287 E.68249
G3 X130.79 Y139.381 I-1.201 J.002 E.04554
M204 S10000
G1 X130.882 Y139.784 F42000
G1 F2718
M204 S6000
G3 X130.292 Y139.898 I-.594 J-1.496 E.02005
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.602 J-.004 E.08372
G1 X130.346 Y116.104 E.15387
G3 X131.898 Y117.708 I-.046 J1.597 E.08196
G1 X131.898 Y138.292 E.68282
G3 X130.938 Y139.761 I-1.61 J-.004 E.06157
M204 S250
G1 X131.061 Y140.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2718
M204 S5000
G1 X131.024 Y140.149 E.00123
G3 X130.297 Y140.29 I-.738 J-1.863 E.02288
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.994 J.001 E.09617
G1 X130.358 Y115.712 E.14304
G3 X132.29 Y117.703 I-.058 J1.99 E.09433
G1 X132.29 Y138.297 E.6328
G3 X131.37 Y139.972 I-2.004 J-.011 E.06119
G1 X131.114 Y140.106 E.00889
; WIPE_START
G1 F3000
M204 S6000
G1 X131.024 Y140.149 E-.03792
G1 X130.63 Y140.262 E-.15551
G1 X130.297 Y140.29 E-.12711
G1 X129.141 Y140.29 E-.43947
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


G1 X131.143 Y137.65 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2718
M204 S6000
G3 X130.889 Y138.901 I-1.678 J.31 E.04338
G3 X130.621 Y139.062 I-.521 J-.563 E.01044
G1 X129.966 Y138.9 E.02239
G2 X129.368 Y139.143 I-.089 J.637 E.02241
G1 X125.729 Y139.143 E.12072
G3 X124.859 Y138.332 I-.02 J-.85 E.04367
G1 X124.859 Y136.799 E.05086
G3 X126.362 Y136.319 I1.298 J1.471 E.05386
M73 P71 R3
G1 X126.69 Y136.565 E.0136
G1 X127.345 Y137.454 E.03662
G2 X128.983 Y138.026 I1.44 J-1.49 E.05938
G1 X129.31 Y137.78 E.0136
G1 X129.966 Y136.891 E.03662
G1 X130.621 Y136.441 E.02636
G1 X131.142 Y136.312 E.01783
G1 X131.142 Y134.179 E.07077
G2 X129.638 Y133.698 I-1.299 J1.471 E.05391
G1 X129.31 Y133.945 E.0136
G1 X128.655 Y134.833 E.03662
G3 X127.017 Y135.405 I-1.44 J-1.49 E.05938
G1 X126.69 Y135.159 E.0136
G1 X126.035 Y134.27 E.03662
G1 X125.379 Y133.821 E.02636
G1 X124.859 Y133.692 E.01779
G1 X124.859 Y131.558 E.0708
G3 X126.362 Y131.078 I1.298 J1.471 E.05388
G1 X126.69 Y131.324 E.0136
G1 X127.345 Y132.213 E.03662
G2 X128.983 Y132.785 I1.44 J-1.49 E.05938
G1 X129.31 Y132.538 E.0136
G1 X129.966 Y131.65 E.03662
G1 X130.621 Y131.2 E.02636
G1 X131.142 Y131.071 E.01781
G1 X131.142 Y128.937 E.07079
G2 X129.638 Y128.457 I-1.298 J1.471 E.05389
G1 X129.31 Y128.703 E.0136
G1 X128.655 Y129.592 E.03662
G3 X127.017 Y130.164 I-1.44 J-1.49 E.05938
G1 X126.69 Y129.918 E.0136
G1 X126.035 Y129.029 E.03662
G1 X125.379 Y128.579 E.02636
G1 X124.858 Y128.45 E.01781
G1 X124.858 Y126.317 E.07079
G3 X126.362 Y125.836 I1.299 J1.472 E.0539
G1 X126.69 Y126.083 E.0136
G1 X127.345 Y126.971 E.03662
G2 X128.983 Y127.543 I1.439 J-1.49 E.05938
G1 X129.31 Y127.297 E.0136
G1 X129.966 Y126.408 E.03662
G1 X130.621 Y125.959 E.02636
G1 X131.142 Y125.83 E.0178
G1 X131.141 Y123.695 E.0708
G2 X129.638 Y123.216 I-1.298 J1.472 E.05387
G1 X129.31 Y123.462 E.0136
G1 X128.655 Y124.351 E.03662
G3 X127.017 Y124.923 I-1.439 J-1.49 E.05938
G1 X126.69 Y124.676 E.0136
G1 X126.035 Y123.788 E.03662
G1 X125.379 Y123.338 E.02636
G1 X124.858 Y123.209 E.01782
G1 X124.858 Y121.076 E.07077
G3 X126.362 Y120.595 I1.299 J1.472 E.05392
G1 X126.69 Y120.841 E.0136
G1 X127.345 Y121.73 E.03662
G2 X128.983 Y122.302 I1.439 J-1.49 E.05938
G1 X129.31 Y122.056 E.0136
G1 X129.966 Y121.167 E.03662
G1 X130.621 Y120.717 E.02636
G1 X131.141 Y120.589 E.01778
G1 X131.141 Y118.454 E.07082
G2 X129.638 Y117.974 I-1.298 J1.471 E.05386
G1 X129.31 Y118.221 E.0136
G1 X128.655 Y119.109 E.03662
G3 X127.017 Y119.682 I-1.439 J-1.49 E.05938
G1 X126.69 Y119.435 E.0136
G1 X126.035 Y118.546 E.03662
G1 X125.379 Y118.097 E.02636
G1 X124.857 Y117.968 E.01784
G3 X125.728 Y116.857 I.888 J-.2 E.05355
G1 X127.883 Y116.858 E.07148
G1 X128 Y116.938 E.00471
G1 X128.655 Y117.1 E.02239
G2 X129.252 Y116.859 I.089 J-.636 E.02236
G3 X130.462 Y116.875 I.53 J5.584 E.04024
G3 X130.833 Y117.055 I-.205 J.893 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.462 Y116.875 E-.15665
G1 X129.252 Y116.859 E-.46012
G1 X128.983 Y117.061 E-.12785
G1 X128.943 Y117.066 E-.01539
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/35
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-1.213 J.098 P1  F42000
G1 X130.755 Y139.399 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2745
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.008 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06284
G1 X130.329 Y116.511 E.15314
G3 X131.491 Y117.713 I-.032 J1.193 E.06143
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.195 J.009 E.04492
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F2745
M204 S6000
G3 X130.292 Y139.898 I-.615 J-1.479 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.602 J-.004 E.08372
G1 X130.341 Y116.103 E.1537
G3 X131.898 Y117.708 I-.045 J1.601 E.08207
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.602 J.004 E.06067
M204 S250
G1 X131.063 Y140.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2745
M204 S5000
G1 X131.061 Y140.137 E.00007
G3 X130.297 Y140.29 I-.765 J-1.842 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.994 J.001 E.09617
G1 X130.353 Y115.711 E.14288
G3 X132.29 Y117.703 I-.058 J1.994 E.09443
G1 X132.29 Y138.297 E.6328
G3 X131.237 Y140.054 I-1.994 J-.001 E.06608
G1 X131.117 Y140.112 E.0041
; WIPE_START
G1 F3000
M204 S6000
G1 X131.061 Y140.137 E-.02347
G1 X130.877 Y140.204 E-.07422
G1 X130.635 Y140.261 E-.0945
G1 X130.297 Y140.29 E-.12898
M73 P72 R3
G1 X129.142 Y140.29 E-.43883
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


G1 X127.223 Y139.143 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2745
M204 S6000
G3 X125.596 Y139.13 I-.747 J-8.598 E.05408
G1 X125.051 Y138.834 E.02056
G3 X124.859 Y138.332 I.684 J-.549 E.01813
G1 X124.859 Y136.862 E.04877
G1 X125.148 Y136.517 E.01492
G1 X126.355 Y135.862 E.04554
G2 X126.425 Y135.207 I-.443 J-.379 E.02323
G2 X124.859 Y133.488 I-2.578 J.777 E.07977
G1 X124.859 Y131.621 E.06194
G1 X125.148 Y131.276 E.01495
G1 X126.355 Y130.621 E.04554
G2 X126.425 Y129.966 I-.443 J-.379 E.02323
G2 X124.858 Y128.247 I-2.578 J.777 E.07978
G1 X124.858 Y126.38 E.06192
G1 X125.148 Y126.035 E.01497
G1 X126.355 Y125.38 E.04554
G2 X126.425 Y124.724 I-.443 J-.379 E.02323
G2 X124.858 Y123.005 I-2.578 J.777 E.0798
G1 X124.858 Y121.139 E.06189
G1 X125.148 Y120.793 E.01499
G1 X126.355 Y120.138 E.04554
G2 X126.425 Y119.483 I-.443 J-.379 E.02323
G2 X124.857 Y117.764 I-2.578 J.777 E.07982
G3 X125.946 Y116.857 I.89 J-.037 E.0543
M204 S10000
G1 X130.777 Y117.009 F42000
G1 F2745
M204 S6000
G3 X131.078 Y117.381 I-.597 J.792 E.01604
G3 X131.141 Y118.517 I-2.39 J.701 E.03807
G1 X130.852 Y118.173 E.01491
G1 X129.645 Y117.518 E.04554
G3 X129.576 Y116.859 I.713 J-.408 E.02262
G1 X127.765 Y116.858 E.06007
G1 X128.976 Y117.518 E.04572
G1 X129.113 Y117.845 E.01179
G3 X128.231 Y119.483 I-2.986 J-.551 E.06272
G1 X127.025 Y120.138 E.04554
G1 X126.887 Y120.466 E.01179
G2 X127.769 Y122.104 I2.986 J-.551 E.06272
G1 X128.976 Y122.759 E.04554
G1 X129.113 Y123.086 E.01179
G3 X128.231 Y124.724 I-2.986 J-.551 E.06272
G1 X127.025 Y125.38 E.04554
G1 X126.887 Y125.707 E.01179
G2 X127.769 Y127.345 I2.986 J-.551 E.06272
G1 X128.976 Y128 E.04554
G1 X129.113 Y128.328 E.01179
G3 X128.231 Y129.966 I-2.986 J-.551 E.06272
G1 X127.025 Y130.621 E.04554
G1 X126.887 Y130.948 E.01179
G2 X127.769 Y132.586 I2.986 J-.551 E.06272
G1 X128.976 Y133.241 E.04554
G1 X129.113 Y133.569 E.01179
G3 X128.231 Y135.207 I-2.986 J-.551 E.06272
G1 X127.025 Y135.862 E.04554
M73 P73 R3
G1 X126.887 Y136.19 E.01179
G2 X127.769 Y137.828 I2.986 J-.551 E.06272
G1 X128.976 Y138.483 E.04554
G3 X129.044 Y139.143 I-.712 J.408 E.02265
G1 X130.273 Y139.143 E.04074
G2 X130.679 Y139.044 I-.073 J-1.195 E.01395
G1 X129.645 Y138.483 E.03903
G1 X129.508 Y138.155 E.01179
G3 X130.39 Y136.517 I2.986 J.551 E.06272
G1 X131.142 Y136.109 E.02842
G1 X131.142 Y134.243 E.0619
G1 X130.852 Y133.897 E.01498
G1 X129.645 Y133.241 E.04554
G1 X129.508 Y132.914 E.01179
G3 X130.39 Y131.276 I2.986 J.551 E.06272
G1 X131.142 Y130.867 E.0284
G1 X131.142 Y129.001 E.06192
G1 X130.852 Y128.655 E.01496
G1 X129.645 Y128 E.04554
G1 X129.508 Y127.673 E.01179
G3 X130.39 Y126.035 I2.986 J.551 E.06272
G1 X131.142 Y125.626 E.02838
G1 X131.141 Y123.759 E.06195
G1 X130.852 Y123.414 E.01494
G1 X129.645 Y122.759 E.04554
G1 X129.508 Y122.431 E.01179
G3 X130.39 Y120.793 I2.986 J.551 E.06272
G1 X131.141 Y120.385 E.02837
G1 X131.141 Y122.014 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.141 Y120.385 E-.61876
G1 X130.814 Y120.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/35
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.4 I-1.217 J-.004 P1  F42000
G1 X130.755 Y139.399 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2670
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15175
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.008 E.06283
G1 X130.325 Y116.51 E.15299
G3 X131.491 Y117.713 I-.025 J1.191 E.06162
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.374 I-1.195 J.008 E.04491
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F2670
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.336 Y116.103 E.15354
G3 X131.898 Y117.708 I-.037 J1.598 E.08228
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06065
M204 S250
G1 X131.063 Y140.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X131.061 Y140.137 E.00006
G3 X130.297 Y140.29 I-.767 J-1.843 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.348 Y115.711 E.14273
G3 X132.29 Y117.703 I-.048 J1.99 E.09464
G1 X132.29 Y138.297 E.6328
G3 X131.363 Y139.979 I-1.996 J-.003 E.06157
G1 X131.116 Y140.11 E.0086
; WIPE_START
G1 F3000
M204 S6000
G1 X131.061 Y140.137 E-.0232
G1 X130.878 Y140.204 E-.07425
G1 X130.64 Y140.26 E-.09265
G1 X130.297 Y140.29 E-.13084
G1 X129.142 Y140.29 E-.43906
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


G1 X127.318 Y139.143 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G3 X125.689 Y139.139 I-.794 J-8.606 E.05409
G1 X124.892 Y138.483 E.03426
G3 X124.859 Y138.325 I.135 J-.11 E.00557
G1 X124.859 Y136.862 E.04852
G1 X125.07 Y136.517 E.0134
G2 X126.129 Y135.535 I-1.787 J-2.987 E.04827
G1 X126.203 Y135.207 E.01115
G2 X125.689 Y133.897 I-1.909 J-.006 E.04783
G1 X124.859 Y133.2 E.03595
G1 X124.859 Y131.621 E.05237
G1 X125.07 Y131.276 E.01343
G2 X126.129 Y130.293 I-1.787 J-2.987 E.04827
G1 X126.203 Y129.966 E.01115
G2 X125.689 Y128.655 I-1.909 J-.006 E.04783
G1 X124.858 Y127.958 E.03597
G1 X124.858 Y126.381 E.05233
G1 X125.07 Y126.035 E.01346
M73 P73 R2
G2 X126.129 Y125.052 I-1.787 J-2.987 E.04827
G1 X126.203 Y124.724 E.01115
G2 X125.689 Y123.414 I-1.909 J-.006 E.04783
G1 X124.858 Y122.716 E.03599
G1 X124.858 Y121.14 E.05229
G1 X125.07 Y120.793 E.01349
G2 X126.129 Y119.811 I-1.787 J-2.987 E.04827
G1 X126.203 Y119.483 E.01115
G2 X125.689 Y118.173 I-1.909 J-.006 E.04783
G1 X124.883 Y117.507 E.03468
G3 X125.728 Y116.857 I.844 J.224 E.03801
G1 X127.691 Y116.862 E.06512
G3 X128.749 Y117.845 I-1.787 J2.987 E.04827
G1 X128.824 Y118.173 E.01115
G3 X128.309 Y119.483 I-1.909 J.006 E.04783
G2 X127.251 Y120.466 I1.787 J2.987 E.04827
G1 X127.176 Y120.793 E.01115
G2 X127.691 Y122.104 I1.909 J.006 E.04783
G3 X128.749 Y123.086 I-1.787 J2.987 E.04827
M73 P74 R2
G1 X128.824 Y123.414 E.01115
G3 X128.309 Y124.724 I-1.909 J.006 E.04783
G2 X127.251 Y125.707 I1.788 J2.987 E.04827
G1 X127.176 Y126.035 E.01115
G2 X127.691 Y127.345 I1.909 J.006 E.04783
G3 X128.749 Y128.328 I-1.787 J2.987 E.04827
G1 X128.824 Y128.655 E.01115
G3 X128.309 Y129.966 I-1.909 J.006 E.04783
G2 X127.251 Y130.948 I1.787 J2.987 E.04827
G1 X127.176 Y131.276 E.01115
G2 X127.691 Y132.586 I1.909 J.006 E.04783
G3 X128.749 Y133.569 I-1.787 J2.987 E.04827
G1 X128.824 Y133.897 E.01115
G3 X128.309 Y135.207 I-1.909 J.006 E.04783
G2 X127.251 Y136.19 I1.788 J2.987 E.04827
G1 X127.176 Y136.517 E.01115
G2 X127.691 Y137.828 I1.909 J.006 E.04783
G3 X128.749 Y138.81 I-1.788 J2.987 E.04827
G3 X128.823 Y139.143 I-.361 J.255 E.01159
G2 X130.444 Y139.128 I.724 J-9.364 E.05385
G2 X130.762 Y139 I-.146 J-.82 E.01144
G3 X129.871 Y138.155 I1.546 J-2.521 E.04101
G1 X129.797 Y137.828 E.01115
G3 X130.311 Y136.517 I1.909 J-.006 E.04783
G1 X131.142 Y135.82 E.036
G1 X131.142 Y134.243 E.05229
G1 X130.93 Y133.897 E.01348
G3 X129.871 Y132.914 I1.788 J-2.987 E.04827
G1 X129.797 Y132.586 E.01115
G3 X130.311 Y131.276 I1.909 J-.006 E.04783
G1 X131.142 Y130.579 E.03597
G1 X131.142 Y129.001 E.05233
G1 X130.93 Y128.655 E.01345
G3 X129.871 Y127.673 I1.787 J-2.987 E.04827
G1 X129.797 Y127.345 E.01115
G3 X130.311 Y126.035 I1.909 J-.006 E.04783
G1 X131.142 Y125.338 E.03595
G1 X131.141 Y123.759 E.05237
G1 X130.93 Y123.414 E.01342
G3 X129.871 Y122.431 I1.788 J-2.987 E.04827
G1 X129.797 Y122.104 E.01115
G3 X130.311 Y120.793 I1.909 J-.006 E.04783
G1 X131.141 Y120.097 E.03593
G1 X131.141 Y118.517 E.05242
G1 X130.93 Y118.173 E.01339
G3 X129.871 Y117.19 I1.787 J-2.987 E.04827
G3 X129.797 Y116.859 I.359 J-.254 E.01157
G3 X130.969 Y117.19 I.3 J1.174 E.0423
G3 X131.117 Y117.509 I-.887 J.608 E.01173
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.969 Y117.19 E-.13372
G1 X130.746 Y116.988 E-.1143
G1 X130.463 Y116.875 E-.11574
G1 X129.797 Y116.859 E-.25292
G1 X129.871 Y117.19 E-.12906
G1 X129.895 Y117.219 E-.01425
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/35
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I-1.216 J.045 P1  F42000
G1 X130.724 Y139.411 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2639
M204 S6000
G3 X130.287 Y139.491 I-.431 J-1.118 E.01482
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06284
G1 X130.32 Y116.51 E.15284
G3 X131.491 Y117.713 I-.023 J1.193 E.06174
G1 X131.491 Y138.287 E.68249
G3 X130.779 Y139.388 I-1.198 J.006 E.04599
M204 S10000
G1 X130.883 Y139.785 F42000
G1 F2639
M204 S6000
G1 X130.87 Y139.79 E.00045
G3 X130.292 Y139.898 I-.578 J-1.499 E.01961
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.602 J-.004 E.08372
G1 X130.332 Y116.103 E.15338
G3 X131.898 Y117.708 I-.035 J1.601 E.08239
G1 X131.898 Y138.292 E.68282
G3 X131.149 Y139.65 I-1.606 J0 E.05367
G1 X130.936 Y139.758 E.00793
M204 S250
G1 X131.057 Y140.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2639
M204 S5000
G1 X131.011 Y140.156 E.00158
G3 X130.297 Y140.29 I-.72 J-1.865 E.02243
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.994 J.001 E.09617
G1 X130.343 Y115.711 E.14257
G3 X132.29 Y117.703 I-.048 J1.994 E.09474
G1 X132.29 Y138.297 E.6328
G3 X131.358 Y139.981 I-2 J-.007 E.06168
G1 X131.111 Y140.107 E.00855
; WIPE_START
G1 F3000
M204 S6000
G1 X131.011 Y140.156 E-.04229
G1 X130.645 Y140.259 E-.14435
G1 X130.297 Y140.29 E-.13273
G1 X129.138 Y140.29 E-.44063
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


G1 X127.408 Y139.143 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2639
M204 S6000
G1 X125.777 Y139.138 E.05408
G3 X124.859 Y138.134 I6.626 J-6.981 E.04518
G1 X124.859 Y136.812 E.04384
G1 X124.981 Y136.517 E.01059
G2 X126.036 Y135.207 I-2.343 J-2.966 E.05627
G2 X125.777 Y133.897 I-1.623 J-.36 E.04559
G3 X124.859 Y132.891 I6.516 J-6.878 E.04521
G1 X124.859 Y131.572 E.04377
G1 X124.981 Y131.276 E.01063
G2 X126.036 Y129.966 I-2.343 J-2.966 E.05627
G2 X125.777 Y128.655 I-1.623 J-.36 E.04559
G3 X124.858 Y127.649 I6.41 J-6.779 E.04525
G1 X124.858 Y126.332 E.0437
G1 X124.981 Y126.035 E.01067
M73 P75 R2
G2 X126.036 Y124.724 I-2.342 J-2.965 E.05627
G2 X125.777 Y123.414 I-1.623 J-.36 E.04559
G3 X124.858 Y122.407 I6.309 J-6.685 E.04528
G1 X124.858 Y121.091 E.04364
G1 X124.981 Y120.793 E.0107
G2 X126.036 Y119.483 I-2.343 J-2.966 E.05627
G2 X125.777 Y118.173 I-1.623 J-.36 E.04559
G3 X124.962 Y117.298 I7.879 J-8.166 E.03968
G3 X125.727 Y116.857 I.771 J.452 E.03065
G1 X127.602 Y116.862 E.06219
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
G1 X128.657 Y139.143 E.00015
G2 X130.453 Y139.127 I.807 J-10.177 E.05965
G2 X130.836 Y138.947 I-.498 J-1.556 E.01407
G3 X129.964 Y137.828 I2.051 J-2.497 E.04744
G3 X130.223 Y136.517 I1.623 J-.36 E.04559
G2 X131.142 Y135.51 I-6.298 J-6.674 E.04529
G1 X131.142 Y134.194 E.04364
G1 X131.019 Y133.897 E.01069
G3 X129.964 Y132.586 I2.343 J-2.966 E.05627
G3 X130.223 Y131.276 I1.623 J-.36 E.04559
G2 X131.142 Y130.27 I-6.395 J-6.765 E.04525
G1 X131.142 Y128.952 E.04371
G1 X131.019 Y128.655 E.01065
G3 X129.964 Y127.345 I2.343 J-2.966 E.05627
G3 X130.223 Y126.035 I1.623 J-.36 E.04559
G2 X131.141 Y125.029 I-6.497 J-6.861 E.04522
G1 X131.141 Y123.71 E.04378
G1 X131.019 Y123.414 E.01061
G3 X129.964 Y122.104 I2.343 J-2.966 E.05627
G3 X130.223 Y120.793 I1.623 J-.36 E.04559
G2 X131.141 Y119.789 I-6.609 J-6.965 E.04518
G1 X131.141 Y118.467 E.04385
G1 X131.019 Y118.173 E.01058
G3 X129.964 Y116.862 I2.343 J-2.966 E.05627
G1 X129.964 Y116.858 E.00013
G3 X131.141 Y117.673 I.238 J.913 E.0539
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.003 Y117.24 E-.17299
G1 X130.767 Y117.001 E-.12745
G1 X130.463 Y116.875 E-.12506
G1 X129.964 Y116.858 E-.18983
G1 X129.964 Y116.862 E-.00149
G1 X130.11 Y117.19 E-.1363
G1 X130.122 Y117.203 E-.00688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/35
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.8 I-1.216 J.035 P1  F42000
G1 X130.755 Y139.399 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2626
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.008 E.06284
G1 X130.316 Y116.51 E.15269
G3 X131.491 Y117.713 I-.016 J1.191 E.06192
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.195 J.008 E.04492
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F2626
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.327 Y116.103 E.15323
G3 X131.898 Y117.708 I-.027 J1.598 E.0826
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06066
M204 S250
G1 X131.061 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2626
M204 S5000
G1 X130.688 Y140.251 E.01196
G3 X130.297 Y140.29 I-.394 J-1.957 E.01209
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.338 Y115.711 E.14242
G3 X132.29 Y117.703 I-.038 J1.99 E.09495
G1 X132.29 Y138.297 E.6328
G3 X131.114 Y140.114 I-1.996 J-.003 E.07027
; WIPE_START
G1 F3000
M204 S6000
G1 X130.688 Y140.251 E-.17008
G1 X130.297 Y140.29 E-.14929
G1 X129.138 Y140.29 E-.44063
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


G1 X127.51 Y139.143 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2626
M204 S6000
G1 X125.881 Y139.138 E.05405
G3 X124.859 Y137.834 I38.953 J-31.587 E.05495
G1 X124.878 Y136.517 E.04369
G2 X125.905 Y135.207 I-39.108 J-31.712 E.05523
M73 P76 R2
G2 X125.359 Y133.241 I-1.705 J-.585 E.07193
G1 X124.859 Y132.592 E.02718
G1 X124.878 Y131.276 E.04367
G2 X125.905 Y129.966 I-39.125 J-31.725 E.05523
G2 X125.359 Y128 I-1.705 J-.585 E.07193
G1 X124.858 Y127.351 E.0272
G1 X124.878 Y126.035 E.04366
G2 X125.905 Y124.724 I-39.108 J-31.712 E.05523
G2 X125.359 Y122.759 I-1.705 J-.585 E.07193
G1 X124.858 Y122.109 E.02723
G1 X124.878 Y120.793 E.04364
G2 X125.905 Y119.483 I-39.125 J-31.725 E.05523
G2 X125.359 Y117.518 I-1.705 J-.585 E.07193
G1 X125.075 Y117.149 E.01545
G3 X125.727 Y116.857 I.669 J.621 E.02436
G1 X127.498 Y116.862 E.05876
G3 X128.526 Y118.173 I-39.148 J31.744 E.05523
G3 X127.979 Y120.138 I-1.705 J.585 E.07193
G1 X127.475 Y120.793 E.02744
G2 X128.021 Y122.759 I1.705 J.585 E.07193
G1 X128.526 Y123.414 E.02744
G3 X127.979 Y125.38 I-1.705 J.585 E.07193
G1 X127.475 Y126.035 E.02744
G2 X128.021 Y128 I1.705 J.585 E.07193
G1 X128.526 Y128.655 E.02744
G3 X127.979 Y130.621 I-1.705 J.585 E.07193
G1 X127.475 Y131.276 E.02744
G2 X128.021 Y133.241 I1.705 J.585 E.07193
G1 X128.526 Y133.897 E.02744
G3 X127.979 Y135.862 I-1.705 J.585 E.07193
G1 X127.475 Y136.517 E.02744
G2 X128.021 Y138.483 I1.705 J.585 E.07193
G1 X128.526 Y139.143 E.02758
G2 X130.424 Y139.132 I.874 J-13.493 E.06299
G2 X130.91 Y138.872 I-.145 J-.855 E.01862
G3 X130.095 Y137.828 I31.163 J-25.16 E.04393
G3 X130.641 Y135.862 I1.705 J-.585 E.07193
G1 X131.142 Y135.212 E.02723
G1 X131.122 Y133.897 E.04364
G3 X130.095 Y132.586 I39.143 J-31.739 E.05523
G3 X130.641 Y130.621 I1.705 J-.585 E.07193
G1 X131.142 Y129.971 E.0272
G1 X131.122 Y128.655 E.04365
G3 X130.095 Y127.345 I39.125 J-31.725 E.05523
G3 X130.641 Y125.38 I1.705 J-.585 E.07193
G1 X131.141 Y124.73 E.02718
G1 X131.122 Y123.414 E.04367
G3 X130.095 Y122.104 I39.143 J-31.739 E.05523
G3 X130.641 Y120.138 I1.705 J-.585 E.07193
G1 X131.141 Y119.49 E.02716
G1 X131.122 Y118.173 E.04369
G3 X130.094 Y116.858 I42.068 J-33.958 E.05535
G1 X128.466 Y116.858 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.094 Y116.858 E-.61876
G1 X130.323 Y117.151 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/35
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-1.217 J.024 P1  F42000
M73 P77 R2
G1 X130.771 Y139.393 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2634
M204 S6000
G3 X130.287 Y139.491 I-.473 J-1.095 E.01649
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.201 J-.002 E.06275
G1 X130.311 Y116.51 E.15253
G3 X131.491 Y117.713 I-.011 J1.191 E.06208
G1 X131.491 Y138.287 E.68249
G3 X130.825 Y139.368 I-1.193 J.011 E.0444
M204 S10000
G1 X130.935 Y139.766 F42000
G1 F2634
M204 S6000
G3 X130.292 Y139.898 I-.636 J-1.468 E.02192
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.61 J.004 E.08361
G1 X130.322 Y116.103 E.15306
G3 X131.898 Y117.708 I-.022 J1.598 E.08276
G1 X131.898 Y138.292 E.68282
G3 X130.989 Y139.741 I-1.6 J.006 E.05986
M204 S250
G1 X131.06 Y140.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2634
M204 S5000
G1 X130.688 Y140.251 E.01197
G3 X130.297 Y140.29 I-.39 J-1.953 E.01209
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.09621
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I2.004 J.011 E.09605
G1 X130.333 Y115.711 E.14227
G3 X132.29 Y117.703 I-.033 J1.99 E.0951
G1 X132.29 Y138.297 E.6328
G3 X131.116 Y140.114 I-1.992 J.001 E.07028
; WIPE_START
G1 F3000
M204 S6000
G1 X130.688 Y140.251 E-.17071
G1 X130.297 Y140.29 E-.14931
G1 X129.139 Y140.29 E-.43998
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


G1 X127.635 Y139.143 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2634
M204 S6000
G1 X126.007 Y139.143 E.05401
G2 X124.961 Y137.828 I-4.854 J2.786 E.05594
G1 X124.859 Y137.556 E.00963
G1 X124.859 Y136.296 E.0418
G3 X125.196 Y135.862 I.962 J.399 E.01844
G2 X126.007 Y133.897 I-1.203 J-1.646 E.0742
G2 X124.961 Y132.586 I-3.961 J2.088 E.05593
G1 X124.859 Y132.314 E.00967
G1 X124.859 Y131.056 E.04173
G3 X125.196 Y130.621 I.964 J.399 E.01847
G2 X126.007 Y128.655 I-1.203 J-1.646 E.0742
G2 X124.961 Y127.345 I-3.961 J2.088 E.05593
G1 X124.858 Y127.071 E.00971
G1 X124.858 Y125.815 E.04166
G3 X125.196 Y125.38 I.966 J.4 E.01851
G2 X126.007 Y123.414 I-1.203 J-1.646 E.0742
G2 X124.961 Y122.104 I-3.961 J2.088 E.05593
G1 X124.858 Y121.829 E.00975
G1 X124.858 Y120.575 E.04159
G3 X125.196 Y120.138 I.968 J.4 E.01854
G2 X126.007 Y118.173 I-1.203 J-1.646 E.0742
G2 X125.148 Y117.066 I-3.361 J1.72 E.04673
G3 X125.561 Y116.871 I.679 J.904 E.01526
G3 X127.373 Y116.858 I.986 J11.05 E.06015
G2 X128.418 Y118.173 I4.853 J-2.786 E.05594
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
G1 X130.275 Y139.143 E.0616
G2 X131.02 Y138.731 I.013 J-.857 E.02956
M73 P78 R2
G1 X130.804 Y138.483 E.01091
G3 X129.993 Y136.517 I1.203 J-1.646 E.0742
G3 X131.039 Y135.207 I3.961 J2.087 E.05593
G1 X131.142 Y134.932 E.00975
G1 X131.142 Y133.678 E.04161
G2 X130.804 Y133.241 I-.966 J.4 E.01852
G3 X129.993 Y131.276 I1.203 J-1.646 E.0742
G3 X131.039 Y129.966 I3.961 J2.087 E.05593
G1 X131.142 Y129.692 E.00971
G1 X131.142 Y128.435 E.04168
G2 X130.804 Y128 I-.965 J.399 E.01849
G3 X129.993 Y126.035 I1.203 J-1.646 E.0742
G3 X131.039 Y124.724 I3.961 J2.087 E.05593
G1 X131.141 Y124.452 E.00966
G1 X131.141 Y123.193 E.04175
G2 X130.804 Y122.759 I-.963 J.399 E.01845
G3 X129.993 Y120.793 I1.203 J-1.646 E.0742
G3 X131.039 Y119.483 I3.961 J2.087 E.05593
G1 X131.141 Y119.212 E.00962
G1 X131.141 Y117.951 E.04182
G2 X130.203 Y116.862 I-5.204 J3.536 E.04778
G1 X128.573 Y116.858 E.05407
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.203 Y116.862 E-.61935
G1 X130.444 Y117.143 E-.14065
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/35
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.2 I-1.217 J.017 P1  F42000
G1 X130.755 Y139.399 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3179
M204 S6000
G3 X130.287 Y139.491 I-.459 J-1.103 E.01592
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.009 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06284
G1 X130.306 Y116.51 E.15238
G3 X131.491 Y117.713 I-.007 J1.191 E.06224
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.195 J.009 E.04493
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F3179
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02106
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.317 Y116.103 E.1529
G3 X131.898 Y117.708 I-.018 J1.598 E.08292
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06066
M204 S250
G1 X131.06 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.69 Y140.25 E.01188
G3 X130.297 Y140.29 I-.396 J-1.956 E.01215
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.328 Y115.711 E.14211
G3 X132.29 Y117.703 I-.028 J1.99 E.09526
G1 X132.29 Y138.297 E.6328
G3 X131.114 Y140.114 I-1.996 J-.003 E.07029
; WIPE_START
M204 S6000
G1 X130.69 Y140.25 E-.16916
G1 X130.297 Y140.29 E-.15007
G1 X129.137 Y140.29 E-.44077
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


G1 X129.461 Y138.765 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3179
M204 S6000
G1 X130.262 Y138.765 E.02657
G2 X130.765 Y138.238 I.029 J-.476 E.02754
G3 X129.835 Y136.517 I1.281 J-1.805 E.06721
G1 X129.927 Y136.19 E.01129
G3 X130.765 Y135.366 I2.815 J2.024 E.03918
G1 X130.765 Y132.996 E.0786
G3 X129.835 Y131.276 I1.281 J-1.804 E.06719
G1 X129.927 Y130.948 E.01129
G3 X130.765 Y130.125 I2.813 J2.023 E.03916
G1 X130.765 Y127.755 E.07862
G3 X129.835 Y126.035 I1.281 J-1.804 E.06717
G1 X129.927 Y125.707 E.01129
G3 X130.764 Y124.884 I2.812 J2.022 E.03914
G1 X130.764 Y122.513 E.07865
G3 X129.835 Y120.793 I1.281 J-1.803 E.06715
G1 X129.927 Y120.466 E.01129
G3 X130.764 Y119.643 I2.811 J2.02 E.03912
G1 X130.764 Y118.015 E.05401
M204 S10000
G1 X130.276 Y116.873 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3179
M204 S6000
G1 X125.736 Y116.872 E.12579
G1 X125.317 Y116.976 E.01197
G1 X125.028 Y117.226 E.01058
G1 X124.896 Y117.551 E.00972
G1 X124.872 Y117.737 E.00521
G1 X124.874 Y138.319 E.57023
G1 X124.989 Y138.719 E.01154
G1 X125.296 Y139.012 E.01174
G2 X125.737 Y139.128 I.479 J-.923 E.01276
G1 X130.269 Y139.128 E.12555
G1 X130.688 Y139.027 E.01195
G1 X130.957 Y138.78 E.0101
G1 X131.104 Y138.452 E.00997
G1 X131.128 Y138.263 E.00528
M73 P79 R2
G1 X131.126 Y117.672 E.57049
G1 X131.003 Y117.288 E.01116
G1 X130.864 Y117.104 E.00642
G1 X130.588 Y116.931 E.009
G1 X130.335 Y116.884 E.00713
M204 S10000
G1 X125.236 Y133.988 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3179
M204 S6000
G1 X125.236 Y135.616 E.05401
G2 X126.165 Y133.897 I-1.282 J-1.803 E.06714
G2 X125.806 Y133.241 I-.934 J.087 E.0255
G1 X125.236 Y132.746 E.02505
G1 X125.236 Y130.375 E.07864
G2 X126.165 Y128.655 I-1.281 J-1.804 E.06716
G2 X125.806 Y128 I-.934 J.087 E.0255
G1 X125.235 Y127.504 E.02507
G1 X125.235 Y125.134 E.07862
G2 X126.165 Y123.414 I-1.281 J-1.804 E.06718
G2 X125.806 Y122.759 I-.934 J.087 E.0255
G1 X125.235 Y122.262 E.02509
G1 X125.235 Y119.893 E.07859
G2 X126.165 Y118.173 I-1.281 J-1.805 E.06721
G2 X125.524 Y117.273 I-1.508 J.396 E.03747
G1 X125.598 Y117.25 E.00257
G3 X125.738 Y117.235 I.119 J.455 E.00469
G1 X127.343 Y117.235 E.05324
G2 X128.327 Y118.173 I3.218 J-2.39 E.0453
G3 X128.693 Y119.811 I-1.407 J1.175 E.05783
G3 X127.673 Y120.793 I-3.367 J-2.475 E.04722
G2 X127.307 Y122.431 I1.407 J1.175 E.05783
G2 X128.327 Y123.414 I3.367 J-2.474 E.04722
G3 X128.693 Y125.052 I-1.407 J1.175 E.05783
G3 X127.673 Y126.035 I-3.367 J-2.474 E.04722
G2 X127.307 Y127.673 I1.407 J1.175 E.05783
G2 X128.327 Y128.655 I3.367 J-2.474 E.04722
G3 X128.693 Y130.293 I-1.407 J1.175 E.05783
G3 X127.673 Y131.276 I-3.367 J-2.475 E.04722
G2 X127.307 Y132.914 I1.407 J1.175 E.05783
G2 X128.327 Y133.897 I3.367 J-2.474 E.04722
G3 X128.693 Y135.535 I-1.407 J1.175 E.05783
G3 X127.673 Y136.517 I-3.367 J-2.474 E.04722
G2 X127.307 Y138.155 I1.407 J1.175 E.05783
G2 X127.899 Y138.765 I2.07 J-1.416 E.02834
G1 X126.036 Y138.765 E.06178
G2 X125.236 Y137.988 I-2.661 J1.936 E.03719
G1 X125.236 Y136.359 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X125.236 Y137.988 E-.61876
G1 X125.517 Y138.231 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/35
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I-.263 J1.188 P1  F42000
G1 X130.764 Y139.393 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.474 J-1.104 E.01626
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.011 J-1.193 E.06288
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.194 J-.01 E.06285
G1 X130.302 Y116.51 E.15222
G3 X131.491 Y117.713 I-.002 J1.191 E.06239
G1 X131.491 Y138.287 E.68249
G3 X130.819 Y139.368 I-1.201 J.002 E.0445
M204 S10000
G1 X130.916 Y139.77 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.628 J-1.483 E.02126
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.006 J-1.6 E.08376
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.601 J-.005 E.08374
G1 X130.312 Y116.103 E.15274
G3 X131.898 Y117.708 I-.013 J1.598 E.08308
G1 X131.898 Y138.292 E.68282
G3 X130.971 Y139.746 I-1.61 J-.004 E.06037
M204 S250
G1 X131.06 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.688 Y140.249 E.01192
G3 X130.297 Y140.29 I-.402 J-1.963 E.01209
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I-.001 J-1.992 E.0962
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.993 J0 E.09618
G1 X130.323 Y115.711 E.14195
G3 X132.29 Y117.703 I-.023 J1.991 E.09542
G1 X132.29 Y138.297 E.6328
G3 X131.112 Y140.112 I-2.004 J-.011 E.07023
; WIPE_START
M204 S6000
G1 X130.688 Y140.249 E-.16941
G1 X130.297 Y140.29 E-.1493
G1 X129.136 Y140.29 E-.44129
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


G1 X130.516 Y139.296 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40432
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X130.949 Y138.799 E.03446
G2 X131.121 Y138.27 I-.74 J-.534 E.0296
G1 X131.121 Y137.909 E.01886
G1 X130.067 Y139.121 E.08404
G1 X129.464 Y139.121 E.0315
G1 X131.121 Y137.217 E.13203
G1 X131.121 Y136.525 E.0362
G1 X128.862 Y139.121 E.18001
G1 X128.26 Y139.121 E.0315
G1 X131.121 Y135.833 E.228
G1 X131.121 Y135.141 E.0362
G1 X127.658 Y139.121 E.27599
G1 X127.055 Y139.121 E.0315
G1 X131.121 Y134.449 E.32398
G1 X131.121 Y133.757 E.0362
G1 X126.453 Y139.121 E.37197
G1 X125.851 Y139.121 E.0315
G1 X131.121 Y133.065 E.41996
G1 X131.121 Y132.373 E.0362
G1 X125.329 Y139.029 E.46155
M73 P80 R2
G3 X124.999 Y138.716 I.407 J-.76 E.02407
G1 X131.121 Y131.681 E.48785
G1 X131.121 Y130.989 E.0362
G1 X124.881 Y138.16 E.49726
G1 X124.881 Y137.468 E.0362
G1 X131.12 Y130.297 E.49726
G1 X131.12 Y129.605 E.0362
G1 X124.88 Y136.776 E.49726
G1 X124.88 Y136.084 E.0362
G1 X131.12 Y128.913 E.49726
G1 X131.12 Y128.221 E.0362
G1 X124.88 Y135.392 E.49726
G1 X124.88 Y134.7 E.0362
G1 X131.12 Y127.529 E.49726
G1 X131.12 Y126.837 E.0362
G1 X124.88 Y134.008 E.49726
G1 X124.88 Y133.316 E.0362
G1 X131.12 Y126.145 E.49726
G1 X131.12 Y125.453 E.0362
G1 X124.88 Y132.624 E.49726
G1 X124.88 Y131.932 E.0362
G1 X131.12 Y124.761 E.49726
G1 X131.12 Y124.069 E.0362
G1 X124.88 Y131.24 E.49726
G1 X124.88 Y130.548 E.0362
G1 X131.12 Y123.377 E.49726
G1 X131.12 Y122.685 E.0362
G1 X124.88 Y129.856 E.49726
G1 X124.88 Y129.164 E.0362
G1 X131.12 Y121.993 E.49726
G1 X131.12 Y121.301 E.0362
G1 X124.88 Y128.471 E.49726
G1 X124.88 Y127.779 E.0362
G1 X131.12 Y120.609 E.49726
G1 X131.12 Y119.917 E.0362
G1 X124.88 Y127.087 E.49726
G1 X124.88 Y126.395 E.0362
G1 X131.12 Y119.225 E.49726
G1 X131.119 Y118.532 E.0362
G1 X124.88 Y125.703 E.49726
G1 X124.879 Y125.011 E.0362
G1 X131.119 Y117.84 E.49726
G2 X131.001 Y117.285 I-.959 J-.086 E.03017
G1 X124.879 Y124.319 E.48781
G1 X124.879 Y123.627 E.0362
G1 X130.671 Y116.972 E.46151
G2 X130.149 Y116.88 I-.446 J1.001 E.028
G1 X124.879 Y122.935 E.41993
G1 X124.879 Y122.243 E.0362
G1 X129.547 Y116.879 E.37195
G1 X128.945 Y116.879 E.0315
G1 X124.879 Y121.551 E.32397
G1 X124.879 Y120.859 E.0362
G1 X128.342 Y116.879 E.27598
G1 X127.74 Y116.879 E.0315
G1 X124.879 Y120.167 E.228
G1 X124.879 Y119.475 E.0362
G1 X127.138 Y116.879 E.18002
G1 X126.536 Y116.879 E.0315
G1 X124.879 Y118.783 E.13204
G1 X124.879 Y118.091 E.0362
G1 X125.934 Y116.879 E.08406
G2 X125.092 Y117.155 I-.152 J.96 E.04813
G1 X124.686 Y117.621 E.03233
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X125.092 Y117.155 E-.23488
M73 P81 R2
G1 X125.244 Y117.019 E-.07766
G1 X125.462 Y116.915 E-.09159
G1 X125.579 Y116.889 E-.04566
G1 X125.934 Y116.879 E-.13474
G1 X125.631 Y117.227 E-.17546
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/35
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.6 I-1.186 J.274 P1  F42000
G1 X130.755 Y139.397 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.465 J-1.108 E.01591
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.008 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.194 J-.01 E.06286
G1 X130.297 Y116.51 E.15207
G3 X131.491 Y117.713 I.002 J1.192 E.06255
G1 X131.491 Y138.287 E.68249
G3 X130.809 Y139.373 I-1.201 J.002 E.04485
M204 S10000
G1 X130.91 Y139.773 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.622 J-1.485 E.02105
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.601 J-.005 E.08374
G1 X130.307 Y116.103 E.15258
G3 X131.898 Y117.708 I-.008 J1.599 E.08325
G1 X131.898 Y138.292 E.68282
G3 X130.965 Y139.749 I-1.61 J-.004 E.06057
M204 S250
G1 X131.059 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.669 Y140.253 E.01251
G3 X130.297 Y140.29 I-.382 J-1.967 E.01149
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.993 J0 E.09619
G1 X130.318 Y115.711 E.1418
G3 X132.29 Y117.703 I-.018 J1.991 E.09557
G1 X132.29 Y138.297 E.6328
G3 X131.111 Y140.113 I-2.004 J-.011 E.07027
; WIPE_START
M204 S6000
G1 X130.669 Y140.253 E-.17631
G1 X130.297 Y140.29 E-.14191
G1 X129.135 Y140.29 E-.44179
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


G1 X125.507 Y139.307 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42567
G1 F6788
M204 S6000
G1 X125.026 Y138.826 E.0212
G3 X124.844 Y138.103 I.809 J-.588 E.02383
G1 X125.899 Y139.158 E.04651
G1 X126.44 Y139.158 E.01688
G1 X124.844 Y137.562 E.07039
G1 X124.844 Y137.02 E.01688
G1 X126.981 Y139.158 E.09427
G1 X127.523 Y139.158 E.01688
G1 X124.844 Y136.479 E.11815
G1 X124.844 Y135.938 E.01688
G1 X128.064 Y139.158 E.14202
G1 X128.605 Y139.158 E.01688
G1 X124.844 Y135.396 E.1659
G1 X124.844 Y134.855 E.01688
G1 X129.146 Y139.158 E.18978
G1 X129.688 Y139.158 E.01688
G1 X124.844 Y134.314 E.21366
G1 X124.844 Y133.772 E.01688
G1 X130.229 Y139.158 E.23753
G2 X130.679 Y139.066 I.021 J-1.049 E.01444
G1 X124.844 Y133.231 E.25738
G1 X124.844 Y132.69 E.01688
G1 X130.977 Y138.823 E.27052
G2 X131.141 Y138.446 I-.691 J-.526 E.01295
G1 X124.844 Y132.148 E.27777
G1 X124.844 Y131.607 E.01688
G1 X131.158 Y137.921 E.2785
G1 X131.158 Y137.38 E.01688
G1 X124.844 Y131.066 E.2785
G1 X124.843 Y130.524 E.01688
G1 X131.157 Y136.838 E.2785
G1 X131.157 Y136.297 E.01688
G1 X124.843 Y129.983 E.2785
G1 X124.843 Y129.442 E.01688
G1 X131.157 Y135.756 E.2785
G1 X131.157 Y135.214 E.01688
M73 P82 R2
G1 X124.843 Y128.9 E.2785
G1 X124.843 Y128.359 E.01688
G1 X131.157 Y134.673 E.2785
G1 X131.157 Y134.132 E.01688
G1 X124.843 Y127.818 E.2785
G1 X124.843 Y127.276 E.01688
G1 X131.157 Y133.59 E.2785
G1 X131.157 Y133.049 E.01688
G1 X124.843 Y126.735 E.2785
G1 X124.843 Y126.194 E.01688
G1 X131.157 Y132.508 E.2785
G1 X131.157 Y131.966 E.01688
G1 X124.843 Y125.652 E.2785
G1 X124.843 Y125.111 E.01688
G1 X131.157 Y131.425 E.2785
G1 X131.157 Y130.884 E.01688
G1 X124.843 Y124.57 E.2785
G1 X124.843 Y124.028 E.01688
G1 X131.157 Y130.342 E.2785
G1 X131.157 Y129.801 E.01688
G1 X124.843 Y123.487 E.2785
G1 X124.843 Y122.946 E.01688
G1 X131.157 Y129.26 E.2785
G1 X131.157 Y128.718 E.01688
G1 X124.843 Y122.404 E.2785
G1 X124.843 Y121.863 E.01688
G1 X131.157 Y128.177 E.2785
G1 X131.157 Y127.636 E.01688
G1 X124.843 Y121.322 E.2785
G1 X124.843 Y120.78 E.01688
G1 X131.157 Y127.094 E.2785
G1 X131.157 Y126.553 E.01688
G1 X124.843 Y120.239 E.2785
M73 P82 R1
G1 X124.843 Y119.698 E.01688
G1 X131.157 Y126.012 E.2785
G1 X131.157 Y125.47 E.01688
G1 X124.843 Y119.156 E.2785
G1 X124.842 Y118.615 E.01688
G1 X131.156 Y124.929 E.2785
G1 X131.156 Y124.388 E.01688
G1 X124.842 Y118.074 E.2785
G3 X124.859 Y117.549 I2.775 J-.173 E.01639
G1 X131.156 Y123.846 E.27775
G1 X131.156 Y123.305 E.01688
G1 X125.026 Y117.175 E.27039
G3 X125.324 Y116.932 I.681 J.531 E.0121
G1 X131.156 Y122.764 E.25724
G1 X131.156 Y122.222 E.01688
G1 X125.776 Y116.842 E.2373
G1 X126.318 Y116.842 E.01688
G1 X131.156 Y121.681 E.21342
G1 X131.156 Y121.14 E.01688
G1 X126.859 Y116.843 E.18954
G1 X127.4 Y116.843 E.01688
G1 X131.156 Y120.598 E.16566
G1 X131.156 Y120.057 E.01688
G1 X127.942 Y116.843 E.14178
G1 X128.483 Y116.843 E.01688
G1 X131.156 Y119.516 E.1179
G1 X131.156 Y118.974 E.01688
G1 X129.024 Y116.843 E.09402
G1 X129.566 Y116.843 E.01688
G1 X131.156 Y118.433 E.07014
G1 X131.156 Y117.892 E.01688
G1 X130.107 Y116.843 E.04626
G3 X130.863 Y117.057 I.123 J1.006 E.02516
G1 X131.301 Y117.496 E.01933
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9405.616
G1 X130.863 Y117.057 E-.23557
G1 X130.743 Y116.969 E-.05655
G1 X130.587 Y116.894 E-.06568
G1 X130.422 Y116.853 E-.06485
G1 X130.107 Y116.843 E-.1196
G1 X130.512 Y117.248 E-.21776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/35
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-1.217 J.013 P1  F42000
G1 X130.755 Y139.4 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.457 J-1.102 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.009 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.009 E.06284
G1 X130.292 Y116.51 E.1519
G3 X131.491 Y117.713 I.005 J1.194 E.06268
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.375 I-1.193 J.011 E.04496
M204 S10000
G1 X130.911 Y139.776 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.613 J-1.477 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
M73 P83 R1
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.302 Y116.102 E.15241
G3 X131.898 Y117.708 I-.007 J1.602 E.08337
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.752 I-1.6 J.006 E.0607
M204 S250
G1 X131.059 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.674 Y140.254 E.01235
G3 X130.297 Y140.29 I-.376 J-1.956 E.01165
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.312 Y115.71 E.14164
G3 X132.29 Y117.703 I-.018 J1.995 E.09567
G1 X132.29 Y138.297 E.6328
G3 X131.114 Y140.115 I-1.992 J.001 E.07035
; WIPE_START
M204 S6000
G1 X130.674 Y140.254 E-.1753
G1 X130.297 Y140.29 E-.14388
G1 X129.137 Y140.29 E-.44083
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


G1 X130.501 Y139.306 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42577
G1 F6745
M204 S6000
G1 X130.904 Y138.903 E.01776
G2 X131.158 Y138.271 I-.758 J-.672 E.02167
G1 X131.158 Y138.108 E.0051
G1 X130.108 Y139.158 E.0463
G1 X129.567 Y139.158 E.01689
G1 X131.158 Y137.567 E.07019
G1 X131.158 Y137.025 E.01689
G1 X129.025 Y139.158 E.09408
G1 X128.484 Y139.158 E.01689
G1 X131.157 Y136.484 E.11796
G1 X131.157 Y135.943 E.01689
G1 X127.942 Y139.158 E.14185
G1 X127.401 Y139.158 E.01689
G1 X131.157 Y135.401 E.16573
G1 X131.157 Y134.86 E.01689
G1 X126.86 Y139.158 E.18962
G1 X126.318 Y139.158 E.01689
G1 X131.157 Y134.318 E.21351
G1 X131.157 Y133.777 E.01689
G1 X125.777 Y139.158 E.23739
G3 X125.325 Y139.068 I-.024 J-1.056 E.01448
G1 X131.157 Y133.236 E.25731
G1 X131.157 Y132.694 E.01689
G1 X125.026 Y138.825 E.27049
G3 X124.861 Y138.449 I.542 J-.462 E.013
G1 X131.157 Y132.153 E.27777
G1 X131.157 Y131.611 E.01689
G1 X124.844 Y137.924 E.27853
G1 X124.844 Y137.383 E.01689
G1 X131.157 Y131.07 E.27853
G1 X131.157 Y130.529 E.01689
G1 X124.844 Y136.842 E.27853
G1 X124.844 Y136.3 E.01689
G1 X131.157 Y129.987 E.27853
G1 X131.157 Y129.446 E.01689
G1 X124.844 Y135.759 E.27853
G1 X124.844 Y135.217 E.01689
G1 X131.157 Y128.905 E.27853
G1 X131.157 Y128.363 E.01689
G1 X124.844 Y134.676 E.27853
G1 X124.844 Y134.135 E.01689
G1 X131.157 Y127.822 E.27853
G1 X131.157 Y127.28 E.01689
G1 X124.844 Y133.593 E.27853
G1 X124.844 Y133.052 E.01689
G1 X131.157 Y126.739 E.27853
G1 X131.157 Y126.198 E.01689
G1 X124.844 Y132.511 E.27853
G1 X124.844 Y131.969 E.01689
G1 X131.157 Y125.656 E.27853
G1 X131.157 Y125.115 E.01689
G1 X124.844 Y131.428 E.27853
G1 X124.844 Y130.886 E.01689
G1 X131.156 Y124.573 E.27853
G1 X131.156 Y124.032 E.01689
G1 X124.843 Y130.345 E.27853
G1 X124.843 Y129.804 E.01689
G1 X131.156 Y123.491 E.27853
G1 X131.156 Y122.949 E.01689
G1 X124.843 Y129.262 E.27853
G1 X124.843 Y128.721 E.01689
G1 X131.156 Y122.408 E.27853
G1 X131.156 Y121.867 E.01689
G1 X124.843 Y128.179 E.27853
G1 X124.843 Y127.638 E.01689
G1 X131.156 Y121.325 E.27853
G1 X131.156 Y120.784 E.01689
G1 X124.843 Y127.097 E.27853
G1 X124.843 Y126.555 E.01689
G1 X131.156 Y120.242 E.27853
M73 P84 R1
G1 X131.156 Y119.701 E.01689
G1 X124.843 Y126.014 E.27853
G1 X124.843 Y125.473 E.01689
G1 X131.156 Y119.16 E.27853
G1 X131.156 Y118.618 E.01689
G1 X124.843 Y124.931 E.27853
G1 X124.843 Y124.39 E.01689
G1 X131.156 Y118.077 E.27853
G2 X131.139 Y117.552 I-1.778 J-.205 E.01643
G1 X124.843 Y123.848 E.27778
G1 X124.843 Y123.307 E.01689
G1 X130.975 Y117.175 E.27053
G2 X130.674 Y116.935 I-.703 J.571 E.01211
G1 X124.843 Y122.766 E.25726
G1 X124.843 Y122.224 E.01689
G1 X130.224 Y116.843 E.23743
G1 X129.683 Y116.843 E.01689
G1 X124.843 Y121.683 E.21354
G1 X124.843 Y121.141 E.01689
G1 X129.141 Y116.843 E.18966
G1 X128.6 Y116.843 E.01689
G1 X124.843 Y120.6 E.16578
G1 X124.843 Y120.059 E.01689
G1 X128.059 Y116.843 E.14189
G1 X127.517 Y116.843 E.01689
G1 X124.843 Y119.517 E.11801
G1 X124.842 Y118.976 E.01689
G1 X126.976 Y116.842 E.09413
G1 X126.435 Y116.842 E.01689
G1 X124.842 Y118.435 E.07024
G1 X124.842 Y117.893 E.01689
G1 X125.893 Y116.842 E.04636
G2 X125.141 Y117.053 I-.109 J1.06 E.02493
G1 X124.694 Y117.501 E.01976
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9403.16
G1 X125.141 Y117.053 E-.2407
G1 X125.335 Y116.926 E-.08788
G1 X125.451 Y116.88 E-.04757
G1 X125.574 Y116.853 E-.04776
G1 X125.893 Y116.842 E-.12136
G1 X125.494 Y117.242 E-.21475
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/35
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4 I-1.184 J.282 P1  F42000
G1 X130.766 Y139.395 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.468 J-1.097 E.01631
G1 X125.712 Y139.491 E.15176
G3 X124.509 Y138.287 I-.01 J-1.193 E.06285
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.193 J-.011 E.06288
G1 X130.287 Y116.509 E.15174
G3 X131.491 Y117.713 I.011 J1.193 E.06287
G1 X131.491 Y138.288 E.68251
G3 X130.821 Y139.37 I-1.193 J.01 E.04454
M204 S10000
G1 X130.918 Y139.773 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.62 J-1.475 E.0213
G1 X125.707 Y139.898 E.15209
G3 X124.102 Y138.292 I-.005 J-1.6 E.08374
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.6 J-.006 E.08376
G1 X130.297 Y116.102 E.15224
G3 X131.898 Y117.708 I.001 J1.6 E.08357
G1 X131.898 Y138.293 E.68284
G3 X130.972 Y139.749 I-1.6 J.005 E.06044
M204 S250
G1 X131.059 Y140.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.679 Y140.253 E.01219
G3 X130.297 Y140.29 I-.381 J-1.956 E.0118
G1 X125.703 Y140.29 E.14118
G3 X123.71 Y138.297 I-.001 J-1.992 E.0962
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.992 J-.001 E.09621
G1 X130.307 Y115.71 E.14148
G3 X132.29 Y117.703 I-.009 J1.992 E.09588
G1 X132.29 Y138.297 E.63281
G3 X131.114 Y140.115 I-1.992 J0 E.07034
; WIPE_START
M204 S6000
G1 X130.679 Y140.253 E-.17336
G1 X130.297 Y140.29 E-.1457
G1 X129.137 Y140.29 E-.44093
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


G1 X125.502 Y139.307 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42572
G1 F6734
M204 S6000
G1 X125.049 Y138.854 E.01997
G3 X124.844 Y138.108 I.781 J-.616 E.0248
G1 X125.894 Y139.158 E.04631
G1 X126.435 Y139.158 E.01689
G1 X124.844 Y137.566 E.07019
G1 X124.844 Y137.025 E.01689
G1 X126.977 Y139.158 E.09408
G1 X127.518 Y139.158 E.01689
G1 X124.844 Y136.484 E.11796
G1 X124.844 Y135.942 E.01689
G1 X128.059 Y139.158 E.14185
G1 X128.601 Y139.158 E.01689
G1 X124.844 Y135.401 E.16573
G1 X124.844 Y134.859 E.01689
G1 X129.142 Y139.158 E.18961
G1 X129.683 Y139.158 E.01689
G1 X124.844 Y134.318 E.2135
G1 X124.844 Y133.777 E.01689
G1 X130.225 Y139.158 E.23738
G2 X130.672 Y139.064 I-.003 J-1.127 E.01436
G1 X124.844 Y133.235 E.25712
G1 X124.844 Y132.694 E.01689
G1 X130.975 Y138.825 E.27047
G2 X131.141 Y138.45 I-.723 J-.546 E.0129
G1 X124.844 Y132.152 E.27782
G1 X124.844 Y131.611 E.01689
G1 X131.158 Y137.925 E.27854
G1 X131.158 Y137.384 E.01689
G1 X124.844 Y131.07 E.27854
G1 X124.843 Y130.528 E.01689
G1 X131.157 Y136.842 E.27854
G1 X131.157 Y136.301 E.01689
G1 X124.843 Y129.987 E.27854
G1 X124.843 Y129.445 E.01689
G1 X131.157 Y135.759 E.27854
G1 X131.157 Y135.218 E.01689
G1 X124.843 Y128.904 E.27854
G1 X124.843 Y128.362 E.01689
G1 X131.157 Y134.676 E.27854
G1 X131.157 Y134.135 E.01689
M73 P85 R1
G1 X124.843 Y127.821 E.27854
G1 X124.843 Y127.28 E.01689
G1 X131.157 Y133.594 E.27854
G1 X131.157 Y133.052 E.01689
G1 X124.843 Y126.738 E.27854
G1 X124.843 Y126.197 E.01689
G1 X131.157 Y132.511 E.27854
G1 X131.157 Y131.969 E.01689
G1 X124.843 Y125.655 E.27854
G1 X124.843 Y125.114 E.01689
G1 X131.157 Y131.428 E.27854
G1 X131.157 Y130.887 E.01689
G1 X124.843 Y124.573 E.27854
G1 X124.843 Y124.031 E.01689
G1 X131.157 Y130.345 E.27854
G1 X131.157 Y129.804 E.01689
G1 X124.843 Y123.49 E.27854
G1 X124.843 Y122.948 E.01689
G1 X131.157 Y129.262 E.27854
G1 X131.157 Y128.721 E.01689
G1 X124.843 Y122.407 E.27854
G1 X124.843 Y121.866 E.01689
G1 X131.157 Y128.18 E.27854
G1 X131.157 Y127.638 E.01689
G1 X124.843 Y121.324 E.27854
G1 X124.843 Y120.783 E.01689
G1 X131.157 Y127.097 E.27854
G1 X131.157 Y126.555 E.01689
G1 X124.843 Y120.241 E.27854
G1 X124.843 Y119.7 E.01689
G1 X131.157 Y126.014 E.27854
G1 X131.157 Y125.473 E.01689
G1 X124.843 Y119.159 E.27854
G1 X124.842 Y118.617 E.01689
G1 X131.156 Y124.931 E.27854
G1 X131.156 Y124.39 E.01689
G1 X124.842 Y118.076 E.27854
G3 X124.858 Y117.55 I2.9 J-.174 E.01642
G1 X131.156 Y123.848 E.27783
G1 X131.156 Y123.307 E.01689
G1 X125.025 Y117.175 E.27049
G3 X125.323 Y116.932 I.789 J.662 E.01207
G1 X131.156 Y122.766 E.25734
G1 X131.156 Y122.224 E.01689
G1 X125.774 Y116.842 E.23741
G1 X126.316 Y116.842 E.01689
G1 X131.156 Y121.683 E.21353
G1 X131.156 Y121.141 E.01689
G1 X126.857 Y116.842 E.18964
G1 X127.399 Y116.842 E.01689
G1 X131.156 Y120.6 E.16576
G1 X131.156 Y120.059 E.01689
G1 X127.94 Y116.843 E.14187
G1 X128.481 Y116.843 E.01689
G1 X131.156 Y119.517 E.11799
G1 X131.156 Y118.976 E.01689
G1 X129.023 Y116.843 E.0941
G1 X129.564 Y116.843 E.01689
G1 X131.156 Y118.434 E.07021
G1 X131.156 Y117.893 E.01689
G1 X130.106 Y116.843 E.04633
G3 X130.855 Y117.051 I.123 J1.01 E.02491
G1 X131.302 Y117.498 E.01972
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9404.388
G1 X130.855 Y117.051 E-.24021
G1 X130.738 Y116.965 E-.05529
G1 X130.588 Y116.894 E-.063
G1 X130.422 Y116.853 E-.06494
G1 X130.106 Y116.843 E-.12042
G1 X130.508 Y117.245 E-.21614
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/35
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I-1.217 J.014 P1  F42000
G1 X130.755 Y139.399 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X130.287 Y139.491 I-.46 J-1.103 E.01593
G1 X125.713 Y139.491 E.15174
G3 X124.509 Y138.287 I-.009 J-1.195 E.06284
G1 X124.509 Y117.713 E.68249
G3 X125.713 Y116.509 I1.195 J-.008 E.06284
G1 X130.295 Y116.509 E.152
G3 X131.491 Y117.713 I.001 J1.195 E.06258
G1 X131.491 Y138.287 E.68249
G3 X130.81 Y139.374 I-1.195 J.008 E.04491
M204 S10000
G1 X130.911 Y139.775 F42000
G1 F5400
M204 S6000
G3 X130.292 Y139.898 I-.616 J-1.48 E.02107
G1 X125.708 Y139.898 E.15207
G3 X124.102 Y138.292 I-.003 J-1.603 E.08371
G1 X124.102 Y117.708 E.68282
G3 X125.708 Y116.102 I1.603 J-.003 E.08371
G1 X130.3 Y116.102 E.15233
M73 P86 R1
G3 X131.898 Y117.708 I-.005 J1.603 E.08345
G1 X131.898 Y138.292 E.68282
G3 X130.966 Y139.751 I-1.603 J.003 E.06065
M204 S250
G1 X131.061 Y140.137 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X130.297 Y140.29 I-.767 J-1.843 E.02409
G1 X125.703 Y140.29 E.14117
G3 X123.71 Y138.297 I.003 J-1.996 E.09615
G1 X123.71 Y117.703 E.6328
G3 X125.703 Y115.71 I1.996 J.003 E.09615
G1 X130.305 Y115.71 E.14141
G3 X132.29 Y117.703 I-.011 J1.996 E.0959
G1 X132.29 Y138.297 E.6328
G3 X131.116 Y140.113 I-1.996 J-.003 E.07021
; WIPE_START
M204 S6000
G1 X130.688 Y140.252 E-.17094
G1 X130.297 Y140.29 E-.14927
G1 X129.14 Y140.29 E-.4398
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


G1 X130.502 Y139.304 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42575
G1 F6746
M204 S6000
G2 X130.962 Y138.844 I-9.663 J-10.114 E.02029
G2 X131.158 Y138.107 I-.797 J-.606 E.0244
G1 X130.107 Y139.158 E.04636
G1 X129.565 Y139.158 E.01689
G1 X131.158 Y137.565 E.07025
G1 X131.158 Y137.024 E.01689
G1 X129.024 Y139.158 E.09413
G1 X128.483 Y139.158 E.01689
G1 X131.157 Y136.483 E.11801
G1 X131.157 Y135.941 E.01689
G1 X127.941 Y139.158 E.1419
G1 X127.4 Y139.158 E.01689
G1 X131.157 Y135.4 E.16578
G1 X131.157 Y134.859 E.01689
G1 X126.858 Y139.158 E.18966
G1 X126.317 Y139.158 E.01689
G1 X131.157 Y134.317 E.21355
G1 X131.157 Y133.776 E.01689
G1 X125.776 Y139.158 E.23743
G3 X125.324 Y139.068 I-.024 J-1.059 E.01447
G1 X131.157 Y133.235 E.25734
G1 X131.157 Y132.693 E.01689
G1 X125.026 Y138.824 E.27049
G3 X124.861 Y138.448 I.544 J-.463 E.01301
G1 X131.157 Y132.152 E.27776
G1 X131.157 Y131.61 E.01689
G1 X124.844 Y137.923 E.27851
G1 X124.844 Y137.382 E.01689
G1 X131.157 Y131.069 E.27851
G1 X131.157 Y130.528 E.01689
G1 X124.844 Y136.841 E.27851
G1 X124.844 Y136.299 E.01689
G1 X131.157 Y129.986 E.27851
G1 X131.157 Y129.445 E.01689
G1 X124.844 Y135.758 E.27851
G1 X124.844 Y135.217 E.01689
G1 X131.157 Y128.904 E.27851
G1 X131.157 Y128.362 E.01689
G1 X124.844 Y134.675 E.27851
G1 X124.844 Y134.134 E.01689
G1 X131.157 Y127.821 E.27851
G1 X131.157 Y127.28 E.01689
G1 X124.844 Y133.593 E.27851
G1 X124.844 Y133.051 E.01689
G1 X131.157 Y126.738 E.27851
G1 X131.157 Y126.197 E.01689
G1 X124.844 Y132.51 E.27851
G1 X124.844 Y131.968 E.01689
G1 X131.157 Y125.656 E.27851
G1 X131.157 Y125.114 E.01689
G1 X124.844 Y131.427 E.27851
G1 X124.844 Y130.886 E.01689
G1 X131.156 Y124.573 E.27851
G1 X131.156 Y124.031 E.01689
G1 X124.843 Y130.344 E.27851
G1 X124.843 Y129.803 E.01689
G1 X131.156 Y123.49 E.27851
G1 X131.156 Y122.949 E.01689
G1 X124.843 Y129.262 E.27851
G1 X124.843 Y128.72 E.01689
G1 X131.156 Y122.407 E.27851
G1 X131.156 Y121.866 E.01689
G1 X124.843 Y128.179 E.27851
G1 X124.843 Y127.638 E.01689
G1 X131.156 Y121.325 E.27851
G1 X131.156 Y120.783 E.01689
G1 X124.843 Y127.096 E.27851
G1 X124.843 Y126.555 E.01689
G1 X131.156 Y120.242 E.27851
G1 X131.156 Y119.701 E.01689
G1 X124.843 Y126.014 E.27851
M73 P87 R1
G1 X124.843 Y125.472 E.01689
G1 X131.156 Y119.159 E.27851
G1 X131.156 Y118.618 E.01689
G1 X124.843 Y124.931 E.27851
G1 X124.843 Y124.389 E.01689
G1 X131.156 Y118.076 E.27851
G2 X131.139 Y117.552 I-1.776 J-.205 E.01643
G1 X124.843 Y123.848 E.27776
G1 X124.843 Y123.307 E.01689
G1 X130.974 Y117.176 E.27049
G2 X130.674 Y116.935 I-.697 J.561 E.01211
G1 X124.843 Y122.765 E.25724
G1 X124.843 Y122.224 E.01689
G1 X130.224 Y116.843 E.23742
G1 X129.683 Y116.843 E.01689
G1 X124.843 Y121.683 E.21353
G1 X124.843 Y121.141 E.01689
G1 X129.141 Y116.843 E.18965
G1 X128.6 Y116.843 E.01689
G1 X124.843 Y120.6 E.16577
G1 X124.843 Y120.059 E.01689
G1 X128.059 Y116.842 E.14189
G1 X127.517 Y116.842 E.01689
G1 X124.843 Y119.517 E.118
G1 X124.843 Y118.976 E.01689
G1 X126.976 Y116.842 E.09412
G1 X126.435 Y116.842 E.01689
G1 X124.842 Y118.435 E.07024
G1 X124.842 Y117.893 E.01689
G1 X125.893 Y116.842 E.04636
G2 X125.143 Y117.051 I-.11 J1.056 E.02488
G1 X124.694 Y117.501 E.01982
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9403.651
G1 X125.143 Y117.051 E-.24143
G1 X125.334 Y116.926 E-.08687
G1 X125.452 Y116.88 E-.04802
G1 X125.569 Y116.854 E-.04554
G1 X125.893 Y116.842 E-.12343
G1 X125.494 Y117.242 E-.21472
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/35
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.4 I-1.183 J.287 P1  F42000
G1 X131.058 Y140.139 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.686 Y140.251 E.01196
G3 X130.297 Y140.29 I-.392 J-1.957 E.01201
G1 X125.703 Y140.29 E.14118
G3 X123.71 Y138.297 I.003 J-1.996 E.09614
G1 X123.71 Y117.703 E.63281
G3 X125.703 Y115.71 I1.996 J.003 E.09614
G1 X130.3 Y115.71 E.14125
G3 X132.29 Y117.703 I-.006 J1.996 E.09606
G1 X132.29 Y138.297 E.63281
G3 X131.112 Y140.114 I-1.996 J-.003 E.07033
; WIPE_START
M204 S6000
G1 X130.686 Y140.251 E-.17033
G1 X130.297 Y140.29 E-.14829
G1 X129.136 Y140.29 E-.44139
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


G1 X132.055 Y117.39 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X130.61 Y115.945 E.0628
G1 X130.049 Y115.917
G1 X132.083 Y117.951 E.08838
G1 X132.083 Y118.485
G1 X129.515 Y115.917 E.11156
G1 X128.982 Y115.917
G1 X132.083 Y119.018 E.13473
G1 X132.083 Y119.551
G1 X128.449 Y115.917 E.1579
G1 X127.916 Y115.917
G1 X132.083 Y120.084 E.18108
G1 X132.083 Y120.618
G1 X127.382 Y115.917 E.20425
G1 X126.849 Y115.917
G1 X132.083 Y121.151 E.22742
G1 X132.083 Y121.684
G1 X126.316 Y115.917 E.25059
G1 X125.783 Y115.917
G1 X132.083 Y122.217 E.27377
G1 X132.083 Y122.751
G1 X125.296 Y115.964 E.2949
G1 X124.904 Y116.106
G1 X132.083 Y123.284 E.31193
G1 X132.083 Y123.817
G1 X124.58 Y116.314 E.32605
G1 X124.313 Y116.581
G1 X132.083 Y124.35 E.33763
G1 X132.083 Y124.884
G1 X124.105 Y116.906 E.34668
G1 X123.964 Y117.298
G1 X132.083 Y125.417 E.3528
G1 X132.083 Y125.95
G1 X123.917 Y117.785 E.35482
G1 X123.917 Y118.318
G1 X132.083 Y126.483 E.35482
G1 X132.083 Y127.017
G1 X123.917 Y118.851 E.35482
G1 X123.917 Y119.385
G1 X132.083 Y127.55 E.35482
G1 X132.083 Y128.083
G1 X123.917 Y119.918 E.35482
G1 X123.917 Y120.451
G1 X132.083 Y128.617 E.35482
G1 X132.083 Y129.15
G1 X123.917 Y120.985 E.35482
G1 X123.917 Y121.518
G1 X132.083 Y129.683 E.35482
G1 X132.083 Y130.216
G1 X123.917 Y122.051 E.35482
G1 X123.917 Y122.584
G1 X132.083 Y130.75 E.35482
G1 X132.083 Y131.283
G1 X123.917 Y123.118 E.35482
G1 X123.917 Y123.651
G1 X132.083 Y131.816 E.35482
G1 X132.083 Y132.349
G1 X123.917 Y124.184 E.35482
M73 P88 R1
G1 X123.917 Y124.717
G1 X132.083 Y132.883 E.35482
G1 X132.083 Y133.416
G1 X123.917 Y125.251 E.35482
G1 X123.917 Y125.784
G1 X132.083 Y133.949 E.35482
G1 X132.083 Y134.482
G1 X123.917 Y126.317 E.35482
G1 X123.917 Y126.85
G1 X132.083 Y135.016 E.35482
G1 X132.083 Y135.549
G1 X123.917 Y127.384 E.35482
G1 X123.917 Y127.917
G1 X132.083 Y136.082 E.35482
G1 X132.083 Y136.615
G1 X123.917 Y128.45 E.35482
G1 X123.917 Y128.983
G1 X132.083 Y137.149 E.35482
G1 X132.083 Y137.682
G1 X123.917 Y129.517 E.35482
G1 X123.917 Y130.05
G1 X132.083 Y138.215 E.35482
G1 X132.036 Y138.702
G1 X123.917 Y130.583 E.3528
G1 X123.917 Y131.116
G1 X131.895 Y139.094 E.34667
G1 X131.687 Y139.419
G1 X123.917 Y131.65 E.33762
G1 X123.917 Y132.183
G1 X131.42 Y139.686 E.32604
G1 X131.096 Y139.894
G1 X123.917 Y132.716 E.31193
G1 X123.917 Y133.249
G1 X130.704 Y140.036 E.29489
G1 X130.217 Y140.083
G1 X123.917 Y133.783 E.27376
G1 X123.917 Y134.316
G1 X129.684 Y140.083 E.25059
G1 X129.151 Y140.083
G1 X123.917 Y134.849 E.22742
G1 X123.917 Y135.382
G1 X128.618 Y140.083 E.20424
G1 X128.084 Y140.083
G1 X123.917 Y135.916 E.18107
G1 X123.917 Y136.449
G1 X127.551 Y140.083 E.1579
G1 X127.018 Y140.083
G1 X123.917 Y136.982 E.13473
G1 X123.917 Y137.516
G1 X126.484 Y140.083 E.11155
G1 X125.951 Y140.083
G1 X123.917 Y138.049 E.08838
G1 X123.945 Y138.61
G1 X125.39 Y140.055 E.06279
M204 S10000
M73 P89 R1
G1 X124.967 Y139.925 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10393
G1 F15000
M204 S6000
G1 X124.867 Y139.853 E.00061
; LINE_WIDTH: 0.142403
G3 X124.733 Y139.748 I2.082 J-2.806 E.00138
; LINE_WIDTH: 0.184139
G3 X124.252 Y139.268 I2.356 J-2.837 E.00783
; LINE_WIDTH: 0.142105
G3 X124.146 Y139.131 I2.704 J-2.22 E.0014
; LINE_WIDTH: 0.103603
G1 X124.075 Y139.033 E.0006
; WIPE_START
G1 X124.146 Y139.131 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.673 Y131.93 Z4.6 F42000
G1 X131.925 Y116.967 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.103661
G1 F15000
M204 S6000
G1 X131.854 Y116.869 E.0006
; LINE_WIDTH: 0.142234
G2 X131.748 Y116.732 I-2.836 J2.104 E.0014
; LINE_WIDTH: 0.184264
G2 X131.267 Y116.252 I-2.836 J2.356 E.00784
; LINE_WIDTH: 0.142126
G2 X131.131 Y116.145 I-2.272 J2.771 E.0014
; LINE_WIDTH: 0.101589
G1 X131.033 Y116.075 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X131.131 Y116.145 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/35
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-1.202 J-.192 P1  F42000
G1 X128.468 Y132.829 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.043 Y132.504 I-.467 J.17 E.08486
G1 X128.054 Y132.505 E.00037
G3 X128.445 Y132.774 I-.053 J.494 E.01639
M204 S250
G1 X128.829 Y132.682 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.837 Y132.695 E.00047
G3 X127.978 Y132.111 I-.836 J.304 E.13758
G1 X128.067 Y132.113 E.00275
G3 X128.76 Y132.536 I-.066 J.887 E.02589
G1 X128.804 Y132.628 E.00313
; WIPE_START
G1 F3000
M204 S6000
G1 X128.837 Y132.695 E-.02861
G1 X128.88 Y132.867 E-.06742
G1 X128.889 Y133.044 E-.06731
G1 X128.862 Y133.22 E-.06729
G1 X128.802 Y133.386 E-.06738
G1 X128.709 Y133.537 E-.06728
G1 X128.589 Y133.667 E-.06737
G1 X128.366 Y133.811 E-.10074
G1 X128.198 Y133.867 E-.06729
G1 X128.022 Y133.889 E-.06739
G1 X127.845 Y133.876 E-.06734
G1 X127.783 Y133.859 E-.02457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.18 Y126.237 Z4.8 F42000
G1 X128.329 Y123.373 Z4.8
G1 Z4.4
M73 P90 R1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.043 Y122.504 I-.328 J-.373 E.06508
G1 X128.054 Y122.505 E.00037
G3 X128.372 Y123.331 I-.053 J.494 E.03618
M204 S250
G1 X128.64 Y123.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.519 Y123.722 E.00495
G3 X127.978 Y122.111 I-.518 J-.723 E.10213
G1 X128.067 Y122.113 E.00275
G3 X128.681 Y123.572 I-.066 J.887 E.06
; WIPE_START
G1 F3000
M204 S6000
G1 X128.519 Y123.722 E-.0838
G1 X128.366 Y123.811 E-.06727
G1 X128.198 Y123.867 E-.06729
G1 X128.022 Y123.889 E-.06739
G1 X127.845 Y123.876 E-.06734
G1 X127.675 Y123.828 E-.06729
G1 X127.517 Y123.747 E-.06731
G1 X127.379 Y123.637 E-.06738
G1 X127.265 Y123.501 E-.0673
G1 X127.18 Y123.346 E-.06738
G1 X127.128 Y123.176 E-.06724
G1 X127.127 Y123.169 E-.00301
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


; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 23/35
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X128.468 Y132.83 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.04 Y132.504 I-.467 J.17 E.08475
G1 X128.056 Y132.506 E.00052
G3 X128.445 Y132.775 I-.055 J.494 E.01634
M204 S250
G1 X128.831 Y132.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.836 Y132.696 E.00037
G3 X127.978 Y132.111 I-.836 J.304 E.1376
G1 X128.064 Y132.113 E.00263
G3 X128.759 Y132.536 I-.064 J.887 E.02599
G1 X128.805 Y132.631 E.00323
; WIPE_START
G1 F3000
M204 S6000
G1 X128.836 Y132.696 E-.02734
G1 X128.88 Y132.867 E-.06731
G1 X128.889 Y133.044 E-.06735
G1 X128.862 Y133.219 E-.06728
G1 X128.802 Y133.386 E-.06738
G1 X128.709 Y133.537 E-.06723
G1 X128.589 Y133.667 E-.0674
G1 X128.366 Y133.811 E-.10074
G1 X128.198 Y133.867 E-.06735
G1 X128.022 Y133.889 E-.06736
G1 X127.846 Y133.876 E-.0673
G1 X127.779 Y133.859 E-.02596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.179 Y126.237 Z5 F42000
G1 X128.329 Y123.373 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.04 Y122.504 I-.328 J-.373 E.06498
G1 X128.056 Y122.506 E.00052
G3 X128.372 Y123.331 I-.055 J.494 E.03611
M204 S250
G1 X128.626 Y123.627 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.588 Y123.666 E.0017
G3 X127.978 Y122.111 I-.588 J-.667 E.1049
G1 X128.064 Y122.113 E.00263
G3 X128.709 Y123.537 I-.064 J.887 E.05868
G1 X128.667 Y123.582 E.0019
; WIPE_START
G1 F3000
M204 S6000
G1 X128.588 Y123.666 E-.04377
G1 X128.366 Y123.811 E-.10069
G1 X128.198 Y123.867 E-.06735
G1 X128.022 Y123.889 E-.06736
G1 X127.846 Y123.876 E-.0673
G1 X127.714 Y123.843 E-.05161
G1 X127.555 Y123.771 E-.0662
G1 X127.411 Y123.667 E-.06738
G1 X127.291 Y123.537 E-.06731
G1 X127.198 Y123.386 E-.06738
G1 X127.138 Y123.22 E-.0673
G1 X127.127 Y123.151 E-.02636
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


; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 24/35
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X128.468 Y132.829 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.038 Y132.504 I-.467 J.17 E.08467
G1 X128.057 Y132.506 E.00064
G3 X128.445 Y132.774 I-.055 J.494 E.01631
M204 S250
G1 X128.833 Y132.688 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.835 Y132.696 E.00025
G3 X127.978 Y132.11 I-.836 J.303 E.13762
G1 X128.06 Y132.112 E.00251
G3 X128.758 Y132.537 I-.061 J.887 E.02609
G1 X128.806 Y132.634 E.00334
; WIPE_START
G1 F3000
M204 S6000
G1 X128.835 Y132.696 E-.02584
G1 X128.88 Y132.867 E-.06732
G1 X128.889 Y133.044 E-.06731
G1 X128.862 Y133.22 E-.06736
G1 X128.802 Y133.386 E-.06731
G1 X128.652 Y133.605 E-.10084
G1 X128.519 Y133.722 E-.06726
G1 X128.366 Y133.811 E-.0673
G1 X128.198 Y133.867 E-.06733
G1 X128.022 Y133.889 E-.06739
G1 X127.852 Y133.877 E-.06488
G1 X127.776 Y133.858 E-.02985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.178 Y126.236 Z5.2 F42000
G1 X128.329 Y123.373 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.038 Y122.504 I-.328 J-.374 E.06487
G1 X128.057 Y122.506 E.00064
G3 X128.372 Y123.331 I-.055 J.494 E.0361
M204 S250
G1 X128.639 Y123.617 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.519 Y123.721 E.0049
G3 X127.978 Y122.11 I-.519 J-.722 E.10223
G1 X128.06 Y122.112 E.00251
G3 X128.679 Y123.572 I-.061 J.887 E.06018
; WIPE_START
G1 F3000
M204 S6000
G1 X128.519 Y123.721 E-.08318
G1 X128.366 Y123.811 E-.06723
G1 X128.198 Y123.867 E-.06736
G1 X128.022 Y123.889 E-.06739
G1 X127.845 Y123.876 E-.0674
G1 X127.675 Y123.828 E-.06721
G1 X127.517 Y123.747 E-.06736
G1 X127.379 Y123.637 E-.06733
G1 X127.265 Y123.501 E-.06729
G1 X127.179 Y123.344 E-.06804
G1 X127.138 Y123.22 E-.04977
G1 X127.13 Y123.167 E-.02045
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


; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 25/35
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X128.468 Y132.83 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P91 R1
G3 X127.989 Y132.503 I-.467 J.17 E.08303
G1 X128.035 Y132.504 E.00152
G3 X128.444 Y132.775 I-.034 J.496 E.01703
M204 S250
G1 X128.834 Y132.692 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.834 Y132.696 E.00013
G3 X127.978 Y132.11 I-.836 J.303 E.13763
G1 X128.056 Y132.112 E.0024
G3 X128.758 Y132.537 I-.058 J.887 E.02619
G1 X128.808 Y132.638 E.00347
; WIPE_START
G1 F3000
M204 S6000
G1 X128.834 Y132.696 E-.02429
G1 X128.88 Y132.867 E-.06725
G1 X128.889 Y133.044 E-.06733
G1 X128.862 Y133.22 E-.06738
G1 X128.802 Y133.386 E-.06734
G1 X128.709 Y133.537 E-.06729
G1 X128.589 Y133.667 E-.06732
G1 X128.366 Y133.811 E-.10081
G1 X128.198 Y133.867 E-.06735
G1 X128.022 Y133.889 E-.06732
G1 X127.845 Y133.876 E-.06746
G1 X127.771 Y133.857 E-.02888
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.201 Y126.237 Z5.4 F42000
G1 X128.365 Y123.339 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.989 Y122.503 I-.363 J-.339 E.0649
G1 X128.035 Y122.504 E.00152
G3 X128.403 Y123.292 I-.034 J.496 E.03516
M204 S250
G1 X128.641 Y123.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P91 R0
G1 F1200
M204 S5000
G1 X128.518 Y123.721 E.00496
G3 X127.978 Y122.11 I-.52 J-.721 E.10227
G1 X128.056 Y122.112 E.0024
G3 X128.68 Y123.57 I-.058 J.887 E.06019
; WIPE_START
G1 F3000
M204 S6000
G1 X128.518 Y123.721 E-.08392
G1 X128.366 Y123.811 E-.06731
G1 X128.198 Y123.867 E-.06735
G1 X128.022 Y123.889 E-.06732
G1 X127.846 Y123.876 E-.06729
G1 X127.675 Y123.828 E-.06739
G1 X127.517 Y123.747 E-.06731
G1 X127.379 Y123.637 E-.06732
G1 X127.265 Y123.501 E-.06725
G1 X127.18 Y123.344 E-.06791
G1 X127.138 Y123.22 E-.04983
G1 X127.13 Y123.168 E-.01981
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


; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 26/35
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G1 X128.468 Y132.83 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.989 Y132.503 I-.467 J.17 E.08305
G1 X128.032 Y132.504 E.00141
G3 X128.444 Y132.775 I-.031 J.496 E.01712
M204 S250
G1 X128.834 Y132.696 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.978 Y132.11 I-.836 J.303 E.13765
G1 X128.053 Y132.112 E.00228
G3 X128.811 Y132.641 I-.055 J.887 E.02989
; WIPE_START
G1 F3000
M204 S6000
G1 X128.88 Y132.867 E-.08994
G1 X128.889 Y133.044 E-.06731
G1 X128.862 Y133.219 E-.06732
G1 X128.802 Y133.386 E-.06739
G1 X128.709 Y133.537 E-.06733
G1 X128.589 Y133.667 E-.06728
G1 X128.366 Y133.811 E-.10077
G1 X128.198 Y133.867 E-.06738
G1 X128.022 Y133.889 E-.06731
G1 X127.845 Y133.876 E-.06751
G1 X127.767 Y133.856 E-.03045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.176 Y126.235 Z5.6 F42000
G1 X128.329 Y123.373 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.989 Y122.503 I-.328 J-.373 E.06331
G1 X128.032 Y122.504 E.00141
G3 X128.371 Y123.33 I-.031 J.496 E.03687
M204 S250
G1 X128.638 Y123.618 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.518 Y123.721 E.00485
G3 X127.978 Y122.11 I-.52 J-.721 E.10231
G1 X128.053 Y122.112 E.00228
G3 X128.677 Y123.573 I-.055 J.887 E.06038
; WIPE_START
G1 F3000
M204 S6000
G1 X128.518 Y123.721 E-.08255
G1 X128.366 Y123.811 E-.0672
G1 X128.198 Y123.867 E-.06738
G1 X128.022 Y123.889 E-.06731
G1 X127.845 Y123.876 E-.06751
G1 X127.718 Y123.844 E-.04981
G1 X127.555 Y123.771 E-.06784
G1 X127.411 Y123.667 E-.06733
G1 X127.291 Y123.537 E-.0673
G1 X127.198 Y123.386 E-.06739
G1 X127.138 Y123.219 E-.06734
G1 X127.13 Y123.165 E-.02102
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


; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 27/35
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G1 X128.467 Y132.83 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.99 Y132.503 I-.467 J.17 E.08308
G1 X128.029 Y132.504 E.00129
G3 X128.443 Y132.775 I-.029 J.496 E.01721
M204 S250
G1 X128.837 Y132.7 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.877 Y132.868 E.0053
G3 X127.979 Y132.11 I-.879 J.132 E.13223
M73 P92 R0
G1 X128.049 Y132.112 E.00217
G3 X128.813 Y132.646 I-.052 J.888 E.03014
; WIPE_START
G1 F3000
M204 S6000
G1 X128.877 Y132.868 E-.08779
G1 X128.889 Y133.044 E-.06725
G1 X128.836 Y133.304 E-.10077
G1 X128.759 Y133.464 E-.06738
G1 X128.652 Y133.605 E-.06728
G1 X128.52 Y133.722 E-.0673
G1 X128.366 Y133.811 E-.06742
G1 X128.198 Y133.867 E-.06732
G1 X128.022 Y133.889 E-.06731
G1 X127.846 Y133.876 E-.06729
G1 X127.762 Y133.853 E-.03289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.198 Y126.233 Z5.8 F42000
G1 X128.364 Y123.338 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.99 Y122.503 I-.364 J-.338 E.065
G1 X128.029 Y122.504 E.00129
G3 X128.402 Y123.291 I-.029 J.496 E.03529
M204 S250
G1 X128.639 Y123.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.518 Y123.72 E.00491
G3 X127.979 Y122.11 I-.521 J-.721 E.10235
G1 X128.049 Y122.112 E.00217
G3 X128.678 Y123.571 I-.052 J.888 E.0604
; WIPE_START
G1 F3000
M204 S6000
G1 X128.518 Y123.72 E-.08328
G1 X128.366 Y123.811 E-.06732
G1 X128.198 Y123.867 E-.06733
G1 X128.022 Y123.889 E-.06732
G1 X127.846 Y123.876 E-.06729
G1 X127.675 Y123.828 E-.06732
G1 X127.517 Y123.747 E-.06739
G1 X127.379 Y123.637 E-.06727
G1 X127.265 Y123.501 E-.06733
G1 X127.18 Y123.345 E-.06776
G1 X127.138 Y123.22 E-.04986
G1 X127.13 Y123.167 E-.02054
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


; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 28/35
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.99 Y132.503 I-.467 J.169 E.08311
G1 X128.026 Y132.503 E.00118
G3 X128.443 Y132.775 I-.026 J.496 E.01729
M204 S250
G1 X128.838 Y132.705 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.876 Y132.868 E.00514
G3 X127.979 Y132.11 I-.879 J.131 E.13224
G1 X128.045 Y132.112 E.00204
G3 X128.815 Y132.65 I-.048 J.888 E.0304
; WIPE_START
G1 F3000
M204 S6000
G1 X128.876 Y132.868 E-.08602
G1 X128.889 Y133.044 E-.06717
G1 X128.862 Y133.219 E-.06732
G1 X128.802 Y133.386 E-.06738
G1 X128.652 Y133.605 E-.10082
G1 X128.519 Y133.722 E-.06728
G1 X128.366 Y133.811 E-.06728
G1 X128.198 Y133.867 E-.06741
G1 X128.022 Y133.889 E-.0673
G1 X127.846 Y133.876 E-.0673
G1 X127.758 Y133.851 E-.0347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.197 Y126.232 Z6 F42000
G1 X128.364 Y123.338 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.99 Y122.503 I-.364 J-.338 E.06505
G1 X128.026 Y122.503 E.00118
G3 X128.402 Y123.291 I-.026 J.496 E.03535
M204 S250
G1 X128.639 Y123.617 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.518 Y123.72 E.00489
G3 X127.979 Y122.11 I-.521 J-.721 E.10238
G1 X128.045 Y122.112 E.00204
G3 X128.678 Y123.571 I-.048 J.888 E.06052
; WIPE_START
G1 F3000
M204 S6000
G1 X128.518 Y123.72 E-.08299
G1 X128.366 Y123.811 E-.06723
G1 X128.198 Y123.867 E-.06741
G1 X128.022 Y123.889 E-.0673
G1 X127.846 Y123.876 E-.0673
G1 X127.674 Y123.828 E-.0676
G1 X127.556 Y123.771 E-.04998
G1 X127.411 Y123.667 E-.06761
G1 X127.291 Y123.537 E-.0673
G1 X127.198 Y123.386 E-.06733
G1 X127.138 Y123.22 E-.06735
G1 X127.13 Y123.166 E-.0206
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


; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 29/35
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.991 Y132.503 I-.467 J.169 E.08314
G1 X128.023 Y132.503 E.00106
G3 X128.442 Y132.775 I-.024 J.496 E.01739
M204 S250
G1 X128.84 Y132.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.876 Y132.868 E.00499
G3 X127.979 Y132.11 I-.879 J.132 E.13227
G1 X128.042 Y132.111 E.00193
G3 X128.816 Y132.654 I-.045 J.888 E.03065
; WIPE_START
M73 P93 R0
G1 F3000
M204 S6000
G1 X128.876 Y132.868 E-.08426
G1 X128.889 Y133.044 E-.06721
G1 X128.862 Y133.22 E-.06738
G1 X128.802 Y133.386 E-.06731
G1 X128.709 Y133.537 E-.06731
G1 X128.607 Y133.65 E-.05786
G1 X128.483 Y133.747 E-.05999
G1 X128.325 Y133.828 E-.06736
G1 X128.154 Y133.876 E-.06735
G1 X127.978 Y133.889 E-.06728
G1 X127.802 Y133.867 E-.06736
G1 X127.754 Y133.851 E-.01934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.179 Y126.231 Z6.2 F42000
G1 X128.339 Y123.362 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.991 Y122.503 I-.34 J-.362 E.06393
G1 X128.023 Y122.503 E.00106
G3 X128.38 Y123.318 I-.024 J.496 E.03659
M204 S250
G1 X128.626 Y123.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.605 Y123.648 E.00089
G3 X127.979 Y122.11 I-.608 J-.649 E.10588
G1 X128.042 Y122.111 E.00193
G3 X128.706 Y123.535 I-.045 J.888 E.0592
G1 X128.665 Y123.583 E.00194
; WIPE_START
G1 F3000
M204 S6000
G1 X128.605 Y123.648 E-.03374
G1 X128.483 Y123.747 E-.05984
G1 X128.325 Y123.828 E-.0674
G1 X128.154 Y123.876 E-.0673
G1 X127.978 Y123.889 E-.06728
G1 X127.802 Y123.867 E-.06736
G1 X127.634 Y123.811 E-.06734
G1 X127.481 Y123.722 E-.06729
G1 X127.348 Y123.605 E-.06733
G1 X127.241 Y123.464 E-.06728
G1 X127.164 Y123.304 E-.06733
G1 X127.125 Y123.15 E-.06052
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


; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 30/35
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.991 Y132.503 I-.467 J.169 E.08317
G1 X128.02 Y132.503 E.00094
G3 X128.442 Y132.775 I-.021 J.497 E.01748
M204 S250
G1 X128.841 Y132.714 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.876 Y132.868 E.00485
G3 X127.979 Y132.11 I-.879 J.131 E.13228
G1 X128.038 Y132.111 E.00181
G3 X128.818 Y132.659 I-.042 J.888 E.0309
; WIPE_START
G1 F3000
M204 S6000
G1 X128.876 Y132.868 E-.08251
G1 X128.889 Y133.044 E-.06716
G1 X128.862 Y133.219 E-.06733
G1 X128.802 Y133.386 E-.06737
G1 X128.709 Y133.537 E-.06729
G1 X128.61 Y133.648 E-.0565
G1 X128.483 Y133.747 E-.06141
G1 X128.325 Y133.828 E-.06732
G1 X128.155 Y133.876 E-.0673
G1 X127.978 Y133.889 E-.06733
G1 X127.802 Y133.867 E-.06732
G1 X127.749 Y133.85 E-.02116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.179 Y126.229 Z6.4 F42000
G1 X128.341 Y123.36 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.991 Y122.503 I-.343 J-.36 E.06408
G1 X128.02 Y122.503 E.00094
G3 X128.382 Y123.316 I-.021 J.497 E.03657
M204 S250
G1 X128.627 Y123.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.608 Y123.645 E.00077
G3 X127.979 Y122.11 I-.611 J-.646 E.10601
G1 X128.038 Y122.111 E.00181
G3 X128.706 Y123.535 I-.042 J.888 E.0593
G1 X128.665 Y123.583 E.00194
; WIPE_START
G1 F3000
M204 S6000
G1 X128.608 Y123.645 E-.03227
G1 X128.483 Y123.747 E-.06128
G1 X128.325 Y123.828 E-.06735
G1 X128.155 Y123.876 E-.0673
G1 X127.978 Y123.889 E-.06734
G1 X127.802 Y123.867 E-.06732
G1 X127.634 Y123.811 E-.06732
G1 X127.481 Y123.722 E-.0673
G1 X127.348 Y123.605 E-.06739
G1 X127.241 Y123.464 E-.06737
G1 X127.164 Y123.304 E-.06729
G1 X127.125 Y123.15 E-.06048
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


; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 31/35
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.992 Y132.503 I-.467 J.169 E.08319
G1 X128.016 Y132.503 E.00082
G3 X128.442 Y132.775 I-.018 J.497 E.01759
M204 S250
G1 X128.842 Y132.719 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.876 Y132.868 E.00471
G3 X127.979 Y132.11 I-.879 J.131 E.13229
G1 X128.034 Y132.111 E.00168
G3 X128.82 Y132.663 I-.038 J.888 E.03116
; WIPE_START
G1 F3000
M204 S6000
G1 X128.876 Y132.868 E-.08082
M73 P94 R0
G1 X128.889 Y133.044 E-.06717
G1 X128.862 Y133.219 E-.06733
G1 X128.802 Y133.386 E-.06738
G1 X128.709 Y133.537 E-.06729
G1 X128.613 Y133.645 E-.05509
G1 X128.483 Y133.747 E-.06279
G1 X128.325 Y133.828 E-.06725
G1 X128.154 Y133.876 E-.06744
G1 X127.978 Y133.889 E-.06727
G1 X127.802 Y133.867 E-.06735
G1 X127.745 Y133.848 E-.02283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.18 Y126.228 Z6.6 F42000
G1 X128.343 Y123.358 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.992 Y122.503 I-.345 J-.358 E.0642
G1 X128.016 Y122.503 E.00082
G3 X128.384 Y123.313 I-.018 J.497 E.03658
M204 S250
G1 X128.627 Y123.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.61 Y123.643 E.00066
G3 X127.979 Y122.11 I-.614 J-.643 E.10613
G1 X128.034 Y122.111 E.00168
G3 X128.706 Y123.535 I-.038 J.888 E.05942
G1 X128.666 Y123.583 E.00195
; WIPE_START
G1 F3000
M204 S6000
G1 X128.61 Y123.643 E-.03082
G1 X128.483 Y123.747 E-.06272
G1 X128.325 Y123.828 E-.06724
G1 X128.154 Y123.876 E-.06744
G1 X127.978 Y123.889 E-.06727
G1 X127.802 Y123.867 E-.06735
G1 X127.634 Y123.811 E-.06737
G1 X127.481 Y123.722 E-.06734
G1 X127.348 Y123.605 E-.06726
G1 X127.241 Y123.464 E-.0673
G1 X127.164 Y123.304 E-.06733
G1 X127.125 Y123.15 E-.06057
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


; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 32/35
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.992 Y132.503 I-.467 J.169 E.08322
G1 X128.013 Y132.503 E.0007
G3 X128.442 Y132.775 I-.015 J.497 E.01768
M204 S250
G1 X128.843 Y132.723 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.876 Y132.868 E.00458
G3 X127.979 Y132.11 I-.879 J.131 E.13228
G1 X128.03 Y132.111 E.00157
G3 X128.822 Y132.667 I-.034 J.889 E.03141
; WIPE_START
G1 F3000
M204 S6000
G1 X128.876 Y132.868 E-.07924
G1 X128.889 Y133.044 E-.06716
G1 X128.862 Y133.22 E-.06734
G1 X128.802 Y133.386 E-.06737
G1 X128.709 Y133.537 E-.06733
G1 X128.615 Y133.643 E-.05364
G1 X128.483 Y133.747 E-.06411
G1 X128.325 Y133.828 E-.06737
G1 X128.155 Y133.876 E-.06735
G1 X127.978 Y133.889 E-.06731
G1 X127.802 Y133.867 E-.06736
G1 X127.741 Y133.847 E-.02442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.18 Y126.227 Z6.8 F42000
G1 X128.345 Y123.356 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.992 Y122.503 I-.347 J-.356 E.06433
G1 X128.013 Y122.503 E.0007
G3 X128.386 Y123.311 I-.015 J.497 E.03657
M204 S250
G1 X128.627 Y123.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.613 Y123.641 E.00055
G3 X127.979 Y122.11 I-.616 J-.641 E.10622
G1 X128.03 Y122.111 E.00157
G3 X128.707 Y123.535 I-.034 J.889 E.05956
G1 X128.666 Y123.584 E.00195
; WIPE_START
G1 F3000
M204 S6000
G1 X128.613 Y123.641 E-.02946
G1 X128.483 Y123.747 E-.06401
G1 X128.325 Y123.828 E-.06736
G1 X128.154 Y123.876 E-.06735
G1 X127.978 Y123.889 E-.0673
G1 X127.802 Y123.867 E-.06736
G1 X127.634 Y123.811 E-.06727
G1 X127.481 Y123.722 E-.06739
G1 X127.348 Y123.605 E-.06735
G1 X127.241 Y123.464 E-.06727
G1 X127.164 Y123.304 E-.06735
G1 X127.125 Y123.15 E-.06053
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


; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 33/35
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G1 X128.466 Y132.83 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.993 Y132.503 I-.467 J.169 E.08324
G1 X128.01 Y132.503 E.00057
G3 X128.442 Y132.775 I-.012 J.497 E.01779
M204 S250
G1 X128.844 Y132.727 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.877 Y132.868 E.00445
G3 X127.98 Y132.11 I-.879 J.132 E.13227
G1 X128.027 Y132.111 E.00144
G3 X128.824 Y132.67 I-.029 J.889 E.03167
; WIPE_START
G1 F3000
M204 S6000
G1 X128.877 Y132.868 E-.07771
M73 P95 R0
G1 X128.889 Y133.044 E-.06711
G1 X128.862 Y133.22 E-.06744
G1 X128.802 Y133.386 E-.06731
G1 X128.709 Y133.537 E-.06728
G1 X128.618 Y133.64 E-.05233
G1 X128.483 Y133.747 E-.06561
G1 X128.325 Y133.828 E-.06727
G1 X128.154 Y133.876 E-.06738
G1 X127.978 Y133.889 E-.06728
G1 X127.802 Y133.867 E-.06741
G1 X127.737 Y133.846 E-.02587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.181 Y126.226 Z7 F42000
G1 X128.348 Y123.353 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X127.993 Y122.503 I-.349 J-.354 E.06446
G1 X128.01 Y122.503 E.00057
G3 X128.388 Y123.309 I-.012 J.497 E.03658
M204 S250
G1 X128.627 Y123.63 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.616 Y123.638 E.00043
G3 X127.98 Y122.11 I-.619 J-.639 E.10632
G1 X128.027 Y122.111 E.00144
G3 X128.707 Y123.536 I-.029 J.889 E.05971
G1 X128.666 Y123.584 E.00195
; WIPE_START
G1 F3000
M204 S6000
G1 X128.616 Y123.638 E-.02803
G1 X128.483 Y123.747 E-.06555
G1 X128.325 Y123.828 E-.06729
G1 X128.154 Y123.876 E-.06738
G1 X127.978 Y123.889 E-.06728
G1 X127.802 Y123.867 E-.06741
G1 X127.634 Y123.811 E-.06728
G1 X127.481 Y123.722 E-.06731
G1 X127.348 Y123.605 E-.06733
G1 X127.241 Y123.464 E-.06737
G1 X127.164 Y123.304 E-.06729
G1 X127.125 Y123.15 E-.06049
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


; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 34/35
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G1 X128.482 Y132.877 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X128.015 Y132.503 I-.482 J.123 E.08225
G1 X128.062 Y132.507 E.00155
G3 X128.464 Y132.82 I-.061 J.493 E.01777
M204 S250
G1 X128.852 Y132.751 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.863 Y132.78 E.00096
G3 X128.026 Y132.111 I-.862 J.219 E.13632
G1 X128.111 Y132.117 E.00262
G3 X128.802 Y132.614 I-.11 J.882 E.02728
G1 X128.831 Y132.695 E.00264
; WIPE_START
G1 F3000
M204 S6000
G1 X128.863 Y132.78 E-.03469
G1 X128.889 Y132.956 E-.06734
G1 X128.88 Y133.133 E-.06733
G1 X128.836 Y133.304 E-.0673
G1 X128.759 Y133.464 E-.06744
G1 X128.651 Y133.607 E-.06811
G1 X128.555 Y133.696 E-.04967
G1 X128.406 Y133.792 E-.06726
G1 X128.241 Y133.856 E-.0674
G1 X128.066 Y133.887 E-.06735
G1 X127.889 Y133.883 E-.06737
G1 X127.717 Y133.843 E-.06719
G1 X127.713 Y133.842 E-.00155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.165 Y126.223 Z7.2 F42000
G1 X128.335 Y123.36 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.31 Y123.388 E.00126
G3 X128.015 Y122.503 I-.31 J-.389 E.06334
G1 X128.062 Y122.507 E.00155
G3 X128.424 Y123.259 I-.061 J.493 E.03293
G1 X128.375 Y123.315 E.00246
M204 S250
G1 X128.634 Y123.623 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.555 Y123.695 E.0033
G3 X128.026 Y122.111 I-.554 J-.696 E.10496
G1 X128.111 Y122.117 E.00262
G3 X128.675 Y123.579 I-.11 J.882 E.05895
; WIPE_START
G1 F3000
M204 S6000
G1 X128.555 Y123.695 E-.06348
G1 X128.406 Y123.792 E-.06727
G1 X128.241 Y123.856 E-.0674
G1 X128.066 Y123.887 E-.06736
G1 X127.889 Y123.883 E-.06737
G1 X127.717 Y123.843 E-.06719
G1 X127.555 Y123.77 E-.06745
G1 X127.411 Y123.667 E-.06728
G1 X127.291 Y123.537 E-.06728
G1 X127.164 Y123.304 E-.10079
G1 X127.127 Y123.159 E-.05713
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


; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 35/35
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G1 X128.854 Y132.765 F42000
M73 P96 R0
G1 Z7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X128.872 Y132.824 E.00188
G3 X127.978 Y132.111 I-.872 J.176 E.13351
G1 X128.066 Y132.113 E.00272
G3 X128.819 Y132.655 I-.067 J.887 E.02999
G1 X128.836 Y132.708 E.00171
; WIPE_START
G1 F3000
M204 S6000
G1 X128.872 Y132.824 E-.04606
G1 X128.89 Y133 E-.06736
G1 X128.872 Y133.176 E-.06738
G1 X128.82 Y133.346 E-.06729
G1 X128.735 Y133.501 E-.06734
G1 X128.621 Y133.637 E-.06729
G1 X128.483 Y133.747 E-.06736
G1 X128.368 Y133.81 E-.04954
G1 X128.198 Y133.867 E-.0683
G1 X128.022 Y133.889 E-.06737
G1 X127.846 Y133.876 E-.06728
G1 X127.7 Y133.835 E-.05745
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


G1 X127.814 Y132.347 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X128.654 Y133.187 E.03649
G1 X128.446 Y133.512
G1 X127.487 Y132.553 E.04166
G1 X127.324 Y132.923
G1 X128.077 Y133.676 E.03272
M204 S10000
G1 X127.733 Y133.624 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113253
G1 F1200
M204 S6000
G3 X127.377 Y133.269 I.742 J-1.099 E.0029
; WIPE_START
G1 F15000
G1 X127.496 Y133.423 E-.29242
G1 X127.733 Y133.624 E-.46758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.782 Y132.353 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.10949
G1 F1200
M204 S6000
G2 X127.65 Y132.449 I.473 J.792 E.00089
; WIPE_START
G1 F15000
G1 X127.782 Y132.353 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.69 Y132.916 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.173639
G1 F1200
M204 S6000
G1 X128.546 Y132.702 E.00274
; LINE_WIDTH: 0.210402
G2 X128.124 Y132.314 I-1.487 J1.195 E.00786
; WIPE_START
G1 F15000
G1 X128.381 Y132.522 E-.4368
G1 X128.546 Y132.702 E-.3232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.619 Y125.07 Z7.4 F42000
G1 X128.633 Y123.622 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.519 Y123.722 E.00465
G3 X127.978 Y122.111 I-.519 J-.722 E.10218
G1 X128.066 Y122.113 E.00272
G3 X128.674 Y123.579 I-.067 J.887 E.06027
; WIPE_START
G1 F3000
M204 S6000
G1 X128.519 Y123.722 E-.08018
G1 X128.366 Y123.811 E-.06734
G1 X128.198 Y123.867 E-.06727
G1 X128.022 Y123.889 E-.06737
G1 X127.846 Y123.876 E-.06728
G1 X127.675 Y123.828 E-.06742
G1 X127.517 Y123.747 E-.06728
G1 X127.379 Y123.637 E-.06734
G1 X127.265 Y123.501 E-.06725
G1 X127.18 Y123.346 E-.06737
G1 X127.128 Y123.176 E-.06729
G1 X127.126 Y123.159 E-.00661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.923 Y122.324 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X128.676 Y123.077 E.03273
G1 X128.511 Y123.446
G1 X127.554 Y122.488 E.04161
G1 X127.346 Y122.813
G1 X128.186 Y123.653 E.03648
M204 S10000
G1 X127.876 Y123.686 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.210286
G1 F1200
M204 S6000
G3 X127.454 Y123.298 I1.064 J-1.582 E.00785
; LINE_WIDTH: 0.173516
G1 X127.31 Y123.084 E.00274
; WIPE_START
G1 F15000
G1 X127.454 Y123.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.377 Y123.587 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.108491
G1 F1200
M204 S6000
G1 X128.319 Y123.577 E.00032
G1 X128.22 Y123.645 E.00064
M204 S10000
G1 X128.623 Y122.731 F42000
; LINE_WIDTH: 0.113343
G1 F1200
M204 S6000
G2 X128.267 Y122.376 I-1.098 J.743 E.00291
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X128.504 Y122.577 E-.46752
G1 X128.623 Y122.731 E-.29248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
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
G1 Z7.4 F900 ; lower z a little
M73 P97 R0
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

    G1 Z107 F600
    G1 Z105

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

