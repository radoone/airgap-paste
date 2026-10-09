; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 25m 24s; total estimated time: 31m 54s
; total layer number: 53
; total filament length [mm] : 2758.01
; total filament volume [cm^3] : 6633.79
; total filament weight [g] : 8.23
; model label id: 66,77,88
; object max height: 10.60,10.60,10.60
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
M73 P0 R31
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
M73 P1 R31
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P2 R31
G1 X-48.2 F3000
M73 P3 R30
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
M73 P4 R30
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
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F1.8854 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
M73 P5 R30
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
M73 P18 R25
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
M73 P19 R25
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
    G29 A1 X101 Y101 I54 J54
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
; layer num/total_layer_count: 1/53
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X149.375 Y105.711 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X150.289 Y105.711 E.03405
G1 X150.289 Y122.289 E.61748
G1 X133.711 Y122.289 E.61748
G1 X133.711 Y105.711 E.61748
G1 X149.315 Y105.711 E.58119
M204 S6000
G1 X149.375 Y106.168 F42000
G1 F1500
M204 S500
G1 X149.832 Y106.168 E.01702
G1 X149.832 Y121.832 E.58343
G1 X134.168 Y121.832 E.58343
M73 P20 R25
G1 X134.168 Y106.168 E.58343
G1 X149.315 Y106.168 E.56417
M204 S6000
G1 X149.375 Y106.625 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X149.375 Y121.375 E.54938
G1 X134.625 Y121.375 E.54938
G1 X134.625 Y106.625 E.54938
G1 X149.315 Y106.625 E.54715
; WIPE_START
G1 X149.323 Y108.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.237 Y116.014 Z.6 F42000
G1 X153.761 Y125.761 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X130.239 Y125.761 E.8761
G1 X130.239 Y102.239 E.8761
G1 X153.761 Y102.239 E.8761
G1 X153.761 Y125.701 E.87386
M204 S6000
G1 X154.218 Y126.218 F42000
G1 F1500
M204 S500
G1 X129.782 Y126.218 E.91014
G1 X129.782 Y101.782 E.91014
G1 X154.218 Y101.782 E.91014
G1 X154.218 Y126.158 E.90791
M204 S6000
G1 X154.675 Y126.675 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X129.325 Y126.675 E.94419
G1 X129.325 Y101.325 E.94419
G1 X154.675 Y101.325 E.94419
G1 X154.675 Y126.615 E.94196
; WIPE_START
G1 X152.675 Y126.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 1 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer1 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.643 Y102.422 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50506
G1 F2400
M204 S500
G1 X153.372 Y103.151 E.03883
G1 X153.372 Y103.805 E.02461
G1 X152.195 Y102.628 E.06268
G1 X151.542 Y102.628 E.02461
G1 X153.372 Y104.458 E.09749
M73 P21 R25
G1 X153.372 Y105.112 E.02461
G1 X150.888 Y102.628 E.13229
G1 X150.235 Y102.628 E.02461
G1 X153.372 Y105.765 E.1671
G1 X153.372 Y106.419 E.02461
G1 X149.581 Y102.628 E.20191
G1 X148.928 Y102.628 E.02461
G1 X153.372 Y107.072 E.23671
G1 X153.372 Y107.726 E.02461
G1 X148.274 Y102.628 E.27152
G1 X147.62 Y102.628 E.02461
G1 X153.372 Y108.38 E.30633
G1 X153.372 Y109.033 E.02461
G1 X150.678 Y106.338 E.14351
G1 X150.678 Y106.992 E.02461
G1 X153.372 Y109.687 E.14351
G1 X153.372 Y110.34 E.02461
G1 X150.678 Y107.646 E.14351
G1 X150.678 Y108.299 E.02461
G1 X153.372 Y110.994 E.14351
G1 X153.372 Y111.647 E.02461
G1 X150.678 Y108.953 E.14351
G1 X150.678 Y109.606 E.02461
G1 X153.372 Y112.301 E.14351
G1 X153.372 Y112.954 E.02461
G1 X150.678 Y110.26 E.14351
G1 X150.678 Y110.913 E.02461
G1 X153.372 Y113.608 E.14351
G1 X153.372 Y114.262 E.02461
G1 X150.678 Y111.567 E.14351
G1 X150.678 Y112.22 E.02461
G1 X153.372 Y114.915 E.14351
G1 X153.372 Y115.569 E.02461
G1 X150.678 Y112.874 E.14351
G1 X150.678 Y113.528 E.02461
G1 X153.372 Y116.222 E.14351
G1 X153.372 Y116.876 E.02461
G1 X150.678 Y114.181 E.14351
G1 X150.678 Y114.835 E.02461
G1 X153.372 Y117.529 E.14351
G1 X153.372 Y118.183 E.02461
G1 X150.678 Y115.488 E.14351
G1 X150.678 Y116.142 E.02461
G1 X153.372 Y118.837 E.14351
G1 X153.372 Y119.49 E.02461
G1 X150.678 Y116.795 E.14351
G1 X150.678 Y117.449 E.02461
M73 P21 R24
G1 X153.372 Y120.144 E.14351
G1 X153.372 Y120.797 E.02461
G1 X150.678 Y118.103 E.14351
G1 X150.678 Y118.756 E.02461
G1 X153.372 Y121.451 E.14351
G1 X153.372 Y122.104 E.02461
G1 X150.678 Y119.41 E.14351
G1 X150.678 Y120.063 E.02461
G1 X153.372 Y122.758 E.14351
G1 X153.372 Y123.412 E.02461
G1 X150.678 Y120.717 E.14351
G1 X150.678 Y121.37 E.02461
G1 X153.372 Y124.065 E.14351
G1 X153.372 Y124.719 E.02461
G1 X150.678 Y122.024 E.14351
G1 X150.678 Y122.677 E.02461
G1 X153.372 Y125.372 E.14352
G1 X152.719 Y125.372 E.02461
G1 X150.024 Y122.678 E.14351
G1 X149.371 Y122.678 E.02461
G1 X152.065 Y125.372 E.14351
G1 X151.412 Y125.372 E.02461
G1 X148.717 Y122.678 E.14351
G1 X148.064 Y122.678 E.02461
G1 X150.758 Y125.372 E.14351
G1 X150.105 Y125.372 E.02461
G1 X147.41 Y122.678 E.14351
G1 X146.756 Y122.678 E.02461
G1 X149.451 Y125.372 E.14351
G1 X148.798 Y125.372 E.02461
G1 X146.103 Y122.678 E.14351
G1 X145.449 Y122.678 E.02461
G1 X148.144 Y125.372 E.14351
G1 X147.49 Y125.372 E.02461
G1 X144.796 Y122.678 E.14351
G1 X144.142 Y122.678 E.02461
G1 X146.837 Y125.372 E.14351
G1 X146.183 Y125.372 E.02461
G1 X143.489 Y122.678 E.14351
G1 X142.835 Y122.678 E.02461
G1 X145.53 Y125.372 E.14351
G1 X144.876 Y125.372 E.02461
G1 X142.181 Y122.678 E.14351
G1 X141.528 Y122.678 E.02461
G1 X144.223 Y125.372 E.14351
G1 X143.569 Y125.372 E.02461
G1 X140.874 Y122.678 E.14351
G1 X140.221 Y122.678 E.02461
G1 X142.915 Y125.372 E.14351
G1 X142.262 Y125.372 E.02461
G1 X139.567 Y122.678 E.14351
G1 X138.914 Y122.678 E.02461
G1 X141.608 Y125.372 E.14351
G1 X140.955 Y125.372 E.02461
G1 X138.26 Y122.678 E.14351
G1 X137.607 Y122.678 E.02461
G1 X140.301 Y125.372 E.14351
G1 X139.648 Y125.372 E.02461
G1 X136.953 Y122.678 E.14351
G1 X136.299 Y122.678 E.02461
G1 X138.994 Y125.372 E.14351
G1 X138.341 Y125.372 E.02461
G1 X135.646 Y122.678 E.14351
G1 X134.992 Y122.678 E.02461
G1 X137.687 Y125.372 E.14351
G1 X137.033 Y125.372 E.02461
G1 X134.133 Y122.472 E.15447
; WIPE_START
G1 X135.547 Y123.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.242 Y117.868 Z.6 F42000
G1 X149.867 Y105.528 Z.6
G1 Z.2
G1 E.8 F1800
M73 P22 R24
G1 F2400
M204 S500
G1 X146.967 Y102.628 E.15447
G1 X146.313 Y102.628 E.02461
G1 X149.008 Y105.322 E.14351
G1 X148.355 Y105.322 E.02461
G1 X145.66 Y102.628 E.14351
G1 X145.006 Y102.628 E.02461
G1 X147.701 Y105.322 E.14351
G1 X147.047 Y105.322 E.02461
G1 X144.353 Y102.628 E.14351
G1 X143.699 Y102.628 E.02461
G1 X146.394 Y105.322 E.14351
G1 X145.74 Y105.322 E.02461
G1 X143.046 Y102.628 E.14351
G1 X142.392 Y102.628 E.02461
G1 X145.087 Y105.322 E.14351
G1 X144.433 Y105.322 E.02461
G1 X141.738 Y102.628 E.14351
G1 X141.085 Y102.628 E.02461
G1 X143.78 Y105.322 E.14351
G1 X143.126 Y105.322 E.02461
G1 X140.431 Y102.628 E.14351
G1 X139.778 Y102.628 E.02461
G1 X142.472 Y105.322 E.14351
G1 X141.819 Y105.322 E.02461
G1 X139.124 Y102.628 E.14351
G1 X138.471 Y102.628 E.02461
G1 X141.165 Y105.322 E.14351
G1 X140.512 Y105.322 E.02461
G1 X137.817 Y102.628 E.14351
G1 X137.163 Y102.628 E.02461
G1 X139.858 Y105.322 E.14351
G1 X139.205 Y105.322 E.02461
G1 X136.51 Y102.628 E.14351
G1 X135.856 Y102.628 E.02461
G1 X138.551 Y105.322 E.14351
G1 X137.897 Y105.322 E.02461
G1 X135.203 Y102.628 E.14351
G1 X134.549 Y102.628 E.02461
G1 X137.244 Y105.322 E.14351
G1 X136.59 Y105.322 E.02461
G1 X133.896 Y102.628 E.14351
G1 X133.242 Y102.628 E.02461
G1 X135.937 Y105.322 E.14351
G1 X135.283 Y105.322 E.02461
G1 X132.589 Y102.628 E.14351
G1 X131.935 Y102.628 E.02461
G1 X134.63 Y105.322 E.14351
G1 X133.976 Y105.322 E.02461
G1 X131.281 Y102.628 E.14351
G1 X130.628 Y102.628 E.02461
G1 X133.323 Y105.322 E.14351
G1 X133.322 Y105.976 E.02461
G1 X130.628 Y103.281 E.14351
G1 X130.628 Y103.935 E.02461
G1 X133.322 Y106.629 E.14351
G1 X133.322 Y107.283 E.02461
G1 X130.628 Y104.588 E.14351
G1 X130.628 Y105.242 E.02461
G1 X133.322 Y107.936 E.14351
G1 X133.322 Y108.59 E.02461
G1 X130.628 Y105.895 E.14351
G1 X130.628 Y106.549 E.02461
G1 X133.322 Y109.244 E.14351
G1 X133.322 Y109.897 E.02461
G1 X130.628 Y107.202 E.14351
G1 X130.628 Y107.856 E.02461
G1 X133.322 Y110.551 E.14351
G1 X133.322 Y111.204 E.02461
G1 X130.628 Y108.51 E.14351
G1 X130.628 Y109.163 E.02461
G1 X133.322 Y111.858 E.14351
G1 X133.322 Y112.511 E.02461
G1 X130.628 Y109.817 E.14351
G1 X130.628 Y110.47 E.02461
G1 X133.322 Y113.165 E.14351
G1 X133.322 Y113.819 E.02461
G1 X130.628 Y111.124 E.14351
G1 X130.628 Y111.777 E.02461
G1 X133.322 Y114.472 E.14351
G1 X133.322 Y115.126 E.02461
G1 X130.628 Y112.431 E.14351
G1 X130.628 Y113.085 E.02461
G1 X133.322 Y115.779 E.14351
G1 X133.322 Y116.433 E.02461
G1 X130.628 Y113.738 E.14351
G1 X130.628 Y114.392 E.02461
G1 X133.322 Y117.086 E.14351
G1 X133.322 Y117.74 E.02461
G1 X130.628 Y115.045 E.14351
G1 X130.628 Y115.699 E.02461
G1 X133.322 Y118.393 E.14351
G1 X133.322 Y119.047 E.02461
G1 X130.628 Y116.352 E.14351
G1 X130.628 Y117.006 E.02461
G1 X133.322 Y119.701 E.14351
G1 X133.322 Y120.354 E.02461
G1 X130.628 Y117.659 E.14351
G1 X130.628 Y118.313 E.02461
G1 X133.322 Y121.008 E.14351
G1 X133.322 Y121.661 E.02461
G1 X130.628 Y118.967 E.14351
G1 X130.628 Y119.62 E.02461
G1 X136.38 Y125.372 E.30635
G1 X135.726 Y125.372 E.02461
G1 X130.628 Y120.274 E.27154
G1 X130.628 Y120.927 E.02461
G1 X135.073 Y125.372 E.23673
G1 X134.419 Y125.372 E.02461
G1 X130.628 Y121.581 E.20193
G1 X130.628 Y122.234 E.02461
G1 X133.766 Y125.372 E.16712
G1 X133.112 Y125.372 E.02461
G1 X130.628 Y122.888 E.13231
G1 X130.628 Y123.542 E.02461
G1 X132.458 Y125.372 E.0975
G1 X131.805 Y125.372 E.02461
G1 X130.628 Y124.195 E.0627
G1 X130.628 Y124.849 E.02461
G1 X131.357 Y125.578 E.03884
; OBJECT_ID: 66
; WIPE_START
G1 X130.628 Y124.849 E-.39196
G1 X130.628 Y124.195 E-.24835
G1 X130.85 Y124.418 E-.11968
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S6000
G1 X137.661 Y127.862 Z.6 F42000
G1 X149.325 Y133.761 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X150.239 Y133.761 E.03405
G1 X150.239 Y150.239 E.61375
G1 X133.761 Y150.239 E.61375
G1 X133.761 Y133.761 E.61375
G1 X149.265 Y133.761 E.57747
M204 S6000
G1 X149.325 Y134.218 F42000
G1 F1500
M204 S500
G1 X149.782 Y134.218 E.01702
G1 X149.782 Y149.782 E.57971
G1 X134.218 Y149.782 E.57971
G1 X134.218 Y134.218 E.57971
G1 X149.265 Y134.218 E.56045
M204 S6000
G1 X149.325 Y134.675 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X149.325 Y149.325 E.54566
G1 X134.675 Y149.325 E.54566
G1 X134.675 Y134.675 E.54566
G1 X149.265 Y134.675 E.54342
; WIPE_START
G1 X149.273 Y136.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.212 Y144.057 Z.6 F42000
G1 X153.761 Y153.761 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X130.239 Y153.761 E.8761
G1 X130.239 Y130.239 E.8761
G1 X153.761 Y130.239 E.8761
G1 X153.761 Y153.701 E.87386
M204 S6000
G1 X154.218 Y154.218 F42000
G1 F1500
M204 S500
G1 X129.782 Y154.218 E.91014
G1 X129.782 Y129.782 E.91014
G1 X154.218 Y129.782 E.91014
G1 X154.218 Y154.158 E.90791
M204 S6000
G1 X154.675 Y154.675 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X129.325 Y154.675 E.94419
G1 X129.325 Y129.325 E.94419
G1 X154.675 Y129.325 E.94419
M73 P23 R24
G1 X154.675 Y154.615 E.94196
; WIPE_START
G1 X152.675 Y154.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.665 Y146.987 Z.6 F42000
G1 X152.643 Y130.422 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50506
G1 F2400
M204 S500
G1 X153.372 Y131.151 E.03883
G1 X153.372 Y131.805 E.02461
G1 X152.195 Y130.628 E.06268
G1 X151.542 Y130.628 E.02461
G1 X153.372 Y132.458 E.09749
G1 X153.372 Y133.112 E.02461
G1 X150.888 Y130.628 E.13229
G1 X150.235 Y130.628 E.02461
G1 X153.372 Y133.765 E.1671
G1 X153.372 Y134.419 E.02461
G1 X149.581 Y130.628 E.20191
G1 X148.928 Y130.628 E.02461
G1 X153.372 Y135.072 E.23671
G1 X153.372 Y135.726 E.02461
G1 X148.274 Y130.628 E.27152
G1 X147.62 Y130.628 E.02461
G1 X153.372 Y136.38 E.30633
G1 X153.372 Y137.033 E.02461
G1 X150.628 Y134.288 E.14618
G1 X150.628 Y134.942 E.02461
G1 X153.372 Y137.687 E.14618
G1 X153.372 Y138.34 E.02461
G1 X150.628 Y135.595 E.14618
G1 X150.628 Y136.249 E.02461
G1 X153.372 Y138.994 E.14618
G1 X153.372 Y139.647 E.02461
G1 X150.628 Y136.903 E.14618
G1 X150.628 Y137.556 E.02461
G1 X153.372 Y140.301 E.14618
G1 X153.372 Y140.954 E.02461
G1 X150.628 Y138.21 E.14618
G1 X150.628 Y138.863 E.02461
G1 X153.372 Y141.608 E.14618
G1 X153.372 Y142.262 E.02461
G1 X150.628 Y139.517 E.14618
G1 X150.628 Y140.17 E.02461
G1 X153.372 Y142.915 E.14618
G1 X153.372 Y143.569 E.02461
G1 X150.628 Y140.824 E.14618
G1 X150.628 Y141.478 E.02461
G1 X153.372 Y144.222 E.14618
G1 X153.372 Y144.876 E.02461
G1 X150.628 Y142.131 E.14618
G1 X150.628 Y142.785 E.02461
G1 X153.372 Y145.529 E.14618
G1 X153.372 Y146.183 E.02461
G1 X150.628 Y143.438 E.14618
G1 X150.628 Y144.092 E.02461
G1 X153.372 Y146.837 E.14618
G1 X153.372 Y147.49 E.02461
G1 X150.628 Y144.745 E.14618
G1 X150.628 Y145.399 E.02461
G1 X153.372 Y148.144 E.14618
G1 X153.372 Y148.797 E.02461
G1 X150.628 Y146.053 E.14618
G1 X150.628 Y146.706 E.02461
G1 X153.372 Y149.451 E.14618
G1 X153.372 Y150.104 E.02461
G1 X150.628 Y147.36 E.14618
G1 X150.628 Y148.013 E.02461
G1 X153.372 Y150.758 E.14618
G1 X153.372 Y151.411 E.02461
G1 X150.628 Y148.667 E.14618
G1 X150.628 Y149.32 E.02461
G1 X153.372 Y152.065 E.14618
G1 X153.372 Y152.719 E.02461
G1 X150.628 Y149.974 E.14618
G1 X150.628 Y150.627 E.02461
G1 X153.372 Y153.372 E.14618
G1 X152.719 Y153.372 E.02461
G1 X149.974 Y150.628 E.14618
G1 X149.321 Y150.628 E.02461
G1 X152.065 Y153.372 E.14618
G1 X151.412 Y153.372 E.02461
G1 X148.667 Y150.628 E.14618
M73 P24 R24
G1 X148.014 Y150.628 E.02461
G1 X150.758 Y153.372 E.14618
G1 X150.105 Y153.372 E.02461
G1 X147.36 Y150.628 E.14618
G1 X146.706 Y150.628 E.02461
G1 X149.451 Y153.372 E.14618
G1 X148.798 Y153.372 E.02461
G1 X146.053 Y150.628 E.14618
G1 X145.399 Y150.628 E.02461
G1 X148.144 Y153.372 E.14618
G1 X147.49 Y153.372 E.02461
G1 X144.746 Y150.628 E.14618
G1 X144.092 Y150.628 E.02461
G1 X146.837 Y153.372 E.14618
G1 X146.183 Y153.372 E.02461
G1 X143.439 Y150.628 E.14618
G1 X142.785 Y150.628 E.02461
G1 X145.53 Y153.372 E.14618
G1 X144.876 Y153.372 E.02461
G1 X142.131 Y150.628 E.14618
G1 X141.478 Y150.628 E.02461
G1 X144.223 Y153.372 E.14618
G1 X143.569 Y153.372 E.02461
G1 X140.824 Y150.628 E.14618
G1 X140.171 Y150.628 E.02461
G1 X142.915 Y153.372 E.14618
G1 X142.262 Y153.372 E.02461
G1 X139.517 Y150.628 E.14618
G1 X138.864 Y150.628 E.02461
G1 X141.608 Y153.372 E.14618
G1 X140.955 Y153.372 E.02461
G1 X138.21 Y150.628 E.14618
G1 X137.557 Y150.628 E.02461
G1 X140.301 Y153.372 E.14618
G1 X139.648 Y153.372 E.02461
G1 X136.903 Y150.628 E.14618
G1 X136.249 Y150.628 E.02461
G1 X138.994 Y153.372 E.14618
G1 X138.341 Y153.372 E.02461
G1 X135.596 Y150.628 E.14618
G1 X134.942 Y150.628 E.02461
G1 X137.687 Y153.372 E.14618
G1 X137.033 Y153.372 E.02461
G1 X134.083 Y150.422 E.15713
; WIPE_START
G1 X135.497 Y151.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.228 Y145.847 Z.6 F42000
G1 X149.917 Y133.578 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X146.967 Y130.628 E.15713
G1 X146.313 Y130.628 E.02461
G1 X149.058 Y133.372 E.14618
G1 X148.405 Y133.372 E.02461
G1 X145.66 Y130.628 E.14618
G1 X145.006 Y130.628 E.02461
G1 X147.751 Y133.372 E.14618
G1 X147.097 Y133.372 E.02461
G1 X144.353 Y130.628 E.14618
G1 X143.699 Y130.628 E.02461
G1 X146.444 Y133.372 E.14618
G1 X145.79 Y133.372 E.02461
G1 X143.046 Y130.628 E.14618
G1 X142.392 Y130.628 E.02461
G1 X145.137 Y133.372 E.14618
G1 X144.483 Y133.372 E.02461
G1 X141.738 Y130.628 E.14618
G1 X141.085 Y130.628 E.02461
G1 X143.83 Y133.372 E.14618
G1 X143.176 Y133.372 E.02461
G1 X140.431 Y130.628 E.14618
G1 X139.778 Y130.628 E.02461
G1 X142.522 Y133.372 E.14618
G1 X141.869 Y133.372 E.02461
G1 X139.124 Y130.628 E.14618
G1 X138.471 Y130.628 E.02461
G1 X141.215 Y133.372 E.14618
G1 X140.562 Y133.372 E.02461
G1 X137.817 Y130.628 E.14618
G1 X137.163 Y130.628 E.02461
G1 X139.908 Y133.372 E.14618
G1 X139.255 Y133.372 E.02461
G1 X136.51 Y130.628 E.14618
G1 X135.856 Y130.628 E.02461
G1 X138.601 Y133.372 E.14618
G1 X137.947 Y133.372 E.02461
G1 X135.203 Y130.628 E.14618
G1 X134.549 Y130.628 E.02461
G1 X137.294 Y133.372 E.14618
G1 X136.64 Y133.372 E.02461
G1 X133.896 Y130.628 E.14618
G1 X133.242 Y130.628 E.02461
G1 X135.987 Y133.372 E.14618
G1 X135.333 Y133.372 E.02461
G1 X132.589 Y130.628 E.14618
G1 X131.935 Y130.628 E.02461
G1 X134.68 Y133.372 E.14618
G1 X134.026 Y133.372 E.02461
G1 X131.281 Y130.628 E.14618
G1 X130.628 Y130.628 E.02461
G1 X133.373 Y133.372 E.14618
G1 X133.372 Y134.026 E.02461
G1 X130.628 Y131.281 E.14618
G1 X130.628 Y131.935 E.02461
G1 X133.372 Y134.679 E.14618
G1 X133.372 Y135.333 E.02461
G1 X130.628 Y132.588 E.14618
G1 X130.628 Y133.242 E.02461
G1 X133.372 Y135.986 E.14618
G1 X133.372 Y136.64 E.02461
G1 X130.628 Y133.895 E.14618
G1 X130.628 Y134.549 E.02461
G1 X133.372 Y137.294 E.14618
G1 X133.372 Y137.947 E.02461
G1 X130.628 Y135.202 E.14618
G1 X130.628 Y135.856 E.02461
G1 X133.372 Y138.601 E.14618
G1 X133.372 Y139.254 E.02461
G1 X130.628 Y136.51 E.14618
G1 X130.628 Y137.163 E.02461
G1 X133.372 Y139.908 E.14618
G1 X133.372 Y140.561 E.02461
G1 X130.628 Y137.817 E.14618
G1 X130.628 Y138.47 E.02461
G1 X133.372 Y141.215 E.14618
G1 X133.372 Y141.869 E.02461
G1 X130.628 Y139.124 E.14618
G1 X130.628 Y139.777 E.02461
G1 X133.372 Y142.522 E.14618
G1 X133.372 Y143.176 E.02461
G1 X130.628 Y140.431 E.14618
G1 X130.628 Y141.085 E.02461
G1 X133.372 Y143.829 E.14618
G1 X133.372 Y144.483 E.02461
G1 X130.628 Y141.738 E.14618
G1 X130.628 Y142.392 E.02461
G1 X133.372 Y145.136 E.14618
G1 X133.372 Y145.79 E.02461
G1 X130.628 Y143.045 E.14618
G1 X130.628 Y143.699 E.02461
G1 X133.372 Y146.443 E.14618
G1 X133.372 Y147.097 E.02461
G1 X130.628 Y144.352 E.14618
G1 X130.628 Y145.006 E.02461
G1 X133.372 Y147.751 E.14618
G1 X133.372 Y148.404 E.02461
G1 X130.628 Y145.659 E.14618
G1 X130.628 Y146.313 E.02461
G1 X133.372 Y149.058 E.14618
G1 X133.372 Y149.711 E.02461
G1 X130.628 Y146.967 E.14618
G1 X130.628 Y147.62 E.02461
G1 X136.38 Y153.372 E.30635
G1 X135.726 Y153.372 E.02461
G1 X130.628 Y148.274 E.27154
G1 X130.628 Y148.927 E.02461
G1 X135.073 Y153.372 E.23673
G1 X134.419 Y153.372 E.02461
G1 X130.628 Y149.581 E.20193
G1 X130.628 Y150.234 E.02461
G1 X133.766 Y153.372 E.16712
G1 X133.112 Y153.372 E.02461
G1 X130.628 Y150.888 E.13231
G1 X130.628 Y151.542 E.02461
G1 X132.458 Y153.372 E.0975
G1 X131.805 Y153.372 E.02461
G1 X130.628 Y152.195 E.0627
G1 X130.628 Y152.849 E.02461
G1 X131.357 Y153.578 E.03884
; OBJECT_ID: 88
; WIPE_START
G1 X130.628 Y152.849 E-.39197
M73 P24 R23
G1 X130.628 Y152.195 E-.24835
G1 X130.85 Y152.418 E-.11968
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S6000
G1 X128.74 Y145.083 Z.6 F42000
G1 X121.425 Y119.661 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X122.339 Y119.661 E.03405
G1 X122.339 Y136.339 E.6212
G1 X105.661 Y136.339 E.6212
G1 X105.661 Y119.661 E.6212
G1 X121.365 Y119.661 E.58492
M204 S6000
G1 X121.425 Y120.118 F42000
G1 F1500
M204 S500
G1 X121.882 Y120.118 E.01702
G1 X121.882 Y135.882 E.58715
G1 X106.118 Y135.882 E.58715
G1 X106.118 Y120.118 E.58715
G1 X121.365 Y120.118 E.5679
M204 S6000
G1 X121.425 Y120.575 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X121.425 Y135.425 E.55311
G1 X106.575 Y135.425 E.55311
G1 X106.575 Y120.575 E.55311
G1 X121.365 Y120.575 E.55087
; WIPE_START
G1 X121.373 Y122.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.261 Y129.97 Z.6 F42000
G1 X125.761 Y139.761 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X102.239 Y139.761 E.8761
G1 X102.239 Y116.239 E.8761
G1 X125.761 Y116.239 E.8761
M73 P25 R23
G1 X125.761 Y139.701 E.87386
M204 S6000
G1 X126.218 Y140.218 F42000
G1 F1500
M204 S500
G1 X101.782 Y140.218 E.91014
G1 X101.782 Y115.782 E.91014
G1 X126.218 Y115.782 E.91014
G1 X126.218 Y140.158 E.90791
M204 S6000
G1 X126.675 Y140.675 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X101.325 Y140.675 E.94419
G1 X101.325 Y115.325 E.94419
G1 X126.675 Y115.325 E.94419
G1 X126.675 Y140.615 E.94196
; WIPE_START
G1 X124.675 Y140.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.665 Y132.987 Z.6 F42000
G1 X124.643 Y116.422 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50506
G1 F2400
M204 S500
G1 X125.372 Y117.151 E.03883
G1 X125.372 Y117.805 E.02461
G1 X124.195 Y116.628 E.06268
G1 X123.542 Y116.628 E.02461
G1 X125.372 Y118.458 E.09749
G1 X125.372 Y119.112 E.02461
G1 X122.888 Y116.628 E.13229
G1 X122.235 Y116.628 E.02461
G1 X125.372 Y119.765 E.1671
G1 X125.372 Y120.419 E.02461
G1 X121.581 Y116.628 E.20191
G1 X120.928 Y116.628 E.02461
G1 X125.372 Y121.072 E.23671
G1 X125.372 Y121.726 E.02461
G1 X120.274 Y116.628 E.27152
G1 X119.621 Y116.628 E.02461
G1 X122.265 Y119.272 E.14085
G1 X122.728 Y119.272 E.01742
G1 X122.728 Y119.735 E.01742
G1 X125.372 Y122.38 E.14085
G1 X125.372 Y123.033 E.02461
G1 X122.728 Y120.388 E.14085
M73 P26 R23
G1 X122.728 Y121.042 E.02461
G1 X125.372 Y123.687 E.14085
G1 X125.372 Y124.34 E.02461
G1 X122.728 Y121.696 E.14085
G1 X122.728 Y122.349 E.02461
G1 X125.372 Y124.994 E.14085
G1 X125.372 Y125.647 E.02461
G1 X122.728 Y123.003 E.14085
G1 X122.728 Y123.656 E.02461
G1 X125.372 Y126.301 E.14085
G1 X125.372 Y126.954 E.02461
G1 X122.728 Y124.31 E.14085
G1 X122.728 Y124.963 E.02461
G1 X125.372 Y127.608 E.14085
G1 X125.372 Y128.262 E.02461
G1 X122.728 Y125.617 E.14085
G1 X122.728 Y126.27 E.02461
G1 X125.372 Y128.915 E.14085
G1 X125.372 Y129.569 E.02461
G1 X122.728 Y126.924 E.14085
G1 X122.728 Y127.578 E.02461
G1 X125.372 Y130.222 E.14085
G1 X125.372 Y130.876 E.02461
G1 X122.728 Y128.231 E.14085
G1 X122.728 Y128.885 E.02461
G1 X125.372 Y131.529 E.14085
G1 X125.372 Y132.183 E.02461
G1 X122.728 Y129.538 E.14085
G1 X122.728 Y130.192 E.02461
G1 X125.372 Y132.837 E.14085
G1 X125.372 Y133.49 E.02461
G1 X122.728 Y130.845 E.14085
G1 X122.728 Y131.499 E.02461
G1 X125.372 Y134.144 E.14085
G1 X125.372 Y134.797 E.02461
G1 X122.728 Y132.153 E.14085
G1 X122.728 Y132.806 E.02461
G1 X125.372 Y135.451 E.14085
G1 X125.372 Y136.104 E.02461
G1 X122.728 Y133.46 E.14085
G1 X122.728 Y134.113 E.02461
G1 X125.372 Y136.758 E.14085
G1 X125.372 Y137.412 E.02461
G1 X122.728 Y134.767 E.14085
G1 X122.728 Y135.42 E.02461
G1 X125.372 Y138.065 E.14085
G1 X125.372 Y138.719 E.02461
G1 X122.728 Y136.074 E.14085
G1 X122.728 Y136.727 E.02461
G1 X125.372 Y139.372 E.14085
G1 X124.719 Y139.372 E.02461
G1 X122.074 Y136.728 E.14085
G1 X121.421 Y136.728 E.02461
G1 X124.065 Y139.372 E.14085
G1 X123.412 Y139.372 E.02461
G1 X120.767 Y136.728 E.14085
G1 X120.114 Y136.728 E.02461
G1 X122.758 Y139.372 E.14085
G1 X122.105 Y139.372 E.02461
G1 X119.46 Y136.728 E.14085
G1 X118.806 Y136.728 E.02461
G1 X121.451 Y139.372 E.14085
G1 X120.798 Y139.372 E.02461
G1 X118.153 Y136.728 E.14085
G1 X117.499 Y136.728 E.02461
G1 X120.144 Y139.372 E.14085
G1 X119.49 Y139.372 E.02461
G1 X116.846 Y136.728 E.14085
G1 X116.192 Y136.728 E.02461
G1 X118.837 Y139.372 E.14085
G1 X118.183 Y139.372 E.02461
G1 X115.539 Y136.728 E.14085
G1 X114.885 Y136.728 E.02461
G1 X117.53 Y139.372 E.14085
G1 X116.876 Y139.372 E.02461
G1 X114.231 Y136.728 E.14085
G1 X113.578 Y136.728 E.02461
G1 X116.223 Y139.372 E.14085
G1 X115.569 Y139.372 E.02461
G1 X112.924 Y136.728 E.14085
G1 X112.271 Y136.728 E.02461
G1 X114.916 Y139.372 E.14085
G1 X114.262 Y139.372 E.02461
G1 X111.617 Y136.728 E.14085
G1 X110.964 Y136.728 E.02461
G1 X113.608 Y139.372 E.14085
G1 X112.955 Y139.372 E.02461
G1 X110.31 Y136.728 E.14085
G1 X109.657 Y136.728 E.02461
G1 X112.301 Y139.372 E.14085
G1 X111.648 Y139.372 E.02461
G1 X109.003 Y136.728 E.14085
G1 X108.349 Y136.728 E.02461
G1 X110.994 Y139.372 E.14085
G1 X110.341 Y139.372 E.02461
G1 X107.696 Y136.728 E.14085
G1 X107.042 Y136.728 E.02461
G1 X109.687 Y139.372 E.14085
G1 X109.033 Y139.372 E.02461
G1 X106.183 Y136.522 E.1518
; WIPE_START
G1 X107.597 Y137.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.255 Y131.89 Z.6 F42000
G1 X121.817 Y119.478 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X118.967 Y116.628 E.1518
G1 X118.313 Y116.628 E.02461
G1 X120.958 Y119.272 E.14085
G1 X120.305 Y119.272 E.02461
G1 X117.66 Y116.628 E.14085
G1 X117.006 Y116.628 E.02461
G1 X119.651 Y119.272 E.14085
G1 X118.997 Y119.272 E.02461
G1 X116.353 Y116.628 E.14085
G1 X115.699 Y116.628 E.02461
G1 X118.344 Y119.272 E.14085
G1 X117.69 Y119.272 E.02461
G1 X115.046 Y116.628 E.14085
G1 X114.392 Y116.628 E.02461
G1 X117.037 Y119.272 E.14085
G1 X116.383 Y119.272 E.02461
G1 X113.738 Y116.628 E.14085
G1 X113.085 Y116.628 E.02461
G1 X115.73 Y119.272 E.14085
G1 X115.076 Y119.272 E.02461
G1 X112.431 Y116.628 E.14085
G1 X111.778 Y116.628 E.02461
G1 X114.422 Y119.272 E.14085
G1 X113.769 Y119.272 E.02461
G1 X111.124 Y116.628 E.14085
G1 X110.471 Y116.628 E.02461
G1 X113.115 Y119.272 E.14085
G1 X112.462 Y119.272 E.02461
G1 X109.817 Y116.628 E.14085
G1 X109.163 Y116.628 E.02461
G1 X111.808 Y119.272 E.14085
G1 X111.155 Y119.272 E.02461
G1 X108.51 Y116.628 E.14085
G1 X107.856 Y116.628 E.02461
G1 X110.501 Y119.272 E.14085
G1 X109.847 Y119.272 E.02461
G1 X107.203 Y116.628 E.14085
G1 X106.549 Y116.628 E.02461
G1 X109.194 Y119.272 E.14085
G1 X108.54 Y119.272 E.02461
G1 X105.896 Y116.628 E.14085
G1 X105.242 Y116.628 E.02461
G1 X107.887 Y119.272 E.14085
G1 X107.233 Y119.272 E.02461
G1 X104.589 Y116.628 E.14085
G1 X103.935 Y116.628 E.02461
G1 X106.58 Y119.272 E.14085
G1 X105.926 Y119.272 E.02461
G1 X103.281 Y116.628 E.14085
G1 X102.628 Y116.628 E.02461
G1 X105.273 Y119.272 E.14085
G1 X105.272 Y119.926 E.02461
G1 X102.628 Y117.281 E.14085
G1 X102.628 Y117.935 E.02461
G1 X105.272 Y120.579 E.14085
G1 X105.272 Y121.233 E.02461
G1 X102.628 Y118.588 E.14085
G1 X102.628 Y119.242 E.02461
G1 X105.272 Y121.886 E.14085
G1 X105.272 Y122.54 E.02461
G1 X102.628 Y119.895 E.14085
G1 X102.628 Y120.549 E.02461
G1 X105.272 Y123.194 E.14085
G1 X105.272 Y123.847 E.02461
G1 X102.628 Y121.202 E.14085
G1 X102.628 Y121.856 E.02461
G1 X105.272 Y124.501 E.14085
G1 X105.272 Y125.154 E.02461
G1 X102.628 Y122.51 E.14085
G1 X102.628 Y123.163 E.02461
G1 X105.272 Y125.808 E.14085
G1 X105.272 Y126.461 E.02461
G1 X102.628 Y123.817 E.14085
G1 X102.628 Y124.47 E.02461
G1 X105.272 Y127.115 E.14085
G1 X105.272 Y127.769 E.02461
G1 X102.628 Y125.124 E.14085
G1 X102.628 Y125.777 E.02461
G1 X105.272 Y128.422 E.14085
G1 X105.272 Y129.076 E.02461
G1 X102.628 Y126.431 E.14085
G1 X102.628 Y127.085 E.02461
G1 X105.272 Y129.729 E.14085
G1 X105.272 Y130.383 E.02461
G1 X102.628 Y127.738 E.14085
G1 X102.628 Y128.392 E.02461
G1 X105.272 Y131.036 E.14085
G1 X105.272 Y131.69 E.02461
G1 X102.628 Y129.045 E.14085
G1 X102.628 Y129.699 E.02461
G1 X105.272 Y132.343 E.14085
G1 X105.272 Y132.997 E.02461
G1 X102.628 Y130.352 E.14085
G1 X102.628 Y131.006 E.02461
G1 X105.272 Y133.651 E.14085
G1 X105.272 Y134.304 E.02461
G1 X102.628 Y131.659 E.14085
G1 X102.628 Y132.313 E.02461
G1 X105.272 Y134.958 E.14085
G1 X105.272 Y135.611 E.02461
G1 X102.628 Y132.967 E.14085
G1 X102.628 Y133.62 E.02461
G1 X105.272 Y136.265 E.14085
G1 X105.272 Y136.728 E.01743
G1 X105.735 Y136.728 E.01743
G1 X108.38 Y139.372 E.14085
G1 X107.726 Y139.372 E.02461
G1 X102.628 Y134.274 E.27154
G1 X102.628 Y134.927 E.02461
G1 X107.073 Y139.372 E.23673
M73 P27 R23
G1 X106.419 Y139.372 E.02461
G1 X102.628 Y135.581 E.20193
G1 X102.628 Y136.234 E.02461
G1 X105.766 Y139.372 E.16712
G1 X105.112 Y139.372 E.02461
G1 X102.628 Y136.888 E.13231
G1 X102.628 Y137.542 E.02461
G1 X104.458 Y139.372 E.0975
G1 X103.805 Y139.372 E.02461
G1 X102.628 Y138.195 E.0627
G1 X102.628 Y138.849 E.02461
G1 X103.357 Y139.578 E.03884
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2400
G1 X102.628 Y138.849 E-.39196
G1 X102.628 Y138.195 E-.24835
G1 X102.85 Y138.418 E-.11968
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 2/53
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S183.6
; open powerlost recovery
M1003 S1
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.698 J.997 P1  F42000
G1 X149.26 Y105.941 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z.8 F42000
G1 X153.991 Y125.991 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 2 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer2 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.431 Y103.988 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X133.737 Y103.975 E.01272
G1 X150.203 Y103.975 E.68208
M204 S10000
G1 X132.3 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y104.277 E.00227
G1 X132.287 Y104.309 E.00183
M204 S10000
G1 X131.975 Y105.737 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X132.043 Y105.513 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X132.112 Y105.288 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X132.18 Y105.063 E.00728
G1 X132.537 Y104.538 E.01971
G1 X133.063 Y104.18 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X133.155 Y104.132 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.247 Y104.084 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.339 Y104.036 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X133.431 Y103.988 E.00435
G1 X133.325 Y103.969 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.219 Y103.949 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.113 Y103.929 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X133.007 Y103.909 E.00331
G1 X131.909 Y103.909 E.03382
G1 X131.909 Y105.007 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X131.93 Y105.231 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X131.95 Y105.454 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X131.97 Y105.678 E.00889
M204 S10000
G1 X133.549 Y122.263 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.549 Y105.737 E.50776
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.572 Y122.318 E.00259
M204 S10000
G1 X133.172 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.172 Y105.737 E.50776
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.177 Y122.322 E.00117
M204 S10000
G1 X132.795 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.795 Y105.737 E.50776
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.807 Y122.321 E.0099
M204 S10000
G1 X132.418 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.418 Y105.737 E.50776
G1 X132.526 Y105.213 E.01645
G1 X132.804 Y104.804 E.0152
G1 X133.213 Y104.526 E.0152
G3 X133.737 Y104.418 I.524 J1.211 E.01656
G1 X150.263 Y104.418 E.50776
G1 X150.787 Y104.526 E.01645
G1 X151.196 Y104.804 E.0152
G1 X151.474 Y105.213 E.0152
G1 X151.582 Y105.737 E.01645
G1 X151.582 Y122.263 E.50776
G3 X151.474 Y122.787 I-1.32 J0 E.01656
G1 X151.196 Y123.196 E.0152
G1 X150.787 Y123.474 E.0152
G3 X150.263 Y123.582 I-.524 J-1.211 E.01656
G1 X133.737 Y123.582 E.50776
G1 X133.213 Y123.474 E.01645
G1 X132.804 Y123.196 E.0152
G1 X132.526 Y122.787 E.0152
G3 X132.423 Y122.322 I1.069 J-.482 E.01472
M204 S10000
G1 X131.988 Y122.569 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X131.975 Y122.263 E.01272
G1 X131.975 Y105.797 E.68208
M204 S10000
G1 X132.3 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y123.723 E.00227
G1 X132.287 Y123.754 E.00183
M204 S10000
G1 X133.737 Y124.025 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X133.513 Y123.957 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.288 Y123.888 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X133.063 Y123.82 E.00728
G1 X132.537 Y123.463 E.01971
G1 X132.18 Y122.937 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X132.132 Y122.845 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X132.084 Y122.753 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X132.036 Y122.661 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X131.988 Y122.569 E.00435
G1 X131.969 Y122.675 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X131.949 Y122.781 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X131.929 Y122.887 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X131.909 Y122.993 E.00331
G1 X131.909 Y124.091 E.03382
G1 X133.007 Y124.091 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X133.231 Y124.07 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.454 Y124.05 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X133.678 Y124.03 E.00889
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X150.263 Y124.025 E.01272
G1 X133.797 Y124.025 E.68208
M204 S10000
G1 X151.745 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y123.723 E.00227
G1 X151.732 Y123.754 E.00183
M204 S10000
G1 X152.012 Y122.569 F42000
; LINE_WIDTH: 0.558004
G1 F6989.155
M204 S6000
G1 X151.964 Y122.661 E.00435
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X151.916 Y122.753 E.00401
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X151.868 Y122.845 E.00368
; LINE_WIDTH: 0.421475
G1 F9509.858
G1 X151.463 Y123.463 E.02279
G1 X150.937 Y123.82 E.01961
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X150.845 Y123.868 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.753 Y123.916 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.661 Y123.964 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X150.569 Y124.012 E.00435
G1 X150.675 Y124.031 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.781 Y124.051 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.887 Y124.071 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X150.993 Y124.091 E.00331
G1 X152.091 Y124.091 E.03382
G1 X152.091 Y122.993 E.03382
; LINE_WIDTH: 0.439707
G1 F9072.895
G1 X152.074 Y122.902 E.00299
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X152.057 Y122.811 E.00329
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X152.04 Y122.72 E.00359
; LINE_WIDTH: 0.558004
G1 F6989.155
G1 X152.023 Y122.628 E.00389
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.529182
G1 F7403.421
M204 S6000
G1 X152.047 Y105.494 E.00968
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X152.069 Y105.251 E.00881
; LINE_WIDTH: 0.422177
G1 F9492.255
G1 X152.091 Y105.007 E.00755
G1 X152.091 Y103.909 E.03393
G1 X150.993 Y103.909 E.03393
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X150.749 Y103.931 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.506 Y103.953 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X150.263 Y103.975 E.00968
G1 X150.487 Y104.043 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.712 Y104.112 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X150.937 Y104.18 E.00728
G1 X151.463 Y104.538 E.01971
G1 X151.82 Y105.063 E.01971
; LINE_WIDTH: 0.441829
G1 F9024.63
G1 X151.882 Y105.269 E.00698
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X151.945 Y105.474 E.00775
; LINE_WIDTH: 0.529182
G1 F7403.421
G1 X152.008 Y105.68 E.00851
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.551217
G1 F7082.478
M204 S6000
G1 X152.014 Y122.51 E.6947
M204 S10000
G1 X151.745 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y104.277 E.00227
G1 X151.732 Y104.309 E.00183
M204 S10000
G1 X152.468 Y104.277 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y103.532 E.02289
G1 X131.532 Y103.532 E.64326
G1 X131.532 Y124.468 E.64326
G1 X152.468 Y124.468 E.64326
G1 X152.468 Y104.337 E.61853
M204 S10000
G1 X152.845 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y103.155 E.03448
G1 X131.155 Y103.155 E.66644
G1 X131.155 Y124.845 E.66644
G1 X152.845 Y124.845 E.66644
G1 X152.845 Y104.337 E.63012
M204 S10000
G1 X153.222 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y102.778 E.04606
G1 X130.778 Y102.778 E.68961
G1 X130.778 Y125.222 E.68961
G1 X153.222 Y125.222 E.68961
G1 X153.222 Y104.337 E.6417
M204 S10000
G1 X153.599 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y102.401 E.05765
G1 X130.401 Y102.401 E.71278
G1 X130.401 Y125.599 E.71278
G1 X153.599 Y125.599 E.71278
G1 X153.599 Y104.337 E.65329
; OBJECT_ID: 66
; WIPE_START
G1 X153.599 Y106.337 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X152.402 Y113.875 Z.8 F42000
G1 X149.21 Y133.991 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
M73 P27 R22
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
M73 P28 R22
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z.8 F42000
G1 X153.991 Y153.991 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.847 Y148.919 Z.8 F42000
G1 X133.476 Y132.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X133.787 Y132 E.01417
G1 X150.153 Y132 E.74463
M204 S10000
G1 X132.333 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X132 Y133.787 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X132.058 Y133.619 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X132.115 Y133.45 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X132.173 Y133.282 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X132.23 Y133.113 E.00551
G1 X132.587 Y132.587 E.01968
G1 X133.113 Y132.23 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X133.186 Y132.187 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.259 Y132.143 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.331 Y132.1 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.404 Y132.057 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X133.476 Y132.014 E.00389
G1 X133.39 Y131.993 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.304 Y131.972 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.219 Y131.951 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.133 Y131.93 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X133.047 Y131.909 E.00272
G1 X131.909 Y131.909 E.03502
G1 X131.909 Y133.047 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X131.93 Y133.217 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X131.951 Y133.387 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X131.972 Y133.558 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X131.993 Y133.728 E.00748
M204 S10000
G1 X133.599 Y150.213 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.599 Y133.787 E.50469
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.622 Y150.268 E.00259
M204 S10000
G1 X133.222 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.222 Y133.787 E.50469
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.227 Y150.272 E.00117
M204 S10000
G1 X132.845 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.845 Y133.787 E.50469
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.857 Y150.271 E.0099
M204 S10000
G1 X132.468 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.468 Y133.787 E.50469
G1 X132.576 Y133.263 E.01645
G1 X132.854 Y132.854 E.0152
G1 X133.263 Y132.576 E.0152
G3 X133.787 Y132.468 I.524 J1.211 E.01656
G1 X150.213 Y132.468 E.50469
G1 X150.737 Y132.576 E.01645
G1 X151.146 Y132.854 E.0152
G1 X151.424 Y133.263 E.0152
G1 X151.532 Y133.787 E.01645
G1 X151.532 Y150.213 E.50469
G3 X151.424 Y150.737 I-1.32 J0 E.01656
G1 X151.146 Y151.146 E.0152
G1 X150.737 Y151.424 E.0152
G3 X150.213 Y151.532 I-.524 J-1.211 E.01656
G1 X133.787 Y151.532 E.50469
G1 X133.263 Y151.424 E.01645
G1 X132.854 Y151.146 E.0152
G1 X132.576 Y150.737 E.0152
G3 X132.473 Y150.272 I1.069 J-.482 E.01472
M204 S10000
G1 X132.014 Y150.524 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X132 Y150.213 E.01417
G1 X132 Y133.847 E.74463
M204 S10000
G1 X132.333 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X133.787 Y152 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X133.619 Y151.942 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.45 Y151.885 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.282 Y151.827 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X133.113 Y151.77 E.00551
G1 X132.587 Y151.413 E.01968
G1 X132.23 Y150.887 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X132.187 Y150.814 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X132.143 Y150.741 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X132.1 Y150.669 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X132.057 Y150.596 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X132.014 Y150.524 E.00389
G1 X131.993 Y150.61 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X131.972 Y150.695 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X131.951 Y150.781 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X131.93 Y150.867 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X131.909 Y150.953 E.00272
G1 X131.909 Y152.091 E.03502
G1 X133.047 Y152.091 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X133.217 Y152.07 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.387 Y152.049 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.558 Y152.028 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X133.728 Y152.007 E.00748
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X150.213 Y152 E.01417
G1 X133.847 Y152 E.74463
M204 S10000
G1 X151.719 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X151.986 Y150.524 F42000
; LINE_WIDTH: 0.607289
G1 F6378.806
M204 S6000
G1 X151.872 Y150.702 E.00973
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X151.757 Y150.879 E.00901
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X151.642 Y151.057 E.00829
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X151.527 Y151.235 E.00758
; LINE_WIDTH: 0.425186
G1 F9417.527
G1 X151.413 Y151.413 E.00659
G1 X150.887 Y151.77 E.01981
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X150.814 Y151.813 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.741 Y151.857 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.669 Y151.9 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.596 Y151.943 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X150.524 Y151.986 E.00389
G1 X150.61 Y152.007 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.695 Y152.028 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.781 Y152.049 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.867 Y152.07 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X150.953 Y152.091 E.00272
G1 X152.091 Y152.091 E.03502
G1 X152.091 Y150.953 E.03502
; LINE_WIDTH: 0.440801
G1 F9047.931
G1 X152.073 Y150.879 E.00247
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X152.055 Y150.805 E.00273
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X152.037 Y150.73 E.00299
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X152.019 Y150.656 E.00325
; LINE_WIDTH: 0.607289
G1 F6378.806
G1 X152.001 Y150.582 E.00351
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.578392
G1 F6723.05
M204 S6000
G1 X152.023 Y133.602 E.00814
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X152.045 Y133.417 E.00745
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X152.068 Y133.232 E.00676
; LINE_WIDTH: 0.421705
G1 F9504.091
G1 X152.091 Y133.047 E.00576
G1 X152.091 Y131.909 E.03511
G1 X150.953 Y131.909 E.03511
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X150.768 Y131.932 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.583 Y131.955 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.398 Y131.977 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X150.213 Y132 E.00814
G1 X150.381 Y132.058 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.55 Y132.115 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.718 Y132.173 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X150.887 Y132.23 E.00551
G1 X151.413 Y132.587 E.01968
G1 X151.77 Y133.113 E.01968
; LINE_WIDTH: 0.442619
G1 F9006.783
G1 X151.823 Y133.268 E.00531
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X151.875 Y133.422 E.00591
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X151.928 Y133.576 E.00651
; LINE_WIDTH: 0.578392
G1 F6723.05
G1 X151.981 Y133.731 E.00711
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.601224
G1 F6448.099
M204 S6000
G1 X151.989 Y150.464 E.7587
M204 S10000
G1 X151.719 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X152.468 Y132.307 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y131.532 E.02379
G1 X131.532 Y131.532 E.64326
G1 X131.532 Y152.468 E.64326
G1 X152.468 Y152.468 E.64326
G1 X152.468 Y132.367 E.61763
M204 S10000
G1 X152.845 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y131.155 E.03538
G1 X131.155 Y131.155 E.66644
G1 X131.155 Y152.845 E.66644
G1 X152.845 Y152.845 E.66644
G1 X152.845 Y132.367 E.62922
M204 S10000
G1 X153.222 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y130.778 E.04696
G1 X130.778 Y130.778 E.68961
G1 X130.778 Y153.222 E.68961
G1 X153.222 Y153.222 E.68961
G1 X153.222 Y132.367 E.6408
M204 S10000
G1 X153.599 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y130.401 E.05855
G1 X130.401 Y130.401 E.71278
G1 X130.401 Y153.599 E.71278
G1 X153.599 Y153.599 E.71278
G1 X153.599 Y132.367 E.65239
; OBJECT_ID: 88
; WIPE_START
G1 X153.599 Y134.367 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.634 Y131.244 Z.8 F42000
G1 X121.31 Y119.891 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z.8 F42000
G1 X125.991 Y139.991 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y133.107 Z.8 F42000
G1 X125.599 Y118.248 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X125.599 Y116.401 E.05675
G1 X102.401 Y116.401 E.71278
G1 X102.401 Y139.599 E.71278
G1 X125.599 Y139.599 E.71278
G1 X125.599 Y118.308 E.65419
M204 S10000
G1 X125.222 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X125.222 Y116.778 E.04516
G1 X102.778 Y116.778 E.68961
G1 X102.778 Y139.222 E.68961
G1 X125.222 Y139.222 E.68961
G1 X125.222 Y118.308 E.6426
M204 S10000
M73 P29 R22
G1 X124.845 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.845 Y117.155 E.03358
G1 X103.155 Y117.155 E.66644
G1 X103.155 Y138.845 E.66644
G1 X124.845 Y138.845 E.66644
G1 X124.845 Y118.308 E.63102
M204 S10000
G1 X124.468 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.468 Y117.532 E.02199
G1 X103.532 Y117.532 E.64326
G1 X103.532 Y138.468 E.64326
G1 X124.468 Y138.468 E.64326
G1 X124.468 Y118.308 E.61943
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.518278
G1 F7573.247
M204 S6000
G1 X124.033 Y119.328 E.01395
; LINE_WIDTH: 0.567378
G1 F6864.229
G3 X124.016 Y117.985 I28.005 J-1.031 E.05741
G1 X123.032 Y117.985 E.04202
; LINE_WIDTH: 0.552798
G1 F7060.519
G1 X122.672 Y117.967 E.01497
; LINE_WIDTH: 0.529752
G1 F7394.757
G1 X122.313 Y117.95 E.01429
G1 X123.016 Y118.061 E.02826
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X123.566 Y118.434 E.02852
G1 X123.939 Y118.984 E.02852
; LINE_WIDTH: 0.552793
G1 F7060.589
G1 X123.99 Y119.306 E.01355
; LINE_WIDTH: 0.518278
G1 F7573.247
G1 X124.041 Y119.628 E.01264
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.50121
G1 F7855.299
M204 S6000
G1 X124.039 Y136.555 E.62993
M204 S10000
G1 X124.037 Y136.615 F42000
; LINE_WIDTH: 0.559929
G1 F6963.127
M204 S6000
G1 X123.939 Y137.016 E.0174
G1 X123.566 Y137.566 E.02797
G1 X123.016 Y137.939 E.02797
G1 X122.615 Y138.037 E.0174
G3 X124.016 Y138.016 I1.269 J37.272 E.05901
G3 X124.034 Y136.675 I13.108 J-.492 E.0565
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X122.313 Y138.05 E.01131
G1 X105.747 Y138.05 E.61872
M204 S10000
G1 X105.687 Y138.05 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X105.335 Y137.994 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.984 Y137.939 E.01505
G1 X104.434 Y137.566 E.02805
G1 X104.061 Y137.016 E.02805
G1 X103.963 Y136.615 E.01745
G3 X103.985 Y138.016 I-37.272 J1.269 E.05916
G1 X104.968 Y138.016 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X105.298 Y138.031 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X105.627 Y138.047 E.01279
M204 S10000
G1 X105.499 Y136.313 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X105.499 Y119.687 E.51084
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.522 Y136.368 E.00259
M204 S10000
G1 X105.122 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.122 Y119.687 E.51084
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.127 Y136.372 E.00117
M204 S10000
G1 X104.745 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.745 Y119.687 E.51084
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.757 Y136.371 E.0099
M204 S10000
G1 X104.368 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.368 Y119.687 E.51084
G1 X104.476 Y119.163 E.01645
G1 X104.754 Y118.754 E.0152
G1 X105.163 Y118.476 E.0152
G3 X105.687 Y118.368 I.524 J1.211 E.01656
G1 X122.313 Y118.368 E.51084
G1 X122.837 Y118.476 E.01645
G1 X123.246 Y118.754 E.0152
G1 X123.524 Y119.163 E.0152
G1 X123.632 Y119.687 E.01645
G1 X123.632 Y136.313 E.51084
G3 X123.524 Y136.837 I-1.319 J0 E.01656
G1 X123.246 Y137.246 E.0152
G1 X122.837 Y137.524 E.0152
G3 X122.313 Y137.632 I-.524 J-1.211 E.01656
G1 X105.687 Y137.632 E.51084
G1 X105.163 Y137.524 E.01645
G1 X104.754 Y137.246 E.0152
G1 X104.476 Y136.837 E.0152
G3 X104.373 Y136.372 I1.069 J-.482 E.01472
M204 S10000
G1 X103.963 Y136.615 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X103.95 Y136.313 E.01131
G1 X103.95 Y119.747 E.61872
M204 S10000
G1 X103.95 Y119.687 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X104.006 Y119.335 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.061 Y118.984 E.01505
G1 X104.434 Y118.434 E.02805
G1 X104.984 Y118.061 E.02805
G1 X105.385 Y117.963 E.01745
G3 X103.985 Y117.985 I-1.269 J-37.272 E.05916
G1 X103.985 Y118.968 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X103.969 Y119.298 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X103.953 Y119.627 E.01279
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X105.687 Y117.95 E.01131
G1 X122.253 Y117.95 E.61872
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7854.154
G1 X120.253 Y117.95 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 3/53
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.466 J1.124 P1  F42000
G1 X149.26 Y105.941 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z1 F42000
G1 X153.991 Y125.991 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 3 start: 66,77,88
M624 BwAAAAAAAAA=
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
; object ids of this layer3 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.431 Y103.988 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X133.737 Y103.975 E.01272
G1 X150.203 Y103.975 E.68208
M204 S10000
G1 X132.3 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y104.277 E.00227
G1 X132.287 Y104.309 E.00183
M204 S10000
G1 X131.975 Y105.737 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X132.043 Y105.513 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X132.112 Y105.288 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X132.18 Y105.063 E.00728
G1 X132.537 Y104.538 E.01971
G1 X133.063 Y104.18 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X133.155 Y104.132 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.247 Y104.084 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.339 Y104.036 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X133.431 Y103.988 E.00435
G1 X133.325 Y103.969 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.219 Y103.949 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.113 Y103.929 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X133.007 Y103.909 E.00331
G1 X131.909 Y103.909 E.03382
M73 P30 R22
G1 X131.909 Y105.007 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X131.93 Y105.231 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X131.95 Y105.454 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X131.97 Y105.678 E.00889
M204 S10000
G1 X133.549 Y122.263 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.549 Y105.737 E.50776
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.572 Y122.318 E.00259
M204 S10000
G1 X133.172 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.172 Y105.737 E.50776
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.177 Y122.322 E.00117
M204 S10000
G1 X132.795 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.795 Y105.737 E.50776
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.807 Y122.321 E.0099
M204 S10000
G1 X132.418 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.418 Y105.737 E.50776
G1 X132.526 Y105.213 E.01645
G1 X132.804 Y104.804 E.0152
G1 X133.213 Y104.526 E.0152
G3 X133.737 Y104.418 I.524 J1.211 E.01656
G1 X150.263 Y104.418 E.50776
G1 X150.787 Y104.526 E.01645
G1 X151.196 Y104.804 E.0152
G1 X151.474 Y105.213 E.0152
G1 X151.582 Y105.737 E.01645
G1 X151.582 Y122.263 E.50776
G3 X151.474 Y122.787 I-1.32 J0 E.01656
G1 X151.196 Y123.196 E.0152
G1 X150.787 Y123.474 E.0152
G3 X150.263 Y123.582 I-.524 J-1.211 E.01656
G1 X133.737 Y123.582 E.50776
G1 X133.213 Y123.474 E.01645
G1 X132.804 Y123.196 E.0152
G1 X132.526 Y122.787 E.0152
G3 X132.423 Y122.322 I1.069 J-.482 E.01472
M204 S10000
G1 X131.988 Y122.569 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X131.975 Y122.263 E.01272
G1 X131.975 Y105.797 E.68208
M204 S10000
G1 X132.3 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y123.723 E.00227
G1 X132.287 Y123.754 E.00183
M204 S10000
G1 X133.737 Y124.025 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X133.513 Y123.957 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.288 Y123.888 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X133.063 Y123.82 E.00728
G1 X132.537 Y123.463 E.01971
G1 X132.18 Y122.937 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X132.132 Y122.845 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X132.084 Y122.753 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X132.036 Y122.661 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X131.988 Y122.569 E.00435
G1 X131.969 Y122.675 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X131.949 Y122.781 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X131.929 Y122.887 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X131.909 Y122.993 E.00331
G1 X131.909 Y124.091 E.03382
G1 X133.007 Y124.091 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X133.231 Y124.07 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.454 Y124.05 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X133.678 Y124.03 E.00889
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X150.263 Y124.025 E.01272
G1 X133.797 Y124.025 E.68208
M204 S10000
G1 X151.745 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y123.723 E.00227
G1 X151.732 Y123.754 E.00183
M204 S10000
G1 X152.012 Y122.569 F42000
; LINE_WIDTH: 0.558004
G1 F6989.155
M204 S6000
G1 X151.964 Y122.661 E.00435
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X151.916 Y122.753 E.00401
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X151.868 Y122.845 E.00368
; LINE_WIDTH: 0.421475
G1 F9509.858
G1 X151.463 Y123.463 E.02279
G1 X150.937 Y123.82 E.01961
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X150.845 Y123.868 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.753 Y123.916 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.661 Y123.964 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X150.569 Y124.012 E.00435
G1 X150.675 Y124.031 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.781 Y124.051 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.887 Y124.071 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X150.993 Y124.091 E.00331
G1 X152.091 Y124.091 E.03382
G1 X152.091 Y122.993 E.03382
; LINE_WIDTH: 0.439707
G1 F9072.895
G1 X152.074 Y122.902 E.00299
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X152.057 Y122.811 E.00329
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X152.04 Y122.72 E.00359
; LINE_WIDTH: 0.558004
G1 F6989.155
G1 X152.023 Y122.628 E.00389
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.529182
G1 F7403.421
M204 S6000
G1 X152.047 Y105.494 E.00968
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X152.069 Y105.251 E.00881
; LINE_WIDTH: 0.422177
G1 F9492.255
G1 X152.091 Y105.007 E.00755
G1 X152.091 Y103.909 E.03393
G1 X150.993 Y103.909 E.03393
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X150.749 Y103.931 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.506 Y103.953 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X150.263 Y103.975 E.00968
G1 X150.487 Y104.043 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.712 Y104.112 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X150.937 Y104.18 E.00728
G1 X151.463 Y104.538 E.01971
G1 X151.82 Y105.063 E.01971
; LINE_WIDTH: 0.441829
G1 F9024.63
G1 X151.882 Y105.269 E.00698
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X151.945 Y105.474 E.00775
; LINE_WIDTH: 0.529182
G1 F7403.421
G1 X152.008 Y105.68 E.00851
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.551217
G1 F7082.478
M204 S6000
G1 X152.014 Y122.51 E.6947
M204 S10000
G1 X151.745 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y104.277 E.00227
G1 X151.732 Y104.309 E.00183
M204 S10000
G1 X152.468 Y104.277 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y103.532 E.02289
G1 X131.532 Y103.532 E.64326
G1 X131.532 Y124.468 E.64326
G1 X152.468 Y124.468 E.64326
G1 X152.468 Y104.337 E.61853
M204 S10000
G1 X152.845 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y103.155 E.03448
G1 X131.155 Y103.155 E.66644
G1 X131.155 Y124.845 E.66644
G1 X152.845 Y124.845 E.66644
G1 X152.845 Y104.337 E.63012
M204 S10000
G1 X153.222 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y102.778 E.04606
G1 X130.778 Y102.778 E.68961
G1 X130.778 Y125.222 E.68961
G1 X153.222 Y125.222 E.68961
G1 X153.222 Y104.337 E.6417
M204 S10000
G1 X153.599 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y102.401 E.05765
G1 X130.401 Y102.401 E.71278
G1 X130.401 Y125.599 E.71278
G1 X153.599 Y125.599 E.71278
G1 X153.599 Y104.337 E.65329
; OBJECT_ID: 66
; WIPE_START
G1 X153.599 Y106.337 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X152.402 Y113.875 Z1 F42000
G1 X149.21 Y133.991 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z1 F42000
G1 X153.991 Y153.991 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.847 Y148.919 Z1 F42000
G1 X133.476 Y132.014 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X133.787 Y132 E.01417
G1 X150.153 Y132 E.74463
M204 S10000
G1 X132.333 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X132 Y133.787 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X132.058 Y133.619 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X132.115 Y133.45 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X132.173 Y133.282 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X132.23 Y133.113 E.00551
G1 X132.587 Y132.587 E.01968
G1 X133.113 Y132.23 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X133.186 Y132.187 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.259 Y132.143 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.331 Y132.1 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.404 Y132.057 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X133.476 Y132.014 E.00389
G1 X133.39 Y131.993 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.304 Y131.972 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.219 Y131.951 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.133 Y131.93 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X133.047 Y131.909 E.00272
G1 X131.909 Y131.909 E.03502
G1 X131.909 Y133.047 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X131.93 Y133.217 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X131.951 Y133.387 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X131.972 Y133.558 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X131.993 Y133.728 E.00748
M204 S10000
G1 X133.599 Y150.213 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.599 Y133.787 E.50469
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.622 Y150.268 E.00259
M204 S10000
G1 X133.222 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.222 Y133.787 E.50469
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.227 Y150.272 E.00117
M204 S10000
G1 X132.845 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.845 Y133.787 E.50469
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.857 Y150.271 E.0099
M204 S10000
G1 X132.468 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.468 Y133.787 E.50469
G1 X132.576 Y133.263 E.01645
G1 X132.854 Y132.854 E.0152
G1 X133.263 Y132.576 E.0152
G3 X133.787 Y132.468 I.524 J1.211 E.01656
G1 X150.213 Y132.468 E.50469
G1 X150.737 Y132.576 E.01645
G1 X151.146 Y132.854 E.0152
G1 X151.424 Y133.263 E.0152
G1 X151.532 Y133.787 E.01645
G1 X151.532 Y150.213 E.50469
G3 X151.424 Y150.737 I-1.32 J0 E.01656
G1 X151.146 Y151.146 E.0152
G1 X150.737 Y151.424 E.0152
G3 X150.213 Y151.532 I-.524 J-1.211 E.01656
G1 X133.787 Y151.532 E.50469
G1 X133.263 Y151.424 E.01645
G1 X132.854 Y151.146 E.0152
G1 X132.576 Y150.737 E.0152
G3 X132.473 Y150.272 I1.069 J-.482 E.01472
M204 S10000
G1 X132.014 Y150.524 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X132 Y150.213 E.01417
G1 X132 Y133.847 E.74463
M204 S10000
G1 X132.333 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X133.787 Y152 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X133.619 Y151.942 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.45 Y151.885 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.282 Y151.827 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X133.113 Y151.77 E.00551
G1 X132.587 Y151.413 E.01968
G1 X132.23 Y150.887 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X132.187 Y150.814 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X132.143 Y150.741 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X132.1 Y150.669 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X132.057 Y150.596 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X132.014 Y150.524 E.00389
G1 X131.993 Y150.61 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X131.972 Y150.695 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X131.951 Y150.781 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X131.93 Y150.867 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X131.909 Y150.953 E.00272
G1 X131.909 Y152.091 E.03502
G1 X133.047 Y152.091 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X133.217 Y152.07 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.387 Y152.049 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.558 Y152.028 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X133.728 Y152.007 E.00748
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X150.213 Y152 E.01417
G1 X133.847 Y152 E.74463
M204 S10000
G1 X151.719 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X151.986 Y150.524 F42000
; LINE_WIDTH: 0.607289
G1 F6378.806
M204 S6000
G1 X151.872 Y150.702 E.00973
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X151.757 Y150.879 E.00901
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X151.642 Y151.057 E.00829
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X151.527 Y151.235 E.00758
; LINE_WIDTH: 0.425186
G1 F9417.527
G1 X151.413 Y151.413 E.00659
G1 X150.887 Y151.77 E.01981
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X150.814 Y151.813 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.741 Y151.857 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.669 Y151.9 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.596 Y151.943 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X150.524 Y151.986 E.00389
G1 X150.61 Y152.007 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.695 Y152.028 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.781 Y152.049 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.867 Y152.07 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X150.953 Y152.091 E.00272
G1 X152.091 Y152.091 E.03502
G1 X152.091 Y150.953 E.03502
; LINE_WIDTH: 0.440801
G1 F9047.931
G1 X152.073 Y150.879 E.00247
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X152.055 Y150.805 E.00273
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X152.037 Y150.73 E.00299
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X152.019 Y150.656 E.00325
; LINE_WIDTH: 0.607289
G1 F6378.806
G1 X152.001 Y150.582 E.00351
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.578392
G1 F6723.05
M204 S6000
G1 X152.023 Y133.602 E.00814
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X152.045 Y133.417 E.00745
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X152.068 Y133.232 E.00676
; LINE_WIDTH: 0.421705
G1 F9504.091
G1 X152.091 Y133.047 E.00576
G1 X152.091 Y131.909 E.03511
G1 X150.953 Y131.909 E.03511
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X150.768 Y131.932 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.583 Y131.955 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.398 Y131.977 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X150.213 Y132 E.00814
G1 X150.381 Y132.058 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.55 Y132.115 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.718 Y132.173 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X150.887 Y132.23 E.00551
G1 X151.413 Y132.587 E.01968
G1 X151.77 Y133.113 E.01968
; LINE_WIDTH: 0.442619
G1 F9006.783
G1 X151.823 Y133.268 E.00531
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X151.875 Y133.422 E.00591
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X151.928 Y133.576 E.00651
; LINE_WIDTH: 0.578392
G1 F6723.05
G1 X151.981 Y133.731 E.00711
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.601224
G1 F6448.099
M204 S6000
G1 X151.989 Y150.464 E.7587
M204 S10000
G1 X151.719 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X152.468 Y132.307 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y131.532 E.02379
G1 X131.532 Y131.532 E.64326
G1 X131.532 Y152.468 E.64326
G1 X152.468 Y152.468 E.64326
G1 X152.468 Y132.367 E.61763
M204 S10000
G1 X152.845 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y131.155 E.03538
G1 X131.155 Y131.155 E.66644
G1 X131.155 Y152.845 E.66644
G1 X152.845 Y152.845 E.66644
G1 X152.845 Y132.367 E.62922
M204 S10000
G1 X153.222 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y130.778 E.04696
G1 X130.778 Y130.778 E.68961
G1 X130.778 Y153.222 E.68961
G1 X153.222 Y153.222 E.68961
G1 X153.222 Y132.367 E.6408
M204 S10000
G1 X153.599 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y130.401 E.05855
G1 X130.401 Y130.401 E.71278
G1 X130.401 Y153.599 E.71278
G1 X153.599 Y153.599 E.71278
G1 X153.599 Y132.367 E.65239
; OBJECT_ID: 88
; WIPE_START
G1 X153.599 Y134.367 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.634 Y131.244 Z1 F42000
G1 X121.31 Y119.891 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
M73 P31 R22
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
M73 P31 R21
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z1 F42000
G1 X125.991 Y139.991 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y133.107 Z1 F42000
G1 X125.599 Y118.248 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X125.599 Y116.401 E.05675
G1 X102.401 Y116.401 E.71278
G1 X102.401 Y139.599 E.71278
G1 X125.599 Y139.599 E.71278
G1 X125.599 Y118.308 E.65419
M204 S10000
G1 X125.222 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X125.222 Y116.778 E.04516
G1 X102.778 Y116.778 E.68961
G1 X102.778 Y139.222 E.68961
G1 X125.222 Y139.222 E.68961
G1 X125.222 Y118.308 E.6426
M204 S10000
G1 X124.845 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.845 Y117.155 E.03358
G1 X103.155 Y117.155 E.66644
G1 X103.155 Y138.845 E.66644
G1 X124.845 Y138.845 E.66644
G1 X124.845 Y118.308 E.63102
M204 S10000
G1 X124.468 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.468 Y117.532 E.02199
G1 X103.532 Y117.532 E.64326
G1 X103.532 Y138.468 E.64326
G1 X124.468 Y138.468 E.64326
G1 X124.468 Y118.308 E.61943
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.518278
G1 F7573.247
M204 S6000
G1 X124.033 Y119.328 E.01395
; LINE_WIDTH: 0.567378
G1 F6864.229
G3 X124.016 Y117.985 I28.005 J-1.031 E.05741
G1 X123.032 Y117.985 E.04202
; LINE_WIDTH: 0.552798
G1 F7060.519
G1 X122.672 Y117.967 E.01497
; LINE_WIDTH: 0.529752
G1 F7394.757
G1 X122.313 Y117.95 E.01429
G1 X123.016 Y118.061 E.02826
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X123.566 Y118.434 E.02852
G1 X123.939 Y118.984 E.02852
; LINE_WIDTH: 0.552793
G1 F7060.589
G1 X123.99 Y119.306 E.01355
; LINE_WIDTH: 0.518278
G1 F7573.247
G1 X124.041 Y119.628 E.01264
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.50121
G1 F7855.299
M204 S6000
G1 X124.039 Y136.555 E.62993
M204 S10000
G1 X124.037 Y136.615 F42000
; LINE_WIDTH: 0.559929
G1 F6963.127
M204 S6000
G1 X123.939 Y137.016 E.0174
G1 X123.566 Y137.566 E.02797
G1 X123.016 Y137.939 E.02797
G1 X122.615 Y138.037 E.0174
G3 X124.016 Y138.016 I1.269 J37.272 E.05901
G3 X124.034 Y136.675 I13.108 J-.492 E.0565
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X122.313 Y138.05 E.01131
G1 X105.747 Y138.05 E.61872
M204 S10000
G1 X105.687 Y138.05 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X105.335 Y137.994 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.984 Y137.939 E.01505
G1 X104.434 Y137.566 E.02805
G1 X104.061 Y137.016 E.02805
G1 X103.963 Y136.615 E.01745
G3 X103.985 Y138.016 I-37.272 J1.269 E.05916
G1 X104.968 Y138.016 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X105.298 Y138.031 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X105.627 Y138.047 E.01279
M204 S10000
G1 X105.499 Y136.313 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X105.499 Y119.687 E.51084
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.522 Y136.368 E.00259
M204 S10000
G1 X105.122 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.122 Y119.687 E.51084
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.127 Y136.372 E.00117
M204 S10000
G1 X104.745 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.745 Y119.687 E.51084
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.757 Y136.371 E.0099
M204 S10000
G1 X104.368 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.368 Y119.687 E.51084
G1 X104.476 Y119.163 E.01645
G1 X104.754 Y118.754 E.0152
G1 X105.163 Y118.476 E.0152
G3 X105.687 Y118.368 I.524 J1.211 E.01656
G1 X122.313 Y118.368 E.51084
G1 X122.837 Y118.476 E.01645
G1 X123.246 Y118.754 E.0152
G1 X123.524 Y119.163 E.0152
G1 X123.632 Y119.687 E.01645
G1 X123.632 Y136.313 E.51084
G3 X123.524 Y136.837 I-1.319 J0 E.01656
G1 X123.246 Y137.246 E.0152
G1 X122.837 Y137.524 E.0152
G3 X122.313 Y137.632 I-.524 J-1.211 E.01656
G1 X105.687 Y137.632 E.51084
G1 X105.163 Y137.524 E.01645
G1 X104.754 Y137.246 E.0152
G1 X104.476 Y136.837 E.0152
G3 X104.373 Y136.372 I1.069 J-.482 E.01472
M204 S10000
G1 X103.963 Y136.615 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X103.95 Y136.313 E.01131
G1 X103.95 Y119.747 E.61872
M204 S10000
G1 X103.95 Y119.687 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X104.006 Y119.335 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.061 Y118.984 E.01505
G1 X104.434 Y118.434 E.02805
G1 X104.984 Y118.061 E.02805
G1 X105.385 Y117.963 E.01745
G3 X103.985 Y117.985 I-1.269 J-37.272 E.05916
G1 X103.985 Y118.968 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X103.969 Y119.298 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X103.953 Y119.627 E.01279
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X105.687 Y117.95 E.01131
G1 X122.253 Y117.95 E.61872
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7854.154
G1 X120.253 Y117.95 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 4/53
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S186.15
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.466 J1.124 P1  F42000
G1 X149.26 Y105.941 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z1.2 F42000
G1 X153.991 Y125.991 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 4 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer4 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X132.33 Y125.643 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X130.702 Y125.643 E.05401
G1 X130.357 Y125.296 E.01622
G1 X130.357 Y123.667 E.05401
M204 S10000
G1 X132.497 Y123.476 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64108
G1 F6018.457
M204 S6000
G2 X132.504 Y123.593 I-.034 J.061 E.01456
M204 S10000
G1 X132.4 Y122.263 F42000
; LINE_WIDTH: 0.452001
G1 F8800.216
M204 S6000
M73 P32 R21
G1 X132.4 Y105.737 E.55087
G1 X132.526 Y105.213 E.01797
G1 X132.804 Y104.804 E.01649
G1 X133.213 Y104.525 E.0165
G1 X133.505 Y104.415 E.01043
G1 X133.737 Y104.4 E.00775
G1 X150.263 Y104.4 E.55087
G1 X150.787 Y104.526 E.01797
G1 X151.196 Y104.804 E.01649
G1 X151.474 Y105.213 E.01649
G1 X151.6 Y105.737 E.01797
G1 X151.6 Y122.263 E.55087
G1 X151.585 Y122.495 E.00775
G1 X151.475 Y122.787 E.01043
G1 X151.196 Y123.196 E.0165
G1 X150.787 Y123.475 E.0165
G1 X150.495 Y123.585 E.01043
G1 X150.263 Y123.6 E.00775
G1 X133.737 Y123.6 E.55087
G1 X133.213 Y123.474 E.01797
G1 X132.804 Y123.196 E.01649
G1 X132.525 Y122.787 E.0165
G1 X132.415 Y122.495 E.01043
G1 X132.404 Y122.323 E.00575
M204 S10000
G1 X132.795 Y122.263 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.795 Y105.737 E.50776
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.807 Y122.321 E.0099
M204 S10000
G1 X133.172 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.172 Y105.737 E.50776
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.177 Y122.322 E.00117
M204 S10000
G1 X133.549 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.549 Y105.737 E.50776
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.572 Y122.318 E.00259
M204 S10000
G1 X132.497 Y104.395 F42000
; LINE_WIDTH: 0.64108
G1 F6018.457
M204 S6000
G2 X132.504 Y104.511 I-.034 J.061 E.01457
M204 S10000
G1 X151.578 Y104.395 F42000
G1 F6018.457
M204 S6000
G2 X151.585 Y104.511 I-.034 J.061 E.01456
M204 S10000
G1 X152.011 Y105.737 F42000
; LINE_WIDTH: 0.449528
G1 F8853.734
M204 S6000
G2 X152.028 Y103.972 I-32.789 J-1.202 E.05851
G2 X150.263 Y103.989 I-.563 J32.806 E.05851
G1 X133.737 Y103.989 E.54754
G2 X131.972 Y103.972 I-1.412 J54.3 E.05851
G2 X131.989 Y105.737 I32.806 J.563 E.05851
G1 X131.989 Y122.263 E.54754
G2 X131.972 Y124.028 I54.3 J1.412 E.05851
G2 X133.737 Y124.011 I.563 J-32.806 E.05851
G1 X150.263 Y124.011 E.54754
G2 X152.028 Y124.028 I1.412 J-54.3 E.05851
G2 X152.011 Y122.263 I-37.879 J-.514 E.05851
G1 X152.011 Y105.797 E.54555
M204 S10000
G1 X151.578 Y123.476 F42000
; LINE_WIDTH: 0.64108
G1 F6018.457
M204 S6000
G2 X151.585 Y123.593 I-.034 J.061 E.01456
M204 S10000
G1 X152.405 Y124.405 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.405 Y103.595 E.63944
G1 X131.595 Y103.595 E.63944
G1 X131.595 Y124.405 E.63944
G1 X152.345 Y124.405 E.6376
M204 S10000
G1 X152.782 Y124.782 F42000
G1 F9547.299
M204 S6000
G1 X152.782 Y103.218 E.66261
G1 X131.218 Y103.218 E.66261
G1 X131.218 Y124.782 E.66261
G1 X152.722 Y124.782 E.66077
M204 S10000
G1 X153.159 Y125.14 F42000
G1 F9547.299
M204 S6000
G1 X153.159 Y102.86 E.68459
G1 X153.14 Y102.841 E.00084
G1 X130.852 Y102.841 E.68484
G1 X130.84 Y125.148 E.68543
G1 X153.111 Y125.16 E.68428
; OBJECT_ID: 66
; WIPE_START
G1 X151.111 Y125.158 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X149.505 Y132.62 Z1.2 F42000
G1 X149.21 Y133.991 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z1.2 F42000
G1 X153.991 Y153.991 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.168 Y154.328 Z1.2 F42000
G1 X132.33 Y153.643 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X130.702 Y153.643 E.05401
G1 X130.357 Y153.296 E.01622
G1 X130.357 Y151.667 E.05401
M204 S10000
G1 X132.324 Y150.983 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37129
G1 F10963.242
M204 S6000
G1 X132.324 Y151.676 E.01854
G1 X133.017 Y151.676 E.01854
G1 X132.605 Y151.395 E.01334
G1 X132.358 Y151.032 E.01174
M204 S10000
G1 X132.438 Y150.213 F42000
; LINE_WIDTH: 0.47939
G1 F8247.989
M204 S6000
G1 X132.438 Y133.787 E.5842
; LINE_WIDTH: 0.46454
G1 F8538.494
G1 X132.507 Y133.525 E.00931
; LINE_WIDTH: 0.423865
G1 F9450.196
G1 X132.576 Y133.263 E.00841
G1 X132.854 Y132.854 E.01535
G1 X133.262 Y132.575 E.01536
; LINE_WIDTH: 0.440413
G1 F9056.774
G1 X133.408 Y132.513 E.00511
; LINE_WIDTH: 0.479426
G1 F8247.322
G3 X133.787 Y132.438 I.298 J.505 E.01403
G1 X150.213 Y132.438 E.58424
; LINE_WIDTH: 0.46454
G1 F8538.494
G1 X150.475 Y132.507 E.00931
; LINE_WIDTH: 0.423185
G1 F9467.102
G1 X150.737 Y132.576 E.0084
G1 X151.146 Y132.854 E.01532
G1 X151.424 Y133.263 E.01532
; LINE_WIDTH: 0.43484
G1 F9185.548
G1 X151.493 Y133.525 E.00866
; LINE_WIDTH: 0.479235
G1 F8250.929
G1 X151.562 Y133.787 E.00964
G1 X151.562 Y150.213 E.58399
G1 X151.548 Y150.447 E.00834
; LINE_WIDTH: 0.47431
G1 F8345.117
G1 X151.487 Y150.592 E.00554
; LINE_WIDTH: 0.424293
G1 F9439.591
G1 X151.425 Y150.738 E.0049
G1 X151.146 Y151.146 E.01538
G1 X150.738 Y151.425 E.01538
; LINE_WIDTH: 0.440413
G1 F9056.774
G1 X150.592 Y151.487 E.00511
; LINE_WIDTH: 0.479426
G1 F8247.322
G3 X150.213 Y151.562 I-.298 J-.505 E.01403
G1 X133.787 Y151.562 E.58424
; LINE_WIDTH: 0.46454
G1 F8538.494
G1 X133.525 Y151.493 E.00931
; LINE_WIDTH: 0.423865
G1 F9450.196
G1 X133.263 Y151.424 E.00841
G1 X132.854 Y151.146 E.01535
G1 X132.575 Y150.738 E.01536
; LINE_WIDTH: 0.440413
G1 F9056.774
G1 X132.513 Y150.592 E.00511
; LINE_WIDTH: 0.480105
G1 F8234.498
G3 X132.442 Y150.273 I.421 J-.262 E.01189
M204 S10000
G1 X132.845 Y150.213 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.845 Y133.787 E.50469
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.857 Y150.271 E.0099
M204 S10000
G1 X133.222 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.222 Y133.787 E.50469
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.227 Y150.272 E.00117
M204 S10000
G1 X133.599 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.599 Y133.787 E.50469
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.622 Y150.268 E.00259
M204 S10000
G1 X133.017 Y132.324 F42000
; LINE_WIDTH: 0.37129
G1 F10963.242
M204 S6000
G1 X132.324 Y132.324 E.01854
G1 X132.324 Y133.017 E.01854
G1 X132.605 Y132.605 E.01334
G1 X132.968 Y132.358 E.01174
M204 S10000
G1 X151.676 Y133.017 F42000
M73 P33 R21
G1 F10963.242
M204 S6000
G1 X151.676 Y132.324 E.01854
G1 X150.983 Y132.324 E.01854
G1 X151.395 Y132.605 E.01334
G1 X151.642 Y132.968 E.01174
M204 S10000
G1 X151.999 Y133.787 F42000
; LINE_WIDTH: 0.46454
G1 F8538.494
M204 S6000
G1 X152.013 Y133.463 E.01117
; LINE_WIDTH: 0.421807
G1 F9501.535
G2 X152.028 Y131.972 I-16.292 J-.908 E.04605
G1 X150.862 Y131.972 E.03601
; LINE_WIDTH: 0.43484
G1 F9185.548
G1 X150.537 Y131.987 E.01038
; LINE_WIDTH: 0.479102
G1 F8253.439
G1 X150.213 Y132.001 E.01155
G1 X133.787 Y132.001 E.58381
; LINE_WIDTH: 0.465408
G1 F8520.962
G1 X133.463 Y131.987 E.01119
; LINE_WIDTH: 0.422549
G1 F9482.963
G2 X131.972 Y131.972 I-1.105 J34.134 E.04613
G1 X131.972 Y133.138 E.03608
; LINE_WIDTH: 0.43484
G1 F9185.548
G1 X131.987 Y133.463 E.01038
; LINE_WIDTH: 0.479102
G1 F8253.439
G1 X132.001 Y133.787 E.01155
G1 X132.001 Y150.213 E.58381
; LINE_WIDTH: 0.465408
G1 F8520.962
G1 X131.987 Y150.537 E.01119
; LINE_WIDTH: 0.422549
G1 F9482.963
G2 X131.972 Y152.028 I34.134 J1.105 E.04613
G1 X133.138 Y152.028 E.03608
; LINE_WIDTH: 0.43484
G1 F9185.548
G1 X133.463 Y152.013 E.01038
; LINE_WIDTH: 0.479102
G1 F8253.439
G1 X133.787 Y151.999 E.01155
G1 X150.213 Y151.999 E.58381
; LINE_WIDTH: 0.465408
G1 F8520.962
G1 X150.537 Y152.013 E.01119
; LINE_WIDTH: 0.422972
G1 F9472.385
G2 X152.028 Y152.028 I1.105 J-34.134 E.04618
G2 X152.027 Y150.862 I-218.882 J-.258 E.03612
; LINE_WIDTH: 0.437443
G1 F9124.955
G1 X152.013 Y150.537 E.01045
; LINE_WIDTH: 0.479118
G1 F8253.138
G1 X151.999 Y150.213 E.01155
G1 X151.999 Y133.847 E.5817
M204 S10000
G1 X151.676 Y150.983 F42000
; LINE_WIDTH: 0.37129
G1 F10963.242
M204 S6000
G1 X151.395 Y151.395 E.01334
G1 X150.983 Y151.676 E.01334
G1 X151.676 Y151.676 E.01854
G1 X151.676 Y151.043 E.01693
M204 S10000
G1 X152.405 Y152.405 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.405 Y131.595 E.63944
G1 X131.595 Y131.595 E.63944
G1 X131.595 Y152.405 E.63944
G1 X152.345 Y152.405 E.6376
M204 S10000
G1 X152.782 Y152.782 F42000
G1 F9547.299
M204 S6000
G1 X152.782 Y131.218 E.66261
G1 X131.218 Y131.218 E.66261
G1 X131.218 Y152.782 E.66261
G1 X152.722 Y152.782 E.66077
M204 S10000
G1 X153.159 Y153.14 F42000
G1 F9547.299
M204 S6000
G1 X153.159 Y130.86 E.68459
G1 X153.14 Y130.84 E.00084
G1 X130.852 Y130.84 E.68484
G1 X130.84 Y153.148 E.68543
G1 X153.111 Y153.159 E.68428
; OBJECT_ID: 88
; WIPE_START
G1 X151.111 Y153.158 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.018 Y147.473 Z1.2 F42000
G1 X121.31 Y119.891 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z1.2 F42000
G1 X125.991 Y139.991 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.168 Y140.328 Z1.2 F42000
G1 X104.33 Y139.643 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X102.702 Y139.643 E.05401
G1 X102.357 Y139.296 E.01622
G1 X102.357 Y137.667 E.05401
M204 S10000
G1 X104.464 Y137.512 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5825
G1 F6671.856
M204 S6000
G2 X104.467 Y137.622 I-.029 J.056 E.01161
M204 S10000
G1 X104.363 Y136.313 F42000
; LINE_WIDTH: 0.428877
G1 F9327.477
M204 S6000
G1 X104.363 Y119.687 E.52288
G1 X104.476 Y119.163 E.01687
G1 X104.754 Y118.754 E.01555
G1 X105.163 Y118.475 E.01556
G3 X105.687 Y118.363 I.474 J.93 E.01706
G1 X122.313 Y118.363 E.52288
G1 X122.837 Y118.476 E.01687
G1 X123.246 Y118.754 E.01555
G1 X123.524 Y119.163 E.01555
G1 X123.637 Y119.687 E.01687
G1 X123.637 Y136.313 E.52288
G3 X123.525 Y136.837 I-1.042 J.051 E.01706
G1 X123.246 Y137.246 E.01556
G1 X122.837 Y137.525 E.01556
G3 X122.313 Y137.637 I-.474 J-.93 E.01706
G1 X105.687 Y137.637 E.52288
G1 X105.163 Y137.524 E.01687
G1 X104.754 Y137.246 E.01555
G1 X104.475 Y136.837 E.01556
G1 X104.377 Y136.543 E.00977
G1 X104.367 Y136.373 E.00536
M204 S10000
G1 X104.745 Y136.313 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X104.745 Y119.687 E.51084
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.757 Y136.371 E.0099
M204 S10000
G1 X105.122 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.122 Y119.687 E.51084
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.127 Y136.372 E.00117
M204 S10000
G1 X105.499 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.499 Y119.687 E.51084
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.522 Y136.368 E.00259
M204 S10000
G1 X104.464 Y118.372 F42000
; LINE_WIDTH: 0.5825
G1 F6671.856
M204 S6000
G2 X104.467 Y118.482 I-.029 J.056 E.01161
M204 S10000
G1 X123.604 Y118.372 F42000
G1 F6671.856
M204 S6000
G2 X123.607 Y118.482 I-.029 J.056 E.01161
M204 S10000
G1 X124.024 Y119.687 F42000
; LINE_WIDTH: 0.428132
G1 F9345.503
M204 S6000
G2 X124.028 Y117.972 I-114.734 J-1.172 E.05385
G2 X122.313 Y117.976 I-.543 J114.739 E.05385
G1 X105.687 Y117.976 E.52187
G2 X103.972 Y117.972 I-1.443 J213.444 E.05385
G2 X103.976 Y119.687 I114.739 J.543 E.05385
G1 X103.976 Y136.313 E.52187
G2 X103.972 Y138.028 I213.444 J1.443 E.05385
G2 X105.687 Y138.024 I.543 J-114.739 E.05385
G1 X122.313 Y138.024 E.52187
G2 X124.028 Y138.028 I1.443 J-213.444 E.05385
G2 X124.024 Y136.313 I-158.339 J-.424 E.05385
G1 X124.024 Y119.747 E.51998
M204 S10000
G1 X123.604 Y137.512 F42000
; LINE_WIDTH: 0.5825
G1 F6671.856
M204 S6000
G2 X123.607 Y137.622 I-.029 J.056 E.01161
M204 S10000
G1 X124.405 Y138.405 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X124.405 Y117.595 E.63944
G1 X103.595 Y117.595 E.63944
G1 X103.595 Y138.405 E.63944
G1 X124.345 Y138.405 E.6376
M204 S10000
G1 X124.782 Y138.782 F42000
G1 F9547.299
M204 S6000
G1 X124.782 Y117.218 E.66261
G1 X103.218 Y117.218 E.66261
G1 X103.218 Y138.782 E.66261
G1 X124.722 Y138.782 E.66077
M204 S10000
G1 X125.16 Y139.14 F42000
G1 F9547.299
M204 S6000
G1 X125.16 Y116.86 E.68459
G1 X125.14 Y116.841 E.00084
G1 X102.852 Y116.841 E.68484
G1 X102.841 Y139.148 E.68543
G1 X125.111 Y139.16 E.68428
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X123.111 Y139.158 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 5/53
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S183.6
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.956 J.753 P1  F42000
G1 X149.26 Y105.941 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z1.4 F42000
G1 X153.991 Y125.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 5 start: 66,77,88
M624 BwAAAAAAAAA=
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
M73 P34 R21
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer5 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X153.599 Y102.401 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X130.401 Y102.401 E.71278
G1 X130.401 Y125.599 E.71278
G1 X153.599 Y125.599 E.71278
G1 X153.599 Y102.461 E.71094
M204 S10000
G1 X153.222 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y102.778 E.04606
G1 X130.778 Y102.778 E.68961
G1 X130.778 Y125.222 E.68961
G1 X153.222 Y125.222 E.68961
G1 X153.222 Y104.337 E.6417
M204 S10000
G1 X152.845 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y103.155 E.03448
G1 X131.155 Y103.155 E.66644
G1 X131.155 Y124.845 E.66644
G1 X152.845 Y124.845 E.66644
G1 X152.845 Y104.337 E.63012
M204 S10000
M73 P34 R20
G1 X152.468 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.468 Y103.532 E.02289
G1 X131.532 Y103.532 E.64326
G1 X131.532 Y124.468 E.64326
G1 X152.468 Y124.468 E.64326
G1 X152.468 Y104.337 E.61853
M204 S10000
G1 X133.549 Y105.737 F42000
G1 F9547.299
M204 S6000
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.549 Y122.263 E.00443
G1 X133.549 Y105.797 E.50592
M204 S10000
G1 X133.172 Y105.737 F42000
G1 F9547.299
M204 S6000
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.172 Y122.263 E.00301
G1 X133.172 Y105.797 E.50592
M204 S10000
G1 X132.795 Y105.737 F42000
G1 F9547.299
M204 S6000
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.795 Y122.263 E.01175
G1 X132.795 Y105.797 E.50592
M204 S10000
G1 X132.418 Y105.737 F42000
G1 F9547.299
M204 S6000
G1 X132.526 Y105.213 E.01645
G1 X132.804 Y104.804 E.0152
G1 X133.213 Y104.526 E.0152
G3 X133.737 Y104.418 I.524 J1.211 E.01656
G1 X150.263 Y104.418 E.50776
G1 X150.787 Y104.526 E.01645
G1 X151.196 Y104.804 E.0152
G1 X151.474 Y105.213 E.0152
G1 X151.582 Y105.737 E.01645
G1 X151.582 Y122.263 E.50776
G3 X151.474 Y122.787 I-1.32 J0 E.01656
G1 X151.196 Y123.196 E.0152
G1 X150.787 Y123.474 E.0152
G3 X150.263 Y123.582 I-.524 J-1.211 E.01656
G1 X133.737 Y123.582 E.50776
G1 X133.213 Y123.474 E.01645
G1 X132.804 Y123.196 E.0152
G1 X132.526 Y122.787 E.0152
G3 X132.418 Y122.263 I1.211 J-.524 E.01656
G1 X132.418 Y105.797 E.50592
M204 S10000
G1 X133.431 Y103.988 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X133.737 Y103.975 E.01272
G1 X150.203 Y103.975 E.68208
M204 S10000
G1 X152.091 Y104.277 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.091 Y103.909 E.0113
G1 X150.993 Y103.909 E.03373
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X150.749 Y103.931 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.506 Y103.953 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X150.263 Y103.975 E.00968
G1 X150.487 Y104.043 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.712 Y104.112 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X150.937 Y104.18 E.00728
G1 X151.463 Y104.538 E.01971
G1 X151.82 Y105.063 E.01971
; LINE_WIDTH: 0.441829
G1 F9024.63
G1 X151.888 Y105.288 E.00763
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X151.957 Y105.513 E.00847
; LINE_WIDTH: 0.529182
G1 F7403.421
G1 X152.025 Y105.737 E.0093
G1 X152.047 Y105.494 E.00968
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X152.069 Y105.251 E.00881
; LINE_WIDTH: 0.425826
G1 F9401.799
G2 X152.091 Y104.337 I-5.077 J-.578 E.02854
M204 S10000
G1 X151.745 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y104.277 E.00227
G1 X151.732 Y104.309 E.00183
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.551217
G1 F7082.478
M204 S6000
G1 X152.014 Y122.51 E.6947
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X150.263 Y124.025 E.01272
G1 X133.797 Y124.025 E.68208
M204 S10000
G1 X131.988 Y122.569 F42000
G1 F7081.535
M204 S6000
G1 X131.975 Y122.263 E.01272
G1 X131.975 Y105.797 E.68208
M204 S10000
G1 X133.431 Y103.988 F42000
; LINE_WIDTH: 0.558022
G1 F6988.917
M204 S6000
G1 X133.325 Y103.969 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.219 Y103.949 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.113 Y103.929 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X133.007 Y103.909 E.00331
G1 X131.909 Y103.909 E.03382
G1 X131.909 Y105.007 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X131.931 Y105.251 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X131.953 Y105.494 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X131.975 Y105.737 E.00968
G1 X132.043 Y105.513 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X132.112 Y105.288 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X132.18 Y105.063 E.00728
G1 X132.537 Y104.538 E.01971
G1 X133.063 Y104.18 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X133.142 Y104.139 E.00286
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.22 Y104.098 E.00315
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.299 Y104.057 E.00343
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X133.377 Y104.016 E.00372
M204 S10000
G1 X132.3 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y104.277 E.00227
G1 X132.287 Y104.309 E.00183
M204 S10000
G1 X131.988 Y122.569 F42000
; LINE_WIDTH: 0.558022
G1 F6988.917
M204 S6000
G1 X131.969 Y122.675 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X131.949 Y122.781 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X131.929 Y122.887 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X131.909 Y122.993 E.00331
G1 X131.909 Y124.091 E.03382
G1 X133.007 Y124.091 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X133.251 Y124.069 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.494 Y124.047 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X133.737 Y124.025 E.00968
G1 X133.513 Y123.957 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.288 Y123.888 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X133.063 Y123.82 E.00728
G1 X132.537 Y123.463 E.01971
G1 X132.18 Y122.937 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X132.139 Y122.858 E.00286
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X132.098 Y122.78 E.00315
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X132.057 Y122.701 E.00343
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X132.016 Y122.623 E.00372
M204 S10000
G1 X132.3 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y123.723 E.00227
G1 X132.287 Y123.754 E.00183
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.558022
G1 F6988.917
M204 S6000
G1 X150.675 Y124.031 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.781 Y124.051 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.887 Y124.071 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X150.993 Y124.091 E.00331
G1 X152.091 Y124.091 E.03382
G1 X152.091 Y122.993 E.03382
; LINE_WIDTH: 0.439707
G1 F9072.895
G1 X152.071 Y122.887 E.00348
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X152.051 Y122.781 E.00383
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X152.031 Y122.675 E.00417
; LINE_WIDTH: 0.558004
G1 F6989.155
G1 X152.012 Y122.569 E.00452
G1 X151.964 Y122.661 E.00435
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X151.916 Y122.753 E.00401
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X151.868 Y122.845 E.00368
; LINE_WIDTH: 0.421475
G1 F9509.858
G1 X151.463 Y123.463 E.02279
G1 X150.937 Y123.82 E.01961
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X150.858 Y123.861 E.00286
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.78 Y123.902 E.00315
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.701 Y123.943 E.00343
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X150.623 Y123.984 E.00372
M204 S10000
G1 X151.745 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y123.723 E.00227
G1 X151.732 Y123.754 E.00183
; OBJECT_ID: 66
; WIPE_START
G1 X151.678 Y123.723 E-.33884
G1 X151.745 Y123.684 E-.42116
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X149.922 Y131.095 Z1.4 F42000
G1 X149.21 Y133.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z1.4 F42000
G1 X153.991 Y153.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.044 Y147.106 Z1.4 F42000
G1 X153.599 Y130.401 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X130.401 Y130.401 E.71278
G1 X130.401 Y153.599 E.71278
G1 X153.599 Y153.599 E.71278
G1 X153.599 Y130.461 E.71094
M204 S10000
G1 X153.222 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y130.778 E.04696
G1 X130.778 Y130.778 E.68961
G1 X130.778 Y153.222 E.68961
G1 X153.222 Y153.222 E.68961
G1 X153.222 Y132.367 E.6408
M204 S10000
G1 X152.845 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y131.155 E.03538
G1 X131.155 Y131.155 E.66644
G1 X131.155 Y152.845 E.66644
G1 X152.845 Y152.845 E.66644
G1 X152.845 Y132.367 E.62922
M204 S10000
G1 X152.468 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.468 Y131.532 E.02379
G1 X131.532 Y131.532 E.64326
G1 X131.532 Y152.468 E.64326
M73 P35 R20
G1 X152.468 Y152.468 E.64326
G1 X152.468 Y132.367 E.61763
M204 S10000
G1 X133.599 Y133.787 F42000
G1 F9547.299
M204 S6000
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.599 Y150.213 E.00443
G1 X133.599 Y133.847 E.50285
M204 S10000
G1 X133.222 Y133.787 F42000
G1 F9547.299
M204 S6000
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.222 Y150.213 E.00301
G1 X133.222 Y133.847 E.50285
M204 S10000
G1 X132.845 Y133.787 F42000
G1 F9547.299
M204 S6000
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.845 Y150.213 E.01175
G1 X132.845 Y133.847 E.50285
M204 S10000
G1 X132.468 Y133.787 F42000
G1 F9547.299
M204 S6000
G1 X132.576 Y133.263 E.01645
G1 X132.854 Y132.854 E.0152
G1 X133.263 Y132.576 E.0152
G3 X133.787 Y132.468 I.524 J1.211 E.01656
G1 X150.213 Y132.468 E.50469
G1 X150.737 Y132.576 E.01645
G1 X151.146 Y132.854 E.0152
G1 X151.424 Y133.263 E.0152
G1 X151.532 Y133.787 E.01645
G1 X151.532 Y150.213 E.50469
G3 X151.424 Y150.737 I-1.32 J0 E.01656
G1 X151.146 Y151.146 E.0152
G1 X150.737 Y151.424 E.0152
G3 X150.213 Y151.532 I-.524 J-1.211 E.01656
G1 X133.787 Y151.532 E.50469
G1 X133.263 Y151.424 E.01645
G1 X132.854 Y151.146 E.0152
G1 X132.576 Y150.737 E.0152
G3 X132.468 Y150.213 I1.211 J-.524 E.01656
G1 X132.468 Y133.847 E.50285
M204 S10000
G1 X133.476 Y132.014 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X133.787 Y132 E.01417
G1 X150.153 Y132 E.74463
M204 S10000
G1 X152.091 Y132.307 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.091 Y131.909 E.0122
G1 X150.953 Y131.909 E.03495
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X150.768 Y131.932 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.583 Y131.955 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.398 Y131.977 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X150.213 Y132 E.00814
G1 X150.381 Y132.058 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.55 Y132.115 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.718 Y132.173 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X150.887 Y132.23 E.00551
G1 X151.413 Y132.587 E.01968
G1 X151.77 Y133.113 E.01968
; LINE_WIDTH: 0.442619
G1 F9006.783
G1 X151.827 Y133.282 E.0058
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X151.885 Y133.45 E.00646
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X151.942 Y133.619 E.00711
; LINE_WIDTH: 0.578392
G1 F6723.05
G1 X152 Y133.787 E.00777
G1 X152.023 Y133.602 E.00814
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X152.045 Y133.417 E.00745
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X152.068 Y133.232 E.00676
; LINE_WIDTH: 0.424858
G1 F9425.616
G1 X152.091 Y133.047 E.0058
G1 X152.091 Y132.367 E.02117
M204 S10000
G1 X151.719 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.601224
G1 F6448.099
M204 S6000
G1 X151.989 Y150.464 E.7587
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X150.213 Y152 E.01417
G1 X133.847 Y152 E.74463
M204 S10000
G1 X132.014 Y150.524 F42000
G1 F6447.305
M204 S6000
G1 X132 Y150.213 E.01417
G1 X132 Y133.847 E.74463
M204 S10000
G1 X133.476 Y132.014 F42000
; LINE_WIDTH: 0.607307
G1 F6378.602
M204 S6000
G1 X133.39 Y131.993 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.304 Y131.972 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.219 Y131.951 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.133 Y131.93 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X133.047 Y131.909 E.00272
G1 X131.909 Y131.909 E.03502
G1 X131.909 Y133.047 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X131.932 Y133.232 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X131.955 Y133.417 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X131.977 Y133.602 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X132 Y133.787 E.00814
G1 X132.058 Y133.619 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X132.115 Y133.45 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X132.173 Y133.282 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X132.23 Y133.113 E.00551
G1 X132.587 Y132.587 E.01968
G1 X133.113 Y132.23 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X133.176 Y132.193 E.00235
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.238 Y132.156 E.0026
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.3 Y132.119 E.00284
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.362 Y132.081 E.00309
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X133.425 Y132.044 E.00333
M204 S10000
G1 X132.333 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X132.014 Y150.524 F42000
; LINE_WIDTH: 0.607307
G1 F6378.602
M204 S6000
G1 X131.993 Y150.61 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X131.972 Y150.695 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X131.951 Y150.781 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X131.93 Y150.867 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X131.909 Y150.953 E.00272
G1 X131.909 Y152.091 E.03502
G1 X133.047 Y152.091 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X133.232 Y152.068 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.417 Y152.045 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.602 Y152.023 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X133.787 Y152 E.00814
G1 X133.619 Y151.942 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.45 Y151.885 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.282 Y151.827 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X133.113 Y151.77 E.00551
G1 X132.587 Y151.413 E.01968
G1 X132.23 Y150.887 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X132.193 Y150.824 E.00235
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X132.156 Y150.762 E.0026
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X132.119 Y150.7 E.00284
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X132.081 Y150.638 E.00309
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X132.044 Y150.575 E.00333
M204 S10000
G1 X132.333 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.607307
G1 F6378.602
M204 S6000
G1 X150.61 Y152.007 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.695 Y152.028 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.781 Y152.049 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.867 Y152.07 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X150.953 Y152.091 E.00272
G1 X152.091 Y152.091 E.03502
G1 X152.091 Y150.953 E.03502
; LINE_WIDTH: 0.440801
G1 F9047.931
G1 X152.07 Y150.867 E.00286
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X152.049 Y150.781 E.00316
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X152.028 Y150.695 E.00346
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X152.007 Y150.61 E.00376
; LINE_WIDTH: 0.607289
G1 F6378.806
G1 X151.986 Y150.524 E.00406
G1 X151.872 Y150.702 E.00973
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X151.757 Y150.879 E.00901
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X151.642 Y151.057 E.00829
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X151.527 Y151.235 E.00758
; LINE_WIDTH: 0.425186
G1 F9417.527
G1 X151.413 Y151.413 E.00659
G1 X150.887 Y151.77 E.01981
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X150.824 Y151.807 E.00235
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.762 Y151.844 E.0026
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.7 Y151.881 E.00284
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.638 Y151.919 E.00309
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X150.575 Y151.956 E.00333
M204 S10000
G1 X151.719 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y151.739 I-.026 J.043 E.00696
; OBJECT_ID: 88
; WIPE_START
G1 X151.667 Y151.739 E-.16772
G1 X151.641 Y151.693 E-.19743
G1 X151.667 Y151.648 E-.19743
G1 X151.719 Y151.648 E-.19743
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.441 Y146.135 Z1.4 F42000
G1 X121.31 Y119.891 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z1.4 F42000
G1 X125.991 Y139.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.044 Y133.106 Z1.4 F42000
G1 X125.599 Y116.401 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X102.401 Y116.401 E.71278
G1 X102.401 Y139.599 E.71278
G1 X125.599 Y139.599 E.71278
G1 X125.599 Y116.461 E.71094
M204 S10000
G1 X125.222 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X125.222 Y116.778 E.04516
G1 X102.778 Y116.778 E.68961
G1 X102.778 Y139.222 E.68961
G1 X125.222 Y139.222 E.68961
G1 X125.222 Y118.308 E.6426
M204 S10000
G1 X124.845 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.845 Y117.155 E.03358
G1 X103.155 Y117.155 E.66644
G1 X103.155 Y138.845 E.66644
G1 X124.845 Y138.845 E.66644
G1 X124.845 Y118.308 E.63102
M204 S10000
G1 X124.468 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.468 Y117.532 E.02199
G1 X103.532 Y117.532 E.64326
G1 X103.532 Y138.468 E.64326
G1 X124.468 Y138.468 E.64326
G1 X124.468 Y118.308 E.61943
M204 S10000
G1 X105.499 Y119.687 F42000
G1 F9547.299
M204 S6000
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.499 Y136.313 E.00443
G1 X105.499 Y119.747 E.50899
M204 S10000
G1 X105.122 Y119.687 F42000
G1 F9547.299
M204 S6000
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.122 Y136.313 E.00301
G1 X105.122 Y119.747 E.50899
M204 S10000
G1 X104.745 Y119.687 F42000
G1 F9547.299
M204 S6000
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.745 Y136.313 E.01175
G1 X104.745 Y119.747 E.50899
M204 S10000
G1 X104.368 Y119.687 F42000
G1 F9547.299
M204 S6000
G1 X104.476 Y119.163 E.01645
G1 X104.754 Y118.754 E.0152
G1 X105.163 Y118.476 E.0152
G3 X105.687 Y118.368 I.524 J1.211 E.01656
G1 X122.313 Y118.368 E.51084
G1 X122.837 Y118.476 E.01645
G1 X123.246 Y118.754 E.0152
G1 X123.524 Y119.163 E.0152
G1 X123.632 Y119.687 E.01645
G1 X123.632 Y136.313 E.51084
G3 X123.524 Y136.837 I-1.319 J0 E.01656
G1 X123.246 Y137.246 E.0152
G1 X122.837 Y137.524 E.0152
G3 X122.313 Y137.632 I-.524 J-1.211 E.01656
G1 X105.687 Y137.632 E.51084
M73 P36 R20
G1 X105.163 Y137.524 E.01645
G1 X104.754 Y137.246 E.0152
G1 X104.476 Y136.837 E.0152
G3 X104.368 Y136.313 I1.211 J-.524 E.01656
G1 X104.368 Y119.747 E.50899
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X105.687 Y117.95 E.01131
G1 X122.253 Y117.95 E.61872
M204 S10000
G1 X124.016 Y118.248 F42000
; LINE_WIDTH: 0.57005
G1 F6829.435
M204 S6000
G1 X124.016 Y117.985 E.01132
G1 X123.032 Y117.985 E.04223
; LINE_WIDTH: 0.552798
G1 F7060.519
G1 X122.672 Y117.967 E.01497
; LINE_WIDTH: 0.529752
G1 F7394.757
G1 X122.313 Y117.95 E.01429
G1 X123.016 Y118.061 E.02826
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X123.566 Y118.434 E.02852
G1 X123.939 Y118.984 E.02852
; LINE_WIDTH: 0.552793
G1 F7060.589
G1 X123.994 Y119.335 E.0148
; LINE_WIDTH: 0.529825
G1 F7393.638
G1 X124.05 Y119.687 E.01413
G1 X124.016 Y118.968 E.02859
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X124.016 Y118.308 E.02833
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.50121
G1 F7855.299
M204 S6000
G1 X124.039 Y136.555 E.62993
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X122.313 Y138.05 E.01131
G1 X105.747 Y138.05 E.61872
M204 S10000
G1 X103.963 Y136.615 F42000
G1 F7854.154
M204 S6000
G1 X103.95 Y136.313 E.01131
G1 X103.95 Y119.747 E.61872
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.559877
G1 F6963.836
M204 S6000
G3 X103.985 Y117.985 I-1.269 J-37.272 E.059
G1 X103.985 Y118.968 E.04142
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X103.967 Y119.328 E.01497
; LINE_WIDTH: 0.529756
G1 F7394.694
G1 X103.95 Y119.687 E.01429
G1 X104.061 Y118.984 E.02826
; LINE_WIDTH: 0.565576
G1 F6887.904
G1 X104.434 Y118.434 E.02828
G1 X104.984 Y118.061 E.02828
G1 X105.327 Y117.977 E.01504
M204 S10000
G1 X103.963 Y136.615 F42000
; LINE_WIDTH: 0.559877
G1 F6963.836
M204 S6000
G3 X103.985 Y138.016 I-37.272 J1.269 E.059
G1 X104.968 Y138.016 E.04142
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X105.328 Y138.033 E.01497
; LINE_WIDTH: 0.529756
G1 F7394.694
G1 X105.687 Y138.05 E.01429
G1 X104.984 Y137.939 E.02826
; LINE_WIDTH: 0.565576
G1 F6887.904
G1 X104.434 Y137.566 E.02828
G1 X104.061 Y137.016 E.02828
G1 X103.977 Y136.673 E.01504
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.559929
G1 F6963.128
M204 S6000
G3 X124.016 Y138.016 I1.269 J37.272 E.05901
G3 X124.037 Y136.615 I13.692 J-.492 E.05903
G1 X123.939 Y137.016 E.0174
G1 X123.566 Y137.566 E.02797
G1 X123.016 Y137.939 E.02797
G1 X122.673 Y138.023 E.01488
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6963.128
G1 X123.016 Y137.939 E-.13418
G1 X123.566 Y137.566 E-.25231
G1 X123.939 Y137.016 E-.25231
G1 X124.015 Y136.707 E-.1212
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 6/53
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.941 J.772 P1  F42000
G1 X149.26 Y105.941 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z1.6 F42000
G1 X153.991 Y125.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 6 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer6 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.431 Y103.988 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X133.737 Y103.975 E.01272
G1 X150.203 Y103.975 E.68208
M204 S10000
G1 X132.3 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y104.277 E.00227
G1 X132.287 Y104.309 E.00183
M204 S10000
G1 X131.975 Y105.737 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X132.043 Y105.513 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X132.112 Y105.288 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X132.18 Y105.063 E.00728
G1 X132.537 Y104.538 E.01971
G1 X133.063 Y104.18 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X133.155 Y104.132 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.247 Y104.084 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.339 Y104.036 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X133.431 Y103.988 E.00435
G1 X133.325 Y103.969 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.219 Y103.949 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.113 Y103.929 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X133.007 Y103.909 E.00331
G1 X131.909 Y103.909 E.03382
G1 X131.909 Y105.007 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X131.93 Y105.231 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X131.95 Y105.454 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X131.97 Y105.678 E.00889
M204 S10000
G1 X133.549 Y122.263 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.549 Y105.737 E.50776
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.572 Y122.318 E.00259
M204 S10000
G1 X133.172 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.172 Y105.737 E.50776
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.177 Y122.322 E.00117
M204 S10000
G1 X132.795 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.795 Y105.737 E.50776
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.807 Y122.321 E.0099
M204 S10000
G1 X132.418 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.418 Y105.737 E.50776
G1 X132.526 Y105.213 E.01645
G1 X132.804 Y104.804 E.0152
G1 X133.213 Y104.526 E.0152
G3 X133.737 Y104.418 I.524 J1.211 E.01656
G1 X150.263 Y104.418 E.50776
G1 X150.787 Y104.526 E.01645
G1 X151.196 Y104.804 E.0152
G1 X151.474 Y105.213 E.0152
G1 X151.582 Y105.737 E.01645
G1 X151.582 Y122.263 E.50776
G3 X151.474 Y122.787 I-1.32 J0 E.01656
G1 X151.196 Y123.196 E.0152
G1 X150.787 Y123.474 E.0152
G3 X150.263 Y123.582 I-.524 J-1.211 E.01656
G1 X133.737 Y123.582 E.50776
G1 X133.213 Y123.474 E.01645
G1 X132.804 Y123.196 E.0152
G1 X132.526 Y122.787 E.0152
G3 X132.423 Y122.322 I1.069 J-.482 E.01472
M204 S10000
G1 X131.988 Y122.569 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X131.975 Y122.263 E.01272
G1 X131.975 Y105.797 E.68208
M204 S10000
G1 X132.3 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y123.723 E.00227
G1 X132.287 Y123.754 E.00183
M204 S10000
G1 X133.737 Y124.025 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X133.513 Y123.957 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.288 Y123.888 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X133.063 Y123.82 E.00728
G1 X132.537 Y123.463 E.01971
G1 X132.18 Y122.937 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X132.132 Y122.845 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X132.084 Y122.753 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X132.036 Y122.661 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X131.988 Y122.569 E.00435
G1 X131.969 Y122.675 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X131.949 Y122.781 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X131.929 Y122.887 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X131.909 Y122.993 E.00331
G1 X131.909 Y124.091 E.03382
G1 X133.007 Y124.091 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X133.231 Y124.07 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.454 Y124.05 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X133.678 Y124.03 E.00889
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X150.263 Y124.025 E.01272
G1 X133.797 Y124.025 E.68208
M204 S10000
G1 X151.745 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y123.723 E.00227
G1 X151.732 Y123.754 E.00183
M204 S10000
G1 X152.012 Y122.569 F42000
; LINE_WIDTH: 0.558004
G1 F6989.155
M204 S6000
G1 X151.964 Y122.661 E.00435
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X151.916 Y122.753 E.00401
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X151.868 Y122.845 E.00368
; LINE_WIDTH: 0.421475
G1 F9509.858
G1 X151.463 Y123.463 E.02279
G1 X150.937 Y123.82 E.01961
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X150.845 Y123.868 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.753 Y123.916 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.661 Y123.964 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X150.569 Y124.012 E.00435
G1 X150.675 Y124.031 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.781 Y124.051 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.887 Y124.071 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X150.993 Y124.091 E.00331
G1 X152.091 Y124.091 E.03382
G1 X152.091 Y122.993 E.03382
; LINE_WIDTH: 0.439707
G1 F9072.895
G1 X152.074 Y122.902 E.00299
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X152.057 Y122.811 E.00329
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X152.04 Y122.72 E.00359
; LINE_WIDTH: 0.558004
G1 F6989.155
G1 X152.023 Y122.628 E.00389
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.529182
G1 F7403.421
M204 S6000
G1 X152.047 Y105.494 E.00968
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X152.069 Y105.251 E.00881
; LINE_WIDTH: 0.422177
G1 F9492.255
G1 X152.091 Y105.007 E.00755
G1 X152.091 Y103.909 E.03393
G1 X150.993 Y103.909 E.03393
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X150.749 Y103.931 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.506 Y103.953 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X150.263 Y103.975 E.00968
G1 X150.487 Y104.043 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.712 Y104.112 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X150.937 Y104.18 E.00728
G1 X151.463 Y104.538 E.01971
G1 X151.82 Y105.063 E.01971
; LINE_WIDTH: 0.441829
G1 F9024.63
G1 X151.882 Y105.269 E.00698
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X151.945 Y105.474 E.00775
; LINE_WIDTH: 0.529182
G1 F7403.421
G1 X152.008 Y105.68 E.00851
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.551217
G1 F7082.478
M204 S6000
G1 X152.014 Y122.51 E.6947
M204 S10000
G1 X151.745 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y104.277 E.00227
G1 X151.732 Y104.309 E.00183
M204 S10000
G1 X152.468 Y104.277 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y103.532 E.02289
G1 X131.532 Y103.532 E.64326
G1 X131.532 Y124.468 E.64326
G1 X152.468 Y124.468 E.64326
G1 X152.468 Y104.337 E.61853
M204 S10000
G1 X152.845 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y103.155 E.03448
G1 X131.155 Y103.155 E.66644
G1 X131.155 Y124.845 E.66644
G1 X152.845 Y124.845 E.66644
G1 X152.845 Y104.337 E.63012
M204 S10000
G1 X153.222 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y102.778 E.04606
G1 X130.778 Y102.778 E.68961
G1 X130.778 Y125.222 E.68961
G1 X153.222 Y125.222 E.68961
G1 X153.222 Y104.337 E.6417
M204 S10000
G1 X153.599 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y102.401 E.05765
G1 X130.401 Y102.401 E.71278
G1 X130.401 Y125.599 E.71278
G1 X153.599 Y125.599 E.71278
G1 X153.599 Y104.337 E.65329
; OBJECT_ID: 66
; WIPE_START
G1 X153.599 Y106.337 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X152.402 Y113.875 Z1.6 F42000
G1 X149.21 Y133.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z1.6 F42000
G1 X153.991 Y153.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P37 R20
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.847 Y148.919 Z1.6 F42000
G1 X133.476 Y132.014 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X133.787 Y132 E.01417
G1 X150.153 Y132 E.74463
M204 S10000
G1 X132.333 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X132 Y133.787 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X132.058 Y133.619 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X132.115 Y133.45 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X132.173 Y133.282 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X132.23 Y133.113 E.00551
G1 X132.587 Y132.587 E.01968
G1 X133.113 Y132.23 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X133.186 Y132.187 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.259 Y132.143 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.331 Y132.1 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.404 Y132.057 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X133.476 Y132.014 E.00389
G1 X133.39 Y131.993 E.00406
; LINE_WIDTH: 0.565681
M73 P37 R19
G1 F6886.513
G1 X133.304 Y131.972 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.219 Y131.951 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.133 Y131.93 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X133.047 Y131.909 E.00272
G1 X131.909 Y131.909 E.03502
G1 X131.909 Y133.047 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X131.93 Y133.217 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X131.951 Y133.387 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X131.972 Y133.558 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X131.993 Y133.728 E.00748
M204 S10000
G1 X133.599 Y150.213 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.599 Y133.787 E.50469
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.622 Y150.268 E.00259
M204 S10000
G1 X133.222 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.222 Y133.787 E.50469
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.227 Y150.272 E.00117
M204 S10000
G1 X132.845 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.845 Y133.787 E.50469
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.857 Y150.271 E.0099
M204 S10000
G1 X132.468 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.468 Y133.787 E.50469
G1 X132.576 Y133.263 E.01645
G1 X132.854 Y132.854 E.0152
G1 X133.263 Y132.576 E.0152
G3 X133.787 Y132.468 I.524 J1.211 E.01656
G1 X150.213 Y132.468 E.50469
G1 X150.737 Y132.576 E.01645
G1 X151.146 Y132.854 E.0152
G1 X151.424 Y133.263 E.0152
G1 X151.532 Y133.787 E.01645
G1 X151.532 Y150.213 E.50469
G3 X151.424 Y150.737 I-1.32 J0 E.01656
G1 X151.146 Y151.146 E.0152
G1 X150.737 Y151.424 E.0152
G3 X150.213 Y151.532 I-.524 J-1.211 E.01656
G1 X133.787 Y151.532 E.50469
G1 X133.263 Y151.424 E.01645
G1 X132.854 Y151.146 E.0152
G1 X132.576 Y150.737 E.0152
G3 X132.473 Y150.272 I1.069 J-.482 E.01472
M204 S10000
G1 X132.014 Y150.524 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X132 Y150.213 E.01417
G1 X132 Y133.847 E.74463
M204 S10000
G1 X132.333 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X133.787 Y152 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X133.619 Y151.942 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.45 Y151.885 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.282 Y151.827 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X133.113 Y151.77 E.00551
G1 X132.587 Y151.413 E.01968
G1 X132.23 Y150.887 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X132.187 Y150.814 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X132.143 Y150.741 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X132.1 Y150.669 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X132.057 Y150.596 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X132.014 Y150.524 E.00389
G1 X131.993 Y150.61 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X131.972 Y150.695 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X131.951 Y150.781 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X131.93 Y150.867 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X131.909 Y150.953 E.00272
G1 X131.909 Y152.091 E.03502
G1 X133.047 Y152.091 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X133.217 Y152.07 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.387 Y152.049 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.558 Y152.028 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X133.728 Y152.007 E.00748
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X150.213 Y152 E.01417
G1 X133.847 Y152 E.74463
M204 S10000
G1 X151.719 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X151.986 Y150.524 F42000
; LINE_WIDTH: 0.607289
G1 F6378.806
M204 S6000
G1 X151.872 Y150.702 E.00973
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X151.757 Y150.879 E.00901
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X151.642 Y151.057 E.00829
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X151.527 Y151.235 E.00758
; LINE_WIDTH: 0.425186
G1 F9417.527
G1 X151.413 Y151.413 E.00659
G1 X150.887 Y151.77 E.01981
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X150.814 Y151.813 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.741 Y151.857 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.669 Y151.9 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.596 Y151.943 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X150.524 Y151.986 E.00389
G1 X150.61 Y152.007 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.695 Y152.028 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.781 Y152.049 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.867 Y152.07 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X150.953 Y152.091 E.00272
G1 X152.091 Y152.091 E.03502
G1 X152.091 Y150.953 E.03502
; LINE_WIDTH: 0.440801
G1 F9047.931
G1 X152.073 Y150.879 E.00247
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X152.055 Y150.805 E.00273
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X152.037 Y150.73 E.00299
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X152.019 Y150.656 E.00325
; LINE_WIDTH: 0.607289
G1 F6378.806
G1 X152.001 Y150.582 E.00351
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.578392
G1 F6723.05
M204 S6000
G1 X152.023 Y133.602 E.00814
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X152.045 Y133.417 E.00745
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X152.068 Y133.232 E.00676
; LINE_WIDTH: 0.421705
G1 F9504.091
G1 X152.091 Y133.047 E.00576
G1 X152.091 Y131.909 E.03511
G1 X150.953 Y131.909 E.03511
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X150.768 Y131.932 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.583 Y131.955 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.398 Y131.977 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X150.213 Y132 E.00814
G1 X150.381 Y132.058 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.55 Y132.115 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.718 Y132.173 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X150.887 Y132.23 E.00551
G1 X151.413 Y132.587 E.01968
G1 X151.77 Y133.113 E.01968
; LINE_WIDTH: 0.442619
G1 F9006.783
G1 X151.823 Y133.268 E.00531
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X151.875 Y133.422 E.00591
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X151.928 Y133.576 E.00651
; LINE_WIDTH: 0.578392
G1 F6723.05
G1 X151.981 Y133.731 E.00711
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.601224
G1 F6448.099
M204 S6000
G1 X151.989 Y150.464 E.7587
M204 S10000
G1 X151.719 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X152.468 Y132.307 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y131.532 E.02379
G1 X131.532 Y131.532 E.64326
G1 X131.532 Y152.468 E.64326
G1 X152.468 Y152.468 E.64326
G1 X152.468 Y132.367 E.61763
M204 S10000
G1 X152.845 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y131.155 E.03538
G1 X131.155 Y131.155 E.66644
G1 X131.155 Y152.845 E.66644
G1 X152.845 Y152.845 E.66644
G1 X152.845 Y132.367 E.62922
M204 S10000
G1 X153.222 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y130.778 E.04696
G1 X130.778 Y130.778 E.68961
G1 X130.778 Y153.222 E.68961
G1 X153.222 Y153.222 E.68961
G1 X153.222 Y132.367 E.6408
M204 S10000
G1 X153.599 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y130.401 E.05855
G1 X130.401 Y130.401 E.71278
G1 X130.401 Y153.599 E.71278
G1 X153.599 Y153.599 E.71278
G1 X153.599 Y132.367 E.65239
; OBJECT_ID: 88
; WIPE_START
G1 X153.599 Y134.367 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.634 Y131.244 Z1.6 F42000
G1 X121.31 Y119.891 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z1.6 F42000
G1 X125.991 Y139.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y133.107 Z1.6 F42000
G1 X125.599 Y118.248 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X125.599 Y116.401 E.05675
G1 X102.401 Y116.401 E.71278
G1 X102.401 Y139.599 E.71278
G1 X125.599 Y139.599 E.71278
G1 X125.599 Y118.308 E.65419
M204 S10000
G1 X125.222 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X125.222 Y116.778 E.04516
G1 X102.778 Y116.778 E.68961
G1 X102.778 Y139.222 E.68961
G1 X125.222 Y139.222 E.68961
G1 X125.222 Y118.308 E.6426
M204 S10000
G1 X124.845 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.845 Y117.155 E.03358
G1 X103.155 Y117.155 E.66644
G1 X103.155 Y138.845 E.66644
G1 X124.845 Y138.845 E.66644
G1 X124.845 Y118.308 E.63102
M204 S10000
G1 X124.468 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.468 Y117.532 E.02199
G1 X103.532 Y117.532 E.64326
G1 X103.532 Y138.468 E.64326
M73 P38 R19
G1 X124.468 Y138.468 E.64326
G1 X124.468 Y118.308 E.61943
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.518278
G1 F7573.247
M204 S6000
G1 X124.033 Y119.328 E.01395
; LINE_WIDTH: 0.567378
G1 F6864.229
G3 X124.016 Y117.985 I28.005 J-1.031 E.05741
G1 X123.032 Y117.985 E.04202
; LINE_WIDTH: 0.552798
G1 F7060.519
G1 X122.672 Y117.967 E.01497
; LINE_WIDTH: 0.529752
G1 F7394.757
G1 X122.313 Y117.95 E.01429
G1 X123.016 Y118.061 E.02826
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X123.566 Y118.434 E.02852
G1 X123.939 Y118.984 E.02852
; LINE_WIDTH: 0.552793
G1 F7060.589
G1 X123.99 Y119.306 E.01355
; LINE_WIDTH: 0.518278
G1 F7573.247
G1 X124.041 Y119.628 E.01264
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.50121
G1 F7855.299
M204 S6000
G1 X124.039 Y136.555 E.62993
M204 S10000
G1 X124.037 Y136.615 F42000
; LINE_WIDTH: 0.559929
G1 F6963.127
M204 S6000
G1 X123.939 Y137.016 E.0174
G1 X123.566 Y137.566 E.02797
G1 X123.016 Y137.939 E.02797
G1 X122.615 Y138.037 E.0174
G3 X124.016 Y138.016 I1.269 J37.272 E.05901
G3 X124.034 Y136.675 I13.108 J-.492 E.0565
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X122.313 Y138.05 E.01131
G1 X105.747 Y138.05 E.61872
M204 S10000
G1 X105.687 Y138.05 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X105.335 Y137.994 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.984 Y137.939 E.01505
G1 X104.434 Y137.566 E.02805
G1 X104.061 Y137.016 E.02805
G1 X103.963 Y136.615 E.01745
G3 X103.985 Y138.016 I-37.272 J1.269 E.05916
G1 X104.968 Y138.016 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X105.298 Y138.031 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X105.627 Y138.047 E.01279
M204 S10000
G1 X105.499 Y136.313 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X105.499 Y119.687 E.51084
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.522 Y136.368 E.00259
M204 S10000
G1 X105.122 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.122 Y119.687 E.51084
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.127 Y136.372 E.00117
M204 S10000
G1 X104.745 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.745 Y119.687 E.51084
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.757 Y136.371 E.0099
M204 S10000
G1 X104.368 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.368 Y119.687 E.51084
G1 X104.476 Y119.163 E.01645
G1 X104.754 Y118.754 E.0152
G1 X105.163 Y118.476 E.0152
G3 X105.687 Y118.368 I.524 J1.211 E.01656
G1 X122.313 Y118.368 E.51084
G1 X122.837 Y118.476 E.01645
G1 X123.246 Y118.754 E.0152
G1 X123.524 Y119.163 E.0152
G1 X123.632 Y119.687 E.01645
G1 X123.632 Y136.313 E.51084
G3 X123.524 Y136.837 I-1.319 J0 E.01656
G1 X123.246 Y137.246 E.0152
G1 X122.837 Y137.524 E.0152
G3 X122.313 Y137.632 I-.524 J-1.211 E.01656
G1 X105.687 Y137.632 E.51084
G1 X105.163 Y137.524 E.01645
G1 X104.754 Y137.246 E.0152
G1 X104.476 Y136.837 E.0152
G3 X104.373 Y136.372 I1.069 J-.482 E.01472
M204 S10000
G1 X103.963 Y136.615 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X103.95 Y136.313 E.01131
G1 X103.95 Y119.747 E.61872
M204 S10000
G1 X103.95 Y119.687 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X104.006 Y119.335 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.061 Y118.984 E.01505
G1 X104.434 Y118.434 E.02805
G1 X104.984 Y118.061 E.02805
G1 X105.385 Y117.963 E.01745
G3 X103.985 Y117.985 I-1.269 J-37.272 E.05916
G1 X103.985 Y118.968 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X103.969 Y119.298 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X103.953 Y119.627 E.01279
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X105.687 Y117.95 E.01131
G1 X122.253 Y117.95 E.61872
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7854.154
G1 X120.253 Y117.95 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 7/53
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.466 J1.124 P1  F42000
G1 X149.26 Y105.941 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.059 Y105.941 E.02651
G1 X150.059 Y122.059 E.53467
G1 X133.941 Y122.059 E.53467
G1 X133.941 Y105.941 E.53467
G1 X149.2 Y105.941 E.50617
M204 S10000
G1 X149.26 Y106.348 F42000
G1 F6000
M204 S6000
G1 X149.652 Y106.348 E.01301
G1 X149.652 Y121.652 E.50767
G1 X134.348 Y121.652 E.50767
G1 X134.348 Y106.348 E.50767
G1 X149.2 Y106.348 E.49267
M204 S250
G1 X149.26 Y106.74 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.247 Y116.095 Z1.8 F42000
G1 X153.991 Y125.991 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y125.991 E.79552
G1 X130.009 Y102.009 E.79552
G1 X153.991 Y102.009 E.79552
G1 X153.991 Y125.931 E.79353
M204 S10000
G1 X154.398 Y126.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 7 start: 66,77,88
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


; object ids of this layer7 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X133.431 Y103.988 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X133.737 Y103.975 E.01272
G1 X150.203 Y103.975 E.68208
M204 S10000
G1 X132.3 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y104.277 E.00227
G1 X132.287 Y104.309 E.00183
M204 S10000
G1 X131.975 Y105.737 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
G1 X132.043 Y105.513 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X132.112 Y105.288 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X132.18 Y105.063 E.00728
G1 X132.537 Y104.538 E.01971
G1 X133.063 Y104.18 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X133.155 Y104.132 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.247 Y104.084 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.339 Y104.036 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X133.431 Y103.988 E.00435
G1 X133.325 Y103.969 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X133.219 Y103.949 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X133.113 Y103.929 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X133.007 Y103.909 E.00331
G1 X131.909 Y103.909 E.03382
G1 X131.909 Y105.007 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X131.93 Y105.231 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X131.95 Y105.454 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X131.97 Y105.678 E.00889
M204 S10000
G1 X133.549 Y122.263 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.549 Y105.737 E.50776
G1 X133.604 Y105.604 E.00443
G1 X133.737 Y105.549 E.00443
G1 X150.263 Y105.549 E.50776
G1 X150.396 Y105.604 E.00443
G1 X150.451 Y105.737 E.00443
G1 X150.451 Y122.263 E.50776
G1 X150.396 Y122.396 E.00443
G1 X150.263 Y122.451 E.00443
G1 X133.737 Y122.451 E.50776
G1 X133.604 Y122.396 E.00443
G1 X133.572 Y122.318 E.00259
M204 S10000
G1 X133.172 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X133.172 Y105.737 E.50776
G3 X133.337 Y105.337 I.566 J0 E.01365
G1 X133.64 Y105.18 E.01047
G1 X133.737 Y105.172 E.00301
G1 X150.263 Y105.172 E.50776
G3 X150.828 Y105.737 I0 J.566 E.0273
G1 X150.828 Y122.263 E.50776
G3 X150.663 Y122.663 I-.566 J0 E.01365
G1 X150.36 Y122.82 E.01047
G1 X150.263 Y122.828 E.00301
G1 X133.737 Y122.828 E.50776
G3 X133.337 Y122.663 I0 J-.566 E.01365
G1 X133.18 Y122.36 E.01047
G1 X133.177 Y122.322 E.00117
M204 S10000
G1 X132.795 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.795 Y105.737 E.50776
G1 X132.872 Y105.363 E.01175
G1 X133.071 Y105.071 E.01085
G1 X133.363 Y104.872 E.01085
G1 X133.737 Y104.795 E.01175
G1 X150.263 Y104.795 E.50776
G1 X150.637 Y104.872 E.01175
G1 X150.929 Y105.071 E.01085
G1 X151.128 Y105.363 E.01085
G1 X151.205 Y105.737 E.01175
G1 X151.205 Y122.263 E.50776
G1 X151.128 Y122.637 E.01175
G1 X150.929 Y122.929 E.01085
G1 X150.637 Y123.128 E.01085
G1 X150.263 Y123.205 E.01175
G1 X133.737 Y123.205 E.50776
G1 X133.363 Y123.128 E.01175
G1 X133.071 Y122.929 E.01085
G1 X132.872 Y122.637 E.01085
G1 X132.807 Y122.321 E.0099
M204 S10000
G1 X132.418 Y122.263 F42000
G1 F9547.299
M204 S6000
G1 X132.418 Y105.737 E.50776
G1 X132.526 Y105.213 E.01645
G1 X132.804 Y104.804 E.0152
G1 X133.213 Y104.526 E.0152
G3 X133.737 Y104.418 I.524 J1.211 E.01656
G1 X150.263 Y104.418 E.50776
G1 X150.787 Y104.526 E.01645
G1 X151.196 Y104.804 E.0152
G1 X151.474 Y105.213 E.0152
G1 X151.582 Y105.737 E.01645
G1 X151.582 Y122.263 E.50776
G3 X151.474 Y122.787 I-1.32 J0 E.01656
G1 X151.196 Y123.196 E.0152
G1 X150.787 Y123.474 E.0152
G3 X150.263 Y123.582 I-.524 J-1.211 E.01656
G1 X133.737 Y123.582 E.50776
G1 X133.213 Y123.474 E.01645
G1 X132.804 Y123.196 E.0152
G1 X132.526 Y122.787 E.0152
G3 X132.423 Y122.322 I1.069 J-.482 E.01472
M204 S10000
G1 X131.988 Y122.569 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X131.975 Y122.263 E.01272
G1 X131.975 Y105.797 E.68208
M204 S10000
G1 X132.3 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X132.233 Y123.723 E.00227
G1 X132.287 Y123.754 E.00183
M204 S10000
G1 X133.737 Y124.025 F42000
; LINE_WIDTH: 0.529199
G1 F7403.169
M204 S6000
M73 P39 R19
G1 X133.513 Y123.957 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.288 Y123.888 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X133.063 Y123.82 E.00728
G1 X132.537 Y123.463 E.01971
G1 X132.18 Y122.937 E.01971
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X132.132 Y122.845 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X132.084 Y122.753 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X132.036 Y122.661 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X131.988 Y122.569 E.00435
G1 X131.969 Y122.675 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X131.949 Y122.781 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X131.929 Y122.887 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X131.909 Y122.993 E.00331
G1 X131.909 Y124.091 E.03382
G1 X133.007 Y124.091 E.03382
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X133.231 Y124.07 E.00729
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X133.454 Y124.05 E.00809
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X133.678 Y124.03 E.00889
M204 S10000
G1 X150.569 Y124.012 F42000
; LINE_WIDTH: 0.551285
G1 F7081.535
M204 S6000
G1 X150.263 Y124.025 E.01272
G1 X133.797 Y124.025 E.68208
M204 S10000
G1 X151.745 Y123.684 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y123.723 E.00227
G1 X151.732 Y123.754 E.00183
M204 S10000
G1 X152.012 Y122.569 F42000
; LINE_WIDTH: 0.558004
G1 F6989.155
M204 S6000
G1 X151.964 Y122.661 E.00435
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X151.916 Y122.753 E.00401
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X151.868 Y122.845 E.00368
; LINE_WIDTH: 0.421475
G1 F9509.858
G1 X151.463 Y123.463 E.02279
G1 X150.937 Y123.82 E.01961
; LINE_WIDTH: 0.439709
G1 F9072.838
G1 X150.845 Y123.868 E.00335
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.753 Y123.916 E.00368
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.661 Y123.964 E.00401
; LINE_WIDTH: 0.558022
G1 F6988.917
G1 X150.569 Y124.012 E.00435
G1 X150.675 Y124.031 E.00452
; LINE_WIDTH: 0.518584
G1 F7568.371
G1 X150.781 Y124.051 E.00417
; LINE_WIDTH: 0.479147
G1 F8252.598
G1 X150.887 Y124.071 E.00383
; LINE_WIDTH: 0.420912
G1 F9524.028
G1 X150.993 Y124.091 E.00331
G1 X152.091 Y124.091 E.03382
G1 X152.091 Y122.993 E.03382
; LINE_WIDTH: 0.439707
G1 F9072.895
G1 X152.074 Y122.902 E.00299
; LINE_WIDTH: 0.479139
G1 F8252.74
G1 X152.057 Y122.811 E.00329
; LINE_WIDTH: 0.518572
G1 F7568.57
G1 X152.04 Y122.72 E.00359
; LINE_WIDTH: 0.558004
G1 F6989.155
G1 X152.023 Y122.628 E.00389
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.529182
G1 F7403.421
M204 S6000
G1 X152.047 Y105.494 E.00968
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X152.069 Y105.251 E.00881
; LINE_WIDTH: 0.422177
G1 F9492.255
G1 X152.091 Y105.007 E.00755
G1 X152.091 Y103.909 E.03393
G1 X150.993 Y103.909 E.03393
; LINE_WIDTH: 0.441832
G1 F9024.554
G1 X150.749 Y103.931 E.00794
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.506 Y103.953 E.00881
; LINE_WIDTH: 0.529199
G1 F7403.169
G1 X150.263 Y103.975 E.00968
G1 X150.487 Y104.043 E.0093
; LINE_WIDTH: 0.485515
G1 F8133.847
G1 X150.712 Y104.112 E.00847
; LINE_WIDTH: 0.423395
G1 F9461.87
G1 X150.937 Y104.18 E.00728
G1 X151.463 Y104.538 E.01971
G1 X151.82 Y105.063 E.01971
; LINE_WIDTH: 0.441829
G1 F9024.63
G1 X151.882 Y105.269 E.00698
; LINE_WIDTH: 0.485505
G1 F8134.03
G1 X151.945 Y105.474 E.00775
; LINE_WIDTH: 0.529182
G1 F7403.421
G1 X152.008 Y105.68 E.00851
M204 S10000
G1 X152.025 Y105.737 F42000
; LINE_WIDTH: 0.551217
G1 F7082.478
M204 S6000
G1 X152.014 Y122.51 E.6947
M204 S10000
G1 X151.745 Y104.239 F42000
; LINE_WIDTH: 0.40162
G1 F10036.242
M204 S6000
G1 X151.678 Y104.277 E.00227
G1 X151.732 Y104.309 E.00183
M204 S10000
G1 X152.468 Y104.277 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y103.532 E.02289
G1 X131.532 Y103.532 E.64326
G1 X131.532 Y124.468 E.64326
G1 X152.468 Y124.468 E.64326
G1 X152.468 Y104.337 E.61853
M204 S10000
G1 X152.845 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y103.155 E.03448
G1 X131.155 Y103.155 E.66644
G1 X131.155 Y124.845 E.66644
G1 X152.845 Y124.845 E.66644
G1 X152.845 Y104.337 E.63012
M204 S10000
G1 X153.222 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y102.778 E.04606
G1 X130.778 Y102.778 E.68961
G1 X130.778 Y125.222 E.68961
G1 X153.222 Y125.222 E.68961
G1 X153.222 Y104.337 E.6417
M204 S10000
G1 X153.599 Y104.277 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y102.401 E.05765
G1 X130.401 Y102.401 E.71278
G1 X130.401 Y125.599 E.71278
G1 X153.599 Y125.599 E.71278
G1 X153.599 Y104.337 E.65329
; OBJECT_ID: 66
; WIPE_START
G1 X153.599 Y106.337 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X152.402 Y113.875 Z1.8 F42000
G1 X149.21 Y133.991 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X150.009 Y133.991 E.02651
G1 X150.009 Y150.009 E.53136
G1 X133.991 Y150.009 E.53136
G1 X133.991 Y133.991 E.53136
G1 X149.15 Y133.991 E.50286
M204 S10000
G1 X149.21 Y134.398 F42000
G1 F6000
M204 S6000
G1 X149.602 Y134.398 E.01301
G1 X149.602 Y149.602 E.50435
G1 X134.398 Y149.602 E.50435
G1 X134.398 Y134.398 E.50435
G1 X149.15 Y134.398 E.48935
M204 S250
G1 X149.21 Y134.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.223 Y144.138 Z1.8 F42000
G1 X153.991 Y153.991 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.009 Y153.991 E.79552
G1 X130.009 Y130.009 E.79552
G1 X153.991 Y130.009 E.79552
G1 X153.991 Y153.931 E.79353
M204 S10000
G1 X154.398 Y154.398 F42000
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.847 Y148.919 Z1.8 F42000
G1 X133.476 Y132.014 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X133.787 Y132 E.01417
G1 X150.153 Y132 E.74463
M204 S10000
G1 X132.333 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X132 Y133.787 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X132.058 Y133.619 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X132.115 Y133.45 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X132.173 Y133.282 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X132.23 Y133.113 E.00551
G1 X132.587 Y132.587 E.01968
G1 X133.113 Y132.23 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X133.186 Y132.187 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.259 Y132.143 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.331 Y132.1 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.404 Y132.057 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X133.476 Y132.014 E.00389
G1 X133.39 Y131.993 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X133.304 Y131.972 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X133.219 Y131.951 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X133.133 Y131.93 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X133.047 Y131.909 E.00272
G1 X131.909 Y131.909 E.03502
G1 X131.909 Y133.047 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X131.93 Y133.217 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X131.951 Y133.387 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X131.972 Y133.558 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X131.993 Y133.728 E.00748
M204 S10000
G1 X133.599 Y150.213 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.599 Y133.787 E.50469
G1 X133.654 Y133.654 E.00443
G1 X133.787 Y133.599 E.00443
G1 X150.213 Y133.599 E.50469
G1 X150.346 Y133.654 E.00443
G1 X150.401 Y133.787 E.00443
G1 X150.401 Y150.213 E.50469
G1 X150.346 Y150.346 E.00443
G1 X150.213 Y150.401 E.00443
G1 X133.787 Y150.401 E.50469
G1 X133.654 Y150.346 E.00443
G1 X133.622 Y150.268 E.00259
M204 S10000
G1 X133.222 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X133.222 Y133.787 E.50469
G3 X133.387 Y133.387 I.566 J0 E.01365
G1 X133.69 Y133.23 E.01047
G1 X133.787 Y133.222 E.00301
G1 X150.213 Y133.222 E.50469
G3 X150.778 Y133.787 I0 J.566 E.0273
G1 X150.778 Y150.213 E.50469
G3 X150.613 Y150.613 I-.566 J0 E.01365
G1 X150.31 Y150.77 E.01047
G1 X150.213 Y150.778 E.00301
G1 X133.787 Y150.778 E.50469
G3 X133.387 Y150.613 I0 J-.566 E.01365
G1 X133.23 Y150.31 E.01047
G1 X133.227 Y150.272 E.00117
M204 S10000
G1 X132.845 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.845 Y133.787 E.50469
G1 X132.922 Y133.413 E.01175
G1 X133.121 Y133.121 E.01085
G1 X133.413 Y132.922 E.01085
G1 X133.787 Y132.845 E.01175
G1 X150.213 Y132.845 E.50469
G1 X150.587 Y132.922 E.01175
G1 X150.879 Y133.121 E.01085
G1 X151.078 Y133.413 E.01085
G1 X151.155 Y133.787 E.01175
G1 X151.155 Y150.213 E.50469
G1 X151.078 Y150.587 E.01175
G1 X150.879 Y150.879 E.01085
G1 X150.587 Y151.078 E.01085
G1 X150.213 Y151.155 E.01175
G1 X133.787 Y151.155 E.50469
G1 X133.413 Y151.078 E.01175
G1 X133.121 Y150.879 E.01085
G1 X132.922 Y150.587 E.01085
G1 X132.857 Y150.271 E.0099
M204 S10000
G1 X132.468 Y150.213 F42000
G1 F9547.299
M204 S6000
G1 X132.468 Y133.787 E.50469
G1 X132.576 Y133.263 E.01645
G1 X132.854 Y132.854 E.0152
G1 X133.263 Y132.576 E.0152
G3 X133.787 Y132.468 I.524 J1.211 E.01656
G1 X150.213 Y132.468 E.50469
G1 X150.737 Y132.576 E.01645
G1 X151.146 Y132.854 E.0152
G1 X151.424 Y133.263 E.0152
G1 X151.532 Y133.787 E.01645
G1 X151.532 Y150.213 E.50469
G3 X151.424 Y150.737 I-1.32 J0 E.01656
G1 X151.146 Y151.146 E.0152
G1 X150.737 Y151.424 E.0152
G3 X150.213 Y151.532 I-.524 J-1.211 E.01656
G1 X133.787 Y151.532 E.50469
G1 X133.263 Y151.424 E.01645
G1 X132.854 Y151.146 E.0152
G1 X132.576 Y150.737 E.0152
G3 X132.473 Y150.272 I1.069 J-.482 E.01472
M204 S10000
G1 X132.014 Y150.524 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X132 Y150.213 E.01417
G1 X132 Y133.847 E.74463
M204 S10000
G1 X132.333 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X132.325 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X133.787 Y152 F42000
; LINE_WIDTH: 0.578409
G1 F6722.831
M204 S6000
G1 X133.619 Y151.942 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.45 Y151.885 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.282 Y151.827 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X133.113 Y151.77 E.00551
G1 X132.587 Y151.413 E.01968
G1 X132.23 Y150.887 E.01968
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X132.187 Y150.814 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X132.143 Y150.741 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X132.1 Y150.669 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X132.057 Y150.596 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X132.014 Y150.524 E.00389
G1 X131.993 Y150.61 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X131.972 Y150.695 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X131.951 Y150.781 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X131.93 Y150.867 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X131.909 Y150.953 E.00272
G1 X131.909 Y152.091 E.03502
G1 X133.047 Y152.091 E.03502
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X133.217 Y152.07 E.00558
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X133.387 Y152.049 E.00622
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X133.558 Y152.028 E.00685
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X133.728 Y152.007 E.00748
M204 S10000
G1 X150.524 Y151.986 F42000
; LINE_WIDTH: 0.601293
G1 F6447.305
M204 S6000
G1 X150.213 Y152 E.01417
G1 X133.847 Y152 E.74463
M204 S10000
G1 X151.719 Y151.648 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y151.739 I-.026 J.043 E.00696
M204 S10000
G1 X151.986 Y150.524 F42000
; LINE_WIDTH: 0.607289
G1 F6378.806
M204 S6000
G1 X151.872 Y150.702 E.00973
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X151.757 Y150.879 E.00901
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X151.642 Y151.057 E.00829
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X151.527 Y151.235 E.00758
; LINE_WIDTH: 0.425186
G1 F9417.527
G1 X151.413 Y151.413 E.00659
G1 X150.887 Y151.77 E.01981
; LINE_WIDTH: 0.440803
G1 F9047.885
G1 X150.814 Y151.813 E.00274
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.741 Y151.857 E.00303
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.669 Y151.9 E.00331
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.596 Y151.943 E.0036
; LINE_WIDTH: 0.607307
G1 F6378.602
G1 X150.524 Y151.986 E.00389
G1 X150.61 Y152.007 E.00406
; LINE_WIDTH: 0.565681
G1 F6886.513
G1 X150.695 Y152.028 E.00376
; LINE_WIDTH: 0.524055
G1 F7482.308
G1 X150.781 Y152.049 E.00346
; LINE_WIDTH: 0.482429
G1 F8190.958
G1 X150.867 Y152.07 E.00316
; LINE_WIDTH: 0.420768
G1 F9527.645
G1 X150.953 Y152.091 E.00272
G1 X152.091 Y152.091 E.03502
G1 X152.091 Y150.953 E.03502
; LINE_WIDTH: 0.440801
G1 F9047.931
G1 X152.073 Y150.879 E.00247
; LINE_WIDTH: 0.482423
G1 F8191.07
G1 X152.055 Y150.805 E.00273
; LINE_WIDTH: 0.524045
G1 F7482.463
G1 X152.037 Y150.73 E.00299
; LINE_WIDTH: 0.565667
G1 F6886.697
G1 X152.019 Y150.656 E.00325
; LINE_WIDTH: 0.607289
G1 F6378.806
G1 X152.001 Y150.582 E.00351
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.578392
G1 F6723.05
M204 S6000
G1 X152.023 Y133.602 E.00814
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X152.045 Y133.417 E.00745
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X152.068 Y133.232 E.00676
; LINE_WIDTH: 0.421705
G1 F9504.091
G1 X152.091 Y133.047 E.00576
G1 X152.091 Y131.909 E.03511
G1 X150.953 Y131.909 E.03511
; LINE_WIDTH: 0.442622
G1 F9006.727
G1 X150.768 Y131.932 E.00607
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.583 Y131.955 E.00676
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.398 Y131.977 E.00745
; LINE_WIDTH: 0.578409
G1 F6722.831
G1 X150.213 Y132 E.00814
G1 X150.381 Y132.058 E.00777
; LINE_WIDTH: 0.533147
G1 F7343.548
G1 X150.55 Y132.115 E.00711
; LINE_WIDTH: 0.487884
G1 F8090.547
G1 X150.718 Y132.173 E.00646
; LINE_WIDTH: 0.42277
G1 F9477.444
G1 X150.887 Y132.23 E.00551
G1 X151.413 Y132.587 E.01968
G1 X151.77 Y133.113 E.01968
; LINE_WIDTH: 0.442619
G1 F9006.783
G1 X151.823 Y133.268 E.00531
; LINE_WIDTH: 0.487877
G1 F8090.683
G1 X151.875 Y133.422 E.00591
; LINE_WIDTH: 0.533134
G1 F7343.735
G1 X151.928 Y133.576 E.00651
; LINE_WIDTH: 0.578392
G1 F6723.05
G1 X151.981 Y133.731 E.00711
M204 S10000
G1 X152 Y133.787 F42000
; LINE_WIDTH: 0.601224
G1 F6448.099
M204 S6000
G1 X151.989 Y150.464 E.7587
M204 S10000
G1 X151.719 Y132.261 F42000
; LINE_WIDTH: 0.4602
G1 F8627.3
M204 S6000
G2 X151.712 Y132.352 I-.026 J.043 E.00696
M204 S10000
G1 X152.468 Y132.307 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X152.468 Y131.532 E.02379
G1 X131.532 Y131.532 E.64326
G1 X131.532 Y152.468 E.64326
G1 X152.468 Y152.468 E.64326
G1 X152.468 Y132.367 E.61763
M204 S10000
G1 X152.845 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X152.845 Y131.155 E.03538
G1 X131.155 Y131.155 E.66644
G1 X131.155 Y152.845 E.66644
G1 X152.845 Y152.845 E.66644
G1 X152.845 Y132.367 E.62922
M204 S10000
G1 X153.222 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.222 Y130.778 E.04696
G1 X130.778 Y130.778 E.68961
G1 X130.778 Y153.222 E.68961
G1 X153.222 Y153.222 E.68961
G1 X153.222 Y132.367 E.6408
M204 S10000
G1 X153.599 Y132.307 F42000
G1 F9547.299
M204 S6000
G1 X153.599 Y130.401 E.05855
G1 X130.401 Y130.401 E.71278
G1 X130.401 Y153.599 E.71278
G1 X153.599 Y153.599 E.71278
G1 X153.599 Y132.367 E.65239
; OBJECT_ID: 88
; WIPE_START
G1 X153.599 Y134.367 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X146.634 Y131.244 Z1.8 F42000
G1 X121.31 Y119.891 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X122.109 Y119.891 E.02651
G1 X122.109 Y136.109 E.53799
G1 X105.891 Y136.109 E.53799
G1 X105.891 Y119.891 E.53799
G1 X121.25 Y119.891 E.50949
M204 S10000
G1 X121.31 Y120.298 F42000
G1 F6000
M204 S6000
G1 X121.702 Y120.298 E.01301
G1 X121.702 Y135.702 E.51098
G1 X106.298 Y135.702 E.51098
G1 X106.298 Y120.298 E.51098
G1 X121.25 Y120.298 E.49599
M204 S250
G1 X121.31 Y120.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.272 Y130.052 Z1.8 F42000
G1 X125.991 Y139.991 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.009 Y139.991 E.79552
G1 X102.009 Y116.009 E.79552
G1 X125.991 Y116.009 E.79552
G1 X125.991 Y139.931 E.79353
M204 S10000
G1 X126.398 Y140.398 F42000
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
M73 P40 R19
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y133.107 Z1.8 F42000
G1 X125.599 Y118.248 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X125.599 Y116.401 E.05675
G1 X102.401 Y116.401 E.71278
G1 X102.401 Y139.599 E.71278
G1 X125.599 Y139.599 E.71278
G1 X125.599 Y118.308 E.65419
M204 S10000
G1 X125.222 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X125.222 Y116.778 E.04516
G1 X102.778 Y116.778 E.68961
G1 X102.778 Y139.222 E.68961
G1 X125.222 Y139.222 E.68961
G1 X125.222 Y118.308 E.6426
M204 S10000
G1 X124.845 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.845 Y117.155 E.03358
G1 X103.155 Y117.155 E.66644
G1 X103.155 Y138.845 E.66644
G1 X124.845 Y138.845 E.66644
G1 X124.845 Y118.308 E.63102
M204 S10000
G1 X124.468 Y118.248 F42000
G1 F9547.299
M204 S6000
G1 X124.468 Y117.532 E.02199
G1 X103.532 Y117.532 E.64326
G1 X103.532 Y138.468 E.64326
G1 X124.468 Y138.468 E.64326
G1 X124.468 Y118.308 E.61943
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.518278
G1 F7573.247
M204 S6000
G1 X124.033 Y119.328 E.01395
; LINE_WIDTH: 0.567378
G1 F6864.229
G3 X124.016 Y117.985 I28.005 J-1.031 E.05741
G1 X123.032 Y117.985 E.04202
; LINE_WIDTH: 0.552798
G1 F7060.519
G1 X122.672 Y117.967 E.01497
; LINE_WIDTH: 0.529752
G1 F7394.757
G1 X122.313 Y117.95 E.01429
G1 X123.016 Y118.061 E.02826
; LINE_WIDTH: 0.57005
G1 F6829.435
G1 X123.566 Y118.434 E.02852
G1 X123.939 Y118.984 E.02852
; LINE_WIDTH: 0.552793
G1 F7060.589
G1 X123.99 Y119.306 E.01355
; LINE_WIDTH: 0.518278
G1 F7573.247
G1 X124.041 Y119.628 E.01264
M204 S10000
G1 X124.05 Y119.687 F42000
; LINE_WIDTH: 0.50121
G1 F7855.299
M204 S6000
G1 X124.039 Y136.555 E.62993
M204 S10000
G1 X124.037 Y136.615 F42000
; LINE_WIDTH: 0.559929
G1 F6963.127
M204 S6000
G1 X123.939 Y137.016 E.0174
G1 X123.566 Y137.566 E.02797
G1 X123.016 Y137.939 E.02797
G1 X122.615 Y138.037 E.0174
G3 X124.016 Y138.016 I1.269 J37.272 E.05901
G3 X124.034 Y136.675 I13.108 J-.492 E.0565
M204 S10000
G1 X122.615 Y138.037 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X122.313 Y138.05 E.01131
G1 X105.747 Y138.05 E.61872
M204 S10000
M73 P40 R18
G1 X105.687 Y138.05 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X105.335 Y137.994 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.984 Y137.939 E.01505
G1 X104.434 Y137.566 E.02805
G1 X104.061 Y137.016 E.02805
G1 X103.963 Y136.615 E.01745
G3 X103.985 Y138.016 I-37.272 J1.269 E.05916
G1 X104.968 Y138.016 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X105.298 Y138.031 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X105.627 Y138.047 E.01279
M204 S10000
G1 X105.499 Y136.313 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X105.499 Y119.687 E.51084
G1 X105.554 Y119.554 E.00443
G1 X105.687 Y119.499 E.00443
G1 X122.313 Y119.499 E.51084
G1 X122.446 Y119.554 E.00443
G1 X122.501 Y119.687 E.00443
G1 X122.501 Y136.313 E.51084
G1 X122.446 Y136.446 E.00443
G1 X122.313 Y136.501 E.00443
G1 X105.687 Y136.501 E.51084
G1 X105.554 Y136.446 E.00443
G1 X105.522 Y136.368 E.00259
M204 S10000
G1 X105.122 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X105.122 Y119.687 E.51084
G3 X105.287 Y119.287 I.566 J0 E.01365
G1 X105.59 Y119.13 E.01047
G1 X105.687 Y119.122 E.00301
G1 X122.313 Y119.122 E.51084
G3 X122.878 Y119.687 I0 J.566 E.0273
G1 X122.878 Y136.313 E.51084
G3 X122.713 Y136.713 I-.566 J0 E.01365
G1 X122.41 Y136.87 E.01047
G1 X122.313 Y136.878 E.00301
G1 X105.687 Y136.878 E.51084
G3 X105.287 Y136.713 I0 J-.566 E.01365
G1 X105.13 Y136.41 E.01047
G1 X105.127 Y136.372 E.00117
M204 S10000
G1 X104.745 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.745 Y119.687 E.51084
G1 X104.822 Y119.313 E.01175
G1 X105.021 Y119.021 E.01085
G1 X105.313 Y118.822 E.01085
G1 X105.687 Y118.745 E.01175
G1 X122.313 Y118.745 E.51084
G1 X122.687 Y118.822 E.01175
G1 X122.979 Y119.021 E.01085
G1 X123.178 Y119.313 E.01085
G1 X123.255 Y119.687 E.01175
G1 X123.255 Y136.313 E.51084
G1 X123.178 Y136.687 E.01175
G1 X122.979 Y136.979 E.01085
G1 X122.687 Y137.178 E.01085
G1 X122.313 Y137.255 E.01175
G1 X105.687 Y137.255 E.51084
G1 X105.313 Y137.178 E.01175
G1 X105.021 Y136.979 E.01085
G1 X104.822 Y136.687 E.01085
G1 X104.757 Y136.371 E.0099
M204 S10000
G1 X104.368 Y136.313 F42000
G1 F9547.299
M204 S6000
G1 X104.368 Y119.687 E.51084
G1 X104.476 Y119.163 E.01645
G1 X104.754 Y118.754 E.0152
G1 X105.163 Y118.476 E.0152
G3 X105.687 Y118.368 I.524 J1.211 E.01656
G1 X122.313 Y118.368 E.51084
G1 X122.837 Y118.476 E.01645
G1 X123.246 Y118.754 E.0152
G1 X123.524 Y119.163 E.0152
G1 X123.632 Y119.687 E.01645
G1 X123.632 Y136.313 E.51084
G3 X123.524 Y136.837 I-1.319 J0 E.01656
G1 X123.246 Y137.246 E.0152
G1 X122.837 Y137.524 E.0152
G3 X122.313 Y137.632 I-.524 J-1.211 E.01656
G1 X105.687 Y137.632 E.51084
G1 X105.163 Y137.524 E.01645
G1 X104.754 Y137.246 E.0152
G1 X104.476 Y136.837 E.0152
G3 X104.373 Y136.372 I1.069 J-.482 E.01472
M204 S10000
G1 X103.963 Y136.615 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X103.95 Y136.313 E.01131
G1 X103.95 Y119.747 E.61872
M204 S10000
G1 X103.95 Y119.687 F42000
; LINE_WIDTH: 0.518295
G1 F7572.969
M204 S6000
G1 X104.006 Y119.335 E.0138
; LINE_WIDTH: 0.561303
G1 F6944.676
G1 X104.061 Y118.984 E.01505
G1 X104.434 Y118.434 E.02805
G1 X104.984 Y118.061 E.02805
G1 X105.385 Y117.963 E.01745
G3 X103.985 Y117.985 I-1.269 J-37.272 E.05916
G1 X103.985 Y118.968 E.04153
; LINE_WIDTH: 0.552805
G1 F7060.416
G1 X103.969 Y119.298 E.01372
; LINE_WIDTH: 0.518295
G1 F7572.969
G1 X103.953 Y119.627 E.01279
M204 S10000
G1 X105.385 Y117.963 F42000
; LINE_WIDTH: 0.501277
G1 F7854.154
M204 S6000
G1 X105.687 Y117.95 E.01131
G1 X122.253 Y117.95 E.61872
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7854.154
G1 X120.253 Y117.95 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 8/53
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S153
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I.439 J1.135 P1  F42000
G1 X149.26 Y106.74 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.26 Y121.26 E.44616
G1 X134.74 Y121.26 E.44616
G1 X134.74 Y106.74 E.44616
G1 X149.2 Y106.74 E.44432
; WIPE_START
M204 S6000
G1 X149.208 Y108.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.463 Y116.032 Z2 F42000
G1 X154.79 Y126.79 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 8 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer8 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X154.35 Y125.914 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X153.914 Y126.35 E.01894
G1 X153.38 Y126.35
G1 X154.35 Y125.38 E.04211
G1 X154.35 Y124.847
G1 X152.847 Y126.35 E.06529
G1 X152.314 Y126.35
G1 X154.35 Y124.314 E.08846
G1 X154.35 Y123.781
G1 X151.781 Y126.35 E.11163
G1 X151.247 Y126.35
G1 X154.35 Y123.247 E.1348
G1 X154.35 Y122.714
G1 X150.714 Y126.35 E.15798
G1 X150.181 Y126.35
G1 X154.35 Y122.181 E.18115
G1 X154.35 Y121.648
G1 X149.648 Y126.35 E.20432
G1 X149.114 Y126.35
G1 X154.35 Y121.114 E.22749
G1 X154.35 Y120.581
G1 X148.581 Y126.35 E.25067
G1 X148.048 Y126.35
G1 X154.35 Y120.048 E.27384
G1 X154.35 Y119.515
G1 X147.515 Y126.35 E.29701
G1 X146.981 Y126.35
G1 X154.35 Y118.981 E.32019
G1 X154.35 Y118.448
G1 X146.448 Y126.35 E.34336
G1 X145.915 Y126.35
G1 X154.35 Y117.915 E.36653
G1 X154.35 Y117.382
G1 X145.382 Y126.35 E.3897
G1 X144.848 Y126.35
G1 X154.35 Y116.848 E.41288
G1 X154.35 Y116.315
G1 X149.467 Y121.197 E.21215
G1 X149.467 Y120.664
G1 X154.35 Y115.782 E.21215
G1 X154.35 Y115.248
G1 X149.467 Y120.131 E.21215
G1 X149.467 Y119.597
G1 X154.35 Y114.715 E.21215
G1 X154.35 Y114.182
G1 X149.467 Y119.064 E.21215
G1 X149.467 Y118.531
G1 X154.35 Y113.649 E.21215
G1 X154.35 Y113.115
G1 X149.467 Y117.998 E.21215
M73 P41 R18
G1 X149.467 Y117.464
G1 X154.35 Y112.582 E.21215
G1 X154.35 Y112.049
G1 X149.467 Y116.931 E.21215
G1 X149.467 Y116.398
G1 X154.35 Y111.516 E.21215
G1 X154.35 Y110.982
G1 X149.467 Y115.865 E.21215
G1 X149.467 Y115.331
G1 X154.35 Y110.449 E.21215
G1 X154.35 Y109.916
G1 X149.467 Y114.798 E.21215
G1 X149.467 Y114.265
G1 X154.35 Y109.383 E.21215
G1 X154.35 Y108.849
G1 X149.467 Y113.732 E.21215
G1 X149.467 Y113.198
G1 X154.35 Y108.316 E.21215
G1 X154.35 Y107.783
G1 X149.467 Y112.665 E.21215
G1 X149.467 Y112.132
G1 X154.35 Y107.25 E.21215
G1 X154.35 Y106.716
G1 X149.467 Y111.599 E.21215
G1 X149.467 Y111.065
G1 X154.35 Y106.183 E.21215
G1 X154.35 Y105.65
G1 X149.467 Y110.532 E.21215
G1 X149.467 Y109.999
G1 X154.35 Y105.117 E.21215
G1 X154.35 Y104.583
G1 X149.467 Y109.465 E.21215
G1 X149.467 Y108.932
G1 X154.35 Y104.05 E.21215
G1 X154.35 Y103.517
G1 X149.467 Y108.399 E.21215
G1 X149.467 Y107.866
G1 X154.35 Y102.984 E.21215
G1 X154.35 Y102.45
G1 X149.467 Y107.332 E.21215
G1 X149.467 Y106.799
G1 X154.35 Y101.917 E.21215
G1 X154.083 Y101.65
G1 X149.201 Y106.533 E.21215
G1 X148.667 Y106.533
G1 X153.55 Y101.65 E.21215
G1 X153.016 Y101.65
G1 X148.134 Y106.533 E.21215
G1 X147.601 Y106.533
G1 X152.483 Y101.65 E.21215
G1 X151.95 Y101.65
G1 X147.068 Y106.533 E.21215
G1 X146.534 Y106.533
G1 X151.417 Y101.65 E.21215
G1 X150.883 Y101.65
G1 X146.001 Y106.533 E.21215
G1 X145.468 Y106.533
G1 X150.35 Y101.65 E.21215
G1 X149.817 Y101.65
G1 X144.935 Y106.533 E.21215
G1 X144.401 Y106.533
G1 X149.284 Y101.65 E.21215
G1 X148.75 Y101.65
G1 X143.868 Y106.533 E.21215
G1 X143.335 Y106.533
G1 X148.217 Y101.65 E.21215
G1 X147.684 Y101.65
G1 X142.802 Y106.533 E.21215
G1 X142.268 Y106.533
G1 X147.15 Y101.65 E.21215
G1 X146.617 Y101.65
G1 X141.735 Y106.533 E.21215
G1 X141.202 Y106.533
G1 X146.084 Y101.65 E.21215
G1 X145.551 Y101.65
G1 X140.669 Y106.533 E.21215
G1 X140.135 Y106.533
G1 X145.017 Y101.65 E.21215
G1 X144.484 Y101.65
G1 X139.602 Y106.533 E.21215
G1 X139.069 Y106.533
G1 X143.951 Y101.65 E.21215
G1 X143.418 Y101.65
G1 X138.536 Y106.533 E.21215
G1 X138.002 Y106.533
G1 X142.884 Y101.65 E.21215
G1 X142.351 Y101.65
G1 X137.469 Y106.533 E.21215
G1 X136.936 Y106.533
G1 X141.818 Y101.65 E.21215
G1 X141.285 Y101.65
G1 X136.403 Y106.533 E.21215
G1 X135.869 Y106.533
G1 X140.751 Y101.65 E.21215
G1 X140.218 Y101.65
G1 X135.336 Y106.533 E.21215
G1 X134.803 Y106.533
G1 X139.685 Y101.65 E.21215
; WIPE_START
M204 S6000
G1 X138.271 Y103.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.167 Y109.628 Z2 F42000
G1 X149.197 Y121.467 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X144.315 Y126.35 E.21215
G1 X143.782 Y126.35
G1 X148.664 Y121.467 E.21215
G1 X148.131 Y121.467
G1 X143.248 Y126.35 E.21215
G1 X142.715 Y126.35
G1 X147.597 Y121.467 E.21215
G1 X147.064 Y121.467
G1 X142.182 Y126.35 E.21215
G1 X141.649 Y126.35
G1 X146.531 Y121.467 E.21215
G1 X145.998 Y121.467
G1 X141.115 Y126.35 E.21215
G1 X140.582 Y126.35
G1 X145.464 Y121.467 E.21215
G1 X144.931 Y121.467
G1 X140.049 Y126.35 E.21215
G1 X139.516 Y126.35
G1 X144.398 Y121.467 E.21215
G1 X143.865 Y121.467
G1 X138.982 Y126.35 E.21215
G1 X138.449 Y126.35
G1 X143.331 Y121.467 E.21215
G1 X142.798 Y121.467
G1 X137.916 Y126.35 E.21215
G1 X137.383 Y126.35
G1 X142.265 Y121.467 E.21215
G1 X141.732 Y121.467
G1 X136.849 Y126.35 E.21215
G1 X136.316 Y126.35
G1 X141.198 Y121.467 E.21215
G1 X140.665 Y121.467
G1 X135.783 Y126.35 E.21215
G1 X135.25 Y126.35
G1 X140.132 Y121.467 E.21215
G1 X139.598 Y121.467
G1 X134.716 Y126.35 E.21215
G1 X134.183 Y126.35
G1 X139.065 Y121.467 E.21215
G1 X138.532 Y121.467
G1 X133.65 Y126.35 E.21215
G1 X133.117 Y126.35
G1 X137.999 Y121.467 E.21215
G1 X137.465 Y121.467
G1 X132.583 Y126.35 E.21215
G1 X132.05 Y126.35
G1 X136.932 Y121.467 E.21215
G1 X136.399 Y121.467
G1 X131.517 Y126.35 E.21215
G1 X130.984 Y126.35
G1 X135.866 Y121.467 E.21215
G1 X135.332 Y121.467
G1 X130.45 Y126.35 E.21215
G1 X129.917 Y126.35
G1 X134.799 Y121.467 E.21215
G1 X134.533 Y121.201
G1 X129.65 Y126.083 E.21215
G1 X129.65 Y125.55
G1 X134.533 Y120.667 E.21215
G1 X134.533 Y120.134
G1 X129.65 Y125.016 E.21215
G1 X129.65 Y124.483
G1 X134.533 Y119.601 E.21215
G1 X134.533 Y119.068
G1 X129.65 Y123.95 E.21215
G1 X129.65 Y123.417
G1 X134.533 Y118.534 E.21215
G1 X134.533 Y118.001
G1 X129.65 Y122.883 E.21215
G1 X129.65 Y122.35
G1 X134.533 Y117.468 E.21215
G1 X134.533 Y116.935
G1 X129.65 Y121.817 E.21215
G1 X129.65 Y121.284
G1 X134.533 Y116.401 E.21215
G1 X134.533 Y115.868
G1 X129.65 Y120.75 E.21215
G1 X129.65 Y120.217
G1 X134.533 Y115.335 E.21215
G1 X134.533 Y114.802
G1 X129.65 Y119.684 E.21215
G1 X129.65 Y119.15
G1 X134.533 Y114.268 E.21215
G1 X134.533 Y113.735
G1 X129.65 Y118.617 E.21215
G1 X129.65 Y118.084
G1 X134.533 Y113.202 E.21215
G1 X134.533 Y112.669
G1 X129.65 Y117.551 E.21215
G1 X129.65 Y117.017
G1 X134.533 Y112.135 E.21215
G1 X134.533 Y111.602
G1 X129.65 Y116.484 E.21215
G1 X129.65 Y115.951
G1 X134.533 Y111.069 E.21215
G1 X134.533 Y110.536
G1 X129.65 Y115.418 E.21215
G1 X129.65 Y114.884
G1 X134.533 Y110.002 E.21215
G1 X134.533 Y109.469
G1 X129.65 Y114.351 E.21215
G1 X129.65 Y113.818
G1 X134.533 Y108.936 E.21215
G1 X134.533 Y108.403
G1 X129.65 Y113.285 E.21215
G1 X129.65 Y112.751
G1 X134.533 Y107.869 E.21215
G1 X134.533 Y107.336
M73 P42 R18
G1 X129.65 Y112.218 E.21215
G1 X129.65 Y111.685
G1 X134.533 Y106.803 E.21215
; WIPE_START
M204 S6000
G1 X133.118 Y108.217 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.65 Y111.152 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X139.152 Y101.65 E.41287
G1 X138.618 Y101.65
G1 X129.65 Y110.618 E.3897
G1 X129.65 Y110.085
G1 X138.085 Y101.65 E.36653
G1 X137.552 Y101.65
G1 X129.65 Y109.552 E.34335
G1 X129.65 Y109.019
G1 X137.019 Y101.65 E.32018
G1 X136.485 Y101.65
G1 X129.65 Y108.485 E.29701
G1 X129.65 Y107.952
G1 X135.952 Y101.65 E.27383
G1 X135.419 Y101.65
G1 X129.65 Y107.419 E.25066
G1 X129.65 Y106.886
G1 X134.886 Y101.65 E.22749
G1 X134.352 Y101.65
G1 X129.65 Y106.352 E.20432
G1 X129.65 Y105.819
G1 X133.819 Y101.65 E.18114
G1 X133.286 Y101.65
G1 X129.65 Y105.286 E.15797
G1 X129.65 Y104.753
G1 X132.753 Y101.65 E.1348
G1 X132.219 Y101.65
G1 X129.65 Y104.219 E.11163
G1 X129.65 Y103.686
G1 X131.686 Y101.65 E.08845
G1 X131.153 Y101.65
G1 X129.65 Y103.153 E.06528
G1 X129.65 Y102.62
G1 X130.619 Y101.65 E.04211
G1 X130.086 Y101.65
G1 X129.65 Y102.086 E.01894
M204 S10000
G1 X129.515 Y102.086 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261059
G1 F15000
M204 S6000
G1 X129.515 Y101.624 E.00822
G1 X129.534 Y101.534 E.00164
G1 X129.624 Y101.515 E.00164
G1 X154.376 Y101.515 E.43998
G1 X154.466 Y101.534 E.00164
G1 X154.485 Y101.624 E.00164
G1 X154.485 Y126.376 E.43998
G1 X154.466 Y126.466 E.00164
G1 X154.376 Y126.485 E.00164
G1 X129.624 Y126.485 E.43998
G1 X129.534 Y126.466 E.00164
G1 X129.515 Y126.376 E.00164
G1 X129.515 Y102.146 E.4307
; OBJECT_ID: 66
; WIPE_START
G1 X129.515 Y101.624 E-.19844
G1 X129.534 Y101.534 E-.03504
G1 X129.624 Y101.515 E-.03504
G1 X130.917 Y101.515 E-.49147
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.594 Y108.203 Z2 F42000
G1 X149.21 Y134.79 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X149.21 Y149.21 E.44309
G1 X134.79 Y149.21 E.44309
G1 X134.79 Y134.79 E.44309
G1 X149.15 Y134.79 E.44124
; WIPE_START
M204 S6000
G1 X149.158 Y136.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.437 Y144.074 Z2 F42000
G1 X154.79 Y154.79 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.35 Y153.914 F42000
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X153.914 Y154.35 E.01894
G1 X153.38 Y154.35
G1 X154.35 Y153.38 E.04211
G1 X154.35 Y152.847
G1 X152.847 Y154.35 E.06529
G1 X152.314 Y154.35
G1 X154.35 Y152.314 E.08846
G1 X154.35 Y151.781
G1 X151.781 Y154.35 E.11163
G1 X151.247 Y154.35
G1 X154.35 Y151.247 E.1348
G1 X154.35 Y150.714
G1 X150.714 Y154.35 E.15798
G1 X150.181 Y154.35
G1 X154.35 Y150.181 E.18115
G1 X154.35 Y149.648
G1 X149.648 Y154.35 E.20432
G1 X149.114 Y154.35
G1 X154.35 Y149.114 E.22749
G1 X154.35 Y148.581
G1 X148.581 Y154.35 E.25067
G1 X148.048 Y154.35
G1 X154.35 Y148.048 E.27384
G1 X154.35 Y147.515
G1 X147.515 Y154.35 E.29701
G1 X146.981 Y154.35
G1 X154.35 Y146.981 E.32019
G1 X154.35 Y146.448
G1 X146.448 Y154.35 E.34336
G1 X145.915 Y154.35
G1 X154.35 Y145.915 E.36653
G1 X154.35 Y145.382
G1 X145.382 Y154.35 E.3897
G1 X144.848 Y154.35
G1 X154.35 Y144.848 E.41288
G1 X154.35 Y144.315
G1 X149.417 Y149.247 E.21432
G1 X149.417 Y148.714
G1 X154.35 Y143.782 E.21432
G1 X154.35 Y143.248
G1 X149.417 Y148.181 E.21432
G1 X149.417 Y147.647
G1 X154.35 Y142.715 E.21432
G1 X154.35 Y142.182
G1 X149.417 Y147.114 E.21432
G1 X149.417 Y146.581
G1 X154.35 Y141.649 E.21432
G1 X154.35 Y141.115
G1 X149.417 Y146.048 E.21432
G1 X149.417 Y145.514
G1 X154.35 Y140.582 E.21432
G1 X154.35 Y140.049
G1 X149.417 Y144.981 E.21432
G1 X149.417 Y144.448
G1 X154.35 Y139.516 E.21432
G1 X154.35 Y138.982
G1 X149.417 Y143.915 E.21432
G1 X149.417 Y143.381
G1 X154.35 Y138.449 E.21432
G1 X154.35 Y137.916
G1 X149.417 Y142.848 E.21432
G1 X149.417 Y142.315
G1 X154.35 Y137.383 E.21432
G1 X154.35 Y136.849
G1 X149.417 Y141.782 E.21432
G1 X149.417 Y141.248
G1 X154.35 Y136.316 E.21432
G1 X154.35 Y135.783
G1 X149.417 Y140.715 E.21432
G1 X149.417 Y140.182
G1 X154.35 Y135.25 E.21432
G1 X154.35 Y134.716
G1 X149.417 Y139.648 E.21432
G1 X149.417 Y139.115
G1 X154.35 Y134.183 E.21432
G1 X154.35 Y133.65
G1 X149.417 Y138.582 E.21432
G1 X149.417 Y138.049
G1 X154.35 Y133.117 E.21432
G1 X154.35 Y132.583
G1 X149.417 Y137.515 E.21432
G1 X149.417 Y136.982
G1 X154.35 Y132.05 E.21432
G1 X154.35 Y131.517
G1 X149.417 Y136.449 E.21432
G1 X149.417 Y135.916
G1 X154.35 Y130.984 E.21432
G1 X154.35 Y130.45
G1 X149.417 Y135.382 E.21432
G1 X149.417 Y134.849
G1 X154.35 Y129.917 E.21432
G1 X154.083 Y129.65
G1 X149.151 Y134.583 E.21432
G1 X148.617 Y134.583
G1 X153.55 Y129.65 E.21432
G1 X153.016 Y129.65
G1 X148.084 Y134.583 E.21432
G1 X147.551 Y134.583
G1 X152.483 Y129.65 E.21432
G1 X151.95 Y129.65
G1 X147.018 Y134.583 E.21432
G1 X146.484 Y134.583
G1 X151.417 Y129.65 E.21432
G1 X150.883 Y129.65
G1 X145.951 Y134.583 E.21432
G1 X145.418 Y134.583
G1 X150.35 Y129.65 E.21432
G1 X149.817 Y129.65
G1 X144.885 Y134.583 E.21432
G1 X144.351 Y134.583
G1 X149.284 Y129.65 E.21432
G1 X148.75 Y129.65
G1 X143.818 Y134.583 E.21432
G1 X143.285 Y134.583
G1 X148.217 Y129.65 E.21432
G1 X147.684 Y129.65
G1 X142.752 Y134.583 E.21432
G1 X142.218 Y134.583
G1 X147.15 Y129.65 E.21432
G1 X146.617 Y129.65
G1 X141.685 Y134.583 E.21432
G1 X141.152 Y134.583
G1 X146.084 Y129.65 E.21432
G1 X145.551 Y129.65
G1 X140.619 Y134.583 E.21432
G1 X140.085 Y134.583
G1 X145.017 Y129.65 E.21432
G1 X144.484 Y129.65
G1 X139.552 Y134.583 E.21432
G1 X139.019 Y134.583
G1 X143.951 Y129.65 E.21432
M73 P43 R18
G1 X143.418 Y129.65
G1 X138.486 Y134.583 E.21432
G1 X137.952 Y134.583
G1 X142.884 Y129.65 E.21432
G1 X142.351 Y129.65
G1 X137.419 Y134.583 E.21432
G1 X136.886 Y134.583
G1 X141.818 Y129.65 E.21432
G1 X141.285 Y129.65
G1 X136.353 Y134.583 E.21432
G1 X135.819 Y134.583
G1 X140.751 Y129.65 E.21432
G1 X140.218 Y129.65
G1 X135.286 Y134.583 E.21432
G1 X134.753 Y134.583
G1 X139.685 Y129.65 E.21432
; WIPE_START
M204 S6000
G1 X138.271 Y131.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.188 Y137.615 Z2 F42000
G1 X149.247 Y149.417 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X144.315 Y154.35 E.21432
G1 X143.782 Y154.35
G1 X148.714 Y149.417 E.21432
G1 X148.181 Y149.417
G1 X143.248 Y154.35 E.21432
G1 X142.715 Y154.35
G1 X147.647 Y149.417 E.21432
G1 X147.114 Y149.417
G1 X142.182 Y154.35 E.21432
G1 X141.649 Y154.35
G1 X146.581 Y149.417 E.21432
G1 X146.048 Y149.417
G1 X141.115 Y154.35 E.21432
G1 X140.582 Y154.35
G1 X145.514 Y149.417 E.21432
G1 X144.981 Y149.417
G1 X140.049 Y154.35 E.21432
G1 X139.516 Y154.35
G1 X144.448 Y149.417 E.21432
G1 X143.915 Y149.417
G1 X138.982 Y154.35 E.21432
G1 X138.449 Y154.35
G1 X143.381 Y149.417 E.21432
G1 X142.848 Y149.417
G1 X137.916 Y154.35 E.21432
G1 X137.383 Y154.35
G1 X142.315 Y149.417 E.21432
G1 X141.782 Y149.417
G1 X136.849 Y154.35 E.21432
G1 X136.316 Y154.35
G1 X141.248 Y149.417 E.21432
G1 X140.715 Y149.417
G1 X135.783 Y154.35 E.21432
G1 X135.25 Y154.35
G1 X140.182 Y149.417 E.21432
G1 X139.648 Y149.417
G1 X134.716 Y154.35 E.21432
G1 X134.183 Y154.35
G1 X139.115 Y149.417 E.21432
G1 X138.582 Y149.417
G1 X133.65 Y154.35 E.21432
G1 X133.117 Y154.35
G1 X138.049 Y149.417 E.21432
G1 X137.515 Y149.417
G1 X132.583 Y154.35 E.21432
G1 X132.05 Y154.35
G1 X136.982 Y149.417 E.21432
G1 X136.449 Y149.417
G1 X131.517 Y154.35 E.21432
G1 X130.984 Y154.35
G1 X135.916 Y149.417 E.21432
G1 X135.382 Y149.417
G1 X130.45 Y154.35 E.21432
G1 X129.917 Y154.35
G1 X134.849 Y149.417 E.21432
G1 X134.583 Y149.151
G1 X129.65 Y154.083 E.21432
G1 X129.65 Y153.55
G1 X134.583 Y148.617 E.21432
G1 X134.583 Y148.084
G1 X129.65 Y153.016 E.21432
G1 X129.65 Y152.483
G1 X134.583 Y147.551 E.21432
G1 X134.583 Y147.018
G1 X129.65 Y151.95 E.21432
G1 X129.65 Y151.417
G1 X134.583 Y146.484 E.21432
G1 X134.583 Y145.951
G1 X129.65 Y150.883 E.21432
G1 X129.65 Y150.35
G1 X134.583 Y145.418 E.21432
G1 X134.583 Y144.885
G1 X129.65 Y149.817 E.21432
G1 X129.65 Y149.284
G1 X134.583 Y144.351 E.21432
G1 X134.583 Y143.818
G1 X129.65 Y148.75 E.21432
G1 X129.65 Y148.217
G1 X134.583 Y143.285 E.21432
G1 X134.583 Y142.752
G1 X129.65 Y147.684 E.21432
G1 X129.65 Y147.15
G1 X134.583 Y142.218 E.21432
G1 X134.583 Y141.685
G1 X129.65 Y146.617 E.21432
G1 X129.65 Y146.084
G1 X134.583 Y141.152 E.21432
G1 X134.583 Y140.619
G1 X129.65 Y145.551 E.21432
G1 X129.65 Y145.017
G1 X134.583 Y140.085 E.21432
G1 X134.583 Y139.552
G1 X129.65 Y144.484 E.21432
G1 X129.65 Y143.951
G1 X134.583 Y139.019 E.21432
G1 X134.583 Y138.486
G1 X129.65 Y143.418 E.21432
G1 X129.65 Y142.884
G1 X134.583 Y137.952 E.21432
G1 X134.583 Y137.419
G1 X129.65 Y142.351 E.21432
G1 X129.65 Y141.818
G1 X134.583 Y136.886 E.21432
G1 X134.583 Y136.353
G1 X129.65 Y141.285 E.21432
G1 X129.65 Y140.751
G1 X134.583 Y135.819 E.21432
G1 X134.583 Y135.286
G1 X129.65 Y140.218 E.21432
M73 P43 R17
G1 X129.65 Y139.685
G1 X134.583 Y134.753 E.21432
; WIPE_START
M204 S6000
G1 X133.168 Y136.167 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.65 Y139.152 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X139.152 Y129.65 E.41287
G1 X138.618 Y129.65
G1 X129.65 Y138.618 E.3897
G1 X129.65 Y138.085
G1 X138.085 Y129.65 E.36653
G1 X137.552 Y129.65
G1 X129.65 Y137.552 E.34335
G1 X129.65 Y137.019
G1 X137.019 Y129.65 E.32018
G1 X136.485 Y129.65
G1 X129.65 Y136.485 E.29701
G1 X129.65 Y135.952
G1 X135.952 Y129.65 E.27383
G1 X135.419 Y129.65
G1 X129.65 Y135.419 E.25066
G1 X129.65 Y134.886
G1 X134.886 Y129.65 E.22749
G1 X134.352 Y129.65
G1 X129.65 Y134.352 E.20432
G1 X129.65 Y133.819
G1 X133.819 Y129.65 E.18114
G1 X133.286 Y129.65
G1 X129.65 Y133.286 E.15797
G1 X129.65 Y132.753
G1 X132.753 Y129.65 E.1348
G1 X132.219 Y129.65
G1 X129.65 Y132.219 E.11163
G1 X129.65 Y131.686
G1 X131.686 Y129.65 E.08845
G1 X131.153 Y129.65
G1 X129.65 Y131.153 E.06528
G1 X129.65 Y130.619
G1 X130.619 Y129.65 E.04211
G1 X130.086 Y129.65
G1 X129.65 Y130.086 E.01894
; WIPE_START
M204 S6000
G1 X130.086 Y129.65 E-.23418
G1 X130.619 Y129.65 E-.20264
G1 X130.018 Y130.252 E-.32318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.683 Y134.512 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.159124
G1 F15000
M204 S6000
G2 X134.512 Y134.682 I.055 J.226 E.0024
; WIPE_START
G1 X134.546 Y134.601 E-.26249
G1 X134.601 Y134.546 E-.23495
G1 X134.683 Y134.512 E-.26256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.08 Y139.909 Z2 F42000
G1 X149.488 Y149.317 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.159064
G1 F15000
M204 S6000
G3 X149.317 Y149.488 I-.226 J-.055 E.0024
; WIPE_START
G1 X149.399 Y149.454 E-.26277
G1 X149.454 Y149.399 E-.23454
G1 X149.488 Y149.317 E-.26269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.317 Y154.485 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.261059
G1 F15000
M204 S6000
G1 X129.624 Y154.485 E.35006
G1 X129.534 Y154.466 E.00164
G1 X129.515 Y154.376 E.00164
G1 X129.515 Y129.624 E.43998
G1 X129.534 Y129.534 E.00164
G1 X129.624 Y129.515 E.00164
G1 X154.376 Y129.515 E.43998
G1 X154.466 Y129.534 E.00164
G1 X154.485 Y129.624 E.00164
G1 X154.485 Y154.376 E.43998
G1 X154.466 Y154.466 E.00164
G1 X154.376 Y154.485 E.00164
G1 X149.377 Y154.485 E.08885
; OBJECT_ID: 88
; WIPE_START
G1 X147.377 Y154.485 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X142.716 Y148.441 Z2 F42000
G1 X121.31 Y120.69 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X121.31 Y135.31 E.44923
G1 X106.69 Y135.31 E.44923
G1 X106.69 Y120.69 E.44923
G1 X121.25 Y120.69 E.44739
; WIPE_START
M204 S6000
G1 X121.258 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.489 Y129.989 Z2 F42000
G1 X126.79 Y140.79 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.35 Y139.914 F42000
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X125.914 Y140.35 E.01894
G1 X125.38 Y140.35
M73 P44 R17
G1 X126.35 Y139.38 E.04211
G1 X126.35 Y138.847
G1 X124.847 Y140.35 E.06529
G1 X124.314 Y140.35
G1 X126.35 Y138.314 E.08846
G1 X126.35 Y137.781
G1 X123.781 Y140.35 E.11163
G1 X123.247 Y140.35
G1 X126.35 Y137.247 E.1348
G1 X126.35 Y136.714
G1 X122.714 Y140.35 E.15798
G1 X122.181 Y140.35
G1 X126.35 Y136.181 E.18115
G1 X126.35 Y135.648
G1 X121.648 Y140.35 E.20432
G1 X121.114 Y140.35
G1 X126.35 Y135.114 E.22749
G1 X126.35 Y134.581
G1 X120.581 Y140.35 E.25067
G1 X120.048 Y140.35
G1 X126.35 Y134.048 E.27384
G1 X126.35 Y133.515
G1 X119.515 Y140.35 E.29701
G1 X118.981 Y140.35
G1 X126.35 Y132.981 E.32019
G1 X126.35 Y132.448
G1 X118.448 Y140.35 E.34336
G1 X117.915 Y140.35
G1 X126.35 Y131.915 E.36653
G1 X126.35 Y131.382
G1 X117.382 Y140.35 E.3897
G1 X116.848 Y140.35
G1 X126.35 Y130.848 E.41288
G1 X126.35 Y130.315
G1 X121.517 Y135.147 E.20998
G1 X121.517 Y134.614
G1 X126.35 Y129.782 E.20998
G1 X126.35 Y129.248
G1 X121.517 Y134.081 E.20998
G1 X121.517 Y133.547
G1 X126.35 Y128.715 E.20998
G1 X126.35 Y128.182
G1 X121.517 Y133.014 E.20998
G1 X121.517 Y132.481
G1 X126.35 Y127.649 E.20998
G1 X126.35 Y127.115
G1 X121.517 Y131.948 E.20998
G1 X121.517 Y131.414
G1 X126.35 Y126.582 E.20998
G1 X126.35 Y126.049
G1 X121.517 Y130.881 E.20998
G1 X121.517 Y130.348
G1 X126.35 Y125.516 E.20998
G1 X126.35 Y124.982
G1 X121.517 Y129.815 E.20998
G1 X121.517 Y129.281
G1 X126.35 Y124.449 E.20998
G1 X126.35 Y123.916
G1 X121.517 Y128.748 E.20998
G1 X121.517 Y128.215
G1 X126.35 Y123.383 E.20998
G1 X126.35 Y122.849
G1 X121.517 Y127.682 E.20998
G1 X121.517 Y127.148
G1 X126.35 Y122.316 E.20998
G1 X126.35 Y121.783
G1 X121.517 Y126.615 E.20998
G1 X121.517 Y126.082
G1 X126.35 Y121.25 E.20998
G1 X126.35 Y120.716
G1 X121.517 Y125.549 E.20998
G1 X121.517 Y125.015
G1 X126.35 Y120.183 E.20998
G1 X126.35 Y119.65
G1 X121.517 Y124.482 E.20998
G1 X121.517 Y123.949
G1 X126.35 Y119.117 E.20998
G1 X126.35 Y118.583
G1 X121.517 Y123.415 E.20998
G1 X121.517 Y122.882
G1 X126.35 Y118.05 E.20998
G1 X126.35 Y117.517
G1 X121.517 Y122.349 E.20998
G1 X121.517 Y121.816
G1 X126.35 Y116.984 E.20998
G1 X126.35 Y116.45
G1 X121.517 Y121.282 E.20998
G1 X121.517 Y120.749
G1 X126.35 Y115.917 E.20998
G1 X126.083 Y115.65
G1 X121.251 Y120.483 E.20998
G1 X120.717 Y120.483
G1 X125.55 Y115.65 E.20998
G1 X125.016 Y115.65
G1 X120.184 Y120.483 E.20998
G1 X119.651 Y120.483
G1 X124.483 Y115.65 E.20998
G1 X123.95 Y115.65
G1 X119.118 Y120.483 E.20998
G1 X118.584 Y120.483
G1 X123.417 Y115.65 E.20998
G1 X122.883 Y115.65
G1 X118.051 Y120.483 E.20998
G1 X117.518 Y120.483
G1 X122.35 Y115.65 E.20998
G1 X121.817 Y115.65
G1 X116.985 Y120.483 E.20998
G1 X116.451 Y120.483
G1 X121.284 Y115.65 E.20998
G1 X120.75 Y115.65
G1 X115.918 Y120.483 E.20998
G1 X115.385 Y120.483
G1 X120.217 Y115.65 E.20998
G1 X119.684 Y115.65
G1 X114.852 Y120.483 E.20998
G1 X114.318 Y120.483
G1 X119.15 Y115.65 E.20998
G1 X118.617 Y115.65
G1 X113.785 Y120.483 E.20998
G1 X113.252 Y120.483
G1 X118.084 Y115.65 E.20998
G1 X117.551 Y115.65
G1 X112.719 Y120.483 E.20998
G1 X112.185 Y120.483
G1 X117.017 Y115.65 E.20998
G1 X116.484 Y115.65
G1 X111.652 Y120.483 E.20998
G1 X111.119 Y120.483
G1 X115.951 Y115.65 E.20998
G1 X115.418 Y115.65
G1 X110.586 Y120.483 E.20998
G1 X110.052 Y120.483
G1 X114.884 Y115.65 E.20998
G1 X114.351 Y115.65
G1 X109.519 Y120.483 E.20998
G1 X108.986 Y120.483
G1 X113.818 Y115.65 E.20998
G1 X113.285 Y115.65
G1 X108.453 Y120.483 E.20998
G1 X107.919 Y120.483
G1 X112.751 Y115.65 E.20998
G1 X112.218 Y115.65
G1 X107.386 Y120.483 E.20998
G1 X106.853 Y120.483
G1 X111.685 Y115.65 E.20998
; WIPE_START
M204 S6000
G1 X110.271 Y117.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.146 Y123.64 Z2 F42000
G1 X121.147 Y135.517 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X116.315 Y140.35 E.20998
G1 X115.782 Y140.35
G1 X120.614 Y135.517 E.20998
G1 X120.081 Y135.517
G1 X115.248 Y140.35 E.20998
G1 X114.715 Y140.35
G1 X119.547 Y135.517 E.20998
G1 X119.014 Y135.517
G1 X114.182 Y140.35 E.20998
G1 X113.649 Y140.35
G1 X118.481 Y135.517 E.20998
G1 X117.948 Y135.517
G1 X113.115 Y140.35 E.20998
G1 X112.582 Y140.35
G1 X117.414 Y135.517 E.20998
G1 X116.881 Y135.517
G1 X112.049 Y140.35 E.20998
G1 X111.516 Y140.35
G1 X116.348 Y135.517 E.20998
G1 X115.815 Y135.517
G1 X110.982 Y140.35 E.20998
G1 X110.449 Y140.35
G1 X115.281 Y135.517 E.20998
G1 X114.748 Y135.517
G1 X109.916 Y140.35 E.20998
G1 X109.383 Y140.35
G1 X114.215 Y135.517 E.20998
G1 X113.682 Y135.517
G1 X108.849 Y140.35 E.20998
G1 X108.316 Y140.35
G1 X113.148 Y135.517 E.20998
G1 X112.615 Y135.517
G1 X107.783 Y140.35 E.20998
G1 X107.25 Y140.35
G1 X112.082 Y135.517 E.20998
G1 X111.549 Y135.517
G1 X106.716 Y140.35 E.20998
G1 X106.183 Y140.35
G1 X111.015 Y135.517 E.20998
G1 X110.482 Y135.517
G1 X105.65 Y140.35 E.20998
G1 X105.117 Y140.35
G1 X109.949 Y135.517 E.20998
G1 X109.415 Y135.517
G1 X104.583 Y140.35 E.20998
G1 X104.05 Y140.35
G1 X108.882 Y135.517 E.20998
G1 X108.349 Y135.517
G1 X103.517 Y140.35 E.20998
G1 X102.984 Y140.35
G1 X107.816 Y135.517 E.20998
G1 X107.282 Y135.517
G1 X102.45 Y140.35 E.20998
G1 X101.917 Y140.35
G1 X106.749 Y135.517 E.20998
G1 X106.483 Y135.251
G1 X101.65 Y140.083 E.20998
G1 X101.65 Y139.55
G1 X106.483 Y134.717 E.20998
G1 X106.483 Y134.184
G1 X101.65 Y139.016 E.20998
M73 P45 R17
G1 X101.65 Y138.483
G1 X106.483 Y133.651 E.20998
G1 X106.483 Y133.118
G1 X101.65 Y137.95 E.20998
G1 X101.65 Y137.417
G1 X106.483 Y132.584 E.20998
G1 X106.483 Y132.051
G1 X101.65 Y136.883 E.20998
G1 X101.65 Y136.35
G1 X106.483 Y131.518 E.20998
G1 X106.483 Y130.985
G1 X101.65 Y135.817 E.20998
G1 X101.65 Y135.284
G1 X106.483 Y130.451 E.20998
G1 X106.483 Y129.918
G1 X101.65 Y134.75 E.20998
G1 X101.65 Y134.217
G1 X106.483 Y129.385 E.20998
G1 X106.483 Y128.852
G1 X101.65 Y133.684 E.20998
G1 X101.65 Y133.15
G1 X106.483 Y128.318 E.20998
G1 X106.483 Y127.785
G1 X101.65 Y132.617 E.20998
G1 X101.65 Y132.084
G1 X106.483 Y127.252 E.20998
G1 X106.483 Y126.719
G1 X101.65 Y131.551 E.20998
G1 X101.65 Y131.017
G1 X106.483 Y126.185 E.20998
G1 X106.483 Y125.652
G1 X101.65 Y130.484 E.20998
G1 X101.65 Y129.951
G1 X106.483 Y125.119 E.20998
G1 X106.483 Y124.586
G1 X101.65 Y129.418 E.20998
G1 X101.65 Y128.884
G1 X106.483 Y124.052 E.20998
G1 X106.483 Y123.519
G1 X101.65 Y128.351 E.20998
G1 X101.65 Y127.818
G1 X106.483 Y122.986 E.20998
G1 X106.483 Y122.453
G1 X101.65 Y127.285 E.20998
G1 X101.65 Y126.751
G1 X106.483 Y121.919 E.20998
G1 X106.483 Y121.386
G1 X101.65 Y126.218 E.20998
G1 X101.65 Y125.685
G1 X106.483 Y120.853 E.20998
; WIPE_START
M204 S6000
G1 X105.068 Y122.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.65 Y125.152 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X111.152 Y115.65 E.41287
G1 X110.618 Y115.65
G1 X101.65 Y124.618 E.3897
G1 X101.65 Y124.085
G1 X110.085 Y115.65 E.36653
G1 X109.552 Y115.65
G1 X101.65 Y123.552 E.34335
G1 X101.65 Y123.019
G1 X109.019 Y115.65 E.32018
G1 X108.485 Y115.65
G1 X101.65 Y122.485 E.29701
G1 X101.65 Y121.952
G1 X107.952 Y115.65 E.27383
G1 X107.419 Y115.65
G1 X101.65 Y121.419 E.25066
G1 X101.65 Y120.886
G1 X106.886 Y115.65 E.22749
G1 X106.352 Y115.65
G1 X101.65 Y120.352 E.20432
G1 X101.65 Y119.819
G1 X105.819 Y115.65 E.18114
G1 X105.286 Y115.65
G1 X101.65 Y119.286 E.15797
G1 X101.65 Y118.753
G1 X104.753 Y115.65 E.1348
G1 X104.219 Y115.65
G1 X101.65 Y118.219 E.11163
G1 X101.65 Y117.686
G1 X103.686 Y115.65 E.08845
G1 X103.153 Y115.65
G1 X101.65 Y117.153 E.06528
G1 X101.65 Y116.62
G1 X102.62 Y115.65 E.04211
G1 X102.086 Y115.65
G1 X101.65 Y116.086 E.01894
M204 S10000
G1 X101.515 Y116.086 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261059
G1 F15000
M204 S6000
G1 X101.515 Y115.624 E.00822
G1 X101.534 Y115.534 E.00164
G1 X101.624 Y115.515 E.00164
G1 X126.376 Y115.515 E.43998
G1 X126.466 Y115.534 E.00164
G1 X126.485 Y115.624 E.00164
G1 X126.485 Y140.376 E.43998
G1 X126.466 Y140.466 E.00164
G1 X126.376 Y140.485 E.00164
G1 X101.624 Y140.485 E.43998
G1 X101.534 Y140.466 E.00164
G1 X101.515 Y140.376 E.00164
G1 X101.515 Y116.146 E.4307
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X101.515 Y115.624 E-.19844
G1 X101.534 Y115.534 E-.03504
G1 X101.624 Y115.515 E-.03504
G1 X102.917 Y115.515 E-.49147
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 9/53
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S193.8
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.427 J1.14 P1  F42000
G1 X130.54 Y125.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z2.2 F42000
G1 X154.398 Y126.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 9 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer9 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z2.2 F42000
G1 X130.54 Y153.852 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z2.2 F42000
G1 X154.398 Y154.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
M73 P46 R17
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z2.2 F42000
G1 X102.54 Y139.852 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z2.2 F42000
G1 X126.398 Y140.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 10/53
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z2.4 F42000
G1 X154.398 Y126.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
M73 P46 R16
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 10 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer10 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z2.4 F42000
G1 X130.54 Y153.852 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
M73 P47 R16
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z2.4 F42000
G1 X154.398 Y154.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z2.4 F42000
G1 X102.54 Y139.852 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z2.4 F42000
G1 X126.398 Y140.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 11/53
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z2.6 F42000
G1 X154.398 Y126.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 11 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer11 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z2.6 F42000
M73 P48 R16
G1 X130.54 Y153.852 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z2.6 F42000
G1 X154.398 Y154.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z2.6 F42000
G1 X102.54 Y139.852 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z2.6 F42000
G1 X126.398 Y140.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 12/53
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z2.8 F42000
G1 X154.398 Y126.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
M73 P49 R16
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 12 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer12 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z2.8 F42000
G1 X130.54 Y153.852 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z2.8 F42000
G1 X154.398 Y154.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z2.8 F42000
G1 X102.54 Y139.852 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z2.8 F42000
G1 X126.398 Y140.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P49 R15
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 13/53
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P50 R15
G1 X138.17 Y124.395 Z3 F42000
G1 X154.398 Y126.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 13 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer13 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z3 F42000
G1 X130.54 Y153.852 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z3 F42000
G1 X154.398 Y154.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z3 F42000
G1 X102.54 Y139.852 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z3 F42000
G1 X126.398 Y140.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P51 R15
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 14/53
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z3.2 F42000
G1 X154.398 Y126.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 14 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer14 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z3.2 F42000
G1 X130.54 Y153.852 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z3.2 F42000
G1 X154.398 Y154.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z3.2 F42000
G1 X102.54 Y139.852 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z3.2 F42000
G1 X126.398 Y140.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
M73 P52 R15
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 15/53
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z3.4 F42000
G1 X154.398 Y126.398 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 15 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer15 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z3.4 F42000
G1 X130.54 Y153.852 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z3.4 F42000
G1 X154.398 Y154.398 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z3.4 F42000
G1 X102.54 Y139.852 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
M73 P53 R14
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z3.4 F42000
G1 X126.398 Y140.398 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 16/53
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z3.6 F42000
G1 X154.398 Y126.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 16 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer16 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z3.6 F42000
G1 X130.54 Y153.852 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z3.6 F42000
G1 X154.398 Y154.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
M73 P54 R14
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z3.6 F42000
G1 X102.54 Y139.852 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z3.6 F42000
G1 X126.398 Y140.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 17/53
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z3.8 F42000
G1 X154.398 Y126.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 17 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer17 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z3.8 F42000
G1 X130.54 Y153.852 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z3.8 F42000
M73 P55 R14
G1 X154.398 Y154.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z3.8 F42000
G1 X102.54 Y139.852 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z3.8 F42000
G1 X126.398 Y140.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 18/53
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z4 F42000
G1 X154.398 Y126.398 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 18 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer18 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z4 F42000
M73 P56 R14
G1 X130.54 Y153.852 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z4 F42000
G1 X154.398 Y154.398 Z4
G1 Z3.6
M73 P56 R13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z4 F42000
G1 X102.54 Y139.852 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z4 F42000
G1 X126.398 Y140.398 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 19/53
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z4.2 F42000
G1 X154.398 Y126.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 19 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer19 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M73 P57 R13
G1 X152.79 Y126.113 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z4.2 F42000
G1 X130.54 Y153.852 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z4.2 F42000
G1 X154.398 Y154.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z4.2 F42000
G1 X102.54 Y139.852 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z4.2 F42000
G1 X126.398 Y140.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 20/53
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z4.4 F42000
G1 X154.398 Y126.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
M73 P58 R13
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 20 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer20 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z4.4 F42000
G1 X130.54 Y153.852 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z4.4 F42000
G1 X154.398 Y154.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z4.4 F42000
G1 X102.54 Y139.852 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z4.4 F42000
G1 X126.398 Y140.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 21/53
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
M73 P59 R13
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z4.6 F42000
G1 X154.398 Y126.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 21 start: 66,77,88
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P59 R12
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


; object ids of this layer21 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z4.6 F42000
G1 X130.54 Y153.852 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z4.6 F42000
G1 X154.398 Y154.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z4.6 F42000
G1 X102.54 Y139.852 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z4.6 F42000
G1 X126.398 Y140.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
M73 P60 R12
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 22/53
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z4.8 F42000
G1 X154.398 Y126.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 22 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer22 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z4.8 F42000
G1 X130.54 Y153.852 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z4.8 F42000
G1 X154.398 Y154.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z4.8 F42000
G1 X102.54 Y139.852 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P61 R12
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z4.8 F42000
G1 X126.398 Y140.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 23/53
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z5 F42000
G1 X154.398 Y126.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 23 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer23 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z5 F42000
G1 X130.54 Y153.852 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z5 F42000
G1 X154.398 Y154.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z5 F42000
G1 X102.54 Y139.852 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P62 R12
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z5 F42000
G1 X126.398 Y140.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 24/53
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
M73 P62 R11
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z5.2 F42000
G1 X154.398 Y126.398 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 24 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer24 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z5.2 F42000
G1 X130.54 Y153.852 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z5.2 F42000
G1 X154.398 Y154.398 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
M73 P63 R11
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z5.2 F42000
G1 X102.54 Y139.852 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z5.2 F42000
G1 X126.398 Y140.398 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 25/53
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z5.4 F42000
G1 X154.398 Y126.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 25 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer25 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z5.4 F42000
G1 X130.54 Y153.852 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
M73 P64 R11
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z5.4 F42000
G1 X154.398 Y154.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z5.4 F42000
G1 X102.54 Y139.852 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z5.4 F42000
G1 X126.398 Y140.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 26/53
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z5.6 F42000
G1 X154.398 Y126.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 26 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer26 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
M73 P65 R11
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z5.6 F42000
G1 X130.54 Y153.852 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z5.6 F42000
G1 X154.398 Y154.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z5.6 F42000
G1 X102.54 Y139.852 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
M73 P65 R10
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z5.6 F42000
G1 X126.398 Y140.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 27/53
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z5.8 F42000
G1 X154.398 Y126.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
M73 P66 R10
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 27 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer27 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z5.8 F42000
G1 X130.54 Y153.852 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z5.8 F42000
G1 X154.398 Y154.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z5.8 F42000
G1 X102.54 Y139.852 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z5.8 F42000
G1 X126.398 Y140.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 28/53
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
M73 P67 R10
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z6 F42000
G1 X154.398 Y126.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 28 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer28 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z6 F42000
G1 X130.54 Y153.852 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z6 F42000
G1 X154.398 Y154.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z6 F42000
G1 X102.54 Y139.852 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z6 F42000
G1 X126.398 Y140.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
M73 P68 R10
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 29/53
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z6.2 F42000
G1 X154.398 Y126.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 29 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer29 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z6.2 F42000
G1 X130.54 Y153.852 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z6.2 F42000
G1 X154.398 Y154.398 Z6.2
G1 Z5.8
M73 P68 R9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z6.2 F42000
G1 X102.54 Y139.852 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z6.2 F42000
M73 P69 R9
G1 X126.398 Y140.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 30/53
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z6.4 F42000
G1 X154.398 Y126.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 30 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer30 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z6.4 F42000
G1 X130.54 Y153.852 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z6.4 F42000
G1 X154.398 Y154.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z6.4 F42000
G1 X102.54 Y139.852 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P70 R9
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z6.4 F42000
G1 X126.398 Y140.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 31/53
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z6.6 F42000
G1 X154.398 Y126.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 31 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer31 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z6.6 F42000
G1 X130.54 Y153.852 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z6.6 F42000
G1 X154.398 Y154.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
M73 P71 R9
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z6.6 F42000
G1 X102.54 Y139.852 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z6.6 F42000
G1 X126.398 Y140.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 32/53
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z6.8 F42000
G1 X154.398 Y126.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 32 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer32 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M73 P71 R8
G1 X152.79 Y126.113 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z6.8 F42000
G1 X130.54 Y153.852 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
M73 P72 R8
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z6.8 F42000
G1 X154.398 Y154.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z6.8 F42000
G1 X102.54 Y139.852 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z6.8 F42000
G1 X126.398 Y140.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 33/53
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z7 F42000
G1 X154.398 Y126.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 33 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer33 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
M73 P73 R8
G1 X146.341 Y132.271 Z7 F42000
G1 X130.54 Y153.852 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z7 F42000
G1 X154.398 Y154.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z7 F42000
G1 X102.54 Y139.852 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z7 F42000
G1 X126.398 Y140.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 34/53
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z7.2 F42000
G1 X154.398 Y126.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
M73 P74 R8
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 34 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer34 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z7.2 F42000
G1 X130.54 Y153.852 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z7.2 F42000
G1 X154.398 Y154.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z7.2 F42000
G1 X102.54 Y139.852 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z7.2 F42000
G1 X126.398 Y140.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 35/53
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
M73 P74 R7
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
M73 P75 R7
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z7.4 F42000
G1 X154.398 Y126.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 35 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer35 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z7.4 F42000
G1 X130.54 Y153.852 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z7.4 F42000
G1 X154.398 Y154.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z7.4 F42000
G1 X102.54 Y139.852 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z7.4 F42000
G1 X126.398 Y140.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
M73 P76 R7
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 36/53
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z7.6 F42000
G1 X154.398 Y126.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 36 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer36 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z7.6 F42000
G1 X130.54 Y153.852 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z7.6 F42000
G1 X154.398 Y154.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z7.6 F42000
G1 X102.54 Y139.852 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z7.6 F42000
G1 X126.398 Y140.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
M73 P77 R7
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 37/53
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z7.8 F42000
G1 X154.398 Y126.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 37 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer37 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z7.8 F42000
G1 X130.54 Y153.852 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z7.8 F42000
G1 X154.398 Y154.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z7.8 F42000
G1 X102.54 Y139.852 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
M73 P78 R7
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z7.8 F42000
G1 X126.398 Y140.398 Z7.8
G1 Z7.4
M73 P78 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 38/53
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z8 F42000
G1 X154.398 Y126.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 38 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer38 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z8 F42000
G1 X130.54 Y153.852 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z8 F42000
G1 X154.398 Y154.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
M73 P79 R6
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z8 F42000
G1 X102.54 Y139.852 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z8 F42000
G1 X126.398 Y140.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 39/53
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z8.2 F42000
G1 X154.398 Y126.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 39 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer39 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z8.2 F42000
G1 X130.54 Y153.852 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z8.2 F42000
M73 P80 R6
G1 X154.398 Y154.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z8.2 F42000
G1 X102.54 Y139.852 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z8.2 F42000
G1 X126.398 Y140.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 40/53
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z8.4 F42000
G1 X154.398 Y126.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 40 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer40 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
M73 P81 R6
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z8.4 F42000
G1 X130.54 Y153.852 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z8.4 F42000
G1 X154.398 Y154.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
M73 P81 R5
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z8.4 F42000
G1 X102.54 Y139.852 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z8.4 F42000
G1 X126.398 Y140.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 41/53
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z8.6 F42000
G1 X154.398 Y126.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P82 R5
G3 Z8.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 41 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer41 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z8.6 F42000
G1 X130.54 Y153.852 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z8.6 F42000
G1 X154.398 Y154.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z8.6 F42000
G1 X102.54 Y139.852 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z8.6 F42000
G1 X126.398 Y140.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 42/53
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
M73 P83 R5
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z8.8 F42000
G1 X154.398 Y126.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 42 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer42 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z8.8 F42000
G1 X130.54 Y153.852 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z8.8 F42000
G1 X154.398 Y154.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z8.8 F42000
G1 X102.54 Y139.852 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z8.8 F42000
G1 X126.398 Y140.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 43/53
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z8.8
G1 Z8.6
M73 P84 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z9 F42000
G1 X154.398 Y126.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 43 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer43 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
M73 P84 R4
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z9 F42000
G1 X130.54 Y153.852 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z9 F42000
G1 X154.398 Y154.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z9 F42000
G1 X102.54 Y139.852 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z9 F42000
G1 X126.398 Y140.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
M73 P85 R4
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 44/53
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z9.2 F42000
G1 X154.398 Y126.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 44 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer44 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z9.2 F42000
G1 X130.54 Y153.852 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z9.2 F42000
G1 X154.398 Y154.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z9.2 F42000
G1 X102.54 Y139.852 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
M73 P86 R4
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z9.2 F42000
G1 X126.398 Y140.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 45/53
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z9.4 F42000
G1 X154.398 Y126.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 45 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer45 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z9.4 F42000
G1 X130.54 Y153.852 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z9.4 F42000
G1 X154.398 Y154.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z9.4 F42000
M73 P87 R4
G1 X102.54 Y139.852 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z9.4 F42000
G1 X126.398 Y140.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 46/53
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
M73 P87 R3
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z9.6 F42000
G1 X154.398 Y126.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 46 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer46 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z9.6 F42000
G1 X130.54 Y153.852 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z9.6 F42000
G1 X154.398 Y154.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
M73 P88 R3
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z9.6 F42000
G1 X102.54 Y139.852 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z9.6 F42000
G1 X126.398 Y140.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 47/53
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z9.8 F42000
G1 X154.398 Y126.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 47 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer47 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z9.8 F42000
G1 X130.54 Y153.852 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
M73 P89 R3
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z9.8 F42000
G1 X154.398 Y154.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z9.8 F42000
G1 X102.54 Y139.852 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z9.8 F42000
G1 X126.398 Y140.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 48/53
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z9.8 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z10 F42000
G1 X154.398 Y126.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 48 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer48 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
M73 P90 R3
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z10 F42000
G1 X130.54 Y153.852 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z10 F42000
G1 X154.398 Y154.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z10 F42000
G1 X102.54 Y139.852 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z10 F42000
G1 X126.398 Y140.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
M73 P90 R2
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 49/53
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z10 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z10.2 F42000
G1 X154.398 Y126.398 Z10.2
G1 Z9.8
M73 P91 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 49 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer49 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z10.2 F42000
G1 X130.54 Y153.852 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z10.2 F42000
G1 X154.398 Y154.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z10.2 F42000
G1 X102.54 Y139.852 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z10.2 F42000
G1 X126.398 Y140.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 50/53
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z10.2 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
M73 P92 R2
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z10.4 F42000
G1 X154.398 Y126.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 50 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer50 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z10.4 F42000
G1 X130.54 Y153.852 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z10.4 F42000
G1 X154.398 Y154.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z10.4 F42000
G1 X102.54 Y139.852 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z10.4 F42000
G1 X126.398 Y140.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
M73 P93 R2
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 51/53
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z10.4 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z10.6 F42000
G1 X154.398 Y126.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 51 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer51 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z10.6 F42000
G1 X130.54 Y153.852 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z10.6 F42000
G1 X154.398 Y154.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
M73 P93 R1
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z10.6 F42000
G1 X102.54 Y139.852 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z10.6 F42000
M73 P94 R1
G1 X126.398 Y140.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 52/53
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z10.6 I1.109 J.502 P1  F42000
G1 X130.54 Y125.852 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y125.852 E.01301
G1 X130.148 Y102.148 E.78631
G1 X153.852 Y102.148 E.78631
G1 X153.852 Y125.852 E.78631
G1 X130.6 Y125.852 E.77131
M204 S250
G1 X130.54 Y125.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y124.395 Z10.8 F42000
G1 X154.398 Y126.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y126.398 E.82252
G1 X129.602 Y101.602 E.82252
G1 X154.398 Y101.602 E.82252
G1 X154.398 Y126.338 E.82053
M204 S250
G1 X154.79 Y126.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 52 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer52 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X152.79 Y126.113 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y126.113 E.25915
G1 X129.887 Y101.887 E.27412
G1 X154.113 Y101.887 E.27412
G1 X154.113 Y126.113 E.27412
G1 X152.85 Y126.113 E.01429
; OBJECT_ID: 66
; WIPE_START
G1 X150.85 Y126.113 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X146.341 Y132.271 Z10.8 F42000
G1 X130.54 Y153.852 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.148 Y153.852 E.01301
G1 X130.148 Y130.148 E.78631
G1 X153.852 Y130.148 E.78631
G1 X153.852 Y153.852 E.78631
G1 X130.6 Y153.852 E.77131
M204 S250
G1 X130.54 Y153.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.17 Y152.395 Z10.8 F42000
G1 X154.398 Y154.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X129.602 Y154.398 E.82252
G1 X129.602 Y129.602 E.82252
G1 X154.398 Y129.602 E.82252
G1 X154.398 Y154.338 E.82053
M204 S250
G1 X154.79 Y154.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
M204 S10000
G1 X154.113 Y154.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X129.887 Y154.113 E.27412
G1 X129.887 Y129.887 E.27412
G1 X154.113 Y129.887 E.27412
G1 X154.113 Y154.053 E.27344
; OBJECT_ID: 88
; WIPE_START
G1 X152.113 Y154.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X144.776 Y151.955 Z10.8 F42000
G1 X102.54 Y139.852 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P95 R1
G1 F6000
M204 S6000
G1 X102.148 Y139.852 E.01301
G1 X102.148 Y116.148 E.78631
G1 X125.852 Y116.148 E.78631
G1 X125.852 Y139.852 E.78631
G1 X102.6 Y139.852 E.77131
M204 S250
G1 X102.54 Y139.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.17 Y138.395 Z10.8 F42000
G1 X126.398 Y140.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X101.602 Y140.398 E.82252
G1 X101.602 Y115.602 E.82252
G1 X126.398 Y115.602 E.82252
G1 X126.398 Y140.338 E.82053
M204 S250
G1 X126.79 Y140.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
M204 S10000
G1 X126.113 Y140.113 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181778
G1 F15000
M204 S6000
G1 X101.887 Y140.113 E.27412
G1 X101.887 Y115.887 E.27412
G1 X126.113 Y115.887 E.27412
G1 X126.113 Y140.053 E.27344
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.113 Y140.058 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 88
M625
; layer num/total_layer_count: 53/53
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
M106 S183.6
; OBJECT_ID: 77
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z10.8 I1.114 J.49 P1  F42000
G1 X130.54 Y125.46 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y102.54 E.70427
G1 X153.46 Y102.54 E.70427
G1 X153.46 Y125.46 E.70427
G1 X130.6 Y125.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y123.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.156 Y124.501 Z11 F42000
G1 X154.79 Y126.79 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.21 Y126.79 E.786
G1 X129.21 Y101.21 E.786
G1 X154.79 Y101.21 E.786
G1 X154.79 Y126.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y126.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
; stop printing object, unique label id: 77
M625
; object ids of layer 53 start: 66,77,88
M624 BwAAAAAAAAA=
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


; object ids of this layer53 end: 66,77,88
M625
; start printing object, unique label id: 77
M624 AgAAAAAAAAA=
G1 X154.583 Y101.786 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X154.214 Y101.417 E.01603
G1 X153.681 Y101.417
G1 X154.583 Y102.319 E.0392
G1 X154.583 Y102.853
G1 X153.147 Y101.417 E.06237
G1 X152.614 Y101.417
G1 X153.529 Y102.333 E.03977
G1 X152.996 Y102.333
G1 X152.081 Y101.417 E.03977
G1 X151.547 Y101.417
G1 X152.463 Y102.333 E.03977
G1 X151.929 Y102.333
G1 X151.014 Y101.417 E.03977
G1 X150.481 Y101.417
G1 X151.396 Y102.333 E.03977
G1 X150.863 Y102.333
G1 X149.948 Y101.417 E.03977
G1 X149.414 Y101.417
G1 X150.33 Y102.333 E.03977
G1 X149.796 Y102.333
G1 X148.881 Y101.417 E.03977
G1 X148.348 Y101.417
G1 X149.263 Y102.333 E.03977
G1 X148.73 Y102.333
G1 X147.815 Y101.417 E.03977
G1 X147.281 Y101.417
G1 X148.197 Y102.333 E.03977
G1 X147.663 Y102.333
G1 X146.748 Y101.417 E.03977
G1 X146.215 Y101.417
G1 X147.13 Y102.333 E.03977
G1 X146.597 Y102.333
G1 X145.682 Y101.417 E.03977
G1 X145.148 Y101.417
G1 X146.064 Y102.333 E.03977
G1 X145.53 Y102.333
G1 X144.615 Y101.417 E.03977
G1 X144.082 Y101.417
G1 X144.997 Y102.333 E.03977
G1 X144.464 Y102.333
G1 X143.549 Y101.417 E.03977
G1 X143.015 Y101.417
G1 X143.931 Y102.333 E.03977
G1 X143.397 Y102.333
G1 X142.482 Y101.417 E.03977
M73 P96 R1
G1 X141.949 Y101.417
G1 X142.864 Y102.333 E.03977
G1 X142.331 Y102.333
G1 X141.416 Y101.417 E.03977
G1 X140.882 Y101.417
G1 X141.798 Y102.333 E.03977
G1 X141.264 Y102.333
G1 X140.349 Y101.417 E.03977
G1 X139.816 Y101.417
G1 X140.731 Y102.333 E.03977
G1 X140.198 Y102.333
G1 X139.283 Y101.417 E.03977
G1 X138.749 Y101.417
G1 X139.665 Y102.333 E.03977
G1 X139.131 Y102.333
G1 X138.216 Y101.417 E.03977
G1 X137.683 Y101.417
G1 X138.598 Y102.333 E.03977
G1 X138.065 Y102.333
G1 X137.15 Y101.417 E.03977
G1 X136.616 Y101.417
G1 X137.532 Y102.333 E.03977
G1 X136.998 Y102.333
G1 X136.083 Y101.417 E.03977
G1 X135.55 Y101.417
G1 X136.465 Y102.333 E.03977
G1 X135.932 Y102.333
G1 X135.017 Y101.417 E.03977
G1 X134.483 Y101.417
G1 X135.398 Y102.333 E.03977
G1 X134.865 Y102.333
G1 X133.95 Y101.417 E.03977
G1 X133.417 Y101.417
G1 X134.332 Y102.333 E.03977
G1 X133.799 Y102.333
G1 X132.883 Y101.417 E.03977
G1 X132.35 Y101.417
G1 X133.265 Y102.333 E.03977
G1 X132.732 Y102.333
G1 X131.817 Y101.417 E.03977
G1 X131.284 Y101.417
G1 X132.199 Y102.333 E.03977
G1 X131.666 Y102.333
G1 X130.75 Y101.417 E.03977
G1 X130.217 Y101.417
G1 X131.132 Y102.333 E.03977
G1 X130.599 Y102.333
G1 X129.684 Y101.417 E.03977
G1 X129.417 Y101.684
G1 X130.333 Y102.599 E.03977
G1 X130.333 Y103.133
G1 X129.417 Y102.217 E.03977
G1 X129.417 Y102.751
G1 X130.333 Y103.666 E.03977
G1 X130.333 Y104.199
G1 X129.417 Y103.284 E.03977
G1 X129.417 Y103.817
G1 X130.333 Y104.732 E.03977
G1 X130.333 Y105.266
G1 X129.417 Y104.35 E.03977
G1 X129.417 Y104.884
G1 X130.333 Y105.799 E.03977
G1 X130.333 Y106.332
G1 X129.417 Y105.417 E.03977
G1 X129.417 Y105.95
G1 X130.333 Y106.865 E.03977
G1 X130.333 Y107.399
G1 X129.417 Y106.483 E.03977
G1 X129.417 Y107.017
G1 X130.333 Y107.932 E.03977
G1 X130.333 Y108.465
G1 X129.417 Y107.55 E.03977
G1 X129.417 Y108.083
G1 X130.333 Y108.998 E.03977
G1 X130.333 Y109.532
G1 X129.417 Y108.616 E.03977
G1 X129.417 Y109.15
G1 X130.333 Y110.065 E.03977
G1 X130.333 Y110.598
G1 X129.417 Y109.683 E.03977
G1 X129.417 Y110.216
G1 X130.333 Y111.131 E.03977
G1 X130.333 Y111.665
G1 X129.417 Y110.749 E.03977
G1 X129.417 Y111.283
G1 X130.333 Y112.198 E.03977
G1 X130.333 Y112.731
G1 X129.417 Y111.816 E.03977
G1 X129.417 Y112.349
G1 X130.333 Y113.264 E.03977
G1 X130.333 Y113.798
G1 X129.417 Y112.882 E.03977
G1 X129.417 Y113.416
G1 X130.333 Y114.331 E.03977
G1 X130.333 Y114.864
G1 X129.417 Y113.949 E.03977
G1 X129.417 Y114.482
G1 X130.333 Y115.398 E.03977
G1 X130.333 Y115.931
G1 X129.417 Y115.016 E.03977
G1 X129.417 Y115.549
G1 X130.333 Y116.464 E.03977
G1 X130.333 Y116.997
G1 X129.417 Y116.082 E.03977
G1 X129.417 Y116.615
G1 X130.333 Y117.531 E.03977
G1 X130.333 Y118.064
G1 X129.417 Y117.149 E.03977
G1 X129.417 Y117.682
G1 X130.333 Y118.597 E.03977
G1 X130.333 Y119.13
G1 X129.417 Y118.215 E.03977
G1 X129.417 Y118.748
G1 X130.333 Y119.664 E.03977
G1 X130.333 Y120.197
G1 X129.417 Y119.282 E.03977
G1 X129.417 Y119.815
G1 X130.333 Y120.73 E.03977
G1 X130.333 Y121.263
G1 X129.417 Y120.348 E.03977
G1 X129.417 Y120.881
G1 X130.333 Y121.797 E.03977
G1 X130.333 Y122.33
G1 X129.417 Y121.415 E.03977
G1 X129.417 Y121.948
G1 X130.333 Y122.863 E.03977
G1 X130.333 Y123.396
G1 X129.417 Y122.481 E.03977
G1 X129.417 Y123.014
G1 X130.333 Y123.93 E.03977
G1 X130.333 Y124.463
G1 X129.417 Y123.548 E.03977
G1 X129.417 Y124.081
G1 X130.333 Y124.996 E.03977
G1 X130.333 Y125.529
G1 X129.417 Y124.614 E.03977
; WIPE_START
M204 S6000
G1 X130.333 Y125.529 E-.49185
G1 X130.333 Y124.996 E-.20264
G1 X130.211 Y124.874 E-.06551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.73 Y119.603 Z11 F42000
G1 X153.667 Y102.471 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X154.583 Y103.386 E.03977
G1 X154.583 Y103.919
G1 X153.667 Y103.004 E.03977
G1 X153.667 Y103.537
G1 X154.583 Y104.453 E.03977
G1 X154.583 Y104.986
G1 X153.667 Y104.071 E.03977
G1 X153.667 Y104.604
G1 X154.583 Y105.519 E.03977
G1 X154.583 Y106.052
G1 X153.667 Y105.137 E.03977
G1 X153.667 Y105.67
G1 X154.583 Y106.586 E.03977
G1 X154.583 Y107.119
G1 X153.667 Y106.204 E.03977
G1 X153.667 Y106.737
G1 X154.583 Y107.652 E.03977
G1 X154.583 Y108.185
G1 X153.667 Y107.27 E.03977
G1 X153.667 Y107.803
G1 X154.583 Y108.719 E.03977
G1 X154.583 Y109.252
G1 X153.667 Y108.337 E.03977
G1 X153.667 Y108.87
G1 X154.583 Y109.785 E.03977
G1 X154.583 Y110.318
G1 X153.667 Y109.403 E.03977
G1 X153.667 Y109.936
G1 X154.583 Y110.852 E.03977
G1 X154.583 Y111.385
G1 X153.667 Y110.47 E.03977
G1 X153.667 Y111.003
G1 X154.583 Y111.918 E.03977
G1 X154.583 Y112.451
G1 X153.667 Y111.536 E.03977
G1 X153.667 Y112.069
G1 X154.583 Y112.985 E.03977
G1 X154.583 Y113.518
G1 X153.667 Y112.603 E.03977
G1 X153.667 Y113.136
G1 X154.583 Y114.051 E.03977
G1 X154.583 Y114.584
G1 X153.667 Y113.669 E.03977
G1 X153.667 Y114.202
G1 X154.583 Y115.118 E.03977
G1 X154.583 Y115.651
G1 X153.667 Y114.736 E.03977
G1 X153.667 Y115.269
M73 P96 R0
G1 X154.583 Y116.184 E.03977
G1 X154.583 Y116.717
G1 X153.667 Y115.802 E.03977
G1 X153.667 Y116.335
G1 X154.583 Y117.251 E.03977
G1 X154.583 Y117.784
G1 X153.667 Y116.869 E.03977
G1 X153.667 Y117.402
G1 X154.583 Y118.317 E.03977
G1 X154.583 Y118.85
G1 X153.667 Y117.935 E.03977
G1 X153.667 Y118.468
G1 X154.583 Y119.384 E.03977
G1 X154.583 Y119.917
G1 X153.667 Y119.002 E.03977
G1 X153.667 Y119.535
G1 X154.583 Y120.45 E.03977
G1 X154.583 Y120.984
G1 X153.667 Y120.068 E.03977
G1 X153.667 Y120.602
G1 X154.583 Y121.517 E.03977
G1 X154.583 Y122.05
G1 X153.667 Y121.135 E.03977
G1 X153.667 Y121.668
G1 X154.583 Y122.583 E.03977
G1 X154.583 Y123.117
G1 X153.667 Y122.201 E.03977
G1 X153.667 Y122.735
G1 X154.583 Y123.65 E.03977
G1 X154.583 Y124.183
G1 X153.667 Y123.268 E.03977
G1 X153.667 Y123.801
G1 X154.583 Y124.716 E.03977
G1 X154.583 Y125.25
G1 X153.667 Y124.334 E.03977
G1 X153.667 Y124.868
G1 X154.583 Y125.783 E.03977
G1 X154.583 Y126.316
G1 X153.667 Y125.401 E.03977
G1 X153.401 Y125.667
G1 X154.316 Y126.583 E.03977
G1 X153.783 Y126.583
G1 X152.867 Y125.667 E.03977
G1 X152.334 Y125.667
G1 X153.249 Y126.583 E.03977
G1 X152.716 Y126.583
G1 X151.801 Y125.667 E.03977
G1 X151.268 Y125.667
G1 X152.183 Y126.583 E.03977
G1 X151.65 Y126.583
G1 X150.734 Y125.667 E.03977
G1 X150.201 Y125.667
G1 X151.116 Y126.583 E.03977
G1 X150.583 Y126.583
G1 X149.668 Y125.667 E.03977
G1 X149.135 Y125.667
G1 X150.05 Y126.583 E.03977
G1 X149.517 Y126.583
G1 X148.601 Y125.667 E.03977
G1 X148.068 Y125.667
G1 X148.983 Y126.583 E.03977
G1 X148.45 Y126.583
G1 X147.535 Y125.667 E.03977
G1 X147.002 Y125.667
M73 P97 R0
G1 X147.917 Y126.583 E.03977
G1 X147.384 Y126.583
G1 X146.468 Y125.667 E.03977
G1 X145.935 Y125.667
G1 X146.85 Y126.583 E.03977
G1 X146.317 Y126.583
G1 X145.402 Y125.667 E.03977
G1 X144.869 Y125.667
G1 X145.784 Y126.583 E.03977
G1 X145.251 Y126.583
G1 X144.335 Y125.667 E.03977
G1 X143.802 Y125.667
G1 X144.717 Y126.583 E.03977
G1 X144.184 Y126.583
G1 X143.269 Y125.667 E.03977
G1 X142.736 Y125.667
G1 X143.651 Y126.583 E.03977
G1 X143.118 Y126.583
G1 X142.202 Y125.667 E.03977
G1 X141.669 Y125.667
G1 X142.584 Y126.583 E.03977
G1 X142.051 Y126.583
G1 X141.136 Y125.667 E.03977
G1 X140.603 Y125.667
G1 X141.518 Y126.583 E.03977
G1 X140.984 Y126.583
G1 X140.069 Y125.667 E.03977
G1 X139.536 Y125.667
G1 X140.451 Y126.583 E.03977
G1 X139.918 Y126.583
G1 X139.003 Y125.667 E.03977
G1 X138.469 Y125.667
G1 X139.385 Y126.583 E.03977
G1 X138.851 Y126.583
G1 X137.936 Y125.667 E.03977
G1 X137.403 Y125.667
G1 X138.318 Y126.583 E.03977
G1 X137.785 Y126.583
G1 X136.87 Y125.667 E.03977
G1 X136.336 Y125.667
G1 X137.252 Y126.583 E.03977
G1 X136.718 Y126.583
G1 X135.803 Y125.667 E.03977
G1 X135.27 Y125.667
G1 X136.185 Y126.583 E.03977
G1 X135.652 Y126.583
G1 X134.737 Y125.667 E.03977
G1 X134.203 Y125.667
G1 X135.119 Y126.583 E.03977
G1 X134.585 Y126.583
G1 X133.67 Y125.667 E.03977
G1 X133.137 Y125.667
G1 X134.052 Y126.583 E.03977
G1 X133.519 Y126.583
G1 X132.604 Y125.667 E.03977
G1 X132.07 Y125.667
G1 X132.986 Y126.583 E.03977
G1 X132.452 Y126.583
G1 X131.537 Y125.667 E.03977
G1 X131.004 Y125.667
G1 X131.919 Y126.583 E.03977
G1 X131.386 Y126.583
G1 X130.471 Y125.667 E.03977
G1 X130.853 Y126.583
G1 X129.417 Y125.147 E.06237
G1 X129.417 Y125.681
G1 X130.319 Y126.583 E.0392
G1 X129.786 Y126.583
G1 X129.417 Y126.214 E.01602
; WIPE_START
M204 S6000
G1 X129.786 Y126.583 E-.19815
G1 X130.319 Y126.583 E-.20264
G1 X129.651 Y125.914 E-.35921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.113 Y120.583 Z11 F42000
G1 X153.662 Y102.476 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164984
G1 F15000
M204 S6000
G1 X153.711 Y102.338 E.00146
G1 X153.662 Y102.289 E.00068
G1 X153.524 Y102.338 E.00146
; WIPE_START
G1 X153.662 Y102.289 E-.30838
G1 X153.711 Y102.338 E-.14323
G1 X153.662 Y102.476 E-.30838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.262 Y107.869 Z11 F42000
G1 X130.417 Y125.69 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.122564
G1 F15000
M204 S6000
G1 X130.357 Y125.682 E.00039
; LINE_WIDTH: 0.160227
G1 X130.289 Y125.663 E.00067
G1 X130.338 Y125.525 E.0014
; OBJECT_ID: 66
; WIPE_START
G1 X130.289 Y125.663 E-.51379
G1 X130.357 Y125.682 E-.24621
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 77
M625
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.407 Y133.314 Z11 F42000
G1 X130.54 Y153.46 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X130.54 Y130.54 E.70427
G1 X153.46 Y130.54 E.70427
G1 X153.46 Y153.46 E.70427
G1 X130.6 Y153.46 E.70242
; WIPE_START
M204 S6000
G1 X130.595 Y151.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.156 Y152.501 Z11 F42000
G1 X154.79 Y154.79 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X129.21 Y154.79 E.786
G1 X129.21 Y129.21 E.786
G1 X154.79 Y129.21 E.786
G1 X154.79 Y154.73 E.78416
; WIPE_START
M204 S6000
G1 X152.79 Y154.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.337 Y147.122 Z11 F42000
G1 X154.583 Y129.786 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X154.214 Y129.417 E.01603
G1 X153.681 Y129.417
G1 X154.583 Y130.319 E.0392
G1 X154.583 Y130.853
G1 X153.147 Y129.417 E.06237
G1 X152.614 Y129.417
G1 X153.529 Y130.333 E.03977
G1 X152.996 Y130.333
G1 X152.081 Y129.417 E.03977
G1 X151.547 Y129.417
G1 X152.463 Y130.333 E.03977
G1 X151.929 Y130.333
G1 X151.014 Y129.417 E.03977
G1 X150.481 Y129.417
G1 X151.396 Y130.333 E.03977
G1 X150.863 Y130.333
G1 X149.948 Y129.417 E.03977
G1 X149.414 Y129.417
G1 X150.33 Y130.333 E.03977
G1 X149.796 Y130.333
G1 X148.881 Y129.417 E.03977
G1 X148.348 Y129.417
G1 X149.263 Y130.333 E.03977
G1 X148.73 Y130.333
G1 X147.815 Y129.417 E.03977
G1 X147.281 Y129.417
G1 X148.197 Y130.333 E.03977
G1 X147.663 Y130.333
G1 X146.748 Y129.417 E.03977
G1 X146.215 Y129.417
G1 X147.13 Y130.333 E.03977
G1 X146.597 Y130.333
G1 X145.682 Y129.417 E.03977
G1 X145.148 Y129.417
G1 X146.064 Y130.333 E.03977
G1 X145.53 Y130.333
G1 X144.615 Y129.417 E.03977
G1 X144.082 Y129.417
G1 X144.997 Y130.333 E.03977
G1 X144.464 Y130.333
G1 X143.549 Y129.417 E.03977
G1 X143.015 Y129.417
G1 X143.931 Y130.333 E.03977
G1 X143.397 Y130.333
G1 X142.482 Y129.417 E.03977
G1 X141.949 Y129.417
G1 X142.864 Y130.333 E.03977
G1 X142.331 Y130.333
G1 X141.416 Y129.417 E.03977
G1 X140.882 Y129.417
G1 X141.798 Y130.333 E.03977
G1 X141.264 Y130.333
G1 X140.349 Y129.417 E.03977
G1 X139.816 Y129.417
G1 X140.731 Y130.333 E.03977
G1 X140.198 Y130.333
G1 X139.283 Y129.417 E.03977
G1 X138.749 Y129.417
G1 X139.665 Y130.333 E.03977
G1 X139.131 Y130.333
G1 X138.216 Y129.417 E.03977
G1 X137.683 Y129.417
G1 X138.598 Y130.333 E.03977
G1 X138.065 Y130.333
G1 X137.15 Y129.417 E.03977
G1 X136.616 Y129.417
G1 X137.532 Y130.333 E.03977
G1 X136.998 Y130.333
G1 X136.083 Y129.417 E.03977
G1 X135.55 Y129.417
G1 X136.465 Y130.333 E.03977
G1 X135.932 Y130.333
G1 X135.017 Y129.417 E.03977
G1 X134.483 Y129.417
G1 X135.398 Y130.333 E.03977
G1 X134.865 Y130.333
G1 X133.95 Y129.417 E.03977
G1 X133.417 Y129.417
G1 X134.332 Y130.333 E.03977
G1 X133.799 Y130.333
G1 X132.883 Y129.417 E.03977
G1 X132.35 Y129.417
G1 X133.265 Y130.333 E.03977
G1 X132.732 Y130.333
G1 X131.817 Y129.417 E.03977
G1 X131.284 Y129.417
G1 X132.199 Y130.333 E.03977
G1 X131.666 Y130.333
G1 X130.75 Y129.417 E.03977
G1 X130.217 Y129.417
G1 X131.132 Y130.333 E.03977
G1 X130.599 Y130.333
G1 X129.684 Y129.417 E.03977
G1 X129.417 Y129.684
G1 X130.333 Y130.599 E.03977
G1 X130.333 Y131.133
G1 X129.417 Y130.217 E.03977
G1 X129.417 Y130.751
G1 X130.333 Y131.666 E.03977
G1 X130.333 Y132.199
G1 X129.417 Y131.284 E.03977
G1 X129.417 Y131.817
G1 X130.333 Y132.732 E.03977
G1 X130.333 Y133.266
G1 X129.417 Y132.35 E.03977
G1 X129.417 Y132.884
G1 X130.333 Y133.799 E.03977
G1 X130.333 Y134.332
G1 X129.417 Y133.417 E.03977
G1 X129.417 Y133.95
G1 X130.333 Y134.865 E.03977
G1 X130.333 Y135.399
G1 X129.417 Y134.483 E.03977
G1 X129.417 Y135.017
G1 X130.333 Y135.932 E.03977
G1 X130.333 Y136.465
G1 X129.417 Y135.55 E.03977
G1 X129.417 Y136.083
G1 X130.333 Y136.998 E.03977
G1 X130.333 Y137.532
G1 X129.417 Y136.616 E.03977
G1 X129.417 Y137.15
G1 X130.333 Y138.065 E.03977
G1 X130.333 Y138.598
G1 X129.417 Y137.683 E.03977
G1 X129.417 Y138.216
G1 X130.333 Y139.131 E.03977
G1 X130.333 Y139.665
G1 X129.417 Y138.749 E.03977
G1 X129.417 Y139.283
G1 X130.333 Y140.198 E.03977
G1 X130.333 Y140.731
G1 X129.417 Y139.816 E.03977
G1 X129.417 Y140.349
G1 X130.333 Y141.264 E.03977
G1 X130.333 Y141.798
G1 X129.417 Y140.882 E.03977
G1 X129.417 Y141.416
G1 X130.333 Y142.331 E.03977
G1 X130.333 Y142.864
G1 X129.417 Y141.949 E.03977
G1 X129.417 Y142.482
G1 X130.333 Y143.397 E.03977
G1 X130.333 Y143.931
G1 X129.417 Y143.015 E.03977
G1 X129.417 Y143.549
G1 X130.333 Y144.464 E.03977
G1 X130.333 Y144.997
G1 X129.417 Y144.082 E.03977
G1 X129.417 Y144.615
G1 X130.333 Y145.531 E.03977
G1 X130.333 Y146.064
G1 X129.417 Y145.149 E.03977
G1 X129.417 Y145.682
G1 X130.333 Y146.597 E.03977
G1 X130.333 Y147.13
G1 X129.417 Y146.215 E.03977
G1 X129.417 Y146.748
G1 X130.333 Y147.664 E.03977
G1 X130.333 Y148.197
G1 X129.417 Y147.282 E.03977
G1 X129.417 Y147.815
G1 X130.333 Y148.73 E.03977
G1 X130.333 Y149.263
G1 X129.417 Y148.348 E.03977
G1 X129.417 Y148.881
G1 X130.333 Y149.797 E.03977
G1 X130.333 Y150.33
G1 X129.417 Y149.415 E.03977
G1 X129.417 Y149.948
G1 X130.333 Y150.863 E.03977
G1 X130.333 Y151.396
G1 X129.417 Y150.481 E.03977
G1 X129.417 Y151.014
G1 X130.333 Y151.93 E.03977
G1 X130.333 Y152.463
G1 X129.417 Y151.548 E.03977
G1 X129.417 Y152.081
G1 X130.333 Y152.996 E.03977
G1 X130.333 Y153.529
G1 X129.417 Y152.614 E.03977
; WIPE_START
M204 S6000
G1 X130.333 Y153.529 E-.49185
G1 X130.333 Y152.996 E-.20264
G1 X130.211 Y152.874 E-.06551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.73 Y147.603 Z11 F42000
G1 X153.667 Y130.471 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X154.583 Y131.386 E.03977
G1 X154.583 Y131.919
G1 X153.667 Y131.004 E.03977
G1 X153.667 Y131.537
G1 X154.583 Y132.452 E.03977
G1 X154.583 Y132.986
G1 X153.667 Y132.071 E.03977
G1 X153.667 Y132.604
G1 X154.583 Y133.519 E.03977
G1 X154.583 Y134.052
G1 X153.667 Y133.137 E.03977
G1 X153.667 Y133.67
G1 X154.583 Y134.586 E.03977
G1 X154.583 Y135.119
G1 X153.667 Y134.204 E.03977
G1 X153.667 Y134.737
G1 X154.583 Y135.652 E.03977
G1 X154.583 Y136.185
G1 X153.667 Y135.27 E.03977
G1 X153.667 Y135.803
G1 X154.583 Y136.719 E.03977
G1 X154.583 Y137.252
G1 X153.667 Y136.337 E.03977
G1 X153.667 Y136.87
G1 X154.583 Y137.785 E.03977
G1 X154.583 Y138.318
G1 X153.667 Y137.403 E.03977
G1 X153.667 Y137.936
G1 X154.583 Y138.852 E.03977
G1 X154.583 Y139.385
G1 X153.667 Y138.47 E.03977
G1 X153.667 Y139.003
G1 X154.583 Y139.918 E.03977
G1 X154.583 Y140.451
G1 X153.667 Y139.536 E.03977
G1 X153.667 Y140.069
G1 X154.583 Y140.985 E.03977
G1 X154.583 Y141.518
G1 X153.667 Y140.603 E.03977
G1 X153.667 Y141.136
G1 X154.583 Y142.051 E.03977
G1 X154.583 Y142.584
G1 X153.667 Y141.669 E.03977
G1 X153.667 Y142.202
G1 X154.583 Y143.118 E.03977
G1 X154.583 Y143.651
G1 X153.667 Y142.736 E.03977
G1 X153.667 Y143.269
G1 X154.583 Y144.184 E.03977
G1 X154.583 Y144.717
G1 X153.667 Y143.802 E.03977
G1 X153.667 Y144.335
G1 X154.583 Y145.251 E.03977
G1 X154.583 Y145.784
G1 X153.667 Y144.869 E.03977
G1 X153.667 Y145.402
G1 X154.583 Y146.317 E.03977
G1 X154.583 Y146.85
G1 X153.667 Y145.935 E.03977
G1 X153.667 Y146.468
G1 X154.583 Y147.384 E.03977
G1 X154.583 Y147.917
G1 X153.667 Y147.002 E.03977
G1 X153.667 Y147.535
G1 X154.583 Y148.45 E.03977
G1 X154.583 Y148.983
G1 X153.667 Y148.068 E.03977
G1 X153.667 Y148.601
G1 X154.583 Y149.517 E.03977
G1 X154.583 Y150.05
G1 X153.667 Y149.135 E.03977
G1 X153.667 Y149.668
G1 X154.583 Y150.583 E.03977
G1 X154.583 Y151.117
G1 X153.667 Y150.201 E.03977
G1 X153.667 Y150.735
G1 X154.583 Y151.65 E.03977
G1 X154.583 Y152.183
G1 X153.667 Y151.268 E.03977
G1 X153.667 Y151.801
G1 X154.583 Y152.716 E.03977
G1 X154.583 Y153.25
G1 X153.667 Y152.334 E.03977
G1 X153.667 Y152.868
G1 X154.583 Y153.783 E.03977
G1 X154.583 Y154.316
G1 X153.667 Y153.401 E.03977
G1 X153.401 Y153.667
G1 X154.316 Y154.583 E.03977
G1 X153.783 Y154.583
G1 X152.867 Y153.667 E.03977
G1 X152.334 Y153.667
G1 X153.249 Y154.583 E.03977
G1 X152.716 Y154.583
G1 X151.801 Y153.667 E.03977
G1 X151.268 Y153.667
G1 X152.183 Y154.583 E.03977
G1 X151.65 Y154.583
G1 X150.734 Y153.667 E.03977
G1 X150.201 Y153.667
G1 X151.116 Y154.583 E.03977
G1 X150.583 Y154.583
G1 X149.668 Y153.667 E.03977
G1 X149.135 Y153.667
G1 X150.05 Y154.583 E.03977
G1 X149.517 Y154.583
G1 X148.601 Y153.667 E.03977
G1 X148.068 Y153.667
G1 X148.983 Y154.583 E.03977
G1 X148.45 Y154.583
G1 X147.535 Y153.667 E.03977
G1 X147.002 Y153.667
G1 X147.917 Y154.583 E.03977
G1 X147.384 Y154.583
G1 X146.468 Y153.667 E.03977
G1 X145.935 Y153.667
G1 X146.85 Y154.583 E.03977
G1 X146.317 Y154.583
G1 X145.402 Y153.667 E.03977
G1 X144.869 Y153.667
G1 X145.784 Y154.583 E.03977
G1 X145.251 Y154.583
G1 X144.335 Y153.667 E.03977
G1 X143.802 Y153.667
G1 X144.717 Y154.583 E.03977
G1 X144.184 Y154.583
G1 X143.269 Y153.667 E.03977
G1 X142.736 Y153.667
G1 X143.651 Y154.583 E.03977
G1 X143.118 Y154.583
G1 X142.202 Y153.667 E.03977
G1 X141.669 Y153.667
G1 X142.584 Y154.583 E.03977
G1 X142.051 Y154.583
G1 X141.136 Y153.667 E.03977
G1 X140.603 Y153.667
G1 X141.518 Y154.583 E.03977
G1 X140.984 Y154.583
G1 X140.069 Y153.667 E.03977
G1 X139.536 Y153.667
G1 X140.451 Y154.583 E.03977
G1 X139.918 Y154.583
G1 X139.003 Y153.667 E.03977
G1 X138.469 Y153.667
G1 X139.385 Y154.583 E.03977
G1 X138.851 Y154.583
G1 X137.936 Y153.667 E.03977
G1 X137.403 Y153.667
G1 X138.318 Y154.583 E.03977
G1 X137.785 Y154.583
G1 X136.87 Y153.667 E.03977
G1 X136.336 Y153.667
G1 X137.252 Y154.583 E.03977
G1 X136.718 Y154.583
G1 X135.803 Y153.667 E.03977
G1 X135.27 Y153.667
G1 X136.185 Y154.583 E.03977
G1 X135.652 Y154.583
G1 X134.737 Y153.667 E.03977
G1 X134.203 Y153.667
G1 X135.119 Y154.583 E.03977
G1 X134.585 Y154.583
G1 X133.67 Y153.667 E.03977
G1 X133.137 Y153.667
G1 X134.052 Y154.583 E.03977
G1 X133.519 Y154.583
G1 X132.604 Y153.667 E.03977
G1 X132.07 Y153.667
G1 X132.986 Y154.583 E.03977
G1 X132.452 Y154.583
G1 X131.537 Y153.667 E.03977
G1 X131.004 Y153.667
G1 X131.919 Y154.583 E.03977
G1 X131.386 Y154.583
G1 X130.471 Y153.667 E.03977
G1 X130.853 Y154.583
G1 X129.417 Y153.147 E.06237
G1 X129.417 Y153.681
G1 X130.319 Y154.583 E.0392
G1 X129.786 Y154.583
G1 X129.417 Y154.214 E.01602
; WIPE_START
M204 S6000
G1 X129.786 Y154.583 E-.19815
G1 X130.319 Y154.583 E-.20264
G1 X129.651 Y153.914 E-.35921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.113 Y148.583 Z11 F42000
G1 X153.662 Y130.476 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164984
M73 P98 R0
G1 F15000
M204 S6000
G1 X153.711 Y130.337 E.00146
G1 X153.662 Y130.289 E.00068
G1 X153.524 Y130.338 E.00146
; WIPE_START
G1 X153.662 Y130.289 E-.30838
G1 X153.711 Y130.337 E-.14323
G1 X153.662 Y130.476 E-.30838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.262 Y135.869 Z11 F42000
G1 X130.417 Y153.69 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.122564
G1 F15000
M204 S6000
G1 X130.357 Y153.682 E.00039
; LINE_WIDTH: 0.160227
G1 X130.289 Y153.663 E.00067
G1 X130.338 Y153.524 E.0014
; OBJECT_ID: 88
; WIPE_START
G1 X130.289 Y153.663 E-.51379
G1 X130.357 Y153.682 E-.24621
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 88
M624 BAAAAAAAAAA=
M204 S10000
G1 X123.561 Y150.208 Z11 F42000
G1 X102.54 Y139.46 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X102.54 Y116.54 E.70427
G1 X125.46 Y116.54 E.70427
G1 X125.46 Y139.46 E.70427
G1 X102.6 Y139.46 E.70242
; WIPE_START
M204 S6000
G1 X102.595 Y137.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.156 Y138.501 Z11 F42000
G1 X126.79 Y140.79 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X101.21 Y140.79 E.786
G1 X101.21 Y115.21 E.786
G1 X126.79 Y115.21 E.786
G1 X126.79 Y140.73 E.78416
; WIPE_START
M204 S6000
G1 X124.79 Y140.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.337 Y133.122 Z11 F42000
G1 X126.583 Y115.786 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X126.214 Y115.417 E.01603
G1 X125.681 Y115.417
G1 X126.583 Y116.319 E.0392
G1 X126.583 Y116.853
G1 X125.147 Y115.417 E.06237
G1 X124.614 Y115.417
G1 X125.529 Y116.333 E.03977
G1 X124.996 Y116.333
G1 X124.081 Y115.417 E.03977
G1 X123.548 Y115.417
G1 X124.463 Y116.333 E.03977
G1 X123.929 Y116.333
G1 X123.014 Y115.417 E.03977
G1 X122.481 Y115.417
G1 X123.396 Y116.333 E.03977
G1 X122.863 Y116.333
G1 X121.948 Y115.417 E.03977
G1 X121.414 Y115.417
G1 X122.33 Y116.333 E.03977
G1 X121.796 Y116.333
G1 X120.881 Y115.417 E.03977
G1 X120.348 Y115.417
G1 X121.263 Y116.333 E.03977
G1 X120.73 Y116.333
G1 X119.815 Y115.417 E.03977
G1 X119.281 Y115.417
G1 X120.197 Y116.333 E.03977
G1 X119.663 Y116.333
G1 X118.748 Y115.417 E.03977
G1 X118.215 Y115.417
G1 X119.13 Y116.333 E.03977
G1 X118.597 Y116.333
G1 X117.682 Y115.417 E.03977
G1 X117.148 Y115.417
G1 X118.064 Y116.333 E.03977
G1 X117.53 Y116.333
G1 X116.615 Y115.417 E.03977
G1 X116.082 Y115.417
G1 X116.997 Y116.333 E.03977
G1 X116.464 Y116.333
G1 X115.549 Y115.417 E.03977
G1 X115.015 Y115.417
G1 X115.931 Y116.333 E.03977
G1 X115.397 Y116.333
G1 X114.482 Y115.417 E.03977
G1 X113.949 Y115.417
G1 X114.864 Y116.333 E.03977
G1 X114.331 Y116.333
G1 X113.416 Y115.417 E.03977
G1 X112.882 Y115.417
G1 X113.798 Y116.333 E.03977
G1 X113.264 Y116.333
G1 X112.349 Y115.417 E.03977
G1 X111.816 Y115.417
G1 X112.731 Y116.333 E.03977
G1 X112.198 Y116.333
G1 X111.283 Y115.417 E.03977
G1 X110.749 Y115.417
G1 X111.665 Y116.333 E.03977
G1 X111.131 Y116.333
G1 X110.216 Y115.417 E.03977
G1 X109.683 Y115.417
G1 X110.598 Y116.333 E.03977
G1 X110.065 Y116.333
G1 X109.15 Y115.417 E.03977
G1 X108.616 Y115.417
G1 X109.532 Y116.333 E.03977
G1 X108.998 Y116.333
G1 X108.083 Y115.417 E.03977
G1 X107.55 Y115.417
G1 X108.465 Y116.333 E.03977
G1 X107.932 Y116.333
G1 X107.017 Y115.417 E.03977
G1 X106.483 Y115.417
G1 X107.399 Y116.333 E.03977
G1 X106.865 Y116.333
G1 X105.95 Y115.417 E.03977
G1 X105.417 Y115.417
G1 X106.332 Y116.333 E.03977
G1 X105.799 Y116.333
G1 X104.883 Y115.417 E.03977
G1 X104.35 Y115.417
G1 X105.265 Y116.333 E.03977
G1 X104.732 Y116.333
G1 X103.817 Y115.417 E.03977
G1 X103.284 Y115.417
G1 X104.199 Y116.333 E.03977
G1 X103.666 Y116.333
G1 X102.75 Y115.417 E.03977
G1 X102.217 Y115.417
G1 X103.132 Y116.333 E.03977
G1 X102.599 Y116.333
G1 X101.684 Y115.417 E.03977
G1 X101.417 Y115.684
G1 X102.333 Y116.599 E.03977
G1 X102.333 Y117.133
G1 X101.417 Y116.217 E.03977
G1 X101.417 Y116.751
G1 X102.333 Y117.666 E.03977
G1 X102.333 Y118.199
G1 X101.417 Y117.284 E.03977
G1 X101.417 Y117.817
G1 X102.333 Y118.732 E.03977
G1 X102.333 Y119.266
G1 X101.417 Y118.35 E.03977
G1 X101.417 Y118.884
G1 X102.333 Y119.799 E.03977
G1 X102.333 Y120.332
G1 X101.417 Y119.417 E.03977
G1 X101.417 Y119.95
G1 X102.333 Y120.865 E.03977
G1 X102.333 Y121.399
G1 X101.417 Y120.483 E.03977
G1 X101.417 Y121.017
G1 X102.333 Y121.932 E.03977
G1 X102.333 Y122.465
G1 X101.417 Y121.55 E.03977
G1 X101.417 Y122.083
G1 X102.333 Y122.998 E.03977
G1 X102.333 Y123.532
G1 X101.417 Y122.616 E.03977
G1 X101.417 Y123.15
G1 X102.333 Y124.065 E.03977
G1 X102.333 Y124.598
G1 X101.417 Y123.683 E.03977
G1 X101.417 Y124.216
G1 X102.333 Y125.131 E.03977
G1 X102.333 Y125.665
G1 X101.417 Y124.749 E.03977
G1 X101.417 Y125.283
G1 X102.333 Y126.198 E.03977
G1 X102.333 Y126.731
G1 X101.417 Y125.816 E.03977
G1 X101.417 Y126.349
G1 X102.333 Y127.264 E.03977
G1 X102.333 Y127.798
G1 X101.417 Y126.882 E.03977
G1 X101.417 Y127.416
G1 X102.333 Y128.331 E.03977
G1 X102.333 Y128.864
G1 X101.417 Y127.949 E.03977
G1 X101.417 Y128.482
G1 X102.333 Y129.398 E.03977
G1 X102.333 Y129.931
G1 X101.417 Y129.016 E.03977
G1 X101.417 Y129.549
G1 X102.333 Y130.464 E.03977
G1 X102.333 Y130.997
G1 X101.417 Y130.082 E.03977
G1 X101.417 Y130.615
G1 X102.333 Y131.531 E.03977
G1 X102.333 Y132.064
G1 X101.417 Y131.149 E.03977
G1 X101.417 Y131.682
G1 X102.333 Y132.597 E.03977
G1 X102.333 Y133.13
G1 X101.417 Y132.215 E.03977
G1 X101.417 Y132.748
G1 X102.333 Y133.664 E.03977
G1 X102.333 Y134.197
G1 X101.417 Y133.282 E.03977
G1 X101.417 Y133.815
G1 X102.333 Y134.73 E.03977
G1 X102.333 Y135.263
G1 X101.417 Y134.348 E.03977
G1 X101.417 Y134.881
G1 X102.333 Y135.797 E.03977
G1 X102.333 Y136.33
G1 X101.417 Y135.415 E.03977
G1 X101.417 Y135.948
G1 X102.333 Y136.863 E.03977
G1 X102.333 Y137.396
G1 X101.417 Y136.481 E.03977
G1 X101.417 Y137.014
G1 X102.333 Y137.93 E.03977
G1 X102.333 Y138.463
G1 X101.417 Y137.548 E.03977
G1 X101.417 Y138.081
G1 X102.333 Y138.996 E.03977
G1 X102.333 Y139.529
G1 X101.417 Y138.614 E.03977
; WIPE_START
M204 S6000
G1 X102.333 Y139.529 E-.49185
G1 X102.333 Y138.996 E-.20264
G1 X102.211 Y138.874 E-.06551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.73 Y133.603 Z11 F42000
G1 X125.667 Y116.471 Z11
G1 Z10.6
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X126.583 Y117.386 E.03977
G1 X126.583 Y117.919
G1 X125.667 Y117.004 E.03977
G1 X125.667 Y117.537
G1 X126.583 Y118.453 E.03977
G1 X126.583 Y118.986
G1 X125.667 Y118.071 E.03977
G1 X125.667 Y118.604
G1 X126.583 Y119.519 E.03977
G1 X126.583 Y120.052
G1 X125.667 Y119.137 E.03977
G1 X125.667 Y119.67
G1 X126.583 Y120.586 E.03977
G1 X126.583 Y121.119
G1 X125.667 Y120.204 E.03977
G1 X125.667 Y120.737
G1 X126.583 Y121.652 E.03977
G1 X126.583 Y122.185
G1 X125.667 Y121.27 E.03977
G1 X125.667 Y121.803
G1 X126.583 Y122.719 E.03977
G1 X126.583 Y123.252
G1 X125.667 Y122.337 E.03977
G1 X125.667 Y122.87
G1 X126.583 Y123.785 E.03977
G1 X126.583 Y124.318
G1 X125.667 Y123.403 E.03977
G1 X125.667 Y123.936
G1 X126.583 Y124.852 E.03977
G1 X126.583 Y125.385
G1 X125.667 Y124.47 E.03977
G1 X125.667 Y125.003
G1 X126.583 Y125.918 E.03977
G1 X126.583 Y126.451
G1 X125.667 Y125.536 E.03977
G1 X125.667 Y126.069
G1 X126.583 Y126.985 E.03977
G1 X126.583 Y127.518
G1 X125.667 Y126.603 E.03977
G1 X125.667 Y127.136
G1 X126.583 Y128.051 E.03977
G1 X126.583 Y128.584
G1 X125.667 Y127.669 E.03977
G1 X125.667 Y128.202
G1 X126.583 Y129.118 E.03977
G1 X126.583 Y129.651
G1 X125.667 Y128.736 E.03977
G1 X125.667 Y129.269
G1 X126.583 Y130.184 E.03977
G1 X126.583 Y130.717
G1 X125.667 Y129.802 E.03977
G1 X125.667 Y130.335
G1 X126.583 Y131.251 E.03977
G1 X126.583 Y131.784
G1 X125.667 Y130.869 E.03977
G1 X125.667 Y131.402
G1 X126.583 Y132.317 E.03977
G1 X126.583 Y132.85
G1 X125.667 Y131.935 E.03977
G1 X125.667 Y132.468
G1 X126.583 Y133.384 E.03977
G1 X126.583 Y133.917
G1 X125.667 Y133.002 E.03977
G1 X125.667 Y133.535
G1 X126.583 Y134.45 E.03977
G1 X126.583 Y134.984
G1 X125.667 Y134.068 E.03977
G1 X125.667 Y134.602
G1 X126.583 Y135.517 E.03977
G1 X126.583 Y136.05
G1 X125.667 Y135.135 E.03977
G1 X125.667 Y135.668
G1 X126.583 Y136.583 E.03977
G1 X126.583 Y137.117
G1 X125.667 Y136.201 E.03977
G1 X125.667 Y136.735
G1 X126.583 Y137.65 E.03977
G1 X126.583 Y138.183
G1 X125.667 Y137.268 E.03977
G1 X125.667 Y137.801
G1 X126.583 Y138.716 E.03977
G1 X126.583 Y139.25
G1 X125.667 Y138.334 E.03977
G1 X125.667 Y138.868
G1 X126.583 Y139.783 E.03977
G1 X126.583 Y140.316
G1 X125.667 Y139.401 E.03977
G1 X125.401 Y139.667
G1 X126.316 Y140.583 E.03977
G1 X125.783 Y140.583
G1 X124.867 Y139.667 E.03977
G1 X124.334 Y139.667
G1 X125.249 Y140.583 E.03977
G1 X124.716 Y140.583
G1 X123.801 Y139.667 E.03977
G1 X123.268 Y139.667
G1 X124.183 Y140.583 E.03977
G1 X123.65 Y140.583
G1 X122.734 Y139.667 E.03977
G1 X122.201 Y139.667
G1 X123.116 Y140.583 E.03977
G1 X122.583 Y140.583
G1 X121.668 Y139.667 E.03977
G1 X121.135 Y139.667
G1 X122.05 Y140.583 E.03977
G1 X121.517 Y140.583
G1 X120.601 Y139.667 E.03977
G1 X120.068 Y139.667
G1 X120.983 Y140.583 E.03977
G1 X120.45 Y140.583
G1 X119.535 Y139.667 E.03977
G1 X119.002 Y139.667
G1 X119.917 Y140.583 E.03977
G1 X119.384 Y140.583
G1 X118.468 Y139.667 E.03977
G1 X117.935 Y139.667
G1 X118.85 Y140.583 E.03977
G1 X118.317 Y140.583
G1 X117.402 Y139.667 E.03977
G1 X116.869 Y139.667
G1 X117.784 Y140.583 E.03977
G1 X117.251 Y140.583
G1 X116.335 Y139.667 E.03977
G1 X115.802 Y139.667
G1 X116.717 Y140.583 E.03977
G1 X116.184 Y140.583
G1 X115.269 Y139.667 E.03977
G1 X114.736 Y139.667
G1 X115.651 Y140.583 E.03977
G1 X115.118 Y140.583
G1 X114.202 Y139.667 E.03977
G1 X113.669 Y139.667
G1 X114.584 Y140.583 E.03977
G1 X114.051 Y140.583
G1 X113.136 Y139.667 E.03977
G1 X112.603 Y139.667
G1 X113.518 Y140.583 E.03977
G1 X112.985 Y140.583
G1 X112.069 Y139.667 E.03977
G1 X111.536 Y139.667
G1 X112.451 Y140.583 E.03977
G1 X111.918 Y140.583
G1 X111.003 Y139.667 E.03977
G1 X110.469 Y139.667
G1 X111.385 Y140.583 E.03977
G1 X110.851 Y140.583
G1 X109.936 Y139.667 E.03977
G1 X109.403 Y139.667
G1 X110.318 Y140.583 E.03977
G1 X109.785 Y140.583
G1 X108.87 Y139.667 E.03977
G1 X108.336 Y139.667
G1 X109.252 Y140.583 E.03977
G1 X108.718 Y140.583
G1 X107.803 Y139.667 E.03977
G1 X107.27 Y139.667
G1 X108.185 Y140.583 E.03977
G1 X107.652 Y140.583
G1 X106.737 Y139.667 E.03977
G1 X106.203 Y139.667
G1 X107.119 Y140.583 E.03977
G1 X106.585 Y140.583
G1 X105.67 Y139.667 E.03977
G1 X105.137 Y139.667
G1 X106.052 Y140.583 E.03977
G1 X105.519 Y140.583
G1 X104.604 Y139.667 E.03977
G1 X104.07 Y139.667
G1 X104.986 Y140.583 E.03977
G1 X104.452 Y140.583
G1 X103.537 Y139.667 E.03977
G1 X103.004 Y139.667
G1 X103.919 Y140.583 E.03977
G1 X103.386 Y140.583
G1 X102.471 Y139.667 E.03977
G1 X102.853 Y140.583
G1 X101.417 Y139.147 E.06237
G1 X101.417 Y139.681
G1 X102.319 Y140.583 E.0392
G1 X101.786 Y140.583
G1 X101.417 Y140.214 E.01602
; WIPE_START
M204 S6000
G1 X101.786 Y140.583 E-.19815
G1 X102.319 Y140.583 E-.20264
G1 X101.651 Y139.914 E-.35921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.113 Y134.583 Z11 F42000
G1 X125.662 Y116.476 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164984
G1 F15000
M204 S6000
G1 X125.711 Y116.338 E.00146
G1 X125.663 Y116.289 E.00068
G1 X125.524 Y116.338 E.00146
; WIPE_START
G1 X125.663 Y116.289 E-.30838
G1 X125.711 Y116.338 E-.14323
G1 X125.662 Y116.476 E-.30838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.262 Y121.869 Z11 F42000
G1 X102.417 Y139.69 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.122564
G1 F15000
M204 S6000
G1 X102.357 Y139.682 E.00039
; LINE_WIDTH: 0.160227
G1 X102.289 Y139.663 E.00067
G1 X102.338 Y139.525 E.0014
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X102.289 Y139.663 E-.51379
G1 X102.357 Y139.682 E-.24621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
; stop printing object, unique label id: 88
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

